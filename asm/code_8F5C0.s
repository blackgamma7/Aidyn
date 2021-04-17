.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8008E9C0
/* 8F5C0 8008E9C0 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 8F5C4 8008E9C4 3C08800F */  lui        $t0, 0x800f
/* 8F5C8 8008E9C8 F7BE0070 */  sdc1       $f30, 0x70($sp)
/* 8F5CC 8008E9CC 4486F000 */  mtc1       $a2, $f30
/* 8F5D0 8008E9D0 3C09800F */  lui        $t1, 0x800f
/* 8F5D4 8008E9D4 AFBE0040 */  sw         $fp, 0x40($sp)
/* 8F5D8 8008E9D8 0080F021 */  addu       $fp, $a0, $zero
/* 8F5DC 8008E9DC AFB10024 */  sw         $s1, 0x24($sp)
/* 8F5E0 8008E9E0 AFB50034 */  sw         $s5, 0x34($sp)
/* 8F5E4 8008E9E4 30F5FFFF */  andi       $s5, $a3, 0xffff
/* 8F5E8 8008E9E8 AFBF0044 */  sw         $ra, 0x44($sp)
/* 8F5EC 8008E9EC AFB7003C */  sw         $s7, 0x3c($sp)
/* 8F5F0 8008E9F0 AFB60038 */  sw         $s6, 0x38($sp)
/* 8F5F4 8008E9F4 AFB40030 */  sw         $s4, 0x30($sp)
/* 8F5F8 8008E9F8 AFB3002C */  sw         $s3, 0x2c($sp)
/* 8F5FC 8008E9FC AFB20028 */  sw         $s2, 0x28($sp)
/* 8F600 8008EA00 AFB00020 */  sw         $s0, 0x20($sp)
/* 8F604 8008EA04 F7BC0068 */  sdc1       $f28, 0x68($sp)
/* 8F608 8008EA08 F7BA0060 */  sdc1       $f26, 0x60($sp)
/* 8F60C 8008EA0C F7B80058 */  sdc1       $f24, 0x58($sp)
/* 8F610 8008EA10 F7B60050 */  sdc1       $f22, 0x50($sp)
/* 8F614 8008EA14 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 8F618 8008EA18 16A00012 */  bnez       $s5, .L8008EA64
/* 8F61C 8008EA1C 00A08821 */   addu      $s1, $a1, $zero
/* 8F620 8008EA20 8E240000 */  lw         $a0, ($s1)
/* 8F624 8008EA24 3C01800E */  lui        $at, %hi(D_800E1970)
/* 8F628 8008EA28 C4201970 */  lwc1       $f0, %lo(D_800E1970)($at)
/* 8F62C 8008EA2C 3C01800E */  lui        $at, %hi(D_800E1974)
/* 8F630 8008EA30 C4221974 */  lwc1       $f2, %lo(D_800E1974)($at)
/* 8F634 8008EA34 AD245460 */  sw         $a0, 0x5460($t1)
/* 8F638 8008EA38 8E250004 */  lw         $a1, 4($s1)
/* 8F63C 8008EA3C 25235460 */  addiu      $v1, $t1, 0x5460
/* 8F640 8008EA40 AC650004 */  sw         $a1, 4($v1)
/* 8F644 8008EA44 8E260008 */  lw         $a2, 8($s1)
/* 8F648 8008EA48 25025450 */  addiu      $v0, $t0, 0x5450
/* 8F64C 8008EA4C AD045450 */  sw         $a0, 0x5450($t0)
/* 8F650 8008EA50 AC450004 */  sw         $a1, 4($v0)
/* 8F654 8008EA54 E4400004 */  swc1       $f0, 4($v0)
/* 8F658 8008EA58 E4620004 */  swc1       $f2, 4($v1)
/* 8F65C 8008EA5C AC660008 */  sw         $a2, 8($v1)
/* 8F660 8008EA60 AC460008 */  sw         $a2, 8($v0)
.L8008EA64:
/* 8F664 8008EA64 03C02021 */  addu       $a0, $fp, $zero
/* 8F668 8008EA68 25165450 */  addiu      $s6, $t0, 0x5450
/* 8F66C 8008EA6C 02C02821 */  addu       $a1, $s6, $zero
/* 8F670 8008EA70 25375460 */  addiu      $s7, $t1, 0x5460
/* 8F674 8008EA74 02E03021 */  addu       $a2, $s7, $zero
/* 8F678 8008EA78 3C14800F */  lui        $s4, %hi(D_800F5470)
/* 8F67C 8008EA7C 26935470 */  addiu      $s3, $s4, %lo(D_800F5470)
/* 8F680 8008EA80 3C10800F */  lui        $s0, %hi(D_800F5480)
/* 8F684 8008EA84 26125480 */  addiu      $s2, $s0, %lo(D_800F5480)
/* 8F688 8008EA88 4407F000 */  mfc1       $a3, $f30
/* 8F68C 8008EA8C 24020001 */  addiu      $v0, $zero, 1
/* 8F690 8008EA90 AFB30010 */  sw         $s3, 0x10($sp)
/* 8F694 8008EA94 AFB20014 */  sw         $s2, 0x14($sp)
/* 8F698 8008EA98 0C02B7DE */  jal        func_800ADF78
/* 8F69C 8008EA9C AFA20018 */   sw        $v0, 0x18($sp)
/* 8F6A0 8008EAA0 10400017 */  beqz       $v0, .L8008EB00
/* 8F6A4 8008EAA4 C6025480 */   lwc1      $f2, 0x5480($s0)
/* 8F6A8 8008EAA8 461E1082 */  mul.s      $f2, $f2, $f30
/* 8F6AC 8008EAAC C6805470 */  lwc1       $f0, 0x5470($s4)
/* 8F6B0 8008EAB0 46020000 */  add.s      $f0, $f0, $f2
/* 8F6B4 8008EAB4 E6200000 */  swc1       $f0, ($s1)
/* 8F6B8 8008EAB8 C6420004 */  lwc1       $f2, 4($s2)
/* 8F6BC 8008EABC 461E1082 */  mul.s      $f2, $f2, $f30
/* 8F6C0 8008EAC0 C6600004 */  lwc1       $f0, 4($s3)
/* 8F6C4 8008EAC4 3C01800E */  lui        $at, %hi(D_800E1978)
/* 8F6C8 8008EAC8 D4241978 */  ldc1       $f4, %lo(D_800E1978)($at)
/* 8F6CC 8008EACC 46000021 */  cvt.d.s    $f0, $f0
/* 8F6D0 8008EAD0 46240000 */  add.d      $f0, $f0, $f4
/* 8F6D4 8008EAD4 460010A1 */  cvt.d.s    $f2, $f2
/* 8F6D8 8008EAD8 46220000 */  add.d      $f0, $f0, $f2
/* 8F6DC 8008EADC 46200020 */  cvt.s.d    $f0, $f0
/* 8F6E0 8008EAE0 E6200004 */  swc1       $f0, 4($s1)
/* 8F6E4 8008EAE4 C6420008 */  lwc1       $f2, 8($s2)
/* 8F6E8 8008EAE8 461E1082 */  mul.s      $f2, $f2, $f30
/* 8F6EC 8008EAEC C6600008 */  lwc1       $f0, 8($s3)
/* 8F6F0 8008EAF0 46020000 */  add.s      $f0, $f0, $f2
/* 8F6F4 8008EAF4 24020001 */  addiu      $v0, $zero, 1
/* 8F6F8 8008EAF8 08023AF8 */  j          .L8008EBE0
/* 8F6FC 8008EAFC E6200008 */   swc1      $f0, 8($s1)
.L8008EB00:
/* 8F700 8008EB00 2EA20004 */  sltiu      $v0, $s5, 4
/* 8F704 8008EB04 10400035 */  beqz       $v0, .L8008EBDC
/* 8F708 8008EB08 3C10800E */   lui       $s0, %hi(gGlobals)
/* 8F70C 8008EB0C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8F710 8008EB10 3C0540C9 */  lui        $a1, 0x40c9
/* 8F714 8008EB14 34A50FDC */  ori        $a1, $a1, 0xfdc
/* 8F718 8008EB18 0C0273D2 */  jal        rand_float_multi
/* 8F71C 8008EB1C 02002021 */   addu      $a0, $s0, $zero
/* 8F720 8008EB20 02002021 */  addu       $a0, $s0, $zero
/* 8F724 8008EB24 3C053E80 */  lui        $a1, 0x3e80
/* 8F728 8008EB28 0C0273D2 */  jal        rand_float_multi
/* 8F72C 8008EB2C 46000506 */   mov.s     $f20, $f0
/* 8F730 8008EB30 4600A306 */  mov.s      $f12, $f20
/* 8F734 8008EB34 3C01800E */  lui        $at, %hi(D_800E1980)
/* 8F738 8008EB38 C43A1980 */  lwc1       $f26, %lo(D_800E1980)($at)
/* 8F73C 8008EB3C 0C03328C */  jal        __sinf
/* 8F740 8008EB40 46000706 */   mov.s     $f28, $f0
/* 8F744 8008EB44 461A0580 */  add.s      $f22, $f0, $f26
/* 8F748 8008EB48 3C01800E */  lui        $at, %hi(D_800E1984)
/* 8F74C 8008EB4C C4381984 */  lwc1       $f24, %lo(D_800E1984)($at)
/* 8F750 8008EB50 4618B582 */  mul.s      $f22, $f22, $f24
/* 8F754 8008EB54 00000000 */  nop
/* 8F758 8008EB58 461CB582 */  mul.s      $f22, $f22, $f28
/* 8F75C 8008EB5C 0C02FB50 */  jal        __cosf
/* 8F760 8008EB60 4600A306 */   mov.s     $f12, $f20
/* 8F764 8008EB64 461A0500 */  add.s      $f20, $f0, $f26
/* 8F768 8008EB68 4618A502 */  mul.s      $f20, $f20, $f24
/* 8F76C 8008EB6C 00000000 */  nop
/* 8F770 8008EB70 461CA502 */  mul.s      $f20, $f20, $f28
/* 8F774 8008EB74 C6200000 */  lwc1       $f0, ($s1)
/* 8F778 8008EB78 46160000 */  add.s      $f0, $f0, $f22
/* 8F77C 8008EB7C C6220008 */  lwc1       $f2, 8($s1)
/* 8F780 8008EB80 02C02021 */  addu       $a0, $s6, $zero
/* 8F784 8008EB84 46141080 */  add.s      $f2, $f2, $f20
/* 8F788 8008EB88 44050000 */  mfc1       $a1, $f0
/* 8F78C 8008EB8C 44071000 */  mfc1       $a3, $f2
/* 8F790 8008EB90 0C02AD58 */  jal        setVec3
/* 8F794 8008EB94 8C860004 */   lw        $a2, 4($a0)
/* 8F798 8008EB98 C6200000 */  lwc1       $f0, ($s1)
/* 8F79C 8008EB9C 46160000 */  add.s      $f0, $f0, $f22
/* 8F7A0 8008EBA0 C6220008 */  lwc1       $f2, 8($s1)
/* 8F7A4 8008EBA4 02E02021 */  addu       $a0, $s7, $zero
/* 8F7A8 8008EBA8 46141080 */  add.s      $f2, $f2, $f20
/* 8F7AC 8008EBAC 44050000 */  mfc1       $a1, $f0
/* 8F7B0 8008EBB0 44071000 */  mfc1       $a3, $f2
/* 8F7B4 8008EBB4 0C02AD58 */  jal        setVec3
/* 8F7B8 8008EBB8 8C860004 */   lw        $a2, 4($a0)
/* 8F7BC 8008EBBC 03C02021 */  addu       $a0, $fp, $zero
/* 8F7C0 8008EBC0 02202821 */  addu       $a1, $s1, $zero
/* 8F7C4 8008EBC4 26A70001 */  addiu      $a3, $s5, 1
/* 8F7C8 8008EBC8 4406F000 */  mfc1       $a2, $f30
/* 8F7CC 8008EBCC 0C023A70 */  jal        func_8008E9C0
/* 8F7D0 8008EBD0 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 8F7D4 8008EBD4 08023AF9 */  j          .L8008EBE4
/* 8F7D8 8008EBD8 8FBF0044 */   lw        $ra, 0x44($sp)
.L8008EBDC:
/* 8F7DC 8008EBDC 00001021 */  addu       $v0, $zero, $zero
.L8008EBE0:
/* 8F7E0 8008EBE0 8FBF0044 */  lw         $ra, 0x44($sp)
.L8008EBE4:
/* 8F7E4 8008EBE4 8FBE0040 */  lw         $fp, 0x40($sp)
/* 8F7E8 8008EBE8 8FB7003C */  lw         $s7, 0x3c($sp)
/* 8F7EC 8008EBEC 8FB60038 */  lw         $s6, 0x38($sp)
/* 8F7F0 8008EBF0 8FB50034 */  lw         $s5, 0x34($sp)
/* 8F7F4 8008EBF4 8FB40030 */  lw         $s4, 0x30($sp)
/* 8F7F8 8008EBF8 8FB3002C */  lw         $s3, 0x2c($sp)
/* 8F7FC 8008EBFC 8FB20028 */  lw         $s2, 0x28($sp)
/* 8F800 8008EC00 8FB10024 */  lw         $s1, 0x24($sp)
/* 8F804 8008EC04 8FB00020 */  lw         $s0, 0x20($sp)
/* 8F808 8008EC08 D7BE0070 */  ldc1       $f30, 0x70($sp)
/* 8F80C 8008EC0C D7BC0068 */  ldc1       $f28, 0x68($sp)
/* 8F810 8008EC10 D7BA0060 */  ldc1       $f26, 0x60($sp)
/* 8F814 8008EC14 D7B80058 */  ldc1       $f24, 0x58($sp)
/* 8F818 8008EC18 D7B60050 */  ldc1       $f22, 0x50($sp)
/* 8F81C 8008EC1C D7B40048 */  ldc1       $f20, 0x48($sp)
/* 8F820 8008EC20 03E00008 */  jr         $ra
/* 8F824 8008EC24 27BD0078 */   addiu     $sp, $sp, 0x78

