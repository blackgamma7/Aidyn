# Plan: Linux Native Support for Aidyn Chronicles

## Overview

Aidyn Chronicles is an N64 RPG decompilation project containing ~254 pseudocode C++ source files that are tightly coupled to libultra (the N64 OS/SDK). To run natively on Linux, we need to replace all N64 hardware interfaces with modern Linux equivalents while preserving game logic.

The recommended approach is a **Libultraship-style compatibility layer** — creating a shim library that reimplements libultra APIs on top of SDL2/OpenGL, allowing the game code to compile and run with minimal modifications.

---

## Phase 1: Project Infrastructure

### 1.1 Create a CMake-based build system for Linux
- Add a `CMakeLists.txt` at the project root targeting x86_64 Linux
- Compile all `src_pseudo/*.cpp` files as native C++ (not MIPS cross-compiled)
- Remove N64-specific compiler flags (`-mcpu=vr4300`, `-mips2`, `-G0`, etc.)
- Add SDL2, OpenGL, and OpenAL as dependencies

### 1.2 Set up a `platform/` directory structure
```
platform/
  linux/
    main.cpp              # Native entry point (replaces bootproc/seed.cpp)
    platform_graphics.cpp # SDL2/OpenGL rendering backend
    platform_audio.cpp    # OpenAL/SDL_mixer audio backend
    platform_input.cpp    # SDL2 input handling
    platform_filesystem.cpp # Asset loading from disk (replaces ROM DMA)
  ultra_shim/
    os.h                  # Reimplements libultra OS types and functions
    sched.h               # Scheduler shim (maps to std::thread or pthreads)
    gfx.h                 # Gfx display list types (translated to OpenGL)
    audio.h               # Audio interface shim
    controller.h          # Controller shim (maps to SDL2 gamepad)
```

---

## Phase 2: Libultra Compatibility Shim (`ultra_shim/`)

This is the core of the port. Every libultra function used in the game code needs a Linux implementation.

### 2.1 OS Kernel / Threading
Replace N64 cooperative threading with pthreads:
- `osInitialize()` → no-op or SDL_Init()
- `osCreateThread()` → `pthread_create()`
- `osStartThread()` → thread signaling
- `osSetThreadPri()` → `pthread_setschedparam()` or priority queue
- `osCreateMesgQueue()`, `osSendMesg()`, `osRecvMesg()` → mutex + condition variable message queues
- `osUnmapTLBAll()` → no-op

### 2.2 Scheduler
Replace `OSSched` / `osCreateScheduler()`:
- Implement a frame-rate-driven scheduler using SDL2's timer
- `OSScClient` → callback registration for frame events
- Map `OS_SC_DONE_MSG` and related task messages to completion events
- Target 60fps NTSC timing (or 50fps PAL)

### 2.3 Graphics (RDP/RSP → OpenGL)
This is the largest subsystem to replace:
- **Display lists (`Gfx`)**: Parse N64 display list commands and translate to OpenGL calls
  - `gSPVertex`, `gSP2Triangles`, `gSPMatrix` → OpenGL vertex buffers + matrix stack
  - `gDPSetCombineMode`, `gDPSetRenderMode` → shader programs / blend state
  - `gDPLoadTextureBlock` → OpenGL texture uploads
  - `gDPFillRectangle`, `gDPSetFillColor` → immediate-mode quads
- **F3DEX2 microcode emulation**: Implement the subset of F3DEX2 commands the game uses
- **Framebuffer management**: Replace N64 framebuffers with an SDL2 window + OpenGL FBO
- **Video modes**: Map `osViMode` / `osViSetMode()` to SDL2 window configuration (320x240 → scaled)
- The `Graphics::DrawText()`, `DrawRectangle()`, `DisplaySystemMonitor()` functions should mostly work once the `Gfx` command layer is handled

### 2.4 Audio (N64 Audio → OpenAL/SDL_mixer)
- Replace `DCM::StartThread()` / `DCM::Init()` with an OpenAL or SDL_mixer backend
- Implement N64 audio DMA → file-based sample loading
- The game uses MusyX-style audio (`n_audio`, `SUPPORT_NAUDIO`); need to decode the audio bank format
- Implement SFX and music playback from the extracted Borg audio assets

### 2.5 Controller Input
- `osContInit()` → `SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER)`
- `Controller::Init()` → SDL2 gamepad/keyboard mapping
- Map N64 controller buttons to keyboard/gamepad equivalents
- `OSPfs` (Controller Pak) → save files on disk

