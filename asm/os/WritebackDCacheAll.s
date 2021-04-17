.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osWritebackDCacheAll
/* D3540 800D2940 3C088000 */  lui        $t0, 0x8000
/* D3544 800D2944 240A2000 */  addiu      $t2, $zero, 0x2000
/* D3548 800D2948 010A4821 */  addu       $t1, $t0, $t2
/* D354C 800D294C 2529FFF0 */  addiu      $t1, $t1, -0x10
.L800D2950:
/* D3550 800D2950 BD010000 */  cache      1, ($t0)
/* D3554 800D2954 0109082B */  sltu       $at, $t0, $t1
/* D3558 800D2958 1420FFFD */  bnez       $at, .L800D2950
/* D355C 800D295C 25080010 */   addiu     $t0, $t0, 0x10
/* D3560 800D2960 03E00008 */  jr         $ra
/* D3564 800D2964 00000000 */   nop
/* D3568 800D2968 00000000 */  nop
/* D356C 800D296C 00000000 */  nop
