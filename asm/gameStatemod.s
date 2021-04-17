.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel debug_gamestatefunnel_sub
/* 5DC0 800051C0 3C03800E */  lui        $v1, %hi(gamestatemod_byte)
/* 5DC4 800051C4 24020004 */  addiu      $v0, $zero, 4
/* 5DC8 800051C8 A06261BC */  sb         $v0, %lo(gamestatemod_byte)($v1)
/* 5DCC 800051CC 03E00008 */  jr         $ra
/* 5DD0 800051D0 24020001 */   addiu     $v0, $zero, 1

glabel ScreenFademode_10
/* 5DD4 800051D4 27BDFE38 */  addiu      $sp, $sp, -0x1c8
/* 5DD8 800051D8 AFB401C0 */  sw         $s4, 0x1c0($sp)
/* 5DDC 800051DC 0080A021 */  addu       $s4, $a0, $zero
/* 5DE0 800051E0 3C02800E */  lui        $v0, %hi(gamestatemod_byte)
/* 5DE4 800051E4 904461BC */  lbu        $a0, %lo(gamestatemod_byte)($v0)
/* 5DE8 800051E8 24030002 */  addiu      $v1, $zero, 2
/* 5DEC 800051EC AFB101B4 */  sw         $s1, 0x1b4($sp)
/* 5DF0 800051F0 00408821 */  addu       $s1, $v0, $zero
/* 5DF4 800051F4 AFBF01C4 */  sw         $ra, 0x1c4($sp)
/* 5DF8 800051F8 AFB301BC */  sw         $s3, 0x1bc($sp)
/* 5DFC 800051FC AFB201B8 */  sw         $s2, 0x1b8($sp)
/* 5E00 80005200 10830068 */  beq        $a0, $v1, .L800053A4
/* 5E04 80005204 AFB001B0 */   sw        $s0, 0x1b0($sp)
/* 5E08 80005208 28820003 */  slti       $v0, $a0, 3
/* 5E0C 8000520C 10400005 */  beqz       $v0, .L80005224
/* 5E10 80005210 24020001 */   addiu     $v0, $zero, 1
/* 5E14 80005214 1082004F */  beq        $a0, $v0, .L80005354
/* 5E18 80005218 2402000A */   addiu     $v0, $zero, 0xa
/* 5E1C 8000521C 08001539 */  j          .L800054E4
/* 5E20 80005220 8FBF01C4 */   lw        $ra, 0x1c4($sp)
.L80005224:
/* 5E24 80005224 24020003 */  addiu      $v0, $zero, 3
/* 5E28 80005228 10820067 */  beq        $a0, $v0, .L800053C8
/* 5E2C 8000522C 24020004 */   addiu     $v0, $zero, 4
/* 5E30 80005230 148200AB */  bne        $a0, $v0, .L800054E0
/* 5E34 80005234 2402000A */   addiu     $v0, $zero, 0xa
/* 5E38 80005238 0C001584 */  jal        func_80005610
/* 5E3C 8000523C 3C10800E */   lui       $s0, 0x800e
/* 5E40 80005240 0C026259 */  jal        passToMalloc
/* 5E44 80005244 24040004 */   addiu     $a0, $zero, 4
/* 5E48 80005248 24040B20 */  addiu      $a0, $zero, 0xb20
/* 5E4C 8000524C 3C03800D */  lui        $v1, %hi(D_800D7720)
/* 5E50 80005250 24637720 */  addiu      $v1, $v1, %lo(D_800D7720)
/* 5E54 80005254 AC430000 */  sw         $v1, ($v0)
/* 5E58 80005258 0C026259 */  jal        passToMalloc
/* 5E5C 8000525C AE0261D0 */   sw        $v0, 0x61d0($s0)
/* 5E60 80005260 00402021 */  addu       $a0, $v0, $zero
/* 5E64 80005264 24030028 */  addiu      $v1, $zero, 0x28
/* 5E68 80005268 27A80028 */  addiu      $t0, $sp, 0x28
/* 5E6C 8000526C 24020118 */  addiu      $v0, $zero, 0x118
/* 5E70 80005270 8E0561D0 */  lw         $a1, 0x61d0($s0)
/* 5E74 80005274 241000C8 */  addiu      $s0, $zero, 0xc8
/* 5E78 80005278 A7A30028 */  sh         $v1, 0x28($sp)
/* 5E7C 8000527C A5020004 */  sh         $v0, 4($t0)
/* 5E80 80005280 240200A0 */  addiu      $v0, $zero, 0xa0
/* 5E84 80005284 2411012C */  addiu      $s1, $zero, 0x12c
/* 5E88 80005288 A5030002 */  sh         $v1, 2($t0)
/* 5E8C 8000528C A5100006 */  sh         $s0, 6($t0)
/* 5E90 80005290 A7A20068 */  sh         $v0, 0x68($sp)
/* 5E94 80005294 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5E98 80005298 A7A3006A */  sh         $v1, 0x6a($sp)
/* 5E9C 8000529C 3C03800F */  lui        $v1, %hi(gameStates)
/* 5EA0 800052A0 8C699940 */  lw         $t1, %lo(gameStates)($v1)
/* 5EA4 800052A4 240600FF */  addiu      $a2, $zero, 0xff
/* 5EA8 800052A8 A3A600AB */  sb         $a2, 0xab($sp)
/* 5EAC 800052AC A3A600EB */  sb         $a2, 0xeb($sp)
/* 5EB0 800052B0 A3A6012B */  sb         $a2, 0x12b($sp)
/* 5EB4 800052B4 2406000E */  addiu      $a2, $zero, 0xe
/* 5EB8 800052B8 A3A200A8 */  sb         $v0, 0xa8($sp)
/* 5EBC 800052BC A3A200A9 */  sb         $v0, 0xa9($sp)
/* 5EC0 800052C0 A3A200AA */  sb         $v0, 0xaa($sp)
/* 5EC4 800052C4 A3A200E8 */  sb         $v0, 0xe8($sp)
/* 5EC8 800052C8 A3A200E9 */  sb         $v0, 0xe9($sp)
/* 5ECC 800052CC A3A200EA */  sb         $v0, 0xea($sp)
/* 5ED0 800052D0 A3A20128 */  sb         $v0, 0x128($sp)
/* 5ED4 800052D4 A3A20129 */  sb         $v0, 0x129($sp)
/* 5ED8 800052D8 A3A2012A */  sb         $v0, 0x12a($sp)
/* 5EDC 800052DC A3A20168 */  sb         $v0, 0x168($sp)
/* 5EE0 800052E0 27A20068 */  addiu      $v0, $sp, 0x68
/* 5EE4 800052E4 A7B1006C */  sh         $s1, 0x6c($sp)
/* 5EE8 800052E8 A7B0006E */  sh         $s0, 0x6e($sp)
/* 5EEC 800052EC A3A00169 */  sb         $zero, 0x169($sp)
/* 5EF0 800052F0 A3A0016A */  sb         $zero, 0x16a($sp)
/* 5EF4 800052F4 A3A0016B */  sb         $zero, 0x16b($sp)
/* 5EF8 800052F8 95270000 */  lhu        $a3, ($t1)
/* 5EFC 800052FC 27A300A8 */  addiu      $v1, $sp, 0xa8
/* 5F00 80005300 AFA20014 */  sw         $v0, 0x14($sp)
/* 5F04 80005304 27A200E8 */  addiu      $v0, $sp, 0xe8
/* 5F08 80005308 AFA30018 */  sw         $v1, 0x18($sp)
/* 5F0C 8000530C 27A30128 */  addiu      $v1, $sp, 0x128
/* 5F10 80005310 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5F14 80005314 27A20168 */  addiu      $v0, $sp, 0x168
/* 5F18 80005318 AFA80010 */  sw         $t0, 0x10($sp)
/* 5F1C 8000531C AFA30020 */  sw         $v1, 0x20($sp)
/* 5F20 80005320 0C00163C */  jal        func_800058F0
/* 5F24 80005324 AFA20024 */   sw        $v0, 0x24($sp)
/* 5F28 80005328 00402021 */  addu       $a0, $v0, $zero
/* 5F2C 8000532C 240501C5 */  addiu      $a1, $zero, 0x1c5
/* 5F30 80005330 24060014 */  addiu      $a2, $zero, 0x14
/* 5F34 80005334 24070014 */  addiu      $a3, $zero, 0x14
/* 5F38 80005338 3C03800E */  lui        $v1, %hi(D_800E61C8)
/* 5F3C 8000533C AC6261C8 */  sw         $v0, %lo(D_800E61C8)($v1)
/* 5F40 80005340 AFB10010 */  sw         $s1, 0x10($sp)
/* 5F44 80005344 0C013349 */  jal        make_borg8_widget
/* 5F48 80005348 AFB00014 */   sw        $s0, 0x14($sp)
/* 5F4C 8000534C 08001538 */  j          .L800054E0
/* 5F50 80005350 2402000A */   addiu     $v0, $zero, 0xa
.L80005354:
/* 5F54 80005354 0C00158E */  jal        gamestatemod_free
/* 5F58 80005358 3C10800E */   lui       $s0, %hi(D_800E61C8)
/* 5F5C 8000535C 8E0661C8 */  lw         $a2, %lo(D_800E61C8)($s0)
/* 5F60 80005360 10C00007 */  beqz       $a2, .L80005380
/* 5F64 80005364 24050003 */   addiu     $a1, $zero, 3
/* 5F68 80005368 8CC20078 */  lw         $v0, 0x78($a2)
/* 5F6C 8000536C 84440008 */  lh         $a0, 8($v0)
/* 5F70 80005370 8C43000C */  lw         $v1, 0xc($v0)
/* 5F74 80005374 0060F809 */  jalr       $v1
/* 5F78 80005378 00C42021 */   addu      $a0, $a2, $a0
/* 5F7C 8000537C AE0061C8 */  sw         $zero, 0x61c8($s0)
.L80005380:
/* 5F80 80005380 3C10800E */  lui        $s0, %hi(D_800E61D0)
/* 5F84 80005384 8E0461D0 */  lw         $a0, %lo(D_800E61D0)($s0)
/* 5F88 80005388 10800055 */  beqz       $a0, .L800054E0
/* 5F8C 8000538C 24020001 */   addiu     $v0, $zero, 1
/* 5F90 80005390 0C026262 */  jal        passToFree
/* 5F94 80005394 00000000 */   nop
/* 5F98 80005398 AE0061D0 */  sw         $zero, 0x61d0($s0)
/* 5F9C 8000539C 08001538 */  j          .L800054E0
/* 5FA0 800053A0 24020001 */   addiu     $v0, $zero, 1
.L800053A4:
/* 5FA4 800053A4 3C03800E */  lui        $v1, %hi(D_800E61CC)
/* 5FA8 800053A8 906261CC */  lbu        $v0, %lo(D_800E61CC)($v1)
/* 5FAC 800053AC 10400003 */  beqz       $v0, .L800053BC
/* 5FB0 800053B0 2442FFFF */   addiu     $v0, $v0, -1
/* 5FB4 800053B4 08001537 */  j          .L800054DC
/* 5FB8 800053B8 A06261CC */   sb        $v0, 0x61cc($v1)
.L800053BC:
/* 5FBC 800053BC 24020001 */  addiu      $v0, $zero, 1
/* 5FC0 800053C0 08001537 */  j          .L800054DC
/* 5FC4 800053C4 A22261BC */   sb        $v0, 0x61bc($s1)
.L800053C8:
/* 5FC8 800053C8 8E920000 */  lw         $s2, ($s4)
/* 5FCC 800053CC 3C13800E */  lui        $s3, 0x800e
/* 5FD0 800053D0 0800150A */  j          .L80005428
/* 5FD4 800053D4 27B001A8 */   addiu     $s0, $sp, 0x1a8
.L800053D8:
/* 5FD8 800053D8 8C62000C */  lw         $v0, 0xc($v1)
/* 5FDC 800053DC 30420020 */  andi       $v0, $v0, 0x20
/* 5FE0 800053E0 10400005 */  beqz       $v0, .L800053F8
/* 5FE4 800053E4 8E6661C8 */   lw        $a2, 0x61c8($s3)
/* 5FE8 800053E8 8C620008 */  lw         $v0, 8($v1)
/* 5FEC 800053EC 34420020 */  ori        $v0, $v0, 0x20
/* 5FF0 800053F0 AC620008 */  sw         $v0, 8($v1)
/* 5FF4 800053F4 8E6661C8 */  lw         $a2, 0x61c8($s3)
.L800053F8:
/* 5FF8 800053F8 8CC30078 */  lw         $v1, 0x78($a2)
/* 5FFC 800053FC 8FA501A8 */  lw         $a1, 0x1a8($sp)
/* 6000 80005400 84640050 */  lh         $a0, 0x50($v1)
/* 6004 80005404 8C620054 */  lw         $v0, 0x54($v1)
/* 6008 80005408 0040F809 */  jalr       $v0
/* 600C 8000540C 00C42021 */   addu      $a0, $a2, $a0
/* 6010 80005410 10400005 */  beqz       $v0, .L80005428
/* 6014 80005414 24020002 */   addiu     $v0, $zero, 2
/* 6018 80005418 3C03800E */  lui        $v1, %hi(D_800E61CC)
/* 601C 8000541C A22261BC */  sb         $v0, 0x61bc($s1)
/* 6020 80005420 24020006 */  addiu      $v0, $zero, 6
/* 6024 80005424 A06261CC */  sb         $v0, %lo(D_800E61CC)($v1)
.L80005428:
/* 6028 80005428 02002021 */  addu       $a0, $s0, $zero
/* 602C 8000542C 0C02713D */  jal        get_cont_aidyn
/* 6030 80005430 00002821 */   addu      $a1, $zero, $zero
/* 6034 80005434 1440FFE8 */  bnez       $v0, .L800053D8
/* 6038 80005438 8FA301A8 */   lw        $v1, 0x1a8($sp)
/* 603C 8000543C 02402021 */  addu       $a0, $s2, $zero
/* 6040 80005440 00002821 */  addu       $a1, $zero, $zero
/* 6044 80005444 00003021 */  addu       $a2, $zero, $zero
/* 6048 80005448 24070140 */  addiu      $a3, $zero, 0x140
/* 604C 8000544C 241100F0 */  addiu      $s1, $zero, 0xf0
/* 6050 80005450 AFB10010 */  sw         $s1, 0x10($sp)
/* 6054 80005454 AFA00014 */  sw         $zero, 0x14($sp)
/* 6058 80005458 AFA00018 */  sw         $zero, 0x18($sp)
/* 605C 8000545C AFA0001C */  sw         $zero, 0x1c($sp)
/* 6060 80005460 0C002265 */  jal        some_video_setting_init
/* 6064 80005464 AFA00020 */   sw        $zero, 0x20($sp)
/* 6068 80005468 0C0025B4 */  jal        get_hres
/* 606C 8000546C 00409021 */   addu      $s2, $v0, $zero
/* 6070 80005470 0C0025B7 */  jal        get_vres
/* 6074 80005474 00408021 */   addu      $s0, $v0, $zero
/* 6078 80005478 02402021 */  addu       $a0, $s2, $zero
/* 607C 8000547C 24050006 */  addiu      $a1, $zero, 6
/* 6080 80005480 02003021 */  addu       $a2, $s0, $zero
/* 6084 80005484 0C0290ED */  jal        rsp_func
/* 6088 80005488 00403821 */   addu      $a3, $v0, $zero
/* 608C 8000548C 8E6561C8 */  lw         $a1, 0x61c8($s3)
/* 6090 80005490 8CA30078 */  lw         $v1, 0x78($a1)
/* 6094 80005494 00409021 */  addu       $s2, $v0, $zero
/* 6098 80005498 84640028 */  lh         $a0, 0x28($v1)
/* 609C 8000549C 8C62002C */  lw         $v0, 0x2c($v1)
/* 60A0 800054A0 0040F809 */  jalr       $v0
/* 60A4 800054A4 00A42021 */   addu      $a0, $a1, $a0
/* 60A8 800054A8 02402821 */  addu       $a1, $s2, $zero
/* 60AC 800054AC 8E6861C8 */  lw         $t0, 0x61c8($s3)
/* 60B0 800054B0 00003021 */  addu       $a2, $zero, $zero
/* 60B4 800054B4 8D030078 */  lw         $v1, 0x78($t0)
/* 60B8 800054B8 00003821 */  addu       $a3, $zero, $zero
/* 60BC 800054BC 84640040 */  lh         $a0, 0x40($v1)
/* 60C0 800054C0 24020140 */  addiu      $v0, $zero, 0x140
/* 60C4 800054C4 AFA20010 */  sw         $v0, 0x10($sp)
/* 60C8 800054C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 60CC 800054CC 8C620044 */  lw         $v0, 0x44($v1)
/* 60D0 800054D0 0040F809 */  jalr       $v0
/* 60D4 800054D4 01042021 */   addu      $a0, $t0, $a0
/* 60D8 800054D8 AE820000 */  sw         $v0, ($s4)
.L800054DC:
/* 60DC 800054DC 2402000A */  addiu      $v0, $zero, 0xa
.L800054E0:
/* 60E0 800054E0 8FBF01C4 */  lw         $ra, 0x1c4($sp)
.L800054E4:
/* 60E4 800054E4 8FB401C0 */  lw         $s4, 0x1c0($sp)
/* 60E8 800054E8 8FB301BC */  lw         $s3, 0x1bc($sp)
/* 60EC 800054EC 8FB201B8 */  lw         $s2, 0x1b8($sp)
/* 60F0 800054F0 8FB101B4 */  lw         $s1, 0x1b4($sp)
/* 60F4 800054F4 8FB001B0 */  lw         $s0, 0x1b0($sp)
/* 60F8 800054F8 03E00008 */  jr         $ra
/* 60FC 800054FC 27BD01C8 */   addiu     $sp, $sp, 0x1c8

