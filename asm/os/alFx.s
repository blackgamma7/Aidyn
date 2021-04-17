.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_lpfilter
/* CFDA0 800CF1A0 24050007 */  addiu      $a1, $zero, 7
/* CFDA4 800CF1A4 84830000 */  lh         $v1, ($a0)
/* CFDA8 800CF1A8 2486000E */  addiu      $a2, $a0, 0xe
/* CFDAC 800CF1AC 24020001 */  addiu      $v0, $zero, 1
/* CFDB0 800CF1B0 AC82002C */  sw         $v0, 0x2c($a0)
/* CFDB4 800CF1B4 24024000 */  addiu      $v0, $zero, 0x4000
/* CFDB8 800CF1B8 00031843 */  sra        $v1, $v1, 1
/* CFDBC 800CF1BC 00603821 */  addu       $a3, $v1, $zero
/* CFDC0 800CF1C0 00431023 */  subu       $v0, $v0, $v1
/* CFDC4 800CF1C4 A4820002 */  sh         $v0, 2($a0)
.L800CF1C8:
/* CFDC8 800CF1C8 A4C00008 */  sh         $zero, 8($a2)
/* CFDCC 800CF1CC 24A5FFFF */  addiu      $a1, $a1, -1
/* CFDD0 800CF1D0 04A1FFFD */  bgez       $a1, .L800CF1C8
/* CFDD4 800CF1D4 24C6FFFE */   addiu     $a2, $a2, -2
/* CFDD8 800CF1D8 00071400 */  sll        $v0, $a3, 0x10
/* CFDDC 800CF1DC 3C01800E */  lui        $at, %hi(drvrnew_rodata_0000)
/* CFDE0 800CF1E0 D4225600 */  ldc1       $f2, %lo(drvrnew_rodata_0000)($at)
/* CFDE4 800CF1E4 00021403 */  sra        $v0, $v0, 0x10
/* CFDE8 800CF1E8 44820000 */  mtc1       $v0, $f0
/* CFDEC 800CF1EC 00000000 */  nop
/* CFDF0 800CF1F0 46800021 */  cvt.d.w    $f0, $f0
/* CFDF4 800CF1F4 46220103 */  div.d      $f4, $f0, $f2
/* CFDF8 800CF1F8 24050009 */  addiu      $a1, $zero, 9
/* CFDFC 800CF1FC 24860012 */  addiu      $a2, $a0, 0x12
/* CFE00 800CF200 A4870018 */  sh         $a3, 0x18($a0)
/* CFE04 800CF204 46201206 */  mov.d      $f8, $f2
/* CFE08 800CF208 46202186 */  mov.d      $f6, $f4
.L800CF20C:
/* CFE0C 800CF20C 00000000 */  nop
/* CFE10 800CF210 46262102 */  mul.d      $f4, $f4, $f6
/* CFE14 800CF214 00000000 */  nop
/* CFE18 800CF218 46282002 */  mul.d      $f0, $f4, $f8
/* CFE1C 800CF21C 24A50001 */  addiu      $a1, $a1, 1
/* CFE20 800CF220 4620008D */  trunc.w.d  $f2, $f0
/* CFE24 800CF224 44021000 */  mfc1       $v0, $f2
/* CFE28 800CF228 00000000 */  nop
/* CFE2C 800CF22C A4C20008 */  sh         $v0, 8($a2)
/* CFE30 800CF230 28A20010 */  slti       $v0, $a1, 0x10
/* CFE34 800CF234 1440FFF5 */  bnez       $v0, .L800CF20C
/* CFE38 800CF238 24C60002 */   addiu     $a2, $a2, 2
/* CFE3C 800CF23C 03E00008 */  jr         $ra
/* CFE40 800CF240 00000000 */   nop

