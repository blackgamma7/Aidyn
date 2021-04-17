.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViBlack
/* D28E0 800D1CE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D28E4 800D1CE4 AFB00010 */  sw         $s0, 0x10($sp)
/* D28E8 800D1CE8 AFBF0014 */  sw         $ra, 0x14($sp)
/* D28EC 800D1CEC 0C030D90 */  jal        __osDisableInt
/* D28F0 800D1CF0 00808021 */   addu      $s0, $a0, $zero
/* D28F4 800D1CF4 321000FF */  andi       $s0, $s0, 0xff
/* D28F8 800D1CF8 12000006 */  beqz       $s0, .L800D1D14
/* D28FC 800D1CFC 00402021 */   addu      $a0, $v0, $zero
/* D2900 800D1D00 3C03800F */  lui        $v1, %hi(__osViNext)
/* D2904 800D1D04 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D2908 800D1D08 94620000 */  lhu        $v0, ($v1)
/* D290C 800D1D0C 08034749 */  j          .L800D1D24
/* D2910 800D1D10 34420020 */   ori       $v0, $v0, 0x20
.L800D1D14:
/* D2914 800D1D14 3C03800F */  lui        $v1, %hi(__osViNext)
/* D2918 800D1D18 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D291C 800D1D1C 94620000 */  lhu        $v0, ($v1)
/* D2920 800D1D20 3042FFDF */  andi       $v0, $v0, 0xffdf
.L800D1D24:
/* D2924 800D1D24 0C030DAC */  jal        __osRestoreInt
/* D2928 800D1D28 A4620000 */   sh        $v0, ($v1)
/* D292C 800D1D2C 8FBF0014 */  lw         $ra, 0x14($sp)
/* D2930 800D1D30 8FB00010 */  lw         $s0, 0x10($sp)
/* D2934 800D1D34 03E00008 */  jr         $ra
/* D2938 800D1D38 27BD0018 */   addiu     $sp, $sp, 0x18
/* D293C 800D1D3C 00000000 */  nop
