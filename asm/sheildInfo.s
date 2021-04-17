.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel sheild_info
/* 3F240 8003E640 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 3F244 8003E644 AFB3006C */  sw         $s3, 0x6c($sp)
/* 3F248 8003E648 00809821 */  addu       $s3, $a0, $zero
/* 3F24C 8003E64C AFB00060 */  sw         $s0, 0x60($sp)
/* 3F250 8003E650 00A08021 */  addu       $s0, $a1, $zero
/* 3F254 8003E654 AFB40070 */  sw         $s4, 0x70($sp)
/* 3F258 8003E658 30D4FFFF */  andi       $s4, $a2, 0xffff
/* 3F25C 8003E65C AFB60078 */  sw         $s6, 0x78($sp)
/* 3F260 8003E660 30F600FF */  andi       $s6, $a3, 0xff
/* 3F264 8003E664 AFBF0080 */  sw         $ra, 0x80($sp)
/* 3F268 8003E668 AFB7007C */  sw         $s7, 0x7c($sp)
/* 3F26C 8003E66C AFB50074 */  sw         $s5, 0x74($sp)
/* 3F270 8003E670 AFB20068 */  sw         $s2, 0x68($sp)
/* 3F274 8003E674 0C02DCFC */  jal        widget_init
/* 3F278 8003E678 AFB10064 */   sw        $s1, 0x64($sp)
/* 3F27C 8003E67C 00009021 */  addu       $s2, $zero, $zero
/* 3F280 8003E680 0000A821 */  addu       $s5, $zero, $zero
/* 3F284 8003E684 3C02800E */  lui        $v0, %hi(D_800DC550)
/* 3F288 8003E688 2442C550 */  addiu      $v0, $v0, %lo(D_800DC550)
/* 3F28C 8003E68C AE620078 */  sw         $v0, 0x78($s3)
/* 3F290 8003E690 00161200 */  sll        $v0, $s6, 8
/* 3F294 8003E694 02821021 */  addu       $v0, $s4, $v0
/* 3F298 8003E698 24030001 */  addiu      $v1, $zero, 1
/* 3F29C 8003E69C AE70007C */  sw         $s0, 0x7c($s3)
/* 3F2A0 8003E6A0 AE600080 */  sw         $zero, 0x80($s3)
/* 3F2A4 8003E6A4 AE600084 */  sw         $zero, 0x84($s3)
/* 3F2A8 8003E6A8 AE60008C */  sw         $zero, 0x8c($s3)
/* 3F2AC 8003E6AC AE600088 */  sw         $zero, 0x88($s3)
/* 3F2B0 8003E6B0 A6600090 */  sh         $zero, 0x90($s3)
/* 3F2B4 8003E6B4 A6600092 */  sh         $zero, 0x92($s3)
/* 3F2B8 8003E6B8 A274005C */  sb         $s4, 0x5c($s3)
/* 3F2BC 8003E6BC 12C30032 */  beq        $s6, $v1, .L8003E788
/* 3F2C0 8003E6C0 A662005E */   sh        $v0, 0x5e($s3)
/* 3F2C4 8003E6C4 2AC20002 */  slti       $v0, $s6, 2
/* 3F2C8 8003E6C8 50400005 */  beql       $v0, $zero, .L8003E6E0
/* 3F2CC 8003E6CC 24020002 */   addiu     $v0, $zero, 2
/* 3F2D0 8003E6D0 12C00007 */  beqz       $s6, .L8003E6F0
/* 3F2D4 8003E6D4 02802021 */   addu      $a0, $s4, $zero
/* 3F2D8 8003E6D8 0800FA17 */  j          .L8003E85C
/* 3F2DC 8003E6DC 8E650080 */   lw        $a1, 0x80($s3)
.L8003E6E0:
/* 3F2E0 8003E6E0 12C20046 */  beq        $s6, $v0, .L8003E7FC
/* 3F2E4 8003E6E4 00000000 */   nop
/* 3F2E8 8003E6E8 0800FA17 */  j          .L8003E85C
/* 3F2EC 8003E6EC 8E650080 */   lw        $a1, 0x80($s3)
.L8003E6F0:
/* 3F2F0 8003E6F0 0C0132EF */  jal        get_skill_icon
/* 3F2F4 8003E6F4 27A50058 */   addiu     $a1, $sp, 0x58
/* 3F2F8 8003E6F8 0C026259 */  jal        passToMalloc
/* 3F2FC 8003E6FC 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F300 8003E700 8FA40058 */  lw         $a0, 0x58($sp)
/* 3F304 8003E704 0C0290E2 */  jal        get_borg_8
/* 3F308 8003E708 00408021 */   addu      $s0, $v0, $zero
/* 3F30C 8003E70C 02002021 */  addu       $a0, $s0, $zero
/* 3F310 8003E710 0C02E518 */  jal        borg8_widget
/* 3F314 8003E714 00402821 */   addu      $a1, $v0, $zero
/* 3F318 8003E718 2404007C */  addiu      $a0, $zero, 0x7c
/* 3F31C 8003E71C 0C026259 */  jal        passToMalloc
/* 3F320 8003E720 AE620080 */   sw        $v0, 0x80($s3)
/* 3F324 8003E724 3C12800F */  lui        $s2, %hi(skill_strings)
/* 3F328 8003E728 8E431B40 */  lw         $v1, %lo(skill_strings)($s2)
/* 3F32C 8003E72C 00148080 */  sll        $s0, $s4, 2
/* 3F330 8003E730 02031821 */  addu       $v1, $s0, $v1
/* 3F334 8003E734 8C640000 */  lw         $a0, ($v1)
/* 3F338 8003E738 0C03353E */  jal        strlen
/* 3F33C 8003E73C 00408821 */   addu      $s1, $v0, $zero
/* 3F340 8003E740 02202021 */  addu       $a0, $s1, $zero
/* 3F344 8003E744 8E431B40 */  lw         $v1, 0x1b40($s2)
/* 3F348 8003E748 24420001 */  addiu      $v0, $v0, 1
/* 3F34C 8003E74C 02038021 */  addu       $s0, $s0, $v1
/* 3F350 8003E750 8E050000 */  lw         $a1, ($s0)
/* 3F354 8003E754 0C02DFC8 */  jal        widgetcliptext_init
/* 3F358 8003E758 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3F35C 8003E75C 329000FF */  andi       $s0, $s4, 0xff
/* 3F360 8003E760 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F364 8003E764 02002821 */  addu       $a1, $s0, $zero
/* 3F368 8003E768 0C020F4B */  jal        capskillBaseMax
/* 3F36C 8003E76C AE62008C */   sw        $v0, 0x8c($s3)
/* 3F370 8003E770 3052FFFF */  andi       $s2, $v0, 0xffff
/* 3F374 8003E774 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F378 8003E778 0C020F67 */  jal        getModdedSkill
/* 3F37C 8003E77C 02002821 */   addu      $a1, $s0, $zero
/* 3F380 8003E780 0800F9FC */  j          .L8003E7F0
/* 3F384 8003E784 00521023 */   subu      $v0, $v0, $s2
.L8003E788:
/* 3F388 8003E788 0C026259 */  jal        passToMalloc
/* 3F38C 8003E78C 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F390 8003E790 3C12800F */  lui        $s2, %hi(weapon_strings)
/* 3F394 8003E794 8E431B44 */  lw         $v1, %lo(weapon_strings)($s2)
/* 3F398 8003E798 00148080 */  sll        $s0, $s4, 2
/* 3F39C 8003E79C 02031821 */  addu       $v1, $s0, $v1
/* 3F3A0 8003E7A0 8C640000 */  lw         $a0, ($v1)
/* 3F3A4 8003E7A4 0C03353E */  jal        strlen
/* 3F3A8 8003E7A8 00408821 */   addu      $s1, $v0, $zero
/* 3F3AC 8003E7AC 02202021 */  addu       $a0, $s1, $zero
/* 3F3B0 8003E7B0 8E431B44 */  lw         $v1, 0x1b44($s2)
/* 3F3B4 8003E7B4 24420001 */  addiu      $v0, $v0, 1
/* 3F3B8 8003E7B8 02038021 */  addu       $s0, $s0, $v1
/* 3F3BC 8003E7BC 8E050000 */  lw         $a1, ($s0)
/* 3F3C0 8003E7C0 0C02DFC8 */  jal        widgetcliptext_init
/* 3F3C4 8003E7C4 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3F3C8 8003E7C8 329000FF */  andi       $s0, $s4, 0xff
/* 3F3CC 8003E7CC 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F3D0 8003E7D0 02002821 */  addu       $a1, $s0, $zero
/* 3F3D4 8003E7D4 0C020F55 */  jal        capWeaponBaseMax
/* 3F3D8 8003E7D8 AE62008C */   sw        $v0, 0x8c($s3)
/* 3F3DC 8003E7DC 3052FFFF */  andi       $s2, $v0, 0xffff
/* 3F3E0 8003E7E0 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F3E4 8003E7E4 0C020F71 */  jal        getModdedWeapon
/* 3F3E8 8003E7E8 02002821 */   addu      $a1, $s0, $zero
/* 3F3EC 8003E7EC 00521023 */  subu       $v0, $v0, $s2
.L8003E7F0:
/* 3F3F0 8003E7F0 00021400 */  sll        $v0, $v0, 0x10
/* 3F3F4 8003E7F4 0800FA16 */  j          .L8003E858
/* 3F3F8 8003E7F8 0002AC03 */   sra       $s5, $v0, 0x10
.L8003E7FC:
/* 3F3FC 8003E7FC 0C026259 */  jal        passToMalloc
/* 3F400 8003E800 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F404 8003E804 3C10800E */  lui        $s0, %hi(D_800DC530)
/* 3F408 8003E808 2610C530 */  addiu      $s0, $s0, %lo(D_800DC530)
/* 3F40C 8003E80C 02002021 */  addu       $a0, $s0, $zero
/* 3F410 8003E810 0C03353E */  jal        strlen
/* 3F414 8003E814 00408821 */   addu      $s1, $v0, $zero
/* 3F418 8003E818 02202021 */  addu       $a0, $s1, $zero
/* 3F41C 8003E81C 02002821 */  addu       $a1, $s0, $zero
/* 3F420 8003E820 24420001 */  addiu      $v0, $v0, 1
/* 3F424 8003E824 0C02DFC8 */  jal        widgetcliptext_init
/* 3F428 8003E828 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3F42C 8003E82C 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F430 8003E830 0C020F5F */  jal        CapBaseSheild
/* 3F434 8003E834 AE62008C */   sw        $v0, 0x8c($s3)
/* 3F438 8003E838 8E64007C */  lw         $a0, 0x7c($s3)
/* 3F43C 8003E83C 0C020F7B */  jal        getModdedSheild
/* 3F440 8003E840 3052FFFF */   andi      $s2, $v0, 0xffff
/* 3F444 8003E844 00521023 */  subu       $v0, $v0, $s2
/* 3F448 8003E848 00021400 */  sll        $v0, $v0, 0x10
/* 3F44C 8003E84C 0002AC03 */  sra        $s5, $v0, 0x10
/* 3F450 8003E850 24020200 */  addiu      $v0, $zero, 0x200
/* 3F454 8003E854 A662005E */  sh         $v0, 0x5e($s3)
.L8003E858:
/* 3F458 8003E858 8E650080 */  lw         $a1, 0x80($s3)
.L8003E85C:
/* 3F45C 8003E85C 50A00004 */  beql       $a1, $zero, .L8003E870
/* 3F460 8003E860 24050082 */   addiu     $a1, $zero, 0x82
/* 3F464 8003E864 0C02DEDC */  jal        link_widgets
/* 3F468 8003E868 02602021 */   addu      $a0, $s3, $zero
/* 3F46C 8003E86C 24050082 */  addiu      $a1, $zero, 0x82
.L8003E870:
/* 3F470 8003E870 8E68008C */  lw         $t0, 0x8c($s3)
/* 3F474 8003E874 24060050 */  addiu      $a2, $zero, 0x50
/* 3F478 8003E878 8D030078 */  lw         $v1, 0x78($t0)
/* 3F47C 8003E87C 24070050 */  addiu      $a3, $zero, 0x50
/* 3F480 8003E880 84640048 */  lh         $a0, 0x48($v1)
/* 3F484 8003E884 241100FF */  addiu      $s1, $zero, 0xff
/* 3F488 8003E888 AFB10010 */  sw         $s1, 0x10($sp)
/* 3F48C 8003E88C 8C62004C */  lw         $v0, 0x4c($v1)
/* 3F490 8003E890 0040F809 */  jalr       $v0
/* 3F494 8003E894 01042021 */   addu      $a0, $t0, $a0
/* 3F498 8003E898 8E65008C */  lw         $a1, 0x8c($s3)
/* 3F49C 8003E89C 0C02DEDC */  jal        link_widgets
/* 3F4A0 8003E8A0 02602021 */   addu      $a0, $s3, $zero
/* 3F4A4 8003E8A4 27A40018 */  addiu      $a0, $sp, 0x18
/* 3F4A8 8003E8A8 3C05800E */  lui        $a1, %hi(D_800DC538)
/* 3F4AC 8003E8AC 24A5C538 */  addiu      $a1, $a1, %lo(D_800DC538)
/* 3F4B0 8003E8B0 0C0333AC */  jal        sprintf
/* 3F4B4 8003E8B4 02403021 */   addu      $a2, $s2, $zero
/* 3F4B8 8003E8B8 0C026259 */  jal        passToMalloc
/* 3F4BC 8003E8BC 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F4C0 8003E8C0 27A40018 */  addiu      $a0, $sp, 0x18
/* 3F4C4 8003E8C4 0C03353E */  jal        strlen
/* 3F4C8 8003E8C8 00408021 */   addu      $s0, $v0, $zero
/* 3F4CC 8003E8CC 02002021 */  addu       $a0, $s0, $zero
/* 3F4D0 8003E8D0 27A50018 */  addiu      $a1, $sp, 0x18
/* 3F4D4 8003E8D4 24420001 */  addiu      $v0, $v0, 1
/* 3F4D8 8003E8D8 0C02DFC8 */  jal        widgetcliptext_init
/* 3F4DC 8003E8DC 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3F4E0 8003E8E0 24050082 */  addiu      $a1, $zero, 0x82
/* 3F4E4 8003E8E4 8C480078 */  lw         $t0, 0x78($v0)
/* 3F4E8 8003E8E8 24060050 */  addiu      $a2, $zero, 0x50
/* 3F4EC 8003E8EC AE620084 */  sw         $v0, 0x84($s3)
/* 3F4F0 8003E8F0 A452005E */  sh         $s2, 0x5e($v0)
/* 3F4F4 8003E8F4 85040048 */  lh         $a0, 0x48($t0)
/* 3F4F8 8003E8F8 24070050 */  addiu      $a3, $zero, 0x50
/* 3F4FC 8003E8FC AFB10010 */  sw         $s1, 0x10($sp)
/* 3F500 8003E900 8D03004C */  lw         $v1, 0x4c($t0)
/* 3F504 8003E904 0060F809 */  jalr       $v1
/* 3F508 8003E908 00442021 */   addu      $a0, $v0, $a0
/* 3F50C 8003E90C 8E650084 */  lw         $a1, 0x84($s3)
/* 3F510 8003E910 0C02DEDC */  jal        link_widgets
/* 3F514 8003E914 02602021 */   addu      $a0, $s3, $zero
/* 3F518 8003E918 12A0002E */  beqz       $s5, .L8003E9D4
/* 3F51C 8003E91C 02802821 */   addu      $a1, $s4, $zero
/* 3F520 8003E920 06A1000B */  bgez       $s5, .L8003E950
/* 3F524 8003E924 00008821 */   addu      $s1, $zero, $zero
/* 3F528 8003E928 24110080 */  addiu      $s1, $zero, 0x80
/* 3F52C 8003E92C 00009021 */  addu       $s2, $zero, $zero
/* 3F530 8003E930 241700FF */  addiu      $s7, $zero, 0xff
/* 3F534 8003E934 27A40018 */  addiu      $a0, $sp, 0x18
/* 3F538 8003E938 3C05800E */  lui        $a1, %hi(D_800DC53C)
/* 3F53C 8003E93C 24A5C53C */  addiu      $a1, $a1, %lo(D_800DC53C)
/* 3F540 8003E940 0C0333AC */  jal        sprintf
/* 3F544 8003E944 02A03021 */   addu      $a2, $s5, $zero
/* 3F548 8003E948 0800FA5B */  j          .L8003E96C
/* 3F54C 8003E94C 00000000 */   nop
.L8003E950:
/* 3F550 8003E950 24120080 */  addiu      $s2, $zero, 0x80
/* 3F554 8003E954 241700FF */  addiu      $s7, $zero, 0xff
/* 3F558 8003E958 27A40018 */  addiu      $a0, $sp, 0x18
/* 3F55C 8003E95C 3C05800E */  lui        $a1, %hi(D_800DC544)
/* 3F560 8003E960 24A5C544 */  addiu      $a1, $a1, %lo(D_800DC544)
/* 3F564 8003E964 0C0333AC */  jal        sprintf
/* 3F568 8003E968 02A03021 */   addu      $a2, $s5, $zero
.L8003E96C:
/* 3F56C 8003E96C 0C026259 */  jal        passToMalloc
/* 3F570 8003E970 2404007C */   addiu     $a0, $zero, 0x7c
/* 3F574 8003E974 27A40018 */  addiu      $a0, $sp, 0x18
/* 3F578 8003E978 0C03353E */  jal        strlen
/* 3F57C 8003E97C 00408021 */   addu      $s0, $v0, $zero
/* 3F580 8003E980 02002021 */  addu       $a0, $s0, $zero
/* 3F584 8003E984 27A50018 */  addiu      $a1, $sp, 0x18
/* 3F588 8003E988 24420001 */  addiu      $v0, $v0, 1
/* 3F58C 8003E98C 0C02DFC8 */  jal        widgetcliptext_init
/* 3F590 8003E990 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3F594 8003E994 02202821 */  addu       $a1, $s1, $zero
/* 3F598 8003E998 8C480078 */  lw         $t0, 0x78($v0)
/* 3F59C 8003E99C 02403021 */  addu       $a2, $s2, $zero
/* 3F5A0 8003E9A0 AE620088 */  sw         $v0, 0x88($s3)
/* 3F5A4 8003E9A4 85040048 */  lh         $a0, 0x48($t0)
/* 3F5A8 8003E9A8 00003821 */  addu       $a3, $zero, $zero
/* 3F5AC 8003E9AC AFB70010 */  sw         $s7, 0x10($sp)
/* 3F5B0 8003E9B0 8D03004C */  lw         $v1, 0x4c($t0)
/* 3F5B4 8003E9B4 0060F809 */  jalr       $v1
/* 3F5B8 8003E9B8 00442021 */   addu      $a0, $v0, $a0
/* 3F5BC 8003E9BC 8E620088 */  lw         $v0, 0x88($s3)
/* 3F5C0 8003E9C0 02602021 */  addu       $a0, $s3, $zero
/* 3F5C4 8003E9C4 00402821 */  addu       $a1, $v0, $zero
/* 3F5C8 8003E9C8 0C02DEDC */  jal        link_widgets
/* 3F5CC 8003E9CC A455005E */   sh        $s5, 0x5e($v0)
/* 3F5D0 8003E9D0 02802821 */  addu       $a1, $s4, $zero
.L8003E9D4:
/* 3F5D4 8003E9D4 8E640084 */  lw         $a0, 0x84($s3)
/* 3F5D8 8003E9D8 0C00FB17 */  jal        func_8003EC5C
/* 3F5DC 8003E9DC 02C03021 */   addu      $a2, $s6, $zero
/* 3F5E0 8003E9E0 02601021 */  addu       $v0, $s3, $zero
/* 3F5E4 8003E9E4 8FBF0080 */  lw         $ra, 0x80($sp)
/* 3F5E8 8003E9E8 8FB7007C */  lw         $s7, 0x7c($sp)
/* 3F5EC 8003E9EC 8FB60078 */  lw         $s6, 0x78($sp)
/* 3F5F0 8003E9F0 8FB50074 */  lw         $s5, 0x74($sp)
/* 3F5F4 8003E9F4 8FB40070 */  lw         $s4, 0x70($sp)
/* 3F5F8 8003E9F8 8FB3006C */  lw         $s3, 0x6c($sp)
/* 3F5FC 8003E9FC 8FB20068 */  lw         $s2, 0x68($sp)
/* 3F600 8003EA00 8FB10064 */  lw         $s1, 0x64($sp)
/* 3F604 8003EA04 8FB00060 */  lw         $s0, 0x60($sp)
/* 3F608 8003EA08 03E00008 */  jr         $ra
/* 3F60C 8003EA0C 27BD0088 */   addiu     $sp, $sp, 0x88