glabel alFxNew
/* CFE44 800CF244 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* CFE48 800CF248 AFB30024 */  sw         $s3, 0x24($sp)
/* CFE4C 800CF24C 00809821 */  addu       $s3, $a0, $zero
/* CFE50 800CF250 AFB60030 */  sw         $s6, 0x30($sp)
/* CFE54 800CF254 00A0B021 */  addu       $s6, $a1, $zero
/* CFE58 800CF258 AFB5002C */  sw         $s5, 0x2c($sp)
/* CFE5C 800CF25C 00C0A821 */  addu       $s5, $a2, $zero
/* CFE60 800CF260 00002821 */  addu       $a1, $zero, $zero
/* CFE64 800CF264 3C06800D */  lui        $a2, %hi(alFxParam)
/* CFE68 800CF268 24C60E34 */  addiu      $a2, $a2, %lo(alFxParam)
/* CFE6C 800CF26C AFBF0038 */  sw         $ra, 0x38($sp)
/* CFE70 800CF270 AFB70034 */  sw         $s7, 0x34($sp)
/* CFE74 800CF274 AFB40028 */  sw         $s4, 0x28($sp)
/* CFE78 800CF278 AFB20020 */  sw         $s2, 0x20($sp)
/* CFE7C 800CF27C AFB1001C */  sw         $s1, 0x1c($sp)
/* CFE80 800CF280 AFB00018 */  sw         $s0, 0x18($sp)
/* CFE84 800CF284 F7B40040 */  sdc1       $f20, 0x40($sp)
/* CFE88 800CF288 0C0341A0 */  jal        alFilterNew
/* CFE8C 800CF28C 24070005 */   addiu     $a3, $zero, 5
/* CFE90 800CF290 3C02800D */  lui        $v0, %hi(alFxPull)
/* CFE94 800CF294 24420AC0 */  addiu      $v0, $v0, %lo(alFxPull)
/* CFE98 800CF298 AE620004 */  sw         $v0, 4($s3)
/* CFE9C 800CF29C 3C02800D */  lui        $v0, %hi(alFxParamHdl)
/* CFEA0 800CF2A0 24420E48 */  addiu      $v0, $v0, %lo(alFxParamHdl)
/* CFEA4 800CF2A4 AE620028 */  sw         $v0, 0x28($s3)
/* CFEA8 800CF2A8 92C2001C */  lbu        $v0, 0x1c($s6)
/* CFEAC 800CF2AC 2443FFFF */  addiu      $v1, $v0, -1
/* CFEB0 800CF2B0 2C620006 */  sltiu      $v0, $v1, 6
/* CFEB4 800CF2B4 10400017 */  beqz       $v0, .L800CF314
/* CFEB8 800CF2B8 00031080 */   sll       $v0, $v1, 2
/* CFEBC 800CF2BC 3C01800E */  lui        $at, %hi(jtbl_800E5608)
/* CFEC0 800CF2C0 00220821 */  addu       $at, $at, $v0
/* CFEC4 800CF2C4 8C225608 */  lw         $v0, %lo(jtbl_800E5608)($at)
/* CFEC8 800CF2C8 00400008 */  jr         $v0
/* CFECC 800CF2CC 00000000 */   nop
glabel L800CF2D0_CFED0
/* CFED0 800CF2D0 3C12800F */  lui        $s2, %hi(SMALLROOM_PARAMS)
/* CFED4 800CF2D4 08033CC7 */  j          .L800CF31C
/* CFED8 800CF2D8 26523A00 */   addiu     $s2, $s2, %lo(SMALLROOM_PARAMS)
glabel L800CF2DC_CFEDC
/* CFEDC 800CF2DC 3C12800F */  lui        $s2, %hi(BIGROOM_PARAMS)
/* CFEE0 800CF2E0 08033CC7 */  j          .L800CF31C
/* CFEE4 800CF2E4 26523A68 */   addiu     $s2, $s2, %lo(BIGROOM_PARAMS)
glabel L800CF2E8_CFEE8
/* CFEE8 800CF2E8 3C12800F */  lui        $s2, %hi(ECHO_PARAMS)
/* CFEEC 800CF2EC 08033CC7 */  j          .L800CF31C
/* CFEF0 800CF2F0 26523AF0 */   addiu     $s2, $s2, %lo(ECHO_PARAMS)
glabel L800CF2F4_CFEF4
/* CFEF4 800CF2F4 3C12800F */  lui        $s2, %hi(CHORUS_PARAMS)
/* CFEF8 800CF2F8 08033CC7 */  j          .L800CF31C
/* CFEFC 800CF2FC 26523B18 */   addiu     $s2, $s2, %lo(CHORUS_PARAMS)
glabel L800CF300_CFF00
/* CFF00 800CF300 3C12800F */  lui        $s2, %hi(FLANGE_PARAMS)
/* CFF04 800CF304 08033CC7 */  j          .L800CF31C
/* CFF08 800CF308 26523B40 */   addiu     $s2, $s2, %lo(FLANGE_PARAMS)
glabel L800CF30C_CFF0C
/* CFF0C 800CF30C 08033CC7 */  j          .L800CF31C
/* CFF10 800CF310 8ED20020 */   lw        $s2, 0x20($s6)
.L800CF314:
/* CFF14 800CF314 3C12800F */  lui        $s2, %hi(NULL_PARAMS)
/* CFF18 800CF318 26523B68 */  addiu      $s2, $s2, %lo(NULL_PARAMS)
.L800CF31C:
/* CFF1C 800CF31C 8E420000 */  lw         $v0, ($s2)
/* CFF20 800CF320 00002021 */  addu       $a0, $zero, $zero
/* CFF24 800CF324 A2620024 */  sb         $v0, 0x24($s3)
/* CFF28 800CF328 92670024 */  lbu        $a3, 0x24($s3)
/* CFF2C 800CF32C 8E420004 */  lw         $v0, 4($s2)
/* CFF30 800CF330 00002821 */  addu       $a1, $zero, $zero
/* CFF34 800CF334 02A03021 */  addu       $a2, $s5, $zero
/* CFF38 800CF338 AE62001C */  sw         $v0, 0x1c($s3)
/* CFF3C 800CF33C 24020028 */  addiu      $v0, $zero, 0x28
/* CFF40 800CF340 0C030C44 */  jal        alHeapDBAlloc
/* CFF44 800CF344 AFA20010 */   sw        $v0, 0x10($sp)
/* CFF48 800CF348 00002021 */  addu       $a0, $zero, $zero
/* CFF4C 800CF34C AE620020 */  sw         $v0, 0x20($s3)
/* CFF50 800CF350 24020002 */  addiu      $v0, $zero, 2
/* CFF54 800CF354 AFA20010 */  sw         $v0, 0x10($sp)
/* CFF58 800CF358 8E67001C */  lw         $a3, 0x1c($s3)
/* CFF5C 800CF35C 00002821 */  addu       $a1, $zero, $zero
/* CFF60 800CF360 0C030C44 */  jal        alHeapDBAlloc
/* CFF64 800CF364 02A03021 */   addu      $a2, $s5, $zero
/* CFF68 800CF368 8E63001C */  lw         $v1, 0x1c($s3)
/* CFF6C 800CF36C 24110002 */  addiu      $s1, $zero, 2
/* CFF70 800CF370 00002021 */  addu       $a0, $zero, $zero
/* CFF74 800CF374 AE620014 */  sw         $v0, 0x14($s3)
/* CFF78 800CF378 1060000C */  beqz       $v1, .L800CF3AC
/* CFF7C 800CF37C AE620018 */   sw        $v0, 0x18($s3)
.L800CF380:
/* CFF80 800CF380 8E630014 */  lw         $v1, 0x14($s3)
/* CFF84 800CF384 3082FFFF */  andi       $v0, $a0, 0xffff
/* CFF88 800CF388 00021040 */  sll        $v0, $v0, 1
/* CFF8C 800CF38C 00431021 */  addu       $v0, $v0, $v1
/* CFF90 800CF390 A4400000 */  sh         $zero, ($v0)
/* CFF94 800CF394 8E63001C */  lw         $v1, 0x1c($s3)
/* CFF98 800CF398 24840001 */  addiu      $a0, $a0, 1
/* CFF9C 800CF39C 3082FFFF */  andi       $v0, $a0, 0xffff
/* CFFA0 800CF3A0 0043102B */  sltu       $v0, $v0, $v1
/* CFFA4 800CF3A4 1440FFF6 */  bnez       $v0, .L800CF380
/* CFFA8 800CF3A8 00000000 */   nop
.L800CF3AC:
/* CFFAC 800CF3AC 92620024 */  lbu        $v0, 0x24($s3)
/* CFFB0 800CF3B0 104000BE */  beqz       $v0, .L800CF6AC
/* CFFB4 800CF3B4 0000A021 */   addu      $s4, $zero, $zero
/* CFFB8 800CF3B8 24170001 */  addiu      $s7, $zero, 1
/* CFFBC 800CF3BC 3C01800E */  lui        $at, %hi(drvrnew_rodata_0020)
/* CFFC0 800CF3C0 D4345620 */  ldc1       $f20, %lo(drvrnew_rodata_0020)($at)
/* CFFC4 800CF3C4 3282FFFF */  andi       $v0, $s4, 0xffff
.L800CF3C8:
/* CFFC8 800CF3C8 00021880 */  sll        $v1, $v0, 2
/* CFFCC 800CF3CC 00621821 */  addu       $v1, $v1, $v0
/* CFFD0 800CF3D0 8E650020 */  lw         $a1, 0x20($s3)
/* CFFD4 800CF3D4 02202021 */  addu       $a0, $s1, $zero
/* CFFD8 800CF3D8 3082FFFF */  andi       $v0, $a0, 0xffff
/* CFFDC 800CF3DC 00021080 */  sll        $v0, $v0, 2
/* CFFE0 800CF3E0 00521021 */  addu       $v0, $v0, $s2
/* CFFE4 800CF3E4 8C420000 */  lw         $v0, ($v0)
/* CFFE8 800CF3E8 000318C0 */  sll        $v1, $v1, 3
/* CFFEC 800CF3EC 00A38021 */  addu       $s0, $a1, $v1
/* CFFF0 800CF3F0 24850001 */  addiu      $a1, $a0, 1
/* CFFF4 800CF3F4 AE020000 */  sw         $v0, ($s0)
/* CFFF8 800CF3F8 30A2FFFF */  andi       $v0, $a1, 0xffff
/* CFFFC 800CF3FC 00021080 */  sll        $v0, $v0, 2
/* D0000 800CF400 00521021 */  addu       $v0, $v0, $s2
/* D0004 800CF404 8C430000 */  lw         $v1, ($v0)
/* D0008 800CF408 24A20001 */  addiu      $v0, $a1, 1
/* D000C 800CF40C 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0010 800CF410 00021080 */  sll        $v0, $v0, 2
/* D0014 800CF414 00521021 */  addu       $v0, $v0, $s2
/* D0018 800CF418 AE030004 */  sw         $v1, 4($s0)
/* D001C 800CF41C 8C430000 */  lw         $v1, ($v0)
/* D0020 800CF420 24A20002 */  addiu      $v0, $a1, 2
/* D0024 800CF424 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0028 800CF428 00021080 */  sll        $v0, $v0, 2
/* D002C 800CF42C 00521021 */  addu       $v0, $v0, $s2
/* D0030 800CF430 A603000A */  sh         $v1, 0xa($s0)
/* D0034 800CF434 8C430000 */  lw         $v1, ($v0)
/* D0038 800CF438 24A20003 */  addiu      $v0, $a1, 3
/* D003C 800CF43C 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0040 800CF440 00021080 */  sll        $v0, $v0, 2
/* D0044 800CF444 00521021 */  addu       $v0, $v0, $s2
/* D0048 800CF448 A6030008 */  sh         $v1, 8($s0)
/* D004C 800CF44C 8C420000 */  lw         $v0, ($v0)
/* D0050 800CF450 24B10004 */  addiu      $s1, $a1, 4
/* D0054 800CF454 A602000C */  sh         $v0, 0xc($s0)
/* D0058 800CF458 3222FFFF */  andi       $v0, $s1, 0xffff
/* D005C 800CF45C 00021080 */  sll        $v0, $v0, 2
/* D0060 800CF460 00521021 */  addu       $v0, $v0, $s2
/* D0064 800CF464 8C420000 */  lw         $v0, ($v0)
/* D0068 800CF468 10400042 */  beqz       $v0, .L800CF574
/* D006C 800CF46C 02201021 */   addu      $v0, $s1, $zero
/* D0070 800CF470 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0074 800CF474 00021080 */  sll        $v0, $v0, 2
/* D0078 800CF478 3C01447A */  lui        $at, 0x447a
/* D007C 800CF47C 44811000 */  mtc1       $at, $f2
/* D0080 800CF480 00521021 */  addu       $v0, $v0, $s2
/* D0084 800CF484 C4400000 */  lwc1       $f0, ($v0)
/* D0088 800CF488 46800020 */  cvt.s.w    $f0, $f0
/* D008C 800CF48C 46020003 */  div.s      $f0, $f0, $f2
/* D0090 800CF490 46000021 */  cvt.d.s    $f0, $f0
/* D0094 800CF494 46200000 */  add.d      $f0, $f0, $f0
/* D0098 800CF498 C6C20018 */  lwc1       $f2, 0x18($s6)
/* D009C 800CF49C 468010A1 */  cvt.d.w    $f2, $f2
/* D00A0 800CF4A0 46220003 */  div.d      $f0, $f0, $f2
/* D00A4 800CF4A4 8E040004 */  lw         $a0, 4($s0)
/* D00A8 800CF4A8 8E030000 */  lw         $v1, ($s0)
/* D00AC 800CF4AC 24A20005 */  addiu      $v0, $a1, 5
/* D00B0 800CF4B0 24B10006 */  addiu      $s1, $a1, 6
/* D00B4 800CF4B4 3042FFFF */  andi       $v0, $v0, 0xffff
/* D00B8 800CF4B8 00021080 */  sll        $v0, $v0, 2
/* D00BC 800CF4BC 00521021 */  addu       $v0, $v0, $s2
/* D00C0 800CF4C0 00832023 */  subu       $a0, $a0, $v1
/* D00C4 800CF4C4 3C01800E */  lui        $at, %hi(drvrnew_rodata_0028)
/* D00C8 800CF4C8 D4225628 */  ldc1       $f2, %lo(drvrnew_rodata_0028)($at)
/* D00CC 800CF4CC 44842000 */  mtc1       $a0, $f4
/* D00D0 800CF4D0 00000000 */  nop
/* D00D4 800CF4D4 46802121 */  cvt.d.w    $f4, $f4
/* D00D8 800CF4D8 46200020 */  cvt.s.d    $f0, $f0
/* D00DC 800CF4DC E6000010 */  swc1       $f0, 0x10($s0)
/* D00E0 800CF4E0 C4400000 */  lwc1       $f0, ($v0)
/* D00E4 800CF4E4 46800020 */  cvt.s.w    $f0, $f0
/* D00E8 800CF4E8 46000021 */  cvt.d.s    $f0, $f0
/* D00EC 800CF4EC 04810004 */  bgez       $a0, .L800CF500
/* D00F0 800CF4F0 46220083 */   div.d     $f2, $f0, $f2
/* D00F4 800CF4F4 3C01800E */  lui        $at, %hi(drvrnew_rodata_0030)
/* D00F8 800CF4F8 D4205630 */  ldc1       $f0, %lo(drvrnew_rodata_0030)($at)
/* D00FC 800CF4FC 46202100 */  add.d      $f4, $f4, $f0
.L800CF500:
/* D0100 800CF500 00002021 */  addu       $a0, $zero, $zero
/* D0104 800CF504 46241002 */  mul.d      $f0, $f2, $f4
/* D0108 800CF508 00002821 */  addu       $a1, $zero, $zero
/* D010C 800CF50C 3C013F80 */  lui        $at, 0x3f80
/* D0110 800CF510 44811000 */  mtc1       $at, $f2
/* D0114 800CF514 02A03021 */  addu       $a2, $s5, $zero
/* D0118 800CF518 24070001 */  addiu      $a3, $zero, 1
/* D011C 800CF51C 24020034 */  addiu      $v0, $zero, 0x34
/* D0120 800CF520 AE000018 */  sw         $zero, 0x18($s0)
/* D0124 800CF524 E6020014 */  swc1       $f2, 0x14($s0)
/* D0128 800CF528 46200020 */  cvt.s.d    $f0, $f0
/* D012C 800CF52C E600001C */  swc1       $f0, 0x1c($s0)
/* D0130 800CF530 0C030C44 */  jal        alHeapDBAlloc
/* D0134 800CF534 AFA20010 */   sw        $v0, 0x10($sp)
/* D0138 800CF538 00002021 */  addu       $a0, $zero, $zero
/* D013C 800CF53C 00002821 */  addu       $a1, $zero, $zero
/* D0140 800CF540 02A03021 */  addu       $a2, $s5, $zero
/* D0144 800CF544 24070001 */  addiu      $a3, $zero, 1
/* D0148 800CF548 AE020024 */  sw         $v0, 0x24($s0)
/* D014C 800CF54C 24020020 */  addiu      $v0, $zero, 0x20
/* D0150 800CF550 0C030C44 */  jal        alHeapDBAlloc
/* D0154 800CF554 AFA20010 */   sw        $v0, 0x10($sp)
/* D0158 800CF558 8E030024 */  lw         $v1, 0x24($s0)
/* D015C 800CF55C AC620014 */  sw         $v0, 0x14($v1)
/* D0160 800CF560 8E020024 */  lw         $v0, 0x24($s0)
/* D0164 800CF564 AC400020 */  sw         $zero, 0x20($v0)
/* D0168 800CF568 8E020024 */  lw         $v0, 0x24($s0)
/* D016C 800CF56C 08033D5F */  j          .L800CF57C
/* D0170 800CF570 AC570024 */   sw        $s7, 0x24($v0)
.L800CF574:
/* D0174 800CF574 AE000024 */  sw         $zero, 0x24($s0)
/* D0178 800CF578 24B10006 */  addiu      $s1, $a1, 6
.L800CF57C:
/* D017C 800CF57C 3222FFFF */  andi       $v0, $s1, 0xffff
/* D0180 800CF580 00021080 */  sll        $v0, $v0, 2
/* D0184 800CF584 00521021 */  addu       $v0, $v0, $s2
/* D0188 800CF588 8C420000 */  lw         $v0, ($v0)
/* D018C 800CF58C 1040003F */  beqz       $v0, .L800CF68C
/* D0190 800CF590 00002021 */   addu      $a0, $zero, $zero
/* D0194 800CF594 00002821 */  addu       $a1, $zero, $zero
/* D0198 800CF598 02A03021 */  addu       $a2, $s5, $zero
/* D019C 800CF59C 24070001 */  addiu      $a3, $zero, 1
/* D01A0 800CF5A0 24020030 */  addiu      $v0, $zero, 0x30
/* D01A4 800CF5A4 0C030C44 */  jal        alHeapDBAlloc
/* D01A8 800CF5A8 AFA20010 */   sw        $v0, 0x10($sp)
/* D01AC 800CF5AC 00002021 */  addu       $a0, $zero, $zero
/* D01B0 800CF5B0 00002821 */  addu       $a1, $zero, $zero
/* D01B4 800CF5B4 02A03021 */  addu       $a2, $s5, $zero
/* D01B8 800CF5B8 24070001 */  addiu      $a3, $zero, 1
/* D01BC 800CF5BC AE020020 */  sw         $v0, 0x20($s0)
/* D01C0 800CF5C0 24020008 */  addiu      $v0, $zero, 8
/* D01C4 800CF5C4 0C030C44 */  jal        alHeapDBAlloc
/* D01C8 800CF5C8 AFA20010 */   sw        $v0, 0x10($sp)
/* D01CC 800CF5CC 8E030020 */  lw         $v1, 0x20($s0)
/* D01D0 800CF5D0 AC620028 */  sw         $v0, 0x28($v1)
/* D01D4 800CF5D4 8E030020 */  lw         $v1, 0x20($s0)
/* D01D8 800CF5D8 02201021 */  addu       $v0, $s1, $zero
/* D01DC 800CF5DC 3042FFFF */  andi       $v0, $v0, 0xffff
/* D01E0 800CF5E0 00021080 */  sll        $v0, $v0, 2
/* D01E4 800CF5E4 00521021 */  addu       $v0, $v0, $s2
/* D01E8 800CF5E8 8C420000 */  lw         $v0, ($v0)
/* D01EC 800CF5EC A4620000 */  sh         $v0, ($v1)
/* D01F0 800CF5F0 8E050020 */  lw         $a1, 0x20($s0)
/* D01F4 800CF5F4 24040007 */  addiu      $a0, $zero, 7
/* D01F8 800CF5F8 26310001 */  addiu      $s1, $s1, 1
/* D01FC 800CF5FC 84A30000 */  lh         $v1, ($a1)
/* D0200 800CF600 24024000 */  addiu      $v0, $zero, 0x4000
/* D0204 800CF604 24A6000E */  addiu      $a2, $a1, 0xe
/* D0208 800CF608 ACB7002C */  sw         $s7, 0x2c($a1)
/* D020C 800CF60C 00031843 */  sra        $v1, $v1, 1
/* D0210 800CF610 00603821 */  addu       $a3, $v1, $zero
/* D0214 800CF614 00431023 */  subu       $v0, $v0, $v1
/* D0218 800CF618 A4A20002 */  sh         $v0, 2($a1)
.L800CF61C:
/* D021C 800CF61C A4C00008 */  sh         $zero, 8($a2)
/* D0220 800CF620 2484FFFF */  addiu      $a0, $a0, -1
/* D0224 800CF624 0481FFFD */  bgez       $a0, .L800CF61C
/* D0228 800CF628 24C6FFFE */   addiu     $a2, $a2, -2
/* D022C 800CF62C 00071400 */  sll        $v0, $a3, 0x10
/* D0230 800CF630 00021403 */  sra        $v0, $v0, 0x10
/* D0234 800CF634 44820000 */  mtc1       $v0, $f0
/* D0238 800CF638 00000000 */  nop
/* D023C 800CF63C 46800021 */  cvt.d.w    $f0, $f0
/* D0240 800CF640 46340103 */  div.d      $f4, $f0, $f20
/* D0244 800CF644 A4A70018 */  sh         $a3, 0x18($a1)
/* D0248 800CF648 24040009 */  addiu      $a0, $zero, 9
/* D024C 800CF64C 24A50012 */  addiu      $a1, $a1, 0x12
/* D0250 800CF650 46202186 */  mov.d      $f6, $f4
.L800CF654:
/* D0254 800CF654 00000000 */  nop
/* D0258 800CF658 46262102 */  mul.d      $f4, $f4, $f6
/* D025C 800CF65C 00000000 */  nop
/* D0260 800CF660 46342002 */  mul.d      $f0, $f4, $f20
/* D0264 800CF664 24840001 */  addiu      $a0, $a0, 1
/* D0268 800CF668 4620008D */  trunc.w.d  $f2, $f0
/* D026C 800CF66C 44021000 */  mfc1       $v0, $f2
/* D0270 800CF670 00000000 */  nop
/* D0274 800CF674 A4A20008 */  sh         $v0, 8($a1)
/* D0278 800CF678 28820010 */  slti       $v0, $a0, 0x10
/* D027C 800CF67C 1440FFF5 */  bnez       $v0, .L800CF654
/* D0280 800CF680 24A50002 */   addiu     $a1, $a1, 2
/* D0284 800CF684 08033DA5 */  j          .L800CF694
/* D0288 800CF688 00000000 */   nop
.L800CF68C:
/* D028C 800CF68C AE000020 */  sw         $zero, 0x20($s0)
/* D0290 800CF690 26310001 */  addiu      $s1, $s1, 1
.L800CF694:
/* D0294 800CF694 92630024 */  lbu        $v1, 0x24($s3)
/* D0298 800CF698 26940001 */  addiu      $s4, $s4, 1
/* D029C 800CF69C 3282FFFF */  andi       $v0, $s4, 0xffff
/* D02A0 800CF6A0 0043102B */  sltu       $v0, $v0, $v1
/* D02A4 800CF6A4 1440FF48 */  bnez       $v0, .L800CF3C8
/* D02A8 800CF6A8 3282FFFF */   andi      $v0, $s4, 0xffff
.L800CF6AC:
/* D02AC 800CF6AC 8FBF0038 */  lw         $ra, 0x38($sp)
/* D02B0 800CF6B0 8FB70034 */  lw         $s7, 0x34($sp)
/* D02B4 800CF6B4 8FB60030 */  lw         $s6, 0x30($sp)
/* D02B8 800CF6B8 8FB5002C */  lw         $s5, 0x2c($sp)
/* D02BC 800CF6BC 8FB40028 */  lw         $s4, 0x28($sp)
/* D02C0 800CF6C0 8FB30024 */  lw         $s3, 0x24($sp)
/* D02C4 800CF6C4 8FB20020 */  lw         $s2, 0x20($sp)
/* D02C8 800CF6C8 8FB1001C */  lw         $s1, 0x1c($sp)
/* D02CC 800CF6CC 8FB00018 */  lw         $s0, 0x18($sp)
/* D02D0 800CF6D0 D7B40040 */  ldc1       $f20, 0x40($sp)
/* D02D4 800CF6D4 03E00008 */  jr         $ra
/* D02D8 800CF6D8 27BD0048 */   addiu     $sp, $sp, 0x48

