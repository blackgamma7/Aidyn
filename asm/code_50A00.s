.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8004FE00
/* 50A00 8004FE00 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 50A04 8004FE04 3C02800E */  lui        $v0, %hi(someCase_1)
/* 50A08 8004FE08 AFB10014 */  sw         $s1, 0x14($sp)
/* 50A0C 8004FE0C 24517D6C */  addiu      $s1, $v0, %lo(someCase_1)
/* 50A10 8004FE10 AFBF001C */  sw         $ra, 0x1c($sp)
/* 50A14 8004FE14 AFB20018 */  sw         $s2, 0x18($sp)
/* 50A18 8004FE18 AFB00010 */  sw         $s0, 0x10($sp)
/* 50A1C 8004FE1C 9223EB7C */  lbu        $v1, -0x1484($s1)
/* 50A20 8004FE20 2463FFFD */  addiu      $v1, $v1, -3
/* 50A24 8004FE24 2C620006 */  sltiu      $v0, $v1, 6
/* 50A28 8004FE28 10400014 */  beqz       $v0, .L8004FE7C
/* 50A2C 8004FE2C 9230000D */   lbu       $s0, 0xd($s1)
/* 50A30 8004FE30 3C02800E */  lui        $v0, %hi(D_800DDB10)
/* 50A34 8004FE34 2442DB10 */  addiu      $v0, $v0, %lo(D_800DDB10)
/* 50A38 8004FE38 00031880 */  sll        $v1, $v1, 2
/* 50A3C 8004FE3C 00621821 */  addu       $v1, $v1, $v0
/* 50A40 8004FE40 8C640000 */  lw         $a0, ($v1)
/* 50A44 8004FE44 00800008 */  jr         $a0
/* 50A48 8004FE48 00000000 */   nop
/* 50A4C 8004FE4C 24100001 */  addiu      $s0, $zero, 1
/* 50A50 8004FE50 08013FA0 */  j          .L8004FE80
/* 50A54 8004FE54 24020003 */   addiu     $v0, $zero, 3
/* 50A58 8004FE58 24100001 */  addiu      $s0, $zero, 1
/* 50A5C 8004FE5C 08013FA0 */  j          .L8004FE80
/* 50A60 8004FE60 24020004 */   addiu     $v0, $zero, 4
/* 50A64 8004FE64 24100001 */  addiu      $s0, $zero, 1
/* 50A68 8004FE68 08013FA0 */  j          .L8004FE80
/* 50A6C 8004FE6C 24020006 */   addiu     $v0, $zero, 6
/* 50A70 8004FE70 24100001 */  addiu      $s0, $zero, 1
/* 50A74 8004FE74 08013FA0 */  j          .L8004FE80
/* 50A78 8004FE78 24020005 */   addiu     $v0, $zero, 5
.L8004FE7C:
/* 50A7C 8004FE7C 24020007 */  addiu      $v0, $zero, 7
.L8004FE80:
/* 50A80 8004FE80 A2220000 */  sb         $v0, ($s1)
/* 50A84 8004FE84 3C02800E */  lui        $v0, %hi(gGlobals)
/* 50A88 8004FE88 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 50A8C 8004FE8C 8E4314FC */  lw         $v1, 0x14fc($s2)
/* 50A90 8004FE90 54600001 */  bnel       $v1, $zero, .L8004FE98
/* 50A94 8004FE94 00008021 */   addu      $s0, $zero, $zero
.L8004FE98:
/* 50A98 8004FE98 0C026259 */  jal        passToMalloc
/* 50A9C 8004FE9C 24040084 */   addiu     $a0, $zero, 0x84
/* 50AA0 8004FEA0 00402021 */  addu       $a0, $v0, $zero
/* 50AA4 8004FEA4 8E451604 */  lw         $a1, 0x1604($s2)
/* 50AA8 8004FEA8 0C00D694 */  jal        make_pause_menu
/* 50AAC 8004FEAC 02003021 */   addu      $a2, $s0, $zero
/* 50AB0 8004FEB0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 50AB4 8004FEB4 8FB20018 */  lw         $s2, 0x18($sp)
/* 50AB8 8004FEB8 AE220008 */  sw         $v0, 8($s1)
/* 50ABC 8004FEBC 8FB10014 */  lw         $s1, 0x14($sp)
/* 50AC0 8004FEC0 8FB00010 */  lw         $s0, 0x10($sp)
/* 50AC4 8004FEC4 03E00008 */  jr         $ra
/* 50AC8 8004FEC8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_screenshot_tint
/* 50ACC 8004FECC 3C02800E */  lui        $v0, %hi(someCase_1)
/* 50AD0 8004FED0 24447D6C */  addiu      $a0, $v0, %lo(someCase_1)
/* 50AD4 8004FED4 90850014 */  lbu        $a1, 0x14($a0)
/* 50AD8 8004FED8 2403000E */  addiu      $v1, $zero, 0xe
/* 50ADC 8004FEDC A0437D6C */  sb         $v1, 0x7d6c($v0)
/* 50AE0 8004FEE0 30A300FF */  andi       $v1, $a1, 0xff
/* 50AE4 8004FEE4 2C620081 */  sltiu      $v0, $v1, 0x81
/* 50AE8 8004FEE8 1440000A */  bnez       $v0, .L8004FF14
/* 50AEC 8004FEEC 2C62008B */   sltiu     $v0, $v1, 0x8b
/* 50AF0 8004FEF0 14400002 */  bnez       $v0, .L8004FEFC
/* 50AF4 8004FEF4 24020080 */   addiu     $v0, $zero, 0x80
/* 50AF8 8004FEF8 24A2FFF6 */  addiu      $v0, $a1, -0xa
.L8004FEFC:
/* 50AFC 8004FEFC A0820014 */  sb         $v0, 0x14($a0)
/* 50B00 8004FF00 90830014 */  lbu        $v1, 0x14($a0)
/* 50B04 8004FF04 00001021 */  addu       $v0, $zero, $zero
/* 50B08 8004FF08 A0830015 */  sb         $v1, 0x15($a0)
/* 50B0C 8004FF0C 03E00008 */  jr         $ra
/* 50B10 8004FF10 A0830016 */   sb        $v1, 0x16($a0)
.L8004FF14:
/* 50B14 8004FF14 03E00008 */  jr         $ra
/* 50B18 8004FF18 24020001 */   addiu     $v0, $zero, 1

