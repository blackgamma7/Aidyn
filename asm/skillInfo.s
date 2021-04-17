.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widget_skills_title
/* 3F950 8003ED50 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3F954 8003ED54 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3F958 8003ED58 00808821 */  addu       $s1, $a0, $zero
/* 3F95C 8003ED5C AFB00018 */  sw         $s0, 0x18($sp)
/* 3F960 8003ED60 00A08021 */  addu       $s0, $a1, $zero
/* 3F964 8003ED64 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3F968 8003ED68 0C00DF44 */  jal        func_80037D10
/* 3F96C 8003ED6C 24050012 */   addiu     $a1, $zero, 0x12
/* 3F970 8003ED70 3C03800E */  lui        $v1, %hi(D_800DC670)
/* 3F974 8003ED74 2463C670 */  addiu      $v1, $v1, %lo(D_800DC670)
/* 3F978 8003ED78 3C02800F */  lui        $v0, %hi(partypicker)
/* 3F97C 8003ED7C AE230078 */  sw         $v1, 0x78($s1)
/* 3F980 8003ED80 AE30008C */  sw         $s0, 0x8c($s1)
/* 3F984 8003ED84 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3F988 8003ED88 16000011 */  bnez       $s0, .L8003EDD0
/* 3F98C 8003ED8C A2230088 */   sb        $v1, 0x88($s1)
/* 3F990 8003ED90 0C026259 */  jal        passToMalloc
/* 3F994 8003ED94 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F998 8003ED98 240400EC */  addiu      $a0, $zero, 0xec
/* 3F99C 8003ED9C 0C0290E2 */  jal        get_borg_8
/* 3F9A0 8003EDA0 00408021 */   addu      $s0, $v0, $zero
/* 3F9A4 8003EDA4 02002021 */  addu       $a0, $s0, $zero
/* 3F9A8 8003EDA8 0C02E518 */  jal        borg8_widget
/* 3F9AC 8003EDAC 00402821 */   addu      $a1, $v0, $zero
/* 3F9B0 8003EDB0 00402021 */  addu       $a0, $v0, $zero
/* 3F9B4 8003EDB4 2405009E */  addiu      $a1, $zero, 0x9e
/* 3F9B8 8003EDB8 24060051 */  addiu      $a2, $zero, 0x51
/* 3F9BC 8003EDBC 0C02DD3F */  jal        set_widget_coords
/* 3F9C0 8003EDC0 AE22007C */   sw        $v0, 0x7c($s1)
/* 3F9C4 8003EDC4 8E25007C */  lw         $a1, 0x7c($s1)
/* 3F9C8 8003EDC8 0C02DEDC */  jal        link_widgets
/* 3F9CC 8003EDCC 02202021 */   addu      $a0, $s1, $zero
.L8003EDD0:
/* 3F9D0 8003EDD0 02202021 */  addu       $a0, $s1, $zero
/* 3F9D4 8003EDD4 24050082 */  addiu      $a1, $zero, 0x82
/* 3F9D8 8003EDD8 24060050 */  addiu      $a2, $zero, 0x50
/* 3F9DC 8003EDDC 240200FF */  addiu      $v0, $zero, 0xff
/* 3F9E0 8003EDE0 24070050 */  addiu      $a3, $zero, 0x50
/* 3F9E4 8003EDE4 0C02DD4A */  jal        set_widget_color
/* 3F9E8 8003EDE8 AFA20010 */   sw        $v0, 0x10($sp)
/* 3F9EC 8003EDEC 02202021 */  addu       $a0, $s1, $zero
/* 3F9F0 8003EDF0 0C00FB84 */  jal        func_8003EE10
/* 3F9F4 8003EDF4 AE200080 */   sw        $zero, 0x80($s1)
/* 3F9F8 8003EDF8 02201021 */  addu       $v0, $s1, $zero
/* 3F9FC 8003EDFC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3FA00 8003EE00 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3FA04 8003EE04 8FB00018 */  lw         $s0, 0x18($sp)
/* 3FA08 8003EE08 03E00008 */  jr         $ra
/* 3FA0C 8003EE0C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8003EE10
/* 3FA10 8003EE10 3C02800F */  lui        $v0, %hi(partypicker)
/* 3FA14 8003EE14 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3FA18 8003EE18 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 3FA1C 8003EE1C AFB40038 */  sw         $s4, 0x38($sp)
/* 3FA20 8003EE20 0080A021 */  addu       $s4, $a0, $zero
/* 3FA24 8003EE24 AFBF0040 */  sw         $ra, 0x40($sp)
/* 3FA28 8003EE28 AFB5003C */  sw         $s5, 0x3c($sp)
/* 3FA2C 8003EE2C AFB30034 */  sw         $s3, 0x34($sp)
/* 3FA30 8003EE30 AFB20030 */  sw         $s2, 0x30($sp)
/* 3FA34 8003EE34 AFB1002C */  sw         $s1, 0x2c($sp)
/* 3FA38 8003EE38 AFB00028 */  sw         $s0, 0x28($sp)
/* 3FA3C 8003EE3C 8E84008C */  lw         $a0, 0x8c($s4)
/* 3FA40 8003EE40 10800004 */  beqz       $a0, .L8003EE54
/* 3FA44 8003EE44 A2830088 */   sb        $v1, 0x88($s4)
/* 3FA48 8003EE48 3C02800E */  lui        $v0, %hi(shop_skills)
/* 3FA4C 8003EE4C 0800FB9C */  j          .L8003EE70
/* 3FA50 8003EE50 8C537D90 */   lw        $s3, %lo(shop_skills)($v0)
.L8003EE54:
/* 3FA54 8003EE54 3C04800E */  lui        $a0, %hi(partyPointer)
/* 3FA58 8003EE58 92820088 */  lbu        $v0, 0x88($s4)
/* 3FA5C 8003EE5C 8C837EA0 */  lw         $v1, %lo(partyPointer)($a0)
/* 3FA60 8003EE60 00021080 */  sll        $v0, $v0, 2
/* 3FA64 8003EE64 00621821 */  addu       $v1, $v1, $v0
/* 3FA68 8003EE68 8C640000 */  lw         $a0, ($v1)
/* 3FA6C 8003EE6C 8C93001C */  lw         $s3, 0x1c($a0)
.L8003EE70:
/* 3FA70 8003EE70 8E820080 */  lw         $v0, 0x80($s4)
/* 3FA74 8003EE74 1040001B */  beqz       $v0, .L8003EEE4
/* 3FA78 8003EE78 0000A821 */   addu      $s5, $zero, $zero
/* 3FA7C 8003EE7C 00402821 */  addu       $a1, $v0, $zero
/* 3FA80 8003EE80 8E830078 */  lw         $v1, 0x78($s4)
/* 3FA84 8003EE84 8C520040 */  lw         $s2, 0x40($v0)
/* 3FA88 8003EE88 84640038 */  lh         $a0, 0x38($v1)
/* 3FA8C 8003EE8C 9655001E */  lhu        $s5, 0x1e($s2)
/* 3FA90 8003EE90 86510010 */  lh         $s1, 0x10($s2)
/* 3FA94 8003EE94 8C62003C */  lw         $v0, 0x3c($v1)
/* 3FA98 8003EE98 86500012 */  lh         $s0, 0x12($s2)
/* 3FA9C 8003EE9C 0040F809 */  jalr       $v0
/* 3FAA0 8003EEA0 02842021 */   addu      $a0, $s4, $a0
/* 3FAA4 8003EEA4 3C04800E */  lui        $a0, %hi(queueStructA)
/* 3FAA8 8003EEA8 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 3FAAC 8003EEAC 26850080 */  addiu      $a1, $s4, 0x80
/* 3FAB0 8003EEB0 24060006 */  addiu      $a2, $zero, 6
/* 3FAB4 8003EEB4 0C035867 */  jal        AllocFreeQueueItem
/* 3FAB8 8003EEB8 00003821 */   addu      $a3, $zero, $zero
/* 3FABC 8003EEBC 0C026259 */  jal        passToMalloc
/* 3FAC0 8003EEC0 2404007C */   addiu     $a0, $zero, 0x7c
/* 3FAC4 8003EEC4 00402021 */  addu       $a0, $v0, $zero
/* 3FAC8 8003EEC8 0C00BE10 */  jal        widgetfastscrollmenu_func
/* 3FACC 8003EECC 24050018 */   addiu     $a1, $zero, 0x18
/* 3FAD0 8003EED0 8C520040 */  lw         $s2, 0x40($v0)
/* 3FAD4 8003EED4 AE820080 */  sw         $v0, 0x80($s4)
/* 3FAD8 8003EED8 A6510010 */  sh         $s1, 0x10($s2)
/* 3FADC 8003EEDC 0800FBC0 */  j          .L8003EF00
/* 3FAE0 8003EEE0 A6500012 */   sh        $s0, 0x12($s2)
.L8003EEE4:
/* 3FAE4 8003EEE4 0C026259 */  jal        passToMalloc
/* 3FAE8 8003EEE8 2404007C */   addiu     $a0, $zero, 0x7c
/* 3FAEC 8003EEEC 00402021 */  addu       $a0, $v0, $zero
/* 3FAF0 8003EEF0 0C00BE10 */  jal        widgetfastscrollmenu_func
/* 3FAF4 8003EEF4 24050018 */   addiu     $a1, $zero, 0x18
/* 3FAF8 8003EEF8 8C520040 */  lw         $s2, 0x40($v0)
/* 3FAFC 8003EEFC AE820080 */  sw         $v0, 0x80($s4)
.L8003EF00:
/* 3FB00 8003EF00 24050044 */  addiu      $a1, $zero, 0x44
/* 3FB04 8003EF04 2406002A */  addiu      $a2, $zero, 0x2a
/* 3FB08 8003EF08 24070022 */  addiu      $a3, $zero, 0x22
/* 3FB0C 8003EF0C 240800FF */  addiu      $t0, $zero, 0xff
/* 3FB10 8003EF10 24020097 */  addiu      $v0, $zero, 0x97
/* 3FB14 8003EF14 8E840080 */  lw         $a0, 0x80($s4)
/* 3FB18 8003EF18 2403008D */  addiu      $v1, $zero, 0x8d
/* 3FB1C 8003EF1C AFA20014 */  sw         $v0, 0x14($sp)
/* 3FB20 8003EF20 240200BF */  addiu      $v0, $zero, 0xbf
/* 3FB24 8003EF24 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3FB28 8003EF28 24020014 */  addiu      $v0, $zero, 0x14
/* 3FB2C 8003EF2C AFA80010 */  sw         $t0, 0x10($sp)
/* 3FB30 8003EF30 AFA30018 */  sw         $v1, 0x18($sp)
/* 3FB34 8003EF34 AFA80020 */  sw         $t0, 0x20($sp)
/* 3FB38 8003EF38 0C00C0A0 */  jal        func_80030280
/* 3FB3C 8003EF3C AFA20024 */   sw        $v0, 0x24($sp)
/* 3FB40 8003EF40 8E830078 */  lw         $v1, 0x78($s4)
/* 3FB44 8003EF44 8E850080 */  lw         $a1, 0x80($s4)
/* 3FB48 8003EF48 84640030 */  lh         $a0, 0x30($v1)
/* 3FB4C 8003EF4C 8C620034 */  lw         $v0, 0x34($v1)
/* 3FB50 8003EF50 0040F809 */  jalr       $v0
/* 3FB54 8003EF54 02842021 */   addu      $a0, $s4, $a0
/* 3FB58 8003EF58 0C00E00B */  jal        make_upDown_arrows
/* 3FB5C 8003EF5C 02802021 */   addu      $a0, $s4, $zero
/* 3FB60 8003EF60 1260004A */  beqz       $s3, .L8003F08C
/* 3FB64 8003EF64 00008021 */   addu      $s0, $zero, $zero
/* 3FB68 8003EF68 02602021 */  addu       $a0, $s3, $zero
.L8003EF6C:
/* 3FB6C 8003EF6C 0C020F4B */  jal        capskillBaseMax
/* 3FB70 8003EF70 320500FF */   andi      $a1, $s0, 0xff
/* 3FB74 8003EF74 5840000C */  blezl      $v0, .L8003EFA8
/* 3FB78 8003EF78 26100001 */   addiu     $s0, $s0, 1
/* 3FB7C 8003EF7C 0C026259 */  jal        passToMalloc
/* 3FB80 8003EF80 24040094 */   addiu     $a0, $zero, 0x94
/* 3FB84 8003EF84 00402021 */  addu       $a0, $v0, $zero
/* 3FB88 8003EF88 02602821 */  addu       $a1, $s3, $zero
/* 3FB8C 8003EF8C 3206FFFF */  andi       $a2, $s0, 0xffff
/* 3FB90 8003EF90 0C00F990 */  jal        sheild_info
/* 3FB94 8003EF94 00003821 */   addu      $a3, $zero, $zero
/* 3FB98 8003EF98 8E840080 */  lw         $a0, 0x80($s4)
/* 3FB9C 8003EF9C 0C00C040 */  jal        func_80030100
/* 3FBA0 8003EFA0 00402821 */   addu      $a1, $v0, $zero
/* 3FBA4 8003EFA4 26100001 */  addiu      $s0, $s0, 1
.L8003EFA8:
/* 3FBA8 8003EFA8 2A02000C */  slti       $v0, $s0, 0xc
/* 3FBAC 8003EFAC 1440FFEF */  bnez       $v0, .L8003EF6C
/* 3FBB0 8003EFB0 02602021 */   addu      $a0, $s3, $zero
/* 3FBB4 8003EFB4 00008021 */  addu       $s0, $zero, $zero
.L8003EFB8:
/* 3FBB8 8003EFB8 0C020F55 */  jal        capWeaponBaseMax
/* 3FBBC 8003EFBC 320500FF */   andi      $a1, $s0, 0xff
/* 3FBC0 8003EFC0 5840000C */  blezl      $v0, .L8003EFF4
/* 3FBC4 8003EFC4 26100001 */   addiu     $s0, $s0, 1
/* 3FBC8 8003EFC8 0C026259 */  jal        passToMalloc
/* 3FBCC 8003EFCC 24040094 */   addiu     $a0, $zero, 0x94
/* 3FBD0 8003EFD0 00402021 */  addu       $a0, $v0, $zero
/* 3FBD4 8003EFD4 02602821 */  addu       $a1, $s3, $zero
/* 3FBD8 8003EFD8 3206FFFF */  andi       $a2, $s0, 0xffff
/* 3FBDC 8003EFDC 0C00F990 */  jal        sheild_info
/* 3FBE0 8003EFE0 24070001 */   addiu     $a3, $zero, 1
/* 3FBE4 8003EFE4 8E840080 */  lw         $a0, 0x80($s4)
/* 3FBE8 8003EFE8 0C00C040 */  jal        func_80030100
/* 3FBEC 8003EFEC 00402821 */   addu      $a1, $v0, $zero
/* 3FBF0 8003EFF0 26100001 */  addiu      $s0, $s0, 1
.L8003EFF4:
/* 3FBF4 8003EFF4 2A02000B */  slti       $v0, $s0, 0xb
/* 3FBF8 8003EFF8 1440FFEF */  bnez       $v0, .L8003EFB8
/* 3FBFC 8003EFFC 02602021 */   addu      $a0, $s3, $zero
/* 3FC00 8003F000 0C020F5F */  jal        CapBaseSheild
/* 3FC04 8003F004 02602021 */   addu      $a0, $s3, $zero
/* 3FC08 8003F008 5840000F */  blezl      $v0, .L8003F048
/* 3FC0C 8003F00C 96420020 */   lhu       $v0, 0x20($s2)
/* 3FC10 8003F010 0C026259 */  jal        passToMalloc
/* 3FC14 8003F014 24040094 */   addiu     $a0, $zero, 0x94
/* 3FC18 8003F018 02602021 */  addu       $a0, $s3, $zero
/* 3FC1C 8003F01C 0C020F5F */  jal        CapBaseSheild
/* 3FC20 8003F020 00408021 */   addu      $s0, $v0, $zero
/* 3FC24 8003F024 02002021 */  addu       $a0, $s0, $zero
/* 3FC28 8003F028 02602821 */  addu       $a1, $s3, $zero
/* 3FC2C 8003F02C 3046FFFF */  andi       $a2, $v0, 0xffff
/* 3FC30 8003F030 0C00F990 */  jal        sheild_info
/* 3FC34 8003F034 24070002 */   addiu     $a3, $zero, 2
/* 3FC38 8003F038 8E840080 */  lw         $a0, 0x80($s4)
/* 3FC3C 8003F03C 0C00C040 */  jal        func_80030100
/* 3FC40 8003F040 00402821 */   addu      $a1, $v0, $zero
/* 3FC44 8003F044 96420020 */  lhu        $v0, 0x20($s2)
.L8003F048:
/* 3FC48 8003F048 10400011 */  beqz       $v0, .L8003F090
/* 3FC4C 8003F04C 8FBF0040 */   lw        $ra, 0x40($sp)
/* 3FC50 8003F050 12A00007 */  beqz       $s5, .L8003F070
/* 3FC54 8003F054 2442FFFF */   addiu     $v0, $v0, -1
/* 3FC58 8003F058 0055102A */  slt        $v0, $v0, $s5
/* 3FC5C 8003F05C 50400004 */  beql       $v0, $zero, .L8003F070
/* 3FC60 8003F060 A655001E */   sh        $s5, 0x1e($s2)
/* 3FC64 8003F064 A640001E */  sh         $zero, 0x1e($s2)
/* 3FC68 8003F068 A6400012 */  sh         $zero, 0x12($s2)
/* 3FC6C 8003F06C A6400016 */  sh         $zero, 0x16($s2)
.L8003F070:
/* 3FC70 8003F070 8E830078 */  lw         $v1, 0x78($s4)
/* 3FC74 8003F074 84640028 */  lh         $a0, 0x28($v1)
/* 3FC78 8003F078 8C62002C */  lw         $v0, 0x2c($v1)
/* 3FC7C 8003F07C 0040F809 */  jalr       $v0
/* 3FC80 8003F080 02842021 */   addu      $a0, $s4, $a0
/* 3FC84 8003F084 0C00BFCC */  jal        func_8002FF30
/* 3FC88 8003F088 8E840080 */   lw        $a0, 0x80($s4)
.L8003F08C:
/* 3FC8C 8003F08C 8FBF0040 */  lw         $ra, 0x40($sp)
.L8003F090:
/* 3FC90 8003F090 8FB5003C */  lw         $s5, 0x3c($sp)
/* 3FC94 8003F094 8FB40038 */  lw         $s4, 0x38($sp)
/* 3FC98 8003F098 8FB30034 */  lw         $s3, 0x34($sp)
/* 3FC9C 8003F09C 8FB20030 */  lw         $s2, 0x30($sp)
/* 3FCA0 8003F0A0 8FB1002C */  lw         $s1, 0x2c($sp)
/* 3FCA4 8003F0A4 8FB00028 */  lw         $s0, 0x28($sp)
/* 3FCA8 8003F0A8 03E00008 */  jr         $ra
/* 3FCAC 8003F0AC 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_8003F0B0
/* 3FCB0 8003F0B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3FCB4 8003F0B4 3C02800E */  lui        $v0, %hi(D_800DC670)
/* 3FCB8 8003F0B8 2442C670 */  addiu      $v0, $v0, %lo(D_800DC670)
/* 3FCBC 8003F0BC AFBF0010 */  sw         $ra, 0x10($sp)
/* 3FCC0 8003F0C0 0C02E66C */  jal        widget_menu_free
/* 3FCC4 8003F0C4 AC820078 */   sw        $v0, 0x78($a0)
/* 3FCC8 8003F0C8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3FCCC 8003F0CC 03E00008 */  jr         $ra
/* 3FCD0 8003F0D0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret0_8003f0d4
/* 3FCD4 8003F0D4 03E00008 */  jr         $ra
/* 3FCD8 8003F0D8 00001021 */   addu      $v0, $zero, $zero

