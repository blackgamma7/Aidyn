.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel calloc_QueueStructB
/* D6900 800D5D00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D6904 800D5D04 00002821 */  addu       $a1, $zero, $zero
/* D6908 800D5D08 24060200 */  addiu      $a2, $zero, 0x200
/* D690C 800D5D0C AFBF0010 */  sw         $ra, 0x10($sp)
/* D6910 800D5D10 0C026380 */  jal        Calloc
/* D6914 800D5D14 A4800200 */   sh        $zero, 0x200($a0)
/* D6918 800D5D18 8FBF0010 */  lw         $ra, 0x10($sp)
/* D691C 800D5D1C 03E00008 */  jr         $ra
/* D6920 800D5D20 27BD0018 */   addiu     $sp, $sp, 0x18

glabel NOOP_800d5d24
/* D6924 800D5D24 03E00008 */  jr         $ra
/* D6928 800D5D28 00000000 */   nop

glabel AllocAllocQueueItem
/* D692C 800D5D2C 27BDFEC8 */  addiu      $sp, $sp, -0x138
/* D6930 800D5D30 AFB30124 */  sw         $s3, 0x124($sp)
/* D6934 800D5D34 00809821 */  addu       $s3, $a0, $zero
/* D6938 800D5D38 AFB40128 */  sw         $s4, 0x128($sp)
/* D693C 800D5D3C 00A0A021 */  addu       $s4, $a1, $zero
/* D6940 800D5D40 AFB5012C */  sw         $s5, 0x12c($sp)
/* D6944 800D5D44 00C0A821 */  addu       $s5, $a2, $zero
/* D6948 800D5D48 AFBF0134 */  sw         $ra, 0x134($sp)
/* D694C 800D5D4C AFB60130 */  sw         $s6, 0x130($sp)
/* D6950 800D5D50 AFB20120 */  sw         $s2, 0x120($sp)
/* D6954 800D5D54 AFB1011C */  sw         $s1, 0x11c($sp)
/* D6958 800D5D58 AFB00118 */  sw         $s0, 0x118($sp)
/* D695C 800D5D5C 96620200 */  lhu        $v0, 0x200($s3)
/* D6960 800D5D60 00E0B021 */  addu       $s6, $a3, $zero
/* D6964 800D5D64 24430001 */  addiu      $v1, $v0, 1
/* D6968 800D5D68 3042FFFF */  andi       $v0, $v0, 0xffff
/* D696C 800D5D6C 00021100 */  sll        $v0, $v0, 4
/* D6970 800D5D70 02628821 */  addu       $s1, $s3, $v0
/* D6974 800D5D74 A6630200 */  sh         $v1, 0x200($s3)
/* D6978 800D5D78 3063FFFF */  andi       $v1, $v1, 0xffff
/* D697C 800D5D7C 2C630020 */  sltiu      $v1, $v1, 0x20
/* D6980 800D5D80 97B0014A */  lhu        $s0, 0x14a($sp)
/* D6984 800D5D84 14600006 */  bnez       $v1, .L800D5DA0
/* D6988 800D5D88 97B2014E */   lhu       $s2, 0x14e($sp)
/* D698C 800D5D8C 3C04800E */  lui        $a0, %hi(D_800E4F50)
/* D6990 800D5D90 24844F50 */  addiu      $a0, $a0, %lo(D_800E4F50)
/* D6994 800D5D94 3C05800E */  lui        $a1, %hi(D_800E4F64)
/* D6998 800D5D98 0C025F2D */  jal        manualCrash
/* D699C 800D5D9C 24A54F64 */   addiu     $a1, $a1, %lo(D_800E4F64)
.L800D5DA0:
/* D69A0 800D5DA0 2E020009 */  sltiu      $v0, $s0, 9
/* D69A4 800D5DA4 5440000B */  bnel       $v0, $zero, .L800D5DD4
/* D69A8 800D5DA8 AE800000 */   sw        $zero, ($s4)
/* D69AC 800D5DAC 27A40018 */  addiu      $a0, $sp, 0x18
/* D69B0 800D5DB0 3C05800E */  lui        $a1, %hi(D_800E4F94)
/* D69B4 800D5DB4 24A54F94 */  addiu      $a1, $a1, %lo(D_800E4F94)
/* D69B8 800D5DB8 0C0333AC */  jal        sprintf
/* D69BC 800D5DBC 02003021 */   addu      $a2, $s0, $zero
/* D69C0 800D5DC0 3C04800E */  lui        $a0, %hi(D_800E4FA8)
/* D69C4 800D5DC4 24844FA8 */  addiu      $a0, $a0, %lo(D_800E4FA8)
/* D69C8 800D5DC8 0C025F2D */  jal        manualCrash
/* D69CC 800D5DCC 27A50018 */   addiu     $a1, $sp, 0x18
/* D69D0 800D5DD0 AE800000 */  sw         $zero, ($s4)
.L800D5DD4:
/* D69D4 800D5DD4 A630000C */  sh         $s0, 0xc($s1)
/* D69D8 800D5DD8 A232000E */  sb         $s2, 0xe($s1)
/* D69DC 800D5DDC 96620200 */  lhu        $v0, 0x200($s3)
/* D69E0 800D5DE0 00008021 */  addu       $s0, $zero, $zero
/* D69E4 800D5DE4 AE340000 */  sw         $s4, ($s1)
/* D69E8 800D5DE8 AE350004 */  sw         $s5, 4($s1)
/* D69EC 800D5DEC 2442FFFF */  addiu      $v0, $v0, -1
/* D69F0 800D5DF0 1840001B */  blez       $v0, .L800D5E60
/* D69F4 800D5DF4 AE360008 */   sw        $s6, 8($s1)
/* D69F8 800D5DF8 27B20098 */  addiu      $s2, $sp, 0x98
/* D69FC 800D5DFC 3C15800E */  lui        $s5, 0x800e
/* D6A00 800D5E00 3C14800E */  lui        $s4, 0x800e
/* D6A04 800D5E04 00101100 */  sll        $v0, $s0, 4
.L800D5E08:
/* D6A08 800D5E08 02621021 */  addu       $v0, $s3, $v0
/* D6A0C 800D5E0C 8E270000 */  lw         $a3, ($s1)
/* D6A10 800D5E10 8C430000 */  lw         $v1, ($v0)
/* D6A14 800D5E14 14E3000C */  bne        $a3, $v1, .L800D5E48
/* D6A18 800D5E18 26030001 */   addiu     $v1, $s0, 1
/* D6A1C 800D5E1C 02402021 */  addu       $a0, $s2, $zero
/* D6A20 800D5E20 9626000C */  lhu        $a2, 0xc($s1)
/* D6A24 800D5E24 8CE20000 */  lw         $v0, ($a3)
/* D6A28 800D5E28 8E270008 */  lw         $a3, 8($s1)
/* D6A2C 800D5E2C 26A54FBC */  addiu      $a1, $s5, 0x4fbc
/* D6A30 800D5E30 0C0333AC */  jal        sprintf
/* D6A34 800D5E34 AFA20010 */   sw        $v0, 0x10($sp)
/* D6A38 800D5E38 26844F50 */  addiu      $a0, $s4, 0x4f50
/* D6A3C 800D5E3C 0C025F2D */  jal        manualCrash
/* D6A40 800D5E40 02402821 */   addu      $a1, $s2, $zero
/* D6A44 800D5E44 26030001 */  addiu      $v1, $s0, 1
.L800D5E48:
/* D6A48 800D5E48 96620200 */  lhu        $v0, 0x200($s3)
/* D6A4C 800D5E4C 3070FFFF */  andi       $s0, $v1, 0xffff
/* D6A50 800D5E50 2442FFFF */  addiu      $v0, $v0, -1
/* D6A54 800D5E54 0202102A */  slt        $v0, $s0, $v0
/* D6A58 800D5E58 1440FFEB */  bnez       $v0, .L800D5E08
/* D6A5C 800D5E5C 00101100 */   sll       $v0, $s0, 4
.L800D5E60:
/* D6A60 800D5E60 8FBF0134 */  lw         $ra, 0x134($sp)
/* D6A64 800D5E64 8FB60130 */  lw         $s6, 0x130($sp)
/* D6A68 800D5E68 8FB5012C */  lw         $s5, 0x12c($sp)
/* D6A6C 800D5E6C 8FB40128 */  lw         $s4, 0x128($sp)
/* D6A70 800D5E70 8FB30124 */  lw         $s3, 0x124($sp)
/* D6A74 800D5E74 8FB20120 */  lw         $s2, 0x120($sp)
/* D6A78 800D5E78 8FB1011C */  lw         $s1, 0x11c($sp)
/* D6A7C 800D5E7C 8FB00118 */  lw         $s0, 0x118($sp)
/* D6A80 800D5E80 03E00008 */  jr         $ra
/* D6A84 800D5E84 27BD0138 */   addiu     $sp, $sp, 0x138

