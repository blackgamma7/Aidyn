.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osSetEventMesg
/* CD220 800CC620 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CD224 800CC624 AFB00010 */  sw         $s0, 0x10($sp)
/* CD228 800CC628 00808021 */  addu       $s0, $a0, $zero
/* CD22C 800CC62C AFB10014 */  sw         $s1, 0x14($sp)
/* CD230 800CC630 00A08821 */  addu       $s1, $a1, $zero
/* CD234 800CC634 AFB20018 */  sw         $s2, 0x18($sp)
/* CD238 800CC638 00C09021 */  addu       $s2, $a2, $zero
/* CD23C 800CC63C AFBF0020 */  sw         $ra, 0x20($sp)
/* CD240 800CC640 0C030D90 */  jal        __osDisableInt
/* CD244 800CC644 AFB3001C */   sw        $s3, 0x1c($sp)
/* CD248 800CC648 001018C0 */  sll        $v1, $s0, 3
/* CD24C 800CC64C 3C048010 */  lui        $a0, %hi(__osEventStateTab)
/* CD250 800CC650 2484E6A0 */  addiu      $a0, $a0, %lo(__osEventStateTab)
/* CD254 800CC654 00641821 */  addu       $v1, $v1, $a0
/* CD258 800CC658 00409821 */  addu       $s3, $v0, $zero
/* CD25C 800CC65C 2402000E */  addiu      $v0, $zero, 0xe
/* CD260 800CC660 AC710000 */  sw         $s1, ($v1)
/* CD264 800CC664 16020010 */  bne        $s0, $v0, .L800CC6A8
/* CD268 800CC668 AC720004 */   sw        $s2, 4($v1)
/* CD26C 800CC66C 3C02800F */  lui        $v0, %hi(__osShutdown)
/* CD270 800CC670 8C42383C */  lw         $v0, %lo(__osShutdown)($v0)
/* CD274 800CC674 1040000A */  beqz       $v0, .L800CC6A0
/* CD278 800CC678 24020001 */   addiu     $v0, $zero, 1
/* CD27C 800CC67C 3C02800F */  lui        $v0, %hi(seteventmesg_data_0000)
/* CD280 800CC680 8C4239D0 */  lw         $v0, %lo(seteventmesg_data_0000)($v0)
/* CD284 800CC684 14400006 */  bnez       $v0, .L800CC6A0
/* CD288 800CC688 24020001 */   addiu     $v0, $zero, 1
/* CD28C 800CC68C 02202021 */  addu       $a0, $s1, $zero
/* CD290 800CC690 02402821 */  addu       $a1, $s2, $zero
/* CD294 800CC694 0C03313C */  jal        osSendMesg
/* CD298 800CC698 00003021 */   addu      $a2, $zero, $zero
/* CD29C 800CC69C 24020001 */  addiu      $v0, $zero, 1
.L800CC6A0:
/* CD2A0 800CC6A0 3C01800F */  lui        $at, %hi(seteventmesg_data_0000)
/* CD2A4 800CC6A4 AC2239D0 */  sw         $v0, %lo(seteventmesg_data_0000)($at)
.L800CC6A8:
/* CD2A8 800CC6A8 0C030DAC */  jal        __osRestoreInt
/* CD2AC 800CC6AC 02602021 */   addu      $a0, $s3, $zero
/* CD2B0 800CC6B0 8FBF0020 */  lw         $ra, 0x20($sp)
/* CD2B4 800CC6B4 8FB3001C */  lw         $s3, 0x1c($sp)
/* CD2B8 800CC6B8 8FB20018 */  lw         $s2, 0x18($sp)
/* CD2BC 800CC6BC 8FB10014 */  lw         $s1, 0x14($sp)
/* CD2C0 800CC6C0 8FB00010 */  lw         $s0, 0x10($sp)
/* CD2C4 800CC6C4 03E00008 */  jr         $ra
/* CD2C8 800CC6C8 27BD0028 */   addiu     $sp, $sp, 0x28
/* CD2CC 800CC6CC 00000000 */  nop