glabel combatmarkers_init
/* 8F828 8008EC28 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8F82C 8008EC2C 24040230 */  addiu      $a0, $zero, 0x230
/* 8F830 8008EC30 3C05800E */  lui        $a1, %hi(D_800E1988)
/* 8F834 8008EC34 24A51988 */  addiu      $a1, $a1, %lo(D_800E1988)
/* 8F838 8008EC38 240600AC */  addiu      $a2, $zero, 0xac
/* 8F83C 8008EC3C AFBF001C */  sw         $ra, 0x1c($sp)
/* 8F840 8008EC40 AFB20018 */  sw         $s2, 0x18($sp)
/* 8F844 8008EC44 AFB10014 */  sw         $s1, 0x14($sp)
/* 8F848 8008EC48 0C025F9C */  jal        Malloc
/* 8F84C 8008EC4C AFB00010 */   sw        $s0, 0x10($sp)
/* 8F850 8008EC50 3C03800F */  lui        $v1, %hi(combat_markers_pointer)
/* 8F854 8008EC54 00008821 */  addu       $s1, $zero, $zero
/* 8F858 8008EC58 00609021 */  addu       $s2, $v1, $zero
/* 8F85C 8008EC5C 00008021 */  addu       $s0, $zero, $zero
/* 8F860 8008EC60 AC621CB8 */  sw         $v0, %lo(combat_markers_pointer)($v1)
.L8008EC64:
/* 8F864 8008EC64 0C003D38 */  jal        load_borg_5_func
/* 8F868 8008EC68 24040794 */   addiu     $a0, $zero, 0x794
/* 8F86C 8008EC6C 8E431CB8 */  lw         $v1, 0x1cb8($s2)
/* 8F870 8008EC70 26310001 */  addiu      $s1, $s1, 1
/* 8F874 8008EC74 02031821 */  addu       $v1, $s0, $v1
/* 8F878 8008EC78 2610001C */  addiu      $s0, $s0, 0x1c
/* 8F87C 8008EC7C AC620000 */  sw         $v0, ($v1)
/* 8F880 8008EC80 2E220014 */  sltiu      $v0, $s1, 0x14
/* 8F884 8008EC84 AC600010 */  sw         $zero, 0x10($v1)
/* 8F888 8008EC88 AC600014 */  sw         $zero, 0x14($v1)
/* 8F88C 8008EC8C 1440FFF5 */  bnez       $v0, .L8008EC64
/* 8F890 8008EC90 A0600018 */   sb        $zero, 0x18($v1)
/* 8F894 8008EC94 3C02800E */  lui        $v0, %hi(gGlobals)
/* 8F898 8008EC98 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 8F89C 8008EC9C 8C43016C */  lw         $v1, 0x16c($v0)
/* 8F8A0 8008ECA0 24020001 */  addiu      $v0, $zero, 1
/* 8F8A4 8008ECA4 3C04800F */  lui        $a0, 0x800f
/* 8F8A8 8008ECA8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8F8AC 8008ECAC 8FB20018 */  lw         $s2, 0x18($sp)
/* 8F8B0 8008ECB0 8FB10014 */  lw         $s1, 0x14($sp)
/* 8F8B4 8008ECB4 8FB00010 */  lw         $s0, 0x10($sp)
/* 8F8B8 8008ECB8 24630008 */  addiu      $v1, $v1, 8
/* 8F8BC 8008ECBC AC831CBC */  sw         $v1, 0x1cbc($a0)
/* 8F8C0 8008ECC0 03E00008 */  jr         $ra
/* 8F8C4 8008ECC4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combat_markers_func
/* 8F8C8 8008ECC8 27BDFF68 */  addiu      $sp, $sp, -0x98
/* 8F8CC 8008ECCC AFB50064 */  sw         $s5, 0x64($sp)
/* 8F8D0 8008ECD0 0080A821 */  addu       $s5, $a0, $zero
/* 8F8D4 8008ECD4 3C03800E */  lui        $v1, 0x800e
/* 8F8D8 8008ECD8 AFBF0074 */  sw         $ra, 0x74($sp)
/* 8F8DC 8008ECDC AFBE0070 */  sw         $fp, 0x70($sp)
/* 8F8E0 8008ECE0 AFB7006C */  sw         $s7, 0x6c($sp)
/* 8F8E4 8008ECE4 AFB60068 */  sw         $s6, 0x68($sp)
/* 8F8E8 8008ECE8 AFB40060 */  sw         $s4, 0x60($sp)
/* 8F8EC 8008ECEC AFB3005C */  sw         $s3, 0x5c($sp)
/* 8F8F0 8008ECF0 AFB20058 */  sw         $s2, 0x58($sp)
/* 8F8F4 8008ECF4 AFB10054 */  sw         $s1, 0x54($sp)
/* 8F8F8 8008ECF8 AFB00050 */  sw         $s0, 0x50($sp)
/* 8F8FC 8008ECFC F7BA0090 */  sdc1       $f26, 0x90($sp)
/* 8F900 8008ED00 F7B80088 */  sdc1       $f24, 0x88($sp)
/* 8F904 8008ED04 F7B60080 */  sdc1       $f22, 0x80($sp)
/* 8F908 8008ED08 F7B40078 */  sdc1       $f20, 0x78($sp)
/* 8F90C 8008ED0C 92A20020 */  lbu        $v0, 0x20($s5)
/* 8F910 8008ED10 246368A8 */  addiu      $v1, $v1, 0x68a8
/* 8F914 8008ED14 00021080 */  sll        $v0, $v0, 2
/* 8F918 8008ED18 00621821 */  addu       $v1, $v1, $v0
/* 8F91C 8008ED1C 0C01A10F */  jal        set_combat_movement
/* 8F920 8008ED20 8C7713FC */   lw        $s7, 0x13fc($v1)
/* 8F924 8008ED24 92A20021 */  lbu        $v0, 0x21($s5)
/* 8F928 8008ED28 44820000 */  mtc1       $v0, $f0
/* 8F92C 8008ED2C 46800020 */  cvt.s.w    $f0, $f0
/* 8F930 8008ED30 C6E20034 */  lwc1       $f2, 0x34($s7)
/* 8F934 8008ED34 8EA20044 */  lw         $v0, 0x44($s5)
/* 8F938 8008ED38 10400002 */  beqz       $v0, .L8008ED44
/* 8F93C 8008ED3C 46020580 */   add.s     $f22, $f0, $f2
/* 8F940 8008ED40 4602B580 */  add.s      $f22, $f22, $f2
.L8008ED44:
/* 8F944 8008ED44 0C023BE3 */  jal        func_8008EF8C
/* 8F948 8008ED48 4600B306 */   mov.s     $f12, $f22
/* 8F94C 8008ED4C 00008821 */  addu       $s1, $zero, $zero
/* 8F950 8008ED50 3C14800F */  lui        $s4, 0x800f
/* 8F954 8008ED54 00408021 */  addu       $s0, $v0, $zero
/* 8F958 8008ED58 44900000 */  mtc1       $s0, $f0
/* 8F95C 8008ED5C 46800020 */  cvt.s.w    $f0, $f0
/* 8F960 8008ED60 3C01800E */  lui        $at, %hi(D_800E19A0)
/* 8F964 8008ED64 C43419A0 */  lwc1       $f20, %lo(D_800E19A0)($at)
/* 8F968 8008ED68 3C01800E */  lui        $at, %hi(D_800E19A4)
/* 8F96C 8008ED6C C42219A4 */  lwc1       $f2, %lo(D_800E19A4)($at)
/* 8F970 8008ED70 4600A503 */  div.s      $f20, $f20, $f0
/* 8F974 8008ED74 4602A502 */  mul.s      $f20, $f20, $f2
/* 8F978 8008ED78 26961CB0 */  addiu      $s6, $s4, 0x1cb0
/* 8F97C 8008ED7C 3C1E800F */  lui        $fp, 0x800f
/* 8F980 8008ED80 03C09821 */  addu       $s3, $fp, $zero
/* 8F984 8008ED84 00009021 */  addu       $s2, $zero, $zero
/* 8F988 8008ED88 0C02FB50 */  jal        __cosf
/* 8F98C 8008ED8C 4600A306 */   mov.s     $f12, $f20
/* 8F990 8008ED90 4600A306 */  mov.s      $f12, $f20
/* 8F994 8008ED94 0C03328C */  jal        __sinf
/* 8F998 8008ED98 46000686 */   mov.s     $f26, $f0
/* 8F99C 8008ED9C 46000606 */  mov.s      $f24, $f0
.L8008EDA0:
/* 8F9A0 8008EDA0 0230102A */  slt        $v0, $s1, $s0
/* 8F9A4 8008EDA4 10400037 */  beqz       $v0, .L8008EE84
/* 8F9A8 8008EDA8 8FC21CB8 */   lw        $v0, 0x1cb8($fp)
/* 8F9AC 8008EDAC 0C01A064 */  jal        get_combatEnt_z_f
/* 8F9B0 8008EDB0 02A02021 */   addu      $a0, $s5, $zero
/* 8F9B4 8008EDB4 C6821CB0 */  lwc1       $f2, 0x1cb0($s4)
/* 8F9B8 8008EDB8 46161082 */  mul.s      $f2, $f2, $f22
/* 8F9BC 8008EDBC 02A02021 */  addu       $a0, $s5, $zero
/* 8F9C0 8008EDC0 0C01A066 */  jal        get_combatEnt_f3_f
/* 8F9C4 8008EDC4 46020500 */   add.s     $f20, $f0, $f2
/* 8F9C8 8008EDC8 C6C20004 */  lwc1       $f2, 4($s6)
/* 8F9CC 8008EDCC 46161082 */  mul.s      $f2, $f2, $f22
/* 8F9D0 8008EDD0 27A50010 */  addiu      $a1, $sp, 0x10
/* 8F9D4 8008EDD4 3C02800F */  lui        $v0, %hi(D_800F1CBC)
/* 8F9D8 8008EDD8 8C441CBC */  lw         $a0, %lo(D_800F1CBC)($v0)
/* 8F9DC 8008EDDC 3C063F00 */  lui        $a2, 0x3f00
/* 8F9E0 8008EDE0 46020000 */  add.s      $f0, $f0, $f2
/* 8F9E4 8008EDE4 00003821 */  addu       $a3, $zero, $zero
/* 8F9E8 8008EDE8 E7B40010 */  swc1       $f20, 0x10($sp)
/* 8F9EC 8008EDEC 0C023A70 */  jal        func_8008E9C0
/* 8F9F0 8008EDF0 E7A00018 */   swc1      $f0, 0x18($sp)
/* 8F9F4 8008EDF4 1040000A */  beqz       $v0, .L8008EE20
/* 8F9F8 8008EDF8 8FA50010 */   lw        $a1, 0x10($sp)
/* 8F9FC 8008EDFC 8FA60014 */  lw         $a2, 0x14($sp)
/* 8FA00 8008EE00 8E641CB8 */  lw         $a0, 0x1cb8($s3)
/* 8FA04 8008EE04 8FA70018 */  lw         $a3, 0x18($sp)
/* 8FA08 8008EE08 00922021 */  addu       $a0, $a0, $s2
/* 8FA0C 8008EE0C 0C02AD58 */  jal        setVec3
/* 8FA10 8008EE10 24840004 */   addiu     $a0, $a0, 4
/* 8FA14 8008EE14 8E631CB8 */  lw         $v1, 0x1cb8($s3)
/* 8FA18 8008EE18 08023B90 */  j          .L8008EE40
/* 8FA1C 8008EE1C 24020001 */   addiu     $v0, $zero, 1
.L8008EE20:
/* 8FA20 8008EE20 8EE6006C */  lw         $a2, 0x6c($s7)
/* 8FA24 8008EE24 8E641CB8 */  lw         $a0, 0x1cb8($s3)
/* 8FA28 8008EE28 8FA70018 */  lw         $a3, 0x18($sp)
/* 8FA2C 8008EE2C 00922021 */  addu       $a0, $a0, $s2
/* 8FA30 8008EE30 0C02AD58 */  jal        setVec3
/* 8FA34 8008EE34 24840004 */   addiu     $a0, $a0, 4
/* 8FA38 8008EE38 8E631CB8 */  lw         $v1, 0x1cb8($s3)
/* 8FA3C 8008EE3C 24020080 */  addiu      $v0, $zero, 0x80
.L8008EE40:
/* 8FA40 8008EE40 02431821 */  addu       $v1, $s2, $v1
/* 8FA44 8008EE44 AC600010 */  sw         $zero, 0x10($v1)
/* 8FA48 8008EE48 AC600014 */  sw         $zero, 0x14($v1)
/* 8FA4C 8008EE4C A0620018 */  sb         $v0, 0x18($v1)
/* 8FA50 8008EE50 C6941CB0 */  lwc1       $f20, 0x1cb0($s4)
/* 8FA54 8008EE54 4614D102 */  mul.s      $f4, $f26, $f20
/* 8FA58 8008EE58 C6C00004 */  lwc1       $f0, 4($s6)
/* 8FA5C 8008EE5C 4600C182 */  mul.s      $f6, $f24, $f0
/* 8FA60 8008EE60 00000000 */  nop
/* 8FA64 8008EE64 4600D002 */  mul.s      $f0, $f26, $f0
/* 8FA68 8008EE68 00000000 */  nop
/* 8FA6C 8008EE6C 4614C082 */  mul.s      $f2, $f24, $f20
/* 8FA70 8008EE70 46062101 */  sub.s      $f4, $f4, $f6
/* 8FA74 8008EE74 46020000 */  add.s      $f0, $f0, $f2
/* 8FA78 8008EE78 E6841CB0 */  swc1       $f4, 0x1cb0($s4)
/* 8FA7C 8008EE7C 08023BA3 */  j          .L8008EE8C
/* 8FA80 8008EE80 E6C00004 */   swc1      $f0, 4($s6)
.L8008EE84:
/* 8FA84 8008EE84 02421021 */  addu       $v0, $s2, $v0
/* 8FA88 8008EE88 A0400018 */  sb         $zero, 0x18($v0)
.L8008EE8C:
/* 8FA8C 8008EE8C 26310001 */  addiu      $s1, $s1, 1
/* 8FA90 8008EE90 2A220014 */  slti       $v0, $s1, 0x14
/* 8FA94 8008EE94 1440FFC2 */  bnez       $v0, .L8008EDA0
/* 8FA98 8008EE98 2652001C */   addiu     $s2, $s2, 0x1c
/* 8FA9C 8008EE9C 1A00002B */  blez       $s0, .L8008EF4C
/* 8FAA0 8008EEA0 00008821 */   addu      $s1, $zero, $zero
/* 8FAA4 8008EEA4 3C0B800F */  lui        $t3, 0x800f
/* 8FAA8 8008EEA8 240A0080 */  addiu      $t2, $zero, 0x80
/* 8FAAC 8008EEAC 2608FFFF */  addiu      $t0, $s0, -1
/* 8FAB0 8008EEB0 3C01800E */  lui        $at, %hi(D_800E19A8)
/* 8FAB4 8008EEB4 C42419A8 */  lwc1       $f4, %lo(D_800E19A8)($at)
/* 8FAB8 8008EEB8 24090001 */  addiu      $t1, $zero, 1
/* 8FABC 8008EEBC 001110C0 */  sll        $v0, $s1, 3
.L8008EEC0:
/* 8FAC0 8008EEC0 00511023 */  subu       $v0, $v0, $s1
/* 8FAC4 8008EEC4 8D651CB8 */  lw         $a1, 0x1cb8($t3)
/* 8FAC8 8008EEC8 00021080 */  sll        $v0, $v0, 2
/* 8FACC 8008EECC 00453821 */  addu       $a3, $v0, $a1
/* 8FAD0 8008EED0 90E30018 */  lbu        $v1, 0x18($a3)
/* 8FAD4 8008EED4 146A0019 */  bne        $v1, $t2, .L8008EF3C
/* 8FAD8 8008EED8 26260001 */   addiu     $a2, $s1, 1
/* 8FADC 8008EEDC 01111021 */  addu       $v0, $t0, $s1
/* 8FAE0 8008EEE0 0050001A */  div        $zero, $v0, $s0
/* 8FAE4 8008EEE4 00001810 */  mfhi       $v1
/* 8FAE8 8008EEE8 52000001 */  beql       $s0, $zero, .L8008EEF0
/* 8FAEC 8008EEEC 000001CD */   break     0, 7
.L8008EEF0:
/* 8FAF0 8008EEF0 00D0001A */   div       $zero, $a2, $s0
/* 8FAF4 8008EEF4 000310C0 */  sll        $v0, $v1, 3
/* 8FAF8 8008EEF8 00431023 */  subu       $v0, $v0, $v1
/* 8FAFC 8008EEFC 00021080 */  sll        $v0, $v0, 2
/* 8FB00 8008EF00 00451021 */  addu       $v0, $v0, $a1
/* 8FB04 8008EF04 C4420008 */  lwc1       $f2, 8($v0)
/* 8FB08 8008EF08 00002010 */  mfhi       $a0
/* 8FB0C 8008EF0C 52000001 */  beql       $s0, $zero, .L8008EF14
/* 8FB10 8008EF10 000001CD */   break     0, 7
.L8008EF14:
/* 8FB14 8008EF14 000410C0 */   sll       $v0, $a0, 3
/* 8FB18 8008EF18 00441023 */  subu       $v0, $v0, $a0
/* 8FB1C 8008EF1C 00021080 */  sll        $v0, $v0, 2
/* 8FB20 8008EF20 00451021 */  addu       $v0, $v0, $a1
/* 8FB24 8008EF24 C4400008 */  lwc1       $f0, 8($v0)
/* 8FB28 8008EF28 46020001 */  sub.s      $f0, $f0, $f2
/* 8FB2C 8008EF2C 46040002 */  mul.s      $f0, $f0, $f4
/* 8FB30 8008EF30 46001080 */  add.s      $f2, $f2, $f0
/* 8FB34 8008EF34 A0E90018 */  sb         $t1, 0x18($a3)
/* 8FB38 8008EF38 E4E20008 */  swc1       $f2, 8($a3)
.L8008EF3C:
/* 8FB3C 8008EF3C 00C08821 */  addu       $s1, $a2, $zero
/* 8FB40 8008EF40 0230102A */  slt        $v0, $s1, $s0
/* 8FB44 8008EF44 1440FFDE */  bnez       $v0, .L8008EEC0
/* 8FB48 8008EF48 001110C0 */   sll       $v0, $s1, 3
.L8008EF4C:
/* 8FB4C 8008EF4C 8FBF0074 */  lw         $ra, 0x74($sp)
/* 8FB50 8008EF50 8FBE0070 */  lw         $fp, 0x70($sp)
/* 8FB54 8008EF54 8FB7006C */  lw         $s7, 0x6c($sp)
/* 8FB58 8008EF58 8FB60068 */  lw         $s6, 0x68($sp)
/* 8FB5C 8008EF5C 8FB50064 */  lw         $s5, 0x64($sp)
/* 8FB60 8008EF60 8FB40060 */  lw         $s4, 0x60($sp)
/* 8FB64 8008EF64 8FB3005C */  lw         $s3, 0x5c($sp)
/* 8FB68 8008EF68 8FB20058 */  lw         $s2, 0x58($sp)
/* 8FB6C 8008EF6C 8FB10054 */  lw         $s1, 0x54($sp)
/* 8FB70 8008EF70 8FB00050 */  lw         $s0, 0x50($sp)
/* 8FB74 8008EF74 D7BA0090 */  ldc1       $f26, 0x90($sp)
/* 8FB78 8008EF78 D7B80088 */  ldc1       $f24, 0x88($sp)
/* 8FB7C 8008EF7C D7B60080 */  ldc1       $f22, 0x80($sp)
/* 8FB80 8008EF80 D7B40078 */  ldc1       $f20, 0x78($sp)
/* 8FB84 8008EF84 03E00008 */  jr         $ra
/* 8FB88 8008EF88 27BD0098 */   addiu     $sp, $sp, 0x98

