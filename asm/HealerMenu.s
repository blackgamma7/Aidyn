.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel MakeHealerMenu
/* 4DC0 800041C0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4DC4 800041C4 AFB10014 */  sw         $s1, 0x14($sp)
/* 4DC8 800041C8 3C11800E */  lui        $s1, %hi(healermenu_widget)
/* 4DCC 800041CC 8E2261A0 */  lw         $v0, %lo(healermenu_widget)($s1)
/* 4DD0 800041D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4DD4 800041D4 00808021 */  addu       $s0, $a0, $zero
/* 4DD8 800041D8 10400006 */  beqz       $v0, .L800041F4
/* 4DDC 800041DC AFBF0018 */   sw        $ra, 0x18($sp)
/* 4DE0 800041E0 3C04800D */  lui        $a0, %hi(D_800D74D0)
/* 4DE4 800041E4 248474D0 */  addiu      $a0, $a0, %lo(D_800D74D0)
/* 4DE8 800041E8 3C05800D */  lui        $a1, %hi(D_800D74F8)
/* 4DEC 800041EC 0C025F2D */  jal        manualCrash
/* 4DF0 800041F0 24A574F8 */   addiu     $a1, $a1, %lo(D_800D74F8)
.L800041F4:
/* 4DF4 800041F4 0C026259 */  jal        passToMalloc
/* 4DF8 800041F8 24040088 */   addiu     $a0, $zero, 0x88
/* 4DFC 800041FC 00402021 */  addu       $a0, $v0, $zero
/* 4E00 80004200 0C0010D4 */  jal        func_80004350
/* 4E04 80004204 02002821 */   addu      $a1, $s0, $zero
/* 4E08 80004208 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 4E0C 8000420C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 4E10 80004210 00402821 */  addu       $a1, $v0, $zero
/* 4E14 80004214 0C02DC7C */  jal        widgetHandler
/* 4E18 80004218 AE2261A0 */   sw        $v0, 0x61a0($s1)
/* 4E1C 8000421C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4E20 80004220 8FB10014 */  lw         $s1, 0x14($sp)
/* 4E24 80004224 8FB00010 */  lw         $s0, 0x10($sp)
/* 4E28 80004228 03E00008 */  jr         $ra
/* 4E2C 8000422C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80004230
/* 4E30 80004230 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4E34 80004234 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4E38 80004238 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E3C 8000423C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E40 80004240 0C00118A */  jal        lay_on_hands_func
/* 4E44 80004244 00000000 */   nop
/* 4E48 80004248 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E4C 8000424C 00001021 */  addu       $v0, $zero, $zero
/* 4E50 80004250 03E00008 */  jr         $ra
/* 4E54 80004254 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80004258
/* 4E58 80004258 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4E5C 8000425C 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4E60 80004260 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E64 80004264 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E68 80004268 0C0011FF */  jal        heal_with_herbs_func
/* 4E6C 8000426C 00000000 */   nop
/* 4E70 80004270 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E74 80004274 00001021 */  addu       $v0, $zero, $zero
/* 4E78 80004278 03E00008 */  jr         $ra
/* 4E7C 8000427C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80004280
/* 4E80 80004280 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4E84 80004284 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4E88 80004288 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E8C 8000428C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E90 80004290 0C001272 */  jal        restore_func
/* 4E94 80004294 00000000 */   nop
/* 4E98 80004298 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E9C 8000429C 00001021 */  addu       $v0, $zero, $zero
/* 4EA0 800042A0 03E00008 */  jr         $ra
/* 4EA4 800042A4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800042A8
/* 4EA8 800042A8 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4EAC 800042AC 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4EB0 800042B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4EB4 800042B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4EB8 800042B8 0C001370 */  jal        passto_healing_func
/* 4EBC 800042BC 94A5005E */   lhu       $a1, 0x5e($a1)
/* 4EC0 800042C0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4EC4 800042C4 00001021 */  addu       $v0, $zero, $zero
/* 4EC8 800042C8 03E00008 */  jr         $ra
/* 4ECC 800042CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800042D0
/* 4ED0 800042D0 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4ED4 800042D4 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4ED8 800042D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4EDC 800042DC AFBF0010 */  sw         $ra, 0x10($sp)
/* 4EE0 800042E0 0C001380 */  jal        passTo_party_healing_func
/* 4EE4 800042E4 94A5005E */   lhu       $a1, 0x5e($a1)
/* 4EE8 800042E8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4EEC 800042EC 00001021 */  addu       $v0, $zero, $zero
/* 4EF0 800042F0 03E00008 */  jr         $ra
/* 4EF4 800042F4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800042F8
/* 4EF8 800042F8 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4EFC 800042FC 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4F00 80004300 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4F04 80004304 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4F08 80004308 0C001390 */  jal        func_80004E40
/* 4F0C 8000430C 94A5005E */   lhu       $a1, 0x5e($a1)
/* 4F10 80004310 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4F14 80004314 00001021 */  addu       $v0, $zero, $zero
/* 4F18 80004318 03E00008 */  jr         $ra
/* 4F1C 8000431C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80004320
/* 4F20 80004320 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4F24 80004324 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 4F28 80004328 8C4461A0 */  lw         $a0, %lo(healermenu_widget)($v0)
/* 4F2C 8000432C 00A01821 */  addu       $v1, $a1, $zero
/* 4F30 80004330 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4F34 80004334 9465005E */  lhu        $a1, 0x5e($v1)
/* 4F38 80004338 0C001401 */  jal        passto_some_healing_func
/* 4F3C 8000433C 9066005C */   lbu       $a2, 0x5c($v1)
/* 4F40 80004340 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4F44 80004344 00001021 */  addu       $v0, $zero, $zero
/* 4F48 80004348 03E00008 */  jr         $ra
/* 4F4C 8000434C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80004350
/* 4F50 80004350 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 4F54 80004354 AFB1003C */  sw         $s1, 0x3c($sp)
/* 4F58 80004358 00808821 */  addu       $s1, $a0, $zero
/* 4F5C 8000435C AFBF004C */  sw         $ra, 0x4c($sp)
/* 4F60 80004360 AFB40048 */  sw         $s4, 0x48($sp)
/* 4F64 80004364 AFB30044 */  sw         $s3, 0x44($sp)
/* 4F68 80004368 AFB20040 */  sw         $s2, 0x40($sp)
/* 4F6C 8000436C 0C017B7E */  jal        widget_left_side_menu_skill
/* 4F70 80004370 AFB00038 */   sw        $s0, 0x38($sp)
/* 4F74 80004374 02202021 */  addu       $a0, $s1, $zero
/* 4F78 80004378 24060017 */  addiu      $a2, $zero, 0x17
/* 4F7C 8000437C 24070046 */  addiu      $a3, $zero, 0x46
/* 4F80 80004380 24140082 */  addiu      $s4, $zero, 0x82
/* 4F84 80004384 24100050 */  addiu      $s0, $zero, 0x50
/* 4F88 80004388 3C12800E */  lui        $s2, %hi(gGlobals)
/* 4F8C 8000438C 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 4F90 80004390 241300FF */  addiu      $s3, $zero, 0xff
/* 4F94 80004394 AFB40010 */  sw         $s4, 0x10($sp)
/* 4F98 80004398 AFB00014 */  sw         $s0, 0x14($sp)
/* 4F9C 8000439C AFB00018 */  sw         $s0, 0x18($sp)
/* 4FA0 800043A0 8E43204C */  lw         $v1, 0x204c($s2)
/* 4FA4 800043A4 3C02800D */  lui        $v0, %hi(widget_methods_healer)
/* 4FA8 800043A8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4FAC 800043AC 8C650744 */  lw         $a1, 0x744($v1)
/* 4FB0 800043B0 24427508 */  addiu      $v0, $v0, %lo(widget_methods_healer)
/* 4FB4 800043B4 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 4FB8 800043B8 AE220078 */   sw        $v0, 0x78($s1)
/* 4FBC 800043BC 8C430078 */  lw         $v1, 0x78($v0)
/* 4FC0 800043C0 AE220084 */  sw         $v0, 0x84($s1)
/* 4FC4 800043C4 84640018 */  lh         $a0, 0x18($v1)
/* 4FC8 800043C8 8C65001C */  lw         $a1, 0x1c($v1)
/* 4FCC 800043CC 00A0F809 */  jalr       $a1
/* 4FD0 800043D0 00442021 */   addu      $a0, $v0, $a0
/* 4FD4 800043D4 00021042 */  srl        $v0, $v0, 1
/* 4FD8 800043D8 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4FDC 800043DC 8E240084 */  lw         $a0, 0x84($s1)
/* 4FE0 800043E0 2405005D */  addiu      $a1, $zero, 0x5d
/* 4FE4 800043E4 84860062 */  lh         $a2, 0x62($a0)
/* 4FE8 800043E8 0C02DD3F */  jal        set_widget_coords
/* 4FEC 800043EC 00A22823 */   subu      $a1, $a1, $v0
/* 4FF0 800043F0 8E250084 */  lw         $a1, 0x84($s1)
/* 4FF4 800043F4 8CA30078 */  lw         $v1, 0x78($a1)
/* 4FF8 800043F8 84640020 */  lh         $a0, 0x20($v1)
/* 4FFC 800043FC 8C620024 */  lw         $v0, 0x24($v1)
/* 5000 80004400 0040F809 */  jalr       $v0
/* 5004 80004404 00A42021 */   addu      $a0, $a1, $a0
/* 5008 80004408 02202021 */  addu       $a0, $s1, $zero
/* 500C 8000440C 24050003 */  addiu      $a1, $zero, 3
/* 5010 80004410 24060017 */  addiu      $a2, $zero, 0x17
/* 5014 80004414 24420046 */  addiu      $v0, $v0, 0x46
/* 5018 80004418 00021400 */  sll        $v0, $v0, 0x10
/* 501C 8000441C 00021403 */  sra        $v0, $v0, 0x10
/* 5020 80004420 3048FFFF */  andi       $t0, $v0, 0xffff
/* 5024 80004424 01003821 */  addu       $a3, $t0, $zero
/* 5028 80004428 24030017 */  addiu      $v1, $zero, 0x17
/* 502C 8000442C AFA30010 */  sw         $v1, 0x10($sp)
/* 5030 80004430 240300A3 */  addiu      $v1, $zero, 0xa3
/* 5034 80004434 24420075 */  addiu      $v0, $v0, 0x75
/* 5038 80004438 3042FFFF */  andi       $v0, $v0, 0xffff
/* 503C 8000443C AFA80014 */  sw         $t0, 0x14($sp)
/* 5040 80004440 AFA30018 */  sw         $v1, 0x18($sp)
/* 5044 80004444 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5048 80004448 AFB40020 */  sw         $s4, 0x20($sp)
/* 504C 8000444C AFB00024 */  sw         $s0, 0x24($sp)
/* 5050 80004450 AFB00028 */  sw         $s0, 0x28($sp)
/* 5054 80004454 AFB3002C */  sw         $s3, 0x2c($sp)
/* 5058 80004458 0C02F435 */  jal        widgetscrollmenu_init_2
/* 505C 8000445C AFA00030 */   sw        $zero, 0x30($sp)
/* 5060 80004460 00402021 */  addu       $a0, $v0, $zero
/* 5064 80004464 24050044 */  addiu      $a1, $zero, 0x44
/* 5068 80004468 2406002A */  addiu      $a2, $zero, 0x2a
/* 506C 8000446C 24070022 */  addiu      $a3, $zero, 0x22
/* 5070 80004470 AE220080 */  sw         $v0, 0x80($s1)
/* 5074 80004474 24020097 */  addiu      $v0, $zero, 0x97
/* 5078 80004478 2403008D */  addiu      $v1, $zero, 0x8d
/* 507C 8000447C AFA20014 */  sw         $v0, 0x14($sp)
/* 5080 80004480 240200BF */  addiu      $v0, $zero, 0xbf
/* 5084 80004484 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5088 80004488 24020014 */  addiu      $v0, $zero, 0x14
/* 508C 8000448C AFB30010 */  sw         $s3, 0x10($sp)
/* 5090 80004490 AFA30018 */  sw         $v1, 0x18($sp)
/* 5094 80004494 AFB30020 */  sw         $s3, 0x20($sp)
/* 5098 80004498 0C02F085 */  jal        set_widgetSubstruct8
/* 509C 8000449C AFA20024 */   sw        $v0, 0x24($sp)
/* 50A0 800044A0 0C026259 */  jal        passToMalloc
/* 50A4 800044A4 2404007C */   addiu     $a0, $zero, 0x7c
/* 50A8 800044A8 8E43204C */  lw         $v1, 0x204c($s2)
/* 50AC 800044AC 8C640748 */  lw         $a0, 0x748($v1)
/* 50B0 800044B0 0C03353E */  jal        strlen
/* 50B4 800044B4 00408021 */   addu      $s0, $v0, $zero
/* 50B8 800044B8 02002021 */  addu       $a0, $s0, $zero
/* 50BC 800044BC 8E43204C */  lw         $v1, 0x204c($s2)
/* 50C0 800044C0 24420001 */  addiu      $v0, $v0, 1
/* 50C4 800044C4 8C650748 */  lw         $a1, 0x748($v1)
/* 50C8 800044C8 0C02E3A0 */  jal        widgettext_func_2
/* 50CC 800044CC 3046FFFF */   andi      $a2, $v0, 0xffff
/* 50D0 800044D0 00408021 */  addu       $s0, $v0, $zero
/* 50D4 800044D4 8E240080 */  lw         $a0, 0x80($s1)
/* 50D8 800044D8 0C02E885 */  jal        link_widget_text
/* 50DC 800044DC 02002821 */   addu      $a1, $s0, $zero
/* 50E0 800044E0 2404007C */  addiu      $a0, $zero, 0x7c
/* 50E4 800044E4 3C028000 */  lui        $v0, %hi(func_80004230)
/* 50E8 800044E8 24424230 */  addiu      $v0, $v0, %lo(func_80004230)
/* 50EC 800044EC 0C026259 */  jal        passToMalloc
/* 50F0 800044F0 AE020018 */   sw        $v0, 0x18($s0)
/* 50F4 800044F4 8E43204C */  lw         $v1, 0x204c($s2)
/* 50F8 800044F8 8C64074C */  lw         $a0, 0x74c($v1)
/* 50FC 800044FC 0C03353E */  jal        strlen
/* 5100 80004500 00408021 */   addu      $s0, $v0, $zero
/* 5104 80004504 02002021 */  addu       $a0, $s0, $zero
/* 5108 80004508 8E43204C */  lw         $v1, 0x204c($s2)
/* 510C 8000450C 24420001 */  addiu      $v0, $v0, 1
/* 5110 80004510 8C65074C */  lw         $a1, 0x74c($v1)
/* 5114 80004514 0C02E3A0 */  jal        widgettext_func_2
/* 5118 80004518 3046FFFF */   andi      $a2, $v0, 0xffff
/* 511C 8000451C 00408021 */  addu       $s0, $v0, $zero
/* 5120 80004520 8E240080 */  lw         $a0, 0x80($s1)
/* 5124 80004524 0C02E885 */  jal        link_widget_text
/* 5128 80004528 02002821 */   addu      $a1, $s0, $zero
/* 512C 8000452C 2404007C */  addiu      $a0, $zero, 0x7c
/* 5130 80004530 3C028000 */  lui        $v0, %hi(func_80004258)
/* 5134 80004534 24424258 */  addiu      $v0, $v0, %lo(func_80004258)
/* 5138 80004538 0C026259 */  jal        passToMalloc
/* 513C 8000453C AE020018 */   sw        $v0, 0x18($s0)
/* 5140 80004540 8E43204C */  lw         $v1, 0x204c($s2)
/* 5144 80004544 8C640750 */  lw         $a0, 0x750($v1)
/* 5148 80004548 0C03353E */  jal        strlen
/* 514C 8000454C 00408021 */   addu      $s0, $v0, $zero
/* 5150 80004550 02002021 */  addu       $a0, $s0, $zero
/* 5154 80004554 8E43204C */  lw         $v1, 0x204c($s2)
/* 5158 80004558 24420001 */  addiu      $v0, $v0, 1
/* 515C 8000455C 8C650750 */  lw         $a1, 0x750($v1)
/* 5160 80004560 0C02E3A0 */  jal        widgettext_func_2
/* 5164 80004564 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5168 80004568 00408021 */  addu       $s0, $v0, $zero
/* 516C 8000456C 8E240080 */  lw         $a0, 0x80($s1)
/* 5170 80004570 0C02E885 */  jal        link_widget_text
/* 5174 80004574 02002821 */   addu      $a1, $s0, $zero
/* 5178 80004578 02201021 */  addu       $v0, $s1, $zero
/* 517C 8000457C 3C038000 */  lui        $v1, 0x8000
/* 5180 80004580 8FBF004C */  lw         $ra, 0x4c($sp)
/* 5184 80004584 8FB40048 */  lw         $s4, 0x48($sp)
/* 5188 80004588 8FB30044 */  lw         $s3, 0x44($sp)
/* 518C 8000458C 8FB20040 */  lw         $s2, 0x40($sp)
/* 5190 80004590 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5194 80004594 24634280 */  addiu      $v1, $v1, 0x4280
/* 5198 80004598 AE030018 */  sw         $v1, 0x18($s0)
/* 519C 8000459C 8FB00038 */  lw         $s0, 0x38($sp)
/* 51A0 800045A0 03E00008 */  jr         $ra
/* 51A4 800045A4 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_800045A8
/* 51A8 800045A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 51AC 800045AC 00801021 */  addu       $v0, $a0, $zero
/* 51B0 800045B0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 51B4 800045B4 8C440080 */  lw         $a0, 0x80($v0)
/* 51B8 800045B8 5080000D */  beql       $a0, $zero, .L800045F0
/* 51BC 800045BC 00402021 */   addu      $a0, $v0, $zero
/* 51C0 800045C0 0C02F031 */  jal        func_800BC0C4
/* 51C4 800045C4 00000000 */   nop
/* 51C8 800045C8 00402821 */  addu       $a1, $v0, $zero
/* 51CC 800045CC 10A0000B */  beqz       $a1, .L800045FC
/* 51D0 800045D0 00001021 */   addu      $v0, $zero, $zero
/* 51D4 800045D4 8CA30078 */  lw         $v1, 0x78($a1)
/* 51D8 800045D8 84640078 */  lh         $a0, 0x78($v1)
/* 51DC 800045DC 8C62007C */  lw         $v0, 0x7c($v1)
/* 51E0 800045E0 0040F809 */  jalr       $v0
/* 51E4 800045E4 00A42021 */   addu      $a0, $a1, $a0
/* 51E8 800045E8 0800117F */  j          .L800045FC
/* 51EC 800045EC 00001021 */   addu      $v0, $zero, $zero
.L800045F0:
/* 51F0 800045F0 0C02DEC8 */  jal        set_widgets_byte0x70
/* 51F4 800045F4 24050005 */   addiu     $a1, $zero, 5
/* 51F8 800045F8 00001021 */  addu       $v0, $zero, $zero
.L800045FC:
/* 51FC 800045FC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5200 80004600 03E00008 */  jr         $ra
/* 5204 80004604 27BD0018 */   addiu     $sp, $sp, 0x18

