# Aidyn Chronicles Decompilation
 Decompilation of Aidyn Chronicles: the First Mage on the Nintendo 64.

## Why this game?
Aidyn Chronicles is one of a handful of RPG's on the system and a relatively obscure title. As such it's inner workings fascinated me. It led to the discoveries of the workings of the system, such as cheat codes, turning enemies passive on the field, and randomized battle encounters. since then, my interest grew to fully understanding the game.

## What this contains:
- Splat yaml's. One for NTSC v1.0 and one for the recently-uncovered debug version.
- symbol tables for both.
- src_pseudo/ : pseudocode of the source files interpreted by ghidra and cleaned up by hand (apart from OS files - they're largely unchanged, AFAIK)
- include/ : typical pseudocode header files, with one of a dump of Ghidra definitions (ghidradump.h)


## why no usable code?
- I do not know which compiler the developers used, so cannot accurately replicate code based on it.
- Ghidra... "does its best" to interpret code. As such there are quirks with branching and incrementation and whatnot that may lead to further inaccuracies.

## Thanks
- halibabica for his work in hacking/modding Aidyn.
- @TiberGuy for further hacking tools and knowledge with [AidynEditor](https://github.com/TiberGuy/AidynEditor)
- Zoinkity for in-depth analysis of the game's art assets and compression methods.
