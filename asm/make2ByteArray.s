.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_2byte_array
/* 85150 80084550 A0850000 */  sb         $a1, ($a0)
/* 85154 80084554 03E00008 */  jr         $ra
/* 85158 80084558 A0860001 */   sb        $a2, 1($a0)
/* 8515C 8008455C 00000000 */  nop
