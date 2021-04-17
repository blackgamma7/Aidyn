.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSumcalc
/* C5D70 800C5170 27BDFFF8 */  addiu      $sp, $sp, -8
/* C5D74 800C5174 00001821 */  addu       $v1, $zero, $zero
/* C5D78 800C5178 18A00007 */  blez       $a1, .L800C5198
/* C5D7C 800C517C 00003021 */   addu      $a2, $zero, $zero
.L800C5180:
/* C5D80 800C5180 90820000 */  lbu        $v0, ($a0)
/* C5D84 800C5184 24630001 */  addiu      $v1, $v1, 1
/* C5D88 800C5188 00C23021 */  addu       $a2, $a2, $v0
/* C5D8C 800C518C 0065102A */  slt        $v0, $v1, $a1
/* C5D90 800C5190 1440FFFB */  bnez       $v0, .L800C5180
/* C5D94 800C5194 24840001 */   addiu     $a0, $a0, 1
.L800C5198:
/* C5D98 800C5198 30C2FFFF */  andi       $v0, $a2, 0xffff
/* C5D9C 800C519C 03E00008 */  jr         $ra
/* C5DA0 800C51A0 27BD0008 */   addiu     $sp, $sp, 8

glabel __osIdCheckSum
/* C5DA4 800C51A4 2487001C */  addiu      $a3, $a0, 0x1c
/* C5DA8 800C51A8 A4C00000 */  sh         $zero, ($a2)
/* C5DAC 800C51AC A4A00000 */  sh         $zero, ($a1)
.L800C51B0:
/* C5DB0 800C51B0 94830000 */  lhu        $v1, ($a0)
/* C5DB4 800C51B4 94A20000 */  lhu        $v0, ($a1)
/* C5DB8 800C51B8 00431021 */  addu       $v0, $v0, $v1
/* C5DBC 800C51BC A4A20000 */  sh         $v0, ($a1)
/* C5DC0 800C51C0 94C20000 */  lhu        $v0, ($a2)
/* C5DC4 800C51C4 24840002 */  addiu      $a0, $a0, 2
/* C5DC8 800C51C8 00031827 */  nor        $v1, $zero, $v1
/* C5DCC 800C51CC 00431021 */  addu       $v0, $v0, $v1
/* C5DD0 800C51D0 A4C20000 */  sh         $v0, ($a2)
/* C5DD4 800C51D4 0087102B */  sltu       $v0, $a0, $a3
/* C5DD8 800C51D8 1440FFF5 */  bnez       $v0, .L800C51B0
/* C5DDC 800C51DC 00000000 */   nop
/* C5DE0 800C51E0 03E00008 */  jr         $ra
/* C5DE4 800C51E4 00001021 */   addu      $v0, $zero, $zero

