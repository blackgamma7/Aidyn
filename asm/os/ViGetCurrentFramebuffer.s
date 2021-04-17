.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViGetCurrentFramebuffer
/* D2A50 800D1E50 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2A54 800D1E54 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2A58 800D1E58 0C030D90 */  jal        __osDisableInt
/* D2A5C 800D1E5C AFB00010 */   sw        $s0, 0x10($sp)
/* D2A60 800D1E60 3C03800F */  lui        $v1, %hi(__osViCurr)
/* D2A64 800D1E64 8C633D40 */  lw         $v1, %lo(__osViCurr)($v1)
/* D2A68 800D1E68 8C700004 */  lw         $s0, 4($v1)
/* D2A6C 800D1E6C 0C030DAC */  jal        __osRestoreInt
/* D2A70 800D1E70 00402021 */   addu      $a0, $v0, $zero
/* D2A74 800D1E74 02001021 */  addu       $v0, $s0, $zero
/* D2A78 800D1E78 8FBF0014 */  lw         $ra, 0x14($sp)
/* D2A7C 800D1E7C 8FB00010 */  lw         $s0, 0x10($sp)
/* D2A80 800D1E80 03E00008 */  jr         $ra
/* D2A84 800D1E84 27BD0018 */   addiu     $sp, $sp, 0x18
/* D2A88 800D1E88 00000000 */  nop
/* D2A8C 800D1E8C 00000000 */  nop
