.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel build_camera_debug
/* 5AA10 80059E10 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5AA14 80059E14 AFB10014 */  sw         $s1, 0x14($sp)
/* 5AA18 80059E18 3C11800F */  lui        $s1, %hi(camera_debug_pointer)
/* 5AA1C 80059E1C 8E22E9C0 */  lw         $v0, %lo(camera_debug_pointer)($s1)
/* 5AA20 80059E20 AFB00010 */  sw         $s0, 0x10($sp)
/* 5AA24 80059E24 3090FFFF */  andi       $s0, $a0, 0xffff
/* 5AA28 80059E28 14400007 */  bnez       $v0, .L80059E48
/* 5AA2C 80059E2C AFBF0018 */   sw        $ra, 0x18($sp)
/* 5AA30 80059E30 0C026259 */  jal        passToMalloc
/* 5AA34 80059E34 240400D8 */   addiu     $a0, $zero, 0xd8
/* 5AA38 80059E38 00402021 */  addu       $a0, $v0, $zero
/* 5AA3C 80059E3C 0C0167AA */  jal        camera_debug_menu
/* 5AA40 80059E40 02002821 */   addu      $a1, $s0, $zero
/* 5AA44 80059E44 AE22E9C0 */  sw         $v0, -0x1640($s1)
.L80059E48:
/* 5AA48 80059E48 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5AA4C 80059E4C 8FB10014 */  lw         $s1, 0x14($sp)
/* 5AA50 80059E50 8FB00010 */  lw         $s0, 0x10($sp)
/* 5AA54 80059E54 03E00008 */  jr         $ra
/* 5AA58 80059E58 27BD0020 */   addiu     $sp, $sp, 0x20

