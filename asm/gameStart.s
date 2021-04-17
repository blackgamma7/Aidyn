.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel flycam_func
/* 5E7C0 8005DBC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5E7C4 8005DBC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 5E7C8 8005DBC8 3C11800F */  lui        $s1, 0x800f
/* 5E7CC 8005DBCC 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 5E7D0 8005DBD0 3C03800F */  lui        $v1, %hi(flycam_flag)
/* 5E7D4 8005DBD4 9064F540 */  lbu        $a0, %lo(flycam_flag)($v1)
/* 5E7D8 8005DBD8 244A6988 */  addiu      $t2, $v0, %lo(zoneDatMatrix)
/* 5E7DC 8005DBDC AFBF0018 */  sw         $ra, 0x18($sp)
/* 5E7E0 8005DBE0 10800017 */  beqz       $a0, .L8005DC40
/* 5E7E4 8005DBE4 AFB00010 */   sw        $s0, 0x10($sp)
/* 5E7E8 8005DBE8 3C032AAA */  lui        $v1, 0x2aaa
/* 5E7EC 8005DBEC 9625F5C4 */  lhu        $a1, -0xa3c($s1)
/* 5E7F0 8005DBF0 3463AAAB */  ori        $v1, $v1, 0xaaab
/* 5E7F4 8005DBF4 24A50001 */  addiu      $a1, $a1, 1
/* 5E7F8 8005DBF8 00A30018 */  mult       $a1, $v1
/* 5E7FC 8005DBFC 000527C3 */  sra        $a0, $a1, 0x1f
/* 5E800 8005DC00 00001810 */  mfhi       $v1
/* 5E804 8005DC04 00641823 */  subu       $v1, $v1, $a0
/* 5E808 8005DC08 00031040 */  sll        $v0, $v1, 1
/* 5E80C 8005DC0C 00431021 */  addu       $v0, $v0, $v1
/* 5E810 8005DC10 00021040 */  sll        $v0, $v0, 1
/* 5E814 8005DC14 00A22823 */  subu       $a1, $a1, $v0
/* 5E818 8005DC18 30A3FFFF */  andi       $v1, $a1, 0xffff
/* 5E81C 8005DC1C 24020004 */  addiu      $v0, $zero, 4
/* 5E820 8005DC20 14620007 */  bne        $v1, $v0, .L8005DC40
/* 5E824 8005DC24 A625F5C4 */   sh        $a1, -0xa3c($s1)
/* 5E828 8005DC28 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 5E82C 8005DC2C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 5E830 8005DC30 54600004 */  bnel       $v1, $zero, .L8005DC44
/* 5E834 8005DC34 24040002 */   addiu     $a0, $zero, 2
/* 5E838 8005DC38 24A20001 */  addiu      $v0, $a1, 1
/* 5E83C 8005DC3C A622F5C4 */  sh         $v0, -0xa3c($s1)
.L8005DC40:
/* 5E840 8005DC40 24040002 */  addiu      $a0, $zero, 2
.L8005DC44:
/* 5E844 8005DC44 00002821 */  addu       $a1, $zero, $zero
/* 5E848 8005DC48 3C10800F */  lui        $s0, %hi(flycam_sequences)
/* 5E84C 8005DC4C 9622F5C4 */  lhu        $v0, -0xa3c($s1)
/* 5E850 8005DC50 2610F54C */  addiu      $s0, $s0, %lo(flycam_sequences)
/* 5E854 8005DC54 A54002AC */  sh         $zero, 0x2ac($t2)
/* 5E858 8005DC58 A54002B0 */  sh         $zero, 0x2b0($t2)
/* 5E85C 8005DC5C 00023880 */  sll        $a3, $v0, 2
/* 5E860 8005DC60 00E23821 */  addu       $a3, $a3, $v0
/* 5E864 8005DC64 00073880 */  sll        $a3, $a3, 2
/* 5E868 8005DC68 02073821 */  addu       $a3, $s0, $a3
/* 5E86C 8005DC6C 00023080 */  sll        $a2, $v0, 2
/* 5E870 8005DC70 00C23021 */  addu       $a2, $a2, $v0
/* 5E874 8005DC74 00063080 */  sll        $a2, $a2, 2
/* 5E878 8005DC78 02063021 */  addu       $a2, $s0, $a2
/* 5E87C 8005DC7C 00021880 */  sll        $v1, $v0, 2
/* 5E880 8005DC80 00621821 */  addu       $v1, $v1, $v0
/* 5E884 8005DC84 00031880 */  sll        $v1, $v1, 2
/* 5E888 8005DC88 00404021 */  addu       $t0, $v0, $zero
/* 5E88C 8005DC8C 02031821 */  addu       $v1, $s0, $v1
/* 5E890 8005DC90 00081080 */  sll        $v0, $t0, 2
/* 5E894 8005DC94 00481021 */  addu       $v0, $v0, $t0
/* 5E898 8005DC98 00021080 */  sll        $v0, $v0, 2
/* 5E89C 8005DC9C 02021021 */  addu       $v0, $s0, $v0
/* 5E8A0 8005DCA0 94E8000E */  lhu        $t0, 0xe($a3)
/* 5E8A4 8005DCA4 94C90012 */  lhu        $t1, 0x12($a2)
/* 5E8A8 8005DCA8 94670006 */  lhu        $a3, 6($v1)
/* 5E8AC 8005DCAC 9446000A */  lhu        $a2, 0xa($v0)
/* 5E8B0 8005DCB0 2403FFFF */  addiu      $v1, $zero, -1
/* 5E8B4 8005DCB4 A54302AE */  sh         $v1, 0x2ae($t2)
/* 5E8B8 8005DCB8 AD4002A4 */  sw         $zero, 0x2a4($t2)
/* 5E8BC 8005DCBC AD4002A8 */  sw         $zero, 0x2a8($t2)
/* 5E8C0 8005DCC0 A5480292 */  sh         $t0, 0x292($t2)
/* 5E8C4 8005DCC4 A5490294 */  sh         $t1, 0x294($t2)
/* 5E8C8 8005DCC8 A5470F74 */  sh         $a3, 0xf74($t2)
/* 5E8CC 8005DCCC 0C0044AF */  jal        InitZoneEngine
/* 5E8D0 8005DCD0 A5460F76 */   sh        $a2, 0xf76($t2)
/* 5E8D4 8005DCD4 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5E8D8 8005DCD8 9624F5C4 */  lhu        $a0, -0xa3c($s1)
/* 5E8DC 8005DCDC 3C01800E */  lui        $at, %hi(D_800DF110)
/* 5E8E0 8005DCE0 C420F110 */  lwc1       $f0, %lo(D_800DF110)($at)
/* 5E8E4 8005DCE4 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 5E8E8 8005DCE8 AC60203C */  sw         $zero, 0x203c($v1)
/* 5E8EC 8005DCEC 00041080 */  sll        $v0, $a0, 2
/* 5E8F0 8005DCF0 00441021 */  addu       $v0, $v0, $a0
/* 5E8F4 8005DCF4 00021080 */  sll        $v0, $v0, 2
/* 5E8F8 8005DCF8 00501021 */  addu       $v0, $v0, $s0
/* 5E8FC 8005DCFC 8C440000 */  lw         $a0, ($v0)
/* 5E900 8005DD00 24020002 */  addiu      $v0, $zero, 2
/* 5E904 8005DD04 A4622048 */  sh         $v0, 0x2048($v1)
/* 5E908 8005DD08 0C027EFB */  jal        get_borg_6
/* 5E90C 8005DD0C E4602044 */   swc1      $f0, 0x2044($v1)
/* 5E910 8005DD10 8C430020 */  lw         $v1, 0x20($v0)
/* 5E914 8005DD14 8C640000 */  lw         $a0, ($v1)
/* 5E918 8005DD18 3C11800F */  lui        $s1, %hi(flycam_borg6_ptr)
/* 5E91C 8005DD1C 0C027E7A */  jal        BorgAnimLoadScene
/* 5E920 8005DD20 AE22F544 */   sw        $v0, %lo(flycam_borg6_ptr)($s1)
/* 5E924 8005DD24 00402021 */  addu       $a0, $v0, $zero
/* 5E928 8005DD28 8E25F544 */  lw         $a1, -0xabc($s1)
/* 5E92C 8005DD2C 3C10800F */  lui        $s0, %hi(flycam_AniDat_ptr)
/* 5E930 8005DD30 0C027E1F */  jal        func_8009F87C
/* 5E934 8005DD34 AE02F548 */   sw        $v0, %lo(flycam_AniDat_ptr)($s0)
/* 5E938 8005DD38 0C029FEB */  jal        func_800A7FAC
/* 5E93C 8005DD3C 8E04F548 */   lw        $a0, -0xab8($s0)
/* 5E940 8005DD40 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5E944 8005DD44 8FB10014 */  lw         $s1, 0x14($sp)
/* 5E948 8005DD48 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E94C 8005DD4C 03E00008 */  jr         $ra
/* 5E950 8005DD50 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_title_screen
/* 5E954 8005DD54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5E958 8005DD58 00002021 */  addu       $a0, $zero, $zero
/* 5E95C 8005DD5C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5E960 8005DD60 0C0271BF */  jal        cont_delay
/* 5E964 8005DD64 AFB00010 */   sw        $s0, 0x10($sp)
/* 5E968 8005DD68 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5E96C 8005DD6C 247068A8 */  addiu      $s0, $v1, %lo(gGlobals)
/* 5E970 8005DD70 8E041504 */  lw         $a0, 0x1504($s0)
/* 5E974 8005DD74 3C02800F */  lui        $v0, %hi(flycam_flag)
/* 5E978 8005DD78 A040F540 */  sb         $zero, %lo(flycam_flag)($v0)
/* 5E97C 8005DD7C AE00000C */  sw         $zero, 0xc($s0)
/* 5E980 8005DD80 14800006 */  bnez       $a0, .L8005DD9C
/* 5E984 8005DD84 A2001500 */   sb        $zero, 0x1500($s0)
/* 5E988 8005DD88 0C026259 */  jal        passToMalloc
/* 5E98C 8005DD8C 2404008C */   addiu     $a0, $zero, 0x8c
/* 5E990 8005DD90 0C012814 */  jal        title_sceen_widget
/* 5E994 8005DD94 00402021 */   addu      $a0, $v0, $zero
/* 5E998 8005DD98 AE021504 */  sw         $v0, 0x1504($s0)
.L8005DD9C:
/* 5E99C 8005DD9C 8E041604 */  lw         $a0, 0x1604($s0)
/* 5E9A0 8005DDA0 0C02DC7C */  jal        widgetHandler
/* 5E9A4 8005DDA4 8E051504 */   lw        $a1, 0x1504($s0)
/* 5E9A8 8005DDA8 0C0176F0 */  jal        flycam_func
/* 5E9AC 8005DDAC 00000000 */   nop
/* 5E9B0 8005DDB0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5E9B4 8005DDB4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E9B8 8005DDB8 03E00008 */  jr         $ra
/* 5E9BC 8005DDBC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel other_flycam_func
/* 5E9C0 8005DDC0 27BDFF18 */  addiu      $sp, $sp, -0xe8
/* 5E9C4 8005DDC4 3C03800F */  lui        $v1, %hi(flycam_AniDat_ptr)
/* 5E9C8 8005DDC8 AFA400E8 */  sw         $a0, 0xe8($sp)
/* 5E9CC 8005DDCC 8C64F548 */  lw         $a0, %lo(flycam_AniDat_ptr)($v1)
/* 5E9D0 8005DDD0 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 5E9D4 8005DDD4 AFB100D4 */  sw         $s1, 0xd4($sp)
/* 5E9D8 8005DDD8 24516988 */  addiu      $s1, $v0, %lo(zoneDatMatrix)
/* 5E9DC 8005DDDC AFB200D8 */  sw         $s2, 0xd8($sp)
/* 5E9E0 8005DDE0 00609021 */  addu       $s2, $v1, $zero
/* 5E9E4 8005DDE4 AFBF00E4 */  sw         $ra, 0xe4($sp)
/* 5E9E8 8005DDE8 AFB400E0 */  sw         $s4, 0xe0($sp)
/* 5E9EC 8005DDEC AFB300DC */  sw         $s3, 0xdc($sp)
/* 5E9F0 8005DDF0 1080006D */  beqz       $a0, .L8005DFA8
/* 5E9F4 8005DDF4 AFB000D0 */   sw        $s0, 0xd0($sp)
/* 5E9F8 8005DDF8 2630FF20 */  addiu      $s0, $s1, -0xe0
/* 5E9FC 8005DDFC C600000C */  lwc1       $f0, 0xc($s0)
/* 5EA00 8005DE00 4600008D */  trunc.w.s  $f2, $f0
/* 5EA04 8005DE04 44051000 */  mfc1       $a1, $f2
/* 5EA08 8005DE08 0C02A024 */  jal        set_animation_speed
/* 5EA0C 8005DE0C 00000000 */   nop
/* 5EA10 8005DE10 0C0282FE */  jal        func_800A0BF8
/* 5EA14 8005DE14 8E44F548 */   lw        $a0, -0xab8($s2)
/* 5EA18 8005DE18 3C02800F */  lui        $v0, %hi(flycam_flag)
/* 5EA1C 8005DE1C 9043F540 */  lbu        $v1, %lo(flycam_flag)($v0)
/* 5EA20 8005DE20 14600023 */  bnez       $v1, .L8005DEB0
/* 5EA24 8005DE24 0040A021 */   addu      $s4, $v0, $zero
/* 5EA28 8005DE28 8E44F548 */  lw         $a0, -0xab8($s2)
/* 5EA2C 8005DE2C 8C820004 */  lw         $v0, 4($a0)
/* 5EA30 8005DE30 3C01800E */  lui        $at, %hi(D_800DF118)
/* 5EA34 8005DE34 D424F118 */  ldc1       $f4, %lo(D_800DF118)($at)
/* 5EA38 8005DE38 8C430020 */  lw         $v1, 0x20($v0)
/* 5EA3C 8005DE3C C600000C */  lwc1       $f0, 0xc($s0)
/* 5EA40 8005DE40 C462000C */  lwc1       $f2, 0xc($v1)
/* 5EA44 8005DE44 468010A1 */  cvt.d.w    $f2, $f2
/* 5EA48 8005DE48 46241081 */  sub.d      $f2, $f2, $f4
/* 5EA4C 8005DE4C 46000021 */  cvt.d.s    $f0, $f0
/* 5EA50 8005DE50 948201F8 */  lhu        $v0, 0x1f8($a0)
/* 5EA54 8005DE54 46201081 */  sub.d      $f2, $f2, $f0
/* 5EA58 8005DE58 44820000 */  mtc1       $v0, $f0
/* 5EA5C 8005DE5C 46800021 */  cvt.d.w    $f0, $f0
/* 5EA60 8005DE60 4620103E */  c.le.d     $f2, $f0
/* 5EA64 8005DE64 00000000 */  nop
/* 5EA68 8005DE68 45000012 */  bc1f       .L8005DEB4
/* 5EA6C 8005DE6C 3C02800E */   lui       $v0, 0x800e
/* 5EA70 8005DE70 C600203C */  lwc1       $f0, 0x203c($s0)
/* 5EA74 8005DE74 3C01800E */  lui        $at, %hi(D_800DF120)
/* 5EA78 8005DE78 D422F120 */  ldc1       $f2, %lo(D_800DF120)($at)
/* 5EA7C 8005DE7C 46000021 */  cvt.d.s    $f0, $f0
/* 5EA80 8005DE80 46220032 */  c.eq.d     $f0, $f2
/* 5EA84 8005DE84 00000000 */  nop
/* 5EA88 8005DE88 4500000A */  bc1f       .L8005DEB4
/* 5EA8C 8005DE8C 3C13800E */   lui       $s3, 0x800e
/* 5EA90 8005DE90 3C01800E */  lui        $at, %hi(D_800DF128)
/* 5EA94 8005DE94 C420F128 */  lwc1       $f0, %lo(D_800DF128)($at)
/* 5EA98 8005DE98 24020001 */  addiu      $v0, $zero, 1
/* 5EA9C 8005DE9C A282F540 */  sb         $v0, -0xac0($s4)
/* 5EAA0 8005DEA0 24020001 */  addiu      $v0, $zero, 1
/* 5EAA4 8005DEA4 A6022048 */  sh         $v0, 0x2048($s0)
/* 5EAA8 8005DEA8 080177BB */  j          .L8005DEEC
/* 5EAAC 8005DEAC E6002044 */   swc1      $f0, 0x2044($s0)
.L8005DEB0:
/* 5EAB0 8005DEB0 3C02800E */  lui        $v0, %hi(gGlobals)
.L8005DEB4:
/* 5EAB4 8005DEB4 244468A8 */  addiu      $a0, $v0, %lo(gGlobals)
/* 5EAB8 8005DEB8 94832048 */  lhu        $v1, 0x2048($a0)
/* 5EABC 8005DEBC 1460000B */  bnez       $v1, .L8005DEEC
/* 5EAC0 8005DEC0 00409821 */   addu      $s3, $v0, $zero
/* 5EAC4 8005DEC4 C482203C */  lwc1       $f2, 0x203c($a0)
/* 5EAC8 8005DEC8 44800000 */  mtc1       $zero, $f0
/* 5EACC 8005DECC 46001032 */  c.eq.s     $f2, $f0
/* 5EAD0 8005DED0 00000000 */  nop
/* 5EAD4 8005DED4 45000006 */  bc1f       .L8005DEF0
/* 5EAD8 8005DED8 8E44F548 */   lw        $a0, -0xab8($s2)
/* 5EADC 8005DEDC 0C017938 */  jal        clear_flycam
/* 5EAE0 8005DEE0 00000000 */   nop
/* 5EAE4 8005DEE4 080177FC */  j          .L8005DFF0
/* 5EAE8 8005DEE8 8FA200E8 */   lw        $v0, 0xe8($sp)
.L8005DEEC:
/* 5EAEC 8005DEEC 8E44F548 */  lw         $a0, -0xab8($s2)
.L8005DEF0:
/* 5EAF0 8005DEF0 27A50010 */  addiu      $a1, $sp, 0x10
/* 5EAF4 8005DEF4 27B00050 */  addiu      $s0, $sp, 0x50
/* 5EAF8 8005DEF8 02003021 */  addu       $a2, $s0, $zero
/* 5EAFC 8005DEFC 0C02A3A4 */  jal        func_800A8E90
/* 5EB00 8005DF00 27A70090 */   addiu     $a3, $sp, 0x90
/* 5EB04 8005DF04 26240F40 */  addiu      $a0, $s1, 0xf40
/* 5EB08 8005DF08 26250134 */  addiu      $a1, $s1, 0x134
/* 5EB0C 8005DF0C 27A60010 */  addiu      $a2, $sp, 0x10
/* 5EB10 8005DF10 0C009616 */  jal        some_flycam_dat_func
/* 5EB14 8005DF14 02003821 */   addu      $a3, $s0, $zero
/* 5EB18 8005DF18 0C003330 */  jal        func_8000CCC0
/* 5EB1C 8005DF1C 00000000 */   nop
/* 5EB20 8005DF20 1040000C */  beqz       $v0, .L8005DF54
/* 5EB24 8005DF24 27A400E8 */   addiu     $a0, $sp, 0xe8
/* 5EB28 8005DF28 0C00381F */  jal        FreeZoneEngineMemory
/* 5EB2C 8005DF2C 00000000 */   nop
/* 5EB30 8005DF30 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 5EB34 8005DF34 3C03800F */  lui        $v1, %hi(no_TP_vec3)
/* 5EB38 8005DF38 84440372 */  lh         $a0, 0x372($v0)
/* 5EB3C 8005DF3C 84450374 */  lh         $a1, 0x374($v0)
/* 5EB40 8005DF40 24020001 */  addiu      $v0, $zero, 1
/* 5EB44 8005DF44 0C0038A1 */  jal        loadGameBorgScenes
/* 5EB48 8005DF48 A4628DC2 */   sh        $v0, %lo(no_TP_vec3)($v1)
/* 5EB4C 8005DF4C 080177DE */  j          .L8005DF78
/* 5EB50 8005DF50 266368A8 */   addiu     $v1, $s3, 0x68a8
.L8005DF54:
/* 5EB54 8005DF54 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 5EB58 8005DF58 C440000C */  lwc1       $f0, 0xc($v0)
/* 5EB5C 8005DF5C 00003021 */  addu       $a2, $zero, $zero
/* 5EB60 8005DF60 4600008D */  trunc.w.s  $f2, $f0
/* 5EB64 8005DF64 44051000 */  mfc1       $a1, $f2
/* 5EB68 8005DF68 00052C00 */  sll        $a1, $a1, 0x10
/* 5EB6C 8005DF6C 0C004795 */  jal        handleZoneEngineFrame
/* 5EB70 8005DF70 00052C03 */   sra       $a1, $a1, 0x10
/* 5EB74 8005DF74 266368A8 */  addiu      $v1, $s3, 0x68a8
.L8005DF78:
/* 5EB78 8005DF78 94622048 */  lhu        $v0, 0x2048($v1)
/* 5EB7C 8005DF7C 1440001C */  bnez       $v0, .L8005DFF0
/* 5EB80 8005DF80 8FA200E8 */   lw        $v0, 0xe8($sp)
/* 5EB84 8005DF84 C462203C */  lwc1       $f2, 0x203c($v1)
/* 5EB88 8005DF88 3C01800E */  lui        $at, %hi(D_800DF12C)
/* 5EB8C 8005DF8C C420F12C */  lwc1       $f0, %lo(D_800DF12C)($at)
/* 5EB90 8005DF90 46001032 */  c.eq.s     $f2, $f0
/* 5EB94 8005DF94 00000000 */  nop
/* 5EB98 8005DF98 45030014 */  bc1tl      .L8005DFEC
/* 5EB9C 8005DF9C A280F540 */   sb        $zero, -0xac0($s4)
/* 5EBA0 8005DFA0 080177FD */  j          .L8005DFF4
/* 5EBA4 8005DFA4 8FBF00E4 */   lw        $ra, 0xe4($sp)
.L8005DFA8:
/* 5EBA8 8005DFA8 2630FF20 */  addiu      $s0, $s1, -0xe0
/* 5EBAC 8005DFAC 96021E24 */  lhu        $v0, 0x1e24($s0)
/* 5EBB0 8005DFB0 1440000F */  bnez       $v0, .L8005DFF0
/* 5EBB4 8005DFB4 8FA200E8 */   lw        $v0, 0xe8($sp)
/* 5EBB8 8005DFB8 C602203C */  lwc1       $f2, 0x203c($s0)
/* 5EBBC 8005DFBC 44800000 */  mtc1       $zero, $f0
/* 5EBC0 8005DFC0 46001032 */  c.eq.s     $f2, $f0
/* 5EBC4 8005DFC4 00000000 */  nop
/* 5EBC8 8005DFC8 4500000A */  bc1f       .L8005DFF4
/* 5EBCC 8005DFCC 8FBF00E4 */   lw        $ra, 0xe4($sp)
/* 5EBD0 8005DFD0 0C0176F0 */  jal        flycam_func
/* 5EBD4 8005DFD4 00000000 */   nop
/* 5EBD8 8005DFD8 3C01800E */  lui        $at, %hi(D_800DF130)
/* 5EBDC 8005DFDC C420F130 */  lwc1       $f0, %lo(D_800DF130)($at)
/* 5EBE0 8005DFE0 24020002 */  addiu      $v0, $zero, 2
/* 5EBE4 8005DFE4 A6022048 */  sh         $v0, 0x2048($s0)
/* 5EBE8 8005DFE8 E6002044 */  swc1       $f0, 0x2044($s0)
.L8005DFEC:
/* 5EBEC 8005DFEC 8FA200E8 */  lw         $v0, 0xe8($sp)
.L8005DFF0:
/* 5EBF0 8005DFF0 8FBF00E4 */  lw         $ra, 0xe4($sp)
.L8005DFF4:
/* 5EBF4 8005DFF4 8FB400E0 */  lw         $s4, 0xe0($sp)
/* 5EBF8 8005DFF8 8FB300DC */  lw         $s3, 0xdc($sp)
/* 5EBFC 8005DFFC 8FB200D8 */  lw         $s2, 0xd8($sp)
/* 5EC00 8005E000 8FB100D4 */  lw         $s1, 0xd4($sp)
/* 5EC04 8005E004 8FB000D0 */  lw         $s0, 0xd0($sp)
/* 5EC08 8005E008 03E00008 */  jr         $ra
/* 5EC0C 8005E00C 27BD00E8 */   addiu     $sp, $sp, 0xe8

