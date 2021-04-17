.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonRCPrunning
/* CB820 800CAC20 00001021 */  addu       $v0, $zero, $zero
/* CB824 800CAC24 3C08A404 */  lui        $t0, %hi(SP_STATUS)
/* CB828 800CAC28 8D080010 */  lw         $t0, %lo(SP_STATUS)($t0)
/* CB82C 800CAC2C 31080003 */  andi       $t0, $t0, 3
/* CB830 800CAC30 15000002 */  bnez       $t0, .L800CAC3C
/* CB834 800CAC34 00000000 */   nop
/* CB838 800CAC38 34420001 */  ori        $v0, $v0, 1
.L800CAC3C:
/* CB83C 800CAC3C 03E00008 */  jr         $ra
/* CB840 800CAC40 00000000 */   nop

glabel __rmonIdleRCP
/* CB844 800CAC44 3C04A404 */  lui        $a0, 0xa404
/* CB848 800CAC48 34840018 */  ori        $a0, $a0, 0x18
.L800CAC4C:
/* CB84C 800CAC4C 8C820000 */  lw         $v0, ($a0)
/* CB850 800CAC50 1440FFFE */  bnez       $v0, .L800CAC4C
/* CB854 800CAC54 00000000 */   nop
/* CB858 800CAC58 24050082 */  addiu      $a1, $zero, 0x82
/* CB85C 800CAC5C 3C04A404 */  lui        $a0, 0xa404
/* CB860 800CAC60 34840010 */  ori        $a0, $a0, 0x10
/* CB864 800CAC64 AC850000 */  sw         $a1, ($a0)
.L800CAC68:
/* CB868 800CAC68 3C04A404 */  lui        $a0, 0xa404
/* CB86C 800CAC6C 34840010 */  ori        $a0, $a0, 0x10
/* CB870 800CAC70 8C820000 */  lw         $v0, ($a0)
/* CB874 800CAC74 30420003 */  andi       $v0, $v0, 3
/* CB878 800CAC78 1040FFFB */  beqz       $v0, .L800CAC68
/* CB87C 800CAC7C 00000000 */   nop
/* CB880 800CAC80 03E00008 */  jr         $ra
/* CB884 800CAC84 00000000 */   nop

glabel __rmonStepRCP
/* CB888 800CAC88 3C04A404 */  lui        $a0, 0xa404
/* CB88C 800CAC8C 34840010 */  ori        $a0, $a0, 0x10
/* CB890 800CAC90 240500C5 */  addiu      $a1, $zero, 0xc5
/* CB894 800CAC94 1000FFF4 */  b          .L800CAC68
/* CB898 800CAC98 AC850000 */   sw        $a1, ($a0)

glabel __rmonRunRCP
/* CB89C 800CAC9C 3C04A430 */  lui        $a0, 0xa430
/* CB8A0 800CACA0 3484000C */  ori        $a0, $a0, 0xc
/* CB8A4 800CACA4 24050002 */  addiu      $a1, $zero, 2
/* CB8A8 800CACA8 AC850000 */  sw         $a1, ($a0)
/* CB8AC 800CACAC 3C04A404 */  lui        $a0, 0xa404
/* CB8B0 800CACB0 34840010 */  ori        $a0, $a0, 0x10
/* CB8B4 800CACB4 24050125 */  addiu      $a1, $zero, 0x125
/* CB8B8 800CACB8 03E00008 */  jr         $ra
/* CB8BC 800CACBC AC850000 */   sw        $a1, ($a0)

