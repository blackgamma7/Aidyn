.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsFileState
/* C6B30 800C5F30 27BDFEB0 */  addiu      $sp, $sp, -0x150
/* C6B34 800C5F34 AFB10134 */  sw         $s1, 0x134($sp)
/* C6B38 800C5F38 00808821 */  addu       $s1, $a0, $zero
/* C6B3C 800C5F3C AFB00130 */  sw         $s0, 0x130($sp)
/* C6B40 800C5F40 00A08021 */  addu       $s0, $a1, $zero
/* C6B44 800C5F44 AFBF0148 */  sw         $ra, 0x148($sp)
/* C6B48 800C5F48 AFB50144 */  sw         $s5, 0x144($sp)
/* C6B4C 800C5F4C AFB40140 */  sw         $s4, 0x140($sp)
/* C6B50 800C5F50 AFB3013C */  sw         $s3, 0x13c($sp)
/* C6B54 800C5F54 AFB20138 */  sw         $s2, 0x138($sp)
/* C6B58 800C5F58 8E220050 */  lw         $v0, 0x50($s1)
/* C6B5C 800C5F5C 00101FC2 */  srl        $v1, $s0, 0x1f
/* C6B60 800C5F60 0202102A */  slt        $v0, $s0, $v0
/* C6B64 800C5F64 38420001 */  xori       $v0, $v0, 1
/* C6B68 800C5F68 00431025 */  or         $v0, $v0, $v1
/* C6B6C 800C5F6C 1440001F */  bnez       $v0, .L800C5FEC
/* C6B70 800C5F70 00C0A021 */   addu      $s4, $a2, $zero
/* C6B74 800C5F74 8E220000 */  lw         $v0, ($s1)
/* C6B78 800C5F78 30420001 */  andi       $v0, $v0, 1
/* C6B7C 800C5F7C 10400048 */  beqz       $v0, .L800C60A0
/* C6B80 800C5F80 24020005 */   addiu     $v0, $zero, 5
/* C6B84 800C5F84 0C031601 */  jal        __osCheckId
/* C6B88 800C5F88 02202021 */   addu      $a0, $s1, $zero
/* C6B8C 800C5F8C 14400044 */  bnez       $v0, .L800C60A0
/* C6B90 800C5F90 00000000 */   nop
/* C6B94 800C5F94 92220065 */  lbu        $v0, 0x65($s1)
/* C6B98 800C5F98 10400005 */  beqz       $v0, .L800C5FB0
/* C6B9C 800C5F9C 02202021 */   addu      $a0, $s1, $zero
/* C6BA0 800C5FA0 0C031DC8 */  jal        __osPfsSelectBank
/* C6BA4 800C5FA4 00002821 */   addu      $a1, $zero, $zero
/* C6BA8 800C5FA8 1440003D */  bnez       $v0, .L800C60A0
/* C6BAC 800C5FAC 00000000 */   nop
.L800C5FB0:
/* C6BB0 800C5FB0 8E240004 */  lw         $a0, 4($s1)
/* C6BB4 800C5FB4 8E26005C */  lw         $a2, 0x5c($s1)
/* C6BB8 800C5FB8 8E250008 */  lw         $a1, 8($s1)
/* C6BBC 800C5FBC 27A70110 */  addiu      $a3, $sp, 0x110
/* C6BC0 800C5FC0 00D03021 */  addu       $a2, $a2, $s0
/* C6BC4 800C5FC4 0C0309EC */  jal        __osContRamRead
/* C6BC8 800C5FC8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C6BCC 800C5FCC 14400034 */  bnez       $v0, .L800C60A0
/* C6BD0 800C5FD0 00000000 */   nop
/* C6BD4 800C5FD4 97A20114 */  lhu        $v0, 0x114($sp)
/* C6BD8 800C5FD8 10400031 */  beqz       $v0, .L800C60A0
/* C6BDC 800C5FDC 24020005 */   addiu     $v0, $zero, 5
/* C6BE0 800C5FE0 8FA20110 */  lw         $v0, 0x110($sp)
/* C6BE4 800C5FE4 14400003 */  bnez       $v0, .L800C5FF4
/* C6BE8 800C5FE8 00009821 */   addu      $s3, $zero, $zero
.L800C5FEC:
/* C6BEC 800C5FEC 08031828 */  j          .L800C60A0
/* C6BF0 800C5FF0 24020005 */   addiu     $v0, $zero, 5
.L800C5FF4:
/* C6BF4 800C5FF4 97B00116 */  lhu        $s0, 0x116($sp)
/* C6BF8 800C5FF8 241200FF */  addiu      $s2, $zero, 0xff
/* C6BFC 800C5FFC 27B50010 */  addiu      $s5, $sp, 0x10
.L800C6000:
/* C6C00 800C6000 8E220060 */  lw         $v0, 0x60($s1)
/* C6C04 800C6004 3203FFFF */  andi       $v1, $s0, 0xffff
/* C6C08 800C6008 0062102A */  slt        $v0, $v1, $v0
/* C6C0C 800C600C 14400010 */  bnez       $v0, .L800C6050
/* C6C10 800C6010 00031202 */   srl       $v0, $v1, 8
/* C6C14 800C6014 304700FF */  andi       $a3, $v0, 0xff
/* C6C18 800C6018 10F20007 */  beq        $a3, $s2, .L800C6038
/* C6C1C 800C601C 02202021 */   addu      $a0, $s1, $zero
/* C6C20 800C6020 00409021 */  addu       $s2, $v0, $zero
/* C6C24 800C6024 27A50010 */  addiu      $a1, $sp, 0x10
/* C6C28 800C6028 0C03162F */  jal        __osPfsRWInode
/* C6C2C 800C602C 00003021 */   addu      $a2, $zero, $zero
/* C6C30 800C6030 1440001B */  bnez       $v0, .L800C60A0
/* C6C34 800C6034 00000000 */   nop
.L800C6038:
/* C6C38 800C6038 320200FF */  andi       $v0, $s0, 0xff
/* C6C3C 800C603C 00021040 */  sll        $v0, $v0, 1
/* C6C40 800C6040 00551021 */  addu       $v0, $v0, $s5
/* C6C44 800C6044 94500000 */  lhu        $s0, ($v0)
/* C6C48 800C6048 08031800 */  j          .L800C6000
/* C6C4C 800C604C 26730001 */   addiu     $s3, $s3, 1
.L800C6050:
/* C6C50 800C6050 24020001 */  addiu      $v0, $zero, 1
/* C6C54 800C6054 14620012 */  bne        $v1, $v0, .L800C60A0
/* C6C58 800C6058 24020003 */   addiu     $v0, $zero, 3
/* C6C5C 800C605C 00131200 */  sll        $v0, $s3, 8
/* C6C60 800C6060 AE820000 */  sw         $v0, ($s4)
/* C6C64 800C6064 97A20114 */  lhu        $v0, 0x114($sp)
/* C6C68 800C6068 27A40120 */  addiu      $a0, $sp, 0x120
/* C6C6C 800C606C A6820008 */  sh         $v0, 8($s4)
/* C6C70 800C6070 8FA20110 */  lw         $v0, 0x110($sp)
/* C6C74 800C6074 2685000E */  addiu      $a1, $s4, 0xe
/* C6C78 800C6078 24060010 */  addiu      $a2, $zero, 0x10
/* C6C7C 800C607C 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C6C80 800C6080 AE820004 */   sw        $v0, 4($s4)
/* C6C84 800C6084 27A4011C */  addiu      $a0, $sp, 0x11c
/* C6C88 800C6088 2685000A */  addiu      $a1, $s4, 0xa
/* C6C8C 800C608C 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C6C90 800C6090 24060004 */   addiu     $a2, $zero, 4
/* C6C94 800C6094 8E240004 */  lw         $a0, 4($s1)
/* C6C98 800C6098 0C031878 */  jal        __osPfsGetStatus
/* C6C9C 800C609C 8E250008 */   lw        $a1, 8($s1)
.L800C60A0:
/* C6CA0 800C60A0 8FBF0148 */  lw         $ra, 0x148($sp)
/* C6CA4 800C60A4 8FB50144 */  lw         $s5, 0x144($sp)
/* C6CA8 800C60A8 8FB40140 */  lw         $s4, 0x140($sp)
/* C6CAC 800C60AC 8FB3013C */  lw         $s3, 0x13c($sp)
/* C6CB0 800C60B0 8FB20138 */  lw         $s2, 0x138($sp)
/* C6CB4 800C60B4 8FB10134 */  lw         $s1, 0x134($sp)
/* C6CB8 800C60B8 8FB00130 */  lw         $s0, 0x130($sp)
/* C6CBC 800C60BC 03E00008 */  jr         $ra
/* C6CC0 800C60C0 27BD0150 */   addiu     $sp, $sp, 0x150
/* C6CC4 800C60C4 00000000 */  nop
/* C6CC8 800C60C8 00000000 */  nop
/* C6CCC 800C60CC 00000000 */  nop
