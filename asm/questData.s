.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8001D820
/* 1E420 8001D820 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 1E424 8001D824 00802821 */  addu       $a1, $a0, $zero
/* 1E428 8001D828 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E42C 8001D82C AFB00090 */  sw         $s0, 0x90($sp)
/* 1E430 8001D830 3C10800E */  lui        $s0, %hi(gGlobals)
/* 1E434 8001D834 AFB10094 */  sw         $s1, 0x94($sp)
/* 1E438 8001D838 261168A8 */  addiu      $s1, $s0, %lo(gGlobals)
/* 1E43C 8001D83C AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 1E440 8001D840 AFB3009C */  sw         $s3, 0x9c($sp)
/* 1E444 8001D844 AFB20098 */  sw         $s2, 0x98($sp)
/* 1E448 8001D848 F7B400A8 */  sdc1       $f20, 0xa8($sp)
/* 1E44C 8001D84C 0C0009BC */  jal        set_2_pointer_vals
/* 1E450 8001D850 8E3315F8 */   lw        $s3, 0x15f8($s1)
/* 1E454 8001D854 8E2415F8 */  lw         $a0, 0x15f8($s1)
/* 1E458 8001D858 0C006F5F */  jal        func_8001BD7C
/* 1E45C 8001D85C 24120001 */   addiu     $s2, $zero, 1
/* 1E460 8001D860 0C0073C3 */  jal        func_8001CF0C
/* 1E464 8001D864 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E468 8001D868 0C0073DE */  jal        load_gold
/* 1E46C 8001D86C 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E470 8001D870 8E650020 */  lw         $a1, 0x20($s3)
/* 1E474 8001D874 0C0073EF */  jal        func_8001CFBC
/* 1E478 8001D878 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E47C 8001D87C 8E65001C */  lw         $a1, 0x1c($s3)
/* 1E480 8001D880 0C0073EF */  jal        func_8001CFBC
/* 1E484 8001D884 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E488 8001D888 8E650018 */  lw         $a1, 0x18($s3)
/* 1E48C 8001D88C 0C0073EF */  jal        func_8001CFBC
/* 1E490 8001D890 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E494 8001D894 0C006FA4 */  jal        func_8001BE90
/* 1E498 8001D898 00002021 */   addu      $a0, $zero, $zero
/* 1E49C 8001D89C 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E4A0 8001D8A0 0C0074EF */  jal        func_8001D3BC
/* 1E4A4 8001D8A4 00402821 */   addu      $a1, $v0, $zero
/* 1E4A8 8001D8A8 0C006FA4 */  jal        func_8001BE90
/* 1E4AC 8001D8AC 00002021 */   addu      $a0, $zero, $zero
/* 1E4B0 8001D8B0 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E4B4 8001D8B4 0C00740E */  jal        func_8001D038
/* 1E4B8 8001D8B8 00402821 */   addu      $a1, $v0, $zero
/* 1E4BC 8001D8BC 27B10050 */  addiu      $s1, $sp, 0x50
.L8001D8C0:
/* 1E4C0 8001D8C0 0C006FA4 */  jal        func_8001BE90
/* 1E4C4 8001D8C4 02402021 */   addu      $a0, $s2, $zero
/* 1E4C8 8001D8C8 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E4CC 8001D8CC 0C0074EF */  jal        func_8001D3BC
/* 1E4D0 8001D8D0 00402821 */   addu      $a1, $v0, $zero
/* 1E4D4 8001D8D4 26420001 */  addiu      $v0, $s2, 1
/* 1E4D8 8001D8D8 305200FF */  andi       $s2, $v0, 0xff
/* 1E4DC 8001D8DC 2E430004 */  sltiu      $v1, $s2, 4
/* 1E4E0 8001D8E0 1460FFF7 */  bnez       $v1, .L8001D8C0
/* 1E4E4 8001D8E4 2E420009 */   sltiu     $v0, $s2, 9
/* 1E4E8 8001D8E8 5040000C */  beql       $v0, $zero, .L8001D91C
/* 1E4EC 8001D8EC 8E660010 */   lw        $a2, 0x10($s3)
.L8001D8F0:
/* 1E4F0 8001D8F0 0C006FA4 */  jal        func_8001BE90
/* 1E4F4 8001D8F4 02402021 */   addu      $a0, $s2, $zero
/* 1E4F8 8001D8F8 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E4FC 8001D8FC 0C007467 */  jal        func_8001D19C
/* 1E500 8001D900 00402821 */   addu      $a1, $v0, $zero
/* 1E504 8001D904 26420001 */  addiu      $v0, $s2, 1
/* 1E508 8001D908 305200FF */  andi       $s2, $v0, 0xff
/* 1E50C 8001D90C 2E430009 */  sltiu      $v1, $s2, 9
/* 1E510 8001D910 1460FFF7 */  bnez       $v1, .L8001D8F0
/* 1E514 8001D914 00000000 */   nop
/* 1E518 8001D918 8E660010 */  lw         $a2, 0x10($s3)
.L8001D91C:
/* 1E51C 8001D91C 8CC20000 */  lw         $v0, ($a2)
/* 1E520 8001D920 27A50010 */  addiu      $a1, $sp, 0x10
/* 1E524 8001D924 84440028 */  lh         $a0, 0x28($v0)
/* 1E528 8001D928 8C43002C */  lw         $v1, 0x2c($v0)
/* 1E52C 8001D92C 0060F809 */  jalr       $v1
/* 1E530 8001D930 00C42021 */   addu      $a0, $a2, $a0
/* 1E534 8001D934 02202021 */  addu       $a0, $s1, $zero
/* 1E538 8001D938 3C05800F */  lui        $a1, %hi(WeatherTemp)
/* 1E53C 8001D93C 24A553B0 */  addiu      $a1, $a1, %lo(WeatherTemp)
/* 1E540 8001D940 0C033547 */  jal        memcpy
/* 1E544 8001D944 24060010 */   addiu     $a2, $zero, 0x10
/* 1E548 8001D948 C7A20050 */  lwc1       $f2, 0x50($sp)
/* 1E54C 8001D94C 3C01800E */  lui        $at, %hi(D_800D9740)
/* 1E550 8001D950 C4209740 */  lwc1       $f0, %lo(D_800D9740)($at)
/* 1E554 8001D954 46001182 */  mul.s      $f6, $f2, $f0
/* 1E558 8001D958 C7A40054 */  lwc1       $f4, 0x54($sp)
/* 1E55C 8001D95C 46002102 */  mul.s      $f4, $f4, $f0
/* 1E560 8001D960 C7A20058 */  lwc1       $f2, 0x58($sp)
/* 1E564 8001D964 46001082 */  mul.s      $f2, $f2, $f0
/* 1E568 8001D968 3C01800E */  lui        $at, %hi(D_800D9744)
/* 1E56C 8001D96C C4209744 */  lwc1       $f0, %lo(D_800D9744)($at)
/* 1E570 8001D970 4606003E */  c.le.s     $f0, $f6
/* 1E574 8001D974 E7A60050 */  swc1       $f6, 0x50($sp)
/* 1E578 8001D978 E7A40054 */  swc1       $f4, 0x54($sp)
/* 1E57C 8001D97C 45010005 */  bc1t       .L8001D994
/* 1E580 8001D980 E7A20058 */   swc1      $f2, 0x58($sp)
/* 1E584 8001D984 4600300D */  trunc.w.s  $f0, $f6
/* 1E588 8001D988 44050000 */  mfc1       $a1, $f0
/* 1E58C 8001D98C 0800766B */  j          .L8001D9AC
/* 1E590 8001D990 27A40010 */   addiu     $a0, $sp, 0x10
.L8001D994:
/* 1E594 8001D994 46003001 */  sub.s      $f0, $f6, $f0
/* 1E598 8001D998 4600008D */  trunc.w.s  $f2, $f0
/* 1E59C 8001D99C 44051000 */  mfc1       $a1, $f2
/* 1E5A0 8001D9A0 3C028000 */  lui        $v0, 0x8000
/* 1E5A4 8001D9A4 00A22825 */  or         $a1, $a1, $v0
/* 1E5A8 8001D9A8 27A40010 */  addiu      $a0, $sp, 0x10
.L8001D9AC:
/* 1E5AC 8001D9AC 0C0009C0 */  jal        func_80002700
/* 1E5B0 8001D9B0 24060020 */   addiu     $a2, $zero, 0x20
/* 1E5B4 8001D9B4 C7A00054 */  lwc1       $f0, 0x54($sp)
/* 1E5B8 8001D9B8 3C01800E */  lui        $at, %hi(D_800D9748)
/* 1E5BC 8001D9BC C4229748 */  lwc1       $f2, %lo(D_800D9748)($at)
/* 1E5C0 8001D9C0 4600103E */  c.le.s     $f2, $f0
/* 1E5C4 8001D9C4 00000000 */  nop
/* 1E5C8 8001D9C8 45030005 */  bc1tl      .L8001D9E0
/* 1E5CC 8001D9CC 46020001 */   sub.s     $f0, $f0, $f2
/* 1E5D0 8001D9D0 4600008D */  trunc.w.s  $f2, $f0
/* 1E5D4 8001D9D4 44051000 */  mfc1       $a1, $f2
/* 1E5D8 8001D9D8 0800767D */  j          .L8001D9F4
/* 1E5DC 8001D9DC 27A40010 */   addiu     $a0, $sp, 0x10
.L8001D9E0:
/* 1E5E0 8001D9E0 4600008D */  trunc.w.s  $f2, $f0
/* 1E5E4 8001D9E4 44051000 */  mfc1       $a1, $f2
/* 1E5E8 8001D9E8 3C028000 */  lui        $v0, 0x8000
/* 1E5EC 8001D9EC 00A22825 */  or         $a1, $a1, $v0
/* 1E5F0 8001D9F0 27A40010 */  addiu      $a0, $sp, 0x10
.L8001D9F4:
/* 1E5F4 8001D9F4 0C0009C0 */  jal        func_80002700
/* 1E5F8 8001D9F8 24060020 */   addiu     $a2, $zero, 0x20
/* 1E5FC 8001D9FC C7A00058 */  lwc1       $f0, 0x58($sp)
/* 1E600 8001DA00 3C01800E */  lui        $at, %hi(D_800D974C)
/* 1E604 8001DA04 C422974C */  lwc1       $f2, %lo(D_800D974C)($at)
/* 1E608 8001DA08 4600103E */  c.le.s     $f2, $f0
/* 1E60C 8001DA0C 00000000 */  nop
/* 1E610 8001DA10 45030005 */  bc1tl      .L8001DA28
/* 1E614 8001DA14 46020001 */   sub.s     $f0, $f0, $f2
/* 1E618 8001DA18 4600008D */  trunc.w.s  $f2, $f0
/* 1E61C 8001DA1C 44051000 */  mfc1       $a1, $f2
/* 1E620 8001DA20 0800768F */  j          .L8001DA3C
/* 1E624 8001DA24 27A40010 */   addiu     $a0, $sp, 0x10
.L8001DA28:
/* 1E628 8001DA28 4600008D */  trunc.w.s  $f2, $f0
/* 1E62C 8001DA2C 44051000 */  mfc1       $a1, $f2
/* 1E630 8001DA30 3C028000 */  lui        $v0, 0x8000
/* 1E634 8001DA34 00A22825 */  or         $a1, $a1, $v0
/* 1E638 8001DA38 27A40010 */  addiu      $a0, $sp, 0x10
.L8001DA3C:
/* 1E63C 8001DA3C 0C0009C0 */  jal        func_80002700
/* 1E640 8001DA40 24060020 */   addiu     $a2, $zero, 0x20
/* 1E644 8001DA44 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E648 8001DA48 93A5005C */  lbu        $a1, 0x5c($sp)
/* 1E64C 8001DA4C 0C0009C0 */  jal        func_80002700
/* 1E650 8001DA50 24060008 */   addiu     $a2, $zero, 8
/* 1E654 8001DA54 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 1E658 8001DA58 C4422054 */  lwc1       $f2, 0x2054($v0)
/* 1E65C 8001DA5C 3C01800E */  lui        $at, %hi(D_800D9750)
/* 1E660 8001DA60 C4209750 */  lwc1       $f0, %lo(D_800D9750)($at)
/* 1E664 8001DA64 46001082 */  mul.s      $f2, $f2, $f0
/* 1E668 8001DA68 C4542058 */  lwc1       $f20, 0x2058($v0)
/* 1E66C 8001DA6C 4600A502 */  mul.s      $f20, $f20, $f0
/* 1E670 8001DA70 3C01800E */  lui        $at, %hi(D_800D9754)
/* 1E674 8001DA74 C4209754 */  lwc1       $f0, %lo(D_800D9754)($at)
/* 1E678 8001DA78 4602003E */  c.le.s     $f0, $f2
/* 1E67C 8001DA7C 00000000 */  nop
/* 1E680 8001DA80 45030005 */  bc1tl      .L8001DA98
/* 1E684 8001DA84 46001001 */   sub.s     $f0, $f2, $f0
/* 1E688 8001DA88 4600100D */  trunc.w.s  $f0, $f2
/* 1E68C 8001DA8C 44050000 */  mfc1       $a1, $f0
/* 1E690 8001DA90 080076AB */  j          .L8001DAAC
/* 1E694 8001DA94 27A40010 */   addiu     $a0, $sp, 0x10
.L8001DA98:
/* 1E698 8001DA98 4600008D */  trunc.w.s  $f2, $f0
/* 1E69C 8001DA9C 44051000 */  mfc1       $a1, $f2
/* 1E6A0 8001DAA0 3C028000 */  lui        $v0, 0x8000
/* 1E6A4 8001DAA4 00A22825 */  or         $a1, $a1, $v0
/* 1E6A8 8001DAA8 27A40010 */  addiu      $a0, $sp, 0x10
.L8001DAAC:
/* 1E6AC 8001DAAC 0C0009C0 */  jal        func_80002700
/* 1E6B0 8001DAB0 24060020 */   addiu     $a2, $zero, 0x20
/* 1E6B4 8001DAB4 3C01800E */  lui        $at, %hi(D_800D9758)
/* 1E6B8 8001DAB8 C4209758 */  lwc1       $f0, %lo(D_800D9758)($at)
/* 1E6BC 8001DABC 4614003E */  c.le.s     $f0, $f20
/* 1E6C0 8001DAC0 00000000 */  nop
/* 1E6C4 8001DAC4 45030005 */  bc1tl      .L8001DADC
/* 1E6C8 8001DAC8 4600A001 */   sub.s     $f0, $f20, $f0
/* 1E6CC 8001DACC 4600A00D */  trunc.w.s  $f0, $f20
/* 1E6D0 8001DAD0 44050000 */  mfc1       $a1, $f0
/* 1E6D4 8001DAD4 080076BC */  j          .L8001DAF0
/* 1E6D8 8001DAD8 27A40010 */   addiu     $a0, $sp, 0x10
.L8001DADC:
/* 1E6DC 8001DADC 4600008D */  trunc.w.s  $f2, $f0
/* 1E6E0 8001DAE0 44051000 */  mfc1       $a1, $f2
/* 1E6E4 8001DAE4 3C028000 */  lui        $v0, 0x8000
/* 1E6E8 8001DAE8 00A22825 */  or         $a1, $a1, $v0
/* 1E6EC 8001DAEC 27A40010 */  addiu      $a0, $sp, 0x10
.L8001DAF0:
/* 1E6F0 8001DAF0 0C0009C0 */  jal        func_80002700
/* 1E6F4 8001DAF4 24060020 */   addiu     $a2, $zero, 0x20
/* 1E6F8 8001DAF8 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E6FC 8001DAFC 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 1E700 8001DB00 904515FC */  lbu        $a1, 0x15fc($v0)
/* 1E704 8001DB04 0C0009C0 */  jal        func_80002700
/* 1E708 8001DB08 24060001 */   addiu     $a2, $zero, 1
/* 1E70C 8001DB0C 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 1E710 8001DB10 8FB3009C */  lw         $s3, 0x9c($sp)
/* 1E714 8001DB14 8FB20098 */  lw         $s2, 0x98($sp)
/* 1E718 8001DB18 8FB10094 */  lw         $s1, 0x94($sp)
/* 1E71C 8001DB1C 8FB00090 */  lw         $s0, 0x90($sp)
/* 1E720 8001DB20 D7B400A8 */  ldc1       $f20, 0xa8($sp)
/* 1E724 8001DB24 03E00008 */  jr         $ra
/* 1E728 8001DB28 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel load_game_func
/* 1E72C 8001DB2C 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* 1E730 8001DB30 00802821 */  addu       $a1, $a0, $zero
/* 1E734 8001DB34 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E738 8001DB38 AFB00090 */  sw         $s0, 0x90($sp)
/* 1E73C 8001DB3C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 1E740 8001DB40 260268A8 */  addiu      $v0, $s0, %lo(gGlobals)
/* 1E744 8001DB44 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 1E748 8001DB48 AFB3009C */  sw         $s3, 0x9c($sp)
/* 1E74C 8001DB4C AFB20098 */  sw         $s2, 0x98($sp)
/* 1E750 8001DB50 AFB10094 */  sw         $s1, 0x94($sp)
/* 1E754 8001DB54 F7B600B0 */  sdc1       $f22, 0xb0($sp)
/* 1E758 8001DB58 F7B400A8 */  sdc1       $f20, 0xa8($sp)
/* 1E75C 8001DB5C 0C0009BC */  jal        set_2_pointer_vals
/* 1E760 8001DB60 8C5115F8 */   lw        $s1, 0x15f8($v0)
/* 1E764 8001DB64 0C0073D3 */  jal        load_ingame_time
/* 1E768 8001DB68 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E76C 8001DB6C 24120001 */  addiu      $s2, $zero, 1
/* 1E770 8001DB70 02009821 */  addu       $s3, $s0, $zero
/* 1E774 8001DB74 0C01F6D4 */  jal        Party_free
/* 1E778 8001DB78 02202021 */   addu      $a0, $s1, $zero
/* 1E77C 8001DB7C 0C01F6C4 */  jal        init_party
/* 1E780 8001DB80 02202021 */   addu      $a0, $s1, $zero
/* 1E784 8001DB84 0C0073E8 */  jal        load_gold_
/* 1E788 8001DB88 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E78C 8001DB8C 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E790 8001DB90 0C0073FC */  jal        load_unk_party_var
/* 1E794 8001DB94 AE220014 */   sw        $v0, 0x14($s1)
/* 1E798 8001DB98 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E79C 8001DB9C 0C0073FC */  jal        load_unk_party_var
/* 1E7A0 8001DBA0 AE220020 */   sw        $v0, 0x20($s1)
/* 1E7A4 8001DBA4 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E7A8 8001DBA8 0C0073FC */  jal        load_unk_party_var
/* 1E7AC 8001DBAC AE22001C */   sw        $v0, 0x1c($s1)
/* 1E7B0 8001DBB0 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E7B4 8001DBB4 0C00752A */  jal        load_charsheet
/* 1E7B8 8001DBB8 AE220018 */   sw        $v0, 0x18($s1)
/* 1E7BC 8001DBBC 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E7C0 8001DBC0 00402821 */  addu       $a1, $v0, $zero
/* 1E7C4 8001DBC4 0C00743F */  jal        func_8001D0FC
/* 1E7C8 8001DBC8 AE220000 */   sw        $v0, ($s1)
/* 1E7CC 8001DBCC 92220024 */  lbu        $v0, 0x24($s1)
/* 1E7D0 8001DBD0 27B00050 */  addiu      $s0, $sp, 0x50
/* 1E7D4 8001DBD4 24420001 */  addiu      $v0, $v0, 1
/* 1E7D8 8001DBD8 A2220024 */  sb         $v0, 0x24($s1)
.L8001DBDC:
/* 1E7DC 8001DBDC 0C00752A */  jal        load_charsheet
/* 1E7E0 8001DBE0 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E7E4 8001DBE4 00121880 */  sll        $v1, $s2, 2
/* 1E7E8 8001DBE8 02231821 */  addu       $v1, $s1, $v1
/* 1E7EC 8001DBEC 10400004 */  beqz       $v0, .L8001DC00
/* 1E7F0 8001DBF0 AC620000 */   sw        $v0, ($v1)
/* 1E7F4 8001DBF4 92220024 */  lbu        $v0, 0x24($s1)
/* 1E7F8 8001DBF8 24420001 */  addiu      $v0, $v0, 1
/* 1E7FC 8001DBFC A2220024 */  sb         $v0, 0x24($s1)
.L8001DC00:
/* 1E800 8001DC00 26420001 */  addiu      $v0, $s2, 1
/* 1E804 8001DC04 305200FF */  andi       $s2, $v0, 0xff
/* 1E808 8001DC08 2E430004 */  sltiu      $v1, $s2, 4
/* 1E80C 8001DC0C 1460FFF3 */  bnez       $v1, .L8001DBDC
/* 1E810 8001DC10 2E420009 */   sltiu     $v0, $s2, 9
/* 1E814 8001DC14 5040000C */  beql       $v0, $zero, .L8001DC48
/* 1E818 8001DC18 8E260010 */   lw        $a2, 0x10($s1)
.L8001DC1C:
/* 1E81C 8001DC1C 0C0074A7 */  jal        load_charsheet_values
/* 1E820 8001DC20 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E824 8001DC24 00402021 */  addu       $a0, $v0, $zero
/* 1E828 8001DC28 0C006FD0 */  jal        func_8001BF40
/* 1E82C 8001DC2C 02402821 */   addu      $a1, $s2, $zero
/* 1E830 8001DC30 26420001 */  addiu      $v0, $s2, 1
/* 1E834 8001DC34 305200FF */  andi       $s2, $v0, 0xff
/* 1E838 8001DC38 2E430009 */  sltiu      $v1, $s2, 9
/* 1E83C 8001DC3C 1460FFF7 */  bnez       $v1, .L8001DC1C
/* 1E840 8001DC40 00000000 */   nop
/* 1E844 8001DC44 8E260010 */  lw         $a2, 0x10($s1)
.L8001DC48:
/* 1E848 8001DC48 8CC20000 */  lw         $v0, ($a2)
/* 1E84C 8001DC4C 27A50010 */  addiu      $a1, $sp, 0x10
/* 1E850 8001DC50 84440020 */  lh         $a0, 0x20($v0)
/* 1E854 8001DC54 8C430024 */  lw         $v1, 0x24($v0)
/* 1E858 8001DC58 0060F809 */  jalr       $v1
/* 1E85C 8001DC5C 00C42021 */   addu      $a0, $a2, $a0
/* 1E860 8001DC60 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E864 8001DC64 0C0009DF */  jal        two_bitshifting_funcs
/* 1E868 8001DC68 24050020 */   addiu     $a1, $zero, 0x20
/* 1E86C 8001DC6C 44821000 */  mtc1       $v0, $f2
/* 1E870 8001DC70 468010A1 */  cvt.d.w    $f2, $f2
/* 1E874 8001DC74 04430005 */  bgezl      $v0, .L8001DC8C
/* 1E878 8001DC78 46201020 */   cvt.s.d   $f0, $f2
/* 1E87C 8001DC7C 3C01800E */  lui        $at, %hi(D_800D9760)
/* 1E880 8001DC80 D4209760 */  ldc1       $f0, %lo(D_800D9760)($at)
/* 1E884 8001DC84 46201080 */  add.d      $f2, $f2, $f0
/* 1E888 8001DC88 46201020 */  cvt.s.d    $f0, $f2
.L8001DC8C:
/* 1E88C 8001DC8C E7A00050 */  swc1       $f0, 0x50($sp)
/* 1E890 8001DC90 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E894 8001DC94 0C0009DF */  jal        two_bitshifting_funcs
/* 1E898 8001DC98 24050020 */   addiu     $a1, $zero, 0x20
/* 1E89C 8001DC9C 44821000 */  mtc1       $v0, $f2
/* 1E8A0 8001DCA0 468010A1 */  cvt.d.w    $f2, $f2
/* 1E8A4 8001DCA4 04430005 */  bgezl      $v0, .L8001DCBC
/* 1E8A8 8001DCA8 46201020 */   cvt.s.d   $f0, $f2
/* 1E8AC 8001DCAC 3C01800E */  lui        $at, %hi(D_800D9768)
/* 1E8B0 8001DCB0 D4209768 */  ldc1       $f0, %lo(D_800D9768)($at)
/* 1E8B4 8001DCB4 46201080 */  add.d      $f2, $f2, $f0
/* 1E8B8 8001DCB8 46201020 */  cvt.s.d    $f0, $f2
.L8001DCBC:
/* 1E8BC 8001DCBC E7A00054 */  swc1       $f0, 0x54($sp)
/* 1E8C0 8001DCC0 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E8C4 8001DCC4 0C0009DF */  jal        two_bitshifting_funcs
/* 1E8C8 8001DCC8 24050020 */   addiu     $a1, $zero, 0x20
/* 1E8CC 8001DCCC 44821000 */  mtc1       $v0, $f2
/* 1E8D0 8001DCD0 468010A1 */  cvt.d.w    $f2, $f2
/* 1E8D4 8001DCD4 04410004 */  bgez       $v0, .L8001DCE8
/* 1E8D8 8001DCD8 27A40010 */   addiu     $a0, $sp, 0x10
/* 1E8DC 8001DCDC 3C01800E */  lui        $at, %hi(D_800D9770)
/* 1E8E0 8001DCE0 D4209770 */  ldc1       $f0, %lo(D_800D9770)($at)
/* 1E8E4 8001DCE4 46201080 */  add.d      $f2, $f2, $f0
.L8001DCE8:
/* 1E8E8 8001DCE8 24050008 */  addiu      $a1, $zero, 8
/* 1E8EC 8001DCEC 46201020 */  cvt.s.d    $f0, $f2
/* 1E8F0 8001DCF0 0C0009DF */  jal        two_bitshifting_funcs
/* 1E8F4 8001DCF4 E7A00058 */   swc1      $f0, 0x58($sp)
/* 1E8F8 8001DCF8 C7A40050 */  lwc1       $f4, 0x50($sp)
/* 1E8FC 8001DCFC 3C01800E */  lui        $at, %hi(D_800D9778)
/* 1E900 8001DD00 C4369778 */  lwc1       $f22, %lo(D_800D9778)($at)
/* 1E904 8001DD04 46162102 */  mul.s      $f4, $f4, $f22
/* 1E908 8001DD08 C7A20054 */  lwc1       $f2, 0x54($sp)
/* 1E90C 8001DD0C 46161082 */  mul.s      $f2, $f2, $f22
/* 1E910 8001DD10 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* 1E914 8001DD14 C7A00058 */  lwc1       $f0, 0x58($sp)
/* 1E918 8001DD18 8C641BBC */  lw         $a0, %lo(TerrainPointer)($v1)
/* 1E91C 8001DD1C 46160002 */  mul.s      $f0, $f0, $f22
/* 1E920 8001DD20 02002821 */  addu       $a1, $s0, $zero
/* 1E924 8001DD24 A3A2005C */  sb         $v0, 0x5c($sp)
/* 1E928 8001DD28 E7A40050 */  swc1       $f4, 0x50($sp)
/* 1E92C 8001DD2C E7A20054 */  swc1       $f2, 0x54($sp)
/* 1E930 8001DD30 0C021487 */  jal        set_with_WeatherTemp
/* 1E934 8001DD34 E7A00058 */   swc1      $f0, 0x58($sp)
/* 1E938 8001DD38 3C04800F */  lui        $a0, %hi(WeatherTemp)
/* 1E93C 8001DD3C 248453B0 */  addiu      $a0, $a0, %lo(WeatherTemp)
/* 1E940 8001DD40 02002821 */  addu       $a1, $s0, $zero
/* 1E944 8001DD44 0C033547 */  jal        memcpy
/* 1E948 8001DD48 24060010 */   addiu     $a2, $zero, 0x10
/* 1E94C 8001DD4C 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E950 8001DD50 24050020 */  addiu      $a1, $zero, 0x20
/* 1E954 8001DD54 24030001 */  addiu      $v1, $zero, 1
/* 1E958 8001DD58 3C02800F */  lui        $v0, %hi(LoadedGameSaveFlag)
/* 1E95C 8001DD5C 0C0009DF */  jal        two_bitshifting_funcs
/* 1E960 8001DD60 AC438F24 */   sw        $v1, %lo(LoadedGameSaveFlag)($v0)
/* 1E964 8001DD64 44821000 */  mtc1       $v0, $f2
/* 1E968 8001DD68 468010A1 */  cvt.d.w    $f2, $f2
/* 1E96C 8001DD6C 04430005 */  bgezl      $v0, .L8001DD84
/* 1E970 8001DD70 46201520 */   cvt.s.d   $f20, $f2
/* 1E974 8001DD74 3C01800E */  lui        $at, %hi(D_800D9780)
/* 1E978 8001DD78 D4209780 */  ldc1       $f0, %lo(D_800D9780)($at)
/* 1E97C 8001DD7C 46201080 */  add.d      $f2, $f2, $f0
/* 1E980 8001DD80 46201520 */  cvt.s.d    $f20, $f2
.L8001DD84:
/* 1E984 8001DD84 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E988 8001DD88 0C0009DF */  jal        two_bitshifting_funcs
/* 1E98C 8001DD8C 24050020 */   addiu     $a1, $zero, 0x20
/* 1E990 8001DD90 44821000 */  mtc1       $v0, $f2
/* 1E994 8001DD94 468010A1 */  cvt.d.w    $f2, $f2
/* 1E998 8001DD98 04410004 */  bgez       $v0, .L8001DDAC
/* 1E99C 8001DD9C 00000000 */   nop
/* 1E9A0 8001DDA0 3C01800E */  lui        $at, %hi(D_800D9788)
/* 1E9A4 8001DDA4 D4209788 */  ldc1       $f0, %lo(D_800D9788)($at)
/* 1E9A8 8001DDA8 46201080 */  add.d      $f2, $f2, $f0
.L8001DDAC:
/* 1E9AC 8001DDAC 4616A502 */  mul.s      $f20, $f20, $f22
/* 1E9B0 8001DDB0 46201020 */  cvt.s.d    $f0, $f2
/* 1E9B4 8001DDB4 46160002 */  mul.s      $f0, $f0, $f22
/* 1E9B8 8001DDB8 27A40010 */  addiu      $a0, $sp, 0x10
/* 1E9BC 8001DDBC 24050001 */  addiu      $a1, $zero, 1
/* 1E9C0 8001DDC0 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 1E9C4 8001DDC4 E4542054 */  swc1       $f20, 0x2054($v0)
/* 1E9C8 8001DDC8 0C0009DF */  jal        two_bitshifting_funcs
/* 1E9CC 8001DDCC E4402058 */   swc1      $f0, 0x2058($v0)
/* 1E9D0 8001DDD0 0C012650 */  jal        selectResMode
/* 1E9D4 8001DDD4 304400FF */   andi      $a0, $v0, 0xff
/* 1E9D8 8001DDD8 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 1E9DC 8001DDDC 8FB3009C */  lw         $s3, 0x9c($sp)
/* 1E9E0 8001DDE0 8FB20098 */  lw         $s2, 0x98($sp)
/* 1E9E4 8001DDE4 8FB10094 */  lw         $s1, 0x94($sp)
/* 1E9E8 8001DDE8 8FB00090 */  lw         $s0, 0x90($sp)
/* 1E9EC 8001DDEC D7B600B0 */  ldc1       $f22, 0xb0($sp)
/* 1E9F0 8001DDF0 D7B400A8 */  ldc1       $f20, 0xa8($sp)
/* 1E9F4 8001DDF4 03E00008 */  jr         $ra
/* 1E9F8 8001DDF8 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel func_8001DDFC
/* 1E9FC 8001DDFC 00802821 */  addu       $a1, $a0, $zero
/* 1EA00 8001DE00 3C02800F */  lui        $v0, %hi(voxelChart)
/* 1EA04 8001DE04 2447F5E4 */  addiu      $a3, $v0, %lo(voxelChart)
/* 1EA08 8001DE08 00003021 */  addu       $a2, $zero, $zero
/* 1EA0C 8001DE0C 3C02800F */  lui        $v0, %hi(voxelChartIndex)
/* 1EA10 8001DE10 3C03800F */  lui        $v1, %hi(voxelCharIndecies)
/* 1EA14 8001DE14 9044F5E0 */  lbu        $a0, %lo(voxelChartIndex)($v0)
/* 1EA18 8001DE18 2468F6C8 */  addiu      $t0, $v1, %lo(voxelCharIndecies)
/* 1EA1C 8001DE1C A0A40000 */  sb         $a0, ($a1)
/* 1EA20 8001DE20 24A50001 */  addiu      $a1, $a1, 1
.L8001DE24:
/* 1EA24 8001DE24 00C81021 */  addu       $v0, $a2, $t0
/* 1EA28 8001DE28 24C30001 */  addiu      $v1, $a2, 1
/* 1EA2C 8001DE2C 3066FFFF */  andi       $a2, $v1, 0xffff
/* 1EA30 8001DE30 90440000 */  lbu        $a0, ($v0)
/* 1EA34 8001DE34 2CC20013 */  sltiu      $v0, $a2, 0x13
/* 1EA38 8001DE38 A0A40000 */  sb         $a0, ($a1)
/* 1EA3C 8001DE3C 1440FFF9 */  bnez       $v0, .L8001DE24
/* 1EA40 8001DE40 24A50001 */   addiu     $a1, $a1, 1
/* 1EA44 8001DE44 00003021 */  addu       $a2, $zero, $zero
.L8001DE48:
/* 1EA48 8001DE48 90E20000 */  lbu        $v0, ($a3)
/* 1EA4C 8001DE4C 24E70001 */  addiu      $a3, $a3, 1
/* 1EA50 8001DE50 24C30001 */  addiu      $v1, $a2, 1
/* 1EA54 8001DE54 3066FFFF */  andi       $a2, $v1, 0xffff
/* 1EA58 8001DE58 A0A20000 */  sb         $v0, ($a1)
/* 1EA5C 8001DE5C 2CC200E4 */  sltiu      $v0, $a2, 0xe4
/* 1EA60 8001DE60 1440FFF9 */  bnez       $v0, .L8001DE48
/* 1EA64 8001DE64 24A50001 */   addiu     $a1, $a1, 1
/* 1EA68 8001DE68 03E00008 */  jr         $ra
/* 1EA6C 8001DE6C 00000000 */   nop

