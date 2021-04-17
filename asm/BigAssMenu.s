.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_pause_menu
/* 36650 80035A50 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 36654 80035A54 AFB00010 */  sw         $s0, 0x10($sp)
/* 36658 80035A58 00808021 */  addu       $s0, $a0, $zero
/* 3665C 80035A5C AFB10014 */  sw         $s1, 0x14($sp)
/* 36660 80035A60 00A08821 */  addu       $s1, $a1, $zero
/* 36664 80035A64 AFB20018 */  sw         $s2, 0x18($sp)
/* 36668 80035A68 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3666C 80035A6C 0C02E658 */  jal        widget_menu_build
/* 36670 80035A70 30D200FF */   andi      $s2, $a2, 0xff
/* 36674 80035A74 3C03800E */  lui        $v1, %hi(pause_menu_funcs)
/* 36678 80035A78 2463B808 */  addiu      $v1, $v1, %lo(pause_menu_funcs)
/* 3667C 80035A7C 02002021 */  addu       $a0, $s0, $zero
/* 36680 80035A80 02202821 */  addu       $a1, $s1, $zero
/* 36684 80035A84 02403021 */  addu       $a2, $s2, $zero
/* 36688 80035A88 0C00D6CE */  jal        BigAssMenu
/* 3668C 80035A8C AE030078 */   sw        $v1, 0x78($s0)
/* 36690 80035A90 02001021 */  addu       $v0, $s0, $zero
/* 36694 80035A94 8FBF001C */  lw         $ra, 0x1c($sp)
/* 36698 80035A98 8FB20018 */  lw         $s2, 0x18($sp)
/* 3669C 80035A9C 8FB10014 */  lw         $s1, 0x14($sp)
/* 366A0 80035AA0 8FB00010 */  lw         $s0, 0x10($sp)
/* 366A4 80035AA4 03E00008 */  jr         $ra
/* 366A8 80035AA8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80035AAC
/* 366AC 80035AAC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 366B0 80035AB0 AFB10014 */  sw         $s1, 0x14($sp)
/* 366B4 80035AB4 00808821 */  addu       $s1, $a0, $zero
/* 366B8 80035AB8 3C02800E */  lui        $v0, %hi(pause_menu_funcs)
/* 366BC 80035ABC AFBF001C */  sw         $ra, 0x1c($sp)
/* 366C0 80035AC0 AFB20018 */  sw         $s2, 0x18($sp)
/* 366C4 80035AC4 AFB00010 */  sw         $s0, 0x10($sp)
/* 366C8 80035AC8 8E300040 */  lw         $s0, 0x40($s1)
/* 366CC 80035ACC 2442B808 */  addiu      $v0, $v0, %lo(pause_menu_funcs)
/* 366D0 80035AD0 AE220078 */  sw         $v0, 0x78($s1)
/* 366D4 80035AD4 92030020 */  lbu        $v1, 0x20($s0)
/* 366D8 80035AD8 3C02800E */  lui        $v0, %hi(pausemenu_section)
/* 366DC 80035ADC A0437D79 */  sb         $v1, %lo(pausemenu_section)($v0)
/* 366E0 80035AE0 8E040030 */  lw         $a0, 0x30($s0)
/* 366E4 80035AE4 10800005 */  beqz       $a0, .L80035AFC
/* 366E8 80035AE8 00A09021 */   addu      $s2, $a1, $zero
/* 366EC 80035AEC 0C027F2A */  jal        func_8009FCA8
/* 366F0 80035AF0 00000000 */   nop
/* 366F4 80035AF4 AE000030 */  sw         $zero, 0x30($s0)
/* 366F8 80035AF8 AE000028 */  sw         $zero, 0x28($s0)
.L80035AFC:
/* 366FC 80035AFC 0C026262 */  jal        passToFree
/* 36700 80035B00 02002021 */   addu      $a0, $s0, $zero
/* 36704 80035B04 8E240080 */  lw         $a0, 0x80($s1)
/* 36708 80035B08 02202821 */  addu       $a1, $s1, $zero
/* 3670C 80035B0C 0C02DCB3 */  jal        func_800B72CC
/* 36710 80035B10 AE200040 */   sw        $zero, 0x40($s1)
/* 36714 80035B14 02202021 */  addu       $a0, $s1, $zero
/* 36718 80035B18 0C02E66C */  jal        widget_menu_free
/* 3671C 80035B1C 02402821 */   addu      $a1, $s2, $zero
/* 36720 80035B20 8FBF001C */  lw         $ra, 0x1c($sp)
/* 36724 80035B24 8FB20018 */  lw         $s2, 0x18($sp)
/* 36728 80035B28 8FB10014 */  lw         $s1, 0x14($sp)
/* 3672C 80035B2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 36730 80035B30 03E00008 */  jr         $ra
/* 36734 80035B34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel BigAssMenu
/* 36738 80035B38 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 3673C 80035B3C AFB40030 */  sw         $s4, 0x30($sp)
/* 36740 80035B40 0080A021 */  addu       $s4, $a0, $zero
/* 36744 80035B44 24040050 */  addiu      $a0, $zero, 0x50
/* 36748 80035B48 AFB20028 */  sw         $s2, 0x28($sp)
/* 3674C 80035B4C 3C12800E */  lui        $s2, %hi(gGlobals)
/* 36750 80035B50 AFB50034 */  sw         $s5, 0x34($sp)
/* 36754 80035B54 265568A8 */  addiu      $s5, $s2, %lo(gGlobals)
/* 36758 80035B58 AFB60038 */  sw         $s6, 0x38($sp)
/* 3675C 80035B5C 30D600FF */  andi       $s6, $a2, 0xff
/* 36760 80035B60 AFBF0044 */  sw         $ra, 0x44($sp)
/* 36764 80035B64 AFBE0040 */  sw         $fp, 0x40($sp)
/* 36768 80035B68 AFB7003C */  sw         $s7, 0x3c($sp)
/* 3676C 80035B6C AFB3002C */  sw         $s3, 0x2c($sp)
/* 36770 80035B70 AFB10024 */  sw         $s1, 0x24($sp)
/* 36774 80035B74 AFB00020 */  sw         $s0, 0x20($sp)
/* 36778 80035B78 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 3677C 80035B7C AE850080 */  sw         $a1, 0x80($s4)
/* 36780 80035B80 92A313C8 */  lbu        $v1, 0x13c8($s5)
/* 36784 80035B84 92A20040 */  lbu        $v0, 0x40($s5)
/* 36788 80035B88 3863000F */  xori       $v1, $v1, 0xf
/* 3678C 80035B8C 38420006 */  xori       $v0, $v0, 6
/* 36790 80035B90 2C420001 */  sltiu      $v0, $v0, 1
/* 36794 80035B94 AFA20018 */  sw         $v0, 0x18($sp)
/* 36798 80035B98 8EA214FC */  lw         $v0, 0x14fc($s5)
/* 3679C 80035B9C 2C770001 */  sltiu      $s7, $v1, 1
/* 367A0 80035BA0 0C026259 */  jal        passToMalloc
/* 367A4 80035BA4 AFA2001C */   sw        $v0, 0x1c($sp)
/* 367A8 80035BA8 24040E6B */  addiu      $a0, $zero, 0xe6b
/* 367AC 80035BAC 26A50430 */  addiu      $a1, $s5, 0x430
/* 367B0 80035BB0 00409821 */  addu       $s3, $v0, $zero
/* 367B4 80035BB4 2402000A */  addiu      $v0, $zero, 0xa
/* 367B8 80035BB8 AE930040 */  sw         $s3, 0x40($s4)
/* 367BC 80035BBC A6600022 */  sh         $zero, 0x22($s3)
/* 367C0 80035BC0 A6600024 */  sh         $zero, 0x24($s3)
/* 367C4 80035BC4 A6620026 */  sh         $v0, 0x26($s3)
/* 367C8 80035BC8 A2760020 */  sb         $s6, 0x20($s3)
/* 367CC 80035BCC AE600000 */  sw         $zero, ($s3)
/* 367D0 80035BD0 AE600004 */  sw         $zero, 4($s3)
/* 367D4 80035BD4 AE600008 */  sw         $zero, 8($s3)
/* 367D8 80035BD8 0C027F0D */  jal        func_loading_borg7
/* 367DC 80035BDC AE60004C */   sw        $zero, 0x4c($s3)
/* 367E0 80035BE0 3C053F80 */  lui        $a1, 0x3f80
/* 367E4 80035BE4 3C064380 */  lui        $a2, 0x4380
/* 367E8 80035BE8 3C01800E */  lui        $at, %hi(D_800DB7BC)
/* 367EC 80035BEC C434B7BC */  lwc1       $f20, %lo(D_800DB7BC)($at)
/* 367F0 80035BF0 AE600034 */  sw         $zero, 0x34($s3)
/* 367F4 80035BF4 AE60003C */  sw         $zero, 0x3c($s3)
/* 367F8 80035BF8 E6740038 */  swc1       $f20, 0x38($s3)
/* 367FC 80035BFC 8C430008 */  lw         $v1, 8($v0)
/* 36800 80035C00 AE620030 */  sw         $v0, 0x30($s3)
/* 36804 80035C04 00602021 */  addu       $a0, $v1, $zero
/* 36808 80035C08 0C029F79 */  jal        setA_with_2floats
/* 3680C 80035C0C AE630028 */   sw        $v1, 0x28($s3)
/* 36810 80035C10 0C029FE2 */  jal        func_800A7F88
/* 36814 80035C14 8E640028 */   lw        $a0, 0x28($s3)
/* 36818 80035C18 0C029FEB */  jal        func_800A7FAC
/* 3681C 80035C1C 8E640028 */   lw        $a0, 0x28($s3)
/* 36820 80035C20 8E640028 */  lw         $a0, 0x28($s3)
/* 36824 80035C24 0C029FD9 */  jal        func_800A7F64
/* 36828 80035C28 0000F021 */   addu      $fp, $zero, $zero
/* 3682C 80035C2C 240500FF */  addiu      $a1, $zero, 0xff
/* 36830 80035C30 240600FF */  addiu      $a2, $zero, 0xff
/* 36834 80035C34 240700FF */  addiu      $a3, $zero, 0xff
/* 36838 80035C38 8E640028 */  lw         $a0, 0x28($s3)
/* 3683C 80035C3C 241100FF */  addiu      $s1, $zero, 0xff
/* 36840 80035C40 0C02A0B3 */  jal        set_anidat_color
/* 36844 80035C44 AFB10010 */   sw        $s1, 0x10($sp)
/* 36848 80035C48 0C026259 */  jal        passToMalloc
/* 3684C 80035C4C 2404007C */   addiu     $a0, $zero, 0x7c
/* 36850 80035C50 00402021 */  addu       $a0, $v0, $zero
/* 36854 80035C54 0C02E518 */  jal        borg8_widget
/* 36858 80035C58 00002821 */   addu      $a1, $zero, $zero
/* 3685C 80035C5C 240500FF */  addiu      $a1, $zero, 0xff
/* 36860 80035C60 8C480078 */  lw         $t0, 0x78($v0)
/* 36864 80035C64 240600FF */  addiu      $a2, $zero, 0xff
/* 36868 80035C68 AE62001C */  sw         $v0, 0x1c($s3)
/* 3686C 80035C6C 85040048 */  lh         $a0, 0x48($t0)
/* 36870 80035C70 240700FF */  addiu      $a3, $zero, 0xff
/* 36874 80035C74 AFB10010 */  sw         $s1, 0x10($sp)
/* 36878 80035C78 8D03004C */  lw         $v1, 0x4c($t0)
/* 3687C 80035C7C 0060F809 */  jalr       $v1
/* 36880 80035C80 00442021 */   addu      $a0, $v0, $a0
/* 36884 80035C84 00002821 */  addu       $a1, $zero, $zero
/* 36888 80035C88 8E64001C */  lw         $a0, 0x1c($s3)
/* 3688C 80035C8C 0C02DD3F */  jal        set_widget_coords
/* 36890 80035C90 00003021 */   addu      $a2, $zero, $zero
/* 36894 80035C94 8E64001C */  lw         $a0, 0x1c($s3)
/* 36898 80035C98 0C02DD42 */  jal        set_widgetHeight
/* 3689C 80035C9C 24050140 */   addiu     $a1, $zero, 0x140
/* 368A0 80035CA0 8E64001C */  lw         $a0, 0x1c($s3)
/* 368A4 80035CA4 0C02DD46 */  jal        set_widgetWidth
/* 368A8 80035CA8 240500F0 */   addiu     $a1, $zero, 0xf0
/* 368AC 80035CAC 0C026259 */  jal        passToMalloc
/* 368B0 80035CB0 2404007C */   addiu     $a0, $zero, 0x7c
/* 368B4 80035CB4 3C04800F */  lui        $a0, %hi(pause_menu_borg8)
/* 368B8 80035CB8 2484D520 */  addiu      $a0, $a0, %lo(pause_menu_borg8)
/* 368BC 80035CBC 00161840 */  sll        $v1, $s6, 1
/* 368C0 80035CC0 00641821 */  addu       $v1, $v1, $a0
/* 368C4 80035CC4 94640000 */  lhu        $a0, ($v1)
/* 368C8 80035CC8 0C0290E2 */  jal        get_borg_8
/* 368CC 80035CCC 00408021 */   addu      $s0, $v0, $zero
/* 368D0 80035CD0 02002021 */  addu       $a0, $s0, $zero
/* 368D4 80035CD4 0C02E518 */  jal        borg8_widget
/* 368D8 80035CD8 00402821 */   addu      $a1, $v0, $zero
/* 368DC 80035CDC 00402021 */  addu       $a0, $v0, $zero
/* 368E0 80035CE0 00002821 */  addu       $a1, $zero, $zero
/* 368E4 80035CE4 00003021 */  addu       $a2, $zero, $zero
/* 368E8 80035CE8 0C02DD3F */  jal        set_widget_coords
/* 368EC 80035CEC AE620018 */   sw        $v0, 0x18($s3)
/* 368F0 80035CF0 8E680018 */  lw         $t0, 0x18($s3)
/* 368F4 80035CF4 240500FF */  addiu      $a1, $zero, 0xff
/* 368F8 80035CF8 8D030078 */  lw         $v1, 0x78($t0)
/* 368FC 80035CFC 240600FF */  addiu      $a2, $zero, 0xff
/* 36900 80035D00 84640048 */  lh         $a0, 0x48($v1)
/* 36904 80035D04 240700FF */  addiu      $a3, $zero, 0xff
/* 36908 80035D08 AFB10010 */  sw         $s1, 0x10($sp)
/* 3690C 80035D0C 8C62004C */  lw         $v0, 0x4c($v1)
/* 36910 80035D10 0040F809 */  jalr       $v0
/* 36914 80035D14 01042021 */   addu      $a0, $t0, $a0
/* 36918 80035D18 8E640018 */  lw         $a0, 0x18($s3)
/* 3691C 80035D1C 0C02DD42 */  jal        set_widgetHeight
/* 36920 80035D20 24050140 */   addiu     $a1, $zero, 0x140
/* 36924 80035D24 8E640018 */  lw         $a0, 0x18($s3)
/* 36928 80035D28 0C02DD46 */  jal        set_widgetWidth
/* 3692C 80035D2C 240500F0 */   addiu     $a1, $zero, 0xf0
/* 36930 80035D30 8E830078 */  lw         $v1, 0x78($s4)
/* 36934 80035D34 8E650018 */  lw         $a1, 0x18($s3)
/* 36938 80035D38 84640030 */  lh         $a0, 0x30($v1)
/* 3693C 80035D3C 8C620034 */  lw         $v0, 0x34($v1)
/* 36940 80035D40 0040F809 */  jalr       $v0
/* 36944 80035D44 02842021 */   addu      $a0, $s4, $a0
/* 36948 80035D48 8E830078 */  lw         $v1, 0x78($s4)
/* 3694C 80035D4C 8E65001C */  lw         $a1, 0x1c($s3)
/* 36950 80035D50 84640030 */  lh         $a0, 0x30($v1)
/* 36954 80035D54 8C620034 */  lw         $v0, 0x34($v1)
/* 36958 80035D58 0040F809 */  jalr       $v0
/* 3695C 80035D5C 02842021 */   addu      $a0, $s4, $a0
/* 36960 80035D60 24030001 */  addiu      $v1, $zero, 1
/* 36964 80035D64 12C30013 */  beq        $s6, $v1, .L80035DB4
/* 36968 80035D68 2AC20002 */   slti      $v0, $s6, 2
/* 3696C 80035D6C 10400005 */  beqz       $v0, .L80035D84
/* 36970 80035D70 24020002 */   addiu     $v0, $zero, 2
/* 36974 80035D74 12C00007 */  beqz       $s6, .L80035D94
/* 36978 80035D78 3C04800E */   lui       $a0, %hi(D_800DB790)
/* 3697C 80035D7C 0800D78A */  j          .L80035E28
/* 36980 80035D80 2484B790 */   addiu     $a0, $a0, %lo(D_800DB790)
.L80035D84:
/* 36984 80035D84 12C20016 */  beq        $s6, $v0, .L80035DE0
/* 36988 80035D88 3C04800E */   lui       $a0, %hi(D_800DB790)
/* 3698C 80035D8C 0800D78A */  j          .L80035E28
/* 36990 80035D90 2484B790 */   addiu     $a0, $a0, %lo(D_800DB790)
.L80035D94:
/* 36994 80035D94 241E074D */  addiu      $fp, $zero, 0x74d
/* 36998 80035D98 24020140 */  addiu      $v0, $zero, 0x140
/* 3699C 80035D9C A6A214DC */  sh         $v0, 0x14dc($s5)
/* 369A0 80035DA0 A6A214DE */  sh         $v0, 0x14de($s5)
/* 369A4 80035DA4 16E00016 */  bnez       $s7, .L80035E00
/* 369A8 80035DA8 E674002C */   swc1      $f20, 0x2c($s3)
/* 369AC 80035DAC 0800D786 */  j          .L80035E18
/* 369B0 80035DB0 8E640030 */   lw        $a0, 0x30($s3)
.L80035DB4:
/* 369B4 80035DB4 241E074D */  addiu      $fp, $zero, 0x74d
/* 369B8 80035DB8 240200A0 */  addiu      $v0, $zero, 0xa0
/* 369BC 80035DBC A6A214DC */  sh         $v0, 0x14dc($s5)
/* 369C0 80035DC0 A6A214DE */  sh         $v0, 0x14de($s5)
/* 369C4 80035DC4 16E0000E */  bnez       $s7, .L80035E00
/* 369C8 80035DC8 AE60002C */   sw        $zero, 0x2c($s3)
/* 369CC 80035DCC 8E640030 */  lw         $a0, 0x30($s3)
/* 369D0 80035DD0 0C028024 */  jal        func_800A0090
/* 369D4 80035DD4 2405000A */   addiu     $a1, $zero, 0xa
/* 369D8 80035DD8 0800D78D */  j          .L80035E34
/* 369DC 80035DDC 00000000 */   nop
.L80035DE0:
/* 369E0 80035DE0 241E074E */  addiu      $fp, $zero, 0x74e
/* 369E4 80035DE4 3C01800E */  lui        $at, %hi(D_800DB7C0)
/* 369E8 80035DE8 C420B7C0 */  lwc1       $f0, %lo(D_800DB7C0)($at)
/* 369EC 80035DEC 2402FFFB */  addiu      $v0, $zero, -5
/* 369F0 80035DF0 A6A014DC */  sh         $zero, 0x14dc($s5)
/* 369F4 80035DF4 A6A214DE */  sh         $v0, 0x14de($s5)
/* 369F8 80035DF8 12E00006 */  beqz       $s7, .L80035E14
/* 369FC 80035DFC E660002C */   swc1      $f0, 0x2c($s3)
.L80035E00:
/* 36A00 80035E00 8E640030 */  lw         $a0, 0x30($s3)
/* 36A04 80035E04 0C028024 */  jal        func_800A0090
/* 36A08 80035E08 00002821 */   addu      $a1, $zero, $zero
/* 36A0C 80035E0C 0800D78D */  j          .L80035E34
/* 36A10 80035E10 00000000 */   nop
.L80035E14:
/* 36A14 80035E14 8E640030 */  lw         $a0, 0x30($s3)
.L80035E18:
/* 36A18 80035E18 0C028024 */  jal        func_800A0090
/* 36A1C 80035E1C 24050016 */   addiu     $a1, $zero, 0x16
/* 36A20 80035E20 0800D78D */  j          .L80035E34
/* 36A24 80035E24 00000000 */   nop
.L80035E28:
/* 36A28 80035E28 3C05800E */  lui        $a1, %hi(D_800DB7A0)
/* 36A2C 80035E2C 0C025F2D */  jal        manualCrash
/* 36A30 80035E30 24A5B7A0 */   addiu     $a1, $a1, %lo(D_800DB7A0)
.L80035E34:
/* 36A34 80035E34 0C00D84D */  jal        func_80036134
/* 36A38 80035E38 02802021 */   addu      $a0, $s4, $zero
/* 36A3C 80035E3C 8FA2001C */  lw         $v0, 0x1c($sp)
/* 36A40 80035E40 54400012 */  bnel       $v0, $zero, .L80035E8C
/* 36A44 80035E44 8E840080 */   lw        $a0, 0x80($s4)
/* 36A48 80035E48 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 36A4C 80035E4C 905214C4 */  lbu        $s2, 0x14c4($v0)
/* 36A50 80035E50 24030007 */  addiu      $v1, $zero, 7
/* 36A54 80035E54 12430003 */  beq        $s2, $v1, .L80035E64
/* 36A58 80035E58 24020003 */   addiu     $v0, $zero, 3
/* 36A5C 80035E5C 16420006 */  bne        $s2, $v0, .L80035E78
/* 36A60 80035E60 02802021 */   addu      $a0, $s4, $zero
.L80035E64:
/* 36A64 80035E64 02802021 */  addu       $a0, $s4, $zero
/* 36A68 80035E68 0C00D882 */  jal        func_80036208
/* 36A6C 80035E6C 00002821 */   addu      $a1, $zero, $zero
/* 36A70 80035E70 0800D7A0 */  j          .L80035E80
/* 36A74 80035E74 00000000 */   nop
.L80035E78:
/* 36A78 80035E78 0C00D882 */  jal        func_80036208
/* 36A7C 80035E7C 24050002 */   addiu     $a1, $zero, 2
.L80035E80:
/* 36A80 80035E80 0C00D8B1 */  jal        calender_menu
/* 36A84 80035E84 02802021 */   addu      $a0, $s4, $zero
/* 36A88 80035E88 8E840080 */  lw         $a0, 0x80($s4)
.L80035E8C:
/* 36A8C 80035E8C 0C02DC7C */  jal        widgetHandler
/* 36A90 80035E90 02802821 */   addu      $a1, $s4, $zero
/* 36A94 80035E94 24030001 */  addiu      $v1, $zero, 1
/* 36A98 80035E98 3C048003 */  lui        $a0, %hi(bigAssMenu_LZFunc)
/* 36A9C 80035E9C 24846DEC */  addiu      $a0, $a0, %lo(bigAssMenu_LZFunc)
/* 36AA0 80035EA0 3C028003 */  lui        $v0, %hi(bigassmenu_Rfunc)
/* 36AA4 80035EA4 24426F70 */  addiu      $v0, $v0, %lo(bigassmenu_Rfunc)
/* 36AA8 80035EA8 AE820028 */  sw         $v0, 0x28($s4)
/* 36AAC 80035EAC 3C028003 */  lui        $v0, %hi(func_8003713C)
/* 36AB0 80035EB0 2442713C */  addiu      $v0, $v0, %lo(func_8003713C)
/* 36AB4 80035EB4 AE83007C */  sw         $v1, 0x7c($s4)
/* 36AB8 80035EB8 3C038003 */  lui        $v1, %hi(func_800371B0)
/* 36ABC 80035EBC 246371B0 */  addiu      $v1, $v1, %lo(func_800371B0)
/* 36AC0 80035EC0 AE820010 */  sw         $v0, 0x10($s4)
/* 36AC4 80035EC4 3C028003 */  lui        $v0, %hi(func_80037224)
/* 36AC8 80035EC8 24427224 */  addiu      $v0, $v0, %lo(func_80037224)
/* 36ACC 80035ECC AE830014 */  sw         $v1, 0x14($s4)
/* 36AD0 80035ED0 3C038003 */  lui        $v1, %hi(func_800372BC)
/* 36AD4 80035ED4 246372BC */  addiu      $v1, $v1, %lo(func_800372BC)
/* 36AD8 80035ED8 AE820008 */  sw         $v0, 8($s4)
/* 36ADC 80035EDC 3C028003 */  lui        $v0, %hi(func_80037354)
/* 36AE0 80035EE0 24427354 */  addiu      $v0, $v0, %lo(func_80037354)
/* 36AE4 80035EE4 AE83000C */  sw         $v1, 0xc($s4)
/* 36AE8 80035EE8 3C038003 */  lui        $v1, %hi(func_800373A0)
/* 36AEC 80035EEC 246373A0 */  addiu      $v1, $v1, %lo(func_800373A0)
/* 36AF0 80035EF0 AE820038 */  sw         $v0, 0x38($s4)
/* 36AF4 80035EF4 3C028003 */  lui        $v0, %hi(func_800373EC)
/* 36AF8 80035EF8 244273EC */  addiu      $v0, $v0, %lo(func_800373EC)
/* 36AFC 80035EFC AE83003C */  sw         $v1, 0x3c($s4)
/* 36B00 80035F00 3C038003 */  lui        $v1, %hi(bigAssMenu_CDownFunc)
/* 36B04 80035F04 24637438 */  addiu      $v1, $v1, %lo(bigAssMenu_CDownFunc)
/* 36B08 80035F08 AE820030 */  sw         $v0, 0x30($s4)
/* 36B0C 80035F0C 3C028003 */  lui        $v0, %hi(BigAssMenu_StartFunc)
/* 36B10 80035F10 244275A4 */  addiu      $v0, $v0, %lo(BigAssMenu_StartFunc)
/* 36B14 80035F14 AE830034 */  sw         $v1, 0x34($s4)
/* 36B18 80035F18 3C038003 */  lui        $v1, %hi(bigassMenu_AFunc)
/* 36B1C 80035F1C 24637518 */  addiu      $v1, $v1, %lo(bigassMenu_AFunc)
/* 36B20 80035F20 AE820020 */  sw         $v0, 0x20($s4)
/* 36B24 80035F24 3C028003 */  lui        $v0, %hi(bigAssMenu_BFunc)
/* 36B28 80035F28 24427484 */  addiu      $v0, $v0, %lo(bigAssMenu_BFunc)
/* 36B2C 80035F2C AE830018 */  sw         $v1, 0x18($s4)
/* 36B30 80035F30 3C038003 */  lui        $v1, %hi(bigAssOpenCallback_1)
/* 36B34 80035F34 246367E0 */  addiu      $v1, $v1, %lo(bigAssOpenCallback_1)
/* 36B38 80035F38 AE82001C */  sw         $v0, 0x1c($s4)
/* 36B3C 80035F3C 3C028003 */  lui        $v0, %hi(bigAssOpenCallback)
/* 36B40 80035F40 24426AF0 */  addiu      $v0, $v0, %lo(bigAssOpenCallback)
/* 36B44 80035F44 AE840024 */  sw         $a0, 0x24($s4)
/* 36B48 80035F48 AE84002C */  sw         $a0, 0x2c($s4)
/* 36B4C 80035F4C AE830000 */  sw         $v1, ($s4)
/* 36B50 80035F50 AE820004 */  sw         $v0, 4($s4)
/* 36B54 80035F54 8FA20018 */  lw         $v0, 0x18($sp)
/* 36B58 80035F58 10400004 */  beqz       $v0, .L80035F6C
/* 36B5C 80035F5C 3C028003 */   lui       $v0, %hi(func_80036D5C)
/* 36B60 80035F60 24426D5C */  addiu      $v0, $v0, %lo(func_80036D5C)
/* 36B64 80035F64 0800D7DF */  j          .L80035F7C
/* 36B68 80035F68 AE820004 */   sw        $v0, 4($s4)
.L80035F6C:
/* 36B6C 80035F6C 12E00003 */  beqz       $s7, .L80035F7C
/* 36B70 80035F70 3C028003 */   lui       $v0, %hi(func_800369F8)
/* 36B74 80035F74 244269F8 */  addiu      $v0, $v0, %lo(func_800369F8)
/* 36B78 80035F78 AE820000 */  sw         $v0, ($s4)
.L80035F7C:
/* 36B7C 80035F7C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 36B80 80035F80 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 36B84 80035F84 03C02821 */  addu       $a1, $fp, $zero
/* 36B88 80035F88 00003021 */  addu       $a2, $zero, $zero
/* 36B8C 80035F8C 3C073F80 */  lui        $a3, 0x3f80
/* 36B90 80035F90 2402003C */  addiu      $v0, $zero, 0x3c
/* 36B94 80035F94 AFA20010 */  sw         $v0, 0x10($sp)
/* 36B98 80035F98 0C0156F4 */  jal        play_SFX
/* 36B9C 80035F9C AFA00014 */   sw        $zero, 0x14($sp)
/* 36BA0 80035FA0 0C0271BF */  jal        cont_delay
/* 36BA4 80035FA4 00002021 */   addu      $a0, $zero, $zero
/* 36BA8 80035FA8 8FBF0044 */  lw         $ra, 0x44($sp)
/* 36BAC 80035FAC 8FBE0040 */  lw         $fp, 0x40($sp)
/* 36BB0 80035FB0 8FB7003C */  lw         $s7, 0x3c($sp)
/* 36BB4 80035FB4 8FB60038 */  lw         $s6, 0x38($sp)
/* 36BB8 80035FB8 8FB50034 */  lw         $s5, 0x34($sp)
/* 36BBC 80035FBC 8FB40030 */  lw         $s4, 0x30($sp)
/* 36BC0 80035FC0 8FB3002C */  lw         $s3, 0x2c($sp)
/* 36BC4 80035FC4 8FB20028 */  lw         $s2, 0x28($sp)
/* 36BC8 80035FC8 8FB10024 */  lw         $s1, 0x24($sp)
/* 36BCC 80035FCC 8FB00020 */  lw         $s0, 0x20($sp)
/* 36BD0 80035FD0 D7B40048 */  ldc1       $f20, 0x48($sp)
/* 36BD4 80035FD4 03E00008 */  jr         $ra
/* 36BD8 80035FD8 27BD0050 */   addiu     $sp, $sp, 0x50

