.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpRawWriteIo
/* CDA60 800CCE60 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CDA64 800CCE64 AFB00010 */  sw         $s0, 0x10($sp)
/* CDA68 800CCE68 00808021 */  addu       $s0, $a0, $zero
/* CDA6C 800CCE6C AFB10014 */  sw         $s1, 0x14($sp)
/* CDA70 800CCE70 AFBF0018 */  sw         $ra, 0x18($sp)
/* CDA74 800CCE74 0C033390 */  jal        __osSpDeviceBusy
/* CDA78 800CCE78 00A08821 */   addu      $s1, $a1, $zero
/* CDA7C 800CCE7C 54400005 */  bnel       $v0, $zero, .L800CCE94
/* CDA80 800CCE80 2402FFFF */   addiu     $v0, $zero, -1
/* CDA84 800CCE84 3C02A000 */  lui        $v0, 0xa000
/* CDA88 800CCE88 02021025 */  or         $v0, $s0, $v0
/* CDA8C 800CCE8C AC510000 */  sw         $s1, ($v0)
/* CDA90 800CCE90 00001021 */  addu       $v0, $zero, $zero
.L800CCE94:
/* CDA94 800CCE94 8FBF0018 */  lw         $ra, 0x18($sp)
/* CDA98 800CCE98 8FB10014 */  lw         $s1, 0x14($sp)
/* CDA9C 800CCE9C 8FB00010 */  lw         $s0, 0x10($sp)
/* CDAA0 800CCEA0 03E00008 */  jr         $ra
/* CDAA4 800CCEA4 27BD0020 */   addiu     $sp, $sp, 0x20
/* CDAA8 800CCEA8 00000000 */  nop
/* CDAAC 800CCEAC 00000000 */  nop
