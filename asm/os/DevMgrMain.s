.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osDevMgrMain
/* C8850 800C7C50 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* C8854 800C7C54 AFB20030 */  sw         $s2, 0x30($sp)
/* C8858 800C7C58 00809021 */  addu       $s2, $a0, $zero
/* C885C 800C7C5C AFB40038 */  sw         $s4, 0x38($sp)
/* C8860 800C7C60 24140002 */  addiu      $s4, $zero, 2
/* C8864 800C7C64 AFB5003C */  sw         $s5, 0x3c($sp)
/* C8868 800C7C68 24150001 */  addiu      $s5, $zero, 1
/* C886C 800C7C6C AFBF0040 */  sw         $ra, 0x40($sp)
/* C8870 800C7C70 AFB30034 */  sw         $s3, 0x34($sp)
/* C8874 800C7C74 AFB1002C */  sw         $s1, 0x2c($sp)
/* C8878 800C7C78 AFB00028 */  sw         $s0, 0x28($sp)
/* C887C 800C7C7C AFA00018 */  sw         $zero, 0x18($sp)
.L800C7C80:
/* C8880 800C7C80 8E440008 */  lw         $a0, 8($s2)
/* C8884 800C7C84 27A50018 */  addiu      $a1, $sp, 0x18
/* C8888 800C7C88 0C0321E4 */  jal        osRecvMesg
/* C888C 800C7C8C 24060001 */   addiu     $a2, $zero, 1
/* C8890 800C7C90 8FA20018 */  lw         $v0, 0x18($sp)
/* C8894 800C7C94 8C500014 */  lw         $s0, 0x14($v0)
/* C8898 800C7C98 1200007C */  beqz       $s0, .L800C7E8C
/* C889C 800C7C9C 00000000 */   nop
/* C88A0 800C7CA0 92020004 */  lbu        $v0, 4($s0)
/* C88A4 800C7CA4 14540078 */  bne        $v0, $s4, .L800C7E88
/* C88A8 800C7CA8 00000000 */   nop
/* C88AC 800C7CAC 8E020014 */  lw         $v0, 0x14($s0)
/* C88B0 800C7CB0 2C420002 */  sltiu      $v0, $v0, 2
/* C88B4 800C7CB4 10400074 */  beqz       $v0, .L800C7E88
/* C88B8 800C7CB8 2402FFFF */   addiu     $v0, $zero, -1
/* C88BC 800C7CBC 9603001A */  lhu        $v1, 0x1a($s0)
/* C88C0 800C7CC0 AE02001C */  sw         $v0, 0x1c($s0)
/* C88C4 800C7CC4 000310C0 */  sll        $v0, $v1, 3
/* C88C8 800C7CC8 00431021 */  addu       $v0, $v0, $v1
/* C88CC 800C7CCC 00021080 */  sll        $v0, $v0, 2
/* C88D0 800C7CD0 02021021 */  addu       $v0, $s0, $v0
/* C88D4 800C7CD4 96030018 */  lhu        $v1, 0x18($s0)
/* C88D8 800C7CD8 2451002C */  addiu      $s1, $v0, 0x2c
/* C88DC 800C7CDC 24020003 */  addiu      $v0, $zero, 3
/* C88E0 800C7CE0 10620005 */  beq        $v1, $v0, .L800C7CF8
/* C88E4 800C7CE4 00000000 */   nop
/* C88E8 800C7CE8 8E220004 */  lw         $v0, 4($s1)
/* C88EC 800C7CEC 8E23000C */  lw         $v1, 0xc($s1)
/* C88F0 800C7CF0 00431023 */  subu       $v0, $v0, $v1
/* C88F4 800C7CF4 AE220004 */  sw         $v0, 4($s1)
.L800C7CF8:
/* C88F8 800C7CF8 96020018 */  lhu        $v0, 0x18($s0)
/* C88FC 800C7CFC 14540005 */  bne        $v0, $s4, .L800C7D14
/* C8900 800C7D00 00009821 */   addu      $s3, $zero, $zero
/* C8904 800C7D04 8FA20018 */  lw         $v0, 0x18($sp)
/* C8908 800C7D08 8C420014 */  lw         $v0, 0x14($v0)
/* C890C 800C7D0C 8C420014 */  lw         $v0, 0x14($v0)
/* C8910 800C7D10 2C530001 */  sltiu      $s3, $v0, 1
.L800C7D14:
/* C8914 800C7D14 8E440010 */  lw         $a0, 0x10($s2)
/* C8918 800C7D18 27A5001C */  addiu      $a1, $sp, 0x1c
/* C891C 800C7D1C 0C0321E4 */  jal        osRecvMesg
/* C8920 800C7D20 24060001 */   addiu     $a2, $zero, 1
/* C8924 800C7D24 3C040010 */  lui        $a0, 0x10
/* C8928 800C7D28 0C032230 */  jal        __osResetGlobalIntMask
/* C892C 800C7D2C 34840401 */   ori       $a0, $a0, 0x401
/* C8930 800C7D30 3C050500 */  lui        $a1, 0x500
/* C8934 800C7D34 8FA20018 */  lw         $v0, 0x18($sp)
/* C8938 800C7D38 34A50510 */  ori        $a1, $a1, 0x510
/* C893C 800C7D3C 8E030024 */  lw         $v1, 0x24($s0)
/* C8940 800C7D40 8C440014 */  lw         $a0, 0x14($v0)
/* C8944 800C7D44 3C068000 */  lui        $a2, 0x8000
/* C8948 800C7D48 0C0320DC */  jal        osEPiRawWriteIo
/* C894C 800C7D4C 00663025 */   or        $a2, $v1, $a2
.L800C7D50:
/* C8950 800C7D50 8E44000C */  lw         $a0, 0xc($s2)
/* C8954 800C7D54 27A50020 */  addiu      $a1, $sp, 0x20
/* C8958 800C7D58 0C0321E4 */  jal        osRecvMesg
/* C895C 800C7D5C 24060001 */   addiu     $a2, $zero, 1
/* C8960 800C7D60 8FA20018 */  lw         $v0, 0x18($sp)
/* C8964 800C7D64 8C500014 */  lw         $s0, 0x14($v0)
/* C8968 800C7D68 9603001A */  lhu        $v1, 0x1a($s0)
/* C896C 800C7D6C 000310C0 */  sll        $v0, $v1, 3
/* C8970 800C7D70 00431021 */  addu       $v0, $v0, $v1
/* C8974 800C7D74 00021080 */  sll        $v0, $v0, 2
/* C8978 800C7D78 02021021 */  addu       $v0, $s0, $v0
/* C897C 800C7D7C 2451002C */  addiu      $s1, $v0, 0x2c
/* C8980 800C7D80 8E230000 */  lw         $v1, ($s1)
/* C8984 800C7D84 2402001D */  addiu      $v0, $zero, 0x1d
/* C8988 800C7D88 14620027 */  bne        $v1, $v0, .L800C7E28
/* C898C 800C7D8C 02002021 */   addu      $a0, $s0, $zero
/* C8990 800C7D90 3C050500 */  lui        $a1, 0x500
/* C8994 800C7D94 8E020024 */  lw         $v0, 0x24($s0)
/* C8998 800C7D98 34A50510 */  ori        $a1, $a1, 0x510
/* C899C 800C7D9C 3C061000 */  lui        $a2, 0x1000
/* C89A0 800C7DA0 0C0320DC */  jal        osEPiRawWriteIo
/* C89A4 800C7DA4 00463025 */   or        $a2, $v0, $a2
/* C89A8 800C7DA8 8FA20018 */  lw         $v0, 0x18($sp)
/* C89AC 800C7DAC 8E060024 */  lw         $a2, 0x24($s0)
/* C89B0 800C7DB0 8C440014 */  lw         $a0, 0x14($v0)
/* C89B4 800C7DB4 3C050500 */  lui        $a1, 0x500
/* C89B8 800C7DB8 0C0320DC */  jal        osEPiRawWriteIo
/* C89BC 800C7DBC 34A50510 */   ori       $a1, $a1, 0x510
/* C89C0 800C7DC0 8FA20018 */  lw         $v0, 0x18($sp)
/* C89C4 800C7DC4 3C050500 */  lui        $a1, 0x500
/* C89C8 800C7DC8 8C440014 */  lw         $a0, 0x14($v0)
/* C89CC 800C7DCC 34A50508 */  ori        $a1, $a1, 0x508
/* C89D0 800C7DD0 0C032080 */  jal        __osEPiRawReadIo
/* C89D4 800C7DD4 27A60024 */   addiu     $a2, $sp, 0x24
/* C89D8 800C7DD8 8FA20024 */  lw         $v0, 0x24($sp)
/* C89DC 800C7DDC 3C030200 */  lui        $v1, 0x200
/* C89E0 800C7DE0 00431024 */  and        $v0, $v0, $v1
/* C89E4 800C7DE4 10400008 */  beqz       $v0, .L800C7E08
/* C89E8 800C7DE8 3C050500 */   lui       $a1, 0x500
/* C89EC 800C7DEC 8FA20018 */  lw         $v0, 0x18($sp)
/* C89F0 800C7DF0 34A50510 */  ori        $a1, $a1, 0x510
/* C89F4 800C7DF4 8E030024 */  lw         $v1, 0x24($s0)
/* C89F8 800C7DF8 8C440014 */  lw         $a0, 0x14($v0)
/* C89FC 800C7DFC 3C060100 */  lui        $a2, 0x100
/* C8A00 800C7E00 0C0320DC */  jal        osEPiRawWriteIo
/* C8A04 800C7E04 00663025 */   or        $a2, $v1, $a2
.L800C7E08:
/* C8A08 800C7E08 3C03A460 */  lui        $v1, 0xa460
/* C8A0C 800C7E0C 34630010 */  ori        $v1, $v1, 0x10
/* C8A10 800C7E10 3C040010 */  lui        $a0, 0x10
/* C8A14 800C7E14 24020004 */  addiu      $v0, $zero, 4
/* C8A18 800C7E18 AE220000 */  sw         $v0, ($s1)
/* C8A1C 800C7E1C AC740000 */  sw         $s4, ($v1)
/* C8A20 800C7E20 0C0331B8 */  jal        __osSetGlobalIntMask
/* C8A24 800C7E24 34840C01 */   ori       $a0, $a0, 0xc01
.L800C7E28:
/* C8A28 800C7E28 8FA50018 */  lw         $a1, 0x18($sp)
/* C8A2C 800C7E2C 8CA40004 */  lw         $a0, 4($a1)
/* C8A30 800C7E30 0C03313C */  jal        osSendMesg
/* C8A34 800C7E34 00003021 */   addu      $a2, $zero, $zero
/* C8A38 800C7E38 16750006 */  bne        $s3, $s5, .L800C7E54
/* C8A3C 800C7E3C 00000000 */   nop
/* C8A40 800C7E40 8FA20018 */  lw         $v0, 0x18($sp)
/* C8A44 800C7E44 8C420014 */  lw         $v0, 0x14($v0)
/* C8A48 800C7E48 8C42002C */  lw         $v0, 0x2c($v0)
/* C8A4C 800C7E4C 1040FFC0 */  beqz       $v0, .L800C7D50
/* C8A50 800C7E50 00009821 */   addu      $s3, $zero, $zero
.L800C7E54:
/* C8A54 800C7E54 8E440010 */  lw         $a0, 0x10($s2)
/* C8A58 800C7E58 00002821 */  addu       $a1, $zero, $zero
/* C8A5C 800C7E5C 0C03313C */  jal        osSendMesg
/* C8A60 800C7E60 00003021 */   addu      $a2, $zero, $zero
/* C8A64 800C7E64 8FA20018 */  lw         $v0, 0x18($sp)
/* C8A68 800C7E68 8C420014 */  lw         $v0, 0x14($v0)
/* C8A6C 800C7E6C 9442001A */  lhu        $v0, 0x1a($v0)
/* C8A70 800C7E70 1455FF83 */  bne        $v0, $s5, .L800C7C80
/* C8A74 800C7E74 00000000 */   nop
/* C8A78 800C7E78 0C035348 */  jal        osYieldThread
/* C8A7C 800C7E7C 00000000 */   nop
/* C8A80 800C7E80 08031F20 */  j          .L800C7C80
/* C8A84 800C7E84 00000000 */   nop
.L800C7E88:
/* C8A88 800C7E88 8FA20018 */  lw         $v0, 0x18($sp)
.L800C7E8C:
/* C8A8C 800C7E8C 94420000 */  lhu        $v0, ($v0)
/* C8A90 800C7E90 2443FFF6 */  addiu      $v1, $v0, -0xa
/* C8A94 800C7E94 2C620007 */  sltiu      $v0, $v1, 7
/* C8A98 800C7E98 10400042 */  beqz       $v0, .L800C7FA4
/* C8A9C 800C7E9C 00031080 */   sll       $v0, $v1, 2
/* C8AA0 800C7EA0 3C01800E */  lui        $at, %hi(jtbl_800E5450)
/* C8AA4 800C7EA4 00220821 */  addu       $at, $at, $v0
/* C8AA8 800C7EA8 8C225450 */  lw         $v0, %lo(jtbl_800E5450)($at)
/* C8AAC 800C7EAC 00400008 */  jr         $v0
/* C8AB0 800C7EB0 00000000 */   nop
glabel L800C7EB4_C8AB4
/* C8AB4 800C7EB4 8E440010 */  lw         $a0, 0x10($s2)
/* C8AB8 800C7EB8 27A5001C */  addiu      $a1, $sp, 0x1c
/* C8ABC 800C7EBC 0C0321E4 */  jal        osRecvMesg
/* C8AC0 800C7EC0 24060001 */   addiu     $a2, $zero, 1
/* C8AC4 800C7EC4 8FA20018 */  lw         $v0, 0x18($sp)
/* C8AC8 800C7EC8 8C45000C */  lw         $a1, 0xc($v0)
/* C8ACC 800C7ECC 8C460008 */  lw         $a2, 8($v0)
/* C8AD0 800C7ED0 8C470010 */  lw         $a3, 0x10($v0)
/* C8AD4 800C7ED4 8E420014 */  lw         $v0, 0x14($s2)
/* C8AD8 800C7ED8 0040F809 */  jalr       $v0
/* C8ADC 800C7EDC 00002021 */   addu      $a0, $zero, $zero
/* C8AE0 800C7EE0 08031FEA */  j          .L800C7FA8
/* C8AE4 800C7EE4 00000000 */   nop
glabel L800C7EE8_C8AE8
/* C8AE8 800C7EE8 8E440010 */  lw         $a0, 0x10($s2)
/* C8AEC 800C7EEC 27A5001C */  addiu      $a1, $sp, 0x1c
/* C8AF0 800C7EF0 0C0321E4 */  jal        osRecvMesg
/* C8AF4 800C7EF4 24060001 */   addiu     $a2, $zero, 1
/* C8AF8 800C7EF8 8FA20018 */  lw         $v0, 0x18($sp)
/* C8AFC 800C7EFC 8C45000C */  lw         $a1, 0xc($v0)
/* C8B00 800C7F00 8C460008 */  lw         $a2, 8($v0)
/* C8B04 800C7F04 8C470010 */  lw         $a3, 0x10($v0)
/* C8B08 800C7F08 8E420014 */  lw         $v0, 0x14($s2)
/* C8B0C 800C7F0C 0040F809 */  jalr       $v0
/* C8B10 800C7F10 24040001 */   addiu     $a0, $zero, 1
/* C8B14 800C7F14 08031FEA */  j          .L800C7FA8
/* C8B18 800C7F18 00000000 */   nop
glabel L800C7F1C_C8B1C
/* C8B1C 800C7F1C 8E440010 */  lw         $a0, 0x10($s2)
/* C8B20 800C7F20 27A5001C */  addiu      $a1, $sp, 0x1c
/* C8B24 800C7F24 0C0321E4 */  jal        osRecvMesg
/* C8B28 800C7F28 24060001 */   addiu     $a2, $zero, 1
/* C8B2C 800C7F2C 8FA20018 */  lw         $v0, 0x18($sp)
/* C8B30 800C7F30 8C430010 */  lw         $v1, 0x10($v0)
/* C8B34 800C7F34 AFA30010 */  sw         $v1, 0x10($sp)
/* C8B38 800C7F38 8C440014 */  lw         $a0, 0x14($v0)
/* C8B3C 800C7F3C 8C46000C */  lw         $a2, 0xc($v0)
/* C8B40 800C7F40 8C470008 */  lw         $a3, 8($v0)
/* C8B44 800C7F44 8E420018 */  lw         $v0, 0x18($s2)
/* C8B48 800C7F48 0040F809 */  jalr       $v0
/* C8B4C 800C7F4C 00002821 */   addu      $a1, $zero, $zero
/* C8B50 800C7F50 08031FEA */  j          .L800C7FA8
/* C8B54 800C7F54 00000000 */   nop
glabel L800C7F58_C8B58
/* C8B58 800C7F58 8E440010 */  lw         $a0, 0x10($s2)
/* C8B5C 800C7F5C 27A5001C */  addiu      $a1, $sp, 0x1c
/* C8B60 800C7F60 0C0321E4 */  jal        osRecvMesg
/* C8B64 800C7F64 24060001 */   addiu     $a2, $zero, 1
/* C8B68 800C7F68 8FA20018 */  lw         $v0, 0x18($sp)
/* C8B6C 800C7F6C 8C430010 */  lw         $v1, 0x10($v0)
/* C8B70 800C7F70 AFA30010 */  sw         $v1, 0x10($sp)
/* C8B74 800C7F74 8C440014 */  lw         $a0, 0x14($v0)
/* C8B78 800C7F78 8C46000C */  lw         $a2, 0xc($v0)
/* C8B7C 800C7F7C 8C470008 */  lw         $a3, 8($v0)
/* C8B80 800C7F80 8E420018 */  lw         $v0, 0x18($s2)
/* C8B84 800C7F84 0040F809 */  jalr       $v0
/* C8B88 800C7F88 24050001 */   addiu     $a1, $zero, 1
/* C8B8C 800C7F8C 08031FEA */  j          .L800C7FA8
/* C8B90 800C7F90 00000000 */   nop
glabel L800C7F94_C8B94
/* C8B94 800C7F94 8FA50018 */  lw         $a1, 0x18($sp)
/* C8B98 800C7F98 8CA40004 */  lw         $a0, 4($a1)
/* C8B9C 800C7F9C 0C03313C */  jal        osSendMesg
/* C8BA0 800C7FA0 00003021 */   addu      $a2, $zero, $zero
.L800C7FA4:
glabel L800C7FA4_C8BA4
/* C8BA4 800C7FA4 2402FFFF */  addiu      $v0, $zero, -1
.L800C7FA8:
/* C8BA8 800C7FA8 1440FF35 */  bnez       $v0, .L800C7C80
/* C8BAC 800C7FAC 27A50020 */   addiu     $a1, $sp, 0x20
/* C8BB0 800C7FB0 8E44000C */  lw         $a0, 0xc($s2)
/* C8BB4 800C7FB4 0C0321E4 */  jal        osRecvMesg
/* C8BB8 800C7FB8 24060001 */   addiu     $a2, $zero, 1
/* C8BBC 800C7FBC 8FA50018 */  lw         $a1, 0x18($sp)
/* C8BC0 800C7FC0 8CA40004 */  lw         $a0, 4($a1)
/* C8BC4 800C7FC4 0C03313C */  jal        osSendMesg
/* C8BC8 800C7FC8 00003021 */   addu      $a2, $zero, $zero
/* C8BCC 800C7FCC 8E440010 */  lw         $a0, 0x10($s2)
/* C8BD0 800C7FD0 00002821 */  addu       $a1, $zero, $zero
/* C8BD4 800C7FD4 0C03313C */  jal        osSendMesg
/* C8BD8 800C7FD8 00003021 */   addu      $a2, $zero, $zero
/* C8BDC 800C7FDC 08031F20 */  j          .L800C7C80
/* C8BE0 800C7FE0 00000000 */   nop
/* C8BE4 800C7FE4 8FBF0040 */  lw         $ra, 0x40($sp)
/* C8BE8 800C7FE8 8FB5003C */  lw         $s5, 0x3c($sp)
/* C8BEC 800C7FEC 8FB40038 */  lw         $s4, 0x38($sp)
/* C8BF0 800C7FF0 8FB30034 */  lw         $s3, 0x34($sp)
/* C8BF4 800C7FF4 8FB20030 */  lw         $s2, 0x30($sp)
/* C8BF8 800C7FF8 8FB1002C */  lw         $s1, 0x2c($sp)
/* C8BFC 800C7FFC 8FB00028 */  lw         $s0, 0x28($sp)
/* C8C00 800C8000 03E00008 */  jr         $ra
/* C8C04 800C8004 27BD0048 */   addiu     $sp, $sp, 0x48
/* C8C08 800C8008 00000000 */  nop
/* C8C0C 800C800C 00000000 */  nop