glabel bigAssOpenCallback_2
/* 36BDC 80035FDC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 36BE0 80035FE0 AFB30024 */  sw         $s3, 0x24($sp)
/* 36BE4 80035FE4 00009821 */  addu       $s3, $zero, $zero
/* 36BE8 80035FE8 AFB40028 */  sw         $s4, 0x28($sp)
/* 36BEC 80035FEC 0080A021 */  addu       $s4, $a0, $zero
/* 36BF0 80035FF0 3C03800E */  lui        $v1, %hi(gGlobals)
/* 36BF4 80035FF4 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 36BF8 80035FF8 AFB00018 */  sw         $s0, 0x18($sp)
/* 36BFC 80035FFC 24702078 */  addiu      $s0, $v1, 0x2078
/* 36C00 80036000 02002021 */  addu       $a0, $s0, $zero
/* 36C04 80036004 3C05800E */  lui        $a1, %hi(D_800DB7C4)
/* 36C08 80036008 24A5B7C4 */  addiu      $a1, $a1, %lo(D_800DB7C4)
/* 36C0C 8003600C AFBF002C */  sw         $ra, 0x2c($sp)
/* 36C10 80036010 AFB20020 */  sw         $s2, 0x20($sp)
/* 36C14 80036014 AFB1001C */  sw         $s1, 0x1c($sp)
/* 36C18 80036018 906214C4 */  lbu        $v0, 0x14c4($v1)
/* 36C1C 8003601C 8E910040 */  lw         $s1, 0x40($s4)
/* 36C20 80036020 38420005 */  xori       $v0, $v0, 5
/* 36C24 80036024 2C520001 */  sltiu      $s2, $v0, 1
/* 36C28 80036028 0C0333AC */  jal        sprintf
/* 36C2C 8003602C 02403021 */   addu      $a2, $s2, $zero
/* 36C30 80036030 0C00B6B8 */  jal        debug_queue
/* 36C34 80036034 02002021 */   addu      $a0, $s0, $zero
/* 36C38 80036038 92230020 */  lbu        $v1, 0x20($s1)
/* 36C3C 8003603C 24020001 */  addiu      $v0, $zero, 1
/* 36C40 80036040 1062000F */  beq        $v1, $v0, .L80036080
/* 36C44 80036044 28620002 */   slti      $v0, $v1, 2
/* 36C48 80036048 10400005 */  beqz       $v0, .L80036060
/* 36C4C 8003604C 24020002 */   addiu     $v0, $zero, 2
/* 36C50 80036050 10600007 */  beqz       $v1, .L80036070
/* 36C54 80036054 3C04800E */   lui       $a0, %hi(D_800DB7DC)
/* 36C58 80036058 0800D833 */  j          .L800360CC
/* 36C5C 8003605C 2484B7DC */   addiu     $a0, $a0, %lo(D_800DB7DC)
.L80036060:
/* 36C60 80036060 1062000E */  beq        $v1, $v0, .L8003609C
/* 36C64 80036064 3C04800E */   lui       $a0, %hi(D_800DB7DC)
/* 36C68 80036068 0800D833 */  j          .L800360CC
/* 36C6C 8003606C 2484B7DC */   addiu     $a0, $a0, %lo(D_800DB7DC)
.L80036070:
/* 36C70 80036070 1640000C */  bnez       $s2, .L800360A4
/* 36C74 80036074 2413074E */   addiu     $s3, $zero, 0x74e
/* 36C78 80036078 0800D82F */  j          .L800360BC
/* 36C7C 8003607C 8E240030 */   lw        $a0, 0x30($s1)
.L80036080:
/* 36C80 80036080 16400008 */  bnez       $s2, .L800360A4
/* 36C84 80036084 2413074E */   addiu     $s3, $zero, 0x74e
/* 36C88 80036088 8E240030 */  lw         $a0, 0x30($s1)
/* 36C8C 8003608C 0C028024 */  jal        func_800A0090
/* 36C90 80036090 24050013 */   addiu     $a1, $zero, 0x13
/* 36C94 80036094 0800D837 */  j          .L800360DC
/* 36C98 80036098 8E240030 */   lw        $a0, 0x30($s1)
.L8003609C:
/* 36C9C 8003609C 12400006 */  beqz       $s2, .L800360B8
/* 36CA0 800360A0 2413074D */   addiu     $s3, $zero, 0x74d
.L800360A4:
/* 36CA4 800360A4 8E240030 */  lw         $a0, 0x30($s1)
/* 36CA8 800360A8 0C028024 */  jal        func_800A0090
/* 36CAC 800360AC 00002821 */   addu      $a1, $zero, $zero
/* 36CB0 800360B0 0800D837 */  j          .L800360DC
/* 36CB4 800360B4 8E240030 */   lw        $a0, 0x30($s1)
.L800360B8:
/* 36CB8 800360B8 8E240030 */  lw         $a0, 0x30($s1)
.L800360BC:
/* 36CBC 800360BC 0C028024 */  jal        func_800A0090
/* 36CC0 800360C0 2405000B */   addiu     $a1, $zero, 0xb
/* 36CC4 800360C4 0800D837 */  j          .L800360DC
/* 36CC8 800360C8 8E240030 */   lw        $a0, 0x30($s1)
.L800360CC:
/* 36CCC 800360CC 3C05800E */  lui        $a1, %hi(D_800DB7F0)
/* 36CD0 800360D0 0C025F2D */  jal        manualCrash
/* 36CD4 800360D4 24A5B7F0 */   addiu     $a1, $a1, %lo(D_800DB7F0)
/* 36CD8 800360D8 8E240030 */  lw         $a0, 0x30($s1)
.L800360DC:
/* 36CDC 800360DC 0C0280C1 */  jal        func_800A0304
/* 36CE0 800360E0 24050001 */   addiu     $a1, $zero, 1
/* 36CE4 800360E4 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 36CE8 800360E8 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 36CEC 800360EC 02602821 */  addu       $a1, $s3, $zero
/* 36CF0 800360F0 00003021 */  addu       $a2, $zero, $zero
/* 36CF4 800360F4 3C073F80 */  lui        $a3, 0x3f80
/* 36CF8 800360F8 2402003C */  addiu      $v0, $zero, 0x3c
/* 36CFC 800360FC AFA20010 */  sw         $v0, 0x10($sp)
/* 36D00 80036100 0C0156F4 */  jal        play_SFX
/* 36D04 80036104 AFA00014 */   sw        $zero, 0x14($sp)
/* 36D08 80036108 02802021 */  addu       $a0, $s4, $zero
/* 36D0C 8003610C 0C02DEC8 */  jal        set_widgets_byte0x70
/* 36D10 80036110 24050005 */   addiu     $a1, $zero, 5
/* 36D14 80036114 8FBF002C */  lw         $ra, 0x2c($sp)
/* 36D18 80036118 8FB40028 */  lw         $s4, 0x28($sp)
/* 36D1C 8003611C 8FB30024 */  lw         $s3, 0x24($sp)
/* 36D20 80036120 8FB20020 */  lw         $s2, 0x20($sp)
/* 36D24 80036124 8FB1001C */  lw         $s1, 0x1c($sp)
/* 36D28 80036128 8FB00018 */  lw         $s0, 0x18($sp)
/* 36D2C 8003612C 03E00008 */  jr         $ra
/* 36D30 80036130 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80036134
/* 36D34 80036134 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 36D38 80036138 AFB20018 */  sw         $s2, 0x18($sp)
/* 36D3C 8003613C 00809021 */  addu       $s2, $a0, $zero
/* 36D40 80036140 24040080 */  addiu      $a0, $zero, 0x80
/* 36D44 80036144 AFBF001C */  sw         $ra, 0x1c($sp)
/* 36D48 80036148 AFB10014 */  sw         $s1, 0x14($sp)
/* 36D4C 8003614C AFB00010 */  sw         $s0, 0x10($sp)
/* 36D50 80036150 0C026259 */  jal        passToMalloc
/* 36D54 80036154 8E500040 */   lw        $s0, 0x40($s2)
/* 36D58 80036158 0C011B24 */  jal        func_80046C90
/* 36D5C 8003615C 00402021 */   addu      $a0, $v0, $zero
/* 36D60 80036160 AE020000 */  sw         $v0, ($s0)
/* 36D64 80036164 A040005C */  sb         $zero, 0x5c($v0)
/* 36D68 80036168 3C02800E */  lui        $v0, %hi(gGlobals)
/* 36D6C 8003616C 8E040000 */  lw         $a0, ($s0)
/* 36D70 80036170 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 36D74 80036174 AE04000C */  sw         $a0, 0xc($s0)
/* 36D78 80036178 922314D0 */  lbu        $v1, 0x14d0($s1)
/* 36D7C 8003617C 10600005 */  beqz       $v1, .L80036194
/* 36D80 80036180 00000000 */   nop
/* 36D84 80036184 0C011B81 */  jal        func_80046E04
/* 36D88 80036188 24050002 */   addiu     $a1, $zero, 2
/* 36D8C 8003618C 0800D867 */  j          .L8003619C
/* 36D90 80036190 A22014D0 */   sb        $zero, 0x14d0($s1)
.L80036194:
/* 36D94 80036194 0C011B81 */  jal        func_80046E04
/* 36D98 80036198 00002821 */   addu      $a1, $zero, $zero
.L8003619C:
/* 36D9C 8003619C 00003021 */  addu       $a2, $zero, $zero
/* 36DA0 800361A0 92020020 */  lbu        $v0, 0x20($s0)
/* 36DA4 800361A4 8E040000 */  lw         $a0, ($s0)
/* 36DA8 800361A8 00021023 */  negu       $v0, $v0
/* 36DAC 800361AC 00022880 */  sll        $a1, $v0, 2
/* 36DB0 800361B0 00A22821 */  addu       $a1, $a1, $v0
/* 36DB4 800361B4 00052D80 */  sll        $a1, $a1, 0x16
/* 36DB8 800361B8 0C02F22A */  jal        widget_move
/* 36DBC 800361BC 00052C03 */   sra       $a1, $a1, 0x10
/* 36DC0 800361C0 8E050000 */  lw         $a1, ($s0)
/* 36DC4 800361C4 8CA30078 */  lw         $v1, 0x78($a1)
/* 36DC8 800361C8 84640028 */  lh         $a0, 0x28($v1)
/* 36DCC 800361CC 8C62002C */  lw         $v0, 0x2c($v1)
/* 36DD0 800361D0 0040F809 */  jalr       $v0
/* 36DD4 800361D4 00A42021 */   addu      $a0, $a1, $a0
/* 36DD8 800361D8 8E430078 */  lw         $v1, 0x78($s2)
/* 36DDC 800361DC 8E050000 */  lw         $a1, ($s0)
/* 36DE0 800361E0 84640030 */  lh         $a0, 0x30($v1)
/* 36DE4 800361E4 8C620034 */  lw         $v0, 0x34($v1)
/* 36DE8 800361E8 0040F809 */  jalr       $v0
/* 36DEC 800361EC 02442021 */   addu      $a0, $s2, $a0
/* 36DF0 800361F0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 36DF4 800361F4 8FB20018 */  lw         $s2, 0x18($sp)
/* 36DF8 800361F8 8FB10014 */  lw         $s1, 0x14($sp)
/* 36DFC 800361FC 8FB00010 */  lw         $s0, 0x10($sp)
/* 36E00 80036200 03E00008 */  jr         $ra
/* 36E04 80036204 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80036208
/* 36E08 80036208 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 36E0C 8003620C AFB20018 */  sw         $s2, 0x18($sp)
/* 36E10 80036210 00809021 */  addu       $s2, $a0, $zero
/* 36E14 80036214 24040094 */  addiu      $a0, $zero, 0x94
/* 36E18 80036218 AFB10014 */  sw         $s1, 0x14($sp)
/* 36E1C 8003621C 30B100FF */  andi       $s1, $a1, 0xff
/* 36E20 80036220 AFBF001C */  sw         $ra, 0x1c($sp)
/* 36E24 80036224 AFB00010 */  sw         $s0, 0x10($sp)
/* 36E28 80036228 0C026259 */  jal        passToMalloc
/* 36E2C 8003622C 8E500040 */   lw        $s0, 0x40($s2)
/* 36E30 80036230 00402021 */  addu       $a0, $v0, $zero
/* 36E34 80036234 00002821 */  addu       $a1, $zero, $zero
/* 36E38 80036238 0C00DD94 */  jal        Dollmenu_build
/* 36E3C 8003623C 02203021 */   addu      $a2, $s1, $zero
/* 36E40 80036240 24030001 */  addiu      $v1, $zero, 1
/* 36E44 80036244 00003021 */  addu       $a2, $zero, $zero
/* 36E48 80036248 AE020004 */  sw         $v0, 4($s0)
/* 36E4C 8003624C A043005C */  sb         $v1, 0x5c($v0)
/* 36E50 80036250 24020001 */  addiu      $v0, $zero, 1
/* 36E54 80036254 8E070004 */  lw         $a3, 4($s0)
/* 36E58 80036258 92030020 */  lbu        $v1, 0x20($s0)
/* 36E5C 8003625C 00E02021 */  addu       $a0, $a3, $zero
/* 36E60 80036260 00431023 */  subu       $v0, $v0, $v1
/* 36E64 80036264 00022880 */  sll        $a1, $v0, 2
/* 36E68 80036268 00A22821 */  addu       $a1, $a1, $v0
/* 36E6C 8003626C 00052D80 */  sll        $a1, $a1, 0x16
/* 36E70 80036270 00052C03 */  sra        $a1, $a1, 0x10
/* 36E74 80036274 0C02F22A */  jal        widget_move
/* 36E78 80036278 AE070010 */   sw        $a3, 0x10($s0)
/* 36E7C 8003627C 8E050004 */  lw         $a1, 4($s0)
/* 36E80 80036280 8CA30078 */  lw         $v1, 0x78($a1)
/* 36E84 80036284 84640028 */  lh         $a0, 0x28($v1)
/* 36E88 80036288 8C62002C */  lw         $v0, 0x2c($v1)
/* 36E8C 8003628C 0040F809 */  jalr       $v0
/* 36E90 80036290 00A42021 */   addu      $a0, $a1, $a0
/* 36E94 80036294 8E430078 */  lw         $v1, 0x78($s2)
/* 36E98 80036298 8E050004 */  lw         $a1, 4($s0)
/* 36E9C 8003629C 84640030 */  lh         $a0, 0x30($v1)
/* 36EA0 800362A0 8C620034 */  lw         $v0, 0x34($v1)
/* 36EA4 800362A4 0040F809 */  jalr       $v0
/* 36EA8 800362A8 02442021 */   addu      $a0, $s2, $a0
/* 36EAC 800362AC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 36EB0 800362B0 8FB20018 */  lw         $s2, 0x18($sp)
/* 36EB4 800362B4 8FB10014 */  lw         $s1, 0x14($sp)
/* 36EB8 800362B8 8FB00010 */  lw         $s0, 0x10($sp)
/* 36EBC 800362BC 03E00008 */  jr         $ra
/* 36EC0 800362C0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel calender_menu
/* 36EC4 800362C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 36EC8 800362C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 36ECC 800362CC 00808821 */  addu       $s1, $a0, $zero
/* 36ED0 800362D0 24040098 */  addiu      $a0, $zero, 0x98
/* 36ED4 800362D4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 36ED8 800362D8 AFB00010 */  sw         $s0, 0x10($sp)
/* 36EDC 800362DC 0C026259 */  jal        passToMalloc
/* 36EE0 800362E0 8E300040 */   lw        $s0, 0x40($s1)
/* 36EE4 800362E4 0C011FA0 */  jal        calendar_widget
/* 36EE8 800362E8 00402021 */   addu      $a0, $v0, $zero
/* 36EEC 800362EC 24030002 */  addiu      $v1, $zero, 2
/* 36EF0 800362F0 AE020008 */  sw         $v0, 8($s0)
/* 36EF4 800362F4 A043005C */  sb         $v1, 0x5c($v0)
/* 36EF8 800362F8 24020002 */  addiu      $v0, $zero, 2
/* 36EFC 800362FC 8E060008 */  lw         $a2, 8($s0)
/* 36F00 80036300 92030020 */  lbu        $v1, 0x20($s0)
/* 36F04 80036304 00C02021 */  addu       $a0, $a2, $zero
/* 36F08 80036308 00431023 */  subu       $v0, $v0, $v1
/* 36F0C 8003630C 00022880 */  sll        $a1, $v0, 2
/* 36F10 80036310 00A22821 */  addu       $a1, $a1, $v0
/* 36F14 80036314 00052D80 */  sll        $a1, $a1, 0x16
/* 36F18 80036318 00052C03 */  sra        $a1, $a1, 0x10
/* 36F1C 8003631C AE060014 */  sw         $a2, 0x14($s0)
/* 36F20 80036320 0C02F22A */  jal        widget_move
/* 36F24 80036324 00003021 */   addu      $a2, $zero, $zero
/* 36F28 80036328 8E050008 */  lw         $a1, 8($s0)
/* 36F2C 8003632C 8CA30078 */  lw         $v1, 0x78($a1)
/* 36F30 80036330 84640028 */  lh         $a0, 0x28($v1)
/* 36F34 80036334 8C62002C */  lw         $v0, 0x2c($v1)
/* 36F38 80036338 0040F809 */  jalr       $v0
/* 36F3C 8003633C 00A42021 */   addu      $a0, $a1, $a0
/* 36F40 80036340 8E230078 */  lw         $v1, 0x78($s1)
/* 36F44 80036344 8E050008 */  lw         $a1, 8($s0)
/* 36F48 80036348 84640030 */  lh         $a0, 0x30($v1)
/* 36F4C 8003634C 8C620034 */  lw         $v0, 0x34($v1)
/* 36F50 80036350 0040F809 */  jalr       $v0
/* 36F54 80036354 02242021 */   addu      $a0, $s1, $a0
/* 36F58 80036358 8FBF0018 */  lw         $ra, 0x18($sp)
/* 36F5C 8003635C 8FB10014 */  lw         $s1, 0x14($sp)
/* 36F60 80036360 8FB00010 */  lw         $s0, 0x10($sp)
/* 36F64 80036364 03E00008 */  jr         $ra
/* 36F68 80036368 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003636C
/* 36F6C 8003636C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 36F70 80036370 00802821 */  addu       $a1, $a0, $zero
/* 36F74 80036374 AFBF0010 */  sw         $ra, 0x10($sp)
/* 36F78 80036378 8CA2007C */  lw         $v0, 0x7c($a1)
/* 36F7C 8003637C 10400005 */  beqz       $v0, .L80036394
/* 36F80 80036380 8FBF0010 */   lw        $ra, 0x10($sp)
/* 36F84 80036384 8CA40080 */  lw         $a0, 0x80($a1)
/* 36F88 80036388 0C02DCB3 */  jal        func_800B72CC
/* 36F8C 8003638C ACA0007C */   sw        $zero, 0x7c($a1)
/* 36F90 80036390 8FBF0010 */  lw         $ra, 0x10($sp)
.L80036394:
/* 36F94 80036394 03E00008 */  jr         $ra
/* 36F98 80036398 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003639C
/* 36F9C 8003639C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 36FA0 800363A0 00802821 */  addu       $a1, $a0, $zero
/* 36FA4 800363A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 36FA8 800363A8 8CA2007C */  lw         $v0, 0x7c($a1)
/* 36FAC 800363AC 14400006 */  bnez       $v0, .L800363C8
/* 36FB0 800363B0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 36FB4 800363B4 8CA40080 */  lw         $a0, 0x80($a1)
/* 36FB8 800363B8 24020001 */  addiu      $v0, $zero, 1
/* 36FBC 800363BC 0C02DC7C */  jal        widgetHandler
/* 36FC0 800363C0 ACA2007C */   sw        $v0, 0x7c($a1)
/* 36FC4 800363C4 8FBF0010 */  lw         $ra, 0x10($sp)
.L800363C8:
/* 36FC8 800363C8 03E00008 */  jr         $ra
/* 36FCC 800363CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800363D0
/* 36FD0 800363D0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 36FD4 800363D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 36FD8 800363D8 00808021 */  addu       $s0, $a0, $zero
/* 36FDC 800363DC 00073C00 */  sll        $a3, $a3, 0x10
/* 36FE0 800363E0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 36FE4 800363E4 87A8003E */  lh         $t0, 0x3e($sp)
/* 36FE8 800363E8 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 36FEC 800363EC AFBF0020 */  sw         $ra, 0x20($sp)
/* 36FF0 800363F0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 36FF4 800363F4 844614DC */  lh         $a2, 0x14dc($v0)
/* 36FF8 800363F8 844314DE */  lh         $v1, 0x14de($v0)
/* 36FFC 800363FC 00073C03 */  sra        $a3, $a3, 0x10
/* 37000 80036400 AFA30010 */  sw         $v1, 0x10($sp)
/* 37004 80036404 0C02DE14 */  jal        widget_func_8
/* 37008 80036408 AFA80014 */   sw        $t0, 0x14($sp)
/* 3700C 8003640C 8E030040 */  lw         $v1, 0x40($s0)
/* 37010 80036410 8C650030 */  lw         $a1, 0x30($v1)
/* 37014 80036414 0C028191 */  jal        func_800A0644
/* 37018 80036418 00402021 */   addu      $a0, $v0, $zero
/* 3701C 8003641C 0C0025B4 */  jal        get_hres
/* 37020 80036420 00408021 */   addu      $s0, $v0, $zero
/* 37024 80036424 0C0025B7 */  jal        get_vres
/* 37028 80036428 00408821 */   addu      $s1, $v0, $zero
/* 3702C 8003642C 02002021 */  addu       $a0, $s0, $zero
/* 37030 80036430 24050006 */  addiu      $a1, $zero, 6
/* 37034 80036434 02203021 */  addu       $a2, $s1, $zero
/* 37038 80036438 0C0290ED */  jal        rsp_func
/* 3703C 8003643C 00403821 */   addu      $a3, $v0, $zero
/* 37040 80036440 8FBF0020 */  lw         $ra, 0x20($sp)
/* 37044 80036444 8FB1001C */  lw         $s1, 0x1c($sp)
/* 37048 80036448 8FB00018 */  lw         $s0, 0x18($sp)
/* 3704C 8003644C 03E00008 */  jr         $ra
/* 37050 80036450 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80036454
/* 37054 80036454 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 37058 80036458 AFB5003C */  sw         $s5, 0x3c($sp)
/* 3705C 8003645C 0080A821 */  addu       $s5, $a0, $zero
/* 37060 80036460 AFBF0040 */  sw         $ra, 0x40($sp)
/* 37064 80036464 AFB40038 */  sw         $s4, 0x38($sp)
/* 37068 80036468 AFB30034 */  sw         $s3, 0x34($sp)
/* 3706C 8003646C AFB20030 */  sw         $s2, 0x30($sp)
/* 37070 80036470 AFB1002C */  sw         $s1, 0x2c($sp)
/* 37074 80036474 AFB00028 */  sw         $s0, 0x28($sp)
/* 37078 80036478 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 3707C 8003647C 8EB00040 */  lw         $s0, 0x40($s5)
/* 37080 80036480 96070022 */  lhu        $a3, 0x22($s0)
/* 37084 80036484 86040022 */  lh         $a0, 0x22($s0)
/* 37088 80036488 86030024 */  lh         $v1, 0x24($s0)
/* 3708C 8003648C 10830055 */  beq        $a0, $v1, .L800365E4
/* 37090 80036490 96060024 */   lhu       $a2, 0x24($s0)
/* 37094 80036494 0083102A */  slt        $v0, $a0, $v1
/* 37098 80036498 10400013 */  beqz       $v0, .L800364E8
/* 3709C 8003649C 00009821 */   addu      $s3, $zero, $zero
/* 370A0 800364A0 86050026 */  lh         $a1, 0x26($s0)
/* 370A4 800364A4 00651023 */  subu       $v0, $v1, $a1
/* 370A8 800364A8 0044102A */  slt        $v0, $v0, $a0
/* 370AC 800364AC 14400005 */  bnez       $v0, .L800364C4
/* 370B0 800364B0 96030026 */   lhu       $v1, 0x26($s0)
/* 370B4 800364B4 00E31021 */  addu       $v0, $a3, $v1
/* 370B8 800364B8 A6020022 */  sh         $v0, 0x22($s0)
/* 370BC 800364BC 0800D935 */  j          .L800364D4
/* 370C0 800364C0 00A09821 */   addu      $s3, $a1, $zero
.L800364C4:
/* 370C4 800364C4 00C71023 */  subu       $v0, $a2, $a3
/* 370C8 800364C8 00021400 */  sll        $v0, $v0, 0x10
/* 370CC 800364CC 00029C03 */  sra        $s3, $v0, 0x10
/* 370D0 800364D0 A6060022 */  sh         $a2, 0x22($s0)
.L800364D4:
/* 370D4 800364D4 00003021 */  addu       $a2, $zero, $zero
/* 370D8 800364D8 86050022 */  lh         $a1, 0x22($s0)
/* 370DC 800364DC 8E04001C */  lw         $a0, 0x1c($s0)
/* 370E0 800364E0 0C02DD3F */  jal        set_widget_coords
/* 370E4 800364E4 24A5FEC0 */   addiu     $a1, $a1, -0x140
.L800364E8:
/* 370E8 800364E8 86050022 */  lh         $a1, 0x22($s0)
/* 370EC 800364EC 86040024 */  lh         $a0, 0x24($s0)
/* 370F0 800364F0 96030022 */  lhu        $v1, 0x22($s0)
/* 370F4 800364F4 0085102A */  slt        $v0, $a0, $a1
/* 370F8 800364F8 10400013 */  beqz       $v0, .L80036548
/* 370FC 800364FC 96060024 */   lhu       $a2, 0x24($s0)
/* 37100 80036500 86020026 */  lh         $v0, 0x26($s0)
/* 37104 80036504 00821021 */  addu       $v0, $a0, $v0
/* 37108 80036508 00A2102A */  slt        $v0, $a1, $v0
/* 3710C 8003650C 14400007 */  bnez       $v0, .L8003652C
/* 37110 80036510 96040026 */   lhu       $a0, 0x26($s0)
/* 37114 80036514 00641823 */  subu       $v1, $v1, $a0
/* 37118 80036518 A6030022 */  sh         $v1, 0x22($s0)
/* 3711C 8003651C 00041023 */  negu       $v0, $a0
/* 37120 80036520 00021400 */  sll        $v0, $v0, 0x10
/* 37124 80036524 0800D94D */  j          .L80036534
/* 37128 80036528 00029C03 */   sra       $s3, $v0, 0x10
.L8003652C:
/* 3712C 8003652C A6060022 */  sh         $a2, 0x22($s0)
/* 37130 80036530 00009821 */  addu       $s3, $zero, $zero
.L80036534:
/* 37134 80036534 00003021 */  addu       $a2, $zero, $zero
/* 37138 80036538 86050022 */  lh         $a1, 0x22($s0)
/* 3713C 8003653C 8E04001C */  lw         $a0, 0x1c($s0)
/* 37140 80036540 0C02DD3F */  jal        set_widget_coords
/* 37144 80036544 24A50140 */   addiu     $a1, $a1, 0x140
.L80036548:
/* 37148 80036548 00008821 */  addu       $s1, $zero, $zero
/* 3714C 8003654C 2612000C */  addiu      $s2, $s0, 0xc
/* 37150 80036550 3C14800F */  lui        $s4, 0x800f
/* 37154 80036554 00111080 */  sll        $v0, $s1, 2
.L80036558:
/* 37158 80036558 02421021 */  addu       $v0, $s2, $v0
/* 3715C 8003655C 8C440000 */  lw         $a0, ($v0)
/* 37160 80036560 02602821 */  addu       $a1, $s3, $zero
/* 37164 80036564 0C02F22A */  jal        widget_move
/* 37168 80036568 00003021 */   addu      $a2, $zero, $zero
/* 3716C 8003656C 26220001 */  addiu      $v0, $s1, 1
/* 37170 80036570 305100FF */  andi       $s1, $v0, 0xff
/* 37174 80036574 2E230003 */  sltiu      $v1, $s1, 3
/* 37178 80036578 1460FFF7 */  bnez       $v1, .L80036558
/* 3717C 8003657C 00111080 */   sll       $v0, $s1, 2
/* 37180 80036580 8E040018 */  lw         $a0, 0x18($s0)
/* 37184 80036584 86050022 */  lh         $a1, 0x22($s0)
/* 37188 80036588 0C02DD3F */  jal        set_widget_coords
/* 3718C 8003658C 00003021 */   addu      $a2, $zero, $zero
/* 37190 80036590 86030022 */  lh         $v1, 0x22($s0)
/* 37194 80036594 86020024 */  lh         $v0, 0x24($s0)
/* 37198 80036598 5462000F */  bnel       $v1, $v0, .L800365D8
/* 3719C 8003659C C600002C */   lwc1      $f0, 0x2c($s0)
/* 371A0 800365A0 8E02001C */  lw         $v0, 0x1c($s0)
/* 371A4 800365A4 8E040018 */  lw         $a0, 0x18($s0)
/* 371A8 800365A8 8C45006C */  lw         $a1, 0x6c($v0)
/* 371AC 800365AC 0C02DD50 */  jal        widget_replace_borg8
/* 371B0 800365B0 24060001 */   addiu     $a2, $zero, 1
/* 371B4 800365B4 00002821 */  addu       $a1, $zero, $zero
/* 371B8 800365B8 8E040018 */  lw         $a0, 0x18($s0)
/* 371BC 800365BC 8E02001C */  lw         $v0, 0x1c($s0)
/* 371C0 800365C0 00003021 */  addu       $a2, $zero, $zero
/* 371C4 800365C4 A6000024 */  sh         $zero, 0x24($s0)
/* 371C8 800365C8 A6000022 */  sh         $zero, 0x22($s0)
/* 371CC 800365CC 0C02DD3F */  jal        set_widget_coords
/* 371D0 800365D0 AC40006C */   sw        $zero, 0x6c($v0)
/* 371D4 800365D4 C600002C */  lwc1       $f0, 0x2c($s0)
.L800365D8:
/* 371D8 800365D8 C6020040 */  lwc1       $f2, 0x40($s0)
/* 371DC 800365DC 0800D981 */  j          .L80036604
/* 371E0 800365E0 46020000 */   add.s     $f0, $f0, $f2
.L800365E4:
/* 371E4 800365E4 3C02800F */  lui        $v0, %hi(scroll_floats)
/* 371E8 800365E8 92030020 */  lbu        $v1, 0x20($s0)
/* 371EC 800365EC 2442D528 */  addiu      $v0, $v0, %lo(scroll_floats)
/* 371F0 800365F0 00031880 */  sll        $v1, $v1, 2
/* 371F4 800365F4 00621821 */  addu       $v1, $v1, $v0
/* 371F8 800365F8 C4600000 */  lwc1       $f0, ($v1)
/* 371FC 800365FC 3C14800F */  lui        $s4, %hi(D_800ED620)
/* 37200 80036600 AE00004C */  sw         $zero, 0x4c($s0)
.L80036604:
/* 37204 80036604 E600002C */  swc1       $f0, 0x2c($s0)
/* 37208 80036608 8E82D620 */  lw         $v0, %lo(D_800ED620)($s4)
/* 3720C 8003660C 54400005 */  bnel       $v0, $zero, .L80036624
/* 37210 80036610 8E040028 */   lw        $a0, 0x28($s0)
/* 37214 80036614 8E040030 */  lw         $a0, 0x30($s0)
/* 37218 80036618 0C0280C1 */  jal        func_800A0304
/* 3721C 8003661C 24050001 */   addiu     $a1, $zero, 1
/* 37220 80036620 8E040028 */  lw         $a0, 0x28($s0)
.L80036624:
/* 37224 80036624 4480A000 */  mtc1       $zero, $f20
/* 37228 80036628 4406A000 */  mfc1       $a2, $f20
/* 3722C 8003662C 4407A000 */  mfc1       $a3, $f20
/* 37230 80036630 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 37234 80036634 8E05002C */   lw        $a1, 0x2c($s0)
/* 37238 80036638 3C01800E */  lui        $at, %hi(D_800DB800)
/* 3723C 8003663C C420B800 */  lwc1       $f0, %lo(D_800DB800)($at)
/* 37240 80036640 3C01800E */  lui        $at, %hi(D_800DB804)
/* 37244 80036644 C422B804 */  lwc1       $f2, %lo(D_800DB804)($at)
/* 37248 80036648 E7B40010 */  swc1       $f20, 0x10($sp)
/* 3724C 8003664C E7B40018 */  swc1       $f20, 0x18($sp)
/* 37250 80036650 E7B4001C */  swc1       $f20, 0x1c($sp)
/* 37254 80036654 E7B40020 */  swc1       $f20, 0x20($sp)
/* 37258 80036658 E7A00014 */  swc1       $f0, 0x14($sp)
/* 3725C 8003665C E7A20024 */  swc1       $f2, 0x24($sp)
/* 37260 80036660 8E040028 */  lw         $a0, 0x28($s0)
/* 37264 80036664 8E050034 */  lw         $a1, 0x34($s0)
/* 37268 80036668 8E060038 */  lw         $a2, 0x38($s0)
/* 3726C 8003666C 0C029ED8 */  jal        animationData_math_func
/* 37270 80036670 8E07003C */   lw        $a3, 0x3c($s0)
/* 37274 80036674 0C02DE51 */  jal        func_800B7944
/* 37278 80036678 02A02021 */   addu      $a0, $s5, $zero
/* 3727C 8003667C 8FBF0040 */  lw         $ra, 0x40($sp)
/* 37280 80036680 8FB5003C */  lw         $s5, 0x3c($sp)
/* 37284 80036684 8FB40038 */  lw         $s4, 0x38($sp)
/* 37288 80036688 8FB30034 */  lw         $s3, 0x34($sp)
/* 3728C 8003668C 8FB20030 */  lw         $s2, 0x30($sp)
/* 37290 80036690 8FB1002C */  lw         $s1, 0x2c($sp)
/* 37294 80036694 8FB00028 */  lw         $s0, 0x28($sp)
/* 37298 80036698 D7B40048 */  ldc1       $f20, 0x48($sp)
/* 3729C 8003669C 03E00008 */  jr         $ra
/* 372A0 800366A0 27BD0050 */   addiu     $sp, $sp, 0x50

