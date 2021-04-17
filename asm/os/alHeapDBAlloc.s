.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alHeapDBAlloc
/* C3D10 800C3110 8FA20010 */  lw         $v0, 0x10($sp)
/* C3D14 800C3114 00E20018 */  mult       $a3, $v0
/* C3D18 800C3118 00003812 */  mflo       $a3
/* C3D1C 800C311C 8CC30008 */  lw         $v1, 8($a2)
/* C3D20 800C3120 8CC20000 */  lw         $v0, ($a2)
/* C3D24 800C3124 2404FFF0 */  addiu      $a0, $zero, -0x10
/* C3D28 800C3128 8CC50004 */  lw         $a1, 4($a2)
/* C3D2C 800C312C 00431021 */  addu       $v0, $v0, $v1
/* C3D30 800C3130 24E7000F */  addiu      $a3, $a3, 0xf
/* C3D34 800C3134 00E43824 */  and        $a3, $a3, $a0
/* C3D38 800C3138 00A72021 */  addu       $a0, $a1, $a3
/* C3D3C 800C313C 0044102B */  sltu       $v0, $v0, $a0
/* C3D40 800C3140 14400003 */  bnez       $v0, .L800C3150
/* C3D44 800C3144 00004021 */   addu      $t0, $zero, $zero
/* C3D48 800C3148 00A04021 */  addu       $t0, $a1, $zero
/* C3D4C 800C314C ACC40004 */  sw         $a0, 4($a2)
.L800C3150:
/* C3D50 800C3150 03E00008 */  jr         $ra
/* C3D54 800C3154 01001021 */   addu      $v0, $t0, $zero
/* C3D58 800C3158 00000000 */  nop
/* C3D5C 800C315C 00000000 */  nop
