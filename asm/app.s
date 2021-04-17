.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel display_debug_stats
/* 1F3A0 8001E7A0 3C02800E */  lui        $v0, %hi(debug_flag)
/* 1F3A4 8001E7A4 944368A0 */  lhu        $v1, %lo(debug_flag)($v0)
/* 1F3A8 8001E7A8 27BDFF70 */  addiu      $sp, $sp, -0x90
/* 1F3AC 8001E7AC AFB10054 */  sw         $s1, 0x54($sp)
/* 1F3B0 8001E7B0 AFBF0070 */  sw         $ra, 0x70($sp)
/* 1F3B4 8001E7B4 AFB7006C */  sw         $s7, 0x6c($sp)
/* 1F3B8 8001E7B8 AFB60068 */  sw         $s6, 0x68($sp)
/* 1F3BC 8001E7BC AFB50064 */  sw         $s5, 0x64($sp)
/* 1F3C0 8001E7C0 AFB40060 */  sw         $s4, 0x60($sp)
/* 1F3C4 8001E7C4 AFB3005C */  sw         $s3, 0x5c($sp)
/* 1F3C8 8001E7C8 AFB20058 */  sw         $s2, 0x58($sp)
/* 1F3CC 8001E7CC AFB00050 */  sw         $s0, 0x50($sp)
/* 1F3D0 8001E7D0 F7B80088 */  sdc1       $f24, 0x88($sp)
/* 1F3D4 8001E7D4 F7B60080 */  sdc1       $f22, 0x80($sp)
/* 1F3D8 8001E7D8 F7B40078 */  sdc1       $f20, 0x78($sp)
/* 1F3DC 8001E7DC 10600100 */  beqz       $v1, .L8001EBE0
/* 1F3E0 8001E7E0 00808821 */   addu      $s1, $a0, $zero
/* 1F3E4 8001E7E4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 1F3E8 8001E7E8 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 1F3EC 8001E7EC C642000C */  lwc1       $f2, 0xc($s2)
/* 1F3F0 8001E7F0 3C01800E */  lui        $at, %hi(D_800D984C)
/* 1F3F4 8001E7F4 C420984C */  lwc1       $f0, %lo(D_800D984C)($at)
/* 1F3F8 8001E7F8 4600103C */  c.lt.s     $f2, $f0
/* 1F3FC 8001E7FC 00000000 */  nop
/* 1F400 8001E800 450100F7 */  bc1t       .L8001EBE0
/* 1F404 8001E804 0040B821 */   addu      $s7, $v0, $zero
/* 1F408 8001E808 92422034 */  lbu        $v0, 0x2034($s2)
/* 1F40C 8001E80C 2442FFFF */  addiu      $v0, $v0, -1
/* 1F410 8001E810 2C420003 */  sltiu      $v0, $v0, 3
/* 1F414 8001E814 10400005 */  beqz       $v0, .L8001E82C
/* 1F418 8001E818 26552078 */   addiu     $s5, $s2, 0x2078
/* 1F41C 8001E81C 0C002A19 */  jal        DisplaySystemMonitor
/* 1F420 8001E820 02202021 */   addu      $a0, $s1, $zero
/* 1F424 8001E824 00408821 */  addu       $s1, $v0, $zero
/* 1F428 8001E828 26552078 */  addiu      $s5, $s2, 0x2078
.L8001E82C:
/* 1F42C 8001E82C 02A02021 */  addu       $a0, $s5, $zero
/* 1F430 8001E830 3C05800E */  lui        $a1, %hi(D_800D97D0)
/* 1F434 8001E834 24A597D0 */  addiu      $a1, $a1, %lo(D_800D97D0)
/* 1F438 8001E838 C640000C */  lwc1       $f0, 0xc($s2)
/* 1F43C 8001E83C 3C01800E */  lui        $at, %hi(D_800D9850)
/* 1F440 8001E840 D4229850 */  ldc1       $f2, %lo(D_800D9850)($at)
/* 1F444 8001E844 46000021 */  cvt.d.s    $f0, $f0
/* 1F448 8001E848 46201083 */  div.d      $f2, $f2, $f0
/* 1F44C 8001E84C 4620100D */  trunc.w.d  $f0, $f2
/* 1F450 8001E850 44060000 */  mfc1       $a2, $f0
/* 1F454 8001E854 00063400 */  sll        $a2, $a2, 0x10
/* 1F458 8001E858 0C0333AC */  jal        sprintf
/* 1F45C 8001E85C 00063403 */   sra       $a2, $a2, 0x10
/* 1F460 8001E860 02202021 */  addu       $a0, $s1, $zero
/* 1F464 8001E864 02A02821 */  addu       $a1, $s5, $zero
/* 1F468 8001E868 24060120 */  addiu      $a2, $zero, 0x120
/* 1F46C 8001E86C 240700D7 */  addiu      $a3, $zero, 0xd7
/* 1F470 8001E870 24140080 */  addiu      $s4, $zero, 0x80
/* 1F474 8001E874 241600FF */  addiu      $s6, $zero, 0xff
/* 1F478 8001E878 AFB40010 */  sw         $s4, 0x10($sp)
/* 1F47C 8001E87C AFB40014 */  sw         $s4, 0x14($sp)
/* 1F480 8001E880 AFB40018 */  sw         $s4, 0x18($sp)
/* 1F484 8001E884 0C0028C5 */  jal        some_debug_print
/* 1F488 8001E888 AFB6001C */   sw        $s6, 0x1c($sp)
/* 1F48C 8001E88C 92432034 */  lbu        $v1, 0x2034($s2)
/* 1F490 8001E890 106000D3 */  beqz       $v1, .L8001EBE0
/* 1F494 8001E894 00408821 */   addu      $s1, $v0, $zero
/* 1F498 8001E898 0C0025B4 */  jal        get_hres
/* 1F49C 8001E89C 00000000 */   nop
/* 1F4A0 8001E8A0 0C0025B7 */  jal        get_vres
/* 1F4A4 8001E8A4 00408021 */   addu      $s0, $v0, $zero
/* 1F4A8 8001E8A8 02202021 */  addu       $a0, $s1, $zero
/* 1F4AC 8001E8AC 24050006 */  addiu      $a1, $zero, 6
/* 1F4B0 8001E8B0 02003021 */  addu       $a2, $s0, $zero
/* 1F4B4 8001E8B4 0C0290ED */  jal        rsp_func
/* 1F4B8 8001E8B8 00403821 */   addu      $a3, $v0, $zero
/* 1F4BC 8001E8BC 92432034 */  lbu        $v1, 0x2034($s2)
/* 1F4C0 8001E8C0 30630001 */  andi       $v1, $v1, 1
/* 1F4C4 8001E8C4 106000C6 */  beqz       $v1, .L8001EBE0
/* 1F4C8 8001E8C8 00408821 */   addu      $s1, $v0, $zero
/* 1F4CC 8001E8CC 0C026098 */  jal        get_obj_free
/* 1F4D0 8001E8D0 8E5300A8 */   lw        $s3, 0xa8($s2)
/* 1F4D4 8001E8D4 0C02608F */  jal        get_MemFree
/* 1F4D8 8001E8D8 3050FFFF */   andi      $s0, $v0, 0xffff
/* 1F4DC 8001E8DC 44821000 */  mtc1       $v0, $f2
/* 1F4E0 8001E8E0 468010A1 */  cvt.d.w    $f2, $f2
/* 1F4E4 8001E8E4 04410004 */  bgez       $v0, .L8001E8F8
/* 1F4E8 8001E8E8 00000000 */   nop
/* 1F4EC 8001E8EC 3C01800E */  lui        $at, %hi(D_800D9858)
/* 1F4F0 8001E8F0 D4209858 */  ldc1       $f0, %lo(D_800D9858)($at)
/* 1F4F4 8001E8F4 46201080 */  add.d      $f2, $f2, $f0
.L8001E8F8:
/* 1F4F8 8001E8F8 0C02609B */  jal        get_memFree_2
/* 1F4FC 8001E8FC 46201520 */   cvt.s.d   $f20, $f2
/* 1F500 8001E900 44821000 */  mtc1       $v0, $f2
/* 1F504 8001E904 468010A1 */  cvt.d.w    $f2, $f2
/* 1F508 8001E908 04410004 */  bgez       $v0, .L8001E91C
/* 1F50C 8001E90C 02202021 */   addu      $a0, $s1, $zero
/* 1F510 8001E910 3C01800E */  lui        $at, %hi(D_800D9860)
/* 1F514 8001E914 D4209860 */  ldc1       $f0, %lo(D_800D9860)($at)
/* 1F518 8001E918 46201080 */  add.d      $f2, $f2, $f0
.L8001E91C:
/* 1F51C 8001E91C 24050012 */  addiu      $a1, $zero, 0x12
/* 1F520 8001E920 240600C4 */  addiu      $a2, $zero, 0xc4
/* 1F524 8001E924 24070114 */  addiu      $a3, $zero, 0x114
/* 1F528 8001E928 240200DE */  addiu      $v0, $zero, 0xde
/* 1F52C 8001E92C 462015A0 */  cvt.s.d    $f22, $f2
/* 1F530 8001E930 AFA20010 */  sw         $v0, 0x10($sp)
/* 1F534 8001E934 AFA00014 */  sw         $zero, 0x14($sp)
/* 1F538 8001E938 AFA00018 */  sw         $zero, 0x18($sp)
/* 1F53C 8001E93C AFA0001C */  sw         $zero, 0x1c($sp)
/* 1F540 8001E940 0C0299E5 */  jal        gsFadeInOut
/* 1F544 8001E944 AFB40020 */   sw        $s4, 0x20($sp)
/* 1F548 8001E948 00408821 */  addu       $s1, $v0, $zero
/* 1F54C 8001E94C 4614B603 */  div.s      $f24, $f22, $f20
/* 1F550 8001E950 1260005C */  beqz       $s3, .L8001EAC4
/* 1F554 8001E954 265200E0 */   addiu     $s2, $s2, 0xe0
/* 1F558 8001E958 02A02021 */  addu       $a0, $s5, $zero
/* 1F55C 8001E95C 3C05800E */  lui        $a1, 0x800e
/* 1F560 8001E960 3C03800F */  lui        $v1, %hi(ground_labels)
/* 1F564 8001E964 96660100 */  lhu        $a2, 0x100($s3)
/* 1F568 8001E968 8C678DC8 */  lw         $a3, %lo(ground_labels)($v1)
/* 1F56C 8001E96C 00061080 */  sll        $v0, $a2, 2
/* 1F570 8001E970 00471021 */  addu       $v0, $v0, $a3
/* 1F574 8001E974 8C470000 */  lw         $a3, ($v0)
/* 1F578 8001E978 0C0333AC */  jal        sprintf
/* 1F57C 8001E97C 24A597D4 */   addiu     $a1, $a1, -0x682c
/* 1F580 8001E980 02202021 */  addu       $a0, $s1, $zero
/* 1F584 8001E984 02A02821 */  addu       $a1, $s5, $zero
/* 1F588 8001E988 24060012 */  addiu      $a2, $zero, 0x12
/* 1F58C 8001E98C 240700C4 */  addiu      $a3, $zero, 0xc4
/* 1F590 8001E990 240200C8 */  addiu      $v0, $zero, 0xc8
/* 1F594 8001E994 AFA00010 */  sw         $zero, 0x10($sp)
/* 1F598 8001E998 AFA20014 */  sw         $v0, 0x14($sp)
/* 1F59C 8001E99C AFA20018 */  sw         $v0, 0x18($sp)
/* 1F5A0 8001E9A0 0C0028C5 */  jal        some_debug_print
/* 1F5A4 8001E9A4 AFB6001C */   sw        $s6, 0x1c($sp)
/* 1F5A8 8001E9A8 3C01800E */  lui        $at, %hi(D_800D9868)
/* 1F5AC 8001E9AC C4209868 */  lwc1       $f0, %lo(D_800D9868)($at)
/* 1F5B0 8001E9B0 4600C002 */  mul.s      $f0, $f24, $f0
/* 1F5B4 8001E9B4 3C01800E */  lui        $at, %hi(D_800D986C)
/* 1F5B8 8001E9B8 C422986C */  lwc1       $f2, %lo(D_800D986C)($at)
/* 1F5BC 8001E9BC 00408821 */  addu       $s1, $v0, $zero
/* 1F5C0 8001E9C0 4602A082 */  mul.s      $f2, $f20, $f2
/* 1F5C4 8001E9C4 3C02800E */  lui        $v0, 0x800e
/* 1F5C8 8001E9C8 3C01800E */  lui        $at, %hi(D_800D9870)
/* 1F5CC 8001E9CC C4249870 */  lwc1       $f4, %lo(D_800D9870)($at)
/* 1F5D0 8001E9D0 46000021 */  cvt.d.s    $f0, $f0
/* 1F5D4 8001E9D4 4602203E */  c.le.s     $f4, $f2
/* 1F5D8 8001E9D8 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 1F5DC 8001E9DC 45010005 */  bc1t       .L8001E9F4
/* 1F5E0 8001E9E0 244597E0 */   addiu     $a1, $v0, -0x6820
/* 1F5E4 8001E9E4 4600100D */  trunc.w.s  $f0, $f2
/* 1F5E8 8001E9E8 44030000 */  mfc1       $v1, $f0
/* 1F5EC 8001E9EC 08007A82 */  j          .L8001EA08
/* 1F5F0 8001E9F0 00000000 */   nop
.L8001E9F4:
/* 1F5F4 8001E9F4 46041001 */  sub.s      $f0, $f2, $f4
/* 1F5F8 8001E9F8 4600008D */  trunc.w.s  $f2, $f0
/* 1F5FC 8001E9FC 44031000 */  mfc1       $v1, $f2
/* 1F600 8001EA00 3C028000 */  lui        $v0, 0x8000
/* 1F604 8001EA04 00621825 */  or         $v1, $v1, $v0
.L8001EA08:
/* 1F608 8001EA08 3C01800E */  lui        $at, %hi(D_800D9874)
/* 1F60C 8001EA0C C4209874 */  lwc1       $f0, %lo(D_800D9874)($at)
/* 1F610 8001EA10 4600B002 */  mul.s      $f0, $f22, $f0
/* 1F614 8001EA14 3C01800E */  lui        $at, %hi(D_800D9878)
/* 1F618 8001EA18 C4229878 */  lwc1       $f2, %lo(D_800D9878)($at)
/* 1F61C 8001EA1C 4600103E */  c.le.s     $f2, $f0
/* 1F620 8001EA20 00000000 */  nop
/* 1F624 8001EA24 45010005 */  bc1t       .L8001EA3C
/* 1F628 8001EA28 AFA30018 */   sw        $v1, 0x18($sp)
/* 1F62C 8001EA2C 4600008D */  trunc.w.s  $f2, $f0
/* 1F630 8001EA30 44031000 */  mfc1       $v1, $f2
/* 1F634 8001EA34 08007A95 */  j          .L8001EA54
/* 1F638 8001EA38 AFA3001C */   sw        $v1, 0x1c($sp)
.L8001EA3C:
/* 1F63C 8001EA3C 46020001 */  sub.s      $f0, $f0, $f2
/* 1F640 8001EA40 4600008D */  trunc.w.s  $f2, $f0
/* 1F644 8001EA44 44031000 */  mfc1       $v1, $f2
/* 1F648 8001EA48 3C028000 */  lui        $v0, 0x8000
/* 1F64C 8001EA4C 00621825 */  or         $v1, $v1, $v0
/* 1F650 8001EA50 AFA3001C */  sw         $v1, 0x1c($sp)
.L8001EA54:
/* 1F654 8001EA54 86420292 */  lh         $v0, 0x292($s2)
/* 1F658 8001EA58 86430294 */  lh         $v1, 0x294($s2)
/* 1F65C 8001EA5C 864602AC */  lh         $a2, 0x2ac($s2)
/* 1F660 8001EA60 3C01800E */  lui        $at, %hi(D_800D987C)
/* 1F664 8001EA64 C422987C */  lwc1       $f2, %lo(D_800D987C)($at)
/* 1F668 8001EA68 24420040 */  addiu      $v0, $v0, 0x40
/* 1F66C 8001EA6C AFA60028 */  sw         $a2, 0x28($sp)
/* 1F670 8001EA70 02003021 */  addu       $a2, $s0, $zero
/* 1F674 8001EA74 AFA20020 */  sw         $v0, 0x20($sp)
/* 1F678 8001EA78 AFA30024 */  sw         $v1, 0x24($sp)
/* 1F67C 8001EA7C C6600068 */  lwc1       $f0, 0x68($s3)
/* 1F680 8001EA80 26F068A8 */  addiu      $s0, $s7, 0x68a8
/* 1F684 8001EA84 46000021 */  cvt.d.s    $f0, $f0
/* 1F688 8001EA88 F7A00030 */  sdc1       $f0, 0x30($sp)
/* 1F68C 8001EA8C C660006C */  lwc1       $f0, 0x6c($s3)
/* 1F690 8001EA90 C604000C */  lwc1       $f4, 0xc($s0)
/* 1F694 8001EA94 46000021 */  cvt.d.s    $f0, $f0
/* 1F698 8001EA98 46041083 */  div.s      $f2, $f2, $f4
/* 1F69C 8001EA9C F7A00038 */  sdc1       $f0, 0x38($sp)
/* 1F6A0 8001EAA0 C6600070 */  lwc1       $f0, 0x70($s3)
/* 1F6A4 8001EAA4 460010A1 */  cvt.d.s    $f2, $f2
/* 1F6A8 8001EAA8 F7A20048 */  sdc1       $f2, 0x48($sp)
/* 1F6AC 8001EAAC 46000021 */  cvt.d.s    $f0, $f0
/* 1F6B0 8001EAB0 F7A00040 */  sdc1       $f0, 0x40($sp)
/* 1F6B4 8001EAB4 0C0333AC */  jal        sprintf
/* 1F6B8 8001EAB8 02A02021 */   addu      $a0, $s5, $zero
/* 1F6BC 8001EABC 08007AEC */  j          .L8001EBB0
/* 1F6C0 8001EAC0 02202021 */   addu      $a0, $s1, $zero
.L8001EAC4:
/* 1F6C4 8001EAC4 3C01800E */  lui        $at, %hi(D_800D9880)
/* 1F6C8 8001EAC8 C4209880 */  lwc1       $f0, %lo(D_800D9880)($at)
/* 1F6CC 8001EACC 4600C002 */  mul.s      $f0, $f24, $f0
/* 1F6D0 8001EAD0 3C01800E */  lui        $at, %hi(D_800D9884)
/* 1F6D4 8001EAD4 C4229884 */  lwc1       $f2, %lo(D_800D9884)($at)
/* 1F6D8 8001EAD8 3C02800E */  lui        $v0, 0x800e
/* 1F6DC 8001EADC 4602A082 */  mul.s      $f2, $f20, $f2
/* 1F6E0 8001EAE0 3C01800E */  lui        $at, %hi(D_800D9888)
/* 1F6E4 8001EAE4 C4249888 */  lwc1       $f4, %lo(D_800D9888)($at)
/* 1F6E8 8001EAE8 46000021 */  cvt.d.s    $f0, $f0
/* 1F6EC 8001EAEC F7A00010 */  sdc1       $f0, 0x10($sp)
/* 1F6F0 8001EAF0 4602203E */  c.le.s     $f4, $f2
/* 1F6F4 8001EAF4 00000000 */  nop
/* 1F6F8 8001EAF8 45010005 */  bc1t       .L8001EB10
/* 1F6FC 8001EAFC 24459820 */   addiu     $a1, $v0, -0x67e0
/* 1F700 8001EB00 4600100D */  trunc.w.s  $f0, $f2
/* 1F704 8001EB04 44030000 */  mfc1       $v1, $f0
/* 1F708 8001EB08 08007AC9 */  j          .L8001EB24
/* 1F70C 8001EB0C 00000000 */   nop
.L8001EB10:
/* 1F710 8001EB10 46041001 */  sub.s      $f0, $f2, $f4
/* 1F714 8001EB14 4600008D */  trunc.w.s  $f2, $f0
/* 1F718 8001EB18 44031000 */  mfc1       $v1, $f2
/* 1F71C 8001EB1C 3C028000 */  lui        $v0, 0x8000
/* 1F720 8001EB20 00621825 */  or         $v1, $v1, $v0
.L8001EB24:
/* 1F724 8001EB24 3C01800E */  lui        $at, %hi(D_800D988C)
/* 1F728 8001EB28 C420988C */  lwc1       $f0, %lo(D_800D988C)($at)
/* 1F72C 8001EB2C 4600B002 */  mul.s      $f0, $f22, $f0
/* 1F730 8001EB30 3C01800E */  lui        $at, %hi(D_800D9890)
/* 1F734 8001EB34 C4229890 */  lwc1       $f2, %lo(D_800D9890)($at)
/* 1F738 8001EB38 4600103E */  c.le.s     $f2, $f0
/* 1F73C 8001EB3C 00000000 */  nop
/* 1F740 8001EB40 45010005 */  bc1t       .L8001EB58
/* 1F744 8001EB44 AFA30018 */   sw        $v1, 0x18($sp)
/* 1F748 8001EB48 4600008D */  trunc.w.s  $f2, $f0
/* 1F74C 8001EB4C 44031000 */  mfc1       $v1, $f2
/* 1F750 8001EB50 08007ADC */  j          .L8001EB70
/* 1F754 8001EB54 02003021 */   addu      $a2, $s0, $zero
.L8001EB58:
/* 1F758 8001EB58 46020001 */  sub.s      $f0, $f0, $f2
/* 1F75C 8001EB5C 4600008D */  trunc.w.s  $f2, $f0
/* 1F760 8001EB60 44031000 */  mfc1       $v1, $f2
/* 1F764 8001EB64 3C028000 */  lui        $v0, 0x8000
/* 1F768 8001EB68 00621825 */  or         $v1, $v1, $v0
/* 1F76C 8001EB6C 02003021 */  addu       $a2, $s0, $zero
.L8001EB70:
/* 1F770 8001EB70 26F068A8 */  addiu      $s0, $s7, 0x68a8
/* 1F774 8001EB74 AFA3001C */  sw         $v1, 0x1c($sp)
/* 1F778 8001EB78 86420292 */  lh         $v0, 0x292($s2)
/* 1F77C 8001EB7C 86430294 */  lh         $v1, 0x294($s2)
/* 1F780 8001EB80 C602000C */  lwc1       $f2, 0xc($s0)
/* 1F784 8001EB84 3C01800E */  lui        $at, %hi(D_800D9894)
/* 1F788 8001EB88 C4209894 */  lwc1       $f0, %lo(D_800D9894)($at)
/* 1F78C 8001EB8C 24420040 */  addiu      $v0, $v0, 0x40
/* 1F790 8001EB90 46020003 */  div.s      $f0, $f0, $f2
/* 1F794 8001EB94 46000021 */  cvt.d.s    $f0, $f0
/* 1F798 8001EB98 AFA20020 */  sw         $v0, 0x20($sp)
/* 1F79C 8001EB9C AFA30024 */  sw         $v1, 0x24($sp)
/* 1F7A0 8001EBA0 F7A00028 */  sdc1       $f0, 0x28($sp)
/* 1F7A4 8001EBA4 0C0333AC */  jal        sprintf
/* 1F7A8 8001EBA8 02A02021 */   addu      $a0, $s5, $zero
/* 1F7AC 8001EBAC 02202021 */  addu       $a0, $s1, $zero
.L8001EBB0:
/* 1F7B0 8001EBB0 26052078 */  addiu      $a1, $s0, 0x2078
/* 1F7B4 8001EBB4 24060012 */  addiu      $a2, $zero, 0x12
/* 1F7B8 8001EBB8 240700CC */  addiu      $a3, $zero, 0xcc
/* 1F7BC 8001EBBC 240300C8 */  addiu      $v1, $zero, 0xc8
/* 1F7C0 8001EBC0 24020020 */  addiu      $v0, $zero, 0x20
/* 1F7C4 8001EBC4 AFA20014 */  sw         $v0, 0x14($sp)
/* 1F7C8 8001EBC8 240200FF */  addiu      $v0, $zero, 0xff
/* 1F7CC 8001EBCC AFA30010 */  sw         $v1, 0x10($sp)
/* 1F7D0 8001EBD0 AFA30018 */  sw         $v1, 0x18($sp)
/* 1F7D4 8001EBD4 0C0028C5 */  jal        some_debug_print
/* 1F7D8 8001EBD8 AFA2001C */   sw        $v0, 0x1c($sp)
/* 1F7DC 8001EBDC 00408821 */  addu       $s1, $v0, $zero
.L8001EBE0:
/* 1F7E0 8001EBE0 02201021 */  addu       $v0, $s1, $zero
/* 1F7E4 8001EBE4 8FBF0070 */  lw         $ra, 0x70($sp)
/* 1F7E8 8001EBE8 8FB7006C */  lw         $s7, 0x6c($sp)
/* 1F7EC 8001EBEC 8FB60068 */  lw         $s6, 0x68($sp)
/* 1F7F0 8001EBF0 8FB50064 */  lw         $s5, 0x64($sp)
/* 1F7F4 8001EBF4 8FB40060 */  lw         $s4, 0x60($sp)
/* 1F7F8 8001EBF8 8FB3005C */  lw         $s3, 0x5c($sp)
/* 1F7FC 8001EBFC 8FB20058 */  lw         $s2, 0x58($sp)
/* 1F800 8001EC00 8FB10054 */  lw         $s1, 0x54($sp)
/* 1F804 8001EC04 8FB00050 */  lw         $s0, 0x50($sp)
/* 1F808 8001EC08 D7B80088 */  ldc1       $f24, 0x88($sp)
/* 1F80C 8001EC0C D7B60080 */  ldc1       $f22, 0x80($sp)
/* 1F810 8001EC10 D7B40078 */  ldc1       $f20, 0x78($sp)
/* 1F814 8001EC14 03E00008 */  jr         $ra
/* 1F818 8001EC18 27BD0090 */   addiu     $sp, $sp, 0x90

