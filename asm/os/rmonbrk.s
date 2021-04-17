.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonSetBreak
/* C9750 800C8B50 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* C9754 800C8B54 AFB1002C */  sw         $s1, 0x2c($sp)
/* C9758 800C8B58 00808821 */  addu       $s1, $a0, $zero
/* C975C 800C8B5C AFBF0034 */  sw         $ra, 0x34($sp)
/* C9760 800C8B60 AFB20030 */  sw         $s2, 0x30($sp)
/* C9764 800C8B64 AFB00028 */  sw         $s0, 0x28($sp)
/* C9768 800C8B68 92230009 */  lbu        $v1, 9($s1)
/* C976C 800C8B6C 24020001 */  addiu      $v0, $zero, 1
/* C9770 800C8B70 3C128010 */  lui        $s2, %hi(rmonbrk_bss_0000)
/* C9774 800C8B74 26529DB0 */  addiu      $s2, $s2, %lo(rmonbrk_bss_0000)
/* C9778 800C8B78 14620003 */  bne        $v1, $v0, .L800C8B88
/* C977C 800C8B7C 02202821 */   addu      $a1, $s1, $zero
/* C9780 800C8B80 3C128010 */  lui        $s2, %hi(rmonbrk_bss_0088)
/* C9784 800C8B84 26529E38 */  addiu      $s2, $s2, %lo(rmonbrk_bss_0088)
.L800C8B88:
/* C9788 800C8B88 26500008 */  addiu      $s0, $s2, 8
/* C978C 800C8B8C 26440080 */  addiu      $a0, $s2, 0x80
/* C9790 800C8B90 0204102B */  sltu       $v0, $s0, $a0
/* C9794 800C8B94 1040000B */  beqz       $v0, .L800C8BC4
/* C9798 800C8B98 00000000 */   nop
.L800C8B9C:
/* C979C 800C8B9C 8E030000 */  lw         $v1, ($s0)
/* C97A0 800C8BA0 10600008 */  beqz       $v1, .L800C8BC4
/* C97A4 800C8BA4 00000000 */   nop
/* C97A8 800C8BA8 8E220010 */  lw         $v0, 0x10($s1)
/* C97AC 800C8BAC 10620005 */  beq        $v1, $v0, .L800C8BC4
/* C97B0 800C8BB0 00000000 */   nop
/* C97B4 800C8BB4 26100008 */  addiu      $s0, $s0, 8
/* C97B8 800C8BB8 0204102B */  sltu       $v0, $s0, $a0
/* C97BC 800C8BBC 1440FFF7 */  bnez       $v0, .L800C8B9C
/* C97C0 800C8BC0 00000000 */   nop
.L800C8BC4:
/* C97C4 800C8BC4 1204003A */  beq        $s0, $a0, .L800C8CB0
/* C97C8 800C8BC8 2402FFF6 */   addiu     $v0, $zero, -0xa
/* C97CC 800C8BCC 8E020000 */  lw         $v0, ($s0)
/* C97D0 800C8BD0 14400028 */  bnez       $v0, .L800C8C74
/* C97D4 800C8BD4 24020001 */   addiu     $v0, $zero, 1
/* C97D8 800C8BD8 90A30009 */  lbu        $v1, 9($a1)
/* C97DC 800C8BDC 14620011 */  bne        $v1, $v0, .L800C8C24
/* C97E0 800C8BE0 3C03000F */   lui       $v1, 0xf
/* C97E4 800C8BE4 8E240010 */  lw         $a0, 0x10($s1)
/* C97E8 800C8BE8 0C032638 */  jal        __rmonReadWordAt
/* C97EC 800C8BEC 00000000 */   nop
/* C97F0 800C8BF0 3C03000F */  lui        $v1, 0xf
/* C97F4 800C8BF4 3463FFFF */  ori        $v1, $v1, 0xffff
/* C97F8 800C8BF8 AE020004 */  sw         $v0, 4($s0)
/* C97FC 800C8BFC 8E240010 */  lw         $a0, 0x10($s1)
/* C9800 800C8C00 02122823 */  subu       $a1, $s0, $s2
/* C9804 800C8C04 000528C3 */  sra        $a1, $a1, 3
/* C9808 800C8C08 24A50010 */  addiu      $a1, $a1, 0x10
/* C980C 800C8C0C 00A32824 */  and        $a1, $a1, $v1
/* C9810 800C8C10 00052980 */  sll        $a1, $a1, 6
/* C9814 800C8C14 0C032628 */  jal        __rmonWriteWordTo
/* C9818 800C8C18 34A5000D */   ori       $a1, $a1, 0xd
/* C981C 800C8C1C 0803231B */  j          .L800C8C6C
/* C9820 800C8C20 00000000 */   nop
.L800C8C24:
/* C9824 800C8C24 8E220010 */  lw         $v0, 0x10($s1)
/* C9828 800C8C28 8C420000 */  lw         $v0, ($v0)
/* C982C 800C8C2C 3463FFFF */  ori        $v1, $v1, 0xffff
/* C9830 800C8C30 AE020004 */  sw         $v0, 4($s0)
/* C9834 800C8C34 8E240010 */  lw         $a0, 0x10($s1)
/* C9838 800C8C38 02121023 */  subu       $v0, $s0, $s2
/* C983C 800C8C3C 000210C3 */  sra        $v0, $v0, 3
/* C9840 800C8C40 24420010 */  addiu      $v0, $v0, 0x10
/* C9844 800C8C44 00431024 */  and        $v0, $v0, $v1
/* C9848 800C8C48 00021180 */  sll        $v0, $v0, 6
/* C984C 800C8C4C 3442000D */  ori        $v0, $v0, 0xd
/* C9850 800C8C50 AC820000 */  sw         $v0, ($a0)
/* C9854 800C8C54 8E240010 */  lw         $a0, 0x10($s1)
/* C9858 800C8C58 0C034A30 */  jal        osWritebackDCache
/* C985C 800C8C5C 24050004 */   addiu     $a1, $zero, 4
/* C9860 800C8C60 8E240010 */  lw         $a0, 0x10($s1)
/* C9864 800C8C64 0C030DE0 */  jal        osInvalICache
/* C9868 800C8C68 24050004 */   addiu     $a1, $zero, 4
.L800C8C6C:
/* C986C 800C8C6C 8E220010 */  lw         $v0, 0x10($s1)
/* C9870 800C8C70 AE020000 */  sw         $v0, ($s0)
.L800C8C74:
/* C9874 800C8C74 92220004 */  lbu        $v0, 4($s1)
/* C9878 800C8C78 27A40010 */  addiu      $a0, $sp, 0x10
/* C987C 800C8C7C A7A00016 */  sh         $zero, 0x16($sp)
/* C9880 800C8C80 A3A20014 */  sb         $v0, 0x14($sp)
/* C9884 800C8C84 8E23000C */  lw         $v1, 0xc($s1)
/* C9888 800C8C88 02121023 */  subu       $v0, $s0, $s2
/* C988C 800C8C8C 000210C3 */  sra        $v0, $v0, 3
/* C9890 800C8C90 AFA20020 */  sw         $v0, 0x20($sp)
/* C9894 800C8C94 AFA3001C */  sw         $v1, 0x1c($sp)
/* C9898 800C8C98 8E020004 */  lw         $v0, 4($s0)
/* C989C 800C8C9C 24050018 */  addiu      $a1, $zero, 0x18
/* C98A0 800C8CA0 24060001 */  addiu      $a2, $zero, 1
/* C98A4 800C8CA4 0C03255A */  jal        __rmonSendReply
/* C98A8 800C8CA8 AFA20024 */   sw        $v0, 0x24($sp)
/* C98AC 800C8CAC 00001021 */  addu       $v0, $zero, $zero
.L800C8CB0:
/* C98B0 800C8CB0 8FBF0034 */  lw         $ra, 0x34($sp)
/* C98B4 800C8CB4 8FB20030 */  lw         $s2, 0x30($sp)
/* C98B8 800C8CB8 8FB1002C */  lw         $s1, 0x2c($sp)
/* C98BC 800C8CBC 8FB00028 */  lw         $s0, 0x28($sp)
/* C98C0 800C8CC0 03E00008 */  jr         $ra
/* C98C4 800C8CC4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel ret_minus1_800c8cc8
/* C98C8 800C8CC8 03E00008 */  jr         $ra
/* C98CC 800C8CCC 2402FFFF */   addiu     $v0, $zero, -1

