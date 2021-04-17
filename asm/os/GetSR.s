.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osGetSR_
/* CD3C0 800CC7C0 40846000 */  mtc0       $a0, $12
/* CD3C4 800CC7C4 00000000 */  nop
/* CD3C8 800CC7C8 03E00008 */  jr         $ra
/* CD3CC 800CC7CC 00000000 */   nop
