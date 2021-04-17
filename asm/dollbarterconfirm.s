.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80043C40
/* 44840 80043C40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 44844 80043C44 3C02800E */  lui        $v0, %hi(D_800DCDF0)
/* 44848 80043C48 2442CDF0 */  addiu      $v0, $v0, %lo(D_800DCDF0)
/* 4484C 80043C4C AFBF0010 */  sw         $ra, 0x10($sp)
/* 44850 80043C50 0C02E66C */  jal        widget_menu_free
/* 44854 80043C54 AC820078 */   sw        $v0, 0x78($a0)
/* 44858 80043C58 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4485C 80043C5C 03E00008 */  jr         $ra
/* 44860 80043C60 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dollBarterConfirm
/* 44864 80043C64 27BDFE80 */  addiu      $sp, $sp, -0x180
/* 44868 80043C68 AFB20160 */  sw         $s2, 0x160($sp)
/* 4486C 80043C6C 00809021 */  addu       $s2, $a0, $zero
/* 44870 80043C70 AFB00158 */  sw         $s0, 0x158($sp)
/* 44874 80043C74 00A08021 */  addu       $s0, $a1, $zero
/* 44878 80043C78 AFB1015C */  sw         $s1, 0x15c($sp)
/* 4487C 80043C7C 00C08821 */  addu       $s1, $a2, $zero
/* 44880 80043C80 AFBF0178 */  sw         $ra, 0x178($sp)
/* 44884 80043C84 AFB70174 */  sw         $s7, 0x174($sp)
/* 44888 80043C88 AFB60170 */  sw         $s6, 0x170($sp)
/* 4488C 80043C8C AFB5016C */  sw         $s5, 0x16c($sp)
/* 44890 80043C90 AFB40168 */  sw         $s4, 0x168($sp)
/* 44894 80043C94 0C02E658 */  jal        widget_menu_build
/* 44898 80043C98 AFB30164 */   sw        $s3, 0x164($sp)
/* 4489C 80043C9C 3C03800E */  lui        $v1, %hi(D_800DCDF0)
/* 448A0 80043CA0 8E060080 */  lw         $a2, 0x80($s0)
/* 448A4 80043CA4 2463CDF0 */  addiu      $v1, $v1, %lo(D_800DCDF0)
/* 448A8 80043CA8 AE430078 */  sw         $v1, 0x78($s2)
/* 448AC 80043CAC 8CC50078 */  lw         $a1, 0x78($a2)
/* 448B0 80043CB0 AE50007C */  sw         $s0, 0x7c($s2)
/* 448B4 80043CB4 AE510088 */  sw         $s1, 0x88($s2)
/* 448B8 80043CB8 84A40078 */  lh         $a0, 0x78($a1)
/* 448BC 80043CBC 8CA2007C */  lw         $v0, 0x7c($a1)
/* 448C0 80043CC0 0040F809 */  jalr       $v0
/* 448C4 80043CC4 00C42021 */   addu      $a0, $a2, $a0
/* 448C8 80043CC8 00408021 */  addu       $s0, $v0, $zero
/* 448CC 80043CCC 8E030078 */  lw         $v1, 0x78($s0)
/* 448D0 80043CD0 84640078 */  lh         $a0, 0x78($v1)
/* 448D4 80043CD4 8C62007C */  lw         $v0, 0x7c($v1)
/* 448D8 80043CD8 0040F809 */  jalr       $v0
/* 448DC 80043CDC 02042021 */   addu      $a0, $s0, $a0
/* 448E0 80043CE0 10400005 */  beqz       $v0, .L80043CF8
/* 448E4 80043CE4 3C05800E */   lui       $a1, %hi(D_800DCD98)
/* 448E8 80043CE8 3C04800E */  lui        $a0, %hi(D_800DCD80)
/* 448EC 80043CEC 2484CD80 */  addiu      $a0, $a0, %lo(D_800DCD80)
/* 448F0 80043CF0 0C025F2D */  jal        manualCrash
/* 448F4 80043CF4 24A5CD98 */   addiu     $a1, $a1, %lo(D_800DCD98)
.L80043CF8:
/* 448F8 80043CF8 8E030078 */  lw         $v1, 0x78($s0)
/* 448FC 80043CFC 84640088 */  lh         $a0, 0x88($v1)
/* 44900 80043D00 8C62008C */  lw         $v0, 0x8c($v1)
/* 44904 80043D04 0040F809 */  jalr       $v0
/* 44908 80043D08 02042021 */   addu      $a0, $s0, $a0
/* 4490C 80043D0C 00408821 */  addu       $s1, $v0, $zero
/* 44910 80043D10 16200007 */  bnez       $s1, .L80043D30
/* 44914 80043D14 3C10800E */   lui       $s0, 0x800e
/* 44918 80043D18 3C04800E */  lui        $a0, %hi(D_800DCDC0)
/* 4491C 80043D1C 2484CDC0 */  addiu      $a0, $a0, %lo(D_800DCDC0)
/* 44920 80043D20 3C05800E */  lui        $a1, %hi(D_800DCDCC)
/* 44924 80043D24 0C025F2D */  jal        manualCrash
/* 44928 80043D28 24A5CDCC */   addiu     $a1, $a1, %lo(D_800DCDCC)
/* 4492C 80043D2C 3C10800E */  lui        $s0, %hi(gGlobals)
.L80043D30:
/* 44930 80043D30 261368A8 */  addiu      $s3, $s0, %lo(gGlobals)
/* 44934 80043D34 8E6215F8 */  lw         $v0, 0x15f8($s3)
/* 44938 80043D38 96230000 */  lhu        $v1, ($s1)
/* 4493C 80043D3C 8C470010 */  lw         $a3, 0x10($v0)
/* 44940 80043D40 A643005E */  sh         $v1, 0x5e($s2)
/* 44944 80043D44 8CE60000 */  lw         $a2, ($a3)
/* 44948 80043D48 3065FFFF */  andi       $a1, $v1, 0xffff
/* 4494C 80043D4C 84C40050 */  lh         $a0, 0x50($a2)
/* 44950 80043D50 8CC20054 */  lw         $v0, 0x54($a2)
/* 44954 80043D54 0040F809 */  jalr       $v0
/* 44958 80043D58 00E42021 */   addu      $a0, $a3, $a0
/* 4495C 80043D5C A242005C */  sb         $v0, 0x5c($s2)
/* 44960 80043D60 8E6215F8 */  lw         $v0, 0x15f8($s3)
/* 44964 80043D64 8C460010 */  lw         $a2, 0x10($v0)
/* 44968 80043D68 8CC30000 */  lw         $v1, ($a2)
/* 4496C 80043D6C 9245005C */  lbu        $a1, 0x5c($s2)
/* 44970 80043D70 84640068 */  lh         $a0, 0x68($v1)
/* 44974 80043D74 8C62006C */  lw         $v0, 0x6c($v1)
/* 44978 80043D78 0040F809 */  jalr       $v0
/* 4497C 80043D7C 00C42021 */   addu      $a0, $a2, $a0
/* 44980 80043D80 8E460088 */  lw         $a2, 0x88($s2)
/* 44984 80043D84 0200B821 */  addu       $s7, $s0, $zero
/* 44988 80043D88 10C00008 */  beqz       $a2, .L80043DAC
/* 4498C 80043D8C A242008C */   sb        $v0, 0x8c($s2)
/* 44990 80043D90 8E62204C */  lw         $v0, 0x204c($s3)
/* 44994 80043D94 8E270004 */  lw         $a3, 4($s1)
/* 44998 80043D98 8C45075C */  lw         $a1, 0x75c($v0)
/* 4499C 80043D9C 0C0333AC */  jal        sprintf
/* 449A0 80043DA0 27A40018 */   addiu     $a0, $sp, 0x18
/* 449A4 80043DA4 08010F70 */  j          .L80043DC0
/* 449A8 80043DA8 00000000 */   nop
.L80043DAC:
/* 449AC 80043DAC 8E62204C */  lw         $v0, 0x204c($s3)
/* 449B0 80043DB0 8E260004 */  lw         $a2, 4($s1)
/* 449B4 80043DB4 8C450760 */  lw         $a1, 0x760($v0)
/* 449B8 80043DB8 0C0333AC */  jal        sprintf
/* 449BC 80043DBC 27A40018 */   addiu     $a0, $sp, 0x18
.L80043DC0:
/* 449C0 80043DC0 0C026259 */  jal        passToMalloc
/* 449C4 80043DC4 2404007C */   addiu     $a0, $zero, 0x7c
/* 449C8 80043DC8 00402021 */  addu       $a0, $v0, $zero
/* 449CC 80043DCC 27A50018 */  addiu      $a1, $sp, 0x18
/* 449D0 80043DD0 0C02DFC8 */  jal        widgetcliptext_init
/* 449D4 80043DD4 24060190 */   addiu     $a2, $zero, 0x190
/* 449D8 80043DD8 0040A821 */  addu       $s5, $v0, $zero
/* 449DC 80043DDC 02A02021 */  addu       $a0, $s5, $zero
/* 449E0 80043DE0 24050050 */  addiu      $a1, $zero, 0x50
/* 449E4 80043DE4 0C02EF52 */  jal        func_800BBD48
/* 449E8 80043DE8 240600F0 */   addiu     $a2, $zero, 0xf0
/* 449EC 80043DEC 0C026259 */  jal        passToMalloc
/* 449F0 80043DF0 2404007C */   addiu     $a0, $zero, 0x7c
/* 449F4 80043DF4 00402021 */  addu       $a0, $v0, $zero
/* 449F8 80043DF8 0C02E68C */  jal        widgetscrollmenu_init
/* 449FC 80043DFC 24050006 */   addiu     $a1, $zero, 6
/* 44A00 80043E00 240500C8 */  addiu      $a1, $zero, 0xc8
/* 44A04 80043E04 240600B4 */  addiu      $a2, $zero, 0xb4
/* 44A08 80043E08 8C490078 */  lw         $t1, 0x78($v0)
/* 44A0C 80043E0C 24070064 */  addiu      $a3, $zero, 0x64
/* 44A10 80043E10 AE420084 */  sw         $v0, 0x84($s2)
/* 44A14 80043E14 85240048 */  lh         $a0, 0x48($t1)
/* 44A18 80043E18 240300FF */  addiu      $v1, $zero, 0xff
/* 44A1C 80043E1C AFA30010 */  sw         $v1, 0x10($sp)
/* 44A20 80043E20 8D28004C */  lw         $t0, 0x4c($t1)
/* 44A24 80043E24 0100F809 */  jalr       $t0
/* 44A28 80043E28 00442021 */   addu      $a0, $v0, $a0
/* 44A2C 80043E2C 8E420088 */  lw         $v0, 0x88($s2)
/* 44A30 80043E30 10400007 */  beqz       $v0, .L80043E50
/* 44A34 80043E34 26E268A8 */   addiu     $v0, $s7, 0x68a8
/* 44A38 80043E38 8C43204C */  lw         $v1, 0x204c($v0)
/* 44A3C 80043E3C 8C650764 */  lw         $a1, 0x764($v1)
/* 44A40 80043E40 0C0333AC */  jal        sprintf
/* 44A44 80043E44 27A40018 */   addiu     $a0, $sp, 0x18
/* 44A48 80043E48 08010F98 */  j          .L80043E60
/* 44A4C 80043E4C 00000000 */   nop
.L80043E50:
/* 44A50 80043E50 8C43204C */  lw         $v1, 0x204c($v0)
/* 44A54 80043E54 8C650768 */  lw         $a1, 0x768($v1)
/* 44A58 80043E58 0C0333AC */  jal        sprintf
/* 44A5C 80043E5C 27A40018 */   addiu     $a0, $sp, 0x18
.L80043E60:
/* 44A60 80043E60 0C026259 */  jal        passToMalloc
/* 44A64 80043E64 2404007C */   addiu     $a0, $zero, 0x7c
/* 44A68 80043E68 00402021 */  addu       $a0, $v0, $zero
/* 44A6C 80043E6C 27A50018 */  addiu      $a1, $sp, 0x18
/* 44A70 80043E70 0C02DFC8 */  jal        widgetcliptext_init
/* 44A74 80043E74 24060190 */   addiu     $a2, $zero, 0x190
/* 44A78 80043E78 00408821 */  addu       $s1, $v0, $zero
/* 44A7C 80043E7C 8E440084 */  lw         $a0, 0x84($s2)
/* 44A80 80043E80 0C02E885 */  jal        link_widget_text
/* 44A84 80043E84 02202821 */   addu      $a1, $s1, $zero
/* 44A88 80043E88 A220005C */  sb         $zero, 0x5c($s1)
/* 44A8C 80043E8C 9243008C */  lbu        $v1, 0x8c($s2)
/* 44A90 80043E90 24020001 */  addiu      $v0, $zero, 1
/* 44A94 80043E94 1462001A */  bne        $v1, $v0, .L80043F00
/* 44A98 80043E98 27A40118 */   addiu     $a0, $sp, 0x118
/* 44A9C 80043E9C 8E420088 */  lw         $v0, 0x88($s2)
/* 44AA0 80043EA0 10400007 */  beqz       $v0, .L80043EC0
/* 44AA4 80043EA4 26E268A8 */   addiu     $v0, $s7, 0x68a8
/* 44AA8 80043EA8 8C43204C */  lw         $v1, 0x204c($v0)
/* 44AAC 80043EAC 8C65076C */  lw         $a1, 0x76c($v1)
/* 44AB0 80043EB0 0C02626C */  jal        copy_string
/* 44AB4 80043EB4 27A40018 */   addiu     $a0, $sp, 0x18
/* 44AB8 80043EB8 08010FB4 */  j          .L80043ED0
/* 44ABC 80043EBC 00000000 */   nop
.L80043EC0:
/* 44AC0 80043EC0 8C43204C */  lw         $v1, 0x204c($v0)
/* 44AC4 80043EC4 8C650770 */  lw         $a1, 0x770($v1)
/* 44AC8 80043EC8 0C02626C */  jal        copy_string
/* 44ACC 80043ECC 27A40018 */   addiu     $a0, $sp, 0x18
.L80043ED0:
/* 44AD0 80043ED0 0C026259 */  jal        passToMalloc
/* 44AD4 80043ED4 2404007C */   addiu     $a0, $zero, 0x7c
/* 44AD8 80043ED8 00402021 */  addu       $a0, $v0, $zero
/* 44ADC 80043EDC 27A50018 */  addiu      $a1, $sp, 0x18
/* 44AE0 80043EE0 0C02DFC8 */  jal        widgetcliptext_init
/* 44AE4 80043EE4 24060190 */   addiu     $a2, $zero, 0x190
/* 44AE8 80043EE8 00408821 */  addu       $s1, $v0, $zero
/* 44AEC 80043EEC 8E440084 */  lw         $a0, 0x84($s2)
/* 44AF0 80043EF0 0C02E885 */  jal        link_widget_text
/* 44AF4 80043EF4 02202821 */   addu      $a1, $s1, $zero
/* 44AF8 80043EF8 08011010 */  j          .L80044040
/* 44AFC 80043EFC 24030001 */   addiu     $v1, $zero, 1
.L80043F00:
/* 44B00 80043F00 00008021 */  addu       $s0, $zero, $zero
/* 44B04 80043F04 3C02800E */  lui        $v0, %hi(D_800DCDE0)
/* 44B08 80043F08 2448CDE0 */  addiu      $t0, $v0, %lo(D_800DCDE0)
/* 44B0C 80043F0C 89050000 */  lwl        $a1, ($t0)
/* 44B10 80043F10 99050003 */  lwr        $a1, 3($t0)
/* 44B14 80043F14 81060004 */  lb         $a2, 4($t0)
/* 44B18 80043F18 ABA50118 */  swl        $a1, 0x118($sp)
/* 44B1C 80043F1C BBA5011B */  swr        $a1, 0x11b($sp)
/* 44B20 80043F20 A3A6011C */  sb         $a2, 0x11c($sp)
/* 44B24 80043F24 93A20118 */  lbu        $v0, 0x118($sp)
/* 44B28 80043F28 1040002D */  beqz       $v0, .L80043FE0
/* 44B2C 80043F2C 0080B021 */   addu      $s6, $a0, $zero
/* 44B30 80043F30 0043102B */  sltu       $v0, $v0, $v1
/* 44B34 80043F34 1040002A */  beqz       $v0, .L80043FE0
/* 44B38 80043F38 3C02800E */   lui       $v0, %hi(gGlobals)
/* 44B3C 80043F3C 245468A8 */  addiu      $s4, $v0, %lo(gGlobals)
/* 44B40 80043F40 00809821 */  addu       $s3, $a0, $zero
.L80043F44:
/* 44B44 80043F44 8E420088 */  lw         $v0, 0x88($s2)
/* 44B48 80043F48 10400008 */  beqz       $v0, .L80043F6C
/* 44B4C 80043F4C 00901021 */   addu      $v0, $a0, $s0
/* 44B50 80043F50 8E83204C */  lw         $v1, 0x204c($s4)
/* 44B54 80043F54 90460000 */  lbu        $a2, ($v0)
/* 44B58 80043F58 8C650774 */  lw         $a1, 0x774($v1)
/* 44B5C 80043F5C 0C0333AC */  jal        sprintf
/* 44B60 80043F60 27A40018 */   addiu     $a0, $sp, 0x18
/* 44B64 80043F64 08010FE1 */  j          .L80043F84
/* 44B68 80043F68 00000000 */   nop
.L80043F6C:
/* 44B6C 80043F6C 02D01021 */  addu       $v0, $s6, $s0
/* 44B70 80043F70 8E83204C */  lw         $v1, 0x204c($s4)
/* 44B74 80043F74 90460000 */  lbu        $a2, ($v0)
/* 44B78 80043F78 8C650778 */  lw         $a1, 0x778($v1)
/* 44B7C 80043F7C 0C0333AC */  jal        sprintf
/* 44B80 80043F80 27A40018 */   addiu     $a0, $sp, 0x18
.L80043F84:
/* 44B84 80043F84 0C026259 */  jal        passToMalloc
/* 44B88 80043F88 2404007C */   addiu     $a0, $zero, 0x7c
/* 44B8C 80043F8C 00402021 */  addu       $a0, $v0, $zero
/* 44B90 80043F90 27A50018 */  addiu      $a1, $sp, 0x18
/* 44B94 80043F94 0C02DFC8 */  jal        widgetcliptext_init
/* 44B98 80043F98 24060190 */   addiu     $a2, $zero, 0x190
/* 44B9C 80043F9C 00408821 */  addu       $s1, $v0, $zero
/* 44BA0 80043FA0 8E440084 */  lw         $a0, 0x84($s2)
/* 44BA4 80043FA4 0C02E885 */  jal        link_widget_text
/* 44BA8 80043FA8 02202821 */   addu      $a1, $s1, $zero
/* 44BAC 80043FAC 02701821 */  addu       $v1, $s3, $s0
/* 44BB0 80043FB0 26020001 */  addiu      $v0, $s0, 1
/* 44BB4 80043FB4 305000FF */  andi       $s0, $v0, 0xff
/* 44BB8 80043FB8 90640000 */  lbu        $a0, ($v1)
/* 44BBC 80043FBC 02701021 */  addu       $v0, $s3, $s0
/* 44BC0 80043FC0 A224005C */  sb         $a0, 0x5c($s1)
/* 44BC4 80043FC4 90430000 */  lbu        $v1, ($v0)
/* 44BC8 80043FC8 50600006 */  beql       $v1, $zero, .L80043FE4
/* 44BCC 80043FCC 8E420088 */   lw        $v0, 0x88($s2)
/* 44BD0 80043FD0 9242008C */  lbu        $v0, 0x8c($s2)
/* 44BD4 80043FD4 0062102B */  sltu       $v0, $v1, $v0
/* 44BD8 80043FD8 1440FFDA */  bnez       $v0, .L80043F44
/* 44BDC 80043FDC 02C02021 */   addu      $a0, $s6, $zero
.L80043FE0:
/* 44BE0 80043FE0 8E420088 */  lw         $v0, 0x88($s2)
.L80043FE4:
/* 44BE4 80043FE4 10400007 */  beqz       $v0, .L80044004
/* 44BE8 80043FE8 26E268A8 */   addiu     $v0, $s7, 0x68a8
/* 44BEC 80043FEC 8C43204C */  lw         $v1, 0x204c($v0)
/* 44BF0 80043FF0 8C65077C */  lw         $a1, 0x77c($v1)
/* 44BF4 80043FF4 0C02626C */  jal        copy_string
/* 44BF8 80043FF8 27A40018 */   addiu     $a0, $sp, 0x18
/* 44BFC 80043FFC 08011005 */  j          .L80044014
/* 44C00 80044000 00000000 */   nop
.L80044004:
/* 44C04 80044004 8C43204C */  lw         $v1, 0x204c($v0)
/* 44C08 80044008 8C650780 */  lw         $a1, 0x780($v1)
/* 44C0C 8004400C 0C02626C */  jal        copy_string
/* 44C10 80044010 27A40018 */   addiu     $a0, $sp, 0x18
.L80044014:
/* 44C14 80044014 0C026259 */  jal        passToMalloc
/* 44C18 80044018 2404007C */   addiu     $a0, $zero, 0x7c
/* 44C1C 8004401C 00402021 */  addu       $a0, $v0, $zero
/* 44C20 80044020 27A50018 */  addiu      $a1, $sp, 0x18
/* 44C24 80044024 0C02DFC8 */  jal        widgetcliptext_init
/* 44C28 80044028 24060190 */   addiu     $a2, $zero, 0x190
/* 44C2C 8004402C 00408821 */  addu       $s1, $v0, $zero
/* 44C30 80044030 8E440084 */  lw         $a0, 0x84($s2)
/* 44C34 80044034 0C02E885 */  jal        link_widget_text
/* 44C38 80044038 02202821 */   addu      $a1, $s1, $zero
/* 44C3C 8004403C 9243008C */  lbu        $v1, 0x8c($s2)
.L80044040:
/* 44C40 80044040 A223005C */  sb         $v1, 0x5c($s1)
/* 44C44 80044044 8E450084 */  lw         $a1, 0x84($s2)
/* 44C48 80044048 8CA30078 */  lw         $v1, 0x78($a1)
/* 44C4C 8004404C 84640028 */  lh         $a0, 0x28($v1)
/* 44C50 80044050 8C62002C */  lw         $v0, 0x2c($v1)
/* 44C54 80044054 0040F809 */  jalr       $v0
/* 44C58 80044058 00A42021 */   addu      $a0, $a1, $a0
/* 44C5C 8004405C 8EA30078 */  lw         $v1, 0x78($s5)
/* 44C60 80044060 84640020 */  lh         $a0, 0x20($v1)
/* 44C64 80044064 8C620024 */  lw         $v0, 0x24($v1)
/* 44C68 80044068 0040F809 */  jalr       $v0
/* 44C6C 8004406C 02A42021 */   addu      $a0, $s5, $a0
/* 44C70 80044070 8E430084 */  lw         $v1, 0x84($s2)
/* 44C74 80044074 8C650078 */  lw         $a1, 0x78($v1)
/* 44C78 80044078 00408821 */  addu       $s1, $v0, $zero
/* 44C7C 8004407C 84A40020 */  lh         $a0, 0x20($a1)
/* 44C80 80044080 8CA60024 */  lw         $a2, 0x24($a1)
/* 44C84 80044084 00C0F809 */  jalr       $a2
/* 44C88 80044088 00642021 */   addu      $a0, $v1, $a0
/* 44C8C 8004408C 24040050 */  addiu      $a0, $zero, 0x50
/* 44C90 80044090 24420008 */  addiu      $v0, $v0, 8
/* 44C94 80044094 02228821 */  addu       $s1, $s1, $v0
/* 44C98 80044098 3231FFFF */  andi       $s1, $s1, 0xffff
/* 44C9C 8004409C 241000F0 */  addiu      $s0, $zero, 0xf0
/* 44CA0 800440A0 02118023 */  subu       $s0, $s0, $s1
/* 44CA4 800440A4 001017C2 */  srl        $v0, $s0, 0x1f
/* 44CA8 800440A8 02028021 */  addu       $s0, $s0, $v0
/* 44CAC 800440AC 00108043 */  sra        $s0, $s0, 1
/* 44CB0 800440B0 3210FFFF */  andi       $s0, $s0, 0xffff
/* 44CB4 800440B4 2605FFFC */  addiu      $a1, $s0, -4
/* 44CB8 800440B8 00052C00 */  sll        $a1, $a1, 0x10
/* 44CBC 800440BC 00052C03 */  sra        $a1, $a1, 0x10
/* 44CC0 800440C0 240600F0 */  addiu      $a2, $zero, 0xf0
/* 44CC4 800440C4 02118821 */  addu       $s1, $s0, $s1
/* 44CC8 800440C8 26310004 */  addiu      $s1, $s1, 4
/* 44CCC 800440CC 00118C00 */  sll        $s1, $s1, 0x10
/* 44CD0 800440D0 0C0129D4 */  jal        func_8004A750
/* 44CD4 800440D4 00113C03 */   sra       $a3, $s1, 0x10
/* 44CD8 800440D8 02A02021 */  addu       $a0, $s5, $zero
/* 44CDC 800440DC 24050050 */  addiu      $a1, $zero, 0x50
/* 44CE0 800440E0 02003021 */  addu       $a2, $s0, $zero
/* 44CE4 800440E4 0C02DD3F */  jal        set_widget_coords
/* 44CE8 800440E8 AE420080 */   sw        $v0, 0x80($s2)
/* 44CEC 800440EC 8EA30078 */  lw         $v1, 0x78($s5)
/* 44CF0 800440F0 84640020 */  lh         $a0, 0x20($v1)
/* 44CF4 800440F4 8C620024 */  lw         $v0, 0x24($v1)
/* 44CF8 800440F8 0040F809 */  jalr       $v0
/* 44CFC 800440FC 02A42021 */   addu      $a0, $s5, $a0
/* 44D00 80044100 24050050 */  addiu      $a1, $zero, 0x50
/* 44D04 80044104 02028021 */  addu       $s0, $s0, $v0
/* 44D08 80044108 8E440084 */  lw         $a0, 0x84($s2)
/* 44D0C 8004410C 0C02DD3F */  jal        set_widget_coords
/* 44D10 80044110 26060008 */   addiu     $a2, $s0, 8
/* 44D14 80044114 8E450080 */  lw         $a1, 0x80($s2)
/* 44D18 80044118 0C02DEDC */  jal        link_widgets
/* 44D1C 8004411C 02402021 */   addu      $a0, $s2, $zero
/* 44D20 80044120 02402021 */  addu       $a0, $s2, $zero
/* 44D24 80044124 0C02DEDC */  jal        link_widgets
/* 44D28 80044128 02A02821 */   addu      $a1, $s5, $zero
/* 44D2C 8004412C 8E450084 */  lw         $a1, 0x84($s2)
/* 44D30 80044130 0C02DEDC */  jal        link_widgets
/* 44D34 80044134 02402021 */   addu      $a0, $s2, $zero
/* 44D38 80044138 02401021 */  addu       $v0, $s2, $zero
/* 44D3C 8004413C 8FBF0178 */  lw         $ra, 0x178($sp)
/* 44D40 80044140 8FB70174 */  lw         $s7, 0x174($sp)
/* 44D44 80044144 8FB60170 */  lw         $s6, 0x170($sp)
/* 44D48 80044148 8FB5016C */  lw         $s5, 0x16c($sp)
/* 44D4C 8004414C 8FB40168 */  lw         $s4, 0x168($sp)
/* 44D50 80044150 8FB30164 */  lw         $s3, 0x164($sp)
/* 44D54 80044154 8FB20160 */  lw         $s2, 0x160($sp)
/* 44D58 80044158 8FB1015C */  lw         $s1, 0x15c($sp)
/* 44D5C 8004415C 8FB00158 */  lw         $s0, 0x158($sp)
/* 44D60 80044160 03E00008 */  jr         $ra
/* 44D64 80044164 27BD0180 */   addiu     $sp, $sp, 0x180

