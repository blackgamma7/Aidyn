.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel rmonGetActiveQueue
/* CA0F0 800C94F0 3C02800F */  lui        $v0, %hi(__osActiveQueue)
/* CA0F4 800C94F4 03E00008 */  jr         $ra
/* CA0F8 800C94F8 8C423CBC */   lw        $v0, %lo(__osActiveQueue)($v0)
/* CA0FC 800C94FC 00000000 */  nop