glabel func_8003EA10
/* 3F610 8003EA10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F614 8003EA14 3C02800E */  lui        $v0, %hi(D_800DC550)
/* 3F618 8003EA18 2442C550 */  addiu      $v0, $v0, %lo(D_800DC550)
/* 3F61C 8003EA1C AFBF0010 */  sw         $ra, 0x10($sp)
/* 3F620 8003EA20 0C02DD2B */  jal        free_widget
/* 3F624 8003EA24 AC820078 */   sw        $v0, 0x78($a0)
/* 3F628 8003EA28 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F62C 8003EA2C 03E00008 */  jr         $ra
/* 3F630 8003EA30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003EA34
/* 3F634 8003EA34 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3F638 8003EA38 00063400 */  sll        $a2, $a2, 0x10
/* 3F63C 8003EA3C 00073C00 */  sll        $a3, $a3, 0x10
/* 3F640 8003EA40 00063403 */  sra        $a2, $a2, 0x10
/* 3F644 8003EA44 87A20032 */  lh         $v0, 0x32($sp)
/* 3F648 8003EA48 87A30036 */  lh         $v1, 0x36($sp)
/* 3F64C 8003EA4C 00073C03 */  sra        $a3, $a3, 0x10
/* 3F650 8003EA50 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3F654 8003EA54 AFA20010 */  sw         $v0, 0x10($sp)
/* 3F658 8003EA58 0C02DE14 */  jal        widget_func_8
/* 3F65C 8003EA5C AFA30014 */   sw        $v1, 0x14($sp)
/* 3F660 8003EA60 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3F664 8003EA64 03E00008 */  jr         $ra
/* 3F668 8003EA68 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003EA6C
/* 3F66C 8003EA6C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3F670 8003EA70 AFB00018 */  sw         $s0, 0x18($sp)
/* 3F674 8003EA74 00808021 */  addu       $s0, $a0, $zero
/* 3F678 8003EA78 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3F67C 8003EA7C 8E02008C */  lw         $v0, 0x8c($s0)
/* 3F680 8003EA80 10400051 */  beqz       $v0, .L8003EBC8
/* 3F684 8003EA84 00000000 */   nop
/* 3F688 8003EA88 8E040080 */  lw         $a0, 0x80($s0)
/* 3F68C 8003EA8C 5080000F */  beql       $a0, $zero, .L8003EACC
/* 3F690 8003EA90 8E040088 */   lw        $a0, 0x88($s0)
/* 3F694 8003EA94 86050060 */  lh         $a1, 0x60($s0)
/* 3F698 8003EA98 0C02DD3F */  jal        set_widget_coords
/* 3F69C 8003EA9C 86060062 */   lh        $a2, 0x62($s0)
/* 3F6A0 8003EAA0 8602006A */  lh         $v0, 0x6a($s0)
/* 3F6A4 8003EAA4 8E040080 */  lw         $a0, 0x80($s0)
/* 3F6A8 8003EAA8 86050068 */  lh         $a1, 0x68($s0)
/* 3F6AC 8003EAAC 86060064 */  lh         $a2, 0x64($s0)
/* 3F6B0 8003EAB0 86070066 */  lh         $a3, 0x66($s0)
/* 3F6B4 8003EAB4 0C02DD6A */  jal        some_widget_setter
/* 3F6B8 8003EAB8 AFA20010 */   sw        $v0, 0x10($sp)
/* 3F6BC 8003EABC 8E030080 */  lw         $v1, 0x80($s0)
/* 3F6C0 8003EAC0 9202005B */  lbu        $v0, 0x5b($s0)
/* 3F6C4 8003EAC4 A062005B */  sb         $v0, 0x5b($v1)
/* 3F6C8 8003EAC8 8E040088 */  lw         $a0, 0x88($s0)
.L8003EACC:
/* 3F6CC 8003EACC 50800010 */  beql       $a0, $zero, .L8003EB10
/* 3F6D0 8003EAD0 8E040084 */   lw        $a0, 0x84($s0)
/* 3F6D4 8003EAD4 86050060 */  lh         $a1, 0x60($s0)
/* 3F6D8 8003EAD8 86060062 */  lh         $a2, 0x62($s0)
/* 3F6DC 8003EADC 0C02DD3F */  jal        set_widget_coords
/* 3F6E0 8003EAE0 24A5005F */   addiu     $a1, $a1, 0x5f
/* 3F6E4 8003EAE4 8602006A */  lh         $v0, 0x6a($s0)
/* 3F6E8 8003EAE8 8E040088 */  lw         $a0, 0x88($s0)
/* 3F6EC 8003EAEC 86050068 */  lh         $a1, 0x68($s0)
/* 3F6F0 8003EAF0 86060064 */  lh         $a2, 0x64($s0)
/* 3F6F4 8003EAF4 86070066 */  lh         $a3, 0x66($s0)
/* 3F6F8 8003EAF8 0C02DD6A */  jal        some_widget_setter
/* 3F6FC 8003EAFC AFA20010 */   sw        $v0, 0x10($sp)
/* 3F700 8003EB00 8E030088 */  lw         $v1, 0x88($s0)
/* 3F704 8003EB04 9202005B */  lbu        $v0, 0x5b($s0)
/* 3F708 8003EB08 A062005B */  sb         $v0, 0x5b($v1)
/* 3F70C 8003EB0C 8E040084 */  lw         $a0, 0x84($s0)
.L8003EB10:
/* 3F710 8003EB10 86050060 */  lh         $a1, 0x60($s0)
/* 3F714 8003EB14 86060062 */  lh         $a2, 0x62($s0)
/* 3F718 8003EB18 0C02DD3F */  jal        set_widget_coords
/* 3F71C 8003EB1C 24A5004F */   addiu     $a1, $a1, 0x4f
/* 3F720 8003EB20 8602006A */  lh         $v0, 0x6a($s0)
/* 3F724 8003EB24 8E040084 */  lw         $a0, 0x84($s0)
/* 3F728 8003EB28 86050068 */  lh         $a1, 0x68($s0)
/* 3F72C 8003EB2C 86060064 */  lh         $a2, 0x64($s0)
/* 3F730 8003EB30 86070066 */  lh         $a3, 0x66($s0)
/* 3F734 8003EB34 0C02DD6A */  jal        some_widget_setter
/* 3F738 8003EB38 AFA20010 */   sw        $v0, 0x10($sp)
/* 3F73C 8003EB3C 8E030084 */  lw         $v1, 0x84($s0)
/* 3F740 8003EB40 9202005B */  lbu        $v0, 0x5b($s0)
/* 3F744 8003EB44 A062005B */  sb         $v0, 0x5b($v1)
/* 3F748 8003EB48 8E04008C */  lw         $a0, 0x8c($s0)
/* 3F74C 8003EB4C 96020060 */  lhu        $v0, 0x60($s0)
/* 3F750 8003EB50 86060062 */  lh         $a2, 0x62($s0)
/* 3F754 8003EB54 2443000C */  addiu      $v1, $v0, 0xc
/* 3F758 8003EB58 00032C00 */  sll        $a1, $v1, 0x10
/* 3F75C 8003EB5C 00052C03 */  sra        $a1, $a1, 0x10
/* 3F760 8003EB60 2442008C */  addiu      $v0, $v0, 0x8c
/* 3F764 8003EB64 A6020092 */  sh         $v0, 0x92($s0)
/* 3F768 8003EB68 0C02DD3F */  jal        set_widget_coords
/* 3F76C 8003EB6C A6030090 */   sh        $v1, 0x90($s0)
/* 3F770 8003EB70 8E04008C */  lw         $a0, 0x8c($s0)
/* 3F774 8003EB74 86050090 */  lh         $a1, 0x90($s0)
/* 3F778 8003EB78 0C02EF52 */  jal        func_800BBD48
/* 3F77C 8003EB7C 86060092 */   lh        $a2, 0x92($s0)
/* 3F780 8003EB80 8E09008C */  lw         $t1, 0x8c($s0)
/* 3F784 8003EB84 9202005B */  lbu        $v0, 0x5b($s0)
/* 3F788 8003EB88 92050058 */  lbu        $a1, 0x58($s0)
/* 3F78C 8003EB8C 92060059 */  lbu        $a2, 0x59($s0)
/* 3F790 8003EB90 8D280078 */  lw         $t0, 0x78($t1)
/* 3F794 8003EB94 9207005A */  lbu        $a3, 0x5a($s0)
/* 3F798 8003EB98 85040048 */  lh         $a0, 0x48($t0)
/* 3F79C 8003EB9C AFA20010 */  sw         $v0, 0x10($sp)
/* 3F7A0 8003EBA0 8D03004C */  lw         $v1, 0x4c($t0)
/* 3F7A4 8003EBA4 0060F809 */  jalr       $v1
/* 3F7A8 8003EBA8 01242021 */   addu      $a0, $t1, $a0
/* 3F7AC 8003EBAC 8602006A */  lh         $v0, 0x6a($s0)
/* 3F7B0 8003EBB0 8E04008C */  lw         $a0, 0x8c($s0)
/* 3F7B4 8003EBB4 86050068 */  lh         $a1, 0x68($s0)
/* 3F7B8 8003EBB8 86060064 */  lh         $a2, 0x64($s0)
/* 3F7BC 8003EBBC 86070066 */  lh         $a3, 0x66($s0)
/* 3F7C0 8003EBC0 0C02DD6A */  jal        some_widget_setter
/* 3F7C4 8003EBC4 AFA20010 */   sw        $v0, 0x10($sp)
.L8003EBC8:
/* 3F7C8 8003EBC8 0C02DE51 */  jal        func_800B7944
/* 3F7CC 8003EBCC 02002021 */   addu      $a0, $s0, $zero
/* 3F7D0 8003EBD0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3F7D4 8003EBD4 8FB00018 */  lw         $s0, 0x18($sp)
/* 3F7D8 8003EBD8 03E00008 */  jr         $ra
/* 3F7DC 8003EBDC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003EBE0
/* 3F7E0 8003EBE0 8C82008C */  lw         $v0, 0x8c($a0)
/* 3F7E4 8003EBE4 10400006 */  beqz       $v0, .L8003EC00
/* 3F7E8 8003EBE8 00000000 */   nop
/* 3F7EC 8003EBEC 94820066 */  lhu        $v0, 0x66($a0)
/* 3F7F0 8003EBF0 94830064 */  lhu        $v1, 0x64($a0)
/* 3F7F4 8003EBF4 00431023 */  subu       $v0, $v0, $v1
/* 3F7F8 8003EBF8 03E00008 */  jr         $ra
/* 3F7FC 8003EBFC 3042FFFF */   andi      $v0, $v0, 0xffff
.L8003EC00:
/* 3F800 8003EC00 03E00008 */  jr         $ra
/* 3F804 8003EC04 00001021 */   addu      $v0, $zero, $zero

