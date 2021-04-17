.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800AE760
/* AF360 800AE760 C4A2000C */  lwc1       $f2, 0xc($a1)
/* AF364 800AE764 44802000 */  mtc1       $zero, $f4
/* AF368 800AE768 4602203C */  c.lt.s     $f4, $f2
/* AF36C 800AE76C 00000000 */  nop
/* AF370 800AE770 45010002 */  bc1t       .L800AE77C
/* AF374 800AE774 27BDFF80 */   addiu     $sp, $sp, -0x80
/* AF378 800AE778 46001087 */  neg.s      $f2, $f2
.L800AE77C:
/* AF37C 800AE77C C4A00010 */  lwc1       $f0, 0x10($a1)
/* AF380 800AE780 4600203C */  c.lt.s     $f4, $f0
/* AF384 800AE784 00000000 */  nop
/* AF388 800AE788 45000007 */  bc1f       .L800AE7A8
/* AF38C 800AE78C 46000106 */   mov.s     $f4, $f0
/* AF390 800AE790 4602203C */  c.lt.s     $f4, $f2
/* AF394 800AE794 00000000 */  nop
/* AF398 800AE798 45030009 */  bc1tl      .L800AE7C0
/* AF39C 800AE79C C4A2000C */   lwc1      $f2, 0xc($a1)
/* AF3A0 800AE7A0 0802BA22 */  j          .L800AE888
/* AF3A4 800AE7A4 00000000 */   nop
.L800AE7A8:
/* AF3A8 800AE7A8 46002007 */  neg.s      $f0, $f4
/* AF3AC 800AE7AC 4602003C */  c.lt.s     $f0, $f2
/* AF3B0 800AE7B0 00000000 */  nop
/* AF3B4 800AE7B4 45000034 */  bc1f       .L800AE888
/* AF3B8 800AE7B8 00000000 */   nop
/* AF3BC 800AE7BC C4A2000C */  lwc1       $f2, 0xc($a1)
.L800AE7C0:
/* AF3C0 800AE7C0 44802000 */  mtc1       $zero, $f4
/* AF3C4 800AE7C4 4602203C */  c.lt.s     $f4, $f2
/* AF3C8 800AE7C8 00000000 */  nop
/* AF3CC 800AE7CC 45020001 */  bc1fl      .L800AE7D4
/* AF3D0 800AE7D0 46001087 */   neg.s     $f2, $f2
.L800AE7D4:
/* AF3D4 800AE7D4 C4A00014 */  lwc1       $f0, 0x14($a1)
/* AF3D8 800AE7D8 4600203C */  c.lt.s     $f4, $f0
/* AF3DC 800AE7DC 00000000 */  nop
/* AF3E0 800AE7E0 45020007 */  bc1fl      .L800AE800
/* AF3E4 800AE7E4 46000007 */   neg.s     $f0, $f0
/* AF3E8 800AE7E8 4602003C */  c.lt.s     $f0, $f2
/* AF3EC 800AE7EC 00000000 */  nop
/* AF3F0 800AE7F0 45010007 */  bc1t       .L800AE810
/* AF3F4 800AE7F4 27A80004 */   addiu     $t0, $sp, 4
/* AF3F8 800AE7F8 0802BA14 */  j          .L800AE850
/* AF3FC 800AE7FC 01003821 */   addu      $a3, $t0, $zero
.L800AE800:
/* AF400 800AE800 4602003C */  c.lt.s     $f0, $f2
/* AF404 800AE804 00000000 */  nop
/* AF408 800AE808 45000010 */  bc1f       .L800AE84C
/* AF40C 800AE80C 27A80004 */   addiu     $t0, $sp, 4
.L800AE810:
/* AF410 800AE810 01003821 */  addu       $a3, $t0, $zero
/* AF414 800AE814 03A01821 */  addu       $v1, $sp, $zero
/* AF418 800AE818 24060002 */  addiu      $a2, $zero, 2
.L800AE81C:
/* AF41C 800AE81C 8CA20000 */  lw         $v0, ($a1)
/* AF420 800AE820 24A50004 */  addiu      $a1, $a1, 4
/* AF424 800AE824 C4400008 */  lwc1       $f0, 8($v0)
/* AF428 800AE828 24C6FFFF */  addiu      $a2, $a2, -1
/* AF42C 800AE82C E4600000 */  swc1       $f0, ($v1)
/* AF430 800AE830 C4420004 */  lwc1       $f2, 4($v0)
/* AF434 800AE834 24630008 */  addiu      $v1, $v1, 8
/* AF438 800AE838 E4E20000 */  swc1       $f2, ($a3)
/* AF43C 800AE83C 04C1FFF7 */  bgez       $a2, .L800AE81C
/* AF440 800AE840 24E70008 */   addiu     $a3, $a3, 8
/* AF444 800AE844 0802BA55 */  j          .L800AE954
/* AF448 800AE848 C4800008 */   lwc1      $f0, 8($a0)
.L800AE84C:
/* AF44C 800AE84C 01003821 */  addu       $a3, $t0, $zero
.L800AE850:
/* AF450 800AE850 03A01821 */  addu       $v1, $sp, $zero
/* AF454 800AE854 24060002 */  addiu      $a2, $zero, 2
.L800AE858:
/* AF458 800AE858 8CA20000 */  lw         $v0, ($a1)
/* AF45C 800AE85C 24A50004 */  addiu      $a1, $a1, 4
/* AF460 800AE860 C4400000 */  lwc1       $f0, ($v0)
/* AF464 800AE864 24C6FFFF */  addiu      $a2, $a2, -1
/* AF468 800AE868 E4600000 */  swc1       $f0, ($v1)
/* AF46C 800AE86C C4420004 */  lwc1       $f2, 4($v0)
/* AF470 800AE870 24630008 */  addiu      $v1, $v1, 8
/* AF474 800AE874 E4E20000 */  swc1       $f2, ($a3)
/* AF478 800AE878 04C1FFF7 */  bgez       $a2, .L800AE858
/* AF47C 800AE87C 24E70008 */   addiu     $a3, $a3, 8
/* AF480 800AE880 0802BA55 */  j          .L800AE954
/* AF484 800AE884 C4800000 */   lwc1      $f0, ($a0)
.L800AE888:
/* AF488 800AE888 44803000 */  mtc1       $zero, $f6
/* AF48C 800AE88C 46002086 */  mov.s      $f2, $f4
/* AF490 800AE890 4602303C */  c.lt.s     $f6, $f2
/* AF494 800AE894 00000000 */  nop
/* AF498 800AE898 45020001 */  bc1fl      .L800AE8A0
/* AF49C 800AE89C 46001087 */   neg.s     $f2, $f2
.L800AE8A0:
/* AF4A0 800AE8A0 C4A00014 */  lwc1       $f0, 0x14($a1)
/* AF4A4 800AE8A4 4600303C */  c.lt.s     $f6, $f0
/* AF4A8 800AE8A8 00000000 */  nop
/* AF4AC 800AE8AC 45020007 */  bc1fl      .L800AE8CC
/* AF4B0 800AE8B0 46000007 */   neg.s     $f0, $f0
/* AF4B4 800AE8B4 4602003C */  c.lt.s     $f0, $f2
/* AF4B8 800AE8B8 00000000 */  nop
/* AF4BC 800AE8BC 45010007 */  bc1t       .L800AE8DC
/* AF4C0 800AE8C0 27A80004 */   addiu     $t0, $sp, 4
/* AF4C4 800AE8C4 0802BA48 */  j          .L800AE920
/* AF4C8 800AE8C8 01003821 */   addu      $a3, $t0, $zero
.L800AE8CC:
/* AF4CC 800AE8CC 4602003C */  c.lt.s     $f0, $f2
/* AF4D0 800AE8D0 00000000 */  nop
/* AF4D4 800AE8D4 45000011 */  bc1f       .L800AE91C
/* AF4D8 800AE8D8 27A80004 */   addiu     $t0, $sp, 4
.L800AE8DC:
/* AF4DC 800AE8DC 01003821 */  addu       $a3, $t0, $zero
/* AF4E0 800AE8E0 03A01821 */  addu       $v1, $sp, $zero
/* AF4E4 800AE8E4 24060002 */  addiu      $a2, $zero, 2
.L800AE8E8:
/* AF4E8 800AE8E8 8CA20000 */  lw         $v0, ($a1)
/* AF4EC 800AE8EC 24A50004 */  addiu      $a1, $a1, 4
/* AF4F0 800AE8F0 C4400000 */  lwc1       $f0, ($v0)
/* AF4F4 800AE8F4 24C6FFFF */  addiu      $a2, $a2, -1
/* AF4F8 800AE8F8 E4600000 */  swc1       $f0, ($v1)
/* AF4FC 800AE8FC C4420008 */  lwc1       $f2, 8($v0)
/* AF500 800AE900 24630008 */  addiu      $v1, $v1, 8
/* AF504 800AE904 E4E20000 */  swc1       $f2, ($a3)
/* AF508 800AE908 04C1FFF7 */  bgez       $a2, .L800AE8E8
/* AF50C 800AE90C 24E70008 */   addiu     $a3, $a3, 8
/* AF510 800AE910 C4800000 */  lwc1       $f0, ($a0)
/* AF514 800AE914 0802BA56 */  j          .L800AE958
/* AF518 800AE918 C4820008 */   lwc1      $f2, 8($a0)
.L800AE91C:
/* AF51C 800AE91C 01003821 */  addu       $a3, $t0, $zero
.L800AE920:
/* AF520 800AE920 03A01821 */  addu       $v1, $sp, $zero
/* AF524 800AE924 24060002 */  addiu      $a2, $zero, 2
.L800AE928:
/* AF528 800AE928 8CA20000 */  lw         $v0, ($a1)
/* AF52C 800AE92C 24A50004 */  addiu      $a1, $a1, 4
/* AF530 800AE930 C4400000 */  lwc1       $f0, ($v0)
/* AF534 800AE934 24C6FFFF */  addiu      $a2, $a2, -1
/* AF538 800AE938 E4600000 */  swc1       $f0, ($v1)
/* AF53C 800AE93C C4420004 */  lwc1       $f2, 4($v0)
/* AF540 800AE940 24630008 */  addiu      $v1, $v1, 8
/* AF544 800AE944 E4E20000 */  swc1       $f2, ($a3)
/* AF548 800AE948 04C1FFF7 */  bgez       $a2, .L800AE928
/* AF54C 800AE94C 24E70008 */   addiu     $a3, $a3, 8
/* AF550 800AE950 C4800000 */  lwc1       $f0, ($a0)
.L800AE954:
/* AF554 800AE954 C4820004 */  lwc1       $f2, 4($a0)
.L800AE958:
/* AF558 800AE958 E7A00040 */  swc1       $f0, 0x40($sp)
/* AF55C 800AE95C E7A20044 */  swc1       $f2, 0x44($sp)
/* AF560 800AE960 01001821 */  addu       $v1, $t0, $zero
/* AF564 800AE964 03A01021 */  addu       $v0, $sp, $zero
/* AF568 800AE968 24060002 */  addiu      $a2, $zero, 2
.L800AE96C:
/* AF56C 800AE96C C4400000 */  lwc1       $f0, ($v0)
/* AF570 800AE970 C7A20040 */  lwc1       $f2, 0x40($sp)
/* AF574 800AE974 46020001 */  sub.s      $f0, $f0, $f2
/* AF578 800AE978 E4400000 */  swc1       $f0, ($v0)
/* AF57C 800AE97C C4620000 */  lwc1       $f2, ($v1)
/* AF580 800AE980 C7A00044 */  lwc1       $f0, 0x44($sp)
/* AF584 800AE984 46001081 */  sub.s      $f2, $f2, $f0
/* AF588 800AE988 24C6FFFF */  addiu      $a2, $a2, -1
/* AF58C 800AE98C 24420008 */  addiu      $v0, $v0, 8
/* AF590 800AE990 E4620000 */  swc1       $f2, ($v1)
/* AF594 800AE994 04C1FFF5 */  bgez       $a2, .L800AE96C
/* AF598 800AE998 24630008 */   addiu     $v1, $v1, 8
/* AF59C 800AE99C C7AA0000 */  lwc1       $f10, ($sp)
/* AF5A0 800AE9A0 C7AC000C */  lwc1       $f12, 0xc($sp)
/* AF5A4 800AE9A4 460C5102 */  mul.s      $f4, $f10, $f12
/* AF5A8 800AE9A8 C7A60008 */  lwc1       $f6, 8($sp)
/* AF5AC 800AE9AC C7A80004 */  lwc1       $f8, 4($sp)
/* AF5B0 800AE9B0 46083002 */  mul.s      $f0, $f6, $f8
/* AF5B4 800AE9B4 46002101 */  sub.s      $f4, $f4, $f0
/* AF5B8 800AE9B8 44801000 */  mtc1       $zero, $f2
/* AF5BC 800AE9BC 4602203C */  c.lt.s     $f4, $f2
/* AF5C0 800AE9C0 00000000 */  nop
/* AF5C4 800AE9C4 45000003 */  bc1f       .L800AE9D4
/* AF5C8 800AE9C8 46004386 */   mov.s     $f14, $f8
/* AF5CC 800AE9CC 0802BA76 */  j          .L800AE9D8
/* AF5D0 800AE9D0 2402FFFF */   addiu     $v0, $zero, -1
.L800AE9D4:
/* AF5D4 800AE9D4 24020001 */  addiu      $v0, $zero, 1
.L800AE9D8:
/* AF5D8 800AE9D8 C7A80014 */  lwc1       $f8, 0x14($sp)
/* AF5DC 800AE9DC 46083102 */  mul.s      $f4, $f6, $f8
/* AF5E0 800AE9E0 C7A60010 */  lwc1       $f6, 0x10($sp)
/* AF5E4 800AE9E4 460C3002 */  mul.s      $f0, $f6, $f12
/* AF5E8 800AE9E8 46002101 */  sub.s      $f4, $f4, $f0
/* AF5EC 800AE9EC 44801000 */  mtc1       $zero, $f2
/* AF5F0 800AE9F0 4602203C */  c.lt.s     $f4, $f2
/* AF5F4 800AE9F4 00000000 */  nop
/* AF5F8 800AE9F8 45020002 */  bc1fl      .L800AEA04
/* AF5FC 800AE9FC 24420001 */   addiu     $v0, $v0, 1
/* AF600 800AEA00 2442FFFF */  addiu      $v0, $v0, -1
.L800AEA04:
/* AF604 800AEA04 460E3002 */  mul.s      $f0, $f6, $f14
/* AF608 800AEA08 00000000 */  nop
/* AF60C 800AEA0C 46085082 */  mul.s      $f2, $f10, $f8
/* AF610 800AEA10 46020001 */  sub.s      $f0, $f0, $f2
/* AF614 800AEA14 44802000 */  mtc1       $zero, $f4
/* AF618 800AEA18 4604003C */  c.lt.s     $f0, $f4
/* AF61C 800AEA1C 00000000 */  nop
/* AF620 800AEA20 45020002 */  bc1fl      .L800AEA2C
/* AF624 800AEA24 24420001 */   addiu     $v0, $v0, 1
/* AF628 800AEA28 2442FFFF */  addiu      $v0, $v0, -1
.L800AEA2C:
/* AF62C 800AEA2C 04420001 */  bltzl      $v0, .L800AEA34
/* AF630 800AEA30 00021023 */   negu      $v0, $v0
.L800AEA34:
/* AF634 800AEA34 38420003 */  xori       $v0, $v0, 3
/* AF638 800AEA38 2C420001 */  sltiu      $v0, $v0, 1
/* AF63C 800AEA3C 03E00008 */  jr         $ra
/* AF640 800AEA40 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_800AEA44
/* AF644 800AEA44 27BDFEB8 */  addiu      $sp, $sp, -0x148
/* AF648 800AEA48 F7B60140 */  sdc1       $f22, 0x140($sp)
/* AF64C 800AEA4C 4486B000 */  mtc1       $a2, $f22
/* AF650 800AEA50 AFB50124 */  sw         $s5, 0x124($sp)
/* AF654 800AEA54 00E0A821 */  addu       $s5, $a3, $zero
/* AF658 800AEA58 AFBF0130 */  sw         $ra, 0x130($sp)
/* AF65C 800AEA5C AFB7012C */  sw         $s7, 0x12c($sp)
/* AF660 800AEA60 AFB60128 */  sw         $s6, 0x128($sp)
/* AF664 800AEA64 AFB40120 */  sw         $s4, 0x120($sp)
/* AF668 800AEA68 AFB3011C */  sw         $s3, 0x11c($sp)
/* AF66C 800AEA6C AFB20118 */  sw         $s2, 0x118($sp)
/* AF670 800AEA70 AFB10114 */  sw         $s1, 0x114($sp)
/* AF674 800AEA74 AFB00110 */  sw         $s0, 0x110($sp)
/* AF678 800AEA78 F7B40138 */  sdc1       $f20, 0x138($sp)
/* AF67C 800AEA7C C6A0000C */  lwc1       $f0, 0xc($s5)
/* AF680 800AEA80 46160002 */  mul.s      $f0, $f0, $f22
/* AF684 800AEA84 C6A80010 */  lwc1       $f8, 0x10($s5)
/* AF688 800AEA88 46164202 */  mul.s      $f8, $f8, $f22
/* AF68C 800AEA8C 0080A021 */  addu       $s4, $a0, $zero
/* AF690 800AEA90 C6AA0014 */  lwc1       $f10, 0x14($s5)
/* AF694 800AEA94 27B30090 */  addiu      $s3, $sp, 0x90
/* AF698 800AEA98 46165282 */  mul.s      $f10, $f10, $f22
/* AF69C 800AEA9C 02602021 */  addu       $a0, $s3, $zero
/* AF6A0 800AEAA0 00A0B021 */  addu       $s6, $a1, $zero
/* AF6A4 800AEAA4 C6860000 */  lwc1       $f6, ($s4)
/* AF6A8 800AEAA8 C6840004 */  lwc1       $f4, 4($s4)
/* AF6AC 800AEAAC 46003181 */  sub.s      $f6, $f6, $f0
/* AF6B0 800AEAB0 8EA60000 */  lw         $a2, ($s5)
/* AF6B4 800AEAB4 C6820008 */  lwc1       $f2, 8($s4)
/* AF6B8 800AEAB8 46082101 */  sub.s      $f4, $f4, $f8
/* AF6BC 800AEABC 8FB20158 */  lw         $s2, 0x158($sp)
/* AF6C0 800AEAC0 8FB7015C */  lw         $s7, 0x15c($sp)
/* AF6C4 800AEAC4 460A1081 */  sub.s      $f2, $f2, $f10
/* AF6C8 800AEAC8 C6C80000 */  lwc1       $f8, ($s6)
/* AF6CC 800AEACC 02802821 */  addu       $a1, $s4, $zero
/* AF6D0 800AEAD0 E7A60010 */  swc1       $f6, 0x10($sp)
/* AF6D4 800AEAD4 46083180 */  add.s      $f6, $f6, $f8
/* AF6D8 800AEAD8 C6C00004 */  lwc1       $f0, 4($s6)
/* AF6DC 800AEADC C6C80008 */  lwc1       $f8, 8($s6)
/* AF6E0 800AEAE0 46002000 */  add.s      $f0, $f4, $f0
/* AF6E4 800AEAE4 E7A40014 */  swc1       $f4, 0x14($sp)
/* AF6E8 800AEAE8 E7A20018 */  swc1       $f2, 0x18($sp)
/* AF6EC 800AEAEC 46081080 */  add.s      $f2, $f2, $f8
/* AF6F0 800AEAF0 E7A60050 */  swc1       $f6, 0x50($sp)
/* AF6F4 800AEAF4 E7A00054 */  swc1       $f0, 0x54($sp)
/* AF6F8 800AEAF8 0C02AB26 */  jal        Vec3A_BsubC
/* AF6FC 800AEAFC E7A20058 */   swc1      $f2, 0x58($sp)
/* AF700 800AEB00 27B100D0 */  addiu      $s1, $sp, 0xd0
/* AF704 800AEB04 02202021 */  addu       $a0, $s1, $zero
/* AF708 800AEB08 8EA60000 */  lw         $a2, ($s5)
/* AF70C 800AEB0C 0C02AB26 */  jal        Vec3A_BsubC
/* AF710 800AEB10 27A50050 */   addiu     $a1, $sp, 0x50
/* AF714 800AEB14 02602021 */  addu       $a0, $s3, $zero
/* AF718 800AEB18 26B0000C */  addiu      $s0, $s5, 0xc
/* AF71C 800AEB1C 0C02AB7A */  jal        vec3_scalar_product
/* AF720 800AEB20 02002821 */   addu      $a1, $s0, $zero
/* AF724 800AEB24 02202021 */  addu       $a0, $s1, $zero
/* AF728 800AEB28 02002821 */  addu       $a1, $s0, $zero
/* AF72C 800AEB2C 0C02AB7A */  jal        vec3_scalar_product
/* AF730 800AEB30 46000506 */   mov.s     $f20, $f0
/* AF734 800AEB34 44802000 */  mtc1       $zero, $f4
/* AF738 800AEB38 46000086 */  mov.s      $f2, $f0
/* AF73C 800AEB3C 4604A03C */  c.lt.s     $f20, $f4
/* AF740 800AEB40 00000000 */  nop
/* AF744 800AEB44 4500000C */  bc1f       .L800AEB78
/* AF748 800AEB48 E6420000 */   swc1      $f2, ($s2)
/* AF74C 800AEB4C 4614203C */  c.lt.s     $f4, $f20
/* AF750 800AEB50 00000000 */  nop
/* AF754 800AEB54 45020004 */  bc1fl      .L800AEB68
/* AF758 800AEB58 4600A007 */   neg.s     $f0, $f20
/* AF75C 800AEB5C 4614B03C */  c.lt.s     $f22, $f20
/* AF760 800AEB60 0802BADB */  j          .L800AEB6C
/* AF764 800AEB64 00000000 */   nop
.L800AEB68:
/* AF768 800AEB68 4600B03C */  c.lt.s     $f22, $f0
.L800AEB6C:
/* AF76C 800AEB6C 00000000 */  nop
/* AF770 800AEB70 4501001D */  bc1t       .L800AEBE8
/* AF774 800AEB74 00001021 */   addu      $v0, $zero, $zero
.L800AEB78:
/* AF778 800AEB78 44800000 */  mtc1       $zero, $f0
/* AF77C 800AEB7C 4602003C */  c.lt.s     $f0, $f2
/* AF780 800AEB80 00000000 */  nop
/* AF784 800AEB84 45010018 */  bc1t       .L800AEBE8
/* AF788 800AEB88 00001021 */   addu      $v0, $zero, $zero
/* AF78C 800AEB8C 4602A200 */  add.s      $f8, $f20, $f2
/* AF790 800AEB90 46004032 */  c.eq.s     $f8, $f0
/* AF794 800AEB94 00000000 */  nop
/* AF798 800AEB98 45020001 */  bc1fl      .L800AEBA0
/* AF79C 800AEB9C 4608A203 */   div.s     $f8, $f20, $f8
.L800AEBA0:
/* AF7A0 800AEBA0 C6C20000 */  lwc1       $f2, ($s6)
/* AF7A4 800AEBA4 46081082 */  mul.s      $f2, $f2, $f8
/* AF7A8 800AEBA8 C6800000 */  lwc1       $f0, ($s4)
/* AF7AC 800AEBAC 46020000 */  add.s      $f0, $f0, $f2
/* AF7B0 800AEBB0 E6E00000 */  swc1       $f0, ($s7)
/* AF7B4 800AEBB4 C6C20004 */  lwc1       $f2, 4($s6)
/* AF7B8 800AEBB8 46081082 */  mul.s      $f2, $f2, $f8
/* AF7BC 800AEBBC C6800004 */  lwc1       $f0, 4($s4)
/* AF7C0 800AEBC0 46020000 */  add.s      $f0, $f0, $f2
/* AF7C4 800AEBC4 E6E00004 */  swc1       $f0, 4($s7)
/* AF7C8 800AEBC8 C6C20008 */  lwc1       $f2, 8($s6)
/* AF7CC 800AEBCC 46081082 */  mul.s      $f2, $f2, $f8
/* AF7D0 800AEBD0 C6800008 */  lwc1       $f0, 8($s4)
/* AF7D4 800AEBD4 46020000 */  add.s      $f0, $f0, $f2
/* AF7D8 800AEBD8 02E02021 */  addu       $a0, $s7, $zero
/* AF7DC 800AEBDC 02A02821 */  addu       $a1, $s5, $zero
/* AF7E0 800AEBE0 0C02B9D8 */  jal        func_800AE760
/* AF7E4 800AEBE4 E6E00008 */   swc1      $f0, 8($s7)
.L800AEBE8:
/* AF7E8 800AEBE8 8FBF0130 */  lw         $ra, 0x130($sp)
/* AF7EC 800AEBEC 8FB7012C */  lw         $s7, 0x12c($sp)
/* AF7F0 800AEBF0 8FB60128 */  lw         $s6, 0x128($sp)
/* AF7F4 800AEBF4 8FB50124 */  lw         $s5, 0x124($sp)
/* AF7F8 800AEBF8 8FB40120 */  lw         $s4, 0x120($sp)
/* AF7FC 800AEBFC 8FB3011C */  lw         $s3, 0x11c($sp)
/* AF800 800AEC00 8FB20118 */  lw         $s2, 0x118($sp)
/* AF804 800AEC04 8FB10114 */  lw         $s1, 0x114($sp)
/* AF808 800AEC08 8FB00110 */  lw         $s0, 0x110($sp)
/* AF80C 800AEC0C D7B60140 */  ldc1       $f22, 0x140($sp)
/* AF810 800AEC10 D7B40138 */  ldc1       $f20, 0x138($sp)
/* AF814 800AEC14 03E00008 */  jr         $ra
/* AF818 800AEC18 27BD0148 */   addiu     $sp, $sp, 0x148