glabel func_8001DE70
/* 1EA70 8001DE70 00802821 */  addu       $a1, $a0, $zero
/* 1EA74 8001DE74 3C02800F */  lui        $v0, %hi(voxelChart)
/* 1EA78 8001DE78 2447F5E4 */  addiu      $a3, $v0, %lo(voxelChart)
/* 1EA7C 8001DE7C 90A40000 */  lbu        $a0, ($a1)
/* 1EA80 8001DE80 24A50001 */  addiu      $a1, $a1, 1
/* 1EA84 8001DE84 00003021 */  addu       $a2, $zero, $zero
/* 1EA88 8001DE88 3C02800F */  lui        $v0, %hi(voxelCharIndecies)
/* 1EA8C 8001DE8C 2448F6C8 */  addiu      $t0, $v0, %lo(voxelCharIndecies)
/* 1EA90 8001DE90 3C03800F */  lui        $v1, %hi(voxelChartIndex)
/* 1EA94 8001DE94 A064F5E0 */  sb         $a0, %lo(voxelChartIndex)($v1)
.L8001DE98:
/* 1EA98 8001DE98 90A40000 */  lbu        $a0, ($a1)
/* 1EA9C 8001DE9C 24A50001 */  addiu      $a1, $a1, 1
/* 1EAA0 8001DEA0 00C81821 */  addu       $v1, $a2, $t0
/* 1EAA4 8001DEA4 24C20001 */  addiu      $v0, $a2, 1
/* 1EAA8 8001DEA8 3046FFFF */  andi       $a2, $v0, 0xffff
/* 1EAAC 8001DEAC 2CC20013 */  sltiu      $v0, $a2, 0x13
/* 1EAB0 8001DEB0 1440FFF9 */  bnez       $v0, .L8001DE98
/* 1EAB4 8001DEB4 A0640000 */   sb        $a0, ($v1)
/* 1EAB8 8001DEB8 00003021 */  addu       $a2, $zero, $zero
.L8001DEBC:
/* 1EABC 8001DEBC 90A20000 */  lbu        $v0, ($a1)
/* 1EAC0 8001DEC0 24A50001 */  addiu      $a1, $a1, 1
/* 1EAC4 8001DEC4 24C30001 */  addiu      $v1, $a2, 1
/* 1EAC8 8001DEC8 3066FFFF */  andi       $a2, $v1, 0xffff
/* 1EACC 8001DECC A0E20000 */  sb         $v0, ($a3)
/* 1EAD0 8001DED0 2CC200E4 */  sltiu      $v0, $a2, 0xe4
/* 1EAD4 8001DED4 1440FFF9 */  bnez       $v0, .L8001DEBC
/* 1EAD8 8001DED8 24E70001 */   addiu     $a3, $a3, 1
/* 1EADC 8001DEDC 03E00008 */  jr         $ra
/* 1EAE0 8001DEE0 00000000 */   nop

