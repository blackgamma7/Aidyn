.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonGetGRegisters
/* CAD60 800CA160 27BDFF40 */  addiu      $sp, $sp, -0xc0
/* CAD64 800CA164 AFBF00B8 */  sw         $ra, 0xb8($sp)
/* CAD68 800CA168 8C82000C */  lw         $v0, 0xc($a0)
/* CAD6C 800CA16C AFA2001C */  sw         $v0, 0x1c($sp)
/* CAD70 800CA170 90820004 */  lbu        $v0, 4($a0)
/* CAD74 800CA174 A7A00016 */  sh         $zero, 0x16($sp)
/* CAD78 800CA178 A3A20014 */  sb         $v0, 0x14($sp)
/* CAD7C 800CA17C 90820009 */  lbu        $v0, 9($a0)
/* CAD80 800CA180 1440002A */  bnez       $v0, .L800CA22C
/* CAD84 800CA184 2402FFFE */   addiu     $v0, $zero, -2
/* CAD88 800CA188 8C84000C */  lw         $a0, 0xc($a0)
/* CAD8C 800CA18C 0C032B4A */  jal        __rmonGetTCB
/* CAD90 800CA190 00000000 */   nop
/* CAD94 800CA194 00403821 */  addu       $a3, $v0, $zero
/* CAD98 800CA198 14E00003 */  bnez       $a3, .L800CA1A8
/* CAD9C 800CA19C 24050001 */   addiu     $a1, $zero, 1
/* CADA0 800CA1A0 0803288B */  j          .L800CA22C
/* CADA4 800CA1A4 2402FFFE */   addiu     $v0, $zero, -2
.L800CA1A8:
/* CADA8 800CA1A8 24E40020 */  addiu      $a0, $a3, 0x20
/* CADAC 800CA1AC 27A60014 */  addiu      $a2, $sp, 0x14
.L800CA1B0:
/* CADB0 800CA1B0 8C820000 */  lw         $v0, ($a0)
/* CADB4 800CA1B4 8C830004 */  lw         $v1, 4($a0)
/* CADB8 800CA1B8 24A50001 */  addiu      $a1, $a1, 1
/* CADBC 800CA1BC 24840008 */  addiu      $a0, $a0, 8
/* CADC0 800CA1C0 ACC30010 */  sw         $v1, 0x10($a2)
/* CADC4 800CA1C4 28A2001A */  slti       $v0, $a1, 0x1a
/* CADC8 800CA1C8 1440FFF9 */  bnez       $v0, .L800CA1B0
/* CADCC 800CA1CC 24C60004 */   addiu     $a2, $a2, 4
/* CADD0 800CA1D0 2405001C */  addiu      $a1, $zero, 0x1c
/* CADD4 800CA1D4 24E400E8 */  addiu      $a0, $a3, 0xe8
/* CADD8 800CA1D8 27A60080 */  addiu      $a2, $sp, 0x80
.L800CA1DC:
/* CADDC 800CA1DC 8C820000 */  lw         $v0, ($a0)
/* CADE0 800CA1E0 8C830004 */  lw         $v1, 4($a0)
/* CADE4 800CA1E4 24A50001 */  addiu      $a1, $a1, 1
/* CADE8 800CA1E8 24840008 */  addiu      $a0, $a0, 8
/* CADEC 800CA1EC ACC30010 */  sw         $v1, 0x10($a2)
/* CADF0 800CA1F0 28A20022 */  slti       $v0, $a1, 0x22
/* CADF4 800CA1F4 1440FFF9 */  bnez       $v0, .L800CA1DC
/* CADF8 800CA1F8 24C60004 */   addiu     $a2, $a2, 4
/* CADFC 800CA1FC 8CE20120 */  lw         $v0, 0x120($a3)
/* CAE00 800CA200 AFA200A8 */  sw         $v0, 0xa8($sp)
/* CAE04 800CA204 8CE2011C */  lw         $v0, 0x11c($a3)
/* CAE08 800CA208 AFA200AC */  sw         $v0, 0xac($sp)
/* CAE0C 800CA20C 8CE20118 */  lw         $v0, 0x118($a3)
/* CAE10 800CA210 AFA00020 */  sw         $zero, 0x20($sp)
/* CAE14 800CA214 AFA200B0 */  sw         $v0, 0xb0($sp)
/* CAE18 800CA218 27A40010 */  addiu      $a0, $sp, 0x10
/* CAE1C 800CA21C 240500A4 */  addiu      $a1, $zero, 0xa4
/* CAE20 800CA220 0C03255A */  jal        __rmonSendReply
/* CAE24 800CA224 24060001 */   addiu     $a2, $zero, 1
/* CAE28 800CA228 00001021 */  addu       $v0, $zero, $zero
.L800CA22C:
/* CAE2C 800CA22C 8FBF00B8 */  lw         $ra, 0xb8($sp)
/* CAE30 800CA230 03E00008 */  jr         $ra
/* CAE34 800CA234 27BD00C0 */   addiu     $sp, $sp, 0xc0