### 2.6 ROM / Asset Loading
- `osPiStartDma()` (ROM reads) → `fread()` from extracted asset files
- `RomCopy::Init()` → initialize filesystem-based asset loader
- Extract all assets from the ROM into a directory structure (the Borg format files)
- `SetBorgListing()` → load asset index from disk
- The Borg compression (`LZ01x.cpp`) should work as-is once DMA is replaced with file I/O

### 2.7 Memory Management
- `MemoryCheck()`, `HeapInit()`, `HALLOC()` → wrap `malloc()`/`free()` or use a custom allocator
- Remove Expansion Pak detection (unlimited RAM on PC)
- `ALLOCS` macro → allocate from system heap

---

## Phase 3: Game Code Adaptation

### 3.1 Fixup source files
- Convert `src_pseudo/` from pseudocode to compilable C++
  - Many files use Ghidra-style decompilation artifacts that need manual cleanup
  - Fix C++ class method implementations (Ghidra outputs C-style code)
  - Replace N64 type aliases (`u8`, `u16`, `s32`, `u64`, etc.) with `<cstdint>` types or provide a typedef header
- Remove or `#ifdef` out N64-specific code paths
- Add `#ifdef TARGET_LINUX` / `#ifdef TARGET_N64` guards where needed

### 3.2 Math / utility code
- `mathN64.h` → use standard math or GLM for matrix/vector ops
- `guRotateRPY`, `guScale`, `guTranslateF` → GLM equivalents or simple reimplementations
- `RAND.SetSeed(TIME_USEC)` → `srand(time(NULL))` or `<random>`

### 3.3 Crash handler
- `Crash::InitProc()` → Linux signal handler (`SIGSEGV`, `SIGABRT`)
- `N64print` / `Gsprintf` → `printf` / `snprintf`

---

## Phase 4: Asset Pipeline

### 4.1 ROM asset extraction tool
- Write a Python or C tool that uses the splat YAML configs to extract all assets from the ROM
- Output: directory of raw asset files (textures, models, audio, maps, strings)

### 4.2 Borg format support
- The game's custom Borg archive format needs a reader that works with file I/O instead of ROM DMA
- `BorgMaps.cpp`, `BorgMapLists.cpp` → adapt to load from disk
- LZ01x decompression should work unchanged

### 4.3 Texture conversion
- N64 texture formats (RGBA16, CI4, CI8, IA8, etc.) → convert to standard formats at load time
- Or convert offline to PNG/DDS and load with stb_image

---

## Phase 5: Build, Test, Iterate

### 5.1 Incremental compilation
- Start with `seed.cpp` + `app.cpp` + `gfx.cpp` compiling (the boot sequence)
- Stub out unimplemented subsystems and bring them online one at a time
- Priority order: boot → graphics → input → game logic → audio → save/load

### 5.2 Testing milestones
1. **Window opens, black screen** — SDL2 + OpenGL context working
2. **Title screen renders** — display list translation working
3. **Menu navigation** — input working
4. **Game world loads** — asset pipeline + Borg loading working
5. **Audio plays** — audio subsystem working
6. **Full gameplay** — all systems integrated

---

## Dependencies

| Library | Purpose |
|---------|---------|
| SDL2 | Window, input, timing |
| OpenGL 3.3+ | Graphics rendering |
| GLM | Math (matrix/vector ops) |
| OpenAL-soft or SDL_mixer | Audio playback |
| stb_image | Texture loading (optional) |
| CMake | Build system |

---

## Estimated Complexity by Component

| Component | Files affected | Difficulty |
|-----------|---------------|------------|
| Build system | New CMakeLists.txt | Low |
| OS/Threading shim | ~10 new files | Medium |
| Graphics/Display lists | ~5-10 new files, most game code | **High** |
| Audio | ~3-5 new files | Medium-High |
| Input | ~2 new files | Low |
| Asset loading/ROM | ~5 new files | Medium |
| Game code cleanup | All 254 src_pseudo files | Medium-High |

The graphics display list translation is by far the largest single piece of work, as it requires understanding the full F3DEX2 microcode command set used by the game and translating it to modern OpenGL.

---

## Alternative: N64Recomp (Faster Path)

If the goal is "just get it running" rather than a clean native port, **N64Recomp** (static recompilation) would be significantly faster — it takes the compiled ROM assembly and generates native code directly, bypassing the need to fix all pseudocode. However, it produces less maintainable/moddable output. The plan above assumes the goal is a proper source-level native port.
