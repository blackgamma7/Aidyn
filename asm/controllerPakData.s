.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80085C20
/* 86820 80085C20 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 86824 80085C24 AFB00020 */  sw         $s0, 0x20($sp)
/* 86828 80085C28 8FB00050 */  lw         $s0, 0x50($sp)
/* 8682C 80085C2C AFB50034 */  sw         $s5, 0x34($sp)
/* 86830 80085C30 3095FFFF */  andi       $s5, $a0, 0xffff
/* 86834 80085C34 AFB10024 */  sw         $s1, 0x24($sp)
/* 86838 80085C38 8FB10054 */  lw         $s1, 0x54($sp)
/* 8683C 80085C3C 240402CC */  addiu      $a0, $zero, 0x2cc
/* 86840 80085C40 AFB3002C */  sw         $s3, 0x2c($sp)
/* 86844 80085C44 00C09821 */  addu       $s3, $a2, $zero
/* 86848 80085C48 AFB20028 */  sw         $s2, 0x28($sp)
/* 8684C 80085C4C 00E09021 */  addu       $s2, $a3, $zero
/* 86850 80085C50 AFB40030 */  sw         $s4, 0x30($sp)
/* 86854 80085C54 AFBF0038 */  sw         $ra, 0x38($sp)
/* 86858 80085C58 0C026259 */  jal        passToMalloc
/* 8685C 80085C5C 30B4FFFF */   andi      $s4, $a1, 0xffff
/* 86860 80085C60 00402021 */  addu       $a0, $v0, $zero
/* 86864 80085C64 02A02821 */  addu       $a1, $s5, $zero
/* 86868 80085C68 02803021 */  addu       $a2, $s4, $zero
/* 8686C 80085C6C 02603821 */  addu       $a3, $s3, $zero
/* 86870 80085C70 AFB30010 */  sw         $s3, 0x10($sp)
/* 86874 80085C74 AFB20014 */  sw         $s2, 0x14($sp)
/* 86878 80085C78 AFB00018 */  sw         $s0, 0x18($sp)
/* 8687C 80085C7C 0C021FD0 */  jal        controllerpakdata_func_1
/* 86880 80085C80 AFB1001C */   sw        $s1, 0x1c($sp)
/* 86884 80085C84 00002021 */  addu       $a0, $zero, $zero
/* 86888 80085C88 3C10800F */  lui        $s0, %hi(contPakDat)
/* 8688C 80085C8C 0C0271BF */  jal        cont_delay
/* 86890 80085C90 AE021C60 */   sw        $v0, %lo(contPakDat)($s0)
/* 86894 80085C94 8E021C60 */  lw         $v0, 0x1c60($s0)
/* 86898 80085C98 8FBF0038 */  lw         $ra, 0x38($sp)
/* 8689C 80085C9C 8FB50034 */  lw         $s5, 0x34($sp)
/* 868A0 80085CA0 8FB40030 */  lw         $s4, 0x30($sp)
/* 868A4 80085CA4 8FB3002C */  lw         $s3, 0x2c($sp)
/* 868A8 80085CA8 8FB20028 */  lw         $s2, 0x28($sp)
/* 868AC 80085CAC 8FB10024 */  lw         $s1, 0x24($sp)
/* 868B0 80085CB0 8FB00020 */  lw         $s0, 0x20($sp)
/* 868B4 80085CB4 03E00008 */  jr         $ra
/* 868B8 80085CB8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel ContpakData_malloc
/* 868BC 80085CBC 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 868C0 80085CC0 AFB00020 */  sw         $s0, 0x20($sp)
/* 868C4 80085CC4 8FB00050 */  lw         $s0, 0x50($sp)
/* 868C8 80085CC8 AFB10024 */  sw         $s1, 0x24($sp)
/* 868CC 80085CCC 8FB10054 */  lw         $s1, 0x54($sp)
/* 868D0 80085CD0 AFB50034 */  sw         $s5, 0x34($sp)
/* 868D4 80085CD4 3095FFFF */  andi       $s5, $a0, 0xffff
/* 868D8 80085CD8 AFB20028 */  sw         $s2, 0x28($sp)
/* 868DC 80085CDC 8FB20058 */  lw         $s2, 0x58($sp)
/* 868E0 80085CE0 240402C4 */  addiu      $a0, $zero, 0x2c4
/* 868E4 80085CE4 AFB60038 */  sw         $s6, 0x38($sp)
/* 868E8 80085CE8 00C0B021 */  addu       $s6, $a2, $zero
/* 868EC 80085CEC AFB3002C */  sw         $s3, 0x2c($sp)
/* 868F0 80085CF0 00E09821 */  addu       $s3, $a3, $zero
/* 868F4 80085CF4 AFB40030 */  sw         $s4, 0x30($sp)
/* 868F8 80085CF8 AFBF003C */  sw         $ra, 0x3c($sp)
/* 868FC 80085CFC 0C026259 */  jal        passToMalloc
/* 86900 80085D00 30B4FFFF */   andi      $s4, $a1, 0xffff
/* 86904 80085D04 00402021 */  addu       $a0, $v0, $zero
/* 86908 80085D08 02A02821 */  addu       $a1, $s5, $zero
/* 8690C 80085D0C 02803021 */  addu       $a2, $s4, $zero
/* 86910 80085D10 02C03821 */  addu       $a3, $s6, $zero
/* 86914 80085D14 AFB30010 */  sw         $s3, 0x10($sp)
/* 86918 80085D18 AFB00014 */  sw         $s0, 0x14($sp)
/* 8691C 80085D1C AFB10018 */  sw         $s1, 0x18($sp)
/* 86920 80085D20 0C0221C3 */  jal        func_8008870C
/* 86924 80085D24 AFB2001C */   sw        $s2, 0x1c($sp)
/* 86928 80085D28 00002021 */  addu       $a0, $zero, $zero
/* 8692C 80085D2C 3C10800F */  lui        $s0, %hi(contPakDat)
/* 86930 80085D30 0C0271BF */  jal        cont_delay
/* 86934 80085D34 AE021C60 */   sw        $v0, %lo(contPakDat)($s0)
/* 86938 80085D38 8E021C60 */  lw         $v0, 0x1c60($s0)
/* 8693C 80085D3C 8FBF003C */  lw         $ra, 0x3c($sp)
/* 86940 80085D40 8FB60038 */  lw         $s6, 0x38($sp)
/* 86944 80085D44 8FB50034 */  lw         $s5, 0x34($sp)
/* 86948 80085D48 8FB40030 */  lw         $s4, 0x30($sp)
/* 8694C 80085D4C 8FB3002C */  lw         $s3, 0x2c($sp)
/* 86950 80085D50 8FB20028 */  lw         $s2, 0x28($sp)
/* 86954 80085D54 8FB10024 */  lw         $s1, 0x24($sp)
/* 86958 80085D58 8FB00020 */  lw         $s0, 0x20($sp)
/* 8695C 80085D5C 03E00008 */  jr         $ra
/* 86960 80085D60 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80085D64
/* 86964 80085D64 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86968 80085D68 00002021 */  addu       $a0, $zero, $zero
/* 8696C 80085D6C AFB00010 */  sw         $s0, 0x10($sp)
/* 86970 80085D70 AFBF0014 */  sw         $ra, 0x14($sp)
/* 86974 80085D74 0C0271BF */  jal        cont_delay
/* 86978 80085D78 00A08021 */   addu      $s0, $a1, $zero
/* 8697C 80085D7C 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86980 80085D80 8C641C60 */  lw         $a0, %lo(contPakDat)($v1)
/* 86984 80085D84 0C021B08 */  jal        func_80086C20
/* 86988 80085D88 9205005C */   lbu       $a1, 0x5c($s0)
/* 8698C 80085D8C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 86990 80085D90 8FB00010 */  lw         $s0, 0x10($sp)
/* 86994 80085D94 00001021 */  addu       $v0, $zero, $zero
/* 86998 80085D98 03E00008 */  jr         $ra
/* 8699C 80085D9C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80085DA0
/* 869A0 80085DA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 869A4 80085DA4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 869A8 80085DA8 0C0271BF */  jal        cont_delay
/* 869AC 80085DAC 00002021 */   addu      $a0, $zero, $zero
/* 869B0 80085DB0 3C03800F */  lui        $v1, %hi(contPakDat)
/* 869B4 80085DB4 0C021AF4 */  jal        func_80086BD0
/* 869B8 80085DB8 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 869BC 80085DBC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 869C0 80085DC0 00001021 */  addu       $v0, $zero, $zero
/* 869C4 80085DC4 03E00008 */  jr         $ra
/* 869C8 80085DC8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80085DCC
/* 869CC 80085DCC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 869D0 80085DD0 00002021 */  addu       $a0, $zero, $zero
/* 869D4 80085DD4 AFB00010 */  sw         $s0, 0x10($sp)
/* 869D8 80085DD8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 869DC 80085DDC 0C0271BF */  jal        cont_delay
/* 869E0 80085DE0 00A08021 */   addu      $s0, $a1, $zero
/* 869E4 80085DE4 3C03800F */  lui        $v1, %hi(contPakDat)
/* 869E8 80085DE8 8C641C60 */  lw         $a0, %lo(contPakDat)($v1)
/* 869EC 80085DEC 0C021B1B */  jal        func_80086C6C
/* 869F0 80085DF0 9205005C */   lbu       $a1, 0x5c($s0)
/* 869F4 80085DF4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 869F8 80085DF8 8FB00010 */  lw         $s0, 0x10($sp)
/* 869FC 80085DFC 00001021 */  addu       $v0, $zero, $zero
/* 86A00 80085E00 03E00008 */  jr         $ra
/* 86A04 80085E04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80085E08
/* 86A08 80085E08 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86A0C 80085E0C 00002021 */  addu       $a0, $zero, $zero
/* 86A10 80085E10 AFB00010 */  sw         $s0, 0x10($sp)
/* 86A14 80085E14 AFBF0014 */  sw         $ra, 0x14($sp)
/* 86A18 80085E18 0C0271BF */  jal        cont_delay
/* 86A1C 80085E1C 00A08021 */   addu      $s0, $a1, $zero
/* 86A20 80085E20 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86A24 80085E24 8C641C60 */  lw         $a0, %lo(contPakDat)($v1)
/* 86A28 80085E28 0C021B5E */  jal        func_80086D78
/* 86A2C 80085E2C 9205005C */   lbu       $a1, 0x5c($s0)
/* 86A30 80085E30 8FBF0014 */  lw         $ra, 0x14($sp)
/* 86A34 80085E34 8FB00010 */  lw         $s0, 0x10($sp)
/* 86A38 80085E38 00001021 */  addu       $v0, $zero, $zero
/* 86A3C 80085E3C 03E00008 */  jr         $ra
/* 86A40 80085E40 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80085E44
/* 86A44 80085E44 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 86A48 80085E48 00002021 */  addu       $a0, $zero, $zero
/* 86A4C 80085E4C AFB20020 */  sw         $s2, 0x20($sp)
/* 86A50 80085E50 00A09021 */  addu       $s2, $a1, $zero
/* 86A54 80085E54 AFBF0024 */  sw         $ra, 0x24($sp)
/* 86A58 80085E58 AFB1001C */  sw         $s1, 0x1c($sp)
/* 86A5C 80085E5C 0C0271BF */  jal        cont_delay
/* 86A60 80085E60 AFB00018 */   sw        $s0, 0x18($sp)
/* 86A64 80085E64 3C048008 */  lui        $a0, %hi(func_80086290)
/* 86A68 80085E68 24846290 */  addiu      $a0, $a0, %lo(func_80086290)
/* 86A6C 80085E6C 24060002 */  addiu      $a2, $zero, 2
/* 86A70 80085E70 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86A74 80085E74 3C10800E */  lui        $s0, %hi(gGlobals)
/* 86A78 80085E78 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 86A7C 80085E7C AFA00010 */  sw         $zero, 0x10($sp)
/* 86A80 80085E80 8E02204C */  lw         $v0, 0x204c($s0)
/* 86A84 80085E84 8C651C60 */  lw         $a1, %lo(contPakDat)($v1)
/* 86A88 80085E88 8C4705D0 */  lw         $a3, 0x5d0($v0)
/* 86A8C 80085E8C 0C0222AB */  jal        func_80088AAC
/* 86A90 80085E90 24A502BC */   addiu     $a1, $a1, 0x2bc
/* 86A94 80085E94 3C058008 */  lui        $a1, %hi(func_80086018)
/* 86A98 80085E98 24A56018 */  addiu      $a1, $a1, %lo(func_80086018)
/* 86A9C 80085E9C 8E03204C */  lw         $v1, 0x204c($s0)
/* 86AA0 80085EA0 24060080 */  addiu      $a2, $zero, 0x80
/* 86AA4 80085EA4 8C6405D4 */  lw         $a0, 0x5d4($v1)
/* 86AA8 80085EA8 0C02227C */  jal        text_func
/* 86AAC 80085EAC 00408821 */   addu      $s1, $v0, $zero
/* 86AB0 80085EB0 02202021 */  addu       $a0, $s1, $zero
/* 86AB4 80085EB4 9643005E */  lhu        $v1, 0x5e($s2)
/* 86AB8 80085EB8 00402821 */  addu       $a1, $v0, $zero
/* 86ABC 80085EBC 0C013626 */  jal        func_8004D898
/* 86AC0 80085EC0 A443005E */   sh        $v1, 0x5e($v0)
/* 86AC4 80085EC4 8E02204C */  lw         $v0, 0x204c($s0)
/* 86AC8 80085EC8 00002821 */  addu       $a1, $zero, $zero
/* 86ACC 80085ECC 8C4405D8 */  lw         $a0, 0x5d8($v0)
/* 86AD0 80085ED0 0C02227C */  jal        text_func
/* 86AD4 80085ED4 24060080 */   addiu     $a2, $zero, 0x80
/* 86AD8 80085ED8 02202021 */  addu       $a0, $s1, $zero
/* 86ADC 80085EDC 0C013626 */  jal        func_8004D898
/* 86AE0 80085EE0 00402821 */   addu      $a1, $v0, $zero
/* 86AE4 80085EE4 0C013786 */  jal        func_8004DE18
/* 86AE8 80085EE8 02202021 */   addu      $a0, $s1, $zero
/* 86AEC 80085EEC 8FBF0024 */  lw         $ra, 0x24($sp)
/* 86AF0 80085EF0 8FB20020 */  lw         $s2, 0x20($sp)
/* 86AF4 80085EF4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 86AF8 80085EF8 8FB00018 */  lw         $s0, 0x18($sp)
/* 86AFC 80085EFC 00001021 */  addu       $v0, $zero, $zero
/* 86B00 80085F00 03E00008 */  jr         $ra
/* 86B04 80085F04 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80085F08
/* 86B08 80085F08 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 86B0C 80085F0C 00002021 */  addu       $a0, $zero, $zero
/* 86B10 80085F10 AFB20020 */  sw         $s2, 0x20($sp)
/* 86B14 80085F14 00A09021 */  addu       $s2, $a1, $zero
/* 86B18 80085F18 AFBF0024 */  sw         $ra, 0x24($sp)
/* 86B1C 80085F1C AFB1001C */  sw         $s1, 0x1c($sp)
/* 86B20 80085F20 0C0271BF */  jal        cont_delay
/* 86B24 80085F24 AFB00018 */   sw        $s0, 0x18($sp)
/* 86B28 80085F28 3C048008 */  lui        $a0, %hi(func_80086290)
/* 86B2C 80085F2C 24846290 */  addiu      $a0, $a0, %lo(func_80086290)
/* 86B30 80085F30 24060002 */  addiu      $a2, $zero, 2
/* 86B34 80085F34 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86B38 80085F38 3C10800E */  lui        $s0, %hi(gGlobals)
/* 86B3C 80085F3C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 86B40 80085F40 AFA00010 */  sw         $zero, 0x10($sp)
/* 86B44 80085F44 8E02204C */  lw         $v0, 0x204c($s0)
/* 86B48 80085F48 8C651C60 */  lw         $a1, %lo(contPakDat)($v1)
/* 86B4C 80085F4C 8C470668 */  lw         $a3, 0x668($v0)
/* 86B50 80085F50 0C0222AB */  jal        func_80088AAC
/* 86B54 80085F54 24A502BC */   addiu     $a1, $a1, 0x2bc
/* 86B58 80085F58 3C058008 */  lui        $a1, %hi(func_80085FCC)
/* 86B5C 80085F5C 24A55FCC */  addiu      $a1, $a1, %lo(func_80085FCC)
/* 86B60 80085F60 8E03204C */  lw         $v1, 0x204c($s0)
/* 86B64 80085F64 24060080 */  addiu      $a2, $zero, 0x80
/* 86B68 80085F68 8C64066C */  lw         $a0, 0x66c($v1)
/* 86B6C 80085F6C 0C02227C */  jal        text_func
/* 86B70 80085F70 00408821 */   addu      $s1, $v0, $zero
/* 86B74 80085F74 02202021 */  addu       $a0, $s1, $zero
/* 86B78 80085F78 9643005E */  lhu        $v1, 0x5e($s2)
/* 86B7C 80085F7C 00402821 */  addu       $a1, $v0, $zero
/* 86B80 80085F80 0C013626 */  jal        func_8004D898
/* 86B84 80085F84 A443005E */   sh        $v1, 0x5e($v0)
/* 86B88 80085F88 8E02204C */  lw         $v0, 0x204c($s0)
/* 86B8C 80085F8C 00002821 */  addu       $a1, $zero, $zero
/* 86B90 80085F90 8C4405D8 */  lw         $a0, 0x5d8($v0)
/* 86B94 80085F94 0C02227C */  jal        text_func
/* 86B98 80085F98 24060080 */   addiu     $a2, $zero, 0x80
/* 86B9C 80085F9C 02202021 */  addu       $a0, $s1, $zero
/* 86BA0 80085FA0 0C013626 */  jal        func_8004D898
/* 86BA4 80085FA4 00402821 */   addu      $a1, $v0, $zero
/* 86BA8 80085FA8 0C013786 */  jal        func_8004DE18
/* 86BAC 80085FAC 02202021 */   addu      $a0, $s1, $zero
/* 86BB0 80085FB0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 86BB4 80085FB4 8FB20020 */  lw         $s2, 0x20($sp)
/* 86BB8 80085FB8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 86BBC 80085FBC 8FB00018 */  lw         $s0, 0x18($sp)
/* 86BC0 80085FC0 00001021 */  addu       $v0, $zero, $zero
/* 86BC4 80085FC4 03E00008 */  jr         $ra
/* 86BC8 80085FC8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80085FCC
/* 86BCC 80085FCC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86BD0 80085FD0 00002021 */  addu       $a0, $zero, $zero
/* 86BD4 80085FD4 AFB00010 */  sw         $s0, 0x10($sp)
/* 86BD8 80085FD8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 86BDC 80085FDC 0C0271BF */  jal        cont_delay
/* 86BE0 80085FE0 00A08021 */   addu      $s0, $a1, $zero
/* 86BE4 80085FE4 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86BE8 80085FE8 8C661C60 */  lw         $a2, %lo(contPakDat)($v1)
/* 86BEC 80085FEC 8CC20078 */  lw         $v0, 0x78($a2)
/* 86BF0 80085FF0 9205005F */  lbu        $a1, 0x5f($s0)
/* 86BF4 80085FF4 844400D8 */  lh         $a0, 0xd8($v0)
/* 86BF8 80085FF8 8C4300DC */  lw         $v1, 0xdc($v0)
/* 86BFC 80085FFC 0060F809 */  jalr       $v1
/* 86C00 80086000 00C42021 */   addu      $a0, $a2, $a0
/* 86C04 80086004 8FBF0014 */  lw         $ra, 0x14($sp)
/* 86C08 80086008 8FB00010 */  lw         $s0, 0x10($sp)
/* 86C0C 8008600C 00001021 */  addu       $v0, $zero, $zero
/* 86C10 80086010 03E00008 */  jr         $ra
/* 86C14 80086014 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086018
/* 86C18 80086018 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86C1C 8008601C 00002021 */  addu       $a0, $zero, $zero
/* 86C20 80086020 AFB00010 */  sw         $s0, 0x10($sp)
/* 86C24 80086024 AFBF0014 */  sw         $ra, 0x14($sp)
/* 86C28 80086028 0C0271BF */  jal        cont_delay
/* 86C2C 8008602C 00A08021 */   addu      $s0, $a1, $zero
/* 86C30 80086030 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86C34 80086034 8C641C60 */  lw         $a0, %lo(contPakDat)($v1)
/* 86C38 80086038 0C021B2F */  jal        try_erase_game_file_2
/* 86C3C 8008603C 9205005F */   lbu       $a1, 0x5f($s0)
/* 86C40 80086040 8FBF0014 */  lw         $ra, 0x14($sp)
/* 86C44 80086044 8FB00010 */  lw         $s0, 0x10($sp)
/* 86C48 80086048 00001021 */  addu       $v0, $zero, $zero
/* 86C4C 8008604C 03E00008 */  jr         $ra
/* 86C50 80086050 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086054
/* 86C54 80086054 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86C58 80086058 AFBF0010 */  sw         $ra, 0x10($sp)
/* 86C5C 8008605C 0C0271BF */  jal        cont_delay
/* 86C60 80086060 00002021 */   addu      $a0, $zero, $zero
/* 86C64 80086064 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86C68 80086068 0C021B4C */  jal        func_80086D30
/* 86C6C 8008606C 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 86C70 80086070 8FBF0010 */  lw         $ra, 0x10($sp)
/* 86C74 80086074 00001021 */  addu       $v0, $zero, $zero
/* 86C78 80086078 03E00008 */  jr         $ra
/* 86C7C 8008607C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086080
/* 86C80 80086080 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 86C84 80086084 AFB10014 */  sw         $s1, 0x14($sp)
/* 86C88 80086088 00808821 */  addu       $s1, $a0, $zero
/* 86C8C 8008608C 00002021 */  addu       $a0, $zero, $zero
/* 86C90 80086090 AFB00010 */  sw         $s0, 0x10($sp)
/* 86C94 80086094 AFBF0018 */  sw         $ra, 0x18($sp)
/* 86C98 80086098 0C0271BF */  jal        cont_delay
/* 86C9C 8008609C 00A08021 */   addu      $s0, $a1, $zero
/* 86CA0 800860A0 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86CA4 800860A4 0C021F01 */  jal        func_80087C04
/* 86CA8 800860A8 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 86CAC 800860AC 02202021 */  addu       $a0, $s1, $zero
/* 86CB0 800860B0 0C021815 */  jal        func_80086054
/* 86CB4 800860B4 02002821 */   addu      $a1, $s0, $zero
/* 86CB8 800860B8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 86CBC 800860BC 8FB10014 */  lw         $s1, 0x14($sp)
/* 86CC0 800860C0 8FB00010 */  lw         $s0, 0x10($sp)
/* 86CC4 800860C4 03E00008 */  jr         $ra
/* 86CC8 800860C8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800860CC
/* 86CCC 800860CC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 86CD0 800860D0 AFB10014 */  sw         $s1, 0x14($sp)
/* 86CD4 800860D4 00808821 */  addu       $s1, $a0, $zero
/* 86CD8 800860D8 00002021 */  addu       $a0, $zero, $zero
/* 86CDC 800860DC AFB00010 */  sw         $s0, 0x10($sp)
/* 86CE0 800860E0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 86CE4 800860E4 0C0271BF */  jal        cont_delay
/* 86CE8 800860E8 00A08021 */   addu      $s0, $a1, $zero
/* 86CEC 800860EC 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86CF0 800860F0 0C021F10 */  jal        func_80087C40
/* 86CF4 800860F4 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 86CF8 800860F8 02202021 */  addu       $a0, $s1, $zero
/* 86CFC 800860FC 0C021820 */  jal        func_80086080
/* 86D00 80086100 02002821 */   addu      $a1, $s0, $zero
/* 86D04 80086104 8FBF0018 */  lw         $ra, 0x18($sp)
/* 86D08 80086108 8FB10014 */  lw         $s1, 0x14($sp)
/* 86D0C 8008610C 8FB00010 */  lw         $s0, 0x10($sp)
/* 86D10 80086110 03E00008 */  jr         $ra
/* 86D14 80086114 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086118
/* 86D18 80086118 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86D1C 8008611C AFBF0010 */  sw         $ra, 0x10($sp)
/* 86D20 80086120 0C0271BF */  jal        cont_delay
/* 86D24 80086124 00002021 */   addu      $a0, $zero, $zero
/* 86D28 80086128 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86D2C 8008612C 0C021B4F */  jal        func_80086D3C
/* 86D30 80086130 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 86D34 80086134 8FBF0010 */  lw         $ra, 0x10($sp)
/* 86D38 80086138 00001021 */  addu       $v0, $zero, $zero
/* 86D3C 8008613C 03E00008 */  jr         $ra
/* 86D40 80086140 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086144
/* 86D44 80086144 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86D48 80086148 AFBF0010 */  sw         $ra, 0x10($sp)
/* 86D4C 8008614C 0C0271BF */  jal        cont_delay
/* 86D50 80086150 00002021 */   addu      $a0, $zero, $zero
/* 86D54 80086154 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86D58 80086158 8C651C60 */  lw         $a1, %lo(contPakDat)($v1)
/* 86D5C 8008615C 8CA20078 */  lw         $v0, 0x78($a1)
/* 86D60 80086160 844400E8 */  lh         $a0, 0xe8($v0)
/* 86D64 80086164 8C4300EC */  lw         $v1, 0xec($v0)
/* 86D68 80086168 0060F809 */  jalr       $v1
/* 86D6C 8008616C 00A42021 */   addu      $a0, $a1, $a0
/* 86D70 80086170 8FBF0010 */  lw         $ra, 0x10($sp)
/* 86D74 80086174 00001021 */  addu       $v0, $zero, $zero
/* 86D78 80086178 03E00008 */  jr         $ra
/* 86D7C 8008617C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086180
/* 86D80 80086180 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 86D84 80086184 00002021 */  addu       $a0, $zero, $zero
/* 86D88 80086188 AFBF001C */  sw         $ra, 0x1c($sp)
/* 86D8C 8008618C 0C0271BF */  jal        cont_delay
/* 86D90 80086190 AFB00018 */   sw        $s0, 0x18($sp)
/* 86D94 80086194 3C048008 */  lui        $a0, %hi(func_80086290)
/* 86D98 80086198 24846290 */  addiu      $a0, $a0, %lo(func_80086290)
/* 86D9C 8008619C 24060001 */  addiu      $a2, $zero, 1
/* 86DA0 800861A0 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86DA4 800861A4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 86DA8 800861A8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 86DAC 800861AC AFA00010 */  sw         $zero, 0x10($sp)
/* 86DB0 800861B0 8E02204C */  lw         $v0, 0x204c($s0)
/* 86DB4 800861B4 8C651C60 */  lw         $a1, %lo(contPakDat)($v1)
/* 86DB8 800861B8 8C470628 */  lw         $a3, 0x628($v0)
/* 86DBC 800861BC 0C0222AB */  jal        func_80088AAC
/* 86DC0 800861C0 24A502BC */   addiu     $a1, $a1, 0x2bc
/* 86DC4 800861C4 3C058008 */  lui        $a1, %hi(func_80085D64)
/* 86DC8 800861C8 24A55D64 */  addiu      $a1, $a1, %lo(func_80085D64)
/* 86DCC 800861CC 8E03204C */  lw         $v1, 0x204c($s0)
/* 86DD0 800861D0 24060080 */  addiu      $a2, $zero, 0x80
/* 86DD4 800861D4 8C6402C0 */  lw         $a0, 0x2c0($v1)
/* 86DD8 800861D8 0C02227C */  jal        text_func
/* 86DDC 800861DC 00408021 */   addu      $s0, $v0, $zero
/* 86DE0 800861E0 02002021 */  addu       $a0, $s0, $zero
/* 86DE4 800861E4 0C013626 */  jal        func_8004D898
/* 86DE8 800861E8 00402821 */   addu      $a1, $v0, $zero
/* 86DEC 800861EC 0C013786 */  jal        func_8004DE18
/* 86DF0 800861F0 02002021 */   addu      $a0, $s0, $zero
/* 86DF4 800861F4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 86DF8 800861F8 8FB00018 */  lw         $s0, 0x18($sp)
/* 86DFC 800861FC 00001021 */  addu       $v0, $zero, $zero
/* 86E00 80086200 03E00008 */  jr         $ra
/* 86E04 80086204 27BD0020 */   addiu     $sp, $sp, 0x20

glabel repeated_space_warning
/* 86E08 80086208 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 86E0C 8008620C 00002021 */  addu       $a0, $zero, $zero
/* 86E10 80086210 AFBF001C */  sw         $ra, 0x1c($sp)
/* 86E14 80086214 0C0271BF */  jal        cont_delay
/* 86E18 80086218 AFB00018 */   sw        $s0, 0x18($sp)
/* 86E1C 8008621C 3C048008 */  lui        $a0, %hi(func_80086290)
/* 86E20 80086220 24846290 */  addiu      $a0, $a0, %lo(func_80086290)
/* 86E24 80086224 24060001 */  addiu      $a2, $zero, 1
/* 86E28 80086228 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86E2C 8008622C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 86E30 80086230 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 86E34 80086234 AFA00010 */  sw         $zero, 0x10($sp)
/* 86E38 80086238 8E02204C */  lw         $v0, 0x204c($s0)
/* 86E3C 8008623C 8C651C60 */  lw         $a1, %lo(contPakDat)($v1)
/* 86E40 80086240 8C470624 */  lw         $a3, 0x624($v0)
/* 86E44 80086244 0C0222AB */  jal        func_80088AAC
/* 86E48 80086248 24A502BC */   addiu     $a1, $a1, 0x2bc
/* 86E4C 8008624C 3C058008 */  lui        $a1, %hi(func_80085D64)
/* 86E50 80086250 24A55D64 */  addiu      $a1, $a1, %lo(func_80085D64)
/* 86E54 80086254 8E03204C */  lw         $v1, 0x204c($s0)
/* 86E58 80086258 24060080 */  addiu      $a2, $zero, 0x80
/* 86E5C 8008625C 8C6402C0 */  lw         $a0, 0x2c0($v1)
/* 86E60 80086260 0C02227C */  jal        text_func
/* 86E64 80086264 00408021 */   addu      $s0, $v0, $zero
/* 86E68 80086268 02002021 */  addu       $a0, $s0, $zero
/* 86E6C 8008626C 0C013626 */  jal        func_8004D898
/* 86E70 80086270 00402821 */   addu      $a1, $v0, $zero
/* 86E74 80086274 0C013786 */  jal        func_8004DE18
/* 86E78 80086278 02002021 */   addu      $a0, $s0, $zero
/* 86E7C 8008627C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 86E80 80086280 8FB00018 */  lw         $s0, 0x18($sp)
/* 86E84 80086284 00001021 */  addu       $v0, $zero, $zero
/* 86E88 80086288 03E00008 */  jr         $ra
/* 86E8C 8008628C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086290
/* 86E90 80086290 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86E94 80086294 AFB00010 */  sw         $s0, 0x10($sp)
/* 86E98 80086298 00808021 */  addu       $s0, $a0, $zero
/* 86E9C 8008629C AFBF0014 */  sw         $ra, 0x14($sp)
/* 86EA0 800862A0 0C0271BF */  jal        cont_delay
/* 86EA4 800862A4 00002021 */   addu      $a0, $zero, $zero
/* 86EA8 800862A8 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86EAC 800862AC 8C641C60 */  lw         $a0, %lo(contPakDat)($v1)
/* 86EB0 800862B0 0C021B71 */  jal        func_80086DC4
/* 86EB4 800862B4 02002821 */   addu      $a1, $s0, $zero
/* 86EB8 800862B8 8FBF0014 */  lw         $ra, 0x14($sp)
/* 86EBC 800862BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 86EC0 800862C0 03E00008 */  jr         $ra
/* 86EC4 800862C4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800862C8
/* 86EC8 800862C8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 86ECC 800862CC AFBF0010 */  sw         $ra, 0x10($sp)
/* 86ED0 800862D0 0C0271BF */  jal        cont_delay
/* 86ED4 800862D4 00002021 */   addu      $a0, $zero, $zero
/* 86ED8 800862D8 3C03800F */  lui        $v1, %hi(contPakDat)
/* 86EDC 800862DC 0C021B82 */  jal        func_80086E08
/* 86EE0 800862E0 8C641C60 */   lw        $a0, %lo(contPakDat)($v1)
/* 86EE4 800862E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 86EE8 800862E8 00001021 */  addu       $v0, $zero, $zero
/* 86EEC 800862EC 03E00008 */  jr         $ra
/* 86EF0 800862F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800862F4
/* 86EF4 800862F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 86EF8 800862F8 AFB40020 */  sw         $s4, 0x20($sp)
/* 86EFC 800862FC 309400FF */  andi       $s4, $a0, 0xff
/* 86F00 80086300 2404007C */  addiu      $a0, $zero, 0x7c
/* 86F04 80086304 AFB10014 */  sw         $s1, 0x14($sp)
/* 86F08 80086308 00C08821 */  addu       $s1, $a2, $zero
/* 86F0C 8008630C AFB20018 */  sw         $s2, 0x18($sp)
/* 86F10 80086310 00E09021 */  addu       $s2, $a3, $zero
/* 86F14 80086314 AFB3001C */  sw         $s3, 0x1c($sp)
/* 86F18 80086318 30B3FFFF */  andi       $s3, $a1, 0xffff
/* 86F1C 8008631C AFBF0024 */  sw         $ra, 0x24($sp)
/* 86F20 80086320 0C026259 */  jal        passToMalloc
/* 86F24 80086324 AFB00010 */   sw        $s0, 0x10($sp)
/* 86F28 80086328 02202021 */  addu       $a0, $s1, $zero
/* 86F2C 8008632C 0C03353E */  jal        strlen
/* 86F30 80086330 00408021 */   addu      $s0, $v0, $zero
/* 86F34 80086334 02002021 */  addu       $a0, $s0, $zero
/* 86F38 80086338 24420001 */  addiu      $v0, $v0, 1
/* 86F3C 8008633C 02202821 */  addu       $a1, $s1, $zero
/* 86F40 80086340 0C02DFC8 */  jal        widgetcliptext_init
/* 86F44 80086344 3046FFFF */   andi      $a2, $v0, 0xffff
/* 86F48 80086348 8FBF0024 */  lw         $ra, 0x24($sp)
/* 86F4C 8008634C 00401821 */  addu       $v1, $v0, $zero
/* 86F50 80086350 A074005C */  sb         $s4, 0x5c($v1)
/* 86F54 80086354 8FB40020 */  lw         $s4, 0x20($sp)
/* 86F58 80086358 A473005E */  sh         $s3, 0x5e($v1)
/* 86F5C 8008635C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 86F60 80086360 AC720018 */  sw         $s2, 0x18($v1)
/* 86F64 80086364 8FB20018 */  lw         $s2, 0x18($sp)
/* 86F68 80086368 8FB10014 */  lw         $s1, 0x14($sp)
/* 86F6C 8008636C 8FB00010 */  lw         $s0, 0x10($sp)
/* 86F70 80086370 03E00008 */  jr         $ra
/* 86F74 80086374 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80086378
/* 86F78 80086378 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 86F7C 8008637C AFB40020 */  sw         $s4, 0x20($sp)
/* 86F80 80086380 8FB40048 */  lw         $s4, 0x48($sp)
/* 86F84 80086384 AFB60028 */  sw         $s6, 0x28($sp)
/* 86F88 80086388 8FB6004C */  lw         $s6, 0x4c($sp)
/* 86F8C 8008638C AFB10014 */  sw         $s1, 0x14($sp)
/* 86F90 80086390 8FB10050 */  lw         $s1, 0x50($sp)
/* 86F94 80086394 AFB20018 */  sw         $s2, 0x18($sp)
/* 86F98 80086398 8FB20054 */  lw         $s2, 0x54($sp)
/* 86F9C 8008639C AFB00010 */  sw         $s0, 0x10($sp)
/* 86FA0 800863A0 00808021 */  addu       $s0, $a0, $zero
/* 86FA4 800863A4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 86FA8 800863A8 8FB30058 */  lw         $s3, 0x58($sp)
/* 86FAC 800863AC AFB50024 */  sw         $s5, 0x24($sp)
/* 86FB0 800863B0 00E0A821 */  addu       $s5, $a3, $zero
/* 86FB4 800863B4 AFB7002C */  sw         $s7, 0x2c($sp)
/* 86FB8 800863B8 30B7FFFF */  andi       $s7, $a1, 0xffff
/* 86FBC 800863BC AFBE0030 */  sw         $fp, 0x30($sp)
/* 86FC0 800863C0 AFBF0034 */  sw         $ra, 0x34($sp)
/* 86FC4 800863C4 0C02E658 */  jal        widget_menu_build
/* 86FC8 800863C8 30DEFFFF */   andi      $fp, $a2, 0xffff
/* 86FCC 800863CC 3C03800E */  lui        $v1, %hi(D_800E1320)
/* 86FD0 800863D0 24631320 */  addiu      $v1, $v1, %lo(D_800E1320)
/* 86FD4 800863D4 AE030078 */  sw         $v1, 0x78($s0)
/* 86FD8 800863D8 92240000 */  lbu        $a0, ($s1)
/* 86FDC 800863DC 92230001 */  lbu        $v1, 1($s1)
/* 86FE0 800863E0 92250002 */  lbu        $a1, 2($s1)
/* 86FE4 800863E4 92260003 */  lbu        $a2, 3($s1)
/* 86FE8 800863E8 260202A5 */  addiu      $v0, $s0, 0x2a5
/* 86FEC 800863EC A20402A5 */  sb         $a0, 0x2a5($s0)
/* 86FF0 800863F0 2604007C */  addiu      $a0, $s0, 0x7c
/* 86FF4 800863F4 A0430001 */  sb         $v1, 1($v0)
/* 86FF8 800863F8 A0450002 */  sb         $a1, 2($v0)
/* 86FFC 800863FC A0460003 */  sb         $a2, 3($v0)
/* 87000 80086400 92430000 */  lbu        $v1, ($s2)
/* 87004 80086404 92450001 */  lbu        $a1, 1($s2)
/* 87008 80086408 92460002 */  lbu        $a2, 2($s2)
/* 8700C 8008640C 92470003 */  lbu        $a3, 3($s2)
/* 87010 80086410 260202A9 */  addiu      $v0, $s0, 0x2a9
/* 87014 80086414 A20302A9 */  sb         $v1, 0x2a9($s0)
/* 87018 80086418 A0450001 */  sb         $a1, 1($v0)
/* 8701C 8008641C 00002821 */  addu       $a1, $zero, $zero
/* 87020 80086420 A0460002 */  sb         $a2, 2($v0)
/* 87024 80086424 A0470003 */  sb         $a3, 3($v0)
/* 87028 80086428 92630000 */  lbu        $v1, ($s3)
/* 8702C 8008642C 92660001 */  lbu        $a2, 1($s3)
/* 87030 80086430 92670002 */  lbu        $a3, 2($s3)
/* 87034 80086434 92680003 */  lbu        $t0, 3($s3)
/* 87038 80086438 260202AD */  addiu      $v0, $s0, 0x2ad
/* 8703C 8008643C A20302AD */  sb         $v1, 0x2ad($s0)
/* 87040 80086440 24030001 */  addiu      $v1, $zero, 1
/* 87044 80086444 A0460001 */  sb         $a2, 1($v0)
/* 87048 80086448 24060200 */  addiu      $a2, $zero, 0x200
/* 8704C 8008644C A0470002 */  sb         $a3, 2($v0)
/* 87050 80086450 A0480003 */  sb         $t0, 3($v0)
/* 87054 80086454 AE0302B4 */  sw         $v1, 0x2b4($s0)
/* 87058 80086458 0C026380 */  jal        Calloc
/* 8705C 8008645C A200005B */   sb        $zero, 0x5b($s0)
/* 87060 80086460 00002021 */  addu       $a0, $zero, $zero
/* 87064 80086464 260502B8 */  addiu      $a1, $s0, 0x2b8
/* 87068 80086468 AE00027C */  sw         $zero, 0x27c($s0)
/* 8706C 8008646C AE000280 */  sw         $zero, 0x280($s0)
/* 87070 80086470 A200028C */  sb         $zero, 0x28c($s0)
/* 87074 80086474 A200028D */  sb         $zero, 0x28d($s0)
/* 87078 80086478 A200028E */  sb         $zero, 0x28e($s0)
/* 8707C 8008647C A200028F */  sb         $zero, 0x28f($s0)
/* 87080 80086480 A2000290 */  sb         $zero, 0x290($s0)
/* 87084 80086484 AE150284 */  sw         $s5, 0x284($s0)
/* 87088 80086488 AE140288 */  sw         $s4, 0x288($s0)
/* 8708C 8008648C A2000291 */  sb         $zero, 0x291($s0)
/* 87090 80086490 A6170292 */  sh         $s7, 0x292($s0)
/* 87094 80086494 A61E0294 */  sh         $fp, 0x294($s0)
/* 87098 80086498 AE160298 */  sw         $s6, 0x298($s0)
/* 8709C 8008649C AE0002A0 */  sw         $zero, 0x2a0($s0)
/* 870A0 800864A0 A20002A4 */  sb         $zero, 0x2a4($s0)
/* 870A4 800864A4 AE00029C */  sw         $zero, 0x29c($s0)
/* 870A8 800864A8 0C0270AC */  jal        controller_query_2
/* 870AC 800864AC A20002B8 */   sb        $zero, 0x2b8($s0)
/* 870B0 800864B0 3C03800F */  lui        $v1, %hi(font_pointer)
/* 870B4 800864B4 8C6536F0 */  lw         $a1, %lo(font_pointer)($v1)
/* 870B8 800864B8 0C02DBCC */  jal        clear_widget_handler
/* 870BC 800864BC 260402BC */   addiu     $a0, $s0, 0x2bc
/* 870C0 800864C0 0C035709 */  jal        CRCTable_init
/* 870C4 800864C4 00000000 */   nop
/* 870C8 800864C8 0C021F77 */  jal        read_controlPak_prompt
/* 870CC 800864CC 02002021 */   addu      $a0, $s0, $zero
/* 870D0 800864D0 02001021 */  addu       $v0, $s0, $zero
/* 870D4 800864D4 8FBF0034 */  lw         $ra, 0x34($sp)
/* 870D8 800864D8 8FBE0030 */  lw         $fp, 0x30($sp)
/* 870DC 800864DC 8FB7002C */  lw         $s7, 0x2c($sp)
/* 870E0 800864E0 8FB60028 */  lw         $s6, 0x28($sp)
/* 870E4 800864E4 8FB50024 */  lw         $s5, 0x24($sp)
/* 870E8 800864E8 8FB40020 */  lw         $s4, 0x20($sp)
/* 870EC 800864EC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 870F0 800864F0 8FB20018 */  lw         $s2, 0x18($sp)
/* 870F4 800864F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 870F8 800864F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 870FC 800864FC 03E00008 */  jr         $ra
/* 87100 80086500 27BD0038 */   addiu     $sp, $sp, 0x38

glabel controllerPakdata_free
/* 87104 80086504 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 87108 80086508 AFB20018 */  sw         $s2, 0x18($sp)
/* 8710C 8008650C 00809021 */  addu       $s2, $a0, $zero
/* 87110 80086510 3C02800E */  lui        $v0, %hi(D_800E1320)
/* 87114 80086514 24421320 */  addiu      $v0, $v0, %lo(D_800E1320)
/* 87118 80086518 AFB50024 */  sw         $s5, 0x24($sp)
/* 8711C 8008651C 00A0A821 */  addu       $s5, $a1, $zero
/* 87120 80086520 AFBF0028 */  sw         $ra, 0x28($sp)
/* 87124 80086524 AFB40020 */  sw         $s4, 0x20($sp)
/* 87128 80086528 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8712C 8008652C AFB10014 */  sw         $s1, 0x14($sp)
/* 87130 80086530 AFB00010 */  sw         $s0, 0x10($sp)
/* 87134 80086534 0C03572E */  jal        CRCTable_free
/* 87138 80086538 AE420078 */   sw        $v0, 0x78($s2)
/* 8713C 8008653C 00008821 */  addu       $s1, $zero, $zero
/* 87140 80086540 2653007C */  addiu      $s3, $s2, 0x7c
/* 87144 80086544 3C14800E */  lui        $s4, %hi(D_800E0FB0)
/* 87148 80086548 00111140 */  sll        $v0, $s1, 5
.L8008654C:
/* 8714C 8008654C 02628021 */  addu       $s0, $s3, $v0
/* 87150 80086550 8E040000 */  lw         $a0, ($s0)
/* 87154 80086554 10800004 */  beqz       $a0, .L80086568
/* 87158 80086558 26850FB0 */   addiu     $a1, $s4, %lo(D_800E0FB0)
/* 8715C 8008655C 0C02600C */  jal        Free
/* 87160 80086560 24060201 */   addiu     $a2, $zero, 0x201
/* 87164 80086564 AE000000 */  sw         $zero, ($s0)
.L80086568:
/* 87168 80086568 26220001 */  addiu      $v0, $s1, 1
/* 8716C 8008656C 305100FF */  andi       $s1, $v0, 0xff
/* 87170 80086570 2E230010 */  sltiu      $v1, $s1, 0x10
/* 87174 80086574 1460FFF5 */  bnez       $v1, .L8008654C
/* 87178 80086578 00111140 */   sll       $v0, $s1, 5
/* 8717C 8008657C 0C021F10 */  jal        func_80087C40
/* 87180 80086580 02402021 */   addu      $a0, $s2, $zero
/* 87184 80086584 8E45029C */  lw         $a1, 0x29c($s2)
/* 87188 80086588 10A00009 */  beqz       $a1, .L800865B0
/* 8718C 8008658C 00000000 */   nop
/* 87190 80086590 8CA2006C */  lw         $v0, 0x6c($a1)
/* 87194 80086594 10400006 */  beqz       $v0, .L800865B0
/* 87198 80086598 3C04800E */   lui       $a0, %hi(queueStructA)
/* 8719C 8008659C 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 871A0 800865A0 24A5006C */  addiu      $a1, $a1, 0x6c
/* 871A4 800865A4 24060004 */  addiu      $a2, $zero, 4
/* 871A8 800865A8 0C035867 */  jal        AllocFreeQueueItem
/* 871AC 800865AC 00003821 */   addu      $a3, $zero, $zero
.L800865B0:
/* 871B0 800865B0 0C021F01 */  jal        func_80087C04
/* 871B4 800865B4 02402021 */   addu      $a0, $s2, $zero
/* 871B8 800865B8 264402BC */  addiu      $a0, $s2, 0x2bc
/* 871BC 800865BC 0C02DBD4 */  jal        func_800B6F50
/* 871C0 800865C0 24050002 */   addiu     $a1, $zero, 2
/* 871C4 800865C4 02402021 */  addu       $a0, $s2, $zero
/* 871C8 800865C8 0C02E66C */  jal        widget_menu_free
/* 871CC 800865CC 02A02821 */   addu      $a1, $s5, $zero
/* 871D0 800865D0 8FBF0028 */  lw         $ra, 0x28($sp)
/* 871D4 800865D4 8FB50024 */  lw         $s5, 0x24($sp)
/* 871D8 800865D8 8FB40020 */  lw         $s4, 0x20($sp)
/* 871DC 800865DC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 871E0 800865E0 8FB20018 */  lw         $s2, 0x18($sp)
/* 871E4 800865E4 8FB10014 */  lw         $s1, 0x14($sp)
/* 871E8 800865E8 8FB00010 */  lw         $s0, 0x10($sp)
/* 871EC 800865EC 03E00008 */  jr         $ra
/* 871F0 800865F0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800865F4
/* 871F4 800865F4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 871F8 800865F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 871FC 800865FC 00808021 */  addu       $s0, $a0, $zero
/* 87200 80086600 AFB10014 */  sw         $s1, 0x14($sp)
/* 87204 80086604 261102BC */  addiu      $s1, $s0, 0x2bc
/* 87208 80086608 AFBF0024 */  sw         $ra, 0x24($sp)
/* 8720C 8008660C AFB40020 */  sw         $s4, 0x20($sp)
/* 87210 80086610 AFB3001C */  sw         $s3, 0x1c($sp)
/* 87214 80086614 AFB20018 */  sw         $s2, 0x18($sp)
/* 87218 80086618 F7B40028 */  sdc1       $f20, 0x28($sp)
/* 8721C 8008661C 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 87220 80086620 02202021 */   addu      $a0, $s1, $zero
/* 87224 80086624 50400008 */  beql       $v0, $zero, .L80086648
/* 87228 80086628 9205005B */   lbu       $a1, 0x5b($s0)
/* 8722C 8008662C 0C021C9B */  jal        func_8008726C
/* 87230 80086630 02002021 */   addu      $a0, $s0, $zero
/* 87234 80086634 02202021 */  addu       $a0, $s1, $zero
/* 87238 80086638 0C02DBF7 */  jal        func_800B6FDC
/* 8723C 8008663C 24050001 */   addiu     $a1, $zero, 1
/* 87240 80086640 080219F4 */  j          .L800867D0
/* 87244 80086644 8FBF0024 */   lw        $ra, 0x24($sp)
.L80086648:
/* 87248 80086648 0C02F216 */  jal        widget_fade
/* 8724C 8008664C 02002021 */   addu      $a0, $s0, $zero
/* 87250 80086650 8E0202B4 */  lw         $v0, 0x2b4($s0)
/* 87254 80086654 10400023 */  beqz       $v0, .L800866E4
/* 87258 80086658 0000A021 */   addu      $s4, $zero, $zero
/* 8725C 8008665C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 87260 80086660 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 87264 80086664 8C4314CC */  lw         $v1, 0x14cc($v0)
/* 87268 80086668 1060001B */  beqz       $v1, .L800866D8
/* 8726C 8008666C 00008821 */   addu      $s1, $zero, $zero
/* 87270 80086670 00409821 */  addu       $s3, $v0, $zero
/* 87274 80086674 3C01800E */  lui        $at, %hi(D_800E0FCC)
/* 87278 80086678 C4340FCC */  lwc1       $f20, %lo(D_800E0FCC)($at)
/* 8727C 8008667C 080219A5 */  j          .L80086694
/* 87280 80086680 3C128000 */   lui       $s2, 0x8000
.L80086684:
/* 87284 80086684 0C02E683 */  jal        func_800B9A0C
/* 87288 80086688 02002021 */   addu      $a0, $s0, $zero
/* 8728C 8008668C 0040A021 */  addu       $s4, $v0, $zero
/* 87290 80086690 26310001 */  addiu      $s1, $s1, 1
.L80086694:
/* 87294 80086694 C660000C */  lwc1       $f0, 0xc($s3)
/* 87298 80086698 4600A03E */  c.le.s     $f20, $f0
/* 8729C 8008669C 00000000 */  nop
/* 872A0 800866A0 45030005 */  bc1tl      .L800866B8
/* 872A4 800866A4 46140001 */   sub.s     $f0, $f0, $f20
/* 872A8 800866A8 4600008D */  trunc.w.s  $f2, $f0
/* 872AC 800866AC 44021000 */  mfc1       $v0, $f2
/* 872B0 800866B0 080219B2 */  j          .L800866C8
/* 872B4 800866B4 0222102B */   sltu      $v0, $s1, $v0
.L800866B8:
/* 872B8 800866B8 4600008D */  trunc.w.s  $f2, $f0
/* 872BC 800866BC 44021000 */  mfc1       $v0, $f2
/* 872C0 800866C0 00521025 */  or         $v0, $v0, $s2
/* 872C4 800866C4 0222102B */  sltu       $v0, $s1, $v0
.L800866C8:
/* 872C8 800866C8 1440FFEE */  bnez       $v0, .L80086684
/* 872CC 800866CC 00000000 */   nop
/* 872D0 800866D0 080219BA */  j          .L800866E8
/* 872D4 800866D4 9203028C */   lbu       $v1, 0x28c($s0)
.L800866D8:
/* 872D8 800866D8 0C02E683 */  jal        func_800B9A0C
/* 872DC 800866DC 02002021 */   addu      $a0, $s0, $zero
/* 872E0 800866E0 0040A021 */  addu       $s4, $v0, $zero
.L800866E4:
/* 872E4 800866E4 9203028C */  lbu        $v1, 0x28c($s0)
.L800866E8:
/* 872E8 800866E8 2C62000C */  sltiu      $v0, $v1, 0xc
/* 872EC 800866EC 10400031 */  beqz       $v0, .L800867B4
/* 872F0 800866F0 3C02800E */   lui       $v0, %hi(D_800E0FD0)
/* 872F4 800866F4 24420FD0 */  addiu      $v0, $v0, %lo(D_800E0FD0)
/* 872F8 800866F8 00031880 */  sll        $v1, $v1, 2
/* 872FC 800866FC 00621821 */  addu       $v1, $v1, $v0
/* 87300 80086700 8C640000 */  lw         $a0, ($v1)
/* 87304 80086704 00800008 */  jr         $a0
/* 87308 80086708 00000000 */   nop
/* 8730C 8008670C 0C021B8D */  jal        func_80086E34
/* 87310 80086710 02002021 */   addu      $a0, $s0, $zero
/* 87314 80086714 080219EE */  j          .L800867B8
/* 87318 80086718 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8731C 8008671C 0C021BA1 */  jal        func_80086E84
/* 87320 80086720 02002021 */   addu      $a0, $s0, $zero
/* 87324 80086724 080219EE */  j          .L800867B8
/* 87328 80086728 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8732C 8008672C 0C021BD0 */  jal        func_80086F40
/* 87330 80086730 02002021 */   addu      $a0, $s0, $zero
/* 87334 80086734 080219EE */  j          .L800867B8
/* 87338 80086738 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8733C 8008673C 0C021BF5 */  jal        controllerpakdata_func
/* 87340 80086740 02002021 */   addu      $a0, $s0, $zero
/* 87344 80086744 080219EE */  j          .L800867B8
/* 87348 80086748 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8734C 8008674C 0C021C72 */  jal        func_800871C8
/* 87350 80086750 02002021 */   addu      $a0, $s0, $zero
/* 87354 80086754 080219EE */  j          .L800867B8
/* 87358 80086758 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8735C 8008675C 0C021CEB */  jal        func_800873AC
/* 87360 80086760 02002021 */   addu      $a0, $s0, $zero
/* 87364 80086764 080219EE */  j          .L800867B8
/* 87368 80086768 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8736C 8008676C 0C021CFC */  jal        func_800873F0
/* 87370 80086770 02002021 */   addu      $a0, $s0, $zero
/* 87374 80086774 080219EE */  j          .L800867B8
/* 87378 80086778 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8737C 8008677C 0C021D09 */  jal        func_80087424
/* 87380 80086780 02002021 */   addu      $a0, $s0, $zero
/* 87384 80086784 080219EE */  j          .L800867B8
/* 87388 80086788 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8738C 8008678C 0C021D17 */  jal        func_8008745C
/* 87390 80086790 02002021 */   addu      $a0, $s0, $zero
/* 87394 80086794 080219EE */  j          .L800867B8
/* 87398 80086798 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 8739C 8008679C 0C021D52 */  jal        func_80087548
/* 873A0 800867A0 02002021 */   addu      $a0, $s0, $zero
/* 873A4 800867A4 080219EE */  j          .L800867B8
/* 873A8 800867A8 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 873AC 800867AC 0C021D67 */  jal        func_8008759C
/* 873B0 800867B0 02002021 */   addu      $a0, $s0, $zero
.L800867B4:
/* 873B4 800867B4 8E0402A0 */  lw         $a0, 0x2a0($s0)
.L800867B8:
/* 873B8 800867B8 10800004 */  beqz       $a0, .L800867CC
/* 873BC 800867BC 02801021 */   addu      $v0, $s4, $zero
/* 873C0 800867C0 0C02F216 */  jal        widget_fade
/* 873C4 800867C4 240500FF */   addiu     $a1, $zero, 0xff
/* 873C8 800867C8 02801021 */  addu       $v0, $s4, $zero
.L800867CC:
/* 873CC 800867CC 8FBF0024 */  lw         $ra, 0x24($sp)
.L800867D0:
/* 873D0 800867D0 8FB40020 */  lw         $s4, 0x20($sp)
/* 873D4 800867D4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 873D8 800867D8 8FB20018 */  lw         $s2, 0x18($sp)
/* 873DC 800867DC 8FB10014 */  lw         $s1, 0x14($sp)
/* 873E0 800867E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 873E4 800867E4 D7B40028 */  ldc1       $f20, 0x28($sp)
/* 873E8 800867E8 03E00008 */  jr         $ra
/* 873EC 800867EC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800867F0
/* 873F0 800867F0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 873F4 800867F4 AFB00018 */  sw         $s0, 0x18($sp)
/* 873F8 800867F8 00A08021 */  addu       $s0, $a1, $zero
/* 873FC 800867FC AFB1001C */  sw         $s1, 0x1c($sp)
/* 87400 80086800 00808821 */  addu       $s1, $a0, $zero
/* 87404 80086804 AFB60030 */  sw         $s6, 0x30($sp)
/* 87408 80086808 263602BC */  addiu      $s6, $s1, 0x2bc
/* 8740C 8008680C 02C02021 */  addu       $a0, $s6, $zero
/* 87410 80086810 AFB40028 */  sw         $s4, 0x28($sp)
/* 87414 80086814 87B4004A */  lh         $s4, 0x4a($sp)
/* 87418 80086818 00063400 */  sll        $a2, $a2, 0x10
/* 8741C 8008681C AFB20020 */  sw         $s2, 0x20($sp)
/* 87420 80086820 00069403 */  sra        $s2, $a2, 0x10
/* 87424 80086824 AFB5002C */  sw         $s5, 0x2c($sp)
/* 87428 80086828 87B5004E */  lh         $s5, 0x4e($sp)
/* 8742C 8008682C 00073C00 */  sll        $a3, $a3, 0x10
/* 87430 80086830 AFB30024 */  sw         $s3, 0x24($sp)
/* 87434 80086834 AFBF0034 */  sw         $ra, 0x34($sp)
/* 87438 80086838 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8743C 8008683C 00079C03 */   sra       $s3, $a3, 0x10
/* 87440 80086840 50400017 */  beql       $v0, $zero, .L800868A0
/* 87444 80086844 8E2802A0 */   lw        $t0, 0x2a0($s1)
/* 87448 80086848 8E28029C */  lw         $t0, 0x29c($s1)
/* 8744C 8008684C 1100000B */  beqz       $t0, .L8008687C
/* 87450 80086850 02002821 */   addu      $a1, $s0, $zero
/* 87454 80086854 8D030078 */  lw         $v1, 0x78($t0)
/* 87458 80086858 02403021 */  addu       $a2, $s2, $zero
/* 8745C 8008685C 84640040 */  lh         $a0, 0x40($v1)
/* 87460 80086860 02603821 */  addu       $a3, $s3, $zero
/* 87464 80086864 AFB40010 */  sw         $s4, 0x10($sp)
/* 87468 80086868 AFB50014 */  sw         $s5, 0x14($sp)
/* 8746C 8008686C 8C620044 */  lw         $v0, 0x44($v1)
/* 87470 80086870 0040F809 */  jalr       $v0
/* 87474 80086874 01042021 */   addu      $a0, $t0, $a0
/* 87478 80086878 00408021 */  addu       $s0, $v0, $zero
.L8008687C:
/* 8747C 8008687C 02C02021 */  addu       $a0, $s6, $zero
/* 87480 80086880 02002821 */  addu       $a1, $s0, $zero
/* 87484 80086884 02403021 */  addu       $a2, $s2, $zero
/* 87488 80086888 02603821 */  addu       $a3, $s3, $zero
/* 8748C 8008688C AFB40010 */  sw         $s4, 0x10($sp)
/* 87490 80086890 0C02DCCE */  jal        func_800B7338
/* 87494 80086894 AFB50014 */   sw        $s5, 0x14($sp)
/* 87498 80086898 08021A41 */  j          .L80086904
/* 8749C 8008689C 8FBF0034 */   lw        $ra, 0x34($sp)
.L800868A0:
/* 874A0 800868A0 1100000C */  beqz       $t0, .L800868D4
/* 874A4 800868A4 02002821 */   addu      $a1, $s0, $zero
/* 874A8 800868A8 8D030078 */  lw         $v1, 0x78($t0)
/* 874AC 800868AC 02403021 */  addu       $a2, $s2, $zero
/* 874B0 800868B0 84640040 */  lh         $a0, 0x40($v1)
/* 874B4 800868B4 02603821 */  addu       $a3, $s3, $zero
/* 874B8 800868B8 AFB40010 */  sw         $s4, 0x10($sp)
/* 874BC 800868BC AFB50014 */  sw         $s5, 0x14($sp)
/* 874C0 800868C0 8C620044 */  lw         $v0, 0x44($v1)
/* 874C4 800868C4 0040F809 */  jalr       $v0
/* 874C8 800868C8 01042021 */   addu      $a0, $t0, $a0
/* 874CC 800868CC 08021A41 */  j          .L80086904
/* 874D0 800868D0 8FBF0034 */   lw        $ra, 0x34($sp)
.L800868D4:
/* 874D4 800868D4 922202A4 */  lbu        $v0, 0x2a4($s1)
/* 874D8 800868D8 10400008 */  beqz       $v0, .L800868FC
/* 874DC 800868DC 02202021 */   addu      $a0, $s1, $zero
/* 874E0 800868E0 02002821 */  addu       $a1, $s0, $zero
/* 874E4 800868E4 02403021 */  addu       $a2, $s2, $zero
/* 874E8 800868E8 02603821 */  addu       $a3, $s3, $zero
/* 874EC 800868EC AFB40010 */  sw         $s4, 0x10($sp)
/* 874F0 800868F0 0C02E675 */  jal        func_800B99D4
/* 874F4 800868F4 AFB50014 */   sw        $s5, 0x14($sp)
/* 874F8 800868F8 00408021 */  addu       $s0, $v0, $zero
.L800868FC:
/* 874FC 800868FC 02001021 */  addu       $v0, $s0, $zero
/* 87500 80086900 8FBF0034 */  lw         $ra, 0x34($sp)
.L80086904:
/* 87504 80086904 8FB60030 */  lw         $s6, 0x30($sp)
/* 87508 80086908 8FB5002C */  lw         $s5, 0x2c($sp)
/* 8750C 8008690C 8FB40028 */  lw         $s4, 0x28($sp)
/* 87510 80086910 8FB30024 */  lw         $s3, 0x24($sp)
/* 87514 80086914 8FB20020 */  lw         $s2, 0x20($sp)
/* 87518 80086918 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8751C 8008691C 8FB00018 */  lw         $s0, 0x18($sp)
/* 87520 80086920 03E00008 */  jr         $ra
/* 87524 80086924 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80086928
/* 87528 80086928 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8752C 8008692C AFBF0010 */  sw         $ra, 0x10($sp)
/* 87530 80086930 8C840280 */  lw         $a0, 0x280($a0)
/* 87534 80086934 1080000D */  beqz       $a0, .L8008696C
/* 87538 80086938 00001021 */   addu      $v0, $zero, $zero
/* 8753C 8008693C 0C02F031 */  jal        func_800BC0C4
/* 87540 80086940 00000000 */   nop
/* 87544 80086944 00402821 */  addu       $a1, $v0, $zero
/* 87548 80086948 10A00008 */  beqz       $a1, .L8008696C
/* 8754C 8008694C 00001021 */   addu      $v0, $zero, $zero
/* 87550 80086950 8CA30078 */  lw         $v1, 0x78($a1)
/* 87554 80086954 84640078 */  lh         $a0, 0x78($v1)
/* 87558 80086958 8C62007C */  lw         $v0, 0x7c($v1)
/* 8755C 8008695C 0040F809 */  jalr       $v0
/* 87560 80086960 00A42021 */   addu      $a0, $a1, $a0
/* 87564 80086964 08021A5C */  j          .L80086970
/* 87568 80086968 8FBF0010 */   lw        $ra, 0x10($sp)
.L8008696C:
/* 8756C 8008696C 8FBF0010 */  lw         $ra, 0x10($sp)
.L80086970:
/* 87570 80086970 03E00008 */  jr         $ra
/* 87574 80086974 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086978
/* 87578 80086978 24020006 */  addiu      $v0, $zero, 6
/* 8757C 8008697C A082028C */  sb         $v0, 0x28c($a0)
/* 87580 80086980 03E00008 */  jr         $ra
/* 87584 80086984 00001021 */   addu      $v0, $zero, $zero

glabel func_80086988
/* 87588 80086988 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8758C 8008698C AFB00018 */  sw         $s0, 0x18($sp)
/* 87590 80086990 00808021 */  addu       $s0, $a0, $zero
/* 87594 80086994 AFBF001C */  sw         $ra, 0x1c($sp)
/* 87598 80086998 8E020280 */  lw         $v0, 0x280($s0)
/* 8759C 8008699C 1040000F */  beqz       $v0, .L800869DC
/* 875A0 800869A0 2402001E */   addiu     $v0, $zero, 0x1e
/* 875A4 800869A4 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 875A8 800869A8 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 875AC 800869AC 2405073B */  addiu      $a1, $zero, 0x73b
/* 875B0 800869B0 3C073F80 */  lui        $a3, 0x3f80
/* 875B4 800869B4 00003021 */  addu       $a2, $zero, $zero
/* 875B8 800869B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 875BC 800869BC 0C0156F4 */  jal        play_SFX
/* 875C0 800869C0 AFA00014 */   sw        $zero, 0x14($sp)
/* 875C4 800869C4 8E050280 */  lw         $a1, 0x280($s0)
/* 875C8 800869C8 8CA30078 */  lw         $v1, 0x78($a1)
/* 875CC 800869CC 84640058 */  lh         $a0, 0x58($v1)
/* 875D0 800869D0 8C62005C */  lw         $v0, 0x5c($v1)
/* 875D4 800869D4 0040F809 */  jalr       $v0
/* 875D8 800869D8 00A42021 */   addu      $a0, $a1, $a0
.L800869DC:
/* 875DC 800869DC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 875E0 800869E0 8FB00018 */  lw         $s0, 0x18($sp)
/* 875E4 800869E4 00001021 */  addu       $v0, $zero, $zero
/* 875E8 800869E8 03E00008 */  jr         $ra
/* 875EC 800869EC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800869F0
/* 875F0 800869F0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 875F4 800869F4 AFB00018 */  sw         $s0, 0x18($sp)
/* 875F8 800869F8 00808021 */  addu       $s0, $a0, $zero
/* 875FC 800869FC AFBF001C */  sw         $ra, 0x1c($sp)
/* 87600 80086A00 8E020280 */  lw         $v0, 0x280($s0)
/* 87604 80086A04 1040000F */  beqz       $v0, .L80086A44
/* 87608 80086A08 2402001E */   addiu     $v0, $zero, 0x1e
/* 8760C 80086A0C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 87610 80086A10 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 87614 80086A14 2405073B */  addiu      $a1, $zero, 0x73b
/* 87618 80086A18 3C073F80 */  lui        $a3, 0x3f80
/* 8761C 80086A1C 00003021 */  addu       $a2, $zero, $zero
/* 87620 80086A20 AFA20010 */  sw         $v0, 0x10($sp)
/* 87624 80086A24 0C0156F4 */  jal        play_SFX
/* 87628 80086A28 AFA00014 */   sw        $zero, 0x14($sp)
/* 8762C 80086A2C 8E050280 */  lw         $a1, 0x280($s0)
/* 87630 80086A30 8CA30078 */  lw         $v1, 0x78($a1)
/* 87634 80086A34 84640060 */  lh         $a0, 0x60($v1)
/* 87638 80086A38 8C620064 */  lw         $v0, 0x64($v1)
/* 8763C 80086A3C 0040F809 */  jalr       $v0
/* 87640 80086A40 00A42021 */   addu      $a0, $a1, $a0
.L80086A44:
/* 87644 80086A44 8FBF001C */  lw         $ra, 0x1c($sp)
/* 87648 80086A48 8FB00018 */  lw         $s0, 0x18($sp)
/* 8764C 80086A4C 00001021 */  addu       $v0, $zero, $zero
/* 87650 80086A50 03E00008 */  jr         $ra
/* 87654 80086A54 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086A58
/* 87658 80086A58 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8765C 80086A5C AFB00018 */  sw         $s0, 0x18($sp)
/* 87660 80086A60 00808021 */  addu       $s0, $a0, $zero
/* 87664 80086A64 AFBF001C */  sw         $ra, 0x1c($sp)
/* 87668 80086A68 8E04027C */  lw         $a0, 0x27c($s0)
/* 8766C 80086A6C 10800012 */  beqz       $a0, .L80086AB8
/* 87670 80086A70 00001021 */   addu      $v0, $zero, $zero
/* 87674 80086A74 0C00CB71 */  jal        func_80032DC4
/* 87678 80086A78 00000000 */   nop
/* 8767C 80086A7C 8E020078 */  lw         $v0, 0x78($s0)
/* 87680 80086A80 844400F0 */  lh         $a0, 0xf0($v0)
/* 87684 80086A84 8C4300F4 */  lw         $v1, 0xf4($v0)
/* 87688 80086A88 0060F809 */  jalr       $v1
/* 8768C 80086A8C 02042021 */   addu      $a0, $s0, $a0
/* 87690 80086A90 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 87694 80086A94 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 87698 80086A98 2402001E */  addiu      $v0, $zero, 0x1e
/* 8769C 80086A9C 2405073D */  addiu      $a1, $zero, 0x73d
/* 876A0 80086AA0 3C073F80 */  lui        $a3, 0x3f80
/* 876A4 80086AA4 00003021 */  addu       $a2, $zero, $zero
/* 876A8 80086AA8 AFA20010 */  sw         $v0, 0x10($sp)
/* 876AC 80086AAC 0C0156F4 */  jal        play_SFX
/* 876B0 80086AB0 AFA00014 */   sw        $zero, 0x14($sp)
/* 876B4 80086AB4 00001021 */  addu       $v0, $zero, $zero
.L80086AB8:
/* 876B8 80086AB8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 876BC 80086ABC 8FB00018 */  lw         $s0, 0x18($sp)
/* 876C0 80086AC0 03E00008 */  jr         $ra
/* 876C4 80086AC4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086AC8
/* 876C8 80086AC8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 876CC 80086ACC AFB00018 */  sw         $s0, 0x18($sp)
/* 876D0 80086AD0 00808021 */  addu       $s0, $a0, $zero
/* 876D4 80086AD4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 876D8 80086AD8 8E04027C */  lw         $a0, 0x27c($s0)
/* 876DC 80086ADC 10800012 */  beqz       $a0, .L80086B28
/* 876E0 80086AE0 00001021 */   addu      $v0, $zero, $zero
/* 876E4 80086AE4 0C00CB26 */  jal        func_80032C98
/* 876E8 80086AE8 00000000 */   nop
/* 876EC 80086AEC 8E020078 */  lw         $v0, 0x78($s0)
/* 876F0 80086AF0 844400F0 */  lh         $a0, 0xf0($v0)
/* 876F4 80086AF4 8C4300F4 */  lw         $v1, 0xf4($v0)
/* 876F8 80086AF8 0060F809 */  jalr       $v1
/* 876FC 80086AFC 02042021 */   addu      $a0, $s0, $a0
/* 87700 80086B00 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 87704 80086B04 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 87708 80086B08 2402001E */  addiu      $v0, $zero, 0x1e
/* 8770C 80086B0C 2405073D */  addiu      $a1, $zero, 0x73d
/* 87710 80086B10 3C073F80 */  lui        $a3, 0x3f80
/* 87714 80086B14 00003021 */  addu       $a2, $zero, $zero
/* 87718 80086B18 AFA20010 */  sw         $v0, 0x10($sp)
/* 8771C 80086B1C 0C0156F4 */  jal        play_SFX
/* 87720 80086B20 AFA00014 */   sw        $zero, 0x14($sp)
/* 87724 80086B24 00001021 */  addu       $v0, $zero, $zero
.L80086B28:
/* 87728 80086B28 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8772C 80086B2C 8FB00018 */  lw         $s0, 0x18($sp)
/* 87730 80086B30 03E00008 */  jr         $ra
/* 87734 80086B34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086B38
/* 87738 80086B38 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8773C 80086B3C AFB10014 */  sw         $s1, 0x14($sp)
/* 87740 80086B40 00808821 */  addu       $s1, $a0, $zero
/* 87744 80086B44 AFB00010 */  sw         $s0, 0x10($sp)
/* 87748 80086B48 263002BC */  addiu      $s0, $s1, 0x2bc
/* 8774C 80086B4C 02002021 */  addu       $a0, $s0, $zero
/* 87750 80086B50 AFB20018 */  sw         $s2, 0x18($sp)
/* 87754 80086B54 AFBF001C */  sw         $ra, 0x1c($sp)
/* 87758 80086B58 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8775C 80086B5C 00A09021 */   addu      $s2, $a1, $zero
/* 87760 80086B60 10400005 */  beqz       $v0, .L80086B78
/* 87764 80086B64 02002021 */   addu      $a0, $s0, $zero
/* 87768 80086B68 0C02DC69 */  jal        run_widget_control_func
/* 8776C 80086B6C 02402821 */   addu      $a1, $s2, $zero
/* 87770 80086B70 08021AEF */  j          .L80086BBC
/* 87774 80086B74 8FBF001C */   lw        $ra, 0x1c($sp)
.L80086B78:
/* 87778 80086B78 8E24027C */  lw         $a0, 0x27c($s1)
/* 8777C 80086B7C 1080000E */  beqz       $a0, .L80086BB8
/* 87780 80086B80 00001021 */   addu      $v0, $zero, $zero
/* 87784 80086B84 0C00CBC0 */  jal        func_80032F00
/* 87788 80086B88 00000000 */   nop
/* 8778C 80086B8C 1440000A */  bnez       $v0, .L80086BB8
/* 87790 80086B90 00001021 */   addu      $v0, $zero, $zero
/* 87794 80086B94 9223028C */  lbu        $v1, 0x28c($s1)
/* 87798 80086B98 24020004 */  addiu      $v0, $zero, 4
/* 8779C 80086B9C 14620006 */  bne        $v1, $v0, .L80086BB8
/* 877A0 80086BA0 00001021 */   addu      $v0, $zero, $zero
/* 877A4 80086BA4 02202021 */  addu       $a0, $s1, $zero
/* 877A8 80086BA8 0C02DD7A */  jal        widget_control
/* 877AC 80086BAC 02402821 */   addu      $a1, $s2, $zero
/* 877B0 80086BB0 08021AEF */  j          .L80086BBC
/* 877B4 80086BB4 8FBF001C */   lw        $ra, 0x1c($sp)
.L80086BB8:
/* 877B8 80086BB8 8FBF001C */  lw         $ra, 0x1c($sp)
.L80086BBC:
/* 877BC 80086BBC 8FB20018 */  lw         $s2, 0x18($sp)
/* 877C0 80086BC0 8FB10014 */  lw         $s1, 0x14($sp)
/* 877C4 80086BC4 8FB00010 */  lw         $s0, 0x10($sp)
/* 877C8 80086BC8 03E00008 */  jr         $ra
/* 877CC 80086BCC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086BD0
/* 877D0 80086BD0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 877D4 80086BD4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 877D8 80086BD8 24110001 */  addiu      $s1, $zero, 1
/* 877DC 80086BDC AFB00018 */  sw         $s0, 0x18($sp)
/* 877E0 80086BE0 00808021 */  addu       $s0, $a0, $zero
/* 877E4 80086BE4 24040001 */  addiu      $a0, $zero, 1
/* 877E8 80086BE8 00002821 */  addu       $a1, $zero, $zero
/* 877EC 80086BEC 24060057 */  addiu      $a2, $zero, 0x57
/* 877F0 80086BF0 24070017 */  addiu      $a3, $zero, 0x17
/* 877F4 80086BF4 AFBF0020 */  sw         $ra, 0x20($sp)
/* 877F8 80086BF8 0C0222F2 */  jal        open_mempak_menu
/* 877FC 80086BFC AFB10010 */   sw        $s1, 0x10($sp)
/* 87800 80086C00 8FBF0020 */  lw         $ra, 0x20($sp)
/* 87804 80086C04 A2110290 */  sb         $s1, 0x290($s0)
/* 87808 80086C08 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8780C 80086C0C 24020004 */  addiu      $v0, $zero, 4
/* 87810 80086C10 A202028C */  sb         $v0, 0x28c($s0)
/* 87814 80086C14 8FB00018 */  lw         $s0, 0x18($sp)
/* 87818 80086C18 03E00008 */  jr         $ra
/* 8781C 80086C1C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80086C20
/* 87820 80086C20 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87824 80086C24 AFB00010 */  sw         $s0, 0x10($sp)
/* 87828 80086C28 00808021 */  addu       $s0, $a0, $zero
/* 8782C 80086C2C AFBF0014 */  sw         $ra, 0x14($sp)
/* 87830 80086C30 0C026EB7 */  jal        get_psf_err
/* 87834 80086C34 00002021 */   addu      $a0, $zero, $zero
/* 87838 80086C38 A202028D */  sb         $v0, 0x28d($s0)
/* 8783C 80086C3C 304200FF */  andi       $v0, $v0, 0xff
/* 87840 80086C40 24030006 */  addiu      $v1, $zero, 6
/* 87844 80086C44 14430005 */  bne        $v0, $v1, .L80086C5C
/* 87848 80086C48 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8784C 80086C4C 0C026EB7 */  jal        get_psf_err
/* 87850 80086C50 00002021 */   addu      $a0, $zero, $zero
/* 87854 80086C54 A202028D */  sb         $v0, 0x28d($s0)
/* 87858 80086C58 8FBF0014 */  lw         $ra, 0x14($sp)
.L80086C5C:
/* 8785C 80086C5C A200028C */  sb         $zero, 0x28c($s0)
/* 87860 80086C60 8FB00010 */  lw         $s0, 0x10($sp)
/* 87864 80086C64 03E00008 */  jr         $ra
/* 87868 80086C68 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086C6C
/* 8786C 80086C6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87870 80086C70 AFB00010 */  sw         $s0, 0x10($sp)
/* 87874 80086C74 00808021 */  addu       $s0, $a0, $zero
/* 87878 80086C78 24020001 */  addiu      $v0, $zero, 1
/* 8787C 80086C7C 00002021 */  addu       $a0, $zero, $zero
/* 87880 80086C80 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87884 80086C84 0C026ED4 */  jal        repaircontrollerpakid
/* 87888 80086C88 AE0202B4 */   sw        $v0, 0x2b4($s0)
/* 8788C 80086C8C 10400005 */  beqz       $v0, .L80086CA4
/* 87890 80086C90 00000000 */   nop
/* 87894 80086C94 0C021E88 */  jal        func_80087A20
/* 87898 80086C98 02002021 */   addu      $a0, $s0, $zero
/* 8789C 80086C9C 08021B2C */  j          .L80086CB0
/* 878A0 80086CA0 8FBF0014 */   lw        $ra, 0x14($sp)
.L80086CA4:
/* 878A4 80086CA4 0C021EB0 */  jal        func_80087AC0
/* 878A8 80086CA8 02002021 */   addu      $a0, $s0, $zero
/* 878AC 80086CAC 8FBF0014 */  lw         $ra, 0x14($sp)
.L80086CB0:
/* 878B0 80086CB0 8FB00010 */  lw         $s0, 0x10($sp)
/* 878B4 80086CB4 03E00008 */  jr         $ra
/* 878B8 80086CB8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel try_erase_game_file_2
/* 878BC 80086CBC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 878C0 80086CC0 AFB00010 */  sw         $s0, 0x10($sp)
/* 878C4 80086CC4 00808021 */  addu       $s0, $a0, $zero
/* 878C8 80086CC8 AFB10014 */  sw         $s1, 0x14($sp)
/* 878CC 80086CCC 30B100FF */  andi       $s1, $a1, 0xff
/* 878D0 80086CD0 02202021 */  addu       $a0, $s1, $zero
/* 878D4 80086CD4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 878D8 80086CD8 0C027061 */  jal        erase_game_file
/* 878DC 80086CDC 00002821 */   addu      $a1, $zero, $zero
/* 878E0 80086CE0 A202028D */  sb         $v0, 0x28d($s0)
/* 878E4 80086CE4 304200FF */  andi       $v0, $v0, 0xff
/* 878E8 80086CE8 24030006 */  addiu      $v1, $zero, 6
/* 878EC 80086CEC 54430006 */  bnel       $v0, $v1, .L80086D08
/* 878F0 80086CF0 9202028D */   lbu       $v0, 0x28d($s0)
/* 878F4 80086CF4 02202021 */  addu       $a0, $s1, $zero
/* 878F8 80086CF8 0C027061 */  jal        erase_game_file
/* 878FC 80086CFC 00002821 */   addu      $a1, $zero, $zero
/* 87900 80086D00 A202028D */  sb         $v0, 0x28d($s0)
/* 87904 80086D04 9202028D */  lbu        $v0, 0x28d($s0)
.L80086D08:
/* 87908 80086D08 10400003 */  beqz       $v0, .L80086D18
/* 8790C 80086D0C 24020001 */   addiu     $v0, $zero, 1
/* 87910 80086D10 08021B47 */  j          .L80086D1C
/* 87914 80086D14 A202028C */   sb        $v0, 0x28c($s0)
.L80086D18:
/* 87918 80086D18 A200028C */  sb         $zero, 0x28c($s0)
.L80086D1C:
/* 8791C 80086D1C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 87920 80086D20 8FB10014 */  lw         $s1, 0x14($sp)
/* 87924 80086D24 8FB00010 */  lw         $s0, 0x10($sp)
/* 87928 80086D28 03E00008 */  jr         $ra
/* 8792C 80086D2C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80086D30
/* 87930 80086D30 24020006 */  addiu      $v0, $zero, 6
/* 87934 80086D34 03E00008 */  jr         $ra
/* 87938 80086D38 A082028C */   sb        $v0, 0x28c($a0)

glabel func_80086D3C
/* 8793C 80086D3C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87940 80086D40 AFBF0010 */  sw         $ra, 0x10($sp)
/* 87944 80086D44 0C00CBBE */  jal        func_80032EF8
/* 87948 80086D48 8C84027C */   lw        $a0, 0x27c($a0)
/* 8794C 80086D4C 00402821 */  addu       $a1, $v0, $zero
/* 87950 80086D50 10A00007 */  beqz       $a1, .L80086D70
/* 87954 80086D54 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87958 80086D58 8CA30078 */  lw         $v1, 0x78($a1)
/* 8795C 80086D5C 84640078 */  lh         $a0, 0x78($v1)
/* 87960 80086D60 8C62007C */  lw         $v0, 0x7c($v1)
/* 87964 80086D64 0040F809 */  jalr       $v0
/* 87968 80086D68 00A42021 */   addu      $a0, $a1, $a0
/* 8796C 80086D6C 8FBF0010 */  lw         $ra, 0x10($sp)
.L80086D70:
/* 87970 80086D70 03E00008 */  jr         $ra
/* 87974 80086D74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086D78
/* 87978 80086D78 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8797C 80086D7C AFB00010 */  sw         $s0, 0x10($sp)
/* 87980 80086D80 00808021 */  addu       $s0, $a0, $zero
/* 87984 80086D84 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87988 80086D88 0C026259 */  jal        passToMalloc
/* 8798C 80086D8C 24040080 */   addiu     $a0, $zero, 0x80
/* 87990 80086D90 00402021 */  addu       $a0, $v0, $zero
/* 87994 80086D94 2405003C */  addiu      $a1, $zero, 0x3c
/* 87998 80086D98 3C068008 */  lui        $a2, %hi(func_80085DCC)
/* 8799C 80086D9C 0C00C0C0 */  jal        func_80030300
/* 879A0 80086DA0 24C65DCC */   addiu     $a2, $a2, %lo(func_80085DCC)
/* 879A4 80086DA4 260402BC */  addiu      $a0, $s0, 0x2bc
/* 879A8 80086DA8 0C02DC7C */  jal        widgetHandler
/* 879AC 80086DAC 00402821 */   addu      $a1, $v0, $zero
/* 879B0 80086DB0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 879B4 80086DB4 AE0002B4 */  sw         $zero, 0x2b4($s0)
/* 879B8 80086DB8 8FB00010 */  lw         $s0, 0x10($sp)
/* 879BC 80086DBC 03E00008 */  jr         $ra
/* 879C0 80086DC0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086DC4
/* 879C4 80086DC4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 879C8 80086DC8 248402BC */  addiu      $a0, $a0, 0x2bc
/* 879CC 80086DCC AFB00010 */  sw         $s0, 0x10($sp)
/* 879D0 80086DD0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 879D4 80086DD4 0C02DCB3 */  jal        func_800B72CC
/* 879D8 80086DD8 00A08021 */   addu      $s0, $a1, $zero
/* 879DC 80086DDC 12000006 */  beqz       $s0, .L80086DF8
/* 879E0 80086DE0 24050003 */   addiu     $a1, $zero, 3
/* 879E4 80086DE4 8E020078 */  lw         $v0, 0x78($s0)
/* 879E8 80086DE8 84440008 */  lh         $a0, 8($v0)
/* 879EC 80086DEC 8C43000C */  lw         $v1, 0xc($v0)
/* 879F0 80086DF0 0060F809 */  jalr       $v1
/* 879F4 80086DF4 02042021 */   addu      $a0, $s0, $a0
.L80086DF8:
/* 879F8 80086DF8 8FBF0014 */  lw         $ra, 0x14($sp)
/* 879FC 80086DFC 8FB00010 */  lw         $s0, 0x10($sp)
/* 87A00 80086E00 03E00008 */  jr         $ra
/* 87A04 80086E04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086E08
/* 87A08 80086E08 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87A0C 80086E0C AFB00010 */  sw         $s0, 0x10($sp)
/* 87A10 80086E10 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87A14 80086E14 0C021F01 */  jal        func_80087C04
/* 87A18 80086E18 00808021 */   addu      $s0, $a0, $zero
/* 87A1C 80086E1C 0C021B4C */  jal        func_80086D30
/* 87A20 80086E20 02002021 */   addu      $a0, $s0, $zero
/* 87A24 80086E24 8FBF0014 */  lw         $ra, 0x14($sp)
/* 87A28 80086E28 8FB00010 */  lw         $s0, 0x10($sp)
/* 87A2C 80086E2C 03E00008 */  jr         $ra
/* 87A30 80086E30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086E34
/* 87A34 80086E34 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87A38 80086E38 AFB00010 */  sw         $s0, 0x10($sp)
/* 87A3C 80086E3C 00808021 */  addu       $s0, $a0, $zero
/* 87A40 80086E40 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87A44 80086E44 0C026EB7 */  jal        get_psf_err
/* 87A48 80086E48 00002021 */   addu      $a0, $zero, $zero
/* 87A4C 80086E4C A202028D */  sb         $v0, 0x28d($s0)
/* 87A50 80086E50 304200FF */  andi       $v0, $v0, 0xff
/* 87A54 80086E54 24030006 */  addiu      $v1, $zero, 6
/* 87A58 80086E58 14430005 */  bne        $v0, $v1, .L80086E70
/* 87A5C 80086E5C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 87A60 80086E60 0C026EB7 */  jal        get_psf_err
/* 87A64 80086E64 00002021 */   addu      $a0, $zero, $zero
/* 87A68 80086E68 A202028D */  sb         $v0, 0x28d($s0)
/* 87A6C 80086E6C 8FBF0014 */  lw         $ra, 0x14($sp)
.L80086E70:
/* 87A70 80086E70 24020001 */  addiu      $v0, $zero, 1
/* 87A74 80086E74 A202028C */  sb         $v0, 0x28c($s0)
/* 87A78 80086E78 8FB00010 */  lw         $s0, 0x10($sp)
/* 87A7C 80086E7C 03E00008 */  jr         $ra
/* 87A80 80086E80 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086E84
/* 87A84 80086E84 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87A88 80086E88 00802821 */  addu       $a1, $a0, $zero
/* 87A8C 80086E8C AFBF0010 */  sw         $ra, 0x10($sp)
/* 87A90 80086E90 90A4028D */  lbu        $a0, 0x28d($a1)
/* 87A94 80086E94 24020004 */  addiu      $v0, $zero, 4
/* 87A98 80086E98 2C83000C */  sltiu      $v1, $a0, 0xc
/* 87A9C 80086E9C 10600023 */  beqz       $v1, .L80086F2C
/* 87AA0 80086EA0 A0A2028C */   sb        $v0, 0x28c($a1)
/* 87AA4 80086EA4 3C02800E */  lui        $v0, %hi(D_800E1000)
/* 87AA8 80086EA8 24421000 */  addiu      $v0, $v0, %lo(D_800E1000)
/* 87AAC 80086EAC 00041880 */  sll        $v1, $a0, 2
/* 87AB0 80086EB0 00621821 */  addu       $v1, $v1, $v0
/* 87AB4 80086EB4 8C640000 */  lw         $a0, ($v1)
/* 87AB8 80086EB8 00800008 */  jr         $a0
/* 87ABC 80086EBC 00000000 */   nop
/* 87AC0 80086EC0 0C021D7F */  jal        func_800875FC
/* 87AC4 80086EC4 00A02021 */   addu      $a0, $a1, $zero
/* 87AC8 80086EC8 08021BCE */  j          .L80086F38
/* 87ACC 80086ECC 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87AD0 80086ED0 0C021D82 */  jal        func_80087608
/* 87AD4 80086ED4 00A02021 */   addu      $a0, $a1, $zero
/* 87AD8 80086ED8 08021BCE */  j          .L80086F38
/* 87ADC 80086EDC 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87AE0 80086EE0 0C021DCE */  jal        func_80087738
/* 87AE4 80086EE4 00A02021 */   addu      $a0, $a1, $zero
/* 87AE8 80086EE8 08021BCE */  j          .L80086F38
/* 87AEC 80086EEC 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87AF0 80086EF0 8CA20078 */  lw         $v0, 0x78($a1)
/* 87AF4 80086EF4 84440108 */  lh         $a0, 0x108($v0)
/* 87AF8 80086EF8 8C43010C */  lw         $v1, 0x10c($v0)
/* 87AFC 80086EFC 0060F809 */  jalr       $v1
/* 87B00 80086F00 00A42021 */   addu      $a0, $a1, $a0
/* 87B04 80086F04 08021BCE */  j          .L80086F38
/* 87B08 80086F08 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87B0C 80086F0C 0C021E42 */  jal        func_80087908
/* 87B10 80086F10 00A02021 */   addu      $a0, $a1, $zero
/* 87B14 80086F14 08021BCE */  j          .L80086F38
/* 87B18 80086F18 8FBF0010 */   lw        $ra, 0x10($sp)
/* 87B1C 80086F1C 0C021E25 */  jal        func_80087894
/* 87B20 80086F20 00A02021 */   addu      $a0, $a1, $zero
/* 87B24 80086F24 08021BCE */  j          .L80086F38
/* 87B28 80086F28 8FBF0010 */   lw        $ra, 0x10($sp)
.L80086F2C:
/* 87B2C 80086F2C 0C021E25 */  jal        func_80087894
/* 87B30 80086F30 00A02021 */   addu      $a0, $a1, $zero
/* 87B34 80086F34 8FBF0010 */  lw         $ra, 0x10($sp)
.L80086F38:
/* 87B38 80086F38 03E00008 */  jr         $ra
/* 87B3C 80086F3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80086F40
/* 87B40 80086F40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87B44 80086F44 AFB00010 */  sw         $s0, 0x10($sp)
/* 87B48 80086F48 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87B4C 80086F4C 0C021F77 */  jal        read_controlPak_prompt
/* 87B50 80086F50 00808021 */   addu      $s0, $a0, $zero
/* 87B54 80086F54 3C04800F */  lui        $a0, %hi(D_800F1C64)
/* 87B58 80086F58 94821C64 */  lhu        $v0, %lo(D_800F1C64)($a0)
/* 87B5C 80086F5C 24430001 */  addiu      $v1, $v0, 1
/* 87B60 80086F60 3042FFFF */  andi       $v0, $v0, 0xffff
/* 87B64 80086F64 2C42000A */  sltiu      $v0, $v0, 0xa
/* 87B68 80086F68 14400016 */  bnez       $v0, .L80086FC4
/* 87B6C 80086F6C A4831C64 */   sh        $v1, 0x1c64($a0)
/* 87B70 80086F70 A4801C64 */  sh         $zero, 0x1c64($a0)
/* 87B74 80086F74 92030291 */  lbu        $v1, 0x291($s0)
/* 87B78 80086F78 24020003 */  addiu      $v0, $zero, 3
/* 87B7C 80086F7C A200028E */  sb         $zero, 0x28e($s0)
/* 87B80 80086F80 A200028F */  sb         $zero, 0x28f($s0)
/* 87B84 80086F84 14600005 */  bnez       $v1, .L80086F9C
/* 87B88 80086F88 A202028C */   sb        $v0, 0x28c($s0)
/* 87B8C 80086F8C 0C021F22 */  jal        func_80087C88
/* 87B90 80086F90 02002021 */   addu      $a0, $s0, $zero
/* 87B94 80086F94 08021BEA */  j          .L80086FA8
/* 87B98 80086F98 9205005B */   lbu       $a1, 0x5b($s0)
.L80086F9C:
/* 87B9C 80086F9C 0C021F01 */  jal        func_80087C04
/* 87BA0 80086FA0 02002021 */   addu      $a0, $s0, $zero
/* 87BA4 80086FA4 9205005B */  lbu        $a1, 0x5b($s0)
.L80086FA8:
/* 87BA8 80086FA8 0C02F216 */  jal        widget_fade
/* 87BAC 80086FAC 02002021 */   addu      $a0, $s0, $zero
/* 87BB0 80086FB0 8E020078 */  lw         $v0, 0x78($s0)
/* 87BB4 80086FB4 844400C8 */  lh         $a0, 0xc8($v0)
/* 87BB8 80086FB8 8C4300CC */  lw         $v1, 0xcc($v0)
/* 87BBC 80086FBC 0060F809 */  jalr       $v1
/* 87BC0 80086FC0 02042021 */   addu      $a0, $s0, $a0
.L80086FC4:
/* 87BC4 80086FC4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 87BC8 80086FC8 8FB00010 */  lw         $s0, 0x10($sp)
/* 87BCC 80086FCC 03E00008 */  jr         $ra
/* 87BD0 80086FD0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel controllerpakdata_func
/* 87BD4 80086FD4 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 87BD8 80086FD8 AFB1005C */  sw         $s1, 0x5c($sp)
/* 87BDC 80086FDC 00808821 */  addu       $s1, $a0, $zero
/* 87BE0 80086FE0 AFBF006C */  sw         $ra, 0x6c($sp)
/* 87BE4 80086FE4 AFB40068 */  sw         $s4, 0x68($sp)
/* 87BE8 80086FE8 AFB30064 */  sw         $s3, 0x64($sp)
/* 87BEC 80086FEC AFB20060 */  sw         $s2, 0x60($sp)
/* 87BF0 80086FF0 AFB00058 */  sw         $s0, 0x58($sp)
/* 87BF4 80086FF4 9223028E */  lbu        $v1, 0x28e($s1)
/* 87BF8 80086FF8 24620001 */  addiu      $v0, $v1, 1
/* 87BFC 80086FFC A222028E */  sb         $v0, 0x28e($s1)
/* 87C00 80087000 304200FF */  andi       $v0, $v0, 0xff
/* 87C04 80087004 2C420010 */  sltiu      $v0, $v0, 0x10
/* 87C08 80087008 1440000B */  bnez       $v0, .L80087038
/* 87C0C 8008700C 307200FF */   andi      $s2, $v1, 0xff
/* 87C10 80087010 8E250078 */  lw         $a1, 0x78($s1)
/* 87C14 80087014 24020001 */  addiu      $v0, $zero, 1
/* 87C18 80087018 A22202A4 */  sb         $v0, 0x2a4($s1)
/* 87C1C 8008701C 84A400D0 */  lh         $a0, 0xd0($a1)
/* 87C20 80087020 8CA300D4 */  lw         $v1, 0xd4($a1)
/* 87C24 80087024 0060F809 */  jalr       $v1
/* 87C28 80087028 02242021 */   addu      $a0, $s1, $a0
/* 87C2C 8008702C 24020004 */  addiu      $v0, $zero, 4
/* 87C30 80087030 08021C6A */  j          .L800871A8
/* 87C34 80087034 A222028C */   sb        $v0, 0x28c($s1)
.L80087038:
/* 87C38 80087038 27A40018 */  addiu      $a0, $sp, 0x18
/* 87C3C 8008703C 02402821 */  addu       $a1, $s2, $zero
/* 87C40 80087040 0C026FC9 */  jal        get_file_state
/* 87C44 80087044 00003021 */   addu      $a2, $zero, $zero
/* 87C48 80087048 A222028D */  sb         $v0, 0x28d($s1)
/* 87C4C 8008704C 305000FF */  andi       $s0, $v0, 0xff
/* 87C50 80087050 24020006 */  addiu      $v0, $zero, 6
/* 87C54 80087054 5602000A */  bnel       $s0, $v0, .L80087080
/* 87C58 80087058 9222028D */   lbu       $v0, 0x28d($s1)
/* 87C5C 8008705C 27A40018 */  addiu      $a0, $sp, 0x18
/* 87C60 80087060 02402821 */  addu       $a1, $s2, $zero
/* 87C64 80087064 0C026FC9 */  jal        get_file_state
/* 87C68 80087068 00003021 */   addu      $a2, $zero, $zero
/* 87C6C 8008706C A222028D */  sb         $v0, 0x28d($s1)
/* 87C70 80087070 304200FF */  andi       $v0, $v0, 0xff
/* 87C74 80087074 1050003B */  beq        $v0, $s0, .L80087164
/* 87C78 80087078 24020004 */   addiu     $v0, $zero, 4
/* 87C7C 8008707C 9222028D */  lbu        $v0, 0x28d($s1)
.L80087080:
/* 87C80 80087080 1440004A */  bnez       $v0, .L800871AC
/* 87C84 80087084 8FBF006C */   lw        $ra, 0x6c($sp)
/* 87C88 80087088 97A3001A */  lhu        $v1, 0x1a($sp)
/* 87C8C 8008708C 24023738 */  addiu      $v0, $zero, 0x3738
/* 87C90 80087090 14620047 */  bne        $v1, $v0, .L800871B0
/* 87C94 80087094 8FB40068 */   lw        $s4, 0x68($sp)
/* 87C98 80087098 3C024E41 */  lui        $v0, 0x4e41
/* 87C9C 8008709C 8FA3001C */  lw         $v1, 0x1c($sp)
/* 87CA0 800870A0 34425945 */  ori        $v0, $v0, 0x5945
/* 87CA4 800870A4 14620043 */  bne        $v1, $v0, .L800871B4
/* 87CA8 800870A8 8FB30064 */   lw        $s3, 0x64($sp)
/* 87CAC 800870AC 0012A140 */  sll        $s4, $s2, 5
/* 87CB0 800870B0 2622007C */  addiu      $v0, $s1, 0x7c
/* 87CB4 800870B4 00549821 */  addu       $s3, $v0, $s4
/* 87CB8 800870B8 8E700000 */  lw         $s0, ($s3)
/* 87CBC 800870BC 16000009 */  bnez       $s0, .L800870E4
/* 87CC0 800870C0 02002021 */   addu      $a0, $s0, $zero
/* 87CC4 800870C4 24041C00 */  addiu      $a0, $zero, 0x1c00
/* 87CC8 800870C8 3C05800E */  lui        $a1, %hi(D_800E0FB0)
/* 87CCC 800870CC 24A50FB0 */  addiu      $a1, $a1, %lo(D_800E0FB0)
/* 87CD0 800870D0 0C025F9C */  jal        Malloc
/* 87CD4 800870D4 240603DC */   addiu     $a2, $zero, 0x3dc
/* 87CD8 800870D8 AE620000 */  sw         $v0, ($s3)
/* 87CDC 800870DC 00408021 */  addu       $s0, $v0, $zero
/* 87CE0 800870E0 02002021 */  addu       $a0, $s0, $zero
.L800870E4:
/* 87CE4 800870E4 02402821 */  addu       $a1, $s2, $zero
/* 87CE8 800870E8 00003021 */  addu       $a2, $zero, $zero
/* 87CEC 800870EC 24071C00 */  addiu      $a3, $zero, 0x1c00
/* 87CF0 800870F0 0C027033 */  jal        read_write_ContPak
/* 87CF4 800870F4 AFA00010 */   sw        $zero, 0x10($sp)
/* 87CF8 800870F8 304300FF */  andi       $v1, $v0, 0xff
/* 87CFC 800870FC A222028D */  sb         $v0, 0x28d($s1)
/* 87D00 80087100 24020006 */  addiu      $v0, $zero, 6
/* 87D04 80087104 1462000E */  bne        $v1, $v0, .L80087140
/* 87D08 80087108 02002021 */   addu      $a0, $s0, $zero
/* 87D0C 8008710C 02402821 */  addu       $a1, $s2, $zero
/* 87D10 80087110 00003021 */  addu       $a2, $zero, $zero
/* 87D14 80087114 24071C00 */  addiu      $a3, $zero, 0x1c00
/* 87D18 80087118 0C027033 */  jal        read_write_ContPak
/* 87D1C 8008711C AFA00010 */   sw        $zero, 0x10($sp)
/* 87D20 80087120 02202021 */  addu       $a0, $s1, $zero
/* 87D24 80087124 02402821 */  addu       $a1, $s2, $zero
/* 87D28 80087128 A222028D */  sb         $v0, 0x28d($s1)
/* 87D2C 8008712C 24020004 */  addiu      $v0, $zero, 4
/* 87D30 80087130 0C021E54 */  jal        corrupt_saveGame
/* 87D34 80087134 A222028C */   sb        $v0, 0x28c($s1)
/* 87D38 80087138 08021C6B */  j          .L800871AC
/* 87D3C 8008713C 8FBF006C */   lw        $ra, 0x6c($sp)
.L80087140:
/* 87D40 80087140 10600003 */  beqz       $v1, .L80087150
/* 87D44 80087144 24020001 */   addiu     $v0, $zero, 1
/* 87D48 80087148 08021C6A */  j          .L800871A8
/* 87D4C 8008714C A222028C */   sb        $v0, 0x28c($s1)
.L80087150:
/* 87D50 80087150 0C0077B9 */  jal        func_8001DEE4
/* 87D54 80087154 02002021 */   addu      $a0, $s0, $zero
/* 87D58 80087158 14400008 */  bnez       $v0, .L8008717C
/* 87D5C 8008715C 02002021 */   addu      $a0, $s0, $zero
/* 87D60 80087160 24020004 */  addiu      $v0, $zero, 4
.L80087164:
/* 87D64 80087164 A222028C */  sb         $v0, 0x28c($s1)
/* 87D68 80087168 02202021 */  addu       $a0, $s1, $zero
/* 87D6C 8008716C 0C021E54 */  jal        corrupt_saveGame
/* 87D70 80087170 02402821 */   addu      $a1, $s2, $zero
/* 87D74 80087174 08021C6B */  j          .L800871AC
/* 87D78 80087178 8FBF006C */   lw        $ra, 0x6c($sp)
.L8008717C:
/* 87D7C 8008717C 2690007C */  addiu      $s0, $s4, 0x7c
/* 87D80 80087180 02308021 */  addu       $s0, $s1, $s0
/* 87D84 80087184 0C00783E */  jal        func_8001E0F8
/* 87D88 80087188 02002821 */   addu      $a1, $s0, $zero
/* 87D8C 8008718C 02202021 */  addu       $a0, $s1, $zero
/* 87D90 80087190 02002821 */  addu       $a1, $s0, $zero
/* 87D94 80087194 0C021ECD */  jal        func_80087B34
/* 87D98 80087198 02403021 */   addu      $a2, $s2, $zero
/* 87D9C 8008719C 9223028F */  lbu        $v1, 0x28f($s1)
/* 87DA0 800871A0 24630001 */  addiu      $v1, $v1, 1
/* 87DA4 800871A4 A223028F */  sb         $v1, 0x28f($s1)
.L800871A8:
/* 87DA8 800871A8 8FBF006C */  lw         $ra, 0x6c($sp)
.L800871AC:
/* 87DAC 800871AC 8FB40068 */  lw         $s4, 0x68($sp)
.L800871B0:
/* 87DB0 800871B0 8FB30064 */  lw         $s3, 0x64($sp)
.L800871B4:
/* 87DB4 800871B4 8FB20060 */  lw         $s2, 0x60($sp)
/* 87DB8 800871B8 8FB1005C */  lw         $s1, 0x5c($sp)
/* 87DBC 800871BC 8FB00058 */  lw         $s0, 0x58($sp)
/* 87DC0 800871C0 03E00008 */  jr         $ra
/* 87DC4 800871C4 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_800871C8
/* 87DC8 800871C8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87DCC 800871CC AFB00010 */  sw         $s0, 0x10($sp)
/* 87DD0 800871D0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87DD4 800871D4 0C021F10 */  jal        func_80087C40
/* 87DD8 800871D8 00808021 */   addu      $s0, $a0, $zero
/* 87DDC 800871DC 92020290 */  lbu        $v0, 0x290($s0)
/* 87DE0 800871E0 14400005 */  bnez       $v0, .L800871F8
/* 87DE4 800871E4 00000000 */   nop
/* 87DE8 800871E8 0C021C9B */  jal        func_8008726C
/* 87DEC 800871EC 02002021 */   addu      $a0, $s0, $zero
/* 87DF0 800871F0 08021C89 */  j          .L80087224
/* 87DF4 800871F4 8FBF0014 */   lw        $ra, 0x14($sp)
.L800871F8:
/* 87DF8 800871F8 0C022360 */  jal        func_80088D80
/* 87DFC 800871FC 00000000 */   nop
/* 87E00 80087200 10400008 */  beqz       $v0, .L80087224
/* 87E04 80087204 8FBF0014 */   lw        $ra, 0x14($sp)
/* 87E08 80087208 A200028C */  sb         $zero, 0x28c($s0)
/* 87E0C 8008720C 0C02238B */  jal        func_80088E2C
/* 87E10 80087210 A2000290 */   sb        $zero, 0x290($s0)
/* 87E14 80087214 10400002 */  beqz       $v0, .L80087220
/* 87E18 80087218 24020005 */   addiu     $v0, $zero, 5
/* 87E1C 8008721C A202028C */  sb         $v0, 0x28c($s0)
.L80087220:
/* 87E20 80087220 8FBF0014 */  lw         $ra, 0x14($sp)
.L80087224:
/* 87E24 80087224 8FB00010 */  lw         $s0, 0x10($sp)
/* 87E28 80087228 03E00008 */  jr         $ra
/* 87E2C 8008722C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80087230
/* 87E30 80087230 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87E34 80087234 AFB00010 */  sw         $s0, 0x10($sp)
/* 87E38 80087238 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87E3C 8008723C 0C021FB0 */  jal        func_80087EC0
/* 87E40 80087240 00808021 */   addu      $s0, $a0, $zero
/* 87E44 80087244 02002021 */  addu       $a0, $s0, $zero
/* 87E48 80087248 0C021B8D */  jal        func_80086E34
/* 87E4C 8008724C A200028C */   sb        $zero, 0x28c($s0)
/* 87E50 80087250 8FBF0014 */  lw         $ra, 0x14($sp)
/* 87E54 80087254 8FB00010 */  lw         $s0, 0x10($sp)
/* 87E58 80087258 03E00008 */  jr         $ra
/* 87E5C 8008725C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80087260
/* 87E60 80087260 24020008 */  addiu      $v0, $zero, 8
/* 87E64 80087264 03E00008 */  jr         $ra
/* 87E68 80087268 A082028C */   sb        $v0, 0x28c($a0)

glabel func_8008726C
/* 87E6C 8008726C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 87E70 80087270 AFB20018 */  sw         $s2, 0x18($sp)
/* 87E74 80087274 00809021 */  addu       $s2, $a0, $zero
/* 87E78 80087278 AFBF0020 */  sw         $ra, 0x20($sp)
/* 87E7C 8008727C AFB3001C */  sw         $s3, 0x1c($sp)
/* 87E80 80087280 AFB10014 */  sw         $s1, 0x14($sp)
/* 87E84 80087284 AFB00010 */  sw         $s0, 0x10($sp)
/* 87E88 80087288 9243028C */  lbu        $v1, 0x28c($s2)
/* 87E8C 8008728C 24020008 */  addiu      $v0, $zero, 8
/* 87E90 80087290 1062003F */  beq        $v1, $v0, .L80087390
/* 87E94 80087294 265002B8 */   addiu     $s0, $s2, 0x2b8
/* 87E98 80087298 00002021 */  addu       $a0, $zero, $zero
/* 87E9C 8008729C 02002821 */  addu       $a1, $s0, $zero
/* 87EA0 800872A0 0C0270AC */  jal        controller_query_2
/* 87EA4 800872A4 925102B8 */   lbu       $s1, 0x2b8($s2)
/* 87EA8 800872A8 5440000A */  bnel       $v0, $zero, .L800872D4
/* 87EAC 800872AC 924202B8 */   lbu       $v0, 0x2b8($s2)
/* 87EB0 800872B0 00002021 */  addu       $a0, $zero, $zero
/* 87EB4 800872B4 0C0270AC */  jal        controller_query_2
/* 87EB8 800872B8 02002821 */   addu      $a1, $s0, $zero
/* 87EBC 800872BC 54400005 */  bnel       $v0, $zero, .L800872D4
/* 87EC0 800872C0 924202B8 */   lbu       $v0, 0x2b8($s2)
/* 87EC4 800872C4 0C021C98 */  jal        func_80087260
/* 87EC8 800872C8 02402021 */   addu      $a0, $s2, $zero
/* 87ECC 800872CC 08021CE5 */  j          .L80087394
/* 87ED0 800872D0 8FBF0020 */   lw        $ra, 0x20($sp)
.L800872D4:
/* 87ED4 800872D4 24130001 */  addiu      $s3, $zero, 1
/* 87ED8 800872D8 304300FF */  andi       $v1, $v0, 0xff
/* 87EDC 800872DC 14730003 */  bne        $v1, $s3, .L800872EC
/* 87EE0 800872E0 00402021 */   addu      $a0, $v0, $zero
/* 87EE4 800872E4 1233002B */  beq        $s1, $s3, .L80087394
/* 87EE8 800872E8 8FBF0020 */   lw        $ra, 0x20($sp)
.L800872EC:
/* 87EEC 800872EC 10710028 */  beq        $v1, $s1, .L80087390
/* 87EF0 800872F0 24020003 */   addiu     $v0, $zero, 3
/* 87EF4 800872F4 14620018 */  bne        $v1, $v0, .L80087358
/* 87EF8 800872F8 308300FF */   andi      $v1, $a0, 0xff
/* 87EFC 800872FC 24020002 */  addiu      $v0, $zero, 2
/* 87F00 80087300 16220016 */  bne        $s1, $v0, .L8008735C
/* 87F04 80087304 00000000 */   nop
/* 87F08 80087308 0C026EB7 */  jal        get_psf_err
/* 87F0C 8008730C 00002021 */   addu      $a0, $zero, $zero
/* 87F10 80087310 00408021 */  addu       $s0, $v0, $zero
/* 87F14 80087314 24020006 */  addiu      $v0, $zero, 6
/* 87F18 80087318 16020004 */  bne        $s0, $v0, .L8008732C
/* 87F1C 8008731C 00000000 */   nop
/* 87F20 80087320 0C026EB7 */  jal        get_psf_err
/* 87F24 80087324 00002021 */   addu      $a0, $zero, $zero
/* 87F28 80087328 00408021 */  addu       $s0, $v0, $zero
.L8008732C:
/* 87F2C 8008732C 0C021FB0 */  jal        func_80087EC0
/* 87F30 80087330 02402021 */   addu      $a0, $s2, $zero
/* 87F34 80087334 52110004 */  beql       $s0, $s1, .L80087348
/* 87F38 80087338 A251028D */   sb        $s1, 0x28d($s2)
/* 87F3C 8008733C 56000004 */  bnel       $s0, $zero, .L80087350
/* 87F40 80087340 A250028D */   sb        $s0, 0x28d($s2)
/* 87F44 80087344 A251028D */  sb         $s1, 0x28d($s2)
.L80087348:
/* 87F48 80087348 08021CE4 */  j          .L80087390
/* 87F4C 8008734C A253028C */   sb        $s3, 0x28c($s2)
.L80087350:
/* 87F50 80087350 08021CE4 */  j          .L80087390
/* 87F54 80087354 A253028C */   sb        $s3, 0x28c($s2)
.L80087358:
/* 87F58 80087358 24020002 */  addiu      $v0, $zero, 2
.L8008735C:
/* 87F5C 8008735C 5462000D */  bnel       $v1, $v0, .L80087394
/* 87F60 80087360 8FBF0020 */   lw        $ra, 0x20($sp)
/* 87F64 80087364 24020001 */  addiu      $v0, $zero, 1
/* 87F68 80087368 16220005 */  bne        $s1, $v0, .L80087380
/* 87F6C 8008736C 00000000 */   nop
/* 87F70 80087370 0C021C8C */  jal        func_80087230
/* 87F74 80087374 02402021 */   addu      $a0, $s2, $zero
/* 87F78 80087378 08021CE5 */  j          .L80087394
/* 87F7C 8008737C 8FBF0020 */   lw        $ra, 0x20($sp)
.L80087380:
/* 87F80 80087380 12230004 */  beq        $s1, $v1, .L80087394
/* 87F84 80087384 8FBF0020 */   lw        $ra, 0x20($sp)
/* 87F88 80087388 0C021C8C */  jal        func_80087230
/* 87F8C 8008738C 02402021 */   addu      $a0, $s2, $zero
.L80087390:
/* 87F90 80087390 8FBF0020 */  lw         $ra, 0x20($sp)
.L80087394:
/* 87F94 80087394 8FB3001C */  lw         $s3, 0x1c($sp)
/* 87F98 80087398 8FB20018 */  lw         $s2, 0x18($sp)
/* 87F9C 8008739C 8FB10014 */  lw         $s1, 0x14($sp)
/* 87FA0 800873A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 87FA4 800873A4 03E00008 */  jr         $ra
/* 87FA8 800873A8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800873AC
/* 87FAC 800873AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87FB0 800873B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 87FB4 800873B4 00808021 */  addu       $s0, $a0, $zero
/* 87FB8 800873B8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 87FBC 800873BC 8E020284 */  lw         $v0, 0x284($s0)
/* 87FC0 800873C0 50400004 */  beql       $v0, $zero, .L800873D4
/* 87FC4 800873C4 3C02800F */   lui       $v0, 0x800f
/* 87FC8 800873C8 0040F809 */  jalr       $v0
/* 87FCC 800873CC 00000000 */   nop
/* 87FD0 800873D0 3C02800F */  lui        $v0, %hi(contPakDat)
.L800873D4:
/* 87FD4 800873D4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 87FD8 800873D8 24030007 */  addiu      $v1, $zero, 7
/* 87FDC 800873DC AC401C60 */  sw         $zero, %lo(contPakDat)($v0)
/* 87FE0 800873E0 A203028C */  sb         $v1, 0x28c($s0)
/* 87FE4 800873E4 8FB00010 */  lw         $s0, 0x10($sp)
/* 87FE8 800873E8 03E00008 */  jr         $ra
/* 87FEC 800873EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800873F0
/* 87FF0 800873F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 87FF4 800873F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 87FF8 800873F8 8C830288 */  lw         $v1, 0x288($a0)
/* 87FFC 800873FC 24020007 */  addiu      $v0, $zero, 7
/* 88000 80087400 10600003 */  beqz       $v1, .L80087410
/* 88004 80087404 A082028C */   sb        $v0, 0x28c($a0)
/* 88008 80087408 0060F809 */  jalr       $v1
/* 8800C 8008740C 00000000 */   nop
.L80087410:
/* 88010 80087410 8FBF0010 */  lw         $ra, 0x10($sp)
/* 88014 80087414 3C02800F */  lui        $v0, %hi(contPakDat)
/* 88018 80087418 AC401C60 */  sw         $zero, %lo(contPakDat)($v0)
/* 8801C 8008741C 03E00008 */  jr         $ra
/* 88020 80087420 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80087424
/* 88024 80087424 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 88028 80087428 AFB00010 */  sw         $s0, 0x10($sp)
/* 8802C 8008742C 00808021 */  addu       $s0, $a0, $zero
/* 88030 80087430 AFBF0014 */  sw         $ra, 0x14($sp)
/* 88034 80087434 0C026E11 */  jal        controller_status_check
/* 88038 80087438 00002021 */   addu      $a0, $zero, $zero
/* 8803C 8008743C 10400004 */  beqz       $v0, .L80087450
/* 88040 80087440 8FBF0014 */   lw        $ra, 0x14($sp)
/* 88044 80087444 0C021C8C */  jal        func_80087230
/* 88048 80087448 02002021 */   addu      $a0, $s0, $zero
/* 8804C 8008744C 8FBF0014 */  lw         $ra, 0x14($sp)
.L80087450:
/* 88050 80087450 8FB00010 */  lw         $s0, 0x10($sp)
/* 88054 80087454 03E00008 */  jr         $ra
/* 88058 80087458 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008745C
/* 8805C 8008745C 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 88060 80087460 AFB000A8 */  sw         $s0, 0xa8($sp)
/* 88064 80087464 00808021 */  addu       $s0, $a0, $zero
/* 88068 80087468 24020014 */  addiu      $v0, $zero, 0x14
/* 8806C 8008746C AFBF00AC */  sw         $ra, 0xac($sp)
/* 88070 80087470 0C021F10 */  jal        func_80087C40
/* 88074 80087474 A20202B9 */   sb        $v0, 0x2b9($s0)
/* 88078 80087478 0C026259 */  jal        passToMalloc
/* 8807C 8008747C 240400B0 */   addiu     $a0, $zero, 0xb0
/* 88080 80087480 00402021 */  addu       $a0, $v0, $zero
/* 88084 80087484 24050001 */  addiu      $a1, $zero, 1
/* 88088 80087488 3C06800E */  lui        $a2, %hi(D_800E1030)
/* 8808C 8008748C 24C61030 */  addiu      $a2, $a2, %lo(D_800E1030)
/* 88090 80087490 240200E1 */  addiu      $v0, $zero, 0xe1
/* 88094 80087494 27A70028 */  addiu      $a3, $sp, 0x28
/* 88098 80087498 240300FF */  addiu      $v1, $zero, 0xff
/* 8809C 8008749C A3A20028 */  sb         $v0, 0x28($sp)
/* 880A0 800874A0 A0E20001 */  sb         $v0, 1($a3)
/* 880A4 800874A4 A0E20002 */  sb         $v0, 2($a3)
/* 880A8 800874A8 27A20068 */  addiu      $v0, $sp, 0x68
/* 880AC 800874AC A0E30003 */  sb         $v1, 3($a3)
/* 880B0 800874B0 24030001 */  addiu      $v1, $zero, 1
/* 880B4 800874B4 AFA70010 */  sw         $a3, 0x10($sp)
/* 880B8 800874B8 24070064 */  addiu      $a3, $zero, 0x64
/* 880BC 800874BC A3A00068 */  sb         $zero, 0x68($sp)
/* 880C0 800874C0 A3A00069 */  sb         $zero, 0x69($sp)
/* 880C4 800874C4 A3A0006A */  sb         $zero, 0x6a($sp)
/* 880C8 800874C8 A3A0006B */  sb         $zero, 0x6b($sp)
/* 880CC 800874CC AFA20014 */  sw         $v0, 0x14($sp)
/* 880D0 800874D0 AFA30018 */  sw         $v1, 0x18($sp)
/* 880D4 800874D4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 880D8 800874D8 0C013461 */  jal        func_8004D184
/* 880DC 800874DC AFA00020 */   sw        $zero, 0x20($sp)
/* 880E0 800874E0 3C03800E */  lui        $v1, %hi(bigAssMenu)
/* 880E4 800874E4 8C647D74 */  lw         $a0, %lo(bigAssMenu)($v1)
/* 880E8 800874E8 10800005 */  beqz       $a0, .L80087500
/* 880EC 800874EC AE0202A0 */   sw        $v0, 0x2a0($s0)
/* 880F0 800874F0 00402021 */  addu       $a0, $v0, $zero
/* 880F4 800874F4 24050019 */  addiu      $a1, $zero, 0x19
/* 880F8 800874F8 0C02F22A */  jal        widget_move
/* 880FC 800874FC 00003021 */   addu      $a2, $zero, $zero
.L80087500:
/* 88100 80087500 0C026259 */  jal        passToMalloc
/* 88104 80087504 2404007C */   addiu     $a0, $zero, 0x7c
/* 88108 80087508 00402021 */  addu       $a0, $v0, $zero
/* 8810C 8008750C 3C05800E */  lui        $a1, %hi(D_800E1070)
/* 88110 80087510 24A51070 */  addiu      $a1, $a1, %lo(D_800E1070)
/* 88114 80087514 0C02E3A0 */  jal        widgettext_func_2
/* 88118 80087518 24060004 */   addiu     $a2, $zero, 4
/* 8811C 8008751C 8E0402A0 */  lw         $a0, 0x2a0($s0)
/* 88120 80087520 0C013626 */  jal        func_8004D898
/* 88124 80087524 00402821 */   addu      $a1, $v0, $zero
/* 88128 80087528 0C013786 */  jal        func_8004DE18
/* 8812C 8008752C 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 88130 80087530 8FBF00AC */  lw         $ra, 0xac($sp)
/* 88134 80087534 2402000A */  addiu      $v0, $zero, 0xa
/* 88138 80087538 A202028C */  sb         $v0, 0x28c($s0)
/* 8813C 8008753C 8FB000A8 */  lw         $s0, 0xa8($sp)
/* 88140 80087540 03E00008 */  jr         $ra
/* 88144 80087544 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel func_80087548
/* 88148 80087548 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8814C 8008754C 00803021 */  addu       $a2, $a0, $zero
/* 88150 80087550 AFBF0010 */  sw         $ra, 0x10($sp)
/* 88154 80087554 90C202B9 */  lbu        $v0, 0x2b9($a2)
/* 88158 80087558 10400003 */  beqz       $v0, .L80087568
/* 8815C 8008755C 2442FFFF */   addiu     $v0, $v0, -1
/* 88160 80087560 08021D64 */  j          .L80087590
/* 88164 80087564 A0C202B9 */   sb        $v0, 0x2b9($a2)
.L80087568:
/* 88168 80087568 8CC30078 */  lw         $v1, 0x78($a2)
/* 8816C 8008756C 90C502BA */  lbu        $a1, 0x2ba($a2)
/* 88170 80087570 2402000B */  addiu      $v0, $zero, 0xb
/* 88174 80087574 A0C2028C */  sb         $v0, 0x28c($a2)
/* 88178 80087578 24020014 */  addiu      $v0, $zero, 0x14
/* 8817C 8008757C A0C202B9 */  sb         $v0, 0x2b9($a2)
/* 88180 80087580 846400F8 */  lh         $a0, 0xf8($v1)
/* 88184 80087584 8C6200FC */  lw         $v0, 0xfc($v1)
/* 88188 80087588 0040F809 */  jalr       $v0
/* 8818C 8008758C 00C42021 */   addu      $a0, $a2, $a0
.L80087590:
/* 88190 80087590 8FBF0010 */  lw         $ra, 0x10($sp)
/* 88194 80087594 03E00008 */  jr         $ra
/* 88198 80087598 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008759C
/* 8819C 8008759C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 881A0 800875A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 881A4 800875A4 00808021 */  addu       $s0, $a0, $zero
/* 881A8 800875A8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 881AC 800875AC 920202B9 */  lbu        $v0, 0x2b9($s0)
/* 881B0 800875B0 10400003 */  beqz       $v0, .L800875C0
/* 881B4 800875B4 2442FFFF */   addiu     $v0, $v0, -1
/* 881B8 800875B8 08021D77 */  j          .L800875DC
/* 881BC 800875BC A20202B9 */   sb        $v0, 0x2b9($s0)
.L800875C0:
/* 881C0 800875C0 0C021F10 */  jal        func_80087C40
/* 881C4 800875C4 02002021 */   addu      $a0, $s0, $zero
/* 881C8 800875C8 8E020078 */  lw         $v0, 0x78($s0)
/* 881CC 800875CC 84440100 */  lh         $a0, 0x100($v0)
/* 881D0 800875D0 8C430104 */  lw         $v1, 0x104($v0)
/* 881D4 800875D4 0060F809 */  jalr       $v1
/* 881D8 800875D8 02042021 */   addu      $a0, $s0, $a0
.L800875DC:
/* 881DC 800875DC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 881E0 800875E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 881E4 800875E4 03E00008 */  jr         $ra
/* 881E8 800875E8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel NOOP_800875ec
/* 881EC 800875EC 03E00008 */  jr         $ra
/* 881F0 800875F0 00000000 */   nop

glabel NOOP_800875F4
/* 881F4 800875F4 03E00008 */  jr         $ra
/* 881F8 800875F8 00000000 */   nop

glabel func_800875FC
/* 881FC 800875FC 24020002 */  addiu      $v0, $zero, 2
/* 88200 80087600 03E00008 */  jr         $ra
/* 88204 80087604 A082028C */   sb        $v0, 0x28c($a0)

glabel func_80087608
/* 88208 80087608 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8820C 8008760C 3C028008 */  lui        $v0, %hi(func_80086290)
/* 88210 80087610 248502BC */  addiu      $a1, $a0, 0x2bc
/* 88214 80087614 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 88218 80087618 AFB00018 */  sw         $s0, 0x18($sp)
/* 8821C 8008761C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 88220 80087620 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 88224 80087624 AFBF001C */  sw         $ra, 0x1c($sp)
/* 88228 80087628 8E02204C */  lw         $v0, 0x204c($s0)
/* 8822C 8008762C AFA00010 */  sw         $zero, 0x10($sp)
/* 88230 80087630 8C470328 */  lw         $a3, 0x328($v0)
/* 88234 80087634 0C0222AB */  jal        func_80088AAC
/* 88238 80087638 24060001 */   addiu     $a2, $zero, 1
/* 8823C 8008763C 3C058008 */  lui        $a1, %hi(func_80086054)
/* 88240 80087640 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 88244 80087644 8E03204C */  lw         $v1, 0x204c($s0)
/* 88248 80087648 24060080 */  addiu      $a2, $zero, 0x80
/* 8824C 8008764C 8C640330 */  lw         $a0, 0x330($v1)
/* 88250 80087650 0C02227C */  jal        text_func
/* 88254 80087654 00408021 */   addu      $s0, $v0, $zero
/* 88258 80087658 02002021 */  addu       $a0, $s0, $zero
/* 8825C 8008765C 0C013626 */  jal        func_8004D898
/* 88260 80087660 00402821 */   addu      $a1, $v0, $zero
/* 88264 80087664 0C013786 */  jal        func_8004DE18
/* 88268 80087668 02002021 */   addu      $a0, $s0, $zero
/* 8826C 8008766C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 88270 80087670 8FB00018 */  lw         $s0, 0x18($sp)
/* 88274 80087674 03E00008 */  jr         $ra
/* 88278 80087678 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008767C
/* 8827C 8008767C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 88280 80087680 AFB1001C */  sw         $s1, 0x1c($sp)
/* 88284 80087684 00808821 */  addu       $s1, $a0, $zero
/* 88288 80087688 00002021 */  addu       $a0, $zero, $zero
/* 8828C 8008768C AFBF0020 */  sw         $ra, 0x20($sp)
/* 88290 80087690 0C026EB7 */  jal        get_psf_err
/* 88294 80087694 AFB00018 */   sw        $s0, 0x18($sp)
/* 88298 80087698 00401821 */  addu       $v1, $v0, $zero
/* 8829C 8008769C 24020006 */  addiu      $v0, $zero, 6
/* 882A0 800876A0 14620004 */  bne        $v1, $v0, .L800876B4
/* 882A4 800876A4 00000000 */   nop
/* 882A8 800876A8 0C026EB7 */  jal        get_psf_err
/* 882AC 800876AC 00002021 */   addu      $a0, $zero, $zero
/* 882B0 800876B0 00401821 */  addu       $v1, $v0, $zero
.L800876B4:
/* 882B4 800876B4 10600006 */  beqz       $v1, .L800876D0
/* 882B8 800876B8 3C048008 */   lui       $a0, 0x8008
/* 882BC 800876BC A223028D */  sb         $v1, 0x28d($s1)
/* 882C0 800876C0 0C021BA1 */  jal        func_80086E84
/* 882C4 800876C4 02202021 */   addu      $a0, $s1, $zero
/* 882C8 800876C8 08021DCA */  j          .L80087728
/* 882CC 800876CC 8FBF0020 */   lw        $ra, 0x20($sp)
.L800876D0:
/* 882D0 800876D0 24846290 */  addiu      $a0, $a0, 0x6290
/* 882D4 800876D4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 882D8 800876D8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 882DC 800876DC 8E02204C */  lw         $v0, 0x204c($s0)
/* 882E0 800876E0 262502BC */  addiu      $a1, $s1, 0x2bc
/* 882E4 800876E4 AFA00010 */  sw         $zero, 0x10($sp)
/* 882E8 800876E8 8C4702B8 */  lw         $a3, 0x2b8($v0)
/* 882EC 800876EC 0C0222AB */  jal        func_80088AAC
/* 882F0 800876F0 24060001 */   addiu     $a2, $zero, 1
/* 882F4 800876F4 3C058008 */  lui        $a1, %hi(func_80085D64)
/* 882F8 800876F8 24A55D64 */  addiu      $a1, $a1, %lo(func_80085D64)
/* 882FC 800876FC 8E03204C */  lw         $v1, 0x204c($s0)
/* 88300 80087700 24060080 */  addiu      $a2, $zero, 0x80
/* 88304 80087704 8C6402C0 */  lw         $a0, 0x2c0($v1)
/* 88308 80087708 0C02227C */  jal        text_func
/* 8830C 8008770C 00408021 */   addu      $s0, $v0, $zero
/* 88310 80087710 02002021 */  addu       $a0, $s0, $zero
/* 88314 80087714 0C013626 */  jal        func_8004D898
/* 88318 80087718 00402821 */   addu      $a1, $v0, $zero
/* 8831C 8008771C 0C013786 */  jal        func_8004DE18
/* 88320 80087720 02002021 */   addu      $a0, $s0, $zero
/* 88324 80087724 8FBF0020 */  lw         $ra, 0x20($sp)
.L80087728:
/* 88328 80087728 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8832C 8008772C 8FB00018 */  lw         $s0, 0x18($sp)
/* 88330 80087730 03E00008 */  jr         $ra
/* 88334 80087734 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80087738
/* 88338 80087738 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8833C 8008773C 3C028008 */  lui        $v0, %hi(func_80086290)
/* 88340 80087740 248502BC */  addiu      $a1, $a0, 0x2bc
/* 88344 80087744 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 88348 80087748 AFB00018 */  sw         $s0, 0x18($sp)
/* 8834C 8008774C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 88350 80087750 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 88354 80087754 AFBF001C */  sw         $ra, 0x1c($sp)
/* 88358 80087758 8E02204C */  lw         $v0, 0x204c($s0)
/* 8835C 8008775C AFA00010 */  sw         $zero, 0x10($sp)
/* 88360 80087760 8C47078C */  lw         $a3, 0x78c($v0)
/* 88364 80087764 0C0222AB */  jal        func_80088AAC
/* 88368 80087768 24060001 */   addiu     $a2, $zero, 1
/* 8836C 8008776C 3C058008 */  lui        $a1, %hi(func_800860CC)
/* 88370 80087770 24A560CC */  addiu      $a1, $a1, %lo(func_800860CC)
/* 88374 80087774 8E03204C */  lw         $v1, 0x204c($s0)
/* 88378 80087778 24060080 */  addiu      $a2, $zero, 0x80
/* 8837C 8008777C 8C640330 */  lw         $a0, 0x330($v1)
/* 88380 80087780 0C02227C */  jal        text_func
/* 88384 80087784 00408021 */   addu      $s0, $v0, $zero
/* 88388 80087788 02002021 */  addu       $a0, $s0, $zero
/* 8838C 8008778C 0C013626 */  jal        func_8004D898
/* 88390 80087790 00402821 */   addu      $a1, $v0, $zero
/* 88394 80087794 0C013786 */  jal        func_8004DE18
/* 88398 80087798 02002021 */   addu      $a0, $s0, $zero
/* 8839C 8008779C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 883A0 800877A0 8FB00018 */  lw         $s0, 0x18($sp)
/* 883A4 800877A4 03E00008 */  jr         $ra
/* 883A8 800877A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel corrupt_controllerpak
/* 883AC 800877AC 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 883B0 800877B0 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 883B4 800877B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 883B8 800877B8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 883BC 800877BC 0C021DFD */  jal        confirm_overwrite
/* 883C0 800877C0 8C650670 */   lw        $a1, 0x670($v1)
/* 883C4 800877C4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 883C8 800877C8 03E00008 */  jr         $ra
/* 883CC 800877CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel damaged_controllerpak
/* 883D0 800877D0 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 883D4 800877D4 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 883D8 800877D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 883DC 800877DC AFBF0010 */  sw         $ra, 0x10($sp)
/* 883E0 800877E0 0C021DFD */  jal        confirm_overwrite
/* 883E4 800877E4 8C650674 */   lw        $a1, 0x674($v1)
/* 883E8 800877E8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 883EC 800877EC 03E00008 */  jr         $ra
/* 883F0 800877F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel confirm_overwrite
/* 883F4 800877F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 883F8 800877F8 3C028008 */  lui        $v0, %hi(func_80086290)
/* 883FC 800877FC 248302BC */  addiu      $v1, $a0, 0x2bc
/* 88400 80087800 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 88404 80087804 00A03821 */  addu       $a3, $a1, $zero
/* 88408 80087808 00602821 */  addu       $a1, $v1, $zero
/* 8840C 8008780C 24060002 */  addiu      $a2, $zero, 2
/* 88410 80087810 AFBF0020 */  sw         $ra, 0x20($sp)
/* 88414 80087814 AFB1001C */  sw         $s1, 0x1c($sp)
/* 88418 80087818 AFB00018 */  sw         $s0, 0x18($sp)
/* 8841C 8008781C 0C0222AB */  jal        func_80088AAC
/* 88420 80087820 AFA00010 */   sw        $zero, 0x10($sp)
/* 88424 80087824 3C058008 */  lui        $a1, %hi(func_80085DCC)
/* 88428 80087828 24A55DCC */  addiu      $a1, $a1, %lo(func_80085DCC)
/* 8842C 8008782C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 88430 80087830 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 88434 80087834 8E03204C */  lw         $v1, 0x204c($s0)
/* 88438 80087838 24060080 */  addiu      $a2, $zero, 0x80
/* 8843C 8008783C 8C640678 */  lw         $a0, 0x678($v1)
/* 88440 80087840 0C02227C */  jal        text_func
/* 88444 80087844 00408821 */   addu      $s1, $v0, $zero
/* 88448 80087848 02202021 */  addu       $a0, $s1, $zero
/* 8844C 8008784C 0C013626 */  jal        func_8004D898
/* 88450 80087850 00402821 */   addu      $a1, $v0, $zero
/* 88454 80087854 3C058008 */  lui        $a1, %hi(func_800862C8)
/* 88458 80087858 8E02204C */  lw         $v0, 0x204c($s0)
/* 8845C 8008785C 24A562C8 */  addiu      $a1, $a1, %lo(func_800862C8)
/* 88460 80087860 8C44067C */  lw         $a0, 0x67c($v0)
/* 88464 80087864 0C02227C */  jal        text_func
/* 88468 80087868 24060080 */   addiu     $a2, $zero, 0x80
/* 8846C 8008786C 02202021 */  addu       $a0, $s1, $zero
/* 88470 80087870 0C013626 */  jal        func_8004D898
/* 88474 80087874 00402821 */   addu      $a1, $v0, $zero
/* 88478 80087878 0C013786 */  jal        func_8004DE18
/* 8847C 8008787C 02202021 */   addu      $a0, $s1, $zero
/* 88480 80087880 8FBF0020 */  lw         $ra, 0x20($sp)
/* 88484 80087884 8FB1001C */  lw         $s1, 0x1c($sp)
/* 88488 80087888 8FB00018 */  lw         $s0, 0x18($sp)
/* 8848C 8008788C 03E00008 */  jr         $ra
/* 88490 80087890 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80087894
/* 88494 80087894 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 88498 80087898 3C028008 */  lui        $v0, %hi(func_80086290)
/* 8849C 8008789C 248502BC */  addiu      $a1, $a0, 0x2bc
/* 884A0 800878A0 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 884A4 800878A4 AFB00018 */  sw         $s0, 0x18($sp)
/* 884A8 800878A8 3C10800E */  lui        $s0, %hi(gGlobals)
/* 884AC 800878AC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 884B0 800878B0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 884B4 800878B4 8E02204C */  lw         $v0, 0x204c($s0)
/* 884B8 800878B8 AFA00010 */  sw         $zero, 0x10($sp)
/* 884BC 800878BC 8C470684 */  lw         $a3, 0x684($v0)
/* 884C0 800878C0 0C0222AB */  jal        func_80088AAC
/* 884C4 800878C4 24060001 */   addiu     $a2, $zero, 1
/* 884C8 800878C8 3C058008 */  lui        $a1, %hi(func_80086054)
/* 884CC 800878CC 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 884D0 800878D0 8E03204C */  lw         $v1, 0x204c($s0)
/* 884D4 800878D4 24060080 */  addiu      $a2, $zero, 0x80
/* 884D8 800878D8 8C64067C */  lw         $a0, 0x67c($v1)
/* 884DC 800878DC 0C02227C */  jal        text_func
/* 884E0 800878E0 00408021 */   addu      $s0, $v0, $zero
/* 884E4 800878E4 02002021 */  addu       $a0, $s0, $zero
/* 884E8 800878E8 0C013626 */  jal        func_8004D898
/* 884EC 800878EC 00402821 */   addu      $a1, $v0, $zero
/* 884F0 800878F0 0C013786 */  jal        func_8004DE18
/* 884F4 800878F4 02002021 */   addu      $a0, $s0, $zero
/* 884F8 800878F8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 884FC 800878FC 8FB00018 */  lw         $s0, 0x18($sp)
/* 88500 80087900 03E00008 */  jr         $ra
/* 88504 80087904 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80087908
/* 88508 80087908 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8850C 8008790C AFB00010 */  sw         $s0, 0x10($sp)
/* 88510 80087910 00808021 */  addu       $s0, $a0, $zero
/* 88514 80087914 AFBF0014 */  sw         $ra, 0x14($sp)
/* 88518 80087918 0C0270E2 */  jal        query_controller
/* 8851C 8008791C 00002021 */   addu      $a0, $zero, $zero
/* 88520 80087920 10400005 */  beqz       $v0, .L80087938
/* 88524 80087924 00000000 */   nop
/* 88528 80087928 0C021DEB */  jal        corrupt_controllerpak
/* 8852C 8008792C 02002021 */   addu      $a0, $s0, $zero
/* 88530 80087930 08021E51 */  j          .L80087944
/* 88534 80087934 8FBF0014 */   lw        $ra, 0x14($sp)
.L80087938:
/* 88538 80087938 0C021DF4 */  jal        damaged_controllerpak
/* 8853C 8008793C 02002021 */   addu      $a0, $s0, $zero
/* 88540 80087940 8FBF0014 */  lw         $ra, 0x14($sp)
.L80087944:
/* 88544 80087944 8FB00010 */  lw         $s0, 0x10($sp)
/* 88548 80087948 03E00008 */  jr         $ra
/* 8854C 8008794C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel corrupt_saveGame
/* 88550 80087950 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 88554 80087954 AFB20020 */  sw         $s2, 0x20($sp)
/* 88558 80087958 00809021 */  addu       $s2, $a0, $zero
/* 8855C 8008795C AFB00018 */  sw         $s0, 0x18($sp)
/* 88560 80087960 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 88564 80087964 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 88568 80087968 02002021 */  addu       $a0, $s0, $zero
/* 8856C 8008796C AFB1001C */  sw         $s1, 0x1c($sp)
/* 88570 80087970 2611DF88 */  addiu      $s1, $s0, -0x2078
/* 88574 80087974 AFBF0028 */  sw         $ra, 0x28($sp)
/* 88578 80087978 AFB30024 */  sw         $s3, 0x24($sp)
/* 8857C 8008797C 8E22204C */  lw         $v0, 0x204c($s1)
/* 88580 80087980 30B300FF */  andi       $s3, $a1, 0xff
/* 88584 80087984 8C4502F4 */  lw         $a1, 0x2f4($v0)
/* 88588 80087988 0C0333AC */  jal        sprintf
/* 8858C 8008798C 26660001 */   addiu     $a2, $s3, 1
/* 88590 80087990 3C048008 */  lui        $a0, %hi(func_80086290)
/* 88594 80087994 24846290 */  addiu      $a0, $a0, %lo(func_80086290)
/* 88598 80087998 264502BC */  addiu      $a1, $s2, 0x2bc
/* 8859C 8008799C 24060002 */  addiu      $a2, $zero, 2
/* 885A0 800879A0 02003821 */  addu       $a3, $s0, $zero
/* 885A4 800879A4 0C0222AB */  jal        func_80088AAC
/* 885A8 800879A8 AFA00010 */   sw        $zero, 0x10($sp)
/* 885AC 800879AC 3C058008 */  lui        $a1, %hi(func_80086018)
/* 885B0 800879B0 24A56018 */  addiu      $a1, $a1, %lo(func_80086018)
/* 885B4 800879B4 8E23204C */  lw         $v1, 0x204c($s1)
/* 885B8 800879B8 24060080 */  addiu      $a2, $zero, 0x80
/* 885BC 800879BC 8C6402F8 */  lw         $a0, 0x2f8($v1)
/* 885C0 800879C0 0C02227C */  jal        text_func
/* 885C4 800879C4 00408021 */   addu      $s0, $v0, $zero
/* 885C8 800879C8 02002021 */  addu       $a0, $s0, $zero
/* 885CC 800879CC 00402821 */  addu       $a1, $v0, $zero
/* 885D0 800879D0 0C013626 */  jal        func_8004D898
/* 885D4 800879D4 A453005E */   sh        $s3, 0x5e($v0)
/* 885D8 800879D8 3C058008 */  lui        $a1, %hi(func_80086054)
/* 885DC 800879DC 8E22204C */  lw         $v0, 0x204c($s1)
/* 885E0 800879E0 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 885E4 800879E4 8C44067C */  lw         $a0, 0x67c($v0)
/* 885E8 800879E8 0C02227C */  jal        text_func
/* 885EC 800879EC 24060080 */   addiu     $a2, $zero, 0x80
/* 885F0 800879F0 02002021 */  addu       $a0, $s0, $zero
/* 885F4 800879F4 0C013626 */  jal        func_8004D898
/* 885F8 800879F8 00402821 */   addu      $a1, $v0, $zero
/* 885FC 800879FC 0C013786 */  jal        func_8004DE18
/* 88600 80087A00 02002021 */   addu      $a0, $s0, $zero
/* 88604 80087A04 8FBF0028 */  lw         $ra, 0x28($sp)
/* 88608 80087A08 8FB30024 */  lw         $s3, 0x24($sp)
/* 8860C 80087A0C 8FB20020 */  lw         $s2, 0x20($sp)
/* 88610 80087A10 8FB1001C */  lw         $s1, 0x1c($sp)
/* 88614 80087A14 8FB00018 */  lw         $s0, 0x18($sp)
/* 88618 80087A18 03E00008 */  jr         $ra
/* 8861C 80087A1C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80087A20
/* 88620 80087A20 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 88624 80087A24 3C028008 */  lui        $v0, %hi(func_80086290)
/* 88628 80087A28 248502BC */  addiu      $a1, $a0, 0x2bc
/* 8862C 80087A2C 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 88630 80087A30 AFB00018 */  sw         $s0, 0x18($sp)
/* 88634 80087A34 3C10800E */  lui        $s0, %hi(gGlobals)
/* 88638 80087A38 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8863C 80087A3C AFBF0020 */  sw         $ra, 0x20($sp)
/* 88640 80087A40 AFB1001C */  sw         $s1, 0x1c($sp)
/* 88644 80087A44 8E02204C */  lw         $v0, 0x204c($s0)
/* 88648 80087A48 AFA00010 */  sw         $zero, 0x10($sp)
/* 8864C 80087A4C 8C470688 */  lw         $a3, 0x688($v0)
/* 88650 80087A50 0C0222AB */  jal        func_80088AAC
/* 88654 80087A54 24060002 */   addiu     $a2, $zero, 2
/* 88658 80087A58 3C058008 */  lui        $a1, %hi(func_80085E08)
/* 8865C 80087A5C 24A55E08 */  addiu      $a1, $a1, %lo(func_80085E08)
/* 88660 80087A60 8E03204C */  lw         $v1, 0x204c($s0)
/* 88664 80087A64 24060080 */  addiu      $a2, $zero, 0x80
/* 88668 80087A68 8C640690 */  lw         $a0, 0x690($v1)
/* 8866C 80087A6C 0C02227C */  jal        text_func
/* 88670 80087A70 00408821 */   addu      $s1, $v0, $zero
/* 88674 80087A74 02202021 */  addu       $a0, $s1, $zero
/* 88678 80087A78 0C013626 */  jal        func_8004D898
/* 8867C 80087A7C 00402821 */   addu      $a1, $v0, $zero
/* 88680 80087A80 3C058008 */  lui        $a1, %hi(func_80086054)
/* 88684 80087A84 8E02204C */  lw         $v0, 0x204c($s0)
/* 88688 80087A88 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 8868C 80087A8C 8C44067C */  lw         $a0, 0x67c($v0)
/* 88690 80087A90 0C02227C */  jal        text_func
/* 88694 80087A94 24060080 */   addiu     $a2, $zero, 0x80
/* 88698 80087A98 02202021 */  addu       $a0, $s1, $zero
/* 8869C 80087A9C 0C013626 */  jal        func_8004D898
/* 886A0 80087AA0 00402821 */   addu      $a1, $v0, $zero
/* 886A4 80087AA4 0C013786 */  jal        func_8004DE18
/* 886A8 80087AA8 02202021 */   addu      $a0, $s1, $zero
/* 886AC 80087AAC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 886B0 80087AB0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 886B4 80087AB4 8FB00018 */  lw         $s0, 0x18($sp)
/* 886B8 80087AB8 03E00008 */  jr         $ra
/* 886BC 80087ABC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80087AC0
/* 886C0 80087AC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 886C4 80087AC4 3C028008 */  lui        $v0, %hi(func_80086290)
/* 886C8 80087AC8 248502BC */  addiu      $a1, $a0, 0x2bc
/* 886CC 80087ACC 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 886D0 80087AD0 AFB00018 */  sw         $s0, 0x18($sp)
/* 886D4 80087AD4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 886D8 80087AD8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 886DC 80087ADC AFBF001C */  sw         $ra, 0x1c($sp)
/* 886E0 80087AE0 8E02204C */  lw         $v0, 0x204c($s0)
/* 886E4 80087AE4 AFA00010 */  sw         $zero, 0x10($sp)
/* 886E8 80087AE8 8C47068C */  lw         $a3, 0x68c($v0)
/* 886EC 80087AEC 0C0222AB */  jal        func_80088AAC
/* 886F0 80087AF0 24060001 */   addiu     $a2, $zero, 1
/* 886F4 80087AF4 3C058008 */  lui        $a1, %hi(func_80085D64)
/* 886F8 80087AF8 24A55D64 */  addiu      $a1, $a1, %lo(func_80085D64)
/* 886FC 80087AFC 8E03204C */  lw         $v1, 0x204c($s0)
/* 88700 80087B00 24060080 */  addiu      $a2, $zero, 0x80
/* 88704 80087B04 8C6402C0 */  lw         $a0, 0x2c0($v1)
/* 88708 80087B08 0C02227C */  jal        text_func
/* 8870C 80087B0C 00408021 */   addu      $s0, $v0, $zero
/* 88710 80087B10 02002021 */  addu       $a0, $s0, $zero
/* 88714 80087B14 0C013626 */  jal        func_8004D898
/* 88718 80087B18 00402821 */   addu      $a1, $v0, $zero
/* 8871C 80087B1C 0C013786 */  jal        func_8004DE18
/* 88720 80087B20 02002021 */   addu      $a0, $s0, $zero
/* 88724 80087B24 8FBF001C */  lw         $ra, 0x1c($sp)
/* 88728 80087B28 8FB00018 */  lw         $s0, 0x18($sp)
/* 8872C 80087B2C 03E00008 */  jr         $ra
/* 88730 80087B30 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80087B34
/* 88734 80087B34 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 88738 80087B38 AFB20058 */  sw         $s2, 0x58($sp)
/* 8873C 80087B3C 00809021 */  addu       $s2, $a0, $zero
/* 88740 80087B40 240400BC */  addiu      $a0, $zero, 0xbc
/* 88744 80087B44 AFB00050 */  sw         $s0, 0x50($sp)
/* 88748 80087B48 00A08021 */  addu       $s0, $a1, $zero
/* 8874C 80087B4C AFB10054 */  sw         $s1, 0x54($sp)
/* 88750 80087B50 AFBF005C */  sw         $ra, 0x5c($sp)
/* 88754 80087B54 0C026259 */  jal        passToMalloc
/* 88758 80087B58 30D100FF */   andi      $s1, $a2, 0xff
/* 8875C 80087B5C 00402021 */  addu       $a0, $v0, $zero
/* 88760 80087B60 02002821 */  addu       $a1, $s0, $zero
/* 88764 80087B64 27A60010 */  addiu      $a2, $sp, 0x10
/* 88768 80087B68 96420292 */  lhu        $v0, 0x292($s2)
/* 8876C 80087B6C 264702A5 */  addiu      $a3, $s2, 0x2a5
/* 88770 80087B70 A7A20010 */  sh         $v0, 0x10($sp)
/* 88774 80087B74 244200DB */  addiu      $v0, $v0, 0xdb
/* 88778 80087B78 96430294 */  lhu        $v1, 0x294($s2)
/* 8877C 80087B7C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 88780 80087B80 A4C20004 */  sh         $v0, 4($a2)
/* 88784 80087B84 A4C30002 */  sh         $v1, 2($a2)
/* 88788 80087B88 246300C0 */  addiu      $v1, $v1, 0xc0
/* 8878C 80087B8C 3063FFFF */  andi       $v1, $v1, 0xffff
/* 88790 80087B90 0C022A34 */  jal        func_8008A8D0
/* 88794 80087B94 A4C30006 */   sh        $v1, 6($a2)
/* 88798 80087B98 00408021 */  addu       $s0, $v0, $zero
/* 8879C 80087B9C 8E44027C */  lw         $a0, 0x27c($s2)
/* 887A0 80087BA0 0C00CAB4 */  jal        func_80032AD0
/* 887A4 80087BA4 02002821 */   addu      $a1, $s0, $zero
/* 887A8 80087BA8 02402021 */  addu       $a0, $s2, $zero
/* 887AC 80087BAC A611005E */  sh         $s1, 0x5e($s0)
/* 887B0 80087BB0 9245005B */  lbu        $a1, 0x5b($s2)
/* 887B4 80087BB4 0C02F216 */  jal        widget_fade
/* 887B8 80087BB8 00408821 */   addu      $s1, $v0, $zero
/* 887BC 80087BBC 8E430078 */  lw         $v1, 0x78($s2)
/* 887C0 80087BC0 02002821 */  addu       $a1, $s0, $zero
/* 887C4 80087BC4 846400E0 */  lh         $a0, 0xe0($v1)
/* 887C8 80087BC8 8C6200E4 */  lw         $v0, 0xe4($v1)
/* 887CC 80087BCC 0040F809 */  jalr       $v0
/* 887D0 80087BD0 02442021 */   addu      $a0, $s2, $a0
/* 887D4 80087BD4 10400005 */  beqz       $v0, .L80087BEC
/* 887D8 80087BD8 02001021 */   addu      $v0, $s0, $zero
/* 887DC 80087BDC 8E44027C */  lw         $a0, 0x27c($s2)
/* 887E0 80087BE0 0C00CC06 */  jal        func_80033018
/* 887E4 80087BE4 02202821 */   addu      $a1, $s1, $zero
/* 887E8 80087BE8 02001021 */  addu       $v0, $s0, $zero
.L80087BEC:
/* 887EC 80087BEC 8FBF005C */  lw         $ra, 0x5c($sp)
/* 887F0 80087BF0 8FB20058 */  lw         $s2, 0x58($sp)
/* 887F4 80087BF4 8FB10054 */  lw         $s1, 0x54($sp)
/* 887F8 80087BF8 8FB00050 */  lw         $s0, 0x50($sp)
/* 887FC 80087BFC 03E00008 */  jr         $ra
/* 88800 80087C00 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_80087C04
/* 88804 80087C04 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 88808 80087C08 AFB00010 */  sw         $s0, 0x10($sp)
/* 8880C 80087C0C 00808021 */  addu       $s0, $a0, $zero
/* 88810 80087C10 AFBF0014 */  sw         $ra, 0x14($sp)
/* 88814 80087C14 92020291 */  lbu        $v0, 0x291($s0)
/* 88818 80087C18 10400006 */  beqz       $v0, .L80087C34
/* 8881C 80087C1C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 88820 80087C20 0C00CADF */  jal        func_80032B7C
/* 88824 80087C24 8E04027C */   lw        $a0, 0x27c($s0)
/* 88828 80087C28 0C02F105 */  jal        func_800BC414
/* 8882C 80087C2C 8E040280 */   lw        $a0, 0x280($s0)
/* 88830 80087C30 8FBF0014 */  lw         $ra, 0x14($sp)
.L80087C34:
/* 88834 80087C34 8FB00010 */  lw         $s0, 0x10($sp)
/* 88838 80087C38 03E00008 */  jr         $ra
/* 8883C 80087C3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80087C40
/* 88840 80087C40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 88844 80087C44 AFB00010 */  sw         $s0, 0x10($sp)
/* 88848 80087C48 00808021 */  addu       $s0, $a0, $zero
/* 8884C 80087C4C AFBF0014 */  sw         $ra, 0x14($sp)
/* 88850 80087C50 8E0302A0 */  lw         $v1, 0x2a0($s0)
/* 88854 80087C54 10600009 */  beqz       $v1, .L80087C7C
/* 88858 80087C58 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8885C 80087C5C 8C620078 */  lw         $v0, 0x78($v1)
/* 88860 80087C60 84440008 */  lh         $a0, 8($v0)
/* 88864 80087C64 00642021 */  addu       $a0, $v1, $a0
/* 88868 80087C68 8C43000C */  lw         $v1, 0xc($v0)
/* 8886C 80087C6C 0060F809 */  jalr       $v1
/* 88870 80087C70 24050003 */   addiu     $a1, $zero, 3
/* 88874 80087C74 AE0002A0 */  sw         $zero, 0x2a0($s0)
/* 88878 80087C78 8FBF0014 */  lw         $ra, 0x14($sp)
.L80087C7C:
/* 8887C 80087C7C 8FB00010 */  lw         $s0, 0x10($sp)
/* 88880 80087C80 03E00008 */  jr         $ra
/* 88884 80087C84 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80087C88
/* 88888 80087C88 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 8888C 80087C8C AFB00038 */  sw         $s0, 0x38($sp)
/* 88890 80087C90 00808021 */  addu       $s0, $a0, $zero
/* 88894 80087C94 AFBF003C */  sw         $ra, 0x3c($sp)
/* 88898 80087C98 0C0290E2 */  jal        get_borg_8
/* 8889C 80087C9C 8E040298 */   lw        $a0, 0x298($s0)
/* 888A0 80087CA0 02002021 */  addu       $a0, $s0, $zero
/* 888A4 80087CA4 00402821 */  addu       $a1, $v0, $zero
/* 888A8 80087CA8 96060292 */  lhu        $a2, 0x292($s0)
/* 888AC 80087CAC 96070294 */  lhu        $a3, 0x294($s0)
/* 888B0 80087CB0 24C60041 */  addiu      $a2, $a2, 0x41
/* 888B4 80087CB4 0C02F3E9 */  jal        func_800BCFA4
/* 888B8 80087CB8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 888BC 80087CBC 240400A4 */  addiu      $a0, $zero, 0xa4
/* 888C0 80087CC0 0C026259 */  jal        passToMalloc
/* 888C4 80087CC4 AE02029C */   sw        $v0, 0x29c($s0)
/* 888C8 80087CC8 00402021 */  addu       $a0, $v0, $zero
/* 888CC 80087CCC 96070292 */  lhu        $a3, 0x292($s0)
/* 888D0 80087CD0 96020294 */  lhu        $v0, 0x294($s0)
/* 888D4 80087CD4 00E02821 */  addu       $a1, $a3, $zero
/* 888D8 80087CD8 00403021 */  addu       $a2, $v0, $zero
/* 888DC 80087CDC 24E700DB */  addiu      $a3, $a3, 0xdb
/* 888E0 80087CE0 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 888E4 80087CE4 244200C0 */  addiu      $v0, $v0, 0xc0
/* 888E8 80087CE8 3042FFFF */  andi       $v0, $v0, 0xffff
/* 888EC 80087CEC 0C00CA27 */  jal        func_8003289C
/* 888F0 80087CF0 AFA20010 */   sw        $v0, 0x10($sp)
/* 888F4 80087CF4 8E030078 */  lw         $v1, 0x78($s0)
/* 888F8 80087CF8 00402821 */  addu       $a1, $v0, $zero
/* 888FC 80087CFC AE02027C */  sw         $v0, 0x27c($s0)
/* 88900 80087D00 84640030 */  lh         $a0, 0x30($v1)
/* 88904 80087D04 8C620034 */  lw         $v0, 0x34($v1)
/* 88908 80087D08 0040F809 */  jalr       $v0
/* 8890C 80087D0C 02042021 */   addu      $a0, $s0, $a0
/* 88910 80087D10 02002021 */  addu       $a0, $s0, $zero
/* 88914 80087D14 24050004 */  addiu      $a1, $zero, 4
/* 88918 80087D18 24020140 */  addiu      $v0, $zero, 0x140
/* 8891C 80087D1C AFA00010 */  sw         $zero, 0x10($sp)
/* 88920 80087D20 AFA00014 */  sw         $zero, 0x14($sp)
/* 88924 80087D24 AFA20018 */  sw         $v0, 0x18($sp)
/* 88928 80087D28 96060292 */  lhu        $a2, 0x292($s0)
/* 8892C 80087D2C 240200F0 */  addiu      $v0, $zero, 0xf0
/* 88930 80087D30 AFA2001C */  sw         $v0, 0x1c($sp)
/* 88934 80087D34 AFA00030 */  sw         $zero, 0x30($sp)
/* 88938 80087D38 96070294 */  lhu        $a3, 0x294($s0)
/* 8893C 80087D3C 920202A5 */  lbu        $v0, 0x2a5($s0)
/* 88940 80087D40 920302A6 */  lbu        $v1, 0x2a6($s0)
/* 88944 80087D44 920802A7 */  lbu        $t0, 0x2a7($s0)
/* 88948 80087D48 920902A8 */  lbu        $t1, 0x2a8($s0)
/* 8894C 80087D4C 24C600AA */  addiu      $a2, $a2, 0xaa
/* 88950 80087D50 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 88954 80087D54 24E7009C */  addiu      $a3, $a3, 0x9c
/* 88958 80087D58 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8895C 80087D5C AFA20020 */  sw         $v0, 0x20($sp)
/* 88960 80087D60 AFA30024 */  sw         $v1, 0x24($sp)
/* 88964 80087D64 AFA80028 */  sw         $t0, 0x28($sp)
/* 88968 80087D68 0C02F435 */  jal        widgetscrollmenu_init_2
/* 8896C 80087D6C AFA9002C */   sw        $t1, 0x2c($sp)
/* 88970 80087D70 00402021 */  addu       $a0, $v0, $zero
/* 88974 80087D74 24050001 */  addiu      $a1, $zero, 1
/* 88978 80087D78 0C02E8D4 */  jal        func_800BA350
/* 8897C 80087D7C AE020280 */   sw        $v0, 0x280($s0)
/* 88980 80087D80 8E040280 */  lw         $a0, 0x280($s0)
/* 88984 80087D84 2402000F */  addiu      $v0, $zero, 0xf
/* 88988 80087D88 AFA20024 */  sw         $v0, 0x24($sp)
/* 8898C 80087D8C 920202AC */  lbu        $v0, 0x2ac($s0)
/* 88990 80087D90 920502A9 */  lbu        $a1, 0x2a9($s0)
/* 88994 80087D94 920602AA */  lbu        $a2, 0x2aa($s0)
/* 88998 80087D98 920702AB */  lbu        $a3, 0x2ab($s0)
/* 8899C 80087D9C 920302AD */  lbu        $v1, 0x2ad($s0)
/* 889A0 80087DA0 920802AE */  lbu        $t0, 0x2ae($s0)
/* 889A4 80087DA4 920902AF */  lbu        $t1, 0x2af($s0)
/* 889A8 80087DA8 920A02B0 */  lbu        $t2, 0x2b0($s0)
/* 889AC 80087DAC AFA20010 */  sw         $v0, 0x10($sp)
/* 889B0 80087DB0 AFA30014 */  sw         $v1, 0x14($sp)
/* 889B4 80087DB4 AFA80018 */  sw         $t0, 0x18($sp)
/* 889B8 80087DB8 AFA9001C */  sw         $t1, 0x1c($sp)
/* 889BC 80087DBC 0C02F085 */  jal        set_widgetSubstruct8
/* 889C0 80087DC0 AFAA0020 */   sw        $t2, 0x20($sp)
/* 889C4 80087DC4 8FBF003C */  lw         $ra, 0x3c($sp)
/* 889C8 80087DC8 24020001 */  addiu      $v0, $zero, 1
/* 889CC 80087DCC A2020291 */  sb         $v0, 0x291($s0)
/* 889D0 80087DD0 8FB00038 */  lw         $s0, 0x38($sp)
/* 889D4 80087DD4 03E00008 */  jr         $ra
/* 889D8 80087DD8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel read_controlPak_prompt
/* 889DC 80087DDC 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 889E0 80087DE0 AFB000A8 */  sw         $s0, 0xa8($sp)
/* 889E4 80087DE4 00808021 */  addu       $s0, $a0, $zero
/* 889E8 80087DE8 AFBF00AC */  sw         $ra, 0xac($sp)
/* 889EC 80087DEC 8E0202A0 */  lw         $v0, 0x2a0($s0)
/* 889F0 80087DF0 14400030 */  bnez       $v0, .L80087EB4
/* 889F4 80087DF4 8FBF00AC */   lw        $ra, 0xac($sp)
/* 889F8 80087DF8 0C026259 */  jal        passToMalloc
/* 889FC 80087DFC 240400B0 */   addiu     $a0, $zero, 0xb0
/* 88A00 80087E00 00402021 */  addu       $a0, $v0, $zero
/* 88A04 80087E04 24050001 */  addiu      $a1, $zero, 1
/* 88A08 80087E08 3C06800E */  lui        $a2, %hi(D_800E1074)
/* 88A0C 80087E0C 24C61074 */  addiu      $a2, $a2, %lo(D_800E1074)
/* 88A10 80087E10 240200E1 */  addiu      $v0, $zero, 0xe1
/* 88A14 80087E14 27A70028 */  addiu      $a3, $sp, 0x28
/* 88A18 80087E18 240300FF */  addiu      $v1, $zero, 0xff
/* 88A1C 80087E1C A3A20028 */  sb         $v0, 0x28($sp)
/* 88A20 80087E20 A0E20001 */  sb         $v0, 1($a3)
/* 88A24 80087E24 A0E20002 */  sb         $v0, 2($a3)
/* 88A28 80087E28 27A20068 */  addiu      $v0, $sp, 0x68
/* 88A2C 80087E2C A0E30003 */  sb         $v1, 3($a3)
/* 88A30 80087E30 24030001 */  addiu      $v1, $zero, 1
/* 88A34 80087E34 AFA70010 */  sw         $a3, 0x10($sp)
/* 88A38 80087E38 24070064 */  addiu      $a3, $zero, 0x64
/* 88A3C 80087E3C A3A00068 */  sb         $zero, 0x68($sp)
/* 88A40 80087E40 A3A00069 */  sb         $zero, 0x69($sp)
/* 88A44 80087E44 A3A0006A */  sb         $zero, 0x6a($sp)
/* 88A48 80087E48 A3A0006B */  sb         $zero, 0x6b($sp)
/* 88A4C 80087E4C AFA20014 */  sw         $v0, 0x14($sp)
/* 88A50 80087E50 AFA30018 */  sw         $v1, 0x18($sp)
/* 88A54 80087E54 AFA0001C */  sw         $zero, 0x1c($sp)
/* 88A58 80087E58 0C013461 */  jal        func_8004D184
/* 88A5C 80087E5C AFA00020 */   sw        $zero, 0x20($sp)
/* 88A60 80087E60 3C03800E */  lui        $v1, %hi(bigAssMenu)
/* 88A64 80087E64 8C647D74 */  lw         $a0, %lo(bigAssMenu)($v1)
/* 88A68 80087E68 10800005 */  beqz       $a0, .L80087E80
/* 88A6C 80087E6C AE0202A0 */   sw        $v0, 0x2a0($s0)
/* 88A70 80087E70 00402021 */  addu       $a0, $v0, $zero
/* 88A74 80087E74 24050019 */  addiu      $a1, $zero, 0x19
/* 88A78 80087E78 0C02F22A */  jal        widget_move
/* 88A7C 80087E7C 00003021 */   addu      $a2, $zero, $zero
.L80087E80:
/* 88A80 80087E80 0C026259 */  jal        passToMalloc
/* 88A84 80087E84 2404007C */   addiu     $a0, $zero, 0x7c
/* 88A88 80087E88 00402021 */  addu       $a0, $v0, $zero
/* 88A8C 80087E8C 3C05800E */  lui        $a1, %hi(D_800E1070)
/* 88A90 80087E90 24A51070 */  addiu      $a1, $a1, %lo(D_800E1070)
/* 88A94 80087E94 0C02E3A0 */  jal        widgettext_func_2
/* 88A98 80087E98 24060004 */   addiu     $a2, $zero, 4
/* 88A9C 80087E9C 8E0402A0 */  lw         $a0, 0x2a0($s0)
/* 88AA0 80087EA0 0C013626 */  jal        func_8004D898
/* 88AA4 80087EA4 00402821 */   addu      $a1, $v0, $zero
/* 88AA8 80087EA8 0C013786 */  jal        func_8004DE18
/* 88AAC 80087EAC 8E0402A0 */   lw        $a0, 0x2a0($s0)
/* 88AB0 80087EB0 8FBF00AC */  lw         $ra, 0xac($sp)
.L80087EB4:
/* 88AB4 80087EB4 8FB000A8 */  lw         $s0, 0xa8($sp)
/* 88AB8 80087EB8 03E00008 */  jr         $ra
/* 88ABC 80087EBC 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel func_80087EC0
/* 88AC0 80087EC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 88AC4 80087EC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 88AC8 80087EC8 00808821 */  addu       $s1, $a0, $zero
/* 88ACC 80087ECC 00002021 */  addu       $a0, $zero, $zero
/* 88AD0 80087ED0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 88AD4 80087ED4 0C0271BF */  jal        cont_delay
/* 88AD8 80087ED8 AFB00010 */   sw        $s0, 0x10($sp)
/* 88ADC 80087EDC 0C021F01 */  jal        func_80087C04
/* 88AE0 80087EE0 02202021 */   addu      $a0, $s1, $zero
/* 88AE4 80087EE4 08021FC6 */  j          .L80087F18
/* 88AE8 80087EE8 00000000 */   nop
.L80087EEC:
/* 88AEC 80087EEC 84640080 */  lh         $a0, 0x80($v1)
/* 88AF0 80087EF0 8C620084 */  lw         $v0, 0x84($v1)
/* 88AF4 80087EF4 0040F809 */  jalr       $v0
/* 88AF8 80087EF8 02042021 */   addu      $a0, $s0, $a0
/* 88AFC 80087EFC 12000006 */  beqz       $s0, .L80087F18
/* 88B00 80087F00 24050003 */   addiu     $a1, $zero, 3
/* 88B04 80087F04 8E020078 */  lw         $v0, 0x78($s0)
/* 88B08 80087F08 84440008 */  lh         $a0, 8($v0)
/* 88B0C 80087F0C 8C43000C */  lw         $v1, 0xc($v0)
/* 88B10 80087F10 0060F809 */  jalr       $v1
/* 88B14 80087F14 02042021 */   addu      $a0, $s0, $a0
.L80087F18:
/* 88B18 80087F18 0C02DCA5 */  jal        func_800B7294
/* 88B1C 80087F1C 262402BC */   addiu     $a0, $s1, 0x2bc
/* 88B20 80087F20 00408021 */  addu       $s0, $v0, $zero
/* 88B24 80087F24 5600FFF1 */  bnel       $s0, $zero, .L80087EEC
/* 88B28 80087F28 8E030078 */   lw        $v1, 0x78($s0)
/* 88B2C 80087F2C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 88B30 80087F30 8FB10014 */  lw         $s1, 0x14($sp)
/* 88B34 80087F34 8FB00010 */  lw         $s0, 0x10($sp)
/* 88B38 80087F38 03E00008 */  jr         $ra
/* 88B3C 80087F3C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel controllerpakdata_func_1
/* 88B40 80087F40 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 88B44 80087F44 AFB00028 */  sw         $s0, 0x28($sp)
/* 88B48 80087F48 00808021 */  addu       $s0, $a0, $zero
/* 88B4C 80087F4C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 88B50 80087F50 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 88B54 80087F54 8FA30040 */  lw         $v1, 0x40($sp)
/* 88B58 80087F58 8FA80044 */  lw         $t0, 0x44($sp)
/* 88B5C 80087F5C 8FA90048 */  lw         $t1, 0x48($sp)
/* 88B60 80087F60 8FAA004C */  lw         $t2, 0x4c($sp)
/* 88B64 80087F64 240200FF */  addiu      $v0, $zero, 0xff
/* 88B68 80087F68 AFBF002C */  sw         $ra, 0x2c($sp)
/* 88B6C 80087F6C AFA20014 */  sw         $v0, 0x14($sp)
/* 88B70 80087F70 AFA30010 */  sw         $v1, 0x10($sp)
/* 88B74 80087F74 AFA80018 */  sw         $t0, 0x18($sp)
/* 88B78 80087F78 AFA9001C */  sw         $t1, 0x1c($sp)
/* 88B7C 80087F7C 0C0218DE */  jal        func_80086378
/* 88B80 80087F80 AFAA0020 */   sw        $t2, 0x20($sp)
/* 88B84 80087F84 24041C00 */  addiu      $a0, $zero, 0x1c00
/* 88B88 80087F88 3C05800E */  lui        $a1, %hi(D_800E0FB0)
/* 88B8C 80087F8C 24A50FB0 */  addiu      $a1, $a1, %lo(D_800E0FB0)
/* 88B90 80087F90 24060600 */  addiu      $a2, $zero, 0x600
/* 88B94 80087F94 3C02800E */  lui        $v0, %hi(controllerpakdata_funcs)
/* 88B98 80087F98 24421208 */  addiu      $v0, $v0, %lo(controllerpakdata_funcs)
/* 88B9C 80087F9C 0C025F9C */  jal        Malloc
/* 88BA0 80087FA0 AE020078 */   sw        $v0, 0x78($s0)
/* 88BA4 80087FA4 00402021 */  addu       $a0, $v0, $zero
/* 88BA8 80087FA8 0C007827 */  jal        func_8001E09C
/* 88BAC 80087FAC AE0202C4 */   sw        $v0, 0x2c4($s0)
/* 88BB0 80087FB0 02001021 */  addu       $v0, $s0, $zero
/* 88BB4 80087FB4 8FBF002C */  lw         $ra, 0x2c($sp)
/* 88BB8 80087FB8 2403FFFF */  addiu      $v1, $zero, -1
/* 88BBC 80087FBC AE0302C8 */  sw         $v1, 0x2c8($s0)
/* 88BC0 80087FC0 8FB00028 */  lw         $s0, 0x28($sp)
/* 88BC4 80087FC4 03E00008 */  jr         $ra
/* 88BC8 80087FC8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel controllerpakdata_widget_free
/* 88BCC 80087FCC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 88BD0 80087FD0 AFB10014 */  sw         $s1, 0x14($sp)
/* 88BD4 80087FD4 00A08821 */  addu       $s1, $a1, $zero
/* 88BD8 80087FD8 3C05800E */  lui        $a1, %hi(D_800E0FB0)
/* 88BDC 80087FDC 24A50FB0 */  addiu      $a1, $a1, %lo(D_800E0FB0)
/* 88BE0 80087FE0 AFB00010 */  sw         $s0, 0x10($sp)
/* 88BE4 80087FE4 00808021 */  addu       $s0, $a0, $zero
/* 88BE8 80087FE8 3C02800E */  lui        $v0, %hi(controllerpakdata_funcs)
/* 88BEC 80087FEC 24421208 */  addiu      $v0, $v0, %lo(controllerpakdata_funcs)
/* 88BF0 80087FF0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 88BF4 80087FF4 8E0402C4 */  lw         $a0, 0x2c4($s0)
/* 88BF8 80087FF8 2406060C */  addiu      $a2, $zero, 0x60c
/* 88BFC 80087FFC 0C02600C */  jal        Free
/* 88C00 80088000 AE020078 */   sw        $v0, 0x78($s0)
/* 88C04 80088004 02002021 */  addu       $a0, $s0, $zero
/* 88C08 80088008 0C021941 */  jal        controllerPakdata_free
/* 88C0C 8008800C 02202821 */   addu      $a1, $s1, $zero
/* 88C10 80088010 8FBF0018 */  lw         $ra, 0x18($sp)
/* 88C14 80088014 8FB10014 */  lw         $s1, 0x14($sp)
/* 88C18 80088018 8FB00010 */  lw         $s0, 0x10($sp)
/* 88C1C 8008801C 03E00008 */  jr         $ra
/* 88C20 80088020 27BD0020 */   addiu     $sp, $sp, 0x20

glabel NOOP_80088024
/* 88C24 80088024 03E00008 */  jr         $ra
/* 88C28 80088028 00000000 */   nop

glabel new_save_widget
/* 88C2C 8008802C 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 88C30 80088030 AFB00098 */  sw         $s0, 0x98($sp)
/* 88C34 80088034 00808021 */  addu       $s0, $a0, $zero
/* 88C38 80088038 AFBF009C */  sw         $ra, 0x9c($sp)
/* 88C3C 8008803C 0C026259 */  jal        passToMalloc
/* 88C40 80088040 240400A0 */   addiu     $a0, $zero, 0xa0
/* 88C44 80088044 00402021 */  addu       $a0, $v0, $zero
/* 88C48 80088048 3C05800E */  lui        $a1, %hi(D_800E1090)
/* 88C4C 8008804C 24A51090 */  addiu      $a1, $a1, %lo(D_800E1090)
/* 88C50 80088050 2402001C */  addiu      $v0, $zero, 0x1c
/* 88C54 80088054 AFA00010 */  sw         $zero, 0x10($sp)
/* 88C58 80088058 96070292 */  lhu        $a3, 0x292($s0)
/* 88C5C 8008805C 27A60018 */  addiu      $a2, $sp, 0x18
/* 88C60 80088060 AFA20014 */  sw         $v0, 0x14($sp)
/* 88C64 80088064 24020067 */  addiu      $v0, $zero, 0x67
/* 88C68 80088068 A7A70018 */  sh         $a3, 0x18($sp)
/* 88C6C 8008806C 24E700C8 */  addiu      $a3, $a3, 0xc8
/* 88C70 80088070 96030294 */  lhu        $v1, 0x294($s0)
/* 88C74 80088074 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 88C78 80088078 A4C70004 */  sh         $a3, 4($a2)
/* 88C7C 8008807C 27A70058 */  addiu      $a3, $sp, 0x58
/* 88C80 80088080 A4C30002 */  sh         $v1, 2($a2)
/* 88C84 80088084 24630078 */  addiu      $v1, $v1, 0x78
/* 88C88 80088088 3063FFFF */  andi       $v1, $v1, 0xffff
/* 88C8C 8008808C A4C30006 */  sh         $v1, 6($a2)
/* 88C90 80088090 24030046 */  addiu      $v1, $zero, 0x46
/* 88C94 80088094 A3A20058 */  sb         $v0, 0x58($sp)
/* 88C98 80088098 2402003C */  addiu      $v0, $zero, 0x3c
/* 88C9C 8008809C A3A30059 */  sb         $v1, 0x59($sp)
/* 88CA0 800880A0 240300FF */  addiu      $v1, $zero, 0xff
/* 88CA4 800880A4 A3A2005A */  sb         $v0, 0x5a($sp)
/* 88CA8 800880A8 0C022CC0 */  jal        func_8008B300
/* 88CAC 800880AC A3A3005B */   sb        $v1, 0x5b($sp)
/* 88CB0 800880B0 00402821 */  addu       $a1, $v0, $zero
/* 88CB4 800880B4 24030002 */  addiu      $v1, $zero, 2
/* 88CB8 800880B8 A043005C */  sb         $v1, 0x5c($v0)
/* 88CBC 800880BC 3C038008 */  lui        $v1, %hi(func_80086144)
/* 88CC0 800880C0 8E04027C */  lw         $a0, 0x27c($s0)
/* 88CC4 800880C4 24636144 */  addiu      $v1, $v1, %lo(func_80086144)
/* 88CC8 800880C8 0C00CAB4 */  jal        func_80032AD0
/* 88CCC 800880CC AC430018 */   sw        $v1, 0x18($v0)
/* 88CD0 800880D0 9205005B */  lbu        $a1, 0x5b($s0)
/* 88CD4 800880D4 0C02F216 */  jal        widget_fade
/* 88CD8 800880D8 02002021 */   addu      $a0, $s0, $zero
/* 88CDC 800880DC 0C00CBC3 */  jal        func_80032F0C
/* 88CE0 800880E0 8E04027C */   lw        $a0, 0x27c($s0)
/* 88CE4 800880E4 8E020078 */  lw         $v0, 0x78($s0)
/* 88CE8 800880E8 844400F0 */  lh         $a0, 0xf0($v0)
/* 88CEC 800880EC 8C4300F4 */  lw         $v1, 0xf4($v0)
/* 88CF0 800880F0 0060F809 */  jalr       $v1
/* 88CF4 800880F4 02042021 */   addu      $a0, $s0, $a0
/* 88CF8 800880F8 8FBF009C */  lw         $ra, 0x9c($sp)
/* 88CFC 800880FC 8FB00098 */  lw         $s0, 0x98($sp)
/* 88D00 80088100 03E00008 */  jr         $ra
/* 88D04 80088104 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_80088108
/* 88D08 80088108 24020009 */  addiu      $v0, $zero, 9
/* 88D0C 8008810C A08502BA */  sb         $a1, 0x2ba($a0)
/* 88D10 80088110 03E00008 */  jr         $ra
/* 88D14 80088114 A082028C */   sb        $v0, 0x28c($a0)

glabel func_80088118
/* 88D18 80088118 24030003 */  addiu      $v1, $zero, 3
/* 88D1C 8008811C 3C028008 */  lui        $v0, %hi(func_80085F08)
/* 88D20 80088120 24425F08 */  addiu      $v0, $v0, %lo(func_80085F08)
/* 88D24 80088124 A0A3005C */  sb         $v1, 0x5c($a1)
/* 88D28 80088128 8C8302C8 */  lw         $v1, 0x2c8($a0)
/* 88D2C 8008812C 2406FFFF */  addiu      $a2, $zero, -1
/* 88D30 80088130 14660003 */  bne        $v1, $a2, .L80088140
/* 88D34 80088134 ACA20018 */   sw        $v0, 0x18($a1)
/* 88D38 80088138 03E00008 */  jr         $ra
/* 88D3C 8008813C 00001021 */   addu      $v0, $zero, $zero
.L80088140:
/* 88D40 80088140 94A2005E */  lhu        $v0, 0x5e($a1)
/* 88D44 80088144 14430003 */  bne        $v0, $v1, .L80088154
/* 88D48 80088148 24020001 */   addiu     $v0, $zero, 1
/* 88D4C 8008814C 03E00008 */  jr         $ra
/* 88D50 80088150 AC8602C8 */   sw        $a2, 0x2c8($a0)
.L80088154:
/* 88D54 80088154 03E00008 */  jr         $ra
/* 88D58 80088158 00001021 */   addu      $v0, $zero, $zero

glabel save_game_to_mempack
/* 88D5C 8008815C 27BDFEF0 */  addiu      $sp, $sp, -0x110
/* 88D60 80088160 AFB400F8 */  sw         $s4, 0xf8($sp)
/* 88D64 80088164 0000A021 */  addu       $s4, $zero, $zero
/* 88D68 80088168 AFB300F4 */  sw         $s3, 0xf4($sp)
/* 88D6C 8008816C 00009821 */  addu       $s3, $zero, $zero
/* 88D70 80088170 AFB500FC */  sw         $s5, 0xfc($sp)
/* 88D74 80088174 0080A821 */  addu       $s5, $a0, $zero
/* 88D78 80088178 AFB000E8 */  sw         $s0, 0xe8($sp)
/* 88D7C 8008817C 27B000E0 */  addiu      $s0, $sp, 0xe0
/* 88D80 80088180 02002021 */  addu       $a0, $s0, $zero
/* 88D84 80088184 00002821 */  addu       $a1, $zero, $zero
/* 88D88 80088188 AFBF0108 */  sw         $ra, 0x108($sp)
/* 88D8C 8008818C AFB70104 */  sw         $s7, 0x104($sp)
/* 88D90 80088190 AFB60100 */  sw         $s6, 0x100($sp)
/* 88D94 80088194 AFB200F0 */  sw         $s2, 0xf0($sp)
/* 88D98 80088198 AFB100EC */  sw         $s1, 0xec($sp)
/* 88D9C 8008819C A3A000E1 */  sb         $zero, 0xe1($sp)
/* 88DA0 800881A0 0C026F1B */  jal        get_contpak_freespace
/* 88DA4 800881A4 A3A000E0 */   sb        $zero, 0xe0($sp)
/* 88DA8 800881A8 A2A2028D */  sb         $v0, 0x28d($s5)
/* 88DAC 800881AC 304200FF */  andi       $v0, $v0, 0xff
/* 88DB0 800881B0 24030006 */  addiu      $v1, $zero, 6
/* 88DB4 800881B4 54430006 */  bnel       $v0, $v1, .L800881D0
/* 88DB8 800881B8 92A2028D */   lbu       $v0, 0x28d($s5)
/* 88DBC 800881BC 02002021 */  addu       $a0, $s0, $zero
/* 88DC0 800881C0 0C026F1B */  jal        get_contpak_freespace
/* 88DC4 800881C4 00002821 */   addu      $a1, $zero, $zero
/* 88DC8 800881C8 A2A2028D */  sb         $v0, 0x28d($s5)
/* 88DCC 800881CC 92A2028D */  lbu        $v0, 0x28d($s5)
.L800881D0:
/* 88DD0 800881D0 14400059 */  bnez       $v0, .L80088338
/* 88DD4 800881D4 24020001 */   addiu     $v0, $zero, 1
/* 88DD8 800881D8 00008821 */  addu       $s1, $zero, $zero
/* 88DDC 800881DC 24170006 */  addiu      $s7, $zero, 6
/* 88DE0 800881E0 24163738 */  addiu      $s6, $zero, 0x3738
/* 88DE4 800881E4 3C124E41 */  lui        $s2, 0x4e41
/* 88DE8 800881E8 36525945 */  ori        $s2, $s2, 0x5945
/* 88DEC 800881EC 27B00060 */  addiu      $s0, $sp, 0x60
/* 88DF0 800881F0 27A40020 */  addiu      $a0, $sp, 0x20
.L800881F4:
/* 88DF4 800881F4 02202821 */  addu       $a1, $s1, $zero
/* 88DF8 800881F8 0C026FC9 */  jal        get_file_state
/* 88DFC 800881FC 00003021 */   addu      $a2, $zero, $zero
/* 88E00 80088200 14570004 */  bne        $v0, $s7, .L80088214
/* 88E04 80088204 27A40020 */   addiu     $a0, $sp, 0x20
/* 88E08 80088208 02202821 */  addu       $a1, $s1, $zero
/* 88E0C 8008820C 0C026FC9 */  jal        get_file_state
/* 88E10 80088210 00003021 */   addu      $a2, $zero, $zero
.L80088214:
/* 88E14 80088214 1440000D */  bnez       $v0, .L8008824C
/* 88E18 80088218 26220001 */   addiu     $v0, $s1, 1
/* 88E1C 8008821C 97A20022 */  lhu        $v0, 0x22($sp)
/* 88E20 80088220 14560009 */  bne        $v0, $s6, .L80088248
/* 88E24 80088224 26730001 */   addiu     $s3, $s3, 1
/* 88E28 80088228 8FA20024 */  lw         $v0, 0x24($sp)
/* 88E2C 8008822C 14520007 */  bne        $v0, $s2, .L8008824C
/* 88E30 80088230 26220001 */   addiu     $v0, $s1, 1
/* 88E34 80088234 02002021 */  addu       $a0, $s0, $zero
/* 88E38 80088238 0C02626C */  jal        copy_string
/* 88E3C 8008823C 27A50039 */   addiu     $a1, $sp, 0x39
/* 88E40 80088240 26100004 */  addiu      $s0, $s0, 4
/* 88E44 80088244 26940001 */  addiu      $s4, $s4, 1
.L80088248:
/* 88E48 80088248 26220001 */  addiu      $v0, $s1, 1
.L8008824C:
/* 88E4C 8008824C 305100FF */  andi       $s1, $v0, 0xff
/* 88E50 80088250 2E230010 */  sltiu      $v1, $s1, 0x10
/* 88E54 80088254 1460FFE7 */  bnez       $v1, .L800881F4
/* 88E58 80088258 27A40020 */   addiu     $a0, $sp, 0x20
/* 88E5C 8008825C 24020010 */  addiu      $v0, $zero, 0x10
/* 88E60 80088260 16620005 */  bne        $s3, $v0, .L80088278
/* 88E64 80088264 93A200E0 */   lbu       $v0, 0xe0($sp)
/* 88E68 80088268 0C022159 */  jal        full_controller_warning
/* 88E6C 8008826C 02A02021 */   addu      $a0, $s5, $zero
/* 88E70 80088270 080220D5 */  j          .L80088354
/* 88E74 80088274 8FBF0108 */   lw        $ra, 0x108($sp)
.L80088278:
/* 88E78 80088278 2C42001C */  sltiu      $v0, $v0, 0x1c
/* 88E7C 8008827C 10400005 */  beqz       $v0, .L80088294
/* 88E80 80088280 00008821 */   addu      $s1, $zero, $zero
/* 88E84 80088284 0C02218A */  jal        not_enough_space_warning
/* 88E88 80088288 02A02021 */   addu      $a0, $s5, $zero
/* 88E8C 8008828C 080220D5 */  j          .L80088354
/* 88E90 80088290 8FBF0108 */   lw        $ra, 0x108($sp)
.L80088294:
/* 88E94 80088294 27B200A0 */  addiu      $s2, $sp, 0xa0
/* 88E98 80088298 3C17800E */  lui        $s7, %hi(D_800E10A0)
/* 88E9C 8008829C 27B600E1 */  addiu      $s6, $sp, 0xe1
/* 88EA0 800882A0 27B30060 */  addiu      $s3, $sp, 0x60
/* 88EA4 800882A4 02402021 */  addu       $a0, $s2, $zero
.L800882A8:
/* 88EA8 800882A8 26E510A0 */  addiu      $a1, $s7, %lo(D_800E10A0)
/* 88EAC 800882AC 0C0333AC */  jal        sprintf
/* 88EB0 800882B0 26260041 */   addiu     $a2, $s1, 0x41
/* 88EB4 800882B4 080220B0 */  j          .L800882C0
/* 88EB8 800882B8 00008021 */   addu      $s0, $zero, $zero
.L800882BC:
/* 88EBC 800882BC 305000FF */  andi       $s0, $v0, 0xff
.L800882C0:
/* 88EC0 800882C0 0214102B */  sltu       $v0, $s0, $s4
/* 88EC4 800882C4 10400006 */  beqz       $v0, .L800882E0
/* 88EC8 800882C8 00102080 */   sll       $a0, $s0, 2
/* 88ECC 800882CC 02642021 */  addu       $a0, $s3, $a0
/* 88ED0 800882D0 0C0262BE */  jal        func_80098AF8
/* 88ED4 800882D4 02402821 */   addu      $a1, $s2, $zero
/* 88ED8 800882D8 1440FFF8 */  bnez       $v0, .L800882BC
/* 88EDC 800882DC 26020001 */   addiu     $v0, $s0, 1
.L800882E0:
/* 88EE0 800882E0 12140005 */  beq        $s0, $s4, .L800882F8
/* 88EE4 800882E4 26220001 */   addiu     $v0, $s1, 1
/* 88EE8 800882E8 305100FF */  andi       $s1, $v0, 0xff
/* 88EEC 800882EC 2E230010 */  sltiu      $v1, $s1, 0x10
/* 88EF0 800882F0 1460FFED */  bnez       $v1, .L800882A8
/* 88EF4 800882F4 02402021 */   addu      $a0, $s2, $zero
.L800882F8:
/* 88EF8 800882F8 3C034E41 */  lui        $v1, 0x4e41
/* 88EFC 800882FC 34635945 */  ori        $v1, $v1, 0x5945
/* 88F00 80088300 02C02021 */  addu       $a0, $s6, $zero
/* 88F04 80088304 3C05800E */  lui        $a1, %hi(D_800E10A4)
/* 88F08 80088308 24A510A4 */  addiu      $a1, $a1, %lo(D_800E10A4)
/* 88F0C 8008830C 02403021 */  addu       $a2, $s2, $zero
/* 88F10 80088310 24021C00 */  addiu      $v0, $zero, 0x1c00
/* 88F14 80088314 24073738 */  addiu      $a3, $zero, 0x3738
/* 88F18 80088318 AFA30010 */  sw         $v1, 0x10($sp)
/* 88F1C 8008831C AFA20014 */  sw         $v0, 0x14($sp)
/* 88F20 80088320 0C026F43 */  jal        create_new_save_file
/* 88F24 80088324 AFA00018 */   sw        $zero, 0x18($sp)
/* 88F28 80088328 A2A2028D */  sb         $v0, 0x28d($s5)
/* 88F2C 8008832C 304200FF */  andi       $v0, $v0, 0xff
/* 88F30 80088330 10400003 */  beqz       $v0, .L80088340
/* 88F34 80088334 24020001 */   addiu     $v0, $zero, 1
.L80088338:
/* 88F38 80088338 080220D4 */  j          .L80088350
/* 88F3C 8008833C A2A2028C */   sb        $v0, 0x28c($s5)
.L80088340:
/* 88F40 80088340 93A300E1 */  lbu        $v1, 0xe1($sp)
/* 88F44 80088344 24020009 */  addiu      $v0, $zero, 9
/* 88F48 80088348 A2A2028C */  sb         $v0, 0x28c($s5)
/* 88F4C 8008834C A2A302BA */  sb         $v1, 0x2ba($s5)
.L80088350:
/* 88F50 80088350 8FBF0108 */  lw         $ra, 0x108($sp)
.L80088354:
/* 88F54 80088354 8FB70104 */  lw         $s7, 0x104($sp)
/* 88F58 80088358 8FB60100 */  lw         $s6, 0x100($sp)
/* 88F5C 8008835C 8FB500FC */  lw         $s5, 0xfc($sp)
/* 88F60 80088360 8FB400F8 */  lw         $s4, 0xf8($sp)
/* 88F64 80088364 8FB300F4 */  lw         $s3, 0xf4($sp)
/* 88F68 80088368 8FB200F0 */  lw         $s2, 0xf0($sp)
/* 88F6C 8008836C 8FB100EC */  lw         $s1, 0xec($sp)
/* 88F70 80088370 8FB000E8 */  lw         $s0, 0xe8($sp)
/* 88F74 80088374 03E00008 */  jr         $ra
/* 88F78 80088378 27BD0110 */   addiu     $sp, $sp, 0x110

glabel func_8008837C
/* 88F7C 8008837C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 88F80 80088380 AFB20018 */  sw         $s2, 0x18($sp)
/* 88F84 80088384 00809021 */  addu       $s2, $a0, $zero
/* 88F88 80088388 AFBF0020 */  sw         $ra, 0x20($sp)
/* 88F8C 8008838C AFB3001C */  sw         $s3, 0x1c($sp)
/* 88F90 80088390 AFB10014 */  sw         $s1, 0x14($sp)
/* 88F94 80088394 AFB00010 */  sw         $s0, 0x10($sp)
/* 88F98 80088398 8E44027C */  lw         $a0, 0x27c($s2)
/* 88F9C 8008839C 0C00CBBE */  jal        func_80032EF8
/* 88FA0 800883A0 3C13800E */   lui       $s3, 0x800e
/* 88FA4 800883A4 00408021 */  addu       $s0, $v0, $zero
/* 88FA8 800883A8 8E440280 */  lw         $a0, 0x280($s2)
/* 88FAC 800883AC 0C02F105 */  jal        func_800BC414
/* 88FB0 800883B0 9211005C */   lbu       $s1, 0x5c($s0)
/* 88FB4 800883B4 32220002 */  andi       $v0, $s1, 2
/* 88FB8 800883B8 1040000B */  beqz       $v0, .L800883E8
/* 88FBC 800883BC 00002021 */   addu      $a0, $zero, $zero
/* 88FC0 800883C0 3C078008 */  lui        $a3, %hi(func_80086118)
/* 88FC4 800883C4 24E76118 */  addiu      $a3, $a3, %lo(func_80086118)
/* 88FC8 800883C8 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 88FCC 800883CC 8C43204C */  lw         $v1, 0x204c($v0)
/* 88FD0 800883D0 9605005E */  lhu        $a1, 0x5e($s0)
/* 88FD4 800883D4 0C0218BD */  jal        func_800862F4
/* 88FD8 800883D8 8C6606A0 */   lw        $a2, 0x6a0($v1)
/* 88FDC 800883DC 8E440280 */  lw         $a0, 0x280($s2)
/* 88FE0 800883E0 0C02E885 */  jal        link_widget_text
/* 88FE4 800883E4 00402821 */   addu      $a1, $v0, $zero
.L800883E8:
/* 88FE8 800883E8 32220001 */  andi       $v0, $s1, 1
/* 88FEC 800883EC 1040000B */  beqz       $v0, .L8008841C
/* 88FF0 800883F0 00002021 */   addu      $a0, $zero, $zero
/* 88FF4 800883F4 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 88FF8 800883F8 3C078008 */  lui        $a3, %hi(func_80085E44)
/* 88FFC 800883FC 8C43204C */  lw         $v1, 0x204c($v0)
/* 89000 80088400 9605005E */  lhu        $a1, 0x5e($s0)
/* 89004 80088404 8C6606A4 */  lw         $a2, 0x6a4($v1)
/* 89008 80088408 0C0218BD */  jal        func_800862F4
/* 8900C 8008840C 24E75E44 */   addiu     $a3, $a3, %lo(func_80085E44)
/* 89010 80088410 8E440280 */  lw         $a0, 0x280($s2)
/* 89014 80088414 0C02E885 */  jal        link_widget_text
/* 89018 80088418 00402821 */   addu      $a1, $v0, $zero
.L8008841C:
/* 8901C 8008841C 00002021 */  addu       $a0, $zero, $zero
/* 89020 80088420 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 89024 80088424 00002821 */  addu       $a1, $zero, $zero
/* 89028 80088428 8C43204C */  lw         $v1, 0x204c($v0)
/* 8902C 8008842C 3C078008 */  lui        $a3, %hi(func_80086054)
/* 89030 80088430 8C6606A8 */  lw         $a2, 0x6a8($v1)
/* 89034 80088434 0C0218BD */  jal        func_800862F4
/* 89038 80088438 24E76054 */   addiu     $a3, $a3, %lo(func_80086054)
/* 8903C 8008843C 8E440280 */  lw         $a0, 0x280($s2)
/* 89040 80088440 0C02E885 */  jal        link_widget_text
/* 89044 80088444 00402821 */   addu      $a1, $v0, $zero
/* 89048 80088448 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8904C 8008844C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 89050 80088450 8FB20018 */  lw         $s2, 0x18($sp)
/* 89054 80088454 8FB10014 */  lw         $s1, 0x14($sp)
/* 89058 80088458 8FB00010 */  lw         $s0, 0x10($sp)
/* 8905C 8008845C 03E00008 */  jr         $ra
/* 89060 80088460 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80088464
/* 89064 80088464 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 89068 80088468 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8906C 8008846C 30B100FF */  andi       $s1, $a1, 0xff
/* 89070 80088470 02202821 */  addu       $a1, $s1, $zero
/* 89074 80088474 00003021 */  addu       $a2, $zero, $zero
/* 89078 80088478 AFB00018 */  sw         $s0, 0x18($sp)
/* 8907C 8008847C 00808021 */  addu       $s0, $a0, $zero
/* 89080 80088480 AFBF0020 */  sw         $ra, 0x20($sp)
/* 89084 80088484 8E0402C4 */  lw         $a0, 0x2c4($s0)
/* 89088 80088488 24071C00 */  addiu      $a3, $zero, 0x1c00
/* 8908C 8008848C 0C027005 */  jal        func_8009C014
/* 89090 80088490 AFA00010 */   sw        $zero, 0x10($sp)
/* 89094 80088494 A202028D */  sb         $v0, 0x28d($s0)
/* 89098 80088498 304200FF */  andi       $v0, $v0, 0xff
/* 8909C 8008849C 24030006 */  addiu      $v1, $zero, 6
/* 890A0 800884A0 54430009 */  bnel       $v0, $v1, .L800884C8
/* 890A4 800884A4 9202028D */   lbu       $v0, 0x28d($s0)
/* 890A8 800884A8 02202821 */  addu       $a1, $s1, $zero
/* 890AC 800884AC 00003021 */  addu       $a2, $zero, $zero
/* 890B0 800884B0 8E0402C4 */  lw         $a0, 0x2c4($s0)
/* 890B4 800884B4 24071C00 */  addiu      $a3, $zero, 0x1c00
/* 890B8 800884B8 0C027005 */  jal        func_8009C014
/* 890BC 800884BC AFA00010 */   sw        $zero, 0x10($sp)
/* 890C0 800884C0 A202028D */  sb         $v0, 0x28d($s0)
/* 890C4 800884C4 9202028D */  lbu        $v0, 0x28d($s0)
.L800884C8:
/* 890C8 800884C8 10400003 */  beqz       $v0, .L800884D8
/* 890CC 800884CC 24020001 */   addiu     $v0, $zero, 1
/* 890D0 800884D0 08022137 */  j          .L800884DC
/* 890D4 800884D4 A202028C */   sb        $v0, 0x28c($s0)
.L800884D8:
/* 890D8 800884D8 AE1102C8 */  sw         $s1, 0x2c8($s0)
.L800884DC:
/* 890DC 800884DC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 890E0 800884E0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 890E4 800884E4 8FB00018 */  lw         $s0, 0x18($sp)
/* 890E8 800884E8 03E00008 */  jr         $ra
/* 890EC 800884EC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800884F0
/* 890F0 800884F0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 890F4 800884F4 3C028008 */  lui        $v0, %hi(func_80086290)
/* 890F8 800884F8 248502BC */  addiu      $a1, $a0, 0x2bc
/* 890FC 800884FC 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 89100 80088500 AFB00018 */  sw         $s0, 0x18($sp)
/* 89104 80088504 3C10800E */  lui        $s0, %hi(gGlobals)
/* 89108 80088508 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8910C 8008850C AFBF001C */  sw         $ra, 0x1c($sp)
/* 89110 80088510 8E02204C */  lw         $v0, 0x204c($s0)
/* 89114 80088514 AFA00010 */  sw         $zero, 0x10($sp)
/* 89118 80088518 8C470698 */  lw         $a3, 0x698($v0)
/* 8911C 8008851C 0C0222AB */  jal        func_80088AAC
/* 89120 80088520 24060001 */   addiu     $a2, $zero, 1
/* 89124 80088524 3C058008 */  lui        $a1, %hi(func_80086080)
/* 89128 80088528 24A56080 */  addiu      $a1, $a1, %lo(func_80086080)
/* 8912C 8008852C 8E03204C */  lw         $v1, 0x204c($s0)
/* 89130 80088530 24060080 */  addiu      $a2, $zero, 0x80
/* 89134 80088534 8C6402C0 */  lw         $a0, 0x2c0($v1)
/* 89138 80088538 0C02227C */  jal        text_func
/* 8913C 8008853C 00408021 */   addu      $s0, $v0, $zero
/* 89140 80088540 02002021 */  addu       $a0, $s0, $zero
/* 89144 80088544 0C013626 */  jal        func_8004D898
/* 89148 80088548 00402821 */   addu      $a1, $v0, $zero
/* 8914C 8008854C 0C013786 */  jal        func_8004DE18
/* 89150 80088550 02002021 */   addu      $a0, $s0, $zero
/* 89154 80088554 8FBF001C */  lw         $ra, 0x1c($sp)
/* 89158 80088558 8FB00018 */  lw         $s0, 0x18($sp)
/* 8915C 8008855C 03E00008 */  jr         $ra
/* 89160 80088560 27BD0020 */   addiu     $sp, $sp, 0x20

glabel full_controller_warning
/* 89164 80088564 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 89168 80088568 3C028008 */  lui        $v0, %hi(func_80086290)
/* 8916C 8008856C 248502BC */  addiu      $a1, $a0, 0x2bc
/* 89170 80088570 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 89174 80088574 AFB00018 */  sw         $s0, 0x18($sp)
/* 89178 80088578 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8917C 8008857C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 89180 80088580 AFBF0020 */  sw         $ra, 0x20($sp)
/* 89184 80088584 AFB1001C */  sw         $s1, 0x1c($sp)
/* 89188 80088588 8E02204C */  lw         $v0, 0x204c($s0)
/* 8918C 8008858C AFA00010 */  sw         $zero, 0x10($sp)
/* 89190 80088590 8C4702DC */  lw         $a3, 0x2dc($v0)
/* 89194 80088594 0C0222AB */  jal        func_80088AAC
/* 89198 80088598 24060003 */   addiu     $a2, $zero, 3
/* 8919C 8008859C 3C058008 */  lui        $a1, %hi(func_80086180)
/* 891A0 800885A0 24A56180 */  addiu      $a1, $a1, %lo(func_80086180)
/* 891A4 800885A4 8E03204C */  lw         $v1, 0x204c($s0)
/* 891A8 800885A8 24060080 */  addiu      $a2, $zero, 0x80
/* 891AC 800885AC 8C6402D8 */  lw         $a0, 0x2d8($v1)
/* 891B0 800885B0 0C02227C */  jal        text_func
/* 891B4 800885B4 00408821 */   addu      $s1, $v0, $zero
/* 891B8 800885B8 02202021 */  addu       $a0, $s1, $zero
/* 891BC 800885BC 0C013626 */  jal        func_8004D898
/* 891C0 800885C0 00402821 */   addu      $a1, $v0, $zero
/* 891C4 800885C4 3C058008 */  lui        $a1, %hi(func_80085DA0)
/* 891C8 800885C8 8E02204C */  lw         $v0, 0x204c($s0)
/* 891CC 800885CC 24A55DA0 */  addiu      $a1, $a1, %lo(func_80085DA0)
/* 891D0 800885D0 8C4402E4 */  lw         $a0, 0x2e4($v0)
/* 891D4 800885D4 0C02227C */  jal        text_func
/* 891D8 800885D8 24060080 */   addiu     $a2, $zero, 0x80
/* 891DC 800885DC 02202021 */  addu       $a0, $s1, $zero
/* 891E0 800885E0 0C013626 */  jal        func_8004D898
/* 891E4 800885E4 00402821 */   addu      $a1, $v0, $zero
/* 891E8 800885E8 3C058008 */  lui        $a1, %hi(func_80086054)
/* 891EC 800885EC 8E02204C */  lw         $v0, 0x204c($s0)
/* 891F0 800885F0 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 891F4 800885F4 8C4402E8 */  lw         $a0, 0x2e8($v0)
/* 891F8 800885F8 0C02227C */  jal        text_func
/* 891FC 800885FC 24060080 */   addiu     $a2, $zero, 0x80
/* 89200 80088600 02202021 */  addu       $a0, $s1, $zero
/* 89204 80088604 0C013626 */  jal        func_8004D898
/* 89208 80088608 00402821 */   addu      $a1, $v0, $zero
/* 8920C 8008860C 0C013786 */  jal        func_8004DE18
/* 89210 80088610 02202021 */   addu      $a0, $s1, $zero
/* 89214 80088614 8FBF0020 */  lw         $ra, 0x20($sp)
/* 89218 80088618 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8921C 8008861C 8FB00018 */  lw         $s0, 0x18($sp)
/* 89220 80088620 03E00008 */  jr         $ra
/* 89224 80088624 27BD0028 */   addiu     $sp, $sp, 0x28

glabel not_enough_space_warning
/* 89228 80088628 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8922C 8008862C 3C028008 */  lui        $v0, %hi(func_80086290)
/* 89230 80088630 248502BC */  addiu      $a1, $a0, 0x2bc
/* 89234 80088634 24446290 */  addiu      $a0, $v0, %lo(func_80086290)
/* 89238 80088638 AFB00018 */  sw         $s0, 0x18($sp)
/* 8923C 8008863C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 89240 80088640 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 89244 80088644 AFBF0020 */  sw         $ra, 0x20($sp)
/* 89248 80088648 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8924C 8008864C 8E02204C */  lw         $v0, 0x204c($s0)
/* 89250 80088650 AFA00010 */  sw         $zero, 0x10($sp)
/* 89254 80088654 8C470620 */  lw         $a3, 0x620($v0)
/* 89258 80088658 0C0222AB */  jal        func_80088AAC
/* 8925C 8008865C 24060003 */   addiu     $a2, $zero, 3
/* 89260 80088660 3C058008 */  lui        $a1, %hi(repeated_space_warning)
/* 89264 80088664 24A56208 */  addiu      $a1, $a1, %lo(repeated_space_warning)
/* 89268 80088668 8E03204C */  lw         $v1, 0x204c($s0)
/* 8926C 8008866C 24060080 */  addiu      $a2, $zero, 0x80
/* 89270 80088670 8C6402D8 */  lw         $a0, 0x2d8($v1)
/* 89274 80088674 0C02227C */  jal        text_func
/* 89278 80088678 00408821 */   addu      $s1, $v0, $zero
/* 8927C 8008867C 02202021 */  addu       $a0, $s1, $zero
/* 89280 80088680 0C013626 */  jal        func_8004D898
/* 89284 80088684 00402821 */   addu      $a1, $v0, $zero
/* 89288 80088688 3C058008 */  lui        $a1, %hi(func_80085DA0)
/* 8928C 8008868C 8E02204C */  lw         $v0, 0x204c($s0)
/* 89290 80088690 24A55DA0 */  addiu      $a1, $a1, %lo(func_80085DA0)
/* 89294 80088694 8C4402E4 */  lw         $a0, 0x2e4($v0)
/* 89298 80088698 0C02227C */  jal        text_func
/* 8929C 8008869C 24060080 */   addiu     $a2, $zero, 0x80
/* 892A0 800886A0 02202021 */  addu       $a0, $s1, $zero
/* 892A4 800886A4 0C013626 */  jal        func_8004D898
/* 892A8 800886A8 00402821 */   addu      $a1, $v0, $zero
/* 892AC 800886AC 3C058008 */  lui        $a1, %hi(func_80086054)
/* 892B0 800886B0 8E02204C */  lw         $v0, 0x204c($s0)
/* 892B4 800886B4 24A56054 */  addiu      $a1, $a1, %lo(func_80086054)
/* 892B8 800886B8 8C4402E8 */  lw         $a0, 0x2e8($v0)
/* 892BC 800886BC 0C02227C */  jal        text_func
/* 892C0 800886C0 24060080 */   addiu     $a2, $zero, 0x80
/* 892C4 800886C4 02202021 */  addu       $a0, $s1, $zero
/* 892C8 800886C8 0C013626 */  jal        func_8004D898
/* 892CC 800886CC 00402821 */   addu      $a1, $v0, $zero
/* 892D0 800886D0 0C013786 */  jal        func_8004DE18
/* 892D4 800886D4 02202021 */   addu      $a0, $s1, $zero
/* 892D8 800886D8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 892DC 800886DC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 892E0 800886E0 8FB00018 */  lw         $s0, 0x18($sp)
/* 892E4 800886E4 03E00008 */  jr         $ra
/* 892E8 800886E8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800886EC
/* 892EC 800886EC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 892F0 800886F0 2402FFFF */  addiu      $v0, $zero, -1
/* 892F4 800886F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 892F8 800886F8 0C021D9F */  jal        func_8008767C
/* 892FC 800886FC AC8202C8 */   sw        $v0, 0x2c8($a0)
/* 89300 80088700 8FBF0010 */  lw         $ra, 0x10($sp)
/* 89304 80088704 03E00008 */  jr         $ra
/* 89308 80088708 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008870C
/* 8930C 8008870C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 89310 80088710 240200F1 */  addiu      $v0, $zero, 0xf1
/* 89314 80088714 AFB00028 */  sw         $s0, 0x28($sp)
/* 89318 80088718 00808021 */  addu       $s0, $a0, $zero
/* 8931C 8008871C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 89320 80088720 8FA30040 */  lw         $v1, 0x40($sp)
/* 89324 80088724 8FA80044 */  lw         $t0, 0x44($sp)
/* 89328 80088728 8FA90048 */  lw         $t1, 0x48($sp)
/* 8932C 8008872C 8FAA004C */  lw         $t2, 0x4c($sp)
/* 89330 80088730 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 89334 80088734 AFBF002C */  sw         $ra, 0x2c($sp)
/* 89338 80088738 AFA20014 */  sw         $v0, 0x14($sp)
/* 8933C 8008873C AFA30010 */  sw         $v1, 0x10($sp)
/* 89340 80088740 AFA80018 */  sw         $t0, 0x18($sp)
/* 89344 80088744 AFA9001C */  sw         $t1, 0x1c($sp)
/* 89348 80088748 0C0218DE */  jal        func_80086378
/* 8934C 8008874C AFAA0020 */   sw        $t2, 0x20($sp)
/* 89350 80088750 02001021 */  addu       $v0, $s0, $zero
/* 89354 80088754 3C03800E */  lui        $v1, %hi(D_800E10F0)
/* 89358 80088758 8FBF002C */  lw         $ra, 0x2c($sp)
/* 8935C 8008875C 246310F0 */  addiu      $v1, $v1, %lo(D_800E10F0)
/* 89360 80088760 AE030078 */  sw         $v1, 0x78($s0)
/* 89364 80088764 8FB00028 */  lw         $s0, 0x28($sp)
/* 89368 80088768 03E00008 */  jr         $ra
/* 8936C 8008876C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel NOOP_80088770
/* 89370 80088770 03E00008 */  jr         $ra
/* 89374 80088774 00000000 */   nop

glabel show_savegames
/* 89378 80088778 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 8937C 8008877C AFB00058 */  sw         $s0, 0x58($sp)
/* 89380 80088780 00808021 */  addu       $s0, $a0, $zero
/* 89384 80088784 AFBF005C */  sw         $ra, 0x5c($sp)
/* 89388 80088788 9202028F */  lbu        $v0, 0x28f($s0)
/* 8938C 8008878C 1040000A */  beqz       $v0, .L800887B8
/* 89390 80088790 00000000 */   nop
/* 89394 80088794 0C00CBC3 */  jal        func_80032F0C
/* 89398 80088798 8E04027C */   lw        $a0, 0x27c($s0)
/* 8939C 8008879C 8E020078 */  lw         $v0, 0x78($s0)
/* 893A0 800887A0 844400F0 */  lh         $a0, 0xf0($v0)
/* 893A4 800887A4 8C4300F4 */  lw         $v1, 0xf4($v0)
/* 893A8 800887A8 0060F809 */  jalr       $v1
/* 893AC 800887AC 02042021 */   addu      $a0, $s0, $a0
/* 893B0 800887B0 08022211 */  j          .L80088844
/* 893B4 800887B4 8FBF005C */   lw        $ra, 0x5c($sp)
.L800887B8:
/* 893B8 800887B8 0C026259 */  jal        passToMalloc
/* 893BC 800887BC 240400A0 */   addiu     $a0, $zero, 0xa0
/* 893C0 800887C0 00402021 */  addu       $a0, $v0, $zero
/* 893C4 800887C4 3C05800E */  lui        $a1, %hi(D_800E10B0)
/* 893C8 800887C8 24A510B0 */  addiu      $a1, $a1, %lo(D_800E10B0)
/* 893CC 800887CC 2402001C */  addiu      $v0, $zero, 0x1c
/* 893D0 800887D0 27A60018 */  addiu      $a2, $sp, 0x18
/* 893D4 800887D4 AFA00010 */  sw         $zero, 0x10($sp)
/* 893D8 800887D8 96030292 */  lhu        $v1, 0x292($s0)
/* 893DC 800887DC 260702A5 */  addiu      $a3, $s0, 0x2a5
/* 893E0 800887E0 AFA20014 */  sw         $v0, 0x14($sp)
/* 893E4 800887E4 A7A30018 */  sh         $v1, 0x18($sp)
/* 893E8 800887E8 246300C8 */  addiu      $v1, $v1, 0xc8
/* 893EC 800887EC 96020294 */  lhu        $v0, 0x294($s0)
/* 893F0 800887F0 3063FFFF */  andi       $v1, $v1, 0xffff
/* 893F4 800887F4 A4C30004 */  sh         $v1, 4($a2)
/* 893F8 800887F8 A4C20002 */  sh         $v0, 2($a2)
/* 893FC 800887FC 24420078 */  addiu      $v0, $v0, 0x78
/* 89400 80088800 3042FFFF */  andi       $v0, $v0, 0xffff
/* 89404 80088804 0C022CC0 */  jal        func_8008B300
/* 89408 80088808 A4C20006 */   sh        $v0, 6($a2)
/* 8940C 8008880C 8E04027C */  lw         $a0, 0x27c($s0)
/* 89410 80088810 0C00CAB4 */  jal        func_80032AD0
/* 89414 80088814 00402821 */   addu      $a1, $v0, $zero
/* 89418 80088818 9205005B */  lbu        $a1, 0x5b($s0)
/* 8941C 8008881C 0C02F216 */  jal        widget_fade
/* 89420 80088820 02002021 */   addu      $a0, $s0, $zero
/* 89424 80088824 0C00CBC3 */  jal        func_80032F0C
/* 89428 80088828 8E04027C */   lw        $a0, 0x27c($s0)
/* 8942C 8008882C 8E020078 */  lw         $v0, 0x78($s0)
/* 89430 80088830 844400F0 */  lh         $a0, 0xf0($v0)
/* 89434 80088834 8C4300F4 */  lw         $v1, 0xf4($v0)
/* 89438 80088838 0060F809 */  jalr       $v1
/* 8943C 8008883C 02042021 */   addu      $a0, $s0, $a0
/* 89440 80088840 8FBF005C */  lw         $ra, 0x5c($sp)
.L80088844:
/* 89444 80088844 8FB00058 */  lw         $s0, 0x58($sp)
/* 89448 80088848 03E00008 */  jr         $ra
/* 8944C 8008884C 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_80088850
/* 89450 80088850 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89454 80088854 AFB00010 */  sw         $s0, 0x10($sp)
/* 89458 80088858 00808021 */  addu       $s0, $a0, $zero
/* 8945C 8008885C 00002021 */  addu       $a0, $zero, $zero
/* 89460 80088860 AFB10014 */  sw         $s1, 0x14($sp)
/* 89464 80088864 AFBF0018 */  sw         $ra, 0x18($sp)
/* 89468 80088868 0C026EB7 */  jal        get_psf_err
/* 8946C 8008886C 30B100FF */   andi      $s1, $a1, 0xff
/* 89470 80088870 00401821 */  addu       $v1, $v0, $zero
/* 89474 80088874 24020006 */  addiu      $v0, $zero, 6
/* 89478 80088878 14620004 */  bne        $v1, $v0, .L8008888C
/* 8947C 8008887C 00000000 */   nop
/* 89480 80088880 0C026EB7 */  jal        get_psf_err
/* 89484 80088884 00002021 */   addu      $a0, $zero, $zero
/* 89488 80088888 00401821 */  addu       $v1, $v0, $zero
.L8008888C:
/* 8948C 8008888C 10600003 */  beqz       $v1, .L8008889C
/* 89490 80088890 00111140 */   sll       $v0, $s1, 5
/* 89494 80088894 0802222D */  j          .L800888B4
/* 89498 80088898 A200028C */   sb        $zero, 0x28c($s0)
.L8008889C:
/* 8949C 8008889C 02021021 */  addu       $v0, $s0, $v0
/* 894A0 800888A0 8C44007C */  lw         $a0, 0x7c($v0)
/* 894A4 800888A4 0C007887 */  jal        func_8001E21C
/* 894A8 800888A8 00002821 */   addu      $a1, $zero, $zero
/* 894AC 800888AC 24030005 */  addiu      $v1, $zero, 5
/* 894B0 800888B0 A203028C */  sb         $v1, 0x28c($s0)
.L800888B4:
/* 894B4 800888B4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 894B8 800888B8 8FB10014 */  lw         $s1, 0x14($sp)
/* 894BC 800888BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 894C0 800888C0 03E00008 */  jr         $ra
/* 894C4 800888C4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800888C8
/* 894C8 800888C8 24030003 */  addiu      $v1, $zero, 3
/* 894CC 800888CC 3C028008 */  lui        $v0, %hi(func_80085FCC)
/* 894D0 800888D0 24425FCC */  addiu      $v0, $v0, %lo(func_80085FCC)
/* 894D4 800888D4 ACA20018 */  sw         $v0, 0x18($a1)
/* 894D8 800888D8 00001021 */  addu       $v0, $zero, $zero
/* 894DC 800888DC 03E00008 */  jr         $ra
/* 894E0 800888E0 A0A3005C */   sb        $v1, 0x5c($a1)

glabel func_800888E4
/* 894E4 800888E4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 894E8 800888E8 AFB20018 */  sw         $s2, 0x18($sp)
/* 894EC 800888EC 00809021 */  addu       $s2, $a0, $zero
/* 894F0 800888F0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 894F4 800888F4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 894F8 800888F8 AFB10014 */  sw         $s1, 0x14($sp)
/* 894FC 800888FC AFB00010 */  sw         $s0, 0x10($sp)
/* 89500 80088900 8E44027C */  lw         $a0, 0x27c($s2)
/* 89504 80088904 0C00CBBE */  jal        func_80032EF8
/* 89508 80088908 3C13800E */   lui       $s3, 0x800e
/* 8950C 8008890C 00408021 */  addu       $s0, $v0, $zero
/* 89510 80088910 8E440280 */  lw         $a0, 0x280($s2)
/* 89514 80088914 0C02F105 */  jal        func_800BC414
/* 89518 80088918 9211005C */   lbu       $s1, 0x5c($s0)
/* 8951C 8008891C 32220002 */  andi       $v0, $s1, 2
/* 89520 80088920 1040000B */  beqz       $v0, .L80088950
/* 89524 80088924 00002021 */   addu      $a0, $zero, $zero
/* 89528 80088928 3C078008 */  lui        $a3, %hi(func_80086118)
/* 8952C 8008892C 24E76118 */  addiu      $a3, $a3, %lo(func_80086118)
/* 89530 80088930 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 89534 80088934 8C43204C */  lw         $v1, 0x204c($v0)
/* 89538 80088938 9605005E */  lhu        $a1, 0x5e($s0)
/* 8953C 8008893C 0C0218BD */  jal        func_800862F4
/* 89540 80088940 8C66069C */   lw        $a2, 0x69c($v1)
/* 89544 80088944 8E440280 */  lw         $a0, 0x280($s2)
/* 89548 80088948 0C02E885 */  jal        link_widget_text
/* 8954C 8008894C 00402821 */   addu      $a1, $v0, $zero
.L80088950:
/* 89550 80088950 32220001 */  andi       $v0, $s1, 1
/* 89554 80088954 1040000B */  beqz       $v0, .L80088984
/* 89558 80088958 00002021 */   addu      $a0, $zero, $zero
/* 8955C 8008895C 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 89560 80088960 3C078008 */  lui        $a3, %hi(func_80085E44)
/* 89564 80088964 8C43204C */  lw         $v1, 0x204c($v0)
/* 89568 80088968 9605005E */  lhu        $a1, 0x5e($s0)
/* 8956C 8008896C 8C6606A4 */  lw         $a2, 0x6a4($v1)
/* 89570 80088970 0C0218BD */  jal        func_800862F4
/* 89574 80088974 24E75E44 */   addiu     $a3, $a3, %lo(func_80085E44)
/* 89578 80088978 8E440280 */  lw         $a0, 0x280($s2)
/* 8957C 8008897C 0C02E885 */  jal        link_widget_text
/* 89580 80088980 00402821 */   addu      $a1, $v0, $zero
.L80088984:
/* 89584 80088984 00002021 */  addu       $a0, $zero, $zero
/* 89588 80088988 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 8958C 8008898C 00002821 */  addu       $a1, $zero, $zero
/* 89590 80088990 8C43204C */  lw         $v1, 0x204c($v0)
/* 89594 80088994 3C078008 */  lui        $a3, %hi(func_80086054)
/* 89598 80088998 8C6606A8 */  lw         $a2, 0x6a8($v1)
/* 8959C 8008899C 0C0218BD */  jal        func_800862F4
/* 895A0 800889A0 24E76054 */   addiu     $a3, $a3, %lo(func_80086054)
/* 895A4 800889A4 8E440280 */  lw         $a0, 0x280($s2)
/* 895A8 800889A8 0C02E885 */  jal        link_widget_text
/* 895AC 800889AC 00402821 */   addu      $a1, $v0, $zero
/* 895B0 800889B0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 895B4 800889B4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 895B8 800889B8 8FB20018 */  lw         $s2, 0x18($sp)
/* 895BC 800889BC 8FB10014 */  lw         $s1, 0x14($sp)
/* 895C0 800889C0 8FB00010 */  lw         $s0, 0x10($sp)
/* 895C4 800889C4 03E00008 */  jr         $ra
/* 895C8 800889C8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel NOOP_800889CC
/* 895CC 800889CC 03E00008 */  jr         $ra
/* 895D0 800889D0 00000000 */   nop

glabel func_800889D4
/* 895D4 800889D4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 895D8 800889D8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 895DC 800889DC 0C021941 */  jal        controllerPakdata_free
/* 895E0 800889E0 00000000 */   nop
/* 895E4 800889E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 895E8 800889E8 03E00008 */  jr         $ra
/* 895EC 800889EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel text_func
/* 895F0 800889F0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 895F4 800889F4 AFB10014 */  sw         $s1, 0x14($sp)
/* 895F8 800889F8 00808821 */  addu       $s1, $a0, $zero
/* 895FC 800889FC 2404007C */  addiu      $a0, $zero, 0x7c
/* 89600 80088A00 AFB20018 */  sw         $s2, 0x18($sp)
/* 89604 80088A04 00A09021 */  addu       $s2, $a1, $zero
/* 89608 80088A08 AFB00010 */  sw         $s0, 0x10($sp)
/* 8960C 80088A0C AFBF001C */  sw         $ra, 0x1c($sp)
/* 89610 80088A10 0C026259 */  jal        passToMalloc
/* 89614 80088A14 30D0FFFF */   andi      $s0, $a2, 0xffff
/* 89618 80088A18 00402021 */  addu       $a0, $v0, $zero
/* 8961C 80088A1C 02202821 */  addu       $a1, $s1, $zero
/* 89620 80088A20 0C02E3A0 */  jal        widgettext_func_2
/* 89624 80088A24 02003021 */   addu      $a2, $s0, $zero
/* 89628 80088A28 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8962C 80088A2C AC520018 */  sw         $s2, 0x18($v0)
/* 89630 80088A30 8FB20018 */  lw         $s2, 0x18($sp)
/* 89634 80088A34 8FB10014 */  lw         $s1, 0x14($sp)
/* 89638 80088A38 8FB00010 */  lw         $s0, 0x10($sp)
/* 8963C 80088A3C 03E00008 */  jr         $ra
/* 89640 80088A40 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80088A44
/* 89644 80088A44 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89648 80088A48 AFB00010 */  sw         $s0, 0x10($sp)
/* 8964C 80088A4C 3090FFFF */  andi       $s0, $a0, 0xffff
/* 89650 80088A50 00A02021 */  addu       $a0, $a1, $zero
/* 89654 80088A54 00C02821 */  addu       $a1, $a2, $zero
/* 89658 80088A58 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8965C 80088A5C 0C02227C */  jal        text_func
/* 89660 80088A60 24060080 */   addiu     $a2, $zero, 0x80
/* 89664 80088A64 8FBF0014 */  lw         $ra, 0x14($sp)
/* 89668 80088A68 A450005E */  sh         $s0, 0x5e($v0)
/* 8966C 80088A6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 89670 80088A70 03E00008 */  jr         $ra
/* 89674 80088A74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80088A78
/* 89678 80088A78 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8967C 80088A7C 00A03821 */  addu       $a3, $a1, $zero
/* 89680 80088A80 3086FFFF */  andi       $a2, $a0, 0xffff
/* 89684 80088A84 3C048005 */  lui        $a0, %hi(func_8004CFD0)
/* 89688 80088A88 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 8968C 80088A8C 8C457EAC */  lw         $a1, %lo(widget_handler_pointer)($v0)
/* 89690 80088A90 2484CFD0 */  addiu      $a0, $a0, %lo(func_8004CFD0)
/* 89694 80088A94 AFBF0018 */  sw         $ra, 0x18($sp)
/* 89698 80088A98 0C0222AB */  jal        func_80088AAC
/* 8969C 80088A9C AFA00010 */   sw        $zero, 0x10($sp)
/* 896A0 80088AA0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 896A4 80088AA4 03E00008 */  jr         $ra
/* 896A8 80088AA8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80088AAC
/* 896AC 80088AAC 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* 896B0 80088AB0 AFB500BC */  sw         $s5, 0xbc($sp)
/* 896B4 80088AB4 241500C8 */  addiu      $s5, $zero, 0xc8
/* 896B8 80088AB8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 896BC 80088ABC AFB000A8 */  sw         $s0, 0xa8($sp)
/* 896C0 80088AC0 27B00028 */  addiu      $s0, $sp, 0x28
/* 896C4 80088AC4 240300FF */  addiu      $v1, $zero, 0xff
/* 896C8 80088AC8 AFB700C4 */  sw         $s7, 0xc4($sp)
/* 896CC 80088ACC 0080B821 */  addu       $s7, $a0, $zero
/* 896D0 80088AD0 AFB600C0 */  sw         $s6, 0xc0($sp)
/* 896D4 80088AD4 00A0B021 */  addu       $s6, $a1, $zero
/* 896D8 80088AD8 AFB200B0 */  sw         $s2, 0xb0($sp)
/* 896DC 80088ADC 00E09021 */  addu       $s2, $a3, $zero
/* 896E0 80088AE0 AFB100AC */  sw         $s1, 0xac($sp)
/* 896E4 80088AE4 30D1FFFF */  andi       $s1, $a2, 0xffff
/* 896E8 80088AE8 AFBF00C8 */  sw         $ra, 0xc8($sp)
/* 896EC 80088AEC AFB400B8 */  sw         $s4, 0xb8($sp)
/* 896F0 80088AF0 AFB300B4 */  sw         $s3, 0xb4($sp)
/* 896F4 80088AF4 A3A20028 */  sb         $v0, 0x28($sp)
/* 896F8 80088AF8 A2020001 */  sb         $v0, 1($s0)
/* 896FC 80088AFC A2020002 */  sb         $v0, 2($s0)
/* 89700 80088B00 A2030003 */  sb         $v1, 3($s0)
/* 89704 80088B04 A3A20068 */  sb         $v0, 0x68($sp)
/* 89708 80088B08 A3A20069 */  sb         $v0, 0x69($sp)
/* 8970C 80088B0C A3A2006A */  sb         $v0, 0x6a($sp)
/* 89710 80088B10 3C02800E */  lui        $v0, %hi(gGlobals)
/* 89714 80088B14 245368A8 */  addiu      $s3, $v0, %lo(gGlobals)
/* 89718 80088B18 A3A3006B */  sb         $v1, 0x6b($sp)
/* 8971C 80088B1C 8E6314CC */  lw         $v1, 0x14cc($s3)
/* 89720 80088B20 10600002 */  beqz       $v1, .L80088B2C
/* 89724 80088B24 97B400E2 */   lhu       $s4, 0xe2($sp)
/* 89728 80088B28 24150096 */  addiu      $s5, $zero, 0x96
.L80088B2C:
/* 8972C 80088B2C 0C026259 */  jal        passToMalloc
/* 89730 80088B30 240400B0 */   addiu     $a0, $zero, 0xb0
/* 89734 80088B34 00402021 */  addu       $a0, $v0, $zero
/* 89738 80088B38 02202821 */  addu       $a1, $s1, $zero
/* 8973C 80088B3C 02403021 */  addu       $a2, $s2, $zero
/* 89740 80088B40 27A20068 */  addiu      $v0, $sp, 0x68
/* 89744 80088B44 AFA20014 */  sw         $v0, 0x14($sp)
/* 89748 80088B48 2402000A */  addiu      $v0, $zero, 0xa
/* 8974C 80088B4C 02A03821 */  addu       $a3, $s5, $zero
/* 89750 80088B50 AFB00010 */  sw         $s0, 0x10($sp)
/* 89754 80088B54 AFA00018 */  sw         $zero, 0x18($sp)
/* 89758 80088B58 AFA2001C */  sw         $v0, 0x1c($sp)
/* 8975C 80088B5C 0C013461 */  jal        func_8004D184
/* 89760 80088B60 AFA00020 */   sw        $zero, 0x20($sp)
/* 89764 80088B64 8E6314CC */  lw         $v1, 0x14cc($s3)
/* 89768 80088B68 10600005 */  beqz       $v1, .L80088B80
/* 8976C 80088B6C 00408021 */   addu      $s0, $v0, $zero
/* 89770 80088B70 02002021 */  addu       $a0, $s0, $zero
/* 89774 80088B74 24050019 */  addiu      $a1, $zero, 0x19
/* 89778 80088B78 0C02F22A */  jal        widget_move
/* 8977C 80088B7C 00003021 */   addu      $a2, $zero, $zero
.L80088B80:
/* 89780 80088B80 02C02021 */  addu       $a0, $s6, $zero
/* 89784 80088B84 0C02DC7C */  jal        widgetHandler
/* 89788 80088B88 02002821 */   addu      $a1, $s0, $zero
/* 8978C 80088B8C 8FBF00C8 */  lw         $ra, 0xc8($sp)
/* 89790 80088B90 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 89794 80088B94 AC77D500 */  sw         $s7, %lo(freeWidgetFunc)($v1)
/* 89798 80088B98 8FB700C4 */  lw         $s7, 0xc4($sp)
/* 8979C 80088B9C 8FB600C0 */  lw         $s6, 0xc0($sp)
/* 897A0 80088BA0 8FB500BC */  lw         $s5, 0xbc($sp)
/* 897A4 80088BA4 02001021 */  addu       $v0, $s0, $zero
/* 897A8 80088BA8 A614005E */  sh         $s4, 0x5e($s0)
/* 897AC 80088BAC 8FB400B8 */  lw         $s4, 0xb8($sp)
/* 897B0 80088BB0 8FB300B4 */  lw         $s3, 0xb4($sp)
/* 897B4 80088BB4 8FB200B0 */  lw         $s2, 0xb0($sp)
/* 897B8 80088BB8 8FB100AC */  lw         $s1, 0xac($sp)
/* 897BC 80088BBC 8FB000A8 */  lw         $s0, 0xa8($sp)
/* 897C0 80088BC0 03E00008 */  jr         $ra
/* 897C4 80088BC4 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel open_mempak_menu
/* 897C8 80088BC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 897CC 80088BCC 3C02800F */  lui        $v0, %hi(D_800F1C74)
/* 897D0 80088BD0 AC441C74 */  sw         $a0, %lo(D_800F1C74)($v0)
/* 897D4 80088BD4 00C02021 */  addu       $a0, $a2, $zero
/* 897D8 80088BD8 8FA60028 */  lw         $a2, 0x28($sp)
/* 897DC 80088BDC 3C03800F */  lui        $v1, %hi(D_800F1C78)
/* 897E0 80088BE0 AC651C78 */  sw         $a1, %lo(D_800F1C78)($v1)
/* 897E4 80088BE4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 897E8 80088BE8 0C022363 */  jal        make_mempak_menu
/* 897EC 80088BEC 00E02821 */   addu      $a1, $a3, $zero
/* 897F0 80088BF0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 897F4 80088BF4 03E00008 */  jr         $ra
/* 897F8 80088BF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ScreenFadeMode_17
/* 897FC 80088BFC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89800 80088C00 AFB00010 */  sw         $s0, 0x10($sp)
/* 89804 80088C04 AFBF0014 */  sw         $ra, 0x14($sp)
/* 89808 80088C08 0C02230D */  jal        get_input_8
/* 8980C 80088C0C 00808021 */   addu      $s0, $a0, $zero
/* 89810 80088C10 02002021 */  addu       $a0, $s0, $zero
/* 89814 80088C14 0C022338 */  jal        func_80088CE0
/* 89818 80088C18 00402821 */   addu      $a1, $v0, $zero
/* 8981C 80088C1C 3C03800F */  lui        $v1, %hi(D_800F1C78)
/* 89820 80088C20 8C621C78 */  lw         $v0, %lo(D_800F1C78)($v1)
/* 89824 80088C24 8FBF0014 */  lw         $ra, 0x14($sp)
/* 89828 80088C28 8FB00010 */  lw         $s0, 0x10($sp)
/* 8982C 80088C2C 03E00008 */  jr         $ra
/* 89830 80088C30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_input_8
/* 89834 80088C34 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 89838 80088C38 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8983C 80088C3C 00008821 */  addu       $s1, $zero, $zero
/* 89840 80088C40 AFBF0024 */  sw         $ra, 0x24($sp)
/* 89844 80088C44 AFB20020 */  sw         $s2, 0x20($sp)
/* 89848 80088C48 AFB00018 */  sw         $s0, 0x18($sp)
/* 8984C 80088C4C AFA00010 */  sw         $zero, 0x10($sp)
/* 89850 80088C50 08022327 */  j          .L80088C9C
/* 89854 80088C54 27B20010 */   addiu     $s2, $sp, 0x10
.L80088C58:
/* 89858 80088C58 305100FF */  andi       $s1, $v0, 0xff
/* 8985C 80088C5C 3C10800F */  lui        $s0, %hi(debug_queue_800e8908)
/* 89860 80088C60 26108908 */  addiu      $s0, $s0, %lo(debug_queue_800e8908)
/* 89864 80088C64 8FA50010 */  lw         $a1, 0x10($sp)
/* 89868 80088C68 0C00B63C */  jal        toggle_show_debug_queue
/* 8986C 80088C6C 02002021 */   addu      $a0, $s0, $zero
/* 89870 80088C70 8E04F5A4 */  lw         $a0, -0xa5c($s0)
/* 89874 80088C74 0C02DC69 */  jal        run_widget_control_func
/* 89878 80088C78 8FA50010 */   lw        $a1, 0x10($sp)
/* 8987C 80088C7C 00402021 */  addu       $a0, $v0, $zero
/* 89880 80088C80 10800006 */  beqz       $a0, .L80088C9C
/* 89884 80088C84 3C02800F */   lui       $v0, %hi(freeWidgetFunc)
/* 89888 80088C88 8C42D500 */  lw         $v0, %lo(freeWidgetFunc)($v0)
/* 8988C 80088C8C 50400004 */  beql       $v0, $zero, .L80088CA0
/* 89890 80088C90 02402021 */   addu      $a0, $s2, $zero
/* 89894 80088C94 0040F809 */  jalr       $v0
/* 89898 80088C98 00000000 */   nop
.L80088C9C:
/* 8989C 80088C9C 02402021 */  addu       $a0, $s2, $zero
.L80088CA0:
/* 898A0 80088CA0 0C02713D */  jal        get_cont_aidyn
/* 898A4 80088CA4 00002821 */   addu      $a1, $zero, $zero
/* 898A8 80088CA8 1440FFEB */  bnez       $v0, .L80088C58
/* 898AC 80088CAC 26220001 */   addiu     $v0, $s1, 1
/* 898B0 80088CB0 52200001 */  beql       $s1, $zero, .L80088CB8
/* 898B4 80088CB4 24110001 */   addiu     $s1, $zero, 1
.L80088CB8:
/* 898B8 80088CB8 2E220007 */  sltiu      $v0, $s1, 7
/* 898BC 80088CBC 50400001 */  beql       $v0, $zero, .L80088CC4
/* 898C0 80088CC0 24110006 */   addiu     $s1, $zero, 6
.L80088CC4:
/* 898C4 80088CC4 02201021 */  addu       $v0, $s1, $zero
/* 898C8 80088CC8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 898CC 80088CCC 8FB20020 */  lw         $s2, 0x20($sp)
/* 898D0 80088CD0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 898D4 80088CD4 8FB00018 */  lw         $s0, 0x18($sp)
/* 898D8 80088CD8 03E00008 */  jr         $ra
/* 898DC 80088CDC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80088CE0
/* 898E0 80088CE0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 898E4 80088CE4 AFB20030 */  sw         $s2, 0x30($sp)
/* 898E8 80088CE8 30B200FF */  andi       $s2, $a1, 0xff
/* 898EC 80088CEC 00002821 */  addu       $a1, $zero, $zero
/* 898F0 80088CF0 00003021 */  addu       $a2, $zero, $zero
/* 898F4 80088CF4 24070140 */  addiu      $a3, $zero, 0x140
/* 898F8 80088CF8 3C02800E */  lui        $v0, 0x800e
/* 898FC 80088CFC 44920000 */  mtc1       $s2, $f0
/* 89900 80088D00 46800020 */  cvt.s.w    $f0, $f0
/* 89904 80088D04 AFB1002C */  sw         $s1, 0x2c($sp)
/* 89908 80088D08 00808821 */  addu       $s1, $a0, $zero
/* 8990C 80088D0C AFBF0034 */  sw         $ra, 0x34($sp)
/* 89910 80088D10 AFB00028 */  sw         $s0, 0x28($sp)
/* 89914 80088D14 8E240000 */  lw         $a0, ($s1)
/* 89918 80088D18 241000F0 */  addiu      $s0, $zero, 0xf0
/* 8991C 80088D1C E44068B4 */  swc1       $f0, 0x68b4($v0)
/* 89920 80088D20 0C0023E5 */  jal        some_rsp_func
/* 89924 80088D24 AFB00010 */   sw        $s0, 0x10($sp)
/* 89928 80088D28 00402021 */  addu       $a0, $v0, $zero
/* 8992C 80088D2C 00002821 */  addu       $a1, $zero, $zero
/* 89930 80088D30 00003021 */  addu       $a2, $zero, $zero
/* 89934 80088D34 24070140 */  addiu      $a3, $zero, 0x140
/* 89938 80088D38 AFB00010 */  sw         $s0, 0x10($sp)
/* 8993C 80088D3C AFA00014 */  sw         $zero, 0x14($sp)
/* 89940 80088D40 AFA00018 */  sw         $zero, 0x18($sp)
/* 89944 80088D44 AFA0001C */  sw         $zero, 0x1c($sp)
/* 89948 80088D48 0C002265 */  jal        some_video_setting_init
/* 8994C 80088D4C AFA00020 */   sw        $zero, 0x20($sp)
/* 89950 80088D50 0C015E9C */  jal        func_80057A70
/* 89954 80088D54 00402021 */   addu      $a0, $v0, $zero
/* 89958 80088D58 00402021 */  addu       $a0, $v0, $zero
/* 8995C 80088D5C 0C00B703 */  jal        func_with_debug_queue
/* 89960 80088D60 02402821 */   addu      $a1, $s2, $zero
/* 89964 80088D64 8FBF0034 */  lw         $ra, 0x34($sp)
/* 89968 80088D68 8FB20030 */  lw         $s2, 0x30($sp)
/* 8996C 80088D6C AE220000 */  sw         $v0, ($s1)
/* 89970 80088D70 8FB1002C */  lw         $s1, 0x2c($sp)
/* 89974 80088D74 8FB00028 */  lw         $s0, 0x28($sp)
/* 89978 80088D78 03E00008 */  jr         $ra
/* 8997C 80088D7C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80088D80
/* 89980 80088D80 3C03800F */  lui        $v1, %hi(D_800F1C78)
/* 89984 80088D84 03E00008 */  jr         $ra
/* 89988 80088D88 8C621C78 */   lw        $v0, %lo(D_800F1C78)($v1)

glabel make_mempak_menu
/* 8998C 80088D8C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 89990 80088D90 AFB00010 */  sw         $s0, 0x10($sp)
/* 89994 80088D94 3C10800F */  lui        $s0, %hi(D_800F1C80)
/* 89998 80088D98 8E021C80 */  lw         $v0, %lo(D_800F1C80)($s0)
/* 8999C 80088D9C AFB20018 */  sw         $s2, 0x18($sp)
/* 899A0 80088DA0 00809021 */  addu       $s2, $a0, $zero
/* 899A4 80088DA4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 899A8 80088DA8 00A09821 */  addu       $s3, $a1, $zero
/* 899AC 80088DAC AFB10014 */  sw         $s1, 0x14($sp)
/* 899B0 80088DB0 00C08821 */  addu       $s1, $a2, $zero
/* 899B4 80088DB4 14400016 */  bnez       $v0, .L80088E10
/* 899B8 80088DB8 AFBF0020 */   sw        $ra, 0x20($sp)
/* 899BC 80088DBC 0C026259 */  jal        passToMalloc
/* 899C0 80088DC0 24040098 */   addiu     $a0, $zero, 0x98
/* 899C4 80088DC4 00402021 */  addu       $a0, $v0, $zero
/* 899C8 80088DC8 0C02238E */  jal        func_80088E38
/* 899CC 80088DCC 02202821 */   addu      $a1, $s1, $zero
/* 899D0 80088DD0 00402021 */  addu       $a0, $v0, $zero
/* 899D4 80088DD4 02402821 */  addu       $a1, $s2, $zero
/* 899D8 80088DD8 02603021 */  addu       $a2, $s3, $zero
/* 899DC 80088DDC 0C02DD3F */  jal        set_widget_coords
/* 899E0 80088DE0 AE021C80 */   sw        $v0, 0x1c80($s0)
/* 899E4 80088DE4 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 899E8 80088DE8 3C06800F */  lui        $a2, %hi(freeWidgetFunc)
/* 899EC 80088DEC 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 899F0 80088DF0 3C028009 */  lui        $v0, %hi(func_8008A7B8)
/* 899F4 80088DF4 2442A7B8 */  addiu      $v0, $v0, %lo(func_8008A7B8)
/* 899F8 80088DF8 8E051C80 */  lw         $a1, 0x1c80($s0)
/* 899FC 80088DFC 8CC7D500 */  lw         $a3, %lo(freeWidgetFunc)($a2)
/* 89A00 80088E00 3C03800F */  lui        $v1, %hi(D_800F1C7C)
/* 89A04 80088E04 ACC2D500 */  sw         $v0, -0x2b00($a2)
/* 89A08 80088E08 0C02DC7C */  jal        widgetHandler
/* 89A0C 80088E0C AC671C7C */   sw        $a3, %lo(D_800F1C7C)($v1)
.L80088E10:
/* 89A10 80088E10 8FBF0020 */  lw         $ra, 0x20($sp)
/* 89A14 80088E14 8FB3001C */  lw         $s3, 0x1c($sp)
/* 89A18 80088E18 8FB20018 */  lw         $s2, 0x18($sp)
/* 89A1C 80088E1C 8FB10014 */  lw         $s1, 0x14($sp)
/* 89A20 80088E20 8FB00010 */  lw         $s0, 0x10($sp)
/* 89A24 80088E24 03E00008 */  jr         $ra
/* 89A28 80088E28 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80088E2C
/* 89A2C 80088E2C 3C03800F */  lui        $v1, %hi(D_800F1C84)
/* 89A30 80088E30 03E00008 */  jr         $ra
/* 89A34 80088E34 8C621C84 */   lw        $v0, %lo(D_800F1C84)($v1)

glabel func_80088E38
/* 89A38 80088E38 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89A3C 80088E3C AFB00010 */  sw         $s0, 0x10($sp)
/* 89A40 80088E40 00808021 */  addu       $s0, $a0, $zero
/* 89A44 80088E44 AFB10014 */  sw         $s1, 0x14($sp)
/* 89A48 80088E48 AFBF0018 */  sw         $ra, 0x18($sp)
/* 89A4C 80088E4C 0C02E658 */  jal        widget_menu_build
/* 89A50 80088E50 00A08821 */   addu      $s1, $a1, $zero
/* 89A54 80088E54 2604008C */  addiu      $a0, $s0, 0x8c
/* 89A58 80088E58 3C03800F */  lui        $v1, 0x800f
/* 89A5C 80088E5C 3C02800E */  lui        $v0, 0x800e
/* 89A60 80088E60 A2000084 */  sb         $zero, 0x84($s0)
/* 89A64 80088E64 A2000085 */  sb         $zero, 0x85($s0)
/* 89A68 80088E68 A2000086 */  sb         $zero, 0x86($s0)
/* 89A6C 80088E6C A2000087 */  sb         $zero, 0x87($s0)
/* 89A70 80088E70 A2000094 */  sb         $zero, 0x94($s0)
/* 89A74 80088E74 8C6536F0 */  lw         $a1, 0x36f0($v1)
/* 89A78 80088E78 244214B0 */  addiu      $v0, $v0, 0x14b0
/* 89A7C 80088E7C AE020078 */  sw         $v0, 0x78($s0)
/* 89A80 80088E80 3C02800F */  lui        $v0, %hi(D_800F1C84)
/* 89A84 80088E84 AE00007C */  sw         $zero, 0x7c($s0)
/* 89A88 80088E88 AE000080 */  sw         $zero, 0x80($s0)
/* 89A8C 80088E8C AE110088 */  sw         $s1, 0x88($s0)
/* 89A90 80088E90 0C02DBCC */  jal        clear_widget_handler
/* 89A94 80088E94 AC401C84 */   sw        $zero, %lo(D_800F1C84)($v0)
/* 89A98 80088E98 00002021 */  addu       $a0, $zero, $zero
/* 89A9C 80088E9C 0C0270AC */  jal        controller_query_2
/* 89AA0 80088EA0 26050094 */   addiu     $a1, $s0, 0x94
/* 89AA4 80088EA4 02001021 */  addu       $v0, $s0, $zero
/* 89AA8 80088EA8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 89AAC 80088EAC 8FB10014 */  lw         $s1, 0x14($sp)
/* 89AB0 80088EB0 8FB00010 */  lw         $s0, 0x10($sp)
/* 89AB4 80088EB4 03E00008 */  jr         $ra
/* 89AB8 80088EB8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80088EBC
/* 89ABC 80088EBC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89AC0 80088EC0 AFB00010 */  sw         $s0, 0x10($sp)
/* 89AC4 80088EC4 00808021 */  addu       $s0, $a0, $zero
/* 89AC8 80088EC8 3C02800E */  lui        $v0, %hi(D_800E14B0)
/* 89ACC 80088ECC 244214B0 */  addiu      $v0, $v0, %lo(D_800E14B0)
/* 89AD0 80088ED0 2604008C */  addiu      $a0, $s0, 0x8c
/* 89AD4 80088ED4 AFB10014 */  sw         $s1, 0x14($sp)
/* 89AD8 80088ED8 00A08821 */  addu       $s1, $a1, $zero
/* 89ADC 80088EDC 24050002 */  addiu      $a1, $zero, 2
/* 89AE0 80088EE0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 89AE4 80088EE4 0C02DBD4 */  jal        func_800B6F50
/* 89AE8 80088EE8 AE020078 */   sw        $v0, 0x78($s0)
/* 89AEC 80088EEC 02002021 */  addu       $a0, $s0, $zero
/* 89AF0 80088EF0 0C02E66C */  jal        widget_menu_free
/* 89AF4 80088EF4 02202821 */   addu      $a1, $s1, $zero
/* 89AF8 80088EF8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 89AFC 80088EFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 89B00 80088F00 8FB00010 */  lw         $s0, 0x10($sp)
/* 89B04 80088F04 03E00008 */  jr         $ra
/* 89B08 80088F08 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80088F0C
/* 89B0C 80088F0C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89B10 80088F10 10A40008 */  beq        $a1, $a0, .L80088F34
/* 89B14 80088F14 AFBF0010 */   sw        $ra, 0x10($sp)
/* 89B18 80088F18 8CA30078 */  lw         $v1, 0x78($a1)
/* 89B1C 80088F1C 84640078 */  lh         $a0, 0x78($v1)
/* 89B20 80088F20 8C62007C */  lw         $v0, 0x7c($v1)
/* 89B24 80088F24 0040F809 */  jalr       $v0
/* 89B28 80088F28 00A42021 */   addu      $a0, $a1, $a0
/* 89B2C 80088F2C 080223CE */  j          .L80088F38
/* 89B30 80088F30 00001021 */   addu      $v0, $zero, $zero
.L80088F34:
/* 89B34 80088F34 24020001 */  addiu      $v0, $zero, 1
.L80088F38:
/* 89B38 80088F38 8FBF0010 */  lw         $ra, 0x10($sp)
/* 89B3C 80088F3C 03E00008 */  jr         $ra
/* 89B40 80088F40 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80088F44
/* 89B44 80088F44 03E00008 */  jr         $ra
/* 89B48 80088F48 A0800084 */   sb        $zero, 0x84($a0)

glabel func_80088F4C
/* 89B4C 80088F4C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89B50 80088F50 AFBF0010 */  sw         $ra, 0x10($sp)
/* 89B54 80088F54 90820087 */  lbu        $v0, 0x87($a0)
/* 89B58 80088F58 10400005 */  beqz       $v0, .L80088F70
/* 89B5C 80088F5C 00001021 */   addu      $v0, $zero, $zero
/* 89B60 80088F60 0C02F031 */  jal        func_800BC0C4
/* 89B64 80088F64 8C840080 */   lw        $a0, 0x80($a0)
/* 89B68 80088F68 080223DD */  j          .L80088F74
/* 89B6C 80088F6C 8FBF0010 */   lw        $ra, 0x10($sp)
.L80088F70:
/* 89B70 80088F70 8FBF0010 */  lw         $ra, 0x10($sp)
.L80088F74:
/* 89B74 80088F74 03E00008 */  jr         $ra
/* 89B78 80088F78 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_80088f7c
/* 89B7C 80088F7C 03E00008 */  jr         $ra
/* 89B80 80088F80 00801021 */   addu      $v0, $a0, $zero

glabel func_80088F84
/* 89B84 80088F84 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89B88 80088F88 AFBF0010 */  sw         $ra, 0x10($sp)
/* 89B8C 80088F8C 90820087 */  lbu        $v0, 0x87($a0)
/* 89B90 80088F90 10400008 */  beqz       $v0, .L80088FB4
/* 89B94 80088F94 00001021 */   addu      $v0, $zero, $zero
/* 89B98 80088F98 8C850080 */  lw         $a1, 0x80($a0)
/* 89B9C 80088F9C 8CA30078 */  lw         $v1, 0x78($a1)
/* 89BA0 80088FA0 84640058 */  lh         $a0, 0x58($v1)
/* 89BA4 80088FA4 8C62005C */  lw         $v0, 0x5c($v1)
/* 89BA8 80088FA8 0040F809 */  jalr       $v0
/* 89BAC 80088FAC 00A42021 */   addu      $a0, $a1, $a0
/* 89BB0 80088FB0 00001021 */  addu       $v0, $zero, $zero
.L80088FB4:
/* 89BB4 80088FB4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 89BB8 80088FB8 03E00008 */  jr         $ra
/* 89BBC 80088FBC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80088FC0
/* 89BC0 80088FC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89BC4 80088FC4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 89BC8 80088FC8 90820087 */  lbu        $v0, 0x87($a0)
/* 89BCC 80088FCC 10400008 */  beqz       $v0, .L80088FF0
/* 89BD0 80088FD0 00001021 */   addu      $v0, $zero, $zero
/* 89BD4 80088FD4 8C850080 */  lw         $a1, 0x80($a0)
/* 89BD8 80088FD8 8CA30078 */  lw         $v1, 0x78($a1)
/* 89BDC 80088FDC 84640060 */  lh         $a0, 0x60($v1)
/* 89BE0 80088FE0 8C620064 */  lw         $v0, 0x64($v1)
/* 89BE4 80088FE4 0040F809 */  jalr       $v0
/* 89BE8 80088FE8 00A42021 */   addu      $a0, $a1, $a0
/* 89BEC 80088FEC 00001021 */  addu       $v0, $zero, $zero
.L80088FF0:
/* 89BF0 80088FF0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 89BF4 80088FF4 03E00008 */  jr         $ra
/* 89BF8 80088FF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80088FFC
/* 89BFC 80088FFC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89C00 80089000 AFB20018 */  sw         $s2, 0x18($sp)
/* 89C04 80089004 00809021 */  addu       $s2, $a0, $zero
/* 89C08 80089008 AFB00010 */  sw         $s0, 0x10($sp)
/* 89C0C 8008900C 2650008C */  addiu      $s0, $s2, 0x8c
/* 89C10 80089010 02002021 */  addu       $a0, $s0, $zero
/* 89C14 80089014 AFBF001C */  sw         $ra, 0x1c($sp)
/* 89C18 80089018 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 89C1C 8008901C AFB10014 */   sw        $s1, 0x14($sp)
/* 89C20 80089020 10400007 */  beqz       $v0, .L80089040
/* 89C24 80089024 02002021 */   addu      $a0, $s0, $zero
/* 89C28 80089028 0C02DBF7 */  jal        func_800B6FDC
/* 89C2C 8008902C 24050001 */   addiu     $a1, $zero, 1
/* 89C30 80089030 0C02259A */  jal        func_80089668
/* 89C34 80089034 02402021 */   addu      $a0, $s2, $zero
/* 89C38 80089038 0802243E */  j          .L800890F8
/* 89C3C 8008903C 00001021 */   addu      $v0, $zero, $zero
.L80089040:
/* 89C40 80089040 92430084 */  lbu        $v1, 0x84($s2)
/* 89C44 80089044 2C620006 */  sltiu      $v0, $v1, 6
/* 89C48 80089048 1040001D */  beqz       $v0, .L800890C0
/* 89C4C 8008904C 3C02800E */   lui       $v0, %hi(D_800E1448)
/* 89C50 80089050 24421448 */  addiu      $v0, $v0, %lo(D_800E1448)
/* 89C54 80089054 00031880 */  sll        $v1, $v1, 2
/* 89C58 80089058 00621821 */  addu       $v1, $v1, $v0
/* 89C5C 8008905C 8C640000 */  lw         $a0, ($v1)
/* 89C60 80089060 00800008 */  jr         $a0
/* 89C64 80089064 00000000 */   nop
/* 89C68 80089068 0C0224F6 */  jal        func_800893D8
/* 89C6C 8008906C 02402021 */   addu      $a0, $s2, $zero
/* 89C70 80089070 08022431 */  j          .L800890C4
/* 89C74 80089074 3C10800E */   lui       $s0, 0x800e
/* 89C78 80089078 0C02250A */  jal        func_80089428
/* 89C7C 8008907C 02402021 */   addu      $a0, $s2, $zero
/* 89C80 80089080 08022431 */  j          .L800890C4
/* 89C84 80089084 3C10800E */   lui       $s0, 0x800e
/* 89C88 80089088 0C022536 */  jal        load_controllerpak_window
/* 89C8C 8008908C 02402021 */   addu      $a0, $s2, $zero
/* 89C90 80089090 08022431 */  j          .L800890C4
/* 89C94 80089094 3C10800E */   lui       $s0, 0x800e
/* 89C98 80089098 0C022546 */  jal        func_printing_memcard_files
/* 89C9C 8008909C 02402021 */   addu      $a0, $s2, $zero
/* 89CA0 800890A0 08022431 */  j          .L800890C4
/* 89CA4 800890A4 3C10800E */   lui       $s0, 0x800e
/* 89CA8 800890A8 0C022576 */  jal        func_800895D8
/* 89CAC 800890AC 02402021 */   addu      $a0, $s2, $zero
/* 89CB0 800890B0 08022431 */  j          .L800890C4
/* 89CB4 800890B4 3C10800E */   lui       $s0, 0x800e
/* 89CB8 800890B8 0C02257D */  jal        func_800895F4
/* 89CBC 800890BC 02402021 */   addu      $a0, $s2, $zero
.L800890C0:
/* 89CC0 800890C0 3C10800E */  lui        $s0, %hi(gGlobals)
.L800890C4:
/* 89CC4 800890C4 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 89CC8 800890C8 3C11800F */  lui        $s1, %hi(font_face)
/* 89CCC 800890CC 26228D18 */  addiu      $v0, $s1, %lo(font_face)
/* 89CD0 800890D0 8E041600 */  lw         $a0, 0x1600($s0)
/* 89CD4 800890D4 0C02D0FD */  jal        font_func
/* 89CD8 800890D8 8C450008 */   lw        $a1, 8($v0)
/* 89CDC 800890DC 0C02E683 */  jal        func_800B9A0C
/* 89CE0 800890E0 02402021 */   addu      $a0, $s2, $zero
/* 89CE4 800890E4 8E041600 */  lw         $a0, 0x1600($s0)
/* 89CE8 800890E8 8E258D18 */  lw         $a1, -0x72e8($s1)
/* 89CEC 800890EC 0C02D0FD */  jal        font_func
/* 89CF0 800890F0 00408021 */   addu      $s0, $v0, $zero
/* 89CF4 800890F4 02001021 */  addu       $v0, $s0, $zero
.L800890F8:
/* 89CF8 800890F8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 89CFC 800890FC 8FB20018 */  lw         $s2, 0x18($sp)
/* 89D00 80089100 8FB10014 */  lw         $s1, 0x14($sp)
/* 89D04 80089104 8FB00010 */  lw         $s0, 0x10($sp)
/* 89D08 80089108 03E00008 */  jr         $ra
/* 89D0C 8008910C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80089110
/* 89D10 80089110 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 89D14 80089114 AFB70034 */  sw         $s7, 0x34($sp)
/* 89D18 80089118 0080B821 */  addu       $s7, $a0, $zero
/* 89D1C 8008911C AFB00018 */  sw         $s0, 0x18($sp)
/* 89D20 80089120 3C10800E */  lui        $s0, %hi(gGlobals)
/* 89D24 80089124 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 89D28 80089128 AFB30024 */  sw         $s3, 0x24($sp)
/* 89D2C 8008912C 00A09821 */  addu       $s3, $a1, $zero
/* 89D30 80089130 AFB40028 */  sw         $s4, 0x28($sp)
/* 89D34 80089134 3C14800F */  lui        $s4, %hi(font_face)
/* 89D38 80089138 26828D18 */  addiu      $v0, $s4, %lo(font_face)
/* 89D3C 8008913C AFB20020 */  sw         $s2, 0x20($sp)
/* 89D40 80089140 00069400 */  sll        $s2, $a2, 0x10
/* 89D44 80089144 00129403 */  sra        $s2, $s2, 0x10
/* 89D48 80089148 AFB1001C */  sw         $s1, 0x1c($sp)
/* 89D4C 8008914C 00078C00 */  sll        $s1, $a3, 0x10
/* 89D50 80089150 00118C03 */  sra        $s1, $s1, 0x10
/* 89D54 80089154 AFBF0038 */  sw         $ra, 0x38($sp)
/* 89D58 80089158 AFB60030 */  sw         $s6, 0x30($sp)
/* 89D5C 8008915C AFB5002C */  sw         $s5, 0x2c($sp)
/* 89D60 80089160 8E041600 */  lw         $a0, 0x1600($s0)
/* 89D64 80089164 8C450008 */  lw         $a1, 8($v0)
/* 89D68 80089168 87B50052 */  lh         $s5, 0x52($sp)
/* 89D6C 8008916C 0C02D0FD */  jal        font_func
/* 89D70 80089170 87B60056 */   lh        $s6, 0x56($sp)
/* 89D74 80089174 02E02021 */  addu       $a0, $s7, $zero
/* 89D78 80089178 02602821 */  addu       $a1, $s3, $zero
/* 89D7C 8008917C 02403021 */  addu       $a2, $s2, $zero
/* 89D80 80089180 02203821 */  addu       $a3, $s1, $zero
/* 89D84 80089184 AFB50010 */  sw         $s5, 0x10($sp)
/* 89D88 80089188 0C02DE14 */  jal        widget_func_8
/* 89D8C 8008918C AFB60014 */   sw        $s6, 0x14($sp)
/* 89D90 80089190 8E041600 */  lw         $a0, 0x1600($s0)
/* 89D94 80089194 8E858D18 */  lw         $a1, -0x72e8($s4)
/* 89D98 80089198 0C02D0FD */  jal        font_func
/* 89D9C 8008919C 00408021 */   addu      $s0, $v0, $zero
/* 89DA0 800891A0 26E4008C */  addiu      $a0, $s7, 0x8c
/* 89DA4 800891A4 02002821 */  addu       $a1, $s0, $zero
/* 89DA8 800891A8 02403021 */  addu       $a2, $s2, $zero
/* 89DAC 800891AC 02203821 */  addu       $a3, $s1, $zero
/* 89DB0 800891B0 AFB50010 */  sw         $s5, 0x10($sp)
/* 89DB4 800891B4 0C02DCCE */  jal        func_800B7338
/* 89DB8 800891B8 AFB60014 */   sw        $s6, 0x14($sp)
/* 89DBC 800891BC 8FBF0038 */  lw         $ra, 0x38($sp)
/* 89DC0 800891C0 8FB70034 */  lw         $s7, 0x34($sp)
/* 89DC4 800891C4 8FB60030 */  lw         $s6, 0x30($sp)
/* 89DC8 800891C8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 89DCC 800891CC 8FB40028 */  lw         $s4, 0x28($sp)
/* 89DD0 800891D0 8FB30024 */  lw         $s3, 0x24($sp)
/* 89DD4 800891D4 8FB20020 */  lw         $s2, 0x20($sp)
/* 89DD8 800891D8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 89DDC 800891DC 8FB00018 */  lw         $s0, 0x18($sp)
/* 89DE0 800891E0 03E00008 */  jr         $ra
/* 89DE4 800891E4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800891E8
/* 89DE8 800891E8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89DEC 800891EC AFB10014 */  sw         $s1, 0x14($sp)
/* 89DF0 800891F0 00808821 */  addu       $s1, $a0, $zero
/* 89DF4 800891F4 AFB00010 */  sw         $s0, 0x10($sp)
/* 89DF8 800891F8 2630008C */  addiu      $s0, $s1, 0x8c
/* 89DFC 800891FC 02002021 */  addu       $a0, $s0, $zero
/* 89E00 80089200 AFB20018 */  sw         $s2, 0x18($sp)
/* 89E04 80089204 AFBF001C */  sw         $ra, 0x1c($sp)
/* 89E08 80089208 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 89E0C 8008920C 00A09021 */   addu      $s2, $a1, $zero
/* 89E10 80089210 14400006 */  bnez       $v0, .L8008922C
/* 89E14 80089214 02002021 */   addu      $a0, $s0, $zero
/* 89E18 80089218 02202021 */  addu       $a0, $s1, $zero
/* 89E1C 8008921C 0C02DD7A */  jal        widget_control
/* 89E20 80089220 02402821 */   addu      $a1, $s2, $zero
/* 89E24 80089224 0802248E */  j          .L80089238
/* 89E28 80089228 8FBF001C */   lw        $ra, 0x1c($sp)
.L8008922C:
/* 89E2C 8008922C 0C02DC69 */  jal        run_widget_control_func
/* 89E30 80089230 02402821 */   addu      $a1, $s2, $zero
/* 89E34 80089234 8FBF001C */  lw         $ra, 0x1c($sp)
.L80089238:
/* 89E38 80089238 8FB20018 */  lw         $s2, 0x18($sp)
/* 89E3C 8008923C 8FB10014 */  lw         $s1, 0x14($sp)
/* 89E40 80089240 8FB00010 */  lw         $s0, 0x10($sp)
/* 89E44 80089244 03E00008 */  jr         $ra
/* 89E48 80089248 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008924C
/* 89E4C 8008924C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 89E50 80089250 3C028009 */  lui        $v0, %hi(func_8008A848)
/* 89E54 80089254 2483008C */  addiu      $v1, $a0, 0x8c
/* 89E58 80089258 2444A848 */  addiu      $a0, $v0, %lo(func_8008A848)
/* 89E5C 8008925C AFB20020 */  sw         $s2, 0x20($sp)
/* 89E60 80089260 00A09021 */  addu       $s2, $a1, $zero
/* 89E64 80089264 AFB00018 */  sw         $s0, 0x18($sp)
/* 89E68 80089268 3C10800E */  lui        $s0, %hi(gGlobals)
/* 89E6C 8008926C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 89E70 80089270 AFBF0024 */  sw         $ra, 0x24($sp)
/* 89E74 80089274 AFB1001C */  sw         $s1, 0x1c($sp)
/* 89E78 80089278 8E02204C */  lw         $v0, 0x204c($s0)
/* 89E7C 8008927C 00602821 */  addu       $a1, $v1, $zero
/* 89E80 80089280 AFA00010 */  sw         $zero, 0x10($sp)
/* 89E84 80089284 8C470334 */  lw         $a3, 0x334($v0)
/* 89E88 80089288 0C0222AB */  jal        func_80088AAC
/* 89E8C 8008928C 24060002 */   addiu     $a2, $zero, 2
/* 89E90 80089290 3C058009 */  lui        $a1, %hi(func_8008A710)
/* 89E94 80089294 24A5A710 */  addiu      $a1, $a1, %lo(func_8008A710)
/* 89E98 80089298 8E03204C */  lw         $v1, 0x204c($s0)
/* 89E9C 8008929C 24060080 */  addiu      $a2, $zero, 0x80
/* 89EA0 800892A0 8C640338 */  lw         $a0, 0x338($v1)
/* 89EA4 800892A4 0C02227C */  jal        text_func
/* 89EA8 800892A8 00408821 */   addu      $s1, $v0, $zero
/* 89EAC 800892AC 02202021 */  addu       $a0, $s1, $zero
/* 89EB0 800892B0 9643005E */  lhu        $v1, 0x5e($s2)
/* 89EB4 800892B4 00402821 */  addu       $a1, $v0, $zero
/* 89EB8 800892B8 0C013626 */  jal        func_8004D898
/* 89EBC 800892BC A443005E */   sh        $v1, 0x5e($v0)
/* 89EC0 800892C0 3C058009 */  lui        $a1, %hi(func_8008A87C)
/* 89EC4 800892C4 8E02204C */  lw         $v0, 0x204c($s0)
/* 89EC8 800892C8 24A5A87C */  addiu      $a1, $a1, %lo(func_8008A87C)
/* 89ECC 800892CC 8C440080 */  lw         $a0, 0x80($v0)
/* 89ED0 800892D0 0C02227C */  jal        text_func
/* 89ED4 800892D4 24060080 */   addiu     $a2, $zero, 0x80
/* 89ED8 800892D8 02202021 */  addu       $a0, $s1, $zero
/* 89EDC 800892DC 0C013626 */  jal        func_8004D898
/* 89EE0 800892E0 00402821 */   addu      $a1, $v0, $zero
/* 89EE4 800892E4 0C013786 */  jal        func_8004DE18
/* 89EE8 800892E8 02202021 */   addu      $a0, $s1, $zero
/* 89EEC 800892EC 8FBF0024 */  lw         $ra, 0x24($sp)
/* 89EF0 800892F0 8FB20020 */  lw         $s2, 0x20($sp)
/* 89EF4 800892F4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 89EF8 800892F8 8FB00018 */  lw         $s0, 0x18($sp)
/* 89EFC 800892FC 03E00008 */  jr         $ra
/* 89F00 80089300 27BD0028 */   addiu     $sp, $sp, 0x28

glabel try_erase_game_file
/* 89F04 80089304 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89F08 80089308 AFB00010 */  sw         $s0, 0x10($sp)
/* 89F0C 8008930C 00808021 */  addu       $s0, $a0, $zero
/* 89F10 80089310 24020002 */  addiu      $v0, $zero, 2
/* 89F14 80089314 AFB10014 */  sw         $s1, 0x14($sp)
/* 89F18 80089318 00A08821 */  addu       $s1, $a1, $zero
/* 89F1C 8008931C AFBF0018 */  sw         $ra, 0x18($sp)
/* 89F20 80089320 A2020084 */  sb         $v0, 0x84($s0)
/* 89F24 80089324 9224005F */  lbu        $a0, 0x5f($s1)
/* 89F28 80089328 0C027061 */  jal        erase_game_file
/* 89F2C 8008932C 00002821 */   addu      $a1, $zero, $zero
/* 89F30 80089330 304300FF */  andi       $v1, $v0, 0xff
/* 89F34 80089334 1060000C */  beqz       $v1, .L80089368
/* 89F38 80089338 A2020085 */   sb        $v0, 0x85($s0)
/* 89F3C 8008933C 24020006 */  addiu      $v0, $zero, 6
/* 89F40 80089340 14620008 */  bne        $v1, $v0, .L80089364
/* 89F44 80089344 24020001 */   addiu     $v0, $zero, 1
/* 89F48 80089348 9224005F */  lbu        $a0, 0x5f($s1)
/* 89F4C 8008934C 0C027061 */  jal        erase_game_file
/* 89F50 80089350 00002821 */   addu      $a1, $zero, $zero
/* 89F54 80089354 A2020085 */  sb         $v0, 0x85($s0)
/* 89F58 80089358 304200FF */  andi       $v0, $v0, 0xff
/* 89F5C 8008935C 10400002 */  beqz       $v0, .L80089368
/* 89F60 80089360 24020001 */   addiu     $v0, $zero, 1
.L80089364:
/* 89F64 80089364 A2020084 */  sb         $v0, 0x84($s0)
.L80089368:
/* 89F68 80089368 8FBF0018 */  lw         $ra, 0x18($sp)
/* 89F6C 8008936C 8FB10014 */  lw         $s1, 0x14($sp)
/* 89F70 80089370 8FB00010 */  lw         $s0, 0x10($sp)
/* 89F74 80089374 03E00008 */  jr         $ra
/* 89F78 80089378 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008937C
/* 89F7C 8008937C 03E00008 */  jr         $ra
/* 89F80 80089380 A0800084 */   sb        $zero, 0x84($a0)

glabel func_80089384
/* 89F84 80089384 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 89F88 80089388 AFB10014 */  sw         $s1, 0x14($sp)
/* 89F8C 8008938C 00808821 */  addu       $s1, $a0, $zero
/* 89F90 80089390 00002021 */  addu       $a0, $zero, $zero
/* 89F94 80089394 AFB00010 */  sw         $s0, 0x10($sp)
/* 89F98 80089398 AFBF0018 */  sw         $ra, 0x18($sp)
/* 89F9C 8008939C 0C026ED4 */  jal        repaircontrollerpakid
/* 89FA0 800893A0 00A08021 */   addu      $s0, $a1, $zero
/* 89FA4 800893A4 10400005 */  beqz       $v0, .L800893BC
/* 89FA8 800893A8 9205005F */   lbu       $a1, 0x5f($s0)
/* 89FAC 800893AC 0C022699 */  jal        func_80089A64
/* 89FB0 800893B0 02202021 */   addu      $a0, $s1, $zero
/* 89FB4 800893B4 080224F2 */  j          .L800893C8
/* 89FB8 800893B8 8FBF0018 */   lw        $ra, 0x18($sp)
.L800893BC:
/* 89FBC 800893BC 0C0226C3 */  jal        func_80089B0C
/* 89FC0 800893C0 02202021 */   addu      $a0, $s1, $zero
/* 89FC4 800893C4 8FBF0018 */  lw         $ra, 0x18($sp)
.L800893C8:
/* 89FC8 800893C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 89FCC 800893CC 8FB00010 */  lw         $s0, 0x10($sp)
/* 89FD0 800893D0 03E00008 */  jr         $ra
/* 89FD4 800893D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800893D8
/* 89FD8 800893D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 89FDC 800893DC AFB00010 */  sw         $s0, 0x10($sp)
/* 89FE0 800893E0 00808021 */  addu       $s0, $a0, $zero
/* 89FE4 800893E4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 89FE8 800893E8 0C026EB7 */  jal        get_psf_err
/* 89FEC 800893EC 00002021 */   addu      $a0, $zero, $zero
/* 89FF0 800893F0 24030001 */  addiu      $v1, $zero, 1
/* 89FF4 800893F4 A2020085 */  sb         $v0, 0x85($s0)
/* 89FF8 800893F8 304200FF */  andi       $v0, $v0, 0xff
/* 89FFC 800893FC A2030084 */  sb         $v1, 0x84($s0)
/* 8A000 80089400 24030006 */  addiu      $v1, $zero, 6
/* 8A004 80089404 14430005 */  bne        $v0, $v1, .L8008941C
/* 8A008 80089408 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8A00C 8008940C 0C026EB7 */  jal        get_psf_err
/* 8A010 80089410 00002021 */   addu      $a0, $zero, $zero
/* 8A014 80089414 A2020085 */  sb         $v0, 0x85($s0)
/* 8A018 80089418 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008941C:
/* 8A01C 8008941C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8A020 80089420 03E00008 */  jr         $ra
/* 8A024 80089424 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80089428
/* 8A028 80089428 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A02C 8008942C 00802821 */  addu       $a1, $a0, $zero
/* 8A030 80089430 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8A034 80089434 90A40085 */  lbu        $a0, 0x85($a1)
/* 8A038 80089438 24020004 */  addiu      $v0, $zero, 4
/* 8A03C 8008943C 2C83000C */  sltiu      $v1, $a0, 0xc
/* 8A040 80089440 10600020 */  beqz       $v1, .L800894C4
/* 8A044 80089444 A0A20084 */   sb        $v0, 0x84($a1)
/* 8A048 80089448 3C02800E */  lui        $v0, %hi(D_800E1460)
/* 8A04C 8008944C 24421460 */  addiu      $v0, $v0, %lo(D_800E1460)
/* 8A050 80089450 00041880 */  sll        $v1, $a0, 2
/* 8A054 80089454 00621821 */  addu       $v1, $v1, $v0
/* 8A058 80089458 8C640000 */  lw         $a0, ($v1)
/* 8A05C 8008945C 00800008 */  jr         $a0
/* 8A060 80089460 00000000 */   nop
/* 8A064 80089464 0C0225AE */  jal        func_800896B8
/* 8A068 80089468 00A02021 */   addu      $a0, $a1, $zero
/* 8A06C 8008946C 08022534 */  j          .L800894D0
/* 8A070 80089470 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8A074 80089474 0C0225B1 */  jal        func_800896C4
/* 8A078 80089478 00A02021 */   addu      $a0, $a1, $zero
/* 8A07C 8008947C 08022534 */  j          .L800894D0
/* 8A080 80089480 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8A084 80089484 0C02262D */  jal        func_800898B4
/* 8A088 80089488 00A02021 */   addu      $a0, $a1, $zero
/* 8A08C 8008948C 08022534 */  j          .L800894D0
/* 8A090 80089490 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8A094 80089494 0C0225D3 */  jal        func_8008974C
/* 8A098 80089498 00A02021 */   addu      $a0, $a1, $zero
/* 8A09C 8008949C 08022534 */  j          .L800894D0
/* 8A0A0 800894A0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8A0A4 800894A4 0C02264C */  jal        func_80089930
/* 8A0A8 800894A8 00A02021 */   addu      $a0, $a1, $zero
/* 8A0AC 800894AC 08022534 */  j          .L800894D0
/* 8A0B0 800894B0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8A0B4 800894B4 0C022603 */  jal        func_8008980C
/* 8A0B8 800894B8 00A02021 */   addu      $a0, $a1, $zero
/* 8A0BC 800894BC 08022534 */  j          .L800894D0
/* 8A0C0 800894C0 8FBF0010 */   lw        $ra, 0x10($sp)
.L800894C4:
/* 8A0C4 800894C4 0C022603 */  jal        func_8008980C
/* 8A0C8 800894C8 00A02021 */   addu      $a0, $a1, $zero
/* 8A0CC 800894CC 8FBF0010 */  lw         $ra, 0x10($sp)
.L800894D0:
/* 8A0D0 800894D0 03E00008 */  jr         $ra
/* 8A0D4 800894D4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_controllerpak_window
/* 8A0D8 800894D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A0DC 800894DC AFBF0010 */  sw         $ra, 0x10($sp)
/* 8A0E0 800894E0 90830087 */  lbu        $v1, 0x87($a0)
/* 8A0E4 800894E4 24020003 */  addiu      $v0, $zero, 3
/* 8A0E8 800894E8 A0800086 */  sb         $zero, 0x86($a0)
/* 8A0EC 800894EC 14600005 */  bnez       $v1, .L80089504
/* 8A0F0 800894F0 A0820084 */   sb        $v0, 0x84($a0)
/* 8A0F4 800894F4 0C022700 */  jal        controllerpak_window
/* 8A0F8 800894F8 00000000 */   nop
/* 8A0FC 800894FC 08022544 */  j          .L80089510
/* 8A100 80089500 8FBF0010 */   lw        $ra, 0x10($sp)
.L80089504:
/* 8A104 80089504 0C02F105 */  jal        func_800BC414
/* 8A108 80089508 8C840080 */   lw        $a0, 0x80($a0)
/* 8A10C 8008950C 8FBF0010 */  lw         $ra, 0x10($sp)
.L80089510:
/* 8A110 80089510 03E00008 */  jr         $ra
/* 8A114 80089514 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_printing_memcard_files
/* 8A118 80089518 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 8A11C 8008951C AFB00058 */  sw         $s0, 0x58($sp)
/* 8A120 80089520 00808021 */  addu       $s0, $a0, $zero
/* 8A124 80089524 AFBF0060 */  sw         $ra, 0x60($sp)
/* 8A128 80089528 AFB1005C */  sw         $s1, 0x5c($sp)
/* 8A12C 8008952C 92030086 */  lbu        $v1, 0x86($s0)
/* 8A130 80089530 24620001 */  addiu      $v0, $v1, 1
/* 8A134 80089534 A2020086 */  sb         $v0, 0x86($s0)
/* 8A138 80089538 304200FF */  andi       $v0, $v0, 0xff
/* 8A13C 8008953C 2C420011 */  sltiu      $v0, $v0, 0x11
/* 8A140 80089540 14400005 */  bnez       $v0, .L80089558
/* 8A144 80089544 307100FF */   andi      $s1, $v1, 0xff
/* 8A148 80089548 0C022850 */  jal        func_8008A140
/* 8A14C 8008954C 00000000 */   nop
/* 8A150 80089550 08022572 */  j          .L800895C8
/* 8A154 80089554 8FBF0060 */   lw        $ra, 0x60($sp)
.L80089558:
/* 8A158 80089558 27A40018 */  addiu      $a0, $sp, 0x18
/* 8A15C 8008955C 02202821 */  addu       $a1, $s1, $zero
/* 8A160 80089560 0C026FC9 */  jal        get_file_state
/* 8A164 80089564 00003021 */   addu      $a2, $zero, $zero
/* 8A168 80089568 A2020085 */  sb         $v0, 0x85($s0)
/* 8A16C 8008956C 304200FF */  andi       $v0, $v0, 0xff
/* 8A170 80089570 24030006 */  addiu      $v1, $zero, 6
/* 8A174 80089574 54430007 */  bnel       $v0, $v1, .L80089594
/* 8A178 80089578 92020085 */   lbu       $v0, 0x85($s0)
/* 8A17C 8008957C 27A40018 */  addiu      $a0, $sp, 0x18
/* 8A180 80089580 02202821 */  addu       $a1, $s1, $zero
/* 8A184 80089584 0C026FC9 */  jal        get_file_state
/* 8A188 80089588 00003021 */   addu      $a2, $zero, $zero
/* 8A18C 8008958C A2020085 */  sb         $v0, 0x85($s0)
/* 8A190 80089590 92020085 */  lbu        $v0, 0x85($s0)
.L80089594:
/* 8A194 80089594 10400005 */  beqz       $v0, .L800895AC
/* 8A198 80089598 02002021 */   addu      $a0, $s0, $zero
/* 8A19C 8008959C 0C0228DA */  jal        print_blank_memPak_entry
/* 8A1A0 800895A0 02202821 */   addu      $a1, $s1, $zero
/* 8A1A4 800895A4 08022572 */  j          .L800895C8
/* 8A1A8 800895A8 8FBF0060 */   lw        $ra, 0x60($sp)
.L800895AC:
/* 8A1AC 800895AC 02202821 */  addu       $a1, $s1, $zero
/* 8A1B0 800895B0 27A60020 */  addiu      $a2, $sp, 0x20
/* 8A1B4 800895B4 97A20018 */  lhu        $v0, 0x18($sp)
/* 8A1B8 800895B8 27A70031 */  addiu      $a3, $sp, 0x31
/* 8A1BC 800895BC 0C022874 */  jal        print_memcard_file
/* 8A1C0 800895C0 AFA20010 */   sw        $v0, 0x10($sp)
/* 8A1C4 800895C4 8FBF0060 */  lw         $ra, 0x60($sp)
.L800895C8:
/* 8A1C8 800895C8 8FB1005C */  lw         $s1, 0x5c($sp)
/* 8A1CC 800895CC 8FB00058 */  lw         $s0, 0x58($sp)
/* 8A1D0 800895D0 03E00008 */  jr         $ra
/* 8A1D4 800895D4 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_800895D8
/* 8A1D8 800895D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A1DC 800895DC AFBF0010 */  sw         $ra, 0x10($sp)
/* 8A1E0 800895E0 0C022955 */  jal        func_8008A554
/* 8A1E4 800895E4 00000000 */   nop
/* 8A1E8 800895E8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8A1EC 800895EC 03E00008 */  jr         $ra
/* 8A1F0 800895F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800895F4
/* 8A1F4 800895F4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A1F8 800895F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 8A1FC 800895FC 00808021 */  addu       $s0, $a0, $zero
/* 8A200 80089600 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8A204 80089604 0C026E11 */  jal        controller_status_check
/* 8A208 80089608 00002021 */   addu      $a0, $zero, $zero
/* 8A20C 8008960C 10400013 */  beqz       $v0, .L8008965C
/* 8A210 80089610 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8A214 80089614 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8A218 80089618 2604008C */   addiu     $a0, $s0, 0x8c
/* 8A21C 8008961C 5040000C */  beql       $v0, $zero, .L80089650
/* 8A220 80089620 A2000084 */   sb        $zero, 0x84($s0)
/* 8A224 80089624 9443005E */  lhu        $v1, 0x5e($v0)
/* 8A228 80089628 24020002 */  addiu      $v0, $zero, 2
/* 8A22C 8008962C 54620008 */  bnel       $v1, $v0, .L80089650
/* 8A230 80089630 A2000084 */   sb        $zero, 0x84($s0)
/* 8A234 80089634 0C026EB7 */  jal        get_psf_err
/* 8A238 80089638 00002021 */   addu      $a0, $zero, $zero
/* 8A23C 8008963C 54400004 */  bnel       $v0, $zero, .L80089650
/* 8A240 80089640 A2000084 */   sb        $zero, 0x84($s0)
/* 8A244 80089644 24020004 */  addiu      $v0, $zero, 4
/* 8A248 80089648 08022596 */  j          .L80089658
/* 8A24C 8008964C A2020084 */   sb        $v0, 0x84($s0)
.L80089650:
/* 8A250 80089650 0C022938 */  jal        func_8008A4E0
/* 8A254 80089654 02002021 */   addu      $a0, $s0, $zero
.L80089658:
/* 8A258 80089658 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008965C:
/* 8A25C 8008965C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8A260 80089660 03E00008 */  jr         $ra
/* 8A264 80089664 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80089668
/* 8A268 80089668 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A26C 8008966C AFB00010 */  sw         $s0, 0x10($sp)
/* 8A270 80089670 00808021 */  addu       $s0, $a0, $zero
/* 8A274 80089674 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8A278 80089678 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8A27C 8008967C 2604008C */   addiu     $a0, $s0, 0x8c
/* 8A280 80089680 1040000A */  beqz       $v0, .L800896AC
/* 8A284 80089684 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8A288 80089688 90430070 */  lbu        $v1, 0x70($v0)
/* 8A28C 8008968C 24020005 */  addiu      $v0, $zero, 5
/* 8A290 80089690 10620006 */  beq        $v1, $v0, .L800896AC
/* 8A294 80089694 24020006 */   addiu     $v0, $zero, 6
/* 8A298 80089698 50620005 */  beql       $v1, $v0, .L800896B0
/* 8A29C 8008969C 8FB00010 */   lw        $s0, 0x10($sp)
/* 8A2A0 800896A0 0C022955 */  jal        func_8008A554
/* 8A2A4 800896A4 02002021 */   addu      $a0, $s0, $zero
/* 8A2A8 800896A8 8FBF0014 */  lw         $ra, 0x14($sp)
.L800896AC:
/* 8A2AC 800896AC 8FB00010 */  lw         $s0, 0x10($sp)
.L800896B0:
/* 8A2B0 800896B0 03E00008 */  jr         $ra
/* 8A2B4 800896B4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800896B8
/* 8A2B8 800896B8 24020002 */  addiu      $v0, $zero, 2
/* 8A2BC 800896BC 03E00008 */  jr         $ra
/* 8A2C0 800896C0 A0820084 */   sb        $v0, 0x84($a0)

glabel func_800896C4
/* 8A2C4 800896C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8A2C8 800896C8 00802821 */  addu       $a1, $a0, $zero
/* 8A2CC 800896CC 3C048009 */  lui        $a0, %hi(func_8008A848)
/* 8A2D0 800896D0 2484A848 */  addiu      $a0, $a0, %lo(func_8008A848)
/* 8A2D4 800896D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 8A2D8 800896D8 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A2DC 800896DC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A2E0 800896E0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8A2E4 800896E4 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A2E8 800896E8 90A20085 */  lbu        $v0, 0x85($a1)
/* 8A2EC 800896EC 24A5008C */  addiu      $a1, $a1, 0x8c
/* 8A2F0 800896F0 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A2F4 800896F4 8C670654 */  lw         $a3, 0x654($v1)
/* 8A2F8 800896F8 0C0222AB */  jal        func_80088AAC
/* 8A2FC 800896FC 24060001 */   addiu     $a2, $zero, 1
/* 8A300 80089700 3C058009 */  lui        $a1, %hi(func_8008A738)
/* 8A304 80089704 24A5A738 */  addiu      $a1, $a1, %lo(func_8008A738)
/* 8A308 80089708 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A30C 8008970C 24060080 */  addiu      $a2, $zero, 0x80
/* 8A310 80089710 8C640648 */  lw         $a0, 0x648($v1)
/* 8A314 80089714 0C02227C */  jal        text_func
/* 8A318 80089718 00408021 */   addu      $s0, $v0, $zero
/* 8A31C 8008971C 02002021 */  addu       $a0, $s0, $zero
/* 8A320 80089720 0C013626 */  jal        func_8004D898
/* 8A324 80089724 00402821 */   addu      $a1, $v0, $zero
/* 8A328 80089728 0C013786 */  jal        func_8004DE18
/* 8A32C 8008972C 02002021 */   addu      $a0, $s0, $zero
/* 8A330 80089730 02002021 */  addu       $a0, $s0, $zero
/* 8A334 80089734 0C013779 */  jal        func_8004DDE4
/* 8A338 80089738 24050001 */   addiu     $a1, $zero, 1
/* 8A33C 8008973C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8A340 80089740 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A344 80089744 03E00008 */  jr         $ra
/* 8A348 80089748 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008974C
/* 8A34C 8008974C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8A350 80089750 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8A354 80089754 00808821 */  addu       $s1, $a0, $zero
/* 8A358 80089758 00002021 */  addu       $a0, $zero, $zero
/* 8A35C 8008975C AFBF0020 */  sw         $ra, 0x20($sp)
/* 8A360 80089760 0C026EB7 */  jal        get_psf_err
/* 8A364 80089764 AFB00018 */   sw        $s0, 0x18($sp)
/* 8A368 80089768 00401821 */  addu       $v1, $v0, $zero
/* 8A36C 8008976C 24020006 */  addiu      $v0, $zero, 6
/* 8A370 80089770 14620004 */  bne        $v1, $v0, .L80089784
/* 8A374 80089774 00000000 */   nop
/* 8A378 80089778 0C026EB7 */  jal        get_psf_err
/* 8A37C 8008977C 00002021 */   addu      $a0, $zero, $zero
/* 8A380 80089780 00401821 */  addu       $v1, $v0, $zero
.L80089784:
/* 8A384 80089784 10600006 */  beqz       $v1, .L800897A0
/* 8A388 80089788 3C048009 */   lui       $a0, 0x8009
/* 8A38C 8008978C A2230085 */  sb         $v1, 0x85($s1)
/* 8A390 80089790 0C02250A */  jal        func_80089428
/* 8A394 80089794 02202021 */   addu      $a0, $s1, $zero
/* 8A398 80089798 080225FF */  j          .L800897FC
/* 8A39C 8008979C 8FBF0020 */   lw        $ra, 0x20($sp)
.L800897A0:
/* 8A3A0 800897A0 2484A848 */  addiu      $a0, $a0, -0x57b8
/* 8A3A4 800897A4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A3A8 800897A8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A3AC 800897AC 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A3B0 800897B0 92220085 */  lbu        $v0, 0x85($s1)
/* 8A3B4 800897B4 2625008C */  addiu      $a1, $s1, 0x8c
/* 8A3B8 800897B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A3BC 800897BC 8C67062C */  lw         $a3, 0x62c($v1)
/* 8A3C0 800897C0 0C0222AB */  jal        func_80088AAC
/* 8A3C4 800897C4 24060001 */   addiu     $a2, $zero, 1
/* 8A3C8 800897C8 3C058009 */  lui        $a1, %hi(func_8008A768)
/* 8A3CC 800897CC 24A5A768 */  addiu      $a1, $a1, %lo(func_8008A768)
/* 8A3D0 800897D0 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A3D4 800897D4 24060080 */  addiu      $a2, $zero, 0x80
/* 8A3D8 800897D8 8C640630 */  lw         $a0, 0x630($v1)
/* 8A3DC 800897DC 0C02227C */  jal        text_func
/* 8A3E0 800897E0 00408021 */   addu      $s0, $v0, $zero
/* 8A3E4 800897E4 02002021 */  addu       $a0, $s0, $zero
/* 8A3E8 800897E8 0C013626 */  jal        func_8004D898
/* 8A3EC 800897EC 00402821 */   addu      $a1, $v0, $zero
/* 8A3F0 800897F0 0C013786 */  jal        func_8004DE18
/* 8A3F4 800897F4 02002021 */   addu      $a0, $s0, $zero
/* 8A3F8 800897F8 8FBF0020 */  lw         $ra, 0x20($sp)
.L800897FC:
/* 8A3FC 800897FC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8A400 80089800 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A404 80089804 03E00008 */  jr         $ra
/* 8A408 80089808 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008980C
/* 8A40C 8008980C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8A410 80089810 00802821 */  addu       $a1, $a0, $zero
/* 8A414 80089814 3C048009 */  lui        $a0, %hi(func_8008A848)
/* 8A418 80089818 2484A848 */  addiu      $a0, $a0, %lo(func_8008A848)
/* 8A41C 8008981C AFB00018 */  sw         $s0, 0x18($sp)
/* 8A420 80089820 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A424 80089824 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A428 80089828 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8A42C 8008982C AFB1001C */  sw         $s1, 0x1c($sp)
/* 8A430 80089830 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A434 80089834 90A20085 */  lbu        $v0, 0x85($a1)
/* 8A438 80089838 24A5008C */  addiu      $a1, $a1, 0x8c
/* 8A43C 8008983C AFA20010 */  sw         $v0, 0x10($sp)
/* 8A440 80089840 8C670644 */  lw         $a3, 0x644($v1)
/* 8A444 80089844 0C0222AB */  jal        func_80088AAC
/* 8A448 80089848 24060002 */   addiu     $a2, $zero, 2
/* 8A44C 8008984C 3C058009 */  lui        $a1, %hi(func_8008A738)
/* 8A450 80089850 24A5A738 */  addiu      $a1, $a1, %lo(func_8008A738)
/* 8A454 80089854 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A458 80089858 24060080 */  addiu      $a2, $zero, 0x80
/* 8A45C 8008985C 8C640648 */  lw         $a0, 0x648($v1)
/* 8A460 80089860 0C02227C */  jal        text_func
/* 8A464 80089864 00408821 */   addu      $s1, $v0, $zero
/* 8A468 80089868 02202021 */  addu       $a0, $s1, $zero
/* 8A46C 8008986C 0C013626 */  jal        func_8004D898
/* 8A470 80089870 00402821 */   addu      $a1, $v0, $zero
/* 8A474 80089874 3C058009 */  lui        $a1, %hi(func_8008A768)
/* 8A478 80089878 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A47C 8008987C 24A5A768 */  addiu      $a1, $a1, %lo(func_8008A768)
/* 8A480 80089880 8C440650 */  lw         $a0, 0x650($v0)
/* 8A484 80089884 0C02227C */  jal        text_func
/* 8A488 80089888 24060080 */   addiu     $a2, $zero, 0x80
/* 8A48C 8008988C 02202021 */  addu       $a0, $s1, $zero
/* 8A490 80089890 0C013626 */  jal        func_8004D898
/* 8A494 80089894 00402821 */   addu      $a1, $v0, $zero
/* 8A498 80089898 0C013786 */  jal        func_8004DE18
/* 8A49C 8008989C 02202021 */   addu      $a0, $s1, $zero
/* 8A4A0 800898A0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8A4A4 800898A4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8A4A8 800898A8 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A4AC 800898AC 03E00008 */  jr         $ra
/* 8A4B0 800898B0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800898B4
/* 8A4B4 800898B4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8A4B8 800898B8 00802821 */  addu       $a1, $a0, $zero
/* 8A4BC 800898BC 3C048009 */  lui        $a0, %hi(func_8008A848)
/* 8A4C0 800898C0 2484A848 */  addiu      $a0, $a0, %lo(func_8008A848)
/* 8A4C4 800898C4 AFB00018 */  sw         $s0, 0x18($sp)
/* 8A4C8 800898C8 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A4CC 800898CC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A4D0 800898D0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8A4D4 800898D4 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A4D8 800898D8 90A20085 */  lbu        $v0, 0x85($a1)
/* 8A4DC 800898DC 24A5008C */  addiu      $a1, $a1, 0x8c
/* 8A4E0 800898E0 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A4E4 800898E4 8C67078C */  lw         $a3, 0x78c($v1)
/* 8A4E8 800898E8 0C0222AB */  jal        func_80088AAC
/* 8A4EC 800898EC 24060001 */   addiu     $a2, $zero, 1
/* 8A4F0 800898F0 3C058009 */  lui        $a1, %hi(func_8008A738)
/* 8A4F4 800898F4 24A5A738 */  addiu      $a1, $a1, %lo(func_8008A738)
/* 8A4F8 800898F8 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A4FC 800898FC 24060080 */  addiu      $a2, $zero, 0x80
/* 8A500 80089900 8C640648 */  lw         $a0, 0x648($v1)
/* 8A504 80089904 0C02227C */  jal        text_func
/* 8A508 80089908 00408021 */   addu      $s0, $v0, $zero
/* 8A50C 8008990C 02002021 */  addu       $a0, $s0, $zero
/* 8A510 80089910 0C013626 */  jal        func_8004D898
/* 8A514 80089914 00402821 */   addu      $a1, $v0, $zero
/* 8A518 80089918 0C013786 */  jal        func_8004DE18
/* 8A51C 8008991C 02002021 */   addu      $a0, $s0, $zero
/* 8A520 80089920 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8A524 80089924 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A528 80089928 03E00008 */  jr         $ra
/* 8A52C 8008992C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80089930
/* 8A530 80089930 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A534 80089934 AFB00010 */  sw         $s0, 0x10($sp)
/* 8A538 80089938 00808021 */  addu       $s0, $a0, $zero
/* 8A53C 8008993C AFBF0014 */  sw         $ra, 0x14($sp)
/* 8A540 80089940 0C0270E2 */  jal        query_controller
/* 8A544 80089944 00002021 */   addu      $a0, $zero, $zero
/* 8A548 80089948 10400005 */  beqz       $v0, .L80089960
/* 8A54C 8008994C 00000000 */   nop
/* 8A550 80089950 0C022687 */  jal        func_80089A1C
/* 8A554 80089954 02002021 */   addu      $a0, $s0, $zero
/* 8A558 80089958 0802265B */  j          .L8008996C
/* 8A55C 8008995C 8FBF0014 */   lw        $ra, 0x14($sp)
.L80089960:
/* 8A560 80089960 0C022690 */  jal        func_80089A40
/* 8A564 80089964 02002021 */   addu      $a0, $s0, $zero
/* 8A568 80089968 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008996C:
/* 8A56C 8008996C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8A570 80089970 03E00008 */  jr         $ra
/* 8A574 80089974 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80089978
/* 8A578 80089978 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8A57C 8008997C AFB1001C */  sw         $s1, 0x1c($sp)
/* 8A580 80089980 00808821 */  addu       $s1, $a0, $zero
/* 8A584 80089984 3C048009 */  lui        $a0, %hi(func_8008A848)
/* 8A588 80089988 2484A848 */  addiu      $a0, $a0, %lo(func_8008A848)
/* 8A58C 8008998C 00A03821 */  addu       $a3, $a1, $zero
/* 8A590 80089990 2625008C */  addiu      $a1, $s1, 0x8c
/* 8A594 80089994 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8A598 80089998 AFB00018 */  sw         $s0, 0x18($sp)
/* 8A59C 8008999C 92220085 */  lbu        $v0, 0x85($s1)
/* 8A5A0 800899A0 24060002 */  addiu      $a2, $zero, 2
/* 8A5A4 800899A4 0C0222AB */  jal        func_80088AAC
/* 8A5A8 800899A8 AFA20010 */   sw        $v0, 0x10($sp)
/* 8A5AC 800899AC 3C068009 */  lui        $a2, %hi(func_8008A790)
/* 8A5B0 800899B0 24C6A790 */  addiu      $a2, $a2, %lo(func_8008A790)
/* 8A5B4 800899B4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A5B8 800899B8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A5BC 800899BC 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A5C0 800899C0 92240085 */  lbu        $a0, 0x85($s1)
/* 8A5C4 800899C4 8C65063C */  lw         $a1, 0x63c($v1)
/* 8A5C8 800899C8 0C022291 */  jal        func_80088A44
/* 8A5CC 800899CC 00408821 */   addu      $s1, $v0, $zero
/* 8A5D0 800899D0 02202021 */  addu       $a0, $s1, $zero
/* 8A5D4 800899D4 0C013626 */  jal        func_8004D898
/* 8A5D8 800899D8 00402821 */   addu      $a1, $v0, $zero
/* 8A5DC 800899DC 3C058009 */  lui        $a1, %hi(func_8008A738)
/* 8A5E0 800899E0 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A5E4 800899E4 24A5A738 */  addiu      $a1, $a1, %lo(func_8008A738)
/* 8A5E8 800899E8 8C440648 */  lw         $a0, 0x648($v0)
/* 8A5EC 800899EC 0C02227C */  jal        text_func
/* 8A5F0 800899F0 24060080 */   addiu     $a2, $zero, 0x80
/* 8A5F4 800899F4 02202021 */  addu       $a0, $s1, $zero
/* 8A5F8 800899F8 0C013626 */  jal        func_8004D898
/* 8A5FC 800899FC 00402821 */   addu      $a1, $v0, $zero
/* 8A600 80089A00 0C013786 */  jal        func_8004DE18
/* 8A604 80089A04 02202021 */   addu      $a0, $s1, $zero
/* 8A608 80089A08 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8A60C 80089A0C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8A610 80089A10 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A614 80089A14 03E00008 */  jr         $ra
/* 8A618 80089A18 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80089A1C
/* 8A61C 80089A1C 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 8A620 80089A20 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 8A624 80089A24 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A628 80089A28 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8A62C 80089A2C 0C02265E */  jal        func_80089978
/* 8A630 80089A30 8C650634 */   lw        $a1, 0x634($v1)
/* 8A634 80089A34 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8A638 80089A38 03E00008 */  jr         $ra
/* 8A63C 80089A3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80089A40
/* 8A640 80089A40 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 8A644 80089A44 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 8A648 80089A48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8A64C 80089A4C AFBF0010 */  sw         $ra, 0x10($sp)
/* 8A650 80089A50 0C02265E */  jal        func_80089978
/* 8A654 80089A54 8C650638 */   lw        $a1, 0x638($v1)
/* 8A658 80089A58 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8A65C 80089A5C 03E00008 */  jr         $ra
/* 8A660 80089A60 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80089A64
/* 8A664 80089A64 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8A668 80089A68 3C028009 */  lui        $v0, %hi(func_8008A848)
/* 8A66C 80089A6C 2483008C */  addiu      $v1, $a0, 0x8c
/* 8A670 80089A70 2444A848 */  addiu      $a0, $v0, %lo(func_8008A848)
/* 8A674 80089A74 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8A678 80089A78 30B100FF */  andi       $s1, $a1, 0xff
/* 8A67C 80089A7C AFB00018 */  sw         $s0, 0x18($sp)
/* 8A680 80089A80 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A684 80089A84 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A688 80089A88 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8A68C 80089A8C 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A690 80089A90 00602821 */  addu       $a1, $v1, $zero
/* 8A694 80089A94 AFB10010 */  sw         $s1, 0x10($sp)
/* 8A698 80089A98 8C470660 */  lw         $a3, 0x660($v0)
/* 8A69C 80089A9C 0C0222AB */  jal        func_80088AAC
/* 8A6A0 80089AA0 24060002 */   addiu     $a2, $zero, 2
/* 8A6A4 80089AA4 02202021 */  addu       $a0, $s1, $zero
/* 8A6A8 80089AA8 3C068009 */  lui        $a2, %hi(func_8008A8A4)
/* 8A6AC 80089AAC 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A6B0 80089AB0 24C6A8A4 */  addiu      $a2, $a2, %lo(func_8008A8A4)
/* 8A6B4 80089AB4 8C65064C */  lw         $a1, 0x64c($v1)
/* 8A6B8 80089AB8 0C022291 */  jal        func_80088A44
/* 8A6BC 80089ABC 00408821 */   addu      $s1, $v0, $zero
/* 8A6C0 80089AC0 02202021 */  addu       $a0, $s1, $zero
/* 8A6C4 80089AC4 0C013626 */  jal        func_8004D898
/* 8A6C8 80089AC8 00402821 */   addu      $a1, $v0, $zero
/* 8A6CC 80089ACC 3C058009 */  lui        $a1, %hi(func_8008A738)
/* 8A6D0 80089AD0 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A6D4 80089AD4 24A5A738 */  addiu      $a1, $a1, %lo(func_8008A738)
/* 8A6D8 80089AD8 8C440648 */  lw         $a0, 0x648($v0)
/* 8A6DC 80089ADC 0C02227C */  jal        text_func
/* 8A6E0 80089AE0 24060080 */   addiu     $a2, $zero, 0x80
/* 8A6E4 80089AE4 02202021 */  addu       $a0, $s1, $zero
/* 8A6E8 80089AE8 0C013626 */  jal        func_8004D898
/* 8A6EC 80089AEC 00402821 */   addu      $a1, $v0, $zero
/* 8A6F0 80089AF0 0C013786 */  jal        func_8004DE18
/* 8A6F4 80089AF4 02202021 */   addu      $a0, $s1, $zero
/* 8A6F8 80089AF8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8A6FC 80089AFC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8A700 80089B00 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A704 80089B04 03E00008 */  jr         $ra
/* 8A708 80089B08 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80089B0C
/* 8A70C 80089B0C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8A710 80089B10 AFB20020 */  sw         $s2, 0x20($sp)
/* 8A714 80089B14 00809021 */  addu       $s2, $a0, $zero
/* 8A718 80089B18 3C048009 */  lui        $a0, %hi(func_8008A848)
/* 8A71C 80089B1C 2484A848 */  addiu      $a0, $a0, %lo(func_8008A848)
/* 8A720 80089B20 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8A724 80089B24 30B100FF */  andi       $s1, $a1, 0xff
/* 8A728 80089B28 AFB00018 */  sw         $s0, 0x18($sp)
/* 8A72C 80089B2C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A730 80089B30 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A734 80089B34 AFBF0024 */  sw         $ra, 0x24($sp)
/* 8A738 80089B38 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A73C 80089B3C 2645008C */  addiu      $a1, $s2, 0x8c
/* 8A740 80089B40 AFB10010 */  sw         $s1, 0x10($sp)
/* 8A744 80089B44 8C47065C */  lw         $a3, 0x65c($v0)
/* 8A748 80089B48 0C0222AB */  jal        func_80088AAC
/* 8A74C 80089B4C 24060001 */   addiu     $a2, $zero, 1
/* 8A750 80089B50 02202021 */  addu       $a0, $s1, $zero
/* 8A754 80089B54 3C068009 */  lui        $a2, %hi(func_8008A768)
/* 8A758 80089B58 8E03204C */  lw         $v1, 0x204c($s0)
/* 8A75C 80089B5C 24C6A768 */  addiu      $a2, $a2, %lo(func_8008A768)
/* 8A760 80089B60 8C650630 */  lw         $a1, 0x630($v1)
/* 8A764 80089B64 0C022291 */  jal        func_80088A44
/* 8A768 80089B68 00408021 */   addu      $s0, $v0, $zero
/* 8A76C 80089B6C 02002021 */  addu       $a0, $s0, $zero
/* 8A770 80089B70 0C013626 */  jal        func_8004D898
/* 8A774 80089B74 00402821 */   addu      $a1, $v0, $zero
/* 8A778 80089B78 0C013786 */  jal        func_8004DE18
/* 8A77C 80089B7C 02002021 */   addu      $a0, $s0, $zero
/* 8A780 80089B80 8FBF0024 */  lw         $ra, 0x24($sp)
/* 8A784 80089B84 A2400084 */  sb         $zero, 0x84($s2)
/* 8A788 80089B88 8FB20020 */  lw         $s2, 0x20($sp)
/* 8A78C 80089B8C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8A790 80089B90 8FB00018 */  lw         $s0, 0x18($sp)
/* 8A794 80089B94 03E00008 */  jr         $ra
/* 8A798 80089B98 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80089B9C
/* 8A79C 80089B9C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8A7A0 80089BA0 AFB00010 */  sw         $s0, 0x10($sp)
/* 8A7A4 80089BA4 00808021 */  addu       $s0, $a0, $zero
/* 8A7A8 80089BA8 24040080 */  addiu      $a0, $zero, 0x80
/* 8A7AC 80089BAC AFB10014 */  sw         $s1, 0x14($sp)
/* 8A7B0 80089BB0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8A7B4 80089BB4 0C026259 */  jal        passToMalloc
/* 8A7B8 80089BB8 30B100FF */   andi      $s1, $a1, 0xff
/* 8A7BC 80089BBC 00402021 */  addu       $a0, $v0, $zero
/* 8A7C0 80089BC0 2405003C */  addiu      $a1, $zero, 0x3c
/* 8A7C4 80089BC4 3C068009 */  lui        $a2, %hi(func_8008A790)
/* 8A7C8 80089BC8 0C00C0C0 */  jal        func_80030300
/* 8A7CC 80089BCC 24C6A790 */   addiu     $a2, $a2, %lo(func_8008A790)
/* 8A7D0 80089BD0 2604008C */  addiu      $a0, $s0, 0x8c
/* 8A7D4 80089BD4 00402821 */  addu       $a1, $v0, $zero
/* 8A7D8 80089BD8 3C038009 */  lui        $v1, %hi(D_8008C1B0)
/* 8A7DC 80089BDC 2463C1B0 */  addiu      $v1, $v1, %lo(D_8008C1B0)
/* 8A7E0 80089BE0 A451005E */  sh         $s1, 0x5e($v0)
/* 8A7E4 80089BE4 0C02DC7C */  jal        widgetHandler
/* 8A7E8 80089BE8 AC43001C */   sw        $v1, 0x1c($v0)
/* 8A7EC 80089BEC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8A7F0 80089BF0 8FB10014 */  lw         $s1, 0x14($sp)
/* 8A7F4 80089BF4 8FB00010 */  lw         $s0, 0x10($sp)
/* 8A7F8 80089BF8 03E00008 */  jr         $ra
/* 8A7FC 80089BFC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel controllerpak_window
/* 8A800 80089C00 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 8A804 80089C04 AFB60050 */  sw         $s6, 0x50($sp)
/* 8A808 80089C08 0080B021 */  addu       $s6, $a0, $zero
/* 8A80C 80089C0C AFBF005C */  sw         $ra, 0x5c($sp)
/* 8A810 80089C10 AFBE0058 */  sw         $fp, 0x58($sp)
/* 8A814 80089C14 AFB70054 */  sw         $s7, 0x54($sp)
/* 8A818 80089C18 AFB5004C */  sw         $s5, 0x4c($sp)
/* 8A81C 80089C1C AFB40048 */  sw         $s4, 0x48($sp)
/* 8A820 80089C20 AFB30044 */  sw         $s3, 0x44($sp)
/* 8A824 80089C24 AFB20040 */  sw         $s2, 0x40($sp)
/* 8A828 80089C28 AFB1003C */  sw         $s1, 0x3c($sp)
/* 8A82C 80089C2C AFB00038 */  sw         $s0, 0x38($sp)
/* 8A830 80089C30 8EC30088 */  lw         $v1, 0x88($s6)
/* 8A834 80089C34 24020001 */  addiu      $v0, $zero, 1
/* 8A838 80089C38 10600015 */  beqz       $v1, .L80089C90
/* 8A83C 80089C3C A2C20087 */   sb        $v0, 0x87($s6)
/* 8A840 80089C40 0C0290E2 */  jal        get_borg_8
/* 8A844 80089C44 240400E5 */   addiu     $a0, $zero, 0xe5
/* 8A848 80089C48 00408021 */  addu       $s0, $v0, $zero
/* 8A84C 80089C4C 02C02021 */  addu       $a0, $s6, $zero
/* 8A850 80089C50 02002821 */  addu       $a1, $s0, $zero
/* 8A854 80089C54 96C60060 */  lhu        $a2, 0x60($s6)
/* 8A858 80089C58 9602000A */  lhu        $v0, 0xa($s0)
/* 8A85C 80089C5C 96C70062 */  lhu        $a3, 0x62($s6)
/* 8A860 80089C60 24C6FFF4 */  addiu      $a2, $a2, -0xc
/* 8A864 80089C64 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8A868 80089C68 2442FFF4 */  addiu      $v0, $v0, -0xc
/* 8A86C 80089C6C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A870 80089C70 24E7FFF9 */  addiu      $a3, $a3, -7
/* 8A874 80089C74 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A878 80089C78 9602000C */  lhu        $v0, 0xc($s0)
/* 8A87C 80089C7C 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8A880 80089C80 2442FFF9 */  addiu      $v0, $v0, -7
/* 8A884 80089C84 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A888 80089C88 0C02F40F */  jal        func_800BD03C
/* 8A88C 80089C8C AFA20014 */   sw        $v0, 0x14($sp)
.L80089C90:
/* 8A890 80089C90 0C0290E2 */  jal        get_borg_8
/* 8A894 80089C94 240400E3 */   addiu     $a0, $zero, 0xe3
/* 8A898 80089C98 00408021 */  addu       $s0, $v0, $zero
/* 8A89C 80089C9C 02C02021 */  addu       $a0, $s6, $zero
/* 8A8A0 80089CA0 02002821 */  addu       $a1, $s0, $zero
/* 8A8A4 80089CA4 96C20060 */  lhu        $v0, 0x60($s6)
/* 8A8A8 80089CA8 9603000A */  lhu        $v1, 0xa($s0)
/* 8A8AC 80089CAC 00403021 */  addu       $a2, $v0, $zero
/* 8A8B0 80089CB0 00431021 */  addu       $v0, $v0, $v1
/* 8A8B4 80089CB4 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A8B8 80089CB8 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A8BC 80089CBC 96C20062 */  lhu        $v0, 0x62($s6)
/* 8A8C0 80089CC0 9603000C */  lhu        $v1, 0xc($s0)
/* 8A8C4 80089CC4 96C70062 */  lhu        $a3, 0x62($s6)
/* 8A8C8 80089CC8 00431021 */  addu       $v0, $v0, $v1
/* 8A8CC 80089CCC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A8D0 80089CD0 0C02F40F */  jal        func_800BD03C
/* 8A8D4 80089CD4 AFA20014 */   sw        $v0, 0x14($sp)
/* 8A8D8 80089CD8 96D30062 */  lhu        $s3, 0x62($s6)
/* 8A8DC 80089CDC 9602000C */  lhu        $v0, 0xc($s0)
/* 8A8E0 80089CE0 240400F7 */  addiu      $a0, $zero, 0xf7
/* 8A8E4 80089CE4 02629821 */  addu       $s3, $s3, $v0
/* 8A8E8 80089CE8 0C0290E2 */  jal        get_borg_8
/* 8A8EC 80089CEC 3273FFFF */   andi      $s3, $s3, 0xffff
/* 8A8F0 80089CF0 00408021 */  addu       $s0, $v0, $zero
/* 8A8F4 80089CF4 02C02021 */  addu       $a0, $s6, $zero
/* 8A8F8 80089CF8 02002821 */  addu       $a1, $s0, $zero
/* 8A8FC 80089CFC 96C30060 */  lhu        $v1, 0x60($s6)
/* 8A900 80089D00 9602000A */  lhu        $v0, 0xa($s0)
/* 8A904 80089D04 96C80062 */  lhu        $t0, 0x62($s6)
/* 8A908 80089D08 24630067 */  addiu      $v1, $v1, 0x67
/* 8A90C 80089D0C 00021042 */  srl        $v0, $v0, 1
/* 8A910 80089D10 00623023 */  subu       $a2, $v1, $v0
/* 8A914 80089D14 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8A918 80089D18 00431021 */  addu       $v0, $v0, $v1
/* 8A91C 80089D1C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A920 80089D20 2508000D */  addiu      $t0, $t0, 0xd
/* 8A924 80089D24 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A928 80089D28 9602000C */  lhu        $v0, 0xc($s0)
/* 8A92C 80089D2C 3107FFFF */  andi       $a3, $t0, 0xffff
/* 8A930 80089D30 00481021 */  addu       $v0, $v0, $t0
/* 8A934 80089D34 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8A938 80089D38 0C02F40F */  jal        func_800BD03C
/* 8A93C 80089D3C AFA20014 */   sw        $v0, 0x14($sp)
/* 8A940 80089D40 02C02021 */  addu       $a0, $s6, $zero
/* 8A944 80089D44 24020067 */  addiu      $v0, $zero, 0x67
/* 8A948 80089D48 24030046 */  addiu      $v1, $zero, 0x46
/* 8A94C 80089D4C 2414003C */  addiu      $s4, $zero, 0x3c
/* 8A950 80089D50 241200FF */  addiu      $s2, $zero, 0xff
/* 8A954 80089D54 9611000C */  lhu        $s1, 0xc($s0)
/* 8A958 80089D58 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8A95C 80089D5C AFA20010 */  sw         $v0, 0x10($sp)
/* 8A960 80089D60 AFA30014 */  sw         $v1, 0x14($sp)
/* 8A964 80089D64 AFB40018 */  sw         $s4, 0x18($sp)
/* 8A968 80089D68 96C60060 */  lhu        $a2, 0x60($s6)
/* 8A96C 80089D6C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8A970 80089D70 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8A974 80089D74 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A978 80089D78 96C30062 */  lhu        $v1, 0x62($s6)
/* 8A97C 80089D7C 24C6000A */  addiu      $a2, $a2, 0xa
/* 8A980 80089D80 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8A984 80089D84 02238821 */  addu       $s1, $s1, $v1
/* 8A988 80089D88 26310016 */  addiu      $s1, $s1, 0x16
/* 8A98C 80089D8C 3231FFFF */  andi       $s1, $s1, 0xffff
/* 8A990 80089D90 8C4505F0 */  lw         $a1, 0x5f0($v0)
/* 8A994 80089D94 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8A998 80089D98 02203821 */   addu      $a3, $s1, $zero
/* 8A99C 80089D9C 02C02021 */  addu       $a0, $s6, $zero
/* 8A9A0 80089DA0 02203821 */  addu       $a3, $s1, $zero
/* 8A9A4 80089DA4 24020067 */  addiu      $v0, $zero, 0x67
/* 8A9A8 80089DA8 24030046 */  addiu      $v1, $zero, 0x46
/* 8A9AC 80089DAC AFA20010 */  sw         $v0, 0x10($sp)
/* 8A9B0 80089DB0 AFA30014 */  sw         $v1, 0x14($sp)
/* 8A9B4 80089DB4 AFB40018 */  sw         $s4, 0x18($sp)
/* 8A9B8 80089DB8 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8A9BC 80089DBC 96C60060 */  lhu        $a2, 0x60($s6)
/* 8A9C0 80089DC0 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A9C4 80089DC4 24C60026 */  addiu      $a2, $a2, 0x26
/* 8A9C8 80089DC8 8C45061C */  lw         $a1, 0x61c($v0)
/* 8A9CC 80089DCC 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8A9D0 80089DD0 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 8A9D4 80089DD4 02C02021 */  addu       $a0, $s6, $zero
/* 8A9D8 80089DD8 02203821 */  addu       $a3, $s1, $zero
/* 8A9DC 80089DDC 24020067 */  addiu      $v0, $zero, 0x67
/* 8A9E0 80089DE0 24030046 */  addiu      $v1, $zero, 0x46
/* 8A9E4 80089DE4 AFA20010 */  sw         $v0, 0x10($sp)
/* 8A9E8 80089DE8 AFA30014 */  sw         $v1, 0x14($sp)
/* 8A9EC 80089DEC AFB40018 */  sw         $s4, 0x18($sp)
/* 8A9F0 80089DF0 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8A9F4 80089DF4 96C60060 */  lhu        $a2, 0x60($s6)
/* 8A9F8 80089DF8 8E02204C */  lw         $v0, 0x204c($s0)
/* 8A9FC 80089DFC 24C60092 */  addiu      $a2, $a2, 0x92
/* 8AA00 80089E00 8C4505F4 */  lw         $a1, 0x5f4($v0)
/* 8AA04 80089E04 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AA08 80089E08 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 8AA0C 80089E0C 02C02021 */  addu       $a0, $s6, $zero
/* 8AA10 80089E10 02203821 */  addu       $a3, $s1, $zero
/* 8AA14 80089E14 24020067 */  addiu      $v0, $zero, 0x67
/* 8AA18 80089E18 24030046 */  addiu      $v1, $zero, 0x46
/* 8AA1C 80089E1C AFA20010 */  sw         $v0, 0x10($sp)
/* 8AA20 80089E20 AFA30014 */  sw         $v1, 0x14($sp)
/* 8AA24 80089E24 AFB40018 */  sw         $s4, 0x18($sp)
/* 8AA28 80089E28 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8AA2C 80089E2C 96C60060 */  lhu        $a2, 0x60($s6)
/* 8AA30 80089E30 8E02204C */  lw         $v0, 0x204c($s0)
/* 8AA34 80089E34 24C600A5 */  addiu      $a2, $a2, 0xa5
/* 8AA38 80089E38 8C4505F8 */  lw         $a1, 0x5f8($v0)
/* 8AA3C 80089E3C 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AA40 80089E40 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 8AA44 80089E44 02C02021 */  addu       $a0, $s6, $zero
/* 8AA48 80089E48 00003021 */  addu       $a2, $zero, $zero
/* 8AA4C 80089E4C 8E02204C */  lw         $v0, 0x204c($s0)
/* 8AA50 80089E50 24030067 */  addiu      $v1, $zero, 0x67
/* 8AA54 80089E54 AFA30010 */  sw         $v1, 0x10($sp)
/* 8AA58 80089E58 24030046 */  addiu      $v1, $zero, 0x46
/* 8AA5C 80089E5C 2670FFEC */  addiu      $s0, $s3, -0x14
/* 8AA60 80089E60 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8AA64 80089E64 AFA30014 */  sw         $v1, 0x14($sp)
/* 8AA68 80089E68 AFB40018 */  sw         $s4, 0x18($sp)
/* 8AA6C 80089E6C AFB2001C */  sw         $s2, 0x1c($sp)
/* 8AA70 80089E70 8C4505FC */  lw         $a1, 0x5fc($v0)
/* 8AA74 80089E74 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AA78 80089E78 02003821 */   addu      $a3, $s0, $zero
/* 8AA7C 80089E7C 0040F021 */  addu       $fp, $v0, $zero
/* 8AA80 80089E80 8FC30078 */  lw         $v1, 0x78($fp)
/* 8AA84 80089E84 84640018 */  lh         $a0, 0x18($v1)
/* 8AA88 80089E88 8C62001C */  lw         $v0, 0x1c($v1)
/* 8AA8C 80089E8C 0040F809 */  jalr       $v0
/* 8AA90 80089E90 03C42021 */   addu      $a0, $fp, $a0
/* 8AA94 80089E94 00021400 */  sll        $v0, $v0, 0x10
/* 8AA98 80089E98 00021403 */  sra        $v0, $v0, 0x10
/* 8AA9C 80089E9C 96C30060 */  lhu        $v1, 0x60($s6)
/* 8AAA0 80089EA0 8FC50078 */  lw         $a1, 0x78($fp)
/* 8AAA4 80089EA4 00621823 */  subu       $v1, $v1, $v0
/* 8AAA8 80089EA8 246300B3 */  addiu      $v1, $v1, 0xb3
/* 8AAAC 80089EAC A7C30060 */  sh         $v1, 0x60($fp)
/* 8AAB0 80089EB0 84A40018 */  lh         $a0, 0x18($a1)
/* 8AAB4 80089EB4 8CA2001C */  lw         $v0, 0x1c($a1)
/* 8AAB8 80089EB8 0040F809 */  jalr       $v0
/* 8AABC 80089EBC 03C42021 */   addu      $a0, $fp, $a0
/* 8AAC0 80089EC0 02C02021 */  addu       $a0, $s6, $zero
/* 8AAC4 80089EC4 3C03800F */  lui        $v1, %hi(D_800F1C70)
/* 8AAC8 80089EC8 02003821 */  addu       $a3, $s0, $zero
/* 8AACC 80089ECC 8C651C70 */  lw         $a1, %lo(D_800F1C70)($v1)
/* 8AAD0 80089ED0 97C60060 */  lhu        $a2, 0x60($fp)
/* 8AAD4 80089ED4 24030067 */  addiu      $v1, $zero, 0x67
/* 8AAD8 80089ED8 AFA30010 */  sw         $v1, 0x10($sp)
/* 8AADC 80089EDC 24030046 */  addiu      $v1, $zero, 0x46
/* 8AAE0 80089EE0 AFA30014 */  sw         $v1, 0x14($sp)
/* 8AAE4 80089EE4 AFB40018 */  sw         $s4, 0x18($sp)
/* 8AAE8 80089EE8 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8AAEC 80089EEC 00C23021 */  addu       $a2, $a2, $v0
/* 8AAF0 80089EF0 24C6FFFB */  addiu      $a2, $a2, -5
/* 8AAF4 80089EF4 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AAF8 80089EF8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 8AAFC 80089EFC 8C430078 */  lw         $v1, 0x78($v0)
/* 8AB00 80089F00 AEC2007C */  sw         $v0, 0x7c($s6)
/* 8AB04 80089F04 84640020 */  lh         $a0, 0x20($v1)
/* 8AB08 80089F08 8C650024 */  lw         $a1, 0x24($v1)
/* 8AB0C 80089F0C 00A0F809 */  jalr       $a1
/* 8AB10 80089F10 00442021 */   addu      $a0, $v0, $a0
/* 8AB14 80089F14 02228021 */  addu       $s0, $s1, $v0
/* 8AB18 80089F18 8EC3007C */  lw         $v1, 0x7c($s6)
/* 8AB1C 80089F1C 26100002 */  addiu      $s0, $s0, 2
/* 8AB20 80089F20 8C650078 */  lw         $a1, 0x78($v1)
/* 8AB24 80089F24 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8AB28 80089F28 84A40020 */  lh         $a0, 0x20($a1)
/* 8AB2C 80089F2C 8CA20024 */  lw         $v0, 0x24($a1)
/* 8AB30 80089F30 0040F809 */  jalr       $v0
/* 8AB34 80089F34 00642021 */   addu      $a0, $v1, $a0
/* 8AB38 80089F38 02C02021 */  addu       $a0, $s6, $zero
/* 8AB3C 80089F3C 24050010 */  addiu      $a1, $zero, 0x10
/* 8AB40 80089F40 02003821 */  addu       $a3, $s0, $zero
/* 8AB44 80089F44 02228821 */  addu       $s1, $s1, $v0
/* 8AB48 80089F48 26310002 */  addiu      $s1, $s1, 2
/* 8AB4C 80089F4C 96C20060 */  lhu        $v0, 0x60($s6)
/* 8AB50 80089F50 3231FFFF */  andi       $s1, $s1, 0xffff
/* 8AB54 80089F54 AFB10014 */  sw         $s1, 0x14($sp)
/* 8AB58 80089F58 24460005 */  addiu      $a2, $v0, 5
/* 8AB5C 80089F5C 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8AB60 80089F60 244200C7 */  addiu      $v0, $v0, 0xc7
/* 8AB64 80089F64 AFA60010 */  sw         $a2, 0x10($sp)
/* 8AB68 80089F68 8EC8007C */  lw         $t0, 0x7c($s6)
/* 8AB6C 80089F6C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8AB70 80089F70 AFA20018 */  sw         $v0, 0x18($sp)
/* 8AB74 80089F74 95030062 */  lhu        $v1, 0x62($t0)
/* 8AB78 80089F78 24020067 */  addiu      $v0, $zero, 0x67
/* 8AB7C 80089F7C AFA20020 */  sw         $v0, 0x20($sp)
/* 8AB80 80089F80 24020046 */  addiu      $v0, $zero, 0x46
/* 8AB84 80089F84 AFA20024 */  sw         $v0, 0x24($sp)
/* 8AB88 80089F88 AFB40028 */  sw         $s4, 0x28($sp)
/* 8AB8C 80089F8C AFB2002C */  sw         $s2, 0x2c($sp)
/* 8AB90 80089F90 AFA00030 */  sw         $zero, 0x30($sp)
/* 8AB94 80089F94 2463FFF9 */  addiu      $v1, $v1, -7
/* 8AB98 80089F98 3063FFFF */  andi       $v1, $v1, 0xffff
/* 8AB9C 80089F9C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 8ABA0 80089FA0 AFA3001C */   sw        $v1, 0x1c($sp)
/* 8ABA4 80089FA4 00402021 */  addu       $a0, $v0, $zero
/* 8ABA8 80089FA8 24050044 */  addiu      $a1, $zero, 0x44
/* 8ABAC 80089FAC 2406002A */  addiu      $a2, $zero, 0x2a
/* 8ABB0 80089FB0 24070022 */  addiu      $a3, $zero, 0x22
/* 8ABB4 80089FB4 AEC20080 */  sw         $v0, 0x80($s6)
/* 8ABB8 80089FB8 24020097 */  addiu      $v0, $zero, 0x97
/* 8ABBC 80089FBC 2403008D */  addiu      $v1, $zero, 0x8d
/* 8ABC0 80089FC0 AFA20014 */  sw         $v0, 0x14($sp)
/* 8ABC4 80089FC4 240200BF */  addiu      $v0, $zero, 0xbf
/* 8ABC8 80089FC8 AFA2001C */  sw         $v0, 0x1c($sp)
/* 8ABCC 80089FCC 24020014 */  addiu      $v0, $zero, 0x14
/* 8ABD0 80089FD0 AFB20010 */  sw         $s2, 0x10($sp)
/* 8ABD4 80089FD4 AFA30018 */  sw         $v1, 0x18($sp)
/* 8ABD8 80089FD8 AFB20020 */  sw         $s2, 0x20($sp)
/* 8ABDC 80089FDC 0C02F085 */  jal        set_widgetSubstruct8
/* 8ABE0 80089FE0 AFA20024 */   sw        $v0, 0x24($sp)
/* 8ABE4 80089FE4 02C02021 */  addu       $a0, $s6, $zero
/* 8ABE8 80089FE8 3C05800E */  lui        $a1, %hi(D_800E1490)
/* 8ABEC 80089FEC 24A51490 */  addiu      $a1, $a1, %lo(D_800E1490)
/* 8ABF0 80089FF0 2673FFE5 */  addiu      $s3, $s3, -0x1b
/* 8ABF4 80089FF4 00139C00 */  sll        $s3, $s3, 0x10
/* 8ABF8 80089FF8 00139C03 */  sra        $s3, $s3, 0x10
/* 8ABFC 80089FFC 3271FFFF */  andi       $s1, $s3, 0xffff
/* 8AC00 8008A000 02203821 */  addu       $a3, $s1, $zero
/* 8AC04 8008A004 AFA00010 */  sw         $zero, 0x10($sp)
/* 8AC08 8008A008 AFA00014 */  sw         $zero, 0x14($sp)
/* 8AC0C 8008A00C 96D00060 */  lhu        $s0, 0x60($s6)
/* 8AC10 8008A010 241500A4 */  addiu      $s5, $zero, 0xa4
/* 8AC14 8008A014 AFB50018 */  sw         $s5, 0x18($sp)
/* 8AC18 8008A018 AFB2001C */  sw         $s2, 0x1c($sp)
/* 8AC1C 8008A01C 2610000A */  addiu      $s0, $s0, 0xa
/* 8AC20 8008A020 00108400 */  sll        $s0, $s0, 0x10
/* 8AC24 8008A024 00108403 */  sra        $s0, $s0, 0x10
/* 8AC28 8008A028 3217FFFF */  andi       $s7, $s0, 0xffff
/* 8AC2C 8008A02C 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AC30 8008A030 02E03021 */   addu      $a2, $s7, $zero
/* 8AC34 8008A034 0040F021 */  addu       $fp, $v0, $zero
/* 8AC38 8008A038 8FC30078 */  lw         $v1, 0x78($fp)
/* 8AC3C 8008A03C 84640018 */  lh         $a0, 0x18($v1)
/* 8AC40 8008A040 8C62001C */  lw         $v0, 0x1c($v1)
/* 8AC44 8008A044 0040F809 */  jalr       $v0
/* 8AC48 8008A048 03C42021 */   addu      $a0, $fp, $a0
/* 8AC4C 8008A04C 02C02021 */  addu       $a0, $s6, $zero
/* 8AC50 8008A050 3C05800E */  lui        $a1, %hi(D_800E1494)
/* 8AC54 8008A054 24A51494 */  addiu      $a1, $a1, %lo(D_800E1494)
/* 8AC58 8008A058 00501021 */  addu       $v0, $v0, $s0
/* 8AC5C 8008A05C 3046FFFF */  andi       $a2, $v0, 0xffff
/* 8AC60 8008A060 02203821 */  addu       $a3, $s1, $zero
/* 8AC64 8008A064 24030067 */  addiu      $v1, $zero, 0x67
/* 8AC68 8008A068 24020046 */  addiu      $v0, $zero, 0x46
/* 8AC6C 8008A06C AFA30010 */  sw         $v1, 0x10($sp)
/* 8AC70 8008A070 AFA20014 */  sw         $v0, 0x14($sp)
/* 8AC74 8008A074 AFB40018 */  sw         $s4, 0x18($sp)
/* 8AC78 8008A078 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AC7C 8008A07C AFB2001C */   sw        $s2, 0x1c($sp)
/* 8AC80 8008A080 8FC30078 */  lw         $v1, 0x78($fp)
/* 8AC84 8008A084 84640020 */  lh         $a0, 0x20($v1)
/* 8AC88 8008A088 8C620024 */  lw         $v0, 0x24($v1)
/* 8AC8C 8008A08C 0040F809 */  jalr       $v0
/* 8AC90 8008A090 03C42021 */   addu      $a0, $fp, $a0
/* 8AC94 8008A094 02C02021 */  addu       $a0, $s6, $zero
/* 8AC98 8008A098 3C05800E */  lui        $a1, %hi(D_800E149C)
/* 8AC9C 8008A09C 24A5149C */  addiu      $a1, $a1, %lo(D_800E149C)
/* 8ACA0 8008A0A0 02E03021 */  addu       $a2, $s7, $zero
/* 8ACA4 8008A0A4 00538821 */  addu       $s1, $v0, $s3
/* 8ACA8 8008A0A8 3231FFFF */  andi       $s1, $s1, 0xffff
/* 8ACAC 8008A0AC 02203821 */  addu       $a3, $s1, $zero
/* 8ACB0 8008A0B0 AFA00010 */  sw         $zero, 0x10($sp)
/* 8ACB4 8008A0B4 AFB50014 */  sw         $s5, 0x14($sp)
/* 8ACB8 8008A0B8 AFA00018 */  sw         $zero, 0x18($sp)
/* 8ACBC 8008A0BC 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8ACC0 8008A0C0 AFB2001C */   sw        $s2, 0x1c($sp)
/* 8ACC4 8008A0C4 0040F021 */  addu       $fp, $v0, $zero
/* 8ACC8 8008A0C8 8FC30078 */  lw         $v1, 0x78($fp)
/* 8ACCC 8008A0CC 84640018 */  lh         $a0, 0x18($v1)
/* 8ACD0 8008A0D0 8C62001C */  lw         $v0, 0x1c($v1)
/* 8ACD4 8008A0D4 0040F809 */  jalr       $v0
/* 8ACD8 8008A0D8 03C42021 */   addu      $a0, $fp, $a0
/* 8ACDC 8008A0DC 02C02021 */  addu       $a0, $s6, $zero
/* 8ACE0 8008A0E0 3C05800E */  lui        $a1, %hi(D_800E14A0)
/* 8ACE4 8008A0E4 24A514A0 */  addiu      $a1, $a1, %lo(D_800E14A0)
/* 8ACE8 8008A0E8 00501021 */  addu       $v0, $v0, $s0
/* 8ACEC 8008A0EC 3046FFFF */  andi       $a2, $v0, 0xffff
/* 8ACF0 8008A0F0 02203821 */  addu       $a3, $s1, $zero
/* 8ACF4 8008A0F4 24030067 */  addiu      $v1, $zero, 0x67
/* 8ACF8 8008A0F8 24020046 */  addiu      $v0, $zero, 0x46
/* 8ACFC 8008A0FC AFA30010 */  sw         $v1, 0x10($sp)
/* 8AD00 8008A100 AFA20014 */  sw         $v0, 0x14($sp)
/* 8AD04 8008A104 AFB40018 */  sw         $s4, 0x18($sp)
/* 8AD08 8008A108 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 8AD0C 8008A10C AFB2001C */   sw        $s2, 0x1c($sp)
/* 8AD10 8008A110 8FBF005C */  lw         $ra, 0x5c($sp)
/* 8AD14 8008A114 8FBE0058 */  lw         $fp, 0x58($sp)
/* 8AD18 8008A118 8FB70054 */  lw         $s7, 0x54($sp)
/* 8AD1C 8008A11C 8FB60050 */  lw         $s6, 0x50($sp)
/* 8AD20 8008A120 8FB5004C */  lw         $s5, 0x4c($sp)
/* 8AD24 8008A124 8FB40048 */  lw         $s4, 0x48($sp)
/* 8AD28 8008A128 8FB30044 */  lw         $s3, 0x44($sp)
/* 8AD2C 8008A12C 8FB20040 */  lw         $s2, 0x40($sp)
/* 8AD30 8008A130 8FB1003C */  lw         $s1, 0x3c($sp)
/* 8AD34 8008A134 8FB00038 */  lw         $s0, 0x38($sp)
/* 8AD38 8008A138 03E00008 */  jr         $ra
/* 8AD3C 8008A13C 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8008A140
/* 8AD40 8008A140 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8AD44 8008A144 AFB00018 */  sw         $s0, 0x18($sp)
/* 8AD48 8008A148 00808021 */  addu       $s0, $a0, $zero
/* 8AD4C 8008A14C 27A40010 */  addiu      $a0, $sp, 0x10
/* 8AD50 8008A150 00002821 */  addu       $a1, $zero, $zero
/* 8AD54 8008A154 24020004 */  addiu      $v0, $zero, 4
/* 8AD58 8008A158 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8AD5C 8008A15C A2020084 */  sb         $v0, 0x84($s0)
/* 8AD60 8008A160 A2000086 */  sb         $zero, 0x86($s0)
/* 8AD64 8008A164 0C026F1B */  jal        get_contpak_freespace
/* 8AD68 8008A168 A3A00010 */   sb        $zero, 0x10($sp)
/* 8AD6C 8008A16C A2020085 */  sb         $v0, 0x85($s0)
/* 8AD70 8008A170 304200FF */  andi       $v0, $v0, 0xff
/* 8AD74 8008A174 24030006 */  addiu      $v1, $zero, 6
/* 8AD78 8008A178 54430006 */  bnel       $v0, $v1, .L8008A194
/* 8AD7C 8008A17C 92020085 */   lbu       $v0, 0x85($s0)
/* 8AD80 8008A180 27A40010 */  addiu      $a0, $sp, 0x10
/* 8AD84 8008A184 0C026F1B */  jal        get_contpak_freespace
/* 8AD88 8008A188 00002821 */   addu      $a1, $zero, $zero
/* 8AD8C 8008A18C A2020085 */  sb         $v0, 0x85($s0)
/* 8AD90 8008A190 92020085 */  lbu        $v0, 0x85($s0)
.L8008A194:
/* 8AD94 8008A194 10400003 */  beqz       $v0, .L8008A1A4
/* 8AD98 8008A198 24020001 */   addiu     $v0, $zero, 1
/* 8AD9C 8008A19C 08022870 */  j          .L8008A1C0
/* 8ADA0 8008A1A0 A2020084 */   sb        $v0, 0x84($s0)
.L8008A1A4:
/* 8ADA4 8008A1A4 0C02EEBC */  jal        func_800BBAF0
/* 8ADA8 8008A1A8 8E04007C */   lw        $a0, 0x7c($s0)
/* 8ADAC 8008A1AC 00402021 */  addu       $a0, $v0, $zero
/* 8ADB0 8008A1B0 3C05800E */  lui        $a1, %hi(D_800E14A8)
/* 8ADB4 8008A1B4 93A60010 */  lbu        $a2, 0x10($sp)
/* 8ADB8 8008A1B8 0C0333AC */  jal        sprintf
/* 8ADBC 8008A1BC 24A514A8 */   addiu     $a1, $a1, %lo(D_800E14A8)
.L8008A1C0:
/* 8ADC0 8008A1C0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8ADC4 8008A1C4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8ADC8 8008A1C8 03E00008 */  jr         $ra
/* 8ADCC 8008A1CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel print_memcard_file
/* 8ADD0 8008A1D0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 8ADD4 8008A1D4 AFBE0038 */  sw         $fp, 0x38($sp)
/* 8ADD8 8008A1D8 0080F021 */  addu       $fp, $a0, $zero
/* 8ADDC 8008A1DC AFB70034 */  sw         $s7, 0x34($sp)
/* 8ADE0 8008A1E0 97B70052 */  lhu        $s7, 0x52($sp)
/* 8ADE4 8008A1E4 24040088 */  addiu      $a0, $zero, 0x88
/* 8ADE8 8008A1E8 AFB40028 */  sw         $s4, 0x28($sp)
/* 8ADEC 8008A1EC 00C0A021 */  addu       $s4, $a2, $zero
/* 8ADF0 8008A1F0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 8ADF4 8008A1F4 00E0A821 */  addu       $s5, $a3, $zero
/* 8ADF8 8008A1F8 AFB60030 */  sw         $s6, 0x30($sp)
/* 8ADFC 8008A1FC 30B600FF */  andi       $s6, $a1, 0xff
/* 8AE00 8008A200 AFBF003C */  sw         $ra, 0x3c($sp)
/* 8AE04 8008A204 AFB30024 */  sw         $s3, 0x24($sp)
/* 8AE08 8008A208 AFB20020 */  sw         $s2, 0x20($sp)
/* 8AE0C 8008A20C AFB1001C */  sw         $s1, 0x1c($sp)
/* 8AE10 8008A210 0C026259 */  jal        passToMalloc
/* 8AE14 8008A214 AFB00018 */   sw        $s0, 0x18($sp)
/* 8AE18 8008A218 00402021 */  addu       $a0, $v0, $zero
/* 8AE1C 8008A21C 0C00C850 */  jal        init_widget_grouo
/* 8AE20 8008A220 24050004 */   addiu     $a1, $zero, 4
/* 8AE24 8008A224 3C11800F */  lui        $s1, %hi(gGlobalsText)
/* 8AE28 8008A228 26318920 */  addiu      $s1, $s1, %lo(gGlobalsText)
/* 8AE2C 8008A22C 02202021 */  addu       $a0, $s1, $zero
/* 8AE30 8008A230 3C13800E */  lui        $s3, %hi(D_800E14A8)
/* 8AE34 8008A234 267314A8 */  addiu      $s3, $s3, %lo(D_800E14A8)
/* 8AE38 8008A238 02602821 */  addu       $a1, $s3, $zero
/* 8AE3C 8008A23C 26C60001 */  addiu      $a2, $s6, 1
/* 8AE40 8008A240 0C0333AC */  jal        sprintf
/* 8AE44 8008A244 00408021 */   addu      $s0, $v0, $zero
/* 8AE48 8008A248 0C026259 */  jal        passToMalloc
/* 8AE4C 8008A24C 2404007C */   addiu     $a0, $zero, 0x7c
/* 8AE50 8008A250 00402021 */  addu       $a0, $v0, $zero
/* 8AE54 8008A254 02202821 */  addu       $a1, $s1, $zero
/* 8AE58 8008A258 0C02E3A0 */  jal        widgettext_func_2
/* 8AE5C 8008A25C 24060190 */   addiu     $a2, $zero, 0x190
/* 8AE60 8008A260 02002021 */  addu       $a0, $s0, $zero
/* 8AE64 8008A264 00402821 */  addu       $a1, $v0, $zero
/* 8AE68 8008A268 2406000F */  addiu      $a2, $zero, 0xf
/* 8AE6C 8008A26C 00003821 */  addu       $a3, $zero, $zero
/* 8AE70 8008A270 24120001 */  addiu      $s2, $zero, 1
/* 8AE74 8008A274 0C00C9A6 */  jal        func_80032698
/* 8AE78 8008A278 AFB20010 */   sw        $s2, 0x10($sp)
/* 8AE7C 8008A27C 0C026259 */  jal        passToMalloc
/* 8AE80 8008A280 2404007C */   addiu     $a0, $zero, 0x7c
/* 8AE84 8008A284 00402021 */  addu       $a0, $v0, $zero
/* 8AE88 8008A288 02802821 */  addu       $a1, $s4, $zero
/* 8AE8C 8008A28C 0C02E3A0 */  jal        widgettext_func_2
/* 8AE90 8008A290 24060190 */   addiu     $a2, $zero, 0x190
/* 8AE94 8008A294 02002021 */  addu       $a0, $s0, $zero
/* 8AE98 8008A298 00402821 */  addu       $a1, $v0, $zero
/* 8AE9C 8008A29C 24060021 */  addiu      $a2, $zero, 0x21
/* 8AEA0 8008A2A0 00003821 */  addu       $a3, $zero, $zero
/* 8AEA4 8008A2A4 0C00C9A6 */  jal        func_80032698
/* 8AEA8 8008A2A8 AFB20010 */   sw        $s2, 0x10($sp)
/* 8AEAC 8008A2AC 0C026259 */  jal        passToMalloc
/* 8AEB0 8008A2B0 2404007C */   addiu     $a0, $zero, 0x7c
/* 8AEB4 8008A2B4 00402021 */  addu       $a0, $v0, $zero
/* 8AEB8 8008A2B8 02A02821 */  addu       $a1, $s5, $zero
/* 8AEBC 8008A2BC 0C02E3A0 */  jal        widgettext_func_2
/* 8AEC0 8008A2C0 24060190 */   addiu     $a2, $zero, 0x190
/* 8AEC4 8008A2C4 02002021 */  addu       $a0, $s0, $zero
/* 8AEC8 8008A2C8 00402821 */  addu       $a1, $v0, $zero
/* 8AECC 8008A2CC 24060096 */  addiu      $a2, $zero, 0x96
/* 8AED0 8008A2D0 00003821 */  addu       $a3, $zero, $zero
/* 8AED4 8008A2D4 0C00C9A6 */  jal        func_80032698
/* 8AED8 8008A2D8 AFB20010 */   sw        $s2, 0x10($sp)
/* 8AEDC 8008A2DC 02202021 */  addu       $a0, $s1, $zero
/* 8AEE0 8008A2E0 02602821 */  addu       $a1, $s3, $zero
/* 8AEE4 8008A2E4 0C0333AC */  jal        sprintf
/* 8AEE8 8008A2E8 00173202 */   srl       $a2, $s7, 8
/* 8AEEC 8008A2EC 0C026259 */  jal        passToMalloc
/* 8AEF0 8008A2F0 2404007C */   addiu     $a0, $zero, 0x7c
/* 8AEF4 8008A2F4 00402021 */  addu       $a0, $v0, $zero
/* 8AEF8 8008A2F8 02202821 */  addu       $a1, $s1, $zero
/* 8AEFC 8008A2FC 0C02E3A0 */  jal        widgettext_func_2
/* 8AF00 8008A300 24060190 */   addiu     $a2, $zero, 0x190
/* 8AF04 8008A304 02002021 */  addu       $a0, $s0, $zero
/* 8AF08 8008A308 00402821 */  addu       $a1, $v0, $zero
/* 8AF0C 8008A30C 240600A9 */  addiu      $a2, $zero, 0xa9
/* 8AF10 8008A310 00003821 */  addu       $a3, $zero, $zero
/* 8AF14 8008A314 0C00C9A6 */  jal        func_80032698
/* 8AF18 8008A318 AFB20010 */   sw        $s2, 0x10($sp)
/* 8AF1C 8008A31C 8FC40080 */  lw         $a0, 0x80($fp)
/* 8AF20 8008A320 0C02E885 */  jal        link_widget_text
/* 8AF24 8008A324 02002821 */   addu      $a1, $s0, $zero
/* 8AF28 8008A328 8FBF003C */  lw         $ra, 0x3c($sp)
/* 8AF2C 8008A32C 8FBE0038 */  lw         $fp, 0x38($sp)
/* 8AF30 8008A330 8FB70034 */  lw         $s7, 0x34($sp)
/* 8AF34 8008A334 3C028009 */  lui        $v0, 0x8009
/* 8AF38 8008A338 A616005E */  sh         $s6, 0x5e($s0)
/* 8AF3C 8008A33C 8FB60030 */  lw         $s6, 0x30($sp)
/* 8AF40 8008A340 8FB5002C */  lw         $s5, 0x2c($sp)
/* 8AF44 8008A344 8FB40028 */  lw         $s4, 0x28($sp)
/* 8AF48 8008A348 8FB30024 */  lw         $s3, 0x24($sp)
/* 8AF4C 8008A34C 8FB20020 */  lw         $s2, 0x20($sp)
/* 8AF50 8008A350 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8AF54 8008A354 2442A6E8 */  addiu      $v0, $v0, -0x5918
/* 8AF58 8008A358 AE020018 */  sw         $v0, 0x18($s0)
/* 8AF5C 8008A35C 8FB00018 */  lw         $s0, 0x18($sp)
/* 8AF60 8008A360 03E00008 */  jr         $ra
/* 8AF64 8008A364 27BD0040 */   addiu     $sp, $sp, 0x40

glabel print_blank_memPak_entry
/* 8AF68 8008A368 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 8AF6C 8008A36C AFB5002C */  sw         $s5, 0x2c($sp)
/* 8AF70 8008A370 0080A821 */  addu       $s5, $a0, $zero
/* 8AF74 8008A374 24040088 */  addiu      $a0, $zero, 0x88
/* 8AF78 8008A378 AFB40028 */  sw         $s4, 0x28($sp)
/* 8AF7C 8008A37C 30B400FF */  andi       $s4, $a1, 0xff
/* 8AF80 8008A380 AFBF0030 */  sw         $ra, 0x30($sp)
/* 8AF84 8008A384 AFB30024 */  sw         $s3, 0x24($sp)
/* 8AF88 8008A388 AFB20020 */  sw         $s2, 0x20($sp)
/* 8AF8C 8008A38C AFB1001C */  sw         $s1, 0x1c($sp)
/* 8AF90 8008A390 0C026259 */  jal        passToMalloc
/* 8AF94 8008A394 AFB00018 */   sw        $s0, 0x18($sp)
/* 8AF98 8008A398 00402021 */  addu       $a0, $v0, $zero
/* 8AF9C 8008A39C 0C00C850 */  jal        init_widget_grouo
/* 8AFA0 8008A3A0 24050004 */   addiu     $a1, $zero, 4
/* 8AFA4 8008A3A4 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 8AFA8 8008A3A8 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 8AFAC 8008A3AC 02002021 */  addu       $a0, $s0, $zero
/* 8AFB0 8008A3B0 3C05800E */  lui        $a1, %hi(D_800E14A8)
/* 8AFB4 8008A3B4 24A514A8 */  addiu      $a1, $a1, %lo(D_800E14A8)
/* 8AFB8 8008A3B8 26860001 */  addiu      $a2, $s4, 1
/* 8AFBC 8008A3BC 0C0333AC */  jal        sprintf
/* 8AFC0 8008A3C0 00409021 */   addu      $s2, $v0, $zero
/* 8AFC4 8008A3C4 0C026259 */  jal        passToMalloc
/* 8AFC8 8008A3C8 2404007C */   addiu     $a0, $zero, 0x7c
/* 8AFCC 8008A3CC 00402021 */  addu       $a0, $v0, $zero
/* 8AFD0 8008A3D0 02002821 */  addu       $a1, $s0, $zero
/* 8AFD4 8008A3D4 0C02E3A0 */  jal        widgettext_func_2
/* 8AFD8 8008A3D8 24060190 */   addiu     $a2, $zero, 0x190
/* 8AFDC 8008A3DC 02402021 */  addu       $a0, $s2, $zero
/* 8AFE0 8008A3E0 00402821 */  addu       $a1, $v0, $zero
/* 8AFE4 8008A3E4 2406000F */  addiu      $a2, $zero, 0xf
/* 8AFE8 8008A3E8 00003821 */  addu       $a3, $zero, $zero
/* 8AFEC 8008A3EC 24130001 */  addiu      $s3, $zero, 1
/* 8AFF0 8008A3F0 0C00C9A6 */  jal        func_80032698
/* 8AFF4 8008A3F4 AFB30010 */   sw        $s3, 0x10($sp)
/* 8AFF8 8008A3F8 0C026259 */  jal        passToMalloc
/* 8AFFC 8008A3FC 2404007C */   addiu     $a0, $zero, 0x7c
/* 8B000 8008A400 2610DF88 */  addiu      $s0, $s0, -0x2078
/* 8B004 8008A404 8E03204C */  lw         $v1, 0x204c($s0)
/* 8B008 8008A408 8C640664 */  lw         $a0, 0x664($v1)
/* 8B00C 8008A40C 0C03353E */  jal        strlen
/* 8B010 8008A410 00408821 */   addu      $s1, $v0, $zero
/* 8B014 8008A414 02202021 */  addu       $a0, $s1, $zero
/* 8B018 8008A418 8E03204C */  lw         $v1, 0x204c($s0)
/* 8B01C 8008A41C 24420001 */  addiu      $v0, $v0, 1
/* 8B020 8008A420 8C650664 */  lw         $a1, 0x664($v1)
/* 8B024 8008A424 0C02E3A0 */  jal        widgettext_func_2
/* 8B028 8008A428 3046FFFF */   andi      $a2, $v0, 0xffff
/* 8B02C 8008A42C 02402021 */  addu       $a0, $s2, $zero
/* 8B030 8008A430 00402821 */  addu       $a1, $v0, $zero
/* 8B034 8008A434 24060021 */  addiu      $a2, $zero, 0x21
/* 8B038 8008A438 00003821 */  addu       $a3, $zero, $zero
/* 8B03C 8008A43C 0C00C9A6 */  jal        func_80032698
/* 8B040 8008A440 AFB30010 */   sw        $s3, 0x10($sp)
/* 8B044 8008A444 0C026259 */  jal        passToMalloc
/* 8B048 8008A448 2404007C */   addiu     $a0, $zero, 0x7c
/* 8B04C 8008A44C 00402021 */  addu       $a0, $v0, $zero
/* 8B050 8008A450 3C02800F */  lui        $v0, %hi(D_800F1C70)
/* 8B054 8008A454 8C451C70 */  lw         $a1, %lo(D_800F1C70)($v0)
/* 8B058 8008A458 0C02E3A0 */  jal        widgettext_func_2
/* 8B05C 8008A45C 24060190 */   addiu     $a2, $zero, 0x190
/* 8B060 8008A460 02402021 */  addu       $a0, $s2, $zero
/* 8B064 8008A464 00402821 */  addu       $a1, $v0, $zero
/* 8B068 8008A468 24060096 */  addiu      $a2, $zero, 0x96
/* 8B06C 8008A46C 00003821 */  addu       $a3, $zero, $zero
/* 8B070 8008A470 0C00C9A6 */  jal        func_80032698
/* 8B074 8008A474 AFB30010 */   sw        $s3, 0x10($sp)
/* 8B078 8008A478 0C026259 */  jal        passToMalloc
/* 8B07C 8008A47C 2404007C */   addiu     $a0, $zero, 0x7c
/* 8B080 8008A480 00402021 */  addu       $a0, $v0, $zero
/* 8B084 8008A484 3C05800E */  lui        $a1, %hi(D_800E14AC)
/* 8B088 8008A488 24A514AC */  addiu      $a1, $a1, %lo(D_800E14AC)
/* 8B08C 8008A48C 0C02E3A0 */  jal        widgettext_func_2
/* 8B090 8008A490 24060190 */   addiu     $a2, $zero, 0x190
/* 8B094 8008A494 02402021 */  addu       $a0, $s2, $zero
/* 8B098 8008A498 00402821 */  addu       $a1, $v0, $zero
/* 8B09C 8008A49C 240600A9 */  addiu      $a2, $zero, 0xa9
/* 8B0A0 8008A4A0 00003821 */  addu       $a3, $zero, $zero
/* 8B0A4 8008A4A4 0C00C9A6 */  jal        func_80032698
/* 8B0A8 8008A4A8 AFB30010 */   sw        $s3, 0x10($sp)
/* 8B0AC 8008A4AC 8EA40080 */  lw         $a0, 0x80($s5)
/* 8B0B0 8008A4B0 0C02E885 */  jal        link_widget_text
/* 8B0B4 8008A4B4 02402821 */   addu      $a1, $s2, $zero
/* 8B0B8 8008A4B8 8FBF0030 */  lw         $ra, 0x30($sp)
/* 8B0BC 8008A4BC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 8B0C0 8008A4C0 A654005E */  sh         $s4, 0x5e($s2)
/* 8B0C4 8008A4C4 8FB40028 */  lw         $s4, 0x28($sp)
/* 8B0C8 8008A4C8 8FB30024 */  lw         $s3, 0x24($sp)
/* 8B0CC 8008A4CC 8FB20020 */  lw         $s2, 0x20($sp)
/* 8B0D0 8008A4D0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8B0D4 8008A4D4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8B0D8 8008A4D8 03E00008 */  jr         $ra
/* 8B0DC 8008A4DC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8008A4E0
/* 8B0E0 8008A4E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8B0E4 8008A4E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 8B0E8 8008A4E8 00808821 */  addu       $s1, $a0, $zero
/* 8B0EC 8008A4EC 2624008C */  addiu      $a0, $s1, 0x8c
/* 8B0F0 8008A4F0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8B0F4 8008A4F4 0802294B */  j          .L8008A52C
/* 8B0F8 8008A4F8 AFB00010 */   sw        $s0, 0x10($sp)
.L8008A4FC:
/* 8B0FC 8008A4FC 84640080 */  lh         $a0, 0x80($v1)
/* 8B100 8008A500 8C620084 */  lw         $v0, 0x84($v1)
/* 8B104 8008A504 0040F809 */  jalr       $v0
/* 8B108 8008A508 02042021 */   addu      $a0, $s0, $a0
/* 8B10C 8008A50C 12000006 */  beqz       $s0, .L8008A528
/* 8B110 8008A510 24050003 */   addiu     $a1, $zero, 3
/* 8B114 8008A514 8E020078 */  lw         $v0, 0x78($s0)
/* 8B118 8008A518 84440008 */  lh         $a0, 8($v0)
/* 8B11C 8008A51C 8C43000C */  lw         $v1, 0xc($v0)
/* 8B120 8008A520 0060F809 */  jalr       $v1
/* 8B124 8008A524 02042021 */   addu      $a0, $s0, $a0
.L8008A528:
/* 8B128 8008A528 2624008C */  addiu      $a0, $s1, 0x8c
.L8008A52C:
/* 8B12C 8008A52C 0C02DCA5 */  jal        func_800B7294
/* 8B130 8008A530 00000000 */   nop
/* 8B134 8008A534 00408021 */  addu       $s0, $v0, $zero
/* 8B138 8008A538 5600FFF0 */  bnel       $s0, $zero, .L8008A4FC
/* 8B13C 8008A53C 8E030078 */   lw        $v1, 0x78($s0)
/* 8B140 8008A540 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8B144 8008A544 8FB10014 */  lw         $s1, 0x14($sp)
/* 8B148 8008A548 8FB00010 */  lw         $s0, 0x10($sp)
/* 8B14C 8008A54C 03E00008 */  jr         $ra
/* 8B150 8008A550 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008A554
/* 8B154 8008A554 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8B158 8008A558 AFB20018 */  sw         $s2, 0x18($sp)
/* 8B15C 8008A55C 00809021 */  addu       $s2, $a0, $zero
/* 8B160 8008A560 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8B164 8008A564 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8B168 8008A568 AFB10014 */  sw         $s1, 0x14($sp)
/* 8B16C 8008A56C AFB00010 */  sw         $s0, 0x10($sp)
/* 8B170 8008A570 92430084 */  lbu        $v1, 0x84($s2)
/* 8B174 8008A574 24020005 */  addiu      $v0, $zero, 5
/* 8B178 8008A578 54620005 */  bnel       $v1, $v0, .L8008A590
/* 8B17C 8008A57C 00002021 */   addu      $a0, $zero, $zero
/* 8B180 8008A580 0C02257D */  jal        func_800895F4
/* 8B184 8008A584 00000000 */   nop
/* 8B188 8008A588 080229A0 */  j          .L8008A680
/* 8B18C 8008A58C 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008A590:
/* 8B190 8008A590 26500094 */  addiu      $s0, $s2, 0x94
/* 8B194 8008A594 02002821 */  addu       $a1, $s0, $zero
/* 8B198 8008A598 0C0270AC */  jal        controller_query_2
/* 8B19C 8008A59C 92510094 */   lbu       $s1, 0x94($s2)
/* 8B1A0 8008A5A0 5440000A */  bnel       $v0, $zero, .L8008A5CC
/* 8B1A4 8008A5A4 92420094 */   lbu       $v0, 0x94($s2)
/* 8B1A8 8008A5A8 00002021 */  addu       $a0, $zero, $zero
/* 8B1AC 8008A5AC 0C0270AC */  jal        controller_query_2
/* 8B1B0 8008A5B0 02002821 */   addu      $a1, $s0, $zero
/* 8B1B4 8008A5B4 54400005 */  bnel       $v0, $zero, .L8008A5CC
/* 8B1B8 8008A5B8 92420094 */   lbu       $v0, 0x94($s2)
/* 8B1BC 8008A5BC 0C0229B7 */  jal        func_8008A6DC
/* 8B1C0 8008A5C0 02402021 */   addu      $a0, $s2, $zero
/* 8B1C4 8008A5C4 080229A0 */  j          .L8008A680
/* 8B1C8 8008A5C8 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008A5CC:
/* 8B1CC 8008A5CC 24130001 */  addiu      $s3, $zero, 1
/* 8B1D0 8008A5D0 304300FF */  andi       $v1, $v0, 0xff
/* 8B1D4 8008A5D4 14730003 */  bne        $v1, $s3, .L8008A5E4
/* 8B1D8 8008A5D8 00402021 */   addu      $a0, $v0, $zero
/* 8B1DC 8008A5DC 12330028 */  beq        $s1, $s3, .L8008A680
/* 8B1E0 8008A5E0 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008A5E4:
/* 8B1E4 8008A5E4 10710025 */  beq        $v1, $s1, .L8008A67C
/* 8B1E8 8008A5E8 24020003 */   addiu     $v0, $zero, 3
/* 8B1EC 8008A5EC 14620018 */  bne        $v1, $v0, .L8008A650
/* 8B1F0 8008A5F0 308300FF */   andi      $v1, $a0, 0xff
/* 8B1F4 8008A5F4 24020002 */  addiu      $v0, $zero, 2
/* 8B1F8 8008A5F8 16220016 */  bne        $s1, $v0, .L8008A654
/* 8B1FC 8008A5FC 00000000 */   nop
/* 8B200 8008A600 0C026EB7 */  jal        get_psf_err
/* 8B204 8008A604 00002021 */   addu      $a0, $zero, $zero
/* 8B208 8008A608 00408021 */  addu       $s0, $v0, $zero
/* 8B20C 8008A60C 24020006 */  addiu      $v0, $zero, 6
/* 8B210 8008A610 16020004 */  bne        $s0, $v0, .L8008A624
/* 8B214 8008A614 00000000 */   nop
/* 8B218 8008A618 0C026EB7 */  jal        get_psf_err
/* 8B21C 8008A61C 00002021 */   addu      $a0, $zero, $zero
/* 8B220 8008A620 00408021 */  addu       $s0, $v0, $zero
.L8008A624:
/* 8B224 8008A624 0C022938 */  jal        func_8008A4E0
/* 8B228 8008A628 02402021 */   addu      $a0, $s2, $zero
/* 8B22C 8008A62C 52110004 */  beql       $s0, $s1, .L8008A640
/* 8B230 8008A630 A2510085 */   sb        $s1, 0x85($s2)
/* 8B234 8008A634 56000004 */  bnel       $s0, $zero, .L8008A648
/* 8B238 8008A638 A2500085 */   sb        $s0, 0x85($s2)
/* 8B23C 8008A63C A2510085 */  sb         $s1, 0x85($s2)
.L8008A640:
/* 8B240 8008A640 0802299F */  j          .L8008A67C
/* 8B244 8008A644 A2530084 */   sb        $s3, 0x84($s2)
.L8008A648:
/* 8B248 8008A648 0802299F */  j          .L8008A67C
/* 8B24C 8008A64C A2530084 */   sb        $s3, 0x84($s2)
.L8008A650:
/* 8B250 8008A650 24020002 */  addiu      $v0, $zero, 2
.L8008A654:
/* 8B254 8008A654 5462000A */  bnel       $v1, $v0, .L8008A680
/* 8B258 8008A658 8FBF0020 */   lw        $ra, 0x20($sp)
/* 8B25C 8008A65C 24020001 */  addiu      $v0, $zero, 1
/* 8B260 8008A660 12220003 */  beq        $s1, $v0, .L8008A670
/* 8B264 8008A664 00000000 */   nop
/* 8B268 8008A668 12230005 */  beq        $s1, $v1, .L8008A680
/* 8B26C 8008A66C 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008A670:
/* 8B270 8008A670 0C022938 */  jal        func_8008A4E0
/* 8B274 8008A674 02402021 */   addu      $a0, $s2, $zero
/* 8B278 8008A678 A2400084 */  sb         $zero, 0x84($s2)
.L8008A67C:
/* 8B27C 8008A67C 8FBF0020 */  lw         $ra, 0x20($sp)
.L8008A680:
/* 8B280 8008A680 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8B284 8008A684 8FB20018 */  lw         $s2, 0x18($sp)
/* 8B288 8008A688 8FB10014 */  lw         $s1, 0x14($sp)
/* 8B28C 8008A68C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8B290 8008A690 03E00008 */  jr         $ra
/* 8B294 8008A694 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008A698
/* 8B298 8008A698 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B29C 8008A69C 2484008C */  addiu      $a0, $a0, 0x8c
/* 8B2A0 8008A6A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 8B2A4 8008A6A4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8B2A8 8008A6A8 0C02DCB3 */  jal        func_800B72CC
/* 8B2AC 8008A6AC 00A08021 */   addu      $s0, $a1, $zero
/* 8B2B0 8008A6B0 12000006 */  beqz       $s0, .L8008A6CC
/* 8B2B4 8008A6B4 24050003 */   addiu     $a1, $zero, 3
/* 8B2B8 8008A6B8 8E020078 */  lw         $v0, 0x78($s0)
/* 8B2BC 8008A6BC 84440008 */  lh         $a0, 8($v0)
/* 8B2C0 8008A6C0 8C43000C */  lw         $v1, 0xc($v0)
/* 8B2C4 8008A6C4 0060F809 */  jalr       $v1
/* 8B2C8 8008A6C8 02042021 */   addu      $a0, $s0, $a0
.L8008A6CC:
/* 8B2CC 8008A6CC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8B2D0 8008A6D0 8FB00010 */  lw         $s0, 0x10($sp)
/* 8B2D4 8008A6D4 03E00008 */  jr         $ra
/* 8B2D8 8008A6D8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A6DC
/* 8B2DC 8008A6DC 24020005 */  addiu      $v0, $zero, 5
/* 8B2E0 8008A6E0 03E00008 */  jr         $ra
/* 8B2E4 8008A6E4 A0820084 */   sb        $v0, 0x84($a0)

glabel func_8008A6E8
/* 8B2E8 8008A6E8 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B2EC 8008A6EC 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B2F0 8008A6F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B2F4 8008A6F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B2F8 8008A6F8 0C022493 */  jal        func_8008924C
/* 8B2FC 8008A6FC 00000000 */   nop
/* 8B300 8008A700 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B304 8008A704 00001021 */  addu       $v0, $zero, $zero
/* 8B308 8008A708 03E00008 */  jr         $ra
/* 8B30C 8008A70C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A710
/* 8B310 8008A710 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B314 8008A714 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B318 8008A718 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B31C 8008A71C AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B320 8008A720 0C0224C1 */  jal        try_erase_game_file
/* 8B324 8008A724 00000000 */   nop
/* 8B328 8008A728 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B32C 8008A72C 00001021 */  addu       $v0, $zero, $zero
/* 8B330 8008A730 03E00008 */  jr         $ra
/* 8B334 8008A734 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A738
/* 8B338 8008A738 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B33C 8008A73C 3C02800F */  lui        $v0, 0x800f
/* 8B340 8008A740 3C03800F */  lui        $v1, %hi(D_800F1C80)
/* 8B344 8008A744 8C641C80 */  lw         $a0, %lo(D_800F1C80)($v1)
/* 8B348 8008A748 24050001 */  addiu      $a1, $zero, 1
/* 8B34C 8008A74C AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B350 8008A750 0C0229EE */  jal        func_8008A7B8
/* 8B354 8008A754 AC451C84 */   sw        $a1, 0x1c84($v0)
/* 8B358 8008A758 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B35C 8008A75C 00001021 */  addu       $v0, $zero, $zero
/* 8B360 8008A760 03E00008 */  jr         $ra
/* 8B364 8008A764 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A768
/* 8B368 8008A768 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B36C 8008A76C 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B370 8008A770 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B374 8008A774 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B378 8008A778 0C0224DF */  jal        func_8008937C
/* 8B37C 8008A77C 00000000 */   nop
/* 8B380 8008A780 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B384 8008A784 00001021 */  addu       $v0, $zero, $zero
/* 8B388 8008A788 03E00008 */  jr         $ra
/* 8B38C 8008A78C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A790
/* 8B390 8008A790 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B394 8008A794 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B398 8008A798 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B39C 8008A79C AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B3A0 8008A7A0 0C0224E1 */  jal        func_80089384
/* 8B3A4 8008A7A4 00000000 */   nop
/* 8B3A8 8008A7A8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B3AC 8008A7AC 00001021 */  addu       $v0, $zero, $zero
/* 8B3B0 8008A7B0 03E00008 */  jr         $ra
/* 8B3B4 8008A7B4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A7B8
/* 8B3B8 8008A7B8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8B3BC 8008A7BC 00802821 */  addu       $a1, $a0, $zero
/* 8B3C0 8008A7C0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8B3C4 8008A7C4 3C11800F */  lui        $s1, %hi(D_800F1C80)
/* 8B3C8 8008A7C8 8E241C80 */  lw         $a0, %lo(D_800F1C80)($s1)
/* 8B3CC 8008A7CC AFBF0020 */  sw         $ra, 0x20($sp)
/* 8B3D0 8008A7D0 0C0223C3 */  jal        func_80088F0C
/* 8B3D4 8008A7D4 AFB00018 */   sw        $s0, 0x18($sp)
/* 8B3D8 8008A7D8 10400016 */  beqz       $v0, .L8008A834
/* 8B3DC 8008A7DC 3C10800E */   lui       $s0, %hi(gGlobals)
/* 8B3E0 8008A7E0 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8B3E4 8008A7E4 3C03800F */  lui        $v1, %hi(D_800F1C7C)
/* 8B3E8 8008A7E8 8E041604 */  lw         $a0, 0x1604($s0)
/* 8B3EC 8008A7EC 8E251C80 */  lw         $a1, 0x1c80($s1)
/* 8B3F0 8008A7F0 8C661C7C */  lw         $a2, %lo(D_800F1C7C)($v1)
/* 8B3F4 8008A7F4 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 8B3F8 8008A7F8 AC601C7C */  sw         $zero, 0x1c7c($v1)
/* 8B3FC 8008A7FC 0C02DCB3 */  jal        func_800B72CC
/* 8B400 8008A800 AC46D500 */   sw        $a2, %lo(freeWidgetFunc)($v0)
/* 8B404 8008A804 26041624 */  addiu      $a0, $s0, 0x1624
/* 8B408 8008A808 27A50010 */  addiu      $a1, $sp, 0x10
/* 8B40C 8008A80C 24060006 */  addiu      $a2, $zero, 6
/* 8B410 8008A810 8E221C80 */  lw         $v0, 0x1c80($s1)
/* 8B414 8008A814 00003821 */  addu       $a3, $zero, $zero
/* 8B418 8008A818 0C035867 */  jal        AllocFreeQueueItem
/* 8B41C 8008A81C AFA20010 */   sw        $v0, 0x10($sp)
/* 8B420 8008A820 3C02800F */  lui        $v0, %hi(D_800F1C74)
/* 8B424 8008A824 8C441C74 */  lw         $a0, %lo(D_800F1C74)($v0)
/* 8B428 8008A828 3C03800F */  lui        $v1, %hi(D_800F1C78)
/* 8B42C 8008A82C AE201C80 */  sw         $zero, 0x1c80($s1)
/* 8B430 8008A830 AC641C78 */  sw         $a0, %lo(D_800F1C78)($v1)
.L8008A834:
/* 8B434 8008A834 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8B438 8008A838 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8B43C 8008A83C 8FB00018 */  lw         $s0, 0x18($sp)
/* 8B440 8008A840 03E00008 */  jr         $ra
/* 8B444 8008A844 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008A848
/* 8B448 8008A848 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B44C 8008A84C 00802821 */  addu       $a1, $a0, $zero
/* 8B450 8008A850 10A00007 */  beqz       $a1, .L8008A870
/* 8B454 8008A854 AFBF0010 */   sw        $ra, 0x10($sp)
/* 8B458 8008A858 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B45C 8008A85C 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B460 8008A860 10800004 */  beqz       $a0, .L8008A874
/* 8B464 8008A864 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8B468 8008A868 0C0229A6 */  jal        func_8008A698
/* 8B46C 8008A86C 00000000 */   nop
.L8008A870:
/* 8B470 8008A870 8FBF0010 */  lw         $ra, 0x10($sp)
.L8008A874:
/* 8B474 8008A874 03E00008 */  jr         $ra
/* 8B478 8008A878 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A87C
/* 8B47C 8008A87C 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B480 8008A880 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B484 8008A884 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B488 8008A888 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B48C 8008A88C 0C0223D1 */  jal        func_80088F44
/* 8B490 8008A890 00000000 */   nop
/* 8B494 8008A894 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B498 8008A898 00001021 */  addu       $v0, $zero, $zero
/* 8B49C 8008A89C 03E00008 */  jr         $ra
/* 8B4A0 8008A8A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008A8A4
/* 8B4A4 8008A8A4 3C02800F */  lui        $v0, %hi(D_800F1C80)
/* 8B4A8 8008A8A8 8C441C80 */  lw         $a0, %lo(D_800F1C80)($v0)
/* 8B4AC 8008A8AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B4B0 8008A8B0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8B4B4 8008A8B4 0C0226E7 */  jal        func_80089B9C
/* 8B4B8 8008A8B8 90A5005F */   lbu       $a1, 0x5f($a1)
/* 8B4BC 8008A8BC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8B4C0 8008A8C0 00001021 */  addu       $v0, $zero, $zero
/* 8B4C4 8008A8C4 03E00008 */  jr         $ra
/* 8B4C8 8008A8C8 27BD0018 */   addiu     $sp, $sp, 0x18
/* 8B4CC 8008A8CC 00000000 */  nop