glabel __osRepairPackId
/* C5DE8 800C51E8 27BDFF80 */  addiu      $sp, $sp, -0x80
/* C5DEC 800C51EC AFB10064 */  sw         $s1, 0x64($sp)
/* C5DF0 800C51F0 00808821 */  addu       $s1, $a0, $zero
/* C5DF4 800C51F4 AFB50074 */  sw         $s5, 0x74($sp)
/* C5DF8 800C51F8 00A0A821 */  addu       $s5, $a1, $zero
/* C5DFC 800C51FC AFB3006C */  sw         $s3, 0x6c($sp)
/* C5E00 800C5200 00C09821 */  addu       $s3, $a2, $zero
/* C5E04 800C5204 2402FFFF */  addiu      $v0, $zero, -1
/* C5E08 800C5208 AFBF007C */  sw         $ra, 0x7c($sp)
/* C5E0C 800C520C AFB60078 */  sw         $s6, 0x78($sp)
/* C5E10 800C5210 AFB40070 */  sw         $s4, 0x70($sp)
/* C5E14 800C5214 AFB20068 */  sw         $s2, 0x68($sp)
/* C5E18 800C5218 AFB00060 */  sw         $s0, 0x60($sp)
/* C5E1C 800C521C 0C030C40 */  jal        osGetCount
/* C5E20 800C5220 AE620000 */   sw        $v0, ($s3)
/* C5E24 800C5224 AE620004 */  sw         $v0, 4($s3)
/* C5E28 800C5228 8EA20008 */  lw         $v0, 8($s5)
/* C5E2C 800C522C 8EA3000C */  lw         $v1, 0xc($s5)
/* C5E30 800C5230 AE620008 */  sw         $v0, 8($s3)
/* C5E34 800C5234 AE63000C */  sw         $v1, 0xc($s3)
/* C5E38 800C5238 8EA20010 */  lw         $v0, 0x10($s5)
/* C5E3C 800C523C 8EA30014 */  lw         $v1, 0x14($s5)
/* C5E40 800C5240 AE620010 */  sw         $v0, 0x10($s3)
/* C5E44 800C5244 AE630014 */  sw         $v1, 0x14($s3)
/* C5E48 800C5248 92220065 */  lbu        $v0, 0x65($s1)
/* C5E4C 800C524C 10400006 */  beqz       $v0, .L800C5268
/* C5E50 800C5250 00009021 */   addu      $s2, $zero, $zero
/* C5E54 800C5254 02202021 */  addu       $a0, $s1, $zero
/* C5E58 800C5258 0C031DC8 */  jal        __osPfsSelectBank
/* C5E5C 800C525C 00002821 */   addu      $a1, $zero, $zero
/* C5E60 800C5260 14400092 */  bnez       $v0, .L800C54AC
/* C5E64 800C5264 00000000 */   nop
.L800C5268:
/* C5E68 800C5268 27B40018 */  addiu      $s4, $sp, 0x18
/* C5E6C 800C526C 27B60038 */  addiu      $s6, $sp, 0x38
/* C5E70 800C5270 02202021 */  addu       $a0, $s1, $zero
.L800C5274:
/* C5E74 800C5274 0C031DC8 */  jal        __osPfsSelectBank
/* C5E78 800C5278 324500FF */   andi      $a1, $s2, 0xff
/* C5E7C 800C527C 1440008B */  bnez       $v0, .L800C54AC
/* C5E80 800C5280 00003021 */   addu      $a2, $zero, $zero
/* C5E84 800C5284 8E240004 */  lw         $a0, 4($s1)
/* C5E88 800C5288 8E250008 */  lw         $a1, 8($s1)
/* C5E8C 800C528C 0C0309EC */  jal        __osContRamRead
/* C5E90 800C5290 27A70018 */   addiu     $a3, $sp, 0x18
/* C5E94 800C5294 14400085 */  bnez       $v0, .L800C54AC
/* C5E98 800C5298 26830001 */   addiu     $v1, $s4, 1
/* C5E9C 800C529C 36420080 */  ori        $v0, $s2, 0x80
/* C5EA0 800C52A0 A3A20018 */  sb         $v0, 0x18($sp)
/* C5EA4 800C52A4 26840020 */  addiu      $a0, $s4, 0x20
.L800C52A8:
/* C5EA8 800C52A8 90620000 */  lbu        $v0, ($v1)
/* C5EAC 800C52AC 00021027 */  nor        $v0, $zero, $v0
/* C5EB0 800C52B0 A0620000 */  sb         $v0, ($v1)
/* C5EB4 800C52B4 24630001 */  addiu      $v1, $v1, 1
/* C5EB8 800C52B8 0064102A */  slt        $v0, $v1, $a0
/* C5EBC 800C52BC 1440FFFA */  bnez       $v0, .L800C52A8
/* C5EC0 800C52C0 00003021 */   addu      $a2, $zero, $zero
/* C5EC4 800C52C4 AFA00010 */  sw         $zero, 0x10($sp)
/* C5EC8 800C52C8 8E240004 */  lw         $a0, 4($s1)
/* C5ECC 800C52CC 8E250008 */  lw         $a1, 8($s1)
/* C5ED0 800C52D0 0C030B30 */  jal        __osContRamWrite
/* C5ED4 800C52D4 27A70018 */   addiu     $a3, $sp, 0x18
/* C5ED8 800C52D8 14400074 */  bnez       $v0, .L800C54AC
/* C5EDC 800C52DC 00003021 */   addu      $a2, $zero, $zero
/* C5EE0 800C52E0 8E240004 */  lw         $a0, 4($s1)
/* C5EE4 800C52E4 8E250008 */  lw         $a1, 8($s1)
/* C5EE8 800C52E8 0C0309EC */  jal        __osContRamRead
/* C5EEC 800C52EC 27A70038 */   addiu     $a3, $sp, 0x38
/* C5EF0 800C52F0 1440006E */  bnez       $v0, .L800C54AC
/* C5EF4 800C52F4 00008021 */   addu      $s0, $zero, $zero
/* C5EF8 800C52F8 02802821 */  addu       $a1, $s4, $zero
/* C5EFC 800C52FC 02C02021 */  addu       $a0, $s6, $zero
.L800C5300:
/* C5F00 800C5300 90830000 */  lbu        $v1, ($a0)
/* C5F04 800C5304 90A20000 */  lbu        $v0, ($a1)
/* C5F08 800C5308 14620007 */  bne        $v1, $v0, .L800C5328
/* C5F0C 800C530C 24020020 */   addiu     $v0, $zero, 0x20
/* C5F10 800C5310 24A50001 */  addiu      $a1, $a1, 1
/* C5F14 800C5314 26100001 */  addiu      $s0, $s0, 1
/* C5F18 800C5318 2A020020 */  slti       $v0, $s0, 0x20
/* C5F1C 800C531C 1440FFF8 */  bnez       $v0, .L800C5300
/* C5F20 800C5320 24840001 */   addiu     $a0, $a0, 1
/* C5F24 800C5324 24020020 */  addiu      $v0, $zero, 0x20
.L800C5328:
/* C5F28 800C5328 16020015 */  bne        $s0, $v0, .L800C5380
/* C5F2C 800C532C 00000000 */   nop
/* C5F30 800C5330 1A40000F */  blez       $s2, .L800C5370
/* C5F34 800C5334 02202021 */   addu      $a0, $s1, $zero
/* C5F38 800C5338 0C031DC8 */  jal        __osPfsSelectBank
/* C5F3C 800C533C 00002821 */   addu      $a1, $zero, $zero
/* C5F40 800C5340 1440005A */  bnez       $v0, .L800C54AC
/* C5F44 800C5344 00003021 */   addu      $a2, $zero, $zero
/* C5F48 800C5348 8E240004 */  lw         $a0, 4($s1)
/* C5F4C 800C534C 8E250008 */  lw         $a1, 8($s1)
/* C5F50 800C5350 0C0309EC */  jal        __osContRamRead
/* C5F54 800C5354 02803821 */   addu      $a3, $s4, $zero
/* C5F58 800C5358 14400054 */  bnez       $v0, .L800C54AC
/* C5F5C 800C535C 00000000 */   nop
/* C5F60 800C5360 93A30018 */  lbu        $v1, 0x18($sp)
/* C5F64 800C5364 24020080 */  addiu      $v0, $zero, 0x80
/* C5F68 800C5368 14620005 */  bne        $v1, $v0, .L800C5380
/* C5F6C 800C536C 00000000 */   nop
.L800C5370:
/* C5F70 800C5370 26520001 */  addiu      $s2, $s2, 1
/* C5F74 800C5374 2A42003E */  slti       $v0, $s2, 0x3e
/* C5F78 800C5378 1440FFBE */  bnez       $v0, .L800C5274
/* C5F7C 800C537C 02202021 */   addu      $a0, $s1, $zero
.L800C5380:
/* C5F80 800C5380 92220065 */  lbu        $v0, 0x65($s1)
/* C5F84 800C5384 10400005 */  beqz       $v0, .L800C539C
/* C5F88 800C5388 02202021 */   addu      $a0, $s1, $zero
/* C5F8C 800C538C 0C031DC8 */  jal        __osPfsSelectBank
/* C5F90 800C5390 00002821 */   addu      $a1, $zero, $zero
/* C5F94 800C5394 14400045 */  bnez       $v0, .L800C54AC
/* C5F98 800C5398 00000000 */   nop
.L800C539C:
/* C5F9C 800C539C 96A20018 */  lhu        $v0, 0x18($s5)
/* C5FA0 800C53A0 2666001E */  addiu      $a2, $s3, 0x1e
/* C5FA4 800C53A4 02602021 */  addu       $a0, $s3, $zero
/* C5FA8 800C53A8 0012182A */  slt        $v1, $zero, $s2
/* C5FAC 800C53AC A272001A */  sb         $s2, 0x1a($s3)
/* C5FB0 800C53B0 3042FFFE */  andi       $v0, $v0, 0xfffe
/* C5FB4 800C53B4 00621825 */  or         $v1, $v1, $v0
/* C5FB8 800C53B8 A6630018 */  sh         $v1, 0x18($s3)
/* C5FBC 800C53BC 92A2001B */  lbu        $v0, 0x1b($s5)
/* C5FC0 800C53C0 2665001C */  addiu      $a1, $s3, 0x1c
/* C5FC4 800C53C4 00A03821 */  addu       $a3, $a1, $zero
/* C5FC8 800C53C8 A660001E */  sh         $zero, 0x1e($s3)
/* C5FCC 800C53CC A660001C */  sh         $zero, 0x1c($s3)
/* C5FD0 800C53D0 A262001B */  sb         $v0, 0x1b($s3)
.L800C53D4:
/* C5FD4 800C53D4 94830000 */  lhu        $v1, ($a0)
/* C5FD8 800C53D8 94A20000 */  lhu        $v0, ($a1)
/* C5FDC 800C53DC 00431021 */  addu       $v0, $v0, $v1
/* C5FE0 800C53E0 A4A20000 */  sh         $v0, ($a1)
/* C5FE4 800C53E4 94C20000 */  lhu        $v0, ($a2)
/* C5FE8 800C53E8 24840002 */  addiu      $a0, $a0, 2
/* C5FEC 800C53EC 00031827 */  nor        $v1, $zero, $v1
/* C5FF0 800C53F0 00431021 */  addu       $v0, $v0, $v1
/* C5FF4 800C53F4 A4C20000 */  sh         $v0, ($a2)
/* C5FF8 800C53F8 0087102B */  sltu       $v0, $a0, $a3
/* C5FFC 800C53FC 1440FFF5 */  bnez       $v0, .L800C53D4
/* C6000 800C5400 00008021 */   addu      $s0, $zero, $zero
/* C6004 800C5404 24140001 */  addiu      $s4, $zero, 1
/* C6008 800C5408 27B20018 */  addiu      $s2, $sp, 0x18
/* C600C 800C540C 24020001 */  addiu      $v0, $zero, 1
/* C6010 800C5410 A7A20058 */  sh         $v0, 0x58($sp)
/* C6014 800C5414 24020003 */  addiu      $v0, $zero, 3
/* C6018 800C5418 A7A2005A */  sh         $v0, 0x5a($sp)
/* C601C 800C541C 24020004 */  addiu      $v0, $zero, 4
/* C6020 800C5420 A7A2005C */  sh         $v0, 0x5c($sp)
/* C6024 800C5424 24020006 */  addiu      $v0, $zero, 6
/* C6028 800C5428 A7A2005E */  sh         $v0, 0x5e($sp)
.L800C542C:
/* C602C 800C542C 96460040 */  lhu        $a2, 0x40($s2)
/* C6030 800C5430 AFB40010 */  sw         $s4, 0x10($sp)
/* C6034 800C5434 8E240004 */  lw         $a0, 4($s1)
/* C6038 800C5438 8E250008 */  lw         $a1, 8($s1)
/* C603C 800C543C 0C030B30 */  jal        __osContRamWrite
/* C6040 800C5440 02603821 */   addu      $a3, $s3, $zero
/* C6044 800C5444 14400019 */  bnez       $v0, .L800C54AC
/* C6048 800C5448 26100001 */   addiu     $s0, $s0, 1
/* C604C 800C544C 2A020004 */  slti       $v0, $s0, 4
/* C6050 800C5450 1440FFF6 */  bnez       $v0, .L800C542C
/* C6054 800C5454 26520002 */   addiu     $s2, $s2, 2
/* C6058 800C5458 8E240004 */  lw         $a0, 4($s1)
/* C605C 800C545C 8E250008 */  lw         $a1, 8($s1)
/* C6060 800C5460 24060001 */  addiu      $a2, $zero, 1
/* C6064 800C5464 0C0309EC */  jal        __osContRamRead
/* C6068 800C5468 27A70018 */   addiu     $a3, $sp, 0x18
/* C606C 800C546C 10400005 */  beqz       $v0, .L800C5484
/* C6070 800C5470 02603021 */   addu      $a2, $s3, $zero
/* C6074 800C5474 0803152B */  j          .L800C54AC
/* C6078 800C5478 00000000 */   nop
.L800C547C:
/* C607C 800C547C 0803152B */  j          .L800C54AC
/* C6080 800C5480 2402000B */   addiu     $v0, $zero, 0xb
.L800C5484:
/* C6084 800C5484 27A40018 */  addiu      $a0, $sp, 0x18
/* C6088 800C5488 24C50020 */  addiu      $a1, $a2, 0x20
.L800C548C:
/* C608C 800C548C 90830000 */  lbu        $v1, ($a0)
/* C6090 800C5490 90C20000 */  lbu        $v0, ($a2)
/* C6094 800C5494 1462FFF9 */  bne        $v1, $v0, .L800C547C
/* C6098 800C5498 24C60001 */   addiu     $a2, $a2, 1
/* C609C 800C549C 00C5102A */  slt        $v0, $a2, $a1
/* C60A0 800C54A0 1440FFFA */  bnez       $v0, .L800C548C
/* C60A4 800C54A4 24840001 */   addiu     $a0, $a0, 1
/* C60A8 800C54A8 00001021 */  addu       $v0, $zero, $zero
.L800C54AC:
/* C60AC 800C54AC 8FBF007C */  lw         $ra, 0x7c($sp)
/* C60B0 800C54B0 8FB60078 */  lw         $s6, 0x78($sp)
/* C60B4 800C54B4 8FB50074 */  lw         $s5, 0x74($sp)
/* C60B8 800C54B8 8FB40070 */  lw         $s4, 0x70($sp)
/* C60BC 800C54BC 8FB3006C */  lw         $s3, 0x6c($sp)
/* C60C0 800C54C0 8FB20068 */  lw         $s2, 0x68($sp)
/* C60C4 800C54C4 8FB10064 */  lw         $s1, 0x64($sp)
/* C60C8 800C54C8 8FB00060 */  lw         $s0, 0x60($sp)
/* C60CC 800C54CC 03E00008 */  jr         $ra
/* C60D0 800C54D0 27BD0080 */   addiu     $sp, $sp, 0x80