glabel draw_screenshot_background
/* 50B1C 8004FF1C 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 50B20 8004FF20 AFB20040 */  sw         $s2, 0x40($sp)
/* 50B24 8004FF24 00809021 */  addu       $s2, $a0, $zero
/* 50B28 8004FF28 3C02800E */  lui        $v0, %hi(someCase_1)
/* 50B2C 8004FF2C AFB30044 */  sw         $s3, 0x44($sp)
/* 50B30 8004FF30 24537D6C */  addiu      $s3, $v0, %lo(someCase_1)
/* 50B34 8004FF34 AFB40048 */  sw         $s4, 0x48($sp)
/* 50B38 8004FF38 2674EB3C */  addiu      $s4, $s3, -0x14c4
/* 50B3C 8004FF3C AFBF004C */  sw         $ra, 0x4c($sp)
/* 50B40 8004FF40 AFB1003C */  sw         $s1, 0x3c($sp)
/* 50B44 8004FF44 AFB00038 */  sw         $s0, 0x38($sp)
/* 50B48 8004FF48 F7B80060 */  sdc1       $f24, 0x60($sp)
/* 50B4C 8004FF4C F7B60058 */  sdc1       $f22, 0x58($sp)
/* 50B50 8004FF50 F7B40050 */  sdc1       $f20, 0x50($sp)
/* 50B54 8004FF54 8E8214D4 */  lw         $v0, 0x14d4($s4)
/* 50B58 8004FF58 10400076 */  beqz       $v0, .L80050134
/* 50B5C 8004FF5C 30B000FF */   andi      $s0, $a1, 0xff
/* 50B60 8004FF60 8E620008 */  lw         $v0, 8($s3)
/* 50B64 8004FF64 10400056 */  beqz       $v0, .L800500C0
/* 50B68 8004FF68 00000000 */   nop
/* 50B6C 8004FF6C 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 50B70 8004FF70 8E841604 */   lw        $a0, 0x1604($s4)
/* 50B74 8004FF74 8E630008 */  lw         $v1, 8($s3)
/* 50B78 8004FF78 14620051 */  bne        $v1, $v0, .L800500C0
/* 50B7C 8004FF7C 24020003 */   addiu     $v0, $zero, 3
/* 50B80 8004FF80 1602004F */  bne        $s0, $v0, .L800500C0
/* 50B84 8004FF84 02402021 */   addu      $a0, $s2, $zero
/* 50B88 8004FF88 00002821 */  addu       $a1, $zero, $zero
/* 50B8C 8004FF8C 00003021 */  addu       $a2, $zero, $zero
/* 50B90 8004FF90 24070140 */  addiu      $a3, $zero, 0x140
/* 50B94 8004FF94 240200F0 */  addiu      $v0, $zero, 0xf0
/* 50B98 8004FF98 AFA20010 */  sw         $v0, 0x10($sp)
/* 50B9C 8004FF9C AFA00014 */  sw         $zero, 0x14($sp)
/* 50BA0 8004FFA0 AFA00018 */  sw         $zero, 0x18($sp)
/* 50BA4 8004FFA4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 50BA8 8004FFA8 0C002265 */  jal        some_video_setting_init
/* 50BAC 8004FFAC AFA00020 */   sw        $zero, 0x20($sp)
/* 50BB0 8004FFB0 0C0025B4 */  jal        get_hres
/* 50BB4 8004FFB4 00409021 */   addu      $s2, $v0, $zero
/* 50BB8 8004FFB8 0C0025B7 */  jal        get_vres
/* 50BBC 8004FFBC 00408021 */   addu      $s0, $v0, $zero
/* 50BC0 8004FFC0 02402021 */  addu       $a0, $s2, $zero
/* 50BC4 8004FFC4 24050005 */  addiu      $a1, $zero, 5
/* 50BC8 8004FFC8 02003021 */  addu       $a2, $s0, $zero
/* 50BCC 8004FFCC 0C0290ED */  jal        rsp_func
/* 50BD0 8004FFD0 00403821 */   addu      $a3, $v0, $zero
/* 50BD4 8004FFD4 0C0025B4 */  jal        get_hres
/* 50BD8 8004FFD8 00409021 */   addu      $s2, $v0, $zero
/* 50BDC 8004FFDC 02402021 */  addu       $a0, $s2, $zero
/* 50BE0 8004FFE0 8E8514D4 */  lw         $a1, 0x14d4($s4)
/* 50BE4 8004FFE4 4480B000 */  mtc1       $zero, $f22
/* 50BE8 8004FFE8 3C01800E */  lui        $at, %hi(D_800DDB28)
/* 50BEC 8004FFEC C434DB28 */  lwc1       $f20, %lo(D_800DDB28)($at)
/* 50BF0 8004FFF0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 50BF4 8004FFF4 AFA00010 */  sw         $zero, 0x10($sp)
/* 50BF8 8004FFF8 AFA00014 */  sw         $zero, 0x14($sp)
/* 50BFC 8004FFFC AFA20018 */  sw         $v0, 0x18($sp)
/* 50C00 80050000 92630014 */  lbu        $v1, 0x14($s3)
/* 50C04 80050004 92680015 */  lbu        $t0, 0x15($s3)
/* 50C08 80050008 92690016 */  lbu        $t1, 0x16($s3)
/* 50C0C 8005000C 926A0017 */  lbu        $t2, 0x17($s3)
/* 50C10 80050010 4406B000 */  mfc1       $a2, $f22
/* 50C14 80050014 4407B000 */  mfc1       $a3, $f22
/* 50C18 80050018 24020028 */  addiu      $v0, $zero, 0x28
/* 50C1C 8005001C AFA2001C */  sw         $v0, 0x1c($sp)
/* 50C20 80050020 E7B40020 */  swc1       $f20, 0x20($sp)
/* 50C24 80050024 E7B40024 */  swc1       $f20, 0x24($sp)
/* 50C28 80050028 AFA30028 */  sw         $v1, 0x28($sp)
/* 50C2C 8005002C AFA8002C */  sw         $t0, 0x2c($sp)
/* 50C30 80050030 AFA90030 */  sw         $t1, 0x30($sp)
/* 50C34 80050034 0C029188 */  jal        N64BorgImageDraw
/* 50C38 80050038 AFAA0034 */   sw        $t2, 0x34($sp)
/* 50C3C 8005003C 0C0025B7 */  jal        get_vres
/* 50C40 80050040 00409021 */   addu      $s2, $v0, $zero
/* 50C44 80050044 2442FFD8 */  addiu      $v0, $v0, -0x28
/* 50C48 80050048 4482C000 */  mtc1       $v0, $f24
/* 50C4C 8005004C 4680C620 */  cvt.s.w    $f24, $f24
/* 50C50 80050050 0C0025B7 */  jal        get_vres
/* 50C54 80050054 00000000 */   nop
/* 50C58 80050058 2450FFD8 */  addiu      $s0, $v0, -0x28
/* 50C5C 8005005C 0C0025B4 */  jal        get_hres
/* 50C60 80050060 3210FFFF */   andi      $s0, $s0, 0xffff
/* 50C64 80050064 0C0025B7 */  jal        get_vres
/* 50C68 80050068 3051FFFF */   andi      $s1, $v0, 0xffff
/* 50C6C 8005006C 8E8514D4 */  lw         $a1, 0x14d4($s4)
/* 50C70 80050070 4406B000 */  mfc1       $a2, $f22
/* 50C74 80050074 4407C000 */  mfc1       $a3, $f24
/* 50C78 80050078 92630014 */  lbu        $v1, 0x14($s3)
/* 50C7C 8005007C 92680015 */  lbu        $t0, 0x15($s3)
/* 50C80 80050080 92690016 */  lbu        $t1, 0x16($s3)
/* 50C84 80050084 926A0017 */  lbu        $t2, 0x17($s3)
/* 50C88 80050088 02402021 */  addu       $a0, $s2, $zero
/* 50C8C 8005008C AFA00010 */  sw         $zero, 0x10($sp)
/* 50C90 80050090 AFB00014 */  sw         $s0, 0x14($sp)
/* 50C94 80050094 AFB10018 */  sw         $s1, 0x18($sp)
/* 50C98 80050098 AFA2001C */  sw         $v0, 0x1c($sp)
/* 50C9C 8005009C E7B40020 */  swc1       $f20, 0x20($sp)
/* 50CA0 800500A0 E7B40024 */  swc1       $f20, 0x24($sp)
/* 50CA4 800500A4 AFA30028 */  sw         $v1, 0x28($sp)
/* 50CA8 800500A8 AFA8002C */  sw         $t0, 0x2c($sp)
/* 50CAC 800500AC AFA90030 */  sw         $t1, 0x30($sp)
/* 50CB0 800500B0 0C029188 */  jal        N64BorgImageDraw
/* 50CB4 800500B4 AFAA0034 */   sw        $t2, 0x34($sp)
/* 50CB8 800500B8 08014059 */  j          .L80050164
/* 50CBC 800500BC 00409021 */   addu      $s2, $v0, $zero
.L800500C0:
/* 50CC0 800500C0 0C0025B4 */  jal        get_hres
/* 50CC4 800500C4 00000000 */   nop
/* 50CC8 800500C8 0C0025B7 */  jal        get_vres
/* 50CCC 800500CC 00408021 */   addu      $s0, $v0, $zero
/* 50CD0 800500D0 02402021 */  addu       $a0, $s2, $zero
/* 50CD4 800500D4 24050005 */  addiu      $a1, $zero, 5
/* 50CD8 800500D8 02003021 */  addu       $a2, $s0, $zero
/* 50CDC 800500DC 0C0290ED */  jal        rsp_func
/* 50CE0 800500E0 00403821 */   addu      $a3, $v0, $zero
/* 50CE4 800500E4 44800000 */  mtc1       $zero, $f0
/* 50CE8 800500E8 8E650010 */  lw         $a1, 0x10($s3)
/* 50CEC 800500EC 3C01800E */  lui        $at, %hi(D_800DDB2C)
/* 50CF0 800500F0 C422DB2C */  lwc1       $f2, %lo(D_800DDB2C)($at)
/* 50CF4 800500F4 92630014 */  lbu        $v1, 0x14($s3)
/* 50CF8 800500F8 92670015 */  lbu        $a3, 0x15($s3)
/* 50CFC 800500FC 92680016 */  lbu        $t0, 0x16($s3)
/* 50D00 80050100 92690017 */  lbu        $t1, 0x17($s3)
/* 50D04 80050104 44060000 */  mfc1       $a2, $f0
/* 50D08 80050108 00402021 */  addu       $a0, $v0, $zero
/* 50D0C 8005010C E7A20010 */  swc1       $f2, 0x10($sp)
/* 50D10 80050110 E7A20014 */  swc1       $f2, 0x14($sp)
/* 50D14 80050114 AFA30018 */  sw         $v1, 0x18($sp)
/* 50D18 80050118 AFA7001C */  sw         $a3, 0x1c($sp)
/* 50D1C 8005011C AFA80020 */  sw         $t0, 0x20($sp)
/* 50D20 80050120 AFA90024 */  sw         $t1, 0x24($sp)
/* 50D24 80050124 0C0299A8 */  jal        pass_to_borg_image_draw
/* 50D28 80050128 00C03821 */   addu      $a3, $a2, $zero
/* 50D2C 8005012C 08014059 */  j          .L80050164
/* 50D30 80050130 00409021 */   addu      $s2, $v0, $zero
.L80050134:
/* 50D34 80050134 02402021 */  addu       $a0, $s2, $zero
/* 50D38 80050138 00002821 */  addu       $a1, $zero, $zero
/* 50D3C 8005013C 00003021 */  addu       $a2, $zero, $zero
/* 50D40 80050140 24070140 */  addiu      $a3, $zero, 0x140
/* 50D44 80050144 240200F0 */  addiu      $v0, $zero, 0xf0
/* 50D48 80050148 AFA20010 */  sw         $v0, 0x10($sp)
/* 50D4C 8005014C AFA00014 */  sw         $zero, 0x14($sp)
/* 50D50 80050150 AFA00018 */  sw         $zero, 0x18($sp)
/* 50D54 80050154 AFA0001C */  sw         $zero, 0x1c($sp)
/* 50D58 80050158 0C002265 */  jal        some_video_setting_init
/* 50D5C 8005015C AFA00020 */   sw        $zero, 0x20($sp)
/* 50D60 80050160 00409021 */  addu       $s2, $v0, $zero
.L80050164:
/* 50D64 80050164 02401021 */  addu       $v0, $s2, $zero
/* 50D68 80050168 8FBF004C */  lw         $ra, 0x4c($sp)
/* 50D6C 8005016C 8FB40048 */  lw         $s4, 0x48($sp)
/* 50D70 80050170 8FB30044 */  lw         $s3, 0x44($sp)
/* 50D74 80050174 8FB20040 */  lw         $s2, 0x40($sp)
/* 50D78 80050178 8FB1003C */  lw         $s1, 0x3c($sp)
/* 50D7C 8005017C 8FB00038 */  lw         $s0, 0x38($sp)
/* 50D80 80050180 D7B80060 */  ldc1       $f24, 0x60($sp)
/* 50D84 80050184 D7B60058 */  ldc1       $f22, 0x58($sp)
/* 50D88 80050188 D7B40050 */  ldc1       $f20, 0x50($sp)
/* 50D8C 8005018C 03E00008 */  jr         $ra
/* 50D90 80050190 27BD0068 */   addiu     $sp, $sp, 0x68

