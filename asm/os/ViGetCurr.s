.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetViCurr
/* D2E10 800D2210 3C02800F */  lui        $v0, %hi(__osViCurr)
/* D2E14 800D2214 03E00008 */  jr         $ra
/* D2E18 800D2218 8C423D40 */   lw        $v0, %lo(__osViCurr)($v0)
/* D2E1C 800D221C 00000000 */  nop