glabel __osCheckPackId
/* C60D4 800C54D4 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* C60D8 800C54D8 AFB40038 */  sw         $s4, 0x38($sp)
/* C60DC 800C54DC 0080A021 */  addu       $s4, $a0, $zero
/* C60E0 800C54E0 AFBF0040 */  sw         $ra, 0x40($sp)
/* C60E4 800C54E4 AFB5003C */  sw         $s5, 0x3c($sp)
/* C60E8 800C54E8 AFB30034 */  sw         $s3, 0x34($sp)
/* C60EC 800C54EC AFB20030 */  sw         $s2, 0x30($sp)
/* C60F0 800C54F0 AFB1002C */  sw         $s1, 0x2c($sp)
/* C60F4 800C54F4 AFB00028 */  sw         $s0, 0x28($sp)
/* C60F8 800C54F8 92820065 */  lbu        $v0, 0x65($s4)
/* C60FC 800C54FC 10400005 */  beqz       $v0, .L800C5514
/* C6100 800C5500 00A09021 */   addu      $s2, $a1, $zero
/* C6104 800C5504 0C031DC8 */  jal        __osPfsSelectBank
/* C6108 800C5508 00002821 */   addu      $a1, $zero, $zero
/* C610C 800C550C 14400041 */  bnez       $v0, .L800C5614
/* C6110 800C5510 00000000 */   nop
.L800C5514:
/* C6114 800C5514 24130001 */  addiu      $s3, $zero, 1
/* C6118 800C5518 27B0001A */  addiu      $s0, $sp, 0x1a
/* C611C 800C551C 24020001 */  addiu      $v0, $zero, 1
/* C6120 800C5520 A7A20018 */  sh         $v0, 0x18($sp)
/* C6124 800C5524 24020003 */  addiu      $v0, $zero, 3
/* C6128 800C5528 A7A2001A */  sh         $v0, 0x1a($sp)
/* C612C 800C552C 24020004 */  addiu      $v0, $zero, 4
/* C6130 800C5530 A7A2001C */  sh         $v0, 0x1c($sp)
/* C6134 800C5534 24020006 */  addiu      $v0, $zero, 6
/* C6138 800C5538 A7A2001E */  sh         $v0, 0x1e($sp)
.L800C553C:
/* C613C 800C553C 8E840004 */  lw         $a0, 4($s4)
/* C6140 800C5540 8E850008 */  lw         $a1, 8($s4)
/* C6144 800C5544 96060000 */  lhu        $a2, ($s0)
/* C6148 800C5548 0C0309EC */  jal        __osContRamRead
/* C614C 800C554C 02403821 */   addu      $a3, $s2, $zero
/* C6150 800C5550 14400030 */  bnez       $v0, .L800C5614
/* C6154 800C5554 02402821 */   addu      $a1, $s2, $zero
/* C6158 800C5558 2647001C */  addiu      $a3, $s2, 0x1c
/* C615C 800C555C A7A00022 */  sh         $zero, 0x22($sp)
/* C6160 800C5560 A7A00020 */  sh         $zero, 0x20($sp)
.L800C5564:
/* C6164 800C5564 94A20000 */  lhu        $v0, ($a1)
/* C6168 800C5568 97A30020 */  lhu        $v1, 0x20($sp)
/* C616C 800C556C 97A40022 */  lhu        $a0, 0x22($sp)
/* C6170 800C5570 24A50002 */  addiu      $a1, $a1, 2
/* C6174 800C5574 00623021 */  addu       $a2, $v1, $v0
/* C6178 800C5578 00021027 */  nor        $v0, $zero, $v0
/* C617C 800C557C 00822021 */  addu       $a0, $a0, $v0
/* C6180 800C5580 00A7102B */  sltu       $v0, $a1, $a3
/* C6184 800C5584 A7A60020 */  sh         $a2, 0x20($sp)
/* C6188 800C5588 1440FFF6 */  bnez       $v0, .L800C5564
/* C618C 800C558C A7A40022 */   sh        $a0, 0x22($sp)
/* C6190 800C5590 9643001C */  lhu        $v1, 0x1c($s2)
/* C6194 800C5594 30C2FFFF */  andi       $v0, $a2, 0xffff
/* C6198 800C5598 54620006 */  bnel       $v1, $v0, .L800C55B4
/* C619C 800C559C 26730001 */   addiu     $s3, $s3, 1
/* C61A0 800C55A0 9643001E */  lhu        $v1, 0x1e($s2)
/* C61A4 800C55A4 3082FFFF */  andi       $v0, $a0, 0xffff
/* C61A8 800C55A8 10620006 */  beq        $v1, $v0, .L800C55C4
/* C61AC 800C55AC 24020004 */   addiu     $v0, $zero, 4
/* C61B0 800C55B0 26730001 */  addiu      $s3, $s3, 1
.L800C55B4:
/* C61B4 800C55B4 2A620004 */  slti       $v0, $s3, 4
/* C61B8 800C55B8 1440FFE0 */  bnez       $v0, .L800C553C
/* C61BC 800C55BC 26100002 */   addiu     $s0, $s0, 2
/* C61C0 800C55C0 24020004 */  addiu      $v0, $zero, 4
.L800C55C4:
/* C61C4 800C55C4 16620003 */  bne        $s3, $v0, .L800C55D4
/* C61C8 800C55C8 00008021 */   addu      $s0, $zero, $zero
/* C61CC 800C55CC 08031585 */  j          .L800C5614
/* C61D0 800C55D0 2402000A */   addiu     $v0, $zero, 0xa
.L800C55D4:
/* C61D4 800C55D4 24150001 */  addiu      $s5, $zero, 1
/* C61D8 800C55D8 27B10018 */  addiu      $s1, $sp, 0x18
.L800C55DC:
/* C61DC 800C55DC 52130009 */  beql       $s0, $s3, .L800C5604
/* C61E0 800C55E0 26100001 */   addiu     $s0, $s0, 1
/* C61E4 800C55E4 96260000 */  lhu        $a2, ($s1)
/* C61E8 800C55E8 AFB50010 */  sw         $s5, 0x10($sp)
/* C61EC 800C55EC 8E840004 */  lw         $a0, 4($s4)
/* C61F0 800C55F0 8E850008 */  lw         $a1, 8($s4)
/* C61F4 800C55F4 0C030B30 */  jal        __osContRamWrite
/* C61F8 800C55F8 02403821 */   addu      $a3, $s2, $zero
/* C61FC 800C55FC 14400005 */  bnez       $v0, .L800C5614
/* C6200 800C5600 26100001 */   addiu     $s0, $s0, 1
.L800C5604:
/* C6204 800C5604 2A020004 */  slti       $v0, $s0, 4
/* C6208 800C5608 1440FFF4 */  bnez       $v0, .L800C55DC
/* C620C 800C560C 26310002 */   addiu     $s1, $s1, 2
/* C6210 800C5610 00001021 */  addu       $v0, $zero, $zero
.L800C5614:
/* C6214 800C5614 8FBF0040 */  lw         $ra, 0x40($sp)
/* C6218 800C5618 8FB5003C */  lw         $s5, 0x3c($sp)
/* C621C 800C561C 8FB40038 */  lw         $s4, 0x38($sp)
/* C6220 800C5620 8FB30034 */  lw         $s3, 0x34($sp)
/* C6224 800C5624 8FB20030 */  lw         $s2, 0x30($sp)
/* C6228 800C5628 8FB1002C */  lw         $s1, 0x2c($sp)
/* C622C 800C562C 8FB00028 */  lw         $s0, 0x28($sp)
/* C6230 800C5630 03E00008 */  jr         $ra
/* C6234 800C5634 27BD0048 */   addiu     $sp, $sp, 0x48