glabel func_80005500
/* 6100 80005500 94840002 */  lhu        $a0, 2($a0)
/* 6104 80005504 94A30002 */  lhu        $v1, 2($a1)
/* 6108 80005508 0083102B */  sltu       $v0, $a0, $v1
/* 610C 8000550C 14400003 */  bnez       $v0, .L8000551C
/* 6110 80005510 00831026 */   xor       $v0, $a0, $v1
/* 6114 80005514 03E00008 */  jr         $ra
/* 6118 80005518 0002102B */   sltu      $v0, $zero, $v0
.L8000551C:
/* 611C 8000551C 03E00008 */  jr         $ra
/* 6120 80005520 2402FFFF */   addiu     $v0, $zero, -1

glabel quicksort_gamestatemod
/* 6124 80005524 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 6128 80005528 3C078000 */  lui        $a3, %hi(func_80005500)
/* 612C 8000552C 24060004 */  addiu      $a2, $zero, 4
/* 6130 80005530 AFBF0010 */  sw         $ra, 0x10($sp)
/* 6134 80005534 0C02F6A5 */  jal        quicksort_func
/* 6138 80005538 24E75500 */   addiu     $a3, $a3, %lo(func_80005500)
/* 613C 8000553C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6140 80005540 03E00008 */  jr         $ra
/* 6144 80005544 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_gamestatemod_dat
/* 6148 80005548 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 614C 8000554C 3C02B1FF */  lui        $v0, %hi(gamestatefunnel_rom)
/* 6150 80005550 24429850 */  addiu      $v0, $v0, %lo(gamestatefunnel_rom)
/* 6154 80005554 3C03B1FE */  lui        $v1, %hi(gameStatemod_dat)
/* 6158 80005558 AFB20020 */  sw         $s2, 0x20($sp)
/* 615C 8000555C 24724060 */  addiu      $s2, $v1, %lo(gameStatemod_dat)
/* 6160 80005560 AFB00018 */  sw         $s0, 0x18($sp)
/* 6164 80005564 00528023 */  subu       $s0, $v0, $s2
/* 6168 80005568 02002021 */  addu       $a0, $s0, $zero
/* 616C 8000556C 3C02800D */  lui        $v0, %hi(D_800D75E0)
/* 6170 80005570 AFB1001C */  sw         $s1, 0x1c($sp)
/* 6174 80005574 245175E0 */  addiu      $s1, $v0, %lo(D_800D75E0)
/* 6178 80005578 02202821 */  addu       $a1, $s1, $zero
/* 617C 8000557C 24060267 */  addiu      $a2, $zero, 0x267
/* 6180 80005580 AFBF0028 */  sw         $ra, 0x28($sp)
/* 6184 80005584 0C025F9C */  jal        Malloc
/* 6188 80005588 AFB30024 */   sw        $s3, 0x24($sp)
/* 618C 8000558C 3C13800E */  lui        $s3, %hi(D_800E61C0)
/* 6190 80005590 10400018 */  beqz       $v0, .L800055F4
/* 6194 80005594 AE6261C0 */   sw        $v0, %lo(D_800E61C0)($s3)
/* 6198 80005598 00402021 */  addu       $a0, $v0, $zero
/* 619C 8000559C 02402821 */  addu       $a1, $s2, $zero
/* 61A0 800055A0 02003021 */  addu       $a2, $s0, $zero
/* 61A4 800055A4 2402026D */  addiu      $v0, $zero, 0x26d
/* 61A8 800055A8 24070001 */  addiu      $a3, $zero, 1
/* 61AC 800055AC AFB10010 */  sw         $s1, 0x10($sp)
/* 61B0 800055B0 0C027269 */  jal        RomCopy
/* 61B4 800055B4 AFA20014 */   sw        $v0, 0x14($sp)
/* 61B8 800055B8 02002021 */  addu       $a0, $s0, $zero
/* 61BC 800055BC 02202821 */  addu       $a1, $s1, $zero
/* 61C0 800055C0 0C025F9C */  jal        Malloc
/* 61C4 800055C4 24060270 */   addiu     $a2, $zero, 0x270
/* 61C8 800055C8 00402021 */  addu       $a0, $v0, $zero
/* 61CC 800055CC 02003021 */  addu       $a2, $s0, $zero
/* 61D0 800055D0 8E6561C0 */  lw         $a1, 0x61c0($s3)
/* 61D4 800055D4 3C10800E */  lui        $s0, %hi(gamestatemod_pointer)
/* 61D8 800055D8 0C033547 */  jal        memcpy
/* 61DC 800055DC AE0261C4 */   sw        $v0, %lo(gamestatemod_pointer)($s0)
/* 61E0 800055E0 3C03800F */  lui        $v1, %hi(gameStates)
/* 61E4 800055E4 8C629940 */  lw         $v0, %lo(gameStates)($v1)
/* 61E8 800055E8 8E0461C4 */  lw         $a0, 0x61c4($s0)
/* 61EC 800055EC 0C001549 */  jal        quicksort_gamestatemod
/* 61F0 800055F0 94450000 */   lhu       $a1, ($v0)
.L800055F4:
/* 61F4 800055F4 8FBF0028 */  lw         $ra, 0x28($sp)
/* 61F8 800055F8 8FB30024 */  lw         $s3, 0x24($sp)
/* 61FC 800055FC 8FB20020 */  lw         $s2, 0x20($sp)
/* 6200 80005600 8FB1001C */  lw         $s1, 0x1c($sp)
/* 6204 80005604 8FB00018 */  lw         $s0, 0x18($sp)
/* 6208 80005608 03E00008 */  jr         $ra
/* 620C 8000560C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80005610
/* 6210 80005610 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 6214 80005614 AFBF0010 */  sw         $ra, 0x10($sp)
/* 6218 80005618 0C001552 */  jal        load_gamestatemod_dat
/* 621C 8000561C 00000000 */   nop
/* 6220 80005620 3C03800E */  lui        $v1, %hi(gamestatemod_byte)
/* 6224 80005624 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6228 80005628 24020003 */  addiu      $v0, $zero, 3
/* 622C 8000562C A06261BC */  sb         $v0, %lo(gamestatemod_byte)($v1)
/* 6230 80005630 03E00008 */  jr         $ra
/* 6234 80005634 27BD0018 */   addiu     $sp, $sp, 0x18

