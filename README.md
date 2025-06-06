# Aidyn Chronicles Decompilation
 Decompilation of Aidyn Chronicles: the First Mage on the Nintendo 64.

## Why this game?
Aidyn Chronicles is one of a handful of RPG's on the system and a relatively obscure title. As such it's inner workings fascinated me. It led to the discoveries of the workings of the system, such as cheat codes, turning enemies passive on the field, and randomized battle encounters. since then, my interest grew to fully understanding the game.

## What this contains:
- Splat yaml's for Debug and another one for NTSC 1.0.
- symbol tables for both.
- src_pseudo/ : pseudocode of the source files based lagely on the debug build interpreted by ghidra and cleaned up by hand (apart from OS files - they're largely unchanged, AFAIK)
- include/ : header files, with one of a dump of Ghidra definitions (ghidradump.h)


## why no usable code?
- While the compiler used has been identified, it has not yet been configured for cross-platform use, with the current compiler only being a close aproximation
- Ghidra... "does its best" to interpret code. As such there are quirks with branching and incrementation and whatnot that may lead to further inaccuracies.
- The game uses c++, Ghidra (and mips_to_c) use C intrepetation. While it does give better insight into how the former language translates into the latter, it is also another degree of reinterpretaion.
  - There has also yet to be another successful decomp of an N64 title written in C++, and I have not yet the required knowledge to set up

## Porting?
I have been exploring the possibilities of porting the game once the code is fully understood. Here are my current thoughts on the options:
### Libultraship
A compatability solution that is already been used by a few decompiled titles. 
- Pros:
  - Performance potentially optimized for native platform
  - Debug and modding features potentially to implement
  - Proven porting potential to several PC AND console platforms.
- Cons:
  - "potential": meaning code would first need to be matching, or at the very least, compilable.
  - Controller Pak and osSched support not yet implemented.
### N64Recomp
A "static recompilation" of the game's assembely code, with the potential of raytracing and other enhancments.
- Pros:
  - game's code does not require decompilation.
  - potential for raytracing and some other enhancements
- Cons:
  - generated code is not as human-readable, optimized or modifiable as true decompilation.
  - Controller Pak support not yet implemented.
### Existing Game Engine
Port the game to an existing engine such as Unity or Godot and take advantage of modern conviences it provides.
- Pros:
  - Can be re-written beyond limitations of original platform.
- Cons:
  - has to be re-written from ground up.
  - Accuracy would be a concern.

## Thanks
- halibabica for his work in hacking/modding Aidyn.
- @TiberGuy for further hacking tools and knowledge with [AidynEditor](https://github.com/TiberGuy/AidynEditor)
- Zoinkity for in-depth analysis of the game's art assets and compression methods.
- Wiseguy for setup and analysis on a possible compiler match,and setup for data used in a later recomp project.