glabel healer_menu_clear
/* 5208 80004608 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 520C 8000460C 3C02800E */  lui        $v0, %hi(healermenu_widget)
/* 5210 80004610 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5214 80004614 0C017BDC */  jal        close_menu
/* 5218 80004618 AC4061A0 */   sw        $zero, %lo(healermenu_widget)($v0)
/* 521C 8000461C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5220 80004620 03E00008 */  jr         $ra
/* 5224 80004624 27BD0018 */   addiu     $sp, $sp, 0x18

glabel lay_on_hands_func
/* 5228 80004628 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 522C 8000462C AFB5004C */  sw         $s5, 0x4c($sp)
/* 5230 80004630 0080A821 */  addu       $s5, $a0, $zero
/* 5234 80004634 AFBF0054 */  sw         $ra, 0x54($sp)
/* 5238 80004638 AFB60050 */  sw         $s6, 0x50($sp)
/* 523C 8000463C AFB40048 */  sw         $s4, 0x48($sp)
/* 5240 80004640 AFB30044 */  sw         $s3, 0x44($sp)
/* 5244 80004644 AFB20040 */  sw         $s2, 0x40($sp)
/* 5248 80004648 AFB1003C */  sw         $s1, 0x3c($sp)
/* 524C 8000464C 0C001412 */  jal        func_80005048
/* 5250 80004650 AFB00038 */   sw        $s0, 0x38($sp)
/* 5254 80004654 02A02021 */  addu       $a0, $s5, $zero
/* 5258 80004658 24060017 */  addiu      $a2, $zero, 0x17
/* 525C 8000465C 24130082 */  addiu      $s3, $zero, 0x82
/* 5260 80004660 24110050 */  addiu      $s1, $zero, 0x50
/* 5264 80004664 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5268 80004668 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 526C 8000466C AFB30010 */  sw         $s3, 0x10($sp)
/* 5270 80004670 AFB10014 */  sw         $s1, 0x14($sp)
/* 5274 80004674 AFB10018 */  sw         $s1, 0x18($sp)
/* 5278 80004678 8E02204C */  lw         $v0, 0x204c($s0)
/* 527C 8000467C 241200FF */  addiu      $s2, $zero, 0xff
/* 5280 80004680 AFB2001C */  sw         $s2, 0x1c($sp)
/* 5284 80004684 8C450748 */  lw         $a1, 0x748($v0)
/* 5288 80004688 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 528C 8000468C 24070046 */   addiu     $a3, $zero, 0x46
/* 5290 80004690 8C430078 */  lw         $v1, 0x78($v0)
/* 5294 80004694 AEA20084 */  sw         $v0, 0x84($s5)
/* 5298 80004698 84640018 */  lh         $a0, 0x18($v1)
/* 529C 8000469C 8C65001C */  lw         $a1, 0x1c($v1)
/* 52A0 800046A0 00A0F809 */  jalr       $a1
/* 52A4 800046A4 00442021 */   addu      $a0, $v0, $a0
/* 52A8 800046A8 0000A021 */  addu       $s4, $zero, $zero
/* 52AC 800046AC 00021042 */  srl        $v0, $v0, 1
/* 52B0 800046B0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 52B4 800046B4 8EA40084 */  lw         $a0, 0x84($s5)
/* 52B8 800046B8 2405005D */  addiu      $a1, $zero, 0x5d
/* 52BC 800046BC 84860062 */  lh         $a2, 0x62($a0)
/* 52C0 800046C0 0C02DD3F */  jal        set_widget_coords
/* 52C4 800046C4 00A22823 */   subu      $a1, $a1, $v0
/* 52C8 800046C8 8EA50084 */  lw         $a1, 0x84($s5)
/* 52CC 800046CC 0200B021 */  addu       $s6, $s0, $zero
/* 52D0 800046D0 8CA30078 */  lw         $v1, 0x78($a1)
/* 52D4 800046D4 3C108000 */  lui        $s0, 0x8000
/* 52D8 800046D8 84640020 */  lh         $a0, 0x20($v1)
/* 52DC 800046DC 8C620024 */  lw         $v0, 0x24($v1)
/* 52E0 800046E0 0040F809 */  jalr       $v0
/* 52E4 800046E4 00A42021 */   addu      $a0, $a1, $a0
/* 52E8 800046E8 02A02021 */  addu       $a0, $s5, $zero
/* 52EC 800046EC 24050004 */  addiu      $a1, $zero, 4
/* 52F0 800046F0 24060017 */  addiu      $a2, $zero, 0x17
/* 52F4 800046F4 24420046 */  addiu      $v0, $v0, 0x46
/* 52F8 800046F8 00021400 */  sll        $v0, $v0, 0x10
/* 52FC 800046FC 00021403 */  sra        $v0, $v0, 0x10
/* 5300 80004700 3048FFFF */  andi       $t0, $v0, 0xffff
/* 5304 80004704 01003821 */  addu       $a3, $t0, $zero
/* 5308 80004708 24030017 */  addiu      $v1, $zero, 0x17
/* 530C 8000470C AFA30010 */  sw         $v1, 0x10($sp)
/* 5310 80004710 240300A3 */  addiu      $v1, $zero, 0xa3
/* 5314 80004714 24420075 */  addiu      $v0, $v0, 0x75
/* 5318 80004718 3042FFFF */  andi       $v0, $v0, 0xffff
/* 531C 8000471C AFA80014 */  sw         $t0, 0x14($sp)
/* 5320 80004720 AFA30018 */  sw         $v1, 0x18($sp)
/* 5324 80004724 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5328 80004728 AFB30020 */  sw         $s3, 0x20($sp)
/* 532C 8000472C AFB10024 */  sw         $s1, 0x24($sp)
/* 5330 80004730 AFB10028 */  sw         $s1, 0x28($sp)
/* 5334 80004734 AFB2002C */  sw         $s2, 0x2c($sp)
/* 5338 80004738 0C02F435 */  jal        widgetscrollmenu_init_2
/* 533C 8000473C AFA00030 */   sw        $zero, 0x30($sp)
/* 5340 80004740 00402021 */  addu       $a0, $v0, $zero
/* 5344 80004744 24050044 */  addiu      $a1, $zero, 0x44
/* 5348 80004748 2406002A */  addiu      $a2, $zero, 0x2a
/* 534C 8000474C 24070022 */  addiu      $a3, $zero, 0x22
/* 5350 80004750 AEA20080 */  sw         $v0, 0x80($s5)
/* 5354 80004754 24020097 */  addiu      $v0, $zero, 0x97
/* 5358 80004758 2403008D */  addiu      $v1, $zero, 0x8d
/* 535C 8000475C AFA20014 */  sw         $v0, 0x14($sp)
/* 5360 80004760 240200BF */  addiu      $v0, $zero, 0xbf
/* 5364 80004764 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5368 80004768 24020014 */  addiu      $v0, $zero, 0x14
/* 536C 8000476C AFB20010 */  sw         $s2, 0x10($sp)
/* 5370 80004770 AFA30018 */  sw         $v1, 0x18($sp)
/* 5374 80004774 AFB20020 */  sw         $s2, 0x20($sp)
/* 5378 80004778 0C02F085 */  jal        set_widgetSubstruct8
/* 537C 8000477C AFA20024 */   sw        $v0, 0x24($sp)
/* 5380 80004780 8EC215F8 */  lw         $v0, 0x15f8($s6)
.L80004784:
/* 5384 80004784 00141880 */  sll        $v1, $s4, 2
/* 5388 80004788 00431021 */  addu       $v0, $v0, $v1
/* 538C 8000478C 8C510000 */  lw         $s1, ($v0)
/* 5390 80004790 5220000D */  beql       $s1, $zero, .L800047C8
/* 5394 80004794 26940001 */   addiu     $s4, $s4, 1
/* 5398 80004798 0C01DF1D */  jal        isDead
/* 539C 8000479C 02202021 */   addu      $a0, $s1, $zero
/* 53A0 800047A0 54400009 */  bnel       $v0, $zero, .L800047C8
/* 53A4 800047A4 26940001 */   addiu     $s4, $s4, 1
/* 53A8 800047A8 8EA2007C */  lw         $v0, 0x7c($s5)
/* 53AC 800047AC 12820005 */  beq        $s4, $v0, .L800047C4
/* 53B0 800047B0 02A02021 */   addu      $a0, $s5, $zero
/* 53B4 800047B4 02202821 */  addu       $a1, $s1, $zero
/* 53B8 800047B8 02803021 */  addu       $a2, $s4, $zero
/* 53BC 800047BC 0C0012E5 */  jal        draw_healed_member
/* 53C0 800047C0 260742A8 */   addiu     $a3, $s0, 0x42a8
.L800047C4:
/* 53C4 800047C4 26940001 */  addiu      $s4, $s4, 1
.L800047C8:
/* 53C8 800047C8 2E820004 */  sltiu      $v0, $s4, 4
/* 53CC 800047CC 5440FFED */  bnel       $v0, $zero, .L80004784
/* 53D0 800047D0 8EC215F8 */   lw        $v0, 0x15f8($s6)
/* 53D4 800047D4 8FBF0054 */  lw         $ra, 0x54($sp)
/* 53D8 800047D8 8FB60050 */  lw         $s6, 0x50($sp)
/* 53DC 800047DC 8FB5004C */  lw         $s5, 0x4c($sp)
/* 53E0 800047E0 8FB40048 */  lw         $s4, 0x48($sp)
/* 53E4 800047E4 8FB30044 */  lw         $s3, 0x44($sp)
/* 53E8 800047E8 8FB20040 */  lw         $s2, 0x40($sp)
/* 53EC 800047EC 8FB1003C */  lw         $s1, 0x3c($sp)
/* 53F0 800047F0 8FB00038 */  lw         $s0, 0x38($sp)
/* 53F4 800047F4 03E00008 */  jr         $ra
/* 53F8 800047F8 27BD0058 */   addiu     $sp, $sp, 0x58

