.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widget_left_side_fade_in
/* 3AA80 80039E80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3AA84 80039E84 AFB00010 */  sw         $s0, 0x10($sp)
/* 3AA88 80039E88 00808021 */  addu       $s0, $a0, $zero
/* 3AA8C 80039E8C AFBF0014 */  sw         $ra, 0x14($sp)
/* 3AA90 80039E90 9203005B */  lbu        $v1, 0x5b($s0)
/* 3AA94 80039E94 2C6200C3 */  sltiu      $v0, $v1, 0xc3
/* 3AA98 80039E98 10400003 */  beqz       $v0, .L80039EA8
/* 3AA9C 80039E9C 2462003C */   addiu     $v0, $v1, 0x3c
/* 3AAA0 80039EA0 0800E7AE */  j          .L80039EB8
/* 3AAA4 80039EA4 A202005B */   sb        $v0, 0x5b($s0)
.L80039EA8:
/* 3AAA8 80039EA8 240200FF */  addiu      $v0, $zero, 0xff
/* 3AAAC 80039EAC 24030002 */  addiu      $v1, $zero, 2
/* 3AAB0 80039EB0 A202005B */  sb         $v0, 0x5b($s0)
/* 3AAB4 80039EB4 A2030070 */  sb         $v1, 0x70($s0)
.L80039EB8:
/* 3AAB8 80039EB8 9205005B */  lbu        $a1, 0x5b($s0)
/* 3AABC 80039EBC 0C02F216 */  jal        widget_fade
/* 3AAC0 80039EC0 02002021 */   addu      $a0, $s0, $zero
/* 3AAC4 80039EC4 8E030078 */  lw         $v1, 0x78($s0)
/* 3AAC8 80039EC8 84640028 */  lh         $a0, 0x28($v1)
/* 3AACC 80039ECC 8C62002C */  lw         $v0, 0x2c($v1)
/* 3AAD0 80039ED0 0040F809 */  jalr       $v0
/* 3AAD4 80039ED4 02042021 */   addu      $a0, $s0, $a0
/* 3AAD8 80039ED8 92020070 */  lbu        $v0, 0x70($s0)
/* 3AADC 80039EDC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3AAE0 80039EE0 8FB00010 */  lw         $s0, 0x10($sp)
/* 3AAE4 80039EE4 03E00008 */  jr         $ra
/* 3AAE8 80039EE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_left_side_fade_out
/* 3AAEC 80039EEC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3AAF0 80039EF0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3AAF4 80039EF4 00808021 */  addu       $s0, $a0, $zero
/* 3AAF8 80039EF8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3AAFC 80039EFC 9203005B */  lbu        $v1, 0x5b($s0)
/* 3AB00 80039F00 2C62003D */  sltiu      $v0, $v1, 0x3d
/* 3AB04 80039F04 14400004 */  bnez       $v0, .L80039F18
/* 3AB08 80039F08 24020006 */   addiu     $v0, $zero, 6
/* 3AB0C 80039F0C 2462FFC4 */  addiu      $v0, $v1, -0x3c
/* 3AB10 80039F10 0800E7C8 */  j          .L80039F20
/* 3AB14 80039F14 A202005B */   sb        $v0, 0x5b($s0)
.L80039F18:
/* 3AB18 80039F18 A200005B */  sb         $zero, 0x5b($s0)
/* 3AB1C 80039F1C A2020070 */  sb         $v0, 0x70($s0)
.L80039F20:
/* 3AB20 80039F20 9205005B */  lbu        $a1, 0x5b($s0)
/* 3AB24 80039F24 0C02F216 */  jal        widget_fade
/* 3AB28 80039F28 02002021 */   addu      $a0, $s0, $zero
/* 3AB2C 80039F2C 8E030078 */  lw         $v1, 0x78($s0)
/* 3AB30 80039F30 84640028 */  lh         $a0, 0x28($v1)
/* 3AB34 80039F34 8C62002C */  lw         $v0, 0x2c($v1)
/* 3AB38 80039F38 0040F809 */  jalr       $v0
/* 3AB3C 80039F3C 02042021 */   addu      $a0, $s0, $a0
/* 3AB40 80039F40 92020070 */  lbu        $v0, 0x70($s0)
/* 3AB44 80039F44 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3AB48 80039F48 8FB00010 */  lw         $s0, 0x10($sp)
/* 3AB4C 80039F4C 03E00008 */  jr         $ra
/* 3AB50 80039F50 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_item_info_text
/* 3AB54 80039F54 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3AB58 80039F58 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3AB5C 80039F5C 00808821 */  addu       $s1, $a0, $zero
/* 3AB60 80039F60 2404007C */  addiu      $a0, $zero, 0x7c
/* 3AB64 80039F64 AFB00018 */  sw         $s0, 0x18($sp)
/* 3AB68 80039F68 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3AB6C 80039F6C 0C026259 */  jal        passToMalloc
/* 3AB70 80039F70 00A08021 */   addu      $s0, $a1, $zero
/* 3AB74 80039F74 00402021 */  addu       $a0, $v0, $zero
/* 3AB78 80039F78 02002821 */  addu       $a1, $s0, $zero
/* 3AB7C 80039F7C 0C02DFC8 */  jal        widgetcliptext_init
/* 3AB80 80039F80 24060190 */   addiu     $a2, $zero, 0x190
/* 3AB84 80039F84 24050082 */  addiu      $a1, $zero, 0x82
/* 3AB88 80039F88 00408021 */  addu       $s0, $v0, $zero
/* 3AB8C 80039F8C 24060050 */  addiu      $a2, $zero, 0x50
/* 3AB90 80039F90 8E030078 */  lw         $v1, 0x78($s0)
/* 3AB94 80039F94 240200FF */  addiu      $v0, $zero, 0xff
/* 3AB98 80039F98 84640048 */  lh         $a0, 0x48($v1)
/* 3AB9C 80039F9C 24070050 */  addiu      $a3, $zero, 0x50
/* 3ABA0 80039FA0 AFA20010 */  sw         $v0, 0x10($sp)
/* 3ABA4 80039FA4 8C62004C */  lw         $v0, 0x4c($v1)
/* 3ABA8 80039FA8 0040F809 */  jalr       $v0
/* 3ABAC 80039FAC 02042021 */   addu      $a0, $s0, $a0
/* 3ABB0 80039FB0 86250060 */  lh         $a1, 0x60($s1)
/* 3ABB4 80039FB4 9626007C */  lhu        $a2, 0x7c($s1)
/* 3ABB8 80039FB8 0C02DD3F */  jal        set_widget_coords
/* 3ABBC 80039FBC 02002021 */   addu      $a0, $s0, $zero
/* 3ABC0 80039FC0 8E230078 */  lw         $v1, 0x78($s1)
/* 3ABC4 80039FC4 02002821 */  addu       $a1, $s0, $zero
/* 3ABC8 80039FC8 84640030 */  lh         $a0, 0x30($v1)
/* 3ABCC 80039FCC 8C620034 */  lw         $v0, 0x34($v1)
/* 3ABD0 80039FD0 0040F809 */  jalr       $v0
/* 3ABD4 80039FD4 02242021 */   addu      $a0, $s1, $a0
/* 3ABD8 80039FD8 02001021 */  addu       $v0, $s0, $zero
/* 3ABDC 80039FDC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3ABE0 80039FE0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3ABE4 80039FE4 8FB00018 */  lw         $s0, 0x18($sp)
/* 3ABE8 80039FE8 03E00008 */  jr         $ra
/* 3ABEC 80039FEC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel add_widgetcliptext
/* 3ABF0 80039FF0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3ABF4 80039FF4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3ABF8 80039FF8 00808821 */  addu       $s1, $a0, $zero
/* 3ABFC 80039FFC 2404007C */  addiu      $a0, $zero, 0x7c
/* 3AC00 8003A000 AFB00018 */  sw         $s0, 0x18($sp)
/* 3AC04 8003A004 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3AC08 8003A008 0C026259 */  jal        passToMalloc
/* 3AC0C 8003A00C 00A08021 */   addu      $s0, $a1, $zero
/* 3AC10 8003A010 00402021 */  addu       $a0, $v0, $zero
/* 3AC14 8003A014 02002821 */  addu       $a1, $s0, $zero
/* 3AC18 8003A018 0C02DFC8 */  jal        widgetcliptext_init
/* 3AC1C 8003A01C 24060190 */   addiu     $a2, $zero, 0x190
/* 3AC20 8003A020 24050082 */  addiu      $a1, $zero, 0x82
/* 3AC24 8003A024 00408021 */  addu       $s0, $v0, $zero
/* 3AC28 8003A028 24060050 */  addiu      $a2, $zero, 0x50
/* 3AC2C 8003A02C 8E030078 */  lw         $v1, 0x78($s0)
/* 3AC30 8003A030 240200FF */  addiu      $v0, $zero, 0xff
/* 3AC34 8003A034 84640048 */  lh         $a0, 0x48($v1)
/* 3AC38 8003A038 24070050 */  addiu      $a3, $zero, 0x50
/* 3AC3C 8003A03C AFA20010 */  sw         $v0, 0x10($sp)
/* 3AC40 8003A040 8C62004C */  lw         $v0, 0x4c($v1)
/* 3AC44 8003A044 0040F809 */  jalr       $v0
/* 3AC48 8003A048 02042021 */   addu      $a0, $s0, $a0
/* 3AC4C 8003A04C 8E030078 */  lw         $v1, 0x78($s0)
/* 3AC50 8003A050 84640018 */  lh         $a0, 0x18($v1)
/* 3AC54 8003A054 8C62001C */  lw         $v0, 0x1c($v1)
/* 3AC58 8003A058 0040F809 */  jalr       $v0
/* 3AC5C 8003A05C 02042021 */   addu      $a0, $s0, $a0
/* 3AC60 8003A060 02002021 */  addu       $a0, $s0, $zero
/* 3AC64 8003A064 24050095 */  addiu      $a1, $zero, 0x95
/* 3AC68 8003A068 9626007C */  lhu        $a2, 0x7c($s1)
/* 3AC6C 8003A06C 0C02DD3F */  jal        set_widget_coords
/* 3AC70 8003A070 00A22823 */   subu      $a1, $a1, $v0
/* 3AC74 8003A074 8E230078 */  lw         $v1, 0x78($s1)
/* 3AC78 8003A078 02002821 */  addu       $a1, $s0, $zero
/* 3AC7C 8003A07C 84640030 */  lh         $a0, 0x30($v1)
/* 3AC80 8003A080 8C620034 */  lw         $v0, 0x34($v1)
/* 3AC84 8003A084 0040F809 */  jalr       $v0
/* 3AC88 8003A088 02242021 */   addu      $a0, $s1, $a0
/* 3AC8C 8003A08C 02001021 */  addu       $v0, $s0, $zero
/* 3AC90 8003A090 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3AC94 8003A094 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3AC98 8003A098 8FB00018 */  lw         $s0, 0x18($sp)
/* 3AC9C 8003A09C 03E00008 */  jr         $ra
/* 3ACA0 8003A0A0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel itemdetail_potion_other
/* 3ACA4 8003A0A4 27BDFE08 */  addiu      $sp, $sp, -0x1f8
/* 3ACA8 8003A0A8 AFB401E0 */  sw         $s4, 0x1e0($sp)
/* 3ACAC 8003A0AC 0080A021 */  addu       $s4, $a0, $zero
/* 3ACB0 8003A0B0 AFB301DC */  sw         $s3, 0x1dc($sp)
/* 3ACB4 8003A0B4 00A09821 */  addu       $s3, $a1, $zero
/* 3ACB8 8003A0B8 AFBF01F4 */  sw         $ra, 0x1f4($sp)
/* 3ACBC 8003A0BC AFBE01F0 */  sw         $fp, 0x1f0($sp)
/* 3ACC0 8003A0C0 AFB701EC */  sw         $s7, 0x1ec($sp)
/* 3ACC4 8003A0C4 AFB601E8 */  sw         $s6, 0x1e8($sp)
/* 3ACC8 8003A0C8 AFB501E4 */  sw         $s5, 0x1e4($sp)
/* 3ACCC 8003A0CC AFB201D8 */  sw         $s2, 0x1d8($sp)
/* 3ACD0 8003A0D0 AFB101D4 */  sw         $s1, 0x1d4($sp)
/* 3ACD4 8003A0D4 0C02E658 */  jal        widget_menu_build
/* 3ACD8 8003A0D8 AFB001D0 */   sw        $s0, 0x1d0($sp)
/* 3ACDC 8003A0DC 3C11800E */  lui        $s1, %hi(gGlobals)
/* 3ACE0 8003A0E0 262268A8 */  addiu      $v0, $s1, %lo(gGlobals)
/* 3ACE4 8003A0E4 3C10800F */  lui        $s0, %hi(font_face)
/* 3ACE8 8003A0E8 26038D18 */  addiu      $v1, $s0, %lo(font_face)
/* 3ACEC 8003A0EC 8C441600 */  lw         $a0, 0x1600($v0)
/* 3ACF0 8003A0F0 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3ACF4 8003A0F4 8C650008 */  lw         $a1, 8($v1)
/* 3ACF8 8003A0F8 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3ACFC 8003A0FC 0C02D0FD */  jal        font_func
/* 3AD00 8003A100 AE820078 */   sw        $v0, 0x78($s4)
/* 3AD04 8003A104 96630000 */  lhu        $v1, ($s3)
/* 3AD08 8003A108 02802021 */  addu       $a0, $s4, $zero
/* 3AD0C 8003A10C 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3AD10 8003A110 A683005E */   sh        $v1, 0x5e($s4)
/* 3AD14 8003A114 8E650004 */  lw         $a1, 4($s3)
/* 3AD18 8003A118 0C00EBCB */  jal        item_name_icon
/* 3AD1C 8003A11C 02802021 */   addu      $a0, $s4, $zero
/* 3AD20 8003A120 96620000 */  lhu        $v0, ($s3)
/* 3AD24 8003A124 24030010 */  addiu      $v1, $zero, 0x10
/* 3AD28 8003A128 00021202 */  srl        $v0, $v0, 8
/* 3AD2C 8003A12C 14430066 */  bne        $v0, $v1, .L8003A2C8
/* 3AD30 8003A130 27A40050 */   addiu     $a0, $sp, 0x50
/* 3AD34 8003A134 27A40010 */  addiu      $a0, $sp, 0x10
/* 3AD38 8003A138 3C02800E */  lui        $v0, %hi(potion_romstring_id)
/* 3AD3C 8003A13C 2442BCE0 */  addiu      $v0, $v0, %lo(potion_romstring_id)
/* 3AD40 8003A140 30430003 */  andi       $v1, $v0, 3
/* 3AD44 8003A144 10600018 */  beqz       $v1, .L8003A1A8
/* 3AD48 8003A148 00802821 */   addu      $a1, $a0, $zero
/* 3AD4C 8003A14C 24430040 */  addiu      $v1, $v0, 0x40
/* 3AD50 8003A150 27BE0012 */  addiu      $fp, $sp, 0x12
.L8003A154:
/* 3AD54 8003A154 88460000 */  lwl        $a2, ($v0)
/* 3AD58 8003A158 98460003 */  lwr        $a2, 3($v0)
/* 3AD5C 8003A15C 88470004 */  lwl        $a3, 4($v0)
/* 3AD60 8003A160 98470007 */  lwr        $a3, 7($v0)
/* 3AD64 8003A164 88480008 */  lwl        $t0, 8($v0)
/* 3AD68 8003A168 9848000B */  lwr        $t0, 0xb($v0)
/* 3AD6C 8003A16C 8849000C */  lwl        $t1, 0xc($v0)
/* 3AD70 8003A170 9849000F */  lwr        $t1, 0xf($v0)
/* 3AD74 8003A174 A8860000 */  swl        $a2, ($a0)
/* 3AD78 8003A178 B8860003 */  swr        $a2, 3($a0)
/* 3AD7C 8003A17C A8870004 */  swl        $a3, 4($a0)
/* 3AD80 8003A180 B8870007 */  swr        $a3, 7($a0)
/* 3AD84 8003A184 A8880008 */  swl        $t0, 8($a0)
/* 3AD88 8003A188 B888000B */  swr        $t0, 0xb($a0)
/* 3AD8C 8003A18C A889000C */  swl        $t1, 0xc($a0)
/* 3AD90 8003A190 B889000F */  swr        $t1, 0xf($a0)
/* 3AD94 8003A194 24420010 */  addiu      $v0, $v0, 0x10
/* 3AD98 8003A198 1443FFEE */  bne        $v0, $v1, .L8003A154
/* 3AD9C 8003A19C 24840010 */   addiu     $a0, $a0, 0x10
/* 3ADA0 8003A1A0 0800E878 */  j          .L8003A1E0
/* 3ADA4 8003A1A4 00008821 */   addu      $s1, $zero, $zero
.L8003A1A8:
/* 3ADA8 8003A1A8 24430040 */  addiu      $v1, $v0, 0x40
/* 3ADAC 8003A1AC 27BE0012 */  addiu      $fp, $sp, 0x12
.L8003A1B0:
/* 3ADB0 8003A1B0 8C460000 */  lw         $a2, ($v0)
/* 3ADB4 8003A1B4 8C470004 */  lw         $a3, 4($v0)
/* 3ADB8 8003A1B8 8C480008 */  lw         $t0, 8($v0)
/* 3ADBC 8003A1BC 8C49000C */  lw         $t1, 0xc($v0)
/* 3ADC0 8003A1C0 AC860000 */  sw         $a2, ($a0)
/* 3ADC4 8003A1C4 AC870004 */  sw         $a3, 4($a0)
/* 3ADC8 8003A1C8 AC880008 */  sw         $t0, 8($a0)
/* 3ADCC 8003A1CC AC89000C */  sw         $t1, 0xc($a0)
/* 3ADD0 8003A1D0 24420010 */  addiu      $v0, $v0, 0x10
/* 3ADD4 8003A1D4 1443FFF6 */  bne        $v0, $v1, .L8003A1B0
/* 3ADD8 8003A1D8 24840010 */   addiu     $a0, $a0, 0x10
/* 3ADDC 8003A1DC 00008821 */  addu       $s1, $zero, $zero
.L8003A1E0:
/* 3ADE0 8003A1E0 97A30010 */  lhu        $v1, 0x10($sp)
/* 3ADE4 8003A1E4 96620000 */  lhu        $v0, ($s3)
/* 3ADE8 8003A1E8 10620017 */  beq        $v1, $v0, .L8003A248
/* 3ADEC 8003A1EC 00A0A821 */   addu      $s5, $a1, $zero
/* 3ADF0 8003A1F0 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3ADF4 8003A1F4 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3ADF8 8003A1F8 3C17800E */  lui        $s7, 0x800e
/* 3ADFC 8003A1FC 3C16800E */  lui        $s6, 0x800e
/* 3AE00 8003A200 26220001 */  addiu      $v0, $s1, 1
.L8003A204:
/* 3AE04 8003A204 305100FF */  andi       $s1, $v0, 0xff
/* 3AE08 8003A208 00111880 */  sll        $v1, $s1, 2
/* 3AE0C 8003A20C 02A38021 */  addu       $s0, $s5, $v1
/* 3AE10 8003A210 96020000 */  lhu        $v0, ($s0)
/* 3AE14 8003A214 54400009 */  bnel       $v0, $zero, .L8003A23C
/* 3AE18 8003A218 96030000 */   lhu       $v1, ($s0)
/* 3AE1C 8003A21C 02402021 */  addu       $a0, $s2, $zero
/* 3AE20 8003A220 96660000 */  lhu        $a2, ($s3)
/* 3AE24 8003A224 0C0333AC */  jal        sprintf
/* 3AE28 8003A228 26E5BD20 */   addiu     $a1, $s7, -0x42e0
/* 3AE2C 8003A22C 26C4BD38 */  addiu      $a0, $s6, -0x42c8
/* 3AE30 8003A230 0C025F2D */  jal        manualCrash
/* 3AE34 8003A234 02402821 */   addu      $a1, $s2, $zero
/* 3AE38 8003A238 96030000 */  lhu        $v1, ($s0)
.L8003A23C:
/* 3AE3C 8003A23C 96620000 */  lhu        $v0, ($s3)
/* 3AE40 8003A240 1462FFF0 */  bne        $v1, $v0, .L8003A204
/* 3AE44 8003A244 26220001 */   addiu     $v0, $s1, 1
.L8003A248:
/* 3AE48 8003A248 3C02B1FE */  lui        $v0, %hi(romstring_potiondetails)
/* 3AE4C 8003A24C 244404E0 */  addiu      $a0, $v0, %lo(romstring_potiondetails)
/* 3AE50 8003A250 3C03B1FE */  lui        $v1, %hi(chestdb)
/* 3AE54 8003A254 24650F60 */  addiu      $a1, $v1, %lo(chestdb)
/* 3AE58 8003A258 0C0232A0 */  jal        func_romStrings
/* 3AE5C 8003A25C 00A42823 */   subu      $a1, $a1, $a0
/* 3AE60 8003A260 00111880 */  sll        $v1, $s1, 2
/* 3AE64 8003A264 03C31821 */  addu       $v1, $fp, $v1
/* 3AE68 8003A268 94640000 */  lhu        $a0, ($v1)
/* 3AE6C 8003A26C 00408821 */  addu       $s1, $v0, $zero
/* 3AE70 8003A270 00042080 */  sll        $a0, $a0, 2
/* 3AE74 8003A274 00912021 */  addu       $a0, $a0, $s1
/* 3AE78 8003A278 8C850000 */  lw         $a1, ($a0)
/* 3AE7C 8003A27C 0C00E7D5 */  jal        get_item_info_text
/* 3AE80 8003A280 02802021 */   addu      $a0, $s4, $zero
/* 3AE84 8003A284 00408021 */  addu       $s0, $v0, $zero
/* 3AE88 8003A288 02002021 */  addu       $a0, $s0, $zero
/* 3AE8C 8003A28C 86850060 */  lh         $a1, 0x60($s4)
/* 3AE90 8003A290 0C02EF52 */  jal        func_800BBD48
/* 3AE94 8003A294 24060095 */   addiu     $a2, $zero, 0x95
/* 3AE98 8003A298 8E030078 */  lw         $v1, 0x78($s0)
/* 3AE9C 8003A29C 84640020 */  lh         $a0, 0x20($v1)
/* 3AEA0 8003A2A0 8C620024 */  lw         $v0, 0x24($v1)
/* 3AEA4 8003A2A4 0040F809 */  jalr       $v0
/* 3AEA8 8003A2A8 02042021 */   addu      $a0, $s0, $a0
/* 3AEAC 8003A2AC 9683007C */  lhu        $v1, 0x7c($s4)
/* 3AEB0 8003A2B0 02202021 */  addu       $a0, $s1, $zero
/* 3AEB4 8003A2B4 00621821 */  addu       $v1, $v1, $v0
/* 3AEB8 8003A2B8 0C0232F9 */  jal        free_romstring
/* 3AEBC 8003A2BC A683007C */   sh        $v1, 0x7c($s4)
/* 3AEC0 8003A2C0 0800E945 */  j          .L8003A514
/* 3AEC4 8003A2C4 3C03800E */   lui       $v1, 0x800e
.L8003A2C8:
/* 3AEC8 8003A2C8 3C02800E */  lui        $v0, %hi(item_romstring_id)
/* 3AECC 8003A2CC 2442BD48 */  addiu      $v0, $v0, %lo(item_romstring_id)
/* 3AED0 8003A2D0 30430003 */  andi       $v1, $v0, 3
/* 3AED4 8003A2D4 10600018 */  beqz       $v1, .L8003A338
/* 3AED8 8003A2D8 00802821 */   addu      $a1, $a0, $zero
/* 3AEDC 8003A2DC 24430140 */  addiu      $v1, $v0, 0x140
/* 3AEE0 8003A2E0 27BE0052 */  addiu      $fp, $sp, 0x52
.L8003A2E4:
/* 3AEE4 8003A2E4 88460000 */  lwl        $a2, ($v0)
/* 3AEE8 8003A2E8 98460003 */  lwr        $a2, 3($v0)
/* 3AEEC 8003A2EC 88470004 */  lwl        $a3, 4($v0)
/* 3AEF0 8003A2F0 98470007 */  lwr        $a3, 7($v0)
/* 3AEF4 8003A2F4 88480008 */  lwl        $t0, 8($v0)
/* 3AEF8 8003A2F8 9848000B */  lwr        $t0, 0xb($v0)
/* 3AEFC 8003A2FC 8849000C */  lwl        $t1, 0xc($v0)
/* 3AF00 8003A300 9849000F */  lwr        $t1, 0xf($v0)
/* 3AF04 8003A304 A8860000 */  swl        $a2, ($a0)
/* 3AF08 8003A308 B8860003 */  swr        $a2, 3($a0)
/* 3AF0C 8003A30C A8870004 */  swl        $a3, 4($a0)
/* 3AF10 8003A310 B8870007 */  swr        $a3, 7($a0)
/* 3AF14 8003A314 A8880008 */  swl        $t0, 8($a0)
/* 3AF18 8003A318 B888000B */  swr        $t0, 0xb($a0)
/* 3AF1C 8003A31C A889000C */  swl        $t1, 0xc($a0)
/* 3AF20 8003A320 B889000F */  swr        $t1, 0xf($a0)
/* 3AF24 8003A324 24420010 */  addiu      $v0, $v0, 0x10
/* 3AF28 8003A328 1443FFEE */  bne        $v0, $v1, .L8003A2E4
/* 3AF2C 8003A32C 24840010 */   addiu     $a0, $a0, 0x10
/* 3AF30 8003A330 0800E8DC */  j          .L8003A370
/* 3AF34 8003A334 00008821 */   addu      $s1, $zero, $zero
.L8003A338:
/* 3AF38 8003A338 24430140 */  addiu      $v1, $v0, 0x140
/* 3AF3C 8003A33C 27BE0052 */  addiu      $fp, $sp, 0x52
.L8003A340:
/* 3AF40 8003A340 8C460000 */  lw         $a2, ($v0)
/* 3AF44 8003A344 8C470004 */  lw         $a3, 4($v0)
/* 3AF48 8003A348 8C480008 */  lw         $t0, 8($v0)
/* 3AF4C 8003A34C 8C49000C */  lw         $t1, 0xc($v0)
/* 3AF50 8003A350 AC860000 */  sw         $a2, ($a0)
/* 3AF54 8003A354 AC870004 */  sw         $a3, 4($a0)
/* 3AF58 8003A358 AC880008 */  sw         $t0, 8($a0)
/* 3AF5C 8003A35C AC89000C */  sw         $t1, 0xc($a0)
/* 3AF60 8003A360 24420010 */  addiu      $v0, $v0, 0x10
/* 3AF64 8003A364 1443FFF6 */  bne        $v0, $v1, .L8003A340
/* 3AF68 8003A368 24840010 */   addiu     $a0, $a0, 0x10
/* 3AF6C 8003A36C 00008821 */  addu       $s1, $zero, $zero
.L8003A370:
/* 3AF70 8003A370 88430000 */  lwl        $v1, ($v0)
/* 3AF74 8003A374 98430003 */  lwr        $v1, 3($v0)
/* 3AF78 8003A378 88460004 */  lwl        $a2, 4($v0)
/* 3AF7C 8003A37C 98460007 */  lwr        $a2, 7($v0)
/* 3AF80 8003A380 88470008 */  lwl        $a3, 8($v0)
/* 3AF84 8003A384 9847000B */  lwr        $a3, 0xb($v0)
/* 3AF88 8003A388 A8830000 */  swl        $v1, ($a0)
/* 3AF8C 8003A38C B8830003 */  swr        $v1, 3($a0)
/* 3AF90 8003A390 A8860004 */  swl        $a2, 4($a0)
/* 3AF94 8003A394 B8860007 */  swr        $a2, 7($a0)
/* 3AF98 8003A398 A8870008 */  swl        $a3, 8($a0)
/* 3AF9C 8003A39C B887000B */  swr        $a3, 0xb($a0)
/* 3AFA0 8003A3A0 97A30050 */  lhu        $v1, 0x50($sp)
/* 3AFA4 8003A3A4 96620000 */  lhu        $v0, ($s3)
/* 3AFA8 8003A3A8 10620017 */  beq        $v1, $v0, .L8003A408
/* 3AFAC 8003A3AC 00A0A821 */   addu      $s5, $a1, $zero
/* 3AFB0 8003A3B0 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3AFB4 8003A3B4 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3AFB8 8003A3B8 3C17800E */  lui        $s7, 0x800e
/* 3AFBC 8003A3BC 3C16800E */  lui        $s6, 0x800e
/* 3AFC0 8003A3C0 26220001 */  addiu      $v0, $s1, 1
.L8003A3C4:
/* 3AFC4 8003A3C4 305100FF */  andi       $s1, $v0, 0xff
/* 3AFC8 8003A3C8 00111880 */  sll        $v1, $s1, 2
/* 3AFCC 8003A3CC 02A38021 */  addu       $s0, $s5, $v1
/* 3AFD0 8003A3D0 96020000 */  lhu        $v0, ($s0)
/* 3AFD4 8003A3D4 54400009 */  bnel       $v0, $zero, .L8003A3FC
/* 3AFD8 8003A3D8 96030000 */   lhu       $v1, ($s0)
/* 3AFDC 8003A3DC 02402021 */  addu       $a0, $s2, $zero
/* 3AFE0 8003A3E0 96660000 */  lhu        $a2, ($s3)
/* 3AFE4 8003A3E4 0C0333AC */  jal        sprintf
/* 3AFE8 8003A3E8 26E5BE94 */   addiu     $a1, $s7, -0x416c
/* 3AFEC 8003A3EC 26C4BD38 */  addiu      $a0, $s6, -0x42c8
/* 3AFF0 8003A3F0 0C025F2D */  jal        manualCrash
/* 3AFF4 8003A3F4 02402821 */   addu      $a1, $s2, $zero
/* 3AFF8 8003A3F8 96030000 */  lhu        $v1, ($s0)
.L8003A3FC:
/* 3AFFC 8003A3FC 96620000 */  lhu        $v0, ($s3)
/* 3B000 8003A400 1462FFF0 */  bne        $v1, $v0, .L8003A3C4
/* 3B004 8003A404 26220001 */   addiu     $v0, $s1, 1
.L8003A408:
/* 3B008 8003A408 3C09B1FE */  lui        $t1, %hi(romstring_items)
/* 3B00C 8003A40C 2524D7F0 */  addiu      $a0, $t1, %lo(romstring_items)
/* 3B010 8003A410 3C02B1FE */  lui        $v0, %hi(romstring_stats)
/* 3B014 8003A414 2445E6C0 */  addiu      $a1, $v0, %lo(romstring_stats)
/* 3B018 8003A418 0C0232A0 */  jal        func_romStrings
/* 3B01C 8003A41C 00A42823 */   subu      $a1, $a1, $a0
/* 3B020 8003A420 00111880 */  sll        $v1, $s1, 2
/* 3B024 8003A424 03C31821 */  addu       $v1, $fp, $v1
/* 3B028 8003A428 94640000 */  lhu        $a0, ($v1)
/* 3B02C 8003A42C 00408821 */  addu       $s1, $v0, $zero
/* 3B030 8003A430 00042080 */  sll        $a0, $a0, 2
/* 3B034 8003A434 00912021 */  addu       $a0, $a0, $s1
/* 3B038 8003A438 8C850000 */  lw         $a1, ($a0)
/* 3B03C 8003A43C 0C00E7D5 */  jal        get_item_info_text
/* 3B040 8003A440 02802021 */   addu      $a0, $s4, $zero
/* 3B044 8003A444 00408021 */  addu       $s0, $v0, $zero
/* 3B048 8003A448 02002021 */  addu       $a0, $s0, $zero
/* 3B04C 8003A44C 86850060 */  lh         $a1, 0x60($s4)
/* 3B050 8003A450 0C02EF52 */  jal        func_800BBD48
/* 3B054 8003A454 24060095 */   addiu     $a2, $zero, 0x95
/* 3B058 8003A458 8E030078 */  lw         $v1, 0x78($s0)
/* 3B05C 8003A45C 84640020 */  lh         $a0, 0x20($v1)
/* 3B060 8003A460 8C620024 */  lw         $v0, 0x24($v1)
/* 3B064 8003A464 0040F809 */  jalr       $v0
/* 3B068 8003A468 02042021 */   addu      $a0, $s0, $a0
/* 3B06C 8003A46C 9683007C */  lhu        $v1, 0x7c($s4)
/* 3B070 8003A470 02202021 */  addu       $a0, $s1, $zero
/* 3B074 8003A474 00621821 */  addu       $v1, $v1, $v0
/* 3B078 8003A478 0C0232F9 */  jal        free_romstring
/* 3B07C 8003A47C A683007C */   sh        $v1, 0x7c($s4)
/* 3B080 8003A480 96620000 */  lhu        $v0, ($s3)
/* 3B084 8003A484 24030011 */  addiu      $v1, $zero, 0x11
/* 3B088 8003A488 00021202 */  srl        $v0, $v0, 8
/* 3B08C 8003A48C 14430021 */  bne        $v0, $v1, .L8003A514
/* 3B090 8003A490 3C03800E */   lui       $v1, 0x800e
/* 3B094 8003A494 240200BB */  addiu      $v0, $zero, 0xbb
/* 3B098 8003A498 A682007C */  sh         $v0, 0x7c($s4)
/* 3B09C 8003A49C 0C01D7C6 */  jal        search_item_array
/* 3B0A0 8003A4A0 96640000 */   lhu       $a0, ($s3)
/* 3B0A4 8003A4A4 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 3B0A8 8003A4A8 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 3B0AC 8003A4AC 3C04800F */  lui        $a0, %hi(item_pointer)
/* 3B0B0 8003A4B0 8E03FFD4 */  lw         $v1, -0x2c($s0)
/* 3B0B4 8003A4B4 8C8614F0 */  lw         $a2, %lo(item_pointer)($a0)
/* 3B0B8 8003A4B8 8C650854 */  lw         $a1, 0x854($v1)
/* 3B0BC 8003A4BC 00021840 */  sll        $v1, $v0, 1
/* 3B0C0 8003A4C0 00621821 */  addu       $v1, $v1, $v0
/* 3B0C4 8003A4C4 8CC20018 */  lw         $v0, 0x18($a2)
/* 3B0C8 8003A4C8 00031900 */  sll        $v1, $v1, 4
/* 3B0CC 8003A4CC 00431021 */  addu       $v0, $v0, $v1
/* 3B0D0 8003A4D0 3C03800F */  lui        $v1, %hi(spell_pointer)
/* 3B0D4 8003A4D4 80440025 */  lb         $a0, 0x25($v0)
/* 3B0D8 8003A4D8 8C6616A0 */  lw         $a2, %lo(spell_pointer)($v1)
/* 3B0DC 8003A4DC 00041080 */  sll        $v0, $a0, 2
/* 3B0E0 8003A4E0 00441021 */  addu       $v0, $v0, $a0
/* 3B0E4 8003A4E4 00021080 */  sll        $v0, $v0, 2
/* 3B0E8 8003A4E8 00441023 */  subu       $v0, $v0, $a0
/* 3B0EC 8003A4EC 8CC30010 */  lw         $v1, 0x10($a2)
/* 3B0F0 8003A4F0 00021040 */  sll        $v0, $v0, 1
/* 3B0F4 8003A4F4 00621821 */  addu       $v1, $v1, $v0
/* 3B0F8 8003A4F8 90660020 */  lbu        $a2, 0x20($v1)
/* 3B0FC 8003A4FC 0C0333AC */  jal        sprintf
/* 3B100 8003A500 02002021 */   addu      $a0, $s0, $zero
/* 3B104 8003A504 02802021 */  addu       $a0, $s4, $zero
/* 3B108 8003A508 0C00E7D5 */  jal        get_item_info_text
/* 3B10C 8003A50C 02002821 */   addu      $a1, $s0, $zero
/* 3B110 8003A510 3C03800E */  lui        $v1, %hi(gGlobals)
.L8003A514:
/* 3B114 8003A514 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 3B118 8003A518 3C06800F */  lui        $a2, %hi(font_face)
/* 3B11C 8003A51C 8C441600 */  lw         $a0, 0x1600($v0)
/* 3B120 8003A520 0C02D0FD */  jal        font_func
/* 3B124 8003A524 8CC58D18 */   lw        $a1, %lo(font_face)($a2)
/* 3B128 8003A528 02801021 */  addu       $v0, $s4, $zero
/* 3B12C 8003A52C 8FBF01F4 */  lw         $ra, 0x1f4($sp)
/* 3B130 8003A530 8FBE01F0 */  lw         $fp, 0x1f0($sp)
/* 3B134 8003A534 8FB701EC */  lw         $s7, 0x1ec($sp)
/* 3B138 8003A538 8FB601E8 */  lw         $s6, 0x1e8($sp)
/* 3B13C 8003A53C 8FB501E4 */  lw         $s5, 0x1e4($sp)
/* 3B140 8003A540 8FB401E0 */  lw         $s4, 0x1e0($sp)
/* 3B144 8003A544 8FB301DC */  lw         $s3, 0x1dc($sp)
/* 3B148 8003A548 8FB201D8 */  lw         $s2, 0x1d8($sp)
/* 3B14C 8003A54C 8FB101D4 */  lw         $s1, 0x1d4($sp)
/* 3B150 8003A550 8FB001D0 */  lw         $s0, 0x1d0($sp)
/* 3B154 8003A554 03E00008 */  jr         $ra
/* 3B158 8003A558 27BD01F8 */   addiu     $sp, $sp, 0x1f8

