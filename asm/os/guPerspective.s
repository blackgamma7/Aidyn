.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guPerspectiveF
/* C55C0 800C49C0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* C55C4 800C49C4 F7BA0038 */  sdc1       $f26, 0x38($sp)
/* C55C8 800C49C8 C7BA0060 */  lwc1       $f26, 0x60($sp)
/* C55CC 800C49CC F7BC0040 */  sdc1       $f28, 0x40($sp)
/* C55D0 800C49D0 C7BC0064 */  lwc1       $f28, 0x64($sp)
/* C55D4 800C49D4 F7BE0048 */  sdc1       $f30, 0x48($sp)
/* C55D8 800C49D8 C7BE0068 */  lwc1       $f30, 0x68($sp)
/* C55DC 800C49DC F7B80030 */  sdc1       $f24, 0x30($sp)
/* C55E0 800C49E0 4486C000 */  mtc1       $a2, $f24
/* C55E4 800C49E4 AFB00010 */  sw         $s0, 0x10($sp)
/* C55E8 800C49E8 00808021 */  addu       $s0, $a0, $zero
/* C55EC 800C49EC AFB10014 */  sw         $s1, 0x14($sp)
/* C55F0 800C49F0 F7B60028 */  sdc1       $f22, 0x28($sp)
/* C55F4 800C49F4 4487B000 */  mtc1       $a3, $f22
/* C55F8 800C49F8 AFBF0018 */  sw         $ra, 0x18($sp)
/* C55FC 800C49FC F7B40020 */  sdc1       $f20, 0x20($sp)
/* C5600 800C4A00 0C0311DC */  jal        guMtxIdentF
/* C5604 800C4A04 00A08821 */   addu      $s1, $a1, $zero
/* C5608 800C4A08 3C01800E */  lui        $at, %hi(perspective_rodata_0000)
/* C560C 800C4A0C D4225410 */  ldc1       $f2, %lo(perspective_rodata_0000)($at)
/* C5610 800C4A10 4600C021 */  cvt.d.s    $f0, $f24
/* C5614 800C4A14 46220002 */  mul.d      $f0, $f0, $f2
/* C5618 800C4A18 3C014000 */  lui        $at, 0x4000
/* C561C 800C4A1C 4481A000 */  mtc1       $at, $f20
/* C5620 800C4A20 46200620 */  cvt.s.d    $f24, $f0
/* C5624 800C4A24 4614C503 */  div.s      $f20, $f24, $f20
/* C5628 800C4A28 0C02FB50 */  jal        __cosf
/* C562C 800C4A2C 4600A306 */   mov.s     $f12, $f20
/* C5630 800C4A30 4600A306 */  mov.s      $f12, $f20
/* C5634 800C4A34 0C03328C */  jal        __sinf
/* C5638 800C4A38 46000506 */   mov.s     $f20, $f0
/* C563C 800C4A3C 4600A503 */  div.s      $f20, $f20, $f0
/* C5640 800C4A40 461CD100 */  add.s      $f4, $f26, $f28
/* C5644 800C4A44 461CD081 */  sub.s      $f2, $f26, $f28
/* C5648 800C4A48 46022103 */  div.s      $f4, $f4, $f2
/* C564C 800C4A4C 461AD000 */  add.s      $f0, $f26, $f26
/* C5650 800C4A50 461C0002 */  mul.s      $f0, $f0, $f28
/* C5654 800C4A54 46020003 */  div.s      $f0, $f0, $f2
/* C5658 800C4A58 4616A583 */  div.s      $f22, $f20, $f22
/* C565C 800C4A5C 3C01BF80 */  lui        $at, 0xbf80
/* C5660 800C4A60 44811000 */  mtc1       $at, $f2
/* C5664 800C4A64 00002821 */  addu       $a1, $zero, $zero
/* C5668 800C4A68 AE00003C */  sw         $zero, 0x3c($s0)
/* C566C 800C4A6C E602002C */  swc1       $f2, 0x2c($s0)
/* C5670 800C4A70 E6140014 */  swc1       $f20, 0x14($s0)
/* C5674 800C4A74 E6040028 */  swc1       $f4, 0x28($s0)
/* C5678 800C4A78 E6000038 */  swc1       $f0, 0x38($s0)
/* C567C 800C4A7C E6160000 */  swc1       $f22, ($s0)
.L800C4A80:
/* C5680 800C4A80 00002021 */  addu       $a0, $zero, $zero
/* C5684 800C4A84 02001821 */  addu       $v1, $s0, $zero
.L800C4A88:
/* C5688 800C4A88 C4600000 */  lwc1       $f0, ($v1)
/* C568C 800C4A8C 461E0002 */  mul.s      $f0, $f0, $f30
/* C5690 800C4A90 24840001 */  addiu      $a0, $a0, 1
/* C5694 800C4A94 28820004 */  slti       $v0, $a0, 4
/* C5698 800C4A98 E4600000 */  swc1       $f0, ($v1)
/* C569C 800C4A9C 1440FFFA */  bnez       $v0, .L800C4A88
/* C56A0 800C4AA0 24630004 */   addiu     $v1, $v1, 4
/* C56A4 800C4AA4 24A50001 */  addiu      $a1, $a1, 1
/* C56A8 800C4AA8 28A20004 */  slti       $v0, $a1, 4
/* C56AC 800C4AAC 1440FFF4 */  bnez       $v0, .L800C4A80
/* C56B0 800C4AB0 26100010 */   addiu     $s0, $s0, 0x10
/* C56B4 800C4AB4 12200023 */  beqz       $s1, .L800C4B44
/* C56B8 800C4AB8 00000000 */   nop
/* C56BC 800C4ABC 461CD080 */  add.s      $f2, $f26, $f28
/* C56C0 800C4AC0 3C01800E */  lui        $at, %hi(perspective_rodata_0008)
/* C56C4 800C4AC4 D4205418 */  ldc1       $f0, %lo(perspective_rodata_0008)($at)
/* C56C8 800C4AC8 460010A1 */  cvt.d.s    $f2, $f2
/* C56CC 800C4ACC 4620103E */  c.le.d     $f2, $f0
/* C56D0 800C4AD0 00000000 */  nop
/* C56D4 800C4AD4 00000000 */  nop
/* C56D8 800C4AD8 45010019 */  bc1t       .L800C4B40
/* C56DC 800C4ADC 3402FFFF */   ori       $v0, $zero, 0xffff
/* C56E0 800C4AE0 3C01800E */  lui        $at, %hi(perspective_rodata_0010)
/* C56E4 800C4AE4 D4205420 */  ldc1       $f0, %lo(perspective_rodata_0010)($at)
/* C56E8 800C4AE8 46220083 */  div.d      $f2, $f0, $f2
/* C56EC 800C4AEC 3C01800E */  lui        $at, %hi(perspective_rodata_0018)
/* C56F0 800C4AF0 D4205428 */  ldc1       $f0, %lo(perspective_rodata_0018)($at)
/* C56F4 800C4AF4 4622003E */  c.le.d     $f0, $f2
/* C56F8 800C4AF8 00000000 */  nop
/* C56FC 800C4AFC 00000000 */  nop
/* C5700 800C4B00 45030006 */  bc1tl      .L800C4B1C
/* C5704 800C4B04 46201001 */   sub.d     $f0, $f2, $f0
/* C5708 800C4B08 4620100D */  trunc.w.d  $f0, $f2
/* C570C 800C4B0C 44030000 */  mfc1       $v1, $f0
/* C5710 800C4B10 00000000 */  nop
/* C5714 800C4B14 080312CC */  j          .L800C4B30
/* C5718 800C4B18 00601021 */   addu      $v0, $v1, $zero
.L800C4B1C:
/* C571C 800C4B1C 4620008D */  trunc.w.d  $f2, $f0
/* C5720 800C4B20 44031000 */  mfc1       $v1, $f2
/* C5724 800C4B24 3C028000 */  lui        $v0, 0x8000
/* C5728 800C4B28 00621825 */  or         $v1, $v1, $v0
/* C572C 800C4B2C 00601021 */  addu       $v0, $v1, $zero
.L800C4B30:
/* C5730 800C4B30 A6220000 */  sh         $v0, ($s1)
/* C5734 800C4B34 3042FFFF */  andi       $v0, $v0, 0xffff
/* C5738 800C4B38 14400002 */  bnez       $v0, .L800C4B44
/* C573C 800C4B3C 24020001 */   addiu     $v0, $zero, 1
.L800C4B40:
/* C5740 800C4B40 A6220000 */  sh         $v0, ($s1)
.L800C4B44:
/* C5744 800C4B44 8FBF0018 */  lw         $ra, 0x18($sp)
/* C5748 800C4B48 8FB10014 */  lw         $s1, 0x14($sp)
/* C574C 800C4B4C 8FB00010 */  lw         $s0, 0x10($sp)
/* C5750 800C4B50 D7BE0048 */  ldc1       $f30, 0x48($sp)
/* C5754 800C4B54 D7BC0040 */  ldc1       $f28, 0x40($sp)
/* C5758 800C4B58 D7BA0038 */  ldc1       $f26, 0x38($sp)
/* C575C 800C4B5C D7B80030 */  ldc1       $f24, 0x30($sp)
/* C5760 800C4B60 D7B60028 */  ldc1       $f22, 0x28($sp)
/* C5764 800C4B64 D7B40020 */  ldc1       $f20, 0x20($sp)
/* C5768 800C4B68 03E00008 */  jr         $ra
/* C576C 800C4B6C 27BD0050 */   addiu     $sp, $sp, 0x50

