.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel borg14_func_b
/* A7FF0 800A73F0 AC850008 */  sw         $a1, 8($a0)
/* A7FF4 800A73F4 03E00008 */  jr         $ra
/* A7FF8 800A73F8 00001021 */   addu      $v0, $zero, $zero

glabel borg14_func_a
/* A7FFC 800A73FC 8C820008 */  lw         $v0, 8($a0)
/* A8000 800A7400 00441021 */  addu       $v0, $v0, $a0
/* A8004 800A7404 AC820008 */  sw         $v0, 8($a0)
/* A8008 800A7408 8C82000C */  lw         $v0, 0xc($a0)
/* A800C 800A740C 00441021 */  addu       $v0, $v0, $a0
/* A8010 800A7410 03E00008 */  jr         $ra
/* A8014 800A7414 AC82000C */   sw        $v0, 0xc($a0)

glabel ofunc_borg14_free
/* A8018 800A7418 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A801C 800A741C AFB10014 */  sw         $s1, 0x14($sp)
/* A8020 800A7420 00808821 */  addu       $s1, $a0, $zero
/* A8024 800A7424 AFBF001C */  sw         $ra, 0x1c($sp)
/* A8028 800A7428 AFB20018 */  sw         $s2, 0x18($sp)
/* A802C 800A742C 0C02608C */  jal        get_memUsed
/* A8030 800A7430 AFB00010 */   sw        $s0, 0x10($sp)
/* A8034 800A7434 00409021 */  addu       $s2, $v0, $zero
/* A8038 800A7438 8E240000 */  lw         $a0, ($s1)
/* A803C 800A743C 2402FFFF */  addiu      $v0, $zero, -1
/* A8040 800A7440 14820007 */  bne        $a0, $v0, .L800A7460
/* A8044 800A7444 3C10800E */   lui       $s0, %hi(D_800E3440)
/* A8048 800A7448 8E240008 */  lw         $a0, 8($s1)
/* A804C 800A744C 26053440 */  addiu      $a1, $s0, %lo(D_800E3440)
/* A8050 800A7450 0C02600C */  jal        Free
/* A8054 800A7454 24060092 */   addiu     $a2, $zero, 0x92
/* A8058 800A7458 08029D1B */  j          .L800A746C
/* A805C 800A745C 02202021 */   addu      $a0, $s1, $zero
.L800A7460:
/* A8060 800A7460 0C028B7F */  jal        dec_borg_count
/* A8064 800A7464 00000000 */   nop
/* A8068 800A7468 02202021 */  addu       $a0, $s1, $zero
.L800A746C:
/* A806C 800A746C 26053440 */  addiu      $a1, $s0, 0x3440
/* A8070 800A7470 0C02600C */  jal        Free
/* A8074 800A7474 24060099 */   addiu     $a2, $zero, 0x99
/* A8078 800A7478 0C02608C */  jal        get_memUsed
/* A807C 800A747C 00000000 */   nop
/* A8080 800A7480 3C06800F */  lui        $a2, %hi(borg_mem)
/* A8084 800A7484 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A8088 800A7488 02421023 */  subu       $v0, $s2, $v0
/* A808C 800A748C 3C05800F */  lui        $a1, %hi(borg_count)
/* A8090 800A7490 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A8094 800A7494 8CC30038 */  lw         $v1, 0x38($a2)
/* A8098 800A7498 8CA40038 */  lw         $a0, 0x38($a1)
/* A809C 800A749C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A80A0 800A74A0 8FB20018 */  lw         $s2, 0x18($sp)
/* A80A4 800A74A4 8FB10014 */  lw         $s1, 0x14($sp)
/* A80A8 800A74A8 8FB00010 */  lw         $s0, 0x10($sp)
/* A80AC 800A74AC 00621823 */  subu       $v1, $v1, $v0
/* A80B0 800A74B0 2484FFFF */  addiu      $a0, $a0, -1
/* A80B4 800A74B4 ACC30038 */  sw         $v1, 0x38($a2)
/* A80B8 800A74B8 ACA40038 */  sw         $a0, 0x38($a1)
/* A80BC 800A74BC 03E00008 */  jr         $ra
/* A80C0 800A74C0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A74C4
/* A80C4 800A74C4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A80C8 800A74C8 AFB00010 */  sw         $s0, 0x10($sp)
/* A80CC 800A74CC AFBF0014 */  sw         $ra, 0x14($sp)
/* A80D0 800A74D0 0C02891C */  jal        clearBorgFlag
/* A80D4 800A74D4 00808021 */   addu      $s0, $a0, $zero
/* A80D8 800A74D8 0C028A22 */  jal        getBorgItem
/* A80DC 800A74DC 02002021 */   addu      $a0, $s0, $zero
/* A80E0 800A74E0 8FBF0014 */  lw         $ra, 0x14($sp)
/* A80E4 800A74E4 8FB00010 */  lw         $s0, 0x10($sp)
/* A80E8 800A74E8 03E00008 */  jr         $ra
/* A80EC 800A74EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A74F0
/* A80F0 800A74F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A80F4 800A74F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* A80F8 800A74F8 0C029D06 */  jal        ofunc_borg14_free
/* A80FC 800A74FC 00000000 */   nop
/* A8100 800A7500 8FBF0010 */  lw         $ra, 0x10($sp)
/* A8104 800A7504 03E00008 */  jr         $ra
/* A8108 800A7508 27BD0018 */   addiu     $sp, $sp, 0x18
/* A810C 800A750C 00000000 */  nop
