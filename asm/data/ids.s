.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80075CA0
/* 768A0 80075CA0 3084FFFF */  andi       $a0, $a0, 0xffff
/* 768A4 80075CA4 00041A02 */  srl        $v1, $a0, 8
/* 768A8 80075CA8 24020001 */  addiu      $v0, $zero, 1
/* 768AC 80075CAC 1462003D */  bne        $v1, $v0, .L80075DA4
/* 768B0 80075CB0 27BDFFC0 */   addiu     $sp, $sp, -0x40
/* 768B4 80075CB4 3C02800E */  lui        $v0, %hi(D_800DFFF0)
/* 768B8 80075CB8 2442FFF0 */  addiu      $v0, $v0, %lo(D_800DFFF0)
/* 768BC 80075CBC 30430003 */  andi       $v1, $v0, 3
/* 768C0 80075CC0 10600019 */  beqz       $v1, .L80075D28
/* 768C4 80075CC4 03A02821 */   addu      $a1, $sp, $zero
/* 768C8 80075CC8 24430020 */  addiu      $v1, $v0, 0x20
.L80075CCC:
/* 768CC 80075CCC 88460000 */  lwl        $a2, ($v0)
/* 768D0 80075CD0 98460003 */  lwr        $a2, 3($v0)
/* 768D4 80075CD4 88470004 */  lwl        $a3, 4($v0)
/* 768D8 80075CD8 98470007 */  lwr        $a3, 7($v0)
/* 768DC 80075CDC 88480008 */  lwl        $t0, 8($v0)
/* 768E0 80075CE0 9848000B */  lwr        $t0, 0xb($v0)
/* 768E4 80075CE4 8849000C */  lwl        $t1, 0xc($v0)
/* 768E8 80075CE8 9849000F */  lwr        $t1, 0xf($v0)
/* 768EC 80075CEC A8A60000 */  swl        $a2, ($a1)
/* 768F0 80075CF0 B8A60003 */  swr        $a2, 3($a1)
/* 768F4 80075CF4 A8A70004 */  swl        $a3, 4($a1)
/* 768F8 80075CF8 B8A70007 */  swr        $a3, 7($a1)
/* 768FC 80075CFC A8A80008 */  swl        $t0, 8($a1)
/* 76900 80075D00 B8A8000B */  swr        $t0, 0xb($a1)
/* 76904 80075D04 A8A9000C */  swl        $t1, 0xc($a1)
/* 76908 80075D08 B8A9000F */  swr        $t1, 0xf($a1)
/* 7690C 80075D0C 24420010 */  addiu      $v0, $v0, 0x10
/* 76910 80075D10 1443FFEE */  bne        $v0, $v1, .L80075CCC
/* 76914 80075D14 24A50010 */   addiu     $a1, $a1, 0x10
/* 76918 80075D18 0801D756 */  j          .L80075D58
/* 7691C 80075D1C 00000000 */   nop
.L80075D20:
/* 76920 80075D20 0801D76A */  j          .L80075DA8
/* 76924 80075D24 24020001 */   addiu     $v0, $zero, 1
.L80075D28:
/* 76928 80075D28 24430020 */  addiu      $v1, $v0, 0x20
.L80075D2C:
/* 7692C 80075D2C 8C460000 */  lw         $a2, ($v0)
/* 76930 80075D30 8C470004 */  lw         $a3, 4($v0)
/* 76934 80075D34 8C480008 */  lw         $t0, 8($v0)
/* 76938 80075D38 8C49000C */  lw         $t1, 0xc($v0)
/* 7693C 80075D3C ACA60000 */  sw         $a2, ($a1)
/* 76940 80075D40 ACA70004 */  sw         $a3, 4($a1)
/* 76944 80075D44 ACA80008 */  sw         $t0, 8($a1)
/* 76948 80075D48 ACA9000C */  sw         $t1, 0xc($a1)
/* 7694C 80075D4C 24420010 */  addiu      $v0, $v0, 0x10
/* 76950 80075D50 1443FFF6 */  bne        $v0, $v1, .L80075D2C
/* 76954 80075D54 24A50010 */   addiu     $a1, $a1, 0x10
.L80075D58:
/* 76958 80075D58 88430000 */  lwl        $v1, ($v0)
/* 7695C 80075D5C 98430003 */  lwr        $v1, 3($v0)
/* 76960 80075D60 A8A30000 */  swl        $v1, ($a1)
/* 76964 80075D64 B8A30003 */  swr        $v1, 3($a1)
/* 76968 80075D68 97A20000 */  lhu        $v0, ($sp)
/* 7696C 80075D6C 1040000D */  beqz       $v0, .L80075DA4
/* 76970 80075D70 00002821 */   addu      $a1, $zero, $zero
/* 76974 80075D74 308600FF */  andi       $a2, $a0, 0xff
/* 76978 80075D78 00051040 */  sll        $v0, $a1, 1
.L80075D7C:
/* 7697C 80075D7C 03A21821 */  addu       $v1, $sp, $v0
/* 76980 80075D80 94640000 */  lhu        $a0, ($v1)
/* 76984 80075D84 10C4FFE6 */  beq        $a2, $a0, .L80075D20
/* 76988 80075D88 24A20001 */   addiu     $v0, $a1, 1
/* 7698C 80075D8C 304500FF */  andi       $a1, $v0, 0xff
/* 76990 80075D90 00051840 */  sll        $v1, $a1, 1
/* 76994 80075D94 03A31021 */  addu       $v0, $sp, $v1
/* 76998 80075D98 94440000 */  lhu        $a0, ($v0)
/* 7699C 80075D9C 1480FFF7 */  bnez       $a0, .L80075D7C
/* 769A0 80075DA0 00051040 */   sll       $v0, $a1, 1
.L80075DA4:
/* 769A4 80075DA4 00001021 */  addu       $v0, $zero, $zero
.L80075DA8:
/* 769A8 80075DA8 03E00008 */  jr         $ra
/* 769AC 80075DAC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel getIDIndex_sub
/* 769B0 80075DB0 00003821 */  addu       $a3, $zero, $zero
/* 769B4 80075DB4 10A0000A */  beqz       $a1, .L80075DE0
/* 769B8 80075DB8 30C600FF */   andi      $a2, $a2, 0xff
/* 769BC 80075DBC 00871021 */  addu       $v0, $a0, $a3
.L80075DC0:
/* 769C0 80075DC0 90430000 */  lbu        $v1, ($v0)
/* 769C4 80075DC4 54660003 */  bnel       $v1, $a2, .L80075DD4
/* 769C8 80075DC8 24E70001 */   addiu     $a3, $a3, 1
/* 769CC 80075DCC 03E00008 */  jr         $ra
/* 769D0 80075DD0 00E01021 */   addu      $v0, $a3, $zero
.L80075DD4:
/* 769D4 80075DD4 00E5102B */  sltu       $v0, $a3, $a1
/* 769D8 80075DD8 1440FFF9 */  bnez       $v0, .L80075DC0
/* 769DC 80075DDC 00871021 */   addu      $v0, $a0, $a3
.L80075DE0:
/* 769E0 80075DE0 03E00008 */  jr         $ra
/* 769E4 80075DE4 2402FFFF */   addiu     $v0, $zero, -1