glabel heal_with_herbs_func
/* 53FC 800047FC 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 5400 80004800 AFB5004C */  sw         $s5, 0x4c($sp)
/* 5404 80004804 0080A821 */  addu       $s5, $a0, $zero
/* 5408 80004808 AFBF0054 */  sw         $ra, 0x54($sp)
/* 540C 8000480C AFB60050 */  sw         $s6, 0x50($sp)
/* 5410 80004810 AFB40048 */  sw         $s4, 0x48($sp)
/* 5414 80004814 AFB30044 */  sw         $s3, 0x44($sp)
/* 5418 80004818 AFB20040 */  sw         $s2, 0x40($sp)
/* 541C 8000481C AFB1003C */  sw         $s1, 0x3c($sp)
/* 5420 80004820 0C001412 */  jal        func_80005048
/* 5424 80004824 AFB00038 */   sw        $s0, 0x38($sp)
/* 5428 80004828 02A02021 */  addu       $a0, $s5, $zero
/* 542C 8000482C 24060017 */  addiu      $a2, $zero, 0x17
/* 5430 80004830 24130082 */  addiu      $s3, $zero, 0x82
/* 5434 80004834 24110050 */  addiu      $s1, $zero, 0x50
/* 5438 80004838 3C10800E */  lui        $s0, %hi(gGlobals)
/* 543C 8000483C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 5440 80004840 AFB30010 */  sw         $s3, 0x10($sp)
/* 5444 80004844 AFB10014 */  sw         $s1, 0x14($sp)
/* 5448 80004848 AFB10018 */  sw         $s1, 0x18($sp)
/* 544C 8000484C 8E02204C */  lw         $v0, 0x204c($s0)
/* 5450 80004850 241200FF */  addiu      $s2, $zero, 0xff
/* 5454 80004854 AFB2001C */  sw         $s2, 0x1c($sp)
/* 5458 80004858 8C45074C */  lw         $a1, 0x74c($v0)
/* 545C 8000485C 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 5460 80004860 24070046 */   addiu     $a3, $zero, 0x46
/* 5464 80004864 8C430078 */  lw         $v1, 0x78($v0)
/* 5468 80004868 AEA20084 */  sw         $v0, 0x84($s5)
/* 546C 8000486C 84640018 */  lh         $a0, 0x18($v1)
/* 5470 80004870 8C65001C */  lw         $a1, 0x1c($v1)
/* 5474 80004874 00A0F809 */  jalr       $a1
/* 5478 80004878 00442021 */   addu      $a0, $v0, $a0
/* 547C 8000487C 0000A021 */  addu       $s4, $zero, $zero
/* 5480 80004880 00021042 */  srl        $v0, $v0, 1
/* 5484 80004884 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5488 80004888 8EA40084 */  lw         $a0, 0x84($s5)
/* 548C 8000488C 2405005D */  addiu      $a1, $zero, 0x5d
/* 5490 80004890 84860062 */  lh         $a2, 0x62($a0)
/* 5494 80004894 0C02DD3F */  jal        set_widget_coords
/* 5498 80004898 00A22823 */   subu      $a1, $a1, $v0
/* 549C 8000489C 8EA50084 */  lw         $a1, 0x84($s5)
/* 54A0 800048A0 0200B021 */  addu       $s6, $s0, $zero
/* 54A4 800048A4 8CA30078 */  lw         $v1, 0x78($a1)
/* 54A8 800048A8 3C108000 */  lui        $s0, 0x8000
/* 54AC 800048AC 84640020 */  lh         $a0, 0x20($v1)
/* 54B0 800048B0 8C620024 */  lw         $v0, 0x24($v1)
/* 54B4 800048B4 0040F809 */  jalr       $v0
/* 54B8 800048B8 00A42021 */   addu      $a0, $a1, $a0
/* 54BC 800048BC 02A02021 */  addu       $a0, $s5, $zero
/* 54C0 800048C0 24050004 */  addiu      $a1, $zero, 4
/* 54C4 800048C4 24060017 */  addiu      $a2, $zero, 0x17
/* 54C8 800048C8 24420046 */  addiu      $v0, $v0, 0x46
/* 54CC 800048CC 00021400 */  sll        $v0, $v0, 0x10
/* 54D0 800048D0 00021403 */  sra        $v0, $v0, 0x10
/* 54D4 800048D4 3048FFFF */  andi       $t0, $v0, 0xffff
/* 54D8 800048D8 01003821 */  addu       $a3, $t0, $zero
/* 54DC 800048DC 24030017 */  addiu      $v1, $zero, 0x17
/* 54E0 800048E0 AFA30010 */  sw         $v1, 0x10($sp)
/* 54E4 800048E4 240300A3 */  addiu      $v1, $zero, 0xa3
/* 54E8 800048E8 24420075 */  addiu      $v0, $v0, 0x75
/* 54EC 800048EC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 54F0 800048F0 AFA80014 */  sw         $t0, 0x14($sp)
/* 54F4 800048F4 AFA30018 */  sw         $v1, 0x18($sp)
/* 54F8 800048F8 AFA2001C */  sw         $v0, 0x1c($sp)
/* 54FC 800048FC AFB30020 */  sw         $s3, 0x20($sp)
/* 5500 80004900 AFB10024 */  sw         $s1, 0x24($sp)
/* 5504 80004904 AFB10028 */  sw         $s1, 0x28($sp)
/* 5508 80004908 AFB2002C */  sw         $s2, 0x2c($sp)
/* 550C 8000490C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 5510 80004910 AFA00030 */   sw        $zero, 0x30($sp)
/* 5514 80004914 00402021 */  addu       $a0, $v0, $zero
/* 5518 80004918 24050044 */  addiu      $a1, $zero, 0x44
/* 551C 8000491C 2406002A */  addiu      $a2, $zero, 0x2a
/* 5520 80004920 24070022 */  addiu      $a3, $zero, 0x22
/* 5524 80004924 AEA20080 */  sw         $v0, 0x80($s5)
/* 5528 80004928 24020097 */  addiu      $v0, $zero, 0x97
/* 552C 8000492C 2403008D */  addiu      $v1, $zero, 0x8d
/* 5530 80004930 AFA20014 */  sw         $v0, 0x14($sp)
/* 5534 80004934 240200BF */  addiu      $v0, $zero, 0xbf
/* 5538 80004938 AFA2001C */  sw         $v0, 0x1c($sp)
/* 553C 8000493C 24020014 */  addiu      $v0, $zero, 0x14
/* 5540 80004940 AFB20010 */  sw         $s2, 0x10($sp)
/* 5544 80004944 AFA30018 */  sw         $v1, 0x18($sp)
/* 5548 80004948 AFB20020 */  sw         $s2, 0x20($sp)
/* 554C 8000494C 0C02F085 */  jal        set_widgetSubstruct8
/* 5550 80004950 AFA20024 */   sw        $v0, 0x24($sp)
/* 5554 80004954 8EC215F8 */  lw         $v0, 0x15f8($s6)
.L80004958:
/* 5558 80004958 00141880 */  sll        $v1, $s4, 2
/* 555C 8000495C 00431021 */  addu       $v0, $v0, $v1
/* 5560 80004960 8C510000 */  lw         $s1, ($v0)
/* 5564 80004964 5220000B */  beql       $s1, $zero, .L80004994
/* 5568 80004968 26940001 */   addiu     $s4, $s4, 1
/* 556C 8000496C 0C01DF1D */  jal        isDead
/* 5570 80004970 02202021 */   addu      $a0, $s1, $zero
/* 5574 80004974 54400007 */  bnel       $v0, $zero, .L80004994
/* 5578 80004978 26940001 */   addiu     $s4, $s4, 1
/* 557C 8000497C 02A02021 */  addu       $a0, $s5, $zero
/* 5580 80004980 02202821 */  addu       $a1, $s1, $zero
/* 5584 80004984 02803021 */  addu       $a2, $s4, $zero
/* 5588 80004988 0C0012E5 */  jal        draw_healed_member
/* 558C 8000498C 260742D0 */   addiu     $a3, $s0, 0x42d0
/* 5590 80004990 26940001 */  addiu      $s4, $s4, 1
.L80004994:
/* 5594 80004994 2E820004 */  sltiu      $v0, $s4, 4
/* 5598 80004998 5440FFEF */  bnel       $v0, $zero, .L80004958
/* 559C 8000499C 8EC215F8 */   lw        $v0, 0x15f8($s6)
/* 55A0 800049A0 8FBF0054 */  lw         $ra, 0x54($sp)
/* 55A4 800049A4 8FB60050 */  lw         $s6, 0x50($sp)
/* 55A8 800049A8 8FB5004C */  lw         $s5, 0x4c($sp)
/* 55AC 800049AC 8FB40048 */  lw         $s4, 0x48($sp)
/* 55B0 800049B0 8FB30044 */  lw         $s3, 0x44($sp)
/* 55B4 800049B4 8FB20040 */  lw         $s2, 0x40($sp)
/* 55B8 800049B8 8FB1003C */  lw         $s1, 0x3c($sp)
/* 55BC 800049BC 8FB00038 */  lw         $s0, 0x38($sp)
/* 55C0 800049C0 03E00008 */  jr         $ra
/* 55C4 800049C4 27BD0058 */   addiu     $sp, $sp, 0x58