glabel gamestatemod_free
/* 6238 80005638 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 623C 8000563C 3C02800D */  lui        $v0, %hi(D_800D75E0)
/* 6240 80005640 AFB10014 */  sw         $s1, 0x14($sp)
/* 6244 80005644 245175E0 */  addiu      $s1, $v0, %lo(D_800D75E0)
/* 6248 80005648 02202821 */  addu       $a1, $s1, $zero
/* 624C 8000564C AFB00010 */  sw         $s0, 0x10($sp)
/* 6250 80005650 3C10800E */  lui        $s0, %hi(D_800E61C0)
/* 6254 80005654 8E0461C0 */  lw         $a0, %lo(D_800E61C0)($s0)
/* 6258 80005658 AFBF0018 */  sw         $ra, 0x18($sp)
/* 625C 8000565C 0C02600C */  jal        Free
/* 6260 80005660 24060286 */   addiu     $a2, $zero, 0x286
/* 6264 80005664 AE0061C0 */  sw         $zero, 0x61c0($s0)
/* 6268 80005668 3C10800E */  lui        $s0, %hi(gamestatemod_pointer)
/* 626C 8000566C 8E0461C4 */  lw         $a0, %lo(gamestatemod_pointer)($s0)
/* 6270 80005670 3C02800E */  lui        $v0, %hi(gamestatemod_byte)
/* 6274 80005674 10800005 */  beqz       $a0, .L8000568C
/* 6278 80005678 A04061BC */   sb        $zero, %lo(gamestatemod_byte)($v0)
/* 627C 8000567C 02202821 */  addu       $a1, $s1, $zero
/* 6280 80005680 0C02600C */  jal        Free
/* 6284 80005684 24060294 */   addiu     $a2, $zero, 0x294
/* 6288 80005688 AE0061C4 */  sw         $zero, 0x61c4($s0)
.L8000568C:
/* 628C 8000568C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 6290 80005690 8FB10014 */  lw         $s1, 0x14($sp)
/* 6294 80005694 8FB00010 */  lw         $s0, 0x10($sp)
/* 6298 80005698 03E00008 */  jr         $ra
/* 629C 8000569C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel gamestatemod_sub
/* 62A0 800056A0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 62A4 800056A4 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 62A8 800056A8 3C02800E */  lui        $v0, %hi(gamestatemod_pointer)
/* 62AC 800056AC 8C4361C4 */  lw         $v1, %lo(gamestatemod_pointer)($v0)
/* 62B0 800056B0 00052880 */  sll        $a1, $a1, 2
/* 62B4 800056B4 AFB00018 */  sw         $s0, 0x18($sp)
/* 62B8 800056B8 00C08021 */  addu       $s0, $a2, $zero
/* 62BC 800056BC AFBF0024 */  sw         $ra, 0x24($sp)
/* 62C0 800056C0 AFB20020 */  sw         $s2, 0x20($sp)
/* 62C4 800056C4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 62C8 800056C8 00A32821 */  addu       $a1, $a1, $v1
/* 62CC 800056CC 94B10000 */  lhu        $s1, ($a1)
/* 62D0 800056D0 94B20002 */  lhu        $s2, 2($a1)
/* 62D4 800056D4 0C009168 */  jal        get_event_flag
/* 62D8 800056D8 02202021 */   addu      $a0, $s1, $zero
/* 62DC 800056DC 30420001 */  andi       $v0, $v0, 1
/* 62E0 800056E0 3C03800E */  lui        $v1, %hi(boolean_labels)
/* 62E4 800056E4 00021080 */  sll        $v0, $v0, 2
/* 62E8 800056E8 3C05800D */  lui        $a1, %hi(D_800D75F8)
/* 62EC 800056EC 24A575F8 */  addiu      $a1, $a1, %lo(D_800D75F8)
/* 62F0 800056F0 02403021 */  addu       $a2, $s2, $zero
/* 62F4 800056F4 8C6461B4 */  lw         $a0, %lo(boolean_labels)($v1)
/* 62F8 800056F8 02203821 */  addu       $a3, $s1, $zero
/* 62FC 800056FC 00441021 */  addu       $v0, $v0, $a0
/* 6300 80005700 8C430000 */  lw         $v1, ($v0)
/* 6304 80005704 02002021 */  addu       $a0, $s0, $zero
/* 6308 80005708 0C0333AC */  jal        sprintf
/* 630C 8000570C AFA30010 */   sw        $v1, 0x10($sp)
/* 6310 80005710 8FBF0024 */  lw         $ra, 0x24($sp)
/* 6314 80005714 8FB20020 */  lw         $s2, 0x20($sp)
/* 6318 80005718 8FB1001C */  lw         $s1, 0x1c($sp)
/* 631C 8000571C 8FB00018 */  lw         $s0, 0x18($sp)
/* 6320 80005720 03E00008 */  jr         $ra
/* 6324 80005724 27BD0028 */   addiu     $sp, $sp, 0x28

glabel gamestatemod_func_
/* 6328 80005728 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 632C 8000572C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 6330 80005730 3C02800E */  lui        $v0, %hi(gamestatemod_pointer)
/* 6334 80005734 8C4361C4 */  lw         $v1, %lo(gamestatemod_pointer)($v0)
/* 6338 80005738 00052880 */  sll        $a1, $a1, 2
/* 633C 8000573C AFB1001C */  sw         $s1, 0x1c($sp)
/* 6340 80005740 00C08821 */  addu       $s1, $a2, $zero
/* 6344 80005744 AFBF0024 */  sw         $ra, 0x24($sp)
/* 6348 80005748 AFB20020 */  sw         $s2, 0x20($sp)
/* 634C 8000574C AFB00018 */  sw         $s0, 0x18($sp)
/* 6350 80005750 00A32821 */  addu       $a1, $a1, $v1
/* 6354 80005754 94B00000 */  lhu        $s0, ($a1)
/* 6358 80005758 94B20002 */  lhu        $s2, 2($a1)
/* 635C 8000575C 0C0091DC */  jal        Passto_State_typeA_branch
/* 6360 80005760 02002021 */   addu      $a0, $s0, $zero
/* 6364 80005764 0C009168 */  jal        get_event_flag
/* 6368 80005768 02002021 */   addu      $a0, $s0, $zero
/* 636C 8000576C 30420001 */  andi       $v0, $v0, 1
/* 6370 80005770 3C03800E */  lui        $v1, %hi(boolean_labels)
/* 6374 80005774 00021080 */  sll        $v0, $v0, 2
/* 6378 80005778 3C05800D */  lui        $a1, %hi(D_800D75F8)
/* 637C 8000577C 24A575F8 */  addiu      $a1, $a1, %lo(D_800D75F8)
/* 6380 80005780 02403021 */  addu       $a2, $s2, $zero
/* 6384 80005784 8C6461B4 */  lw         $a0, %lo(boolean_labels)($v1)
/* 6388 80005788 02003821 */  addu       $a3, $s0, $zero
/* 638C 8000578C 00441021 */  addu       $v0, $v0, $a0
/* 6390 80005790 8C430000 */  lw         $v1, ($v0)
/* 6394 80005794 02202021 */  addu       $a0, $s1, $zero
/* 6398 80005798 0C0333AC */  jal        sprintf
/* 639C 8000579C AFA30010 */   sw        $v1, 0x10($sp)
/* 63A0 800057A0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 63A4 800057A4 8FB20020 */  lw         $s2, 0x20($sp)
/* 63A8 800057A8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 63AC 800057AC 8FB00018 */  lw         $s0, 0x18($sp)
/* 63B0 800057B0 03E00008 */  jr         $ra
/* 63B4 800057B4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel gamestatefunnel_debug_display
/* 63B8 800057B8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 63BC 800057BC AFB00018 */  sw         $s0, 0x18($sp)
/* 63C0 800057C0 00C08021 */  addu       $s0, $a2, $zero
/* 63C4 800057C4 30A3FFFF */  andi       $v1, $a1, 0xffff
/* 63C8 800057C8 AFBF0030 */  sw         $ra, 0x30($sp)
/* 63CC 800057CC AFB5002C */  sw         $s5, 0x2c($sp)
/* 63D0 800057D0 AFB40028 */  sw         $s4, 0x28($sp)
/* 63D4 800057D4 AFB30024 */  sw         $s3, 0x24($sp)
/* 63D8 800057D8 AFB20020 */  sw         $s2, 0x20($sp)
/* 63DC 800057DC 1200003B */  beqz       $s0, .L800058CC
/* 63E0 800057E0 AFB1001C */   sw        $s1, 0x1c($sp)
/* 63E4 800057E4 3C02800E */  lui        $v0, %hi(gamestatemod_pointer)
/* 63E8 800057E8 00031880 */  sll        $v1, $v1, 2
/* 63EC 800057EC 3C05800F */  lui        $a1, %hi(gameStates)
/* 63F0 800057F0 8C4461C4 */  lw         $a0, %lo(gamestatemod_pointer)($v0)
/* 63F4 800057F4 8CA69940 */  lw         $a2, %lo(gameStates)($a1)
/* 63F8 800057F8 00641821 */  addu       $v1, $v1, $a0
/* 63FC 800057FC 94630000 */  lhu        $v1, ($v1)
/* 6400 80005800 94C20004 */  lhu        $v0, 4($a2)
/* 6404 80005804 0062102B */  sltu       $v0, $v1, $v0
/* 6408 80005808 10400007 */  beqz       $v0, .L80005828
/* 640C 8000580C 00A0A821 */   addu      $s5, $a1, $zero
/* 6410 80005810 02002021 */  addu       $a0, $s0, $zero
/* 6414 80005814 3C05800D */  lui        $a1, %hi(D_800D7608)
/* 6418 80005818 0C0333AC */  jal        sprintf
/* 641C 8000581C 24A57608 */   addiu     $a1, $a1, %lo(D_800D7608)
/* 6420 80005820 08001634 */  j          .L800058D0
/* 6424 80005824 8FBF0030 */   lw        $ra, 0x30($sp)
.L80005828:
/* 6428 80005828 02002021 */  addu       $a0, $s0, $zero
/* 642C 8000582C 3C05800D */  lui        $a1, %hi(D_800D7614)
/* 6430 80005830 24A57614 */  addiu      $a1, $a1, %lo(D_800D7614)
/* 6434 80005834 000310C0 */  sll        $v0, $v1, 3
/* 6438 80005838 8CC60008 */  lw         $a2, 8($a2)
/* 643C 8000583C 00009821 */  addu       $s3, $zero, $zero
/* 6440 80005840 00C28821 */  addu       $s1, $a2, $v0
/* 6444 80005844 3C06800F */  lui        $a2, %hi(eventflag_types1)
/* 6448 80005848 24C65060 */  addiu      $a2, $a2, %lo(eventflag_types1)
/* 644C 8000584C 92230004 */  lbu        $v1, 4($s1)
/* 6450 80005850 92220005 */  lbu        $v0, 5($s1)
/* 6454 80005854 96270000 */  lhu        $a3, ($s1)
/* 6458 80005858 00031880 */  sll        $v1, $v1, 2
/* 645C 8000585C 00663021 */  addu       $a2, $v1, $a2
/* 6460 80005860 00021080 */  sll        $v0, $v0, 2
/* 6464 80005864 AFA70010 */  sw         $a3, 0x10($sp)
/* 6468 80005868 3C07800F */  lui        $a3, %hi(eventflag_types2)
/* 646C 8000586C 24E75074 */  addiu      $a3, $a3, %lo(eventflag_types2)
/* 6470 80005870 0C0333AC */  jal        sprintf
/* 6474 80005874 00473821 */   addu      $a3, $v0, $a3
/* 6478 80005878 02029021 */  addu       $s2, $s0, $v0
/* 647C 8000587C 92220007 */  lbu        $v0, 7($s1)
/* 6480 80005880 10400012 */  beqz       $v0, .L800058CC
/* 6484 80005884 96300002 */   lhu       $s0, 2($s1)
/* 6488 80005888 3C14800D */  lui        $s4, 0x800d
.L8000588C:
/* 648C 8000588C 8EA39940 */  lw         $v1, -0x66c0($s5)
/* 6490 80005890 02402021 */  addu       $a0, $s2, $zero
/* 6494 80005894 8C65000C */  lw         $a1, 0xc($v1)
/* 6498 80005898 00101040 */  sll        $v0, $s0, 1
/* 649C 8000589C 00451021 */  addu       $v0, $v0, $a1
/* 64A0 800058A0 94460000 */  lhu        $a2, ($v0)
/* 64A4 800058A4 0C0333AC */  jal        sprintf
/* 64A8 800058A8 26857634 */   addiu     $a1, $s4, 0x7634
/* 64AC 800058AC 02429021 */  addu       $s2, $s2, $v0
/* 64B0 800058B0 26620001 */  addiu      $v0, $s3, 1
/* 64B4 800058B4 305300FF */  andi       $s3, $v0, 0xff
/* 64B8 800058B8 26030001 */  addiu      $v1, $s0, 1
/* 64BC 800058BC 92220007 */  lbu        $v0, 7($s1)
/* 64C0 800058C0 0262102B */  sltu       $v0, $s3, $v0
/* 64C4 800058C4 1440FFF1 */  bnez       $v0, .L8000588C
/* 64C8 800058C8 3070FFFF */   andi      $s0, $v1, 0xffff
.L800058CC:
/* 64CC 800058CC 8FBF0030 */  lw         $ra, 0x30($sp)
.L800058D0:
/* 64D0 800058D0 8FB5002C */  lw         $s5, 0x2c($sp)
/* 64D4 800058D4 8FB40028 */  lw         $s4, 0x28($sp)
/* 64D8 800058D8 8FB30024 */  lw         $s3, 0x24($sp)
/* 64DC 800058DC 8FB20020 */  lw         $s2, 0x20($sp)
/* 64E0 800058E0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 64E4 800058E4 8FB00018 */  lw         $s0, 0x18($sp)
/* 64E8 800058E8 03E00008 */  jr         $ra
/* 64EC 800058EC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800058F0
/* 64F0 800058F0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 64F4 800058F4 AFB00028 */  sw         $s0, 0x28($sp)
/* 64F8 800058F8 00808021 */  addu       $s0, $a0, $zero
/* 64FC 800058FC 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 6500 80005900 8FA20040 */  lw         $v0, 0x40($sp)
/* 6504 80005904 8FA30044 */  lw         $v1, 0x44($sp)
/* 6508 80005908 8FA80048 */  lw         $t0, 0x48($sp)
/* 650C 8000590C 8FA9004C */  lw         $t1, 0x4c($sp)
/* 6510 80005910 8FAA0050 */  lw         $t2, 0x50($sp)
/* 6514 80005914 8FAB0054 */  lw         $t3, 0x54($sp)
/* 6518 80005918 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 651C 8000591C AFBF002C */  sw         $ra, 0x2c($sp)
/* 6520 80005920 AFA20010 */  sw         $v0, 0x10($sp)
/* 6524 80005924 AFA30014 */  sw         $v1, 0x14($sp)
/* 6528 80005928 AFA80018 */  sw         $t0, 0x18($sp)
/* 652C 8000592C AFA9001C */  sw         $t1, 0x1c($sp)
/* 6530 80005930 AFAA0020 */  sw         $t2, 0x20($sp)
/* 6534 80005934 0C00C510 */  jal        widgetbufferedmenu_func
/* 6538 80005938 AFAB0024 */   sw        $t3, 0x24($sp)
/* 653C 8000593C 02001021 */  addu       $v0, $s0, $zero
/* 6540 80005940 3C03800D */  lui        $v1, %hi(D_800D7640)
/* 6544 80005944 8FBF002C */  lw         $ra, 0x2c($sp)
/* 6548 80005948 24637640 */  addiu      $v1, $v1, %lo(D_800D7640)
/* 654C 8000594C AE030078 */  sw         $v1, 0x78($s0)
/* 6550 80005950 8FB00028 */  lw         $s0, 0x28($sp)
/* 6554 80005954 03E00008 */  jr         $ra
/* 6558 80005958 27BD0030 */   addiu     $sp, $sp, 0x30