glabel __osGetId
/* C6238 800C5638 27BDFF98 */  addiu      $sp, $sp, -0x68
/* C623C 800C563C AFB00058 */  sw         $s0, 0x58($sp)
/* C6240 800C5640 00808021 */  addu       $s0, $a0, $zero
/* C6244 800C5644 AFBF0060 */  sw         $ra, 0x60($sp)
/* C6248 800C5648 AFB1005C */  sw         $s1, 0x5c($sp)
/* C624C 800C564C 92020065 */  lbu        $v0, 0x65($s0)
/* C6250 800C5650 10400006 */  beqz       $v0, .L800C566C
/* C6254 800C5654 00000000 */   nop
/* C6258 800C5658 0C031DC8 */  jal        __osPfsSelectBank
/* C625C 800C565C 00002821 */   addu      $a1, $zero, $zero
/* C6260 800C5660 00401821 */  addu       $v1, $v0, $zero
/* C6264 800C5664 14600062 */  bnez       $v1, .L800C57F0
/* C6268 800C5668 00000000 */   nop
.L800C566C:
/* C626C 800C566C 8E040004 */  lw         $a0, 4($s0)
/* C6270 800C5670 8E050008 */  lw         $a1, 8($s0)
/* C6274 800C5674 24060001 */  addiu      $a2, $zero, 1
/* C6278 800C5678 0C0309EC */  jal        __osContRamRead
/* C627C 800C567C 27A70010 */   addiu     $a3, $sp, 0x10
/* C6280 800C5680 00401821 */  addu       $v1, $v0, $zero
/* C6284 800C5684 1460005A */  bnez       $v1, .L800C57F0
/* C6288 800C5688 27A50010 */   addiu     $a1, $sp, 0x10
/* C628C 800C568C 27A7002C */  addiu      $a3, $sp, 0x2c
/* C6290 800C5690 A7A00052 */  sh         $zero, 0x52($sp)
/* C6294 800C5694 A7A00050 */  sh         $zero, 0x50($sp)
.L800C5698:
/* C6298 800C5698 94A20000 */  lhu        $v0, ($a1)
/* C629C 800C569C 97A30050 */  lhu        $v1, 0x50($sp)
/* C62A0 800C56A0 97A40052 */  lhu        $a0, 0x52($sp)
/* C62A4 800C56A4 24A50002 */  addiu      $a1, $a1, 2
/* C62A8 800C56A8 00623021 */  addu       $a2, $v1, $v0
/* C62AC 800C56AC 00021027 */  nor        $v0, $zero, $v0
/* C62B0 800C56B0 00822021 */  addu       $a0, $a0, $v0
/* C62B4 800C56B4 00A7102B */  sltu       $v0, $a1, $a3
/* C62B8 800C56B8 A7A60050 */  sh         $a2, 0x50($sp)
/* C62BC 800C56BC 1440FFF6 */  bnez       $v0, .L800C5698
/* C62C0 800C56C0 A7A40052 */   sh        $a0, 0x52($sp)
/* C62C4 800C56C4 97A3002C */  lhu        $v1, 0x2c($sp)
/* C62C8 800C56C8 30C2FFFF */  andi       $v0, $a2, 0xffff
/* C62CC 800C56CC 14620005 */  bne        $v1, $v0, .L800C56E4
/* C62D0 800C56D0 27B10010 */   addiu     $s1, $sp, 0x10
/* C62D4 800C56D4 97A3002E */  lhu        $v1, 0x2e($sp)
/* C62D8 800C56D8 3082FFFF */  andi       $v0, $a0, 0xffff
/* C62DC 800C56DC 10620013 */  beq        $v1, $v0, .L800C572C
/* C62E0 800C56E0 00000000 */   nop
.L800C56E4:
/* C62E4 800C56E4 02002021 */  addu       $a0, $s0, $zero
/* C62E8 800C56E8 0C031535 */  jal        __osCheckPackId
/* C62EC 800C56EC 02202821 */   addu      $a1, $s1, $zero
/* C62F0 800C56F0 00401821 */  addu       $v1, $v0, $zero
/* C62F4 800C56F4 2402000A */  addiu      $v0, $zero, 0xa
/* C62F8 800C56F8 1462000A */  bne        $v1, $v0, .L800C5724
/* C62FC 800C56FC 02002021 */   addu      $a0, $s0, $zero
/* C6300 800C5700 02202821 */  addu       $a1, $s1, $zero
/* C6304 800C5704 27B10030 */  addiu      $s1, $sp, 0x30
/* C6308 800C5708 0C03147A */  jal        __osRepairPackId
/* C630C 800C570C 02203021 */   addu      $a2, $s1, $zero
/* C6310 800C5710 00401821 */  addu       $v1, $v0, $zero
/* C6314 800C5714 10600005 */  beqz       $v1, .L800C572C
/* C6318 800C5718 00000000 */   nop
/* C631C 800C571C 080315FC */  j          .L800C57F0
/* C6320 800C5720 00000000 */   nop
.L800C5724:
/* C6324 800C5724 14600032 */  bnez       $v1, .L800C57F0
/* C6328 800C5728 00601021 */   addu      $v0, $v1, $zero
.L800C572C:
/* C632C 800C572C 96220018 */  lhu        $v0, 0x18($s1)
/* C6330 800C5730 30420001 */  andi       $v0, $v0, 1
/* C6334 800C5734 1440000F */  bnez       $v0, .L800C5774
/* C6338 800C5738 02202021 */   addu      $a0, $s1, $zero
/* C633C 800C573C 02002021 */  addu       $a0, $s0, $zero
/* C6340 800C5740 02202821 */  addu       $a1, $s1, $zero
/* C6344 800C5744 27B10030 */  addiu      $s1, $sp, 0x30
/* C6348 800C5748 0C03147A */  jal        __osRepairPackId
/* C634C 800C574C 02203021 */   addu      $a2, $s1, $zero
/* C6350 800C5750 00401821 */  addu       $v1, $v0, $zero
/* C6354 800C5754 14600026 */  bnez       $v1, .L800C57F0
/* C6358 800C5758 00000000 */   nop
/* C635C 800C575C 97A20048 */  lhu        $v0, 0x48($sp)
/* C6360 800C5760 30420001 */  andi       $v0, $v0, 1
/* C6364 800C5764 14400003 */  bnez       $v0, .L800C5774
/* C6368 800C5768 02202021 */   addu      $a0, $s1, $zero
/* C636C 800C576C 080315FC */  j          .L800C57F0
/* C6370 800C5770 2402000B */   addiu     $v0, $zero, 0xb
.L800C5774:
/* C6374 800C5774 2605000C */  addiu      $a1, $s0, 0xc
/* C6378 800C5778 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C637C 800C577C 24060020 */   addiu     $a2, $zero, 0x20
/* C6380 800C5780 8E040004 */  lw         $a0, 4($s0)
/* C6384 800C5784 8E050008 */  lw         $a1, 8($s0)
/* C6388 800C5788 9222001B */  lbu        $v0, 0x1b($s1)
/* C638C 800C578C 24060007 */  addiu      $a2, $zero, 7
/* C6390 800C5790 AE02004C */  sw         $v0, 0x4c($s0)
/* C6394 800C5794 9223001A */  lbu        $v1, 0x1a($s1)
/* C6398 800C5798 2607002C */  addiu      $a3, $s0, 0x2c
/* C639C 800C579C 24020010 */  addiu      $v0, $zero, 0x10
/* C63A0 800C57A0 AE020050 */  sw         $v0, 0x50($s0)
/* C63A4 800C57A4 24020008 */  addiu      $v0, $zero, 8
/* C63A8 800C57A8 AE020054 */  sw         $v0, 0x54($s0)
/* C63AC 800C57AC A2030064 */  sb         $v1, 0x64($s0)
/* C63B0 800C57B0 92020064 */  lbu        $v0, 0x64($s0)
/* C63B4 800C57B4 00031840 */  sll        $v1, $v1, 1
/* C63B8 800C57B8 24630003 */  addiu      $v1, $v1, 3
/* C63BC 800C57BC AE030060 */  sw         $v1, 0x60($s0)
/* C63C0 800C57C0 92030064 */  lbu        $v1, 0x64($s0)
/* C63C4 800C57C4 24420001 */  addiu      $v0, $v0, 1
/* C63C8 800C57C8 000210C0 */  sll        $v0, $v0, 3
/* C63CC 800C57CC 000318C0 */  sll        $v1, $v1, 3
/* C63D0 800C57D0 AE020058 */  sw         $v0, 0x58($s0)
/* C63D4 800C57D4 00431021 */  addu       $v0, $v0, $v1
/* C63D8 800C57D8 0C0309EC */  jal        __osContRamRead
/* C63DC 800C57DC AE02005C */   sw        $v0, 0x5c($s0)
/* C63E0 800C57E0 00401821 */  addu       $v1, $v0, $zero
/* C63E4 800C57E4 0003102B */  sltu       $v0, $zero, $v1
/* C63E8 800C57E8 00021023 */  negu       $v0, $v0
/* C63EC 800C57EC 00621024 */  and        $v0, $v1, $v0
.L800C57F0:
/* C63F0 800C57F0 8FBF0060 */  lw         $ra, 0x60($sp)
/* C63F4 800C57F4 8FB1005C */  lw         $s1, 0x5c($sp)
/* C63F8 800C57F8 8FB00058 */  lw         $s0, 0x58($sp)
/* C63FC 800C57FC 03E00008 */  jr         $ra
/* C6400 800C5800 27BD0068 */   addiu     $sp, $sp, 0x68