glabel func_80044168
/* 44D68 80044168 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 44D6C 8004416C 00063400 */  sll        $a2, $a2, 0x10
/* 44D70 80044170 00073C00 */  sll        $a3, $a3, 0x10
/* 44D74 80044174 00063403 */  sra        $a2, $a2, 0x10
/* 44D78 80044178 87A20032 */  lh         $v0, 0x32($sp)
/* 44D7C 8004417C 87A30036 */  lh         $v1, 0x36($sp)
/* 44D80 80044180 00073C03 */  sra        $a3, $a3, 0x10
/* 44D84 80044184 AFBF0018 */  sw         $ra, 0x18($sp)
/* 44D88 80044188 AFA20010 */  sw         $v0, 0x10($sp)
/* 44D8C 8004418C 0C02DE14 */  jal        widget_func_8
/* 44D90 80044190 AFA30014 */   sw        $v1, 0x14($sp)
/* 44D94 80044194 8FBF0018 */  lw         $ra, 0x18($sp)
/* 44D98 80044198 03E00008 */  jr         $ra
/* 44D9C 8004419C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800441A0
/* 44DA0 800441A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 44DA4 800441A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 44DA8 800441A8 0C02DE51 */  jal        func_800B7944
/* 44DAC 800441AC 00000000 */   nop
/* 44DB0 800441B0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 44DB4 800441B4 03E00008 */  jr         $ra
/* 44DB8 800441B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800441BC
/* 44DBC 800441BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 44DC0 800441C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 44DC4 800441C4 8C850084 */  lw         $a1, 0x84($a0)
/* 44DC8 800441C8 8CA30078 */  lw         $v1, 0x78($a1)
/* 44DCC 800441CC 84640058 */  lh         $a0, 0x58($v1)
/* 44DD0 800441D0 8C62005C */  lw         $v0, 0x5c($v1)
/* 44DD4 800441D4 0040F809 */  jalr       $v0
/* 44DD8 800441D8 00A42021 */   addu      $a0, $a1, $a0
/* 44DDC 800441DC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 44DE0 800441E0 03E00008 */  jr         $ra
/* 44DE4 800441E4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800441E8
/* 44DE8 800441E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 44DEC 800441EC AFBF0010 */  sw         $ra, 0x10($sp)
/* 44DF0 800441F0 8C850084 */  lw         $a1, 0x84($a0)
/* 44DF4 800441F4 8CA30078 */  lw         $v1, 0x78($a1)
/* 44DF8 800441F8 84640060 */  lh         $a0, 0x60($v1)
/* 44DFC 800441FC 8C620064 */  lw         $v0, 0x64($v1)
/* 44E00 80044200 0040F809 */  jalr       $v0
/* 44E04 80044204 00A42021 */   addu      $a0, $a1, $a0
/* 44E08 80044208 8FBF0010 */  lw         $ra, 0x10($sp)
/* 44E0C 8004420C 03E00008 */  jr         $ra
/* 44E10 80044210 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_adding_gold
/* 44E14 80044214 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 44E18 80044218 AFB3001C */  sw         $s3, 0x1c($sp)
/* 44E1C 8004421C 00809821 */  addu       $s3, $a0, $zero
/* 44E20 80044220 AFBF0020 */  sw         $ra, 0x20($sp)
/* 44E24 80044224 AFB20018 */  sw         $s2, 0x18($sp)
/* 44E28 80044228 AFB10014 */  sw         $s1, 0x14($sp)
/* 44E2C 8004422C AFB00010 */  sw         $s0, 0x10($sp)
/* 44E30 80044230 8E630084 */  lw         $v1, 0x84($s3)
/* 44E34 80044234 8C650078 */  lw         $a1, 0x78($v1)
/* 44E38 80044238 3C02800E */  lui        $v0, %hi(gGlobals)
/* 44E3C 8004423C 84A40078 */  lh         $a0, 0x78($a1)
/* 44E40 80044240 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 44E44 80044244 00642021 */  addu       $a0, $v1, $a0
/* 44E48 80044248 8E4314CC */  lw         $v1, 0x14cc($s2)
/* 44E4C 8004424C 8CA2007C */  lw         $v0, 0x7c($a1)
/* 44E50 80044250 0040F809 */  jalr       $v0
/* 44E54 80044254 8C710040 */   lw        $s1, 0x40($v1)
/* 44E58 80044258 00408021 */  addu       $s0, $v0, $zero
/* 44E5C 8004425C 9202005C */  lbu        $v0, 0x5c($s0)
/* 44E60 80044260 50400027 */  beql       $v0, $zero, .L80044300
/* 44E64 80044264 8E220004 */   lw        $v0, 4($s1)
/* 44E68 80044268 8E4215F8 */  lw         $v0, 0x15f8($s2)
/* 44E6C 8004426C 8C470010 */  lw         $a3, 0x10($v0)
/* 44E70 80044270 9665005E */  lhu        $a1, 0x5e($s3)
/* 44E74 80044274 8CE30000 */  lw         $v1, ($a3)
/* 44E78 80044278 9206005C */  lbu        $a2, 0x5c($s0)
/* 44E7C 8004427C 84640038 */  lh         $a0, 0x38($v1)
/* 44E80 80044280 8C62003C */  lw         $v0, 0x3c($v1)
/* 44E84 80044284 0040F809 */  jalr       $v0
/* 44E88 80044288 00E42021 */   addu      $a0, $a3, $a0
/* 44E8C 8004428C 9206005C */  lbu        $a2, 0x5c($s0)
/* 44E90 80044290 8E630088 */  lw         $v1, 0x88($s3)
/* 44E94 80044294 9665005E */  lhu        $a1, 0x5e($s3)
/* 44E98 80044298 8E240004 */  lw         $a0, 4($s1)
/* 44E9C 8004429C 00660018 */  mult       $v1, $a2
/* 44EA0 800442A0 8E4715F8 */  lw         $a3, 0x15f8($s2)
/* 44EA4 800442A4 8C860088 */  lw         $a2, 0x88($a0)
/* 44EA8 800442A8 8CE20014 */  lw         $v0, 0x14($a3)
/* 44EAC 800442AC 8CC40094 */  lw         $a0, 0x94($a2)
/* 44EB0 800442B0 00001812 */  mflo       $v1
/* 44EB4 800442B4 00431021 */  addu       $v0, $v0, $v1
/* 44EB8 800442B8 ACE20014 */  sw         $v0, 0x14($a3)
/* 44EBC 800442BC 9206005C */  lbu        $a2, 0x5c($s0)
/* 44EC0 800442C0 0C00F419 */  jal        func_8003D064
/* 44EC4 800442C4 240700FF */   addiu     $a3, $zero, 0xff
/* 44EC8 800442C8 8E230004 */  lw         $v1, 4($s1)
/* 44ECC 800442CC 8C620088 */  lw         $v0, 0x88($v1)
/* 44ED0 800442D0 8C450094 */  lw         $a1, 0x94($v0)
/* 44ED4 800442D4 8CA30078 */  lw         $v1, 0x78($a1)
/* 44ED8 800442D8 84640028 */  lh         $a0, 0x28($v1)
/* 44EDC 800442DC 8C62002C */  lw         $v0, 0x2c($v1)
/* 44EE0 800442E0 0040F809 */  jalr       $v0
/* 44EE4 800442E4 00A42021 */   addu      $a0, $a1, $a0
/* 44EE8 800442E8 8E230004 */  lw         $v1, 4($s1)
/* 44EEC 800442EC 8C620088 */  lw         $v0, 0x88($v1)
/* 44EF0 800442F0 8C450094 */  lw         $a1, 0x94($v0)
/* 44EF4 800442F4 0C00BFCC */  jal        func_8002FF30
/* 44EF8 800442F8 8CA40080 */   lw        $a0, 0x80($a1)
/* 44EFC 800442FC 8E220004 */  lw         $v0, 4($s1)
.L80044300:
/* 44F00 80044300 8C430080 */  lw         $v1, 0x80($v0)
/* 44F04 80044304 0C02EEBC */  jal        func_800BBAF0
/* 44F08 80044308 8C640080 */   lw        $a0, 0x80($v1)
/* 44F0C 8004430C 00402021 */  addu       $a0, $v0, $zero
/* 44F10 80044310 8E4315F8 */  lw         $v1, 0x15f8($s2)
/* 44F14 80044314 3C05800E */  lui        $a1, %hi(D_800DCDE8)
/* 44F18 80044318 8C660014 */  lw         $a2, 0x14($v1)
/* 44F1C 8004431C 0C0333AC */  jal        sprintf
/* 44F20 80044320 24A5CDE8 */   addiu     $a1, $a1, %lo(D_800DCDE8)
/* 44F24 80044324 8E230004 */  lw         $v1, 4($s1)
/* 44F28 80044328 0C0112A5 */  jal        func_80044A94
/* 44F2C 8004432C 8C640090 */   lw        $a0, 0x90($v1)
/* 44F30 80044330 8E220004 */  lw         $v0, 4($s1)
/* 44F34 80044334 0C011219 */  jal        func_with_gold
/* 44F38 80044338 8C440090 */   lw        $a0, 0x90($v0)
/* 44F3C 8004433C 02602021 */  addu       $a0, $s3, $zero
/* 44F40 80044340 0C02DEC8 */  jal        set_widgets_byte0x70
/* 44F44 80044344 24050005 */   addiu     $a1, $zero, 5
/* 44F48 80044348 8FBF0020 */  lw         $ra, 0x20($sp)
/* 44F4C 8004434C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 44F50 80044350 8FB20018 */  lw         $s2, 0x18($sp)
/* 44F54 80044354 8FB10014 */  lw         $s1, 0x14($sp)
/* 44F58 80044358 8FB00010 */  lw         $s0, 0x10($sp)
/* 44F5C 8004435C 00001021 */  addu       $v0, $zero, $zero
/* 44F60 80044360 03E00008 */  jr         $ra
/* 44F64 80044364 27BD0028 */   addiu     $sp, $sp, 0x28