glabel Ofunc_ret0
/* 655C 8000595C 03E00008 */  jr         $ra
/* 6560 80005960 00001021 */   addu      $v0, $zero, $zero

glabel func_80005964
/* 6564 80005964 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 6568 80005968 AFBF0010 */  sw         $ra, 0x10($sp)
/* 656C 8000596C 0C00C5CC */  jal        func_80031730
/* 6570 80005970 00000000 */   nop
/* 6574 80005974 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6578 80005978 03E00008 */  jr         $ra
/* 657C 8000597C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_placebo_toggle
/* 6580 80005980 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 6584 80005984 AFBF0010 */  sw         $ra, 0x10($sp)
/* 6588 80005988 0C026259 */  jal        passToMalloc
/* 658C 8000598C 24040080 */   addiu     $a0, $zero, 0x80
/* 6590 80005990 0C001694 */  jal        list_some_debug_settings
/* 6594 80005994 00402021 */   addu      $a0, $v0, $zero
/* 6598 80005998 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 659C 8000599C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 65A0 800059A0 3C05800E */  lui        $a1, %hi(D_800E61E4)
/* 65A4 800059A4 ACA261E4 */  sw         $v0, %lo(D_800E61E4)($a1)
/* 65A8 800059A8 0C02DC7C */  jal        widgetHandler
/* 65AC 800059AC 00402821 */   addu      $a1, $v0, $zero
/* 65B0 800059B0 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 65B4 800059B4 3C028000 */  lui        $v0, %hi(change_some_debug_settings)
/* 65B8 800059B8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 65BC 800059BC 244259CC */  addiu      $v0, $v0, %lo(change_some_debug_settings)
/* 65C0 800059C0 AC62D500 */  sw         $v0, %lo(freeWidgetFunc)($v1)
/* 65C4 800059C4 03E00008 */  jr         $ra
/* 65C8 800059C8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel change_some_debug_settings
/* 65CC 800059CC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 65D0 800059D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 65D4 800059D4 3C10800E */  lui        $s0, %hi(D_800E61E4)
/* 65D8 800059D8 8E0261E4 */  lw         $v0, %lo(D_800E61E4)($s0)
/* 65DC 800059DC 10820009 */  beq        $a0, $v0, .L80005A04
/* 65E0 800059E0 AFBF0014 */   sw        $ra, 0x14($sp)
/* 65E4 800059E4 3C05800E */  lui        $a1, %hi(unused_bitfeild)
/* 65E8 800059E8 24030001 */  addiu      $v1, $zero, 1
/* 65EC 800059EC 9484005E */  lhu        $a0, 0x5e($a0)
/* 65F0 800059F0 8CA261E0 */  lw         $v0, %lo(unused_bitfeild)($a1)
/* 65F4 800059F4 00831804 */  sllv       $v1, $v1, $a0
/* 65F8 800059F8 00431026 */  xor        $v0, $v0, $v1
/* 65FC 800059FC 08001690 */  j          .L80005A40
/* 6600 80005A00 ACA261E0 */   sw        $v0, 0x61e0($a1)
.L80005A04:
/* 6604 80005A04 00802821 */  addu       $a1, $a0, $zero
/* 6608 80005A08 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 660C 80005A0C 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 6610 80005A10 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 6614 80005A14 0C02DCB3 */  jal        func_800B72CC
/* 6618 80005A18 AC60D500 */   sw        $zero, %lo(freeWidgetFunc)($v1)
/* 661C 80005A1C 8E0661E4 */  lw         $a2, 0x61e4($s0)
/* 6620 80005A20 10C00006 */  beqz       $a2, .L80005A3C
/* 6624 80005A24 24050003 */   addiu     $a1, $zero, 3
/* 6628 80005A28 8CC20078 */  lw         $v0, 0x78($a2)
/* 662C 80005A2C 84440008 */  lh         $a0, 8($v0)
/* 6630 80005A30 8C43000C */  lw         $v1, 0xc($v0)
/* 6634 80005A34 0060F809 */  jalr       $v1
/* 6638 80005A38 00C42021 */   addu      $a0, $a2, $a0
.L80005A3C:
/* 663C 80005A3C AE0061E4 */  sw         $zero, 0x61e4($s0)
.L80005A40:
/* 6640 80005A40 8FBF0014 */  lw         $ra, 0x14($sp)
/* 6644 80005A44 8FB00010 */  lw         $s0, 0x10($sp)
/* 6648 80005A48 03E00008 */  jr         $ra
/* 664C 80005A4C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel list_some_debug_settings
/* 6650 80005A50 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 6654 80005A54 AFB1003C */  sw         $s1, 0x3c($sp)
/* 6658 80005A58 00808821 */  addu       $s1, $a0, $zero
/* 665C 80005A5C AFBF0058 */  sw         $ra, 0x58($sp)
/* 6660 80005A60 AFB70054 */  sw         $s7, 0x54($sp)
/* 6664 80005A64 AFB60050 */  sw         $s6, 0x50($sp)
/* 6668 80005A68 AFB5004C */  sw         $s5, 0x4c($sp)
/* 666C 80005A6C AFB40048 */  sw         $s4, 0x48($sp)
/* 6670 80005A70 AFB30044 */  sw         $s3, 0x44($sp)
/* 6674 80005A74 AFB20040 */  sw         $s2, 0x40($sp)
/* 6678 80005A78 0C02E658 */  jal        widget_menu_build
/* 667C 80005A7C AFB00038 */   sw        $s0, 0x38($sp)
/* 6680 80005A80 02202021 */  addu       $a0, $s1, $zero
/* 6684 80005A84 00002821 */  addu       $a1, $zero, $zero
/* 6688 80005A88 00003021 */  addu       $a2, $zero, $zero
/* 668C 80005A8C 24070140 */  addiu      $a3, $zero, 0x140
/* 6690 80005A90 3C02800D */  lui        $v0, %hi(widget_methods_unusedDebug)
/* 6694 80005A94 24427760 */  addiu      $v0, $v0, %lo(widget_methods_unusedDebug)
/* 6698 80005A98 241000F0 */  addiu      $s0, $zero, 0xf0
/* 669C 80005A9C AE220078 */  sw         $v0, 0x78($s1)
/* 66A0 80005AA0 240200C8 */  addiu      $v0, $zero, 0xc8
/* 66A4 80005AA4 AFB00010 */  sw         $s0, 0x10($sp)
/* 66A8 80005AA8 AFA00014 */  sw         $zero, 0x14($sp)
/* 66AC 80005AAC AFA00018 */  sw         $zero, 0x18($sp)
/* 66B0 80005AB0 AFA0001C */  sw         $zero, 0x1c($sp)
/* 66B4 80005AB4 0C013385 */  jal        func_8004CE14
/* 66B8 80005AB8 AFA20020 */   sw        $v0, 0x20($sp)
/* 66BC 80005ABC 02202021 */  addu       $a0, $s1, $zero
/* 66C0 80005AC0 2405000D */  addiu      $a1, $zero, 0xd
/* 66C4 80005AC4 24060014 */  addiu      $a2, $zero, 0x14
/* 66C8 80005AC8 24070014 */  addiu      $a3, $zero, 0x14
/* 66CC 80005ACC 24030014 */  addiu      $v1, $zero, 0x14
/* 66D0 80005AD0 24020140 */  addiu      $v0, $zero, 0x140
/* 66D4 80005AD4 AFA20018 */  sw         $v0, 0x18($sp)
/* 66D8 80005AD8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 66DC 80005ADC AFA30010 */  sw         $v1, 0x10($sp)
/* 66E0 80005AE0 AFA30014 */  sw         $v1, 0x14($sp)
/* 66E4 80005AE4 240300FF */  addiu      $v1, $zero, 0xff
/* 66E8 80005AE8 AFB0001C */  sw         $s0, 0x1c($sp)
/* 66EC 80005AEC AFA20020 */  sw         $v0, 0x20($sp)
/* 66F0 80005AF0 AFA20024 */  sw         $v0, 0x24($sp)
/* 66F4 80005AF4 AFA20028 */  sw         $v0, 0x28($sp)
/* 66F8 80005AF8 AFA3002C */  sw         $v1, 0x2c($sp)
/* 66FC 80005AFC 0C02F435 */  jal        widgetscrollmenu_init_2
/* 6700 80005B00 AFA00030 */   sw        $zero, 0x30($sp)
/* 6704 80005B04 00008021 */  addu       $s0, $zero, $zero
/* 6708 80005B08 3C17800D */  lui        $s7, 0x800d
/* 670C 80005B0C 3C16800E */  lui        $s6, 0x800e
/* 6710 80005B10 3C15800E */  lui        $s5, 0x800e
/* 6714 80005B14 3C03800F */  lui        $v1, %hi(gGlobalsText)
/* 6718 80005B18 24728920 */  addiu      $s2, $v1, %lo(gGlobalsText)
/* 671C 80005B1C 3C04800E */  lui        $a0, %hi(On_or_off_strings)
/* 6720 80005B20 249461E8 */  addiu      $s4, $a0, %lo(On_or_off_strings)
/* 6724 80005B24 24130001 */  addiu      $s3, $zero, 1
/* 6728 80005B28 AE22007C */  sw         $v0, 0x7c($s1)
/* 672C 80005B2C 02402021 */  addu       $a0, $s2, $zero
.L80005B30:
/* 6730 80005B30 8EC261B0 */  lw         $v0, 0x61b0($s6)
/* 6734 80005B34 00101880 */  sll        $v1, $s0, 2
/* 6738 80005B38 00621821 */  addu       $v1, $v1, $v0
/* 673C 80005B3C 8C660000 */  lw         $a2, ($v1)
/* 6740 80005B40 8EA261E0 */  lw         $v0, 0x61e0($s5)
/* 6744 80005B44 02131804 */  sllv       $v1, $s3, $s0
/* 6748 80005B48 00431024 */  and        $v0, $v0, $v1
/* 674C 80005B4C 2C420001 */  sltiu      $v0, $v0, 1
/* 6750 80005B50 00021080 */  sll        $v0, $v0, 2
/* 6754 80005B54 00541021 */  addu       $v0, $v0, $s4
/* 6758 80005B58 8C470000 */  lw         $a3, ($v0)
/* 675C 80005B5C 0C0333AC */  jal        sprintf
/* 6760 80005B60 26E57758 */   addiu     $a1, $s7, 0x7758
/* 6764 80005B64 0C026259 */  jal        passToMalloc
/* 6768 80005B68 2404007C */   addiu     $a0, $zero, 0x7c
/* 676C 80005B6C 00402021 */  addu       $a0, $v0, $zero
/* 6770 80005B70 02402821 */  addu       $a1, $s2, $zero
/* 6774 80005B74 0C02E3A0 */  jal        widgettext_func_2
/* 6778 80005B78 2406001E */   addiu     $a2, $zero, 0x1e
/* 677C 80005B7C 8E24007C */  lw         $a0, 0x7c($s1)
/* 6780 80005B80 00402821 */  addu       $a1, $v0, $zero
/* 6784 80005B84 0C02E885 */  jal        link_widget_text
/* 6788 80005B88 A450005E */   sh        $s0, 0x5e($v0)
/* 678C 80005B8C 26030001 */  addiu      $v1, $s0, 1
/* 6790 80005B90 307000FF */  andi       $s0, $v1, 0xff
/* 6794 80005B94 2E02000D */  sltiu      $v0, $s0, 0xd
/* 6798 80005B98 1440FFE5 */  bnez       $v0, .L80005B30
/* 679C 80005B9C 02402021 */   addu      $a0, $s2, $zero
/* 67A0 80005BA0 02201021 */  addu       $v0, $s1, $zero
/* 67A4 80005BA4 8FBF0058 */  lw         $ra, 0x58($sp)
/* 67A8 80005BA8 8FB70054 */  lw         $s7, 0x54($sp)
/* 67AC 80005BAC 8FB60050 */  lw         $s6, 0x50($sp)
/* 67B0 80005BB0 8FB5004C */  lw         $s5, 0x4c($sp)
/* 67B4 80005BB4 8FB40048 */  lw         $s4, 0x48($sp)
/* 67B8 80005BB8 8FB30044 */  lw         $s3, 0x44($sp)
/* 67BC 80005BBC 8FB20040 */  lw         $s2, 0x40($sp)
/* 67C0 80005BC0 8FB1003C */  lw         $s1, 0x3c($sp)
/* 67C4 80005BC4 8FB00038 */  lw         $s0, 0x38($sp)
/* 67C8 80005BC8 03E00008 */  jr         $ra
/* 67CC 80005BCC 27BD0060 */   addiu     $sp, $sp, 0x60