glabel ret13
/* 3F808 8003EC08 03E00008 */  jr         $ra
/* 3F80C 8003EC0C 2402000D */   addiu     $v0, $zero, 0xd

glabel func_8003EC10
/* 3F810 8003EC10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F814 8003EC14 00802821 */  addu       $a1, $a0, $zero
/* 3F818 8003EC18 3C02800E */  lui        $v0, %hi(someCase_1)
/* 3F81C 8003EC1C 90447D6C */  lbu        $a0, %lo(someCase_1)($v0)
/* 3F820 8003EC20 24030007 */  addiu      $v1, $zero, 7
/* 3F824 8003EC24 14830009 */  bne        $a0, $v1, .L8003EC4C
/* 3F828 8003EC28 AFBF0010 */   sw        $ra, 0x10($sp)
/* 3F82C 8003EC2C 8CA50084 */  lw         $a1, 0x84($a1)
/* 3F830 8003EC30 8CA30078 */  lw         $v1, 0x78($a1)
/* 3F834 8003EC34 84640078 */  lh         $a0, 0x78($v1)
/* 3F838 8003EC38 8C62007C */  lw         $v0, 0x7c($v1)
/* 3F83C 8003EC3C 0040F809 */  jalr       $v0
/* 3F840 8003EC40 00A42021 */   addu      $a0, $a1, $a0
/* 3F844 8003EC44 0800FB14 */  j          .L8003EC50
/* 3F848 8003EC48 00001021 */   addu      $v0, $zero, $zero
.L8003EC4C:
/* 3F84C 8003EC4C 8CA20084 */  lw         $v0, 0x84($a1)
.L8003EC50:
/* 3F850 8003EC50 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F854 8003EC54 03E00008 */  jr         $ra
/* 3F858 8003EC58 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003EC5C
/* 3F85C 8003EC5C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 3F860 8003EC60 10800009 */  beqz       $a0, .L8003EC88
/* 3F864 8003EC64 30C600FF */   andi      $a2, $a2, 0xff
/* 3F868 8003EC68 14C00007 */  bnez       $a2, .L8003EC88
/* 3F86C 8003EC6C 24020002 */   addiu     $v0, $zero, 2
/* 3F870 8003EC70 10A2000E */  beq        $a1, $v0, .L8003ECAC
/* 3F874 8003EC74 28A20003 */   slti      $v0, $a1, 3
/* 3F878 8003EC78 50400005 */  beql       $v0, $zero, .L8003EC90
/* 3F87C 8003EC7C 24020004 */   addiu     $v0, $zero, 4
/* 3F880 8003EC80 10A00007 */  beqz       $a1, .L8003ECA0
/* 3F884 8003EC84 3C028004 */   lui       $v0, 0x8004
.L8003EC88:
/* 3F888 8003EC88 03E00008 */  jr         $ra
/* 3F88C 8003EC8C 00000000 */   nop
.L8003EC90:
/* 3F890 8003EC90 10A2000A */  beq        $a1, $v0, .L8003ECBC
/* 3F894 8003EC94 3C028004 */   lui       $v0, %hi(func_8003ECCC)
/* 3F898 8003EC98 03E00008 */  jr         $ra
/* 3F89C 8003EC9C 00000000 */   nop
.L8003ECA0:
/* 3F8A0 8003ECA0 2442ECCC */  addiu      $v0, $v0, %lo(func_8003ECCC)
/* 3F8A4 8003ECA4 03E00008 */  jr         $ra
/* 3F8A8 8003ECA8 AC820018 */   sw        $v0, 0x18($a0)
.L8003ECAC:
/* 3F8AC 8003ECAC 3C028004 */  lui        $v0, %hi(func_8003ECF4)
/* 3F8B0 8003ECB0 2442ECF4 */  addiu      $v0, $v0, %lo(func_8003ECF4)
/* 3F8B4 8003ECB4 03E00008 */  jr         $ra
/* 3F8B8 8003ECB8 AC820018 */   sw        $v0, 0x18($a0)
.L8003ECBC:
/* 3F8BC 8003ECBC 2442ED1C */  addiu      $v0, $v0, -0x12e4
/* 3F8C0 8003ECC0 AC820018 */  sw         $v0, 0x18($a0)
/* 3F8C4 8003ECC4 03E00008 */  jr         $ra
/* 3F8C8 8003ECC8 00000000 */   nop

