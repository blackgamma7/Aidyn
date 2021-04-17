.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel borg13_func_b
/* A7E40 800A7240 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7E44 800A7244 AFB00010 */  sw         $s0, 0x10($sp)
/* A7E48 800A7248 00808021 */  addu       $s0, $a0, $zero
/* A7E4C 800A724C 00A01821 */  addu       $v1, $a1, $zero
/* A7E50 800A7250 AFBF0014 */  sw         $ra, 0x14($sp)
/* A7E54 800A7254 AE030010 */  sw         $v1, 0x10($s0)
/* A7E58 800A7258 90620013 */  lbu        $v0, 0x13($v1)
/* A7E5C 800A725C 1040000F */  beqz       $v0, .L800A729C
/* A7E60 800A7260 3C05800E */   lui       $a1, %hi(D_800E3420)
/* A7E64 800A7264 24A53420 */  addiu      $a1, $a1, %lo(D_800E3420)
/* A7E68 800A7268 00402021 */  addu       $a0, $v0, $zero
/* A7E6C 800A726C 2406005B */  addiu      $a2, $zero, 0x5b
/* A7E70 800A7270 0C025F9C */  jal        Malloc
/* A7E74 800A7274 00042080 */   sll       $a0, $a0, 2
/* A7E78 800A7278 8E030010 */  lw         $v1, 0x10($s0)
/* A7E7C 800A727C 00402021 */  addu       $a0, $v0, $zero
/* A7E80 800A7280 AE020008 */  sw         $v0, 8($s0)
/* A7E84 800A7284 90660013 */  lbu        $a2, 0x13($v1)
/* A7E88 800A7288 00002821 */  addu       $a1, $zero, $zero
/* A7E8C 800A728C 0C026380 */  jal        Calloc
/* A7E90 800A7290 00063080 */   sll       $a2, $a2, 2
/* A7E94 800A7294 08029CA9 */  j          .L800A72A4
/* A7E98 800A7298 8FBF0014 */   lw        $ra, 0x14($sp)
.L800A729C:
/* A7E9C 800A729C AE000008 */  sw         $zero, 8($s0)
/* A7EA0 800A72A0 8FBF0014 */  lw         $ra, 0x14($sp)
.L800A72A4:
/* A7EA4 800A72A4 8FB00010 */  lw         $s0, 0x10($sp)
/* A7EA8 800A72A8 00001021 */  addu       $v0, $zero, $zero
/* A7EAC 800A72AC 03E00008 */  jr         $ra
/* A7EB0 800A72B0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel borg13_func_a
/* A7EB4 800A72B4 8C820000 */  lw         $v0, ($a0)
/* A7EB8 800A72B8 00441021 */  addu       $v0, $v0, $a0
/* A7EBC 800A72BC AC820000 */  sw         $v0, ($a0)
/* A7EC0 800A72C0 8C820004 */  lw         $v0, 4($a0)
/* A7EC4 800A72C4 00441021 */  addu       $v0, $v0, $a0
/* A7EC8 800A72C8 AC820004 */  sw         $v0, 4($a0)
/* A7ECC 800A72CC 8C820008 */  lw         $v0, 8($a0)
/* A7ED0 800A72D0 00441021 */  addu       $v0, $v0, $a0
/* A7ED4 800A72D4 03E00008 */  jr         $ra
/* A7ED8 800A72D8 AC820008 */   sw        $v0, 8($a0)