glabel __rmonMaskIdleThreadInts
/* CB8C0 800CACC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CB8C4 800CACC4 AFBF0010 */  sw         $ra, 0x10($sp)
/* CB8C8 800CACC8 0C03253C */  jal        rmonGetActiveQueue
/* CB8CC 800CACCC 00000000 */   nop
/* CB8D0 800CACD0 00402021 */  addu       $a0, $v0, $zero
/* CB8D4 800CACD4 8C830004 */  lw         $v1, 4($a0)
/* CB8D8 800CACD8 2402FFFF */  addiu      $v0, $zero, -1
/* CB8DC 800CACDC 1062000F */  beq        $v1, $v0, .L800CAD1C
/* CB8E0 800CACE0 3C03FFFF */   lui       $v1, 0xffff
/* CB8E4 800CACE4 346300FE */  ori        $v1, $v1, 0xfe
/* CB8E8 800CACE8 2405FFFF */  addiu      $a1, $zero, -1
/* CB8EC 800CACEC 8C820004 */  lw         $v0, 4($a0)
.L800CACF0:
/* CB8F0 800CACF0 14400006 */  bnez       $v0, .L800CAD0C
/* CB8F4 800CACF4 00000000 */   nop
/* CB8F8 800CACF8 8C820118 */  lw         $v0, 0x118($a0)
/* CB8FC 800CACFC 00431024 */  and        $v0, $v0, $v1
/* CB900 800CAD00 34426C01 */  ori        $v0, $v0, 0x6c01
/* CB904 800CAD04 08032B47 */  j          .L800CAD1C
/* CB908 800CAD08 AC820118 */   sw        $v0, 0x118($a0)
.L800CAD0C:
/* CB90C 800CAD0C 8C84000C */  lw         $a0, 0xc($a0)
/* CB910 800CAD10 8C820004 */  lw         $v0, 4($a0)
/* CB914 800CAD14 1445FFF6 */  bne        $v0, $a1, .L800CACF0
/* CB918 800CAD18 00000000 */   nop
.L800CAD1C:
/* CB91C 800CAD1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* CB920 800CAD20 03E00008 */  jr         $ra
/* CB924 800CAD24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __rmonGetTCB
/* CB928 800CAD28 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CB92C 800CAD2C AFB00010 */  sw         $s0, 0x10($sp)
/* CB930 800CAD30 AFBF0014 */  sw         $ra, 0x14($sp)
/* CB934 800CAD34 0C03253C */  jal        rmonGetActiveQueue
/* CB938 800CAD38 00808021 */   addu      $s0, $a0, $zero
/* CB93C 800CAD3C 1E000003 */  bgtz       $s0, .L800CAD4C
/* CB940 800CAD40 00402021 */   addu      $a0, $v0, $zero
/* CB944 800CAD44 08032B5F */  j          .L800CAD7C
/* CB948 800CAD48 00001021 */   addu      $v0, $zero, $zero
.L800CAD4C:
/* CB94C 800CAD4C 8C830004 */  lw         $v1, 4($a0)
/* CB950 800CAD50 2402FFFF */  addiu      $v0, $zero, -1
/* CB954 800CAD54 10620009 */  beq        $v1, $v0, .L800CAD7C
/* CB958 800CAD58 00001021 */   addu      $v0, $zero, $zero
/* CB95C 800CAD5C 2403FFFF */  addiu      $v1, $zero, -1
.L800CAD60:
/* CB960 800CAD60 8C820014 */  lw         $v0, 0x14($a0)
/* CB964 800CAD64 10500005 */  beq        $v0, $s0, .L800CAD7C
/* CB968 800CAD68 00801021 */   addu      $v0, $a0, $zero
/* CB96C 800CAD6C 8C84000C */  lw         $a0, 0xc($a0)
/* CB970 800CAD70 8C820004 */  lw         $v0, 4($a0)
/* CB974 800CAD74 1443FFFA */  bne        $v0, $v1, .L800CAD60
/* CB978 800CAD78 00001021 */   addu      $v0, $zero, $zero
.L800CAD7C:
/* CB97C 800CAD7C 8FBF0014 */  lw         $ra, 0x14($sp)
/* CB980 800CAD80 8FB00010 */  lw         $s0, 0x10($sp)
/* CB984 800CAD84 03E00008 */  jr         $ra
/* CB988 800CAD88 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __rmonStopUserThreads
/* CB98C 800CAD8C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CB990 800CAD90 AFB10014 */  sw         $s1, 0x14($sp)
/* CB994 800CAD94 00808821 */  addu       $s1, $a0, $zero
/* CB998 800CAD98 AFB20018 */  sw         $s2, 0x18($sp)
/* CB99C 800CAD9C 00009021 */  addu       $s2, $zero, $zero
/* CB9A0 800CADA0 AFBF001C */  sw         $ra, 0x1c($sp)
/* CB9A4 800CADA4 0C03253C */  jal        rmonGetActiveQueue
/* CB9A8 800CADA8 AFB00010 */   sw        $s0, 0x10($sp)
/* CB9AC 800CADAC 12200019 */  beqz       $s1, .L800CAE14
/* CB9B0 800CADB0 00408021 */   addu      $s0, $v0, $zero
/* CB9B4 800CADB4 8E030004 */  lw         $v1, 4($s0)
/* CB9B8 800CADB8 2402FFFF */  addiu      $v0, $zero, -1
/* CB9BC 800CADBC 1062000C */  beq        $v1, $v0, .L800CADF0
/* CB9C0 800CADC0 2403FFFF */   addiu     $v1, $zero, -1
.L800CADC4:
/* CB9C4 800CADC4 8E020014 */  lw         $v0, 0x14($s0)
/* CB9C8 800CADC8 10510005 */  beq        $v0, $s1, .L800CADE0
/* CB9CC 800CADCC 00000000 */   nop
/* CB9D0 800CADD0 8E10000C */  lw         $s0, 0xc($s0)
/* CB9D4 800CADD4 8E020004 */  lw         $v0, 4($s0)
/* CB9D8 800CADD8 1443FFFA */  bne        $v0, $v1, .L800CADC4
/* CB9DC 800CADDC 00000000 */   nop
.L800CADE0:
/* CB9E0 800CADE0 8E030004 */  lw         $v1, 4($s0)
/* CB9E4 800CADE4 2402FFFF */  addiu      $v0, $zero, -1
/* CB9E8 800CADE8 14620003 */  bne        $v1, $v0, .L800CADF8
/* CB9EC 800CADEC 2462FFFF */   addiu     $v0, $v1, -1
.L800CADF0:
/* CB9F0 800CADF0 08032B97 */  j          .L800CAE5C
/* CB9F4 800CADF4 00001021 */   addu      $v0, $zero, $zero
.L800CADF8:
/* CB9F8 800CADF8 2C42007F */  sltiu      $v0, $v0, 0x7f
/* CB9FC 800CADFC 10400017 */  beqz       $v0, .L800CAE5C
/* CBA00 800CAE00 02401021 */   addu      $v0, $s2, $zero
/* CBA04 800CAE04 0C033500 */  jal        __rmonStopUserThreads
/* CBA08 800CAE08 02002021 */   addu      $a0, $s0, $zero
/* CBA0C 800CAE0C 08032B96 */  j          .L800CAE58
/* CBA10 800CAE10 02209021 */   addu      $s2, $s1, $zero
.L800CAE14:
/* CBA14 800CAE14 8E030004 */  lw         $v1, 4($s0)
/* CBA18 800CAE18 2402FFFF */  addiu      $v0, $zero, -1
/* CBA1C 800CAE1C 1062000F */  beq        $v1, $v0, .L800CAE5C
/* CBA20 800CAE20 02401021 */   addu      $v0, $s2, $zero
/* CBA24 800CAE24 2411FFFF */  addiu      $s1, $zero, -1
/* CBA28 800CAE28 8E020004 */  lw         $v0, 4($s0)
/* CBA2C 800CAE2C 2442FFFF */  addiu      $v0, $v0, -1
.L800CAE30:
/* CBA30 800CAE30 2C42007F */  sltiu      $v0, $v0, 0x7f
/* CBA34 800CAE34 10400004 */  beqz       $v0, .L800CAE48
/* CBA38 800CAE38 00000000 */   nop
/* CBA3C 800CAE3C 0C033500 */  jal        __rmonStopUserThreads
/* CBA40 800CAE40 02002021 */   addu      $a0, $s0, $zero
/* CBA44 800CAE44 2412FFFF */  addiu      $s2, $zero, -1
.L800CAE48:
/* CBA48 800CAE48 8E10000C */  lw         $s0, 0xc($s0)
/* CBA4C 800CAE4C 8E020004 */  lw         $v0, 4($s0)
/* CBA50 800CAE50 1451FFF7 */  bne        $v0, $s1, .L800CAE30
/* CBA54 800CAE54 2442FFFF */   addiu     $v0, $v0, -1
.L800CAE58:
/* CBA58 800CAE58 02401021 */  addu       $v0, $s2, $zero
.L800CAE5C:
/* CBA5C 800CAE5C 8FBF001C */  lw         $ra, 0x1c($sp)
/* CBA60 800CAE60 8FB20018 */  lw         $s2, 0x18($sp)
/* CBA64 800CAE64 8FB10014 */  lw         $s1, 0x14($sp)
/* CBA68 800CAE68 8FB00010 */  lw         $s0, 0x10($sp)
/* CBA6C 800CAE6C 03E00008 */  jr         $ra
/* CBA70 800CAE70 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonListThreads
/* CBA74 800CAE74 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CBA78 800CAE78 AFB10014 */  sw         $s1, 0x14($sp)
/* CBA7C 800CAE7C 00808821 */  addu       $s1, $a0, $zero
/* CBA80 800CAE80 AFBF001C */  sw         $ra, 0x1c($sp)
/* CBA84 800CAE84 AFB20018 */  sw         $s2, 0x18($sp)
/* CBA88 800CAE88 AFB00010 */  sw         $s0, 0x10($sp)
/* CBA8C 800CAE8C 8E22000C */  lw         $v0, 0xc($s1)
/* CBA90 800CAE90 3C108010 */  lui        $s0, %hi(__rmonUtilityBuffer_)
/* CBA94 800CAE94 2610A350 */  addiu      $s0, $s0, %lo(__rmonUtilityBuffer_)
/* CBA98 800CAE98 2412FFFF */  addiu      $s2, $zero, -1
/* CBA9C 800CAE9C 10520002 */  beq        $v0, $s2, .L800CAEA8
/* CBAA0 800CAEA0 240303EA */   addiu     $v1, $zero, 0x3ea
/* CBAA4 800CAEA4 00401821 */  addu       $v1, $v0, $zero
.L800CAEA8:
/* CBAA8 800CAEA8 3C018010 */  lui        $at, %hi(D_800FA35C)
/* CBAAC 800CAEAC AC23A35C */  sw         $v1, %lo(D_800FA35C)($at)
/* CBAB0 800CAEB0 92230009 */  lbu        $v1, 9($s1)
/* CBAB4 800CAEB4 24020001 */  addiu      $v0, $zero, 1
/* CBAB8 800CAEB8 14620007 */  bne        $v1, $v0, .L800CAED8
/* CBABC 800CAEBC 24020001 */   addiu     $v0, $zero, 1
/* CBAC0 800CAEC0 3C018010 */  lui        $at, %hi(__rmonUtilityBuffer_1)
/* CBAC4 800CAEC4 A422A360 */  sh         $v0, %lo(__rmonUtilityBuffer_1)($at)
/* CBAC8 800CAEC8 240203E8 */  addiu      $v0, $zero, 0x3e8
/* CBACC 800CAECC 3C018010 */  lui        $at, %hi(D_800FA364)
/* CBAD0 800CAED0 08032BCC */  j          .L800CAF30
/* CBAD4 800CAED4 AC22A364 */   sw        $v0, %lo(D_800FA364)($at)
.L800CAED8:
/* CBAD8 800CAED8 0C03253C */  jal        rmonGetActiveQueue
/* CBADC 800CAEDC 00000000 */   nop
/* CBAE0 800CAEE0 00402021 */  addu       $a0, $v0, $zero
/* CBAE4 800CAEE4 3C018010 */  lui        $at, %hi(__rmonUtilityBuffer_1)
/* CBAE8 800CAEE8 A420A360 */  sh         $zero, %lo(__rmonUtilityBuffer_1)($at)
/* CBAEC 800CAEEC 8C820004 */  lw         $v0, 4($a0)
/* CBAF0 800CAEF0 1052000F */  beq        $v0, $s2, .L800CAF30
/* CBAF4 800CAEF4 2405FFFF */   addiu     $a1, $zero, -1
.L800CAEF8:
/* CBAF8 800CAEF8 8C830014 */  lw         $v1, 0x14($a0)
/* CBAFC 800CAEFC 10600008 */  beqz       $v1, .L800CAF20
/* CBB00 800CAF00 00000000 */   nop
/* CBB04 800CAF04 96020010 */  lhu        $v0, 0x10($s0)
/* CBB08 800CAF08 00021080 */  sll        $v0, $v0, 2
/* CBB0C 800CAF0C 00501021 */  addu       $v0, $v0, $s0
/* CBB10 800CAF10 AC430014 */  sw         $v1, 0x14($v0)
/* CBB14 800CAF14 96020010 */  lhu        $v0, 0x10($s0)
/* CBB18 800CAF18 24420001 */  addiu      $v0, $v0, 1
/* CBB1C 800CAF1C A6020010 */  sh         $v0, 0x10($s0)
.L800CAF20:
/* CBB20 800CAF20 8C84000C */  lw         $a0, 0xc($a0)
/* CBB24 800CAF24 8C820004 */  lw         $v0, 4($a0)
/* CBB28 800CAF28 1445FFF3 */  bne        $v0, $a1, .L800CAEF8
/* CBB2C 800CAF2C 00000000 */   nop
.L800CAF30:
/* CBB30 800CAF30 92220004 */  lbu        $v0, 4($s1)
/* CBB34 800CAF34 96050010 */  lhu        $a1, 0x10($s0)
/* CBB38 800CAF38 02002021 */  addu       $a0, $s0, $zero
/* CBB3C 800CAF3C 24060001 */  addiu      $a2, $zero, 1
/* CBB40 800CAF40 A6000006 */  sh         $zero, 6($s0)
/* CBB44 800CAF44 00052880 */  sll        $a1, $a1, 2
/* CBB48 800CAF48 24A50014 */  addiu      $a1, $a1, 0x14
/* CBB4C 800CAF4C 0C03255A */  jal        __rmonSendReply
/* CBB50 800CAF50 A2020004 */   sb        $v0, 4($s0)
/* CBB54 800CAF54 00001021 */  addu       $v0, $zero, $zero
/* CBB58 800CAF58 8FBF001C */  lw         $ra, 0x1c($sp)
/* CBB5C 800CAF5C 8FB20018 */  lw         $s2, 0x18($sp)
/* CBB60 800CAF60 8FB10014 */  lw         $s1, 0x14($sp)
/* CBB64 800CAF64 8FB00010 */  lw         $s0, 0x10($sp)
/* CBB68 800CAF68 03E00008 */  jr         $ra
/* CBB6C 800CAF6C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonGetThreadStatus
/* CBB70 800CAF70 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CBB74 800CAF74 AFB10014 */  sw         $s1, 0x14($sp)
/* CBB78 800CAF78 00808821 */  addu       $s1, $a0, $zero
/* CBB7C 800CAF7C AFB20018 */  sw         $s2, 0x18($sp)
/* CBB80 800CAF80 00A09021 */  addu       $s2, $a1, $zero
/* CBB84 800CAF84 AFB00010 */  sw         $s0, 0x10($sp)
/* CBB88 800CAF88 00C08021 */  addu       $s0, $a2, $zero
/* CBB8C 800CAF8C 24020001 */  addiu      $v0, $zero, 1
/* CBB90 800CAF90 AFBF001C */  sw         $ra, 0x1c($sp)
/* CBB94 800CAF94 16220003 */  bne        $s1, $v0, .L800CAFA4
/* CBB98 800CAF98 AE120014 */   sw        $s2, 0x14($s0)
/* CBB9C 800CAF9C 08032BEA */  j          .L800CAFA8
/* CBBA0 800CAFA0 240203E9 */   addiu     $v0, $zero, 0x3e9
.L800CAFA4:
/* CBBA4 800CAFA4 240203EA */  addiu      $v0, $zero, 0x3ea
.L800CAFA8:
/* CBBA8 800CAFA8 AE020018 */  sw         $v0, 0x18($s0)
/* CBBAC 800CAFAC 24020001 */  addiu      $v0, $zero, 1
/* CBBB0 800CAFB0 A6020010 */  sh         $v0, 0x10($s0)
/* CBBB4 800CAFB4 24020001 */  addiu      $v0, $zero, 1
/* CBBB8 800CAFB8 A6000012 */  sh         $zero, 0x12($s0)
/* CBBBC 800CAFBC A6000024 */  sh         $zero, 0x24($s0)
/* CBBC0 800CAFC0 A6000026 */  sh         $zero, 0x26($s0)
/* CBBC4 800CAFC4 16220024 */  bne        $s1, $v0, .L800CB058
/* CBBC8 800CAFC8 AE000030 */   sw        $zero, 0x30($s0)
/* CBBCC 800CAFCC 3C120400 */  lui        $s2, 0x400
/* CBBD0 800CAFD0 36521000 */  ori        $s2, $s2, 0x1000
/* CBBD4 800CAFD4 2402002A */  addiu      $v0, $zero, 0x2a
/* CBBD8 800CAFD8 AE12002C */  sw         $s2, 0x2c($s0)
/* CBBDC 800CAFDC 0C032B08 */  jal        __rmonRCPrunning
/* CBBE0 800CAFE0 AE020028 */   sw        $v0, 0x28($s0)
/* CBBE4 800CAFE4 10400005 */  beqz       $v0, .L800CAFFC
/* CBBE8 800CAFE8 24020004 */   addiu     $v0, $zero, 4
/* CBBEC 800CAFEC AE02000C */  sw         $v0, 0xc($s0)
/* CBBF0 800CAFF0 AE000020 */  sw         $zero, 0x20($s0)
/* CBBF4 800CAFF4 08032C4B */  j          .L800CB12C
/* CBBF8 800CAFF8 AE00001C */   sw        $zero, 0x1c($s0)
.L800CAFFC:
/* CBBFC 800CAFFC 3C040408 */  lui        $a0, 0x408
/* CBC00 800CB000 0C032638 */  jal        __rmonReadWordAt
/* CBC04 800CB004 AE11000C */   sw        $s1, 0xc($s0)
/* CBC08 800CB008 00522021 */  addu       $a0, $v0, $s2
/* CBC0C 800CB00C 0C032638 */  jal        __rmonReadWordAt
/* CBC10 800CB010 AE040020 */   sw        $a0, 0x20($s0)
/* CBC14 800CB014 00402821 */  addu       $a1, $v0, $zero
/* CBC18 800CB018 3C02FC00 */  lui        $v0, 0xfc00
/* CBC1C 800CB01C 3442003F */  ori        $v0, $v0, 0x3f
/* CBC20 800CB020 00A21024 */  and        $v0, $a1, $v0
/* CBC24 800CB024 2403000D */  addiu      $v1, $zero, 0xd
/* CBC28 800CB028 50430001 */  beql       $v0, $v1, .L800CB030
/* CBC2C 800CB02C 2405000D */   addiu     $a1, $zero, 0xd
.L800CB030:
/* CBC30 800CB030 3C028010 */  lui        $v0, %hi(__rmonRcpAtBreak)
/* CBC34 800CB034 90429EC0 */  lbu        $v0, %lo(__rmonRcpAtBreak)($v0)
/* CBC38 800CB038 10400005 */  beqz       $v0, .L800CB050
/* CBC3C 800CB03C 24020002 */   addiu     $v0, $zero, 2
/* CBC40 800CB040 A6020010 */  sh         $v0, 0x10($s0)
/* CBC44 800CB044 A6020024 */  sh         $v0, 0x24($s0)
/* CBC48 800CB048 24020004 */  addiu      $v0, $zero, 4
/* CBC4C 800CB04C A6020026 */  sh         $v0, 0x26($s0)
.L800CB050:
/* CBC50 800CB050 08032C4B */  j          .L800CB12C
/* CBC54 800CB054 AE05001C */   sw        $a1, 0x1c($s0)
.L800CB058:
/* CBC58 800CB058 0C03253C */  jal        rmonGetActiveQueue
/* CBC5C 800CB05C 00000000 */   nop
/* CBC60 800CB060 00402021 */  addu       $a0, $v0, $zero
/* CBC64 800CB064 8C830004 */  lw         $v1, 4($a0)
/* CBC68 800CB068 2402FFFF */  addiu      $v0, $zero, -1
/* CBC6C 800CB06C 1062000C */  beq        $v1, $v0, .L800CB0A0
/* CBC70 800CB070 2403FFFF */   addiu     $v1, $zero, -1
.L800CB074:
/* CBC74 800CB074 8C820014 */  lw         $v0, 0x14($a0)
/* CBC78 800CB078 10520005 */  beq        $v0, $s2, .L800CB090
/* CBC7C 800CB07C 00000000 */   nop
/* CBC80 800CB080 8C84000C */  lw         $a0, 0xc($a0)
/* CBC84 800CB084 8C820004 */  lw         $v0, 4($a0)
/* CBC88 800CB088 1443FFFA */  bne        $v0, $v1, .L800CB074
/* CBC8C 800CB08C 00000000 */   nop
.L800CB090:
/* CBC90 800CB090 8C830004 */  lw         $v1, 4($a0)
/* CBC94 800CB094 2402FFFF */  addiu      $v0, $zero, -1
/* CBC98 800CB098 54620003 */  bnel       $v1, $v0, .L800CB0A8
/* CBC9C 800CB09C AE030028 */   sw        $v1, 0x28($s0)
.L800CB0A0:
/* CBCA0 800CB0A0 08032C4C */  j          .L800CB130
/* CBCA4 800CB0A4 2402FFFE */   addiu     $v0, $zero, -2
.L800CB0A8:
/* CBCA8 800CB0A8 94830010 */  lhu        $v1, 0x10($a0)
/* CBCAC 800CB0AC 10600002 */  beqz       $v1, .L800CB0B8
/* CBCB0 800CB0B0 24020001 */   addiu     $v0, $zero, 1
/* CBCB4 800CB0B4 00601021 */  addu       $v0, $v1, $zero
.L800CB0B8:
/* CBCB8 800CB0B8 AE02000C */  sw         $v0, 0xc($s0)
/* CBCBC 800CB0BC 8C82011C */  lw         $v0, 0x11c($a0)
/* CBCC0 800CB0C0 AE020020 */  sw         $v0, 0x20($s0)
/* CBCC4 800CB0C4 8C82011C */  lw         $v0, 0x11c($a0)
/* CBCC8 800CB0C8 2403000D */  addiu      $v1, $zero, 0xd
/* CBCCC 800CB0CC 8C450000 */  lw         $a1, ($v0)
/* CBCD0 800CB0D0 3C02FC00 */  lui        $v0, 0xfc00
/* CBCD4 800CB0D4 3442003F */  ori        $v0, $v0, 0x3f
/* CBCD8 800CB0D8 00A21024 */  and        $v0, $a1, $v0
/* CBCDC 800CB0DC 50430001 */  beql       $v0, $v1, .L800CB0E4
/* CBCE0 800CB0E0 2405000D */   addiu     $a1, $zero, 0xd
.L800CB0E4:
/* CBCE4 800CB0E4 AE05001C */  sw         $a1, 0x1c($s0)
/* CBCE8 800CB0E8 AE04002C */  sw         $a0, 0x2c($s0)
/* CBCEC 800CB0EC 94830012 */  lhu        $v1, 0x12($a0)
/* CBCF0 800CB0F0 30620001 */  andi       $v0, $v1, 1
/* CBCF4 800CB0F4 10400006 */  beqz       $v0, .L800CB110
/* CBCF8 800CB0F8 24020002 */   addiu     $v0, $zero, 2
/* CBCFC 800CB0FC A6020010 */  sh         $v0, 0x10($s0)
/* CBD00 800CB100 A6020024 */  sh         $v0, 0x24($s0)
/* CBD04 800CB104 24020004 */  addiu      $v0, $zero, 4
/* CBD08 800CB108 08032C4B */  j          .L800CB12C
/* CBD0C 800CB10C A6020026 */   sh        $v0, 0x26($s0)
.L800CB110:
/* CBD10 800CB110 30620002 */  andi       $v0, $v1, 2
/* CBD14 800CB114 10400005 */  beqz       $v0, .L800CB12C
/* CBD18 800CB118 24030002 */   addiu     $v1, $zero, 2
/* CBD1C 800CB11C 24020001 */  addiu      $v0, $zero, 1
/* CBD20 800CB120 A6030010 */  sh         $v1, 0x10($s0)
/* CBD24 800CB124 A6020024 */  sh         $v0, 0x24($s0)
/* CBD28 800CB128 A6030026 */  sh         $v1, 0x26($s0)
.L800CB12C:
/* CBD2C 800CB12C 00001021 */  addu       $v0, $zero, $zero
.L800CB130:
/* CBD30 800CB130 8FBF001C */  lw         $ra, 0x1c($sp)
/* CBD34 800CB134 8FB20018 */  lw         $s2, 0x18($sp)
/* CBD38 800CB138 8FB10014 */  lw         $s1, 0x14($sp)
/* CBD3C 800CB13C 8FB00010 */  lw         $s0, 0x10($sp)
/* CBD40 800CB140 03E00008 */  jr         $ra
/* CBD44 800CB144 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonThreadStatus
/* CBD48 800CB148 27BDFF98 */  addiu      $sp, $sp, -0x68
/* CBD4C 800CB14C AFB00060 */  sw         $s0, 0x60($sp)
/* CBD50 800CB150 00808021 */  addu       $s0, $a0, $zero
/* CBD54 800CB154 AFBF0064 */  sw         $ra, 0x64($sp)
/* CBD58 800CB158 92040009 */  lbu        $a0, 9($s0)
/* CBD5C 800CB15C 8E05000C */  lw         $a1, 0xc($s0)
/* CBD60 800CB160 0C032BDC */  jal        __rmonGetThreadStatus
/* CBD64 800CB164 27A60010 */   addiu     $a2, $sp, 0x10
/* CBD68 800CB168 54400009 */  bnel       $v0, $zero, .L800CB190
/* CBD6C 800CB16C 2402FFFE */   addiu     $v0, $zero, -2
/* CBD70 800CB170 27A40010 */  addiu      $a0, $sp, 0x10
/* CBD74 800CB174 92020004 */  lbu        $v0, 4($s0)
/* CBD78 800CB178 2405004C */  addiu      $a1, $zero, 0x4c
/* CBD7C 800CB17C 24060001 */  addiu      $a2, $zero, 1
/* CBD80 800CB180 A7A00016 */  sh         $zero, 0x16($sp)
/* CBD84 800CB184 0C03255A */  jal        __rmonSendReply
/* CBD88 800CB188 A3A20014 */   sb        $v0, 0x14($sp)
/* CBD8C 800CB18C 00001021 */  addu       $v0, $zero, $zero
.L800CB190:
/* CBD90 800CB190 8FBF0064 */  lw         $ra, 0x64($sp)
/* CBD94 800CB194 8FB00060 */  lw         $s0, 0x60($sp)
/* CBD98 800CB198 03E00008 */  jr         $ra
/* CBD9C 800CB19C 27BD0068 */   addiu     $sp, $sp, 0x68

