/*
 * audio_backend.cpp – SDL2/SDL_mixer audio backend.
 *
 * The game uses the N64 libultra audio library (ALSynth, ALPlayer, DCM).
 * On Linux:
 *   - ALSynth / ALPlayer / ALHeap stubs live in os_impl.cpp
 *   - Actual sample playback goes through SDL_mixer
 *   - DCM (the game's custom sequencer) calls AddVoice/StopVoice etc.
 *     which are intercepted here
 *
 * Borg11 assets are 44.1 kHz mono PCM (8-bit or 16-bit big-endian).
 * We convert them to SDL_mixer Chunks on the fly.
 *
 * Build dependency: SDL2, SDL2_mixer
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <SDL2/SDL.h>
#include <SDL2/SDL_mixer.h>

#include "../../ultra/include/2.0I/ultra64.h"

/* =========================================================================
 * Borg11 data layout (from include/borg/borg11.h which we approximate here)
 * ========================================================================= */
struct Borg11Header;  /* forward – defined in game headers */

/* =========================================================================
 * Backend state
 * ========================================================================= */
namespace AudioBackend {

static constexpr int  SAMPLE_RATE   = 44100;
static constexpr int  AUDIO_CHANNELS = 2;   /* stereo output */
static constexpr int  CHUNK_SIZE    = 1024;
static constexpr int  AUDIO_MIX_CHANNELS  = 32;   /* simultaneous voices */

static bool sInitialised = false;

/* =========================================================================
 * Init / Shutdown
 * ========================================================================= */
bool Init(int freq) {
    if (SDL_InitSubSystem(SDL_INIT_AUDIO) != 0) {
        fprintf(stderr, "[audio] SDL_InitSubSystem(AUDIO) failed: %s\n", SDL_GetError());
        return false;
    }

    if (Mix_OpenAudio(freq ? freq : SAMPLE_RATE, AUDIO_S16SYS, AUDIO_CHANNELS, CHUNK_SIZE) < 0) {
        fprintf(stderr, "[audio] Mix_OpenAudio failed: %s\n", Mix_GetError());
        return false;
    }

    Mix_AllocateChannels(AUDIO_MIX_CHANNELS);
    sInitialised = true;
    fprintf(stderr, "[audio] SDL_mixer ready (%d Hz, %d channels)\n", freq, AUDIO_MIX_CHANNELS);
    return true;
}

void Shutdown() {
    if (sInitialised) {
        Mix_CloseAudio();
        SDL_QuitSubSystem(SDL_INIT_AUDIO);
        sInitialised = false;
    }
}

/* =========================================================================
 * Voice table – maps game voice index → SDL_mixer channel + Mix_Chunk
 * ========================================================================= */
struct Voice {
    Mix_Chunk *chunk;
    int        channel;  /* SDL_mixer channel, -1 = free */
    bool       active;
};

static Voice sVoices[32] = {};

/* Build a Mix_Chunk from raw PCM data in Borg11 format.
 *
 * Borg11 samples can be:
 *   AL_RAW8_WAVE  (type 2): 8-bit unsigned PCM, big-endian (same as little-endian for 8b)
 *   AL_RAW16_WAVE (type 1): 16-bit signed big-endian PCM
 *
 * SDL_mixer expects 16-bit signed little-endian (AUDIO_S16LSB).
 */
static Mix_Chunk *make_chunk(const u8 *pcm, u32 nsamples, u8 waveType, u8 vol, u8 pan) {
    u32 byteLen = nsamples * (waveType == AL_RAW16_WAVE ? 2 : 1);

    /* Allocate SDL_mixer chunk buffer (SDL will free it) */
    u8 *buf = (u8 *)SDL_malloc(nsamples * 2); /* always output S16LE */
    if (!buf) return nullptr;

    if (waveType == AL_RAW16_WAVE) {
        /* Swap bytes: big-endian → little-endian */
        s16 *out = (s16 *)buf;
        for (u32 i = 0; i < nsamples; i++) {
            u8 hi = pcm[i*2+0], lo = pcm[i*2+1];
            out[i] = (s16)((hi << 8) | lo);
        }
    } else {
        /* 8-bit unsigned → 16-bit signed */
        s16 *out = (s16 *)buf;
        for (u32 i = 0; i < nsamples; i++) {
            out[i] = (s16)((int)pcm[i] - 128) * 256;
        }
    }

    Mix_Chunk *ch = (Mix_Chunk *)SDL_malloc(sizeof(Mix_Chunk));
    if (!ch) { SDL_free(buf); return nullptr; }
    ch->allocated = 1;
    ch->abuf      = buf;
    ch->alen      = nsamples * 2;
    ch->volume    = vol;
    return ch;
}

/* =========================================================================
 * Voice management – called from DCM:: / Audio:: namespace in game code.
 * ========================================================================= */
int AllocVoice(u8 *oIndex, u32 *oID,
               const u8 *pcmData, u8 waveType,
               u32 nsamples, u32 loopEnd, u8 loops,
               u16 pitch, u8 vol, u8 pan) {
    if (!sInitialised) return -1;

    /* Find free slot */
    int slot = -1;
    for (int i = 0; i < 32; i++) {
        if (!sVoices[i].active) { slot = i; break; }
    }
    if (slot < 0) return -1;

    Mix_Chunk *chunk = make_chunk(pcmData, nsamples, waveType, vol, pan);
    if (!chunk) return -1;

    sVoices[slot].chunk  = chunk;
    sVoices[slot].active = true;
    /* Play – loops=-1 means infinite, 0=once, n=n+1 times */
    int sdl_loops = (loops == 0) ? 0 : ((loops == 0xFF) ? -1 : loops - 1);
    sVoices[slot].channel = Mix_PlayChannel(-1, chunk, sdl_loops);

    /* Apply stereo pan */
    if (sVoices[slot].channel >= 0) {
        u8 left  = (pan < 128) ? 255 : (u8)(255 - (pan - 128) * 2);
        u8 right = (pan > 128) ? 255 : (u8)(pan * 2);
        Mix_SetPanning(sVoices[slot].channel, left, right);
    }

    if (oIndex) *oIndex = (u8)slot;
    if (oID)    *oID    = (u32)slot; /* id == slot for simplicity */
    return slot;
}

bool StopVoice(u8 voiceIdx, u32 id) {
    (void)id;
    if (voiceIdx >= 32 || !sVoices[voiceIdx].active) return false;
    if (sVoices[voiceIdx].channel >= 0)
        Mix_HaltChannel(sVoices[voiceIdx].channel);
    Mix_FreeChunk(sVoices[voiceIdx].chunk);
    sVoices[voiceIdx] = {};
    return true;
}

bool SetVoiceVol(u8 idx, u32 id, u8 vol) {
    (void)id;
    if (idx >= 32 || !sVoices[idx].active) return false;
    if (sVoices[idx].chunk) sVoices[idx].chunk->volume = vol;
    return true;
}

bool SetVoicePan(u8 idx, u32 id, u8 pan) {
    (void)id;
    if (idx >= 32 || !sVoices[idx].active) return false;
    if (sVoices[idx].channel >= 0) {
        u8 left  = (pan < 128) ? 255 : (u8)(255 - (pan - 128) * 2);
        u8 right = (pan > 128) ? 255 : (u8)(pan * 2);
        Mix_SetPanning(sVoices[idx].channel, left, right);
    }
    return true;
}

bool IsVoiceActive(u8 idx) {
    if (idx >= 32) return false;
    if (!sVoices[idx].active) return false;
    if (sVoices[idx].channel >= 0 && !Mix_Playing(sVoices[idx].channel)) {
        /* Voice finished naturally */
        Mix_FreeChunk(sVoices[idx].chunk);
        sVoices[idx] = {};
        return false;
    }
    return sVoices[idx].active;
}

void StopAll() {
    Mix_HaltChannel(-1);
    for (int i = 0; i < 32; i++) {
        if (sVoices[i].chunk) Mix_FreeChunk(sVoices[i].chunk);
        sVoices[i] = {};
    }
}

} /* namespace AudioBackend */