glabel __rmonClearBreak
/* C98D0 800C8CD0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* C98D4 800C8CD4 AFB1002C */  sw         $s1, 0x2c($sp)
/* C98D8 800C8CD8 00808821 */  addu       $s1, $a0, $zero
/* C98DC 800C8CDC AFBF0030 */  sw         $ra, 0x30($sp)
/* C98E0 800C8CE0 AFB00028 */  sw         $s0, 0x28($sp)
/* C98E4 800C8CE4 8E240010 */  lw         $a0, 0x10($s1)
/* C98E8 800C8CE8 28820010 */  slti       $v0, $a0, 0x10
/* C98EC 800C8CEC 1040001D */  beqz       $v0, .L800C8D64
/* C98F0 800C8CF0 24020001 */   addiu     $v0, $zero, 1
/* C98F4 800C8CF4 92230009 */  lbu        $v1, 9($s1)
/* C98F8 800C8CF8 14620014 */  bne        $v1, $v0, .L800C8D4C
/* C98FC 800C8CFC 000418C0 */   sll       $v1, $a0, 3
/* C9900 800C8D00 3C028010 */  lui        $v0, %hi(rmonbrk_bss_0088)
/* C9904 800C8D04 24429E38 */  addiu      $v0, $v0, %lo(rmonbrk_bss_0088)
/* C9908 800C8D08 00628021 */  addu       $s0, $v1, $v0
/* C990C 800C8D0C 8E040000 */  lw         $a0, ($s0)
/* C9910 800C8D10 10800031 */  beqz       $a0, .L800C8DD8
/* C9914 800C8D14 2402FFFE */   addiu     $v0, $zero, -2
/* C9918 800C8D18 0C032638 */  jal        __rmonReadWordAt
/* C991C 800C8D1C 00000000 */   nop
/* C9920 800C8D20 3C03FC00 */  lui        $v1, 0xfc00
/* C9924 800C8D24 3463003F */  ori        $v1, $v1, 0x3f
/* C9928 800C8D28 00431024 */  and        $v0, $v0, $v1
/* C992C 800C8D2C 2403000D */  addiu      $v1, $zero, 0xd
/* C9930 800C8D30 5443001D */  bnel       $v0, $v1, .L800C8DA8
/* C9934 800C8D34 AE000000 */   sw        $zero, ($s0)
/* C9938 800C8D38 8E040000 */  lw         $a0, ($s0)
/* C993C 800C8D3C 0C032628 */  jal        __rmonWriteWordTo
/* C9940 800C8D40 8E050004 */   lw        $a1, 4($s0)
/* C9944 800C8D44 0803236A */  j          .L800C8DA8
/* C9948 800C8D48 AE000000 */   sw        $zero, ($s0)
.L800C8D4C:
/* C994C 800C8D4C 3C028010 */  lui        $v0, %hi(rmonbrk_bss_0000)
/* C9950 800C8D50 24429DB0 */  addiu      $v0, $v0, %lo(rmonbrk_bss_0000)
/* C9954 800C8D54 00628021 */  addu       $s0, $v1, $v0
/* C9958 800C8D58 8E040000 */  lw         $a0, ($s0)
/* C995C 800C8D5C 14800003 */  bnez       $a0, .L800C8D6C
/* C9960 800C8D60 3C02FC00 */   lui       $v0, 0xfc00
.L800C8D64:
/* C9964 800C8D64 08032376 */  j          .L800C8DD8
/* C9968 800C8D68 2402FFFE */   addiu     $v0, $zero, -2
.L800C8D6C:
/* C996C 800C8D6C 8C830000 */  lw         $v1, ($a0)
/* C9970 800C8D70 3442003F */  ori        $v0, $v0, 0x3f
/* C9974 800C8D74 00621024 */  and        $v0, $v1, $v0
/* C9978 800C8D78 2403000D */  addiu      $v1, $zero, 0xd
/* C997C 800C8D7C 5443000A */  bnel       $v0, $v1, .L800C8DA8
/* C9980 800C8D80 AE000000 */   sw        $zero, ($s0)
/* C9984 800C8D84 8E020004 */  lw         $v0, 4($s0)
/* C9988 800C8D88 AC820000 */  sw         $v0, ($a0)
/* C998C 800C8D8C 8E040000 */  lw         $a0, ($s0)
/* C9990 800C8D90 0C034A30 */  jal        osWritebackDCache
/* C9994 800C8D94 24050004 */   addiu     $a1, $zero, 4
/* C9998 800C8D98 8E040000 */  lw         $a0, ($s0)
/* C999C 800C8D9C 0C030DE0 */  jal        osInvalICache
/* C99A0 800C8DA0 24050004 */   addiu     $a1, $zero, 4
/* C99A4 800C8DA4 AE000000 */  sw         $zero, ($s0)
.L800C8DA8:
/* C99A8 800C8DA8 92220004 */  lbu        $v0, 4($s1)
/* C99AC 800C8DAC A7A00016 */  sh         $zero, 0x16($sp)
/* C99B0 800C8DB0 A3A20014 */  sb         $v0, 0x14($sp)
/* C99B4 800C8DB4 8E22000C */  lw         $v0, 0xc($s1)
/* C99B8 800C8DB8 27A40010 */  addiu      $a0, $sp, 0x10
/* C99BC 800C8DBC AFA2001C */  sw         $v0, 0x1c($sp)
/* C99C0 800C8DC0 8E220010 */  lw         $v0, 0x10($s1)
/* C99C4 800C8DC4 24050018 */  addiu      $a1, $zero, 0x18
/* C99C8 800C8DC8 24060001 */  addiu      $a2, $zero, 1
/* C99CC 800C8DCC 0C03255A */  jal        __rmonSendReply
/* C99D0 800C8DD0 AFA20020 */   sw        $v0, 0x20($sp)
/* C99D4 800C8DD4 00001021 */  addu       $v0, $zero, $zero
.L800C8DD8:
/* C99D8 800C8DD8 8FBF0030 */  lw         $ra, 0x30($sp)
/* C99DC 800C8DDC 8FB1002C */  lw         $s1, 0x2c($sp)
/* C99E0 800C8DE0 8FB00028 */  lw         $s0, 0x28($sp)
/* C99E4 800C8DE4 03E00008 */  jr         $ra
/* C99E8 800C8DE8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __rmonGetBranchTarget
/* C99EC 800C8DEC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C99F0 800C8DF0 AFB10014 */  sw         $s1, 0x14($sp)
/* C99F4 800C8DF4 00808821 */  addu       $s1, $a0, $zero
/* C99F8 800C8DF8 AFB20018 */  sw         $s2, 0x18($sp)
/* C99FC 800C8DFC 00A09021 */  addu       $s2, $a1, $zero
/* C9A00 800C8E00 AFB00010 */  sw         $s0, 0x10($sp)
/* C9A04 800C8E04 00C08021 */  addu       $s0, $a2, $zero
/* C9A08 800C8E08 24020001 */  addiu      $v0, $zero, 1
/* C9A0C 800C8E0C 16220005 */  bne        $s1, $v0, .L800C8E24
/* C9A10 800C8E10 AFBF001C */   sw        $ra, 0x1c($sp)
/* C9A14 800C8E14 0C032638 */  jal        __rmonReadWordAt
/* C9A18 800C8E18 02002021 */   addu      $a0, $s0, $zero
/* C9A1C 800C8E1C 0803238A */  j          .L800C8E28
/* C9A20 800C8E20 00403021 */   addu      $a2, $v0, $zero
.L800C8E24:
/* C9A24 800C8E24 8E060000 */  lw         $a2, ($s0)
.L800C8E28:
/* C9A28 800C8E28 00061E82 */  srl        $v1, $a2, 0x1a
/* C9A2C 800C8E2C 2C620018 */  sltiu      $v0, $v1, 0x18
/* C9A30 800C8E30 10400047 */  beqz       $v0, .L800C8F50
/* C9A34 800C8E34 00031080 */   sll       $v0, $v1, 2
/* C9A38 800C8E38 3C01800E */  lui        $at, %hi(jtbl_800E5470)
/* C9A3C 800C8E3C 00220821 */  addu       $at, $at, $v0
/* C9A40 800C8E40 8C225470 */  lw         $v0, %lo(jtbl_800E5470)($at)
/* C9A44 800C8E44 00400008 */  jr         $v0
/* C9A48 800C8E48 00000000 */   nop
glabel L800C8E4C_C9A4C
/* C9A4C 800C8E4C 00061143 */  sra        $v0, $a2, 5
/* C9A50 800C8E50 30427FFF */  andi       $v0, $v0, 0x7fff
/* C9A54 800C8E54 14400005 */  bnez       $v0, .L800C8E6C
/* C9A58 800C8E58 00061403 */   sra       $v0, $a2, 0x10
/* C9A5C 800C8E5C 30C3003F */  andi       $v1, $a2, 0x3f
/* C9A60 800C8E60 24020008 */  addiu      $v0, $zero, 8
/* C9A64 800C8E64 10620008 */  beq        $v1, $v0, .L800C8E88
/* C9A68 800C8E68 00061403 */   sra       $v0, $a2, 0x10
.L800C8E6C:
/* C9A6C 800C8E6C 3042001F */  andi       $v0, $v0, 0x1f
/* C9A70 800C8E70 14400038 */  bnez       $v0, .L800C8F54
/* C9A74 800C8E74 2402FFFF */   addiu     $v0, $zero, -1
/* C9A78 800C8E78 30C307FF */  andi       $v1, $a2, 0x7ff
/* C9A7C 800C8E7C 24020009 */  addiu      $v0, $zero, 9
/* C9A80 800C8E80 14620034 */  bne        $v1, $v0, .L800C8F54
/* C9A84 800C8E84 2402FFFF */   addiu     $v0, $zero, -1
.L800C8E88:
/* C9A88 800C8E88 02202021 */  addu       $a0, $s1, $zero
/* C9A8C 800C8E8C 02402821 */  addu       $a1, $s2, $zero
/* C9A90 800C8E90 00063543 */  sra        $a2, $a2, 0x15
/* C9A94 800C8E94 0C032AE9 */  jal        __rmonGetRegisterContents
/* C9A98 800C8E98 30C6001F */   andi      $a2, $a2, 0x1f
/* C9A9C 800C8E9C 080323D5 */  j          .L800C8F54
/* C9AA0 800C8EA0 00000000 */   nop
glabel L800C8EA4_C9AA4
/* C9AA4 800C8EA4 00061403 */  sra        $v0, $a2, 0x10
/* C9AA8 800C8EA8 3043001F */  andi       $v1, $v0, 0x1f
/* C9AAC 800C8EAC 04600028 */  bltz       $v1, .L800C8F50
/* C9AB0 800C8EB0 28620004 */   slti      $v0, $v1, 4
/* C9AB4 800C8EB4 14400022 */  bnez       $v0, .L800C8F40
/* C9AB8 800C8EB8 00061400 */   sll       $v0, $a2, 0x10
/* C9ABC 800C8EBC 28620014 */  slti       $v0, $v1, 0x14
/* C9AC0 800C8EC0 10400023 */  beqz       $v0, .L800C8F50
/* C9AC4 800C8EC4 28620010 */   slti      $v0, $v1, 0x10
/* C9AC8 800C8EC8 54400022 */  bnel       $v0, $zero, .L800C8F54
/* C9ACC 800C8ECC 2402FFFF */   addiu     $v0, $zero, -1
/* C9AD0 800C8ED0 080323D0 */  j          .L800C8F40
/* C9AD4 800C8ED4 00061400 */   sll       $v0, $a2, 0x10
glabel L800C8ED8_C9AD8
/* C9AD8 800C8ED8 00061980 */  sll        $v1, $a2, 6
/* C9ADC 800C8EDC 00031902 */  srl        $v1, $v1, 4
/* C9AE0 800C8EE0 26020004 */  addiu      $v0, $s0, 4
/* C9AE4 800C8EE4 00021703 */  sra        $v0, $v0, 0x1c
/* C9AE8 800C8EE8 00021700 */  sll        $v0, $v0, 0x1c
/* C9AEC 800C8EEC 080323D5 */  j          .L800C8F54
/* C9AF0 800C8EF0 00621025 */   or        $v0, $v1, $v0
glabel L800C8EF4_C9AF4
/* C9AF4 800C8EF4 00061403 */  sra        $v0, $a2, 0x10
/* C9AF8 800C8EF8 3042001F */  andi       $v0, $v0, 0x1f
/* C9AFC 800C8EFC 54400015 */  bnel       $v0, $zero, .L800C8F54
/* C9B00 800C8F00 2402FFFF */   addiu     $v0, $zero, -1
/* C9B04 800C8F04 080323D0 */  j          .L800C8F40
/* C9B08 800C8F08 00061400 */   sll       $v0, $a2, 0x10
glabel L800C8F0C_C9B0C
/* C9B0C 800C8F0C 00061543 */  sra        $v0, $a2, 0x15
/* C9B10 800C8F10 3042001F */  andi       $v0, $v0, 0x1f
/* C9B14 800C8F14 24030008 */  addiu      $v1, $zero, 8
/* C9B18 800C8F18 1443000E */  bne        $v0, $v1, .L800C8F54
/* C9B1C 800C8F1C 2402FFFF */   addiu     $v0, $zero, -1
/* C9B20 800C8F20 00061403 */  sra        $v0, $a2, 0x10
/* C9B24 800C8F24 3043001F */  andi       $v1, $v0, 0x1f
/* C9B28 800C8F28 28620004 */  slti       $v0, $v1, 4
/* C9B2C 800C8F2C 50400009 */  beql       $v0, $zero, .L800C8F54
/* C9B30 800C8F30 2402FFFF */   addiu     $v0, $zero, -1
/* C9B34 800C8F34 04620007 */  bltzl      $v1, .L800C8F54
/* C9B38 800C8F38 2402FFFF */   addiu     $v0, $zero, -1
glabel L800C8F3C_C9B3C
/* C9B3C 800C8F3C 00061400 */  sll        $v0, $a2, 0x10
.L800C8F40:
/* C9B40 800C8F40 00021383 */  sra        $v0, $v0, 0xe
/* C9B44 800C8F44 02021021 */  addu       $v0, $s0, $v0
/* C9B48 800C8F48 080323D5 */  j          .L800C8F54
/* C9B4C 800C8F4C 24420004 */   addiu     $v0, $v0, 4
.L800C8F50:
glabel L800C8F50_C9B50
/* C9B50 800C8F50 2402FFFF */  addiu      $v0, $zero, -1
.L800C8F54:
/* C9B54 800C8F54 8FBF001C */  lw         $ra, 0x1c($sp)
/* C9B58 800C8F58 8FB20018 */  lw         $s2, 0x18($sp)
/* C9B5C 800C8F5C 8FB10014 */  lw         $s1, 0x14($sp)
/* C9B60 800C8F60 8FB00010 */  lw         $s0, 0x10($sp)
/* C9B64 800C8F64 03E00008 */  jr         $ra
/* C9B68 800C8F68 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonSetSingleStep
/* C9B6C 800C8F6C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C9B70 800C8F70 00801021 */  addu       $v0, $a0, $zero
/* C9B74 800C8F74 AFB20018 */  sw         $s2, 0x18($sp)
/* C9B78 800C8F78 00A09021 */  addu       $s2, $a1, $zero
/* C9B7C 800C8F7C 00002021 */  addu       $a0, $zero, $zero
/* C9B80 800C8F80 00402821 */  addu       $a1, $v0, $zero
/* C9B84 800C8F84 02403021 */  addu       $a2, $s2, $zero
/* C9B88 800C8F88 AFBF0020 */  sw         $ra, 0x20($sp)
/* C9B8C 800C8F8C AFB3001C */  sw         $s3, 0x1c($sp)
/* C9B90 800C8F90 AFB10014 */  sw         $s1, 0x14($sp)
/* C9B94 800C8F94 0C03237B */  jal        __rmonGetBranchTarget
/* C9B98 800C8F98 AFB00010 */   sw        $s0, 0x10($sp)
/* C9B9C 800C8F9C 00408021 */  addu       $s0, $v0, $zero
/* C9BA0 800C8FA0 32020003 */  andi       $v0, $s0, 3
/* C9BA4 800C8FA4 10400009 */  beqz       $v0, .L800C8FCC
/* C9BA8 800C8FA8 24050004 */   addiu     $a1, $zero, 4
/* C9BAC 800C8FAC 26500004 */  addiu      $s0, $s2, 4
/* C9BB0 800C8FB0 8E420004 */  lw         $v0, 4($s2)
/* C9BB4 800C8FB4 02002021 */  addu       $a0, $s0, $zero
/* C9BB8 800C8FB8 3C018010 */  lui        $at, %hi(rmonbrk_bss_0004)
/* C9BBC 800C8FBC AC229DB4 */  sw         $v0, %lo(rmonbrk_bss_0004)($at)
/* C9BC0 800C8FC0 2402040D */  addiu      $v0, $zero, 0x40d
/* C9BC4 800C8FC4 0803241C */  j          .L800C9070
/* C9BC8 800C8FC8 AE420004 */   sw        $v0, 4($s2)
.L800C8FCC:
/* C9BCC 800C8FCC 1212004B */  beq        $s0, $s2, .L800C90FC
/* C9BD0 800C8FD0 00001021 */   addu      $v0, $zero, $zero
/* C9BD4 800C8FD4 8E440000 */  lw         $a0, ($s2)
/* C9BD8 800C8FD8 00041E82 */  srl        $v1, $a0, 0x1a
/* C9BDC 800C8FDC 10600007 */  beqz       $v1, .L800C8FFC
/* C9BE0 800C8FE0 2C620004 */   sltiu     $v0, $v1, 4
/* C9BE4 800C8FE4 10400016 */  beqz       $v0, .L800C9040
/* C9BE8 800C8FE8 2C620002 */   sltiu     $v0, $v1, 2
/* C9BEC 800C8FEC 14400015 */  bnez       $v0, .L800C9044
/* C9BF0 800C8FF0 00001021 */   addu      $v0, $zero, $zero
/* C9BF4 800C8FF4 08032411 */  j          .L800C9044
/* C9BF8 800C8FF8 24020001 */   addiu     $v0, $zero, 1
.L800C8FFC:
/* C9BFC 800C8FFC 00041142 */  srl        $v0, $a0, 5
/* C9C00 800C9000 30427FFF */  andi       $v0, $v0, 0x7fff
/* C9C04 800C9004 14400005 */  bnez       $v0, .L800C901C
/* C9C08 800C9008 00041402 */   srl       $v0, $a0, 0x10
/* C9C0C 800C900C 3083003F */  andi       $v1, $a0, 0x3f
/* C9C10 800C9010 24020008 */  addiu      $v0, $zero, 8
/* C9C14 800C9014 10620008 */  beq        $v1, $v0, .L800C9038
/* C9C18 800C9018 00041402 */   srl       $v0, $a0, 0x10
.L800C901C:
/* C9C1C 800C901C 3042001F */  andi       $v0, $v0, 0x1f
/* C9C20 800C9020 14400008 */  bnez       $v0, .L800C9044
/* C9C24 800C9024 00001021 */   addu      $v0, $zero, $zero
/* C9C28 800C9028 308307FF */  andi       $v1, $a0, 0x7ff
/* C9C2C 800C902C 24020009 */  addiu      $v0, $zero, 9
/* C9C30 800C9030 14620004 */  bne        $v1, $v0, .L800C9044
/* C9C34 800C9034 00001021 */   addu      $v0, $zero, $zero
.L800C9038:
/* C9C38 800C9038 08032411 */  j          .L800C9044
/* C9C3C 800C903C 24020001 */   addiu     $v0, $zero, 1
.L800C9040:
/* C9C40 800C9040 00001021 */  addu       $v0, $zero, $zero
.L800C9044:
/* C9C44 800C9044 14400003 */  bnez       $v0, .L800C9054
/* C9C48 800C9048 26510008 */   addiu     $s1, $s2, 8
/* C9C4C 800C904C 16110011 */  bne        $s0, $s1, .L800C9094
/* C9C50 800C9050 02002021 */   addu      $a0, $s0, $zero
.L800C9054:
/* C9C54 800C9054 8E020000 */  lw         $v0, ($s0)
/* C9C58 800C9058 02002021 */  addu       $a0, $s0, $zero
/* C9C5C 800C905C 24050004 */  addiu      $a1, $zero, 4
/* C9C60 800C9060 3C018010 */  lui        $at, %hi(rmonbrk_bss_0004)
/* C9C64 800C9064 AC229DB4 */  sw         $v0, %lo(rmonbrk_bss_0004)($at)
/* C9C68 800C9068 2402040D */  addiu      $v0, $zero, 0x40d
/* C9C6C 800C906C AE020000 */  sw         $v0, ($s0)
.L800C9070:
/* C9C70 800C9070 0C034A30 */  jal        osWritebackDCache
/* C9C74 800C9074 00000000 */   nop
/* C9C78 800C9078 02002021 */  addu       $a0, $s0, $zero
/* C9C7C 800C907C 0C030DE0 */  jal        osInvalICache
/* C9C80 800C9080 24050004 */   addiu     $a1, $zero, 4
/* C9C84 800C9084 3C018010 */  lui        $at, %hi(rmonbrk_bss_0000)
/* C9C88 800C9088 AC309DB0 */  sw         $s0, %lo(rmonbrk_bss_0000)($at)
/* C9C8C 800C908C 0803243F */  j          .L800C90FC
/* C9C90 800C9090 24020001 */   addiu     $v0, $zero, 1
.L800C9094:
/* C9C94 800C9094 8E020000 */  lw         $v0, ($s0)
/* C9C98 800C9098 24050004 */  addiu      $a1, $zero, 4
/* C9C9C 800C909C 2413040D */  addiu      $s3, $zero, 0x40d
/* C9CA0 800C90A0 3C018010 */  lui        $at, %hi(rmonbrk_bss_0004)
/* C9CA4 800C90A4 AC229DB4 */  sw         $v0, %lo(rmonbrk_bss_0004)($at)
/* C9CA8 800C90A8 0C034A30 */  jal        osWritebackDCache
/* C9CAC 800C90AC AE130000 */   sw        $s3, ($s0)
/* C9CB0 800C90B0 02002021 */  addu       $a0, $s0, $zero
/* C9CB4 800C90B4 0C030DE0 */  jal        osInvalICache
/* C9CB8 800C90B8 24050004 */   addiu     $a1, $zero, 4
/* C9CBC 800C90BC 3C018010 */  lui        $at, %hi(rmonbrk_bss_0000)
/* C9CC0 800C90C0 AC309DB0 */  sw         $s0, %lo(rmonbrk_bss_0000)($at)
/* C9CC4 800C90C4 1220000C */  beqz       $s1, .L800C90F8
/* C9CC8 800C90C8 02202021 */   addu      $a0, $s1, $zero
/* C9CCC 800C90CC 8E420008 */  lw         $v0, 8($s2)
/* C9CD0 800C90D0 24050004 */  addiu      $a1, $zero, 4
/* C9CD4 800C90D4 3C018010 */  lui        $at, %hi(rmonbrk_bss_0084)
/* C9CD8 800C90D8 AC229E34 */  sw         $v0, %lo(rmonbrk_bss_0084)($at)
/* C9CDC 800C90DC 0C034A30 */  jal        osWritebackDCache
/* C9CE0 800C90E0 AE530008 */   sw        $s3, 8($s2)
/* C9CE4 800C90E4 02202021 */  addu       $a0, $s1, $zero
/* C9CE8 800C90E8 0C030DE0 */  jal        osInvalICache
/* C9CEC 800C90EC 24050004 */   addiu     $a1, $zero, 4
/* C9CF0 800C90F0 3C018010 */  lui        $at, %hi(rmonbrk_bss_0080)
/* C9CF4 800C90F4 AC319E30 */  sw         $s1, %lo(rmonbrk_bss_0080)($at)
.L800C90F8:
/* C9CF8 800C90F8 24020001 */  addiu      $v0, $zero, 1
.L800C90FC:
/* C9CFC 800C90FC 8FBF0020 */  lw         $ra, 0x20($sp)
/* C9D00 800C9100 8FB3001C */  lw         $s3, 0x1c($sp)
/* C9D04 800C9104 8FB20018 */  lw         $s2, 0x18($sp)
/* C9D08 800C9108 8FB10014 */  lw         $s1, 0x14($sp)
/* C9D0C 800C910C 8FB00010 */  lw         $s0, 0x10($sp)
/* C9D10 800C9110 03E00008 */  jr         $ra
/* C9D14 800C9114 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __rmonGetExceptionStatus
/* C9D18 800C9118 24020001 */  addiu      $v0, $zero, 1
/* C9D1C 800C911C AC82000C */  sw         $v0, 0xc($a0)
/* C9D20 800C9120 24020002 */  addiu      $v0, $zero, 2
/* C9D24 800C9124 A4820010 */  sh         $v0, 0x10($a0)
/* C9D28 800C9128 A4820024 */  sh         $v0, 0x24($a0)
/* C9D2C 800C912C 24020004 */  addiu      $v0, $zero, 4
/* C9D30 800C9130 A4820026 */  sh         $v0, 0x26($a0)
/* C9D34 800C9134 24020004 */  addiu      $v0, $zero, 4
/* C9D38 800C9138 A0820004 */  sb         $v0, 4($a0)
/* C9D3C 800C913C 2402004C */  addiu      $v0, $zero, 0x4c
/* C9D40 800C9140 A4800012 */  sh         $zero, 0x12($a0)
/* C9D44 800C9144 AC800030 */  sw         $zero, 0x30($a0)
/* C9D48 800C9148 A4800006 */  sh         $zero, 6($a0)
/* C9D4C 800C914C 03E00008 */  jr         $ra
/* C9D50 800C9150 AC820000 */   sw        $v0, ($a0)

