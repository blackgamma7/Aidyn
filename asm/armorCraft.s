.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800035B0
/* 41B0 800035B0 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 41B4 800035B4 AFB00098 */  sw         $s0, 0x98($sp)
/* 41B8 800035B8 AFBF009C */  sw         $ra, 0x9c($sp)
/* 41BC 800035BC 0C000D96 */  jal        CanMakeArmor
/* 41C0 800035C0 00808021 */   addu      $s0, $a0, $zero
/* 41C4 800035C4 14400017 */  bnez       $v0, .L80003624
/* 41C8 800035C8 24050096 */   addiu     $a1, $zero, 0x96
/* 41CC 800035CC 240200E1 */  addiu      $v0, $zero, 0xe1
/* 41D0 800035D0 27A60018 */  addiu      $a2, $sp, 0x18
/* 41D4 800035D4 240300FF */  addiu      $v1, $zero, 0xff
/* 41D8 800035D8 A3A20018 */  sb         $v0, 0x18($sp)
/* 41DC 800035DC A0C20001 */  sb         $v0, 1($a2)
/* 41E0 800035E0 A0C20002 */  sb         $v0, 2($a2)
/* 41E4 800035E4 24020032 */  addiu      $v0, $zero, 0x32
/* 41E8 800035E8 A0C30003 */  sb         $v1, 3($a2)
/* 41EC 800035EC A3A20058 */  sb         $v0, 0x58($sp)
/* 41F0 800035F0 A3A20059 */  sb         $v0, 0x59($sp)
/* 41F4 800035F4 A3A2005A */  sb         $v0, 0x5a($sp)
/* 41F8 800035F8 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 41FC 800035FC 8C4788F4 */  lw         $a3, %lo(commonstringsmirror)($v0)
/* 4200 80003600 24030096 */  addiu      $v1, $zero, 0x96
/* 4204 80003604 A3A3005B */  sb         $v1, 0x5b($sp)
/* 4208 80003608 24030001 */  addiu      $v1, $zero, 1
/* 420C 8000360C AFA30010 */  sw         $v1, 0x10($sp)
/* 4210 80003610 8CE40734 */  lw         $a0, 0x734($a3)
/* 4214 80003614 0C0131E1 */  jal        some_textbox_func
/* 4218 80003618 27A70058 */   addiu     $a3, $sp, 0x58
/* 421C 8000361C 08000D93 */  j          .L8000364C
/* 4220 80003620 8FBF009C */   lw        $ra, 0x9c($sp)
.L80003624:
/* 4224 80003624 0C026259 */  jal        passToMalloc
/* 4228 80003628 24040084 */   addiu     $a0, $zero, 0x84
/* 422C 8000362C 00402021 */  addu       $a0, $v0, $zero
/* 4230 80003630 0C000DCA */  jal        armorCraft_func
/* 4234 80003634 02002821 */   addu      $a1, $s0, $zero
/* 4238 80003638 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 423C 8000363C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 4240 80003640 0C02DC7C */  jal        widgetHandler
/* 4244 80003644 00402821 */   addu      $a1, $v0, $zero
/* 4248 80003648 8FBF009C */  lw         $ra, 0x9c($sp)
.L8000364C:
/* 424C 8000364C 8FB00098 */  lw         $s0, 0x98($sp)
/* 4250 80003650 03E00008 */  jr         $ra
/* 4254 80003654 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel CanMakeArmor
/* 4258 80003658 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 425C 8000365C 3C02800E */  lui        $v0, %hi(partyPointer)
/* 4260 80003660 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4264 80003664 8C537EA0 */  lw         $s3, %lo(partyPointer)($v0)
/* 4268 80003668 00042080 */  sll        $a0, $a0, 2
/* 426C 8000366C AFBF0024 */  sw         $ra, 0x24($sp)
/* 4270 80003670 AFB40020 */  sw         $s4, 0x20($sp)
/* 4274 80003674 AFB20018 */  sw         $s2, 0x18($sp)
/* 4278 80003678 AFB10014 */  sw         $s1, 0x14($sp)
/* 427C 8000367C AFB00010 */  sw         $s0, 0x10($sp)
/* 4280 80003680 02642021 */  addu       $a0, $s3, $a0
/* 4284 80003684 8C910000 */  lw         $s1, ($a0)
/* 4288 80003688 16200005 */  bnez       $s1, .L800036A0
/* 428C 8000368C 00009021 */   addu      $s2, $zero, $zero
/* 4290 80003690 08000DC2 */  j          .L80003708
/* 4294 80003694 00001021 */   addu      $v0, $zero, $zero
.L80003698:
/* 4298 80003698 08000DC2 */  j          .L80003708
/* 429C 8000369C 24020001 */   addiu     $v0, $zero, 1
.L800036A0:
/* 42A0 800036A0 3C14800F */  lui        $s4, %hi(item_pointer)
/* 42A4 800036A4 3C02800E */  lui        $v0, %hi(armorCraft_recipies)
/* 42A8 800036A8 24506110 */  addiu      $s0, $v0, %lo(armorCraft_recipies)
.L800036AC:
/* 42AC 800036AC 96060000 */  lhu        $a2, ($s0)
/* 42B0 800036B0 8E640010 */  lw         $a0, 0x10($s3)
/* 42B4 800036B4 8E8314F0 */  lw         $v1, %lo(item_pointer)($s4)
/* 42B8 800036B8 00061040 */  sll        $v0, $a2, 1
/* 42BC 800036BC 00461021 */  addu       $v0, $v0, $a2
/* 42C0 800036C0 8C650018 */  lw         $a1, 0x18($v1)
/* 42C4 800036C4 00021100 */  sll        $v0, $v0, 4
/* 42C8 800036C8 00451021 */  addu       $v0, $v0, $a1
/* 42CC 800036CC 0C01F070 */  jal        has_item_func
/* 42D0 800036D0 94450000 */   lhu       $a1, ($v0)
/* 42D4 800036D4 50400008 */  beql       $v0, $zero, .L800036F8
/* 42D8 800036D8 26520001 */   addiu     $s2, $s2, 1
/* 42DC 800036DC 8E24001C */  lw         $a0, 0x1c($s1)
/* 42E0 800036E0 0C020F4B */  jal        capskillBaseMax
/* 42E4 800036E4 24050004 */   addiu     $a1, $zero, 4
/* 42E8 800036E8 92030004 */  lbu        $v1, 4($s0)
/* 42EC 800036EC 0043102A */  slt        $v0, $v0, $v1
/* 42F0 800036F0 1040FFE9 */  beqz       $v0, .L80003698
/* 42F4 800036F4 26520001 */   addiu     $s2, $s2, 1
.L800036F8:
/* 42F8 800036F8 2E420005 */  sltiu      $v0, $s2, 5
/* 42FC 800036FC 1440FFEB */  bnez       $v0, .L800036AC
/* 4300 80003700 26100006 */   addiu     $s0, $s0, 6
/* 4304 80003704 00001021 */  addu       $v0, $zero, $zero
.L80003708:
/* 4308 80003708 8FBF0024 */  lw         $ra, 0x24($sp)
/* 430C 8000370C 8FB40020 */  lw         $s4, 0x20($sp)
/* 4310 80003710 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4314 80003714 8FB20018 */  lw         $s2, 0x18($sp)
/* 4318 80003718 8FB10014 */  lw         $s1, 0x14($sp)
/* 431C 8000371C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4320 80003720 03E00008 */  jr         $ra
/* 4324 80003724 27BD0028 */   addiu     $sp, $sp, 0x28