glabel func_8003ECCC
/* 3F8CC 8003ECCC 3C02800F */  lui        $v0, %hi(partypicker)
/* 3F8D0 8003ECD0 9044D550 */  lbu        $a0, %lo(partypicker)($v0)
/* 3F8D4 8003ECD4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F8D8 8003ECD8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3F8DC 8003ECDC 0C000EDC */  jal        func_80003B70
/* 3F8E0 8003ECE0 00000000 */   nop
/* 3F8E4 8003ECE4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F8E8 8003ECE8 00001021 */  addu       $v0, $zero, $zero
/* 3F8EC 8003ECEC 03E00008 */  jr         $ra
/* 3F8F0 8003ECF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003ECF4
/* 3F8F4 8003ECF4 3C02800F */  lui        $v0, %hi(partypicker)
/* 3F8F8 8003ECF8 9044D550 */  lbu        $a0, %lo(partypicker)($v0)
/* 3F8FC 8003ECFC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F900 8003ED00 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3F904 8003ED04 0C001070 */  jal        MakeHealerMenu
/* 3F908 8003ED08 00000000 */   nop
/* 3F90C 8003ED0C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F910 8003ED10 00001021 */  addu       $v0, $zero, $zero
/* 3F914 8003ED14 03E00008 */  jr         $ra
/* 3F918 8003ED18 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003ED1C
/* 3F91C 8003ED1C 3C02800F */  lui        $v0, %hi(partypicker)
/* 3F920 8003ED20 9044D550 */  lbu        $a0, %lo(partypicker)($v0)
/* 3F924 8003ED24 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3F928 8003ED28 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3F92C 8003ED2C 0C000D6C */  jal        func_800035B0
/* 3F930 8003ED30 00000000 */   nop
/* 3F934 8003ED34 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3F938 8003ED38 00001021 */  addu       $v0, $zero, $zero
/* 3F93C 8003ED3C 03E00008 */  jr         $ra
/* 3F940 8003ED40 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret12
/* 3F944 8003ED44 03E00008 */  jr         $ra
/* 3F948 8003ED48 2402000C */   addiu     $v0, $zero, 0xc
/* 3F94C 8003ED4C 00000000 */  nop
