.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guMtxF2L
/* C5230 800C4630 00A04021 */  addu       $t0, $a1, $zero
/* C5234 800C4634 25090020 */  addiu      $t1, $t0, 0x20
/* C5238 800C4638 00005821 */  addu       $t3, $zero, $zero
/* C523C 800C463C 3C014780 */  lui        $at, 0x4780
/* C5240 800C4640 44813000 */  mtc1       $at, $f6
/* C5244 800C4644 3C0CFFFF */  lui        $t4, 0xffff
/* C5248 800C4648 00805021 */  addu       $t2, $a0, $zero
.L800C464C:
/* C524C 800C464C 00003821 */  addu       $a3, $zero, $zero
/* C5250 800C4650 01403021 */  addu       $a2, $t2, $zero
.L800C4654:
/* C5254 800C4654 C4C20000 */  lwc1       $f2, ($a2)
/* C5258 800C4658 46061082 */  mul.s      $f2, $f2, $f6
/* C525C 800C465C C4C00004 */  lwc1       $f0, 4($a2)
/* C5260 800C4660 46060002 */  mul.s      $f0, $f0, $f6
/* C5264 800C4664 24C60008 */  addiu      $a2, $a2, 8
/* C5268 800C4668 24E70001 */  addiu      $a3, $a3, 1
/* C526C 800C466C 4600110D */  trunc.w.s  $f4, $f2
/* C5270 800C4670 44042000 */  mfc1       $a0, $f4
/* C5274 800C4674 4600008D */  trunc.w.s  $f2, $f0
/* C5278 800C4678 44051000 */  mfc1       $a1, $f2
/* C527C 800C467C 008C1024 */  and        $v0, $a0, $t4
/* C5280 800C4680 00051C02 */  srl        $v1, $a1, 0x10
/* C5284 800C4684 00431025 */  or         $v0, $v0, $v1
/* C5288 800C4688 AD020000 */  sw         $v0, ($t0)
/* C528C 800C468C 25080004 */  addiu      $t0, $t0, 4
/* C5290 800C4690 00042400 */  sll        $a0, $a0, 0x10
/* C5294 800C4694 008C2024 */  and        $a0, $a0, $t4
/* C5298 800C4698 30A5FFFF */  andi       $a1, $a1, 0xffff
/* C529C 800C469C 00852025 */  or         $a0, $a0, $a1
/* C52A0 800C46A0 AD240000 */  sw         $a0, ($t1)
/* C52A4 800C46A4 28E20002 */  slti       $v0, $a3, 2
/* C52A8 800C46A8 1440FFEA */  bnez       $v0, .L800C4654
/* C52AC 800C46AC 25290004 */   addiu     $t1, $t1, 4
/* C52B0 800C46B0 256B0001 */  addiu      $t3, $t3, 1
/* C52B4 800C46B4 29620004 */  slti       $v0, $t3, 4
/* C52B8 800C46B8 1440FFE4 */  bnez       $v0, .L800C464C
/* C52BC 800C46BC 254A0010 */   addiu     $t2, $t2, 0x10
/* C52C0 800C46C0 03E00008 */  jr         $ra
/* C52C4 800C46C4 00000000 */   nop