glabel func_800AEC1C
/* AF81C 800AEC1C 44860000 */  mtc1       $a2, $f0
/* AF820 800AEC20 27BDFEC8 */  addiu      $sp, $sp, -0x138
/* AF824 800AEC24 AFB40120 */  sw         $s4, 0x120($sp)
/* AF828 800AEC28 00E0A021 */  addu       $s4, $a3, $zero
/* AF82C 800AEC2C AFBF012C */  sw         $ra, 0x12c($sp)
/* AF830 800AEC30 AFB60128 */  sw         $s6, 0x128($sp)
/* AF834 800AEC34 AFB50124 */  sw         $s5, 0x124($sp)
/* AF838 800AEC38 AFB3011C */  sw         $s3, 0x11c($sp)
/* AF83C 800AEC3C AFB20118 */  sw         $s2, 0x118($sp)
/* AF840 800AEC40 AFB10114 */  sw         $s1, 0x114($sp)
/* AF844 800AEC44 AFB00110 */  sw         $s0, 0x110($sp)
/* AF848 800AEC48 F7B40130 */  sdc1       $f20, 0x130($sp)
/* AF84C 800AEC4C C682000C */  lwc1       $f2, 0xc($s4)
/* AF850 800AEC50 46001082 */  mul.s      $f2, $f2, $f0
/* AF854 800AEC54 C6880010 */  lwc1       $f8, 0x10($s4)
/* AF858 800AEC58 46004202 */  mul.s      $f8, $f8, $f0
/* AF85C 800AEC5C 00801021 */  addu       $v0, $a0, $zero
/* AF860 800AEC60 27B30090 */  addiu      $s3, $sp, 0x90
/* AF864 800AEC64 C68A0014 */  lwc1       $f10, 0x14($s4)
/* AF868 800AEC68 02602021 */  addu       $a0, $s3, $zero
/* AF86C 800AEC6C 46005282 */  mul.s      $f10, $f10, $f0
/* AF870 800AEC70 00A0A821 */  addu       $s5, $a1, $zero
/* AF874 800AEC74 C4460000 */  lwc1       $f6, ($v0)
/* AF878 800AEC78 C4440004 */  lwc1       $f4, 4($v0)
/* AF87C 800AEC7C 8E860000 */  lw         $a2, ($s4)
/* AF880 800AEC80 46023181 */  sub.s      $f6, $f6, $f2
/* AF884 800AEC84 8FB20148 */  lw         $s2, 0x148($sp)
/* AF888 800AEC88 8FB6014C */  lw         $s6, 0x14c($sp)
/* AF88C 800AEC8C 46082101 */  sub.s      $f4, $f4, $f8
/* AF890 800AEC90 C4420008 */  lwc1       $f2, 8($v0)
/* AF894 800AEC94 C6A80000 */  lwc1       $f8, ($s5)
/* AF898 800AEC98 460A1081 */  sub.s      $f2, $f2, $f10
/* AF89C 800AEC9C 27A50010 */  addiu      $a1, $sp, 0x10
/* AF8A0 800AECA0 E7A60010 */  swc1       $f6, 0x10($sp)
/* AF8A4 800AECA4 46083180 */  add.s      $f6, $f6, $f8
/* AF8A8 800AECA8 C6A00004 */  lwc1       $f0, 4($s5)
/* AF8AC 800AECAC C6A80008 */  lwc1       $f8, 8($s5)
/* AF8B0 800AECB0 46002000 */  add.s      $f0, $f4, $f0
/* AF8B4 800AECB4 E7A40014 */  swc1       $f4, 0x14($sp)
/* AF8B8 800AECB8 E7A20018 */  swc1       $f2, 0x18($sp)
/* AF8BC 800AECBC 46081080 */  add.s      $f2, $f2, $f8
/* AF8C0 800AECC0 E7A60050 */  swc1       $f6, 0x50($sp)
/* AF8C4 800AECC4 E7A00054 */  swc1       $f0, 0x54($sp)
/* AF8C8 800AECC8 0C02AB26 */  jal        Vec3A_BsubC
/* AF8CC 800AECCC E7A20058 */   swc1      $f2, 0x58($sp)
/* AF8D0 800AECD0 27B100D0 */  addiu      $s1, $sp, 0xd0
/* AF8D4 800AECD4 02202021 */  addu       $a0, $s1, $zero
/* AF8D8 800AECD8 8E860000 */  lw         $a2, ($s4)
/* AF8DC 800AECDC 0C02AB26 */  jal        Vec3A_BsubC
/* AF8E0 800AECE0 27A50050 */   addiu     $a1, $sp, 0x50
/* AF8E4 800AECE4 02602021 */  addu       $a0, $s3, $zero
/* AF8E8 800AECE8 2690000C */  addiu      $s0, $s4, 0xc
/* AF8EC 800AECEC 0C02AB7A */  jal        vec3_scalar_product
/* AF8F0 800AECF0 02002821 */   addu      $a1, $s0, $zero
/* AF8F4 800AECF4 02202021 */  addu       $a0, $s1, $zero
/* AF8F8 800AECF8 02002821 */  addu       $a1, $s0, $zero
/* AF8FC 800AECFC 0C02AB7A */  jal        vec3_scalar_product
/* AF900 800AED00 46000506 */   mov.s     $f20, $f0
/* AF904 800AED04 44801000 */  mtc1       $zero, $f2
/* AF908 800AED08 4602A03C */  c.lt.s     $f20, $f2
/* AF90C 800AED0C 00000000 */  nop
/* AF910 800AED10 45010005 */  bc1t       .L800AED28
/* AF914 800AED14 E6400000 */   swc1      $f0, ($s2)
/* AF918 800AED18 4600103C */  c.lt.s     $f2, $f0
/* AF91C 800AED1C 00000000 */  nop
/* AF920 800AED20 45000003 */  bc1f       .L800AED30
/* AF924 800AED24 00000000 */   nop
.L800AED28:
/* AF928 800AED28 0802BB6F */  j          .L800AEDBC
/* AF92C 800AED2C 00001021 */   addu      $v0, $zero, $zero
.L800AED30:
/* AF930 800AED30 4602003C */  c.lt.s     $f0, $f2
/* AF934 800AED34 00000000 */  nop
/* AF938 800AED38 45020002 */  bc1fl      .L800AED44
/* AF93C 800AED3C 4600A000 */   add.s     $f0, $f20, $f0
/* AF940 800AED40 4600A001 */  sub.s      $f0, $f20, $f0
.L800AED44:
/* AF944 800AED44 44801000 */  mtc1       $zero, $f2
/* AF948 800AED48 46000206 */  mov.s      $f8, $f0
/* AF94C 800AED4C 4608103C */  c.lt.s     $f2, $f8
/* AF950 800AED50 00000000 */  nop
/* AF954 800AED54 45020008 */  bc1fl      .L800AED78
/* AF958 800AED58 C6A20000 */   lwc1      $f2, ($s5)
/* AF95C 800AED5C 4602A03C */  c.lt.s     $f20, $f2
/* AF960 800AED60 00000000 */  nop
/* AF964 800AED64 45020003 */  bc1fl      .L800AED74
/* AF968 800AED68 4608A203 */   div.s     $f8, $f20, $f8
/* AF96C 800AED6C 4600A007 */  neg.s      $f0, $f20
/* AF970 800AED70 46080203 */  div.s      $f8, $f0, $f8
.L800AED74:
/* AF974 800AED74 C6A20000 */  lwc1       $f2, ($s5)
.L800AED78:
/* AF978 800AED78 46081082 */  mul.s      $f2, $f2, $f8
/* AF97C 800AED7C C7A00010 */  lwc1       $f0, 0x10($sp)
/* AF980 800AED80 46020000 */  add.s      $f0, $f0, $f2
/* AF984 800AED84 E6C00000 */  swc1       $f0, ($s6)
/* AF988 800AED88 C6A20004 */  lwc1       $f2, 4($s5)
/* AF98C 800AED8C 46081082 */  mul.s      $f2, $f2, $f8
/* AF990 800AED90 C7A00014 */  lwc1       $f0, 0x14($sp)
/* AF994 800AED94 46020000 */  add.s      $f0, $f0, $f2
/* AF998 800AED98 E6C00004 */  swc1       $f0, 4($s6)
/* AF99C 800AED9C C6A20008 */  lwc1       $f2, 8($s5)
/* AF9A0 800AEDA0 46081082 */  mul.s      $f2, $f2, $f8
/* AF9A4 800AEDA4 C7A00018 */  lwc1       $f0, 0x18($sp)
/* AF9A8 800AEDA8 46020000 */  add.s      $f0, $f0, $f2
/* AF9AC 800AEDAC 02C02021 */  addu       $a0, $s6, $zero
/* AF9B0 800AEDB0 02802821 */  addu       $a1, $s4, $zero
/* AF9B4 800AEDB4 0C02B9D8 */  jal        func_800AE760
/* AF9B8 800AEDB8 E6C00008 */   swc1      $f0, 8($s6)
.L800AEDBC:
/* AF9BC 800AEDBC 8FBF012C */  lw         $ra, 0x12c($sp)
/* AF9C0 800AEDC0 8FB60128 */  lw         $s6, 0x128($sp)
/* AF9C4 800AEDC4 8FB50124 */  lw         $s5, 0x124($sp)
/* AF9C8 800AEDC8 8FB40120 */  lw         $s4, 0x120($sp)
/* AF9CC 800AEDCC 8FB3011C */  lw         $s3, 0x11c($sp)
/* AF9D0 800AEDD0 8FB20118 */  lw         $s2, 0x118($sp)
/* AF9D4 800AEDD4 8FB10114 */  lw         $s1, 0x114($sp)
/* AF9D8 800AEDD8 8FB00110 */  lw         $s0, 0x110($sp)
/* AF9DC 800AEDDC D7B40130 */  ldc1       $f20, 0x130($sp)
/* AF9E0 800AEDE0 03E00008 */  jr         $ra
/* AF9E4 800AEDE4 27BD0138 */   addiu     $sp, $sp, 0x138

