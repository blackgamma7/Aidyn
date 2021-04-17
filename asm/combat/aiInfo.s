.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel isBoss
/* 657C0 80064BC0 308400FF */  andi       $a0, $a0, 0xff
/* 657C4 80064BC4 2483FFA9 */  addiu      $v1, $a0, -0x57
/* 657C8 80064BC8 2C620066 */  sltiu      $v0, $v1, 0x66
/* 657CC 80064BCC 10400009 */  beqz       $v0, .L80064BF4
/* 657D0 80064BD0 3C02800E */   lui       $v0, %hi(D_800DF5A0)
/* 657D4 80064BD4 2442F5A0 */  addiu      $v0, $v0, %lo(D_800DF5A0)
/* 657D8 80064BD8 00031880 */  sll        $v1, $v1, 2
/* 657DC 80064BDC 00621821 */  addu       $v1, $v1, $v0
/* 657E0 80064BE0 8C640000 */  lw         $a0, ($v1)
/* 657E4 80064BE4 00800008 */  jr         $a0
/* 657E8 80064BE8 00000000 */   nop
/* 657EC 80064BEC 03E00008 */  jr         $ra
/* 657F0 80064BF0 24020001 */   addiu     $v0, $zero, 1
.L80064BF4:
/* 657F4 80064BF4 03E00008 */  jr         $ra
/* 657F8 80064BF8 00001021 */   addu      $v0, $zero, $zero

