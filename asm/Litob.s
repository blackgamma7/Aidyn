.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _Litob
/* D51D0 800D45D0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* D51D4 800D45D4 AFB10044 */  sw         $s1, 0x44($sp)
/* D51D8 800D45D8 00808821 */  addu       $s1, $a0, $zero
/* D51DC 800D45DC AFB60058 */  sw         $s6, 0x58($sp)
/* D51E0 800D45E0 3C16800F */  lui        $s6, %hi(ldigs)
/* D51E4 800D45E4 26D65030 */  addiu      $s6, $s6, %lo(ldigs)
/* D51E8 800D45E8 30A400FF */  andi       $a0, $a1, 0xff
/* D51EC 800D45EC 24020058 */  addiu      $v0, $zero, 0x58
/* D51F0 800D45F0 AFBF005C */  sw         $ra, 0x5c($sp)
/* D51F4 800D45F4 AFB50054 */  sw         $s5, 0x54($sp)
/* D51F8 800D45F8 AFB40050 */  sw         $s4, 0x50($sp)
/* D51FC 800D45FC AFB3004C */  sw         $s3, 0x4c($sp)
/* D5200 800D4600 AFB20048 */  sw         $s2, 0x48($sp)
/* D5204 800D4604 14820003 */  bne        $a0, $v0, .L800D4614
/* D5208 800D4608 AFB00040 */   sw        $s0, 0x40($sp)
/* D520C 800D460C 3C16800F */  lui        $s6, %hi(udigs)
/* D5210 800D4610 26D65044 */  addiu      $s6, $s6, %lo(udigs)
.L800D4614:
/* D5214 800D4614 2402006F */  addiu      $v0, $zero, 0x6f
/* D5218 800D4618 10820009 */  beq        $a0, $v0, .L800D4640
/* D521C 800D461C 38830078 */   xori      $v1, $a0, 0x78
/* D5220 800D4620 0003182B */  sltu       $v1, $zero, $v1
/* D5224 800D4624 38820058 */  xori       $v0, $a0, 0x58
/* D5228 800D4628 0002102B */  sltu       $v0, $zero, $v0
/* D522C 800D462C 00621824 */  and        $v1, $v1, $v0
/* D5230 800D4630 10600004 */  beqz       $v1, .L800D4644
/* D5234 800D4634 24130010 */   addiu     $s3, $zero, 0x10
/* D5238 800D4638 08035191 */  j          .L800D4644
/* D523C 800D463C 2413000A */   addiu     $s3, $zero, 0xa
.L800D4640:
/* D5240 800D4640 24130008 */  addiu      $s3, $zero, 8
.L800D4644:
/* D5244 800D4644 8E340000 */  lw         $s4, ($s1)
/* D5248 800D4648 8E350004 */  lw         $s5, 4($s1)
/* D524C 800D464C 30A200FF */  andi       $v0, $a1, 0xff
/* D5250 800D4650 38430064 */  xori       $v1, $v0, 0x64
/* D5254 800D4654 2C630001 */  sltiu      $v1, $v1, 1
/* D5258 800D4658 38420069 */  xori       $v0, $v0, 0x69
/* D525C 800D465C 2C420001 */  sltiu      $v0, $v0, 1
/* D5260 800D4660 00621825 */  or         $v1, $v1, $v0
/* D5264 800D4664 10600008 */  beqz       $v1, .L800D4688
/* D5268 800D4668 24120018 */   addiu     $s2, $zero, 0x18
/* D526C 800D466C 8E220000 */  lw         $v0, ($s1)
/* D5270 800D4670 04410005 */  bgez       $v0, .L800D4688
/* D5274 800D4674 00000000 */   nop
/* D5278 800D4678 0015A823 */  negu       $s5, $s5
/* D527C 800D467C 0014A023 */  negu       $s4, $s4
/* D5280 800D4680 0015102B */  sltu       $v0, $zero, $s5
/* D5284 800D4684 0282A023 */  subu       $s4, $s4, $v0
.L800D4688:
/* D5288 800D4688 56800007 */  bnel       $s4, $zero, .L800D46A8
/* D528C 800D468C 2652FFFF */   addiu     $s2, $s2, -1
/* D5290 800D4690 56A00005 */  bnel       $s5, $zero, .L800D46A8
/* D5294 800D4694 2652FFFF */   addiu     $s2, $s2, -1
/* D5298 800D4698 8E220024 */  lw         $v0, 0x24($s1)
/* D529C 800D469C 1040000D */  beqz       $v0, .L800D46D4
/* D52A0 800D46A0 02603821 */   addu      $a3, $s3, $zero
/* D52A4 800D46A4 2652FFFF */  addiu      $s2, $s2, -1
.L800D46A8:
/* D52A8 800D46A8 02603821 */  addu       $a3, $s3, $zero
/* D52AC 800D46AC 00003021 */  addu       $a2, $zero, $zero
/* D52B0 800D46B0 02802021 */  addu       $a0, $s4, $zero
/* D52B4 800D46B4 02A02821 */  addu       $a1, $s5, $zero
/* D52B8 800D46B8 27B00018 */  addiu      $s0, $sp, 0x18
/* D52BC 800D46BC 0C035208 */  jal        litob_sub
/* D52C0 800D46C0 02128021 */   addu      $s0, $s0, $s2
/* D52C4 800D46C4 02C31021 */  addu       $v0, $s6, $v1
/* D52C8 800D46C8 90420000 */  lbu        $v0, ($v0)
/* D52CC 800D46CC A2020000 */  sb         $v0, ($s0)
/* D52D0 800D46D0 02603821 */  addu       $a3, $s3, $zero
.L800D46D4:
/* D52D4 800D46D4 00003021 */  addu       $a2, $zero, $zero
/* D52D8 800D46D8 02802021 */  addu       $a0, $s4, $zero
/* D52DC 800D46DC 0C02F6D8 */  jal        udivdi3
/* D52E0 800D46E0 02A02821 */   addu      $a1, $s5, $zero
/* D52E4 800D46E4 AE220000 */  sw         $v0, ($s1)
/* D52E8 800D46E8 AE230004 */  sw         $v1, 4($s1)
/* D52EC 800D46EC 27A20018 */  addiu      $v0, $sp, 0x18
/* D52F0 800D46F0 02428021 */  addu       $s0, $s2, $v0
.L800D46F4:
/* D52F4 800D46F4 8E220000 */  lw         $v0, ($s1)
/* D52F8 800D46F8 1C400006 */  bgtz       $v0, .L800D4714
/* D52FC 800D46FC 00001821 */   addu      $v1, $zero, $zero
/* D5300 800D4700 14400006 */  bnez       $v0, .L800D471C
/* D5304 800D4704 0012102A */   slt       $v0, $zero, $s2
/* D5308 800D4708 8E220004 */  lw         $v0, 4($s1)
/* D530C 800D470C 10400003 */  beqz       $v0, .L800D471C
/* D5310 800D4710 0012102A */   slt       $v0, $zero, $s2
.L800D4714:
/* D5314 800D4714 24030001 */  addiu      $v1, $zero, 1
/* D5318 800D4718 0012102A */  slt        $v0, $zero, $s2
.L800D471C:
/* D531C 800D471C 00621024 */  and        $v0, $v1, $v0
/* D5320 800D4720 10400014 */  beqz       $v0, .L800D4774
/* D5324 800D4724 02601821 */   addu      $v1, $s3, $zero
/* D5328 800D4728 8E260000 */  lw         $a2, ($s1)
/* D532C 800D472C 8E270004 */  lw         $a3, 4($s1)
/* D5330 800D4730 001317C3 */  sra        $v0, $s3, 0x1f
/* D5334 800D4734 AFA20010 */  sw         $v0, 0x10($sp)
/* D5338 800D4738 AFA30014 */  sw         $v1, 0x14($sp)
/* D533C 800D473C 0C034FA9 */  jal        lldiv
/* D5340 800D4740 27A40030 */   addiu     $a0, $sp, 0x30
/* D5344 800D4744 8FA20030 */  lw         $v0, 0x30($sp)
/* D5348 800D4748 8FA30034 */  lw         $v1, 0x34($sp)
/* D534C 800D474C AE220000 */  sw         $v0, ($s1)
/* D5350 800D4750 AE230004 */  sw         $v1, 4($s1)
/* D5354 800D4754 8FA20038 */  lw         $v0, 0x38($sp)
/* D5358 800D4758 8FA3003C */  lw         $v1, 0x3c($sp)
/* D535C 800D475C 02C31021 */  addu       $v0, $s6, $v1
/* D5360 800D4760 90420000 */  lbu        $v0, ($v0)
/* D5364 800D4764 2610FFFF */  addiu      $s0, $s0, -1
/* D5368 800D4768 2652FFFF */  addiu      $s2, $s2, -1
/* D536C 800D476C 080351BD */  j          .L800D46F4
/* D5370 800D4770 A2020000 */   sb        $v0, ($s0)
.L800D4774:
/* D5374 800D4774 8E240008 */  lw         $a0, 8($s1)
/* D5378 800D4778 27A50018 */  addiu      $a1, $sp, 0x18
/* D537C 800D477C 00B22821 */  addu       $a1, $a1, $s2
/* D5380 800D4780 24060018 */  addiu      $a2, $zero, 0x18
/* D5384 800D4784 00D23023 */  subu       $a2, $a2, $s2
/* D5388 800D4788 0C033547 */  jal        memcpy
/* D538C 800D478C AE260014 */   sw        $a2, 0x14($s1)
/* D5390 800D4790 8E240014 */  lw         $a0, 0x14($s1)
/* D5394 800D4794 8E230024 */  lw         $v1, 0x24($s1)
/* D5398 800D4798 0083102A */  slt        $v0, $a0, $v1
/* D539C 800D479C 10400002 */  beqz       $v0, .L800D47A8
/* D53A0 800D47A0 00641023 */   subu      $v0, $v1, $a0
/* D53A4 800D47A4 AE220010 */  sw         $v0, 0x10($s1)
.L800D47A8:
/* D53A8 800D47A8 8E220024 */  lw         $v0, 0x24($s1)
/* D53AC 800D47AC 0441000F */  bgez       $v0, .L800D47EC
/* D53B0 800D47B0 24030010 */   addiu     $v1, $zero, 0x10
/* D53B4 800D47B4 8E220030 */  lw         $v0, 0x30($s1)
/* D53B8 800D47B8 30420014 */  andi       $v0, $v0, 0x14
/* D53BC 800D47BC 1443000B */  bne        $v0, $v1, .L800D47EC
/* D53C0 800D47C0 00000000 */   nop
/* D53C4 800D47C4 8E220028 */  lw         $v0, 0x28($s1)
/* D53C8 800D47C8 8E23000C */  lw         $v1, 0xc($s1)
/* D53CC 800D47CC 8E250010 */  lw         $a1, 0x10($s1)
/* D53D0 800D47D0 8E240014 */  lw         $a0, 0x14($s1)
/* D53D4 800D47D4 00431023 */  subu       $v0, $v0, $v1
/* D53D8 800D47D8 00451023 */  subu       $v0, $v0, $a1
/* D53DC 800D47DC 00449023 */  subu       $s2, $v0, $a0
/* D53E0 800D47E0 1A400002 */  blez       $s2, .L800D47EC
/* D53E4 800D47E4 00B21021 */   addu      $v0, $a1, $s2
/* D53E8 800D47E8 AE220010 */  sw         $v0, 0x10($s1)
.L800D47EC:
/* D53EC 800D47EC 8FBF005C */  lw         $ra, 0x5c($sp)
/* D53F0 800D47F0 8FB60058 */  lw         $s6, 0x58($sp)
/* D53F4 800D47F4 8FB50054 */  lw         $s5, 0x54($sp)
/* D53F8 800D47F8 8FB40050 */  lw         $s4, 0x50($sp)
/* D53FC 800D47FC 8FB3004C */  lw         $s3, 0x4c($sp)
/* D5400 800D4800 8FB20048 */  lw         $s2, 0x48($sp)
/* D5404 800D4804 8FB10044 */  lw         $s1, 0x44($sp)
/* D5408 800D4808 8FB00040 */  lw         $s0, 0x40($sp)
/* D540C 800D480C 03E00008 */  jr         $ra
/* D5410 800D4810 27BD0060 */   addiu     $sp, $sp, 0x60
/* D5414 800D4814 00000000 */  nop
/* D5418 800D4818 00000000 */  nop
/* D541C 800D481C 00000000 */  nop
