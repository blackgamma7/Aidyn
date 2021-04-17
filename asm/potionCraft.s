.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80003B70
/* 4770 80003B70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4774 80003B74 AFB00010 */  sw         $s0, 0x10($sp)
/* 4778 80003B78 00808021 */  addu       $s0, $a0, $zero
/* 477C 80003B7C AFBF0014 */  sw         $ra, 0x14($sp)
/* 4780 80003B80 0C026259 */  jal        passToMalloc
/* 4784 80003B84 24040084 */   addiu     $a0, $zero, 0x84
/* 4788 80003B88 00402021 */  addu       $a0, $v0, $zero
/* 478C 80003B8C 0C000F39 */  jal        potion_crafting_func
/* 4790 80003B90 02002821 */   addu      $a1, $s0, $zero
/* 4794 80003B94 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 4798 80003B98 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 479C 80003B9C 0C02DC7C */  jal        widgetHandler
/* 47A0 80003BA0 00402821 */   addu      $a1, $v0, $zero
/* 47A4 80003BA4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 47A8 80003BA8 8FB00010 */  lw         $s0, 0x10($sp)
/* 47AC 80003BAC 03E00008 */  jr         $ra
/* 47B0 80003BB0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_potion_recipie
/* 47B4 80003BB4 308400FF */  andi       $a0, $a0, 0xff
/* 47B8 80003BB8 00002821 */  addu       $a1, $zero, $zero
/* 47BC 80003BBC 3C02800E */  lui        $v0, %hi(potionRecipies)
/* 47C0 80003BC0 24436130 */  addiu      $v1, $v0, %lo(potionRecipies)
.L80003BC4:
/* 47C4 80003BC4 90620000 */  lbu        $v0, ($v1)
/* 47C8 80003BC8 14440003 */  bne        $v0, $a0, .L80003BD8
/* 47CC 80003BCC 24A50001 */   addiu     $a1, $a1, 1
/* 47D0 80003BD0 03E00008 */  jr         $ra
/* 47D4 80003BD4 00601021 */   addu      $v0, $v1, $zero
.L80003BD8:
/* 47D8 80003BD8 2CA2000F */  sltiu      $v0, $a1, 0xf
/* 47DC 80003BDC 1440FFF9 */  bnez       $v0, .L80003BC4
/* 47E0 80003BE0 24630007 */   addiu     $v1, $v1, 7
/* 47E4 80003BE4 03E00008 */  jr         $ra
/* 47E8 80003BE8 00001021 */   addu      $v0, $zero, $zero

