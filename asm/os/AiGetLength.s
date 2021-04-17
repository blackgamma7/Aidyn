.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osAiGetLength
/* BED20 800BE120 3C02A450 */  lui        $v0, 0xa450
/* BED24 800BE124 34420004 */  ori        $v0, $v0, 4
/* BED28 800BE128 03E00008 */  jr         $ra
/* BED2C 800BE12C 8C420000 */   lw        $v0, ($v0)