glabel restore_func
/* 55C8 800049C8 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 55CC 800049CC AFB5004C */  sw         $s5, 0x4c($sp)
/* 55D0 800049D0 0080A821 */  addu       $s5, $a0, $zero
/* 55D4 800049D4 AFBF0054 */  sw         $ra, 0x54($sp)
/* 55D8 800049D8 AFB60050 */  sw         $s6, 0x50($sp)
/* 55DC 800049DC AFB40048 */  sw         $s4, 0x48($sp)
/* 55E0 800049E0 AFB30044 */  sw         $s3, 0x44($sp)
/* 55E4 800049E4 AFB20040 */  sw         $s2, 0x40($sp)
/* 55E8 800049E8 AFB1003C */  sw         $s1, 0x3c($sp)
/* 55EC 800049EC 0C001412 */  jal        func_80005048
/* 55F0 800049F0 AFB00038 */   sw        $s0, 0x38($sp)
/* 55F4 800049F4 02A02021 */  addu       $a0, $s5, $zero
/* 55F8 800049F8 24060017 */  addiu      $a2, $zero, 0x17
/* 55FC 800049FC 24130082 */  addiu      $s3, $zero, 0x82
/* 5600 80004A00 24110050 */  addiu      $s1, $zero, 0x50
/* 5604 80004A04 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5608 80004A08 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 560C 80004A0C AFB30010 */  sw         $s3, 0x10($sp)
/* 5610 80004A10 AFB10014 */  sw         $s1, 0x14($sp)
/* 5614 80004A14 AFB10018 */  sw         $s1, 0x18($sp)
/* 5618 80004A18 8E02204C */  lw         $v0, 0x204c($s0)
/* 561C 80004A1C 241200FF */  addiu      $s2, $zero, 0xff
/* 5620 80004A20 AFB2001C */  sw         $s2, 0x1c($sp)
/* 5624 80004A24 8C450750 */  lw         $a1, 0x750($v0)
/* 5628 80004A28 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 562C 80004A2C 24070046 */   addiu     $a3, $zero, 0x46
/* 5630 80004A30 8C430078 */  lw         $v1, 0x78($v0)
/* 5634 80004A34 AEA20084 */  sw         $v0, 0x84($s5)
/* 5638 80004A38 84640018 */  lh         $a0, 0x18($v1)
/* 563C 80004A3C 8C65001C */  lw         $a1, 0x1c($v1)
/* 5640 80004A40 00A0F809 */  jalr       $a1
/* 5644 80004A44 00442021 */   addu      $a0, $v0, $a0
/* 5648 80004A48 0000A021 */  addu       $s4, $zero, $zero
/* 564C 80004A4C 00021042 */  srl        $v0, $v0, 1
/* 5650 80004A50 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5654 80004A54 8EA40084 */  lw         $a0, 0x84($s5)
/* 5658 80004A58 2405005D */  addiu      $a1, $zero, 0x5d
/* 565C 80004A5C 84860062 */  lh         $a2, 0x62($a0)
/* 5660 80004A60 0C02DD3F */  jal        set_widget_coords
/* 5664 80004A64 00A22823 */   subu      $a1, $a1, $v0
/* 5668 80004A68 8EA50084 */  lw         $a1, 0x84($s5)
/* 566C 80004A6C 0200B021 */  addu       $s6, $s0, $zero
/* 5670 80004A70 8CA30078 */  lw         $v1, 0x78($a1)
/* 5674 80004A74 3C108000 */  lui        $s0, 0x8000
/* 5678 80004A78 84640020 */  lh         $a0, 0x20($v1)
/* 567C 80004A7C 8C620024 */  lw         $v0, 0x24($v1)
/* 5680 80004A80 0040F809 */  jalr       $v0
/* 5684 80004A84 00A42021 */   addu      $a0, $a1, $a0
/* 5688 80004A88 02A02021 */  addu       $a0, $s5, $zero
/* 568C 80004A8C 24050004 */  addiu      $a1, $zero, 4
/* 5690 80004A90 24060017 */  addiu      $a2, $zero, 0x17
/* 5694 80004A94 24420046 */  addiu      $v0, $v0, 0x46
/* 5698 80004A98 00021400 */  sll        $v0, $v0, 0x10
/* 569C 80004A9C 00021403 */  sra        $v0, $v0, 0x10
/* 56A0 80004AA0 3048FFFF */  andi       $t0, $v0, 0xffff
/* 56A4 80004AA4 01003821 */  addu       $a3, $t0, $zero
/* 56A8 80004AA8 24030017 */  addiu      $v1, $zero, 0x17
/* 56AC 80004AAC AFA30010 */  sw         $v1, 0x10($sp)
/* 56B0 80004AB0 240300A3 */  addiu      $v1, $zero, 0xa3
/* 56B4 80004AB4 24420075 */  addiu      $v0, $v0, 0x75
/* 56B8 80004AB8 3042FFFF */  andi       $v0, $v0, 0xffff
/* 56BC 80004ABC AFA80014 */  sw         $t0, 0x14($sp)
/* 56C0 80004AC0 AFA30018 */  sw         $v1, 0x18($sp)
/* 56C4 80004AC4 AFA2001C */  sw         $v0, 0x1c($sp)
/* 56C8 80004AC8 AFB30020 */  sw         $s3, 0x20($sp)
/* 56CC 80004ACC AFB10024 */  sw         $s1, 0x24($sp)
/* 56D0 80004AD0 AFB10028 */  sw         $s1, 0x28($sp)
/* 56D4 80004AD4 AFB2002C */  sw         $s2, 0x2c($sp)
/* 56D8 80004AD8 0C02F435 */  jal        widgetscrollmenu_init_2
/* 56DC 80004ADC AFA00030 */   sw        $zero, 0x30($sp)
/* 56E0 80004AE0 00402021 */  addu       $a0, $v0, $zero
/* 56E4 80004AE4 24050044 */  addiu      $a1, $zero, 0x44
/* 56E8 80004AE8 2406002A */  addiu      $a2, $zero, 0x2a
/* 56EC 80004AEC 24070022 */  addiu      $a3, $zero, 0x22
/* 56F0 80004AF0 AEA20080 */  sw         $v0, 0x80($s5)
/* 56F4 80004AF4 24020097 */  addiu      $v0, $zero, 0x97
/* 56F8 80004AF8 2403008D */  addiu      $v1, $zero, 0x8d
/* 56FC 80004AFC AFA20014 */  sw         $v0, 0x14($sp)
/* 5700 80004B00 240200BF */  addiu      $v0, $zero, 0xbf
/* 5704 80004B04 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5708 80004B08 24020014 */  addiu      $v0, $zero, 0x14
/* 570C 80004B0C AFB20010 */  sw         $s2, 0x10($sp)
/* 5710 80004B10 AFA30018 */  sw         $v1, 0x18($sp)
/* 5714 80004B14 AFB20020 */  sw         $s2, 0x20($sp)
/* 5718 80004B18 0C02F085 */  jal        set_widgetSubstruct8
/* 571C 80004B1C AFA20024 */   sw        $v0, 0x24($sp)
/* 5720 80004B20 8EC215F8 */  lw         $v0, 0x15f8($s6)
.L80004B24:
/* 5724 80004B24 00141880 */  sll        $v1, $s4, 2
/* 5728 80004B28 00431021 */  addu       $v0, $v0, $v1
/* 572C 80004B2C 8C510000 */  lw         $s1, ($v0)
/* 5730 80004B30 5220000B */  beql       $s1, $zero, .L80004B60
/* 5734 80004B34 26940001 */   addiu     $s4, $s4, 1
/* 5738 80004B38 0C01DF1D */  jal        isDead
/* 573C 80004B3C 02202021 */   addu      $a0, $s1, $zero
/* 5740 80004B40 54400007 */  bnel       $v0, $zero, .L80004B60
/* 5744 80004B44 26940001 */   addiu     $s4, $s4, 1
/* 5748 80004B48 02A02021 */  addu       $a0, $s5, $zero
/* 574C 80004B4C 02202821 */  addu       $a1, $s1, $zero
/* 5750 80004B50 02803021 */  addu       $a2, $s4, $zero
/* 5754 80004B54 0C0012E5 */  jal        draw_healed_member
/* 5758 80004B58 260742F8 */   addiu     $a3, $s0, 0x42f8
/* 575C 80004B5C 26940001 */  addiu      $s4, $s4, 1
.L80004B60:
/* 5760 80004B60 2E820004 */  sltiu      $v0, $s4, 4
/* 5764 80004B64 5440FFEF */  bnel       $v0, $zero, .L80004B24
/* 5768 80004B68 8EC215F8 */   lw        $v0, 0x15f8($s6)
/* 576C 80004B6C 8FBF0054 */  lw         $ra, 0x54($sp)
/* 5770 80004B70 8FB60050 */  lw         $s6, 0x50($sp)
/* 5774 80004B74 8FB5004C */  lw         $s5, 0x4c($sp)
/* 5778 80004B78 8FB40048 */  lw         $s4, 0x48($sp)
/* 577C 80004B7C 8FB30044 */  lw         $s3, 0x44($sp)
/* 5780 80004B80 8FB20040 */  lw         $s2, 0x40($sp)
/* 5784 80004B84 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5788 80004B88 8FB00038 */  lw         $s0, 0x38($sp)
/* 578C 80004B8C 03E00008 */  jr         $ra
/* 5790 80004B90 27BD0058 */   addiu     $sp, $sp, 0x58