glabel camera_debug_clear
/* 5AA5C 80059E5C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5AA60 80059E60 00801821 */  addu       $v1, $a0, $zero
/* 5AA64 80059E64 10600007 */  beqz       $v1, .L80059E84
/* 5AA68 80059E68 AFBF0010 */   sw        $ra, 0x10($sp)
/* 5AA6C 80059E6C 8C620078 */  lw         $v0, 0x78($v1)
/* 5AA70 80059E70 84440008 */  lh         $a0, 8($v0)
/* 5AA74 80059E74 00642021 */  addu       $a0, $v1, $a0
/* 5AA78 80059E78 8C43000C */  lw         $v1, 0xc($v0)
/* 5AA7C 80059E7C 0060F809 */  jalr       $v1
/* 5AA80 80059E80 24050003 */   addiu     $a1, $zero, 3
.L80059E84:
/* 5AA84 80059E84 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 5AA88 80059E88 3C038006 */  lui        $v1, %hi(run_dialougemode_funcs2)
/* 5AA8C 80059E8C 246381A8 */  addiu      $v1, $v1, %lo(run_dialougemode_funcs2)
/* 5AA90 80059E90 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5AA94 80059E94 3C04800F */  lui        $a0, %hi(camera_debug_pointer)
/* 5AA98 80059E98 AC43D500 */  sw         $v1, %lo(freeWidgetFunc)($v0)
/* 5AA9C 80059E9C AC80E9C0 */  sw         $zero, %lo(camera_debug_pointer)($a0)
/* 5AAA0 80059EA0 03E00008 */  jr         $ra
/* 5AAA4 80059EA4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel camera_debug_menu
/* 5AAA8 80059EA8 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 5AAAC 80059EAC AFB1003C */  sw         $s1, 0x3c($sp)
/* 5AAB0 80059EB0 00808821 */  addu       $s1, $a0, $zero
/* 5AAB4 80059EB4 AFB00038 */  sw         $s0, 0x38($sp)
/* 5AAB8 80059EB8 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 5AABC 80059EBC AFBF005C */  sw         $ra, 0x5c($sp)
/* 5AAC0 80059EC0 AFBE0058 */  sw         $fp, 0x58($sp)
/* 5AAC4 80059EC4 AFB70054 */  sw         $s7, 0x54($sp)
/* 5AAC8 80059EC8 AFB60050 */  sw         $s6, 0x50($sp)
/* 5AACC 80059ECC AFB5004C */  sw         $s5, 0x4c($sp)
/* 5AAD0 80059ED0 AFB40048 */  sw         $s4, 0x48($sp)
/* 5AAD4 80059ED4 AFB30044 */  sw         $s3, 0x44($sp)
/* 5AAD8 80059ED8 0C02E658 */  jal        widget_menu_build
/* 5AADC 80059EDC AFB20040 */   sw        $s2, 0x40($sp)
/* 5AAE0 80059EE0 02202021 */  addu       $a0, $s1, $zero
/* 5AAE4 80059EE4 24050028 */  addiu      $a1, $zero, 0x28
/* 5AAE8 80059EE8 2406000A */  addiu      $a2, $zero, 0xa
/* 5AAEC 80059EEC 240700C8 */  addiu      $a3, $zero, 0xc8
/* 5AAF0 80059EF0 3C02800E */  lui        $v0, %hi(widget_mathods_cameraDebug)
/* 5AAF4 80059EF4 2442ED98 */  addiu      $v0, $v0, %lo(widget_mathods_cameraDebug)
/* 5AAF8 80059EF8 AE220078 */  sw         $v0, 0x78($s1)
/* 5AAFC 80059EFC 240200C8 */  addiu      $v0, $zero, 0xc8
/* 5AB00 80059F00 A6300080 */  sh         $s0, 0x80($s1)
/* 5AB04 80059F04 241000FF */  addiu      $s0, $zero, 0xff
/* 5AB08 80059F08 AFA20010 */  sw         $v0, 0x10($sp)
/* 5AB0C 80059F0C AFA00014 */  sw         $zero, 0x14($sp)
/* 5AB10 80059F10 AFA00018 */  sw         $zero, 0x18($sp)
/* 5AB14 80059F14 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5AB18 80059F18 0C02F27C */  jal        func_800BC9F0
/* 5AB1C 80059F1C AFB00020 */   sw        $s0, 0x20($sp)
/* 5AB20 80059F20 00402021 */  addu       $a0, $v0, $zero
/* 5AB24 80059F24 2405000E */  addiu      $a1, $zero, 0xe
/* 5AB28 80059F28 24060032 */  addiu      $a2, $zero, 0x32
/* 5AB2C 80059F2C 24070014 */  addiu      $a3, $zero, 0x14
/* 5AB30 80059F30 24020032 */  addiu      $v0, $zero, 0x32
/* 5AB34 80059F34 24030014 */  addiu      $v1, $zero, 0x14
/* 5AB38 80059F38 AFA20010 */  sw         $v0, 0x10($sp)
/* 5AB3C 80059F3C 2402012C */  addiu      $v0, $zero, 0x12c
/* 5AB40 80059F40 AFA30014 */  sw         $v1, 0x14($sp)
/* 5AB44 80059F44 240300DC */  addiu      $v1, $zero, 0xdc
/* 5AB48 80059F48 AFA20018 */  sw         $v0, 0x18($sp)
/* 5AB4C 80059F4C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5AB50 80059F50 AFA3001C */  sw         $v1, 0x1c($sp)
/* 5AB54 80059F54 AFA20020 */  sw         $v0, 0x20($sp)
/* 5AB58 80059F58 AFA20024 */  sw         $v0, 0x24($sp)
/* 5AB5C 80059F5C AFA20028 */  sw         $v0, 0x28($sp)
/* 5AB60 80059F60 AFB0002C */  sw         $s0, 0x2c($sp)
/* 5AB64 80059F64 0C02F435 */  jal        widgetscrollmenu_init_2
/* 5AB68 80059F68 AFA00030 */   sw        $zero, 0x30($sp)
/* 5AB6C 80059F6C 24160004 */  addiu      $s6, $zero, 4
/* 5AB70 80059F70 24130001 */  addiu      $s3, $zero, 1
/* 5AB74 80059F74 3C14800E */  lui        $s4, %hi(gGlobals)
/* 5AB78 80059F78 269468A8 */  addiu      $s4, $s4, %lo(gGlobals)
/* 5AB7C 80059F7C A2360084 */  sb         $s6, 0x84($s1)
/* 5AB80 80059F80 A2330085 */  sb         $s3, 0x85($s1)
/* 5AB84 80059F84 A2200086 */  sb         $zero, 0x86($s1)
/* 5AB88 80059F88 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AB8C 80059F8C 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AB90 80059F90 AE22007C */  sw         $v0, 0x7c($s1)
/* 5AB94 80059F94 24020086 */  addiu      $v0, $zero, 0x86
/* 5AB98 80059F98 A6220082 */  sh         $v0, 0x82($s1)
/* 5AB9C 80059F9C 0C026259 */  jal        passToMalloc
/* 5ABA0 80059FA0 8C720218 */   lw        $s2, 0x218($v1)
/* 5ABA4 80059FA4 00408021 */  addu       $s0, $v0, $zero
/* 5ABA8 80059FA8 0C03353E */  jal        strlen
/* 5ABAC 80059FAC 26440001 */   addiu     $a0, $s2, 1
/* 5ABB0 80059FB0 02002021 */  addu       $a0, $s0, $zero
/* 5ABB4 80059FB4 02402821 */  addu       $a1, $s2, $zero
/* 5ABB8 80059FB8 0C02E3A0 */  jal        widgettext_func_2
/* 5ABBC 80059FBC 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5ABC0 80059FC0 8E24007C */  lw         $a0, 0x7c($s1)
/* 5ABC4 80059FC4 00402821 */  addu       $a1, $v0, $zero
/* 5ABC8 80059FC8 0C02E885 */  jal        link_widget_text
/* 5ABCC 80059FCC A440005E */   sh        $zero, 0x5e($v0)
/* 5ABD0 80059FD0 24030087 */  addiu      $v1, $zero, 0x87
/* 5ABD4 80059FD4 2404000C */  addiu      $a0, $zero, 0xc
/* 5ABD8 80059FD8 26220006 */  addiu      $v0, $s1, 6
/* 5ABDC 80059FDC A6230088 */  sh         $v1, 0x88($s1)
/* 5ABE0 80059FE0 A0440084 */  sb         $a0, 0x84($v0)
/* 5ABE4 80059FE4 A0530085 */  sb         $s3, 0x85($v0)
/* 5ABE8 80059FE8 A0400086 */  sb         $zero, 0x86($v0)
/* 5ABEC 80059FEC 8E83204C */  lw         $v1, 0x204c($s4)
/* 5ABF0 80059FF0 2404007C */  addiu      $a0, $zero, 0x7c
/* 5ABF4 80059FF4 0C026259 */  jal        passToMalloc
/* 5ABF8 80059FF8 8C72021C */   lw        $s2, 0x21c($v1)
/* 5ABFC 80059FFC 00408021 */  addu       $s0, $v0, $zero
/* 5AC00 8005A000 0C03353E */  jal        strlen
/* 5AC04 8005A004 26440001 */   addiu     $a0, $s2, 1
/* 5AC08 8005A008 02002021 */  addu       $a0, $s0, $zero
/* 5AC0C 8005A00C 02402821 */  addu       $a1, $s2, $zero
/* 5AC10 8005A010 0C02E3A0 */  jal        widgettext_func_2
/* 5AC14 8005A014 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AC18 8005A018 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AC1C 8005A01C 00402821 */  addu       $a1, $v0, $zero
/* 5AC20 8005A020 0C02E885 */  jal        link_widget_text
/* 5AC24 8005A024 A453005E */   sh        $s3, 0x5e($v0)
/* 5AC28 8005A028 24030088 */  addiu      $v1, $zero, 0x88
/* 5AC2C 8005A02C 24170008 */  addiu      $s7, $zero, 8
/* 5AC30 8005A030 2622000C */  addiu      $v0, $s1, 0xc
/* 5AC34 8005A034 A623008E */  sh         $v1, 0x8e($s1)
/* 5AC38 8005A038 A0570084 */  sb         $s7, 0x84($v0)
/* 5AC3C 8005A03C A0530085 */  sb         $s3, 0x85($v0)
/* 5AC40 8005A040 A0400086 */  sb         $zero, 0x86($v0)
/* 5AC44 8005A044 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AC48 8005A048 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AC4C 8005A04C 0C026259 */  jal        passToMalloc
/* 5AC50 8005A050 8C720220 */   lw        $s2, 0x220($v1)
/* 5AC54 8005A054 00408021 */  addu       $s0, $v0, $zero
/* 5AC58 8005A058 0C03353E */  jal        strlen
/* 5AC5C 8005A05C 26440001 */   addiu     $a0, $s2, 1
/* 5AC60 8005A060 02002021 */  addu       $a0, $s0, $zero
/* 5AC64 8005A064 02402821 */  addu       $a1, $s2, $zero
/* 5AC68 8005A068 0C02E3A0 */  jal        widgettext_func_2
/* 5AC6C 8005A06C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AC70 8005A070 00402821 */  addu       $a1, $v0, $zero
/* 5AC74 8005A074 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AC78 8005A078 24030002 */  addiu      $v1, $zero, 2
/* 5AC7C 8005A07C 0C02E885 */  jal        link_widget_text
/* 5AC80 8005A080 A443005E */   sh        $v1, 0x5e($v0)
/* 5AC84 8005A084 24030089 */  addiu      $v1, $zero, 0x89
/* 5AC88 8005A088 241E000A */  addiu      $fp, $zero, 0xa
/* 5AC8C 8005A08C 26220012 */  addiu      $v0, $s1, 0x12
/* 5AC90 8005A090 A6230094 */  sh         $v1, 0x94($s1)
/* 5AC94 8005A094 A05E0084 */  sb         $fp, 0x84($v0)
/* 5AC98 8005A098 A0530085 */  sb         $s3, 0x85($v0)
/* 5AC9C 8005A09C A0400086 */  sb         $zero, 0x86($v0)
/* 5ACA0 8005A0A0 8E83204C */  lw         $v1, 0x204c($s4)
/* 5ACA4 8005A0A4 2404007C */  addiu      $a0, $zero, 0x7c
/* 5ACA8 8005A0A8 0C026259 */  jal        passToMalloc
/* 5ACAC 8005A0AC 8C720224 */   lw        $s2, 0x224($v1)
/* 5ACB0 8005A0B0 00408021 */  addu       $s0, $v0, $zero
/* 5ACB4 8005A0B4 0C03353E */  jal        strlen
/* 5ACB8 8005A0B8 26440001 */   addiu     $a0, $s2, 1
/* 5ACBC 8005A0BC 02002021 */  addu       $a0, $s0, $zero
/* 5ACC0 8005A0C0 02402821 */  addu       $a1, $s2, $zero
/* 5ACC4 8005A0C4 0C02E3A0 */  jal        widgettext_func_2
/* 5ACC8 8005A0C8 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5ACCC 8005A0CC 00402821 */  addu       $a1, $v0, $zero
/* 5ACD0 8005A0D0 8E24007C */  lw         $a0, 0x7c($s1)
/* 5ACD4 8005A0D4 24030003 */  addiu      $v1, $zero, 3
/* 5ACD8 8005A0D8 0C02E885 */  jal        link_widget_text
/* 5ACDC 8005A0DC A443005E */   sh        $v1, 0x5e($v0)
/* 5ACE0 8005A0E0 2403008A */  addiu      $v1, $zero, 0x8a
/* 5ACE4 8005A0E4 24150006 */  addiu      $s5, $zero, 6
/* 5ACE8 8005A0E8 26220018 */  addiu      $v0, $s1, 0x18
/* 5ACEC 8005A0EC A623009A */  sh         $v1, 0x9a($s1)
/* 5ACF0 8005A0F0 A0550084 */  sb         $s5, 0x84($v0)
/* 5ACF4 8005A0F4 A0530085 */  sb         $s3, 0x85($v0)
/* 5ACF8 8005A0F8 A0400086 */  sb         $zero, 0x86($v0)
/* 5ACFC 8005A0FC 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AD00 8005A100 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AD04 8005A104 0C026259 */  jal        passToMalloc
/* 5AD08 8005A108 8C720228 */   lw        $s2, 0x228($v1)
/* 5AD0C 8005A10C 00408021 */  addu       $s0, $v0, $zero
/* 5AD10 8005A110 0C03353E */  jal        strlen
/* 5AD14 8005A114 26440001 */   addiu     $a0, $s2, 1
/* 5AD18 8005A118 02002021 */  addu       $a0, $s0, $zero
/* 5AD1C 8005A11C 02402821 */  addu       $a1, $s2, $zero
/* 5AD20 8005A120 0C02E3A0 */  jal        widgettext_func_2
/* 5AD24 8005A124 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AD28 8005A128 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AD2C 8005A12C 00402821 */  addu       $a1, $v0, $zero
/* 5AD30 8005A130 0C02E885 */  jal        link_widget_text
/* 5AD34 8005A134 A456005E */   sh        $s6, 0x5e($v0)
/* 5AD38 8005A138 24030090 */  addiu      $v1, $zero, 0x90
/* 5AD3C 8005A13C 24040011 */  addiu      $a0, $zero, 0x11
/* 5AD40 8005A140 2622001E */  addiu      $v0, $s1, 0x1e
/* 5AD44 8005A144 A62300A0 */  sh         $v1, 0xa0($s1)
/* 5AD48 8005A148 A0440084 */  sb         $a0, 0x84($v0)
/* 5AD4C 8005A14C A0530085 */  sb         $s3, 0x85($v0)
/* 5AD50 8005A150 A0400086 */  sb         $zero, 0x86($v0)
/* 5AD54 8005A154 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AD58 8005A158 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AD5C 8005A15C 0C026259 */  jal        passToMalloc
/* 5AD60 8005A160 8C720240 */   lw        $s2, 0x240($v1)
/* 5AD64 8005A164 00408021 */  addu       $s0, $v0, $zero
/* 5AD68 8005A168 0C03353E */  jal        strlen
/* 5AD6C 8005A16C 26440001 */   addiu     $a0, $s2, 1
/* 5AD70 8005A170 02002021 */  addu       $a0, $s0, $zero
/* 5AD74 8005A174 02402821 */  addu       $a1, $s2, $zero
/* 5AD78 8005A178 0C02E3A0 */  jal        widgettext_func_2
/* 5AD7C 8005A17C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AD80 8005A180 00402821 */  addu       $a1, $v0, $zero
/* 5AD84 8005A184 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AD88 8005A188 24100005 */  addiu      $s0, $zero, 5
/* 5AD8C 8005A18C 0C02E885 */  jal        link_widget_text
/* 5AD90 8005A190 A450005E */   sh        $s0, 0x5e($v0)
/* 5AD94 8005A194 2403008B */  addiu      $v1, $zero, 0x8b
/* 5AD98 8005A198 26220024 */  addiu      $v0, $s1, 0x24
/* 5AD9C 8005A19C A62300A6 */  sh         $v1, 0xa6($s1)
/* 5ADA0 8005A1A0 A0500084 */  sb         $s0, 0x84($v0)
/* 5ADA4 8005A1A4 A0530085 */  sb         $s3, 0x85($v0)
/* 5ADA8 8005A1A8 A0530086 */  sb         $s3, 0x86($v0)
/* 5ADAC 8005A1AC 8E83204C */  lw         $v1, 0x204c($s4)
/* 5ADB0 8005A1B0 2404007C */  addiu      $a0, $zero, 0x7c
/* 5ADB4 8005A1B4 0C026259 */  jal        passToMalloc
/* 5ADB8 8005A1B8 8C72022C */   lw        $s2, 0x22c($v1)
/* 5ADBC 8005A1BC 00408021 */  addu       $s0, $v0, $zero
/* 5ADC0 8005A1C0 0C03353E */  jal        strlen
/* 5ADC4 8005A1C4 26440001 */   addiu     $a0, $s2, 1
/* 5ADC8 8005A1C8 02002021 */  addu       $a0, $s0, $zero
/* 5ADCC 8005A1CC 02402821 */  addu       $a1, $s2, $zero
/* 5ADD0 8005A1D0 0C02E3A0 */  jal        widgettext_func_2
/* 5ADD4 8005A1D4 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5ADD8 8005A1D8 8E24007C */  lw         $a0, 0x7c($s1)
/* 5ADDC 8005A1DC 00402821 */  addu       $a1, $v0, $zero
/* 5ADE0 8005A1E0 0C02E885 */  jal        link_widget_text
/* 5ADE4 8005A1E4 A455005E */   sh        $s5, 0x5e($v0)
/* 5ADE8 8005A1E8 2403008C */  addiu      $v1, $zero, 0x8c
/* 5ADEC 8005A1EC 2404000D */  addiu      $a0, $zero, 0xd
/* 5ADF0 8005A1F0 2622002A */  addiu      $v0, $s1, 0x2a
/* 5ADF4 8005A1F4 A62300AC */  sh         $v1, 0xac($s1)
/* 5ADF8 8005A1F8 A0440084 */  sb         $a0, 0x84($v0)
/* 5ADFC 8005A1FC A0530085 */  sb         $s3, 0x85($v0)
/* 5AE00 8005A200 A0530086 */  sb         $s3, 0x86($v0)
/* 5AE04 8005A204 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AE08 8005A208 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AE0C 8005A20C 0C026259 */  jal        passToMalloc
/* 5AE10 8005A210 8C720230 */   lw        $s2, 0x230($v1)
/* 5AE14 8005A214 00408021 */  addu       $s0, $v0, $zero
/* 5AE18 8005A218 0C03353E */  jal        strlen
/* 5AE1C 8005A21C 26440001 */   addiu     $a0, $s2, 1
/* 5AE20 8005A220 02002021 */  addu       $a0, $s0, $zero
/* 5AE24 8005A224 02402821 */  addu       $a1, $s2, $zero
/* 5AE28 8005A228 0C02E3A0 */  jal        widgettext_func_2
/* 5AE2C 8005A22C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AE30 8005A230 00402821 */  addu       $a1, $v0, $zero
/* 5AE34 8005A234 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AE38 8005A238 24160007 */  addiu      $s6, $zero, 7
/* 5AE3C 8005A23C 0C02E885 */  jal        link_widget_text
/* 5AE40 8005A240 A456005E */   sh        $s6, 0x5e($v0)
/* 5AE44 8005A244 2403008D */  addiu      $v1, $zero, 0x8d
/* 5AE48 8005A248 24150009 */  addiu      $s5, $zero, 9
/* 5AE4C 8005A24C 26220030 */  addiu      $v0, $s1, 0x30
/* 5AE50 8005A250 A62300B2 */  sh         $v1, 0xb2($s1)
/* 5AE54 8005A254 A0550084 */  sb         $s5, 0x84($v0)
/* 5AE58 8005A258 A0530085 */  sb         $s3, 0x85($v0)
/* 5AE5C 8005A25C A0530086 */  sb         $s3, 0x86($v0)
/* 5AE60 8005A260 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AE64 8005A264 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AE68 8005A268 0C026259 */  jal        passToMalloc
/* 5AE6C 8005A26C 8C720234 */   lw        $s2, 0x234($v1)
/* 5AE70 8005A270 00408021 */  addu       $s0, $v0, $zero
/* 5AE74 8005A274 0C03353E */  jal        strlen
/* 5AE78 8005A278 26440001 */   addiu     $a0, $s2, 1
/* 5AE7C 8005A27C 02002021 */  addu       $a0, $s0, $zero
/* 5AE80 8005A280 02402821 */  addu       $a1, $s2, $zero
/* 5AE84 8005A284 0C02E3A0 */  jal        widgettext_func_2
/* 5AE88 8005A288 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AE8C 8005A28C 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AE90 8005A290 00402821 */  addu       $a1, $v0, $zero
/* 5AE94 8005A294 0C02E885 */  jal        link_widget_text
/* 5AE98 8005A298 A457005E */   sh        $s7, 0x5e($v0)
/* 5AE9C 8005A29C 2403008E */  addiu      $v1, $zero, 0x8e
/* 5AEA0 8005A2A0 2417000B */  addiu      $s7, $zero, 0xb
/* 5AEA4 8005A2A4 26220036 */  addiu      $v0, $s1, 0x36
/* 5AEA8 8005A2A8 A62300B8 */  sh         $v1, 0xb8($s1)
/* 5AEAC 8005A2AC A0570084 */  sb         $s7, 0x84($v0)
/* 5AEB0 8005A2B0 A0530085 */  sb         $s3, 0x85($v0)
/* 5AEB4 8005A2B4 A0530086 */  sb         $s3, 0x86($v0)
/* 5AEB8 8005A2B8 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AEBC 8005A2BC 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AEC0 8005A2C0 0C026259 */  jal        passToMalloc
/* 5AEC4 8005A2C4 8C720238 */   lw        $s2, 0x238($v1)
/* 5AEC8 8005A2C8 00408021 */  addu       $s0, $v0, $zero
/* 5AECC 8005A2CC 0C03353E */  jal        strlen
/* 5AED0 8005A2D0 26440001 */   addiu     $a0, $s2, 1
/* 5AED4 8005A2D4 02002021 */  addu       $a0, $s0, $zero
/* 5AED8 8005A2D8 02402821 */  addu       $a1, $s2, $zero
/* 5AEDC 8005A2DC 0C02E3A0 */  jal        widgettext_func_2
/* 5AEE0 8005A2E0 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AEE4 8005A2E4 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AEE8 8005A2E8 00402821 */  addu       $a1, $v0, $zero
/* 5AEEC 8005A2EC 0C02E885 */  jal        link_widget_text
/* 5AEF0 8005A2F0 A455005E */   sh        $s5, 0x5e($v0)
/* 5AEF4 8005A2F4 2403008F */  addiu      $v1, $zero, 0x8f
/* 5AEF8 8005A2F8 2622003C */  addiu      $v0, $s1, 0x3c
/* 5AEFC 8005A2FC A62300BE */  sh         $v1, 0xbe($s1)
/* 5AF00 8005A300 A0560084 */  sb         $s6, 0x84($v0)
/* 5AF04 8005A304 A0530085 */  sb         $s3, 0x85($v0)
/* 5AF08 8005A308 A0530086 */  sb         $s3, 0x86($v0)
/* 5AF0C 8005A30C 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AF10 8005A310 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AF14 8005A314 0C026259 */  jal        passToMalloc
/* 5AF18 8005A318 8C72023C */   lw        $s2, 0x23c($v1)
/* 5AF1C 8005A31C 00408021 */  addu       $s0, $v0, $zero
/* 5AF20 8005A320 0C03353E */  jal        strlen
/* 5AF24 8005A324 26440001 */   addiu     $a0, $s2, 1
/* 5AF28 8005A328 02002021 */  addu       $a0, $s0, $zero
/* 5AF2C 8005A32C 02402821 */  addu       $a1, $s2, $zero
/* 5AF30 8005A330 0C02E3A0 */  jal        widgettext_func_2
/* 5AF34 8005A334 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AF38 8005A338 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AF3C 8005A33C 00402821 */  addu       $a1, $v0, $zero
/* 5AF40 8005A340 0C02E885 */  jal        link_widget_text
/* 5AF44 8005A344 A45E005E */   sh        $fp, 0x5e($v0)
/* 5AF48 8005A348 24030091 */  addiu      $v1, $zero, 0x91
/* 5AF4C 8005A34C 2404000E */  addiu      $a0, $zero, 0xe
/* 5AF50 8005A350 26220042 */  addiu      $v0, $s1, 0x42
/* 5AF54 8005A354 A62300C4 */  sh         $v1, 0xc4($s1)
/* 5AF58 8005A358 A0440084 */  sb         $a0, 0x84($v0)
/* 5AF5C 8005A35C A0530085 */  sb         $s3, 0x85($v0)
/* 5AF60 8005A360 A0530086 */  sb         $s3, 0x86($v0)
/* 5AF64 8005A364 8E83204C */  lw         $v1, 0x204c($s4)
/* 5AF68 8005A368 2404007C */  addiu      $a0, $zero, 0x7c
/* 5AF6C 8005A36C 0C026259 */  jal        passToMalloc
/* 5AF70 8005A370 8C720244 */   lw        $s2, 0x244($v1)
/* 5AF74 8005A374 00408021 */  addu       $s0, $v0, $zero
/* 5AF78 8005A378 0C03353E */  jal        strlen
/* 5AF7C 8005A37C 26440001 */   addiu     $a0, $s2, 1
/* 5AF80 8005A380 02002021 */  addu       $a0, $s0, $zero
/* 5AF84 8005A384 02402821 */  addu       $a1, $s2, $zero
/* 5AF88 8005A388 0C02E3A0 */  jal        widgettext_func_2
/* 5AF8C 8005A38C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5AF90 8005A390 8E24007C */  lw         $a0, 0x7c($s1)
/* 5AF94 8005A394 00402821 */  addu       $a1, $v0, $zero
/* 5AF98 8005A398 0C02E885 */  jal        link_widget_text
/* 5AF9C 8005A39C A457005E */   sh        $s7, 0x5e($v0)
/* 5AFA0 8005A3A0 02202821 */  addu       $a1, $s1, $zero
/* 5AFA4 8005A3A4 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 5AFA8 8005A3A8 3C028006 */  lui        $v0, %hi(camera_debug_clear)
/* 5AFAC 8005A3AC 8E841604 */  lw         $a0, 0x1604($s4)
/* 5AFB0 8005A3B0 24429E5C */  addiu      $v0, $v0, %lo(camera_debug_clear)
/* 5AFB4 8005A3B4 0C02DC7C */  jal        widgetHandler
/* 5AFB8 8005A3B8 AC62D500 */   sw        $v0, %lo(freeWidgetFunc)($v1)
/* 5AFBC 8005A3BC 02201021 */  addu       $v0, $s1, $zero
/* 5AFC0 8005A3C0 8FBF005C */  lw         $ra, 0x5c($sp)
/* 5AFC4 8005A3C4 8FBE0058 */  lw         $fp, 0x58($sp)
/* 5AFC8 8005A3C8 8FB70054 */  lw         $s7, 0x54($sp)
/* 5AFCC 8005A3CC 8FB60050 */  lw         $s6, 0x50($sp)
/* 5AFD0 8005A3D0 8FB5004C */  lw         $s5, 0x4c($sp)
/* 5AFD4 8005A3D4 8FB40048 */  lw         $s4, 0x48($sp)
/* 5AFD8 8005A3D8 8FB30044 */  lw         $s3, 0x44($sp)
/* 5AFDC 8005A3DC 8FB20040 */  lw         $s2, 0x40($sp)
/* 5AFE0 8005A3E0 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5AFE4 8005A3E4 8FB00038 */  lw         $s0, 0x38($sp)
/* 5AFE8 8005A3E8 03E00008 */  jr         $ra
/* 5AFEC 8005A3EC 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8005A3F0
/* 5AFF0 8005A3F0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5AFF4 8005A3F4 AFB00010 */  sw         $s0, 0x10($sp)
/* 5AFF8 8005A3F8 00808021 */  addu       $s0, $a0, $zero
/* 5AFFC 8005A3FC AFB10014 */  sw         $s1, 0x14($sp)
/* 5B000 8005A400 00A08821 */  addu       $s1, $a1, $zero
/* 5B004 8005A404 02002821 */  addu       $a1, $s0, $zero
/* 5B008 8005A408 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 5B00C 8005A40C 3C02800E */  lui        $v0, %hi(widget_mathods_cameraDebug)
/* 5B010 8005A410 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 5B014 8005A414 2442ED98 */  addiu      $v0, $v0, %lo(widget_mathods_cameraDebug)
/* 5B018 8005A418 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5B01C 8005A41C 0C02DCB3 */  jal        func_800B72CC
/* 5B020 8005A420 AE020078 */   sw        $v0, 0x78($s0)
/* 5B024 8005A424 02002021 */  addu       $a0, $s0, $zero
/* 5B028 8005A428 0C02E66C */  jal        widget_menu_free
/* 5B02C 8005A42C 02202821 */   addu      $a1, $s1, $zero
/* 5B030 8005A430 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5B034 8005A434 8FB10014 */  lw         $s1, 0x14($sp)
/* 5B038 8005A438 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B03C 8005A43C 03E00008 */  jr         $ra
/* 5B040 8005A440 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005A444
/* 5B044 8005A444 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5B048 8005A448 AFB10014 */  sw         $s1, 0x14($sp)
/* 5B04C 8005A44C 00808821 */  addu       $s1, $a0, $zero
/* 5B050 8005A450 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5B054 8005A454 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B058 8005A458 0C02F031 */  jal        func_800BC0C4
/* 5B05C 8005A45C 8E24007C */   lw        $a0, 0x7c($s1)
/* 5B060 8005A460 9443005E */  lhu        $v1, 0x5e($v0)
/* 5B064 8005A464 00031040 */  sll        $v0, $v1, 1
/* 5B068 8005A468 00431021 */  addu       $v0, $v0, $v1
/* 5B06C 8005A46C 00021040 */  sll        $v0, $v0, 1
/* 5B070 8005A470 24420082 */  addiu      $v0, $v0, 0x82
/* 5B074 8005A474 02228021 */  addu       $s0, $s1, $v0
/* 5B078 8005A478 92030004 */  lbu        $v1, 4($s0)
/* 5B07C 8005A47C 1460000A */  bnez       $v1, .L8005A4A8
/* 5B080 8005A480 00000000 */   nop
/* 5B084 8005A484 0C026259 */  jal        passToMalloc
/* 5B088 8005A488 24040084 */   addiu     $a0, $zero, 0x84
/* 5B08C 8005A48C 92050002 */  lbu        $a1, 2($s0)
/* 5B090 8005A490 92060003 */  lbu        $a2, 3($s0)
/* 5B094 8005A494 96270080 */  lhu        $a3, 0x80($s1)
/* 5B098 8005A498 0C01699B */  jal        func_8005A66C
/* 5B09C 8005A49C 00402021 */   addu      $a0, $v0, $zero
/* 5B0A0 8005A4A0 08016930 */  j          .L8005A4C0
/* 5B0A4 8005A4A4 00000000 */   nop
.L8005A4A8:
/* 5B0A8 8005A4A8 0C026259 */  jal        passToMalloc
/* 5B0AC 8005A4AC 24040084 */   addiu     $a0, $zero, 0x84
/* 5B0B0 8005A4B0 92050002 */  lbu        $a1, 2($s0)
/* 5B0B4 8005A4B4 92060003 */  lbu        $a2, 3($s0)
/* 5B0B8 8005A4B8 0C016A78 */  jal        func_8005A9E0
/* 5B0BC 8005A4BC 00402021 */   addu      $a0, $v0, $zero
.L8005A4C0:
/* 5B0C0 8005A4C0 12200006 */  beqz       $s1, .L8005A4DC
/* 5B0C4 8005A4C4 24050003 */   addiu     $a1, $zero, 3
/* 5B0C8 8005A4C8 8E220078 */  lw         $v0, 0x78($s1)
/* 5B0CC 8005A4CC 84440008 */  lh         $a0, 8($v0)
/* 5B0D0 8005A4D0 8C43000C */  lw         $v1, 0xc($v0)
/* 5B0D4 8005A4D4 0060F809 */  jalr       $v1
/* 5B0D8 8005A4D8 02242021 */   addu      $a0, $s1, $a0
.L8005A4DC:
/* 5B0DC 8005A4DC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5B0E0 8005A4E0 8FB10014 */  lw         $s1, 0x14($sp)
/* 5B0E4 8005A4E4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B0E8 8005A4E8 00001021 */  addu       $v0, $zero, $zero
/* 5B0EC 8005A4EC 03E00008 */  jr         $ra
/* 5B0F0 8005A4F0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret_a0_8005a4f4
/* 5B0F4 8005A4F4 03E00008 */  jr         $ra
/* 5B0F8 8005A4F8 00801021 */   addu      $v0, $a0, $zero

