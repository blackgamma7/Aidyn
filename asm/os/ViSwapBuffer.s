.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViSwapBuffer
/* D3160 800D2560 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D3164 800D2564 AFB00010 */  sw         $s0, 0x10($sp)
/* D3168 800D2568 AFBF0014 */  sw         $ra, 0x14($sp)
/* D316C 800D256C 0C030D90 */  jal        __osDisableInt
/* D3170 800D2570 00808021 */   addu      $s0, $a0, $zero
/* D3174 800D2574 3C04800F */  lui        $a0, %hi(__osViNext)
/* D3178 800D2578 8C843D44 */  lw         $a0, %lo(__osViNext)($a0)
/* D317C 800D257C 94830000 */  lhu        $v1, ($a0)
/* D3180 800D2580 AC900004 */  sw         $s0, 4($a0)
/* D3184 800D2584 34630010 */  ori        $v1, $v1, 0x10
/* D3188 800D2588 A4830000 */  sh         $v1, ($a0)
/* D318C 800D258C 0C030DAC */  jal        __osRestoreInt
/* D3190 800D2590 00402021 */   addu      $a0, $v0, $zero
/* D3194 800D2594 8FBF0014 */  lw         $ra, 0x14($sp)
/* D3198 800D2598 8FB00010 */  lw         $s0, 0x10($sp)
/* D319C 800D259C 03E00008 */  jr         $ra
/* D31A0 800D25A0 27BD0018 */   addiu     $sp, $sp, 0x18
/* D31A4 800D25A4 00000000 */  nop
/* D31A8 800D25A8 00000000 */  nop
/* D31AC 800D25AC 00000000 */  nop