glabel processAllocQueue
/* D6A88 800D5E88 27BDFF68 */  addiu      $sp, $sp, -0x98
/* D6A8C 800D5E8C AFB00090 */  sw         $s0, 0x90($sp)
/* D6A90 800D5E90 00808021 */  addu       $s0, $a0, $zero
/* D6A94 800D5E94 AFBF0094 */  sw         $ra, 0x94($sp)
/* D6A98 800D5E98 8E020008 */  lw         $v0, 8($s0)
/* D6A9C 800D5E9C 1040003B */  beqz       $v0, .L800D5F8C
/* D6AA0 800D5EA0 8FBF0094 */   lw        $ra, 0x94($sp)
/* D6AA4 800D5EA4 9602000C */  lhu        $v0, 0xc($s0)
/* D6AA8 800D5EA8 2C430009 */  sltiu      $v1, $v0, 9
/* D6AAC 800D5EAC 10600008 */  beqz       $v1, .L800D5ED0
/* D6AB0 800D5EB0 00403021 */   addu      $a2, $v0, $zero
/* D6AB4 800D5EB4 3C02800E */  lui        $v0, %hi(D_800E5078)
/* D6AB8 800D5EB8 24425078 */  addiu      $v0, $v0, %lo(D_800E5078)
/* D6ABC 800D5EBC 00061880 */  sll        $v1, $a2, 2
/* D6AC0 800D5EC0 00621821 */  addu       $v1, $v1, $v0
/* D6AC4 800D5EC4 8C640000 */  lw         $a0, ($v1)
/* D6AC8 800D5EC8 00800008 */  jr         $a0
/* D6ACC 800D5ECC 00000000 */   nop
.L800D5ED0:
/* D6AD0 800D5ED0 27A40010 */  addiu      $a0, $sp, 0x10
/* D6AD4 800D5ED4 3C05800E */  lui        $a1, %hi(D_800E500C)
/* D6AD8 800D5ED8 0C0333AC */  jal        sprintf
/* D6ADC 800D5EDC 24A5500C */   addiu     $a1, $a1, %lo(D_800E500C)
/* D6AE0 800D5EE0 3C04800E */  lui        $a0, %hi(D_800E5024)
/* D6AE4 800D5EE4 24845024 */  addiu      $a0, $a0, %lo(D_800E5024)
/* D6AE8 800D5EE8 0C025F2D */  jal        manualCrash
/* D6AEC 800D5EEC 27A50010 */   addiu     $a1, $sp, 0x10
/* D6AF0 800D5EF0 080357E3 */  j          .L800D5F8C
/* D6AF4 800D5EF4 8FBF0094 */   lw        $ra, 0x94($sp)
/* D6AF8 800D5EF8 8E040008 */  lw         $a0, 8($s0)
/* D6AFC 800D5EFC 0C027F0D */  jal        func_loading_borg7
/* D6B00 800D5F00 8E050004 */   lw        $a1, 4($s0)
/* D6B04 800D5F04 080357E1 */  j          .L800D5F84
/* D6B08 800D5F08 8E030000 */   lw        $v1, ($s0)
/* D6B0C 800D5F0C 0C027E7A */  jal        BorgAnimLoadScene
/* D6B10 800D5F10 8E040008 */   lw        $a0, 8($s0)
/* D6B14 800D5F14 080357E1 */  j          .L800D5F84
/* D6B18 800D5F18 8E030000 */   lw        $v1, ($s0)
/* D6B1C 800D5F1C 0C027EFB */  jal        get_borg_6
/* D6B20 800D5F20 8E040008 */   lw        $a0, 8($s0)
/* D6B24 800D5F24 080357E1 */  j          .L800D5F84
/* D6B28 800D5F28 8E030000 */   lw        $v1, ($s0)
/* D6B2C 800D5F2C 0C028A22 */  jal        getBorgItem
/* D6B30 800D5F30 8E040008 */   lw        $a0, 8($s0)
/* D6B34 800D5F34 080357E1 */  j          .L800D5F84
/* D6B38 800D5F38 8E030000 */   lw        $v1, ($s0)
/* D6B3C 800D5F3C 0C0290E2 */  jal        get_borg_8
/* D6B40 800D5F40 8E040008 */   lw        $a0, 8($s0)
/* D6B44 800D5F44 080357E1 */  j          .L800D5F84
/* D6B48 800D5F48 8E030000 */   lw        $v1, ($s0)
/* D6B4C 800D5F4C 0C029CEA */  jal        get_borg13
/* D6B50 800D5F50 8E040008 */   lw        $a0, 8($s0)
/* D6B54 800D5F54 080357E1 */  j          .L800D5F84
/* D6B58 800D5F58 8E030000 */   lw        $v1, ($s0)
/* D6B5C 800D5F5C 3C04800E */  lui        $a0, %hi(D_800E5038)
/* D6B60 800D5F60 24845038 */  addiu      $a0, $a0, %lo(D_800E5038)
/* D6B64 800D5F64 3C05800E */  lui        $a1, %hi(D_800E504C)
/* D6B68 800D5F68 0C025F2D */  jal        manualCrash
/* D6B6C 800D5F6C 24A5504C */   addiu     $a1, $a1, %lo(D_800E504C)
/* D6B70 800D5F70 080357E3 */  j          .L800D5F8C
/* D6B74 800D5F74 8FBF0094 */   lw        $ra, 0x94($sp)
/* D6B78 800D5F78 0C029BFC */  jal        load_borg_12
/* D6B7C 800D5F7C 8E040008 */   lw        $a0, 8($s0)
/* D6B80 800D5F80 8E030000 */  lw         $v1, ($s0)
.L800D5F84:
/* D6B84 800D5F84 AC620000 */  sw         $v0, ($v1)
/* D6B88 800D5F88 8FBF0094 */  lw         $ra, 0x94($sp)
.L800D5F8C:
/* D6B8C 800D5F8C 8FB00090 */  lw         $s0, 0x90($sp)
/* D6B90 800D5F90 03E00008 */  jr         $ra
/* D6B94 800D5F94 27BD0098 */   addiu     $sp, $sp, 0x98