glabel check_potion_ingredient
/* 47EC 80003BEC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 47F0 80003BF0 AFB00010 */  sw         $s0, 0x10($sp)
/* 47F4 80003BF4 309000FF */  andi       $s0, $a0, 0xff
/* 47F8 80003BF8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 47FC 80003BFC AFBF0018 */  sw         $ra, 0x18($sp)
/* 4800 80003C00 AFB10014 */  sw         $s1, 0x14($sp)
/* 4804 80003C04 1200001C */  beqz       $s0, .L80003C78
/* 4808 80003C08 24020001 */   addiu     $v0, $zero, 1
/* 480C 80003C0C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4810 80003C10 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 4814 80003C14 3C03800F */  lui        $v1, %hi(itemID_array)
/* 4818 80003C18 24631500 */  addiu      $v1, $v1, %lo(itemID_array)
/* 481C 80003C1C 8E2415F8 */  lw         $a0, 0x15f8($s1)
/* 4820 80003C20 00051040 */  sll        $v0, $a1, 1
/* 4824 80003C24 8C870010 */  lw         $a3, 0x10($a0)
/* 4828 80003C28 00431021 */  addu       $v0, $v0, $v1
/* 482C 80003C2C 8CE60000 */  lw         $a2, ($a3)
/* 4830 80003C30 94450000 */  lhu        $a1, ($v0)
/* 4834 80003C34 84C40050 */  lh         $a0, 0x50($a2)
/* 4838 80003C38 8CC20054 */  lw         $v0, 0x54($a2)
/* 483C 80003C3C 0040F809 */  jalr       $v0
/* 4840 80003C40 00E42021 */   addu      $a0, $a3, $a0
/* 4844 80003C44 00402821 */  addu       $a1, $v0, $zero
/* 4848 80003C48 2402FFFF */  addiu      $v0, $zero, -1
/* 484C 80003C4C 50A2000A */  beql       $a1, $v0, .L80003C78
/* 4850 80003C50 00001021 */   addu      $v0, $zero, $zero
/* 4854 80003C54 8E2215F8 */  lw         $v0, 0x15f8($s1)
/* 4858 80003C58 8C460010 */  lw         $a2, 0x10($v0)
/* 485C 80003C5C 8CC30000 */  lw         $v1, ($a2)
/* 4860 80003C60 84640068 */  lh         $a0, 0x68($v1)
/* 4864 80003C64 8C62006C */  lw         $v0, 0x6c($v1)
/* 4868 80003C68 0040F809 */  jalr       $v0
/* 486C 80003C6C 00C42021 */   addu      $a0, $a2, $a0
/* 4870 80003C70 0050102B */  sltu       $v0, $v0, $s0
/* 4874 80003C74 38420001 */  xori       $v0, $v0, 1
.L80003C78:
/* 4878 80003C78 8FBF0018 */  lw         $ra, 0x18($sp)
/* 487C 80003C7C 8FB10014 */  lw         $s1, 0x14($sp)
/* 4880 80003C80 8FB00010 */  lw         $s0, 0x10($sp)
/* 4884 80003C84 03E00008 */  jr         $ra
/* 4888 80003C88 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_potion_ingredients
/* 488C 80003C8C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4890 80003C90 AFB00010 */  sw         $s0, 0x10($sp)
/* 4894 80003C94 00808021 */  addu       $s0, $a0, $zero
/* 4898 80003C98 AFBF0014 */  sw         $ra, 0x14($sp)
/* 489C 80003C9C 92040003 */  lbu        $a0, 3($s0)
/* 48A0 80003CA0 0C000EFB */  jal        check_potion_ingredient
/* 48A4 80003CA4 24050020 */   addiu     $a1, $zero, 0x20
/* 48A8 80003CA8 1040000A */  beqz       $v0, .L80003CD4
/* 48AC 80003CAC 00001021 */   addu      $v0, $zero, $zero
/* 48B0 80003CB0 92040002 */  lbu        $a0, 2($s0)
/* 48B4 80003CB4 0C000EFB */  jal        check_potion_ingredient
/* 48B8 80003CB8 2405001F */   addiu     $a1, $zero, 0x1f
/* 48BC 80003CBC 50400005 */  beql       $v0, $zero, .L80003CD4
/* 48C0 80003CC0 00001021 */   addu      $v0, $zero, $zero
/* 48C4 80003CC4 92040001 */  lbu        $a0, 1($s0)
/* 48C8 80003CC8 0C000EFB */  jal        check_potion_ingredient
/* 48CC 80003CCC 2405001E */   addiu     $a1, $zero, 0x1e
/* 48D0 80003CD0 0002102B */  sltu       $v0, $zero, $v0
.L80003CD4:
/* 48D4 80003CD4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 48D8 80003CD8 8FB00010 */  lw         $s0, 0x10($sp)
/* 48DC 80003CDC 03E00008 */  jr         $ra
/* 48E0 80003CE0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel potion_crafting_func
/* 48E4 80003CE4 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 48E8 80003CE8 AFB5004C */  sw         $s5, 0x4c($sp)
/* 48EC 80003CEC 0080A821 */  addu       $s5, $a0, $zero
/* 48F0 80003CF0 AFBF0054 */  sw         $ra, 0x54($sp)
/* 48F4 80003CF4 AFB60050 */  sw         $s6, 0x50($sp)
/* 48F8 80003CF8 AFB40048 */  sw         $s4, 0x48($sp)
/* 48FC 80003CFC AFB30044 */  sw         $s3, 0x44($sp)
/* 4900 80003D00 AFB20040 */  sw         $s2, 0x40($sp)
/* 4904 80003D04 AFB1003C */  sw         $s1, 0x3c($sp)
/* 4908 80003D08 0C017B7E */  jal        widget_left_side_menu_skill
/* 490C 80003D0C AFB00038 */   sw        $s0, 0x38($sp)
/* 4910 80003D10 02A02021 */  addu       $a0, $s5, $zero
/* 4914 80003D14 24060017 */  addiu      $a2, $zero, 0x17
/* 4918 80003D18 24070046 */  addiu      $a3, $zero, 0x46
/* 491C 80003D1C 3C02800D */  lui        $v0, %hi(widget_methods_potionCraft)
/* 4920 80003D20 24427400 */  addiu      $v0, $v0, %lo(widget_methods_potionCraft)
/* 4924 80003D24 24130082 */  addiu      $s3, $zero, 0x82
/* 4928 80003D28 24100050 */  addiu      $s0, $zero, 0x50
/* 492C 80003D2C AEA20078 */  sw         $v0, 0x78($s5)
/* 4930 80003D30 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4934 80003D34 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4938 80003D38 AFB30010 */  sw         $s3, 0x10($sp)
/* 493C 80003D3C AFB00014 */  sw         $s0, 0x14($sp)
/* 4940 80003D40 AFB00018 */  sw         $s0, 0x18($sp)
/* 4944 80003D44 8C43204C */  lw         $v1, 0x204c($v0)
/* 4948 80003D48 241100FF */  addiu      $s1, $zero, 0xff
/* 494C 80003D4C AFB1001C */  sw         $s1, 0x1c($sp)
/* 4950 80003D50 8C650718 */  lw         $a1, 0x718($v1)
/* 4954 80003D54 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 4958 80003D58 8C5215F8 */   lw        $s2, 0x15f8($v0)
/* 495C 80003D5C 0040A021 */  addu       $s4, $v0, $zero
/* 4960 80003D60 8E830078 */  lw         $v1, 0x78($s4)
/* 4964 80003D64 84640018 */  lh         $a0, 0x18($v1)
/* 4968 80003D68 8C62001C */  lw         $v0, 0x1c($v1)
/* 496C 80003D6C 0040F809 */  jalr       $v0
/* 4970 80003D70 02842021 */   addu      $a0, $s4, $a0
/* 4974 80003D74 02802021 */  addu       $a0, $s4, $zero
/* 4978 80003D78 00021042 */  srl        $v0, $v0, 1
/* 497C 80003D7C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4980 80003D80 2405005D */  addiu      $a1, $zero, 0x5d
/* 4984 80003D84 86860062 */  lh         $a2, 0x62($s4)
/* 4988 80003D88 0C02DD3F */  jal        set_widget_coords
/* 498C 80003D8C 00A22823 */   subu      $a1, $a1, $v0
/* 4990 80003D90 8E830078 */  lw         $v1, 0x78($s4)
/* 4994 80003D94 84640020 */  lh         $a0, 0x20($v1)
/* 4998 80003D98 8C620024 */  lw         $v0, 0x24($v1)
/* 499C 80003D9C 0040F809 */  jalr       $v0
/* 49A0 80003DA0 02842021 */   addu      $a0, $s4, $a0
/* 49A4 80003DA4 02A02021 */  addu       $a0, $s5, $zero
/* 49A8 80003DA8 2405000F */  addiu      $a1, $zero, 0xf
/* 49AC 80003DAC 24060017 */  addiu      $a2, $zero, 0x17
/* 49B0 80003DB0 24420046 */  addiu      $v0, $v0, 0x46
/* 49B4 80003DB4 00021400 */  sll        $v0, $v0, 0x10
/* 49B8 80003DB8 00021403 */  sra        $v0, $v0, 0x10
/* 49BC 80003DBC 3048FFFF */  andi       $t0, $v0, 0xffff
/* 49C0 80003DC0 01003821 */  addu       $a3, $t0, $zero
/* 49C4 80003DC4 24030017 */  addiu      $v1, $zero, 0x17
/* 49C8 80003DC8 AFA30010 */  sw         $v1, 0x10($sp)
/* 49CC 80003DCC 240300A3 */  addiu      $v1, $zero, 0xa3
/* 49D0 80003DD0 2442007A */  addiu      $v0, $v0, 0x7a
/* 49D4 80003DD4 3042FFFF */  andi       $v0, $v0, 0xffff
/* 49D8 80003DD8 AFA80014 */  sw         $t0, 0x14($sp)
/* 49DC 80003DDC AFA30018 */  sw         $v1, 0x18($sp)
/* 49E0 80003DE0 AFA2001C */  sw         $v0, 0x1c($sp)
/* 49E4 80003DE4 AFB30020 */  sw         $s3, 0x20($sp)
/* 49E8 80003DE8 AFB00024 */  sw         $s0, 0x24($sp)
/* 49EC 80003DEC AFB00028 */  sw         $s0, 0x28($sp)
/* 49F0 80003DF0 AFB1002C */  sw         $s1, 0x2c($sp)
/* 49F4 80003DF4 0C02F435 */  jal        widgetscrollmenu_init_2
/* 49F8 80003DF8 AFA00030 */   sw        $zero, 0x30($sp)
/* 49FC 80003DFC 00402021 */  addu       $a0, $v0, $zero
/* 4A00 80003E00 24050044 */  addiu      $a1, $zero, 0x44
/* 4A04 80003E04 2406002A */  addiu      $a2, $zero, 0x2a
/* 4A08 80003E08 24070022 */  addiu      $a3, $zero, 0x22
/* 4A0C 80003E0C AEA20080 */  sw         $v0, 0x80($s5)
/* 4A10 80003E10 24020097 */  addiu      $v0, $zero, 0x97
/* 4A14 80003E14 2403008D */  addiu      $v1, $zero, 0x8d
/* 4A18 80003E18 AFA20014 */  sw         $v0, 0x14($sp)
/* 4A1C 80003E1C 240200BF */  addiu      $v0, $zero, 0xbf
/* 4A20 80003E20 AFA2001C */  sw         $v0, 0x1c($sp)
/* 4A24 80003E24 24020014 */  addiu      $v0, $zero, 0x14
/* 4A28 80003E28 AFB10010 */  sw         $s1, 0x10($sp)
/* 4A2C 80003E2C AFA30018 */  sw         $v1, 0x18($sp)
/* 4A30 80003E30 AFB10020 */  sw         $s1, 0x20($sp)
/* 4A34 80003E34 0C02F085 */  jal        set_widgetSubstruct8
/* 4A38 80003E38 AFA20024 */   sw        $v0, 0x24($sp)
/* 4A3C 80003E3C 8EA2007C */  lw         $v0, 0x7c($s5)
/* 4A40 80003E40 00009821 */  addu       $s3, $zero, $zero
/* 4A44 80003E44 00021080 */  sll        $v0, $v0, 2
/* 4A48 80003E48 02429021 */  addu       $s2, $s2, $v0
/* 4A4C 80003E4C 8E430000 */  lw         $v1, ($s2)
/* 4A50 80003E50 00002821 */  addu       $a1, $zero, $zero
/* 4A54 80003E54 8C64001C */  lw         $a0, 0x1c($v1)
/* 4A58 80003E58 0C020F67 */  jal        getModdedSkill
/* 4A5C 80003E5C 3C12800F */   lui       $s2, 0x800f
/* 4A60 80003E60 0040B021 */  addu       $s6, $v0, $zero
/* 4A64 80003E64 3C02800E */  lui        $v0, %hi(potionRecipies)
/* 4A68 80003E68 24516130 */  addiu      $s1, $v0, %lo(potionRecipies)
.L80003E6C:
/* 4A6C 80003E6C 92220004 */  lbu        $v0, 4($s1)
/* 4A70 80003E70 02C2102A */  slt        $v0, $s6, $v0
/* 4A74 80003E74 54400019 */  bnel       $v0, $zero, .L80003EDC
/* 4A78 80003E78 26730001 */   addiu     $s3, $s3, 1
/* 4A7C 80003E7C 0C026259 */  jal        passToMalloc
/* 4A80 80003E80 2404007C */   addiu     $a0, $zero, 0x7c
/* 4A84 80003E84 92230000 */  lbu        $v1, ($s1)
/* 4A88 80003E88 8E441B30 */  lw         $a0, 0x1b30($s2)
/* 4A8C 80003E8C 00031880 */  sll        $v1, $v1, 2
/* 4A90 80003E90 00641821 */  addu       $v1, $v1, $a0
/* 4A94 80003E94 8C640000 */  lw         $a0, ($v1)
/* 4A98 80003E98 0C03353E */  jal        strlen
/* 4A9C 80003E9C 00408021 */   addu      $s0, $v0, $zero
/* 4AA0 80003EA0 02002021 */  addu       $a0, $s0, $zero
/* 4AA4 80003EA4 24420001 */  addiu      $v0, $v0, 1
/* 4AA8 80003EA8 92230000 */  lbu        $v1, ($s1)
/* 4AAC 80003EAC 8E451B30 */  lw         $a1, 0x1b30($s2)
/* 4AB0 80003EB0 00031880 */  sll        $v1, $v1, 2
/* 4AB4 80003EB4 00651821 */  addu       $v1, $v1, $a1
/* 4AB8 80003EB8 8C650000 */  lw         $a1, ($v1)
/* 4ABC 80003EBC 0C02E3A0 */  jal        widgettext_func_2
/* 4AC0 80003EC0 3046FFFF */   andi      $a2, $v0, 0xffff
/* 4AC4 80003EC4 0040A021 */  addu       $s4, $v0, $zero
/* 4AC8 80003EC8 8EA40080 */  lw         $a0, 0x80($s5)
/* 4ACC 80003ECC 0C02E885 */  jal        link_widget_text
/* 4AD0 80003ED0 02802821 */   addu      $a1, $s4, $zero
/* 4AD4 80003ED4 A693005E */  sh         $s3, 0x5e($s4)
/* 4AD8 80003ED8 26730001 */  addiu      $s3, $s3, 1
.L80003EDC:
/* 4ADC 80003EDC 2E62000F */  sltiu      $v0, $s3, 0xf
/* 4AE0 80003EE0 1440FFE2 */  bnez       $v0, .L80003E6C
/* 4AE4 80003EE4 26310007 */   addiu     $s1, $s1, 7
/* 4AE8 80003EE8 02A01021 */  addu       $v0, $s5, $zero
/* 4AEC 80003EEC 8FBF0054 */  lw         $ra, 0x54($sp)
/* 4AF0 80003EF0 8FB60050 */  lw         $s6, 0x50($sp)
/* 4AF4 80003EF4 8FB5004C */  lw         $s5, 0x4c($sp)
/* 4AF8 80003EF8 8FB40048 */  lw         $s4, 0x48($sp)
/* 4AFC 80003EFC 8FB30044 */  lw         $s3, 0x44($sp)
/* 4B00 80003F00 8FB20040 */  lw         $s2, 0x40($sp)
/* 4B04 80003F04 8FB1003C */  lw         $s1, 0x3c($sp)
/* 4B08 80003F08 8FB00038 */  lw         $s0, 0x38($sp)
/* 4B0C 80003F0C 03E00008 */  jr         $ra
/* 4B10 80003F10 27BD0058 */   addiu     $sp, $sp, 0x58