glabel alEnvmixerNew
/* D02DC 800CF6DC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D02E0 800CF6E0 AFB00018 */  sw         $s0, 0x18($sp)
/* D02E4 800CF6E4 00808021 */  addu       $s0, $a0, $zero
/* D02E8 800CF6E8 AFB1001C */  sw         $s1, 0x1c($sp)
/* D02EC 800CF6EC 00A08821 */  addu       $s1, $a1, $zero
/* D02F0 800CF6F0 3C05800D */  lui        $a1, %hi(alEnvmixerPull)
/* D02F4 800CF6F4 24A5F9D0 */  addiu      $a1, $a1, %lo(alEnvmixerPull)
/* D02F8 800CF6F8 3C06800D */  lui        $a2, %hi(alEnvmixerParam)
/* D02FC 800CF6FC 24C6FED0 */  addiu      $a2, $a2, %lo(alEnvmixerParam)
/* D0300 800CF700 AFBF0020 */  sw         $ra, 0x20($sp)
/* D0304 800CF704 0C0341A0 */  jal        alFilterNew
/* D0308 800CF708 24070004 */   addiu     $a3, $zero, 4
/* D030C 800CF70C 00002021 */  addu       $a0, $zero, $zero
/* D0310 800CF710 00002821 */  addu       $a1, $zero, $zero
/* D0314 800CF714 02203021 */  addu       $a2, $s1, $zero
/* D0318 800CF718 24070001 */  addiu      $a3, $zero, 1
/* D031C 800CF71C 24020050 */  addiu      $v0, $zero, 0x50
/* D0320 800CF720 0C030C44 */  jal        alHeapDBAlloc
/* D0324 800CF724 AFA20010 */   sw        $v0, 0x10($sp)
/* D0328 800CF728 AE020014 */  sw         $v0, 0x14($s0)
/* D032C 800CF72C 24020001 */  addiu      $v0, $zero, 1
/* D0330 800CF730 AE020038 */  sw         $v0, 0x38($s0)
/* D0334 800CF734 24020001 */  addiu      $v0, $zero, 1
/* D0338 800CF738 AE000048 */  sw         $zero, 0x48($s0)
/* D033C 800CF73C A602001A */  sh         $v0, 0x1a($s0)
/* D0340 800CF740 A6020028 */  sh         $v0, 0x28($s0)
/* D0344 800CF744 A602002E */  sh         $v0, 0x2e($s0)
/* D0348 800CF748 A602001C */  sh         $v0, 0x1c($s0)
/* D034C 800CF74C A602001E */  sh         $v0, 0x1e($s0)
/* D0350 800CF750 A6000020 */  sh         $zero, 0x20($s0)
/* D0354 800CF754 A6000022 */  sh         $zero, 0x22($s0)
/* D0358 800CF758 A6020026 */  sh         $v0, 0x26($s0)
/* D035C 800CF75C A6000024 */  sh         $zero, 0x24($s0)
/* D0360 800CF760 A6020026 */  sh         $v0, 0x26($s0)
/* D0364 800CF764 A6000024 */  sh         $zero, 0x24($s0)
/* D0368 800CF768 AE000030 */  sw         $zero, 0x30($s0)
/* D036C 800CF76C AE000034 */  sw         $zero, 0x34($s0)
/* D0370 800CF770 A6000018 */  sh         $zero, 0x18($s0)
/* D0374 800CF774 AE00003C */  sw         $zero, 0x3c($s0)
/* D0378 800CF778 AE000040 */  sw         $zero, 0x40($s0)
/* D037C 800CF77C AE000044 */  sw         $zero, 0x44($s0)
/* D0380 800CF780 8FBF0020 */  lw         $ra, 0x20($sp)
/* D0384 800CF784 8FB1001C */  lw         $s1, 0x1c($sp)
/* D0388 800CF788 8FB00018 */  lw         $s0, 0x18($sp)
/* D038C 800CF78C 03E00008 */  jr         $ra
/* D0390 800CF790 27BD0028 */   addiu     $sp, $sp, 0x28

