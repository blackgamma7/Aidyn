.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel sprintf
/* CDAB0 800CCEB0 AFA50004 */  sw         $a1, 4($sp)
/* CDAB4 800CCEB4 AFA60008 */  sw         $a2, 8($sp)
/* CDAB8 800CCEB8 AFA7000C */  sw         $a3, 0xc($sp)
/* CDABC 800CCEBC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CDAC0 800CCEC0 AFB00010 */  sw         $s0, 0x10($sp)
/* CDAC4 800CCEC4 00808021 */  addu       $s0, $a0, $zero
/* CDAC8 800CCEC8 00A03021 */  addu       $a2, $a1, $zero
/* CDACC 800CCECC 3C04800D */  lui        $a0, %hi(proutSprintf)
/* CDAD0 800CCED0 2484CF08 */  addiu      $a0, $a0, %lo(proutSprintf)
/* CDAD4 800CCED4 02002821 */  addu       $a1, $s0, $zero
/* CDAD8 800CCED8 AFBF0014 */  sw         $ra, 0x14($sp)
/* CDADC 800CCEDC 0C034A5C */  jal        _Printf
/* CDAE0 800CCEE0 27A70020 */   addiu     $a3, $sp, 0x20
/* CDAE4 800CCEE4 00401821 */  addu       $v1, $v0, $zero
/* CDAE8 800CCEE8 04600002 */  bltz       $v1, .L800CCEF4
/* CDAEC 800CCEEC 02031021 */   addu      $v0, $s0, $v1
/* CDAF0 800CCEF0 A0400000 */  sb         $zero, ($v0)
.L800CCEF4:
/* CDAF4 800CCEF4 00601021 */  addu       $v0, $v1, $zero
/* CDAF8 800CCEF8 8FBF0014 */  lw         $ra, 0x14($sp)
/* CDAFC 800CCEFC 8FB00010 */  lw         $s0, 0x10($sp)
/* CDB00 800CCF00 03E00008 */  jr         $ra
/* CDB04 800CCF04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel proutSprintf
/* CDB08 800CCF08 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CDB0C 800CCF0C AFB10014 */  sw         $s1, 0x14($sp)
/* CDB10 800CCF10 00808821 */  addu       $s1, $a0, $zero
/* CDB14 800CCF14 AFB00010 */  sw         $s0, 0x10($sp)
/* CDB18 800CCF18 AFBF0018 */  sw         $ra, 0x18($sp)
/* CDB1C 800CCF1C 0C033547 */  jal        memcpy
/* CDB20 800CCF20 00C08021 */   addu      $s0, $a2, $zero
/* CDB24 800CCF24 02301021 */  addu       $v0, $s1, $s0
/* CDB28 800CCF28 8FBF0018 */  lw         $ra, 0x18($sp)
/* CDB2C 800CCF2C 8FB10014 */  lw         $s1, 0x14($sp)
/* CDB30 800CCF30 8FB00010 */  lw         $s0, 0x10($sp)
/* CDB34 800CCF34 03E00008 */  jr         $ra
/* CDB38 800CCF38 27BD0020 */   addiu     $sp, $sp, 0x20
/* CDB3C 800CCF3C 00000000 */  nop
