.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osPfsSelectBank
/* C8320 800C7720 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* C8324 800C7724 AFB00038 */  sw         $s0, 0x38($sp)
/* C8328 800C7728 00808021 */  addu       $s0, $a0, $zero
/* C832C 800C772C AFB1003C */  sw         $s1, 0x3c($sp)
/* C8330 800C7730 00A08821 */  addu       $s1, $a1, $zero
/* C8334 800C7734 2403001F */  addiu      $v1, $zero, 0x1f
/* C8338 800C7738 27A20037 */  addiu      $v0, $sp, 0x37
/* C833C 800C773C AFBF0040 */  sw         $ra, 0x40($sp)
.L800C7740:
/* C8340 800C7740 A0510000 */  sb         $s1, ($v0)
/* C8344 800C7744 2463FFFF */  addiu      $v1, $v1, -1
/* C8348 800C7748 0461FFFD */  bgez       $v1, .L800C7740
/* C834C 800C774C 2442FFFF */   addiu     $v0, $v0, -1
/* C8350 800C7750 AFA00010 */  sw         $zero, 0x10($sp)
/* C8354 800C7754 8E040004 */  lw         $a0, 4($s0)
/* C8358 800C7758 8E050008 */  lw         $a1, 8($s0)
/* C835C 800C775C 24060400 */  addiu      $a2, $zero, 0x400
/* C8360 800C7760 0C030B30 */  jal        __osContRamWrite
/* C8364 800C7764 27A70018 */   addiu     $a3, $sp, 0x18
/* C8368 800C7768 50400001 */  beql       $v0, $zero, .L800C7770
/* C836C 800C776C A2110065 */   sb        $s1, 0x65($s0)
.L800C7770:
/* C8370 800C7770 8FBF0040 */  lw         $ra, 0x40($sp)
/* C8374 800C7774 8FB1003C */  lw         $s1, 0x3c($sp)
/* C8378 800C7778 8FB00038 */  lw         $s0, 0x38($sp)
/* C837C 800C777C 03E00008 */  jr         $ra
/* C8380 800C7780 27BD0048 */   addiu     $sp, $sp, 0x48
/* C8384 800C7784 00000000 */  nop
/* C8388 800C7788 00000000 */  nop
/* C838C 800C778C 00000000 */  nop
