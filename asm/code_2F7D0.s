.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8002EBD0
/* 2F7D0 8002EBD0 8CA30040 */  lw         $v1, 0x40($a1)
/* 2F7D4 8002EBD4 94640020 */  lhu        $a0, 0x20($v1)
/* 2F7D8 8002EBD8 54800003 */  bnel       $a0, $zero, .L8002EBE8
/* 2F7DC 8002EBDC 9462001E */   lhu       $v0, 0x1e($v1)
/* 2F7E0 8002EBE0 03E00008 */  jr         $ra
/* 2F7E4 8002EBE4 00001021 */   addu      $v0, $zero, $zero
.L8002EBE8:
/* 2F7E8 8002EBE8 54400002 */  bnel       $v0, $zero, .L8002EBF4
/* 2F7EC 8002EBEC 2442FFFF */   addiu     $v0, $v0, -1
/* 2F7F0 8002EBF0 2482FFFF */  addiu      $v0, $a0, -1
.L8002EBF4:
/* 2F7F4 8002EBF4 A462001E */  sh         $v0, 0x1e($v1)
/* 2F7F8 8002EBF8 03E00008 */  jr         $ra
/* 2F7FC 8002EBFC 00001021 */   addu      $v0, $zero, $zero

glabel func_8002EC00
/* 2F800 8002EC00 8CA30040 */  lw         $v1, 0x40($a1)
/* 2F804 8002EC04 94620020 */  lhu        $v0, 0x20($v1)
/* 2F808 8002EC08 54400003 */  bnel       $v0, $zero, .L8002EC18
/* 2F80C 8002EC0C 9464001E */   lhu       $a0, 0x1e($v1)
/* 2F810 8002EC10 03E00008 */  jr         $ra
/* 2F814 8002EC14 00001021 */   addu      $v0, $zero, $zero
.L8002EC18:
/* 2F818 8002EC18 2442FFFF */  addiu      $v0, $v0, -1
/* 2F81C 8002EC1C 14820003 */  bne        $a0, $v0, .L8002EC2C
/* 2F820 8002EC20 24820001 */   addiu     $v0, $a0, 1
/* 2F824 8002EC24 0800BB0C */  j          .L8002EC30
/* 2F828 8002EC28 A460001E */   sh        $zero, 0x1e($v1)
.L8002EC2C:
/* 2F82C 8002EC2C A462001E */  sh         $v0, 0x1e($v1)
.L8002EC30:
/* 2F830 8002EC30 03E00008 */  jr         $ra
/* 2F834 8002EC34 00001021 */   addu      $v0, $zero, $zero