glabel GetIDIndex
/* 769E8 80075DE8 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 769EC 80075DEC 2405FFFF */  addiu      $a1, $zero, -1
/* 769F0 80075DF0 AFB1009C */  sw         $s1, 0x9c($sp)
/* 769F4 80075DF4 3091FFFF */  andi       $s1, $a0, 0xffff
/* 769F8 80075DF8 AFB00098 */  sw         $s0, 0x98($sp)
/* 769FC 80075DFC 323000FF */  andi       $s0, $s1, 0xff
/* 76A00 80075E00 AFB200A0 */  sw         $s2, 0xa0($sp)
/* 76A04 80075E04 00119202 */  srl        $s2, $s1, 8
/* 76A08 80075E08 2643FFFE */  addiu      $v1, $s2, -2
/* 76A0C 80075E0C 2C620017 */  sltiu      $v0, $v1, 0x17
/* 76A10 80075E10 1040002C */  beqz       $v0, .L80075EC4
/* 76A14 80075E14 AFBF00A4 */   sw        $ra, 0xa4($sp)
/* 76A18 80075E18 3C02800E */  lui        $v0, %hi(D_800E0068)
/* 76A1C 80075E1C 24420068 */  addiu      $v0, $v0, %lo(D_800E0068)
/* 76A20 80075E20 00031880 */  sll        $v1, $v1, 2
/* 76A24 80075E24 00621821 */  addu       $v1, $v1, $v0
/* 76A28 80075E28 8C640000 */  lw         $a0, ($v1)
/* 76A2C 80075E2C 00800008 */  jr         $a0
/* 76A30 80075E30 00000000 */   nop
/* 76A34 80075E34 3C04800F */  lui        $a0, %hi(lootList)
/* 76A38 80075E38 3C02800F */  lui        $v0, %hi(loot_pointer)
/* 76A3C 80075E3C 8C43F810 */  lw         $v1, %lo(loot_pointer)($v0)
/* 76A40 80075E40 0801D7AB */  j          .L80075EAC
/* 76A44 80075E44 2484F820 */   addiu     $a0, $a0, %lo(lootList)
/* 76A48 80075E48 3C04800F */  lui        $a0, %hi(DialougEntList)
/* 76A4C 80075E4C 3C02800F */  lui        $v0, %hi(DialougEntityPointer)
/* 76A50 80075E50 8C43F860 */  lw         $v1, %lo(DialougEntityPointer)($v0)
/* 76A54 80075E54 0801D7AB */  j          .L80075EAC
/* 76A58 80075E58 2484F870 */   addiu     $a0, $a0, %lo(DialougEntList)
/* 76A5C 80075E5C 3C04800F */  lui        $a0, %hi(entityList)
/* 76A60 80075E60 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 76A64 80075E64 8C4313A0 */  lw         $v1, %lo(EntityPointer)($v0)
/* 76A68 80075E68 0801D7AB */  j          .L80075EAC
/* 76A6C 80075E6C 248413B0 */   addiu     $a0, $a0, %lo(entityList)
/* 76A70 80075E70 3C04800F */  lui        $a0, %hi(SpellList)
/* 76A74 80075E74 3C02800F */  lui        $v0, %hi(spell_pointer)
/* 76A78 80075E78 8C4316A0 */  lw         $v1, %lo(spell_pointer)($v0)
/* 76A7C 80075E7C 0801D7AB */  j          .L80075EAC
/* 76A80 80075E80 248416B0 */   addiu     $a0, $a0, %lo(SpellList)
/* 76A84 80075E84 3C04800F */  lui        $a0, %hi(ArmorList)
/* 76A88 80075E88 3C02800F */  lui        $v0, %hi(armour_pointer)
/* 76A8C 80075E8C 8C43F7B0 */  lw         $v1, %lo(armour_pointer)($v0)
/* 76A90 80075E90 2484F7C0 */  addiu      $a0, $a0, %lo(ArmorList)
/* 76A94 80075E94 0801D7AC */  j          .L80075EB0
/* 76A98 80075E98 90650002 */   lbu       $a1, 2($v1)
/* 76A9C 80075E9C 3C04800F */  lui        $a0, %hi(weaponList)
/* 76AA0 80075EA0 3C02800F */  lui        $v0, %hi(weapon_pointer)
/* 76AA4 80075EA4 8C4316F0 */  lw         $v1, %lo(weapon_pointer)($v0)
/* 76AA8 80075EA8 24841700 */  addiu      $a0, $a0, %lo(weaponList)
.L80075EAC:
/* 76AAC 80075EAC 90650000 */  lbu        $a1, ($v1)
.L80075EB0:
/* 76AB0 80075EB0 0C01D76C */  jal        getIDIndex_sub
/* 76AB4 80075EB4 02003021 */   addu      $a2, $s0, $zero
/* 76AB8 80075EB8 0801D7B1 */  j          .L80075EC4
/* 76ABC 80075EBC 00402821 */   addu      $a1, $v0, $zero
/* 76AC0 80075EC0 02002821 */  addu       $a1, $s0, $zero
.L80075EC4:
/* 76AC4 80075EC4 2402FFFF */  addiu      $v0, $zero, -1
/* 76AC8 80075EC8 14A2000D */  bne        $a1, $v0, .L80075F00
/* 76ACC 80075ECC 30A200FF */   andi      $v0, $a1, 0xff
/* 76AD0 80075ED0 AFB20010 */  sw         $s2, 0x10($sp)
/* 76AD4 80075ED4 27A40018 */  addiu      $a0, $sp, 0x18
/* 76AD8 80075ED8 3C05800E */  lui        $a1, %hi(D_800E0014)
/* 76ADC 80075EDC 24A50014 */  addiu      $a1, $a1, %lo(D_800E0014)
/* 76AE0 80075EE0 02203021 */  addu       $a2, $s1, $zero
/* 76AE4 80075EE4 0C0333AC */  jal        sprintf
/* 76AE8 80075EE8 02003821 */   addu      $a3, $s0, $zero
/* 76AEC 80075EEC 3C04800E */  lui        $a0, %hi(D_800E004C)
/* 76AF0 80075EF0 2484004C */  addiu      $a0, $a0, %lo(D_800E004C)
/* 76AF4 80075EF4 0C025F2D */  jal        manualCrash
/* 76AF8 80075EF8 27A50018 */   addiu     $a1, $sp, 0x18
/* 76AFC 80075EFC 00001021 */  addu       $v0, $zero, $zero
.L80075F00:
/* 76B00 80075F00 8FBF00A4 */  lw         $ra, 0xa4($sp)
/* 76B04 80075F04 8FB200A0 */  lw         $s2, 0xa0($sp)
/* 76B08 80075F08 8FB1009C */  lw         $s1, 0x9c($sp)
/* 76B0C 80075F0C 8FB00098 */  lw         $s0, 0x98($sp)
/* 76B10 80075F10 03E00008 */  jr         $ra
/* 76B14 80075F14 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel search_item_array
/* 76B18 80075F18 3086FFFF */  andi       $a2, $a0, 0xffff
/* 76B1C 80075F1C 00061202 */  srl        $v0, $a2, 8
/* 76B20 80075F20 2444FFFF */  addiu      $a0, $v0, -1
/* 76B24 80075F24 2C830013 */  sltiu      $v1, $a0, 0x13
/* 76B28 80075F28 1060001A */  beqz       $v1, .L80075F94
/* 76B2C 80075F2C 3C02800E */   lui       $v0, %hi(D_800E00C8)
/* 76B30 80075F30 244200C8 */  addiu      $v0, $v0, %lo(D_800E00C8)
/* 76B34 80075F34 00041880 */  sll        $v1, $a0, 2
/* 76B38 80075F38 00621821 */  addu       $v1, $v1, $v0
/* 76B3C 80075F3C 8C640000 */  lw         $a0, ($v1)
/* 76B40 80075F40 00800008 */  jr         $a0
/* 76B44 80075F44 00000000 */   nop
.L80075F48:
/* 76B48 80075F48 03E00008 */  jr         $ra
/* 76B4C 80075F4C 00801021 */   addu      $v0, $a0, $zero
/* 76B50 80075F50 3C02800F */  lui        $v0, %hi(item_pointer)
/* 76B54 80075F54 8C4314F0 */  lw         $v1, %lo(item_pointer)($v0)
/* 76B58 80075F58 90630000 */  lbu        $v1, ($v1)
/* 76B5C 80075F5C 1060000D */  beqz       $v1, .L80075F94
/* 76B60 80075F60 00002021 */   addu      $a0, $zero, $zero
/* 76B64 80075F64 3C02800F */  lui        $v0, %hi(itemID_array)
/* 76B68 80075F68 24471500 */  addiu      $a3, $v0, %lo(itemID_array)
/* 76B6C 80075F6C 00602821 */  addu       $a1, $v1, $zero
/* 76B70 80075F70 00041040 */  sll        $v0, $a0, 1
.L80075F74:
/* 76B74 80075F74 00471021 */  addu       $v0, $v0, $a3
/* 76B78 80075F78 94430000 */  lhu        $v1, ($v0)
/* 76B7C 80075F7C 1066FFF2 */  beq        $v1, $a2, .L80075F48
/* 76B80 80075F80 24820001 */   addiu     $v0, $a0, 1
/* 76B84 80075F84 3044FFFF */  andi       $a0, $v0, 0xffff
/* 76B88 80075F88 0085182B */  sltu       $v1, $a0, $a1
/* 76B8C 80075F8C 1460FFF9 */  bnez       $v1, .L80075F74
/* 76B90 80075F90 00041040 */   sll       $v0, $a0, 1
.L80075F94:
/* 76B94 80075F94 03E00008 */  jr         $ra
/* 76B98 80075F98 00001021 */   addu      $v0, $zero, $zero

