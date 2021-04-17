.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widget_biuld_spell_shop
/* 39D50 80039150 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 39D54 80039154 AFB00010 */  sw         $s0, 0x10($sp)
/* 39D58 80039158 00808021 */  addu       $s0, $a0, $zero
/* 39D5C 8003915C AFB10014 */  sw         $s1, 0x14($sp)
/* 39D60 80039160 00A08821 */  addu       $s1, $a1, $zero
/* 39D64 80039164 AFB20018 */  sw         $s2, 0x18($sp)
/* 39D68 80039168 AFBF001C */  sw         $ra, 0x1c($sp)
/* 39D6C 8003916C 0C02E658 */  jal        widget_menu_build
/* 39D70 80039170 30D200FF */   andi      $s2, $a2, 0xff
/* 39D74 80039174 3C03800E */  lui        $v1, %hi(Widget_Methods_spellShop)
/* 39D78 80039178 2463BC08 */  addiu      $v1, $v1, %lo(Widget_Methods_spellShop)
/* 39D7C 8003917C 26040090 */  addiu      $a0, $s0, 0x90
/* 39D80 80039180 24050004 */  addiu      $a1, $zero, 4
/* 39D84 80039184 0C0358FC */  jal        init_unkGuiSubstruct
/* 39D88 80039188 AE030078 */   sw        $v1, 0x78($s0)
/* 39D8C 8003918C 02002021 */  addu       $a0, $s0, $zero
/* 39D90 80039190 02202821 */  addu       $a1, $s1, $zero
/* 39D94 80039194 0C00E493 */  jal        some_training_menu
/* 39D98 80039198 02403021 */   addu      $a2, $s2, $zero
/* 39D9C 8003919C 02001021 */  addu       $v0, $s0, $zero
/* 39DA0 800391A0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 39DA4 800391A4 8FB20018 */  lw         $s2, 0x18($sp)
/* 39DA8 800391A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 39DAC 800391AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 39DB0 800391B0 03E00008 */  jr         $ra
/* 39DB4 800391B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_shop_spells
/* 39DB8 800391B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 39DBC 800391BC AFB10014 */  sw         $s1, 0x14($sp)
/* 39DC0 800391C0 00808821 */  addu       $s1, $a0, $zero
/* 39DC4 800391C4 3C02800E */  lui        $v0, %hi(Widget_Methods_spellShop)
/* 39DC8 800391C8 2442BC08 */  addiu      $v0, $v0, %lo(Widget_Methods_spellShop)
/* 39DCC 800391CC 3C03800E */  lui        $v1, %hi(someCase_1)
/* 39DD0 800391D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 39DD4 800391D4 24707D6C */  addiu      $s0, $v1, %lo(someCase_1)
/* 39DD8 800391D8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 39DDC 800391DC AFB20018 */  sw         $s2, 0x18($sp)
/* 39DE0 800391E0 8E040024 */  lw         $a0, 0x24($s0)
/* 39DE4 800391E4 00A09021 */  addu       $s2, $a1, $zero
/* 39DE8 800391E8 10800004 */  beqz       $a0, .L800391FC
/* 39DEC 800391EC AE220078 */   sw        $v0, 0x78($s1)
/* 39DF0 800391F0 0C026262 */  jal        passToFree
/* 39DF4 800391F4 00000000 */   nop
/* 39DF8 800391F8 AE000024 */  sw         $zero, 0x24($s0)
.L800391FC:
/* 39DFC 800391FC 8E04001C */  lw         $a0, 0x1c($s0)
/* 39E00 80039200 50800007 */  beql       $a0, $zero, .L80039220
/* 39E04 80039204 26240090 */   addiu     $a0, $s1, 0x90
/* 39E08 80039208 0C021122 */  jal        spellbok_free
/* 39E0C 8003920C 00000000 */   nop
/* 39E10 80039210 0C026262 */  jal        passToFree
/* 39E14 80039214 8E04001C */   lw        $a0, 0x1c($s0)
/* 39E18 80039218 AE00001C */  sw         $zero, 0x1c($s0)
/* 39E1C 8003921C 26240090 */  addiu      $a0, $s1, 0x90
.L80039220:
/* 39E20 80039220 0C035910 */  jal        some_clearing_func
/* 39E24 80039224 24050002 */   addiu     $a1, $zero, 2
/* 39E28 80039228 02202021 */  addu       $a0, $s1, $zero
/* 39E2C 8003922C 0C02E66C */  jal        widget_menu_free
/* 39E30 80039230 02402821 */   addu      $a1, $s2, $zero
/* 39E34 80039234 8FBF001C */  lw         $ra, 0x1c($sp)
/* 39E38 80039238 8FB20018 */  lw         $s2, 0x18($sp)
/* 39E3C 8003923C 8FB10014 */  lw         $s1, 0x14($sp)
/* 39E40 80039240 8FB00010 */  lw         $s0, 0x10($sp)
/* 39E44 80039244 03E00008 */  jr         $ra
/* 39E48 80039248 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_training_menu
/* 39E4C 8003924C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 39E50 80039250 AFB20020 */  sw         $s2, 0x20($sp)
/* 39E54 80039254 00809021 */  addu       $s2, $a0, $zero
/* 39E58 80039258 3C02800F */  lui        $v0, 0x800f
/* 39E5C 8003925C AFBF003C */  sw         $ra, 0x3c($sp)
/* 39E60 80039260 AFBE0038 */  sw         $fp, 0x38($sp)
/* 39E64 80039264 AFB70034 */  sw         $s7, 0x34($sp)
/* 39E68 80039268 AFB60030 */  sw         $s6, 0x30($sp)
/* 39E6C 8003926C AFB5002C */  sw         $s5, 0x2c($sp)
/* 39E70 80039270 AFB40028 */  sw         $s4, 0x28($sp)
/* 39E74 80039274 AFB30024 */  sw         $s3, 0x24($sp)
/* 39E78 80039278 AFB1001C */  sw         $s1, 0x1c($sp)
/* 39E7C 8003927C AFB00018 */  sw         $s0, 0x18($sp)
/* 39E80 80039280 AE4500B4 */  sw         $a1, 0xb4($s2)
/* 39E84 80039284 A2460084 */  sb         $a2, 0x84($s2)
/* 39E88 80039288 9043D550 */  lbu        $v1, -0x2ab0($v0)
/* 39E8C 8003928C 2404007C */  addiu      $a0, $zero, 0x7c
/* 39E90 80039290 A2400086 */  sb         $zero, 0x86($s2)
/* 39E94 80039294 0C026259 */  jal        passToMalloc
/* 39E98 80039298 A2430085 */   sb        $v1, 0x85($s2)
/* 39E9C 8003929C 240400E4 */  addiu      $a0, $zero, 0xe4
/* 39EA0 800392A0 0C0290E2 */  jal        get_borg_8
/* 39EA4 800392A4 00408021 */   addu      $s0, $v0, $zero
/* 39EA8 800392A8 02002021 */  addu       $a0, $s0, $zero
/* 39EAC 800392AC 0C02E518 */  jal        borg8_widget
/* 39EB0 800392B0 00402821 */   addu      $a1, $v0, $zero
/* 39EB4 800392B4 00408021 */  addu       $s0, $v0, $zero
/* 39EB8 800392B8 02002021 */  addu       $a0, $s0, $zero
/* 39EBC 800392BC 24050005 */  addiu      $a1, $zero, 5
/* 39EC0 800392C0 0C02DD3F */  jal        set_widget_coords
/* 39EC4 800392C4 2406003C */   addiu     $a2, $zero, 0x3c
/* 39EC8 800392C8 8E430078 */  lw         $v1, 0x78($s2)
/* 39ECC 800392CC 02002821 */  addu       $a1, $s0, $zero
/* 39ED0 800392D0 84640030 */  lh         $a0, 0x30($v1)
/* 39ED4 800392D4 8C620034 */  lw         $v0, 0x34($v1)
/* 39ED8 800392D8 0040F809 */  jalr       $v0
/* 39EDC 800392DC 02442021 */   addu      $a0, $s2, $a0
/* 39EE0 800392E0 0C026259 */  jal        passToMalloc
/* 39EE4 800392E4 2404007C */   addiu     $a0, $zero, 0x7c
/* 39EE8 800392E8 240400E2 */  addiu      $a0, $zero, 0xe2
/* 39EEC 800392EC 0C0290E2 */  jal        get_borg_8
/* 39EF0 800392F0 00408021 */   addu      $s0, $v0, $zero
/* 39EF4 800392F4 02002021 */  addu       $a0, $s0, $zero
/* 39EF8 800392F8 0C02E518 */  jal        borg8_widget
/* 39EFC 800392FC 00402821 */   addu      $a1, $v0, $zero
/* 39F00 80039300 00402021 */  addu       $a0, $v0, $zero
/* 39F04 80039304 00002821 */  addu       $a1, $zero, $zero
/* 39F08 80039308 2406003A */  addiu      $a2, $zero, 0x3a
/* 39F0C 8003930C 0C02DD3F */  jal        set_widget_coords
/* 39F10 80039310 AE4200A0 */   sw        $v0, 0xa0($s2)
/* 39F14 80039314 8E430078 */  lw         $v1, 0x78($s2)
/* 39F18 80039318 8E4500A0 */  lw         $a1, 0xa0($s2)
/* 39F1C 8003931C 84640030 */  lh         $a0, 0x30($v1)
/* 39F20 80039320 8C620034 */  lw         $v0, 0x34($v1)
/* 39F24 80039324 0040F809 */  jalr       $v0
/* 39F28 80039328 02442021 */   addu      $a0, $s2, $a0
/* 39F2C 8003932C 0C026259 */  jal        passToMalloc
/* 39F30 80039330 2404007C */   addiu     $a0, $zero, 0x7c
/* 39F34 80039334 240400EF */  addiu      $a0, $zero, 0xef
/* 39F38 80039338 0C0290E2 */  jal        get_borg_8
/* 39F3C 8003933C 00408021 */   addu      $s0, $v0, $zero
/* 39F40 80039340 02002021 */  addu       $a0, $s0, $zero
/* 39F44 80039344 0C02E518 */  jal        borg8_widget
/* 39F48 80039348 00402821 */   addu      $a1, $v0, $zero
/* 39F4C 8003934C 00408821 */  addu       $s1, $v0, $zero
/* 39F50 80039350 8E230078 */  lw         $v1, 0x78($s1)
/* 39F54 80039354 84640018 */  lh         $a0, 0x18($v1)
/* 39F58 80039358 8C62001C */  lw         $v0, 0x1c($v1)
/* 39F5C 8003935C 0040F809 */  jalr       $v0
/* 39F60 80039360 02242021 */   addu      $a0, $s1, $a0
/* 39F64 80039364 00021042 */  srl        $v0, $v0, 1
/* 39F68 80039368 3042FFFF */  andi       $v0, $v0, 0xffff
/* 39F6C 8003936C 2410005A */  addiu      $s0, $zero, 0x5a
/* 39F70 80039370 8E250078 */  lw         $a1, 0x78($s1)
/* 39F74 80039374 02028023 */  subu       $s0, $s0, $v0
/* 39F78 80039378 84A40020 */  lh         $a0, 0x20($a1)
/* 39F7C 8003937C 8CA30024 */  lw         $v1, 0x24($a1)
/* 39F80 80039380 0060F809 */  jalr       $v1
/* 39F84 80039384 02242021 */   addu      $a0, $s1, $a0
/* 39F88 80039388 02202021 */  addu       $a0, $s1, $zero
/* 39F8C 8003938C 02002821 */  addu       $a1, $s0, $zero
/* 39F90 80039390 24060056 */  addiu      $a2, $zero, 0x56
/* 39F94 80039394 0C02DD3F */  jal        set_widget_coords
/* 39F98 80039398 00C23023 */   subu      $a2, $a2, $v0
/* 39F9C 8003939C 8E430078 */  lw         $v1, 0x78($s2)
/* 39FA0 800393A0 02202821 */  addu       $a1, $s1, $zero
/* 39FA4 800393A4 84640030 */  lh         $a0, 0x30($v1)
/* 39FA8 800393A8 8C620034 */  lw         $v0, 0x34($v1)
/* 39FAC 800393AC 0040F809 */  jalr       $v0
/* 39FB0 800393B0 02442021 */   addu      $a0, $s2, $a0
/* 39FB4 800393B4 0C026259 */  jal        passToMalloc
/* 39FB8 800393B8 24040090 */   addiu     $a0, $zero, 0x90
/* 39FBC 800393BC 00402021 */  addu       $a0, $v0, $zero
/* 39FC0 800393C0 0C0100C4 */  jal        Draw_spells_header
/* 39FC4 800393C4 24050001 */   addiu     $a1, $zero, 1
/* 39FC8 800393C8 00402821 */  addu       $a1, $v0, $zero
/* 39FCC 800393CC 92430086 */  lbu        $v1, 0x86($s2)
/* 39FD0 800393D0 8E460078 */  lw         $a2, 0x78($s2)
/* 39FD4 800393D4 2650007C */  addiu      $s0, $s2, 0x7c
/* 39FD8 800393D8 AE420088 */  sw         $v0, 0x88($s2)
/* 39FDC 800393DC 24640001 */  addiu      $a0, $v1, 1
/* 39FE0 800393E0 306300FF */  andi       $v1, $v1, 0xff
/* 39FE4 800393E4 00031880 */  sll        $v1, $v1, 2
/* 39FE8 800393E8 02031821 */  addu       $v1, $s0, $v1
/* 39FEC 800393EC A2440086 */  sb         $a0, 0x86($s2)
/* 39FF0 800393F0 AC620000 */  sw         $v0, ($v1)
/* 39FF4 800393F4 84C40030 */  lh         $a0, 0x30($a2)
/* 39FF8 800393F8 8CC20034 */  lw         $v0, 0x34($a2)
/* 39FFC 800393FC 0040F809 */  jalr       $v0
/* 3A000 80039400 02442021 */   addu      $a0, $s2, $a0
/* 3A004 80039404 0C026259 */  jal        passToMalloc
/* 3A008 80039408 24040090 */   addiu     $a0, $zero, 0x90
/* 3A00C 8003940C 00402021 */  addu       $a0, $v0, $zero
/* 3A010 80039410 0C00FB54 */  jal        widget_skills_title
/* 3A014 80039414 24050001 */   addiu     $a1, $zero, 1
/* 3A018 80039418 92430086 */  lbu        $v1, 0x86($s2)
/* 3A01C 8003941C 8E460078 */  lw         $a2, 0x78($s2)
/* 3A020 80039420 00402821 */  addu       $a1, $v0, $zero
/* 3A024 80039424 AE42008C */  sw         $v0, 0x8c($s2)
/* 3A028 80039428 24640001 */  addiu      $a0, $v1, 1
/* 3A02C 8003942C 306300FF */  andi       $v1, $v1, 0xff
/* 3A030 80039430 00031880 */  sll        $v1, $v1, 2
/* 3A034 80039434 02031821 */  addu       $v1, $s0, $v1
/* 3A038 80039438 A2440086 */  sb         $a0, 0x86($s2)
/* 3A03C 8003943C AC620000 */  sw         $v0, ($v1)
/* 3A040 80039440 84C40030 */  lh         $a0, 0x30($a2)
/* 3A044 80039444 8CC20034 */  lw         $v0, 0x34($a2)
/* 3A048 80039448 0040F809 */  jalr       $v0
/* 3A04C 8003944C 02442021 */   addu      $a0, $s2, $a0
/* 3A050 80039450 92430084 */  lbu        $v1, 0x84($s2)
/* 3A054 80039454 24050014 */  addiu      $a1, $zero, 0x14
/* 3A058 80039458 00031880 */  sll        $v1, $v1, 2
/* 3A05C 8003945C 02031821 */  addu       $v1, $s0, $v1
/* 3A060 80039460 8C640000 */  lw         $a0, ($v1)
/* 3A064 80039464 0C02DD3F */  jal        set_widget_coords
/* 3A068 80039468 24060058 */   addiu     $a2, $zero, 0x58
/* 3A06C 8003946C 92420084 */  lbu        $v0, 0x84($s2)
/* 3A070 80039470 92430086 */  lbu        $v1, 0x86($s2)
/* 3A074 80039474 0043102B */  sltu       $v0, $v0, $v1
/* 3A078 80039478 50400001 */  beql       $v0, $zero, .L80039480
/* 3A07C 8003947C A2400084 */   sb        $zero, 0x84($s2)
.L80039480:
/* 3A080 80039480 92420086 */  lbu        $v0, 0x86($s2)
/* 3A084 80039484 10400023 */  beqz       $v0, .L80039514
/* 3A088 80039488 00008821 */   addu      $s1, $zero, $zero
/* 3A08C 8003948C 241E0014 */  addiu      $fp, $zero, 0x14
/* 3A090 80039490 2417009D */  addiu      $s7, $zero, 0x9d
/* 3A094 80039494 24160058 */  addiu      $s6, $zero, 0x58
/* 3A098 80039498 241500A6 */  addiu      $s5, $zero, 0xa6
/* 3A09C 8003949C 0000A021 */  addu       $s4, $zero, $zero
/* 3A0A0 800394A0 02009821 */  addu       $s3, $s0, $zero
/* 3A0A4 800394A4 92420084 */  lbu        $v0, 0x84($s2)
.L800394A8:
/* 3A0A8 800394A8 12220005 */  beq        $s1, $v0, .L800394C0
/* 3A0AC 800394AC 2650007C */   addiu     $s0, $s2, 0x7c
/* 3A0B0 800394B0 8E640000 */  lw         $a0, ($s3)
/* 3A0B4 800394B4 2405FF88 */  addiu      $a1, $zero, -0x78
/* 3A0B8 800394B8 0C02DD3F */  jal        set_widget_coords
/* 3A0BC 800394BC 24060058 */   addiu     $a2, $zero, 0x58
.L800394C0:
/* 3A0C0 800394C0 02148021 */  addu       $s0, $s0, $s4
/* 3A0C4 800394C4 8E040000 */  lw         $a0, ($s0)
/* 3A0C8 800394C8 8C850078 */  lw         $a1, 0x78($a0)
/* 3A0CC 800394CC A49E0064 */  sh         $fp, 0x64($a0)
/* 3A0D0 800394D0 A4970066 */  sh         $s7, 0x66($a0)
/* 3A0D4 800394D4 A4960068 */  sh         $s6, 0x68($a0)
/* 3A0D8 800394D8 A495006A */  sh         $s5, 0x6a($a0)
/* 3A0DC 800394DC 84A30028 */  lh         $v1, 0x28($a1)
/* 3A0E0 800394E0 8CA2002C */  lw         $v0, 0x2c($a1)
/* 3A0E4 800394E4 0040F809 */  jalr       $v0
/* 3A0E8 800394E8 00832021 */   addu      $a0, $a0, $v1
/* 3A0EC 800394EC 8E030000 */  lw         $v1, ($s0)
/* 3A0F0 800394F0 26940004 */  addiu      $s4, $s4, 4
/* 3A0F4 800394F4 8C640080 */  lw         $a0, 0x80($v1)
/* 3A0F8 800394F8 0C00BFCC */  jal        func_8002FF30
/* 3A0FC 800394FC 26730004 */   addiu     $s3, $s3, 4
/* 3A100 80039500 92420086 */  lbu        $v0, 0x86($s2)
/* 3A104 80039504 26310001 */  addiu      $s1, $s1, 1
/* 3A108 80039508 0222102A */  slt        $v0, $s1, $v0
/* 3A10C 8003950C 5440FFE6 */  bnel       $v0, $zero, .L800394A8
/* 3A110 80039510 92420084 */   lbu       $v0, 0x84($s2)
.L80039514:
/* 3A114 80039514 0C026259 */  jal        passToMalloc
/* 3A118 80039518 2404007C */   addiu     $a0, $zero, 0x7c
/* 3A11C 8003951C 00402021 */  addu       $a0, $v0, $zero
/* 3A120 80039520 00002821 */  addu       $a1, $zero, $zero
/* 3A124 80039524 0C02DFC8 */  jal        widgetcliptext_init
/* 3A128 80039528 24060014 */   addiu     $a2, $zero, 0x14
/* 3A12C 8003952C 24050082 */  addiu      $a1, $zero, 0x82
/* 3A130 80039530 24060050 */  addiu      $a2, $zero, 0x50
/* 3A134 80039534 8C480078 */  lw         $t0, 0x78($v0)
/* 3A138 80039538 24070050 */  addiu      $a3, $zero, 0x50
/* 3A13C 8003953C AE4200A8 */  sw         $v0, 0xa8($s2)
/* 3A140 80039540 85040048 */  lh         $a0, 0x48($t0)
/* 3A144 80039544 241000FF */  addiu      $s0, $zero, 0xff
/* 3A148 80039548 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A14C 8003954C 8D03004C */  lw         $v1, 0x4c($t0)
/* 3A150 80039550 0060F809 */  jalr       $v1
/* 3A154 80039554 00442021 */   addu      $a0, $v0, $a0
/* 3A158 80039558 2405001E */  addiu      $a1, $zero, 0x1e
/* 3A15C 8003955C 8E4400A8 */  lw         $a0, 0xa8($s2)
/* 3A160 80039560 0C02DD3F */  jal        set_widget_coords
/* 3A164 80039564 240600A9 */   addiu     $a2, $zero, 0xa9
/* 3A168 80039568 8E430078 */  lw         $v1, 0x78($s2)
/* 3A16C 8003956C 8E4500A8 */  lw         $a1, 0xa8($s2)
/* 3A170 80039570 84640030 */  lh         $a0, 0x30($v1)
/* 3A174 80039574 8C620034 */  lw         $v0, 0x34($v1)
/* 3A178 80039578 0040F809 */  jalr       $v0
/* 3A17C 8003957C 02442021 */   addu      $a0, $s2, $a0
/* 3A180 80039580 0C026259 */  jal        passToMalloc
/* 3A184 80039584 2404007C */   addiu     $a0, $zero, 0x7c
/* 3A188 80039588 00402021 */  addu       $a0, $v0, $zero
/* 3A18C 8003958C 00002821 */  addu       $a1, $zero, $zero
/* 3A190 80039590 0C02DFC8 */  jal        widgetcliptext_init
/* 3A194 80039594 24060014 */   addiu     $a2, $zero, 0x14
/* 3A198 80039598 24050082 */  addiu      $a1, $zero, 0x82
/* 3A19C 8003959C 8C480078 */  lw         $t0, 0x78($v0)
/* 3A1A0 800395A0 24060050 */  addiu      $a2, $zero, 0x50
/* 3A1A4 800395A4 AE4200B0 */  sw         $v0, 0xb0($s2)
/* 3A1A8 800395A8 85040048 */  lh         $a0, 0x48($t0)
/* 3A1AC 800395AC 24070050 */  addiu      $a3, $zero, 0x50
/* 3A1B0 800395B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A1B4 800395B4 8D03004C */  lw         $v1, 0x4c($t0)
/* 3A1B8 800395B8 0060F809 */  jalr       $v1
/* 3A1BC 800395BC 00442021 */   addu      $a0, $v0, $a0
/* 3A1C0 800395C0 8E4500A8 */  lw         $a1, 0xa8($s2)
/* 3A1C4 800395C4 8CA30078 */  lw         $v1, 0x78($a1)
/* 3A1C8 800395C8 84640020 */  lh         $a0, 0x20($v1)
/* 3A1CC 800395CC 8C620024 */  lw         $v0, 0x24($v1)
/* 3A1D0 800395D0 0040F809 */  jalr       $v0
/* 3A1D4 800395D4 00A42021 */   addu      $a0, $a1, $a0
/* 3A1D8 800395D8 8E4300A8 */  lw         $v1, 0xa8($s2)
/* 3A1DC 800395DC 2405001E */  addiu      $a1, $zero, 0x1e
/* 3A1E0 800395E0 84660062 */  lh         $a2, 0x62($v1)
/* 3A1E4 800395E4 8E4400B0 */  lw         $a0, 0xb0($s2)
/* 3A1E8 800395E8 0C02DD3F */  jal        set_widget_coords
/* 3A1EC 800395EC 00C23021 */   addu      $a2, $a2, $v0
/* 3A1F0 800395F0 8E430078 */  lw         $v1, 0x78($s2)
/* 3A1F4 800395F4 8E4500B0 */  lw         $a1, 0xb0($s2)
/* 3A1F8 800395F8 84640030 */  lh         $a0, 0x30($v1)
/* 3A1FC 800395FC 8C620034 */  lw         $v0, 0x34($v1)
/* 3A200 80039600 0040F809 */  jalr       $v0
/* 3A204 80039604 02442021 */   addu      $a0, $s2, $a0
/* 3A208 80039608 0C026259 */  jal        passToMalloc
/* 3A20C 8003960C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3A210 80039610 00402021 */  addu       $a0, $v0, $zero
/* 3A214 80039614 00002821 */  addu       $a1, $zero, $zero
/* 3A218 80039618 0C02DFC8 */  jal        widgetcliptext_init
/* 3A21C 8003961C 24060014 */   addiu     $a2, $zero, 0x14
/* 3A220 80039620 24050082 */  addiu      $a1, $zero, 0x82
/* 3A224 80039624 8C480078 */  lw         $t0, 0x78($v0)
/* 3A228 80039628 24060050 */  addiu      $a2, $zero, 0x50
/* 3A22C 8003962C AE4200A4 */  sw         $v0, 0xa4($s2)
/* 3A230 80039630 85040048 */  lh         $a0, 0x48($t0)
/* 3A234 80039634 24070050 */  addiu      $a3, $zero, 0x50
/* 3A238 80039638 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A23C 8003963C 8D03004C */  lw         $v1, 0x4c($t0)
/* 3A240 80039640 0060F809 */  jalr       $v1
/* 3A244 80039644 00442021 */   addu      $a0, $v0, $a0
/* 3A248 80039648 8E4500B0 */  lw         $a1, 0xb0($s2)
/* 3A24C 8003964C 8CA30078 */  lw         $v1, 0x78($a1)
/* 3A250 80039650 84640020 */  lh         $a0, 0x20($v1)
/* 3A254 80039654 8C620024 */  lw         $v0, 0x24($v1)
/* 3A258 80039658 0040F809 */  jalr       $v0
/* 3A25C 8003965C 00A42021 */   addu      $a0, $a1, $a0
/* 3A260 80039660 8E4300B0 */  lw         $v1, 0xb0($s2)
/* 3A264 80039664 2405001E */  addiu      $a1, $zero, 0x1e
/* 3A268 80039668 84660062 */  lh         $a2, 0x62($v1)
/* 3A26C 8003966C 8E4400A4 */  lw         $a0, 0xa4($s2)
/* 3A270 80039670 0C02DD3F */  jal        set_widget_coords
/* 3A274 80039674 00C23021 */   addu      $a2, $a2, $v0
/* 3A278 80039678 8E430078 */  lw         $v1, 0x78($s2)
/* 3A27C 8003967C 8E4500A4 */  lw         $a1, 0xa4($s2)
/* 3A280 80039680 84640030 */  lh         $a0, 0x30($v1)
/* 3A284 80039684 8C620034 */  lw         $v0, 0x34($v1)
/* 3A288 80039688 0040F809 */  jalr       $v0
/* 3A28C 8003968C 02442021 */   addu      $a0, $s2, $a0
/* 3A290 80039690 0C00E5B2 */  jal        func_800396C8
/* 3A294 80039694 02402021 */   addu      $a0, $s2, $zero
/* 3A298 80039698 8FBF003C */  lw         $ra, 0x3c($sp)
/* 3A29C 8003969C 8FBE0038 */  lw         $fp, 0x38($sp)
/* 3A2A0 800396A0 8FB70034 */  lw         $s7, 0x34($sp)
/* 3A2A4 800396A4 8FB60030 */  lw         $s6, 0x30($sp)
/* 3A2A8 800396A8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 3A2AC 800396AC 8FB40028 */  lw         $s4, 0x28($sp)
/* 3A2B0 800396B0 8FB30024 */  lw         $s3, 0x24($sp)
/* 3A2B4 800396B4 8FB20020 */  lw         $s2, 0x20($sp)
/* 3A2B8 800396B8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3A2BC 800396BC 8FB00018 */  lw         $s0, 0x18($sp)
/* 3A2C0 800396C0 03E00008 */  jr         $ra
/* 3A2C4 800396C4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800396C8
/* 3A2C8 800396C8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3A2CC 800396CC AFB10014 */  sw         $s1, 0x14($sp)
/* 3A2D0 800396D0 00808821 */  addu       $s1, $a0, $zero
/* 3A2D4 800396D4 AFBF0024 */  sw         $ra, 0x24($sp)
/* 3A2D8 800396D8 AFB40020 */  sw         $s4, 0x20($sp)
/* 3A2DC 800396DC AFB3001C */  sw         $s3, 0x1c($sp)
/* 3A2E0 800396E0 AFB20018 */  sw         $s2, 0x18($sp)
/* 3A2E4 800396E4 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A2E8 800396E8 92220084 */  lbu        $v0, 0x84($s1)
/* 3A2EC 800396EC 00021080 */  sll        $v0, $v0, 2
/* 3A2F0 800396F0 02221021 */  addu       $v0, $s1, $v0
/* 3A2F4 800396F4 8C45007C */  lw         $a1, 0x7c($v0)
/* 3A2F8 800396F8 8CA30078 */  lw         $v1, 0x78($a1)
/* 3A2FC 800396FC 84640078 */  lh         $a0, 0x78($v1)
/* 3A300 80039700 8C62007C */  lw         $v0, 0x7c($v1)
/* 3A304 80039704 0040F809 */  jalr       $v0
/* 3A308 80039708 00A42021 */   addu      $a0, $a1, $a0
/* 3A30C 8003970C 3C03800F */  lui        $v1, %hi(partypicker)
/* 3A310 80039710 9064D550 */  lbu        $a0, %lo(partypicker)($v1)
/* 3A314 80039714 00408021 */  addu       $s0, $v0, $zero
/* 3A318 80039718 12000048 */  beqz       $s0, .L8003983C
/* 3A31C 8003971C A2240085 */   sb        $a0, 0x85($s1)
/* 3A320 80039720 8E2300B4 */  lw         $v1, 0xb4($s1)
/* 3A324 80039724 90620090 */  lbu        $v0, 0x90($v1)
/* 3A328 80039728 00021080 */  sll        $v0, $v0, 2
/* 3A32C 8003972C 00621821 */  addu       $v1, $v1, $v0
/* 3A330 80039730 8C67007C */  lw         $a3, 0x7c($v1)
/* 3A334 80039734 8CE60078 */  lw         $a2, 0x78($a3)
/* 3A338 80039738 9605005E */  lhu        $a1, 0x5e($s0)
/* 3A33C 8003973C 84C400F0 */  lh         $a0, 0xf0($a2)
/* 3A340 80039740 8CC200F4 */  lw         $v0, 0xf4($a2)
/* 3A344 80039744 0040F809 */  jalr       $v0
/* 3A348 80039748 00E42021 */   addu      $a0, $a3, $a0
/* 3A34C 8003974C 8E2400B4 */  lw         $a0, 0xb4($s1)
/* 3A350 80039750 90830090 */  lbu        $v1, 0x90($a0)
/* 3A354 80039754 00031880 */  sll        $v1, $v1, 2
/* 3A358 80039758 00832021 */  addu       $a0, $a0, $v1
/* 3A35C 8003975C 8C86007C */  lw         $a2, 0x7c($a0)
/* 3A360 80039760 00409021 */  addu       $s2, $v0, $zero
/* 3A364 80039764 8CC70078 */  lw         $a3, 0x78($a2)
/* 3A368 80039768 9605005E */  lhu        $a1, 0x5e($s0)
/* 3A36C 8003976C 84E400E8 */  lh         $a0, 0xe8($a3)
/* 3A370 80039770 8CE300EC */  lw         $v1, 0xec($a3)
/* 3A374 80039774 0060F809 */  jalr       $v1
/* 3A378 80039778 00C42021 */   addu      $a0, $a2, $a0
/* 3A37C 8003977C 00409821 */  addu       $s3, $v0, $zero
/* 3A380 80039780 2402FFFF */  addiu      $v0, $zero, -1
/* 3A384 80039784 1642000C */  bne        $s2, $v0, .L800397B8
/* 3A388 80039788 3C10800E */   lui       $s0, 0x800e
/* 3A38C 8003978C 0C02EEBC */  jal        func_800BBAF0
/* 3A390 80039790 8E2400A8 */   lw        $a0, 0xa8($s1)
/* 3A394 80039794 3C03800E */  lui        $v1, %hi(gGlobals)
/* 3A398 80039798 246468A8 */  addiu      $a0, $v1, %lo(gGlobals)
/* 3A39C 8003979C 8C86204C */  lw         $a2, 0x204c($a0)
/* 3A3A0 800397A0 0060A021 */  addu       $s4, $v1, $zero
/* 3A3A4 800397A4 8CC507B4 */  lw         $a1, 0x7b4($a2)
/* 3A3A8 800397A8 0C0333AC */  jal        sprintf
/* 3A3AC 800397AC 00402021 */   addu      $a0, $v0, $zero
/* 3A3B0 800397B0 0800E5F8 */  j          .L800397E0
/* 3A3B4 800397B4 269068A8 */   addiu     $s0, $s4, 0x68a8
.L800397B8:
/* 3A3B8 800397B8 8E2400A8 */  lw         $a0, 0xa8($s1)
/* 3A3BC 800397BC 0C02EEBC */  jal        func_800BBAF0
/* 3A3C0 800397C0 0200A021 */   addu      $s4, $s0, $zero
/* 3A3C4 800397C4 261068A8 */  addiu      $s0, $s0, 0x68a8
/* 3A3C8 800397C8 8E03204C */  lw         $v1, 0x204c($s0)
/* 3A3CC 800397CC 00402021 */  addu       $a0, $v0, $zero
/* 3A3D0 800397D0 8C6507B8 */  lw         $a1, 0x7b8($v1)
/* 3A3D4 800397D4 0C0333AC */  jal        sprintf
/* 3A3D8 800397D8 02403021 */   addu      $a2, $s2, $zero
/* 3A3DC 800397DC 269068A8 */  addiu      $s0, $s4, 0x68a8
.L800397E0:
/* 3A3E0 800397E0 3C02800F */  lui        $v0, %hi(entityList+0x90)
/* 3A3E4 800397E4 90431440 */  lbu        $v1, %lo(entityList+0x90)($v0)
/* 3A3E8 800397E8 960400DE */  lhu        $a0, 0xde($s0)
/* 3A3EC 800397EC 24630200 */  addiu      $v1, $v1, 0x200
/* 3A3F0 800397F0 1083000A */  beq        $a0, $v1, .L8003981C
/* 3A3F4 800397F4 00000000 */   nop
/* 3A3F8 800397F8 0C02EEBC */  jal        func_800BBAF0
/* 3A3FC 800397FC 8E2400A4 */   lw        $a0, 0xa4($s1)
/* 3A400 80039800 8E03204C */  lw         $v1, 0x204c($s0)
/* 3A404 80039804 00402021 */  addu       $a0, $v0, $zero
/* 3A408 80039808 8C650820 */  lw         $a1, 0x820($v1)
/* 3A40C 8003980C 0C0333AC */  jal        sprintf
/* 3A410 80039810 02603021 */   addu      $a2, $s3, $zero
/* 3A414 80039814 0800E61C */  j          .L80039870
/* 3A418 80039818 00000000 */   nop
.L8003981C:
/* 3A41C 8003981C 0C02EEBC */  jal        func_800BBAF0
/* 3A420 80039820 8E2400A4 */   lw        $a0, 0xa4($s1)
/* 3A424 80039824 00402021 */  addu       $a0, $v0, $zero
/* 3A428 80039828 3C05800E */  lui        $a1, %hi(D_800DBC00)
/* 3A42C 8003982C 0C0333AC */  jal        sprintf
/* 3A430 80039830 24A5BC00 */   addiu     $a1, $a1, %lo(D_800DBC00)
/* 3A434 80039834 0800E61C */  j          .L80039870
/* 3A438 80039838 00000000 */   nop
.L8003983C:
/* 3A43C 8003983C 0C02EEBC */  jal        func_800BBAF0
/* 3A440 80039840 8E2400A8 */   lw        $a0, 0xa8($s1)
/* 3A444 80039844 00402021 */  addu       $a0, $v0, $zero
/* 3A448 80039848 3C10800E */  lui        $s0, %hi(D_800DBC00)
/* 3A44C 8003984C 2610BC00 */  addiu      $s0, $s0, %lo(D_800DBC00)
/* 3A450 80039850 0C0333AC */  jal        sprintf
/* 3A454 80039854 02002821 */   addu      $a1, $s0, $zero
/* 3A458 80039858 8E2400A4 */  lw         $a0, 0xa4($s1)
/* 3A45C 8003985C 0C02EEBC */  jal        func_800BBAF0
/* 3A460 80039860 3C14800E */   lui       $s4, 0x800e
/* 3A464 80039864 00402021 */  addu       $a0, $v0, $zero
/* 3A468 80039868 0C0333AC */  jal        sprintf
/* 3A46C 8003986C 02002821 */   addu      $a1, $s0, $zero
.L80039870:
/* 3A470 80039870 0C02EEBC */  jal        func_800BBAF0
/* 3A474 80039874 8E2400B0 */   lw        $a0, 0xb0($s1)
/* 3A478 80039878 268668A8 */  addiu      $a2, $s4, 0x68a8
/* 3A47C 8003987C 92230085 */  lbu        $v1, 0x85($s1)
/* 3A480 80039880 8CC415F8 */  lw         $a0, 0x15f8($a2)
/* 3A484 80039884 00031880 */  sll        $v1, $v1, 2
/* 3A488 80039888 00832021 */  addu       $a0, $a0, $v1
/* 3A48C 8003988C 8C850000 */  lw         $a1, ($a0)
/* 3A490 80039890 8CC3204C */  lw         $v1, 0x204c($a2)
/* 3A494 80039894 8CA40014 */  lw         $a0, 0x14($a1)
/* 3A498 80039898 8C6507BC */  lw         $a1, 0x7bc($v1)
/* 3A49C 8003989C 8C860008 */  lw         $a2, 8($a0)
/* 3A4A0 800398A0 0C0333AC */  jal        sprintf
/* 3A4A4 800398A4 00402021 */   addu      $a0, $v0, $zero
/* 3A4A8 800398A8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 3A4AC 800398AC 8FB40020 */  lw         $s4, 0x20($sp)
/* 3A4B0 800398B0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3A4B4 800398B4 8FB20018 */  lw         $s2, 0x18($sp)
/* 3A4B8 800398B8 8FB10014 */  lw         $s1, 0x14($sp)
/* 3A4BC 800398BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 3A4C0 800398C0 03E00008 */  jr         $ra
/* 3A4C4 800398C4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800398C8
/* 3A4C8 800398C8 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 3A4CC 800398CC AFB70034 */  sw         $s7, 0x34($sp)
/* 3A4D0 800398D0 0080B821 */  addu       $s7, $a0, $zero
/* 3A4D4 800398D4 AFB20020 */  sw         $s2, 0x20($sp)
/* 3A4D8 800398D8 3C12800E */  lui        $s2, %hi(gGlobals)
/* 3A4DC 800398DC 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 3A4E0 800398E0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 3A4E4 800398E4 00A0A821 */  addu       $s5, $a1, $zero
/* 3A4E8 800398E8 AFB60030 */  sw         $s6, 0x30($sp)
/* 3A4EC 800398EC 3C16800F */  lui        $s6, %hi(font_face)
/* 3A4F0 800398F0 26C28D18 */  addiu      $v0, $s6, %lo(font_face)
/* 3A4F4 800398F4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3A4F8 800398F8 00068C00 */  sll        $s1, $a2, 0x10
/* 3A4FC 800398FC 00118C03 */  sra        $s1, $s1, 0x10
/* 3A500 80039900 AFB00018 */  sw         $s0, 0x18($sp)
/* 3A504 80039904 00078400 */  sll        $s0, $a3, 0x10
/* 3A508 80039908 00108403 */  sra        $s0, $s0, 0x10
/* 3A50C 8003990C AFBF0038 */  sw         $ra, 0x38($sp)
/* 3A510 80039910 AFB40028 */  sw         $s4, 0x28($sp)
/* 3A514 80039914 AFB30024 */  sw         $s3, 0x24($sp)
/* 3A518 80039918 8E441600 */  lw         $a0, 0x1600($s2)
/* 3A51C 8003991C 8C450008 */  lw         $a1, 8($v0)
/* 3A520 80039920 87B30052 */  lh         $s3, 0x52($sp)
/* 3A524 80039924 0C02D0FD */  jal        font_func
/* 3A528 80039928 87B40056 */   lh        $s4, 0x56($sp)
/* 3A52C 8003992C 02E02021 */  addu       $a0, $s7, $zero
/* 3A530 80039930 02A02821 */  addu       $a1, $s5, $zero
/* 3A534 80039934 02203021 */  addu       $a2, $s1, $zero
/* 3A538 80039938 02003821 */  addu       $a3, $s0, $zero
/* 3A53C 8003993C AFB30010 */  sw         $s3, 0x10($sp)
/* 3A540 80039940 0C02DE14 */  jal        widget_func_8
/* 3A544 80039944 AFB40014 */   sw        $s4, 0x14($sp)
/* 3A548 80039948 8E441600 */  lw         $a0, 0x1600($s2)
/* 3A54C 8003994C 8EC58D18 */  lw         $a1, -0x72e8($s6)
/* 3A550 80039950 0C02D0FD */  jal        font_func
/* 3A554 80039954 00408021 */   addu      $s0, $v0, $zero
/* 3A558 80039958 02001021 */  addu       $v0, $s0, $zero
/* 3A55C 8003995C 8FBF0038 */  lw         $ra, 0x38($sp)
/* 3A560 80039960 8FB70034 */  lw         $s7, 0x34($sp)
/* 3A564 80039964 8FB60030 */  lw         $s6, 0x30($sp)
/* 3A568 80039968 8FB5002C */  lw         $s5, 0x2c($sp)
/* 3A56C 8003996C 8FB40028 */  lw         $s4, 0x28($sp)
/* 3A570 80039970 8FB30024 */  lw         $s3, 0x24($sp)
/* 3A574 80039974 8FB20020 */  lw         $s2, 0x20($sp)
/* 3A578 80039978 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3A57C 8003997C 8FB00018 */  lw         $s0, 0x18($sp)
/* 3A580 80039980 03E00008 */  jr         $ra
/* 3A584 80039984 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80039988
/* 3A588 80039988 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3A58C 8003998C AFB20018 */  sw         $s2, 0x18($sp)
/* 3A590 80039990 00809021 */  addu       $s2, $a0, $zero
/* 3A594 80039994 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A598 80039998 3C10800E */  lui        $s0, %hi(gGlobals)
/* 3A59C 8003999C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 3A5A0 800399A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 3A5A4 800399A4 3C11800F */  lui        $s1, %hi(font_face)
/* 3A5A8 800399A8 26228D18 */  addiu      $v0, $s1, %lo(font_face)
/* 3A5AC 800399AC AFBF001C */  sw         $ra, 0x1c($sp)
/* 3A5B0 800399B0 8E041600 */  lw         $a0, 0x1600($s0)
/* 3A5B4 800399B4 0C02D0FD */  jal        font_func
/* 3A5B8 800399B8 8C450008 */   lw        $a1, 8($v0)
/* 3A5BC 800399BC 26440090 */  addiu      $a0, $s2, 0x90
/* 3A5C0 800399C0 0C03593A */  jal        func_800D64E8
/* 3A5C4 800399C4 24050001 */   addiu     $a1, $zero, 1
/* 3A5C8 800399C8 0C02DE51 */  jal        func_800B7944
/* 3A5CC 800399CC 02402021 */   addu      $a0, $s2, $zero
/* 3A5D0 800399D0 8E041600 */  lw         $a0, 0x1600($s0)
/* 3A5D4 800399D4 8E258D18 */  lw         $a1, -0x72e8($s1)
/* 3A5D8 800399D8 0C02D0FD */  jal        font_func
/* 3A5DC 800399DC 00408021 */   addu      $s0, $v0, $zero
/* 3A5E0 800399E0 02001021 */  addu       $v0, $s0, $zero
/* 3A5E4 800399E4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3A5E8 800399E8 8FB20018 */  lw         $s2, 0x18($sp)
/* 3A5EC 800399EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 3A5F0 800399F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 3A5F4 800399F4 03E00008 */  jr         $ra
/* 3A5F8 800399F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800399FC
/* 3A5FC 800399FC 03E00008 */  jr         $ra
/* 3A600 80039A00 8C820098 */   lw        $v0, 0x98($a0)