glabel itemdetail_spells
/* 3B15C 8003A55C 27BDFE30 */  addiu      $sp, $sp, -0x1d0
/* 3B160 8003A560 AFB601C0 */  sw         $s6, 0x1c0($sp)
/* 3B164 8003A564 0080B021 */  addu       $s6, $a0, $zero
/* 3B168 8003A568 AFB701C4 */  sw         $s7, 0x1c4($sp)
/* 3B16C 8003A56C 00A0B821 */  addu       $s7, $a1, $zero
/* 3B170 8003A570 AFBF01CC */  sw         $ra, 0x1cc($sp)
/* 3B174 8003A574 AFBE01C8 */  sw         $fp, 0x1c8($sp)
/* 3B178 8003A578 AFB501BC */  sw         $s5, 0x1bc($sp)
/* 3B17C 8003A57C AFB401B8 */  sw         $s4, 0x1b8($sp)
/* 3B180 8003A580 AFB301B4 */  sw         $s3, 0x1b4($sp)
/* 3B184 8003A584 AFB201B0 */  sw         $s2, 0x1b0($sp)
/* 3B188 8003A588 AFB101AC */  sw         $s1, 0x1ac($sp)
/* 3B18C 8003A58C 0C02E658 */  jal        widget_menu_build
/* 3B190 8003A590 AFB001A8 */   sw        $s0, 0x1a8($sp)
/* 3B194 8003A594 3C13800E */  lui        $s3, %hi(gGlobals)
/* 3B198 8003A598 266268A8 */  addiu      $v0, $s3, %lo(gGlobals)
/* 3B19C 8003A59C 3C12800F */  lui        $s2, %hi(font_face)
/* 3B1A0 8003A5A0 26438D18 */  addiu      $v1, $s2, %lo(font_face)
/* 3B1A4 8003A5A4 8C441600 */  lw         $a0, 0x1600($v0)
/* 3B1A8 8003A5A8 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3B1AC 8003A5AC 8C650008 */  lw         $a1, 8($v1)
/* 3B1B0 8003A5B0 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3B1B4 8003A5B4 0C02D0FD */  jal        font_func
/* 3B1B8 8003A5B8 AEC20078 */   sw        $v0, 0x78($s6)
/* 3B1BC 8003A5BC 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3B1C0 8003A5C0 02C02021 */   addu      $a0, $s6, $zero
/* 3B1C4 8003A5C4 27A50198 */  addiu      $a1, $sp, 0x198
/* 3B1C8 8003A5C8 27A6019C */  addiu      $a2, $sp, 0x19c
/* 3B1CC 8003A5CC 27B101A0 */  addiu      $s1, $sp, 0x1a0
/* 3B1D0 8003A5D0 96E20000 */  lhu        $v0, ($s7)
/* 3B1D4 8003A5D4 02203821 */  addu       $a3, $s1, $zero
/* 3B1D8 8003A5D8 A6C2005E */  sh         $v0, 0x5e($s6)
/* 3B1DC 8003A5DC 0C0132B4 */  jal        get_spell_icons
/* 3B1E0 8003A5E0 3044FFFF */   andi      $a0, $v0, 0xffff
/* 3B1E4 8003A5E4 0C026259 */  jal        passToMalloc
/* 3B1E8 8003A5E8 2404007C */   addiu     $a0, $zero, 0x7c
/* 3B1EC 8003A5EC 8FA401A0 */  lw         $a0, 0x1a0($sp)
/* 3B1F0 8003A5F0 0C0290E2 */  jal        get_borg_8
/* 3B1F4 8003A5F4 00408021 */   addu      $s0, $v0, $zero
/* 3B1F8 8003A5F8 02002021 */  addu       $a0, $s0, $zero
/* 3B1FC 8003A5FC 0C02E518 */  jal        borg8_widget
/* 3B200 8003A600 00402821 */   addu      $a1, $v0, $zero
/* 3B204 8003A604 0040A821 */  addu       $s5, $v0, $zero
/* 3B208 8003A608 86C50060 */  lh         $a1, 0x60($s6)
/* 3B20C 8003A60C 96C6007C */  lhu        $a2, 0x7c($s6)
/* 3B210 8003A610 0C02DD3F */  jal        set_widget_coords
/* 3B214 8003A614 02A02021 */   addu      $a0, $s5, $zero
/* 3B218 8003A618 02C02021 */  addu       $a0, $s6, $zero
/* 3B21C 8003A61C 0C02DEDC */  jal        link_widgets
/* 3B220 8003A620 02A02821 */   addu      $a1, $s5, $zero
/* 3B224 8003A624 8EA30078 */  lw         $v1, 0x78($s5)
/* 3B228 8003A628 84640020 */  lh         $a0, 0x20($v1)
/* 3B22C 8003A62C 8C620024 */  lw         $v0, 0x24($v1)
/* 3B230 8003A630 0040F809 */  jalr       $v0
/* 3B234 8003A634 02A42021 */   addu      $a0, $s5, $a0
/* 3B238 8003A638 02C02021 */  addu       $a0, $s6, $zero
/* 3B23C 8003A63C 96C3007C */  lhu        $v1, 0x7c($s6)
/* 3B240 8003A640 8EE50004 */  lw         $a1, 4($s7)
/* 3B244 8003A644 24630002 */  addiu      $v1, $v1, 2
/* 3B248 8003A648 00431021 */  addu       $v0, $v0, $v1
/* 3B24C 8003A64C 0C00E7D5 */  jal        get_item_info_text
/* 3B250 8003A650 A6C2007C */   sh        $v0, 0x7c($s6)
/* 3B254 8003A654 8EA30078 */  lw         $v1, 0x78($s5)
/* 3B258 8003A658 0040A021 */  addu       $s4, $v0, $zero
/* 3B25C 8003A65C 84640018 */  lh         $a0, 0x18($v1)
/* 3B260 8003A660 8C62001C */  lw         $v0, 0x1c($v1)
/* 3B264 8003A664 0040F809 */  jalr       $v0
/* 3B268 8003A668 02A42021 */   addu      $a0, $s5, $a0
/* 3B26C 8003A66C 86D00060 */  lh         $s0, 0x60($s6)
/* 3B270 8003A670 8E830078 */  lw         $v1, 0x78($s4)
/* 3B274 8003A674 02028021 */  addu       $s0, $s0, $v0
/* 3B278 8003A678 26100002 */  addiu      $s0, $s0, 2
/* 3B27C 8003A67C 84640020 */  lh         $a0, 0x20($v1)
/* 3B280 8003A680 8C620024 */  lw         $v0, 0x24($v1)
/* 3B284 8003A684 0040F809 */  jalr       $v0
/* 3B288 8003A688 02842021 */   addu      $a0, $s4, $a0
/* 3B28C 8003A68C 02802021 */  addu       $a0, $s4, $zero
/* 3B290 8003A690 96C6007C */  lhu        $a2, 0x7c($s6)
/* 3B294 8003A694 02002821 */  addu       $a1, $s0, $zero
/* 3B298 8003A698 0C02DD3F */  jal        set_widget_coords
/* 3B29C 8003A69C 00C23023 */   subu      $a2, $a2, $v0
/* 3B2A0 8003A6A0 27A40018 */  addiu      $a0, $sp, 0x18
/* 3B2A4 8003A6A4 3C03800E */  lui        $v1, %hi(RomstringSpellIndecies)
/* 3B2A8 8003A6A8 2465BEA8 */  addiu      $a1, $v1, %lo(RomstringSpellIndecies)
/* 3B2AC 8003A6AC 30A30003 */  andi       $v1, $a1, 3
/* 3B2B0 8003A6B0 96C2007C */  lhu        $v0, 0x7c($s6)
/* 3B2B4 8003A6B4 00803021 */  addu       $a2, $a0, $zero
/* 3B2B8 8003A6B8 24420004 */  addiu      $v0, $v0, 4
/* 3B2BC 8003A6BC 10600018 */  beqz       $v1, .L8003A720
/* 3B2C0 8003A6C0 A6C2007C */   sh        $v0, 0x7c($s6)
/* 3B2C4 8003A6C4 24A200E0 */  addiu      $v0, $a1, 0xe0
/* 3B2C8 8003A6C8 27BE001A */  addiu      $fp, $sp, 0x1a
.L8003A6CC:
/* 3B2CC 8003A6CC 88A30000 */  lwl        $v1, ($a1)
/* 3B2D0 8003A6D0 98A30003 */  lwr        $v1, 3($a1)
/* 3B2D4 8003A6D4 88A70004 */  lwl        $a3, 4($a1)
/* 3B2D8 8003A6D8 98A70007 */  lwr        $a3, 7($a1)
/* 3B2DC 8003A6DC 88A80008 */  lwl        $t0, 8($a1)
/* 3B2E0 8003A6E0 98A8000B */  lwr        $t0, 0xb($a1)
/* 3B2E4 8003A6E4 88A9000C */  lwl        $t1, 0xc($a1)
/* 3B2E8 8003A6E8 98A9000F */  lwr        $t1, 0xf($a1)
/* 3B2EC 8003A6EC A8830000 */  swl        $v1, ($a0)
/* 3B2F0 8003A6F0 B8830003 */  swr        $v1, 3($a0)
/* 3B2F4 8003A6F4 A8870004 */  swl        $a3, 4($a0)
/* 3B2F8 8003A6F8 B8870007 */  swr        $a3, 7($a0)
/* 3B2FC 8003A6FC A8880008 */  swl        $t0, 8($a0)
/* 3B300 8003A700 B888000B */  swr        $t0, 0xb($a0)
/* 3B304 8003A704 A889000C */  swl        $t1, 0xc($a0)
/* 3B308 8003A708 B889000F */  swr        $t1, 0xf($a0)
/* 3B30C 8003A70C 24A50010 */  addiu      $a1, $a1, 0x10
/* 3B310 8003A710 14A2FFEE */  bne        $a1, $v0, .L8003A6CC
/* 3B314 8003A714 24840010 */   addiu     $a0, $a0, 0x10
/* 3B318 8003A718 0800E9D6 */  j          .L8003A758
/* 3B31C 8003A71C 00008821 */   addu      $s1, $zero, $zero
.L8003A720:
/* 3B320 8003A720 24A200E0 */  addiu      $v0, $a1, 0xe0
/* 3B324 8003A724 27BE001A */  addiu      $fp, $sp, 0x1a
.L8003A728:
/* 3B328 8003A728 8CA30000 */  lw         $v1, ($a1)
/* 3B32C 8003A72C 8CA70004 */  lw         $a3, 4($a1)
/* 3B330 8003A730 8CA80008 */  lw         $t0, 8($a1)
/* 3B334 8003A734 8CA9000C */  lw         $t1, 0xc($a1)
/* 3B338 8003A738 AC830000 */  sw         $v1, ($a0)
/* 3B33C 8003A73C AC870004 */  sw         $a3, 4($a0)
/* 3B340 8003A740 AC880008 */  sw         $t0, 8($a0)
/* 3B344 8003A744 AC89000C */  sw         $t1, 0xc($a0)
/* 3B348 8003A748 24A50010 */  addiu      $a1, $a1, 0x10
/* 3B34C 8003A74C 14A2FFF6 */  bne        $a1, $v0, .L8003A728
/* 3B350 8003A750 24840010 */   addiu     $a0, $a0, 0x10
/* 3B354 8003A754 00008821 */  addu       $s1, $zero, $zero
.L8003A758:
/* 3B358 8003A758 97A30018 */  lhu        $v1, 0x18($sp)
/* 3B35C 8003A75C 96E20000 */  lhu        $v0, ($s7)
/* 3B360 8003A760 10620017 */  beq        $v1, $v0, .L8003A7C0
/* 3B364 8003A764 00C0A021 */   addu      $s4, $a2, $zero
/* 3B368 8003A768 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3B36C 8003A76C 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3B370 8003A770 3C13800E */  lui        $s3, 0x800e
/* 3B374 8003A774 3C15800E */  lui        $s5, 0x800e
/* 3B378 8003A778 26220001 */  addiu      $v0, $s1, 1
.L8003A77C:
/* 3B37C 8003A77C 305100FF */  andi       $s1, $v0, 0xff
/* 3B380 8003A780 00111880 */  sll        $v1, $s1, 2
/* 3B384 8003A784 02838021 */  addu       $s0, $s4, $v1
/* 3B388 8003A788 96020000 */  lhu        $v0, ($s0)
/* 3B38C 8003A78C 54400009 */  bnel       $v0, $zero, .L8003A7B4
/* 3B390 8003A790 96030000 */   lhu       $v1, ($s0)
/* 3B394 8003A794 02402021 */  addu       $a0, $s2, $zero
/* 3B398 8003A798 96E60000 */  lhu        $a2, ($s7)
/* 3B39C 8003A79C 0C0333AC */  jal        sprintf
/* 3B3A0 8003A7A0 2665BF88 */   addiu     $a1, $s3, -0x4078
/* 3B3A4 8003A7A4 26A4BD38 */  addiu      $a0, $s5, -0x42c8
/* 3B3A8 8003A7A8 0C025F2D */  jal        manualCrash
/* 3B3AC 8003A7AC 02402821 */   addu      $a1, $s2, $zero
/* 3B3B0 8003A7B0 96030000 */  lhu        $v1, ($s0)
.L8003A7B4:
/* 3B3B4 8003A7B4 96E20000 */  lhu        $v0, ($s7)
/* 3B3B8 8003A7B8 1462FFF0 */  bne        $v1, $v0, .L8003A77C
/* 3B3BC 8003A7BC 26220001 */   addiu     $v0, $s1, 1
.L8003A7C0:
/* 3B3C0 8003A7C0 3C02B1FE */  lui        $v0, %hi(romstring_spells)
/* 3B3C4 8003A7C4 2444E9B0 */  addiu      $a0, $v0, %lo(romstring_spells)
/* 3B3C8 8003A7C8 3C03B1FE */  lui        $v1, %hi(item_details)
/* 3B3CC 8003A7CC 2465FD50 */  addiu      $a1, $v1, %lo(item_details)
/* 3B3D0 8003A7D0 0C0232A0 */  jal        func_romStrings
/* 3B3D4 8003A7D4 00A42823 */   subu      $a1, $a1, $a0
/* 3B3D8 8003A7D8 00111880 */  sll        $v1, $s1, 2
/* 3B3DC 8003A7DC 03C31821 */  addu       $v1, $fp, $v1
/* 3B3E0 8003A7E0 94640000 */  lhu        $a0, ($v1)
/* 3B3E4 8003A7E4 00408021 */  addu       $s0, $v0, $zero
/* 3B3E8 8003A7E8 00042080 */  sll        $a0, $a0, 2
/* 3B3EC 8003A7EC 00902021 */  addu       $a0, $a0, $s0
/* 3B3F0 8003A7F0 8C850000 */  lw         $a1, ($a0)
/* 3B3F4 8003A7F4 0C00E7D5 */  jal        get_item_info_text
/* 3B3F8 8003A7F8 02C02021 */   addu      $a0, $s6, $zero
/* 3B3FC 8003A7FC 0040A021 */  addu       $s4, $v0, $zero
/* 3B400 8003A800 02802021 */  addu       $a0, $s4, $zero
/* 3B404 8003A804 86C50060 */  lh         $a1, 0x60($s6)
/* 3B408 8003A808 0C02EF52 */  jal        func_800BBD48
/* 3B40C 8003A80C 24060095 */   addiu     $a2, $zero, 0x95
/* 3B410 8003A810 8E830078 */  lw         $v1, 0x78($s4)
/* 3B414 8003A814 84640020 */  lh         $a0, 0x20($v1)
/* 3B418 8003A818 8C620024 */  lw         $v0, 0x24($v1)
/* 3B41C 8003A81C 0040F809 */  jalr       $v0
/* 3B420 8003A820 02842021 */   addu      $a0, $s4, $a0
/* 3B424 8003A824 96C3007C */  lhu        $v1, 0x7c($s6)
/* 3B428 8003A828 02002021 */  addu       $a0, $s0, $zero
/* 3B42C 8003A82C 00621821 */  addu       $v1, $v1, $v0
/* 3B430 8003A830 0C0232F9 */  jal        free_romstring
/* 3B434 8003A834 A6C3007C */   sh        $v1, 0x7c($s6)
/* 3B438 8003A838 92E2001A */  lbu        $v0, 0x1a($s7)
/* 3B43C 8003A83C 1040000D */  beqz       $v0, .L8003A874
/* 3B440 8003A840 240200BB */   addiu     $v0, $zero, 0xbb
/* 3B444 8003A844 3C07800E */  lui        $a3, %hi(gGlobals)
/* 3B448 8003A848 24E368A8 */  addiu      $v1, $a3, %lo(gGlobals)
/* 3B44C 8003A84C 27B00118 */  addiu      $s0, $sp, 0x118
/* 3B450 8003A850 A6C2007C */  sh         $v0, 0x7c($s6)
/* 3B454 8003A854 8C62204C */  lw         $v0, 0x204c($v1)
/* 3B458 8003A858 92E6001A */  lbu        $a2, 0x1a($s7)
/* 3B45C 8003A85C 8C450854 */  lw         $a1, 0x854($v0)
/* 3B460 8003A860 0C0333AC */  jal        sprintf
/* 3B464 8003A864 02002021 */   addu      $a0, $s0, $zero
/* 3B468 8003A868 02C02021 */  addu       $a0, $s6, $zero
/* 3B46C 8003A86C 0C00E7D5 */  jal        get_item_info_text
/* 3B470 8003A870 02002821 */   addu      $a1, $s0, $zero
.L8003A874:
/* 3B474 8003A874 92E2001D */  lbu        $v0, 0x1d($s7)
/* 3B478 8003A878 10400088 */  beqz       $v0, .L8003AA9C
/* 3B47C 8003A87C 00402821 */   addu      $a1, $v0, $zero
/* 3B480 8003A880 24020002 */  addiu      $v0, $zero, 2
/* 3B484 8003A884 10A20008 */  beq        $a1, $v0, .L8003A8A8
/* 3B488 8003A888 28A20003 */   slti      $v0, $a1, 3
/* 3B48C 8003A88C 10400009 */  beqz       $v0, .L8003A8B4
/* 3B490 8003A890 24020001 */   addiu     $v0, $zero, 1
/* 3B494 8003A894 14A20008 */  bne        $a1, $v0, .L8003A8B8
/* 3B498 8003A898 3C02800F */   lui       $v0, 0x800f
/* 3B49C 8003A89C 3C02800F */  lui        $v0, %hi(itemID_array+0x3C)
/* 3B4A0 8003A8A0 0800EA2F */  j          .L8003A8BC
/* 3B4A4 8003A8A4 9453153C */   lhu       $s3, %lo(itemID_array+0x3C)($v0)
.L8003A8A8:
/* 3B4A8 8003A8A8 3C02800F */  lui        $v0, %hi(itemID_array+0x3E)
/* 3B4AC 8003A8AC 0800EA2F */  j          .L8003A8BC
/* 3B4B0 8003A8B0 9453153E */   lhu       $s3, %lo(itemID_array+0x3E)($v0)
.L8003A8B4:
/* 3B4B4 8003A8B4 3C02800F */  lui        $v0, %hi(itemID_array+0x40)
.L8003A8B8:
/* 3B4B8 8003A8B8 94531540 */  lhu        $s3, %lo(itemID_array+0x40)($v0)
.L8003A8BC:
/* 3B4BC 8003A8BC 3C08800E */  lui        $t0, %hi(gGlobals)
/* 3B4C0 8003A8C0 250268A8 */  addiu      $v0, $t0, %lo(gGlobals)
/* 3B4C4 8003A8C4 8C43204C */  lw         $v1, 0x204c($v0)
/* 3B4C8 8003A8C8 27B00118 */  addiu      $s0, $sp, 0x118
/* 3B4CC 8003A8CC 8C650858 */  lw         $a1, 0x858($v1)
/* 3B4D0 8003A8D0 0C02626C */  jal        copy_string
/* 3B4D4 8003A8D4 02002021 */   addu      $a0, $s0, $zero
/* 3B4D8 8003A8D8 0C026259 */  jal        passToMalloc
/* 3B4DC 8003A8DC 2404007C */   addiu     $a0, $zero, 0x7c
/* 3B4E0 8003A8E0 00402021 */  addu       $a0, $v0, $zero
/* 3B4E4 8003A8E4 02002821 */  addu       $a1, $s0, $zero
/* 3B4E8 8003A8E8 0C02DFC8 */  jal        widgetcliptext_init
/* 3B4EC 8003A8EC 24060190 */   addiu     $a2, $zero, 0x190
/* 3B4F0 8003A8F0 0040A021 */  addu       $s4, $v0, $zero
/* 3B4F4 8003A8F4 8E830078 */  lw         $v1, 0x78($s4)
/* 3B4F8 8003A8F8 84640020 */  lh         $a0, 0x20($v1)
/* 3B4FC 8003A8FC 8C620024 */  lw         $v0, 0x24($v1)
/* 3B500 8003A900 0040F809 */  jalr       $v0
/* 3B504 8003A904 02842021 */   addu      $a0, $s4, $a0
/* 3B508 8003A908 24050082 */  addiu      $a1, $zero, 0x82
/* 3B50C 8003A90C 24060050 */  addiu      $a2, $zero, 0x50
/* 3B510 8003A910 24070050 */  addiu      $a3, $zero, 0x50
/* 3B514 8003A914 00408821 */  addu       $s1, $v0, $zero
/* 3B518 8003A918 8E830078 */  lw         $v1, 0x78($s4)
/* 3B51C 8003A91C 262200BB */  addiu      $v0, $s1, 0xbb
/* 3B520 8003A920 A6C2007C */  sh         $v0, 0x7c($s6)
/* 3B524 8003A924 84640048 */  lh         $a0, 0x48($v1)
/* 3B528 8003A928 241200FF */  addiu      $s2, $zero, 0xff
/* 3B52C 8003A92C AFB20010 */  sw         $s2, 0x10($sp)
/* 3B530 8003A930 8C62004C */  lw         $v0, 0x4c($v1)
/* 3B534 8003A934 0040F809 */  jalr       $v0
/* 3B538 8003A938 02842021 */   addu      $a0, $s4, $a0
/* 3B53C 8003A93C 86C50060 */  lh         $a1, 0x60($s6)
/* 3B540 8003A940 96C6007C */  lhu        $a2, 0x7c($s6)
/* 3B544 8003A944 0C02DD3F */  jal        set_widget_coords
/* 3B548 8003A948 02802021 */   addu      $a0, $s4, $zero
/* 3B54C 8003A94C 02C02021 */  addu       $a0, $s6, $zero
/* 3B550 8003A950 0C02DEDC */  jal        link_widgets
/* 3B554 8003A954 02802821 */   addu      $a1, $s4, $zero
/* 3B558 8003A958 02602021 */  addu       $a0, $s3, $zero
/* 3B55C 8003A95C 0C013218 */  jal        GetItemImage
/* 3B560 8003A960 27A501A0 */   addiu     $a1, $sp, 0x1a0
/* 3B564 8003A964 0C026259 */  jal        passToMalloc
/* 3B568 8003A968 2404007C */   addiu     $a0, $zero, 0x7c
/* 3B56C 8003A96C 8FA401A0 */  lw         $a0, 0x1a0($sp)
/* 3B570 8003A970 0C0290E2 */  jal        get_borg_8
/* 3B574 8003A974 00408021 */   addu      $s0, $v0, $zero
/* 3B578 8003A978 02002021 */  addu       $a0, $s0, $zero
/* 3B57C 8003A97C 0C02E518 */  jal        borg8_widget
/* 3B580 8003A980 00402821 */   addu      $a1, $v0, $zero
/* 3B584 8003A984 8E830078 */  lw         $v1, 0x78($s4)
/* 3B588 8003A988 0040A821 */  addu       $s5, $v0, $zero
/* 3B58C 8003A98C 84640018 */  lh         $a0, 0x18($v1)
/* 3B590 8003A990 8C62001C */  lw         $v0, 0x1c($v1)
/* 3B594 8003A994 0040F809 */  jalr       $v0
/* 3B598 8003A998 02842021 */   addu      $a0, $s4, $a0
/* 3B59C 8003A99C 02A02021 */  addu       $a0, $s5, $zero
/* 3B5A0 8003A9A0 86C50060 */  lh         $a1, 0x60($s6)
/* 3B5A4 8003A9A4 96C6007C */  lhu        $a2, 0x7c($s6)
/* 3B5A8 8003A9A8 0C02DD3F */  jal        set_widget_coords
/* 3B5AC 8003A9AC 00A22821 */   addu      $a1, $a1, $v0
/* 3B5B0 8003A9B0 02A02021 */  addu       $a0, $s5, $zero
/* 3B5B4 8003A9B4 2631FFFE */  addiu      $s1, $s1, -2
/* 3B5B8 8003A9B8 3231FFFF */  andi       $s1, $s1, 0xffff
/* 3B5BC 8003A9BC 0C02DD42 */  jal        set_widgetHeight
/* 3B5C0 8003A9C0 02202821 */   addu      $a1, $s1, $zero
/* 3B5C4 8003A9C4 02A02021 */  addu       $a0, $s5, $zero
/* 3B5C8 8003A9C8 0C02DD46 */  jal        set_widgetWidth
/* 3B5CC 8003A9CC 02202821 */   addu      $a1, $s1, $zero
/* 3B5D0 8003A9D0 02C02021 */  addu       $a0, $s6, $zero
/* 3B5D4 8003A9D4 0C02DEDC */  jal        link_widgets
/* 3B5D8 8003A9D8 02A02821 */   addu      $a1, $s5, $zero
/* 3B5DC 8003A9DC 0C026259 */  jal        passToMalloc
/* 3B5E0 8003A9E0 2404007C */   addiu     $a0, $zero, 0x7c
/* 3B5E4 8003A9E4 02602021 */  addu       $a0, $s3, $zero
/* 3B5E8 8003A9E8 0C01D7C6 */  jal        search_item_array
/* 3B5EC 8003A9EC 00408021 */   addu      $s0, $v0, $zero
/* 3B5F0 8003A9F0 02002021 */  addu       $a0, $s0, $zero
/* 3B5F4 8003A9F4 24060190 */  addiu      $a2, $zero, 0x190
/* 3B5F8 8003A9F8 3C05800F */  lui        $a1, %hi(item_pointer)
/* 3B5FC 8003A9FC 00021840 */  sll        $v1, $v0, 1
/* 3B600 8003AA00 8CA714F0 */  lw         $a3, %lo(item_pointer)($a1)
/* 3B604 8003AA04 00621821 */  addu       $v1, $v1, $v0
/* 3B608 8003AA08 8CE50018 */  lw         $a1, 0x18($a3)
/* 3B60C 8003AA0C 00031900 */  sll        $v1, $v1, 4
/* 3B610 8003AA10 00A32821 */  addu       $a1, $a1, $v1
/* 3B614 8003AA14 0C02DFC8 */  jal        widgetcliptext_init
/* 3B618 8003AA18 24A50002 */   addiu     $a1, $a1, 2
/* 3B61C 8003AA1C 0040A021 */  addu       $s4, $v0, $zero
/* 3B620 8003AA20 24050082 */  addiu      $a1, $zero, 0x82
/* 3B624 8003AA24 8E830078 */  lw         $v1, 0x78($s4)
/* 3B628 8003AA28 24060050 */  addiu      $a2, $zero, 0x50
/* 3B62C 8003AA2C 84640048 */  lh         $a0, 0x48($v1)
/* 3B630 8003AA30 24070050 */  addiu      $a3, $zero, 0x50
/* 3B634 8003AA34 AFB20010 */  sw         $s2, 0x10($sp)
/* 3B638 8003AA38 8C62004C */  lw         $v0, 0x4c($v1)
/* 3B63C 8003AA3C 0040F809 */  jalr       $v0
/* 3B640 8003AA40 02842021 */   addu      $a0, $s4, $a0
/* 3B644 8003AA44 8EA30078 */  lw         $v1, 0x78($s5)
/* 3B648 8003AA48 84640018 */  lh         $a0, 0x18($v1)
/* 3B64C 8003AA4C 8C62001C */  lw         $v0, 0x1c($v1)
/* 3B650 8003AA50 0040F809 */  jalr       $v0
/* 3B654 8003AA54 02A42021 */   addu      $a0, $s5, $a0
/* 3B658 8003AA58 02802021 */  addu       $a0, $s4, $zero
/* 3B65C 8003AA5C 86A50060 */  lh         $a1, 0x60($s5)
/* 3B660 8003AA60 96C6007C */  lhu        $a2, 0x7c($s6)
/* 3B664 8003AA64 00A22821 */  addu       $a1, $a1, $v0
/* 3B668 8003AA68 0C02DD3F */  jal        set_widget_coords
/* 3B66C 8003AA6C 24A50002 */   addiu     $a1, $a1, 2
/* 3B670 8003AA70 02C02021 */  addu       $a0, $s6, $zero
/* 3B674 8003AA74 0C02DEDC */  jal        link_widgets
/* 3B678 8003AA78 02802821 */   addu      $a1, $s4, $zero
/* 3B67C 8003AA7C 8E830078 */  lw         $v1, 0x78($s4)
/* 3B680 8003AA80 84640020 */  lh         $a0, 0x20($v1)
/* 3B684 8003AA84 8C620024 */  lw         $v0, 0x24($v1)
/* 3B688 8003AA88 0040F809 */  jalr       $v0
/* 3B68C 8003AA8C 02842021 */   addu      $a0, $s4, $a0
/* 3B690 8003AA90 96C3007C */  lhu        $v1, 0x7c($s6)
/* 3B694 8003AA94 00621823 */  subu       $v1, $v1, $v0
/* 3B698 8003AA98 A6C3007C */  sh         $v1, 0x7c($s6)
.L8003AA9C:
/* 3B69C 8003AA9C 3C09800E */  lui        $t1, %hi(gGlobals)
/* 3B6A0 8003AAA0 252268A8 */  addiu      $v0, $t1, %lo(gGlobals)
/* 3B6A4 8003AAA4 8C441600 */  lw         $a0, 0x1600($v0)
/* 3B6A8 8003AAA8 3C02800F */  lui        $v0, %hi(font_face)
/* 3B6AC 8003AAAC 0C02D0FD */  jal        font_func
/* 3B6B0 8003AAB0 8C458D18 */   lw        $a1, %lo(font_face)($v0)
/* 3B6B4 8003AAB4 02C01021 */  addu       $v0, $s6, $zero
/* 3B6B8 8003AAB8 8FBF01CC */  lw         $ra, 0x1cc($sp)
/* 3B6BC 8003AABC 8FBE01C8 */  lw         $fp, 0x1c8($sp)
/* 3B6C0 8003AAC0 8FB701C4 */  lw         $s7, 0x1c4($sp)
/* 3B6C4 8003AAC4 8FB601C0 */  lw         $s6, 0x1c0($sp)
/* 3B6C8 8003AAC8 8FB501BC */  lw         $s5, 0x1bc($sp)
/* 3B6CC 8003AACC 8FB401B8 */  lw         $s4, 0x1b8($sp)
/* 3B6D0 8003AAD0 8FB301B4 */  lw         $s3, 0x1b4($sp)
/* 3B6D4 8003AAD4 8FB201B0 */  lw         $s2, 0x1b0($sp)
/* 3B6D8 8003AAD8 8FB101AC */  lw         $s1, 0x1ac($sp)
/* 3B6DC 8003AADC 8FB001A8 */  lw         $s0, 0x1a8($sp)
/* 3B6E0 8003AAE0 03E00008 */  jr         $ra
/* 3B6E4 8003AAE4 27BD01D0 */   addiu     $sp, $sp, 0x1d0