glabel cont_left_right
/* 372A4 800366A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 372A8 800366A8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 372AC 800366AC AFB20018 */  sw         $s2, 0x18($sp)
/* 372B0 800366B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 372B4 800366B4 AFB00010 */  sw         $s0, 0x10($sp)
/* 372B8 800366B8 8C920040 */  lw         $s2, 0x40($a0)
/* 372BC 800366BC 8E420000 */  lw         $v0, ($s2)
/* 372C0 800366C0 8C510040 */  lw         $s1, 0x40($v0)
/* 372C4 800366C4 8E26000C */  lw         $a2, 0xc($s1)
/* 372C8 800366C8 10C00008 */  beqz       $a2, .L800366EC
/* 372CC 800366CC 00A08021 */   addu      $s0, $a1, $zero
/* 372D0 800366D0 8CC30078 */  lw         $v1, 0x78($a2)
/* 372D4 800366D4 84640050 */  lh         $a0, 0x50($v1)
/* 372D8 800366D8 8C620054 */  lw         $v0, 0x54($v1)
/* 372DC 800366DC 0040F809 */  jalr       $v0
/* 372E0 800366E0 00C42021 */   addu      $a0, $a2, $a0
/* 372E4 800366E4 0800D9F1 */  j          .L800367C4
/* 372E8 800366E8 8FBF001C */   lw        $ra, 0x1c($sp)
.L800366EC:
/* 372EC 800366EC 0C02DD7A */  jal        widget_control
/* 372F0 800366F0 02002821 */   addu      $a1, $s0, $zero
/* 372F4 800366F4 14400033 */  bnez       $v0, .L800367C4
/* 372F8 800366F8 8FBF001C */   lw        $ra, 0x1c($sp)
/* 372FC 800366FC 92420020 */  lbu        $v0, 0x20($s2)
/* 37300 80036700 14400030 */  bnez       $v0, .L800367C4
/* 37304 80036704 00001021 */   addu      $v0, $zero, $zero
/* 37308 80036708 3C020001 */  lui        $v0, 1
/* 3730C 8003670C 8E05000C */  lw         $a1, 0xc($s0)
/* 37310 80036710 34420200 */  ori        $v0, $v0, 0x200
/* 37314 80036714 00A21024 */  and        $v0, $a1, $v0
/* 37318 80036718 10400013 */  beqz       $v0, .L80036768
/* 3731C 8003671C 3C020002 */   lui       $v0, 2
/* 37320 80036720 8E260008 */  lw         $a2, 8($s1)
/* 37324 80036724 10C00011 */  beqz       $a2, .L8003676C
/* 37328 80036728 34420100 */   ori       $v0, $v0, 0x100
/* 3732C 8003672C 8CC30040 */  lw         $v1, 0x40($a2)
/* 37330 80036730 90620028 */  lbu        $v0, 0x28($v1)
/* 37334 80036734 1440000C */  bnez       $v0, .L80036768
/* 37338 80036738 3C020002 */   lui       $v0, 2
/* 3733C 8003673C 90620020 */  lbu        $v0, 0x20($v1)
/* 37340 80036740 2C420002 */  sltiu      $v0, $v0, 2
/* 37344 80036744 10400008 */  beqz       $v0, .L80036768
/* 37348 80036748 3C020002 */   lui       $v0, 2
/* 3734C 8003674C 8CC30078 */  lw         $v1, 0x78($a2)
/* 37350 80036750 84640068 */  lh         $a0, 0x68($v1)
/* 37354 80036754 8C62006C */  lw         $v0, 0x6c($v1)
/* 37358 80036758 0040F809 */  jalr       $v0
/* 3735C 8003675C 00C42021 */   addu      $a0, $a2, $a0
/* 37360 80036760 0800D9F1 */  j          .L800367C4
/* 37364 80036764 8FBF001C */   lw        $ra, 0x1c($sp)
.L80036768:
/* 37368 80036768 34420100 */  ori        $v0, $v0, 0x100
.L8003676C:
/* 3736C 8003676C 00A21024 */  and        $v0, $a1, $v0
/* 37370 80036770 10400013 */  beqz       $v0, .L800367C0
/* 37374 80036774 00001021 */   addu      $v0, $zero, $zero
/* 37378 80036778 8E250008 */  lw         $a1, 8($s1)
/* 3737C 8003677C 10A00011 */  beqz       $a1, .L800367C4
/* 37380 80036780 8FBF001C */   lw        $ra, 0x1c($sp)
/* 37384 80036784 8CA30040 */  lw         $v1, 0x40($a1)
/* 37388 80036788 90620028 */  lbu        $v0, 0x28($v1)
/* 3738C 8003678C 1440000D */  bnez       $v0, .L800367C4
/* 37390 80036790 00001021 */   addu      $v0, $zero, $zero
/* 37394 80036794 90620020 */  lbu        $v0, 0x20($v1)
/* 37398 80036798 2C420002 */  sltiu      $v0, $v0, 2
/* 3739C 8003679C 10400009 */  beqz       $v0, .L800367C4
/* 373A0 800367A0 00001021 */   addu      $v0, $zero, $zero
/* 373A4 800367A4 8CA30078 */  lw         $v1, 0x78($a1)
/* 373A8 800367A8 84640070 */  lh         $a0, 0x70($v1)
/* 373AC 800367AC 8C620074 */  lw         $v0, 0x74($v1)
/* 373B0 800367B0 0040F809 */  jalr       $v0
/* 373B4 800367B4 00A42021 */   addu      $a0, $a1, $a0
/* 373B8 800367B8 0800D9F1 */  j          .L800367C4
/* 373BC 800367BC 8FBF001C */   lw        $ra, 0x1c($sp)
.L800367C0:
/* 373C0 800367C0 8FBF001C */  lw         $ra, 0x1c($sp)
.L800367C4:
/* 373C4 800367C4 8FB20018 */  lw         $s2, 0x18($sp)
/* 373C8 800367C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 373CC 800367CC 8FB00010 */  lw         $s0, 0x10($sp)
/* 373D0 800367D0 03E00008 */  jr         $ra
/* 373D4 800367D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret12_800367d8
/* 373D8 800367D8 03E00008 */  jr         $ra
/* 373DC 800367DC 2402000C */   addiu     $v0, $zero, 0xc