glabel alLoadNew
/* D0394 800CF794 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* D0398 800CF798 AFB00018 */  sw         $s0, 0x18($sp)
/* D039C 800CF79C 00808021 */  addu       $s0, $a0, $zero
/* D03A0 800CF7A0 AFB30024 */  sw         $s3, 0x24($sp)
/* D03A4 800CF7A4 00A09821 */  addu       $s3, $a1, $zero
/* D03A8 800CF7A8 AFB20020 */  sw         $s2, 0x20($sp)
/* D03AC 800CF7AC 00C09021 */  addu       $s2, $a2, $zero
/* D03B0 800CF7B0 3C05800D */  lui        $a1, %hi(alAdpcmPull)
/* D03B4 800CF7B4 24A5E1D0 */  addiu      $a1, $a1, %lo(alAdpcmPull)
/* D03B8 800CF7B8 3C06800D */  lui        $a2, %hi(alLoadParam)
/* D03BC 800CF7BC 24C6ECEC */  addiu      $a2, $a2, %lo(alLoadParam)
/* D03C0 800CF7C0 00003821 */  addu       $a3, $zero, $zero
/* D03C4 800CF7C4 AFBF0028 */  sw         $ra, 0x28($sp)
/* D03C8 800CF7C8 0C0341A0 */  jal        alFilterNew
/* D03CC 800CF7CC AFB1001C */   sw        $s1, 0x1c($sp)
/* D03D0 800CF7D0 00002021 */  addu       $a0, $zero, $zero
/* D03D4 800CF7D4 00002821 */  addu       $a1, $zero, $zero
/* D03D8 800CF7D8 02403021 */  addu       $a2, $s2, $zero
/* D03DC 800CF7DC 24070001 */  addiu      $a3, $zero, 1
/* D03E0 800CF7E0 24110020 */  addiu      $s1, $zero, 0x20
/* D03E4 800CF7E4 0C030C44 */  jal        alHeapDBAlloc
/* D03E8 800CF7E8 AFB10010 */   sw        $s1, 0x10($sp)
/* D03EC 800CF7EC 00002021 */  addu       $a0, $zero, $zero
/* D03F0 800CF7F0 00002821 */  addu       $a1, $zero, $zero
/* D03F4 800CF7F4 02403021 */  addu       $a2, $s2, $zero
/* D03F8 800CF7F8 24070001 */  addiu      $a3, $zero, 1
/* D03FC 800CF7FC AE020014 */  sw         $v0, 0x14($s0)
/* D0400 800CF800 0C030C44 */  jal        alHeapDBAlloc
/* D0404 800CF804 AFB10010 */   sw        $s1, 0x10($sp)
/* D0408 800CF808 26040034 */  addiu      $a0, $s0, 0x34
/* D040C 800CF80C 0260F809 */  jalr       $s3
/* D0410 800CF810 AE020018 */   sw        $v0, 0x18($s0)
/* D0414 800CF814 AE020030 */  sw         $v0, 0x30($s0)
/* D0418 800CF818 24020001 */  addiu      $v0, $zero, 1
/* D041C 800CF81C AE00003C */  sw         $zero, 0x3c($s0)
/* D0420 800CF820 AE020040 */  sw         $v0, 0x40($s0)
/* D0424 800CF824 AE000044 */  sw         $zero, 0x44($s0)
/* D0428 800CF828 8FBF0028 */  lw         $ra, 0x28($sp)
/* D042C 800CF82C 8FB30024 */  lw         $s3, 0x24($sp)
/* D0430 800CF830 8FB20020 */  lw         $s2, 0x20($sp)
/* D0434 800CF834 8FB1001C */  lw         $s1, 0x1c($sp)
/* D0438 800CF838 8FB00018 */  lw         $s0, 0x18($sp)
/* D043C 800CF83C 03E00008 */  jr         $ra
/* D0440 800CF840 27BD0030 */   addiu     $sp, $sp, 0x30