glabel widget_unusedDebug_free
/* 67D0 80005BD0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 67D4 80005BD4 3C02800D */  lui        $v0, %hi(widget_methods_unusedDebug)
/* 67D8 80005BD8 24427760 */  addiu      $v0, $v0, %lo(widget_methods_unusedDebug)
/* 67DC 80005BDC AFBF0010 */  sw         $ra, 0x10($sp)
/* 67E0 80005BE0 0C02E66C */  jal        widget_menu_free
/* 67E4 80005BE4 AC820078 */   sw        $v0, 0x78($a0)
/* 67E8 80005BE8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 67EC 80005BEC 03E00008 */  jr         $ra
/* 67F0 80005BF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80005BF4
/* 67F4 80005BF4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 67F8 80005BF8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 67FC 80005BFC 0C02F031 */  jal        func_800BC0C4
/* 6800 80005C00 8C84007C */   lw        $a0, 0x7c($a0)
/* 6804 80005C04 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6808 80005C08 03E00008 */  jr         $ra
/* 680C 80005C0C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_80005c10
/* 6810 80005C10 03E00008 */  jr         $ra
/* 6814 80005C14 00801021 */   addu      $v0, $a0, $zero

glabel func_80005C18
/* 6818 80005C18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 681C 80005C1C AFBF0010 */  sw         $ra, 0x10($sp)
/* 6820 80005C20 8C85007C */  lw         $a1, 0x7c($a0)
/* 6824 80005C24 8CA30078 */  lw         $v1, 0x78($a1)
/* 6828 80005C28 84640058 */  lh         $a0, 0x58($v1)
/* 682C 80005C2C 8C62005C */  lw         $v0, 0x5c($v1)
/* 6830 80005C30 0040F809 */  jalr       $v0
/* 6834 80005C34 00A42021 */   addu      $a0, $a1, $a0
/* 6838 80005C38 8FBF0010 */  lw         $ra, 0x10($sp)
/* 683C 80005C3C 00001021 */  addu       $v0, $zero, $zero
/* 6840 80005C40 03E00008 */  jr         $ra
/* 6844 80005C44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80005C48
/* 6848 80005C48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 684C 80005C4C AFBF0010 */  sw         $ra, 0x10($sp)
/* 6850 80005C50 8C85007C */  lw         $a1, 0x7c($a0)
/* 6854 80005C54 8CA30078 */  lw         $v1, 0x78($a1)
/* 6858 80005C58 84640060 */  lh         $a0, 0x60($v1)
/* 685C 80005C5C 8C620064 */  lw         $v0, 0x64($v1)
/* 6860 80005C60 0040F809 */  jalr       $v0
/* 6864 80005C64 00A42021 */   addu      $a0, $a1, $a0
/* 6868 80005C68 8FBF0010 */  lw         $ra, 0x10($sp)
/* 686C 80005C6C 00001021 */  addu       $v0, $zero, $zero
/* 6870 80005C70 03E00008 */  jr         $ra
/* 6874 80005C74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel list_some_debug_switches
/* 6878 80005C78 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 687C 80005C7C AFB10014 */  sw         $s1, 0x14($sp)
/* 6880 80005C80 00008821 */  addu       $s1, $zero, $zero
/* 6884 80005C84 AFBE0030 */  sw         $fp, 0x30($sp)
/* 6888 80005C88 3C1E800D */  lui        $fp, 0x800d
/* 688C 80005C8C AFB7002C */  sw         $s7, 0x2c($sp)
/* 6890 80005C90 3C17800E */  lui        $s7, 0x800e
/* 6894 80005C94 AFB60028 */  sw         $s6, 0x28($sp)
/* 6898 80005C98 3C16800E */  lui        $s6, 0x800e
/* 689C 80005C9C 3C02800E */  lui        $v0, %hi(On_or_off_strings)
/* 68A0 80005CA0 AFB50024 */  sw         $s5, 0x24($sp)
/* 68A4 80005CA4 245561E8 */  addiu      $s5, $v0, %lo(On_or_off_strings)
/* 68A8 80005CA8 AFB40020 */  sw         $s4, 0x20($sp)
/* 68AC 80005CAC 0080A021 */  addu       $s4, $a0, $zero
/* 68B0 80005CB0 AFBF0034 */  sw         $ra, 0x34($sp)
/* 68B4 80005CB4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 68B8 80005CB8 AFB20018 */  sw         $s2, 0x18($sp)
/* 68BC 80005CBC AFB00010 */  sw         $s0, 0x10($sp)
/* 68C0 80005CC0 8E82007C */  lw         $v0, 0x7c($s4)
/* 68C4 80005CC4 24130001 */  addiu      $s3, $zero, 1
/* 68C8 80005CC8 8C520040 */  lw         $s2, 0x40($v0)
/* 68CC 80005CCC 8E420018 */  lw         $v0, 0x18($s2)
.L80005CD0:
/* 68D0 80005CD0 00118080 */  sll        $s0, $s1, 2
/* 68D4 80005CD4 02021021 */  addu       $v0, $s0, $v0
/* 68D8 80005CD8 0C02EEBC */  jal        func_800BBAF0
/* 68DC 80005CDC 8C440000 */   lw        $a0, ($v0)
/* 68E0 80005CE0 00402021 */  addu       $a0, $v0, $zero
/* 68E4 80005CE4 8EE361B0 */  lw         $v1, 0x61b0($s7)
/* 68E8 80005CE8 8EC261E0 */  lw         $v0, 0x61e0($s6)
/* 68EC 80005CEC 02038021 */  addu       $s0, $s0, $v1
/* 68F0 80005CF0 02331804 */  sllv       $v1, $s3, $s1
/* 68F4 80005CF4 00431024 */  and        $v0, $v0, $v1
/* 68F8 80005CF8 2C420001 */  sltiu      $v0, $v0, 1
/* 68FC 80005CFC 00021080 */  sll        $v0, $v0, 2
/* 6900 80005D00 00551021 */  addu       $v0, $v0, $s5
/* 6904 80005D04 8E060000 */  lw         $a2, ($s0)
/* 6908 80005D08 8C470000 */  lw         $a3, ($v0)
/* 690C 80005D0C 0C0333AC */  jal        sprintf
/* 6910 80005D10 27C57758 */   addiu     $a1, $fp, 0x7758
/* 6914 80005D14 26230001 */  addiu      $v1, $s1, 1
/* 6918 80005D18 307100FF */  andi       $s1, $v1, 0xff
/* 691C 80005D1C 2E22000D */  sltiu      $v0, $s1, 0xd
/* 6920 80005D20 5440FFEB */  bnel       $v0, $zero, .L80005CD0
/* 6924 80005D24 8E420018 */   lw        $v0, 0x18($s2)
/* 6928 80005D28 0C02E683 */  jal        func_800B9A0C
/* 692C 80005D2C 02802021 */   addu      $a0, $s4, $zero
/* 6930 80005D30 8FBF0034 */  lw         $ra, 0x34($sp)
/* 6934 80005D34 8FBE0030 */  lw         $fp, 0x30($sp)
/* 6938 80005D38 8FB7002C */  lw         $s7, 0x2c($sp)
/* 693C 80005D3C 8FB60028 */  lw         $s6, 0x28($sp)
/* 6940 80005D40 8FB50024 */  lw         $s5, 0x24($sp)
/* 6944 80005D44 8FB40020 */  lw         $s4, 0x20($sp)
/* 6948 80005D48 8FB3001C */  lw         $s3, 0x1c($sp)
/* 694C 80005D4C 8FB20018 */  lw         $s2, 0x18($sp)
/* 6950 80005D50 8FB10014 */  lw         $s1, 0x14($sp)
/* 6954 80005D54 8FB00010 */  lw         $s0, 0x10($sp)
/* 6958 80005D58 03E00008 */  jr         $ra
/* 695C 80005D5C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80005D60
/* 6960 80005D60 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 6964 80005D64 3C02800E */  lui        $v0, %hi(gGlobals)
/* 6968 80005D68 AFB3001C */  sw         $s3, 0x1c($sp)
/* 696C 80005D6C 245368A8 */  addiu      $s3, $v0, %lo(gGlobals)
/* 6970 80005D70 AFBF0024 */  sw         $ra, 0x24($sp)
/* 6974 80005D74 AFB40020 */  sw         $s4, 0x20($sp)
/* 6978 80005D78 AFB20018 */  sw         $s2, 0x18($sp)
/* 697C 80005D7C AFB10014 */  sw         $s1, 0x14($sp)
/* 6980 80005D80 AFB00010 */  sw         $s0, 0x10($sp)
/* 6984 80005D84 8E7200A8 */  lw         $s2, 0xa8($s3)
/* 6988 80005D88 0080A021 */  addu       $s4, $a0, $zero
/* 698C 80005D8C 1240002E */  beqz       $s2, .L80005E48
/* 6990 80005D90 AE800000 */   sw        $zero, ($s4)
/* 6994 80005D94 86430104 */  lh         $v1, 0x104($s2)
/* 6998 80005D98 2402FFFF */  addiu      $v0, $zero, -1
/* 699C 80005D9C 1062002A */  beq        $v1, $v0, .L80005E48
/* 69A0 80005DA0 00031100 */   sll       $v0, $v1, 4
/* 69A4 80005DA4 00431023 */  subu       $v0, $v0, $v1
/* 69A8 80005DA8 8E6403C4 */  lw         $a0, 0x3c4($s3)
/* 69AC 80005DAC 000211C0 */  sll        $v0, $v0, 7
/* 69B0 80005DB0 00828021 */  addu       $s0, $a0, $v0
/* 69B4 80005DB4 86030002 */  lh         $v1, 2($s0)
/* 69B8 80005DB8 10600024 */  beqz       $v1, .L80005E4C
/* 69BC 80005DBC 3402FFFF */   ori       $v0, $zero, 0xffff
/* 69C0 80005DC0 0C004902 */  jal        findWandererFromPlayerName
/* 69C4 80005DC4 96040000 */   lhu       $a0, ($s0)
/* 69C8 80005DC8 00408821 */  addu       $s1, $v0, $zero
/* 69CC 80005DCC 1220001F */  beqz       $s1, .L80005E4C
/* 69D0 80005DD0 3402FFFF */   ori       $v0, $zero, 0xffff
/* 69D4 80005DD4 96230050 */  lhu        $v1, 0x50($s1)
/* 69D8 80005DD8 8E640200 */  lw         $a0, 0x200($s3)
/* 69DC 80005DDC 000310C0 */  sll        $v0, $v1, 3
/* 69E0 80005DE0 00431023 */  subu       $v0, $v0, $v1
/* 69E4 80005DE4 00021080 */  sll        $v0, $v0, 2
/* 69E8 80005DE8 00431023 */  subu       $v0, $v0, $v1
/* 69EC 80005DEC 8C850044 */  lw         $a1, 0x44($a0)
/* 69F0 80005DF0 00021080 */  sll        $v0, $v0, 2
/* 69F4 80005DF4 00A22021 */  addu       $a0, $a1, $v0
/* 69F8 80005DF8 10800014 */  beqz       $a0, .L80005E4C
/* 69FC 80005DFC 3402FFFF */   ori       $v0, $zero, 0xffff
/* 6A00 80005E00 C6000034 */  lwc1       $f0, 0x34($s0)
/* 6A04 80005E04 C6420034 */  lwc1       $f2, 0x34($s2)
/* 6A08 80005E08 46020000 */  add.s      $f0, $f0, $f2
/* 6A0C 80005E0C 3C01800D */  lui        $at, %hi(D_800D7830)
/* 6A10 80005E10 C4247830 */  lwc1       $f4, %lo(D_800D7830)($at)
/* 6A14 80005E14 46040000 */  add.s      $f0, $f0, $f4
/* 6A18 80005E18 C6420108 */  lwc1       $f2, 0x108($s2)
/* 6A1C 80005E1C 4602003C */  c.lt.s     $f0, $f2
/* 6A20 80005E20 00000000 */  nop
/* 6A24 80005E24 4501000A */  bc1t       .L80005E50
/* 6A28 80005E28 8FBF0024 */   lw        $ra, 0x24($sp)
/* 6A2C 80005E2C 0C004E69 */  jal        run_voxelFuncs1
/* 6A30 80005E30 8E6500A8 */   lw        $a1, 0xa8($s3)
/* 6A34 80005E34 10400005 */  beqz       $v0, .L80005E4C
/* 6A38 80005E38 3402FFFF */   ori       $v0, $zero, 0xffff
/* 6A3C 80005E3C 96220050 */  lhu        $v0, 0x50($s1)
/* 6A40 80005E40 08001793 */  j          .L80005E4C
/* 6A44 80005E44 AE910000 */   sw        $s1, ($s4)
.L80005E48:
/* 6A48 80005E48 3402FFFF */  ori        $v0, $zero, 0xffff
.L80005E4C:
/* 6A4C 80005E4C 8FBF0024 */  lw         $ra, 0x24($sp)
.L80005E50:
/* 6A50 80005E50 8FB40020 */  lw         $s4, 0x20($sp)
/* 6A54 80005E54 8FB3001C */  lw         $s3, 0x1c($sp)
/* 6A58 80005E58 8FB20018 */  lw         $s2, 0x18($sp)
/* 6A5C 80005E5C 8FB10014 */  lw         $s1, 0x14($sp)
/* 6A60 80005E60 8FB00010 */  lw         $s0, 0x10($sp)
/* 6A64 80005E64 03E00008 */  jr         $ra
/* 6A68 80005E68 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_checking_monsterparty
/* 6A6C 80005E6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 6A70 80005E70 AFBF0010 */  sw         $ra, 0x10($sp)
/* 6A74 80005E74 94830016 */  lhu        $v1, 0x16($a0)
/* 6A78 80005E78 24020005 */  addiu      $v0, $zero, 5
/* 6A7C 80005E7C 14620004 */  bne        $v1, $v0, .L80005E90
/* 6A80 80005E80 3C02800E */   lui       $v0, %hi(PlayerCharStruct)
/* 6A84 80005E84 8C436950 */  lw         $v1, %lo(PlayerCharStruct)($v0)
/* 6A88 80005E88 080017A6 */  j          .L80005E98
/* 6A8C 80005E8C C4600108 */   lwc1      $f0, 0x108($v1)
.L80005E90:
/* 6A90 80005E90 0C02AB66 */  jal        get_vec3_proximity
/* 6A94 80005E94 00000000 */   nop
.L80005E98:
/* 6A98 80005E98 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6A9C 80005E9C 03E00008 */  jr         $ra
/* 6AA0 80005EA0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel monsterparty_setvec2
/* 6AA4 80005EA4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 6AA8 80005EA8 AFB00010 */  sw         $s0, 0x10($sp)
/* 6AAC 80005EAC 00808021 */  addu       $s0, $a0, $zero
/* 6AB0 80005EB0 AFB10014 */  sw         $s1, 0x14($sp)
/* 6AB4 80005EB4 00A08821 */  addu       $s1, $a1, $zero
/* 6AB8 80005EB8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 6ABC 80005EBC 8E050000 */  lw         $a1, ($s0)
/* 6AC0 80005EC0 8E060008 */  lw         $a2, 8($s0)
/* 6AC4 80005EC4 0C02AD55 */  jal        setVec2
/* 6AC8 80005EC8 02202021 */   addu      $a0, $s1, $zero
/* 6ACC 80005ECC 96030016 */  lhu        $v1, 0x16($s0)
/* 6AD0 80005ED0 24020005 */  addiu      $v0, $zero, 5
/* 6AD4 80005ED4 14620013 */  bne        $v1, $v0, .L80005F24
/* 6AD8 80005ED8 8FBF0018 */   lw        $ra, 0x18($sp)
/* 6ADC 80005EDC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 6AE0 80005EE0 244468A8 */  addiu      $a0, $v0, %lo(gGlobals)
/* 6AE4 80005EE4 8C8200A8 */  lw         $v0, 0xa8($a0)
/* 6AE8 80005EE8 5040000F */  beql       $v0, $zero, .L80005F28
/* 6AEC 80005EEC 8FB10014 */   lw        $s1, 0x14($sp)
/* 6AF0 80005EF0 84430104 */  lh         $v1, 0x104($v0)
/* 6AF4 80005EF4 2402FFFF */  addiu      $v0, $zero, -1
/* 6AF8 80005EF8 1062000A */  beq        $v1, $v0, .L80005F24
/* 6AFC 80005EFC 00031100 */   sll       $v0, $v1, 4
/* 6B00 80005F00 00431023 */  subu       $v0, $v0, $v1
/* 6B04 80005F04 8C8303C4 */  lw         $v1, 0x3c4($a0)
/* 6B08 80005F08 000211C0 */  sll        $v0, $v0, 7
/* 6B0C 80005F0C 00621821 */  addu       $v1, $v1, $v0
/* 6B10 80005F10 8C650068 */  lw         $a1, 0x68($v1)
/* 6B14 80005F14 8C660070 */  lw         $a2, 0x70($v1)
/* 6B18 80005F18 0C02AD55 */  jal        setVec2
/* 6B1C 80005F1C 02202021 */   addu      $a0, $s1, $zero
/* 6B20 80005F20 8FBF0018 */  lw         $ra, 0x18($sp)
.L80005F24:
/* 6B24 80005F24 8FB10014 */  lw         $s1, 0x14($sp)
.L80005F28:
/* 6B28 80005F28 8FB00010 */  lw         $s0, 0x10($sp)
/* 6B2C 80005F2C 03E00008 */  jr         $ra
/* 6B30 80005F30 27BD0020 */   addiu     $sp, $sp, 0x20

