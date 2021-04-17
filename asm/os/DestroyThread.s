.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osDestroyThread
/* C30D0 800C24D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C30D4 800C24D4 AFB00010 */  sw         $s0, 0x10($sp)
/* C30D8 800C24D8 00808021 */  addu       $s0, $a0, $zero
/* C30DC 800C24DC AFBF0018 */  sw         $ra, 0x18($sp)
/* C30E0 800C24E0 0C030D90 */  jal        __osDisableInt
/* C30E4 800C24E4 AFB10014 */   sw        $s1, 0x14($sp)
/* C30E8 800C24E8 16000004 */  bnez       $s0, .L800C24FC
/* C30EC 800C24EC 00408821 */   addu      $s1, $v0, $zero
/* C30F0 800C24F0 3C10800F */  lui        $s0, %hi(__osRunningThread)
/* C30F4 800C24F4 08030946 */  j          .L800C2518
/* C30F8 800C24F8 8E103CC0 */   lw        $s0, %lo(__osRunningThread)($s0)
.L800C24FC:
/* C30FC 800C24FC 96030010 */  lhu        $v1, 0x10($s0)
/* C3100 800C2500 24020001 */  addiu      $v0, $zero, 1
/* C3104 800C2504 10620004 */  beq        $v1, $v0, .L800C2518
/* C3108 800C2508 00000000 */   nop
/* C310C 800C250C 8E040008 */  lw         $a0, 8($s0)
/* C3110 800C2510 0C0345F4 */  jal        __osDequeueThread
/* C3114 800C2514 02002821 */   addu      $a1, $s0, $zero
.L800C2518:
/* C3118 800C2518 3C02800F */  lui        $v0, %hi(__osActiveQueue)
/* C311C 800C251C 8C423CBC */  lw         $v0, %lo(__osActiveQueue)($v0)
/* C3120 800C2520 14500008 */  bne        $v0, $s0, .L800C2544
/* C3124 800C2524 00402021 */   addu      $a0, $v0, $zero
/* C3128 800C2528 8E02000C */  lw         $v0, 0xc($s0)
/* C312C 800C252C 3C01800F */  lui        $at, %hi(__osActiveQueue)
/* C3130 800C2530 0803095D */  j          .L800C2574
/* C3134 800C2534 AC223CBC */   sw        $v0, %lo(__osActiveQueue)($at)
.L800C2538:
/* C3138 800C2538 8E02000C */  lw         $v0, 0xc($s0)
/* C313C 800C253C 0803095D */  j          .L800C2574
/* C3140 800C2540 AC82000C */   sw        $v0, 0xc($a0)
.L800C2544:
/* C3144 800C2544 8C830004 */  lw         $v1, 4($a0)
/* C3148 800C2548 2402FFFF */  addiu      $v0, $zero, -1
/* C314C 800C254C 10620009 */  beq        $v1, $v0, .L800C2574
/* C3150 800C2550 00000000 */   nop
/* C3154 800C2554 2403FFFF */  addiu      $v1, $zero, -1
.L800C2558:
/* C3158 800C2558 8C82000C */  lw         $v0, 0xc($a0)
/* C315C 800C255C 1050FFF6 */  beq        $v0, $s0, .L800C2538
/* C3160 800C2560 00000000 */   nop
/* C3164 800C2564 00402021 */  addu       $a0, $v0, $zero
/* C3168 800C2568 8C820004 */  lw         $v0, 4($a0)
/* C316C 800C256C 1443FFFA */  bne        $v0, $v1, .L800C2558
/* C3170 800C2570 00000000 */   nop
.L800C2574:
/* C3174 800C2574 3C02800F */  lui        $v0, %hi(__osRunningThread)
/* C3178 800C2578 8C423CC0 */  lw         $v0, %lo(__osRunningThread)($v0)
/* C317C 800C257C 16020003 */  bne        $s0, $v0, .L800C258C
/* C3180 800C2580 00000000 */   nop
/* C3184 800C2584 0C02FEFD */  jal        __osDispatchThread
/* C3188 800C2588 00000000 */   nop
.L800C258C:
/* C318C 800C258C 0C030DAC */  jal        __osRestoreInt
/* C3190 800C2590 02202021 */   addu      $a0, $s1, $zero
/* C3194 800C2594 8FBF0018 */  lw         $ra, 0x18($sp)
/* C3198 800C2598 8FB10014 */  lw         $s1, 0x14($sp)
/* C319C 800C259C 8FB00010 */  lw         $s0, 0x10($sp)
/* C31A0 800C25A0 03E00008 */  jr         $ra
/* C31A4 800C25A4 27BD0020 */   addiu     $sp, $sp, 0x20
/* C31A8 800C25A8 00000000 */  nop
/* C31AC 800C25AC 00000000 */  nop
