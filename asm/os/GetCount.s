.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetCount
/* C3D00 800C3100 40024800 */  mfc0       $v0, $9
/* C3D04 800C3104 03E00008 */  jr         $ra
/* C3D08 800C3108 00000000 */   nop
/* C3D0C 800C310C 00000000 */  nop