glabel func_8001DEE4
/* 1EAE4 8001DEE4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1EAE8 8001DEE8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1EAEC 8001DEEC 0C0356D8 */  jal        func_800D5B60
/* 1EAF0 8001DEF0 24051C00 */   addiu     $a1, $zero, 0x1c00
/* 1EAF4 8001DEF4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1EAF8 8001DEF8 03E00008 */  jr         $ra
/* 1EAFC 8001DEFC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel copy_questdata
/* 1EB00 8001DF00 3C02800F */  lui        $v0, %hi(questdata_pointer)
/* 1EB04 8001DF04 8C458F20 */  lw         $a1, %lo(questdata_pointer)($v0)
/* 1EB08 8001DF08 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1EB0C 8001DF0C 10A00003 */  beqz       $a1, .L8001DF1C
/* 1EB10 8001DF10 AFBF0010 */   sw        $ra, 0x10($sp)
/* 1EB14 8001DF14 0C033547 */  jal        memcpy
/* 1EB18 8001DF18 24061000 */   addiu     $a2, $zero, 0x1000
.L8001DF1C:
/* 1EB1C 8001DF1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1EB20 8001DF20 03E00008 */  jr         $ra
/* 1EB24 8001DF24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001DF28
/* 1EB28 8001DF28 10A00003 */  beqz       $a1, .L8001DF38
/* 1EB2C 8001DF2C 00000000 */   nop
/* 1EB30 8001DF30 94A20000 */  lhu        $v0, ($a1)
/* 1EB34 8001DF34 A4820000 */  sh         $v0, ($a0)
.L8001DF38:
/* 1EB38 8001DF38 03E00008 */  jr         $ra
/* 1EB3C 8001DF3C 00000000 */   nop

