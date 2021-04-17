.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osInvalDCache
/* C42D0 800C36D0 18A00020 */  blez       $a1, .L800C3754
/* C42D4 800C36D4 00000000 */   nop
/* C42D8 800C36D8 240B2000 */  addiu      $t3, $zero, 0x2000
/* C42DC 800C36DC 00AB082B */  sltu       $at, $a1, $t3
/* C42E0 800C36E0 1020001E */  beqz       $at, .L800C375C
/* C42E4 800C36E4 00000000 */   nop
/* C42E8 800C36E8 00804021 */  addu       $t0, $a0, $zero
/* C42EC 800C36EC 00854821 */  addu       $t1, $a0, $a1
/* C42F0 800C36F0 0109082B */  sltu       $at, $t0, $t1
/* C42F4 800C36F4 10200017 */  beqz       $at, .L800C3754
/* C42F8 800C36F8 00000000 */   nop
/* C42FC 800C36FC 2529FFF0 */  addiu      $t1, $t1, -0x10
/* C4300 800C3700 310A000F */  andi       $t2, $t0, 0xf
/* C4304 800C3704 11400007 */  beqz       $t2, .L800C3724
/* C4308 800C3708 00000000 */   nop
/* C430C 800C370C 010A4023 */  subu       $t0, $t0, $t2
/* C4310 800C3710 BD150000 */  cache      0x15, ($t0)
/* C4314 800C3714 0109082B */  sltu       $at, $t0, $t1
/* C4318 800C3718 1020000E */  beqz       $at, .L800C3754
/* C431C 800C371C 00000000 */   nop
/* C4320 800C3720 25080010 */  addiu      $t0, $t0, 0x10
.L800C3724:
/* C4324 800C3724 312A000F */  andi       $t2, $t1, 0xf
/* C4328 800C3728 11400006 */  beqz       $t2, .L800C3744
/* C432C 800C372C 00000000 */   nop
/* C4330 800C3730 012A4823 */  subu       $t1, $t1, $t2
/* C4334 800C3734 BD350010 */  cache      0x15, 0x10($t1)
/* C4338 800C3738 0128082B */  sltu       $at, $t1, $t0
/* C433C 800C373C 14200005 */  bnez       $at, .L800C3754
/* C4340 800C3740 00000000 */   nop
.L800C3744:
/* C4344 800C3744 BD110000 */  cache      0x11, ($t0)
/* C4348 800C3748 0109082B */  sltu       $at, $t0, $t1
/* C434C 800C374C 1420FFFD */  bnez       $at, .L800C3744
/* C4350 800C3750 25080010 */   addiu     $t0, $t0, 0x10
.L800C3754:
/* C4354 800C3754 03E00008 */  jr         $ra
/* C4358 800C3758 00000000 */   nop
.L800C375C:
/* C435C 800C375C 3C088000 */  lui        $t0, 0x8000
/* C4360 800C3760 010B4821 */  addu       $t1, $t0, $t3
/* C4364 800C3764 2529FFF0 */  addiu      $t1, $t1, -0x10
.L800C3768:
/* C4368 800C3768 BD010000 */  cache      1, ($t0)
/* C436C 800C376C 0109082B */  sltu       $at, $t0, $t1
/* C4370 800C3770 1420FFFD */  bnez       $at, .L800C3768
/* C4374 800C3774 25080010 */   addiu     $t0, $t0, 0x10
/* C4378 800C3778 03E00008 */  jr         $ra
/* C437C 800C377C 00000000 */   nop