glabel armorCraft_func
/* 4328 80003728 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 432C 8000372C AFB60050 */  sw         $s6, 0x50($sp)
/* 4330 80003730 0080B021 */  addu       $s6, $a0, $zero
/* 4334 80003734 AFB20040 */  sw         $s2, 0x40($sp)
/* 4338 80003738 00A09021 */  addu       $s2, $a1, $zero
/* 433C 8000373C AFBF005C */  sw         $ra, 0x5c($sp)
/* 4340 80003740 AFBE0058 */  sw         $fp, 0x58($sp)
/* 4344 80003744 AFB70054 */  sw         $s7, 0x54($sp)
/* 4348 80003748 AFB5004C */  sw         $s5, 0x4c($sp)
/* 434C 8000374C AFB40048 */  sw         $s4, 0x48($sp)
/* 4350 80003750 AFB30044 */  sw         $s3, 0x44($sp)
/* 4354 80003754 AFB1003C */  sw         $s1, 0x3c($sp)
/* 4358 80003758 0C017B7E */  jal        widget_left_side_menu_skill
/* 435C 8000375C AFB00038 */   sw        $s0, 0x38($sp)
/* 4360 80003760 02C02021 */  addu       $a0, $s6, $zero
/* 4364 80003764 24060017 */  addiu      $a2, $zero, 0x17
/* 4368 80003768 24070046 */  addiu      $a3, $zero, 0x46
/* 436C 8000376C 3C02800D */  lui        $v0, %hi(widget_methods_ArmorCraft)
/* 4370 80003770 24427330 */  addiu      $v0, $v0, %lo(widget_methods_ArmorCraft)
/* 4374 80003774 24130082 */  addiu      $s3, $zero, 0x82
/* 4378 80003778 24100050 */  addiu      $s0, $zero, 0x50
/* 437C 8000377C AEC20078 */  sw         $v0, 0x78($s6)
/* 4380 80003780 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4384 80003784 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4388 80003788 AFB30010 */  sw         $s3, 0x10($sp)
/* 438C 8000378C AFB00014 */  sw         $s0, 0x14($sp)
/* 4390 80003790 AFB00018 */  sw         $s0, 0x18($sp)
/* 4394 80003794 8C43204C */  lw         $v1, 0x204c($v0)
/* 4398 80003798 241100FF */  addiu      $s1, $zero, 0xff
/* 439C 8000379C AFB1001C */  sw         $s1, 0x1c($sp)
/* 43A0 800037A0 8C650738 */  lw         $a1, 0x738($v1)
/* 43A4 800037A4 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 43A8 800037A8 8C5715F8 */   lw        $s7, 0x15f8($v0)
/* 43AC 800037AC 0040A021 */  addu       $s4, $v0, $zero
/* 43B0 800037B0 8E830078 */  lw         $v1, 0x78($s4)
/* 43B4 800037B4 0000A821 */  addu       $s5, $zero, $zero
/* 43B8 800037B8 84640018 */  lh         $a0, 0x18($v1)
/* 43BC 800037BC 8C62001C */  lw         $v0, 0x1c($v1)
/* 43C0 800037C0 0040F809 */  jalr       $v0
/* 43C4 800037C4 02842021 */   addu      $a0, $s4, $a0
/* 43C8 800037C8 02802021 */  addu       $a0, $s4, $zero
/* 43CC 800037CC 00021042 */  srl        $v0, $v0, 1
/* 43D0 800037D0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 43D4 800037D4 2405005D */  addiu      $a1, $zero, 0x5d
/* 43D8 800037D8 86860062 */  lh         $a2, 0x62($s4)
/* 43DC 800037DC 0C02DD3F */  jal        set_widget_coords
/* 43E0 800037E0 00A22823 */   subu      $a1, $a1, $v0
/* 43E4 800037E4 8E830078 */  lw         $v1, 0x78($s4)
/* 43E8 800037E8 3C1E800F */  lui        $fp, 0x800f
/* 43EC 800037EC 84640020 */  lh         $a0, 0x20($v1)
/* 43F0 800037F0 8C620024 */  lw         $v0, 0x24($v1)
/* 43F4 800037F4 0040F809 */  jalr       $v0
/* 43F8 800037F8 02842021 */   addu      $a0, $s4, $a0
/* 43FC 800037FC 02C02021 */  addu       $a0, $s6, $zero
/* 4400 80003800 24050005 */  addiu      $a1, $zero, 5
/* 4404 80003804 24060017 */  addiu      $a2, $zero, 0x17
/* 4408 80003808 24420046 */  addiu      $v0, $v0, 0x46
/* 440C 8000380C 00021400 */  sll        $v0, $v0, 0x10
/* 4410 80003810 00021403 */  sra        $v0, $v0, 0x10
/* 4414 80003814 3048FFFF */  andi       $t0, $v0, 0xffff
/* 4418 80003818 01003821 */  addu       $a3, $t0, $zero
/* 441C 8000381C 24030017 */  addiu      $v1, $zero, 0x17
/* 4420 80003820 AFA30010 */  sw         $v1, 0x10($sp)
/* 4424 80003824 240300A3 */  addiu      $v1, $zero, 0xa3
/* 4428 80003828 24420075 */  addiu      $v0, $v0, 0x75
/* 442C 8000382C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4430 80003830 AFA80014 */  sw         $t0, 0x14($sp)
/* 4434 80003834 AFA30018 */  sw         $v1, 0x18($sp)
/* 4438 80003838 AFA2001C */  sw         $v0, 0x1c($sp)
/* 443C 8000383C AFB30020 */  sw         $s3, 0x20($sp)
/* 4440 80003840 AFB00024 */  sw         $s0, 0x24($sp)
/* 4444 80003844 AFB00028 */  sw         $s0, 0x28($sp)
/* 4448 80003848 AFB1002C */  sw         $s1, 0x2c($sp)
/* 444C 8000384C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 4450 80003850 AFA00030 */   sw        $zero, 0x30($sp)
/* 4454 80003854 00402021 */  addu       $a0, $v0, $zero
/* 4458 80003858 24050044 */  addiu      $a1, $zero, 0x44
/* 445C 8000385C 2406002A */  addiu      $a2, $zero, 0x2a
/* 4460 80003860 24070022 */  addiu      $a3, $zero, 0x22
/* 4464 80003864 AEC20080 */  sw         $v0, 0x80($s6)
/* 4468 80003868 24020097 */  addiu      $v0, $zero, 0x97
/* 446C 8000386C 2403008D */  addiu      $v1, $zero, 0x8d
/* 4470 80003870 AFA20014 */  sw         $v0, 0x14($sp)
/* 4474 80003874 240200BF */  addiu      $v0, $zero, 0xbf
/* 4478 80003878 AFA2001C */  sw         $v0, 0x1c($sp)
/* 447C 8000387C 24020014 */  addiu      $v0, $zero, 0x14
/* 4480 80003880 AFB10010 */  sw         $s1, 0x10($sp)
/* 4484 80003884 AFA30018 */  sw         $v1, 0x18($sp)
/* 4488 80003888 AFB10020 */  sw         $s1, 0x20($sp)
/* 448C 8000388C 0C02F085 */  jal        set_widgetSubstruct8
/* 4490 80003890 AFA20024 */   sw        $v0, 0x24($sp)
/* 4494 80003894 3C02800E */  lui        $v0, %hi(armorCraft_recipies)
/* 4498 80003898 24536110 */  addiu      $s3, $v0, %lo(armorCraft_recipies)
/* 449C 8000389C 00129080 */  sll        $s2, $s2, 2
/* 44A0 800038A0 02F29021 */  addu       $s2, $s7, $s2
/* 44A4 800038A4 8E520000 */  lw         $s2, ($s2)
.L800038A8:
/* 44A8 800038A8 3C05800F */  lui        $a1, %hi(item_pointer)
/* 44AC 800038AC 96660000 */  lhu        $a2, ($s3)
/* 44B0 800038B0 8EE40010 */  lw         $a0, 0x10($s7)
/* 44B4 800038B4 8CA314F0 */  lw         $v1, %lo(item_pointer)($a1)
/* 44B8 800038B8 00061040 */  sll        $v0, $a2, 1
/* 44BC 800038BC 00461021 */  addu       $v0, $v0, $a2
/* 44C0 800038C0 8C650018 */  lw         $a1, 0x18($v1)
/* 44C4 800038C4 00021100 */  sll        $v0, $v0, 4
/* 44C8 800038C8 00451021 */  addu       $v0, $v0, $a1
/* 44CC 800038CC 0C01F070 */  jal        has_item_func
/* 44D0 800038D0 94450000 */   lhu       $a1, ($v0)
/* 44D4 800038D4 50400022 */  beql       $v0, $zero, .L80003960
/* 44D8 800038D8 26B50001 */   addiu     $s5, $s5, 1
/* 44DC 800038DC 8E44001C */  lw         $a0, 0x1c($s2)
/* 44E0 800038E0 0C020F4B */  jal        capskillBaseMax
/* 44E4 800038E4 24050004 */   addiu     $a1, $zero, 4
/* 44E8 800038E8 92630004 */  lbu        $v1, 4($s3)
/* 44EC 800038EC 0043102A */  slt        $v0, $v0, $v1
/* 44F0 800038F0 5440001B */  bnel       $v0, $zero, .L80003960
/* 44F4 800038F4 26B50001 */   addiu     $s5, $s5, 1
/* 44F8 800038F8 2404007C */  addiu      $a0, $zero, 0x7c
/* 44FC 800038FC 92630002 */  lbu        $v1, 2($s3)
/* 4500 80003900 8FC5F7B0 */  lw         $a1, -0x850($fp)
/* 4504 80003904 00031040 */  sll        $v0, $v1, 1
/* 4508 80003908 00431021 */  addu       $v0, $v0, $v1
/* 450C 8000390C 00021080 */  sll        $v0, $v0, 2
/* 4510 80003910 00431021 */  addu       $v0, $v0, $v1
/* 4514 80003914 8CB00004 */  lw         $s0, 4($a1)
/* 4518 80003918 00021080 */  sll        $v0, $v0, 2
/* 451C 8000391C 02028021 */  addu       $s0, $s0, $v0
/* 4520 80003920 0C026259 */  jal        passToMalloc
/* 4524 80003924 26100002 */   addiu     $s0, $s0, 2
/* 4528 80003928 02002021 */  addu       $a0, $s0, $zero
/* 452C 8000392C 0C03353E */  jal        strlen
/* 4530 80003930 00408821 */   addu      $s1, $v0, $zero
/* 4534 80003934 02202021 */  addu       $a0, $s1, $zero
/* 4538 80003938 02002821 */  addu       $a1, $s0, $zero
/* 453C 8000393C 24420001 */  addiu      $v0, $v0, 1
/* 4540 80003940 0C02E3A0 */  jal        widgettext_func_2
/* 4544 80003944 3046FFFF */   andi      $a2, $v0, 0xffff
/* 4548 80003948 0040A021 */  addu       $s4, $v0, $zero
/* 454C 8000394C 8EC40080 */  lw         $a0, 0x80($s6)
/* 4550 80003950 0C02E885 */  jal        link_widget_text
/* 4554 80003954 02802821 */   addu      $a1, $s4, $zero
/* 4558 80003958 A695005E */  sh         $s5, 0x5e($s4)
/* 455C 8000395C 26B50001 */  addiu      $s5, $s5, 1
.L80003960:
/* 4560 80003960 2EA20005 */  sltiu      $v0, $s5, 5
/* 4564 80003964 1440FFD0 */  bnez       $v0, .L800038A8
/* 4568 80003968 26730006 */   addiu     $s3, $s3, 6
/* 456C 8000396C 02C01021 */  addu       $v0, $s6, $zero
/* 4570 80003970 8FBF005C */  lw         $ra, 0x5c($sp)
/* 4574 80003974 8FBE0058 */  lw         $fp, 0x58($sp)
/* 4578 80003978 8FB70054 */  lw         $s7, 0x54($sp)
/* 457C 8000397C 8FB60050 */  lw         $s6, 0x50($sp)
/* 4580 80003980 8FB5004C */  lw         $s5, 0x4c($sp)
/* 4584 80003984 8FB40048 */  lw         $s4, 0x48($sp)
/* 4588 80003988 8FB30044 */  lw         $s3, 0x44($sp)
/* 458C 8000398C 8FB20040 */  lw         $s2, 0x40($sp)
/* 4590 80003990 8FB1003C */  lw         $s1, 0x3c($sp)
/* 4594 80003994 8FB00038 */  lw         $s0, 0x38($sp)
/* 4598 80003998 03E00008 */  jr         $ra
/* 459C 8000399C 27BD0060 */   addiu     $sp, $sp, 0x60