glabel func_80075F9C
/* 76B9C 80075F9C 3C02800F */  lui        $v0, %hi(item_pointer)
/* 76BA0 80075FA0 8C4314F0 */  lw         $v1, %lo(item_pointer)($v0)
/* 76BA4 80075FA4 00002821 */  addu       $a1, $zero, $zero
/* 76BA8 80075FA8 90630000 */  lbu        $v1, ($v1)
/* 76BAC 80075FAC 10600010 */  beqz       $v1, .L80075FF0
/* 76BB0 80075FB0 308400FF */   andi      $a0, $a0, 0xff
/* 76BB4 80075FB4 3C02800F */  lui        $v0, %hi(itemID_array)
/* 76BB8 80075FB8 24471500 */  addiu      $a3, $v0, %lo(itemID_array)
/* 76BBC 80075FBC 3084FFFF */  andi       $a0, $a0, 0xffff
/* 76BC0 80075FC0 00603021 */  addu       $a2, $v1, $zero
/* 76BC4 80075FC4 00051040 */  sll        $v0, $a1, 1
.L80075FC8:
/* 76BC8 80075FC8 00471021 */  addu       $v0, $v0, $a3
/* 76BCC 80075FCC 90430001 */  lbu        $v1, 1($v0)
/* 76BD0 80075FD0 54640003 */  bnel       $v1, $a0, .L80075FE0
/* 76BD4 80075FD4 24A20001 */   addiu     $v0, $a1, 1
/* 76BD8 80075FD8 03E00008 */  jr         $ra
/* 76BDC 80075FDC 94420000 */   lhu       $v0, ($v0)
.L80075FE0:
/* 76BE0 80075FE0 3045FFFF */  andi       $a1, $v0, 0xffff
/* 76BE4 80075FE4 00A6182B */  sltu       $v1, $a1, $a2
/* 76BE8 80075FE8 1460FFF7 */  bnez       $v1, .L80075FC8
/* 76BEC 80075FEC 00051040 */   sll       $v0, $a1, 1
.L80075FF0:
/* 76BF0 80075FF0 03E00008 */  jr         $ra
/* 76BF4 80075FF4 00001021 */   addu      $v0, $zero, $zero

