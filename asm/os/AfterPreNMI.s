.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osAfterPreNMI
/* BED00 800BE100 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BED04 800BE104 AFBF0010 */  sw         $ra, 0x10($sp)
/* BED08 800BE108 0C0333D0 */  jal        __osSpSetPc
/* BED0C 800BE10C 00002021 */   addu      $a0, $zero, $zero
/* BED10 800BE110 8FBF0010 */  lw         $ra, 0x10($sp)
/* BED14 800BE114 03E00008 */  jr         $ra
/* BED18 800BE118 27BD0018 */   addiu     $sp, $sp, 0x18
/* BED1C 800BE11C 00000000 */  nop
