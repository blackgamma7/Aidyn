.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osSendMesg
/* CD0F0 800CC4F0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CD0F4 800CC4F4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD0F8 800CC4F8 00808021 */  addu       $s0, $a0, $zero
/* CD0FC 800CC4FC AFB50024 */  sw         $s5, 0x24($sp)
/* CD100 800CC500 00A0A821 */  addu       $s5, $a1, $zero
/* CD104 800CC504 AFB20018 */  sw         $s2, 0x18($sp)
/* CD108 800CC508 00C09021 */  addu       $s2, $a2, $zero
/* CD10C 800CC50C AFBF0028 */  sw         $ra, 0x28($sp)
/* CD110 800CC510 AFB40020 */  sw         $s4, 0x20($sp)
/* CD114 800CC514 AFB3001C */  sw         $s3, 0x1c($sp)
/* CD118 800CC518 0C030D90 */  jal        __osDisableInt
/* CD11C 800CC51C AFB10014 */   sw        $s1, 0x14($sp)
/* CD120 800CC520 8E030008 */  lw         $v1, 8($s0)
/* CD124 800CC524 8E040010 */  lw         $a0, 0x10($s0)
/* CD128 800CC528 0064182A */  slt        $v1, $v1, $a0
/* CD12C 800CC52C 14600012 */  bnez       $v1, .L800CC578
/* CD130 800CC530 00408821 */   addu      $s1, $v0, $zero
/* CD134 800CC534 24140001 */  addiu      $s4, $zero, 1
/* CD138 800CC538 24130008 */  addiu      $s3, $zero, 8
.L800CC53C:
/* CD13C 800CC53C 12540005 */  beq        $s2, $s4, .L800CC554
/* CD140 800CC540 26040004 */   addiu     $a0, $s0, 4
/* CD144 800CC544 0C030DAC */  jal        __osRestoreInt
/* CD148 800CC548 02202021 */   addu      $a0, $s1, $zero
/* CD14C 800CC54C 0803317F */  j          .L800CC5FC
/* CD150 800CC550 2402FFFF */   addiu     $v0, $zero, -1
.L800CC554:
/* CD154 800CC554 3C02800F */  lui        $v0, %hi(__osRunningThread)
/* CD158 800CC558 8C423CC0 */  lw         $v0, %lo(__osRunningThread)($v0)
/* CD15C 800CC55C 0C02FEA5 */  jal        __osEnqueueAndYeild
/* CD160 800CC560 A4530010 */   sh        $s3, 0x10($v0)
/* CD164 800CC564 8E020008 */  lw         $v0, 8($s0)
/* CD168 800CC568 8E030010 */  lw         $v1, 0x10($s0)
/* CD16C 800CC56C 0043102A */  slt        $v0, $v0, $v1
/* CD170 800CC570 1040FFF2 */  beqz       $v0, .L800CC53C
/* CD174 800CC574 00000000 */   nop
.L800CC578:
/* CD178 800CC578 8E03000C */  lw         $v1, 0xc($s0)
/* CD17C 800CC57C 8E040008 */  lw         $a0, 8($s0)
/* CD180 800CC580 8E020010 */  lw         $v0, 0x10($s0)
/* CD184 800CC584 00641821 */  addu       $v1, $v1, $a0
/* CD188 800CC588 0062001A */  div        $zero, $v1, $v0
/* CD18C 800CC58C 14400002 */  bnez       $v0, .L800CC598
/* CD190 800CC590 00000000 */   nop
/* CD194 800CC594 0007000D */  break      7
.L800CC598:
/* CD198 800CC598 2401FFFF */   addiu     $at, $zero, -1
/* CD19C 800CC59C 14410004 */  bne        $v0, $at, .L800CC5B0
/* CD1A0 800CC5A0 3C018000 */   lui       $at, 0x8000
/* CD1A4 800CC5A4 14610002 */  bne        $v1, $at, .L800CC5B0
/* CD1A8 800CC5A8 00000000 */   nop
/* CD1AC 800CC5AC 0006000D */  break      6
.L800CC5B0:
/* CD1B0 800CC5B0 00001010 */   mfhi      $v0
/* CD1B4 800CC5B4 8E030014 */  lw         $v1, 0x14($s0)
/* CD1B8 800CC5B8 00021080 */  sll        $v0, $v0, 2
/* CD1BC 800CC5BC 00431021 */  addu       $v0, $v0, $v1
/* CD1C0 800CC5C0 AC550000 */  sw         $s5, ($v0)
/* CD1C4 800CC5C4 8E020008 */  lw         $v0, 8($s0)
/* CD1C8 800CC5C8 8E030000 */  lw         $v1, ($s0)
/* CD1CC 800CC5CC 24420001 */  addiu      $v0, $v0, 1
/* CD1D0 800CC5D0 AE020008 */  sw         $v0, 8($s0)
/* CD1D4 800CC5D4 8C620000 */  lw         $v0, ($v1)
/* CD1D8 800CC5D8 10400005 */  beqz       $v0, .L800CC5F0
/* CD1DC 800CC5DC 00000000 */   nop
/* CD1E0 800CC5E0 0C02FEF9 */  jal        __osPopThread
/* CD1E4 800CC5E4 02002021 */   addu      $a0, $s0, $zero
/* CD1E8 800CC5E8 0C0334B8 */  jal        osStartThread
/* CD1EC 800CC5EC 00402021 */   addu      $a0, $v0, $zero
.L800CC5F0:
/* CD1F0 800CC5F0 0C030DAC */  jal        __osRestoreInt
/* CD1F4 800CC5F4 02202021 */   addu      $a0, $s1, $zero
/* CD1F8 800CC5F8 00001021 */  addu       $v0, $zero, $zero
.L800CC5FC:
/* CD1FC 800CC5FC 8FBF0028 */  lw         $ra, 0x28($sp)
/* CD200 800CC600 8FB50024 */  lw         $s5, 0x24($sp)
/* CD204 800CC604 8FB40020 */  lw         $s4, 0x20($sp)
/* CD208 800CC608 8FB3001C */  lw         $s3, 0x1c($sp)
/* CD20C 800CC60C 8FB20018 */  lw         $s2, 0x18($sp)
/* CD210 800CC610 8FB10014 */  lw         $s1, 0x14($sp)
/* CD214 800CC614 8FB00010 */  lw         $s0, 0x10($sp)
/* CD218 800CC618 03E00008 */  jr         $ra
/* CD21C 800CC61C 27BD0030 */   addiu     $sp, $sp, 0x30
