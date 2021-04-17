.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel load_db_array_size
/* 75830 80074C30 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 75834 80074C34 3C02800E */  lui        $v0, %hi(D_800DFE10)
/* 75838 80074C38 2442FE10 */  addiu      $v0, $v0, %lo(D_800DFE10)
/* 7583C 80074C3C 24030024 */  addiu      $v1, $zero, 0x24
/* 75840 80074C40 AFB1005C */  sw         $s1, 0x5c($sp)
/* 75844 80074C44 00C08821 */  addu       $s1, $a2, $zero
/* 75848 80074C48 AFB20060 */  sw         $s2, 0x60($sp)
/* 7584C 80074C4C 00A09021 */  addu       $s2, $a1, $zero
/* 75850 80074C50 24060004 */  addiu      $a2, $zero, 4
/* 75854 80074C54 AFBF0064 */  sw         $ra, 0x64($sp)
/* 75858 80074C58 AFB00058 */  sw         $s0, 0x58($sp)
/* 7585C 80074C5C AFA20010 */  sw         $v0, 0x10($sp)
/* 75860 80074C60 AFA30014 */  sw         $v1, 0x14($sp)
/* 75864 80074C64 8E300000 */  lw         $s0, ($s1)
/* 75868 80074C68 24070001 */  addiu      $a3, $zero, 1
/* 7586C 80074C6C 00902821 */  addu       $a1, $a0, $s0
/* 75870 80074C70 0C027269 */  jal        RomCopy
/* 75874 80074C74 27A40018 */   addiu     $a0, $sp, 0x18
/* 75878 80074C78 93A30018 */  lbu        $v1, 0x18($sp)
/* 7587C 80074C7C 8FBF0064 */  lw         $ra, 0x64($sp)
/* 75880 80074C80 A2430000 */  sb         $v1, ($s2)
/* 75884 80074C84 8FB20060 */  lw         $s2, 0x60($sp)
/* 75888 80074C88 26100004 */  addiu      $s0, $s0, 4
/* 7588C 80074C8C AE300000 */  sw         $s0, ($s1)
/* 75890 80074C90 8FB1005C */  lw         $s1, 0x5c($sp)
/* 75894 80074C94 8FB00058 */  lw         $s0, 0x58($sp)
/* 75898 80074C98 03E00008 */  jr         $ra
/* 7589C 80074C9C 27BD0068 */   addiu     $sp, $sp, 0x68