glabel Weapon_borg5_lookup
/* 76BF8 80075FF8 27BDFF40 */  addiu      $sp, $sp, -0xc0
/* 76BFC 80075FFC 03A01821 */  addu       $v1, $sp, $zero
/* 76C00 80076000 3C02800E */  lui        $v0, %hi(weapon_borg5_ID)
/* 76C04 80076004 24450114 */  addiu      $a1, $v0, %lo(weapon_borg5_ID)
/* 76C08 80076008 30A20003 */  andi       $v0, $a1, 3
/* 76C0C 8007600C 1040001B */  beqz       $v0, .L8007607C
/* 76C10 80076010 308400FF */   andi      $a0, $a0, 0xff
/* 76C14 80076014 24A20080 */  addiu      $v0, $a1, 0x80
/* 76C18 80076018 3C07800F */  lui        $a3, 0x800f
.L8007601C:
/* 76C1C 8007601C 88A60000 */  lwl        $a2, ($a1)
/* 76C20 80076020 98A60003 */  lwr        $a2, 3($a1)
/* 76C24 80076024 88A80004 */  lwl        $t0, 4($a1)
/* 76C28 80076028 98A80007 */  lwr        $t0, 7($a1)
/* 76C2C 8007602C 88A90008 */  lwl        $t1, 8($a1)
/* 76C30 80076030 98A9000B */  lwr        $t1, 0xb($a1)
/* 76C34 80076034 88AA000C */  lwl        $t2, 0xc($a1)
/* 76C38 80076038 98AA000F */  lwr        $t2, 0xf($a1)
/* 76C3C 8007603C A8660000 */  swl        $a2, ($v1)
/* 76C40 80076040 B8660003 */  swr        $a2, 3($v1)
/* 76C44 80076044 A8680004 */  swl        $t0, 4($v1)
/* 76C48 80076048 B8680007 */  swr        $t0, 7($v1)
/* 76C4C 8007604C A8690008 */  swl        $t1, 8($v1)
/* 76C50 80076050 B869000B */  swr        $t1, 0xb($v1)
/* 76C54 80076054 A86A000C */  swl        $t2, 0xc($v1)
/* 76C58 80076058 B86A000F */  swr        $t2, 0xf($v1)
/* 76C5C 8007605C 24A50010 */  addiu      $a1, $a1, 0x10
/* 76C60 80076060 14A2FFEE */  bne        $a1, $v0, .L8007601C
/* 76C64 80076064 24630010 */   addiu     $v1, $v1, 0x10
/* 76C68 80076068 0801D82D */  j          .L800760B4
/* 76C6C 8007606C 00003021 */   addu      $a2, $zero, $zero
.L80076070:
/* 76C70 80076070 03A21821 */  addu       $v1, $sp, $v0
/* 76C74 80076074 0801D844 */  j          .L80076110
/* 76C78 80076078 94620000 */   lhu       $v0, ($v1)
.L8007607C:
/* 76C7C 8007607C 24A20080 */  addiu      $v0, $a1, 0x80
/* 76C80 80076080 3C07800F */  lui        $a3, 0x800f
.L80076084:
/* 76C84 80076084 8CA60000 */  lw         $a2, ($a1)
/* 76C88 80076088 8CA80004 */  lw         $t0, 4($a1)
/* 76C8C 8007608C 8CA90008 */  lw         $t1, 8($a1)
/* 76C90 80076090 8CAA000C */  lw         $t2, 0xc($a1)
/* 76C94 80076094 AC660000 */  sw         $a2, ($v1)
/* 76C98 80076098 AC680004 */  sw         $t0, 4($v1)
/* 76C9C 8007609C AC690008 */  sw         $t1, 8($v1)
/* 76CA0 800760A0 AC6A000C */  sw         $t2, 0xc($v1)
/* 76CA4 800760A4 24A50010 */  addiu      $a1, $a1, 0x10
/* 76CA8 800760A8 14A2FFF6 */  bne        $a1, $v0, .L80076084
/* 76CAC 800760AC 24630010 */   addiu     $v1, $v1, 0x10
/* 76CB0 800760B0 00003021 */  addu       $a2, $zero, $zero
.L800760B4:
/* 76CB4 800760B4 88A20000 */  lwl        $v0, ($a1)
/* 76CB8 800760B8 98A20003 */  lwr        $v0, 3($a1)
/* 76CBC 800760BC 84A80004 */  lh         $t0, 4($a1)
/* 76CC0 800760C0 A8620000 */  swl        $v0, ($v1)
/* 76CC4 800760C4 B8620003 */  swr        $v0, 3($v1)
/* 76CC8 800760C8 A4680004 */  sh         $t0, 4($v1)
/* 76CCC 800760CC 90E31490 */  lbu        $v1, 0x1490($a3)
/* 76CD0 800760D0 240200FF */  addiu      $v0, $zero, 0xff
/* 76CD4 800760D4 1062000E */  beq        $v1, $v0, .L80076110
/* 76CD8 800760D8 2402FFFF */   addiu     $v0, $zero, -1
/* 76CDC 800760DC 24E51490 */  addiu      $a1, $a3, 0x1490
/* 76CE0 800760E0 240700FF */  addiu      $a3, $zero, 0xff
/* 76CE4 800760E4 00C51021 */  addu       $v0, $a2, $a1
.L800760E8:
/* 76CE8 800760E8 90430000 */  lbu        $v1, ($v0)
/* 76CEC 800760EC 1064FFE0 */  beq        $v1, $a0, .L80076070
/* 76CF0 800760F0 00061040 */   sll       $v0, $a2, 1
/* 76CF4 800760F4 24C20001 */  addiu      $v0, $a2, 1
/* 76CF8 800760F8 3046FFFF */  andi       $a2, $v0, 0xffff
/* 76CFC 800760FC 00C51821 */  addu       $v1, $a2, $a1
/* 76D00 80076100 90620000 */  lbu        $v0, ($v1)
/* 76D04 80076104 1447FFF8 */  bne        $v0, $a3, .L800760E8
/* 76D08 80076108 00C51021 */   addu      $v0, $a2, $a1
/* 76D0C 8007610C 2402FFFF */  addiu      $v0, $zero, -1
.L80076110:
/* 76D10 80076110 03E00008 */  jr         $ra
/* 76D14 80076114 27BD00C0 */   addiu     $sp, $sp, 0xc0