glabel ret12_80044368
/* 44F68 80044368 03E00008 */  jr         $ra
/* 44F6C 8004436C 2402000C */   addiu     $v0, $zero, 0xc

glabel free_shop_inventory
/* 44F70 80044370 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 44F74 80044374 AFB20018 */  sw         $s2, 0x18($sp)
/* 44F78 80044378 00809021 */  addu       $s2, $a0, $zero
/* 44F7C 8004437C 3C02800E */  lui        $v0, %hi(widget_methods_barter)
/* 44F80 80044380 2442CED8 */  addiu      $v0, $v0, %lo(widget_methods_barter)
/* 44F84 80044384 3C03800E */  lui        $v1, %hi(someCase_1)
/* 44F88 80044388 AFB00010 */  sw         $s0, 0x10($sp)
/* 44F8C 8004438C 24707D6C */  addiu      $s0, $v1, %lo(someCase_1)
/* 44F90 80044390 AFBF001C */  sw         $ra, 0x1c($sp)
/* 44F94 80044394 AFB10014 */  sw         $s1, 0x14($sp)
/* 44F98 80044398 8E060028 */  lw         $a2, 0x28($s0)
/* 44F9C 8004439C 00A08821 */  addu       $s1, $a1, $zero
/* 44FA0 800443A0 10C00008 */  beqz       $a2, .L800443C4
/* 44FA4 800443A4 AE420078 */   sw        $v0, 0x78($s2)
/* 44FA8 800443A8 8CC20000 */  lw         $v0, ($a2)
/* 44FAC 800443AC 24050003 */  addiu      $a1, $zero, 3
/* 44FB0 800443B0 84440008 */  lh         $a0, 8($v0)
/* 44FB4 800443B4 8C43000C */  lw         $v1, 0xc($v0)
/* 44FB8 800443B8 0060F809 */  jalr       $v1
/* 44FBC 800443BC 00C42021 */   addu      $a0, $a2, $a0
/* 44FC0 800443C0 AE000028 */  sw         $zero, 0x28($s0)
.L800443C4:
/* 44FC4 800443C4 02402021 */  addu       $a0, $s2, $zero
/* 44FC8 800443C8 0C02E66C */  jal        widget_menu_free
/* 44FCC 800443CC 02202821 */   addu      $a1, $s1, $zero
/* 44FD0 800443D0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 44FD4 800443D4 8FB20018 */  lw         $s2, 0x18($sp)
/* 44FD8 800443D8 8FB10014 */  lw         $s1, 0x14($sp)
/* 44FDC 800443DC 8FB00010 */  lw         $s0, 0x10($sp)
/* 44FE0 800443E0 03E00008 */  jr         $ra
/* 44FE4 800443E4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel init_barter_widget
/* 44FE8 800443E8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 44FEC 800443EC AFB20030 */  sw         $s2, 0x30($sp)
/* 44FF0 800443F0 00809021 */  addu       $s2, $a0, $zero
/* 44FF4 800443F4 AFB00028 */  sw         $s0, 0x28($sp)
/* 44FF8 800443F8 00A08021 */  addu       $s0, $a1, $zero
/* 44FFC 800443FC AFB1002C */  sw         $s1, 0x2c($sp)
/* 45000 80044400 AFBF0034 */  sw         $ra, 0x34($sp)
/* 45004 80044404 0C02E658 */  jal        widget_menu_build
/* 45008 80044408 30D1FFFF */   andi      $s1, $a2, 0xffff
/* 4500C 8004440C 3C03800E */  lui        $v1, %hi(widget_methods_barter)
/* 45010 80044410 2463CED8 */  addiu      $v1, $v1, %lo(widget_methods_barter)
/* 45014 80044414 AE430078 */  sw         $v1, 0x78($s2)
/* 45018 80044418 3C03800F */  lui        $v1, %hi(partypicker)
/* 4501C 8004441C 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 45020 80044420 AE500084 */  sw         $s0, 0x84($s2)
/* 45024 80044424 24508920 */  addiu      $s0, $v0, %lo(gGlobalsText)
/* 45028 80044428 9067D550 */  lbu        $a3, %lo(partypicker)($v1)
/* 4502C 8004442C 02002021 */  addu       $a0, $s0, $zero
/* 45030 80044430 A651005E */  sh         $s1, 0x5e($s2)
/* 45034 80044434 3226FFFF */  andi       $a2, $s1, 0xffff
/* 45038 80044438 3C05800E */  lui        $a1, %hi(D_800DCEC0)
/* 4503C 8004443C 24A5CEC0 */  addiu      $a1, $a1, %lo(D_800DCEC0)
/* 45040 80044440 AE400080 */  sw         $zero, 0x80($s2)
/* 45044 80044444 AE400088 */  sw         $zero, 0x88($s2)
/* 45048 80044448 0C0333AC */  jal        sprintf
/* 4504C 8004444C A247007C */   sb        $a3, 0x7c($s2)
/* 45050 80044450 9643005E */  lhu        $v1, 0x5e($s2)
/* 45054 80044454 3402FFFF */  ori        $v0, $zero, 0xffff
/* 45058 80044458 54620006 */  bnel       $v1, $v0, .L80044474
/* 4505C 8004445C 00002821 */   addu      $a1, $zero, $zero
/* 45060 80044460 24020001 */  addiu      $v0, $zero, 1
/* 45064 80044464 3C03800F */  lui        $v1, %hi(barter_float)
/* 45068 80044468 A242008C */  sb         $v0, 0x8c($s2)
/* 4506C 8004446C 0801112C */  j          .L800444B0
/* 45070 80044470 AC60D5C0 */   sw        $zero, %lo(barter_float)($v1)
.L80044474:
/* 45074 80044474 9644005E */  lhu        $a0, 0x5e($s2)
/* 45078 80044478 00003021 */  addu       $a2, $zero, $zero
/* 4507C 8004447C 0C01D77A */  jal        GetIDIndex
/* 45080 80044480 A240008C */   sb        $zero, 0x8c($s2)
/* 45084 80044484 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 45088 80044488 8C6513A0 */  lw         $a1, %lo(EntityPointer)($v1)
/* 4508C 8004448C 000211C0 */  sll        $v0, $v0, 7
/* 45090 80044490 8CA30010 */  lw         $v1, 0x10($a1)
/* 45094 80044494 8E04F580 */  lw         $a0, -0xa80($s0)
/* 45098 80044498 00621821 */  addu       $v1, $v1, $v0
/* 4509C 8004449C 90650039 */  lbu        $a1, 0x39($v1)
/* 450A0 800444A0 0C01FFE5 */  jal        merchant_skill_check
/* 450A4 800444A4 90660027 */   lbu       $a2, 0x27($v1)
/* 450A8 800444A8 3C02800F */  lui        $v0, %hi(barter_float)
/* 450AC 800444AC E440D5C0 */  swc1       $f0, %lo(barter_float)($v0)
.L800444B0:
/* 450B0 800444B0 0C026259 */  jal        passToMalloc
/* 450B4 800444B4 2404007C */   addiu     $a0, $zero, 0x7c
/* 450B8 800444B8 240400E4 */  addiu      $a0, $zero, 0xe4
/* 450BC 800444BC 0C0290E2 */  jal        get_borg_8
/* 450C0 800444C0 00408021 */   addu      $s0, $v0, $zero
/* 450C4 800444C4 02002021 */  addu       $a0, $s0, $zero
/* 450C8 800444C8 0C02E518 */  jal        borg8_widget
/* 450CC 800444CC 00402821 */   addu      $a1, $v0, $zero
/* 450D0 800444D0 00408021 */  addu       $s0, $v0, $zero
/* 450D4 800444D4 02002021 */  addu       $a0, $s0, $zero
/* 450D8 800444D8 24050014 */  addiu      $a1, $zero, 0x14
/* 450DC 800444DC 0C02DD3F */  jal        set_widget_coords
/* 450E0 800444E0 2406003E */   addiu     $a2, $zero, 0x3e
/* 450E4 800444E4 02002021 */  addu       $a0, $s0, $zero
/* 450E8 800444E8 24050005 */  addiu      $a1, $zero, 5
/* 450EC 800444EC 0C02DD3F */  jal        set_widget_coords
/* 450F0 800444F0 2406003C */   addiu     $a2, $zero, 0x3c
/* 450F4 800444F4 02402021 */  addu       $a0, $s2, $zero
/* 450F8 800444F8 0C02DEDC */  jal        link_widgets
/* 450FC 800444FC 02002821 */   addu      $a1, $s0, $zero
/* 45100 80044500 0C026259 */  jal        passToMalloc
/* 45104 80044504 2404007C */   addiu     $a0, $zero, 0x7c
/* 45108 80044508 240400E2 */  addiu      $a0, $zero, 0xe2
/* 4510C 8004450C 0C0290E2 */  jal        get_borg_8
/* 45110 80044510 00408021 */   addu      $s0, $v0, $zero
/* 45114 80044514 02002021 */  addu       $a0, $s0, $zero
/* 45118 80044518 0C02E518 */  jal        borg8_widget
/* 4511C 8004451C 00402821 */   addu      $a1, $v0, $zero
/* 45120 80044520 00402021 */  addu       $a0, $v0, $zero
/* 45124 80044524 24050014 */  addiu      $a1, $zero, 0x14
/* 45128 80044528 2406003E */  addiu      $a2, $zero, 0x3e
/* 4512C 8004452C 0C02DD3F */  jal        set_widget_coords
/* 45130 80044530 AE420090 */   sw        $v0, 0x90($s2)
/* 45134 80044534 00002821 */  addu       $a1, $zero, $zero
/* 45138 80044538 8E440090 */  lw         $a0, 0x90($s2)
/* 4513C 8004453C 0C02DD3F */  jal        set_widget_coords
/* 45140 80044540 2406003A */   addiu     $a2, $zero, 0x3a
/* 45144 80044544 8E450090 */  lw         $a1, 0x90($s2)
/* 45148 80044548 0C02DEDC */  jal        link_widgets
/* 4514C 8004454C 02402021 */   addu      $a0, $s2, $zero
/* 45150 80044550 9243008C */  lbu        $v1, 0x8c($s2)
/* 45154 80044554 24020001 */  addiu      $v0, $zero, 1
/* 45158 80044558 14620005 */  bne        $v1, $v0, .L80044570
/* 4515C 8004455C 00000000 */   nop
/* 45160 80044560 0C026259 */  jal        passToMalloc
/* 45164 80044564 2404007C */   addiu     $a0, $zero, 0x7c
/* 45168 80044568 0801115F */  j          .L8004457C
/* 4516C 8004456C 240400F0 */   addiu     $a0, $zero, 0xf0
.L80044570:
/* 45170 80044570 0C026259 */  jal        passToMalloc
/* 45174 80044574 2404007C */   addiu     $a0, $zero, 0x7c
/* 45178 80044578 240400E7 */  addiu      $a0, $zero, 0xe7
.L8004457C:
/* 4517C 8004457C 0C0290E2 */  jal        get_borg_8
/* 45180 80044580 00408021 */   addu      $s0, $v0, $zero
/* 45184 80044584 02002021 */  addu       $a0, $s0, $zero
/* 45188 80044588 0C02E518 */  jal        borg8_widget
/* 4518C 8004458C 00402821 */   addu      $a1, $v0, $zero
/* 45190 80044590 00408821 */  addu       $s1, $v0, $zero
/* 45194 80044594 8E230078 */  lw         $v1, 0x78($s1)
/* 45198 80044598 84640018 */  lh         $a0, 0x18($v1)
/* 4519C 8004459C 8C62001C */  lw         $v0, 0x1c($v1)
/* 451A0 800445A0 0040F809 */  jalr       $v0
/* 451A4 800445A4 02242021 */   addu      $a0, $s1, $a0
/* 451A8 800445A8 00021042 */  srl        $v0, $v0, 1
/* 451AC 800445AC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 451B0 800445B0 2410005A */  addiu      $s0, $zero, 0x5a
/* 451B4 800445B4 8E250078 */  lw         $a1, 0x78($s1)
/* 451B8 800445B8 02028023 */  subu       $s0, $s0, $v0
/* 451BC 800445BC 84A40020 */  lh         $a0, 0x20($a1)
/* 451C0 800445C0 8CA30024 */  lw         $v1, 0x24($a1)
/* 451C4 800445C4 0060F809 */  jalr       $v1
/* 451C8 800445C8 02242021 */   addu      $a0, $s1, $a0
/* 451CC 800445CC 02202021 */  addu       $a0, $s1, $zero
/* 451D0 800445D0 02002821 */  addu       $a1, $s0, $zero
/* 451D4 800445D4 24060055 */  addiu      $a2, $zero, 0x55
/* 451D8 800445D8 0C02DD3F */  jal        set_widget_coords
/* 451DC 800445DC 00C23023 */   subu      $a2, $a2, $v0
/* 451E0 800445E0 02402021 */  addu       $a0, $s2, $zero
/* 451E4 800445E4 0C02DEDC */  jal        link_widgets
/* 451E8 800445E8 02202821 */   addu      $a1, $s1, $zero
/* 451EC 800445EC 0C026259 */  jal        passToMalloc
/* 451F0 800445F0 2404009C */   addiu     $a0, $zero, 0x9c
/* 451F4 800445F4 00402021 */  addu       $a0, $v0, $zero
/* 451F8 800445F8 3C10800E */  lui        $s0, %hi(gGlobals)
/* 451FC 800445FC 260268A8 */  addiu      $v0, $s0, %lo(gGlobals)
/* 45200 80044600 8C4514EC */  lw         $a1, 0x14ec($v0)
/* 45204 80044604 0C00F20E */  jal        some_inventory_menu_struct
/* 45208 80044608 00003021 */   addu      $a2, $zero, $zero
/* 4520C 8004460C 00402021 */  addu       $a0, $v0, $zero
/* 45210 80044610 24050014 */  addiu      $a1, $zero, 0x14
/* 45214 80044614 24060058 */  addiu      $a2, $zero, 0x58
/* 45218 80044618 0C02DD3F */  jal        set_widget_coords
/* 4521C 8004461C AE420080 */   sw        $v0, 0x80($s2)
/* 45220 80044620 8E450080 */  lw         $a1, 0x80($s2)
/* 45224 80044624 0C02DEDC */  jal        link_widgets
/* 45228 80044628 02402021 */   addu      $a0, $s2, $zero
/* 4522C 8004462C 0C026259 */  jal        passToMalloc
/* 45230 80044630 2404007C */   addiu     $a0, $zero, 0x7c
/* 45234 80044634 00402021 */  addu       $a0, $v0, $zero
/* 45238 80044638 00002821 */  addu       $a1, $zero, $zero
/* 4523C 8004463C 0C02DFC8 */  jal        widgetcliptext_init
/* 45240 80044640 2406000A */   addiu     $a2, $zero, 0xa
/* 45244 80044644 24050082 */  addiu      $a1, $zero, 0x82
/* 45248 80044648 24060050 */  addiu      $a2, $zero, 0x50
/* 4524C 8004464C 8C480078 */  lw         $t0, 0x78($v0)
/* 45250 80044650 24070050 */  addiu      $a3, $zero, 0x50
/* 45254 80044654 AE420094 */  sw         $v0, 0x94($s2)
/* 45258 80044658 85040048 */  lh         $a0, 0x48($t0)
/* 4525C 8004465C 241100FF */  addiu      $s1, $zero, 0xff
/* 45260 80044660 AFB10010 */  sw         $s1, 0x10($sp)
/* 45264 80044664 8D03004C */  lw         $v1, 0x4c($t0)
/* 45268 80044668 0060F809 */  jalr       $v1
/* 4526C 8004466C 00442021 */   addu      $a0, $v0, $a0
/* 45270 80044670 2405001E */  addiu      $a1, $zero, 0x1e
/* 45274 80044674 8E440094 */  lw         $a0, 0x94($s2)
/* 45278 80044678 0C02DD3F */  jal        set_widget_coords
/* 4527C 8004467C 240600A9 */   addiu     $a2, $zero, 0xa9
/* 45280 80044680 8E450094 */  lw         $a1, 0x94($s2)
/* 45284 80044684 0C02DEDC */  jal        link_widgets
/* 45288 80044688 02402021 */   addu      $a0, $s2, $zero
/* 4528C 8004468C 8E440080 */  lw         $a0, 0x80($s2)
/* 45290 80044690 24020014 */  addiu      $v0, $zero, 0x14
/* 45294 80044694 8C850080 */  lw         $a1, 0x80($a0)
/* 45298 80044698 2403009D */  addiu      $v1, $zero, 0x9d
/* 4529C 8004469C A4820064 */  sh         $v0, 0x64($a0)
/* 452A0 800446A0 24020058 */  addiu      $v0, $zero, 0x58
/* 452A4 800446A4 A4830066 */  sh         $v1, 0x66($a0)
/* 452A8 800446A8 A4820068 */  sh         $v0, 0x68($a0)
/* 452AC 800446AC 8CA30078 */  lw         $v1, 0x78($a1)
/* 452B0 800446B0 240200A6 */  addiu      $v0, $zero, 0xa6
/* 452B4 800446B4 A482006A */  sh         $v0, 0x6a($a0)
/* 452B8 800446B8 84640078 */  lh         $a0, 0x78($v1)
/* 452BC 800446BC 8C62007C */  lw         $v0, 0x7c($v1)
/* 452C0 800446C0 0040F809 */  jalr       $v0
/* 452C4 800446C4 00A42021 */   addu      $a0, $a1, $a0
/* 452C8 800446C8 10400022 */  beqz       $v0, .L80044754
/* 452CC 800446CC 24050044 */   addiu     $a1, $zero, 0x44
/* 452D0 800446D0 2406002A */  addiu      $a2, $zero, 0x2a
/* 452D4 800446D4 24020097 */  addiu      $v0, $zero, 0x97
/* 452D8 800446D8 2403008D */  addiu      $v1, $zero, 0x8d
/* 452DC 800446DC AFA20014 */  sw         $v0, 0x14($sp)
/* 452E0 800446E0 240200BF */  addiu      $v0, $zero, 0xbf
/* 452E4 800446E4 AFB10010 */  sw         $s1, 0x10($sp)
/* 452E8 800446E8 AFA30018 */  sw         $v1, 0x18($sp)
/* 452EC 800446EC AFA2001C */  sw         $v0, 0x1c($sp)
/* 452F0 800446F0 AFB10020 */  sw         $s1, 0x20($sp)
/* 452F4 800446F4 8E430080 */  lw         $v1, 0x80($s2)
/* 452F8 800446F8 24020014 */  addiu      $v0, $zero, 0x14
/* 452FC 800446FC AFA20024 */  sw         $v0, 0x24($sp)
/* 45300 80044700 8C640080 */  lw         $a0, 0x80($v1)
/* 45304 80044704 24070022 */  addiu      $a3, $zero, 0x22
/* 45308 80044708 0C00C0A0 */  jal        func_80030280
/* 4530C 8004470C AE430088 */   sw        $v1, 0x88($s2)
/* 45310 80044710 24050082 */  addiu      $a1, $zero, 0x82
/* 45314 80044714 24060050 */  addiu      $a2, $zero, 0x50
/* 45318 80044718 24020082 */  addiu      $v0, $zero, 0x82
/* 4531C 8004471C 24030050 */  addiu      $v1, $zero, 0x50
/* 45320 80044720 AFB10010 */  sw         $s1, 0x10($sp)
/* 45324 80044724 AFA20014 */  sw         $v0, 0x14($sp)
/* 45328 80044728 AFA30018 */  sw         $v1, 0x18($sp)
/* 4532C 8004472C AFA3001C */  sw         $v1, 0x1c($sp)
/* 45330 80044730 AFB10020 */  sw         $s1, 0x20($sp)
/* 45334 80044734 8E430084 */  lw         $v1, 0x84($s2)
/* 45338 80044738 24020001 */  addiu      $v0, $zero, 1
/* 4533C 8004473C AFA20024 */  sw         $v0, 0x24($sp)
/* 45340 80044740 8C640080 */  lw         $a0, 0x80($v1)
/* 45344 80044744 0C00C0A0 */  jal        func_80030280
/* 45348 80044748 24070050 */   addiu     $a3, $zero, 0x50
/* 4534C 8004474C 080111F7 */  j          .L800447DC
/* 45350 80044750 9243008C */   lbu       $v1, 0x8c($s2)
.L80044754:
/* 45354 80044754 24050082 */  addiu      $a1, $zero, 0x82
/* 45358 80044758 24060050 */  addiu      $a2, $zero, 0x50
/* 4535C 8004475C 24020082 */  addiu      $v0, $zero, 0x82
/* 45360 80044760 24030050 */  addiu      $v1, $zero, 0x50
/* 45364 80044764 AFB10010 */  sw         $s1, 0x10($sp)
/* 45368 80044768 AFA20014 */  sw         $v0, 0x14($sp)
/* 4536C 8004476C AFA30018 */  sw         $v1, 0x18($sp)
/* 45370 80044770 AFA3001C */  sw         $v1, 0x1c($sp)
/* 45374 80044774 AFB10020 */  sw         $s1, 0x20($sp)
/* 45378 80044778 8E430080 */  lw         $v1, 0x80($s2)
/* 4537C 8004477C 24020001 */  addiu      $v0, $zero, 1
/* 45380 80044780 AFA20024 */  sw         $v0, 0x24($sp)
/* 45384 80044784 8E420084 */  lw         $v0, 0x84($s2)
/* 45388 80044788 8C640080 */  lw         $a0, 0x80($v1)
/* 4538C 8004478C 24070050 */  addiu      $a3, $zero, 0x50
/* 45390 80044790 0C00C0A0 */  jal        func_80030280
/* 45394 80044794 AE420088 */   sw        $v0, 0x88($s2)
/* 45398 80044798 24050044 */  addiu      $a1, $zero, 0x44
/* 4539C 8004479C 2406002A */  addiu      $a2, $zero, 0x2a
/* 453A0 800447A0 24020097 */  addiu      $v0, $zero, 0x97
/* 453A4 800447A4 2403008D */  addiu      $v1, $zero, 0x8d
/* 453A8 800447A8 AFA20014 */  sw         $v0, 0x14($sp)
/* 453AC 800447AC 240200BF */  addiu      $v0, $zero, 0xbf
/* 453B0 800447B0 AFB10010 */  sw         $s1, 0x10($sp)
/* 453B4 800447B4 AFA30018 */  sw         $v1, 0x18($sp)
/* 453B8 800447B8 AFA2001C */  sw         $v0, 0x1c($sp)
/* 453BC 800447BC AFB10020 */  sw         $s1, 0x20($sp)
/* 453C0 800447C0 8E430084 */  lw         $v1, 0x84($s2)
/* 453C4 800447C4 24020014 */  addiu      $v0, $zero, 0x14
/* 453C8 800447C8 AFA20024 */  sw         $v0, 0x24($sp)
/* 453CC 800447CC 8C640080 */  lw         $a0, 0x80($v1)
/* 453D0 800447D0 0C00C0A0 */  jal        func_80030280
/* 453D4 800447D4 24070022 */   addiu     $a3, $zero, 0x22
/* 453D8 800447D8 9243008C */  lbu        $v1, 0x8c($s2)
.L800447DC:
/* 453DC 800447DC 24020001 */  addiu      $v0, $zero, 1
/* 453E0 800447E0 1462000C */  bne        $v1, $v0, .L80044814
/* 453E4 800447E4 261068A8 */   addiu     $s0, $s0, 0x68a8
/* 453E8 800447E8 8E0214F4 */  lw         $v0, 0x14f4($s0)
/* 453EC 800447EC 10400009 */  beqz       $v0, .L80044814
/* 453F0 800447F0 2405072D */   addiu     $a1, $zero, 0x72d
/* 453F4 800447F4 260412F8 */  addiu      $a0, $s0, 0x12f8
/* 453F8 800447F8 00003021 */  addu       $a2, $zero, $zero
/* 453FC 800447FC 2402012C */  addiu      $v0, $zero, 0x12c
/* 45400 80044800 8E072054 */  lw         $a3, 0x2054($s0)
/* 45404 80044804 2403003C */  addiu      $v1, $zero, 0x3c
/* 45408 80044808 AFA20010 */  sw         $v0, 0x10($sp)
/* 4540C 8004480C 0C0156F4 */  jal        play_SFX
/* 45410 80044810 AFA30014 */   sw        $v1, 0x14($sp)
.L80044814:
/* 45414 80044814 0C011219 */  jal        func_with_gold
/* 45418 80044818 02402021 */   addu      $a0, $s2, $zero
/* 4541C 8004481C 8E450080 */  lw         $a1, 0x80($s2)
/* 45420 80044820 8CA30078 */  lw         $v1, 0x78($a1)
/* 45424 80044824 84640028 */  lh         $a0, 0x28($v1)
/* 45428 80044828 8C62002C */  lw         $v0, 0x2c($v1)
/* 4542C 8004482C 0040F809 */  jalr       $v0
/* 45430 80044830 00A42021 */   addu      $a0, $a1, $a0
/* 45434 80044834 8E430080 */  lw         $v1, 0x80($s2)
/* 45438 80044838 0C00BFCC */  jal        func_8002FF30
/* 4543C 8004483C 8C640080 */   lw        $a0, 0x80($v1)
/* 45440 80044840 0C00E00B */  jal        make_upDown_arrows
/* 45444 80044844 8E440080 */   lw        $a0, 0x80($s2)
/* 45448 80044848 02401021 */  addu       $v0, $s2, $zero
/* 4544C 8004484C 8FBF0034 */  lw         $ra, 0x34($sp)
/* 45450 80044850 8FB20030 */  lw         $s2, 0x30($sp)
/* 45454 80044854 8FB1002C */  lw         $s1, 0x2c($sp)
/* 45458 80044858 8FB00028 */  lw         $s0, 0x28($sp)
/* 4545C 8004485C 03E00008 */  jr         $ra
/* 45460 80044860 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_with_gold
/* 45464 80044864 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 45468 80044868 AFB10014 */  sw         $s1, 0x14($sp)
/* 4546C 8004486C 00808821 */  addu       $s1, $a0, $zero
/* 45470 80044870 AFBF0018 */  sw         $ra, 0x18($sp)
/* 45474 80044874 AFB00010 */  sw         $s0, 0x10($sp)
/* 45478 80044878 8E220088 */  lw         $v0, 0x88($s1)
/* 4547C 8004487C 8C450080 */  lw         $a1, 0x80($v0)
/* 45480 80044880 8CA30078 */  lw         $v1, 0x78($a1)
/* 45484 80044884 84640078 */  lh         $a0, 0x78($v1)
/* 45488 80044888 8C62007C */  lw         $v0, 0x7c($v1)
/* 4548C 8004488C 0040F809 */  jalr       $v0
/* 45490 80044890 00A42021 */   addu      $a0, $a1, $a0
/* 45494 80044894 3C03800F */  lui        $v1, %hi(partypicker)
/* 45498 80044898 9064D550 */  lbu        $a0, %lo(partypicker)($v1)
/* 4549C 8004489C 9223008C */  lbu        $v1, 0x8c($s1)
/* 454A0 800448A0 A224007C */  sb         $a0, 0x7c($s1)
/* 454A4 800448A4 00402021 */  addu       $a0, $v0, $zero
/* 454A8 800448A8 24020001 */  addiu      $v0, $zero, 1
/* 454AC 800448AC 1462000E */  bne        $v1, $v0, .L800448E8
/* 454B0 800448B0 3C10800F */   lui       $s0, %hi(gGlobalsText)
/* 454B4 800448B4 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 454B8 800448B8 2602DF88 */  addiu      $v0, $s0, -0x2078
/* 454BC 800448BC 8C43204C */  lw         $v1, 0x204c($v0)
/* 454C0 800448C0 8C4614F4 */  lw         $a2, 0x14f4($v0)
/* 454C4 800448C4 8C650848 */  lw         $a1, 0x848($v1)
/* 454C8 800448C8 0C0333AC */  jal        sprintf
/* 454CC 800448CC 02002021 */   addu      $a0, $s0, $zero
/* 454D0 800448D0 02002821 */  addu       $a1, $s0, $zero
/* 454D4 800448D4 8E240094 */  lw         $a0, 0x94($s1)
/* 454D8 800448D8 0C02EEDD */  jal        utilities_func
/* 454DC 800448DC 24060001 */   addiu     $a2, $zero, 1
/* 454E0 800448E0 08011255 */  j          .L80044954
/* 454E4 800448E4 8FBF0018 */   lw        $ra, 0x18($sp)
.L800448E8:
/* 454E8 800448E8 10800013 */  beqz       $a0, .L80044938
/* 454EC 800448EC 00000000 */   nop
/* 454F0 800448F0 8E260088 */  lw         $a2, 0x88($s1)
/* 454F4 800448F4 8CC30078 */  lw         $v1, 0x78($a2)
/* 454F8 800448F8 9485005E */  lhu        $a1, 0x5e($a0)
/* 454FC 800448FC 846400E8 */  lh         $a0, 0xe8($v1)
/* 45500 80044900 8C6200EC */  lw         $v0, 0xec($v1)
/* 45504 80044904 0040F809 */  jalr       $v0
/* 45508 80044908 00C42021 */   addu      $a0, $a2, $a0
/* 4550C 8004490C 8E240094 */  lw         $a0, 0x94($s1)
/* 45510 80044910 0C02EEBC */  jal        func_800BBAF0
/* 45514 80044914 00408021 */   addu      $s0, $v0, $zero
/* 45518 80044918 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 4551C 8004491C 8C6688F4 */  lw         $a2, %lo(commonstringsmirror)($v1)
/* 45520 80044920 00402021 */  addu       $a0, $v0, $zero
/* 45524 80044924 8CC5084C */  lw         $a1, 0x84c($a2)
/* 45528 80044928 0C0333AC */  jal        sprintf
/* 4552C 8004492C 02003021 */   addu      $a2, $s0, $zero
/* 45530 80044930 08011255 */  j          .L80044954
/* 45534 80044934 8FBF0018 */   lw        $ra, 0x18($sp)
.L80044938:
/* 45538 80044938 0C02EEBC */  jal        func_800BBAF0
/* 4553C 8004493C 8E240094 */   lw        $a0, 0x94($s1)
/* 45540 80044940 00402021 */  addu       $a0, $v0, $zero
/* 45544 80044944 3C05800E */  lui        $a1, %hi(D_800DCED0)
/* 45548 80044948 0C0333AC */  jal        sprintf
/* 4554C 8004494C 24A5CED0 */   addiu     $a1, $a1, %lo(D_800DCED0)
/* 45550 80044950 8FBF0018 */  lw         $ra, 0x18($sp)
.L80044954:
/* 45554 80044954 8FB10014 */  lw         $s1, 0x14($sp)
/* 45558 80044958 8FB00010 */  lw         $s0, 0x10($sp)
/* 4555C 8004495C 03E00008 */  jr         $ra
/* 45560 80044960 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80044964
/* 45564 80044964 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 45568 80044968 AFB70034 */  sw         $s7, 0x34($sp)
/* 4556C 8004496C 0080B821 */  addu       $s7, $a0, $zero
/* 45570 80044970 AFB20020 */  sw         $s2, 0x20($sp)
/* 45574 80044974 3C12800E */  lui        $s2, %hi(gGlobals)
/* 45578 80044978 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 4557C 8004497C AFB5002C */  sw         $s5, 0x2c($sp)
/* 45580 80044980 00A0A821 */  addu       $s5, $a1, $zero
/* 45584 80044984 AFB60030 */  sw         $s6, 0x30($sp)
/* 45588 80044988 3C16800F */  lui        $s6, %hi(font_face)
/* 4558C 8004498C 26C28D18 */  addiu      $v0, $s6, %lo(font_face)
/* 45590 80044990 AFB1001C */  sw         $s1, 0x1c($sp)
/* 45594 80044994 00068C00 */  sll        $s1, $a2, 0x10
/* 45598 80044998 00118C03 */  sra        $s1, $s1, 0x10
/* 4559C 8004499C AFB00018 */  sw         $s0, 0x18($sp)
/* 455A0 800449A0 00078400 */  sll        $s0, $a3, 0x10
/* 455A4 800449A4 00108403 */  sra        $s0, $s0, 0x10
/* 455A8 800449A8 AFBF0038 */  sw         $ra, 0x38($sp)
/* 455AC 800449AC AFB40028 */  sw         $s4, 0x28($sp)
/* 455B0 800449B0 AFB30024 */  sw         $s3, 0x24($sp)
/* 455B4 800449B4 8E441600 */  lw         $a0, 0x1600($s2)
/* 455B8 800449B8 8C450008 */  lw         $a1, 8($v0)
/* 455BC 800449BC 87B30052 */  lh         $s3, 0x52($sp)
/* 455C0 800449C0 0C02D0FD */  jal        font_func
/* 455C4 800449C4 87B40056 */   lh        $s4, 0x56($sp)
/* 455C8 800449C8 02E02021 */  addu       $a0, $s7, $zero
/* 455CC 800449CC 02A02821 */  addu       $a1, $s5, $zero
/* 455D0 800449D0 02203021 */  addu       $a2, $s1, $zero
/* 455D4 800449D4 02003821 */  addu       $a3, $s0, $zero
/* 455D8 800449D8 AFB30010 */  sw         $s3, 0x10($sp)
/* 455DC 800449DC 0C02DE14 */  jal        widget_func_8
/* 455E0 800449E0 AFB40014 */   sw        $s4, 0x14($sp)
/* 455E4 800449E4 8E441600 */  lw         $a0, 0x1600($s2)
/* 455E8 800449E8 8EC58D18 */  lw         $a1, -0x72e8($s6)
/* 455EC 800449EC 0C02D0FD */  jal        font_func
/* 455F0 800449F0 00408021 */   addu      $s0, $v0, $zero
/* 455F4 800449F4 02001021 */  addu       $v0, $s0, $zero
/* 455F8 800449F8 8FBF0038 */  lw         $ra, 0x38($sp)
/* 455FC 800449FC 8FB70034 */  lw         $s7, 0x34($sp)
/* 45600 80044A00 8FB60030 */  lw         $s6, 0x30($sp)
/* 45604 80044A04 8FB5002C */  lw         $s5, 0x2c($sp)
/* 45608 80044A08 8FB40028 */  lw         $s4, 0x28($sp)
/* 4560C 80044A0C 8FB30024 */  lw         $s3, 0x24($sp)
/* 45610 80044A10 8FB20020 */  lw         $s2, 0x20($sp)
/* 45614 80044A14 8FB1001C */  lw         $s1, 0x1c($sp)
/* 45618 80044A18 8FB00018 */  lw         $s0, 0x18($sp)
/* 4561C 80044A1C 03E00008 */  jr         $ra
/* 45620 80044A20 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80044A24
/* 45624 80044A24 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 45628 80044A28 AFB20018 */  sw         $s2, 0x18($sp)
/* 4562C 80044A2C 00809021 */  addu       $s2, $a0, $zero
/* 45630 80044A30 AFB00010 */  sw         $s0, 0x10($sp)
/* 45634 80044A34 3C10800E */  lui        $s0, %hi(gGlobals)
/* 45638 80044A38 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 4563C 80044A3C AFB10014 */  sw         $s1, 0x14($sp)
/* 45640 80044A40 3C11800F */  lui        $s1, %hi(font_face)
/* 45644 80044A44 26228D18 */  addiu      $v0, $s1, %lo(font_face)
/* 45648 80044A48 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4564C 80044A4C 8E041600 */  lw         $a0, 0x1600($s0)
/* 45650 80044A50 0C02D0FD */  jal        font_func
/* 45654 80044A54 8C450008 */   lw        $a1, 8($v0)
/* 45658 80044A58 0C02DE51 */  jal        func_800B7944
/* 4565C 80044A5C 02402021 */   addu      $a0, $s2, $zero
/* 45660 80044A60 8E041600 */  lw         $a0, 0x1600($s0)
/* 45664 80044A64 8E258D18 */  lw         $a1, -0x72e8($s1)
/* 45668 80044A68 0C02D0FD */  jal        font_func
/* 4566C 80044A6C 00408021 */   addu      $s0, $v0, $zero
/* 45670 80044A70 02001021 */  addu       $v0, $s0, $zero
/* 45674 80044A74 8FBF001C */  lw         $ra, 0x1c($sp)
/* 45678 80044A78 8FB20018 */  lw         $s2, 0x18($sp)
/* 4567C 80044A7C 8FB10014 */  lw         $s1, 0x14($sp)
/* 45680 80044A80 8FB00010 */  lw         $s0, 0x10($sp)
/* 45684 80044A84 03E00008 */  jr         $ra
/* 45688 80044A88 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80044A8C
/* 4568C 80044A8C 03E00008 */  jr         $ra
/* 45690 80044A90 00001021 */   addu      $v0, $zero, $zero