glabel bigAssOpenCallback_1
/* 373E0 800367E0 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 373E4 800367E4 AFBE0048 */  sw         $fp, 0x48($sp)
/* 373E8 800367E8 0080F021 */  addu       $fp, $a0, $zero
/* 373EC 800367EC AFBF004C */  sw         $ra, 0x4c($sp)
/* 373F0 800367F0 AFB70044 */  sw         $s7, 0x44($sp)
/* 373F4 800367F4 AFB60040 */  sw         $s6, 0x40($sp)
/* 373F8 800367F8 AFB5003C */  sw         $s5, 0x3c($sp)
/* 373FC 800367FC AFB40038 */  sw         $s4, 0x38($sp)
/* 37400 80036800 AFB30034 */  sw         $s3, 0x34($sp)
/* 37404 80036804 AFB20030 */  sw         $s2, 0x30($sp)
/* 37408 80036808 AFB1002C */  sw         $s1, 0x2c($sp)
/* 3740C 8003680C AFB00028 */  sw         $s0, 0x28($sp)
/* 37410 80036810 F7B40050 */  sdc1       $f20, 0x50($sp)
/* 37414 80036814 8FD00040 */  lw         $s0, 0x40($fp)
/* 37418 80036818 3C02800E */  lui        $v0, %hi(someCase_1)
/* 3741C 8003681C 8E03004C */  lw         $v1, 0x4c($s0)
/* 37420 80036820 14600067 */  bnez       $v1, .L800369C0
/* 37424 80036824 24577D6C */   addiu     $s7, $v0, %lo(someCase_1)
/* 37428 80036828 00008821 */  addu       $s1, $zero, $zero
/* 3742C 8003682C 0000A821 */  addu       $s5, $zero, $zero
/* 37430 80036830 0000B021 */  addu       $s6, $zero, $zero
/* 37434 80036834 0000A021 */  addu       $s4, $zero, $zero
/* 37438 80036838 00009821 */  addu       $s3, $zero, $zero
/* 3743C 8003683C 24030001 */  addiu      $v1, $zero, 1
/* 37440 80036840 8E020028 */  lw         $v0, 0x28($s0)
/* 37444 80036844 92040020 */  lbu        $a0, 0x20($s0)
/* 37448 80036848 10830012 */  beq        $a0, $v1, .L80036894
/* 3744C 8003684C 945201F8 */   lhu       $s2, 0x1f8($v0)
/* 37450 80036850 28820002 */  slti       $v0, $a0, 2
/* 37454 80036854 10400005 */  beqz       $v0, .L8003686C
/* 37458 80036858 24020002 */   addiu     $v0, $zero, 2
/* 3745C 8003685C 10800007 */  beqz       $a0, .L8003687C
/* 37460 80036860 3C04800E */   lui       $a0, %hi(D_800DB8E0)
/* 37464 80036864 0800DA30 */  j          .L800368C0
/* 37468 80036868 2484B8E0 */   addiu     $a0, $a0, %lo(D_800DB8E0)
.L8003686C:
/* 3746C 8003686C 1082000F */  beq        $a0, $v0, .L800368AC
/* 37470 80036870 3C04800E */   lui       $a0, %hi(D_800DB8E0)
/* 37474 80036874 0800DA30 */  j          .L800368C0
/* 37478 80036878 2484B8E0 */   addiu     $a0, $a0, %lo(D_800DB8E0)
.L8003687C:
/* 3747C 8003687C 24110008 */  addiu      $s1, $zero, 8
/* 37480 80036880 24150024 */  addiu      $s5, $zero, 0x24
/* 37484 80036884 24160140 */  addiu      $s6, $zero, 0x140
/* 37488 80036888 24140140 */  addiu      $s4, $zero, 0x140
/* 3748C 8003688C 0800DA33 */  j          .L800368CC
/* 37490 80036890 24130140 */   addiu     $s3, $zero, 0x140
.L80036894:
/* 37494 80036894 24110024 */  addiu      $s1, $zero, 0x24
/* 37498 80036898 24150037 */  addiu      $s5, $zero, 0x37
/* 3749C 8003689C 241600A0 */  addiu      $s6, $zero, 0xa0
/* 374A0 800368A0 241400A0 */  addiu      $s4, $zero, 0xa0
/* 374A4 800368A4 0800DA33 */  j          .L800368CC
/* 374A8 800368A8 24130140 */   addiu     $s3, $zero, 0x140
.L800368AC:
/* 374AC 800368AC 24110006 */  addiu      $s1, $zero, 6
/* 374B0 800368B0 24150023 */  addiu      $s5, $zero, 0x23
/* 374B4 800368B4 2414FFFB */  addiu      $s4, $zero, -5
/* 374B8 800368B8 0800DA33 */  j          .L800368CC
/* 374BC 800368BC 24130140 */   addiu     $s3, $zero, 0x140
.L800368C0:
/* 374C0 800368C0 3C05800E */  lui        $a1, %hi(D_800DB8F4)
/* 374C4 800368C4 0C025F2D */  jal        manualCrash
/* 374C8 800368C8 24A5B8F4 */   addiu     $a1, $a1, %lo(D_800DB8F4)
.L800368CC:
/* 374CC 800368CC 0232102B */  sltu       $v0, $s1, $s2
/* 374D0 800368D0 A6F60018 */  sh         $s6, 0x18($s7)
/* 374D4 800368D4 10400022 */  beqz       $v0, .L80036960
/* 374D8 800368D8 A6F4001A */   sh        $s4, 0x1a($s7)
/* 374DC 800368DC 02B11023 */  subu       $v0, $s5, $s1
/* 374E0 800368E0 44823000 */  mtc1       $v0, $f6
/* 374E4 800368E4 468031A0 */  cvt.s.w    $f6, $f6
/* 374E8 800368E8 00161823 */  negu       $v1, $s6
/* 374EC 800368EC 44830000 */  mtc1       $v1, $f0
/* 374F0 800368F0 46800020 */  cvt.s.w    $f0, $f0
/* 374F4 800368F4 46060003 */  div.s      $f0, $f0, $f6
/* 374F8 800368F8 02511023 */  subu       $v0, $s2, $s1
/* 374FC 800368FC 44822000 */  mtc1       $v0, $f4
/* 37500 80036900 46802120 */  cvt.s.w    $f4, $f4
/* 37504 80036904 46040002 */  mul.s      $f0, $f0, $f4
/* 37508 80036908 02741023 */  subu       $v0, $s3, $s4
/* 3750C 8003690C 44821000 */  mtc1       $v0, $f2
/* 37510 80036910 468010A0 */  cvt.s.w    $f2, $f2
/* 37514 80036914 46061083 */  div.s      $f2, $f2, $f6
/* 37518 80036918 8E030030 */  lw         $v1, 0x30($s0)
/* 3751C 8003691C 4600018D */  trunc.w.s  $f6, $f0
/* 37520 80036920 44023000 */  mfc1       $v0, $f6
/* 37524 80036924 8C64001C */  lw         $a0, 0x1c($v1)
/* 37528 80036928 46041082 */  mul.s      $f2, $f2, $f4
/* 3752C 8003692C 8C830004 */  lw         $v1, 4($a0)
/* 37530 80036930 02C21021 */  addu       $v0, $s6, $v0
/* 37534 80036934 A6E20018 */  sh         $v0, 0x18($s7)
/* 37538 80036938 8C640020 */  lw         $a0, 0x20($v1)
/* 3753C 8003693C 4600100D */  trunc.w.s  $f0, $f2
/* 37540 80036940 44020000 */  mfc1       $v0, $f0
/* 37544 80036944 8C83000C */  lw         $v1, 0xc($a0)
/* 37548 80036948 02821021 */  addu       $v0, $s4, $v0
/* 3754C 8003694C 0243182A */  slt        $v1, $s2, $v1
/* 37550 80036950 14600003 */  bnez       $v1, .L80036960
/* 37554 80036954 A6E2001A */   sh        $v0, 0x1a($s7)
/* 37558 80036958 24020002 */  addiu      $v0, $zero, 2
/* 3755C 8003695C A3C20070 */  sb         $v0, 0x70($fp)
.L80036960:
/* 37560 80036960 8E040030 */  lw         $a0, 0x30($s0)
/* 37564 80036964 0C0280C1 */  jal        func_800A0304
/* 37568 80036968 24050001 */   addiu     $a1, $zero, 1
/* 3756C 8003696C 8E040028 */  lw         $a0, 0x28($s0)
/* 37570 80036970 4480A000 */  mtc1       $zero, $f20
/* 37574 80036974 4406A000 */  mfc1       $a2, $f20
/* 37578 80036978 4407A000 */  mfc1       $a3, $f20
/* 3757C 8003697C 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 37580 80036980 8E05002C */   lw        $a1, 0x2c($s0)
/* 37584 80036984 3C01800E */  lui        $at, %hi(D_800DB904)
/* 37588 80036988 C420B904 */  lwc1       $f0, %lo(D_800DB904)($at)
/* 3758C 8003698C 3C01800E */  lui        $at, %hi(D_800DB908)
/* 37590 80036990 C422B908 */  lwc1       $f2, %lo(D_800DB908)($at)
/* 37594 80036994 E7B40010 */  swc1       $f20, 0x10($sp)
/* 37598 80036998 E7B40018 */  swc1       $f20, 0x18($sp)
/* 3759C 8003699C E7B4001C */  swc1       $f20, 0x1c($sp)
/* 375A0 800369A0 E7B40020 */  swc1       $f20, 0x20($sp)
/* 375A4 800369A4 E7A00014 */  swc1       $f0, 0x14($sp)
/* 375A8 800369A8 E7A20024 */  swc1       $f2, 0x24($sp)
/* 375AC 800369AC 8E040028 */  lw         $a0, 0x28($s0)
/* 375B0 800369B0 8E050034 */  lw         $a1, 0x34($s0)
/* 375B4 800369B4 8E060038 */  lw         $a2, 0x38($s0)
/* 375B8 800369B8 0C029ED8 */  jal        animationData_math_func
/* 375BC 800369BC 8E07003C */   lw        $a3, 0x3c($s0)
.L800369C0:
/* 375C0 800369C0 93C20070 */  lbu        $v0, 0x70($fp)
/* 375C4 800369C4 8FBF004C */  lw         $ra, 0x4c($sp)
/* 375C8 800369C8 8FBE0048 */  lw         $fp, 0x48($sp)
/* 375CC 800369CC 8FB70044 */  lw         $s7, 0x44($sp)
/* 375D0 800369D0 8FB60040 */  lw         $s6, 0x40($sp)
/* 375D4 800369D4 8FB5003C */  lw         $s5, 0x3c($sp)
/* 375D8 800369D8 8FB40038 */  lw         $s4, 0x38($sp)
/* 375DC 800369DC 8FB30034 */  lw         $s3, 0x34($sp)
/* 375E0 800369E0 8FB20030 */  lw         $s2, 0x30($sp)
/* 375E4 800369E4 8FB1002C */  lw         $s1, 0x2c($sp)
/* 375E8 800369E8 8FB00028 */  lw         $s0, 0x28($sp)
/* 375EC 800369EC D7B40050 */  ldc1       $f20, 0x50($sp)
/* 375F0 800369F0 03E00008 */  jr         $ra
/* 375F4 800369F4 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800369F8
/* 375F8 800369F8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 375FC 800369FC AFB20018 */  sw         $s2, 0x18($sp)
/* 37600 80036A00 00809021 */  addu       $s2, $a0, $zero
/* 37604 80036A04 AFBF001C */  sw         $ra, 0x1c($sp)
/* 37608 80036A08 AFB10014 */  sw         $s1, 0x14($sp)
/* 3760C 80036A0C AFB00010 */  sw         $s0, 0x10($sp)
/* 37610 80036A10 8E510040 */  lw         $s1, 0x40($s2)
/* 37614 80036A14 3C02800E */  lui        $v0, %hi(someCase_1)
/* 37618 80036A18 8E23004C */  lw         $v1, 0x4c($s1)
/* 3761C 80036A1C 1460002D */  bnez       $v1, .L80036AD4
/* 37620 80036A20 24447D6C */   addiu     $a0, $v0, %lo(someCase_1)
/* 37624 80036A24 24020140 */  addiu      $v0, $zero, 0x140
/* 37628 80036A28 8E230004 */  lw         $v1, 4($s1)
/* 3762C 80036A2C 3C05800F */  lui        $a1, %hi(D_800ED540)
/* 37630 80036A30 A4800018 */  sh         $zero, 0x18($a0)
/* 37634 80036A34 A482001A */  sh         $v0, 0x1a($a0)
/* 37638 80036A38 8C620088 */  lw         $v0, 0x88($v1)
/* 3763C 80036A3C 8CA4D540 */  lw         $a0, %lo(D_800ED540)($a1)
/* 37640 80036A40 10800004 */  beqz       $a0, .L80036A54
/* 37644 80036A44 9050005B */   lbu       $s0, 0x5b($v0)
/* 37648 80036A48 00008021 */  addu       $s0, $zero, $zero
/* 3764C 80036A4C 0800DA9F */  j          .L80036A7C
/* 37650 80036A50 ACA0D540 */   sw        $zero, -0x2ac0($a1)
.L80036A54:
/* 37654 80036A54 2E0200C3 */  sltiu      $v0, $s0, 0xc3
/* 37658 80036A58 10400003 */  beqz       $v0, .L80036A68
/* 3765C 80036A5C 2602003C */   addiu     $v0, $s0, 0x3c
/* 37660 80036A60 0800DA9F */  j          .L80036A7C
/* 37664 80036A64 305000FF */   andi      $s0, $v0, 0xff
.L80036A68:
/* 37668 80036A68 241000FF */  addiu      $s0, $zero, 0xff
/* 3766C 80036A6C 24020002 */  addiu      $v0, $zero, 2
/* 37670 80036A70 24030001 */  addiu      $v1, $zero, 1
/* 37674 80036A74 A2420070 */  sb         $v0, 0x70($s2)
/* 37678 80036A78 ACA3D540 */  sw         $v1, -0x2ac0($a1)
.L80036A7C:
/* 3767C 80036A7C 8E220004 */  lw         $v0, 4($s1)
/* 37680 80036A80 8C440088 */  lw         $a0, 0x88($v0)
/* 37684 80036A84 0C02F216 */  jal        widget_fade
/* 37688 80036A88 02002821 */   addu      $a1, $s0, $zero
/* 3768C 80036A8C 8E220004 */  lw         $v0, 4($s1)
/* 37690 80036A90 8C450088 */  lw         $a1, 0x88($v0)
/* 37694 80036A94 8CA30078 */  lw         $v1, 0x78($a1)
/* 37698 80036A98 84640028 */  lh         $a0, 0x28($v1)
/* 3769C 80036A9C 8C62002C */  lw         $v0, 0x2c($v1)
/* 376A0 80036AA0 0040F809 */  jalr       $v0
/* 376A4 80036AA4 00A42021 */   addu      $a0, $a1, $a0
/* 376A8 80036AA8 8E230004 */  lw         $v1, 4($s1)
/* 376AC 80036AAC 8C640090 */  lw         $a0, 0x90($v1)
/* 376B0 80036AB0 0C02F216 */  jal        widget_fade
/* 376B4 80036AB4 02002821 */   addu      $a1, $s0, $zero
/* 376B8 80036AB8 8E220004 */  lw         $v0, 4($s1)
/* 376BC 80036ABC 8C450090 */  lw         $a1, 0x90($v0)
/* 376C0 80036AC0 8CA30078 */  lw         $v1, 0x78($a1)
/* 376C4 80036AC4 84640028 */  lh         $a0, 0x28($v1)
/* 376C8 80036AC8 8C62002C */  lw         $v0, 0x2c($v1)
/* 376CC 80036ACC 0040F809 */  jalr       $v0
/* 376D0 80036AD0 00A42021 */   addu      $a0, $a1, $a0
.L80036AD4:
/* 376D4 80036AD4 92420070 */  lbu        $v0, 0x70($s2)
/* 376D8 80036AD8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 376DC 80036ADC 8FB20018 */  lw         $s2, 0x18($sp)
/* 376E0 80036AE0 8FB10014 */  lw         $s1, 0x14($sp)
/* 376E4 80036AE4 8FB00010 */  lw         $s0, 0x10($sp)
/* 376E8 80036AE8 03E00008 */  jr         $ra
/* 376EC 80036AEC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel bigAssOpenCallback
/* 376F0 80036AF0 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 376F4 80036AF4 AFBE0048 */  sw         $fp, 0x48($sp)
/* 376F8 80036AF8 0080F021 */  addu       $fp, $a0, $zero
/* 376FC 80036AFC AFBF004C */  sw         $ra, 0x4c($sp)
/* 37700 80036B00 AFB70044 */  sw         $s7, 0x44($sp)
/* 37704 80036B04 AFB60040 */  sw         $s6, 0x40($sp)
/* 37708 80036B08 AFB5003C */  sw         $s5, 0x3c($sp)
/* 3770C 80036B0C AFB40038 */  sw         $s4, 0x38($sp)
/* 37710 80036B10 AFB30034 */  sw         $s3, 0x34($sp)
/* 37714 80036B14 AFB20030 */  sw         $s2, 0x30($sp)
/* 37718 80036B18 AFB1002C */  sw         $s1, 0x2c($sp)
/* 3771C 80036B1C AFB00028 */  sw         $s0, 0x28($sp)
/* 37720 80036B20 F7B40050 */  sdc1       $f20, 0x50($sp)
/* 37724 80036B24 8FD00040 */  lw         $s0, 0x40($fp)
/* 37728 80036B28 3C02800E */  lui        $v0, %hi(someCase_1)
/* 3772C 80036B2C 8E03004C */  lw         $v1, 0x4c($s0)
/* 37730 80036B30 1460007C */  bnez       $v1, .L80036D24
/* 37734 80036B34 24517D6C */   addiu     $s1, $v0, %lo(someCase_1)
/* 37738 80036B38 00009821 */  addu       $s3, $zero, $zero
/* 3773C 80036B3C 0000A821 */  addu       $s5, $zero, $zero
/* 37740 80036B40 0000B821 */  addu       $s7, $zero, $zero
/* 37744 80036B44 0000A021 */  addu       $s4, $zero, $zero
/* 37748 80036B48 0000B021 */  addu       $s6, $zero, $zero
/* 3774C 80036B4C 24030001 */  addiu      $v1, $zero, 1
/* 37750 80036B50 8E020028 */  lw         $v0, 0x28($s0)
/* 37754 80036B54 92040020 */  lbu        $a0, 0x20($s0)
/* 37758 80036B58 10830012 */  beq        $a0, $v1, .L80036BA4
/* 3775C 80036B5C 945201F8 */   lhu       $s2, 0x1f8($v0)
/* 37760 80036B60 28820002 */  slti       $v0, $a0, 2
/* 37764 80036B64 10400005 */  beqz       $v0, .L80036B7C
/* 37768 80036B68 24020002 */   addiu     $v0, $zero, 2
/* 3776C 80036B6C 10800007 */  beqz       $a0, .L80036B8C
/* 37770 80036B70 3C04800E */   lui       $a0, %hi(D_800DB8E0)
/* 37774 80036B74 0800DAF3 */  j          .L80036BCC
/* 37778 80036B78 2484B8E0 */   addiu     $a0, $a0, %lo(D_800DB8E0)
.L80036B7C:
/* 3777C 80036B7C 1082000F */  beq        $a0, $v0, .L80036BBC
/* 37780 80036B80 3C04800E */   lui       $a0, %hi(D_800DB8E0)
/* 37784 80036B84 0800DAF3 */  j          .L80036BCC
/* 37788 80036B88 2484B8E0 */   addiu     $a0, $a0, %lo(D_800DB8E0)
.L80036B8C:
/* 3778C 80036B8C 24130001 */  addiu      $s3, $zero, 1
/* 37790 80036B90 2415001F */  addiu      $s5, $zero, 0x1f
/* 37794 80036B94 24170140 */  addiu      $s7, $zero, 0x140
/* 37798 80036B98 24140140 */  addiu      $s4, $zero, 0x140
/* 3779C 80036B9C 0800DAF6 */  j          .L80036BD8
/* 377A0 80036BA0 24160140 */   addiu     $s6, $zero, 0x140
.L80036BA4:
/* 377A4 80036BA4 24130001 */  addiu      $s3, $zero, 1
/* 377A8 80036BA8 2415000E */  addiu      $s5, $zero, 0xe
/* 377AC 80036BAC 241700A0 */  addiu      $s7, $zero, 0xa0
/* 377B0 80036BB0 24140140 */  addiu      $s4, $zero, 0x140
/* 377B4 80036BB4 0800DAF6 */  j          .L80036BD8
/* 377B8 80036BB8 241600A0 */   addiu     $s6, $zero, 0xa0
.L80036BBC:
/* 377BC 80036BBC 24130002 */  addiu      $s3, $zero, 2
/* 377C0 80036BC0 24150020 */  addiu      $s5, $zero, 0x20
/* 377C4 80036BC4 0800DAF6 */  j          .L80036BD8
/* 377C8 80036BC8 24140140 */   addiu     $s4, $zero, 0x140
.L80036BCC:
/* 377CC 80036BCC 3C05800E */  lui        $a1, %hi(D_800DB8F4)
/* 377D0 80036BD0 0C025F2D */  jal        manualCrash
/* 377D4 80036BD4 24A5B8F4 */   addiu     $a1, $a1, %lo(D_800DB8F4)
.L80036BD8:
/* 377D8 80036BD8 0272102B */  sltu       $v0, $s3, $s2
/* 377DC 80036BDC A6200018 */  sh         $zero, 0x18($s1)
/* 377E0 80036BE0 10400038 */  beqz       $v0, .L80036CC4
/* 377E4 80036BE4 A634001A */   sh        $s4, 0x1a($s1)
/* 377E8 80036BE8 02B31023 */  subu       $v0, $s5, $s3
/* 377EC 80036BEC 44823000 */  mtc1       $v0, $f6
/* 377F0 80036BF0 468031A0 */  cvt.s.w    $f6, $f6
/* 377F4 80036BF4 44971000 */  mtc1       $s7, $f2
/* 377F8 80036BF8 468010A0 */  cvt.s.w    $f2, $f2
/* 377FC 80036BFC 02D41823 */  subu       $v1, $s6, $s4
/* 37800 80036C00 46061083 */  div.s      $f2, $f2, $f6
/* 37804 80036C04 02531023 */  subu       $v0, $s2, $s3
/* 37808 80036C08 44822000 */  mtc1       $v0, $f4
/* 3780C 80036C0C 46802120 */  cvt.s.w    $f4, $f4
/* 37810 80036C10 46041082 */  mul.s      $f2, $f2, $f4
/* 37814 80036C14 44830000 */  mtc1       $v1, $f0
/* 37818 80036C18 46800020 */  cvt.s.w    $f0, $f0
/* 3781C 80036C1C 8E020030 */  lw         $v0, 0x30($s0)
/* 37820 80036C20 46060003 */  div.s      $f0, $f0, $f6
/* 37824 80036C24 8C43001C */  lw         $v1, 0x1c($v0)
/* 37828 80036C28 46040002 */  mul.s      $f0, $f0, $f4
/* 3782C 80036C2C 8C650004 */  lw         $a1, 4($v1)
/* 37830 80036C30 8CA40020 */  lw         $a0, 0x20($a1)
/* 37834 80036C34 4600110D */  trunc.w.s  $f4, $f2
/* 37838 80036C38 44022000 */  mfc1       $v0, $f4
/* 3783C 80036C3C A6220018 */  sh         $v0, 0x18($s1)
/* 37840 80036C40 4600008D */  trunc.w.s  $f2, $f0
/* 37844 80036C44 44021000 */  mfc1       $v0, $f2
/* 37848 80036C48 8C83000C */  lw         $v1, 0xc($a0)
/* 3784C 80036C4C 02821021 */  addu       $v0, $s4, $v0
/* 37850 80036C50 0243182A */  slt        $v1, $s2, $v1
/* 37854 80036C54 1460001B */  bnez       $v1, .L80036CC4
/* 37858 80036C58 A622001A */   sh        $v0, 0x1a($s1)
/* 3785C 80036C5C 3C03800E */  lui        $v1, %hi(screenFadeMode_switch)
/* 37860 80036C60 906268E8 */  lbu        $v0, %lo(screenFadeMode_switch)($v1)
/* 37864 80036C64 2442FFFA */  addiu      $v0, $v0, -6
/* 37868 80036C68 2C420002 */  sltiu      $v0, $v0, 2
/* 3786C 80036C6C 10400004 */  beqz       $v0, .L80036C80
/* 37870 80036C70 240200FF */   addiu     $v0, $zero, 0xff
/* 37874 80036C74 A2220016 */  sb         $v0, 0x16($s1)
/* 37878 80036C78 A2220015 */  sb         $v0, 0x15($s1)
/* 3787C 80036C7C A2220014 */  sb         $v0, 0x14($s1)
.L80036C80:
/* 37880 80036C80 92230014 */  lbu        $v1, 0x14($s1)
/* 37884 80036C84 240400FF */  addiu      $a0, $zero, 0xff
/* 37888 80036C88 306200FF */  andi       $v0, $v1, 0xff
/* 3788C 80036C8C 14440004 */  bne        $v0, $a0, .L80036CA0
/* 37890 80036C90 2C4200F5 */   sltiu     $v0, $v0, 0xf5
/* 37894 80036C94 24020006 */  addiu      $v0, $zero, 6
/* 37898 80036C98 0800DB49 */  j          .L80036D24
/* 3789C 80036C9C A3C20070 */   sb        $v0, 0x70($fp)
.L80036CA0:
/* 378A0 80036CA0 10400003 */  beqz       $v0, .L80036CB0
/* 378A4 80036CA4 2462000A */   addiu     $v0, $v1, 0xa
/* 378A8 80036CA8 0800DB2D */  j          .L80036CB4
/* 378AC 80036CAC A2220014 */   sb        $v0, 0x14($s1)
.L80036CB0:
/* 378B0 80036CB0 A2240014 */  sb         $a0, 0x14($s1)
.L80036CB4:
/* 378B4 80036CB4 92220014 */  lbu        $v0, 0x14($s1)
/* 378B8 80036CB8 A2220015 */  sb         $v0, 0x15($s1)
/* 378BC 80036CBC 0800DB49 */  j          .L80036D24
/* 378C0 80036CC0 A2220016 */   sb        $v0, 0x16($s1)
.L80036CC4:
/* 378C4 80036CC4 8E040030 */  lw         $a0, 0x30($s0)
/* 378C8 80036CC8 0C0280C1 */  jal        func_800A0304
/* 378CC 80036CCC 24050001 */   addiu     $a1, $zero, 1
/* 378D0 80036CD0 8E040028 */  lw         $a0, 0x28($s0)
/* 378D4 80036CD4 4480A000 */  mtc1       $zero, $f20
/* 378D8 80036CD8 4406A000 */  mfc1       $a2, $f20
/* 378DC 80036CDC 4407A000 */  mfc1       $a3, $f20
/* 378E0 80036CE0 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 378E4 80036CE4 8E05002C */   lw        $a1, 0x2c($s0)
/* 378E8 80036CE8 3C01800E */  lui        $at, %hi(D_800DB90C)
/* 378EC 80036CEC C420B90C */  lwc1       $f0, %lo(D_800DB90C)($at)
/* 378F0 80036CF0 3C01800E */  lui        $at, %hi(D_800DB910)
/* 378F4 80036CF4 C422B910 */  lwc1       $f2, %lo(D_800DB910)($at)
/* 378F8 80036CF8 E7B40010 */  swc1       $f20, 0x10($sp)
/* 378FC 80036CFC E7B40018 */  swc1       $f20, 0x18($sp)
/* 37900 80036D00 E7B4001C */  swc1       $f20, 0x1c($sp)
/* 37904 80036D04 E7B40020 */  swc1       $f20, 0x20($sp)
/* 37908 80036D08 E7A00014 */  swc1       $f0, 0x14($sp)
/* 3790C 80036D0C E7A20024 */  swc1       $f2, 0x24($sp)
/* 37910 80036D10 8E040028 */  lw         $a0, 0x28($s0)
/* 37914 80036D14 8E050034 */  lw         $a1, 0x34($s0)
/* 37918 80036D18 8E060038 */  lw         $a2, 0x38($s0)
/* 3791C 80036D1C 0C029ED8 */  jal        animationData_math_func
/* 37920 80036D20 8E07003C */   lw        $a3, 0x3c($s0)
.L80036D24:
/* 37924 80036D24 93C20070 */  lbu        $v0, 0x70($fp)
/* 37928 80036D28 8FBF004C */  lw         $ra, 0x4c($sp)
/* 3792C 80036D2C 8FBE0048 */  lw         $fp, 0x48($sp)
/* 37930 80036D30 8FB70044 */  lw         $s7, 0x44($sp)
/* 37934 80036D34 8FB60040 */  lw         $s6, 0x40($sp)
/* 37938 80036D38 8FB5003C */  lw         $s5, 0x3c($sp)
/* 3793C 80036D3C 8FB40038 */  lw         $s4, 0x38($sp)
/* 37940 80036D40 8FB30034 */  lw         $s3, 0x34($sp)
/* 37944 80036D44 8FB20030 */  lw         $s2, 0x30($sp)
/* 37948 80036D48 8FB1002C */  lw         $s1, 0x2c($sp)
/* 3794C 80036D4C 8FB00028 */  lw         $s0, 0x28($sp)
/* 37950 80036D50 D7B40050 */  ldc1       $f20, 0x50($sp)
/* 37954 80036D54 03E00008 */  jr         $ra
/* 37958 80036D58 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_80036D5C
/* 3795C 80036D5C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 37960 80036D60 AFB10014 */  sw         $s1, 0x14($sp)
/* 37964 80036D64 00808821 */  addu       $s1, $a0, $zero
/* 37968 80036D68 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3796C 80036D6C AFB00010 */  sw         $s0, 0x10($sp)
/* 37970 80036D70 8E300040 */  lw         $s0, 0x40($s1)
/* 37974 80036D74 8E02004C */  lw         $v0, 0x4c($s0)
/* 37978 80036D78 54400017 */  bnel       $v0, $zero, .L80036DD8
/* 3797C 80036D7C 92220070 */   lbu       $v0, 0x70($s1)
/* 37980 80036D80 8E020004 */  lw         $v0, 4($s0)
/* 37984 80036D84 8C430088 */  lw         $v1, 0x88($v0)
/* 37988 80036D88 9065005B */  lbu        $a1, 0x5b($v1)
/* 3798C 80036D8C 2CA2003D */  sltiu      $v0, $a1, 0x3d
/* 37990 80036D90 54400004 */  bnel       $v0, $zero, .L80036DA4
/* 37994 80036D94 00002821 */   addu      $a1, $zero, $zero
/* 37998 80036D98 24A2FFC4 */  addiu      $v0, $a1, -0x3c
/* 3799C 80036D9C 0800DB6B */  j          .L80036DAC
/* 379A0 80036DA0 304500FF */   andi      $a1, $v0, 0xff
.L80036DA4:
/* 379A4 80036DA4 24020006 */  addiu      $v0, $zero, 6
/* 379A8 80036DA8 A2220070 */  sb         $v0, 0x70($s1)
.L80036DAC:
/* 379AC 80036DAC 8E020004 */  lw         $v0, 4($s0)
/* 379B0 80036DB0 0C02F216 */  jal        widget_fade
/* 379B4 80036DB4 8C440088 */   lw        $a0, 0x88($v0)
/* 379B8 80036DB8 8E020004 */  lw         $v0, 4($s0)
/* 379BC 80036DBC 8C450088 */  lw         $a1, 0x88($v0)
/* 379C0 80036DC0 8CA30078 */  lw         $v1, 0x78($a1)
/* 379C4 80036DC4 84640028 */  lh         $a0, 0x28($v1)
/* 379C8 80036DC8 8C62002C */  lw         $v0, 0x2c($v1)
/* 379CC 80036DCC 0040F809 */  jalr       $v0
/* 379D0 80036DD0 00A42021 */   addu      $a0, $a1, $a0
/* 379D4 80036DD4 92220070 */  lbu        $v0, 0x70($s1)
.L80036DD8:
/* 379D8 80036DD8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 379DC 80036DDC 8FB10014 */  lw         $s1, 0x14($sp)
/* 379E0 80036DE0 8FB00010 */  lw         $s0, 0x10($sp)
/* 379E4 80036DE4 03E00008 */  jr         $ra
/* 379E8 80036DE8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel bigAssMenu_LZFunc
/* 379EC 80036DEC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 379F0 80036DF0 3C02800E */  lui        $v0, %hi(someCase_1)
/* 379F4 80036DF4 90447D6C */  lbu        $a0, %lo(someCase_1)($v0)
/* 379F8 80036DF8 24030007 */  addiu      $v1, $zero, 7
/* 379FC 80036DFC AFBF001C */  sw         $ra, 0x1c($sp)
/* 37A00 80036E00 10830004 */  beq        $a0, $v1, .L80036E14
/* 37A04 80036E04 AFB00018 */   sw        $s0, 0x18($sp)
/* 37A08 80036E08 24020003 */  addiu      $v0, $zero, 3
/* 37A0C 80036E0C 14820054 */  bne        $a0, $v0, .L80036F60
/* 37A10 80036E10 00001021 */   addu      $v0, $zero, $zero
.L80036E14:
/* 37A14 80036E14 8CB00040 */  lw         $s0, 0x40($a1)
/* 37A18 80036E18 92030020 */  lbu        $v1, 0x20($s0)
/* 37A1C 80036E1C 10600050 */  beqz       $v1, .L80036F60
/* 37A20 80036E20 00001021 */   addu      $v0, $zero, $zero
/* 37A24 80036E24 8E02004C */  lw         $v0, 0x4c($s0)
/* 37A28 80036E28 1440004D */  bnez       $v0, .L80036F60
/* 37A2C 80036E2C 00001021 */   addu      $v0, $zero, $zero
/* 37A30 80036E30 24020001 */  addiu      $v0, $zero, 1
/* 37A34 80036E34 54620006 */  bnel       $v1, $v0, .L80036E50
/* 37A38 80036E38 92020020 */   lbu       $v0, 0x20($s0)
/* 37A3C 80036E3C 0C00DEBC */  jal        func_80037AF0
/* 37A40 80036E40 8E040004 */   lw        $a0, 4($s0)
/* 37A44 80036E44 14400046 */  bnez       $v0, .L80036F60
/* 37A48 80036E48 00001021 */   addu      $v0, $zero, $zero
/* 37A4C 80036E4C 92020020 */  lbu        $v0, 0x20($s0)
.L80036E50:
/* 37A50 80036E50 14400007 */  bnez       $v0, .L80036E70
/* 37A54 80036E54 00402821 */   addu      $a1, $v0, $zero
/* 37A58 80036E58 8E020000 */  lw         $v0, ($s0)
/* 37A5C 80036E5C 8C430040 */  lw         $v1, 0x40($v0)
/* 37A60 80036E60 8C640010 */  lw         $a0, 0x10($v1)
/* 37A64 80036E64 8C620000 */  lw         $v0, ($v1)
/* 37A68 80036E68 1482003D */  bne        $a0, $v0, .L80036F60
/* 37A6C 80036E6C 00001021 */   addu      $v0, $zero, $zero
.L80036E70:
/* 37A70 80036E70 24A2FFFF */  addiu      $v0, $a1, -1
/* 37A74 80036E74 24030140 */  addiu      $v1, $zero, 0x140
/* 37A78 80036E78 3C04800F */  lui        $a0, %hi(pause_menu_borg8)
/* 37A7C 80036E7C A2020020 */  sb         $v0, 0x20($s0)
/* 37A80 80036E80 304200FF */  andi       $v0, $v0, 0xff
/* 37A84 80036E84 2484D520 */  addiu      $a0, $a0, %lo(pause_menu_borg8)
/* 37A88 80036E88 00021040 */  sll        $v0, $v0, 1
/* 37A8C 80036E8C 00441021 */  addu       $v0, $v0, $a0
/* 37A90 80036E90 A6030024 */  sh         $v1, 0x24($s0)
/* 37A94 80036E94 0C0290E2 */  jal        get_borg_8
/* 37A98 80036E98 94440000 */   lhu       $a0, ($v0)
/* 37A9C 80036E9C 00402821 */  addu       $a1, $v0, $zero
/* 37AA0 80036EA0 8E04001C */  lw         $a0, 0x1c($s0)
/* 37AA4 80036EA4 0C02DD50 */  jal        widget_replace_borg8
/* 37AA8 80036EA8 00003021 */   addu      $a2, $zero, $zero
/* 37AAC 80036EAC 2405FEC0 */  addiu      $a1, $zero, -0x140
/* 37AB0 80036EB0 8E04001C */  lw         $a0, 0x1c($s0)
/* 37AB4 80036EB4 0C02DD3F */  jal        set_widget_coords
/* 37AB8 80036EB8 00003021 */   addu      $a2, $zero, $zero
/* 37ABC 80036EBC 86040024 */  lh         $a0, 0x24($s0)
/* 37AC0 80036EC0 86020022 */  lh         $v0, 0x22($s0)
/* 37AC4 80036EC4 86050026 */  lh         $a1, 0x26($s0)
/* 37AC8 80036EC8 00822023 */  subu       $a0, $a0, $v0
/* 37ACC 80036ECC 0085001A */  div        $zero, $a0, $a1
/* 37AD0 80036ED0 3C03800F */  lui        $v1, %hi(scroll_floats)
/* 37AD4 80036ED4 2463D528 */  addiu      $v1, $v1, %lo(scroll_floats)
/* 37AD8 80036ED8 92020020 */  lbu        $v0, 0x20($s0)
/* 37ADC 80036EDC C600002C */  lwc1       $f0, 0x2c($s0)
/* 37AE0 80036EE0 00021080 */  sll        $v0, $v0, 2
/* 37AE4 80036EE4 00431021 */  addu       $v0, $v0, $v1
/* 37AE8 80036EE8 C4420000 */  lwc1       $f2, ($v0)
/* 37AEC 80036EEC 46001081 */  sub.s      $f2, $f2, $f0
/* 37AF0 80036EF0 00002012 */  mflo       $a0
/* 37AF4 80036EF4 50A00001 */  beql       $a1, $zero, .L80036EFC
/* 37AF8 80036EF8 000001CD */   break     0, 7
.L80036EFC:
/* 37AFC 80036EFC 92020020 */   lbu       $v0, 0x20($s0)
/* 37B00 80036F00 00021080 */  sll        $v0, $v0, 2
/* 37B04 80036F04 02021021 */  addu       $v0, $s0, $v0
/* 37B08 80036F08 8C45000C */  lw         $a1, 0xc($v0)
/* 37B0C 80036F0C 44840000 */  mtc1       $a0, $f0
/* 37B10 80036F10 46800020 */  cvt.s.w    $f0, $f0
/* 37B14 80036F14 8CA30078 */  lw         $v1, 0x78($a1)
/* 37B18 80036F18 46001083 */  div.s      $f2, $f2, $f0
/* 37B1C 80036F1C E6020040 */  swc1       $f2, 0x40($s0)
/* 37B20 80036F20 84640090 */  lh         $a0, 0x90($v1)
/* 37B24 80036F24 8C620094 */  lw         $v0, 0x94($v1)
/* 37B28 80036F28 0040F809 */  jalr       $v0
/* 37B2C 80036F2C 00A42021 */   addu      $a0, $a1, $a0
/* 37B30 80036F30 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 37B34 80036F34 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 37B38 80036F38 2405074D */  addiu      $a1, $zero, 0x74d
/* 37B3C 80036F3C 00003021 */  addu       $a2, $zero, $zero
/* 37B40 80036F40 3C073F80 */  lui        $a3, 0x3f80
/* 37B44 80036F44 24020001 */  addiu      $v0, $zero, 1
/* 37B48 80036F48 AE02004C */  sw         $v0, 0x4c($s0)
/* 37B4C 80036F4C 24020078 */  addiu      $v0, $zero, 0x78
/* 37B50 80036F50 AFA20010 */  sw         $v0, 0x10($sp)
/* 37B54 80036F54 0C0156F4 */  jal        play_SFX
/* 37B58 80036F58 AFA00014 */   sw        $zero, 0x14($sp)
/* 37B5C 80036F5C 00001021 */  addu       $v0, $zero, $zero
.L80036F60:
/* 37B60 80036F60 8FBF001C */  lw         $ra, 0x1c($sp)
/* 37B64 80036F64 8FB00018 */  lw         $s0, 0x18($sp)
/* 37B68 80036F68 03E00008 */  jr         $ra
/* 37B6C 80036F6C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel bigassmenu_Rfunc
/* 37B70 80036F70 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 37B74 80036F74 3C02800E */  lui        $v0, %hi(gGlobals)
/* 37B78 80036F78 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* 37B7C 80036F7C 24040007 */  addiu      $a0, $zero, 7
/* 37B80 80036F80 AFBF001C */  sw         $ra, 0x1c($sp)
/* 37B84 80036F84 AFB00018 */  sw         $s0, 0x18($sp)
/* 37B88 80036F88 906314C4 */  lbu        $v1, 0x14c4($v1)
/* 37B8C 80036F8C 10640004 */  beq        $v1, $a0, .L80036FA0
/* 37B90 80036F90 00403021 */   addu      $a2, $v0, $zero
/* 37B94 80036F94 24020003 */  addiu      $v0, $zero, 3
/* 37B98 80036F98 14620064 */  bne        $v1, $v0, .L8003712C
/* 37B9C 80036F9C 00001021 */   addu      $v0, $zero, $zero
.L80036FA0:
/* 37BA0 80036FA0 24C368A8 */  addiu      $v1, $a2, 0x68a8
/* 37BA4 80036FA4 8C6214FC */  lw         $v0, 0x14fc($v1)
/* 37BA8 80036FA8 14400060 */  bnez       $v0, .L8003712C
/* 37BAC 80036FAC 00001021 */   addu      $v0, $zero, $zero
/* 37BB0 80036FB0 8CB00040 */  lw         $s0, 0x40($a1)
/* 37BB4 80036FB4 92040020 */  lbu        $a0, 0x20($s0)
/* 37BB8 80036FB8 24020002 */  addiu      $v0, $zero, 2
/* 37BBC 80036FBC 1082005A */  beq        $a0, $v0, .L80037128
/* 37BC0 80036FC0 24020003 */   addiu     $v0, $zero, 3
/* 37BC4 80036FC4 906314C4 */  lbu        $v1, 0x14c4($v1)
/* 37BC8 80036FC8 54620005 */  bnel       $v1, $v0, .L80036FE0
/* 37BCC 80036FCC 8E02004C */   lw        $v0, 0x4c($s0)
/* 37BD0 80036FD0 24020001 */  addiu      $v0, $zero, 1
/* 37BD4 80036FD4 10820055 */  beq        $a0, $v0, .L8003712C
/* 37BD8 80036FD8 00001021 */   addu      $v0, $zero, $zero
/* 37BDC 80036FDC 8E02004C */  lw         $v0, 0x4c($s0)
.L80036FE0:
/* 37BE0 80036FE0 14400052 */  bnez       $v0, .L8003712C
/* 37BE4 80036FE4 00001021 */   addu      $v0, $zero, $zero
/* 37BE8 80036FE8 92030020 */  lbu        $v1, 0x20($s0)
/* 37BEC 80036FEC 24020001 */  addiu      $v0, $zero, 1
/* 37BF0 80036FF0 54620006 */  bnel       $v1, $v0, .L8003700C
/* 37BF4 80036FF4 92020020 */   lbu       $v0, 0x20($s0)
/* 37BF8 80036FF8 0C00DEBC */  jal        func_80037AF0
/* 37BFC 80036FFC 8E040004 */   lw        $a0, 4($s0)
/* 37C00 80037000 1440004A */  bnez       $v0, .L8003712C
/* 37C04 80037004 00001021 */   addu      $v0, $zero, $zero
/* 37C08 80037008 92020020 */  lbu        $v0, 0x20($s0)
.L8003700C:
/* 37C0C 8003700C 14400007 */  bnez       $v0, .L8003702C
/* 37C10 80037010 00402821 */   addu      $a1, $v0, $zero
/* 37C14 80037014 8E020000 */  lw         $v0, ($s0)
/* 37C18 80037018 8C430040 */  lw         $v1, 0x40($v0)
/* 37C1C 8003701C 8C640010 */  lw         $a0, 0x10($v1)
/* 37C20 80037020 8C620000 */  lw         $v0, ($v1)
/* 37C24 80037024 14820041 */  bne        $a0, $v0, .L8003712C
/* 37C28 80037028 00001021 */   addu      $v0, $zero, $zero
.L8003702C:
/* 37C2C 8003702C 24A20001 */  addiu      $v0, $a1, 1
/* 37C30 80037030 2403FEC0 */  addiu      $v1, $zero, -0x140
/* 37C34 80037034 3C04800F */  lui        $a0, %hi(pause_menu_borg8)
/* 37C38 80037038 A2020020 */  sb         $v0, 0x20($s0)
/* 37C3C 8003703C 304200FF */  andi       $v0, $v0, 0xff
/* 37C40 80037040 2484D520 */  addiu      $a0, $a0, %lo(pause_menu_borg8)
/* 37C44 80037044 00021040 */  sll        $v0, $v0, 1
/* 37C48 80037048 00441021 */  addu       $v0, $v0, $a0
/* 37C4C 8003704C A6030024 */  sh         $v1, 0x24($s0)
/* 37C50 80037050 0C0290E2 */  jal        get_borg_8
/* 37C54 80037054 94440000 */   lhu       $a0, ($v0)
/* 37C58 80037058 00402821 */  addu       $a1, $v0, $zero
/* 37C5C 8003705C 8E04001C */  lw         $a0, 0x1c($s0)
/* 37C60 80037060 0C02DD50 */  jal        widget_replace_borg8
/* 37C64 80037064 00003021 */   addu      $a2, $zero, $zero
/* 37C68 80037068 24050140 */  addiu      $a1, $zero, 0x140
/* 37C6C 8003706C 8E04001C */  lw         $a0, 0x1c($s0)
/* 37C70 80037070 0C02DD3F */  jal        set_widget_coords
/* 37C74 80037074 00003021 */   addu      $a2, $zero, $zero
/* 37C78 80037078 86040024 */  lh         $a0, 0x24($s0)
/* 37C7C 8003707C 86020022 */  lh         $v0, 0x22($s0)
/* 37C80 80037080 86050026 */  lh         $a1, 0x26($s0)
/* 37C84 80037084 00822023 */  subu       $a0, $a0, $v0
/* 37C88 80037088 0085001A */  div        $zero, $a0, $a1
/* 37C8C 8003708C 3C03800F */  lui        $v1, %hi(scroll_floats)
/* 37C90 80037090 2463D528 */  addiu      $v1, $v1, %lo(scroll_floats)
/* 37C94 80037094 92020020 */  lbu        $v0, 0x20($s0)
/* 37C98 80037098 C602002C */  lwc1       $f2, 0x2c($s0)
/* 37C9C 8003709C 00021080 */  sll        $v0, $v0, 2
/* 37CA0 800370A0 00431021 */  addu       $v0, $v0, $v1
/* 37CA4 800370A4 C4400000 */  lwc1       $f0, ($v0)
/* 37CA8 800370A8 46020001 */  sub.s      $f0, $f0, $f2
/* 37CAC 800370AC 46000007 */  neg.s      $f0, $f0
/* 37CB0 800370B0 00002012 */  mflo       $a0
/* 37CB4 800370B4 50A00001 */  beql       $a1, $zero, .L800370BC
/* 37CB8 800370B8 000001CD */   break     0, 7
.L800370BC:
/* 37CBC 800370BC 92020020 */   lbu       $v0, 0x20($s0)
/* 37CC0 800370C0 00021080 */  sll        $v0, $v0, 2
/* 37CC4 800370C4 02021021 */  addu       $v0, $s0, $v0
/* 37CC8 800370C8 8C45000C */  lw         $a1, 0xc($v0)
/* 37CCC 800370CC 44841000 */  mtc1       $a0, $f2
/* 37CD0 800370D0 468010A0 */  cvt.s.w    $f2, $f2
/* 37CD4 800370D4 8CA30078 */  lw         $v1, 0x78($a1)
/* 37CD8 800370D8 46020003 */  div.s      $f0, $f0, $f2
/* 37CDC 800370DC E6000040 */  swc1       $f0, 0x40($s0)
/* 37CE0 800370E0 84640098 */  lh         $a0, 0x98($v1)
/* 37CE4 800370E4 8C62009C */  lw         $v0, 0x9c($v1)
/* 37CE8 800370E8 0040F809 */  jalr       $v0
/* 37CEC 800370EC 00A42021 */   addu      $a0, $a1, $a0
/* 37CF0 800370F0 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 37CF4 800370F4 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 37CF8 800370F8 2405074E */  addiu      $a1, $zero, 0x74e
/* 37CFC 800370FC 00003021 */  addu       $a2, $zero, $zero
/* 37D00 80037100 8E020008 */  lw         $v0, 8($s0)
/* 37D04 80037104 3C073F80 */  lui        $a3, 0x3f80
/* 37D08 80037108 8C43007C */  lw         $v1, 0x7c($v0)
/* 37D0C 8003710C 24020001 */  addiu      $v0, $zero, 1
/* 37D10 80037110 A0600086 */  sb         $zero, 0x86($v1)
/* 37D14 80037114 AE02004C */  sw         $v0, 0x4c($s0)
/* 37D18 80037118 24020078 */  addiu      $v0, $zero, 0x78
/* 37D1C 8003711C AFA20010 */  sw         $v0, 0x10($sp)
/* 37D20 80037120 0C0156F4 */  jal        play_SFX
/* 37D24 80037124 AFA00014 */   sw        $zero, 0x14($sp)
.L80037128:
/* 37D28 80037128 00001021 */  addu       $v0, $zero, $zero
.L8003712C:
/* 37D2C 8003712C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 37D30 80037130 8FB00018 */  lw         $s0, 0x18($sp)
/* 37D34 80037134 03E00008 */  jr         $ra
/* 37D38 80037138 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003713C
/* 37D3C 8003713C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37D40 80037140 AFBF0014 */  sw         $ra, 0x14($sp)
/* 37D44 80037144 AFB00010 */  sw         $s0, 0x10($sp)
/* 37D48 80037148 8CB00040 */  lw         $s0, 0x40($a1)
/* 37D4C 8003714C 8E02004C */  lw         $v0, 0x4c($s0)
/* 37D50 80037150 14400013 */  bnez       $v0, .L800371A0
/* 37D54 80037154 00001021 */   addu      $v0, $zero, $zero
/* 37D58 80037158 92030020 */  lbu        $v1, 0x20($s0)
/* 37D5C 8003715C 24020001 */  addiu      $v0, $zero, 1
/* 37D60 80037160 54620006 */  bnel       $v1, $v0, .L8003717C
/* 37D64 80037164 92020020 */   lbu       $v0, 0x20($s0)
/* 37D68 80037168 0C00DEBC */  jal        func_80037AF0
/* 37D6C 8003716C 8E040004 */   lw        $a0, 4($s0)
/* 37D70 80037170 1440000B */  bnez       $v0, .L800371A0
/* 37D74 80037174 00001021 */   addu      $v0, $zero, $zero
/* 37D78 80037178 92020020 */  lbu        $v0, 0x20($s0)
.L8003717C:
/* 37D7C 8003717C 00021080 */  sll        $v0, $v0, 2
/* 37D80 80037180 02021021 */  addu       $v0, $s0, $v0
/* 37D84 80037184 8C45000C */  lw         $a1, 0xc($v0)
/* 37D88 80037188 8CA30078 */  lw         $v1, 0x78($a1)
/* 37D8C 8003718C 84640068 */  lh         $a0, 0x68($v1)
/* 37D90 80037190 8C62006C */  lw         $v0, 0x6c($v1)
/* 37D94 80037194 0040F809 */  jalr       $v0
/* 37D98 80037198 00A42021 */   addu      $a0, $a1, $a0
/* 37D9C 8003719C 00001021 */  addu       $v0, $zero, $zero
.L800371A0:
/* 37DA0 800371A0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 37DA4 800371A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 37DA8 800371A8 03E00008 */  jr         $ra
/* 37DAC 800371AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800371B0
/* 37DB0 800371B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37DB4 800371B4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 37DB8 800371B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 37DBC 800371BC 8CB00040 */  lw         $s0, 0x40($a1)
/* 37DC0 800371C0 8E02004C */  lw         $v0, 0x4c($s0)
/* 37DC4 800371C4 14400013 */  bnez       $v0, .L80037214
/* 37DC8 800371C8 00001021 */   addu      $v0, $zero, $zero
/* 37DCC 800371CC 92030020 */  lbu        $v1, 0x20($s0)
/* 37DD0 800371D0 24020001 */  addiu      $v0, $zero, 1
/* 37DD4 800371D4 54620006 */  bnel       $v1, $v0, .L800371F0
/* 37DD8 800371D8 92020020 */   lbu       $v0, 0x20($s0)
/* 37DDC 800371DC 0C00DEBC */  jal        func_80037AF0
/* 37DE0 800371E0 8E040004 */   lw        $a0, 4($s0)
/* 37DE4 800371E4 1440000B */  bnez       $v0, .L80037214
/* 37DE8 800371E8 00001021 */   addu      $v0, $zero, $zero
/* 37DEC 800371EC 92020020 */  lbu        $v0, 0x20($s0)
.L800371F0:
/* 37DF0 800371F0 00021080 */  sll        $v0, $v0, 2
/* 37DF4 800371F4 02021021 */  addu       $v0, $s0, $v0
/* 37DF8 800371F8 8C45000C */  lw         $a1, 0xc($v0)
/* 37DFC 800371FC 8CA30078 */  lw         $v1, 0x78($a1)
/* 37E00 80037200 84640070 */  lh         $a0, 0x70($v1)
/* 37E04 80037204 8C620074 */  lw         $v0, 0x74($v1)
/* 37E08 80037208 0040F809 */  jalr       $v0
/* 37E0C 8003720C 00A42021 */   addu      $a0, $a1, $a0
/* 37E10 80037210 00001021 */  addu       $v0, $zero, $zero
.L80037214:
/* 37E14 80037214 8FBF0014 */  lw         $ra, 0x14($sp)
/* 37E18 80037218 8FB00010 */  lw         $s0, 0x10($sp)
/* 37E1C 8003721C 03E00008 */  jr         $ra
/* 37E20 80037220 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80037224
/* 37E24 80037224 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 37E28 80037228 AFBF001C */  sw         $ra, 0x1c($sp)
/* 37E2C 8003722C AFB00018 */  sw         $s0, 0x18($sp)
/* 37E30 80037230 8CB00040 */  lw         $s0, 0x40($a1)
/* 37E34 80037234 8E02004C */  lw         $v0, 0x4c($s0)
/* 37E38 80037238 1440001C */  bnez       $v0, .L800372AC
/* 37E3C 8003723C 00001021 */   addu      $v0, $zero, $zero
/* 37E40 80037240 92030020 */  lbu        $v1, 0x20($s0)
/* 37E44 80037244 24020001 */  addiu      $v0, $zero, 1
/* 37E48 80037248 54620006 */  bnel       $v1, $v0, .L80037264
/* 37E4C 8003724C 92020020 */   lbu       $v0, 0x20($s0)
/* 37E50 80037250 0C00DEBC */  jal        func_80037AF0
/* 37E54 80037254 8E040004 */   lw        $a0, 4($s0)
/* 37E58 80037258 14400014 */  bnez       $v0, .L800372AC
/* 37E5C 8003725C 00001021 */   addu      $v0, $zero, $zero
/* 37E60 80037260 92020020 */  lbu        $v0, 0x20($s0)
.L80037264:
/* 37E64 80037264 00021080 */  sll        $v0, $v0, 2
/* 37E68 80037268 02021021 */  addu       $v0, $s0, $v0
/* 37E6C 8003726C 8C45000C */  lw         $a1, 0xc($v0)
/* 37E70 80037270 8CA30078 */  lw         $v1, 0x78($a1)
/* 37E74 80037274 84640058 */  lh         $a0, 0x58($v1)
/* 37E78 80037278 8C62005C */  lw         $v0, 0x5c($v1)
/* 37E7C 8003727C 0040F809 */  jalr       $v0
/* 37E80 80037280 00A42021 */   addu      $a0, $a1, $a0
/* 37E84 80037284 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 37E88 80037288 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 37E8C 8003728C 2402001E */  addiu      $v0, $zero, 0x1e
/* 37E90 80037290 2405073B */  addiu      $a1, $zero, 0x73b
/* 37E94 80037294 3C073F80 */  lui        $a3, 0x3f80
/* 37E98 80037298 00003021 */  addu       $a2, $zero, $zero
/* 37E9C 8003729C AFA20010 */  sw         $v0, 0x10($sp)
/* 37EA0 800372A0 0C0156F4 */  jal        play_SFX
/* 37EA4 800372A4 AFA00014 */   sw        $zero, 0x14($sp)
/* 37EA8 800372A8 00001021 */  addu       $v0, $zero, $zero
.L800372AC:
/* 37EAC 800372AC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 37EB0 800372B0 8FB00018 */  lw         $s0, 0x18($sp)
/* 37EB4 800372B4 03E00008 */  jr         $ra
/* 37EB8 800372B8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800372BC
/* 37EBC 800372BC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 37EC0 800372C0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 37EC4 800372C4 AFB00018 */  sw         $s0, 0x18($sp)
/* 37EC8 800372C8 8CB00040 */  lw         $s0, 0x40($a1)
/* 37ECC 800372CC 8E02004C */  lw         $v0, 0x4c($s0)
/* 37ED0 800372D0 1440001C */  bnez       $v0, .L80037344
/* 37ED4 800372D4 00001021 */   addu      $v0, $zero, $zero
/* 37ED8 800372D8 92030020 */  lbu        $v1, 0x20($s0)
/* 37EDC 800372DC 24020001 */  addiu      $v0, $zero, 1
/* 37EE0 800372E0 54620006 */  bnel       $v1, $v0, .L800372FC
/* 37EE4 800372E4 92020020 */   lbu       $v0, 0x20($s0)
/* 37EE8 800372E8 0C00DEBC */  jal        func_80037AF0
/* 37EEC 800372EC 8E040004 */   lw        $a0, 4($s0)
/* 37EF0 800372F0 14400014 */  bnez       $v0, .L80037344
/* 37EF4 800372F4 00001021 */   addu      $v0, $zero, $zero
/* 37EF8 800372F8 92020020 */  lbu        $v0, 0x20($s0)
.L800372FC:
/* 37EFC 800372FC 00021080 */  sll        $v0, $v0, 2
/* 37F00 80037300 02021021 */  addu       $v0, $s0, $v0
/* 37F04 80037304 8C45000C */  lw         $a1, 0xc($v0)
/* 37F08 80037308 8CA30078 */  lw         $v1, 0x78($a1)
/* 37F0C 8003730C 84640060 */  lh         $a0, 0x60($v1)
/* 37F10 80037310 8C620064 */  lw         $v0, 0x64($v1)
/* 37F14 80037314 0040F809 */  jalr       $v0
/* 37F18 80037318 00A42021 */   addu      $a0, $a1, $a0
/* 37F1C 8003731C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 37F20 80037320 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 37F24 80037324 2402001E */  addiu      $v0, $zero, 0x1e
/* 37F28 80037328 2405073B */  addiu      $a1, $zero, 0x73b
/* 37F2C 8003732C 3C073F80 */  lui        $a3, 0x3f80
/* 37F30 80037330 00003021 */  addu       $a2, $zero, $zero
/* 37F34 80037334 AFA20010 */  sw         $v0, 0x10($sp)
/* 37F38 80037338 0C0156F4 */  jal        play_SFX
/* 37F3C 8003733C AFA00014 */   sw        $zero, 0x14($sp)
/* 37F40 80037340 00001021 */  addu       $v0, $zero, $zero
.L80037344:
/* 37F44 80037344 8FBF001C */  lw         $ra, 0x1c($sp)
/* 37F48 80037348 8FB00018 */  lw         $s0, 0x18($sp)
/* 37F4C 8003734C 03E00008 */  jr         $ra
/* 37F50 80037350 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80037354
/* 37F54 80037354 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37F58 80037358 AFBF0010 */  sw         $ra, 0x10($sp)
/* 37F5C 8003735C 8CA30040 */  lw         $v1, 0x40($a1)
/* 37F60 80037360 8C62004C */  lw         $v0, 0x4c($v1)
/* 37F64 80037364 1440000B */  bnez       $v0, .L80037394
/* 37F68 80037368 00001021 */   addu      $v0, $zero, $zero
/* 37F6C 8003736C 90620020 */  lbu        $v0, 0x20($v1)
/* 37F70 80037370 00021080 */  sll        $v0, $v0, 2
/* 37F74 80037374 00621021 */  addu       $v0, $v1, $v0
/* 37F78 80037378 8C45000C */  lw         $a1, 0xc($v0)
/* 37F7C 8003737C 8CA30078 */  lw         $v1, 0x78($a1)
/* 37F80 80037380 846400B8 */  lh         $a0, 0xb8($v1)
/* 37F84 80037384 8C6200BC */  lw         $v0, 0xbc($v1)
/* 37F88 80037388 0040F809 */  jalr       $v0
/* 37F8C 8003738C 00A42021 */   addu      $a0, $a1, $a0
/* 37F90 80037390 00001021 */  addu       $v0, $zero, $zero
.L80037394:
/* 37F94 80037394 8FBF0010 */  lw         $ra, 0x10($sp)
/* 37F98 80037398 03E00008 */  jr         $ra
/* 37F9C 8003739C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800373A0
/* 37FA0 800373A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37FA4 800373A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 37FA8 800373A8 8CA30040 */  lw         $v1, 0x40($a1)
/* 37FAC 800373AC 8C62004C */  lw         $v0, 0x4c($v1)
/* 37FB0 800373B0 1440000B */  bnez       $v0, .L800373E0
/* 37FB4 800373B4 00001021 */   addu      $v0, $zero, $zero
/* 37FB8 800373B8 90620020 */  lbu        $v0, 0x20($v1)
/* 37FBC 800373BC 00021080 */  sll        $v0, $v0, 2
/* 37FC0 800373C0 00621021 */  addu       $v0, $v1, $v0
/* 37FC4 800373C4 8C45000C */  lw         $a1, 0xc($v0)
/* 37FC8 800373C8 8CA30078 */  lw         $v1, 0x78($a1)
/* 37FCC 800373CC 846400C0 */  lh         $a0, 0xc0($v1)
/* 37FD0 800373D0 8C6200C4 */  lw         $v0, 0xc4($v1)
/* 37FD4 800373D4 0040F809 */  jalr       $v0
/* 37FD8 800373D8 00A42021 */   addu      $a0, $a1, $a0
/* 37FDC 800373DC 00001021 */  addu       $v0, $zero, $zero
.L800373E0:
/* 37FE0 800373E0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 37FE4 800373E4 03E00008 */  jr         $ra
/* 37FE8 800373E8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800373EC
/* 37FEC 800373EC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37FF0 800373F0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 37FF4 800373F4 8CA30040 */  lw         $v1, 0x40($a1)
/* 37FF8 800373F8 8C62004C */  lw         $v0, 0x4c($v1)
/* 37FFC 800373FC 1440000B */  bnez       $v0, .L8003742C
/* 38000 80037400 00001021 */   addu      $v0, $zero, $zero
/* 38004 80037404 90620020 */  lbu        $v0, 0x20($v1)
/* 38008 80037408 00021080 */  sll        $v0, $v0, 2
/* 3800C 8003740C 00621021 */  addu       $v0, $v1, $v0
/* 38010 80037410 8C45000C */  lw         $a1, 0xc($v0)
/* 38014 80037414 8CA30078 */  lw         $v1, 0x78($a1)
/* 38018 80037418 846400A8 */  lh         $a0, 0xa8($v1)
/* 3801C 8003741C 8C6200AC */  lw         $v0, 0xac($v1)
/* 38020 80037420 0040F809 */  jalr       $v0
/* 38024 80037424 00A42021 */   addu      $a0, $a1, $a0
/* 38028 80037428 00001021 */  addu       $v0, $zero, $zero
.L8003742C:
/* 3802C 8003742C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 38030 80037430 03E00008 */  jr         $ra
/* 38034 80037434 27BD0018 */   addiu     $sp, $sp, 0x18

