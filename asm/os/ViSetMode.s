.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViSetMode
/* D2FA0 800D23A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2FA4 800D23A4 AFB00010 */  sw         $s0, 0x10($sp)
/* D2FA8 800D23A8 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2FAC 800D23AC 0C030D90 */  jal        __osDisableInt
/* D2FB0 800D23B0 00808021 */   addu      $s0, $a0, $zero
/* D2FB4 800D23B4 3C04800F */  lui        $a0, %hi(__osViNext)
/* D2FB8 800D23B8 8C843D44 */  lw         $a0, %lo(__osViNext)($a0)
/* D2FBC 800D23BC AC900008 */  sw         $s0, 8($a0)
/* D2FC0 800D23C0 8C850008 */  lw         $a1, 8($a0)
/* D2FC4 800D23C4 24030001 */  addiu      $v1, $zero, 1
/* D2FC8 800D23C8 A4830000 */  sh         $v1, ($a0)
/* D2FCC 800D23CC 8CA30004 */  lw         $v1, 4($a1)
/* D2FD0 800D23D0 AC83000C */  sw         $v1, 0xc($a0)
/* D2FD4 800D23D4 0C030DAC */  jal        __osRestoreInt
/* D2FD8 800D23D8 00402021 */   addu      $a0, $v0, $zero
/* D2FDC 800D23DC 8FBF0014 */  lw         $ra, 0x14($sp)
/* D2FE0 800D23E0 8FB00010 */  lw         $s0, 0x10($sp)
/* D2FE4 800D23E4 03E00008 */  jr         $ra
/* D2FE8 800D23E8 27BD0018 */   addiu     $sp, $sp, 0x18
/* D2FEC 800D23EC 00000000 */  nop