glabel itemdetail_stats
/* 3B6E8 8003AAE8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3B6EC 8003AAEC AFB10014 */  sw         $s1, 0x14($sp)
/* 3B6F0 8003AAF0 00808821 */  addu       $s1, $a0, $zero
/* 3B6F4 8003AAF4 AFB00010 */  sw         $s0, 0x10($sp)
/* 3B6F8 8003AAF8 30D0FFFF */  andi       $s0, $a2, 0xffff
/* 3B6FC 8003AAFC AFBF0024 */  sw         $ra, 0x24($sp)
/* 3B700 8003AB00 AFB40020 */  sw         $s4, 0x20($sp)
/* 3B704 8003AB04 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3B708 8003AB08 0C02E658 */  jal        widget_menu_build
/* 3B70C 8003AB0C AFB20018 */   sw        $s2, 0x18($sp)
/* 3B710 8003AB10 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3B714 8003AB14 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 3B718 8003AB18 3C14800F */  lui        $s4, %hi(font_face)
/* 3B71C 8003AB1C 26838D18 */  addiu      $v1, $s4, %lo(font_face)
/* 3B720 8003AB20 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3B724 8003AB24 8E441600 */  lw         $a0, 0x1600($s2)
/* 3B728 8003AB28 8C650008 */  lw         $a1, 8($v1)
/* 3B72C 8003AB2C 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3B730 8003AB30 0C02D0FD */  jal        font_func
/* 3B734 8003AB34 AE220078 */   sw        $v0, 0x78($s1)
/* 3B738 8003AB38 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3B73C 8003AB3C 02202021 */   addu      $a0, $s1, $zero
/* 3B740 8003AB40 3C04B1FE */  lui        $a0, %hi(romstring_stats)
/* 3B744 8003AB44 2484E6C0 */  addiu      $a0, $a0, %lo(romstring_stats)
/* 3B748 8003AB48 3C05B1FE */  lui        $a1, %hi(romstring_spells)
/* 3B74C 8003AB4C 24A5E9B0 */  addiu      $a1, $a1, %lo(romstring_spells)
/* 3B750 8003AB50 00A42823 */  subu       $a1, $a1, $a0
/* 3B754 8003AB54 0C0232A0 */  jal        func_romStrings
/* 3B758 8003AB58 A630005E */   sh        $s0, 0x5e($s1)
/* 3B75C 8003AB5C 9623005E */  lhu        $v1, 0x5e($s1)
/* 3B760 8003AB60 00409821 */  addu       $s3, $v0, $zero
/* 3B764 8003AB64 00031880 */  sll        $v1, $v1, 2
/* 3B768 8003AB68 00731821 */  addu       $v1, $v1, $s3
/* 3B76C 8003AB6C 8C650000 */  lw         $a1, ($v1)
/* 3B770 8003AB70 0C00E7D5 */  jal        get_item_info_text
/* 3B774 8003AB74 02202021 */   addu      $a0, $s1, $zero
/* 3B778 8003AB78 00408021 */  addu       $s0, $v0, $zero
/* 3B77C 8003AB7C 02002021 */  addu       $a0, $s0, $zero
/* 3B780 8003AB80 86250060 */  lh         $a1, 0x60($s1)
/* 3B784 8003AB84 0C02EF52 */  jal        func_800BBD48
/* 3B788 8003AB88 24060095 */   addiu     $a2, $zero, 0x95
/* 3B78C 8003AB8C 8E030078 */  lw         $v1, 0x78($s0)
/* 3B790 8003AB90 84640020 */  lh         $a0, 0x20($v1)
/* 3B794 8003AB94 8C620024 */  lw         $v0, 0x24($v1)
/* 3B798 8003AB98 0040F809 */  jalr       $v0
/* 3B79C 8003AB9C 02042021 */   addu      $a0, $s0, $a0
/* 3B7A0 8003ABA0 9623007C */  lhu        $v1, 0x7c($s1)
/* 3B7A4 8003ABA4 02602021 */  addu       $a0, $s3, $zero
/* 3B7A8 8003ABA8 00621821 */  addu       $v1, $v1, $v0
/* 3B7AC 8003ABAC 0C0232F9 */  jal        free_romstring
/* 3B7B0 8003ABB0 A623007C */   sh        $v1, 0x7c($s1)
/* 3B7B4 8003ABB4 8E441600 */  lw         $a0, 0x1600($s2)
/* 3B7B8 8003ABB8 0C02D0FD */  jal        font_func
/* 3B7BC 8003ABBC 8E858D18 */   lw        $a1, -0x72e8($s4)
/* 3B7C0 8003ABC0 02201021 */  addu       $v0, $s1, $zero
/* 3B7C4 8003ABC4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 3B7C8 8003ABC8 8FB40020 */  lw         $s4, 0x20($sp)
/* 3B7CC 8003ABCC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3B7D0 8003ABD0 8FB20018 */  lw         $s2, 0x18($sp)
/* 3B7D4 8003ABD4 8FB10014 */  lw         $s1, 0x14($sp)
/* 3B7D8 8003ABD8 8FB00010 */  lw         $s0, 0x10($sp)
/* 3B7DC 8003ABDC 03E00008 */  jr         $ra
/* 3B7E0 8003ABE0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel itemdetail
/* 3B7E4 8003ABE4 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 3B7E8 8003ABE8 AFB3005C */  sw         $s3, 0x5c($sp)
/* 3B7EC 8003ABEC 00809821 */  addu       $s3, $a0, $zero
/* 3B7F0 8003ABF0 AFB00050 */  sw         $s0, 0x50($sp)
/* 3B7F4 8003ABF4 30D0FFFF */  andi       $s0, $a2, 0xffff
/* 3B7F8 8003ABF8 AFBF006C */  sw         $ra, 0x6c($sp)
/* 3B7FC 8003ABFC AFB60068 */  sw         $s6, 0x68($sp)
/* 3B800 8003AC00 AFB50064 */  sw         $s5, 0x64($sp)
/* 3B804 8003AC04 AFB40060 */  sw         $s4, 0x60($sp)
/* 3B808 8003AC08 AFB20058 */  sw         $s2, 0x58($sp)
/* 3B80C 8003AC0C 0C02E658 */  jal        widget_menu_build
/* 3B810 8003AC10 AFB10054 */   sw        $s1, 0x54($sp)
/* 3B814 8003AC14 0000A021 */  addu       $s4, $zero, $zero
/* 3B818 8003AC18 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3B81C 8003AC1C 265568A8 */  addiu      $s5, $s2, %lo(gGlobals)
/* 3B820 8003AC20 3C11800F */  lui        $s1, %hi(font_face)
/* 3B824 8003AC24 26238D18 */  addiu      $v1, $s1, %lo(font_face)
/* 3B828 8003AC28 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3B82C 8003AC2C 8EA41600 */  lw         $a0, 0x1600($s5)
/* 3B830 8003AC30 8C650008 */  lw         $a1, 8($v1)
/* 3B834 8003AC34 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3B838 8003AC38 0C02D0FD */  jal        font_func
/* 3B83C 8003AC3C AE620078 */   sw        $v0, 0x78($s3)
/* 3B840 8003AC40 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3B844 8003AC44 02602021 */   addu      $a0, $s3, $zero
/* 3B848 8003AC48 00101A02 */  srl        $v1, $s0, 8
/* 3B84C 8003AC4C 320600FF */  andi       $a2, $s0, 0xff
/* 3B850 8003AC50 24020001 */  addiu      $v0, $zero, 1
/* 3B854 8003AC54 0220B021 */  addu       $s6, $s1, $zero
/* 3B858 8003AC58 1062000C */  beq        $v1, $v0, .L8003AC8C
/* 3B85C 8003AC5C A670005E */   sh        $s0, 0x5e($s3)
/* 3B860 8003AC60 28620002 */  slti       $v0, $v1, 2
/* 3B864 8003AC64 10400005 */  beqz       $v0, .L8003AC7C
/* 3B868 8003AC68 24020002 */   addiu     $v0, $zero, 2
/* 3B86C 8003AC6C 50600033 */  beql       $v1, $zero, .L8003AD3C
/* 3B870 8003AC70 00C0A021 */   addu      $s4, $a2, $zero
/* 3B874 8003AC74 0800EB4B */  j          .L8003AD2C
/* 3B878 8003AC78 3C04800E */   lui       $a0, 0x800e
.L8003AC7C:
/* 3B87C 8003AC7C 5062002F */  beql       $v1, $v0, .L8003AD3C
/* 3B880 8003AC80 24140011 */   addiu     $s4, $zero, 0x11
/* 3B884 8003AC84 0800EB4B */  j          .L8003AD2C
/* 3B888 8003AC88 3C04800E */   lui       $a0, 0x800e
.L8003AC8C:
/* 3B88C 8003AC8C 3C02800E */  lui        $v0, %hi(D_800DBF9C)
/* 3B890 8003AC90 2447BF9C */  addiu      $a3, $v0, %lo(D_800DBF9C)
/* 3B894 8003AC94 88E30000 */  lwl        $v1, ($a3)
/* 3B898 8003AC98 98E30003 */  lwr        $v1, 3($a3)
/* 3B89C 8003AC9C 88E40004 */  lwl        $a0, 4($a3)
/* 3B8A0 8003ACA0 98E40007 */  lwr        $a0, 7($a3)
/* 3B8A4 8003ACA4 88E50008 */  lwl        $a1, 8($a3)
/* 3B8A8 8003ACA8 98E5000B */  lwr        $a1, 0xb($a3)
/* 3B8AC 8003ACAC ABA30010 */  swl        $v1, 0x10($sp)
/* 3B8B0 8003ACB0 BBA30013 */  swr        $v1, 0x13($sp)
/* 3B8B4 8003ACB4 ABA40014 */  swl        $a0, 0x14($sp)
/* 3B8B8 8003ACB8 BBA40017 */  swr        $a0, 0x17($sp)
/* 3B8BC 8003ACBC ABA50018 */  swl        $a1, 0x18($sp)
/* 3B8C0 8003ACC0 BBA5001B */  swr        $a1, 0x1b($sp)
/* 3B8C4 8003ACC4 88E3000C */  lwl        $v1, 0xc($a3)
/* 3B8C8 8003ACC8 98E3000F */  lwr        $v1, 0xf($a3)
/* 3B8CC 8003ACCC 88E40010 */  lwl        $a0, 0x10($a3)
/* 3B8D0 8003ACD0 98E40013 */  lwr        $a0, 0x13($a3)
/* 3B8D4 8003ACD4 84E50014 */  lh         $a1, 0x14($a3)
/* 3B8D8 8003ACD8 ABA3001C */  swl        $v1, 0x1c($sp)
/* 3B8DC 8003ACDC BBA3001F */  swr        $v1, 0x1f($sp)
/* 3B8E0 8003ACE0 ABA40020 */  swl        $a0, 0x20($sp)
/* 3B8E4 8003ACE4 BBA40023 */  swr        $a0, 0x23($sp)
/* 3B8E8 8003ACE8 A7A50024 */  sh         $a1, 0x24($sp)
/* 3B8EC 8003ACEC 00061840 */  sll        $v1, $a2, 1
/* 3B8F0 8003ACF0 03A31021 */  addu       $v0, $sp, $v1
/* 3B8F4 8003ACF4 94540010 */  lhu        $s4, 0x10($v0)
/* 3B8F8 8003ACF8 56800011 */  bnel       $s4, $zero, .L8003AD40
/* 3B8FC 8003ACFC 3C04B1FE */   lui       $a0, 0xb1fe
/* 3B900 8003AD00 26B02078 */  addiu      $s0, $s5, 0x2078
/* 3B904 8003AD04 02002021 */  addu       $a0, $s0, $zero
/* 3B908 8003AD08 3C05800E */  lui        $a1, %hi(D_800DBFB4)
/* 3B90C 8003AD0C 0C0333AC */  jal        sprintf
/* 3B910 8003AD10 24A5BFB4 */   addiu     $a1, $a1, %lo(D_800DBFB4)
/* 3B914 8003AD14 3C04800E */  lui        $a0, %hi(D_800DBD38)
/* 3B918 8003AD18 2484BD38 */  addiu      $a0, $a0, %lo(D_800DBD38)
/* 3B91C 8003AD1C 0C025F2D */  jal        manualCrash
/* 3B920 8003AD20 02002821 */   addu      $a1, $s0, $zero
/* 3B924 8003AD24 0800EB50 */  j          .L8003AD40
/* 3B928 8003AD28 3C04B1FE */   lui       $a0, %hi(D_B1FDBD38)
.L8003AD2C:
/* 3B92C 8003AD2C 2484BD38 */  addiu      $a0, $a0, %lo(D_B1FDBD38)
/* 3B930 8003AD30 3C05800E */  lui        $a1, %hi(D_800DBFD8)
/* 3B934 8003AD34 0C025F2D */  jal        manualCrash
/* 3B938 8003AD38 24A5BFD8 */   addiu     $a1, $a1, %lo(D_800DBFD8)
.L8003AD3C:
/* 3B93C 8003AD3C 3C04B1FE */  lui        $a0, %hi(item_details)
.L8003AD40:
/* 3B940 8003AD40 2484FD50 */  addiu      $a0, $a0, %lo(item_details)
/* 3B944 8003AD44 3C05B1FE */  lui        $a1, %hi(romstring_potiondetails)
/* 3B948 8003AD48 24A504E0 */  addiu      $a1, $a1, %lo(romstring_potiondetails)
/* 3B94C 8003AD4C 0C0232A0 */  jal        func_romStrings
/* 3B950 8003AD50 00A42823 */   subu      $a1, $a1, $a0
/* 3B954 8003AD54 00408821 */  addu       $s1, $v0, $zero
/* 3B958 8003AD58 00141080 */  sll        $v0, $s4, 2
/* 3B95C 8003AD5C 00511021 */  addu       $v0, $v0, $s1
/* 3B960 8003AD60 8C450000 */  lw         $a1, ($v0)
/* 3B964 8003AD64 0C00E7D5 */  jal        get_item_info_text
/* 3B968 8003AD68 02602021 */   addu      $a0, $s3, $zero
/* 3B96C 8003AD6C 00408021 */  addu       $s0, $v0, $zero
/* 3B970 8003AD70 02002021 */  addu       $a0, $s0, $zero
/* 3B974 8003AD74 86650060 */  lh         $a1, 0x60($s3)
/* 3B978 8003AD78 0C02EF52 */  jal        func_800BBD48
/* 3B97C 8003AD7C 24060095 */   addiu     $a2, $zero, 0x95
/* 3B980 8003AD80 8E030078 */  lw         $v1, 0x78($s0)
/* 3B984 8003AD84 84640020 */  lh         $a0, 0x20($v1)
/* 3B988 8003AD88 8C620024 */  lw         $v0, 0x24($v1)
/* 3B98C 8003AD8C 0040F809 */  jalr       $v0
/* 3B990 8003AD90 02042021 */   addu      $a0, $s0, $a0
/* 3B994 8003AD94 9663007C */  lhu        $v1, 0x7c($s3)
/* 3B998 8003AD98 02202021 */  addu       $a0, $s1, $zero
/* 3B99C 8003AD9C 00621821 */  addu       $v1, $v1, $v0
/* 3B9A0 8003ADA0 0C0232F9 */  jal        free_romstring
/* 3B9A4 8003ADA4 A663007C */   sh        $v1, 0x7c($s3)
/* 3B9A8 8003ADA8 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 3B9AC 8003ADAC 8C441600 */  lw         $a0, 0x1600($v0)
/* 3B9B0 8003ADB0 0C02D0FD */  jal        font_func
/* 3B9B4 8003ADB4 8EC58D18 */   lw        $a1, -0x72e8($s6)
/* 3B9B8 8003ADB8 02601021 */  addu       $v0, $s3, $zero
/* 3B9BC 8003ADBC 8FBF006C */  lw         $ra, 0x6c($sp)
/* 3B9C0 8003ADC0 8FB60068 */  lw         $s6, 0x68($sp)
/* 3B9C4 8003ADC4 8FB50064 */  lw         $s5, 0x64($sp)
/* 3B9C8 8003ADC8 8FB40060 */  lw         $s4, 0x60($sp)
/* 3B9CC 8003ADCC 8FB3005C */  lw         $s3, 0x5c($sp)
/* 3B9D0 8003ADD0 8FB20058 */  lw         $s2, 0x58($sp)
/* 3B9D4 8003ADD4 8FB10054 */  lw         $s1, 0x54($sp)
/* 3B9D8 8003ADD8 8FB00050 */  lw         $s0, 0x50($sp)
/* 3B9DC 8003ADDC 03E00008 */  jr         $ra
/* 3B9E0 8003ADE0 27BD0070 */   addiu     $sp, $sp, 0x70

