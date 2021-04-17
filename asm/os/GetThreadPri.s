.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetThreadPri
/* C90E0 800C84E0 14800003 */  bnez       $a0, .L800C84F0
/* C90E4 800C84E4 00000000 */   nop
/* C90E8 800C84E8 3C04800F */  lui        $a0, %hi(__osRunningThread)
/* C90EC 800C84EC 8C843CC0 */  lw         $a0, %lo(__osRunningThread)($a0)
.L800C84F0:
/* C90F0 800C84F0 03E00008 */  jr         $ra
/* C90F4 800C84F4 8C820004 */   lw        $v0, 4($a0)
/* C90F8 800C84F8 00000000 */  nop
/* C90FC 800C84FC 00000000 */  nop