glabel func_8005A4FC
/* 5B0FC 8005A4FC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B100 8005A500 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5B104 8005A504 8C85007C */  lw         $a1, 0x7c($a0)
/* 5B108 8005A508 8CA30078 */  lw         $v1, 0x78($a1)
/* 5B10C 8005A50C 84640058 */  lh         $a0, 0x58($v1)
/* 5B110 8005A510 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B114 8005A514 0040F809 */  jalr       $v0
/* 5B118 8005A518 00A42021 */   addu      $a0, $a1, $a0
/* 5B11C 8005A51C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5B120 8005A520 00001021 */  addu       $v0, $zero, $zero
/* 5B124 8005A524 03E00008 */  jr         $ra
/* 5B128 8005A528 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A52C
/* 5B12C 8005A52C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B130 8005A530 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5B134 8005A534 8C85007C */  lw         $a1, 0x7c($a0)
/* 5B138 8005A538 8CA30078 */  lw         $v1, 0x78($a1)
/* 5B13C 8005A53C 84640060 */  lh         $a0, 0x60($v1)
/* 5B140 8005A540 8C620064 */  lw         $v0, 0x64($v1)
/* 5B144 8005A544 0040F809 */  jalr       $v0
/* 5B148 8005A548 00A42021 */   addu      $a0, $a1, $a0
/* 5B14C 8005A54C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5B150 8005A550 00001021 */  addu       $v0, $zero, $zero
/* 5B154 8005A554 03E00008 */  jr         $ra
/* 5B158 8005A558 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A55C
/* 5B15C 8005A55C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B160 8005A560 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B164 8005A564 00808021 */  addu       $s0, $a0, $zero
/* 5B168 8005A568 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B16C 8005A56C 8E030078 */  lw         $v1, 0x78($s0)
/* 5B170 8005A570 84640058 */  lh         $a0, 0x58($v1)
/* 5B174 8005A574 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B178 8005A578 0040F809 */  jalr       $v0
/* 5B17C 8005A57C 02042021 */   addu      $a0, $s0, $a0
/* 5B180 8005A580 8E030078 */  lw         $v1, 0x78($s0)
/* 5B184 8005A584 84640058 */  lh         $a0, 0x58($v1)
/* 5B188 8005A588 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B18C 8005A58C 0040F809 */  jalr       $v0
/* 5B190 8005A590 02042021 */   addu      $a0, $s0, $a0
/* 5B194 8005A594 8E030078 */  lw         $v1, 0x78($s0)
/* 5B198 8005A598 84640058 */  lh         $a0, 0x58($v1)
/* 5B19C 8005A59C 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B1A0 8005A5A0 0040F809 */  jalr       $v0
/* 5B1A4 8005A5A4 02042021 */   addu      $a0, $s0, $a0
/* 5B1A8 8005A5A8 8E030078 */  lw         $v1, 0x78($s0)
/* 5B1AC 8005A5AC 84640058 */  lh         $a0, 0x58($v1)
/* 5B1B0 8005A5B0 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B1B4 8005A5B4 0040F809 */  jalr       $v0
/* 5B1B8 8005A5B8 02042021 */   addu      $a0, $s0, $a0
/* 5B1BC 8005A5BC 8E030078 */  lw         $v1, 0x78($s0)
/* 5B1C0 8005A5C0 84640058 */  lh         $a0, 0x58($v1)
/* 5B1C4 8005A5C4 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B1C8 8005A5C8 0040F809 */  jalr       $v0
/* 5B1CC 8005A5CC 02042021 */   addu      $a0, $s0, $a0
/* 5B1D0 8005A5D0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B1D4 8005A5D4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B1D8 8005A5D8 00001021 */  addu       $v0, $zero, $zero
/* 5B1DC 8005A5DC 03E00008 */  jr         $ra
/* 5B1E0 8005A5E0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A5E4
/* 5B1E4 8005A5E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B1E8 8005A5E8 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B1EC 8005A5EC 00808021 */  addu       $s0, $a0, $zero
/* 5B1F0 8005A5F0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B1F4 8005A5F4 8E030078 */  lw         $v1, 0x78($s0)
/* 5B1F8 8005A5F8 84640060 */  lh         $a0, 0x60($v1)
/* 5B1FC 8005A5FC 8C620064 */  lw         $v0, 0x64($v1)
/* 5B200 8005A600 0040F809 */  jalr       $v0
/* 5B204 8005A604 02042021 */   addu      $a0, $s0, $a0
/* 5B208 8005A608 8E030078 */  lw         $v1, 0x78($s0)
/* 5B20C 8005A60C 84640060 */  lh         $a0, 0x60($v1)
/* 5B210 8005A610 8C620064 */  lw         $v0, 0x64($v1)
/* 5B214 8005A614 0040F809 */  jalr       $v0
/* 5B218 8005A618 02042021 */   addu      $a0, $s0, $a0
/* 5B21C 8005A61C 8E030078 */  lw         $v1, 0x78($s0)
/* 5B220 8005A620 84640060 */  lh         $a0, 0x60($v1)
/* 5B224 8005A624 8C620064 */  lw         $v0, 0x64($v1)
/* 5B228 8005A628 0040F809 */  jalr       $v0
/* 5B22C 8005A62C 02042021 */   addu      $a0, $s0, $a0
/* 5B230 8005A630 8E030078 */  lw         $v1, 0x78($s0)
/* 5B234 8005A634 84640060 */  lh         $a0, 0x60($v1)
/* 5B238 8005A638 8C620064 */  lw         $v0, 0x64($v1)
/* 5B23C 8005A63C 0040F809 */  jalr       $v0
/* 5B240 8005A640 02042021 */   addu      $a0, $s0, $a0
/* 5B244 8005A644 8E030078 */  lw         $v1, 0x78($s0)
/* 5B248 8005A648 84640060 */  lh         $a0, 0x60($v1)
/* 5B24C 8005A64C 8C620064 */  lw         $v0, 0x64($v1)
/* 5B250 8005A650 0040F809 */  jalr       $v0
/* 5B254 8005A654 02042021 */   addu      $a0, $s0, $a0
/* 5B258 8005A658 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B25C 8005A65C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B260 8005A660 00001021 */  addu       $v0, $zero, $zero
/* 5B264 8005A664 03E00008 */  jr         $ra
/* 5B268 8005A668 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A66C
/* 5B26C 8005A66C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 5B270 8005A670 AFB00028 */  sw         $s0, 0x28($sp)
/* 5B274 8005A674 00808021 */  addu       $s0, $a0, $zero
/* 5B278 8005A678 AFB20030 */  sw         $s2, 0x30($sp)
/* 5B27C 8005A67C 30B200FF */  andi       $s2, $a1, 0xff
/* 5B280 8005A680 AFB30034 */  sw         $s3, 0x34($sp)
/* 5B284 8005A684 30D300FF */  andi       $s3, $a2, 0xff
/* 5B288 8005A688 AFB1002C */  sw         $s1, 0x2c($sp)
/* 5B28C 8005A68C AFBF0038 */  sw         $ra, 0x38($sp)
/* 5B290 8005A690 0C02E658 */  jal        widget_menu_build
/* 5B294 8005A694 30F1FFFF */   andi      $s1, $a3, 0xffff
/* 5B298 8005A698 02002021 */  addu       $a0, $s0, $zero
/* 5B29C 8005A69C 24050028 */  addiu      $a1, $zero, 0x28
/* 5B2A0 8005A6A0 2406000A */  addiu      $a2, $zero, 0xa
/* 5B2A4 8005A6A4 240700C8 */  addiu      $a3, $zero, 0xc8
/* 5B2A8 8005A6A8 3C02800E */  lui        $v0, %hi(D_800DECC8)
/* 5B2AC 8005A6AC 2442ECC8 */  addiu      $v0, $v0, %lo(D_800DECC8)
/* 5B2B0 8005A6B0 AE020078 */  sw         $v0, 0x78($s0)
/* 5B2B4 8005A6B4 240200C8 */  addiu      $v0, $zero, 0xc8
/* 5B2B8 8005A6B8 A6110080 */  sh         $s1, 0x80($s0)
/* 5B2BC 8005A6BC 241100FF */  addiu      $s1, $zero, 0xff
/* 5B2C0 8005A6C0 AE00007C */  sw         $zero, 0x7c($s0)
/* 5B2C4 8005A6C4 A2120082 */  sb         $s2, 0x82($s0)
/* 5B2C8 8005A6C8 A2130083 */  sb         $s3, 0x83($s0)
/* 5B2CC 8005A6CC AFA20010 */  sw         $v0, 0x10($sp)
/* 5B2D0 8005A6D0 AFA00014 */  sw         $zero, 0x14($sp)
/* 5B2D4 8005A6D4 AFA00018 */  sw         $zero, 0x18($sp)
/* 5B2D8 8005A6D8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5B2DC 8005A6DC 0C02F27C */  jal        func_800BC9F0
/* 5B2E0 8005A6E0 AFB10020 */   sw        $s1, 0x20($sp)
/* 5B2E4 8005A6E4 00402021 */  addu       $a0, $v0, $zero
/* 5B2E8 8005A6E8 3C05800E */  lui        $a1, %hi(D_800DEBF0)
/* 5B2EC 8005A6EC 24A5EBF0 */  addiu      $a1, $a1, %lo(D_800DEBF0)
/* 5B2F0 8005A6F0 24060032 */  addiu      $a2, $zero, 0x32
/* 5B2F4 8005A6F4 24070014 */  addiu      $a3, $zero, 0x14
/* 5B2F8 8005A6F8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5B2FC 8005A6FC AFA20010 */  sw         $v0, 0x10($sp)
/* 5B300 8005A700 AFA20014 */  sw         $v0, 0x14($sp)
/* 5B304 8005A704 AFA20018 */  sw         $v0, 0x18($sp)
/* 5B308 8005A708 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 5B30C 8005A70C AFB1001C */   sw        $s1, 0x1c($sp)
/* 5B310 8005A710 02002821 */  addu       $a1, $s0, $zero
/* 5B314 8005A714 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 5B318 8005A718 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 5B31C 8005A71C 24030001 */  addiu      $v1, $zero, 1
/* 5B320 8005A720 AE02007C */  sw         $v0, 0x7c($s0)
/* 5B324 8005A724 0C02DC7C */  jal        widgetHandler
/* 5B328 8005A728 A443005E */   sh        $v1, 0x5e($v0)
/* 5B32C 8005A72C 02001021 */  addu       $v0, $s0, $zero
/* 5B330 8005A730 8FBF0038 */  lw         $ra, 0x38($sp)
/* 5B334 8005A734 8FB30034 */  lw         $s3, 0x34($sp)
/* 5B338 8005A738 8FB20030 */  lw         $s2, 0x30($sp)
/* 5B33C 8005A73C 8FB1002C */  lw         $s1, 0x2c($sp)
/* 5B340 8005A740 8FB00028 */  lw         $s0, 0x28($sp)
/* 5B344 8005A744 03E00008 */  jr         $ra
/* 5B348 8005A748 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8005A74C
/* 5B34C 8005A74C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5B350 8005A750 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B354 8005A754 00808021 */  addu       $s0, $a0, $zero
/* 5B358 8005A758 AFB10014 */  sw         $s1, 0x14($sp)
/* 5B35C 8005A75C 00A08821 */  addu       $s1, $a1, $zero
/* 5B360 8005A760 02002821 */  addu       $a1, $s0, $zero
/* 5B364 8005A764 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 5B368 8005A768 3C02800E */  lui        $v0, %hi(D_800DECC8)
/* 5B36C 8005A76C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 5B370 8005A770 2442ECC8 */  addiu      $v0, $v0, %lo(D_800DECC8)
/* 5B374 8005A774 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5B378 8005A778 0C02DCB3 */  jal        func_800B72CC
/* 5B37C 8005A77C AE020078 */   sw        $v0, 0x78($s0)
/* 5B380 8005A780 02002021 */  addu       $a0, $s0, $zero
/* 5B384 8005A784 0C02E66C */  jal        widget_menu_free
/* 5B388 8005A788 02202821 */   addu      $a1, $s1, $zero
/* 5B38C 8005A78C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5B390 8005A790 8FB10014 */  lw         $s1, 0x14($sp)
/* 5B394 8005A794 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B398 8005A798 03E00008 */  jr         $ra
/* 5B39C 8005A79C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005A7A0
/* 5B3A0 8005A7A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B3A4 8005A7A4 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B3A8 8005A7A8 00808021 */  addu       $s0, $a0, $zero
/* 5B3AC 8005A7AC AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B3B0 8005A7B0 92030083 */  lbu        $v1, 0x83($s0)
/* 5B3B4 8005A7B4 24020001 */  addiu      $v0, $zero, 1
/* 5B3B8 8005A7B8 1462000D */  bne        $v1, $v0, .L8005A7F0
/* 5B3BC 8005A7BC 3C02800F */   lui       $v0, %hi(dialougemode_pointer)
/* 5B3C0 8005A7C0 92060082 */  lbu        $a2, 0x82($s0)
/* 5B3C4 8005A7C4 8C48E960 */  lw         $t0, %lo(dialougemode_pointer)($v0)
/* 5B3C8 8005A7C8 8E03007C */  lw         $v1, 0x7c($s0)
/* 5B3CC 8005A7CC 96020080 */  lhu        $v0, 0x80($s0)
/* 5B3D0 8005A7D0 250400B4 */  addiu      $a0, $t0, 0xb4
/* 5B3D4 8005A7D4 9467005E */  lhu        $a3, 0x5e($v1)
/* 5B3D8 8005A7D8 8D050084 */  lw         $a1, 0x84($t0)
/* 5B3DC 8005A7DC 00E23821 */  addu       $a3, $a3, $v0
/* 5B3E0 8005A7E0 0C015B21 */  jal        dialougPreCallback
/* 5B3E4 8005A7E4 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 5B3E8 8005A7E8 08016A07 */  j          .L8005A81C
/* 5B3EC 8005A7EC 02001021 */   addu      $v0, $s0, $zero
.L8005A7F0:
/* 5B3F0 8005A7F0 92060082 */  lbu        $a2, 0x82($s0)
/* 5B3F4 8005A7F4 8C48E960 */  lw         $t0, -0x16a0($v0)
/* 5B3F8 8005A7F8 8E03007C */  lw         $v1, 0x7c($s0)
/* 5B3FC 8005A7FC 96020080 */  lhu        $v0, 0x80($s0)
/* 5B400 8005A800 250400B4 */  addiu      $a0, $t0, 0xb4
/* 5B404 8005A804 9467005E */  lhu        $a3, 0x5e($v1)
/* 5B408 8005A808 8D050084 */  lw         $a1, 0x84($t0)
/* 5B40C 8005A80C 00E23821 */  addu       $a3, $a3, $v0
/* 5B410 8005A810 0C015CB4 */  jal        dialouge_func_C
/* 5B414 8005A814 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 5B418 8005A818 02001021 */  addu       $v0, $s0, $zero
.L8005A81C:
/* 5B41C 8005A81C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B420 8005A820 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B424 8005A824 03E00008 */  jr         $ra
/* 5B428 8005A828 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_8005a82c
/* 5B42C 8005A82C 03E00008 */  jr         $ra
/* 5B430 8005A830 00801021 */   addu      $v0, $a0, $zero

