.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8000C9E0
/* D5E0 8000C9E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D5E4 8000C9E4 AFBF0014 */  sw         $ra, 0x14($sp)
/* D5E8 8000C9E8 AFB00010 */  sw         $s0, 0x10($sp)
/* D5EC 8000C9EC F7B40018 */  sdc1       $f20, 0x18($sp)
/* D5F0 8000C9F0 0C026098 */  jal        get_obj_free
/* D5F4 8000C9F4 00000000 */   nop
/* D5F8 8000C9F8 0C02608F */  jal        get_MemFree
/* D5FC 8000C9FC 3050FFFF */   andi      $s0, $v0, 0xffff
/* D600 8000CA00 44821000 */  mtc1       $v0, $f2
/* D604 8000CA04 468010A1 */  cvt.d.w    $f2, $f2
/* D608 8000CA08 04410004 */  bgez       $v0, .L8000CA1C
/* D60C 8000CA0C 00000000 */   nop
/* D610 8000CA10 3C01800E */  lui        $at, %hi(D_800D82A0)
/* D614 8000CA14 D42082A0 */  ldc1       $f0, %lo(D_800D82A0)($at)
/* D618 8000CA18 46201080 */  add.d      $f2, $f2, $f0
.L8000CA1C:
/* D61C 8000CA1C 0C02609B */  jal        get_memFree_2
/* D620 8000CA20 46201520 */   cvt.s.d   $f20, $f2
/* D624 8000CA24 44821000 */  mtc1       $v0, $f2
/* D628 8000CA28 468010A1 */  cvt.d.w    $f2, $f2
/* D62C 8000CA2C 04410004 */  bgez       $v0, .L8000CA40
/* D630 8000CA30 3C04800F */   lui       $a0, %hi(D_800E8DBE)
/* D634 8000CA34 3C01800E */  lui        $at, %hi(D_800D82A8)
/* D638 8000CA38 D42082A8 */  ldc1       $f0, %lo(D_800D82A8)($at)
/* D63C 8000CA3C 46201080 */  add.d      $f2, $f2, $f0
.L8000CA40:
/* D640 8000CA40 94828DBE */  lhu        $v0, %lo(D_800E8DBE)($a0)
/* D644 8000CA44 10400003 */  beqz       $v0, .L8000CA54
/* D648 8000CA48 462010A0 */   cvt.s.d   $f2, $f2
/* D64C 8000CA4C 2442FFFF */  addiu      $v0, $v0, -1
/* D650 8000CA50 A4828DBE */  sh         $v0, -0x7242($a0)
.L8000CA54:
/* D654 8000CA54 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* D658 8000CA58 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* D65C 8000CA5C 1460001D */  bnez       $v1, .L8000CAD4
/* D660 8000CA60 00001021 */   addu      $v0, $zero, $zero
/* D664 8000CA64 94828DBE */  lhu        $v0, -0x7242($a0)
/* D668 8000CA68 1440001A */  bnez       $v0, .L8000CAD4
/* D66C 8000CA6C 00001021 */   addu      $v0, $zero, $zero
/* D670 8000CA70 2E020029 */  sltiu      $v0, $s0, 0x29
/* D674 8000CA74 54400017 */  bnel       $v0, $zero, .L8000CAD4
/* D678 8000CA78 00001021 */   addu      $v0, $zero, $zero
/* D67C 8000CA7C 3C01800E */  lui        $at, %hi(D_800D82B0)
/* D680 8000CA80 C42082B0 */  lwc1       $f0, %lo(D_800D82B0)($at)
/* D684 8000CA84 4614003C */  c.lt.s     $f0, $f20
/* D688 8000CA88 00000000 */  nop
/* D68C 8000CA8C 45020011 */  bc1fl      .L8000CAD4
/* D690 8000CA90 00001021 */   addu      $v0, $zero, $zero
/* D694 8000CA94 3C01800E */  lui        $at, %hi(D_800D82B4)
/* D698 8000CA98 C42082B4 */  lwc1       $f0, %lo(D_800D82B4)($at)
/* D69C 8000CA9C 4600103C */  c.lt.s     $f2, $f0
/* D6A0 8000CAA0 00000000 */  nop
/* D6A4 8000CAA4 4500000A */  bc1f       .L8000CAD0
/* D6A8 8000CAA8 240200B4 */   addiu     $v0, $zero, 0xb4
/* D6AC 8000CAAC 3C03800F */  lui        $v1, %hi(doubleGlobalTickerFlag)
/* D6B0 8000CAB0 A4828DBE */  sh         $v0, -0x7242($a0)
/* D6B4 8000CAB4 24020002 */  addiu      $v0, $zero, 2
/* D6B8 8000CAB8 0C025A69 */  jal        noop_800969a4
/* D6BC 8000CABC A46296D4 */   sh        $v0, %lo(doubleGlobalTickerFlag)($v1)
/* D6C0 8000CAC0 0C00630E */  jal        func_80018C38
/* D6C4 8000CAC4 00000000 */   nop
/* D6C8 8000CAC8 080032B5 */  j          .L8000CAD4
/* D6CC 8000CACC 24020001 */   addiu     $v0, $zero, 1
.L8000CAD0:
/* D6D0 8000CAD0 00001021 */  addu       $v0, $zero, $zero
.L8000CAD4:
/* D6D4 8000CAD4 8FBF0014 */  lw         $ra, 0x14($sp)
/* D6D8 8000CAD8 8FB00010 */  lw         $s0, 0x10($sp)
/* D6DC 8000CADC D7B40018 */  ldc1       $f20, 0x18($sp)
/* D6E0 8000CAE0 03E00008 */  jr         $ra
/* D6E4 8000CAE4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8000CAE8
/* D6E8 8000CAE8 27BDFF08 */  addiu      $sp, $sp, -0xf8
/* D6EC 8000CAEC AFB300DC */  sw         $s3, 0xdc($sp)
/* D6F0 8000CAF0 00009821 */  addu       $s3, $zero, $zero
/* D6F4 8000CAF4 00801821 */  addu       $v1, $a0, $zero
/* D6F8 8000CAF8 00052C00 */  sll        $a1, $a1, 0x10
/* D6FC 8000CAFC 00052C03 */  sra        $a1, $a1, 0x10
/* D700 8000CB00 00063400 */  sll        $a2, $a2, 0x10
/* D704 8000CB04 F7B400F0 */  sdc1       $f20, 0xf0($sp)
/* D708 8000CB08 4480A000 */  mtc1       $zero, $f20
/* D70C 8000CB0C 00063403 */  sra        $a2, $a2, 0x10
/* D710 8000CB10 AFB200D8 */  sw         $s2, 0xd8($sp)
/* D714 8000CB14 97B2010A */  lhu        $s2, 0x10a($sp)
/* D718 8000CB18 00073C00 */  sll        $a3, $a3, 0x10
/* D71C 8000CB1C AFB400E0 */  sw         $s4, 0xe0($sp)
/* D720 8000CB20 0007A403 */  sra        $s4, $a3, 0x10
/* D724 8000CB24 AFBF00E8 */  sw         $ra, 0xe8($sp)
/* D728 8000CB28 AFB500E4 */  sw         $s5, 0xe4($sp)
/* D72C 8000CB2C AFB100D4 */  sw         $s1, 0xd4($sp)
/* D730 8000CB30 12400003 */  beqz       $s2, .L8000CB40
/* D734 8000CB34 AFB000D0 */   sw        $s0, 0xd0($sp)
/* D738 8000CB38 3C01800E */  lui        $at, %hi(D_800D82B8)
/* D73C 8000CB3C C43482B8 */  lwc1       $f20, %lo(D_800D82B8)($at)
.L8000CB40:
/* D740 8000CB40 27A40010 */  addiu      $a0, $sp, 0x10
/* D744 8000CB44 00051040 */  sll        $v0, $a1, 1
/* D748 8000CB48 00451021 */  addu       $v0, $v0, $a1
/* D74C 8000CB4C 000210C0 */  sll        $v0, $v0, 3
/* D750 8000CB50 00451021 */  addu       $v0, $v0, $a1
/* D754 8000CB54 00021080 */  sll        $v0, $v0, 2
/* D758 8000CB58 44820000 */  mtc1       $v0, $f0
/* D75C 8000CB5C 46800020 */  cvt.s.w    $f0, $f0
/* D760 8000CB60 00061040 */  sll        $v0, $a2, 1
/* D764 8000CB64 00461021 */  addu       $v0, $v0, $a2
/* D768 8000CB68 C4620000 */  lwc1       $f2, ($v1)
/* D76C 8000CB6C 000210C0 */  sll        $v0, $v0, 3
/* D770 8000CB70 46001080 */  add.s      $f2, $f2, $f0
/* D774 8000CB74 00461021 */  addu       $v0, $v0, $a2
/* D778 8000CB78 00021080 */  sll        $v0, $v0, 2
/* D77C 8000CB7C 44051000 */  mfc1       $a1, $f2
/* D780 8000CB80 C4620008 */  lwc1       $f2, 8($v1)
/* D784 8000CB84 44820000 */  mtc1       $v0, $f0
/* D788 8000CB88 46800020 */  cvt.s.w    $f0, $f0
/* D78C 8000CB8C 46001080 */  add.s      $f2, $f2, $f0
/* D790 8000CB90 00008821 */  addu       $s1, $zero, $zero
/* D794 8000CB94 8C660004 */  lw         $a2, 4($v1)
/* D798 8000CB98 44071000 */  mfc1       $a3, $f2
/* D79C 8000CB9C 0C02AD58 */  jal        setVec3
/* D7A0 8000CBA0 3C15800E */   lui       $s5, 0x800e
/* D7A4 8000CBA4 00111040 */  sll        $v0, $s1, 1
.L8000CBA8:
/* D7A8 8000CBA8 00511021 */  addu       $v0, $v0, $s1
/* D7AC 8000CBAC 00021080 */  sll        $v0, $v0, 2
/* D7B0 8000CBB0 00511023 */  subu       $v0, $v0, $s1
/* D7B4 8000CBB4 00021080 */  sll        $v0, $v0, 2
/* D7B8 8000CBB8 26A37900 */  addiu      $v1, $s5, 0x7900
/* D7BC 8000CBBC 00438021 */  addu       $s0, $v0, $v1
/* D7C0 8000CBC0 86040024 */  lh         $a0, 0x24($s0)
/* D7C4 8000CBC4 1684002F */  bne        $s4, $a0, .L8000CC84
/* D7C8 8000CBC8 26220001 */   addiu     $v0, $s1, 1
/* D7CC 8000CBCC 27A40090 */  addiu      $a0, $sp, 0x90
/* D7D0 8000CBD0 00002821 */  addu       $a1, $zero, $zero
/* D7D4 8000CBD4 0C026380 */  jal        Calloc
/* D7D8 8000CBD8 2406000C */   addiu     $a2, $zero, 0xc
/* D7DC 8000CBDC 86030020 */  lh         $v1, 0x20($s0)
/* D7E0 8000CBE0 C6020000 */  lwc1       $f2, ($s0)
/* D7E4 8000CBE4 00031040 */  sll        $v0, $v1, 1
/* D7E8 8000CBE8 00431021 */  addu       $v0, $v0, $v1
/* D7EC 8000CBEC 000210C0 */  sll        $v0, $v0, 3
/* D7F0 8000CBF0 00431021 */  addu       $v0, $v0, $v1
/* D7F4 8000CBF4 00021080 */  sll        $v0, $v0, 2
/* D7F8 8000CBF8 44820000 */  mtc1       $v0, $f0
/* D7FC 8000CBFC 46800020 */  cvt.s.w    $f0, $f0
/* D800 8000CC00 46001080 */  add.s      $f2, $f2, $f0
/* D804 8000CC04 E7A20090 */  swc1       $f2, 0x90($sp)
/* D808 8000CC08 86030022 */  lh         $v1, 0x22($s0)
/* D80C 8000CC0C C6000008 */  lwc1       $f0, 8($s0)
/* D810 8000CC10 C6020004 */  lwc1       $f2, 4($s0)
/* D814 8000CC14 00031040 */  sll        $v0, $v1, 1
/* D818 8000CC18 00431021 */  addu       $v0, $v0, $v1
/* D81C 8000CC1C 000210C0 */  sll        $v0, $v0, 3
/* D820 8000CC20 00431021 */  addu       $v0, $v0, $v1
/* D824 8000CC24 00021080 */  sll        $v0, $v0, 2
/* D828 8000CC28 44822000 */  mtc1       $v0, $f4
/* D82C 8000CC2C 46802120 */  cvt.s.w    $f4, $f4
/* D830 8000CC30 8FA20090 */  lw         $v0, 0x90($sp)
/* D834 8000CC34 46040000 */  add.s      $f0, $f0, $f4
/* D838 8000CC38 E7A20094 */  swc1       $f2, 0x94($sp)
/* D83C 8000CC3C 8FA30094 */  lw         $v1, 0x94($sp)
/* D840 8000CC40 27A40010 */  addiu      $a0, $sp, 0x10
/* D844 8000CC44 E7A00098 */  swc1       $f0, 0x98($sp)
/* D848 8000CC48 8FA60098 */  lw         $a2, 0x98($sp)
/* D84C 8000CC4C 27A50050 */  addiu      $a1, $sp, 0x50
/* D850 8000CC50 AFA20050 */  sw         $v0, 0x50($sp)
/* D854 8000CC54 AFA30054 */  sw         $v1, 0x54($sp)
/* D858 8000CC58 0C02AB66 */  jal        get_vec3_proximity
/* D85C 8000CC5C AFA60058 */   sw        $a2, 0x58($sp)
/* D860 8000CC60 4600A03C */  c.lt.s     $f20, $f0
/* D864 8000CC64 16400002 */  bnez       $s2, .L8000CC70
/* D868 8000CC68 00000000 */   nop
/* D86C 8000CC6C 4614003C */  c.lt.s     $f0, $f20
.L8000CC70:
/* D870 8000CC70 00000000 */  nop
/* D874 8000CC74 45010003 */  bc1t       .L8000CC84
/* D878 8000CC78 26220001 */   addiu     $v0, $s1, 1
/* D87C 8000CC7C 02009821 */  addu       $s3, $s0, $zero
/* D880 8000CC80 46000506 */  mov.s      $f20, $f0
.L8000CC84:
/* D884 8000CC84 3051FFFF */  andi       $s1, $v0, 0xffff
/* D888 8000CC88 2E23000F */  sltiu      $v1, $s1, 0xf
/* D88C 8000CC8C 1460FFC6 */  bnez       $v1, .L8000CBA8
/* D890 8000CC90 00111040 */   sll       $v0, $s1, 1
/* D894 8000CC94 02601021 */  addu       $v0, $s3, $zero
/* D898 8000CC98 8FBF00E8 */  lw         $ra, 0xe8($sp)
/* D89C 8000CC9C 8FB500E4 */  lw         $s5, 0xe4($sp)
/* D8A0 8000CCA0 8FB400E0 */  lw         $s4, 0xe0($sp)
/* D8A4 8000CCA4 8FB300DC */  lw         $s3, 0xdc($sp)
/* D8A8 8000CCA8 8FB200D8 */  lw         $s2, 0xd8($sp)
/* D8AC 8000CCAC 8FB100D4 */  lw         $s1, 0xd4($sp)
/* D8B0 8000CCB0 8FB000D0 */  lw         $s0, 0xd0($sp)
/* D8B4 8000CCB4 D7B400F0 */  ldc1       $f20, 0xf0($sp)
/* D8B8 8000CCB8 03E00008 */  jr         $ra
/* D8BC 8000CCBC 27BD00F8 */   addiu     $sp, $sp, 0xf8

glabel func_8000CCC0
/* D8C0 8000CCC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D8C4 8000CCC4 AFBF0014 */  sw         $ra, 0x14($sp)
/* D8C8 8000CCC8 AFB00010 */  sw         $s0, 0x10($sp)
/* D8CC 8000CCCC F7B40018 */  sdc1       $f20, 0x18($sp)
/* D8D0 8000CCD0 0C026098 */  jal        get_obj_free
/* D8D4 8000CCD4 00000000 */   nop
/* D8D8 8000CCD8 0C02608F */  jal        get_MemFree
/* D8DC 8000CCDC 3050FFFF */   andi      $s0, $v0, 0xffff
/* D8E0 8000CCE0 44821000 */  mtc1       $v0, $f2
/* D8E4 8000CCE4 468010A1 */  cvt.d.w    $f2, $f2
/* D8E8 8000CCE8 04410004 */  bgez       $v0, .L8000CCFC
/* D8EC 8000CCEC 00000000 */   nop
/* D8F0 8000CCF0 3C01800E */  lui        $at, %hi(D_800D82C0)
/* D8F4 8000CCF4 D42082C0 */  ldc1       $f0, %lo(D_800D82C0)($at)
/* D8F8 8000CCF8 46201080 */  add.d      $f2, $f2, $f0
.L8000CCFC:
/* D8FC 8000CCFC 0C02609B */  jal        get_memFree_2
/* D900 8000CD00 46201520 */   cvt.s.d   $f20, $f2
/* D904 8000CD04 44821000 */  mtc1       $v0, $f2
/* D908 8000CD08 468010A1 */  cvt.d.w    $f2, $f2
/* D90C 8000CD0C 04430005 */  bgezl      $v0, .L8000CD24
/* D910 8000CD10 46201020 */   cvt.s.d   $f0, $f2
/* D914 8000CD14 3C01800E */  lui        $at, %hi(D_800D82C8)
/* D918 8000CD18 D42082C8 */  ldc1       $f0, %lo(D_800D82C8)($at)
/* D91C 8000CD1C 46201080 */  add.d      $f2, $f2, $f0
/* D920 8000CD20 46201020 */  cvt.s.d    $f0, $f2
.L8000CD24:
/* D924 8000CD24 3C03800F */  lui        $v1, %hi(D_800E8DC4)
/* D928 8000CD28 94628DC4 */  lhu        $v0, %lo(D_800E8DC4)($v1)
/* D92C 8000CD2C 10400004 */  beqz       $v0, .L8000CD40
/* D930 8000CD30 46140003 */   div.s     $f0, $f0, $f20
/* D934 8000CD34 2442FFFF */  addiu      $v0, $v0, -1
/* D938 8000CD38 0800337A */  j          .L8000CDE8
/* D93C 8000CD3C A4628DC4 */   sh        $v0, -0x723c($v1)
.L8000CD40:
/* D940 8000CD40 3C02800F */  lui        $v0, %hi(D_800E8DC6)
/* D944 8000CD44 94438DC6 */  lhu        $v1, %lo(D_800E8DC6)($v0)
/* D948 8000CD48 10600003 */  beqz       $v1, .L8000CD58
/* D94C 8000CD4C 00403021 */   addu      $a2, $v0, $zero
/* D950 8000CD50 2462FFFF */  addiu      $v0, $v1, -1
/* D954 8000CD54 A4C28DC6 */  sh         $v0, -0x723a($a2)
.L8000CD58:
/* D958 8000CD58 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* D95C 8000CD5C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* D960 8000CD60 14600022 */  bnez       $v1, .L8000CDEC
/* D964 8000CD64 00001021 */   addu      $v0, $zero, $zero
/* D968 8000CD68 94C28DC6 */  lhu        $v0, -0x723a($a2)
/* D96C 8000CD6C 1440001F */  bnez       $v0, .L8000CDEC
/* D970 8000CD70 00001021 */   addu      $v0, $zero, $zero
/* D974 8000CD74 3C02800E */  lui        $v0, %hi(map_dat_A)
/* D978 8000CD78 84436C34 */  lh         $v1, %lo(map_dat_A)($v0)
/* D97C 8000CD7C 1460000C */  bnez       $v1, .L8000CDB0
/* D980 8000CD80 3C02800F */   lui       $v0, 0x800f
/* D984 8000CD84 2E020029 */  sltiu      $v0, $s0, 0x29
/* D988 8000CD88 14400009 */  bnez       $v0, .L8000CDB0
/* D98C 8000CD8C 3C02800F */   lui       $v0, 0x800f
/* D990 8000CD90 3C01800E */  lui        $at, %hi(D_800D82D0)
/* D994 8000CD94 D42282D0 */  ldc1       $f2, %lo(D_800D82D0)($at)
/* D998 8000CD98 46000021 */  cvt.d.s    $f0, $f0
/* D99C 8000CD9C 4622003C */  c.lt.d     $f0, $f2
/* D9A0 8000CDA0 00000000 */  nop
/* D9A4 8000CDA4 45010005 */  bc1t       .L8000CDBC
/* D9A8 8000CDA8 3C04800F */   lui       $a0, 0x800f
/* D9AC 8000CDAC 3C02800F */  lui        $v0, %hi(no_ExpPak_memcheck_flag)
.L8000CDB0:
/* D9B0 8000CDB0 94438DC0 */  lhu        $v1, %lo(no_ExpPak_memcheck_flag)($v0)
/* D9B4 8000CDB4 1060000C */  beqz       $v1, .L8000CDE8
/* D9B8 8000CDB8 00402021 */   addu      $a0, $v0, $zero
.L8000CDBC:
/* D9BC 8000CDBC 24020001 */  addiu      $v0, $zero, 1
/* D9C0 8000CDC0 3C05800F */  lui        $a1, %hi(no_TP_vec3)
/* D9C4 8000CDC4 24030001 */  addiu      $v1, $zero, 1
/* D9C8 8000CDC8 A4808DC0 */  sh         $zero, -0x7240($a0)
/* D9CC 8000CDCC 240400B4 */  addiu      $a0, $zero, 0xb4
/* D9D0 8000CDD0 A4A38DC2 */  sh         $v1, %lo(no_TP_vec3)($a1)
/* D9D4 8000CDD4 3C05800F */  lui        $a1, %hi(doubleGlobalTickerFlag)
/* D9D8 8000CDD8 24030002 */  addiu      $v1, $zero, 2
/* D9DC 8000CDDC A4C48DC6 */  sh         $a0, -0x723a($a2)
/* D9E0 8000CDE0 0800337B */  j          .L8000CDEC
/* D9E4 8000CDE4 A4A396D4 */   sh        $v1, %lo(doubleGlobalTickerFlag)($a1)
.L8000CDE8:
/* D9E8 8000CDE8 00001021 */  addu       $v0, $zero, $zero
.L8000CDEC:
/* D9EC 8000CDEC 8FBF0014 */  lw         $ra, 0x14($sp)
/* D9F0 8000CDF0 8FB00010 */  lw         $s0, 0x10($sp)
/* D9F4 8000CDF4 D7B40018 */  ldc1       $f20, 0x18($sp)
/* D9F8 8000CDF8 03E00008 */  jr         $ra
/* D9FC 8000CDFC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel NoExpPak_memCheck
/* DA00 8000CE00 27BDFF68 */  addiu      $sp, $sp, -0x98
/* DA04 8000CE04 3C05800E */  lui        $a1, %hi(D_800D82D8)
/* DA08 8000CE08 24A282D8 */  addiu      $v0, $a1, %lo(D_800D82D8)
/* DA0C 8000CE0C 3C06800E */  lui        $a2, %hi(D_800D82EC)
/* DA10 8000CE10 8CA782D8 */  lw         $a3, -0x7d28($a1)
/* DA14 8000CE14 24C382EC */  addiu      $v1, $a2, %lo(D_800D82EC)
/* DA18 8000CE18 AFBF0094 */  sw         $ra, 0x94($sp)
/* DA1C 8000CE1C AFB00090 */  sw         $s0, 0x90($sp)
/* DA20 8000CE20 8C480004 */  lw         $t0, 4($v0)
/* DA24 8000CE24 8C450008 */  lw         $a1, 8($v0)
/* DA28 8000CE28 8C49000C */  lw         $t1, 0xc($v0)
/* DA2C 8000CE2C 8C4A0010 */  lw         $t2, 0x10($v0)
/* DA30 8000CE30 8CCB82EC */  lw         $t3, -0x7d14($a2)
/* DA34 8000CE34 8C620004 */  lw         $v0, 4($v1)
/* DA38 8000CE38 8C660008 */  lw         $a2, 8($v1)
/* DA3C 8000CE3C 8C6C000C */  lw         $t4, 0xc($v1)
/* DA40 8000CE40 8C6D0010 */  lw         $t5, 0x10($v1)
/* DA44 8000CE44 AFA20054 */  sw         $v0, 0x54($sp)
/* DA48 8000CE48 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* DA4C 8000CE4C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* DA50 8000CE50 3090FFFF */  andi       $s0, $a0, 0xffff
/* DA54 8000CE54 AFA70010 */  sw         $a3, 0x10($sp)
/* DA58 8000CE58 AFA80014 */  sw         $t0, 0x14($sp)
/* DA5C 8000CE5C AFA50018 */  sw         $a1, 0x18($sp)
/* DA60 8000CE60 AFA9001C */  sw         $t1, 0x1c($sp)
/* DA64 8000CE64 AFAA0020 */  sw         $t2, 0x20($sp)
/* DA68 8000CE68 AFAB0050 */  sw         $t3, 0x50($sp)
/* DA6C 8000CE6C AFA60058 */  sw         $a2, 0x58($sp)
/* DA70 8000CE70 AFAC005C */  sw         $t4, 0x5c($sp)
/* DA74 8000CE74 14600014 */  bnez       $v1, .L8000CEC8
/* DA78 8000CE78 AFAD0060 */   sw        $t5, 0x60($sp)
/* DA7C 8000CE7C 0C02608F */  jal        get_MemFree
/* DA80 8000CE80 00108080 */   sll       $s0, $s0, 2
/* DA84 8000CE84 03B02021 */  addu       $a0, $sp, $s0
/* DA88 8000CE88 8C830010 */  lw         $v1, 0x10($a0)
/* DA8C 8000CE8C 0062182B */  sltu       $v1, $v1, $v0
/* DA90 8000CE90 1460000E */  bnez       $v1, .L8000CECC
/* DA94 8000CE94 24020001 */   addiu     $v0, $zero, 1
/* DA98 8000CE98 0C02609B */  jal        get_memFree_2
/* DA9C 8000CE9C 00000000 */   nop
/* DAA0 8000CEA0 03B02021 */  addu       $a0, $sp, $s0
/* DAA4 8000CEA4 8C830050 */  lw         $v1, 0x50($a0)
/* DAA8 8000CEA8 0062182B */  sltu       $v1, $v1, $v0
/* DAAC 8000CEAC 54600007 */  bnel       $v1, $zero, .L8000CECC
/* DAB0 8000CEB0 24020001 */   addiu     $v0, $zero, 1
/* DAB4 8000CEB4 3C03800F */  lui        $v1, %hi(no_ExpPak_memcheck_flag)
/* DAB8 8000CEB8 24020001 */  addiu      $v0, $zero, 1
/* DABC 8000CEBC A4628DC0 */  sh         $v0, %lo(no_ExpPak_memcheck_flag)($v1)
/* DAC0 8000CEC0 080033B3 */  j          .L8000CECC
/* DAC4 8000CEC4 00001021 */   addu      $v0, $zero, $zero
.L8000CEC8:
/* DAC8 8000CEC8 24020001 */  addiu      $v0, $zero, 1
.L8000CECC:
/* DACC 8000CECC 8FBF0094 */  lw         $ra, 0x94($sp)
/* DAD0 8000CED0 8FB00090 */  lw         $s0, 0x90($sp)
/* DAD4 8000CED4 03E00008 */  jr         $ra
/* DAD8 8000CED8 27BD0098 */   addiu     $sp, $sp, 0x98

glabel zoneengine_func_b
/* DADC 8000CEDC 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* DAE0 8000CEE0 24040050 */  addiu      $a0, $zero, 0x50
/* DAE4 8000CEE4 AFB10014 */  sw         $s1, 0x14($sp)
/* DAE8 8000CEE8 3C11800E */  lui        $s1, %hi(D_800D8300)
/* DAEC 8000CEEC 26318300 */  addiu      $s1, $s1, %lo(D_800D8300)
/* DAF0 8000CEF0 02202821 */  addu       $a1, $s1, $zero
/* DAF4 8000CEF4 AFBF0028 */  sw         $ra, 0x28($sp)
/* DAF8 8000CEF8 AFB50024 */  sw         $s5, 0x24($sp)
/* DAFC 8000CEFC AFB40020 */  sw         $s4, 0x20($sp)
/* DB00 8000CF00 AFB3001C */  sw         $s3, 0x1c($sp)
/* DB04 8000CF04 AFB20018 */  sw         $s2, 0x18($sp)
/* DB08 8000CF08 AFB00010 */  sw         $s0, 0x10($sp)
/* DB0C 8000CF0C F7BA0048 */  sdc1       $f26, 0x48($sp)
/* DB10 8000CF10 F7B80040 */  sdc1       $f24, 0x40($sp)
/* DB14 8000CF14 F7B60038 */  sdc1       $f22, 0x38($sp)
/* DB18 8000CF18 F7B40030 */  sdc1       $f20, 0x30($sp)
/* DB1C 8000CF1C 0C025F9C */  jal        Malloc
/* DB20 8000CF20 240601C8 */   addiu     $a2, $zero, 0x1c8
/* DB24 8000CF24 24040038 */  addiu      $a0, $zero, 0x38
/* DB28 8000CF28 02202821 */  addu       $a1, $s1, $zero
/* DB2C 8000CF2C 240601C9 */  addiu      $a2, $zero, 0x1c9
/* DB30 8000CF30 3C10800E */  lui        $s0, %hi(gGlobals)
/* DB34 8000CF34 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* DB38 8000CF38 0C025F9C */  jal        Malloc
/* DB3C 8000CF3C AE020208 */   sw        $v0, 0x208($s0)
/* DB40 8000CF40 24040138 */  addiu      $a0, $zero, 0x138
/* DB44 8000CF44 02202821 */  addu       $a1, $s1, $zero
/* DB48 8000CF48 240601CA */  addiu      $a2, $zero, 0x1ca
/* DB4C 8000CF4C 0C025F9C */  jal        Malloc
/* DB50 8000CF50 AE02020C */   sw        $v0, 0x20c($s0)
/* DB54 8000CF54 00009021 */  addu       $s2, $zero, $zero
/* DB58 8000CF58 02009821 */  addu       $s3, $s0, $zero
/* DB5C 8000CF5C 3C01800E */  lui        $at, %hi(D_800D8318)
/* DB60 8000CF60 C4348318 */  lwc1       $f20, %lo(D_800D8318)($at)
/* DB64 8000CF64 24110001 */  addiu      $s1, $zero, 1
/* DB68 8000CF68 AE020204 */  sw         $v0, 0x204($s0)
/* DB6C 8000CF6C 00002821 */  addu       $a1, $zero, $zero
.L8000CF70:
/* DB70 8000CF70 24060028 */  addiu      $a2, $zero, 0x28
/* DB74 8000CF74 00121080 */  sll        $v0, $s2, 2
/* DB78 8000CF78 00521021 */  addu       $v0, $v0, $s2
/* DB7C 8000CF7C 8E630208 */  lw         $v1, 0x208($s3)
/* DB80 8000CF80 000210C0 */  sll        $v0, $v0, 3
/* DB84 8000CF84 00628021 */  addu       $s0, $v1, $v0
/* DB88 8000CF88 0C026380 */  jal        Calloc
/* DB8C 8000CF8C 02002021 */   addu      $a0, $s0, $zero
/* DB90 8000CF90 52400005 */  beql       $s2, $zero, .L8000CFA8
/* DB94 8000CF94 AE000000 */   sw        $zero, ($s0)
/* DB98 8000CF98 12510005 */  beq        $s2, $s1, .L8000CFB0
/* DB9C 8000CF9C 26420001 */   addiu     $v0, $s2, 1
/* DBA0 8000CFA0 080033F0 */  j          .L8000CFC0
/* DBA4 8000CFA4 3052FFFF */   andi      $s2, $v0, 0xffff
.L8000CFA8:
/* DBA8 8000CFA8 080033EE */  j          .L8000CFB8
/* DBAC 8000CFAC AE000004 */   sw        $zero, 4($s0)
.L8000CFB0:
/* DBB0 8000CFB0 AE000000 */  sw         $zero, ($s0)
/* DBB4 8000CFB4 E6140004 */  swc1       $f20, 4($s0)
.L8000CFB8:
/* DBB8 8000CFB8 26420001 */  addiu      $v0, $s2, 1
/* DBBC 8000CFBC 3052FFFF */  andi       $s2, $v0, 0xffff
.L8000CFC0:
/* DBC0 8000CFC0 2E430002 */  sltiu      $v1, $s2, 2
/* DBC4 8000CFC4 1460FFEA */  bnez       $v1, .L8000CF70
/* DBC8 8000CFC8 00002821 */   addu      $a1, $zero, $zero
/* DBCC 8000CFCC 00009021 */  addu       $s2, $zero, $zero
/* DBD0 8000CFD0 3C02800E */  lui        $v0, %hi(gGlobals)
/* DBD4 8000CFD4 245368A8 */  addiu      $s3, $v0, %lo(gGlobals)
/* DBD8 8000CFD8 24110001 */  addiu      $s1, $zero, 1
/* DBDC 8000CFDC 3C01800E */  lui        $at, %hi(D_800D831C)
/* DBE0 8000CFE0 C43A831C */  lwc1       $f26, %lo(D_800D831C)($at)
/* DBE4 8000CFE4 3C01800E */  lui        $at, %hi(D_800D8320)
/* DBE8 8000CFE8 C4388320 */  lwc1       $f24, %lo(D_800D8320)($at)
/* DBEC 8000CFEC 3C01800E */  lui        $at, %hi(D_800D8324)
/* DBF0 8000CFF0 C4368324 */  lwc1       $f22, %lo(D_800D8324)($at)
/* DBF4 8000CFF4 3C01800E */  lui        $at, %hi(D_800D8328)
/* DBF8 8000CFF8 C4348328 */  lwc1       $f20, %lo(D_800D8328)($at)
.L8000CFFC:
/* DBFC 8000CFFC 2406001C */  addiu      $a2, $zero, 0x1c
/* DC00 8000D000 001210C0 */  sll        $v0, $s2, 3
/* DC04 8000D004 00521023 */  subu       $v0, $v0, $s2
/* DC08 8000D008 8E63020C */  lw         $v1, 0x20c($s3)
/* DC0C 8000D00C 00021080 */  sll        $v0, $v0, 2
/* DC10 8000D010 00628021 */  addu       $s0, $v1, $v0
/* DC14 8000D014 0C026380 */  jal        Calloc
/* DC18 8000D018 02002021 */   addu      $a0, $s0, $zero
/* DC1C 8000D01C 52400005 */  beql       $s2, $zero, .L8000D034
/* DC20 8000D020 E61A0018 */   swc1      $f26, 0x18($s0)
/* DC24 8000D024 12510005 */  beq        $s2, $s1, .L8000D03C
/* DC28 8000D028 26420001 */   addiu     $v0, $s2, 1
/* DC2C 8000D02C 08003413 */  j          .L8000D04C
/* DC30 8000D030 3052FFFF */   andi      $s2, $v0, 0xffff
.L8000D034:
/* DC34 8000D034 08003411 */  j          .L8000D044
/* DC38 8000D038 E6180004 */   swc1      $f24, 4($s0)
.L8000D03C:
/* DC3C 8000D03C E6160018 */  swc1       $f22, 0x18($s0)
/* DC40 8000D040 E6140004 */  swc1       $f20, 4($s0)
.L8000D044:
/* DC44 8000D044 26420001 */  addiu      $v0, $s2, 1
/* DC48 8000D048 3052FFFF */  andi       $s2, $v0, 0xffff
.L8000D04C:
/* DC4C 8000D04C 2E430002 */  sltiu      $v1, $s2, 2
/* DC50 8000D050 1460FFEA */  bnez       $v1, .L8000CFFC
/* DC54 8000D054 00002821 */   addu      $a1, $zero, $zero
/* DC58 8000D058 00009021 */  addu       $s2, $zero, $zero
/* DC5C 8000D05C 3C02800E */  lui        $v0, %hi(gGlobals)
/* DC60 8000D060 245368A8 */  addiu      $s3, $v0, %lo(gGlobals)
/* DC64 8000D064 3C03800F */  lui        $v1, %hi(D_800E8DCC)
/* DC68 8000D068 24748DCC */  addiu      $s4, $v1, %lo(D_800E8DCC)
/* DC6C 8000D06C 26950001 */  addiu      $s5, $s4, 1
.L8000D070:
/* DC70 8000D070 00002821 */  addu       $a1, $zero, $zero
/* DC74 8000D074 2406000C */  addiu      $a2, $zero, 0xc
/* DC78 8000D078 00128040 */  sll        $s0, $s2, 1
/* DC7C 8000D07C 02121021 */  addu       $v0, $s0, $s2
/* DC80 8000D080 8E710204 */  lw         $s1, 0x204($s3)
/* DC84 8000D084 00021080 */  sll        $v0, $v0, 2
/* DC88 8000D088 02228821 */  addu       $s1, $s1, $v0
/* DC8C 8000D08C 0C026380 */  jal        Calloc
/* DC90 8000D090 02202021 */   addu      $a0, $s1, $zero
/* DC94 8000D094 02141821 */  addu       $v1, $s0, $s4
/* DC98 8000D098 02158021 */  addu       $s0, $s0, $s5
/* DC9C 8000D09C 90640000 */  lbu        $a0, ($v1)
/* DCA0 8000D0A0 8E630208 */  lw         $v1, 0x208($s3)
/* DCA4 8000D0A4 00041080 */  sll        $v0, $a0, 2
/* DCA8 8000D0A8 00441021 */  addu       $v0, $v0, $a0
/* DCAC 8000D0AC 000210C0 */  sll        $v0, $v0, 3
/* DCB0 8000D0B0 00621821 */  addu       $v1, $v1, $v0
/* DCB4 8000D0B4 AE230004 */  sw         $v1, 4($s1)
/* DCB8 8000D0B8 26430001 */  addiu      $v1, $s2, 1
/* DCBC 8000D0BC 3072FFFF */  andi       $s2, $v1, 0xffff
/* DCC0 8000D0C0 92040000 */  lbu        $a0, ($s0)
/* DCC4 8000D0C4 8E63020C */  lw         $v1, 0x20c($s3)
/* DCC8 8000D0C8 000410C0 */  sll        $v0, $a0, 3
/* DCCC 8000D0CC 00441023 */  subu       $v0, $v0, $a0
/* DCD0 8000D0D0 00021080 */  sll        $v0, $v0, 2
/* DCD4 8000D0D4 00621821 */  addu       $v1, $v1, $v0
/* DCD8 8000D0D8 2E42001A */  sltiu      $v0, $s2, 0x1a
/* DCDC 8000D0DC 1440FFE4 */  bnez       $v0, .L8000D070
/* DCE0 8000D0E0 AE230000 */   sw        $v1, ($s1)
/* DCE4 8000D0E4 8FBF0028 */  lw         $ra, 0x28($sp)
/* DCE8 8000D0E8 8FB50024 */  lw         $s5, 0x24($sp)
/* DCEC 8000D0EC 8FB40020 */  lw         $s4, 0x20($sp)
/* DCF0 8000D0F0 8FB3001C */  lw         $s3, 0x1c($sp)
/* DCF4 8000D0F4 8FB20018 */  lw         $s2, 0x18($sp)
/* DCF8 8000D0F8 8FB10014 */  lw         $s1, 0x14($sp)
/* DCFC 8000D0FC 8FB00010 */  lw         $s0, 0x10($sp)
/* DD00 8000D100 D7BA0048 */  ldc1       $f26, 0x48($sp)
/* DD04 8000D104 D7B80040 */  ldc1       $f24, 0x40($sp)
/* DD08 8000D108 D7B60038 */  ldc1       $f22, 0x38($sp)
/* DD0C 8000D10C D7B40030 */  ldc1       $f20, 0x30($sp)
/* DD10 8000D110 03E00008 */  jr         $ra
/* DD14 8000D114 27BD0050 */   addiu     $sp, $sp, 0x50

glabel zoneEnginefree_2
/* DD18 8000D118 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* DD1C 8000D11C AFB10014 */  sw         $s1, 0x14($sp)
/* DD20 8000D120 3C11800E */  lui        $s1, %hi(D_800D8300)
/* DD24 8000D124 26318300 */  addiu      $s1, $s1, %lo(D_800D8300)
/* DD28 8000D128 02202821 */  addu       $a1, $s1, $zero
/* DD2C 8000D12C AFB00010 */  sw         $s0, 0x10($sp)
/* DD30 8000D130 3C10800E */  lui        $s0, %hi(gGlobals)
/* DD34 8000D134 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* DD38 8000D138 AFBF0018 */  sw         $ra, 0x18($sp)
/* DD3C 8000D13C 8E040208 */  lw         $a0, 0x208($s0)
/* DD40 8000D140 0C02600C */  jal        Free
/* DD44 8000D144 2406022E */   addiu     $a2, $zero, 0x22e
/* DD48 8000D148 02202821 */  addu       $a1, $s1, $zero
/* DD4C 8000D14C 8E04020C */  lw         $a0, 0x20c($s0)
/* DD50 8000D150 0C02600C */  jal        Free
/* DD54 8000D154 2406022F */   addiu     $a2, $zero, 0x22f
/* DD58 8000D158 02202821 */  addu       $a1, $s1, $zero
/* DD5C 8000D15C 8E040204 */  lw         $a0, 0x204($s0)
/* DD60 8000D160 0C02600C */  jal        Free
/* DD64 8000D164 24060230 */   addiu     $a2, $zero, 0x230
/* DD68 8000D168 8FBF0018 */  lw         $ra, 0x18($sp)
/* DD6C 8000D16C 8FB10014 */  lw         $s1, 0x14($sp)
/* DD70 8000D170 AE000208 */  sw         $zero, 0x208($s0)
/* DD74 8000D174 AE00020C */  sw         $zero, 0x20c($s0)
/* DD78 8000D178 AE000204 */  sw         $zero, 0x204($s0)
/* DD7C 8000D17C 8FB00010 */  lw         $s0, 0x10($sp)
/* DD80 8000D180 03E00008 */  jr         $ra
/* DD84 8000D184 27BD0020 */   addiu     $sp, $sp, 0x20

glabel attachPhysicsProperties
/* DD88 8000D188 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* DD8C 8000D18C AFB40020 */  sw         $s4, 0x20($sp)
/* DD90 8000D190 0080A021 */  addu       $s4, $a0, $zero
/* DD94 8000D194 AFBF0034 */  sw         $ra, 0x34($sp)
/* DD98 8000D198 AFBE0030 */  sw         $fp, 0x30($sp)
/* DD9C 8000D19C AFB7002C */  sw         $s7, 0x2c($sp)
/* DDA0 8000D1A0 AFB60028 */  sw         $s6, 0x28($sp)
/* DDA4 8000D1A4 AFB50024 */  sw         $s5, 0x24($sp)
/* DDA8 8000D1A8 AFB3001C */  sw         $s3, 0x1c($sp)
/* DDAC 8000D1AC AFB20018 */  sw         $s2, 0x18($sp)
/* DDB0 8000D1B0 AFB10014 */  sw         $s1, 0x14($sp)
/* DDB4 8000D1B4 AFB00010 */  sw         $s0, 0x10($sp)
/* DDB8 8000D1B8 96820024 */  lhu        $v0, 0x24($s4)
/* DDBC 8000D1BC 10400052 */  beqz       $v0, .L8000D308
/* DDC0 8000D1C0 00009021 */   addu      $s2, $zero, $zero
/* DDC4 8000D1C4 3C15800E */  lui        $s5, 0x800e
/* DDC8 8000D1C8 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* DDCC 8000D1CC 24538920 */  addiu      $s3, $v0, %lo(gGlobalsText)
/* DDD0 8000D1D0 267EDF88 */  addiu      $fp, $s3, -0x2078
/* DDD4 8000D1D4 3C17800E */  lui        $s7, 0x800e
/* DDD8 8000D1D8 3C16800E */  lui        $s6, 0x800e
.L8000D1DC:
/* DDDC 8000D1DC 8E82003C */  lw         $v0, 0x3c($s4)
/* DDE0 8000D1E0 00121940 */  sll        $v1, $s2, 5
/* DDE4 8000D1E4 00438021 */  addu       $s0, $v0, $v1
/* DDE8 8000D1E8 9611001A */  lhu        $s1, 0x1a($s0)
/* DDEC 8000D1EC 2E22001A */  sltiu      $v0, $s1, 0x1a
/* DDF0 8000D1F0 54400009 */  bnel       $v0, $zero, .L8000D218
/* DDF4 8000D1F4 9604001E */   lhu       $a0, 0x1e($s0)
/* DDF8 8000D1F8 02602021 */  addu       $a0, $s3, $zero
/* DDFC 8000D1FC 26E5832C */  addiu      $a1, $s7, -0x7cd4
/* DE00 8000D200 0C0333AC */  jal        sprintf
/* DE04 8000D204 02203021 */   addu      $a2, $s1, $zero
/* DE08 8000D208 26A4834C */  addiu      $a0, $s5, -0x7cb4
/* DE0C 8000D20C 0C025F2D */  jal        manualCrash
/* DE10 8000D210 02602821 */   addu      $a1, $s3, $zero
/* DE14 8000D214 9604001E */  lhu        $a0, 0x1e($s0)
.L8000D218:
/* DE18 8000D218 24021000 */  addiu      $v0, $zero, 0x1000
/* DE1C 8000D21C 3083F000 */  andi       $v1, $a0, 0xf000
/* DE20 8000D220 1062001B */  beq        $v1, $v0, .L8000D290
/* DE24 8000D224 24820001 */   addiu     $v0, $a0, 1
/* DE28 8000D228 28621001 */  slti       $v0, $v1, 0x1001
/* DE2C 8000D22C 10400005 */  beqz       $v0, .L8000D244
/* DE30 8000D230 24022000 */   addiu     $v0, $zero, 0x2000
/* DE34 8000D234 10600021 */  beqz       $v1, .L8000D2BC
/* DE38 8000D238 02602021 */   addu      $a0, $s3, $zero
/* DE3C 8000D23C 08003497 */  j          .L8000D25C
/* DE40 8000D240 9606001E */   lhu       $a2, 0x1e($s0)
.L8000D244:
/* DE44 8000D244 1062000C */  beq        $v1, $v0, .L8000D278
/* DE48 8000D248 3082007F */   andi      $v0, $a0, 0x7f
/* DE4C 8000D24C 24024000 */  addiu      $v0, $zero, 0x4000
/* DE50 8000D250 10620016 */  beq        $v1, $v0, .L8000D2AC
/* DE54 8000D254 02602021 */   addu      $a0, $s3, $zero
/* DE58 8000D258 9606001E */  lhu        $a2, 0x1e($s0)
.L8000D25C:
/* DE5C 8000D25C 0C0333AC */  jal        sprintf
/* DE60 8000D260 26C58364 */   addiu     $a1, $s6, -0x7c9c
/* DE64 8000D264 26A4834C */  addiu      $a0, $s5, -0x7cb4
/* DE68 8000D268 0C025F2D */  jal        manualCrash
/* DE6C 8000D26C 02602821 */   addu      $a1, $s3, $zero
/* DE70 8000D270 080034B8 */  j          .L8000D2E0
/* DE74 8000D274 26420001 */   addiu     $v0, $s2, 1
.L8000D278:
/* DE78 8000D278 00021140 */  sll        $v0, $v0, 5
/* DE7C 8000D27C 34422000 */  ori        $v0, $v0, 0x2000
/* DE80 8000D280 3224001F */  andi       $a0, $s1, 0x1f
/* DE84 8000D284 9603001C */  lhu        $v1, 0x1c($s0)
/* DE88 8000D288 080034B1 */  j          .L8000D2C4
/* DE8C 8000D28C 00441025 */   or        $v0, $v0, $a0
.L8000D290:
/* DE90 8000D290 3042007F */  andi       $v0, $v0, 0x7f
/* DE94 8000D294 00021140 */  sll        $v0, $v0, 5
/* DE98 8000D298 34421000 */  ori        $v0, $v0, 0x1000
/* DE9C 8000D29C 3224001F */  andi       $a0, $s1, 0x1f
/* DEA0 8000D2A0 9603001C */  lhu        $v1, 0x1c($s0)
/* DEA4 8000D2A4 080034B1 */  j          .L8000D2C4
/* DEA8 8000D2A8 00441025 */   or        $v0, $v0, $a0
.L8000D2AC:
/* DEAC 8000D2AC 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* DEB0 8000D2B0 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* DEB4 8000D2B4 10600007 */  beqz       $v1, .L8000D2D4
/* DEB8 8000D2B8 24020001 */   addiu     $v0, $zero, 1
.L8000D2BC:
/* DEBC 8000D2BC 9603001C */  lhu        $v1, 0x1c($s0)
/* DEC0 8000D2C0 36223000 */  ori        $v0, $s1, 0x3000
.L8000D2C4:
/* DEC4 8000D2C4 A602001E */  sh         $v0, 0x1e($s0)
/* DEC8 8000D2C8 34631000 */  ori        $v1, $v1, 0x1000
/* DECC 8000D2CC 080034B7 */  j          .L8000D2DC
/* DED0 8000D2D0 A603001C */   sh        $v1, 0x1c($s0)
.L8000D2D4:
/* DED4 8000D2D4 A602001C */  sh         $v0, 0x1c($s0)
/* DED8 8000D2D8 A600001E */  sh         $zero, 0x1e($s0)
.L8000D2DC:
/* DEDC 8000D2DC 26420001 */  addiu      $v0, $s2, 1
.L8000D2E0:
/* DEE0 8000D2E0 3052FFFF */  andi       $s2, $v0, 0xffff
/* DEE4 8000D2E4 00111840 */  sll        $v1, $s1, 1
/* DEE8 8000D2E8 00711821 */  addu       $v1, $v1, $s1
/* DEEC 8000D2EC 00031880 */  sll        $v1, $v1, 2
/* DEF0 8000D2F0 8FC20204 */  lw         $v0, 0x204($fp)
/* DEF4 8000D2F4 96840024 */  lhu        $a0, 0x24($s4)
/* DEF8 8000D2F8 00431021 */  addu       $v0, $v0, $v1
/* DEFC 8000D2FC 0244202B */  sltu       $a0, $s2, $a0
/* DF00 8000D300 1480FFB6 */  bnez       $a0, .L8000D1DC
/* DF04 8000D304 AE020018 */   sw        $v0, 0x18($s0)
.L8000D308:
/* DF08 8000D308 8FBF0034 */  lw         $ra, 0x34($sp)
/* DF0C 8000D30C 8FBE0030 */  lw         $fp, 0x30($sp)
/* DF10 8000D310 8FB7002C */  lw         $s7, 0x2c($sp)
/* DF14 8000D314 8FB60028 */  lw         $s6, 0x28($sp)
/* DF18 8000D318 8FB50024 */  lw         $s5, 0x24($sp)
/* DF1C 8000D31C 8FB40020 */  lw         $s4, 0x20($sp)
/* DF20 8000D320 8FB3001C */  lw         $s3, 0x1c($sp)
/* DF24 8000D324 8FB20018 */  lw         $s2, 0x18($sp)
/* DF28 8000D328 8FB10014 */  lw         $s1, 0x14($sp)
/* DF2C 8000D32C 8FB00010 */  lw         $s0, 0x10($sp)
/* DF30 8000D330 03E00008 */  jr         $ra
/* DF34 8000D334 27BD0038 */   addiu     $sp, $sp, 0x38

glabel GetCollisionZone
/* DF38 8000D338 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* DF3C 8000D33C 308400FF */  andi       $a0, $a0, 0xff
/* DF40 8000D340 00041902 */  srl        $v1, $a0, 4
/* DF44 8000D344 30840003 */  andi       $a0, $a0, 3
/* DF48 8000D348 3C05800E */  lui        $a1, %hi(gGlobals)
/* DF4C 8000D34C 24A568A8 */  addiu      $a1, $a1, %lo(gGlobals)
/* DF50 8000D350 00031040 */  sll        $v0, $v1, 1
/* DF54 8000D354 00431021 */  addu       $v0, $v0, $v1
/* DF58 8000D358 00441021 */  addu       $v0, $v0, $a0
/* DF5C 8000D35C 00021140 */  sll        $v0, $v0, 5
/* DF60 8000D360 24A500EC */  addiu      $a1, $a1, 0xec
/* DF64 8000D364 AFB00010 */  sw         $s0, 0x10($sp)
/* DF68 8000D368 00458021 */  addu       $s0, $v0, $a1
/* DF6C 8000D36C AFBF0014 */  sw         $ra, 0x14($sp)
/* DF70 8000D370 8E030000 */  lw         $v1, ($s0)
/* DF74 8000D374 54600009 */  bnel       $v1, $zero, .L8000D39C
/* DF78 8000D378 8E020000 */   lw        $v0, ($s0)
/* DF7C 8000D37C 3C04800E */  lui        $a0, %hi(D_800D837C)
/* DF80 8000D380 3C05800E */  lui        $a1, %hi(D_800D8390)
/* DF84 8000D384 2484837C */  addiu      $a0, $a0, %lo(D_800D837C)
/* DF88 8000D388 0C025F2D */  jal        manualCrash
/* DF8C 8000D38C 24A58390 */   addiu     $a1, $a1, %lo(D_800D8390)
/* DF90 8000D390 8E020000 */  lw         $v0, ($s0)
/* DF94 8000D394 50400002 */  beql       $v0, $zero, .L8000D3A0
/* DF98 8000D398 00001021 */   addu      $v0, $zero, $zero
.L8000D39C:
/* DF9C 8000D39C 24420008 */  addiu      $v0, $v0, 8
.L8000D3A0:
/* DFA0 8000D3A0 8FBF0014 */  lw         $ra, 0x14($sp)
/* DFA4 8000D3A4 8FB00010 */  lw         $s0, 0x10($sp)
/* DFA8 8000D3A8 03E00008 */  jr         $ra
/* DFAC 8000D3AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_teleport_pointer
/* DFB0 8000D3B0 3C03800E */  lui        $v1, %hi(gGlobals)
/* DFB4 8000D3B4 246568A8 */  addiu      $a1, $v1, %lo(gGlobals)
/* DFB8 8000D3B8 94A22048 */  lhu        $v0, 0x2048($a1)
/* DFBC 8000D3BC 00603021 */  addu       $a2, $v1, $zero
/* DFC0 8000D3C0 ACA40FDC */  sw         $a0, 0xfdc($a1)
/* DFC4 8000D3C4 14400007 */  bnez       $v0, .L8000D3E4
/* DFC8 8000D3C8 ACA00FE0 */   sw        $zero, 0xfe0($a1)
/* DFCC 8000D3CC C4A2203C */  lwc1       $f2, 0x203c($a1)
/* DFD0 8000D3D0 44800000 */  mtc1       $zero, $f0
/* DFD4 8000D3D4 4602003C */  c.lt.s     $f0, $f2
/* DFD8 8000D3D8 00000000 */  nop
/* DFDC 8000D3DC 45010008 */  bc1t       .L8000D400
/* DFE0 8000D3E0 24C268A8 */   addiu     $v0, $a2, 0x68a8
.L8000D3E4:
/* DFE4 8000D3E4 3C02800F */  lui        $v0, %hi(initZoneTimestamp)
/* DFE8 8000D3E8 8CA30008 */  lw         $v1, 8($a1)
/* DFEC 8000D3EC 8C448DB8 */  lw         $a0, %lo(initZoneTimestamp)($v0)
/* DFF0 8000D3F0 00641823 */  subu       $v1, $v1, $a0
/* DFF4 8000D3F4 2C630003 */  sltiu      $v1, $v1, 3
/* DFF8 8000D3F8 10600006 */  beqz       $v1, .L8000D414
/* DFFC 8000D3FC 24C268A8 */   addiu     $v0, $a2, 0x68a8
.L8000D400:
/* E000 8000D400 3C01800E */  lui        $at, %hi(D_800D83A0)
/* E004 8000D404 C42083A0 */  lwc1       $f0, %lo(D_800D83A0)($at)
/* E008 8000D408 24030001 */  addiu      $v1, $zero, 1
/* E00C 8000D40C A4432048 */  sh         $v1, 0x2048($v0)
/* E010 8000D410 E4402044 */  swc1       $f0, 0x2044($v0)
.L8000D414:
/* E014 8000D414 03E00008 */  jr         $ra
/* E018 8000D418 00000000 */   nop

glabel set_teleport_obj_A
/* E01C 8000D41C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* E020 8000D420 AFB3001C */  sw         $s3, 0x1c($sp)
/* E024 8000D424 00049C00 */  sll        $s3, $a0, 0x10
/* E028 8000D428 00E02021 */  addu       $a0, $a3, $zero
/* E02C 8000D42C AFB20018 */  sw         $s2, 0x18($sp)
/* E030 8000D430 00059400 */  sll        $s2, $a1, 0x10
/* E034 8000D434 3C03800F */  lui        $v1, %hi(D_800F5210)
/* E038 8000D438 24635210 */  addiu      $v1, $v1, %lo(D_800F5210)
/* E03C 8000D43C 00602821 */  addu       $a1, $v1, $zero
/* E040 8000D440 3C02800E */  lui        $v0, %hi(gGlobals)
/* E044 8000D444 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* E048 8000D448 AFB00010 */  sw         $s0, 0x10($sp)
/* E04C 8000D44C 3C10800F */  lui        $s0, %hi(bss_tele_obj)
/* E050 8000D450 261051A0 */  addiu      $s0, $s0, %lo(bss_tele_obj)
/* E054 8000D454 00139C03 */  sra        $s3, $s3, 0x10
/* E058 8000D458 00129403 */  sra        $s2, $s2, 0x10
/* E05C 8000D45C AFB10014 */  sw         $s1, 0x14($sp)
/* E060 8000D460 00068C00 */  sll        $s1, $a2, 0x10
/* E064 8000D464 00118C03 */  sra        $s1, $s1, 0x10
/* E068 8000D468 AFBF0020 */  sw         $ra, 0x20($sp)
/* E06C 8000D46C AC500FDC */  sw         $s0, 0xfdc($v0)
/* E070 8000D470 0C02AD17 */  jal        copyVec3
/* E074 8000D474 AC430FE0 */   sw        $v1, 0xfe0($v0)
/* E078 8000D478 02002021 */  addu       $a0, $s0, $zero
/* E07C 8000D47C 00002821 */  addu       $a1, $zero, $zero
/* E080 8000D480 0C026380 */  jal        Calloc
/* E084 8000D484 2406006C */   addiu     $a2, $zero, 0x6c
/* E088 8000D488 8FBF0020 */  lw         $ra, 0x20($sp)
/* E08C 8000D48C A6130028 */  sh         $s3, 0x28($s0)
/* E090 8000D490 8FB3001C */  lw         $s3, 0x1c($sp)
/* E094 8000D494 A612002A */  sh         $s2, 0x2a($s0)
/* E098 8000D498 8FB20018 */  lw         $s2, 0x18($sp)
/* E09C 8000D49C A611002C */  sh         $s1, 0x2c($s0)
/* E0A0 8000D4A0 8FB10014 */  lw         $s1, 0x14($sp)
/* E0A4 8000D4A4 24030007 */  addiu      $v1, $zero, 7
/* E0A8 8000D4A8 A6030016 */  sh         $v1, 0x16($s0)
/* E0AC 8000D4AC 8FB00010 */  lw         $s0, 0x10($sp)
/* E0B0 8000D4B0 03E00008 */  jr         $ra
/* E0B4 8000D4B4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel set_teleport_obj_loadgame
/* E0B8 8000D4B8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* E0BC 8000D4BC AFB3001C */  sw         $s3, 0x1c($sp)
/* E0C0 8000D4C0 00049C00 */  sll        $s3, $a0, 0x10
/* E0C4 8000D4C4 AFB00010 */  sw         $s0, 0x10($sp)
/* E0C8 8000D4C8 3C10800F */  lui        $s0, %hi(loadgame_tp_obj)
/* E0CC 8000D4CC 26105220 */  addiu      $s0, $s0, %lo(loadgame_tp_obj)
/* E0D0 8000D4D0 02002021 */  addu       $a0, $s0, $zero
/* E0D4 8000D4D4 AFB20018 */  sw         $s2, 0x18($sp)
/* E0D8 8000D4D8 00059400 */  sll        $s2, $a1, 0x10
/* E0DC 8000D4DC 00002821 */  addu       $a1, $zero, $zero
/* E0E0 8000D4E0 3C02800E */  lui        $v0, %hi(gGlobals)
/* E0E4 8000D4E4 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* E0E8 8000D4E8 AFB40020 */  sw         $s4, 0x20($sp)
/* E0EC 8000D4EC 00E0A021 */  addu       $s4, $a3, $zero
/* E0F0 8000D4F0 00139C03 */  sra        $s3, $s3, 0x10
/* E0F4 8000D4F4 00129403 */  sra        $s2, $s2, 0x10
/* E0F8 8000D4F8 AFB10014 */  sw         $s1, 0x14($sp)
/* E0FC 8000D4FC 00068C00 */  sll        $s1, $a2, 0x10
/* E100 8000D500 00118C03 */  sra        $s1, $s1, 0x10
/* E104 8000D504 2406006C */  addiu      $a2, $zero, 0x6c
/* E108 8000D508 AFBF0024 */  sw         $ra, 0x24($sp)
/* E10C 8000D50C AC500FDC */  sw         $s0, 0xfdc($v0)
/* E110 8000D510 0C026380 */  jal        Calloc
/* E114 8000D514 AC400FE0 */   sw        $zero, 0xfe0($v0)
/* E118 8000D518 02802021 */  addu       $a0, $s4, $zero
/* E11C 8000D51C 02002821 */  addu       $a1, $s0, $zero
/* E120 8000D520 24020007 */  addiu      $v0, $zero, 7
/* E124 8000D524 A6020016 */  sh         $v0, 0x16($s0)
/* E128 8000D528 24027FF8 */  addiu      $v0, $zero, 0x7ff8
/* E12C 8000D52C A6130028 */  sh         $s3, 0x28($s0)
/* E130 8000D530 A612002A */  sh         $s2, 0x2a($s0)
/* E134 8000D534 A611002C */  sh         $s1, 0x2c($s0)
/* E138 8000D538 0C02AD17 */  jal        copyVec3
/* E13C 8000D53C A602002E */   sh        $v0, 0x2e($s0)
/* E140 8000D540 8FBF0024 */  lw         $ra, 0x24($sp)
/* E144 8000D544 8FB40020 */  lw         $s4, 0x20($sp)
/* E148 8000D548 8FB3001C */  lw         $s3, 0x1c($sp)
/* E14C 8000D54C 8FB20018 */  lw         $s2, 0x18($sp)
/* E150 8000D550 8FB10014 */  lw         $s1, 0x14($sp)
/* E154 8000D554 8FB00010 */  lw         $s0, 0x10($sp)
/* E158 8000D558 03E00008 */  jr         $ra
/* E15C 8000D55C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_trigger
/* E160 8000D560 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* E164 8000D564 00804021 */  addu       $t0, $a0, $zero
/* E168 8000D568 AFBF0014 */  sw         $ra, 0x14($sp)
/* E16C 8000D56C AFB00010 */  sw         $s0, 0x10($sp)
/* E170 8000D570 8D03003C */  lw         $v1, 0x3c($t0)
/* E174 8000D574 10600010 */  beqz       $v1, .L8000D5B8
/* E178 8000D578 00003821 */   addu      $a3, $zero, $zero
/* E17C 8000D57C 94A2001E */  lhu        $v0, 0x1e($a1)
/* E180 8000D580 00603821 */  addu       $a3, $v1, $zero
/* E184 8000D584 3042001F */  andi       $v0, $v0, 0x1f
/* E188 8000D588 A4E20100 */  sh         $v0, 0x100($a3)
/* E18C 8000D58C 3043FFFF */  andi       $v1, $v0, 0xffff
/* E190 8000D590 2862001A */  slti       $v0, $v1, 0x1a
/* E194 8000D594 10400008 */  beqz       $v0, .L8000D5B8
/* E198 8000D598 2862000E */   slti      $v0, $v1, 0xe
/* E19C 8000D59C 54400007 */  bnel       $v0, $zero, .L8000D5BC
/* E1A0 8000D5A0 94A5001E */   lhu       $a1, 0x1e($a1)
/* E1A4 8000D5A4 90E2070B */  lbu        $v0, 0x70b($a3)
/* E1A8 8000D5A8 10400003 */  beqz       $v0, .L8000D5B8
/* E1AC 8000D5AC 3C03800F */   lui       $v1, %hi(D_800E8DA0)
/* E1B0 8000D5B0 24020014 */  addiu      $v0, $zero, 0x14
/* E1B4 8000D5B4 A4628DA0 */  sh         $v0, %lo(D_800E8DA0)($v1)
.L8000D5B8:
/* E1B8 8000D5B8 94A5001E */  lhu        $a1, 0x1e($a1)
.L8000D5BC:
/* E1BC 8000D5BC 24022000 */  addiu      $v0, $zero, 0x2000
/* E1C0 8000D5C0 30A3F000 */  andi       $v1, $a1, 0xf000
/* E1C4 8000D5C4 14620044 */  bne        $v1, $v0, .L8000D6D8
/* E1C8 8000D5C8 8FBF0014 */   lw        $ra, 0x14($sp)
/* E1CC 8000D5CC 9502001C */  lhu        $v0, 0x1c($t0)
/* E1D0 8000D5D0 30420400 */  andi       $v0, $v0, 0x400
/* E1D4 8000D5D4 14400041 */  bnez       $v0, .L8000D6DC
/* E1D8 8000D5D8 8FB00010 */   lw        $s0, 0x10($sp)
/* E1DC 8000D5DC 3C02800E */  lui        $v0, %hi(gGlobals)
/* E1E0 8000D5E0 244668A8 */  addiu      $a2, $v0, %lo(gGlobals)
/* E1E4 8000D5E4 90C300DC */  lbu        $v1, 0xdc($a2)
/* E1E8 8000D5E8 24020003 */  addiu      $v0, $zero, 3
/* E1EC 8000D5EC 1462003B */  bne        $v1, $v0, .L8000D6DC
/* E1F0 8000D5F0 3C02800F */   lui       $v0, %hi(some_toggle)
/* E1F4 8000D5F4 84449AA4 */  lh         $a0, %lo(some_toggle)($v0)
/* E1F8 8000D5F8 2403FFFF */  addiu      $v1, $zero, -1
/* E1FC 8000D5FC 14830037 */  bne        $a0, $v1, .L8000D6DC
/* E200 8000D600 00051942 */   srl       $v1, $a1, 5
/* E204 8000D604 3063007F */  andi       $v1, $v1, 0x7f
/* E208 8000D608 000310C0 */  sll        $v0, $v1, 3
/* E20C 8000D60C 00431023 */  subu       $v0, $v0, $v1
/* E210 8000D610 00021080 */  sll        $v0, $v0, 2
/* E214 8000D614 8CC40200 */  lw         $a0, 0x200($a2)
/* E218 8000D618 00431023 */  subu       $v0, $v0, $v1
/* E21C 8000D61C 8C850044 */  lw         $a1, 0x44($a0)
/* E220 8000D620 00021080 */  sll        $v0, $v0, 2
/* E224 8000D624 00A28021 */  addu       $s0, $a1, $v0
/* E228 8000D628 96030014 */  lhu        $v1, 0x14($s0)
/* E22C 8000D62C 30638000 */  andi       $v1, $v1, 0x8000
/* E230 8000D630 10600029 */  beqz       $v1, .L8000D6D8
/* E234 8000D634 24020008 */   addiu     $v0, $zero, 8
/* E238 8000D638 96060016 */  lhu        $a2, 0x16($s0)
/* E23C 8000D63C 10C20014 */  beq        $a2, $v0, .L8000D690
/* E240 8000D640 28C20009 */   slti      $v0, $a2, 9
/* E244 8000D644 10400005 */  beqz       $v0, .L8000D65C
/* E248 8000D648 24020007 */   addiu     $v0, $zero, 7
/* E24C 8000D64C 10C20015 */  beq        $a2, $v0, .L8000D6A4
/* E250 8000D650 00000000 */   nop
/* E254 8000D654 0800359B */  j          .L8000D66C
/* E258 8000D658 3C10800F */   lui       $s0, 0x800f
.L8000D65C:
/* E25C 8000D65C 24020009 */  addiu      $v0, $zero, 9
/* E260 8000D660 10C20014 */  beq        $a2, $v0, .L8000D6B4
/* E264 8000D664 02002021 */   addu      $a0, $s0, $zero
/* E268 8000D668 3C10800F */  lui        $s0, %hi(gGlobalsText)
.L8000D66C:
/* E26C 8000D66C 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* E270 8000D670 02002021 */  addu       $a0, $s0, $zero
/* E274 8000D674 3C05800E */  lui        $a1, %hi(D_800D83A4)
/* E278 8000D678 0C0333AC */  jal        sprintf
/* E27C 8000D67C 24A583A4 */   addiu     $a1, $a1, %lo(D_800D83A4)
/* E280 8000D680 0C00B6B8 */  jal        debug_queue
/* E284 8000D684 02002021 */   addu      $a0, $s0, $zero
/* E288 8000D688 080035B6 */  j          .L8000D6D8
/* E28C 8000D68C 8FBF0014 */   lw        $ra, 0x14($sp)
.L8000D690:
/* E290 8000D690 02002021 */  addu       $a0, $s0, $zero
/* E294 8000D694 0C006714 */  jal        set_camera_voxel_pointer
/* E298 8000D698 25050004 */   addiu     $a1, $t0, 4
/* E29C 8000D69C 080035B6 */  j          .L8000D6D8
/* E2A0 8000D6A0 8FBF0014 */   lw        $ra, 0x14($sp)
.L8000D6A4:
/* E2A4 8000D6A4 0C0034EC */  jal        set_teleport_pointer
/* E2A8 8000D6A8 02002021 */   addu      $a0, $s0, $zero
/* E2AC 8000D6AC 080035B6 */  j          .L8000D6D8
/* E2B0 8000D6B0 8FBF0014 */   lw        $ra, 0x14($sp)
.L8000D6B4:
/* E2B4 8000D6B4 00E02821 */  addu       $a1, $a3, $zero
/* E2B8 8000D6B8 0C00536F */  jal        dialoug_obj_func
/* E2BC 8000D6BC 00003021 */   addu      $a2, $zero, $zero
/* E2C0 8000D6C0 10400004 */  beqz       $v0, .L8000D6D4
/* E2C4 8000D6C4 02002021 */   addu      $a0, $s0, $zero
/* E2C8 8000D6C8 00002821 */  addu       $a1, $zero, $zero
/* E2CC 8000D6CC 0C00513E */  jal        dialouge_vobject_func
/* E2D0 8000D6D0 24067FFF */   addiu     $a2, $zero, 0x7fff
.L8000D6D4:
/* E2D4 8000D6D4 8FBF0014 */  lw         $ra, 0x14($sp)
.L8000D6D8:
/* E2D8 8000D6D8 8FB00010 */  lw         $s0, 0x10($sp)
.L8000D6DC:
/* E2DC 8000D6DC 03E00008 */  jr         $ra
/* E2E0 8000D6E0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel init_some_map_data
/* E2E4 8000D6E4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* E2E8 8000D6E8 AFB20018 */  sw         $s2, 0x18($sp)
/* E2EC 8000D6EC 00809021 */  addu       $s2, $a0, $zero
/* E2F0 8000D6F0 AFB00010 */  sw         $s0, 0x10($sp)
/* E2F4 8000D6F4 00058400 */  sll        $s0, $a1, 0x10
/* E2F8 8000D6F8 00108403 */  sra        $s0, $s0, 0x10
/* E2FC 8000D6FC AFB10014 */  sw         $s1, 0x14($sp)
/* E300 8000D700 00068C00 */  sll        $s1, $a2, 0x10
/* E304 8000D704 00118C03 */  sra        $s1, $s1, 0x10
/* E308 8000D708 00002821 */  addu       $a1, $zero, $zero
/* E30C 8000D70C AFBF001C */  sw         $ra, 0x1c($sp)
/* E310 8000D710 0C026380 */  jal        Calloc
/* E314 8000D714 24060020 */   addiu     $a2, $zero, 0x20
/* E318 8000D718 24030007 */  addiu      $v1, $zero, 7
/* E31C 8000D71C 00108100 */  sll        $s0, $s0, 4
/* E320 8000D720 8FBF001C */  lw         $ra, 0x1c($sp)
/* E324 8000D724 02118021 */  addu       $s0, $s0, $s1
/* E328 8000D728 A243001E */  sb         $v1, 0x1e($s2)
/* E32C 8000D72C A250001D */  sb         $s0, 0x1d($s2)
/* E330 8000D730 8FB20018 */  lw         $s2, 0x18($sp)
/* E334 8000D734 8FB10014 */  lw         $s1, 0x14($sp)
/* E338 8000D738 8FB00010 */  lw         $s0, 0x10($sp)
/* E33C 8000D73C 03E00008 */  jr         $ra
/* E340 8000D740 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8000D744
/* E344 8000D744 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* E348 8000D748 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* E34C 8000D74C AFB50024 */  sw         $s5, 0x24($sp)
/* E350 8000D750 24556988 */  addiu      $s5, $v0, %lo(zoneDatMatrix)
/* E354 8000D754 AFB20018 */  sw         $s2, 0x18($sp)
/* E358 8000D758 00009021 */  addu       $s2, $zero, $zero
/* E35C 8000D75C AFB40020 */  sw         $s4, 0x20($sp)
/* E360 8000D760 3C140001 */  lui        $s4, 1
/* E364 8000D764 AFBF0028 */  sw         $ra, 0x28($sp)
/* E368 8000D768 AFB3001C */  sw         $s3, 0x1c($sp)
/* E36C 8000D76C AFB10014 */  sw         $s1, 0x14($sp)
/* E370 8000D770 AFB00010 */  sw         $s0, 0x10($sp)
/* E374 8000D774 00003021 */  addu       $a2, $zero, $zero
.L8000D778:
/* E378 8000D778 26530001 */  addiu      $s3, $s2, 1
/* E37C 8000D77C 3C110001 */  lui        $s1, 1
/* E380 8000D780 00121040 */  sll        $v0, $s2, 1
/* E384 8000D784 00521021 */  addu       $v0, $v0, $s2
/* E388 8000D788 00021140 */  sll        $v0, $v0, 5
/* E38C 8000D78C 02A28021 */  addu       $s0, $s5, $v0
.L8000D790:
/* E390 8000D790 02002021 */  addu       $a0, $s0, $zero
/* E394 8000D794 0C0035B9 */  jal        init_some_map_data
/* E398 8000D798 02402821 */   addu      $a1, $s2, $zero
/* E39C 8000D79C 02201821 */  addu       $v1, $s1, $zero
/* E3A0 8000D7A0 02348821 */  addu       $s1, $s1, $s4
/* E3A4 8000D7A4 00033403 */  sra        $a2, $v1, 0x10
/* E3A8 8000D7A8 28C20003 */  slti       $v0, $a2, 3
/* E3AC 8000D7AC 1440FFF8 */  bnez       $v0, .L8000D790
/* E3B0 8000D7B0 26100020 */   addiu     $s0, $s0, 0x20
/* E3B4 8000D7B4 00131400 */  sll        $v0, $s3, 0x10
/* E3B8 8000D7B8 00029403 */  sra        $s2, $v0, 0x10
/* E3BC 8000D7BC 2A430003 */  slti       $v1, $s2, 3
/* E3C0 8000D7C0 5460FFED */  bnel       $v1, $zero, .L8000D778
/* E3C4 8000D7C4 00003021 */   addu      $a2, $zero, $zero
/* E3C8 8000D7C8 8FBF0028 */  lw         $ra, 0x28($sp)
/* E3CC 8000D7CC 8FB50024 */  lw         $s5, 0x24($sp)
/* E3D0 8000D7D0 8FB40020 */  lw         $s4, 0x20($sp)
/* E3D4 8000D7D4 8FB3001C */  lw         $s3, 0x1c($sp)
/* E3D8 8000D7D8 8FB20018 */  lw         $s2, 0x18($sp)
/* E3DC 8000D7DC 8FB10014 */  lw         $s1, 0x14($sp)
/* E3E0 8000D7E0 8FB00010 */  lw         $s0, 0x10($sp)
/* E3E4 8000D7E4 03E00008 */  jr         $ra
/* E3E8 8000D7E8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8000D7EC
/* E3EC 8000D7EC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* E3F0 8000D7F0 AFB50024 */  sw         $s5, 0x24($sp)
/* E3F4 8000D7F4 0080A821 */  addu       $s5, $a0, $zero
/* E3F8 8000D7F8 AFB00010 */  sw         $s0, 0x10($sp)
/* E3FC 8000D7FC 30B0FFFF */  andi       $s0, $a1, 0xffff
/* E400 8000D800 AFBE0030 */  sw         $fp, 0x30($sp)
/* E404 8000D804 30DEFFFF */  andi       $fp, $a2, 0xffff
/* E408 8000D808 AFBF0034 */  sw         $ra, 0x34($sp)
/* E40C 8000D80C AFB7002C */  sw         $s7, 0x2c($sp)
/* E410 8000D810 AFB60028 */  sw         $s6, 0x28($sp)
/* E414 8000D814 AFB40020 */  sw         $s4, 0x20($sp)
/* E418 8000D818 AFB3001C */  sw         $s3, 0x1c($sp)
/* E41C 8000D81C AFB20018 */  sw         $s2, 0x18($sp)
/* E420 8000D820 AFB10014 */  sw         $s1, 0x14($sp)
/* E424 8000D824 8EA2000C */  lw         $v0, 0xc($s5)
/* E428 8000D828 8EA30004 */  lw         $v1, 4($s5)
/* E42C 8000D82C 1060000B */  beqz       $v1, .L8000D85C
/* E430 8000D830 24570008 */   addiu     $s7, $v0, 8
/* E434 8000D834 12000009 */  beqz       $s0, .L8000D85C
/* E438 8000D838 3C04800E */   lui       $a0, %hi(queueStructA)
/* E43C 8000D83C 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* E440 8000D840 26A50004 */  addiu      $a1, $s5, 4
/* E444 8000D844 24060001 */  addiu      $a2, $zero, 1
/* E448 8000D848 0C035867 */  jal        AllocFreeQueueItem
/* E44C 8000D84C 00003821 */   addu      $a3, $zero, $zero
/* E450 8000D850 92A2001E */  lbu        $v0, 0x1e($s5)
/* E454 8000D854 34420001 */  ori        $v0, $v0, 1
/* E458 8000D858 A2A2001E */  sb         $v0, 0x1e($s5)
.L8000D85C:
/* E45C 8000D85C 8EA20014 */  lw         $v0, 0x14($s5)
/* E460 8000D860 5040000C */  beql       $v0, $zero, .L8000D894
/* E464 8000D864 8EA2000C */   lw        $v0, 0xc($s5)
/* E468 8000D868 12000009 */  beqz       $s0, .L8000D890
/* E46C 8000D86C 3C04800E */   lui       $a0, %hi(queueStructA)
/* E470 8000D870 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* E474 8000D874 26A50014 */  addiu      $a1, $s5, 0x14
/* E478 8000D878 24060001 */  addiu      $a2, $zero, 1
/* E47C 8000D87C 0C035867 */  jal        AllocFreeQueueItem
/* E480 8000D880 00003821 */   addu      $a3, $zero, $zero
/* E484 8000D884 92A2001E */  lbu        $v0, 0x1e($s5)
/* E488 8000D888 34420002 */  ori        $v0, $v0, 2
/* E48C 8000D88C A2A2001E */  sb         $v0, 0x1e($s5)
.L8000D890:
/* E490 8000D890 8EA2000C */  lw         $v0, 0xc($s5)
.L8000D894:
/* E494 8000D894 10400048 */  beqz       $v0, .L8000D9B8
/* E498 8000D898 00000000 */   nop
/* E49C 8000D89C 57C0000A */  bnel       $fp, $zero, .L8000D8C8
/* E4A0 8000D8A0 96E20028 */   lhu       $v0, 0x28($s7)
/* E4A4 8000D8A4 3C10800E */  lui        $s0, %hi(wanderstruct)
/* E4A8 8000D8A8 261068F8 */  addiu      $s0, $s0, %lo(wanderstruct)
/* E4AC 8000D8AC 8EA50018 */  lw         $a1, 0x18($s5)
/* E4B0 8000D8B0 0C004A89 */  jal        func_80012A24
/* E4B4 8000D8B4 02002021 */   addu      $a0, $s0, $zero
/* E4B8 8000D8B8 8EA50018 */  lw         $a1, 0x18($s5)
/* E4BC 8000D8BC 0C0158BC */  jal        func_800562F0
/* E4C0 8000D8C0 260412A8 */   addiu     $a0, $s0, 0x12a8
/* E4C4 8000D8C4 96E20028 */  lhu        $v0, 0x28($s7)
.L8000D8C8:
/* E4C8 8000D8C8 10400036 */  beqz       $v0, .L8000D9A4
/* E4CC 8000D8CC 00002821 */   addu      $a1, $zero, $zero
/* E4D0 8000D8D0 000510C0 */  sll        $v0, $a1, 3
.L8000D8D4:
/* E4D4 8000D8D4 00451023 */  subu       $v0, $v0, $a1
/* E4D8 8000D8D8 00021080 */  sll        $v0, $v0, 2
/* E4DC 8000D8DC 00451023 */  subu       $v0, $v0, $a1
/* E4E0 8000D8E0 8EE30044 */  lw         $v1, 0x44($s7)
/* E4E4 8000D8E4 00021080 */  sll        $v0, $v0, 2
/* E4E8 8000D8E8 00628821 */  addu       $s1, $v1, $v0
/* E4EC 8000D8EC 96240016 */  lhu        $a0, 0x16($s1)
/* E4F0 8000D8F0 14800027 */  bnez       $a0, .L8000D990
/* E4F4 8000D8F4 24B60001 */   addiu     $s6, $a1, 1
/* E4F8 8000D8F8 96220068 */  lhu        $v0, 0x68($s1)
/* E4FC 8000D8FC 10400024 */  beqz       $v0, .L8000D990
/* E500 8000D900 00008021 */   addu      $s0, $zero, $zero
/* E504 8000D904 26320030 */  addiu      $s2, $s1, 0x30
/* E508 8000D908 3C14800E */  lui        $s4, 0x800e
/* E50C 8000D90C 00102040 */  sll        $a0, $s0, 1
.L8000D910:
/* E510 8000D910 00901021 */  addu       $v0, $a0, $s0
/* E514 8000D914 00022880 */  sll        $a1, $v0, 2
/* E518 8000D918 02451821 */  addu       $v1, $s2, $a1
/* E51C 8000D91C 8C620000 */  lw         $v0, ($v1)
/* E520 8000D920 10400015 */  beqz       $v0, .L8000D978
/* E524 8000D924 00809821 */   addu      $s3, $a0, $zero
/* E528 8000D928 9622006A */  lhu        $v0, 0x6a($s1)
/* E52C 8000D92C 30420002 */  andi       $v0, $v0, 2
/* E530 8000D930 10400008 */  beqz       $v0, .L8000D954
/* E534 8000D934 26847ECC */   addiu     $a0, $s4, 0x7ecc
/* E538 8000D938 00B12821 */  addu       $a1, $a1, $s1
/* E53C 8000D93C 24A50030 */  addiu      $a1, $a1, 0x30
/* E540 8000D940 00003021 */  addu       $a2, $zero, $zero
/* E544 8000D944 0C035867 */  jal        AllocFreeQueueItem
/* E548 8000D948 00003821 */   addu      $a3, $zero, $zero
/* E54C 8000D94C 0800365B */  j          .L8000D96C
/* E550 8000D950 02701021 */   addu      $v0, $s3, $s0
.L8000D954:
/* E554 8000D954 00B12821 */  addu       $a1, $a1, $s1
/* E558 8000D958 24A50030 */  addiu      $a1, $a1, 0x30
/* E55C 8000D95C 24060001 */  addiu      $a2, $zero, 1
/* E560 8000D960 0C035867 */  jal        AllocFreeQueueItem
/* E564 8000D964 00003821 */   addu      $a3, $zero, $zero
/* E568 8000D968 02701021 */  addu       $v0, $s3, $s0
.L8000D96C:
/* E56C 8000D96C 00021080 */  sll        $v0, $v0, 2
/* E570 8000D970 02421021 */  addu       $v0, $s2, $v0
/* E574 8000D974 AC400000 */  sw         $zero, ($v0)
.L8000D978:
/* E578 8000D978 26030001 */  addiu      $v1, $s0, 1
/* E57C 8000D97C 96220068 */  lhu        $v0, 0x68($s1)
/* E580 8000D980 3070FFFF */  andi       $s0, $v1, 0xffff
/* E584 8000D984 0202102B */  sltu       $v0, $s0, $v0
/* E588 8000D988 1440FFE1 */  bnez       $v0, .L8000D910
/* E58C 8000D98C 00102040 */   sll       $a0, $s0, 1
.L8000D990:
/* E590 8000D990 96E20028 */  lhu        $v0, 0x28($s7)
/* E594 8000D994 32C5FFFF */  andi       $a1, $s6, 0xffff
/* E598 8000D998 00A2102B */  sltu       $v0, $a1, $v0
/* E59C 8000D99C 1440FFCD */  bnez       $v0, .L8000D8D4
/* E5A0 8000D9A0 000510C0 */   sll       $v0, $a1, 3
.L8000D9A4:
/* E5A4 8000D9A4 17C00009 */  bnez       $fp, .L8000D9CC
/* E5A8 8000D9A8 8FBF0034 */   lw        $ra, 0x34($sp)
/* E5AC 8000D9AC 0C029B70 */  jal        remove_borg_9
/* E5B0 8000D9B0 8EA4000C */   lw        $a0, 0xc($s5)
/* E5B4 8000D9B4 AEA0000C */  sw         $zero, 0xc($s5)
.L8000D9B8:
/* E5B8 8000D9B8 17C00004 */  bnez       $fp, .L8000D9CC
/* E5BC 8000D9BC 8FBF0034 */   lw        $ra, 0x34($sp)
/* E5C0 8000D9C0 AEA00000 */  sw         $zero, ($s5)
/* E5C4 8000D9C4 AEA00008 */  sw         $zero, 8($s5)
/* E5C8 8000D9C8 AEA00010 */  sw         $zero, 0x10($s5)
.L8000D9CC:
/* E5CC 8000D9CC 8FBE0030 */  lw         $fp, 0x30($sp)
/* E5D0 8000D9D0 8FB7002C */  lw         $s7, 0x2c($sp)
/* E5D4 8000D9D4 8FB60028 */  lw         $s6, 0x28($sp)
/* E5D8 8000D9D8 8FB50024 */  lw         $s5, 0x24($sp)
/* E5DC 8000D9DC 8FB40020 */  lw         $s4, 0x20($sp)
/* E5E0 8000D9E0 8FB3001C */  lw         $s3, 0x1c($sp)
/* E5E4 8000D9E4 8FB20018 */  lw         $s2, 0x18($sp)
/* E5E8 8000D9E8 8FB10014 */  lw         $s1, 0x14($sp)
/* E5EC 8000D9EC 8FB00010 */  lw         $s0, 0x10($sp)
/* E5F0 8000D9F0 03E00008 */  jr         $ra
/* E5F4 8000D9F4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel ofunc_zoneengine_free
/* E5F8 8000D9F8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* E5FC 8000D9FC 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* E600 8000DA00 AFB50024 */  sw         $s5, 0x24($sp)
/* E604 8000DA04 24556988 */  addiu      $s5, $v0, %lo(zoneDatMatrix)
/* E608 8000DA08 AFB20018 */  sw         $s2, 0x18($sp)
/* E60C 8000DA0C 00009021 */  addu       $s2, $zero, $zero
/* E610 8000DA10 AFB7002C */  sw         $s7, 0x2c($sp)
/* E614 8000DA14 3C17800E */  lui        $s7, 0x800e
/* E618 8000DA18 AFB60028 */  sw         $s6, 0x28($sp)
/* E61C 8000DA1C 3C160001 */  lui        $s6, 1
/* E620 8000DA20 AFBF0030 */  sw         $ra, 0x30($sp)
/* E624 8000DA24 AFB40020 */  sw         $s4, 0x20($sp)
/* E628 8000DA28 AFB3001C */  sw         $s3, 0x1c($sp)
/* E62C 8000DA2C AFB10014 */  sw         $s1, 0x14($sp)
/* E630 8000DA30 AFB00010 */  sw         $s0, 0x10($sp)
/* E634 8000DA34 26540001 */  addiu      $s4, $s2, 1
.L8000DA38:
/* E638 8000DA38 3C110001 */  lui        $s1, 1
/* E63C 8000DA3C 00129840 */  sll        $s3, $s2, 1
/* E640 8000DA40 02721021 */  addu       $v0, $s3, $s2
/* E644 8000DA44 00021140 */  sll        $v0, $v0, 5
/* E648 8000DA48 02A28021 */  addu       $s0, $s5, $v0
.L8000DA4C:
/* E64C 8000DA4C 02002021 */  addu       $a0, $s0, $zero
/* E650 8000DA50 24050001 */  addiu      $a1, $zero, 1
/* E654 8000DA54 0C0035FB */  jal        func_8000D7EC
/* E658 8000DA58 00003021 */   addu      $a2, $zero, $zero
/* E65C 8000DA5C 02201021 */  addu       $v0, $s1, $zero
/* E660 8000DA60 02368821 */  addu       $s1, $s1, $s6
/* E664 8000DA64 00021403 */  sra        $v0, $v0, 0x10
/* E668 8000DA68 28420003 */  slti       $v0, $v0, 3
/* E66C 8000DA6C 1440FFF7 */  bnez       $v0, .L8000DA4C
/* E670 8000DA70 26100020 */   addiu     $s0, $s0, 0x20
/* E674 8000DA74 02722021 */  addu       $a0, $s3, $s2
/* E678 8000DA78 00042140 */  sll        $a0, $a0, 5
/* E67C 8000DA7C 02A42021 */  addu       $a0, $s5, $a0
/* E680 8000DA80 26E58300 */  addiu      $a1, $s7, -0x7d00
/* E684 8000DA84 0C02600C */  jal        Free
/* E688 8000DA88 2406040A */   addiu     $a2, $zero, 0x40a
/* E68C 8000DA8C 00141400 */  sll        $v0, $s4, 0x10
/* E690 8000DA90 00029403 */  sra        $s2, $v0, 0x10
/* E694 8000DA94 2A430003 */  slti       $v1, $s2, 3
/* E698 8000DA98 1460FFE7 */  bnez       $v1, .L8000DA38
/* E69C 8000DA9C 26540001 */   addiu     $s4, $s2, 1
/* E6A0 8000DAA0 02A02021 */  addu       $a0, $s5, $zero
/* E6A4 8000DAA4 26E58300 */  addiu      $a1, $s7, -0x7d00
/* E6A8 8000DAA8 0C02600C */  jal        Free
/* E6AC 8000DAAC 2406040C */   addiu     $a2, $zero, 0x40c
/* E6B0 8000DAB0 8FBF0030 */  lw         $ra, 0x30($sp)
/* E6B4 8000DAB4 8FB7002C */  lw         $s7, 0x2c($sp)
/* E6B8 8000DAB8 8FB60028 */  lw         $s6, 0x28($sp)
/* E6BC 8000DABC 8FB50024 */  lw         $s5, 0x24($sp)
/* E6C0 8000DAC0 8FB40020 */  lw         $s4, 0x20($sp)
/* E6C4 8000DAC4 8FB3001C */  lw         $s3, 0x1c($sp)
/* E6C8 8000DAC8 8FB20018 */  lw         $s2, 0x18($sp)
/* E6CC 8000DACC 8FB10014 */  lw         $s1, 0x14($sp)
/* E6D0 8000DAD0 8FB00010 */  lw         $s0, 0x10($sp)
/* E6D4 8000DAD4 03E00008 */  jr         $ra
/* E6D8 8000DAD8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8000DADC
/* E6DC 8000DADC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* E6E0 8000DAE0 AFBF0010 */  sw         $ra, 0x10($sp)
/* E6E4 8000DAE4 8CA20000 */  lw         $v0, ($a1)
/* E6E8 8000DAE8 1040002C */  beqz       $v0, .L8000DB9C
/* E6EC 8000DAEC 8FBF0010 */   lw        $ra, 0x10($sp)
/* E6F0 8000DAF0 00404021 */  addu       $t0, $v0, $zero
/* E6F4 8000DAF4 240C0003 */  addiu      $t4, $zero, 3
/* E6F8 8000DAF8 3C0A0001 */  lui        $t2, 1
/* E6FC 8000DAFC 00004821 */  addu       $t1, $zero, $zero
/* E700 8000DB00 3C0B0001 */  lui        $t3, 1
.L8000DB04:
/* E704 8000DB04 3C070001 */  lui        $a3, 1
/* E708 8000DB08 00893021 */  addu       $a2, $a0, $t1
.L8000DB0C:
/* E70C 8000DB0C 8CC20000 */  lw         $v0, ($a2)
/* E710 8000DB10 14480016 */  bne        $v0, $t0, .L8000DB6C
/* E714 8000DB14 00E01021 */   addu      $v0, $a3, $zero
/* E718 8000DB18 8CC30008 */  lw         $v1, 8($a2)
/* E71C 8000DB1C 8CA20008 */  lw         $v0, 8($a1)
/* E720 8000DB20 14620012 */  bne        $v1, $v0, .L8000DB6C
/* E724 8000DB24 00E01021 */   addu      $v0, $a3, $zero
/* E728 8000DB28 8CC20004 */  lw         $v0, 4($a2)
/* E72C 8000DB2C 8CC3000C */  lw         $v1, 0xc($a2)
/* E730 8000DB30 ACA20004 */  sw         $v0, 4($a1)
/* E734 8000DB34 8CC40014 */  lw         $a0, 0x14($a2)
/* E738 8000DB38 ACA3000C */  sw         $v1, 0xc($a1)
/* E73C 8000DB3C ACA40014 */  sw         $a0, 0x14($a1)
/* E740 8000DB40 90C2001C */  lbu        $v0, 0x1c($a2)
/* E744 8000DB44 00C02021 */  addu       $a0, $a2, $zero
/* E748 8000DB48 A0A2001C */  sb         $v0, 0x1c($a1)
/* E74C 8000DB4C 8CC30018 */  lw         $v1, 0x18($a2)
/* E750 8000DB50 24060020 */  addiu      $a2, $zero, 0x20
/* E754 8000DB54 A0AC001E */  sb         $t4, 0x1e($a1)
/* E758 8000DB58 ACA30018 */  sw         $v1, 0x18($a1)
/* E75C 8000DB5C 0C026380 */  jal        Calloc
/* E760 8000DB60 00002821 */   addu      $a1, $zero, $zero
/* E764 8000DB64 080036E7 */  j          .L8000DB9C
/* E768 8000DB68 8FBF0010 */   lw        $ra, 0x10($sp)
.L8000DB6C:
/* E76C 8000DB6C 00EB3821 */  addu       $a3, $a3, $t3
/* E770 8000DB70 00021403 */  sra        $v0, $v0, 0x10
/* E774 8000DB74 28420003 */  slti       $v0, $v0, 3
/* E778 8000DB78 1440FFE4 */  bnez       $v0, .L8000DB0C
/* E77C 8000DB7C 24C60020 */   addiu     $a2, $a2, 0x20
/* E780 8000DB80 01401021 */  addu       $v0, $t2, $zero
/* E784 8000DB84 014B5021 */  addu       $t2, $t2, $t3
/* E788 8000DB88 00021403 */  sra        $v0, $v0, 0x10
/* E78C 8000DB8C 28420003 */  slti       $v0, $v0, 3
/* E790 8000DB90 1440FFDC */  bnez       $v0, .L8000DB04
/* E794 8000DB94 25290060 */   addiu     $t1, $t1, 0x60
/* E798 8000DB98 8FBF0010 */  lw         $ra, 0x10($sp)
.L8000DB9C:
/* E79C 8000DB9C 03E00008 */  jr         $ra
/* E7A0 8000DBA0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel checkToggleZoneScene
/* E7A4 8000DBA4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* E7A8 8000DBA8 AFB00010 */  sw         $s0, 0x10($sp)
/* E7AC 8000DBAC 00808021 */  addu       $s0, $a0, $zero
/* E7B0 8000DBB0 AFBF0014 */  sw         $ra, 0x14($sp)
/* E7B4 8000DBB4 8E020004 */  lw         $v0, 4($s0)
/* E7B8 8000DBB8 10400005 */  beqz       $v0, .L8000DBD0
/* E7BC 8000DBBC 3C04800E */   lui       $a0, %hi(D_800D83C0)
/* E7C0 8000DBC0 248483C0 */  addiu      $a0, $a0, %lo(D_800D83C0)
/* E7C4 8000DBC4 3C05800E */  lui        $a1, %hi(D_800D83D8)
/* E7C8 8000DBC8 0C025F2D */  jal        manualCrash
/* E7CC 8000DBCC 24A583D8 */   addiu     $a1, $a1, %lo(D_800D83D8)
.L8000DBD0:
/* E7D0 8000DBD0 8E030000 */  lw         $v1, ($s0)
/* E7D4 8000DBD4 24020EA9 */  addiu      $v0, $zero, 0xea9
/* E7D8 8000DBD8 10620005 */  beq        $v1, $v0, .L8000DBF0
/* E7DC 8000DBDC 240211F9 */   addiu     $v0, $zero, 0x11f9
/* E7E0 8000DBE0 10620009 */  beq        $v1, $v0, .L8000DC08
/* E7E4 8000DBE4 8FBF0014 */   lw        $ra, 0x14($sp)
/* E7E8 8000DBE8 08003709 */  j          .L8000DC24
/* E7EC 8000DBEC 8FB00010 */   lw        $s0, 0x10($sp)
.L8000DBF0:
/* E7F0 8000DBF0 0C009168 */  jal        get_event_flag
/* E7F4 8000DBF4 24041399 */   addiu     $a0, $zero, 0x1399
/* E7F8 8000DBF8 10400008 */  beqz       $v0, .L8000DC1C
/* E7FC 8000DBFC 240235BA */   addiu     $v0, $zero, 0x35ba
/* E800 8000DC00 08003707 */  j          .L8000DC1C
/* E804 8000DC04 AE020000 */   sw        $v0, ($s0)
.L8000DC08:
/* E808 8000DC08 0C009168 */  jal        get_event_flag
/* E80C 8000DC0C 24041399 */   addiu     $a0, $zero, 0x1399
/* E810 8000DC10 10400002 */  beqz       $v0, .L8000DC1C
/* E814 8000DC14 240235AF */   addiu     $v0, $zero, 0x35af
/* E818 8000DC18 AE020000 */  sw         $v0, ($s0)
.L8000DC1C:
/* E81C 8000DC1C 8FBF0014 */  lw         $ra, 0x14($sp)
/* E820 8000DC20 8FB00010 */  lw         $s0, 0x10($sp)
.L8000DC24:
/* E824 8000DC24 03E00008 */  jr         $ra
/* E828 8000DC28 27BD0018 */   addiu     $sp, $sp, 0x18

glabel MakeGameZoneNames
/* E82C 8000DC2C 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* E830 8000DC30 00042400 */  sll        $a0, $a0, 0x10
/* E834 8000DC34 00042403 */  sra        $a0, $a0, 0x10
/* E838 8000DC38 00052C00 */  sll        $a1, $a1, 0x10
/* E83C 8000DC3C AFBE0040 */  sw         $fp, 0x40($sp)
/* E840 8000DC40 0005F403 */  sra        $fp, $a1, 0x10
/* E844 8000DC44 3082FFFF */  andi       $v0, $a0, 0xffff
/* E848 8000DC48 2C420017 */  sltiu      $v0, $v0, 0x17
/* E84C 8000DC4C AFBF0044 */  sw         $ra, 0x44($sp)
/* E850 8000DC50 AFB7003C */  sw         $s7, 0x3c($sp)
/* E854 8000DC54 AFB60038 */  sw         $s6, 0x38($sp)
/* E858 8000DC58 AFB50034 */  sw         $s5, 0x34($sp)
/* E85C 8000DC5C AFB40030 */  sw         $s4, 0x30($sp)
/* E860 8000DC60 AFB3002C */  sw         $s3, 0x2c($sp)
/* E864 8000DC64 AFB20028 */  sw         $s2, 0x28($sp)
/* E868 8000DC68 AFB10024 */  sw         $s1, 0x24($sp)
/* E86C 8000DC6C AFB00020 */  sw         $s0, 0x20($sp)
/* E870 8000DC70 10400005 */  beqz       $v0, .L8000DC88
/* E874 8000DC74 AFA40018 */   sw        $a0, 0x18($sp)
/* E878 8000DC78 33C2FFFF */  andi       $v0, $fp, 0xffff
/* E87C 8000DC7C 2C42001F */  sltiu      $v0, $v0, 0x1f
/* E880 8000DC80 14400012 */  bnez       $v0, .L8000DCCC
/* E884 8000DC84 00009021 */   addu      $s2, $zero, $zero
.L8000DC88:
/* E888 8000DC88 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* E88C 8000DC8C 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* E890 8000DC90 02002021 */  addu       $a0, $s0, $zero
/* E894 8000DC94 3C05800E */  lui        $a1, %hi(D_800D83F0)
/* E898 8000DC98 24A583F0 */  addiu      $a1, $a1, %lo(D_800D83F0)
/* E89C 8000DC9C 24020016 */  addiu      $v0, $zero, 0x16
/* E8A0 8000DCA0 2403001E */  addiu      $v1, $zero, 0x1e
/* E8A4 8000DCA4 8FA60018 */  lw         $a2, 0x18($sp)
/* E8A8 8000DCA8 03C03821 */  addu       $a3, $fp, $zero
/* E8AC 8000DCAC AFA20010 */  sw         $v0, 0x10($sp)
/* E8B0 8000DCB0 0C0333AC */  jal        sprintf
/* E8B4 8000DCB4 AFA30014 */   sw        $v1, 0x14($sp)
/* E8B8 8000DCB8 3C04800E */  lui        $a0, %hi(D_800D8424)
/* E8BC 8000DCBC 24848424 */  addiu      $a0, $a0, %lo(D_800D8424)
/* E8C0 8000DCC0 0C025F2D */  jal        manualCrash
/* E8C4 8000DCC4 02002821 */   addu      $a1, $s0, $zero
/* E8C8 8000DCC8 00009021 */  addu       $s2, $zero, $zero
.L8000DCCC:
/* E8CC 8000DCCC 3C02800E */  lui        $v0, %hi(gGlobals)
/* E8D0 8000DCD0 8FA30018 */  lw         $v1, 0x18($sp)
/* E8D4 8000DCD4 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* E8D8 8000DCD8 A45E0374 */  sh         $fp, 0x374($v0)
/* E8DC 8000DCDC A4430372 */  sh         $v1, 0x372($v0)
/* E8E0 8000DCE0 00003021 */  addu       $a2, $zero, $zero
.L8000DCE4:
/* E8E4 8000DCE4 26570001 */  addiu      $s7, $s2, 1
/* E8E8 8000DCE8 00121040 */  sll        $v0, $s2, 1
/* E8EC 8000DCEC 00521021 */  addu       $v0, $v0, $s2
/* E8F0 8000DCF0 0002B140 */  sll        $s6, $v0, 5
/* E8F4 8000DCF4 8FA40018 */  lw         $a0, 0x18($sp)
/* E8F8 8000DCF8 3C130001 */  lui        $s3, 1
/* E8FC 8000DCFC 27D1FFFF */  addiu      $s1, $fp, -1
/* E900 8000DD00 00921821 */  addu       $v1, $a0, $s2
/* E904 8000DD04 2463FFFF */  addiu      $v1, $v1, -1
/* E908 8000DD08 00031C00 */  sll        $v1, $v1, 0x10
/* E90C 8000DD0C 00031C03 */  sra        $v1, $v1, 0x10
/* E910 8000DD10 2462FFFF */  addiu      $v0, $v1, -1
/* E914 8000DD14 2C550015 */  sltiu      $s5, $v0, 0x15
/* E918 8000DD18 00032040 */  sll        $a0, $v1, 1
/* E91C 8000DD1C 00832021 */  addu       $a0, $a0, $v1
/* E920 8000DD20 00041100 */  sll        $v0, $a0, 4
/* E924 8000DD24 00441023 */  subu       $v0, $v0, $a0
/* E928 8000DD28 0002A080 */  sll        $s4, $v0, 2
.L8000DD2C:
/* E92C 8000DD2C 00061140 */  sll        $v0, $a2, 5
/* E930 8000DD30 3C05800E */  lui        $a1, %hi(zoneDatMatrix)
/* E934 8000DD34 24A56988 */  addiu      $a1, $a1, %lo(zoneDatMatrix)
/* E938 8000DD38 00451021 */  addu       $v0, $v0, $a1
/* E93C 8000DD3C 02C28021 */  addu       $s0, $s6, $v0
/* E940 8000DD40 02002021 */  addu       $a0, $s0, $zero
/* E944 8000DD44 0C0035B9 */  jal        init_some_map_data
/* E948 8000DD48 02402821 */   addu      $a1, $s2, $zero
/* E94C 8000DD4C 00111400 */  sll        $v0, $s1, 0x10
/* E950 8000DD50 12A00019 */  beqz       $s5, .L8000DDB8
/* E954 8000DD54 00021C03 */   sra       $v1, $v0, 0x10
/* E958 8000DD58 2462FFFF */  addiu      $v0, $v1, -1
/* E95C 8000DD5C 2C42001D */  sltiu      $v0, $v0, 0x1d
/* E960 8000DD60 10400015 */  beqz       $v0, .L8000DDB8
/* E964 8000DD64 00031040 */   sll       $v0, $v1, 1
/* E968 8000DD68 00431021 */  addu       $v0, $v0, $v1
/* E96C 8000DD6C 00021040 */  sll        $v0, $v0, 1
/* E970 8000DD70 00541021 */  addu       $v0, $v0, $s4
/* E974 8000DD74 3C04800F */  lui        $a0, %hi(map_index_matrix)
/* E978 8000DD78 2484B690 */  addiu      $a0, $a0, %lo(map_index_matrix)
/* E97C 8000DD7C 00441821 */  addu       $v1, $v0, $a0
/* E980 8000DD80 3C05800F */  lui        $a1, %hi(map_index_matrix+0x2)
/* E984 8000DD84 24A5B692 */  addiu      $a1, $a1, %lo(map_index_matrix+0x2)
/* E988 8000DD88 00452021 */  addu       $a0, $v0, $a1
/* E98C 8000DD8C 3C05800F */  lui        $a1, %hi(map_index_matrix+0x4)
/* E990 8000DD90 24A5B694 */  addiu      $a1, $a1, %lo(map_index_matrix+0x4)
/* E994 8000DD94 00451021 */  addu       $v0, $v0, $a1
/* E998 8000DD98 84650000 */  lh         $a1, ($v1)
/* E99C 8000DD9C 84860000 */  lh         $a2, ($a0)
/* E9A0 8000DDA0 84430000 */  lh         $v1, ($v0)
/* E9A4 8000DDA4 02002021 */  addu       $a0, $s0, $zero
/* E9A8 8000DDA8 AE050000 */  sw         $a1, ($s0)
/* E9AC 8000DDAC AE060008 */  sw         $a2, 8($s0)
/* E9B0 8000DDB0 0C0036E9 */  jal        checkToggleZoneScene
/* E9B4 8000DDB4 AE030010 */   sw        $v1, 0x10($s0)
.L8000DDB8:
/* E9B8 8000DDB8 02601821 */  addu       $v1, $s3, $zero
/* E9BC 8000DDBC 3C020001 */  lui        $v0, 1
/* E9C0 8000DDC0 02629821 */  addu       $s3, $s3, $v0
/* E9C4 8000DDC4 00033403 */  sra        $a2, $v1, 0x10
/* E9C8 8000DDC8 28C20003 */  slti       $v0, $a2, 3
/* E9CC 8000DDCC 1440FFD7 */  bnez       $v0, .L8000DD2C
/* E9D0 8000DDD0 26310001 */   addiu     $s1, $s1, 1
/* E9D4 8000DDD4 00171400 */  sll        $v0, $s7, 0x10
/* E9D8 8000DDD8 00029403 */  sra        $s2, $v0, 0x10
/* E9DC 8000DDDC 2A430003 */  slti       $v1, $s2, 3
/* E9E0 8000DDE0 5460FFC0 */  bnel       $v1, $zero, .L8000DCE4
/* E9E4 8000DDE4 00003021 */   addu      $a2, $zero, $zero
/* E9E8 8000DDE8 8FBF0044 */  lw         $ra, 0x44($sp)
/* E9EC 8000DDEC 8FBE0040 */  lw         $fp, 0x40($sp)
/* E9F0 8000DDF0 8FB7003C */  lw         $s7, 0x3c($sp)
/* E9F4 8000DDF4 8FB60038 */  lw         $s6, 0x38($sp)
/* E9F8 8000DDF8 8FB50034 */  lw         $s5, 0x34($sp)
/* E9FC 8000DDFC 8FB40030 */  lw         $s4, 0x30($sp)
/* EA00 8000DE00 8FB3002C */  lw         $s3, 0x2c($sp)
/* EA04 8000DE04 8FB20028 */  lw         $s2, 0x28($sp)
/* EA08 8000DE08 8FB10024 */  lw         $s1, 0x24($sp)
/* EA0C 8000DE0C 8FB00020 */  lw         $s0, 0x20($sp)
/* EA10 8000DE10 03E00008 */  jr         $ra
/* EA14 8000DE14 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_8000DE18
/* EA18 8000DE18 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* EA1C 8000DE1C AFB00010 */  sw         $s0, 0x10($sp)
/* EA20 8000DE20 00808021 */  addu       $s0, $a0, $zero
/* EA24 8000DE24 AFB10014 */  sw         $s1, 0x14($sp)
/* EA28 8000DE28 30B100FF */  andi       $s1, $a1, 0xff
/* EA2C 8000DE2C 12000066 */  beqz       $s0, .L8000DFC8
/* EA30 8000DE30 AFBF0018 */   sw        $ra, 0x18($sp)
/* EA34 8000DE34 AE0001F4 */  sw         $zero, 0x1f4($s0)
/* EA38 8000DE38 0C0311DC */  jal        guMtxIdentF
/* EA3C 8000DE3C 26040088 */   addiu     $a0, $s0, 0x88
/* EA40 8000DE40 0C0311DC */  jal        guMtxIdentF
/* EA44 8000DE44 260400C8 */   addiu     $a0, $s0, 0xc8
/* EA48 8000DE48 0C029FEB */  jal        func_800A7FAC
/* EA4C 8000DE4C 02002021 */   addu      $a0, $s0, $zero
/* EA50 8000DE50 0C02A050 */  jal        func_800A8140
/* EA54 8000DE54 02002021 */   addu      $a0, $s0, $zero
/* EA58 8000DE58 0C029FE2 */  jal        func_800A7F88
/* EA5C 8000DE5C 02002021 */   addu      $a0, $s0, $zero
/* EA60 8000DE60 24020011 */  addiu      $v0, $zero, 0x11
/* EA64 8000DE64 16220005 */  bne        $s1, $v0, .L8000DE7C
/* EA68 8000DE68 00000000 */   nop
/* EA6C 8000DE6C 0C029FDD */  jal        func_800A7F74
/* EA70 8000DE70 02002021 */   addu      $a0, $s0, $zero
/* EA74 8000DE74 080037A2 */  j          .L8000DE88
/* EA78 8000DE78 2E220023 */   sltiu     $v0, $s1, 0x23
.L8000DE7C:
/* EA7C 8000DE7C 0C029FD9 */  jal        func_800A7F64
/* EA80 8000DE80 02002021 */   addu      $a0, $s0, $zero
/* EA84 8000DE84 2E220023 */  sltiu      $v0, $s1, 0x23
.L8000DE88:
/* EA88 8000DE88 1040004F */  beqz       $v0, .L8000DFC8
/* EA8C 8000DE8C 3C02800E */   lui       $v0, %hi(D_800D8438)
/* EA90 8000DE90 24428438 */  addiu      $v0, $v0, %lo(D_800D8438)
/* EA94 8000DE94 00111880 */  sll        $v1, $s1, 2
/* EA98 8000DE98 00621821 */  addu       $v1, $v1, $v0
/* EA9C 8000DE9C 8C640000 */  lw         $a0, ($v1)
/* EAA0 8000DEA0 00800008 */  jr         $a0
/* EAA4 8000DEA4 00000000 */   nop
/* EAA8 8000DEA8 3C02800E */  lui        $v0, %hi(gGlobals)
/* EAAC 8000DEAC 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* EAB0 8000DEB0 C440037C */  lwc1       $f0, 0x37c($v0)
/* EAB4 8000DEB4 C4420380 */  lwc1       $f2, 0x380($v0)
/* EAB8 8000DEB8 46000007 */  neg.s      $f0, $f0
/* EABC 8000DEBC 46001087 */  neg.s      $f2, $f2
/* EAC0 8000DEC0 44050000 */  mfc1       $a1, $f0
/* EAC4 8000DEC4 44071000 */  mfc1       $a3, $f2
/* EAC8 8000DEC8 080037DE */  j          .L8000DF78
/* EACC 8000DECC 02002021 */   addu      $a0, $s0, $zero
/* EAD0 8000DED0 3C02800E */  lui        $v0, %hi(MapCellSize)
/* EAD4 8000DED4 C4426C24 */  lwc1       $f2, %lo(MapCellSize)($v0)
/* EAD8 8000DED8 44800000 */  mtc1       $zero, $f0
/* EADC 8000DEDC 46001087 */  neg.s      $f2, $f2
/* EAE0 8000DEE0 44060000 */  mfc1       $a2, $f0
/* EAE4 8000DEE4 44051000 */  mfc1       $a1, $f2
/* EAE8 8000DEE8 080037E7 */  j          .L8000DF9C
/* EAEC 8000DEEC 02002021 */   addu      $a0, $s0, $zero
/* EAF0 8000DEF0 02002021 */  addu       $a0, $s0, $zero
/* EAF4 8000DEF4 3C02800E */  lui        $v0, %hi(gGlobals)
/* EAF8 8000DEF8 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* EAFC 8000DEFC C440037C */  lwc1       $f0, 0x37c($v0)
/* EB00 8000DF00 46000007 */  neg.s      $f0, $f0
/* EB04 8000DF04 44050000 */  mfc1       $a1, $f0
/* EB08 8000DF08 080037DE */  j          .L8000DF78
/* EB0C 8000DF0C 8C470380 */   lw        $a3, 0x380($v0)
/* EB10 8000DF10 3C02800E */  lui        $v0, %hi(MapCellSize+0x4)
/* EB14 8000DF14 C4426C28 */  lwc1       $f2, %lo(MapCellSize+0x4)($v0)
/* EB18 8000DF18 44800000 */  mtc1       $zero, $f0
/* EB1C 8000DF1C 46001087 */  neg.s      $f2, $f2
/* EB20 8000DF20 44050000 */  mfc1       $a1, $f0
/* EB24 8000DF24 44071000 */  mfc1       $a3, $f2
/* EB28 8000DF28 080037DE */  j          .L8000DF78
/* EB2C 8000DF2C 02002021 */   addu      $a0, $s0, $zero
/* EB30 8000DF30 44800000 */  mtc1       $zero, $f0
/* EB34 8000DF34 44050000 */  mfc1       $a1, $f0
/* EB38 8000DF38 02002021 */  addu       $a0, $s0, $zero
/* EB3C 8000DF3C 080037E7 */  j          .L8000DF9C
/* EB40 8000DF40 00A03021 */   addu      $a2, $a1, $zero
/* EB44 8000DF44 02002021 */  addu       $a0, $s0, $zero
/* EB48 8000DF48 44800000 */  mtc1       $zero, $f0
/* EB4C 8000DF4C 3C02800E */  lui        $v0, %hi(MapCellSize+0x4)
/* EB50 8000DF50 44050000 */  mfc1       $a1, $f0
/* EB54 8000DF54 080037DE */  j          .L8000DF78
/* EB58 8000DF58 8C476C28 */   lw        $a3, %lo(MapCellSize+0x4)($v0)
/* EB5C 8000DF5C 02002021 */  addu       $a0, $s0, $zero
/* EB60 8000DF60 3C02800E */  lui        $v0, %hi(gGlobals)
/* EB64 8000DF64 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* EB68 8000DF68 C4400380 */  lwc1       $f0, 0x380($v0)
/* EB6C 8000DF6C 8C45037C */  lw         $a1, 0x37c($v0)
/* EB70 8000DF70 46000007 */  neg.s      $f0, $f0
/* EB74 8000DF74 44070000 */  mfc1       $a3, $f0
.L8000DF78:
/* EB78 8000DF78 0C029D44 */  jal        anidat_setMaxtrixA_3
/* EB7C 8000DF7C 00003021 */   addu      $a2, $zero, $zero
/* EB80 8000DF80 080037F3 */  j          .L8000DFCC
/* EB84 8000DF84 8FBF0018 */   lw        $ra, 0x18($sp)
/* EB88 8000DF88 02002021 */  addu       $a0, $s0, $zero
/* EB8C 8000DF8C 44800000 */  mtc1       $zero, $f0
/* EB90 8000DF90 3C02800E */  lui        $v0, %hi(MapCellSize)
/* EB94 8000DF94 44060000 */  mfc1       $a2, $f0
/* EB98 8000DF98 8C456C24 */  lw         $a1, %lo(MapCellSize)($v0)
.L8000DF9C:
/* EB9C 8000DF9C 0C029D44 */  jal        anidat_setMaxtrixA_3
/* EBA0 8000DFA0 00003821 */   addu      $a3, $zero, $zero
/* EBA4 8000DFA4 080037F3 */  j          .L8000DFCC
/* EBA8 8000DFA8 8FBF0018 */   lw        $ra, 0x18($sp)
/* EBAC 8000DFAC 02002021 */  addu       $a0, $s0, $zero
/* EBB0 8000DFB0 3C02800E */  lui        $v0, %hi(gGlobals)
/* EBB4 8000DFB4 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* EBB8 8000DFB8 8C45037C */  lw         $a1, 0x37c($v0)
/* EBBC 8000DFBC 8C470380 */  lw         $a3, 0x380($v0)
/* EBC0 8000DFC0 0C029D44 */  jal        anidat_setMaxtrixA_3
/* EBC4 8000DFC4 00003021 */   addu      $a2, $zero, $zero
.L8000DFC8:
/* EBC8 8000DFC8 8FBF0018 */  lw         $ra, 0x18($sp)
.L8000DFCC:
/* EBCC 8000DFCC 8FB10014 */  lw         $s1, 0x14($sp)
/* EBD0 8000DFD0 8FB00010 */  lw         $s0, 0x10($sp)
/* EBD4 8000DFD4 03E00008 */  jr         $ra
/* EBD8 8000DFD8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8000DFDC
/* EBDC 8000DFDC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* EBE0 8000DFE0 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* EBE4 8000DFE4 AFB40020 */  sw         $s4, 0x20($sp)
/* EBE8 8000DFE8 24546988 */  addiu      $s4, $v0, %lo(zoneDatMatrix)
/* EBEC 8000DFEC 00002021 */  addu       $a0, $zero, $zero
/* EBF0 8000DFF0 AFB3001C */  sw         $s3, 0x1c($sp)
/* EBF4 8000DFF4 3C130001 */  lui        $s3, 1
/* EBF8 8000DFF8 AFBF0024 */  sw         $ra, 0x24($sp)
/* EBFC 8000DFFC AFB20018 */  sw         $s2, 0x18($sp)
/* EC00 8000E000 AFB10014 */  sw         $s1, 0x14($sp)
/* EC04 8000E004 AFB00010 */  sw         $s0, 0x10($sp)
/* EC08 8000E008 24920001 */  addiu      $s2, $a0, 1
.L8000E00C:
/* EC0C 8000E00C 3C110001 */  lui        $s1, 1
/* EC10 8000E010 00041040 */  sll        $v0, $a0, 1
/* EC14 8000E014 00441021 */  addu       $v0, $v0, $a0
/* EC18 8000E018 00021140 */  sll        $v0, $v0, 5
/* EC1C 8000E01C 02828021 */  addu       $s0, $s4, $v0
.L8000E020:
/* EC20 8000E020 02002021 */  addu       $a0, $s0, $zero
/* EC24 8000E024 24050001 */  addiu      $a1, $zero, 1
/* EC28 8000E028 0C0035FB */  jal        func_8000D7EC
/* EC2C 8000E02C 00003021 */   addu      $a2, $zero, $zero
/* EC30 8000E030 02201021 */  addu       $v0, $s1, $zero
/* EC34 8000E034 02338821 */  addu       $s1, $s1, $s3
/* EC38 8000E038 00021403 */  sra        $v0, $v0, 0x10
/* EC3C 8000E03C 28420003 */  slti       $v0, $v0, 3
/* EC40 8000E040 1440FFF7 */  bnez       $v0, .L8000E020
/* EC44 8000E044 26100020 */   addiu     $s0, $s0, 0x20
/* EC48 8000E048 00121400 */  sll        $v0, $s2, 0x10
/* EC4C 8000E04C 00022403 */  sra        $a0, $v0, 0x10
/* EC50 8000E050 28830003 */  slti       $v1, $a0, 3
/* EC54 8000E054 1460FFED */  bnez       $v1, .L8000E00C
/* EC58 8000E058 24920001 */   addiu     $s2, $a0, 1
/* EC5C 8000E05C 8FBF0024 */  lw         $ra, 0x24($sp)
/* EC60 8000E060 8FB40020 */  lw         $s4, 0x20($sp)
/* EC64 8000E064 8FB3001C */  lw         $s3, 0x1c($sp)
/* EC68 8000E068 8FB20018 */  lw         $s2, 0x18($sp)
/* EC6C 8000E06C 8FB10014 */  lw         $s1, 0x14($sp)
/* EC70 8000E070 8FB00010 */  lw         $s0, 0x10($sp)
/* EC74 8000E074 03E00008 */  jr         $ra
/* EC78 8000E078 27BD0028 */   addiu     $sp, $sp, 0x28

glabel FreeZoneEngineMemory
/* EC7C 8000E07C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* EC80 8000E080 3C04800E */  lui        $a0, %hi(D_800D84C4)
/* EC84 8000E084 248484C4 */  addiu      $a0, $a0, %lo(D_800D84C4)
/* EC88 8000E088 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* EC8C 8000E08C AFB7002C */  sw         $s7, 0x2c($sp)
/* EC90 8000E090 24576988 */  addiu      $s7, $v0, %lo(zoneDatMatrix)
/* EC94 8000E094 AFBF0030 */  sw         $ra, 0x30($sp)
/* EC98 8000E098 AFB60028 */  sw         $s6, 0x28($sp)
/* EC9C 8000E09C AFB50024 */  sw         $s5, 0x24($sp)
/* ECA0 8000E0A0 AFB40020 */  sw         $s4, 0x20($sp)
/* ECA4 8000E0A4 AFB3001C */  sw         $s3, 0x1c($sp)
/* ECA8 8000E0A8 AFB20018 */  sw         $s2, 0x18($sp)
/* ECAC 8000E0AC AFB10014 */  sw         $s1, 0x14($sp)
/* ECB0 8000E0B0 0C00B6B8 */  jal        debug_queue
/* ECB4 8000E0B4 AFB00010 */   sw        $s0, 0x10($sp)
/* ECB8 8000E0B8 3C03800F */  lui        $v1, %hi(D_800E8DC4)
/* ECBC 8000E0BC 24020078 */  addiu      $v0, $zero, 0x78
/* ECC0 8000E0C0 3C06800F */  lui        $a2, 0x800f
/* ECC4 8000E0C4 3C10800F */  lui        $s0, %hi(FreeZoneEngineTimestamp)
/* ECC8 8000E0C8 A4628DC4 */  sh         $v0, %lo(D_800E8DC4)($v1)
/* ECCC 8000E0CC 3C03800F */  lui        $v1, %hi(handeZoneEngineTimestamp)
/* ECD0 8000E0D0 8E058DA4 */  lw         $a1, %lo(FreeZoneEngineTimestamp)($s0)
/* ECD4 8000E0D4 8C648DA8 */  lw         $a0, %lo(handeZoneEngineTimestamp)($v1)
/* ECD8 8000E0D8 24020001 */  addiu      $v0, $zero, 1
/* ECDC 8000E0DC 14A40006 */  bne        $a1, $a0, .L8000E0F8
/* ECE0 8000E0E0 A4C28DC2 */   sh        $v0, -0x723e($a2)
/* ECE4 8000E0E4 3C04800E */  lui        $a0, %hi(D_800D84DC)
/* ECE8 8000E0E8 248484DC */  addiu      $a0, $a0, %lo(D_800D84DC)
/* ECEC 8000E0EC 3C05800E */  lui        $a1, %hi(D_800D84F4)
/* ECF0 8000E0F0 0C025F2D */  jal        manualCrash
/* ECF4 8000E0F4 24A584F4 */   addiu     $a1, $a1, %lo(D_800D84F4)
.L8000E0F8:
/* ECF8 8000E0F8 00008821 */  addu       $s1, $zero, $zero
/* ECFC 8000E0FC 8EE2FF28 */  lw         $v0, -0xd8($s7)
/* ED00 8000E100 3C160001 */  lui        $s6, 1
/* ED04 8000E104 AE028DA4 */  sw         $v0, -0x725c($s0)
/* ED08 8000E108 00001821 */  addu       $v1, $zero, $zero
.L8000E10C:
/* ED0C 8000E10C 26350001 */  addiu      $s5, $s1, 1
/* ED10 8000E110 0011A140 */  sll        $s4, $s1, 5
/* ED14 8000E114 3C130001 */  lui        $s3, 1
/* ED18 8000E118 00111040 */  sll        $v0, $s1, 1
/* ED1C 8000E11C 00511021 */  addu       $v0, $v0, $s1
/* ED20 8000E120 00021140 */  sll        $v0, $v0, 5
/* ED24 8000E124 02E29021 */  addu       $s2, $s7, $v0
/* ED28 8000E128 02408021 */  addu       $s0, $s2, $zero
.L8000E12C:
/* ED2C 8000E12C 16230007 */  bne        $s1, $v1, .L8000E14C
/* ED30 8000E130 02002021 */   addu      $a0, $s0, $zero
/* ED34 8000E134 02542021 */  addu       $a0, $s2, $s4
/* ED38 8000E138 00002821 */  addu       $a1, $zero, $zero
/* ED3C 8000E13C 0C0035FB */  jal        func_8000D7EC
/* ED40 8000E140 24060001 */   addiu     $a2, $zero, 1
/* ED44 8000E144 08003857 */  j          .L8000E15C
/* ED48 8000E148 02601821 */   addu      $v1, $s3, $zero
.L8000E14C:
/* ED4C 8000E14C 24050001 */  addiu      $a1, $zero, 1
/* ED50 8000E150 0C0035FB */  jal        func_8000D7EC
/* ED54 8000E154 24060001 */   addiu     $a2, $zero, 1
/* ED58 8000E158 02601821 */  addu       $v1, $s3, $zero
.L8000E15C:
/* ED5C 8000E15C 02769821 */  addu       $s3, $s3, $s6
/* ED60 8000E160 00031C03 */  sra        $v1, $v1, 0x10
/* ED64 8000E164 28620003 */  slti       $v0, $v1, 3
/* ED68 8000E168 1440FFF0 */  bnez       $v0, .L8000E12C
/* ED6C 8000E16C 26100020 */   addiu     $s0, $s0, 0x20
/* ED70 8000E170 00151400 */  sll        $v0, $s5, 0x10
/* ED74 8000E174 00028C03 */  sra        $s1, $v0, 0x10
/* ED78 8000E178 2A230003 */  slti       $v1, $s1, 3
/* ED7C 8000E17C 1460FFE3 */  bnez       $v1, .L8000E10C
/* ED80 8000E180 00001821 */   addu      $v1, $zero, $zero
/* ED84 8000E184 0C025A69 */  jal        noop_800969a4
/* ED88 8000E188 00000000 */   nop
/* ED8C 8000E18C 0C00630E */  jal        func_80018C38
/* ED90 8000E190 00000000 */   nop
/* ED94 8000E194 8FBF0030 */  lw         $ra, 0x30($sp)
/* ED98 8000E198 8FB7002C */  lw         $s7, 0x2c($sp)
/* ED9C 8000E19C 8FB60028 */  lw         $s6, 0x28($sp)
/* EDA0 8000E1A0 8FB50024 */  lw         $s5, 0x24($sp)
/* EDA4 8000E1A4 8FB40020 */  lw         $s4, 0x20($sp)
/* EDA8 8000E1A8 8FB3001C */  lw         $s3, 0x1c($sp)
/* EDAC 8000E1AC 8FB20018 */  lw         $s2, 0x18($sp)
/* EDB0 8000E1B0 8FB10014 */  lw         $s1, 0x14($sp)
/* EDB4 8000E1B4 8FB00010 */  lw         $s0, 0x10($sp)
/* EDB8 8000E1B8 03E00008 */  jr         $ra
/* EDBC 8000E1BC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel loading_map_data
/* EDC0 8000E1C0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* EDC4 8000E1C4 AFB10014 */  sw         $s1, 0x14($sp)
/* EDC8 8000E1C8 00808821 */  addu       $s1, $a0, $zero
/* EDCC 8000E1CC AFBF0018 */  sw         $ra, 0x18($sp)
/* EDD0 8000E1D0 AFB00010 */  sw         $s0, 0x10($sp)
/* EDD4 8000E1D4 8E22000C */  lw         $v0, 0xc($s1)
/* EDD8 8000E1D8 14400026 */  bnez       $v0, .L8000E274
/* EDDC 8000E1DC 8FBF0018 */   lw        $ra, 0x18($sp)
/* EDE0 8000E1E0 8E220008 */  lw         $v0, 8($s1)
/* EDE4 8000E1E4 10400023 */  beqz       $v0, .L8000E274
/* EDE8 8000E1E8 3C10800E */   lui       $s0, %hi(gGlobals)
/* EDEC 8000E1EC 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* EDF0 8000E1F0 8E022038 */  lw         $v0, 0x2038($s0)
/* EDF4 8000E1F4 AE220018 */  sw         $v0, 0x18($s1)
/* EDF8 8000E1F8 24420001 */  addiu      $v0, $v0, 1
/* EDFC 8000E1FC AE022038 */  sw         $v0, 0x2038($s0)
/* EE00 8000E200 0C029B65 */  jal        get_borg_9
/* EE04 8000E204 8E240008 */   lw        $a0, 8($s1)
/* EE08 8000E208 24440008 */  addiu      $a0, $v0, 8
/* EE0C 8000E20C 0C003462 */  jal        attachPhysicsProperties
/* EE10 8000E210 AE22000C */   sw        $v0, 0xc($s1)
/* EE14 8000E214 8E24000C */  lw         $a0, 0xc($s1)
/* EE18 8000E218 9225001D */  lbu        $a1, 0x1d($s1)
/* EE1C 8000E21C 0C006EA1 */  jal        render_ref_objs
/* EE20 8000E220 24840008 */   addiu     $a0, $a0, 8
/* EE24 8000E224 26040050 */  addiu      $a0, $s0, 0x50
/* EE28 8000E228 8E260018 */  lw         $a2, 0x18($s1)
/* EE2C 8000E22C 8E25000C */  lw         $a1, 0xc($s1)
/* EE30 8000E230 9227001D */  lbu        $a3, 0x1d($s1)
/* EE34 8000E234 0C00498A */  jal        look_for_monsterparties
/* EE38 8000E238 24A50008 */   addiu     $a1, $a1, 8
/* EE3C 8000E23C 260412F8 */  addiu      $a0, $s0, 0x12f8
/* EE40 8000E240 8E260018 */  lw         $a2, 0x18($s1)
/* EE44 8000E244 8E25000C */  lw         $a1, 0xc($s1)
/* EE48 8000E248 9227001D */  lbu        $a3, 0x1d($s1)
/* EE4C 8000E24C 0C015806 */  jal        audio_ref_objs
/* EE50 8000E250 24A50008 */   addiu     $a1, $a1, 8
/* EE54 8000E254 3C02800F */  lui        $v0, %hi(ref_obj_boulder)
/* EE58 8000E258 94438DB0 */  lhu        $v1, %lo(ref_obj_boulder)($v0)
/* EE5C 8000E25C 10600005 */  beqz       $v1, .L8000E274
/* EE60 8000E260 8FBF0018 */   lw        $ra, 0x18($sp)
/* EE64 8000E264 8E24000C */  lw         $a0, 0xc($s1)
/* EE68 8000E268 0C003DEB */  jal        ref_obj_boulders
/* EE6C 8000E26C 24840008 */   addiu     $a0, $a0, 8
/* EE70 8000E270 8FBF0018 */  lw         $ra, 0x18($sp)
.L8000E274:
/* EE74 8000E274 8FB10014 */  lw         $s1, 0x14($sp)
/* EE78 8000E278 8FB00010 */  lw         $s0, 0x10($sp)
/* EE7C 8000E27C 03E00008 */  jr         $ra
/* EE80 8000E280 27BD0020 */   addiu     $sp, $sp, 0x20

glabel loadGameBorgScenes
/* EE84 8000E284 27BDFE28 */  addiu      $sp, $sp, -0x1d8
/* EE88 8000E288 00044400 */  sll        $t0, $a0, 0x10
/* EE8C 8000E28C 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* EE90 8000E290 AFB601C8 */  sw         $s6, 0x1c8($sp)
/* EE94 8000E294 24566988 */  addiu      $s6, $v0, %lo(zoneDatMatrix)
/* EE98 8000E298 26C41D48 */  addiu      $a0, $s6, 0x1d48
/* EE9C 8000E29C 00053C00 */  sll        $a3, $a1, 0x10
/* EEA0 8000E2A0 24050001 */  addiu      $a1, $zero, 1
/* EEA4 8000E2A4 3C03800F */  lui        $v1, %hi(no_TP_vec3)
/* EEA8 8000E2A8 94668DC2 */  lhu        $a2, %lo(no_TP_vec3)($v1)
/* EEAC 8000E2AC 3C02800E */  lui        $v0, 0x800e
/* EEB0 8000E2B0 AFB101B4 */  sw         $s1, 0x1b4($sp)
/* EEB4 8000E2B4 00088C03 */  sra        $s1, $t0, 0x10
/* EEB8 8000E2B8 AFB201B8 */  sw         $s2, 0x1b8($sp)
/* EEBC 8000E2BC 00079403 */  sra        $s2, $a3, 0x10
/* EEC0 8000E2C0 AFBF01D4 */  sw         $ra, 0x1d4($sp)
/* EEC4 8000E2C4 AFBE01D0 */  sw         $fp, 0x1d0($sp)
/* EEC8 8000E2C8 AFB701CC */  sw         $s7, 0x1cc($sp)
/* EECC 8000E2CC AFB501C4 */  sw         $s5, 0x1c4($sp)
/* EED0 8000E2D0 AFB401C0 */  sw         $s4, 0x1c0($sp)
/* EED4 8000E2D4 AFB301BC */  sw         $s3, 0x1bc($sp)
/* EED8 8000E2D8 AFB001B0 */  sw         $s0, 0x1b0($sp)
/* EEDC 8000E2DC 244C8540 */  addiu      $t4, $v0, -0x7ac0
/* EEE0 8000E2E0 89890000 */  lwl        $t1, ($t4)
/* EEE4 8000E2E4 99890003 */  lwr        $t1, 3($t4)
/* EEE8 8000E2E8 898A0004 */  lwl        $t2, 4($t4)
/* EEEC 8000E2EC 998A0007 */  lwr        $t2, 7($t4)
/* EEF0 8000E2F0 898B0008 */  lwl        $t3, 8($t4)
/* EEF4 8000E2F4 998B000B */  lwr        $t3, 0xb($t4)
/* EEF8 8000E2F8 ABA90168 */  swl        $t1, 0x168($sp)
/* EEFC 8000E2FC BBA9016B */  swr        $t1, 0x16b($sp)
/* EF00 8000E300 ABAA016C */  swl        $t2, 0x16c($sp)
/* EF04 8000E304 BBAA016F */  swr        $t2, 0x16f($sp)
/* EF08 8000E308 ABAB0170 */  swl        $t3, 0x170($sp)
/* EF0C 8000E30C BBAB0173 */  swr        $t3, 0x173($sp)
/* EF10 8000E310 8989000C */  lwl        $t1, 0xc($t4)
/* EF14 8000E314 9989000F */  lwr        $t1, 0xf($t4)
/* EF18 8000E318 898A0010 */  lwl        $t2, 0x10($t4)
/* EF1C 8000E31C 998A0013 */  lwr        $t2, 0x13($t4)
/* EF20 8000E320 898B0014 */  lwl        $t3, 0x14($t4)
/* EF24 8000E324 998B0017 */  lwr        $t3, 0x17($t4)
/* EF28 8000E328 ABA90174 */  swl        $t1, 0x174($sp)
/* EF2C 8000E32C BBA90177 */  swr        $t1, 0x177($sp)
/* EF30 8000E330 ABAA0178 */  swl        $t2, 0x178($sp)
/* EF34 8000E334 BBAA017B */  swr        $t2, 0x17b($sp)
/* EF38 8000E338 ABAB017C */  swl        $t3, 0x17c($sp)
/* EF3C 8000E33C BBAB017F */  swr        $t3, 0x17f($sp)
/* EF40 8000E340 89890018 */  lwl        $t1, 0x18($t4)
/* EF44 8000E344 9989001B */  lwr        $t1, 0x1b($t4)
/* EF48 8000E348 898A001C */  lwl        $t2, 0x1c($t4)
/* EF4C 8000E34C 998A001F */  lwr        $t2, 0x1f($t4)
/* EF50 8000E350 ABA90180 */  swl        $t1, 0x180($sp)
/* EF54 8000E354 BBA90183 */  swr        $t1, 0x183($sp)
/* EF58 8000E358 ABAA0184 */  swl        $t2, 0x184($sp)
/* EF5C 8000E35C BBAA0187 */  swr        $t2, 0x187($sp)
/* EF60 8000E360 A4608DC2 */  sh         $zero, -0x723e($v1)
/* EF64 8000E364 2CC60001 */  sltiu      $a2, $a2, 1
/* EF68 8000E368 0C0357E6 */  jal        Process_queue_B
/* EF6C 8000E36C AFA601A8 */   sw        $a2, 0x1a8($sp)
/* EF70 8000E370 27BE0028 */  addiu      $fp, $sp, 0x28
/* EF74 8000E374 03C0A021 */  addu       $s4, $fp, $zero
/* EF78 8000E378 3C0F0001 */  lui        $t7, 1
/* EF7C 8000E37C 00007021 */  addu       $t6, $zero, $zero
/* EF80 8000E380 3C100001 */  lui        $s0, 1
.L8000E384:
/* EF84 8000E384 3C0D0001 */  lui        $t5, 1
/* EF88 8000E388 02CE6021 */  addu       $t4, $s6, $t6
/* EF8C 8000E38C 028E5821 */  addu       $t3, $s4, $t6
.L8000E390:
/* EF90 8000E390 01A05021 */  addu       $t2, $t5, $zero
/* EF94 8000E394 01B06821 */  addu       $t5, $t5, $s0
/* EF98 8000E398 8D820000 */  lw         $v0, ($t4)
/* EF9C 8000E39C 8D830004 */  lw         $v1, 4($t4)
/* EFA0 8000E3A0 8D840008 */  lw         $a0, 8($t4)
/* EFA4 8000E3A4 8D85000C */  lw         $a1, 0xc($t4)
/* EFA8 8000E3A8 8D860010 */  lw         $a2, 0x10($t4)
/* EFAC 8000E3AC 8D870014 */  lw         $a3, 0x14($t4)
/* EFB0 8000E3B0 9188001C */  lbu        $t0, 0x1c($t4)
/* EFB4 8000E3B4 8D890018 */  lw         $t1, 0x18($t4)
/* EFB8 8000E3B8 258C0020 */  addiu      $t4, $t4, 0x20
/* EFBC 8000E3BC 000A9C03 */  sra        $s3, $t2, 0x10
/* EFC0 8000E3C0 AD620000 */  sw         $v0, ($t3)
/* EFC4 8000E3C4 AD630004 */  sw         $v1, 4($t3)
/* EFC8 8000E3C8 AD640008 */  sw         $a0, 8($t3)
/* EFCC 8000E3CC AD65000C */  sw         $a1, 0xc($t3)
/* EFD0 8000E3D0 AD660010 */  sw         $a2, 0x10($t3)
/* EFD4 8000E3D4 AD670014 */  sw         $a3, 0x14($t3)
/* EFD8 8000E3D8 A168001C */  sb         $t0, 0x1c($t3)
/* EFDC 8000E3DC AD690018 */  sw         $t1, 0x18($t3)
/* EFE0 8000E3E0 2A620003 */  slti       $v0, $s3, 3
/* EFE4 8000E3E4 1440FFEA */  bnez       $v0, .L8000E390
/* EFE8 8000E3E8 256B0020 */   addiu     $t3, $t3, 0x20
/* EFEC 8000E3EC 01E01821 */  addu       $v1, $t7, $zero
/* EFF0 8000E3F0 01F07821 */  addu       $t7, $t7, $s0
/* EFF4 8000E3F4 00032403 */  sra        $a0, $v1, 0x10
/* EFF8 8000E3F8 28820003 */  slti       $v0, $a0, 3
/* EFFC 8000E3FC 1440FFE1 */  bnez       $v0, .L8000E384
/* F000 8000E400 25CE0060 */   addiu     $t6, $t6, 0x60
/* F004 8000E404 02202021 */  addu       $a0, $s1, $zero
/* F008 8000E408 0C00370B */  jal        MakeGameZoneNames
/* F00C 8000E40C 02402821 */   addu      $a1, $s2, $zero
/* F010 8000E410 3C140001 */  lui        $s4, 1
/* F014 8000E414 00009021 */  addu       $s2, $zero, $zero
/* F018 8000E418 3C150001 */  lui        $s5, 1
.L8000E41C:
/* F01C 8000E41C 3C110001 */  lui        $s1, 1
/* F020 8000E420 02D28021 */  addu       $s0, $s6, $s2
.L8000E424:
/* F024 8000E424 27A40028 */  addiu      $a0, $sp, 0x28
/* F028 8000E428 0C0036B7 */  jal        func_8000DADC
/* F02C 8000E42C 02002821 */   addu      $a1, $s0, $zero
/* F030 8000E430 02201821 */  addu       $v1, $s1, $zero
/* F034 8000E434 02358821 */  addu       $s1, $s1, $s5
/* F038 8000E438 00039C03 */  sra        $s3, $v1, 0x10
/* F03C 8000E43C 2A620003 */  slti       $v0, $s3, 3
/* F040 8000E440 1440FFF8 */  bnez       $v0, .L8000E424
/* F044 8000E444 26100020 */   addiu     $s0, $s0, 0x20
/* F048 8000E448 02801821 */  addu       $v1, $s4, $zero
/* F04C 8000E44C 0295A021 */  addu       $s4, $s4, $s5
/* F050 8000E450 00032403 */  sra        $a0, $v1, 0x10
/* F054 8000E454 28820003 */  slti       $v0, $a0, 3
/* F058 8000E458 1440FFF0 */  bnez       $v0, .L8000E41C
/* F05C 8000E45C 26520060 */   addiu     $s2, $s2, 0x60
/* F060 8000E460 00002021 */  addu       $a0, $zero, $zero
/* F064 8000E464 3C120001 */  lui        $s2, 1
/* F068 8000E468 00041040 */  sll        $v0, $a0, 1
.L8000E46C:
/* F06C 8000E46C 24970001 */  addiu      $s7, $a0, 1
/* F070 8000E470 3C110001 */  lui        $s1, 1
/* F074 8000E474 00441021 */  addu       $v0, $v0, $a0
/* F078 8000E478 00021140 */  sll        $v0, $v0, 5
/* F07C 8000E47C 03C28021 */  addu       $s0, $fp, $v0
.L8000E480:
/* F080 8000E480 02002021 */  addu       $a0, $s0, $zero
/* F084 8000E484 24050001 */  addiu      $a1, $zero, 1
/* F088 8000E488 0C0035FB */  jal        func_8000D7EC
/* F08C 8000E48C 00003021 */   addu      $a2, $zero, $zero
/* F090 8000E490 02201821 */  addu       $v1, $s1, $zero
/* F094 8000E494 02328821 */  addu       $s1, $s1, $s2
/* F098 8000E498 00039C03 */  sra        $s3, $v1, 0x10
/* F09C 8000E49C 2A620003 */  slti       $v0, $s3, 3
/* F0A0 8000E4A0 1440FFF7 */  bnez       $v0, .L8000E480
/* F0A4 8000E4A4 26100020 */   addiu     $s0, $s0, 0x20
/* F0A8 8000E4A8 00171400 */  sll        $v0, $s7, 0x10
/* F0AC 8000E4AC 00022403 */  sra        $a0, $v0, 0x10
/* F0B0 8000E4B0 28830003 */  slti       $v1, $a0, 3
/* F0B4 8000E4B4 1460FFED */  bnez       $v1, .L8000E46C
/* F0B8 8000E4B8 00041040 */   sll       $v0, $a0, 1
/* F0BC 8000E4BC 3C10800E */  lui        $s0, %hi(zoneDatMatrix+0x80)
/* F0C0 8000E4C0 26106A08 */  addiu      $s0, $s0, %lo(zoneDatMatrix+0x80)
/* F0C4 8000E4C4 0C003870 */  jal        loading_map_data
/* F0C8 8000E4C8 02002021 */   addu      $a0, $s0, $zero
/* F0CC 8000E4CC 8EC20080 */  lw         $v0, 0x80($s6)
/* F0D0 8000E4D0 10400005 */  beqz       $v0, .L8000E4E8
/* F0D4 8000E4D4 3C02800E */   lui       $v0, 0x800e
/* F0D8 8000E4D8 8E020008 */  lw         $v0, 8($s0)
/* F0DC 8000E4DC 1440002C */  bnez       $v0, .L8000E590
/* F0E0 8000E4E0 24110001 */   addiu     $s1, $zero, 1
/* F0E4 8000E4E4 3C02800E */  lui        $v0, %hi(gGlobals)
.L8000E4E8:
/* F0E8 8000E4E8 244568A8 */  addiu      $a1, $v0, %lo(gGlobals)
/* F0EC 8000E4EC 90A30040 */  lbu        $v1, 0x40($a1)
/* F0F0 8000E4F0 24020002 */  addiu      $v0, $zero, 2
/* F0F4 8000E4F4 5462000A */  bnel       $v1, $v0, .L8000E520
/* F0F8 8000E4F8 8CA200A8 */   lw        $v0, 0xa8($a1)
/* F0FC 8000E4FC 3C02800F */  lui        $v0, %hi(combatPointer)
/* F100 8000E500 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* F104 8000E504 8C64002C */  lw         $a0, 0x2c($v1)
/* F108 8000E508 90820020 */  lbu        $v0, 0x20($a0)
/* F10C 8000E50C 00021080 */  sll        $v0, $v0, 2
/* F110 8000E510 00A21021 */  addu       $v0, $a1, $v0
/* F114 8000E514 8C4313FC */  lw         $v1, 0x13fc($v0)
/* F118 8000E518 08003949 */  j          .L8000E524
/* F11C 8000E51C 24620068 */   addiu     $v0, $v1, 0x68
.L8000E520:
/* F120 8000E520 24420068 */  addiu      $v0, $v0, 0x68
.L8000E524:
/* F124 8000E524 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* F128 8000E528 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* F12C 8000E52C 02002021 */  addu       $a0, $s0, $zero
/* F130 8000E530 3C05800E */  lui        $a1, 0x800e
/* F134 8000E534 C4420000 */  lwc1       $f2, ($v0)
/* F138 8000E538 8603E314 */  lh         $v1, -0x1cec($s0)
/* F13C 8000E53C 46001021 */  cvt.d.s    $f0, $f2
/* F140 8000E540 44070000 */  mfc1       $a3, $f0
/* F144 8000E544 44060800 */  mfc1       $a2, $f1
/* F148 8000E548 C4400008 */  lwc1       $f0, 8($v0)
/* F14C 8000E54C 92C20293 */  lbu        $v0, 0x293($s6)
/* F150 8000E550 24A58560 */  addiu      $a1, $a1, -0x7aa0
/* F154 8000E554 AFA30018 */  sw         $v1, 0x18($sp)
/* F158 8000E558 46000021 */  cvt.d.s    $f0, $f0
/* F15C 8000E55C 2442FFFF */  addiu      $v0, $v0, -1
/* F160 8000E560 304200FF */  andi       $v0, $v0, 0xff
/* F164 8000E564 F7A00010 */  sdc1       $f0, 0x10($sp)
/* F168 8000E568 86C30294 */  lh         $v1, 0x294($s6)
/* F16C 8000E56C 24420041 */  addiu      $v0, $v0, 0x41
/* F170 8000E570 AFA2001C */  sw         $v0, 0x1c($sp)
/* F174 8000E574 0C0333AC */  jal        sprintf
/* F178 8000E578 AFA30020 */   sw        $v1, 0x20($sp)
/* F17C 8000E57C 3C04800E */  lui        $a0, %hi(D_800D85AC)
/* F180 8000E580 248485AC */  addiu      $a0, $a0, %lo(D_800D85AC)
/* F184 8000E584 0C025F2D */  jal        manualCrash
/* F188 8000E588 02002821 */   addu      $a1, $s0, $zero
/* F18C 8000E58C 24110001 */  addiu      $s1, $zero, 1
.L8000E590:
/* F190 8000E590 00008021 */  addu       $s0, $zero, $zero
/* F194 8000E594 27B40168 */  addiu      $s4, $sp, 0x168
/* F198 8000E598 3C03800E */  lui        $v1, %hi(zoneDatMatrix+0x80)
/* F19C 8000E59C 24636A08 */  addiu      $v1, $v1, %lo(zoneDatMatrix+0x80)
/* F1A0 8000E5A0 8C62000C */  lw         $v0, 0xc($v1)
/* F1A4 8000E5A4 27B3016A */  addiu      $s3, $sp, 0x16a
/* F1A8 8000E5A8 90520022 */  lbu        $s2, 0x22($v0)
/* F1AC 8000E5AC 02511024 */  and        $v0, $s2, $s1
.L8000E5B0:
/* F1B0 8000E5B0 1040000E */  beqz       $v0, .L8000E5EC
/* F1B4 8000E5B4 24050001 */   addiu     $a1, $zero, 1
/* F1B8 8000E5B8 00103880 */  sll        $a3, $s0, 2
/* F1BC 8000E5BC 02871021 */  addu       $v0, $s4, $a3
/* F1C0 8000E5C0 00003021 */  addu       $a2, $zero, $zero
/* F1C4 8000E5C4 02673821 */  addu       $a3, $s3, $a3
/* F1C8 8000E5C8 94430000 */  lhu        $v1, ($v0)
/* F1CC 8000E5CC 94E20000 */  lhu        $v0, ($a3)
/* F1D0 8000E5D0 00032040 */  sll        $a0, $v1, 1
/* F1D4 8000E5D4 00832021 */  addu       $a0, $a0, $v1
/* F1D8 8000E5D8 00042140 */  sll        $a0, $a0, 5
/* F1DC 8000E5DC 02C42021 */  addu       $a0, $s6, $a0
/* F1E0 8000E5E0 00021140 */  sll        $v0, $v0, 5
/* F1E4 8000E5E4 0C0035FB */  jal        func_8000D7EC
/* F1E8 8000E5E8 00822021 */   addu      $a0, $a0, $v0
.L8000E5EC:
/* F1EC 8000E5EC 00111040 */  sll        $v0, $s1, 1
/* F1F0 8000E5F0 305100FE */  andi       $s1, $v0, 0xfe
/* F1F4 8000E5F4 26030001 */  addiu      $v1, $s0, 1
/* F1F8 8000E5F8 3070FFFF */  andi       $s0, $v1, 0xffff
/* F1FC 8000E5FC 2E020008 */  sltiu      $v0, $s0, 8
/* F200 8000E600 1440FFEB */  bnez       $v0, .L8000E5B0
/* F204 8000E604 02511024 */   and       $v0, $s2, $s1
/* F208 8000E608 00002021 */  addu       $a0, $zero, $zero
/* F20C 8000E60C 241E0003 */  addiu      $fp, $zero, 3
/* F210 8000E610 00009821 */  addu       $s3, $zero, $zero
.L8000E614:
/* F214 8000E614 00041040 */  sll        $v0, $a0, 1
/* F218 8000E618 24970001 */  addiu      $s7, $a0, 1
/* F21C 8000E61C 00441021 */  addu       $v0, $v0, $a0
/* F220 8000E620 00021140 */  sll        $v0, $v0, 5
/* F224 8000E624 24430014 */  addiu      $v1, $v0, 0x14
/* F228 8000E628 02C3A821 */  addu       $s5, $s6, $v1
/* F22C 8000E62C 24440004 */  addiu      $a0, $v0, 4
/* F230 8000E630 02C4A021 */  addu       $s4, $s6, $a0
/* F234 8000E634 02C28821 */  addu       $s1, $s6, $v0
.L8000E638:
/* F238 8000E638 8E240000 */  lw         $a0, ($s1)
/* F23C 8000E63C 5080001F */  beql       $a0, $zero, .L8000E6BC
/* F240 8000E640 8E240010 */   lw        $a0, 0x10($s1)
/* F244 8000E644 8E220004 */  lw         $v0, 4($s1)
/* F248 8000E648 5440001C */  bnel       $v0, $zero, .L8000E6BC
/* F24C 8000E64C 8E240010 */   lw        $a0, 0x10($s1)
/* F250 8000E650 240200FF */  addiu      $v0, $zero, 0xff
/* F254 8000E654 9223001D */  lbu        $v1, 0x1d($s1)
/* F258 8000E658 24090011 */  addiu      $t1, $zero, 0x11
/* F25C 8000E65C 14690005 */  bne        $v1, $t1, .L8000E674
/* F260 8000E660 A222001C */   sb        $v0, 0x1c($s1)
/* F264 8000E664 0C027E7A */  jal        BorgAnimLoadScene
/* F268 8000E668 00000000 */   nop
/* F26C 8000E66C 080039AE */  j          .L8000E6B8
/* F270 8000E670 AE220004 */   sw        $v0, 4($s1)
.L8000E674:
/* F274 8000E674 3C0A800F */  lui        $t2, %hi(oneZone_load)
/* F278 8000E678 95428DAE */  lhu        $v0, %lo(oneZone_load)($t2)
/* F27C 8000E67C 5440000F */  bnel       $v0, $zero, .L8000E6BC
/* F280 8000E680 8E240010 */   lw        $a0, 0x10($s1)
/* F284 8000E684 0C003380 */  jal        NoExpPak_memCheck
/* F288 8000E688 24040003 */   addiu     $a0, $zero, 3
/* F28C 8000E68C 1040000A */  beqz       $v0, .L8000E6B8
/* F290 8000E690 3C0B800F */   lui       $t3, %hi(queueStructB)
/* F294 8000E694 256486D0 */  addiu      $a0, $t3, %lo(queueStructB)
/* F298 8000E698 02802821 */  addu       $a1, $s4, $zero
/* F29C 8000E69C 00003021 */  addu       $a2, $zero, $zero
/* F2A0 8000E6A0 8E270000 */  lw         $a3, ($s1)
/* F2A4 8000E6A4 8FA201A8 */  lw         $v0, 0x1a8($sp)
/* F2A8 8000E6A8 240C0001 */  addiu      $t4, $zero, 1
/* F2AC 8000E6AC AFAC0010 */  sw         $t4, 0x10($sp)
/* F2B0 8000E6B0 0C03574B */  jal        AllocAllocQueueItem
/* F2B4 8000E6B4 AFA20014 */   sw        $v0, 0x14($sp)
.L8000E6B8:
/* F2B8 8000E6B8 8E240010 */  lw         $a0, 0x10($s1)
.L8000E6BC:
/* F2BC 8000E6BC 1080001B */  beqz       $a0, .L8000E72C
/* F2C0 8000E6C0 00000000 */   nop
/* F2C4 8000E6C4 8E220014 */  lw         $v0, 0x14($s1)
/* F2C8 8000E6C8 14400018 */  bnez       $v0, .L8000E72C
/* F2CC 8000E6CC 24030011 */   addiu     $v1, $zero, 0x11
/* F2D0 8000E6D0 9222001D */  lbu        $v0, 0x1d($s1)
/* F2D4 8000E6D4 14430005 */  bne        $v0, $v1, .L8000E6EC
/* F2D8 8000E6D8 3C09800F */   lui       $t1, %hi(oneZone_load)
/* F2DC 8000E6DC 0C027E7A */  jal        BorgAnimLoadScene
/* F2E0 8000E6E0 00000000 */   nop
/* F2E4 8000E6E4 080039CB */  j          .L8000E72C
/* F2E8 8000E6E8 AE220014 */   sw        $v0, 0x14($s1)
.L8000E6EC:
/* F2EC 8000E6EC 95228DAE */  lhu        $v0, %lo(oneZone_load)($t1)
/* F2F0 8000E6F0 1440000E */  bnez       $v0, .L8000E72C
/* F2F4 8000E6F4 00000000 */   nop
/* F2F8 8000E6F8 0C003380 */  jal        NoExpPak_memCheck
/* F2FC 8000E6FC 24040004 */   addiu     $a0, $zero, 4
/* F300 8000E700 1040000A */  beqz       $v0, .L8000E72C
/* F304 8000E704 3C0A800F */   lui       $t2, %hi(queueStructB)
/* F308 8000E708 254486D0 */  addiu      $a0, $t2, %lo(queueStructB)
/* F30C 8000E70C 02A02821 */  addu       $a1, $s5, $zero
/* F310 8000E710 00003021 */  addu       $a2, $zero, $zero
/* F314 8000E714 8E270010 */  lw         $a3, 0x10($s1)
/* F318 8000E718 8FAC01A8 */  lw         $t4, 0x1a8($sp)
/* F31C 8000E71C 240B0001 */  addiu      $t3, $zero, 1
/* F320 8000E720 AFAB0010 */  sw         $t3, 0x10($sp)
/* F324 8000E724 0C03574B */  jal        AllocAllocQueueItem
/* F328 8000E728 AFAC0014 */   sw        $t4, 0x14($sp)
.L8000E72C:
/* F32C 8000E72C 0C003870 */  jal        loading_map_data
/* F330 8000E730 02202021 */   addu      $a0, $s1, $zero
/* F334 8000E734 9222001D */  lbu        $v0, 0x1d($s1)
/* F338 8000E738 24030011 */  addiu      $v1, $zero, 0x11
/* F33C 8000E73C 54430035 */  bnel       $v0, $v1, .L8000E814
/* F340 8000E740 26B50020 */   addiu     $s5, $s5, 0x20
/* F344 8000E744 3C09800E */  lui        $t1, %hi(gGlobals)
/* F348 8000E748 253068A8 */  addiu      $s0, $t1, %lo(gGlobals)
/* F34C 8000E74C 86C40292 */  lh         $a0, 0x292($s6)
/* F350 8000E750 8E22000C */  lw         $v0, 0xc($s1)
/* F354 8000E754 86C50294 */  lh         $a1, 0x294($s6)
/* F358 8000E758 9612144C */  lhu        $s2, 0x144c($s0)
/* F35C 8000E75C 24420008 */  addiu      $v0, $v0, 8
/* F360 8000E760 AEC20120 */  sw         $v0, 0x120($s6)
/* F364 8000E764 0C00B11C */  jal        GetMapTerrain
/* F368 8000E768 AEC20688 */   sw        $v0, 0x688($s6)
/* F36C 8000E76C 8602144C */  lh         $v0, 0x144c($s0)
/* F370 8000E770 145E0010 */  bne        $v0, $fp, .L8000E7B4
/* F374 8000E774 3C0A800E */   lui       $t2, %hi(gGlobals)
/* F378 8000E778 165E000F */  bne        $s2, $fp, .L8000E7B8
/* F37C 8000E77C 254368A8 */   addiu     $v1, $t2, %lo(gGlobals)
/* F380 8000E780 8E020394 */  lw         $v0, 0x394($s0)
/* F384 8000E784 14400007 */  bnez       $v0, .L8000E7A4
/* F388 8000E788 3C04800E */   lui       $a0, 0x800e
/* F38C 8000E78C 860503A4 */  lh         $a1, 0x3a4($s0)
/* F390 8000E790 3C064416 */  lui        $a2, 0x4416
/* F394 8000E794 0C00897E */  jal        SetBackgroundType
/* F398 8000E798 24040003 */   addiu     $a0, $zero, 3
/* F39C 8000E79C 08003A05 */  j          .L8000E814
/* F3A0 8000E7A0 26B50020 */   addiu     $s5, $s5, 0x20
.L8000E7A4:
/* F3A4 8000E7A4 0C00B6B8 */  jal        debug_queue
/* F3A8 8000E7A8 248485C0 */   addiu     $a0, $a0, -0x7a40
/* F3AC 8000E7AC 08003A05 */  j          .L8000E814
/* F3B0 8000E7B0 26B50020 */   addiu     $s5, $s5, 0x20
.L8000E7B4:
/* F3B4 8000E7B4 254368A8 */  addiu      $v1, $t2, 0x68a8
.L8000E7B8:
/* F3B8 8000E7B8 8462144C */  lh         $v0, 0x144c($v1)
/* F3BC 8000E7BC 145E0007 */  bne        $v0, $fp, .L8000E7DC
/* F3C0 8000E7C0 946503A4 */   lhu       $a1, 0x3a4($v1)
/* F3C4 8000E7C4 84630394 */  lh         $v1, 0x394($v1)
/* F3C8 8000E7C8 28620003 */  slti       $v0, $v1, 3
/* F3CC 8000E7CC 50400004 */  beql       $v0, $zero, .L8000E7E0
/* F3D0 8000E7D0 00052C00 */   sll       $a1, $a1, 0x10
/* F3D4 8000E7D4 5C600001 */  bgtzl      $v1, .L8000E7DC
/* F3D8 8000E7D8 24050002 */   addiu     $a1, $zero, 2
.L8000E7DC:
/* F3DC 8000E7DC 00052C00 */  sll        $a1, $a1, 0x10
.L8000E7E0:
/* F3E0 8000E7E0 00052C03 */  sra        $a1, $a1, 0x10
/* F3E4 8000E7E4 3C0B800E */  lui        $t3, %hi(gGlobals)
/* F3E8 8000E7E8 256B68A8 */  addiu      $t3, $t3, %lo(gGlobals)
/* F3EC 8000E7EC 8564144C */  lh         $a0, 0x144c($t3)
/* F3F0 8000E7F0 0C00897E */  jal        SetBackgroundType
/* F3F4 8000E7F4 00003021 */   addu      $a2, $zero, $zero
/* F3F8 8000E7F8 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* F3FC 8000E7FC 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* F400 8000E800 3C0C800E */  lui        $t4, %hi(gGlobals)
/* F404 8000E804 C460000C */  lwc1       $f0, 0xc($v1)
/* F408 8000E808 258C68A8 */  addiu      $t4, $t4, %lo(gGlobals)
/* F40C 8000E80C E58003A0 */  swc1       $f0, 0x3a0($t4)
/* F410 8000E810 26B50020 */  addiu      $s5, $s5, 0x20
.L8000E814:
/* F414 8000E814 26940020 */  addiu      $s4, $s4, 0x20
/* F418 8000E818 26620001 */  addiu      $v0, $s3, 1
/* F41C 8000E81C 00021400 */  sll        $v0, $v0, 0x10
/* F420 8000E820 00029C03 */  sra        $s3, $v0, 0x10
/* F424 8000E824 2A630003 */  slti       $v1, $s3, 3
/* F428 8000E828 1460FF83 */  bnez       $v1, .L8000E638
/* F42C 8000E82C 26310020 */   addiu     $s1, $s1, 0x20
/* F430 8000E830 00171400 */  sll        $v0, $s7, 0x10
/* F434 8000E834 00022403 */  sra        $a0, $v0, 0x10
/* F438 8000E838 28830003 */  slti       $v1, $a0, 3
/* F43C 8000E83C 5460FF75 */  bnel       $v1, $zero, .L8000E614
/* F440 8000E840 00009821 */   addu      $s3, $zero, $zero
/* F444 8000E844 3C02800E */  lui        $v0, %hi(gGlobals)
/* F448 8000E848 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* F44C 8000E84C 9462101E */  lhu        $v0, 0x101e($v1)
/* F450 8000E850 1440000C */  bnez       $v0, .L8000E884
/* F454 8000E854 8FBF01D4 */   lw        $ra, 0x1d4($sp)
/* F458 8000E858 8C62150C */  lw         $v0, 0x150c($v1)
/* F45C 8000E85C 1440000A */  bnez       $v0, .L8000E888
/* F460 8000E860 8FBE01D0 */   lw        $fp, 0x1d0($sp)
/* F464 8000E864 8463144C */  lh         $v1, 0x144c($v1)
/* F468 8000E868 24020003 */  addiu      $v0, $zero, 3
/* F46C 8000E86C 14620006 */  bne        $v1, $v0, .L8000E888
/* F470 8000E870 00000000 */   nop
/* F474 8000E874 86C40292 */  lh         $a0, 0x292($s6)
/* F478 8000E878 0C014417 */  jal        set_map_event_flag
/* F47C 8000E87C 86C50294 */   lh        $a1, 0x294($s6)
/* F480 8000E880 8FBF01D4 */  lw         $ra, 0x1d4($sp)
.L8000E884:
/* F484 8000E884 8FBE01D0 */  lw         $fp, 0x1d0($sp)
.L8000E888:
/* F488 8000E888 8FB701CC */  lw         $s7, 0x1cc($sp)
/* F48C 8000E88C 8FB601C8 */  lw         $s6, 0x1c8($sp)
/* F490 8000E890 8FB501C4 */  lw         $s5, 0x1c4($sp)
/* F494 8000E894 8FB401C0 */  lw         $s4, 0x1c0($sp)
/* F498 8000E898 8FB301BC */  lw         $s3, 0x1bc($sp)
/* F49C 8000E89C 8FB201B8 */  lw         $s2, 0x1b8($sp)
/* F4A0 8000E8A0 8FB101B4 */  lw         $s1, 0x1b4($sp)
/* F4A4 8000E8A4 8FB001B0 */  lw         $s0, 0x1b0($sp)
/* F4A8 8000E8A8 03E00008 */  jr         $ra
/* F4AC 8000E8AC 27BD01D8 */   addiu     $sp, $sp, 0x1d8

glabel func_8000E8B0
/* F4B0 8000E8B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* F4B4 8000E8B4 AFB10014 */  sw         $s1, 0x14($sp)
/* F4B8 8000E8B8 00808821 */  addu       $s1, $a0, $zero
/* F4BC 8000E8BC 00A02021 */  addu       $a0, $a1, $zero
/* F4C0 8000E8C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* F4C4 8000E8C4 AFB00010 */  sw         $s0, 0x10($sp)
/* F4C8 8000E8C8 C4800068 */  lwc1       $f0, 0x68($a0)
/* F4CC 8000E8CC C6220000 */  lwc1       $f2, ($s1)
/* F4D0 8000E8D0 46020000 */  add.s      $f0, $f0, $f2
/* F4D4 8000E8D4 C482006C */  lwc1       $f2, 0x6c($a0)
/* F4D8 8000E8D8 E4800068 */  swc1       $f0, 0x68($a0)
/* F4DC 8000E8DC C6200004 */  lwc1       $f0, 4($s1)
/* F4E0 8000E8E0 46001080 */  add.s      $f2, $f2, $f0
/* F4E4 8000E8E4 C4800070 */  lwc1       $f0, 0x70($a0)
/* F4E8 8000E8E8 E482006C */  swc1       $f2, 0x6c($a0)
/* F4EC 8000E8EC C6220008 */  lwc1       $f2, 8($s1)
/* F4F0 8000E8F0 9482001E */  lhu        $v0, 0x1e($a0)
/* F4F4 8000E8F4 46020000 */  add.s      $f0, $f0, $f2
/* F4F8 8000E8F8 30420001 */  andi       $v0, $v0, 1
/* F4FC 8000E8FC 10400003 */  beqz       $v0, .L8000E90C
/* F500 8000E900 E4800070 */   swc1      $f0, 0x70($a0)
/* F504 8000E904 0C006744 */  jal        GiveCameraToPlayer
/* F508 8000E908 00000000 */   nop
.L8000E90C:
/* F50C 8000E90C 3C10800E */  lui        $s0, %hi(Camera)
/* F510 8000E910 26106ABC */  addiu      $s0, $s0, %lo(Camera)
/* F514 8000E914 02002021 */  addu       $a0, $s0, $zero
/* F518 8000E918 0C00676D */  jal        camera_add_vec3
/* F51C 8000E91C 02202821 */   addu      $a1, $s1, $zero
/* F520 8000E920 2604021C */  addiu      $a0, $s0, 0x21c
/* F524 8000E924 0C006E22 */  jal        func_8001B888
/* F528 8000E928 02202821 */   addu      $a1, $s1, $zero
/* F52C 8000E92C 8FBF0018 */  lw         $ra, 0x18($sp)
/* F530 8000E930 8FB10014 */  lw         $s1, 0x14($sp)
/* F534 8000E934 8FB00010 */  lw         $s0, 0x10($sp)
/* F538 8000E938 03E00008 */  jr         $ra
/* F53C 8000E93C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel FindReferncePoint
/* F540 8000E940 00003821 */  addu       $a3, $zero, $zero
/* F544 8000E944 94820028 */  lhu        $v0, 0x28($a0)
/* F548 8000E948 10400016 */  beqz       $v0, .L8000E9A4
/* F54C 8000E94C 30A5FFFF */   andi      $a1, $a1, 0xffff
/* F550 8000E950 8C840044 */  lw         $a0, 0x44($a0)
/* F554 8000E954 24090006 */  addiu      $t1, $zero, 6
/* F558 8000E958 00404021 */  addu       $t0, $v0, $zero
/* F55C 8000E95C 000710C0 */  sll        $v0, $a3, 3
.L8000E960:
/* F560 8000E960 00471023 */  subu       $v0, $v0, $a3
/* F564 8000E964 00021080 */  sll        $v0, $v0, 2
/* F568 8000E968 00471023 */  subu       $v0, $v0, $a3
/* F56C 8000E96C 00021080 */  sll        $v0, $v0, 2
/* F570 8000E970 00823021 */  addu       $a2, $a0, $v0
/* F574 8000E974 94C30016 */  lhu        $v1, 0x16($a2)
/* F578 8000E978 14690006 */  bne        $v1, $t1, .L8000E994
/* F57C 8000E97C 24E20001 */   addiu     $v0, $a3, 1
/* F580 8000E980 94C20028 */  lhu        $v0, 0x28($a2)
/* F584 8000E984 14450003 */  bne        $v0, $a1, .L8000E994
/* F588 8000E988 24E20001 */   addiu     $v0, $a3, 1
/* F58C 8000E98C 03E00008 */  jr         $ra
/* F590 8000E990 00C01021 */   addu      $v0, $a2, $zero
.L8000E994:
/* F594 8000E994 3047FFFF */  andi       $a3, $v0, 0xffff
/* F598 8000E998 00E8182B */  sltu       $v1, $a3, $t0
/* F59C 8000E99C 1460FFF0 */  bnez       $v1, .L8000E960
/* F5A0 8000E9A0 000710C0 */   sll       $v0, $a3, 3
.L8000E9A4:
/* F5A4 8000E9A4 03E00008 */  jr         $ra
/* F5A8 8000E9A8 00001021 */   addu      $v0, $zero, $zero

glabel get_map_referencepoint
/* F5AC 8000E9AC 00003821 */  addu       $a3, $zero, $zero
/* F5B0 8000E9B0 94820028 */  lhu        $v0, 0x28($a0)
/* F5B4 8000E9B4 10400016 */  beqz       $v0, .L8000EA10
/* F5B8 8000E9B8 30A5FFFF */   andi      $a1, $a1, 0xffff
/* F5BC 8000E9BC 8C840044 */  lw         $a0, 0x44($a0)
/* F5C0 8000E9C0 24090006 */  addiu      $t1, $zero, 6
/* F5C4 8000E9C4 00404021 */  addu       $t0, $v0, $zero
/* F5C8 8000E9C8 000710C0 */  sll        $v0, $a3, 3
.L8000E9CC:
/* F5CC 8000E9CC 00471023 */  subu       $v0, $v0, $a3
/* F5D0 8000E9D0 00021080 */  sll        $v0, $v0, 2
/* F5D4 8000E9D4 00471023 */  subu       $v0, $v0, $a3
/* F5D8 8000E9D8 00021080 */  sll        $v0, $v0, 2
/* F5DC 8000E9DC 00823021 */  addu       $a2, $a0, $v0
/* F5E0 8000E9E0 94C30016 */  lhu        $v1, 0x16($a2)
/* F5E4 8000E9E4 14690006 */  bne        $v1, $t1, .L8000EA00
/* F5E8 8000E9E8 24E20001 */   addiu     $v0, $a3, 1
/* F5EC 8000E9EC 94C20028 */  lhu        $v0, 0x28($a2)
/* F5F0 8000E9F0 14450003 */  bne        $v0, $a1, .L8000EA00
/* F5F4 8000E9F4 24E20001 */   addiu     $v0, $a3, 1
/* F5F8 8000E9F8 03E00008 */  jr         $ra
/* F5FC 8000E9FC 00C01021 */   addu      $v0, $a2, $zero
.L8000EA00:
/* F600 8000EA00 3047FFFF */  andi       $a3, $v0, 0xffff
/* F604 8000EA04 00E8182B */  sltu       $v1, $a3, $t0
/* F608 8000EA08 1460FFF0 */  bnez       $v1, .L8000E9CC
/* F60C 8000EA0C 000710C0 */   sll       $v0, $a3, 3
.L8000EA10:
/* F610 8000EA10 03E00008 */  jr         $ra
/* F614 8000EA14 00001021 */   addu      $v0, $zero, $zero

glabel FindReferncePointName
/* F618 8000EA18 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* F61C 8000EA1C AFB40020 */  sw         $s4, 0x20($sp)
/* F620 8000EA20 0080A021 */  addu       $s4, $a0, $zero
/* F624 8000EA24 AFB50024 */  sw         $s5, 0x24($sp)
/* F628 8000EA28 00A0A821 */  addu       $s5, $a1, $zero
/* F62C 8000EA2C 02A02021 */  addu       $a0, $s5, $zero
/* F630 8000EA30 AFB7002C */  sw         $s7, 0x2c($sp)
/* F634 8000EA34 00C0B821 */  addu       $s7, $a2, $zero
/* F638 8000EA38 AFBF0030 */  sw         $ra, 0x30($sp)
/* F63C 8000EA3C AFB60028 */  sw         $s6, 0x28($sp)
/* F640 8000EA40 AFB3001C */  sw         $s3, 0x1c($sp)
/* F644 8000EA44 AFB20018 */  sw         $s2, 0x18($sp)
/* F648 8000EA48 AFB10014 */  sw         $s1, 0x14($sp)
/* F64C 8000EA4C 0C03353E */  jal        strlen
/* F650 8000EA50 AFB00010 */   sw        $s0, 0x10($sp)
/* F654 8000EA54 00008821 */  addu       $s1, $zero, $zero
/* F658 8000EA58 96830028 */  lhu        $v1, 0x28($s4)
/* F65C 8000EA5C 1060002B */  beqz       $v1, .L8000EB0C
/* F660 8000EA60 3053FFFF */   andi      $s3, $v0, 0xffff
/* F664 8000EA64 24160006 */  addiu      $s6, $zero, 6
/* F668 8000EA68 001110C0 */  sll        $v0, $s1, 3
.L8000EA6C:
/* F66C 8000EA6C 00511023 */  subu       $v0, $v0, $s1
/* F670 8000EA70 00021080 */  sll        $v0, $v0, 2
/* F674 8000EA74 00511023 */  subu       $v0, $v0, $s1
/* F678 8000EA78 8E840044 */  lw         $a0, 0x44($s4)
/* F67C 8000EA7C 00021080 */  sll        $v0, $v0, 2
/* F680 8000EA80 00829021 */  addu       $s2, $a0, $v0
/* F684 8000EA84 96430016 */  lhu        $v1, 0x16($s2)
/* F688 8000EA88 1476001B */  bne        $v1, $s6, .L8000EAF8
/* F68C 8000EA8C 26230001 */   addiu     $v1, $s1, 1
/* F690 8000EA90 2650002C */  addiu      $s0, $s2, 0x2c
/* F694 8000EA94 0C03353E */  jal        strlen
/* F698 8000EA98 02002021 */   addu      $a0, $s0, $zero
/* F69C 8000EA9C 16620016 */  bne        $s3, $v0, .L8000EAF8
/* F6A0 8000EAA0 26230001 */   addiu     $v1, $s1, 1
/* F6A4 8000EAA4 00003021 */  addu       $a2, $zero, $zero
/* F6A8 8000EAA8 1260000F */  beqz       $s3, .L8000EAE8
/* F6AC 8000EAAC 00003821 */   addu      $a3, $zero, $zero
/* F6B0 8000EAB0 02004021 */  addu       $t0, $s0, $zero
/* F6B4 8000EAB4 02A61821 */  addu       $v1, $s5, $a2
.L8000EAB8:
/* F6B8 8000EAB8 01062021 */  addu       $a0, $t0, $a2
/* F6BC 8000EABC 90650000 */  lbu        $a1, ($v1)
/* F6C0 8000EAC0 90820000 */  lbu        $v0, ($a0)
/* F6C4 8000EAC4 14A20004 */  bne        $a1, $v0, .L8000EAD8
/* F6C8 8000EAC8 24C20001 */   addiu     $v0, $a2, 1
/* F6CC 8000EACC 24E20001 */  addiu      $v0, $a3, 1
/* F6D0 8000EAD0 3047FFFF */  andi       $a3, $v0, 0xffff
/* F6D4 8000EAD4 24C20001 */  addiu      $v0, $a2, 1
.L8000EAD8:
/* F6D8 8000EAD8 3046FFFF */  andi       $a2, $v0, 0xffff
/* F6DC 8000EADC 00D3182B */  sltu       $v1, $a2, $s3
/* F6E0 8000EAE0 1460FFF5 */  bnez       $v1, .L8000EAB8
/* F6E4 8000EAE4 02A61821 */   addu      $v1, $s5, $a2
.L8000EAE8:
/* F6E8 8000EAE8 14F30003 */  bne        $a3, $s3, .L8000EAF8
/* F6EC 8000EAEC 26230001 */   addiu     $v1, $s1, 1
/* F6F0 8000EAF0 08003ACA */  j          .L8000EB28
/* F6F4 8000EAF4 02401021 */   addu      $v0, $s2, $zero
.L8000EAF8:
/* F6F8 8000EAF8 96820028 */  lhu        $v0, 0x28($s4)
/* F6FC 8000EAFC 3071FFFF */  andi       $s1, $v1, 0xffff
/* F700 8000EB00 0222102B */  sltu       $v0, $s1, $v0
/* F704 8000EB04 1440FFD9 */  bnez       $v0, .L8000EA6C
/* F708 8000EB08 001110C0 */   sll       $v0, $s1, 3
.L8000EB0C:
/* F70C 8000EB0C 12E00005 */  beqz       $s7, .L8000EB24
/* F710 8000EB10 3C04800E */   lui       $a0, %hi(D_800D85E8)
/* F714 8000EB14 248485E8 */  addiu      $a0, $a0, %lo(D_800D85E8)
/* F718 8000EB18 3C05800E */  lui        $a1, %hi(D_800D8600)
/* F71C 8000EB1C 0C025F2D */  jal        manualCrash
/* F720 8000EB20 24A58600 */   addiu     $a1, $a1, %lo(D_800D8600)
.L8000EB24:
/* F724 8000EB24 00001021 */  addu       $v0, $zero, $zero
.L8000EB28:
/* F728 8000EB28 8FBF0030 */  lw         $ra, 0x30($sp)
/* F72C 8000EB2C 8FB7002C */  lw         $s7, 0x2c($sp)
/* F730 8000EB30 8FB60028 */  lw         $s6, 0x28($sp)
/* F734 8000EB34 8FB50024 */  lw         $s5, 0x24($sp)
/* F738 8000EB38 8FB40020 */  lw         $s4, 0x20($sp)
/* F73C 8000EB3C 8FB3001C */  lw         $s3, 0x1c($sp)
/* F740 8000EB40 8FB20018 */  lw         $s2, 0x18($sp)
/* F744 8000EB44 8FB10014 */  lw         $s1, 0x14($sp)
/* F748 8000EB48 8FB00010 */  lw         $s0, 0x10($sp)
/* F74C 8000EB4C 03E00008 */  jr         $ra
/* F750 8000EB50 27BD0038 */   addiu     $sp, $sp, 0x38

glabel get_zoneDatByte
/* F754 8000EB54 30C200FF */  andi       $v0, $a2, 0xff
/* F758 8000EB58 00023902 */  srl        $a3, $v0, 4
/* F75C 8000EB5C 3046000F */  andi       $a2, $v0, 0xf
/* F760 8000EB60 00042400 */  sll        $a0, $a0, 0x10
/* F764 8000EB64 3C03800E */  lui        $v1, %hi(zoneDatMatrix)
/* F768 8000EB68 24636988 */  addiu      $v1, $v1, %lo(zoneDatMatrix)
/* F76C 8000EB6C 00042403 */  sra        $a0, $a0, 0x10
/* F770 8000EB70 00052C00 */  sll        $a1, $a1, 0x10
/* F774 8000EB74 94620292 */  lhu        $v0, 0x292($v1)
/* F778 8000EB78 00052C03 */  sra        $a1, $a1, 0x10
/* F77C 8000EB7C 00441023 */  subu       $v0, $v0, $a0
/* F780 8000EB80 00E21021 */  addu       $v0, $a3, $v0
/* F784 8000EB84 3047FFFF */  andi       $a3, $v0, 0xffff
/* F788 8000EB88 94620294 */  lhu        $v0, 0x294($v1)
/* F78C 8000EB8C 2CE30003 */  sltiu      $v1, $a3, 3
/* F790 8000EB90 00451023 */  subu       $v0, $v0, $a1
/* F794 8000EB94 00C21021 */  addu       $v0, $a2, $v0
/* F798 8000EB98 10600004 */  beqz       $v1, .L8000EBAC
/* F79C 8000EB9C 3046FFFF */   andi      $a2, $v0, 0xffff
/* F7A0 8000EBA0 2CC20003 */  sltiu      $v0, $a2, 3
/* F7A4 8000EBA4 14400003 */  bnez       $v0, .L8000EBB4
/* F7A8 8000EBA8 00071100 */   sll       $v0, $a3, 4
.L8000EBAC:
/* F7AC 8000EBAC 03E00008 */  jr         $ra
/* F7B0 8000EBB0 24020011 */   addiu     $v0, $zero, 0x11
.L8000EBB4:
/* F7B4 8000EBB4 00461025 */  or         $v0, $v0, $a2
/* F7B8 8000EBB8 03E00008 */  jr         $ra
/* F7BC 8000EBBC 304200FF */   andi      $v0, $v0, 0xff

glabel set_playerdata_zoneDatByte
/* F7C0 8000EBC0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* F7C4 8000EBC4 00042400 */  sll        $a0, $a0, 0x10
/* F7C8 8000EBC8 AFB50024 */  sw         $s5, 0x24($sp)
/* F7CC 8000EBCC 0004AC03 */  sra        $s5, $a0, 0x10
/* F7D0 8000EBD0 00052C00 */  sll        $a1, $a1, 0x10
/* F7D4 8000EBD4 3C02800E */  lui        $v0, %hi(gGlobals)
/* F7D8 8000EBD8 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* F7DC 8000EBDC AFBF002C */  sw         $ra, 0x2c($sp)
/* F7E0 8000EBE0 AFB60028 */  sw         $s6, 0x28($sp)
/* F7E4 8000EBE4 AFB40020 */  sw         $s4, 0x20($sp)
/* F7E8 8000EBE8 AFB3001C */  sw         $s3, 0x1c($sp)
/* F7EC 8000EBEC AFB20018 */  sw         $s2, 0x18($sp)
/* F7F0 8000EBF0 AFB10014 */  sw         $s1, 0x14($sp)
/* F7F4 8000EBF4 AFB00010 */  sw         $s0, 0x10($sp)
/* F7F8 8000EBF8 844303B8 */  lh         $v1, 0x3b8($v0)
/* F7FC 8000EBFC 18600019 */  blez       $v1, .L8000EC64
/* F800 8000EC00 0005A403 */   sra       $s4, $a1, 0x10
/* F804 8000EC04 00409821 */  addu       $s3, $v0, $zero
/* F808 8000EC08 3C120001 */  lui        $s2, 1
/* F80C 8000EC0C 00008821 */  addu       $s1, $zero, $zero
/* F810 8000EC10 3C160001 */  lui        $s6, 1
.L8000EC14:
/* F814 8000EC14 8E6203C4 */  lw         $v0, 0x3c4($s3)
/* F818 8000EC18 00518021 */  addu       $s0, $v0, $s1
/* F81C 8000EC1C 86030002 */  lh         $v1, 2($s0)
/* F820 8000EC20 1060000A */  beqz       $v1, .L8000EC4C
/* F824 8000EC24 02401821 */   addu      $v1, $s2, $zero
/* F828 8000EC28 9202070A */  lbu        $v0, 0x70a($s0)
/* F82C 8000EC2C 54400008 */  bnel       $v0, $zero, .L8000EC50
/* F830 8000EC30 02569021 */   addu      $s2, $s2, $s6
/* F834 8000EC34 02A02021 */  addu       $a0, $s5, $zero
/* F838 8000EC38 9206070D */  lbu        $a2, 0x70d($s0)
/* F83C 8000EC3C 0C003AD5 */  jal        get_zoneDatByte
/* F840 8000EC40 02802821 */   addu      $a1, $s4, $zero
/* F844 8000EC44 A202070D */  sb         $v0, 0x70d($s0)
/* F848 8000EC48 02401821 */  addu       $v1, $s2, $zero
.L8000EC4C:
/* F84C 8000EC4C 02569021 */  addu       $s2, $s2, $s6
.L8000EC50:
/* F850 8000EC50 866203B8 */  lh         $v0, 0x3b8($s3)
/* F854 8000EC54 00031C03 */  sra        $v1, $v1, 0x10
/* F858 8000EC58 0062102A */  slt        $v0, $v1, $v0
/* F85C 8000EC5C 1440FFED */  bnez       $v0, .L8000EC14
/* F860 8000EC60 26310780 */   addiu     $s1, $s1, 0x780
.L8000EC64:
/* F864 8000EC64 8FBF002C */  lw         $ra, 0x2c($sp)
/* F868 8000EC68 8FB60028 */  lw         $s6, 0x28($sp)
/* F86C 8000EC6C 8FB50024 */  lw         $s5, 0x24($sp)
/* F870 8000EC70 8FB40020 */  lw         $s4, 0x20($sp)
/* F874 8000EC74 8FB3001C */  lw         $s3, 0x1c($sp)
/* F878 8000EC78 8FB20018 */  lw         $s2, 0x18($sp)
/* F87C 8000EC7C 8FB10014 */  lw         $s1, 0x14($sp)
/* F880 8000EC80 8FB00010 */  lw         $s0, 0x10($sp)
/* F884 8000EC84 03E00008 */  jr         $ra
/* F888 8000EC88 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8000EC8C
/* F88C 8000EC8C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* F890 8000EC90 00002021 */  addu       $a0, $zero, $zero
/* F894 8000EC94 AFB3001C */  sw         $s3, 0x1c($sp)
/* F898 8000EC98 3C13800F */  lui        $s3, 0x800f
/* F89C 8000EC9C 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* F8A0 8000ECA0 AFB60028 */  sw         $s6, 0x28($sp)
/* F8A4 8000ECA4 24566988 */  addiu      $s6, $v0, %lo(zoneDatMatrix)
/* F8A8 8000ECA8 AFB50024 */  sw         $s5, 0x24($sp)
/* F8AC 8000ECAC 3C15800E */  lui        $s5, 0x800e
/* F8B0 8000ECB0 AFB40020 */  sw         $s4, 0x20($sp)
/* F8B4 8000ECB4 3C140001 */  lui        $s4, 1
/* F8B8 8000ECB8 AFBF002C */  sw         $ra, 0x2c($sp)
/* F8BC 8000ECBC AFB20018 */  sw         $s2, 0x18($sp)
/* F8C0 8000ECC0 AFB10014 */  sw         $s1, 0x14($sp)
/* F8C4 8000ECC4 AFB00010 */  sw         $s0, 0x10($sp)
/* F8C8 8000ECC8 24920001 */  addiu      $s2, $a0, 1
.L8000ECCC:
/* F8CC 8000ECCC 3C110001 */  lui        $s1, 1
/* F8D0 8000ECD0 00041040 */  sll        $v0, $a0, 1
/* F8D4 8000ECD4 00441021 */  addu       $v0, $v0, $a0
/* F8D8 8000ECD8 00021140 */  sll        $v0, $v0, 5
/* F8DC 8000ECDC 02C28021 */  addu       $s0, $s6, $v0
.L8000ECE0:
/* F8E0 8000ECE0 8E040004 */  lw         $a0, 4($s0)
/* F8E4 8000ECE4 50800009 */  beql       $a0, $zero, .L8000ED0C
/* F8E8 8000ECE8 8E040014 */   lw        $a0, 0x14($s0)
/* F8EC 8000ECEC 9203001E */  lbu        $v1, 0x1e($s0)
/* F8F0 8000ECF0 30620001 */  andi       $v0, $v1, 1
/* F8F4 8000ECF4 10400004 */  beqz       $v0, .L8000ED08
/* F8F8 8000ECF8 306200FE */   andi      $v0, $v1, 0xfe
/* F8FC 8000ECFC 9205001D */  lbu        $a1, 0x1d($s0)
/* F900 8000ED00 0C003786 */  jal        func_8000DE18
/* F904 8000ED04 A202001E */   sb        $v0, 0x1e($s0)
.L8000ED08:
/* F908 8000ED08 8E040014 */  lw         $a0, 0x14($s0)
.L8000ED0C:
/* F90C 8000ED0C 50800009 */  beql       $a0, $zero, .L8000ED34
/* F910 8000ED10 8E05000C */   lw        $a1, 0xc($s0)
/* F914 8000ED14 9203001E */  lbu        $v1, 0x1e($s0)
/* F918 8000ED18 30620002 */  andi       $v0, $v1, 2
/* F91C 8000ED1C 10400004 */  beqz       $v0, .L8000ED30
/* F920 8000ED20 306200FD */   andi      $v0, $v1, 0xfd
/* F924 8000ED24 9205001D */  lbu        $a1, 0x1d($s0)
/* F928 8000ED28 0C003786 */  jal        func_8000DE18
/* F92C 8000ED2C A202001E */   sb        $v0, 0x1e($s0)
.L8000ED30:
/* F930 8000ED30 8E05000C */  lw         $a1, 0xc($s0)
.L8000ED34:
/* F934 8000ED34 10A00007 */  beqz       $a1, .L8000ED54
/* F938 8000ED38 96628DBC */   lhu       $v0, -0x7244($s3)
/* F93C 8000ED3C 10400005 */  beqz       $v0, .L8000ED54
/* F940 8000ED40 26A47BA0 */   addiu     $a0, $s5, 0x7ba0
/* F944 8000ED44 8E060018 */  lw         $a2, 0x18($s0)
/* F948 8000ED48 9207001D */  lbu        $a3, 0x1d($s0)
/* F94C 8000ED4C 0C015806 */  jal        audio_ref_objs
/* F950 8000ED50 24A50008 */   addiu     $a1, $a1, 8
.L8000ED54:
/* F954 8000ED54 02201021 */  addu       $v0, $s1, $zero
/* F958 8000ED58 02348821 */  addu       $s1, $s1, $s4
/* F95C 8000ED5C 00021403 */  sra        $v0, $v0, 0x10
/* F960 8000ED60 28420003 */  slti       $v0, $v0, 3
/* F964 8000ED64 1440FFDE */  bnez       $v0, .L8000ECE0
/* F968 8000ED68 26100020 */   addiu     $s0, $s0, 0x20
/* F96C 8000ED6C 00121400 */  sll        $v0, $s2, 0x10
/* F970 8000ED70 00022403 */  sra        $a0, $v0, 0x10
/* F974 8000ED74 28830003 */  slti       $v1, $a0, 3
/* F978 8000ED78 1460FFD4 */  bnez       $v1, .L8000ECCC
/* F97C 8000ED7C 24920001 */   addiu     $s2, $a0, 1
/* F980 8000ED80 8FBF002C */  lw         $ra, 0x2c($sp)
/* F984 8000ED84 8FB60028 */  lw         $s6, 0x28($sp)
/* F988 8000ED88 8FB50024 */  lw         $s5, 0x24($sp)
/* F98C 8000ED8C 8FB40020 */  lw         $s4, 0x20($sp)
/* F990 8000ED90 A6608DBC */  sh         $zero, -0x7244($s3)
/* F994 8000ED94 8FB3001C */  lw         $s3, 0x1c($sp)
/* F998 8000ED98 8FB20018 */  lw         $s2, 0x18($sp)
/* F99C 8000ED9C 8FB10014 */  lw         $s1, 0x14($sp)
/* F9A0 8000EDA0 8FB00010 */  lw         $s0, 0x10($sp)
/* F9A4 8000EDA4 03E00008 */  jr         $ra
/* F9A8 8000EDA8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel TeleportPlayer
/* F9AC 8000EDAC 27BDFEB8 */  addiu      $sp, $sp, -0x148
/* F9B0 8000EDB0 AFB20128 */  sw         $s2, 0x128($sp)
/* F9B4 8000EDB4 00809021 */  addu       $s2, $a0, $zero
/* F9B8 8000EDB8 AFB10124 */  sw         $s1, 0x124($sp)
/* F9BC 8000EDBC 00A08821 */  addu       $s1, $a1, $zero
/* F9C0 8000EDC0 AFBE0140 */  sw         $fp, 0x140($sp)
/* F9C4 8000EDC4 00C0F021 */  addu       $fp, $a2, $zero
/* F9C8 8000EDC8 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* F9CC 8000EDCC AFB40130 */  sw         $s4, 0x130($sp)
/* F9D0 8000EDD0 24546988 */  addiu      $s4, $v0, %lo(zoneDatMatrix)
/* F9D4 8000EDD4 AFB50134 */  sw         $s5, 0x134($sp)
/* F9D8 8000EDD8 2695FF20 */  addiu      $s5, $s4, -0xe0
/* F9DC 8000EDDC AFBF0144 */  sw         $ra, 0x144($sp)
/* F9E0 8000EDE0 AFB7013C */  sw         $s7, 0x13c($sp)
/* F9E4 8000EDE4 AFB60138 */  sw         $s6, 0x138($sp)
/* F9E8 8000EDE8 AFB3012C */  sw         $s3, 0x12c($sp)
/* F9EC 8000EDEC AFB00120 */  sw         $s0, 0x120($sp)
/* F9F0 8000EDF0 AFA00110 */  sw         $zero, 0x110($sp)
/* F9F4 8000EDF4 9633002E */  lhu        $s3, 0x2e($s1)
/* F9F8 8000EDF8 96370036 */  lhu        $s7, 0x36($s1)
/* F9FC 8000EDFC 86A2144C */  lh         $v0, 0x144c($s5)
/* FA00 8000EE00 26300028 */  addiu      $s0, $s1, 0x28
/* FA04 8000EE04 0C017EC4 */  jal        calloc_voxelChart_entries
/* FA08 8000EE08 AFA20114 */   sw        $v0, 0x114($sp)
/* FA0C 8000EE0C 0C00671F */  jal        clear_camera_voxel_pointer
/* FA10 8000EE10 0000B021 */   addu      $s6, $zero, $zero
/* FA14 8000EE14 86040002 */  lh         $a0, 2($s0)
/* FA18 8000EE18 86050004 */  lh         $a1, 4($s0)
/* FA1C 8000EE1C 0C003AF0 */  jal        set_playerdata_zoneDatByte
/* FA20 8000EE20 AFA00118 */   sw        $zero, 0x118($sp)
/* FA24 8000EE24 86050002 */  lh         $a1, 2($s0)
/* FA28 8000EE28 86060004 */  lh         $a2, 4($s0)
/* FA2C 8000EE2C 0C01560A */  jal        set_SFX_ZoneDatByte
/* FA30 8000EE30 26841218 */   addiu     $a0, $s4, 0x1218
/* FA34 8000EE34 2405FFFF */  addiu      $a1, $zero, -1
/* FA38 8000EE38 2406FFFF */  addiu      $a2, $zero, -1
/* FA3C 8000EE3C 96240028 */  lhu        $a0, 0x28($s1)
/* FA40 8000EE40 00003821 */  addu       $a3, $zero, $zero
/* FA44 8000EE44 A68402AC */  sh         $a0, 0x2ac($s4)
/* FA48 8000EE48 00042400 */  sll        $a0, $a0, 0x10
/* FA4C 8000EE4C 96020002 */  lhu        $v0, 2($s0)
/* FA50 8000EE50 00042403 */  sra        $a0, $a0, 0x10
/* FA54 8000EE54 A6820292 */  sh         $v0, 0x292($s4)
/* FA58 8000EE58 96030004 */  lhu        $v1, 4($s0)
/* FA5C 8000EE5C 2402FFFF */  addiu      $v0, $zero, -1
/* FA60 8000EE60 A68202AE */  sh         $v0, 0x2ae($s4)
/* FA64 8000EE64 A68202B0 */  sh         $v0, 0x2b0($s4)
/* FA68 8000EE68 0C00B297 */  jal        borgmaps_func
/* FA6C 8000EE6C A6830294 */   sh        $v1, 0x294($s4)
/* FA70 8000EE70 0C00461F */  jal        clear_music_no_expPak
/* FA74 8000EE74 00000000 */   nop
/* FA78 8000EE78 57C00005 */  bnel       $fp, $zero, .L8000EE90
/* FA7C 8000EE7C 86040002 */   lh        $a0, 2($s0)
/* FA80 8000EE80 3C03800F */  lui        $v1, %hi(no_TP_vec3)
/* FA84 8000EE84 24020001 */  addiu      $v0, $zero, 1
/* FA88 8000EE88 A4628DC2 */  sh         $v0, %lo(no_TP_vec3)($v1)
/* FA8C 8000EE8C 86040002 */  lh         $a0, 2($s0)
.L8000EE90:
/* FA90 8000EE90 0C0038A1 */  jal        loadGameBorgScenes
/* FA94 8000EE94 86050004 */   lh        $a1, 4($s0)
/* FA98 8000EE98 13C00006 */  beqz       $fp, .L8000EEB4
/* FA9C 8000EE9C 03C02021 */   addu      $a0, $fp, $zero
/* FAA0 8000EEA0 0C02AD17 */  jal        copyVec3
/* FAA4 8000EEA4 27A50010 */   addiu     $a1, $sp, 0x10
/* FAA8 8000EEA8 24020001 */  addiu      $v0, $zero, 1
/* FAAC 8000EEAC 08003BFD */  j          .L8000EFF4
/* FAB0 8000EEB0 AFA20118 */   sw        $v0, 0x118($sp)
.L8000EEB4:
/* FAB4 8000EEB4 86A3144C */  lh         $v1, 0x144c($s5)
/* FAB8 8000EEB8 24020004 */  addiu      $v0, $zero, 4
/* FABC 8000EEBC 14620006 */  bne        $v1, $v0, .L8000EED8
/* FAC0 8000EEC0 24020003 */   addiu     $v0, $zero, 3
/* FAC4 8000EEC4 26840134 */  addiu      $a0, $s4, 0x134
/* FAC8 8000EEC8 0C02C4D5 */  jal        set_camera_mode
/* FACC 8000EECC 24050001 */   addiu     $a1, $zero, 1
/* FAD0 8000EED0 86A3144C */  lh         $v1, 0x144c($s5)
/* FAD4 8000EED4 24020003 */  addiu      $v0, $zero, 3
.L8000EED8:
/* FAD8 8000EED8 14620005 */  bne        $v1, $v0, .L8000EEF0
/* FADC 8000EEDC 24027FF8 */   addiu     $v0, $zero, 0x7ff8
/* FAE0 8000EEE0 26840134 */  addiu      $a0, $s4, 0x134
/* FAE4 8000EEE4 0C02C4D5 */  jal        set_camera_mode
/* FAE8 8000EEE8 00002821 */   addu      $a1, $zero, $zero
/* FAEC 8000EEEC 24027FF8 */  addiu      $v0, $zero, 0x7ff8
.L8000EEF0:
/* FAF0 8000EEF0 12620018 */  beq        $s3, $v0, .L8000EF54
/* FAF4 8000EEF4 02602821 */   addu      $a1, $s3, $zero
/* FAF8 8000EEF8 8E84008C */  lw         $a0, 0x8c($s4)
/* FAFC 8000EEFC 0C003A50 */  jal        FindReferncePoint
/* FB00 8000EF00 24840008 */   addiu     $a0, $a0, 8
/* FB04 8000EF04 0040B021 */  addu       $s6, $v0, $zero
/* FB08 8000EF08 26901F98 */  addiu      $s0, $s4, 0x1f98
/* FB0C 8000EF0C 02002021 */  addu       $a0, $s0, $zero
/* FB10 8000EF10 3C05800E */  lui        $a1, %hi(D_800D8610)
/* FB14 8000EF14 24A58610 */  addiu      $a1, $a1, %lo(D_800D8610)
/* FB18 8000EF18 0C0333AC */  jal        sprintf
/* FB1C 8000EF1C 02603021 */   addu      $a2, $s3, $zero
/* FB20 8000EF20 56C00006 */  bnel       $s6, $zero, .L8000EF3C
/* FB24 8000EF24 8EC20000 */   lw        $v0, ($s6)
/* FB28 8000EF28 3C04800E */  lui        $a0, %hi(D_800D8638)
/* FB2C 8000EF2C 24848638 */  addiu      $a0, $a0, %lo(D_800D8638)
/* FB30 8000EF30 0C025F2D */  jal        manualCrash
/* FB34 8000EF34 02002821 */   addu      $a1, $s0, $zero
/* FB38 8000EF38 8EC20000 */  lw         $v0, ($s6)
.L8000EF3C:
/* FB3C 8000EF3C AFA20010 */  sw         $v0, 0x10($sp)
/* FB40 8000EF40 8EC30004 */  lw         $v1, 4($s6)
/* FB44 8000EF44 AFA30014 */  sw         $v1, 0x14($sp)
/* FB48 8000EF48 8EC20008 */  lw         $v0, 8($s6)
/* FB4C 8000EF4C 08003BDB */  j          .L8000EF6C
/* FB50 8000EF50 AFA20018 */   sw        $v0, 0x18($sp)
.L8000EF54:
/* FB54 8000EF54 8E220000 */  lw         $v0, ($s1)
/* FB58 8000EF58 8E230004 */  lw         $v1, 4($s1)
/* FB5C 8000EF5C 8E240008 */  lw         $a0, 8($s1)
/* FB60 8000EF60 AFA20010 */  sw         $v0, 0x10($sp)
/* FB64 8000EF64 AFA30014 */  sw         $v1, 0x14($sp)
/* FB68 8000EF68 AFA40018 */  sw         $a0, 0x18($sp)
.L8000EF6C:
/* FB6C 8000EF6C 12E00005 */  beqz       $s7, .L8000EF84
/* FB70 8000EF70 02E02821 */   addu      $a1, $s7, $zero
/* FB74 8000EF74 8E84008C */  lw         $a0, 0x8c($s4)
/* FB78 8000EF78 0C003A50 */  jal        FindReferncePoint
/* FB7C 8000EF7C 24840008 */   addiu     $a0, $a0, 8
/* FB80 8000EF80 AFA20110 */  sw         $v0, 0x110($sp)
.L8000EF84:
/* FB84 8000EF84 12400004 */  beqz       $s2, .L8000EF98
/* FB88 8000EF88 27A40010 */   addiu     $a0, $sp, 0x10
/* FB8C 8000EF8C 00802821 */  addu       $a1, $a0, $zero
/* FB90 8000EF90 0C02AB26 */  jal        Vec3A_BsubC
/* FB94 8000EF94 26460068 */   addiu     $a2, $s2, 0x68
.L8000EF98:
/* FB98 8000EF98 12C00016 */  beqz       $s6, .L8000EFF4
/* FB9C 8000EF9C AFA00014 */   sw        $zero, 0x14($sp)
/* FBA0 8000EFA0 26D0003C */  addiu      $s0, $s6, 0x3c
/* FBA4 8000EFA4 02002021 */  addu       $a0, $s0, $zero
/* FBA8 8000EFA8 0C02ABBB */  jal        vec3_normalize
/* FBAC 8000EFAC AEC00040 */   sw        $zero, 0x40($s6)
/* FBB0 8000EFB0 0C02AB0F */  jal        vec3hypotenouse
/* FBB4 8000EFB4 02002021 */   addu      $a0, $s0, $zero
/* FBB8 8000EFB8 3C01800E */  lui        $at, %hi(D_800D8648)
/* FBBC 8000EFBC D4228648 */  ldc1       $f2, %lo(D_800D8648)($at)
/* FBC0 8000EFC0 46000021 */  cvt.d.s    $f0, $f0
/* FBC4 8000EFC4 4620103C */  c.lt.d     $f2, $f0
/* FBC8 8000EFC8 00000000 */  nop
/* FBCC 8000EFCC 45000009 */  bc1f       .L8000EFF4
/* FBD0 8000EFD0 00000000 */   nop
/* FBD4 8000EFD4 C6C0003C */  lwc1       $f0, 0x3c($s6)
/* FBD8 8000EFD8 C6C20044 */  lwc1       $f2, 0x44($s6)
/* FBDC 8000EFDC 46000007 */  neg.s      $f0, $f0
/* FBE0 8000EFE0 46001087 */  neg.s      $f2, $f2
/* FBE4 8000EFE4 44050000 */  mfc1       $a1, $f0
/* FBE8 8000EFE8 44061000 */  mfc1       $a2, $f2
/* FBEC 8000EFEC 0C02AD55 */  jal        setVec2
/* FBF0 8000EFF0 26440020 */   addiu     $a0, $s2, 0x20
.L8000EFF4:
/* FBF4 8000EFF4 12400024 */  beqz       $s2, .L8000F088
/* FBF8 8000EFF8 3C13800E */   lui       $s3, 0x800e
/* FBFC 8000EFFC 27A40010 */  addiu      $a0, $sp, 0x10
/* FC00 8000F000 0C003A2C */  jal        func_8000E8B0
/* FC04 8000F004 02402821 */   addu      $a1, $s2, $zero
/* FC08 8000F008 26500068 */  addiu      $s0, $s2, 0x68
/* FC0C 8000F00C 02002021 */  addu       $a0, $s0, $zero
/* FC10 8000F010 0C02AD17 */  jal        copyVec3
/* FC14 8000F014 27A50010 */   addiu     $a1, $sp, 0x10
/* FC18 8000F018 52C00002 */  beql       $s6, $zero, .L8000F024
/* FC1C 8000F01C C642006C */   lwc1      $f2, 0x6c($s2)
/* FC20 8000F020 C6C20004 */  lwc1       $f2, 4($s6)
.L8000F024:
/* FC24 8000F024 8FA20118 */  lw         $v0, 0x118($sp)
/* FC28 8000F028 14400013 */  bnez       $v0, .L8000F078
/* FC2C 8000F02C 3C13800E */   lui       $s3, 0x800e
/* FC30 8000F030 C6400064 */  lwc1       $f0, 0x64($s2)
/* FC34 8000F034 46001081 */  sub.s      $f2, $f2, $f0
/* FC38 8000F038 02402021 */  addu       $a0, $s2, $zero
/* FC3C 8000F03C 24060001 */  addiu      $a2, $zero, 1
/* FC40 8000F040 44051000 */  mfc1       $a1, $f2
/* FC44 8000F044 0C005539 */  jal        func_800154E4
/* FC48 8000F048 00003821 */   addu      $a3, $zero, $zero
/* FC4C 8000F04C 54400007 */  bnel       $v0, $zero, .L8000F06C
/* FC50 8000F050 266468A8 */   addiu     $a0, $s3, 0x68a8
/* FC54 8000F054 02402021 */  addu       $a0, $s2, $zero
/* FC58 8000F058 00002821 */  addu       $a1, $zero, $zero
/* FC5C 8000F05C 00003021 */  addu       $a2, $zero, $zero
/* FC60 8000F060 0C005539 */  jal        func_800154E4
/* FC64 8000F064 00003821 */   addu      $a3, $zero, $zero
/* FC68 8000F068 266468A8 */  addiu      $a0, $s3, 0x68a8
.L8000F06C:
/* FC6C 8000F06C AC8003A8 */  sw         $zero, 0x3a8($a0)
/* FC70 8000F070 0C02CAF1 */  jal        func_800B2BC4
/* FC74 8000F074 24840430 */   addiu     $a0, $a0, 0x430
.L8000F078:
/* FC78 8000F078 3C04800E */  lui        $a0, %hi(Camera)
/* FC7C 8000F07C 24846ABC */  addiu      $a0, $a0, %lo(Camera)
/* FC80 8000F080 0C02C131 */  jal        func_800B04C4
/* FC84 8000F084 02002821 */   addu      $a1, $s0, $zero
.L8000F088:
/* FC88 8000F088 8FA20110 */  lw         $v0, 0x110($sp)
/* FC8C 8000F08C 10400006 */  beqz       $v0, .L8000F0A8
/* FC90 8000F090 3C04800E */   lui       $a0, %hi(Camera)
/* FC94 8000F094 24846ABC */  addiu      $a0, $a0, %lo(Camera)
/* FC98 8000F098 0C02C058 */  jal        camera_set_position
/* FC9C 8000F09C 00402821 */   addu      $a1, $v0, $zero
/* FCA0 8000F0A0 08003C74 */  j          .L8000F1D0
/* FCA4 8000F0A4 266368A8 */   addiu     $v1, $s3, 0x68a8
.L8000F0A8:
/* FCA8 8000F0A8 12400049 */  beqz       $s2, .L8000F1D0
/* FCAC 8000F0AC 266368A8 */   addiu     $v1, $s3, 0x68a8
/* FCB0 8000F0B0 17C00048 */  bnez       $fp, .L8000F1D4
/* FCB4 8000F0B4 24020005 */   addiu     $v0, $zero, 5
/* FCB8 8000F0B8 3C02800E */  lui        $v0, %hi(Camera)
/* FCBC 8000F0BC 24516ABC */  addiu      $s1, $v0, %lo(Camera)
/* FCC0 8000F0C0 86231238 */  lh         $v1, 0x1238($s1)
/* FCC4 8000F0C4 24020004 */  addiu      $v0, $zero, 4
/* FCC8 8000F0C8 14620026 */  bne        $v1, $v0, .L8000F164
/* FCCC 8000F0CC 02202021 */   addu      $a0, $s1, $zero
/* FCD0 8000F0D0 C6420020 */  lwc1       $f2, 0x20($s2)
/* FCD4 8000F0D4 3C01800E */  lui        $at, %hi(D_800D8650)
/* FCD8 8000F0D8 C4208650 */  lwc1       $f0, %lo(D_800D8650)($at)
/* FCDC 8000F0DC 27A50050 */  addiu      $a1, $sp, 0x50
/* FCE0 8000F0E0 46001082 */  mul.s      $f2, $f2, $f0
/* FCE4 8000F0E4 8E430068 */  lw         $v1, 0x68($s2)
/* FCE8 8000F0E8 8E42006C */  lw         $v0, 0x6c($s2)
/* FCEC 8000F0EC C64A0024 */  lwc1       $f10, 0x24($s2)
/* FCF0 8000F0F0 3C01800E */  lui        $at, %hi(D_800D8654)
/* FCF4 8000F0F4 C4248654 */  lwc1       $f4, %lo(D_800D8654)($at)
/* FCF8 8000F0F8 46005282 */  mul.s      $f10, $f10, $f0
/* FCFC 8000F0FC AFA30050 */  sw         $v1, 0x50($sp)
/* FD00 8000F100 AFA20054 */  sw         $v0, 0x54($sp)
/* FD04 8000F104 AFA20094 */  sw         $v0, 0x94($sp)
/* FD08 8000F108 8E420070 */  lw         $v0, 0x70($s2)
/* FD0C 8000F10C C7A60094 */  lwc1       $f6, 0x94($sp)
/* FD10 8000F110 C620006C */  lwc1       $f0, 0x6c($s1)
/* FD14 8000F114 C7A80050 */  lwc1       $f8, 0x50($sp)
/* FD18 8000F118 46003180 */  add.s      $f6, $f6, $f0
/* FD1C 8000F11C AFA30090 */  sw         $v1, 0x90($sp)
/* FD20 8000F120 C7A00054 */  lwc1       $f0, 0x54($sp)
/* FD24 8000F124 46024201 */  sub.s      $f8, $f8, $f2
/* FD28 8000F128 AFA20058 */  sw         $v0, 0x58($sp)
/* FD2C 8000F12C C7A20058 */  lwc1       $f2, 0x58($sp)
/* FD30 8000F130 46040000 */  add.s      $f0, $f0, $f4
/* FD34 8000F134 AFA20098 */  sw         $v0, 0x98($sp)
/* FD38 8000F138 E7A60094 */  swc1       $f6, 0x94($sp)
/* FD3C 8000F13C 460A1081 */  sub.s      $f2, $f2, $f10
/* FD40 8000F140 E7A00054 */  swc1       $f0, 0x54($sp)
/* FD44 8000F144 E7A80050 */  swc1       $f8, 0x50($sp)
/* FD48 8000F148 0C02C058 */  jal        camera_set_position
/* FD4C 8000F14C E7A20058 */   swc1      $f2, 0x58($sp)
/* FD50 8000F150 02202021 */  addu       $a0, $s1, $zero
/* FD54 8000F154 0C02C069 */  jal        camera_set_aim
/* FD58 8000F158 27A50090 */   addiu     $a1, $sp, 0x90
/* FD5C 8000F15C 08003C74 */  j          .L8000F1D0
/* FD60 8000F160 266368A8 */   addiu     $v1, $s3, 0x68a8
.L8000F164:
/* FD64 8000F164 27B000D0 */  addiu      $s0, $sp, 0xd0
/* FD68 8000F168 8E42006C */  lw         $v0, 0x6c($s2)
/* FD6C 8000F16C 02002821 */  addu       $a1, $s0, $zero
/* FD70 8000F170 AFA200D4 */  sw         $v0, 0xd4($sp)
/* FD74 8000F174 8E430068 */  lw         $v1, 0x68($s2)
/* FD78 8000F178 C7A000D4 */  lwc1       $f0, 0xd4($sp)
/* FD7C 8000F17C C622006C */  lwc1       $f2, 0x6c($s1)
/* FD80 8000F180 8E420070 */  lw         $v0, 0x70($s2)
/* FD84 8000F184 46020000 */  add.s      $f0, $f0, $f2
/* FD88 8000F188 AFA300D0 */  sw         $v1, 0xd0($sp)
/* FD8C 8000F18C AFA200D8 */  sw         $v0, 0xd8($sp)
/* FD90 8000F190 0C02C069 */  jal        camera_set_aim
/* FD94 8000F194 E7A000D4 */   swc1      $f0, 0xd4($sp)
/* FD98 8000F198 8E420020 */  lw         $v0, 0x20($s2)
/* FD9C 8000F19C 3C05BF80 */  lui        $a1, 0xbf80
/* FDA0 8000F1A0 AE220030 */  sw         $v0, 0x30($s1)
/* FDA4 8000F1A4 8E430024 */  lw         $v1, 0x24($s2)
/* FDA8 8000F1A8 26240030 */  addiu      $a0, $s1, 0x30
/* FDAC 8000F1AC 0C02AD34 */  jal        multiVec2
/* FDB0 8000F1B0 AE230034 */   sw        $v1, 0x34($s1)
/* FDB4 8000F1B4 02202021 */  addu       $a0, $s1, $zero
/* FDB8 8000F1B8 0C02C143 */  jal        func_800B050C
/* FDBC 8000F1BC 02002821 */   addu      $a1, $s0, $zero
/* FDC0 8000F1C0 02202021 */  addu       $a0, $s1, $zero
/* FDC4 8000F1C4 0C02C058 */  jal        camera_set_position
/* FDC8 8000F1C8 02002821 */   addu      $a1, $s0, $zero
/* FDCC 8000F1CC 266368A8 */  addiu      $v1, $s3, 0x68a8
.L8000F1D0:
/* FDD0 8000F1D0 24020005 */  addiu      $v0, $zero, 5
.L8000F1D4:
/* FDD4 8000F1D4 13C00003 */  beqz       $fp, .L8000F1E4
/* FDD8 8000F1D8 A4620294 */   sh        $v0, 0x294($v1)
/* FDDC 8000F1DC 12C0001E */  beqz       $s6, .L8000F258
/* FDE0 8000F1E0 266268A8 */   addiu     $v0, $s3, 0x68a8
.L8000F1E4:
/* FDE4 8000F1E4 00003021 */  addu       $a2, $zero, $zero
/* FDE8 8000F1E8 3C075555 */  lui        $a3, 0x5555
/* FDEC 8000F1EC 34E75556 */  ori        $a3, $a3, 0x5556
/* FDF0 8000F1F0 240A00FF */  addiu      $t2, $zero, 0xff
/* FDF4 8000F1F4 3C080001 */  lui        $t0, 1
/* FDF8 8000F1F8 3C090001 */  lui        $t1, 1
.L8000F1FC:
/* FDFC 8000F1FC 00C70018 */  mult       $a2, $a3
/* FE00 8000F200 01002821 */  addu       $a1, $t0, $zero
/* FE04 8000F204 01094021 */  addu       $t0, $t0, $t1
/* FE08 8000F208 000617C3 */  sra        $v0, $a2, 0x1f
/* FE0C 8000F20C 00002010 */  mfhi       $a0
/* FE10 8000F210 00822023 */  subu       $a0, $a0, $v0
/* FE14 8000F214 00041840 */  sll        $v1, $a0, 1
/* FE18 8000F218 00641821 */  addu       $v1, $v1, $a0
/* FE1C 8000F21C 00C31823 */  subu       $v1, $a2, $v1
/* FE20 8000F220 00031C00 */  sll        $v1, $v1, 0x10
/* FE24 8000F224 00031AC3 */  sra        $v1, $v1, 0xb
/* FE28 8000F228 00042400 */  sll        $a0, $a0, 0x10
/* FE2C 8000F22C 00042403 */  sra        $a0, $a0, 0x10
/* FE30 8000F230 00041040 */  sll        $v0, $a0, 1
/* FE34 8000F234 00441021 */  addu       $v0, $v0, $a0
/* FE38 8000F238 00021140 */  sll        $v0, $v0, 5
/* FE3C 8000F23C 00621821 */  addu       $v1, $v1, $v0
/* FE40 8000F240 02831821 */  addu       $v1, $s4, $v1
/* FE44 8000F244 00053403 */  sra        $a2, $a1, 0x10
/* FE48 8000F248 28C20009 */  slti       $v0, $a2, 9
/* FE4C 8000F24C 1440FFEB */  bnez       $v0, .L8000F1FC
/* FE50 8000F250 A06A001C */   sb        $t2, 0x1c($v1)
/* FE54 8000F254 266268A8 */  addiu      $v0, $s3, 0x68a8
.L8000F258:
/* FE58 8000F258 8443144C */  lh         $v1, 0x144c($v0)
/* FE5C 8000F25C 8FA20114 */  lw         $v0, 0x114($sp)
/* FE60 8000F260 1043000D */  beq        $v0, $v1, .L8000F298
/* FE64 8000F264 24020004 */   addiu     $v0, $zero, 4
/* FE68 8000F268 14620007 */  bne        $v1, $v0, .L8000F288
/* FE6C 8000F26C 00000000 */   nop
/* FE70 8000F270 0C00AF26 */  jal        xor_sundail_moon
/* FE74 8000F274 00002021 */   addu      $a0, $zero, $zero
/* FE78 8000F278 0C00AF21 */  jal        xor_sundail_sun
/* FE7C 8000F27C 00002021 */   addu      $a0, $zero, $zero
/* FE80 8000F280 08003CA7 */  j          .L8000F29C
/* FE84 8000F284 266368A8 */   addiu     $v1, $s3, 0x68a8
.L8000F288:
/* FE88 8000F288 0C00AF26 */  jal        xor_sundail_moon
/* FE8C 8000F28C 24040001 */   addiu     $a0, $zero, 1
/* FE90 8000F290 0C00AF21 */  jal        xor_sundail_sun
/* FE94 8000F294 24040001 */   addiu     $a0, $zero, 1
.L8000F298:
/* FE98 8000F298 266368A8 */  addiu      $v1, $s3, 0x68a8
.L8000F29C:
/* FE9C 8000F29C 8C62150C */  lw         $v0, 0x150c($v1)
/* FEA0 8000F2A0 1040000B */  beqz       $v0, .L8000F2D0
/* FEA4 8000F2A4 2464150C */   addiu     $a0, $v1, 0x150c
/* FEA8 8000F2A8 86850292 */  lh         $a1, 0x292($s4)
/* FEAC 8000F2AC 8C6200A8 */  lw         $v0, 0xa8($v1)
/* FEB0 8000F2B0 86860294 */  lh         $a2, 0x294($s4)
/* FEB4 8000F2B4 C4400068 */  lwc1       $f0, 0x68($v0)
/* FEB8 8000F2B8 E4601518 */  swc1       $f0, 0x1518($v1)
/* FEBC 8000F2BC C442006C */  lwc1       $f2, 0x6c($v0)
/* FEC0 8000F2C0 E462151C */  swc1       $f2, 0x151c($v1)
/* FEC4 8000F2C4 C4400070 */  lwc1       $f0, 0x70($v0)
/* FEC8 8000F2C8 0C014A57 */  jal        func_8005295C
/* FECC 8000F2CC E4601520 */   swc1      $f0, 0x1520($v1)
.L8000F2D0:
/* FED0 8000F2D0 8FBF0144 */  lw         $ra, 0x144($sp)
/* FED4 8000F2D4 8FBE0140 */  lw         $fp, 0x140($sp)
/* FED8 8000F2D8 8FB7013C */  lw         $s7, 0x13c($sp)
/* FEDC 8000F2DC 8FB60138 */  lw         $s6, 0x138($sp)
/* FEE0 8000F2E0 8FB50134 */  lw         $s5, 0x134($sp)
/* FEE4 8000F2E4 8FB40130 */  lw         $s4, 0x130($sp)
/* FEE8 8000F2E8 8FB3012C */  lw         $s3, 0x12c($sp)
/* FEEC 8000F2EC 8FB20128 */  lw         $s2, 0x128($sp)
/* FEF0 8000F2F0 8FB10124 */  lw         $s1, 0x124($sp)
/* FEF4 8000F2F4 8FB00120 */  lw         $s0, 0x120($sp)
/* FEF8 8000F2F8 03E00008 */  jr         $ra
/* FEFC 8000F2FC 27BD0148 */   addiu     $sp, $sp, 0x148

glabel ConfirmPlayerWithinZone
/* FF00 8000F300 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* FF04 8000F304 AFB00050 */  sw         $s0, 0x50($sp)
/* FF08 8000F308 00808021 */  addu       $s0, $a0, $zero
/* FF0C 8000F30C AFBF0054 */  sw         $ra, 0x54($sp)
/* FF10 8000F310 F7B40058 */  sdc1       $f20, 0x58($sp)
/* FF14 8000F314 9202070B */  lbu        $v0, 0x70b($s0)
/* FF18 8000F318 14400027 */  bnez       $v0, .L8000F3B8
/* FF1C 8000F31C 26030068 */   addiu     $v1, $s0, 0x68
/* FF20 8000F320 C4620004 */  lwc1       $f2, 4($v1)
/* FF24 8000F324 3C01800E */  lui        $at, %hi(D_800D8670)
/* FF28 8000F328 C4208670 */  lwc1       $f0, %lo(D_800D8670)($at)
/* FF2C 8000F32C 4600103C */  c.lt.s     $f2, $f0
/* FF30 8000F330 00000000 */  nop
/* FF34 8000F334 45010009 */  bc1t       .L8000F35C
/* FF38 8000F338 00000000 */   nop
/* FF3C 8000F33C C6000078 */  lwc1       $f0, 0x78($s0)
/* FF40 8000F340 3C01800E */  lui        $at, %hi(D_800D8678)
/* FF44 8000F344 D4228678 */  ldc1       $f2, %lo(D_800D8678)($at)
/* FF48 8000F348 46000021 */  cvt.d.s    $f0, $f0
/* FF4C 8000F34C 4622003C */  c.lt.d     $f0, $f2
/* FF50 8000F350 00000000 */  nop
/* FF54 8000F354 45020019 */  bc1fl      .L8000F3BC
/* FF58 8000F358 C4640000 */   lwc1      $f4, ($v1)
.L8000F35C:
/* FF5C 8000F35C 4480A000 */  mtc1       $zero, $f20
/* FF60 8000F360 3C01800E */  lui        $at, %hi(D_800D8680)
/* FF64 8000F364 C4208680 */  lwc1       $f0, %lo(D_800D8680)($at)
/* FF68 8000F368 4405A000 */  mfc1       $a1, $f20
/* FF6C 8000F36C 4406A000 */  mfc1       $a2, $f20
/* FF70 8000F370 4407A000 */  mfc1       $a3, $f20
/* FF74 8000F374 26040074 */  addiu      $a0, $s0, 0x74
/* FF78 8000F378 0C02AD58 */  jal        setVec3
/* FF7C 8000F37C E600006C */   swc1      $f0, 0x6c($s0)
/* FF80 8000F380 02002021 */  addu       $a0, $s0, $zero
/* FF84 8000F384 00003021 */  addu       $a2, $zero, $zero
/* FF88 8000F388 4405A000 */  mfc1       $a1, $f20
/* FF8C 8000F38C 0C005539 */  jal        func_800154E4
/* FF90 8000F390 00003821 */   addu      $a3, $zero, $zero
/* FF94 8000F394 14400004 */  bnez       $v0, .L8000F3A8
/* FF98 8000F398 3C04800E */   lui       $a0, %hi(D_800D8658)
/* FF9C 8000F39C 3C01800E */  lui        $at, %hi(D_800D8684)
/* FFA0 8000F3A0 C4208684 */  lwc1       $f0, %lo(D_800D8684)($at)
/* FFA4 8000F3A4 E6000078 */  swc1       $f0, 0x78($s0)
.L8000F3A8:
/* FFA8 8000F3A8 0C00B6B8 */  jal        debug_queue
/* FFAC 8000F3AC 24848658 */   addiu     $a0, $a0, %lo(D_800D8658)
/* FFB0 8000F3B0 08003D34 */  j          .L8000F4D0
/* FFB4 8000F3B4 8FBF0054 */   lw        $ra, 0x54($sp)
.L8000F3B8:
/* FFB8 8000F3B8 C4640000 */  lwc1       $f4, ($v1)
.L8000F3BC:
/* FFBC 8000F3BC 44800000 */  mtc1       $zero, $f0
/* FFC0 8000F3C0 4600203C */  c.lt.s     $f4, $f0
/* FFC4 8000F3C4 00000000 */  nop
/* FFC8 8000F3C8 45010011 */  bc1t       .L8000F410
/* FFCC 8000F3CC 3C04800E */   lui       $a0, %hi(gGlobals)
/* FFD0 8000F3D0 C4620008 */  lwc1       $f2, 8($v1)
/* FFD4 8000F3D4 4600103C */  c.lt.s     $f2, $f0
/* FFD8 8000F3D8 00000000 */  nop
/* FFDC 8000F3DC 4503000D */  bc1tl      .L8000F414
/* FFE0 8000F3E0 248468A8 */   addiu     $a0, $a0, %lo(gGlobals)
/* FFE4 8000F3E4 248268A8 */  addiu      $v0, $a0, 0x68a8
/* FFE8 8000F3E8 C440037C */  lwc1       $f0, 0x37c($v0)
/* FFEC 8000F3EC 4604003C */  c.lt.s     $f0, $f4
/* FFF0 8000F3F0 00000000 */  nop
/* FFF4 8000F3F4 45030007 */  bc1tl      .L8000F414
/* FFF8 8000F3F8 248468A8 */   addiu     $a0, $a0, 0x68a8
/* FFFC 8000F3FC C4400380 */  lwc1       $f0, 0x380($v0)
/* 10000 8000F400 4602003C */  c.lt.s     $f0, $f2
/* 10004 8000F404 00000000 */  nop
/* 10008 8000F408 45000031 */  bc1f       .L8000F4D0
/* 1000C 8000F40C 8FBF0054 */   lw        $ra, 0x54($sp)
.L8000F410:
/* 10010 8000F410 248468A8 */  addiu      $a0, $a0, 0x68a8
.L8000F414:
/* 10014 8000F414 84850372 */  lh         $a1, 0x372($a0)
/* 10018 8000F418 44802000 */  mtc1       $zero, $f4
/* 1001C 8000F41C C4600000 */  lwc1       $f0, ($v1)
/* 10020 8000F420 84860374 */  lh         $a2, 0x374($a0)
/* 10024 8000F424 4604003C */  c.lt.s     $f0, $f4
/* 10028 8000F428 E7A40018 */  swc1       $f4, 0x18($sp)
/* 1002C 8000F42C E7A40014 */  swc1       $f4, 0x14($sp)
/* 10030 8000F430 45000006 */  bc1f       .L8000F44C
/* 10034 8000F434 E7A40010 */   swc1      $f4, 0x10($sp)
/* 10038 8000F438 24A2FFFF */  addiu      $v0, $a1, -1
/* 1003C 8000F43C 00021400 */  sll        $v0, $v0, 0x10
/* 10040 8000F440 C480037C */  lwc1       $f0, 0x37c($a0)
/* 10044 8000F444 00022C03 */  sra        $a1, $v0, 0x10
/* 10048 8000F448 E7A00010 */  swc1       $f0, 0x10($sp)
.L8000F44C:
/* 1004C 8000F44C C4600000 */  lwc1       $f0, ($v1)
/* 10050 8000F450 C482037C */  lwc1       $f2, 0x37c($a0)
/* 10054 8000F454 4600103C */  c.lt.s     $f2, $f0
/* 10058 8000F458 00000000 */  nop
/* 1005C 8000F45C 45000005 */  bc1f       .L8000F474
/* 10060 8000F460 24A20001 */   addiu     $v0, $a1, 1
/* 10064 8000F464 00021400 */  sll        $v0, $v0, 0x10
/* 10068 8000F468 00022C03 */  sra        $a1, $v0, 0x10
/* 1006C 8000F46C 46001007 */  neg.s      $f0, $f2
/* 10070 8000F470 E7A00010 */  swc1       $f0, 0x10($sp)
.L8000F474:
/* 10074 8000F474 C4600008 */  lwc1       $f0, 8($v1)
/* 10078 8000F478 4604003C */  c.lt.s     $f0, $f4
/* 1007C 8000F47C 00000000 */  nop
/* 10080 8000F480 45000006 */  bc1f       .L8000F49C
/* 10084 8000F484 24C2FFFF */   addiu     $v0, $a2, -1
/* 10088 8000F488 00021400 */  sll        $v0, $v0, 0x10
/* 1008C 8000F48C C4800380 */  lwc1       $f0, 0x380($a0)
/* 10090 8000F490 00023403 */  sra        $a2, $v0, 0x10
/* 10094 8000F494 E7A00018 */  swc1       $f0, 0x18($sp)
/* 10098 8000F498 C4600008 */  lwc1       $f0, 8($v1)
.L8000F49C:
/* 1009C 8000F49C C4820380 */  lwc1       $f2, 0x380($a0)
/* 100A0 8000F4A0 4600103C */  c.lt.s     $f2, $f0
/* 100A4 8000F4A4 00000000 */  nop
/* 100A8 8000F4A8 45000005 */  bc1f       .L8000F4C0
/* 100AC 8000F4AC 24C20001 */   addiu     $v0, $a2, 1
/* 100B0 8000F4B0 00021400 */  sll        $v0, $v0, 0x10
/* 100B4 8000F4B4 00023403 */  sra        $a2, $v0, 0x10
/* 100B8 8000F4B8 46001007 */  neg.s      $f0, $f2
/* 100BC 8000F4BC E7A00018 */  swc1       $f0, 0x18($sp)
.L8000F4C0:
/* 100C0 8000F4C0 8484038C */  lh         $a0, 0x38c($a0)
/* 100C4 8000F4C4 0C003507 */  jal        set_teleport_obj_A
/* 100C8 8000F4C8 27A70010 */   addiu     $a3, $sp, 0x10
/* 100CC 8000F4CC 8FBF0054 */  lw         $ra, 0x54($sp)
.L8000F4D0:
/* 100D0 8000F4D0 8FB00050 */  lw         $s0, 0x50($sp)
/* 100D4 8000F4D4 D7B40058 */  ldc1       $f20, 0x58($sp)
/* 100D8 8000F4D8 03E00008 */  jr         $ra
/* 100DC 8000F4DC 27BD0060 */   addiu     $sp, $sp, 0x60

glabel load_borg_5_func
/* 100E0 8000F4E0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 100E4 8000F4E4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 100E8 8000F4E8 0C027E7A */  jal        BorgAnimLoadScene
/* 100EC 8000F4EC AFB00010 */   sw        $s0, 0x10($sp)
/* 100F0 8000F4F0 00408021 */  addu       $s0, $v0, $zero
/* 100F4 8000F4F4 0C029FD9 */  jal        func_800A7F64
/* 100F8 8000F4F8 02002021 */   addu      $a0, $s0, $zero
/* 100FC 8000F4FC 0C029FFD */  jal        func_800A7FF4
/* 10100 8000F500 02002021 */   addu      $a0, $s0, $zero
/* 10104 8000F504 0C02A050 */  jal        func_800A8140
/* 10108 8000F508 02002021 */   addu      $a0, $s0, $zero
/* 1010C 8000F50C 02001021 */  addu       $v0, $s0, $zero
/* 10110 8000F510 8FBF0014 */  lw         $ra, 0x14($sp)
/* 10114 8000F514 8FB00010 */  lw         $s0, 0x10($sp)
/* 10118 8000F518 03E00008 */  jr         $ra
/* 1011C 8000F51C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_anidat_colors
/* 10120 8000F520 27BDFF10 */  addiu      $sp, $sp, -0xf0
/* 10124 8000F524 AFB200E0 */  sw         $s2, 0xe0($sp)
/* 10128 8000F528 00809021 */  addu       $s2, $a0, $zero
/* 1012C 8000F52C AFB100DC */  sw         $s1, 0xdc($sp)
/* 10130 8000F530 30B100FF */  andi       $s1, $a1, 0xff
/* 10134 8000F534 AFB300E4 */  sw         $s3, 0xe4($sp)
/* 10138 8000F538 30D300FF */  andi       $s3, $a2, 0xff
/* 1013C 8000F53C AFBF00EC */  sw         $ra, 0xec($sp)
/* 10140 8000F540 AFB400E8 */  sw         $s4, 0xe8($sp)
/* 10144 8000F544 AFB000D8 */  sw         $s0, 0xd8($sp)
/* 10148 8000F548 0C029FFD */  jal        func_800A7FF4
/* 1014C 8000F54C AFA700FC */   sw        $a3, 0xfc($sp)
/* 10150 8000F550 3C02800E */  lui        $v0, %hi(gGlobals)
/* 10154 8000F554 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 10158 8000F558 3C03800F */  lui        $v1, %hi(D_800EE974)
/* 1015C 8000F55C 0040A021 */  addu       $s4, $v0, $zero
/* 10160 8000F560 8C64E974 */  lw         $a0, %lo(D_800EE974)($v1)
/* 10164 8000F564 10800002 */  beqz       $a0, .L8000F570
/* 10168 8000F568 C60203A0 */   lwc1      $f2, 0x3a0($s0)
/* 1016C 8000F56C 44801000 */  mtc1       $zero, $f2
.L8000F570:
/* 10170 8000F570 3C01800E */  lui        $at, %hi(D_800D8688)
/* 10174 8000F574 C4208688 */  lwc1       $f0, %lo(D_800D8688)($at)
/* 10178 8000F578 46001002 */  mul.s      $f0, $f2, $f0
/* 1017C 8000F57C 02402021 */  addu       $a0, $s2, $zero
/* 10180 8000F580 240603E8 */  addiu      $a2, $zero, 0x3e8
/* 10184 8000F584 4600008D */  trunc.w.s  $f2, $f0
/* 10188 8000F588 44051000 */  mfc1       $a1, $f2
/* 1018C 8000F58C 00052C00 */  sll        $a1, $a1, 0x10
/* 10190 8000F590 00052C03 */  sra        $a1, $a1, 0x10
/* 10194 8000F594 240203E4 */  addiu      $v0, $zero, 0x3e4
/* 10198 8000F598 0C02A073 */  jal        func_800A81CC
/* 1019C 8000F59C 00452823 */   subu      $a1, $v0, $a1
/* 101A0 8000F5A0 92051474 */  lbu        $a1, 0x1474($s0)
/* 101A4 8000F5A4 92061475 */  lbu        $a2, 0x1475($s0)
/* 101A8 8000F5A8 92071476 */  lbu        $a3, 0x1476($s0)
/* 101AC 8000F5AC 92021477 */  lbu        $v0, 0x1477($s0)
/* 101B0 8000F5B0 02402021 */  addu       $a0, $s2, $zero
/* 101B4 8000F5B4 0C02A059 */  jal        set_Anidat_colorByte
/* 101B8 8000F5B8 AFA20010 */   sw        $v0, 0x10($sp)
/* 101BC 8000F5BC 12600026 */  beqz       $s3, .L8000F658
/* 101C0 8000F5C0 8FA200FC */   lw        $v0, 0xfc($sp)
/* 101C4 8000F5C4 1040001E */  beqz       $v0, .L8000F640
/* 101C8 8000F5C8 27A40018 */   addiu     $a0, $sp, 0x18
/* 101CC 8000F5CC 8BA300FC */  lwl        $v1, 0xfc($sp)
/* 101D0 8000F5D0 9BA300FF */  lwr        $v1, 0xff($sp)
/* 101D4 8000F5D4 ABA30058 */  swl        $v1, 0x58($sp)
/* 101D8 8000F5D8 BBA3005B */  swr        $v1, 0x5b($sp)
/* 101DC 8000F5DC 9202146C */  lbu        $v0, 0x146c($s0)
/* 101E0 8000F5E0 93A60058 */  lbu        $a2, 0x58($sp)
/* 101E4 8000F5E4 8E05203C */  lw         $a1, 0x203c($s0)
/* 101E8 8000F5E8 9203146D */  lbu        $v1, 0x146d($s0)
/* 101EC 8000F5EC 00461021 */  addu       $v0, $v0, $a2
/* 101F0 8000F5F0 93A60059 */  lbu        $a2, 0x59($sp)
/* 101F4 8000F5F4 00021043 */  sra        $v0, $v0, 1
/* 101F8 8000F5F8 A3A20018 */  sb         $v0, 0x18($sp)
/* 101FC 8000F5FC 9202146E */  lbu        $v0, 0x146e($s0)
/* 10200 8000F600 00661821 */  addu       $v1, $v1, $a2
/* 10204 8000F604 93A6005A */  lbu        $a2, 0x5a($sp)
/* 10208 8000F608 00031843 */  sra        $v1, $v1, 1
/* 1020C 8000F60C A3A30019 */  sb         $v1, 0x19($sp)
/* 10210 8000F610 00461021 */  addu       $v0, $v0, $a2
/* 10214 8000F614 00021043 */  sra        $v0, $v0, 1
/* 10218 8000F618 0C01531D */  jal        tint_color_with_screenfade
/* 1021C 8000F61C A3A2001A */   sb        $v0, 0x1a($sp)
/* 10220 8000F620 93A50018 */  lbu        $a1, 0x18($sp)
/* 10224 8000F624 93A60019 */  lbu        $a2, 0x19($sp)
/* 10228 8000F628 93A7001A */  lbu        $a3, 0x1a($sp)
/* 1022C 8000F62C 02402021 */  addu       $a0, $s2, $zero
/* 10230 8000F630 0C02A0B3 */  jal        set_anidat_color
/* 10234 8000F634 AFB10010 */   sw        $s1, 0x10($sp)
/* 10238 8000F638 08003DA7 */  j          .L8000F69C
/* 1023C 8000F63C 8FBF00EC */   lw        $ra, 0xec($sp)
.L8000F640:
/* 10240 8000F640 9205146C */  lbu        $a1, 0x146c($s0)
/* 10244 8000F644 AFB10010 */  sw         $s1, 0x10($sp)
/* 10248 8000F648 9206146D */  lbu        $a2, 0x146d($s0)
/* 1024C 8000F64C 9207146E */  lbu        $a3, 0x146e($s0)
/* 10250 8000F650 0C02A0B3 */  jal        set_anidat_color
/* 10254 8000F654 02402021 */   addu      $a0, $s2, $zero
.L8000F658:
/* 10258 8000F658 8FA200FC */  lw         $v0, 0xfc($sp)
/* 1025C 8000F65C 1040000E */  beqz       $v0, .L8000F698
/* 10260 8000F660 268268A8 */   addiu     $v0, $s4, 0x68a8
/* 10264 8000F664 8C45203C */  lw         $a1, 0x203c($v0)
/* 10268 8000F668 8BA200FC */  lwl        $v0, 0xfc($sp)
/* 1026C 8000F66C 9BA200FF */  lwr        $v0, 0xff($sp)
/* 10270 8000F670 ABA20098 */  swl        $v0, 0x98($sp)
/* 10274 8000F674 BBA2009B */  swr        $v0, 0x9b($sp)
/* 10278 8000F678 0C01531D */  jal        tint_color_with_screenfade
/* 1027C 8000F67C 27A40098 */   addiu     $a0, $sp, 0x98
/* 10280 8000F680 93A50098 */  lbu        $a1, 0x98($sp)
/* 10284 8000F684 93A60099 */  lbu        $a2, 0x99($sp)
/* 10288 8000F688 93A7009A */  lbu        $a3, 0x9a($sp)
/* 1028C 8000F68C 02402021 */  addu       $a0, $s2, $zero
/* 10290 8000F690 0C02A0B3 */  jal        set_anidat_color
/* 10294 8000F694 AFB10010 */   sw        $s1, 0x10($sp)
.L8000F698:
/* 10298 8000F698 8FBF00EC */  lw         $ra, 0xec($sp)
.L8000F69C:
/* 1029C 8000F69C 8FB400E8 */  lw         $s4, 0xe8($sp)
/* 102A0 8000F6A0 8FB300E4 */  lw         $s3, 0xe4($sp)
/* 102A4 8000F6A4 8FB200E0 */  lw         $s2, 0xe0($sp)
/* 102A8 8000F6A8 8FB100DC */  lw         $s1, 0xdc($sp)
/* 102AC 8000F6AC 8FB000D8 */  lw         $s0, 0xd8($sp)
/* 102B0 8000F6B0 03E00008 */  jr         $ra
/* 102B4 8000F6B4 27BD00F0 */   addiu     $sp, $sp, 0xf0

glabel get_scene_obj_proximity
/* 102B8 8000F6B8 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* 102BC 8000F6BC AFB400A0 */  sw         $s4, 0xa0($sp)
/* 102C0 8000F6C0 0080A021 */  addu       $s4, $a0, $zero
/* 102C4 8000F6C4 AFB00090 */  sw         $s0, 0x90($sp)
/* 102C8 8000F6C8 27B00050 */  addiu      $s0, $sp, 0x50
/* 102CC 8000F6CC 02002021 */  addu       $a0, $s0, $zero
/* 102D0 8000F6D0 AFB10094 */  sw         $s1, 0x94($sp)
/* 102D4 8000F6D4 00A08821 */  addu       $s1, $a1, $zero
/* 102D8 8000F6D8 AFB3009C */  sw         $s3, 0x9c($sp)
/* 102DC 8000F6DC 00C09821 */  addu       $s3, $a2, $zero
/* 102E0 8000F6E0 02602821 */  addu       $a1, $s3, $zero
/* 102E4 8000F6E4 AFB500A4 */  sw         $s5, 0xa4($sp)
/* 102E8 8000F6E8 8FB500C8 */  lw         $s5, 0xc8($sp)
/* 102EC 8000F6EC 44800000 */  mtc1       $zero, $f0
/* 102F0 8000F6F0 02203021 */  addu       $a2, $s1, $zero
/* 102F4 8000F6F4 AFB20098 */  sw         $s2, 0x98($sp)
/* 102F8 8000F6F8 00E09021 */  addu       $s2, $a3, $zero
/* 102FC 8000F6FC AFBF00A8 */  sw         $ra, 0xa8($sp)
/* 10300 8000F700 F7B400B0 */  sdc1       $f20, 0xb0($sp)
/* 10304 8000F704 E6A00000 */  swc1       $f0, ($s5)
/* 10308 8000F708 0C02AB1D */  jal        Vec2_Sub
/* 1030C 8000F70C E6400000 */   swc1      $f0, ($s2)
/* 10310 8000F710 27A40010 */  addiu      $a0, $sp, 0x10
/* 10314 8000F714 02802821 */  addu       $a1, $s4, $zero
/* 10318 8000F718 0C02AB1D */  jal        Vec2_Sub
/* 1031C 8000F71C 02203021 */   addu      $a2, $s1, $zero
/* 10320 8000F720 0C02AB9F */  jal        vec2_normalize
/* 10324 8000F724 27A40010 */   addiu     $a0, $sp, 0x10
/* 10328 8000F728 02002021 */  addu       $a0, $s0, $zero
/* 1032C 8000F72C 0C02AB9F */  jal        vec2_normalize
/* 10330 8000F730 46000506 */   mov.s     $f20, $f0
/* 10334 8000F734 4614003C */  c.lt.s     $f0, $f20
/* 10338 8000F738 00000000 */  nop
/* 1033C 8000F73C 45010011 */  bc1t       .L8000F784
/* 10340 8000F740 00001021 */   addu      $v0, $zero, $zero
/* 10344 8000F744 4405A000 */  mfc1       $a1, $f20
/* 10348 8000F748 0C02AD34 */  jal        multiVec2
/* 1034C 8000F74C 02002021 */   addu      $a0, $s0, $zero
/* 10350 8000F750 27A40010 */  addiu      $a0, $sp, 0x10
/* 10354 8000F754 02202821 */  addu       $a1, $s1, $zero
/* 10358 8000F758 0C02AB44 */  jal        vec2_sum
/* 1035C 8000F75C 02003021 */   addu      $a2, $s0, $zero
/* 10360 8000F760 27A40010 */  addiu      $a0, $sp, 0x10
/* 10364 8000F764 0C02AB5A */  jal        get_vec2_proximity
/* 10368 8000F768 02802821 */   addu      $a1, $s4, $zero
/* 1036C 8000F76C 27A40010 */  addiu      $a0, $sp, 0x10
/* 10370 8000F770 02602821 */  addu       $a1, $s3, $zero
/* 10374 8000F774 0C02AB5A */  jal        get_vec2_proximity
/* 10378 8000F778 E6400000 */   swc1      $f0, ($s2)
/* 1037C 8000F77C 24020001 */  addiu      $v0, $zero, 1
/* 10380 8000F780 E6A00000 */  swc1       $f0, ($s5)
.L8000F784:
/* 10384 8000F784 8FBF00A8 */  lw         $ra, 0xa8($sp)
/* 10388 8000F788 8FB500A4 */  lw         $s5, 0xa4($sp)
/* 1038C 8000F78C 8FB400A0 */  lw         $s4, 0xa0($sp)
/* 10390 8000F790 8FB3009C */  lw         $s3, 0x9c($sp)
/* 10394 8000F794 8FB20098 */  lw         $s2, 0x98($sp)
/* 10398 8000F798 8FB10094 */  lw         $s1, 0x94($sp)
/* 1039C 8000F79C 8FB00090 */  lw         $s0, 0x90($sp)
/* 103A0 8000F7A0 D7B400B0 */  ldc1       $f20, 0xb0($sp)
/* 103A4 8000F7A4 03E00008 */  jr         $ra
/* 103A8 8000F7A8 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel ref_obj_boulders
/* 103AC 8000F7AC 94820028 */  lhu        $v0, 0x28($a0)
/* 103B0 8000F7B0 10400024 */  beqz       $v0, .L8000F844
/* 103B4 8000F7B4 00002821 */   addu      $a1, $zero, $zero
/* 103B8 8000F7B8 8C8B0044 */  lw         $t3, 0x44($a0)
/* 103BC 8000F7BC 000510C0 */  sll        $v0, $a1, 3
.L8000F7C0:
/* 103C0 8000F7C0 00451023 */  subu       $v0, $v0, $a1
/* 103C4 8000F7C4 00021080 */  sll        $v0, $v0, 2
/* 103C8 8000F7C8 00451023 */  subu       $v0, $v0, $a1
/* 103CC 8000F7CC 00021080 */  sll        $v0, $v0, 2
/* 103D0 8000F7D0 01623021 */  addu       $a2, $t3, $v0
/* 103D4 8000F7D4 94C30016 */  lhu        $v1, 0x16($a2)
/* 103D8 8000F7D8 14600015 */  bnez       $v1, .L8000F830
/* 103DC 8000F7DC 24AA0001 */   addiu     $t2, $a1, 1
/* 103E0 8000F7E0 00002821 */  addu       $a1, $zero, $zero
/* 103E4 8000F7E4 24C30028 */  addiu      $v1, $a2, 0x28
/* 103E8 8000F7E8 94620042 */  lhu        $v0, 0x42($v1)
/* 103EC 8000F7EC 94670040 */  lhu        $a3, 0x40($v1)
/* 103F0 8000F7F0 3042FFFD */  andi       $v0, $v0, 0xfffd
/* 103F4 8000F7F4 10E0000E */  beqz       $a3, .L8000F830
/* 103F8 8000F7F8 A4620042 */   sh        $v0, 0x42($v1)
/* 103FC 8000F7FC 24C8002C */  addiu      $t0, $a2, 0x2c
/* 10400 8000F800 2409080E */  addiu      $t1, $zero, 0x80e
/* 10404 8000F804 00E03021 */  addu       $a2, $a3, $zero
/* 10408 8000F808 00051040 */  sll        $v0, $a1, 1
.L8000F80C:
/* 1040C 8000F80C 00451021 */  addu       $v0, $v0, $a1
/* 10410 8000F810 00021080 */  sll        $v0, $v0, 2
/* 10414 8000F814 01021021 */  addu       $v0, $t0, $v0
/* 10418 8000F818 AC490000 */  sw         $t1, ($v0)
/* 1041C 8000F81C 24A30001 */  addiu      $v1, $a1, 1
/* 10420 8000F820 3065FFFF */  andi       $a1, $v1, 0xffff
/* 10424 8000F824 00A6102B */  sltu       $v0, $a1, $a2
/* 10428 8000F828 1440FFF8 */  bnez       $v0, .L8000F80C
/* 1042C 8000F82C 00051040 */   sll       $v0, $a1, 1
.L8000F830:
/* 10430 8000F830 94820028 */  lhu        $v0, 0x28($a0)
/* 10434 8000F834 3145FFFF */  andi       $a1, $t2, 0xffff
/* 10438 8000F838 00A2102B */  sltu       $v0, $a1, $v0
/* 1043C 8000F83C 1440FFE0 */  bnez       $v0, .L8000F7C0
/* 10440 8000F840 000510C0 */   sll       $v0, $a1, 3
.L8000F844:
/* 10444 8000F844 03E00008 */  jr         $ra
/* 10448 8000F848 00000000 */   nop

glabel clear_if_no_ExpPak
/* 1044C 8000F84C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 10450 8000F850 00803021 */  addu       $a2, $a0, $zero
/* 10454 8000F854 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 10458 8000F858 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 1045C 8000F85C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 10460 8000F860 1460001A */  bnez       $v1, .L8000F8CC
/* 10464 8000F864 AFBF0010 */   sw        $ra, 0x10($sp)
/* 10468 8000F868 00051040 */  sll        $v0, $a1, 1
/* 1046C 8000F86C 00451021 */  addu       $v0, $v0, $a1
/* 10470 8000F870 00022880 */  sll        $a1, $v0, 2
/* 10474 8000F874 00C51821 */  addu       $v1, $a2, $a1
/* 10478 8000F878 8C620008 */  lw         $v0, 8($v1)
/* 1047C 8000F87C 10400014 */  beqz       $v0, .L8000F8D0
/* 10480 8000F880 8FBF0010 */   lw        $ra, 0x10($sp)
/* 10484 8000F884 94C20042 */  lhu        $v0, 0x42($a2)
/* 10488 8000F888 30420002 */  andi       $v0, $v0, 2
/* 1048C 8000F88C 10400009 */  beqz       $v0, .L8000F8B4
/* 10490 8000F890 3C04800E */   lui       $a0, %hi(queueStructA)
/* 10494 8000F894 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 10498 8000F898 00602821 */  addu       $a1, $v1, $zero
/* 1049C 8000F89C 24A50008 */  addiu      $a1, $a1, 8
/* 104A0 8000F8A0 00003021 */  addu       $a2, $zero, $zero
/* 104A4 8000F8A4 0C035867 */  jal        AllocFreeQueueItem
/* 104A8 8000F8A8 00003821 */   addu      $a3, $zero, $zero
/* 104AC 8000F8AC 08003E34 */  j          .L8000F8D0
/* 104B0 8000F8B0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8000F8B4:
/* 104B4 8000F8B4 24847ECC */  addiu      $a0, $a0, 0x7ecc
/* 104B8 8000F8B8 00C52821 */  addu       $a1, $a2, $a1
/* 104BC 8000F8BC 24A50008 */  addiu      $a1, $a1, 8
/* 104C0 8000F8C0 24060001 */  addiu      $a2, $zero, 1
/* 104C4 8000F8C4 0C035867 */  jal        AllocFreeQueueItem
/* 104C8 8000F8C8 00003821 */   addu      $a3, $zero, $zero
.L8000F8CC:
/* 104CC 8000F8CC 8FBF0010 */  lw         $ra, 0x10($sp)
.L8000F8D0:
/* 104D0 8000F8D0 03E00008 */  jr         $ra
/* 104D4 8000F8D4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rendervoxel_no_expPak
/* 104D8 8000F8D8 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 104DC 8000F8DC 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 104E0 8000F8E0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 104E4 8000F8E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 104E8 8000F8E8 00808821 */  addu       $s1, $a0, $zero
/* 104EC 8000F8EC AFBF0020 */  sw         $ra, 0x20($sp)
/* 104F0 8000F8F0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 104F4 8000F8F4 AFB20018 */  sw         $s2, 0x18($sp)
/* 104F8 8000F8F8 14600023 */  bnez       $v1, .L8000F988
/* 104FC 8000F8FC AFB00010 */   sw        $s0, 0x10($sp)
/* 10500 8000F900 96220040 */  lhu        $v0, 0x40($s1)
/* 10504 8000F904 10400020 */  beqz       $v0, .L8000F988
/* 10508 8000F908 00008021 */   addu      $s0, $zero, $zero
/* 1050C 8000F90C 26330008 */  addiu      $s3, $s1, 8
/* 10510 8000F910 3C12800E */  lui        $s2, 0x800e
/* 10514 8000F914 00101040 */  sll        $v0, $s0, 1
.L8000F918:
/* 10518 8000F918 00501021 */  addu       $v0, $v0, $s0
/* 1051C 8000F91C 00022880 */  sll        $a1, $v0, 2
/* 10520 8000F920 02651821 */  addu       $v1, $s3, $a1
/* 10524 8000F924 8C620000 */  lw         $v0, ($v1)
/* 10528 8000F928 10400012 */  beqz       $v0, .L8000F974
/* 1052C 8000F92C 26030001 */   addiu     $v1, $s0, 1
/* 10530 8000F930 96220042 */  lhu        $v0, 0x42($s1)
/* 10534 8000F934 30420002 */  andi       $v0, $v0, 2
/* 10538 8000F938 10400008 */  beqz       $v0, .L8000F95C
/* 1053C 8000F93C 26447ECC */   addiu     $a0, $s2, 0x7ecc
/* 10540 8000F940 02252821 */  addu       $a1, $s1, $a1
/* 10544 8000F944 24A50008 */  addiu      $a1, $a1, 8
/* 10548 8000F948 00003021 */  addu       $a2, $zero, $zero
/* 1054C 8000F94C 0C035867 */  jal        AllocFreeQueueItem
/* 10550 8000F950 00003821 */   addu      $a3, $zero, $zero
/* 10554 8000F954 08003E5D */  j          .L8000F974
/* 10558 8000F958 26030001 */   addiu     $v1, $s0, 1
.L8000F95C:
/* 1055C 8000F95C 02252821 */  addu       $a1, $s1, $a1
/* 10560 8000F960 24A50008 */  addiu      $a1, $a1, 8
/* 10564 8000F964 24060001 */  addiu      $a2, $zero, 1
/* 10568 8000F968 0C035867 */  jal        AllocFreeQueueItem
/* 1056C 8000F96C 00003821 */   addu      $a3, $zero, $zero
/* 10570 8000F970 26030001 */  addiu      $v1, $s0, 1
.L8000F974:
/* 10574 8000F974 96220040 */  lhu        $v0, 0x40($s1)
/* 10578 8000F978 3070FFFF */  andi       $s0, $v1, 0xffff
/* 1057C 8000F97C 0202102B */  sltu       $v0, $s0, $v0
/* 10580 8000F980 1440FFE5 */  bnez       $v0, .L8000F918
/* 10584 8000F984 00101040 */   sll       $v0, $s0, 1
.L8000F988:
/* 10588 8000F988 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1058C 8000F98C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 10590 8000F990 8FB20018 */  lw         $s2, 0x18($sp)
/* 10594 8000F994 8FB10014 */  lw         $s1, 0x14($sp)
/* 10598 8000F998 8FB00010 */  lw         $s0, 0x10($sp)
/* 1059C 8000F99C 03E00008 */  jr         $ra
/* 105A0 8000F9A0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel RenderVoxelScenes
/* 105A4 8000F9A4 3C01800E */  lui        $at, %hi(D_800D86F8)
/* 105A8 8000F9A8 C42C86F8 */  lwc1       $f12, %lo(D_800D86F8)($at)
/* 105AC 8000F9AC 27BDFE28 */  addiu      $sp, $sp, -0x1d8
/* 105B0 8000F9B0 F7BA01C8 */  sdc1       $f26, 0x1c8($sp)
/* 105B4 8000F9B4 C7BA01EC */  lwc1       $f26, 0x1ec($sp)
/* 105B8 8000F9B8 F7BC01D0 */  sdc1       $f28, 0x1d0($sp)
/* 105BC 8000F9BC C7BC01F0 */  lwc1       $f28, 0x1f0($sp)
/* 105C0 8000F9C0 AFB1018C */  sw         $s1, 0x18c($sp)
/* 105C4 8000F9C4 00C08821 */  addu       $s1, $a2, $zero
/* 105C8 8000F9C8 AFB00188 */  sw         $s0, 0x188($sp)
/* 105CC 8000F9CC 00078400 */  sll        $s0, $a3, 0x10
/* 105D0 8000F9D0 AFB20190 */  sw         $s2, 0x190($sp)
/* 105D4 8000F9D4 87B201EA */  lh         $s2, 0x1ea($sp)
/* 105D8 8000F9D8 00108403 */  sra        $s0, $s0, 0x10
/* 105DC 8000F9DC AFBF01AC */  sw         $ra, 0x1ac($sp)
/* 105E0 8000F9E0 AFBE01A8 */  sw         $fp, 0x1a8($sp)
/* 105E4 8000F9E4 AFB701A4 */  sw         $s7, 0x1a4($sp)
/* 105E8 8000F9E8 AFB601A0 */  sw         $s6, 0x1a0($sp)
/* 105EC 8000F9EC AFB5019C */  sw         $s5, 0x19c($sp)
/* 105F0 8000F9F0 AFB40198 */  sw         $s4, 0x198($sp)
/* 105F4 8000F9F4 AFB30194 */  sw         $s3, 0x194($sp)
/* 105F8 8000F9F8 F7B801C0 */  sdc1       $f24, 0x1c0($sp)
/* 105FC 8000F9FC F7B601B8 */  sdc1       $f22, 0x1b8($sp)
/* 10600 8000FA00 F7B401B0 */  sdc1       $f20, 0x1b0($sp)
/* 10604 8000FA04 AFA401D8 */  sw         $a0, 0x1d8($sp)
/* 10608 8000FA08 0C02FB50 */  jal        __cosf
/* 1060C 8000FA0C AFA501DC */   sw        $a1, 0x1dc($sp)
/* 10610 8000FA10 3C01800E */  lui        $at, %hi(D_800D86FC)
/* 10614 8000FA14 C42C86FC */  lwc1       $f12, %lo(D_800D86FC)($at)
/* 10618 8000FA18 0C02FB50 */  jal        __cosf
/* 1061C 8000FA1C 46000606 */   mov.s     $f24, $f0
/* 10620 8000FA20 02002821 */  addu       $a1, $s0, $zero
/* 10624 8000FA24 3C02800E */  lui        $v0, %hi(gGlobals)
/* 10628 8000FA28 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 1062C 8000FA2C 02403021 */  addu       $a2, $s2, $zero
/* 10630 8000FA30 46000586 */  mov.s      $f22, $f0
/* 10634 8000FA34 8FA401DC */  lw         $a0, 0x1dc($sp)
/* 10638 8000FA38 C6020214 */  lwc1       $f2, 0x214($s0)
/* 1063C 8000FA3C C604021C */  lwc1       $f4, 0x21c($s0)
/* 10640 8000FA40 C6080220 */  lwc1       $f8, 0x220($s0)
/* 10644 8000FA44 C6260000 */  lwc1       $f6, ($s1)
/* 10648 8000FA48 C60A0228 */  lwc1       $f10, 0x228($s0)
/* 1064C 8000FA4C 461A3180 */  add.s      $f6, $f6, $f26
/* 10650 8000FA50 E7A20060 */  swc1       $f2, 0x60($sp)
/* 10654 8000FA54 E7A40064 */  swc1       $f4, 0x64($sp)
/* 10658 8000FA58 E7A800A0 */  swc1       $f8, 0xa0($sp)
/* 1065C 8000FA5C E7AA00A4 */  swc1       $f10, 0xa4($sp)
/* 10660 8000FA60 C6220008 */  lwc1       $f2, 8($s1)
/* 10664 8000FA64 C6240004 */  lwc1       $f4, 4($s1)
/* 10668 8000FA68 461C1080 */  add.s      $f2, $f2, $f28
/* 1066C 8000FA6C E7A40024 */  swc1       $f4, 0x24($sp)
/* 10670 8000FA70 E7A60020 */  swc1       $f6, 0x20($sp)
/* 10674 8000FA74 0C02BCCE */  jal        borg9_get_unkStruct
/* 10678 8000FA78 E7A20028 */   swc1      $f2, 0x28($sp)
/* 1067C 8000FA7C AFA20168 */  sw         $v0, 0x168($sp)
/* 10680 8000FA80 94420010 */  lhu        $v0, 0x10($v0)
/* 10684 8000FA84 1040021C */  beqz       $v0, .L800102F8
/* 10688 8000FA88 0000A021 */   addu      $s4, $zero, $zero
/* 1068C 8000FA8C 27A20120 */  addiu      $v0, $sp, 0x120
/* 10690 8000FA90 AFA20170 */  sw         $v0, 0x170($sp)
/* 10694 8000FA94 00148040 */  sll        $s0, $s4, 1
.L8000FA98:
/* 10698 8000FA98 3C07800E */  lui        $a3, %hi(D_800D868C)
/* 1069C 8000FA9C 8FA30168 */  lw         $v1, 0x168($sp)
/* 106A0 8000FAA0 24E5868C */  addiu      $a1, $a3, %lo(D_800D868C)
/* 106A4 8000FAA4 8C620008 */  lw         $v0, 8($v1)
/* 106A8 8000FAA8 8FA701DC */  lw         $a3, 0x1dc($sp)
/* 106AC 8000FAAC 02021021 */  addu       $v0, $s0, $v0
/* 106B0 8000FAB0 94460000 */  lhu        $a2, ($v0)
/* 106B4 8000FAB4 8CE30044 */  lw         $v1, 0x44($a3)
/* 106B8 8000FAB8 000610C0 */  sll        $v0, $a2, 3
/* 106BC 8000FABC 00461023 */  subu       $v0, $v0, $a2
/* 106C0 8000FAC0 00021080 */  sll        $v0, $v0, 2
/* 106C4 8000FAC4 00461023 */  subu       $v0, $v0, $a2
/* 106C8 8000FAC8 00021080 */  sll        $v0, $v0, 2
/* 106CC 8000FACC 00629821 */  addu       $s3, $v1, $v0
/* 106D0 8000FAD0 96670016 */  lhu        $a3, 0x16($s3)
/* 106D4 8000FAD4 8E62002C */  lw         $v0, 0x2c($s3)
/* 106D8 8000FAD8 26830001 */  addiu      $v1, $s4, 1
/* 106DC 8000FADC AFA3017C */  sw         $v1, 0x17c($sp)
/* 106E0 8000FAE0 AFA20010 */  sw         $v0, 0x10($sp)
/* 106E4 8000FAE4 8E630038 */  lw         $v1, 0x38($s3)
/* 106E8 8000FAE8 AFA30014 */  sw         $v1, 0x14($sp)
/* 106EC 8000FAEC 8E620044 */  lw         $v0, 0x44($s3)
/* 106F0 8000FAF0 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* 106F4 8000FAF4 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* 106F8 8000FAF8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 106FC 8000FAFC 0C0333AC */  jal        sprintf
/* 10700 8000FB00 AFA20018 */   sw        $v0, 0x18($sp)
/* 10704 8000FB04 96630016 */  lhu        $v1, 0x16($s3)
/* 10708 8000FB08 146001F3 */  bnez       $v1, .L800102D8
/* 1070C 8000FB0C AFB00180 */   sw        $s0, 0x180($sp)
/* 10710 8000FB10 96620014 */  lhu        $v0, 0x14($s3)
/* 10714 8000FB14 30428000 */  andi       $v0, $v0, 0x8000
/* 10718 8000FB18 104001EF */  beqz       $v0, .L800102D8
/* 1071C 8000FB1C 3C04800E */   lui       $a0, %hi(gGlobals)
/* 10720 8000FB20 248468A8 */  addiu      $a0, $a0, %lo(gGlobals)
/* 10724 8000FB24 8E620010 */  lw         $v0, 0x10($s3)
/* 10728 8000FB28 8C830008 */  lw         $v1, 8($a0)
/* 1072C 8000FB2C 0043102B */  sltu       $v0, $v0, $v1
/* 10730 8000FB30 104001E9 */  beqz       $v0, .L800102D8
/* 10734 8000FB34 26700028 */   addiu     $s0, $s3, 0x28
/* 10738 8000FB38 27A40020 */  addiu      $a0, $sp, 0x20
/* 1073C 8000FB3C 02602821 */  addu       $a1, $s3, $zero
/* 10740 8000FB40 0C02AB66 */  jal        get_vec3_proximity
/* 10744 8000FB44 AE630010 */   sw        $v1, 0x10($s3)
/* 10748 8000FB48 C662000C */  lwc1       $f2, 0xc($s3)
/* 1074C 8000FB4C 46000506 */  mov.s      $f20, $f0
/* 10750 8000FB50 4602A03C */  c.lt.s     $f20, $f2
/* 10754 8000FB54 00000000 */  nop
/* 10758 8000FB58 450001DD */  bc1f       .L800102D0
/* 1075C 8000FB5C 240700FF */   addiu     $a3, $zero, 0xff
/* 10760 8000FB60 9662006A */  lhu        $v0, 0x6a($s3)
/* 10764 8000FB64 30420004 */  andi       $v0, $v0, 4
/* 10768 8000FB68 1040000A */  beqz       $v0, .L8000FB94
/* 1076C 8000FB6C AFA7016C */   sw        $a3, 0x16c($sp)
/* 10770 8000FB70 3C01800E */  lui        $at, %hi(D_800D8700)
/* 10774 8000FB74 D4208700 */  ldc1       $f0, %lo(D_800D8700)($at)
/* 10778 8000FB78 460010A1 */  cvt.d.s    $f2, $f2
/* 1077C 8000FB7C 46201082 */  mul.d      $f2, $f2, $f0
/* 10780 8000FB80 4600A121 */  cvt.d.s    $f4, $f20
/* 10784 8000FB84 4624103C */  c.lt.d     $f2, $f4
/* 10788 8000FB88 00000000 */  nop
/* 1078C 8000FB8C 45000030 */  bc1f       .L8000FC50
/* 10790 8000FB90 8FA3016C */   lw        $v1, 0x16c($sp)
.L8000FB94:
/* 10794 8000FB94 8E650000 */  lw         $a1, ($s3)
/* 10798 8000FB98 8E660008 */  lw         $a2, 8($s3)
/* 1079C 8000FB9C 0C02AD55 */  jal        setVec2
/* 107A0 8000FBA0 8FA40170 */   lw        $a0, 0x170($sp)
/* 107A4 8000FBA4 C7A20120 */  lwc1       $f2, 0x120($sp)
/* 107A8 8000FBA8 27A40060 */  addiu      $a0, $sp, 0x60
/* 107AC 8000FBAC 461A1081 */  sub.s      $f2, $f2, $f26
/* 107B0 8000FBB0 C7A00124 */  lwc1       $f0, 0x124($sp)
/* 107B4 8000FBB4 8FA60170 */  lw         $a2, 0x170($sp)
/* 107B8 8000FBB8 461C0001 */  sub.s      $f0, $f0, $f28
/* 107BC 8000FBBC 27A500A0 */  addiu      $a1, $sp, 0xa0
/* 107C0 8000FBC0 E7A20120 */  swc1       $f2, 0x120($sp)
/* 107C4 8000FBC4 0C02AD62 */  jal        three_vec2_proximities
/* 107C8 8000FBC8 E7A00124 */   swc1      $f0, 0x124($sp)
/* 107CC 8000FBCC 4618003E */  c.le.s     $f0, $f24
/* 107D0 8000FBD0 00000000 */  nop
/* 107D4 8000FBD4 4500001E */  bc1f       .L8000FC50
/* 107D8 8000FBD8 8FA3016C */   lw        $v1, 0x16c($sp)
/* 107DC 8000FBDC 4616003E */  c.le.s     $f0, $f22
/* 107E0 8000FBE0 00000000 */  nop
/* 107E4 8000FBE4 45020003 */  bc1fl      .L8000FBF4
/* 107E8 8000FBE8 46160001 */   sub.s     $f0, $f0, $f22
/* 107EC 8000FBEC 08003F13 */  j          .L8000FC4C
/* 107F0 8000FBF0 AFA0016C */   sw        $zero, 0x16c($sp)
.L8000FBF4:
/* 107F4 8000FBF4 4616C081 */  sub.s      $f2, $f24, $f22
/* 107F8 8000FBF8 3C01800E */  lui        $at, %hi(D_800D8708)
/* 107FC 8000FBFC D4248708 */  ldc1       $f4, %lo(D_800D8708)($at)
/* 10800 8000FC00 46020003 */  div.s      $f0, $f0, $f2
/* 10804 8000FC04 46000021 */  cvt.d.s    $f0, $f0
/* 10808 8000FC08 46240002 */  mul.d      $f0, $f0, $f4
/* 1080C 8000FC0C 3C01800E */  lui        $at, %hi(D_800D8710)
/* 10810 8000FC10 D4228710 */  ldc1       $f2, %lo(D_800D8710)($at)
/* 10814 8000FC14 4620103E */  c.le.d     $f2, $f0
/* 10818 8000FC18 00000000 */  nop
/* 1081C 8000FC1C 45030005 */  bc1tl      .L8000FC34
/* 10820 8000FC20 46220001 */   sub.d     $f0, $f0, $f2
/* 10824 8000FC24 4620008D */  trunc.w.d  $f2, $f0
/* 10828 8000FC28 44031000 */  mfc1       $v1, $f2
/* 1082C 8000FC2C 08003F12 */  j          .L8000FC48
/* 10830 8000FC30 306300FF */   andi      $v1, $v1, 0xff
.L8000FC34:
/* 10834 8000FC34 4620008D */  trunc.w.d  $f2, $f0
/* 10838 8000FC38 44031000 */  mfc1       $v1, $f2
/* 1083C 8000FC3C 3C028000 */  lui        $v0, 0x8000
/* 10840 8000FC40 00621825 */  or         $v1, $v1, $v0
/* 10844 8000FC44 306300FF */  andi       $v1, $v1, 0xff
.L8000FC48:
/* 10848 8000FC48 AFA3016C */  sw         $v1, 0x16c($sp)
.L8000FC4C:
/* 1084C 8000FC4C 8FA3016C */  lw         $v1, 0x16c($sp)
.L8000FC50:
/* 10850 8000FC50 54600006 */  bnel       $v1, $zero, .L8000FC6C
/* 10854 8000FC54 96020042 */   lhu       $v0, 0x42($s0)
/* 10858 8000FC58 0C003E36 */  jal        rendervoxel_no_expPak
/* 1085C 8000FC5C 02002021 */   addu      $a0, $s0, $zero
/* 10860 8000FC60 26940001 */  addiu      $s4, $s4, 1
/* 10864 8000FC64 080040B6 */  j          .L800102D8
/* 10868 8000FC68 AFB4017C */   sw        $s4, 0x17c($sp)
.L8000FC6C:
/* 1086C 8000FC6C 38420001 */  xori       $v0, $v0, 1
/* 10870 8000FC70 30420001 */  andi       $v0, $v0, 1
/* 10874 8000FC74 1040002C */  beqz       $v0, .L8000FD28
/* 10878 8000FC78 27A400E0 */   addiu     $a0, $sp, 0xe0
/* 1087C 8000FC7C 27A50060 */  addiu      $a1, $sp, 0x60
/* 10880 8000FC80 27A600A0 */  addiu      $a2, $sp, 0xa0
/* 10884 8000FC84 C6600000 */  lwc1       $f0, ($s3)
/* 10888 8000FC88 27A70160 */  addiu      $a3, $sp, 0x160
/* 1088C 8000FC8C E7A000E0 */  swc1       $f0, 0xe0($sp)
/* 10890 8000FC90 C6620008 */  lwc1       $f2, 8($s3)
/* 10894 8000FC94 27A20164 */  addiu      $v0, $sp, 0x164
/* 10898 8000FC98 AFA20010 */  sw         $v0, 0x10($sp)
/* 1089C 8000FC9C 0C003DAE */  jal        get_scene_obj_proximity
/* 108A0 8000FCA0 E7A200E4 */   swc1      $f2, 0xe4($sp)
/* 108A4 8000FCA4 10400020 */  beqz       $v0, .L8000FD28
/* 108A8 8000FCA8 C7A00164 */   lwc1      $f0, 0x164($sp)
/* 108AC 8000FCAC 3C01800E */  lui        $at, %hi(D_800D8718)
/* 108B0 8000FCB0 D4228718 */  ldc1       $f2, %lo(D_800D8718)($at)
/* 108B4 8000FCB4 46000021 */  cvt.d.s    $f0, $f0
/* 108B8 8000FCB8 46220002 */  mul.d      $f0, $f0, $f2
/* 108BC 8000FCBC C7A40160 */  lwc1       $f4, 0x160($sp)
/* 108C0 8000FCC0 46200020 */  cvt.s.d    $f0, $f0
/* 108C4 8000FCC4 4600203C */  c.lt.s     $f4, $f0
/* 108C8 8000FCC8 00000000 */  nop
/* 108CC 8000FCCC 45020017 */  bc1fl      .L8000FD2C
/* 108D0 8000FCD0 AFA00174 */   sw        $zero, 0x174($sp)
/* 108D4 8000FCD4 3C01800E */  lui        $at, %hi(D_800D8720)
/* 108D8 8000FCD8 C4228720 */  lwc1       $f2, %lo(D_800D8720)($at)
/* 108DC 8000FCDC 46002003 */  div.s      $f0, $f4, $f0
/* 108E0 8000FCE0 46020002 */  mul.s      $f0, $f0, $f2
/* 108E4 8000FCE4 3C01800E */  lui        $at, %hi(D_800D8724)
/* 108E8 8000FCE8 C4228724 */  lwc1       $f2, %lo(D_800D8724)($at)
/* 108EC 8000FCEC 4600103E */  c.le.s     $f2, $f0
/* 108F0 8000FCF0 00000000 */  nop
/* 108F4 8000FCF4 45030005 */  bc1tl      .L8000FD0C
/* 108F8 8000FCF8 46020001 */   sub.s     $f0, $f0, $f2
/* 108FC 8000FCFC 4600008D */  trunc.w.s  $f2, $f0
/* 10900 8000FD00 44031000 */  mfc1       $v1, $f2
/* 10904 8000FD04 08003F48 */  j          .L8000FD20
/* 10908 8000FD08 24620060 */   addiu     $v0, $v1, 0x60
.L8000FD0C:
/* 1090C 8000FD0C 4600008D */  trunc.w.s  $f2, $f0
/* 10910 8000FD10 44031000 */  mfc1       $v1, $f2
/* 10914 8000FD14 3C028000 */  lui        $v0, 0x8000
/* 10918 8000FD18 00621825 */  or         $v1, $v1, $v0
/* 1091C 8000FD1C 24620060 */  addiu      $v0, $v1, 0x60
.L8000FD20:
/* 10920 8000FD20 304200FF */  andi       $v0, $v0, 0xff
/* 10924 8000FD24 AFA2016C */  sw         $v0, 0x16c($sp)
.L8000FD28:
/* 10928 8000FD28 AFA00174 */  sw         $zero, 0x174($sp)
.L8000FD2C:
/* 1092C 8000FD2C 96020040 */  lhu        $v0, 0x40($s0)
/* 10930 8000FD30 26940001 */  addiu      $s4, $s4, 1
/* 10934 8000FD34 AFB4017C */  sw         $s4, 0x17c($sp)
/* 10938 8000FD38 2442FFFF */  addiu      $v0, $v0, -1
/* 1093C 8000FD3C 00021400 */  sll        $v0, $v0, 0x10
/* 10940 8000FD40 0002A403 */  sra        $s4, $v0, 0x10
/* 10944 8000FD44 06800165 */  bltz       $s4, .L800102DC
/* 10948 8000FD48 8FA7017C */   lw        $a3, 0x17c($sp)
/* 1094C 8000FD4C 00141840 */  sll        $v1, $s4, 1
.L8000FD50:
/* 10950 8000FD50 00741021 */  addu       $v0, $v1, $s4
/* 10954 8000FD54 00021080 */  sll        $v0, $v0, 2
/* 10958 8000FD58 02021021 */  addu       $v0, $s0, $v0
/* 1095C 8000FD5C 0060B821 */  addu       $s7, $v1, $zero
/* 10960 8000FD60 44802000 */  mtc1       $zero, $f4
/* 10964 8000FD64 2683FFFF */  addiu      $v1, $s4, -1
/* 10968 8000FD68 AFA30178 */  sw         $v1, 0x178($sp)
/* 1096C 8000FD6C 12800006 */  beqz       $s4, .L8000FD88
/* 10970 8000FD70 C4420000 */   lwc1      $f2, ($v0)
/* 10974 8000FD74 00031040 */  sll        $v0, $v1, 1
/* 10978 8000FD78 00431021 */  addu       $v0, $v0, $v1
/* 1097C 8000FD7C 00021080 */  sll        $v0, $v0, 2
/* 10980 8000FD80 02021021 */  addu       $v0, $s0, $v0
/* 10984 8000FD84 C4440000 */  lwc1       $f4, ($v0)
.L8000FD88:
/* 10988 8000FD88 3C01800E */  lui        $at, %hi(D_800D8728)
/* 1098C 8000FD8C C4208728 */  lwc1       $f0, %lo(D_800D8728)($at)
/* 10990 8000FD90 46002101 */  sub.s      $f4, $f4, $f0
/* 10994 8000FD94 4614203E */  c.le.s     $f4, $f20
/* 10998 8000FD98 00000000 */  nop
/* 1099C 8000FD9C 45000143 */  bc1f       .L800102AC
/* 109A0 8000FDA0 02002021 */   addu      $a0, $s0, $zero
/* 109A4 8000FDA4 4602A03E */  c.le.s     $f20, $f2
/* 109A8 8000FDA8 00000000 */  nop
/* 109AC 8000FDAC 4500013F */  bc1f       .L800102AC
/* 109B0 8000FDB0 00000000 */   nop
/* 109B4 8000FDB4 3C01800E */  lui        $at, %hi(D_800D872C)
/* 109B8 8000FDB8 C420872C */  lwc1       $f0, %lo(D_800D872C)($at)
/* 109BC 8000FDBC 46001001 */  sub.s      $f0, $f2, $f0
/* 109C0 8000FDC0 4614003C */  c.lt.s     $f0, $f20
/* 109C4 8000FDC4 00000000 */  nop
/* 109C8 8000FDC8 45000014 */  bc1f       .L8000FE1C
/* 109CC 8000FDCC 241600FF */   addiu     $s6, $zero, 0xff
/* 109D0 8000FDD0 46141081 */  sub.s      $f2, $f2, $f20
/* 109D4 8000FDD4 3C01800E */  lui        $at, %hi(D_800D8730)
/* 109D8 8000FDD8 C4208730 */  lwc1       $f0, %lo(D_800D8730)($at)
/* 109DC 8000FDDC 46001002 */  mul.s      $f0, $f2, $f0
/* 109E0 8000FDE0 3C01800E */  lui        $at, %hi(D_800D8734)
/* 109E4 8000FDE4 C4228734 */  lwc1       $f2, %lo(D_800D8734)($at)
/* 109E8 8000FDE8 4600103E */  c.le.s     $f2, $f0
/* 109EC 8000FDEC 00000000 */  nop
/* 109F0 8000FDF0 45030005 */  bc1tl      .L8000FE08
/* 109F4 8000FDF4 46020001 */   sub.s     $f0, $f0, $f2
/* 109F8 8000FDF8 4600008D */  trunc.w.s  $f2, $f0
/* 109FC 8000FDFC 44021000 */  mfc1       $v0, $f2
/* 10A00 8000FE00 08003F87 */  j          .L8000FE1C
/* 10A04 8000FE04 305600FF */   andi      $s6, $v0, 0xff
.L8000FE08:
/* 10A08 8000FE08 3C048000 */  lui        $a0, 0x8000
/* 10A0C 8000FE0C 4600008D */  trunc.w.s  $f2, $f0
/* 10A10 8000FE10 44021000 */  mfc1       $v0, $f2
/* 10A14 8000FE14 00441025 */  or         $v0, $v0, $a0
/* 10A18 8000FE18 305600FF */  andi       $s6, $v0, 0xff
.L8000FE1C:
/* 10A1C 8000FE1C 3C01800E */  lui        $at, %hi(D_800D8738)
/* 10A20 8000FE20 C4228738 */  lwc1       $f2, %lo(D_800D8738)($at)
/* 10A24 8000FE24 46022000 */  add.s      $f0, $f4, $f2
/* 10A28 8000FE28 4600A03C */  c.lt.s     $f20, $f0
/* 10A2C 8000FE2C 00000000 */  nop
/* 10A30 8000FE30 45000016 */  bc1f       .L8000FE8C
/* 10A34 8000FE34 8FA7016C */   lw        $a3, 0x16c($sp)
/* 10A38 8000FE38 46140001 */  sub.s      $f0, $f0, $f20
/* 10A3C 8000FE3C 46001001 */  sub.s      $f0, $f2, $f0
/* 10A40 8000FE40 3C01800E */  lui        $at, %hi(D_800D873C)
/* 10A44 8000FE44 C422873C */  lwc1       $f2, %lo(D_800D873C)($at)
/* 10A48 8000FE48 46020002 */  mul.s      $f0, $f0, $f2
/* 10A4C 8000FE4C 3C01800E */  lui        $at, %hi(D_800D8740)
/* 10A50 8000FE50 C4228740 */  lwc1       $f2, %lo(D_800D8740)($at)
/* 10A54 8000FE54 4600103E */  c.le.s     $f2, $f0
/* 10A58 8000FE58 00000000 */  nop
/* 10A5C 8000FE5C 45030005 */  bc1tl      .L8000FE74
/* 10A60 8000FE60 46020001 */   sub.s     $f0, $f0, $f2
/* 10A64 8000FE64 4600008D */  trunc.w.s  $f2, $f0
/* 10A68 8000FE68 44021000 */  mfc1       $v0, $f2
/* 10A6C 8000FE6C 08003FA3 */  j          .L8000FE8C
/* 10A70 8000FE70 305600FF */   andi      $s6, $v0, 0xff
.L8000FE74:
/* 10A74 8000FE74 3C048000 */  lui        $a0, 0x8000
/* 10A78 8000FE78 4600008D */  trunc.w.s  $f2, $f0
/* 10A7C 8000FE7C 44021000 */  mfc1       $v0, $f2
/* 10A80 8000FE80 00441025 */  or         $v0, $v0, $a0
/* 10A84 8000FE84 305600FF */  andi       $s6, $v0, 0xff
/* 10A88 8000FE88 8FA7016C */  lw         $a3, 0x16c($sp)
.L8000FE8C:
/* 10A8C 8000FE8C 00E01821 */  addu       $v1, $a3, $zero
/* 10A90 8000FE90 02C3102B */  sltu       $v0, $s6, $v1
/* 10A94 8000FE94 54400001 */  bnel       $v0, $zero, .L8000FE9C
/* 10A98 8000FE98 02C01821 */   addu      $v1, $s6, $zero
.L8000FE9C:
/* 10A9C 8000FE9C 2C6200FF */  sltiu      $v0, $v1, 0xff
/* 10AA0 8000FEA0 14400005 */  bnez       $v0, .L8000FEB8
/* 10AA4 8000FEA4 3C05800F */   lui       $a1, 0x800f
/* 10AA8 8000FEA8 96020042 */  lhu        $v0, 0x42($s0)
/* 10AAC 8000FEAC 30420040 */  andi       $v0, $v0, 0x40
/* 10AB0 8000FEB0 1040000B */  beqz       $v0, .L8000FEE0
/* 10AB4 8000FEB4 0000A821 */   addu      $s5, $zero, $zero
.L8000FEB8:
/* 10AB8 8000FEB8 3C02800F */  lui        $v0, %hi(D_800F5290)
/* 10ABC 8000FEBC 94A48DB4 */  lhu        $a0, -0x724c($a1)
/* 10AC0 8000FEC0 24425290 */  addiu      $v0, $v0, %lo(D_800F5290)
/* 10AC4 8000FEC4 3083FFFF */  andi       $v1, $a0, 0xffff
/* 10AC8 8000FEC8 000318C0 */  sll        $v1, $v1, 3
/* 10ACC 8000FECC 0062A821 */  addu       $s5, $v1, $v0
/* 10AD0 8000FED0 24840001 */  addiu      $a0, $a0, 1
/* 10AD4 8000FED4 A4A48DB4 */  sh         $a0, -0x724c($a1)
/* 10AD8 8000FED8 AEA00000 */  sw         $zero, ($s5)
/* 10ADC 8000FEDC A6A00004 */  sh         $zero, 4($s5)
.L8000FEE0:
/* 10AE0 8000FEE0 02F41021 */  addu       $v0, $s7, $s4
/* 10AE4 8000FEE4 00028880 */  sll        $s1, $v0, 2
/* 10AE8 8000FEE8 26030008 */  addiu      $v1, $s0, 8
/* 10AEC 8000FEEC 00719021 */  addu       $s2, $v1, $s1
/* 10AF0 8000FEF0 8E420000 */  lw         $v0, ($s2)
/* 10AF4 8000FEF4 1440005C */  bnez       $v0, .L80010068
/* 10AF8 8000FEF8 0060F021 */   addu      $fp, $v1, $zero
/* 10AFC 8000FEFC 96020042 */  lhu        $v0, 0x42($s0)
/* 10B00 8000FF00 30420002 */  andi       $v0, $v0, 2
/* 10B04 8000FF04 10400029 */  beqz       $v0, .L8000FFAC
/* 10B08 8000FF08 00000000 */   nop
/* 10B0C 8000FF0C 0C003380 */  jal        NoExpPak_memCheck
/* 10B10 8000FF10 00002021 */   addu      $a0, $zero, $zero
/* 10B14 8000FF14 104000E8 */  beqz       $v0, .L800102B8
/* 10B18 8000FF18 8FA40178 */   lw        $a0, 0x178($sp)
/* 10B1C 8000FF1C 3C05800E */  lui        $a1, %hi(particleEmmiterStruct)
/* 10B20 8000FF20 8E040004 */  lw         $a0, 4($s0)
/* 10B24 8000FF24 0C027F0D */  jal        func_loading_borg7
/* 10B28 8000FF28 24A56CD8 */   addiu     $a1, $a1, %lo(particleEmmiterStruct)
/* 10B2C 8000FF2C 00402021 */  addu       $a0, $v0, $zero
/* 10B30 8000FF30 00002821 */  addu       $a1, $zero, $zero
/* 10B34 8000FF34 AE020008 */  sw         $v0, 8($s0)
/* 10B38 8000FF38 0C028024 */  jal        func_800A0090
/* 10B3C 8000FF3C 8C510008 */   lw        $s1, 8($v0)
/* 10B40 8000FF40 9662001E */  lhu        $v0, 0x1e($s3)
/* 10B44 8000FF44 10400021 */  beqz       $v0, .L8000FFCC
/* 10B48 8000FF48 00000000 */   nop
/* 10B4C 8000FF4C 0C009168 */  jal        get_event_flag
/* 10B50 8000FF50 00402021 */   addu      $a0, $v0, $zero
/* 10B54 8000FF54 10400005 */  beqz       $v0, .L8000FF6C
/* 10B58 8000FF58 00000000 */   nop
/* 10B5C 8000FF5C 96620014 */  lhu        $v0, 0x14($s3)
/* 10B60 8000FF60 30420200 */  andi       $v0, $v0, 0x200
/* 10B64 8000FF64 5040000A */  beql       $v0, $zero, .L8000FF90
/* 10B68 8000FF68 8E040008 */   lw        $a0, 8($s0)
.L8000FF6C:
/* 10B6C 8000FF6C 0C009168 */  jal        get_event_flag
/* 10B70 8000FF70 9664001E */   lhu       $a0, 0x1e($s3)
/* 10B74 8000FF74 14400015 */  bnez       $v0, .L8000FFCC
/* 10B78 8000FF78 00000000 */   nop
/* 10B7C 8000FF7C 96620014 */  lhu        $v0, 0x14($s3)
/* 10B80 8000FF80 30420200 */  andi       $v0, $v0, 0x200
/* 10B84 8000FF84 10400011 */  beqz       $v0, .L8000FFCC
/* 10B88 8000FF88 00000000 */   nop
/* 10B8C 8000FF8C 8E040008 */  lw         $a0, 8($s0)
.L8000FF90:
/* 10B90 8000FF90 0C028024 */  jal        func_800A0090
/* 10B94 8000FF94 24050001 */   addiu     $a1, $zero, 1
/* 10B98 8000FF98 8E040008 */  lw         $a0, 8($s0)
/* 10B9C 8000FF9C 0C0280C1 */  jal        func_800A0304
/* 10BA0 8000FFA0 24050002 */   addiu     $a1, $zero, 2
/* 10BA4 8000FFA4 08003FF3 */  j          .L8000FFCC
/* 10BA8 8000FFA8 00000000 */   nop
.L8000FFAC:
/* 10BAC 8000FFAC 0C003380 */  jal        NoExpPak_memCheck
/* 10BB0 8000FFB0 24040001 */   addiu     $a0, $zero, 1
/* 10BB4 8000FFB4 104000BF */  beqz       $v0, .L800102B4
/* 10BB8 8000FFB8 02111021 */   addu      $v0, $s0, $s1
/* 10BBC 8000FFBC 0C027E7A */  jal        BorgAnimLoadScene
/* 10BC0 8000FFC0 8C440004 */   lw        $a0, 4($v0)
/* 10BC4 8000FFC4 00408821 */  addu       $s1, $v0, $zero
/* 10BC8 8000FFC8 AE420000 */  sw         $v0, ($s2)
.L8000FFCC:
/* 10BCC 8000FFCC 0C0311DC */  jal        guMtxIdentF
/* 10BD0 8000FFD0 26240088 */   addiu     $a0, $s1, 0x88
/* 10BD4 8000FFD4 0C0311DC */  jal        guMtxIdentF
/* 10BD8 8000FFD8 262400C8 */   addiu     $a0, $s1, 0xc8
/* 10BDC 8000FFDC 0C029FEB */  jal        func_800A7FAC
/* 10BE0 8000FFE0 02202021 */   addu      $a0, $s1, $zero
/* 10BE4 8000FFE4 0C029FD9 */  jal        func_800A7F64
/* 10BE8 8000FFE8 02202021 */   addu      $a0, $s1, $zero
/* 10BEC 8000FFEC 0C029FFD */  jal        func_800A7FF4
/* 10BF0 8000FFF0 02202021 */   addu      $a0, $s1, $zero
/* 10BF4 8000FFF4 0C02A050 */  jal        func_800A8140
/* 10BF8 8000FFF8 02202021 */   addu      $a0, $s1, $zero
/* 10BFC 8000FFFC C6020028 */  lwc1       $f2, 0x28($s0)
/* 10C00 80010000 3C01800E */  lui        $at, %hi(D_800D8744)
/* 10C04 80010004 C4248744 */  lwc1       $f4, %lo(D_800D8744)($at)
/* 10C08 80010008 46041082 */  mul.s      $f2, $f2, $f4
/* 10C0C 8001000C C6000024 */  lwc1       $f0, 0x24($s0)
/* 10C10 80010010 46040002 */  mul.s      $f0, $f0, $f4
/* 10C14 80010014 44051000 */  mfc1       $a1, $f2
/* 10C18 80010018 C602002C */  lwc1       $f2, 0x2c($s0)
/* 10C1C 8001001C 46041082 */  mul.s      $f2, $f2, $f4
/* 10C20 80010020 44060000 */  mfc1       $a2, $f0
/* 10C24 80010024 44071000 */  mfc1       $a3, $f2
/* 10C28 80010028 0C029D7E */  jal        AniDat_rotate_MatrixA
/* 10C2C 8001002C 02202021 */   addu      $a0, $s1, $zero
/* 10C30 80010030 8E050030 */  lw         $a1, 0x30($s0)
/* 10C34 80010034 8E060034 */  lw         $a2, 0x34($s0)
/* 10C38 80010038 8E070038 */  lw         $a3, 0x38($s0)
/* 10C3C 8001003C 0C029DDF */  jal        matrix_normalize_scale
/* 10C40 80010040 02202021 */   addu      $a0, $s1, $zero
/* 10C44 80010044 96020042 */  lhu        $v0, 0x42($s0)
/* 10C48 80010048 30420002 */  andi       $v0, $v0, 2
/* 10C4C 8001004C 1040000D */  beqz       $v0, .L80010084
/* 10C50 80010050 02F41021 */   addu      $v0, $s7, $s4
/* 10C54 80010054 0C02A0CA */  jal        anidat_set_light_data
/* 10C58 80010058 02202021 */   addu      $a0, $s1, $zero
/* 10C5C 8001005C 02202021 */  addu       $a0, $s1, $zero
/* 10C60 80010060 0C02A0E0 */  jal        SceneSetMaxDynamicDirLights
/* 10C64 80010064 24050002 */   addiu     $a1, $zero, 2
.L80010068:
/* 10C68 80010068 96020042 */  lhu        $v0, 0x42($s0)
/* 10C6C 8001006C 30420002 */  andi       $v0, $v0, 2
/* 10C70 80010070 10400004 */  beqz       $v0, .L80010084
/* 10C74 80010074 02F41021 */   addu      $v0, $s7, $s4
/* 10C78 80010078 8E020008 */  lw         $v0, 8($s0)
/* 10C7C 8001007C 08004024 */  j          .L80010090
/* 10C80 80010080 8C510008 */   lw        $s1, 8($v0)
.L80010084:
/* 10C84 80010084 00021080 */  sll        $v0, $v0, 2
/* 10C88 80010088 03C21021 */  addu       $v0, $fp, $v0
/* 10C8C 8001008C 8C510000 */  lw         $s1, ($v0)
.L80010090:
/* 10C90 80010090 96020042 */  lhu        $v0, 0x42($s0)
/* 10C94 80010094 30420010 */  andi       $v0, $v0, 0x10
/* 10C98 80010098 10400002 */  beqz       $v0, .L800100A4
/* 10C9C 8001009C 00009021 */   addu      $s2, $zero, $zero
/* 10CA0 800100A0 8E12003C */  lw         $s2, 0x3c($s0)
.L800100A4:
/* 10CA4 800100A4 C6600000 */  lwc1       $f0, ($s3)
/* 10CA8 800100A8 461A0001 */  sub.s      $f0, $f0, $f26
/* 10CAC 800100AC C6620008 */  lwc1       $f2, 8($s3)
/* 10CB0 800100B0 461C1081 */  sub.s      $f2, $f2, $f28
/* 10CB4 800100B4 8E660004 */  lw         $a2, 4($s3)
/* 10CB8 800100B8 44050000 */  mfc1       $a1, $f0
/* 10CBC 800100BC 44071000 */  mfc1       $a3, $f2
/* 10CC0 800100C0 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 10CC4 800100C4 02202021 */   addu      $a0, $s1, $zero
/* 10CC8 800100C8 8E030010 */  lw         $v1, 0x10($s0)
/* 10CCC 800100CC 2402374A */  addiu      $v0, $zero, 0x374a
/* 10CD0 800100D0 5462001A */  bnel       $v1, $v0, .L8001013C
/* 10CD4 800100D4 96020042 */   lhu       $v0, 0x42($s0)
/* 10CD8 800100D8 56800018 */  bnel       $s4, $zero, .L8001013C
/* 10CDC 800100DC 96020042 */   lhu       $v0, 0x42($s0)
/* 10CE0 800100E0 8FA20174 */  lw         $v0, 0x174($sp)
/* 10CE4 800100E4 54400015 */  bnel       $v0, $zero, .L8001013C
/* 10CE8 800100E8 96020042 */   lhu       $v0, 0x42($s0)
/* 10CEC 800100EC 8FA40168 */  lw         $a0, 0x168($sp)
/* 10CF0 800100F0 96620014 */  lhu        $v0, 0x14($s3)
/* 10CF4 800100F4 8C830008 */  lw         $v1, 8($a0)
/* 10CF8 800100F8 30427FFF */  andi       $v0, $v0, 0x7fff
/* 10CFC 800100FC A6620014 */  sh         $v0, 0x14($s3)
/* 10D00 80010100 8FA70180 */  lw         $a3, 0x180($sp)
/* 10D04 80010104 00E31821 */  addu       $v1, $a3, $v1
/* 10D08 80010108 94640000 */  lhu        $a0, ($v1)
/* 10D0C 8001010C 24020011 */  addiu      $v0, $zero, 0x11
/* 10D10 80010110 AFA20010 */  sw         $v0, 0x10($sp)
/* 10D14 80010114 24020010 */  addiu      $v0, $zero, 0x10
/* 10D18 80010118 AFA20018 */  sw         $v0, 0x18($sp)
/* 10D1C 8001011C 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 10D20 80010120 24426988 */  addiu      $v0, $v0, %lo(zoneDatMatrix)
/* 10D24 80010124 AFA00014 */  sw         $zero, 0x14($sp)
/* 10D28 80010128 904502AD */  lbu        $a1, 0x2ad($v0)
/* 10D2C 8001012C 90460293 */  lbu        $a2, 0x293($v0)
/* 10D30 80010130 0C017EB4 */  jal        passto_WriteTo_VoxelChart
/* 10D34 80010134 90470295 */   lbu       $a3, 0x295($v0)
/* 10D38 80010138 96020042 */  lhu        $v0, 0x42($s0)
.L8001013C:
/* 10D3C 8001013C 3294FFFF */  andi       $s4, $s4, 0xffff
/* 10D40 80010140 30420002 */  andi       $v0, $v0, 2
/* 10D44 80010144 10400048 */  beqz       $v0, .L80010268
/* 10D48 80010148 AFB40174 */   sw        $s4, 0x174($sp)
/* 10D4C 8001014C 3C03800E */  lui        $v1, %hi(gGlobals)
/* 10D50 80010150 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 10D54 80010154 C460000C */  lwc1       $f0, 0xc($v1)
/* 10D58 80010158 3C01800E */  lui        $at, %hi(D_800D8748)
/* 10D5C 8001015C C4228748 */  lwc1       $f2, %lo(D_800D8748)($at)
/* 10D60 80010160 4600103E */  c.le.s     $f2, $f0
/* 10D64 80010164 00000000 */  nop
/* 10D68 80010168 45030005 */  bc1tl      .L80010180
/* 10D6C 8001016C 46020001 */   sub.s     $f0, $f0, $f2
/* 10D70 80010170 4600008D */  trunc.w.s  $f2, $f0
/* 10D74 80010174 44051000 */  mfc1       $a1, $f2
/* 10D78 80010178 08004065 */  j          .L80010194
/* 10D7C 8001017C 8E040008 */   lw        $a0, 8($s0)
.L80010180:
/* 10D80 80010180 3C038000 */  lui        $v1, 0x8000
/* 10D84 80010184 4600008D */  trunc.w.s  $f2, $f0
/* 10D88 80010188 44051000 */  mfc1       $a1, $f2
/* 10D8C 8001018C 00A32825 */  or         $a1, $a1, $v1
/* 10D90 80010190 8E040008 */  lw         $a0, 8($s0)
.L80010194:
/* 10D94 80010194 0C0280C1 */  jal        func_800A0304
/* 10D98 80010198 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 10D9C 8001019C 8FA4016C */  lw         $a0, 0x16c($sp)
/* 10DA0 800101A0 00803821 */  addu       $a3, $a0, $zero
/* 10DA4 800101A4 02C7102B */  sltu       $v0, $s6, $a3
/* 10DA8 800101A8 10400002 */  beqz       $v0, .L800101B4
/* 10DAC 800101AC 9665006A */   lhu       $a1, 0x6a($s3)
/* 10DB0 800101B0 02C03821 */  addu       $a3, $s6, $zero
.L800101B4:
/* 10DB4 800101B4 02202021 */  addu       $a0, $s1, $zero
/* 10DB8 800101B8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 10DBC 800101BC 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 10DC0 800101C0 C440000C */  lwc1       $f0, 0xc($v0)
/* 10DC4 800101C4 02603021 */  addu       $a2, $s3, $zero
/* 10DC8 800101C8 4600008D */  trunc.w.s  $f2, $f0
/* 10DCC 800101CC 44021000 */  mfc1       $v0, $f2
/* 10DD0 800101D0 00021400 */  sll        $v0, $v0, 0x10
/* 10DD4 800101D4 00021403 */  sra        $v0, $v0, 0x10
/* 10DD8 800101D8 0C005DD3 */  jal        func_8001774C
/* 10DDC 800101DC AFA20010 */   sw        $v0, 0x10($sp)
/* 10DE0 800101E0 3C07800E */  lui        $a3, %hi(gGlobals)
/* 10DE4 800101E4 24E768A8 */  addiu      $a3, $a3, %lo(gGlobals)
/* 10DE8 800101E8 24E40878 */  addiu      $a0, $a3, 0x878
/* 10DEC 800101EC 02202821 */  addu       $a1, $s1, $zero
/* 10DF0 800101F0 C4E0000C */  lwc1       $f0, 0xc($a3)
/* 10DF4 800101F4 02603021 */  addu       $a2, $s3, $zero
/* 10DF8 800101F8 4600008D */  trunc.w.s  $f2, $f0
/* 10DFC 800101FC 44071000 */  mfc1       $a3, $f2
/* 10E00 80010200 00073C00 */  sll        $a3, $a3, 0x10
/* 10E04 80010204 0C015511 */  jal        passto_InitLight_2
/* 10E08 80010208 00073C03 */   sra       $a3, $a3, 0x10
/* 10E0C 8001020C 02202021 */  addu       $a0, $s1, $zero
/* 10E10 80010210 3C03800E */  lui        $v1, %hi(gGlobals)
/* 10E14 80010214 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 10E18 80010218 02603021 */  addu       $a2, $s3, $zero
/* 10E1C 8001021C C460000C */  lwc1       $f0, 0xc($v1)
/* 10E20 80010220 8FA501DC */  lw         $a1, 0x1dc($sp)
/* 10E24 80010224 4600008D */  trunc.w.s  $f2, $f0
/* 10E28 80010228 44071000 */  mfc1       $a3, $f2
/* 10E2C 8001022C 00073C00 */  sll        $a3, $a3, 0x10
/* 10E30 80010230 0C015505 */  jal        passto_initLight
/* 10E34 80010234 00073C03 */   sra       $a3, $a3, 0x10
/* 10E38 80010238 52A00007 */  beql       $s5, $zero, .L80010258
/* 10E3C 8001023C 8E050008 */   lw        $a1, 8($s0)
/* 10E40 80010240 96A20004 */  lhu        $v0, 4($s5)
/* 10E44 80010244 8E030008 */  lw         $v1, 8($s0)
/* 10E48 80010248 34420002 */  ori        $v0, $v0, 2
/* 10E4C 8001024C AEA30000 */  sw         $v1, ($s5)
/* 10E50 80010250 080040AD */  j          .L800102B4
/* 10E54 80010254 A6A20004 */   sh        $v0, 4($s5)
.L80010258:
/* 10E58 80010258 0C028191 */  jal        func_800A0644
/* 10E5C 8001025C 8FA401D8 */   lw        $a0, 0x1d8($sp)
/* 10E60 80010260 080040AD */  j          .L800102B4
/* 10E64 80010264 AFA201D8 */   sw        $v0, 0x1d8($sp)
.L80010268:
/* 10E68 80010268 8FA3016C */  lw         $v1, 0x16c($sp)
/* 10E6C 8001026C 00602821 */  addu       $a1, $v1, $zero
/* 10E70 80010270 02C5102B */  sltu       $v0, $s6, $a1
/* 10E74 80010274 54400001 */  bnel       $v0, $zero, .L8001027C
/* 10E78 80010278 02C02821 */   addu      $a1, $s6, $zero
.L8001027C:
/* 10E7C 8001027C 02202021 */  addu       $a0, $s1, $zero
/* 10E80 80010280 24060001 */  addiu      $a2, $zero, 1
/* 10E84 80010284 0C003D48 */  jal        set_anidat_colors
/* 10E88 80010288 02403821 */   addu      $a3, $s2, $zero
/* 10E8C 8001028C 12A00003 */  beqz       $s5, .L8001029C
/* 10E90 80010290 8FA401D8 */   lw        $a0, 0x1d8($sp)
/* 10E94 80010294 080040AD */  j          .L800102B4
/* 10E98 80010298 AEB10000 */   sw        $s1, ($s5)
.L8001029C:
/* 10E9C 8001029C 0C028369 */  jal        func_800A0DA4
/* 10EA0 800102A0 02202821 */   addu      $a1, $s1, $zero
/* 10EA4 800102A4 080040AD */  j          .L800102B4
/* 10EA8 800102A8 AFA201D8 */   sw        $v0, 0x1d8($sp)
.L800102AC:
/* 10EAC 800102AC 0C003E13 */  jal        clear_if_no_ExpPak
/* 10EB0 800102B0 3285FFFF */   andi      $a1, $s4, 0xffff
.L800102B4:
/* 10EB4 800102B4 8FA40178 */  lw         $a0, 0x178($sp)
.L800102B8:
/* 10EB8 800102B8 00041400 */  sll        $v0, $a0, 0x10
/* 10EBC 800102BC 0002A403 */  sra        $s4, $v0, 0x10
/* 10EC0 800102C0 0681FEA3 */  bgez       $s4, .L8000FD50
/* 10EC4 800102C4 00141840 */   sll       $v1, $s4, 1
/* 10EC8 800102C8 080040B7 */  j          .L800102DC
/* 10ECC 800102CC 8FA7017C */   lw        $a3, 0x17c($sp)
.L800102D0:
/* 10ED0 800102D0 0C003E36 */  jal        rendervoxel_no_expPak
/* 10ED4 800102D4 02002021 */   addu      $a0, $s0, $zero
.L800102D8:
/* 10ED8 800102D8 8FA7017C */  lw         $a3, 0x17c($sp)
.L800102DC:
/* 10EDC 800102DC 8FA40168 */  lw         $a0, 0x168($sp)
/* 10EE0 800102E0 00071C00 */  sll        $v1, $a3, 0x10
/* 10EE4 800102E4 94820010 */  lhu        $v0, 0x10($a0)
/* 10EE8 800102E8 0003A403 */  sra        $s4, $v1, 0x10
/* 10EEC 800102EC 0282102A */  slt        $v0, $s4, $v0
/* 10EF0 800102F0 1440FDE9 */  bnez       $v0, .L8000FA98
/* 10EF4 800102F4 00148040 */   sll       $s0, $s4, 1
.L800102F8:
/* 10EF8 800102F8 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* 10EFC 800102FC 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* 10F00 80010300 3C05800E */  lui        $a1, %hi(D_800D86D4)
/* 10F04 80010304 0C0333AC */  jal        sprintf
/* 10F08 80010308 24A586D4 */   addiu     $a1, $a1, %lo(D_800D86D4)
/* 10F0C 8001030C 8FA201D8 */  lw         $v0, 0x1d8($sp)
/* 10F10 80010310 8FBF01AC */  lw         $ra, 0x1ac($sp)
/* 10F14 80010314 8FBE01A8 */  lw         $fp, 0x1a8($sp)
/* 10F18 80010318 8FB701A4 */  lw         $s7, 0x1a4($sp)
/* 10F1C 8001031C 8FB601A0 */  lw         $s6, 0x1a0($sp)
/* 10F20 80010320 8FB5019C */  lw         $s5, 0x19c($sp)
/* 10F24 80010324 8FB40198 */  lw         $s4, 0x198($sp)
/* 10F28 80010328 8FB30194 */  lw         $s3, 0x194($sp)
/* 10F2C 8001032C 8FB20190 */  lw         $s2, 0x190($sp)
/* 10F30 80010330 8FB1018C */  lw         $s1, 0x18c($sp)
/* 10F34 80010334 8FB00188 */  lw         $s0, 0x188($sp)
/* 10F38 80010338 D7BC01D0 */  ldc1       $f28, 0x1d0($sp)
/* 10F3C 8001033C D7BA01C8 */  ldc1       $f26, 0x1c8($sp)
/* 10F40 80010340 D7B801C0 */  ldc1       $f24, 0x1c0($sp)
/* 10F44 80010344 D7B601B8 */  ldc1       $f22, 0x1b8($sp)
/* 10F48 80010348 D7B401B0 */  ldc1       $f20, 0x1b0($sp)
/* 10F4C 8001034C 03E00008 */  jr         $ra
/* 10F50 80010350 27BD01D8 */   addiu     $sp, $sp, 0x1d8

glabel func_80010354
/* 10F54 80010354 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 10F58 80010358 AFB10014 */  sw         $s1, 0x14($sp)
/* 10F5C 8001035C 00A08821 */  addu       $s1, $a1, $zero
/* 10F60 80010360 AFBF0018 */  sw         $ra, 0x18($sp)
/* 10F64 80010364 AFB00010 */  sw         $s0, 0x10($sp)
/* 10F68 80010368 8E220004 */  lw         $v0, 4($s1)
/* 10F6C 8001036C 1040000A */  beqz       $v0, .L80010398
/* 10F70 80010370 00808021 */   addu      $s0, $a0, $zero
/* 10F74 80010374 00402021 */  addu       $a0, $v0, $zero
/* 10F78 80010378 24060001 */  addiu      $a2, $zero, 1
/* 10F7C 8001037C 9225001C */  lbu        $a1, 0x1c($s1)
/* 10F80 80010380 0C003D48 */  jal        set_anidat_colors
/* 10F84 80010384 00003821 */   addu      $a3, $zero, $zero
/* 10F88 80010388 8E250004 */  lw         $a1, 4($s1)
/* 10F8C 8001038C 0C028369 */  jal        func_800A0DA4
/* 10F90 80010390 02002021 */   addu      $a0, $s0, $zero
/* 10F94 80010394 00408021 */  addu       $s0, $v0, $zero
.L80010398:
/* 10F98 80010398 02001021 */  addu       $v0, $s0, $zero
/* 10F9C 8001039C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 10FA0 800103A0 8FB10014 */  lw         $s1, 0x14($sp)
/* 10FA4 800103A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 10FA8 800103A8 03E00008 */  jr         $ra
/* 10FAC 800103AC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800103B0
/* 10FB0 800103B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 10FB4 800103B4 AFB10014 */  sw         $s1, 0x14($sp)
/* 10FB8 800103B8 00A08821 */  addu       $s1, $a1, $zero
/* 10FBC 800103BC AFBF0018 */  sw         $ra, 0x18($sp)
/* 10FC0 800103C0 AFB00010 */  sw         $s0, 0x10($sp)
/* 10FC4 800103C4 8E230014 */  lw         $v1, 0x14($s1)
/* 10FC8 800103C8 1060000C */  beqz       $v1, .L800103FC
/* 10FCC 800103CC 00808021 */   addu      $s0, $a0, $zero
/* 10FD0 800103D0 8E220004 */  lw         $v0, 4($s1)
/* 10FD4 800103D4 10400009 */  beqz       $v0, .L800103FC
/* 10FD8 800103D8 24060001 */   addiu     $a2, $zero, 1
/* 10FDC 800103DC 00602021 */  addu       $a0, $v1, $zero
/* 10FE0 800103E0 9225001C */  lbu        $a1, 0x1c($s1)
/* 10FE4 800103E4 0C003D48 */  jal        set_anidat_colors
/* 10FE8 800103E8 00003821 */   addu      $a3, $zero, $zero
/* 10FEC 800103EC 8E250014 */  lw         $a1, 0x14($s1)
/* 10FF0 800103F0 0C028369 */  jal        func_800A0DA4
/* 10FF4 800103F4 02002021 */   addu      $a0, $s0, $zero
/* 10FF8 800103F8 00408021 */  addu       $s0, $v0, $zero
.L800103FC:
/* 10FFC 800103FC 02001021 */  addu       $v0, $s0, $zero
/* 11000 80010400 8FBF0018 */  lw         $ra, 0x18($sp)
/* 11004 80010404 8FB10014 */  lw         $s1, 0x14($sp)
/* 11008 80010408 8FB00010 */  lw         $s0, 0x10($sp)
/* 1100C 8001040C 03E00008 */  jr         $ra
/* 11010 80010410 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80010414
/* 11014 80010414 27BDFED8 */  addiu      $sp, $sp, -0x128
/* 11018 80010418 87A2013A */  lh         $v0, 0x13a($sp)
/* 1101C 8001041C AFB3011C */  sw         $s3, 0x11c($sp)
/* 11020 80010420 00009821 */  addu       $s3, $zero, $zero
/* 11024 80010424 AFB00110 */  sw         $s0, 0x110($sp)
/* 11028 80010428 00A08021 */  addu       $s0, $a1, $zero
/* 1102C 8001042C AFB10114 */  sw         $s1, 0x114($sp)
/* 11030 80010430 00C08821 */  addu       $s1, $a2, $zero
/* 11034 80010434 AFB20118 */  sw         $s2, 0x118($sp)
/* 11038 80010438 00E09021 */  addu       $s2, $a3, $zero
/* 1103C 8001043C 10400012 */  beqz       $v0, .L80010488
/* 11040 80010440 AFBF0120 */   sw        $ra, 0x120($sp)
/* 11044 80010444 C4800004 */  lwc1       $f0, 4($a0)
/* 11048 80010448 C4820000 */  lwc1       $f2, ($a0)
/* 1104C 8001044C C6040004 */  lwc1       $f4, 4($s0)
/* 11050 80010450 C6060000 */  lwc1       $f6, ($s0)
/* 11054 80010454 C6280004 */  lwc1       $f8, 4($s1)
/* 11058 80010458 C62A0000 */  lwc1       $f10, ($s1)
/* 1105C 8001045C C64C0004 */  lwc1       $f12, 4($s2)
/* 11060 80010460 C64E0000 */  lwc1       $f14, ($s2)
/* 11064 80010464 E7A00010 */  swc1       $f0, 0x10($sp)
/* 11068 80010468 E7A20014 */  swc1       $f2, 0x14($sp)
/* 1106C 8001046C E7A40050 */  swc1       $f4, 0x50($sp)
/* 11070 80010470 E7A60054 */  swc1       $f6, 0x54($sp)
/* 11074 80010474 E7A80090 */  swc1       $f8, 0x90($sp)
/* 11078 80010478 E7AA0094 */  swc1       $f10, 0x94($sp)
/* 1107C 8001047C E7AC00D0 */  swc1       $f12, 0xd0($sp)
/* 11080 80010480 0800412D */  j          .L800104B4
/* 11084 80010484 E7AE00D4 */   swc1      $f14, 0xd4($sp)
.L80010488:
/* 11088 80010488 0C02AD12 */  jal        copyVec2
/* 1108C 8001048C 27A50010 */   addiu     $a1, $sp, 0x10
/* 11090 80010490 02002021 */  addu       $a0, $s0, $zero
/* 11094 80010494 0C02AD12 */  jal        copyVec2
/* 11098 80010498 27A50050 */   addiu     $a1, $sp, 0x50
/* 1109C 8001049C 02202021 */  addu       $a0, $s1, $zero
/* 110A0 800104A0 0C02AD12 */  jal        copyVec2
/* 110A4 800104A4 27A50090 */   addiu     $a1, $sp, 0x90
/* 110A8 800104A8 02402021 */  addu       $a0, $s2, $zero
/* 110AC 800104AC 0C02AD12 */  jal        copyVec2
/* 110B0 800104B0 27A500D0 */   addiu     $a1, $sp, 0xd0
.L800104B4:
/* 110B4 800104B4 C7A00014 */  lwc1       $f0, 0x14($sp)
/* 110B8 800104B8 C7A200D4 */  lwc1       $f2, 0xd4($sp)
/* 110BC 800104BC 46020181 */  sub.s      $f6, $f0, $f2
/* 110C0 800104C0 C7A00054 */  lwc1       $f0, 0x54($sp)
/* 110C4 800104C4 44804000 */  mtc1       $zero, $f8
/* 110C8 800104C8 4608303C */  c.lt.s     $f6, $f8
/* 110CC 800104CC 00000000 */  nop
/* 110D0 800104D0 45000002 */  bc1f       .L800104DC
/* 110D4 800104D4 46020101 */   sub.s     $f4, $f0, $f2
/* 110D8 800104D8 24130001 */  addiu      $s3, $zero, 1
.L800104DC:
/* 110DC 800104DC 4608203C */  c.lt.s     $f4, $f8
/* 110E0 800104E0 00000000 */  nop
/* 110E4 800104E4 45000003 */  bc1f       .L800104F4
/* 110E8 800104E8 26620001 */   addiu     $v0, $s3, 1
/* 110EC 800104EC 00021400 */  sll        $v0, $v0, 0x10
/* 110F0 800104F0 00029C03 */  sra        $s3, $v0, 0x10
.L800104F4:
/* 110F4 800104F4 24020001 */  addiu      $v0, $zero, 1
/* 110F8 800104F8 16620020 */  bne        $s3, $v0, .L8001057C
/* 110FC 800104FC 00001021 */   addu      $v0, $zero, $zero
/* 11100 80010500 46003006 */  mov.s      $f0, $f6
/* 11104 80010504 4608003C */  c.lt.s     $f0, $f8
/* 11108 80010508 00000000 */  nop
/* 1110C 8001050C 45030001 */  bc1tl      .L80010514
/* 11110 80010510 46000007 */   neg.s     $f0, $f0
.L80010514:
/* 11114 80010514 46003086 */  mov.s      $f2, $f6
/* 11118 80010518 4608103C */  c.lt.s     $f2, $f8
/* 1111C 8001051C 00000000 */  nop
/* 11120 80010520 45030001 */  bc1tl      .L80010528
/* 11124 80010524 46001087 */   neg.s     $f2, $f2
.L80010528:
/* 11128 80010528 4608203C */  c.lt.s     $f4, $f8
/* 1112C 8001052C 00000000 */  nop
/* 11130 80010530 45020002 */  bc1fl      .L8001053C
/* 11134 80010534 46040000 */   add.s     $f0, $f0, $f4
/* 11138 80010538 46040001 */  sub.s      $f0, $f0, $f4
.L8001053C:
/* 1113C 8001053C 46001103 */  div.s      $f4, $f2, $f0
/* 11140 80010540 C7A00010 */  lwc1       $f0, 0x10($sp)
/* 11144 80010544 C7A20050 */  lwc1       $f2, 0x50($sp)
/* 11148 80010548 46020081 */  sub.s      $f2, $f0, $f2
/* 1114C 8001054C 46041082 */  mul.s      $f2, $f2, $f4
/* 11150 80010550 46020081 */  sub.s      $f2, $f0, $f2
/* 11154 80010554 C7A40090 */  lwc1       $f4, 0x90($sp)
/* 11158 80010558 4602203E */  c.le.s     $f4, $f2
/* 1115C 8001055C 00000000 */  nop
/* 11160 80010560 45000006 */  bc1f       .L8001057C
/* 11164 80010564 00001021 */   addu      $v0, $zero, $zero
/* 11168 80010568 C7A000D0 */  lwc1       $f0, 0xd0($sp)
/* 1116C 8001056C 4600103E */  c.le.s     $f2, $f0
/* 11170 80010570 00000000 */  nop
/* 11174 80010574 45030001 */  bc1tl      .L8001057C
/* 11178 80010578 24020001 */   addiu     $v0, $zero, 1
.L8001057C:
/* 1117C 8001057C 8FBF0120 */  lw         $ra, 0x120($sp)
/* 11180 80010580 8FB3011C */  lw         $s3, 0x11c($sp)
/* 11184 80010584 8FB20118 */  lw         $s2, 0x118($sp)
/* 11188 80010588 8FB10114 */  lw         $s1, 0x114($sp)
/* 1118C 8001058C 8FB00110 */  lw         $s0, 0x110($sp)
/* 11190 80010590 03E00008 */  jr         $ra
/* 11194 80010594 27BD0128 */   addiu     $sp, $sp, 0x128

glabel func_80010598
/* 11198 80010598 27BDFF38 */  addiu      $sp, $sp, -0xc8
/* 1119C 8001059C 00042400 */  sll        $a0, $a0, 0x10
/* 111A0 800105A0 00042403 */  sra        $a0, $a0, 0x10
/* 111A4 800105A4 00052C00 */  sll        $a1, $a1, 0x10
/* 111A8 800105A8 2484FFFF */  addiu      $a0, $a0, -1
/* 111AC 800105AC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 111B0 800105B0 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 111B4 800105B4 AFBF00BC */  sw         $ra, 0xbc($sp)
/* 111B8 800105B8 AFBE00B8 */  sw         $fp, 0xb8($sp)
/* 111BC 800105BC AFB700B4 */  sw         $s7, 0xb4($sp)
/* 111C0 800105C0 AFB600B0 */  sw         $s6, 0xb0($sp)
/* 111C4 800105C4 AFB500AC */  sw         $s5, 0xac($sp)
/* 111C8 800105C8 AFB400A8 */  sw         $s4, 0xa8($sp)
/* 111CC 800105CC AFB300A4 */  sw         $s3, 0xa4($sp)
/* 111D0 800105D0 AFB200A0 */  sw         $s2, 0xa0($sp)
/* 111D4 800105D4 AFB1009C */  sw         $s1, 0x9c($sp)
/* 111D8 800105D8 AFB00098 */  sw         $s0, 0x98($sp)
/* 111DC 800105DC F7B400C0 */  sdc1       $f20, 0xc0($sp)
/* 111E0 800105E0 C44A037C */  lwc1       $f10, 0x37c($v0)
/* 111E4 800105E4 44843000 */  mtc1       $a0, $f6
/* 111E8 800105E8 468031A0 */  cvt.s.w    $f6, $f6
/* 111EC 800105EC 460A3182 */  mul.s      $f6, $f6, $f10
/* 111F0 800105F0 00052C03 */  sra        $a1, $a1, 0x10
/* 111F4 800105F4 24A5FFFF */  addiu      $a1, $a1, -1
/* 111F8 800105F8 C4480380 */  lwc1       $f8, 0x380($v0)
/* 111FC 800105FC 44852000 */  mtc1       $a1, $f4
/* 11200 80010600 46802120 */  cvt.s.w    $f4, $f4
/* 11204 80010604 46082102 */  mul.s      $f4, $f4, $f8
/* 11208 80010608 3C01800E */  lui        $at, %hi(D_800D874C)
/* 1120C 8001060C C420874C */  lwc1       $f0, %lo(D_800D874C)($at)
/* 11210 80010610 C44E0244 */  lwc1       $f14, 0x244($v0)
/* 11214 80010614 46007382 */  mul.s      $f14, $f14, $f0
/* 11218 80010618 C44C0248 */  lwc1       $f12, 0x248($v0)
/* 1121C 8001061C 27B30060 */  addiu      $s3, $sp, 0x60
/* 11220 80010620 46006302 */  mul.s      $f12, $f12, $f0
/* 11224 80010624 02602021 */  addu       $a0, $s3, $zero
/* 11228 80010628 27B20068 */  addiu      $s2, $sp, 0x68
/* 1122C 8001062C 02402821 */  addu       $a1, $s2, $zero
/* 11230 80010630 24170001 */  addiu      $s7, $zero, 1
/* 11234 80010634 460A3280 */  add.s      $f10, $f6, $f10
/* 11238 80010638 0260A821 */  addu       $s5, $s3, $zero
/* 1123C 8001063C 27B10058 */  addiu      $s1, $sp, 0x58
/* 11240 80010640 46082200 */  add.s      $f8, $f4, $f8
/* 11244 80010644 3C01800E */  lui        $at, %hi(D_800D8750)
/* 11248 80010648 C4228750 */  lwc1       $f2, %lo(D_800D8750)($at)
/* 1124C 8001064C C4400214 */  lwc1       $f0, 0x214($v0)
/* 11250 80010650 46023181 */  sub.s      $f6, $f6, $f2
/* 11254 80010654 E7A00058 */  swc1       $f0, 0x58($sp)
/* 11258 80010658 C440021C */  lwc1       $f0, 0x21c($v0)
/* 1125C 8001065C 46022101 */  sub.s      $f4, $f4, $f2
/* 11260 80010660 0220B021 */  addu       $s6, $s1, $zero
/* 11264 80010664 E7A0005C */  swc1       $f0, 0x5c($sp)
/* 11268 80010668 46025280 */  add.s      $f10, $f10, $f2
/* 1126C 8001066C E7AE0060 */  swc1       $f14, 0x60($sp)
/* 11270 80010670 E7AC0064 */  swc1       $f12, 0x64($sp)
/* 11274 80010674 46024200 */  add.s      $f8, $f8, $f2
/* 11278 80010678 E7A60018 */  swc1       $f6, 0x18($sp)
/* 1127C 8001067C E7A4001C */  swc1       $f4, 0x1c($sp)
/* 11280 80010680 E7A40024 */  swc1       $f4, 0x24($sp)
/* 11284 80010684 E7A60028 */  swc1       $f6, 0x28($sp)
/* 11288 80010688 E7AA0020 */  swc1       $f10, 0x20($sp)
/* 1128C 8001068C E7A8002C */  swc1       $f8, 0x2c($sp)
/* 11290 80010690 E7AA0030 */  swc1       $f10, 0x30($sp)
/* 11294 80010694 0C02AD12 */  jal        copyVec2
/* 11298 80010698 E7A80034 */   swc1      $f8, 0x34($sp)
/* 1129C 8001069C 3C01800E */  lui        $at, %hi(D_800D8754)
/* 112A0 800106A0 C4348754 */  lwc1       $f20, %lo(D_800D8754)($at)
/* 112A4 800106A4 3C1E0002 */  lui        $fp, 2
/* 112A8 800106A8 4600A007 */  neg.s      $f0, $f20
/* 112AC 800106AC 44050000 */  mfc1       $a1, $f0
/* 112B0 800106B0 0C02ACBD */  jal        some_trig_func
/* 112B4 800106B4 02402021 */   addu      $a0, $s2, $zero
/* 112B8 800106B8 02402021 */  addu       $a0, $s2, $zero
/* 112BC 800106BC 02202821 */  addu       $a1, $s1, $zero
/* 112C0 800106C0 0C02AB44 */  jal        vec2_sum
/* 112C4 800106C4 02403021 */   addu      $a2, $s2, $zero
/* 112C8 800106C8 02602021 */  addu       $a0, $s3, $zero
/* 112CC 800106CC 27B00070 */  addiu      $s0, $sp, 0x70
/* 112D0 800106D0 0C02AD12 */  jal        copyVec2
/* 112D4 800106D4 02002821 */   addu      $a1, $s0, $zero
/* 112D8 800106D8 4405A000 */  mfc1       $a1, $f20
/* 112DC 800106DC 0C02ACBD */  jal        some_trig_func
/* 112E0 800106E0 02002021 */   addu      $a0, $s0, $zero
/* 112E4 800106E4 02002021 */  addu       $a0, $s0, $zero
/* 112E8 800106E8 02202821 */  addu       $a1, $s1, $zero
/* 112EC 800106EC 0C02AB44 */  jal        vec2_sum
/* 112F0 800106F0 02003021 */   addu      $a2, $s0, $zero
/* 112F4 800106F4 02602021 */  addu       $a0, $s3, $zero
/* 112F8 800106F8 02602821 */  addu       $a1, $s3, $zero
/* 112FC 800106FC 0C02AB44 */  jal        vec2_sum
/* 11300 80010700 02203021 */   addu      $a2, $s1, $zero
/* 11304 80010704 02402021 */  addu       $a0, $s2, $zero
/* 11308 80010708 00802821 */  addu       $a1, $a0, $zero
/* 1130C 8001070C 0C02AB44 */  jal        vec2_sum
/* 11310 80010710 02203021 */   addu      $a2, $s1, $zero
/* 11314 80010714 02002021 */  addu       $a0, $s0, $zero
/* 11318 80010718 00802821 */  addu       $a1, $a0, $zero
/* 1131C 8001071C 0C02AB44 */  jal        vec2_sum
/* 11320 80010720 02203021 */   addu      $a2, $s1, $zero
/* 11324 80010724 27B30020 */  addiu      $s3, $sp, 0x20
/* 11328 80010728 27B00060 */  addiu      $s0, $sp, 0x60
.L8001072C:
/* 1132C 8001072C AFA00010 */  sw         $zero, 0x10($sp)
/* 11330 80010730 27A40058 */  addiu      $a0, $sp, 0x58
/* 11334 80010734 02002821 */  addu       $a1, $s0, $zero
/* 11338 80010738 27A60018 */  addiu      $a2, $sp, 0x18
/* 1133C 8001073C 0C004105 */  jal        func_80010414
/* 11340 80010740 02603821 */   addu      $a3, $s3, $zero
/* 11344 80010744 14400048 */  bnez       $v0, .L80010868
/* 11348 80010748 00001021 */   addu      $v0, $zero, $zero
/* 1134C 8001074C AFA00010 */  sw         $zero, 0x10($sp)
/* 11350 80010750 02C02021 */  addu       $a0, $s6, $zero
/* 11354 80010754 02002821 */  addu       $a1, $s0, $zero
/* 11358 80010758 27B10028 */  addiu      $s1, $sp, 0x28
/* 1135C 8001075C 02203021 */  addu       $a2, $s1, $zero
/* 11360 80010760 27B20030 */  addiu      $s2, $sp, 0x30
/* 11364 80010764 0C004105 */  jal        func_80010414
/* 11368 80010768 02403821 */   addu      $a3, $s2, $zero
/* 1136C 8001076C 1440003E */  bnez       $v0, .L80010868
/* 11370 80010770 00001021 */   addu      $v0, $zero, $zero
/* 11374 80010774 24140001 */  addiu      $s4, $zero, 1
/* 11378 80010778 AFB40010 */  sw         $s4, 0x10($sp)
/* 1137C 8001077C 02C02021 */  addu       $a0, $s6, $zero
/* 11380 80010780 02002821 */  addu       $a1, $s0, $zero
/* 11384 80010784 27A60018 */  addiu      $a2, $sp, 0x18
/* 11388 80010788 0C004105 */  jal        func_80010414
/* 1138C 8001078C 02203821 */   addu      $a3, $s1, $zero
/* 11390 80010790 14400035 */  bnez       $v0, .L80010868
/* 11394 80010794 00001021 */   addu      $v0, $zero, $zero
/* 11398 80010798 AFB40010 */  sw         $s4, 0x10($sp)
/* 1139C 8001079C 02C02021 */  addu       $a0, $s6, $zero
/* 113A0 800107A0 02002821 */  addu       $a1, $s0, $zero
/* 113A4 800107A4 02603021 */  addu       $a2, $s3, $zero
/* 113A8 800107A8 0C004105 */  jal        func_80010414
/* 113AC 800107AC 02403821 */   addu      $a3, $s2, $zero
/* 113B0 800107B0 10400003 */  beqz       $v0, .L800107C0
/* 113B4 800107B4 2AE20002 */   slti      $v0, $s7, 2
/* 113B8 800107B8 0800421A */  j          .L80010868
/* 113BC 800107BC 00001021 */   addu      $v0, $zero, $zero
.L800107C0:
/* 113C0 800107C0 14400022 */  bnez       $v0, .L8001084C
/* 113C4 800107C4 03C01021 */   addu      $v0, $fp, $zero
/* 113C8 800107C8 AFA00010 */  sw         $zero, 0x10($sp)
/* 113CC 800107CC 02A02021 */  addu       $a0, $s5, $zero
/* 113D0 800107D0 02002821 */  addu       $a1, $s0, $zero
/* 113D4 800107D4 27A60018 */  addiu      $a2, $sp, 0x18
/* 113D8 800107D8 0C004105 */  jal        func_80010414
/* 113DC 800107DC 02603821 */   addu      $a3, $s3, $zero
/* 113E0 800107E0 14400021 */  bnez       $v0, .L80010868
/* 113E4 800107E4 00001021 */   addu      $v0, $zero, $zero
/* 113E8 800107E8 AFA00010 */  sw         $zero, 0x10($sp)
/* 113EC 800107EC 02A02021 */  addu       $a0, $s5, $zero
/* 113F0 800107F0 02002821 */  addu       $a1, $s0, $zero
/* 113F4 800107F4 02203021 */  addu       $a2, $s1, $zero
/* 113F8 800107F8 0C004105 */  jal        func_80010414
/* 113FC 800107FC 02403821 */   addu      $a3, $s2, $zero
/* 11400 80010800 14400019 */  bnez       $v0, .L80010868
/* 11404 80010804 00001021 */   addu      $v0, $zero, $zero
/* 11408 80010808 AFB40010 */  sw         $s4, 0x10($sp)
/* 1140C 8001080C 02A02021 */  addu       $a0, $s5, $zero
/* 11410 80010810 02002821 */  addu       $a1, $s0, $zero
/* 11414 80010814 27A60018 */  addiu      $a2, $sp, 0x18
/* 11418 80010818 0C004105 */  jal        func_80010414
/* 1141C 8001081C 02203821 */   addu      $a3, $s1, $zero
/* 11420 80010820 14400011 */  bnez       $v0, .L80010868
/* 11424 80010824 00001021 */   addu      $v0, $zero, $zero
/* 11428 80010828 AFB40010 */  sw         $s4, 0x10($sp)
/* 1142C 8001082C 02A02021 */  addu       $a0, $s5, $zero
/* 11430 80010830 02002821 */  addu       $a1, $s0, $zero
/* 11434 80010834 02603021 */  addu       $a2, $s3, $zero
/* 11438 80010838 0C004105 */  jal        func_80010414
/* 1143C 8001083C 02403821 */   addu      $a3, $s2, $zero
/* 11440 80010840 14400009 */  bnez       $v0, .L80010868
/* 11444 80010844 00001021 */   addu      $v0, $zero, $zero
/* 11448 80010848 03C01021 */  addu       $v0, $fp, $zero
.L8001084C:
/* 1144C 8001084C 3C030001 */  lui        $v1, 1
/* 11450 80010850 03C3F021 */  addu       $fp, $fp, $v1
/* 11454 80010854 0002BC03 */  sra        $s7, $v0, 0x10
/* 11458 80010858 2AE30004 */  slti       $v1, $s7, 4
/* 1145C 8001085C 1460FFB3 */  bnez       $v1, .L8001072C
/* 11460 80010860 26100008 */   addiu     $s0, $s0, 8
/* 11464 80010864 24020001 */  addiu      $v0, $zero, 1
.L80010868:
/* 11468 80010868 8FBF00BC */  lw         $ra, 0xbc($sp)
/* 1146C 8001086C 8FBE00B8 */  lw         $fp, 0xb8($sp)
/* 11470 80010870 8FB700B4 */  lw         $s7, 0xb4($sp)
/* 11474 80010874 8FB600B0 */  lw         $s6, 0xb0($sp)
/* 11478 80010878 8FB500AC */  lw         $s5, 0xac($sp)
/* 1147C 8001087C 8FB400A8 */  lw         $s4, 0xa8($sp)
/* 11480 80010880 8FB300A4 */  lw         $s3, 0xa4($sp)
/* 11484 80010884 8FB200A0 */  lw         $s2, 0xa0($sp)
/* 11488 80010888 8FB1009C */  lw         $s1, 0x9c($sp)
/* 1148C 8001088C 8FB00098 */  lw         $s0, 0x98($sp)
/* 11490 80010890 D7B400C0 */  ldc1       $f20, 0xc0($sp)
/* 11494 80010894 03E00008 */  jr         $ra
/* 11498 80010898 27BD00C8 */   addiu     $sp, $sp, 0xc8

glabel some_zone_rendering_func
/* 1149C 8001089C 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 114A0 800108A0 24020001 */  addiu      $v0, $zero, 1
/* 114A4 800108A4 AFA20068 */  sw         $v0, 0x68($sp)
/* 114A8 800108A8 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 114AC 800108AC AFB30094 */  sw         $s3, 0x94($sp)
/* 114B0 800108B0 24536988 */  addiu      $s3, $v0, %lo(zoneDatMatrix)
/* 114B4 800108B4 3C02800E */  lui        $v0, 0x800e
/* 114B8 800108B8 AFA400B0 */  sw         $a0, 0xb0($sp)
/* 114BC 800108BC 8FA700B0 */  lw         $a3, 0xb0($sp)
/* 114C0 800108C0 00063400 */  sll        $a2, $a2, 0x10
/* 114C4 800108C4 AFBF00AC */  sw         $ra, 0xac($sp)
/* 114C8 800108C8 AFBE00A8 */  sw         $fp, 0xa8($sp)
/* 114CC 800108CC AFB700A4 */  sw         $s7, 0xa4($sp)
/* 114D0 800108D0 AFB600A0 */  sw         $s6, 0xa0($sp)
/* 114D4 800108D4 AFB5009C */  sw         $s5, 0x9c($sp)
/* 114D8 800108D8 AFB40098 */  sw         $s4, 0x98($sp)
/* 114DC 800108DC AFB20090 */  sw         $s2, 0x90($sp)
/* 114E0 800108E0 AFB1008C */  sw         $s1, 0x8c($sp)
/* 114E4 800108E4 AFB00088 */  sw         $s0, 0x88($sp)
/* 114E8 800108E8 8E640084 */  lw         $a0, 0x84($s3)
/* 114EC 800108EC 8CE30000 */  lw         $v1, ($a3)
/* 114F0 800108F0 0006AC03 */  sra        $s5, $a2, 0x10
/* 114F4 800108F4 24478758 */  addiu      $a3, $v0, -0x78a8
/* 114F8 800108F8 88E80000 */  lwl        $t0, ($a3)
/* 114FC 800108FC 98E80003 */  lwr        $t0, 3($a3)
/* 11500 80010900 88E90004 */  lwl        $t1, 4($a3)
/* 11504 80010904 98E90007 */  lwr        $t1, 7($a3)
/* 11508 80010908 88EA0008 */  lwl        $t2, 8($a3)
/* 1150C 8001090C 98EA000B */  lwr        $t2, 0xb($a3)
/* 11510 80010910 ABA80020 */  swl        $t0, 0x20($sp)
/* 11514 80010914 BBA80023 */  swr        $t0, 0x23($sp)
/* 11518 80010918 ABA90024 */  swl        $t1, 0x24($sp)
/* 1151C 8001091C BBA90027 */  swr        $t1, 0x27($sp)
/* 11520 80010920 ABAA0028 */  swl        $t2, 0x28($sp)
/* 11524 80010924 BBAA002B */  swr        $t2, 0x2b($sp)
/* 11528 80010928 88E8000C */  lwl        $t0, 0xc($a3)
/* 1152C 8001092C 98E8000F */  lwr        $t0, 0xf($a3)
/* 11530 80010930 88E90010 */  lwl        $t1, 0x10($a3)
/* 11534 80010934 98E90013 */  lwr        $t1, 0x13($a3)
/* 11538 80010938 88EA0014 */  lwl        $t2, 0x14($a3)
/* 1153C 8001093C 98EA0017 */  lwr        $t2, 0x17($a3)
/* 11540 80010940 ABA8002C */  swl        $t0, 0x2c($sp)
/* 11544 80010944 BBA8002F */  swr        $t0, 0x2f($sp)
/* 11548 80010948 ABA90030 */  swl        $t1, 0x30($sp)
/* 1154C 8001094C BBA90033 */  swr        $t1, 0x33($sp)
/* 11550 80010950 ABAA0034 */  swl        $t2, 0x34($sp)
/* 11554 80010954 BBAA0037 */  swr        $t2, 0x37($sp)
/* 11558 80010958 88E80018 */  lwl        $t0, 0x18($a3)
/* 1155C 8001095C 98E8001B */  lwr        $t0, 0x1b($a3)
/* 11560 80010960 88E9001C */  lwl        $t1, 0x1c($a3)
/* 11564 80010964 98E9001F */  lwr        $t1, 0x1f($a3)
/* 11568 80010968 ABA80038 */  swl        $t0, 0x38($sp)
/* 1156C 8001096C BBA8003B */  swr        $t0, 0x3b($sp)
/* 11570 80010970 ABA9003C */  swl        $t1, 0x3c($sp)
/* 11574 80010974 BBA9003F */  swr        $t1, 0x3f($sp)
/* 11578 80010978 AFA500B4 */  sw         $a1, 0xb4($sp)
/* 1157C 8001097C 0C02A001 */  jal        func_800A8004
/* 11580 80010980 AFA30064 */   sw        $v1, 0x64($sp)
/* 11584 80010984 9263FF60 */  lbu        $v1, -0xa0($s3)
/* 11588 80010988 2402000C */  addiu      $v0, $zero, 0xc
/* 1158C 8001098C 14620008 */  bne        $v1, $v0, .L800109B0
/* 11590 80010990 00000000 */   nop
/* 11594 80010994 3C053DCC */  lui        $a1, 0x3dcc
/* 11598 80010998 34A5CCCD */  ori        $a1, $a1, 0xcccd
/* 1159C 8001099C 3C0642FA */  lui        $a2, 0x42fa
/* 115A0 800109A0 0C029F79 */  jal        setA_with_2floats
/* 115A4 800109A4 8E640084 */   lw        $a0, 0x84($s3)
/* 115A8 800109A8 08004270 */  j          .L800109C0
/* 115AC 800109AC 00000000 */   nop
.L800109B0:
/* 115B0 800109B0 3C053F80 */  lui        $a1, 0x3f80
/* 115B4 800109B4 3C064334 */  lui        $a2, 0x4334
/* 115B8 800109B8 0C029F79 */  jal        setA_with_2floats
/* 115BC 800109BC 8E640084 */   lw        $a0, 0x84($s3)
.L800109C0:
/* 115C0 800109C0 0C02837D */  jal        func_800A0DF4
/* 115C4 800109C4 8E640084 */   lw        $a0, 0x84($s3)
/* 115C8 800109C8 8FA40064 */  lw         $a0, 0x64($sp)
/* 115CC 800109CC 0C02855B */  jal        gsAnimationDataMtx
/* 115D0 800109D0 8E650084 */   lw        $a1, 0x84($s3)
/* 115D4 800109D4 3C03800F */  lui        $v1, %hi(D_800E8DA0)
/* 115D8 800109D8 84648DA0 */  lh         $a0, %lo(D_800E8DA0)($v1)
/* 115DC 800109DC 267E02D8 */  addiu      $fp, $s3, 0x2d8
/* 115E0 800109E0 10800008 */  beqz       $a0, .L80010A04
/* 115E4 800109E4 AFA20064 */   sw        $v0, 0x64($sp)
/* 115E8 800109E8 03C02021 */  addu       $a0, $fp, $zero
/* 115EC 800109EC 00402821 */  addu       $a1, $v0, $zero
/* 115F0 800109F0 02A03021 */  addu       $a2, $s5, $zero
/* 115F4 800109F4 24070001 */  addiu      $a3, $zero, 1
/* 115F8 800109F8 0C005E95 */  jal        renderPlayers
/* 115FC 800109FC AFA00010 */   sw        $zero, 0x10($sp)
/* 11600 80010A00 AFA20064 */  sw         $v0, 0x64($sp)
.L80010A04:
/* 11604 80010A04 3C03800E */  lui        $v1, %hi(gGlobals)
/* 11608 80010A08 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 1160C 80010A0C C4460214 */  lwc1       $f6, 0x214($v0)
/* 11610 80010A10 44800000 */  mtc1       $zero, $f0
/* 11614 80010A14 4600303C */  c.lt.s     $f6, $f0
/* 11618 80010A18 00000000 */  nop
/* 1161C 80010A1C 4501000F */  bc1t       .L80010A5C
/* 11620 80010A20 C444021C */   lwc1      $f4, 0x21c($v0)
/* 11624 80010A24 4600203C */  c.lt.s     $f4, $f0
/* 11628 80010A28 00000000 */  nop
/* 1162C 80010A2C 4503000C */  bc1tl      .L80010A60
/* 11630 80010A30 AFA00068 */   sw        $zero, 0x68($sp)
/* 11634 80010A34 C660029C */  lwc1       $f0, 0x29c($s3)
/* 11638 80010A38 4606003C */  c.lt.s     $f0, $f6
/* 1163C 80010A3C 00000000 */  nop
/* 11640 80010A40 45030007 */  bc1tl      .L80010A60
/* 11644 80010A44 AFA00068 */   sw        $zero, 0x68($sp)
/* 11648 80010A48 C66002A0 */  lwc1       $f0, 0x2a0($s3)
/* 1164C 80010A4C 4604003C */  c.lt.s     $f0, $f4
/* 11650 80010A50 00000000 */  nop
/* 11654 80010A54 45000003 */  bc1f       .L80010A64
/* 11658 80010A58 8FA80068 */   lw        $t0, 0x68($sp)
.L80010A5C:
/* 1165C 80010A5C AFA00068 */  sw         $zero, 0x68($sp)
.L80010A60:
/* 11660 80010A60 8FA80068 */  lw         $t0, 0x68($sp)
.L80010A64:
/* 11664 80010A64 15000006 */  bnez       $t0, .L80010A80
/* 11668 80010A68 24090001 */   addiu     $t1, $zero, 1
/* 1166C 80010A6C 8FA40064 */  lw         $a0, 0x64($sp)
/* 11670 80010A70 0C0040D5 */  jal        func_80010354
/* 11674 80010A74 26650080 */   addiu     $a1, $s3, 0x80
/* 11678 80010A78 AFA20064 */  sw         $v0, 0x64($sp)
/* 1167C 80010A7C 24090001 */  addiu      $t1, $zero, 1
.L80010A80:
/* 11680 80010A80 0000A021 */  addu       $s4, $zero, $zero
/* 11684 80010A84 27AA0020 */  addiu      $t2, $sp, 0x20
/* 11688 80010A88 27A20022 */  addiu      $v0, $sp, 0x22
/* 1168C 80010A8C 27A30064 */  addiu      $v1, $sp, 0x64
/* 11690 80010A90 26640350 */  addiu      $a0, $s3, 0x350
/* 11694 80010A94 2665016C */  addiu      $a1, $s3, 0x16c
/* 11698 80010A98 AFA90070 */  sw         $t1, 0x70($sp)
/* 1169C 80010A9C AFAA007C */  sw         $t2, 0x7c($sp)
/* 116A0 80010AA0 AFA20080 */  sw         $v0, 0x80($sp)
/* 116A4 80010AA4 AFA30084 */  sw         $v1, 0x84($sp)
/* 116A8 80010AA8 AFA40078 */  sw         $a0, 0x78($sp)
/* 116AC 80010AAC AFA50074 */  sw         $a1, 0x74($sp)
/* 116B0 80010AB0 8E620120 */  lw         $v0, 0x120($s3)
/* 116B4 80010AB4 27B60060 */  addiu      $s6, $sp, 0x60
/* 116B8 80010AB8 9042001B */  lbu        $v0, 0x1b($v0)
/* 116BC 80010ABC 27B70062 */  addiu      $s7, $sp, 0x62
/* 116C0 80010AC0 AFA2006C */  sw         $v0, 0x6c($sp)
/* 116C4 80010AC4 00141080 */  sll        $v0, $s4, 2
.L80010AC8:
/* 116C8 80010AC8 8FA7007C */  lw         $a3, 0x7c($sp)
/* 116CC 80010ACC 8FA80080 */  lw         $t0, 0x80($sp)
/* 116D0 80010AD0 8FB00070 */  lw         $s0, 0x70($sp)
/* 116D4 80010AD4 00E28821 */  addu       $s1, $a3, $v0
/* 116D8 80010AD8 01029021 */  addu       $s2, $t0, $v0
/* 116DC 80010ADC 00101040 */  sll        $v0, $s0, 1
/* 116E0 80010AE0 86240000 */  lh         $a0, ($s1)
/* 116E4 80010AE4 86450000 */  lh         $a1, ($s2)
/* 116E8 80010AE8 304200FE */  andi       $v0, $v0, 0xfe
/* 116EC 80010AEC 0C004166 */  jal        func_80010598
/* 116F0 80010AF0 AFA20070 */   sw        $v0, 0x70($sp)
/* 116F4 80010AF4 10400004 */  beqz       $v0, .L80010B08
/* 116F8 80010AF8 8FA9006C */   lw        $t1, 0x6c($sp)
/* 116FC 80010AFC 01301024 */  and        $v0, $t1, $s0
/* 11700 80010B00 104000AA */  beqz       $v0, .L80010DAC
/* 11704 80010B04 3C04800E */   lui       $a0, 0x800e
.L80010B08:
/* 11708 80010B08 3C0A800E */  lui        $t2, %hi(ExpPakFlag)
/* 1170C 80010B0C 86230000 */  lh         $v1, ($s1)
/* 11710 80010B10 954466C4 */  lhu        $a0, %lo(ExpPakFlag)($t2)
/* 11714 80010B14 00031040 */  sll        $v0, $v1, 1
/* 11718 80010B18 00431021 */  addu       $v0, $v0, $v1
/* 1171C 80010B1C 00021140 */  sll        $v0, $v0, 5
/* 11720 80010B20 86430000 */  lh         $v1, ($s2)
/* 11724 80010B24 02621021 */  addu       $v0, $s3, $v0
/* 11728 80010B28 00031940 */  sll        $v1, $v1, 5
/* 1172C 80010B2C 14800033 */  bnez       $a0, .L80010BFC
/* 11730 80010B30 00438021 */   addu      $s0, $v0, $v1
/* 11734 80010B34 3C02800E */  lui        $v0, %hi(gGlobals)
/* 11738 80010B38 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 1173C 80010B3C 96222028 */  lhu        $v0, 0x2028($s1)
/* 11740 80010B40 5440002F */  bnel       $v0, $zero, .L80010C00
/* 11744 80010B44 9202001C */   lbu       $v0, 0x1c($s0)
/* 11748 80010B48 3C02800F */  lui        $v0, %hi(oneZone_load)
/* 1174C 80010B4C 94438DAE */  lhu        $v1, %lo(oneZone_load)($v0)
/* 11750 80010B50 5460002B */  bnel       $v1, $zero, .L80010C00
/* 11754 80010B54 9202001C */   lbu       $v0, 0x1c($s0)
/* 11758 80010B58 8E020000 */  lw         $v0, ($s0)
/* 1175C 80010B5C 50400013 */  beql       $v0, $zero, .L80010BAC
/* 11760 80010B60 8E020010 */   lw        $v0, 0x10($s0)
/* 11764 80010B64 8E020004 */  lw         $v0, 4($s0)
/* 11768 80010B68 54400010 */  bnel       $v0, $zero, .L80010BAC
/* 1176C 80010B6C 8E020010 */   lw        $v0, 0x10($s0)
/* 11770 80010B70 0C003380 */  jal        NoExpPak_memCheck
/* 11774 80010B74 24040003 */   addiu     $a0, $zero, 3
/* 11778 80010B78 1040000B */  beqz       $v0, .L80010BA8
/* 1177C 80010B7C 26241E28 */   addiu     $a0, $s1, 0x1e28
/* 11780 80010B80 26050004 */  addiu      $a1, $s0, 4
/* 11784 80010B84 9202001E */  lbu        $v0, 0x1e($s0)
/* 11788 80010B88 24030001 */  addiu      $v1, $zero, 1
/* 1178C 80010B8C 34420001 */  ori        $v0, $v0, 1
/* 11790 80010B90 A202001E */  sb         $v0, 0x1e($s0)
/* 11794 80010B94 AFA30010 */  sw         $v1, 0x10($sp)
/* 11798 80010B98 AFA00014 */  sw         $zero, 0x14($sp)
/* 1179C 80010B9C 8E070000 */  lw         $a3, ($s0)
/* 117A0 80010BA0 0C03574B */  jal        AllocAllocQueueItem
/* 117A4 80010BA4 00003021 */   addu      $a2, $zero, $zero
.L80010BA8:
/* 117A8 80010BA8 8E020010 */  lw         $v0, 0x10($s0)
.L80010BAC:
/* 117AC 80010BAC 50400014 */  beql       $v0, $zero, .L80010C00
/* 117B0 80010BB0 9202001C */   lbu       $v0, 0x1c($s0)
/* 117B4 80010BB4 8E020014 */  lw         $v0, 0x14($s0)
/* 117B8 80010BB8 54400011 */  bnel       $v0, $zero, .L80010C00
/* 117BC 80010BBC 9202001C */   lbu       $v0, 0x1c($s0)
/* 117C0 80010BC0 0C003380 */  jal        NoExpPak_memCheck
/* 117C4 80010BC4 24040004 */   addiu     $a0, $zero, 4
/* 117C8 80010BC8 1040000C */  beqz       $v0, .L80010BFC
/* 117CC 80010BCC 3C04800F */   lui       $a0, %hi(queueStructB)
/* 117D0 80010BD0 248486D0 */  addiu      $a0, $a0, %lo(queueStructB)
/* 117D4 80010BD4 26050014 */  addiu      $a1, $s0, 0x14
/* 117D8 80010BD8 9202001E */  lbu        $v0, 0x1e($s0)
/* 117DC 80010BDC 24030001 */  addiu      $v1, $zero, 1
/* 117E0 80010BE0 34420002 */  ori        $v0, $v0, 2
/* 117E4 80010BE4 A202001E */  sb         $v0, 0x1e($s0)
/* 117E8 80010BE8 AFA30010 */  sw         $v1, 0x10($sp)
/* 117EC 80010BEC AFA00014 */  sw         $zero, 0x14($sp)
/* 117F0 80010BF0 8E070000 */  lw         $a3, ($s0)
/* 117F4 80010BF4 0C03574B */  jal        AllocAllocQueueItem
/* 117F8 80010BF8 00003021 */   addu      $a2, $zero, $zero
.L80010BFC:
/* 117FC 80010BFC 9202001C */  lbu        $v0, 0x1c($s0)
.L80010C00:
/* 11800 80010C00 2C4200FF */  sltiu      $v0, $v0, 0xff
/* 11804 80010C04 10400008 */  beqz       $v0, .L80010C28
/* 11808 80010C08 00151840 */   sll       $v1, $s5, 1
/* 1180C 80010C0C 9202001C */  lbu        $v0, 0x1c($s0)
/* 11810 80010C10 00431021 */  addu       $v0, $v0, $v1
/* 11814 80010C14 3042FFFF */  andi       $v0, $v0, 0xffff
/* 11818 80010C18 2C430100 */  sltiu      $v1, $v0, 0x100
/* 1181C 80010C1C 50600001 */  beql       $v1, $zero, .L80010C24
/* 11820 80010C20 240200FF */   addiu     $v0, $zero, 0xff
.L80010C24:
/* 11824 80010C24 A202001C */  sb         $v0, 0x1c($s0)
.L80010C28:
/* 11828 80010C28 8E020004 */  lw         $v0, 4($s0)
/* 1182C 80010C2C 10400004 */  beqz       $v0, .L80010C40
/* 11830 80010C30 8FA40064 */   lw        $a0, 0x64($sp)
/* 11834 80010C34 0C0040D5 */  jal        func_80010354
/* 11838 80010C38 02002821 */   addu      $a1, $s0, $zero
/* 1183C 80010C3C AFA20064 */  sw         $v0, 0x64($sp)
.L80010C40:
/* 11840 80010C40 8E04000C */  lw         $a0, 0xc($s0)
/* 11844 80010C44 1080007B */  beqz       $a0, .L80010E34
/* 11848 80010C48 24840008 */   addiu     $a0, $a0, 8
/* 1184C 80010C4C 02C03021 */  addu       $a2, $s6, $zero
/* 11850 80010C50 8FA500B4 */  lw         $a1, 0xb4($sp)
/* 11854 80010C54 0C02B78A */  jal        func_800ADE28
/* 11858 80010C58 02E03821 */   addu      $a3, $s7, $zero
/* 1185C 80010C5C 00004021 */  addu       $t0, $zero, $zero
/* 11860 80010C60 00003821 */  addu       $a3, $zero, $zero
/* 11864 80010C64 44802000 */  mtc1       $zero, $f4
/* 11868 80010C68 8E03000C */  lw         $v1, 0xc($s0)
/* 1186C 80010C6C C660029C */  lwc1       $f0, 0x29c($s3)
/* 11870 80010C70 C4620014 */  lwc1       $f2, 0x14($v1)
/* 11874 80010C74 46002186 */  mov.s      $f6, $f4
/* 11878 80010C78 46020003 */  div.s      $f0, $f0, $f2
/* 1187C 80010C7C 4600008D */  trunc.w.s  $f2, $f0
/* 11880 80010C80 44021000 */  mfc1       $v0, $f2
/* 11884 80010C84 00021400 */  sll        $v0, $v0, 0x10
/* 11888 80010C88 00023403 */  sra        $a2, $v0, 0x10
/* 1188C 80010C8C C66002A0 */  lwc1       $f0, 0x2a0($s3)
/* 11890 80010C90 C4620018 */  lwc1       $f2, 0x18($v1)
/* 11894 80010C94 9204001D */  lbu        $a0, 0x1d($s0)
/* 11898 80010C98 46020003 */  div.s      $f0, $f0, $f2
/* 1189C 80010C9C 4600008D */  trunc.w.s  $f2, $f0
/* 118A0 80010CA0 44021000 */  mfc1       $v0, $f2
/* 118A4 80010CA4 00021400 */  sll        $v0, $v0, 0x10
/* 118A8 80010CA8 2C830023 */  sltiu      $v1, $a0, 0x23
/* 118AC 80010CAC 10600035 */  beqz       $v1, .L80010D84
/* 118B0 80010CB0 00022C03 */   sra       $a1, $v0, 0x10
/* 118B4 80010CB4 3C02800E */  lui        $v0, %hi(D_800D8808)
/* 118B8 80010CB8 24428808 */  addiu      $v0, $v0, %lo(D_800D8808)
/* 118BC 80010CBC 00041880 */  sll        $v1, $a0, 2
/* 118C0 80010CC0 00621821 */  addu       $v1, $v1, $v0
/* 118C4 80010CC4 8C640000 */  lw         $a0, ($v1)
/* 118C8 80010CC8 00800008 */  jr         $a0
/* 118CC 80010CCC 00000000 */   nop
/* 118D0 80010CD0 00C03821 */  addu       $a3, $a2, $zero
/* 118D4 80010CD4 00A04021 */  addu       $t0, $a1, $zero
/* 118D8 80010CD8 C666029C */  lwc1       $f6, 0x29c($s3)
/* 118DC 80010CDC 08004361 */  j          .L80010D84
/* 118E0 80010CE0 C66402A0 */   lwc1      $f4, 0x2a0($s3)
/* 118E4 80010CE4 00A04021 */  addu       $t0, $a1, $zero
/* 118E8 80010CE8 44803000 */  mtc1       $zero, $f6
/* 118EC 80010CEC C66402A0 */  lwc1       $f4, 0x2a0($s3)
/* 118F0 80010CF0 08004361 */  j          .L80010D84
/* 118F4 80010CF4 87A70060 */   lh        $a3, 0x60($sp)
/* 118F8 80010CF8 00003821 */  addu       $a3, $zero, $zero
/* 118FC 80010CFC 00A04021 */  addu       $t0, $a1, $zero
/* 11900 80010D00 C660029C */  lwc1       $f0, 0x29c($s3)
/* 11904 80010D04 C66402A0 */  lwc1       $f4, 0x2a0($s3)
/* 11908 80010D08 08004361 */  j          .L80010D84
/* 1190C 80010D0C 46000187 */   neg.s     $f6, $f0
/* 11910 80010D10 00C03821 */  addu       $a3, $a2, $zero
/* 11914 80010D14 C666029C */  lwc1       $f6, 0x29c($s3)
/* 11918 80010D18 44802000 */  mtc1       $zero, $f4
/* 1191C 80010D1C 08004361 */  j          .L80010D84
/* 11920 80010D20 87A80062 */   lh        $t0, 0x62($sp)
/* 11924 80010D24 00003821 */  addu       $a3, $zero, $zero
/* 11928 80010D28 44802000 */  mtc1       $zero, $f4
/* 1192C 80010D2C C660029C */  lwc1       $f0, 0x29c($s3)
/* 11930 80010D30 87A80062 */  lh         $t0, 0x62($sp)
/* 11934 80010D34 08004361 */  j          .L80010D84
/* 11938 80010D38 46000187 */   neg.s     $f6, $f0
/* 1193C 80010D3C 00C03821 */  addu       $a3, $a2, $zero
/* 11940 80010D40 00004021 */  addu       $t0, $zero, $zero
/* 11944 80010D44 C66002A0 */  lwc1       $f0, 0x2a0($s3)
/* 11948 80010D48 C666029C */  lwc1       $f6, 0x29c($s3)
/* 1194C 80010D4C 08004361 */  j          .L80010D84
/* 11950 80010D50 46000107 */   neg.s     $f4, $f0
/* 11954 80010D54 00004021 */  addu       $t0, $zero, $zero
/* 11958 80010D58 44803000 */  mtc1       $zero, $f6
/* 1195C 80010D5C C66002A0 */  lwc1       $f0, 0x2a0($s3)
/* 11960 80010D60 87A70060 */  lh         $a3, 0x60($sp)
/* 11964 80010D64 08004361 */  j          .L80010D84
/* 11968 80010D68 46000107 */   neg.s     $f4, $f0
/* 1196C 80010D6C 00003821 */  addu       $a3, $zero, $zero
/* 11970 80010D70 00004021 */  addu       $t0, $zero, $zero
/* 11974 80010D74 C660029C */  lwc1       $f0, 0x29c($s3)
/* 11978 80010D78 C66202A0 */  lwc1       $f2, 0x2a0($s3)
/* 1197C 80010D7C 46000187 */  neg.s      $f6, $f0
/* 11980 80010D80 46001107 */  neg.s      $f4, $f2
.L80010D84:
/* 11984 80010D84 8FA600B4 */  lw         $a2, 0xb4($sp)
/* 11988 80010D88 8FA40064 */  lw         $a0, 0x64($sp)
/* 1198C 80010D8C 8E05000C */  lw         $a1, 0xc($s0)
/* 11990 80010D90 AFA80010 */  sw         $t0, 0x10($sp)
/* 11994 80010D94 E7A60014 */  swc1       $f6, 0x14($sp)
/* 11998 80010D98 E7A40018 */  swc1       $f4, 0x18($sp)
/* 1199C 80010D9C 0C003E69 */  jal        RenderVoxelScenes
/* 119A0 80010DA0 24A50008 */   addiu     $a1, $a1, 8
/* 119A4 80010DA4 0800438D */  j          .L80010E34
/* 119A8 80010DA8 AFA20064 */   sw        $v0, 0x64($sp)
.L80010DAC:
/* 119AC 80010DAC 948266C4 */  lhu        $v0, 0x66c4($a0)
/* 119B0 80010DB0 14400021 */  bnez       $v0, .L80010E38
/* 119B4 80010DB4 26820001 */   addiu     $v0, $s4, 1
/* 119B8 80010DB8 0C02608F */  jal        get_MemFree
/* 119BC 80010DBC 00000000 */   nop
/* 119C0 80010DC0 3C030001 */  lui        $v1, 1
/* 119C4 80010DC4 34637FFF */  ori        $v1, $v1, 0x7fff
/* 119C8 80010DC8 0062182B */  sltu       $v1, $v1, $v0
/* 119CC 80010DCC 1460001A */  bnez       $v1, .L80010E38
/* 119D0 80010DD0 26820001 */   addiu     $v0, $s4, 1
/* 119D4 80010DD4 86230000 */  lh         $v1, ($s1)
/* 119D8 80010DD8 00031040 */  sll        $v0, $v1, 1
/* 119DC 80010DDC 00431021 */  addu       $v0, $v0, $v1
/* 119E0 80010DE0 00021140 */  sll        $v0, $v0, 5
/* 119E4 80010DE4 86430000 */  lh         $v1, ($s2)
/* 119E8 80010DE8 02621021 */  addu       $v0, $s3, $v0
/* 119EC 80010DEC 00031940 */  sll        $v1, $v1, 5
/* 119F0 80010DF0 00438021 */  addu       $s0, $v0, $v1
/* 119F4 80010DF4 8E040004 */  lw         $a0, 4($s0)
/* 119F8 80010DF8 10800006 */  beqz       $a0, .L80010E14
/* 119FC 80010DFC 3C04800E */   lui       $a0, %hi(queueStructA)
/* 11A00 80010E00 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 11A04 80010E04 26050004 */  addiu      $a1, $s0, 4
/* 11A08 80010E08 24060001 */  addiu      $a2, $zero, 1
/* 11A0C 80010E0C 0C035867 */  jal        AllocFreeQueueItem
/* 11A10 80010E10 00003821 */   addu      $a3, $zero, $zero
.L80010E14:
/* 11A14 80010E14 8E020014 */  lw         $v0, 0x14($s0)
/* 11A18 80010E18 10400006 */  beqz       $v0, .L80010E34
/* 11A1C 80010E1C 3C04800E */   lui       $a0, %hi(queueStructA)
/* 11A20 80010E20 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 11A24 80010E24 26050014 */  addiu      $a1, $s0, 0x14
/* 11A28 80010E28 24060001 */  addiu      $a2, $zero, 1
/* 11A2C 80010E2C 0C035867 */  jal        AllocFreeQueueItem
/* 11A30 80010E30 00003821 */   addu      $a3, $zero, $zero
.L80010E34:
/* 11A34 80010E34 26820001 */  addiu      $v0, $s4, 1
.L80010E38:
/* 11A38 80010E38 00021400 */  sll        $v0, $v0, 0x10
/* 11A3C 80010E3C 0002A403 */  sra        $s4, $v0, 0x10
/* 11A40 80010E40 2A830008 */  slti       $v1, $s4, 8
/* 11A44 80010E44 1460FF20 */  bnez       $v1, .L80010AC8
/* 11A48 80010E48 00141080 */   sll       $v0, $s4, 2
/* 11A4C 80010E4C 8FA50068 */  lw         $a1, 0x68($sp)
/* 11A50 80010E50 10A00006 */  beqz       $a1, .L80010E6C
/* 11A54 80010E54 3C02800F */   lui       $v0, 0x800f
/* 11A58 80010E58 8FA40064 */  lw         $a0, 0x64($sp)
/* 11A5C 80010E5C 0C0040D5 */  jal        func_80010354
/* 11A60 80010E60 26650080 */   addiu     $a1, $s3, 0x80
/* 11A64 80010E64 AFA20064 */  sw         $v0, 0x64($sp)
/* 11A68 80010E68 3C02800F */  lui        $v0, %hi(gGlobalsText)
.L80010E6C:
/* 11A6C 80010E6C 24508920 */  addiu      $s0, $v0, %lo(gGlobalsText)
/* 11A70 80010E70 02002021 */  addu       $a0, $s0, $zero
/* 11A74 80010E74 3C05800E */  lui        $a1, %hi(D_800D8778)
/* 11A78 80010E78 0C0333AC */  jal        sprintf
/* 11A7C 80010E7C 24A58778 */   addiu     $a1, $a1, %lo(D_800D8778)
/* 11A80 80010E80 0C002593 */  jal        get_vi_buffer_choice
/* 11A84 80010E84 00000000 */   nop
/* 11A88 80010E88 8FA40084 */  lw         $a0, 0x84($sp)
/* 11A8C 80010E8C 8FA50078 */  lw         $a1, 0x78($sp)
/* 11A90 80010E90 8FA60074 */  lw         $a2, 0x74($sp)
/* 11A94 80010E94 02A03821 */  addu       $a3, $s5, $zero
/* 11A98 80010E98 AFA20010 */  sw         $v0, 0x10($sp)
/* 11A9C 80010E9C 0C02C85B */  jal        ProcessAndRenderParticleHead
/* 11AA0 80010EA0 AFA00014 */   sw        $zero, 0x14($sp)
/* 11AA4 80010EA4 02002021 */  addu       $a0, $s0, $zero
/* 11AA8 80010EA8 3C05800E */  lui        $a1, %hi(D_800D8788)
/* 11AAC 80010EAC 0C0333AC */  jal        sprintf
/* 11AB0 80010EB0 24A58788 */   addiu     $a1, $a1, %lo(D_800D8788)
/* 11AB4 80010EB4 8FA50064 */  lw         $a1, 0x64($sp)
/* 11AB8 80010EB8 0C005781 */  jal        renderPlayerShadows
/* 11ABC 80010EBC 2604E340 */   addiu     $a0, $s0, -0x1cc0
/* 11AC0 80010EC0 02002021 */  addu       $a0, $s0, $zero
/* 11AC4 80010EC4 3C05800E */  lui        $a1, %hi(D_800D87A0)
/* 11AC8 80010EC8 24A587A0 */  addiu      $a1, $a1, %lo(D_800D87A0)
/* 11ACC 80010ECC 0C0333AC */  jal        sprintf
/* 11AD0 80010ED0 AFA20064 */   sw        $v0, 0x64($sp)
/* 11AD4 80010ED4 3C07800F */  lui        $a3, %hi(D_800E8DA0)
/* 11AD8 80010ED8 84E38DA0 */  lh         $v1, %lo(D_800E8DA0)($a3)
/* 11ADC 80010EDC 54600009 */  bnel       $v1, $zero, .L80010F04
/* 11AE0 80010EE0 02002021 */   addu      $a0, $s0, $zero
/* 11AE4 80010EE4 03C02021 */  addu       $a0, $fp, $zero
/* 11AE8 80010EE8 02A03021 */  addu       $a2, $s5, $zero
/* 11AEC 80010EEC 8FA50064 */  lw         $a1, 0x64($sp)
/* 11AF0 80010EF0 24070001 */  addiu      $a3, $zero, 1
/* 11AF4 80010EF4 0C005E95 */  jal        renderPlayers
/* 11AF8 80010EF8 AFA00010 */   sw        $zero, 0x10($sp)
/* 11AFC 80010EFC AFA20064 */  sw         $v0, 0x64($sp)
/* 11B00 80010F00 02002021 */  addu       $a0, $s0, $zero
.L80010F04:
/* 11B04 80010F04 3C05800E */  lui        $a1, %hi(D_800D87B8)
/* 11B08 80010F08 0C0333AC */  jal        sprintf
/* 11B0C 80010F0C 24A587B8 */   addiu     $a1, $a1, %lo(D_800D87B8)
/* 11B10 80010F10 02C03021 */  addu       $a2, $s6, $zero
/* 11B14 80010F14 02E03821 */  addu       $a3, $s7, $zero
/* 11B18 80010F18 8E64008C */  lw         $a0, 0x8c($s3)
/* 11B1C 80010F1C 8FA500B4 */  lw         $a1, 0xb4($sp)
/* 11B20 80010F20 0C02B768 */  jal        getZonePositionShorts
/* 11B24 80010F24 24840008 */   addiu     $a0, $a0, 8
/* 11B28 80010F28 8FA600B4 */  lw         $a2, 0xb4($sp)
/* 11B2C 80010F2C 8FA40064 */  lw         $a0, 0x64($sp)
/* 11B30 80010F30 AFA00014 */  sw         $zero, 0x14($sp)
/* 11B34 80010F34 AFA00018 */  sw         $zero, 0x18($sp)
/* 11B38 80010F38 8E65008C */  lw         $a1, 0x8c($s3)
/* 11B3C 80010F3C 87A70060 */  lh         $a3, 0x60($sp)
/* 11B40 80010F40 87A20062 */  lh         $v0, 0x62($sp)
/* 11B44 80010F44 24A50008 */  addiu      $a1, $a1, 8
/* 11B48 80010F48 0C003E69 */  jal        RenderVoxelScenes
/* 11B4C 80010F4C AFA20010 */   sw        $v0, 0x10($sp)
/* 11B50 80010F50 02002021 */  addu       $a0, $s0, $zero
/* 11B54 80010F54 3C05800E */  lui        $a1, %hi(D_800D87D8)
/* 11B58 80010F58 24A587D8 */  addiu      $a1, $a1, %lo(D_800D87D8)
/* 11B5C 80010F5C 0C0333AC */  jal        sprintf
/* 11B60 80010F60 AFA20064 */   sw        $v0, 0x64($sp)
/* 11B64 80010F64 03C02021 */  addu       $a0, $fp, $zero
/* 11B68 80010F68 02A03021 */  addu       $a2, $s5, $zero
/* 11B6C 80010F6C 24070001 */  addiu      $a3, $zero, 1
/* 11B70 80010F70 8FA50064 */  lw         $a1, 0x64($sp)
/* 11B74 80010F74 24020001 */  addiu      $v0, $zero, 1
/* 11B78 80010F78 0C005E95 */  jal        renderPlayers
/* 11B7C 80010F7C AFA20010 */   sw        $v0, 0x10($sp)
/* 11B80 80010F80 02002021 */  addu       $a0, $s0, $zero
/* 11B84 80010F84 3C05800E */  lui        $a1, %hi(D_800D87F0)
/* 11B88 80010F88 24A587F0 */  addiu      $a1, $a1, %lo(D_800D87F0)
/* 11B8C 80010F8C 0C0333AC */  jal        sprintf
/* 11B90 80010F90 AFA20064 */   sw        $v0, 0x64($sp)
/* 11B94 80010F94 8FA30064 */  lw         $v1, 0x64($sp)
/* 11B98 80010F98 8FA800B0 */  lw         $t0, 0xb0($sp)
/* 11B9C 80010F9C 8FBF00AC */  lw         $ra, 0xac($sp)
/* 11BA0 80010FA0 8FBE00A8 */  lw         $fp, 0xa8($sp)
/* 11BA4 80010FA4 8FB700A4 */  lw         $s7, 0xa4($sp)
/* 11BA8 80010FA8 8FB600A0 */  lw         $s6, 0xa0($sp)
/* 11BAC 80010FAC 8FB5009C */  lw         $s5, 0x9c($sp)
/* 11BB0 80010FB0 8FB40098 */  lw         $s4, 0x98($sp)
/* 11BB4 80010FB4 8FB30094 */  lw         $s3, 0x94($sp)
/* 11BB8 80010FB8 8FB20090 */  lw         $s2, 0x90($sp)
/* 11BBC 80010FBC 8FB1008C */  lw         $s1, 0x8c($sp)
/* 11BC0 80010FC0 8FB00088 */  lw         $s0, 0x88($sp)
/* 11BC4 80010FC4 AD030000 */  sw         $v1, ($t0)
/* 11BC8 80010FC8 03E00008 */  jr         $ra
/* 11BCC 80010FCC 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel RenderTransZones__
/* 11BD0 80010FD0 3C02800F */  lui        $v0, %hi(voxel_counter)
/* 11BD4 80010FD4 94438DB4 */  lhu        $v1, %lo(voxel_counter)($v0)
/* 11BD8 80010FD8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 11BDC 80010FDC AFB00010 */  sw         $s0, 0x10($sp)
/* 11BE0 80010FE0 00008021 */  addu       $s0, $zero, $zero
/* 11BE4 80010FE4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 11BE8 80010FE8 00809821 */  addu       $s3, $a0, $zero
/* 11BEC 80010FEC AFB10014 */  sw         $s1, 0x14($sp)
/* 11BF0 80010FF0 00408821 */  addu       $s1, $v0, $zero
/* 11BF4 80010FF4 AFBF0020 */  sw         $ra, 0x20($sp)
/* 11BF8 80010FF8 AFB20018 */  sw         $s2, 0x18($sp)
/* 11BFC 80010FFC 10600016 */  beqz       $v1, .L80011058
/* 11C00 80011000 8E640000 */   lw        $a0, ($s3)
/* 11C04 80011004 3C02800F */  lui        $v0, %hi(D_800F5290)
/* 11C08 80011008 24525290 */  addiu      $s2, $v0, %lo(D_800F5290)
/* 11C0C 8001100C 001018C0 */  sll        $v1, $s0, 3
.L80011010:
/* 11C10 80011010 00721821 */  addu       $v1, $v1, $s2
/* 11C14 80011014 94620004 */  lhu        $v0, 4($v1)
/* 11C18 80011018 30420002 */  andi       $v0, $v0, 2
/* 11C1C 8001101C 10400005 */  beqz       $v0, .L80011034
/* 11C20 80011020 00000000 */   nop
/* 11C24 80011024 0C028191 */  jal        func_800A0644
/* 11C28 80011028 8C650000 */   lw        $a1, ($v1)
/* 11C2C 8001102C 08004410 */  j          .L80011040
/* 11C30 80011030 00402021 */   addu      $a0, $v0, $zero
.L80011034:
/* 11C34 80011034 0C028369 */  jal        func_800A0DA4
/* 11C38 80011038 8C650000 */   lw        $a1, ($v1)
/* 11C3C 8001103C 00402021 */  addu       $a0, $v0, $zero
.L80011040:
/* 11C40 80011040 26030001 */  addiu      $v1, $s0, 1
/* 11C44 80011044 96228DB4 */  lhu        $v0, -0x724c($s1)
/* 11C48 80011048 3070FFFF */  andi       $s0, $v1, 0xffff
/* 11C4C 8001104C 0202102B */  sltu       $v0, $s0, $v0
/* 11C50 80011050 1440FFEF */  bnez       $v0, .L80011010
/* 11C54 80011054 001018C0 */   sll       $v1, $s0, 3
.L80011058:
/* 11C58 80011058 8FBF0020 */  lw         $ra, 0x20($sp)
/* 11C5C 8001105C AE640000 */  sw         $a0, ($s3)
/* 11C60 80011060 8FB3001C */  lw         $s3, 0x1c($sp)
/* 11C64 80011064 8FB20018 */  lw         $s2, 0x18($sp)
/* 11C68 80011068 A6208DB4 */  sh         $zero, -0x724c($s1)
/* 11C6C 8001106C 8FB10014 */  lw         $s1, 0x14($sp)
/* 11C70 80011070 8FB00010 */  lw         $s0, 0x10($sp)
/* 11C74 80011074 03E00008 */  jr         $ra
/* 11C78 80011078 27BD0028 */   addiu     $sp, $sp, 0x28

glabel renderTransZones_
/* 11C7C 8001107C 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 11C80 80011080 27A50010 */  addiu      $a1, $sp, 0x10
/* 11C84 80011084 3C02800E */  lui        $v0, %hi(D_800D8894)
/* 11C88 80011088 24468894 */  addiu      $a2, $v0, %lo(D_800D8894)
/* 11C8C 8001108C AFBE0070 */  sw         $fp, 0x70($sp)
/* 11C90 80011090 0080F021 */  addu       $fp, $a0, $zero
/* 11C94 80011094 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 11C98 80011098 AFB60068 */  sw         $s6, 0x68($sp)
/* 11C9C 8001109C 24566988 */  addiu      $s6, $v0, %lo(zoneDatMatrix)
/* 11CA0 800110A0 30C30003 */  andi       $v1, $a2, 3
/* 11CA4 800110A4 00A02021 */  addu       $a0, $a1, $zero
/* 11CA8 800110A8 AFBF0074 */  sw         $ra, 0x74($sp)
/* 11CAC 800110AC AFB7006C */  sw         $s7, 0x6c($sp)
/* 11CB0 800110B0 AFB50064 */  sw         $s5, 0x64($sp)
/* 11CB4 800110B4 AFB40060 */  sw         $s4, 0x60($sp)
/* 11CB8 800110B8 AFB3005C */  sw         $s3, 0x5c($sp)
/* 11CBC 800110BC AFB20058 */  sw         $s2, 0x58($sp)
/* 11CC0 800110C0 AFB10054 */  sw         $s1, 0x54($sp)
/* 11CC4 800110C4 10600018 */  beqz       $v1, .L80011128
/* 11CC8 800110C8 AFB00050 */   sw        $s0, 0x50($sp)
/* 11CCC 800110CC 24C30020 */  addiu      $v1, $a2, 0x20
/* 11CD0 800110D0 27A20012 */  addiu      $v0, $sp, 0x12
.L800110D4:
/* 11CD4 800110D4 88C70000 */  lwl        $a3, ($a2)
/* 11CD8 800110D8 98C70003 */  lwr        $a3, 3($a2)
/* 11CDC 800110DC 88C80004 */  lwl        $t0, 4($a2)
/* 11CE0 800110E0 98C80007 */  lwr        $t0, 7($a2)
/* 11CE4 800110E4 88C90008 */  lwl        $t1, 8($a2)
/* 11CE8 800110E8 98C9000B */  lwr        $t1, 0xb($a2)
/* 11CEC 800110EC 88CA000C */  lwl        $t2, 0xc($a2)
/* 11CF0 800110F0 98CA000F */  lwr        $t2, 0xf($a2)
/* 11CF4 800110F4 A8A70000 */  swl        $a3, ($a1)
/* 11CF8 800110F8 B8A70003 */  swr        $a3, 3($a1)
/* 11CFC 800110FC A8A80004 */  swl        $t0, 4($a1)
/* 11D00 80011100 B8A80007 */  swr        $t0, 7($a1)
/* 11D04 80011104 A8A90008 */  swl        $t1, 8($a1)
/* 11D08 80011108 B8A9000B */  swr        $t1, 0xb($a1)
/* 11D0C 8001110C A8AA000C */  swl        $t2, 0xc($a1)
/* 11D10 80011110 B8AA000F */  swr        $t2, 0xf($a1)
/* 11D14 80011114 24C60010 */  addiu      $a2, $a2, 0x10
/* 11D18 80011118 14C3FFEE */  bne        $a2, $v1, .L800110D4
/* 11D1C 8001111C 24A50010 */   addiu     $a1, $a1, 0x10
/* 11D20 80011120 08004458 */  j          .L80011160
/* 11D24 80011124 24140001 */   addiu     $s4, $zero, 1
.L80011128:
/* 11D28 80011128 24C30020 */  addiu      $v1, $a2, 0x20
/* 11D2C 8001112C 27A20012 */  addiu      $v0, $sp, 0x12
.L80011130:
/* 11D30 80011130 8CC70000 */  lw         $a3, ($a2)
/* 11D34 80011134 8CC80004 */  lw         $t0, 4($a2)
/* 11D38 80011138 8CC90008 */  lw         $t1, 8($a2)
/* 11D3C 8001113C 8CCA000C */  lw         $t2, 0xc($a2)
/* 11D40 80011140 ACA70000 */  sw         $a3, ($a1)
/* 11D44 80011144 ACA80004 */  sw         $t0, 4($a1)
/* 11D48 80011148 ACA90008 */  sw         $t1, 8($a1)
/* 11D4C 8001114C ACAA000C */  sw         $t2, 0xc($a1)
/* 11D50 80011150 24C60010 */  addiu      $a2, $a2, 0x10
/* 11D54 80011154 14C3FFF6 */  bne        $a2, $v1, .L80011130
/* 11D58 80011158 24A50010 */   addiu     $a1, $a1, 0x10
/* 11D5C 8001115C 24140001 */  addiu      $s4, $zero, 1
.L80011160:
/* 11D60 80011160 3C130001 */  lui        $s3, 1
/* 11D64 80011164 00408821 */  addu       $s1, $v0, $zero
/* 11D68 80011168 00808021 */  addu       $s0, $a0, $zero
/* 11D6C 8001116C 8FD20000 */  lw         $s2, ($fp)
/* 11D70 80011170 8EC20120 */  lw         $v0, 0x120($s6)
/* 11D74 80011174 3C170001 */  lui        $s7, 1
/* 11D78 80011178 88C30000 */  lwl        $v1, ($a2)
/* 11D7C 8001117C 98C30003 */  lwr        $v1, 3($a2)
/* 11D80 80011180 A8A30000 */  swl        $v1, ($a1)
/* 11D84 80011184 B8A30003 */  swr        $v1, 3($a1)
/* 11D88 80011188 9055001B */  lbu        $s5, 0x1b($v0)
.L8001118C:
/* 11D8C 8001118C 86040000 */  lh         $a0, ($s0)
/* 11D90 80011190 0C004166 */  jal        func_80010598
/* 11D94 80011194 86250000 */   lh        $a1, ($s1)
/* 11D98 80011198 10400003 */  beqz       $v0, .L800111A8
/* 11D9C 8001119C 02B41024 */   and       $v0, $s5, $s4
/* 11DA0 800111A0 10400010 */  beqz       $v0, .L800111E4
/* 11DA4 800111A4 00141040 */   sll       $v0, $s4, 1
.L800111A8:
/* 11DA8 800111A8 86030000 */  lh         $v1, ($s0)
/* 11DAC 800111AC 00031040 */  sll        $v0, $v1, 1
/* 11DB0 800111B0 00431021 */  addu       $v0, $v0, $v1
/* 11DB4 800111B4 00021140 */  sll        $v0, $v0, 5
/* 11DB8 800111B8 86230000 */  lh         $v1, ($s1)
/* 11DBC 800111BC 02C21021 */  addu       $v0, $s6, $v0
/* 11DC0 800111C0 00031940 */  sll        $v1, $v1, 5
/* 11DC4 800111C4 00432821 */  addu       $a1, $v0, $v1
/* 11DC8 800111C8 8CA40014 */  lw         $a0, 0x14($a1)
/* 11DCC 800111CC 10800005 */  beqz       $a0, .L800111E4
/* 11DD0 800111D0 00141040 */   sll       $v0, $s4, 1
/* 11DD4 800111D4 0C0040EC */  jal        func_800103B0
/* 11DD8 800111D8 02402021 */   addu      $a0, $s2, $zero
/* 11DDC 800111DC 00409021 */  addu       $s2, $v0, $zero
/* 11DE0 800111E0 00141040 */  sll        $v0, $s4, 1
.L800111E4:
/* 11DE4 800111E4 305400FE */  andi       $s4, $v0, 0xfe
/* 11DE8 800111E8 02601821 */  addu       $v1, $s3, $zero
/* 11DEC 800111EC 02779821 */  addu       $s3, $s3, $s7
/* 11DF0 800111F0 26310004 */  addiu      $s1, $s1, 4
/* 11DF4 800111F4 00031C03 */  sra        $v1, $v1, 0x10
/* 11DF8 800111F8 28630009 */  slti       $v1, $v1, 9
/* 11DFC 800111FC 1460FFE3 */  bnez       $v1, .L8001118C
/* 11E00 80011200 26100004 */   addiu     $s0, $s0, 4
/* 11E04 80011204 8FBF0074 */  lw         $ra, 0x74($sp)
/* 11E08 80011208 AFD20000 */  sw         $s2, ($fp)
/* 11E0C 8001120C 8FBE0070 */  lw         $fp, 0x70($sp)
/* 11E10 80011210 8FB7006C */  lw         $s7, 0x6c($sp)
/* 11E14 80011214 8FB60068 */  lw         $s6, 0x68($sp)
/* 11E18 80011218 8FB50064 */  lw         $s5, 0x64($sp)
/* 11E1C 8001121C 8FB40060 */  lw         $s4, 0x60($sp)
/* 11E20 80011220 8FB3005C */  lw         $s3, 0x5c($sp)
/* 11E24 80011224 8FB20058 */  lw         $s2, 0x58($sp)
/* 11E28 80011228 8FB10054 */  lw         $s1, 0x54($sp)
/* 11E2C 8001122C 8FB00050 */  lw         $s0, 0x50($sp)
/* 11E30 80011230 03E00008 */  jr         $ra
/* 11E34 80011234 27BD0078 */   addiu     $sp, $sp, 0x78

glabel mapFloatDat_copy
/* 11E38 80011238 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 11E3C 8001123C AFB20018 */  sw         $s2, 0x18($sp)
/* 11E40 80011240 00809021 */  addu       $s2, $a0, $zero
/* 11E44 80011244 AFB00010 */  sw         $s0, 0x10($sp)
/* 11E48 80011248 00008021 */  addu       $s0, $zero, $zero
/* 11E4C 8001124C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 11E50 80011250 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 11E54 80011254 AFB10014 */  sw         $s1, 0x14($sp)
/* 11E58 80011258 24511058 */  addiu      $s1, $v0, 0x1058
/* 11E5C 8001125C AFBF001C */  sw         $ra, 0x1c($sp)
/* 11E60 80011260 A44012EE */  sh         $zero, 0x12ee($v0)
/* 11E64 80011264 A44012EC */  sh         $zero, 0x12ec($v0)
/* 11E68 80011268 A44012F0 */  sh         $zero, 0x12f0($v0)
/* 11E6C 8001126C 00102040 */  sll        $a0, $s0, 1
.L80011270:
/* 11E70 80011270 00902021 */  addu       $a0, $a0, $s0
/* 11E74 80011274 00042080 */  sll        $a0, $a0, 2
/* 11E78 80011278 00902023 */  subu       $a0, $a0, $s0
/* 11E7C 8001127C 00042080 */  sll        $a0, $a0, 2
/* 11E80 80011280 00912021 */  addu       $a0, $a0, $s1
/* 11E84 80011284 02402821 */  addu       $a1, $s2, $zero
/* 11E88 80011288 0C033547 */  jal        memcpy
/* 11E8C 8001128C 2406002C */   addiu     $a2, $zero, 0x2c
/* 11E90 80011290 26030001 */  addiu      $v1, $s0, 1
/* 11E94 80011294 3070FFFF */  andi       $s0, $v1, 0xffff
/* 11E98 80011298 2E02000F */  sltiu      $v0, $s0, 0xf
/* 11E9C 8001129C 1440FFF4 */  bnez       $v0, .L80011270
/* 11EA0 800112A0 00102040 */   sll       $a0, $s0, 1
/* 11EA4 800112A4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 11EA8 800112A8 8FB20018 */  lw         $s2, 0x18($sp)
/* 11EAC 800112AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 11EB0 800112B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 11EB4 800112B4 03E00008 */  jr         $ra
/* 11EB8 800112B8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel InitZoneEngine
/* 11EBC 800112BC 27BDFF00 */  addiu      $sp, $sp, -0x100
/* 11EC0 800112C0 00042400 */  sll        $a0, $a0, 0x10
/* 11EC4 800112C4 AFB400E8 */  sw         $s4, 0xe8($sp)
/* 11EC8 800112C8 0004A403 */  sra        $s4, $a0, 0x10
/* 11ECC 800112CC 00052C00 */  sll        $a1, $a1, 0x10
/* 11ED0 800112D0 AFB700F4 */  sw         $s7, 0xf4($sp)
/* 11ED4 800112D4 0005BC03 */  sra        $s7, $a1, 0x10
/* 11ED8 800112D8 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 11EDC 800112DC AFB200E0 */  sw         $s2, 0xe0($sp)
/* 11EE0 800112E0 24526988 */  addiu      $s2, $v0, %lo(zoneDatMatrix)
/* 11EE4 800112E4 27A30018 */  addiu      $v1, $sp, 0x18
/* 11EE8 800112E8 3C02800E */  lui        $v0, %hi(D_800D88B8)
/* 11EEC 800112EC 244288B8 */  addiu      $v0, $v0, %lo(D_800D88B8)
/* 11EF0 800112F0 24440040 */  addiu      $a0, $v0, 0x40
/* 11EF4 800112F4 AFBE00F8 */  sw         $fp, 0xf8($sp)
/* 11EF8 800112F8 3C1E800E */  lui        $fp, 0x800e
/* 11EFC 800112FC AFBF00FC */  sw         $ra, 0xfc($sp)
/* 11F00 80011300 AFB600F0 */  sw         $s6, 0xf0($sp)
/* 11F04 80011304 AFB500EC */  sw         $s5, 0xec($sp)
/* 11F08 80011308 AFB300E4 */  sw         $s3, 0xe4($sp)
/* 11F0C 8001130C AFB100DC */  sw         $s1, 0xdc($sp)
/* 11F10 80011310 AFB000D8 */  sw         $s0, 0xd8($sp)
.L80011314:
/* 11F14 80011314 8C450000 */  lw         $a1, ($v0)
/* 11F18 80011318 8C460004 */  lw         $a2, 4($v0)
/* 11F1C 8001131C 8C470008 */  lw         $a3, 8($v0)
/* 11F20 80011320 8C48000C */  lw         $t0, 0xc($v0)
/* 11F24 80011324 AC650000 */  sw         $a1, ($v1)
/* 11F28 80011328 AC660004 */  sw         $a2, 4($v1)
/* 11F2C 8001132C AC670008 */  sw         $a3, 8($v1)
/* 11F30 80011330 AC68000C */  sw         $t0, 0xc($v1)
/* 11F34 80011334 24420010 */  addiu      $v0, $v0, 0x10
/* 11F38 80011338 1444FFF6 */  bne        $v0, $a0, .L80011314
/* 11F3C 8001133C 24630010 */   addiu     $v1, $v1, 0x10
/* 11F40 80011340 00009821 */  addu       $s3, $zero, $zero
/* 11F44 80011344 0000B021 */  addu       $s6, $zero, $zero
/* 11F48 80011348 24150180 */  addiu      $s5, $zero, 0x180
/* 11F4C 8001134C 8C440000 */  lw         $a0, ($v0)
/* 11F50 80011350 AC640000 */  sw         $a0, ($v1)
/* 11F54 80011354 3C02800F */  lui        $v0, %hi(D_800E9C14)
/* 11F58 80011358 27D068A8 */  addiu      $s0, $fp, 0x68a8
/* 11F5C 8001135C 24110001 */  addiu      $s1, $zero, 1
/* 11F60 80011360 A4409C14 */  sh         $zero, %lo(D_800E9C14)($v0)
/* 11F64 80011364 3C02800F */  lui        $v0, %hi(engineZone_flag)
/* 11F68 80011368 8E040008 */  lw         $a0, 8($s0)
/* 11F6C 8001136C 96050210 */  lhu        $a1, 0x210($s0)
/* 11F70 80011370 3C03800F */  lui        $v1, %hi(initZoneTimestamp)
/* 11F74 80011374 A4518DAC */  sh         $s1, %lo(engineZone_flag)($v0)
/* 11F78 80011378 10A00006 */  beqz       $a1, .L80011394
/* 11F7C 8001137C AC648DB8 */   sw        $a0, %lo(initZoneTimestamp)($v1)
/* 11F80 80011380 3C04800E */  lui        $a0, %hi(D_800D88FC)
/* 11F84 80011384 248488FC */  addiu      $a0, $a0, %lo(D_800D88FC)
/* 11F88 80011388 3C05800E */  lui        $a1, %hi(D_800D890C)
/* 11F8C 8001138C 0C025F2D */  jal        manualCrash
/* 11F90 80011390 24A5890C */   addiu     $a1, $a1, %lo(D_800D890C)
.L80011394:
/* 11F94 80011394 A6110210 */  sh         $s1, 0x210($s0)
/* 11F98 80011398 0C0033B7 */  jal        zoneengine_func_b
/* 11F9C 8001139C A614101E */   sh        $s4, 0x101e($s0)
/* 11FA0 800113A0 3C048001 */  lui        $a0, %hi(check_trigger)
/* 11FA4 800113A4 0C02BCF0 */  jal        set_checktrigger_pointer
/* 11FA8 800113A8 2484D560 */   addiu     $a0, $a0, %lo(check_trigger)
/* 11FAC 800113AC 26040394 */  addiu      $a0, $s0, 0x394
/* 11FB0 800113B0 AE000FDC */  sw         $zero, 0xfdc($s0)
/* 11FB4 800113B4 0C0089F0 */  jal        calloc_weatherStruct
/* 11FB8 800113B8 AE000FE0 */   sw        $zero, 0xfe0($s0)
/* 11FBC 800113BC 0C0069AD */  jal        InitScriptCameras
/* 11FC0 800113C0 26041608 */   addiu     $a0, $s0, 0x1608
/* 11FC4 800113C4 9604101E */  lhu        $a0, 0x101e($s0)
/* 11FC8 800113C8 24020001 */  addiu      $v0, $zero, 1
/* 11FCC 800113CC 1082000B */  beq        $a0, $v0, .L800113FC
/* 11FD0 800113D0 28820002 */   slti      $v0, $a0, 2
/* 11FD4 800113D4 10400005 */  beqz       $v0, .L800113EC
/* 11FD8 800113D8 24020002 */   addiu     $v0, $zero, 2
/* 11FDC 800113DC 1080000D */  beqz       $a0, .L80011414
/* 11FE0 800113E0 3C02800E */   lui       $v0, 0x800e
/* 11FE4 800113E4 08004512 */  j          .L80011448
/* 11FE8 800113E8 00000000 */   nop
.L800113EC:
/* 11FEC 800113EC 1082000F */  beq        $a0, $v0, .L8001142C
/* 11FF0 800113F0 3C02800E */   lui       $v0, 0x800e
/* 11FF4 800113F4 08004512 */  j          .L80011448
/* 11FF8 800113F8 00000000 */   nop
.L800113FC:
/* 11FFC 800113FC 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 12000 80011400 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 12004 80011404 1460000F */  bnez       $v1, .L80011444
/* 12008 80011408 2413000E */   addiu     $s3, $zero, 0xe
/* 1200C 8001140C 08004511 */  j          .L80011444
/* 12010 80011410 24150060 */   addiu     $s5, $zero, 0x60
.L80011414:
/* 12014 80011414 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 12018 80011418 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 1201C 8001141C 14600009 */  bnez       $v1, .L80011444
/* 12020 80011420 24130028 */   addiu     $s3, $zero, 0x28
/* 12024 80011424 08004511 */  j          .L80011444
/* 12028 80011428 24150040 */   addiu     $s5, $zero, 0x40
.L8001142C:
/* 1202C 8001142C 00009821 */  addu       $s3, $zero, $zero
/* 12030 80011430 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 12034 80011434 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 12038 80011438 14600002 */  bnez       $v1, .L80011444
/* 1203C 8001143C 24160003 */   addiu     $s6, $zero, 3
/* 12040 80011440 24150010 */  addiu      $s5, $zero, 0x10
.L80011444:
/* 12044 80011444 3C02800E */  lui        $v0, %hi(mapFloatDatEntry)
.L80011448:
/* 12048 80011448 12E0002C */  beqz       $s7, .L800114FC
/* 1204C 8001144C 2450788C */   addiu     $s0, $v0, %lo(mapFloatDatEntry)
/* 12050 80011450 9602030A */  lhu        $v0, 0x30a($s0)
/* 12054 80011454 10400010 */  beqz       $v0, .L80011498
/* 12058 80011458 02008821 */   addu      $s1, $s0, $zero
/* 1205C 8001145C 86250020 */  lh         $a1, 0x20($s1)
/* 12060 80011460 AFA00010 */  sw         $zero, 0x10($sp)
/* 12064 80011464 86260022 */  lh         $a2, 0x22($s1)
/* 12068 80011468 86270024 */  lh         $a3, 0x24($s1)
/* 1206C 8001146C 0C0032BA */  jal        func_8000CAE8
/* 12070 80011470 02202021 */   addu      $a0, $s1, $zero
/* 12074 80011474 00408021 */  addu       $s0, $v0, $zero
/* 12078 80011478 12000006 */  beqz       $s0, .L80011494
/* 1207C 8001147C 26440F04 */   addiu     $a0, $s2, 0xf04
/* 12080 80011480 02002821 */  addu       $a1, $s0, $zero
/* 12084 80011484 0C033547 */  jal        memcpy
/* 12088 80011488 2406002C */   addiu     $a2, $zero, 0x2c
/* 1208C 8001148C 08004527 */  j          .L8001149C
/* 12090 80011490 96040024 */   lhu       $a0, 0x24($s0)
.L80011494:
/* 12094 80011494 02208021 */  addu       $s0, $s1, $zero
.L80011498:
/* 12098 80011498 96040024 */  lhu        $a0, 0x24($s0)
.L8001149C:
/* 1209C 8001149C 00003821 */  addu       $a3, $zero, $zero
/* 120A0 800114A0 A64402AC */  sh         $a0, 0x2ac($s2)
/* 120A4 800114A4 00042400 */  sll        $a0, $a0, 0x10
/* 120A8 800114A8 96050026 */  lhu        $a1, 0x26($s0)
/* 120AC 800114AC 00042403 */  sra        $a0, $a0, 0x10
/* 120B0 800114B0 A64502AE */  sh         $a1, 0x2ae($s2)
/* 120B4 800114B4 00052C00 */  sll        $a1, $a1, 0x10
/* 120B8 800114B8 96060028 */  lhu        $a2, 0x28($s0)
/* 120BC 800114BC 00052C03 */  sra        $a1, $a1, 0x10
/* 120C0 800114C0 A64602B0 */  sh         $a2, 0x2b0($s2)
/* 120C4 800114C4 96020020 */  lhu        $v0, 0x20($s0)
/* 120C8 800114C8 00063400 */  sll        $a2, $a2, 0x10
/* 120CC 800114CC A6420292 */  sh         $v0, 0x292($s2)
/* 120D0 800114D0 96020022 */  lhu        $v0, 0x22($s0)
/* 120D4 800114D4 00063403 */  sra        $a2, $a2, 0x10
/* 120D8 800114D8 0C00B297 */  jal        borgmaps_func
/* 120DC 800114DC A6420294 */   sh        $v0, 0x294($s2)
/* 120E0 800114E0 0C00461F */  jal        clear_music_no_expPak
/* 120E4 800114E4 26510134 */   addiu     $s1, $s2, 0x134
/* 120E8 800114E8 C6000000 */  lwc1       $f0, ($s0)
/* 120EC 800114EC E64002A4 */  swc1       $f0, 0x2a4($s2)
/* 120F0 800114F0 C6020008 */  lwc1       $f2, 8($s0)
/* 120F4 800114F4 08004546 */  j          .L80011518
/* 120F8 800114F8 E64202A8 */   swc1      $f2, 0x2a8($s2)
.L800114FC:
/* 120FC 800114FC 864402AC */  lh         $a0, 0x2ac($s2)
/* 12100 80011500 864502AE */  lh         $a1, 0x2ae($s2)
/* 12104 80011504 864602B0 */  lh         $a2, 0x2b0($s2)
/* 12108 80011508 0C00B297 */  jal        borgmaps_func
/* 1210C 8001150C 00003821 */   addu      $a3, $zero, $zero
/* 12110 80011510 0C00461F */  jal        clear_music_no_expPak
/* 12114 80011514 26510134 */   addiu     $s1, $s2, 0x134
.L80011518:
/* 12118 80011518 02202021 */  addu       $a0, $s1, $zero
/* 1211C 8001151C 02602821 */  addu       $a1, $s3, $zero
/* 12120 80011520 0C00562E */  jal        InitPlayerHandler
/* 12124 80011524 24060003 */   addiu     $a2, $zero, 3
/* 12128 80011528 26440350 */  addiu      $a0, $s2, 0x350
/* 1212C 8001152C 02A03021 */  addu       $a2, $s5, $zero
/* 12130 80011530 27D368A8 */  addiu      $s3, $fp, 0x68a8
/* 12134 80011534 24070011 */  addiu      $a3, $zero, 0x11
/* 12138 80011538 8E650200 */  lw         $a1, 0x200($s3)
/* 1213C 8001153C 27A80018 */  addiu      $t0, $sp, 0x18
/* 12140 80011540 0C02C6D3 */  jal        InitParticleHead
/* 12144 80011544 AFA80010 */   sw        $t0, 0x10($sp)
/* 12148 80011548 0C0035D1 */  jal        func_8000D744
/* 1214C 8001154C 00000000 */   nop
/* 12150 80011550 24030001 */  addiu      $v1, $zero, 1
/* 12154 80011554 86440292 */  lh         $a0, 0x292($s2)
/* 12158 80011558 86450294 */  lh         $a1, 0x294($s2)
/* 1215C 8001155C 3C02800F */  lui        $v0, %hi(no_TP_vec3)
/* 12160 80011560 0C0038A1 */  jal        loadGameBorgScenes
/* 12164 80011564 A4438DC2 */   sh        $v1, %lo(no_TP_vec3)($v0)
/* 12168 80011568 12E00012 */  beqz       $s7, .L800115B4
/* 1216C 8001156C 02202021 */   addu      $a0, $s1, $zero
/* 12170 80011570 26060014 */  addiu      $a2, $s0, 0x14
/* 12174 80011574 8E450120 */  lw         $a1, 0x120($s2)
/* 12178 80011578 0C006726 */  jal        passto_camera_init
/* 1217C 8001157C 02C03821 */   addu      $a3, $s6, $zero
/* 12180 80011580 8E6400A8 */  lw         $a0, 0xa8($s3)
/* 12184 80011584 10800025 */  beqz       $a0, .L8001161C
/* 12188 80011588 3C02800E */   lui       $v0, 0x800e
/* 1218C 8001158C 8E02000C */  lw         $v0, 0xc($s0)
/* 12190 80011590 AC820020 */  sw         $v0, 0x20($a0)
/* 12194 80011594 8E030010 */  lw         $v1, 0x10($s0)
/* 12198 80011598 AC830024 */  sw         $v1, 0x24($a0)
/* 1219C 8001159C 8E6500A8 */  lw         $a1, 0xa8($s3)
/* 121A0 800115A0 02202021 */  addu       $a0, $s1, $zero
/* 121A4 800115A4 0C02C069 */  jal        camera_set_aim
/* 121A8 800115A8 24A50068 */   addiu     $a1, $a1, 0x68
/* 121AC 800115AC 08004587 */  j          .L8001161C
/* 121B0 800115B0 3C02800E */   lui       $v0, 0x800e
.L800115B4:
/* 121B4 800115B4 27B00098 */  addiu      $s0, $sp, 0x98
/* 121B8 800115B8 02002021 */  addu       $a0, $s0, $zero
/* 121BC 800115BC 00002821 */  addu       $a1, $zero, $zero
/* 121C0 800115C0 0C026380 */  jal        Calloc
/* 121C4 800115C4 2406000C */   addiu     $a2, $zero, 0xc
/* 121C8 800115C8 02202021 */  addu       $a0, $s1, $zero
/* 121CC 800115CC 02003021 */  addu       $a2, $s0, $zero
/* 121D0 800115D0 8E450120 */  lw         $a1, 0x120($s2)
/* 121D4 800115D4 0C006726 */  jal        passto_camera_init
/* 121D8 800115D8 02C03821 */   addu      $a3, $s6, $zero
/* 121DC 800115DC 8E6500A8 */  lw         $a1, 0xa8($s3)
/* 121E0 800115E0 10A0000E */  beqz       $a1, .L8001161C
/* 121E4 800115E4 3C02800E */   lui       $v0, 0x800e
/* 121E8 800115E8 84A20002 */  lh         $v0, 2($a1)
/* 121EC 800115EC 1440000B */  bnez       $v0, .L8001161C
/* 121F0 800115F0 3C02800E */   lui       $v0, 0x800e
/* 121F4 800115F4 02202021 */  addu       $a0, $s1, $zero
/* 121F8 800115F8 0C02C069 */  jal        camera_set_aim
/* 121FC 800115FC 24A50068 */   addiu     $a1, $a1, 0x68
/* 12200 80011600 02202021 */  addu       $a0, $s1, $zero
/* 12204 80011604 0C02C143 */  jal        func_800B050C
/* 12208 80011608 02002821 */   addu      $a1, $s0, $zero
/* 1220C 8001160C 02202021 */  addu       $a0, $s1, $zero
/* 12210 80011610 0C02C058 */  jal        camera_set_position
/* 12214 80011614 02002821 */   addu      $a1, $s0, $zero
/* 12218 80011618 3C02800E */  lui        $v0, %hi(dynamic_light_struct)
.L8001161C:
/* 1221C 8001161C 24507120 */  addiu      $s0, $v0, %lo(dynamic_light_struct)
/* 12220 80011620 0C015521 */  jal        init_dynamic_light
/* 12224 80011624 02002021 */   addu      $a0, $s0, $zero
/* 12228 80011628 24020001 */  addiu      $v0, $zero, 1
/* 1222C 8001162C 1282000B */  beq        $s4, $v0, .L8001165C
/* 12230 80011630 2A820002 */   slti      $v0, $s4, 2
/* 12234 80011634 10400005 */  beqz       $v0, .L8001164C
/* 12238 80011638 24020002 */   addiu     $v0, $zero, 2
/* 1223C 8001163C 1280000D */  beqz       $s4, .L80011674
/* 12240 80011640 3C04800E */   lui       $a0, %hi(D_800D892C)
/* 12244 80011644 080045A9 */  j          .L800116A4
/* 12248 80011648 2484892C */   addiu     $a0, $a0, %lo(D_800D892C)
.L8001164C:
/* 1224C 8001164C 12820011 */  beq        $s4, $v0, .L80011694
/* 12250 80011650 3C04800E */   lui       $a0, %hi(D_800D892C)
/* 12254 80011654 080045A9 */  j          .L800116A4
/* 12258 80011658 2484892C */   addiu     $a0, $a0, %lo(D_800D892C)
.L8001165C:
/* 1225C 8001165C 3C01800E */  lui        $at, %hi(D_800D8950)
/* 12260 80011660 C4208950 */  lwc1       $f0, %lo(D_800D8950)($at)
/* 12264 80011664 2602F788 */  addiu      $v0, $s0, -0x878
/* 12268 80011668 E4400420 */  swc1       $f0, 0x420($v0)
/* 1226C 8001166C 080045AC */  j          .L800116B0
/* 12270 80011670 E440041C */   swc1      $f0, 0x41c($v0)
.L80011674:
/* 12274 80011674 3C01800E */  lui        $at, %hi(D_800D8954)
/* 12278 80011678 C4208954 */  lwc1       $f0, %lo(D_800D8954)($at)
/* 1227C 8001167C 3C01800E */  lui        $at, %hi(D_800D8958)
/* 12280 80011680 C4228958 */  lwc1       $f2, %lo(D_800D8958)($at)
/* 12284 80011684 2602F788 */  addiu      $v0, $s0, -0x878
/* 12288 80011688 E4400420 */  swc1       $f0, 0x420($v0)
/* 1228C 8001168C 080045AC */  j          .L800116B0
/* 12290 80011690 E442041C */   swc1      $f2, 0x41c($v0)
.L80011694:
/* 12294 80011694 2602F788 */  addiu      $v0, $s0, -0x878
/* 12298 80011698 AC400420 */  sw         $zero, 0x420($v0)
/* 1229C 8001169C 080045AC */  j          .L800116B0
/* 122A0 800116A0 AC40041C */   sw        $zero, 0x41c($v0)
.L800116A4:
/* 122A4 800116A4 3C05800E */  lui        $a1, %hi(D_800D893C)
/* 122A8 800116A8 0C025F2D */  jal        manualCrash
/* 122AC 800116AC 24A5893C */   addiu     $a1, $a1, %lo(D_800D893C)
.L800116B0:
/* 122B0 800116B0 27C468A8 */  addiu      $a0, $fp, 0x68a8
/* 122B4 800116B4 8C82150C */  lw         $v0, 0x150c($a0)
/* 122B8 800116B8 1040000F */  beqz       $v0, .L800116F8
/* 122BC 800116BC 8FBF00FC */   lw        $ra, 0xfc($sp)
/* 122C0 800116C0 8C8200A8 */  lw         $v0, 0xa8($a0)
/* 122C4 800116C4 50400008 */  beql       $v0, $zero, .L800116E8
/* 122C8 800116C8 86450292 */   lh        $a1, 0x292($s2)
/* 122CC 800116CC C4400068 */  lwc1       $f0, 0x68($v0)
/* 122D0 800116D0 E4801518 */  swc1       $f0, 0x1518($a0)
/* 122D4 800116D4 C442006C */  lwc1       $f2, 0x6c($v0)
/* 122D8 800116D8 E482151C */  swc1       $f2, 0x151c($a0)
/* 122DC 800116DC C4400070 */  lwc1       $f0, 0x70($v0)
/* 122E0 800116E0 E4801520 */  swc1       $f0, 0x1520($a0)
/* 122E4 800116E4 86450292 */  lh         $a1, 0x292($s2)
.L800116E8:
/* 122E8 800116E8 86460294 */  lh         $a2, 0x294($s2)
/* 122EC 800116EC 0C014A57 */  jal        func_8005295C
/* 122F0 800116F0 2484150C */   addiu     $a0, $a0, 0x150c
/* 122F4 800116F4 8FBF00FC */  lw         $ra, 0xfc($sp)
.L800116F8:
/* 122F8 800116F8 8FBE00F8 */  lw         $fp, 0xf8($sp)
/* 122FC 800116FC 8FB700F4 */  lw         $s7, 0xf4($sp)
/* 12300 80011700 8FB600F0 */  lw         $s6, 0xf0($sp)
/* 12304 80011704 8FB500EC */  lw         $s5, 0xec($sp)
/* 12308 80011708 8FB400E8 */  lw         $s4, 0xe8($sp)
/* 1230C 8001170C 8FB300E4 */  lw         $s3, 0xe4($sp)
/* 12310 80011710 8FB200E0 */  lw         $s2, 0xe0($sp)
/* 12314 80011714 8FB100DC */  lw         $s1, 0xdc($sp)
/* 12318 80011718 8FB000D8 */  lw         $s0, 0xd8($sp)
/* 1231C 8001171C 03E00008 */  jr         $ra
/* 12320 80011720 27BD0100 */   addiu     $sp, $sp, 0x100

glabel SaveEngineZone
/* 12324 80011724 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 12328 80011728 00803021 */  addu       $a2, $a0, $zero
/* 1232C 8001172C AFB00010 */  sw         $s0, 0x10($sp)
/* 12330 80011730 00A08021 */  addu       $s0, $a1, $zero
/* 12334 80011734 3C02800E */  lui        $v0, 0x800e
/* 12338 80011738 3C03800F */  lui        $v1, %hi(engineZone_flag)
/* 1233C 8001173C 94648DAC */  lhu        $a0, %lo(engineZone_flag)($v1)
/* 12340 80011740 AFBF0014 */  sw         $ra, 0x14($sp)
/* 12344 80011744 F7B40018 */  sdc1       $f20, 0x18($sp)
/* 12348 80011748 14800006 */  bnez       $a0, .L80011764
/* 1234C 8001174C 24456988 */   addiu     $a1, $v0, 0x6988
/* 12350 80011750 3C04800E */  lui        $a0, %hi(D_800D895C)
/* 12354 80011754 0C00B6B8 */  jal        debug_queue
/* 12358 80011758 2484895C */   addiu     $a0, $a0, %lo(D_800D895C)
/* 1235C 8001175C 08004602 */  j          .L80011808
/* 12360 80011760 8FBF0014 */   lw        $ra, 0x14($sp)
.L80011764:
/* 12364 80011764 94A202AC */  lhu        $v0, 0x2ac($a1)
/* 12368 80011768 A6020024 */  sh         $v0, 0x24($s0)
/* 1236C 8001176C 94A302AE */  lhu        $v1, 0x2ae($a1)
/* 12370 80011770 A6030026 */  sh         $v1, 0x26($s0)
/* 12374 80011774 94A202B0 */  lhu        $v0, 0x2b0($a1)
/* 12378 80011778 A6020028 */  sh         $v0, 0x28($s0)
/* 1237C 8001177C 94A30292 */  lhu        $v1, 0x292($a1)
/* 12380 80011780 A6030020 */  sh         $v1, 0x20($s0)
/* 12384 80011784 94A20294 */  lhu        $v0, 0x294($a1)
/* 12388 80011788 10C0000C */  beqz       $a2, .L800117BC
/* 1238C 8001178C A6020022 */   sh        $v0, 0x22($s0)
/* 12390 80011790 8CC20068 */  lw         $v0, 0x68($a2)
/* 12394 80011794 AE020000 */  sw         $v0, ($s0)
/* 12398 80011798 8CC3006C */  lw         $v1, 0x6c($a2)
/* 1239C 8001179C AE030004 */  sw         $v1, 4($s0)
/* 123A0 800117A0 8CC20070 */  lw         $v0, 0x70($a2)
/* 123A4 800117A4 AE020008 */  sw         $v0, 8($s0)
/* 123A8 800117A8 8CC30020 */  lw         $v1, 0x20($a2)
/* 123AC 800117AC AE03000C */  sw         $v1, 0xc($s0)
/* 123B0 800117B0 8CC20024 */  lw         $v0, 0x24($a2)
/* 123B4 800117B4 080045F9 */  j          .L800117E4
/* 123B8 800117B8 AE020010 */   sw        $v0, 0x10($s0)
.L800117BC:
/* 123BC 800117BC 4480A000 */  mtc1       $zero, $f20
/* 123C0 800117C0 4405A000 */  mfc1       $a1, $f20
/* 123C4 800117C4 4406A000 */  mfc1       $a2, $f20
/* 123C8 800117C8 4407A000 */  mfc1       $a3, $f20
/* 123CC 800117CC 0C02AD58 */  jal        setVec3
/* 123D0 800117D0 02002021 */   addu      $a0, $s0, $zero
/* 123D4 800117D4 3C053F80 */  lui        $a1, 0x3f80
/* 123D8 800117D8 4406A000 */  mfc1       $a2, $f20
/* 123DC 800117DC 0C02AD55 */  jal        setVec2
/* 123E0 800117E0 2604000C */   addiu     $a0, $s0, 0xc
.L800117E4:
/* 123E4 800117E4 3C02800E */  lui        $v0, %hi(Camera)
/* 123E8 800117E8 8C436ABC */  lw         $v1, %lo(Camera)($v0)
/* 123EC 800117EC 24426ABC */  addiu      $v0, $v0, 0x6abc
/* 123F0 800117F0 AE030014 */  sw         $v1, 0x14($s0)
/* 123F4 800117F4 8C430004 */  lw         $v1, 4($v0)
/* 123F8 800117F8 AE030018 */  sw         $v1, 0x18($s0)
/* 123FC 800117FC 8C440008 */  lw         $a0, 8($v0)
/* 12400 80011800 AE04001C */  sw         $a0, 0x1c($s0)
/* 12404 80011804 8FBF0014 */  lw         $ra, 0x14($sp)
.L80011808:
/* 12408 80011808 8FB00010 */  lw         $s0, 0x10($sp)
/* 1240C 8001180C D7B40018 */  ldc1       $f20, 0x18($sp)
/* 12410 80011810 03E00008 */  jr         $ra
/* 12414 80011814 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_music_values
/* 12418 80011818 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1241C 8001181C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 12420 80011820 AFB00010 */  sw         $s0, 0x10($sp)
/* 12424 80011824 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 12428 80011828 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1242C 8001182C AFB10014 */  sw         $s1, 0x14($sp)
/* 12430 80011830 8E031010 */  lw         $v1, 0x1010($s0)
/* 12434 80011834 10600007 */  beqz       $v1, .L80011854
/* 12438 80011838 3091FFFF */   andi      $s1, $a0, 0xffff
/* 1243C 8001183C 92041018 */  lbu        $a0, 0x1018($s0)
/* 12440 80011840 0C026972 */  jal        dcm_remove_func
/* 12444 80011844 8E051014 */   lw        $a1, 0x1014($s0)
/* 12448 80011848 0C029C07 */  jal        free_borg_12
/* 1244C 8001184C 8E041010 */   lw        $a0, 0x1010($s0)
/* 12450 80011850 AE001010 */  sw         $zero, 0x1010($s0)
.L80011854:
/* 12454 80011854 12200005 */  beqz       $s1, .L8001186C
/* 12458 80011858 8FBF0018 */   lw        $ra, 0x18($sp)
/* 1245C 8001185C A600101C */  sh         $zero, 0x101c($s0)
/* 12460 80011860 A600101A */  sh         $zero, 0x101a($s0)
/* 12464 80011864 AE001014 */  sw         $zero, 0x1014($s0)
/* 12468 80011868 A2001018 */  sb         $zero, 0x1018($s0)
.L8001186C:
/* 1246C 8001186C 8FB10014 */  lw         $s1, 0x14($sp)
/* 12470 80011870 8FB00010 */  lw         $s0, 0x10($sp)
/* 12474 80011874 03E00008 */  jr         $ra
/* 12478 80011878 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_music_no_expPak
/* 1247C 8001187C 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 12480 80011880 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 12484 80011884 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 12488 80011888 1460000B */  bnez       $v1, .L800118B8
/* 1248C 8001188C AFBF0010 */   sw        $ra, 0x10($sp)
/* 12490 80011890 3C02800E */  lui        $v0, %hi(gGlobals)
/* 12494 80011894 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 12498 80011898 8443101A */  lh         $v1, 0x101a($v0)
/* 1249C 8001189C 10600007 */  beqz       $v1, .L800118BC
/* 124A0 800118A0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 124A4 800118A4 8442101C */  lh         $v0, 0x101c($v0)
/* 124A8 800118A8 10620004 */  beq        $v1, $v0, .L800118BC
/* 124AC 800118AC 00000000 */   nop
/* 124B0 800118B0 0C004606 */  jal        clear_music_values
/* 124B4 800118B4 00002021 */   addu      $a0, $zero, $zero
.L800118B8:
/* 124B8 800118B8 8FBF0010 */  lw         $ra, 0x10($sp)
.L800118BC:
/* 124BC 800118BC 03E00008 */  jr         $ra
/* 124C0 800118C0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800118C4
/* 124C4 800118C4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 124C8 800118C8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 124CC 800118CC AFB00020 */  sw         $s0, 0x20($sp)
/* 124D0 800118D0 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 124D4 800118D4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 124D8 800118D8 AFB10024 */  sw         $s1, 0x24($sp)
/* 124DC 800118DC 8603101A */  lh         $v1, 0x101a($s0)
/* 124E0 800118E0 1060002F */  beqz       $v1, .L800119A0
/* 124E4 800118E4 00408821 */   addu      $s1, $v0, $zero
/* 124E8 800118E8 8602101C */  lh         $v0, 0x101c($s0)
/* 124EC 800118EC 10620029 */  beq        $v1, $v0, .L80011994
/* 124F0 800118F0 262268A8 */   addiu     $v0, $s1, 0x68a8
/* 124F4 800118F4 0C004606 */  jal        clear_music_values
/* 124F8 800118F8 00002021 */   addu      $a0, $zero, $zero
/* 124FC 800118FC 8604101A */  lh         $a0, 0x101a($s0)
/* 12500 80011900 18800024 */  blez       $a0, .L80011994
/* 12504 80011904 262268A8 */   addiu     $v0, $s1, 0x68a8
/* 12508 80011908 0C029BFC */  jal        load_borg_12
/* 1250C 8001190C 00000000 */   nop
/* 12510 80011910 26041018 */  addiu      $a0, $s0, 0x1018
/* 12514 80011914 C6022058 */  lwc1       $f2, 0x2058($s0)
/* 12518 80011918 3C01800E */  lui        $at, %hi(D_800D8974)
/* 1251C 8001191C C4208974 */  lwc1       $f0, %lo(D_800D8974)($at)
/* 12520 80011920 8C430008 */  lw         $v1, 8($v0)
/* 12524 80011924 46001002 */  mul.s      $f0, $f2, $f0
/* 12528 80011928 26051014 */  addiu      $a1, $s0, 0x1014
/* 1252C 8001192C AE021010 */  sw         $v0, 0x1010($s0)
/* 12530 80011930 3C01800E */  lui        $at, %hi(D_800D8978)
/* 12534 80011934 C4228978 */  lwc1       $f2, %lo(D_800D8978)($at)
/* 12538 80011938 4600103E */  c.le.s     $f2, $f0
/* 1253C 8001193C 00000000 */  nop
/* 12540 80011940 45010005 */  bc1t       .L80011958
/* 12544 80011944 24660008 */   addiu     $a2, $v1, 8
/* 12548 80011948 4600008D */  trunc.w.s  $f2, $f0
/* 1254C 8001194C 44071000 */  mfc1       $a3, $f2
/* 12550 80011950 0800465C */  j          .L80011970
/* 12554 80011954 24020080 */   addiu     $v0, $zero, 0x80
.L80011958:
/* 12558 80011958 46020001 */  sub.s      $f0, $f0, $f2
/* 1255C 8001195C 4600008D */  trunc.w.s  $f2, $f0
/* 12560 80011960 44071000 */  mfc1       $a3, $f2
/* 12564 80011964 3C028000 */  lui        $v0, 0x8000
/* 12568 80011968 00E23825 */  or         $a3, $a3, $v0
/* 1256C 8001196C 24020080 */  addiu      $v0, $zero, 0x80
.L80011970:
/* 12570 80011970 24030001 */  addiu      $v1, $zero, 1
/* 12574 80011974 AFA20010 */  sw         $v0, 0x10($sp)
/* 12578 80011978 2402FFFF */  addiu      $v0, $zero, -1
/* 1257C 8001197C 30E700FF */  andi       $a3, $a3, 0xff
/* 12580 80011980 AFA30014 */  sw         $v1, 0x14($sp)
/* 12584 80011984 AFA20018 */  sw         $v0, 0x18($sp)
/* 12588 80011988 0C026895 */  jal        DCM_func
/* 1258C 8001198C AFA0001C */   sw        $zero, 0x1c($sp)
/* 12590 80011990 262268A8 */  addiu      $v0, $s1, 0x68a8
.L80011994:
/* 12594 80011994 9443101A */  lhu        $v1, 0x101a($v0)
/* 12598 80011998 A440101A */  sh         $zero, 0x101a($v0)
/* 1259C 8001199C A443101C */  sh         $v1, 0x101c($v0)
.L800119A0:
/* 125A0 800119A0 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 125A4 800119A4 8C621010 */  lw         $v0, 0x1010($v1)
/* 125A8 800119A8 10400018 */  beqz       $v0, .L80011A0C
/* 125AC 800119AC 8FBF0028 */   lw        $ra, 0x28($sp)
/* 125B0 800119B0 C4622058 */  lwc1       $f2, 0x2058($v1)
/* 125B4 800119B4 3C01800E */  lui        $at, %hi(D_800D897C)
/* 125B8 800119B8 C420897C */  lwc1       $f0, %lo(D_800D897C)($at)
/* 125BC 800119BC 46001002 */  mul.s      $f0, $f2, $f0
/* 125C0 800119C0 3C01800E */  lui        $at, %hi(D_800D8980)
/* 125C4 800119C4 C4228980 */  lwc1       $f2, %lo(D_800D8980)($at)
/* 125C8 800119C8 4600103E */  c.le.s     $f2, $f0
/* 125CC 800119CC 00000000 */  nop
/* 125D0 800119D0 45010005 */  bc1t       .L800119E8
/* 125D4 800119D4 90641018 */   lbu       $a0, 0x1018($v1)
/* 125D8 800119D8 4600008D */  trunc.w.s  $f2, $f0
/* 125DC 800119DC 44061000 */  mfc1       $a2, $f2
/* 125E0 800119E0 08004680 */  j          .L80011A00
/* 125E4 800119E4 8C651014 */   lw        $a1, 0x1014($v1)
.L800119E8:
/* 125E8 800119E8 46020001 */  sub.s      $f0, $f0, $f2
/* 125EC 800119EC 4600008D */  trunc.w.s  $f2, $f0
/* 125F0 800119F0 44061000 */  mfc1       $a2, $f2
/* 125F4 800119F4 3C028000 */  lui        $v0, 0x8000
/* 125F8 800119F8 00C23025 */  or         $a2, $a2, $v0
/* 125FC 800119FC 8C651014 */  lw         $a1, 0x1014($v1)
.L80011A00:
/* 12600 80011A00 0C0268D2 */  jal        some_music_func
/* 12604 80011A04 30C600FF */   andi      $a2, $a2, 0xff
/* 12608 80011A08 8FBF0028 */  lw         $ra, 0x28($sp)
.L80011A0C:
/* 1260C 80011A0C 8FB10024 */  lw         $s1, 0x24($sp)
/* 12610 80011A10 8FB00020 */  lw         $s0, 0x20($sp)
/* 12614 80011A14 03E00008 */  jr         $ra
/* 12618 80011A18 27BD0030 */   addiu     $sp, $sp, 0x30

glabel FreeZoneEngine
/* 1261C 80011A1C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 12620 80011A20 AFB20018 */  sw         $s2, 0x18($sp)
/* 12624 80011A24 3092FFFF */  andi       $s2, $a0, 0xffff
/* 12628 80011A28 3C02800F */  lui        $v0, %hi(queueStructB)
/* 1262C 80011A2C AFB00010 */  sw         $s0, 0x10($sp)
/* 12630 80011A30 245086D0 */  addiu      $s0, $v0, %lo(queueStructB)
/* 12634 80011A34 02002021 */  addu       $a0, $s0, $zero
/* 12638 80011A38 24050001 */  addiu      $a1, $zero, 1
/* 1263C 80011A3C AFBF001C */  sw         $ra, 0x1c($sp)
/* 12640 80011A40 0C0357E6 */  jal        Process_queue_B
/* 12644 80011A44 AFB10014 */   sw        $s1, 0x14($sp)
/* 12648 80011A48 2611E1D8 */  addiu      $s1, $s0, -0x1e28
/* 1264C 80011A4C 96220210 */  lhu        $v0, 0x210($s1)
/* 12650 80011A50 14400005 */  bnez       $v0, .L80011A68
/* 12654 80011A54 3C04800E */   lui       $a0, %hi(D_800D8984)
/* 12658 80011A58 24848984 */  addiu      $a0, $a0, %lo(D_800D8984)
/* 1265C 80011A5C 3C05800E */  lui        $a1, %hi(D_800D8994)
/* 12660 80011A60 0C025F2D */  jal        manualCrash
/* 12664 80011A64 24A58994 */   addiu     $a1, $a1, %lo(D_800D8994)
.L80011A68:
/* 12668 80011A68 16400003 */  bnez       $s2, .L80011A78
/* 1266C 80011A6C A6200210 */   sh        $zero, 0x210($s1)
/* 12670 80011A70 0C004606 */  jal        clear_music_values
/* 12674 80011A74 24040001 */   addiu     $a0, $zero, 1
.L80011A78:
/* 12678 80011A78 0C02C720 */  jal        FreeParticleEmmiter
/* 1267C 80011A7C 2604E608 */   addiu     $a0, $s0, -0x19f8
/* 12680 80011A80 0C0089F8 */  jal        func_800227E0
/* 12684 80011A84 2604E56C */   addiu     $a0, $s0, -0x1a94
/* 12688 80011A88 0C0037F7 */  jal        func_8000DFDC
/* 1268C 80011A8C 00000000 */   nop
/* 12690 80011A90 0C0069E4 */  jal        freeScriptCameras
/* 12694 80011A94 2604F7E0 */   addiu     $a0, $s0, -0x820
/* 12698 80011A98 0C00672F */  jal        clear_some_playerHandler_field
/* 1269C 80011A9C 00000000 */   nop
/* 126A0 80011AA0 0C005693 */  jal        FreePlayerHandler
/* 126A4 80011AA4 00000000 */   nop
/* 126A8 80011AA8 0C015541 */  jal        func_80055504
/* 126AC 80011AAC 2604EA50 */   addiu     $a0, $s0, -0x15b0
/* 126B0 80011AB0 0C003446 */  jal        zoneEnginefree_2
/* 126B4 80011AB4 00000000 */   nop
/* 126B8 80011AB8 24040002 */  addiu      $a0, $zero, 2
/* 126BC 80011ABC 00002821 */  addu       $a1, $zero, $zero
/* 126C0 80011AC0 0C00897E */  jal        SetBackgroundType
/* 126C4 80011AC4 00003021 */   addu      $a2, $zero, $zero
/* 126C8 80011AC8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 126CC 80011ACC 8FB20018 */  lw         $s2, 0x18($sp)
/* 126D0 80011AD0 8FB10014 */  lw         $s1, 0x14($sp)
/* 126D4 80011AD4 8FB00010 */  lw         $s0, 0x10($sp)
/* 126D8 80011AD8 03E00008 */  jr         $ra
/* 126DC 80011ADC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_ref_obj_flags
/* 126E0 80011AE0 94820028 */  lhu        $v0, 0x28($a0)
/* 126E4 80011AE4 1040000F */  beqz       $v0, .L80011B24
/* 126E8 80011AE8 00001821 */   addu      $v1, $zero, $zero
/* 126EC 80011AEC 8C850044 */  lw         $a1, 0x44($a0)
/* 126F0 80011AF0 000310C0 */  sll        $v0, $v1, 3
.L80011AF4:
/* 126F4 80011AF4 00431023 */  subu       $v0, $v0, $v1
/* 126F8 80011AF8 00021080 */  sll        $v0, $v0, 2
/* 126FC 80011AFC 00431023 */  subu       $v0, $v0, $v1
/* 12700 80011B00 00021080 */  sll        $v0, $v0, 2
/* 12704 80011B04 00A21021 */  addu       $v0, $a1, $v0
/* 12708 80011B08 24630001 */  addiu      $v1, $v1, 1
/* 1270C 80011B0C A4400014 */  sh         $zero, 0x14($v0)
/* 12710 80011B10 94820028 */  lhu        $v0, 0x28($a0)
/* 12714 80011B14 3063FFFF */  andi       $v1, $v1, 0xffff
/* 12718 80011B18 0062102B */  sltu       $v0, $v1, $v0
/* 1271C 80011B1C 1440FFF5 */  bnez       $v0, .L80011AF4
/* 12720 80011B20 000310C0 */   sll       $v0, $v1, 3
.L80011B24:
/* 12724 80011B24 03E00008 */  jr         $ra
/* 12728 80011B28 00000000 */   nop

glabel voxel_index_position
/* 1272C 80011B2C 27BDFE80 */  addiu      $sp, $sp, -0x180
/* 12730 80011B30 AFB30174 */  sw         $s3, 0x174($sp)
/* 12734 80011B34 00A09821 */  addu       $s3, $a1, $zero
/* 12738 80011B38 3C02800F */  lui        $v0, %hi(voxel_index)
/* 1273C 80011B3C 94438DB2 */  lhu        $v1, %lo(voxel_index)($v0)
/* 12740 80011B40 00042400 */  sll        $a0, $a0, 0x10
/* 12744 80011B44 AFB20170 */  sw         $s2, 0x170($sp)
/* 12748 80011B48 00049403 */  sra        $s2, $a0, 0x10
/* 1274C 80011B4C AFBF017C */  sw         $ra, 0x17c($sp)
/* 12750 80011B50 AFB40178 */  sw         $s4, 0x178($sp)
/* 12754 80011B54 AFB1016C */  sw         $s1, 0x16c($sp)
/* 12758 80011B58 106000B6 */  beqz       $v1, .L80011E34
/* 1275C 80011B5C AFB00168 */   sw        $s0, 0x168($sp)
/* 12760 80011B60 0C0034CE */  jal        GetCollisionZone
/* 12764 80011B64 9264070D */   lbu       $a0, 0x70d($s3)
/* 12768 80011B68 27A40028 */  addiu      $a0, $sp, 0x28
/* 1276C 80011B6C 3C03800E */  lui        $v1, %hi(vobject_labels)
/* 12770 80011B70 246389B0 */  addiu      $v1, $v1, %lo(vobject_labels)
/* 12774 80011B74 00408821 */  addu       $s1, $v0, $zero
/* 12778 80011B78 30620003 */  andi       $v0, $v1, 3
/* 1277C 80011B7C 10400018 */  beqz       $v0, .L80011BE0
/* 12780 80011B80 0080A021 */   addu      $s4, $a0, $zero
/* 12784 80011B84 24620130 */  addiu      $v0, $v1, 0x130
/* 12788 80011B88 3C10800F */  lui        $s0, 0x800f
.L80011B8C:
/* 1278C 80011B8C 88650000 */  lwl        $a1, ($v1)
/* 12790 80011B90 98650003 */  lwr        $a1, 3($v1)
/* 12794 80011B94 88660004 */  lwl        $a2, 4($v1)
/* 12798 80011B98 98660007 */  lwr        $a2, 7($v1)
/* 1279C 80011B9C 88670008 */  lwl        $a3, 8($v1)
/* 127A0 80011BA0 9867000B */  lwr        $a3, 0xb($v1)
/* 127A4 80011BA4 8868000C */  lwl        $t0, 0xc($v1)
/* 127A8 80011BA8 9868000F */  lwr        $t0, 0xf($v1)
/* 127AC 80011BAC A8850000 */  swl        $a1, ($a0)
/* 127B0 80011BB0 B8850003 */  swr        $a1, 3($a0)
/* 127B4 80011BB4 A8860004 */  swl        $a2, 4($a0)
/* 127B8 80011BB8 B8860007 */  swr        $a2, 7($a0)
/* 127BC 80011BBC A8870008 */  swl        $a3, 8($a0)
/* 127C0 80011BC0 B887000B */  swr        $a3, 0xb($a0)
/* 127C4 80011BC4 A888000C */  swl        $t0, 0xc($a0)
/* 127C8 80011BC8 B888000F */  swr        $t0, 0xf($a0)
/* 127CC 80011BCC 24630010 */  addiu      $v1, $v1, 0x10
/* 127D0 80011BD0 1462FFEE */  bne        $v1, $v0, .L80011B8C
/* 127D4 80011BD4 24840010 */   addiu     $a0, $a0, 0x10
/* 127D8 80011BD8 08004705 */  j          .L80011C14
/* 127DC 80011BDC 00000000 */   nop
.L80011BE0:
/* 127E0 80011BE0 24620130 */  addiu      $v0, $v1, 0x130
/* 127E4 80011BE4 3C10800F */  lui        $s0, 0x800f
.L80011BE8:
/* 127E8 80011BE8 8C650000 */  lw         $a1, ($v1)
/* 127EC 80011BEC 8C660004 */  lw         $a2, 4($v1)
/* 127F0 80011BF0 8C670008 */  lw         $a3, 8($v1)
/* 127F4 80011BF4 8C68000C */  lw         $t0, 0xc($v1)
/* 127F8 80011BF8 AC850000 */  sw         $a1, ($a0)
/* 127FC 80011BFC AC860004 */  sw         $a2, 4($a0)
/* 12800 80011C00 AC870008 */  sw         $a3, 8($a0)
/* 12804 80011C04 AC88000C */  sw         $t0, 0xc($a0)
/* 12808 80011C08 24630010 */  addiu      $v1, $v1, 0x10
/* 1280C 80011C0C 1462FFF6 */  bne        $v1, $v0, .L80011BE8
/* 12810 80011C10 24840010 */   addiu     $a0, $a0, 0x10
.L80011C14:
/* 12814 80011C14 88620000 */  lwl        $v0, ($v1)
/* 12818 80011C18 98620003 */  lwr        $v0, 3($v1)
/* 1281C 80011C1C 88650004 */  lwl        $a1, 4($v1)
/* 12820 80011C20 98650007 */  lwr        $a1, 7($v1)
/* 12824 80011C24 A8820000 */  swl        $v0, ($a0)
/* 12828 80011C28 B8820003 */  swr        $v0, 3($a0)
/* 1282C 80011C2C A8850004 */  swl        $a1, 4($a0)
/* 12830 80011C30 B8850007 */  swr        $a1, 7($a0)
/* 12834 80011C34 96028E02 */  lhu        $v0, -0x71fe($s0)
/* 12838 80011C38 00521023 */  subu       $v0, $v0, $s2
/* 1283C 80011C3C A6028E02 */  sh         $v0, -0x71fe($s0)
/* 12840 80011C40 00021400 */  sll        $v0, $v0, 0x10
/* 12844 80011C44 1C40007C */  bgtz       $v0, .L80011E38
/* 12848 80011C48 8FBF017C */   lw        $ra, 0x17c($sp)
/* 1284C 80011C4C 0C0046B8 */  jal        clear_ref_obj_flags
/* 12850 80011C50 02202021 */   addu      $a0, $s1, $zero
/* 12854 80011C54 3C05800F */  lui        $a1, %hi(voxel_index_number)
/* 12858 80011C58 94A28E00 */  lhu        $v0, %lo(voxel_index_number)($a1)
/* 1285C 80011C5C 96240028 */  lhu        $a0, 0x28($s1)
/* 12860 80011C60 24420001 */  addiu      $v0, $v0, 1
/* 12864 80011C64 0044001A */  div        $zero, $v0, $a0
/* 12868 80011C68 3C03800F */  lui        $v1, %hi(enemyHostileFlag)
/* 1286C 80011C6C A4608E10 */  sh         $zero, %lo(enemyHostileFlag)($v1)
/* 12870 80011C70 240200B4 */  addiu      $v0, $zero, 0xb4
/* 12874 80011C74 A6028E02 */  sh         $v0, -0x71fe($s0)
/* 12878 80011C78 00003010 */  mfhi       $a2
/* 1287C 80011C7C 50800001 */  beql       $a0, $zero, .L80011C84
/* 12880 80011C80 000001CD */   break     0, 7
.L80011C84:
/* 12884 80011C84 3C02800F */   lui       $v0, %hi(gGlobalsText)
/* 12888 80011C88 24508920 */  addiu      $s0, $v0, %lo(gGlobalsText)
/* 1288C 80011C8C A4A68E00 */  sh         $a2, -0x7200($a1)
/* 12890 80011C90 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 12894 80011C94 02002021 */  addu       $a0, $s0, $zero
/* 12898 80011C98 000610C0 */  sll        $v0, $a2, 3
/* 1289C 80011C9C 00461023 */  subu       $v0, $v0, $a2
/* 128A0 80011CA0 00021080 */  sll        $v0, $v0, 2
/* 128A4 80011CA4 00461023 */  subu       $v0, $v0, $a2
/* 128A8 80011CA8 00021080 */  sll        $v0, $v0, 2
/* 128AC 80011CAC 3C05800E */  lui        $a1, %hi(D_800D8AE8)
/* 128B0 80011CB0 8E230044 */  lw         $v1, 0x44($s1)
/* 128B4 80011CB4 24A58AE8 */  addiu      $a1, $a1, %lo(D_800D8AE8)
/* 128B8 80011CB8 00628821 */  addu       $s1, $v1, $v0
/* 128BC 80011CBC C6200000 */  lwc1       $f0, ($s1)
/* 128C0 80011CC0 96220016 */  lhu        $v0, 0x16($s1)
/* 128C4 80011CC4 46000021 */  cvt.d.s    $f0, $f0
/* 128C8 80011CC8 00023840 */  sll        $a3, $v0, 1
/* 128CC 80011CCC 00E23821 */  addu       $a3, $a3, $v0
/* 128D0 80011CD0 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 128D4 80011CD4 C6200004 */  lwc1       $f0, 4($s1)
/* 128D8 80011CD8 000738C0 */  sll        $a3, $a3, 3
/* 128DC 80011CDC 46000021 */  cvt.d.s    $f0, $f0
/* 128E0 80011CE0 F7A00018 */  sdc1       $f0, 0x18($sp)
/* 128E4 80011CE4 C6220008 */  lwc1       $f2, 8($s1)
/* 128E8 80011CE8 460010A1 */  cvt.d.s    $f2, $f2
/* 128EC 80011CEC F7A20020 */  sdc1       $f2, 0x20($sp)
/* 128F0 80011CF0 0C0333AC */  jal        sprintf
/* 128F4 80011CF4 02873821 */   addu      $a3, $s4, $a3
/* 128F8 80011CF8 0C00B6B8 */  jal        debug_queue
/* 128FC 80011CFC 02002021 */   addu      $a0, $s0, $zero
/* 12900 80011D00 3C02800F */  lui        $v0, %hi(voxel_index_pointer)
/* 12904 80011D04 8C438E04 */  lw         $v1, %lo(voxel_index_pointer)($v0)
/* 12908 80011D08 10600049 */  beqz       $v1, .L80011E30
/* 1290C 80011D0C 00409021 */   addu      $s2, $v0, $zero
/* 12910 80011D10 02002021 */  addu       $a0, $s0, $zero
/* 12914 80011D14 3C05800E */  lui        $a1, %hi(D_800D8B30)
/* 12918 80011D18 24A58B30 */  addiu      $a1, $a1, %lo(D_800D8B30)
/* 1291C 80011D1C C4600000 */  lwc1       $f0, ($v1)
/* 12920 80011D20 94620016 */  lhu        $v0, 0x16($v1)
/* 12924 80011D24 46000021 */  cvt.d.s    $f0, $f0
/* 12928 80011D28 00023040 */  sll        $a2, $v0, 1
/* 1292C 80011D2C 00C23021 */  addu       $a2, $a2, $v0
/* 12930 80011D30 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 12934 80011D34 C4600004 */  lwc1       $f0, 4($v1)
/* 12938 80011D38 000630C0 */  sll        $a2, $a2, 3
/* 1293C 80011D3C 46000021 */  cvt.d.s    $f0, $f0
/* 12940 80011D40 F7A00018 */  sdc1       $f0, 0x18($sp)
/* 12944 80011D44 C4600008 */  lwc1       $f0, 8($v1)
/* 12948 80011D48 46000021 */  cvt.d.s    $f0, $f0
/* 1294C 80011D4C F7A00020 */  sdc1       $f0, 0x20($sp)
/* 12950 80011D50 0C0333AC */  jal        sprintf
/* 12954 80011D54 02863021 */   addu      $a2, $s4, $a2
/* 12958 80011D58 0C00B6B8 */  jal        debug_queue
/* 1295C 80011D5C 02002021 */   addu      $a0, $s0, $zero
/* 12960 80011D60 8E438E04 */  lw         $v1, -0x71fc($s2)
/* 12964 80011D64 94620016 */  lhu        $v0, 0x16($v1)
/* 12968 80011D68 14400004 */  bnez       $v0, .L80011D7C
/* 1296C 80011D6C 8E448E04 */   lw        $a0, -0x71fc($s2)
/* 12970 80011D70 34028000 */  ori        $v0, $zero, 0x8000
/* 12974 80011D74 A4620014 */  sh         $v0, 0x14($v1)
/* 12978 80011D78 8E448E04 */  lw         $a0, -0x71fc($s2)
.L80011D7C:
/* 1297C 80011D7C 3C01800E */  lui        $at, %hi(D_800D8B64)
/* 12980 80011D80 C4268B64 */  lwc1       $f6, %lo(D_800D8B64)($at)
/* 12984 80011D84 3C01800E */  lui        $at, %hi(D_800D8B68)
/* 12988 80011D88 C4248B68 */  lwc1       $f4, %lo(D_800D8B68)($at)
/* 1298C 80011D8C 8C820000 */  lw         $v0, ($a0)
/* 12990 80011D90 AE620068 */  sw         $v0, 0x68($s3)
/* 12994 80011D94 8C830004 */  lw         $v1, 4($a0)
/* 12998 80011D98 AE63006C */  sw         $v1, 0x6c($s3)
/* 1299C 80011D9C 8C820008 */  lw         $v0, 8($a0)
/* 129A0 80011DA0 AE620070 */  sw         $v0, 0x70($s3)
/* 129A4 80011DA4 8C860000 */  lw         $a2, ($a0)
/* 129A8 80011DA8 AE06E1C0 */  sw         $a2, -0x1e40($s0)
/* 129AC 80011DAC 8C820004 */  lw         $v0, 4($a0)
/* 129B0 80011DB0 2607E1C0 */  addiu      $a3, $s0, -0x1e40
/* 129B4 80011DB4 ACE20004 */  sw         $v0, 4($a3)
/* 129B8 80011DB8 8C850008 */  lw         $a1, 8($a0)
/* 129BC 80011DBC 2603E1A8 */  addiu      $v1, $s0, -0x1e58
/* 129C0 80011DC0 AE06E1A8 */  sw         $a2, -0x1e58($s0)
/* 129C4 80011DC4 AC620004 */  sw         $v0, 4($v1)
/* 129C8 80011DC8 ACE50008 */  sw         $a1, 8($a3)
/* 129CC 80011DCC AC650008 */  sw         $a1, 8($v1)
/* 129D0 80011DD0 2603DF88 */  addiu      $v1, $s0, -0x2078
/* 129D4 80011DD4 8C820000 */  lw         $v0, ($a0)
/* 129D8 80011DD8 2605E19C */  addiu      $a1, $s0, -0x1e64
/* 129DC 80011DDC AE02E19C */  sw         $v0, -0x1e64($s0)
/* 129E0 80011DE0 C4600214 */  lwc1       $f0, 0x214($v1)
/* 129E4 80011DE4 8C820004 */  lw         $v0, 4($a0)
/* 129E8 80011DE8 46060000 */  add.s      $f0, $f0, $f6
/* 129EC 80011DEC ACA20004 */  sw         $v0, 4($a1)
/* 129F0 80011DF0 C4620218 */  lwc1       $f2, 0x218($v1)
/* 129F4 80011DF4 8C820008 */  lw         $v0, 8($a0)
/* 129F8 80011DF8 46041080 */  add.s      $f2, $f2, $f4
/* 129FC 80011DFC ACA20008 */  sw         $v0, 8($a1)
/* 12A00 80011E00 E4600214 */  swc1       $f0, 0x214($v1)
/* 12A04 80011E04 C460021C */  lwc1       $f0, 0x21c($v1)
/* 12A08 80011E08 8E02E19C */  lw         $v0, -0x1e64($s0)
/* 12A0C 80011E0C 46060000 */  add.s      $f0, $f0, $f6
/* 12A10 80011E10 E4620218 */  swc1       $f2, 0x218($v1)
/* 12A14 80011E14 AC62022C */  sw         $v0, 0x22c($v1)
/* 12A18 80011E18 E460021C */  swc1       $f0, 0x21c($v1)
/* 12A1C 80011E1C 8CA40004 */  lw         $a0, 4($a1)
/* 12A20 80011E20 8CA30008 */  lw         $v1, 8($a1)
/* 12A24 80011E24 2602E1B4 */  addiu      $v0, $s0, -0x1e4c
/* 12A28 80011E28 AC440004 */  sw         $a0, 4($v0)
/* 12A2C 80011E2C AC430008 */  sw         $v1, 8($v0)
.L80011E30:
/* 12A30 80011E30 AE518E04 */  sw         $s1, -0x71fc($s2)
.L80011E34:
/* 12A34 80011E34 8FBF017C */  lw         $ra, 0x17c($sp)
.L80011E38:
/* 12A38 80011E38 8FB40178 */  lw         $s4, 0x178($sp)
/* 12A3C 80011E3C 8FB30174 */  lw         $s3, 0x174($sp)
/* 12A40 80011E40 8FB20170 */  lw         $s2, 0x170($sp)
/* 12A44 80011E44 8FB1016C */  lw         $s1, 0x16c($sp)
/* 12A48 80011E48 8FB00168 */  lw         $s0, 0x168($sp)
/* 12A4C 80011E4C 03E00008 */  jr         $ra
/* 12A50 80011E50 27BD0180 */   addiu     $sp, $sp, 0x180

glabel handleZoneEngineFrame
/* 12A54 80011E54 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 12A58 80011E58 AFBE0048 */  sw         $fp, 0x48($sp)
/* 12A5C 80011E5C 0080F021 */  addu       $fp, $a0, $zero
/* 12A60 80011E60 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 12A64 80011E64 AFB1002C */  sw         $s1, 0x2c($sp)
/* 12A68 80011E68 24516988 */  addiu      $s1, $v0, %lo(zoneDatMatrix)
/* 12A6C 80011E6C AFB00028 */  sw         $s0, 0x28($sp)
/* 12A70 80011E70 26301F98 */  addiu      $s0, $s1, 0x1f98
/* 12A74 80011E74 02002021 */  addu       $a0, $s0, $zero
/* 12A78 80011E78 00051C00 */  sll        $v1, $a1, 0x10
/* 12A7C 80011E7C 3C05800E */  lui        $a1, %hi(D_800D8B6C)
/* 12A80 80011E80 24A58B6C */  addiu      $a1, $a1, %lo(D_800D8B6C)
/* 12A84 80011E84 AFB40038 */  sw         $s4, 0x38($sp)
/* 12A88 80011E88 00C0A021 */  addu       $s4, $a2, $zero
/* 12A8C 80011E8C AFBF004C */  sw         $ra, 0x4c($sp)
/* 12A90 80011E90 AFB70044 */  sw         $s7, 0x44($sp)
/* 12A94 80011E94 AFB60040 */  sw         $s6, 0x40($sp)
/* 12A98 80011E98 AFB5003C */  sw         $s5, 0x3c($sp)
/* 12A9C 80011E9C AFB30034 */  sw         $s3, 0x34($sp)
/* 12AA0 80011EA0 AFB20030 */  sw         $s2, 0x30($sp)
/* 12AA4 80011EA4 8FC20000 */  lw         $v0, ($fp)
/* 12AA8 80011EA8 00039C03 */  sra        $s3, $v1, 0x10
/* 12AAC 80011EAC 0C0333AC */  jal        sprintf
/* 12AB0 80011EB0 AFA20020 */   sw        $v0, 0x20($sp)
/* 12AB4 80011EB4 02602021 */  addu       $a0, $s3, $zero
/* 12AB8 80011EB8 0C0046CB */  jal        voxel_index_position
/* 12ABC 80011EBC 02802821 */   addu      $a1, $s4, $zero
/* 12AC0 80011EC0 12800006 */  beqz       $s4, .L80011EDC
/* 12AC4 80011EC4 02002021 */   addu      $a0, $s0, $zero
/* 12AC8 80011EC8 3C05800E */  lui        $a1, %hi(D_800D8B88)
/* 12ACC 80011ECC 0C0333AC */  jal        sprintf
/* 12AD0 80011ED0 24A58B88 */   addiu     $a1, $a1, %lo(D_800D8B88)
/* 12AD4 80011ED4 0C0233B8 */  jal        ProcessVoxelObjects
/* 12AD8 80011ED8 02802021 */   addu      $a0, $s4, $zero
.L80011EDC:
/* 12ADC 80011EDC 3C02800F */  lui        $v0, %hi(FreeZoneEngineTimestamp)
/* 12AE0 80011EE0 3C12800F */  lui        $s2, %hi(handeZoneEngineTimestamp)
/* 12AE4 80011EE4 8C448DA4 */  lw         $a0, %lo(FreeZoneEngineTimestamp)($v0)
/* 12AE8 80011EE8 8E438DA8 */  lw         $v1, %lo(handeZoneEngineTimestamp)($s2)
/* 12AEC 80011EEC 14830007 */  bne        $a0, $v1, .L80011F0C
/* 12AF0 80011EF0 02002021 */   addu      $a0, $s0, $zero
/* 12AF4 80011EF4 3C04800E */  lui        $a0, %hi(D_800D8B9C)
/* 12AF8 80011EF8 24848B9C */  addiu      $a0, $a0, %lo(D_800D8B9C)
/* 12AFC 80011EFC 3C05800E */  lui        $a1, %hi(D_800D84F4)
/* 12B00 80011F00 0C025F2D */  jal        manualCrash
/* 12B04 80011F04 24A584F4 */   addiu     $a1, $a1, %lo(D_800D84F4)
/* 12B08 80011F08 02002021 */  addu       $a0, $s0, $zero
.L80011F0C:
/* 12B0C 80011F0C 2630FF20 */  addiu      $s0, $s1, -0xe0
/* 12B10 80011F10 3C05800E */  lui        $a1, %hi(D_800D8BB4)
/* 12B14 80011F14 8E020008 */  lw         $v0, 8($s0)
/* 12B18 80011F18 24A58BB4 */  addiu      $a1, $a1, %lo(D_800D8BB4)
/* 12B1C 80011F1C 0C0333AC */  jal        sprintf
/* 12B20 80011F20 AE428DA8 */   sw        $v0, -0x7258($s2)
/* 12B24 80011F24 52800005 */  beql       $s4, $zero, .L80011F3C
/* 12B28 80011F28 96022048 */   lhu       $v0, 0x2048($s0)
/* 12B2C 80011F2C 8E250120 */  lw         $a1, 0x120($s1)
/* 12B30 80011F30 0C003CC0 */  jal        ConfirmPlayerWithinZone
/* 12B34 80011F34 02802021 */   addu      $a0, $s4, $zero
/* 12B38 80011F38 96022048 */  lhu        $v0, 0x2048($s0)
.L80011F3C:
/* 12B3C 80011F3C 54400004 */  bnel       $v0, $zero, .L80011F50
/* 12B40 80011F40 8E220EFC */   lw        $v0, 0xefc($s1)
/* 12B44 80011F44 0C004631 */  jal        func_800118C4
/* 12B48 80011F48 00000000 */   nop
/* 12B4C 80011F4C 8E220EFC */  lw         $v0, 0xefc($s1)
.L80011F50:
/* 12B50 80011F50 10400012 */  beqz       $v0, .L80011F9C
/* 12B54 80011F54 00000000 */   nop
/* 12B58 80011F58 96022048 */  lhu        $v0, 0x2048($s0)
/* 12B5C 80011F5C 1440000F */  bnez       $v0, .L80011F9C
/* 12B60 80011F60 00000000 */   nop
/* 12B64 80011F64 8E220F00 */  lw         $v0, 0xf00($s1)
/* 12B68 80011F68 54400007 */  bnel       $v0, $zero, .L80011F88
/* 12B6C 80011F6C 8E250EFC */   lw        $a1, 0xefc($s1)
/* 12B70 80011F70 3C01800E */  lui        $at, %hi(D_800D8D0C)
/* 12B74 80011F74 C4208D0C */  lwc1       $f0, %lo(D_800D8D0C)($at)
/* 12B78 80011F78 24020002 */  addiu      $v0, $zero, 2
/* 12B7C 80011F7C A6022048 */  sh         $v0, 0x2048($s0)
/* 12B80 80011F80 E6002044 */  swc1       $f0, 0x2044($s0)
/* 12B84 80011F84 8E250EFC */  lw         $a1, 0xefc($s1)
.L80011F88:
/* 12B88 80011F88 8E260F00 */  lw         $a2, 0xf00($s1)
/* 12B8C 80011F8C 0C003B6B */  jal        TeleportPlayer
/* 12B90 80011F90 02802021 */   addu      $a0, $s4, $zero
/* 12B94 80011F94 AE200EFC */  sw         $zero, 0xefc($s1)
/* 12B98 80011F98 AE200F00 */  sw         $zero, 0xf00($s1)
.L80011F9C:
/* 12B9C 80011F9C 0C003B23 */  jal        func_8000EC8C
/* 12BA0 80011FA0 26370080 */   addiu     $s7, $s1, 0x80
/* 12BA4 80011FA4 3C04800F */  lui        $a0, %hi(D_800E8DA0)
/* 12BA8 80011FA8 84828DA0 */  lh         $v0, %lo(D_800E8DA0)($a0)
/* 12BAC 80011FAC 10400006 */  beqz       $v0, .L80011FC8
/* 12BB0 80011FB0 94838DA0 */   lhu       $v1, -0x7260($a0)
/* 12BB4 80011FB4 00731023 */  subu       $v0, $v1, $s3
/* 12BB8 80011FB8 A4828DA0 */  sh         $v0, -0x7260($a0)
/* 12BBC 80011FBC 00021400 */  sll        $v0, $v0, 0x10
/* 12BC0 80011FC0 04420001 */  bltzl      $v0, .L80011FC8
/* 12BC4 80011FC4 A4808DA0 */   sh        $zero, -0x7260($a0)
.L80011FC8:
/* 12BC8 80011FC8 96230F3E */  lhu        $v1, 0xf3e($s1)
/* 12BCC 80011FCC 24020002 */  addiu      $v0, $zero, 2
/* 12BD0 80011FD0 1062000D */  beq        $v1, $v0, .L80012008
/* 12BD4 80011FD4 3C16800F */   lui       $s6, %hi(gGlobalsText)
/* 12BD8 80011FD8 26D08920 */  addiu      $s0, $s6, %lo(gGlobalsText)
/* 12BDC 80011FDC 02002021 */  addu       $a0, $s0, $zero
/* 12BE0 80011FE0 3C05800E */  lui        $a1, %hi(D_800D8BCC)
/* 12BE4 80011FE4 0C0333AC */  jal        sprintf
/* 12BE8 80011FE8 24A58BCC */   addiu     $a1, $a1, %lo(D_800D8BCC)
/* 12BEC 80011FEC 262402D8 */  addiu      $a0, $s1, 0x2d8
/* 12BF0 80011FF0 0C00588F */  jal        ProcessPlayers
/* 12BF4 80011FF4 02602821 */   addu      $a1, $s3, $zero
/* 12BF8 80011FF8 02002021 */  addu       $a0, $s0, $zero
/* 12BFC 80011FFC 3C05800E */  lui        $a1, %hi(D_800D8BDC)
/* 12C00 80012000 0C0333AC */  jal        sprintf
/* 12C04 80012004 24A58BDC */   addiu     $a1, $a1, %lo(D_800D8BDC)
.L80012008:
/* 12C08 80012008 1280003B */  beqz       $s4, .L800120F8
/* 12C0C 8001200C 96220F3E */   lhu       $v0, 0xf3e($s1)
/* 12C10 80012010 1440003A */  bnez       $v0, .L800120FC
/* 12C14 80012014 24150002 */   addiu     $s5, $zero, 2
/* 12C18 80012018 26C48920 */  addiu      $a0, $s6, -0x76e0
/* 12C1C 8001201C 3C05800E */  lui        $a1, %hi(D_800D8C00)
/* 12C20 80012020 0C0333AC */  jal        sprintf
/* 12C24 80012024 24A58C00 */   addiu     $a1, $a1, %lo(D_800D8C00)
/* 12C28 80012028 96231210 */  lhu        $v1, 0x1210($s1)
/* 12C2C 8001202C 00731823 */  subu       $v1, $v1, $s3
/* 12C30 80012030 A6231210 */  sh         $v1, 0x1210($s1)
/* 12C34 80012034 00031C00 */  sll        $v1, $v1, 0x10
/* 12C38 80012038 5C60002F */  bgtzl      $v1, .L800120F8
/* 12C3C 8001203C 96220F3E */   lhu       $v0, 0xf3e($s1)
/* 12C40 80012040 24120001 */  addiu      $s2, $zero, 1
/* 12C44 80012044 26900068 */  addiu      $s0, $s4, 0x68
/* 12C48 80012048 86250292 */  lh         $a1, 0x292($s1)
/* 12C4C 8001204C 24020078 */  addiu      $v0, $zero, 0x78
/* 12C50 80012050 A6221210 */  sh         $v0, 0x1210($s1)
/* 12C54 80012054 AFB20010 */  sw         $s2, 0x10($sp)
/* 12C58 80012058 86260294 */  lh         $a2, 0x294($s1)
/* 12C5C 8001205C 862702AC */  lh         $a3, 0x2ac($s1)
/* 12C60 80012060 0C0032BA */  jal        func_8000CAE8
/* 12C64 80012064 02002021 */   addu      $a0, $s0, $zero
/* 12C68 80012068 10400009 */  beqz       $v0, .L80012090
/* 12C6C 8001206C 00402021 */   addu      $a0, $v0, $zero
/* 12C70 80012070 0C02AB66 */  jal        get_vec3_proximity
/* 12C74 80012074 02002821 */   addu      $a1, $s0, $zero
/* 12C78 80012078 3C01800E */  lui        $at, %hi(D_800D8D10)
/* 12C7C 8001207C C4228D10 */  lwc1       $f2, %lo(D_800D8D10)($at)
/* 12C80 80012080 4602003C */  c.lt.s     $f0, $f2
/* 12C84 80012084 00000000 */  nop
/* 12C88 80012088 45030001 */  bc1tl      .L80012090
/* 12C8C 8001208C 00009021 */   addu      $s2, $zero, $zero
.L80012090:
/* 12C90 80012090 12400018 */  beqz       $s2, .L800120F4
/* 12C94 80012094 02802021 */   addu      $a0, $s4, $zero
/* 12C98 80012098 9622120C */  lhu        $v0, 0x120c($s1)
/* 12C9C 8001209C 00022840 */  sll        $a1, $v0, 1
/* 12CA0 800120A0 00A22821 */  addu       $a1, $a1, $v0
/* 12CA4 800120A4 00052880 */  sll        $a1, $a1, 2
/* 12CA8 800120A8 00A22823 */  subu       $a1, $a1, $v0
/* 12CAC 800120AC 00052880 */  sll        $a1, $a1, 2
/* 12CB0 800120B0 24A50F78 */  addiu      $a1, $a1, 0xf78
/* 12CB4 800120B4 0C0045C9 */  jal        SaveEngineZone
/* 12CB8 800120B8 02252821 */   addu      $a1, $s1, $a1
/* 12CBC 800120BC 3C038888 */  lui        $v1, 0x8888
/* 12CC0 800120C0 9624120C */  lhu        $a0, 0x120c($s1)
/* 12CC4 800120C4 34638889 */  ori        $v1, $v1, 0x8889
/* 12CC8 800120C8 24840001 */  addiu      $a0, $a0, 1
/* 12CCC 800120CC 00830018 */  mult       $a0, $v1
/* 12CD0 800120D0 00042FC3 */  sra        $a1, $a0, 0x1f
/* 12CD4 800120D4 00001810 */  mfhi       $v1
/* 12CD8 800120D8 00641821 */  addu       $v1, $v1, $a0
/* 12CDC 800120DC 000318C3 */  sra        $v1, $v1, 3
/* 12CE0 800120E0 00651823 */  subu       $v1, $v1, $a1
/* 12CE4 800120E4 00031100 */  sll        $v0, $v1, 4
/* 12CE8 800120E8 00431023 */  subu       $v0, $v0, $v1
/* 12CEC 800120EC 00822023 */  subu       $a0, $a0, $v0
/* 12CF0 800120F0 A624120C */  sh         $a0, 0x120c($s1)
.L800120F4:
/* 12CF4 800120F4 96220F3E */  lhu        $v0, 0xf3e($s1)
.L800120F8:
/* 12CF8 800120F8 24150002 */  addiu      $s5, $zero, 2
.L800120FC:
/* 12CFC 800120FC 10550006 */  beq        $v0, $s5, .L80012118
/* 12D00 80012100 3C04800E */   lui       $a0, %hi(ScriptCamera)
/* 12D04 80012104 44930000 */  mtc1       $s3, $f0
/* 12D08 80012108 46800020 */  cvt.s.w    $f0, $f0
/* 12D0C 8001210C 44050000 */  mfc1       $a1, $f0
/* 12D10 80012110 0C006A67 */  jal        ProcessScriptCamera
/* 12D14 80012114 24847EB0 */   addiu     $a0, $a0, %lo(ScriptCamera)
.L80012118:
/* 12D18 80012118 26240134 */  addiu      $a0, $s1, 0x134
/* 12D1C 8001211C 26320140 */  addiu      $s2, $s1, 0x140
/* 12D20 80012120 0C02AB66 */  jal        get_vec3_proximity
/* 12D24 80012124 02402821 */   addu      $a1, $s2, $zero
/* 12D28 80012128 3C01800E */  lui        $at, %hi(D_800D8D18)
/* 12D2C 8001212C D4228D18 */  ldc1       $f2, %lo(D_800D8D18)($at)
/* 12D30 80012130 46000021 */  cvt.d.s    $f0, $f0
/* 12D34 80012134 4622003C */  c.lt.d     $f0, $f2
/* 12D38 80012138 00000000 */  nop
/* 12D3C 8001213C 45000005 */  bc1f       .L80012154
/* 12D40 80012140 3C04800E */   lui       $a0, %hi(D_800D8C10)
/* 12D44 80012144 24848C10 */  addiu      $a0, $a0, %lo(D_800D8C10)
/* 12D48 80012148 3C05800E */  lui        $a1, %hi(D_800D8C28)
/* 12D4C 8001214C 0C025F2D */  jal        manualCrash
/* 12D50 80012150 24A58C28 */   addiu     $a1, $a1, %lo(D_800D8C28)
.L80012154:
/* 12D54 80012154 26D08920 */  addiu      $s0, $s6, -0x76e0
/* 12D58 80012158 02002021 */  addu       $a0, $s0, $zero
/* 12D5C 8001215C 3C05800E */  lui        $a1, %hi(D_800D8C48)
/* 12D60 80012160 0C0333AC */  jal        sprintf
/* 12D64 80012164 24A58C48 */   addiu     $a1, $a1, %lo(D_800D8C48)
/* 12D68 80012168 C6200140 */  lwc1       $f0, 0x140($s1)
/* 12D6C 8001216C 8EE40004 */  lw         $a0, 4($s7)
/* 12D70 80012170 8E250134 */  lw         $a1, 0x134($s1)
/* 12D74 80012174 8E260138 */  lw         $a2, 0x138($s1)
/* 12D78 80012178 8E27013C */  lw         $a3, 0x13c($s1)
/* 12D7C 8001217C C6220144 */  lwc1       $f2, 0x144($s1)
/* 12D80 80012180 C6240148 */  lwc1       $f4, 0x148($s1)
/* 12D84 80012184 E7A00010 */  swc1       $f0, 0x10($sp)
/* 12D88 80012188 E7A20014 */  swc1       $f2, 0x14($sp)
/* 12D8C 8001218C 0C029F59 */  jal        SceneSetCameraLookAt
/* 12D90 80012190 E7A40018 */   swc1      $f4, 0x18($sp)
/* 12D94 80012194 96220F3E */  lhu        $v0, 0xf3e($s1)
/* 12D98 80012198 10550004 */  beq        $v0, $s5, .L800121AC
/* 12D9C 8001219C 8FA40020 */   lw        $a0, 0x20($sp)
/* 12DA0 800121A0 0C0087C0 */  jal        RenderSky
/* 12DA4 800121A4 02602821 */   addu      $a1, $s3, $zero
/* 12DA8 800121A8 AFA20020 */  sw         $v0, 0x20($sp)
.L800121AC:
/* 12DAC 800121AC 8603F3D4 */  lh         $v1, -0xc2c($s0)
/* 12DB0 800121B0 24020003 */  addiu      $v0, $zero, 3
/* 12DB4 800121B4 1462000B */  bne        $v1, $v0, .L800121E4
/* 12DB8 800121B8 02002021 */   addu      $a0, $s0, $zero
/* 12DBC 800121BC 3C05800E */  lui        $a1, %hi(D_800D8C60)
/* 12DC0 800121C0 0C0333AC */  jal        sprintf
/* 12DC4 800121C4 24A58C60 */   addiu     $a1, $a1, %lo(D_800D8C60)
/* 12DC8 800121C8 0C00C1DD */  jal        RenderClouds
/* 12DCC 800121CC 8FA40020 */   lw        $a0, 0x20($sp)
/* 12DD0 800121D0 00402021 */  addu       $a0, $v0, $zero
/* 12DD4 800121D4 0C00B991 */  jal        func_8002E644
/* 12DD8 800121D8 AFA20020 */   sw        $v0, 0x20($sp)
/* 12DDC 800121DC AFA20020 */  sw         $v0, 0x20($sp)
/* 12DE0 800121E0 02002021 */  addu       $a0, $s0, $zero
.L800121E4:
/* 12DE4 800121E4 3C05800E */  lui        $a1, %hi(D_800D8C80)
/* 12DE8 800121E8 0C0333AC */  jal        sprintf
/* 12DEC 800121EC 24A58C80 */   addiu     $a1, $a1, %lo(D_800D8C80)
/* 12DF0 800121F0 12800007 */  beqz       $s4, .L80012210
/* 12DF4 800121F4 27B00020 */   addiu     $s0, $sp, 0x20
/* 12DF8 800121F8 02002021 */  addu       $a0, $s0, $zero
/* 12DFC 800121FC 26850068 */  addiu      $a1, $s4, 0x68
/* 12E00 80012200 0C004227 */  jal        some_zone_rendering_func
/* 12E04 80012204 02603021 */   addu      $a2, $s3, $zero
/* 12E08 80012208 08004889 */  j          .L80012224
/* 12E0C 8001220C 02009021 */   addu      $s2, $s0, $zero
.L80012210:
/* 12E10 80012210 02002021 */  addu       $a0, $s0, $zero
/* 12E14 80012214 02402821 */  addu       $a1, $s2, $zero
/* 12E18 80012218 0C004227 */  jal        some_zone_rendering_func
/* 12E1C 8001221C 02603021 */   addu      $a2, $s3, $zero
/* 12E20 80012220 02009021 */  addu       $s2, $s0, $zero
.L80012224:
/* 12E24 80012224 96220F3E */  lhu        $v0, 0xf3e($s1)
/* 12E28 80012228 24150002 */  addiu      $s5, $zero, 2
/* 12E2C 8001222C 1055000D */  beq        $v0, $s5, .L80012264
/* 12E30 80012230 26D08920 */   addiu     $s0, $s6, -0x76e0
/* 12E34 80012234 26C48920 */  addiu      $a0, $s6, -0x76e0
/* 12E38 80012238 3C05800E */  lui        $a1, %hi(D_800D8C8C)
/* 12E3C 8001223C 0C0333AC */  jal        sprintf
/* 12E40 80012240 24A58C8C */   addiu     $a1, $a1, %lo(D_800D8C8C)
/* 12E44 80012244 262402D8 */  addiu      $a0, $s1, 0x2d8
/* 12E48 80012248 02603021 */  addu       $a2, $s3, $zero
/* 12E4C 8001224C 8FA50020 */  lw         $a1, 0x20($sp)
/* 12E50 80012250 00003821 */  addu       $a3, $zero, $zero
/* 12E54 80012254 0C005E95 */  jal        renderPlayers
/* 12E58 80012258 AFA00010 */   sw        $zero, 0x10($sp)
/* 12E5C 8001225C AFA20020 */  sw         $v0, 0x20($sp)
/* 12E60 80012260 26D08920 */  addiu      $s0, $s6, -0x76e0
.L80012264:
/* 12E64 80012264 02002021 */  addu       $a0, $s0, $zero
/* 12E68 80012268 3C05800E */  lui        $a1, %hi(D_800D8C9C)
/* 12E6C 8001226C 0C0333AC */  jal        sprintf
/* 12E70 80012270 24A58C9C */   addiu     $a1, $a1, %lo(D_800D8C9C)
/* 12E74 80012274 0C00441F */  jal        renderTransZones_
/* 12E78 80012278 02402021 */   addu      $a0, $s2, $zero
/* 12E7C 8001227C 0C0043F4 */  jal        RenderTransZones__
/* 12E80 80012280 02402021 */   addu      $a0, $s2, $zero
/* 12E84 80012284 02002021 */  addu       $a0, $s0, $zero
/* 12E88 80012288 3C05800E */  lui        $a1, %hi(D_800D8CB0)
/* 12E8C 8001228C 0C0333AC */  jal        sprintf
/* 12E90 80012290 24A58CB0 */   addiu     $a1, $a1, %lo(D_800D8CB0)
/* 12E94 80012294 96230F3E */  lhu        $v1, 0xf3e($s1)
/* 12E98 80012298 1075000B */  beq        $v1, $s5, .L800122C8
/* 12E9C 8001229C A2000000 */   sb        $zero, ($s0)
/* 12EA0 800122A0 0C002593 */  jal        get_vi_buffer_choice
/* 12EA4 800122A4 00000000 */   nop
/* 12EA8 800122A8 02402021 */  addu       $a0, $s2, $zero
/* 12EAC 800122AC 26250350 */  addiu      $a1, $s1, 0x350
/* 12EB0 800122B0 2626016C */  addiu      $a2, $s1, 0x16c
/* 12EB4 800122B4 02603821 */  addu       $a3, $s3, $zero
/* 12EB8 800122B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 12EBC 800122BC 24020001 */  addiu      $v0, $zero, 1
/* 12EC0 800122C0 0C02C85B */  jal        ProcessAndRenderParticleHead
/* 12EC4 800122C4 AFA20014 */   sw        $v0, 0x14($sp)
.L800122C8:
/* 12EC8 800122C8 02002021 */  addu       $a0, $s0, $zero
/* 12ECC 800122CC 3C05800E */  lui        $a1, %hi(D_800D8CD0)
/* 12ED0 800122D0 0C0333AC */  jal        sprintf
/* 12ED4 800122D4 24A58CD0 */   addiu     $a1, $a1, %lo(D_800D8CD0)
/* 12ED8 800122D8 12800004 */  beqz       $s4, .L800122EC
/* 12EDC 800122DC 2604F280 */   addiu     $a0, $s0, -0xd80
/* 12EE0 800122E0 26850068 */  addiu      $a1, $s4, 0x68
/* 12EE4 800122E4 0C0159CB */  jal        ProcessAudioBubbles
/* 12EE8 800122E8 02603021 */   addu      $a2, $s3, $zero
.L800122EC:
/* 12EEC 800122EC 02002021 */  addu       $a0, $s0, $zero
/* 12EF0 800122F0 3C05800E */  lui        $a1, %hi(D_800D8CE4)
/* 12EF4 800122F4 0C0333AC */  jal        sprintf
/* 12EF8 800122F8 24A58CE4 */   addiu     $a1, $a1, %lo(D_800D8CE4)
/* 12EFC 800122FC 262402B4 */  addiu      $a0, $s1, 0x2b4
/* 12F00 80012300 0C008BDC */  jal        ProcessWeather
/* 12F04 80012304 02602821 */   addu      $a1, $s3, $zero
/* 12F08 80012308 26240798 */  addiu      $a0, $s1, 0x798
/* 12F0C 8001230C 0C0155BD */  jal        func_800556F4
/* 12F10 80012310 02602821 */   addu      $a1, $s3, $zero
/* 12F14 80012314 02002021 */  addu       $a0, $s0, $zero
/* 12F18 80012318 3C05800E */  lui        $a1, %hi(D_800D8CF4)
/* 12F1C 8001231C 0C0333AC */  jal        sprintf
/* 12F20 80012320 24A58CF4 */   addiu     $a1, $a1, %lo(D_800D8CF4)
/* 12F24 80012324 8FA30020 */  lw         $v1, 0x20($sp)
/* 12F28 80012328 8FBF004C */  lw         $ra, 0x4c($sp)
/* 12F2C 8001232C 8FB70044 */  lw         $s7, 0x44($sp)
/* 12F30 80012330 8FB60040 */  lw         $s6, 0x40($sp)
/* 12F34 80012334 8FB5003C */  lw         $s5, 0x3c($sp)
/* 12F38 80012338 8FB40038 */  lw         $s4, 0x38($sp)
/* 12F3C 8001233C 8FB30034 */  lw         $s3, 0x34($sp)
/* 12F40 80012340 8FB20030 */  lw         $s2, 0x30($sp)
/* 12F44 80012344 8FB1002C */  lw         $s1, 0x2c($sp)
/* 12F48 80012348 8FB00028 */  lw         $s0, 0x28($sp)
/* 12F4C 8001234C AFC30000 */  sw         $v1, ($fp)
/* 12F50 80012350 8FBE0048 */  lw         $fp, 0x48($sp)
/* 12F54 80012354 03E00008 */  jr         $ra
/* 12F58 80012358 27BD0050 */   addiu     $sp, $sp, 0x50
/* 12F5C 8001235C 00000000 */  nop