glabel combat_aiinfo_func
/* 657FC 80064BFC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 65800 80064C00 AFB3001C */  sw         $s3, 0x1c($sp)
/* 65804 80064C04 00809821 */  addu       $s3, $a0, $zero
/* 65808 80064C08 30A4FFFF */  andi       $a0, $a1, 0xffff
/* 6580C 80064C0C 00002821 */  addu       $a1, $zero, $zero
/* 65810 80064C10 AFBE0030 */  sw         $fp, 0x30($sp)
/* 65814 80064C14 00C0F021 */  addu       $fp, $a2, $zero
/* 65818 80064C18 00003021 */  addu       $a2, $zero, $zero
/* 6581C 80064C1C AFBF0034 */  sw         $ra, 0x34($sp)
/* 65820 80064C20 AFB7002C */  sw         $s7, 0x2c($sp)
/* 65824 80064C24 AFB60028 */  sw         $s6, 0x28($sp)
/* 65828 80064C28 AFB50024 */  sw         $s5, 0x24($sp)
/* 6582C 80064C2C AFB40020 */  sw         $s4, 0x20($sp)
/* 65830 80064C30 AFB20018 */  sw         $s2, 0x18($sp)
/* 65834 80064C34 AFB10014 */  sw         $s1, 0x14($sp)
/* 65838 80064C38 0C01D77A */  jal        GetIDIndex
/* 6583C 80064C3C AFB00010 */   sw        $s0, 0x10($sp)
/* 65840 80064C40 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 65844 80064C44 8C6413A0 */  lw         $a0, %lo(EntityPointer)($v1)
/* 65848 80064C48 0040B821 */  addu       $s7, $v0, $zero
/* 6584C 80064C4C 8C830010 */  lw         $v1, 0x10($a0)
/* 65850 80064C50 001711C0 */  sll        $v0, $s7, 7
/* 65854 80064C54 AE600018 */  sw         $zero, 0x18($s3)
/* 65858 80064C58 AE600000 */  sw         $zero, ($s3)
/* 6585C 80064C5C 00628821 */  addu       $s1, $v1, $v0
/* 65860 80064C60 86240044 */  lh         $a0, 0x44($s1)
/* 65864 80064C64 2403FFFF */  addiu      $v1, $zero, -1
/* 65868 80064C68 1083000D */  beq        $a0, $v1, .L80064CA0
/* 6586C 80064C6C 0000A821 */   addu      $s5, $zero, $zero
/* 65870 80064C70 86220040 */  lh         $v0, 0x40($s1)
/* 65874 80064C74 1043000A */  beq        $v0, $v1, .L80064CA0
/* 65878 80064C78 2404002C */   addiu     $a0, $zero, 0x2c
/* 6587C 80064C7C 3C05800E */  lui        $a1, %hi(D_800DF738)
/* 65880 80064C80 24A5F738 */  addiu      $a1, $a1, %lo(D_800DF738)
/* 65884 80064C84 0C025F9C */  jal        Malloc
/* 65888 80064C88 24060063 */   addiu     $a2, $zero, 0x63
/* 6588C 80064C8C 96250040 */  lhu        $a1, 0x40($s1)
/* 65890 80064C90 00402021 */  addu       $a0, $v0, $zero
/* 65894 80064C94 0C0212EC */  jal        createTempWeapon
/* 65898 80064C98 AE620000 */   sw        $v0, ($s3)
/* 6589C 80064C9C 0000A821 */  addu       $s5, $zero, $zero
.L80064CA0:
/* 658A0 80064CA0 00008021 */  addu       $s0, $zero, $zero
/* 658A4 80064CA4 2402FFFF */  addiu      $v0, $zero, -1
/* 658A8 80064CA8 A2620005 */  sb         $v0, 5($s3)
/* 658AC 80064CAC 9223001B */  lbu        $v1, 0x1b($s1)
/* 658B0 80064CB0 2671000A */  addiu      $s1, $s3, 0xa
/* 658B4 80064CB4 A2630006 */  sb         $v1, 6($s3)
/* 658B8 80064CB8 8FD20040 */  lw         $s2, 0x40($fp)
/* 658BC 80064CBC 2416FFFF */  addiu      $s6, $zero, -1
/* 658C0 80064CC0 8E54002C */  lw         $s4, 0x2c($s2)
/* 658C4 80064CC4 8E830000 */  lw         $v1, ($s4)
.L80064CC8:
/* 658C8 80064CC8 00101080 */  sll        $v0, $s0, 2
/* 658CC 80064CCC 00431021 */  addu       $v0, $v0, $v1
/* 658D0 80064CD0 8C420000 */  lw         $v0, ($v0)
/* 658D4 80064CD4 10400008 */  beqz       $v0, .L80064CF8
/* 658D8 80064CD8 00002821 */   addu      $a1, $zero, $zero
/* 658DC 80064CDC 00003021 */  addu       $a2, $zero, $zero
/* 658E0 80064CE0 94440000 */  lhu        $a0, ($v0)
/* 658E4 80064CE4 0C01D77A */  jal        GetIDIndex
/* 658E8 80064CE8 24150001 */   addiu     $s5, $zero, 1
/* 658EC 80064CEC 02301821 */  addu       $v1, $s1, $s0
/* 658F0 80064CF0 08019340 */  j          .L80064D00
/* 658F4 80064CF4 A0620000 */   sb        $v0, ($v1)
.L80064CF8:
/* 658F8 80064CF8 02301021 */  addu       $v0, $s1, $s0
/* 658FC 80064CFC A0560000 */  sb         $s6, ($v0)
.L80064D00:
/* 65900 80064D00 26020001 */  addiu      $v0, $s0, 1
/* 65904 80064D04 305000FF */  andi       $s0, $v0, 0xff
/* 65908 80064D08 2E030005 */  sltiu      $v1, $s0, 5
/* 6590C 80064D0C 5460FFEE */  bnel       $v1, $zero, .L80064CC8
/* 65910 80064D10 8E830000 */   lw        $v1, ($s4)
/* 65914 80064D14 8E420020 */  lw         $v0, 0x20($s2)
/* 65918 80064D18 8C420000 */  lw         $v0, ($v0)
/* 6591C 80064D1C 1040000B */  beqz       $v0, .L80064D4C
/* 65920 80064D20 02301821 */   addu      $v1, $s1, $s0
/* 65924 80064D24 8C420010 */  lw         $v0, 0x10($v0)
/* 65928 80064D28 10400008 */  beqz       $v0, .L80064D4C
/* 6592C 80064D2C 00002821 */   addu      $a1, $zero, $zero
/* 65930 80064D30 8C420000 */  lw         $v0, ($v0)
/* 65934 80064D34 00003021 */  addu       $a2, $zero, $zero
/* 65938 80064D38 94440000 */  lhu        $a0, ($v0)
/* 6593C 80064D3C 0C01D77A */  jal        GetIDIndex
/* 65940 80064D40 24150001 */   addiu     $s5, $zero, 1
/* 65944 80064D44 08019354 */  j          .L80064D50
/* 65948 80064D48 02301821 */   addu      $v1, $s1, $s0
.L80064D4C:
/* 6594C 80064D4C 2402FFFF */  addiu      $v0, $zero, -1
.L80064D50:
/* 65950 80064D50 A0620000 */  sb         $v0, ($v1)
/* 65954 80064D54 8E420020 */  lw         $v0, 0x20($s2)
/* 65958 80064D58 26030001 */  addiu      $v1, $s0, 1
/* 6595C 80064D5C 8C420004 */  lw         $v0, 4($v0)
/* 65960 80064D60 1040000B */  beqz       $v0, .L80064D90
/* 65964 80064D64 307000FF */   andi      $s0, $v1, 0xff
/* 65968 80064D68 8C420010 */  lw         $v0, 0x10($v0)
/* 6596C 80064D6C 10400008 */  beqz       $v0, .L80064D90
/* 65970 80064D70 00002821 */   addu      $a1, $zero, $zero
/* 65974 80064D74 8C420000 */  lw         $v0, ($v0)
/* 65978 80064D78 00003021 */  addu       $a2, $zero, $zero
/* 6597C 80064D7C 94440000 */  lhu        $a0, ($v0)
/* 65980 80064D80 0C01D77A */  jal        GetIDIndex
/* 65984 80064D84 24150001 */   addiu     $s5, $zero, 1
/* 65988 80064D88 08019366 */  j          .L80064D98
/* 6598C 80064D8C 02301821 */   addu      $v1, $s1, $s0
.L80064D90:
/* 65990 80064D90 02301821 */  addu       $v1, $s1, $s0
/* 65994 80064D94 2402FFFF */  addiu      $v0, $zero, -1
.L80064D98:
/* 65998 80064D98 A0620000 */  sb         $v0, ($v1)
/* 6599C 80064D9C 26020001 */  addiu      $v0, $s0, 1
/* 659A0 80064DA0 305000FF */  andi       $s0, $v0, 0xff
/* 659A4 80064DA4 00002821 */  addu       $a1, $zero, $zero
/* 659A8 80064DA8 8E440018 */  lw         $a0, 0x18($s2)
/* 659AC 80064DAC 0C021284 */  jal        getBaseStat
/* 659B0 80064DB0 8E520024 */   lw        $s2, 0x24($s2)
/* 659B4 80064DB4 2842000F */  slti       $v0, $v0, 0xf
/* 659B8 80064DB8 16400009 */  bnez       $s2, .L80064DE0
/* 659BC 80064DBC 38540001 */   xori      $s4, $v0, 1
/* 659C0 80064DC0 24020005 */  addiu      $v0, $zero, 5
/* 659C4 80064DC4 02302021 */  addu       $a0, $s1, $s0
/* 659C8 80064DC8 A2620008 */  sb         $v0, 8($s3)
/* 659CC 80064DCC 2402FFFF */  addiu      $v0, $zero, -1
/* 659D0 80064DD0 24030002 */  addiu      $v1, $zero, 2
/* 659D4 80064DD4 A0820000 */  sb         $v0, ($a0)
/* 659D8 80064DD8 080193B0 */  j          .L80064EC0
/* 659DC 80064DDC A2630004 */   sb        $v1, 4($s3)
.L80064DE0:
/* 659E0 80064DE0 8E420010 */  lw         $v0, 0x10($s2)
/* 659E4 80064DE4 10400008 */  beqz       $v0, .L80064E08
/* 659E8 80064DE8 00002821 */   addu      $a1, $zero, $zero
/* 659EC 80064DEC 8C420000 */  lw         $v0, ($v0)
/* 659F0 80064DF0 00003021 */  addu       $a2, $zero, $zero
/* 659F4 80064DF4 94440000 */  lhu        $a0, ($v0)
/* 659F8 80064DF8 0C01D77A */  jal        GetIDIndex
/* 659FC 80064DFC 24150001 */   addiu     $s5, $zero, 1
/* 65A00 80064E00 08019384 */  j          .L80064E10
/* 65A04 80064E04 02301821 */   addu      $v1, $s1, $s0
.L80064E08:
/* 65A08 80064E08 02301821 */  addu       $v1, $s1, $s0
/* 65A0C 80064E0C 2402FFFF */  addiu      $v0, $zero, -1
.L80064E10:
/* 65A10 80064E10 A0620000 */  sb         $v0, ($v1)
/* 65A14 80064E14 92420027 */  lbu        $v0, 0x27($s2)
/* 65A18 80064E18 10400018 */  beqz       $v0, .L80064E7C
/* 65A1C 80064E1C 00000000 */   nop
/* 65A20 80064E20 12A0000B */  beqz       $s5, .L80064E50
/* 65A24 80064E24 00000000 */   nop
/* 65A28 80064E28 0C0192F0 */  jal        isBoss
/* 65A2C 80064E2C 02E02021 */   addu      $a0, $s7, $zero
/* 65A30 80064E30 14400019 */  bnez       $v0, .L80064E98
/* 65A34 80064E34 2402000A */   addiu     $v0, $zero, 0xa
/* 65A38 80064E38 0C02131C */  jal        isBreathSpitOrSpikes
/* 65A3C 80064E3C 02402021 */   addu      $a0, $s2, $zero
/* 65A40 80064E40 14400015 */  bnez       $v0, .L80064E98
/* 65A44 80064E44 24020008 */   addiu     $v0, $zero, 8
/* 65A48 80064E48 080193A6 */  j          .L80064E98
/* 65A4C 80064E4C 24020007 */   addiu     $v0, $zero, 7
.L80064E50:
/* 65A50 80064E50 0C02131C */  jal        isBreathSpitOrSpikes
/* 65A54 80064E54 02402021 */   addu      $a0, $s2, $zero
/* 65A58 80064E58 14400004 */  bnez       $v0, .L80064E6C
/* 65A5C 80064E5C 24020004 */   addiu     $v0, $zero, 4
/* 65A60 80064E60 16800002 */  bnez       $s4, .L80064E6C
/* 65A64 80064E64 24020003 */   addiu     $v0, $zero, 3
/* 65A68 80064E68 24020002 */  addiu      $v0, $zero, 2
.L80064E6C:
/* 65A6C 80064E6C 24030001 */  addiu      $v1, $zero, 1
/* 65A70 80064E70 A2620008 */  sb         $v0, 8($s3)
/* 65A74 80064E74 080193B0 */  j          .L80064EC0
/* 65A78 80064E78 A2630004 */   sb        $v1, 4($s3)
.L80064E7C:
/* 65A7C 80064E7C 12A0000A */  beqz       $s5, .L80064EA8
/* 65A80 80064E80 00000000 */   nop
/* 65A84 80064E84 0C0192F0 */  jal        isBoss
/* 65A88 80064E88 02E02021 */   addu      $a0, $s7, $zero
/* 65A8C 80064E8C 14400002 */  bnez       $v0, .L80064E98
/* 65A90 80064E90 24020009 */   addiu     $v0, $zero, 9
/* 65A94 80064E94 24020006 */  addiu      $v0, $zero, 6
.L80064E98:
/* 65A98 80064E98 A2620008 */  sb         $v0, 8($s3)
/* 65A9C 80064E9C 24020002 */  addiu      $v0, $zero, 2
/* 65AA0 80064EA0 080193B0 */  j          .L80064EC0
/* 65AA4 80064EA4 A2620004 */   sb        $v0, 4($s3)
.L80064EA8:
/* 65AA8 80064EA8 12800003 */  beqz       $s4, .L80064EB8
/* 65AAC 80064EAC 24020001 */   addiu     $v0, $zero, 1
/* 65AB0 80064EB0 080193AF */  j          .L80064EBC
/* 65AB4 80064EB4 A2620008 */   sb        $v0, 8($s3)
.L80064EB8:
/* 65AB8 80064EB8 A2600008 */  sb         $zero, 8($s3)
.L80064EBC:
/* 65ABC 80064EBC A2600004 */  sb         $zero, 4($s3)
.L80064EC0:
/* 65AC0 80064EC0 92630004 */  lbu        $v1, 4($s3)
/* 65AC4 80064EC4 8FBF0034 */  lw         $ra, 0x34($sp)
/* 65AC8 80064EC8 AE7E0014 */  sw         $fp, 0x14($s3)
/* 65ACC 80064ECC 8FBE0030 */  lw         $fp, 0x30($sp)
/* 65AD0 80064ED0 8FB7002C */  lw         $s7, 0x2c($sp)
/* 65AD4 80064ED4 8FB60028 */  lw         $s6, 0x28($sp)
/* 65AD8 80064ED8 8FB50024 */  lw         $s5, 0x24($sp)
/* 65ADC 80064EDC 8FB40020 */  lw         $s4, 0x20($sp)
/* 65AE0 80064EE0 8FB20018 */  lw         $s2, 0x18($sp)
/* 65AE4 80064EE4 8FB10014 */  lw         $s1, 0x14($sp)
/* 65AE8 80064EE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 65AEC 80064EEC 24020008 */  addiu      $v0, $zero, 8
/* 65AF0 80064EF0 A2620009 */  sb         $v0, 9($s3)
/* 65AF4 80064EF4 2402FFFF */  addiu      $v0, $zero, -1
/* 65AF8 80064EF8 A2620012 */  sb         $v0, 0x12($s3)
/* 65AFC 80064EFC A2600013 */  sb         $zero, 0x13($s3)
/* 65B00 80064F00 A2630007 */  sb         $v1, 7($s3)
/* 65B04 80064F04 8FB3001C */  lw         $s3, 0x1c($sp)
/* 65B08 80064F08 03E00008 */  jr         $ra
/* 65B0C 80064F0C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel combataiInfo_free
/* 65B10 80064F10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 65B14 80064F14 AFB00010 */  sw         $s0, 0x10($sp)
/* 65B18 80064F18 00808021 */  addu       $s0, $a0, $zero
/* 65B1C 80064F1C AFBF0014 */  sw         $ra, 0x14($sp)
/* 65B20 80064F20 8E040000 */  lw         $a0, ($s0)
/* 65B24 80064F24 1080000A */  beqz       $a0, .L80064F50
/* 65B28 80064F28 8FBF0014 */   lw        $ra, 0x14($sp)
/* 65B2C 80064F2C 0C021315 */  jal        passto_clear_weapon_effects
/* 65B30 80064F30 00000000 */   nop
/* 65B34 80064F34 3C05800E */  lui        $a1, %hi(D_800DF738)
/* 65B38 80064F38 24A5F738 */  addiu      $a1, $a1, %lo(D_800DF738)
/* 65B3C 80064F3C 8E040000 */  lw         $a0, ($s0)
/* 65B40 80064F40 0C02600C */  jal        Free
/* 65B44 80064F44 2406013E */   addiu     $a2, $zero, 0x13e
/* 65B48 80064F48 AE000000 */  sw         $zero, ($s0)
/* 65B4C 80064F4C 8FBF0014 */  lw         $ra, 0x14($sp)
.L80064F50:
/* 65B50 80064F50 8FB00010 */  lw         $s0, 0x10($sp)
/* 65B54 80064F54 03E00008 */  jr         $ra
/* 65B58 80064F58 27BD0018 */   addiu     $sp, $sp, 0x18
/* 65B5C 80064F5C 00000000 */  nop