glabel func_8005A834
/* 5B434 8005A834 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B438 8005A838 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B43C 8005A83C AFB00010 */  sw         $s0, 0x10($sp)
/* 5B440 8005A840 8C90007C */  lw         $s0, 0x7c($a0)
/* 5B444 8005A844 9602005E */  lhu        $v0, 0x5e($s0)
/* 5B448 8005A848 02002021 */  addu       $a0, $s0, $zero
/* 5B44C 8005A84C 24420001 */  addiu      $v0, $v0, 1
/* 5B450 8005A850 0C02EEBC */  jal        func_800BBAF0
/* 5B454 8005A854 A602005E */   sh        $v0, 0x5e($s0)
/* 5B458 8005A858 00402021 */  addu       $a0, $v0, $zero
/* 5B45C 8005A85C 3C05800E */  lui        $a1, %hi(D_800DEBF4)
/* 5B460 8005A860 9606005E */  lhu        $a2, 0x5e($s0)
/* 5B464 8005A864 0C0333AC */  jal        sprintf
/* 5B468 8005A868 24A5EBF4 */   addiu     $a1, $a1, %lo(D_800DEBF4)
/* 5B46C 8005A86C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B470 8005A870 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B474 8005A874 00001021 */  addu       $v0, $zero, $zero
/* 5B478 8005A878 03E00008 */  jr         $ra
/* 5B47C 8005A87C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A880
/* 5B480 8005A880 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B484 8005A884 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B488 8005A888 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B48C 8005A88C 8C90007C */  lw         $s0, 0x7c($a0)
/* 5B490 8005A890 9602005E */  lhu        $v0, 0x5e($s0)
/* 5B494 8005A894 10400002 */  beqz       $v0, .L8005A8A0
/* 5B498 8005A898 2442FFFF */   addiu     $v0, $v0, -1
/* 5B49C 8005A89C A602005E */  sh         $v0, 0x5e($s0)
.L8005A8A0:
/* 5B4A0 8005A8A0 0C02EEBC */  jal        func_800BBAF0
/* 5B4A4 8005A8A4 8C84007C */   lw        $a0, 0x7c($a0)
/* 5B4A8 8005A8A8 00402021 */  addu       $a0, $v0, $zero
/* 5B4AC 8005A8AC 3C05800E */  lui        $a1, %hi(D_800DEBF4)
/* 5B4B0 8005A8B0 9606005E */  lhu        $a2, 0x5e($s0)
/* 5B4B4 8005A8B4 0C0333AC */  jal        sprintf
/* 5B4B8 8005A8B8 24A5EBF4 */   addiu     $a1, $a1, %lo(D_800DEBF4)
/* 5B4BC 8005A8BC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B4C0 8005A8C0 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B4C4 8005A8C4 00001021 */  addu       $v0, $zero, $zero
/* 5B4C8 8005A8C8 03E00008 */  jr         $ra
/* 5B4CC 8005A8CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A8D0
/* 5B4D0 8005A8D0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B4D4 8005A8D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B4D8 8005A8D8 00808021 */  addu       $s0, $a0, $zero
/* 5B4DC 8005A8DC AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B4E0 8005A8E0 8E030078 */  lw         $v1, 0x78($s0)
/* 5B4E4 8005A8E4 84640058 */  lh         $a0, 0x58($v1)
/* 5B4E8 8005A8E8 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B4EC 8005A8EC 0040F809 */  jalr       $v0
/* 5B4F0 8005A8F0 02042021 */   addu      $a0, $s0, $a0
/* 5B4F4 8005A8F4 8E030078 */  lw         $v1, 0x78($s0)
/* 5B4F8 8005A8F8 84640058 */  lh         $a0, 0x58($v1)
/* 5B4FC 8005A8FC 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B500 8005A900 0040F809 */  jalr       $v0
/* 5B504 8005A904 02042021 */   addu      $a0, $s0, $a0
/* 5B508 8005A908 8E030078 */  lw         $v1, 0x78($s0)
/* 5B50C 8005A90C 84640058 */  lh         $a0, 0x58($v1)
/* 5B510 8005A910 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B514 8005A914 0040F809 */  jalr       $v0
/* 5B518 8005A918 02042021 */   addu      $a0, $s0, $a0
/* 5B51C 8005A91C 8E030078 */  lw         $v1, 0x78($s0)
/* 5B520 8005A920 84640058 */  lh         $a0, 0x58($v1)
/* 5B524 8005A924 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B528 8005A928 0040F809 */  jalr       $v0
/* 5B52C 8005A92C 02042021 */   addu      $a0, $s0, $a0
/* 5B530 8005A930 8E030078 */  lw         $v1, 0x78($s0)
/* 5B534 8005A934 84640058 */  lh         $a0, 0x58($v1)
/* 5B538 8005A938 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B53C 8005A93C 0040F809 */  jalr       $v0
/* 5B540 8005A940 02042021 */   addu      $a0, $s0, $a0
/* 5B544 8005A944 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B548 8005A948 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B54C 8005A94C 00001021 */  addu       $v0, $zero, $zero
/* 5B550 8005A950 03E00008 */  jr         $ra
/* 5B554 8005A954 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A958
/* 5B558 8005A958 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B55C 8005A95C AFB00010 */  sw         $s0, 0x10($sp)
/* 5B560 8005A960 00808021 */  addu       $s0, $a0, $zero
/* 5B564 8005A964 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B568 8005A968 8E030078 */  lw         $v1, 0x78($s0)
/* 5B56C 8005A96C 84640060 */  lh         $a0, 0x60($v1)
/* 5B570 8005A970 8C620064 */  lw         $v0, 0x64($v1)
/* 5B574 8005A974 0040F809 */  jalr       $v0
/* 5B578 8005A978 02042021 */   addu      $a0, $s0, $a0
/* 5B57C 8005A97C 8E030078 */  lw         $v1, 0x78($s0)
/* 5B580 8005A980 84640060 */  lh         $a0, 0x60($v1)
/* 5B584 8005A984 8C620064 */  lw         $v0, 0x64($v1)
/* 5B588 8005A988 0040F809 */  jalr       $v0
/* 5B58C 8005A98C 02042021 */   addu      $a0, $s0, $a0
/* 5B590 8005A990 8E030078 */  lw         $v1, 0x78($s0)
/* 5B594 8005A994 84640060 */  lh         $a0, 0x60($v1)
/* 5B598 8005A998 8C620064 */  lw         $v0, 0x64($v1)
/* 5B59C 8005A99C 0040F809 */  jalr       $v0
/* 5B5A0 8005A9A0 02042021 */   addu      $a0, $s0, $a0
/* 5B5A4 8005A9A4 8E030078 */  lw         $v1, 0x78($s0)
/* 5B5A8 8005A9A8 84640060 */  lh         $a0, 0x60($v1)
/* 5B5AC 8005A9AC 8C620064 */  lw         $v0, 0x64($v1)
/* 5B5B0 8005A9B0 0040F809 */  jalr       $v0
/* 5B5B4 8005A9B4 02042021 */   addu      $a0, $s0, $a0
/* 5B5B8 8005A9B8 8E030078 */  lw         $v1, 0x78($s0)
/* 5B5BC 8005A9BC 84640060 */  lh         $a0, 0x60($v1)
/* 5B5C0 8005A9C0 8C620064 */  lw         $v0, 0x64($v1)
/* 5B5C4 8005A9C4 0040F809 */  jalr       $v0
/* 5B5C8 8005A9C8 02042021 */   addu      $a0, $s0, $a0
/* 5B5CC 8005A9CC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B5D0 8005A9D0 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B5D4 8005A9D4 00001021 */  addu       $v0, $zero, $zero
/* 5B5D8 8005A9D8 03E00008 */  jr         $ra
/* 5B5DC 8005A9DC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005A9E0
/* 5B5E0 8005A9E0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 5B5E4 8005A9E4 AFB40048 */  sw         $s4, 0x48($sp)
/* 5B5E8 8005A9E8 0080A021 */  addu       $s4, $a0, $zero
/* 5B5EC 8005A9EC AFB00038 */  sw         $s0, 0x38($sp)
/* 5B5F0 8005A9F0 30B000FF */  andi       $s0, $a1, 0xff
/* 5B5F4 8005A9F4 AFB1003C */  sw         $s1, 0x3c($sp)
/* 5B5F8 8005A9F8 30D100FF */  andi       $s1, $a2, 0xff
/* 5B5FC 8005A9FC AFBF005C */  sw         $ra, 0x5c($sp)
/* 5B600 8005AA00 AFBE0058 */  sw         $fp, 0x58($sp)
/* 5B604 8005AA04 AFB70054 */  sw         $s7, 0x54($sp)
/* 5B608 8005AA08 AFB60050 */  sw         $s6, 0x50($sp)
/* 5B60C 8005AA0C AFB5004C */  sw         $s5, 0x4c($sp)
/* 5B610 8005AA10 AFB30044 */  sw         $s3, 0x44($sp)
/* 5B614 8005AA14 0C02E658 */  jal        widget_menu_build
/* 5B618 8005AA18 AFB20040 */   sw        $s2, 0x40($sp)
/* 5B61C 8005AA1C 02802021 */  addu       $a0, $s4, $zero
/* 5B620 8005AA20 24050028 */  addiu      $a1, $zero, 0x28
/* 5B624 8005AA24 2406000A */  addiu      $a2, $zero, 0xa
/* 5B628 8005AA28 240700C8 */  addiu      $a3, $zero, 0xc8
/* 5B62C 8005AA2C 00009821 */  addu       $s3, $zero, $zero
/* 5B630 8005AA30 3C02800E */  lui        $v0, %hi(D_800DEBF8)
/* 5B634 8005AA34 A2910081 */  sb         $s1, 0x81($s4)
/* 5B638 8005AA38 3C11800F */  lui        $s1, %hi(dialougemode_pointer)
/* 5B63C 8005AA3C A2900080 */  sb         $s0, 0x80($s4)
/* 5B640 8005AA40 8E23E960 */  lw         $v1, %lo(dialougemode_pointer)($s1)
/* 5B644 8005AA44 2442EBF8 */  addiu      $v0, $v0, %lo(D_800DEBF8)
/* 5B648 8005AA48 AE820078 */  sw         $v0, 0x78($s4)
/* 5B64C 8005AA4C 240200C8 */  addiu      $v0, $zero, 0xc8
/* 5B650 8005AA50 241000FF */  addiu      $s0, $zero, 0xff
/* 5B654 8005AA54 8C750084 */  lw         $s5, 0x84($v1)
/* 5B658 8005AA58 247600B4 */  addiu      $s6, $v1, 0xb4
/* 5B65C 8005AA5C AFA20010 */  sw         $v0, 0x10($sp)
/* 5B660 8005AA60 AFA00014 */  sw         $zero, 0x14($sp)
/* 5B664 8005AA64 AFA00018 */  sw         $zero, 0x18($sp)
/* 5B668 8005AA68 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5B66C 8005AA6C 0C02F27C */  jal        func_800BC9F0
/* 5B670 8005AA70 AFB00020 */   sw        $s0, 0x20($sp)
/* 5B674 8005AA74 00402021 */  addu       $a0, $v0, $zero
/* 5B678 8005AA78 24060032 */  addiu      $a2, $zero, 0x32
/* 5B67C 8005AA7C 24070014 */  addiu      $a3, $zero, 0x14
/* 5B680 8005AA80 24020032 */  addiu      $v0, $zero, 0x32
/* 5B684 8005AA84 92A50013 */  lbu        $a1, 0x13($s5)
/* 5B688 8005AA88 24030014 */  addiu      $v1, $zero, 0x14
/* 5B68C 8005AA8C AFA20010 */  sw         $v0, 0x10($sp)
/* 5B690 8005AA90 2402012C */  addiu      $v0, $zero, 0x12c
/* 5B694 8005AA94 AFA30014 */  sw         $v1, 0x14($sp)
/* 5B698 8005AA98 240300DC */  addiu      $v1, $zero, 0xdc
/* 5B69C 8005AA9C AFA20018 */  sw         $v0, 0x18($sp)
/* 5B6A0 8005AAA0 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5B6A4 8005AAA4 AFA3001C */  sw         $v1, 0x1c($sp)
/* 5B6A8 8005AAA8 AFA20020 */  sw         $v0, 0x20($sp)
/* 5B6AC 8005AAAC AFA20024 */  sw         $v0, 0x24($sp)
/* 5B6B0 8005AAB0 AFA20028 */  sw         $v0, 0x28($sp)
/* 5B6B4 8005AAB4 AFB0002C */  sw         $s0, 0x2c($sp)
/* 5B6B8 8005AAB8 0C02F435 */  jal        widgetscrollmenu_init_2
/* 5B6BC 8005AABC AFA00030 */   sw        $zero, 0x30($sp)
/* 5B6C0 8005AAC0 AE82007C */  sw         $v0, 0x7c($s4)
/* 5B6C4 8005AAC4 92A20013 */  lbu        $v0, 0x13($s5)
/* 5B6C8 8005AAC8 10400024 */  beqz       $v0, .L8005AB5C
/* 5B6CC 8005AACC 0220F021 */   addu      $fp, $s1, $zero
/* 5B6D0 8005AAD0 3C17800F */  lui        $s7, 0x800f
/* 5B6D4 8005AAD4 00002821 */  addu       $a1, $zero, $zero
.L8005AAD8:
/* 5B6D8 8005AAD8 001390C0 */  sll        $s2, $s3, 3
/* 5B6DC 8005AADC 02D21021 */  addu       $v0, $s6, $s2
/* 5B6E0 8005AAE0 94440074 */  lhu        $a0, 0x74($v0)
/* 5B6E4 8005AAE4 0C01D77A */  jal        GetIDIndex
/* 5B6E8 8005AAE8 00003021 */   addu      $a2, $zero, $zero
/* 5B6EC 8005AAEC 8EE313A0 */  lw         $v1, 0x13a0($s7)
/* 5B6F0 8005AAF0 2404007C */  addiu      $a0, $zero, 0x7c
/* 5B6F4 8005AAF4 8C700010 */  lw         $s0, 0x10($v1)
/* 5B6F8 8005AAF8 000211C0 */  sll        $v0, $v0, 7
/* 5B6FC 8005AAFC 0C026259 */  jal        passToMalloc
/* 5B700 8005AB00 02028021 */   addu      $s0, $s0, $v0
/* 5B704 8005AB04 26100002 */  addiu      $s0, $s0, 2
/* 5B708 8005AB08 02002021 */  addu       $a0, $s0, $zero
/* 5B70C 8005AB0C 0C03353E */  jal        strlen
/* 5B710 8005AB10 00408821 */   addu      $s1, $v0, $zero
/* 5B714 8005AB14 02202021 */  addu       $a0, $s1, $zero
/* 5B718 8005AB18 02002821 */  addu       $a1, $s0, $zero
/* 5B71C 8005AB1C 24420001 */  addiu      $v0, $v0, 1
/* 5B720 8005AB20 0C02E3A0 */  jal        widgettext_func_2
/* 5B724 8005AB24 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5B728 8005AB28 8FC3E960 */  lw         $v1, -0x16a0($fp)
/* 5B72C 8005AB2C 8E84007C */  lw         $a0, 0x7c($s4)
/* 5B730 8005AB30 00721821 */  addu       $v1, $v1, $s2
/* 5B734 8005AB34 94660128 */  lhu        $a2, 0x128($v1)
/* 5B738 8005AB38 00402821 */  addu       $a1, $v0, $zero
/* 5B73C 8005AB3C 0C02E885 */  jal        link_widget_text
/* 5B740 8005AB40 A446005E */   sh        $a2, 0x5e($v0)
/* 5B744 8005AB44 26630001 */  addiu      $v1, $s3, 1
/* 5B748 8005AB48 92A20013 */  lbu        $v0, 0x13($s5)
/* 5B74C 8005AB4C 3073FFFF */  andi       $s3, $v1, 0xffff
/* 5B750 8005AB50 0262102B */  sltu       $v0, $s3, $v0
/* 5B754 8005AB54 1440FFE0 */  bnez       $v0, .L8005AAD8
/* 5B758 8005AB58 00002821 */   addu      $a1, $zero, $zero
.L8005AB5C:
/* 5B75C 8005AB5C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5B760 8005AB60 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 5B764 8005AB64 8C441604 */  lw         $a0, 0x1604($v0)
/* 5B768 8005AB68 0C02DC7C */  jal        widgetHandler
/* 5B76C 8005AB6C 02802821 */   addu      $a1, $s4, $zero
/* 5B770 8005AB70 02801021 */  addu       $v0, $s4, $zero
/* 5B774 8005AB74 8FBF005C */  lw         $ra, 0x5c($sp)
/* 5B778 8005AB78 8FBE0058 */  lw         $fp, 0x58($sp)
/* 5B77C 8005AB7C 8FB70054 */  lw         $s7, 0x54($sp)
/* 5B780 8005AB80 8FB60050 */  lw         $s6, 0x50($sp)
/* 5B784 8005AB84 8FB5004C */  lw         $s5, 0x4c($sp)
/* 5B788 8005AB88 8FB40048 */  lw         $s4, 0x48($sp)
/* 5B78C 8005AB8C 8FB30044 */  lw         $s3, 0x44($sp)
/* 5B790 8005AB90 8FB20040 */  lw         $s2, 0x40($sp)
/* 5B794 8005AB94 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5B798 8005AB98 8FB00038 */  lw         $s0, 0x38($sp)
/* 5B79C 8005AB9C 03E00008 */  jr         $ra
/* 5B7A0 8005ABA0 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8005ABA4
/* 5B7A4 8005ABA4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5B7A8 8005ABA8 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B7AC 8005ABAC 00808021 */  addu       $s0, $a0, $zero
/* 5B7B0 8005ABB0 AFB10014 */  sw         $s1, 0x14($sp)
/* 5B7B4 8005ABB4 00A08821 */  addu       $s1, $a1, $zero
/* 5B7B8 8005ABB8 02002821 */  addu       $a1, $s0, $zero
/* 5B7BC 8005ABBC 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 5B7C0 8005ABC0 3C02800E */  lui        $v0, %hi(D_800DEBF8)
/* 5B7C4 8005ABC4 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 5B7C8 8005ABC8 2442EBF8 */  addiu      $v0, $v0, %lo(D_800DEBF8)
/* 5B7CC 8005ABCC AFBF0018 */  sw         $ra, 0x18($sp)
/* 5B7D0 8005ABD0 0C02DCB3 */  jal        func_800B72CC
/* 5B7D4 8005ABD4 AE020078 */   sw        $v0, 0x78($s0)
/* 5B7D8 8005ABD8 02002021 */  addu       $a0, $s0, $zero
/* 5B7DC 8005ABDC 0C02E66C */  jal        widget_menu_free
/* 5B7E0 8005ABE0 02202821 */   addu      $a1, $s1, $zero
/* 5B7E4 8005ABE4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5B7E8 8005ABE8 8FB10014 */  lw         $s1, 0x14($sp)
/* 5B7EC 8005ABEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B7F0 8005ABF0 03E00008 */  jr         $ra
/* 5B7F4 8005ABF4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005ABF8
/* 5B7F8 8005ABF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B7FC 8005ABFC AFB00010 */  sw         $s0, 0x10($sp)
/* 5B800 8005AC00 00808021 */  addu       $s0, $a0, $zero
/* 5B804 8005AC04 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B808 8005AC08 0C02F031 */  jal        func_800BC0C4
/* 5B80C 8005AC0C 8E04007C */   lw        $a0, 0x7c($s0)
/* 5B810 8005AC10 00402821 */  addu       $a1, $v0, $zero
/* 5B814 8005AC14 92030081 */  lbu        $v1, 0x81($s0)
/* 5B818 8005AC18 24020001 */  addiu      $v0, $zero, 1
/* 5B81C 8005AC1C 14620009 */  bne        $v1, $v0, .L8005AC44
/* 5B820 8005AC20 3C02800F */   lui       $v0, %hi(dialougemode_pointer)
/* 5B824 8005AC24 92060080 */  lbu        $a2, 0x80($s0)
/* 5B828 8005AC28 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 5B82C 8005AC2C 94A7005E */  lhu        $a3, 0x5e($a1)
/* 5B830 8005AC30 8C850084 */  lw         $a1, 0x84($a0)
/* 5B834 8005AC34 0C015B21 */  jal        dialougPreCallback
/* 5B838 8005AC38 248400B4 */   addiu     $a0, $a0, 0xb4
/* 5B83C 8005AC3C 08016B18 */  j          .L8005AC60
/* 5B840 8005AC40 02001021 */   addu      $v0, $s0, $zero
.L8005AC44:
/* 5B844 8005AC44 92060080 */  lbu        $a2, 0x80($s0)
/* 5B848 8005AC48 8C44E960 */  lw         $a0, -0x16a0($v0)
/* 5B84C 8005AC4C 94A7005E */  lhu        $a3, 0x5e($a1)
/* 5B850 8005AC50 8C850084 */  lw         $a1, 0x84($a0)
/* 5B854 8005AC54 0C015CB4 */  jal        dialouge_func_C
/* 5B858 8005AC58 248400B4 */   addiu     $a0, $a0, 0xb4
/* 5B85C 8005AC5C 02001021 */  addu       $v0, $s0, $zero
.L8005AC60:
/* 5B860 8005AC60 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B864 8005AC64 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B868 8005AC68 03E00008 */  jr         $ra
/* 5B86C 8005AC6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_8005ac70
/* 5B870 8005AC70 03E00008 */  jr         $ra
/* 5B874 8005AC74 00801021 */   addu      $v0, $a0, $zero

