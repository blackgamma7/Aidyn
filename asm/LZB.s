.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel decompress_LZB
/* AAF90 800AA390 00805821 */  addu       $t3, $a0, $zero
/* AAF94 800AA394 00004021 */  addu       $t0, $zero, $zero
/* AAF98 800AA398 00004821 */  addu       $t1, $zero, $zero
/* AAF9C 800AA39C 00006821 */  addu       $t5, $zero, $zero
/* AAFA0 800AA3A0 240E0001 */  addiu      $t6, $zero, 1
.L800AA3A4:
/* AAFA4 800AA3A4 00084040 */  sll        $t0, $t0, 1
.L800AA3A8:
/* AAFA8 800AA3A8 310200FF */  andi       $v0, $t0, 0xff
/* AAFAC 800AA3AC 10400006 */  beqz       $v0, .L800AA3C8
/* AAFB0 800AA3B0 00081202 */   srl       $v0, $t0, 8
/* AAFB4 800AA3B4 30420001 */  andi       $v0, $v0, 1
/* AAFB8 800AA3B8 1440000B */  bnez       $v0, .L800AA3E8
/* AAFBC 800AA3BC 01691021 */   addu      $v0, $t3, $t1
/* AAFC0 800AA3C0 0802A909 */  j          .L800AA424
/* AAFC4 800AA3C4 240A0001 */   addiu     $t2, $zero, 1
.L800AA3C8:
/* AAFC8 800AA3C8 01691821 */  addu       $v1, $t3, $t1
/* AAFCC 800AA3CC 90620000 */  lbu        $v0, ($v1)
/* AAFD0 800AA3D0 00021040 */  sll        $v0, $v0, 1
/* AAFD4 800AA3D4 24480001 */  addiu      $t0, $v0, 1
/* AAFD8 800AA3D8 00021202 */  srl        $v0, $v0, 8
/* AAFDC 800AA3DC 10400008 */  beqz       $v0, .L800AA400
/* AAFE0 800AA3E0 25290001 */   addiu     $t1, $t1, 1
/* AAFE4 800AA3E4 01691021 */  addu       $v0, $t3, $t1
.L800AA3E8:
/* AAFE8 800AA3E8 25290001 */  addiu      $t1, $t1, 1
/* AAFEC 800AA3EC 90430000 */  lbu        $v1, ($v0)
/* AAFF0 800AA3F0 25AD0001 */  addiu      $t5, $t5, 1
/* AAFF4 800AA3F4 A0C30000 */  sb         $v1, ($a2)
/* AAFF8 800AA3F8 0802A8E9 */  j          .L800AA3A4
/* AAFFC 800AA3FC 24C60001 */   addiu     $a2, $a2, 1
.L800AA400:
/* AB000 800AA400 0802A909 */  j          .L800AA424
/* AB004 800AA404 240A0001 */   addiu     $t2, $zero, 1
.L800AA408:
/* AB008 800AA408 01691821 */  addu       $v1, $t3, $t1
/* AB00C 800AA40C 90620000 */  lbu        $v0, ($v1)
/* AB010 800AA410 00021040 */  sll        $v0, $v0, 1
/* AB014 800AA414 24480001 */  addiu      $t0, $v0, 1
/* AB018 800AA418 00021202 */  srl        $v0, $v0, 8
/* AB01C 800AA41C 14400016 */  bnez       $v0, .L800AA478
/* AB020 800AA420 25290001 */   addiu     $t1, $t1, 1
.L800AA424:
/* AB024 800AA424 00084040 */  sll        $t0, $t0, 1
.L800AA428:
/* AB028 800AA428 310200FF */  andi       $v0, $t0, 0xff
/* AB02C 800AA42C 10400004 */  beqz       $v0, .L800AA440
/* AB030 800AA430 000A2040 */   sll       $a0, $t2, 1
/* AB034 800AA434 00081202 */  srl        $v0, $t0, 8
/* AB038 800AA438 0802A916 */  j          .L800AA458
/* AB03C 800AA43C 30420001 */   andi      $v0, $v0, 1
.L800AA440:
/* AB040 800AA440 01691821 */  addu       $v1, $t3, $t1
/* AB044 800AA444 90620000 */  lbu        $v0, ($v1)
/* AB048 800AA448 25290001 */  addiu      $t1, $t1, 1
/* AB04C 800AA44C 00021040 */  sll        $v0, $v0, 1
/* AB050 800AA450 24480001 */  addiu      $t0, $v0, 1
/* AB054 800AA454 00021202 */  srl        $v0, $v0, 8
.L800AA458:
/* AB058 800AA458 00825021 */  addu       $t2, $a0, $v0
/* AB05C 800AA45C 00084040 */  sll        $t0, $t0, 1
/* AB060 800AA460 310200FF */  andi       $v0, $t0, 0xff
/* AB064 800AA464 1040FFE8 */  beqz       $v0, .L800AA408
/* AB068 800AA468 00081202 */   srl       $v0, $t0, 8
/* AB06C 800AA46C 30420001 */  andi       $v0, $v0, 1
/* AB070 800AA470 5040FFED */  beql       $v0, $zero, .L800AA428
/* AB074 800AA474 00084040 */   sll       $t0, $t0, 1
.L800AA478:
/* AB078 800AA478 24020002 */  addiu      $v0, $zero, 2
/* AB07C 800AA47C 15420003 */  bne        $t2, $v0, .L800AA48C
/* AB080 800AA480 01691821 */   addu      $v1, $t3, $t1
/* AB084 800AA484 0802A92C */  j          .L800AA4B0
/* AB088 800AA488 01C05021 */   addu      $t2, $t6, $zero
.L800AA48C:
/* AB08C 800AA48C 2542FFFD */  addiu      $v0, $t2, -3
/* AB090 800AA490 90640000 */  lbu        $a0, ($v1)
/* AB094 800AA494 00021200 */  sll        $v0, $v0, 8
/* AB098 800AA498 2403FFFF */  addiu      $v1, $zero, -1
/* AB09C 800AA49C 00445021 */  addu       $t2, $v0, $a0
/* AB0A0 800AA4A0 1143004F */  beq        $t2, $v1, .L800AA5E0
/* AB0A4 800AA4A4 25290001 */   addiu     $t1, $t1, 1
/* AB0A8 800AA4A8 254A0001 */  addiu      $t2, $t2, 1
/* AB0AC 800AA4AC 01407021 */  addu       $t6, $t2, $zero
.L800AA4B0:
/* AB0B0 800AA4B0 00084040 */  sll        $t0, $t0, 1
/* AB0B4 800AA4B4 310200FF */  andi       $v0, $t0, 0xff
/* AB0B8 800AA4B8 10400003 */  beqz       $v0, .L800AA4C8
/* AB0BC 800AA4BC 00081202 */   srl       $v0, $t0, 8
/* AB0C0 800AA4C0 0802A938 */  j          .L800AA4E0
/* AB0C4 800AA4C4 30440001 */   andi      $a0, $v0, 1
.L800AA4C8:
/* AB0C8 800AA4C8 01691021 */  addu       $v0, $t3, $t1
/* AB0CC 800AA4CC 90430000 */  lbu        $v1, ($v0)
/* AB0D0 800AA4D0 25290001 */  addiu      $t1, $t1, 1
/* AB0D4 800AA4D4 00031840 */  sll        $v1, $v1, 1
/* AB0D8 800AA4D8 24680001 */  addiu      $t0, $v1, 1
/* AB0DC 800AA4DC 00032202 */  srl        $a0, $v1, 8
.L800AA4E0:
/* AB0E0 800AA4E0 00084040 */  sll        $t0, $t0, 1
/* AB0E4 800AA4E4 310200FF */  andi       $v0, $t0, 0xff
/* AB0E8 800AA4E8 10400004 */  beqz       $v0, .L800AA4FC
/* AB0EC 800AA4EC 00042040 */   sll       $a0, $a0, 1
/* AB0F0 800AA4F0 00081202 */  srl        $v0, $t0, 8
/* AB0F4 800AA4F4 0802A945 */  j          .L800AA514
/* AB0F8 800AA4F8 30420001 */   andi      $v0, $v0, 1
.L800AA4FC:
/* AB0FC 800AA4FC 01691821 */  addu       $v1, $t3, $t1
/* AB100 800AA500 90620000 */  lbu        $v0, ($v1)
/* AB104 800AA504 25290001 */  addiu      $t1, $t1, 1
/* AB108 800AA508 00021040 */  sll        $v0, $v0, 1
/* AB10C 800AA50C 24480001 */  addiu      $t0, $v0, 1
/* AB110 800AA510 00021202 */  srl        $v0, $v0, 8
.L800AA514:
/* AB114 800AA514 00822021 */  addu       $a0, $a0, $v0
/* AB118 800AA518 14800020 */  bnez       $a0, .L800AA59C
/* AB11C 800AA51C 2D4C0D01 */   sltiu     $t4, $t2, 0xd01
/* AB120 800AA520 0802A951 */  j          .L800AA544
/* AB124 800AA524 24040001 */   addiu     $a0, $zero, 1
.L800AA528:
/* AB128 800AA528 01691821 */  addu       $v1, $t3, $t1
/* AB12C 800AA52C 90620000 */  lbu        $v0, ($v1)
/* AB130 800AA530 00021040 */  sll        $v0, $v0, 1
/* AB134 800AA534 24480001 */  addiu      $t0, $v0, 1
/* AB138 800AA538 00021202 */  srl        $v0, $v0, 8
/* AB13C 800AA53C 14400016 */  bnez       $v0, .L800AA598
/* AB140 800AA540 25290001 */   addiu     $t1, $t1, 1
.L800AA544:
/* AB144 800AA544 00084040 */  sll        $t0, $t0, 1
.L800AA548:
/* AB148 800AA548 310200FF */  andi       $v0, $t0, 0xff
/* AB14C 800AA54C 10400004 */  beqz       $v0, .L800AA560
/* AB150 800AA550 00042040 */   sll       $a0, $a0, 1
/* AB154 800AA554 00081202 */  srl        $v0, $t0, 8
/* AB158 800AA558 0802A95E */  j          .L800AA578
/* AB15C 800AA55C 30420001 */   andi      $v0, $v0, 1
.L800AA560:
/* AB160 800AA560 01691821 */  addu       $v1, $t3, $t1
/* AB164 800AA564 90620000 */  lbu        $v0, ($v1)
/* AB168 800AA568 25290001 */  addiu      $t1, $t1, 1
/* AB16C 800AA56C 00021040 */  sll        $v0, $v0, 1
/* AB170 800AA570 24480001 */  addiu      $t0, $v0, 1
/* AB174 800AA574 00021202 */  srl        $v0, $v0, 8
.L800AA578:
/* AB178 800AA578 00822021 */  addu       $a0, $a0, $v0
/* AB17C 800AA57C 00084040 */  sll        $t0, $t0, 1
/* AB180 800AA580 310200FF */  andi       $v0, $t0, 0xff
/* AB184 800AA584 1040FFE8 */  beqz       $v0, .L800AA528
/* AB188 800AA588 00081202 */   srl       $v0, $t0, 8
/* AB18C 800AA58C 30420001 */  andi       $v0, $v0, 1
/* AB190 800AA590 5040FFED */  beql       $v0, $zero, .L800AA548
/* AB194 800AA594 00084040 */   sll       $t0, $t0, 1
.L800AA598:
/* AB198 800AA598 24840002 */  addiu      $a0, $a0, 2
.L800AA59C:
/* AB19C 800AA59C 39820001 */  xori       $v0, $t4, 1
/* AB1A0 800AA5A0 00822021 */  addu       $a0, $a0, $v0
/* AB1A4 800AA5A4 00CA1823 */  subu       $v1, $a2, $t2
/* AB1A8 800AA5A8 90620000 */  lbu        $v0, ($v1)
/* AB1AC 800AA5AC 24630001 */  addiu      $v1, $v1, 1
/* AB1B0 800AA5B0 25AD0001 */  addiu      $t5, $t5, 1
/* AB1B4 800AA5B4 A0C20000 */  sb         $v0, ($a2)
/* AB1B8 800AA5B8 24C60001 */  addiu      $a2, $a2, 1
.L800AA5BC:
/* AB1BC 800AA5BC 90620000 */  lbu        $v0, ($v1)
/* AB1C0 800AA5C0 24630001 */  addiu      $v1, $v1, 1
/* AB1C4 800AA5C4 25AD0001 */  addiu      $t5, $t5, 1
/* AB1C8 800AA5C8 2484FFFF */  addiu      $a0, $a0, -1
/* AB1CC 800AA5CC A0C20000 */  sb         $v0, ($a2)
/* AB1D0 800AA5D0 1480FFFA */  bnez       $a0, .L800AA5BC
/* AB1D4 800AA5D4 24C60001 */   addiu     $a2, $a2, 1
/* AB1D8 800AA5D8 0802A8EA */  j          .L800AA3A8
/* AB1DC 800AA5DC 00084040 */   sll       $t0, $t0, 1
.L800AA5E0:
/* AB1E0 800AA5E0 11250006 */  beq        $t1, $a1, .L800AA5FC
/* AB1E4 800AA5E4 ACED0000 */   sw        $t5, ($a3)
/* AB1E8 800AA5E8 0125102B */  sltu       $v0, $t1, $a1
/* AB1EC 800AA5EC 10400004 */  beqz       $v0, .L800AA600
/* AB1F0 800AA5F0 2403FF37 */   addiu     $v1, $zero, -0xc9
/* AB1F4 800AA5F4 0802A980 */  j          .L800AA600
/* AB1F8 800AA5F8 2403FF33 */   addiu     $v1, $zero, -0xcd
.L800AA5FC:
/* AB1FC 800AA5FC 00001821 */  addu       $v1, $zero, $zero
.L800AA600:
/* AB200 800AA600 03E00008 */  jr         $ra
/* AB204 800AA604 00601021 */   addu      $v0, $v1, $zero

