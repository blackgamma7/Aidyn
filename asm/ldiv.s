.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ldiv
/* D4A20 800D3E20 00A6001A */  div        $zero, $a1, $a2
/* D4A24 800D3E24 14C00002 */  bnez       $a2, .L800D3E30
/* D4A28 800D3E28 00000000 */   nop
/* D4A2C 800D3E2C 0007000D */  break      7
.L800D3E30:
/* D4A30 800D3E30 2401FFFF */   addiu     $at, $zero, -1
/* D4A34 800D3E34 14C10004 */  bne        $a2, $at, .L800D3E48
/* D4A38 800D3E38 3C018000 */   lui       $at, 0x8000
/* D4A3C 800D3E3C 14A10002 */  bne        $a1, $at, .L800D3E48
/* D4A40 800D3E40 00000000 */   nop
/* D4A44 800D3E44 0006000D */  break      6
.L800D3E48:
/* D4A48 800D3E48 00001812 */   mflo      $v1
/* D4A4C 800D3E4C 00000000 */  nop
/* D4A50 800D3E50 00000000 */  nop
/* D4A54 800D3E54 00C30018 */  mult       $a2, $v1
/* D4A58 800D3E58 00001012 */  mflo       $v0
/* D4A5C 800D3E5C 27BDFFF8 */  addiu      $sp, $sp, -8
/* D4A60 800D3E60 00803821 */  addu       $a3, $a0, $zero
/* D4A64 800D3E64 AFA30000 */  sw         $v1, ($sp)
/* D4A68 800D3E68 00A22823 */  subu       $a1, $a1, $v0
/* D4A6C 800D3E6C 04610006 */  bgez       $v1, .L800D3E88
/* D4A70 800D3E70 AFA50004 */   sw        $a1, 4($sp)
/* D4A74 800D3E74 18A00004 */  blez       $a1, .L800D3E88
/* D4A78 800D3E78 24620001 */   addiu     $v0, $v1, 1
/* D4A7C 800D3E7C AFA20000 */  sw         $v0, ($sp)
/* D4A80 800D3E80 00A61023 */  subu       $v0, $a1, $a2
/* D4A84 800D3E84 AFA20004 */  sw         $v0, 4($sp)
.L800D3E88:
/* D4A88 800D3E88 8FA20000 */  lw         $v0, ($sp)
/* D4A8C 800D3E8C 8FA30004 */  lw         $v1, 4($sp)
/* D4A90 800D3E90 ACE20000 */  sw         $v0, ($a3)
/* D4A94 800D3E94 ACE30004 */  sw         $v1, 4($a3)
/* D4A98 800D3E98 00E01021 */  addu       $v0, $a3, $zero
/* D4A9C 800D3E9C 03E00008 */  jr         $ra
/* D4AA0 800D3EA0 27BD0008 */   addiu     $sp, $sp, 8

