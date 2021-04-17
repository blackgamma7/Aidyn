.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _sqrtf
/* CDED0 800CD2D0 03E00008 */  jr         $ra
/* CDED4 800CD2D4 46006004 */   sqrt.s    $f0, $f12
/* CDED8 800CD2D8 00000000 */  nop
/* CDEDC 800CD2DC 00000000 */  nop