glabel guPerspective
/* C5770 800C4B70 27BDFF78 */  addiu      $sp, $sp, -0x88
/* C5774 800C4B74 F7B80070 */  sdc1       $f24, 0x70($sp)
/* C5778 800C4B78 C7B80098 */  lwc1       $f24, 0x98($sp)
/* C577C 800C4B7C F7BA0078 */  sdc1       $f26, 0x78($sp)
/* C5780 800C4B80 C7BA009C */  lwc1       $f26, 0x9c($sp)
/* C5784 800C4B84 F7BC0080 */  sdc1       $f28, 0x80($sp)
/* C5788 800C4B88 C7BC00A0 */  lwc1       $f28, 0xa0($sp)
/* C578C 800C4B8C F7B40060 */  sdc1       $f20, 0x60($sp)
/* C5790 800C4B90 4486A000 */  mtc1       $a2, $f20
/* C5794 800C4B94 AFB20058 */  sw         $s2, 0x58($sp)
/* C5798 800C4B98 00809021 */  addu       $s2, $a0, $zero
/* C579C 800C4B9C AFB10054 */  sw         $s1, 0x54($sp)
/* C57A0 800C4BA0 00A08821 */  addu       $s1, $a1, $zero
/* C57A4 800C4BA4 AFB00050 */  sw         $s0, 0x50($sp)
/* C57A8 800C4BA8 27B00010 */  addiu      $s0, $sp, 0x10
/* C57AC 800C4BAC F7B60068 */  sdc1       $f22, 0x68($sp)
/* C57B0 800C4BB0 4487B000 */  mtc1       $a3, $f22
/* C57B4 800C4BB4 AFBF005C */  sw         $ra, 0x5c($sp)
/* C57B8 800C4BB8 0C0311DC */  jal        guMtxIdentF
/* C57BC 800C4BBC 02002021 */   addu      $a0, $s0, $zero
/* C57C0 800C4BC0 3C01800E */  lui        $at, %hi(perspective_rodata_0020)
/* C57C4 800C4BC4 D4205430 */  ldc1       $f0, %lo(perspective_rodata_0020)($at)
/* C57C8 800C4BC8 4600A521 */  cvt.d.s    $f20, $f20
/* C57CC 800C4BCC 4620A502 */  mul.d      $f20, $f20, $f0
/* C57D0 800C4BD0 3C014000 */  lui        $at, 0x4000
/* C57D4 800C4BD4 44810000 */  mtc1       $at, $f0
/* C57D8 800C4BD8 4620A520 */  cvt.s.d    $f20, $f20
/* C57DC 800C4BDC 4600A503 */  div.s      $f20, $f20, $f0
/* C57E0 800C4BE0 0C02FB50 */  jal        __cosf
/* C57E4 800C4BE4 4600A306 */   mov.s     $f12, $f20
/* C57E8 800C4BE8 4600A306 */  mov.s      $f12, $f20
/* C57EC 800C4BEC 0C03328C */  jal        __sinf
/* C57F0 800C4BF0 46000506 */   mov.s     $f20, $f0
/* C57F4 800C4BF4 4600A503 */  div.s      $f20, $f20, $f0
/* C57F8 800C4BF8 461AC100 */  add.s      $f4, $f24, $f26
/* C57FC 800C4BFC 461AC081 */  sub.s      $f2, $f24, $f26
/* C5800 800C4C00 46022103 */  div.s      $f4, $f4, $f2
/* C5804 800C4C04 4618C000 */  add.s      $f0, $f24, $f24
/* C5808 800C4C08 461A0002 */  mul.s      $f0, $f0, $f26
/* C580C 800C4C0C 46020003 */  div.s      $f0, $f0, $f2
/* C5810 800C4C10 4616A583 */  div.s      $f22, $f20, $f22
/* C5814 800C4C14 3C01BF80 */  lui        $at, 0xbf80
/* C5818 800C4C18 44811000 */  mtc1       $at, $f2
/* C581C 800C4C1C 00002821 */  addu       $a1, $zero, $zero
/* C5820 800C4C20 AFA0004C */  sw         $zero, 0x4c($sp)
/* C5824 800C4C24 E7A2003C */  swc1       $f2, 0x3c($sp)
/* C5828 800C4C28 E7B40024 */  swc1       $f20, 0x24($sp)
/* C582C 800C4C2C E7A40038 */  swc1       $f4, 0x38($sp)
/* C5830 800C4C30 E7A00048 */  swc1       $f0, 0x48($sp)
/* C5834 800C4C34 E7B60010 */  swc1       $f22, 0x10($sp)
.L800C4C38:
/* C5838 800C4C38 00002021 */  addu       $a0, $zero, $zero
/* C583C 800C4C3C 02001821 */  addu       $v1, $s0, $zero
.L800C4C40:
/* C5840 800C4C40 C4600000 */  lwc1       $f0, ($v1)
/* C5844 800C4C44 461C0002 */  mul.s      $f0, $f0, $f28
/* C5848 800C4C48 24840001 */  addiu      $a0, $a0, 1
/* C584C 800C4C4C 28820004 */  slti       $v0, $a0, 4
/* C5850 800C4C50 E4600000 */  swc1       $f0, ($v1)
/* C5854 800C4C54 1440FFFA */  bnez       $v0, .L800C4C40
/* C5858 800C4C58 24630004 */   addiu     $v1, $v1, 4
/* C585C 800C4C5C 24A50001 */  addiu      $a1, $a1, 1
/* C5860 800C4C60 28A20004 */  slti       $v0, $a1, 4
/* C5864 800C4C64 1440FFF4 */  bnez       $v0, .L800C4C38
/* C5868 800C4C68 26100010 */   addiu     $s0, $s0, 0x10
/* C586C 800C4C6C 52200025 */  beql       $s1, $zero, .L800C4D04
/* C5870 800C4C70 27A40010 */   addiu     $a0, $sp, 0x10
/* C5874 800C4C74 461AC080 */  add.s      $f2, $f24, $f26
/* C5878 800C4C78 3C01800E */  lui        $at, %hi(perspective_rodata_0028)
/* C587C 800C4C7C D4205438 */  ldc1       $f0, %lo(perspective_rodata_0028)($at)
/* C5880 800C4C80 460010A1 */  cvt.d.s    $f2, $f2
/* C5884 800C4C84 4620103E */  c.le.d     $f2, $f0
/* C5888 800C4C88 00000000 */  nop
/* C588C 800C4C8C 00000000 */  nop
/* C5890 800C4C90 4501001A */  bc1t       .L800C4CFC
/* C5894 800C4C94 3402FFFF */   ori       $v0, $zero, 0xffff
/* C5898 800C4C98 3C01800E */  lui        $at, %hi(perspective_rodata_0030)
/* C589C 800C4C9C D4205440 */  ldc1       $f0, %lo(perspective_rodata_0030)($at)
/* C58A0 800C4CA0 46220083 */  div.d      $f2, $f0, $f2
/* C58A4 800C4CA4 3C01800E */  lui        $at, %hi(perspective_rodata_0038)
/* C58A8 800C4CA8 D4205448 */  ldc1       $f0, %lo(perspective_rodata_0038)($at)
/* C58AC 800C4CAC 4622003E */  c.le.d     $f0, $f2
/* C58B0 800C4CB0 00000000 */  nop
/* C58B4 800C4CB4 00000000 */  nop
/* C58B8 800C4CB8 45030006 */  bc1tl      .L800C4CD4
/* C58BC 800C4CBC 46201001 */   sub.d     $f0, $f2, $f0
/* C58C0 800C4CC0 4620100D */  trunc.w.d  $f0, $f2
/* C58C4 800C4CC4 44030000 */  mfc1       $v1, $f0
/* C58C8 800C4CC8 00000000 */  nop
/* C58CC 800C4CCC 0803133A */  j          .L800C4CE8
/* C58D0 800C4CD0 00601021 */   addu      $v0, $v1, $zero
.L800C4CD4:
/* C58D4 800C4CD4 4620008D */  trunc.w.d  $f2, $f0
/* C58D8 800C4CD8 44031000 */  mfc1       $v1, $f2
/* C58DC 800C4CDC 3C028000 */  lui        $v0, 0x8000
/* C58E0 800C4CE0 00621825 */  or         $v1, $v1, $v0
/* C58E4 800C4CE4 00601021 */  addu       $v0, $v1, $zero
.L800C4CE8:
/* C58E8 800C4CE8 A6220000 */  sh         $v0, ($s1)
/* C58EC 800C4CEC 3042FFFF */  andi       $v0, $v0, 0xffff
/* C58F0 800C4CF0 14400004 */  bnez       $v0, .L800C4D04
/* C58F4 800C4CF4 27A40010 */   addiu     $a0, $sp, 0x10
/* C58F8 800C4CF8 24020001 */  addiu      $v0, $zero, 1
.L800C4CFC:
/* C58FC 800C4CFC A6220000 */  sh         $v0, ($s1)
/* C5900 800C4D00 27A40010 */  addiu      $a0, $sp, 0x10
.L800C4D04:
/* C5904 800C4D04 0C03118C */  jal        guMtxF2L
/* C5908 800C4D08 02402821 */   addu      $a1, $s2, $zero
/* C590C 800C4D0C 8FBF005C */  lw         $ra, 0x5c($sp)
/* C5910 800C4D10 8FB20058 */  lw         $s2, 0x58($sp)
/* C5914 800C4D14 8FB10054 */  lw         $s1, 0x54($sp)
/* C5918 800C4D18 8FB00050 */  lw         $s0, 0x50($sp)
/* C591C 800C4D1C D7BC0080 */  ldc1       $f28, 0x80($sp)
/* C5920 800C4D20 D7BA0078 */  ldc1       $f26, 0x78($sp)
/* C5924 800C4D24 D7B80070 */  ldc1       $f24, 0x70($sp)
/* C5928 800C4D28 D7B60068 */  ldc1       $f22, 0x68($sp)
/* C592C 800C4D2C D7B40060 */  ldc1       $f20, 0x60($sp)
/* C5930 800C4D30 03E00008 */  jr         $ra
/* C5934 800C4D34 27BD0088 */   addiu     $sp, $sp, 0x88
/* C5938 800C4D38 00000000 */  nop
/* C593C 800C4D3C 00000000 */  nop