glabel __rmonSetGRegisters
/* CAE38 800CA238 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CAE3C 800CA23C AFB00020 */  sw         $s0, 0x20($sp)
/* CAE40 800CA240 00808021 */  addu       $s0, $a0, $zero
/* CAE44 800CA244 AFBF0024 */  sw         $ra, 0x24($sp)
/* CAE48 800CA248 92020009 */  lbu        $v0, 9($s0)
/* CAE4C 800CA24C 14400032 */  bnez       $v0, .L800CA318
/* CAE50 800CA250 2402FFFE */   addiu     $v0, $zero, -2
/* CAE54 800CA254 8E04000C */  lw         $a0, 0xc($s0)
/* CAE58 800CA258 0C032B4A */  jal        __rmonGetTCB
/* CAE5C 800CA25C 00000000 */   nop
/* CAE60 800CA260 00404021 */  addu       $t0, $v0, $zero
/* CAE64 800CA264 15000003 */  bnez       $t0, .L800CA274
/* CAE68 800CA268 24060001 */   addiu     $a2, $zero, 1
/* CAE6C 800CA26C 080328C6 */  j          .L800CA318
/* CAE70 800CA270 2402FFFE */   addiu     $v0, $zero, -2
.L800CA274:
/* CAE74 800CA274 25050020 */  addiu      $a1, $t0, 0x20
/* CAE78 800CA278 26070004 */  addiu      $a3, $s0, 4
.L800CA27C:
/* CAE7C 800CA27C 8CE40010 */  lw         $a0, 0x10($a3)
/* CAE80 800CA280 24E70004 */  addiu      $a3, $a3, 4
/* CAE84 800CA284 24C60001 */  addiu      $a2, $a2, 1
/* CAE88 800CA288 00801821 */  addu       $v1, $a0, $zero
/* CAE8C 800CA28C 000417C3 */  sra        $v0, $a0, 0x1f
/* CAE90 800CA290 ACA20000 */  sw         $v0, ($a1)
/* CAE94 800CA294 ACA30004 */  sw         $v1, 4($a1)
/* CAE98 800CA298 28C2001A */  slti       $v0, $a2, 0x1a
/* CAE9C 800CA29C 1440FFF7 */  bnez       $v0, .L800CA27C
/* CAEA0 800CA2A0 24A50008 */   addiu     $a1, $a1, 8
/* CAEA4 800CA2A4 2406001C */  addiu      $a2, $zero, 0x1c
/* CAEA8 800CA2A8 250500E8 */  addiu      $a1, $t0, 0xe8
/* CAEAC 800CA2AC 26070070 */  addiu      $a3, $s0, 0x70
.L800CA2B0:
/* CAEB0 800CA2B0 8CE40010 */  lw         $a0, 0x10($a3)
/* CAEB4 800CA2B4 24E70004 */  addiu      $a3, $a3, 4
/* CAEB8 800CA2B8 24C60001 */  addiu      $a2, $a2, 1
/* CAEBC 800CA2BC 00801821 */  addu       $v1, $a0, $zero
/* CAEC0 800CA2C0 000417C3 */  sra        $v0, $a0, 0x1f
/* CAEC4 800CA2C4 ACA20000 */  sw         $v0, ($a1)
/* CAEC8 800CA2C8 ACA30004 */  sw         $v1, 4($a1)
/* CAECC 800CA2CC 28C20022 */  slti       $v0, $a2, 0x22
/* CAED0 800CA2D0 1440FFF7 */  bnez       $v0, .L800CA2B0
/* CAED4 800CA2D4 24A50008 */   addiu     $a1, $a1, 8
/* CAED8 800CA2D8 8E020098 */  lw         $v0, 0x98($s0)
/* CAEDC 800CA2DC AD020120 */  sw         $v0, 0x120($t0)
/* CAEE0 800CA2E0 8E02009C */  lw         $v0, 0x9c($s0)
/* CAEE4 800CA2E4 AD02011C */  sw         $v0, 0x11c($t0)
/* CAEE8 800CA2E8 8E0200A0 */  lw         $v0, 0xa0($s0)
/* CAEEC 800CA2EC AD020118 */  sw         $v0, 0x118($t0)
/* CAEF0 800CA2F0 8E02000C */  lw         $v0, 0xc($s0)
/* CAEF4 800CA2F4 27A40010 */  addiu      $a0, $sp, 0x10
/* CAEF8 800CA2F8 AFA2001C */  sw         $v0, 0x1c($sp)
/* CAEFC 800CA2FC 92020004 */  lbu        $v0, 4($s0)
/* CAF00 800CA300 24050010 */  addiu      $a1, $zero, 0x10
/* CAF04 800CA304 24060001 */  addiu      $a2, $zero, 1
/* CAF08 800CA308 A7A00016 */  sh         $zero, 0x16($sp)
/* CAF0C 800CA30C 0C03255A */  jal        __rmonSendReply
/* CAF10 800CA310 A3A20014 */   sb        $v0, 0x14($sp)
/* CAF14 800CA314 00001021 */  addu       $v0, $zero, $zero
.L800CA318:
/* CAF18 800CA318 8FBF0024 */  lw         $ra, 0x24($sp)
/* CAF1C 800CA31C 8FB00020 */  lw         $s0, 0x20($sp)
/* CAF20 800CA320 03E00008 */  jr         $ra
/* CAF24 800CA324 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __rmonGetFRegisters
/* CAF28 800CA328 27BDFF40 */  addiu      $sp, $sp, -0xc0
/* CAF2C 800CA32C AFBF00B8 */  sw         $ra, 0xb8($sp)
/* CAF30 800CA330 AFB100B4 */  sw         $s1, 0xb4($sp)
/* CAF34 800CA334 AFB000B0 */  sw         $s0, 0xb0($sp)
/* CAF38 800CA338 90820009 */  lbu        $v0, 9($a0)
/* CAF3C 800CA33C 14400017 */  bnez       $v0, .L800CA39C
/* CAF40 800CA340 00808821 */   addu      $s1, $a0, $zero
/* CAF44 800CA344 8E24000C */  lw         $a0, 0xc($s1)
/* CAF48 800CA348 0C032B4A */  jal        __rmonGetTCB
/* CAF4C 800CA34C AFA000A8 */   sw        $zero, 0xa8($sp)
/* CAF50 800CA350 00408021 */  addu       $s0, $v0, $zero
/* CAF54 800CA354 12000011 */  beqz       $s0, .L800CA39C
/* CAF58 800CA358 27A40020 */   addiu     $a0, $sp, 0x20
/* CAF5C 800CA35C 26050130 */  addiu      $a1, $s0, 0x130
/* CAF60 800CA360 0C032654 */  jal        __rmonCopyWords
/* CAF64 800CA364 24060020 */   addiu     $a2, $zero, 0x20
/* CAF68 800CA368 8E02012C */  lw         $v0, 0x12c($s0)
/* CAF6C 800CA36C AFA200A0 */  sw         $v0, 0xa0($sp)
/* CAF70 800CA370 92220004 */  lbu        $v0, 4($s1)
/* CAF74 800CA374 27A40010 */  addiu      $a0, $sp, 0x10
/* CAF78 800CA378 A7A00016 */  sh         $zero, 0x16($sp)
/* CAF7C 800CA37C A3A20014 */  sb         $v0, 0x14($sp)
/* CAF80 800CA380 8E22000C */  lw         $v0, 0xc($s1)
/* CAF84 800CA384 24050098 */  addiu      $a1, $zero, 0x98
/* CAF88 800CA388 24060001 */  addiu      $a2, $zero, 1
/* CAF8C 800CA38C 0C03255A */  jal        __rmonSendReply
/* CAF90 800CA390 AFA2001C */   sw        $v0, 0x1c($sp)
/* CAF94 800CA394 080328E8 */  j          .L800CA3A0
/* CAF98 800CA398 00001021 */   addu      $v0, $zero, $zero
.L800CA39C:
/* CAF9C 800CA39C 2402FFFE */  addiu      $v0, $zero, -2
.L800CA3A0:
/* CAFA0 800CA3A0 8FBF00B8 */  lw         $ra, 0xb8($sp)
/* CAFA4 800CA3A4 8FB100B4 */  lw         $s1, 0xb4($sp)
/* CAFA8 800CA3A8 8FB000B0 */  lw         $s0, 0xb0($sp)
/* CAFAC 800CA3AC 03E00008 */  jr         $ra
/* CAFB0 800CA3B0 27BD00C0 */   addiu     $sp, $sp, 0xc0