glabel __rmonHitBreak
/* C9D54 800C9154 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0000)
/* C9D58 800C9158 8C849DB0 */  lw         $a0, %lo(rmonbrk_bss_0000)($a0)
/* C9D5C 800C915C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C9D60 800C9160 10800015 */  beqz       $a0, .L800C91B8
/* C9D64 800C9164 AFBF0010 */   sw        $ra, 0x10($sp)
/* C9D68 800C9168 8C830000 */  lw         $v1, ($a0)
/* C9D6C 800C916C 3C02FC00 */  lui        $v0, 0xfc00
/* C9D70 800C9170 3442003F */  ori        $v0, $v0, 0x3f
/* C9D74 800C9174 00621024 */  and        $v0, $v1, $v0
/* C9D78 800C9178 2403000D */  addiu      $v1, $zero, 0xd
/* C9D7C 800C917C 1443000C */  bne        $v0, $v1, .L800C91B0
/* C9D80 800C9180 00000000 */   nop
/* C9D84 800C9184 3C028010 */  lui        $v0, %hi(rmonbrk_bss_0004)
/* C9D88 800C9188 8C429DB4 */  lw         $v0, %lo(rmonbrk_bss_0004)($v0)
/* C9D8C 800C918C AC820000 */  sw         $v0, ($a0)
/* C9D90 800C9190 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0000)
/* C9D94 800C9194 8C849DB0 */  lw         $a0, %lo(rmonbrk_bss_0000)($a0)
/* C9D98 800C9198 0C034A30 */  jal        osWritebackDCache
/* C9D9C 800C919C 24050004 */   addiu     $a1, $zero, 4
/* C9DA0 800C91A0 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0000)
/* C9DA4 800C91A4 8C849DB0 */  lw         $a0, %lo(rmonbrk_bss_0000)($a0)
/* C9DA8 800C91A8 0C030DE0 */  jal        osInvalICache
/* C9DAC 800C91AC 24050004 */   addiu     $a1, $zero, 4
.L800C91B0:
/* C9DB0 800C91B0 3C018010 */  lui        $at, %hi(rmonbrk_bss_0000)
/* C9DB4 800C91B4 AC209DB0 */  sw         $zero, %lo(rmonbrk_bss_0000)($at)
.L800C91B8:
/* C9DB8 800C91B8 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0080)
/* C9DBC 800C91BC 8C849E30 */  lw         $a0, %lo(rmonbrk_bss_0080)($a0)
/* C9DC0 800C91C0 10800014 */  beqz       $a0, .L800C9214
/* C9DC4 800C91C4 3C02FC00 */   lui       $v0, 0xfc00
/* C9DC8 800C91C8 8C830000 */  lw         $v1, ($a0)
/* C9DCC 800C91CC 3442003F */  ori        $v0, $v0, 0x3f
/* C9DD0 800C91D0 00621024 */  and        $v0, $v1, $v0
/* C9DD4 800C91D4 2403000D */  addiu      $v1, $zero, 0xd
/* C9DD8 800C91D8 1443000C */  bne        $v0, $v1, .L800C920C
/* C9DDC 800C91DC 00000000 */   nop
/* C9DE0 800C91E0 3C028010 */  lui        $v0, %hi(rmonbrk_bss_0084)
/* C9DE4 800C91E4 8C429E34 */  lw         $v0, %lo(rmonbrk_bss_0084)($v0)
/* C9DE8 800C91E8 AC820000 */  sw         $v0, ($a0)
/* C9DEC 800C91EC 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0080)
/* C9DF0 800C91F0 8C849E30 */  lw         $a0, %lo(rmonbrk_bss_0080)($a0)
/* C9DF4 800C91F4 0C034A30 */  jal        osWritebackDCache
/* C9DF8 800C91F8 24050004 */   addiu     $a1, $zero, 4
/* C9DFC 800C91FC 3C048010 */  lui        $a0, %hi(rmonbrk_bss_0080)
/* C9E00 800C9200 8C849E30 */  lw         $a0, %lo(rmonbrk_bss_0080)($a0)
/* C9E04 800C9204 0C030DE0 */  jal        osInvalICache
/* C9E08 800C9208 24050004 */   addiu     $a1, $zero, 4
.L800C920C:
/* C9E0C 800C920C 3C018010 */  lui        $at, %hi(rmonbrk_bss_0080)
/* C9E10 800C9210 AC209E30 */  sw         $zero, %lo(rmonbrk_bss_0080)($at)
.L800C9214:
/* C9E14 800C9214 0C032B63 */  jal        __rmonStopUserThreads
/* C9E18 800C9218 00002021 */   addu      $a0, $zero, $zero
/* C9E1C 800C921C 0C0324BA */  jal        rmonFindFaultedThreads
/* C9E20 800C9220 00000000 */   nop
/* C9E24 800C9224 8FBF0010 */  lw         $ra, 0x10($sp)
/* C9E28 800C9228 03E00008 */  jr         $ra
/* C9E2C 800C922C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __rmonHitSpBreak
/* C9E30 800C9230 27BDFF98 */  addiu      $sp, $sp, -0x68
/* C9E34 800C9234 AFBF0060 */  sw         $ra, 0x60($sp)
/* C9E38 800C9238 0C032638 */  jal        __rmonReadWordAt
/* C9E3C 800C923C 3C040408 */   lui       $a0, 0x408
/* C9E40 800C9240 3C040408 */  lui        $a0, 0x408
/* C9E44 800C9244 0C032628 */  jal        __rmonWriteWordTo
/* C9E48 800C9248 2445FFFC */   addiu     $a1, $v0, -4
/* C9E4C 800C924C 24040001 */  addiu      $a0, $zero, 1
/* C9E50 800C9250 240503E8 */  addiu      $a1, $zero, 0x3e8
/* C9E54 800C9254 0C032BDC */  jal        __rmonGetThreadStatus
/* C9E58 800C9258 27A60010 */   addiu     $a2, $sp, 0x10
/* C9E5C 800C925C 27A40010 */  addiu      $a0, $sp, 0x10
/* C9E60 800C9260 2405004C */  addiu      $a1, $zero, 0x4c
/* C9E64 800C9264 24060002 */  addiu      $a2, $zero, 2
/* C9E68 800C9268 24020001 */  addiu      $v0, $zero, 1
/* C9E6C 800C926C AFA2001C */  sw         $v0, 0x1c($sp)
/* C9E70 800C9270 24020002 */  addiu      $v0, $zero, 2
/* C9E74 800C9274 A7A20020 */  sh         $v0, 0x20($sp)
/* C9E78 800C9278 A7A20034 */  sh         $v0, 0x34($sp)
/* C9E7C 800C927C 24020004 */  addiu      $v0, $zero, 4
/* C9E80 800C9280 A7A20036 */  sh         $v0, 0x36($sp)
/* C9E84 800C9284 24020004 */  addiu      $v0, $zero, 4
/* C9E88 800C9288 A3A20014 */  sb         $v0, 0x14($sp)
/* C9E8C 800C928C 2402004C */  addiu      $v0, $zero, 0x4c
/* C9E90 800C9290 A7A00022 */  sh         $zero, 0x22($sp)
/* C9E94 800C9294 AFA00040 */  sw         $zero, 0x40($sp)
/* C9E98 800C9298 A7A00016 */  sh         $zero, 0x16($sp)
/* C9E9C 800C929C 0C03255A */  jal        __rmonSendReply
/* C9EA0 800C92A0 AFA20010 */   sw        $v0, 0x10($sp)
/* C9EA4 800C92A4 24020001 */  addiu      $v0, $zero, 1
/* C9EA8 800C92A8 3C018010 */  lui        $at, %hi(__rmonRcpAtBreak)
/* C9EAC 800C92AC A0229EC0 */  sb         $v0, %lo(__rmonRcpAtBreak)($at)
/* C9EB0 800C92B0 8FBF0060 */  lw         $ra, 0x60($sp)
/* C9EB4 800C92B4 03E00008 */  jr         $ra
/* C9EB8 800C92B8 27BD0068 */   addiu     $sp, $sp, 0x68