glabel func_8003F0DC
/* 3FCDC 8003F0DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3FCE0 8003F0E0 00063400 */  sll        $a2, $a2, 0x10
/* 3FCE4 8003F0E4 00073C00 */  sll        $a3, $a3, 0x10
/* 3FCE8 8003F0E8 00063403 */  sra        $a2, $a2, 0x10
/* 3FCEC 8003F0EC 87A20032 */  lh         $v0, 0x32($sp)
/* 3FCF0 8003F0F0 87A30036 */  lh         $v1, 0x36($sp)
/* 3FCF4 8003F0F4 00073C03 */  sra        $a3, $a3, 0x10
/* 3FCF8 8003F0F8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3FCFC 8003F0FC AFA20010 */  sw         $v0, 0x10($sp)
/* 3FD00 8003F100 0C02DE14 */  jal        widget_func_8
/* 3FD04 8003F104 AFA30014 */   sw        $v1, 0x14($sp)
/* 3FD08 8003F108 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3FD0C 8003F10C 03E00008 */  jr         $ra
/* 3FD10 8003F110 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003F114
/* 3FD14 8003F114 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3FD18 8003F118 AFB00010 */  sw         $s0, 0x10($sp)
/* 3FD1C 8003F11C AFBF0014 */  sw         $ra, 0x14($sp)
/* 3FD20 8003F120 0C00DFB2 */  jal        func_80037EC8
/* 3FD24 8003F124 00808021 */   addu      $s0, $a0, $zero
/* 3FD28 8003F128 0C02DE51 */  jal        func_800B7944
/* 3FD2C 8003F12C 02002021 */   addu      $a0, $s0, $zero
/* 3FD30 8003F130 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3FD34 8003F134 8FB00010 */  lw         $s0, 0x10($sp)
/* 3FD38 8003F138 03E00008 */  jr         $ra
/* 3FD3C 8003F13C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003F140
/* 3FD40 8003F140 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3FD44 8003F144 00802821 */  addu       $a1, $a0, $zero
/* 3FD48 8003F148 3C02800E */  lui        $v0, %hi(someCase_1)
/* 3FD4C 8003F14C 90447D6C */  lbu        $a0, %lo(someCase_1)($v0)
/* 3FD50 8003F150 24030007 */  addiu      $v1, $zero, 7
/* 3FD54 8003F154 10830009 */  beq        $a0, $v1, .L8003F17C
/* 3FD58 8003F158 AFBF0010 */   sw        $ra, 0x10($sp)
/* 3FD5C 8003F15C 8CA50080 */  lw         $a1, 0x80($a1)
/* 3FD60 8003F160 8CA30078 */  lw         $v1, 0x78($a1)
/* 3FD64 8003F164 84640078 */  lh         $a0, 0x78($v1)
/* 3FD68 8003F168 8C62007C */  lw         $v0, 0x7c($v1)
/* 3FD6C 8003F16C 0040F809 */  jalr       $v0
/* 3FD70 8003F170 00A42021 */   addu      $a0, $a1, $a0
/* 3FD74 8003F174 0800FC6F */  j          .L8003F1BC
/* 3FD78 8003F178 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003F17C:
/* 3FD7C 8003F17C 8CA50080 */  lw         $a1, 0x80($a1)
/* 3FD80 8003F180 8CA30078 */  lw         $v1, 0x78($a1)
/* 3FD84 8003F184 84640078 */  lh         $a0, 0x78($v1)
/* 3FD88 8003F188 8C62007C */  lw         $v0, 0x7c($v1)
/* 3FD8C 8003F18C 0040F809 */  jalr       $v0
/* 3FD90 8003F190 00A42021 */   addu      $a0, $a1, $a0
/* 3FD94 8003F194 00402821 */  addu       $a1, $v0, $zero
/* 3FD98 8003F198 10A00007 */  beqz       $a1, .L8003F1B8
/* 3FD9C 8003F19C 00001021 */   addu      $v0, $zero, $zero
/* 3FDA0 8003F1A0 8CA30078 */  lw         $v1, 0x78($a1)
/* 3FDA4 8003F1A4 84640078 */  lh         $a0, 0x78($v1)
/* 3FDA8 8003F1A8 8C62007C */  lw         $v0, 0x7c($v1)
/* 3FDAC 8003F1AC 0040F809 */  jalr       $v0
/* 3FDB0 8003F1B0 00A42021 */   addu      $a0, $a1, $a0
/* 3FDB4 8003F1B4 00001021 */  addu       $v0, $zero, $zero
.L8003F1B8:
/* 3FDB8 8003F1B8 8FBF0010 */  lw         $ra, 0x10($sp)
.L8003F1BC:
/* 3FDBC 8003F1BC 03E00008 */  jr         $ra
/* 3FDC0 8003F1C0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003F1C4
/* 3FDC4 8003F1C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3FDC8 8003F1C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 3FDCC 8003F1CC 00808821 */  addu       $s1, $a0, $zero
/* 3FDD0 8003F1D0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3FDD4 8003F1D4 AFB20018 */  sw         $s2, 0x18($sp)
/* 3FDD8 8003F1D8 AFB00010 */  sw         $s0, 0x10($sp)
/* 3FDDC 8003F1DC 8E250080 */  lw         $a1, 0x80($s1)
/* 3FDE0 8003F1E0 8CA30078 */  lw         $v1, 0x78($a1)
/* 3FDE4 8003F1E4 84640078 */  lh         $a0, 0x78($v1)
/* 3FDE8 8003F1E8 8C62007C */  lw         $v0, 0x7c($v1)
/* 3FDEC 8003F1EC 0040F809 */  jalr       $v0
/* 3FDF0 8003F1F0 00A42021 */   addu      $a0, $a1, $a0
/* 3FDF4 8003F1F4 00409021 */  addu       $s2, $v0, $zero
/* 3FDF8 8003F1F8 12400011 */  beqz       $s2, .L8003F240
/* 3FDFC 8003F1FC 3C10800E */   lui       $s0, %hi(gGlobals)
/* 3FE00 8003F200 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 3FE04 8003F204 92220088 */  lbu        $v0, 0x88($s1)
/* 3FE08 8003F208 8E0315F8 */  lw         $v1, 0x15f8($s0)
/* 3FE0C 8003F20C 00021080 */  sll        $v0, $v0, 2
/* 3FE10 8003F210 00621821 */  addu       $v1, $v1, $v0
/* 3FE14 8003F214 8C650000 */  lw         $a1, ($v1)
/* 3FE18 8003F218 24040080 */  addiu      $a0, $zero, 0x80
/* 3FE1C 8003F21C 0C026259 */  jal        passToMalloc
/* 3FE20 8003F220 8CB1001C */   lw        $s1, 0x1c($a1)
/* 3FE24 8003F224 00402021 */  addu       $a0, $v0, $zero
/* 3FE28 8003F228 9646005E */  lhu        $a2, 0x5e($s2)
/* 3FE2C 8003F22C 0C00EAF9 */  jal        itemdetail
/* 3FE30 8003F230 02202821 */   addu      $a1, $s1, $zero
/* 3FE34 8003F234 8E041604 */  lw         $a0, 0x1604($s0)
/* 3FE38 8003F238 0C02DC7C */  jal        widgetHandler
/* 3FE3C 8003F23C 00402821 */   addu      $a1, $v0, $zero
.L8003F240:
/* 3FE40 8003F240 00001021 */  addu       $v0, $zero, $zero
/* 3FE44 8003F244 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3FE48 8003F248 8FB20018 */  lw         $s2, 0x18($sp)
/* 3FE4C 8003F24C 8FB10014 */  lw         $s1, 0x14($sp)
/* 3FE50 8003F250 8FB00010 */  lw         $s0, 0x10($sp)
/* 3FE54 8003F254 03E00008 */  jr         $ra
/* 3FE58 8003F258 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003F25C
/* 3FE5C 8003F25C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3FE60 8003F260 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 3FE64 8003F264 3C06800E */  lui        $a2, %hi(partyPointer)
/* 3FE68 8003F268 8CC37EA0 */  lw         $v1, %lo(partyPointer)($a2)
/* 3FE6C 8003F26C 00053202 */  srl        $a2, $a1, 8
/* 3FE70 8003F270 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3FE74 8003F274 90820088 */  lbu        $v0, 0x88($a0)
/* 3FE78 8003F278 30A500FF */  andi       $a1, $a1, 0xff
/* 3FE7C 8003F27C 00021080 */  sll        $v0, $v0, 2
/* 3FE80 8003F280 00621821 */  addu       $v1, $v1, $v0
/* 3FE84 8003F284 8C620000 */  lw         $v0, ($v1)
/* 3FE88 8003F288 24040001 */  addiu      $a0, $zero, 1
/* 3FE8C 8003F28C 10C40010 */  beq        $a2, $a0, .L8003F2D0
/* 3FE90 8003F290 8C43001C */   lw        $v1, 0x1c($v0)
/* 3FE94 8003F294 28C20002 */  slti       $v0, $a2, 2
/* 3FE98 8003F298 10400005 */  beqz       $v0, .L8003F2B0
/* 3FE9C 8003F29C 24020002 */   addiu     $v0, $zero, 2
/* 3FEA0 8003F2A0 10C00007 */  beqz       $a2, .L8003F2C0
/* 3FEA4 8003F2A4 00001021 */   addu      $v0, $zero, $zero
/* 3FEA8 8003F2A8 0800FCBB */  j          .L8003F2EC
/* 3FEAC 8003F2AC 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003F2B0:
/* 3FEB0 8003F2B0 10C2000B */  beq        $a2, $v0, .L8003F2E0
/* 3FEB4 8003F2B4 00001021 */   addu      $v0, $zero, $zero
/* 3FEB8 8003F2B8 0800FCBB */  j          .L8003F2EC
/* 3FEBC 8003F2BC 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003F2C0:
/* 3FEC0 8003F2C0 0C020E82 */  jal        get_skill_gold_train_price
/* 3FEC4 8003F2C4 00602021 */   addu      $a0, $v1, $zero
/* 3FEC8 8003F2C8 0800FCBB */  j          .L8003F2EC
/* 3FECC 8003F2CC 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003F2D0:
/* 3FED0 8003F2D0 0C020E8B */  jal        get_selected_weaponskill_price
/* 3FED4 8003F2D4 00602021 */   addu      $a0, $v1, $zero
/* 3FED8 8003F2D8 0800FCBB */  j          .L8003F2EC
/* 3FEDC 8003F2DC 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003F2E0:
/* 3FEE0 8003F2E0 0C020E94 */  jal        get_sheild_gold_train_price
/* 3FEE4 8003F2E4 00602021 */   addu      $a0, $v1, $zero
/* 3FEE8 8003F2E8 8FBF0010 */  lw         $ra, 0x10($sp)
.L8003F2EC:
/* 3FEEC 8003F2EC 03E00008 */  jr         $ra
/* 3FEF0 8003F2F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003F2F4
/* 3FEF4 8003F2F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3FEF8 8003F2F8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 3FEFC 8003F2FC 3C06800E */  lui        $a2, %hi(gGlobals)
/* 3FF00 8003F300 24C668A8 */  addiu      $a2, $a2, %lo(gGlobals)
/* 3FF04 8003F304 00053A02 */  srl        $a3, $a1, 8
/* 3FF08 8003F308 AFB10014 */  sw         $s1, 0x14($sp)
/* 3FF0C 8003F30C 30B100FF */  andi       $s1, $a1, 0xff
/* 3FF10 8003F310 F7B40020 */  sdc1       $f20, 0x20($sp)
/* 3FF14 8003F314 3C01800E */  lui        $at, %hi(D_800DC620)
/* 3FF18 8003F318 C434C620 */  lwc1       $f20, %lo(D_800DC620)($at)
/* 3FF1C 8003F31C 24050005 */  addiu      $a1, $zero, 5
/* 3FF20 8003F320 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3FF24 8003F324 AFB00010 */  sw         $s0, 0x10($sp)
/* 3FF28 8003F328 90820088 */  lbu        $v0, 0x88($a0)
/* 3FF2C 8003F32C 8CC315F8 */  lw         $v1, 0x15f8($a2)
/* 3FF30 8003F330 00021080 */  sll        $v0, $v0, 2
/* 3FF34 8003F334 00621821 */  addu       $v1, $v1, $v0
/* 3FF38 8003F338 8C620000 */  lw         $v0, ($v1)
/* 3FF3C 8003F33C 90C414C4 */  lbu        $a0, 0x14c4($a2)
/* 3FF40 8003F340 14850003 */  bne        $a0, $a1, .L8003F350
/* 3FF44 8003F344 8C50001C */   lw        $s0, 0x1c($v0)
/* 3FF48 8003F348 3C01800E */  lui        $at, %hi(D_800DC624)
/* 3FF4C 8003F34C C434C624 */  lwc1       $f20, %lo(D_800DC624)($at)
.L8003F350:
/* 3FF50 8003F350 24020001 */  addiu      $v0, $zero, 1
/* 3FF54 8003F354 10E20024 */  beq        $a3, $v0, .L8003F3E8
/* 3FF58 8003F358 28E20002 */   slti      $v0, $a3, 2
/* 3FF5C 8003F35C 10400005 */  beqz       $v0, .L8003F374
/* 3FF60 8003F360 24020002 */   addiu     $v0, $zero, 2
/* 3FF64 8003F364 10E00007 */  beqz       $a3, .L8003F384
/* 3FF68 8003F368 00001021 */   addu      $v0, $zero, $zero
/* 3FF6C 8003F36C 0800FD23 */  j          .L8003F48C
/* 3FF70 8003F370 8FBF0018 */   lw        $ra, 0x18($sp)
.L8003F374:
/* 3FF74 8003F374 10E20026 */  beq        $a3, $v0, .L8003F410
/* 3FF78 8003F378 00001021 */   addu      $v0, $zero, $zero
/* 3FF7C 8003F37C 0800FD23 */  j          .L8003F48C
/* 3FF80 8003F380 8FBF0018 */   lw        $ra, 0x18($sp)
.L8003F384:
/* 3FF84 8003F384 02002021 */  addu       $a0, $s0, $zero
/* 3FF88 8003F388 0C020F83 */  jal        isSkilOverLv10
/* 3FF8C 8003F38C 02202821 */   addu      $a1, $s1, $zero
/* 3FF90 8003F390 1440003D */  bnez       $v0, .L8003F488
/* 3FF94 8003F394 2402FFFF */   addiu     $v0, $zero, -1
/* 3FF98 8003F398 02002021 */  addu       $a0, $s0, $zero
/* 3FF9C 8003F39C 0C020E0E */  jal        get_skill_xp_multi
/* 3FFA0 8003F3A0 02202821 */   addu      $a1, $s1, $zero
.L8003F3A4:
/* 3FFA4 8003F3A4 44821000 */  mtc1       $v0, $f2
/* 3FFA8 8003F3A8 468010A1 */  cvt.d.w    $f2, $f2
/* 3FFAC 8003F3AC 04430005 */  bgezl      $v0, .L8003F3C4
/* 3FFB0 8003F3B0 46201020 */   cvt.s.d   $f0, $f2
/* 3FFB4 8003F3B4 3C01800E */  lui        $at, %hi(D_800DC628)
/* 3FFB8 8003F3B8 D420C628 */  ldc1       $f0, %lo(D_800DC628)($at)
/* 3FFBC 8003F3BC 46201080 */  add.d      $f2, $f2, $f0
/* 3FFC0 8003F3C0 46201020 */  cvt.s.d    $f0, $f2
.L8003F3C4:
/* 3FFC4 8003F3C4 46140002 */  mul.s      $f0, $f0, $f20
/* 3FFC8 8003F3C8 3C01800E */  lui        $at, %hi(D_800DC630)
/* 3FFCC 8003F3CC C422C630 */  lwc1       $f2, %lo(D_800DC630)($at)
/* 3FFD0 8003F3D0 4600103E */  c.le.s     $f2, $f0
/* 3FFD4 8003F3D4 00000000 */  nop
/* 3FFD8 8003F3D8 45000022 */  bc1f       .L8003F464
/* 3FFDC 8003F3DC 00000000 */   nop
/* 3FFE0 8003F3E0 0800FD1D */  j          .L8003F474
/* 3FFE4 8003F3E4 46020001 */   sub.s     $f0, $f0, $f2
.L8003F3E8:
/* 3FFE8 8003F3E8 02002021 */  addu       $a0, $s0, $zero
/* 3FFEC 8003F3EC 0C020F89 */  jal        isWepSkillOverLV10
/* 3FFF0 8003F3F0 02202821 */   addu      $a1, $s1, $zero
/* 3FFF4 8003F3F4 14400024 */  bnez       $v0, .L8003F488
/* 3FFF8 8003F3F8 2402FFFF */   addiu     $v0, $zero, -1
/* 3FFFC 8003F3FC 02002021 */  addu       $a0, $s0, $zero
/* 40000 8003F400 0C020E3C */  jal        Weapon_XP_check
/* 40004 8003F404 02202821 */   addu      $a1, $s1, $zero
/* 40008 8003F408 0800FCE9 */  j          .L8003F3A4
/* 4000C 8003F40C 00000000 */   nop
.L8003F410:
/* 40010 8003F410 0C020F8F */  jal        isSheildSkillOver10
/* 40014 8003F414 02002021 */   addu      $a0, $s0, $zero
/* 40018 8003F418 1440001B */  bnez       $v0, .L8003F488
/* 4001C 8003F41C 2402FFFF */   addiu     $v0, $zero, -1
/* 40020 8003F420 0C020E70 */  jal        func_800839C0
/* 40024 8003F424 02002021 */   addu      $a0, $s0, $zero
/* 40028 8003F428 44821000 */  mtc1       $v0, $f2
/* 4002C 8003F42C 468010A1 */  cvt.d.w    $f2, $f2
/* 40030 8003F430 04430005 */  bgezl      $v0, .L8003F448
/* 40034 8003F434 46201020 */   cvt.s.d   $f0, $f2
/* 40038 8003F438 3C01800E */  lui        $at, %hi(D_800DC638)
/* 4003C 8003F43C D420C638 */  ldc1       $f0, %lo(D_800DC638)($at)
/* 40040 8003F440 46201080 */  add.d      $f2, $f2, $f0
/* 40044 8003F444 46201020 */  cvt.s.d    $f0, $f2
.L8003F448:
/* 40048 8003F448 46140002 */  mul.s      $f0, $f0, $f20
/* 4004C 8003F44C 3C01800E */  lui        $at, %hi(D_800DC640)
/* 40050 8003F450 C422C640 */  lwc1       $f2, %lo(D_800DC640)($at)
/* 40054 8003F454 4600103E */  c.le.s     $f2, $f0
/* 40058 8003F458 00000000 */  nop
/* 4005C 8003F45C 45030005 */  bc1tl      .L8003F474
/* 40060 8003F460 46020001 */   sub.s     $f0, $f0, $f2
.L8003F464:
/* 40064 8003F464 4600008D */  trunc.w.s  $f2, $f0
/* 40068 8003F468 44031000 */  mfc1       $v1, $f2
/* 4006C 8003F46C 0800FD22 */  j          .L8003F488
/* 40070 8003F470 00601021 */   addu      $v0, $v1, $zero
.L8003F474:
/* 40074 8003F474 4600008D */  trunc.w.s  $f2, $f0
/* 40078 8003F478 44031000 */  mfc1       $v1, $f2
/* 4007C 8003F47C 3C028000 */  lui        $v0, 0x8000
/* 40080 8003F480 00621825 */  or         $v1, $v1, $v0
/* 40084 8003F484 00601021 */  addu       $v0, $v1, $zero
.L8003F488:
/* 40088 8003F488 8FBF0018 */  lw         $ra, 0x18($sp)
.L8003F48C:
/* 4008C 8003F48C 8FB10014 */  lw         $s1, 0x14($sp)
/* 40090 8003F490 8FB00010 */  lw         $s0, 0x10($sp)
/* 40094 8003F494 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 40098 8003F498 03E00008 */  jr         $ra
/* 4009C 8003F49C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8003F4A0
/* 400A0 8003F4A0 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 400A4 8003F4A4 8C437D74 */  lw         $v1, %lo(bigAssMenu)($v0)
/* 400A8 8003F4A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 400AC 8003F4AC AFBF0010 */  sw         $ra, 0x10($sp)
/* 400B0 8003F4B0 8C640040 */  lw         $a0, 0x40($v1)
/* 400B4 8003F4B4 8C860004 */  lw         $a2, 4($a0)
/* 400B8 8003F4B8 8CC30088 */  lw         $v1, 0x88($a2)
/* 400BC 8003F4BC 90620090 */  lbu        $v0, 0x90($v1)
/* 400C0 8003F4C0 00021080 */  sll        $v0, $v0, 2
/* 400C4 8003F4C4 00621821 */  addu       $v1, $v1, $v0
/* 400C8 8003F4C8 8C68007C */  lw         $t0, 0x7c($v1)
/* 400CC 8003F4CC 00A01821 */  addu       $v1, $a1, $zero
/* 400D0 8003F4D0 9465005E */  lhu        $a1, 0x5e($v1)
/* 400D4 8003F4D4 8D020078 */  lw         $v0, 0x78($t0)
/* 400D8 8003F4D8 9066005C */  lbu        $a2, 0x5c($v1)
/* 400DC 8003F4DC 844400E0 */  lh         $a0, 0xe0($v0)
/* 400E0 8003F4E0 8C4700E4 */  lw         $a3, 0xe4($v0)
/* 400E4 8003F4E4 00E0F809 */  jalr       $a3
/* 400E8 8003F4E8 01042021 */   addu      $a0, $t0, $a0
/* 400EC 8003F4EC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 400F0 8003F4F0 00001021 */  addu       $v0, $zero, $zero
/* 400F4 8003F4F4 03E00008 */  jr         $ra
/* 400F8 8003F4F8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_training_func
/* 400FC 8003F4FC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 40100 8003F500 AFBE0030 */  sw         $fp, 0x30($sp)
/* 40104 8003F504 0080F021 */  addu       $fp, $a0, $zero
/* 40108 8003F508 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 4010C 8003F50C 3C06800E */  lui        $a2, %hi(gGlobals)
/* 40110 8003F510 24C468A8 */  addiu      $a0, $a2, %lo(gGlobals)
/* 40114 8003F514 00053A02 */  srl        $a3, $a1, 8
/* 40118 8003F518 AFB40020 */  sw         $s4, 0x20($sp)
/* 4011C 8003F51C 30B400FF */  andi       $s4, $a1, 0xff
/* 40120 8003F520 AFB60028 */  sw         $s6, 0x28($sp)
/* 40124 8003F524 00C0B021 */  addu       $s6, $a2, $zero
/* 40128 8003F528 AFBF0034 */  sw         $ra, 0x34($sp)
/* 4012C 8003F52C AFB7002C */  sw         $s7, 0x2c($sp)
/* 40130 8003F530 AFB50024 */  sw         $s5, 0x24($sp)
/* 40134 8003F534 AFB3001C */  sw         $s3, 0x1c($sp)
/* 40138 8003F538 AFB20018 */  sw         $s2, 0x18($sp)
/* 4013C 8003F53C AFB10014 */  sw         $s1, 0x14($sp)
/* 40140 8003F540 AFB00010 */  sw         $s0, 0x10($sp)
/* 40144 8003F544 93C20088 */  lbu        $v0, 0x88($fp)
/* 40148 8003F548 8C8315F8 */  lw         $v1, 0x15f8($a0)
/* 4014C 8003F54C 00021080 */  sll        $v0, $v0, 2
/* 40150 8003F550 00621821 */  addu       $v1, $v1, $v0
/* 40154 8003F554 908214C4 */  lbu        $v0, 0x14c4($a0)
/* 40158 8003F558 24040001 */  addiu      $a0, $zero, 1
/* 4015C 8003F55C 8C750000 */  lw         $s5, ($v1)
/* 40160 8003F560 38420005 */  xori       $v0, $v0, 5
/* 40164 8003F564 2C570001 */  sltiu      $s7, $v0, 1
/* 40168 8003F568 10E4005F */  beq        $a3, $a0, .L8003F6E8
/* 4016C 8003F56C 8EB1001C */   lw        $s1, 0x1c($s5)
/* 40170 8003F570 28E20002 */  slti       $v0, $a3, 2
/* 40174 8003F574 10400005 */  beqz       $v0, .L8003F58C
/* 40178 8003F578 24020002 */   addiu     $v0, $zero, 2
/* 4017C 8003F57C 10E00007 */  beqz       $a3, .L8003F59C
/* 40180 8003F580 3C04800F */   lui       $a0, 0x800f
/* 40184 8003F584 0800FDDE */  j          .L8003F778
/* 40188 8003F588 8EA50014 */   lw        $a1, 0x14($s5)
.L8003F58C:
/* 4018C 8003F58C 10E20069 */  beq        $a3, $v0, .L8003F734
/* 40190 8003F590 3C04800F */   lui       $a0, 0x800f
/* 40194 8003F594 0800FDDE */  j          .L8003F778
/* 40198 8003F598 8EA50014 */   lw        $a1, 0x14($s5)
.L8003F59C:
/* 4019C 8003F59C 02202021 */  addu       $a0, $s1, $zero
/* 401A0 8003F5A0 329000FF */  andi       $s0, $s4, 0xff
/* 401A4 8003F5A4 0C020F83 */  jal        isSkilOverLv10
/* 401A8 8003F5A8 02002821 */   addu      $a1, $s0, $zero
/* 401AC 8003F5AC 144000A1 */  bnez       $v0, .L8003F834
/* 401B0 8003F5B0 02009821 */   addu      $s3, $s0, $zero
/* 401B4 8003F5B4 02202021 */  addu       $a0, $s1, $zero
/* 401B8 8003F5B8 0C020F4B */  jal        capskillBaseMax
/* 401BC 8003F5BC 02602821 */   addu      $a1, $s3, $zero
/* 401C0 8003F5C0 00409021 */  addu       $s2, $v0, $zero
/* 401C4 8003F5C4 02202021 */  addu       $a0, $s1, $zero
/* 401C8 8003F5C8 02602821 */  addu       $a1, $s3, $zero
/* 401CC 8003F5CC 0C020EE7 */  jal        wonky_baseskill_check
/* 401D0 8003F5D0 24060001 */   addiu     $a2, $zero, 1
/* 401D4 8003F5D4 02202021 */  addu       $a0, $s1, $zero
/* 401D8 8003F5D8 0C020F4B */  jal        capskillBaseMax
/* 401DC 8003F5DC 02602821 */   addu      $a1, $s3, $zero
/* 401E0 8003F5E0 00021400 */  sll        $v0, $v0, 0x10
/* 401E4 8003F5E4 00021403 */  sra        $v0, $v0, 0x10
/* 401E8 8003F5E8 10520093 */  beq        $v0, $s2, .L8003F838
/* 401EC 8003F5EC 8FBF0034 */   lw        $ra, 0x34($sp)
/* 401F0 8003F5F0 16400060 */  bnez       $s2, .L8003F774
/* 401F4 8003F5F4 3C04800F */   lui       $a0, 0x800f
/* 401F8 8003F5F8 8EA20024 */  lw         $v0, 0x24($s5)
/* 401FC 8003F5FC 1040000C */  beqz       $v0, .L8003F630
/* 40200 8003F600 00008021 */   addu      $s0, $zero, $zero
/* 40204 8003F604 8C430018 */  lw         $v1, 0x18($v0)
/* 40208 8003F608 5060000A */  beql       $v1, $zero, .L8003F634
/* 4020C 8003F60C 8EA30020 */   lw        $v1, 0x20($s5)
/* 40210 8003F610 90620000 */  lbu        $v0, ($v1)
/* 40214 8003F614 54540007 */  bnel       $v0, $s4, .L8003F634
/* 40218 8003F618 8EA30020 */   lw        $v1, 0x20($s5)
/* 4021C 8003F61C 02202021 */  addu       $a0, $s1, $zero
/* 40220 8003F620 80660001 */  lb         $a2, 1($v1)
/* 40224 8003F624 0C020F0B */  jal        some_moddedSkillCheck
/* 40228 8003F628 02602821 */   addu      $a1, $s3, $zero
/* 4022C 8003F62C 00008021 */  addu       $s0, $zero, $zero
.L8003F630:
/* 40230 8003F630 8EA30020 */  lw         $v1, 0x20($s5)
.L8003F634:
/* 40234 8003F634 00101080 */  sll        $v0, $s0, 2
/* 40238 8003F638 00431021 */  addu       $v0, $v0, $v1
/* 4023C 8003F63C 8C420000 */  lw         $v0, ($v0)
/* 40240 8003F640 5040000C */  beql       $v0, $zero, .L8003F674
/* 40244 8003F644 26020001 */   addiu     $v0, $s0, 1
/* 40248 8003F648 8C430018 */  lw         $v1, 0x18($v0)
/* 4024C 8003F64C 10600009 */  beqz       $v1, .L8003F674
/* 40250 8003F650 26020001 */   addiu     $v0, $s0, 1
/* 40254 8003F654 90620000 */  lbu        $v0, ($v1)
/* 40258 8003F658 14540006 */  bne        $v0, $s4, .L8003F674
/* 4025C 8003F65C 26020001 */   addiu     $v0, $s0, 1
/* 40260 8003F660 02202021 */  addu       $a0, $s1, $zero
/* 40264 8003F664 80660001 */  lb         $a2, 1($v1)
/* 40268 8003F668 0C020F0B */  jal        some_moddedSkillCheck
/* 4026C 8003F66C 02602821 */   addu      $a1, $s3, $zero
/* 40270 8003F670 26020001 */  addiu      $v0, $s0, 1
.L8003F674:
/* 40274 8003F674 305000FF */  andi       $s0, $v0, 0xff
/* 40278 8003F678 2E030002 */  sltiu      $v1, $s0, 2
/* 4027C 8003F67C 5460FFED */  bnel       $v1, $zero, .L8003F634
/* 40280 8003F680 8EA30020 */   lw        $v1, 0x20($s5)
/* 40284 8003F684 00008021 */  addu       $s0, $zero, $zero
/* 40288 8003F688 8EA20028 */  lw         $v0, 0x28($s5)
.L8003F68C:
/* 4028C 8003F68C 8C440000 */  lw         $a0, ($v0)
/* 40290 8003F690 00101880 */  sll        $v1, $s0, 2
/* 40294 8003F694 00641821 */  addu       $v1, $v1, $a0
/* 40298 8003F698 8C630000 */  lw         $v1, ($v1)
/* 4029C 8003F69C 1060000C */  beqz       $v1, .L8003F6D0
/* 402A0 8003F6A0 26020001 */   addiu     $v0, $s0, 1
/* 402A4 8003F6A4 8C630018 */  lw         $v1, 0x18($v1)
/* 402A8 8003F6A8 5060000A */  beql       $v1, $zero, .L8003F6D4
/* 402AC 8003F6AC 305000FF */   andi      $s0, $v0, 0xff
/* 402B0 8003F6B0 90620000 */  lbu        $v0, ($v1)
/* 402B4 8003F6B4 14540006 */  bne        $v0, $s4, .L8003F6D0
/* 402B8 8003F6B8 26020001 */   addiu     $v0, $s0, 1
/* 402BC 8003F6BC 02202021 */  addu       $a0, $s1, $zero
/* 402C0 8003F6C0 80660001 */  lb         $a2, 1($v1)
/* 402C4 8003F6C4 0C020F0B */  jal        some_moddedSkillCheck
/* 402C8 8003F6C8 02602821 */   addu      $a1, $s3, $zero
/* 402CC 8003F6CC 26020001 */  addiu      $v0, $s0, 1
.L8003F6D0:
/* 402D0 8003F6D0 305000FF */  andi       $s0, $v0, 0xff
.L8003F6D4:
/* 402D4 8003F6D4 2E03000C */  sltiu      $v1, $s0, 0xc
/* 402D8 8003F6D8 5460FFEC */  bnel       $v1, $zero, .L8003F68C
/* 402DC 8003F6DC 8EA20028 */   lw        $v0, 0x28($s5)
/* 402E0 8003F6E0 0800FDDD */  j          .L8003F774
/* 402E4 8003F6E4 3C04800F */   lui       $a0, 0x800f
.L8003F6E8:
/* 402E8 8003F6E8 02202021 */  addu       $a0, $s1, $zero
/* 402EC 8003F6EC 329000FF */  andi       $s0, $s4, 0xff
/* 402F0 8003F6F0 0C020F89 */  jal        isWepSkillOverLV10
/* 402F4 8003F6F4 02002821 */   addu      $a1, $s0, $zero
/* 402F8 8003F6F8 1440004F */  bnez       $v0, .L8003F838
/* 402FC 8003F6FC 8FBF0034 */   lw        $ra, 0x34($sp)
/* 40300 8003F700 02202021 */  addu       $a0, $s1, $zero
/* 40304 8003F704 0C020F55 */  jal        capWeaponBaseMax
/* 40308 8003F708 02002821 */   addu      $a1, $s0, $zero
/* 4030C 8003F70C 00409021 */  addu       $s2, $v0, $zero
/* 40310 8003F710 02202021 */  addu       $a0, $s1, $zero
/* 40314 8003F714 02002821 */  addu       $a1, $s0, $zero
/* 40318 8003F718 0C020EF2 */  jal        wonky_weapon_check
/* 4031C 8003F71C 24060001 */   addiu     $a2, $zero, 1
/* 40320 8003F720 02202021 */  addu       $a0, $s1, $zero
/* 40324 8003F724 0C020F55 */  jal        capWeaponBaseMax
/* 40328 8003F728 02002821 */   addu      $a1, $s0, $zero
/* 4032C 8003F72C 0800FDDA */  j          .L8003F768
/* 40330 8003F730 00021400 */   sll       $v0, $v0, 0x10
.L8003F734:
/* 40334 8003F734 0C020F8F */  jal        isSheildSkillOver10
/* 40338 8003F738 02202021 */   addu      $a0, $s1, $zero
/* 4033C 8003F73C 1440003E */  bnez       $v0, .L8003F838
/* 40340 8003F740 8FBF0034 */   lw        $ra, 0x34($sp)
/* 40344 8003F744 0C020F5F */  jal        CapBaseSheild
/* 40348 8003F748 02202021 */   addu      $a0, $s1, $zero
/* 4034C 8003F74C 00409021 */  addu       $s2, $v0, $zero
/* 40350 8003F750 02202021 */  addu       $a0, $s1, $zero
/* 40354 8003F754 0C020EFF */  jal        wonky_sheild_check
/* 40358 8003F758 24050001 */   addiu     $a1, $zero, 1
/* 4035C 8003F75C 0C020F5F */  jal        CapBaseSheild
/* 40360 8003F760 02202021 */   addu      $a0, $s1, $zero
/* 40364 8003F764 00021400 */  sll        $v0, $v0, 0x10
.L8003F768:
/* 40368 8003F768 00021403 */  sra        $v0, $v0, 0x10
/* 4036C 8003F76C 10520031 */  beq        $v0, $s2, .L8003F834
/* 40370 8003F770 3C04800F */   lui       $a0, %hi(exp_train_price)
.L8003F774:
/* 40374 8003F774 8EA50014 */  lw         $a1, 0x14($s5)
.L8003F778:
/* 40378 8003F778 8C83D594 */  lw         $v1, %lo(exp_train_price)($a0)
/* 4037C 8003F77C 8CA20008 */  lw         $v0, 8($a1)
/* 40380 8003F780 00431023 */  subu       $v0, $v0, $v1
/* 40384 8003F784 16E00008 */  bnez       $s7, .L8003F7A8
/* 40388 8003F788 ACA20008 */   sw        $v0, 8($a1)
/* 4038C 8003F78C 26C268A8 */  addiu      $v0, $s6, 0x68a8
/* 40390 8003F790 3C04800F */  lui        $a0, %hi(gold_train_price)
/* 40394 8003F794 8C4515F8 */  lw         $a1, 0x15f8($v0)
/* 40398 8003F798 8C83D590 */  lw         $v1, %lo(gold_train_price)($a0)
/* 4039C 8003F79C 8CA20014 */  lw         $v0, 0x14($a1)
/* 403A0 8003F7A0 00431023 */  subu       $v0, $v0, $v1
/* 403A4 8003F7A4 ACA20014 */  sw         $v0, 0x14($a1)
.L8003F7A8:
/* 403A8 8003F7A8 26C268A8 */  addiu      $v0, $s6, 0x68a8
/* 403AC 8003F7AC 8C4314CC */  lw         $v1, 0x14cc($v0)
/* 403B0 8003F7B0 8C700040 */  lw         $s0, 0x40($v1)
/* 403B4 8003F7B4 8E020004 */  lw         $v0, 4($s0)
/* 403B8 8003F7B8 93C50088 */  lbu        $a1, 0x88($fp)
/* 403BC 8003F7BC 0C00E2F7 */  jal        func_80038BDC
/* 403C0 8003F7C0 8C440088 */   lw        $a0, 0x88($v0)
/* 403C4 8003F7C4 8E020004 */  lw         $v0, 4($s0)
/* 403C8 8003F7C8 8C44008C */  lw         $a0, 0x8c($v0)
/* 403CC 8003F7CC 10800008 */  beqz       $a0, .L8003F7F0
/* 403D0 8003F7D0 00000000 */   nop
/* 403D4 8003F7D4 0C00E6DF */  jal        func_80039B7C
/* 403D8 8003F7D8 00000000 */   nop
/* 403DC 8003F7DC 8E030004 */  lw         $v1, 4($s0)
/* 403E0 8003F7E0 0C00E5B2 */  jal        func_800396C8
/* 403E4 8003F7E4 8C64008C */   lw        $a0, 0x8c($v1)
/* 403E8 8003F7E8 0800FDFF */  j          .L8003F7FC
/* 403EC 8003F7EC 8E020004 */   lw        $v0, 4($s0)
.L8003F7F0:
/* 403F0 8003F7F0 0C00E388 */  jal        show_EXP_costs
/* 403F4 8003F7F4 8C440088 */   lw        $a0, 0x88($v0)
/* 403F8 8003F7F8 8E020004 */  lw         $v0, 4($s0)
.L8003F7FC:
/* 403FC 8003F7FC 8C430080 */  lw         $v1, 0x80($v0)
/* 40400 8003F800 0C02EEBC */  jal        func_800BBAF0
/* 40404 8003F804 8C640080 */   lw        $a0, 0x80($v1)
/* 40408 8003F808 26C368A8 */  addiu      $v1, $s6, 0x68a8
/* 4040C 8003F80C 8C6515F8 */  lw         $a1, 0x15f8($v1)
/* 40410 8003F810 00402021 */  addu       $a0, $v0, $zero
/* 40414 8003F814 8CA60014 */  lw         $a2, 0x14($a1)
/* 40418 8003F818 3C05800E */  lui        $a1, %hi(D_800DC644)
/* 4041C 8003F81C 0C0333AC */  jal        sprintf
/* 40420 8003F820 24A5C644 */   addiu     $a1, $a1, %lo(D_800DC644)
/* 40424 8003F824 8E030004 */  lw         $v1, 4($s0)
/* 40428 8003F828 8C640080 */  lw         $a0, 0x80($v1)
/* 4042C 8003F82C 0C010DA7 */  jal        func_8004369C
/* 40430 8003F830 02A02821 */   addu      $a1, $s5, $zero
.L8003F834:
/* 40434 8003F834 8FBF0034 */  lw         $ra, 0x34($sp)
.L8003F838:
/* 40438 8003F838 8FBE0030 */  lw         $fp, 0x30($sp)
/* 4043C 8003F83C 8FB7002C */  lw         $s7, 0x2c($sp)
/* 40440 8003F840 8FB60028 */  lw         $s6, 0x28($sp)
/* 40444 8003F844 8FB50024 */  lw         $s5, 0x24($sp)
/* 40448 8003F848 8FB40020 */  lw         $s4, 0x20($sp)
/* 4044C 8003F84C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 40450 8003F850 8FB20018 */  lw         $s2, 0x18($sp)
/* 40454 8003F854 8FB10014 */  lw         $s1, 0x14($sp)
/* 40458 8003F858 8FB00010 */  lw         $s0, 0x10($sp)
/* 4045C 8003F85C 03E00008 */  jr         $ra
/* 40460 8003F860 27BD0038 */   addiu     $sp, $sp, 0x38

