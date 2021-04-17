.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpRawReadIo
/* CD9F0 800CCDF0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD9F4 800CCDF4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD9F8 800CCDF8 00808021 */  addu       $s0, $a0, $zero
/* CD9FC 800CCDFC AFB10014 */  sw         $s1, 0x14($sp)
/* CDA00 800CCE00 AFBF0018 */  sw         $ra, 0x18($sp)
/* CDA04 800CCE04 0C033390 */  jal        __osSpDeviceBusy
/* CDA08 800CCE08 00A08821 */   addu      $s1, $a1, $zero
/* CDA0C 800CCE0C 14400006 */  bnez       $v0, .L800CCE28
/* CDA10 800CCE10 2402FFFF */   addiu     $v0, $zero, -1
/* CDA14 800CCE14 3C02A000 */  lui        $v0, 0xa000
/* CDA18 800CCE18 02021025 */  or         $v0, $s0, $v0
/* CDA1C 800CCE1C 8C430000 */  lw         $v1, ($v0)
/* CDA20 800CCE20 00001021 */  addu       $v0, $zero, $zero
/* CDA24 800CCE24 AE230000 */  sw         $v1, ($s1)
.L800CCE28:
/* CDA28 800CCE28 8FBF0018 */  lw         $ra, 0x18($sp)
/* CDA2C 800CCE2C 8FB10014 */  lw         $s1, 0x14($sp)
/* CDA30 800CCE30 8FB00010 */  lw         $s0, 0x10($sp)
/* CDA34 800CCE34 03E00008 */  jr         $ra
/* CDA38 800CCE38 27BD0020 */   addiu     $sp, $sp, 0x20
/* CDA3C 800CCE3C 00000000 */  nop
