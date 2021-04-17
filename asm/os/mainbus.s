.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alMainBusPull
/* D12A0 800D06A0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* D12A4 800D06A4 AFBE0048 */  sw         $fp, 0x48($sp)
/* D12A8 800D06A8 00A0F021 */  addu       $fp, $a1, $zero
/* D12AC 800D06AC AFB40038 */  sw         $s4, 0x38($sp)
/* D12B0 800D06B0 00C0A021 */  addu       $s4, $a2, $zero
/* D12B4 800D06B4 8FA60060 */  lw         $a2, 0x60($sp)
/* D12B8 800D06B8 3C030200 */  lui        $v1, 0x200
/* D12BC 800D06BC 34630440 */  ori        $v1, $v1, 0x440
/* D12C0 800D06C0 3C050200 */  lui        $a1, 0x200
/* D12C4 800D06C4 34A50580 */  ori        $a1, $a1, 0x580
/* D12C8 800D06C8 AFB30034 */  sw         $s3, 0x34($sp)
/* D12CC 800D06CC 00809821 */  addu       $s3, $a0, $zero
/* D12D0 800D06D0 AFBF004C */  sw         $ra, 0x4c($sp)
/* D12D4 800D06D4 AFB70044 */  sw         $s7, 0x44($sp)
/* D12D8 800D06D8 AFB60040 */  sw         $s6, 0x40($sp)
/* D12DC 800D06DC AFB5003C */  sw         $s5, 0x3c($sp)
/* D12E0 800D06E0 AFB20030 */  sw         $s2, 0x30($sp)
/* D12E4 800D06E4 AFB1002C */  sw         $s1, 0x2c($sp)
/* D12E8 800D06E8 AFB00028 */  sw         $s0, 0x28($sp)
/* D12EC 800D06EC AFA7001C */  sw         $a3, 0x1c($sp)
/* D12F0 800D06F0 8E64001C */  lw         $a0, 0x1c($s3)
/* D12F4 800D06F4 00C01021 */  addu       $v0, $a2, $zero
/* D12F8 800D06F8 24C60008 */  addiu      $a2, $a2, 8
/* D12FC 800D06FC AC430000 */  sw         $v1, ($v0)
/* D1300 800D0700 00141840 */  sll        $v1, $s4, 1
/* D1304 800D0704 AC430004 */  sw         $v1, 4($v0)
/* D1308 800D0708 00C01021 */  addu       $v0, $a2, $zero
/* D130C 800D070C AC450000 */  sw         $a1, ($v0)
/* D1310 800D0710 AC430004 */  sw         $v1, 4($v0)
/* D1314 800D0714 8E620014 */  lw         $v0, 0x14($s3)
/* D1318 800D0718 00008821 */  addu       $s1, $zero, $zero
/* D131C 800D071C 18400023 */  blez       $v0, .L800D07AC
/* D1320 800D0720 24C60008 */   addiu     $a2, $a2, 8
/* D1324 800D0724 3077FFFF */  andi       $s7, $v1, 0xffff
/* D1328 800D0728 3C120C00 */  lui        $s2, 0xc00
/* D132C 800D072C 36527FFF */  ori        $s2, $s2, 0x7fff
/* D1330 800D0730 3C1606C0 */  lui        $s6, 0x6c0
/* D1334 800D0734 36D60440 */  ori        $s6, $s6, 0x440
/* D1338 800D0738 3C150800 */  lui        $s5, 0x800
/* D133C 800D073C 36B50580 */  ori        $s5, $s5, 0x580
/* D1340 800D0740 00808021 */  addu       $s0, $a0, $zero
.L800D0744:
/* D1344 800D0744 8E020000 */  lw         $v0, ($s0)
/* D1348 800D0748 AFA60010 */  sw         $a2, 0x10($sp)
/* D134C 800D074C 8E040000 */  lw         $a0, ($s0)
/* D1350 800D0750 26100004 */  addiu      $s0, $s0, 4
/* D1354 800D0754 8FA7001C */  lw         $a3, 0x1c($sp)
/* D1358 800D0758 8C420004 */  lw         $v0, 4($v0)
/* D135C 800D075C 03C02821 */  addu       $a1, $fp, $zero
/* D1360 800D0760 0040F809 */  jalr       $v0
/* D1364 800D0764 02803021 */   addu      $a2, $s4, $zero
/* D1368 800D0768 00403021 */  addu       $a2, $v0, $zero
/* D136C 800D076C 24C60008 */  addiu      $a2, $a2, 8
/* D1370 800D0770 00C01821 */  addu       $v1, $a2, $zero
/* D1374 800D0774 24C60008 */  addiu      $a2, $a2, 8
/* D1378 800D0778 3C080800 */  lui        $t0, 0x800
/* D137C 800D077C AC480000 */  sw         $t0, ($v0)
/* D1380 800D0780 AC570004 */  sw         $s7, 4($v0)
/* D1384 800D0784 00C01021 */  addu       $v0, $a2, $zero
/* D1388 800D0788 AC720000 */  sw         $s2, ($v1)
/* D138C 800D078C AC760004 */  sw         $s6, 4($v1)
/* D1390 800D0790 AC520000 */  sw         $s2, ($v0)
/* D1394 800D0794 AC550004 */  sw         $s5, 4($v0)
/* D1398 800D0798 8E620014 */  lw         $v0, 0x14($s3)
/* D139C 800D079C 26310001 */  addiu      $s1, $s1, 1
/* D13A0 800D07A0 0222102A */  slt        $v0, $s1, $v0
/* D13A4 800D07A4 1440FFE7 */  bnez       $v0, .L800D0744
/* D13A8 800D07A8 24C60008 */   addiu     $a2, $a2, 8
.L800D07AC:
/* D13AC 800D07AC 00C01021 */  addu       $v0, $a2, $zero
/* D13B0 800D07B0 8FBF004C */  lw         $ra, 0x4c($sp)
/* D13B4 800D07B4 8FBE0048 */  lw         $fp, 0x48($sp)
/* D13B8 800D07B8 8FB70044 */  lw         $s7, 0x44($sp)
/* D13BC 800D07BC 8FB60040 */  lw         $s6, 0x40($sp)
/* D13C0 800D07C0 8FB5003C */  lw         $s5, 0x3c($sp)
/* D13C4 800D07C4 8FB40038 */  lw         $s4, 0x38($sp)
/* D13C8 800D07C8 8FB30034 */  lw         $s3, 0x34($sp)
/* D13CC 800D07CC 8FB20030 */  lw         $s2, 0x30($sp)
/* D13D0 800D07D0 8FB1002C */  lw         $s1, 0x2c($sp)
/* D13D4 800D07D4 8FB00028 */  lw         $s0, 0x28($sp)
/* D13D8 800D07D8 03E00008 */  jr         $ra
/* D13DC 800D07DC 27BD0050 */   addiu     $sp, $sp, 0x50

