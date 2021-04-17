.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel menu_with_spells
/* 40A90 8003FE90 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 40A94 8003FE94 AFB20070 */  sw         $s2, 0x70($sp)
/* 40A98 8003FE98 00809021 */  addu       $s2, $a0, $zero
/* 40A9C 8003FE9C AFB00068 */  sw         $s0, 0x68($sp)
/* 40AA0 8003FEA0 00A08021 */  addu       $s0, $a1, $zero
/* 40AA4 8003FEA4 AFBF0074 */  sw         $ra, 0x74($sp)
/* 40AA8 8003FEA8 0C02DCFC */  jal        widget_init
/* 40AAC 8003FEAC AFB1006C */   sw        $s1, 0x6c($sp)
/* 40AB0 8003FEB0 27A50058 */  addiu      $a1, $sp, 0x58
/* 40AB4 8003FEB4 27A6005C */  addiu      $a2, $sp, 0x5c
/* 40AB8 8003FEB8 27A70060 */  addiu      $a3, $sp, 0x60
/* 40ABC 8003FEBC 3C02800E */  lui        $v0, %hi(D_800DC778)
/* 40AC0 8003FEC0 A6400094 */  sh         $zero, 0x94($s2)
/* 40AC4 8003FEC4 A6400096 */  sh         $zero, 0x96($s2)
/* 40AC8 8003FEC8 96040000 */  lhu        $a0, ($s0)
/* 40ACC 8003FECC 2442C778 */  addiu      $v0, $v0, %lo(D_800DC778)
/* 40AD0 8003FED0 AE420078 */  sw         $v0, 0x78($s2)
/* 40AD4 8003FED4 AE50007C */  sw         $s0, 0x7c($s2)
/* 40AD8 8003FED8 AE400080 */  sw         $zero, 0x80($s2)
/* 40ADC 8003FEDC AE400084 */  sw         $zero, 0x84($s2)
/* 40AE0 8003FEE0 AE400088 */  sw         $zero, 0x88($s2)
/* 40AE4 8003FEE4 AE40008C */  sw         $zero, 0x8c($s2)
/* 40AE8 8003FEE8 AE400090 */  sw         $zero, 0x90($s2)
/* 40AEC 8003FEEC AFA00058 */  sw         $zero, 0x58($sp)
/* 40AF0 8003FEF0 AFA0005C */  sw         $zero, 0x5c($sp)
/* 40AF4 8003FEF4 0C0132B4 */  jal        get_spell_icons
/* 40AF8 8003FEF8 AFA00060 */   sw        $zero, 0x60($sp)
/* 40AFC 8003FEFC 8FA30058 */  lw         $v1, 0x58($sp)
/* 40B00 8003FF00 1060000E */  beqz       $v1, .L8003FF3C
/* 40B04 8003FF04 8FA2005C */   lw        $v0, 0x5c($sp)
/* 40B08 8003FF08 0C026259 */  jal        passToMalloc
/* 40B0C 8003FF0C 2404007C */   addiu     $a0, $zero, 0x7c
/* 40B10 8003FF10 8FA40058 */  lw         $a0, 0x58($sp)
/* 40B14 8003FF14 0C0290E2 */  jal        get_borg_8
/* 40B18 8003FF18 00408021 */   addu      $s0, $v0, $zero
/* 40B1C 8003FF1C 02002021 */  addu       $a0, $s0, $zero
/* 40B20 8003FF20 0C02E518 */  jal        borg8_widget
/* 40B24 8003FF24 00402821 */   addu      $a1, $v0, $zero
/* 40B28 8003FF28 02402021 */  addu       $a0, $s2, $zero
/* 40B2C 8003FF2C 00402821 */  addu       $a1, $v0, $zero
/* 40B30 8003FF30 0C02DEDC */  jal        link_widgets
/* 40B34 8003FF34 AE420080 */   sw        $v0, 0x80($s2)
/* 40B38 8003FF38 8FA2005C */  lw         $v0, 0x5c($sp)
.L8003FF3C:
/* 40B3C 8003FF3C 1040000E */  beqz       $v0, .L8003FF78
/* 40B40 8003FF40 8FA20060 */   lw        $v0, 0x60($sp)
/* 40B44 8003FF44 0C026259 */  jal        passToMalloc
/* 40B48 8003FF48 2404007C */   addiu     $a0, $zero, 0x7c
/* 40B4C 8003FF4C 8FA4005C */  lw         $a0, 0x5c($sp)
/* 40B50 8003FF50 0C0290E2 */  jal        get_borg_8
/* 40B54 8003FF54 00408021 */   addu      $s0, $v0, $zero
/* 40B58 8003FF58 02002021 */  addu       $a0, $s0, $zero
/* 40B5C 8003FF5C 0C02E518 */  jal        borg8_widget
/* 40B60 8003FF60 00402821 */   addu      $a1, $v0, $zero
/* 40B64 8003FF64 02402021 */  addu       $a0, $s2, $zero
/* 40B68 8003FF68 00402821 */  addu       $a1, $v0, $zero
/* 40B6C 8003FF6C 0C02DEDC */  jal        link_widgets
/* 40B70 8003FF70 AE420084 */   sw        $v0, 0x84($s2)
/* 40B74 8003FF74 8FA20060 */  lw         $v0, 0x60($sp)
.L8003FF78:
/* 40B78 8003FF78 1040000D */  beqz       $v0, .L8003FFB0
/* 40B7C 8003FF7C 00000000 */   nop
/* 40B80 8003FF80 0C026259 */  jal        passToMalloc
/* 40B84 8003FF84 2404007C */   addiu     $a0, $zero, 0x7c
/* 40B88 8003FF88 8FA40060 */  lw         $a0, 0x60($sp)
/* 40B8C 8003FF8C 0C0290E2 */  jal        get_borg_8
/* 40B90 8003FF90 00408021 */   addu      $s0, $v0, $zero
/* 40B94 8003FF94 02002021 */  addu       $a0, $s0, $zero
/* 40B98 8003FF98 0C02E518 */  jal        borg8_widget
/* 40B9C 8003FF9C 00402821 */   addu      $a1, $v0, $zero
/* 40BA0 8003FFA0 02402021 */  addu       $a0, $s2, $zero
/* 40BA4 8003FFA4 00402821 */  addu       $a1, $v0, $zero
/* 40BA8 8003FFA8 0C02DEDC */  jal        link_widgets
/* 40BAC 8003FFAC AE420088 */   sw        $v0, 0x88($s2)
.L8003FFB0:
/* 40BB0 8003FFB0 0C026259 */  jal        passToMalloc
/* 40BB4 8003FFB4 2404007C */   addiu     $a0, $zero, 0x7c
/* 40BB8 8003FFB8 8E43007C */  lw         $v1, 0x7c($s2)
/* 40BBC 8003FFBC 8C640004 */  lw         $a0, 4($v1)
/* 40BC0 8003FFC0 0C03353E */  jal        strlen
/* 40BC4 8003FFC4 00408021 */   addu      $s0, $v0, $zero
/* 40BC8 8003FFC8 02002021 */  addu       $a0, $s0, $zero
/* 40BCC 8003FFCC 8E43007C */  lw         $v1, 0x7c($s2)
/* 40BD0 8003FFD0 24420001 */  addiu      $v0, $v0, 1
/* 40BD4 8003FFD4 8C650004 */  lw         $a1, 4($v1)
/* 40BD8 8003FFD8 0C02DFC8 */  jal        widgetcliptext_init
/* 40BDC 8003FFDC 3046FFFF */   andi      $a2, $v0, 0xffff
/* 40BE0 8003FFE0 24050082 */  addiu      $a1, $zero, 0x82
/* 40BE4 8003FFE4 24060050 */  addiu      $a2, $zero, 0x50
/* 40BE8 8003FFE8 8C480078 */  lw         $t0, 0x78($v0)
/* 40BEC 8003FFEC 24070050 */  addiu      $a3, $zero, 0x50
/* 40BF0 8003FFF0 AE420090 */  sw         $v0, 0x90($s2)
/* 40BF4 8003FFF4 85040048 */  lh         $a0, 0x48($t0)
/* 40BF8 8003FFF8 241100FF */  addiu      $s1, $zero, 0xff
/* 40BFC 8003FFFC AFB10010 */  sw         $s1, 0x10($sp)
/* 40C00 80040000 8D03004C */  lw         $v1, 0x4c($t0)
/* 40C04 80040004 0060F809 */  jalr       $v1
/* 40C08 80040008 00442021 */   addu      $a0, $v0, $a0
/* 40C0C 8004000C 8E450090 */  lw         $a1, 0x90($s2)
/* 40C10 80040010 0C02DEDC */  jal        link_widgets
/* 40C14 80040014 02402021 */   addu      $a0, $s2, $zero
/* 40C18 80040018 27A40018 */  addiu      $a0, $sp, 0x18
/* 40C1C 8004001C 8E43007C */  lw         $v1, 0x7c($s2)
/* 40C20 80040020 3C05800E */  lui        $a1, %hi(D_800DC770)
/* 40C24 80040024 90660014 */  lbu        $a2, 0x14($v1)
/* 40C28 80040028 0C0333AC */  jal        sprintf
/* 40C2C 8004002C 24A5C770 */   addiu     $a1, $a1, %lo(D_800DC770)
/* 40C30 80040030 0C026259 */  jal        passToMalloc
/* 40C34 80040034 2404007C */   addiu     $a0, $zero, 0x7c
/* 40C38 80040038 27A40018 */  addiu      $a0, $sp, 0x18
/* 40C3C 8004003C 0C03353E */  jal        strlen
/* 40C40 80040040 00408021 */   addu      $s0, $v0, $zero
/* 40C44 80040044 02002021 */  addu       $a0, $s0, $zero
/* 40C48 80040048 27A50018 */  addiu      $a1, $sp, 0x18
/* 40C4C 8004004C 24420001 */  addiu      $v0, $v0, 1
/* 40C50 80040050 0C02DFC8 */  jal        widgetcliptext_init
/* 40C54 80040054 3046FFFF */   andi      $a2, $v0, 0xffff
/* 40C58 80040058 24050082 */  addiu      $a1, $zero, 0x82
/* 40C5C 8004005C 8C480078 */  lw         $t0, 0x78($v0)
/* 40C60 80040060 24060050 */  addiu      $a2, $zero, 0x50
/* 40C64 80040064 AE42008C */  sw         $v0, 0x8c($s2)
/* 40C68 80040068 85040048 */  lh         $a0, 0x48($t0)
/* 40C6C 8004006C 24070050 */  addiu      $a3, $zero, 0x50
/* 40C70 80040070 AFB10010 */  sw         $s1, 0x10($sp)
/* 40C74 80040074 8D03004C */  lw         $v1, 0x4c($t0)
/* 40C78 80040078 0060F809 */  jalr       $v1
/* 40C7C 8004007C 00442021 */   addu      $a0, $v0, $a0
/* 40C80 80040080 02402021 */  addu       $a0, $s2, $zero
/* 40C84 80040084 8E42007C */  lw         $v0, 0x7c($s2)
/* 40C88 80040088 8E43008C */  lw         $v1, 0x8c($s2)
/* 40C8C 8004008C 90460014 */  lbu        $a2, 0x14($v0)
/* 40C90 80040090 00602821 */  addu       $a1, $v1, $zero
/* 40C94 80040094 0C02DEDC */  jal        link_widgets
/* 40C98 80040098 A466005E */   sh        $a2, 0x5e($v1)
/* 40C9C 8004009C 02401021 */  addu       $v0, $s2, $zero
/* 40CA0 800400A0 8FBF0074 */  lw         $ra, 0x74($sp)
/* 40CA4 800400A4 8FB20070 */  lw         $s2, 0x70($sp)
/* 40CA8 800400A8 8FB1006C */  lw         $s1, 0x6c($sp)
/* 40CAC 800400AC 8FB00068 */  lw         $s0, 0x68($sp)
/* 40CB0 800400B0 03E00008 */  jr         $ra
/* 40CB4 800400B4 27BD0078 */   addiu     $sp, $sp, 0x78

