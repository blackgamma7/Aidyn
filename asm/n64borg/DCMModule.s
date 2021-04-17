.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel borg12_func_a
/* A79E0 800A6DE0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* A79E4 800A6DE4 AFB3001C */  sw         $s3, 0x1c($sp)
/* A79E8 800A6DE8 00809821 */  addu       $s3, $a0, $zero
/* A79EC 800A6DEC AFBF0020 */  sw         $ra, 0x20($sp)
/* A79F0 800A6DF0 AFB20018 */  sw         $s2, 0x18($sp)
/* A79F4 800A6DF4 AFB10014 */  sw         $s1, 0x14($sp)
/* A79F8 800A6DF8 AFB00010 */  sw         $s0, 0x10($sp)
/* A79FC 800A6DFC 8E630000 */  lw         $v1, ($s3)
/* A7A00 800A6E00 26720008 */  addiu      $s2, $s3, 8
/* A7A04 800A6E04 00731821 */  addu       $v1, $v1, $s3
/* A7A08 800A6E08 AE630000 */  sw         $v1, ($s3)
/* A7A0C 800A6E0C 8E430010 */  lw         $v1, 0x10($s2)
/* A7A10 800A6E10 00008821 */  addu       $s1, $zero, $zero
/* A7A14 800A6E14 00731821 */  addu       $v1, $v1, $s3
/* A7A18 800A6E18 AE430010 */  sw         $v1, 0x10($s2)
/* A7A1C 800A6E1C 8E430014 */  lw         $v1, 0x14($s2)
/* A7A20 800A6E20 8E420004 */  lw         $v0, 4($s2)
/* A7A24 800A6E24 00731821 */  addu       $v1, $v1, $s3
/* A7A28 800A6E28 10400012 */  beqz       $v0, .L800A6E74
/* A7A2C 800A6E2C AE430014 */   sw        $v1, 0x14($s2)
.L800A6E30:
/* A7A30 800A6E30 8E620000 */  lw         $v0, ($s3)
/* A7A34 800A6E34 00118080 */  sll        $s0, $s1, 2
/* A7A38 800A6E38 02021021 */  addu       $v0, $s0, $v0
/* A7A3C 800A6E3C 0C029C7E */  jal        func_800A71F8
/* A7A40 800A6E40 8C440000 */   lw        $a0, ($v0)
/* A7A44 800A6E44 00112900 */  sll        $a1, $s1, 4
/* A7A48 800A6E48 8E630000 */  lw         $v1, ($s3)
/* A7A4C 800A6E4C 8C440008 */  lw         $a0, 8($v0)
/* A7A50 800A6E50 02038021 */  addu       $s0, $s0, $v1
/* A7A54 800A6E54 8E430010 */  lw         $v1, 0x10($s2)
/* A7A58 800A6E58 26310001 */  addiu      $s1, $s1, 1
/* A7A5C 800A6E5C AE020000 */  sw         $v0, ($s0)
/* A7A60 800A6E60 8E420004 */  lw         $v0, 4($s2)
/* A7A64 800A6E64 00A32821 */  addu       $a1, $a1, $v1
/* A7A68 800A6E68 0222102B */  sltu       $v0, $s1, $v0
/* A7A6C 800A6E6C 1440FFF0 */  bnez       $v0, .L800A6E30
/* A7A70 800A6E70 ACA40000 */   sw        $a0, ($a1)
.L800A6E74:
/* A7A74 800A6E74 8FBF0020 */  lw         $ra, 0x20($sp)
/* A7A78 800A6E78 8FB3001C */  lw         $s3, 0x1c($sp)
/* A7A7C 800A6E7C 8FB20018 */  lw         $s2, 0x18($sp)
/* A7A80 800A6E80 8FB10014 */  lw         $s1, 0x14($sp)
/* A7A84 800A6E84 8FB00010 */  lw         $s0, 0x10($sp)
/* A7A88 800A6E88 03E00008 */  jr         $ra
/* A7A8C 800A6E8C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel borg12_func_b
/* A7A90 800A6E90 AC850008 */  sw         $a1, 8($a0)
/* A7A94 800A6E94 03E00008 */  jr         $ra
/* A7A98 800A6E98 00001021 */   addu      $v0, $zero, $zero