glabel func_800AA608
/* AB208 800AA608 00004021 */  addu       $t0, $zero, $zero
/* AB20C 800AA60C 00005821 */  addu       $t3, $zero, $zero
/* AB210 800AA610 00006821 */  addu       $t5, $zero, $zero
/* AB214 800AA614 240E0001 */  addiu      $t6, $zero, 1
/* AB218 800AA618 00807821 */  addu       $t7, $a0, $zero
/* AB21C 800AA61C 01E04821 */  addu       $t1, $t7, $zero
.L800AA620:
/* AB220 800AA620 00084040 */  sll        $t0, $t0, 1
.L800AA624:
/* AB224 800AA624 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB228 800AA628 10400006 */  beqz       $v0, .L800AA644
/* AB22C 800AA62C 00081402 */   srl       $v0, $t0, 0x10
/* AB230 800AA630 30420001 */  andi       $v0, $v0, 1
/* AB234 800AA634 5440000F */  bnel       $v0, $zero, .L800AA674
/* AB238 800AA638 91220000 */   lbu       $v0, ($t1)
/* AB23C 800AA63C 0802A9A4 */  j          .L800AA690
/* AB240 800AA640 240A0001 */   addiu     $t2, $zero, 1
.L800AA644:
/* AB244 800AA644 25290002 */  addiu      $t1, $t1, 2
/* AB248 800AA648 9122FFFF */  lbu        $v0, -1($t1)
/* AB24C 800AA64C 9123FFFE */  lbu        $v1, -2($t1)
/* AB250 800AA650 00021200 */  sll        $v0, $v0, 8
/* AB254 800AA654 00621821 */  addu       $v1, $v1, $v0
/* AB258 800AA658 00031840 */  sll        $v1, $v1, 1
/* AB25C 800AA65C 24680001 */  addiu      $t0, $v1, 1
/* AB260 800AA660 00081402 */  srl        $v0, $t0, 0x10
/* AB264 800AA664 30420001 */  andi       $v0, $v0, 1
/* AB268 800AA668 10400008 */  beqz       $v0, .L800AA68C
/* AB26C 800AA66C 256B0002 */   addiu     $t3, $t3, 2
/* AB270 800AA670 91220000 */  lbu        $v0, ($t1)
.L800AA674:
/* AB274 800AA674 25290001 */  addiu      $t1, $t1, 1
/* AB278 800AA678 256B0001 */  addiu      $t3, $t3, 1
/* AB27C 800AA67C 25AD0001 */  addiu      $t5, $t5, 1
/* AB280 800AA680 A0C20000 */  sb         $v0, ($a2)
/* AB284 800AA684 0802A988 */  j          .L800AA620
/* AB288 800AA688 24C60001 */   addiu     $a2, $a2, 1
.L800AA68C:
/* AB28C 800AA68C 240A0001 */  addiu      $t2, $zero, 1
.L800AA690:
/* AB290 800AA690 0802A9AF */  j          .L800AA6BC
/* AB294 800AA694 016F2021 */   addu      $a0, $t3, $t7
.L800AA698:
/* AB298 800AA698 25290002 */  addiu      $t1, $t1, 2
/* AB29C 800AA69C 256B0002 */  addiu      $t3, $t3, 2
/* AB2A0 800AA6A0 9082FFFF */  lbu        $v0, -1($a0)
/* AB2A4 800AA6A4 9083FFFE */  lbu        $v1, -2($a0)
/* AB2A8 800AA6A8 00021200 */  sll        $v0, $v0, 8
/* AB2AC 800AA6AC 00621821 */  addu       $v1, $v1, $v0
/* AB2B0 800AA6B0 00031840 */  sll        $v1, $v1, 1
/* AB2B4 800AA6B4 0802A9C3 */  j          .L800AA70C
/* AB2B8 800AA6B8 24680001 */   addiu     $t0, $v1, 1
.L800AA6BC:
/* AB2BC 800AA6BC 00084040 */  sll        $t0, $t0, 1
/* AB2C0 800AA6C0 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB2C4 800AA6C4 1440000A */  bnez       $v0, .L800AA6F0
/* AB2C8 800AA6C8 000A5040 */   sll       $t2, $t2, 1
/* AB2CC 800AA6CC 24840002 */  addiu      $a0, $a0, 2
/* AB2D0 800AA6D0 25290002 */  addiu      $t1, $t1, 2
/* AB2D4 800AA6D4 256B0002 */  addiu      $t3, $t3, 2
/* AB2D8 800AA6D8 9082FFFF */  lbu        $v0, -1($a0)
/* AB2DC 800AA6DC 9083FFFE */  lbu        $v1, -2($a0)
/* AB2E0 800AA6E0 00021200 */  sll        $v0, $v0, 8
/* AB2E4 800AA6E4 00621821 */  addu       $v1, $v1, $v0
/* AB2E8 800AA6E8 00031840 */  sll        $v1, $v1, 1
/* AB2EC 800AA6EC 24680001 */  addiu      $t0, $v1, 1
.L800AA6F0:
/* AB2F0 800AA6F0 00081402 */  srl        $v0, $t0, 0x10
/* AB2F4 800AA6F4 30420001 */  andi       $v0, $v0, 1
/* AB2F8 800AA6F8 01425021 */  addu       $t2, $t2, $v0
/* AB2FC 800AA6FC 00084040 */  sll        $t0, $t0, 1
/* AB300 800AA700 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB304 800AA704 5040FFE4 */  beql       $v0, $zero, .L800AA698
/* AB308 800AA708 24840002 */   addiu     $a0, $a0, 2
.L800AA70C:
/* AB30C 800AA70C 00081402 */  srl        $v0, $t0, 0x10
/* AB310 800AA710 30420001 */  andi       $v0, $v0, 1
/* AB314 800AA714 1040FFE9 */  beqz       $v0, .L800AA6BC
/* AB318 800AA718 24020002 */   addiu     $v0, $zero, 2
/* AB31C 800AA71C 55420003 */  bnel       $t2, $v0, .L800AA72C
/* AB320 800AA720 91220000 */   lbu       $v0, ($t1)
/* AB324 800AA724 0802A9D4 */  j          .L800AA750
/* AB328 800AA728 01C05021 */   addu      $t2, $t6, $zero
.L800AA72C:
/* AB32C 800AA72C 25290001 */  addiu      $t1, $t1, 1
/* AB330 800AA730 2543FFFD */  addiu      $v1, $t2, -3
/* AB334 800AA734 00031A00 */  sll        $v1, $v1, 8
/* AB338 800AA738 2404FFFF */  addiu      $a0, $zero, -1
/* AB33C 800AA73C 00625021 */  addu       $t2, $v1, $v0
/* AB340 800AA740 11440055 */  beq        $t2, $a0, .L800AA898
/* AB344 800AA744 256B0001 */   addiu     $t3, $t3, 1
/* AB348 800AA748 254A0001 */  addiu      $t2, $t2, 1
/* AB34C 800AA74C 01407021 */  addu       $t6, $t2, $zero
.L800AA750:
/* AB350 800AA750 00084040 */  sll        $t0, $t0, 1
/* AB354 800AA754 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB358 800AA758 1440000A */  bnez       $v0, .L800AA784
/* AB35C 800AA75C 00081402 */   srl       $v0, $t0, 0x10
/* AB360 800AA760 25290002 */  addiu      $t1, $t1, 2
/* AB364 800AA764 256B0002 */  addiu      $t3, $t3, 2
/* AB368 800AA768 9122FFFF */  lbu        $v0, -1($t1)
/* AB36C 800AA76C 9123FFFE */  lbu        $v1, -2($t1)
/* AB370 800AA770 00021200 */  sll        $v0, $v0, 8
/* AB374 800AA774 00621821 */  addu       $v1, $v1, $v0
/* AB378 800AA778 00031840 */  sll        $v1, $v1, 1
/* AB37C 800AA77C 24680001 */  addiu      $t0, $v1, 1
/* AB380 800AA780 00081402 */  srl        $v0, $t0, 0x10
.L800AA784:
/* AB384 800AA784 30440001 */  andi       $a0, $v0, 1
/* AB388 800AA788 00084040 */  sll        $t0, $t0, 1
/* AB38C 800AA78C 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB390 800AA790 14400009 */  bnez       $v0, .L800AA7B8
/* AB394 800AA794 00042040 */   sll       $a0, $a0, 1
/* AB398 800AA798 25290002 */  addiu      $t1, $t1, 2
/* AB39C 800AA79C 256B0002 */  addiu      $t3, $t3, 2
/* AB3A0 800AA7A0 9122FFFF */  lbu        $v0, -1($t1)
/* AB3A4 800AA7A4 9123FFFE */  lbu        $v1, -2($t1)
/* AB3A8 800AA7A8 00021200 */  sll        $v0, $v0, 8
/* AB3AC 800AA7AC 00621821 */  addu       $v1, $v1, $v0
/* AB3B0 800AA7B0 00031840 */  sll        $v1, $v1, 1
/* AB3B4 800AA7B4 24680001 */  addiu      $t0, $v1, 1
.L800AA7B8:
/* AB3B8 800AA7B8 00081402 */  srl        $v0, $t0, 0x10
/* AB3BC 800AA7BC 30420001 */  andi       $v0, $v0, 1
/* AB3C0 800AA7C0 00822021 */  addu       $a0, $a0, $v0
/* AB3C4 800AA7C4 14800023 */  bnez       $a0, .L800AA854
/* AB3C8 800AA7C8 2D4C0D01 */   sltiu     $t4, $t2, 0xd01
/* AB3CC 800AA7CC 0802A9FD */  j          .L800AA7F4
/* AB3D0 800AA7D0 24040001 */   addiu     $a0, $zero, 1
.L800AA7D4:
/* AB3D4 800AA7D4 256B0002 */  addiu      $t3, $t3, 2
/* AB3D8 800AA7D8 9122FFFF */  lbu        $v0, -1($t1)
/* AB3DC 800AA7DC 9123FFFE */  lbu        $v1, -2($t1)
/* AB3E0 800AA7E0 00021200 */  sll        $v0, $v0, 8
/* AB3E4 800AA7E4 00621821 */  addu       $v1, $v1, $v0
/* AB3E8 800AA7E8 00031840 */  sll        $v1, $v1, 1
/* AB3EC 800AA7EC 0802AA10 */  j          .L800AA840
/* AB3F0 800AA7F0 24680001 */   addiu     $t0, $v1, 1
.L800AA7F4:
/* AB3F4 800AA7F4 00084040 */  sll        $t0, $t0, 1
.L800AA7F8:
/* AB3F8 800AA7F8 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB3FC 800AA7FC 14400009 */  bnez       $v0, .L800AA824
/* AB400 800AA800 00042040 */   sll       $a0, $a0, 1
/* AB404 800AA804 25290002 */  addiu      $t1, $t1, 2
/* AB408 800AA808 256B0002 */  addiu      $t3, $t3, 2
/* AB40C 800AA80C 9122FFFF */  lbu        $v0, -1($t1)
/* AB410 800AA810 9123FFFE */  lbu        $v1, -2($t1)
/* AB414 800AA814 00021200 */  sll        $v0, $v0, 8
/* AB418 800AA818 00621821 */  addu       $v1, $v1, $v0
/* AB41C 800AA81C 00031840 */  sll        $v1, $v1, 1
/* AB420 800AA820 24680001 */  addiu      $t0, $v1, 1
.L800AA824:
/* AB424 800AA824 00081402 */  srl        $v0, $t0, 0x10
/* AB428 800AA828 30420001 */  andi       $v0, $v0, 1
/* AB42C 800AA82C 00822021 */  addu       $a0, $a0, $v0
/* AB430 800AA830 00084040 */  sll        $t0, $t0, 1
/* AB434 800AA834 3102FFFF */  andi       $v0, $t0, 0xffff
/* AB438 800AA838 5040FFE6 */  beql       $v0, $zero, .L800AA7D4
/* AB43C 800AA83C 25290002 */   addiu     $t1, $t1, 2
.L800AA840:
/* AB440 800AA840 00081402 */  srl        $v0, $t0, 0x10
/* AB444 800AA844 30420001 */  andi       $v0, $v0, 1
/* AB448 800AA848 5040FFEB */  beql       $v0, $zero, .L800AA7F8
/* AB44C 800AA84C 00084040 */   sll       $t0, $t0, 1
/* AB450 800AA850 24840002 */  addiu      $a0, $a0, 2
.L800AA854:
/* AB454 800AA854 39820001 */  xori       $v0, $t4, 1
/* AB458 800AA858 00822021 */  addu       $a0, $a0, $v0
/* AB45C 800AA85C 00CA1823 */  subu       $v1, $a2, $t2
/* AB460 800AA860 90620000 */  lbu        $v0, ($v1)
/* AB464 800AA864 24630001 */  addiu      $v1, $v1, 1
/* AB468 800AA868 25AD0001 */  addiu      $t5, $t5, 1
/* AB46C 800AA86C A0C20000 */  sb         $v0, ($a2)
/* AB470 800AA870 24C60001 */  addiu      $a2, $a2, 1
.L800AA874:
/* AB474 800AA874 90620000 */  lbu        $v0, ($v1)
/* AB478 800AA878 24630001 */  addiu      $v1, $v1, 1
/* AB47C 800AA87C 25AD0001 */  addiu      $t5, $t5, 1
/* AB480 800AA880 2484FFFF */  addiu      $a0, $a0, -1
/* AB484 800AA884 A0C20000 */  sb         $v0, ($a2)
/* AB488 800AA888 1480FFFA */  bnez       $a0, .L800AA874
/* AB48C 800AA88C 24C60001 */   addiu     $a2, $a2, 1
/* AB490 800AA890 0802A989 */  j          .L800AA624
/* AB494 800AA894 00084040 */   sll       $t0, $t0, 1
.L800AA898:
/* AB498 800AA898 11650006 */  beq        $t3, $a1, .L800AA8B4
/* AB49C 800AA89C ACED0000 */   sw        $t5, ($a3)
/* AB4A0 800AA8A0 0165102B */  sltu       $v0, $t3, $a1
/* AB4A4 800AA8A4 10400004 */  beqz       $v0, .L800AA8B8
/* AB4A8 800AA8A8 2403FF37 */   addiu     $v1, $zero, -0xc9
/* AB4AC 800AA8AC 0802AA2E */  j          .L800AA8B8
/* AB4B0 800AA8B0 2403FF33 */   addiu     $v1, $zero, -0xcd
.L800AA8B4:
/* AB4B4 800AA8B4 00001821 */  addu       $v1, $zero, $zero
.L800AA8B8:
/* AB4B8 800AA8B8 03E00008 */  jr         $ra
/* AB4BC 800AA8BC 00601021 */   addu      $v0, $v1, $zero

