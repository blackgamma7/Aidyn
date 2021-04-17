.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guTranslateF
/* D27C0 800D1BC0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* D27C4 800D1BC4 F7B40018 */  sdc1       $f20, 0x18($sp)
/* D27C8 800D1BC8 4485A000 */  mtc1       $a1, $f20
/* D27CC 800D1BCC F7B60020 */  sdc1       $f22, 0x20($sp)
/* D27D0 800D1BD0 4486B000 */  mtc1       $a2, $f22
/* D27D4 800D1BD4 AFB00010 */  sw         $s0, 0x10($sp)
/* D27D8 800D1BD8 F7B80028 */  sdc1       $f24, 0x28($sp)
/* D27DC 800D1BDC 4487C000 */  mtc1       $a3, $f24
/* D27E0 800D1BE0 AFBF0014 */  sw         $ra, 0x14($sp)
/* D27E4 800D1BE4 0C0311DC */  jal        guMtxIdentF
/* D27E8 800D1BE8 00808021 */   addu      $s0, $a0, $zero
/* D27EC 800D1BEC E6140030 */  swc1       $f20, 0x30($s0)
/* D27F0 800D1BF0 E6160034 */  swc1       $f22, 0x34($s0)
/* D27F4 800D1BF4 E6180038 */  swc1       $f24, 0x38($s0)
/* D27F8 800D1BF8 8FBF0014 */  lw         $ra, 0x14($sp)
/* D27FC 800D1BFC 8FB00010 */  lw         $s0, 0x10($sp)
/* D2800 800D1C00 D7B80028 */  ldc1       $f24, 0x28($sp)
/* D2804 800D1C04 D7B60020 */  ldc1       $f22, 0x20($sp)
/* D2808 800D1C08 D7B40018 */  ldc1       $f20, 0x18($sp)
/* D280C 800D1C0C 03E00008 */  jr         $ra
/* D2810 800D1C10 27BD0030 */   addiu     $sp, $sp, 0x30

glabel guTranslate
/* D2814 800D1C14 27BDFF88 */  addiu      $sp, $sp, -0x78
/* D2818 800D1C18 F7B40060 */  sdc1       $f20, 0x60($sp)
/* D281C 800D1C1C 4485A000 */  mtc1       $a1, $f20
/* D2820 800D1C20 F7B60068 */  sdc1       $f22, 0x68($sp)
/* D2824 800D1C24 4486B000 */  mtc1       $a2, $f22
/* D2828 800D1C28 AFB10054 */  sw         $s1, 0x54($sp)
/* D282C 800D1C2C 00808821 */  addu       $s1, $a0, $zero
/* D2830 800D1C30 AFB00050 */  sw         $s0, 0x50($sp)
/* D2834 800D1C34 27B00010 */  addiu      $s0, $sp, 0x10
/* D2838 800D1C38 F7B80070 */  sdc1       $f24, 0x70($sp)
/* D283C 800D1C3C 4487C000 */  mtc1       $a3, $f24
/* D2840 800D1C40 AFBF0058 */  sw         $ra, 0x58($sp)
/* D2844 800D1C44 0C0311DC */  jal        guMtxIdentF
/* D2848 800D1C48 02002021 */   addu      $a0, $s0, $zero
/* D284C 800D1C4C 02002021 */  addu       $a0, $s0, $zero
/* D2850 800D1C50 02202821 */  addu       $a1, $s1, $zero
/* D2854 800D1C54 E7B40040 */  swc1       $f20, 0x40($sp)
/* D2858 800D1C58 E7B60044 */  swc1       $f22, 0x44($sp)
/* D285C 800D1C5C 0C03118C */  jal        guMtxF2L
/* D2860 800D1C60 E7B80048 */   swc1      $f24, 0x48($sp)
/* D2864 800D1C64 8FBF0058 */  lw         $ra, 0x58($sp)
/* D2868 800D1C68 8FB10054 */  lw         $s1, 0x54($sp)
/* D286C 800D1C6C 8FB00050 */  lw         $s0, 0x50($sp)
/* D2870 800D1C70 D7B80070 */  ldc1       $f24, 0x70($sp)
/* D2874 800D1C74 D7B60068 */  ldc1       $f22, 0x68($sp)
/* D2878 800D1C78 D7B40060 */  ldc1       $f20, 0x60($sp)
/* D287C 800D1C7C 03E00008 */  jr         $ra
/* D2880 800D1C80 27BD0078 */   addiu     $sp, $sp, 0x78
/* D2884 800D1C84 00000000 */  nop
/* D2888 800D1C88 00000000 */  nop
/* D288C 800D1C8C 00000000 */  nop