glabel draw_healed_member
/* 5794 80004B94 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* 5798 80004B98 AFB60130 */  sw         $s6, 0x130($sp)
/* 579C 80004B9C 0080B021 */  addu       $s6, $a0, $zero
/* 57A0 80004BA0 AFB5012C */  sw         $s5, 0x12c($sp)
/* 57A4 80004BA4 00A0A821 */  addu       $s5, $a1, $zero
/* 57A8 80004BA8 AFBE0138 */  sw         $fp, 0x138($sp)
/* 57AC 80004BAC 00C0F021 */  addu       $fp, $a2, $zero
/* 57B0 80004BB0 AFB70134 */  sw         $s7, 0x134($sp)
/* 57B4 80004BB4 00E0B821 */  addu       $s7, $a3, $zero
/* 57B8 80004BB8 AFBF013C */  sw         $ra, 0x13c($sp)
/* 57BC 80004BBC AFB40128 */  sw         $s4, 0x128($sp)
/* 57C0 80004BC0 AFB30124 */  sw         $s3, 0x124($sp)
/* 57C4 80004BC4 AFB20120 */  sw         $s2, 0x120($sp)
/* 57C8 80004BC8 AFB1011C */  sw         $s1, 0x11c($sp)
/* 57CC 80004BCC 12A00070 */  beqz       $s5, .L80004D90
/* 57D0 80004BD0 AFB00118 */   sw        $s0, 0x118($sp)
/* 57D4 80004BD4 0C026259 */  jal        passToMalloc
/* 57D8 80004BD8 24040088 */   addiu     $a0, $zero, 0x88
/* 57DC 80004BDC 00402021 */  addu       $a0, $v0, $zero
/* 57E0 80004BE0 0C00C850 */  jal        init_widget_grouo
/* 57E4 80004BE4 24050003 */   addiu     $a1, $zero, 3
/* 57E8 80004BE8 2404007C */  addiu      $a0, $zero, 0x7c
/* 57EC 80004BEC 0C026259 */  jal        passToMalloc
/* 57F0 80004BF0 00409021 */   addu      $s2, $v0, $zero
/* 57F4 80004BF4 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 57F8 80004BF8 8C6413A0 */  lw         $a0, %lo(EntityPointer)($v1)
/* 57FC 80004BFC 96A50000 */  lhu        $a1, ($s5)
/* 5800 80004C00 0C01D531 */  jal        getEntityPortait
/* 5804 80004C04 00408021 */   addu      $s0, $v0, $zero
/* 5808 80004C08 0C0290E2 */  jal        get_borg_8
/* 580C 80004C0C 00402021 */   addu      $a0, $v0, $zero
/* 5810 80004C10 02002021 */  addu       $a0, $s0, $zero
/* 5814 80004C14 0C02E518 */  jal        borg8_widget
/* 5818 80004C18 00402821 */   addu      $a1, $v0, $zero
/* 581C 80004C1C 00408821 */  addu       $s1, $v0, $zero
/* 5820 80004C20 02202021 */  addu       $a0, $s1, $zero
/* 5824 80004C24 0C02DD42 */  jal        set_widgetHeight
/* 5828 80004C28 24050019 */   addiu     $a1, $zero, 0x19
/* 582C 80004C2C 02202021 */  addu       $a0, $s1, $zero
/* 5830 80004C30 0C02DD46 */  jal        set_widgetWidth
/* 5834 80004C34 24050019 */   addiu     $a1, $zero, 0x19
/* 5838 80004C38 02402021 */  addu       $a0, $s2, $zero
/* 583C 80004C3C 02202821 */  addu       $a1, $s1, $zero
/* 5840 80004C40 00003021 */  addu       $a2, $zero, $zero
/* 5844 80004C44 00003821 */  addu       $a3, $zero, $zero
/* 5848 80004C48 0C00C9A6 */  jal        func_80032698
/* 584C 80004C4C AFA00010 */   sw        $zero, 0x10($sp)
/* 5850 80004C50 0C026259 */  jal        passToMalloc
/* 5854 80004C54 2404007C */   addiu     $a0, $zero, 0x7c
/* 5858 80004C58 8EA40004 */  lw         $a0, 4($s5)
/* 585C 80004C5C 0C03353E */  jal        strlen
/* 5860 80004C60 00408021 */   addu      $s0, $v0, $zero
/* 5864 80004C64 02002021 */  addu       $a0, $s0, $zero
/* 5868 80004C68 24420001 */  addiu      $v0, $v0, 1
/* 586C 80004C6C 8EA50004 */  lw         $a1, 4($s5)
/* 5870 80004C70 0C02E3A0 */  jal        widgettext_func_2
/* 5874 80004C74 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5878 80004C78 8E230078 */  lw         $v1, 0x78($s1)
/* 587C 80004C7C 00409821 */  addu       $s3, $v0, $zero
/* 5880 80004C80 84640018 */  lh         $a0, 0x18($v1)
/* 5884 80004C84 8C65001C */  lw         $a1, 0x1c($v1)
/* 5888 80004C88 00A0F809 */  jalr       $a1
/* 588C 80004C8C 02242021 */   addu      $a0, $s1, $a0
/* 5890 80004C90 02402021 */  addu       $a0, $s2, $zero
/* 5894 80004C94 02602821 */  addu       $a1, $s3, $zero
/* 5898 80004C98 24420002 */  addiu      $v0, $v0, 2
/* 589C 80004C9C 3046FFFF */  andi       $a2, $v0, 0xffff
/* 58A0 80004CA0 00003821 */  addu       $a3, $zero, $zero
/* 58A4 80004CA4 24140001 */  addiu      $s4, $zero, 1
/* 58A8 80004CA8 0C00C9A6 */  jal        func_80032698
/* 58AC 80004CAC AFB40010 */   sw        $s4, 0x10($sp)
/* 58B0 80004CB0 0C01DED7 */  jal        getHPCurrent
/* 58B4 80004CB4 02A02021 */   addu      $a0, $s5, $zero
/* 58B8 80004CB8 02A02021 */  addu       $a0, $s5, $zero
/* 58BC 80004CBC 0C01DEBD */  jal        getHPMax
/* 58C0 80004CC0 00408021 */   addu      $s0, $v0, $zero
/* 58C4 80004CC4 27A40018 */  addiu      $a0, $sp, 0x18
/* 58C8 80004CC8 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 58CC 80004CCC 8C6788F4 */  lw         $a3, %lo(commonstringsmirror)($v1)
/* 58D0 80004CD0 02003021 */  addu       $a2, $s0, $zero
/* 58D4 80004CD4 8CE50754 */  lw         $a1, 0x754($a3)
/* 58D8 80004CD8 0C0333AC */  jal        sprintf
/* 58DC 80004CDC 00403821 */   addu      $a3, $v0, $zero
/* 58E0 80004CE0 0C026259 */  jal        passToMalloc
/* 58E4 80004CE4 2404007C */   addiu     $a0, $zero, 0x7c
/* 58E8 80004CE8 27A40018 */  addiu      $a0, $sp, 0x18
/* 58EC 80004CEC 0C03353E */  jal        strlen
/* 58F0 80004CF0 00408021 */   addu      $s0, $v0, $zero
/* 58F4 80004CF4 02002021 */  addu       $a0, $s0, $zero
/* 58F8 80004CF8 27A50018 */  addiu      $a1, $sp, 0x18
/* 58FC 80004CFC 24420001 */  addiu      $v0, $v0, 1
/* 5900 80004D00 0C02E3A0 */  jal        widgettext_func_2
/* 5904 80004D04 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5908 80004D08 8E230078 */  lw         $v1, 0x78($s1)
/* 590C 80004D0C 84640018 */  lh         $a0, 0x18($v1)
/* 5910 80004D10 8C65001C */  lw         $a1, 0x1c($v1)
/* 5914 80004D14 02242021 */  addu       $a0, $s1, $a0
/* 5918 80004D18 00A0F809 */  jalr       $a1
/* 591C 80004D1C 00408821 */   addu      $s1, $v0, $zero
/* 5920 80004D20 8E630078 */  lw         $v1, 0x78($s3)
/* 5924 80004D24 00408021 */  addu       $s0, $v0, $zero
/* 5928 80004D28 84640020 */  lh         $a0, 0x20($v1)
/* 592C 80004D2C 8C650024 */  lw         $a1, 0x24($v1)
/* 5930 80004D30 00A0F809 */  jalr       $a1
/* 5934 80004D34 02642021 */   addu      $a0, $s3, $a0
/* 5938 80004D38 02402021 */  addu       $a0, $s2, $zero
/* 593C 80004D3C 02202821 */  addu       $a1, $s1, $zero
/* 5940 80004D40 02003021 */  addu       $a2, $s0, $zero
/* 5944 80004D44 24420005 */  addiu      $v0, $v0, 5
/* 5948 80004D48 3047FFFF */  andi       $a3, $v0, 0xffff
/* 594C 80004D4C 0C00C9A6 */  jal        func_80032698
/* 5950 80004D50 AFB40010 */   sw        $s4, 0x10($sp)
/* 5954 80004D54 24050082 */  addiu      $a1, $zero, 0x82
/* 5958 80004D58 24060050 */  addiu      $a2, $zero, 0x50
/* 595C 80004D5C 8E480078 */  lw         $t0, 0x78($s2)
/* 5960 80004D60 24070050 */  addiu      $a3, $zero, 0x50
/* 5964 80004D64 85040048 */  lh         $a0, 0x48($t0)
/* 5968 80004D68 240200FF */  addiu      $v0, $zero, 0xff
/* 596C 80004D6C AFA20010 */  sw         $v0, 0x10($sp)
/* 5970 80004D70 8D03004C */  lw         $v1, 0x4c($t0)
/* 5974 80004D74 0060F809 */  jalr       $v1
/* 5978 80004D78 02442021 */   addu      $a0, $s2, $a0
/* 597C 80004D7C 8EC40080 */  lw         $a0, 0x80($s6)
/* 5980 80004D80 0C02E885 */  jal        link_widget_text
/* 5984 80004D84 02402821 */   addu      $a1, $s2, $zero
/* 5988 80004D88 AE570018 */  sw         $s7, 0x18($s2)
/* 598C 80004D8C A65E005E */  sh         $fp, 0x5e($s2)
.L80004D90:
/* 5990 80004D90 8FBF013C */  lw         $ra, 0x13c($sp)
/* 5994 80004D94 8FBE0138 */  lw         $fp, 0x138($sp)
/* 5998 80004D98 8FB70134 */  lw         $s7, 0x134($sp)
/* 599C 80004D9C 8FB60130 */  lw         $s6, 0x130($sp)
/* 59A0 80004DA0 8FB5012C */  lw         $s5, 0x12c($sp)
/* 59A4 80004DA4 8FB40128 */  lw         $s4, 0x128($sp)
/* 59A8 80004DA8 8FB30124 */  lw         $s3, 0x124($sp)
/* 59AC 80004DAC 8FB20120 */  lw         $s2, 0x120($sp)
/* 59B0 80004DB0 8FB1011C */  lw         $s1, 0x11c($sp)
/* 59B4 80004DB4 8FB00118 */  lw         $s0, 0x118($sp)
/* 59B8 80004DB8 03E00008 */  jr         $ra
/* 59BC 80004DBC 27BD0140 */   addiu     $sp, $sp, 0x140