glabel func_800AA8C0
/* AB4C0 800AA8C0 00A0C821 */  addu       $t9, $a1, $zero
/* AB4C4 800AA8C4 00005021 */  addu       $t2, $zero, $zero
/* AB4C8 800AA8C8 00002821 */  addu       $a1, $zero, $zero
/* AB4CC 800AA8CC 00006021 */  addu       $t4, $zero, $zero
/* AB4D0 800AA8D0 00007021 */  addu       $t6, $zero, $zero
/* AB4D4 800AA8D4 240F0001 */  addiu      $t7, $zero, 1
/* AB4D8 800AA8D8 0080C021 */  addu       $t8, $a0, $zero
/* AB4DC 800AA8DC 03004821 */  addu       $t1, $t8, $zero
.L800AA8E0:
/* AB4E0 800AA8E0 11400007 */  beqz       $t2, .L800AA900
/* AB4E4 800AA8E4 254AFFFF */   addiu     $t2, $t2, -1
/* AB4E8 800AA8E8 01451006 */  srlv       $v0, $a1, $t2
/* AB4EC 800AA8EC 30420001 */  andi       $v0, $v0, 1
/* AB4F0 800AA8F0 54400012 */  bnel       $v0, $zero, .L800AA93C
/* AB4F4 800AA8F4 91220000 */   lbu       $v0, ($t1)
/* AB4F8 800AA8F8 0802AA56 */  j          .L800AA958
/* AB4FC 800AA8FC 240B0001 */   addiu     $t3, $zero, 1
.L800AA900:
/* AB500 800AA900 240A001F */  addiu      $t2, $zero, 0x1f
/* AB504 800AA904 91240000 */  lbu        $a0, ($t1)
/* AB508 800AA908 91220001 */  lbu        $v0, 1($t1)
/* AB50C 800AA90C 91230002 */  lbu        $v1, 2($t1)
/* AB510 800AA910 91250003 */  lbu        $a1, 3($t1)
/* AB514 800AA914 25290004 */  addiu      $t1, $t1, 4
/* AB518 800AA918 00021200 */  sll        $v0, $v0, 8
/* AB51C 800AA91C 00822021 */  addu       $a0, $a0, $v0
/* AB520 800AA920 00031C00 */  sll        $v1, $v1, 0x10
/* AB524 800AA924 00832021 */  addu       $a0, $a0, $v1
/* AB528 800AA928 00052E00 */  sll        $a1, $a1, 0x18
/* AB52C 800AA92C 00852821 */  addu       $a1, $a0, $a1
/* AB530 800AA930 04A10008 */  bgez       $a1, .L800AA954
/* AB534 800AA934 258C0004 */   addiu     $t4, $t4, 4
/* AB538 800AA938 91220000 */  lbu        $v0, ($t1)
.L800AA93C:
/* AB53C 800AA93C 25290001 */  addiu      $t1, $t1, 1
/* AB540 800AA940 258C0001 */  addiu      $t4, $t4, 1
/* AB544 800AA944 25CE0001 */  addiu      $t6, $t6, 1
/* AB548 800AA948 A0C20000 */  sb         $v0, ($a2)
/* AB54C 800AA94C 0802AA38 */  j          .L800AA8E0
/* AB550 800AA950 24C60001 */   addiu     $a2, $a2, 1
.L800AA954:
/* AB554 800AA954 240B0001 */  addiu      $t3, $zero, 1
.L800AA958:
/* AB558 800AA958 0802AA67 */  j          .L800AA99C
/* AB55C 800AA95C 01984021 */   addu      $t0, $t4, $t8
.L800AA960:
/* AB560 800AA960 240A001F */  addiu      $t2, $zero, 0x1f
/* AB564 800AA964 91020000 */  lbu        $v0, ($t0)
/* AB568 800AA968 91030001 */  lbu        $v1, 1($t0)
/* AB56C 800AA96C 91040002 */  lbu        $a0, 2($t0)
/* AB570 800AA970 91050003 */  lbu        $a1, 3($t0)
/* AB574 800AA974 25080004 */  addiu      $t0, $t0, 4
/* AB578 800AA978 25290004 */  addiu      $t1, $t1, 4
/* AB57C 800AA97C 00031A00 */  sll        $v1, $v1, 8
/* AB580 800AA980 00431021 */  addu       $v0, $v0, $v1
/* AB584 800AA984 00042400 */  sll        $a0, $a0, 0x10
/* AB588 800AA988 00441021 */  addu       $v0, $v0, $a0
/* AB58C 800AA98C 00052E00 */  sll        $a1, $a1, 0x18
/* AB590 800AA990 00452821 */  addu       $a1, $v0, $a1
/* AB594 800AA994 04A0001D */  bltz       $a1, .L800AAA0C
/* AB598 800AA998 258C0004 */   addiu     $t4, $t4, 4
.L800AA99C:
/* AB59C 800AA99C 11400005 */  beqz       $t2, .L800AA9B4
/* AB5A0 800AA9A0 000B5840 */   sll       $t3, $t3, 1
/* AB5A4 800AA9A4 254AFFFF */  addiu      $t2, $t2, -1
/* AB5A8 800AA9A8 01451006 */  srlv       $v0, $a1, $t2
/* AB5AC 800AA9AC 0802AA7C */  j          .L800AA9F0
/* AB5B0 800AA9B0 30420001 */   andi      $v0, $v0, 1
.L800AA9B4:
/* AB5B4 800AA9B4 240A001F */  addiu      $t2, $zero, 0x1f
/* AB5B8 800AA9B8 91030000 */  lbu        $v1, ($t0)
/* AB5BC 800AA9BC 91020001 */  lbu        $v0, 1($t0)
/* AB5C0 800AA9C0 91040002 */  lbu        $a0, 2($t0)
/* AB5C4 800AA9C4 91050003 */  lbu        $a1, 3($t0)
/* AB5C8 800AA9C8 25080004 */  addiu      $t0, $t0, 4
/* AB5CC 800AA9CC 25290004 */  addiu      $t1, $t1, 4
/* AB5D0 800AA9D0 258C0004 */  addiu      $t4, $t4, 4
/* AB5D4 800AA9D4 00021200 */  sll        $v0, $v0, 8
/* AB5D8 800AA9D8 00621821 */  addu       $v1, $v1, $v0
/* AB5DC 800AA9DC 00042400 */  sll        $a0, $a0, 0x10
/* AB5E0 800AA9E0 00641821 */  addu       $v1, $v1, $a0
/* AB5E4 800AA9E4 00052E00 */  sll        $a1, $a1, 0x18
/* AB5E8 800AA9E8 00652821 */  addu       $a1, $v1, $a1
/* AB5EC 800AA9EC 000517C2 */  srl        $v0, $a1, 0x1f
.L800AA9F0:
/* AB5F0 800AA9F0 1140FFDB */  beqz       $t2, .L800AA960
/* AB5F4 800AA9F4 01625821 */   addu      $t3, $t3, $v0
/* AB5F8 800AA9F8 254AFFFF */  addiu      $t2, $t2, -1
/* AB5FC 800AA9FC 01451006 */  srlv       $v0, $a1, $t2
/* AB600 800AAA00 30420001 */  andi       $v0, $v0, 1
/* AB604 800AAA04 1040FFE5 */  beqz       $v0, .L800AA99C
/* AB608 800AAA08 00000000 */   nop
.L800AAA0C:
/* AB60C 800AAA0C 24020002 */  addiu      $v0, $zero, 2
/* AB610 800AAA10 55620003 */  bnel       $t3, $v0, .L800AAA20
/* AB614 800AAA14 91220000 */   lbu       $v0, ($t1)
/* AB618 800AAA18 0802AA91 */  j          .L800AAA44
/* AB61C 800AAA1C 01E05821 */   addu      $t3, $t7, $zero
.L800AAA20:
/* AB620 800AAA20 25290001 */  addiu      $t1, $t1, 1
/* AB624 800AAA24 2563FFFD */  addiu      $v1, $t3, -3
/* AB628 800AAA28 00031A00 */  sll        $v1, $v1, 8
/* AB62C 800AAA2C 2404FFFF */  addiu      $a0, $zero, -1
/* AB630 800AAA30 00625821 */  addu       $t3, $v1, $v0
/* AB634 800AAA34 1164006A */  beq        $t3, $a0, .L800AABE0
/* AB638 800AAA38 258C0001 */   addiu     $t4, $t4, 1
/* AB63C 800AAA3C 256B0001 */  addiu      $t3, $t3, 1
/* AB640 800AAA40 01607821 */  addu       $t7, $t3, $zero
.L800AAA44:
/* AB644 800AAA44 11400004 */  beqz       $t2, .L800AAA58
/* AB648 800AAA48 254AFFFF */   addiu     $t2, $t2, -1
/* AB64C 800AAA4C 01451006 */  srlv       $v0, $a1, $t2
/* AB650 800AAA50 0802AAA4 */  j          .L800AAA90
/* AB654 800AAA54 30480001 */   andi      $t0, $v0, 1
.L800AAA58:
/* AB658 800AAA58 240A001F */  addiu      $t2, $zero, 0x1f
/* AB65C 800AAA5C 91240000 */  lbu        $a0, ($t1)
/* AB660 800AAA60 91220001 */  lbu        $v0, 1($t1)
/* AB664 800AAA64 91230002 */  lbu        $v1, 2($t1)
/* AB668 800AAA68 91250003 */  lbu        $a1, 3($t1)
/* AB66C 800AAA6C 25290004 */  addiu      $t1, $t1, 4
/* AB670 800AAA70 258C0004 */  addiu      $t4, $t4, 4
/* AB674 800AAA74 00021200 */  sll        $v0, $v0, 8
/* AB678 800AAA78 00822021 */  addu       $a0, $a0, $v0
/* AB67C 800AAA7C 00031C00 */  sll        $v1, $v1, 0x10
/* AB680 800AAA80 00832021 */  addu       $a0, $a0, $v1
/* AB684 800AAA84 00052E00 */  sll        $a1, $a1, 0x18
/* AB688 800AAA88 00852821 */  addu       $a1, $a0, $a1
/* AB68C 800AAA8C 000547C2 */  srl        $t0, $a1, 0x1f
.L800AAA90:
/* AB690 800AAA90 11400005 */  beqz       $t2, .L800AAAA8
/* AB694 800AAA94 00084040 */   sll       $t0, $t0, 1
/* AB698 800AAA98 254AFFFF */  addiu      $t2, $t2, -1
/* AB69C 800AAA9C 01451006 */  srlv       $v0, $a1, $t2
/* AB6A0 800AAAA0 0802AAB8 */  j          .L800AAAE0
/* AB6A4 800AAAA4 30420001 */   andi      $v0, $v0, 1
.L800AAAA8:
/* AB6A8 800AAAA8 240A001F */  addiu      $t2, $zero, 0x1f
/* AB6AC 800AAAAC 91240000 */  lbu        $a0, ($t1)
/* AB6B0 800AAAB0 91220001 */  lbu        $v0, 1($t1)
/* AB6B4 800AAAB4 91230002 */  lbu        $v1, 2($t1)
/* AB6B8 800AAAB8 91250003 */  lbu        $a1, 3($t1)
/* AB6BC 800AAABC 25290004 */  addiu      $t1, $t1, 4
/* AB6C0 800AAAC0 258C0004 */  addiu      $t4, $t4, 4
/* AB6C4 800AAAC4 00021200 */  sll        $v0, $v0, 8
/* AB6C8 800AAAC8 00822021 */  addu       $a0, $a0, $v0
/* AB6CC 800AAACC 00031C00 */  sll        $v1, $v1, 0x10
/* AB6D0 800AAAD0 00832021 */  addu       $a0, $a0, $v1
/* AB6D4 800AAAD4 00052E00 */  sll        $a1, $a1, 0x18
/* AB6D8 800AAAD8 00852821 */  addu       $a1, $a0, $a1
/* AB6DC 800AAADC 000517C2 */  srl        $v0, $a1, 0x1f
.L800AAAE0:
/* AB6E0 800AAAE0 01024021 */  addu       $t0, $t0, $v0
/* AB6E4 800AAAE4 1500002D */  bnez       $t0, .L800AAB9C
/* AB6E8 800AAAE8 2D6D0D01 */   sltiu     $t5, $t3, 0xd01
/* AB6EC 800AAAEC 0802AACB */  j          .L800AAB2C
/* AB6F0 800AAAF0 24080001 */   addiu     $t0, $zero, 1
.L800AAAF4:
/* AB6F4 800AAAF4 240A001F */  addiu      $t2, $zero, 0x1f
/* AB6F8 800AAAF8 91220000 */  lbu        $v0, ($t1)
/* AB6FC 800AAAFC 91230001 */  lbu        $v1, 1($t1)
/* AB700 800AAB00 91240002 */  lbu        $a0, 2($t1)
/* AB704 800AAB04 91250003 */  lbu        $a1, 3($t1)
/* AB708 800AAB08 25290004 */  addiu      $t1, $t1, 4
/* AB70C 800AAB0C 00031A00 */  sll        $v1, $v1, 8
/* AB710 800AAB10 00431021 */  addu       $v0, $v0, $v1
/* AB714 800AAB14 00042400 */  sll        $a0, $a0, 0x10
/* AB718 800AAB18 00441021 */  addu       $v0, $v0, $a0
/* AB71C 800AAB1C 00052E00 */  sll        $a1, $a1, 0x18
/* AB720 800AAB20 00452821 */  addu       $a1, $v0, $a1
/* AB724 800AAB24 04A0001C */  bltz       $a1, .L800AAB98
/* AB728 800AAB28 258C0004 */   addiu     $t4, $t4, 4
.L800AAB2C:
/* AB72C 800AAB2C 11400005 */  beqz       $t2, .L800AAB44
/* AB730 800AAB30 00084040 */   sll       $t0, $t0, 1
/* AB734 800AAB34 254AFFFF */  addiu      $t2, $t2, -1
/* AB738 800AAB38 01451006 */  srlv       $v0, $a1, $t2
/* AB73C 800AAB3C 0802AADF */  j          .L800AAB7C
/* AB740 800AAB40 30420001 */   andi      $v0, $v0, 1
.L800AAB44:
/* AB744 800AAB44 240A001F */  addiu      $t2, $zero, 0x1f
/* AB748 800AAB48 91230000 */  lbu        $v1, ($t1)
/* AB74C 800AAB4C 91220001 */  lbu        $v0, 1($t1)
/* AB750 800AAB50 91240002 */  lbu        $a0, 2($t1)
/* AB754 800AAB54 91250003 */  lbu        $a1, 3($t1)
/* AB758 800AAB58 25290004 */  addiu      $t1, $t1, 4
/* AB75C 800AAB5C 258C0004 */  addiu      $t4, $t4, 4
/* AB760 800AAB60 00021200 */  sll        $v0, $v0, 8
/* AB764 800AAB64 00621821 */  addu       $v1, $v1, $v0
/* AB768 800AAB68 00042400 */  sll        $a0, $a0, 0x10
/* AB76C 800AAB6C 00641821 */  addu       $v1, $v1, $a0
/* AB770 800AAB70 00052E00 */  sll        $a1, $a1, 0x18
/* AB774 800AAB74 00652821 */  addu       $a1, $v1, $a1
/* AB778 800AAB78 000517C2 */  srl        $v0, $a1, 0x1f
.L800AAB7C:
/* AB77C 800AAB7C 1140FFDD */  beqz       $t2, .L800AAAF4
/* AB780 800AAB80 01024021 */   addu      $t0, $t0, $v0
/* AB784 800AAB84 254AFFFF */  addiu      $t2, $t2, -1
/* AB788 800AAB88 01451006 */  srlv       $v0, $a1, $t2
/* AB78C 800AAB8C 30420001 */  andi       $v0, $v0, 1
/* AB790 800AAB90 1040FFE6 */  beqz       $v0, .L800AAB2C
/* AB794 800AAB94 00000000 */   nop
.L800AAB98:
/* AB798 800AAB98 25080002 */  addiu      $t0, $t0, 2
.L800AAB9C:
/* AB79C 800AAB9C 39A20001 */  xori       $v0, $t5, 1
/* AB7A0 800AABA0 01024021 */  addu       $t0, $t0, $v0
/* AB7A4 800AABA4 00CB1823 */  subu       $v1, $a2, $t3
/* AB7A8 800AABA8 90620000 */  lbu        $v0, ($v1)
/* AB7AC 800AABAC 24630001 */  addiu      $v1, $v1, 1
/* AB7B0 800AABB0 25CE0001 */  addiu      $t6, $t6, 1
/* AB7B4 800AABB4 A0C20000 */  sb         $v0, ($a2)
/* AB7B8 800AABB8 24C60001 */  addiu      $a2, $a2, 1
.L800AABBC:
/* AB7BC 800AABBC 90620000 */  lbu        $v0, ($v1)
/* AB7C0 800AABC0 24630001 */  addiu      $v1, $v1, 1
/* AB7C4 800AABC4 25CE0001 */  addiu      $t6, $t6, 1
/* AB7C8 800AABC8 2508FFFF */  addiu      $t0, $t0, -1
/* AB7CC 800AABCC A0C20000 */  sb         $v0, ($a2)
/* AB7D0 800AABD0 1500FFFA */  bnez       $t0, .L800AABBC
/* AB7D4 800AABD4 24C60001 */   addiu     $a2, $a2, 1
/* AB7D8 800AABD8 0802AA38 */  j          .L800AA8E0
/* AB7DC 800AABDC 00000000 */   nop
.L800AABE0:
/* AB7E0 800AABE0 11990006 */  beq        $t4, $t9, .L800AABFC
/* AB7E4 800AABE4 ACEE0000 */   sw        $t6, ($a3)
/* AB7E8 800AABE8 0199102B */  sltu       $v0, $t4, $t9
/* AB7EC 800AABEC 10400004 */  beqz       $v0, .L800AAC00
/* AB7F0 800AABF0 2403FF37 */   addiu     $v1, $zero, -0xc9
/* AB7F4 800AABF4 0802AB00 */  j          .L800AAC00
/* AB7F8 800AABF8 2403FF33 */   addiu     $v1, $zero, -0xcd
.L800AABFC:
/* AB7FC 800AABFC 00001821 */  addu       $v1, $zero, $zero
.L800AAC00:
/* AB800 800AAC00 03E00008 */  jr         $ra
/* AB804 800AAC04 00601021 */   addu      $v0, $v1, $zero
/* AB808 800AAC08 00000000 */  nop
/* AB80C 800AAC0C 00000000 */  nop