glabel alMainBusParam
/* D13E0 800D07E0 8C87001C */  lw         $a3, 0x1c($a0)
/* D13E4 800D07E4 24020002 */  addiu      $v0, $zero, 2
/* D13E8 800D07E8 14A20007 */  bne        $a1, $v0, .L800D0808
/* D13EC 800D07EC 00000000 */   nop
/* D13F0 800D07F0 8C820014 */  lw         $v0, 0x14($a0)
/* D13F4 800D07F4 24430001 */  addiu      $v1, $v0, 1
/* D13F8 800D07F8 00021080 */  sll        $v0, $v0, 2
/* D13FC 800D07FC 00471021 */  addu       $v0, $v0, $a3
/* D1400 800D0800 AC830014 */  sw         $v1, 0x14($a0)
/* D1404 800D0804 AC460000 */  sw         $a2, ($v0)
.L800D0808:
/* D1408 800D0808 03E00008 */  jr         $ra
/* D140C 800D080C 00001021 */   addu      $v0, $zero, $zero

glabel alResamplePull
/* D1410 800D0810 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* D1414 800D0814 AFB10024 */  sw         $s1, 0x24($sp)
/* D1418 800D0818 8FB10050 */  lw         $s1, 0x50($sp)
/* D141C 800D081C AFB20028 */  sw         $s2, 0x28($sp)
/* D1420 800D0820 00809021 */  addu       $s2, $a0, $zero
/* D1424 800D0824 AFB3002C */  sw         $s3, 0x2c($sp)
/* D1428 800D0828 AFB00020 */  sw         $s0, 0x20($sp)
/* D142C 800D082C 00C08021 */  addu       $s0, $a2, $zero
/* D1430 800D0830 24020140 */  addiu      $v0, $zero, 0x140
/* D1434 800D0834 AFBF0030 */  sw         $ra, 0x30($sp)
/* D1438 800D0838 F7B40038 */  sdc1       $f20, 0x38($sp)
/* D143C 800D083C A7A20018 */  sh         $v0, 0x18($sp)
/* D1440 800D0840 8E440000 */  lw         $a0, ($s2)
/* D1444 800D0844 12000064 */  beqz       $s0, .L800D09D8
/* D1448 800D0848 00A09821 */   addu      $s3, $a1, $zero
/* D144C 800D084C 8E42001C */  lw         $v0, 0x1c($s2)
/* D1450 800D0850 10400016 */  beqz       $v0, .L800D08AC
/* D1454 800D0854 27A50018 */   addiu     $a1, $sp, 0x18
/* D1458 800D0858 AFB10010 */  sw         $s1, 0x10($sp)
/* D145C 800D085C 8C820004 */  lw         $v0, 4($a0)
/* D1460 800D0860 0040F809 */  jalr       $v0
/* D1464 800D0864 02003021 */   addu      $a2, $s0, $zero
/* D1468 800D0868 00408821 */  addu       $s1, $v0, $zero
/* D146C 800D086C 3C0300FF */  lui        $v1, 0xff
/* D1470 800D0870 87A20018 */  lh         $v0, 0x18($sp)
/* D1474 800D0874 3463FFFF */  ori        $v1, $v1, 0xffff
/* D1478 800D0878 02202021 */  addu       $a0, $s1, $zero
/* D147C 800D087C 26310008 */  addiu      $s1, $s1, 8
/* D1480 800D0880 00431024 */  and        $v0, $v0, $v1
/* D1484 800D0884 3C030A00 */  lui        $v1, 0xa00
/* D1488 800D0888 00431025 */  or         $v0, $v0, $v1
/* D148C 800D088C AC820000 */  sw         $v0, ($a0)
/* D1490 800D0890 96630000 */  lhu        $v1, ($s3)
/* D1494 800D0894 00101040 */  sll        $v0, $s0, 1
/* D1498 800D0898 3042FFFF */  andi       $v0, $v0, 0xffff
/* D149C 800D089C 00031C00 */  sll        $v1, $v1, 0x10
/* D14A0 800D08A0 00621825 */  or         $v1, $v1, $v0
/* D14A4 800D08A4 08034276 */  j          .L800D09D8
/* D14A8 800D08A8 AC830004 */   sw        $v1, 4($a0)
.L800D08AC:
/* D14AC 800D08AC C6400018 */  lwc1       $f0, 0x18($s2)
/* D14B0 800D08B0 3C01800E */  lui        $at, %hi(resample_rodata_0000)
/* D14B4 800D08B4 D4225730 */  ldc1       $f2, %lo(resample_rodata_0000)($at)
/* D14B8 800D08B8 46000021 */  cvt.d.s    $f0, $f0
/* D14BC 800D08BC 4620103C */  c.lt.d     $f2, $f0
/* D14C0 800D08C0 00000000 */  nop
/* D14C4 800D08C4 45000006 */  bc1f       .L800D08E0
/* D14C8 800D08C8 00000000 */   nop
/* D14CC 800D08CC 3C013FFF */  lui        $at, 0x3fff
/* D14D0 800D08D0 3421FEB0 */  ori        $at, $at, 0xfeb0
/* D14D4 800D08D4 44810000 */  mtc1       $at, $f0
/* D14D8 800D08D8 00000000 */  nop
/* D14DC 800D08DC E6400018 */  swc1       $f0, 0x18($s2)
.L800D08E0:
/* D14E0 800D08E0 C6400018 */  lwc1       $f0, 0x18($s2)
/* D14E4 800D08E4 3C014700 */  lui        $at, 0x4700
/* D14E8 800D08E8 4481A000 */  mtc1       $at, $f20
/* D14EC 800D08EC 00000000 */  nop
/* D14F0 800D08F0 46140002 */  mul.s      $f0, $f0, $f20
/* D14F4 800D08F4 4600008D */  trunc.w.s  $f2, $f0
/* D14F8 800D08F8 44021000 */  mfc1       $v0, $f2
/* D14FC 800D08FC 00000000 */  nop
/* D1500 800D0900 44822000 */  mtc1       $v0, $f4
/* D1504 800D0904 00000000 */  nop
/* D1508 800D0908 46802120 */  cvt.s.w    $f4, $f4
/* D150C 800D090C 46142103 */  div.s      $f4, $f4, $f20
/* D1510 800D0910 44900000 */  mtc1       $s0, $f0
/* D1514 800D0914 00000000 */  nop
/* D1518 800D0918 46800020 */  cvt.s.w    $f0, $f0
/* D151C 800D091C 46002002 */  mul.s      $f0, $f4, $f0
/* D1520 800D0920 C6420020 */  lwc1       $f2, 0x20($s2)
/* D1524 800D0924 46001080 */  add.s      $f2, $f2, $f0
/* D1528 800D0928 4600100D */  trunc.w.s  $f0, $f2
/* D152C 800D092C 44060000 */  mfc1       $a2, $f0
/* D1530 800D0930 00000000 */  nop
/* D1534 800D0934 44860000 */  mtc1       $a2, $f0
/* D1538 800D0938 00000000 */  nop
/* D153C 800D093C 46800020 */  cvt.s.w    $f0, $f0
/* D1540 800D0940 46001081 */  sub.s      $f2, $f2, $f0
/* D1544 800D0944 E6440018 */  swc1       $f4, 0x18($s2)
/* D1548 800D0948 E6420020 */  swc1       $f2, 0x20($s2)
/* D154C 800D094C AFB10010 */  sw         $s1, 0x10($sp)
/* D1550 800D0950 8C820004 */  lw         $v0, 4($a0)
/* D1554 800D0954 0040F809 */  jalr       $v0
/* D1558 800D0958 27A50018 */   addiu     $a1, $sp, 0x18
/* D155C 800D095C 00408821 */  addu       $s1, $v0, $zero
/* D1560 800D0960 C6400018 */  lwc1       $f0, 0x18($s2)
/* D1564 800D0964 97A20018 */  lhu        $v0, 0x18($sp)
/* D1568 800D0968 02202021 */  addu       $a0, $s1, $zero
/* D156C 800D096C 3C030800 */  lui        $v1, 0x800
/* D1570 800D0970 00431025 */  or         $v0, $v0, $v1
/* D1574 800D0974 AC820000 */  sw         $v0, ($a0)
/* D1578 800D0978 96630000 */  lhu        $v1, ($s3)
/* D157C 800D097C 00101040 */  sll        $v0, $s0, 1
/* D1580 800D0980 3042FFFF */  andi       $v0, $v0, 0xffff
/* D1584 800D0984 46140002 */  mul.s      $f0, $f0, $f20
/* D1588 800D0988 00031C00 */  sll        $v1, $v1, 0x10
/* D158C 800D098C 00621825 */  or         $v1, $v1, $v0
/* D1590 800D0990 AC830004 */  sw         $v1, 4($a0)
/* D1594 800D0994 92440027 */  lbu        $a0, 0x27($s2)
/* D1598 800D0998 26310008 */  addiu      $s1, $s1, 8
/* D159C 800D099C 02208021 */  addu       $s0, $s1, $zero
/* D15A0 800D09A0 00042400 */  sll        $a0, $a0, 0x10
/* D15A4 800D09A4 4600008D */  trunc.w.s  $f2, $f0
/* D15A8 800D09A8 44021000 */  mfc1       $v0, $f2
/* D15AC 800D09AC 00000000 */  nop
/* D15B0 800D09B0 3042FFFF */  andi       $v0, $v0, 0xffff
/* D15B4 800D09B4 3C030500 */  lui        $v1, 0x500
/* D15B8 800D09B8 00431025 */  or         $v0, $v0, $v1
/* D15BC 800D09BC 00822025 */  or         $a0, $a0, $v0
/* D15C0 800D09C0 AE040000 */  sw         $a0, ($s0)
/* D15C4 800D09C4 8E440014 */  lw         $a0, 0x14($s2)
/* D15C8 800D09C8 0C034888 */  jal        osVirtualToPhysical
/* D15CC 800D09CC 26310008 */   addiu     $s1, $s1, 8
/* D15D0 800D09D0 AE020004 */  sw         $v0, 4($s0)
/* D15D4 800D09D4 AE400024 */  sw         $zero, 0x24($s2)
.L800D09D8:
/* D15D8 800D09D8 02201021 */  addu       $v0, $s1, $zero
/* D15DC 800D09DC 8FBF0030 */  lw         $ra, 0x30($sp)
/* D15E0 800D09E0 8FB3002C */  lw         $s3, 0x2c($sp)
/* D15E4 800D09E4 8FB20028 */  lw         $s2, 0x28($sp)
/* D15E8 800D09E8 8FB10024 */  lw         $s1, 0x24($sp)
/* D15EC 800D09EC 8FB00020 */  lw         $s0, 0x20($sp)
/* D15F0 800D09F0 D7B40038 */  ldc1       $f20, 0x38($sp)
/* D15F4 800D09F4 03E00008 */  jr         $ra
/* D15F8 800D09F8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel alResampleParam
/* D15FC 800D09FC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D1600 800D0A00 AFBF0010 */  sw         $ra, 0x10($sp)
/* D1604 800D0A04 24A7FFFF */  addiu      $a3, $a1, -1
/* D1608 800D0A08 2CE20009 */  sltiu      $v0, $a3, 9
/* D160C 800D0A0C 10400021 */  beqz       $v0, .L800D0A94
/* D1610 800D0A10 00801821 */   addu      $v1, $a0, $zero
/* D1614 800D0A14 00071080 */  sll        $v0, $a3, 2
/* D1618 800D0A18 3C01800E */  lui        $at, %hi(jtbl_800E5738)
/* D161C 800D0A1C 00220821 */  addu       $at, $at, $v0
/* D1620 800D0A20 8C225738 */  lw         $v0, %lo(jtbl_800E5738)($at)
/* D1624 800D0A24 00400008 */  jr         $v0
/* D1628 800D0A28 00000000 */   nop
glabel L800D0A2C_D162C
/* D162C 800D0A2C 080342AB */  j          .L800D0AAC
/* D1630 800D0A30 AC860000 */   sw        $a2, ($a0)
glabel L800D0A34_D1634
/* D1634 800D0A34 24020001 */  addiu      $v0, $zero, 1
/* D1638 800D0A38 AC600020 */  sw         $zero, 0x20($v1)
/* D163C 800D0A3C AC620024 */  sw         $v0, 0x24($v1)
/* D1640 800D0A40 AC600030 */  sw         $zero, 0x30($v1)
/* D1644 800D0A44 AC60001C */  sw         $zero, 0x1c($v1)
/* D1648 800D0A48 8C840000 */  lw         $a0, ($a0)
/* D164C 800D0A4C 10800017 */  beqz       $a0, .L800D0AAC
/* D1650 800D0A50 24050004 */   addiu     $a1, $zero, 4
/* D1654 800D0A54 8C820008 */  lw         $v0, 8($a0)
/* D1658 800D0A58 080342A9 */  j          .L800D0AA4
/* D165C 800D0A5C 00003021 */   addu      $a2, $zero, $zero
glabel L800D0A60_D1660
/* D1660 800D0A60 24020001 */  addiu      $v0, $zero, 1
/* D1664 800D0A64 AC620030 */  sw         $v0, 0x30($v1)
/* D1668 800D0A68 8C840000 */  lw         $a0, ($a0)
/* D166C 800D0A6C 1080000F */  beqz       $a0, .L800D0AAC
/* D1670 800D0A70 24050009 */   addiu     $a1, $zero, 9
/* D1674 800D0A74 8C820008 */  lw         $v0, 8($a0)
/* D1678 800D0A78 080342A9 */  j          .L800D0AA4
/* D167C 800D0A7C 00003021 */   addu      $a2, $zero, $zero
glabel L800D0A80_D1680
/* D1680 800D0A80 080342AB */  j          .L800D0AAC
/* D1684 800D0A84 AC660018 */   sw        $a2, 0x18($v1)
glabel L800D0A88_D1688
/* D1688 800D0A88 24020001 */  addiu      $v0, $zero, 1
/* D168C 800D0A8C 080342AB */  j          .L800D0AAC
/* D1690 800D0A90 AC62001C */   sw        $v0, 0x1c($v1)
.L800D0A94:
glabel L800D0A94_D1694
/* D1694 800D0A94 8C840000 */  lw         $a0, ($a0)
/* D1698 800D0A98 10800004 */  beqz       $a0, .L800D0AAC
/* D169C 800D0A9C 00000000 */   nop
/* D16A0 800D0AA0 8C820008 */  lw         $v0, 8($a0)
.L800D0AA4:
/* D16A4 800D0AA4 0040F809 */  jalr       $v0
/* D16A8 800D0AA8 00000000 */   nop
.L800D0AAC:
/* D16AC 800D0AAC 8FBF0010 */  lw         $ra, 0x10($sp)
/* D16B0 800D0AB0 00001021 */  addu       $v0, $zero, $zero
/* D16B4 800D0AB4 03E00008 */  jr         $ra
/* D16B8 800D0AB8 27BD0018 */   addiu     $sp, $sp, 0x18
/* D16BC 800D0ABC 00000000 */  nop