glabel get_party_playtime
/* 1EB40 8001DF40 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1EB44 8001DF44 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 1EB48 8001DF48 AFB00010 */  sw         $s0, 0x10($sp)
/* 1EB4C 8001DF4C 00008021 */  addu       $s0, $zero, $zero
/* 1EB50 8001DF50 8C4313A0 */  lw         $v1, %lo(EntityPointer)($v0)
/* 1EB54 8001DF54 3C02800E */  lui        $v0, 0x800e
/* 1EB58 8001DF58 AFB20018 */  sw         $s2, 0x18($sp)
/* 1EB5C 8001DF5C 00809021 */  addu       $s2, $a0, $zero
/* 1EB60 8001DF60 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1EB64 8001DF64 AFB10014 */  sw         $s1, 0x14($sp)
/* 1EB68 8001DF68 8C660010 */  lw         $a2, 0x10($v1)
/* 1EB6C 8001DF6C 8C517EA0 */  lw         $s1, 0x7ea0($v0)
/* 1EB70 8001DF70 94C54C80 */  lhu        $a1, 0x4c80($a2)
/* 1EB74 8001DF74 0C01F823 */  jal        get_charsheet
/* 1EB78 8001DF78 02202021 */   addu      $a0, $s1, $zero
/* 1EB7C 8001DF7C 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* 1EB80 8001DF80 8C641BBC */  lw         $a0, %lo(TerrainPointer)($v1)
/* 1EB84 8001DF84 8C450004 */  lw         $a1, 4($v0)
/* 1EB88 8001DF88 8C820034 */  lw         $v0, 0x34($a0)
/* 1EB8C 8001DF8C 2644000C */  addiu      $a0, $s2, 0xc
/* 1EB90 8001DF90 0C02626C */  jal        copy_string
/* 1EB94 8001DF94 AE420000 */   sw        $v0, ($s2)
/* 1EB98 8001DF98 00101080 */  sll        $v0, $s0, 2
.L8001DF9C:
/* 1EB9C 8001DF9C 02221021 */  addu       $v0, $s1, $v0
/* 1EBA0 8001DFA0 8C450000 */  lw         $a1, ($v0)
/* 1EBA4 8001DFA4 00102040 */  sll        $a0, $s0, 1
/* 1EBA8 8001DFA8 24840004 */  addiu      $a0, $a0, 4
/* 1EBAC 8001DFAC 0C0077CA */  jal        func_8001DF28
/* 1EBB0 8001DFB0 02442021 */   addu      $a0, $s2, $a0
/* 1EBB4 8001DFB4 26020001 */  addiu      $v0, $s0, 1
/* 1EBB8 8001DFB8 305000FF */  andi       $s0, $v0, 0xff
/* 1EBBC 8001DFBC 2E030004 */  sltiu      $v1, $s0, 4
/* 1EBC0 8001DFC0 5460FFF6 */  bnel       $v1, $zero, .L8001DF9C
/* 1EBC4 8001DFC4 00101080 */   sll       $v0, $s0, 2
/* 1EBC8 8001DFC8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1EBCC 8001DFCC 8FB20018 */  lw         $s2, 0x18($sp)
/* 1EBD0 8001DFD0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1EBD4 8001DFD4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1EBD8 8001DFD8 03E00008 */  jr         $ra
/* 1EBDC 8001DFDC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001DFE0
/* 1EBE0 8001DFE0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1EBE4 8001DFE4 AFB10014 */  sw         $s1, 0x14($sp)
/* 1EBE8 8001DFE8 00808821 */  addu       $s1, $a0, $zero
/* 1EBEC 8001DFEC AFBF0018 */  sw         $ra, 0x18($sp)
/* 1EBF0 8001DFF0 10A0000B */  beqz       $a1, .L8001E020
/* 1EBF4 8001DFF4 AFB00010 */   sw        $s0, 0x10($sp)
/* 1EBF8 8001DFF8 3C10800E */  lui        $s0, %hi(gGlobals)
/* 1EBFC 8001DFFC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 1EC00 8001E000 8E0400A8 */  lw         $a0, 0xa8($s0)
/* 1EC04 8001E004 26100FE4 */  addiu      $s0, $s0, 0xfe4
/* 1EC08 8001E008 0C0045C9 */  jal        SaveEngineZone
/* 1EC0C 8001E00C 02002821 */   addu      $a1, $s0, $zero
/* 1EC10 8001E010 02202021 */  addu       $a0, $s1, $zero
/* 1EC14 8001E014 02002821 */  addu       $a1, $s0, $zero
/* 1EC18 8001E018 0C033547 */  jal        memcpy
/* 1EC1C 8001E01C 2406002C */   addiu     $a2, $zero, 0x2c
.L8001E020:
/* 1EC20 8001E020 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1EC24 8001E024 8FB10014 */  lw         $s1, 0x14($sp)
/* 1EC28 8001E028 8FB00010 */  lw         $s0, 0x10($sp)
/* 1EC2C 8001E02C 03E00008 */  jr         $ra
/* 1EC30 8001E030 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001E034
/* 1EC34 8001E034 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1EC38 8001E038 AFB00010 */  sw         $s0, 0x10($sp)
/* 1EC3C 8001E03C 00808021 */  addu       $s0, $a0, $zero
/* 1EC40 8001E040 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1EC44 8001E044 AFB10014 */  sw         $s1, 0x14($sp)
/* 1EC48 8001E048 8E040004 */  lw         $a0, 4($s0)
/* 1EC4C 8001E04C 0C0077D0 */  jal        get_party_playtime
/* 1EC50 8001E050 00A08821 */   addu      $s1, $a1, $zero
/* 1EC54 8001E054 8E040008 */  lw         $a0, 8($s0)
/* 1EC58 8001E058 0C0077F8 */  jal        func_8001DFE0
/* 1EC5C 8001E05C 02202821 */   addu      $a1, $s1, $zero
/* 1EC60 8001E060 3C02800F */  lui        $v0, %hi(gameStates)
/* 1EC64 8001E064 8C449940 */  lw         $a0, %lo(gameStates)($v0)
/* 1EC68 8001E068 0C03553E */  jal        func_800D54F8
/* 1EC6C 8001E06C 8E05000C */   lw        $a1, 0xc($s0)
/* 1EC70 8001E070 0C01446C */  jal        func_800511B0
/* 1EC74 8001E074 8E040018 */   lw        $a0, 0x18($s0)
/* 1EC78 8001E078 0C007608 */  jal        func_8001D820
/* 1EC7C 8001E07C 8E040010 */   lw        $a0, 0x10($s0)
/* 1EC80 8001E080 0C00777F */  jal        func_8001DDFC
/* 1EC84 8001E084 8E04001C */   lw        $a0, 0x1c($s0)
/* 1EC88 8001E088 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1EC8C 8001E08C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1EC90 8001E090 8FB00010 */  lw         $s0, 0x10($sp)
/* 1EC94 8001E094 03E00008 */  jr         $ra
/* 1EC98 8001E098 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001E09C
/* 1EC9C 8001E09C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 1ECA0 8001E0A0 AFB00050 */  sw         $s0, 0x50($sp)
/* 1ECA4 8001E0A4 00808021 */  addu       $s0, $a0, $zero
/* 1ECA8 8001E0A8 AFBF0054 */  sw         $ra, 0x54($sp)
/* 1ECAC 8001E0AC 0C00783E */  jal        func_8001E0F8
/* 1ECB0 8001E0B0 27A50010 */   addiu     $a1, $sp, 0x10
/* 1ECB4 8001E0B4 02002021 */  addu       $a0, $s0, $zero
/* 1ECB8 8001E0B8 00002821 */  addu       $a1, $zero, $zero
/* 1ECBC 8001E0BC 0C026380 */  jal        Calloc
/* 1ECC0 8001E0C0 24061C00 */   addiu     $a2, $zero, 0x1c00
/* 1ECC4 8001E0C4 27A40010 */  addiu      $a0, $sp, 0x10
/* 1ECC8 8001E0C8 0C00780D */  jal        func_8001E034
/* 1ECCC 8001E0CC 24050001 */   addiu     $a1, $zero, 1
/* 1ECD0 8001E0D0 0C0077C0 */  jal        copy_questdata
/* 1ECD4 8001E0D4 8FA40024 */   lw        $a0, 0x24($sp)
/* 1ECD8 8001E0D8 02002021 */  addu       $a0, $s0, $zero
/* 1ECDC 8001E0DC 0C0356E6 */  jal        func_800D5B98
/* 1ECE0 8001E0E0 24051C00 */   addiu     $a1, $zero, 0x1c00
/* 1ECE4 8001E0E4 8FBF0054 */  lw         $ra, 0x54($sp)
/* 1ECE8 8001E0E8 8FB00050 */  lw         $s0, 0x50($sp)
/* 1ECEC 8001E0EC 24020001 */  addiu      $v0, $zero, 1
/* 1ECF0 8001E0F0 03E00008 */  jr         $ra
/* 1ECF4 8001E0F4 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_8001E0F8
/* 1ECF8 8001E0F8 24820040 */  addiu      $v0, $a0, 0x40
/* 1ECFC 8001E0FC ACA20008 */  sw         $v0, 8($a1)
/* 1ED00 8001E100 24820080 */  addiu      $v0, $a0, 0x80
/* 1ED04 8001E104 ACA2000C */  sw         $v0, 0xc($a1)
/* 1ED08 8001E108 24820300 */  addiu      $v0, $a0, 0x300
/* 1ED0C 8001E10C ACA20014 */  sw         $v0, 0x14($a1)
/* 1ED10 8001E110 24821300 */  addiu      $v0, $a0, 0x1300
/* 1ED14 8001E114 ACA20018 */  sw         $v0, 0x18($a1)
/* 1ED18 8001E118 24821340 */  addiu      $v0, $a0, 0x1340
/* 1ED1C 8001E11C ACA20010 */  sw         $v0, 0x10($a1)
/* 1ED20 8001E120 24821B00 */  addiu      $v0, $a0, 0x1b00
/* 1ED24 8001E124 ACA40000 */  sw         $a0, ($a1)
/* 1ED28 8001E128 ACA40004 */  sw         $a0, 4($a1)
/* 1ED2C 8001E12C 03E00008 */  jr         $ra
/* 1ED30 8001E130 ACA2001C */   sw        $v0, 0x1c($a1)