glabel func_8008EF8C
/* 8FB8C 8008EF8C 3C01800E */  lui        $at, %hi(D_800E19AC)
/* 8FB90 8008EF90 C42019AC */  lwc1       $f0, %lo(D_800E19AC)($at)
/* 8FB94 8008EF94 4600603E */  c.le.s     $f12, $f0
/* 8FB98 8008EF98 00000000 */  nop
/* 8FB9C 8008EF9C 45010008 */  bc1t       .L8008EFC0
/* 8FBA0 8008EFA0 24020006 */   addiu     $v0, $zero, 6
/* 8FBA4 8008EFA4 3C01800E */  lui        $at, %hi(D_800E19B0)
/* 8FBA8 8008EFA8 C42019B0 */  lwc1       $f0, %lo(D_800E19B0)($at)
/* 8FBAC 8008EFAC 4600603E */  c.le.s     $f12, $f0
/* 8FBB0 8008EFB0 00000000 */  nop
/* 8FBB4 8008EFB4 45000002 */  bc1f       .L8008EFC0
/* 8FBB8 8008EFB8 24020014 */   addiu     $v0, $zero, 0x14
/* 8FBBC 8008EFBC 24020010 */  addiu      $v0, $zero, 0x10
.L8008EFC0:
/* 8FBC0 8008EFC0 03E00008 */  jr         $ra
/* 8FBC4 8008EFC4 00000000 */   nop