glabel widget_left_side_of_pause_menu
/* 3B9E4 8003ADE4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3B9E8 8003ADE8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3B9EC 8003ADEC 00808821 */  addu       $s1, $a0, $zero
/* 3B9F0 8003ADF0 2404007C */  addiu      $a0, $zero, 0x7c
/* 3B9F4 8003ADF4 24020017 */  addiu      $v0, $zero, 0x17
/* 3B9F8 8003ADF8 24030046 */  addiu      $v1, $zero, 0x46
/* 3B9FC 8003ADFC AFBF0020 */  sw         $ra, 0x20($sp)
/* 3BA00 8003AE00 AFB00018 */  sw         $s0, 0x18($sp)
/* 3BA04 8003AE04 A220005B */  sb         $zero, 0x5b($s1)
/* 3BA08 8003AE08 A6220060 */  sh         $v0, 0x60($s1)
/* 3BA0C 8003AE0C 0C026259 */  jal        passToMalloc
/* 3BA10 8003AE10 A6230062 */   sh        $v1, 0x62($s1)
/* 3BA14 8003AE14 240400E4 */  addiu      $a0, $zero, 0xe4
/* 3BA18 8003AE18 0C0290E2 */  jal        get_borg_8
/* 3BA1C 8003AE1C 00408021 */   addu      $s0, $v0, $zero
/* 3BA20 8003AE20 02002021 */  addu       $a0, $s0, $zero
/* 3BA24 8003AE24 0C02E518 */  jal        borg8_widget
/* 3BA28 8003AE28 00402821 */   addu      $a1, $v0, $zero
/* 3BA2C 8003AE2C 00408021 */  addu       $s0, $v0, $zero
/* 3BA30 8003AE30 02002021 */  addu       $a0, $s0, $zero
/* 3BA34 8003AE34 24050005 */  addiu      $a1, $zero, 5
/* 3BA38 8003AE38 0C02DD3F */  jal        set_widget_coords
/* 3BA3C 8003AE3C 2406003C */   addiu     $a2, $zero, 0x3c
/* 3BA40 8003AE40 8E230078 */  lw         $v1, 0x78($s1)
/* 3BA44 8003AE44 02002821 */  addu       $a1, $s0, $zero
/* 3BA48 8003AE48 84640030 */  lh         $a0, 0x30($v1)
/* 3BA4C 8003AE4C 8C620034 */  lw         $v0, 0x34($v1)
/* 3BA50 8003AE50 0040F809 */  jalr       $v0
/* 3BA54 8003AE54 02242021 */   addu      $a0, $s1, $a0
/* 3BA58 8003AE58 0C026259 */  jal        passToMalloc
/* 3BA5C 8003AE5C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3BA60 8003AE60 240400E2 */  addiu      $a0, $zero, 0xe2
/* 3BA64 8003AE64 0C0290E2 */  jal        get_borg_8
/* 3BA68 8003AE68 00408021 */   addu      $s0, $v0, $zero
/* 3BA6C 8003AE6C 02002021 */  addu       $a0, $s0, $zero
/* 3BA70 8003AE70 0C02E518 */  jal        borg8_widget
/* 3BA74 8003AE74 00402821 */   addu      $a1, $v0, $zero
/* 3BA78 8003AE78 00408021 */  addu       $s0, $v0, $zero
/* 3BA7C 8003AE7C 02002021 */  addu       $a0, $s0, $zero
/* 3BA80 8003AE80 00002821 */  addu       $a1, $zero, $zero
/* 3BA84 8003AE84 0C02DD3F */  jal        set_widget_coords
/* 3BA88 8003AE88 2406003A */   addiu     $a2, $zero, 0x3a
/* 3BA8C 8003AE8C 8E230078 */  lw         $v1, 0x78($s1)
/* 3BA90 8003AE90 02002821 */  addu       $a1, $s0, $zero
/* 3BA94 8003AE94 84640030 */  lh         $a0, 0x30($v1)
/* 3BA98 8003AE98 8C620034 */  lw         $v0, 0x34($v1)
/* 3BA9C 8003AE9C 0040F809 */  jalr       $v0
/* 3BAA0 8003AEA0 02242021 */   addu      $a0, $s1, $a0
/* 3BAA4 8003AEA4 02202021 */  addu       $a0, $s1, $zero
/* 3BAA8 8003AEA8 0C02DD42 */  jal        set_widgetHeight
/* 3BAAC 8003AEAC 2405008C */   addiu     $a1, $zero, 0x8c
/* 3BAB0 8003AEB0 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 3BAB4 8003AEB4 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 3BAB8 8003AEB8 2405074D */  addiu      $a1, $zero, 0x74d
/* 3BABC 8003AEBC 00003021 */  addu       $a2, $zero, $zero
/* 3BAC0 8003AEC0 3C028004 */  lui        $v0, %hi(widget_left_side_fade_in)
/* 3BAC4 8003AEC4 24429E80 */  addiu      $v0, $v0, %lo(widget_left_side_fade_in)
/* 3BAC8 8003AEC8 3C038004 */  lui        $v1, %hi(widget_left_side_fade_out)
/* 3BACC 8003AECC 3C073F80 */  lui        $a3, 0x3f80
/* 3BAD0 8003AED0 24639EEC */  addiu      $v1, $v1, %lo(widget_left_side_fade_out)
/* 3BAD4 8003AED4 AE220000 */  sw         $v0, ($s1)
/* 3BAD8 8003AED8 2402003C */  addiu      $v0, $zero, 0x3c
/* 3BADC 8003AEDC AE230004 */  sw         $v1, 4($s1)
/* 3BAE0 8003AEE0 AFA20010 */  sw         $v0, 0x10($sp)
/* 3BAE4 8003AEE4 0C0156F4 */  jal        play_SFX
/* 3BAE8 8003AEE8 AFA00014 */   sw        $zero, 0x14($sp)
/* 3BAEC 8003AEEC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3BAF0 8003AEF0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3BAF4 8003AEF4 8FB00018 */  lw         $s0, 0x18($sp)
/* 3BAF8 8003AEF8 03E00008 */  jr         $ra
/* 3BAFC 8003AEFC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel left_side_menu_info_widget
/* 3BB00 8003AF00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3BB04 8003AF04 AFB00010 */  sw         $s0, 0x10($sp)
/* 3BB08 8003AF08 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3BB0C 8003AF0C 0C00EB79 */  jal        widget_left_side_of_pause_menu
/* 3BB10 8003AF10 00808021 */   addu      $s0, $a0, $zero
/* 3BB14 8003AF14 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3BB18 8003AF18 24020046 */  addiu      $v0, $zero, 0x46
/* 3BB1C 8003AF1C A602007C */  sh         $v0, 0x7c($s0)
/* 3BB20 8003AF20 8FB00010 */  lw         $s0, 0x10($sp)
/* 3BB24 8003AF24 03E00008 */  jr         $ra
/* 3BB28 8003AF28 27BD0018 */   addiu     $sp, $sp, 0x18

glabel item_name_icon
/* 3BB2C 8003AF2C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 3BB30 8003AF30 AFB20028 */  sw         $s2, 0x28($sp)
/* 3BB34 8003AF34 00809021 */  addu       $s2, $a0, $zero
/* 3BB38 8003AF38 AFB3002C */  sw         $s3, 0x2c($sp)
/* 3BB3C 8003AF3C 00A09821 */  addu       $s3, $a1, $zero
/* 3BB40 8003AF40 AFBF0030 */  sw         $ra, 0x30($sp)
/* 3BB44 8003AF44 AFB10024 */  sw         $s1, 0x24($sp)
/* 3BB48 8003AF48 AFB00020 */  sw         $s0, 0x20($sp)
/* 3BB4C 8003AF4C 9644005E */  lhu        $a0, 0x5e($s2)
/* 3BB50 8003AF50 0C013218 */  jal        GetItemImage
/* 3BB54 8003AF54 27A50018 */   addiu     $a1, $sp, 0x18
/* 3BB58 8003AF58 0C026259 */  jal        passToMalloc
/* 3BB5C 8003AF5C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3BB60 8003AF60 8FA40018 */  lw         $a0, 0x18($sp)
/* 3BB64 8003AF64 0C0290E2 */  jal        get_borg_8
/* 3BB68 8003AF68 00408021 */   addu      $s0, $v0, $zero
/* 3BB6C 8003AF6C 02002021 */  addu       $a0, $s0, $zero
/* 3BB70 8003AF70 0C02E518 */  jal        borg8_widget
/* 3BB74 8003AF74 00402821 */   addu      $a1, $v0, $zero
/* 3BB78 8003AF78 00408821 */  addu       $s1, $v0, $zero
/* 3BB7C 8003AF7C 86450060 */  lh         $a1, 0x60($s2)
/* 3BB80 8003AF80 9646007C */  lhu        $a2, 0x7c($s2)
/* 3BB84 8003AF84 0C02DD3F */  jal        set_widget_coords
/* 3BB88 8003AF88 02202021 */   addu      $a0, $s1, $zero
/* 3BB8C 8003AF8C 8E430078 */  lw         $v1, 0x78($s2)
/* 3BB90 8003AF90 02202821 */  addu       $a1, $s1, $zero
/* 3BB94 8003AF94 84640030 */  lh         $a0, 0x30($v1)
/* 3BB98 8003AF98 8C620034 */  lw         $v0, 0x34($v1)
/* 3BB9C 8003AF9C 0040F809 */  jalr       $v0
/* 3BBA0 8003AFA0 02442021 */   addu      $a0, $s2, $a0
/* 3BBA4 8003AFA4 8E230078 */  lw         $v1, 0x78($s1)
/* 3BBA8 8003AFA8 84640020 */  lh         $a0, 0x20($v1)
/* 3BBAC 8003AFAC 8C620024 */  lw         $v0, 0x24($v1)
/* 3BBB0 8003AFB0 0040F809 */  jalr       $v0
/* 3BBB4 8003AFB4 02242021 */   addu      $a0, $s1, $a0
/* 3BBB8 8003AFB8 9643007C */  lhu        $v1, 0x7c($s2)
/* 3BBBC 8003AFBC 2404007C */  addiu      $a0, $zero, 0x7c
/* 3BBC0 8003AFC0 24630002 */  addiu      $v1, $v1, 2
/* 3BBC4 8003AFC4 00431021 */  addu       $v0, $v0, $v1
/* 3BBC8 8003AFC8 0C026259 */  jal        passToMalloc
/* 3BBCC 8003AFCC A642007C */   sh        $v0, 0x7c($s2)
/* 3BBD0 8003AFD0 02602021 */  addu       $a0, $s3, $zero
/* 3BBD4 8003AFD4 0C03353E */  jal        strlen
/* 3BBD8 8003AFD8 00408021 */   addu      $s0, $v0, $zero
/* 3BBDC 8003AFDC 02002021 */  addu       $a0, $s0, $zero
/* 3BBE0 8003AFE0 02602821 */  addu       $a1, $s3, $zero
/* 3BBE4 8003AFE4 24420001 */  addiu      $v0, $v0, 1
/* 3BBE8 8003AFE8 0C02DFC8 */  jal        widgetcliptext_init
/* 3BBEC 8003AFEC 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3BBF0 8003AFF0 8E230078 */  lw         $v1, 0x78($s1)
/* 3BBF4 8003AFF4 84640018 */  lh         $a0, 0x18($v1)
/* 3BBF8 8003AFF8 8C65001C */  lw         $a1, 0x1c($v1)
/* 3BBFC 8003AFFC 02242021 */  addu       $a0, $s1, $a0
/* 3BC00 8003B000 00A0F809 */  jalr       $a1
/* 3BC04 8003B004 00408821 */   addu      $s1, $v0, $zero
/* 3BC08 8003B008 86500060 */  lh         $s0, 0x60($s2)
/* 3BC0C 8003B00C 8E230078 */  lw         $v1, 0x78($s1)
/* 3BC10 8003B010 02028021 */  addu       $s0, $s0, $v0
/* 3BC14 8003B014 26100002 */  addiu      $s0, $s0, 2
/* 3BC18 8003B018 84640020 */  lh         $a0, 0x20($v1)
/* 3BC1C 8003B01C 8C620024 */  lw         $v0, 0x24($v1)
/* 3BC20 8003B020 0040F809 */  jalr       $v0
/* 3BC24 8003B024 02242021 */   addu      $a0, $s1, $a0
/* 3BC28 8003B028 02202021 */  addu       $a0, $s1, $zero
/* 3BC2C 8003B02C 9646007C */  lhu        $a2, 0x7c($s2)
/* 3BC30 8003B030 02002821 */  addu       $a1, $s0, $zero
/* 3BC34 8003B034 0C02DD3F */  jal        set_widget_coords
/* 3BC38 8003B038 00C23023 */   subu      $a2, $a2, $v0
/* 3BC3C 8003B03C 24050082 */  addiu      $a1, $zero, 0x82
/* 3BC40 8003B040 24060050 */  addiu      $a2, $zero, 0x50
/* 3BC44 8003B044 8E230078 */  lw         $v1, 0x78($s1)
/* 3BC48 8003B048 240200FF */  addiu      $v0, $zero, 0xff
/* 3BC4C 8003B04C 84640048 */  lh         $a0, 0x48($v1)
/* 3BC50 8003B050 24070050 */  addiu      $a3, $zero, 0x50
/* 3BC54 8003B054 AFA20010 */  sw         $v0, 0x10($sp)
/* 3BC58 8003B058 8C62004C */  lw         $v0, 0x4c($v1)
/* 3BC5C 8003B05C 0040F809 */  jalr       $v0
/* 3BC60 8003B060 02242021 */   addu      $a0, $s1, $a0
/* 3BC64 8003B064 8E430078 */  lw         $v1, 0x78($s2)
/* 3BC68 8003B068 02202821 */  addu       $a1, $s1, $zero
/* 3BC6C 8003B06C 84640030 */  lh         $a0, 0x30($v1)
/* 3BC70 8003B070 8C620034 */  lw         $v0, 0x34($v1)
/* 3BC74 8003B074 0040F809 */  jalr       $v0
/* 3BC78 8003B078 02442021 */   addu      $a0, $s2, $a0
/* 3BC7C 8003B07C 9643007C */  lhu        $v1, 0x7c($s2)
/* 3BC80 8003B080 8FBF0030 */  lw         $ra, 0x30($sp)
/* 3BC84 8003B084 8FB3002C */  lw         $s3, 0x2c($sp)
/* 3BC88 8003B088 8FB10024 */  lw         $s1, 0x24($sp)
/* 3BC8C 8003B08C 8FB00020 */  lw         $s0, 0x20($sp)
/* 3BC90 8003B090 24630004 */  addiu      $v1, $v1, 4
/* 3BC94 8003B094 A643007C */  sh         $v1, 0x7c($s2)
/* 3BC98 8003B098 8FB20028 */  lw         $s2, 0x28($sp)
/* 3BC9C 8003B09C 03E00008 */  jr         $ra
/* 3BCA0 8003B0A0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel print_weapon_type
/* 3BCA4 8003B0A4 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BCA8 8003B0A8 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BCAC 8003B0AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3BCB0 8003B0B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 3BCB4 8003B0B4 00A08821 */  addu       $s1, $a1, $zero
/* 3BCB8 8003B0B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 3BCBC 8003B0BC 00808021 */  addu       $s0, $a0, $zero
/* 3BCC0 8003B0C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3BCC4 8003B0C4 0C00E7D5 */  jal        get_item_info_text
/* 3BCC8 8003B0C8 8C65085C */   lw        $a1, 0x85c($v1)
/* 3BCCC 8003B0CC 02002021 */  addu       $a0, $s0, $zero
/* 3BCD0 8003B0D0 0C00E7FC */  jal        add_widgetcliptext
/* 3BCD4 8003B0D4 02202821 */   addu      $a1, $s1, $zero
/* 3BCD8 8003B0D8 8C430078 */  lw         $v1, 0x78($v0)
/* 3BCDC 8003B0DC 84640020 */  lh         $a0, 0x20($v1)
/* 3BCE0 8003B0E0 8C650024 */  lw         $a1, 0x24($v1)
/* 3BCE4 8003B0E4 00A0F809 */  jalr       $a1
/* 3BCE8 8003B0E8 00442021 */   addu      $a0, $v0, $a0
/* 3BCEC 8003B0EC 9603007C */  lhu        $v1, 0x7c($s0)
/* 3BCF0 8003B0F0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3BCF4 8003B0F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 3BCF8 8003B0F8 00621821 */  addu       $v1, $v1, $v0
/* 3BCFC 8003B0FC A603007C */  sh         $v1, 0x7c($s0)
/* 3BD00 8003B100 8FB00010 */  lw         $s0, 0x10($sp)
/* 3BD04 8003B104 03E00008 */  jr         $ra
/* 3BD08 8003B108 27BD0020 */   addiu     $sp, $sp, 0x20