glabel bigAssMenu_CDownFunc
/* 38038 80037438 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3803C 8003743C AFBF0010 */  sw         $ra, 0x10($sp)
/* 38040 80037440 8CA30040 */  lw         $v1, 0x40($a1)
/* 38044 80037444 8C62004C */  lw         $v0, 0x4c($v1)
/* 38048 80037448 1440000B */  bnez       $v0, .L80037478
/* 3804C 8003744C 00001021 */   addu      $v0, $zero, $zero
/* 38050 80037450 90620020 */  lbu        $v0, 0x20($v1)
/* 38054 80037454 00021080 */  sll        $v0, $v0, 2
/* 38058 80037458 00621021 */  addu       $v0, $v1, $v0
/* 3805C 8003745C 8C45000C */  lw         $a1, 0xc($v0)
/* 38060 80037460 8CA30078 */  lw         $v1, 0x78($a1)
/* 38064 80037464 846400B0 */  lh         $a0, 0xb0($v1)
/* 38068 80037468 8C6200B4 */  lw         $v0, 0xb4($v1)
/* 3806C 8003746C 0040F809 */  jalr       $v0
/* 38070 80037470 00A42021 */   addu      $a0, $a1, $a0
/* 38074 80037474 00001021 */  addu       $v0, $zero, $zero
.L80037478:
/* 38078 80037478 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3807C 8003747C 03E00008 */  jr         $ra
/* 38080 80037480 27BD0018 */   addiu     $sp, $sp, 0x18