glabel func_8005AC78
/* 5B878 8005AC78 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B87C 8005AC7C AFBF0010 */  sw         $ra, 0x10($sp)
/* 5B880 8005AC80 8C85007C */  lw         $a1, 0x7c($a0)
/* 5B884 8005AC84 8CA30078 */  lw         $v1, 0x78($a1)
/* 5B888 8005AC88 84640058 */  lh         $a0, 0x58($v1)
/* 5B88C 8005AC8C 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B890 8005AC90 0040F809 */  jalr       $v0
/* 5B894 8005AC94 00A42021 */   addu      $a0, $a1, $a0
/* 5B898 8005AC98 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5B89C 8005AC9C 00001021 */  addu       $v0, $zero, $zero
/* 5B8A0 8005ACA0 03E00008 */  jr         $ra
/* 5B8A4 8005ACA4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005ACA8
/* 5B8A8 8005ACA8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B8AC 8005ACAC AFBF0010 */  sw         $ra, 0x10($sp)
/* 5B8B0 8005ACB0 8C85007C */  lw         $a1, 0x7c($a0)
/* 5B8B4 8005ACB4 8CA30078 */  lw         $v1, 0x78($a1)
/* 5B8B8 8005ACB8 84640060 */  lh         $a0, 0x60($v1)
/* 5B8BC 8005ACBC 8C620064 */  lw         $v0, 0x64($v1)
/* 5B8C0 8005ACC0 0040F809 */  jalr       $v0
/* 5B8C4 8005ACC4 00A42021 */   addu      $a0, $a1, $a0
/* 5B8C8 8005ACC8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5B8CC 8005ACCC 00001021 */  addu       $v0, $zero, $zero
/* 5B8D0 8005ACD0 03E00008 */  jr         $ra
/* 5B8D4 8005ACD4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005ACD8
/* 5B8D8 8005ACD8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B8DC 8005ACDC AFB00010 */  sw         $s0, 0x10($sp)
/* 5B8E0 8005ACE0 00808021 */  addu       $s0, $a0, $zero
/* 5B8E4 8005ACE4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B8E8 8005ACE8 8E030078 */  lw         $v1, 0x78($s0)
/* 5B8EC 8005ACEC 84640058 */  lh         $a0, 0x58($v1)
/* 5B8F0 8005ACF0 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B8F4 8005ACF4 0040F809 */  jalr       $v0
/* 5B8F8 8005ACF8 02042021 */   addu      $a0, $s0, $a0
/* 5B8FC 8005ACFC 8E030078 */  lw         $v1, 0x78($s0)
/* 5B900 8005AD00 84640058 */  lh         $a0, 0x58($v1)
/* 5B904 8005AD04 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B908 8005AD08 0040F809 */  jalr       $v0
/* 5B90C 8005AD0C 02042021 */   addu      $a0, $s0, $a0
/* 5B910 8005AD10 8E030078 */  lw         $v1, 0x78($s0)
/* 5B914 8005AD14 84640058 */  lh         $a0, 0x58($v1)
/* 5B918 8005AD18 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B91C 8005AD1C 0040F809 */  jalr       $v0
/* 5B920 8005AD20 02042021 */   addu      $a0, $s0, $a0
/* 5B924 8005AD24 8E030078 */  lw         $v1, 0x78($s0)
/* 5B928 8005AD28 84640058 */  lh         $a0, 0x58($v1)
/* 5B92C 8005AD2C 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B930 8005AD30 0040F809 */  jalr       $v0
/* 5B934 8005AD34 02042021 */   addu      $a0, $s0, $a0
/* 5B938 8005AD38 8E030078 */  lw         $v1, 0x78($s0)
/* 5B93C 8005AD3C 84640058 */  lh         $a0, 0x58($v1)
/* 5B940 8005AD40 8C62005C */  lw         $v0, 0x5c($v1)
/* 5B944 8005AD44 0040F809 */  jalr       $v0
/* 5B948 8005AD48 02042021 */   addu      $a0, $s0, $a0
/* 5B94C 8005AD4C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B950 8005AD50 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B954 8005AD54 00001021 */  addu       $v0, $zero, $zero
/* 5B958 8005AD58 03E00008 */  jr         $ra
/* 5B95C 8005AD5C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005AD60
/* 5B960 8005AD60 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5B964 8005AD64 AFB00010 */  sw         $s0, 0x10($sp)
/* 5B968 8005AD68 00808021 */  addu       $s0, $a0, $zero
/* 5B96C 8005AD6C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5B970 8005AD70 8E030078 */  lw         $v1, 0x78($s0)
/* 5B974 8005AD74 84640060 */  lh         $a0, 0x60($v1)
/* 5B978 8005AD78 8C620064 */  lw         $v0, 0x64($v1)
/* 5B97C 8005AD7C 0040F809 */  jalr       $v0
/* 5B980 8005AD80 02042021 */   addu      $a0, $s0, $a0
/* 5B984 8005AD84 8E030078 */  lw         $v1, 0x78($s0)
/* 5B988 8005AD88 84640060 */  lh         $a0, 0x60($v1)
/* 5B98C 8005AD8C 8C620064 */  lw         $v0, 0x64($v1)
/* 5B990 8005AD90 0040F809 */  jalr       $v0
/* 5B994 8005AD94 02042021 */   addu      $a0, $s0, $a0
/* 5B998 8005AD98 8E030078 */  lw         $v1, 0x78($s0)
/* 5B99C 8005AD9C 84640060 */  lh         $a0, 0x60($v1)
/* 5B9A0 8005ADA0 8C620064 */  lw         $v0, 0x64($v1)
/* 5B9A4 8005ADA4 0040F809 */  jalr       $v0
/* 5B9A8 8005ADA8 02042021 */   addu      $a0, $s0, $a0
/* 5B9AC 8005ADAC 8E030078 */  lw         $v1, 0x78($s0)
/* 5B9B0 8005ADB0 84640060 */  lh         $a0, 0x60($v1)
/* 5B9B4 8005ADB4 8C620064 */  lw         $v0, 0x64($v1)
/* 5B9B8 8005ADB8 0040F809 */  jalr       $v0
/* 5B9BC 8005ADBC 02042021 */   addu      $a0, $s0, $a0
/* 5B9C0 8005ADC0 8E030078 */  lw         $v1, 0x78($s0)
/* 5B9C4 8005ADC4 84640060 */  lh         $a0, 0x60($v1)
/* 5B9C8 8005ADC8 8C620064 */  lw         $v0, 0x64($v1)
/* 5B9CC 8005ADCC 0040F809 */  jalr       $v0
/* 5B9D0 8005ADD0 02042021 */   addu      $a0, $s0, $a0
/* 5B9D4 8005ADD4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5B9D8 8005ADD8 8FB00010 */  lw         $s0, 0x10($sp)
/* 5B9DC 8005ADDC 00001021 */  addu       $v0, $zero, $zero
/* 5B9E0 8005ADE0 03E00008 */  jr         $ra
/* 5B9E4 8005ADE4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005ADE8
/* 5B9E8 8005ADE8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5B9EC 8005ADEC AFB20018 */  sw         $s2, 0x18($sp)
/* 5B9F0 8005ADF0 00809021 */  addu       $s2, $a0, $zero
/* 5B9F4 8005ADF4 2404007C */  addiu      $a0, $zero, 0x7c
/* 5B9F8 8005ADF8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 5B9FC 8005ADFC 30B300FF */  andi       $s3, $a1, 0xff
/* 5BA00 8005AE00 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 5BA04 8005AE04 00131040 */  sll        $v0, $s3, 1
/* 5BA08 8005AE08 00531021 */  addu       $v0, $v0, $s3
/* 5BA0C 8005AE0C 00021040 */  sll        $v0, $v0, 1
/* 5BA10 8005AE10 02421821 */  addu       $v1, $s2, $v0
/* 5BA14 8005AE14 00601021 */  addu       $v0, $v1, $zero
/* 5BA18 8005AE18 AFBF0020 */  sw         $ra, 0x20($sp)
/* 5BA1C 8005AE1C AFB10014 */  sw         $s1, 0x14($sp)
/* 5BA20 8005AE20 AFB00010 */  sw         $s0, 0x10($sp)
/* 5BA24 8005AE24 A4660082 */  sh         $a2, 0x82($v1)
/* 5BA28 8005AE28 93A5003B */  lbu        $a1, 0x3b($sp)
/* 5BA2C 8005AE2C 93A8003F */  lbu        $t0, 0x3f($sp)
/* 5BA30 8005AE30 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 5BA34 8005AE34 A0470084 */  sb         $a3, 0x84($v0)
/* 5BA38 8005AE38 A0450085 */  sb         $a1, 0x85($v0)
/* 5BA3C 8005AE3C A0480086 */  sb         $t0, 0x86($v0)
/* 5BA40 8005AE40 8C6288F4 */  lw         $v0, %lo(commonstringsmirror)($v1)
/* 5BA44 8005AE44 00063080 */  sll        $a2, $a2, 2
/* 5BA48 8005AE48 00C23021 */  addu       $a2, $a2, $v0
/* 5BA4C 8005AE4C 0C026259 */  jal        passToMalloc
/* 5BA50 8005AE50 8CD10000 */   lw        $s1, ($a2)
/* 5BA54 8005AE54 00408021 */  addu       $s0, $v0, $zero
/* 5BA58 8005AE58 0C03353E */  jal        strlen
/* 5BA5C 8005AE5C 26240001 */   addiu     $a0, $s1, 1
/* 5BA60 8005AE60 02002021 */  addu       $a0, $s0, $zero
/* 5BA64 8005AE64 02202821 */  addu       $a1, $s1, $zero
/* 5BA68 8005AE68 0C02E3A0 */  jal        widgettext_func_2
/* 5BA6C 8005AE6C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5BA70 8005AE70 8E44007C */  lw         $a0, 0x7c($s2)
/* 5BA74 8005AE74 00402821 */  addu       $a1, $v0, $zero
/* 5BA78 8005AE78 0C02E885 */  jal        link_widget_text
/* 5BA7C 8005AE7C A453005E */   sh        $s3, 0x5e($v0)
/* 5BA80 8005AE80 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5BA84 8005AE84 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5BA88 8005AE88 8FB20018 */  lw         $s2, 0x18($sp)
/* 5BA8C 8005AE8C 8FB10014 */  lw         $s1, 0x14($sp)
/* 5BA90 8005AE90 8FB00010 */  lw         $s0, 0x10($sp)
/* 5BA94 8005AE94 03E00008 */  jr         $ra
/* 5BA98 8005AE98 27BD0028 */   addiu     $sp, $sp, 0x28
/* 5BA9C 8005AE9C 00000000 */  nop