glabel alResampleNew
/* D0444 800CF844 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D0448 800CF848 AFB00018 */  sw         $s0, 0x18($sp)
/* D044C 800CF84C 00808021 */  addu       $s0, $a0, $zero
/* D0450 800CF850 AFB1001C */  sw         $s1, 0x1c($sp)
/* D0454 800CF854 00A08821 */  addu       $s1, $a1, $zero
/* D0458 800CF858 3C05800D */  lui        $a1, %hi(alResamplePull)
/* D045C 800CF85C 24A50810 */  addiu      $a1, $a1, %lo(alResamplePull)
/* D0460 800CF860 3C06800D */  lui        $a2, %hi(alResampleParam)
/* D0464 800CF864 24C609FC */  addiu      $a2, $a2, %lo(alResampleParam)
/* D0468 800CF868 AFBF0020 */  sw         $ra, 0x20($sp)
/* D046C 800CF86C 0C0341A0 */  jal        alFilterNew
/* D0470 800CF870 24070001 */   addiu     $a3, $zero, 1
/* D0474 800CF874 00002021 */  addu       $a0, $zero, $zero
/* D0478 800CF878 00002821 */  addu       $a1, $zero, $zero
/* D047C 800CF87C 02203021 */  addu       $a2, $s1, $zero
/* D0480 800CF880 24070001 */  addiu      $a3, $zero, 1
/* D0484 800CF884 24020020 */  addiu      $v0, $zero, 0x20
/* D0488 800CF888 0C030C44 */  jal        alHeapDBAlloc
/* D048C 800CF88C AFA20010 */   sw        $v0, 0x10($sp)
/* D0490 800CF890 3C013F80 */  lui        $at, 0x3f80
/* D0494 800CF894 44810000 */  mtc1       $at, $f0
/* D0498 800CF898 AE020014 */  sw         $v0, 0x14($s0)
/* D049C 800CF89C 24020001 */  addiu      $v0, $zero, 1
/* D04A0 800CF8A0 AE000020 */  sw         $zero, 0x20($s0)
/* D04A4 800CF8A4 AE020024 */  sw         $v0, 0x24($s0)
/* D04A8 800CF8A8 AE000030 */  sw         $zero, 0x30($s0)
/* D04AC 800CF8AC AE00001C */  sw         $zero, 0x1c($s0)
/* D04B0 800CF8B0 AE000028 */  sw         $zero, 0x28($s0)
/* D04B4 800CF8B4 AE00002C */  sw         $zero, 0x2c($s0)
/* D04B8 800CF8B8 E6000018 */  swc1       $f0, 0x18($s0)
/* D04BC 800CF8BC 8FBF0020 */  lw         $ra, 0x20($sp)
/* D04C0 800CF8C0 8FB1001C */  lw         $s1, 0x1c($sp)
/* D04C4 800CF8C4 8FB00018 */  lw         $s0, 0x18($sp)
/* D04C8 800CF8C8 03E00008 */  jr         $ra
/* D04CC 800CF8CC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel alAuxBusNew
/* D04D0 800CF8D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D04D4 800CF8D4 AFB00010 */  sw         $s0, 0x10($sp)
/* D04D8 800CF8D8 00808021 */  addu       $s0, $a0, $zero
/* D04DC 800CF8DC AFB20018 */  sw         $s2, 0x18($sp)
/* D04E0 800CF8E0 00A09021 */  addu       $s2, $a1, $zero
/* D04E4 800CF8E4 AFB10014 */  sw         $s1, 0x14($sp)
/* D04E8 800CF8E8 00C08821 */  addu       $s1, $a2, $zero
/* D04EC 800CF8EC 3C05800D */  lui        $a1, %hi(alAuxBusPull)
/* D04F0 800CF8F0 24A5F050 */  addiu      $a1, $a1, %lo(alAuxBusPull)
/* D04F4 800CF8F4 3C06800D */  lui        $a2, %hi(alAuxBusParam)
/* D04F8 800CF8F8 24C6F12C */  addiu      $a2, $a2, %lo(alAuxBusParam)
/* D04FC 800CF8FC AFBF001C */  sw         $ra, 0x1c($sp)
/* D0500 800CF900 0C0341A0 */  jal        alFilterNew
/* D0504 800CF904 24070006 */   addiu     $a3, $zero, 6
/* D0508 800CF908 AE000014 */  sw         $zero, 0x14($s0)
/* D050C 800CF90C AE110018 */  sw         $s1, 0x18($s0)
/* D0510 800CF910 AE12001C */  sw         $s2, 0x1c($s0)
/* D0514 800CF914 8FBF001C */  lw         $ra, 0x1c($sp)
/* D0518 800CF918 8FB20018 */  lw         $s2, 0x18($sp)
/* D051C 800CF91C 8FB10014 */  lw         $s1, 0x14($sp)
/* D0520 800CF920 8FB00010 */  lw         $s0, 0x10($sp)
/* D0524 800CF924 03E00008 */  jr         $ra
/* D0528 800CF928 27BD0020 */   addiu     $sp, $sp, 0x20