glabel armor_crafting_func
/* 45A0 800039A0 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 45A4 800039A4 AFB1009C */  sw         $s1, 0x9c($sp)
/* 45A8 800039A8 00808821 */  addu       $s1, $a0, $zero
/* 45AC 800039AC AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 45B0 800039B0 AFB00098 */  sw         $s0, 0x98($sp)
/* 45B4 800039B4 8E240080 */  lw         $a0, 0x80($s1)
/* 45B8 800039B8 14800006 */  bnez       $a0, .L800039D4
/* 45BC 800039BC 00000000 */   nop
/* 45C0 800039C0 02202021 */  addu       $a0, $s1, $zero
/* 45C4 800039C4 0C02DEC8 */  jal        set_widgets_byte0x70
/* 45C8 800039C8 24050005 */   addiu     $a1, $zero, 5
/* 45CC 800039CC 08000EA5 */  j          .L80003A94
/* 45D0 800039D0 00001021 */   addu      $v0, $zero, $zero
.L800039D4:
/* 45D4 800039D4 0C02F031 */  jal        func_800BC0C4
/* 45D8 800039D8 3C10800E */   lui       $s0, %hi(gGlobals)
/* 45DC 800039DC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 45E0 800039E0 9043005F */  lbu        $v1, 0x5f($v0)
/* 45E4 800039E4 3C02800E */  lui        $v0, %hi(armorCraft_recipies)
/* 45E8 800039E8 24426110 */  addiu      $v0, $v0, %lo(armorCraft_recipies)
/* 45EC 800039EC 3C07800F */  lui        $a3, 0x800f
/* 45F0 800039F0 8E0415F8 */  lw         $a0, 0x15f8($s0)
/* 45F4 800039F4 00034040 */  sll        $t0, $v1, 1
/* 45F8 800039F8 01034021 */  addu       $t0, $t0, $v1
/* 45FC 800039FC 00084040 */  sll        $t0, $t0, 1
/* 4600 80003A00 01024021 */  addu       $t0, $t0, $v0
/* 4604 80003A04 3C02800F */  lui        $v0, %hi(item_pointer)
/* 4608 80003A08 95060000 */  lhu        $a2, ($t0)
/* 460C 80003A0C 8C4514F0 */  lw         $a1, %lo(item_pointer)($v0)
/* 4610 80003A10 00061840 */  sll        $v1, $a2, 1
/* 4614 80003A14 00661821 */  addu       $v1, $v1, $a2
/* 4618 80003A18 00031900 */  sll        $v1, $v1, 4
/* 461C 80003A1C 8CA20018 */  lw         $v0, 0x18($a1)
/* 4620 80003A20 91050002 */  lbu        $a1, 2($t0)
/* 4624 80003A24 8CE6F7B0 */  lw         $a2, -0x850($a3)
/* 4628 80003A28 00621821 */  addu       $v1, $v1, $v0
/* 462C 80003A2C 00051040 */  sll        $v0, $a1, 1
/* 4630 80003A30 00451021 */  addu       $v0, $v0, $a1
/* 4634 80003A34 00021080 */  sll        $v0, $v0, 2
/* 4638 80003A38 00451021 */  addu       $v0, $v0, $a1
/* 463C 80003A3C 00021080 */  sll        $v0, $v0, 2
/* 4640 80003A40 8CC70004 */  lw         $a3, 4($a2)
/* 4644 80003A44 9225007F */  lbu        $a1, 0x7f($s1)
/* 4648 80003A48 00471021 */  addu       $v0, $v0, $a3
/* 464C 80003A4C 94460000 */  lhu        $a2, ($v0)
/* 4650 80003A50 91020003 */  lbu        $v0, 3($t0)
/* 4654 80003A54 94670000 */  lhu        $a3, ($v1)
/* 4658 80003A58 0C020B38 */  jal        AmorCraft_attempt
/* 465C 80003A5C AFA20010 */   sw        $v0, 0x10($sp)
/* 4660 80003A60 8E05204C */  lw         $a1, 0x204c($s0)
/* 4664 80003A64 8CA3073C */  lw         $v1, 0x73c($a1)
/* 4668 80003A68 AFA30058 */  sw         $v1, 0x58($sp)
/* 466C 80003A6C 8CA40740 */  lw         $a0, 0x740($a1)
/* 4670 80003A70 00021080 */  sll        $v0, $v0, 2
/* 4674 80003A74 AFA30018 */  sw         $v1, 0x18($sp)
/* 4678 80003A78 03A21821 */  addu       $v1, $sp, $v0
/* 467C 80003A7C AFA4005C */  sw         $a0, 0x5c($sp)
/* 4680 80003A80 AFA4001C */  sw         $a0, 0x1c($sp)
/* 4684 80003A84 8C650018 */  lw         $a1, 0x18($v1)
/* 4688 80003A88 0C017C0D */  jal        func_8005F034
/* 468C 80003A8C 02202021 */   addu      $a0, $s1, $zero
/* 4690 80003A90 00001021 */  addu       $v0, $zero, $zero
.L80003A94:
/* 4694 80003A94 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 4698 80003A98 8FB1009C */  lw         $s1, 0x9c($sp)
/* 469C 80003A9C 8FB00098 */  lw         $s0, 0x98($sp)
/* 46A0 80003AA0 03E00008 */  jr         $ra
/* 46A4 80003AA4 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel craft_armor
/* 46A8 80003AA8 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 46AC 80003AAC AFBF0050 */  sw         $ra, 0x50($sp)
/* 46B0 80003AB0 8C840080 */  lw         $a0, 0x80($a0)
/* 46B4 80003AB4 10800023 */  beqz       $a0, .L80003B44
/* 46B8 80003AB8 00001021 */   addu      $v0, $zero, $zero
/* 46BC 80003ABC 0C02F031 */  jal        func_800BC0C4
/* 46C0 80003AC0 00000000 */   nop
/* 46C4 80003AC4 9043005F */  lbu        $v1, 0x5f($v0)
/* 46C8 80003AC8 3C05800F */  lui        $a1, 0x800f
/* 46CC 80003ACC 00031040 */  sll        $v0, $v1, 1
/* 46D0 80003AD0 00431021 */  addu       $v0, $v0, $v1
/* 46D4 80003AD4 00021040 */  sll        $v0, $v0, 1
/* 46D8 80003AD8 3C03800E */  lui        $v1, %hi(armorCraft_recipies)
/* 46DC 80003ADC 24636110 */  addiu      $v1, $v1, %lo(armorCraft_recipies)
/* 46E0 80003AE0 00431021 */  addu       $v0, $v0, $v1
/* 46E4 80003AE4 90440002 */  lbu        $a0, 2($v0)
/* 46E8 80003AE8 8CA3F7B0 */  lw         $v1, -0x850($a1)
/* 46EC 80003AEC 00041040 */  sll        $v0, $a0, 1
/* 46F0 80003AF0 00441021 */  addu       $v0, $v0, $a0
/* 46F4 80003AF4 00021080 */  sll        $v0, $v0, 2
/* 46F8 80003AF8 00441021 */  addu       $v0, $v0, $a0
/* 46FC 80003AFC 8C650004 */  lw         $a1, 4($v1)
/* 4700 80003B00 00021080 */  sll        $v0, $v0, 2
/* 4704 80003B04 00451021 */  addu       $v0, $v0, $a1
/* 4708 80003B08 94450000 */  lhu        $a1, ($v0)
/* 470C 80003B0C 0C01DCA0 */  jal        make_temp_armor_3
/* 4710 80003B10 27A40010 */   addiu     $a0, $sp, 0x10
/* 4714 80003B14 0C026259 */  jal        passToMalloc
/* 4718 80003B18 24040080 */   addiu     $a0, $zero, 0x80
/* 471C 80003B1C 00402021 */  addu       $a0, $v0, $zero
/* 4720 80003B20 0C00EE24 */  jal        armor_info
/* 4724 80003B24 27A50010 */   addiu     $a1, $sp, 0x10
/* 4728 80003B28 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 472C 80003B2C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 4730 80003B30 0C02DC7C */  jal        widgetHandler
/* 4734 80003B34 00402821 */   addu      $a1, $v0, $zero
/* 4738 80003B38 0C01DCC4 */  jal        pssto_clear_weapon_effects
/* 473C 80003B3C 27A40010 */   addiu     $a0, $sp, 0x10
/* 4740 80003B40 00001021 */  addu       $v0, $zero, $zero
.L80003B44:
/* 4744 80003B44 8FBF0050 */  lw         $ra, 0x50($sp)
/* 4748 80003B48 03E00008 */  jr         $ra
/* 474C 80003B4C 27BD0058 */   addiu     $sp, $sp, 0x58

glabel widget_armorcraft_free
/* 4750 80003B50 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4754 80003B54 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4758 80003B58 0C02E66C */  jal        widget_menu_free
/* 475C 80003B5C 00000000 */   nop
/* 4760 80003B60 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4764 80003B64 03E00008 */  jr         $ra
/* 4768 80003B68 27BD0018 */   addiu     $sp, $sp, 0x18
/* 476C 80003B6C 00000000 */  nop
