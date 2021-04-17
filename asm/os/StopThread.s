.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonStopUserThreads
/* CE000 800CD400 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CE004 800CD404 AFB00010 */  sw         $s0, 0x10($sp)
/* CE008 800CD408 00808021 */  addu       $s0, $a0, $zero
/* CE00C 800CD40C AFBF0018 */  sw         $ra, 0x18($sp)
/* CE010 800CD410 0C030D90 */  jal        __osDisableInt
/* CE014 800CD414 AFB10014 */   sw        $s1, 0x14($sp)
/* CE018 800CD418 24030004 */  addiu      $v1, $zero, 4
/* CE01C 800CD41C 12000002 */  beqz       $s0, .L800CD428
/* CE020 800CD420 00408821 */   addu      $s1, $v0, $zero
/* CE024 800CD424 96030010 */  lhu        $v1, 0x10($s0)
.L800CD428:
/* CE028 800CD428 3063FFFF */  andi       $v1, $v1, 0xffff
/* CE02C 800CD42C 24020004 */  addiu      $v0, $zero, 4
/* CE030 800CD430 1062000C */  beq        $v1, $v0, .L800CD464
/* CE034 800CD434 28620005 */   slti      $v0, $v1, 5
/* CE038 800CD438 10400005 */  beqz       $v0, .L800CD450
/* CE03C 800CD43C 24020002 */   addiu     $v0, $zero, 2
/* CE040 800CD440 10620010 */  beq        $v1, $v0, .L800CD484
/* CE044 800CD444 00000000 */   nop
/* CE048 800CD448 08033526 */  j          .L800CD498
/* CE04C 800CD44C 00000000 */   nop
.L800CD450:
/* CE050 800CD450 24020008 */  addiu      $v0, $zero, 8
/* CE054 800CD454 1062000B */  beq        $v1, $v0, .L800CD484
/* CE058 800CD458 00000000 */   nop
/* CE05C 800CD45C 08033526 */  j          .L800CD498
/* CE060 800CD460 00000000 */   nop
.L800CD464:
/* CE064 800CD464 3C03800F */  lui        $v1, %hi(__osRunningThread)
/* CE068 800CD468 8C633CC0 */  lw         $v1, %lo(__osRunningThread)($v1)
/* CE06C 800CD46C 00002021 */  addu       $a0, $zero, $zero
/* CE070 800CD470 24020001 */  addiu      $v0, $zero, 1
/* CE074 800CD474 0C02FEA5 */  jal        __osEnqueueAndYeild
/* CE078 800CD478 A4620010 */   sh        $v0, 0x10($v1)
/* CE07C 800CD47C 08033526 */  j          .L800CD498
/* CE080 800CD480 00000000 */   nop
.L800CD484:
/* CE084 800CD484 8E040008 */  lw         $a0, 8($s0)
/* CE088 800CD488 24020001 */  addiu      $v0, $zero, 1
/* CE08C 800CD48C 02002821 */  addu       $a1, $s0, $zero
/* CE090 800CD490 0C0345F4 */  jal        __osDequeueThread
/* CE094 800CD494 A6020010 */   sh        $v0, 0x10($s0)
.L800CD498:
/* CE098 800CD498 0C030DAC */  jal        __osRestoreInt
/* CE09C 800CD49C 02202021 */   addu      $a0, $s1, $zero
/* CE0A0 800CD4A0 8FBF0018 */  lw         $ra, 0x18($sp)
/* CE0A4 800CD4A4 8FB10014 */  lw         $s1, 0x14($sp)
/* CE0A8 800CD4A8 8FB00010 */  lw         $s0, 0x10($sp)
/* CE0AC 800CD4AC 03E00008 */  jr         $ra
/* CE0B0 800CD4B0 27BD0020 */   addiu     $sp, $sp, 0x20
/* CE0B4 800CD4B4 00000000 */  nop
/* CE0B8 800CD4B8 00000000 */  nop
/* CE0BC 800CD4BC 00000000 */  nop
