.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osWritebackDCache
/* D34C0 800D28C0 18A00011 */  blez       $a1, .L800D2908
/* D34C4 800D28C4 00000000 */   nop
/* D34C8 800D28C8 240B2000 */  addiu      $t3, $zero, 0x2000
/* D34CC 800D28CC 00AB082B */  sltu       $at, $a1, $t3
/* D34D0 800D28D0 1020000F */  beqz       $at, .L800D2910
/* D34D4 800D28D4 00000000 */   nop
/* D34D8 800D28D8 00804021 */  addu       $t0, $a0, $zero
/* D34DC 800D28DC 00854821 */  addu       $t1, $a0, $a1
/* D34E0 800D28E0 0109082B */  sltu       $at, $t0, $t1
/* D34E4 800D28E4 10200008 */  beqz       $at, .L800D2908
/* D34E8 800D28E8 00000000 */   nop
/* D34EC 800D28EC 2529FFF0 */  addiu      $t1, $t1, -0x10
/* D34F0 800D28F0 310A000F */  andi       $t2, $t0, 0xf
/* D34F4 800D28F4 010A4023 */  subu       $t0, $t0, $t2
.L800D28F8:
/* D34F8 800D28F8 BD190000 */  cache      0x19, ($t0)
/* D34FC 800D28FC 0109082B */  sltu       $at, $t0, $t1
/* D3500 800D2900 1420FFFD */  bnez       $at, .L800D28F8
/* D3504 800D2904 25080010 */   addiu     $t0, $t0, 0x10
.L800D2908:
/* D3508 800D2908 03E00008 */  jr         $ra
/* D350C 800D290C 00000000 */   nop
.L800D2910:
/* D3510 800D2910 3C088000 */  lui        $t0, 0x8000
/* D3514 800D2914 010B4821 */  addu       $t1, $t0, $t3
/* D3518 800D2918 2529FFF0 */  addiu      $t1, $t1, -0x10
.L800D291C:
/* D351C 800D291C BD010000 */  cache      1, ($t0)
/* D3520 800D2920 0109082B */  sltu       $at, $t0, $t1
/* D3524 800D2924 1420FFFD */  bnez       $at, .L800D291C
/* D3528 800D2928 25080010 */   addiu     $t0, $t0, 0x10
/* D352C 800D292C 03E00008 */  jr         $ra
/* D3530 800D2930 00000000 */   nop
/* D3534 800D2934 00000000 */  nop
/* D3538 800D2938 00000000 */  nop
/* D353C 800D293C 00000000 */  nop
