.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800D5390
/* D5F90 800D5390 00A01821 */  addu       $v1, $a1, $zero
/* D5F94 800D5394 000328C2 */  srl        $a1, $v1, 3
/* D5F98 800D5398 000510C0 */  sll        $v0, $a1, 3
/* D5F9C 800D539C 10C00008 */  beqz       $a2, .L800D53C0
/* D5FA0 800D53A0 00621823 */   subu      $v1, $v1, $v0
/* D5FA4 800D53A4 00852821 */  addu       $a1, $a0, $a1
/* D5FA8 800D53A8 00E32021 */  addu       $a0, $a3, $v1
/* D5FAC 800D53AC 90A20000 */  lbu        $v0, ($a1)
/* D5FB0 800D53B0 90830000 */  lbu        $v1, ($a0)
/* D5FB4 800D53B4 00431025 */  or         $v0, $v0, $v1
/* D5FB8 800D53B8 03E00008 */  jr         $ra
/* D5FBC 800D53BC A0A20000 */   sb        $v0, ($a1)
.L800D53C0:
/* D5FC0 800D53C0 8FA20010 */  lw         $v0, 0x10($sp)
/* D5FC4 800D53C4 00852821 */  addu       $a1, $a0, $a1
/* D5FC8 800D53C8 00431021 */  addu       $v0, $v0, $v1
/* D5FCC 800D53CC 90A30000 */  lbu        $v1, ($a1)
/* D5FD0 800D53D0 90440000 */  lbu        $a0, ($v0)
/* D5FD4 800D53D4 00641824 */  and        $v1, $v1, $a0
/* D5FD8 800D53D8 03E00008 */  jr         $ra
/* D5FDC 800D53DC A0A30000 */   sb        $v1, ($a1)