glabel ScreenFadeMode_3
/* 50D94 80050194 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 50D98 80050198 3C05800E */  lui        $a1, %hi(gGlobals)
/* 50D9C 8005019C 24A268A8 */  addiu      $v0, $a1, %lo(gGlobals)
/* 50DA0 800501A0 AFBE0078 */  sw         $fp, 0x78($sp)
/* 50DA4 800501A4 0080F021 */  addu       $fp, $a0, $zero
/* 50DA8 800501A8 AFBF007C */  sw         $ra, 0x7c($sp)
/* 50DAC 800501AC AFB70074 */  sw         $s7, 0x74($sp)
/* 50DB0 800501B0 AFB60070 */  sw         $s6, 0x70($sp)
/* 50DB4 800501B4 AFB5006C */  sw         $s5, 0x6c($sp)
/* 50DB8 800501B8 AFB40068 */  sw         $s4, 0x68($sp)
/* 50DBC 800501BC AFB30064 */  sw         $s3, 0x64($sp)
/* 50DC0 800501C0 AFB20060 */  sw         $s2, 0x60($sp)
/* 50DC4 800501C4 AFB1005C */  sw         $s1, 0x5c($sp)
/* 50DC8 800501C8 AFB00058 */  sw         $s0, 0x58($sp)
/* 50DCC 800501CC 90530040 */  lbu        $s3, 0x40($v0)
/* 50DD0 800501D0 3C02800F */  lui        $v0, %hi(some_screenfade_flag)
/* 50DD4 800501D4 00A0A821 */  addu       $s5, $a1, $zero
/* 50DD8 800501D8 0040B821 */  addu       $s7, $v0, $zero
/* 50DDC 800501DC 9043DB98 */  lbu        $v1, %lo(some_screenfade_flag)($v0)
/* 50DE0 800501E0 10600008 */  beqz       $v1, .L80050204
/* 50DE4 800501E4 8FD10000 */   lw        $s1, ($fp)
/* 50DE8 800501E8 0C013FB3 */  jal        set_screenshot_tint
/* 50DEC 800501EC 00000000 */   nop
/* 50DF0 800501F0 10400004 */  beqz       $v0, .L80050204
/* 50DF4 800501F4 00000000 */   nop
/* 50DF8 800501F8 0C013F80 */  jal        func_8004FE00
/* 50DFC 800501FC 00000000 */   nop
/* 50E00 80050200 A2E0DB98 */  sb         $zero, -0x2468($s7)
.L80050204:
/* 50E04 80050204 0C01417D */  jal        func_800505F4
/* 50E08 80050208 3C10800E */   lui       $s0, 0x800e
/* 50E0C 8005020C 02202021 */  addu       $a0, $s1, $zero
/* 50E10 80050210 00002821 */  addu       $a1, $zero, $zero
/* 50E14 80050214 00003021 */  addu       $a2, $zero, $zero
/* 50E18 80050218 24070140 */  addiu      $a3, $zero, 0x140
/* 50E1C 8005021C 240300F0 */  addiu      $v1, $zero, 0xf0
/* 50E20 80050220 0040B021 */  addu       $s6, $v0, $zero
/* 50E24 80050224 0C0023E5 */  jal        some_rsp_func
/* 50E28 80050228 AFA30010 */   sw        $v1, 0x10($sp)
/* 50E2C 8005022C 00408821 */  addu       $s1, $v0, $zero
/* 50E30 80050230 26147D6C */  addiu      $s4, $s0, 0x7d6c
/* 50E34 80050234 8E840140 */  lw         $a0, 0x140($s4)
/* 50E38 80050238 0C02DBF7 */  jal        func_800B6FDC
/* 50E3C 8005023C 32C500FF */   andi      $a1, $s6, 0xff
/* 50E40 80050240 92037D6C */  lbu        $v1, 0x7d6c($s0)
/* 50E44 80050244 00408021 */  addu       $s0, $v0, $zero
/* 50E48 80050248 2C62000F */  sltiu      $v0, $v1, 0xf
/* 50E4C 8005024C 10400096 */  beqz       $v0, .L800504A8
/* 50E50 80050250 3C02800E */   lui       $v0, %hi(D_800DDB30)
/* 50E54 80050254 2442DB30 */  addiu      $v0, $v0, %lo(D_800DDB30)
/* 50E58 80050258 00031880 */  sll        $v1, $v1, 2
/* 50E5C 8005025C 00621821 */  addu       $v1, $v1, $v0
/* 50E60 80050260 8C640000 */  lw         $a0, ($v1)
/* 50E64 80050264 00800008 */  jr         $a0
/* 50E68 80050268 00000000 */   nop
/* 50E6C 8005026C 02202021 */  addu       $a0, $s1, $zero
/* 50E70 80050270 0C013FC7 */  jal        draw_screenshot_background
/* 50E74 80050274 02002821 */   addu      $a1, $s0, $zero
/* 50E78 80050278 0C0025B4 */  jal        get_hres
/* 50E7C 8005027C 00408821 */   addu      $s1, $v0, $zero
/* 50E80 80050280 0C0025B7 */  jal        get_vres
/* 50E84 80050284 00408021 */   addu      $s0, $v0, $zero
/* 50E88 80050288 02202021 */  addu       $a0, $s1, $zero
/* 50E8C 8005028C 24050006 */  addiu      $a1, $zero, 6
/* 50E90 80050290 02003021 */  addu       $a2, $s0, $zero
/* 50E94 80050294 0C0290ED */  jal        rsp_func
/* 50E98 80050298 00403821 */   addu      $a3, $v0, $zero
/* 50E9C 8005029C 00402821 */  addu       $a1, $v0, $zero
/* 50EA0 800502A0 00003021 */  addu       $a2, $zero, $zero
/* 50EA4 800502A4 00003821 */  addu       $a3, $zero, $zero
/* 50EA8 800502A8 26A268A8 */  addiu      $v0, $s5, 0x68a8
/* 50EAC 800502AC 24030140 */  addiu      $v1, $zero, 0x140
/* 50EB0 800502B0 8C441604 */  lw         $a0, 0x1604($v0)
/* 50EB4 800502B4 240200F0 */  addiu      $v0, $zero, 0xf0
/* 50EB8 800502B8 AFA30010 */  sw         $v1, 0x10($sp)
/* 50EBC 800502BC 0C02DCCE */  jal        func_800B7338
/* 50EC0 800502C0 AFA20014 */   sw        $v0, 0x14($sp)
/* 50EC4 800502C4 0801412A */  j          .L800504A8
/* 50EC8 800502C8 00408821 */   addu      $s1, $v0, $zero
/* 50ECC 800502CC 3C03800F */  lui        $v1, %hi(D_800EDB99)
/* 50ED0 800502D0 24020001 */  addiu      $v0, $zero, 1
/* 50ED4 800502D4 A062DB99 */  sb         $v0, %lo(D_800EDB99)($v1)
/* 50ED8 800502D8 0801412A */  j          .L800504A8
/* 50EDC 800502DC 24130001 */   addiu     $s3, $zero, 1
/* 50EE0 800502E0 3C03800F */  lui        $v1, %hi(D_800EDB99)
/* 50EE4 800502E4 24020001 */  addiu      $v0, $zero, 1
/* 50EE8 800502E8 A062DB99 */  sb         $v0, %lo(D_800EDB99)($v1)
/* 50EEC 800502EC 0801412A */  j          .L800504A8
/* 50EF0 800502F0 00009821 */   addu      $s3, $zero, $zero
/* 50EF4 800502F4 24130001 */  addiu      $s3, $zero, 1
/* 50EF8 800502F8 3C02800F */  lui        $v0, %hi(D_800EDB99)
/* 50EFC 800502FC 24030001 */  addiu      $v1, $zero, 1
/* 50F00 80050300 26A468A8 */  addiu      $a0, $s5, 0x68a8
/* 50F04 80050304 A043DB99 */  sb         $v1, %lo(D_800EDB99)($v0)
/* 50F08 80050308 0801412A */  j          .L800504A8
/* 50F0C 8005030C A09313C8 */   sb        $s3, 0x13c8($a0)
/* 50F10 80050310 24130002 */  addiu      $s3, $zero, 2
/* 50F14 80050314 3C04800F */  lui        $a0, 0x800f
/* 50F18 80050318 3C06800E */  lui        $a2, %hi(combat_bytes)
/* 50F1C 8005031C 24C77C70 */  addiu      $a3, $a2, %lo(combat_bytes)
/* 50F20 80050320 90E50001 */  lbu        $a1, 1($a3)
/* 50F24 80050324 8E830038 */  lw         $v1, 0x38($s4)
/* 50F28 80050328 24020001 */  addiu      $v0, $zero, 1
/* 50F2C 8005032C A082DB99 */  sb         $v0, -0x2467($a0)
/* 50F30 80050330 1060005D */  beqz       $v1, .L800504A8
/* 50F34 80050334 A0C57C70 */   sb        $a1, 0x7c70($a2)
/* 50F38 80050338 30A300FF */  andi       $v1, $a1, 0xff
/* 50F3C 8005033C 24020014 */  addiu      $v0, $zero, 0x14
/* 50F40 80050340 1062005A */  beq        $v1, $v0, .L800504AC
/* 50F44 80050344 02202021 */   addu      $a0, $s1, $zero
/* 50F48 80050348 90E20083 */  lbu        $v0, 0x83($a3)
/* 50F4C 8005034C 0801412B */  j          .L800504AC
/* 50F50 80050350 A0C27C70 */   sb        $v0, 0x7c70($a2)
/* 50F54 80050354 26B268A8 */  addiu      $s2, $s5, 0x68a8
/* 50F58 80050358 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 50F5C 8005035C 8E441604 */   lw        $a0, 0x1604($s2)
/* 50F60 80050360 8E4314CC */  lw         $v1, 0x14cc($s2)
/* 50F64 80050364 5443001A */  bnel       $v0, $v1, .L800503D0
/* 50F68 80050368 26B268A8 */   addiu     $s2, $s5, 0x68a8
/* 50F6C 8005036C 10400017 */  beqz       $v0, .L800503CC
/* 50F70 80050370 02202021 */   addu      $a0, $s1, $zero
/* 50F74 80050374 0C013FC7 */  jal        draw_screenshot_background
/* 50F78 80050378 02002821 */   addu      $a1, $s0, $zero
/* 50F7C 8005037C 0C0025B4 */  jal        get_hres
/* 50F80 80050380 00408821 */   addu      $s1, $v0, $zero
/* 50F84 80050384 0C0025B7 */  jal        get_vres
/* 50F88 80050388 00408021 */   addu      $s0, $v0, $zero
/* 50F8C 8005038C 02202021 */  addu       $a0, $s1, $zero
/* 50F90 80050390 24050006 */  addiu      $a1, $zero, 6
/* 50F94 80050394 02003021 */  addu       $a2, $s0, $zero
/* 50F98 80050398 0C0290ED */  jal        rsp_func
/* 50F9C 8005039C 00403821 */   addu      $a3, $v0, $zero
/* 50FA0 800503A0 00402821 */  addu       $a1, $v0, $zero
/* 50FA4 800503A4 00003021 */  addu       $a2, $zero, $zero
/* 50FA8 800503A8 00003821 */  addu       $a3, $zero, $zero
/* 50FAC 800503AC 24020140 */  addiu      $v0, $zero, 0x140
/* 50FB0 800503B0 8E441604 */  lw         $a0, 0x1604($s2)
/* 50FB4 800503B4 240300F0 */  addiu      $v1, $zero, 0xf0
/* 50FB8 800503B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 50FBC 800503BC 0C02DCCE */  jal        func_800B7338
/* 50FC0 800503C0 AFA30014 */   sw        $v1, 0x14($sp)
/* 50FC4 800503C4 0801412A */  j          .L800504A8
/* 50FC8 800503C8 00408821 */   addu      $s1, $v0, $zero
.L800503CC:
/* 50FCC 800503CC 26B268A8 */  addiu      $s2, $s5, 0x68a8
.L800503D0:
/* 50FD0 800503D0 3C02800F */  lui        $v0, %hi(D_800EDB90)
/* 50FD4 800503D4 3C04800F */  lui        $a0, %hi(D_800EDB91)
/* 50FD8 800503D8 AE4014CC */  sw         $zero, 0x14cc($s2)
/* 50FDC 800503DC 9043DB90 */  lbu        $v1, %lo(D_800EDB90)($v0)
/* 50FE0 800503E0 9085DB91 */  lbu        $a1, %lo(D_800EDB91)($a0)
/* 50FE4 800503E4 24020007 */  addiu      $v0, $zero, 7
/* 50FE8 800503E8 A2420040 */  sb         $v0, 0x40($s2)
/* 50FEC 800503EC 24020006 */  addiu      $v0, $zero, 6
/* 50FF0 800503F0 A24314C4 */  sb         $v1, 0x14c4($s2)
/* 50FF4 800503F4 1462002C */  bne        $v1, $v0, .L800504A8
/* 50FF8 800503F8 A24500DC */   sb        $a1, 0xdc($s2)
/* 50FFC 800503FC 24130006 */  addiu      $s3, $zero, 6
/* 51000 80050400 0C026259 */  jal        passToMalloc
/* 51004 80050404 24040084 */   addiu     $a0, $zero, 0x84
/* 51008 80050408 00402021 */  addu       $a0, $v0, $zero
/* 5100C 8005040C 8E451604 */  lw         $a1, 0x1604($s2)
/* 51010 80050410 0C00D694 */  jal        make_pause_menu
/* 51014 80050414 24060001 */   addiu     $a2, $zero, 1
/* 51018 80050418 8E441604 */  lw         $a0, 0x1604($s2)
/* 5101C 8005041C 24050001 */  addiu      $a1, $zero, 1
/* 51020 80050420 0C02DBF7 */  jal        func_800B6FDC
/* 51024 80050424 AE820008 */   sw        $v0, 8($s4)
/* 51028 80050428 02202021 */  addu       $a0, $s1, $zero
/* 5102C 8005042C 0C013FC7 */  jal        draw_screenshot_background
/* 51030 80050430 02002821 */   addu      $a1, $s0, $zero
/* 51034 80050434 0C0025B4 */  jal        get_hres
/* 51038 80050438 00408821 */   addu      $s1, $v0, $zero
/* 5103C 8005043C 0C0025B7 */  jal        get_vres
/* 51040 80050440 00408021 */   addu      $s0, $v0, $zero
/* 51044 80050444 02202021 */  addu       $a0, $s1, $zero
/* 51048 80050448 24050006 */  addiu      $a1, $zero, 6
/* 5104C 8005044C 02003021 */  addu       $a2, $s0, $zero
/* 51050 80050450 0C0290ED */  jal        rsp_func
/* 51054 80050454 00403821 */   addu      $a3, $v0, $zero
/* 51058 80050458 00402821 */  addu       $a1, $v0, $zero
/* 5105C 8005045C 00003021 */  addu       $a2, $zero, $zero
/* 51060 80050460 00003821 */  addu       $a3, $zero, $zero
/* 51064 80050464 24020140 */  addiu      $v0, $zero, 0x140
/* 51068 80050468 8E441604 */  lw         $a0, 0x1604($s2)
/* 5106C 8005046C 240300F0 */  addiu      $v1, $zero, 0xf0
/* 51070 80050470 AFA20010 */  sw         $v0, 0x10($sp)
/* 51074 80050474 0C02DCCE */  jal        func_800B7338
/* 51078 80050478 AFA30014 */   sw        $v1, 0x14($sp)
/* 5107C 8005047C 0801412A */  j          .L800504A8
/* 51080 80050480 00408821 */   addu      $s1, $v0, $zero
/* 51084 80050484 3C03800F */  lui        $v1, %hi(D_800EDB99)
/* 51088 80050488 24020001 */  addiu      $v0, $zero, 1
/* 5108C 8005048C A062DB99 */  sb         $v0, %lo(D_800EDB99)($v1)
/* 51090 80050490 0801412A */  j          .L800504A8
/* 51094 80050494 2413000E */   addiu     $s3, $zero, 0xe
/* 51098 80050498 02202021 */  addu       $a0, $s1, $zero
/* 5109C 8005049C 0C013FC7 */  jal        draw_screenshot_background
/* 510A0 800504A0 02002821 */   addu      $a1, $s0, $zero
/* 510A4 800504A4 00408821 */  addu       $s1, $v0, $zero
.L800504A8:
/* 510A8 800504A8 02202021 */  addu       $a0, $s1, $zero
.L800504AC:
/* 510AC 800504AC 0C00B703 */  jal        func_with_debug_queue
/* 510B0 800504B0 02C02821 */   addu      $a1, $s6, $zero
/* 510B4 800504B4 00408821 */  addu       $s1, $v0, $zero
/* 510B8 800504B8 26A568A8 */  addiu      $a1, $s5, 0x68a8
/* 510BC 800504BC 44800000 */  mtc1       $zero, $f0
/* 510C0 800504C0 8CA200A8 */  lw         $v0, 0xa8($a1)
/* 510C4 800504C4 27B00018 */  addiu      $s0, $sp, 0x18
/* 510C8 800504C8 E7A00020 */  swc1       $f0, 0x20($sp)
/* 510CC 800504CC E7A0001C */  swc1       $f0, 0x1c($sp)
/* 510D0 800504D0 10400002 */  beqz       $v0, .L800504DC
/* 510D4 800504D4 E7A00018 */   swc1      $f0, 0x18($sp)
/* 510D8 800504D8 24500068 */  addiu      $s0, $v0, 0x68
.L800504DC:
/* 510DC 800504DC 8CA21010 */  lw         $v0, 0x1010($a1)
/* 510E0 800504E0 10400018 */  beqz       $v0, .L80050544
/* 510E4 800504E4 3C02800E */   lui       $v0, 0x800e
/* 510E8 800504E8 C4A22058 */  lwc1       $f2, 0x2058($a1)
/* 510EC 800504EC 3C01800E */  lui        $at, %hi(D_800DDB6C)
/* 510F0 800504F0 C420DB6C */  lwc1       $f0, %lo(D_800DDB6C)($at)
/* 510F4 800504F4 46001002 */  mul.s      $f0, $f2, $f0
/* 510F8 800504F8 3C01800E */  lui        $at, %hi(D_800DDB70)
/* 510FC 800504FC C422DB70 */  lwc1       $f2, %lo(D_800DDB70)($at)
/* 51100 80050500 4600103E */  c.le.s     $f2, $f0
/* 51104 80050504 00000000 */  nop
/* 51108 80050508 45010005 */  bc1t       .L80050520
/* 5110C 8005050C 90A41018 */   lbu       $a0, 0x1018($a1)
/* 51110 80050510 4600008D */  trunc.w.s  $f2, $f0
/* 51114 80050514 44061000 */  mfc1       $a2, $f2
/* 51118 80050518 0801414E */  j          .L80050538
/* 5111C 8005051C 8CA51014 */   lw        $a1, 0x1014($a1)
.L80050520:
/* 51120 80050520 46020001 */  sub.s      $f0, $f0, $f2
/* 51124 80050524 4600008D */  trunc.w.s  $f2, $f0
/* 51128 80050528 44061000 */  mfc1       $a2, $f2
/* 5112C 8005052C 3C028000 */  lui        $v0, 0x8000
/* 51130 80050530 00C23025 */  or         $a2, $a2, $v0
/* 51134 80050534 8CA51014 */  lw         $a1, 0x1014($a1)
.L80050538:
/* 51138 80050538 0C0268D2 */  jal        some_music_func
/* 5113C 8005053C 30C600FF */   andi      $a2, $a2, 0xff
/* 51140 80050540 3C02800E */  lui        $v0, %hi(SFXStruct)
.L80050544:
/* 51144 80050544 24527BA0 */  addiu      $s2, $v0, %lo(SFXStruct)
/* 51148 80050548 02402021 */  addu       $a0, $s2, $zero
/* 5114C 8005054C 02002821 */  addu       $a1, $s0, $zero
/* 51150 80050550 0C0159CB */  jal        ProcessAudioBubbles
/* 51154 80050554 24060001 */   addiu     $a2, $zero, 1
/* 51158 80050558 3C03800F */  lui        $v1, %hi(D_800EDB99)
/* 5115C 8005055C 9062DB99 */  lbu        $v0, %lo(D_800EDB99)($v1)
/* 51160 80050560 10400017 */  beqz       $v0, .L800505C0
/* 51164 80050564 8FBF007C */   lw        $ra, 0x7c($sp)
/* 51168 80050568 8E4501DC */  lw         $a1, 0x1dc($s2)
/* 5116C 8005056C 10A0000B */  beqz       $a1, .L8005059C
/* 51170 80050570 2650032C */   addiu     $s0, $s2, 0x32c
/* 51174 80050574 02002021 */  addu       $a0, $s0, $zero
/* 51178 80050578 24A50014 */  addiu      $a1, $a1, 0x14
/* 5117C 8005057C 24060007 */  addiu      $a2, $zero, 7
/* 51180 80050580 0C035867 */  jal        AllocFreeQueueItem
/* 51184 80050584 00003821 */   addu      $a3, $zero, $zero
/* 51188 80050588 02002021 */  addu       $a0, $s0, $zero
/* 5118C 8005058C 264501DC */  addiu      $a1, $s2, 0x1dc
/* 51190 80050590 24060007 */  addiu      $a2, $zero, 7
/* 51194 80050594 0C035867 */  jal        AllocFreeQueueItem
/* 51198 80050598 00003821 */   addu      $a3, $zero, $zero
.L8005059C:
/* 5119C 8005059C 0C007916 */  jal        questdata_free
/* 511A0 800505A0 00000000 */   nop
/* 511A4 800505A4 0C0141F6 */  jal        func_clearing_shopkeep
/* 511A8 800505A8 00000000 */   nop
/* 511AC 800505AC 24020001 */  addiu      $v0, $zero, 1
/* 511B0 800505B0 A2E2DB98 */  sb         $v0, -0x2468($s7)
/* 511B4 800505B4 3C02800F */  lui        $v0, %hi(D_800EDB99)
/* 511B8 800505B8 A040DB99 */  sb         $zero, %lo(D_800EDB99)($v0)
/* 511BC 800505BC 8FBF007C */  lw         $ra, 0x7c($sp)
.L800505C0:
/* 511C0 800505C0 02601021 */  addu       $v0, $s3, $zero
/* 511C4 800505C4 AFD10000 */  sw         $s1, ($fp)
/* 511C8 800505C8 8FBE0078 */  lw         $fp, 0x78($sp)
/* 511CC 800505CC 8FB70074 */  lw         $s7, 0x74($sp)
/* 511D0 800505D0 8FB60070 */  lw         $s6, 0x70($sp)
/* 511D4 800505D4 8FB5006C */  lw         $s5, 0x6c($sp)
/* 511D8 800505D8 8FB40068 */  lw         $s4, 0x68($sp)
/* 511DC 800505DC 8FB30064 */  lw         $s3, 0x64($sp)
/* 511E0 800505E0 8FB20060 */  lw         $s2, 0x60($sp)
/* 511E4 800505E4 8FB1005C */  lw         $s1, 0x5c($sp)
/* 511E8 800505E8 8FB00058 */  lw         $s0, 0x58($sp)
/* 511EC 800505EC 03E00008 */  jr         $ra
/* 511F0 800505F0 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_800505F4
/* 511F4 800505F4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 511F8 800505F8 AFB00018 */  sw         $s0, 0x18($sp)
/* 511FC 800505FC 3C10800F */  lui        $s0, %hi(D_800EDB94)
/* 51200 80050600 8E02DB94 */  lw         $v0, %lo(D_800EDB94)($s0)
/* 51204 80050604 AFB30024 */  sw         $s3, 0x24($sp)
/* 51208 80050608 00009821 */  addu       $s3, $zero, $zero
/* 5120C 8005060C AFB20020 */  sw         $s2, 0x20($sp)
/* 51210 80050610 3C12800E */  lui        $s2, 0x800e
/* 51214 80050614 AFBF002C */  sw         $ra, 0x2c($sp)
/* 51218 80050618 AFB40028 */  sw         $s4, 0x28($sp)
/* 5121C 8005061C 10400009 */  beqz       $v0, .L80050644
/* 51220 80050620 AFB1001C */   sw        $s1, 0x1c($sp)
/* 51224 80050624 0C01422D */  jal        func_800508B4
/* 51228 80050628 24040004 */   addiu     $a0, $zero, 4
/* 5122C 8005062C 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 51230 80050630 8C4414CC */  lw         $a0, 0x14cc($v0)
/* 51234 80050634 2403000C */  addiu      $v1, $zero, 0xc
/* 51238 80050638 AE00DB94 */  sw         $zero, -0x246c($s0)
/* 5123C 8005063C A04314C4 */  sb         $v1, 0x14c4($v0)
/* 51240 80050640 AC4414C8 */  sw         $a0, 0x14c8($v0)
.L80050644:
/* 51244 80050644 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 51248 80050648 904414C4 */  lbu        $a0, 0x14c4($v0)
/* 5124C 8005064C 2403000C */  addiu      $v1, $zero, 0xc
/* 51250 80050650 10830059 */  beq        $a0, $v1, .L800507B8
/* 51254 80050654 24020001 */   addiu     $v0, $zero, 1
/* 51258 80050658 3C02800F */  lui        $v0, %hi(D_800ED580)
/* 5125C 8005065C AC40D580 */  sw         $zero, %lo(D_800ED580)($v0)
/* 51260 80050660 080141DF */  j          .L8005077C
/* 51264 80050664 27B40010 */   addiu     $s4, $sp, 0x10
.L80050668:
/* 51268 80050668 8E041604 */  lw         $a0, 0x1604($s0)
/* 5126C 8005066C 0C02DC69 */  jal        run_widget_control_func
/* 51270 80050670 8FA50010 */   lw        $a1, 0x10($sp)
/* 51274 80050674 00408821 */  addu       $s1, $v0, $zero
/* 51278 80050678 1220003D */  beqz       $s1, .L80050770
/* 5127C 8005067C 3C02800F */   lui       $v0, %hi(freeWidgetFunc)
/* 51280 80050680 8C42D500 */  lw         $v0, %lo(freeWidgetFunc)($v0)
/* 51284 80050684 10400005 */  beqz       $v0, .L8005069C
/* 51288 80050688 3C03800F */   lui       $v1, 0x800f
/* 5128C 8005068C 0040F809 */  jalr       $v0
/* 51290 80050690 02202021 */   addu      $a0, $s1, $zero
/* 51294 80050694 080141E0 */  j          .L80050780
/* 51298 80050698 02802021 */   addu      $a0, $s4, $zero
.L8005069C:
/* 5129C 8005069C 920414C4 */  lbu        $a0, 0x14c4($s0)
/* 512A0 800506A0 920200DC */  lbu        $v0, 0xdc($s0)
/* 512A4 800506A4 2484FFFD */  addiu      $a0, $a0, -3
/* 512A8 800506A8 A062DB91 */  sb         $v0, -0x246f($v1)
/* 512AC 800506AC 2C820005 */  sltiu      $v0, $a0, 5
/* 512B0 800506B0 1040002B */  beqz       $v0, .L80050760
/* 512B4 800506B4 00602821 */   addu      $a1, $v1, $zero
/* 512B8 800506B8 3C02800E */  lui        $v0, %hi(D_800DDB78)
/* 512BC 800506BC 2442DB78 */  addiu      $v0, $v0, %lo(D_800DDB78)
/* 512C0 800506C0 00041880 */  sll        $v1, $a0, 2
/* 512C4 800506C4 00621821 */  addu       $v1, $v1, $v0
/* 512C8 800506C8 8C640000 */  lw         $a0, ($v1)
/* 512CC 800506CC 00800008 */  jr         $a0
/* 512D0 800506D0 00000000 */   nop
/* 512D4 800506D4 0C014264 */  jal        func_80050990
/* 512D8 800506D8 02202021 */   addu      $a0, $s1, $zero
/* 512DC 800506DC 080141D9 */  j          .L80050764
/* 512E0 800506E0 264368A8 */   addiu     $v1, $s2, 0x68a8
/* 512E4 800506E4 0C01422D */  jal        func_800508B4
/* 512E8 800506E8 9624005E */   lhu       $a0, 0x5e($s1)
/* 512EC 800506EC 080141D9 */  j          .L80050764
/* 512F0 800506F0 264368A8 */   addiu     $v1, $s2, 0x68a8
/* 512F4 800506F4 265068A8 */  addiu      $s0, $s2, 0x68a8
/* 512F8 800506F8 3C03800F */  lui        $v1, %hi(D_800EDB90)
/* 512FC 800506FC 8E0414CC */  lw         $a0, 0x14cc($s0)
/* 51300 80050700 24020006 */  addiu      $v0, $zero, 6
/* 51304 80050704 0C00D7F7 */  jal        bigAssOpenCallback_2
/* 51308 80050708 A062DB90 */   sb        $v0, %lo(D_800EDB90)($v1)
/* 5130C 8005070C 2402000F */  addiu      $v0, $zero, 0xf
/* 51310 80050710 24030007 */  addiu      $v1, $zero, 7
/* 51314 80050714 A20213C8 */  sb         $v0, 0x13c8($s0)
/* 51318 80050718 080141D8 */  j          .L80050760
/* 5131C 8005071C A2030040 */   sb        $v1, 0x40($s0)
/* 51320 80050720 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 51324 80050724 8C4414CC */  lw         $a0, 0x14cc($v0)
/* 51328 80050728 24030003 */  addiu      $v1, $zero, 3
/* 5132C 8005072C A0A3DB91 */  sb         $v1, -0x246f($a1)
/* 51330 80050730 3C05800F */  lui        $a1, %hi(D_800EDB90)
/* 51334 80050734 2402000A */  addiu      $v0, $zero, 0xa
/* 51338 80050738 0C00D7F7 */  jal        bigAssOpenCallback_2
/* 5133C 8005073C A0A2DB90 */   sb        $v0, %lo(D_800EDB90)($a1)
/* 51340 80050740 080141D9 */  j          .L80050764
/* 51344 80050744 264368A8 */   addiu     $v1, $s2, 0x68a8
/* 51348 80050748 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 5134C 8005074C 3C03800F */  lui        $v1, %hi(D_800EDB90)
/* 51350 80050750 8C4414CC */  lw         $a0, 0x14cc($v0)
/* 51354 80050754 24020009 */  addiu      $v0, $zero, 9
/* 51358 80050758 0C00D7F7 */  jal        bigAssOpenCallback_2
/* 5135C 8005075C A062DB90 */   sb        $v0, %lo(D_800EDB90)($v1)
.L80050760:
/* 51360 80050760 264368A8 */  addiu      $v1, $s2, 0x68a8
.L80050764:
/* 51364 80050764 2402000C */  addiu      $v0, $zero, 0xc
/* 51368 80050768 AC7114C8 */  sw         $s1, 0x14c8($v1)
/* 5136C 8005076C A06214C4 */  sb         $v0, 0x14c4($v1)
.L80050770:
/* 51370 80050770 26620001 */  addiu      $v0, $s3, 1
/* 51374 80050774 00021400 */  sll        $v0, $v0, 0x10
/* 51378 80050778 00029C03 */  sra        $s3, $v0, 0x10
.L8005077C:
/* 5137C 8005077C 02802021 */  addu       $a0, $s4, $zero
.L80050780:
/* 51380 80050780 0C02713D */  jal        get_cont_aidyn
/* 51384 80050784 00002821 */   addu      $a1, $zero, $zero
/* 51388 80050788 1440FFB7 */  bnez       $v0, .L80050668
/* 5138C 8005078C 265068A8 */   addiu     $s0, $s2, 0x68a8
/* 51390 80050790 5A600001 */  blezl      $s3, .L80050798
/* 51394 80050794 24130001 */   addiu     $s3, $zero, 1
.L80050798:
/* 51398 80050798 2A620007 */  slti       $v0, $s3, 7
/* 5139C 8005079C 50400001 */  beql       $v0, $zero, .L800507A4
/* 513A0 800507A0 24130006 */   addiu     $s3, $zero, 6
.L800507A4:
/* 513A4 800507A4 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 513A8 800507A8 44930000 */  mtc1       $s3, $f0
/* 513AC 800507AC 46800020 */  cvt.s.w    $f0, $f0
/* 513B0 800507B0 E440000C */  swc1       $f0, 0xc($v0)
/* 513B4 800507B4 02601021 */  addu       $v0, $s3, $zero
.L800507B8:
/* 513B8 800507B8 8FBF002C */  lw         $ra, 0x2c($sp)
/* 513BC 800507BC 8FB40028 */  lw         $s4, 0x28($sp)
/* 513C0 800507C0 8FB30024 */  lw         $s3, 0x24($sp)
/* 513C4 800507C4 8FB20020 */  lw         $s2, 0x20($sp)
/* 513C8 800507C8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 513CC 800507CC 8FB00018 */  lw         $s0, 0x18($sp)
/* 513D0 800507D0 03E00008 */  jr         $ra
/* 513D4 800507D4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_clearing_shopkeep
/* 513D8 800507D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 513DC 800507DC 3C03800F */  lui        $v1, %hi(some_combat_flag_)
/* 513E0 800507E0 8C649B60 */  lw         $a0, %lo(some_combat_flag_)($v1)
/* 513E4 800507E4 3C02800E */  lui        $v0, %hi(someCase_1)
/* 513E8 800507E8 AFB00010 */  sw         $s0, 0x10($sp)
/* 513EC 800507EC 24507D6C */  addiu      $s0, $v0, %lo(someCase_1)
/* 513F0 800507F0 14800008 */  bnez       $a0, .L80050814
/* 513F4 800507F4 AFBF0014 */   sw        $ra, 0x14($sp)
/* 513F8 800507F8 3C02800F */  lui        $v0, %hi(D_800E9AC0)
/* 513FC 800507FC 8C439AC0 */  lw         $v1, %lo(D_800E9AC0)($v0)
/* 51400 80050800 14600005 */  bnez       $v1, .L80050818
/* 51404 80050804 3C02800F */   lui       $v0, 0x800f
/* 51408 80050808 2604FE34 */  addiu      $a0, $s0, -0x1cc
/* 5140C 8005080C 0C015871 */  jal        func_800561C4
/* 51410 80050810 24050001 */   addiu     $a1, $zero, 1
.L80050814:
/* 51414 80050814 3C02800F */  lui        $v0, %hi(D_800ED620)
.L80050818:
/* 51418 80050818 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5141C 8005081C AC40D620 */  sw         $zero, %lo(D_800ED620)($v0)
/* 51420 80050820 3C02800F */  lui        $v0, %hi(D_800E9C14)
/* 51424 80050824 94449C14 */  lhu        $a0, %lo(D_800E9C14)($v0)
/* 51428 80050828 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 5142C 8005082C 14800007 */  bnez       $a0, .L8005084C
/* 51430 80050830 A46000DE */   sh        $zero, 0xde($v1)
/* 51434 80050834 84640372 */  lh         $a0, 0x372($v1)
/* 51438 80050838 84650374 */  lh         $a1, 0x374($v1)
/* 5143C 8005083C 3C03800F */  lui        $v1, %hi(no_TP_vec3)
/* 51440 80050840 24020001 */  addiu      $v0, $zero, 1
/* 51444 80050844 0C0038A1 */  jal        loadGameBorgScenes
/* 51448 80050848 A4628DC2 */   sh        $v0, %lo(no_TP_vec3)($v1)
.L8005084C:
/* 5144C 8005084C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 51450 80050850 AE000038 */  sw         $zero, 0x38($s0)
/* 51454 80050854 8FB00010 */  lw         $s0, 0x10($sp)
/* 51458 80050858 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 5145C 8005085C AC40D500 */  sw         $zero, %lo(freeWidgetFunc)($v0)
/* 51460 80050860 03E00008 */  jr         $ra
/* 51464 80050864 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80050868
/* 51468 80050868 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5146C 8005086C 3C04800F */  lui        $a0, %hi(D_800EDB94)
/* 51470 80050870 24020001 */  addiu      $v0, $zero, 1
/* 51474 80050874 2403003C */  addiu      $v1, $zero, 0x3c
/* 51478 80050878 AC82DB94 */  sw         $v0, %lo(D_800EDB94)($a0)
/* 5147C 8005087C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 51480 80050880 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 51484 80050884 24050740 */  addiu      $a1, $zero, 0x740
/* 51488 80050888 3C073F80 */  lui        $a3, 0x3f80
/* 5148C 8005088C 00003021 */  addu       $a2, $zero, $zero
/* 51490 80050890 AFBF0018 */  sw         $ra, 0x18($sp)
/* 51494 80050894 AFA30010 */  sw         $v1, 0x10($sp)
/* 51498 80050898 0C0156F4 */  jal        play_SFX
/* 5149C 8005089C AFA00014 */   sw        $zero, 0x14($sp)
/* 514A0 800508A0 0C0089E4 */  jal        func_80022790
/* 514A4 800508A4 00000000 */   nop
/* 514A8 800508A8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 514AC 800508AC 03E00008 */  jr         $ra
/* 514B0 800508B0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800508B4
/* 514B4 800508B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 514B8 800508B8 3084FFFF */  andi       $a0, $a0, 0xffff
/* 514BC 800508BC 2483FFFF */  addiu      $v1, $a0, -1
/* 514C0 800508C0 2C620005 */  sltiu      $v0, $v1, 5
/* 514C4 800508C4 10400026 */  beqz       $v0, .L80050960
/* 514C8 800508C8 AFBF0010 */   sw        $ra, 0x10($sp)
/* 514CC 800508CC 3C02800E */  lui        $v0, %hi(D_800DDB90)
/* 514D0 800508D0 2442DB90 */  addiu      $v0, $v0, %lo(D_800DDB90)
/* 514D4 800508D4 00031880 */  sll        $v1, $v1, 2
/* 514D8 800508D8 00621821 */  addu       $v1, $v1, $v0
/* 514DC 800508DC 8C640000 */  lw         $a0, ($v1)
/* 514E0 800508E0 00800008 */  jr         $a0
/* 514E4 800508E4 00000000 */   nop
/* 514E8 800508E8 3C03800F */  lui        $v1, %hi(D_800EDB91)
/* 514EC 800508EC 24020011 */  addiu      $v0, $zero, 0x11
/* 514F0 800508F0 3C04800F */  lui        $a0, %hi(D_800EDB90)
/* 514F4 800508F4 A062DB91 */  sb         $v0, %lo(D_800EDB91)($v1)
/* 514F8 800508F8 24020008 */  addiu      $v0, $zero, 8
/* 514FC 800508FC 0801425E */  j          .L80050978
/* 51500 80050900 A082DB90 */   sb        $v0, %lo(D_800EDB90)($a0)
/* 51504 80050904 3C03800F */  lui        $v1, %hi(D_800EDB90)
/* 51508 80050908 2402000A */  addiu      $v0, $zero, 0xa
/* 5150C 8005090C 3C04800F */  lui        $a0, 0x800f
/* 51510 80050910 A062DB90 */  sb         $v0, %lo(D_800EDB90)($v1)
/* 51514 80050914 0801425D */  j          .L80050974
/* 51518 80050918 24020016 */   addiu     $v0, $zero, 0x16
/* 5151C 8005091C 3C03800F */  lui        $v1, %hi(D_800EDB91)
/* 51520 80050920 24020012 */  addiu      $v0, $zero, 0x12
/* 51524 80050924 3C04800F */  lui        $a0, %hi(D_800EDB90)
/* 51528 80050928 A062DB91 */  sb         $v0, %lo(D_800EDB91)($v1)
/* 5152C 8005092C 2402000B */  addiu      $v0, $zero, 0xb
/* 51530 80050930 0801425E */  j          .L80050978
/* 51534 80050934 A082DB90 */   sb        $v0, %lo(D_800EDB90)($a0)
/* 51538 80050938 3C03800F */  lui        $v1, 0x800f
/* 5153C 8005093C 08014253 */  j          .L8005094C
/* 51540 80050940 24020004 */   addiu     $v0, $zero, 4
/* 51544 80050944 3C03800F */  lui        $v1, %hi(D_800EDB91)
/* 51548 80050948 24020019 */  addiu      $v0, $zero, 0x19
.L8005094C:
/* 5154C 8005094C 3C04800F */  lui        $a0, %hi(D_800EDB90)
/* 51550 80050950 A062DB91 */  sb         $v0, %lo(D_800EDB91)($v1)
/* 51554 80050954 2402000A */  addiu      $v0, $zero, 0xa
/* 51558 80050958 0801425E */  j          .L80050978
/* 5155C 8005095C A082DB90 */   sb        $v0, %lo(D_800EDB90)($a0)
.L80050960:
/* 51560 80050960 3C03800F */  lui        $v1, %hi(D_800EDB90)
/* 51564 80050964 2402000A */  addiu      $v0, $zero, 0xa
/* 51568 80050968 3C04800F */  lui        $a0, %hi(D_800EDB91)
/* 5156C 8005096C A062DB90 */  sb         $v0, %lo(D_800EDB90)($v1)
/* 51570 80050970 24020003 */  addiu      $v0, $zero, 3
.L80050974:
/* 51574 80050974 A082DB91 */  sb         $v0, %lo(D_800EDB91)($a0)
.L80050978:
/* 51578 80050978 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 5157C 8005097C 0C00D7F7 */  jal        bigAssOpenCallback_2
/* 51580 80050980 8C447D74 */   lw        $a0, %lo(bigAssMenu)($v0)
/* 51584 80050984 8FBF0010 */  lw         $ra, 0x10($sp)
/* 51588 80050988 03E00008 */  jr         $ra
/* 5158C 8005098C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80050990
/* 51590 80050990 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 51594 80050994 3C03800F */  lui        $v1, %hi(D_800EDB91)
/* 51598 80050998 24020003 */  addiu      $v0, $zero, 3
/* 5159C 8005099C AFB10014 */  sw         $s1, 0x14($sp)
/* 515A0 800509A0 00808821 */  addu       $s1, $a0, $zero
/* 515A4 800509A4 A062DB91 */  sb         $v0, %lo(D_800EDB91)($v1)
/* 515A8 800509A8 3C03800F */  lui        $v1, 0x800f
/* 515AC 800509AC AFB00010 */  sw         $s0, 0x10($sp)
/* 515B0 800509B0 3C10800E */  lui        $s0, %hi(gGlobals)
/* 515B4 800509B4 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 515B8 800509B8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 515BC 800509BC 8E0414CC */  lw         $a0, 0x14cc($s0)
/* 515C0 800509C0 2402000A */  addiu      $v0, $zero, 0xa
/* 515C4 800509C4 0C00D7F7 */  jal        bigAssOpenCallback_2
/* 515C8 800509C8 A062DB90 */   sb        $v0, -0x2470($v1)
/* 515CC 800509CC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 515D0 800509D0 AE1114C8 */  sw         $s1, 0x14c8($s0)
/* 515D4 800509D4 8FB10014 */  lw         $s1, 0x14($sp)
/* 515D8 800509D8 2402000C */  addiu      $v0, $zero, 0xc
/* 515DC 800509DC A20214C4 */  sb         $v0, 0x14c4($s0)
/* 515E0 800509E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 515E4 800509E4 03E00008 */  jr         $ra
/* 515E8 800509E8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel passto_getSnapshot
/* 515EC 800509EC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 515F0 800509F0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 515F4 800509F4 0C0095D1 */  jal        GetSnapshot_
/* 515F8 800509F8 00000000 */   nop
/* 515FC 800509FC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 51600 80050A00 03E00008 */  jr         $ra
/* 51604 80050A04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_shopkeep_skills
/* 51608 80050A08 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5160C 80050A0C AFB00010 */  sw         $s0, 0x10($sp)
/* 51610 80050A10 00808021 */  addu       $s0, $a0, $zero
/* 51614 80050A14 AFB10014 */  sw         $s1, 0x14($sp)
/* 51618 80050A18 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5161C 80050A1C 0C0095D1 */  jal        GetSnapshot_
/* 51620 80050A20 00A08821 */   addu      $s1, $a1, $zero
/* 51624 80050A24 3C03800E */  lui        $v1, %hi(gGlobals)
/* 51628 80050A28 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5162C 80050A2C 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 51630 80050A30 AC7114E0 */  sw         $s1, 0x14e0($v1)
/* 51634 80050A34 8FB10014 */  lw         $s1, 0x14($sp)
/* 51638 80050A38 AC7014E8 */  sw         $s0, 0x14e8($v1)
/* 5163C 80050A3C 8FB00010 */  lw         $s0, 0x10($sp)
/* 51640 80050A40 03E00008 */  jr         $ra
/* 51644 80050A44 27BD0020 */   addiu     $sp, $sp, 0x20

