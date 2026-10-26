# Aidyn Chronicles Decompilation
 Decompilation of Aidyn Chronicles: the First Mage on the Nintendo 64.

## Why this game?
Aidyn Chronicles is one of a handful of RPG's on the system and a relatively obscure title. As such it's inner workings fascinated me. It led to the discoveries of the workings of the system, such as cheat codes, turning enemies passive on the field, and randomized battle encounters. since then, my interest grew to fully understanding the game.

## What this contains:
- Splat yaml's for Debug and another one for NTSC 1.0.
- symbol tables for both.
- src_pseudo/ : untested code of the source files based largely on the debug build interpreted by Ghidra and cleaned up by hand (apart from libultra files - they're largely unchanged, AFAIK)
- include/ : header files

## Thanks
- halibabica for his work in hacking/modding Aidyn.
- @TiberGuy for further hacking tools and knowledge with [AidynEditor](https://github.com/TiberGuy/AidynEditor)
- Zoinkity for in-depth analysis of the game's art assets and compression methods.
- Wiseguy for setup and analysis on a possible compiler match,and setup for data used in a later recomp project.
- @example6 for ID'ing many of the image files

## LLM/AI Disclosure
No LLM's or Generative AI were used in the making of this project. This was done as a personal learning exercise.
All mistakes found here are human.