glabel __rmonSetFRegisters
/* CAFB4 800CA3B4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CAFB8 800CA3B8 AFBF0030 */  sw         $ra, 0x30($sp)
/* CAFBC 800CA3BC AFB1002C */  sw         $s1, 0x2c($sp)
/* CAFC0 800CA3C0 AFB00028 */  sw         $s0, 0x28($sp)
/* CAFC4 800CA3C4 90820009 */  lbu        $v0, 9($a0)
/* CAFC8 800CA3C8 14400017 */  bnez       $v0, .L800CA428
/* CAFCC 800CA3CC 00808821 */   addu      $s1, $a0, $zero
/* CAFD0 800CA3D0 8E24000C */  lw         $a0, 0xc($s1)
/* CAFD4 800CA3D4 0C032B4A */  jal        __rmonGetTCB
/* CAFD8 800CA3D8 AFA00020 */   sw        $zero, 0x20($sp)
/* CAFDC 800CA3DC 00408021 */  addu       $s0, $v0, $zero
/* CAFE0 800CA3E0 12000011 */  beqz       $s0, .L800CA428
/* CAFE4 800CA3E4 26040130 */   addiu     $a0, $s0, 0x130
/* CAFE8 800CA3E8 26250010 */  addiu      $a1, $s1, 0x10
/* CAFEC 800CA3EC 0C032654 */  jal        __rmonCopyWords
/* CAFF0 800CA3F0 24060020 */   addiu     $a2, $zero, 0x20
/* CAFF4 800CA3F4 8E220090 */  lw         $v0, 0x90($s1)
/* CAFF8 800CA3F8 AE02012C */  sw         $v0, 0x12c($s0)
/* CAFFC 800CA3FC 8E22000C */  lw         $v0, 0xc($s1)
/* CB000 800CA400 27A40010 */  addiu      $a0, $sp, 0x10
/* CB004 800CA404 AFA2001C */  sw         $v0, 0x1c($sp)
/* CB008 800CA408 92220004 */  lbu        $v0, 4($s1)
/* CB00C 800CA40C 24050010 */  addiu      $a1, $zero, 0x10
/* CB010 800CA410 24060001 */  addiu      $a2, $zero, 1
/* CB014 800CA414 A7A00016 */  sh         $zero, 0x16($sp)
/* CB018 800CA418 0C03255A */  jal        __rmonSendReply
/* CB01C 800CA41C A3A20014 */   sb        $v0, 0x14($sp)
/* CB020 800CA420 0803290B */  j          .L800CA42C
/* CB024 800CA424 00001021 */   addu      $v0, $zero, $zero
.L800CA428:
/* CB028 800CA428 2402FFFE */  addiu      $v0, $zero, -2
.L800CA42C:
/* CB02C 800CA42C 8FBF0030 */  lw         $ra, 0x30($sp)
/* CB030 800CA430 8FB1002C */  lw         $s1, 0x2c($sp)
/* CB034 800CA434 8FB00028 */  lw         $s0, 0x28($sp)
/* CB038 800CA438 03E00008 */  jr         $ra
/* CB03C 800CA43C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel rmonGetRcpRegister
/* CB040 800CA440 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CB044 800CA444 AFB00010 */  sw         $s0, 0x10($sp)
/* CB048 800CA448 AFBF0014 */  sw         $ra, 0x14($sp)
/* CB04C 800CA44C 0C032B08 */  jal        __rmonRCPrunning
/* CB050 800CA450 00808021 */   addu      $s0, $a0, $zero
/* CB054 800CA454 5440002B */  bnel       $v0, $zero, .L800CA504
/* CB058 800CA458 00001021 */   addu      $v0, $zero, $zero
/* CB05C 800CA45C 0C032638 */  jal        __rmonReadWordAt
/* CB060 800CA460 3C040408 */   lui       $a0, 0x408
/* CB064 800CA464 3C040400 */  lui        $a0, 0x400
/* CB068 800CA468 3C018010 */  lui        $at, %hi(rmonregs_bss_0000)
/* CB06C 800CA46C AC22E680 */  sw         $v0, %lo(rmonregs_bss_0000)($at)
/* CB070 800CA470 0C032638 */  jal        __rmonReadWordAt
/* CB074 800CA474 34841000 */   ori       $a0, $a0, 0x1000
/* CB078 800CA478 3C018010 */  lui        $at, %hi(rmonregs_bss_0004)
/* CB07C 800CA47C AC22E684 */  sw         $v0, %lo(rmonregs_bss_0004)($at)
/* CB080 800CA480 0C032638 */  jal        __rmonReadWordAt
/* CB084 800CA484 3C040400 */   lui       $a0, 0x400
/* CB088 800CA488 3C03AC00 */  lui        $v1, 0xac00
/* CB08C 800CA48C 3C040400 */  lui        $a0, 0x400
/* CB090 800CA490 34841000 */  ori        $a0, $a0, 0x1000
/* CB094 800CA494 3205001F */  andi       $a1, $s0, 0x1f
/* CB098 800CA498 00052C00 */  sll        $a1, $a1, 0x10
/* CB09C 800CA49C 3C018010 */  lui        $at, %hi(rmonregs_bss_0008)
/* CB0A0 800CA4A0 AC22E688 */  sw         $v0, %lo(rmonregs_bss_0008)($at)
/* CB0A4 800CA4A4 0C032628 */  jal        __rmonWriteWordTo
/* CB0A8 800CA4A8 00A32825 */   or        $a1, $a1, $v1
/* CB0AC 800CA4AC 3C040408 */  lui        $a0, 0x408
/* CB0B0 800CA4B0 0C032628 */  jal        __rmonWriteWordTo
/* CB0B4 800CA4B4 00002821 */   addu      $a1, $zero, $zero
/* CB0B8 800CA4B8 0C032B22 */  jal        __rmonStepRCP
/* CB0BC 800CA4BC 00000000 */   nop
/* CB0C0 800CA4C0 0C032638 */  jal        __rmonReadWordAt
/* CB0C4 800CA4C4 3C040400 */   lui       $a0, 0x400
/* CB0C8 800CA4C8 3C058010 */  lui        $a1, %hi(rmonregs_bss_0008)
/* CB0CC 800CA4CC 8CA5E688 */  lw         $a1, %lo(rmonregs_bss_0008)($a1)
/* CB0D0 800CA4D0 3C040400 */  lui        $a0, 0x400
/* CB0D4 800CA4D4 0C032628 */  jal        __rmonWriteWordTo
/* CB0D8 800CA4D8 00408021 */   addu      $s0, $v0, $zero
/* CB0DC 800CA4DC 3C058010 */  lui        $a1, %hi(rmonregs_bss_0004)
/* CB0E0 800CA4E0 8CA5E684 */  lw         $a1, %lo(rmonregs_bss_0004)($a1)
/* CB0E4 800CA4E4 3C040400 */  lui        $a0, 0x400
/* CB0E8 800CA4E8 0C032628 */  jal        __rmonWriteWordTo
/* CB0EC 800CA4EC 34841000 */   ori       $a0, $a0, 0x1000
/* CB0F0 800CA4F0 3C058010 */  lui        $a1, %hi(rmonregs_bss_0000)
/* CB0F4 800CA4F4 8CA5E680 */  lw         $a1, %lo(rmonregs_bss_0000)($a1)
/* CB0F8 800CA4F8 0C032628 */  jal        __rmonWriteWordTo
/* CB0FC 800CA4FC 3C040408 */   lui       $a0, 0x408
/* CB100 800CA500 02001021 */  addu       $v0, $s0, $zero
.L800CA504:
/* CB104 800CA504 8FBF0014 */  lw         $ra, 0x14($sp)
/* CB108 800CA508 8FB00010 */  lw         $s0, 0x10($sp)
/* CB10C 800CA50C 03E00008 */  jr         $ra
/* CB110 800CA510 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __rmonGetSRegs
/* CB114 800CA514 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* CB118 800CA518 AFB000C0 */  sw         $s0, 0xc0($sp)
/* CB11C 800CA51C 00808021 */  addu       $s0, $a0, $zero
/* CB120 800CA520 AFBF00C8 */  sw         $ra, 0xc8($sp)
/* CB124 800CA524 0C032B08 */  jal        __rmonRCPrunning
/* CB128 800CA528 AFB100C4 */   sw        $s1, 0xc4($sp)
/* CB12C 800CA52C 1440005A */  bnez       $v0, .L800CA698
/* CB130 800CA530 2402FFFC */   addiu     $v0, $zero, -4
/* CB134 800CA534 8E02000C */  lw         $v0, 0xc($s0)
/* CB138 800CA538 3C040408 */  lui        $a0, 0x408
/* CB13C 800CA53C AFA2001C */  sw         $v0, 0x1c($sp)
/* CB140 800CA540 92020004 */  lbu        $v0, 4($s0)
/* CB144 800CA544 27B10010 */  addiu      $s1, $sp, 0x10
/* CB148 800CA548 00008021 */  addu       $s0, $zero, $zero
/* CB14C 800CA54C A7A00016 */  sh         $zero, 0x16($sp)
/* CB150 800CA550 0C032638 */  jal        __rmonReadWordAt
/* CB154 800CA554 A3A20014 */   sb        $v0, 0x14($sp)
/* CB158 800CA558 3C040400 */  lui        $a0, 0x400
/* CB15C 800CA55C 3C018010 */  lui        $at, %hi(rmonregs_bss_0000)
/* CB160 800CA560 AC22E680 */  sw         $v0, %lo(rmonregs_bss_0000)($at)
/* CB164 800CA564 0C032638 */  jal        __rmonReadWordAt
/* CB168 800CA568 34841000 */   ori       $a0, $a0, 0x1000
/* CB16C 800CA56C 3C018010 */  lui        $at, %hi(rmonregs_bss_0004)
/* CB170 800CA570 AC22E684 */  sw         $v0, %lo(rmonregs_bss_0004)($at)
/* CB174 800CA574 0C032638 */  jal        __rmonReadWordAt
/* CB178 800CA578 3C040400 */   lui       $a0, 0x400
/* CB17C 800CA57C 3C018010 */  lui        $at, %hi(rmonregs_bss_0008)
/* CB180 800CA580 AC22E688 */  sw         $v0, %lo(rmonregs_bss_0008)($at)
.L800CA584:
/* CB184 800CA584 3C02AC00 */  lui        $v0, 0xac00
/* CB188 800CA588 3C040400 */  lui        $a0, 0x400
/* CB18C 800CA58C 34841000 */  ori        $a0, $a0, 0x1000
/* CB190 800CA590 3205001F */  andi       $a1, $s0, 0x1f
/* CB194 800CA594 00052C00 */  sll        $a1, $a1, 0x10
/* CB198 800CA598 0C032628 */  jal        __rmonWriteWordTo
/* CB19C 800CA59C 00A22825 */   or        $a1, $a1, $v0
/* CB1A0 800CA5A0 3C040408 */  lui        $a0, 0x408
/* CB1A4 800CA5A4 0C032628 */  jal        __rmonWriteWordTo
/* CB1A8 800CA5A8 00002821 */   addu      $a1, $zero, $zero
/* CB1AC 800CA5AC 0C032B22 */  jal        __rmonStepRCP
/* CB1B0 800CA5B0 26100001 */   addiu     $s0, $s0, 1
/* CB1B4 800CA5B4 0C032638 */  jal        __rmonReadWordAt
/* CB1B8 800CA5B8 3C040400 */   lui       $a0, 0x400
/* CB1BC 800CA5BC AE220010 */  sw         $v0, 0x10($s1)
/* CB1C0 800CA5C0 2A020020 */  slti       $v0, $s0, 0x20
/* CB1C4 800CA5C4 1440FFEF */  bnez       $v0, .L800CA584
/* CB1C8 800CA5C8 26310004 */   addiu     $s1, $s1, 4
/* CB1CC 800CA5CC 3C058010 */  lui        $a1, %hi(rmonregs_bss_0008)
/* CB1D0 800CA5D0 8CA5E688 */  lw         $a1, %lo(rmonregs_bss_0008)($a1)
/* CB1D4 800CA5D4 0C032628 */  jal        __rmonWriteWordTo
/* CB1D8 800CA5D8 3C040400 */   lui       $a0, 0x400
/* CB1DC 800CA5DC 3C058010 */  lui        $a1, %hi(rmonregs_bss_0004)
/* CB1E0 800CA5E0 8CA5E684 */  lw         $a1, %lo(rmonregs_bss_0004)($a1)
/* CB1E4 800CA5E4 3C040400 */  lui        $a0, 0x400
/* CB1E8 800CA5E8 0C032628 */  jal        __rmonWriteWordTo
/* CB1EC 800CA5EC 34841000 */   ori       $a0, $a0, 0x1000
/* CB1F0 800CA5F0 3C058010 */  lui        $a1, %hi(rmonregs_bss_0000)
/* CB1F4 800CA5F4 8CA5E680 */  lw         $a1, %lo(rmonregs_bss_0000)($a1)
/* CB1F8 800CA5F8 0C032628 */  jal        __rmonWriteWordTo
/* CB1FC 800CA5FC 3C040408 */   lui       $a0, 0x408
/* CB200 800CA600 3C040404 */  lui        $a0, 0x404
/* CB204 800CA604 0C032638 */  jal        __rmonReadWordAt
/* CB208 800CA608 34840004 */   ori       $a0, $a0, 4
/* CB20C 800CA60C 3C040404 */  lui        $a0, 0x404
/* CB210 800CA610 0C032638 */  jal        __rmonReadWordAt
/* CB214 800CA614 AFA200A0 */   sw        $v0, 0xa0($sp)
/* CB218 800CA618 3C040404 */  lui        $a0, 0x404
/* CB21C 800CA61C 34840008 */  ori        $a0, $a0, 8
/* CB220 800CA620 0C032638 */  jal        __rmonReadWordAt
/* CB224 800CA624 AFA200A4 */   sw        $v0, 0xa4($sp)
/* CB228 800CA628 3C040408 */  lui        $a0, 0x408
/* CB22C 800CA62C 0C032638 */  jal        __rmonReadWordAt
/* CB230 800CA630 AFA200A8 */   sw        $v0, 0xa8($sp)
/* CB234 800CA634 3C030400 */  lui        $v1, 0x400
/* CB238 800CA638 34631000 */  ori        $v1, $v1, 0x1000
/* CB23C 800CA63C 3C040404 */  lui        $a0, 0x404
/* CB240 800CA640 3484000C */  ori        $a0, $a0, 0xc
/* CB244 800CA644 00431021 */  addu       $v0, $v0, $v1
/* CB248 800CA648 0C032638 */  jal        __rmonReadWordAt
/* CB24C 800CA64C AFA200AC */   sw        $v0, 0xac($sp)
/* CB250 800CA650 3C040404 */  lui        $a0, 0x404
/* CB254 800CA654 34840010 */  ori        $a0, $a0, 0x10
/* CB258 800CA658 0C032638 */  jal        __rmonReadWordAt
/* CB25C 800CA65C AFA200B0 */   sw        $v0, 0xb0($sp)
/* CB260 800CA660 3C040404 */  lui        $a0, 0x404
/* CB264 800CA664 34840014 */  ori        $a0, $a0, 0x14
/* CB268 800CA668 0C032638 */  jal        __rmonReadWordAt
/* CB26C 800CA66C AFA200B4 */   sw        $v0, 0xb4($sp)
/* CB270 800CA670 3C040404 */  lui        $a0, 0x404
/* CB274 800CA674 34840018 */  ori        $a0, $a0, 0x18
/* CB278 800CA678 0C032638 */  jal        __rmonReadWordAt
/* CB27C 800CA67C AFA200B8 */   sw        $v0, 0xb8($sp)
/* CB280 800CA680 27A40010 */  addiu      $a0, $sp, 0x10
/* CB284 800CA684 240500B0 */  addiu      $a1, $zero, 0xb0
/* CB288 800CA688 24060001 */  addiu      $a2, $zero, 1
/* CB28C 800CA68C 0C03255A */  jal        __rmonSendReply
/* CB290 800CA690 AFA200BC */   sw        $v0, 0xbc($sp)
/* CB294 800CA694 00001021 */  addu       $v0, $zero, $zero
.L800CA698:
/* CB298 800CA698 8FBF00C8 */  lw         $ra, 0xc8($sp)
/* CB29C 800CA69C 8FB100C4 */  lw         $s1, 0xc4($sp)
/* CB2A0 800CA6A0 8FB000C0 */  lw         $s0, 0xc0($sp)
/* CB2A4 800CA6A4 03E00008 */  jr         $ra
/* CB2A8 800CA6A8 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel __rmonSetSRegs
/* CB2AC 800CA6AC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CB2B0 800CA6B0 AFB20028 */  sw         $s2, 0x28($sp)
/* CB2B4 800CA6B4 00809021 */  addu       $s2, $a0, $zero
/* CB2B8 800CA6B8 AFBF002C */  sw         $ra, 0x2c($sp)
/* CB2BC 800CA6BC AFB10024 */  sw         $s1, 0x24($sp)
/* CB2C0 800CA6C0 0C032B08 */  jal        __rmonRCPrunning
/* CB2C4 800CA6C4 AFB00020 */   sw        $s0, 0x20($sp)
/* CB2C8 800CA6C8 1440004D */  bnez       $v0, .L800CA800
/* CB2CC 800CA6CC 2402FFFC */   addiu     $v0, $zero, -4
/* CB2D0 800CA6D0 0C032638 */  jal        __rmonReadWordAt
/* CB2D4 800CA6D4 3C040408 */   lui       $a0, 0x408
/* CB2D8 800CA6D8 3C040400 */  lui        $a0, 0x400
/* CB2DC 800CA6DC 3C018010 */  lui        $at, %hi(rmonregs_bss_0000)
/* CB2E0 800CA6E0 AC22E680 */  sw         $v0, %lo(rmonregs_bss_0000)($at)
/* CB2E4 800CA6E4 0C032638 */  jal        __rmonReadWordAt
/* CB2E8 800CA6E8 34841000 */   ori       $a0, $a0, 0x1000
/* CB2EC 800CA6EC 3C018010 */  lui        $at, %hi(rmonregs_bss_0004)
/* CB2F0 800CA6F0 AC22E684 */  sw         $v0, %lo(rmonregs_bss_0004)($at)
/* CB2F4 800CA6F4 0C032638 */  jal        __rmonReadWordAt
/* CB2F8 800CA6F8 3C040400 */   lui       $a0, 0x400
/* CB2FC 800CA6FC 00008021 */  addu       $s0, $zero, $zero
/* CB300 800CA700 02408821 */  addu       $s1, $s2, $zero
/* CB304 800CA704 3C018010 */  lui        $at, %hi(rmonregs_bss_0008)
/* CB308 800CA708 AC22E688 */  sw         $v0, %lo(rmonregs_bss_0008)($at)
.L800CA70C:
/* CB30C 800CA70C 8E250010 */  lw         $a1, 0x10($s1)
/* CB310 800CA710 3C040400 */  lui        $a0, 0x400
/* CB314 800CA714 0C032628 */  jal        __rmonWriteWordTo
/* CB318 800CA718 26310004 */   addiu     $s1, $s1, 4
/* CB31C 800CA71C 3C028C00 */  lui        $v0, 0x8c00
/* CB320 800CA720 3C040400 */  lui        $a0, 0x400
/* CB324 800CA724 34841000 */  ori        $a0, $a0, 0x1000
/* CB328 800CA728 3205001F */  andi       $a1, $s0, 0x1f
/* CB32C 800CA72C 00052C00 */  sll        $a1, $a1, 0x10
/* CB330 800CA730 0C032628 */  jal        __rmonWriteWordTo
/* CB334 800CA734 00A22825 */   or        $a1, $a1, $v0
/* CB338 800CA738 3C040408 */  lui        $a0, 0x408
/* CB33C 800CA73C 0C032628 */  jal        __rmonWriteWordTo
/* CB340 800CA740 00002821 */   addu      $a1, $zero, $zero
/* CB344 800CA744 0C032B22 */  jal        __rmonStepRCP
/* CB348 800CA748 26100001 */   addiu     $s0, $s0, 1
/* CB34C 800CA74C 2A020020 */  slti       $v0, $s0, 0x20
/* CB350 800CA750 1440FFEE */  bnez       $v0, .L800CA70C
/* CB354 800CA754 00000000 */   nop
/* CB358 800CA758 3C058010 */  lui        $a1, %hi(rmonregs_bss_0008)
/* CB35C 800CA75C 8CA5E688 */  lw         $a1, %lo(rmonregs_bss_0008)($a1)
/* CB360 800CA760 0C032628 */  jal        __rmonWriteWordTo
/* CB364 800CA764 3C040400 */   lui       $a0, 0x400
/* CB368 800CA768 3C058010 */  lui        $a1, %hi(rmonregs_bss_0004)
/* CB36C 800CA76C 8CA5E684 */  lw         $a1, %lo(rmonregs_bss_0004)($a1)
/* CB370 800CA770 3C040400 */  lui        $a0, 0x400
/* CB374 800CA774 0C032628 */  jal        __rmonWriteWordTo
/* CB378 800CA778 34841000 */   ori       $a0, $a0, 0x1000
/* CB37C 800CA77C 3C058010 */  lui        $a1, %hi(rmonregs_bss_0000)
/* CB380 800CA780 8CA5E680 */  lw         $a1, %lo(rmonregs_bss_0000)($a1)
/* CB384 800CA784 0C032628 */  jal        __rmonWriteWordTo
/* CB388 800CA788 3C040408 */   lui       $a0, 0x408
/* CB38C 800CA78C 8E450090 */  lw         $a1, 0x90($s2)
/* CB390 800CA790 3C040404 */  lui        $a0, 0x404
/* CB394 800CA794 0C032628 */  jal        __rmonWriteWordTo
/* CB398 800CA798 34840004 */   ori       $a0, $a0, 4
/* CB39C 800CA79C 8E450094 */  lw         $a1, 0x94($s2)
/* CB3A0 800CA7A0 0C032628 */  jal        __rmonWriteWordTo
/* CB3A4 800CA7A4 3C040404 */   lui       $a0, 0x404
/* CB3A8 800CA7A8 8E45009C */  lw         $a1, 0x9c($s2)
/* CB3AC 800CA7AC 3C040408 */  lui        $a0, 0x408
/* CB3B0 800CA7B0 0C032628 */  jal        __rmonWriteWordTo
/* CB3B4 800CA7B4 30A50FFF */   andi      $a1, $a1, 0xfff
/* CB3B8 800CA7B8 8E4500A0 */  lw         $a1, 0xa0($s2)
/* CB3BC 800CA7BC 3C040404 */  lui        $a0, 0x404
/* CB3C0 800CA7C0 0C032628 */  jal        __rmonWriteWordTo
/* CB3C4 800CA7C4 3484000C */   ori       $a0, $a0, 0xc
/* CB3C8 800CA7C8 8E4500A4 */  lw         $a1, 0xa4($s2)
/* CB3CC 800CA7CC 3C040404 */  lui        $a0, 0x404
/* CB3D0 800CA7D0 0C032628 */  jal        __rmonWriteWordTo
/* CB3D4 800CA7D4 34840010 */   ori       $a0, $a0, 0x10
/* CB3D8 800CA7D8 8E42000C */  lw         $v0, 0xc($s2)
/* CB3DC 800CA7DC 27A40010 */  addiu      $a0, $sp, 0x10
/* CB3E0 800CA7E0 AFA2001C */  sw         $v0, 0x1c($sp)
/* CB3E4 800CA7E4 92420004 */  lbu        $v0, 4($s2)
/* CB3E8 800CA7E8 24050010 */  addiu      $a1, $zero, 0x10
/* CB3EC 800CA7EC 24060001 */  addiu      $a2, $zero, 1
/* CB3F0 800CA7F0 A7A00016 */  sh         $zero, 0x16($sp)
/* CB3F4 800CA7F4 0C03255A */  jal        __rmonSendReply
/* CB3F8 800CA7F8 A3A20014 */   sb        $v0, 0x14($sp)
/* CB3FC 800CA7FC 00001021 */  addu       $v0, $zero, $zero
.L800CA800:
/* CB400 800CA800 8FBF002C */  lw         $ra, 0x2c($sp)
/* CB404 800CA804 8FB20028 */  lw         $s2, 0x28($sp)
/* CB408 800CA808 8FB10024 */  lw         $s1, 0x24($sp)
/* CB40C 800CA80C 8FB00020 */  lw         $s0, 0x20($sp)
/* CB410 800CA810 03E00008 */  jr         $ra
/* CB414 800CA814 27BD0030 */   addiu     $sp, $sp, 0x30

