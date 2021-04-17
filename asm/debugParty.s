.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel debug_add_party_member
/* 5F6C0 8005EAC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F6C4 8005EAC4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5F6C8 8005EAC8 0C026259 */  jal        passToMalloc
/* 5F6CC 8005EACC 24040080 */   addiu     $a0, $zero, 0x80
/* 5F6D0 8005EAD0 0C017AEC */  jal        print_playable_characters
/* 5F6D4 8005EAD4 00402021 */   addu      $a0, $v0, $zero
/* 5F6D8 8005EAD8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5F6DC 8005EADC 03E00008 */  jr         $ra
/* 5F6E0 8005EAE0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005EAE4
/* 5F6E4 8005EAE4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F6E8 8005EAE8 00801821 */  addu       $v1, $a0, $zero
/* 5F6EC 8005EAEC 10600007 */  beqz       $v1, .L8005EB0C
/* 5F6F0 8005EAF0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 5F6F4 8005EAF4 8C620078 */  lw         $v0, 0x78($v1)
/* 5F6F8 8005EAF8 84440008 */  lh         $a0, 8($v0)
/* 5F6FC 8005EAFC 00642021 */  addu       $a0, $v1, $a0
/* 5F700 8005EB00 8C43000C */  lw         $v1, 0xc($v0)
/* 5F704 8005EB04 0060F809 */  jalr       $v1
/* 5F708 8005EB08 24050003 */   addiu     $a1, $zero, 3
.L8005EB0C:
/* 5F70C 8005EB0C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5F710 8005EB10 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 5F714 8005EB14 AC40D500 */  sw         $zero, %lo(freeWidgetFunc)($v0)
/* 5F718 8005EB18 03E00008 */  jr         $ra
/* 5F71C 8005EB1C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel print_entity_name
/* 5F720 8005EB20 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5F724 8005EB24 AFB3001C */  sw         $s3, 0x1c($sp)
/* 5F728 8005EB28 00809821 */  addu       $s3, $a0, $zero
/* 5F72C 8005EB2C 2404007C */  addiu      $a0, $zero, 0x7c
/* 5F730 8005EB30 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 5F734 8005EB34 8C4313A0 */  lw         $v1, %lo(EntityPointer)($v0)
/* 5F738 8005EB38 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 5F73C 8005EB3C AFBF0020 */  sw         $ra, 0x20($sp)
/* 5F740 8005EB40 AFB20018 */  sw         $s2, 0x18($sp)
/* 5F744 8005EB44 AFB10014 */  sw         $s1, 0x14($sp)
/* 5F748 8005EB48 AFB00010 */  sw         $s0, 0x10($sp)
/* 5F74C 8005EB4C 8C710010 */  lw         $s1, 0x10($v1)
/* 5F750 8005EB50 000529C0 */  sll        $a1, $a1, 7
/* 5F754 8005EB54 0C026259 */  jal        passToMalloc
/* 5F758 8005EB58 02258821 */   addu      $s1, $s1, $a1
/* 5F75C 8005EB5C 26320002 */  addiu      $s2, $s1, 2
/* 5F760 8005EB60 02402021 */  addu       $a0, $s2, $zero
/* 5F764 8005EB64 0C03353E */  jal        strlen
/* 5F768 8005EB68 00408021 */   addu      $s0, $v0, $zero
/* 5F76C 8005EB6C 02002021 */  addu       $a0, $s0, $zero
/* 5F770 8005EB70 02402821 */  addu       $a1, $s2, $zero
/* 5F774 8005EB74 24420001 */  addiu      $v0, $v0, 1
/* 5F778 8005EB78 0C02E3A0 */  jal        widgettext_func_2
/* 5F77C 8005EB7C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5F780 8005EB80 8E64007C */  lw         $a0, 0x7c($s3)
/* 5F784 8005EB84 96230000 */  lhu        $v1, ($s1)
/* 5F788 8005EB88 00402821 */  addu       $a1, $v0, $zero
/* 5F78C 8005EB8C 0C02E885 */  jal        link_widget_text
/* 5F790 8005EB90 A443005E */   sh        $v1, 0x5e($v0)
/* 5F794 8005EB94 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5F798 8005EB98 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5F79C 8005EB9C 8FB20018 */  lw         $s2, 0x18($sp)
/* 5F7A0 8005EBA0 8FB10014 */  lw         $s1, 0x14($sp)
/* 5F7A4 8005EBA4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F7A8 8005EBA8 03E00008 */  jr         $ra
/* 5F7AC 8005EBAC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel print_playable_characters
/* 5F7B0 8005EBB0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 5F7B4 8005EBB4 AFB1003C */  sw         $s1, 0x3c($sp)
/* 5F7B8 8005EBB8 00808821 */  addu       $s1, $a0, $zero
/* 5F7BC 8005EBBC AFBF0040 */  sw         $ra, 0x40($sp)
/* 5F7C0 8005EBC0 0C02E658 */  jal        widget_menu_build
/* 5F7C4 8005EBC4 AFB00038 */   sw        $s0, 0x38($sp)
/* 5F7C8 8005EBC8 02202021 */  addu       $a0, $s1, $zero
/* 5F7CC 8005EBCC 24050028 */  addiu      $a1, $zero, 0x28
/* 5F7D0 8005EBD0 2406000A */  addiu      $a2, $zero, 0xa
/* 5F7D4 8005EBD4 240700C8 */  addiu      $a3, $zero, 0xc8
/* 5F7D8 8005EBD8 3C02800E */  lui        $v0, %hi(D_800DF270)
/* 5F7DC 8005EBDC 2442F270 */  addiu      $v0, $v0, %lo(D_800DF270)
/* 5F7E0 8005EBE0 240300C8 */  addiu      $v1, $zero, 0xc8
/* 5F7E4 8005EBE4 AE220078 */  sw         $v0, 0x78($s1)
/* 5F7E8 8005EBE8 240200FF */  addiu      $v0, $zero, 0xff
/* 5F7EC 8005EBEC AFA30010 */  sw         $v1, 0x10($sp)
/* 5F7F0 8005EBF0 AFA00014 */  sw         $zero, 0x14($sp)
/* 5F7F4 8005EBF4 AFA00018 */  sw         $zero, 0x18($sp)
/* 5F7F8 8005EBF8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5F7FC 8005EBFC 0C02F27C */  jal        func_800BC9F0
/* 5F800 8005EC00 AFA20020 */   sw        $v0, 0x20($sp)
/* 5F804 8005EC04 00402021 */  addu       $a0, $v0, $zero
/* 5F808 8005EC08 24060032 */  addiu      $a2, $zero, 0x32
/* 5F80C 8005EC0C 24070014 */  addiu      $a3, $zero, 0x14
/* 5F810 8005EC10 24100097 */  addiu      $s0, $zero, 0x97
/* 5F814 8005EC14 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 5F818 8005EC18 8C4313A0 */  lw         $v1, %lo(EntityPointer)($v0)
/* 5F81C 8005EC1C 24020032 */  addiu      $v0, $zero, 0x32
/* 5F820 8005EC20 90650000 */  lbu        $a1, ($v1)
/* 5F824 8005EC24 24030014 */  addiu      $v1, $zero, 0x14
/* 5F828 8005EC28 AFA20010 */  sw         $v0, 0x10($sp)
/* 5F82C 8005EC2C 2402012C */  addiu      $v0, $zero, 0x12c
/* 5F830 8005EC30 AFA30014 */  sw         $v1, 0x14($sp)
/* 5F834 8005EC34 240300DC */  addiu      $v1, $zero, 0xdc
/* 5F838 8005EC38 AFA20018 */  sw         $v0, 0x18($sp)
/* 5F83C 8005EC3C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5F840 8005EC40 AFA3001C */  sw         $v1, 0x1c($sp)
/* 5F844 8005EC44 AFA20020 */  sw         $v0, 0x20($sp)
/* 5F848 8005EC48 AFA20024 */  sw         $v0, 0x24($sp)
/* 5F84C 8005EC4C AFA20028 */  sw         $v0, 0x28($sp)
/* 5F850 8005EC50 AFA2002C */  sw         $v0, 0x2c($sp)
/* 5F854 8005EC54 0C02F435 */  jal        widgetscrollmenu_init_2
/* 5F858 8005EC58 AFA00030 */   sw        $zero, 0x30($sp)
/* 5F85C 8005EC5C AE22007C */  sw         $v0, 0x7c($s1)
/* 5F860 8005EC60 02202021 */  addu       $a0, $s1, $zero
.L8005EC64:
/* 5F864 8005EC64 0C017AC8 */  jal        print_entity_name
/* 5F868 8005EC68 3205FFFF */   andi      $a1, $s0, 0xffff
/* 5F86C 8005EC6C 26100001 */  addiu      $s0, $s0, 1
/* 5F870 8005EC70 2E0200A5 */  sltiu      $v0, $s0, 0xa5
/* 5F874 8005EC74 1440FFFB */  bnez       $v0, .L8005EC64
/* 5F878 8005EC78 02202021 */   addu      $a0, $s1, $zero
/* 5F87C 8005EC7C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5F880 8005EC80 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 5F884 8005EC84 8C441604 */  lw         $a0, 0x1604($v0)
/* 5F888 8005EC88 0C02DC7C */  jal        widgetHandler
/* 5F88C 8005EC8C 02202821 */   addu      $a1, $s1, $zero
/* 5F890 8005EC90 02201021 */  addu       $v0, $s1, $zero
/* 5F894 8005EC94 3C038006 */  lui        $v1, %hi(func_8005EAE4)
/* 5F898 8005EC98 2463EAE4 */  addiu      $v1, $v1, %lo(func_8005EAE4)
/* 5F89C 8005EC9C 8FBF0040 */  lw         $ra, 0x40($sp)
/* 5F8A0 8005ECA0 8FB1003C */  lw         $s1, 0x3c($sp)
/* 5F8A4 8005ECA4 8FB00038 */  lw         $s0, 0x38($sp)
/* 5F8A8 8005ECA8 3C04800F */  lui        $a0, %hi(freeWidgetFunc)
/* 5F8AC 8005ECAC AC83D500 */  sw         $v1, %lo(freeWidgetFunc)($a0)
/* 5F8B0 8005ECB0 03E00008 */  jr         $ra
/* 5F8B4 8005ECB4 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_8005ECB8
/* 5F8B8 8005ECB8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5F8BC 8005ECBC AFB00010 */  sw         $s0, 0x10($sp)
/* 5F8C0 8005ECC0 00808021 */  addu       $s0, $a0, $zero
/* 5F8C4 8005ECC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 5F8C8 8005ECC8 00A08821 */  addu       $s1, $a1, $zero
/* 5F8CC 8005ECCC 02002821 */  addu       $a1, $s0, $zero
/* 5F8D0 8005ECD0 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 5F8D4 8005ECD4 3C02800E */  lui        $v0, %hi(D_800DF270)
/* 5F8D8 8005ECD8 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 5F8DC 8005ECDC 2442F270 */  addiu      $v0, $v0, %lo(D_800DF270)
/* 5F8E0 8005ECE0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5F8E4 8005ECE4 0C02DCB3 */  jal        func_800B72CC
/* 5F8E8 8005ECE8 AE020078 */   sw        $v0, 0x78($s0)
/* 5F8EC 8005ECEC 02002021 */  addu       $a0, $s0, $zero
/* 5F8F0 8005ECF0 0C02E66C */  jal        widget_menu_free
/* 5F8F4 8005ECF4 02202821 */   addu      $a1, $s1, $zero
/* 5F8F8 8005ECF8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5F8FC 8005ECFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 5F900 8005ED00 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F904 8005ED04 03E00008 */  jr         $ra
/* 5F908 8005ED08 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005ED0C
/* 5F90C 8005ED0C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F910 8005ED10 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5F914 8005ED14 8C85007C */  lw         $a1, 0x7c($a0)
/* 5F918 8005ED18 8CA30078 */  lw         $v1, 0x78($a1)
/* 5F91C 8005ED1C 84640058 */  lh         $a0, 0x58($v1)
/* 5F920 8005ED20 8C62005C */  lw         $v0, 0x5c($v1)
/* 5F924 8005ED24 0040F809 */  jalr       $v0
/* 5F928 8005ED28 00A42021 */   addu      $a0, $a1, $a0
/* 5F92C 8005ED2C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5F930 8005ED30 00001021 */  addu       $v0, $zero, $zero
/* 5F934 8005ED34 03E00008 */  jr         $ra
/* 5F938 8005ED38 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005ED3C
/* 5F93C 8005ED3C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F940 8005ED40 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5F944 8005ED44 8C85007C */  lw         $a1, 0x7c($a0)
/* 5F948 8005ED48 8CA30078 */  lw         $v1, 0x78($a1)
/* 5F94C 8005ED4C 84640060 */  lh         $a0, 0x60($v1)
/* 5F950 8005ED50 8C620064 */  lw         $v0, 0x64($v1)
/* 5F954 8005ED54 0040F809 */  jalr       $v0
/* 5F958 8005ED58 00A42021 */   addu      $a0, $a1, $a0
/* 5F95C 8005ED5C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5F960 8005ED60 00001021 */  addu       $v0, $zero, $zero
/* 5F964 8005ED64 03E00008 */  jr         $ra
/* 5F968 8005ED68 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_add_member
/* 5F96C 8005ED6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5F970 8005ED70 AFB00010 */  sw         $s0, 0x10($sp)
/* 5F974 8005ED74 00808021 */  addu       $s0, $a0, $zero
/* 5F978 8005ED78 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5F97C 8005ED7C 0C02F031 */  jal        func_800BC0C4
/* 5F980 8005ED80 8E04007C */   lw        $a0, 0x7c($s0)
/* 5F984 8005ED84 3C03800E */  lui        $v1, %hi(partyPointer)
/* 5F988 8005ED88 8C647EA0 */  lw         $a0, %lo(partyPointer)($v1)
/* 5F98C 8005ED8C 0C01F7BD */  jal        add_to_party
/* 5F990 8005ED90 9445005E */   lhu       $a1, 0x5e($v0)
/* 5F994 8005ED94 02001021 */  addu       $v0, $s0, $zero
/* 5F998 8005ED98 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5F99C 8005ED9C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F9A0 8005EDA0 03E00008 */  jr         $ra
/* 5F9A4 8005EDA4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_8005eda8
/* 5F9A8 8005EDA8 03E00008 */  jr         $ra
/* 5F9AC 8005EDAC 00801021 */   addu      $v0, $a0, $zero