glabel item_aspect_info
/* 3BD0C 8003B10C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3BD10 8003B110 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3BD14 8003B114 00808821 */  addu       $s1, $a0, $zero
/* 3BD18 8003B118 AFB00018 */  sw         $s0, 0x18($sp)
/* 3BD1C 8003B11C 30B000FF */  andi       $s0, $a1, 0xff
/* 3BD20 8003B120 1200002B */  beqz       $s0, .L8003B1D0
/* 3BD24 8003B124 AFBF0020 */   sw        $ra, 0x20($sp)
/* 3BD28 8003B128 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BD2C 8003B12C 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BD30 8003B130 0C00E7D5 */  jal        get_item_info_text
/* 3BD34 8003B134 8C650860 */   lw        $a1, 0x860($v1)
/* 3BD38 8003B138 02002021 */  addu       $a0, $s0, $zero
/* 3BD3C 8003B13C 0C01325C */  jal        getAspectIcon
/* 3BD40 8003B140 27A50010 */   addiu     $a1, $sp, 0x10
/* 3BD44 8003B144 0C026259 */  jal        passToMalloc
/* 3BD48 8003B148 2404007C */   addiu     $a0, $zero, 0x7c
/* 3BD4C 8003B14C 8FA40010 */  lw         $a0, 0x10($sp)
/* 3BD50 8003B150 0C0290E2 */  jal        get_borg_8
/* 3BD54 8003B154 00408021 */   addu      $s0, $v0, $zero
/* 3BD58 8003B158 02002021 */  addu       $a0, $s0, $zero
/* 3BD5C 8003B15C 0C02E518 */  jal        borg8_widget
/* 3BD60 8003B160 00402821 */   addu      $a1, $v0, $zero
/* 3BD64 8003B164 00408021 */  addu       $s0, $v0, $zero
/* 3BD68 8003B168 8E030078 */  lw         $v1, 0x78($s0)
/* 3BD6C 8003B16C 84640018 */  lh         $a0, 0x18($v1)
/* 3BD70 8003B170 8C62001C */  lw         $v0, 0x1c($v1)
/* 3BD74 8003B174 0040F809 */  jalr       $v0
/* 3BD78 8003B178 02042021 */   addu      $a0, $s0, $a0
/* 3BD7C 8003B17C 02002021 */  addu       $a0, $s0, $zero
/* 3BD80 8003B180 24050095 */  addiu      $a1, $zero, 0x95
/* 3BD84 8003B184 9626007C */  lhu        $a2, 0x7c($s1)
/* 3BD88 8003B188 00A22823 */  subu       $a1, $a1, $v0
/* 3BD8C 8003B18C 0C02DD3F */  jal        set_widget_coords
/* 3BD90 8003B190 24C6FFFE */   addiu     $a2, $a2, -2
/* 3BD94 8003B194 8E230078 */  lw         $v1, 0x78($s1)
/* 3BD98 8003B198 02002821 */  addu       $a1, $s0, $zero
/* 3BD9C 8003B19C 84640030 */  lh         $a0, 0x30($v1)
/* 3BDA0 8003B1A0 8C620034 */  lw         $v0, 0x34($v1)
/* 3BDA4 8003B1A4 0040F809 */  jalr       $v0
/* 3BDA8 8003B1A8 02242021 */   addu      $a0, $s1, $a0
/* 3BDAC 8003B1AC 8E030078 */  lw         $v1, 0x78($s0)
/* 3BDB0 8003B1B0 84640020 */  lh         $a0, 0x20($v1)
/* 3BDB4 8003B1B4 8C620024 */  lw         $v0, 0x24($v1)
/* 3BDB8 8003B1B8 0040F809 */  jalr       $v0
/* 3BDBC 8003B1BC 02042021 */   addu      $a0, $s0, $a0
/* 3BDC0 8003B1C0 9623007C */  lhu        $v1, 0x7c($s1)
/* 3BDC4 8003B1C4 24630001 */  addiu      $v1, $v1, 1
/* 3BDC8 8003B1C8 00431021 */  addu       $v0, $v0, $v1
/* 3BDCC 8003B1CC A622007C */  sh         $v0, 0x7c($s1)
.L8003B1D0:
/* 3BDD0 8003B1D0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3BDD4 8003B1D4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3BDD8 8003B1D8 8FB00018 */  lw         $s0, 0x18($sp)
/* 3BDDC 8003B1DC 03E00008 */  jr         $ra
/* 3BDE0 8003B1E0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel print_min_str_requirement
/* 3BDE4 8003B1E4 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3BDE8 8003B1E8 AFB10114 */  sw         $s1, 0x114($sp)
/* 3BDEC 8003B1EC 00808821 */  addu       $s1, $a0, $zero
/* 3BDF0 8003B1F0 AFB00110 */  sw         $s0, 0x110($sp)
/* 3BDF4 8003B1F4 30B000FF */  andi       $s0, $a1, 0xff
/* 3BDF8 8003B1F8 12000015 */  beqz       $s0, .L8003B250
/* 3BDFC 8003B1FC AFBF0118 */   sw        $ra, 0x118($sp)
/* 3BE00 8003B200 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BE04 8003B204 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BE08 8003B208 0C00E7D5 */  jal        get_item_info_text
/* 3BE0C 8003B20C 8C650864 */   lw        $a1, 0x864($v1)
/* 3BE10 8003B210 27A40010 */  addiu      $a0, $sp, 0x10
/* 3BE14 8003B214 3C05800E */  lui        $a1, %hi(D_800DBFF0)
/* 3BE18 8003B218 24A5BFF0 */  addiu      $a1, $a1, %lo(D_800DBFF0)
/* 3BE1C 8003B21C 0C0333AC */  jal        sprintf
/* 3BE20 8003B220 02003021 */   addu      $a2, $s0, $zero
/* 3BE24 8003B224 02202021 */  addu       $a0, $s1, $zero
/* 3BE28 8003B228 0C00E7FC */  jal        add_widgetcliptext
/* 3BE2C 8003B22C 27A50010 */   addiu     $a1, $sp, 0x10
/* 3BE30 8003B230 8C430078 */  lw         $v1, 0x78($v0)
/* 3BE34 8003B234 84640020 */  lh         $a0, 0x20($v1)
/* 3BE38 8003B238 8C650024 */  lw         $a1, 0x24($v1)
/* 3BE3C 8003B23C 00A0F809 */  jalr       $a1
/* 3BE40 8003B240 00442021 */   addu      $a0, $v0, $a0
/* 3BE44 8003B244 9623007C */  lhu        $v1, 0x7c($s1)
/* 3BE48 8003B248 00621821 */  addu       $v1, $v1, $v0
/* 3BE4C 8003B24C A623007C */  sh         $v1, 0x7c($s1)
.L8003B250:
/* 3BE50 8003B250 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3BE54 8003B254 8FB10114 */  lw         $s1, 0x114($sp)
/* 3BE58 8003B258 8FB00110 */  lw         $s0, 0x110($sp)
/* 3BE5C 8003B25C 03E00008 */  jr         $ra
/* 3BE60 8003B260 27BD0120 */   addiu     $sp, $sp, 0x120

glabel print_base_hit
/* 3BE64 8003B264 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BE68 8003B268 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BE6C 8003B26C 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3BE70 8003B270 AFB10114 */  sw         $s1, 0x114($sp)
/* 3BE74 8003B274 30B100FF */  andi       $s1, $a1, 0xff
/* 3BE78 8003B278 AFB00110 */  sw         $s0, 0x110($sp)
/* 3BE7C 8003B27C 00808021 */  addu       $s0, $a0, $zero
/* 3BE80 8003B280 AFBF0118 */  sw         $ra, 0x118($sp)
/* 3BE84 8003B284 0C00E7D5 */  jal        get_item_info_text
/* 3BE88 8003B288 8C650868 */   lw        $a1, 0x868($v1)
/* 3BE8C 8003B28C 27A40010 */  addiu      $a0, $sp, 0x10
/* 3BE90 8003B290 3C05800E */  lui        $a1, %hi(D_800DBFF0)
/* 3BE94 8003B294 24A5BFF0 */  addiu      $a1, $a1, %lo(D_800DBFF0)
/* 3BE98 8003B298 0C0333AC */  jal        sprintf
/* 3BE9C 8003B29C 02203021 */   addu      $a2, $s1, $zero
/* 3BEA0 8003B2A0 02002021 */  addu       $a0, $s0, $zero
/* 3BEA4 8003B2A4 0C00E7FC */  jal        add_widgetcliptext
/* 3BEA8 8003B2A8 27A50010 */   addiu     $a1, $sp, 0x10
/* 3BEAC 8003B2AC 8C430078 */  lw         $v1, 0x78($v0)
/* 3BEB0 8003B2B0 84640020 */  lh         $a0, 0x20($v1)
/* 3BEB4 8003B2B4 8C650024 */  lw         $a1, 0x24($v1)
/* 3BEB8 8003B2B8 00A0F809 */  jalr       $a1
/* 3BEBC 8003B2BC 00442021 */   addu      $a0, $v0, $a0
/* 3BEC0 8003B2C0 9603007C */  lhu        $v1, 0x7c($s0)
/* 3BEC4 8003B2C4 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3BEC8 8003B2C8 8FB10114 */  lw         $s1, 0x114($sp)
/* 3BECC 8003B2CC 00621821 */  addu       $v1, $v1, $v0
/* 3BED0 8003B2D0 A603007C */  sh         $v1, 0x7c($s0)
/* 3BED4 8003B2D4 8FB00110 */  lw         $s0, 0x110($sp)
/* 3BED8 8003B2D8 03E00008 */  jr         $ra
/* 3BEDC 8003B2DC 27BD0120 */   addiu     $sp, $sp, 0x120

glabel print_weapon_damage
/* 3BEE0 8003B2E0 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BEE4 8003B2E4 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BEE8 8003B2E8 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3BEEC 8003B2EC AFB10114 */  sw         $s1, 0x114($sp)
/* 3BEF0 8003B2F0 30B100FF */  andi       $s1, $a1, 0xff
/* 3BEF4 8003B2F4 AFB00110 */  sw         $s0, 0x110($sp)
/* 3BEF8 8003B2F8 00808021 */  addu       $s0, $a0, $zero
/* 3BEFC 8003B2FC AFBF0118 */  sw         $ra, 0x118($sp)
/* 3BF00 8003B300 0C00E7D5 */  jal        get_item_info_text
/* 3BF04 8003B304 8C65086C */   lw        $a1, 0x86c($v1)
/* 3BF08 8003B308 27A40010 */  addiu      $a0, $sp, 0x10
/* 3BF0C 8003B30C 3C05800E */  lui        $a1, %hi(D_800DBFF0)
/* 3BF10 8003B310 24A5BFF0 */  addiu      $a1, $a1, %lo(D_800DBFF0)
/* 3BF14 8003B314 0C0333AC */  jal        sprintf
/* 3BF18 8003B318 02203021 */   addu      $a2, $s1, $zero
/* 3BF1C 8003B31C 02002021 */  addu       $a0, $s0, $zero
/* 3BF20 8003B320 0C00E7FC */  jal        add_widgetcliptext
/* 3BF24 8003B324 27A50010 */   addiu     $a1, $sp, 0x10
/* 3BF28 8003B328 8C430078 */  lw         $v1, 0x78($v0)
/* 3BF2C 8003B32C 84640020 */  lh         $a0, 0x20($v1)
/* 3BF30 8003B330 8C650024 */  lw         $a1, 0x24($v1)
/* 3BF34 8003B334 00A0F809 */  jalr       $a1
/* 3BF38 8003B338 00442021 */   addu      $a0, $v0, $a0
/* 3BF3C 8003B33C 9603007C */  lhu        $v1, 0x7c($s0)
/* 3BF40 8003B340 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3BF44 8003B344 8FB10114 */  lw         $s1, 0x114($sp)
/* 3BF48 8003B348 00621821 */  addu       $v1, $v1, $v0
/* 3BF4C 8003B34C A603007C */  sh         $v1, 0x7c($s0)
/* 3BF50 8003B350 8FB00110 */  lw         $s0, 0x110($sp)
/* 3BF54 8003B354 03E00008 */  jr         $ra
/* 3BF58 8003B358 27BD0120 */   addiu     $sp, $sp, 0x120

glabel item_stat_info
/* 3BF5C 8003B35C 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3BF60 8003B360 AFB10114 */  sw         $s1, 0x114($sp)
/* 3BF64 8003B364 00808821 */  addu       $s1, $a0, $zero
/* 3BF68 8003B368 AFB00110 */  sw         $s0, 0x110($sp)
/* 3BF6C 8003B36C 00A08021 */  addu       $s0, $a1, $zero
/* 3BF70 8003B370 1200002B */  beqz       $s0, .L8003B420
/* 3BF74 8003B374 AFBF0118 */   sw        $ra, 0x118($sp)
/* 3BF78 8003B378 92030000 */  lbu        $v1, ($s0)
/* 3BF7C 8003B37C 24020005 */  addiu      $v0, $zero, 5
/* 3BF80 8003B380 14620008 */  bne        $v1, $v0, .L8003B3A4
/* 3BF84 8003B384 3C02800F */   lui       $v0, 0x800f
/* 3BF88 8003B388 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3BF8C 8003B38C 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3BF90 8003B390 8C650870 */  lw         $a1, 0x870($v1)
/* 3BF94 8003B394 0C02626C */  jal        copy_string
/* 3BF98 8003B398 27A40010 */   addiu     $a0, $sp, 0x10
/* 3BF9C 8003B39C 0800ECF0 */  j          .L8003B3C0
/* 3BFA0 8003B3A0 02202021 */   addu      $a0, $s1, $zero
.L8003B3A4:
/* 3BFA4 8003B3A4 8C441B60 */  lw         $a0, 0x1b60($v0)
/* 3BFA8 8003B3A8 00031880 */  sll        $v1, $v1, 2
/* 3BFAC 8003B3AC 00641821 */  addu       $v1, $v1, $a0
/* 3BFB0 8003B3B0 8C650000 */  lw         $a1, ($v1)
/* 3BFB4 8003B3B4 0C02626C */  jal        copy_string
/* 3BFB8 8003B3B8 27A40010 */   addiu     $a0, $sp, 0x10
/* 3BFBC 8003B3BC 02202021 */  addu       $a0, $s1, $zero
.L8003B3C0:
/* 3BFC0 8003B3C0 0C00E7D5 */  jal        get_item_info_text
/* 3BFC4 8003B3C4 27A50010 */   addiu     $a1, $sp, 0x10
/* 3BFC8 8003B3C8 82060001 */  lb         $a2, 1($s0)
/* 3BFCC 8003B3CC 18C00006 */  blez       $a2, .L8003B3E8
/* 3BFD0 8003B3D0 27A40010 */   addiu     $a0, $sp, 0x10
/* 3BFD4 8003B3D4 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3BFD8 8003B3D8 0C0333AC */  jal        sprintf
/* 3BFDC 8003B3DC 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3BFE0 8003B3E0 0800ECFE */  j          .L8003B3F8
/* 3BFE4 8003B3E4 02202021 */   addu      $a0, $s1, $zero
.L8003B3E8:
/* 3BFE8 8003B3E8 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3BFEC 8003B3EC 0C0333AC */  jal        sprintf
/* 3BFF0 8003B3F0 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3BFF4 8003B3F4 02202021 */  addu       $a0, $s1, $zero
.L8003B3F8:
/* 3BFF8 8003B3F8 0C00E7FC */  jal        add_widgetcliptext
/* 3BFFC 8003B3FC 27A50010 */   addiu     $a1, $sp, 0x10
/* 3C000 8003B400 8C430078 */  lw         $v1, 0x78($v0)
/* 3C004 8003B404 84640020 */  lh         $a0, 0x20($v1)
/* 3C008 8003B408 8C650024 */  lw         $a1, 0x24($v1)
/* 3C00C 8003B40C 00A0F809 */  jalr       $a1
/* 3C010 8003B410 00442021 */   addu      $a0, $v0, $a0
/* 3C014 8003B414 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C018 8003B418 00621821 */  addu       $v1, $v1, $v0
/* 3C01C 8003B41C A623007C */  sh         $v1, 0x7c($s1)
.L8003B420:
/* 3C020 8003B420 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3C024 8003B424 8FB10114 */  lw         $s1, 0x114($sp)
/* 3C028 8003B428 8FB00110 */  lw         $s0, 0x110($sp)
/* 3C02C 8003B42C 03E00008 */  jr         $ra
/* 3C030 8003B430 27BD0120 */   addiu     $sp, $sp, 0x120

glabel item_skill_info
/* 3C034 8003B434 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3C038 8003B438 AFB10114 */  sw         $s1, 0x114($sp)
/* 3C03C 8003B43C 00808821 */  addu       $s1, $a0, $zero
/* 3C040 8003B440 AFB00110 */  sw         $s0, 0x110($sp)
/* 3C044 8003B444 00A08021 */  addu       $s0, $a1, $zero
/* 3C048 8003B448 1200001F */  beqz       $s0, .L8003B4C8
/* 3C04C 8003B44C AFBF0118 */   sw        $ra, 0x118($sp)
/* 3C050 8003B450 3C02800F */  lui        $v0, %hi(skill_strings)
/* 3C054 8003B454 92030000 */  lbu        $v1, ($s0)
/* 3C058 8003B458 8C441B40 */  lw         $a0, %lo(skill_strings)($v0)
/* 3C05C 8003B45C 00031880 */  sll        $v1, $v1, 2
/* 3C060 8003B460 00641821 */  addu       $v1, $v1, $a0
/* 3C064 8003B464 8C650000 */  lw         $a1, ($v1)
/* 3C068 8003B468 0C00E7D5 */  jal        get_item_info_text
/* 3C06C 8003B46C 02202021 */   addu      $a0, $s1, $zero
/* 3C070 8003B470 82060001 */  lb         $a2, 1($s0)
/* 3C074 8003B474 18C00006 */  blez       $a2, .L8003B490
/* 3C078 8003B478 27A40010 */   addiu     $a0, $sp, 0x10
/* 3C07C 8003B47C 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3C080 8003B480 0C0333AC */  jal        sprintf
/* 3C084 8003B484 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3C088 8003B488 0800ED28 */  j          .L8003B4A0
/* 3C08C 8003B48C 02202021 */   addu      $a0, $s1, $zero
.L8003B490:
/* 3C090 8003B490 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3C094 8003B494 0C0333AC */  jal        sprintf
/* 3C098 8003B498 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3C09C 8003B49C 02202021 */  addu       $a0, $s1, $zero
.L8003B4A0:
/* 3C0A0 8003B4A0 0C00E7FC */  jal        add_widgetcliptext
/* 3C0A4 8003B4A4 27A50010 */   addiu     $a1, $sp, 0x10
/* 3C0A8 8003B4A8 8C430078 */  lw         $v1, 0x78($v0)
/* 3C0AC 8003B4AC 84640020 */  lh         $a0, 0x20($v1)
/* 3C0B0 8003B4B0 8C650024 */  lw         $a1, 0x24($v1)
/* 3C0B4 8003B4B4 00A0F809 */  jalr       $a1
/* 3C0B8 8003B4B8 00442021 */   addu      $a0, $v0, $a0
/* 3C0BC 8003B4BC 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C0C0 8003B4C0 00621821 */  addu       $v1, $v1, $v0
/* 3C0C4 8003B4C4 A623007C */  sh         $v1, 0x7c($s1)
.L8003B4C8:
/* 3C0C8 8003B4C8 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3C0CC 8003B4CC 8FB10114 */  lw         $s1, 0x114($sp)
/* 3C0D0 8003B4D0 8FB00110 */  lw         $s0, 0x110($sp)
/* 3C0D4 8003B4D4 03E00008 */  jr         $ra
/* 3C0D8 8003B4D8 27BD0120 */   addiu     $sp, $sp, 0x120

glabel magic_info
/* 3C0DC 8003B4DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3C0E0 8003B4E0 AFB10014 */  sw         $s1, 0x14($sp)
/* 3C0E4 8003B4E4 00808821 */  addu       $s1, $a0, $zero
/* 3C0E8 8003B4E8 AFB20018 */  sw         $s2, 0x18($sp)
/* 3C0EC 8003B4EC 00A09021 */  addu       $s2, $a1, $zero
/* 3C0F0 8003B4F0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3C0F4 8003B4F4 12400029 */  beqz       $s2, .L8003B59C
/* 3C0F8 8003B4F8 AFB00010 */   sw        $s0, 0x10($sp)
/* 3C0FC 8003B4FC 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3C100 8003B500 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3C104 8003B504 0C00E7D5 */  jal        get_item_info_text
/* 3C108 8003B508 8C650874 */   lw        $a1, 0x874($v1)
/* 3C10C 8003B50C 00408021 */  addu       $s0, $v0, $zero
/* 3C110 8003B510 8E030078 */  lw         $v1, 0x78($s0)
/* 3C114 8003B514 84640020 */  lh         $a0, 0x20($v1)
/* 3C118 8003B518 8C620024 */  lw         $v0, 0x24($v1)
/* 3C11C 8003B51C 0040F809 */  jalr       $v0
/* 3C120 8003B520 02042021 */   addu      $a0, $s0, $a0
/* 3C124 8003B524 02202021 */  addu       $a0, $s1, $zero
/* 3C128 8003B528 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C12C 8003B52C 3C06800F */  lui        $a2, %hi(spell_pointer)
/* 3C130 8003B530 00621821 */  addu       $v1, $v1, $v0
/* 3C134 8003B534 A623007C */  sh         $v1, 0x7c($s1)
/* 3C138 8003B538 92450000 */  lbu        $a1, ($s2)
/* 3C13C 8003B53C 8CC316A0 */  lw         $v1, %lo(spell_pointer)($a2)
/* 3C140 8003B540 00051080 */  sll        $v0, $a1, 2
/* 3C144 8003B544 00451021 */  addu       $v0, $v0, $a1
/* 3C148 8003B548 00021080 */  sll        $v0, $v0, 2
/* 3C14C 8003B54C 00451023 */  subu       $v0, $v0, $a1
/* 3C150 8003B550 8C650010 */  lw         $a1, 0x10($v1)
/* 3C154 8003B554 00021040 */  sll        $v0, $v0, 1
/* 3C158 8003B558 00A22821 */  addu       $a1, $a1, $v0
/* 3C15C 8003B55C 0C00E7D5 */  jal        get_item_info_text
/* 3C160 8003B560 24A50002 */   addiu     $a1, $a1, 2
/* 3C164 8003B564 00408021 */  addu       $s0, $v0, $zero
/* 3C168 8003B568 02002021 */  addu       $a0, $s0, $zero
/* 3C16C 8003B56C 86250060 */  lh         $a1, 0x60($s1)
/* 3C170 8003B570 9626007C */  lhu        $a2, 0x7c($s1)
/* 3C174 8003B574 0C02DD3F */  jal        set_widget_coords
/* 3C178 8003B578 24A50010 */   addiu     $a1, $a1, 0x10
/* 3C17C 8003B57C 8E030078 */  lw         $v1, 0x78($s0)
/* 3C180 8003B580 84640020 */  lh         $a0, 0x20($v1)
/* 3C184 8003B584 8C620024 */  lw         $v0, 0x24($v1)
/* 3C188 8003B588 0040F809 */  jalr       $v0
/* 3C18C 8003B58C 02042021 */   addu      $a0, $s0, $a0
/* 3C190 8003B590 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C194 8003B594 00621821 */  addu       $v1, $v1, $v0
/* 3C198 8003B598 A623007C */  sh         $v1, 0x7c($s1)
.L8003B59C:
/* 3C19C 8003B59C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3C1A0 8003B5A0 8FB20018 */  lw         $s2, 0x18($sp)
/* 3C1A4 8003B5A4 8FB10014 */  lw         $s1, 0x14($sp)
/* 3C1A8 8003B5A8 8FB00010 */  lw         $s0, 0x10($sp)
/* 3C1AC 8003B5AC 03E00008 */  jr         $ra
/* 3C1B0 8003B5B0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel print_item_spell
/* 3C1B4 8003B5B4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3C1B8 8003B5B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 3C1BC 8003B5BC 00808821 */  addu       $s1, $a0, $zero
/* 3C1C0 8003B5C0 AFB20018 */  sw         $s2, 0x18($sp)
/* 3C1C4 8003B5C4 00A09021 */  addu       $s2, $a1, $zero
/* 3C1C8 8003B5C8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3C1CC 8003B5CC 12400020 */  beqz       $s2, .L8003B650
/* 3C1D0 8003B5D0 AFB00010 */   sw        $s0, 0x10($sp)
/* 3C1D4 8003B5D4 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 3C1D8 8003B5D8 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3C1DC 8003B5DC 0C00E7D5 */  jal        get_item_info_text
/* 3C1E0 8003B5E0 8C650878 */   lw        $a1, 0x878($v1)
/* 3C1E4 8003B5E4 00408021 */  addu       $s0, $v0, $zero
/* 3C1E8 8003B5E8 8E030078 */  lw         $v1, 0x78($s0)
/* 3C1EC 8003B5EC 84640020 */  lh         $a0, 0x20($v1)
/* 3C1F0 8003B5F0 8C620024 */  lw         $v0, 0x24($v1)
/* 3C1F4 8003B5F4 0040F809 */  jalr       $v0
/* 3C1F8 8003B5F8 02042021 */   addu      $a0, $s0, $a0
/* 3C1FC 8003B5FC 02202021 */  addu       $a0, $s1, $zero
/* 3C200 8003B600 8E460000 */  lw         $a2, ($s2)
/* 3C204 8003B604 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C208 8003B608 8CC50004 */  lw         $a1, 4($a2)
/* 3C20C 8003B60C 00621821 */  addu       $v1, $v1, $v0
/* 3C210 8003B610 0C00E7D5 */  jal        get_item_info_text
/* 3C214 8003B614 A623007C */   sh        $v1, 0x7c($s1)
/* 3C218 8003B618 00408021 */  addu       $s0, $v0, $zero
/* 3C21C 8003B61C 02002021 */  addu       $a0, $s0, $zero
/* 3C220 8003B620 86250060 */  lh         $a1, 0x60($s1)
/* 3C224 8003B624 9626007C */  lhu        $a2, 0x7c($s1)
/* 3C228 8003B628 0C02DD3F */  jal        set_widget_coords
/* 3C22C 8003B62C 24A50010 */   addiu     $a1, $a1, 0x10
/* 3C230 8003B630 8E030078 */  lw         $v1, 0x78($s0)
/* 3C234 8003B634 84640020 */  lh         $a0, 0x20($v1)
/* 3C238 8003B638 8C620024 */  lw         $v0, 0x24($v1)
/* 3C23C 8003B63C 0040F809 */  jalr       $v0
/* 3C240 8003B640 02042021 */   addu      $a0, $s0, $a0
/* 3C244 8003B644 9623007C */  lhu        $v1, 0x7c($s1)
/* 3C248 8003B648 00621821 */  addu       $v1, $v1, $v0
/* 3C24C 8003B64C A623007C */  sh         $v1, 0x7c($s1)
.L8003B650:
/* 3C250 8003B650 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3C254 8003B654 8FB20018 */  lw         $s2, 0x18($sp)
/* 3C258 8003B658 8FB10014 */  lw         $s1, 0x14($sp)
/* 3C25C 8003B65C 8FB00010 */  lw         $s0, 0x10($sp)
/* 3C260 8003B660 03E00008 */  jr         $ra
/* 3C264 8003B664 27BD0020 */   addiu     $sp, $sp, 0x20

