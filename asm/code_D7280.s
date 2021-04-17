.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800D6680
/* D7280 800D6680 C4800014 */  lwc1       $f0, 0x14($a0)
/* D7284 800D6684 C4820010 */  lwc1       $f2, 0x10($a0)
/* D7288 800D6688 46020001 */  sub.s      $f0, $f0, $f2
/* D728C 800D668C 44852000 */  mtc1       $a1, $f4
/* D7290 800D6690 46040002 */  mul.s      $f0, $f0, $f4
/* D7294 800D6694 46001080 */  add.s      $f2, $f2, $f0
/* D7298 800D6698 4600100D */  trunc.w.s  $f0, $f2
/* D729C 800D669C 44020000 */  mfc1       $v0, $f0
/* D72A0 800D66A0 00021400 */  sll        $v0, $v0, 0x10
/* D72A4 800D66A4 03E00008 */  jr         $ra
/* D72A8 800D66A8 00021403 */   sra       $v0, $v0, 0x10

glabel func_800D66AC
/* D72AC 800D66AC C4800014 */  lwc1       $f0, 0x14($a0)
/* D72B0 800D66B0 C4820010 */  lwc1       $f2, 0x10($a0)
/* D72B4 800D66B4 46020001 */  sub.s      $f0, $f0, $f2
/* D72B8 800D66B8 44852000 */  mtc1       $a1, $f4
/* D72BC 800D66BC 46040002 */  mul.s      $f0, $f0, $f4
/* D72C0 800D66C0 46001000 */  add.s      $f0, $f2, $f0
/* D72C4 800D66C4 3C01800E */  lui        $at, %hi(D_800E5190)
/* D72C8 800D66C8 C4225190 */  lwc1       $f2, %lo(D_800E5190)($at)
/* D72CC 800D66CC 4600103E */  c.le.s     $f2, $f0
/* D72D0 800D66D0 00000000 */  nop
/* D72D4 800D66D4 45030005 */  bc1tl      .L800D66EC
/* D72D8 800D66D8 46020001 */   sub.s     $f0, $f0, $f2
/* D72DC 800D66DC 4600008D */  trunc.w.s  $f2, $f0
/* D72E0 800D66E0 44031000 */  mfc1       $v1, $f2
/* D72E4 800D66E4 03E00008 */  jr         $ra
/* D72E8 800D66E8 306200FF */   andi      $v0, $v1, 0xff
.L800D66EC:
/* D72EC 800D66EC 4600008D */  trunc.w.s  $f2, $f0
/* D72F0 800D66F0 44031000 */  mfc1       $v1, $f2
/* D72F4 800D66F4 3C028000 */  lui        $v0, 0x8000
/* D72F8 800D66F8 00621825 */  or         $v1, $v1, $v0
/* D72FC 800D66FC 306200FF */  andi       $v0, $v1, 0xff
/* D7300 800D6700 03E00008 */  jr         $ra
/* D7304 800D6704 00000000 */   nop

