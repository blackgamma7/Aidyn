.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alCopy
/* CFD60 800CF160 27BDFFF8 */  addiu      $sp, $sp, -8
/* CFD64 800CF164 18C00008 */  blez       $a2, .L800CF188
/* CFD68 800CF168 00001821 */   addu      $v1, $zero, $zero
.L800CF16C:
/* CFD6C 800CF16C 90820000 */  lbu        $v0, ($a0)
/* CFD70 800CF170 24840001 */  addiu      $a0, $a0, 1
/* CFD74 800CF174 24630001 */  addiu      $v1, $v1, 1
/* CFD78 800CF178 A0A20000 */  sb         $v0, ($a1)
/* CFD7C 800CF17C 0066102A */  slt        $v0, $v1, $a2
/* CFD80 800CF180 1440FFFA */  bnez       $v0, .L800CF16C
/* CFD84 800CF184 24A50001 */   addiu     $a1, $a1, 1
.L800CF188:
/* CFD88 800CF188 27BD0008 */  addiu      $sp, $sp, 8
/* CFD8C 800CF18C 03E00008 */  jr         $ra
/* CFD90 800CF190 00000000 */   nop
/* CFD94 800CF194 00000000 */  nop
/* CFD98 800CF198 00000000 */  nop
/* CFD9C 800CF19C 00000000 */  nop
