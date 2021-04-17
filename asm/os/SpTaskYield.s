.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osSpTaskYielded
/* CDE70 800CD270 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CDE74 800CD274 AFB00010 */  sw         $s0, 0x10($sp)
/* CDE78 800CD278 AFBF0014 */  sw         $ra, 0x14($sp)
/* CDE7C 800CD27C 0C0334B0 */  jal        __osSpGetStatus
/* CDE80 800CD280 00808021 */   addu      $s0, $a0, $zero
/* CDE84 800CD284 00022202 */  srl        $a0, $v0, 8
/* CDE88 800CD288 30420080 */  andi       $v0, $v0, 0x80
/* CDE8C 800CD28C 10400006 */  beqz       $v0, .L800CD2A8
/* CDE90 800CD290 30840001 */   andi      $a0, $a0, 1
/* CDE94 800CD294 8E020004 */  lw         $v0, 4($s0)
/* CDE98 800CD298 2403FFFD */  addiu      $v1, $zero, -3
/* CDE9C 800CD29C 00441025 */  or         $v0, $v0, $a0
/* CDEA0 800CD2A0 00431024 */  and        $v0, $v0, $v1
/* CDEA4 800CD2A4 AE020004 */  sw         $v0, 4($s0)
.L800CD2A8:
/* CDEA8 800CD2A8 00801021 */  addu       $v0, $a0, $zero
/* CDEAC 800CD2AC 8FBF0014 */  lw         $ra, 0x14($sp)
/* CDEB0 800CD2B0 8FB00010 */  lw         $s0, 0x10($sp)
/* CDEB4 800CD2B4 03E00008 */  jr         $ra
/* CDEB8 800CD2B8 27BD0018 */   addiu     $sp, $sp, 0x18
/* CDEBC 800CD2BC 00000000 */  nop