glabel alMainBusNew
/* D052C 800CF92C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D0530 800CF930 AFB00010 */  sw         $s0, 0x10($sp)
/* D0534 800CF934 00808021 */  addu       $s0, $a0, $zero
/* D0538 800CF938 AFB20018 */  sw         $s2, 0x18($sp)
/* D053C 800CF93C 00A09021 */  addu       $s2, $a1, $zero
/* D0540 800CF940 AFB10014 */  sw         $s1, 0x14($sp)
/* D0544 800CF944 00C08821 */  addu       $s1, $a2, $zero
/* D0548 800CF948 3C05800D */  lui        $a1, %hi(alMainBusPull)
/* D054C 800CF94C 24A506A0 */  addiu      $a1, $a1, %lo(alMainBusPull)
/* D0550 800CF950 3C06800D */  lui        $a2, %hi(alMainBusParam)
/* D0554 800CF954 24C607E0 */  addiu      $a2, $a2, %lo(alMainBusParam)
/* D0558 800CF958 AFBF001C */  sw         $ra, 0x1c($sp)
/* D055C 800CF95C 0C0341A0 */  jal        alFilterNew
/* D0560 800CF960 24070007 */   addiu     $a3, $zero, 7
/* D0564 800CF964 AE000014 */  sw         $zero, 0x14($s0)
/* D0568 800CF968 AE110018 */  sw         $s1, 0x18($s0)
/* D056C 800CF96C AE12001C */  sw         $s2, 0x1c($s0)
/* D0570 800CF970 8FBF001C */  lw         $ra, 0x1c($sp)
/* D0574 800CF974 8FB20018 */  lw         $s2, 0x18($sp)
/* D0578 800CF978 8FB10014 */  lw         $s1, 0x14($sp)
/* D057C 800CF97C 8FB00010 */  lw         $s0, 0x10($sp)
/* D0580 800CF980 03E00008 */  jr         $ra
/* D0584 800CF984 27BD0020 */   addiu     $sp, $sp, 0x20