glabel memMaker_sub
/* 1ED34 8001E134 24820040 */  addiu      $v0, $a0, 0x40
/* 1ED38 8001E138 ACA20008 */  sw         $v0, 8($a1)
/* 1ED3C 8001E13C 24820080 */  addiu      $v0, $a0, 0x80
/* 1ED40 8001E140 ACA2000C */  sw         $v0, 0xc($a1)
/* 1ED44 8001E144 24820300 */  addiu      $v0, $a0, 0x300
/* 1ED48 8001E148 ACA20018 */  sw         $v0, 0x18($a1)
/* 1ED4C 8001E14C 24820340 */  addiu      $v0, $a0, 0x340
/* 1ED50 8001E150 ACA20010 */  sw         $v0, 0x10($a1)
/* 1ED54 8001E154 24820B00 */  addiu      $v0, $a0, 0xb00
/* 1ED58 8001E158 ACA40000 */  sw         $a0, ($a1)
/* 1ED5C 8001E15C ACA40004 */  sw         $a0, 4($a1)
/* 1ED60 8001E160 03E00008 */  jr         $ra
/* 1ED64 8001E164 ACA2001C */   sw        $v0, 0x1c($a1)

glabel some_loadgame_func
/* 1ED68 8001E168 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1ED6C 8001E16C AFB10014 */  sw         $s1, 0x14($sp)
/* 1ED70 8001E170 00808821 */  addu       $s1, $a0, $zero
/* 1ED74 8001E174 AFB00010 */  sw         $s0, 0x10($sp)
/* 1ED78 8001E178 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1ED7C 8001E17C 0C017E30 */  jal        calloc_voxelChart
/* 1ED80 8001E180 00A08021 */   addu      $s0, $a1, $zero
/* 1ED84 8001E184 3C02800F */  lui        $v0, %hi(gameStates)
/* 1ED88 8001E188 8C449940 */  lw         $a0, %lo(gameStates)($v0)
/* 1ED8C 8001E18C 0C035515 */  jal        func_800D5454
/* 1ED90 8001E190 8E25000C */   lw        $a1, 0xc($s1)
/* 1ED94 8001E194 24040E21 */  addiu      $a0, $zero, 0xe21
/* 1ED98 8001E198 0C00918D */  jal        setEventFlag
/* 1ED9C 8001E19C 00002821 */   addu      $a1, $zero, $zero
/* 1EDA0 8001E1A0 8E240008 */  lw         $a0, 8($s1)
/* 1EDA4 8001E1A4 0C007925 */  jal        loadgame_teleport
/* 1EDA8 8001E1A8 02002821 */   addu      $a1, $s0, $zero
/* 1EDAC 8001E1AC 0C0144AE */  jal        loadgame_minimap_dat
/* 1EDB0 8001E1B0 8E240018 */   lw        $a0, 0x18($s1)
/* 1EDB4 8001E1B4 0C0076CB */  jal        load_game_func
/* 1EDB8 8001E1B8 8E240010 */   lw        $a0, 0x10($s1)
/* 1EDBC 8001E1BC 0C00779C */  jal        func_8001DE70
/* 1EDC0 8001E1C0 8E24001C */   lw        $a0, 0x1c($s1)
/* 1EDC4 8001E1C4 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* 1EDC8 8001E1C8 8E240004 */  lw         $a0, 4($s1)
/* 1EDCC 8001E1CC 8C651BBC */  lw         $a1, %lo(TerrainPointer)($v1)
/* 1EDD0 8001E1D0 8C820000 */  lw         $v0, ($a0)
/* 1EDD4 8001E1D4 1200000C */  beqz       $s0, .L8001E208
/* 1EDD8 8001E1D8 ACA20034 */   sw        $v0, 0x34($a1)
/* 1EDDC 8001E1DC 3C02800F */  lui        $v0, %hi(engineZone_flag)
/* 1EDE0 8001E1E0 3C03800E */  lui        $v1, %hi(gGlobals)
/* 1EDE4 8001E1E4 8E240008 */  lw         $a0, 8($s1)
/* 1EDE8 8001E1E8 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 1EDEC 8001E1EC A4408DAC */  sh         $zero, %lo(engineZone_flag)($v0)
/* 1EDF0 8001E1F0 24020001 */  addiu      $v0, $zero, 1
/* 1EDF4 8001E1F4 A46200B6 */  sh         $v0, 0xb6($v1)
/* 1EDF8 8001E1F8 2402FFFF */  addiu      $v0, $zero, -1
/* 1EDFC 8001E1FC A4820026 */  sh         $v0, 0x26($a0)
/* 1EE00 8001E200 A462038E */  sh         $v0, 0x38e($v1)
/* 1EE04 8001E204 A462100A */  sh         $v0, 0x100a($v1)
.L8001E208:
/* 1EE08 8001E208 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1EE0C 8001E20C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1EE10 8001E210 8FB00010 */  lw         $s0, 0x10($sp)
/* 1EE14 8001E214 03E00008 */  jr         $ra
/* 1EE18 8001E218 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001E21C
/* 1EE1C 8001E21C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 1EE20 8001E220 AFBF0050 */  sw         $ra, 0x50($sp)
/* 1EE24 8001E224 0C00783E */  jal        func_8001E0F8
/* 1EE28 8001E228 27A50010 */   addiu     $a1, $sp, 0x10
/* 1EE2C 8001E22C 27A40010 */  addiu      $a0, $sp, 0x10
/* 1EE30 8001E230 0C00785A */  jal        some_loadgame_func
/* 1EE34 8001E234 24050001 */   addiu     $a1, $zero, 1
/* 1EE38 8001E238 8FBF0050 */  lw         $ra, 0x50($sp)
/* 1EE3C 8001E23C 24020001 */  addiu      $v0, $zero, 1
/* 1EE40 8001E240 03E00008 */  jr         $ra
/* 1EE44 8001E244 27BD0058 */   addiu     $sp, $sp, 0x58