glabel func_8008EFC8
/* 8FBC8 8008EFC8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8FBCC 8008EFCC AFB10014 */  sw         $s1, 0x14($sp)
/* 8FBD0 8008EFD0 00808821 */  addu       $s1, $a0, $zero
/* 8FBD4 8008EFD4 AFB40020 */  sw         $s4, 0x20($sp)
/* 8FBD8 8008EFD8 30B4FFFF */  andi       $s4, $a1, 0xffff
/* 8FBDC 8008EFDC AFB20018 */  sw         $s2, 0x18($sp)
/* 8FBE0 8008EFE0 00009021 */  addu       $s2, $zero, $zero
/* 8FBE4 8008EFE4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8FBE8 8008EFE8 3C13800F */  lui        $s3, %hi(combat_markers_pointer)
/* 8FBEC 8008EFEC AFB00010 */  sw         $s0, 0x10($sp)
/* 8FBF0 8008EFF0 00008021 */  addu       $s0, $zero, $zero
/* 8FBF4 8008EFF4 AFBF0024 */  sw         $ra, 0x24($sp)
.L8008EFF8:
/* 8FBF8 8008EFF8 8E621CB8 */  lw         $v0, %lo(combat_markers_pointer)($s3)
/* 8FBFC 8008EFFC 02022021 */  addu       $a0, $s0, $v0
/* 8FC00 8008F000 90830018 */  lbu        $v1, 0x18($a0)
/* 8FC04 8008F004 50600009 */  beql       $v1, $zero, .L8008F02C
/* 8FC08 8008F008 26520001 */   addiu     $s2, $s2, 1
/* 8FC0C 8008F00C 0C023C17 */  jal        func_8008F05C
/* 8FC10 8008F010 02802821 */   addu      $a1, $s4, $zero
/* 8FC14 8008F014 8E651CB8 */  lw         $a1, 0x1cb8($s3)
/* 8FC18 8008F018 02202021 */  addu       $a0, $s1, $zero
/* 8FC1C 8008F01C 0C023C29 */  jal        func_8008F0A4
/* 8FC20 8008F020 00B02821 */   addu      $a1, $a1, $s0
/* 8FC24 8008F024 00408821 */  addu       $s1, $v0, $zero
/* 8FC28 8008F028 26520001 */  addiu      $s2, $s2, 1
.L8008F02C:
/* 8FC2C 8008F02C 2E420014 */  sltiu      $v0, $s2, 0x14
/* 8FC30 8008F030 1440FFF1 */  bnez       $v0, .L8008EFF8
/* 8FC34 8008F034 2610001C */   addiu     $s0, $s0, 0x1c
/* 8FC38 8008F038 02201021 */  addu       $v0, $s1, $zero
/* 8FC3C 8008F03C 8FBF0024 */  lw         $ra, 0x24($sp)
/* 8FC40 8008F040 8FB40020 */  lw         $s4, 0x20($sp)
/* 8FC44 8008F044 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8FC48 8008F048 8FB20018 */  lw         $s2, 0x18($sp)
/* 8FC4C 8008F04C 8FB10014 */  lw         $s1, 0x14($sp)
/* 8FC50 8008F050 8FB00010 */  lw         $s0, 0x10($sp)
/* 8FC54 8008F054 03E00008 */  jr         $ra
/* 8FC58 8008F058 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008F05C
/* 8FC5C 8008F05C C4800010 */  lwc1       $f0, 0x10($a0)
/* 8FC60 8008F060 3C01800E */  lui        $at, %hi(D_800E19B4)
/* 8FC64 8008F064 C42219B4 */  lwc1       $f2, %lo(D_800E19B4)($at)
/* 8FC68 8008F068 4602003C */  c.lt.s     $f0, $f2
/* 8FC6C 8008F06C 00000000 */  nop
/* 8FC70 8008F070 4500000A */  bc1f       .L8008F09C
/* 8FC74 8008F074 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 8FC78 8008F078 8C820014 */  lw         $v0, 0x14($a0)
/* 8FC7C 8008F07C E4820010 */  swc1       $f2, 0x10($a0)
/* 8FC80 8008F080 00451021 */  addu       $v0, $v0, $a1
/* 8FC84 8008F084 00403021 */  addu       $a2, $v0, $zero
/* 8FC88 8008F088 2CC3003D */  sltiu      $v1, $a2, 0x3d
/* 8FC8C 8008F08C 14600002 */  bnez       $v1, .L8008F098
/* 8FC90 8008F090 AC820014 */   sw        $v0, 0x14($a0)
/* 8FC94 8008F094 2406003C */  addiu      $a2, $zero, 0x3c
.L8008F098:
/* 8FC98 8008F098 AC860014 */  sw         $a2, 0x14($a0)
.L8008F09C:
/* 8FC9C 8008F09C 03E00008 */  jr         $ra
/* 8FCA0 8008F0A0 00000000 */   nop