glabel guMtxL2F
/* C52C8 800C46C8 27BDFFF8 */  addiu      $sp, $sp, -8
/* C52CC 800C46CC 24A80020 */  addiu      $t0, $a1, 0x20
/* C52D0 800C46D0 00004821 */  addu       $t1, $zero, $zero
/* C52D4 800C46D4 3C0AFFFF */  lui        $t2, 0xffff
/* C52D8 800C46D8 3C013780 */  lui        $at, 0x3780
/* C52DC 800C46DC 44812000 */  mtc1       $at, $f4
.L800C46E0:
/* C52E0 800C46E0 00003821 */  addu       $a3, $zero, $zero
/* C52E4 800C46E4 00803021 */  addu       $a2, $a0, $zero
.L800C46E8:
/* C52E8 800C46E8 8CA20000 */  lw         $v0, ($a1)
/* C52EC 800C46EC 95030000 */  lhu        $v1, ($t0)
/* C52F0 800C46F0 004A1024 */  and        $v0, $v0, $t2
/* C52F4 800C46F4 00431025 */  or         $v0, $v0, $v1
/* C52F8 800C46F8 AFA20000 */  sw         $v0, ($sp)
/* C52FC 800C46FC 8CA30000 */  lw         $v1, ($a1)
/* C5300 800C4700 44821000 */  mtc1       $v0, $f2
/* C5304 800C4704 00000000 */  nop
/* C5308 800C4708 468010A0 */  cvt.s.w    $f2, $f2
/* C530C 800C470C 46041082 */  mul.s      $f2, $f2, $f4
/* C5310 800C4710 95020002 */  lhu        $v0, 2($t0)
/* C5314 800C4714 00031C00 */  sll        $v1, $v1, 0x10
/* C5318 800C4718 006A1824 */  and        $v1, $v1, $t2
/* C531C 800C471C 00621825 */  or         $v1, $v1, $v0
/* C5320 800C4720 44830000 */  mtc1       $v1, $f0
/* C5324 800C4724 00000000 */  nop
/* C5328 800C4728 46800020 */  cvt.s.w    $f0, $f0
/* C532C 800C472C 46040002 */  mul.s      $f0, $f0, $f4
/* C5330 800C4730 24E70001 */  addiu      $a3, $a3, 1
/* C5334 800C4734 25080004 */  addiu      $t0, $t0, 4
/* C5338 800C4738 24A50004 */  addiu      $a1, $a1, 4
/* C533C 800C473C 28E20002 */  slti       $v0, $a3, 2
/* C5340 800C4740 AFA30004 */  sw         $v1, 4($sp)
/* C5344 800C4744 E4C20000 */  swc1       $f2, ($a2)
/* C5348 800C4748 E4C00004 */  swc1       $f0, 4($a2)
/* C534C 800C474C 1440FFE6 */  bnez       $v0, .L800C46E8
/* C5350 800C4750 24C60008 */   addiu     $a2, $a2, 8
/* C5354 800C4754 25290001 */  addiu      $t1, $t1, 1
/* C5358 800C4758 29220004 */  slti       $v0, $t1, 4
/* C535C 800C475C 1440FFE0 */  bnez       $v0, .L800C46E0
/* C5360 800C4760 24840010 */   addiu     $a0, $a0, 0x10
/* C5364 800C4764 27BD0008 */  addiu      $sp, $sp, 8
/* C5368 800C4768 03E00008 */  jr         $ra
/* C536C 800C476C 00000000 */   nop

glabel guMtxIdentF
/* C5370 800C4770 00003021 */  addu       $a2, $zero, $zero
/* C5374 800C4774 3C013F80 */  lui        $at, 0x3f80
/* C5378 800C4778 44810000 */  mtc1       $at, $f0
/* C537C 800C477C 00803821 */  addu       $a3, $a0, $zero
.L800C4780:
/* C5380 800C4780 00001821 */  addu       $v1, $zero, $zero
/* C5384 800C4784 00802821 */  addu       $a1, $a0, $zero
.L800C4788:
/* C5388 800C4788 54C30002 */  bnel       $a2, $v1, .L800C4794
/* C538C 800C478C ACA00000 */   sw        $zero, ($a1)
/* C5390 800C4790 E4E00000 */  swc1       $f0, ($a3)
.L800C4794:
/* C5394 800C4794 24630001 */  addiu      $v1, $v1, 1
/* C5398 800C4798 28620004 */  slti       $v0, $v1, 4
/* C539C 800C479C 1440FFFA */  bnez       $v0, .L800C4788
/* C53A0 800C47A0 24A50004 */   addiu     $a1, $a1, 4
/* C53A4 800C47A4 24E70014 */  addiu      $a3, $a3, 0x14
/* C53A8 800C47A8 24C60001 */  addiu      $a2, $a2, 1
/* C53AC 800C47AC 28C20004 */  slti       $v0, $a2, 4
/* C53B0 800C47B0 1440FFF3 */  bnez       $v0, .L800C4780
/* C53B4 800C47B4 24840010 */   addiu     $a0, $a0, 0x10
/* C53B8 800C47B8 03E00008 */  jr         $ra
/* C53BC 800C47BC 00000000 */   nop