glabel passto_healing_func
/* 59C0 80004DC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59C4 80004DC4 AFB00010 */  sw         $s0, 0x10($sp)
/* 59C8 80004DC8 00808021 */  addu       $s0, $a0, $zero
/* 59CC 80004DCC 3C02800E */  lui        $v0, %hi(partyPointer)
/* 59D0 80004DD0 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 59D4 80004DD4 30A600FF */  andi       $a2, $a1, 0xff
/* 59D8 80004DD8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 59DC 80004DDC 0C0202F6 */  jal        healing_func
/* 59E0 80004DE0 9205007F */   lbu       $a1, 0x7f($s0)
/* 59E4 80004DE4 02002021 */  addu       $a0, $s0, $zero
/* 59E8 80004DE8 0C017C0D */  jal        func_8005F034
/* 59EC 80004DEC 00402821 */   addu      $a1, $v0, $zero
/* 59F0 80004DF0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 59F4 80004DF4 8FB00010 */  lw         $s0, 0x10($sp)
/* 59F8 80004DF8 03E00008 */  jr         $ra
/* 59FC 80004DFC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel passTo_party_healing_func
/* 5A00 80004E00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A04 80004E04 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A08 80004E08 00808021 */  addu       $s0, $a0, $zero
/* 5A0C 80004E0C 3C02800E */  lui        $v0, %hi(partyPointer)
/* 5A10 80004E10 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 5A14 80004E14 30A600FF */  andi       $a2, $a1, 0xff
/* 5A18 80004E18 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A1C 80004E1C 0C02037B */  jal        party_healing_func
/* 5A20 80004E20 9205007F */   lbu       $a1, 0x7f($s0)
/* 5A24 80004E24 02002021 */  addu       $a0, $s0, $zero
/* 5A28 80004E28 0C017C0D */  jal        func_8005F034
/* 5A2C 80004E2C 00402821 */   addu      $a1, $v0, $zero
/* 5A30 80004E30 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5A34 80004E34 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A38 80004E38 03E00008 */  jr         $ra
/* 5A3C 80004E3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80004E40
/* 5A40 80004E40 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 5A44 80004E44 AFB00038 */  sw         $s0, 0x38($sp)
/* 5A48 80004E48 00808021 */  addu       $s0, $a0, $zero
/* 5A4C 80004E4C AFB30044 */  sw         $s3, 0x44($sp)
/* 5A50 80004E50 00A09821 */  addu       $s3, $a1, $zero
/* 5A54 80004E54 AFBF004C */  sw         $ra, 0x4c($sp)
/* 5A58 80004E58 AFB40048 */  sw         $s4, 0x48($sp)
/* 5A5C 80004E5C AFB20040 */  sw         $s2, 0x40($sp)
/* 5A60 80004E60 0C001412 */  jal        func_80005048
/* 5A64 80004E64 AFB1003C */   sw        $s1, 0x3c($sp)
/* 5A68 80004E68 02002021 */  addu       $a0, $s0, $zero
/* 5A6C 80004E6C 24060017 */  addiu      $a2, $zero, 0x17
/* 5A70 80004E70 24140082 */  addiu      $s4, $zero, 0x82
/* 5A74 80004E74 24110050 */  addiu      $s1, $zero, 0x50
/* 5A78 80004E78 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 5A7C 80004E7C 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 5A80 80004E80 241200FF */  addiu      $s2, $zero, 0xff
/* 5A84 80004E84 AFB40010 */  sw         $s4, 0x10($sp)
/* 5A88 80004E88 AFB10014 */  sw         $s1, 0x14($sp)
/* 5A8C 80004E8C AFB10018 */  sw         $s1, 0x18($sp)
/* 5A90 80004E90 AFB2001C */  sw         $s2, 0x1c($sp)
/* 5A94 80004E94 8C650750 */  lw         $a1, 0x750($v1)
/* 5A98 80004E98 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 5A9C 80004E9C 24070046 */   addiu     $a3, $zero, 0x46
/* 5AA0 80004EA0 8C430078 */  lw         $v1, 0x78($v0)
/* 5AA4 80004EA4 AE020084 */  sw         $v0, 0x84($s0)
/* 5AA8 80004EA8 84640018 */  lh         $a0, 0x18($v1)
/* 5AAC 80004EAC 8C65001C */  lw         $a1, 0x1c($v1)
/* 5AB0 80004EB0 00A0F809 */  jalr       $a1
/* 5AB4 80004EB4 00442021 */   addu      $a0, $v0, $a0
/* 5AB8 80004EB8 00021042 */  srl        $v0, $v0, 1
/* 5ABC 80004EBC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5AC0 80004EC0 8E040084 */  lw         $a0, 0x84($s0)
/* 5AC4 80004EC4 2405005D */  addiu      $a1, $zero, 0x5d
/* 5AC8 80004EC8 84860062 */  lh         $a2, 0x62($a0)
/* 5ACC 80004ECC 0C02DD3F */  jal        set_widget_coords
/* 5AD0 80004ED0 00A22823 */   subu      $a1, $a1, $v0
/* 5AD4 80004ED4 8E050084 */  lw         $a1, 0x84($s0)
/* 5AD8 80004ED8 8CA30078 */  lw         $v1, 0x78($a1)
/* 5ADC 80004EDC 84640020 */  lh         $a0, 0x20($v1)
/* 5AE0 80004EE0 8C620024 */  lw         $v0, 0x24($v1)
/* 5AE4 80004EE4 0040F809 */  jalr       $v0
/* 5AE8 80004EE8 00A42021 */   addu      $a0, $a1, $a0
/* 5AEC 80004EEC 02002021 */  addu       $a0, $s0, $zero
/* 5AF0 80004EF0 24050007 */  addiu      $a1, $zero, 7
/* 5AF4 80004EF4 24060017 */  addiu      $a2, $zero, 0x17
/* 5AF8 80004EF8 24420046 */  addiu      $v0, $v0, 0x46
/* 5AFC 80004EFC 00021400 */  sll        $v0, $v0, 0x10
/* 5B00 80004F00 00021403 */  sra        $v0, $v0, 0x10
/* 5B04 80004F04 3048FFFF */  andi       $t0, $v0, 0xffff
/* 5B08 80004F08 01003821 */  addu       $a3, $t0, $zero
/* 5B0C 80004F0C 24030017 */  addiu      $v1, $zero, 0x17
/* 5B10 80004F10 AFA30010 */  sw         $v1, 0x10($sp)
/* 5B14 80004F14 240300A3 */  addiu      $v1, $zero, 0xa3
/* 5B18 80004F18 24420075 */  addiu      $v0, $v0, 0x75
/* 5B1C 80004F1C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5B20 80004F20 AFA80014 */  sw         $t0, 0x14($sp)
/* 5B24 80004F24 AFA30018 */  sw         $v1, 0x18($sp)
/* 5B28 80004F28 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5B2C 80004F2C AFB40020 */  sw         $s4, 0x20($sp)
/* 5B30 80004F30 AFB10024 */  sw         $s1, 0x24($sp)
/* 5B34 80004F34 AFB10028 */  sw         $s1, 0x28($sp)
/* 5B38 80004F38 AFB2002C */  sw         $s2, 0x2c($sp)
/* 5B3C 80004F3C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 5B40 80004F40 AFA00030 */   sw        $zero, 0x30($sp)
/* 5B44 80004F44 00402021 */  addu       $a0, $v0, $zero
/* 5B48 80004F48 24050044 */  addiu      $a1, $zero, 0x44
/* 5B4C 80004F4C 2406002A */  addiu      $a2, $zero, 0x2a
/* 5B50 80004F50 24070022 */  addiu      $a3, $zero, 0x22
/* 5B54 80004F54 AE020080 */  sw         $v0, 0x80($s0)
/* 5B58 80004F58 24020097 */  addiu      $v0, $zero, 0x97
/* 5B5C 80004F5C 2403008D */  addiu      $v1, $zero, 0x8d
/* 5B60 80004F60 AFA20014 */  sw         $v0, 0x14($sp)
/* 5B64 80004F64 240200BF */  addiu      $v0, $zero, 0xbf
/* 5B68 80004F68 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5B6C 80004F6C 24020014 */  addiu      $v0, $zero, 0x14
/* 5B70 80004F70 AFB20010 */  sw         $s2, 0x10($sp)
/* 5B74 80004F74 AFA30018 */  sw         $v1, 0x18($sp)
/* 5B78 80004F78 AFB20020 */  sw         $s2, 0x20($sp)
/* 5B7C 80004F7C 0C02F085 */  jal        set_widgetSubstruct8
/* 5B80 80004F80 AFA20024 */   sw        $v0, 0x24($sp)
/* 5B84 80004F84 02002021 */  addu       $a0, $s0, $zero
/* 5B88 80004F88 00002821 */  addu       $a1, $zero, $zero
/* 5B8C 80004F8C 0C00143C */  jal        make_widget_with_stats
/* 5B90 80004F90 02603021 */   addu      $a2, $s3, $zero
/* 5B94 80004F94 02002021 */  addu       $a0, $s0, $zero
/* 5B98 80004F98 24050001 */  addiu      $a1, $zero, 1
/* 5B9C 80004F9C 0C00143C */  jal        make_widget_with_stats
/* 5BA0 80004FA0 02603021 */   addu      $a2, $s3, $zero
/* 5BA4 80004FA4 02002021 */  addu       $a0, $s0, $zero
/* 5BA8 80004FA8 24050002 */  addiu      $a1, $zero, 2
/* 5BAC 80004FAC 0C00143C */  jal        make_widget_with_stats
/* 5BB0 80004FB0 02603021 */   addu      $a2, $s3, $zero
/* 5BB4 80004FB4 02002021 */  addu       $a0, $s0, $zero
/* 5BB8 80004FB8 24050003 */  addiu      $a1, $zero, 3
/* 5BBC 80004FBC 0C00143C */  jal        make_widget_with_stats
/* 5BC0 80004FC0 02603021 */   addu      $a2, $s3, $zero
/* 5BC4 80004FC4 02002021 */  addu       $a0, $s0, $zero
/* 5BC8 80004FC8 24050004 */  addiu      $a1, $zero, 4
/* 5BCC 80004FCC 0C00143C */  jal        make_widget_with_stats
/* 5BD0 80004FD0 02603021 */   addu      $a2, $s3, $zero
/* 5BD4 80004FD4 02002021 */  addu       $a0, $s0, $zero
/* 5BD8 80004FD8 24050005 */  addiu      $a1, $zero, 5
/* 5BDC 80004FDC 0C00143C */  jal        make_widget_with_stats
/* 5BE0 80004FE0 02603021 */   addu      $a2, $s3, $zero
/* 5BE4 80004FE4 8FBF004C */  lw         $ra, 0x4c($sp)
/* 5BE8 80004FE8 8FB40048 */  lw         $s4, 0x48($sp)
/* 5BEC 80004FEC 8FB30044 */  lw         $s3, 0x44($sp)
/* 5BF0 80004FF0 8FB20040 */  lw         $s2, 0x40($sp)
/* 5BF4 80004FF4 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5BF8 80004FF8 8FB00038 */  lw         $s0, 0x38($sp)
/* 5BFC 80004FFC 03E00008 */  jr         $ra
/* 5C00 80005000 27BD0050 */   addiu     $sp, $sp, 0x50

