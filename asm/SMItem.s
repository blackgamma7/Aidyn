.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel checkpObject
/* 3ED60 8003E160 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 3ED64 8003E164 AFB20068 */  sw         $s2, 0x68($sp)
/* 3ED68 8003E168 00809021 */  addu       $s2, $a0, $zero
/* 3ED6C 8003E16C AFB3006C */  sw         $s3, 0x6c($sp)
/* 3ED70 8003E170 00A09821 */  addu       $s3, $a1, $zero
/* 3ED74 8003E174 AFB00060 */  sw         $s0, 0x60($sp)
/* 3ED78 8003E178 30D000FF */  andi       $s0, $a2, 0xff
/* 3ED7C 8003E17C AFB10064 */  sw         $s1, 0x64($sp)
/* 3ED80 8003E180 AFBF0070 */  sw         $ra, 0x70($sp)
/* 3ED84 8003E184 0C02DCFC */  jal        widget_init
/* 3ED88 8003E188 30F100FF */   andi      $s1, $a3, 0xff
/* 3ED8C 8003E18C 3C03800E */  lui        $v1, %hi(D_800DC458)
/* 3ED90 8003E190 2463C458 */  addiu      $v1, $v1, %lo(D_800DC458)
/* 3ED94 8003E194 AE430078 */  sw         $v1, 0x78($s2)
/* 3ED98 8003E198 AE53007C */  sw         $s3, 0x7c($s2)
/* 3ED9C 8003E19C A2500080 */  sb         $s0, 0x80($s2)
/* 3EDA0 8003E1A0 A2510081 */  sb         $s1, 0x81($s2)
/* 3EDA4 8003E1A4 AE400084 */  sw         $zero, 0x84($s2)
/* 3EDA8 8003E1A8 AE400088 */  sw         $zero, 0x88($s2)
/* 3EDAC 8003E1AC AE40008C */  sw         $zero, 0x8c($s2)
/* 3EDB0 8003E1B0 AE400090 */  sw         $zero, 0x90($s2)
/* 3EDB4 8003E1B4 A6400094 */  sh         $zero, 0x94($s2)
/* 3EDB8 8003E1B8 16600008 */  bnez       $s3, .L8003E1DC
/* 3EDBC 8003E1BC A6400096 */   sh        $zero, 0x96($s2)
/* 3EDC0 8003E1C0 3C04800E */  lui        $a0, %hi(D_800DC410)
/* 3EDC4 8003E1C4 2484C410 */  addiu      $a0, $a0, %lo(D_800DC410)
/* 3EDC8 8003E1C8 3C05800E */  lui        $a1, %hi(D_800DC41C)
/* 3EDCC 8003E1CC 0C025F2D */  jal        manualCrash
/* 3EDD0 8003E1D0 24A5C41C */   addiu     $a1, $a1, %lo(D_800DC41C)
/* 3EDD4 8003E1D4 0800F8FA */  j          .L8003E3E8
/* 3EDD8 8003E1D8 02401021 */   addu      $v0, $s2, $zero
.L8003E1DC:
/* 3EDDC 8003E1DC 96640000 */  lhu        $a0, ($s3)
/* 3EDE0 8003E1E0 0C013218 */  jal        GetItemImage
/* 3EDE4 8003E1E4 27A50058 */   addiu     $a1, $sp, 0x58
/* 3EDE8 8003E1E8 3C03800F */  lui        $v1, %hi(gGlobalsText)
/* 3EDEC 8003E1EC 24738920 */  addiu      $s3, $v1, %lo(gGlobalsText)
/* 3EDF0 8003E1F0 02602021 */  addu       $a0, $s3, $zero
/* 3EDF4 8003E1F4 8E43007C */  lw         $v1, 0x7c($s2)
/* 3EDF8 8003E1F8 8FA20058 */  lw         $v0, 0x58($sp)
/* 3EDFC 8003E1FC 94670000 */  lhu        $a3, ($v1)
/* 3EE00 8003E200 3C05800E */  lui        $a1, %hi(D_800DC42C)
/* 3EE04 8003E204 AFA20010 */  sw         $v0, 0x10($sp)
/* 3EE08 8003E208 8C660004 */  lw         $a2, 4($v1)
/* 3EE0C 8003E20C 0C0333AC */  jal        sprintf
/* 3EE10 8003E210 24A5C42C */   addiu     $a1, $a1, %lo(D_800DC42C)
/* 3EE14 8003E214 0C026259 */  jal        passToMalloc
/* 3EE18 8003E218 2404007C */   addiu     $a0, $zero, 0x7c
/* 3EE1C 8003E21C 8FA40058 */  lw         $a0, 0x58($sp)
/* 3EE20 8003E220 0C0290E2 */  jal        get_borg_8
/* 3EE24 8003E224 00408021 */   addu      $s0, $v0, $zero
/* 3EE28 8003E228 02002021 */  addu       $a0, $s0, $zero
/* 3EE2C 8003E22C 0C02E518 */  jal        borg8_widget
/* 3EE30 8003E230 00402821 */   addu      $a1, $v0, $zero
/* 3EE34 8003E234 00402021 */  addu       $a0, $v0, $zero
/* 3EE38 8003E238 2405000C */  addiu      $a1, $zero, 0xc
/* 3EE3C 8003E23C 0C02DD42 */  jal        set_widgetHeight
/* 3EE40 8003E240 AE420088 */   sw        $v0, 0x88($s2)
/* 3EE44 8003E244 8E440088 */  lw         $a0, 0x88($s2)
/* 3EE48 8003E248 0C02DD46 */  jal        set_widgetWidth
/* 3EE4C 8003E24C 2405000C */   addiu     $a1, $zero, 0xc
/* 3EE50 8003E250 8E450088 */  lw         $a1, 0x88($s2)
/* 3EE54 8003E254 0C02DEDC */  jal        link_widgets
/* 3EE58 8003E258 02402021 */   addu      $a0, $s2, $zero
/* 3EE5C 8003E25C 92430081 */  lbu        $v1, 0x81($s2)
/* 3EE60 8003E260 241100FF */  addiu      $s1, $zero, 0xff
/* 3EE64 8003E264 1071001F */  beq        $v1, $s1, .L8003E2E4
/* 3EE68 8003E268 00000000 */   nop
/* 3EE6C 8003E26C 0C026259 */  jal        passToMalloc
/* 3EE70 8003E270 2404007C */   addiu     $a0, $zero, 0x7c
/* 3EE74 8003E274 3C05800F */  lui        $a1, 0x800f
/* 3EE78 8003E278 92430081 */  lbu        $v1, 0x81($s2)
/* 3EE7C 8003E27C 8E64F580 */  lw         $a0, -0xa80($s3)
/* 3EE80 8003E280 00031880 */  sll        $v1, $v1, 2
/* 3EE84 8003E284 00832021 */  addu       $a0, $a0, $v1
/* 3EE88 8003E288 8C860000 */  lw         $a2, ($a0)
/* 3EE8C 8003E28C 8CA413A0 */  lw         $a0, 0x13a0($a1)
/* 3EE90 8003E290 94C50000 */  lhu        $a1, ($a2)
/* 3EE94 8003E294 0C01D531 */  jal        getEntityPortait
/* 3EE98 8003E298 00408021 */   addu      $s0, $v0, $zero
/* 3EE9C 8003E29C 0C0290E2 */  jal        get_borg_8
/* 3EEA0 8003E2A0 00402021 */   addu      $a0, $v0, $zero
/* 3EEA4 8003E2A4 02002021 */  addu       $a0, $s0, $zero
/* 3EEA8 8003E2A8 0C02E518 */  jal        borg8_widget
/* 3EEAC 8003E2AC 00402821 */   addu      $a1, $v0, $zero
/* 3EEB0 8003E2B0 00402021 */  addu       $a0, $v0, $zero
/* 3EEB4 8003E2B4 2405000C */  addiu      $a1, $zero, 0xc
/* 3EEB8 8003E2B8 0C02DD42 */  jal        set_widgetHeight
/* 3EEBC 8003E2BC AE420084 */   sw        $v0, 0x84($s2)
/* 3EEC0 8003E2C0 8E440084 */  lw         $a0, 0x84($s2)
/* 3EEC4 8003E2C4 0C02DD46 */  jal        set_widgetWidth
/* 3EEC8 8003E2C8 2405000C */   addiu     $a1, $zero, 0xc
/* 3EECC 8003E2CC 8E450084 */  lw         $a1, 0x84($s2)
/* 3EED0 8003E2D0 0C02DEDC */  jal        link_widgets
/* 3EED4 8003E2D4 02402021 */   addu      $a0, $s2, $zero
/* 3EED8 8003E2D8 8E430084 */  lw         $v1, 0x84($s2)
/* 3EEDC 8003E2DC 92420081 */  lbu        $v0, 0x81($s2)
/* 3EEE0 8003E2E0 A462005E */  sh         $v0, 0x5e($v1)
.L8003E2E4:
/* 3EEE4 8003E2E4 0C026259 */  jal        passToMalloc
/* 3EEE8 8003E2E8 2404007C */   addiu     $a0, $zero, 0x7c
/* 3EEEC 8003E2EC 8E43007C */  lw         $v1, 0x7c($s2)
/* 3EEF0 8003E2F0 8C640004 */  lw         $a0, 4($v1)
/* 3EEF4 8003E2F4 0C03353E */  jal        strlen
/* 3EEF8 8003E2F8 00408021 */   addu      $s0, $v0, $zero
/* 3EEFC 8003E2FC 02002021 */  addu       $a0, $s0, $zero
/* 3EF00 8003E300 8E43007C */  lw         $v1, 0x7c($s2)
/* 3EF04 8003E304 24420001 */  addiu      $v0, $v0, 1
/* 3EF08 8003E308 8C650004 */  lw         $a1, 4($v1)
/* 3EF0C 8003E30C 0C02DFC8 */  jal        widgetcliptext_init
/* 3EF10 8003E310 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3EF14 8003E314 24050082 */  addiu      $a1, $zero, 0x82
/* 3EF18 8003E318 8C480078 */  lw         $t0, 0x78($v0)
/* 3EF1C 8003E31C 24060050 */  addiu      $a2, $zero, 0x50
/* 3EF20 8003E320 AE420090 */  sw         $v0, 0x90($s2)
/* 3EF24 8003E324 85040048 */  lh         $a0, 0x48($t0)
/* 3EF28 8003E328 24070050 */  addiu      $a3, $zero, 0x50
/* 3EF2C 8003E32C AFB10010 */  sw         $s1, 0x10($sp)
/* 3EF30 8003E330 8D03004C */  lw         $v1, 0x4c($t0)
/* 3EF34 8003E334 0060F809 */  jalr       $v1
/* 3EF38 8003E338 00442021 */   addu      $a0, $v0, $a0
/* 3EF3C 8003E33C 8E450090 */  lw         $a1, 0x90($s2)
/* 3EF40 8003E340 0C02DEDC */  jal        link_widgets
/* 3EF44 8003E344 02402021 */   addu      $a0, $s2, $zero
/* 3EF48 8003E348 00002821 */  addu       $a1, $zero, $zero
/* 3EF4C 8003E34C 8E440090 */  lw         $a0, 0x90($s2)
/* 3EF50 8003E350 0C02EF52 */  jal        func_800BBD48
/* 3EF54 8003E354 24060280 */   addiu     $a2, $zero, 0x280
/* 3EF58 8003E358 92420080 */  lbu        $v0, 0x80($s2)
/* 3EF5C 8003E35C 1040001E */  beqz       $v0, .L8003E3D8
/* 3EF60 8003E360 00403021 */   addu      $a2, $v0, $zero
/* 3EF64 8003E364 27A40018 */  addiu      $a0, $sp, 0x18
/* 3EF68 8003E368 3C05800E */  lui        $a1, %hi(D_800DC454)
/* 3EF6C 8003E36C 0C0333AC */  jal        sprintf
/* 3EF70 8003E370 24A5C454 */   addiu     $a1, $a1, %lo(D_800DC454)
/* 3EF74 8003E374 0C026259 */  jal        passToMalloc
/* 3EF78 8003E378 2404007C */   addiu     $a0, $zero, 0x7c
/* 3EF7C 8003E37C 27A40018 */  addiu      $a0, $sp, 0x18
/* 3EF80 8003E380 0C03353E */  jal        strlen
/* 3EF84 8003E384 00408021 */   addu      $s0, $v0, $zero
/* 3EF88 8003E388 02002021 */  addu       $a0, $s0, $zero
/* 3EF8C 8003E38C 27A50018 */  addiu      $a1, $sp, 0x18
/* 3EF90 8003E390 24420001 */  addiu      $v0, $v0, 1
/* 3EF94 8003E394 0C02DFC8 */  jal        widgetcliptext_init
/* 3EF98 8003E398 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3EF9C 8003E39C 24050082 */  addiu      $a1, $zero, 0x82
/* 3EFA0 8003E3A0 92430080 */  lbu        $v1, 0x80($s2)
/* 3EFA4 8003E3A4 8C480078 */  lw         $t0, 0x78($v0)
/* 3EFA8 8003E3A8 24060050 */  addiu      $a2, $zero, 0x50
/* 3EFAC 8003E3AC AE42008C */  sw         $v0, 0x8c($s2)
/* 3EFB0 8003E3B0 A443005E */  sh         $v1, 0x5e($v0)
/* 3EFB4 8003E3B4 85040048 */  lh         $a0, 0x48($t0)
/* 3EFB8 8003E3B8 24070050 */  addiu      $a3, $zero, 0x50
/* 3EFBC 8003E3BC AFB10010 */  sw         $s1, 0x10($sp)
/* 3EFC0 8003E3C0 8D03004C */  lw         $v1, 0x4c($t0)
/* 3EFC4 8003E3C4 0060F809 */  jalr       $v1
/* 3EFC8 8003E3C8 00442021 */   addu      $a0, $v0, $a0
/* 3EFCC 8003E3CC 8E45008C */  lw         $a1, 0x8c($s2)
/* 3EFD0 8003E3D0 0C02DEDC */  jal        link_widgets
/* 3EFD4 8003E3D4 02402021 */   addu      $a0, $s2, $zero
.L8003E3D8:
/* 3EFD8 8003E3D8 8E42007C */  lw         $v0, 0x7c($s2)
/* 3EFDC 8003E3DC 94430000 */  lhu        $v1, ($v0)
/* 3EFE0 8003E3E0 A643005E */  sh         $v1, 0x5e($s2)
/* 3EFE4 8003E3E4 02401021 */  addu       $v0, $s2, $zero
.L8003E3E8:
/* 3EFE8 8003E3E8 8FBF0070 */  lw         $ra, 0x70($sp)
/* 3EFEC 8003E3EC 8FB3006C */  lw         $s3, 0x6c($sp)
/* 3EFF0 8003E3F0 8FB20068 */  lw         $s2, 0x68($sp)
/* 3EFF4 8003E3F4 8FB10064 */  lw         $s1, 0x64($sp)
/* 3EFF8 8003E3F8 8FB00060 */  lw         $s0, 0x60($sp)
/* 3EFFC 8003E3FC 03E00008 */  jr         $ra
/* 3F000 8003E400 27BD0078 */   addiu     $sp, $sp, 0x78