glabel guMtxIdent
/* C53C0 800C47C0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* C53C4 800C47C4 00003021 */  addu       $a2, $zero, $zero
/* C53C8 800C47C8 3C013F80 */  lui        $at, 0x3f80
/* C53CC 800C47CC 44810000 */  mtc1       $at, $f0
/* C53D0 800C47D0 03A04821 */  addu       $t1, $sp, $zero
/* C53D4 800C47D4 03A04021 */  addu       $t0, $sp, $zero
.L800C47D8:
/* C53D8 800C47D8 00001821 */  addu       $v1, $zero, $zero
/* C53DC 800C47DC 01203821 */  addu       $a3, $t1, $zero
/* C53E0 800C47E0 01002821 */  addu       $a1, $t0, $zero
.L800C47E4:
/* C53E4 800C47E4 54C30002 */  bnel       $a2, $v1, .L800C47F0
/* C53E8 800C47E8 ACA00000 */   sw        $zero, ($a1)
/* C53EC 800C47EC E4E00000 */  swc1       $f0, ($a3)
.L800C47F0:
/* C53F0 800C47F0 24630001 */  addiu      $v1, $v1, 1
/* C53F4 800C47F4 28620004 */  slti       $v0, $v1, 4
/* C53F8 800C47F8 1440FFFA */  bnez       $v0, .L800C47E4
/* C53FC 800C47FC 24A50004 */   addiu     $a1, $a1, 4
/* C5400 800C4800 25290014 */  addiu      $t1, $t1, 0x14
/* C5404 800C4804 24C60001 */  addiu      $a2, $a2, 1
/* C5408 800C4808 28C20004 */  slti       $v0, $a2, 4
/* C540C 800C480C 1440FFF2 */  bnez       $v0, .L800C47D8
/* C5410 800C4810 25080010 */   addiu     $t0, $t0, 0x10
/* C5414 800C4814 00804021 */  addu       $t0, $a0, $zero
/* C5418 800C4818 25090020 */  addiu      $t1, $t0, 0x20
/* C541C 800C481C 00005821 */  addu       $t3, $zero, $zero
/* C5420 800C4820 3C014780 */  lui        $at, 0x4780
/* C5424 800C4824 44813000 */  mtc1       $at, $f6
/* C5428 800C4828 3C0CFFFF */  lui        $t4, 0xffff
/* C542C 800C482C 03A05021 */  addu       $t2, $sp, $zero
.L800C4830:
/* C5430 800C4830 00003821 */  addu       $a3, $zero, $zero
/* C5434 800C4834 01403021 */  addu       $a2, $t2, $zero
.L800C4838:
/* C5438 800C4838 C4C20000 */  lwc1       $f2, ($a2)
/* C543C 800C483C 46061082 */  mul.s      $f2, $f2, $f6
/* C5440 800C4840 C4C00004 */  lwc1       $f0, 4($a2)
/* C5444 800C4844 46060002 */  mul.s      $f0, $f0, $f6
/* C5448 800C4848 24C60008 */  addiu      $a2, $a2, 8
/* C544C 800C484C 24E70001 */  addiu      $a3, $a3, 1
/* C5450 800C4850 4600110D */  trunc.w.s  $f4, $f2
/* C5454 800C4854 44042000 */  mfc1       $a0, $f4
/* C5458 800C4858 4600008D */  trunc.w.s  $f2, $f0
/* C545C 800C485C 44051000 */  mfc1       $a1, $f2
/* C5460 800C4860 008C1024 */  and        $v0, $a0, $t4
/* C5464 800C4864 00051C02 */  srl        $v1, $a1, 0x10
/* C5468 800C4868 00431025 */  or         $v0, $v0, $v1
/* C546C 800C486C AD020000 */  sw         $v0, ($t0)
/* C5470 800C4870 25080004 */  addiu      $t0, $t0, 4
/* C5474 800C4874 00042400 */  sll        $a0, $a0, 0x10
/* C5478 800C4878 008C2024 */  and        $a0, $a0, $t4
/* C547C 800C487C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* C5480 800C4880 00852025 */  or         $a0, $a0, $a1
/* C5484 800C4884 AD240000 */  sw         $a0, ($t1)
/* C5488 800C4888 28E20002 */  slti       $v0, $a3, 2
/* C548C 800C488C 1440FFEA */  bnez       $v0, .L800C4838
/* C5490 800C4890 25290004 */   addiu     $t1, $t1, 4
/* C5494 800C4894 256B0001 */  addiu      $t3, $t3, 1
/* C5498 800C4898 29620004 */  slti       $v0, $t3, 4
/* C549C 800C489C 1440FFE4 */  bnez       $v0, .L800C4830
/* C54A0 800C48A0 254A0010 */   addiu     $t2, $t2, 0x10
/* C54A4 800C48A4 27BD0040 */  addiu      $sp, $sp, 0x40
/* C54A8 800C48A8 03E00008 */  jr         $ra
/* C54AC 800C48AC 00000000 */   nop