glabel print_item_resist
/* 3C268 8003B668 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 3C26C 8003B66C AFB00110 */  sw         $s0, 0x110($sp)
/* 3C270 8003B670 00808021 */  addu       $s0, $a0, $zero
/* 3C274 8003B674 AFB10114 */  sw         $s1, 0x114($sp)
/* 3C278 8003B678 00A08821 */  addu       $s1, $a1, $zero
/* 3C27C 8003B67C 12200037 */  beqz       $s1, .L8003B75C
/* 3C280 8003B680 AFBF0118 */   sw        $ra, 0x118($sp)
/* 3C284 8003B684 92220000 */  lbu        $v0, ($s1)
/* 3C288 8003B688 10400034 */  beqz       $v0, .L8003B75C
/* 3C28C 8003B68C 3C02800F */   lui       $v0, %hi(commonstringsmirror)
/* 3C290 8003B690 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 3C294 8003B694 0C00E7D5 */  jal        get_item_info_text
/* 3C298 8003B698 8C65087C */   lw        $a1, 0x87c($v1)
/* 3C29C 8003B69C 00402821 */  addu       $a1, $v0, $zero
/* 3C2A0 8003B6A0 8CA30078 */  lw         $v1, 0x78($a1)
/* 3C2A4 8003B6A4 84640020 */  lh         $a0, 0x20($v1)
/* 3C2A8 8003B6A8 8C620024 */  lw         $v0, 0x24($v1)
/* 3C2AC 8003B6AC 0040F809 */  jalr       $v0
/* 3C2B0 8003B6B0 00A42021 */   addu      $a0, $a1, $a0
/* 3C2B4 8003B6B4 9603007C */  lhu        $v1, 0x7c($s0)
/* 3C2B8 8003B6B8 3C04800F */  lui        $a0, %hi(element_labels)
/* 3C2BC 8003B6BC 00621821 */  addu       $v1, $v1, $v0
/* 3C2C0 8003B6C0 A603007C */  sh         $v1, 0x7c($s0)
/* 3C2C4 8003B6C4 92220000 */  lbu        $v0, ($s1)
/* 3C2C8 8003B6C8 8C83F770 */  lw         $v1, %lo(element_labels)($a0)
/* 3C2CC 8003B6CC 00021080 */  sll        $v0, $v0, 2
/* 3C2D0 8003B6D0 00431021 */  addu       $v0, $v0, $v1
/* 3C2D4 8003B6D4 8C450000 */  lw         $a1, ($v0)
/* 3C2D8 8003B6D8 0C00E7D5 */  jal        get_item_info_text
/* 3C2DC 8003B6DC 02002021 */   addu      $a0, $s0, $zero
/* 3C2E0 8003B6E0 00402021 */  addu       $a0, $v0, $zero
/* 3C2E4 8003B6E4 86050060 */  lh         $a1, 0x60($s0)
/* 3C2E8 8003B6E8 9606007C */  lhu        $a2, 0x7c($s0)
/* 3C2EC 8003B6EC 0C02DD3F */  jal        set_widget_coords
/* 3C2F0 8003B6F0 24A50010 */   addiu     $a1, $a1, 0x10
/* 3C2F4 8003B6F4 C6240004 */  lwc1       $f4, 4($s1)
/* 3C2F8 8003B6F8 3C01800E */  lui        $at, %hi(D_800DC00C)
/* 3C2FC 8003B6FC C422C00C */  lwc1       $f2, %lo(D_800DC00C)($at)
/* 3C300 8003B700 46041081 */  sub.s      $f2, $f2, $f4
/* 3C304 8003B704 3C01800E */  lui        $at, %hi(D_800DC010)
/* 3C308 8003B708 C420C010 */  lwc1       $f0, %lo(D_800DC010)($at)
/* 3C30C 8003B70C 46001082 */  mul.s      $f2, $f2, $f0
/* 3C310 8003B710 27A40010 */  addiu      $a0, $sp, 0x10
/* 3C314 8003B714 3C05800E */  lui        $a1, %hi(D_800DC004)
/* 3C318 8003B718 46001021 */  cvt.d.s    $f0, $f2
/* 3C31C 8003B71C 44070000 */  mfc1       $a3, $f0
/* 3C320 8003B720 44060800 */  mfc1       $a2, $f1
/* 3C324 8003B724 0C0333AC */  jal        sprintf
/* 3C328 8003B728 24A5C004 */   addiu     $a1, $a1, %lo(D_800DC004)
/* 3C32C 8003B72C 02002021 */  addu       $a0, $s0, $zero
/* 3C330 8003B730 0C00E7FC */  jal        add_widgetcliptext
/* 3C334 8003B734 27A50010 */   addiu     $a1, $sp, 0x10
/* 3C338 8003B738 00402821 */  addu       $a1, $v0, $zero
/* 3C33C 8003B73C 8CA30078 */  lw         $v1, 0x78($a1)
/* 3C340 8003B740 84640020 */  lh         $a0, 0x20($v1)
/* 3C344 8003B744 8C620024 */  lw         $v0, 0x24($v1)
/* 3C348 8003B748 0040F809 */  jalr       $v0
/* 3C34C 8003B74C 00A42021 */   addu      $a0, $a1, $a0
/* 3C350 8003B750 9603007C */  lhu        $v1, 0x7c($s0)
/* 3C354 8003B754 00621821 */  addu       $v1, $v1, $v0
/* 3C358 8003B758 A603007C */  sh         $v1, 0x7c($s0)
.L8003B75C:
/* 3C35C 8003B75C 8FBF0118 */  lw         $ra, 0x118($sp)
/* 3C360 8003B760 8FB10114 */  lw         $s1, 0x114($sp)
/* 3C364 8003B764 8FB00110 */  lw         $s0, 0x110($sp)
/* 3C368 8003B768 03E00008 */  jr         $ra
/* 3C36C 8003B76C 27BD0120 */   addiu     $sp, $sp, 0x120