glabel func_800AEDE8
/* AF9E8 800AEDE8 27BDFE68 */  addiu      $sp, $sp, -0x198
/* AF9EC 800AEDEC AFB50164 */  sw         $s5, 0x164($sp)
/* AF9F0 800AEDF0 0080A821 */  addu       $s5, $a0, $zero
/* AF9F4 800AEDF4 F7BC0190 */  sdc1       $f28, 0x190($sp)
/* AF9F8 800AEDF8 4485E000 */  mtc1       $a1, $f28
/* AF9FC 800AEDFC 26A40010 */  addiu      $a0, $s5, 0x10
/* AFA00 800AEE00 AFB60168 */  sw         $s6, 0x168($sp)
/* AFA04 800AEE04 8FB601AC */  lw         $s6, 0x1ac($sp)
/* AFA08 800AEE08 27A50010 */  addiu      $a1, $sp, 0x10
/* AFA0C 800AEE0C AFB40160 */  sw         $s4, 0x160($sp)
/* AFA10 800AEE10 00C0A021 */  addu       $s4, $a2, $zero
/* AFA14 800AEE14 AFB3015C */  sw         $s3, 0x15c($sp)
/* AFA18 800AEE18 AFBF016C */  sw         $ra, 0x16c($sp)
/* AFA1C 800AEE1C AFB20158 */  sw         $s2, 0x158($sp)
/* AFA20 800AEE20 AFB10154 */  sw         $s1, 0x154($sp)
/* AFA24 800AEE24 AFB00150 */  sw         $s0, 0x150($sp)
/* AFA28 800AEE28 F7BA0188 */  sdc1       $f26, 0x188($sp)
/* AFA2C 800AEE2C F7B80180 */  sdc1       $f24, 0x180($sp)
/* AFA30 800AEE30 F7B60178 */  sdc1       $f22, 0x178($sp)
/* AFA34 800AEE34 F7B40170 */  sdc1       $f20, 0x170($sp)
/* AFA38 800AEE38 0C02AD17 */  jal        copyVec3
/* AFA3C 800AEE3C 00E09821 */   addu      $s3, $a3, $zero
/* AFA40 800AEE40 0C02ABBB */  jal        vec3_normalize
/* AFA44 800AEE44 27A40010 */   addiu     $a0, $sp, 0x10
/* AFA48 800AEE48 4405E000 */  mfc1       $a1, $f28
/* AFA4C 800AEE4C 0C02AD3C */  jal        multiVec3
/* AFA50 800AEE50 27A40010 */   addiu     $a0, $sp, 0x10
/* AFA54 800AEE54 27A40010 */  addiu      $a0, $sp, 0x10
/* AFA58 800AEE58 00802821 */  addu       $a1, $a0, $zero
/* AFA5C 800AEE5C 26B00004 */  addiu      $s0, $s5, 4
/* AFA60 800AEE60 0C02AB4D */  jal        vec3_sum
/* AFA64 800AEE64 02003021 */   addu      $a2, $s0, $zero
/* AFA68 800AEE68 27B20050 */  addiu      $s2, $sp, 0x50
/* AFA6C 800AEE6C 02402021 */  addu       $a0, $s2, $zero
/* AFA70 800AEE70 02802821 */  addu       $a1, $s4, $zero
/* AFA74 800AEE74 0C02AB26 */  jal        Vec3A_BsubC
/* AFA78 800AEE78 02003021 */   addu      $a2, $s0, $zero
/* AFA7C 800AEE7C 27B10090 */  addiu      $s1, $sp, 0x90
/* AFA80 800AEE80 02202021 */  addu       $a0, $s1, $zero
/* AFA84 800AEE84 27A50010 */  addiu      $a1, $sp, 0x10
/* AFA88 800AEE88 0C02AB26 */  jal        Vec3A_BsubC
/* AFA8C 800AEE8C 02003021 */   addu      $a2, $s0, $zero
/* AFA90 800AEE90 27B000D0 */  addiu      $s0, $sp, 0xd0
/* AFA94 800AEE94 02002021 */  addu       $a0, $s0, $zero
/* AFA98 800AEE98 02602821 */  addu       $a1, $s3, $zero
/* AFA9C 800AEE9C 0C02AB26 */  jal        Vec3A_BsubC
/* AFAA0 800AEEA0 02803021 */   addu      $a2, $s4, $zero
/* AFAA4 800AEEA4 02202021 */  addu       $a0, $s1, $zero
/* AFAA8 800AEEA8 0C02AB7A */  jal        vec3_scalar_product
/* AFAAC 800AEEAC 02002821 */   addu      $a1, $s0, $zero
/* AFAB0 800AEEB0 02202021 */  addu       $a0, $s1, $zero
/* AFAB4 800AEEB4 02202821 */  addu       $a1, $s1, $zero
/* AFAB8 800AEEB8 0C02AB7A */  jal        vec3_scalar_product
/* AFABC 800AEEBC 46000606 */   mov.s     $f24, $f0
/* AFAC0 800AEEC0 02002021 */  addu       $a0, $s0, $zero
/* AFAC4 800AEEC4 02002821 */  addu       $a1, $s0, $zero
/* AFAC8 800AEEC8 0C02AB7A */  jal        vec3_scalar_product
/* AFACC 800AEECC 46000686 */   mov.s     $f26, $f0
/* AFAD0 800AEED0 461A0002 */  mul.s      $f0, $f0, $f26
/* AFAD4 800AEED4 00000000 */  nop
/* AFAD8 800AEED8 4618C082 */  mul.s      $f2, $f24, $f24
/* AFADC 800AEEDC 46020581 */  sub.s      $f22, $f0, $f2
/* AFAE0 800AEEE0 44800000 */  mtc1       $zero, $f0
/* AFAE4 800AEEE4 4600B03C */  c.lt.s     $f22, $f0
/* AFAE8 800AEEE8 00000000 */  nop
/* AFAEC 800AEEEC 45000007 */  bc1f       .L800AEF0C
/* AFAF0 800AEEF0 02202821 */   addu      $a1, $s1, $zero
/* AFAF4 800AEEF4 3C01800E */  lui        $at, %hi(D_800E3750)
/* AFAF8 800AEEF8 C4223750 */  lwc1       $f2, %lo(D_800E3750)($at)
/* AFAFC 800AEEFC 4600B007 */  neg.s      $f0, $f22
/* AFB00 800AEF00 4602003C */  c.lt.s     $f0, $f2
/* AFB04 800AEF04 0802BBC6 */  j          .L800AEF18
/* AFB08 800AEF08 00000000 */   nop
.L800AEF0C:
/* AFB0C 800AEF0C 3C01800E */  lui        $at, %hi(D_800E3754)
/* AFB10 800AEF10 C4203754 */  lwc1       $f0, %lo(D_800E3754)($at)
/* AFB14 800AEF14 4600B03C */  c.lt.s     $f22, $f0
.L800AEF18:
/* AFB18 800AEF18 00000000 */  nop
/* AFB1C 800AEF1C 4501003D */  bc1t       .L800AF014
/* AFB20 800AEF20 00001021 */   addu      $v0, $zero, $zero
/* AFB24 800AEF24 0C02AB7A */  jal        vec3_scalar_product
/* AFB28 800AEF28 02402021 */   addu      $a0, $s2, $zero
/* AFB2C 800AEF2C 02402021 */  addu       $a0, $s2, $zero
/* AFB30 800AEF30 02002821 */  addu       $a1, $s0, $zero
/* AFB34 800AEF34 0C02AB7A */  jal        vec3_scalar_product
/* AFB38 800AEF38 46000506 */   mov.s     $f20, $f0
/* AFB3C 800AEF3C 4618A082 */  mul.s      $f2, $f20, $f24
/* AFB40 800AEF40 00000000 */  nop
/* AFB44 800AEF44 461A0002 */  mul.s      $f0, $f0, $f26
/* AFB48 800AEF48 46001081 */  sub.s      $f2, $f2, $f0
/* AFB4C 800AEF4C 46161083 */  div.s      $f2, $f2, $f22
/* AFB50 800AEF50 4602C002 */  mul.s      $f0, $f24, $f2
/* AFB54 800AEF54 4600A500 */  add.s      $f20, $f20, $f0
/* AFB58 800AEF58 44802000 */  mtc1       $zero, $f4
/* AFB5C 800AEF5C 4604103C */  c.lt.s     $f2, $f4
/* AFB60 800AEF60 00000000 */  nop
/* AFB64 800AEF64 4501002A */  bc1t       .L800AF010
/* AFB68 800AEF68 461AA503 */   div.s     $f20, $f20, $f26
/* AFB6C 800AEF6C 3C01800E */  lui        $at, %hi(D_800E3758)
/* AFB70 800AEF70 C4203758 */  lwc1       $f0, %lo(D_800E3758)($at)
/* AFB74 800AEF74 4602003C */  c.lt.s     $f0, $f2
/* AFB78 800AEF78 00000000 */  nop
/* AFB7C 800AEF7C 45010025 */  bc1t       .L800AF014
/* AFB80 800AEF80 00001021 */   addu      $v0, $zero, $zero
/* AFB84 800AEF84 4604A03C */  c.lt.s     $f20, $f4
/* AFB88 800AEF88 00000000 */  nop
/* AFB8C 800AEF8C 45010022 */  bc1t       .L800AF018
/* AFB90 800AEF90 8FBF016C */   lw        $ra, 0x16c($sp)
/* AFB94 800AEF94 4614003C */  c.lt.s     $f0, $f20
/* AFB98 800AEF98 00000000 */  nop
/* AFB9C 800AEF9C 4503001F */  bc1tl      .L800AF01C
/* AFBA0 800AEFA0 8FB60168 */   lw        $s6, 0x168($sp)
/* AFBA4 800AEFA4 C7A000D0 */  lwc1       $f0, 0xd0($sp)
/* AFBA8 800AEFA8 4600A002 */  mul.s      $f0, $f20, $f0
/* AFBAC 800AEFAC C7A400D4 */  lwc1       $f4, 0xd4($sp)
/* AFBB0 800AEFB0 4604A102 */  mul.s      $f4, $f20, $f4
/* AFBB4 800AEFB4 C7A800D8 */  lwc1       $f8, 0xd8($sp)
/* AFBB8 800AEFB8 4608A202 */  mul.s      $f8, $f20, $f8
/* AFBBC 800AEFBC C6860000 */  lwc1       $f6, ($s4)
/* AFBC0 800AEFC0 02C02021 */  addu       $a0, $s6, $zero
/* AFBC4 800AEFC4 46003180 */  add.s      $f6, $f6, $f0
/* AFBC8 800AEFC8 C6820004 */  lwc1       $f2, 4($s4)
/* AFBCC 800AEFCC 27A50110 */  addiu      $a1, $sp, 0x110
/* AFBD0 800AEFD0 46041080 */  add.s      $f2, $f2, $f4
/* AFBD4 800AEFD4 C6800008 */  lwc1       $f0, 8($s4)
/* AFBD8 800AEFD8 26A60004 */  addiu      $a2, $s5, 4
/* AFBDC 800AEFDC 46080000 */  add.s      $f0, $f0, $f8
/* AFBE0 800AEFE0 E7A60110 */  swc1       $f6, 0x110($sp)
/* AFBE4 800AEFE4 E7A20114 */  swc1       $f2, 0x114($sp)
/* AFBE8 800AEFE8 0C02AB26 */  jal        Vec3A_BsubC
/* AFBEC 800AEFEC E7A00118 */   swc1      $f0, 0x118($sp)
/* AFBF0 800AEFF0 0C02ABBB */  jal        vec3_normalize
/* AFBF4 800AEFF4 02C02021 */   addu      $a0, $s6, $zero
/* AFBF8 800AEFF8 24020001 */  addiu      $v0, $zero, 1
/* AFBFC 800AEFFC 8FA301A8 */  lw         $v1, 0x1a8($sp)
/* AFC00 800AF000 461C003C */  c.lt.s     $f0, $f28
/* AFC04 800AF004 00000000 */  nop
/* AFC08 800AF008 45010002 */  bc1t       .L800AF014
/* AFC0C 800AF00C E4600000 */   swc1      $f0, ($v1)
.L800AF010:
/* AFC10 800AF010 00001021 */  addu       $v0, $zero, $zero
.L800AF014:
/* AFC14 800AF014 8FBF016C */  lw         $ra, 0x16c($sp)
.L800AF018:
/* AFC18 800AF018 8FB60168 */  lw         $s6, 0x168($sp)
.L800AF01C:
/* AFC1C 800AF01C 8FB50164 */  lw         $s5, 0x164($sp)
/* AFC20 800AF020 8FB40160 */  lw         $s4, 0x160($sp)
/* AFC24 800AF024 8FB3015C */  lw         $s3, 0x15c($sp)
/* AFC28 800AF028 8FB20158 */  lw         $s2, 0x158($sp)
/* AFC2C 800AF02C 8FB10154 */  lw         $s1, 0x154($sp)
/* AFC30 800AF030 8FB00150 */  lw         $s0, 0x150($sp)
/* AFC34 800AF034 D7BC0190 */  ldc1       $f28, 0x190($sp)
/* AFC38 800AF038 D7BA0188 */  ldc1       $f26, 0x188($sp)
/* AFC3C 800AF03C D7B80180 */  ldc1       $f24, 0x180($sp)
/* AFC40 800AF040 D7B60178 */  ldc1       $f22, 0x178($sp)
/* AFC44 800AF044 D7B40170 */  ldc1       $f20, 0x170($sp)
/* AFC48 800AF048 03E00008 */  jr         $ra
/* AFC4C 800AF04C 27BD0198 */   addiu     $sp, $sp, 0x198

