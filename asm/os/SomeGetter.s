.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetNotactiveQueue
/* C3BC0 800C2FC0 3C02800F */  lui        $v0, %hi(__osRunningThread2)
/* C3BC4 800C2FC4 03E00008 */  jr         $ra
/* C3BC8 800C2FC8 8C423CC4 */   lw        $v0, %lo(__osRunningThread2)($v0)
/* C3BCC 800C2FCC 00000000 */  nop