glabel func_800400B8
/* 40CB8 800400B8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 40CBC 800400BC 3C02800E */  lui        $v0, %hi(D_800DC778)
/* 40CC0 800400C0 2442C778 */  addiu      $v0, $v0, %lo(D_800DC778)
/* 40CC4 800400C4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 40CC8 800400C8 0C02DD2B */  jal        free_widget
/* 40CCC 800400CC AC820078 */   sw        $v0, 0x78($a0)
/* 40CD0 800400D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 40CD4 800400D4 03E00008 */  jr         $ra
/* 40CD8 800400D8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800400DC
/* 40CDC 800400DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 40CE0 800400E0 00063400 */  sll        $a2, $a2, 0x10
/* 40CE4 800400E4 00073C00 */  sll        $a3, $a3, 0x10
/* 40CE8 800400E8 00063403 */  sra        $a2, $a2, 0x10
/* 40CEC 800400EC 87A20032 */  lh         $v0, 0x32($sp)
/* 40CF0 800400F0 87A30036 */  lh         $v1, 0x36($sp)
/* 40CF4 800400F4 00073C03 */  sra        $a3, $a3, 0x10
/* 40CF8 800400F8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 40CFC 800400FC AFA20010 */  sw         $v0, 0x10($sp)
/* 40D00 80040100 0C02DE14 */  jal        widget_func_8
/* 40D04 80040104 AFA30014 */   sw        $v1, 0x14($sp)
/* 40D08 80040108 8FBF0018 */  lw         $ra, 0x18($sp)
/* 40D0C 8004010C 03E00008 */  jr         $ra
/* 40D10 80040110 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80040114
/* 40D14 80040114 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 40D18 80040118 AFB00018 */  sw         $s0, 0x18($sp)
/* 40D1C 8004011C 00808021 */  addu       $s0, $a0, $zero
/* 40D20 80040120 AFBF001C */  sw         $ra, 0x1c($sp)
/* 40D24 80040124 8E020090 */  lw         $v0, 0x90($s0)
/* 40D28 80040128 10400062 */  beqz       $v0, .L800402B4
/* 40D2C 8004012C 00000000 */   nop
/* 40D30 80040130 8E040080 */  lw         $a0, 0x80($s0)
/* 40D34 80040134 5080000F */  beql       $a0, $zero, .L80040174
/* 40D38 80040138 8E040084 */   lw        $a0, 0x84($s0)
/* 40D3C 8004013C 86050060 */  lh         $a1, 0x60($s0)
/* 40D40 80040140 0C02DD3F */  jal        set_widget_coords
/* 40D44 80040144 86060062 */   lh        $a2, 0x62($s0)
/* 40D48 80040148 8602006A */  lh         $v0, 0x6a($s0)
/* 40D4C 8004014C 8E040080 */  lw         $a0, 0x80($s0)
/* 40D50 80040150 86050068 */  lh         $a1, 0x68($s0)
/* 40D54 80040154 86060064 */  lh         $a2, 0x64($s0)
/* 40D58 80040158 86070066 */  lh         $a3, 0x66($s0)
/* 40D5C 8004015C 0C02DD6A */  jal        some_widget_setter
/* 40D60 80040160 AFA20010 */   sw        $v0, 0x10($sp)
/* 40D64 80040164 8E030080 */  lw         $v1, 0x80($s0)
/* 40D68 80040168 9202005B */  lbu        $v0, 0x5b($s0)
/* 40D6C 8004016C A062005B */  sb         $v0, 0x5b($v1)
/* 40D70 80040170 8E040084 */  lw         $a0, 0x84($s0)
.L80040174:
/* 40D74 80040174 50800010 */  beql       $a0, $zero, .L800401B8
/* 40D78 80040178 8E040088 */   lw        $a0, 0x88($s0)
/* 40D7C 8004017C 86050060 */  lh         $a1, 0x60($s0)
/* 40D80 80040180 86060062 */  lh         $a2, 0x62($s0)
/* 40D84 80040184 0C02DD3F */  jal        set_widget_coords
/* 40D88 80040188 24A5000C */   addiu     $a1, $a1, 0xc
/* 40D8C 8004018C 8602006A */  lh         $v0, 0x6a($s0)
/* 40D90 80040190 8E040084 */  lw         $a0, 0x84($s0)
/* 40D94 80040194 86050068 */  lh         $a1, 0x68($s0)
/* 40D98 80040198 86060064 */  lh         $a2, 0x64($s0)
/* 40D9C 8004019C 86070066 */  lh         $a3, 0x66($s0)
/* 40DA0 800401A0 0C02DD6A */  jal        some_widget_setter
/* 40DA4 800401A4 AFA20010 */   sw        $v0, 0x10($sp)
/* 40DA8 800401A8 8E030084 */  lw         $v1, 0x84($s0)
/* 40DAC 800401AC 9202005B */  lbu        $v0, 0x5b($s0)
/* 40DB0 800401B0 A062005B */  sb         $v0, 0x5b($v1)
/* 40DB4 800401B4 8E040088 */  lw         $a0, 0x88($s0)
.L800401B8:
/* 40DB8 800401B8 50800010 */  beql       $a0, $zero, .L800401FC
/* 40DBC 800401BC 8E04008C */   lw        $a0, 0x8c($s0)
/* 40DC0 800401C0 86050060 */  lh         $a1, 0x60($s0)
/* 40DC4 800401C4 86060062 */  lh         $a2, 0x62($s0)
/* 40DC8 800401C8 0C02DD3F */  jal        set_widget_coords
/* 40DCC 800401CC 24A50018 */   addiu     $a1, $a1, 0x18
/* 40DD0 800401D0 8602006A */  lh         $v0, 0x6a($s0)
/* 40DD4 800401D4 8E040088 */  lw         $a0, 0x88($s0)
/* 40DD8 800401D8 86050068 */  lh         $a1, 0x68($s0)
/* 40DDC 800401DC 86060064 */  lh         $a2, 0x64($s0)
/* 40DE0 800401E0 86070066 */  lh         $a3, 0x66($s0)
/* 40DE4 800401E4 0C02DD6A */  jal        some_widget_setter
/* 40DE8 800401E8 AFA20010 */   sw        $v0, 0x10($sp)
/* 40DEC 800401EC 8E030088 */  lw         $v1, 0x88($s0)
/* 40DF0 800401F0 9202005B */  lbu        $v0, 0x5b($s0)
/* 40DF4 800401F4 A062005B */  sb         $v0, 0x5b($v1)
/* 40DF8 800401F8 8E04008C */  lw         $a0, 0x8c($s0)
.L800401FC:
/* 40DFC 800401FC 86050060 */  lh         $a1, 0x60($s0)
/* 40E00 80040200 86060062 */  lh         $a2, 0x62($s0)
/* 40E04 80040204 0C02DD3F */  jal        set_widget_coords
/* 40E08 80040208 24A50024 */   addiu     $a1, $a1, 0x24
/* 40E0C 8004020C 8602006A */  lh         $v0, 0x6a($s0)
/* 40E10 80040210 8E04008C */  lw         $a0, 0x8c($s0)
/* 40E14 80040214 86050068 */  lh         $a1, 0x68($s0)
/* 40E18 80040218 86060064 */  lh         $a2, 0x64($s0)
/* 40E1C 8004021C 86070066 */  lh         $a3, 0x66($s0)
/* 40E20 80040220 0C02DD6A */  jal        some_widget_setter
/* 40E24 80040224 AFA20010 */   sw        $v0, 0x10($sp)
/* 40E28 80040228 8E03008C */  lw         $v1, 0x8c($s0)
/* 40E2C 8004022C 9202005B */  lbu        $v0, 0x5b($s0)
/* 40E30 80040230 A062005B */  sb         $v0, 0x5b($v1)
/* 40E34 80040234 8E040090 */  lw         $a0, 0x90($s0)
/* 40E38 80040238 96020060 */  lhu        $v0, 0x60($s0)
/* 40E3C 8004023C 86060062 */  lh         $a2, 0x62($s0)
/* 40E40 80040240 24430032 */  addiu      $v1, $v0, 0x32
/* 40E44 80040244 00032C00 */  sll        $a1, $v1, 0x10
/* 40E48 80040248 00052C03 */  sra        $a1, $a1, 0x10
/* 40E4C 8004024C 2442008C */  addiu      $v0, $v0, 0x8c
/* 40E50 80040250 A6020096 */  sh         $v0, 0x96($s0)
/* 40E54 80040254 0C02DD3F */  jal        set_widget_coords
/* 40E58 80040258 A6030094 */   sh        $v1, 0x94($s0)
/* 40E5C 8004025C 8E040090 */  lw         $a0, 0x90($s0)
/* 40E60 80040260 86050094 */  lh         $a1, 0x94($s0)
/* 40E64 80040264 0C02EF52 */  jal        func_800BBD48
/* 40E68 80040268 86060096 */   lh        $a2, 0x96($s0)
/* 40E6C 8004026C 8E090090 */  lw         $t1, 0x90($s0)
/* 40E70 80040270 9202005B */  lbu        $v0, 0x5b($s0)
/* 40E74 80040274 92050058 */  lbu        $a1, 0x58($s0)
/* 40E78 80040278 92060059 */  lbu        $a2, 0x59($s0)
/* 40E7C 8004027C 8D280078 */  lw         $t0, 0x78($t1)
/* 40E80 80040280 9207005A */  lbu        $a3, 0x5a($s0)
/* 40E84 80040284 85040048 */  lh         $a0, 0x48($t0)
/* 40E88 80040288 AFA20010 */  sw         $v0, 0x10($sp)
/* 40E8C 8004028C 8D03004C */  lw         $v1, 0x4c($t0)
/* 40E90 80040290 0060F809 */  jalr       $v1
/* 40E94 80040294 01242021 */   addu      $a0, $t1, $a0
/* 40E98 80040298 8602006A */  lh         $v0, 0x6a($s0)
/* 40E9C 8004029C 8E040090 */  lw         $a0, 0x90($s0)
/* 40EA0 800402A0 86050068 */  lh         $a1, 0x68($s0)
/* 40EA4 800402A4 86060064 */  lh         $a2, 0x64($s0)
/* 40EA8 800402A8 86070066 */  lh         $a3, 0x66($s0)
/* 40EAC 800402AC 0C02DD6A */  jal        some_widget_setter
/* 40EB0 800402B0 AFA20010 */   sw        $v0, 0x10($sp)
.L800402B4:
/* 40EB4 800402B4 0C02DE51 */  jal        func_800B7944
/* 40EB8 800402B8 02002021 */   addu      $a0, $s0, $zero
/* 40EBC 800402BC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 40EC0 800402C0 8FB00018 */  lw         $s0, 0x18($sp)
/* 40EC4 800402C4 03E00008 */  jr         $ra
/* 40EC8 800402C8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800402CC
/* 40ECC 800402CC 8C820090 */  lw         $v0, 0x90($a0)
/* 40ED0 800402D0 10400006 */  beqz       $v0, .L800402EC
/* 40ED4 800402D4 00000000 */   nop
/* 40ED8 800402D8 94820066 */  lhu        $v0, 0x66($a0)
/* 40EDC 800402DC 94830064 */  lhu        $v1, 0x64($a0)
/* 40EE0 800402E0 00431023 */  subu       $v0, $v0, $v1
/* 40EE4 800402E4 03E00008 */  jr         $ra
/* 40EE8 800402E8 3042FFFF */   andi      $v0, $v0, 0xffff
.L800402EC:
/* 40EEC 800402EC 03E00008 */  jr         $ra
/* 40EF0 800402F0 00001021 */   addu      $v0, $zero, $zero

glabel func_800402F4
/* 40EF4 800402F4 03E00008 */  jr         $ra
/* 40EF8 800402F8 2402000D */   addiu     $v0, $zero, 0xd

glabel func_800402FC
/* 40EFC 800402FC 03E00008 */  jr         $ra
/* 40F00 80040300 8C82008C */   lw        $v0, 0x8c($a0)

glabel func_80040304
/* 40F04 80040304 03E00008 */  jr         $ra
/* 40F08 80040308 2402000C */   addiu     $v0, $zero, 0xc
/* 40F0C 8004030C 00000000 */  nop