glabel app_cpp_func
/* 1F81C 8001EC1C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1F820 8001EC20 AFB00018 */  sw         $s0, 0x18($sp)
/* 1F824 8001EC24 3C10800F */  lui        $s0, %hi(appProc_ossched)
/* 1F828 8001EC28 AE0496E0 */  sw         $a0, %lo(appProc_ossched)($s0)
/* 1F82C 8001EC2C 24046048 */  addiu      $a0, $zero, 0x6048
/* 1F830 8001EC30 AFB20020 */  sw         $s2, 0x20($sp)
/* 1F834 8001EC34 30B200FF */  andi       $s2, $a1, 0xff
/* 1F838 8001EC38 3C05800E */  lui        $a1, %hi(D_800D9898)
/* 1F83C 8001EC3C 24A59898 */  addiu      $a1, $a1, %lo(D_800D9898)
/* 1F840 8001EC40 AFB1001C */  sw         $s1, 0x1c($sp)
/* 1F844 8001EC44 30D100FF */  andi       $s1, $a2, 0xff
/* 1F848 8001EC48 240600E7 */  addiu      $a2, $zero, 0xe7
/* 1F84C 8001EC4C AFBF0024 */  sw         $ra, 0x24($sp)
/* 1F850 8001EC50 0C025F9C */  jal        Malloc
/* 1F854 8001EC54 261096E0 */   addiu     $s0, $s0, -0x6920
/* 1F858 8001EC58 00003021 */  addu       $a2, $zero, $zero
/* 1F85C 8001EC5C 3C051234 */  lui        $a1, 0x1234
/* 1F860 8001EC60 34A55678 */  ori        $a1, $a1, 0x5678
/* 1F864 8001EC64 00402021 */  addu       $a0, $v0, $zero
/* 1F868 8001EC68 3C03800F */  lui        $v1, %hi(D_800E96D0)
/* 1F86C 8001EC6C AE02000C */  sw         $v0, 0xc($s0)
/* 1F870 8001EC70 AC6296D0 */  sw         $v0, %lo(D_800E96D0)($v1)
.L8001EC74:
/* 1F874 8001EC74 AC850000 */  sw         $a1, ($a0)
/* 1F878 8001EC78 24C60001 */  addiu      $a2, $a2, 1
/* 1F87C 8001EC7C 2CC21811 */  sltiu      $v0, $a2, 0x1811
/* 1F880 8001EC80 1440FFFC */  bnez       $v0, .L8001EC74
/* 1F884 8001EC84 24840004 */   addiu     $a0, $a0, 4
/* 1F888 8001EC88 3C10800F */  lui        $s0, %hi(AppThread)
/* 1F88C 8001EC8C 261096F0 */  addiu      $s0, $s0, %lo(AppThread)
/* 1F890 8001EC90 02002021 */  addu       $a0, $s0, $zero
/* 1F894 8001EC94 02202821 */  addu       $a1, $s1, $zero
/* 1F898 8001EC98 3C068002 */  lui        $a2, %hi(AppProc)
/* 1F89C 8001EC9C 24C6ECD8 */  addiu      $a2, $a2, %lo(AppProc)
/* 1F8A0 8001ECA0 8E02FFFC */  lw         $v0, -4($s0)
/* 1F8A4 8001ECA4 00003821 */  addu       $a3, $zero, $zero
/* 1F8A8 8001ECA8 AFB20014 */  sw         $s2, 0x14($sp)
/* 1F8AC 8001ECAC 24426048 */  addiu      $v0, $v0, 0x6048
/* 1F8B0 8001ECB0 0C02FBB0 */  jal        osCreateThread
/* 1F8B4 8001ECB4 AFA20010 */   sw        $v0, 0x10($sp)
/* 1F8B8 8001ECB8 0C0334B8 */  jal        osStartThread
/* 1F8BC 8001ECBC 02002021 */   addu      $a0, $s0, $zero
/* 1F8C0 8001ECC0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 1F8C4 8001ECC4 8FB20020 */  lw         $s2, 0x20($sp)
/* 1F8C8 8001ECC8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 1F8CC 8001ECCC 8FB00018 */  lw         $s0, 0x18($sp)
/* 1F8D0 8001ECD0 03E00008 */  jr         $ra
/* 1F8D4 8001ECD4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel AppProc
/* 1F8D8 8001ECD8 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 1F8DC 8001ECDC AFB50034 */  sw         $s5, 0x34($sp)
/* 1F8E0 8001ECE0 0000A821 */  addu       $s5, $zero, $zero
/* 1F8E4 8001ECE4 24040020 */  addiu      $a0, $zero, 0x20
/* 1F8E8 8001ECE8 3C05800E */  lui        $a1, %hi(D_800D9898)
/* 1F8EC 8001ECEC 24A59898 */  addiu      $a1, $a1, %lo(D_800D9898)
/* 1F8F0 8001ECF0 AFBF0044 */  sw         $ra, 0x44($sp)
/* 1F8F4 8001ECF4 AFBE0040 */  sw         $fp, 0x40($sp)
/* 1F8F8 8001ECF8 AFB7003C */  sw         $s7, 0x3c($sp)
/* 1F8FC 8001ECFC AFB60038 */  sw         $s6, 0x38($sp)
/* 1F900 8001ED00 AFB40030 */  sw         $s4, 0x30($sp)
/* 1F904 8001ED04 AFB3002C */  sw         $s3, 0x2c($sp)
/* 1F908 8001ED08 AFB20028 */  sw         $s2, 0x28($sp)
/* 1F90C 8001ED0C AFB10024 */  sw         $s1, 0x24($sp)
/* 1F910 8001ED10 AFB00020 */  sw         $s0, 0x20($sp)
/* 1F914 8001ED14 F7B60050 */  sdc1       $f22, 0x50($sp)
/* 1F918 8001ED18 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 1F91C 8001ED1C 0C025F9C */  jal        Malloc
/* 1F920 8001ED20 24060117 */   addiu     $a2, $zero, 0x117
/* 1F924 8001ED24 3C12800F */  lui        $s2, %hi(appProc_ossched)
/* 1F928 8001ED28 265096E0 */  addiu      $s0, $s2, %lo(appProc_ossched)
/* 1F92C 8001ED2C 261101C0 */  addiu      $s1, $s0, 0x1c0
/* 1F930 8001ED30 02202021 */  addu       $a0, $s1, $zero
/* 1F934 8001ED34 00402821 */  addu       $a1, $v0, $zero
/* 1F938 8001ED38 24060008 */  addiu      $a2, $zero, 8
/* 1F93C 8001ED3C 0C02FBA4 */  jal        osCreateMesgQueue
/* 1F940 8001ED40 AE020008 */   sw        $v0, 8($s0)
/* 1F944 8001ED44 3C17800F */  lui        $s7, 0x800f
/* 1F948 8001ED48 24160001 */  addiu      $s6, $zero, 1
/* 1F94C 8001ED4C 8E4496E0 */  lw         $a0, -0x6920($s2)
/* 1F950 8001ED50 0C032EF0 */  jal        osScGetCmdQ
/* 1F954 8001ED54 3C1E8000 */   lui       $fp, 0x8000
/* 1F958 8001ED58 0C007C22 */  jal        appProc_init
/* 1F95C 8001ED5C AE020004 */   sw        $v0, 4($s0)
/* 1F960 8001ED60 260501D8 */  addiu      $a1, $s0, 0x1d8
/* 1F964 8001ED64 8E4496E0 */  lw         $a0, -0x6920($s2)
/* 1F968 8001ED68 0C032EB6 */  jal        osScAddClient
/* 1F96C 8001ED6C 02203021 */   addu      $a2, $s1, $zero
/* 1F970 8001ED70 27A20018 */  addiu      $v0, $sp, 0x18
/* 1F974 8001ED74 AFA2001C */  sw         $v0, 0x1c($sp)
/* 1F978 8001ED78 3C02800E */  lui        $v0, %hi(gGlobals)
/* 1F97C 8001ED7C 245468A8 */  addiu      $s4, $v0, %lo(gGlobals)
.L8001ED80:
/* 1F980 8001ED80 3C04800F */  lui        $a0, %hi(AppProc_MesgQueue)
/* 1F984 8001ED84 248498A0 */  addiu      $a0, $a0, %lo(AppProc_MesgQueue)
/* 1F988 8001ED88 8FA5001C */  lw         $a1, 0x1c($sp)
/* 1F98C 8001ED8C 0C0321E4 */  jal        osRecvMesg
/* 1F990 8001ED90 24060001 */   addiu     $a2, $zero, 1
/* 1F994 8001ED94 8FA30018 */  lw         $v1, 0x18($sp)
/* 1F998 8001ED98 94620000 */  lhu        $v0, ($v1)
/* 1F99C 8001ED9C 14560051 */  bne        $v0, $s6, .L8001EEE4
/* 1F9A0 8001EDA0 8FA40018 */   lw        $a0, 0x18($sp)
/* 1F9A4 8001EDA4 3C13800F */  lui        $s3, %hi(doubleGlobalTickerFlag)
/* 1F9A8 8001EDA8 966296D4 */  lhu        $v0, %lo(doubleGlobalTickerFlag)($s3)
/* 1F9AC 8001EDAC 10400003 */  beqz       $v0, .L8001EDBC
/* 1F9B0 8001EDB0 00000000 */   nop
/* 1F9B4 8001EDB4 56A0004C */  bnel       $s5, $zero, .L8001EEE8
/* 1F9B8 8001EDB8 94830000 */   lhu       $v1, ($a0)
.L8001EDBC:
/* 1F9BC 8001EDBC 0C00250A */  jal        resolution_mirror_check
/* 1F9C0 8001EDC0 00000000 */   nop
/* 1F9C4 8001EDC4 1040FFEE */  beqz       $v0, .L8001ED80
/* 1F9C8 8001EDC8 3C02800F */   lui       $v0, %hi(gGlobalsText)
/* 1F9CC 8001EDCC 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 1F9D0 8001EDD0 02402021 */  addu       $a0, $s2, $zero
/* 1F9D4 8001EDD4 3C03800E */  lui        $v1, %hi(D_800D98A8)
/* 1F9D8 8001EDD8 0C0333AC */  jal        sprintf
/* 1F9DC 8001EDDC 246598A8 */   addiu     $a1, $v1, %lo(D_800D98A8)
/* 1F9E0 8001EDE0 0C0021E9 */  jal        gsStartGfxList
/* 1F9E4 8001EDE4 00000000 */   nop
/* 1F9E8 8001EDE8 00408021 */  addu       $s0, $v0, $zero
/* 1F9EC 8001EDEC 02402021 */  addu       $a0, $s2, $zero
/* 1F9F0 8001EDF0 3C05800E */  lui        $a1, %hi(D_800D98B8)
/* 1F9F4 8001EDF4 0C0333AC */  jal        sprintf
/* 1F9F8 8001EDF8 24A598B8 */   addiu     $a1, $a1, %lo(D_800D98B8)
/* 1F9FC 8001EDFC 2645DF88 */  addiu      $a1, $s2, -0x2078
/* 1FA00 8001EE00 02008821 */  addu       $s1, $s0, $zero
/* 1FA04 8001EE04 8CA40008 */  lw         $a0, 8($a1)
/* 1FA08 8001EE08 966396D4 */  lhu        $v1, -0x692c($s3)
/* 1FA0C 8001EE0C 24820001 */  addiu      $v0, $a0, 1
/* 1FA10 8001EE10 14760003 */  bne        $v1, $s6, .L8001EE20
/* 1FA14 8001EE14 ACA20008 */   sw        $v0, 8($a1)
/* 1FA18 8001EE18 24820002 */  addiu      $v0, $a0, 2
/* 1FA1C 8001EE1C ACA20008 */  sw         $v0, 8($a1)
.L8001EE20:
/* 1FA20 8001EE20 0C007C8F */  jal        appProc_caseSwitch
/* 1FA24 8001EE24 02002021 */   addu      $a0, $s0, $zero
/* 1FA28 8001EE28 0C0079E8 */  jal        display_debug_stats
/* 1FA2C 8001EE2C 00402021 */   addu      $a0, $v0, $zero
/* 1FA30 8001EE30 0C028912 */  jal        NOOP_800a2448
/* 1FA34 8001EE34 00408021 */   addu      $s0, $v0, $zero
/* 1FA38 8001EE38 0C028914 */  jal        ret_A0
/* 1FA3C 8001EE3C 02002021 */   addu      $a0, $s0, $zero
/* 1FA40 8001EE40 0C002474 */  jal        gsDrawScreenRects
/* 1FA44 8001EE44 00402021 */   addu      $a0, $v0, $zero
/* 1FA48 8001EE48 00408021 */  addu       $s0, $v0, $zero
/* 1FA4C 8001EE4C 24073200 */  addiu      $a3, $zero, 0x3200
/* 1FA50 8001EE50 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 1FA54 8001EE54 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 1FA58 8001EE58 10600002 */  beqz       $v1, .L8001EE64
/* 1FA5C 8001EE5C 02113023 */   subu      $a2, $s0, $s1
/* 1FA60 8001EE60 24076400 */  addiu      $a3, $zero, 0x6400
.L8001EE64:
/* 1FA64 8001EE64 000710C0 */  sll        $v0, $a3, 3
/* 1FA68 8001EE68 0046102B */  sltu       $v0, $v0, $a2
/* 1FA6C 8001EE6C 1040000B */  beqz       $v0, .L8001EE9C
/* 1FA70 8001EE70 000630C2 */   srl       $a2, $a2, 3
/* 1FA74 8001EE74 00C71023 */  subu       $v0, $a2, $a3
/* 1FA78 8001EE78 AFA20010 */  sw         $v0, 0x10($sp)
/* 1FA7C 8001EE7C 02402021 */  addu       $a0, $s2, $zero
/* 1FA80 8001EE80 3C02800E */  lui        $v0, %hi(D_800D98CC)
/* 1FA84 8001EE84 0C0333AC */  jal        sprintf
/* 1FA88 8001EE88 244598CC */   addiu     $a1, $v0, %lo(D_800D98CC)
/* 1FA8C 8001EE8C 3C04800E */  lui        $a0, %hi(D_800D990C)
/* 1FA90 8001EE90 2484990C */  addiu      $a0, $a0, %lo(D_800D990C)
/* 1FA94 8001EE94 0C025F2D */  jal        manualCrash
/* 1FA98 8001EE98 02402821 */   addu      $a1, $s2, $zero
.L8001EE9C:
/* 1FA9C 8001EE9C 966296D4 */  lhu        $v0, -0x692c($s3)
/* 1FAA0 8001EEA0 10400003 */  beqz       $v0, .L8001EEB0
/* 1FAA4 8001EEA4 2442FFFF */   addiu     $v0, $v0, -1
/* 1FAA8 8001EEA8 08007B60 */  j          .L8001ED80
/* 1FAAC 8001EEAC A66296D4 */   sh        $v0, -0x692c($s3)
.L8001EEB0:
/* 1FAB0 8001EEB0 3C05800F */  lui        $a1, %hi(AppProc_MesgQueue)
/* 1FAB4 8001EEB4 24A598A0 */  addiu      $a1, $a1, %lo(AppProc_MesgQueue)
/* 1FAB8 8001EEB8 0C002526 */  jal        func_swapping_framebuffer_
/* 1FABC 8001EEBC 02002021 */   addu      $a0, $s0, $zero
/* 1FAC0 8001EEC0 3C03800F */  lui        $v1, %hi(appProc_ossched)
/* 1FAC4 8001EEC4 246396E0 */  addiu      $v1, $v1, %lo(appProc_ossched)
/* 1FAC8 8001EEC8 8C640004 */  lw         $a0, 4($v1)
/* 1FACC 8001EECC 00402821 */  addu       $a1, $v0, $zero
/* 1FAD0 8001EED0 0C03313C */  jal        osSendMesg
/* 1FAD4 8001EED4 24060001 */   addiu     $a2, $zero, 1
/* 1FAD8 8001EED8 26A30001 */  addiu      $v1, $s5, 1
/* 1FADC 8001EEDC 08007B60 */  j          .L8001ED80
/* 1FAE0 8001EEE0 3075FFFF */   andi      $s5, $v1, 0xffff
.L8001EEE4:
/* 1FAE4 8001EEE4 94830000 */  lhu        $v1, ($a0)
.L8001EEE8:
/* 1FAE8 8001EEE8 24020004 */  addiu      $v0, $zero, 4
/* 1FAEC 8001EEEC 14620005 */  bne        $v1, $v0, .L8001EF04
/* 1FAF0 8001EEF0 24020002 */   addiu     $v0, $zero, 2
/* 1FAF4 8001EEF4 0C007CD6 */  jal        clear_audio_video
/* 1FAF8 8001EEF8 00000000 */   nop
/* 1FAFC 8001EEFC 08007B60 */  j          .L8001ED80
/* 1FB00 8001EF00 00000000 */   nop
.L8001EF04:
/* 1FB04 8001EF04 1462FF9E */  bne        $v1, $v0, .L8001ED80
/* 1FB08 8001EF08 26A2FFFF */   addiu     $v0, $s5, -1
/* 1FB0C 8001EF0C 0C00257C */  jal        func_800095F0
/* 1FB10 8001EF10 3055FFFF */   andi      $s5, $v0, 0xffff
/* 1FB14 8001EF14 26F0C6B0 */  addiu      $s0, $s7, -0x3950
/* 1FB18 8001EF18 C6E2C6B0 */  lwc1       $f2, -0x3950($s7)
/* 1FB1C 8001EF1C 8E820008 */  lw         $v0, 8($s4)
/* 1FB20 8001EF20 44802000 */  mtc1       $zero, $f4
/* 1FB24 8001EF24 24420001 */  addiu      $v0, $v0, 1
/* 1FB28 8001EF28 4602203C */  c.lt.s     $f4, $f2
/* 1FB2C 8001EF2C 00000000 */  nop
/* 1FB30 8001EF30 45000053 */  bc1f       .L8001F080
/* 1FB34 8001EF34 AE820008 */   sw        $v0, 8($s4)
/* 1FB38 8001EF38 3C01800E */  lui        $at, %hi(D_800D9920)
/* 1FB3C 8001EF3C C4209920 */  lwc1       $f0, %lo(D_800D9920)($at)
/* 1FB40 8001EF40 4600103C */  c.lt.s     $f2, $f0
/* 1FB44 8001EF44 00000000 */  nop
/* 1FB48 8001EF48 4502FF8D */  bc1fl      .L8001ED80
/* 1FB4C 8001EF4C AE802030 */   sw        $zero, 0x2030($s4)
/* 1FB50 8001EF50 C6020004 */  lwc1       $f2, 4($s0)
/* 1FB54 8001EF54 4602203C */  c.lt.s     $f4, $f2
/* 1FB58 8001EF58 00000000 */  nop
/* 1FB5C 8001EF5C 4502FF88 */  bc1fl      .L8001ED80
/* 1FB60 8001EF60 AE802030 */   sw        $zero, 0x2030($s4)
/* 1FB64 8001EF64 3C01800E */  lui        $at, %hi(D_800D9924)
/* 1FB68 8001EF68 C4209924 */  lwc1       $f0, %lo(D_800D9924)($at)
/* 1FB6C 8001EF6C 4600103C */  c.lt.s     $f2, $f0
/* 1FB70 8001EF70 00000000 */  nop
/* 1FB74 8001EF74 4502FF82 */  bc1fl      .L8001ED80
/* 1FB78 8001EF78 AE802030 */   sw        $zero, 0x2030($s4)
/* 1FB7C 8001EF7C 0C0025B4 */  jal        get_hres
/* 1FB80 8001EF80 00000000 */   nop
/* 1FB84 8001EF84 3C03CCCC */  lui        $v1, 0xcccc
/* 1FB88 8001EF88 3463CCCD */  ori        $v1, $v1, 0xcccd
/* 1FB8C 8001EF8C 00430019 */  multu      $v0, $v1
/* 1FB90 8001EF90 C6E2C6B0 */  lwc1       $f2, -0x3950($s7)
/* 1FB94 8001EF94 00001010 */  mfhi       $v0
/* 1FB98 8001EF98 00021202 */  srl        $v0, $v0, 8
/* 1FB9C 8001EF9C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 1FBA0 8001EFA0 44820000 */  mtc1       $v0, $f0
/* 1FBA4 8001EFA4 46800020 */  cvt.s.w    $f0, $f0
/* 1FBA8 8001EFA8 46001582 */  mul.s      $f22, $f2, $f0
/* 1FBAC 8001EFAC 0C0025B7 */  jal        get_vres
/* 1FBB0 8001EFB0 00000000 */   nop
/* 1FBB4 8001EFB4 3C038888 */  lui        $v1, 0x8888
/* 1FBB8 8001EFB8 34638889 */  ori        $v1, $v1, 0x8889
/* 1FBBC 8001EFBC 00430019 */  multu      $v0, $v1
/* 1FBC0 8001EFC0 C6020004 */  lwc1       $f2, 4($s0)
/* 1FBC4 8001EFC4 00001010 */  mfhi       $v0
/* 1FBC8 8001EFC8 000211C2 */  srl        $v0, $v0, 7
/* 1FBCC 8001EFCC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 1FBD0 8001EFD0 44820000 */  mtc1       $v0, $f0
/* 1FBD4 8001EFD4 46800020 */  cvt.s.w    $f0, $f0
/* 1FBD8 8001EFD8 46001502 */  mul.s      $f20, $f2, $f0
/* 1FBDC 8001EFDC 0C0025AB */  jal        get_depthBuffer
/* 1FBE0 8001EFE0 00000000 */   nop
/* 1FBE4 8001EFE4 0C0025B4 */  jal        get_hres
/* 1FBE8 8001EFE8 00408021 */   addu      $s0, $v0, $zero
/* 1FBEC 8001EFEC 3C01800E */  lui        $at, %hi(D_800D9928)
/* 1FBF0 8001EFF0 C4209928 */  lwc1       $f0, %lo(D_800D9928)($at)
/* 1FBF4 8001EFF4 4614003E */  c.le.s     $f0, $f20
/* 1FBF8 8001EFF8 00000000 */  nop
/* 1FBFC 8001EFFC 45010005 */  bc1t       .L8001F014
/* 1FC00 8001F000 00401821 */   addu      $v1, $v0, $zero
/* 1FC04 8001F004 4600A00D */  trunc.w.s  $f0, $f20
/* 1FC08 8001F008 44020000 */  mfc1       $v0, $f0
/* 1FC0C 8001F00C 08007C0A */  j          .L8001F028
/* 1FC10 8001F010 3042FFFF */   andi      $v0, $v0, 0xffff
.L8001F014:
/* 1FC14 8001F014 4600A001 */  sub.s      $f0, $f20, $f0
/* 1FC18 8001F018 4600008D */  trunc.w.s  $f2, $f0
/* 1FC1C 8001F01C 44021000 */  mfc1       $v0, $f2
/* 1FC20 8001F020 005E1025 */  or         $v0, $v0, $fp
/* 1FC24 8001F024 3042FFFF */  andi       $v0, $v0, 0xffff
.L8001F028:
/* 1FC28 8001F028 00430018 */  mult       $v0, $v1
/* 1FC2C 8001F02C 3C01800E */  lui        $at, %hi(D_800D992C)
/* 1FC30 8001F030 C420992C */  lwc1       $f0, %lo(D_800D992C)($at)
/* 1FC34 8001F034 4616003E */  c.le.s     $f0, $f22
/* 1FC38 8001F038 00001812 */  mflo       $v1
/* 1FC3C 8001F03C 45030005 */  bc1tl      .L8001F054
/* 1FC40 8001F040 4600B001 */   sub.s     $f0, $f22, $f0
/* 1FC44 8001F044 4600B00D */  trunc.w.s  $f0, $f22
/* 1FC48 8001F048 44020000 */  mfc1       $v0, $f0
/* 1FC4C 8001F04C 08007C19 */  j          .L8001F064
/* 1FC50 8001F050 3042FFFF */   andi      $v0, $v0, 0xffff
.L8001F054:
/* 1FC54 8001F054 4600008D */  trunc.w.s  $f2, $f0
/* 1FC58 8001F058 44021000 */  mfc1       $v0, $f2
/* 1FC5C 8001F05C 005E1025 */  or         $v0, $v0, $fp
/* 1FC60 8001F060 3042FFFF */  andi       $v0, $v0, 0xffff
.L8001F064:
/* 1FC64 8001F064 00621021 */  addu       $v0, $v1, $v0
/* 1FC68 8001F068 00021040 */  sll        $v0, $v0, 1
/* 1FC6C 8001F06C 02021021 */  addu       $v0, $s0, $v0
/* 1FC70 8001F070 94440000 */  lhu        $a0, ($v0)
/* 1FC74 8001F074 3403FFFC */  ori        $v1, $zero, 0xfffc
/* 1FC78 8001F078 5083FF41 */  beql       $a0, $v1, .L8001ED80
/* 1FC7C 8001F07C AE962030 */   sw        $s6, 0x2030($s4)
.L8001F080:
/* 1FC80 8001F080 08007B60 */  j          .L8001ED80
/* 1FC84 8001F084 AE802030 */   sw        $zero, 0x2030($s4)

