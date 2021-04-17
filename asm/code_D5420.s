.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel litob_sub
/* D5420 800D4820 27BDFFF8 */  addiu      $sp, $sp, -8
/* D5424 800D4824 00E04021 */  addu       $t0, $a3, $zero
/* D5428 800D4828 00C04821 */  addu       $t1, $a2, $zero
/* D542C 800D482C 00A05821 */  addu       $t3, $a1, $zero
/* D5430 800D4830 00805021 */  addu       $t2, $a0, $zero
/* D5434 800D4834 152000AD */  bnez       $t1, .L800D4AEC
/* D5438 800D4838 03A0C821 */   addu      $t9, $sp, $zero
/* D543C 800D483C 0148102B */  sltu       $v0, $t2, $t0
/* D5440 800D4840 1040001E */  beqz       $v0, .L800D48BC
/* D5444 800D4844 3402FFFF */   ori       $v0, $zero, 0xffff
/* D5448 800D4848 0048102B */  sltu       $v0, $v0, $t0
/* D544C 800D484C 14400005 */  bnez       $v0, .L800D4864
/* D5450 800D4850 00E01821 */   addu      $v1, $a3, $zero
/* D5454 800D4854 2D020100 */  sltiu      $v0, $t0, 0x100
/* D5458 800D4858 38420001 */  xori       $v0, $v0, 1
/* D545C 800D485C 0803521F */  j          .L800D487C
/* D5460 800D4860 000220C0 */   sll       $a0, $v0, 3
.L800D4864:
/* D5464 800D4864 3C0200FF */  lui        $v0, 0xff
/* D5468 800D4868 3442FFFF */  ori        $v0, $v0, 0xffff
/* D546C 800D486C 0048102B */  sltu       $v0, $v0, $t0
/* D5470 800D4870 14400002 */  bnez       $v0, .L800D487C
/* D5474 800D4874 24040018 */   addiu     $a0, $zero, 0x18
/* D5478 800D4878 24040010 */  addiu      $a0, $zero, 0x10
.L800D487C:
/* D547C 800D487C 3C02800E */  lui        $v0, %hi(litob_sub_array)
/* D5480 800D4880 24424CC0 */  addiu      $v0, $v0, %lo(litob_sub_array)
/* D5484 800D4884 00831806 */  srlv       $v1, $v1, $a0
/* D5488 800D4888 00621821 */  addu       $v1, $v1, $v0
/* D548C 800D488C 90620000 */  lbu        $v0, ($v1)
/* D5490 800D4890 00441021 */  addu       $v0, $v0, $a0
/* D5494 800D4894 24040020 */  addiu      $a0, $zero, 0x20
/* D5498 800D4898 00826823 */  subu       $t5, $a0, $v0
/* D549C 800D489C 11A0005F */  beqz       $t5, .L800D4A1C
/* D54A0 800D48A0 01AA1804 */   sllv      $v1, $t2, $t5
/* D54A4 800D48A4 01A84004 */  sllv       $t0, $t0, $t5
/* D54A8 800D48A8 008D1023 */  subu       $v0, $a0, $t5
/* D54AC 800D48AC 004B1006 */  srlv       $v0, $t3, $v0
/* D54B0 800D48B0 00625025 */  or         $t2, $v1, $v0
/* D54B4 800D48B4 08035287 */  j          .L800D4A1C
/* D54B8 800D48B8 01AB5804 */   sllv      $t3, $t3, $t5
.L800D48BC:
/* D54BC 800D48BC 15000009 */  bnez       $t0, .L800D48E4
/* D54C0 800D48C0 0048102B */   sltu      $v0, $v0, $t0
/* D54C4 800D48C4 24020001 */  addiu      $v0, $zero, 1
/* D54C8 800D48C8 0049001B */  divu       $zero, $v0, $t1
/* D54CC 800D48CC 15200002 */  bnez       $t1, .L800D48D8
/* D54D0 800D48D0 00000000 */   nop
/* D54D4 800D48D4 0007000D */  break      7
.L800D48D8:
/* D54D8 800D48D8 00004012 */   mflo      $t0
/* D54DC 800D48DC 3402FFFF */  ori        $v0, $zero, 0xffff
/* D54E0 800D48E0 0048102B */  sltu       $v0, $v0, $t0
.L800D48E4:
/* D54E4 800D48E4 14400005 */  bnez       $v0, .L800D48FC
/* D54E8 800D48E8 01001821 */   addu      $v1, $t0, $zero
/* D54EC 800D48EC 2D020100 */  sltiu      $v0, $t0, 0x100
/* D54F0 800D48F0 38420001 */  xori       $v0, $v0, 1
/* D54F4 800D48F4 08035245 */  j          .L800D4914
/* D54F8 800D48F8 000220C0 */   sll       $a0, $v0, 3
.L800D48FC:
/* D54FC 800D48FC 3C0200FF */  lui        $v0, 0xff
/* D5500 800D4900 3442FFFF */  ori        $v0, $v0, 0xffff
/* D5504 800D4904 0048102B */  sltu       $v0, $v0, $t0
/* D5508 800D4908 14400002 */  bnez       $v0, .L800D4914
/* D550C 800D490C 24040018 */   addiu     $a0, $zero, 0x18
/* D5510 800D4910 24040010 */  addiu      $a0, $zero, 0x10
.L800D4914:
/* D5514 800D4914 3C02800E */  lui        $v0, %hi(litob_sub_array)
/* D5518 800D4918 24424CC0 */  addiu      $v0, $v0, %lo(litob_sub_array)
/* D551C 800D491C 00831806 */  srlv       $v1, $v1, $a0
/* D5520 800D4920 00621821 */  addu       $v1, $v1, $v0
/* D5524 800D4924 90620000 */  lbu        $v0, ($v1)
/* D5528 800D4928 24030020 */  addiu      $v1, $zero, 0x20
/* D552C 800D492C 00441021 */  addu       $v0, $v0, $a0
/* D5530 800D4930 00626823 */  subu       $t5, $v1, $v0
/* D5534 800D4934 15A00003 */  bnez       $t5, .L800D4944
/* D5538 800D4938 006DC023 */   subu      $t8, $v1, $t5
/* D553C 800D493C 08035287 */  j          .L800D4A1C
/* D5540 800D4940 01485023 */   subu      $t2, $t2, $t0
.L800D4944:
/* D5544 800D4944 01A84004 */  sllv       $t0, $t0, $t5
/* D5548 800D4948 030A2006 */  srlv       $a0, $t2, $t8
/* D554C 800D494C 01AA1804 */  sllv       $v1, $t2, $t5
/* D5550 800D4950 030B1006 */  srlv       $v0, $t3, $t8
/* D5554 800D4954 00625025 */  or         $t2, $v1, $v0
/* D5558 800D4958 00082C02 */  srl        $a1, $t0, 0x10
/* D555C 800D495C 0085001B */  divu       $zero, $a0, $a1
/* D5560 800D4960 14A00002 */  bnez       $a1, .L800D496C
/* D5564 800D4964 00000000 */   nop
/* D5568 800D4968 0007000D */  break      7
.L800D496C:
/* D556C 800D496C 00001012 */   mflo      $v0
/* D5570 800D4970 00001810 */  mfhi       $v1
/* D5574 800D4974 3106FFFF */  andi       $a2, $t0, 0xffff
/* D5578 800D4978 00000000 */  nop
/* D557C 800D497C 00460018 */  mult       $v0, $a2
/* D5580 800D4980 00031C00 */  sll        $v1, $v1, 0x10
/* D5584 800D4984 000A1402 */  srl        $v0, $t2, 0x10
/* D5588 800D4988 00621825 */  or         $v1, $v1, $v0
/* D558C 800D498C 00002012 */  mflo       $a0
/* D5590 800D4990 0064102B */  sltu       $v0, $v1, $a0
/* D5594 800D4994 10400008 */  beqz       $v0, .L800D49B8
/* D5598 800D4998 01AB5804 */   sllv      $t3, $t3, $t5
/* D559C 800D499C 00681821 */  addu       $v1, $v1, $t0
/* D55A0 800D49A0 0068102B */  sltu       $v0, $v1, $t0
/* D55A4 800D49A4 54400005 */  bnel       $v0, $zero, .L800D49BC
/* D55A8 800D49A8 00641823 */   subu      $v1, $v1, $a0
/* D55AC 800D49AC 0064102B */  sltu       $v0, $v1, $a0
/* D55B0 800D49B0 54400001 */  bnel       $v0, $zero, .L800D49B8
/* D55B4 800D49B4 00681821 */   addu      $v1, $v1, $t0
.L800D49B8:
/* D55B8 800D49B8 00641823 */  subu       $v1, $v1, $a0
.L800D49BC:
/* D55BC 800D49BC 0065001B */  divu       $zero, $v1, $a1
/* D55C0 800D49C0 14A00002 */  bnez       $a1, .L800D49CC
/* D55C4 800D49C4 00000000 */   nop
/* D55C8 800D49C8 0007000D */  break      7
.L800D49CC:
/* D55CC 800D49CC 00001012 */   mflo      $v0
/* D55D0 800D49D0 00001810 */  mfhi       $v1
/* D55D4 800D49D4 00000000 */  nop
/* D55D8 800D49D8 00000000 */  nop
/* D55DC 800D49DC 00460018 */  mult       $v0, $a2
/* D55E0 800D49E0 00031C00 */  sll        $v1, $v1, 0x10
/* D55E4 800D49E4 3142FFFF */  andi       $v0, $t2, 0xffff
/* D55E8 800D49E8 00621825 */  or         $v1, $v1, $v0
/* D55EC 800D49EC 00002012 */  mflo       $a0
/* D55F0 800D49F0 0064102B */  sltu       $v0, $v1, $a0
/* D55F4 800D49F4 50400009 */  beql       $v0, $zero, .L800D4A1C
/* D55F8 800D49F8 00645023 */   subu      $t2, $v1, $a0
/* D55FC 800D49FC 00681821 */  addu       $v1, $v1, $t0
/* D5600 800D4A00 0068102B */  sltu       $v0, $v1, $t0
/* D5604 800D4A04 14400005 */  bnez       $v0, .L800D4A1C
/* D5608 800D4A08 00645023 */   subu      $t2, $v1, $a0
/* D560C 800D4A0C 0064102B */  sltu       $v0, $v1, $a0
/* D5610 800D4A10 54400001 */  bnel       $v0, $zero, .L800D4A18
/* D5614 800D4A14 00681821 */   addu      $v1, $v1, $t0
.L800D4A18:
/* D5618 800D4A18 00645023 */  subu       $t2, $v1, $a0
.L800D4A1C:
/* D561C 800D4A1C 00082C02 */  srl        $a1, $t0, 0x10
/* D5620 800D4A20 0145001B */  divu       $zero, $t2, $a1
/* D5624 800D4A24 14A00002 */  bnez       $a1, .L800D4A30
/* D5628 800D4A28 00000000 */   nop
/* D562C 800D4A2C 0007000D */  break      7
.L800D4A30:
/* D5630 800D4A30 00001012 */   mflo      $v0
/* D5634 800D4A34 00001810 */  mfhi       $v1
/* D5638 800D4A38 3106FFFF */  andi       $a2, $t0, 0xffff
/* D563C 800D4A3C 00000000 */  nop
/* D5640 800D4A40 00460018 */  mult       $v0, $a2
/* D5644 800D4A44 00031C00 */  sll        $v1, $v1, 0x10
/* D5648 800D4A48 000B1402 */  srl        $v0, $t3, 0x10
/* D564C 800D4A4C 00621825 */  or         $v1, $v1, $v0
/* D5650 800D4A50 00002012 */  mflo       $a0
/* D5654 800D4A54 0064102B */  sltu       $v0, $v1, $a0
/* D5658 800D4A58 50400009 */  beql       $v0, $zero, .L800D4A80
/* D565C 800D4A5C 00641823 */   subu      $v1, $v1, $a0
/* D5660 800D4A60 00681821 */  addu       $v1, $v1, $t0
/* D5664 800D4A64 0068102B */  sltu       $v0, $v1, $t0
/* D5668 800D4A68 54400005 */  bnel       $v0, $zero, .L800D4A80
/* D566C 800D4A6C 00641823 */   subu      $v1, $v1, $a0
/* D5670 800D4A70 0064102B */  sltu       $v0, $v1, $a0
/* D5674 800D4A74 54400001 */  bnel       $v0, $zero, .L800D4A7C
/* D5678 800D4A78 00681821 */   addu      $v1, $v1, $t0
.L800D4A7C:
/* D567C 800D4A7C 00641823 */  subu       $v1, $v1, $a0
.L800D4A80:
/* D5680 800D4A80 0065001B */  divu       $zero, $v1, $a1
/* D5684 800D4A84 14A00002 */  bnez       $a1, .L800D4A90
/* D5688 800D4A88 00000000 */   nop
/* D568C 800D4A8C 0007000D */  break      7
.L800D4A90:
/* D5690 800D4A90 00001012 */   mflo      $v0
/* D5694 800D4A94 00001810 */  mfhi       $v1
/* D5698 800D4A98 00000000 */  nop
/* D569C 800D4A9C 00000000 */  nop
/* D56A0 800D4AA0 00460018 */  mult       $v0, $a2
/* D56A4 800D4AA4 00031C00 */  sll        $v1, $v1, 0x10
/* D56A8 800D4AA8 3162FFFF */  andi       $v0, $t3, 0xffff
/* D56AC 800D4AAC 00621825 */  or         $v1, $v1, $v0
/* D56B0 800D4AB0 00002012 */  mflo       $a0
/* D56B4 800D4AB4 0064102B */  sltu       $v0, $v1, $a0
/* D56B8 800D4AB8 10400007 */  beqz       $v0, .L800D4AD8
/* D56BC 800D4ABC 00000000 */   nop
/* D56C0 800D4AC0 00681821 */  addu       $v1, $v1, $t0
/* D56C4 800D4AC4 0068102B */  sltu       $v0, $v1, $t0
/* D56C8 800D4AC8 14400003 */  bnez       $v0, .L800D4AD8
/* D56CC 800D4ACC 0064102B */   sltu      $v0, $v1, $a0
/* D56D0 800D4AD0 54400001 */  bnel       $v0, $zero, .L800D4AD8
/* D56D4 800D4AD4 00681821 */   addu      $v1, $v1, $t0
.L800D4AD8:
/* D56D8 800D4AD8 1320008A */  beqz       $t9, .L800D4D04
/* D56DC 800D4ADC 00645823 */   subu      $t3, $v1, $a0
/* D56E0 800D4AE0 01AB7806 */  srlv       $t7, $t3, $t5
/* D56E4 800D4AE4 0803533F */  j          .L800D4CFC
/* D56E8 800D4AE8 00007021 */   addu      $t6, $zero, $zero
.L800D4AEC:
/* D56EC 800D4AEC 0149102B */  sltu       $v0, $t2, $t1
/* D56F0 800D4AF0 10400007 */  beqz       $v0, .L800D4B10
/* D56F4 800D4AF4 3402FFFF */   ori       $v0, $zero, 0xffff
/* D56F8 800D4AF8 00A07821 */  addu       $t7, $a1, $zero
/* D56FC 800D4AFC 01407021 */  addu       $t6, $t2, $zero
/* D5700 800D4B00 AFAE0000 */  sw         $t6, ($sp)
/* D5704 800D4B04 AFAF0004 */  sw         $t7, 4($sp)
/* D5708 800D4B08 08035341 */  j          .L800D4D04
/* D570C 800D4B0C 00000000 */   nop
.L800D4B10:
/* D5710 800D4B10 0049102B */  sltu       $v0, $v0, $t1
/* D5714 800D4B14 14400005 */  bnez       $v0, .L800D4B2C
/* D5718 800D4B18 01201821 */   addu      $v1, $t1, $zero
/* D571C 800D4B1C 2D220100 */  sltiu      $v0, $t1, 0x100
/* D5720 800D4B20 38420001 */  xori       $v0, $v0, 1
/* D5724 800D4B24 080352D1 */  j          .L800D4B44
/* D5728 800D4B28 000220C0 */   sll       $a0, $v0, 3
.L800D4B2C:
/* D572C 800D4B2C 3C0200FF */  lui        $v0, 0xff
/* D5730 800D4B30 3442FFFF */  ori        $v0, $v0, 0xffff
/* D5734 800D4B34 0049102B */  sltu       $v0, $v0, $t1
/* D5738 800D4B38 14400002 */  bnez       $v0, .L800D4B44
/* D573C 800D4B3C 24040018 */   addiu     $a0, $zero, 0x18
/* D5740 800D4B40 24040010 */  addiu      $a0, $zero, 0x10
.L800D4B44:
/* D5744 800D4B44 3C02800E */  lui        $v0, %hi(litob_sub_array)
/* D5748 800D4B48 24424CC0 */  addiu      $v0, $v0, %lo(litob_sub_array)
/* D574C 800D4B4C 00831806 */  srlv       $v1, $v1, $a0
/* D5750 800D4B50 00621821 */  addu       $v1, $v1, $v0
/* D5754 800D4B54 90620000 */  lbu        $v0, ($v1)
/* D5758 800D4B58 24030020 */  addiu      $v1, $zero, 0x20
/* D575C 800D4B5C 00441021 */  addu       $v0, $v0, $a0
/* D5760 800D4B60 00626823 */  subu       $t5, $v1, $v0
/* D5764 800D4B64 15A0000F */  bnez       $t5, .L800D4BA4
/* D5768 800D4B68 006DC023 */   subu      $t8, $v1, $t5
/* D576C 800D4B6C 012A102B */  sltu       $v0, $t1, $t2
/* D5770 800D4B70 14400004 */  bnez       $v0, .L800D4B84
/* D5774 800D4B74 01682023 */   subu      $a0, $t3, $t0
/* D5778 800D4B78 0168102B */  sltu       $v0, $t3, $t0
/* D577C 800D4B7C 14400005 */  bnez       $v0, .L800D4B94
/* D5780 800D4B80 00000000 */   nop
.L800D4B84:
/* D5784 800D4B84 01491823 */  subu       $v1, $t2, $t1
/* D5788 800D4B88 0164102B */  sltu       $v0, $t3, $a0
/* D578C 800D4B8C 00625023 */  subu       $t2, $v1, $v0
/* D5790 800D4B90 00805821 */  addu       $t3, $a0, $zero
.L800D4B94:
/* D5794 800D4B94 1320005B */  beqz       $t9, .L800D4D04
/* D5798 800D4B98 01607821 */   addu      $t7, $t3, $zero
/* D579C 800D4B9C 0803533F */  j          .L800D4CFC
/* D57A0 800D4BA0 01407021 */   addu      $t6, $t2, $zero
.L800D4BA4:
/* D57A4 800D4BA4 01A91804 */  sllv       $v1, $t1, $t5
/* D57A8 800D4BA8 03081006 */  srlv       $v0, $t0, $t8
/* D57AC 800D4BAC 00624825 */  or         $t1, $v1, $v0
/* D57B0 800D4BB0 01A84004 */  sllv       $t0, $t0, $t5
/* D57B4 800D4BB4 030A2006 */  srlv       $a0, $t2, $t8
/* D57B8 800D4BB8 01AA1804 */  sllv       $v1, $t2, $t5
/* D57BC 800D4BBC 030B1006 */  srlv       $v0, $t3, $t8
/* D57C0 800D4BC0 00625025 */  or         $t2, $v1, $v0
/* D57C4 800D4BC4 00093402 */  srl        $a2, $t1, 0x10
/* D57C8 800D4BC8 0086001B */  divu       $zero, $a0, $a2
/* D57CC 800D4BCC 14C00002 */  bnez       $a2, .L800D4BD8
/* D57D0 800D4BD0 00000000 */   nop
/* D57D4 800D4BD4 0007000D */  break      7
.L800D4BD8:
/* D57D8 800D4BD8 00003812 */   mflo      $a3
/* D57DC 800D4BDC 00001810 */  mfhi       $v1
/* D57E0 800D4BE0 312CFFFF */  andi       $t4, $t1, 0xffff
/* D57E4 800D4BE4 00000000 */  nop
/* D57E8 800D4BE8 00EC0018 */  mult       $a3, $t4
/* D57EC 800D4BEC 000A1402 */  srl        $v0, $t2, 0x10
/* D57F0 800D4BF0 00031C00 */  sll        $v1, $v1, 0x10
/* D57F4 800D4BF4 00621825 */  or         $v1, $v1, $v0
/* D57F8 800D4BF8 00002812 */  mflo       $a1
/* D57FC 800D4BFC 0065102B */  sltu       $v0, $v1, $a1
/* D5800 800D4C00 1040000A */  beqz       $v0, .L800D4C2C
/* D5804 800D4C04 01AB5804 */   sllv      $t3, $t3, $t5
/* D5808 800D4C08 00691821 */  addu       $v1, $v1, $t1
/* D580C 800D4C0C 0069102B */  sltu       $v0, $v1, $t1
/* D5810 800D4C10 14400006 */  bnez       $v0, .L800D4C2C
/* D5814 800D4C14 24E7FFFF */   addiu     $a3, $a3, -1
/* D5818 800D4C18 0065102B */  sltu       $v0, $v1, $a1
/* D581C 800D4C1C 50400004 */  beql       $v0, $zero, .L800D4C30
/* D5820 800D4C20 00651823 */   subu      $v1, $v1, $a1
/* D5824 800D4C24 24E7FFFF */  addiu      $a3, $a3, -1
/* D5828 800D4C28 00691821 */  addu       $v1, $v1, $t1
.L800D4C2C:
/* D582C 800D4C2C 00651823 */  subu       $v1, $v1, $a1
.L800D4C30:
/* D5830 800D4C30 0066001B */  divu       $zero, $v1, $a2
/* D5834 800D4C34 14C00002 */  bnez       $a2, .L800D4C40
/* D5838 800D4C38 00000000 */   nop
/* D583C 800D4C3C 0007000D */  break      7
.L800D4C40:
/* D5840 800D4C40 00002012 */   mflo      $a0
/* D5844 800D4C44 00001810 */  mfhi       $v1
/* D5848 800D4C48 00000000 */  nop
/* D584C 800D4C4C 00000000 */  nop
/* D5850 800D4C50 008C0018 */  mult       $a0, $t4
/* D5854 800D4C54 3142FFFF */  andi       $v0, $t2, 0xffff
/* D5858 800D4C58 00031C00 */  sll        $v1, $v1, 0x10
/* D585C 800D4C5C 00621825 */  or         $v1, $v1, $v0
/* D5860 800D4C60 00002812 */  mflo       $a1
/* D5864 800D4C64 0065102B */  sltu       $v0, $v1, $a1
/* D5868 800D4C68 5040000B */  beql       $v0, $zero, .L800D4C98
/* D586C 800D4C6C 00655023 */   subu      $t2, $v1, $a1
/* D5870 800D4C70 00691821 */  addu       $v1, $v1, $t1
/* D5874 800D4C74 0069102B */  sltu       $v0, $v1, $t1
/* D5878 800D4C78 14400006 */  bnez       $v0, .L800D4C94
/* D587C 800D4C7C 2484FFFF */   addiu     $a0, $a0, -1
/* D5880 800D4C80 0065102B */  sltu       $v0, $v1, $a1
/* D5884 800D4C84 10400004 */  beqz       $v0, .L800D4C98
/* D5888 800D4C88 00655023 */   subu      $t2, $v1, $a1
/* D588C 800D4C8C 2484FFFF */  addiu      $a0, $a0, -1
/* D5890 800D4C90 00691821 */  addu       $v1, $v1, $t1
.L800D4C94:
/* D5894 800D4C94 00655023 */  subu       $t2, $v1, $a1
.L800D4C98:
/* D5898 800D4C98 00071400 */  sll        $v0, $a3, 0x10
/* D589C 800D4C9C 00441025 */  or         $v0, $v0, $a0
/* D58A0 800D4CA0 00480019 */  multu      $v0, $t0
/* D58A4 800D4CA4 00003010 */  mfhi       $a2
/* D58A8 800D4CA8 0146102B */  sltu       $v0, $t2, $a2
/* D58AC 800D4CAC 00002812 */  mflo       $a1
/* D58B0 800D4CB0 54400005 */  bnel       $v0, $zero, .L800D4CC8
/* D58B4 800D4CB4 00A82023 */   subu      $a0, $a1, $t0
/* D58B8 800D4CB8 14CA0007 */  bne        $a2, $t2, .L800D4CD8
/* D58BC 800D4CBC 0165102B */   sltu      $v0, $t3, $a1
/* D58C0 800D4CC0 10400005 */  beqz       $v0, .L800D4CD8
/* D58C4 800D4CC4 00A82023 */   subu      $a0, $a1, $t0
.L800D4CC8:
/* D58C8 800D4CC8 00C91823 */  subu       $v1, $a2, $t1
/* D58CC 800D4CCC 00A4102B */  sltu       $v0, $a1, $a0
/* D58D0 800D4CD0 00623023 */  subu       $a2, $v1, $v0
/* D58D4 800D4CD4 00802821 */  addu       $a1, $a0, $zero
.L800D4CD8:
/* D58D8 800D4CD8 1320000A */  beqz       $t9, .L800D4D04
/* D58DC 800D4CDC 01651823 */   subu      $v1, $t3, $a1
/* D58E0 800D4CE0 01462023 */  subu       $a0, $t2, $a2
/* D58E4 800D4CE4 0163102B */  sltu       $v0, $t3, $v1
/* D58E8 800D4CE8 00825023 */  subu       $t2, $a0, $v0
/* D58EC 800D4CEC 030A1004 */  sllv       $v0, $t2, $t8
/* D58F0 800D4CF0 01A31806 */  srlv       $v1, $v1, $t5
/* D58F4 800D4CF4 00437825 */  or         $t7, $v0, $v1
/* D58F8 800D4CF8 01AA7006 */  srlv       $t6, $t2, $t5
.L800D4CFC:
/* D58FC 800D4CFC AF2E0000 */  sw         $t6, ($t9)
/* D5900 800D4D00 AF2F0004 */  sw         $t7, 4($t9)
.L800D4D04:
/* D5904 800D4D04 8FA20000 */  lw         $v0, ($sp)
/* D5908 800D4D08 8FA30004 */  lw         $v1, 4($sp)
/* D590C 800D4D0C 03E00008 */  jr         $ra
/* D5910 800D4D10 27BD0008 */   addiu     $sp, $sp, 8
/* D5914 800D4D14 00000000 */  nop
/* D5918 800D4D18 00000000 */  nop
/* D591C 800D4D1C 00000000 */  nop