glabel skill_train_prompt
/* 40464 8003F864 27BDFC98 */  addiu      $sp, $sp, -0x368
/* 40468 8003F868 F7B40360 */  sdc1       $f20, 0x360($sp)
/* 4046C 8003F86C 3C01800E */  lui        $at, %hi(D_800DC648)
/* 40470 8003F870 C434C648 */  lwc1       $f20, %lo(D_800DC648)($at)
/* 40474 8003F874 AFB60350 */  sw         $s6, 0x350($sp)
/* 40478 8003F878 30B6FFFF */  andi       $s6, $a1, 0xffff
/* 4047C 8003F87C AFB1033C */  sw         $s1, 0x33c($sp)
/* 40480 8003F880 3C11800E */  lui        $s1, %hi(gGlobals)
/* 40484 8003F884 AFB00338 */  sw         $s0, 0x338($sp)
/* 40488 8003F888 263068A8 */  addiu      $s0, $s1, %lo(gGlobals)
/* 4048C 8003F88C AFBF035C */  sw         $ra, 0x35c($sp)
/* 40490 8003F890 AFBE0358 */  sw         $fp, 0x358($sp)
/* 40494 8003F894 AFB70354 */  sw         $s7, 0x354($sp)
/* 40498 8003F898 AFB5034C */  sw         $s5, 0x34c($sp)
/* 4049C 8003F89C AFB40348 */  sw         $s4, 0x348($sp)
/* 404A0 8003F8A0 AFB30344 */  sw         $s3, 0x344($sp)
/* 404A4 8003F8A4 AFB20340 */  sw         $s2, 0x340($sp)
/* 404A8 8003F8A8 AFA40368 */  sw         $a0, 0x368($sp)
/* 404AC 8003F8AC 90820088 */  lbu        $v0, 0x88($a0)
/* 404B0 8003F8B0 8E0315F8 */  lw         $v1, 0x15f8($s0)
/* 404B4 8003F8B4 00021080 */  sll        $v0, $v0, 2
/* 404B8 8003F8B8 00621821 */  addu       $v1, $v1, $v0
/* 404BC 8003F8BC 8C740000 */  lw         $s4, ($v1)
/* 404C0 8003F8C0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 404C4 8003F8C4 AFA60328 */  sw         $a2, 0x328($sp)
/* 404C8 8003F8C8 0C01027C */  jal        shopkeepNotOriana
/* 404CC 8003F8CC 8E92001C */   lw        $s2, 0x1c($s4)
/* 404D0 8003F8D0 3C05800F */  lui        $a1, %hi(gold_train_price)
/* 404D4 8003F8D4 240300C8 */  addiu      $v1, $zero, 0xc8
/* 404D8 8003F8D8 3C04800F */  lui        $a0, %hi(exp_train_price)
/* 404DC 8003F8DC ACA3D590 */  sw         $v1, %lo(gold_train_price)($a1)
/* 404E0 8003F8E0 00161A02 */  srl        $v1, $s6, 8
/* 404E4 8003F8E4 32C600FF */  andi       $a2, $s6, 0xff
/* 404E8 8003F8E8 2495D594 */  addiu      $s5, $a0, %lo(exp_train_price)
/* 404EC 8003F8EC 0220F021 */  addu       $fp, $s1, $zero
/* 404F0 8003F8F0 00A09821 */  addu       $s3, $a1, $zero
/* 404F4 8003F8F4 AC80D594 */  sw         $zero, -0x2a6c($a0)
/* 404F8 8003F8F8 AFA2032C */  sw         $v0, 0x32c($sp)
/* 404FC 8003F8FC 920214C4 */  lbu        $v0, 0x14c4($s0)
/* 40500 8003F900 0080B821 */  addu       $s7, $a0, $zero
/* 40504 8003F904 38420005 */  xori       $v0, $v0, 5
/* 40508 8003F908 2C420001 */  sltiu      $v0, $v0, 1
/* 4050C 8003F90C 10400003 */  beqz       $v0, .L8003F91C
/* 40510 8003F910 AFA20330 */   sw        $v0, 0x330($sp)
/* 40514 8003F914 3C01800E */  lui        $at, %hi(D_800DC64C)
/* 40518 8003F918 C434C64C */  lwc1       $f20, %lo(D_800DC64C)($at)
.L8003F91C:
/* 4051C 8003F91C 24020001 */  addiu      $v0, $zero, 1
/* 40520 8003F920 10620029 */  beq        $v1, $v0, .L8003F9C8
/* 40524 8003F924 28620002 */   slti      $v0, $v1, 2
/* 40528 8003F928 50400005 */  beql       $v0, $zero, .L8003F940
/* 4052C 8003F92C 24020002 */   addiu     $v0, $zero, 2
/* 40530 8003F930 10600007 */  beqz       $v1, .L8003F950
/* 40534 8003F934 8FBF035C */   lw        $ra, 0x35c($sp)
/* 40538 8003F938 0800FF96 */  j          .L8003FE58
/* 4053C 8003F93C 8FBE0358 */   lw        $fp, 0x358($sp)
.L8003F940:
/* 40540 8003F940 10620030 */  beq        $v1, $v0, .L8003FA04
/* 40544 8003F944 8FBF035C */   lw        $ra, 0x35c($sp)
/* 40548 8003F948 0800FF96 */  j          .L8003FE58
/* 4054C 8003F94C 8FBE0358 */   lw        $fp, 0x358($sp)
.L8003F950:
/* 40550 8003F950 02402021 */  addu       $a0, $s2, $zero
/* 40554 8003F954 30D000FF */  andi       $s0, $a2, 0xff
/* 40558 8003F958 0C020F4B */  jal        capskillBaseMax
/* 4055C 8003F95C 02002821 */   addu      $a1, $s0, $zero
/* 40560 8003F960 00408821 */  addu       $s1, $v0, $zero
/* 40564 8003F964 1A200004 */  blez       $s1, .L8003F978
/* 40568 8003F968 02402021 */   addu      $a0, $s2, $zero
/* 4056C 8003F96C 0C020E82 */  jal        get_skill_gold_train_price
/* 40570 8003F970 02002821 */   addu      $a1, $s0, $zero
/* 40574 8003F974 AE62D590 */  sw         $v0, -0x2a70($s3)
.L8003F978:
/* 40578 8003F978 02402021 */  addu       $a0, $s2, $zero
/* 4057C 8003F97C 0C020E0E */  jal        get_skill_xp_multi
/* 40580 8003F980 02002821 */   addu      $a1, $s0, $zero
.L8003F984:
/* 40584 8003F984 44821000 */  mtc1       $v0, $f2
/* 40588 8003F988 468010A1 */  cvt.d.w    $f2, $f2
/* 4058C 8003F98C 04430005 */  bgezl      $v0, .L8003F9A4
/* 40590 8003F990 46201020 */   cvt.s.d   $f0, $f2
/* 40594 8003F994 3C01800E */  lui        $at, %hi(D_800DC650)
/* 40598 8003F998 D420C650 */  ldc1       $f0, %lo(D_800DC650)($at)
/* 4059C 8003F99C 46201080 */  add.d      $f2, $f2, $f0
/* 405A0 8003F9A0 46201020 */  cvt.s.d    $f0, $f2
.L8003F9A4:
/* 405A4 8003F9A4 46140002 */  mul.s      $f0, $f0, $f20
/* 405A8 8003F9A8 3C01800E */  lui        $at, %hi(D_800DC658)
/* 405AC 8003F9AC C422C658 */  lwc1       $f2, %lo(D_800DC658)($at)
/* 405B0 8003F9B0 4600103E */  c.le.s     $f2, $f0
/* 405B4 8003F9B4 00000000 */  nop
/* 405B8 8003F9B8 4500002B */  bc1f       .L8003FA68
/* 405BC 8003F9BC 00000000 */   nop
/* 405C0 8003F9C0 0800FE9E */  j          .L8003FA78
/* 405C4 8003F9C4 46020001 */   sub.s     $f0, $f0, $f2
.L8003F9C8:
/* 405C8 8003F9C8 02402021 */  addu       $a0, $s2, $zero
/* 405CC 8003F9CC 30D000FF */  andi       $s0, $a2, 0xff
/* 405D0 8003F9D0 0C020F55 */  jal        capWeaponBaseMax
/* 405D4 8003F9D4 02002821 */   addu      $a1, $s0, $zero
/* 405D8 8003F9D8 00408821 */  addu       $s1, $v0, $zero
/* 405DC 8003F9DC 1A200004 */  blez       $s1, .L8003F9F0
/* 405E0 8003F9E0 02402021 */   addu      $a0, $s2, $zero
/* 405E4 8003F9E4 0C020E8B */  jal        get_selected_weaponskill_price
/* 405E8 8003F9E8 02002821 */   addu      $a1, $s0, $zero
/* 405EC 8003F9EC AE62D590 */  sw         $v0, -0x2a70($s3)
.L8003F9F0:
/* 405F0 8003F9F0 02402021 */  addu       $a0, $s2, $zero
/* 405F4 8003F9F4 0C020E3C */  jal        Weapon_XP_check
/* 405F8 8003F9F8 02002821 */   addu      $a1, $s0, $zero
/* 405FC 8003F9FC 0800FE61 */  j          .L8003F984
/* 40600 8003FA00 00000000 */   nop
.L8003FA04:
/* 40604 8003FA04 0C020F5F */  jal        CapBaseSheild
/* 40608 8003FA08 02402021 */   addu      $a0, $s2, $zero
/* 4060C 8003FA0C 00408821 */  addu       $s1, $v0, $zero
/* 40610 8003FA10 1A200004 */  blez       $s1, .L8003FA24
/* 40614 8003FA14 00000000 */   nop
/* 40618 8003FA18 0C020E94 */  jal        get_sheild_gold_train_price
/* 4061C 8003FA1C 02402021 */   addu      $a0, $s2, $zero
/* 40620 8003FA20 AE62D590 */  sw         $v0, -0x2a70($s3)
.L8003FA24:
/* 40624 8003FA24 0C020E70 */  jal        func_800839C0
/* 40628 8003FA28 02402021 */   addu      $a0, $s2, $zero
/* 4062C 8003FA2C 44821000 */  mtc1       $v0, $f2
/* 40630 8003FA30 468010A1 */  cvt.d.w    $f2, $f2
/* 40634 8003FA34 04430005 */  bgezl      $v0, .L8003FA4C
/* 40638 8003FA38 46201020 */   cvt.s.d   $f0, $f2
/* 4063C 8003FA3C 3C01800E */  lui        $at, %hi(D_800DC660)
/* 40640 8003FA40 D420C660 */  ldc1       $f0, %lo(D_800DC660)($at)
/* 40644 8003FA44 46201080 */  add.d      $f2, $f2, $f0
/* 40648 8003FA48 46201020 */  cvt.s.d    $f0, $f2
.L8003FA4C:
/* 4064C 8003FA4C 46140002 */  mul.s      $f0, $f0, $f20
/* 40650 8003FA50 3C01800E */  lui        $at, %hi(D_800DC668)
/* 40654 8003FA54 C422C668 */  lwc1       $f2, %lo(D_800DC668)($at)
/* 40658 8003FA58 4600103E */  c.le.s     $f2, $f0
/* 4065C 8003FA5C 00000000 */  nop
/* 40660 8003FA60 45030005 */  bc1tl      .L8003FA78
/* 40664 8003FA64 46020001 */   sub.s     $f0, $f0, $f2
.L8003FA68:
/* 40668 8003FA68 4600008D */  trunc.w.s  $f2, $f0
/* 4066C 8003FA6C 44031000 */  mfc1       $v1, $f2
/* 40670 8003FA70 0800FEA3 */  j          .L8003FA8C
/* 40674 8003FA74 AEA30000 */   sw        $v1, ($s5)
.L8003FA78:
/* 40678 8003FA78 4600008D */  trunc.w.s  $f2, $f0
/* 4067C 8003FA7C 44031000 */  mfc1       $v1, $f2
/* 40680 8003FA80 3C028000 */  lui        $v0, 0x8000
/* 40684 8003FA84 00621825 */  or         $v1, $v1, $v0
/* 40688 8003FA88 AEA30000 */  sw         $v1, ($s5)
.L8003FA8C:
/* 4068C 8003FA8C 2402FFFF */  addiu      $v0, $zero, -1
/* 40690 8003FA90 16220019 */  bne        $s1, $v0, .L8003FAF8
/* 40694 8003FA94 8FA30328 */   lw        $v1, 0x328($sp)
/* 40698 8003FA98 24050096 */  addiu      $a1, $zero, 0x96
/* 4069C 8003FA9C 27A40028 */  addiu      $a0, $sp, 0x28
/* 406A0 8003FAA0 00803021 */  addu       $a2, $a0, $zero
/* 406A4 8003FAA4 240200E1 */  addiu      $v0, $zero, 0xe1
/* 406A8 8003FAA8 240300FF */  addiu      $v1, $zero, 0xff
/* 406AC 8003FAAC A3A20028 */  sb         $v0, 0x28($sp)
/* 406B0 8003FAB0 A0820001 */  sb         $v0, 1($a0)
/* 406B4 8003FAB4 A0820002 */  sb         $v0, 2($a0)
/* 406B8 8003FAB8 24020032 */  addiu      $v0, $zero, 0x32
/* 406BC 8003FABC A0830003 */  sb         $v1, 3($a0)
/* 406C0 8003FAC0 24030096 */  addiu      $v1, $zero, 0x96
/* 406C4 8003FAC4 A3A20068 */  sb         $v0, 0x68($sp)
/* 406C8 8003FAC8 A3A20069 */  sb         $v0, 0x69($sp)
/* 406CC 8003FACC A3A2006A */  sb         $v0, 0x6a($sp)
/* 406D0 8003FAD0 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 406D4 8003FAD4 A3A3006B */  sb         $v1, 0x6b($sp)
/* 406D8 8003FAD8 8C47204C */  lw         $a3, 0x204c($v0)
/* 406DC 8003FADC 24030001 */  addiu      $v1, $zero, 1
/* 406E0 8003FAE0 AFA30010 */  sw         $v1, 0x10($sp)
/* 406E4 8003FAE4 8CE40804 */  lw         $a0, 0x804($a3)
/* 406E8 8003FAE8 0C0131E1 */  jal        some_textbox_func
/* 406EC 8003FAEC 27A70068 */   addiu     $a3, $sp, 0x68
/* 406F0 8003FAF0 0800FF95 */  j          .L8003FE54
/* 406F4 8003FAF4 8FBF035C */   lw        $ra, 0x35c($sp)
.L8003FAF8:
/* 406F8 8003FAF8 0223102A */  slt        $v0, $s1, $v1
/* 406FC 8003FAFC 14400018 */  bnez       $v0, .L8003FB60
/* 40700 8003FB00 2A22000A */   slti      $v0, $s1, 0xa
/* 40704 8003FB04 24050096 */  addiu      $a1, $zero, 0x96
/* 40708 8003FB08 27A600A8 */  addiu      $a2, $sp, 0xa8
/* 4070C 8003FB0C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 40710 8003FB10 240300FF */  addiu      $v1, $zero, 0xff
/* 40714 8003FB14 A3A200A8 */  sb         $v0, 0xa8($sp)
/* 40718 8003FB18 A3A200A9 */  sb         $v0, 0xa9($sp)
/* 4071C 8003FB1C A3A200AA */  sb         $v0, 0xaa($sp)
/* 40720 8003FB20 24020032 */  addiu      $v0, $zero, 0x32
/* 40724 8003FB24 A3A300AB */  sb         $v1, 0xab($sp)
/* 40728 8003FB28 24030096 */  addiu      $v1, $zero, 0x96
/* 4072C 8003FB2C A3A200E8 */  sb         $v0, 0xe8($sp)
/* 40730 8003FB30 A3A200E9 */  sb         $v0, 0xe9($sp)
/* 40734 8003FB34 A3A200EA */  sb         $v0, 0xea($sp)
/* 40738 8003FB38 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 4073C 8003FB3C A3A300EB */  sb         $v1, 0xeb($sp)
/* 40740 8003FB40 8C47204C */  lw         $a3, 0x204c($v0)
/* 40744 8003FB44 24030001 */  addiu      $v1, $zero, 1
/* 40748 8003FB48 AFA30010 */  sw         $v1, 0x10($sp)
/* 4074C 8003FB4C 8CE40808 */  lw         $a0, 0x808($a3)
/* 40750 8003FB50 0C0131E1 */  jal        some_textbox_func
/* 40754 8003FB54 27A700E8 */   addiu     $a3, $sp, 0xe8
/* 40758 8003FB58 0800FF95 */  j          .L8003FE54
/* 4075C 8003FB5C 8FBF035C */   lw        $ra, 0x35c($sp)
.L8003FB60:
/* 40760 8003FB60 14400018 */  bnez       $v0, .L8003FBC4
/* 40764 8003FB64 8FA5032C */   lw        $a1, 0x32c($sp)
/* 40768 8003FB68 24050096 */  addiu      $a1, $zero, 0x96
/* 4076C 8003FB6C 27A60128 */  addiu      $a2, $sp, 0x128
/* 40770 8003FB70 240200E1 */  addiu      $v0, $zero, 0xe1
/* 40774 8003FB74 240300FF */  addiu      $v1, $zero, 0xff
/* 40778 8003FB78 A3A20128 */  sb         $v0, 0x128($sp)
/* 4077C 8003FB7C A3A20129 */  sb         $v0, 0x129($sp)
/* 40780 8003FB80 A3A2012A */  sb         $v0, 0x12a($sp)
/* 40784 8003FB84 24020032 */  addiu      $v0, $zero, 0x32
/* 40788 8003FB88 A3A3012B */  sb         $v1, 0x12b($sp)
/* 4078C 8003FB8C 24030096 */  addiu      $v1, $zero, 0x96
/* 40790 8003FB90 A3A20168 */  sb         $v0, 0x168($sp)
/* 40794 8003FB94 A3A20169 */  sb         $v0, 0x169($sp)
/* 40798 8003FB98 A3A2016A */  sb         $v0, 0x16a($sp)
/* 4079C 8003FB9C 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 407A0 8003FBA0 A3A3016B */  sb         $v1, 0x16b($sp)
/* 407A4 8003FBA4 8C47204C */  lw         $a3, 0x204c($v0)
/* 407A8 8003FBA8 24030001 */  addiu      $v1, $zero, 1
/* 407AC 8003FBAC AFA30010 */  sw         $v1, 0x10($sp)
/* 407B0 8003FBB0 8CE4080C */  lw         $a0, 0x80c($a3)
/* 407B4 8003FBB4 0C0131E1 */  jal        some_textbox_func
/* 407B8 8003FBB8 27A70168 */   addiu     $a3, $sp, 0x168
/* 407BC 8003FBBC 0800FF95 */  j          .L8003FE54
/* 407C0 8003FBC0 8FBF035C */   lw        $ra, 0x35c($sp)
.L8003FBC4:
/* 407C4 8003FBC4 50A00001 */  beql       $a1, $zero, .L8003FBCC
/* 407C8 8003FBC8 AE60D590 */   sw        $zero, -0x2a70($s3)
.L8003FBCC:
/* 407CC 8003FBCC 8FA20330 */  lw         $v0, 0x330($sp)
/* 407D0 8003FBD0 1440002F */  bnez       $v0, .L8003FC90
/* 407D4 8003FBD4 8E830014 */   lw        $v1, 0x14($s4)
/* 407D8 8003FBD8 8EE6D594 */  lw         $a2, -0x2a6c($s7)
/* 407DC 8003FBDC 8C620008 */  lw         $v0, 8($v1)
/* 407E0 8003FBE0 0046102B */  sltu       $v0, $v0, $a2
/* 407E4 8003FBE4 14400008 */  bnez       $v0, .L8003FC08
/* 407E8 8003FBE8 8E67D590 */   lw        $a3, -0x2a70($s3)
/* 407EC 8003FBEC 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 407F0 8003FBF0 8C4315F8 */  lw         $v1, 0x15f8($v0)
/* 407F4 8003FBF4 8E64D590 */  lw         $a0, -0x2a70($s3)
/* 407F8 8003FBF8 8C620014 */  lw         $v0, 0x14($v1)
/* 407FC 8003FBFC 0044102B */  sltu       $v0, $v0, $a0
/* 40800 8003FC00 10400044 */  beqz       $v0, .L8003FD14
/* 40804 8003FC04 00000000 */   nop
.L8003FC08:
/* 40808 8003FC08 10E00009 */  beqz       $a3, .L8003FC30
/* 4080C 8003FC0C 3C02800F */   lui       $v0, %hi(gGlobalsText)
/* 40810 8003FC10 24438920 */  addiu      $v1, $v0, %lo(gGlobalsText)
/* 40814 8003FC14 8C68FFD4 */  lw         $t0, -0x2c($v1)
/* 40818 8003FC18 00602021 */  addu       $a0, $v1, $zero
/* 4081C 8003FC1C 8D050810 */  lw         $a1, 0x810($t0)
/* 40820 8003FC20 0C0333AC */  jal        sprintf
/* 40824 8003FC24 00408021 */   addu      $s0, $v0, $zero
/* 40828 8003FC28 0800FF13 */  j          .L8003FC4C
/* 4082C 8003FC2C 26048920 */   addiu     $a0, $s0, -0x76e0
.L8003FC30:
/* 40830 8003FC30 24438920 */  addiu      $v1, $v0, -0x76e0
/* 40834 8003FC34 00602021 */  addu       $a0, $v1, $zero
/* 40838 8003FC38 8C67FFD4 */  lw         $a3, -0x2c($v1)
/* 4083C 8003FC3C 8CE50814 */  lw         $a1, 0x814($a3)
/* 40840 8003FC40 0C0333AC */  jal        sprintf
/* 40844 8003FC44 00408021 */   addu      $s0, $v0, $zero
/* 40848 8003FC48 26048920 */  addiu      $a0, $s0, -0x76e0
.L8003FC4C:
/* 4084C 8003FC4C 24050096 */  addiu      $a1, $zero, 0x96
/* 40850 8003FC50 27A601A8 */  addiu      $a2, $sp, 0x1a8
/* 40854 8003FC54 27A701E8 */  addiu      $a3, $sp, 0x1e8
/* 40858 8003FC58 240200E1 */  addiu      $v0, $zero, 0xe1
/* 4085C 8003FC5C 240300FF */  addiu      $v1, $zero, 0xff
/* 40860 8003FC60 A3A201A8 */  sb         $v0, 0x1a8($sp)
/* 40864 8003FC64 A3A201A9 */  sb         $v0, 0x1a9($sp)
/* 40868 8003FC68 A3A201AA */  sb         $v0, 0x1aa($sp)
/* 4086C 8003FC6C 24020032 */  addiu      $v0, $zero, 0x32
/* 40870 8003FC70 A3A301AB */  sb         $v1, 0x1ab($sp)
/* 40874 8003FC74 24030096 */  addiu      $v1, $zero, 0x96
/* 40878 8003FC78 A3A201E8 */  sb         $v0, 0x1e8($sp)
/* 4087C 8003FC7C A3A201E9 */  sb         $v0, 0x1e9($sp)
/* 40880 8003FC80 A3A201EA */  sb         $v0, 0x1ea($sp)
/* 40884 8003FC84 24020001 */  addiu      $v0, $zero, 1
/* 40888 8003FC88 0800FF3F */  j          .L8003FCFC
/* 4088C 8003FC8C A3A301EB */   sb        $v1, 0x1eb($sp)
.L8003FC90:
/* 40890 8003FC90 8EE6D594 */  lw         $a2, -0x2a6c($s7)
/* 40894 8003FC94 8C620008 */  lw         $v0, 8($v1)
/* 40898 8003FC98 0046102B */  sltu       $v0, $v0, $a2
/* 4089C 8003FC9C 1040001B */  beqz       $v0, .L8003FD0C
/* 408A0 8003FCA0 3C10800F */   lui       $s0, %hi(gGlobalsText)
/* 408A4 8003FCA4 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 408A8 8003FCA8 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 408AC 8003FCAC 8C450814 */  lw         $a1, 0x814($v0)
/* 408B0 8003FCB0 0C0333AC */  jal        sprintf
/* 408B4 8003FCB4 02002021 */   addu      $a0, $s0, $zero
/* 408B8 8003FCB8 02002021 */  addu       $a0, $s0, $zero
/* 408BC 8003FCBC 24050096 */  addiu      $a1, $zero, 0x96
/* 408C0 8003FCC0 27A60228 */  addiu      $a2, $sp, 0x228
/* 408C4 8003FCC4 27A70268 */  addiu      $a3, $sp, 0x268
/* 408C8 8003FCC8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 408CC 8003FCCC 240300FF */  addiu      $v1, $zero, 0xff
/* 408D0 8003FCD0 A3A20228 */  sb         $v0, 0x228($sp)
/* 408D4 8003FCD4 A3A20229 */  sb         $v0, 0x229($sp)
/* 408D8 8003FCD8 A3A2022A */  sb         $v0, 0x22a($sp)
/* 408DC 8003FCDC 24020032 */  addiu      $v0, $zero, 0x32
/* 408E0 8003FCE0 A3A3022B */  sb         $v1, 0x22b($sp)
/* 408E4 8003FCE4 24030096 */  addiu      $v1, $zero, 0x96
/* 408E8 8003FCE8 A3A20268 */  sb         $v0, 0x268($sp)
/* 408EC 8003FCEC A3A20269 */  sb         $v0, 0x269($sp)
/* 408F0 8003FCF0 A3A2026A */  sb         $v0, 0x26a($sp)
/* 408F4 8003FCF4 24020001 */  addiu      $v0, $zero, 1
/* 408F8 8003FCF8 A3A3026B */  sb         $v1, 0x26b($sp)
.L8003FCFC:
/* 408FC 8003FCFC 0C0131E1 */  jal        some_textbox_func
/* 40900 8003FD00 AFA20010 */   sw        $v0, 0x10($sp)
/* 40904 8003FD04 0800FF95 */  j          .L8003FE54
/* 40908 8003FD08 8FBF035C */   lw        $ra, 0x35c($sp)
.L8003FD0C:
/* 4090C 8003FD0C AE60D590 */  sw         $zero, -0x2a70($s3)
/* 40910 8003FD10 8E67D590 */  lw         $a3, -0x2a70($s3)
.L8003FD14:
/* 40914 8003FD14 10E0000A */  beqz       $a3, .L8003FD40
/* 40918 8003FD18 3C02800F */   lui       $v0, %hi(gGlobalsText)
/* 4091C 8003FD1C 24438920 */  addiu      $v1, $v0, %lo(gGlobalsText)
/* 40920 8003FD20 00602021 */  addu       $a0, $v1, $zero
/* 40924 8003FD24 8C68FFD4 */  lw         $t0, -0x2c($v1)
/* 40928 8003FD28 8EE6D594 */  lw         $a2, -0x2a6c($s7)
/* 4092C 8003FD2C 8D050818 */  lw         $a1, 0x818($t0)
/* 40930 8003FD30 0C0333AC */  jal        sprintf
/* 40934 8003FD34 00408021 */   addu      $s0, $v0, $zero
/* 40938 8003FD38 0800FF58 */  j          .L8003FD60
/* 4093C 8003FD3C 240400B0 */   addiu     $a0, $zero, 0xb0
.L8003FD40:
/* 40940 8003FD40 24438920 */  addiu      $v1, $v0, -0x76e0
/* 40944 8003FD44 00602021 */  addu       $a0, $v1, $zero
/* 40948 8003FD48 8C67FFD4 */  lw         $a3, -0x2c($v1)
/* 4094C 8003FD4C 8EE6D594 */  lw         $a2, -0x2a6c($s7)
/* 40950 8003FD50 8CE5081C */  lw         $a1, 0x81c($a3)
/* 40954 8003FD54 0C0333AC */  jal        sprintf
/* 40958 8003FD58 00408021 */   addu      $s0, $v0, $zero
/* 4095C 8003FD5C 240400B0 */  addiu      $a0, $zero, 0xb0
.L8003FD60:
/* 40960 8003FD60 240500FF */  addiu      $a1, $zero, 0xff
/* 40964 8003FD64 240200C8 */  addiu      $v0, $zero, 0xc8
/* 40968 8003FD68 240300B4 */  addiu      $v1, $zero, 0xb4
/* 4096C 8003FD6C A3A202E8 */  sb         $v0, 0x2e8($sp)
/* 40970 8003FD70 24020064 */  addiu      $v0, $zero, 0x64
/* 40974 8003FD74 A3A502A8 */  sb         $a1, 0x2a8($sp)
/* 40978 8003FD78 A3A502A9 */  sb         $a1, 0x2a9($sp)
/* 4097C 8003FD7C A3A502AA */  sb         $a1, 0x2aa($sp)
/* 40980 8003FD80 A3A502AB */  sb         $a1, 0x2ab($sp)
/* 40984 8003FD84 A3A302E9 */  sb         $v1, 0x2e9($sp)
/* 40988 8003FD88 A3A202EA */  sb         $v0, 0x2ea($sp)
/* 4098C 8003FD8C 0C026259 */  jal        passToMalloc
/* 40990 8003FD90 A3A502EB */   sb        $a1, 0x2eb($sp)
/* 40994 8003FD94 00402021 */  addu       $a0, $v0, $zero
/* 40998 8003FD98 24050002 */  addiu      $a1, $zero, 2
/* 4099C 8003FD9C 26108920 */  addiu      $s0, $s0, -0x76e0
/* 409A0 8003FDA0 02003021 */  addu       $a2, $s0, $zero
/* 409A4 8003FDA4 24070096 */  addiu      $a3, $zero, 0x96
/* 409A8 8003FDA8 27A202A8 */  addiu      $v0, $sp, 0x2a8
/* 409AC 8003FDAC 27A302E8 */  addiu      $v1, $sp, 0x2e8
/* 409B0 8003FDB0 AFA20010 */  sw         $v0, 0x10($sp)
/* 409B4 8003FDB4 AFA30014 */  sw         $v1, 0x14($sp)
/* 409B8 8003FDB8 AFA00018 */  sw         $zero, 0x18($sp)
/* 409BC 8003FDBC AFA0001C */  sw         $zero, 0x1c($sp)
/* 409C0 8003FDC0 0C013461 */  jal        func_8004D184
/* 409C4 8003FDC4 AFA00020 */   sw        $zero, 0x20($sp)
/* 409C8 8003FDC8 2404007C */  addiu      $a0, $zero, 0x7c
/* 409CC 8003FDCC 0C026259 */  jal        passToMalloc
/* 409D0 8003FDD0 00408821 */   addu      $s1, $v0, $zero
/* 409D4 8003FDD4 2610DF88 */  addiu      $s0, $s0, -0x2078
/* 409D8 8003FDD8 8E03204C */  lw         $v1, 0x204c($s0)
/* 409DC 8003FDDC 00402021 */  addu       $a0, $v0, $zero
/* 409E0 8003FDE0 8C65007C */  lw         $a1, 0x7c($v1)
/* 409E4 8003FDE4 0C02DFC8 */  jal        widgetcliptext_init
/* 409E8 8003FDE8 24060190 */   addiu     $a2, $zero, 0x190
/* 409EC 8003FDEC 02202021 */  addu       $a0, $s1, $zero
/* 409F0 8003FDF0 3C038004 */  lui        $v1, %hi(func_8003F4A0)
/* 409F4 8003FDF4 8FA50368 */  lw         $a1, 0x368($sp)
/* 409F8 8003FDF8 2463F4A0 */  addiu      $v1, $v1, %lo(func_8003F4A0)
/* 409FC 8003FDFC AC430018 */  sw         $v1, 0x18($v0)
/* 40A00 8003FE00 A456005E */  sh         $s6, 0x5e($v0)
/* 40A04 8003FE04 90A30088 */  lbu        $v1, 0x88($a1)
/* 40A08 8003FE08 00402821 */  addu       $a1, $v0, $zero
/* 40A0C 8003FE0C 0C013626 */  jal        func_8004D898
/* 40A10 8003FE10 A043005C */   sb        $v1, 0x5c($v0)
/* 40A14 8003FE14 0C026259 */  jal        passToMalloc
/* 40A18 8003FE18 2404007C */   addiu     $a0, $zero, 0x7c
/* 40A1C 8003FE1C 8E03204C */  lw         $v1, 0x204c($s0)
/* 40A20 8003FE20 00402021 */  addu       $a0, $v0, $zero
/* 40A24 8003FE24 8C650080 */  lw         $a1, 0x80($v1)
/* 40A28 8003FE28 0C02DFC8 */  jal        widgetcliptext_init
/* 40A2C 8003FE2C 24060190 */   addiu     $a2, $zero, 0x190
/* 40A30 8003FE30 02202021 */  addu       $a0, $s1, $zero
/* 40A34 8003FE34 0C013626 */  jal        func_8004D898
/* 40A38 8003FE38 00402821 */   addu      $a1, $v0, $zero
/* 40A3C 8003FE3C 0C013786 */  jal        func_8004DE18
/* 40A40 8003FE40 02202021 */   addu      $a0, $s1, $zero
/* 40A44 8003FE44 8E041604 */  lw         $a0, 0x1604($s0)
/* 40A48 8003FE48 0C02DC7C */  jal        widgetHandler
/* 40A4C 8003FE4C 02202821 */   addu      $a1, $s1, $zero
/* 40A50 8003FE50 8FBF035C */  lw         $ra, 0x35c($sp)
.L8003FE54:
/* 40A54 8003FE54 8FBE0358 */  lw         $fp, 0x358($sp)
.L8003FE58:
/* 40A58 8003FE58 8FB70354 */  lw         $s7, 0x354($sp)
/* 40A5C 8003FE5C 8FB60350 */  lw         $s6, 0x350($sp)
/* 40A60 8003FE60 8FB5034C */  lw         $s5, 0x34c($sp)
/* 40A64 8003FE64 8FB40348 */  lw         $s4, 0x348($sp)
/* 40A68 8003FE68 8FB30344 */  lw         $s3, 0x344($sp)
/* 40A6C 8003FE6C 8FB20340 */  lw         $s2, 0x340($sp)
/* 40A70 8003FE70 8FB1033C */  lw         $s1, 0x33c($sp)
/* 40A74 8003FE74 8FB00338 */  lw         $s0, 0x338($sp)
/* 40A78 8003FE78 D7B40360 */  ldc1       $f20, 0x360($sp)
/* 40A7C 8003FE7C 03E00008 */  jr         $ra
/* 40A80 8003FE80 27BD0368 */   addiu     $sp, $sp, 0x368

glabel ret12_8003fe84
/* 40A84 8003FE84 03E00008 */  jr         $ra
/* 40A88 8003FE88 2402000C */   addiu     $v0, $zero, 0xc
/* 40A8C 8003FE8C 00000000 */  nop
