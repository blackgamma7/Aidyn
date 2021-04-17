.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guScaleF
/* CC4B0 800CB8B0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CC4B4 800CB8B4 F7B40018 */  sdc1       $f20, 0x18($sp)
/* CC4B8 800CB8B8 4485A000 */  mtc1       $a1, $f20
/* CC4BC 800CB8BC F7B60020 */  sdc1       $f22, 0x20($sp)
/* CC4C0 800CB8C0 4486B000 */  mtc1       $a2, $f22
/* CC4C4 800CB8C4 AFB00010 */  sw         $s0, 0x10($sp)
/* CC4C8 800CB8C8 F7B80028 */  sdc1       $f24, 0x28($sp)
/* CC4CC 800CB8CC 4487C000 */  mtc1       $a3, $f24
/* CC4D0 800CB8D0 AFBF0014 */  sw         $ra, 0x14($sp)
/* CC4D4 800CB8D4 0C0311DC */  jal        guMtxIdentF
/* CC4D8 800CB8D8 00808021 */   addu      $s0, $a0, $zero
/* CC4DC 800CB8DC 3C013F80 */  lui        $at, 0x3f80
/* CC4E0 800CB8E0 44810000 */  mtc1       $at, $f0
/* CC4E4 800CB8E4 E6140000 */  swc1       $f20, ($s0)
/* CC4E8 800CB8E8 E6160014 */  swc1       $f22, 0x14($s0)
/* CC4EC 800CB8EC E6180028 */  swc1       $f24, 0x28($s0)
/* CC4F0 800CB8F0 E600003C */  swc1       $f0, 0x3c($s0)
/* CC4F4 800CB8F4 8FBF0014 */  lw         $ra, 0x14($sp)
/* CC4F8 800CB8F8 8FB00010 */  lw         $s0, 0x10($sp)
/* CC4FC 800CB8FC D7B80028 */  ldc1       $f24, 0x28($sp)
/* CC500 800CB900 D7B60020 */  ldc1       $f22, 0x20($sp)
/* CC504 800CB904 D7B40018 */  ldc1       $f20, 0x18($sp)
/* CC508 800CB908 03E00008 */  jr         $ra
/* CC50C 800CB90C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel guScale
/* CC510 800CB910 27BDFF88 */  addiu      $sp, $sp, -0x78
/* CC514 800CB914 F7B40060 */  sdc1       $f20, 0x60($sp)
/* CC518 800CB918 4485A000 */  mtc1       $a1, $f20
/* CC51C 800CB91C F7B60068 */  sdc1       $f22, 0x68($sp)
/* CC520 800CB920 4486B000 */  mtc1       $a2, $f22
/* CC524 800CB924 AFB10054 */  sw         $s1, 0x54($sp)
/* CC528 800CB928 00808821 */  addu       $s1, $a0, $zero
/* CC52C 800CB92C AFB00050 */  sw         $s0, 0x50($sp)
/* CC530 800CB930 27B00010 */  addiu      $s0, $sp, 0x10
/* CC534 800CB934 F7B80070 */  sdc1       $f24, 0x70($sp)
/* CC538 800CB938 4487C000 */  mtc1       $a3, $f24
/* CC53C 800CB93C AFBF0058 */  sw         $ra, 0x58($sp)
/* CC540 800CB940 0C0311DC */  jal        guMtxIdentF
/* CC544 800CB944 02002021 */   addu      $a0, $s0, $zero
/* CC548 800CB948 3C013F80 */  lui        $at, 0x3f80
/* CC54C 800CB94C 44810000 */  mtc1       $at, $f0
/* CC550 800CB950 02002021 */  addu       $a0, $s0, $zero
/* CC554 800CB954 02202821 */  addu       $a1, $s1, $zero
/* CC558 800CB958 E7B40010 */  swc1       $f20, 0x10($sp)
/* CC55C 800CB95C E7B60024 */  swc1       $f22, 0x24($sp)
/* CC560 800CB960 E7B80038 */  swc1       $f24, 0x38($sp)
/* CC564 800CB964 0C03118C */  jal        guMtxF2L
/* CC568 800CB968 E7A0004C */   swc1      $f0, 0x4c($sp)
/* CC56C 800CB96C 8FBF0058 */  lw         $ra, 0x58($sp)
/* CC570 800CB970 8FB10054 */  lw         $s1, 0x54($sp)
/* CC574 800CB974 8FB00050 */  lw         $s0, 0x50($sp)
/* CC578 800CB978 D7B80070 */  ldc1       $f24, 0x70($sp)
/* CC57C 800CB97C D7B60068 */  ldc1       $f22, 0x68($sp)
/* CC580 800CB980 D7B40060 */  ldc1       $f20, 0x60($sp)
/* CC584 800CB984 03E00008 */  jr         $ra
/* CC588 800CB988 27BD0078 */   addiu     $sp, $sp, 0x78
/* CC58C 800CB98C 00000000 */  nop