glabel alSaveNew
/* D0588 800CF988 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D058C 800CF98C AFB00010 */  sw         $s0, 0x10($sp)
/* D0590 800CF990 00808021 */  addu       $s0, $a0, $zero
/* D0594 800CF994 3C05800D */  lui        $a1, %hi(alSavePull)
/* D0598 800CF998 24A51660 */  addiu      $a1, $a1, %lo(alSavePull)
/* D059C 800CF99C 3C06800D */  lui        $a2, %hi(alSaveParam)
/* D05A0 800CF9A0 24C61708 */  addiu      $a2, $a2, %lo(alSaveParam)
/* D05A4 800CF9A4 AFBF0014 */  sw         $ra, 0x14($sp)
/* D05A8 800CF9A8 0C0341A0 */  jal        alFilterNew
/* D05AC 800CF9AC 24070003 */   addiu     $a3, $zero, 3
/* D05B0 800CF9B0 24020001 */  addiu      $v0, $zero, 1
/* D05B4 800CF9B4 AE000014 */  sw         $zero, 0x14($s0)
/* D05B8 800CF9B8 AE020018 */  sw         $v0, 0x18($s0)
/* D05BC 800CF9BC 8FBF0014 */  lw         $ra, 0x14($sp)
/* D05C0 800CF9C0 8FB00010 */  lw         $s0, 0x10($sp)
/* D05C4 800CF9C4 03E00008 */  jr         $ra
/* D05C8 800CF9C8 27BD0018 */   addiu     $sp, $sp, 0x18
/* D05CC 800CF9CC 00000000 */  nop