glabel questdata_func
/* 1EE48 8001E248 3C02800F */  lui        $v0, %hi(questdata_pointer)
/* 1EE4C 8001E24C 8C438F20 */  lw         $v1, %lo(questdata_pointer)($v0)
/* 1EE50 8001E250 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 1EE54 8001E254 AFB40030 */  sw         $s4, 0x30($sp)
/* 1EE58 8001E258 0040A021 */  addu       $s4, $v0, $zero
/* 1EE5C 8001E25C AFBF0034 */  sw         $ra, 0x34($sp)
/* 1EE60 8001E260 AFB3002C */  sw         $s3, 0x2c($sp)
/* 1EE64 8001E264 AFB20028 */  sw         $s2, 0x28($sp)
/* 1EE68 8001E268 AFB10024 */  sw         $s1, 0x24($sp)
/* 1EE6C 8001E26C 14600072 */  bnez       $v1, .L8001E438
/* 1EE70 8001E270 AFB00020 */   sw        $s0, 0x20($sp)
/* 1EE74 8001E274 24041000 */  addiu      $a0, $zero, 0x1000
/* 1EE78 8001E278 3C05800E */  lui        $a1, %hi(D_800D9790)
/* 1EE7C 8001E27C 24A59790 */  addiu      $a1, $a1, %lo(D_800D9790)
/* 1EE80 8001E280 0C025F9C */  jal        Malloc
/* 1EE84 8001E284 24060288 */   addiu     $a2, $zero, 0x288
/* 1EE88 8001E288 0C0025B4 */  jal        get_hres
/* 1EE8C 8001E28C AE828F20 */   sw        $v0, -0x70e0($s4)
/* 1EE90 8001E290 0C0025B7 */  jal        get_vres
/* 1EE94 8001E294 00408021 */   addu      $s0, $v0, $zero
/* 1EE98 8001E298 44902000 */  mtc1       $s0, $f4
/* 1EE9C 8001E29C 46802120 */  cvt.s.w    $f4, $f4
/* 1EEA0 8001E2A0 2410003C */  addiu      $s0, $zero, 0x3c
/* 1EEA4 8001E2A4 241100F0 */  addiu      $s1, $zero, 0xf0
/* 1EEA8 8001E2A8 241200B4 */  addiu      $s2, $zero, 0xb4
/* 1EEAC 8001E2AC 3C01800E */  lui        $at, %hi(D_800D97A4)
/* 1EEB0 8001E2B0 C42097A4 */  lwc1       $f0, %lo(D_800D97A4)($at)
/* 1EEB4 8001E2B4 3C01800E */  lui        $at, %hi(D_800D97A8)
/* 1EEB8 8001E2B8 C42297A8 */  lwc1       $f2, %lo(D_800D97A8)($at)
/* 1EEBC 8001E2BC 46002103 */  div.s      $f4, $f4, $f0
/* 1EEC0 8001E2C0 46022182 */  mul.s      $f6, $f4, $f2
/* 1EEC4 8001E2C4 3C01800E */  lui        $at, %hi(D_800D97AC)
/* 1EEC8 8001E2C8 C42897AC */  lwc1       $f8, %lo(D_800D97AC)($at)
/* 1EECC 8001E2CC 3C01800E */  lui        $at, %hi(D_800D97B0)
/* 1EED0 8001E2D0 C42297B0 */  lwc1       $f2, %lo(D_800D97B0)($at)
/* 1EED4 8001E2D4 44820000 */  mtc1       $v0, $f0
/* 1EED8 8001E2D8 46800020 */  cvt.s.w    $f0, $f0
/* 1EEDC 8001E2DC 4606403E */  c.le.s     $f8, $f6
/* 1EEE0 8001E2E0 00000000 */  nop
/* 1EEE4 8001E2E4 45010005 */  bc1t       .L8001E2FC
/* 1EEE8 8001E2E8 46020283 */   div.s     $f10, $f0, $f2
/* 1EEEC 8001E2EC 4600300D */  trunc.w.s  $f0, $f6
/* 1EEF0 8001E2F0 44030000 */  mfc1       $v1, $f0
/* 1EEF4 8001E2F4 080078C4 */  j          .L8001E310
/* 1EEF8 8001E2F8 00000000 */   nop
.L8001E2FC:
/* 1EEFC 8001E2FC 46083001 */  sub.s      $f0, $f6, $f8
/* 1EF00 8001E300 4600008D */  trunc.w.s  $f2, $f0
/* 1EF04 8001E304 44031000 */  mfc1       $v1, $f2
/* 1EF08 8001E308 3C028000 */  lui        $v0, 0x8000
/* 1EF0C 8001E30C 00621825 */  or         $v1, $v1, $v0
.L8001E310:
/* 1EF10 8001E310 44900000 */  mtc1       $s0, $f0
/* 1EF14 8001E314 46800020 */  cvt.s.w    $f0, $f0
/* 1EF18 8001E318 460A0002 */  mul.s      $f0, $f0, $f10
/* 1EF1C 8001E31C 3C01800E */  lui        $at, %hi(D_800D97B4)
/* 1EF20 8001E320 C42297B4 */  lwc1       $f2, %lo(D_800D97B4)($at)
/* 1EF24 8001E324 4600103E */  c.le.s     $f2, $f0
/* 1EF28 8001E328 00000000 */  nop
/* 1EF2C 8001E32C 45010005 */  bc1t       .L8001E344
/* 1EF30 8001E330 3073FFFF */   andi      $s3, $v1, 0xffff
/* 1EF34 8001E334 4600008D */  trunc.w.s  $f2, $f0
/* 1EF38 8001E338 44031000 */  mfc1       $v1, $f2
/* 1EF3C 8001E33C 080078D6 */  j          .L8001E358
/* 1EF40 8001E340 00000000 */   nop
.L8001E344:
/* 1EF44 8001E344 46020001 */  sub.s      $f0, $f0, $f2
/* 1EF48 8001E348 4600008D */  trunc.w.s  $f2, $f0
/* 1EF4C 8001E34C 44031000 */  mfc1       $v1, $f2
/* 1EF50 8001E350 3C028000 */  lui        $v0, 0x8000
/* 1EF54 8001E354 00621825 */  or         $v1, $v1, $v0
.L8001E358:
/* 1EF58 8001E358 44910000 */  mtc1       $s1, $f0
/* 1EF5C 8001E35C 46800020 */  cvt.s.w    $f0, $f0
/* 1EF60 8001E360 46040002 */  mul.s      $f0, $f0, $f4
/* 1EF64 8001E364 3C01800E */  lui        $at, %hi(D_800D97B8)
/* 1EF68 8001E368 C42497B8 */  lwc1       $f4, %lo(D_800D97B8)($at)
/* 1EF6C 8001E36C 4600203E */  c.le.s     $f4, $f0
/* 1EF70 8001E370 00000000 */  nop
/* 1EF74 8001E374 45010005 */  bc1t       .L8001E38C
/* 1EF78 8001E378 3070FFFF */   andi      $s0, $v1, 0xffff
/* 1EF7C 8001E37C 4600008D */  trunc.w.s  $f2, $f0
/* 1EF80 8001E380 44031000 */  mfc1       $v1, $f2
/* 1EF84 8001E384 080078E8 */  j          .L8001E3A0
/* 1EF88 8001E388 00000000 */   nop
.L8001E38C:
/* 1EF8C 8001E38C 46040001 */  sub.s      $f0, $f0, $f4
/* 1EF90 8001E390 4600008D */  trunc.w.s  $f2, $f0
/* 1EF94 8001E394 44031000 */  mfc1       $v1, $f2
/* 1EF98 8001E398 3C028000 */  lui        $v0, 0x8000
/* 1EF9C 8001E39C 00621825 */  or         $v1, $v1, $v0
.L8001E3A0:
/* 1EFA0 8001E3A0 44920000 */  mtc1       $s2, $f0
/* 1EFA4 8001E3A4 46800020 */  cvt.s.w    $f0, $f0
/* 1EFA8 8001E3A8 460A0002 */  mul.s      $f0, $f0, $f10
/* 1EFAC 8001E3AC 3C01800E */  lui        $at, %hi(D_800D97BC)
/* 1EFB0 8001E3B0 C42297BC */  lwc1       $f2, %lo(D_800D97BC)($at)
/* 1EFB4 8001E3B4 4600103E */  c.le.s     $f2, $f0
/* 1EFB8 8001E3B8 00000000 */  nop
/* 1EFBC 8001E3BC 45010005 */  bc1t       .L8001E3D4
/* 1EFC0 8001E3C0 3071FFFF */   andi      $s1, $v1, 0xffff
/* 1EFC4 8001E3C4 4600008D */  trunc.w.s  $f2, $f0
/* 1EFC8 8001E3C8 44031000 */  mfc1       $v1, $f2
/* 1EFCC 8001E3CC 080078FB */  j          .L8001E3EC
/* 1EFD0 8001E3D0 3072FFFF */   andi      $s2, $v1, 0xffff
.L8001E3D4:
/* 1EFD4 8001E3D4 46020001 */  sub.s      $f0, $f0, $f2
/* 1EFD8 8001E3D8 4600008D */  trunc.w.s  $f2, $f0
/* 1EFDC 8001E3DC 44031000 */  mfc1       $v1, $f2
/* 1EFE0 8001E3E0 3C028000 */  lui        $v0, 0x8000
/* 1EFE4 8001E3E4 00621825 */  or         $v1, $v1, $v0
/* 1EFE8 8001E3E8 3072FFFF */  andi       $s2, $v1, 0xffff
.L8001E3EC:
/* 1EFEC 8001E3EC 24050040 */  addiu      $a1, $zero, 0x40
/* 1EFF0 8001E3F0 24060020 */  addiu      $a2, $zero, 0x20
/* 1EFF4 8001E3F4 8E848F20 */  lw         $a0, -0x70e0($s4)
/* 1EFF8 8001E3F8 24070010 */  addiu      $a3, $zero, 0x10
/* 1EFFC 8001E3FC AFB30010 */  sw         $s3, 0x10($sp)
/* 1F000 8001E400 AFB00014 */  sw         $s0, 0x14($sp)
/* 1F004 8001E404 AFB10018 */  sw         $s1, 0x18($sp)
/* 1F008 8001E408 0C0025BD */  jal        getGfxLastFrame
/* 1F00C 8001E40C AFB2001C */   sw        $s2, 0x1c($sp)
/* 1F010 8001E410 3C10800F */  lui        $s0, %hi(WeatherTemp)
/* 1F014 8001E414 261053B0 */  addiu      $s0, $s0, %lo(WeatherTemp)
/* 1F018 8001E418 02002021 */  addu       $a0, $s0, $zero
/* 1F01C 8001E41C 00002821 */  addu       $a1, $zero, $zero
/* 1F020 8001E420 0C026380 */  jal        Calloc
/* 1F024 8001E424 24060010 */   addiu     $a2, $zero, 0x10
/* 1F028 8001E428 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* 1F02C 8001E42C 8C641BBC */  lw         $a0, %lo(TerrainPointer)($v1)
/* 1F030 8001E430 0C02149B */  jal        get_WeatherTemp
/* 1F034 8001E434 02002821 */   addu      $a1, $s0, $zero
.L8001E438:
/* 1F038 8001E438 8FBF0034 */  lw         $ra, 0x34($sp)
/* 1F03C 8001E43C 8FB40030 */  lw         $s4, 0x30($sp)
/* 1F040 8001E440 8FB3002C */  lw         $s3, 0x2c($sp)
/* 1F044 8001E444 8FB20028 */  lw         $s2, 0x28($sp)
/* 1F048 8001E448 8FB10024 */  lw         $s1, 0x24($sp)
/* 1F04C 8001E44C 8FB00020 */  lw         $s0, 0x20($sp)
/* 1F050 8001E450 03E00008 */  jr         $ra
/* 1F054 8001E454 27BD0038 */   addiu     $sp, $sp, 0x38