glabel build_loot_menu
/* 51648 80050A48 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5164C 80050A4C AFB3001C */  sw         $s3, 0x1c($sp)
/* 51650 80050A50 00809821 */  addu       $s3, $a0, $zero
/* 51654 80050A54 AFB20018 */  sw         $s2, 0x18($sp)
/* 51658 80050A58 00A09021 */  addu       $s2, $a1, $zero
/* 5165C 80050A5C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 51660 80050A60 AFB00010 */  sw         $s0, 0x10($sp)
/* 51664 80050A64 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 51668 80050A68 AFBF0020 */  sw         $ra, 0x20($sp)
/* 5166C 80050A6C AFB10014 */  sw         $s1, 0x14($sp)
/* 51670 80050A70 8E0314D4 */  lw         $v1, 0x14d4($s0)
/* 51674 80050A74 14600003 */  bnez       $v1, .L80050A84
/* 51678 80050A78 30D1FFFF */   andi      $s1, $a2, 0xffff
/* 5167C 80050A7C 0C0095D1 */  jal        GetSnapshot_
/* 51680 80050A80 00000000 */   nop
.L80050A84:
/* 51684 80050A84 3402FFFF */  ori        $v0, $zero, 0xffff
/* 51688 80050A88 A61114F0 */  sh         $s1, 0x14f0($s0)
/* 5168C 80050A8C AE1314EC */  sw         $s3, 0x14ec($s0)
/* 51690 80050A90 16220005 */  bne        $s1, $v0, .L80050AA8
/* 51694 80050A94 AE1214F4 */   sw        $s2, 0x14f4($s0)
/* 51698 80050A98 8E0315F8 */  lw         $v1, 0x15f8($s0)
/* 5169C 80050A9C 8C620014 */  lw         $v0, 0x14($v1)
/* 516A0 80050AA0 00521021 */  addu       $v0, $v0, $s2
/* 516A4 80050AA4 AC620014 */  sw         $v0, 0x14($v1)
.L80050AA8:
/* 516A8 80050AA8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 516AC 80050AAC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 516B0 80050AB0 8FB20018 */  lw         $s2, 0x18($sp)
/* 516B4 80050AB4 8FB10014 */  lw         $s1, 0x14($sp)
/* 516B8 80050AB8 8FB00010 */  lw         $s0, 0x10($sp)
/* 516BC 80050ABC 03E00008 */  jr         $ra
/* 516C0 80050AC0 27BD0028 */   addiu     $sp, $sp, 0x28
/* 516C4 80050AC4 00000000 */  nop
/* 516C8 80050AC8 00000000 */  nop
/* 516CC 80050ACC 00000000 */  nop