glabel func_800D6708
/* D7308 800D6708 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D730C 800D670C 00801021 */  addu       $v0, $a0, $zero
/* D7310 800D6710 AFBF0010 */  sw         $ra, 0x10($sp)
/* D7314 800D6714 C4460000 */  lwc1       $f6, ($v0)
/* D7318 800D6718 C4440004 */  lwc1       $f4, 4($v0)
/* D731C 800D671C 4606203E */  c.le.s     $f4, $f6
/* D7320 800D6720 00000000 */  nop
/* D7324 800D6724 45010002 */  bc1t       .L800D6730
/* D7328 800D6728 24030001 */   addiu     $v1, $zero, 1
/* D732C 800D672C 00001821 */  addu       $v1, $zero, $zero
.L800D6730:
/* D7330 800D6730 1460001A */  bnez       $v1, .L800D679C
/* D7334 800D6734 8FBF0010 */   lw        $ra, 0x10($sp)
/* D7338 800D6738 44851000 */  mtc1       $a1, $f2
/* D733C 800D673C 468010A1 */  cvt.d.w    $f2, $f2
/* D7340 800D6740 04A30005 */  bgezl      $a1, .L800D6758
/* D7344 800D6744 46201020 */   cvt.s.d   $f0, $f2
/* D7348 800D6748 3C01800E */  lui        $at, %hi(D_800E51F8)
/* D734C 800D674C D42051F8 */  ldc1       $f0, %lo(D_800E51F8)($at)
/* D7350 800D6750 46201080 */  add.d      $f2, $f2, $f0
/* D7354 800D6754 46201020 */  cvt.s.d    $f0, $f2
.L800D6758:
/* D7358 800D6758 46003000 */  add.s      $f0, $f6, $f0
/* D735C 800D675C 4600203C */  c.lt.s     $f4, $f0
/* D7360 800D6760 00000000 */  nop
/* D7364 800D6764 45000002 */  bc1f       .L800D6770
/* D7368 800D6768 E4400000 */   swc1      $f0, ($v0)
/* D736C 800D676C E4440000 */  swc1       $f4, ($v0)
.L800D6770:
/* D7370 800D6770 C4420000 */  lwc1       $f2, ($v0)
/* D7374 800D6774 C4400004 */  lwc1       $f0, 4($v0)
/* D7378 800D6778 8C430008 */  lw         $v1, 8($v0)
/* D737C 800D677C 46001083 */  div.s      $f2, $f2, $f0
/* D7380 800D6780 84640018 */  lh         $a0, 0x18($v1)
/* D7384 800D6784 44051000 */  mfc1       $a1, $f2
/* D7388 800D6788 00442021 */  addu       $a0, $v0, $a0
/* D738C 800D678C 8C62001C */  lw         $v0, 0x1c($v1)
/* D7390 800D6790 0040F809 */  jalr       $v0
/* D7394 800D6794 00000000 */   nop
/* D7398 800D6798 8FBF0010 */  lw         $ra, 0x10($sp)
.L800D679C:
/* D739C 800D679C 03E00008 */  jr         $ra
/* D73A0 800D67A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D67A4
/* D73A4 800D67A4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D73A8 800D67A8 3C02800E */  lui        $v0, %hi(D_800E5200)
/* D73AC 800D67AC 24425200 */  addiu      $v0, $v0, %lo(D_800E5200)
/* D73B0 800D67B0 30A50001 */  andi       $a1, $a1, 1
/* D73B4 800D67B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* D73B8 800D67B8 10A00003 */  beqz       $a1, .L800D67C8
/* D73BC 800D67BC AC820008 */   sw        $v0, 8($a0)
/* D73C0 800D67C0 0C026262 */  jal        passToFree
/* D73C4 800D67C4 00000000 */   nop
.L800D67C8:
/* D73C8 800D67C8 8FBF0010 */  lw         $ra, 0x10($sp)
/* D73CC 800D67CC 03E00008 */  jr         $ra
/* D73D0 800D67D0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D67D4
/* D73D4 800D67D4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D73D8 800D67D8 3C02800E */  lui        $v0, %hi(D_800E5200)
/* D73DC 800D67DC 24425200 */  addiu      $v0, $v0, %lo(D_800E5200)
/* D73E0 800D67E0 30A50001 */  andi       $a1, $a1, 1
/* D73E4 800D67E4 AFBF0010 */  sw         $ra, 0x10($sp)
/* D73E8 800D67E8 10A00003 */  beqz       $a1, .L800D67F8
/* D73EC 800D67EC AC820008 */   sw        $v0, 8($a0)
/* D73F0 800D67F0 0C026262 */  jal        passToFree
/* D73F4 800D67F4 00000000 */   nop
.L800D67F8:
/* D73F8 800D67F8 8FBF0010 */  lw         $ra, 0x10($sp)
/* D73FC 800D67FC 03E00008 */  jr         $ra
/* D7400 800D6800 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6804
/* D7404 800D6804 00801021 */  addu       $v0, $a0, $zero
/* D7408 800D6808 44870000 */  mtc1       $a3, $f0
/* D740C 800D680C 46800020 */  cvt.s.w    $f0, $f0
/* D7410 800D6810 3C03800E */  lui        $v1, %hi(D_800E51C8)
/* D7414 800D6814 246351C8 */  addiu      $v1, $v1, %lo(D_800E51C8)
/* D7418 800D6818 AC400000 */  sw         $zero, ($v0)
/* D741C 800D681C E4400004 */  swc1       $f0, 4($v0)
/* D7420 800D6820 AC45000C */  sw         $a1, 0xc($v0)
/* D7424 800D6824 AC430008 */  sw         $v1, 8($v0)
/* D7428 800D6828 84A40000 */  lh         $a0, ($a1)
/* D742C 800D682C 44840000 */  mtc1       $a0, $f0
/* D7430 800D6830 46800020 */  cvt.s.w    $f0, $f0
/* D7434 800D6834 E4400010 */  swc1       $f0, 0x10($v0)
/* D7438 800D6838 84C30000 */  lh         $v1, ($a2)
/* D743C 800D683C 44830000 */  mtc1       $v1, $f0
/* D7440 800D6840 46800020 */  cvt.s.w    $f0, $f0
/* D7444 800D6844 03E00008 */  jr         $ra
/* D7448 800D6848 E4400014 */   swc1      $f0, 0x14($v0)