glabel bigAssMenu_BFunc
/* 38084 80037484 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 38088 80037488 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3808C 8003748C AFB00018 */  sw         $s0, 0x18($sp)
/* 38090 80037490 8CA40040 */  lw         $a0, 0x40($a1)
/* 38094 80037494 8C82004C */  lw         $v0, 0x4c($a0)
/* 38098 80037498 1440001B */  bnez       $v0, .L80037508
/* 3809C 8003749C 00001021 */   addu      $v0, $zero, $zero
/* 380A0 800374A0 8C820030 */  lw         $v0, 0x30($a0)
/* 380A4 800374A4 8443000C */  lh         $v1, 0xc($v0)
/* 380A8 800374A8 14600017 */  bnez       $v1, .L80037508
/* 380AC 800374AC 00001021 */   addu      $v0, $zero, $zero
/* 380B0 800374B0 90820020 */  lbu        $v0, 0x20($a0)
/* 380B4 800374B4 00021080 */  sll        $v0, $v0, 2
/* 380B8 800374B8 00821021 */  addu       $v0, $a0, $v0
/* 380BC 800374BC 8C45000C */  lw         $a1, 0xc($v0)
/* 380C0 800374C0 8CA30078 */  lw         $v1, 0x78($a1)
/* 380C4 800374C4 84640080 */  lh         $a0, 0x80($v1)
/* 380C8 800374C8 8C620084 */  lw         $v0, 0x84($v1)
/* 380CC 800374CC 0040F809 */  jalr       $v0
/* 380D0 800374D0 00A42021 */   addu      $a0, $a1, $a0
/* 380D4 800374D4 00408021 */  addu       $s0, $v0, $zero
/* 380D8 800374D8 56000001 */  bnel       $s0, $zero, .L800374E0
/* 380DC 800374DC A600005E */   sh        $zero, 0x5e($s0)
.L800374E0:
/* 380E0 800374E0 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 380E4 800374E4 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 380E8 800374E8 2402003C */  addiu      $v0, $zero, 0x3c
/* 380EC 800374EC 24050741 */  addiu      $a1, $zero, 0x741
/* 380F0 800374F0 3C073F80 */  lui        $a3, 0x3f80
/* 380F4 800374F4 00003021 */  addu       $a2, $zero, $zero
/* 380F8 800374F8 AFA20010 */  sw         $v0, 0x10($sp)
/* 380FC 800374FC 0C0156F4 */  jal        play_SFX
/* 38100 80037500 AFA00014 */   sw        $zero, 0x14($sp)
/* 38104 80037504 02001021 */  addu       $v0, $s0, $zero
.L80037508:
/* 38108 80037508 8FBF001C */  lw         $ra, 0x1c($sp)
/* 3810C 8003750C 8FB00018 */  lw         $s0, 0x18($sp)
/* 38110 80037510 03E00008 */  jr         $ra
/* 38114 80037514 27BD0020 */   addiu     $sp, $sp, 0x20