glabel func_80039A04
/* 3A604 80039A04 3C02800F */  lui        $v0, %hi(partypicker)
/* 3A608 80039A08 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3A60C 80039A0C 03E00008 */  jr         $ra
/* 3A610 80039A10 A0830085 */   sb        $v1, 0x85($a0)

glabel func_80039A14
/* 3A614 80039A14 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 3A618 80039A18 AFB3002C */  sw         $s3, 0x2c($sp)
/* 3A61C 80039A1C 00809821 */  addu       $s3, $a0, $zero
/* 3A620 80039A20 AFB00020 */  sw         $s0, 0x20($sp)
/* 3A624 80039A24 30B000FF */  andi       $s0, $a1, 0xff
/* 3A628 80039A28 AFBF0038 */  sw         $ra, 0x38($sp)
/* 3A62C 80039A2C AFB50034 */  sw         $s5, 0x34($sp)
/* 3A630 80039A30 AFB40030 */  sw         $s4, 0x30($sp)
/* 3A634 80039A34 AFB20028 */  sw         $s2, 0x28($sp)
/* 3A638 80039A38 0C00E67F */  jal        func_800399FC
/* 3A63C 80039A3C AFB10024 */   sw        $s1, 0x24($sp)
/* 3A640 80039A40 14400046 */  bnez       $v0, .L80039B5C
/* 3A644 80039A44 8FBF0038 */   lw        $ra, 0x38($sp)
/* 3A648 80039A48 16000008 */  bnez       $s0, .L80039A6C
/* 3A64C 80039A4C 2415008C */   addiu     $s5, $zero, 0x8c
/* 3A650 80039A50 92620084 */  lbu        $v0, 0x84($s3)
/* 3A654 80039A54 92630086 */  lbu        $v1, 0x86($s3)
/* 3A658 80039A58 00431021 */  addu       $v0, $v0, $v1
/* 3A65C 80039A5C 24420001 */  addiu      $v0, $v0, 1
/* 3A660 80039A60 0043001A */  div        $zero, $v0, $v1
/* 3A664 80039A64 0800E6A1 */  j          .L80039A84
/* 3A668 80039A68 00000000 */   nop
.L80039A6C:
/* 3A66C 80039A6C 92620084 */  lbu        $v0, 0x84($s3)
/* 3A670 80039A70 92630086 */  lbu        $v1, 0x86($s3)
/* 3A674 80039A74 00431021 */  addu       $v0, $v0, $v1
/* 3A678 80039A78 2442FFFF */  addiu      $v0, $v0, -1
/* 3A67C 80039A7C 0043001A */  div        $zero, $v0, $v1
/* 3A680 80039A80 2415FF74 */  addiu      $s5, $zero, -0x8c
.L80039A84:
/* 3A684 80039A84 00002010 */  mfhi       $a0
/* 3A688 80039A88 50600001 */  beql       $v1, $zero, .L80039A90
/* 3A68C 80039A8C 000001CD */   break     0, 7
.L80039A90:
/* 3A690 80039A90 309400FF */   andi      $s4, $a0, 0xff
/* 3A694 80039A94 24040050 */  addiu      $a0, $zero, 0x50
/* 3A698 80039A98 00148080 */  sll        $s0, $s4, 2
/* 3A69C 80039A9C 2671007C */  addiu      $s1, $s3, 0x7c
/* 3A6A0 80039AA0 02308021 */  addu       $s0, $s1, $s0
/* 3A6A4 80039AA4 24020014 */  addiu      $v0, $zero, 0x14
/* 3A6A8 80039AA8 8E030000 */  lw         $v1, ($s0)
/* 3A6AC 80039AAC 00551023 */  subu       $v0, $v0, $s5
/* 3A6B0 80039AB0 0C026259 */  jal        passToMalloc
/* 3A6B4 80039AB4 A4620060 */   sh        $v0, 0x60($v1)
/* 3A6B8 80039AB8 00402021 */  addu       $a0, $v0, $zero
/* 3A6BC 80039ABC 24070014 */  addiu      $a3, $zero, 0x14
/* 3A6C0 80039AC0 3C12800F */  lui        $s2, %hi(double_array_0)
/* 3A6C4 80039AC4 92620084 */  lbu        $v0, 0x84($s3)
/* 3A6C8 80039AC8 26525110 */  addiu      $s2, $s2, %lo(double_array_0)
/* 3A6CC 80039ACC AFB20010 */  sw         $s2, 0x10($sp)
/* 3A6D0 80039AD0 8E050000 */  lw         $a1, ($s0)
/* 3A6D4 80039AD4 00021080 */  sll        $v0, $v0, 2
/* 3A6D8 80039AD8 02221021 */  addu       $v0, $s1, $v0
/* 3A6DC 80039ADC 8C460000 */  lw         $a2, ($v0)
/* 3A6E0 80039AE0 24A50060 */  addiu      $a1, $a1, 0x60
/* 3A6E4 80039AE4 0C035A50 */  jal        func_800D6940
/* 3A6E8 80039AE8 24C60060 */   addiu     $a2, $a2, 0x60
/* 3A6EC 80039AEC 26700090 */  addiu      $s0, $s3, 0x90
/* 3A6F0 80039AF0 02002021 */  addu       $a0, $s0, $zero
/* 3A6F4 80039AF4 0C035923 */  jal        func_800D648C
/* 3A6F8 80039AF8 00402821 */   addu      $a1, $v0, $zero
/* 3A6FC 80039AFC 0C026259 */  jal        passToMalloc
/* 3A700 80039B00 24040050 */   addiu     $a0, $zero, 0x50
/* 3A704 80039B04 00402021 */  addu       $a0, $v0, $zero
/* 3A708 80039B08 92620084 */  lbu        $v0, 0x84($s3)
/* 3A70C 80039B0C 27A60018 */  addiu      $a2, $sp, 0x18
/* 3A710 80039B10 00021080 */  sll        $v0, $v0, 2
/* 3A714 80039B14 02228821 */  addu       $s1, $s1, $v0
/* 3A718 80039B18 8E250000 */  lw         $a1, ($s1)
/* 3A71C 80039B1C 24070014 */  addiu      $a3, $zero, 0x14
/* 3A720 80039B20 94A20060 */  lhu        $v0, 0x60($a1)
/* 3A724 80039B24 24A50060 */  addiu      $a1, $a1, 0x60
/* 3A728 80039B28 AFB20010 */  sw         $s2, 0x10($sp)
/* 3A72C 80039B2C 02A21021 */  addu       $v0, $s5, $v0
/* 3A730 80039B30 0C035A50 */  jal        func_800D6940
/* 3A734 80039B34 A7A20018 */   sh        $v0, 0x18($sp)
/* 3A738 80039B38 02002021 */  addu       $a0, $s0, $zero
/* 3A73C 80039B3C 0C035923 */  jal        func_800D648C
/* 3A740 80039B40 00402821 */   addu      $a1, $v0, $zero
/* 3A744 80039B44 02602021 */  addu       $a0, $s3, $zero
/* 3A748 80039B48 0C00E5B2 */  jal        func_800396C8
/* 3A74C 80039B4C A2740084 */   sb        $s4, 0x84($s3)
/* 3A750 80039B50 0C00E6DF */  jal        func_80039B7C
/* 3A754 80039B54 02602021 */   addu      $a0, $s3, $zero
/* 3A758 80039B58 8FBF0038 */  lw         $ra, 0x38($sp)
.L80039B5C:
/* 3A75C 80039B5C 8FB50034 */  lw         $s5, 0x34($sp)
/* 3A760 80039B60 8FB40030 */  lw         $s4, 0x30($sp)
/* 3A764 80039B64 8FB3002C */  lw         $s3, 0x2c($sp)
/* 3A768 80039B68 8FB20028 */  lw         $s2, 0x28($sp)
/* 3A76C 80039B6C 8FB10024 */  lw         $s1, 0x24($sp)
/* 3A770 80039B70 8FB00020 */  lw         $s0, 0x20($sp)
/* 3A774 80039B74 03E00008 */  jr         $ra
/* 3A778 80039B78 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80039B7C
/* 3A77C 80039B7C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3A780 80039B80 AFB20020 */  sw         $s2, 0x20($sp)
/* 3A784 80039B84 00809021 */  addu       $s2, $a0, $zero
/* 3A788 80039B88 AFBF0024 */  sw         $ra, 0x24($sp)
/* 3A78C 80039B8C AFB1001C */  sw         $s1, 0x1c($sp)
/* 3A790 80039B90 AFB00018 */  sw         $s0, 0x18($sp)
/* 3A794 80039B94 8E4300B4 */  lw         $v1, 0xb4($s2)
/* 3A798 80039B98 90620090 */  lbu        $v0, 0x90($v1)
/* 3A79C 80039B9C 00021080 */  sll        $v0, $v0, 2
/* 3A7A0 80039BA0 00621821 */  addu       $v1, $v1, $v0
/* 3A7A4 80039BA4 92420084 */  lbu        $v0, 0x84($s2)
/* 3A7A8 80039BA8 8C64007C */  lw         $a0, 0x7c($v1)
/* 3A7AC 80039BAC 00021080 */  sll        $v0, $v0, 2
/* 3A7B0 80039BB0 02421021 */  addu       $v0, $s2, $v0
/* 3A7B4 80039BB4 8C860080 */  lw         $a2, 0x80($a0)
/* 3A7B8 80039BB8 8C43007C */  lw         $v1, 0x7c($v0)
/* 3A7BC 80039BBC 8CC70078 */  lw         $a3, 0x78($a2)
/* 3A7C0 80039BC0 8C650080 */  lw         $a1, 0x80($v1)
/* 3A7C4 80039BC4 84E40078 */  lh         $a0, 0x78($a3)
/* 3A7C8 80039BC8 8CE2007C */  lw         $v0, 0x7c($a3)
/* 3A7CC 80039BCC 8CB10040 */  lw         $s1, 0x40($a1)
/* 3A7D0 80039BD0 0040F809 */  jalr       $v0
/* 3A7D4 80039BD4 00C42021 */   addu      $a0, $a2, $a0
/* 3A7D8 80039BD8 00408021 */  addu       $s0, $v0, $zero
/* 3A7DC 80039BDC 1200000F */  beqz       $s0, .L80039C1C
/* 3A7E0 80039BE0 24050082 */   addiu     $a1, $zero, 0x82
/* 3A7E4 80039BE4 240200FF */  addiu      $v0, $zero, 0xff
/* 3A7E8 80039BE8 8E030078 */  lw         $v1, 0x78($s0)
/* 3A7EC 80039BEC 24060050 */  addiu      $a2, $zero, 0x50
/* 3A7F0 80039BF0 84640048 */  lh         $a0, 0x48($v1)
/* 3A7F4 80039BF4 24070050 */  addiu      $a3, $zero, 0x50
/* 3A7F8 80039BF8 AFA20010 */  sw         $v0, 0x10($sp)
/* 3A7FC 80039BFC 8C62004C */  lw         $v0, 0x4c($v1)
/* 3A800 80039C00 0040F809 */  jalr       $v0
/* 3A804 80039C04 02042021 */   addu      $a0, $s0, $a0
/* 3A808 80039C08 8E030078 */  lw         $v1, 0x78($s0)
/* 3A80C 80039C0C 84640028 */  lh         $a0, 0x28($v1)
/* 3A810 80039C10 8C62002C */  lw         $v0, 0x2c($v1)
/* 3A814 80039C14 0040F809 */  jalr       $v0
/* 3A818 80039C18 02042021 */   addu      $a0, $s0, $a0
.L80039C1C:
/* 3A81C 80039C1C 96220020 */  lhu        $v0, 0x20($s1)
/* 3A820 80039C20 54400008 */  bnel       $v0, $zero, .L80039C44
/* 3A824 80039C24 8E4500B4 */   lw        $a1, 0xb4($s2)
/* 3A828 80039C28 8E4300B4 */  lw         $v1, 0xb4($s2)
/* 3A82C 80039C2C 90620090 */  lbu        $v0, 0x90($v1)
/* 3A830 80039C30 00021080 */  sll        $v0, $v0, 2
/* 3A834 80039C34 00621821 */  addu       $v1, $v1, $v0
/* 3A838 80039C38 8C64007C */  lw         $a0, 0x7c($v1)
/* 3A83C 80039C3C 0800E71B */  j          .L80039C6C
/* 3A840 80039C40 3405FFFF */   ori       $a1, $zero, 0xffff
.L80039C44:
/* 3A844 80039C44 90A20090 */  lbu        $v0, 0x90($a1)
/* 3A848 80039C48 9623001E */  lhu        $v1, 0x1e($s1)
/* 3A84C 80039C4C 00021080 */  sll        $v0, $v0, 2
/* 3A850 80039C50 00A22821 */  addu       $a1, $a1, $v0
/* 3A854 80039C54 8E220018 */  lw         $v0, 0x18($s1)
/* 3A858 80039C58 00031880 */  sll        $v1, $v1, 2
/* 3A85C 80039C5C 00621821 */  addu       $v1, $v1, $v0
/* 3A860 80039C60 8C660000 */  lw         $a2, ($v1)
/* 3A864 80039C64 8CA4007C */  lw         $a0, 0x7c($a1)
/* 3A868 80039C68 94C5005E */  lhu        $a1, 0x5e($a2)
.L80039C6C:
/* 3A86C 80039C6C 0C00DF55 */  jal        func_80037D54
/* 3A870 80039C70 00000000 */   nop
/* 3A874 80039C74 8FBF0024 */  lw         $ra, 0x24($sp)
/* 3A878 80039C78 8FB20020 */  lw         $s2, 0x20($sp)
/* 3A87C 80039C7C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3A880 80039C80 8FB00018 */  lw         $s0, 0x18($sp)
/* 3A884 80039C84 03E00008 */  jr         $ra
/* 3A888 80039C88 27BD0028 */   addiu     $sp, $sp, 0x28

glabel ret12_80039c8c
/* 3A88C 80039C8C 03E00008 */  jr         $ra
/* 3A890 80039C90 2402000C */   addiu     $v0, $zero, 0xc
/* 3A894 80039C94 00000000 */  nop
/* 3A898 80039C98 00000000 */  nop
/* 3A89C 80039C9C 00000000 */  nop