glabel __osCheckId
/* C6404 800C5804 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* C6408 800C5808 AFB00030 */  sw         $s0, 0x30($sp)
/* C640C 800C580C 00808021 */  addu       $s0, $a0, $zero
/* C6410 800C5810 AFBF0034 */  sw         $ra, 0x34($sp)
/* C6414 800C5814 92020065 */  lbu        $v0, 0x65($s0)
/* C6418 800C5818 1040000C */  beqz       $v0, .L800C584C
/* C641C 800C581C 00000000 */   nop
/* C6420 800C5820 0C031DC8 */  jal        __osPfsSelectBank
/* C6424 800C5824 00002821 */   addu      $a1, $zero, $zero
/* C6428 800C5828 00401821 */  addu       $v1, $v0, $zero
/* C642C 800C582C 24020002 */  addiu      $v0, $zero, 2
/* C6430 800C5830 14620004 */  bne        $v1, $v0, .L800C5844
/* C6434 800C5834 02002021 */   addu      $a0, $s0, $zero
/* C6438 800C5838 0C031DC8 */  jal        __osPfsSelectBank
/* C643C 800C583C 00002821 */   addu      $a1, $zero, $zero
/* C6440 800C5840 00401821 */  addu       $v1, $v0, $zero
.L800C5844:
/* C6444 800C5844 14600019 */  bnez       $v1, .L800C58AC
/* C6448 800C5848 00601021 */   addu      $v0, $v1, $zero
.L800C584C:
/* C644C 800C584C 8E040004 */  lw         $a0, 4($s0)
/* C6450 800C5850 8E050008 */  lw         $a1, 8($s0)
/* C6454 800C5854 24060001 */  addiu      $a2, $zero, 1
/* C6458 800C5858 0C0309EC */  jal        __osContRamRead
/* C645C 800C585C 27A70010 */   addiu     $a3, $sp, 0x10
/* C6460 800C5860 00401821 */  addu       $v1, $v0, $zero
/* C6464 800C5864 1060000B */  beqz       $v1, .L800C5894
/* C6468 800C5868 24020002 */   addiu     $v0, $zero, 2
/* C646C 800C586C 1462000F */  bne        $v1, $v0, .L800C58AC
/* C6470 800C5870 00601021 */   addu      $v0, $v1, $zero
/* C6474 800C5874 8E040004 */  lw         $a0, 4($s0)
/* C6478 800C5878 8E050008 */  lw         $a1, 8($s0)
/* C647C 800C587C 24060001 */  addiu      $a2, $zero, 1
/* C6480 800C5880 0C0309EC */  jal        __osContRamRead
/* C6484 800C5884 27A70010 */   addiu     $a3, $sp, 0x10
/* C6488 800C5888 00401821 */  addu       $v1, $v0, $zero
/* C648C 800C588C 14600007 */  bnez       $v1, .L800C58AC
/* C6490 800C5890 00000000 */   nop
.L800C5894:
/* C6494 800C5894 2604000C */  addiu      $a0, $s0, 0xc
/* C6498 800C5898 27A50010 */  addiu      $a1, $sp, 0x10
/* C649C 800C589C 0C031700 */  jal        _bcmp
/* C64A0 800C58A0 24060020 */   addiu     $a2, $zero, 0x20
/* C64A4 800C58A4 0002102B */  sltu       $v0, $zero, $v0
/* C64A8 800C58A8 00021040 */  sll        $v0, $v0, 1
.L800C58AC:
/* C64AC 800C58AC 8FBF0034 */  lw         $ra, 0x34($sp)
/* C64B0 800C58B0 8FB00030 */  lw         $s0, 0x30($sp)
/* C64B4 800C58B4 03E00008 */  jr         $ra
/* C64B8 800C58B8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __osPfsRWInode
/* C64BC 800C58BC 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* C64C0 800C58C0 AFB20030 */  sw         $s2, 0x30($sp)
/* C64C4 800C58C4 00809021 */  addu       $s2, $a0, $zero
/* C64C8 800C58C8 AFB40038 */  sw         $s4, 0x38($sp)
/* C64CC 800C58CC 00A0A021 */  addu       $s4, $a1, $zero
/* C64D0 800C58D0 AFB60040 */  sw         $s6, 0x40($sp)
/* C64D4 800C58D4 00C0B021 */  addu       $s6, $a2, $zero
/* C64D8 800C58D8 AFB70044 */  sw         $s7, 0x44($sp)
/* C64DC 800C58DC 00E0B821 */  addu       $s7, $a3, $zero
/* C64E0 800C58E0 32C200FF */  andi       $v0, $s6, 0xff
/* C64E4 800C58E4 AFBF004C */  sw         $ra, 0x4c($sp)
/* C64E8 800C58E8 AFBE0048 */  sw         $fp, 0x48($sp)
/* C64EC 800C58EC AFB5003C */  sw         $s5, 0x3c($sp)
/* C64F0 800C58F0 AFB30034 */  sw         $s3, 0x34($sp)
/* C64F4 800C58F4 AFB1002C */  sw         $s1, 0x2c($sp)
/* C64F8 800C58F8 14400011 */  bnez       $v0, .L800C5940
/* C64FC 800C58FC AFB00028 */   sw        $s0, 0x28($sp)
/* C6500 800C5900 3C03800F */  lui        $v1, %hi(__osPfsInodeCacheBank)
/* C6504 800C5904 90633864 */  lbu        $v1, %lo(__osPfsInodeCacheBank)($v1)
/* C6508 800C5908 32E200FF */  andi       $v0, $s7, 0xff
/* C650C 800C590C 1443000C */  bne        $v0, $v1, .L800C5940
/* C6510 800C5910 00000000 */   nop
/* C6514 800C5914 8E430008 */  lw         $v1, 8($s2)
/* C6518 800C5918 3C02800F */  lui        $v0, %hi(__osPfsInodeCacheChannel)
/* C651C 800C591C 8C423860 */  lw         $v0, %lo(__osPfsInodeCacheChannel)($v0)
/* C6520 800C5920 14620007 */  bne        $v1, $v0, .L800C5940
/* C6524 800C5924 00000000 */   nop
/* C6528 800C5928 3C04800F */  lui        $a0, %hi(__osPfsInodeCache)
/* C652C 800C592C 24847B30 */  addiu      $a0, $a0, %lo(__osPfsInodeCache)
/* C6530 800C5930 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C6534 800C5934 24060100 */   addiu     $a2, $zero, 0x100
/* C6538 800C5938 080316F1 */  j          .L800C5BC4
/* C653C 800C593C 00001021 */   addu      $v0, $zero, $zero
.L800C5940:
/* C6540 800C5940 92420065 */  lbu        $v0, 0x65($s2)
/* C6544 800C5944 10400006 */  beqz       $v0, .L800C5960
/* C6548 800C5948 02402021 */   addu      $a0, $s2, $zero
/* C654C 800C594C 0C031DC8 */  jal        __osPfsSelectBank
/* C6550 800C5950 00002821 */   addu      $a1, $zero, $zero
/* C6554 800C5954 00401821 */  addu       $v1, $v0, $zero
/* C6558 800C5958 1460009A */  bnez       $v1, .L800C5BC4
/* C655C 800C595C 00000000 */   nop
.L800C5960:
/* C6560 800C5960 32E200FF */  andi       $v0, $s7, 0xff
/* C6564 800C5964 14400002 */  bnez       $v0, .L800C5970
/* C6568 800C5968 24150001 */   addiu     $s5, $zero, 1
/* C656C 800C596C 8E550060 */  lw         $s5, 0x60($s2)
.L800C5970:
/* C6570 800C5970 32C300FF */  andi       $v1, $s6, 0xff
/* C6574 800C5974 24020001 */  addiu      $v0, $zero, 1
/* C6578 800C5978 14620011 */  bne        $v1, $v0, .L800C59C0
/* C657C 800C597C 00008021 */   addu      $s0, $zero, $zero
/* C6580 800C5980 00151040 */  sll        $v0, $s5, 1
/* C6584 800C5984 00542821 */  addu       $a1, $v0, $s4
/* C6588 800C5988 00002021 */  addu       $a0, $zero, $zero
/* C658C 800C598C 24020080 */  addiu      $v0, $zero, 0x80
/* C6590 800C5990 00551023 */  subu       $v0, $v0, $s5
/* C6594 800C5994 00023040 */  sll        $a2, $v0, 1
/* C6598 800C5998 18C00007 */  blez       $a2, .L800C59B8
/* C659C 800C599C 00001821 */   addu      $v1, $zero, $zero
.L800C59A0:
/* C65A0 800C59A0 90A20000 */  lbu        $v0, ($a1)
/* C65A4 800C59A4 24840001 */  addiu      $a0, $a0, 1
/* C65A8 800C59A8 00621821 */  addu       $v1, $v1, $v0
/* C65AC 800C59AC 0086102A */  slt        $v0, $a0, $a2
/* C65B0 800C59B0 1440FFFB */  bnez       $v0, .L800C59A0
/* C65B4 800C59B4 24A50001 */   addiu     $a1, $a1, 1
.L800C59B8:
/* C65B8 800C59B8 A2830001 */  sb         $v1, 1($s4)
/* C65BC 800C59BC 00008021 */  addu       $s0, $zero, $zero
.L800C59C0:
/* C65C0 800C59C0 32DE00FF */  andi       $fp, $s6, 0xff
/* C65C4 800C59C4 32E200FF */  andi       $v0, $s7, 0xff
/* C65C8 800C59C8 000298C0 */  sll        $s3, $v0, 3
/* C65CC 800C59CC 00101140 */  sll        $v0, $s0, 5
.L800C59D0:
/* C65D0 800C59D0 24080001 */  addiu      $t0, $zero, 1
/* C65D4 800C59D4 17C80015 */  bne        $fp, $t0, .L800C5A2C
/* C65D8 800C59D8 02828821 */   addu      $s1, $s4, $v0
/* C65DC 800C59DC 8E460054 */  lw         $a2, 0x54($s2)
/* C65E0 800C59E0 AFA00010 */  sw         $zero, 0x10($sp)
/* C65E4 800C59E4 8E440004 */  lw         $a0, 4($s2)
/* C65E8 800C59E8 8E450008 */  lw         $a1, 8($s2)
/* C65EC 800C59EC 02203821 */  addu       $a3, $s1, $zero
/* C65F0 800C59F0 00D33021 */  addu       $a2, $a2, $s3
/* C65F4 800C59F4 00D03021 */  addu       $a2, $a2, $s0
/* C65F8 800C59F8 0C030B30 */  jal        __osContRamWrite
/* C65FC 800C59FC 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C6600 800C5A00 8E460058 */  lw         $a2, 0x58($s2)
/* C6604 800C5A04 AFA00010 */  sw         $zero, 0x10($sp)
/* C6608 800C5A08 8E440004 */  lw         $a0, 4($s2)
/* C660C 800C5A0C 8E450008 */  lw         $a1, 8($s2)
/* C6610 800C5A10 02203821 */  addu       $a3, $s1, $zero
/* C6614 800C5A14 00D33021 */  addu       $a2, $a2, $s3
/* C6618 800C5A18 00D03021 */  addu       $a2, $a2, $s0
/* C661C 800C5A1C 0C030B30 */  jal        __osContRamWrite
/* C6620 800C5A20 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C6624 800C5A24 08031694 */  j          .L800C5A50
/* C6628 800C5A28 00401821 */   addu      $v1, $v0, $zero
.L800C5A2C:
/* C662C 800C5A2C 8E440004 */  lw         $a0, 4($s2)
/* C6630 800C5A30 8E460054 */  lw         $a2, 0x54($s2)
/* C6634 800C5A34 8E450008 */  lw         $a1, 8($s2)
/* C6638 800C5A38 02203821 */  addu       $a3, $s1, $zero
/* C663C 800C5A3C 00D33021 */  addu       $a2, $a2, $s3
/* C6640 800C5A40 00D03021 */  addu       $a2, $a2, $s0
/* C6644 800C5A44 0C0309EC */  jal        __osContRamRead
/* C6648 800C5A48 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C664C 800C5A4C 00401821 */  addu       $v1, $v0, $zero
.L800C5A50:
/* C6650 800C5A50 1460003D */  bnez       $v1, .L800C5B48
/* C6654 800C5A54 26100001 */   addiu     $s0, $s0, 1
/* C6658 800C5A58 2A020008 */  slti       $v0, $s0, 8
/* C665C 800C5A5C 1440FFDC */  bnez       $v0, .L800C59D0
/* C6660 800C5A60 00101140 */   sll       $v0, $s0, 5
/* C6664 800C5A64 32C200FF */  andi       $v0, $s6, 0xff
/* C6668 800C5A68 5440004C */  bnel       $v0, $zero, .L800C5B9C
/* C666C 800C5A6C 02802021 */   addu      $a0, $s4, $zero
/* C6670 800C5A70 00003821 */  addu       $a3, $zero, $zero
/* C6674 800C5A74 00151040 */  sll        $v0, $s5, 1
/* C6678 800C5A78 00542821 */  addu       $a1, $v0, $s4
/* C667C 800C5A7C 24020080 */  addiu      $v0, $zero, 0x80
/* C6680 800C5A80 00551023 */  subu       $v0, $v0, $s5
/* C6684 800C5A84 00023040 */  sll        $a2, $v0, 1
/* C6688 800C5A88 0066102A */  slt        $v0, $v1, $a2
/* C668C 800C5A8C 10400007 */  beqz       $v0, .L800C5AAC
/* C6690 800C5A90 00002021 */   addu      $a0, $zero, $zero
.L800C5A94:
/* C6694 800C5A94 90A20000 */  lbu        $v0, ($a1)
/* C6698 800C5A98 24840001 */  addiu      $a0, $a0, 1
/* C669C 800C5A9C 00E23821 */  addu       $a3, $a3, $v0
/* C66A0 800C5AA0 0086102A */  slt        $v0, $a0, $a2
/* C66A4 800C5AA4 1440FFFB */  bnez       $v0, .L800C5A94
/* C66A8 800C5AA8 24A50001 */   addiu     $a1, $a1, 1
.L800C5AAC:
/* C66AC 800C5AAC 92830001 */  lbu        $v1, 1($s4)
/* C66B0 800C5AB0 30E200FF */  andi       $v0, $a3, 0xff
/* C66B4 800C5AB4 10430038 */  beq        $v0, $v1, .L800C5B98
/* C66B8 800C5AB8 32E200FF */   andi      $v0, $s7, 0xff
/* C66BC 800C5ABC 00008021 */  addu       $s0, $zero, $zero
/* C66C0 800C5AC0 000298C0 */  sll        $s3, $v0, 3
/* C66C4 800C5AC4 02808821 */  addu       $s1, $s4, $zero
.L800C5AC8:
/* C66C8 800C5AC8 8E440004 */  lw         $a0, 4($s2)
/* C66CC 800C5ACC 8E450008 */  lw         $a1, 8($s2)
/* C66D0 800C5AD0 8E460058 */  lw         $a2, 0x58($s2)
/* C66D4 800C5AD4 02203821 */  addu       $a3, $s1, $zero
/* C66D8 800C5AD8 26310020 */  addiu      $s1, $s1, 0x20
/* C66DC 800C5ADC 00D33021 */  addu       $a2, $a2, $s3
/* C66E0 800C5AE0 00D03021 */  addu       $a2, $a2, $s0
/* C66E4 800C5AE4 0C0309EC */  jal        __osContRamRead
/* C66E8 800C5AE8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C66EC 800C5AEC 26100001 */  addiu      $s0, $s0, 1
/* C66F0 800C5AF0 2A020008 */  slti       $v0, $s0, 8
/* C66F4 800C5AF4 1440FFF4 */  bnez       $v0, .L800C5AC8
/* C66F8 800C5AF8 24030080 */   addiu     $v1, $zero, 0x80
/* C66FC 800C5AFC 00151040 */  sll        $v0, $s5, 1
/* C6700 800C5B00 00543021 */  addu       $a2, $v0, $s4
/* C6704 800C5B04 00002021 */  addu       $a0, $zero, $zero
/* C6708 800C5B08 00751823 */  subu       $v1, $v1, $s5
/* C670C 800C5B0C 00031840 */  sll        $v1, $v1, 1
/* C6710 800C5B10 18600007 */  blez       $v1, .L800C5B30
/* C6714 800C5B14 00002821 */   addu      $a1, $zero, $zero
.L800C5B18:
/* C6718 800C5B18 90C20000 */  lbu        $v0, ($a2)
/* C671C 800C5B1C 24840001 */  addiu      $a0, $a0, 1
/* C6720 800C5B20 00A22821 */  addu       $a1, $a1, $v0
/* C6724 800C5B24 0083102A */  slt        $v0, $a0, $v1
/* C6728 800C5B28 1440FFFB */  bnez       $v0, .L800C5B18
/* C672C 800C5B2C 24C60001 */   addiu     $a2, $a2, 1
.L800C5B30:
/* C6730 800C5B30 92830001 */  lbu        $v1, 1($s4)
/* C6734 800C5B34 30A200FF */  andi       $v0, $a1, 0xff
/* C6738 800C5B38 10430005 */  beq        $v0, $v1, .L800C5B50
/* C673C 800C5B3C 24020003 */   addiu     $v0, $zero, 3
/* C6740 800C5B40 080316F1 */  j          .L800C5BC4
/* C6744 800C5B44 00000000 */   nop
.L800C5B48:
/* C6748 800C5B48 080316F1 */  j          .L800C5BC4
/* C674C 800C5B4C 00601021 */   addu      $v0, $v1, $zero
.L800C5B50:
/* C6750 800C5B50 00008021 */  addu       $s0, $zero, $zero
/* C6754 800C5B54 32E200FF */  andi       $v0, $s7, 0xff
/* C6758 800C5B58 000298C0 */  sll        $s3, $v0, 3
/* C675C 800C5B5C 02808821 */  addu       $s1, $s4, $zero
.L800C5B60:
/* C6760 800C5B60 8E460054 */  lw         $a2, 0x54($s2)
/* C6764 800C5B64 AFA00010 */  sw         $zero, 0x10($sp)
/* C6768 800C5B68 8E440004 */  lw         $a0, 4($s2)
/* C676C 800C5B6C 8E450008 */  lw         $a1, 8($s2)
/* C6770 800C5B70 02203821 */  addu       $a3, $s1, $zero
/* C6774 800C5B74 26310020 */  addiu      $s1, $s1, 0x20
/* C6778 800C5B78 00D33021 */  addu       $a2, $a2, $s3
/* C677C 800C5B7C 00D03021 */  addu       $a2, $a2, $s0
/* C6780 800C5B80 0C030B30 */  jal        __osContRamWrite
/* C6784 800C5B84 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C6788 800C5B88 26100001 */  addiu      $s0, $s0, 1
/* C678C 800C5B8C 2A020008 */  slti       $v0, $s0, 8
/* C6790 800C5B90 1440FFF3 */  bnez       $v0, .L800C5B60
/* C6794 800C5B94 00000000 */   nop
.L800C5B98:
/* C6798 800C5B98 02802021 */  addu       $a0, $s4, $zero
.L800C5B9C:
/* C679C 800C5B9C 3C05800F */  lui        $a1, %hi(__osPfsInodeCache)
/* C67A0 800C5BA0 24A57B30 */  addiu      $a1, $a1, %lo(__osPfsInodeCache)
/* C67A4 800C5BA4 3C01800F */  lui        $at, %hi(__osPfsInodeCacheBank)
/* C67A8 800C5BA8 A0373864 */  sb         $s7, %lo(__osPfsInodeCacheBank)($at)
/* C67AC 800C5BAC 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C67B0 800C5BB0 24060100 */   addiu     $a2, $zero, 0x100
/* C67B4 800C5BB4 8E430008 */  lw         $v1, 8($s2)
/* C67B8 800C5BB8 00001021 */  addu       $v0, $zero, $zero
/* C67BC 800C5BBC 3C01800F */  lui        $at, %hi(__osPfsInodeCacheChannel)
/* C67C0 800C5BC0 AC233860 */  sw         $v1, %lo(__osPfsInodeCacheChannel)($at)
.L800C5BC4:
/* C67C4 800C5BC4 8FBF004C */  lw         $ra, 0x4c($sp)
/* C67C8 800C5BC8 8FBE0048 */  lw         $fp, 0x48($sp)
/* C67CC 800C5BCC 8FB70044 */  lw         $s7, 0x44($sp)
/* C67D0 800C5BD0 8FB60040 */  lw         $s6, 0x40($sp)
/* C67D4 800C5BD4 8FB5003C */  lw         $s5, 0x3c($sp)
/* C67D8 800C5BD8 8FB40038 */  lw         $s4, 0x38($sp)
/* C67DC 800C5BDC 8FB30034 */  lw         $s3, 0x34($sp)
/* C67E0 800C5BE0 8FB20030 */  lw         $s2, 0x30($sp)
/* C67E4 800C5BE4 8FB1002C */  lw         $s1, 0x2c($sp)
/* C67E8 800C5BE8 8FB00028 */  lw         $s0, 0x28($sp)
/* C67EC 800C5BEC 03E00008 */  jr         $ra
/* C67F0 800C5BF0 27BD0050 */   addiu     $sp, $sp, 0x50
/* C67F4 800C5BF4 00000000 */  nop
/* C67F8 800C5BF8 00000000 */  nop
/* C67FC 800C5BFC 00000000 */  nop