glabel func_80044A94
/* 45694 80044A94 3C02800F */  lui        $v0, %hi(partypicker)
/* 45698 80044A98 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 4569C 80044A9C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 456A0 80044AA0 AFB1002C */  sw         $s1, 0x2c($sp)
/* 456A4 80044AA4 00808821 */  addu       $s1, $a0, $zero
/* 456A8 80044AA8 AFBF0030 */  sw         $ra, 0x30($sp)
/* 456AC 80044AAC AFB00028 */  sw         $s0, 0x28($sp)
/* 456B0 80044AB0 9224008C */  lbu        $a0, 0x8c($s1)
/* 456B4 80044AB4 24020001 */  addiu      $v0, $zero, 1
/* 456B8 80044AB8 14820018 */  bne        $a0, $v0, .L80044B1C
/* 456BC 80044ABC A223007C */   sb        $v1, 0x7c($s1)
/* 456C0 80044AC0 8E250080 */  lw         $a1, 0x80($s1)
/* 456C4 80044AC4 8CA20078 */  lw         $v0, 0x78($a1)
/* 456C8 80044AC8 844400C8 */  lh         $a0, 0xc8($v0)
/* 456CC 80044ACC 8C4300CC */  lw         $v1, 0xcc($v0)
/* 456D0 80044AD0 0060F809 */  jalr       $v1
/* 456D4 80044AD4 00A42021 */   addu      $a0, $a1, $a0
/* 456D8 80044AD8 8E230088 */  lw         $v1, 0x88($s1)
/* 456DC 80044ADC 8E220080 */  lw         $v0, 0x80($s1)
/* 456E0 80044AE0 5462000F */  bnel       $v1, $v0, .L80044B20
/* 456E4 80044AE4 8E250084 */   lw        $a1, 0x84($s1)
/* 456E8 80044AE8 8C650080 */  lw         $a1, 0x80($v1)
/* 456EC 80044AEC 8CA30078 */  lw         $v1, 0x78($a1)
/* 456F0 80044AF0 84640078 */  lh         $a0, 0x78($v1)
/* 456F4 80044AF4 8C62007C */  lw         $v0, 0x7c($v1)
/* 456F8 80044AF8 0040F809 */  jalr       $v0
/* 456FC 80044AFC 00A42021 */   addu      $a0, $a1, $a0
/* 45700 80044B00 54400007 */  bnel       $v0, $zero, .L80044B20
/* 45704 80044B04 8E250084 */   lw        $a1, 0x84($s1)
/* 45708 80044B08 8E230078 */  lw         $v1, 0x78($s1)
/* 4570C 80044B0C 84640070 */  lh         $a0, 0x70($v1)
/* 45710 80044B10 8C620074 */  lw         $v0, 0x74($v1)
/* 45714 80044B14 0040F809 */  jalr       $v0
/* 45718 80044B18 02242021 */   addu      $a0, $s1, $a0
.L80044B1C:
/* 4571C 80044B1C 8E250084 */  lw         $a1, 0x84($s1)
.L80044B20:
/* 45720 80044B20 8CA20078 */  lw         $v0, 0x78($a1)
/* 45724 80044B24 844400C8 */  lh         $a0, 0xc8($v0)
/* 45728 80044B28 8C4300CC */  lw         $v1, 0xcc($v0)
/* 4572C 80044B2C 0060F809 */  jalr       $v1
/* 45730 80044B30 00A42021 */   addu      $a0, $a1, $a0
/* 45734 80044B34 8E220088 */  lw         $v0, 0x88($s1)
/* 45738 80044B38 8E240080 */  lw         $a0, 0x80($s1)
/* 4573C 80044B3C 14440022 */  bne        $v0, $a0, .L80044BC8
/* 45740 80044B40 24050082 */   addiu     $a1, $zero, 0x82
/* 45744 80044B44 24050044 */  addiu      $a1, $zero, 0x44
/* 45748 80044B48 2406002A */  addiu      $a2, $zero, 0x2a
/* 4574C 80044B4C 241000FF */  addiu      $s0, $zero, 0xff
/* 45750 80044B50 24020097 */  addiu      $v0, $zero, 0x97
/* 45754 80044B54 2403008D */  addiu      $v1, $zero, 0x8d
/* 45758 80044B58 AFA20014 */  sw         $v0, 0x14($sp)
/* 4575C 80044B5C 240200BF */  addiu      $v0, $zero, 0xbf
/* 45760 80044B60 AFA2001C */  sw         $v0, 0x1c($sp)
/* 45764 80044B64 24020014 */  addiu      $v0, $zero, 0x14
/* 45768 80044B68 AFB00010 */  sw         $s0, 0x10($sp)
/* 4576C 80044B6C AFA30018 */  sw         $v1, 0x18($sp)
/* 45770 80044B70 AFB00020 */  sw         $s0, 0x20($sp)
/* 45774 80044B74 AFA20024 */  sw         $v0, 0x24($sp)
/* 45778 80044B78 8C840080 */  lw         $a0, 0x80($a0)
/* 4577C 80044B7C 0C00C0A0 */  jal        func_80030280
/* 45780 80044B80 24070022 */   addiu     $a3, $zero, 0x22
/* 45784 80044B84 24050082 */  addiu      $a1, $zero, 0x82
/* 45788 80044B88 24060050 */  addiu      $a2, $zero, 0x50
/* 4578C 80044B8C 24020082 */  addiu      $v0, $zero, 0x82
/* 45790 80044B90 24030050 */  addiu      $v1, $zero, 0x50
/* 45794 80044B94 AFB00010 */  sw         $s0, 0x10($sp)
/* 45798 80044B98 AFA20014 */  sw         $v0, 0x14($sp)
/* 4579C 80044B9C AFA30018 */  sw         $v1, 0x18($sp)
/* 457A0 80044BA0 AFA3001C */  sw         $v1, 0x1c($sp)
/* 457A4 80044BA4 AFB00020 */  sw         $s0, 0x20($sp)
/* 457A8 80044BA8 8E230084 */  lw         $v1, 0x84($s1)
/* 457AC 80044BAC 24020001 */  addiu      $v0, $zero, 1
/* 457B0 80044BB0 AFA20024 */  sw         $v0, 0x24($sp)
/* 457B4 80044BB4 8C640080 */  lw         $a0, 0x80($v1)
/* 457B8 80044BB8 0C00C0A0 */  jal        func_80030280
/* 457BC 80044BBC 24070050 */   addiu     $a3, $zero, 0x50
/* 457C0 80044BC0 08011311 */  j          .L80044C44
/* 457C4 80044BC4 8FBF0030 */   lw        $ra, 0x30($sp)
.L80044BC8:
/* 457C8 80044BC8 24060050 */  addiu      $a2, $zero, 0x50
/* 457CC 80044BCC 241000FF */  addiu      $s0, $zero, 0xff
/* 457D0 80044BD0 24020082 */  addiu      $v0, $zero, 0x82
/* 457D4 80044BD4 24030050 */  addiu      $v1, $zero, 0x50
/* 457D8 80044BD8 AFA20014 */  sw         $v0, 0x14($sp)
/* 457DC 80044BDC 24020001 */  addiu      $v0, $zero, 1
/* 457E0 80044BE0 AFB00010 */  sw         $s0, 0x10($sp)
/* 457E4 80044BE4 AFA30018 */  sw         $v1, 0x18($sp)
/* 457E8 80044BE8 AFA3001C */  sw         $v1, 0x1c($sp)
/* 457EC 80044BEC AFB00020 */  sw         $s0, 0x20($sp)
/* 457F0 80044BF0 AFA20024 */  sw         $v0, 0x24($sp)
/* 457F4 80044BF4 8C840080 */  lw         $a0, 0x80($a0)
/* 457F8 80044BF8 0C00C0A0 */  jal        func_80030280
/* 457FC 80044BFC 24070050 */   addiu     $a3, $zero, 0x50
/* 45800 80044C00 24050044 */  addiu      $a1, $zero, 0x44
/* 45804 80044C04 2406002A */  addiu      $a2, $zero, 0x2a
/* 45808 80044C08 24020097 */  addiu      $v0, $zero, 0x97
/* 4580C 80044C0C 2403008D */  addiu      $v1, $zero, 0x8d
/* 45810 80044C10 AFA20014 */  sw         $v0, 0x14($sp)
/* 45814 80044C14 240200BF */  addiu      $v0, $zero, 0xbf
/* 45818 80044C18 AFB00010 */  sw         $s0, 0x10($sp)
/* 4581C 80044C1C AFA30018 */  sw         $v1, 0x18($sp)
/* 45820 80044C20 AFA2001C */  sw         $v0, 0x1c($sp)
/* 45824 80044C24 AFB00020 */  sw         $s0, 0x20($sp)
/* 45828 80044C28 8E230084 */  lw         $v1, 0x84($s1)
/* 4582C 80044C2C 24020014 */  addiu      $v0, $zero, 0x14
/* 45830 80044C30 AFA20024 */  sw         $v0, 0x24($sp)
/* 45834 80044C34 8C640080 */  lw         $a0, 0x80($v1)
/* 45838 80044C38 0C00C0A0 */  jal        func_80030280
/* 4583C 80044C3C 24070022 */   addiu     $a3, $zero, 0x22
/* 45840 80044C40 8FBF0030 */  lw         $ra, 0x30($sp)
.L80044C44:
/* 45844 80044C44 8FB1002C */  lw         $s1, 0x2c($sp)
/* 45848 80044C48 8FB00028 */  lw         $s0, 0x28($sp)
/* 4584C 80044C4C 03E00008 */  jr         $ra
/* 45850 80044C50 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80044C54
/* 45854 80044C54 03E00008 */  jr         $ra
/* 45858 80044C58 2402000C */   addiu     $v0, $zero, 0xc
/* 4585C 80044C5C 00000000 */  nop