glabel potion_recipie_func
/* 4B14 80003F14 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 4B18 80003F18 AFB20098 */  sw         $s2, 0x98($sp)
/* 4B1C 80003F1C 00809021 */  addu       $s2, $a0, $zero
/* 4B20 80003F20 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 4B24 80003F24 AFB3009C */  sw         $s3, 0x9c($sp)
/* 4B28 80003F28 AFB10094 */  sw         $s1, 0x94($sp)
/* 4B2C 80003F2C AFB00090 */  sw         $s0, 0x90($sp)
/* 4B30 80003F30 8E440080 */  lw         $a0, 0x80($s2)
/* 4B34 80003F34 50800041 */  beql       $a0, $zero, .L8000403C
/* 4B38 80003F38 02402021 */   addu      $a0, $s2, $zero
/* 4B3C 80003F3C 0C02F031 */  jal        func_800BC0C4
/* 4B40 80003F40 00000000 */   nop
/* 4B44 80003F44 9044005F */  lbu        $a0, 0x5f($v0)
/* 4B48 80003F48 3C02800E */  lui        $v0, %hi(potionRecipies)
/* 4B4C 80003F4C 24426130 */  addiu      $v0, $v0, %lo(potionRecipies)
/* 4B50 80003F50 000418C0 */  sll        $v1, $a0, 3
/* 4B54 80003F54 00641823 */  subu       $v1, $v1, $a0
/* 4B58 80003F58 00628021 */  addu       $s0, $v1, $v0
/* 4B5C 80003F5C 02002021 */  addu       $a0, $s0, $zero
/* 4B60 80003F60 3C02800E */  lui        $v0, %hi(partyPointer)
/* 4B64 80003F64 0C000F23 */  jal        check_potion_ingredients
/* 4B68 80003F68 8C517EA0 */   lw        $s1, %lo(partyPointer)($v0)
/* 4B6C 80003F6C 14400006 */  bnez       $v0, .L80003F88
/* 4B70 80003F70 00009821 */   addu      $s3, $zero, $zero
/* 4B74 80003F74 92050000 */  lbu        $a1, ($s0)
/* 4B78 80003F78 0C001059 */  jal        PotionFlaskMSG_notEnough
/* 4B7C 80003F7C 02402021 */   addu      $a0, $s2, $zero
/* 4B80 80003F80 0800100B */  j          .L8000402C
/* 4B84 80003F84 02402021 */   addu      $a0, $s2, $zero
.L80003F88:
/* 4B88 80003F88 8E260010 */  lw         $a2, 0x10($s1)
/* 4B8C 80003F8C 92050000 */  lbu        $a1, ($s0)
/* 4B90 80003F90 8CC30000 */  lw         $v1, ($a2)
/* 4B94 80003F94 34A51000 */  ori        $a1, $a1, 0x1000
/* 4B98 80003F98 84640050 */  lh         $a0, 0x50($v1)
/* 4B9C 80003F9C 8C620054 */  lw         $v0, 0x54($v1)
/* 4BA0 80003FA0 0040F809 */  jalr       $v0
/* 4BA4 80003FA4 00C42021 */   addu      $a0, $a2, $a0
/* 4BA8 80003FA8 00402821 */  addu       $a1, $v0, $zero
/* 4BAC 80003FAC 2402FFFF */  addiu      $v0, $zero, -1
/* 4BB0 80003FB0 50A2000B */  beql       $a1, $v0, .L80003FE0
/* 4BB4 80003FB4 9245007F */   lbu       $a1, 0x7f($s2)
/* 4BB8 80003FB8 8E260010 */  lw         $a2, 0x10($s1)
/* 4BBC 80003FBC 8CC30000 */  lw         $v1, ($a2)
/* 4BC0 80003FC0 84640068 */  lh         $a0, 0x68($v1)
/* 4BC4 80003FC4 8C62006C */  lw         $v0, 0x6c($v1)
/* 4BC8 80003FC8 0040F809 */  jalr       $v0
/* 4BCC 80003FCC 00C42021 */   addu      $a0, $a2, $a0
/* 4BD0 80003FD0 2C420063 */  sltiu      $v0, $v0, 0x63
/* 4BD4 80003FD4 50400007 */  beql       $v0, $zero, .L80003FF4
/* 4BD8 80003FD8 92050000 */   lbu       $a1, ($s0)
/* 4BDC 80003FDC 9245007F */  lbu        $a1, 0x7f($s2)
.L80003FE0:
/* 4BE0 80003FE0 92060000 */  lbu        $a2, ($s0)
/* 4BE4 80003FE4 0C0204BE */  jal        potion_recipie_func_
/* 4BE8 80003FE8 02202021 */   addu      $a0, $s1, $zero
/* 4BEC 80003FEC 00409821 */  addu       $s3, $v0, $zero
/* 4BF0 80003FF0 92050000 */  lbu        $a1, ($s0)
.L80003FF4:
/* 4BF4 80003FF4 0C001039 */  jal        func_800040E4
/* 4BF8 80003FF8 02402021 */   addu      $a0, $s2, $zero
/* 4BFC 80003FFC 92050000 */  lbu        $a1, ($s0)
/* 4C00 80004000 02402021 */  addu       $a0, $s2, $zero
/* 4C04 80004004 0C001049 */  jal        potionOrFlasgMsg
/* 4C08 80004008 AFA20050 */   sw        $v0, 0x50($sp)
/* 4C0C 8000400C 8FA30050 */  lw         $v1, 0x50($sp)
/* 4C10 80004010 AFA20054 */  sw         $v0, 0x54($sp)
/* 4C14 80004014 AFA20014 */  sw         $v0, 0x14($sp)
/* 4C18 80004018 00131080 */  sll        $v0, $s3, 2
/* 4C1C 8000401C AFA30010 */  sw         $v1, 0x10($sp)
/* 4C20 80004020 03A21821 */  addu       $v1, $sp, $v0
/* 4C24 80004024 8C620010 */  lw         $v0, 0x10($v1)
/* 4C28 80004028 02402021 */  addu       $a0, $s2, $zero
.L8000402C:
/* 4C2C 8000402C 0C017C0D */  jal        func_8005F034
/* 4C30 80004030 00402821 */   addu      $a1, $v0, $zero
/* 4C34 80004034 08001012 */  j          .L80004048
/* 4C38 80004038 00001021 */   addu      $v0, $zero, $zero
.L8000403C:
/* 4C3C 8000403C 0C02DEC8 */  jal        set_widgets_byte0x70
/* 4C40 80004040 24050005 */   addiu     $a1, $zero, 5
/* 4C44 80004044 00001021 */  addu       $v0, $zero, $zero
.L80004048:
/* 4C48 80004048 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 4C4C 8000404C 8FB3009C */  lw         $s3, 0x9c($sp)
/* 4C50 80004050 8FB20098 */  lw         $s2, 0x98($sp)
/* 4C54 80004054 8FB10094 */  lw         $s1, 0x94($sp)
/* 4C58 80004058 8FB00090 */  lw         $s0, 0x90($sp)
/* 4C5C 8000405C 03E00008 */  jr         $ra
/* 4C60 80004060 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel potion_recipie_check
/* 4C64 80004064 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 4C68 80004068 AFBF0050 */  sw         $ra, 0x50($sp)
/* 4C6C 8000406C 8C840080 */  lw         $a0, 0x80($a0)
/* 4C70 80004070 10800019 */  beqz       $a0, .L800040D8
/* 4C74 80004074 00001021 */   addu      $v0, $zero, $zero
/* 4C78 80004078 0C02F031 */  jal        func_800BC0C4
/* 4C7C 8000407C 00000000 */   nop
/* 4C80 80004080 9044005F */  lbu        $a0, 0x5f($v0)
/* 4C84 80004084 3C02800E */  lui        $v0, %hi(potionRecipies)
/* 4C88 80004088 24426130 */  addiu      $v0, $v0, %lo(potionRecipies)
/* 4C8C 8000408C 000418C0 */  sll        $v1, $a0, 3
/* 4C90 80004090 00641823 */  subu       $v1, $v1, $a0
/* 4C94 80004094 00621821 */  addu       $v1, $v1, $v0
/* 4C98 80004098 90650000 */  lbu        $a1, ($v1)
/* 4C9C 8000409C 27A40010 */  addiu      $a0, $sp, 0x10
/* 4CA0 800040A0 0C01EF1C */  jal        temp_item_check
/* 4CA4 800040A4 34A51000 */   ori       $a1, $a1, 0x1000
/* 4CA8 800040A8 0C026259 */  jal        passToMalloc
/* 4CAC 800040AC 24040080 */   addiu     $a0, $zero, 0x80
/* 4CB0 800040B0 00402021 */  addu       $a0, $v0, $zero
/* 4CB4 800040B4 0C00E829 */  jal        itemdetail_potion_other
/* 4CB8 800040B8 27A50010 */   addiu     $a1, $sp, 0x10
/* 4CBC 800040BC 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 4CC0 800040C0 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 4CC4 800040C4 0C02DC7C */  jal        widgetHandler
/* 4CC8 800040C8 00402821 */   addu      $a1, $v0, $zero
/* 4CCC 800040CC 0C01EF3A */  jal        clear_temp_Stat_spell
/* 4CD0 800040D0 27A40010 */   addiu     $a0, $sp, 0x10
/* 4CD4 800040D4 00001021 */  addu       $v0, $zero, $zero
.L800040D8:
/* 4CD8 800040D8 8FBF0050 */  lw         $ra, 0x50($sp)
/* 4CDC 800040DC 03E00008 */  jr         $ra
/* 4CE0 800040E0 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800040E4
/* 4CE4 800040E4 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 4CE8 800040E8 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 4CEC 800040EC 8C4488F4 */  lw         $a0, %lo(commonstringsmirror)($v0)
/* 4CF0 800040F0 30A500FF */  andi       $a1, $a1, 0xff
/* 4CF4 800040F4 8C82071C */  lw         $v0, 0x71c($a0)
/* 4CF8 800040F8 2CA50004 */  sltiu      $a1, $a1, 4
/* 4CFC 800040FC AFA20040 */  sw         $v0, 0x40($sp)
/* 4D00 80004100 8C830728 */  lw         $v1, 0x728($a0)
/* 4D04 80004104 00052880 */  sll        $a1, $a1, 2
/* 4D08 80004108 AFA20000 */  sw         $v0, ($sp)
/* 4D0C 8000410C AFA30044 */  sw         $v1, 0x44($sp)
/* 4D10 80004110 AFA30004 */  sw         $v1, 4($sp)
/* 4D14 80004114 03A51821 */  addu       $v1, $sp, $a1
/* 4D18 80004118 8C620000 */  lw         $v0, ($v1)
/* 4D1C 8000411C 03E00008 */  jr         $ra
/* 4D20 80004120 27BD0080 */   addiu     $sp, $sp, 0x80