glabel gameStart
/* 5EC10 8005E010 27BDFF40 */  addiu      $sp, $sp, -0xc0
/* 5EC14 8005E014 AFB200A0 */  sw         $s2, 0xa0($sp)
/* 5EC18 8005E018 3C12800E */  lui        $s2, 0x800e
/* 5EC1C 8005E01C 02401021 */  addu       $v0, $s2, $zero
/* 5EC20 8005E020 24427DA8 */  addiu      $v0, $v0, 0x7da8
/* 5EC24 8005E024 AFB00098 */  sw         $s0, 0x98($sp)
/* 5EC28 8005E028 2450EB00 */  addiu      $s0, $v0, -0x1500
/* 5EC2C 8005E02C 3C02800F */  lui        $v0, 0x800f
/* 5EC30 8005E030 AFBF00BC */  sw         $ra, 0xbc($sp)
/* 5EC34 8005E034 AFBE00B8 */  sw         $fp, 0xb8($sp)
/* 5EC38 8005E038 AFB700B4 */  sw         $s7, 0xb4($sp)
/* 5EC3C 8005E03C AFB600B0 */  sw         $s6, 0xb0($sp)
/* 5EC40 8005E040 AFB500AC */  sw         $s5, 0xac($sp)
/* 5EC44 8005E044 AFB400A8 */  sw         $s4, 0xa8($sp)
/* 5EC48 8005E048 AFB300A4 */  sw         $s3, 0xa4($sp)
/* 5EC4C 8005E04C AFB1009C */  sw         $s1, 0x9c($sp)
/* 5EC50 8005E050 92150040 */  lbu        $s5, 0x40($s0)
/* 5EC54 8005E054 9043F5C6 */  lbu        $v1, -0xa3a($v0)
/* 5EC58 8005E058 AFA400C0 */  sw         $a0, 0xc0($sp)
/* 5EC5C 8005E05C 10600005 */  beqz       $v1, .L8005E074
/* 5EC60 8005E060 8C910000 */   lw        $s1, ($a0)
/* 5EC64 8005E064 0C017755 */  jal        set_title_screen
/* 5EC68 8005E068 00000000 */   nop
/* 5EC6C 8005E06C 3C03800F */  lui        $v1, %hi(titleSceen_load_flag)
/* 5EC70 8005E070 A060F5C6 */  sb         $zero, %lo(titleSceen_load_flag)($v1)
.L8005E074:
/* 5EC74 8005E074 0C0178EC */  jal        check_input_7
/* 5EC78 8005E078 24140002 */   addiu     $s4, $zero, 2
/* 5EC7C 8005E07C C600000C */  lwc1       $f0, 0xc($s0)
/* 5EC80 8005E080 02202021 */  addu       $a0, $s1, $zero
/* 5EC84 8005E084 4600008D */  trunc.w.s  $f2, $f0
/* 5EC88 8005E088 44051000 */  mfc1       $a1, $f2
/* 5EC8C 8005E08C 00052C00 */  sll        $a1, $a1, 0x10
/* 5EC90 8005E090 0C0087C0 */  jal        RenderSky
/* 5EC94 8005E094 00052C03 */   sra       $a1, $a1, 0x10
/* 5EC98 8005E098 00402021 */  addu       $a0, $v0, $zero
/* 5EC9C 8005E09C 00002821 */  addu       $a1, $zero, $zero
/* 5ECA0 8005E0A0 00003021 */  addu       $a2, $zero, $zero
/* 5ECA4 8005E0A4 24070140 */  addiu      $a3, $zero, 0x140
/* 5ECA8 8005E0A8 240200F0 */  addiu      $v0, $zero, 0xf0
/* 5ECAC 8005E0AC 0C0023E5 */  jal        some_rsp_func
/* 5ECB0 8005E0B0 AFA20010 */   sw        $v0, 0x10($sp)
/* 5ECB4 8005E0B4 00408821 */  addu       $s1, $v0, $zero
/* 5ECB8 8005E0B8 9602101E */  lhu        $v0, 0x101e($s0)
/* 5ECBC 8005E0BC 1454000A */  bne        $v0, $s4, .L8005E0E8
/* 5ECC0 8005E0C0 92437DA8 */   lbu       $v1, 0x7da8($s2)
/* 5ECC4 8005E0C4 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 5ECC8 8005E0C8 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* 5ECCC 8005E0CC 27A50018 */  addiu      $a1, $sp, 0x18
/* 5ECD0 8005E0D0 A3A00024 */  sb         $zero, 0x24($sp)
/* 5ECD4 8005E0D4 AFA00018 */  sw         $zero, 0x18($sp)
/* 5ECD8 8005E0D8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5ECDC 8005E0DC 0C021487 */  jal        set_with_WeatherTemp
/* 5ECE0 8005E0E0 AFA00020 */   sw        $zero, 0x20($sp)
/* 5ECE4 8005E0E4 92437DA8 */  lbu        $v1, 0x7da8($s2)
.L8005E0E8:
/* 5ECE8 8005E0E8 10600011 */  beqz       $v1, .L8005E130
/* 5ECEC 8005E0EC 24020001 */   addiu     $v0, $zero, 1
/* 5ECF0 8005E0F0 14620007 */  bne        $v1, $v0, .L8005E110
/* 5ECF4 8005E0F4 3C13800E */   lui       $s3, 0x800e
/* 5ECF8 8005E0F8 C602203C */  lwc1       $f2, 0x203c($s0)
/* 5ECFC 8005E0FC 44800000 */  mtc1       $zero, $f0
/* 5ED00 8005E100 4602003C */  c.lt.s     $f0, $f2
/* 5ED04 8005E104 00000000 */  nop
/* 5ED08 8005E108 45010009 */  bc1t       .L8005E130
/* 5ED0C 8005E10C 00000000 */   nop
.L8005E110:
/* 5ED10 8005E110 3C16800F */  lui        $s6, 0x800f
/* 5ED14 8005E114 27B20058 */  addiu      $s2, $sp, 0x58
/* 5ED18 8005E118 3C1E800F */  lui        $fp, 0x800f
/* 5ED1C 8005E11C 14740042 */  bne        $v1, $s4, .L8005E228
/* 5ED20 8005E120 3C17800E */   lui       $s7, 0x800e
/* 5ED24 8005E124 96022048 */  lhu        $v0, 0x2048($s0)
/* 5ED28 8005E128 10400040 */  beqz       $v0, .L8005E22C
/* 5ED2C 8005E12C 3C02800E */   lui       $v0, 0x800e
.L8005E130:
/* 5ED30 8005E130 0C017770 */  jal        other_flycam_func
/* 5ED34 8005E134 02202021 */   addu      $a0, $s1, $zero
/* 5ED38 8005E138 3C03800F */  lui        $v1, %hi(flycam_flag)
/* 5ED3C 8005E13C 9064F540 */  lbu        $a0, %lo(flycam_flag)($v1)
/* 5ED40 8005E140 10800005 */  beqz       $a0, .L8005E158
/* 5ED44 8005E144 00408821 */   addu      $s1, $v0, $zero
/* 5ED48 8005E148 3C01800E */  lui        $at, %hi(D_800DF160)
/* 5ED4C 8005E14C C420F160 */  lwc1       $f0, %lo(D_800DF160)($at)
/* 5ED50 8005E150 3C02800F */  lui        $v0, %hi(D_800F36F8)
/* 5ED54 8005E154 E44036F8 */  swc1       $f0, %lo(D_800F36F8)($v0)
.L8005E158:
/* 5ED58 8005E158 0C0025B4 */  jal        get_hres
/* 5ED5C 8005E15C 3C13800E */   lui       $s3, 0x800e
/* 5ED60 8005E160 0C0025B7 */  jal        get_vres
/* 5ED64 8005E164 00408021 */   addu      $s0, $v0, $zero
/* 5ED68 8005E168 02202021 */  addu       $a0, $s1, $zero
/* 5ED6C 8005E16C 24050006 */  addiu      $a1, $zero, 6
/* 5ED70 8005E170 02003021 */  addu       $a2, $s0, $zero
/* 5ED74 8005E174 0C0290ED */  jal        rsp_func
/* 5ED78 8005E178 00403821 */   addu      $a3, $v0, $zero
/* 5ED7C 8005E17C 00408821 */  addu       $s1, $v0, $zero
/* 5ED80 8005E180 00008021 */  addu       $s0, $zero, $zero
/* 5ED84 8005E184 3C16800F */  lui        $s6, 0x800f
/* 5ED88 8005E188 27B20058 */  addiu      $s2, $sp, 0x58
/* 5ED8C 8005E18C 3C1E800F */  lui        $fp, 0x800f
/* 5ED90 8005E190 0801786A */  j          .L8005E1A8
/* 5ED94 8005E194 3C17800E */   lui       $s7, 0x800e
.L8005E198:
/* 5ED98 8005E198 8C441604 */  lw         $a0, 0x1604($v0)
/* 5ED9C 8005E19C 24050001 */  addiu      $a1, $zero, 1
/* 5EDA0 8005E1A0 0C02DBF7 */  jal        func_800B6FDC
/* 5EDA4 8005E1A4 26100001 */   addiu     $s0, $s0, 1
.L8005E1A8:
/* 5EDA8 8005E1A8 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 5EDAC 8005E1AC C440000C */  lwc1       $f0, 0xc($v0)
/* 5EDB0 8005E1B0 3C01800E */  lui        $at, %hi(D_800DF164)
/* 5EDB4 8005E1B4 C422F164 */  lwc1       $f2, %lo(D_800DF164)($at)
/* 5EDB8 8005E1B8 4600103E */  c.le.s     $f2, $f0
/* 5EDBC 8005E1BC 00000000 */  nop
/* 5EDC0 8005E1C0 45030005 */  bc1tl      .L8005E1D8
/* 5EDC4 8005E1C4 46020001 */   sub.s     $f0, $f0, $f2
/* 5EDC8 8005E1C8 4600008D */  trunc.w.s  $f2, $f0
/* 5EDCC 8005E1CC 44031000 */  mfc1       $v1, $f2
/* 5EDD0 8005E1D0 0801787B */  j          .L8005E1EC
/* 5EDD4 8005E1D4 0203102B */   sltu      $v0, $s0, $v1
.L8005E1D8:
/* 5EDD8 8005E1D8 4600008D */  trunc.w.s  $f2, $f0
/* 5EDDC 8005E1DC 44031000 */  mfc1       $v1, $f2
/* 5EDE0 8005E1E0 3C028000 */  lui        $v0, 0x8000
/* 5EDE4 8005E1E4 00621825 */  or         $v1, $v1, $v0
/* 5EDE8 8005E1E8 0203102B */  sltu       $v0, $s0, $v1
.L8005E1EC:
/* 5EDEC 8005E1EC 1440FFEA */  bnez       $v0, .L8005E198
/* 5EDF0 8005E1F0 266268A8 */   addiu     $v0, $s3, 0x68a8
/* 5EDF4 8005E1F4 02202821 */  addu       $a1, $s1, $zero
/* 5EDF8 8005E1F8 00003021 */  addu       $a2, $zero, $zero
/* 5EDFC 8005E1FC 00003821 */  addu       $a3, $zero, $zero
/* 5EE00 8005E200 24030140 */  addiu      $v1, $zero, 0x140
/* 5EE04 8005E204 8C441604 */  lw         $a0, 0x1604($v0)
/* 5EE08 8005E208 240200F0 */  addiu      $v0, $zero, 0xf0
/* 5EE0C 8005E20C AFA30010 */  sw         $v1, 0x10($sp)
/* 5EE10 8005E210 0C02DCCE */  jal        func_800B7338
/* 5EE14 8005E214 AFA20014 */   sw        $v0, 0x14($sp)
/* 5EE18 8005E218 00402021 */  addu       $a0, $v0, $zero
/* 5EE1C 8005E21C 0C00B703 */  jal        func_with_debug_queue
/* 5EE20 8005E220 24050001 */   addiu     $a1, $zero, 1
/* 5EE24 8005E224 00408821 */  addu       $s1, $v0, $zero
.L8005E228:
/* 5EE28 8005E228 3C02800E */  lui        $v0, %hi(some_gamestart_byte)
.L8005E22C:
/* 5EE2C 8005E22C 24427DA8 */  addiu      $v0, $v0, %lo(some_gamestart_byte)
/* 5EE30 8005E230 90430000 */  lbu        $v1, ($v0)
/* 5EE34 8005E234 24040001 */  addiu      $a0, $zero, 1
/* 5EE38 8005E238 10640008 */  beq        $v1, $a0, .L8005E25C
/* 5EE3C 8005E23C 28620002 */   slti      $v0, $v1, 2
/* 5EE40 8005E240 5440001B */  bnel       $v0, $zero, .L8005E2B0
/* 5EE44 8005E244 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 5EE48 8005E248 24020002 */  addiu      $v0, $zero, 2
/* 5EE4C 8005E24C 10620011 */  beq        $v1, $v0, .L8005E294
/* 5EE50 8005E250 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 5EE54 8005E254 080178AC */  j          .L8005E2B0
/* 5EE58 8005E258 00000000 */   nop
.L8005E25C:
/* 5EE5C 8005E25C 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 5EE60 8005E260 C442203C */  lwc1       $f2, 0x203c($v0)
/* 5EE64 8005E264 44800000 */  mtc1       $zero, $f0
/* 5EE68 8005E268 46001032 */  c.eq.s     $f2, $f0
/* 5EE6C 8005E26C 00000000 */  nop
/* 5EE70 8005E270 4500000E */  bc1f       .L8005E2AC
/* 5EE74 8005E274 24050001 */   addiu     $a1, $zero, 1
/* 5EE78 8005E278 A2C4F5C7 */  sb         $a0, -0xa39($s6)
/* 5EE7C 8005E27C 2415000E */  addiu      $s5, $zero, 0xe
/* 5EE80 8005E280 00002021 */  addu       $a0, $zero, $zero
/* 5EE84 8005E284 0C0171AC */  jal        load_cinematic
/* 5EE88 8005E288 24060001 */   addiu     $a2, $zero, 1
/* 5EE8C 8005E28C 080178AC */  j          .L8005E2B0
/* 5EE90 8005E290 266368A8 */   addiu     $v1, $s3, 0x68a8
.L8005E294:
/* 5EE94 8005E294 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 5EE98 8005E298 94432048 */  lhu        $v1, 0x2048($v0)
/* 5EE9C 8005E29C 14600004 */  bnez       $v1, .L8005E2B0
/* 5EEA0 8005E2A0 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 5EEA4 8005E2A4 A2C4F5C7 */  sb         $a0, -0xa39($s6)
/* 5EEA8 8005E2A8 24150001 */  addiu      $s5, $zero, 1
.L8005E2AC:
/* 5EEAC 8005E2AC 266368A8 */  addiu      $v1, $s3, 0x68a8
.L8005E2B0:
/* 5EEB0 8005E2B0 44800000 */  mtc1       $zero, $f0
/* 5EEB4 8005E2B4 8C6200A8 */  lw         $v0, 0xa8($v1)
/* 5EEB8 8005E2B8 E7A00060 */  swc1       $f0, 0x60($sp)
/* 5EEBC 8005E2BC E7A0005C */  swc1       $f0, 0x5c($sp)
/* 5EEC0 8005E2C0 10400002 */  beqz       $v0, .L8005E2CC
/* 5EEC4 8005E2C4 E7A00058 */   swc1      $f0, 0x58($sp)
/* 5EEC8 8005E2C8 24520068 */  addiu      $s2, $v0, 0x68
.L8005E2CC:
/* 5EECC 8005E2CC 8C620014 */  lw         $v0, 0x14($v1)
/* 5EED0 8005E2D0 10400018 */  beqz       $v0, .L8005E334
/* 5EED4 8005E2D4 27D08920 */   addiu     $s0, $fp, -0x76e0
/* 5EED8 8005E2D8 C4622058 */  lwc1       $f2, 0x2058($v1)
/* 5EEDC 8005E2DC 3C01800E */  lui        $at, %hi(D_800DF168)
/* 5EEE0 8005E2E0 C420F168 */  lwc1       $f0, %lo(D_800DF168)($at)
/* 5EEE4 8005E2E4 46001002 */  mul.s      $f0, $f2, $f0
/* 5EEE8 8005E2E8 3C01800E */  lui        $at, %hi(D_800DF16C)
/* 5EEEC 8005E2EC C422F16C */  lwc1       $f2, %lo(D_800DF16C)($at)
/* 5EEF0 8005E2F0 4600103E */  c.le.s     $f2, $f0
/* 5EEF4 8005E2F4 00000000 */  nop
/* 5EEF8 8005E2F8 45010005 */  bc1t       .L8005E310
/* 5EEFC 8005E2FC 9064001B */   lbu       $a0, 0x1b($v1)
/* 5EF00 8005E300 4600008D */  trunc.w.s  $f2, $f0
/* 5EF04 8005E304 44061000 */  mfc1       $a2, $f2
/* 5EF08 8005E308 080178CA */  j          .L8005E328
/* 5EF0C 8005E30C 8C65001C */   lw        $a1, 0x1c($v1)
.L8005E310:
/* 5EF10 8005E310 46020001 */  sub.s      $f0, $f0, $f2
/* 5EF14 8005E314 4600008D */  trunc.w.s  $f2, $f0
/* 5EF18 8005E318 44061000 */  mfc1       $a2, $f2
/* 5EF1C 8005E31C 3C028000 */  lui        $v0, 0x8000
/* 5EF20 8005E320 00C23025 */  or         $a2, $a2, $v0
/* 5EF24 8005E324 8C65001C */  lw         $a1, 0x1c($v1)
.L8005E328:
/* 5EF28 8005E328 0C0268D2 */  jal        some_music_func
/* 5EF2C 8005E32C 30C600FF */   andi      $a2, $a2, 0xff
/* 5EF30 8005E330 27D08920 */  addiu      $s0, $fp, -0x76e0
.L8005E334:
/* 5EF34 8005E334 02002021 */  addu       $a0, $s0, $zero
/* 5EF38 8005E338 0C0333AC */  jal        sprintf
/* 5EF3C 8005E33C 26E5F134 */   addiu     $a1, $s7, -0xecc
/* 5EF40 8005E340 2604F280 */  addiu      $a0, $s0, -0xd80
/* 5EF44 8005E344 02402821 */  addu       $a1, $s2, $zero
/* 5EF48 8005E348 0C0159CB */  jal        ProcessAudioBubbles
/* 5EF4C 8005E34C 24060001 */   addiu     $a2, $zero, 1
/* 5EF50 8005E350 92C2F5C7 */  lbu        $v0, -0xa39($s6)
/* 5EF54 8005E354 10400008 */  beqz       $v0, .L8005E378
/* 5EF58 8005E358 8FA200C0 */   lw        $v0, 0xc0($sp)
/* 5EF5C 8005E35C 0C017958 */  jal        start_intermediate_game
/* 5EF60 8005E360 00000000 */   nop
/* 5EF64 8005E364 24020001 */  addiu      $v0, $zero, 1
/* 5EF68 8005E368 3C03800F */  lui        $v1, %hi(titleSceen_load_flag)
/* 5EF6C 8005E36C A2C0F5C7 */  sb         $zero, -0xa39($s6)
/* 5EF70 8005E370 A062F5C6 */  sb         $v0, %lo(titleSceen_load_flag)($v1)
/* 5EF74 8005E374 8FA200C0 */  lw         $v0, 0xc0($sp)
.L8005E378:
/* 5EF78 8005E378 8FBF00BC */  lw         $ra, 0xbc($sp)
/* 5EF7C 8005E37C 8FBE00B8 */  lw         $fp, 0xb8($sp)
/* 5EF80 8005E380 8FB700B4 */  lw         $s7, 0xb4($sp)
/* 5EF84 8005E384 8FB600B0 */  lw         $s6, 0xb0($sp)
/* 5EF88 8005E388 8FB400A8 */  lw         $s4, 0xa8($sp)
/* 5EF8C 8005E38C 8FB300A4 */  lw         $s3, 0xa4($sp)
/* 5EF90 8005E390 8FB200A0 */  lw         $s2, 0xa0($sp)
/* 5EF94 8005E394 8FB00098 */  lw         $s0, 0x98($sp)
/* 5EF98 8005E398 AC510000 */  sw         $s1, ($v0)
/* 5EF9C 8005E39C 02A01021 */  addu       $v0, $s5, $zero
/* 5EFA0 8005E3A0 8FB500AC */  lw         $s5, 0xac($sp)
/* 5EFA4 8005E3A4 8FB1009C */  lw         $s1, 0x9c($sp)
/* 5EFA8 8005E3A8 03E00008 */  jr         $ra
/* 5EFAC 8005E3AC 27BD00C0 */   addiu     $sp, $sp, 0xc0

