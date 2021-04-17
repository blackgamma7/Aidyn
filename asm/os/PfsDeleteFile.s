.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsDeleteFile
/* C6910 800C5D10 27BDFEA0 */  addiu      $sp, $sp, -0x160
/* C6914 800C5D14 AFB10144 */  sw         $s1, 0x144($sp)
/* C6918 800C5D18 00808821 */  addu       $s1, $a0, $zero
/* C691C 800C5D1C 8FA80170 */  lw         $t0, 0x170($sp)
/* C6920 800C5D20 30A5FFFF */  andi       $a1, $a1, 0xffff
/* C6924 800C5D24 2CA20001 */  sltiu      $v0, $a1, 1
/* C6928 800C5D28 2CC30001 */  sltiu      $v1, $a2, 1
/* C692C 800C5D2C 00431025 */  or         $v0, $v0, $v1
/* C6930 800C5D30 AFBF0158 */  sw         $ra, 0x158($sp)
/* C6934 800C5D34 AFB50154 */  sw         $s5, 0x154($sp)
/* C6938 800C5D38 AFB40150 */  sw         $s4, 0x150($sp)
/* C693C 800C5D3C AFB3014C */  sw         $s3, 0x14c($sp)
/* C6940 800C5D40 AFB20148 */  sw         $s2, 0x148($sp)
/* C6944 800C5D44 10400003 */  beqz       $v0, .L800C5D54
/* C6948 800C5D48 AFB00140 */   sw        $s0, 0x140($sp)
/* C694C 800C5D4C 080317A6 */  j          .L800C5E98
/* C6950 800C5D50 24020005 */   addiu     $v0, $zero, 5
.L800C5D54:
/* C6954 800C5D54 02202021 */  addu       $a0, $s1, $zero
/* C6958 800C5D58 27A20138 */  addiu      $v0, $sp, 0x138
/* C695C 800C5D5C AFA80010 */  sw         $t0, 0x10($sp)
/* C6960 800C5D60 0C031D58 */  jal        osPfsFindFile
/* C6964 800C5D64 AFA20014 */   sw        $v0, 0x14($sp)
/* C6968 800C5D68 1440004B */  bnez       $v0, .L800C5E98
/* C696C 800C5D6C 00000000 */   nop
/* C6970 800C5D70 92220065 */  lbu        $v0, 0x65($s1)
/* C6974 800C5D74 10400005 */  beqz       $v0, .L800C5D8C
/* C6978 800C5D78 02202021 */   addu      $a0, $s1, $zero
/* C697C 800C5D7C 0C031DC8 */  jal        __osPfsSelectBank
/* C6980 800C5D80 00002821 */   addu      $a1, $zero, $zero
/* C6984 800C5D84 14400044 */  bnez       $v0, .L800C5E98
/* C6988 800C5D88 00000000 */   nop
.L800C5D8C:
/* C698C 800C5D8C 8E240004 */  lw         $a0, 4($s1)
/* C6990 800C5D90 8E26005C */  lw         $a2, 0x5c($s1)
/* C6994 800C5D94 8FA20138 */  lw         $v0, 0x138($sp)
/* C6998 800C5D98 8E250008 */  lw         $a1, 8($s1)
/* C699C 800C5D9C 27A70118 */  addiu      $a3, $sp, 0x118
/* C69A0 800C5DA0 00C23021 */  addu       $a2, $a2, $v0
/* C69A4 800C5DA4 0C0309EC */  jal        __osContRamRead
/* C69A8 800C5DA8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C69AC 800C5DAC 1440003A */  bnez       $v0, .L800C5E98
/* C69B0 800C5DB0 00000000 */   nop
/* C69B4 800C5DB4 93B3011E */  lbu        $s3, 0x11e($sp)
/* C69B8 800C5DB8 92220064 */  lbu        $v0, 0x64($s1)
/* C69BC 800C5DBC 93B2011F */  lbu        $s2, 0x11f($sp)
/* C69C0 800C5DC0 327000FF */  andi       $s0, $s3, 0xff
/* C69C4 800C5DC4 0202102B */  sltu       $v0, $s0, $v0
/* C69C8 800C5DC8 10400032 */  beqz       $v0, .L800C5E94
/* C69CC 800C5DCC 27B4013C */   addiu     $s4, $sp, 0x13c
/* C69D0 800C5DD0 24150001 */  addiu      $s5, $zero, 1
/* C69D4 800C5DD4 02202021 */  addu       $a0, $s1, $zero
.L800C5DD8:
/* C69D8 800C5DD8 27A50018 */  addiu      $a1, $sp, 0x18
/* C69DC 800C5DDC 00003021 */  addu       $a2, $zero, $zero
/* C69E0 800C5DE0 0C03162F */  jal        __osPfsRWInode
/* C69E4 800C5DE4 02003821 */   addu      $a3, $s0, $zero
/* C69E8 800C5DE8 1440002B */  bnez       $v0, .L800C5E98
/* C69EC 800C5DEC 02202021 */   addu      $a0, $s1, $zero
/* C69F0 800C5DF0 AFB40010 */  sw         $s4, 0x10($sp)
/* C69F4 800C5DF4 27A50018 */  addiu      $a1, $sp, 0x18
/* C69F8 800C5DF8 02403021 */  addu       $a2, $s2, $zero
/* C69FC 800C5DFC 0C0317AF */  jal        __osPfsReleasePages
/* C6A00 800C5E00 02003821 */   addu      $a3, $s0, $zero
/* C6A04 800C5E04 14400024 */  bnez       $v0, .L800C5E98
/* C6A08 800C5E08 02202021 */   addu      $a0, $s1, $zero
/* C6A0C 800C5E0C 27A50018 */  addiu      $a1, $sp, 0x18
/* C6A10 800C5E10 24060001 */  addiu      $a2, $zero, 1
/* C6A14 800C5E14 0C03162F */  jal        __osPfsRWInode
/* C6A18 800C5E18 02003821 */   addu      $a3, $s0, $zero
/* C6A1C 800C5E1C 1440001E */  bnez       $v0, .L800C5E98
/* C6A20 800C5E20 00000000 */   nop
/* C6A24 800C5E24 97A2013C */  lhu        $v0, 0x13c($sp)
/* C6A28 800C5E28 10550008 */  beq        $v0, $s5, .L800C5E4C
/* C6A2C 800C5E2C 00000000 */   nop
/* C6A30 800C5E30 93B3013C */  lbu        $s3, 0x13c($sp)
/* C6A34 800C5E34 92220064 */  lbu        $v0, 0x64($s1)
/* C6A38 800C5E38 93B2013D */  lbu        $s2, 0x13d($sp)
/* C6A3C 800C5E3C 327000FF */  andi       $s0, $s3, 0xff
/* C6A40 800C5E40 0202102B */  sltu       $v0, $s0, $v0
/* C6A44 800C5E44 1440FFE4 */  bnez       $v0, .L800C5DD8
/* C6A48 800C5E48 02202021 */   addu      $a0, $s1, $zero
.L800C5E4C:
/* C6A4C 800C5E4C 92220064 */  lbu        $v0, 0x64($s1)
/* C6A50 800C5E50 0262102B */  sltu       $v0, $s3, $v0
/* C6A54 800C5E54 1040000F */  beqz       $v0, .L800C5E94
/* C6A58 800C5E58 27B00118 */   addiu     $s0, $sp, 0x118
/* C6A5C 800C5E5C 02002021 */  addu       $a0, $s0, $zero
/* C6A60 800C5E60 0C02F9AC */  jal        _bzero
/* C6A64 800C5E64 24050020 */   addiu     $a1, $zero, 0x20
/* C6A68 800C5E68 8E26005C */  lw         $a2, 0x5c($s1)
/* C6A6C 800C5E6C 8FA20138 */  lw         $v0, 0x138($sp)
/* C6A70 800C5E70 AFA00010 */  sw         $zero, 0x10($sp)
/* C6A74 800C5E74 8E240004 */  lw         $a0, 4($s1)
/* C6A78 800C5E78 8E250008 */  lw         $a1, 8($s1)
/* C6A7C 800C5E7C 02003821 */  addu       $a3, $s0, $zero
/* C6A80 800C5E80 00C23021 */  addu       $a2, $a2, $v0
/* C6A84 800C5E84 0C030B30 */  jal        __osContRamWrite
/* C6A88 800C5E88 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C6A8C 800C5E8C 080317A6 */  j          .L800C5E98
/* C6A90 800C5E90 00000000 */   nop
.L800C5E94:
/* C6A94 800C5E94 24020003 */  addiu      $v0, $zero, 3
.L800C5E98:
/* C6A98 800C5E98 8FBF0158 */  lw         $ra, 0x158($sp)
/* C6A9C 800C5E9C 8FB50154 */  lw         $s5, 0x154($sp)
/* C6AA0 800C5EA0 8FB40150 */  lw         $s4, 0x150($sp)
/* C6AA4 800C5EA4 8FB3014C */  lw         $s3, 0x14c($sp)
/* C6AA8 800C5EA8 8FB20148 */  lw         $s2, 0x148($sp)
/* C6AAC 800C5EAC 8FB10144 */  lw         $s1, 0x144($sp)
/* C6AB0 800C5EB0 8FB00140 */  lw         $s0, 0x140($sp)
/* C6AB4 800C5EB4 03E00008 */  jr         $ra
/* C6AB8 800C5EB8 27BD0160 */   addiu     $sp, $sp, 0x160