glabel func_80076118
/* 76D18 80076118 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 76D1C 8007611C 3084FFFF */  andi       $a0, $a0, 0xffff
/* 76D20 80076120 00002821 */  addu       $a1, $zero, $zero
/* 76D24 80076124 AFBF0010 */  sw         $ra, 0x10($sp)
/* 76D28 80076128 0C01D77A */  jal        GetIDIndex
/* 76D2C 8007612C 00003021 */   addu      $a2, $zero, $zero
/* 76D30 80076130 0C01D7FE */  jal        Weapon_borg5_lookup
/* 76D34 80076134 00402021 */   addu      $a0, $v0, $zero
/* 76D38 80076138 8FBF0010 */  lw         $ra, 0x10($sp)
/* 76D3C 8007613C 03E00008 */  jr         $ra
/* 76D40 80076140 27BD0018 */   addiu     $sp, $sp, 0x18

glabel check_sheild_borg5
/* 76D44 80076144 3085FFFF */  andi       $a1, $a0, 0xffff
/* 76D48 80076148 3C02800F */  lui        $v0, %hi(armour_pointer)
/* 76D4C 8007614C 8C44F7B0 */  lw         $a0, %lo(armour_pointer)($v0)
/* 76D50 80076150 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 76D54 80076154 AFBF0010 */  sw         $ra, 0x10($sp)
/* 76D58 80076158 0C01D16A */  jal        get_sheild_borg5
/* 76D5C 8007615C 00000000 */   nop
/* 76D60 80076160 00402021 */  addu       $a0, $v0, $zero
/* 76D64 80076164 240338F9 */  addiu      $v1, $zero, 0x38f9
/* 76D68 80076168 10830002 */  beq        $a0, $v1, .L80076174
/* 76D6C 8007616C 2402FFFF */   addiu     $v0, $zero, -1
/* 76D70 80076170 00801021 */  addu       $v0, $a0, $zero
.L80076174:
/* 76D74 80076174 8FBF0010 */  lw         $ra, 0x10($sp)
/* 76D78 80076178 03E00008 */  jr         $ra
/* 76D7C 8007617C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_some_borg5
/* 76D80 80076180 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 76D84 80076184 AFBF0050 */  sw         $ra, 0x50($sp)
/* 76D88 80076188 0C01D7C6 */  jal        search_item_array
/* 76D8C 8007618C 3084FFFF */   andi      $a0, $a0, 0xffff
/* 76D90 80076190 3C03800E */  lui        $v1, %hi(D_800E019C)
/* 76D94 80076194 2468019C */  addiu      $t0, $v1, %lo(D_800E019C)
/* 76D98 80076198 89040000 */  lwl        $a0, ($t0)
/* 76D9C 8007619C 99040003 */  lwr        $a0, 3($t0)
/* 76DA0 800761A0 89060004 */  lwl        $a2, 4($t0)
/* 76DA4 800761A4 99060007 */  lwr        $a2, 7($t0)
/* 76DA8 800761A8 89070008 */  lwl        $a3, 8($t0)
/* 76DAC 800761AC 9907000B */  lwr        $a3, 0xb($t0)
/* 76DB0 800761B0 ABA40010 */  swl        $a0, 0x10($sp)
/* 76DB4 800761B4 BBA40013 */  swr        $a0, 0x13($sp)
/* 76DB8 800761B8 ABA60014 */  swl        $a2, 0x14($sp)
/* 76DBC 800761BC BBA60017 */  swr        $a2, 0x17($sp)
/* 76DC0 800761C0 ABA70018 */  swl        $a3, 0x18($sp)
/* 76DC4 800761C4 BBA7001B */  swr        $a3, 0x1b($sp)
/* 76DC8 800761C8 8504000C */  lh         $a0, 0xc($t0)
/* 76DCC 800761CC A7A4001C */  sh         $a0, 0x1c($sp)
/* 76DD0 800761D0 00404021 */  addu       $t0, $v0, $zero
/* 76DD4 800761D4 3C04800F */  lui        $a0, %hi(D_800F14D4)
/* 76DD8 800761D8 948314D4 */  lhu        $v1, %lo(D_800F14D4)($a0)
/* 76DDC 800761DC 3402FFFF */  ori        $v0, $zero, 0xffff
/* 76DE0 800761E0 10620012 */  beq        $v1, $v0, .L8007622C
/* 76DE4 800761E4 00002821 */   addu      $a1, $zero, $zero
/* 76DE8 800761E8 248614D4 */  addiu      $a2, $a0, 0x14d4
/* 76DEC 800761EC 27A70010 */  addiu      $a3, $sp, 0x10
/* 76DF0 800761F0 3409FFFF */  ori        $t1, $zero, 0xffff
/* 76DF4 800761F4 00052040 */  sll        $a0, $a1, 1
.L800761F8:
/* 76DF8 800761F8 00861021 */  addu       $v0, $a0, $a2
/* 76DFC 800761FC 94430000 */  lhu        $v1, ($v0)
/* 76E00 80076200 14680004 */  bne        $v1, $t0, .L80076214
/* 76E04 80076204 24A20001 */   addiu     $v0, $a1, 1
/* 76E08 80076208 00E41821 */  addu       $v1, $a3, $a0
/* 76E0C 8007620C 0801D88C */  j          .L80076230
/* 76E10 80076210 94620000 */   lhu       $v0, ($v1)
.L80076214:
/* 76E14 80076214 3045FFFF */  andi       $a1, $v0, 0xffff
/* 76E18 80076218 00051840 */  sll        $v1, $a1, 1
/* 76E1C 8007621C 00661821 */  addu       $v1, $v1, $a2
/* 76E20 80076220 94620000 */  lhu        $v0, ($v1)
/* 76E24 80076224 1449FFF4 */  bne        $v0, $t1, .L800761F8
/* 76E28 80076228 00052040 */   sll       $a0, $a1, 1
.L8007622C:
/* 76E2C 8007622C 2402FFFF */  addiu      $v0, $zero, -1
.L80076230:
/* 76E30 80076230 8FBF0050 */  lw         $ra, 0x50($sp)
/* 76E34 80076234 03E00008 */  jr         $ra
/* 76E38 80076238 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_8007623C
/* 76E3C 8007623C 27BDFF68 */  addiu      $sp, $sp, -0x98
/* 76E40 80076240 3084FFFF */  andi       $a0, $a0, 0xffff
/* 76E44 80076244 00042A02 */  srl        $a1, $a0, 8
/* 76E48 80076248 2CA20015 */  sltiu      $v0, $a1, 0x15
/* 76E4C 8007624C 1040001C */  beqz       $v0, .L800762C0
/* 76E50 80076250 AFBF0090 */   sw        $ra, 0x90($sp)
/* 76E54 80076254 27A30010 */  addiu      $v1, $sp, 0x10
/* 76E58 80076258 3C02800E */  lui        $v0, %hi(D_800E01AC)
/* 76E5C 8007625C 244201AC */  addiu      $v0, $v0, %lo(D_800E01AC)
/* 76E60 80076260 24460050 */  addiu      $a2, $v0, 0x50
/* 76E64 80076264 00603821 */  addu       $a3, $v1, $zero
/* 76E68 80076268 00052880 */  sll        $a1, $a1, 2
.L8007626C:
/* 76E6C 8007626C 8C480000 */  lw         $t0, ($v0)
/* 76E70 80076270 8C490004 */  lw         $t1, 4($v0)
/* 76E74 80076274 8C4A0008 */  lw         $t2, 8($v0)
/* 76E78 80076278 8C4B000C */  lw         $t3, 0xc($v0)
/* 76E7C 8007627C AC680000 */  sw         $t0, ($v1)
/* 76E80 80076280 AC690004 */  sw         $t1, 4($v1)
/* 76E84 80076284 AC6A0008 */  sw         $t2, 8($v1)
/* 76E88 80076288 AC6B000C */  sw         $t3, 0xc($v1)
/* 76E8C 8007628C 24420010 */  addiu      $v0, $v0, 0x10
/* 76E90 80076290 1446FFF6 */  bne        $v0, $a2, .L8007626C
/* 76E94 80076294 24630010 */   addiu     $v1, $v1, 0x10
/* 76E98 80076298 8C460000 */  lw         $a2, ($v0)
/* 76E9C 8007629C AC660000 */  sw         $a2, ($v1)
/* 76EA0 800762A0 00E51021 */  addu       $v0, $a3, $a1
/* 76EA4 800762A4 8C420000 */  lw         $v0, ($v0)
/* 76EA8 800762A8 50400006 */  beql       $v0, $zero, .L800762C4
/* 76EAC 800762AC 2402FFFF */   addiu     $v0, $zero, -1
/* 76EB0 800762B0 0040F809 */  jalr       $v0
/* 76EB4 800762B4 00000000 */   nop
/* 76EB8 800762B8 0801D8B2 */  j          .L800762C8
/* 76EBC 800762BC 8FBF0090 */   lw        $ra, 0x90($sp)
.L800762C0:
/* 76EC0 800762C0 2402FFFF */  addiu      $v0, $zero, -1
.L800762C4:
/* 76EC4 800762C4 8FBF0090 */  lw         $ra, 0x90($sp)
.L800762C8:
/* 76EC8 800762C8 03E00008 */  jr         $ra
/* 76ECC 800762CC 27BD0098 */   addiu     $sp, $sp, 0x98
