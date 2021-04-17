.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonExecute
/* C96C0 800C8AC0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* C96C4 800C8AC4 AFB00020 */  sw         $s0, 0x20($sp)
/* C96C8 800C8AC8 00808021 */  addu       $s0, $a0, $zero
/* C96CC 800C8ACC AFBF0028 */  sw         $ra, 0x28($sp)
/* C96D0 800C8AD0 AFB10024 */  sw         $s1, 0x24($sp)
/* C96D4 800C8AD4 92030004 */  lbu        $v1, 4($s0)
/* C96D8 800C8AD8 2C620035 */  sltiu      $v0, $v1, 0x35
/* C96DC 800C8ADC 14400003 */  bnez       $v0, .L800C8AEC
/* C96E0 800C8AE0 00031080 */   sll       $v0, $v1, 2
/* C96E4 800C8AE4 080322CB */  j          .L800C8B2C
/* C96E8 800C8AE8 2402FFFF */   addiu     $v0, $zero, -1
.L800C8AEC:
/* C96EC 800C8AEC 3C01800F */  lui        $at, %hi(dispatchTable)
/* C96F0 800C8AF0 00220821 */  addu       $at, $at, $v0
/* C96F4 800C8AF4 8C2238C0 */  lw         $v0, %lo(dispatchTable)($at)
/* C96F8 800C8AF8 0040F809 */  jalr       $v0
/* C96FC 800C8AFC 02002021 */   addu      $a0, $s0, $zero
/* C9700 800C8B00 00408821 */  addu       $s1, $v0, $zero
/* C9704 800C8B04 06210009 */  bgez       $s1, .L800C8B2C
/* C9708 800C8B08 02201021 */   addu      $v0, $s1, $zero
/* C970C 800C8B0C 92020004 */  lbu        $v0, 4($s0)
/* C9710 800C8B10 27A40010 */  addiu      $a0, $sp, 0x10
/* C9714 800C8B14 2405000C */  addiu      $a1, $zero, 0xc
/* C9718 800C8B18 24060001 */  addiu      $a2, $zero, 1
/* C971C 800C8B1C A7B10016 */  sh         $s1, 0x16($sp)
/* C9720 800C8B20 0C03255A */  jal        __rmonSendReply
/* C9724 800C8B24 A3A20014 */   sb        $v0, 0x14($sp)
/* C9728 800C8B28 02201021 */  addu       $v0, $s1, $zero
.L800C8B2C:
/* C972C 800C8B2C 8FBF0028 */  lw         $ra, 0x28($sp)
/* C9730 800C8B30 8FB10024 */  lw         $s1, 0x24($sp)
/* C9734 800C8B34 8FB00020 */  lw         $s0, 0x20($sp)
/* C9738 800C8B38 03E00008 */  jr         $ra
/* C973C 800C8B3C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel NotImplemented
/* C9740 800C8B40 03E00008 */  jr         $ra
/* C9744 800C8B44 2402FFFF */   addiu     $v0, $zero, -1
/* C9748 800C8B48 00000000 */  nop
/* C974C 800C8B4C 00000000 */  nop