glabel __osPfsReleasePages
/* C6ABC 800C5EBC 8FA90010 */  lw         $t1, 0x10($sp)
/* C6AC0 800C5EC0 00071200 */  sll        $v0, $a3, 8
/* C6AC4 800C5EC4 30C600FF */  andi       $a2, $a2, 0xff
/* C6AC8 800C5EC8 00461825 */  or         $v1, $v0, $a2
/* C6ACC 800C5ECC 24080003 */  addiu      $t0, $zero, 3
/* C6AD0 800C5ED0 30E700FF */  andi       $a3, $a3, 0xff
/* C6AD4 800C5ED4 00601021 */  addu       $v0, $v1, $zero
.L800C5ED8:
/* C6AD8 800C5ED8 304300FF */  andi       $v1, $v0, 0xff
/* C6ADC 800C5EDC 00031840 */  sll        $v1, $v1, 1
/* C6AE0 800C5EE0 00651821 */  addu       $v1, $v1, $a1
/* C6AE4 800C5EE4 94630000 */  lhu        $v1, ($v1)
/* C6AE8 800C5EE8 304200FF */  andi       $v0, $v0, 0xff
/* C6AEC 800C5EEC 00021040 */  sll        $v0, $v0, 1
/* C6AF0 800C5EF0 00A21021 */  addu       $v0, $a1, $v0
/* C6AF4 800C5EF4 A4480000 */  sh         $t0, ($v0)
/* C6AF8 800C5EF8 8C820060 */  lw         $v0, 0x60($a0)
/* C6AFC 800C5EFC 3066FFFF */  andi       $a2, $v1, 0xffff
/* C6B00 800C5F00 00C2102A */  slt        $v0, $a2, $v0
/* C6B04 800C5F04 54400005 */  bnel       $v0, $zero, .L800C5F1C
/* C6B08 800C5F08 A5230000 */   sh        $v1, ($t1)
/* C6B0C 800C5F0C 00061202 */  srl        $v0, $a2, 8
/* C6B10 800C5F10 1047FFF1 */  beq        $v0, $a3, .L800C5ED8
/* C6B14 800C5F14 00601021 */   addu      $v0, $v1, $zero
/* C6B18 800C5F18 A5230000 */  sh         $v1, ($t1)
.L800C5F1C:
/* C6B1C 800C5F1C 03E00008 */  jr         $ra
/* C6B20 800C5F20 00001021 */   addu      $v0, $zero, $zero
/* C6B24 800C5F24 00000000 */  nop
/* C6B28 800C5F28 00000000 */  nop
/* C6B2C 800C5F2C 00000000 */  nop