glabel questdata_free
/* 1F058 8001E458 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1F05C 8001E45C AFB00010 */  sw         $s0, 0x10($sp)
/* 1F060 8001E460 3C10800F */  lui        $s0, %hi(questdata_pointer)
/* 1F064 8001E464 8E048F20 */  lw         $a0, %lo(questdata_pointer)($s0)
/* 1F068 8001E468 10800006 */  beqz       $a0, .L8001E484
/* 1F06C 8001E46C AFBF0014 */   sw        $ra, 0x14($sp)
/* 1F070 8001E470 3C05800E */  lui        $a1, %hi(D_800D9790)
/* 1F074 8001E474 24A59790 */  addiu      $a1, $a1, %lo(D_800D9790)
/* 1F078 8001E478 0C02600C */  jal        Free
/* 1F07C 8001E47C 240602B1 */   addiu     $a2, $zero, 0x2b1
/* 1F080 8001E480 AE008F20 */  sw         $zero, -0x70e0($s0)
.L8001E484:
/* 1F084 8001E484 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1F088 8001E488 8FB00010 */  lw         $s0, 0x10($sp)
/* 1F08C 8001E48C 03E00008 */  jr         $ra
/* 1F090 8001E490 27BD0018 */   addiu     $sp, $sp, 0x18