glabel bigassMenu_AFunc
/* 38118 80037518 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3811C 8003751C AFBF001C */  sw         $ra, 0x1c($sp)
/* 38120 80037520 AFB00018 */  sw         $s0, 0x18($sp)
/* 38124 80037524 8CA40040 */  lw         $a0, 0x40($a1)
/* 38128 80037528 8C82004C */  lw         $v0, 0x4c($a0)
/* 3812C 8003752C 14400019 */  bnez       $v0, .L80037594
/* 38130 80037530 00001021 */   addu      $v0, $zero, $zero
/* 38134 80037534 8C820030 */  lw         $v0, 0x30($a0)
/* 38138 80037538 8443000C */  lh         $v1, 0xc($v0)
/* 3813C 8003753C 54600015 */  bnel       $v1, $zero, .L80037594
/* 38140 80037540 00001021 */   addu      $v0, $zero, $zero
/* 38144 80037544 90820020 */  lbu        $v0, 0x20($a0)
/* 38148 80037548 00021080 */  sll        $v0, $v0, 2
/* 3814C 8003754C 00821021 */  addu       $v0, $a0, $v0
/* 38150 80037550 8C45000C */  lw         $a1, 0xc($v0)
/* 38154 80037554 8CA30078 */  lw         $v1, 0x78($a1)
/* 38158 80037558 84640078 */  lh         $a0, 0x78($v1)
/* 3815C 8003755C 8C62007C */  lw         $v0, 0x7c($v1)
/* 38160 80037560 0040F809 */  jalr       $v0
/* 38164 80037564 00A42021 */   addu      $a0, $a1, $a0
/* 38168 80037568 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 3816C 8003756C 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 38170 80037570 2403003C */  addiu      $v1, $zero, 0x3c
/* 38174 80037574 00408021 */  addu       $s0, $v0, $zero
/* 38178 80037578 24050740 */  addiu      $a1, $zero, 0x740
/* 3817C 8003757C 3C073F80 */  lui        $a3, 0x3f80
/* 38180 80037580 00003021 */  addu       $a2, $zero, $zero
/* 38184 80037584 AFA30010 */  sw         $v1, 0x10($sp)
/* 38188 80037588 0C0156F4 */  jal        play_SFX
/* 3818C 8003758C AFA00014 */   sw        $zero, 0x14($sp)
/* 38190 80037590 02001021 */  addu       $v0, $s0, $zero
.L80037594:
/* 38194 80037594 8FBF001C */  lw         $ra, 0x1c($sp)
/* 38198 80037598 8FB00018 */  lw         $s0, 0x18($sp)
/* 3819C 8003759C 03E00008 */  jr         $ra
/* 381A0 800375A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel BigAssMenu_StartFunc
/* 381A4 800375A4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 381A8 800375A8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 381AC 800375AC AFB1001C */  sw         $s1, 0x1c($sp)
/* 381B0 800375B0 AFB00018 */  sw         $s0, 0x18($sp)
/* 381B4 800375B4 8CB00040 */  lw         $s0, 0x40($a1)
/* 381B8 800375B8 8E02004C */  lw         $v0, 0x4c($s0)
/* 381BC 800375BC 1440001E */  bnez       $v0, .L80037638
/* 381C0 800375C0 00001021 */   addu      $v0, $zero, $zero
/* 381C4 800375C4 8E020030 */  lw         $v0, 0x30($s0)
/* 381C8 800375C8 8443000C */  lh         $v1, 0xc($v0)
/* 381CC 800375CC 1460001A */  bnez       $v1, .L80037638
/* 381D0 800375D0 00001021 */   addu      $v0, $zero, $zero
/* 381D4 800375D4 92020020 */  lbu        $v0, 0x20($s0)
/* 381D8 800375D8 00021080 */  sll        $v0, $v0, 2
/* 381DC 800375DC 02021021 */  addu       $v0, $s0, $v0
/* 381E0 800375E0 8C45000C */  lw         $a1, 0xc($v0)
/* 381E4 800375E4 8CA30078 */  lw         $v1, 0x78($a1)
/* 381E8 800375E8 846400A0 */  lh         $a0, 0xa0($v1)
/* 381EC 800375EC 8C6200A4 */  lw         $v0, 0xa4($v1)
/* 381F0 800375F0 0040F809 */  jalr       $v0
/* 381F4 800375F4 00A42021 */   addu      $a0, $a1, $a0
/* 381F8 800375F8 00408821 */  addu       $s1, $v0, $zero
/* 381FC 800375FC 12200004 */  beqz       $s1, .L80037610
/* 38200 80037600 24020002 */   addiu     $v0, $zero, 2
/* 38204 80037604 92030020 */  lbu        $v1, 0x20($s0)
/* 38208 80037608 54620001 */  bnel       $v1, $v0, .L80037610
/* 3820C 8003760C A620005E */   sh        $zero, 0x5e($s1)
.L80037610:
/* 38210 80037610 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 38214 80037614 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 38218 80037618 2402003C */  addiu      $v0, $zero, 0x3c
/* 3821C 8003761C 24050741 */  addiu      $a1, $zero, 0x741
/* 38220 80037620 3C073F80 */  lui        $a3, 0x3f80
/* 38224 80037624 00003021 */  addu       $a2, $zero, $zero
/* 38228 80037628 AFA20010 */  sw         $v0, 0x10($sp)
/* 3822C 8003762C 0C0156F4 */  jal        play_SFX
/* 38230 80037630 AFA00014 */   sw        $zero, 0x14($sp)
/* 38234 80037634 02201021 */  addu       $v0, $s1, $zero
.L80037638:
/* 38238 80037638 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3823C 8003763C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 38240 80037640 8FB00018 */  lw         $s0, 0x18($sp)
/* 38244 80037644 03E00008 */  jr         $ra
/* 38248 80037648 27BD0028 */   addiu     $sp, $sp, 0x28
/* 3824C 8003764C 00000000 */  nop