glabel appProc_init
/* 1FC88 8001F088 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1FC8C 8001F08C 24040140 */  addiu      $a0, $zero, 0x140
/* 1FC90 8001F090 240500F0 */  addiu      $a1, $zero, 0xf0
/* 1FC94 8001F094 24060010 */  addiu      $a2, $zero, 0x10
/* 1FC98 8001F098 AFBF0028 */  sw         $ra, 0x28($sp)
/* 1FC9C 8001F09C AFB50024 */  sw         $s5, 0x24($sp)
/* 1FCA0 8001F0A0 AFB40020 */  sw         $s4, 0x20($sp)
/* 1FCA4 8001F0A4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1FCA8 8001F0A8 AFB20018 */  sw         $s2, 0x18($sp)
/* 1FCAC 8001F0AC AFB10014 */  sw         $s1, 0x14($sp)
/* 1FCB0 8001F0B0 0C00214B */  jal        SetGfxMode
/* 1FCB4 8001F0B4 AFB00010 */   sw        $s0, 0x10($sp)
/* 1FCB8 8001F0B8 0C00820C */  jal        func_80020830
/* 1FCBC 8001F0BC 3C10800E */   lui       $s0, %hi(queueStructA)
/* 1FCC0 8001F0C0 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 1FCC4 8001F0C4 0C03584C */  jal        InitFreeQueueHead
/* 1FCC8 8001F0C8 02002021 */   addu      $a0, $s0, $zero
/* 1FCCC 8001F0CC 0C035740 */  jal        calloc_QueueStructB
/* 1FCD0 8001F0D0 26040804 */   addiu     $a0, $s0, 0x804
/* 1FCD4 8001F0D4 2610E9DC */  addiu      $s0, $s0, -0x1624
/* 1FCD8 8001F0D8 02002021 */  addu       $a0, $s0, $zero
/* 1FCDC 8001F0DC 3C0503DB */  lui        $a1, 0x3db
/* 1FCE0 8001F0E0 0C027328 */  jal        setRNGSeed
/* 1FCE4 8001F0E4 34A5B6CD */   ori       $a1, $a1, 0xb6cd
/* 1FCE8 8001F0E8 00008821 */  addu       $s1, $zero, $zero
/* 1FCEC 8001F0EC 24020005 */  addiu      $v0, $zero, 5
/* 1FCF0 8001F0F0 3C03800F */  lui        $v1, %hi(font_face)
/* 1FCF4 8001F0F4 0060A021 */  addu       $s4, $v1, $zero
/* 1FCF8 8001F0F8 3C15800E */  lui        $s5, 0x800e
/* 1FCFC 8001F0FC AE020004 */  sw         $v0, 4($s0)
/* 1FD00 8001F100 AE000008 */  sw         $zero, 8($s0)
/* 1FD04 8001F104 8C628D18 */  lw         $v0, %lo(font_face)($v1)
/* 1FD08 8001F108 3C13800E */  lui        $s3, 0x800e
/* 1FD0C 8001F10C 10400006 */  beqz       $v0, .L8001F128
/* 1FD10 8001F110 AE00000C */   sw        $zero, 0xc($s0)
/* 1FD14 8001F114 26838D18 */  addiu      $v1, $s4, -0x72e8
.L8001F118:
/* 1FD18 8001F118 24630008 */  addiu      $v1, $v1, 8
/* 1FD1C 8001F11C 8C620000 */  lw         $v0, ($v1)
/* 1FD20 8001F120 1440FFFD */  bnez       $v0, .L8001F118
/* 1FD24 8001F124 26310001 */   addiu     $s1, $s1, 1
.L8001F128:
/* 1FD28 8001F128 24040020 */  addiu      $a0, $zero, 0x20
/* 1FD2C 8001F12C 26A59898 */  addiu      $a1, $s5, -0x6768
/* 1FD30 8001F130 0C025F9C */  jal        Malloc
/* 1FD34 8001F134 240601B4 */   addiu     $a2, $zero, 0x1b4
/* 1FD38 8001F138 267068A8 */  addiu      $s0, $s3, 0x68a8
/* 1FD3C 8001F13C AE021600 */  sw         $v0, 0x1600($s0)
/* 1FD40 8001F140 00402021 */  addu       $a0, $v0, $zero
/* 1FD44 8001F144 0C02D043 */  jal        Init_font
/* 1FD48 8001F148 322500FF */   andi      $a1, $s1, 0xff
/* 1FD4C 8001F14C 1A20000C */  blez       $s1, .L8001F180
/* 1FD50 8001F150 02009021 */   addu      $s2, $s0, $zero
/* 1FD54 8001F154 3C02800F */  lui        $v0, %hi(font_face)
/* 1FD58 8001F158 24508D18 */  addiu      $s0, $v0, %lo(font_face)
/* 1FD5C 8001F15C 8E050000 */  lw         $a1, ($s0)
.L8001F160:
/* 1FD60 8001F160 92060004 */  lbu        $a2, 4($s0)
/* 1FD64 8001F164 92070005 */  lbu        $a3, 5($s0)
/* 1FD68 8001F168 26100008 */  addiu      $s0, $s0, 8
/* 1FD6C 8001F16C 8E441600 */  lw         $a0, 0x1600($s2)
/* 1FD70 8001F170 0C02D0A5 */  jal        load_font_face
/* 1FD74 8001F174 2631FFFF */   addiu     $s1, $s1, -1
/* 1FD78 8001F178 5620FFF9 */  bnel       $s1, $zero, .L8001F160
/* 1FD7C 8001F17C 8E050000 */   lw        $a1, ($s0)
.L8001F180:
/* 1FD80 8001F180 267068A8 */  addiu      $s0, $s3, 0x68a8
/* 1FD84 8001F184 8E041600 */  lw         $a0, 0x1600($s0)
/* 1FD88 8001F188 0C02D0FD */  jal        font_func
/* 1FD8C 8001F18C 8E858D18 */   lw        $a1, -0x72e8($s4)
/* 1FD90 8001F190 24040008 */  addiu      $a0, $zero, 8
/* 1FD94 8001F194 26A59898 */  addiu      $a1, $s5, -0x6768
/* 1FD98 8001F198 0C025F9C */  jal        Malloc
/* 1FD9C 8001F19C 240601BF */   addiu     $a2, $zero, 0x1bf
/* 1FDA0 8001F1A0 8E051600 */  lw         $a1, 0x1600($s0)
/* 1FDA4 8001F1A4 00402021 */  addu       $a0, $v0, $zero
/* 1FDA8 8001F1A8 0C02DBCC */  jal        clear_widget_handler
/* 1FDAC 8001F1AC AE021604 */   sw        $v0, 0x1604($s0)
/* 1FDB0 8001F1B0 26031624 */  addiu      $v1, $s0, 0x1624
/* 1FDB4 8001F1B4 3C02800F */  lui        $v0, %hi(queue_struct_pointer)
/* 1FDB8 8001F1B8 0C00B5C4 */  jal        memorymaker_init
/* 1FDBC 8001F1BC AC4336E4 */   sw        $v1, %lo(queue_struct_pointer)($v0)
/* 1FDC0 8001F1C0 0C023310 */  jal        load_commonstrings
/* 1FDC4 8001F1C4 00000000 */   nop
/* 1FDC8 8001F1C8 0C026259 */  jal        passToMalloc
/* 1FDCC 8001F1CC 24040028 */   addiu     $a0, $zero, 0x28
/* 1FDD0 8001F1D0 8E051604 */  lw         $a1, 0x1604($s0)
/* 1FDD4 8001F1D4 0C013A61 */  jal        init_some_Struct
/* 1FDD8 8001F1D8 00402021 */   addu      $a0, $v0, $zero
/* 1FDDC 8001F1DC 0C0025B4 */  jal        get_hres
/* 1FDE0 8001F1E0 AE0215C0 */   sw        $v0, 0x15c0($s0)
/* 1FDE4 8001F1E4 3C03800F */  lui        $v1, %hi(HresMirror)
/* 1FDE8 8001F1E8 0C0025B7 */  jal        get_vres
/* 1FDEC 8001F1EC A46236F4 */   sh        $v0, %lo(HresMirror)($v1)
/* 1FDF0 8001F1F0 3C01800E */  lui        $at, %hi(D_800D9930)
/* 1FDF4 8001F1F4 C4209930 */  lwc1       $f0, %lo(D_800D9930)($at)
/* 1FDF8 8001F1F8 3C01800E */  lui        $at, %hi(D_800D9934)
/* 1FDFC 8001F1FC C4229934 */  lwc1       $f2, %lo(D_800D9934)($at)
/* 1FE00 8001F200 8FBF0028 */  lw         $ra, 0x28($sp)
/* 1FE04 8001F204 8FB50024 */  lw         $s5, 0x24($sp)
/* 1FE08 8001F208 8FB40020 */  lw         $s4, 0x20($sp)
/* 1FE0C 8001F20C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1FE10 8001F210 8FB20018 */  lw         $s2, 0x18($sp)
/* 1FE14 8001F214 8FB10014 */  lw         $s1, 0x14($sp)
/* 1FE18 8001F218 3C03800F */  lui        $v1, %hi(VresMirror)
/* 1FE1C 8001F21C A46236F6 */  sh         $v0, %lo(VresMirror)($v1)
/* 1FE20 8001F220 24020001 */  addiu      $v0, $zero, 1
/* 1FE24 8001F224 A202202C */  sb         $v0, 0x202c($s0)
/* 1FE28 8001F228 E6002054 */  swc1       $f0, 0x2054($s0)
/* 1FE2C 8001F22C E6022058 */  swc1       $f2, 0x2058($s0)
/* 1FE30 8001F230 8FB00010 */  lw         $s0, 0x10($sp)
/* 1FE34 8001F234 03E00008 */  jr         $ra
/* 1FE38 8001F238 27BD0030 */   addiu     $sp, $sp, 0x30