glabel loadgame_teleport
/* 1F094 8001E494 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1F098 8001E498 AFB00010 */  sw         $s0, 0x10($sp)
/* 1F09C 8001E49C 00808021 */  addu       $s0, $a0, $zero
/* 1F0A0 8001E4A0 3C02800E */  lui        $v0, %hi(mapFloatDatEntry)
/* 1F0A4 8001E4A4 AFB10014 */  sw         $s1, 0x14($sp)
/* 1F0A8 8001E4A8 2451788C */  addiu      $s1, $v0, %lo(mapFloatDatEntry)
/* 1F0AC 8001E4AC 10A0000F */  beqz       $a1, .L8001E4EC
/* 1F0B0 8001E4B0 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1F0B4 8001E4B4 02202021 */  addu       $a0, $s1, $zero
/* 1F0B8 8001E4B8 02002821 */  addu       $a1, $s0, $zero
/* 1F0BC 8001E4BC 0C033547 */  jal        memcpy
/* 1F0C0 8001E4C0 2406002C */   addiu     $a2, $zero, 0x2c
/* 1F0C4 8001E4C4 2623F01C */  addiu      $v1, $s1, -0xfe4
/* 1F0C8 8001E4C8 8C6400A8 */  lw         $a0, 0xa8($v1)
/* 1F0CC 8001E4CC 24020001 */  addiu      $v0, $zero, 1
/* 1F0D0 8001E4D0 10800006 */  beqz       $a0, .L8001E4EC
/* 1F0D4 8001E4D4 A46200B6 */   sh        $v0, 0xb6($v1)
/* 1F0D8 8001E4D8 86040024 */  lh         $a0, 0x24($s0)
/* 1F0DC 8001E4DC 86050020 */  lh         $a1, 0x20($s0)
/* 1F0E0 8001E4E0 86060022 */  lh         $a2, 0x22($s0)
/* 1F0E4 8001E4E4 0C00352E */  jal        set_teleport_obj_loadgame
/* 1F0E8 8001E4E8 02003821 */   addu      $a3, $s0, $zero
.L8001E4EC:
/* 1F0EC 8001E4EC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1F0F0 8001E4F0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1F0F4 8001E4F4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1F0F8 8001E4F8 03E00008 */  jr         $ra
/* 1F0FC 8001E4FC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_setting_weather
/* 1F100 8001E500 3C03800F */  lui        $v1, %hi(LoadedGameSaveFlag)
/* 1F104 8001E504 8C628F24 */  lw         $v0, %lo(LoadedGameSaveFlag)($v1)
/* 1F108 8001E508 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1F10C 8001E50C 10400007 */  beqz       $v0, .L8001E52C
/* 1F110 8001E510 AFBF0010 */   sw        $ra, 0x10($sp)
/* 1F114 8001E514 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 1F118 8001E518 3C05800F */  lui        $a1, %hi(WeatherTemp)
/* 1F11C 8001E51C 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* 1F120 8001E520 24A553B0 */  addiu      $a1, $a1, %lo(WeatherTemp)
/* 1F124 8001E524 0C021487 */  jal        set_with_WeatherTemp
/* 1F128 8001E528 AC608F24 */   sw        $zero, -0x70dc($v1)
.L8001E52C:
/* 1F12C 8001E52C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1F130 8001E530 03E00008 */  jr         $ra
/* 1F134 8001E534 27BD0018 */   addiu     $sp, $sp, 0x18
/* 1F138 8001E538 00000000 */  nop
/* 1F13C 8001E53C 00000000 */  nop