glabel borg13_free
/* A7EDC 800A72DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A7EE0 800A72E0 AFB00010 */  sw         $s0, 0x10($sp)
/* A7EE4 800A72E4 00808021 */  addu       $s0, $a0, $zero
/* A7EE8 800A72E8 AFBF001C */  sw         $ra, 0x1c($sp)
/* A7EEC 800A72EC AFB20018 */  sw         $s2, 0x18($sp)
/* A7EF0 800A72F0 0C02608C */  jal        get_memUsed
/* A7EF4 800A72F4 AFB10014 */   sw        $s1, 0x14($sp)
/* A7EF8 800A72F8 00409021 */  addu       $s2, $v0, $zero
/* A7EFC 800A72FC 8E040000 */  lw         $a0, ($s0)
/* A7F00 800A7300 2402FFFF */  addiu      $v0, $zero, -1
/* A7F04 800A7304 14820008 */  bne        $a0, $v0, .L800A7328
/* A7F08 800A7308 3C02800E */   lui       $v0, %hi(D_800E3420)
/* A7F0C 800A730C 8E040010 */  lw         $a0, 0x10($s0)
/* A7F10 800A7310 24453420 */  addiu      $a1, $v0, %lo(D_800E3420)
/* A7F14 800A7314 24060095 */  addiu      $a2, $zero, 0x95
/* A7F18 800A7318 0C02600C */  jal        Free
/* A7F1C 800A731C 00408821 */   addu      $s1, $v0, $zero
/* A7F20 800A7320 08029CCD */  j          .L800A7334
/* A7F24 800A7324 8E020010 */   lw        $v0, 0x10($s0)
.L800A7328:
/* A7F28 800A7328 0C028B7F */  jal        dec_borg_count
/* A7F2C 800A732C 3C11800E */   lui       $s1, %hi(D_800E3420)
/* A7F30 800A7330 8E020010 */  lw         $v0, 0x10($s0)
.L800A7334:
/* A7F34 800A7334 90430013 */  lbu        $v1, 0x13($v0)
/* A7F38 800A7338 10600004 */  beqz       $v1, .L800A734C
/* A7F3C 800A733C 26253420 */   addiu     $a1, $s1, %lo(D_800E3420)
/* A7F40 800A7340 8E040008 */  lw         $a0, 8($s0)
/* A7F44 800A7344 0C02600C */  jal        Free
/* A7F48 800A7348 2406009E */   addiu     $a2, $zero, 0x9e
.L800A734C:
/* A7F4C 800A734C 02002021 */  addu       $a0, $s0, $zero
/* A7F50 800A7350 26253420 */  addiu      $a1, $s1, 0x3420
/* A7F54 800A7354 0C02600C */  jal        Free
/* A7F58 800A7358 240600A1 */   addiu     $a2, $zero, 0xa1
/* A7F5C 800A735C 0C02608C */  jal        get_memUsed
/* A7F60 800A7360 00000000 */   nop
/* A7F64 800A7364 3C06800F */  lui        $a2, %hi(borg_mem)
/* A7F68 800A7368 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A7F6C 800A736C 02421023 */  subu       $v0, $s2, $v0
/* A7F70 800A7370 3C05800F */  lui        $a1, %hi(borg_count)
/* A7F74 800A7374 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A7F78 800A7378 8CC30034 */  lw         $v1, 0x34($a2)
/* A7F7C 800A737C 8CA40034 */  lw         $a0, 0x34($a1)
/* A7F80 800A7380 8FBF001C */  lw         $ra, 0x1c($sp)
/* A7F84 800A7384 8FB20018 */  lw         $s2, 0x18($sp)
/* A7F88 800A7388 8FB10014 */  lw         $s1, 0x14($sp)
/* A7F8C 800A738C 8FB00010 */  lw         $s0, 0x10($sp)
/* A7F90 800A7390 00621823 */  subu       $v1, $v1, $v0
/* A7F94 800A7394 2484FFFF */  addiu      $a0, $a0, -1
/* A7F98 800A7398 ACC30034 */  sw         $v1, 0x34($a2)
/* A7F9C 800A739C ACA40034 */  sw         $a0, 0x34($a1)
/* A7FA0 800A73A0 03E00008 */  jr         $ra
/* A7FA4 800A73A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_borg13
/* A7FA8 800A73A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7FAC 800A73AC AFB00010 */  sw         $s0, 0x10($sp)
/* A7FB0 800A73B0 AFBF0014 */  sw         $ra, 0x14($sp)
/* A7FB4 800A73B4 0C02891C */  jal        clearBorgFlag
/* A7FB8 800A73B8 00808021 */   addu      $s0, $a0, $zero
/* A7FBC 800A73BC 0C028A22 */  jal        getBorgItem
/* A7FC0 800A73C0 02002021 */   addu      $a0, $s0, $zero
/* A7FC4 800A73C4 8FBF0014 */  lw         $ra, 0x14($sp)
/* A7FC8 800A73C8 8FB00010 */  lw         $s0, 0x10($sp)
/* A7FCC 800A73CC 03E00008 */  jr         $ra
/* A7FD0 800A73D0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel passto_borg13_free
/* A7FD4 800A73D4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7FD8 800A73D8 AFBF0010 */  sw         $ra, 0x10($sp)
/* A7FDC 800A73DC 0C029CB7 */  jal        borg13_free
/* A7FE0 800A73E0 00000000 */   nop
/* A7FE4 800A73E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* A7FE8 800A73E8 03E00008 */  jr         $ra
/* A7FEC 800A73EC 27BD0018 */   addiu     $sp, $sp, 0x18