glabel appProc_caseSwitch
/* 1FE3C 8001F23C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1FE40 8001F240 AFB00010 */  sw         $s0, 0x10($sp)
/* 1FE44 8001F244 3C10800E */  lui        $s0, %hi(queueStructA)
/* 1FE48 8001F248 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 1FE4C 8001F24C AFA40018 */  sw         $a0, 0x18($sp)
/* 1FE50 8001F250 AFBF0014 */  sw         $ra, 0x14($sp)
/* 1FE54 8001F254 0C035896 */  jal        processQueueFree
/* 1FE58 8001F258 02002021 */   addu      $a0, $s0, $zero
/* 1FE5C 8001F25C 26040804 */  addiu      $a0, $s0, 0x804
/* 1FE60 8001F260 0C0357E6 */  jal        Process_queue_B
/* 1FE64 8001F264 00002821 */   addu      $a1, $zero, $zero
/* 1FE68 8001F268 2603E9DC */  addiu      $v1, $s0, -0x1624
/* 1FE6C 8001F26C 9062202C */  lbu        $v0, 0x202c($v1)
/* 1FE70 8001F270 5040002A */  beql       $v0, $zero, .L8001F31C
/* 1FE74 8001F274 3C03800F */   lui       $v1, %hi(entity_info_array+0x764)
/* 1FE78 8001F278 8C630004 */  lw         $v1, %lo(entity_info_array+0x764)($v1)
/* 1FE7C 8001F27C 2C620006 */  sltiu      $v0, $v1, 6
/* 1FE80 8001F280 10400020 */  beqz       $v0, .L8001F304
/* 1FE84 8001F284 3C02800E */   lui       $v0, %hi(D_800D9980)
/* 1FE88 8001F288 24429980 */  addiu      $v0, $v0, %lo(D_800D9980)
/* 1FE8C 8001F28C 00031880 */  sll        $v1, $v1, 2
/* 1FE90 8001F290 00621821 */  addu       $v1, $v1, $v0
/* 1FE94 8001F294 8C640000 */  lw         $a0, ($v1)
/* 1FE98 8001F298 00800008 */  jr         $a0
/* 1FE9C 8001F29C 00000000 */   nop
/* 1FEA0 8001F2A0 0C007D65 */  jal        appstate_0
/* 1FEA4 8001F2A4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FEA8 8001F2A8 08007CBF */  j          .L8001F2FC
/* 1FEAC 8001F2AC 3C03800E */   lui       $v1, 0x800e
/* 1FEB0 8001F2B0 0C008EBC */  jal        game_ScreenFadeMode
/* 1FEB4 8001F2B4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FEB8 8001F2B8 08007CBF */  j          .L8001F2FC
/* 1FEBC 8001F2BC 3C03800E */   lui       $v1, 0x800e
/* 1FEC0 8001F2C0 0C0222FF */  jal        ScreenFadeMode_17
/* 1FEC4 8001F2C4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FEC8 8001F2C8 08007CBF */  j          .L8001F2FC
/* 1FECC 8001F2CC 3C03800E */   lui       $v1, 0x800e
/* 1FED0 8001F2D0 0C023230 */  jal        appstate_4
/* 1FED4 8001F2D4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FED8 8001F2D8 08007CBF */  j          .L8001F2FC
/* 1FEDC 8001F2DC 3C03800E */   lui       $v1, 0x800e
/* 1FEE0 8001F2E0 0C022E2C */  jal        func_checking_controller_and_pak
/* 1FEE4 8001F2E4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FEE8 8001F2E8 08007CBF */  j          .L8001F2FC
/* 1FEEC 8001F2EC 3C03800E */   lui       $v1, 0x800e
/* 1FEF0 8001F2F0 0C007CE5 */  jal        check_for_PAL_or_controller
/* 1FEF4 8001F2F4 27A40018 */   addiu     $a0, $sp, 0x18
/* 1FEF8 8001F2F8 3C03800E */  lui        $v1, %hi(appstate)
.L8001F2FC:
/* 1FEFC 8001F2FC 08007CC6 */  j          .L8001F318
/* 1FF00 8001F300 AC6268AC */   sw        $v0, %lo(appstate)($v1)
.L8001F304:
/* 1FF04 8001F304 3C04800E */  lui        $a0, %hi(D_800D9938)
/* 1FF08 8001F308 24849938 */  addiu      $a0, $a0, %lo(D_800D9938)
/* 1FF0C 8001F30C 3C05800E */  lui        $a1, %hi(D_800D9940)
/* 1FF10 8001F310 0C025F2D */  jal        manualCrash
/* 1FF14 8001F314 24A59940 */   addiu     $a1, $a1, %lo(D_800D9940)
.L8001F318:
/* 1FF18 8001F318 3C03800F */  lui        $v1, %hi(AppThread_stack)
.L8001F31C:
/* 1FF1C 8001F31C 8C6496EC */  lw         $a0, %lo(AppThread_stack)($v1)
/* 1FF20 8001F320 3C021234 */  lui        $v0, 0x1234
/* 1FF24 8001F324 8C830000 */  lw         $v1, ($a0)
/* 1FF28 8001F328 34425678 */  ori        $v0, $v0, 0x5678
/* 1FF2C 8001F32C 10620005 */  beq        $v1, $v0, .L8001F344
/* 1FF30 8001F330 3C04800E */   lui       $a0, %hi(D_800D9960)
/* 1FF34 8001F334 24849960 */  addiu      $a0, $a0, %lo(D_800D9960)
/* 1FF38 8001F338 3C05800E */  lui        $a1, %hi(D_800D9968)
/* 1FF3C 8001F33C 0C025F2D */  jal        manualCrash
/* 1FF40 8001F340 24A59968 */   addiu     $a1, $a1, %lo(D_800D9968)
.L8001F344:
/* 1FF44 8001F344 8FA20018 */  lw         $v0, 0x18($sp)
/* 1FF48 8001F348 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1FF4C 8001F34C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1FF50 8001F350 03E00008 */  jr         $ra
/* 1FF54 8001F354 27BD0018 */   addiu     $sp, $sp, 0x18