glabel Process_queue_B
/* D6B98 800D5F98 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D6B9C 800D5F9C 3C02800F */  lui        $v0, %hi(queue_b_flag)
/* D6BA0 800D5FA0 AFB50024 */  sw         $s5, 0x24($sp)
/* D6BA4 800D5FA4 0040A821 */  addu       $s5, $v0, $zero
/* D6BA8 800D5FA8 944250F0 */  lhu        $v0, %lo(queue_b_flag)($v0)
/* D6BAC 800D5FAC AFB40020 */  sw         $s4, 0x20($sp)
/* D6BB0 800D5FB0 0000A021 */  addu       $s4, $zero, $zero
/* D6BB4 800D5FB4 AFB20018 */  sw         $s2, 0x18($sp)
/* D6BB8 800D5FB8 00809021 */  addu       $s2, $a0, $zero
/* D6BBC 800D5FBC AFB60028 */  sw         $s6, 0x28($sp)
/* D6BC0 800D5FC0 30B6FFFF */  andi       $s6, $a1, 0xffff
/* D6BC4 800D5FC4 AFBF0030 */  sw         $ra, 0x30($sp)
/* D6BC8 800D5FC8 AFB7002C */  sw         $s7, 0x2c($sp)
/* D6BCC 800D5FCC AFB3001C */  sw         $s3, 0x1c($sp)
/* D6BD0 800D5FD0 AFB10014 */  sw         $s1, 0x14($sp)
/* D6BD4 800D5FD4 AFB00010 */  sw         $s0, 0x10($sp)
/* D6BD8 800D5FD8 10400003 */  beqz       $v0, .L800D5FE8
/* D6BDC 800D5FDC 96530200 */   lhu       $s3, 0x200($s2)
/* D6BE0 800D5FE0 2442FFFF */  addiu      $v0, $v0, -1
/* D6BE4 800D5FE4 A6A250F0 */  sh         $v0, 0x50f0($s5)
.L800D5FE8:
/* D6BE8 800D5FE8 96420200 */  lhu        $v0, 0x200($s2)
/* D6BEC 800D5FEC 10400045 */  beqz       $v0, .L800D6104
/* D6BF0 800D5FF0 8FBF0030 */   lw        $ra, 0x30($sp)
/* D6BF4 800D5FF4 A6400200 */  sh         $zero, 0x200($s2)
/* D6BF8 800D5FF8 12600013 */  beqz       $s3, .L800D6048
/* D6BFC 800D5FFC 00008821 */   addu      $s1, $zero, $zero
/* D6C00 800D6000 24170003 */  addiu      $s7, $zero, 3
/* D6C04 800D6004 00111100 */  sll        $v0, $s1, 4
.L800D6008:
/* D6C08 800D6008 16C00004 */  bnez       $s6, .L800D601C
/* D6C0C 800D600C 02428021 */   addu      $s0, $s2, $v0
/* D6C10 800D6010 9202000E */  lbu        $v0, 0xe($s0)
/* D6C14 800D6014 14400008 */  bnez       $v0, .L800D6038
/* D6C18 800D6018 26220001 */   addiu     $v0, $s1, 1
.L800D601C:
/* D6C1C 800D601C 26820001 */  addiu      $v0, $s4, 1
/* D6C20 800D6020 3054FFFF */  andi       $s4, $v0, 0xffff
/* D6C24 800D6024 0C0357A2 */  jal        processAllocQueue
/* D6C28 800D6028 02002021 */   addu      $a0, $s0, $zero
/* D6C2C 800D602C A200000E */  sb         $zero, 0xe($s0)
/* D6C30 800D6030 A6B750F0 */  sh         $s7, 0x50f0($s5)
/* D6C34 800D6034 26220001 */  addiu      $v0, $s1, 1
.L800D6038:
/* D6C38 800D6038 3051FFFF */  andi       $s1, $v0, 0xffff
/* D6C3C 800D603C 0233182B */  sltu       $v1, $s1, $s3
/* D6C40 800D6040 1460FFF1 */  bnez       $v1, .L800D6008
/* D6C44 800D6044 00111100 */   sll       $v0, $s1, 4
.L800D6048:
/* D6C48 800D6048 16800011 */  bnez       $s4, .L800D6090
/* D6C4C 800D604C 96A250F0 */   lhu       $v0, 0x50f0($s5)
/* D6C50 800D6050 1440000F */  bnez       $v0, .L800D6090
/* D6C54 800D6054 00008821 */   addu      $s1, $zero, $zero
/* D6C58 800D6058 08035819 */  j          .L800D6064
/* D6C5C 800D605C 24140003 */   addiu     $s4, $zero, 3
.L800D6060:
/* D6C60 800D6060 3051FFFF */  andi       $s1, $v0, 0xffff
.L800D6064:
/* D6C64 800D6064 0233102B */  sltu       $v0, $s1, $s3
/* D6C68 800D6068 10400009 */  beqz       $v0, .L800D6090
/* D6C6C 800D606C 00111100 */   sll       $v0, $s1, 4
/* D6C70 800D6070 02428021 */  addu       $s0, $s2, $v0
/* D6C74 800D6074 9203000E */  lbu        $v1, 0xe($s0)
/* D6C78 800D6078 1060FFF9 */  beqz       $v1, .L800D6060
/* D6C7C 800D607C 26220001 */   addiu     $v0, $s1, 1
/* D6C80 800D6080 0C0357A2 */  jal        processAllocQueue
/* D6C84 800D6084 02002021 */   addu      $a0, $s0, $zero
/* D6C88 800D6088 A200000E */  sb         $zero, 0xe($s0)
/* D6C8C 800D608C A6B450F0 */  sh         $s4, 0x50f0($s5)
.L800D6090:
/* D6C90 800D6090 1260001B */  beqz       $s3, .L800D6100
/* D6C94 800D6094 00008821 */   addu      $s1, $zero, $zero
/* D6C98 800D6098 00111100 */  sll        $v0, $s1, 4
.L800D609C:
/* D6C9C 800D609C 02422821 */  addu       $a1, $s2, $v0
/* D6CA0 800D60A0 90A3000E */  lbu        $v1, 0xe($a1)
/* D6CA4 800D60A4 10600012 */  beqz       $v1, .L800D60F0
/* D6CA8 800D60A8 26260001 */   addiu     $a2, $s1, 1
/* D6CAC 800D60AC 96440200 */  lhu        $a0, 0x200($s2)
/* D6CB0 800D60B0 24820001 */  addiu      $v0, $a0, 1
/* D6CB4 800D60B4 3084FFFF */  andi       $a0, $a0, 0xffff
/* D6CB8 800D60B8 00042100 */  sll        $a0, $a0, 4
/* D6CBC 800D60BC A6420200 */  sh         $v0, 0x200($s2)
/* D6CC0 800D60C0 8CA30000 */  lw         $v1, ($a1)
/* D6CC4 800D60C4 00922021 */  addu       $a0, $a0, $s2
/* D6CC8 800D60C8 AC830000 */  sw         $v1, ($a0)
/* D6CCC 800D60CC 8CA20004 */  lw         $v0, 4($a1)
/* D6CD0 800D60D0 AC820004 */  sw         $v0, 4($a0)
/* D6CD4 800D60D4 8CA30008 */  lw         $v1, 8($a1)
/* D6CD8 800D60D8 AC830008 */  sw         $v1, 8($a0)
/* D6CDC 800D60DC 8CA2000C */  lw         $v0, 0xc($a1)
/* D6CE0 800D60E0 AC82000C */  sw         $v0, 0xc($a0)
/* D6CE4 800D60E4 96430200 */  lhu        $v1, 0x200($s2)
/* D6CE8 800D60E8 54660001 */  bnel       $v1, $a2, .L800D60F0
/* D6CEC 800D60EC A0A0000E */   sb        $zero, 0xe($a1)
.L800D60F0:
/* D6CF0 800D60F0 30D1FFFF */  andi       $s1, $a2, 0xffff
/* D6CF4 800D60F4 0233102B */  sltu       $v0, $s1, $s3
/* D6CF8 800D60F8 1440FFE8 */  bnez       $v0, .L800D609C
/* D6CFC 800D60FC 00111100 */   sll       $v0, $s1, 4
.L800D6100:
/* D6D00 800D6100 8FBF0030 */  lw         $ra, 0x30($sp)
.L800D6104:
/* D6D04 800D6104 8FB7002C */  lw         $s7, 0x2c($sp)
/* D6D08 800D6108 8FB60028 */  lw         $s6, 0x28($sp)
/* D6D0C 800D610C 8FB50024 */  lw         $s5, 0x24($sp)
/* D6D10 800D6110 8FB40020 */  lw         $s4, 0x20($sp)
/* D6D14 800D6114 8FB3001C */  lw         $s3, 0x1c($sp)
/* D6D18 800D6118 8FB20018 */  lw         $s2, 0x18($sp)
/* D6D1C 800D611C 8FB10014 */  lw         $s1, 0x14($sp)
/* D6D20 800D6120 8FB00010 */  lw         $s0, 0x10($sp)
/* D6D24 800D6124 03E00008 */  jr         $ra
/* D6D28 800D6128 27BD0038 */   addiu     $sp, $sp, 0x38
/* D6D2C 800D612C 00000000 */  nop