glabel lldiv
/* D4AA4 800D3EA4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D4AA8 800D3EA8 AFB3002C */  sw         $s3, 0x2c($sp)
/* D4AAC 800D3EAC AFB20028 */  sw         $s2, 0x28($sp)
/* D4AB0 800D3EB0 8FB20048 */  lw         $s2, 0x48($sp)
/* D4AB4 800D3EB4 8FB3004C */  lw         $s3, 0x4c($sp)
/* D4AB8 800D3EB8 AFB40030 */  sw         $s4, 0x30($sp)
/* D4ABC 800D3EBC 0080A021 */  addu       $s4, $a0, $zero
/* D4AC0 800D3EC0 AFB10024 */  sw         $s1, 0x24($sp)
/* D4AC4 800D3EC4 AFB00020 */  sw         $s0, 0x20($sp)
/* D4AC8 800D3EC8 00C08021 */  addu       $s0, $a2, $zero
/* D4ACC 800D3ECC 00E08821 */  addu       $s1, $a3, $zero
/* D4AD0 800D3ED0 02002021 */  addu       $a0, $s0, $zero
/* D4AD4 800D3ED4 02202821 */  addu       $a1, $s1, $zero
/* D4AD8 800D3ED8 AFBF0034 */  sw         $ra, 0x34($sp)
/* D4ADC 800D3EDC 02403021 */  addu       $a2, $s2, $zero
/* D4AE0 800D3EE0 0C034FF8 */  jal        lldiv_sub
/* D4AE4 800D3EE4 02603821 */   addu      $a3, $s3, $zero
/* D4AE8 800D3EE8 00403021 */  addu       $a2, $v0, $zero
/* D4AEC 800D3EEC 00603821 */  addu       $a3, $v1, $zero
/* D4AF0 800D3EF0 02670019 */  multu      $s3, $a3
/* D4AF4 800D3EF4 00001010 */  mfhi       $v0
/* D4AF8 800D3EF8 00001812 */  mflo       $v1
/* D4AFC 800D3EFC 00000000 */  nop
/* D4B00 800D3F00 00000000 */  nop
/* D4B04 800D3F04 02660018 */  mult       $s3, $a2
/* D4B08 800D3F08 00002012 */  mflo       $a0
/* D4B0C 800D3F0C 00000000 */  nop
/* D4B10 800D3F10 00000000 */  nop
/* D4B14 800D3F14 00F20018 */  mult       $a3, $s2
/* D4B18 800D3F18 00002812 */  mflo       $a1
/* D4B1C 800D3F1C AFA60010 */  sw         $a2, 0x10($sp)
/* D4B20 800D3F20 AFA70014 */  sw         $a3, 0x14($sp)
/* D4B24 800D3F24 00441021 */  addu       $v0, $v0, $a0
/* D4B28 800D3F28 8FA40010 */  lw         $a0, 0x10($sp)
/* D4B2C 800D3F2C 00451021 */  addu       $v0, $v0, $a1
/* D4B30 800D3F30 0223282B */  sltu       $a1, $s1, $v1
/* D4B34 800D3F34 02234823 */  subu       $t1, $s1, $v1
/* D4B38 800D3F38 02024023 */  subu       $t0, $s0, $v0
/* D4B3C 800D3F3C 01054023 */  subu       $t0, $t0, $a1
/* D4B40 800D3F40 AFA80018 */  sw         $t0, 0x18($sp)
/* D4B44 800D3F44 04810013 */  bgez       $a0, .L800D3F94
/* D4B48 800D3F48 AFA9001C */   sw        $t1, 0x1c($sp)
/* D4B4C 800D3F4C 8FA20018 */  lw         $v0, 0x18($sp)
/* D4B50 800D3F50 5C400006 */  bgtzl      $v0, .L800D3F6C
/* D4B54 800D3F54 24E30001 */   addiu     $v1, $a3, 1
/* D4B58 800D3F58 1440000E */  bnez       $v0, .L800D3F94
/* D4B5C 800D3F5C 00000000 */   nop
/* D4B60 800D3F60 8FA2001C */  lw         $v0, 0x1c($sp)
/* D4B64 800D3F64 1040000B */  beqz       $v0, .L800D3F94
/* D4B68 800D3F68 24E30001 */   addiu     $v1, $a3, 1
.L800D3F6C:
/* D4B6C 800D3F6C 2C640001 */  sltiu      $a0, $v1, 1
/* D4B70 800D3F70 00C41021 */  addu       $v0, $a2, $a0
/* D4B74 800D3F74 AFA20010 */  sw         $v0, 0x10($sp)
/* D4B78 800D3F78 AFA30014 */  sw         $v1, 0x14($sp)
/* D4B7C 800D3F7C 0133202B */  sltu       $a0, $t1, $s3
/* D4B80 800D3F80 01331823 */  subu       $v1, $t1, $s3
/* D4B84 800D3F84 01121023 */  subu       $v0, $t0, $s2
/* D4B88 800D3F88 00441023 */  subu       $v0, $v0, $a0
/* D4B8C 800D3F8C AFA20018 */  sw         $v0, 0x18($sp)
/* D4B90 800D3F90 AFA3001C */  sw         $v1, 0x1c($sp)
.L800D3F94:
/* D4B94 800D3F94 8FA20010 */  lw         $v0, 0x10($sp)
/* D4B98 800D3F98 8FA30014 */  lw         $v1, 0x14($sp)
/* D4B9C 800D3F9C 8FA40018 */  lw         $a0, 0x18($sp)
/* D4BA0 800D3FA0 8FA5001C */  lw         $a1, 0x1c($sp)
/* D4BA4 800D3FA4 AE820000 */  sw         $v0, ($s4)
/* D4BA8 800D3FA8 AE830004 */  sw         $v1, 4($s4)
/* D4BAC 800D3FAC AE840008 */  sw         $a0, 8($s4)
/* D4BB0 800D3FB0 AE85000C */  sw         $a1, 0xc($s4)
/* D4BB4 800D3FB4 02801021 */  addu       $v0, $s4, $zero
/* D4BB8 800D3FB8 8FBF0034 */  lw         $ra, 0x34($sp)
/* D4BBC 800D3FBC 8FB40030 */  lw         $s4, 0x30($sp)
/* D4BC0 800D3FC0 8FB3002C */  lw         $s3, 0x2c($sp)
/* D4BC4 800D3FC4 8FB20028 */  lw         $s2, 0x28($sp)
/* D4BC8 800D3FC8 8FB10024 */  lw         $s1, 0x24($sp)
/* D4BCC 800D3FCC 8FB00020 */  lw         $s0, 0x20($sp)
/* D4BD0 800D3FD0 03E00008 */  jr         $ra
/* D4BD4 800D3FD4 27BD0038 */   addiu     $sp, $sp, 0x38
/* D4BD8 800D3FD8 00000000 */  nop
/* D4BDC 800D3FDC 00000000 */  nop