glabel __rmonStopThread
/* CBDA0 800CB1A0 27BDFF88 */  addiu      $sp, $sp, -0x78
/* CBDA4 800CB1A4 AFB20068 */  sw         $s2, 0x68($sp)
/* CBDA8 800CB1A8 00809021 */  addu       $s2, $a0, $zero
/* CBDAC 800CB1AC AFBF0070 */  sw         $ra, 0x70($sp)
/* CBDB0 800CB1B0 AFB3006C */  sw         $s3, 0x6c($sp)
/* CBDB4 800CB1B4 AFB10064 */  sw         $s1, 0x64($sp)
/* CBDB8 800CB1B8 AFB00060 */  sw         $s0, 0x60($sp)
/* CBDBC 800CB1BC 92430009 */  lbu        $v1, 9($s2)
/* CBDC0 800CB1C0 10600006 */  beqz       $v1, .L800CB1DC
/* CBDC4 800CB1C4 02409821 */   addu      $s3, $s2, $zero
/* CBDC8 800CB1C8 24020001 */  addiu      $v0, $zero, 1
/* CBDCC 800CB1CC 1062002E */  beq        $v1, $v0, .L800CB288
/* CBDD0 800CB1D0 2402FFFC */   addiu     $v0, $zero, -4
/* CBDD4 800CB1D4 08032CCE */  j          .L800CB338
/* CBDD8 800CB1D8 00000000 */   nop
.L800CB1DC:
/* CBDDC 800CB1DC 0C03253C */  jal        rmonGetActiveQueue
/* CBDE0 800CB1E0 8E51000C */   lw        $s1, 0xc($s2)
/* CBDE4 800CB1E4 12200017 */  beqz       $s1, .L800CB244
/* CBDE8 800CB1E8 00408021 */   addu      $s0, $v0, $zero
/* CBDEC 800CB1EC 8E030004 */  lw         $v1, 4($s0)
/* CBDF0 800CB1F0 2402FFFF */  addiu      $v0, $zero, -1
/* CBDF4 800CB1F4 10620038 */  beq        $v1, $v0, .L800CB2D8
/* CBDF8 800CB1F8 2403FFFF */   addiu     $v1, $zero, -1
.L800CB1FC:
/* CBDFC 800CB1FC 8E020014 */  lw         $v0, 0x14($s0)
/* CBE00 800CB200 10510005 */  beq        $v0, $s1, .L800CB218
/* CBE04 800CB204 00000000 */   nop
/* CBE08 800CB208 8E10000C */  lw         $s0, 0xc($s0)
/* CBE0C 800CB20C 8E020004 */  lw         $v0, 4($s0)
/* CBE10 800CB210 1443FFFA */  bne        $v0, $v1, .L800CB1FC
/* CBE14 800CB214 00000000 */   nop
.L800CB218:
/* CBE18 800CB218 8E030004 */  lw         $v1, 4($s0)
/* CBE1C 800CB21C 2402FFFF */  addiu      $v0, $zero, -1
/* CBE20 800CB220 1062002D */  beq        $v1, $v0, .L800CB2D8
/* CBE24 800CB224 2462FFFF */   addiu     $v0, $v1, -1
/* CBE28 800CB228 2C42007F */  sltiu      $v0, $v0, 0x7f
/* CBE2C 800CB22C 1040002A */  beqz       $v0, .L800CB2D8
/* CBE30 800CB230 00000000 */   nop
/* CBE34 800CB234 0C033500 */  jal        __rmonStopUserThreads
/* CBE38 800CB238 02002021 */   addu      $a0, $s0, $zero
/* CBE3C 800CB23C 08032CB6 */  j          .L800CB2D8
/* CBE40 800CB240 00000000 */   nop
.L800CB244:
/* CBE44 800CB244 8E030004 */  lw         $v1, 4($s0)
/* CBE48 800CB248 2402FFFF */  addiu      $v0, $zero, -1
/* CBE4C 800CB24C 10620022 */  beq        $v1, $v0, .L800CB2D8
/* CBE50 800CB250 2411FFFF */   addiu     $s1, $zero, -1
/* CBE54 800CB254 8E020004 */  lw         $v0, 4($s0)
/* CBE58 800CB258 2442FFFF */  addiu      $v0, $v0, -1
.L800CB25C:
/* CBE5C 800CB25C 2C42007F */  sltiu      $v0, $v0, 0x7f
/* CBE60 800CB260 10400003 */  beqz       $v0, .L800CB270
/* CBE64 800CB264 00000000 */   nop
/* CBE68 800CB268 0C033500 */  jal        __rmonStopUserThreads
/* CBE6C 800CB26C 02002021 */   addu      $a0, $s0, $zero
.L800CB270:
/* CBE70 800CB270 8E10000C */  lw         $s0, 0xc($s0)
/* CBE74 800CB274 8E020004 */  lw         $v0, 4($s0)
/* CBE78 800CB278 1451FFF8 */  bne        $v0, $s1, .L800CB25C
/* CBE7C 800CB27C 2442FFFF */   addiu     $v0, $v0, -1
/* CBE80 800CB280 08032CB6 */  j          .L800CB2D8
/* CBE84 800CB284 00000000 */   nop
.L800CB288:
/* CBE88 800CB288 0C032B08 */  jal        __rmonRCPrunning
/* CBE8C 800CB28C 00000000 */   nop
/* CBE90 800CB290 10400011 */  beqz       $v0, .L800CB2D8
/* CBE94 800CB294 00000000 */   nop
/* CBE98 800CB298 0C032B11 */  jal        __rmonIdleRCP
/* CBE9C 800CB29C 00000000 */   nop
/* CBEA0 800CB2A0 0C032638 */  jal        __rmonReadWordAt
/* CBEA4 800CB2A4 3C040408 */   lui       $a0, 0x408
/* CBEA8 800CB2A8 1040000B */  beqz       $v0, .L800CB2D8
/* CBEAC 800CB2AC 3C060400 */   lui       $a2, 0x400
/* CBEB0 800CB2B0 34C60FFC */  ori        $a2, $a2, 0xffc
/* CBEB4 800CB2B4 24040001 */  addiu      $a0, $zero, 1
/* CBEB8 800CB2B8 240503E8 */  addiu      $a1, $zero, 0x3e8
/* CBEBC 800CB2BC 0C03237B */  jal        __rmonGetBranchTarget
/* CBEC0 800CB2C0 00463021 */   addu      $a2, $v0, $a2
/* CBEC4 800CB2C4 30420003 */  andi       $v0, $v0, 3
/* CBEC8 800CB2C8 14400003 */  bnez       $v0, .L800CB2D8
/* CBECC 800CB2CC 00000000 */   nop
/* CBED0 800CB2D0 0C032B22 */  jal        __rmonStepRCP
/* CBED4 800CB2D4 00000000 */   nop
.L800CB2D8:
/* CBED8 800CB2D8 92640009 */  lbu        $a0, 9($s3)
/* CBEDC 800CB2DC 8E45000C */  lw         $a1, 0xc($s2)
/* CBEE0 800CB2E0 0C032BDC */  jal        __rmonGetThreadStatus
/* CBEE4 800CB2E4 27A60010 */   addiu     $a2, $sp, 0x10
/* CBEE8 800CB2E8 14400013 */  bnez       $v0, .L800CB338
/* CBEEC 800CB2EC 2402FFFE */   addiu     $v0, $zero, -2
/* CBEF0 800CB2F0 27A40010 */  addiu      $a0, $sp, 0x10
/* CBEF4 800CB2F4 92420004 */  lbu        $v0, 4($s2)
/* CBEF8 800CB2F8 2405004C */  addiu      $a1, $zero, 0x4c
/* CBEFC 800CB2FC 24060001 */  addiu      $a2, $zero, 1
/* CBF00 800CB300 A7A00016 */  sh         $zero, 0x16($sp)
/* CBF04 800CB304 0C03255A */  jal        __rmonSendReply
/* CBF08 800CB308 A3A20014 */   sb        $v0, 0x14($sp)
/* CBF0C 800CB30C 8FA3001C */  lw         $v1, 0x1c($sp)
/* CBF10 800CB310 24020001 */  addiu      $v0, $zero, 1
/* CBF14 800CB314 14620008 */  bne        $v1, $v0, .L800CB338
/* CBF18 800CB318 00001021 */   addu      $v0, $zero, $zero
/* CBF1C 800CB31C 24020004 */  addiu      $v0, $zero, 4
/* CBF20 800CB320 A3A20014 */  sb         $v0, 0x14($sp)
/* CBF24 800CB324 27A40010 */  addiu      $a0, $sp, 0x10
/* CBF28 800CB328 2405004C */  addiu      $a1, $zero, 0x4c
/* CBF2C 800CB32C 0C03255A */  jal        __rmonSendReply
/* CBF30 800CB330 24060002 */   addiu     $a2, $zero, 2
/* CBF34 800CB334 00001021 */  addu       $v0, $zero, $zero
.L800CB338:
/* CBF38 800CB338 8FBF0070 */  lw         $ra, 0x70($sp)
/* CBF3C 800CB33C 8FB3006C */  lw         $s3, 0x6c($sp)
/* CBF40 800CB340 8FB20068 */  lw         $s2, 0x68($sp)
/* CBF44 800CB344 8FB10064 */  lw         $s1, 0x64($sp)
/* CBF48 800CB348 8FB00060 */  lw         $s0, 0x60($sp)
/* CBF4C 800CB34C 03E00008 */  jr         $ra
/* CBF50 800CB350 27BD0078 */   addiu     $sp, $sp, 0x78