glabel check_input_7
/* 5EFB0 8005E3B0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5EFB4 8005E3B4 AFB40028 */  sw         $s4, 0x28($sp)
/* 5EFB8 8005E3B8 0000A021 */  addu       $s4, $zero, $zero
/* 5EFBC 8005E3BC 3C02800E */  lui        $v0, %hi(some_gamestart_byte)
/* 5EFC0 8005E3C0 AFB30024 */  sw         $s3, 0x24($sp)
/* 5EFC4 8005E3C4 24537DA8 */  addiu      $s3, $v0, %lo(some_gamestart_byte)
/* 5EFC8 8005E3C8 AFBF002C */  sw         $ra, 0x2c($sp)
/* 5EFCC 8005E3CC AFB20020 */  sw         $s2, 0x20($sp)
/* 5EFD0 8005E3D0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5EFD4 8005E3D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 5EFD8 8005E3D8 3C11800E */  lui        $s1, 0x800e
/* 5EFDC 8005E3DC 08017927 */  j          .L8005E49C
/* 5EFE0 8005E3E0 27B20010 */   addiu     $s2, $sp, 0x10
.L8005E3E4:
/* 5EFE4 8005E3E4 26820001 */  addiu      $v0, $s4, 1
/* 5EFE8 8005E3E8 8E041604 */  lw         $a0, 0x1604($s0)
/* 5EFEC 8005E3EC 8FA50010 */  lw         $a1, 0x10($sp)
/* 5EFF0 8005E3F0 0C02DC69 */  jal        run_widget_control_func
/* 5EFF4 8005E3F4 3054FFFF */   andi      $s4, $v0, 0xffff
/* 5EFF8 8005E3F8 00402021 */  addu       $a0, $v0, $zero
/* 5EFFC 8005E3FC 10800027 */  beqz       $a0, .L8005E49C
/* 5F000 8005E400 3C02800F */   lui       $v0, %hi(freeWidgetFunc)
/* 5F004 8005E404 8E031504 */  lw         $v1, 0x1504($s0)
/* 5F008 8005E408 8C45D500 */  lw         $a1, %lo(freeWidgetFunc)($v0)
/* 5F00C 8005E40C 10A00005 */  beqz       $a1, .L8005E424
/* 5F010 8005E410 8C620040 */   lw        $v0, 0x40($v1)
/* 5F014 8005E414 00A0F809 */  jalr       $a1
/* 5F018 8005E418 00000000 */   nop
/* 5F01C 8005E41C 08017928 */  j          .L8005E4A0
/* 5F020 8005E420 02402021 */   addu      $a0, $s2, $zero
.L8005E424:
/* 5F024 8005E424 90420024 */  lbu        $v0, 0x24($v0)
/* 5F028 8005E428 2444FFFA */  addiu      $a0, $v0, -6
/* 5F02C 8005E42C 2C830006 */  sltiu      $v1, $a0, 6
/* 5F030 8005E430 1060001A */  beqz       $v1, .L8005E49C
/* 5F034 8005E434 3C02800E */   lui       $v0, %hi(D_800DF170)
/* 5F038 8005E438 2442F170 */  addiu      $v0, $v0, %lo(D_800DF170)
/* 5F03C 8005E43C 00041880 */  sll        $v1, $a0, 2
/* 5F040 8005E440 00621821 */  addu       $v1, $v1, $v0
/* 5F044 8005E444 8C640000 */  lw         $a0, ($v1)
/* 5F048 8005E448 00800008 */  jr         $a0
/* 5F04C 8005E44C 00000000 */   nop
/* 5F050 8005E450 262268A8 */  addiu      $v0, $s1, 0x68a8
/* 5F054 8005E454 3C01800E */  lui        $at, %hi(D_800DF188)
/* 5F058 8005E458 C420F188 */  lwc1       $f0, %lo(D_800DF188)($at)
/* 5F05C 8005E45C 24030001 */  addiu      $v1, $zero, 1
/* 5F060 8005E460 A4432048 */  sh         $v1, 0x2048($v0)
/* 5F064 8005E464 A2630000 */  sb         $v1, ($s3)
/* 5F068 8005E468 08017927 */  j          .L8005E49C
/* 5F06C 8005E46C E4402044 */   swc1      $f0, 0x2044($v0)
/* 5F070 8005E470 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 5F074 8005E474 3C01800E */  lui        $at, %hi(D_800DF18C)
/* 5F078 8005E478 C420F18C */  lwc1       $f0, %lo(D_800DF18C)($at)
/* 5F07C 8005E47C 24020001 */  addiu      $v0, $zero, 1
/* 5F080 8005E480 A4622048 */  sh         $v0, 0x2048($v1)
/* 5F084 8005E484 24020002 */  addiu      $v0, $zero, 2
/* 5F088 8005E488 A2620000 */  sb         $v0, ($s3)
/* 5F08C 8005E48C 08017927 */  j          .L8005E49C
/* 5F090 8005E490 E4602044 */   swc1      $f0, 0x2044($v1)
/* 5F094 8005E494 0C012C92 */  jal        func_8004B248
/* 5F098 8005E498 8E640004 */   lw        $a0, 4($s3)
.L8005E49C:
/* 5F09C 8005E49C 02402021 */  addu       $a0, $s2, $zero
.L8005E4A0:
/* 5F0A0 8005E4A0 0C02713D */  jal        get_cont_aidyn
/* 5F0A4 8005E4A4 00002821 */   addu      $a1, $zero, $zero
/* 5F0A8 8005E4A8 1440FFCE */  bnez       $v0, .L8005E3E4
/* 5F0AC 8005E4AC 263068A8 */   addiu     $s0, $s1, 0x68a8
/* 5F0B0 8005E4B0 262268A8 */  addiu      $v0, $s1, 0x68a8
/* 5F0B4 8005E4B4 44940000 */  mtc1       $s4, $f0
/* 5F0B8 8005E4B8 46800020 */  cvt.s.w    $f0, $f0
/* 5F0BC 8005E4BC 8FBF002C */  lw         $ra, 0x2c($sp)
/* 5F0C0 8005E4C0 8FB40028 */  lw         $s4, 0x28($sp)
/* 5F0C4 8005E4C4 8FB30024 */  lw         $s3, 0x24($sp)
/* 5F0C8 8005E4C8 8FB20020 */  lw         $s2, 0x20($sp)
/* 5F0CC 8005E4CC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5F0D0 8005E4D0 8FB00018 */  lw         $s0, 0x18($sp)
/* 5F0D4 8005E4D4 E440000C */  swc1       $f0, 0xc($v0)
/* 5F0D8 8005E4D8 03E00008 */  jr         $ra
/* 5F0DC 8005E4DC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel clear_flycam
/* 5F0E0 8005E4E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5F0E4 8005E4E4 00002021 */  addu       $a0, $zero, $zero
/* 5F0E8 8005E4E8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5F0EC 8005E4EC AFB10014 */  sw         $s1, 0x14($sp)
/* 5F0F0 8005E4F0 0C004687 */  jal        FreeZoneEngine
/* 5F0F4 8005E4F4 AFB00010 */   sw        $s0, 0x10($sp)
/* 5F0F8 8005E4F8 3C10800E */  lui        $s0, %hi(SFXStruct)
/* 5F0FC 8005E4FC 26107BA0 */  addiu      $s0, $s0, %lo(SFXStruct)
/* 5F100 8005E500 02002021 */  addu       $a0, $s0, $zero
/* 5F104 8005E504 0C015871 */  jal        func_800561C4
/* 5F108 8005E508 24050001 */   addiu     $a1, $zero, 1
/* 5F10C 8005E50C 3C11800F */  lui        $s1, %hi(flycam_borg6_ptr)
/* 5F110 8005E510 8E24F544 */  lw         $a0, %lo(flycam_borg6_ptr)($s1)
/* 5F114 8005E514 0C027E36 */  jal        clear_borg6
/* 5F118 8005E518 2631F544 */   addiu     $s1, $s1, -0xabc
/* 5F11C 8005E51C 2610032C */  addiu      $s0, $s0, 0x32c
/* 5F120 8005E520 02002021 */  addu       $a0, $s0, $zero
/* 5F124 8005E524 3C05800F */  lui        $a1, %hi(flycam_AniDat_ptr)
/* 5F128 8005E528 24A5F548 */  addiu      $a1, $a1, %lo(flycam_AniDat_ptr)
/* 5F12C 8005E52C 24060001 */  addiu      $a2, $zero, 1
/* 5F130 8005E530 0C035867 */  jal        AllocFreeQueueItem
/* 5F134 8005E534 00003821 */   addu      $a3, $zero, $zero
/* 5F138 8005E538 02002021 */  addu       $a0, $s0, $zero
/* 5F13C 8005E53C 02202821 */  addu       $a1, $s1, $zero
/* 5F140 8005E540 24060002 */  addiu      $a2, $zero, 2
/* 5F144 8005E544 0C035867 */  jal        AllocFreeQueueItem
/* 5F148 8005E548 00003821 */   addu      $a3, $zero, $zero
/* 5F14C 8005E54C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5F150 8005E550 8FB10014 */  lw         $s1, 0x14($sp)
/* 5F154 8005E554 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F158 8005E558 03E00008 */  jr         $ra
/* 5F15C 8005E55C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel start_intermediate_game
/* 5F160 8005E560 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5F164 8005E564 3C02800E */  lui        $v0, %hi(some_gamestart_byte)
/* 5F168 8005E568 AFB00010 */  sw         $s0, 0x10($sp)
/* 5F16C 8005E56C 24507DA8 */  addiu      $s0, $v0, %lo(some_gamestart_byte)
/* 5F170 8005E570 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5F174 8005E574 AFB10014 */  sw         $s1, 0x14($sp)
/* 5F178 8005E578 8E050004 */  lw         $a1, 4($s0)
/* 5F17C 8005E57C 10A0000D */  beqz       $a1, .L8005E5B4
/* 5F180 8005E580 24110009 */   addiu     $s1, $zero, 9
/* 5F184 8005E584 2602EB00 */  addiu      $v0, $s0, -0x1500
/* 5F188 8005E588 8C431504 */  lw         $v1, 0x1504($v0)
/* 5F18C 8005E58C 8C660040 */  lw         $a2, 0x40($v1)
/* 5F190 8005E590 8C441604 */  lw         $a0, 0x1604($v0)
/* 5F194 8005E594 0C02DCB3 */  jal        func_800B72CC
/* 5F198 8005E598 90D10024 */   lbu       $s1, 0x24($a2)
/* 5F19C 8005E59C 26040124 */  addiu      $a0, $s0, 0x124
/* 5F1A0 8005E5A0 26050004 */  addiu      $a1, $s0, 4
/* 5F1A4 8005E5A4 24060006 */  addiu      $a2, $zero, 6
/* 5F1A8 8005E5A8 0C035867 */  jal        AllocFreeQueueItem
/* 5F1AC 8005E5AC 00003821 */   addu      $a3, $zero, $zero
/* 5F1B0 8005E5B0 AE000004 */  sw         $zero, 4($s0)
.L8005E5B4:
/* 5F1B4 8005E5B4 0C017938 */  jal        clear_flycam
/* 5F1B8 8005E5B8 00000000 */   nop
/* 5F1BC 8005E5BC 24020007 */  addiu      $v0, $zero, 7
/* 5F1C0 8005E5C0 1622000A */  bne        $s1, $v0, .L8005E5EC
/* 5F1C4 8005E5C4 2603EB00 */   addiu     $v1, $s0, -0x1500
/* 5F1C8 8005E5C8 3C02800F */  lui        $v0, %hi(debugMapLabels)
/* 5F1CC 8005E5CC 24428B20 */  addiu      $v0, $v0, %lo(debugMapLabels)
/* 5F1D0 8005E5D0 9444003C */  lhu        $a0, 0x3c($v0)
/* 5F1D4 8005E5D4 9445003E */  lhu        $a1, 0x3e($v0)
/* 5F1D8 8005E5D8 94460040 */  lhu        $a2, 0x40($v0)
/* 5F1DC 8005E5DC A464038C */  sh         $a0, 0x38c($v1)
/* 5F1E0 8005E5E0 A465038E */  sh         $a1, 0x38e($v1)
/* 5F1E4 8005E5E4 08017985 */  j          .L8005E614
/* 5F1E8 8005E5E8 A4660390 */   sh        $a2, 0x390($v1)
.L8005E5EC:
/* 5F1EC 8005E5EC 3C02800F */  lui        $v0, %hi(debugMapLabels)
/* 5F1F0 8005E5F0 24448B20 */  addiu      $a0, $v0, %lo(debugMapLabels)
/* 5F1F4 8005E5F4 94458B20 */  lhu        $a1, -0x74e0($v0)
/* 5F1F8 8005E5F8 94860002 */  lhu        $a2, 2($a0)
/* 5F1FC 8005E5FC 94870004 */  lhu        $a3, 4($a0)
/* 5F200 8005E600 2402FFFF */  addiu      $v0, $zero, -1
/* 5F204 8005E604 A462100A */  sh         $v0, 0x100a($v1)
/* 5F208 8005E608 A465038C */  sh         $a1, 0x38c($v1)
/* 5F20C 8005E60C A466038E */  sh         $a2, 0x38e($v1)
/* 5F210 8005E610 A4670390 */  sh         $a3, 0x390($v1)
.L8005E614:
/* 5F214 8005E614 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5F218 8005E618 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 5F21C 8005E61C 3C02800F */  lui        $v0, %hi(debugCharacters)
/* 5F220 8005E620 24438CE8 */  addiu      $v1, $v0, %lo(debugCharacters)
/* 5F224 8005E624 8C468CE8 */  lw         $a2, -0x7318($v0)
/* 5F228 8005E628 9204001B */  lbu        $a0, 0x1b($s0)
/* 5F22C 8005E62C 8E05001C */  lw         $a1, 0x1c($s0)
/* 5F230 8005E630 C4600004 */  lwc1       $f0, 4($v1)
/* 5F234 8005E634 AE0600AC */  sw         $a2, 0xac($s0)
/* 5F238 8005E638 0C026972 */  jal        dcm_remove_func
/* 5F23C 8005E63C E60000B0 */   swc1      $f0, 0xb0($s0)
/* 5F240 8005E640 26041624 */  addiu      $a0, $s0, 0x1624
/* 5F244 8005E644 26050014 */  addiu      $a1, $s0, 0x14
/* 5F248 8005E648 24060008 */  addiu      $a2, $zero, 8
/* 5F24C 8005E64C 0C035867 */  jal        AllocFreeQueueItem
/* 5F250 8005E650 00003821 */   addu      $a3, $zero, $zero
/* 5F254 8005E654 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5F258 8005E658 8FB10014 */  lw         $s1, 0x14($sp)
/* 5F25C 8005E65C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5F260 8005E660 03E00008 */  jr         $ra
/* 5F264 8005E664 27BD0020 */   addiu     $sp, $sp, 0x20
/* 5F268 8005E668 00000000 */  nop
/* 5F26C 8005E66C 00000000 */  nop
