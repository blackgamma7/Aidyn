.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guNormalize
/* C54B0 800C48B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C54B4 800C48B4 AFB00010 */  sw         $s0, 0x10($sp)
/* C54B8 800C48B8 00808021 */  addu       $s0, $a0, $zero
/* C54BC 800C48BC AFBF001C */  sw         $ra, 0x1c($sp)
/* C54C0 800C48C0 AFB20018 */  sw         $s2, 0x18($sp)
/* C54C4 800C48C4 AFB10014 */  sw         $s1, 0x14($sp)
/* C54C8 800C48C8 C6040000 */  lwc1       $f4, ($s0)
/* C54CC 800C48CC 46042102 */  mul.s      $f4, $f4, $f4
/* C54D0 800C48D0 00A08821 */  addu       $s1, $a1, $zero
/* C54D4 800C48D4 C6220000 */  lwc1       $f2, ($s1)
/* C54D8 800C48D8 46021082 */  mul.s      $f2, $f2, $f2
/* C54DC 800C48DC 00C09021 */  addu       $s2, $a2, $zero
/* C54E0 800C48E0 C6400000 */  lwc1       $f0, ($s2)
/* C54E4 800C48E4 46000002 */  mul.s      $f0, $f0, $f0
/* C54E8 800C48E8 46022100 */  add.s      $f4, $f4, $f2
/* C54EC 800C48EC 46002300 */  add.s      $f12, $f4, $f0
/* C54F0 800C48F0 46006004 */  sqrt.s     $f0, $f12
/* C54F4 800C48F4 46000032 */  c.eq.s     $f0, $f0
/* C54F8 800C48F8 00000000 */  nop
/* C54FC 800C48FC 45010003 */  bc1t       .L800C490C
/* C5500 800C4900 00000000 */   nop
/* C5504 800C4904 0C0334B4 */  jal        _sqrtf
/* C5508 800C4908 00000000 */   nop
.L800C490C:
/* C550C 800C490C 3C013F80 */  lui        $at, 0x3f80
/* C5510 800C4910 44811000 */  mtc1       $at, $f2
/* C5514 800C4914 00000000 */  nop
/* C5518 800C4918 46001083 */  div.s      $f2, $f2, $f0
/* C551C 800C491C C6000000 */  lwc1       $f0, ($s0)
/* C5520 800C4920 46020002 */  mul.s      $f0, $f0, $f2
/* C5524 800C4924 E6000000 */  swc1       $f0, ($s0)
/* C5528 800C4928 C6200000 */  lwc1       $f0, ($s1)
/* C552C 800C492C 46020002 */  mul.s      $f0, $f0, $f2
/* C5530 800C4930 E6200000 */  swc1       $f0, ($s1)
/* C5534 800C4934 C6400000 */  lwc1       $f0, ($s2)
/* C5538 800C4938 46020002 */  mul.s      $f0, $f0, $f2
/* C553C 800C493C E6400000 */  swc1       $f0, ($s2)
/* C5540 800C4940 8FBF001C */  lw         $ra, 0x1c($sp)
/* C5544 800C4944 8FB20018 */  lw         $s2, 0x18($sp)
/* C5548 800C4948 8FB10014 */  lw         $s1, 0x14($sp)
/* C554C 800C494C 8FB00010 */  lw         $s0, 0x10($sp)
/* C5550 800C4950 03E00008 */  jr         $ra
/* C5554 800C4954 27BD0020 */   addiu     $sp, $sp, 0x20
/* C5558 800C4958 00000000 */  nop
/* C555C 800C495C 00000000 */  nop
/* C5560 800C4960 00000000 */  nop
/* C5564 800C4964 00000000 */  nop
/* C5568 800C4968 00000000 */  nop
/* C556C 800C496C 00000000 */  nop
/* C5570 800C4970 00000000 */  nop
/* C5574 800C4974 00000000 */  nop
/* C5578 800C4978 00000000 */  nop
/* C557C 800C497C 00000000 */  nop
/* C5580 800C4980 00000000 */  nop
/* C5584 800C4984 00000000 */  nop
/* C5588 800C4988 00000000 */  nop
/* C558C 800C498C 00000000 */  nop
/* C5590 800C4990 00000000 */  nop
/* C5594 800C4994 00000000 */  nop
/* C5598 800C4998 00000000 */  nop
/* C559C 800C499C 00000000 */  nop
/* C55A0 800C49A0 00000000 */  nop
/* C55A4 800C49A4 00000000 */  nop
/* C55A8 800C49A8 00000000 */  nop
/* C55AC 800C49AC 00000000 */  nop
/* C55B0 800C49B0 00000000 */  nop
/* C55B4 800C49B4 00000000 */  nop
/* C55B8 800C49B8 00000000 */  nop
/* C55BC 800C49BC 00000000 */  nop