glabel __rmonHitCpuFault
/* C9EBC 800C92BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C9EC0 800C92C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* C9EC4 800C92C4 0C032B30 */  jal        __rmonMaskIdleThreadInts
/* C9EC8 800C92C8 00000000 */   nop
/* C9ECC 800C92CC 0C032B63 */  jal        __rmonStopUserThreads
/* C9ED0 800C92D0 00002021 */   addu      $a0, $zero, $zero
/* C9ED4 800C92D4 0C0324BA */  jal        rmonFindFaultedThreads
/* C9ED8 800C92D8 00000000 */   nop
/* C9EDC 800C92DC 8FBF0010 */  lw         $ra, 0x10($sp)
/* C9EE0 800C92E0 03E00008 */  jr         $ra
/* C9EE4 800C92E4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rmonFindFaultedThreads
/* C9EE8 800C92E8 27BDFF80 */  addiu      $sp, $sp, -0x80
/* C9EEC 800C92EC AFBF007C */  sw         $ra, 0x7c($sp)
/* C9EF0 800C92F0 AFB60078 */  sw         $s6, 0x78($sp)
/* C9EF4 800C92F4 AFB50074 */  sw         $s5, 0x74($sp)
/* C9EF8 800C92F8 AFB40070 */  sw         $s4, 0x70($sp)
/* C9EFC 800C92FC AFB3006C */  sw         $s3, 0x6c($sp)
/* C9F00 800C9300 AFB20068 */  sw         $s2, 0x68($sp)
/* C9F04 800C9304 AFB10064 */  sw         $s1, 0x64($sp)
/* C9F08 800C9308 0C03253C */  jal        rmonGetActiveQueue
/* C9F0C 800C930C AFB00060 */   sw        $s0, 0x60($sp)
/* C9F10 800C9310 00408821 */  addu       $s1, $v0, $zero
/* C9F14 800C9314 8E230004 */  lw         $v1, 4($s1)
/* C9F18 800C9318 2402FFFF */  addiu      $v0, $zero, -1
/* C9F1C 800C931C 10620067 */  beq        $v1, $v0, .L800C94BC
/* C9F20 800C9320 2416000D */   addiu     $s6, $zero, 0xd
/* C9F24 800C9324 24140001 */  addiu      $s4, $zero, 1
/* C9F28 800C9328 24120002 */  addiu      $s2, $zero, 2
/* C9F2C 800C932C 24130004 */  addiu      $s3, $zero, 4
/* C9F30 800C9330 2415004C */  addiu      $s5, $zero, 0x4c
.L800C9334:
/* C9F34 800C9334 8E220004 */  lw         $v0, 4($s1)
/* C9F38 800C9338 2442FFFF */  addiu      $v0, $v0, -1
/* C9F3C 800C933C 2C42007F */  sltiu      $v0, $v0, 0x7f
/* C9F40 800C9340 10400059 */  beqz       $v0, .L800C94A8
/* C9F44 800C9344 00000000 */   nop
/* C9F48 800C9348 96220012 */  lhu        $v0, 0x12($s1)
/* C9F4C 800C934C 30420001 */  andi       $v0, $v0, 1
/* C9F50 800C9350 1040003A */  beqz       $v0, .L800C943C
/* C9F54 800C9354 00000000 */   nop
/* C9F58 800C9358 8E22011C */  lw         $v0, 0x11c($s1)
/* C9F5C 800C935C 8C430000 */  lw         $v1, ($v0)
/* C9F60 800C9360 3C02FC00 */  lui        $v0, 0xfc00
/* C9F64 800C9364 3442003F */  ori        $v0, $v0, 0x3f
/* C9F68 800C9368 00621024 */  and        $v0, $v1, $v0
/* C9F6C 800C936C 1456001F */  bne        $v0, $s6, .L800C93EC
/* C9F70 800C9370 00000000 */   nop
/* C9F74 800C9374 8E250014 */  lw         $a1, 0x14($s1)
/* C9F78 800C9378 14A00002 */  bnez       $a1, .L800C9384
/* C9F7C 800C937C 00038183 */   sra       $s0, $v1, 6
/* C9F80 800C9380 240503EB */  addiu      $a1, $zero, 0x3eb
.L800C9384:
/* C9F84 800C9384 00002021 */  addu       $a0, $zero, $zero
/* C9F88 800C9388 0C032BDC */  jal        __rmonGetThreadStatus
/* C9F8C 800C938C 27A60010 */   addiu     $a2, $sp, 0x10
/* C9F90 800C9390 2402000F */  addiu      $v0, $zero, 0xf
/* C9F94 800C9394 AFB4001C */  sw         $s4, 0x1c($sp)
/* C9F98 800C9398 A7B20020 */  sh         $s2, 0x20($sp)
/* C9F9C 800C939C A7A00022 */  sh         $zero, 0x22($sp)
/* C9FA0 800C93A0 AFA00040 */  sw         $zero, 0x40($sp)
/* C9FA4 800C93A4 A7B20034 */  sh         $s2, 0x34($sp)
/* C9FA8 800C93A8 A7B30036 */  sh         $s3, 0x36($sp)
/* C9FAC 800C93AC A3B30014 */  sb         $s3, 0x14($sp)
/* C9FB0 800C93B0 A7A00016 */  sh         $zero, 0x16($sp)
/* C9FB4 800C93B4 16020003 */  bne        $s0, $v0, .L800C93C4
/* C9FB8 800C93B8 AFB50010 */   sw        $s5, 0x10($sp)
/* C9FBC 800C93BC A7B40034 */  sh         $s4, 0x34($sp)
/* C9FC0 800C93C0 A7B20036 */  sh         $s2, 0x36($sp)
.L800C93C4:
/* C9FC4 800C93C4 2A020010 */  slti       $v0, $s0, 0x10
/* C9FC8 800C93C8 10400002 */  beqz       $v0, .L800C93D4
/* C9FCC 800C93CC 2610FFF0 */   addiu     $s0, $s0, -0x10
/* C9FD0 800C93D0 00008021 */  addu       $s0, $zero, $zero
.L800C93D4:
/* C9FD4 800C93D4 56000001 */  bnel       $s0, $zero, .L800C93DC
/* C9FD8 800C93D8 AFB6002C */   sw        $s6, 0x2c($sp)
.L800C93DC:
/* C9FDC 800C93DC 27A40010 */  addiu      $a0, $sp, 0x10
/* C9FE0 800C93E0 2405004C */  addiu      $a1, $zero, 0x4c
/* C9FE4 800C93E4 0803250D */  j          .L800C9434
/* C9FE8 800C93E8 24060002 */   addiu     $a2, $zero, 2
.L800C93EC:
/* C9FEC 800C93EC 8E250014 */  lw         $a1, 0x14($s1)
/* C9FF0 800C93F0 50A00001 */  beql       $a1, $zero, .L800C93F8
/* C9FF4 800C93F4 240503EB */   addiu     $a1, $zero, 0x3eb
.L800C93F8:
/* C9FF8 800C93F8 00002021 */  addu       $a0, $zero, $zero
/* C9FFC 800C93FC 0C032BDC */  jal        __rmonGetThreadStatus
/* CA000 800C9400 27A60010 */   addiu     $a2, $sp, 0x10
/* CA004 800C9404 27A40010 */  addiu      $a0, $sp, 0x10
/* CA008 800C9408 2405004C */  addiu      $a1, $zero, 0x4c
/* CA00C 800C940C 24060002 */  addiu      $a2, $zero, 2
/* CA010 800C9410 AFB4001C */  sw         $s4, 0x1c($sp)
/* CA014 800C9414 A7B20020 */  sh         $s2, 0x20($sp)
/* CA018 800C9418 A7A00022 */  sh         $zero, 0x22($sp)
/* CA01C 800C941C AFA00040 */  sw         $zero, 0x40($sp)
/* CA020 800C9420 A7B20034 */  sh         $s2, 0x34($sp)
/* CA024 800C9424 A7B30036 */  sh         $s3, 0x36($sp)
/* CA028 800C9428 A3B30014 */  sb         $s3, 0x14($sp)
/* CA02C 800C942C A7A00016 */  sh         $zero, 0x16($sp)
/* CA030 800C9430 AFB50010 */  sw         $s5, 0x10($sp)
.L800C9434:
/* CA034 800C9434 0C03255A */  jal        __rmonSendReply
/* CA038 800C9438 00000000 */   nop
.L800C943C:
/* CA03C 800C943C 96220012 */  lhu        $v0, 0x12($s1)
/* CA040 800C9440 30420002 */  andi       $v0, $v0, 2
/* CA044 800C9444 10400018 */  beqz       $v0, .L800C94A8
/* CA048 800C9448 00000000 */   nop
/* CA04C 800C944C 0C032244 */  jal        __rmonSendFault
/* CA050 800C9450 02202021 */   addu      $a0, $s1, $zero
/* CA054 800C9454 8E250014 */  lw         $a1, 0x14($s1)
/* CA058 800C9458 50A00001 */  beql       $a1, $zero, .L800C9460
/* CA05C 800C945C 240503EB */   addiu     $a1, $zero, 0x3eb
.L800C9460:
/* CA060 800C9460 00002021 */  addu       $a0, $zero, $zero
/* CA064 800C9464 0C032BDC */  jal        __rmonGetThreadStatus
/* CA068 800C9468 27A60010 */   addiu     $a2, $sp, 0x10
/* CA06C 800C946C 27A40010 */  addiu      $a0, $sp, 0x10
/* CA070 800C9470 2405004C */  addiu      $a1, $zero, 0x4c
/* CA074 800C9474 24060002 */  addiu      $a2, $zero, 2
/* CA078 800C9478 AFB4001C */  sw         $s4, 0x1c($sp)
/* CA07C 800C947C A7B20020 */  sh         $s2, 0x20($sp)
/* CA080 800C9480 A7A00022 */  sh         $zero, 0x22($sp)
/* CA084 800C9484 AFA00040 */  sw         $zero, 0x40($sp)
/* CA088 800C9488 A7B20034 */  sh         $s2, 0x34($sp)
/* CA08C 800C948C A7B30036 */  sh         $s3, 0x36($sp)
/* CA090 800C9490 A3B30014 */  sb         $s3, 0x14($sp)
/* CA094 800C9494 A7A00016 */  sh         $zero, 0x16($sp)
/* CA098 800C9498 AFB50010 */  sw         $s5, 0x10($sp)
/* CA09C 800C949C A7B40034 */  sh         $s4, 0x34($sp)
/* CA0A0 800C94A0 0C03255A */  jal        __rmonSendReply
/* CA0A4 800C94A4 A7B20036 */   sh        $s2, 0x36($sp)
.L800C94A8:
/* CA0A8 800C94A8 8E31000C */  lw         $s1, 0xc($s1)
/* CA0AC 800C94AC 8E230004 */  lw         $v1, 4($s1)
/* CA0B0 800C94B0 2402FFFF */  addiu      $v0, $zero, -1
/* CA0B4 800C94B4 1462FF9F */  bne        $v1, $v0, .L800C9334
/* CA0B8 800C94B8 00000000 */   nop
.L800C94BC:
/* CA0BC 800C94BC 8FBF007C */  lw         $ra, 0x7c($sp)
/* CA0C0 800C94C0 8FB60078 */  lw         $s6, 0x78($sp)
/* CA0C4 800C94C4 8FB50074 */  lw         $s5, 0x74($sp)
/* CA0C8 800C94C8 8FB40070 */  lw         $s4, 0x70($sp)
/* CA0CC 800C94CC 8FB3006C */  lw         $s3, 0x6c($sp)
/* CA0D0 800C94D0 8FB20068 */  lw         $s2, 0x68($sp)
/* CA0D4 800C94D4 8FB10064 */  lw         $s1, 0x64($sp)
/* CA0D8 800C94D8 8FB00060 */  lw         $s0, 0x60($sp)
/* CA0DC 800C94DC 03E00008 */  jr         $ra
/* CA0E0 800C94E0 27BD0080 */   addiu     $sp, $sp, 0x80
/* CA0E4 800C94E4 00000000 */  nop
/* CA0E8 800C94E8 00000000 */  nop
/* CA0EC 800C94EC 00000000 */  nop