glabel passto_some_healing_func
/* 5C04 80005004 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C08 80005008 AFB00010 */  sw         $s0, 0x10($sp)
/* 5C0C 8000500C 00808021 */  addu       $s0, $a0, $zero
/* 5C10 80005010 3C02800E */  lui        $v0, %hi(partyPointer)
/* 5C14 80005014 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 5C18 80005018 30A700FF */  andi       $a3, $a1, 0xff
/* 5C1C 8000501C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5C20 80005020 9205007F */  lbu        $a1, 0x7f($s0)
/* 5C24 80005024 0C02041C */  jal        some_healing_func
/* 5C28 80005028 30C600FF */   andi      $a2, $a2, 0xff
/* 5C2C 8000502C 02002021 */  addu       $a0, $s0, $zero
/* 5C30 80005030 0C017C0D */  jal        func_8005F034
/* 5C34 80005034 00402821 */   addu      $a1, $v0, $zero
/* 5C38 80005038 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5C3C 8000503C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5C40 80005040 03E00008 */  jr         $ra
/* 5C44 80005044 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80005048
/* 5C48 80005048 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C4C 8000504C AFB00010 */  sw         $s0, 0x10($sp)
/* 5C50 80005050 00808021 */  addu       $s0, $a0, $zero
/* 5C54 80005054 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5C58 80005058 8E050084 */  lw         $a1, 0x84($s0)
/* 5C5C 8000505C 50A00010 */  beql       $a1, $zero, .L800050A0
/* 5C60 80005060 8E050080 */   lw        $a1, 0x80($s0)
/* 5C64 80005064 8E030078 */  lw         $v1, 0x78($s0)
/* 5C68 80005068 84640038 */  lh         $a0, 0x38($v1)
/* 5C6C 8000506C 8C62003C */  lw         $v0, 0x3c($v1)
/* 5C70 80005070 0040F809 */  jalr       $v0
/* 5C74 80005074 02042021 */   addu      $a0, $s0, $a0
/* 5C78 80005078 8E060084 */  lw         $a2, 0x84($s0)
/* 5C7C 8000507C 10C00006 */  beqz       $a2, .L80005098
/* 5C80 80005080 24050003 */   addiu     $a1, $zero, 3
/* 5C84 80005084 8CC20078 */  lw         $v0, 0x78($a2)
/* 5C88 80005088 84440008 */  lh         $a0, 8($v0)
/* 5C8C 8000508C 8C43000C */  lw         $v1, 0xc($v0)
/* 5C90 80005090 0060F809 */  jalr       $v1
/* 5C94 80005094 00C42021 */   addu      $a0, $a2, $a0
.L80005098:
/* 5C98 80005098 AE000084 */  sw         $zero, 0x84($s0)
/* 5C9C 8000509C 8E050080 */  lw         $a1, 0x80($s0)
.L800050A0:
/* 5CA0 800050A0 10A00010 */  beqz       $a1, .L800050E4
/* 5CA4 800050A4 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5CA8 800050A8 8E030078 */  lw         $v1, 0x78($s0)
/* 5CAC 800050AC 84640038 */  lh         $a0, 0x38($v1)
/* 5CB0 800050B0 8C62003C */  lw         $v0, 0x3c($v1)
/* 5CB4 800050B4 0040F809 */  jalr       $v0
/* 5CB8 800050B8 02042021 */   addu      $a0, $s0, $a0
/* 5CBC 800050BC 8E060080 */  lw         $a2, 0x80($s0)
/* 5CC0 800050C0 10C00006 */  beqz       $a2, .L800050DC
/* 5CC4 800050C4 24050003 */   addiu     $a1, $zero, 3
/* 5CC8 800050C8 8CC20078 */  lw         $v0, 0x78($a2)
/* 5CCC 800050CC 84440008 */  lh         $a0, 8($v0)
/* 5CD0 800050D0 8C43000C */  lw         $v1, 0xc($v0)
/* 5CD4 800050D4 0060F809 */  jalr       $v1
/* 5CD8 800050D8 00C42021 */   addu      $a0, $a2, $a0
.L800050DC:
/* 5CDC 800050DC AE000080 */  sw         $zero, 0x80($s0)
/* 5CE0 800050E0 8FBF0014 */  lw         $ra, 0x14($sp)
.L800050E4:
/* 5CE4 800050E4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5CE8 800050E8 03E00008 */  jr         $ra
/* 5CEC 800050EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel make_widget_with_stats
/* 5CF0 800050F0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5CF4 800050F4 AFB50024 */  sw         $s5, 0x24($sp)
/* 5CF8 800050F8 0080A821 */  addu       $s5, $a0, $zero
/* 5CFC 800050FC 2404007C */  addiu      $a0, $zero, 0x7c
/* 5D00 80005100 AFB3001C */  sw         $s3, 0x1c($sp)
/* 5D04 80005104 00A09821 */  addu       $s3, $a1, $zero
/* 5D08 80005108 AFB40020 */  sw         $s4, 0x20($sp)
/* 5D0C 8000510C 00C0A021 */  addu       $s4, $a2, $zero
/* 5D10 80005110 AFBF0028 */  sw         $ra, 0x28($sp)
/* 5D14 80005114 AFB20018 */  sw         $s2, 0x18($sp)
/* 5D18 80005118 AFB10014 */  sw         $s1, 0x14($sp)
/* 5D1C 8000511C 0C026259 */  jal        passToMalloc
/* 5D20 80005120 AFB00010 */   sw        $s0, 0x10($sp)
/* 5D24 80005124 3C12800F */  lui        $s2, %hi(Stat_labels)
/* 5D28 80005128 8E431B60 */  lw         $v1, %lo(Stat_labels)($s2)
/* 5D2C 8000512C 00138080 */  sll        $s0, $s3, 2
/* 5D30 80005130 02031821 */  addu       $v1, $s0, $v1
/* 5D34 80005134 8C640000 */  lw         $a0, ($v1)
/* 5D38 80005138 0C03353E */  jal        strlen
/* 5D3C 8000513C 00408821 */   addu      $s1, $v0, $zero
/* 5D40 80005140 02202021 */  addu       $a0, $s1, $zero
/* 5D44 80005144 8E431B60 */  lw         $v1, 0x1b60($s2)
/* 5D48 80005148 24420001 */  addiu      $v0, $v0, 1
/* 5D4C 8000514C 02038021 */  addu       $s0, $s0, $v1
/* 5D50 80005150 8E050000 */  lw         $a1, ($s0)
/* 5D54 80005154 0C02E3A0 */  jal        widgettext_func_2
/* 5D58 80005158 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5D5C 8000515C 00402821 */  addu       $a1, $v0, $zero
/* 5D60 80005160 3C038000 */  lui        $v1, %hi(func_80004320)
/* 5D64 80005164 A054005C */  sb         $s4, 0x5c($v0)
/* 5D68 80005168 8EA40080 */  lw         $a0, 0x80($s5)
/* 5D6C 8000516C 24634320 */  addiu      $v1, $v1, %lo(func_80004320)
/* 5D70 80005170 A453005E */  sh         $s3, 0x5e($v0)
/* 5D74 80005174 0C02E885 */  jal        link_widget_text
/* 5D78 80005178 AC430018 */   sw        $v1, 0x18($v0)
/* 5D7C 8000517C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 5D80 80005180 8FB50024 */  lw         $s5, 0x24($sp)
/* 5D84 80005184 8FB40020 */  lw         $s4, 0x20($sp)
/* 5D88 80005188 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5D8C 8000518C 8FB20018 */  lw         $s2, 0x18($sp)
/* 5D90 80005190 8FB10014 */  lw         $s1, 0x14($sp)
/* 5D94 80005194 8FB00010 */  lw         $s0, 0x10($sp)
/* 5D98 80005198 03E00008 */  jr         $ra
/* 5D9C 8000519C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800051A0
/* 5DA0 800051A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5DA4 800051A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5DA8 800051A8 0C02E66C */  jal        widget_menu_free
/* 5DAC 800051AC 00000000 */   nop
/* 5DB0 800051B0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5DB4 800051B4 03E00008 */  jr         $ra
/* 5DB8 800051B8 27BD0018 */   addiu     $sp, $sp, 0x18
/* 5DBC 800051BC 00000000 */  nop