glabel func_8002EC38
/* 2F838 8002EC38 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2F83C 8002EC3C AFB00010 */  sw         $s0, 0x10($sp)
/* 2F840 8002EC40 00808021 */  addu       $s0, $a0, $zero
/* 2F844 8002EC44 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2F848 8002EC48 0C02E68C */  jal        widgetscrollmenu_init
/* 2F84C 8002EC4C 30A500FF */   andi      $a1, $a1, 0xff
/* 2F850 8002EC50 02001021 */  addu       $v0, $s0, $zero
/* 2F854 8002EC54 3C03800E */  lui        $v1, %hi(D_800DAB50)
/* 2F858 8002EC58 2463AB50 */  addiu      $v1, $v1, %lo(D_800DAB50)
/* 2F85C 8002EC5C 3C048003 */  lui        $a0, %hi(func_8002EBD0)
/* 2F860 8002EC60 2484EBD0 */  addiu      $a0, $a0, %lo(func_8002EBD0)
/* 2F864 8002EC64 AE030078 */  sw         $v1, 0x78($s0)
/* 2F868 8002EC68 3C038003 */  lui        $v1, %hi(func_8002EC00)
/* 2F86C 8002EC6C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2F870 8002EC70 2463EC00 */  addiu      $v1, $v1, %lo(func_8002EC00)
/* 2F874 8002EC74 AE040008 */  sw         $a0, 8($s0)
/* 2F878 8002EC78 AE03000C */  sw         $v1, 0xc($s0)
/* 2F87C 8002EC7C 8FB00010 */  lw         $s0, 0x10($sp)
/* 2F880 8002EC80 03E00008 */  jr         $ra
/* 2F884 8002EC84 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8002EC88
/* 2F888 8002EC88 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 2F88C 8002EC8C AFB40020 */  sw         $s4, 0x20($sp)
/* 2F890 8002EC90 0080A021 */  addu       $s4, $a0, $zero
/* 2F894 8002EC94 AFBF0028 */  sw         $ra, 0x28($sp)
/* 2F898 8002EC98 AFB50024 */  sw         $s5, 0x24($sp)
/* 2F89C 8002EC9C AFB3001C */  sw         $s3, 0x1c($sp)
/* 2F8A0 8002ECA0 AFB20018 */  sw         $s2, 0x18($sp)
/* 2F8A4 8002ECA4 AFB10014 */  sw         $s1, 0x14($sp)
/* 2F8A8 8002ECA8 AFB00010 */  sw         $s0, 0x10($sp)
/* 2F8AC 8002ECAC 8E910040 */  lw         $s1, 0x40($s4)
/* 2F8B0 8002ECB0 8E220018 */  lw         $v0, 0x18($s1)
/* 2F8B4 8002ECB4 10400057 */  beqz       $v0, .L8002EE14
/* 2F8B8 8002ECB8 0000A821 */   addu      $s5, $zero, $zero
/* 2F8BC 8002ECBC 9222000B */  lbu        $v0, 0xb($s1)
/* 2F8C0 8002ECC0 92240001 */  lbu        $a0, 1($s1)
/* 2F8C4 8002ECC4 00441021 */  addu       $v0, $v0, $a0
/* 2F8C8 8002ECC8 A222000B */  sb         $v0, 0xb($s1)
/* 2F8CC 8002ECCC 304200FF */  andi       $v0, $v0, 0xff
/* 2F8D0 8002ECD0 10400008 */  beqz       $v0, .L8002ECF4
/* 2F8D4 8002ECD4 00041023 */   negu      $v0, $a0
/* 2F8D8 8002ECD8 9222000A */  lbu        $v0, 0xa($s1)
/* 2F8DC 8002ECDC 9223000B */  lbu        $v1, 0xb($s1)
/* 2F8E0 8002ECE0 2442FFFF */  addiu      $v0, $v0, -1
/* 2F8E4 8002ECE4 0062182A */  slt        $v1, $v1, $v0
/* 2F8E8 8002ECE8 54600004 */  bnel       $v1, $zero, .L8002ECFC
/* 2F8EC 8002ECEC 96220020 */   lhu       $v0, 0x20($s1)
/* 2F8F0 8002ECF0 00041023 */  negu       $v0, $a0
.L8002ECF4:
/* 2F8F4 8002ECF4 A2220001 */  sb         $v0, 1($s1)
/* 2F8F8 8002ECF8 96220020 */  lhu        $v0, 0x20($s1)
.L8002ECFC:
/* 2F8FC 8002ECFC 10400045 */  beqz       $v0, .L8002EE14
/* 2F900 8002ED00 00009821 */   addu      $s3, $zero, $zero
/* 2F904 8002ED04 8E230018 */  lw         $v1, 0x18($s1)
.L8002ED08:
/* 2F908 8002ED08 00131080 */  sll        $v0, $s3, 2
/* 2F90C 8002ED0C 00431021 */  addu       $v0, $v0, $v1
/* 2F910 8002ED10 8C500000 */  lw         $s0, ($v0)
/* 2F914 8002ED14 96830064 */  lhu        $v1, 0x64($s4)
/* 2F918 8002ED18 A6030064 */  sh         $v1, 0x64($s0)
/* 2F91C 8002ED1C 96820066 */  lhu        $v0, 0x66($s4)
/* 2F920 8002ED20 A6020066 */  sh         $v0, 0x66($s0)
/* 2F924 8002ED24 96830068 */  lhu        $v1, 0x68($s4)
/* 2F928 8002ED28 A6030068 */  sh         $v1, 0x68($s0)
/* 2F92C 8002ED2C 9682006A */  lhu        $v0, 0x6a($s4)
/* 2F930 8002ED30 02002021 */  addu       $a0, $s0, $zero
/* 2F934 8002ED34 A602006A */  sh         $v0, 0x6a($s0)
/* 2F938 8002ED38 86850060 */  lh         $a1, 0x60($s4)
/* 2F93C 8002ED3C 86860062 */  lh         $a2, 0x62($s4)
/* 2F940 8002ED40 86220012 */  lh         $v0, 0x12($s1)
/* 2F944 8002ED44 00D53021 */  addu       $a2, $a2, $s5
/* 2F948 8002ED48 0C02DD3F */  jal        set_widget_coords
/* 2F94C 8002ED4C 00C23021 */   addu      $a2, $a2, $v0
/* 2F950 8002ED50 8E030078 */  lw         $v1, 0x78($s0)
/* 2F954 8002ED54 84640020 */  lh         $a0, 0x20($v1)
/* 2F958 8002ED58 8C620024 */  lw         $v0, 0x24($v1)
/* 2F95C 8002ED5C 0040F809 */  jalr       $v0
/* 2F960 8002ED60 02042021 */   addu      $a0, $s0, $a0
/* 2F964 8002ED64 8E030078 */  lw         $v1, 0x78($s0)
/* 2F968 8002ED68 00409021 */  addu       $s2, $v0, $zero
/* 2F96C 8002ED6C 84640020 */  lh         $a0, 0x20($v1)
/* 2F970 8002ED70 8C650024 */  lw         $a1, 0x24($v1)
/* 2F974 8002ED74 00A0F809 */  jalr       $a1
/* 2F978 8002ED78 02042021 */   addu      $a0, $s0, $a0
/* 2F97C 8002ED7C 92230022 */  lbu        $v1, 0x22($s1)
/* 2F980 8002ED80 9624001E */  lhu        $a0, 0x1e($s1)
/* 2F984 8002ED84 00431021 */  addu       $v0, $v0, $v1
/* 2F988 8002ED88 1664001D */  bne        $s3, $a0, .L8002EE00
/* 2F98C 8002ED8C 02A2A821 */   addu      $s5, $s5, $v0
/* 2F990 8002ED90 86080062 */  lh         $t0, 0x62($s0)
/* 2F994 8002ED94 8682006A */  lh         $v0, 0x6a($s4)
/* 2F998 8002ED98 01122821 */  addu       $a1, $t0, $s2
/* 2F99C 8002ED9C 0045102A */  slt        $v0, $v0, $a1
/* 2F9A0 8002EDA0 1040000A */  beqz       $v0, .L8002EDCC
/* 2F9A4 8002EDA4 9687006A */   lhu       $a3, 0x6a($s4)
/* 2F9A8 8002EDA8 86230012 */  lh         $v1, 0x12($s1)
/* 2F9AC 8002EDAC 86220016 */  lh         $v0, 0x16($s1)
/* 2F9B0 8002EDB0 14620006 */  bne        $v1, $v0, .L8002EDCC
/* 2F9B4 8002EDB4 96260016 */   lhu       $a2, 0x16($s1)
/* 2F9B8 8002EDB8 00A71023 */  subu       $v0, $a1, $a3
/* 2F9BC 8002EDBC 00021400 */  sll        $v0, $v0, 0x10
/* 2F9C0 8002EDC0 00021403 */  sra        $v0, $v0, 0x10
/* 2F9C4 8002EDC4 00C21023 */  subu       $v0, $a2, $v0
/* 2F9C8 8002EDC8 A6220016 */  sh         $v0, 0x16($s1)
.L8002EDCC:
/* 2F9CC 8002EDCC 86820068 */  lh         $v0, 0x68($s4)
/* 2F9D0 8002EDD0 0102102A */  slt        $v0, $t0, $v0
/* 2F9D4 8002EDD4 1040000A */  beqz       $v0, .L8002EE00
/* 2F9D8 8002EDD8 96850068 */   lhu       $a1, 0x68($s4)
/* 2F9DC 8002EDDC 86230012 */  lh         $v1, 0x12($s1)
/* 2F9E0 8002EDE0 86220016 */  lh         $v0, 0x16($s1)
/* 2F9E4 8002EDE4 14620006 */  bne        $v1, $v0, .L8002EE00
/* 2F9E8 8002EDE8 96240016 */   lhu       $a0, 0x16($s1)
/* 2F9EC 8002EDEC 00A81023 */  subu       $v0, $a1, $t0
/* 2F9F0 8002EDF0 00021400 */  sll        $v0, $v0, 0x10
/* 2F9F4 8002EDF4 00021403 */  sra        $v0, $v0, 0x10
/* 2F9F8 8002EDF8 00441021 */  addu       $v0, $v0, $a0
/* 2F9FC 8002EDFC A6220016 */  sh         $v0, 0x16($s1)
.L8002EE00:
/* 2FA00 8002EE00 96220020 */  lhu        $v0, 0x20($s1)
/* 2FA04 8002EE04 26730001 */  addiu      $s3, $s3, 1
/* 2FA08 8002EE08 0262102A */  slt        $v0, $s3, $v0
/* 2FA0C 8002EE0C 5440FFBE */  bnel       $v0, $zero, .L8002ED08
/* 2FA10 8002EE10 8E230018 */   lw        $v1, 0x18($s1)
.L8002EE14:
/* 2FA14 8002EE14 02802021 */  addu       $a0, $s4, $zero
/* 2FA18 8002EE18 0C02DD46 */  jal        set_widgetWidth
/* 2FA1C 8002EE1C 32A5FFFF */   andi      $a1, $s5, 0xffff
/* 2FA20 8002EE20 86240010 */  lh         $a0, 0x10($s1)
/* 2FA24 8002EE24 86230014 */  lh         $v1, 0x14($s1)
/* 2FA28 8002EE28 96250010 */  lhu        $a1, 0x10($s1)
/* 2FA2C 8002EE2C 0064102A */  slt        $v0, $v1, $a0
/* 2FA30 8002EE30 10400008 */  beqz       $v0, .L8002EE54
/* 2FA34 8002EE34 96260014 */   lhu       $a2, 0x14($s1)
/* 2FA38 8002EE38 92220000 */  lbu        $v0, ($s1)
/* 2FA3C 8002EE3C 00A21023 */  subu       $v0, $a1, $v0
/* 2FA40 8002EE40 A6220010 */  sh         $v0, 0x10($s1)
/* 2FA44 8002EE44 00021400 */  sll        $v0, $v0, 0x10
/* 2FA48 8002EE48 00021403 */  sra        $v0, $v0, 0x10
/* 2FA4C 8002EE4C 0800BB9E */  j          .L8002EE78
/* 2FA50 8002EE50 0043102A */   slt       $v0, $v0, $v1
.L8002EE54:
/* 2FA54 8002EE54 0083102A */  slt        $v0, $a0, $v1
/* 2FA58 8002EE58 5040000A */  beql       $v0, $zero, .L8002EE84
/* 2FA5C 8002EE5C 86240012 */   lh        $a0, 0x12($s1)
/* 2FA60 8002EE60 92220000 */  lbu        $v0, ($s1)
/* 2FA64 8002EE64 00A21021 */  addu       $v0, $a1, $v0
/* 2FA68 8002EE68 A6220010 */  sh         $v0, 0x10($s1)
/* 2FA6C 8002EE6C 00021400 */  sll        $v0, $v0, 0x10
/* 2FA70 8002EE70 00021403 */  sra        $v0, $v0, 0x10
/* 2FA74 8002EE74 0062102A */  slt        $v0, $v1, $v0
.L8002EE78:
/* 2FA78 8002EE78 54400001 */  bnel       $v0, $zero, .L8002EE80
/* 2FA7C 8002EE7C A6260010 */   sh        $a2, 0x10($s1)
.L8002EE80:
/* 2FA80 8002EE80 86240012 */  lh         $a0, 0x12($s1)
.L8002EE84:
/* 2FA84 8002EE84 86230016 */  lh         $v1, 0x16($s1)
/* 2FA88 8002EE88 96250012 */  lhu        $a1, 0x12($s1)
/* 2FA8C 8002EE8C 0064102A */  slt        $v0, $v1, $a0
/* 2FA90 8002EE90 10400008 */  beqz       $v0, .L8002EEB4
/* 2FA94 8002EE94 96260016 */   lhu       $a2, 0x16($s1)
/* 2FA98 8002EE98 92220000 */  lbu        $v0, ($s1)
/* 2FA9C 8002EE9C 00A21023 */  subu       $v0, $a1, $v0
/* 2FAA0 8002EEA0 A6220012 */  sh         $v0, 0x12($s1)
/* 2FAA4 8002EEA4 00021400 */  sll        $v0, $v0, 0x10
/* 2FAA8 8002EEA8 00021403 */  sra        $v0, $v0, 0x10
/* 2FAAC 8002EEAC 0800BBB6 */  j          .L8002EED8
/* 2FAB0 8002EEB0 0043102A */   slt       $v0, $v0, $v1
.L8002EEB4:
/* 2FAB4 8002EEB4 0083102A */  slt        $v0, $a0, $v1
/* 2FAB8 8002EEB8 10400009 */  beqz       $v0, .L8002EEE0
/* 2FABC 8002EEBC 00000000 */   nop
/* 2FAC0 8002EEC0 92220000 */  lbu        $v0, ($s1)
/* 2FAC4 8002EEC4 00A21021 */  addu       $v0, $a1, $v0
/* 2FAC8 8002EEC8 A6220012 */  sh         $v0, 0x12($s1)
/* 2FACC 8002EECC 00021400 */  sll        $v0, $v0, 0x10
/* 2FAD0 8002EED0 00021403 */  sra        $v0, $v0, 0x10
/* 2FAD4 8002EED4 0062102A */  slt        $v0, $v1, $v0
.L8002EED8:
/* 2FAD8 8002EED8 54400001 */  bnel       $v0, $zero, .L8002EEE0
/* 2FADC 8002EEDC A6260012 */   sh        $a2, 0x12($s1)
.L8002EEE0:
/* 2FAE0 8002EEE0 0C02DE51 */  jal        func_800B7944
/* 2FAE4 8002EEE4 02802021 */   addu      $a0, $s4, $zero
/* 2FAE8 8002EEE8 8FBF0028 */  lw         $ra, 0x28($sp)
/* 2FAEC 8002EEEC 8FB50024 */  lw         $s5, 0x24($sp)
/* 2FAF0 8002EEF0 8FB40020 */  lw         $s4, 0x20($sp)
/* 2FAF4 8002EEF4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2FAF8 8002EEF8 8FB20018 */  lw         $s2, 0x18($sp)
/* 2FAFC 8002EEFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 2FB00 8002EF00 8FB00010 */  lw         $s0, 0x10($sp)
/* 2FB04 8002EF04 03E00008 */  jr         $ra
/* 2FB08 8002EF08 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8002EF0C
/* 2FB0C 8002EF0C AFA50004 */  sw         $a1, 4($sp)
/* 2FB10 8002EF10 93A20004 */  lbu        $v0, 4($sp)
/* 2FB14 8002EF14 AFA40000 */  sw         $a0, ($sp)
/* 2FB18 8002EF18 93A30000 */  lbu        $v1, ($sp)
/* 2FB1C 8002EF1C 44872000 */  mtc1       $a3, $f4
/* 2FB20 8002EF20 00431023 */  subu       $v0, $v0, $v1
/* 2FB24 8002EF24 44820000 */  mtc1       $v0, $f0
/* 2FB28 8002EF28 46800020 */  cvt.s.w    $f0, $f0
/* 2FB2C 8002EF2C 46040002 */  mul.s      $f0, $f0, $f4
/* 2FB30 8002EF30 3C01800E */  lui        $at, %hi(D_800DAB40)
/* 2FB34 8002EF34 C422AB40 */  lwc1       $f2, %lo(D_800DAB40)($at)
/* 2FB38 8002EF38 4600103E */  c.le.s     $f2, $f0
/* 2FB3C 8002EF3C 00000000 */  nop
/* 2FB40 8002EF40 45030005 */  bc1tl      .L8002EF58
/* 2FB44 8002EF44 46020001 */   sub.s     $f0, $f0, $f2
/* 2FB48 8002EF48 4600008D */  trunc.w.s  $f2, $f0
/* 2FB4C 8002EF4C 44041000 */  mfc1       $a0, $f2
/* 2FB50 8002EF50 0800BBDB */  j          .L8002EF6C
/* 2FB54 8002EF54 93A20005 */   lbu       $v0, 5($sp)
.L8002EF58:
/* 2FB58 8002EF58 4600008D */  trunc.w.s  $f2, $f0
/* 2FB5C 8002EF5C 44041000 */  mfc1       $a0, $f2
/* 2FB60 8002EF60 3C028000 */  lui        $v0, 0x8000
/* 2FB64 8002EF64 00822025 */  or         $a0, $a0, $v0
/* 2FB68 8002EF68 93A20005 */  lbu        $v0, 5($sp)
.L8002EF6C:
/* 2FB6C 8002EF6C 93A30001 */  lbu        $v1, 1($sp)
/* 2FB70 8002EF70 00431023 */  subu       $v0, $v0, $v1
/* 2FB74 8002EF74 44820000 */  mtc1       $v0, $f0
/* 2FB78 8002EF78 46800020 */  cvt.s.w    $f0, $f0
/* 2FB7C 8002EF7C 46040002 */  mul.s      $f0, $f0, $f4
/* 2FB80 8002EF80 93A20000 */  lbu        $v0, ($sp)
/* 2FB84 8002EF84 3C01800E */  lui        $at, %hi(D_800DAB44)
/* 2FB88 8002EF88 C422AB44 */  lwc1       $f2, %lo(D_800DAB44)($at)
/* 2FB8C 8002EF8C 00441021 */  addu       $v0, $v0, $a0
/* 2FB90 8002EF90 4600103E */  c.le.s     $f2, $f0
/* 2FB94 8002EF94 00000000 */  nop
/* 2FB98 8002EF98 45010005 */  bc1t       .L8002EFB0
/* 2FB9C 8002EF9C A0C20000 */   sb        $v0, ($a2)
/* 2FBA0 8002EFA0 4600008D */  trunc.w.s  $f2, $f0
/* 2FBA4 8002EFA4 44041000 */  mfc1       $a0, $f2
/* 2FBA8 8002EFA8 0800BBF2 */  j          .L8002EFC8
/* 2FBAC 8002EFAC 93A20006 */   lbu       $v0, 6($sp)
.L8002EFB0:
/* 2FBB0 8002EFB0 46020001 */  sub.s      $f0, $f0, $f2
/* 2FBB4 8002EFB4 4600008D */  trunc.w.s  $f2, $f0
/* 2FBB8 8002EFB8 44041000 */  mfc1       $a0, $f2
/* 2FBBC 8002EFBC 3C028000 */  lui        $v0, 0x8000
/* 2FBC0 8002EFC0 00822025 */  or         $a0, $a0, $v0
/* 2FBC4 8002EFC4 93A20006 */  lbu        $v0, 6($sp)
.L8002EFC8:
/* 2FBC8 8002EFC8 93A30002 */  lbu        $v1, 2($sp)
/* 2FBCC 8002EFCC 00431023 */  subu       $v0, $v0, $v1
/* 2FBD0 8002EFD0 44820000 */  mtc1       $v0, $f0
/* 2FBD4 8002EFD4 46800020 */  cvt.s.w    $f0, $f0
/* 2FBD8 8002EFD8 46040002 */  mul.s      $f0, $f0, $f4
/* 2FBDC 8002EFDC 93A20001 */  lbu        $v0, 1($sp)
/* 2FBE0 8002EFE0 3C01800E */  lui        $at, %hi(D_800DAB48)
/* 2FBE4 8002EFE4 C422AB48 */  lwc1       $f2, %lo(D_800DAB48)($at)
/* 2FBE8 8002EFE8 00441021 */  addu       $v0, $v0, $a0
/* 2FBEC 8002EFEC 4600103E */  c.le.s     $f2, $f0
/* 2FBF0 8002EFF0 00000000 */  nop
/* 2FBF4 8002EFF4 45010005 */  bc1t       .L8002F00C
/* 2FBF8 8002EFF8 A0C20001 */   sb        $v0, 1($a2)
/* 2FBFC 8002EFFC 4600008D */  trunc.w.s  $f2, $f0
/* 2FC00 8002F000 44041000 */  mfc1       $a0, $f2
/* 2FC04 8002F004 0800BC09 */  j          .L8002F024
/* 2FC08 8002F008 93A20007 */   lbu       $v0, 7($sp)
.L8002F00C:
/* 2FC0C 8002F00C 46020001 */  sub.s      $f0, $f0, $f2
/* 2FC10 8002F010 4600008D */  trunc.w.s  $f2, $f0
/* 2FC14 8002F014 44041000 */  mfc1       $a0, $f2
/* 2FC18 8002F018 3C028000 */  lui        $v0, 0x8000
/* 2FC1C 8002F01C 00822025 */  or         $a0, $a0, $v0
/* 2FC20 8002F020 93A20007 */  lbu        $v0, 7($sp)
.L8002F024:
/* 2FC24 8002F024 93A30003 */  lbu        $v1, 3($sp)
/* 2FC28 8002F028 00431023 */  subu       $v0, $v0, $v1
/* 2FC2C 8002F02C 44820000 */  mtc1       $v0, $f0
/* 2FC30 8002F030 46800020 */  cvt.s.w    $f0, $f0
/* 2FC34 8002F034 46040002 */  mul.s      $f0, $f0, $f4
/* 2FC38 8002F038 93A20002 */  lbu        $v0, 2($sp)
/* 2FC3C 8002F03C 3C01800E */  lui        $at, %hi(D_800DAB4C)
/* 2FC40 8002F040 C422AB4C */  lwc1       $f2, %lo(D_800DAB4C)($at)
/* 2FC44 8002F044 00441021 */  addu       $v0, $v0, $a0
/* 2FC48 8002F048 4600103E */  c.le.s     $f2, $f0
/* 2FC4C 8002F04C 00000000 */  nop
/* 2FC50 8002F050 45010005 */  bc1t       .L8002F068
/* 2FC54 8002F054 A0C20002 */   sb        $v0, 2($a2)
/* 2FC58 8002F058 4600008D */  trunc.w.s  $f2, $f0
/* 2FC5C 8002F05C 44071000 */  mfc1       $a3, $f2
/* 2FC60 8002F060 0800BC20 */  j          .L8002F080
/* 2FC64 8002F064 93A20003 */   lbu       $v0, 3($sp)
.L8002F068:
/* 2FC68 8002F068 46020001 */  sub.s      $f0, $f0, $f2
/* 2FC6C 8002F06C 4600008D */  trunc.w.s  $f2, $f0
/* 2FC70 8002F070 44071000 */  mfc1       $a3, $f2
/* 2FC74 8002F074 3C028000 */  lui        $v0, 0x8000
/* 2FC78 8002F078 00E23825 */  or         $a3, $a3, $v0
/* 2FC7C 8002F07C 93A20003 */  lbu        $v0, 3($sp)
.L8002F080:
/* 2FC80 8002F080 00471021 */  addu       $v0, $v0, $a3
/* 2FC84 8002F084 03E00008 */  jr         $ra
/* 2FC88 8002F088 A0C20003 */   sb        $v0, 3($a2)

