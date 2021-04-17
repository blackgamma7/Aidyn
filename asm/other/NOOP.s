.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel NOOP_800be0f0
/* BECF0 800BE0F0 03E00008 */  jr         $ra
/* BECF4 800BE0F4 00000000 */   nop
/* BECF8 800BE0F8 00000000 */  nop
/* BECFC 800BE0FC 00000000 */  nop
