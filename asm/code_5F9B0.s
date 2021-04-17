.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8005EDB0
/* 5F9B0 8005EDB0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F9B4 8005EDB4 AFB00010 */  sw         $s0, 0x10($sp)
/* 5F9B8 8005EDB8 00A08021 */  addu       $s0, $a1, $zero
/* 5F9BC 8005EDBC AFBF0014 */  sw         $ra, 0x14($sp)
/* 5F9C0 8005EDC0 8E050040 */  lw         $a1, 0x40($s0)
/* 5F9C4 8005EDC4 8CA30078 */  lw         $v1, 0x78($a1)
/* 5F9C8 8005EDC8 84640080 */  lh         $a0, 0x80($v1)
/* 5F9CC 8005EDCC 8C620084 */  lw         $v0, 0x84($v1)
/* 5F9D0 8005EDD0 0040F809 */  jalr       $v0
/* 5F9D4 8005EDD4 00A42021 */   addu      $a0, $a1, $a0
/* 5F9D8 8005EDD8 02002021 */  addu       $a0, $s0, $zero
/* 5F9DC 8005EDDC 0C02DEC8 */  jal        set_widgets_byte0x70
/* 5F9E0 8005EDE0 24050005 */   addiu     $a1, $zero, 5
/* 5F9E4 8005EDE4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5F9E8 8005EDE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F9EC 8005EDEC 00001021 */  addu       $v0, $zero, $zero
/* 5F9F0 8005EDF0 03E00008 */  jr         $ra
/* 5F9F4 8005EDF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_left_side_menu_skill
/* 5F9F8 8005EDF8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5F9FC 8005EDFC AFB00010 */  sw         $s0, 0x10($sp)
/* 5FA00 8005EE00 00808021 */  addu       $s0, $a0, $zero
/* 5FA04 8005EE04 AFB10014 */  sw         $s1, 0x14($sp)
/* 5FA08 8005EE08 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5FA0C 8005EE0C 0C02E658 */  jal        widget_menu_build
/* 5FA10 8005EE10 00A08821 */   addu      $s1, $a1, $zero
/* 5FA14 8005EE14 02002021 */  addu       $a0, $s0, $zero
/* 5FA18 8005EE18 3C02800E */  lui        $v0, %hi(D_800DF340)
/* 5FA1C 8005EE1C 2442F340 */  addiu      $v0, $v0, %lo(D_800DF340)
/* 5FA20 8005EE20 AE020078 */  sw         $v0, 0x78($s0)
/* 5FA24 8005EE24 AE11007C */  sw         $s1, 0x7c($s0)
/* 5FA28 8005EE28 0C00EB79 */  jal        widget_left_side_of_pause_menu
/* 5FA2C 8005EE2C AE000080 */   sw        $zero, 0x80($s0)
/* 5FA30 8005EE30 02001021 */  addu       $v0, $s0, $zero
/* 5FA34 8005EE34 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5FA38 8005EE38 8FB10014 */  lw         $s1, 0x14($sp)
/* 5FA3C 8005EE3C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5FA40 8005EE40 03E00008 */  jr         $ra
/* 5FA44 8005EE44 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005EE48
/* 5FA48 8005EE48 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5FA4C 8005EE4C AFB20018 */  sw         $s2, 0x18($sp)
/* 5FA50 8005EE50 00809021 */  addu       $s2, $a0, $zero
/* 5FA54 8005EE54 AFB00010 */  sw         $s0, 0x10($sp)
/* 5FA58 8005EE58 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5FA5C 8005EE5C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 5FA60 8005EE60 AFB10014 */  sw         $s1, 0x14($sp)
/* 5FA64 8005EE64 3C11800F */  lui        $s1, %hi(font_face)
/* 5FA68 8005EE68 26228D18 */  addiu      $v0, $s1, %lo(font_face)
/* 5FA6C 8005EE6C AFBF001C */  sw         $ra, 0x1c($sp)
/* 5FA70 8005EE70 8E041600 */  lw         $a0, 0x1600($s0)
/* 5FA74 8005EE74 0C02D0FD */  jal        font_func
/* 5FA78 8005EE78 8C450008 */   lw        $a1, 8($v0)
/* 5FA7C 8005EE7C 0C02DE51 */  jal        func_800B7944
/* 5FA80 8005EE80 02402021 */   addu      $a0, $s2, $zero
/* 5FA84 8005EE84 8E041600 */  lw         $a0, 0x1600($s0)
/* 5FA88 8005EE88 8E258D18 */  lw         $a1, -0x72e8($s1)
/* 5FA8C 8005EE8C 0C02D0FD */  jal        font_func
/* 5FA90 8005EE90 00408021 */   addu      $s0, $v0, $zero
/* 5FA94 8005EE94 02001021 */  addu       $v0, $s0, $zero
/* 5FA98 8005EE98 8FBF001C */  lw         $ra, 0x1c($sp)
/* 5FA9C 8005EE9C 8FB20018 */  lw         $s2, 0x18($sp)
/* 5FAA0 8005EEA0 8FB10014 */  lw         $s1, 0x14($sp)
/* 5FAA4 8005EEA4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5FAA8 8005EEA8 03E00008 */  jr         $ra
/* 5FAAC 8005EEAC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005EEB0
/* 5FAB0 8005EEB0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 5FAB4 8005EEB4 AFB70034 */  sw         $s7, 0x34($sp)
/* 5FAB8 8005EEB8 0080B821 */  addu       $s7, $a0, $zero
/* 5FABC 8005EEBC AFB20020 */  sw         $s2, 0x20($sp)
/* 5FAC0 8005EEC0 3C12800E */  lui        $s2, %hi(gGlobals)
/* 5FAC4 8005EEC4 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 5FAC8 8005EEC8 AFB5002C */  sw         $s5, 0x2c($sp)
/* 5FACC 8005EECC 00A0A821 */  addu       $s5, $a1, $zero
/* 5FAD0 8005EED0 AFB60030 */  sw         $s6, 0x30($sp)
/* 5FAD4 8005EED4 3C16800F */  lui        $s6, %hi(font_face)
/* 5FAD8 8005EED8 26C28D18 */  addiu      $v0, $s6, %lo(font_face)
/* 5FADC 8005EEDC AFB1001C */  sw         $s1, 0x1c($sp)
/* 5FAE0 8005EEE0 00068C00 */  sll        $s1, $a2, 0x10
/* 5FAE4 8005EEE4 00118C03 */  sra        $s1, $s1, 0x10
/* 5FAE8 8005EEE8 AFB00018 */  sw         $s0, 0x18($sp)
/* 5FAEC 8005EEEC 00078400 */  sll        $s0, $a3, 0x10
/* 5FAF0 8005EEF0 00108403 */  sra        $s0, $s0, 0x10
/* 5FAF4 8005EEF4 AFBF0038 */  sw         $ra, 0x38($sp)
/* 5FAF8 8005EEF8 AFB40028 */  sw         $s4, 0x28($sp)
/* 5FAFC 8005EEFC AFB30024 */  sw         $s3, 0x24($sp)
/* 5FB00 8005EF00 8E441600 */  lw         $a0, 0x1600($s2)
/* 5FB04 8005EF04 8C450008 */  lw         $a1, 8($v0)
/* 5FB08 8005EF08 87B30052 */  lh         $s3, 0x52($sp)
/* 5FB0C 8005EF0C 0C02D0FD */  jal        font_func
/* 5FB10 8005EF10 87B40056 */   lh        $s4, 0x56($sp)
/* 5FB14 8005EF14 02E02021 */  addu       $a0, $s7, $zero
/* 5FB18 8005EF18 02A02821 */  addu       $a1, $s5, $zero
/* 5FB1C 8005EF1C 02203021 */  addu       $a2, $s1, $zero
/* 5FB20 8005EF20 02003821 */  addu       $a3, $s0, $zero
/* 5FB24 8005EF24 AFB30010 */  sw         $s3, 0x10($sp)
/* 5FB28 8005EF28 0C02DE14 */  jal        widget_func_8
/* 5FB2C 8005EF2C AFB40014 */   sw        $s4, 0x14($sp)
/* 5FB30 8005EF30 8E441600 */  lw         $a0, 0x1600($s2)
/* 5FB34 8005EF34 8EC58D18 */  lw         $a1, -0x72e8($s6)
/* 5FB38 8005EF38 0C02D0FD */  jal        font_func
/* 5FB3C 8005EF3C 00408021 */   addu      $s0, $v0, $zero
/* 5FB40 8005EF40 02001021 */  addu       $v0, $s0, $zero
/* 5FB44 8005EF44 8FBF0038 */  lw         $ra, 0x38($sp)
/* 5FB48 8005EF48 8FB70034 */  lw         $s7, 0x34($sp)
/* 5FB4C 8005EF4C 8FB60030 */  lw         $s6, 0x30($sp)
/* 5FB50 8005EF50 8FB5002C */  lw         $s5, 0x2c($sp)
/* 5FB54 8005EF54 8FB40028 */  lw         $s4, 0x28($sp)
/* 5FB58 8005EF58 8FB30024 */  lw         $s3, 0x24($sp)
/* 5FB5C 8005EF5C 8FB20020 */  lw         $s2, 0x20($sp)
/* 5FB60 8005EF60 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5FB64 8005EF64 8FB00018 */  lw         $s0, 0x18($sp)
/* 5FB68 8005EF68 03E00008 */  jr         $ra
/* 5FB6C 8005EF6C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel close_menu
/* 5FB70 8005EF70 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5FB74 8005EF74 AFB00018 */  sw         $s0, 0x18($sp)
/* 5FB78 8005EF78 00808021 */  addu       $s0, $a0, $zero
/* 5FB7C 8005EF7C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 5FB80 8005EF80 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 5FB84 8005EF84 2405074E */  addiu      $a1, $zero, 0x74e
/* 5FB88 8005EF88 2402003C */  addiu      $v0, $zero, 0x3c
/* 5FB8C 8005EF8C 3C073F80 */  lui        $a3, 0x3f80
/* 5FB90 8005EF90 00003021 */  addu       $a2, $zero, $zero
/* 5FB94 8005EF94 AFBF001C */  sw         $ra, 0x1c($sp)
/* 5FB98 8005EF98 AFA20010 */  sw         $v0, 0x10($sp)
/* 5FB9C 8005EF9C 0C0156F4 */  jal        play_SFX
/* 5FBA0 8005EFA0 AFA00014 */   sw        $zero, 0x14($sp)
/* 5FBA4 8005EFA4 02002021 */  addu       $a0, $s0, $zero
/* 5FBA8 8005EFA8 0C02DEC8 */  jal        set_widgets_byte0x70
/* 5FBAC 8005EFAC 24050005 */   addiu     $a1, $zero, 5
/* 5FBB0 8005EFB0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 5FBB4 8005EFB4 8FB00018 */  lw         $s0, 0x18($sp)
/* 5FBB8 8005EFB8 00001021 */  addu       $v0, $zero, $zero
/* 5FBBC 8005EFBC 03E00008 */  jr         $ra
/* 5FBC0 8005EFC0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005EFC4
/* 5FBC4 8005EFC4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5FBC8 8005EFC8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5FBCC 8005EFCC 8C850080 */  lw         $a1, 0x80($a0)
/* 5FBD0 8005EFD0 10A00007 */  beqz       $a1, .L8005EFF0
/* 5FBD4 8005EFD4 8FBF0010 */   lw        $ra, 0x10($sp)
/* 5FBD8 8005EFD8 8CA30078 */  lw         $v1, 0x78($a1)
/* 5FBDC 8005EFDC 84640058 */  lh         $a0, 0x58($v1)
/* 5FBE0 8005EFE0 8C62005C */  lw         $v0, 0x5c($v1)
/* 5FBE4 8005EFE4 0040F809 */  jalr       $v0
/* 5FBE8 8005EFE8 00A42021 */   addu      $a0, $a1, $a0
/* 5FBEC 8005EFEC 8FBF0010 */  lw         $ra, 0x10($sp)
.L8005EFF0:
/* 5FBF0 8005EFF0 00001021 */  addu       $v0, $zero, $zero
/* 5FBF4 8005EFF4 03E00008 */  jr         $ra
/* 5FBF8 8005EFF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005EFFC
/* 5FBFC 8005EFFC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5FC00 8005F000 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5FC04 8005F004 8C850080 */  lw         $a1, 0x80($a0)
/* 5FC08 8005F008 10A00007 */  beqz       $a1, .L8005F028
/* 5FC0C 8005F00C 8FBF0010 */   lw        $ra, 0x10($sp)
/* 5FC10 8005F010 8CA30078 */  lw         $v1, 0x78($a1)
/* 5FC14 8005F014 84640060 */  lh         $a0, 0x60($v1)
/* 5FC18 8005F018 8C620064 */  lw         $v0, 0x64($v1)
/* 5FC1C 8005F01C 0040F809 */  jalr       $v0
/* 5FC20 8005F020 00A42021 */   addu      $a0, $a1, $a0
/* 5FC24 8005F024 8FBF0010 */  lw         $ra, 0x10($sp)
.L8005F028:
/* 5FC28 8005F028 00001021 */  addu       $v0, $zero, $zero
/* 5FC2C 8005F02C 03E00008 */  jr         $ra
/* 5FC30 8005F030 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005F034
/* 5FC34 8005F034 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 5FC38 8005F038 AFB40040 */  sw         $s4, 0x40($sp)
/* 5FC3C 8005F03C 0080A021 */  addu       $s4, $a0, $zero
/* 5FC40 8005F040 AFB00030 */  sw         $s0, 0x30($sp)
/* 5FC44 8005F044 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5FC48 8005F048 AFB20038 */  sw         $s2, 0x38($sp)
/* 5FC4C 8005F04C 261268A8 */  addiu      $s2, $s0, %lo(gGlobals)
/* 5FC50 8005F050 AFB10034 */  sw         $s1, 0x34($sp)
/* 5FC54 8005F054 00A08821 */  addu       $s1, $a1, $zero
/* 5FC58 8005F058 AFBF0044 */  sw         $ra, 0x44($sp)
/* 5FC5C 8005F05C AFB3003C */  sw         $s3, 0x3c($sp)
/* 5FC60 8005F060 0C02D443 */  jal        func_800B510C
/* 5FC64 8005F064 8E441600 */   lw        $a0, 0x1600($s2)
/* 5FC68 8005F068 28420097 */  slti       $v0, $v0, 0x97
/* 5FC6C 8005F06C 10400006 */  beqz       $v0, .L8005F088
/* 5FC70 8005F070 02009821 */   addu      $s3, $s0, $zero
/* 5FC74 8005F074 8E441600 */  lw         $a0, 0x1600($s2)
/* 5FC78 8005F078 0C02D443 */  jal        func_800B510C
/* 5FC7C 8005F07C 02202821 */   addu      $a1, $s1, $zero
/* 5FC80 8005F080 08017C23 */  j          .L8005F08C
/* 5FC84 8005F084 3050FFFF */   andi      $s0, $v0, 0xffff
.L8005F088:
/* 5FC88 8005F088 24100096 */  addiu      $s0, $zero, 0x96
.L8005F08C:
/* 5FC8C 8005F08C 02202821 */  addu       $a1, $s1, $zero
/* 5FC90 8005F090 00003021 */  addu       $a2, $zero, $zero
/* 5FC94 8005F094 267268A8 */  addiu      $s2, $s3, 0x68a8
/* 5FC98 8005F098 8E441600 */  lw         $a0, 0x1600($s2)
/* 5FC9C 8005F09C 0C02D4A4 */  jal        func_800B5290
/* 5FCA0 8005F0A0 02003821 */   addu      $a3, $s0, $zero
/* 5FCA4 8005F0A4 02202021 */  addu       $a0, $s1, $zero
/* 5FCA8 8005F0A8 26050010 */  addiu      $a1, $s0, 0x10
/* 5FCAC 8005F0AC 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 5FCB0 8005F0B0 2442000A */  addiu      $v0, $v0, 0xa
/* 5FCB4 8005F0B4 3046FFFF */  andi       $a2, $v0, 0xffff
/* 5FCB8 8005F0B8 240700E1 */  addiu      $a3, $zero, 0xe1
/* 5FCBC 8005F0BC 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5FCC0 8005F0C0 240300FF */  addiu      $v1, $zero, 0xff
/* 5FCC4 8005F0C4 AFA20010 */  sw         $v0, 0x10($sp)
/* 5FCC8 8005F0C8 AFA20014 */  sw         $v0, 0x14($sp)
/* 5FCCC 8005F0CC 24020001 */  addiu      $v0, $zero, 1
/* 5FCD0 8005F0D0 AFA30018 */  sw         $v1, 0x18($sp)
/* 5FCD4 8005F0D4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5FCD8 8005F0D8 AFA00020 */  sw         $zero, 0x20($sp)
/* 5FCDC 8005F0DC AFA00024 */  sw         $zero, 0x24($sp)
/* 5FCE0 8005F0E0 AFA30028 */  sw         $v1, 0x28($sp)
/* 5FCE4 8005F0E4 0C013174 */  jal        another_textbox_func
/* 5FCE8 8005F0E8 AFA2002C */   sw        $v0, 0x2c($sp)
/* 5FCEC 8005F0EC 8E4414CC */  lw         $a0, 0x14cc($s2)
/* 5FCF0 8005F0F0 3C038006 */  lui        $v1, %hi(func_8005EDB0)
/* 5FCF4 8005F0F4 AC540040 */  sw         $s4, 0x40($v0)
/* 5FCF8 8005F0F8 8C840040 */  lw         $a0, 0x40($a0)
/* 5FCFC 8005F0FC 2463EDB0 */  addiu      $v1, $v1, %lo(func_8005EDB0)
/* 5FD00 8005F100 AC430018 */  sw         $v1, 0x18($v0)
/* 5FD04 8005F104 1080001C */  beqz       $a0, .L8005F178
/* 5FD08 8005F108 AC43001C */   sw        $v1, 0x1c($v0)
/* 5FD0C 8005F10C 8C900004 */  lw         $s0, 4($a0)
/* 5FD10 8005F110 1200001A */  beqz       $s0, .L8005F17C
/* 5FD14 8005F114 8FBF0044 */   lw        $ra, 0x44($sp)
/* 5FD18 8005F118 8E040080 */  lw         $a0, 0x80($s0)
/* 5FD1C 8005F11C 50800008 */  beql       $a0, $zero, .L8005F140
/* 5FD20 8005F120 8E100088 */   lw        $s0, 0x88($s0)
/* 5FD24 8005F124 8E82007C */  lw         $v0, 0x7c($s4)
/* 5FD28 8005F128 8E4315F8 */  lw         $v1, 0x15f8($s2)
/* 5FD2C 8005F12C 00021080 */  sll        $v0, $v0, 2
/* 5FD30 8005F130 00621821 */  addu       $v1, $v1, $v0
/* 5FD34 8005F134 0C010DA7 */  jal        func_8004369C
/* 5FD38 8005F138 8C650000 */   lw        $a1, ($v1)
/* 5FD3C 8005F13C 8E100088 */  lw         $s0, 0x88($s0)
.L8005F140:
/* 5FD40 8005F140 1200000E */  beqz       $s0, .L8005F17C
/* 5FD44 8005F144 8FBF0044 */   lw        $ra, 0x44($sp)
/* 5FD48 8005F148 8E050094 */  lw         $a1, 0x94($s0)
/* 5FD4C 8005F14C 8CA20078 */  lw         $v0, 0x78($a1)
/* 5FD50 8005F150 844400C8 */  lh         $a0, 0xc8($v0)
/* 5FD54 8005F154 8C4300CC */  lw         $v1, 0xcc($v0)
/* 5FD58 8005F158 0060F809 */  jalr       $v1
/* 5FD5C 8005F15C 00A42021 */   addu      $a0, $a1, $a0
/* 5FD60 8005F160 8E0500A0 */  lw         $a1, 0xa0($s0)
/* 5FD64 8005F164 8CA20078 */  lw         $v0, 0x78($a1)
/* 5FD68 8005F168 844400C8 */  lh         $a0, 0xc8($v0)
/* 5FD6C 8005F16C 8C4300CC */  lw         $v1, 0xcc($v0)
/* 5FD70 8005F170 0060F809 */  jalr       $v1
/* 5FD74 8005F174 00A42021 */   addu      $a0, $a1, $a0
.L8005F178:
/* 5FD78 8005F178 8FBF0044 */  lw         $ra, 0x44($sp)
.L8005F17C:
/* 5FD7C 8005F17C 8FB40040 */  lw         $s4, 0x40($sp)
/* 5FD80 8005F180 8FB3003C */  lw         $s3, 0x3c($sp)
/* 5FD84 8005F184 8FB20038 */  lw         $s2, 0x38($sp)
/* 5FD88 8005F188 8FB10034 */  lw         $s1, 0x34($sp)
/* 5FD8C 8005F18C 8FB00030 */  lw         $s0, 0x30($sp)
/* 5FD90 8005F190 03E00008 */  jr         $ra
/* 5FD94 8005F194 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_8005F198
/* 5FD98 8005F198 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5FD9C 8005F19C AFBF0010 */  sw         $ra, 0x10($sp)
/* 5FDA0 8005F1A0 0C02E66C */  jal        widget_menu_free
/* 5FDA4 8005F1A4 00000000 */   nop
/* 5FDA8 8005F1A8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5FDAC 8005F1AC 03E00008 */  jr         $ra
/* 5FDB0 8005F1B0 27BD0018 */   addiu     $sp, $sp, 0x18
/* 5FDB4 8005F1B4 00000000 */  nop
/* 5FDB8 8005F1B8 00000000 */  nop
/* 5FDBC 8005F1BC 00000000 */  nop