glabel n64BorgDCMModule_free
/* A7A9C 800A6E9C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A7AA0 800A6EA0 AFB20018 */  sw         $s2, 0x18($sp)
/* A7AA4 800A6EA4 00809021 */  addu       $s2, $a0, $zero
/* A7AA8 800A6EA8 AFBF002C */  sw         $ra, 0x2c($sp)
/* A7AAC 800A6EAC AFB60028 */  sw         $s6, 0x28($sp)
/* A7AB0 800A6EB0 AFB50024 */  sw         $s5, 0x24($sp)
/* A7AB4 800A6EB4 AFB40020 */  sw         $s4, 0x20($sp)
/* A7AB8 800A6EB8 AFB3001C */  sw         $s3, 0x1c($sp)
/* A7ABC 800A6EBC AFB10014 */  sw         $s1, 0x14($sp)
/* A7AC0 800A6EC0 0C02608C */  jal        get_memUsed
/* A7AC4 800A6EC4 AFB00010 */   sw        $s0, 0x10($sp)
/* A7AC8 800A6EC8 00409821 */  addu       $s3, $v0, $zero
/* A7ACC 800A6ECC 8E440000 */  lw         $a0, ($s2)
/* A7AD0 800A6ED0 2402FFFF */  addiu      $v0, $zero, -1
/* A7AD4 800A6ED4 14820017 */  bne        $a0, $v0, .L800A6F34
/* A7AD8 800A6ED8 00008021 */   addu      $s0, $zero, $zero
/* A7ADC 800A6EDC 3C14800E */  lui        $s4, 0x800e
/* A7AE0 800A6EE0 8E420008 */  lw         $v0, 8($s2)
/* A7AE4 800A6EE4 3C16800F */  lui        $s6, 0x800f
/* A7AE8 800A6EE8 8C51000C */  lw         $s1, 0xc($v0)
/* A7AEC 800A6EEC 1220000B */  beqz       $s1, .L800A6F1C
/* A7AF0 800A6EF0 3C15800F */   lui       $s5, 0x800f
/* A7AF4 800A6EF4 8E430008 */  lw         $v1, 8($s2)
.L800A6EF8:
/* A7AF8 800A6EF8 8C640000 */  lw         $a0, ($v1)
/* A7AFC 800A6EFC 00101080 */  sll        $v0, $s0, 2
/* A7B00 800A6F00 00441021 */  addu       $v0, $v0, $a0
/* A7B04 800A6F04 8C440000 */  lw         $a0, ($v0)
/* A7B08 800A6F08 0C029C89 */  jal        func_800A7224
/* A7B0C 800A6F0C 26100001 */   addiu     $s0, $s0, 1
/* A7B10 800A6F10 0211102B */  sltu       $v0, $s0, $s1
/* A7B14 800A6F14 5440FFF8 */  bnel       $v0, $zero, .L800A6EF8
/* A7B18 800A6F18 8E430008 */   lw        $v1, 8($s2)
.L800A6F1C:
/* A7B1C 800A6F1C 8E440008 */  lw         $a0, 8($s2)
/* A7B20 800A6F20 268533B0 */  addiu      $a1, $s4, 0x33b0
/* A7B24 800A6F24 0C02600C */  jal        Free
/* A7B28 800A6F28 240600A6 */   addiu     $a2, $zero, 0xa6
/* A7B2C 800A6F2C 08029BE4 */  j          .L800A6F90
/* A7B30 800A6F30 02402021 */   addu      $a0, $s2, $zero
.L800A6F34:
/* A7B34 800A6F34 0C028B7A */  jal        get_borg_index_count
/* A7B38 800A6F38 3C14800E */   lui       $s4, 0x800e
/* A7B3C 800A6F3C 3C16800F */  lui        $s6, 0x800f
/* A7B40 800A6F40 24030001 */  addiu      $v1, $zero, 1
/* A7B44 800A6F44 1443000F */  bne        $v0, $v1, .L800A6F84
/* A7B48 800A6F48 3C15800F */   lui       $s5, 0x800f
/* A7B4C 800A6F4C 8E420008 */  lw         $v0, 8($s2)
/* A7B50 800A6F50 8C51000C */  lw         $s1, 0xc($v0)
/* A7B54 800A6F54 1220000B */  beqz       $s1, .L800A6F84
/* A7B58 800A6F58 00008021 */   addu      $s0, $zero, $zero
/* A7B5C 800A6F5C 8E430008 */  lw         $v1, 8($s2)
.L800A6F60:
/* A7B60 800A6F60 8C640000 */  lw         $a0, ($v1)
/* A7B64 800A6F64 00101080 */  sll        $v0, $s0, 2
/* A7B68 800A6F68 00441021 */  addu       $v0, $v0, $a0
/* A7B6C 800A6F6C 8C440000 */  lw         $a0, ($v0)
/* A7B70 800A6F70 0C029C89 */  jal        func_800A7224
/* A7B74 800A6F74 26100001 */   addiu     $s0, $s0, 1
/* A7B78 800A6F78 0211102B */  sltu       $v0, $s0, $s1
/* A7B7C 800A6F7C 5440FFF8 */  bnel       $v0, $zero, .L800A6F60
/* A7B80 800A6F80 8E430008 */   lw        $v1, 8($s2)
.L800A6F84:
/* A7B84 800A6F84 0C028B7F */  jal        dec_borg_count
/* A7B88 800A6F88 8E440000 */   lw        $a0, ($s2)
/* A7B8C 800A6F8C 02402021 */  addu       $a0, $s2, $zero
.L800A6F90:
/* A7B90 800A6F90 268533B0 */  addiu      $a1, $s4, 0x33b0
/* A7B94 800A6F94 0C02600C */  jal        Free
/* A7B98 800A6F98 240600B9 */   addiu     $a2, $zero, 0xb9
/* A7B9C 800A6F9C 0C02608C */  jal        get_memUsed
/* A7BA0 800A6FA0 00000000 */   nop
/* A7BA4 800A6FA4 26C5348C */  addiu      $a1, $s6, 0x348c
/* A7BA8 800A6FA8 02621023 */  subu       $v0, $s3, $v0
/* A7BAC 800A6FAC 26A634C8 */  addiu      $a2, $s5, 0x34c8
/* A7BB0 800A6FB0 8CA30030 */  lw         $v1, 0x30($a1)
/* A7BB4 800A6FB4 8CC40030 */  lw         $a0, 0x30($a2)
/* A7BB8 800A6FB8 8FBF002C */  lw         $ra, 0x2c($sp)
/* A7BBC 800A6FBC 8FB60028 */  lw         $s6, 0x28($sp)
/* A7BC0 800A6FC0 8FB50024 */  lw         $s5, 0x24($sp)
/* A7BC4 800A6FC4 8FB40020 */  lw         $s4, 0x20($sp)
/* A7BC8 800A6FC8 8FB3001C */  lw         $s3, 0x1c($sp)
/* A7BCC 800A6FCC 8FB20018 */  lw         $s2, 0x18($sp)
/* A7BD0 800A6FD0 8FB10014 */  lw         $s1, 0x14($sp)
/* A7BD4 800A6FD4 8FB00010 */  lw         $s0, 0x10($sp)
/* A7BD8 800A6FD8 00621823 */  subu       $v1, $v1, $v0
/* A7BDC 800A6FDC 2484FFFF */  addiu      $a0, $a0, -1
/* A7BE0 800A6FE0 ACA30030 */  sw         $v1, 0x30($a1)
/* A7BE4 800A6FE4 ACC40030 */  sw         $a0, 0x30($a2)
/* A7BE8 800A6FE8 03E00008 */  jr         $ra
/* A7BEC 800A6FEC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel load_borg_12
/* A7BF0 800A6FF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7BF4 800A6FF4 AFB00010 */  sw         $s0, 0x10($sp)
/* A7BF8 800A6FF8 AFBF0014 */  sw         $ra, 0x14($sp)
/* A7BFC 800A6FFC 0C02891C */  jal        clearBorgFlag
/* A7C00 800A7000 00808021 */   addu      $s0, $a0, $zero
/* A7C04 800A7004 0C028A22 */  jal        getBorgItem
/* A7C08 800A7008 02002021 */   addu      $a0, $s0, $zero
/* A7C0C 800A700C 8FBF0014 */  lw         $ra, 0x14($sp)
/* A7C10 800A7010 8FB00010 */  lw         $s0, 0x10($sp)
/* A7C14 800A7014 03E00008 */  jr         $ra
/* A7C18 800A7018 27BD0018 */   addiu     $sp, $sp, 0x18

glabel free_borg_12
/* A7C1C 800A701C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7C20 800A7020 AFBF0010 */  sw         $ra, 0x10($sp)
/* A7C24 800A7024 0C029BA7 */  jal        n64BorgDCMModule_free
/* A7C28 800A7028 00000000 */   nop
/* A7C2C 800A702C 8FBF0010 */  lw         $ra, 0x10($sp)
/* A7C30 800A7030 03E00008 */  jr         $ra
/* A7C34 800A7034 27BD0018 */   addiu     $sp, $sp, 0x18
/* A7C38 800A7038 00000000 */  nop
/* A7C3C 800A703C 00000000 */  nop