glabel func_800AF050
/* AFC50 800AF050 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* AFC54 800AF054 AFB10014 */  sw         $s1, 0x14($sp)
/* AFC58 800AF058 8FB1004C */  lw         $s1, 0x4c($sp)
/* AFC5C 800AF05C F7B40028 */  sdc1       $f20, 0x28($sp)
/* AFC60 800AF060 4485A000 */  mtc1       $a1, $f20
/* AFC64 800AF064 F7B60030 */  sdc1       $f22, 0x30($sp)
/* AFC68 800AF068 4487B000 */  mtc1       $a3, $f22
/* AFC6C 800AF06C AFB20018 */  sw         $s2, 0x18($sp)
/* AFC70 800AF070 00809021 */  addu       $s2, $a0, $zero
/* AFC74 800AF074 AFB00010 */  sw         $s0, 0x10($sp)
/* AFC78 800AF078 8FB00048 */  lw         $s0, 0x48($sp)
/* AFC7C 800AF07C 00C02821 */  addu       $a1, $a2, $zero
/* AFC80 800AF080 AFB3001C */  sw         $s3, 0x1c($sp)
/* AFC84 800AF084 8FB30050 */  lw         $s3, 0x50($sp)
/* AFC88 800AF088 26460004 */  addiu      $a2, $s2, 4
/* AFC8C 800AF08C AFBF0020 */  sw         $ra, 0x20($sp)
/* AFC90 800AF090 0C02AB26 */  jal        Vec3A_BsubC
/* AFC94 800AF094 02202021 */   addu      $a0, $s1, $zero
/* AFC98 800AF098 0C02ABBB */  jal        vec3_normalize
/* AFC9C 800AF09C 02202021 */   addu      $a0, $s1, $zero
/* AFCA0 800AF0A0 46160101 */  sub.s      $f4, $f0, $f22
/* AFCA4 800AF0A4 4604A03C */  c.lt.s     $f20, $f4
/* AFCA8 800AF0A8 00000000 */  nop
/* AFCAC 800AF0AC 45010012 */  bc1t       .L800AF0F8
/* AFCB0 800AF0B0 E6040000 */   swc1      $f4, ($s0)
/* AFCB4 800AF0B4 C6220000 */  lwc1       $f2, ($s1)
/* AFCB8 800AF0B8 46041082 */  mul.s      $f2, $f2, $f4
/* AFCBC 800AF0BC C6400004 */  lwc1       $f0, 4($s2)
/* AFCC0 800AF0C0 46020000 */  add.s      $f0, $f0, $f2
/* AFCC4 800AF0C4 E6600000 */  swc1       $f0, ($s3)
/* AFCC8 800AF0C8 C6220004 */  lwc1       $f2, 4($s1)
/* AFCCC 800AF0CC 46041082 */  mul.s      $f2, $f2, $f4
/* AFCD0 800AF0D0 C6400008 */  lwc1       $f0, 8($s2)
/* AFCD4 800AF0D4 46020000 */  add.s      $f0, $f0, $f2
/* AFCD8 800AF0D8 E6600004 */  swc1       $f0, 4($s3)
/* AFCDC 800AF0DC C6220008 */  lwc1       $f2, 8($s1)
/* AFCE0 800AF0E0 46041082 */  mul.s      $f2, $f2, $f4
/* AFCE4 800AF0E4 C640000C */  lwc1       $f0, 0xc($s2)
/* AFCE8 800AF0E8 46020000 */  add.s      $f0, $f0, $f2
/* AFCEC 800AF0EC 24020001 */  addiu      $v0, $zero, 1
/* AFCF0 800AF0F0 0802BC3F */  j          .L800AF0FC
/* AFCF4 800AF0F4 E6600008 */   swc1      $f0, 8($s3)
.L800AF0F8:
/* AFCF8 800AF0F8 00001021 */  addu       $v0, $zero, $zero
.L800AF0FC:
/* AFCFC 800AF0FC 8FBF0020 */  lw         $ra, 0x20($sp)
/* AFD00 800AF100 8FB3001C */  lw         $s3, 0x1c($sp)
/* AFD04 800AF104 8FB20018 */  lw         $s2, 0x18($sp)
/* AFD08 800AF108 8FB10014 */  lw         $s1, 0x14($sp)
/* AFD0C 800AF10C 8FB00010 */  lw         $s0, 0x10($sp)
/* AFD10 800AF110 D7B60030 */  ldc1       $f22, 0x30($sp)
/* AFD14 800AF114 D7B40028 */  ldc1       $f20, 0x28($sp)
/* AFD18 800AF118 03E00008 */  jr         $ra
/* AFD1C 800AF11C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800AF120
/* AFD20 800AF120 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* AFD24 800AF124 AFB10014 */  sw         $s1, 0x14($sp)
/* AFD28 800AF128 8FB1004C */  lw         $s1, 0x4c($sp)
/* AFD2C 800AF12C F7B40028 */  sdc1       $f20, 0x28($sp)
/* AFD30 800AF130 4485A000 */  mtc1       $a1, $f20
/* AFD34 800AF134 F7B60030 */  sdc1       $f22, 0x30($sp)
/* AFD38 800AF138 4487B000 */  mtc1       $a3, $f22
/* AFD3C 800AF13C AFB20018 */  sw         $s2, 0x18($sp)
/* AFD40 800AF140 00809021 */  addu       $s2, $a0, $zero
/* AFD44 800AF144 AFB00010 */  sw         $s0, 0x10($sp)
/* AFD48 800AF148 8FB00048 */  lw         $s0, 0x48($sp)
/* AFD4C 800AF14C 00C02821 */  addu       $a1, $a2, $zero
/* AFD50 800AF150 AFB3001C */  sw         $s3, 0x1c($sp)
/* AFD54 800AF154 8FB30050 */  lw         $s3, 0x50($sp)
/* AFD58 800AF158 26460004 */  addiu      $a2, $s2, 4
/* AFD5C 800AF15C AFBF0020 */  sw         $ra, 0x20($sp)
/* AFD60 800AF160 0C02AB26 */  jal        Vec3A_BsubC
/* AFD64 800AF164 02202021 */   addu      $a0, $s1, $zero
/* AFD68 800AF168 02202021 */  addu       $a0, $s1, $zero
/* AFD6C 800AF16C 0C02ABBB */  jal        vec3_normalize
/* AFD70 800AF170 AE200004 */   sw        $zero, 4($s1)
/* AFD74 800AF174 46160101 */  sub.s      $f4, $f0, $f22
/* AFD78 800AF178 4604A03C */  c.lt.s     $f20, $f4
/* AFD7C 800AF17C 00000000 */  nop
/* AFD80 800AF180 45010012 */  bc1t       .L800AF1CC
/* AFD84 800AF184 E6040000 */   swc1      $f4, ($s0)
/* AFD88 800AF188 C6220000 */  lwc1       $f2, ($s1)
/* AFD8C 800AF18C 46041082 */  mul.s      $f2, $f2, $f4
/* AFD90 800AF190 C6400004 */  lwc1       $f0, 4($s2)
/* AFD94 800AF194 46020000 */  add.s      $f0, $f0, $f2
/* AFD98 800AF198 E6600000 */  swc1       $f0, ($s3)
/* AFD9C 800AF19C C6220004 */  lwc1       $f2, 4($s1)
/* AFDA0 800AF1A0 46041082 */  mul.s      $f2, $f2, $f4
/* AFDA4 800AF1A4 C6400008 */  lwc1       $f0, 8($s2)
/* AFDA8 800AF1A8 46020000 */  add.s      $f0, $f0, $f2
/* AFDAC 800AF1AC E6600004 */  swc1       $f0, 4($s3)
/* AFDB0 800AF1B0 C6220008 */  lwc1       $f2, 8($s1)
/* AFDB4 800AF1B4 46041082 */  mul.s      $f2, $f2, $f4
/* AFDB8 800AF1B8 C640000C */  lwc1       $f0, 0xc($s2)
/* AFDBC 800AF1BC 46020000 */  add.s      $f0, $f0, $f2
/* AFDC0 800AF1C0 24020001 */  addiu      $v0, $zero, 1
/* AFDC4 800AF1C4 0802BC74 */  j          .L800AF1D0
/* AFDC8 800AF1C8 E6600008 */   swc1      $f0, 8($s3)
.L800AF1CC:
/* AFDCC 800AF1CC 00001021 */  addu       $v0, $zero, $zero
.L800AF1D0:
/* AFDD0 800AF1D0 8FBF0020 */  lw         $ra, 0x20($sp)
/* AFDD4 800AF1D4 8FB3001C */  lw         $s3, 0x1c($sp)
/* AFDD8 800AF1D8 8FB20018 */  lw         $s2, 0x18($sp)
/* AFDDC 800AF1DC 8FB10014 */  lw         $s1, 0x14($sp)
/* AFDE0 800AF1E0 8FB00010 */  lw         $s0, 0x10($sp)
/* AFDE4 800AF1E4 D7B60030 */  ldc1       $f22, 0x30($sp)
/* AFDE8 800AF1E8 D7B40028 */  ldc1       $f20, 0x28($sp)
/* AFDEC 800AF1EC 03E00008 */  jr         $ra
/* AFDF0 800AF1F0 27BD0038 */   addiu     $sp, $sp, 0x38
/* AFDF4 800AF1F4 00000000 */  nop
/* AFDF8 800AF1F8 00000000 */  nop
/* AFDFC 800AF1FC 00000000 */  nop