glabel weapon_info
/* 3C370 8003B770 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3C374 8003B774 AFB00010 */  sw         $s0, 0x10($sp)
/* 3C378 8003B778 00808021 */  addu       $s0, $a0, $zero
/* 3C37C 8003B77C AFB10014 */  sw         $s1, 0x14($sp)
/* 3C380 8003B780 00A08821 */  addu       $s1, $a1, $zero
/* 3C384 8003B784 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3C388 8003B788 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3C38C 8003B78C 0C02E658 */  jal        widget_menu_build
/* 3C390 8003B790 AFB20018 */   sw        $s2, 0x18($sp)
/* 3C394 8003B794 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3C398 8003B798 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 3C39C 8003B79C 3C13800F */  lui        $s3, %hi(font_face)
/* 3C3A0 8003B7A0 26638D18 */  addiu      $v1, $s3, %lo(font_face)
/* 3C3A4 8003B7A4 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3C3A8 8003B7A8 8E441600 */  lw         $a0, 0x1600($s2)
/* 3C3AC 8003B7AC 8C650008 */  lw         $a1, 8($v1)
/* 3C3B0 8003B7B0 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3C3B4 8003B7B4 0C02D0FD */  jal        font_func
/* 3C3B8 8003B7B8 AE020078 */   sw        $v0, 0x78($s0)
/* 3C3BC 8003B7BC 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3C3C0 8003B7C0 02002021 */   addu      $a0, $s0, $zero
/* 3C3C4 8003B7C4 8E250004 */  lw         $a1, 4($s1)
/* 3C3C8 8003B7C8 96220000 */  lhu        $v0, ($s1)
/* 3C3CC 8003B7CC 02002021 */  addu       $a0, $s0, $zero
/* 3C3D0 8003B7D0 0C00EBCB */  jal        item_name_icon
/* 3C3D4 8003B7D4 A602005E */   sh        $v0, 0x5e($s0)
/* 3C3D8 8003B7D8 3C03800F */  lui        $v1, %hi(weapon_strings)
/* 3C3DC 8003B7DC 92220024 */  lbu        $v0, 0x24($s1)
/* 3C3E0 8003B7E0 8C641B44 */  lw         $a0, %lo(weapon_strings)($v1)
/* 3C3E4 8003B7E4 00021080 */  sll        $v0, $v0, 2
/* 3C3E8 8003B7E8 00441021 */  addu       $v0, $v0, $a0
/* 3C3EC 8003B7EC 8C450000 */  lw         $a1, ($v0)
/* 3C3F0 8003B7F0 0C00EC29 */  jal        print_weapon_type
/* 3C3F4 8003B7F4 02002021 */   addu      $a0, $s0, $zero
/* 3C3F8 8003B7F8 92250008 */  lbu        $a1, 8($s1)
/* 3C3FC 8003B7FC 0C00EC43 */  jal        item_aspect_info
/* 3C400 8003B800 02002021 */   addu      $a0, $s0, $zero
/* 3C404 8003B804 92250017 */  lbu        $a1, 0x17($s1)
/* 3C408 8003B808 0C00EC79 */  jal        print_min_str_requirement
/* 3C40C 8003B80C 02002021 */   addu      $a0, $s0, $zero
/* 3C410 8003B810 92250025 */  lbu        $a1, 0x25($s1)
/* 3C414 8003B814 0C00EC99 */  jal        print_base_hit
/* 3C418 8003B818 02002021 */   addu      $a0, $s0, $zero
/* 3C41C 8003B81C 92250026 */  lbu        $a1, 0x26($s1)
/* 3C420 8003B820 0C00ECB8 */  jal        print_weapon_damage
/* 3C424 8003B824 02002021 */   addu      $a0, $s0, $zero
/* 3C428 8003B828 8E25000C */  lw         $a1, 0xc($s1)
/* 3C42C 8003B82C 0C00ECD7 */  jal        item_stat_info
/* 3C430 8003B830 02002021 */   addu      $a0, $s0, $zero
/* 3C434 8003B834 8E250018 */  lw         $a1, 0x18($s1)
/* 3C438 8003B838 0C00ED0D */  jal        item_skill_info
/* 3C43C 8003B83C 02002021 */   addu      $a0, $s0, $zero
/* 3C440 8003B840 8E25001C */  lw         $a1, 0x1c($s1)
/* 3C444 8003B844 0C00ED37 */  jal        magic_info
/* 3C448 8003B848 02002021 */   addu      $a0, $s0, $zero
/* 3C44C 8003B84C 8E250010 */  lw         $a1, 0x10($s1)
/* 3C450 8003B850 0C00ED6D */  jal        print_item_spell
/* 3C454 8003B854 02002021 */   addu      $a0, $s0, $zero
/* 3C458 8003B858 8E250020 */  lw         $a1, 0x20($s1)
/* 3C45C 8003B85C 0C00ED9A */  jal        print_item_resist
/* 3C460 8003B860 02002021 */   addu      $a0, $s0, $zero
/* 3C464 8003B864 8E441600 */  lw         $a0, 0x1600($s2)
/* 3C468 8003B868 0C02D0FD */  jal        font_func
/* 3C46C 8003B86C 8E658D18 */   lw        $a1, -0x72e8($s3)
/* 3C470 8003B870 02001021 */  addu       $v0, $s0, $zero
/* 3C474 8003B874 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3C478 8003B878 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3C47C 8003B87C 8FB20018 */  lw         $s2, 0x18($sp)
/* 3C480 8003B880 8FB10014 */  lw         $s1, 0x14($sp)
/* 3C484 8003B884 8FB00010 */  lw         $s0, 0x10($sp)
/* 3C488 8003B888 03E00008 */  jr         $ra
/* 3C48C 8003B88C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel armor_info
/* 3C490 8003B890 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* 3C494 8003B894 AFB30124 */  sw         $s3, 0x124($sp)
/* 3C498 8003B898 00809821 */  addu       $s3, $a0, $zero
/* 3C49C 8003B89C AFB40128 */  sw         $s4, 0x128($sp)
/* 3C4A0 8003B8A0 00A0A021 */  addu       $s4, $a1, $zero
/* 3C4A4 8003B8A4 AFBF013C */  sw         $ra, 0x13c($sp)
/* 3C4A8 8003B8A8 AFBE0138 */  sw         $fp, 0x138($sp)
/* 3C4AC 8003B8AC AFB70134 */  sw         $s7, 0x134($sp)
/* 3C4B0 8003B8B0 AFB60130 */  sw         $s6, 0x130($sp)
/* 3C4B4 8003B8B4 AFB5012C */  sw         $s5, 0x12c($sp)
/* 3C4B8 8003B8B8 AFB20120 */  sw         $s2, 0x120($sp)
/* 3C4BC 8003B8BC AFB1011C */  sw         $s1, 0x11c($sp)
/* 3C4C0 8003B8C0 0C02E658 */  jal        widget_menu_build
/* 3C4C4 8003B8C4 AFB00118 */   sw        $s0, 0x118($sp)
/* 3C4C8 8003B8C8 3C11800E */  lui        $s1, %hi(gGlobals)
/* 3C4CC 8003B8CC 263568A8 */  addiu      $s5, $s1, %lo(gGlobals)
/* 3C4D0 8003B8D0 3C10800F */  lui        $s0, %hi(font_face)
/* 3C4D4 8003B8D4 26038D18 */  addiu      $v1, $s0, %lo(font_face)
/* 3C4D8 8003B8D8 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3C4DC 8003B8DC 8EA41600 */  lw         $a0, 0x1600($s5)
/* 3C4E0 8003B8E0 8C650008 */  lw         $a1, 8($v1)
/* 3C4E4 8003B8E4 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3C4E8 8003B8E8 0C02D0FD */  jal        font_func
/* 3C4EC 8003B8EC AE620078 */   sw        $v0, 0x78($s3)
/* 3C4F0 8003B8F0 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3C4F4 8003B8F4 02602021 */   addu      $a0, $s3, $zero
/* 3C4F8 8003B8F8 8E850004 */  lw         $a1, 4($s4)
/* 3C4FC 8003B8FC 96820000 */  lhu        $v0, ($s4)
/* 3C500 8003B900 02602021 */  addu       $a0, $s3, $zero
/* 3C504 8003B904 0C00EBCB */  jal        item_name_icon
/* 3C508 8003B908 A662005E */   sh        $v0, 0x5e($s3)
/* 3C50C 8003B90C 92850008 */  lbu        $a1, 8($s4)
/* 3C510 8003B910 0C00EC43 */  jal        item_aspect_info
/* 3C514 8003B914 02602021 */   addu      $a0, $s3, $zero
/* 3C518 8003B918 8EA2204C */  lw         $v0, 0x204c($s5)
/* 3C51C 8003B91C 8C450880 */  lw         $a1, 0x880($v0)
/* 3C520 8003B920 0C00E7D5 */  jal        get_item_info_text
/* 3C524 8003B924 02602021 */   addu      $a0, $s3, $zero
/* 3C528 8003B928 27A40018 */  addiu      $a0, $sp, 0x18
/* 3C52C 8003B92C 3C02800E */  lui        $v0, %hi(D_800DBFF0)
/* 3C530 8003B930 2456BFF0 */  addiu      $s6, $v0, %lo(D_800DBFF0)
/* 3C534 8003B934 92860025 */  lbu        $a2, 0x25($s4)
/* 3C538 8003B938 0C0333AC */  jal        sprintf
/* 3C53C 8003B93C 02C02821 */   addu      $a1, $s6, $zero
/* 3C540 8003B940 02602021 */  addu       $a0, $s3, $zero
/* 3C544 8003B944 0C00E7FC */  jal        add_widgetcliptext
/* 3C548 8003B948 27A50018 */   addiu     $a1, $sp, 0x18
/* 3C54C 8003B94C 00409021 */  addu       $s2, $v0, $zero
/* 3C550 8003B950 8E430078 */  lw         $v1, 0x78($s2)
/* 3C554 8003B954 84640020 */  lh         $a0, 0x20($v1)
/* 3C558 8003B958 8C620024 */  lw         $v0, 0x24($v1)
/* 3C55C 8003B95C 0040F809 */  jalr       $v0
/* 3C560 8003B960 02442021 */   addu      $a0, $s2, $a0
/* 3C564 8003B964 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C568 8003B968 00621821 */  addu       $v1, $v1, $v0
/* 3C56C 8003B96C A663007C */  sh         $v1, 0x7c($s3)
/* 3C570 8003B970 96820000 */  lhu        $v0, ($s4)
/* 3C574 8003B974 24030006 */  addiu      $v1, $zero, 6
/* 3C578 8003B978 00021202 */  srl        $v0, $v0, 8
/* 3C57C 8003B97C 14430015 */  bne        $v0, $v1, .L8003B9D4
/* 3C580 8003B980 0220F021 */   addu      $fp, $s1, $zero
/* 3C584 8003B984 8EA2204C */  lw         $v0, 0x204c($s5)
/* 3C588 8003B988 8C450884 */  lw         $a1, 0x884($v0)
/* 3C58C 8003B98C 0C00E7D5 */  jal        get_item_info_text
/* 3C590 8003B990 02602021 */   addu      $a0, $s3, $zero
/* 3C594 8003B994 27A40018 */  addiu      $a0, $sp, 0x18
/* 3C598 8003B998 92860024 */  lbu        $a2, 0x24($s4)
/* 3C59C 8003B99C 0C0333AC */  jal        sprintf
/* 3C5A0 8003B9A0 02C02821 */   addu      $a1, $s6, $zero
/* 3C5A4 8003B9A4 02602021 */  addu       $a0, $s3, $zero
/* 3C5A8 8003B9A8 0C00E7FC */  jal        add_widgetcliptext
/* 3C5AC 8003B9AC 27A50018 */   addiu     $a1, $sp, 0x18
/* 3C5B0 8003B9B0 00409021 */  addu       $s2, $v0, $zero
/* 3C5B4 8003B9B4 8E430078 */  lw         $v1, 0x78($s2)
/* 3C5B8 8003B9B8 84640020 */  lh         $a0, 0x20($v1)
/* 3C5BC 8003B9BC 8C620024 */  lw         $v0, 0x24($v1)
/* 3C5C0 8003B9C0 0040F809 */  jalr       $v0
/* 3C5C4 8003B9C4 02442021 */   addu      $a0, $s2, $a0
/* 3C5C8 8003B9C8 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C5CC 8003B9CC 00621821 */  addu       $v1, $v1, $v0
/* 3C5D0 8003B9D0 A663007C */  sh         $v1, 0x7c($s3)
.L8003B9D4:
/* 3C5D4 8003B9D4 8EA2204C */  lw         $v0, 0x204c($s5)
/* 3C5D8 8003B9D8 8C450888 */  lw         $a1, 0x888($v0)
/* 3C5DC 8003B9DC 0C00E7D5 */  jal        get_item_info_text
/* 3C5E0 8003B9E0 02602021 */   addu      $a0, $s3, $zero
/* 3C5E4 8003B9E4 82860026 */  lb         $a2, 0x26($s4)
/* 3C5E8 8003B9E8 18C00006 */  blez       $a2, .L8003BA04
/* 3C5EC 8003B9EC 27A40018 */   addiu     $a0, $sp, 0x18
/* 3C5F0 8003B9F0 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3C5F4 8003B9F4 0C0333AC */  jal        sprintf
/* 3C5F8 8003B9F8 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3C5FC 8003B9FC 0800EE85 */  j          .L8003BA14
/* 3C600 8003BA00 02602021 */   addu      $a0, $s3, $zero
.L8003BA04:
/* 3C604 8003BA04 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3C608 8003BA08 0C0333AC */  jal        sprintf
/* 3C60C 8003BA0C 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3C610 8003BA10 02602021 */  addu       $a0, $s3, $zero
.L8003BA14:
/* 3C614 8003BA14 0C00E7FC */  jal        add_widgetcliptext
/* 3C618 8003BA18 27A50018 */   addiu     $a1, $sp, 0x18
/* 3C61C 8003BA1C 00409021 */  addu       $s2, $v0, $zero
/* 3C620 8003BA20 8E430078 */  lw         $v1, 0x78($s2)
/* 3C624 8003BA24 84640020 */  lh         $a0, 0x20($v1)
/* 3C628 8003BA28 8C620024 */  lw         $v0, 0x24($v1)
/* 3C62C 8003BA2C 0040F809 */  jalr       $v0
/* 3C630 8003BA30 02442021 */   addu      $a0, $s2, $a0
/* 3C634 8003BA34 02602021 */  addu       $a0, $s3, $zero
/* 3C638 8003BA38 27C568A8 */  addiu      $a1, $fp, 0x68a8
/* 3C63C 8003BA3C 8CA6204C */  lw         $a2, 0x204c($a1)
/* 3C640 8003BA40 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C644 8003BA44 8CC5088C */  lw         $a1, 0x88c($a2)
/* 3C648 8003BA48 00621821 */  addu       $v1, $v1, $v0
/* 3C64C 8003BA4C 0C00E7D5 */  jal        get_item_info_text
/* 3C650 8003BA50 A663007C */   sh        $v1, 0x7c($s3)
/* 3C654 8003BA54 82860027 */  lb         $a2, 0x27($s4)
/* 3C658 8003BA58 18C00006 */  blez       $a2, .L8003BA74
/* 3C65C 8003BA5C 27A40018 */   addiu     $a0, $sp, 0x18
/* 3C660 8003BA60 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3C664 8003BA64 0C0333AC */  jal        sprintf
/* 3C668 8003BA68 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3C66C 8003BA6C 0800EEA1 */  j          .L8003BA84
/* 3C670 8003BA70 02602021 */   addu      $a0, $s3, $zero
.L8003BA74:
/* 3C674 8003BA74 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3C678 8003BA78 0C0333AC */  jal        sprintf
/* 3C67C 8003BA7C 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3C680 8003BA80 02602021 */  addu       $a0, $s3, $zero
.L8003BA84:
/* 3C684 8003BA84 0C00E7FC */  jal        add_widgetcliptext
/* 3C688 8003BA88 27A50018 */   addiu     $a1, $sp, 0x18
/* 3C68C 8003BA8C 00409021 */  addu       $s2, $v0, $zero
/* 3C690 8003BA90 8E430078 */  lw         $v1, 0x78($s2)
/* 3C694 8003BA94 84640020 */  lh         $a0, 0x20($v1)
/* 3C698 8003BA98 8C620024 */  lw         $v0, 0x24($v1)
/* 3C69C 8003BA9C 0040F809 */  jalr       $v0
/* 3C6A0 8003BAA0 02442021 */   addu      $a0, $s2, $a0
/* 3C6A4 8003BAA4 02602021 */  addu       $a0, $s3, $zero
/* 3C6A8 8003BAA8 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C6AC 8003BAAC 8E85000C */  lw         $a1, 0xc($s4)
/* 3C6B0 8003BAB0 00621821 */  addu       $v1, $v1, $v0
/* 3C6B4 8003BAB4 0C00ECD7 */  jal        item_stat_info
/* 3C6B8 8003BAB8 A663007C */   sh        $v1, 0x7c($s3)
/* 3C6BC 8003BABC 8E850018 */  lw         $a1, 0x18($s4)
/* 3C6C0 8003BAC0 0C00ED0D */  jal        item_skill_info
/* 3C6C4 8003BAC4 02602021 */   addu      $a0, $s3, $zero
/* 3C6C8 8003BAC8 8E85001C */  lw         $a1, 0x1c($s4)
/* 3C6CC 8003BACC 0C00ED37 */  jal        magic_info
/* 3C6D0 8003BAD0 02602021 */   addu      $a0, $s3, $zero
/* 3C6D4 8003BAD4 8E850010 */  lw         $a1, 0x10($s4)
/* 3C6D8 8003BAD8 0C00ED6D */  jal        print_item_spell
/* 3C6DC 8003BADC 02602021 */   addu      $a0, $s3, $zero
/* 3C6E0 8003BAE0 8E850020 */  lw         $a1, 0x20($s4)
/* 3C6E4 8003BAE4 0C00ED9A */  jal        print_item_resist
/* 3C6E8 8003BAE8 02602021 */   addu      $a0, $s3, $zero
/* 3C6EC 8003BAEC 27C568A8 */  addiu      $a1, $fp, 0x68a8
/* 3C6F0 8003BAF0 3C04800F */  lui        $a0, %hi(partypicker)
/* 3C6F4 8003BAF4 9082D550 */  lbu        $v0, %lo(partypicker)($a0)
/* 3C6F8 8003BAF8 8CA315F8 */  lw         $v1, 0x15f8($a1)
/* 3C6FC 8003BAFC 00021080 */  sll        $v0, $v0, 2
/* 3C700 8003BB00 00621821 */  addu       $v1, $v1, $v0
/* 3C704 8003BB04 8C760000 */  lw         $s6, ($v1)
/* 3C708 8003BB08 12C00108 */  beqz       $s6, .L8003BF2C
/* 3C70C 8003BB0C 02C02021 */   addu      $a0, $s6, $zero
/* 3C710 8003BB10 00002821 */  addu       $a1, $zero, $zero
/* 3C714 8003BB14 240200D5 */  addiu      $v0, $zero, 0xd5
/* 3C718 8003BB18 0C01EE75 */  jal        get_some_armor_stat
/* 3C71C 8003BB1C A662007C */   sh        $v0, 0x7c($s3)
/* 3C720 8003BB20 0040A021 */  addu       $s4, $v0, $zero
/* 3C724 8003BB24 9665005E */  lhu        $a1, 0x5e($s3)
/* 3C728 8003BB28 0C01EE75 */  jal        get_some_armor_stat
/* 3C72C 8003BB2C 02C02021 */   addu      $a0, $s6, $zero
/* 3C730 8003BB30 00408821 */  addu       $s1, $v0, $zero
/* 3C734 8003BB34 27A40018 */  addiu      $a0, $sp, 0x18
/* 3C738 8003BB38 3C10800E */  lui        $s0, %hi(D_800DC014)
/* 3C73C 8003BB3C 2605C014 */  addiu      $a1, $s0, %lo(D_800DC014)
/* 3C740 8003BB40 0C0333AC */  jal        sprintf
/* 3C744 8003BB44 02203021 */   addu      $a2, $s1, $zero
/* 3C748 8003BB48 0C026259 */  jal        passToMalloc
/* 3C74C 8003BB4C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3C750 8003BB50 00402021 */  addu       $a0, $v0, $zero
/* 3C754 8003BB54 27A50018 */  addiu      $a1, $sp, 0x18
/* 3C758 8003BB58 0C02DFC8 */  jal        widgetcliptext_init
/* 3C75C 8003BB5C 24060190 */   addiu     $a2, $zero, 0x190
/* 3C760 8003BB60 00409021 */  addu       $s2, $v0, $zero
/* 3C764 8003BB64 8E430078 */  lw         $v1, 0x78($s2)
/* 3C768 8003BB68 24150095 */  addiu      $s5, $zero, 0x95
/* 3C76C 8003BB6C 84640020 */  lh         $a0, 0x20($v1)
/* 3C770 8003BB70 8C620024 */  lw         $v0, 0x24($v1)
/* 3C774 8003BB74 0040F809 */  jalr       $v0
/* 3C778 8003BB78 02442021 */   addu      $a0, $s2, $a0
/* 3C77C 8003BB7C 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C780 8003BB80 8E450078 */  lw         $a1, 0x78($s2)
/* 3C784 8003BB84 00621823 */  subu       $v1, $v1, $v0
/* 3C788 8003BB88 A663007C */  sh         $v1, 0x7c($s3)
/* 3C78C 8003BB8C 84A40018 */  lh         $a0, 0x18($a1)
/* 3C790 8003BB90 8CA2001C */  lw         $v0, 0x1c($a1)
/* 3C794 8003BB94 0040F809 */  jalr       $v0
/* 3C798 8003BB98 02442021 */   addu      $a0, $s2, $a0
/* 3C79C 8003BB9C 02A21023 */  subu       $v0, $s5, $v0
/* 3C7A0 8003BBA0 3055FFFF */  andi       $s5, $v0, 0xffff
/* 3C7A4 8003BBA4 02402021 */  addu       $a0, $s2, $zero
/* 3C7A8 8003BBA8 9666007C */  lhu        $a2, 0x7c($s3)
/* 3C7AC 8003BBAC 0C02DD3F */  jal        set_widget_coords
/* 3C7B0 8003BBB0 02A02821 */   addu      $a1, $s5, $zero
/* 3C7B4 8003BBB4 02602021 */  addu       $a0, $s3, $zero
/* 3C7B8 8003BBB8 0C02DEDC */  jal        link_widgets
/* 3C7BC 8003BBBC 02402821 */   addu      $a1, $s2, $zero
/* 3C7C0 8003BBC0 0291182A */  slt        $v1, $s4, $s1
/* 3C7C4 8003BBC4 10600003 */  beqz       $v1, .L8003BBD4
/* 3C7C8 8003BBC8 00002821 */   addu      $a1, $zero, $zero
/* 3C7CC 8003BBCC 0800EEFA */  j          .L8003BBE8
/* 3C7D0 8003BBD0 24060080 */   addiu     $a2, $zero, 0x80
.L8003BBD4:
/* 3C7D4 8003BBD4 0234102A */  slt        $v0, $s1, $s4
/* 3C7D8 8003BBD8 5040000D */  beql       $v0, $zero, .L8003BC10
/* 3C7DC 8003BBDC 24050082 */   addiu     $a1, $zero, 0x82
/* 3C7E0 8003BBE0 24050080 */  addiu      $a1, $zero, 0x80
/* 3C7E4 8003BBE4 00003021 */  addu       $a2, $zero, $zero
.L8003BBE8:
/* 3C7E8 8003BBE8 8E480078 */  lw         $t0, 0x78($s2)
/* 3C7EC 8003BBEC 00003821 */  addu       $a3, $zero, $zero
/* 3C7F0 8003BBF0 85040048 */  lh         $a0, 0x48($t0)
/* 3C7F4 8003BBF4 240200FF */  addiu      $v0, $zero, 0xff
/* 3C7F8 8003BBF8 AFA20010 */  sw         $v0, 0x10($sp)
/* 3C7FC 8003BBFC 8D03004C */  lw         $v1, 0x4c($t0)
/* 3C800 8003BC00 0060F809 */  jalr       $v1
/* 3C804 8003BC04 02442021 */   addu      $a0, $s2, $a0
/* 3C808 8003BC08 0800EF0E */  j          .L8003BC38
/* 3C80C 8003BC0C 27A40018 */   addiu     $a0, $sp, 0x18
.L8003BC10:
/* 3C810 8003BC10 24060050 */  addiu      $a2, $zero, 0x50
/* 3C814 8003BC14 8E480078 */  lw         $t0, 0x78($s2)
/* 3C818 8003BC18 24070050 */  addiu      $a3, $zero, 0x50
/* 3C81C 8003BC1C 85040048 */  lh         $a0, 0x48($t0)
/* 3C820 8003BC20 240200FF */  addiu      $v0, $zero, 0xff
/* 3C824 8003BC24 AFA20010 */  sw         $v0, 0x10($sp)
/* 3C828 8003BC28 8D03004C */  lw         $v1, 0x4c($t0)
/* 3C82C 8003BC2C 0060F809 */  jalr       $v1
/* 3C830 8003BC30 02442021 */   addu      $a0, $s2, $a0
/* 3C834 8003BC34 27A40018 */  addiu      $a0, $sp, 0x18
.L8003BC38:
/* 3C838 8003BC38 3C10800E */  lui        $s0, %hi(D_800DC01C)
/* 3C83C 8003BC3C 2605C01C */  addiu      $a1, $s0, %lo(D_800DC01C)
/* 3C840 8003BC40 0C0333AC */  jal        sprintf
/* 3C844 8003BC44 02803021 */   addu      $a2, $s4, $zero
/* 3C848 8003BC48 0C026259 */  jal        passToMalloc
/* 3C84C 8003BC4C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3C850 8003BC50 00402021 */  addu       $a0, $v0, $zero
/* 3C854 8003BC54 27A50018 */  addiu      $a1, $sp, 0x18
/* 3C858 8003BC58 0C02DFC8 */  jal        widgetcliptext_init
/* 3C85C 8003BC5C 24060190 */   addiu     $a2, $zero, 0x190
/* 3C860 8003BC60 00409021 */  addu       $s2, $v0, $zero
/* 3C864 8003BC64 24050082 */  addiu      $a1, $zero, 0x82
/* 3C868 8003BC68 24060050 */  addiu      $a2, $zero, 0x50
/* 3C86C 8003BC6C 8E430078 */  lw         $v1, 0x78($s2)
/* 3C870 8003BC70 24070050 */  addiu      $a3, $zero, 0x50
/* 3C874 8003BC74 84640048 */  lh         $a0, 0x48($v1)
/* 3C878 8003BC78 241700FF */  addiu      $s7, $zero, 0xff
/* 3C87C 8003BC7C AFB70010 */  sw         $s7, 0x10($sp)
/* 3C880 8003BC80 8C62004C */  lw         $v0, 0x4c($v1)
/* 3C884 8003BC84 0040F809 */  jalr       $v0
/* 3C888 8003BC88 02442021 */   addu      $a0, $s2, $a0
/* 3C88C 8003BC8C 8E430078 */  lw         $v1, 0x78($s2)
/* 3C890 8003BC90 84640018 */  lh         $a0, 0x18($v1)
/* 3C894 8003BC94 8C62001C */  lw         $v0, 0x1c($v1)
/* 3C898 8003BC98 0040F809 */  jalr       $v0
/* 3C89C 8003BC9C 02442021 */   addu      $a0, $s2, $a0
/* 3C8A0 8003BCA0 02402021 */  addu       $a0, $s2, $zero
/* 3C8A4 8003BCA4 02A21023 */  subu       $v0, $s5, $v0
/* 3C8A8 8003BCA8 9666007C */  lhu        $a2, 0x7c($s3)
/* 3C8AC 8003BCAC 0C02DD3F */  jal        set_widget_coords
/* 3C8B0 8003BCB0 3045FFFF */   andi      $a1, $v0, 0xffff
/* 3C8B4 8003BCB4 02602021 */  addu       $a0, $s3, $zero
/* 3C8B8 8003BCB8 0C02DEDC */  jal        link_widgets
/* 3C8BC 8003BCBC 02402821 */   addu      $a1, $s2, $zero
/* 3C8C0 8003BCC0 0C026259 */  jal        passToMalloc
/* 3C8C4 8003BCC4 2404007C */   addiu     $a0, $zero, 0x7c
/* 3C8C8 8003BCC8 27C368A8 */  addiu      $v1, $fp, 0x68a8
/* 3C8CC 8003BCCC 8C66204C */  lw         $a2, 0x204c($v1)
/* 3C8D0 8003BCD0 00402021 */  addu       $a0, $v0, $zero
/* 3C8D4 8003BCD4 8CC50890 */  lw         $a1, 0x890($a2)
/* 3C8D8 8003BCD8 0C02DFC8 */  jal        widgetcliptext_init
/* 3C8DC 8003BCDC 24060190 */   addiu     $a2, $zero, 0x190
/* 3C8E0 8003BCE0 00409021 */  addu       $s2, $v0, $zero
/* 3C8E4 8003BCE4 24050082 */  addiu      $a1, $zero, 0x82
/* 3C8E8 8003BCE8 8E430078 */  lw         $v1, 0x78($s2)
/* 3C8EC 8003BCEC 24060050 */  addiu      $a2, $zero, 0x50
/* 3C8F0 8003BCF0 84640048 */  lh         $a0, 0x48($v1)
/* 3C8F4 8003BCF4 24070050 */  addiu      $a3, $zero, 0x50
/* 3C8F8 8003BCF8 AFB70010 */  sw         $s7, 0x10($sp)
/* 3C8FC 8003BCFC 8C62004C */  lw         $v0, 0x4c($v1)
/* 3C900 8003BD00 0040F809 */  jalr       $v0
/* 3C904 8003BD04 02442021 */   addu      $a0, $s2, $a0
/* 3C908 8003BD08 86650060 */  lh         $a1, 0x60($s3)
/* 3C90C 8003BD0C 9666007C */  lhu        $a2, 0x7c($s3)
/* 3C910 8003BD10 0C02DD3F */  jal        set_widget_coords
/* 3C914 8003BD14 02402021 */   addu      $a0, $s2, $zero
/* 3C918 8003BD18 02602021 */  addu       $a0, $s3, $zero
/* 3C91C 8003BD1C 0C02DEDC */  jal        link_widgets
/* 3C920 8003BD20 02402821 */   addu      $a1, $s2, $zero
/* 3C924 8003BD24 02C02021 */  addu       $a0, $s6, $zero
/* 3C928 8003BD28 0C01EE9D */  jal        some_armor_func
/* 3C92C 8003BD2C 00002821 */   addu      $a1, $zero, $zero
/* 3C930 8003BD30 0040A021 */  addu       $s4, $v0, $zero
/* 3C934 8003BD34 9665005E */  lhu        $a1, 0x5e($s3)
/* 3C938 8003BD38 0C01EE9D */  jal        some_armor_func
/* 3C93C 8003BD3C 02C02021 */   addu      $a0, $s6, $zero
/* 3C940 8003BD40 00408821 */  addu       $s1, $v0, $zero
/* 3C944 8003BD44 27A40018 */  addiu      $a0, $sp, 0x18
/* 3C948 8003BD48 3C02800E */  lui        $v0, %hi(D_800DC014)
/* 3C94C 8003BD4C 2445C014 */  addiu      $a1, $v0, %lo(D_800DC014)
/* 3C950 8003BD50 0C0333AC */  jal        sprintf
/* 3C954 8003BD54 02203021 */   addu      $a2, $s1, $zero
/* 3C958 8003BD58 0C026259 */  jal        passToMalloc
/* 3C95C 8003BD5C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3C960 8003BD60 00402021 */  addu       $a0, $v0, $zero
/* 3C964 8003BD64 27A50018 */  addiu      $a1, $sp, 0x18
/* 3C968 8003BD68 0C02DFC8 */  jal        widgetcliptext_init
/* 3C96C 8003BD6C 24060190 */   addiu     $a2, $zero, 0x190
/* 3C970 8003BD70 00409021 */  addu       $s2, $v0, $zero
/* 3C974 8003BD74 8E430078 */  lw         $v1, 0x78($s2)
/* 3C978 8003BD78 24150095 */  addiu      $s5, $zero, 0x95
/* 3C97C 8003BD7C 84640020 */  lh         $a0, 0x20($v1)
/* 3C980 8003BD80 8C620024 */  lw         $v0, 0x24($v1)
/* 3C984 8003BD84 0040F809 */  jalr       $v0
/* 3C988 8003BD88 02442021 */   addu      $a0, $s2, $a0
/* 3C98C 8003BD8C 9663007C */  lhu        $v1, 0x7c($s3)
/* 3C990 8003BD90 8E450078 */  lw         $a1, 0x78($s2)
/* 3C994 8003BD94 00621823 */  subu       $v1, $v1, $v0
/* 3C998 8003BD98 A663007C */  sh         $v1, 0x7c($s3)
/* 3C99C 8003BD9C 84A40018 */  lh         $a0, 0x18($a1)
/* 3C9A0 8003BDA0 8CA2001C */  lw         $v0, 0x1c($a1)
/* 3C9A4 8003BDA4 0040F809 */  jalr       $v0
/* 3C9A8 8003BDA8 02442021 */   addu      $a0, $s2, $a0
/* 3C9AC 8003BDAC 02A21023 */  subu       $v0, $s5, $v0
/* 3C9B0 8003BDB0 3055FFFF */  andi       $s5, $v0, 0xffff
/* 3C9B4 8003BDB4 02402021 */  addu       $a0, $s2, $zero
/* 3C9B8 8003BDB8 9666007C */  lhu        $a2, 0x7c($s3)
/* 3C9BC 8003BDBC 0C02DD3F */  jal        set_widget_coords
/* 3C9C0 8003BDC0 02A02821 */   addu      $a1, $s5, $zero
/* 3C9C4 8003BDC4 02602021 */  addu       $a0, $s3, $zero
/* 3C9C8 8003BDC8 0C02DEDC */  jal        link_widgets
/* 3C9CC 8003BDCC 02402821 */   addu      $a1, $s2, $zero
/* 3C9D0 8003BDD0 0291182A */  slt        $v1, $s4, $s1
/* 3C9D4 8003BDD4 10600004 */  beqz       $v1, .L8003BDE8
/* 3C9D8 8003BDD8 00002821 */   addu      $a1, $zero, $zero
/* 3C9DC 8003BDDC 8E420078 */  lw         $v0, 0x78($s2)
/* 3C9E0 8003BDE0 0800EF80 */  j          .L8003BE00
/* 3C9E4 8003BDE4 24060080 */   addiu     $a2, $zero, 0x80
.L8003BDE8:
/* 3C9E8 8003BDE8 0234102A */  slt        $v0, $s1, $s4
/* 3C9EC 8003BDEC 5040000C */  beql       $v0, $zero, .L8003BE20
/* 3C9F0 8003BDF0 24050082 */   addiu     $a1, $zero, 0x82
/* 3C9F4 8003BDF4 24050080 */  addiu      $a1, $zero, 0x80
/* 3C9F8 8003BDF8 8E420078 */  lw         $v0, 0x78($s2)
/* 3C9FC 8003BDFC 00003021 */  addu       $a2, $zero, $zero
.L8003BE00:
/* 3CA00 8003BE00 84440048 */  lh         $a0, 0x48($v0)
/* 3CA04 8003BE04 00003821 */  addu       $a3, $zero, $zero
/* 3CA08 8003BE08 AFB70010 */  sw         $s7, 0x10($sp)
/* 3CA0C 8003BE0C 8C43004C */  lw         $v1, 0x4c($v0)
/* 3CA10 8003BE10 0060F809 */  jalr       $v1
/* 3CA14 8003BE14 02442021 */   addu      $a0, $s2, $a0
/* 3CA18 8003BE18 0800EF91 */  j          .L8003BE44
/* 3CA1C 8003BE1C 27A40018 */   addiu     $a0, $sp, 0x18
.L8003BE20:
/* 3CA20 8003BE20 8E420078 */  lw         $v0, 0x78($s2)
/* 3CA24 8003BE24 24060050 */  addiu      $a2, $zero, 0x50
/* 3CA28 8003BE28 84440048 */  lh         $a0, 0x48($v0)
/* 3CA2C 8003BE2C 24070050 */  addiu      $a3, $zero, 0x50
/* 3CA30 8003BE30 AFB70010 */  sw         $s7, 0x10($sp)
/* 3CA34 8003BE34 8C43004C */  lw         $v1, 0x4c($v0)
/* 3CA38 8003BE38 0060F809 */  jalr       $v1
/* 3CA3C 8003BE3C 02442021 */   addu      $a0, $s2, $a0
/* 3CA40 8003BE40 27A40018 */  addiu      $a0, $sp, 0x18
.L8003BE44:
/* 3CA44 8003BE44 2605C01C */  addiu      $a1, $s0, -0x3fe4
/* 3CA48 8003BE48 0C0333AC */  jal        sprintf
/* 3CA4C 8003BE4C 02803021 */   addu      $a2, $s4, $zero
/* 3CA50 8003BE50 0C026259 */  jal        passToMalloc
/* 3CA54 8003BE54 2404007C */   addiu     $a0, $zero, 0x7c
/* 3CA58 8003BE58 00402021 */  addu       $a0, $v0, $zero
/* 3CA5C 8003BE5C 27A50018 */  addiu      $a1, $sp, 0x18
/* 3CA60 8003BE60 0C02DFC8 */  jal        widgetcliptext_init
/* 3CA64 8003BE64 24060190 */   addiu     $a2, $zero, 0x190
/* 3CA68 8003BE68 00409021 */  addu       $s2, $v0, $zero
/* 3CA6C 8003BE6C 24050082 */  addiu      $a1, $zero, 0x82
/* 3CA70 8003BE70 24060050 */  addiu      $a2, $zero, 0x50
/* 3CA74 8003BE74 8E430078 */  lw         $v1, 0x78($s2)
/* 3CA78 8003BE78 24070050 */  addiu      $a3, $zero, 0x50
/* 3CA7C 8003BE7C 84640048 */  lh         $a0, 0x48($v1)
/* 3CA80 8003BE80 241000FF */  addiu      $s0, $zero, 0xff
/* 3CA84 8003BE84 AFB00010 */  sw         $s0, 0x10($sp)
/* 3CA88 8003BE88 8C62004C */  lw         $v0, 0x4c($v1)
/* 3CA8C 8003BE8C 0040F809 */  jalr       $v0
/* 3CA90 8003BE90 02442021 */   addu      $a0, $s2, $a0
/* 3CA94 8003BE94 8E430078 */  lw         $v1, 0x78($s2)
/* 3CA98 8003BE98 84640018 */  lh         $a0, 0x18($v1)
/* 3CA9C 8003BE9C 8C62001C */  lw         $v0, 0x1c($v1)
/* 3CAA0 8003BEA0 0040F809 */  jalr       $v0
/* 3CAA4 8003BEA4 02442021 */   addu      $a0, $s2, $a0
/* 3CAA8 8003BEA8 02402021 */  addu       $a0, $s2, $zero
/* 3CAAC 8003BEAC 02A21023 */  subu       $v0, $s5, $v0
/* 3CAB0 8003BEB0 9666007C */  lhu        $a2, 0x7c($s3)
/* 3CAB4 8003BEB4 0C02DD3F */  jal        set_widget_coords
/* 3CAB8 8003BEB8 3045FFFF */   andi      $a1, $v0, 0xffff
/* 3CABC 8003BEBC 02602021 */  addu       $a0, $s3, $zero
/* 3CAC0 8003BEC0 0C02DEDC */  jal        link_widgets
/* 3CAC4 8003BEC4 02402821 */   addu      $a1, $s2, $zero
/* 3CAC8 8003BEC8 0C026259 */  jal        passToMalloc
/* 3CACC 8003BECC 2404007C */   addiu     $a0, $zero, 0x7c
/* 3CAD0 8003BED0 27C368A8 */  addiu      $v1, $fp, 0x68a8
/* 3CAD4 8003BED4 8C66204C */  lw         $a2, 0x204c($v1)
/* 3CAD8 8003BED8 00402021 */  addu       $a0, $v0, $zero
/* 3CADC 8003BEDC 8CC50894 */  lw         $a1, 0x894($a2)
/* 3CAE0 8003BEE0 0C02DFC8 */  jal        widgetcliptext_init
/* 3CAE4 8003BEE4 24060190 */   addiu     $a2, $zero, 0x190
/* 3CAE8 8003BEE8 00409021 */  addu       $s2, $v0, $zero
/* 3CAEC 8003BEEC 24050082 */  addiu      $a1, $zero, 0x82
/* 3CAF0 8003BEF0 8E430078 */  lw         $v1, 0x78($s2)
/* 3CAF4 8003BEF4 24060050 */  addiu      $a2, $zero, 0x50
/* 3CAF8 8003BEF8 84640048 */  lh         $a0, 0x48($v1)
/* 3CAFC 8003BEFC 24070050 */  addiu      $a3, $zero, 0x50
/* 3CB00 8003BF00 AFB00010 */  sw         $s0, 0x10($sp)
/* 3CB04 8003BF04 8C62004C */  lw         $v0, 0x4c($v1)
/* 3CB08 8003BF08 0040F809 */  jalr       $v0
/* 3CB0C 8003BF0C 02442021 */   addu      $a0, $s2, $a0
/* 3CB10 8003BF10 86650060 */  lh         $a1, 0x60($s3)
/* 3CB14 8003BF14 9666007C */  lhu        $a2, 0x7c($s3)
/* 3CB18 8003BF18 0C02DD3F */  jal        set_widget_coords
/* 3CB1C 8003BF1C 02402021 */   addu      $a0, $s2, $zero
/* 3CB20 8003BF20 02602021 */  addu       $a0, $s3, $zero
/* 3CB24 8003BF24 0C02DEDC */  jal        link_widgets
/* 3CB28 8003BF28 02402821 */   addu      $a1, $s2, $zero
.L8003BF2C:
/* 3CB2C 8003BF2C 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 3CB30 8003BF30 8C441600 */  lw         $a0, 0x1600($v0)
/* 3CB34 8003BF34 3C02800F */  lui        $v0, %hi(font_face)
/* 3CB38 8003BF38 0C02D0FD */  jal        font_func
/* 3CB3C 8003BF3C 8C458D18 */   lw        $a1, %lo(font_face)($v0)
/* 3CB40 8003BF40 02601021 */  addu       $v0, $s3, $zero
/* 3CB44 8003BF44 8FBF013C */  lw         $ra, 0x13c($sp)
/* 3CB48 8003BF48 8FBE0138 */  lw         $fp, 0x138($sp)
/* 3CB4C 8003BF4C 8FB70134 */  lw         $s7, 0x134($sp)
/* 3CB50 8003BF50 8FB60130 */  lw         $s6, 0x130($sp)
/* 3CB54 8003BF54 8FB5012C */  lw         $s5, 0x12c($sp)
/* 3CB58 8003BF58 8FB40128 */  lw         $s4, 0x128($sp)
/* 3CB5C 8003BF5C 8FB30124 */  lw         $s3, 0x124($sp)
/* 3CB60 8003BF60 8FB20120 */  lw         $s2, 0x120($sp)
/* 3CB64 8003BF64 8FB1011C */  lw         $s1, 0x11c($sp)
/* 3CB68 8003BF68 8FB00118 */  lw         $s0, 0x118($sp)
/* 3CB6C 8003BF6C 03E00008 */  jr         $ra
/* 3CB70 8003BF70 27BD0140 */   addiu     $sp, $sp, 0x140

