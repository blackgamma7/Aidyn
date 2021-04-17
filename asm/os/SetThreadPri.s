.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osSetThreadPri
/* CD3D0 800CC7D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD3D4 800CC7D4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD3D8 800CC7D8 00808021 */  addu       $s0, $a0, $zero
/* CD3DC 800CC7DC AFB10014 */  sw         $s1, 0x14($sp)
/* CD3E0 800CC7E0 00A08821 */  addu       $s1, $a1, $zero
/* CD3E4 800CC7E4 AFBF001C */  sw         $ra, 0x1c($sp)
/* CD3E8 800CC7E8 0C030D90 */  jal        __osDisableInt
/* CD3EC 800CC7EC AFB20018 */   sw        $s2, 0x18($sp)
/* CD3F0 800CC7F0 16000003 */  bnez       $s0, .L800CC800
/* CD3F4 800CC7F4 00409021 */   addu      $s2, $v0, $zero
/* CD3F8 800CC7F8 3C10800F */  lui        $s0, %hi(__osRunningThread)
/* CD3FC 800CC7FC 8E103CC0 */  lw         $s0, %lo(__osRunningThread)($s0)
.L800CC800:
/* CD400 800CC800 8E020004 */  lw         $v0, 4($s0)
/* CD404 800CC804 1051001C */  beq        $v0, $s1, .L800CC878
/* CD408 800CC808 00000000 */   nop
/* CD40C 800CC80C 3C02800F */  lui        $v0, %hi(__osRunningThread)
/* CD410 800CC810 8C423CC0 */  lw         $v0, %lo(__osRunningThread)($v0)
/* CD414 800CC814 1202000B */  beq        $s0, $v0, .L800CC844
/* CD418 800CC818 AE110004 */   sw        $s1, 4($s0)
/* CD41C 800CC81C 96030010 */  lhu        $v1, 0x10($s0)
/* CD420 800CC820 24020001 */  addiu      $v0, $zero, 1
/* CD424 800CC824 10620007 */  beq        $v1, $v0, .L800CC844
/* CD428 800CC828 00000000 */   nop
/* CD42C 800CC82C 8E040008 */  lw         $a0, 8($s0)
/* CD430 800CC830 0C0345F4 */  jal        __osDequeueThread
/* CD434 800CC834 02002821 */   addu      $a1, $s0, $zero
/* CD438 800CC838 8E040008 */  lw         $a0, 8($s0)
/* CD43C 800CC83C 0C02FEE7 */  jal        __osEnqueueThread
/* CD440 800CC840 02002821 */   addu      $a1, $s0, $zero
.L800CC844:
/* CD444 800CC844 3C04800F */  lui        $a0, %hi(__osRunningThread)
/* CD448 800CC848 8C843CC0 */  lw         $a0, %lo(__osRunningThread)($a0)
/* CD44C 800CC84C 3C02800F */  lui        $v0, %hi(__osRunQueue)
/* CD450 800CC850 8C423CB8 */  lw         $v0, %lo(__osRunQueue)($v0)
/* CD454 800CC854 8C830004 */  lw         $v1, 4($a0)
/* CD458 800CC858 8C420004 */  lw         $v0, 4($v0)
/* CD45C 800CC85C 0062182A */  slt        $v1, $v1, $v0
/* CD460 800CC860 10600005 */  beqz       $v1, .L800CC878
/* CD464 800CC864 24020002 */   addiu     $v0, $zero, 2
/* CD468 800CC868 A4820010 */  sh         $v0, 0x10($a0)
/* CD46C 800CC86C 3C04800F */  lui        $a0, %hi(__osRunQueue)
/* CD470 800CC870 0C02FEA5 */  jal        __osEnqueueAndYeild
/* CD474 800CC874 24843CB8 */   addiu     $a0, $a0, %lo(__osRunQueue)
.L800CC878:
/* CD478 800CC878 0C030DAC */  jal        __osRestoreInt
/* CD47C 800CC87C 02402021 */   addu      $a0, $s2, $zero
/* CD480 800CC880 8FBF001C */  lw         $ra, 0x1c($sp)
/* CD484 800CC884 8FB20018 */  lw         $s2, 0x18($sp)
/* CD488 800CC888 8FB10014 */  lw         $s1, 0x14($sp)
/* CD48C 800CC88C 8FB00010 */  lw         $s0, 0x10($sp)
/* CD490 800CC890 03E00008 */  jr         $ra
/* CD494 800CC894 27BD0020 */   addiu     $sp, $sp, 0x20
/* CD498 800CC898 00000000 */  nop
/* CD49C 800CC89C 00000000 */  nop