glabel __rmonGetVRegs
/* CB418 800CA818 27BDFDC8 */  addiu      $sp, $sp, -0x238
/* CB41C 800CA81C AFB00228 */  sw         $s0, 0x228($sp)
/* CB420 800CA820 00808021 */  addu       $s0, $a0, $zero
/* CB424 800CA824 AFBF0234 */  sw         $ra, 0x234($sp)
/* CB428 800CA828 AFB20230 */  sw         $s2, 0x230($sp)
/* CB42C 800CA82C 0C032B08 */  jal        __rmonRCPrunning
/* CB430 800CA830 AFB1022C */   sw        $s1, 0x22c($sp)
/* CB434 800CA834 14400068 */  bnez       $v0, .L800CA9D8
/* CB438 800CA838 2402FFFC */   addiu     $v0, $zero, -4
/* CB43C 800CA83C 8E02000C */  lw         $v0, 0xc($s0)
/* CB440 800CA840 27B10220 */  addiu      $s1, $sp, 0x220
/* CB444 800CA844 24120004 */  addiu      $s2, $zero, 4
/* CB448 800CA848 AFA2001C */  sw         $v0, 0x1c($sp)
/* CB44C 800CA84C 92030004 */  lbu        $v1, 4($s0)
/* CB450 800CA850 00008021 */  addu       $s0, $zero, $zero
/* CB454 800CA854 24020210 */  addiu      $v0, $zero, 0x210
/* CB458 800CA858 A7A00016 */  sh         $zero, 0x16($sp)
/* CB45C 800CA85C AFA20010 */  sw         $v0, 0x10($sp)
/* CB460 800CA860 AFA20220 */  sw         $v0, 0x220($sp)
/* CB464 800CA864 A3A30014 */  sb         $v1, 0x14($sp)
/* CB468 800CA868 02302021 */  addu       $a0, $s1, $s0
.L800CA86C:
/* CB46C 800CA86C 02502823 */  subu       $a1, $s2, $s0
/* CB470 800CA870 0C02FF60 */  jal        __osRdbSend
/* CB474 800CA874 24060008 */   addiu     $a2, $zero, 8
/* CB478 800CA878 02028021 */  addu       $s0, $s0, $v0
/* CB47C 800CA87C 2A020004 */  slti       $v0, $s0, 4
/* CB480 800CA880 5440FFFA */  bnel       $v0, $zero, .L800CA86C
/* CB484 800CA884 02302021 */   addu      $a0, $s1, $s0
/* CB488 800CA888 27A40010 */  addiu      $a0, $sp, 0x10
/* CB48C 800CA88C 24050010 */  addiu      $a1, $zero, 0x10
/* CB490 800CA890 0C032540 */  jal        __rmonSendHeader
/* CB494 800CA894 24060001 */   addiu     $a2, $zero, 1
/* CB498 800CA898 0C032638 */  jal        __rmonReadWordAt
/* CB49C 800CA89C 3C040408 */   lui       $a0, 0x408
/* CB4A0 800CA8A0 3C040400 */  lui        $a0, 0x400
/* CB4A4 800CA8A4 3C018010 */  lui        $at, %hi(rmonregs_bss_0000)
/* CB4A8 800CA8A8 AC22E680 */  sw         $v0, %lo(rmonregs_bss_0000)($at)
/* CB4AC 800CA8AC 0C032638 */  jal        __rmonReadWordAt
/* CB4B0 800CA8B0 34841000 */   ori       $a0, $a0, 0x1000
/* CB4B4 800CA8B4 3C018010 */  lui        $at, %hi(rmonregs_bss_0004)
/* CB4B8 800CA8B8 AC22E684 */  sw         $v0, %lo(rmonregs_bss_0004)($at)
/* CB4BC 800CA8BC 0C032638 */  jal        __rmonReadWordAt
/* CB4C0 800CA8C0 3C040400 */   lui       $a0, 0x400
/* CB4C4 800CA8C4 3C040400 */  lui        $a0, 0x400
/* CB4C8 800CA8C8 3C018010 */  lui        $at, %hi(rmonregs_bss_0008)
/* CB4CC 800CA8CC AC22E688 */  sw         $v0, %lo(rmonregs_bss_0008)($at)
/* CB4D0 800CA8D0 0C032638 */  jal        __rmonReadWordAt
/* CB4D4 800CA8D4 34840004 */   ori       $a0, $a0, 4
/* CB4D8 800CA8D8 3C040400 */  lui        $a0, 0x400
/* CB4DC 800CA8DC 3C018010 */  lui        $at, %hi(rmonregs_bss_000C)
/* CB4E0 800CA8E0 AC22E68C */  sw         $v0, %lo(rmonregs_bss_000C)($at)
/* CB4E4 800CA8E4 0C032638 */  jal        __rmonReadWordAt
/* CB4E8 800CA8E8 34840008 */   ori       $a0, $a0, 8
/* CB4EC 800CA8EC 3C040400 */  lui        $a0, 0x400
/* CB4F0 800CA8F0 3C018010 */  lui        $at, %hi(rmonregs_bss_0010)
/* CB4F4 800CA8F4 AC22E690 */  sw         $v0, %lo(rmonregs_bss_0010)($at)
/* CB4F8 800CA8F8 0C032638 */  jal        __rmonReadWordAt
/* CB4FC 800CA8FC 3484000C */   ori       $a0, $a0, 0xc
/* CB500 800CA900 00008021 */  addu       $s0, $zero, $zero
/* CB504 800CA904 3C11FFFF */  lui        $s1, 0xffff
/* CB508 800CA908 363107FF */  ori        $s1, $s1, 0x7ff
/* CB50C 800CA90C 3C018010 */  lui        $at, %hi(rmonregs_bss_0014)
/* CB510 800CA910 AC22E694 */  sw         $v0, %lo(rmonregs_bss_0014)($at)
/* CB514 800CA914 3C05E800 */  lui        $a1, 0xe800
.L800CA918:
/* CB518 800CA918 3202001F */  andi       $v0, $s0, 0x1f
/* CB51C 800CA91C 00021400 */  sll        $v0, $v0, 0x10
/* CB520 800CA920 00452825 */  or         $a1, $v0, $a1
/* CB524 800CA924 00B12824 */  and        $a1, $a1, $s1
/* CB528 800CA928 3C040400 */  lui        $a0, 0x400
/* CB52C 800CA92C 34841000 */  ori        $a0, $a0, 0x1000
/* CB530 800CA930 0C032628 */  jal        __rmonWriteWordTo
/* CB534 800CA934 34A52000 */   ori       $a1, $a1, 0x2000
/* CB538 800CA938 3C040408 */  lui        $a0, 0x408
/* CB53C 800CA93C 0C032628 */  jal        __rmonWriteWordTo
/* CB540 800CA940 00002821 */   addu      $a1, $zero, $zero
/* CB544 800CA944 0C032B22 */  jal        __rmonStepRCP
/* CB548 800CA948 26100001 */   addiu     $s0, $s0, 1
/* CB54C 800CA94C 3C040400 */  lui        $a0, 0x400
/* CB550 800CA950 0C032588 */  jal        __rmonSendData
/* CB554 800CA954 24050010 */   addiu     $a1, $zero, 0x10
/* CB558 800CA958 2A020020 */  slti       $v0, $s0, 0x20
/* CB55C 800CA95C 1440FFEE */  bnez       $v0, .L800CA918
/* CB560 800CA960 3C05E800 */   lui       $a1, 0xe800
/* CB564 800CA964 3C058010 */  lui        $a1, %hi(rmonregs_bss_0008)
/* CB568 800CA968 8CA5E688 */  lw         $a1, %lo(rmonregs_bss_0008)($a1)
/* CB56C 800CA96C 0C032628 */  jal        __rmonWriteWordTo
/* CB570 800CA970 3C040400 */   lui       $a0, 0x400
/* CB574 800CA974 3C058010 */  lui        $a1, %hi(rmonregs_bss_000C)
/* CB578 800CA978 8CA5E68C */  lw         $a1, %lo(rmonregs_bss_000C)($a1)
/* CB57C 800CA97C 3C040400 */  lui        $a0, 0x400
/* CB580 800CA980 0C032628 */  jal        __rmonWriteWordTo
/* CB584 800CA984 34840004 */   ori       $a0, $a0, 4
/* CB588 800CA988 3C058010 */  lui        $a1, %hi(rmonregs_bss_0010)
/* CB58C 800CA98C 8CA5E690 */  lw         $a1, %lo(rmonregs_bss_0010)($a1)
/* CB590 800CA990 3C040400 */  lui        $a0, 0x400
/* CB594 800CA994 0C032628 */  jal        __rmonWriteWordTo
/* CB598 800CA998 34840008 */   ori       $a0, $a0, 8
/* CB59C 800CA99C 3C058010 */  lui        $a1, %hi(rmonregs_bss_0010)
/* CB5A0 800CA9A0 8CA5E690 */  lw         $a1, %lo(rmonregs_bss_0010)($a1)
/* CB5A4 800CA9A4 3C040400 */  lui        $a0, 0x400
/* CB5A8 800CA9A8 0C032628 */  jal        __rmonWriteWordTo
/* CB5AC 800CA9AC 3484000C */   ori       $a0, $a0, 0xc
/* CB5B0 800CA9B0 3C058010 */  lui        $a1, %hi(rmonregs_bss_0004)
/* CB5B4 800CA9B4 8CA5E684 */  lw         $a1, %lo(rmonregs_bss_0004)($a1)
/* CB5B8 800CA9B8 3C040400 */  lui        $a0, 0x400
/* CB5BC 800CA9BC 0C032628 */  jal        __rmonWriteWordTo
/* CB5C0 800CA9C0 34841000 */   ori       $a0, $a0, 0x1000
/* CB5C4 800CA9C4 3C058010 */  lui        $a1, %hi(rmonregs_bss_0000)
/* CB5C8 800CA9C8 8CA5E680 */  lw         $a1, %lo(rmonregs_bss_0000)($a1)
/* CB5CC 800CA9CC 0C032628 */  jal        __rmonWriteWordTo
/* CB5D0 800CA9D0 3C040408 */   lui       $a0, 0x408
/* CB5D4 800CA9D4 00001021 */  addu       $v0, $zero, $zero
.L800CA9D8:
/* CB5D8 800CA9D8 8FBF0234 */  lw         $ra, 0x234($sp)
/* CB5DC 800CA9DC 8FB20230 */  lw         $s2, 0x230($sp)
/* CB5E0 800CA9E0 8FB1022C */  lw         $s1, 0x22c($sp)
/* CB5E4 800CA9E4 8FB00228 */  lw         $s0, 0x228($sp)
/* CB5E8 800CA9E8 03E00008 */  jr         $ra
/* CB5EC 800CA9EC 27BD0238 */   addiu     $sp, $sp, 0x238

