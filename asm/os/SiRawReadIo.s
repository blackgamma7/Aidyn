.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSiRawReadIo
/* CD880 800CCC80 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD884 800CCC84 AFB00010 */  sw         $s0, 0x10($sp)
/* CD888 800CCC88 00808021 */  addu       $s0, $a0, $zero
/* CD88C 800CCC8C AFB10014 */  sw         $s1, 0x14($sp)
/* CD890 800CCC90 AFBF0018 */  sw         $ra, 0x18($sp)
/* CD894 800CCC94 0C033334 */  jal        __osSiDeviceBusy
/* CD898 800CCC98 00A08821 */   addu      $s1, $a1, $zero
/* CD89C 800CCC9C 14400006 */  bnez       $v0, .L800CCCB8
/* CD8A0 800CCCA0 2402FFFF */   addiu     $v0, $zero, -1
/* CD8A4 800CCCA4 3C02A000 */  lui        $v0, 0xa000
/* CD8A8 800CCCA8 02021025 */  or         $v0, $s0, $v0
/* CD8AC 800CCCAC 8C430000 */  lw         $v1, ($v0)
/* CD8B0 800CCCB0 00001021 */  addu       $v0, $zero, $zero
/* CD8B4 800CCCB4 AE230000 */  sw         $v1, ($s1)
.L800CCCB8:
/* CD8B8 800CCCB8 8FBF0018 */  lw         $ra, 0x18($sp)
/* CD8BC 800CCCBC 8FB10014 */  lw         $s1, 0x14($sp)
/* CD8C0 800CCCC0 8FB00010 */  lw         $s0, 0x10($sp)
/* CD8C4 800CCCC4 03E00008 */  jr         $ra
/* CD8C8 800CCCC8 27BD0020 */   addiu     $sp, $sp, 0x20
/* CD8CC 800CCCCC 00000000 */  nop