glabel func_8008F0A4
/* 8FCA4 8008F0A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8FCA8 8008F0A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 8FCAC 8008F0AC 00808821 */  addu       $s1, $a0, $zero
/* 8FCB0 8008F0B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 8FCB4 8008F0B4 00A08021 */  addu       $s0, $a1, $zero
/* 8FCB8 8008F0B8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8FCBC 8008F0BC 8E040000 */  lw         $a0, ($s0)
/* 8FCC0 8008F0C0 8E050004 */  lw         $a1, 4($s0)
/* 8FCC4 8008F0C4 8E060008 */  lw         $a2, 8($s0)
/* 8FCC8 8008F0C8 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 8FCCC 8008F0CC 8E07000C */   lw        $a3, 0xc($s0)
/* 8FCD0 8008F0D0 C6020010 */  lwc1       $f2, 0x10($s0)
/* 8FCD4 8008F0D4 3C01800E */  lui        $at, %hi(D_800E19B8)
/* 8FCD8 8008F0D8 C42019B8 */  lwc1       $f0, %lo(D_800E19B8)($at)
/* 8FCDC 8008F0DC 46001002 */  mul.s      $f0, $f2, $f0
/* 8FCE0 8008F0E0 3C01800E */  lui        $at, %hi(D_800E19BC)
/* 8FCE4 8008F0E4 C42219BC */  lwc1       $f2, %lo(D_800E19BC)($at)
/* 8FCE8 8008F0E8 4600103E */  c.le.s     $f2, $f0
/* 8FCEC 8008F0EC 00000000 */  nop
/* 8FCF0 8008F0F0 45030005 */  bc1tl      .L8008F108
/* 8FCF4 8008F0F4 46020001 */   sub.s     $f0, $f0, $f2
/* 8FCF8 8008F0F8 4600008D */  trunc.w.s  $f2, $f0
/* 8FCFC 8008F0FC 44051000 */  mfc1       $a1, $f2
/* 8FD00 8008F100 08023C47 */  j          .L8008F11C
/* 8FD04 8008F104 30A500FF */   andi      $a1, $a1, 0xff
.L8008F108:
/* 8FD08 8008F108 4600008D */  trunc.w.s  $f2, $f0
/* 8FD0C 8008F10C 44051000 */  mfc1       $a1, $f2
/* 8FD10 8008F110 3C028000 */  lui        $v0, 0x8000
/* 8FD14 8008F114 00A22825 */  or         $a1, $a1, $v0
/* 8FD18 8008F118 30A500FF */  andi       $a1, $a1, 0xff
.L8008F11C:
/* 8FD1C 8008F11C 24060001 */  addiu      $a2, $zero, 1
/* 8FD20 8008F120 8E040000 */  lw         $a0, ($s0)
/* 8FD24 8008F124 0C003D48 */  jal        set_anidat_colors
/* 8FD28 8008F128 00003821 */   addu      $a3, $zero, $zero
/* 8FD2C 8008F12C 8E050000 */  lw         $a1, ($s0)
/* 8FD30 8008F130 0C028369 */  jal        func_800A0DA4
/* 8FD34 8008F134 02202021 */   addu      $a0, $s1, $zero
/* 8FD38 8008F138 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8FD3C 8008F13C 8FB10014 */  lw         $s1, 0x14($sp)
/* 8FD40 8008F140 8FB00010 */  lw         $s0, 0x10($sp)
/* 8FD44 8008F144 03E00008 */  jr         $ra
/* 8FD48 8008F148 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combatmarkers_free
/* 8FD4C 8008F14C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8FD50 8008F150 AFB10014 */  sw         $s1, 0x14($sp)
/* 8FD54 8008F154 00008821 */  addu       $s1, $zero, $zero
/* 8FD58 8008F158 AFB40020 */  sw         $s4, 0x20($sp)
/* 8FD5C 8008F15C 3C14800E */  lui        $s4, 0x800e
/* 8FD60 8008F160 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8FD64 8008F164 3C13800F */  lui        $s3, 0x800f
/* 8FD68 8008F168 AFB20018 */  sw         $s2, 0x18($sp)
/* 8FD6C 8008F16C 02609021 */  addu       $s2, $s3, $zero
/* 8FD70 8008F170 AFB00010 */  sw         $s0, 0x10($sp)
/* 8FD74 8008F174 00008021 */  addu       $s0, $zero, $zero
/* 8FD78 8008F178 AFBF0024 */  sw         $ra, 0x24($sp)
.L8008F17C:
/* 8FD7C 8008F17C 26847ECC */  addiu      $a0, $s4, 0x7ecc
/* 8FD80 8008F180 24060001 */  addiu      $a2, $zero, 1
/* 8FD84 8008F184 8E451CB8 */  lw         $a1, 0x1cb8($s2)
/* 8FD88 8008F188 00003821 */  addu       $a3, $zero, $zero
/* 8FD8C 8008F18C 0C035867 */  jal        AllocFreeQueueItem
/* 8FD90 8008F190 00B02821 */   addu      $a1, $a1, $s0
/* 8FD94 8008F194 26310001 */  addiu      $s1, $s1, 1
/* 8FD98 8008F198 8E431CB8 */  lw         $v1, 0x1cb8($s2)
/* 8FD9C 8008F19C 2E220014 */  sltiu      $v0, $s1, 0x14
/* 8FDA0 8008F1A0 02031821 */  addu       $v1, $s0, $v1
/* 8FDA4 8008F1A4 2610001C */  addiu      $s0, $s0, 0x1c
/* 8FDA8 8008F1A8 1440FFF4 */  bnez       $v0, .L8008F17C
/* 8FDAC 8008F1AC AC600000 */   sw        $zero, ($v1)
/* 8FDB0 8008F1B0 00002821 */  addu       $a1, $zero, $zero
/* 8FDB4 8008F1B4 8E641CB8 */  lw         $a0, 0x1cb8($s3)
/* 8FDB8 8008F1B8 0C026380 */  jal        Calloc
/* 8FDBC 8008F1BC 24060230 */   addiu     $a2, $zero, 0x230
/* 8FDC0 8008F1C0 3C05800E */  lui        $a1, %hi(D_800E1988)
/* 8FDC4 8008F1C4 24A51988 */  addiu      $a1, $a1, %lo(D_800E1988)
/* 8FDC8 8008F1C8 8E641CB8 */  lw         $a0, 0x1cb8($s3)
/* 8FDCC 8008F1CC 0C02600C */  jal        Free
/* 8FDD0 8008F1D0 2406018A */   addiu     $a2, $zero, 0x18a
/* 8FDD4 8008F1D4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 8FDD8 8008F1D8 8FB40020 */  lw         $s4, 0x20($sp)
/* 8FDDC 8008F1DC AE601CB8 */  sw         $zero, 0x1cb8($s3)
/* 8FDE0 8008F1E0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8FDE4 8008F1E4 8FB20018 */  lw         $s2, 0x18($sp)
/* 8FDE8 8008F1E8 8FB10014 */  lw         $s1, 0x14($sp)
/* 8FDEC 8008F1EC 8FB00010 */  lw         $s0, 0x10($sp)
/* 8FDF0 8008F1F0 03E00008 */  jr         $ra
/* 8FDF4 8008F1F4 27BD0028 */   addiu     $sp, $sp, 0x28
/* 8FDF8 8008F1F8 00000000 */  nop
/* 8FDFC 8008F1FC 00000000 */  nop