glabel func_8003E404
/* 3F004 8003E404 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F008 8003E408 3C02800E */  lui        $v0, %hi(D_800DC458)
/* 3F00C 8003E40C 2442C458 */  addiu      $v0, $v0, %lo(D_800DC458)
/* 3F010 8003E410 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3F014 8003E414 0C02DD2B */  jal        free_widget
/* 3F018 8003E418 AC820078 */   sw        $v0, 0x78($a0)
/* 3F01C 8003E41C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F020 8003E420 03E00008 */  jr         $ra
/* 3F024 8003E424 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003E428
/* 3F028 8003E428 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3F02C 8003E42C 00063400 */  sll        $a2, $a2, 0x10
/* 3F030 8003E430 00063403 */  sra        $a2, $a2, 0x10
/* 3F034 8003E434 00073C00 */  sll        $a3, $a3, 0x10
/* 3F038 8003E438 00073C03 */  sra        $a3, $a3, 0x10
/* 3F03C 8003E43C AFBF0018 */  sw         $ra, 0x18($sp)
/* 3F040 8003E440 84830062 */  lh         $v1, 0x62($a0)
/* 3F044 8003E444 8482006A */  lh         $v0, 0x6a($a0)
/* 3F048 8003E448 87A80032 */  lh         $t0, 0x32($sp)
/* 3F04C 8003E44C 0062102A */  slt        $v0, $v1, $v0
/* 3F050 8003E450 1040000B */  beqz       $v0, .L8003E480
/* 3F054 8003E454 87A90036 */   lh        $t1, 0x36($sp)
/* 3F058 8003E458 84820068 */  lh         $v0, 0x68($a0)
/* 3F05C 8003E45C 2463001C */  addiu      $v1, $v1, 0x1c
/* 3F060 8003E460 0043102A */  slt        $v0, $v0, $v1
/* 3F064 8003E464 10400007 */  beqz       $v0, .L8003E484
/* 3F068 8003E468 00A01021 */   addu      $v0, $a1, $zero
/* 3F06C 8003E46C AFA80010 */  sw         $t0, 0x10($sp)
/* 3F070 8003E470 0C02DE14 */  jal        widget_func_8
/* 3F074 8003E474 AFA90014 */   sw        $t1, 0x14($sp)
/* 3F078 8003E478 0800F922 */  j          .L8003E488
/* 3F07C 8003E47C 8FBF0018 */   lw        $ra, 0x18($sp)
.L8003E480:
/* 3F080 8003E480 00A01021 */  addu       $v0, $a1, $zero
.L8003E484:
/* 3F084 8003E484 8FBF0018 */  lw         $ra, 0x18($sp)
.L8003E488:
/* 3F088 8003E488 03E00008 */  jr         $ra
/* 3F08C 8003E48C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003E490
/* 3F090 8003E490 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3F094 8003E494 AFB00018 */  sw         $s0, 0x18($sp)
/* 3F098 8003E498 00808021 */  addu       $s0, $a0, $zero
/* 3F09C 8003E49C AFBF001C */  sw         $ra, 0x1c($sp)
/* 3F0A0 8003E4A0 8E020090 */  lw         $v0, 0x90($s0)
/* 3F0A4 8003E4A4 1040004F */  beqz       $v0, .L8003E5E4
/* 3F0A8 8003E4A8 00000000 */   nop
/* 3F0AC 8003E4AC 86060062 */  lh         $a2, 0x62($s0)
/* 3F0B0 8003E4B0 8602006A */  lh         $v0, 0x6a($s0)
/* 3F0B4 8003E4B4 00C2102A */  slt        $v0, $a2, $v0
/* 3F0B8 8003E4B8 1040004A */  beqz       $v0, .L8003E5E4
/* 3F0BC 8003E4BC 24C3001C */   addiu     $v1, $a2, 0x1c
/* 3F0C0 8003E4C0 86020068 */  lh         $v0, 0x68($s0)
/* 3F0C4 8003E4C4 0043102A */  slt        $v0, $v0, $v1
/* 3F0C8 8003E4C8 10400046 */  beqz       $v0, .L8003E5E4
/* 3F0CC 8003E4CC 00000000 */   nop
/* 3F0D0 8003E4D0 8E040084 */  lw         $a0, 0x84($s0)
/* 3F0D4 8003E4D4 5080000B */  beql       $a0, $zero, .L8003E504
/* 3F0D8 8003E4D8 8E040088 */   lw        $a0, 0x88($s0)
/* 3F0DC 8003E4DC 0C02DD3F */  jal        set_widget_coords
/* 3F0E0 8003E4E0 86050060 */   lh        $a1, 0x60($s0)
/* 3F0E4 8003E4E4 8602006A */  lh         $v0, 0x6a($s0)
/* 3F0E8 8003E4E8 8E040084 */  lw         $a0, 0x84($s0)
/* 3F0EC 8003E4EC 86050068 */  lh         $a1, 0x68($s0)
/* 3F0F0 8003E4F0 86060064 */  lh         $a2, 0x64($s0)
/* 3F0F4 8003E4F4 86070066 */  lh         $a3, 0x66($s0)
/* 3F0F8 8003E4F8 0C02DD6A */  jal        some_widget_setter
/* 3F0FC 8003E4FC AFA20010 */   sw        $v0, 0x10($sp)
/* 3F100 8003E500 8E040088 */  lw         $a0, 0x88($s0)
.L8003E504:
/* 3F104 8003E504 86050060 */  lh         $a1, 0x60($s0)
/* 3F108 8003E508 86060062 */  lh         $a2, 0x62($s0)
/* 3F10C 8003E50C 0C02DD3F */  jal        set_widget_coords
/* 3F110 8003E510 24A5000D */   addiu     $a1, $a1, 0xd
/* 3F114 8003E514 8602006A */  lh         $v0, 0x6a($s0)
/* 3F118 8003E518 8E040088 */  lw         $a0, 0x88($s0)
/* 3F11C 8003E51C 86050068 */  lh         $a1, 0x68($s0)
/* 3F120 8003E520 86060064 */  lh         $a2, 0x64($s0)
/* 3F124 8003E524 86070066 */  lh         $a3, 0x66($s0)
/* 3F128 8003E528 0C02DD6A */  jal        some_widget_setter
/* 3F12C 8003E52C AFA20010 */   sw        $v0, 0x10($sp)
/* 3F130 8003E530 8E04008C */  lw         $a0, 0x8c($s0)
/* 3F134 8003E534 5080000D */  beql       $a0, $zero, .L8003E56C
/* 3F138 8003E538 96040060 */   lhu       $a0, 0x60($s0)
/* 3F13C 8003E53C 86050060 */  lh         $a1, 0x60($s0)
/* 3F140 8003E540 86060062 */  lh         $a2, 0x62($s0)
/* 3F144 8003E544 0C02DD3F */  jal        set_widget_coords
/* 3F148 8003E548 24A5001A */   addiu     $a1, $a1, 0x1a
/* 3F14C 8003E54C 8602006A */  lh         $v0, 0x6a($s0)
/* 3F150 8003E550 8E04008C */  lw         $a0, 0x8c($s0)
/* 3F154 8003E554 86050068 */  lh         $a1, 0x68($s0)
/* 3F158 8003E558 86060064 */  lh         $a2, 0x64($s0)
/* 3F15C 8003E55C 86070066 */  lh         $a3, 0x66($s0)
/* 3F160 8003E560 0C02DD6A */  jal        some_widget_setter
/* 3F164 8003E564 AFA20010 */   sw        $v0, 0x10($sp)
/* 3F168 8003E568 96040060 */  lhu        $a0, 0x60($s0)
.L8003E56C:
/* 3F16C 8003E56C 8E03008C */  lw         $v1, 0x8c($s0)
/* 3F170 8003E570 2482008C */  addiu      $v0, $a0, 0x8c
/* 3F174 8003E574 10600003 */  beqz       $v1, .L8003E584
/* 3F178 8003E578 A6020096 */   sh        $v0, 0x96($s0)
/* 3F17C 8003E57C 0800F962 */  j          .L8003E588
/* 3F180 8003E580 2482002A */   addiu     $v0, $a0, 0x2a
.L8003E584:
/* 3F184 8003E584 2482001E */  addiu      $v0, $a0, 0x1e
.L8003E588:
/* 3F188 8003E588 A6020094 */  sh         $v0, 0x94($s0)
/* 3F18C 8003E58C 8E040090 */  lw         $a0, 0x90($s0)
/* 3F190 8003E590 86050094 */  lh         $a1, 0x94($s0)
/* 3F194 8003E594 0C02DD3F */  jal        set_widget_coords
/* 3F198 8003E598 86060062 */   lh        $a2, 0x62($s0)
/* 3F19C 8003E59C 8E090090 */  lw         $t1, 0x90($s0)
/* 3F1A0 8003E5A0 9202005B */  lbu        $v0, 0x5b($s0)
/* 3F1A4 8003E5A4 92050058 */  lbu        $a1, 0x58($s0)
/* 3F1A8 8003E5A8 92060059 */  lbu        $a2, 0x59($s0)
/* 3F1AC 8003E5AC 8D280078 */  lw         $t0, 0x78($t1)
/* 3F1B0 8003E5B0 9207005A */  lbu        $a3, 0x5a($s0)
/* 3F1B4 8003E5B4 85040048 */  lh         $a0, 0x48($t0)
/* 3F1B8 8003E5B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 3F1BC 8003E5BC 8D03004C */  lw         $v1, 0x4c($t0)
/* 3F1C0 8003E5C0 0060F809 */  jalr       $v1
/* 3F1C4 8003E5C4 01242021 */   addu      $a0, $t1, $a0
/* 3F1C8 8003E5C8 8602006A */  lh         $v0, 0x6a($s0)
/* 3F1CC 8003E5CC 8E040090 */  lw         $a0, 0x90($s0)
/* 3F1D0 8003E5D0 86050068 */  lh         $a1, 0x68($s0)
/* 3F1D4 8003E5D4 86060064 */  lh         $a2, 0x64($s0)
/* 3F1D8 8003E5D8 86070066 */  lh         $a3, 0x66($s0)
/* 3F1DC 8003E5DC 0C02DD6A */  jal        some_widget_setter
/* 3F1E0 8003E5E0 AFA20010 */   sw        $v0, 0x10($sp)
.L8003E5E4:
/* 3F1E4 8003E5E4 0C02DE51 */  jal        func_800B7944
/* 3F1E8 8003E5E8 02002021 */   addu      $a0, $s0, $zero
/* 3F1EC 8003E5EC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3F1F0 8003E5F0 8FB00018 */  lw         $s0, 0x18($sp)
/* 3F1F4 8003E5F4 03E00008 */  jr         $ra
/* 3F1F8 8003E5F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003E5FC
/* 3F1FC 8003E5FC 94820066 */  lhu        $v0, 0x66($a0)
/* 3F200 8003E600 94830064 */  lhu        $v1, 0x64($a0)
/* 3F204 8003E604 00431023 */  subu       $v0, $v0, $v1
/* 3F208 8003E608 03E00008 */  jr         $ra
/* 3F20C 8003E60C 3042FFFF */   andi      $v0, $v0, 0xffff

glabel ret13
/* 3F210 8003E610 03E00008 */  jr         $ra
/* 3F214 8003E614 2402000D */   addiu     $v0, $zero, 0xd

glabel func_8003E618
/* 3F218 8003E618 03E00008 */  jr         $ra
/* 3F21C 8003E61C 8C820084 */   lw        $v0, 0x84($a0)

glabel func_8003E620
/* 3F220 8003E620 03E00008 */  jr         $ra
/* 3F224 8003E624 8C82008C */   lw        $v0, 0x8c($a0)

glabel func_8003E628
/* 3F228 8003E628 03E00008 */  jr         $ra
/* 3F22C 8003E62C 8C82007C */   lw        $v0, 0x7c($a0)

glabel ret12_8003e630
/* 3F230 8003E630 03E00008 */  jr         $ra
/* 3F234 8003E634 2402000C */   addiu     $v0, $zero, 0xc
/* 3F238 8003E638 00000000 */  nop
/* 3F23C 8003E63C 00000000 */  nop