glabel clear_audio_video
/* 1FF58 8001F358 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1FF5C 8001F35C AFBF0010 */  sw         $ra, 0x10($sp)
/* 1FF60 8001F360 0C026465 */  jal        removeCloseSynth
/* 1FF64 8001F364 00000000 */   nop
/* 1FF68 8001F368 0C033494 */  jal        osSpTaskYield
/* 1FF6C 8001F36C 00000000 */   nop
.L8001F370:
/* 1FF70 8001F370 0C02F840 */  jal        osAfterPreNMI
/* 1FF74 8001F374 00000000 */   nop
/* 1FF78 8001F378 1440FFFD */  bnez       $v0, .L8001F370
/* 1FF7C 8001F37C 00000000 */   nop
/* 1FF80 8001F380 0C002139 */  jal        initGfx_2
/* 1FF84 8001F384 00000000 */   nop
/* 1FF88 8001F388 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1FF8C 8001F38C 03E00008 */  jr         $ra
/* 1FF90 8001F390 27BD0018 */   addiu     $sp, $sp, 0x18

glabel check_for_PAL_or_controller
/* 1FF94 8001F394 3C028000 */  lui        $v0, %hi(osTvType)
/* 1FF98 8001F398 8C430300 */  lw         $v1, %lo(osTvType)($v0)
/* 1FF9C 8001F39C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 1FFA0 8001F3A0 AFB30034 */  sw         $s3, 0x34($sp)
/* 1FFA4 8001F3A4 AFBF0038 */  sw         $ra, 0x38($sp)
/* 1FFA8 8001F3A8 AFB20030 */  sw         $s2, 0x30($sp)
/* 1FFAC 8001F3AC AFB1002C */  sw         $s1, 0x2c($sp)
/* 1FFB0 8001F3B0 AFB00028 */  sw         $s0, 0x28($sp)
/* 1FFB4 8001F3B4 F7B80050 */  sdc1       $f24, 0x50($sp)
/* 1FFB8 8001F3B8 F7B60048 */  sdc1       $f22, 0x48($sp)
/* 1FFBC 8001F3BC F7B40040 */  sdc1       $f20, 0x40($sp)
/* 1FFC0 8001F3C0 14600039 */  bnez       $v1, .L8001F4A8
/* 1FFC4 8001F3C4 00809821 */   addu      $s3, $a0, $zero
/* 1FFC8 8001F3C8 3C10800F */  lui        $s0, %hi(PAL_warning_flag)
/* 1FFCC 8001F3CC 920296DC */  lbu        $v0, %lo(PAL_warning_flag)($s0)
/* 1FFD0 8001F3D0 10400005 */  beqz       $v0, .L8001F3E8
/* 1FFD4 8001F3D4 3C12800F */   lui       $s2, %hi(PAL_Warning_image)
/* 1FFD8 8001F3D8 0C0290E2 */  jal        get_borg_8
/* 1FFDC 8001F3DC 240437C3 */   addiu     $a0, $zero, 0x37c3
/* 1FFE0 8001F3E0 AE4296D8 */  sw         $v0, %lo(PAL_Warning_image)($s2)
/* 1FFE4 8001F3E4 A20096DC */  sb         $zero, -0x6924($s0)
.L8001F3E8:
/* 1FFE8 8001F3E8 0C0025B4 */  jal        get_hres
/* 1FFEC 8001F3EC 8E710000 */   lw        $s1, ($s3)
/* 1FFF0 8001F3F0 4482B000 */  mtc1       $v0, $f22
/* 1FFF4 8001F3F4 4680B5A0 */  cvt.s.w    $f22, $f22
/* 1FFF8 8001F3F8 3C01800E */  lui        $at, %hi(D_800D9998)
/* 1FFFC 8001F3FC C4349998 */  lwc1       $f20, %lo(D_800D9998)($at)
/* 20000 8001F400 8E4296D8 */  lw         $v0, -0x6928($s2)
/* 20004 8001F404 4614B582 */  mul.s      $f22, $f22, $f20
/* 20008 8001F408 9443000A */  lhu        $v1, 0xa($v0)
/* 2000C 8001F40C 44830000 */  mtc1       $v1, $f0
/* 20010 8001F410 46800020 */  cvt.s.w    $f0, $f0
/* 20014 8001F414 46140002 */  mul.s      $f0, $f0, $f20
/* 20018 8001F418 0C0025B7 */  jal        get_vres
/* 2001C 8001F41C 4600B581 */   sub.s     $f22, $f22, $f0
/* 20020 8001F420 4482C000 */  mtc1       $v0, $f24
/* 20024 8001F424 4680C620 */  cvt.s.w    $f24, $f24
/* 20028 8001F428 4614C602 */  mul.s      $f24, $f24, $f20
/* 2002C 8001F42C 8E4296D8 */  lw         $v0, -0x6928($s2)
/* 20030 8001F430 9443000C */  lhu        $v1, 0xc($v0)
/* 20034 8001F434 44830000 */  mtc1       $v1, $f0
/* 20038 8001F438 46800020 */  cvt.s.w    $f0, $f0
/* 2003C 8001F43C 46140002 */  mul.s      $f0, $f0, $f20
/* 20040 8001F440 0C0025B4 */  jal        get_hres
/* 20044 8001F444 4600C601 */   sub.s     $f24, $f24, $f0
/* 20048 8001F448 0C0025B7 */  jal        get_vres
/* 2004C 8001F44C 00408021 */   addu      $s0, $v0, $zero
/* 20050 8001F450 02202021 */  addu       $a0, $s1, $zero
/* 20054 8001F454 24050006 */  addiu      $a1, $zero, 6
/* 20058 8001F458 02003021 */  addu       $a2, $s0, $zero
/* 2005C 8001F45C 0C0290ED */  jal        rsp_func
/* 20060 8001F460 00403821 */   addu      $a3, $v0, $zero
/* 20064 8001F464 4406B000 */  mfc1       $a2, $f22
/* 20068 8001F468 3C01800E */  lui        $at, %hi(D_800D999C)
/* 2006C 8001F46C C420999C */  lwc1       $f0, %lo(D_800D999C)($at)
/* 20070 8001F470 240300FF */  addiu      $v1, $zero, 0xff
/* 20074 8001F474 AFA30018 */  sw         $v1, 0x18($sp)
/* 20078 8001F478 AFA3001C */  sw         $v1, 0x1c($sp)
/* 2007C 8001F47C AFA30020 */  sw         $v1, 0x20($sp)
/* 20080 8001F480 AFA30024 */  sw         $v1, 0x24($sp)
/* 20084 8001F484 E7A00010 */  swc1       $f0, 0x10($sp)
/* 20088 8001F488 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2008C 8001F48C 8E4596D8 */  lw         $a1, -0x6928($s2)
/* 20090 8001F490 4407C000 */  mfc1       $a3, $f24
/* 20094 8001F494 0C0299A8 */  jal        pass_to_borg_image_draw
/* 20098 8001F498 00402021 */   addu      $a0, $v0, $zero
/* 2009C 8001F49C 24030005 */  addiu      $v1, $zero, 5
/* 200A0 8001F4A0 08007D2F */  j          .L8001F4BC
/* 200A4 8001F4A4 AE620000 */   sw        $v0, ($s3)
.L8001F4A8:
/* 200A8 8001F4A8 0C023263 */  jal        check_for_controller
/* 200AC 8001F4AC 00000000 */   nop
/* 200B0 8001F4B0 14400002 */  bnez       $v0, .L8001F4BC
/* 200B4 8001F4B4 24030003 */   addiu     $v1, $zero, 3
/* 200B8 8001F4B8 24030004 */  addiu      $v1, $zero, 4
.L8001F4BC:
/* 200BC 8001F4BC 8FBF0038 */  lw         $ra, 0x38($sp)
/* 200C0 8001F4C0 8FB30034 */  lw         $s3, 0x34($sp)
/* 200C4 8001F4C4 8FB20030 */  lw         $s2, 0x30($sp)
/* 200C8 8001F4C8 8FB1002C */  lw         $s1, 0x2c($sp)
/* 200CC 8001F4CC 8FB00028 */  lw         $s0, 0x28($sp)
/* 200D0 8001F4D0 D7B80050 */  ldc1       $f24, 0x50($sp)
/* 200D4 8001F4D4 D7B60048 */  ldc1       $f22, 0x48($sp)
/* 200D8 8001F4D8 D7B40040 */  ldc1       $f20, 0x40($sp)
/* 200DC 8001F4DC 00601021 */  addu       $v0, $v1, $zero
/* 200E0 8001F4E0 03E00008 */  jr         $ra
/* 200E4 8001F4E4 27BD0058 */   addiu     $sp, $sp, 0x58
/* 200E8 8001F4E8 00000000 */  nop
/* 200EC 8001F4EC 00000000 */  nop
