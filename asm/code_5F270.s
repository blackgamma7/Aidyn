.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel cinematictext_widget
/* 5F270 8005E670 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 5F274 8005E674 AFB5002C */  sw         $s5, 0x2c($sp)
/* 5F278 8005E678 8FB50048 */  lw         $s5, 0x48($sp)
/* 5F27C 8005E67C AFB00018 */  sw         $s0, 0x18($sp)
/* 5F280 8005E680 00808021 */  addu       $s0, $a0, $zero
/* 5F284 8005E684 AFB20020 */  sw         $s2, 0x20($sp)
/* 5F288 8005E688 8FB2004C */  lw         $s2, 0x4c($sp)
/* 5F28C 8005E68C AFB1001C */  sw         $s1, 0x1c($sp)
/* 5F290 8005E690 00A08821 */  addu       $s1, $a1, $zero
/* 5F294 8005E694 AFB60030 */  sw         $s6, 0x30($sp)
/* 5F298 8005E698 30D6FFFF */  andi       $s6, $a2, 0xffff
/* 5F29C 8005E69C AFB30024 */  sw         $s3, 0x24($sp)
/* 5F2A0 8005E6A0 30F3FFFF */  andi       $s3, $a3, 0xffff
/* 5F2A4 8005E6A4 AFBF0034 */  sw         $ra, 0x34($sp)
/* 5F2A8 8005E6A8 0C02E658 */  jal        widget_menu_build
/* 5F2AC 8005E6AC AFB40028 */   sw        $s4, 0x28($sp)
/* 5F2B0 8005E6B0 02002021 */  addu       $a0, $s0, $zero
/* 5F2B4 8005E6B4 240501C4 */  addiu      $a1, $zero, 0x1c4
/* 5F2B8 8005E6B8 3C02800E */  lui        $v0, %hi(D_800DF198)
/* 5F2BC 8005E6BC 2442F198 */  addiu      $v0, $v0, %lo(D_800DF198)
/* 5F2C0 8005E6C0 24140140 */  addiu      $s4, $zero, 0x140
/* 5F2C4 8005E6C4 AE020078 */  sw         $v0, 0x78($s0)
/* 5F2C8 8005E6C8 AE00007C */  sw         $zero, 0x7c($s0)
/* 5F2CC 8005E6CC AE000080 */  sw         $zero, 0x80($s0)
/* 5F2D0 8005E6D0 AE000084 */  sw         $zero, 0x84($s0)
/* 5F2D4 8005E6D4 8A220000 */  lwl        $v0, ($s1)
/* 5F2D8 8005E6D8 9A220003 */  lwr        $v0, 3($s1)
/* 5F2DC 8005E6DC 8A230004 */  lwl        $v1, 4($s1)
/* 5F2E0 8005E6E0 9A230007 */  lwr        $v1, 7($s1)
/* 5F2E4 8005E6E4 AA020088 */  swl        $v0, 0x88($s0)
/* 5F2E8 8005E6E8 BA02008B */  swr        $v0, 0x8b($s0)
/* 5F2EC 8005E6EC AA03008C */  swl        $v1, 0x8c($s0)
/* 5F2F0 8005E6F0 BA03008F */  swr        $v1, 0x8f($s0)
/* 5F2F4 8005E6F4 A6160090 */  sh         $s6, 0x90($s0)
/* 5F2F8 8005E6F8 A6130092 */  sh         $s3, 0x92($s0)
/* 5F2FC 8005E6FC 96230000 */  lhu        $v1, ($s1)
/* 5F300 8005E700 96270002 */  lhu        $a3, 2($s1)
/* 5F304 8005E704 96280004 */  lhu        $t0, 4($s1)
/* 5F308 8005E708 96290006 */  lhu        $t1, 6($s1)
/* 5F30C 8005E70C 26020088 */  addiu      $v0, $s0, 0x88
/* 5F310 8005E710 AFB40010 */  sw         $s4, 0x10($sp)
/* 5F314 8005E714 A6030088 */  sh         $v1, 0x88($s0)
/* 5F318 8005E718 A4470002 */  sh         $a3, 2($v0)
/* 5F31C 8005E71C A4480004 */  sh         $t0, 4($v0)
/* 5F320 8005E720 A4490006 */  sh         $t1, 6($v0)
/* 5F324 8005E724 96270002 */  lhu        $a3, 2($s1)
/* 5F328 8005E728 96220006 */  lhu        $v0, 6($s1)
/* 5F32C 8005E72C 00003021 */  addu       $a2, $zero, $zero
/* 5F330 8005E730 AE120094 */  sw         $s2, 0x94($s0)
/* 5F334 8005E734 0C013349 */  jal        make_borg8_widget
/* 5F338 8005E738 AFA20014 */   sw        $v0, 0x14($sp)
/* 5F33C 8005E73C 00002821 */  addu       $a1, $zero, $zero
/* 5F340 8005E740 00003021 */  addu       $a2, $zero, $zero
/* 5F344 8005E744 8C480078 */  lw         $t0, 0x78($v0)
/* 5F348 8005E748 00003821 */  addu       $a3, $zero, $zero
/* 5F34C 8005E74C AE020080 */  sw         $v0, 0x80($s0)
/* 5F350 8005E750 85040048 */  lh         $a0, 0x48($t0)
/* 5F354 8005E754 241200FF */  addiu      $s2, $zero, 0xff
/* 5F358 8005E758 AFB20010 */  sw         $s2, 0x10($sp)
/* 5F35C 8005E75C 8D03004C */  lw         $v1, 0x4c($t0)
/* 5F360 8005E760 0060F809 */  jalr       $v1
/* 5F364 8005E764 00442021 */   addu      $a0, $v0, $a0
/* 5F368 8005E768 0C0290E2 */  jal        get_borg_8
/* 5F36C 8005E76C 240401C3 */   addiu     $a0, $zero, 0x1c3
/* 5F370 8005E770 02002021 */  addu       $a0, $s0, $zero
/* 5F374 8005E774 00402821 */  addu       $a1, $v0, $zero
/* 5F378 8005E778 96220002 */  lhu        $v0, 2($s1)
/* 5F37C 8005E77C 00003021 */  addu       $a2, $zero, $zero
/* 5F380 8005E780 AFB40010 */  sw         $s4, 0x10($sp)
/* 5F384 8005E784 2447FFF5 */  addiu      $a3, $v0, -0xb
/* 5F388 8005E788 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 5F38C 8005E78C 2442FFFF */  addiu      $v0, $v0, -1
/* 5F390 8005E790 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5F394 8005E794 0C02F40F */  jal        func_800BD03C
/* 5F398 8005E798 AFA20014 */   sw        $v0, 0x14($sp)
/* 5F39C 8005E79C 00002821 */  addu       $a1, $zero, $zero
/* 5F3A0 8005E7A0 8C480078 */  lw         $t0, 0x78($v0)
/* 5F3A4 8005E7A4 00003021 */  addu       $a2, $zero, $zero
/* 5F3A8 8005E7A8 AE020084 */  sw         $v0, 0x84($s0)
/* 5F3AC 8005E7AC 85040048 */  lh         $a0, 0x48($t0)
/* 5F3B0 8005E7B0 00003821 */  addu       $a3, $zero, $zero
/* 5F3B4 8005E7B4 AFB20010 */  sw         $s2, 0x10($sp)
/* 5F3B8 8005E7B8 8D03004C */  lw         $v1, 0x4c($t0)
/* 5F3BC 8005E7BC 0060F809 */  jalr       $v1
/* 5F3C0 8005E7C0 00442021 */   addu      $a0, $v0, $a0
/* 5F3C4 8005E7C4 0C026259 */  jal        passToMalloc
/* 5F3C8 8005E7C8 2404007C */   addiu     $a0, $zero, 0x7c
/* 5F3CC 8005E7CC 00402021 */  addu       $a0, $v0, $zero
/* 5F3D0 8005E7D0 3C05800E */  lui        $a1, %hi(D_800DF190)
/* 5F3D4 8005E7D4 24A5F190 */  addiu      $a1, $a1, %lo(D_800DF190)
/* 5F3D8 8005E7D8 0C02E3A0 */  jal        widgettext_func_2
/* 5F3DC 8005E7DC 24060100 */   addiu     $a2, $zero, 0x100
/* 5F3E0 8005E7E0 96250000 */  lhu        $a1, ($s1)
/* 5F3E4 8005E7E4 96260002 */  lhu        $a2, 2($s1)
/* 5F3E8 8005E7E8 96270004 */  lhu        $a3, 4($s1)
/* 5F3EC 8005E7EC 00402021 */  addu       $a0, $v0, $zero
/* 5F3F0 8005E7F0 AE02007C */  sw         $v0, 0x7c($s0)
/* 5F3F4 8005E7F4 96220006 */  lhu        $v0, 6($s1)
/* 5F3F8 8005E7F8 02C52821 */  addu       $a1, $s6, $a1
/* 5F3FC 8005E7FC 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 5F400 8005E800 02663021 */  addu       $a2, $s3, $a2
/* 5F404 8005E804 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 5F408 8005E808 24E7FFFB */  addiu      $a3, $a3, -5
/* 5F40C 8005E80C 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 5F410 8005E810 00531023 */  subu       $v0, $v0, $s3
/* 5F414 8005E814 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5F418 8005E818 0C00193A */  jal        func_800064E8
/* 5F41C 8005E81C AFA20010 */   sw        $v0, 0x10($sp)
/* 5F420 8005E820 8E04007C */  lw         $a0, 0x7c($s0)
/* 5F424 8005E824 96250000 */  lhu        $a1, ($s1)
/* 5F428 8005E828 96260002 */  lhu        $a2, 2($s1)
/* 5F42C 8005E82C 00B62821 */  addu       $a1, $a1, $s6
/* 5F430 8005E830 0C02DD3F */  jal        set_widget_coords
/* 5F434 8005E834 00D33021 */   addu      $a2, $a2, $s3
/* 5F438 8005E838 8E09007C */  lw         $t1, 0x7c($s0)
/* 5F43C 8005E83C 92A20003 */  lbu        $v0, 3($s5)
/* 5F440 8005E840 92A50000 */  lbu        $a1, ($s5)
/* 5F444 8005E844 92A60001 */  lbu        $a2, 1($s5)
/* 5F448 8005E848 8D280078 */  lw         $t0, 0x78($t1)
/* 5F44C 8005E84C 92A70002 */  lbu        $a3, 2($s5)
/* 5F450 8005E850 85040048 */  lh         $a0, 0x48($t0)
/* 5F454 8005E854 AFA20010 */  sw         $v0, 0x10($sp)
/* 5F458 8005E858 8D03004C */  lw         $v1, 0x4c($t0)
/* 5F45C 8005E85C 0060F809 */  jalr       $v1
/* 5F460 8005E860 01242021 */   addu      $a0, $t1, $a0
/* 5F464 8005E864 8E05007C */  lw         $a1, 0x7c($s0)
/* 5F468 8005E868 0C02DEDC */  jal        link_widgets
/* 5F46C 8005E86C 02002021 */   addu      $a0, $s0, $zero
/* 5F470 8005E870 02001021 */  addu       $v0, $s0, $zero
/* 5F474 8005E874 8FBF0034 */  lw         $ra, 0x34($sp)
/* 5F478 8005E878 8FB60030 */  lw         $s6, 0x30($sp)
/* 5F47C 8005E87C 8FB5002C */  lw         $s5, 0x2c($sp)
/* 5F480 8005E880 8FB40028 */  lw         $s4, 0x28($sp)
/* 5F484 8005E884 8FB30024 */  lw         $s3, 0x24($sp)
/* 5F488 8005E888 8FB20020 */  lw         $s2, 0x20($sp)
/* 5F48C 8005E88C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5F490 8005E890 8FB00018 */  lw         $s0, 0x18($sp)
/* 5F494 8005E894 03E00008 */  jr         $ra
/* 5F498 8005E898 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8005E89C
/* 5F49C 8005E89C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5F4A0 8005E8A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 5F4A4 8005E8A4 00808021 */  addu       $s0, $a0, $zero
/* 5F4A8 8005E8A8 3C02800E */  lui        $v0, %hi(D_800DF198)
/* 5F4AC 8005E8AC 2442F198 */  addiu      $v0, $v0, %lo(D_800DF198)
/* 5F4B0 8005E8B0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5F4B4 8005E8B4 AFB10014 */  sw         $s1, 0x14($sp)
/* 5F4B8 8005E8B8 8E040084 */  lw         $a0, 0x84($s0)
/* 5F4BC 8005E8BC 00A08821 */  addu       $s1, $a1, $zero
/* 5F4C0 8005E8C0 0C0133E5 */  jal        free_borg8_widget
/* 5F4C4 8005E8C4 AE020078 */   sw        $v0, 0x78($s0)
/* 5F4C8 8005E8C8 0C0133E5 */  jal        free_borg8_widget
/* 5F4CC 8005E8CC 8E040080 */   lw        $a0, 0x80($s0)
/* 5F4D0 8005E8D0 02002021 */  addu       $a0, $s0, $zero
/* 5F4D4 8005E8D4 0C02E66C */  jal        widget_menu_free
/* 5F4D8 8005E8D8 02202821 */   addu      $a1, $s1, $zero
/* 5F4DC 8005E8DC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5F4E0 8005E8E0 8FB10014 */  lw         $s1, 0x14($sp)
/* 5F4E4 8005E8E4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F4E8 8005E8E8 03E00008 */  jr         $ra
/* 5F4EC 8005E8EC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005E8F0
/* 5F4F0 8005E8F0 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 5F4F4 8005E8F4 AFB1005C */  sw         $s1, 0x5c($sp)
/* 5F4F8 8005E8F8 00808821 */  addu       $s1, $a0, $zero
/* 5F4FC 8005E8FC AFBF0060 */  sw         $ra, 0x60($sp)
/* 5F500 8005E900 AFB00058 */  sw         $s0, 0x58($sp)
/* 5F504 8005E904 8E24007C */  lw         $a0, 0x7c($s1)
/* 5F508 8005E908 0C02EEBC */  jal        func_800BBAF0
/* 5F50C 8005E90C 00A08021 */   addu      $s0, $a1, $zero
/* 5F510 8005E910 00402021 */  addu       $a0, $v0, $zero
/* 5F514 8005E914 0C02626C */  jal        copy_string
/* 5F518 8005E918 02002821 */   addu      $a1, $s0, $zero
/* 5F51C 8005E91C 8E230094 */  lw         $v1, 0x94($s1)
/* 5F520 8005E920 10600060 */  beqz       $v1, .L8005EAA4
/* 5F524 8005E924 8FBF0060 */   lw        $ra, 0x60($sp)
/* 5F528 8005E928 9630008E */  lhu        $s0, 0x8e($s1)
/* 5F52C 8005E92C 9622008A */  lhu        $v0, 0x8a($s1)
/* 5F530 8005E930 8E23007C */  lw         $v1, 0x7c($s1)
/* 5F534 8005E934 02028023 */  subu       $s0, $s0, $v0
/* 5F538 8005E938 8C650078 */  lw         $a1, 0x78($v1)
/* 5F53C 8005E93C 3210FFFF */  andi       $s0, $s0, 0xffff
/* 5F540 8005E940 84A40020 */  lh         $a0, 0x20($a1)
/* 5F544 8005E944 8CA20024 */  lw         $v0, 0x24($a1)
/* 5F548 8005E948 0040F809 */  jalr       $v0
/* 5F54C 8005E94C 00642021 */   addu      $a0, $v1, $a0
/* 5F550 8005E950 96230088 */  lhu        $v1, 0x88($s1)
/* 5F554 8005E954 A7A30018 */  sh         $v1, 0x18($sp)
/* 5F558 8005E958 27A30018 */  addiu      $v1, $sp, 0x18
/* 5F55C 8005E95C 96240092 */  lhu        $a0, 0x92($s1)
/* 5F560 8005E960 9625008A */  lhu        $a1, 0x8a($s1)
/* 5F564 8005E964 9626008C */  lhu        $a2, 0x8c($s1)
/* 5F568 8005E968 9627008E */  lhu        $a3, 0x8e($s1)
/* 5F56C 8005E96C 00821021 */  addu       $v0, $a0, $v0
/* 5F570 8005E970 00822021 */  addu       $a0, $a0, $v0
/* 5F574 8005E974 3084FFFF */  andi       $a0, $a0, 0xffff
/* 5F578 8005E978 0204802B */  sltu       $s0, $s0, $a0
/* 5F57C 8005E97C A4650002 */  sh         $a1, 2($v1)
/* 5F580 8005E980 A4660004 */  sh         $a2, 4($v1)
/* 5F584 8005E984 12000004 */  beqz       $s0, .L8005E998
/* 5F588 8005E988 A4670006 */   sh        $a3, 6($v1)
/* 5F58C 8005E98C 97A2001E */  lhu        $v0, 0x1e($sp)
/* 5F590 8005E990 00441023 */  subu       $v0, $v0, $a0
/* 5F594 8005E994 A7A2001A */  sh         $v0, 0x1a($sp)
.L8005E998:
/* 5F598 8005E998 8E240080 */  lw         $a0, 0x80($s1)
/* 5F59C 8005E99C 97A50018 */  lhu        $a1, 0x18($sp)
/* 5F5A0 8005E9A0 0C02DD3F */  jal        set_widget_coords
/* 5F5A4 8005E9A4 97A6001A */   lhu       $a2, 0x1a($sp)
/* 5F5A8 8005E9A8 97A2001E */  lhu        $v0, 0x1e($sp)
/* 5F5AC 8005E9AC 8E240080 */  lw         $a0, 0x80($s1)
/* 5F5B0 8005E9B0 97A50018 */  lhu        $a1, 0x18($sp)
/* 5F5B4 8005E9B4 97A6001A */  lhu        $a2, 0x1a($sp)
/* 5F5B8 8005E9B8 97A7001C */  lhu        $a3, 0x1c($sp)
/* 5F5BC 8005E9BC 0C00193A */  jal        func_800064E8
/* 5F5C0 8005E9C0 AFA20010 */   sw        $v0, 0x10($sp)
/* 5F5C4 8005E9C4 97A5001C */  lhu        $a1, 0x1c($sp)
/* 5F5C8 8005E9C8 97A20018 */  lhu        $v0, 0x18($sp)
/* 5F5CC 8005E9CC 8E240080 */  lw         $a0, 0x80($s1)
/* 5F5D0 8005E9D0 00A22823 */  subu       $a1, $a1, $v0
/* 5F5D4 8005E9D4 24A50001 */  addiu      $a1, $a1, 1
/* 5F5D8 8005E9D8 0C02DD42 */  jal        set_widgetHeight
/* 5F5DC 8005E9DC 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 5F5E0 8005E9E0 97A5001E */  lhu        $a1, 0x1e($sp)
/* 5F5E4 8005E9E4 97A2001A */  lhu        $v0, 0x1a($sp)
/* 5F5E8 8005E9E8 8E240080 */  lw         $a0, 0x80($s1)
/* 5F5EC 8005E9EC 00A22823 */  subu       $a1, $a1, $v0
/* 5F5F0 8005E9F0 24A50001 */  addiu      $a1, $a1, 1
/* 5F5F4 8005E9F4 0C02DD46 */  jal        set_widgetWidth
/* 5F5F8 8005E9F8 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 5F5FC 8005E9FC 8E240084 */  lw         $a0, 0x84($s1)
/* 5F600 8005EA00 97B0001A */  lhu        $s0, 0x1a($sp)
/* 5F604 8005EA04 97A50018 */  lhu        $a1, 0x18($sp)
/* 5F608 8005EA08 2610FFF5 */  addiu      $s0, $s0, -0xb
/* 5F60C 8005EA0C 3210FFFF */  andi       $s0, $s0, 0xffff
/* 5F610 8005EA10 0C02DD3F */  jal        set_widget_coords
/* 5F614 8005EA14 02003021 */   addu      $a2, $s0, $zero
/* 5F618 8005EA18 02003021 */  addu       $a2, $s0, $zero
/* 5F61C 8005EA1C 97A50018 */  lhu        $a1, 0x18($sp)
/* 5F620 8005EA20 8E240084 */  lw         $a0, 0x84($s1)
/* 5F624 8005EA24 97A2001A */  lhu        $v0, 0x1a($sp)
/* 5F628 8005EA28 97A7001C */  lhu        $a3, 0x1c($sp)
/* 5F62C 8005EA2C 2442FFFF */  addiu      $v0, $v0, -1
/* 5F630 8005EA30 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5F634 8005EA34 0C00193A */  jal        func_800064E8
/* 5F638 8005EA38 AFA20010 */   sw        $v0, 0x10($sp)
/* 5F63C 8005EA3C 97A50018 */  lhu        $a1, 0x18($sp)
/* 5F640 8005EA40 96220090 */  lhu        $v0, 0x90($s1)
/* 5F644 8005EA44 8E24007C */  lw         $a0, 0x7c($s1)
/* 5F648 8005EA48 97A6001A */  lhu        $a2, 0x1a($sp)
/* 5F64C 8005EA4C 96230092 */  lhu        $v1, 0x92($s1)
/* 5F650 8005EA50 97A7001C */  lhu        $a3, 0x1c($sp)
/* 5F654 8005EA54 00A22821 */  addu       $a1, $a1, $v0
/* 5F658 8005EA58 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 5F65C 8005EA5C 00C33021 */  addu       $a2, $a2, $v1
/* 5F660 8005EA60 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 5F664 8005EA64 24E7FFFB */  addiu      $a3, $a3, -5
/* 5F668 8005EA68 97A2001E */  lhu        $v0, 0x1e($sp)
/* 5F66C 8005EA6C 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 5F670 8005EA70 00431023 */  subu       $v0, $v0, $v1
/* 5F674 8005EA74 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5F678 8005EA78 0C00193A */  jal        func_800064E8
/* 5F67C 8005EA7C AFA20010 */   sw        $v0, 0x10($sp)
/* 5F680 8005EA80 8E24007C */  lw         $a0, 0x7c($s1)
/* 5F684 8005EA84 97A30018 */  lhu        $v1, 0x18($sp)
/* 5F688 8005EA88 96250090 */  lhu        $a1, 0x90($s1)
/* 5F68C 8005EA8C 97A2001A */  lhu        $v0, 0x1a($sp)
/* 5F690 8005EA90 96260092 */  lhu        $a2, 0x92($s1)
/* 5F694 8005EA94 00652821 */  addu       $a1, $v1, $a1
/* 5F698 8005EA98 0C02DD3F */  jal        set_widget_coords
/* 5F69C 8005EA9C 00463021 */   addu      $a2, $v0, $a2
/* 5F6A0 8005EAA0 8FBF0060 */  lw         $ra, 0x60($sp)
.L8005EAA4:
/* 5F6A4 8005EAA4 8FB1005C */  lw         $s1, 0x5c($sp)
/* 5F6A8 8005EAA8 8FB00058 */  lw         $s0, 0x58($sp)
/* 5F6AC 8005EAAC 03E00008 */  jr         $ra
/* 5F6B0 8005EAB0 27BD0068 */   addiu     $sp, $sp, 0x68
/* 5F6B4 8005EAB4 00000000 */  nop
/* 5F6B8 8005EAB8 00000000 */  nop
/* 5F6BC 8005EABC 00000000 */  nop