glabel obj_ref_func
/* 6B34 80005F34 27BDFE88 */  addiu      $sp, $sp, -0x178
/* 6B38 80005F38 3C02800E */  lui        $v0, %hi(gGlobals)
/* 6B3C 80005F3C AFB00128 */  sw         $s0, 0x128($sp)
/* 6B40 80005F40 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 6B44 80005F44 AFBF014C */  sw         $ra, 0x14c($sp)
/* 6B48 80005F48 AFBE0148 */  sw         $fp, 0x148($sp)
/* 6B4C 80005F4C AFB70144 */  sw         $s7, 0x144($sp)
/* 6B50 80005F50 AFB60140 */  sw         $s6, 0x140($sp)
/* 6B54 80005F54 AFB5013C */  sw         $s5, 0x13c($sp)
/* 6B58 80005F58 AFB40138 */  sw         $s4, 0x138($sp)
/* 6B5C 80005F5C AFB30134 */  sw         $s3, 0x134($sp)
/* 6B60 80005F60 AFB20130 */  sw         $s2, 0x130($sp)
/* 6B64 80005F64 AFB1012C */  sw         $s1, 0x12c($sp)
/* 6B68 80005F68 F7BC0170 */  sdc1       $f28, 0x170($sp)
/* 6B6C 80005F6C F7BA0168 */  sdc1       $f26, 0x168($sp)
/* 6B70 80005F70 F7B80160 */  sdc1       $f24, 0x160($sp)
/* 6B74 80005F74 F7B60158 */  sdc1       $f22, 0x158($sp)
/* 6B78 80005F78 F7B40150 */  sdc1       $f20, 0x150($sp)
/* 6B7C 80005F7C 96032048 */  lhu        $v1, 0x2048($s0)
/* 6B80 80005F80 146000E9 */  bnez       $v1, .L80006328
/* 6B84 80005F84 8FBF014C */   lw        $ra, 0x14c($sp)
/* 6B88 80005F88 0C009310 */  jal        check_some_toggle
/* 6B8C 80005F8C 00000000 */   nop
/* 6B90 80005F90 144000E5 */  bnez       $v0, .L80006328
/* 6B94 80005F94 8FBF014C */   lw        $ra, 0x14c($sp)
/* 6B98 80005F98 8E1E00A8 */  lw         $fp, 0xa8($s0)
/* 6B9C 80005F9C 53C000E3 */  beql       $fp, $zero, .L8000632C
/* 6BA0 80005FA0 8FBE0148 */   lw        $fp, 0x148($sp)
/* 6BA4 80005FA4 8E170200 */  lw         $s7, 0x200($s0)
/* 6BA8 80005FA8 12E000DF */  beqz       $s7, .L80006328
/* 6BAC 80005FAC 02E02021 */   addu      $a0, $s7, $zero
/* 6BB0 80005FB0 27C20068 */  addiu      $v0, $fp, 0x68
/* 6BB4 80005FB4 00402821 */  addu       $a1, $v0, $zero
/* 6BB8 80005FB8 27A60010 */  addiu      $a2, $sp, 0x10
/* 6BBC 80005FBC 27A70012 */  addiu      $a3, $sp, 0x12
/* 6BC0 80005FC0 AFA2011C */  sw         $v0, 0x11c($sp)
/* 6BC4 80005FC4 A7A00010 */  sh         $zero, 0x10($sp)
/* 6BC8 80005FC8 0C02B768 */  jal        getZonePositionShorts
/* 6BCC 80005FCC A7A00012 */   sh        $zero, 0x12($sp)
/* 6BD0 80005FD0 87A50010 */  lh         $a1, 0x10($sp)
/* 6BD4 80005FD4 87A60012 */  lh         $a2, 0x12($sp)
/* 6BD8 80005FD8 0C02BCCE */  jal        borg9_get_unkStruct
/* 6BDC 80005FDC 02E02021 */   addu      $a0, $s7, $zero
/* 6BE0 80005FE0 00409021 */  addu       $s2, $v0, $zero
/* 6BE4 80005FE4 124000CF */  beqz       $s2, .L80006324
/* 6BE8 80005FE8 0000B021 */   addu      $s6, $zero, $zero
/* 6BEC 80005FEC 0C001758 */  jal        func_80005D60
/* 6BF0 80005FF0 27A40118 */   addiu     $a0, $sp, 0x118
/* 6BF4 80005FF4 00403021 */  addu       $a2, $v0, $zero
/* 6BF8 80005FF8 3402FFFF */  ori        $v0, $zero, 0xffff
/* 6BFC 80005FFC 10C20027 */  beq        $a2, $v0, .L8000609C
/* 6C00 80006000 000610C0 */   sll       $v0, $a2, 3
/* 6C04 80006004 00461023 */  subu       $v0, $v0, $a2
/* 6C08 80006008 00021080 */  sll        $v0, $v0, 2
/* 6C0C 8000600C 00461023 */  subu       $v0, $v0, $a2
/* 6C10 80006010 00021080 */  sll        $v0, $v0, 2
/* 6C14 80006014 8E0300A8 */  lw         $v1, 0xa8($s0)
/* 6C18 80006018 8FA40118 */  lw         $a0, 0x118($sp)
/* 6C1C 8000601C 24670068 */  addiu      $a3, $v1, 0x68
/* 6C20 80006020 8EE30044 */  lw         $v1, 0x44($s7)
/* 6C24 80006024 8C850000 */  lw         $a1, ($a0)
/* 6C28 80006028 00431021 */  addu       $v0, $v0, $v1
/* 6C2C 8000602C 94430058 */  lhu        $v1, 0x58($v0)
/* 6C30 80006030 30630004 */  andi       $v1, $v1, 4
/* 6C34 80006034 14600019 */  bnez       $v1, .L8000609C
/* 6C38 80006038 24A50068 */   addiu     $a1, $a1, 0x68
/* 6C3C 8000603C C4E00004 */  lwc1       $f0, 4($a3)
/* 6C40 80006040 C4A20004 */  lwc1       $f2, 4($a1)
/* 6C44 80006044 46020181 */  sub.s      $f6, $f0, $f2
/* 6C48 80006048 44802000 */  mtc1       $zero, $f4
/* 6C4C 8000604C 4606203C */  c.lt.s     $f4, $f6
/* 6C50 80006050 00000000 */  nop
/* 6C54 80006054 45020009 */  bc1fl      .L8000607C
/* 6C58 80006058 46003007 */   neg.s     $f0, $f6
/* 6C5C 8000605C 3C01800D */  lui        $at, %hi(D_800D7834)
/* 6C60 80006060 C4207834 */  lwc1       $f0, %lo(D_800D7834)($at)
/* 6C64 80006064 4600303C */  c.lt.s     $f6, $f0
/* 6C68 80006068 00000000 */  nop
/* 6C6C 8000606C 4503000A */  bc1tl      .L80006098
/* 6C70 80006070 24160001 */   addiu     $s6, $zero, 1
/* 6C74 80006074 08001828 */  j          .L800060A0
/* 6C78 80006078 96420010 */   lhu       $v0, 0x10($s2)
.L8000607C:
/* 6C7C 8000607C 3C01800D */  lui        $at, %hi(D_800D7838)
/* 6C80 80006080 C4227838 */  lwc1       $f2, %lo(D_800D7838)($at)
/* 6C84 80006084 4602003C */  c.lt.s     $f0, $f2
/* 6C88 80006088 00000000 */  nop
/* 6C8C 8000608C 45020004 */  bc1fl      .L800060A0
/* 6C90 80006090 96420010 */   lhu       $v0, 0x10($s2)
/* 6C94 80006094 24160001 */  addiu      $s6, $zero, 1
.L80006098:
/* 6C98 80006098 A7A60018 */  sh         $a2, 0x18($sp)
.L8000609C:
/* 6C9C 8000609C 96420010 */  lhu        $v0, 0x10($s2)
.L800060A0:
/* 6CA0 800060A0 1040002B */  beqz       $v0, .L80006150
/* 6CA4 800060A4 00008821 */   addu      $s1, $zero, $zero
/* 6CA8 800060A8 24150010 */  addiu      $s5, $zero, 0x10
/* 6CAC 800060AC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 6CB0 800060B0 245468A8 */  addiu      $s4, $v0, %lo(gGlobals)
/* 6CB4 800060B4 27B30018 */  addiu      $s3, $sp, 0x18
.L800060B8:
/* 6CB8 800060B8 12D50020 */  beq        $s6, $s5, .L8000613C
/* 6CBC 800060BC 00111840 */   sll       $v1, $s1, 1
/* 6CC0 800060C0 8E420008 */  lw         $v0, 8($s2)
/* 6CC4 800060C4 00621821 */  addu       $v1, $v1, $v0
/* 6CC8 800060C8 94700000 */  lhu        $s0, ($v1)
/* 6CCC 800060CC 8EE30044 */  lw         $v1, 0x44($s7)
/* 6CD0 800060D0 001010C0 */  sll        $v0, $s0, 3
/* 6CD4 800060D4 00501023 */  subu       $v0, $v0, $s0
/* 6CD8 800060D8 00021080 */  sll        $v0, $v0, 2
/* 6CDC 800060DC 00501023 */  subu       $v0, $v0, $s0
/* 6CE0 800060E0 00021080 */  sll        $v0, $v0, 2
/* 6CE4 800060E4 00622021 */  addu       $a0, $v1, $v0
/* 6CE8 800060E8 94830014 */  lhu        $v1, 0x14($a0)
/* 6CEC 800060EC 30622000 */  andi       $v0, $v1, 0x2000
/* 6CF0 800060F0 54400013 */  bnel       $v0, $zero, .L80006140
/* 6CF4 800060F4 96420010 */   lhu       $v0, 0x10($s2)
/* 6CF8 800060F8 30628000 */  andi       $v0, $v1, 0x8000
/* 6CFC 800060FC 50400010 */  beql       $v0, $zero, .L80006140
/* 6D00 80006100 96420010 */   lhu       $v0, 0x10($s2)
/* 6D04 80006104 8C830010 */  lw         $v1, 0x10($a0)
/* 6D08 80006108 8E820008 */  lw         $v0, 8($s4)
/* 6D0C 8000610C 0043102B */  sltu       $v0, $v0, $v1
/* 6D10 80006110 5440000B */  bnel       $v0, $zero, .L80006140
/* 6D14 80006114 96420010 */   lhu       $v0, 0x10($s2)
/* 6D18 80006118 0C004E69 */  jal        run_voxelFuncs1
/* 6D1C 8000611C 03C02821 */   addu      $a1, $fp, $zero
/* 6D20 80006120 10400006 */  beqz       $v0, .L8000613C
/* 6D24 80006124 02C01021 */   addu      $v0, $s6, $zero
/* 6D28 80006128 24430001 */  addiu      $v1, $v0, 1
/* 6D2C 8000612C 3076FFFF */  andi       $s6, $v1, 0xffff
/* 6D30 80006130 00021040 */  sll        $v0, $v0, 1
/* 6D34 80006134 02621021 */  addu       $v0, $s3, $v0
/* 6D38 80006138 A4500000 */  sh         $s0, ($v0)
.L8000613C:
/* 6D3C 8000613C 96420010 */  lhu        $v0, 0x10($s2)
.L80006140:
/* 6D40 80006140 26310001 */  addiu      $s1, $s1, 1
/* 6D44 80006144 0222102B */  sltu       $v0, $s1, $v0
/* 6D48 80006148 1440FFDB */  bnez       $v0, .L800060B8
/* 6D4C 8000614C 00000000 */   nop
.L80006150:
/* 6D50 80006150 12C00074 */  beqz       $s6, .L80006324
/* 6D54 80006154 24020001 */   addiu     $v0, $zero, 1
/* 6D58 80006158 16C2000D */  bne        $s6, $v0, .L80006190
/* 6D5C 8000615C 27B00058 */   addiu     $s0, $sp, 0x58
/* 6D60 80006160 00003021 */  addu       $a2, $zero, $zero
/* 6D64 80006164 97A50018 */  lhu        $a1, 0x18($sp)
/* 6D68 80006168 8EE20044 */  lw         $v0, 0x44($s7)
/* 6D6C 8000616C 000520C0 */  sll        $a0, $a1, 3
/* 6D70 80006170 00852023 */  subu       $a0, $a0, $a1
/* 6D74 80006174 00042080 */  sll        $a0, $a0, 2
/* 6D78 80006178 00852023 */  subu       $a0, $a0, $a1
/* 6D7C 8000617C 00042080 */  sll        $a0, $a0, 2
/* 6D80 80006180 0C004E4D */  jal        run_voxelFuncs0
/* 6D84 80006184 00442021 */   addu      $a0, $v0, $a0
/* 6D88 80006188 080018CA */  j          .L80006328
/* 6D8C 8000618C 8FBF014C */   lw        $ra, 0x14c($sp)
.L80006190:
/* 6D90 80006190 02002021 */  addu       $a0, $s0, $zero
/* 6D94 80006194 8FA2011C */  lw         $v0, 0x11c($sp)
/* 6D98 80006198 00008821 */  addu       $s1, $zero, $zero
/* 6D9C 8000619C 8C450000 */  lw         $a1, ($v0)
/* 6DA0 800061A0 4480B000 */  mtc1       $zero, $f22
/* 6DA4 800061A4 0C02AD55 */  jal        setVec2
/* 6DA8 800061A8 8C460008 */   lw        $a2, 8($v0)
/* 6DAC 800061AC 12C00017 */  beqz       $s6, .L8000620C
/* 6DB0 800061B0 24027FFF */   addiu     $v0, $zero, 0x7fff
/* 6DB4 800061B4 27B00018 */  addiu      $s0, $sp, 0x18
.L800061B8:
/* 6DB8 800061B8 96020000 */  lhu        $v0, ($s0)
/* 6DBC 800061BC 8EE40044 */  lw         $a0, 0x44($s7)
/* 6DC0 800061C0 000218C0 */  sll        $v1, $v0, 3
/* 6DC4 800061C4 00621823 */  subu       $v1, $v1, $v0
/* 6DC8 800061C8 00031880 */  sll        $v1, $v1, 2
/* 6DCC 800061CC 00621823 */  subu       $v1, $v1, $v0
/* 6DD0 800061D0 00031880 */  sll        $v1, $v1, 2
/* 6DD4 800061D4 00832021 */  addu       $a0, $a0, $v1
/* 6DD8 800061D8 50800008 */  beql       $a0, $zero, .L800061FC
/* 6DDC 800061DC 26310001 */   addiu     $s1, $s1, 1
/* 6DE0 800061E0 0C00179B */  jal        func_checking_monsterparty
/* 6DE4 800061E4 8FA5011C */   lw        $a1, 0x11c($sp)
/* 6DE8 800061E8 4616003C */  c.lt.s     $f0, $f22
/* 6DEC 800061EC 00000000 */  nop
/* 6DF0 800061F0 45020001 */  bc1fl      .L800061F8
/* 6DF4 800061F4 46000586 */   mov.s     $f22, $f0
.L800061F8:
/* 6DF8 800061F8 26310001 */  addiu      $s1, $s1, 1
.L800061FC:
/* 6DFC 800061FC 0236102B */  sltu       $v0, $s1, $s6
/* 6E00 80006200 1440FFED */  bnez       $v0, .L800061B8
/* 6E04 80006204 26100002 */   addiu     $s0, $s0, 2
/* 6E08 80006208 24027FFF */  addiu      $v0, $zero, 0x7fff
.L8000620C:
/* 6E0C 8000620C 00008821 */  addu       $s1, $zero, $zero
/* 6E10 80006210 4480C000 */  mtc1       $zero, $f24
/* 6E14 80006214 0000A021 */  addu       $s4, $zero, $zero
/* 6E18 80006218 12C00031 */  beqz       $s6, .L800062E0
/* 6E1C 8000621C AFA20120 */   sw        $v0, 0x120($sp)
/* 6E20 80006220 27B500D8 */  addiu      $s5, $sp, 0xd8
/* 6E24 80006224 27B30098 */  addiu      $s3, $sp, 0x98
/* 6E28 80006228 27B20018 */  addiu      $s2, $sp, 0x18
/* 6E2C 8000622C 3C01800D */  lui        $at, %hi(D_800D783C)
/* 6E30 80006230 C43C783C */  lwc1       $f28, %lo(D_800D783C)($at)
/* 6E34 80006234 3C01800D */  lui        $at, %hi(D_800D7840)
/* 6E38 80006238 C43A7840 */  lwc1       $f26, %lo(D_800D7840)($at)
.L8000623C:
/* 6E3C 8000623C 96420000 */  lhu        $v0, ($s2)
/* 6E40 80006240 8EE40044 */  lw         $a0, 0x44($s7)
/* 6E44 80006244 000218C0 */  sll        $v1, $v0, 3
/* 6E48 80006248 00621823 */  subu       $v1, $v1, $v0
/* 6E4C 8000624C 00031880 */  sll        $v1, $v1, 2
/* 6E50 80006250 00621823 */  subu       $v1, $v1, $v0
/* 6E54 80006254 00031880 */  sll        $v1, $v1, 2
/* 6E58 80006258 00838021 */  addu       $s0, $a0, $v1
/* 6E5C 8000625C 5200001D */  beql       $s0, $zero, .L800062D4
/* 6E60 80006260 26310001 */   addiu     $s1, $s1, 1
/* 6E64 80006264 8FA5011C */  lw         $a1, 0x11c($sp)
/* 6E68 80006268 0C00179B */  jal        func_checking_monsterparty
/* 6E6C 8000626C 02002021 */   addu      $a0, $s0, $zero
/* 6E70 80006270 4600B501 */  sub.s      $f20, $f22, $f0
/* 6E74 80006274 02002021 */  addu       $a0, $s0, $zero
/* 6E78 80006278 02A02821 */  addu       $a1, $s5, $zero
/* 6E7C 8000627C 0C0017A9 */  jal        monsterparty_setvec2
/* 6E80 80006280 4616A503 */   div.s     $f20, $f20, $f22
/* 6E84 80006284 02602021 */  addu       $a0, $s3, $zero
/* 6E88 80006288 27A50058 */  addiu      $a1, $sp, 0x58
/* 6E8C 8000628C 0C02AB1D */  jal        Vec2_Sub
/* 6E90 80006290 02A03021 */   addu      $a2, $s5, $zero
/* 6E94 80006294 0C02AB9F */  jal        vec2_normalize
/* 6E98 80006298 02602021 */   addu      $a0, $s3, $zero
/* 6E9C 8000629C 02602021 */  addu       $a0, $s3, $zero
/* 6EA0 800062A0 0C02AB72 */  jal        vec2_scalar_product
/* 6EA4 800062A4 27C50020 */   addiu     $a1, $fp, 0x20
/* 6EA8 800062A8 461C0000 */  add.s      $f0, $f0, $f28
/* 6EAC 800062AC 461A0002 */  mul.s      $f0, $f0, $f26
/* 6EB0 800062B0 4600A500 */  add.s      $f20, $f20, $f0
/* 6EB4 800062B4 4618A03C */  c.lt.s     $f20, $f24
/* 6EB8 800062B8 00000000 */  nop
/* 6EBC 800062BC 45010005 */  bc1t       .L800062D4
/* 6EC0 800062C0 26310001 */   addiu     $s1, $s1, 1
/* 6EC4 800062C4 0200A021 */  addu       $s4, $s0, $zero
/* 6EC8 800062C8 96420000 */  lhu        $v0, ($s2)
/* 6ECC 800062CC 4600A606 */  mov.s      $f24, $f20
/* 6ED0 800062D0 AFA20120 */  sw         $v0, 0x120($sp)
.L800062D4:
/* 6ED4 800062D4 0236102B */  sltu       $v0, $s1, $s6
/* 6ED8 800062D8 1440FFD8 */  bnez       $v0, .L8000623C
/* 6EDC 800062DC 26520002 */   addiu     $s2, $s2, 2
.L800062E0:
/* 6EE0 800062E0 12800010 */  beqz       $s4, .L80006324
/* 6EE4 800062E4 02802021 */   addu      $a0, $s4, $zero
/* 6EE8 800062E8 8FA50120 */  lw         $a1, 0x120($sp)
/* 6EEC 800062EC 0C004E4D */  jal        run_voxelFuncs0
/* 6EF0 800062F0 00003021 */   addu      $a2, $zero, $zero
/* 6EF4 800062F4 96830016 */  lhu        $v1, 0x16($s4)
/* 6EF8 800062F8 24020001 */  addiu      $v0, $zero, 1
/* 6EFC 800062FC 14620005 */  bne        $v1, $v0, .L80006314
/* 6F00 80006300 24020007 */   addiu     $v0, $zero, 7
/* 6F04 80006304 2402000B */  addiu      $v0, $zero, 0xb
/* 6F08 80006308 A7C20014 */  sh         $v0, 0x14($fp)
/* 6F0C 8000630C 96830016 */  lhu        $v1, 0x16($s4)
/* 6F10 80006310 24020007 */  addiu      $v0, $zero, 7
.L80006314:
/* 6F14 80006314 14620004 */  bne        $v1, $v0, .L80006328
/* 6F18 80006318 8FBF014C */   lw        $ra, 0x14c($sp)
/* 6F1C 8000631C 24020013 */  addiu      $v0, $zero, 0x13
/* 6F20 80006320 A7C20014 */  sh         $v0, 0x14($fp)
.L80006324:
/* 6F24 80006324 8FBF014C */  lw         $ra, 0x14c($sp)
.L80006328:
/* 6F28 80006328 8FBE0148 */  lw         $fp, 0x148($sp)
.L8000632C:
/* 6F2C 8000632C 8FB70144 */  lw         $s7, 0x144($sp)
/* 6F30 80006330 8FB60140 */  lw         $s6, 0x140($sp)
/* 6F34 80006334 8FB5013C */  lw         $s5, 0x13c($sp)
/* 6F38 80006338 8FB40138 */  lw         $s4, 0x138($sp)
/* 6F3C 8000633C 8FB30134 */  lw         $s3, 0x134($sp)
/* 6F40 80006340 8FB20130 */  lw         $s2, 0x130($sp)
/* 6F44 80006344 8FB1012C */  lw         $s1, 0x12c($sp)
/* 6F48 80006348 8FB00128 */  lw         $s0, 0x128($sp)
/* 6F4C 8000634C D7BC0170 */  ldc1       $f28, 0x170($sp)
/* 6F50 80006350 D7BA0168 */  ldc1       $f26, 0x168($sp)
/* 6F54 80006354 D7B80160 */  ldc1       $f24, 0x160($sp)
/* 6F58 80006358 D7B60158 */  ldc1       $f22, 0x158($sp)
/* 6F5C 8000635C D7B40150 */  ldc1       $f20, 0x150($sp)
/* 6F60 80006360 03E00008 */  jr         $ra
/* 6F64 80006364 27BD0178 */   addiu     $sp, $sp, 0x178
/* 6F68 80006368 00000000 */  nop
/* 6F6C 8000636C 00000000 */  nop