glabel potionOrFlasgMsg
/* 4D24 80004124 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 4D28 80004128 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 4D2C 8000412C 8C4488F4 */  lw         $a0, %lo(commonstringsmirror)($v0)
/* 4D30 80004130 30A500FF */  andi       $a1, $a1, 0xff
/* 4D34 80004134 8C820720 */  lw         $v0, 0x720($a0)
/* 4D38 80004138 2CA50004 */  sltiu      $a1, $a1, 4
/* 4D3C 8000413C AFA20040 */  sw         $v0, 0x40($sp)
/* 4D40 80004140 8C83072C */  lw         $v1, 0x72c($a0)
/* 4D44 80004144 00052880 */  sll        $a1, $a1, 2
/* 4D48 80004148 AFA20000 */  sw         $v0, ($sp)
/* 4D4C 8000414C AFA30044 */  sw         $v1, 0x44($sp)
/* 4D50 80004150 AFA30004 */  sw         $v1, 4($sp)
/* 4D54 80004154 03A51821 */  addu       $v1, $sp, $a1
/* 4D58 80004158 8C620000 */  lw         $v0, ($v1)
/* 4D5C 8000415C 03E00008 */  jr         $ra
/* 4D60 80004160 27BD0080 */   addiu     $sp, $sp, 0x80