glabel func_8003BF74
/* 3CB74 8003BF74 27BDFED8 */  addiu      $sp, $sp, -0x128
/* 3CB78 8003BF78 AFB3011C */  sw         $s3, 0x11c($sp)
/* 3CB7C 8003BF7C 00809821 */  addu       $s3, $a0, $zero
/* 3CB80 8003BF80 AFB40120 */  sw         $s4, 0x120($sp)
/* 3CB84 8003BF84 00A0A021 */  addu       $s4, $a1, $zero
/* 3CB88 8003BF88 AFBF0124 */  sw         $ra, 0x124($sp)
/* 3CB8C 8003BF8C AFB20118 */  sw         $s2, 0x118($sp)
/* 3CB90 8003BF90 AFB10114 */  sw         $s1, 0x114($sp)
/* 3CB94 8003BF94 0C02E658 */  jal        widget_menu_build
/* 3CB98 8003BF98 AFB00110 */   sw        $s0, 0x110($sp)
/* 3CB9C 8003BF9C 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3CBA0 8003BFA0 265068A8 */  addiu      $s0, $s2, %lo(gGlobals)
/* 3CBA4 8003BFA4 3C11800F */  lui        $s1, %hi(font_face)
/* 3CBA8 8003BFA8 26238D18 */  addiu      $v1, $s1, %lo(font_face)
/* 3CBAC 8003BFAC 3C02800E */  lui        $v0, %hi(widget_methods_ItemDetail)
/* 3CBB0 8003BFB0 8E041600 */  lw         $a0, 0x1600($s0)
/* 3CBB4 8003BFB4 8C650008 */  lw         $a1, 8($v1)
/* 3CBB8 8003BFB8 2442C028 */  addiu      $v0, $v0, %lo(widget_methods_ItemDetail)
/* 3CBBC 8003BFBC 0C02D0FD */  jal        font_func
/* 3CBC0 8003BFC0 AE620078 */   sw        $v0, 0x78($s3)
/* 3CBC4 8003BFC4 0C00EBC0 */  jal        left_side_menu_info_widget
/* 3CBC8 8003BFC8 02602021 */   addu      $a0, $s3, $zero
/* 3CBCC 8003BFCC 8E850004 */  lw         $a1, 4($s4)
/* 3CBD0 8003BFD0 96820000 */  lhu        $v0, ($s4)
/* 3CBD4 8003BFD4 02602021 */  addu       $a0, $s3, $zero
/* 3CBD8 8003BFD8 0C00EBCB */  jal        item_name_icon
/* 3CBDC 8003BFDC A662005E */   sh        $v0, 0x5e($s3)
/* 3CBE0 8003BFE0 92850008 */  lbu        $a1, 8($s4)
/* 3CBE4 8003BFE4 0C00EC43 */  jal        item_aspect_info
/* 3CBE8 8003BFE8 02602021 */   addu      $a0, $s3, $zero
/* 3CBEC 8003BFEC 8E02204C */  lw         $v0, 0x204c($s0)
/* 3CBF0 8003BFF0 8C450898 */  lw         $a1, 0x898($v0)
/* 3CBF4 8003BFF4 0C00E7D5 */  jal        get_item_info_text
/* 3CBF8 8003BFF8 02602021 */   addu      $a0, $s3, $zero
/* 3CBFC 8003BFFC 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CC00 8003C000 3C05800E */  lui        $a1, %hi(D_800DBFF0)
/* 3CC04 8003C004 92860016 */  lbu        $a2, 0x16($s4)
/* 3CC08 8003C008 0C0333AC */  jal        sprintf
/* 3CC0C 8003C00C 24A5BFF0 */   addiu     $a1, $a1, %lo(D_800DBFF0)
/* 3CC10 8003C010 02602021 */  addu       $a0, $s3, $zero
/* 3CC14 8003C014 0C00E7FC */  jal        add_widgetcliptext
/* 3CC18 8003C018 27A50010 */   addiu     $a1, $sp, 0x10
/* 3CC1C 8003C01C 00402821 */  addu       $a1, $v0, $zero
/* 3CC20 8003C020 8CA30078 */  lw         $v1, 0x78($a1)
/* 3CC24 8003C024 84640020 */  lh         $a0, 0x20($v1)
/* 3CC28 8003C028 8C620024 */  lw         $v0, 0x24($v1)
/* 3CC2C 8003C02C 0040F809 */  jalr       $v0
/* 3CC30 8003C030 00A42021 */   addu      $a0, $a1, $a0
/* 3CC34 8003C034 9663007C */  lhu        $v1, 0x7c($s3)
/* 3CC38 8003C038 00621821 */  addu       $v1, $v1, $v0
/* 3CC3C 8003C03C A663007C */  sh         $v1, 0x7c($s3)
/* 3CC40 8003C040 92850017 */  lbu        $a1, 0x17($s4)
/* 3CC44 8003C044 0C00EC79 */  jal        print_min_str_requirement
/* 3CC48 8003C048 02602021 */   addu      $a0, $s3, $zero
/* 3CC4C 8003C04C 8E02204C */  lw         $v0, 0x204c($s0)
/* 3CC50 8003C050 8C45086C */  lw         $a1, 0x86c($v0)
/* 3CC54 8003C054 0C00E7D5 */  jal        get_item_info_text
/* 3CC58 8003C058 02602021 */   addu      $a0, $s3, $zero
/* 3CC5C 8003C05C 92820014 */  lbu        $v0, 0x14($s4)
/* 3CC60 8003C060 10400007 */  beqz       $v0, .L8003C080
/* 3CC64 8003C064 00403021 */   addu      $a2, $v0, $zero
/* 3CC68 8003C068 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CC6C 8003C06C 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3CC70 8003C070 0C0333AC */  jal        sprintf
/* 3CC74 8003C074 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3CC78 8003C078 0800F026 */  j          .L8003C098
/* 3CC7C 8003C07C 02602021 */   addu      $a0, $s3, $zero
.L8003C080:
/* 3CC80 8003C080 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CC84 8003C084 92860014 */  lbu        $a2, 0x14($s4)
/* 3CC88 8003C088 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3CC8C 8003C08C 0C0333AC */  jal        sprintf
/* 3CC90 8003C090 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3CC94 8003C094 02602021 */  addu       $a0, $s3, $zero
.L8003C098:
/* 3CC98 8003C098 0C00E7FC */  jal        add_widgetcliptext
/* 3CC9C 8003C09C 27A50010 */   addiu     $a1, $sp, 0x10
/* 3CCA0 8003C0A0 00402821 */  addu       $a1, $v0, $zero
/* 3CCA4 8003C0A4 8CA30078 */  lw         $v1, 0x78($a1)
/* 3CCA8 8003C0A8 84640020 */  lh         $a0, 0x20($v1)
/* 3CCAC 8003C0AC 8C620024 */  lw         $v0, 0x24($v1)
/* 3CCB0 8003C0B0 0040F809 */  jalr       $v0
/* 3CCB4 8003C0B4 00A42021 */   addu      $a0, $a1, $a0
/* 3CCB8 8003C0B8 02602021 */  addu       $a0, $s3, $zero
/* 3CCBC 8003C0BC 264568A8 */  addiu      $a1, $s2, 0x68a8
/* 3CCC0 8003C0C0 8CA6204C */  lw         $a2, 0x204c($a1)
/* 3CCC4 8003C0C4 9663007C */  lhu        $v1, 0x7c($s3)
/* 3CCC8 8003C0C8 8CC50880 */  lw         $a1, 0x880($a2)
/* 3CCCC 8003C0CC 00621821 */  addu       $v1, $v1, $v0
/* 3CCD0 8003C0D0 0C00E7D5 */  jal        get_item_info_text
/* 3CCD4 8003C0D4 A663007C */   sh        $v1, 0x7c($s3)
/* 3CCD8 8003C0D8 92830015 */  lbu        $v1, 0x15($s4)
/* 3CCDC 8003C0DC 10600007 */  beqz       $v1, .L8003C0FC
/* 3CCE0 8003C0E0 00603021 */   addu      $a2, $v1, $zero
/* 3CCE4 8003C0E4 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CCE8 8003C0E8 3C05800E */  lui        $a1, %hi(D_800DBFF4)
/* 3CCEC 8003C0EC 0C0333AC */  jal        sprintf
/* 3CCF0 8003C0F0 24A5BFF4 */   addiu     $a1, $a1, %lo(D_800DBFF4)
/* 3CCF4 8003C0F4 0800F045 */  j          .L8003C114
/* 3CCF8 8003C0F8 02602021 */   addu      $a0, $s3, $zero
.L8003C0FC:
/* 3CCFC 8003C0FC 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CD00 8003C100 92860015 */  lbu        $a2, 0x15($s4)
/* 3CD04 8003C104 3C05800E */  lui        $a1, %hi(D_800DBFFC)
/* 3CD08 8003C108 0C0333AC */  jal        sprintf
/* 3CD0C 8003C10C 24A5BFFC */   addiu     $a1, $a1, %lo(D_800DBFFC)
/* 3CD10 8003C110 02602021 */  addu       $a0, $s3, $zero
.L8003C114:
/* 3CD14 8003C114 0C00E7FC */  jal        add_widgetcliptext
/* 3CD18 8003C118 27A50010 */   addiu     $a1, $sp, 0x10
/* 3CD1C 8003C11C 00402821 */  addu       $a1, $v0, $zero
/* 3CD20 8003C120 8CA30078 */  lw         $v1, 0x78($a1)
/* 3CD24 8003C124 84640020 */  lh         $a0, 0x20($v1)
/* 3CD28 8003C128 8C620024 */  lw         $v0, 0x24($v1)
/* 3CD2C 8003C12C 0040F809 */  jalr       $v0
/* 3CD30 8003C130 00A42021 */   addu      $a0, $a1, $a0
/* 3CD34 8003C134 02602021 */  addu       $a0, $s3, $zero
/* 3CD38 8003C138 9663007C */  lhu        $v1, 0x7c($s3)
/* 3CD3C 8003C13C 8E85000C */  lw         $a1, 0xc($s4)
/* 3CD40 8003C140 00621821 */  addu       $v1, $v1, $v0
/* 3CD44 8003C144 0C00ECD7 */  jal        item_stat_info
/* 3CD48 8003C148 A663007C */   sh        $v1, 0x7c($s3)
/* 3CD4C 8003C14C 8E850018 */  lw         $a1, 0x18($s4)
/* 3CD50 8003C150 0C00ED0D */  jal        item_skill_info
/* 3CD54 8003C154 02602021 */   addu      $a0, $s3, $zero
/* 3CD58 8003C158 8E85001C */  lw         $a1, 0x1c($s4)
/* 3CD5C 8003C15C 0C00ED37 */  jal        magic_info
/* 3CD60 8003C160 02602021 */   addu      $a0, $s3, $zero
/* 3CD64 8003C164 8E850010 */  lw         $a1, 0x10($s4)
/* 3CD68 8003C168 0C00ED6D */  jal        print_item_spell
/* 3CD6C 8003C16C 02602021 */   addu      $a0, $s3, $zero
/* 3CD70 8003C170 96820000 */  lhu        $v0, ($s4)
/* 3CD74 8003C174 2403000D */  addiu      $v1, $zero, 0xd
/* 3CD78 8003C178 00021202 */  srl        $v0, $v0, 8
/* 3CD7C 8003C17C 5443001E */  bnel       $v0, $v1, .L8003C1F8
/* 3CD80 8003C180 8E850020 */   lw        $a1, 0x20($s4)
/* 3CD84 8003C184 8E820010 */  lw         $v0, 0x10($s4)
/* 3CD88 8003C188 5040001B */  beql       $v0, $zero, .L8003C1F8
/* 3CD8C 8003C18C 8E850020 */   lw        $a1, 0x20($s4)
/* 3CD90 8003C190 90420004 */  lbu        $v0, 4($v0)
/* 3CD94 8003C194 10400017 */  beqz       $v0, .L8003C1F4
/* 3CD98 8003C198 264268A8 */   addiu     $v0, $s2, 0x68a8
/* 3CD9C 8003C19C 8C43204C */  lw         $v1, 0x204c($v0)
/* 3CDA0 8003C1A0 8C65089C */  lw         $a1, 0x89c($v1)
/* 3CDA4 8003C1A4 0C00E7D5 */  jal        get_item_info_text
/* 3CDA8 8003C1A8 02602021 */   addu      $a0, $s3, $zero
/* 3CDAC 8003C1AC 27A40010 */  addiu      $a0, $sp, 0x10
/* 3CDB0 8003C1B0 8E830010 */  lw         $v1, 0x10($s4)
/* 3CDB4 8003C1B4 3C05800E */  lui        $a1, %hi(D_800DC024)
/* 3CDB8 8003C1B8 90660004 */  lbu        $a2, 4($v1)
/* 3CDBC 8003C1BC 0C0333AC */  jal        sprintf
/* 3CDC0 8003C1C0 24A5C024 */   addiu     $a1, $a1, %lo(D_800DC024)
/* 3CDC4 8003C1C4 02602021 */  addu       $a0, $s3, $zero
/* 3CDC8 8003C1C8 0C00E7FC */  jal        add_widgetcliptext
/* 3CDCC 8003C1CC 27A50010 */   addiu     $a1, $sp, 0x10
/* 3CDD0 8003C1D0 00402821 */  addu       $a1, $v0, $zero
/* 3CDD4 8003C1D4 8CA30078 */  lw         $v1, 0x78($a1)
/* 3CDD8 8003C1D8 84640020 */  lh         $a0, 0x20($v1)
/* 3CDDC 8003C1DC 8C620024 */  lw         $v0, 0x24($v1)
/* 3CDE0 8003C1E0 0040F809 */  jalr       $v0
/* 3CDE4 8003C1E4 00A42021 */   addu      $a0, $a1, $a0
/* 3CDE8 8003C1E8 9663007C */  lhu        $v1, 0x7c($s3)
/* 3CDEC 8003C1EC 00621821 */  addu       $v1, $v1, $v0
/* 3CDF0 8003C1F0 A663007C */  sh         $v1, 0x7c($s3)
.L8003C1F4:
/* 3CDF4 8003C1F4 8E850020 */  lw         $a1, 0x20($s4)
.L8003C1F8:
/* 3CDF8 8003C1F8 0C00ED9A */  jal        print_item_resist
/* 3CDFC 8003C1FC 02602021 */   addu      $a0, $s3, $zero
/* 3CE00 8003C200 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 3CE04 8003C204 8C441600 */  lw         $a0, 0x1600($v0)
/* 3CE08 8003C208 0C02D0FD */  jal        font_func
/* 3CE0C 8003C20C 8E258D18 */   lw        $a1, -0x72e8($s1)
/* 3CE10 8003C210 02601021 */  addu       $v0, $s3, $zero
/* 3CE14 8003C214 8FBF0124 */  lw         $ra, 0x124($sp)
/* 3CE18 8003C218 8FB40120 */  lw         $s4, 0x120($sp)
/* 3CE1C 8003C21C 8FB3011C */  lw         $s3, 0x11c($sp)
/* 3CE20 8003C220 8FB20118 */  lw         $s2, 0x118($sp)
/* 3CE24 8003C224 8FB10114 */  lw         $s1, 0x114($sp)
/* 3CE28 8003C228 8FB00110 */  lw         $s0, 0x110($sp)
/* 3CE2C 8003C22C 03E00008 */  jr         $ra
/* 3CE30 8003C230 27BD0128 */   addiu     $sp, $sp, 0x128

glabel func_8003C234
/* 3CE34 8003C234 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 3CE38 8003C238 AFB70034 */  sw         $s7, 0x34($sp)
/* 3CE3C 8003C23C 0080B821 */  addu       $s7, $a0, $zero
/* 3CE40 8003C240 AFB20020 */  sw         $s2, 0x20($sp)
/* 3CE44 8003C244 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3CE48 8003C248 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 3CE4C 8003C24C AFB5002C */  sw         $s5, 0x2c($sp)
/* 3CE50 8003C250 00A0A821 */  addu       $s5, $a1, $zero
/* 3CE54 8003C254 AFB60030 */  sw         $s6, 0x30($sp)
/* 3CE58 8003C258 3C16800F */  lui        $s6, %hi(font_face)
/* 3CE5C 8003C25C 26C28D18 */  addiu      $v0, $s6, %lo(font_face)
/* 3CE60 8003C260 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3CE64 8003C264 00068C00 */  sll        $s1, $a2, 0x10
/* 3CE68 8003C268 00118C03 */  sra        $s1, $s1, 0x10
/* 3CE6C 8003C26C AFB00018 */  sw         $s0, 0x18($sp)
/* 3CE70 8003C270 00078400 */  sll        $s0, $a3, 0x10
/* 3CE74 8003C274 00108403 */  sra        $s0, $s0, 0x10
/* 3CE78 8003C278 AFBF0038 */  sw         $ra, 0x38($sp)
/* 3CE7C 8003C27C AFB40028 */  sw         $s4, 0x28($sp)
/* 3CE80 8003C280 AFB30024 */  sw         $s3, 0x24($sp)
/* 3CE84 8003C284 8E441600 */  lw         $a0, 0x1600($s2)
/* 3CE88 8003C288 8C450008 */  lw         $a1, 8($v0)
/* 3CE8C 8003C28C 87B30052 */  lh         $s3, 0x52($sp)
/* 3CE90 8003C290 0C02D0FD */  jal        font_func
/* 3CE94 8003C294 87B40056 */   lh        $s4, 0x56($sp)
/* 3CE98 8003C298 02E02021 */  addu       $a0, $s7, $zero
/* 3CE9C 8003C29C 02A02821 */  addu       $a1, $s5, $zero
/* 3CEA0 8003C2A0 02203021 */  addu       $a2, $s1, $zero
/* 3CEA4 8003C2A4 02003821 */  addu       $a3, $s0, $zero
/* 3CEA8 8003C2A8 AFB30010 */  sw         $s3, 0x10($sp)
/* 3CEAC 8003C2AC 0C02DE14 */  jal        widget_func_8
/* 3CEB0 8003C2B0 AFB40014 */   sw        $s4, 0x14($sp)
/* 3CEB4 8003C2B4 8E441600 */  lw         $a0, 0x1600($s2)
/* 3CEB8 8003C2B8 8EC58D18 */  lw         $a1, -0x72e8($s6)
/* 3CEBC 8003C2BC 0C02D0FD */  jal        font_func
/* 3CEC0 8003C2C0 00408021 */   addu      $s0, $v0, $zero
/* 3CEC4 8003C2C4 02001021 */  addu       $v0, $s0, $zero
/* 3CEC8 8003C2C8 8FBF0038 */  lw         $ra, 0x38($sp)
/* 3CECC 8003C2CC 8FB70034 */  lw         $s7, 0x34($sp)
/* 3CED0 8003C2D0 8FB60030 */  lw         $s6, 0x30($sp)
/* 3CED4 8003C2D4 8FB5002C */  lw         $s5, 0x2c($sp)
/* 3CED8 8003C2D8 8FB40028 */  lw         $s4, 0x28($sp)
/* 3CEDC 8003C2DC 8FB30024 */  lw         $s3, 0x24($sp)
/* 3CEE0 8003C2E0 8FB20020 */  lw         $s2, 0x20($sp)
/* 3CEE4 8003C2E4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3CEE8 8003C2E8 8FB00018 */  lw         $s0, 0x18($sp)
/* 3CEEC 8003C2EC 03E00008 */  jr         $ra
/* 3CEF0 8003C2F0 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8003C2F4
/* 3CEF4 8003C2F4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3CEF8 8003C2F8 AFB20018 */  sw         $s2, 0x18($sp)
/* 3CEFC 8003C2FC 00809021 */  addu       $s2, $a0, $zero
/* 3CF00 8003C300 AFB00010 */  sw         $s0, 0x10($sp)
/* 3CF04 8003C304 3C10800E */  lui        $s0, %hi(gGlobals)
/* 3CF08 8003C308 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 3CF0C 8003C30C AFB10014 */  sw         $s1, 0x14($sp)
/* 3CF10 8003C310 3C11800F */  lui        $s1, %hi(font_face)
/* 3CF14 8003C314 26228D18 */  addiu      $v0, $s1, %lo(font_face)
/* 3CF18 8003C318 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3CF1C 8003C31C 8E041600 */  lw         $a0, 0x1600($s0)
/* 3CF20 8003C320 0C02D0FD */  jal        font_func
/* 3CF24 8003C324 8C450008 */   lw        $a1, 8($v0)
/* 3CF28 8003C328 0C02DE51 */  jal        func_800B7944
/* 3CF2C 8003C32C 02402021 */   addu      $a0, $s2, $zero
/* 3CF30 8003C330 8E041600 */  lw         $a0, 0x1600($s0)
/* 3CF34 8003C334 8E258D18 */  lw         $a1, -0x72e8($s1)
/* 3CF38 8003C338 0C02D0FD */  jal        font_func
/* 3CF3C 8003C33C 00408021 */   addu      $s0, $v0, $zero
/* 3CF40 8003C340 02001021 */  addu       $v0, $s0, $zero
/* 3CF44 8003C344 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3CF48 8003C348 8FB20018 */  lw         $s2, 0x18($sp)
/* 3CF4C 8003C34C 8FB10014 */  lw         $s1, 0x14($sp)
/* 3CF50 8003C350 8FB00010 */  lw         $s0, 0x10($sp)
/* 3CF54 8003C354 03E00008 */  jr         $ra
/* 3CF58 8003C358 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003C35C
/* 3CF5C 8003C35C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3CF60 8003C360 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3CF64 8003C364 AFB00018 */  sw         $s0, 0x18($sp)
/* 3CF68 8003C368 8CA2000C */  lw         $v0, 0xc($a1)
/* 3CF6C 8003C36C 30420004 */  andi       $v0, $v0, 4
/* 3CF70 8003C370 1440000C */  bnez       $v0, .L8003C3A4
/* 3CF74 8003C374 00808021 */   addu      $s0, $a0, $zero
/* 3CF78 8003C378 2402003C */  addiu      $v0, $zero, 0x3c
/* 3CF7C 8003C37C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 3CF80 8003C380 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 3CF84 8003C384 2405074E */  addiu      $a1, $zero, 0x74e
/* 3CF88 8003C388 3C073F80 */  lui        $a3, 0x3f80
/* 3CF8C 8003C38C 00003021 */  addu       $a2, $zero, $zero
/* 3CF90 8003C390 AFA20010 */  sw         $v0, 0x10($sp)
/* 3CF94 8003C394 0C0156F4 */  jal        play_SFX
/* 3CF98 8003C398 AFA00014 */   sw        $zero, 0x14($sp)
/* 3CF9C 8003C39C 24030005 */  addiu      $v1, $zero, 5
/* 3CFA0 8003C3A0 A2030070 */  sb         $v1, 0x70($s0)
.L8003C3A4:
/* 3CFA4 8003C3A4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3CFA8 8003C3A8 8FB00018 */  lw         $s0, 0x18($sp)
/* 3CFAC 8003C3AC 00001021 */  addu       $v0, $zero, $zero
/* 3CFB0 8003C3B0 03E00008 */  jr         $ra
/* 3CFB4 8003C3B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003C3B8
/* 3CFB8 8003C3B8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3CFBC 8003C3BC AFBF0010 */  sw         $ra, 0x10($sp)
/* 3CFC0 8003C3C0 0C02E66C */  jal        widget_menu_free
/* 3CFC4 8003C3C4 00000000 */   nop
/* 3CFC8 8003C3C8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3CFCC 8003C3CC 03E00008 */  jr         $ra
/* 3CFD0 8003C3D0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret12_8003c3d4
/* 3CFD4 8003C3D4 03E00008 */  jr         $ra
/* 3CFD8 8003C3D8 2402000C */   addiu     $v0, $zero, 0xc
/* 3CFDC 8003C3DC 00000000 */  nop
