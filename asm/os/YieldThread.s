.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osYieldThread
/* D5920 800D4D20 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5924 800D4D24 AFBF0014 */  sw         $ra, 0x14($sp)
/* D5928 800D4D28 0C030D90 */  jal        __osDisableInt
/* D592C 800D4D2C AFB00010 */   sw        $s0, 0x10($sp)
/* D5930 800D4D30 3C03800F */  lui        $v1, %hi(__osRunningThread)
/* D5934 800D4D34 8C633CC0 */  lw         $v1, %lo(__osRunningThread)($v1)
/* D5938 800D4D38 3C04800F */  lui        $a0, %hi(__osRunQueue)
/* D593C 800D4D3C 24843CB8 */  addiu      $a0, $a0, %lo(__osRunQueue)
/* D5940 800D4D40 24050002 */  addiu      $a1, $zero, 2
/* D5944 800D4D44 00408021 */  addu       $s0, $v0, $zero
/* D5948 800D4D48 0C02FEA5 */  jal        __osEnqueueAndYeild
/* D594C 800D4D4C A4650010 */   sh        $a1, 0x10($v1)
/* D5950 800D4D50 0C030DAC */  jal        __osRestoreInt
/* D5954 800D4D54 02002021 */   addu      $a0, $s0, $zero
/* D5958 800D4D58 8FBF0014 */  lw         $ra, 0x14($sp)
/* D595C 800D4D5C 8FB00010 */  lw         $s0, 0x10($sp)
/* D5960 800D4D60 03E00008 */  jr         $ra
/* D5964 800D4D64 27BD0018 */   addiu     $sp, $sp, 0x18
/* D5968 800D4D68 00000000 */  nop
/* D596C 800D4D6C 00000000 */  nop