glabel PotionFlaskMSG_notEnough
/* 4D64 80004164 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 4D68 80004168 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 4D6C 8000416C 8C4488F4 */  lw         $a0, %lo(commonstringsmirror)($v0)
/* 4D70 80004170 30A500FF */  andi       $a1, $a1, 0xff
/* 4D74 80004174 8C820724 */  lw         $v0, 0x724($a0)
/* 4D78 80004178 2CA50004 */  sltiu      $a1, $a1, 4
/* 4D7C 8000417C AFA20040 */  sw         $v0, 0x40($sp)
/* 4D80 80004180 8C830730 */  lw         $v1, 0x730($a0)
/* 4D84 80004184 00052880 */  sll        $a1, $a1, 2
/* 4D88 80004188 AFA20000 */  sw         $v0, ($sp)
/* 4D8C 8000418C AFA30044 */  sw         $v1, 0x44($sp)
/* 4D90 80004190 AFA30004 */  sw         $v1, 4($sp)
/* 4D94 80004194 03A51821 */  addu       $v1, $sp, $a1
/* 4D98 80004198 8C620000 */  lw         $v0, ($v1)
/* 4D9C 8000419C 03E00008 */  jr         $ra
/* 4DA0 800041A0 27BD0080 */   addiu     $sp, $sp, 0x80

glabel widget_potioncraft_free
/* 4DA4 800041A4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4DA8 800041A8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4DAC 800041AC 0C02E66C */  jal        widget_menu_free
/* 4DB0 800041B0 00000000 */   nop
/* 4DB4 800041B4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4DB8 800041B8 03E00008 */  jr         $ra
/* 4DBC 800041BC 27BD0018 */   addiu     $sp, $sp, 0x18