glabel func_8002F08C
/* 2FC8C 8002F08C 27BDFE00 */  addiu      $sp, $sp, -0x200
/* 2FC90 8002F090 AFB201E0 */  sw         $s2, 0x1e0($sp)
/* 2FC94 8002F094 00A09021 */  addu       $s2, $a1, $zero
/* 2FC98 8002F098 AFB301E4 */  sw         $s3, 0x1e4($sp)
/* 2FC9C 8002F09C 00009821 */  addu       $s3, $zero, $zero
/* 2FCA0 8002F0A0 AFBE01F8 */  sw         $fp, 0x1f8($sp)
/* 2FCA4 8002F0A4 0080F021 */  addu       $fp, $a0, $zero
/* 2FCA8 8002F0A8 00063400 */  sll        $a2, $a2, 0x10
/* 2FCAC 8002F0AC AFB701F4 */  sw         $s7, 0x1f4($sp)
/* 2FCB0 8002F0B0 0006BC03 */  sra        $s7, $a2, 0x10
/* 2FCB4 8002F0B4 00073C00 */  sll        $a3, $a3, 0x10
/* 2FCB8 8002F0B8 AFB601F0 */  sw         $s6, 0x1f0($sp)
/* 2FCBC 8002F0BC 0007B403 */  sra        $s6, $a3, 0x10
/* 2FCC0 8002F0C0 AFBF01FC */  sw         $ra, 0x1fc($sp)
/* 2FCC4 8002F0C4 AFB501EC */  sw         $s5, 0x1ec($sp)
/* 2FCC8 8002F0C8 AFB401E8 */  sw         $s4, 0x1e8($sp)
/* 2FCCC 8002F0CC AFB101DC */  sw         $s1, 0x1dc($sp)
/* 2FCD0 8002F0D0 AFB001D8 */  sw         $s0, 0x1d8($sp)
/* 2FCD4 8002F0D4 8FD10040 */  lw         $s1, 0x40($fp)
/* 2FCD8 8002F0D8 87B50212 */  lh         $s5, 0x212($sp)
/* 2FCDC 8002F0DC 96220020 */  lhu        $v0, 0x20($s1)
/* 2FCE0 8002F0E0 1040006D */  beqz       $v0, .L8002F298
/* 2FCE4 8002F0E4 87B40216 */   lh        $s4, 0x216($sp)
/* 2FCE8 8002F0E8 8E230018 */  lw         $v1, 0x18($s1)
.L8002F0EC:
/* 2FCEC 8002F0EC 00131080 */  sll        $v0, $s3, 2
/* 2FCF0 8002F0F0 00431021 */  addu       $v0, $v0, $v1
/* 2FCF4 8002F0F4 8C500000 */  lw         $s0, ($v0)
/* 2FCF8 8002F0F8 52000063 */  beql       $s0, $zero, .L8002F288
/* 2FCFC 8002F0FC 96220020 */   lhu       $v0, 0x20($s1)
/* 2FD00 8002F100 9622001E */  lhu        $v0, 0x1e($s1)
/* 2FD04 8002F104 1262000C */  beq        $s3, $v0, .L8002F138
/* 2FD08 8002F108 02402821 */   addu      $a1, $s2, $zero
/* 2FD0C 8002F10C 8E030078 */  lw         $v1, 0x78($s0)
/* 2FD10 8002F110 02E03021 */  addu       $a2, $s7, $zero
/* 2FD14 8002F114 84640040 */  lh         $a0, 0x40($v1)
/* 2FD18 8002F118 02C03821 */  addu       $a3, $s6, $zero
/* 2FD1C 8002F11C AFB50010 */  sw         $s5, 0x10($sp)
/* 2FD20 8002F120 AFB40014 */  sw         $s4, 0x14($sp)
/* 2FD24 8002F124 8C620044 */  lw         $v0, 0x44($v1)
/* 2FD28 8002F128 0040F809 */  jalr       $v0
/* 2FD2C 8002F12C 02042021 */   addu      $a0, $s0, $a0
/* 2FD30 8002F130 0800BCA1 */  j          .L8002F284
/* 2FD34 8002F134 00409021 */   addu      $s2, $v0, $zero
.L8002F138:
/* 2FD38 8002F138 27A40058 */  addiu      $a0, $sp, 0x58
/* 2FD3C 8002F13C 00002821 */  addu       $a1, $zero, $zero
/* 2FD40 8002F140 0C026380 */  jal        Calloc
/* 2FD44 8002F144 24060004 */   addiu     $a2, $zero, 4
/* 2FD48 8002F148 92030058 */  lbu        $v1, 0x58($s0)
/* 2FD4C 8002F14C A3A30058 */  sb         $v1, 0x58($sp)
/* 2FD50 8002F150 92020059 */  lbu        $v0, 0x59($s0)
/* 2FD54 8002F154 27A400D8 */  addiu      $a0, $sp, 0xd8
/* 2FD58 8002F158 A3A20059 */  sb         $v0, 0x59($sp)
/* 2FD5C 8002F15C 9203005A */  lbu        $v1, 0x5a($s0)
/* 2FD60 8002F160 00002821 */  addu       $a1, $zero, $zero
/* 2FD64 8002F164 A3A3005A */  sb         $v1, 0x5a($sp)
/* 2FD68 8002F168 9202005B */  lbu        $v0, 0x5b($s0)
/* 2FD6C 8002F16C A3A2005B */  sb         $v0, 0x5b($sp)
/* 2FD70 8002F170 8BA20058 */  lwl        $v0, 0x58($sp)
/* 2FD74 8002F174 9BA2005B */  lwr        $v0, 0x5b($sp)
/* 2FD78 8002F178 ABA20018 */  swl        $v0, 0x18($sp)
/* 2FD7C 8002F17C BBA2001B */  swr        $v0, 0x1b($sp)
/* 2FD80 8002F180 0C026380 */  jal        Calloc
/* 2FD84 8002F184 24060004 */   addiu     $a2, $zero, 4
/* 2FD88 8002F188 92230002 */  lbu        $v1, 2($s1)
/* 2FD8C 8002F18C A3A300D8 */  sb         $v1, 0xd8($sp)
/* 2FD90 8002F190 92220004 */  lbu        $v0, 4($s1)
/* 2FD94 8002F194 A3A200D9 */  sb         $v0, 0xd9($sp)
/* 2FD98 8002F198 92230006 */  lbu        $v1, 6($s1)
/* 2FD9C 8002F19C A3A300DA */  sb         $v1, 0xda($sp)
/* 2FDA0 8002F1A0 92220008 */  lbu        $v0, 8($s1)
/* 2FDA4 8002F1A4 A3A200DB */  sb         $v0, 0xdb($sp)
/* 2FDA8 8002F1A8 8BA200D8 */  lwl        $v0, 0xd8($sp)
/* 2FDAC 8002F1AC 9BA200DB */  lwr        $v0, 0xdb($sp)
/* 2FDB0 8002F1B0 ABA20098 */  swl        $v0, 0x98($sp)
/* 2FDB4 8002F1B4 BBA2009B */  swr        $v0, 0x9b($sp)
/* 2FDB8 8002F1B8 9222000B */  lbu        $v0, 0xb($s1)
/* 2FDBC 8002F1BC 9223000A */  lbu        $v1, 0xa($s1)
/* 2FDC0 8002F1C0 8BA70098 */  lwl        $a3, 0x98($sp)
/* 2FDC4 8002F1C4 9BA7009B */  lwr        $a3, 0x9b($sp)
/* 2FDC8 8002F1C8 ABA70158 */  swl        $a3, 0x158($sp)
/* 2FDCC 8002F1CC BBA7015B */  swr        $a3, 0x15b($sp)
/* 2FDD0 8002F1D0 8BA70018 */  lwl        $a3, 0x18($sp)
/* 2FDD4 8002F1D4 9BA7001B */  lwr        $a3, 0x1b($sp)
/* 2FDD8 8002F1D8 ABA70198 */  swl        $a3, 0x198($sp)
/* 2FDDC 8002F1DC BBA7019B */  swr        $a3, 0x19b($sp)
/* 2FDE0 8002F1E0 8FA40158 */  lw         $a0, 0x158($sp)
/* 2FDE4 8002F1E4 8FA50198 */  lw         $a1, 0x198($sp)
/* 2FDE8 8002F1E8 44821000 */  mtc1       $v0, $f2
/* 2FDEC 8002F1EC 468010A0 */  cvt.s.w    $f2, $f2
/* 2FDF0 8002F1F0 44830000 */  mtc1       $v1, $f0
/* 2FDF4 8002F1F4 46800020 */  cvt.s.w    $f0, $f0
/* 2FDF8 8002F1F8 46001083 */  div.s      $f2, $f2, $f0
/* 2FDFC 8002F1FC 44071000 */  mfc1       $a3, $f2
/* 2FE00 8002F200 0C00BBC3 */  jal        func_8002EF0C
/* 2FE04 8002F204 27A60118 */   addiu     $a2, $sp, 0x118
/* 2FE08 8002F208 8E080078 */  lw         $t0, 0x78($s0)
/* 2FE0C 8002F20C 93A2011B */  lbu        $v0, 0x11b($sp)
/* 2FE10 8002F210 93A50118 */  lbu        $a1, 0x118($sp)
/* 2FE14 8002F214 93A60119 */  lbu        $a2, 0x119($sp)
/* 2FE18 8002F218 93A7011A */  lbu        $a3, 0x11a($sp)
/* 2FE1C 8002F21C 85040048 */  lh         $a0, 0x48($t0)
/* 2FE20 8002F220 AFA20010 */  sw         $v0, 0x10($sp)
/* 2FE24 8002F224 8D03004C */  lw         $v1, 0x4c($t0)
/* 2FE28 8002F228 0060F809 */  jalr       $v1
/* 2FE2C 8002F22C 02042021 */   addu      $a0, $s0, $a0
/* 2FE30 8002F230 02402821 */  addu       $a1, $s2, $zero
/* 2FE34 8002F234 8E030078 */  lw         $v1, 0x78($s0)
/* 2FE38 8002F238 02E03021 */  addu       $a2, $s7, $zero
/* 2FE3C 8002F23C 84640040 */  lh         $a0, 0x40($v1)
/* 2FE40 8002F240 02C03821 */  addu       $a3, $s6, $zero
/* 2FE44 8002F244 AFB50010 */  sw         $s5, 0x10($sp)
/* 2FE48 8002F248 AFB40014 */  sw         $s4, 0x14($sp)
/* 2FE4C 8002F24C 8C620044 */  lw         $v0, 0x44($v1)
/* 2FE50 8002F250 0040F809 */  jalr       $v0
/* 2FE54 8002F254 02042021 */   addu      $a0, $s0, $a0
/* 2FE58 8002F258 00409021 */  addu       $s2, $v0, $zero
/* 2FE5C 8002F25C 8E080078 */  lw         $t0, 0x78($s0)
/* 2FE60 8002F260 93A2001B */  lbu        $v0, 0x1b($sp)
/* 2FE64 8002F264 93A50018 */  lbu        $a1, 0x18($sp)
/* 2FE68 8002F268 93A60019 */  lbu        $a2, 0x19($sp)
/* 2FE6C 8002F26C 93A7001A */  lbu        $a3, 0x1a($sp)
/* 2FE70 8002F270 85040048 */  lh         $a0, 0x48($t0)
/* 2FE74 8002F274 AFA20010 */  sw         $v0, 0x10($sp)
/* 2FE78 8002F278 8D03004C */  lw         $v1, 0x4c($t0)
/* 2FE7C 8002F27C 0060F809 */  jalr       $v1
/* 2FE80 8002F280 02042021 */   addu      $a0, $s0, $a0
.L8002F284:
/* 2FE84 8002F284 96220020 */  lhu        $v0, 0x20($s1)
.L8002F288:
/* 2FE88 8002F288 26730001 */  addiu      $s3, $s3, 1
/* 2FE8C 8002F28C 0262102A */  slt        $v0, $s3, $v0
/* 2FE90 8002F290 5440FF96 */  bnel       $v0, $zero, .L8002F0EC
/* 2FE94 8002F294 8E230018 */   lw        $v1, 0x18($s1)
.L8002F298:
/* 2FE98 8002F298 03C02021 */  addu       $a0, $fp, $zero
/* 2FE9C 8002F29C 02402821 */  addu       $a1, $s2, $zero
/* 2FEA0 8002F2A0 02E03021 */  addu       $a2, $s7, $zero
/* 2FEA4 8002F2A4 02C03821 */  addu       $a3, $s6, $zero
/* 2FEA8 8002F2A8 AFB50010 */  sw         $s5, 0x10($sp)
/* 2FEAC 8002F2AC 0C02DE14 */  jal        widget_func_8
/* 2FEB0 8002F2B0 AFB40014 */   sw        $s4, 0x14($sp)
/* 2FEB4 8002F2B4 8FBF01FC */  lw         $ra, 0x1fc($sp)
/* 2FEB8 8002F2B8 8FBE01F8 */  lw         $fp, 0x1f8($sp)
/* 2FEBC 8002F2BC 8FB701F4 */  lw         $s7, 0x1f4($sp)
/* 2FEC0 8002F2C0 8FB601F0 */  lw         $s6, 0x1f0($sp)
/* 2FEC4 8002F2C4 8FB501EC */  lw         $s5, 0x1ec($sp)
/* 2FEC8 8002F2C8 8FB401E8 */  lw         $s4, 0x1e8($sp)
/* 2FECC 8002F2CC 8FB301E4 */  lw         $s3, 0x1e4($sp)
/* 2FED0 8002F2D0 8FB201E0 */  lw         $s2, 0x1e0($sp)
/* 2FED4 8002F2D4 8FB101DC */  lw         $s1, 0x1dc($sp)
/* 2FED8 8002F2D8 8FB001D8 */  lw         $s0, 0x1d8($sp)
/* 2FEDC 8002F2DC 03E00008 */  jr         $ra
/* 2FEE0 8002F2E0 27BD0200 */   addiu     $sp, $sp, 0x200

glabel func_8002F2E4
/* 2FEE4 8002F2E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2FEE8 8002F2E8 3C02800E */  lui        $v0, %hi(D_800DAB50)
/* 2FEEC 8002F2EC 2442AB50 */  addiu      $v0, $v0, %lo(D_800DAB50)
/* 2FEF0 8002F2F0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2FEF4 8002F2F4 0C02E6ED */  jal        widgetscrollmenu_free
/* 2FEF8 8002F2F8 AC820078 */   sw        $v0, 0x78($a0)
/* 2FEFC 8002F2FC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2FF00 8002F300 03E00008 */  jr         $ra
/* 2FF04 8002F304 27BD0018 */   addiu     $sp, $sp, 0x18
/* 2FF08 8002F308 00000000 */  nop
/* 2FF0C 8002F30C 00000000 */  nop