glabel __rmonSetVRegs
/* CB5F0 800CA9F0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CB5F4 800CA9F4 AFB20028 */  sw         $s2, 0x28($sp)
/* CB5F8 800CA9F8 00809021 */  addu       $s2, $a0, $zero
/* CB5FC 800CA9FC AFBF0030 */  sw         $ra, 0x30($sp)
/* CB600 800CAA00 AFB3002C */  sw         $s3, 0x2c($sp)
/* CB604 800CAA04 AFB10024 */  sw         $s1, 0x24($sp)
/* CB608 800CAA08 0C032B08 */  jal        __rmonRCPrunning
/* CB60C 800CAA0C AFB00020 */   sw        $s0, 0x20($sp)
/* CB610 800CAA10 1440005D */  bnez       $v0, .L800CAB88
/* CB614 800CAA14 2402FFFC */   addiu     $v0, $zero, -4
/* CB618 800CAA18 0C032638 */  jal        __rmonReadWordAt
/* CB61C 800CAA1C 3C040408 */   lui       $a0, 0x408
/* CB620 800CAA20 3C040400 */  lui        $a0, 0x400
/* CB624 800CAA24 3C018010 */  lui        $at, %hi(rmonregs_bss_0000)
/* CB628 800CAA28 AC22E680 */  sw         $v0, %lo(rmonregs_bss_0000)($at)
/* CB62C 800CAA2C 0C032638 */  jal        __rmonReadWordAt
/* CB630 800CAA30 34841000 */   ori       $a0, $a0, 0x1000
/* CB634 800CAA34 3C018010 */  lui        $at, %hi(rmonregs_bss_0004)
/* CB638 800CAA38 AC22E684 */  sw         $v0, %lo(rmonregs_bss_0004)($at)
/* CB63C 800CAA3C 0C032638 */  jal        __rmonReadWordAt
/* CB640 800CAA40 3C040400 */   lui       $a0, 0x400
/* CB644 800CAA44 3C040400 */  lui        $a0, 0x400
/* CB648 800CAA48 3C018010 */  lui        $at, %hi(rmonregs_bss_0008)
/* CB64C 800CAA4C AC22E688 */  sw         $v0, %lo(rmonregs_bss_0008)($at)
/* CB650 800CAA50 0C032638 */  jal        __rmonReadWordAt
/* CB654 800CAA54 34840004 */   ori       $a0, $a0, 4
/* CB658 800CAA58 3C040400 */  lui        $a0, 0x400
/* CB65C 800CAA5C 3C018010 */  lui        $at, %hi(rmonregs_bss_000C)
/* CB660 800CAA60 AC22E68C */  sw         $v0, %lo(rmonregs_bss_000C)($at)
/* CB664 800CAA64 0C032638 */  jal        __rmonReadWordAt
/* CB668 800CAA68 34840008 */   ori       $a0, $a0, 8
/* CB66C 800CAA6C 3C040400 */  lui        $a0, 0x400
/* CB670 800CAA70 3C018010 */  lui        $at, %hi(rmonregs_bss_0010)
/* CB674 800CAA74 AC22E690 */  sw         $v0, %lo(rmonregs_bss_0010)($at)
/* CB678 800CAA78 0C032638 */  jal        __rmonReadWordAt
/* CB67C 800CAA7C 3484000C */   ori       $a0, $a0, 0xc
/* CB680 800CAA80 00008021 */  addu       $s0, $zero, $zero
/* CB684 800CAA84 3C13FFFF */  lui        $s3, 0xffff
/* CB688 800CAA88 367307FF */  ori        $s3, $s3, 0x7ff
/* CB68C 800CAA8C 24110010 */  addiu      $s1, $zero, 0x10
/* CB690 800CAA90 3C018010 */  lui        $at, %hi(rmonregs_bss_0014)
/* CB694 800CAA94 AC22E694 */  sw         $v0, %lo(rmonregs_bss_0014)($at)
/* CB698 800CAA98 3C040400 */  lui        $a0, 0x400
.L800CAA9C:
/* CB69C 800CAA9C 02512821 */  addu       $a1, $s2, $s1
/* CB6A0 800CAAA0 0C032654 */  jal        __rmonCopyWords
/* CB6A4 800CAAA4 24060004 */   addiu     $a2, $zero, 4
/* CB6A8 800CAAA8 3C05C800 */  lui        $a1, 0xc800
/* CB6AC 800CAAAC 3202001F */  andi       $v0, $s0, 0x1f
/* CB6B0 800CAAB0 00021400 */  sll        $v0, $v0, 0x10
/* CB6B4 800CAAB4 00452825 */  or         $a1, $v0, $a1
/* CB6B8 800CAAB8 00B32824 */  and        $a1, $a1, $s3
/* CB6BC 800CAABC 3C040400 */  lui        $a0, 0x400
/* CB6C0 800CAAC0 34841000 */  ori        $a0, $a0, 0x1000
/* CB6C4 800CAAC4 0C032628 */  jal        __rmonWriteWordTo
/* CB6C8 800CAAC8 34A52000 */   ori       $a1, $a1, 0x2000
/* CB6CC 800CAACC 3C040408 */  lui        $a0, 0x408
/* CB6D0 800CAAD0 0C032628 */  jal        __rmonWriteWordTo
/* CB6D4 800CAAD4 00002821 */   addu      $a1, $zero, $zero
/* CB6D8 800CAAD8 0C032B22 */  jal        __rmonStepRCP
/* CB6DC 800CAADC 26310004 */   addiu     $s1, $s1, 4
/* CB6E0 800CAAE0 26100001 */  addiu      $s0, $s0, 1
/* CB6E4 800CAAE4 2A020020 */  slti       $v0, $s0, 0x20
/* CB6E8 800CAAE8 5440FFEC */  bnel       $v0, $zero, .L800CAA9C
/* CB6EC 800CAAEC 3C040400 */   lui       $a0, 0x400
/* CB6F0 800CAAF0 3C058010 */  lui        $a1, %hi(rmonregs_bss_0008)
/* CB6F4 800CAAF4 8CA5E688 */  lw         $a1, %lo(rmonregs_bss_0008)($a1)
/* CB6F8 800CAAF8 0C032628 */  jal        __rmonWriteWordTo
/* CB6FC 800CAAFC 3C040400 */   lui       $a0, 0x400
/* CB700 800CAB00 3C058010 */  lui        $a1, %hi(rmonregs_bss_000C)
/* CB704 800CAB04 8CA5E68C */  lw         $a1, %lo(rmonregs_bss_000C)($a1)
/* CB708 800CAB08 3C040400 */  lui        $a0, 0x400
/* CB70C 800CAB0C 0C032628 */  jal        __rmonWriteWordTo
/* CB710 800CAB10 34840004 */   ori       $a0, $a0, 4
/* CB714 800CAB14 3C058010 */  lui        $a1, %hi(rmonregs_bss_0010)
/* CB718 800CAB18 8CA5E690 */  lw         $a1, %lo(rmonregs_bss_0010)($a1)
/* CB71C 800CAB1C 3C040400 */  lui        $a0, 0x400
/* CB720 800CAB20 0C032628 */  jal        __rmonWriteWordTo
/* CB724 800CAB24 34840008 */   ori       $a0, $a0, 8
/* CB728 800CAB28 3C058010 */  lui        $a1, %hi(rmonregs_bss_0010)
/* CB72C 800CAB2C 8CA5E690 */  lw         $a1, %lo(rmonregs_bss_0010)($a1)
/* CB730 800CAB30 3C040400 */  lui        $a0, 0x400
/* CB734 800CAB34 0C032628 */  jal        __rmonWriteWordTo
/* CB738 800CAB38 3484000C */   ori       $a0, $a0, 0xc
/* CB73C 800CAB3C 3C058010 */  lui        $a1, %hi(rmonregs_bss_0004)
/* CB740 800CAB40 8CA5E684 */  lw         $a1, %lo(rmonregs_bss_0004)($a1)
/* CB744 800CAB44 3C040400 */  lui        $a0, 0x400
/* CB748 800CAB48 0C032628 */  jal        __rmonWriteWordTo
/* CB74C 800CAB4C 34841000 */   ori       $a0, $a0, 0x1000
/* CB750 800CAB50 3C058010 */  lui        $a1, %hi(rmonregs_bss_0000)
/* CB754 800CAB54 8CA5E680 */  lw         $a1, %lo(rmonregs_bss_0000)($a1)
/* CB758 800CAB58 0C032628 */  jal        __rmonWriteWordTo
/* CB75C 800CAB5C 3C040408 */   lui       $a0, 0x408
/* CB760 800CAB60 8E42000C */  lw         $v0, 0xc($s2)
/* CB764 800CAB64 27A40010 */  addiu      $a0, $sp, 0x10
/* CB768 800CAB68 AFA2001C */  sw         $v0, 0x1c($sp)
/* CB76C 800CAB6C 92420004 */  lbu        $v0, 4($s2)
/* CB770 800CAB70 24050010 */  addiu      $a1, $zero, 0x10
/* CB774 800CAB74 24060001 */  addiu      $a2, $zero, 1
/* CB778 800CAB78 A7A00016 */  sh         $zero, 0x16($sp)
/* CB77C 800CAB7C 0C03255A */  jal        __rmonSendReply
/* CB780 800CAB80 A3A20014 */   sb        $v0, 0x14($sp)
/* CB784 800CAB84 00001021 */  addu       $v0, $zero, $zero
.L800CAB88:
/* CB788 800CAB88 8FBF0030 */  lw         $ra, 0x30($sp)
/* CB78C 800CAB8C 8FB3002C */  lw         $s3, 0x2c($sp)
/* CB790 800CAB90 8FB20028 */  lw         $s2, 0x28($sp)
/* CB794 800CAB94 8FB10024 */  lw         $s1, 0x24($sp)
/* CB798 800CAB98 8FB00020 */  lw         $s0, 0x20($sp)
/* CB79C 800CAB9C 03E00008 */  jr         $ra
/* CB7A0 800CABA0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __rmonGetRegisterContents
/* CB7A4 800CABA4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CB7A8 800CABA8 AFB00010 */  sw         $s0, 0x10($sp)
/* CB7AC 800CABAC 00C08021 */  addu       $s0, $a2, $zero
/* CB7B0 800CABB0 14800014 */  bnez       $a0, .L800CAC04
/* CB7B4 800CABB4 AFBF0014 */   sw        $ra, 0x14($sp)
/* CB7B8 800CABB8 2603FFFF */  addiu      $v1, $s0, -1
/* CB7BC 800CABBC 2C620019 */  sltiu      $v0, $v1, 0x19
/* CB7C0 800CABC0 10400003 */  beqz       $v0, .L800CABD0
/* CB7C4 800CABC4 2602FFE4 */   addiu     $v0, $s0, -0x1c
/* CB7C8 800CABC8 08032AF7 */  j          .L800CABDC
/* CB7CC 800CABCC 00608021 */   addu      $s0, $v1, $zero
.L800CABD0:
/* CB7D0 800CABD0 2C420004 */  sltiu      $v0, $v0, 4
/* CB7D4 800CABD4 10400006 */  beqz       $v0, .L800CABF0
/* CB7D8 800CABD8 2610FFFD */   addiu     $s0, $s0, -3
.L800CABDC:
/* CB7DC 800CABDC 0C032B4A */  jal        __rmonGetTCB
/* CB7E0 800CABE0 00A02021 */   addu      $a0, $a1, $zero
/* CB7E4 800CABE4 00401821 */  addu       $v1, $v0, $zero
/* CB7E8 800CABE8 14600003 */  bnez       $v1, .L800CABF8
/* CB7EC 800CABEC 00101080 */   sll       $v0, $s0, 2
.L800CABF0:
/* CB7F0 800CABF0 08032B03 */  j          .L800CAC0C
/* CB7F4 800CABF4 00001021 */   addu      $v0, $zero, $zero
.L800CABF8:
/* CB7F8 800CABF8 00621021 */  addu       $v0, $v1, $v0
/* CB7FC 800CABFC 08032B03 */  j          .L800CAC0C
/* CB800 800CAC00 8C420020 */   lw        $v0, 0x20($v0)
.L800CAC04:
/* CB804 800CAC04 0C032910 */  jal        rmonGetRcpRegister
/* CB808 800CAC08 02002021 */   addu      $a0, $s0, $zero
.L800CAC0C:
/* CB80C 800CAC0C 8FBF0014 */  lw         $ra, 0x14($sp)
/* CB810 800CAC10 8FB00010 */  lw         $s0, 0x10($sp)
/* CB814 800CAC14 03E00008 */  jr         $ra
/* CB818 800CAC18 27BD0018 */   addiu     $sp, $sp, 0x18
/* CB81C 800CAC1C 00000000 */  nop