glabel getBit
/* D5FE0 800D53E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D5FE4 800D53E4 AFB00010 */  sw         $s0, 0x10($sp)
/* D5FE8 800D53E8 00A08021 */  addu       $s0, $a1, $zero
/* D5FEC 800D53EC AFB10014 */  sw         $s1, 0x14($sp)
/* D5FF0 800D53F0 00808821 */  addu       $s1, $a0, $zero
/* D5FF4 800D53F4 AFB20018 */  sw         $s2, 0x18($sp)
/* D5FF8 800D53F8 00C09021 */  addu       $s2, $a2, $zero
/* D5FFC 800D53FC 16200006 */  bnez       $s1, .L800D5418
/* D6000 800D5400 AFBF001C */   sw        $ra, 0x1c($sp)
/* D6004 800D5404 3C04800E */  lui        $a0, %hi(D_800E4E80)
/* D6008 800D5408 3C05800E */  lui        $a1, %hi(D_800E4EA4)
/* D600C 800D540C 24844E80 */  addiu      $a0, $a0, %lo(D_800E4E80)
/* D6010 800D5410 0C025F2D */  jal        manualCrash
/* D6014 800D5414 24A54EA4 */   addiu     $a1, $a1, %lo(D_800E4EA4)
.L800D5418:
/* D6018 800D5418 001018C2 */  srl        $v1, $s0, 3
/* D601C 800D541C 000310C0 */  sll        $v0, $v1, 3
/* D6020 800D5420 02028023 */  subu       $s0, $s0, $v0
/* D6024 800D5424 02231821 */  addu       $v1, $s1, $v1
/* D6028 800D5428 02502821 */  addu       $a1, $s2, $s0
/* D602C 800D542C 90620000 */  lbu        $v0, ($v1)
/* D6030 800D5430 90A40000 */  lbu        $a0, ($a1)
/* D6034 800D5434 8FBF001C */  lw         $ra, 0x1c($sp)
/* D6038 800D5438 8FB20018 */  lw         $s2, 0x18($sp)
/* D603C 800D543C 8FB10014 */  lw         $s1, 0x14($sp)
/* D6040 800D5440 8FB00010 */  lw         $s0, 0x10($sp)
/* D6044 800D5444 00441024 */  and        $v0, $v0, $a0
/* D6048 800D5448 0002102B */  sltu       $v0, $zero, $v0
/* D604C 800D544C 03E00008 */  jr         $ra
/* D6050 800D5450 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800D5454
/* D6054 800D5454 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* D6058 800D5458 AFB10054 */  sw         $s1, 0x54($sp)
/* D605C 800D545C 00808821 */  addu       $s1, $a0, $zero
/* D6060 800D5460 AFB20058 */  sw         $s2, 0x58($sp)
/* D6064 800D5464 00A09021 */  addu       $s2, $a1, $zero
/* D6068 800D5468 AFB00050 */  sw         $s0, 0x50($sp)
/* D606C 800D546C 00008021 */  addu       $s0, $zero, $zero
/* D6070 800D5470 27A40010 */  addiu      $a0, $sp, 0x10
/* D6074 800D5474 24050001 */  addiu      $a1, $zero, 1
/* D6078 800D5478 AFBF005C */  sw         $ra, 0x5c($sp)
/* D607C 800D547C 00901021 */  addu       $v0, $a0, $s0
.L800D5480:
/* D6080 800D5480 02051804 */  sllv       $v1, $a1, $s0
/* D6084 800D5484 A0430000 */  sb         $v1, ($v0)
/* D6088 800D5488 26100001 */  addiu      $s0, $s0, 1
/* D608C 800D548C 2E020008 */  sltiu      $v0, $s0, 8
/* D6090 800D5490 1440FFFB */  bnez       $v0, .L800D5480
/* D6094 800D5494 00901021 */   addu      $v0, $a0, $s0
/* D6098 800D5498 96220004 */  lhu        $v0, 4($s1)
/* D609C 800D549C 1040000E */  beqz       $v0, .L800D54D8
/* D60A0 800D54A0 00008021 */   addu      $s0, $zero, $zero
/* D60A4 800D54A4 02402021 */  addu       $a0, $s2, $zero
.L800D54A8:
/* D60A8 800D54A8 02002821 */  addu       $a1, $s0, $zero
/* D60AC 800D54AC 0C0354F8 */  jal        getBit
/* D60B0 800D54B0 27A60010 */   addiu     $a2, $sp, 0x10
/* D60B4 800D54B4 8E230008 */  lw         $v1, 8($s1)
/* D60B8 800D54B8 001020C0 */  sll        $a0, $s0, 3
/* D60BC 800D54BC 00832021 */  addu       $a0, $a0, $v1
/* D60C0 800D54C0 A0820006 */  sb         $v0, 6($a0)
/* D60C4 800D54C4 96220004 */  lhu        $v0, 4($s1)
/* D60C8 800D54C8 26100001 */  addiu      $s0, $s0, 1
/* D60CC 800D54CC 0202102B */  sltu       $v0, $s0, $v0
/* D60D0 800D54D0 1440FFF5 */  bnez       $v0, .L800D54A8
/* D60D4 800D54D4 02402021 */   addu      $a0, $s2, $zero
.L800D54D8:
/* D60D8 800D54D8 0C03549D */  jal        set_gamestateFunnel_f
/* D60DC 800D54DC 02202021 */   addu      $a0, $s1, $zero
/* D60E0 800D54E0 8FBF005C */  lw         $ra, 0x5c($sp)
/* D60E4 800D54E4 8FB20058 */  lw         $s2, 0x58($sp)
/* D60E8 800D54E8 8FB10054 */  lw         $s1, 0x54($sp)
/* D60EC 800D54EC 8FB00050 */  lw         $s0, 0x50($sp)
/* D60F0 800D54F0 03E00008 */  jr         $ra
/* D60F4 800D54F4 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_800D54F8
/* D60F8 800D54F8 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* D60FC 800D54FC AFB200A0 */  sw         $s2, 0xa0($sp)
/* D6100 800D5500 00809021 */  addu       $s2, $a0, $zero
/* D6104 800D5504 AFB300A4 */  sw         $s3, 0xa4($sp)
/* D6108 800D5508 00A09821 */  addu       $s3, $a1, $zero
/* D610C 800D550C AFB00098 */  sw         $s0, 0x98($sp)
/* D6110 800D5510 00008021 */  addu       $s0, $zero, $zero
/* D6114 800D5514 27A50018 */  addiu      $a1, $sp, 0x18
/* D6118 800D5518 24070001 */  addiu      $a3, $zero, 1
/* D611C 800D551C AFB1009C */  sw         $s1, 0x9c($sp)
/* D6120 800D5520 27B10058 */  addiu      $s1, $sp, 0x58
/* D6124 800D5524 02203021 */  addu       $a2, $s1, $zero
/* D6128 800D5528 AFBF00A8 */  sw         $ra, 0xa8($sp)
.L800D552C:
/* D612C 800D552C 00B01021 */  addu       $v0, $a1, $s0
/* D6130 800D5530 02071804 */  sllv       $v1, $a3, $s0
/* D6134 800D5534 00D02021 */  addu       $a0, $a2, $s0
/* D6138 800D5538 26100001 */  addiu      $s0, $s0, 1
/* D613C 800D553C A0430000 */  sb         $v1, ($v0)
/* D6140 800D5540 00031827 */  nor        $v1, $zero, $v1
/* D6144 800D5544 2E020008 */  sltiu      $v0, $s0, 8
/* D6148 800D5548 1440FFF8 */  bnez       $v0, .L800D552C
/* D614C 800D554C A0830000 */   sb        $v1, ($a0)
/* D6150 800D5550 96420004 */  lhu        $v0, 4($s2)
/* D6154 800D5554 2446001F */  addiu      $a2, $v0, 0x1f
/* D6158 800D5558 04C20001 */  bltzl      $a2, .L800D5560
/* D615C 800D555C 2446003E */   addiu     $a2, $v0, 0x3e
.L800D5560:
/* D6160 800D5560 02602021 */  addu       $a0, $s3, $zero
/* D6164 800D5564 00002821 */  addu       $a1, $zero, $zero
/* D6168 800D5568 00063142 */  srl        $a2, $a2, 5
/* D616C 800D556C 0C026380 */  jal        Calloc
/* D6170 800D5570 00063080 */   sll       $a2, $a2, 2
/* D6174 800D5574 96430004 */  lhu        $v1, 4($s2)
/* D6178 800D5578 10600010 */  beqz       $v1, .L800D55BC
/* D617C 800D557C 00008021 */   addu      $s0, $zero, $zero
/* D6180 800D5580 02602021 */  addu       $a0, $s3, $zero
.L800D5584:
/* D6184 800D5584 001010C0 */  sll        $v0, $s0, 3
/* D6188 800D5588 8E430008 */  lw         $v1, 8($s2)
/* D618C 800D558C 02002821 */  addu       $a1, $s0, $zero
/* D6190 800D5590 00431021 */  addu       $v0, $v0, $v1
/* D6194 800D5594 90460006 */  lbu        $a2, 6($v0)
/* D6198 800D5598 27A70018 */  addiu      $a3, $sp, 0x18
/* D619C 800D559C AFB10010 */  sw         $s1, 0x10($sp)
/* D61A0 800D55A0 0C0354E4 */  jal        func_800D5390
/* D61A4 800D55A4 0006302B */   sltu      $a2, $zero, $a2
/* D61A8 800D55A8 96420004 */  lhu        $v0, 4($s2)
/* D61AC 800D55AC 26100001 */  addiu      $s0, $s0, 1
/* D61B0 800D55B0 0202102B */  sltu       $v0, $s0, $v0
/* D61B4 800D55B4 1440FFF3 */  bnez       $v0, .L800D5584
/* D61B8 800D55B8 02602021 */   addu      $a0, $s3, $zero
.L800D55BC:
/* D61BC 800D55BC 8FBF00A8 */  lw         $ra, 0xa8($sp)
/* D61C0 800D55C0 8FB300A4 */  lw         $s3, 0xa4($sp)
/* D61C4 800D55C4 8FB200A0 */  lw         $s2, 0xa0($sp)
/* D61C8 800D55C8 8FB1009C */  lw         $s1, 0x9c($sp)
/* D61CC 800D55CC 8FB00098 */  lw         $s0, 0x98($sp)
/* D61D0 800D55D0 03E00008 */  jr         $ra
/* D61D4 800D55D4 27BD00B0 */   addiu     $sp, $sp, 0xb0
/* D61D8 800D55D8 00000000 */  nop
/* D61DC 800D55DC 00000000 */  nop