glabel __rmonRunThread
/* CBF54 800CB354 27BDFF80 */  addiu      $sp, $sp, -0x80
/* CBF58 800CB358 AFB10074 */  sw         $s1, 0x74($sp)
/* CBF5C 800CB35C 00808821 */  addu       $s1, $a0, $zero
/* CBF60 800CB360 AFBF007C */  sw         $ra, 0x7c($sp)
/* CBF64 800CB364 AFB20078 */  sw         $s2, 0x78($sp)
/* CBF68 800CB368 AFB00070 */  sw         $s0, 0x70($sp)
/* CBF6C 800CB36C 92230009 */  lbu        $v1, 9($s1)
/* CBF70 800CB370 10600005 */  beqz       $v1, .L800CB388
/* CBF74 800CB374 24020001 */   addiu     $v0, $zero, 1
/* CBF78 800CB378 1062002F */  beq        $v1, $v0, .L800CB438
/* CBF7C 800CB37C 2402FFFC */   addiu     $v0, $zero, -4
/* CBF80 800CB380 08032D5C */  j          .L800CB570
/* CBF84 800CB384 00000000 */   nop
.L800CB388:
/* CBF88 800CB388 0C03253C */  jal        rmonGetActiveQueue
/* CBF8C 800CB38C 00000000 */   nop
/* CBF90 800CB390 00408021 */  addu       $s0, $v0, $zero
/* CBF94 800CB394 8E030004 */  lw         $v1, 4($s0)
/* CBF98 800CB398 2402FFFF */  addiu      $v0, $zero, -1
/* CBF9C 800CB39C 1062000D */  beq        $v1, $v0, .L800CB3D4
/* CBFA0 800CB3A0 2404FFFF */   addiu     $a0, $zero, -1
/* CBFA4 800CB3A4 8E23000C */  lw         $v1, 0xc($s1)
.L800CB3A8:
/* CBFA8 800CB3A8 8E020014 */  lw         $v0, 0x14($s0)
/* CBFAC 800CB3AC 10430005 */  beq        $v0, $v1, .L800CB3C4
/* CBFB0 800CB3B0 00000000 */   nop
/* CBFB4 800CB3B4 8E10000C */  lw         $s0, 0xc($s0)
/* CBFB8 800CB3B8 8E020004 */  lw         $v0, 4($s0)
/* CBFBC 800CB3BC 1444FFFA */  bne        $v0, $a0, .L800CB3A8
/* CBFC0 800CB3C0 00000000 */   nop
.L800CB3C4:
/* CBFC4 800CB3C4 8E030004 */  lw         $v1, 4($s0)
/* CBFC8 800CB3C8 2402FFFF */  addiu      $v0, $zero, -1
/* CBFCC 800CB3CC 14620003 */  bne        $v1, $v0, .L800CB3DC
/* CBFD0 800CB3D0 24020001 */   addiu     $v0, $zero, 1
.L800CB3D4:
/* CBFD4 800CB3D4 08032D5C */  j          .L800CB570
/* CBFD8 800CB3D8 2402FFFE */   addiu     $v0, $zero, -2
.L800CB3DC:
/* CBFDC 800CB3DC 96030010 */  lhu        $v1, 0x10($s0)
/* CBFE0 800CB3E0 14620063 */  bne        $v1, $v0, .L800CB570
/* CBFE4 800CB3E4 2402FFFC */   addiu     $v0, $zero, -4
/* CBFE8 800CB3E8 96020012 */  lhu        $v0, 0x12($s0)
/* CBFEC 800CB3EC 3042FFFC */  andi       $v0, $v0, 0xfffc
/* CBFF0 800CB3F0 A6020012 */  sh         $v0, 0x12($s0)
/* CBFF4 800CB3F4 8E220010 */  lw         $v0, 0x10($s1)
/* CBFF8 800CB3F8 30420002 */  andi       $v0, $v0, 2
/* CBFFC 800CB3FC 10400003 */  beqz       $v0, .L800CB40C
/* CC000 800CB400 00000000 */   nop
/* CC004 800CB404 8E220014 */  lw         $v0, 0x14($s1)
/* CC008 800CB408 AE02011C */  sw         $v0, 0x11c($s0)
.L800CB40C:
/* CC00C 800CB40C 8E220010 */  lw         $v0, 0x10($s1)
/* CC010 800CB410 30420001 */  andi       $v0, $v0, 1
/* CC014 800CB414 10400048 */  beqz       $v0, .L800CB538
/* CC018 800CB418 24120001 */   addiu     $s2, $zero, 1
/* CC01C 800CB41C 8E24000C */  lw         $a0, 0xc($s1)
/* CC020 800CB420 0C0323DB */  jal        __rmonSetSingleStep
/* CC024 800CB424 8E05011C */   lw        $a1, 0x11c($s0)
/* CC028 800CB428 10400051 */  beqz       $v0, .L800CB570
/* CC02C 800CB42C 2402FFFC */   addiu     $v0, $zero, -4
/* CC030 800CB430 08032D4E */  j          .L800CB538
/* CC034 800CB434 00000000 */   nop
.L800CB438:
/* CC038 800CB438 0C032B08 */  jal        __rmonRCPrunning
/* CC03C 800CB43C 00000000 */   nop
/* CC040 800CB440 1440004B */  bnez       $v0, .L800CB570
/* CC044 800CB444 2402FFFC */   addiu     $v0, $zero, -4
/* CC048 800CB448 8E220010 */  lw         $v0, 0x10($s1)
/* CC04C 800CB44C 30420002 */  andi       $v0, $v0, 2
/* CC050 800CB450 10400006 */  beqz       $v0, .L800CB46C
/* CC054 800CB454 3C02FBFF */   lui       $v0, 0xfbff
/* CC058 800CB458 8E250014 */  lw         $a1, 0x14($s1)
/* CC05C 800CB45C 3442F000 */  ori        $v0, $v0, 0xf000
/* CC060 800CB460 3C040408 */  lui        $a0, 0x408
/* CC064 800CB464 0C032628 */  jal        __rmonWriteWordTo
/* CC068 800CB468 00A22821 */   addu      $a1, $a1, $v0
.L800CB46C:
/* CC06C 800CB46C 8E220010 */  lw         $v0, 0x10($s1)
/* CC070 800CB470 30420001 */  andi       $v0, $v0, 1
/* CC074 800CB474 10400014 */  beqz       $v0, .L800CB4C8
/* CC078 800CB478 00000000 */   nop
/* CC07C 800CB47C 0C032638 */  jal        __rmonReadWordAt
/* CC080 800CB480 3C040408 */   lui       $a0, 0x408
/* CC084 800CB484 3C060400 */  lui        $a2, 0x400
/* CC088 800CB488 34C61000 */  ori        $a2, $a2, 0x1000
/* CC08C 800CB48C 24040001 */  addiu      $a0, $zero, 1
/* CC090 800CB490 240503E8 */  addiu      $a1, $zero, 0x3e8
/* CC094 800CB494 0C03237B */  jal        __rmonGetBranchTarget
/* CC098 800CB498 00463021 */   addu      $a2, $v0, $a2
/* CC09C 800CB49C 30420003 */  andi       $v0, $v0, 3
/* CC0A0 800CB4A0 14400003 */  bnez       $v0, .L800CB4B0
/* CC0A4 800CB4A4 00000000 */   nop
/* CC0A8 800CB4A8 0C032B22 */  jal        __rmonStepRCP
/* CC0AC 800CB4AC 00000000 */   nop
.L800CB4B0:
/* CC0B0 800CB4B0 0C032B22 */  jal        __rmonStepRCP
/* CC0B4 800CB4B4 00000000 */   nop
/* CC0B8 800CB4B8 24020001 */  addiu      $v0, $zero, 1
/* CC0BC 800CB4BC 3C018010 */  lui        $at, %hi(__rmonRcpAtBreak)
/* CC0C0 800CB4C0 08032D35 */  j          .L800CB4D4
/* CC0C4 800CB4C4 A0229EC0 */   sb        $v0, %lo(__rmonRcpAtBreak)($at)
.L800CB4C8:
/* CC0C8 800CB4C8 3C018010 */  lui        $at, %hi(__rmonRcpAtBreak)
/* CC0CC 800CB4CC 0C032B27 */  jal        __rmonRunRCP
/* CC0D0 800CB4D0 A0209EC0 */   sb        $zero, %lo(__rmonRcpAtBreak)($at)
.L800CB4D4:
/* CC0D4 800CB4D4 92220004 */  lbu        $v0, 4($s1)
/* CC0D8 800CB4D8 27A40010 */  addiu      $a0, $sp, 0x10
/* CC0DC 800CB4DC A7A00016 */  sh         $zero, 0x16($sp)
/* CC0E0 800CB4E0 A3A20014 */  sb         $v0, 0x14($sp)
/* CC0E4 800CB4E4 8E22000C */  lw         $v0, 0xc($s1)
/* CC0E8 800CB4E8 24050010 */  addiu      $a1, $zero, 0x10
/* CC0EC 800CB4EC 24060001 */  addiu      $a2, $zero, 1
/* CC0F0 800CB4F0 0C03255A */  jal        __rmonSendReply
/* CC0F4 800CB4F4 AFA2001C */   sw        $v0, 0x1c($sp)
/* CC0F8 800CB4F8 8E220010 */  lw         $v0, 0x10($s1)
/* CC0FC 800CB4FC 30420001 */  andi       $v0, $v0, 1
/* CC100 800CB500 1040000B */  beqz       $v0, .L800CB530
/* CC104 800CB504 24040001 */   addiu     $a0, $zero, 1
/* CC108 800CB508 240503E8 */  addiu      $a1, $zero, 0x3e8
/* CC10C 800CB50C 27B00020 */  addiu      $s0, $sp, 0x20
/* CC110 800CB510 0C032BDC */  jal        __rmonGetThreadStatus
/* CC114 800CB514 02003021 */   addu      $a2, $s0, $zero
/* CC118 800CB518 0C032446 */  jal        __rmonGetExceptionStatus
/* CC11C 800CB51C 02002021 */   addu      $a0, $s0, $zero
/* CC120 800CB520 02002021 */  addu       $a0, $s0, $zero
/* CC124 800CB524 2405004C */  addiu      $a1, $zero, 0x4c
/* CC128 800CB528 0C03255A */  jal        __rmonSendReply
/* CC12C 800CB52C 24060002 */   addiu     $a2, $zero, 2
.L800CB530:
/* CC130 800CB530 08032D5C */  j          .L800CB570
/* CC134 800CB534 00001021 */   addu      $v0, $zero, $zero
.L800CB538:
/* CC138 800CB538 92220004 */  lbu        $v0, 4($s1)
/* CC13C 800CB53C 27A40010 */  addiu      $a0, $sp, 0x10
/* CC140 800CB540 A7A00016 */  sh         $zero, 0x16($sp)
/* CC144 800CB544 A3A20014 */  sb         $v0, 0x14($sp)
/* CC148 800CB548 8E22000C */  lw         $v0, 0xc($s1)
/* CC14C 800CB54C 24050010 */  addiu      $a1, $zero, 0x10
/* CC150 800CB550 24060001 */  addiu      $a2, $zero, 1
/* CC154 800CB554 0C03255A */  jal        __rmonSendReply
/* CC158 800CB558 AFA2001C */   sw        $v0, 0x1c($sp)
/* CC15C 800CB55C 12400004 */  beqz       $s2, .L800CB570
/* CC160 800CB560 24020001 */   addiu     $v0, $zero, 1
/* CC164 800CB564 0C0334B8 */  jal        osStartThread
/* CC168 800CB568 02002021 */   addu      $a0, $s0, $zero
/* CC16C 800CB56C 24020001 */  addiu      $v0, $zero, 1
.L800CB570:
/* CC170 800CB570 8FBF007C */  lw         $ra, 0x7c($sp)
/* CC174 800CB574 8FB20078 */  lw         $s2, 0x78($sp)
/* CC178 800CB578 8FB10074 */  lw         $s1, 0x74($sp)
/* CC17C 800CB57C 8FB00070 */  lw         $s0, 0x70($sp)
/* CC180 800CB580 03E00008 */  jr         $ra
/* CC184 800CB584 27BD0080 */   addiu     $sp, $sp, 0x80
/* CC188 800CB588 00000000 */  nop
/* CC18C 800CB58C 00000000 */  nop