glabel func_800D684C
/* D744C 800D684C 00801021 */  addu       $v0, $a0, $zero
/* D7450 800D6850 44870000 */  mtc1       $a3, $f0
/* D7454 800D6854 46800020 */  cvt.s.w    $f0, $f0
/* D7458 800D6858 3C03800E */  lui        $v1, %hi(D_800E5198)
/* D745C 800D685C 24635198 */  addiu      $v1, $v1, %lo(D_800E5198)
/* D7460 800D6860 AC400000 */  sw         $zero, ($v0)
/* D7464 800D6864 E4400004 */  swc1       $f0, 4($v0)
/* D7468 800D6868 AC45000C */  sw         $a1, 0xc($v0)
/* D746C 800D686C AC430008 */  sw         $v1, 8($v0)
/* D7470 800D6870 90A40000 */  lbu        $a0, ($a1)
/* D7474 800D6874 44840000 */  mtc1       $a0, $f0
/* D7478 800D6878 46800020 */  cvt.s.w    $f0, $f0
/* D747C 800D687C E4400010 */  swc1       $f0, 0x10($v0)
/* D7480 800D6880 90C30000 */  lbu        $v1, ($a2)
/* D7484 800D6884 44830000 */  mtc1       $v1, $f0
/* D7488 800D6888 46800020 */  cvt.s.w    $f0, $f0
/* D748C 800D688C 03E00008 */  jr         $ra
/* D7490 800D6890 E4400014 */   swc1      $f0, 0x14($v0)

glabel func_800D6894
/* D7494 800D6894 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7498 800D6898 AFB00010 */  sw         $s0, 0x10($sp)
/* D749C 800D689C 00808021 */  addu       $s0, $a0, $zero
/* D74A0 800D68A0 AFBF0014 */  sw         $ra, 0x14($sp)
/* D74A4 800D68A4 8E030008 */  lw         $v1, 8($s0)
/* D74A8 800D68A8 84640020 */  lh         $a0, 0x20($v1)
/* D74AC 800D68AC 8C620024 */  lw         $v0, 0x24($v1)
/* D74B0 800D68B0 0040F809 */  jalr       $v0
/* D74B4 800D68B4 02042021 */   addu      $a0, $s0, $a0
/* D74B8 800D68B8 8E03000C */  lw         $v1, 0xc($s0)
/* D74BC 800D68BC 8FBF0014 */  lw         $ra, 0x14($sp)
/* D74C0 800D68C0 8FB00010 */  lw         $s0, 0x10($sp)
/* D74C4 800D68C4 A0620000 */  sb         $v0, ($v1)
/* D74C8 800D68C8 03E00008 */  jr         $ra
/* D74CC 800D68CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D68D0
/* D74D0 800D68D0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D74D4 800D68D4 AFB00010 */  sw         $s0, 0x10($sp)
/* D74D8 800D68D8 00808021 */  addu       $s0, $a0, $zero
/* D74DC 800D68DC AFBF0014 */  sw         $ra, 0x14($sp)
/* D74E0 800D68E0 8E030008 */  lw         $v1, 8($s0)
/* D74E4 800D68E4 84640020 */  lh         $a0, 0x20($v1)
/* D74E8 800D68E8 8C620024 */  lw         $v0, 0x24($v1)
/* D74EC 800D68EC 0040F809 */  jalr       $v0
/* D74F0 800D68F0 02042021 */   addu      $a0, $s0, $a0
/* D74F4 800D68F4 8E03000C */  lw         $v1, 0xc($s0)
/* D74F8 800D68F8 8FBF0014 */  lw         $ra, 0x14($sp)
/* D74FC 800D68FC 8FB00010 */  lw         $s0, 0x10($sp)
/* D7500 800D6900 A4620000 */  sh         $v0, ($v1)
/* D7504 800D6904 03E00008 */  jr         $ra
/* D7508 800D6908 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D690C
/* D750C 800D690C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7510 800D6910 3C02800E */  lui        $v0, %hi(D_800E5200)
/* D7514 800D6914 24425200 */  addiu      $v0, $v0, %lo(D_800E5200)
/* D7518 800D6918 30A50001 */  andi       $a1, $a1, 1
/* D751C 800D691C AFBF0010 */  sw         $ra, 0x10($sp)
/* D7520 800D6920 10A00003 */  beqz       $a1, .L800D6930
/* D7524 800D6924 AC820008 */   sw        $v0, 8($a0)
/* D7528 800D6928 0C026262 */  jal        passToFree
/* D752C 800D692C 00000000 */   nop
.L800D6930:
/* D7530 800D6930 8FBF0010 */  lw         $ra, 0x10($sp)
/* D7534 800D6934 03E00008 */  jr         $ra
/* D7538 800D6938 27BD0018 */   addiu     $sp, $sp, 0x18
/* D753C 800D693C 00000000 */  nop
