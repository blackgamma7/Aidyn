.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alEnvmixerPull
/* D05D0 800CF9D0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* D05D4 800CF9D4 AFB20030 */  sw         $s2, 0x30($sp)
/* D05D8 800CF9D8 8FB20060 */  lw         $s2, 0x60($sp)
/* D05DC 800CF9DC AFB00028 */  sw         $s0, 0x28($sp)
/* D05E0 800CF9E0 00808021 */  addu       $s0, $a0, $zero
/* D05E4 800CF9E4 AFBF004C */  sw         $ra, 0x4c($sp)
/* D05E8 800CF9E8 AFBE0048 */  sw         $fp, 0x48($sp)
/* D05EC 800CF9EC AFB70044 */  sw         $s7, 0x44($sp)
/* D05F0 800CF9F0 AFB60040 */  sw         $s6, 0x40($sp)
/* D05F4 800CF9F4 AFB5003C */  sw         $s5, 0x3c($sp)
/* D05F8 800CF9F8 AFB40038 */  sw         $s4, 0x38($sp)
/* D05FC 800CF9FC AFB30034 */  sw         $s3, 0x34($sp)
/* D0600 800CFA00 AFB1002C */  sw         $s1, 0x2c($sp)
/* D0604 800CFA04 8E02003C */  lw         $v0, 0x3c($s0)
/* D0608 800CFA08 00C0B821 */  addu       $s7, $a2, $zero
/* D060C 800CFA0C 00E0B021 */  addu       $s6, $a3, $zero
/* D0610 800CFA10 AFB60024 */  sw         $s6, 0x24($sp)
/* D0614 800CFA14 A7A0001A */  sh         $zero, 0x1a($sp)
/* D0618 800CFA18 10400113 */  beqz       $v0, .L800CFE68
/* D061C 800CFA1C A7A00018 */   sh        $zero, 0x18($sp)
/* D0620 800CFA20 241E0001 */  addiu      $fp, $zero, 1
/* D0624 800CFA24 3C14800F */  lui        $s4, %hi(eqpower)
/* D0628 800CFA28 26943B90 */  addiu      $s4, $s4, %lo(eqpower)
.L800CFA2C:
/* D062C 800CFA2C 8E03003C */  lw         $v1, 0x3c($s0)
/* D0630 800CFA30 8FA20024 */  lw         $v0, 0x24($sp)
/* D0634 800CFA34 8C680004 */  lw         $t0, 4($v1)
/* D0638 800CFA38 01029823 */  subu       $s3, $t0, $v0
/* D063C 800CFA3C 02F3102A */  slt        $v0, $s7, $s3
/* D0640 800CFA40 14400109 */  bnez       $v0, .L800CFE68
/* D0644 800CFA44 AFA80024 */   sw        $t0, 0x24($sp)
/* D0648 800CFA48 84630008 */  lh         $v1, 8($v1)
/* D064C 800CFA4C 2C620011 */  sltiu      $v0, $v1, 0x11
/* D0650 800CFA50 104000E8 */  beqz       $v0, .L800CFDF4
/* D0654 800CFA54 00031080 */   sll       $v0, $v1, 2
/* D0658 800CFA58 3C01800E */  lui        $at, %hi(jtbl_800E5640)
/* D065C 800CFA5C 00220821 */  addu       $at, $at, $v0
/* D0660 800CFA60 8C225640 */  lw         $v0, %lo(jtbl_800E5640)($at)
/* D0664 800CFA64 00400008 */  jr         $v0
/* D0668 800CFA68 00000000 */   nop
glabel L800CFA6C_D066C
/* D066C 800CFA6C 8E11003C */  lw         $s1, 0x3c($s0)
/* D0670 800CFA70 8622000A */  lh         $v0, 0xa($s1)
/* D0674 800CFA74 10400006 */  beqz       $v0, .L800CFA90
/* D0678 800CFA78 0200A821 */   addu      $s5, $s0, $zero
/* D067C 800CFA7C 02002021 */  addu       $a0, $s0, $zero
/* D0680 800CFA80 8E020008 */  lw         $v0, 8($s0)
/* D0684 800CFA84 24050008 */  addiu      $a1, $zero, 8
/* D0688 800CFA88 0040F809 */  jalr       $v0
/* D068C 800CFA8C 00003021 */   addu      $a2, $zero, $zero
.L800CFA90:
/* D0690 800CFA90 8E260018 */  lw         $a2, 0x18($s1)
/* D0694 800CFA94 8E020008 */  lw         $v0, 8($s0)
/* D0698 800CFA98 02002021 */  addu       $a0, $s0, $zero
/* D069C 800CFA9C 0040F809 */  jalr       $v0
/* D06A0 800CFAA0 24050005 */   addiu     $a1, $zero, 5
/* D06A4 800CFAA4 02002021 */  addu       $a0, $s0, $zero
/* D06A8 800CFAA8 8E020008 */  lw         $v0, 8($s0)
/* D06AC 800CFAAC 24050009 */  addiu      $a1, $zero, 9
/* D06B0 800CFAB0 0040F809 */  jalr       $v0
/* D06B4 800CFAB4 00003021 */   addu      $a2, $zero, $zero
/* D06B8 800CFAB8 AE1E0038 */  sw         $fp, 0x38($s0)
/* D06BC 800CFABC AE000030 */  sw         $zero, 0x30($s0)
/* D06C0 800CFAC0 8E220014 */  lw         $v0, 0x14($s1)
/* D06C4 800CFAC4 AE020034 */  sw         $v0, 0x34($s0)
/* D06C8 800CFAC8 86220010 */  lh         $v0, 0x10($s1)
/* D06CC 800CFACC 00420018 */  mult       $v0, $v0
/* D06D0 800CFAD0 00001012 */  mflo       $v0
/* D06D4 800CFAD4 000213C3 */  sra        $v0, $v0, 0xf
/* D06D8 800CFAD8 A602001A */  sh         $v0, 0x1a($s0)
/* D06DC 800CFADC 92220012 */  lbu        $v0, 0x12($s1)
/* D06E0 800CFAE0 A6020018 */  sh         $v0, 0x18($s0)
/* D06E4 800CFAE4 92220013 */  lbu        $v0, 0x13($s1)
/* D06E8 800CFAE8 00021040 */  sll        $v0, $v0, 1
/* D06EC 800CFAEC 00541021 */  addu       $v0, $v0, $s4
/* D06F0 800CFAF0 94420000 */  lhu        $v0, ($v0)
/* D06F4 800CFAF4 A6020020 */  sh         $v0, 0x20($s0)
/* D06F8 800CFAF8 92220013 */  lbu        $v0, 0x13($s1)
/* D06FC 800CFAFC 2408007F */  addiu      $t0, $zero, 0x7f
/* D0700 800CFB00 01021023 */  subu       $v0, $t0, $v0
/* D0704 800CFB04 00021040 */  sll        $v0, $v0, 1
/* D0708 800CFB08 00541021 */  addu       $v0, $v0, $s4
/* D070C 800CFB0C 94420000 */  lhu        $v0, ($v0)
/* D0710 800CFB10 A6020022 */  sh         $v0, 0x22($s0)
/* D0714 800CFB14 8E220014 */  lw         $v0, 0x14($s1)
/* D0718 800CFB18 10400004 */  beqz       $v0, .L800CFB2C
/* D071C 800CFB1C 00000000 */   nop
/* D0720 800CFB20 A61E001C */  sh         $fp, 0x1c($s0)
/* D0724 800CFB24 08033EDE */  j          .L800CFB78
/* D0728 800CFB28 A61E001E */   sh        $fp, 0x1e($s0)
.L800CFB2C:
/* D072C 800CFB2C 86020018 */  lh         $v0, 0x18($s0)
/* D0730 800CFB30 8603001A */  lh         $v1, 0x1a($s0)
/* D0734 800CFB34 00021040 */  sll        $v0, $v0, 1
/* D0738 800CFB38 00541021 */  addu       $v0, $v0, $s4
/* D073C 800CFB3C 84420000 */  lh         $v0, ($v0)
/* D0740 800CFB40 00620018 */  mult       $v1, $v0
/* D0744 800CFB44 00001812 */  mflo       $v1
/* D0748 800CFB48 86020018 */  lh         $v0, 0x18($s0)
/* D074C 800CFB4C 01021023 */  subu       $v0, $t0, $v0
/* D0750 800CFB50 00021040 */  sll        $v0, $v0, 1
/* D0754 800CFB54 00541021 */  addu       $v0, $v0, $s4
/* D0758 800CFB58 00031BC3 */  sra        $v1, $v1, 0xf
/* D075C 800CFB5C A603001C */  sh         $v1, 0x1c($s0)
/* D0760 800CFB60 8603001A */  lh         $v1, 0x1a($s0)
/* D0764 800CFB64 84420000 */  lh         $v0, ($v0)
/* D0768 800CFB68 00620018 */  mult       $v1, $v0
/* D076C 800CFB6C 00001812 */  mflo       $v1
/* D0770 800CFB70 00031BC3 */  sra        $v1, $v1, 0xf
/* D0774 800CFB74 A603001E */  sh         $v1, 0x1e($s0)
.L800CFB78:
/* D0778 800CFB78 8EA40000 */  lw         $a0, ($s5)
/* D077C 800CFB7C 108000AB */  beqz       $a0, .L800CFE2C
/* D0780 800CFB80 00000000 */   nop
/* D0784 800CFB84 8E26000C */  lw         $a2, 0xc($s1)
/* D0788 800CFB88 8C820008 */  lw         $v0, 8($a0)
/* D078C 800CFB8C 0040F809 */  jalr       $v0
/* D0790 800CFB90 24050007 */   addiu     $a1, $zero, 7
/* D0794 800CFB94 08033F8B */  j          .L800CFE2C
/* D0798 800CFB98 00000000 */   nop
glabel L800CFB9C_D079C
/* D079C 800CFB9C 02002021 */  addu       $a0, $s0, $zero
/* D07A0 800CFBA0 27A50018 */  addiu      $a1, $sp, 0x18
/* D07A4 800CFBA4 27A6001A */  addiu      $a2, $sp, 0x1a
/* D07A8 800CFBA8 02603821 */  addu       $a3, $s3, $zero
/* D07AC 800CFBAC AFB60010 */  sw         $s6, 0x10($sp)
/* D07B0 800CFBB0 0C033FE9 */  jal        _pullSubFrame
/* D07B4 800CFBB4 AFB20014 */   sw        $s2, 0x14($sp)
/* D07B8 800CFBB8 8E050030 */  lw         $a1, 0x30($s0)
/* D07BC 800CFBBC 8E030034 */  lw         $v1, 0x34($s0)
/* D07C0 800CFBC0 00A3182A */  slt        $v1, $a1, $v1
/* D07C4 800CFBC4 1460001C */  bnez       $v1, .L800CFC38
/* D07C8 800CFBC8 00409021 */   addu      $s2, $v0, $zero
/* D07CC 800CFBCC 86020018 */  lh         $v0, 0x18($s0)
/* D07D0 800CFBD0 8603001A */  lh         $v1, 0x1a($s0)
/* D07D4 800CFBD4 00021040 */  sll        $v0, $v0, 1
/* D07D8 800CFBD8 00541021 */  addu       $v0, $v0, $s4
/* D07DC 800CFBDC 84420000 */  lh         $v0, ($v0)
/* D07E0 800CFBE0 00620018 */  mult       $v1, $v0
/* D07E4 800CFBE4 00001812 */  mflo       $v1
/* D07E8 800CFBE8 86020018 */  lh         $v0, 0x18($s0)
/* D07EC 800CFBEC 2408007F */  addiu      $t0, $zero, 0x7f
/* D07F0 800CFBF0 01021023 */  subu       $v0, $t0, $v0
/* D07F4 800CFBF4 00021040 */  sll        $v0, $v0, 1
/* D07F8 800CFBF8 00541021 */  addu       $v0, $v0, $s4
/* D07FC 800CFBFC 00031BC3 */  sra        $v1, $v1, 0xf
/* D0800 800CFC00 A6030028 */  sh         $v1, 0x28($s0)
/* D0804 800CFC04 8603001A */  lh         $v1, 0x1a($s0)
/* D0808 800CFC08 84420000 */  lh         $v0, ($v0)
/* D080C 800CFC0C 00620018 */  mult       $v1, $v0
/* D0810 800CFC10 00001812 */  mflo       $v1
/* D0814 800CFC14 8E020034 */  lw         $v0, 0x34($s0)
/* D0818 800CFC18 00031BC3 */  sra        $v1, $v1, 0xf
/* D081C 800CFC1C A603002E */  sh         $v1, 0x2e($s0)
/* D0820 800CFC20 96030028 */  lhu        $v1, 0x28($s0)
/* D0824 800CFC24 9604002E */  lhu        $a0, 0x2e($s0)
/* D0828 800CFC28 AE020030 */  sw         $v0, 0x30($s0)
/* D082C 800CFC2C A603001C */  sh         $v1, 0x1c($s0)
/* D0830 800CFC30 08033F24 */  j          .L800CFC90
/* D0834 800CFC34 A604001E */   sh        $a0, 0x1e($s0)
.L800CFC38:
/* D0838 800CFC38 86060026 */  lh         $a2, 0x26($s0)
/* D083C 800CFC3C 8602001C */  lh         $v0, 0x1c($s0)
/* D0840 800CFC40 96070024 */  lhu        $a3, 0x24($s0)
/* D0844 800CFC44 44826000 */  mtc1       $v0, $f12
/* D0848 800CFC48 00000000 */  nop
/* D084C 800CFC4C 0C03417F */  jal        _getVol
/* D0850 800CFC50 46806320 */   cvt.s.w   $f12, $f12
/* D0854 800CFC54 8E050030 */  lw         $a1, 0x30($s0)
/* D0858 800CFC58 8606002C */  lh         $a2, 0x2c($s0)
/* D085C 800CFC5C 9607002A */  lhu        $a3, 0x2a($s0)
/* D0860 800CFC60 8603001E */  lh         $v1, 0x1e($s0)
/* D0864 800CFC64 4600008D */  trunc.w.s  $f2, $f0
/* D0868 800CFC68 44021000 */  mfc1       $v0, $f2
/* D086C 800CFC6C 44836000 */  mtc1       $v1, $f12
/* D0870 800CFC70 00000000 */  nop
/* D0874 800CFC74 46806320 */  cvt.s.w    $f12, $f12
/* D0878 800CFC78 0C03417F */  jal        _getVol
/* D087C 800CFC7C A602001C */   sh        $v0, 0x1c($s0)
/* D0880 800CFC80 4600008D */  trunc.w.s  $f2, $f0
/* D0884 800CFC84 44021000 */  mfc1       $v0, $f2
/* D0888 800CFC88 00000000 */  nop
/* D088C 800CFC8C A602001E */  sh         $v0, 0x1e($s0)
.L800CFC90:
/* D0890 800CFC90 8602001C */  lh         $v0, 0x1c($s0)
/* D0894 800CFC94 50400001 */  beql       $v0, $zero, .L800CFC9C
/* D0898 800CFC98 A61E001C */   sh        $fp, 0x1c($s0)
.L800CFC9C:
/* D089C 800CFC9C 8602001E */  lh         $v0, 0x1e($s0)
/* D08A0 800CFCA0 50400001 */  beql       $v0, $zero, .L800CFCA8
/* D08A4 800CFCA4 A61E001E */   sh        $fp, 0x1e($s0)
.L800CFCA8:
/* D08A8 800CFCA8 8E04003C */  lw         $a0, 0x3c($s0)
/* D08AC 800CFCAC 84830008 */  lh         $v1, 8($a0)
/* D08B0 800CFCB0 2402000C */  addiu      $v0, $zero, 0xc
/* D08B4 800CFCB4 14620003 */  bne        $v1, $v0, .L800CFCC4
/* D08B8 800CFCB8 00000000 */   nop
/* D08BC 800CFCBC 8C82000C */  lw         $v0, 0xc($a0)
/* D08C0 800CFCC0 A6020018 */  sh         $v0, 0x18($s0)
.L800CFCC4:
/* D08C4 800CFCC4 8E02003C */  lw         $v0, 0x3c($s0)
/* D08C8 800CFCC8 84430008 */  lh         $v1, 8($v0)
/* D08CC 800CFCCC 2402000B */  addiu      $v0, $zero, 0xb
/* D08D0 800CFCD0 1462000B */  bne        $v1, $v0, .L800CFD00
/* D08D4 800CFCD4 00000000 */   nop
/* D08D8 800CFCD8 8E02003C */  lw         $v0, 0x3c($s0)
/* D08DC 800CFCDC AE000030 */  sw         $zero, 0x30($s0)
/* D08E0 800CFCE0 8C42000C */  lw         $v0, 0xc($v0)
/* D08E4 800CFCE4 00420018 */  mult       $v0, $v0
/* D08E8 800CFCE8 00001012 */  mflo       $v0
/* D08EC 800CFCEC 8E03003C */  lw         $v1, 0x3c($s0)
/* D08F0 800CFCF0 000213C3 */  sra        $v0, $v0, 0xf
/* D08F4 800CFCF4 A602001A */  sh         $v0, 0x1a($s0)
/* D08F8 800CFCF8 8C620010 */  lw         $v0, 0x10($v1)
/* D08FC 800CFCFC AE020034 */  sw         $v0, 0x34($s0)
.L800CFD00:
/* D0900 800CFD00 8E04003C */  lw         $a0, 0x3c($s0)
/* D0904 800CFD04 84830008 */  lh         $v1, 8($a0)
/* D0908 800CFD08 24020010 */  addiu      $v0, $zero, 0x10
/* D090C 800CFD0C 54620047 */  bnel       $v1, $v0, .L800CFE2C
/* D0910 800CFD10 AE1E0038 */   sw        $fp, 0x38($s0)
/* D0914 800CFD14 8C82000C */  lw         $v0, 0xc($a0)
/* D0918 800CFD18 8E03003C */  lw         $v1, 0x3c($s0)
/* D091C 800CFD1C 00021040 */  sll        $v0, $v0, 1
/* D0920 800CFD20 00541021 */  addu       $v0, $v0, $s4
/* D0924 800CFD24 94420000 */  lhu        $v0, ($v0)
/* D0928 800CFD28 A6020020 */  sh         $v0, 0x20($s0)
/* D092C 800CFD2C 8C62000C */  lw         $v0, 0xc($v1)
/* D0930 800CFD30 2408007F */  addiu      $t0, $zero, 0x7f
/* D0934 800CFD34 01021023 */  subu       $v0, $t0, $v0
/* D0938 800CFD38 00021040 */  sll        $v0, $v0, 1
/* D093C 800CFD3C 00541021 */  addu       $v0, $v0, $s4
/* D0940 800CFD40 94420000 */  lhu        $v0, ($v0)
/* D0944 800CFD44 A6020022 */  sh         $v0, 0x22($s0)
/* D0948 800CFD48 08033F8B */  j          .L800CFE2C
/* D094C 800CFD4C AE1E0038 */   sw        $fp, 0x38($s0)
glabel L800CFD50_D0950
/* D0950 800CFD50 8E11003C */  lw         $s1, 0x3c($s0)
/* D0954 800CFD54 8622000A */  lh         $v0, 0xa($s1)
/* D0958 800CFD58 10400005 */  beqz       $v0, .L800CFD70
/* D095C 800CFD5C 02002021 */   addu      $a0, $s0, $zero
/* D0960 800CFD60 8E020008 */  lw         $v0, 8($s0)
/* D0964 800CFD64 24050008 */  addiu      $a1, $zero, 8
/* D0968 800CFD68 0040F809 */  jalr       $v0
/* D096C 800CFD6C 00003021 */   addu      $a2, $zero, $zero
.L800CFD70:
/* D0970 800CFD70 8E26000C */  lw         $a2, 0xc($s1)
/* D0974 800CFD74 8E020008 */  lw         $v0, 8($s0)
/* D0978 800CFD78 02002021 */  addu       $a0, $s0, $zero
/* D097C 800CFD7C 0040F809 */  jalr       $v0
/* D0980 800CFD80 24050005 */   addiu     $a1, $zero, 5
/* D0984 800CFD84 02002021 */  addu       $a0, $s0, $zero
/* D0988 800CFD88 8E020008 */  lw         $v0, 8($s0)
/* D098C 800CFD8C 08033F70 */  j          .L800CFDC0
/* D0990 800CFD90 24050009 */   addiu     $a1, $zero, 9
glabel L800CFD94_D0994
/* D0994 800CFD94 02002021 */  addu       $a0, $s0, $zero
/* D0998 800CFD98 27A50018 */  addiu      $a1, $sp, 0x18
/* D099C 800CFD9C 27A6001A */  addiu      $a2, $sp, 0x1a
/* D09A0 800CFDA0 02603821 */  addu       $a3, $s3, $zero
/* D09A4 800CFDA4 AFB60010 */  sw         $s6, 0x10($sp)
/* D09A8 800CFDA8 0C033FE9 */  jal        _pullSubFrame
/* D09AC 800CFDAC AFB20014 */   sw        $s2, 0x14($sp)
/* D09B0 800CFDB0 00409021 */  addu       $s2, $v0, $zero
/* D09B4 800CFDB4 02002021 */  addu       $a0, $s0, $zero
/* D09B8 800CFDB8 8E020008 */  lw         $v0, 8($s0)
/* D09BC 800CFDBC 24050004 */  addiu      $a1, $zero, 4
.L800CFDC0:
/* D09C0 800CFDC0 0040F809 */  jalr       $v0
/* D09C4 800CFDC4 00003021 */   addu      $a2, $zero, $zero
/* D09C8 800CFDC8 08033F8B */  j          .L800CFE2C
/* D09CC 800CFDCC 00000000 */   nop
glabel L800CFDD0_D09D0
/* D09D0 800CFDD0 8E02003C */  lw         $v0, 0x3c($s0)
/* D09D4 800CFDD4 3C04800F */  lui        $a0, %hi(alGlobals)
/* D09D8 800CFDD8 8C8439F0 */  lw         $a0, %lo(alGlobals)($a0)
/* D09DC 800CFDDC 8C43000C */  lw         $v1, 0xc($v0)
/* D09E0 800CFDE0 AC6000D8 */  sw         $zero, 0xd8($v1)
/* D09E4 800CFDE4 0C033829 */  jal        _freePVoice
/* D09E8 800CFDE8 8C45000C */   lw        $a1, 0xc($v0)
/* D09EC 800CFDEC 08033F8B */  j          .L800CFE2C
/* D09F0 800CFDF0 00000000 */   nop
.L800CFDF4:
glabel L800CFDF4_D09F4
/* D09F4 800CFDF4 02002021 */  addu       $a0, $s0, $zero
/* D09F8 800CFDF8 27A50018 */  addiu      $a1, $sp, 0x18
/* D09FC 800CFDFC 27A6001A */  addiu      $a2, $sp, 0x1a
/* D0A00 800CFE00 02603821 */  addu       $a3, $s3, $zero
/* D0A04 800CFE04 AFB60010 */  sw         $s6, 0x10($sp)
/* D0A08 800CFE08 0C033FE9 */  jal        _pullSubFrame
/* D0A0C 800CFE0C AFB20014 */   sw        $s2, 0x14($sp)
/* D0A10 800CFE10 8E03003C */  lw         $v1, 0x3c($s0)
/* D0A14 800CFE14 84650008 */  lh         $a1, 8($v1)
/* D0A18 800CFE18 8C66000C */  lw         $a2, 0xc($v1)
/* D0A1C 800CFE1C 8E030008 */  lw         $v1, 8($s0)
/* D0A20 800CFE20 00409021 */  addu       $s2, $v0, $zero
/* D0A24 800CFE24 0060F809 */  jalr       $v1
/* D0A28 800CFE28 02002021 */   addu      $a0, $s0, $zero
.L800CFE2C:
/* D0A2C 800CFE2C 8E05003C */  lw         $a1, 0x3c($s0)
/* D0A30 800CFE30 02F3B823 */  subu       $s7, $s7, $s3
/* D0A34 800CFE34 97A2001A */  lhu        $v0, 0x1a($sp)
/* D0A38 800CFE38 8CA40000 */  lw         $a0, ($a1)
/* D0A3C 800CFE3C 00131840 */  sll        $v1, $s3, 1
/* D0A40 800CFE40 00431021 */  addu       $v0, $v0, $v1
/* D0A44 800CFE44 A7A2001A */  sh         $v0, 0x1a($sp)
/* D0A48 800CFE48 14800002 */  bnez       $a0, .L800CFE54
/* D0A4C 800CFE4C AE04003C */   sw        $a0, 0x3c($s0)
/* D0A50 800CFE50 AE000040 */  sw         $zero, 0x40($s0)
.L800CFE54:
/* D0A54 800CFE54 0C03380E */  jal        __freeParam
/* D0A58 800CFE58 00A02021 */   addu      $a0, $a1, $zero
/* D0A5C 800CFE5C 8E02003C */  lw         $v0, 0x3c($s0)
/* D0A60 800CFE60 1440FEF2 */  bnez       $v0, .L800CFA2C
/* D0A64 800CFE64 00000000 */   nop
.L800CFE68:
/* D0A68 800CFE68 02002021 */  addu       $a0, $s0, $zero
/* D0A6C 800CFE6C 27A50018 */  addiu      $a1, $sp, 0x18
/* D0A70 800CFE70 27A6001A */  addiu      $a2, $sp, 0x1a
/* D0A74 800CFE74 02E03821 */  addu       $a3, $s7, $zero
/* D0A78 800CFE78 AFB60010 */  sw         $s6, 0x10($sp)
/* D0A7C 800CFE7C 0C033FE9 */  jal        _pullSubFrame
/* D0A80 800CFE80 AFB20014 */   sw        $s2, 0x14($sp)
/* D0A84 800CFE84 8E030030 */  lw         $v1, 0x30($s0)
/* D0A88 800CFE88 8E040034 */  lw         $a0, 0x34($s0)
/* D0A8C 800CFE8C 0083182A */  slt        $v1, $a0, $v1
/* D0A90 800CFE90 10600002 */  beqz       $v1, .L800CFE9C
/* D0A94 800CFE94 00409021 */   addu      $s2, $v0, $zero
/* D0A98 800CFE98 AE040030 */  sw         $a0, 0x30($s0)
.L800CFE9C:
/* D0A9C 800CFE9C 02401021 */  addu       $v0, $s2, $zero
/* D0AA0 800CFEA0 8FBF004C */  lw         $ra, 0x4c($sp)
/* D0AA4 800CFEA4 8FBE0048 */  lw         $fp, 0x48($sp)
/* D0AA8 800CFEA8 8FB70044 */  lw         $s7, 0x44($sp)
/* D0AAC 800CFEAC 8FB60040 */  lw         $s6, 0x40($sp)
/* D0AB0 800CFEB0 8FB5003C */  lw         $s5, 0x3c($sp)
/* D0AB4 800CFEB4 8FB40038 */  lw         $s4, 0x38($sp)
/* D0AB8 800CFEB8 8FB30034 */  lw         $s3, 0x34($sp)
/* D0ABC 800CFEBC 8FB20030 */  lw         $s2, 0x30($sp)
/* D0AC0 800CFEC0 8FB1002C */  lw         $s1, 0x2c($sp)
/* D0AC4 800CFEC4 8FB00028 */  lw         $s0, 0x28($sp)
/* D0AC8 800CFEC8 03E00008 */  jr         $ra
/* D0ACC 800CFECC 27BD0050 */   addiu     $sp, $sp, 0x50

glabel alEnvmixerParam
/* D0AD0 800CFED0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D0AD4 800CFED4 AFBF0010 */  sw         $ra, 0x10($sp)
/* D0AD8 800CFED8 24020003 */  addiu      $v0, $zero, 3
/* D0ADC 800CFEDC 10A2000F */  beq        $a1, $v0, .L800CFF1C
/* D0AE0 800CFEE0 00801821 */   addu      $v1, $a0, $zero
/* D0AE4 800CFEE4 28A20004 */  slti       $v0, $a1, 4
/* D0AE8 800CFEE8 10400005 */  beqz       $v0, .L800CFF00
/* D0AEC 800CFEEC 24020001 */   addiu     $v0, $zero, 1
/* D0AF0 800CFEF0 50A20028 */  beql       $a1, $v0, .L800CFF94
/* D0AF4 800CFEF4 AC860000 */   sw        $a2, ($a0)
/* D0AF8 800CFEF8 08033FDF */  j          .L800CFF7C
/* D0AFC 800CFEFC 00000000 */   nop
.L800CFF00:
/* D0B00 800CFF00 24020004 */  addiu      $v0, $zero, 4
/* D0B04 800CFF04 10A2000B */  beq        $a1, $v0, .L800CFF34
/* D0B08 800CFF08 24020009 */   addiu     $v0, $zero, 9
/* D0B0C 800CFF0C 10A20014 */  beq        $a1, $v0, .L800CFF60
/* D0B10 800CFF10 24020001 */   addiu     $v0, $zero, 1
/* D0B14 800CFF14 08033FDF */  j          .L800CFF7C
/* D0B18 800CFF18 00000000 */   nop
.L800CFF1C:
/* D0B1C 800CFF1C 8C820040 */  lw         $v0, 0x40($a0)
/* D0B20 800CFF20 50400002 */  beql       $v0, $zero, .L800CFF2C
/* D0B24 800CFF24 AC86003C */   sw        $a2, 0x3c($a0)
/* D0B28 800CFF28 AC460000 */  sw         $a2, ($v0)
.L800CFF2C:
/* D0B2C 800CFF2C 08033FE5 */  j          .L800CFF94
/* D0B30 800CFF30 AC660040 */   sw        $a2, 0x40($v1)
.L800CFF34:
/* D0B34 800CFF34 8C830000 */  lw         $v1, ($a0)
/* D0B38 800CFF38 24020001 */  addiu      $v0, $zero, 1
/* D0B3C 800CFF3C AC820038 */  sw         $v0, 0x38($a0)
/* D0B40 800CFF40 24020001 */  addiu      $v0, $zero, 1
/* D0B44 800CFF44 AC800048 */  sw         $zero, 0x48($a0)
/* D0B48 800CFF48 10600012 */  beqz       $v1, .L800CFF94
/* D0B4C 800CFF4C A482001A */   sh        $v0, 0x1a($a0)
/* D0B50 800CFF50 00602021 */  addu       $a0, $v1, $zero
/* D0B54 800CFF54 8C820008 */  lw         $v0, 8($a0)
/* D0B58 800CFF58 08033FE3 */  j          .L800CFF8C
/* D0B5C 800CFF5C 24050004 */   addiu     $a1, $zero, 4
.L800CFF60:
/* D0B60 800CFF60 8C830000 */  lw         $v1, ($a0)
/* D0B64 800CFF64 1060000B */  beqz       $v1, .L800CFF94
/* D0B68 800CFF68 AC820048 */   sw        $v0, 0x48($a0)
/* D0B6C 800CFF6C 00602021 */  addu       $a0, $v1, $zero
/* D0B70 800CFF70 8C820008 */  lw         $v0, 8($a0)
/* D0B74 800CFF74 08033FE3 */  j          .L800CFF8C
/* D0B78 800CFF78 24050009 */   addiu     $a1, $zero, 9
.L800CFF7C:
/* D0B7C 800CFF7C 8C840000 */  lw         $a0, ($a0)
/* D0B80 800CFF80 10800004 */  beqz       $a0, .L800CFF94
/* D0B84 800CFF84 00000000 */   nop
/* D0B88 800CFF88 8C820008 */  lw         $v0, 8($a0)
.L800CFF8C:
/* D0B8C 800CFF8C 0040F809 */  jalr       $v0
/* D0B90 800CFF90 00000000 */   nop
.L800CFF94:
/* D0B94 800CFF94 8FBF0010 */  lw         $ra, 0x10($sp)
/* D0B98 800CFF98 00001021 */  addu       $v0, $zero, $zero
/* D0B9C 800CFF9C 03E00008 */  jr         $ra
/* D0BA0 800CFFA0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _pullSubFrame
/* D0BA4 800CFFA4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D0BA8 800CFFA8 AFB10024 */  sw         $s1, 0x24($sp)
/* D0BAC 800CFFAC 8FB1004C */  lw         $s1, 0x4c($sp)
/* D0BB0 800CFFB0 AFB40030 */  sw         $s4, 0x30($sp)
/* D0BB4 800CFFB4 00A0A021 */  addu       $s4, $a1, $zero
/* D0BB8 800CFFB8 AFB00020 */  sw         $s0, 0x20($sp)
/* D0BBC 800CFFBC AFB3002C */  sw         $s3, 0x2c($sp)
/* D0BC0 800CFFC0 00E09821 */  addu       $s3, $a3, $zero
/* D0BC4 800CFFC4 AFB20028 */  sw         $s2, 0x28($sp)
/* D0BC8 800CFFC8 00809021 */  addu       $s2, $a0, $zero
/* D0BCC 800CFFCC AFBF0034 */  sw         $ra, 0x34($sp)
/* D0BD0 800CFFD0 8E420048 */  lw         $v0, 0x48($s2)
/* D0BD4 800CFFD4 8E440000 */  lw         $a0, ($s2)
/* D0BD8 800CFFD8 2E630001 */  sltiu      $v1, $s3, 1
/* D0BDC 800CFFDC 38420001 */  xori       $v0, $v0, 1
/* D0BE0 800CFFE0 0002102B */  sltu       $v0, $zero, $v0
/* D0BE4 800CFFE4 00431025 */  or         $v0, $v0, $v1
/* D0BE8 800CFFE8 10400003 */  beqz       $v0, .L800CFFF8
/* D0BEC 800CFFEC 00C08021 */   addu      $s0, $a2, $zero
/* D0BF0 800CFFF0 08034096 */  j          .L800D0258
/* D0BF4 800CFFF4 02201021 */   addu      $v0, $s1, $zero
.L800CFFF8:
/* D0BF8 800CFFF8 AFB10010 */  sw         $s1, 0x10($sp)
/* D0BFC 800CFFFC 8C820004 */  lw         $v0, 4($a0)
/* D0C00 800D0000 8FA70048 */  lw         $a3, 0x48($sp)
/* D0C04 800D0004 02802821 */  addu       $a1, $s4, $zero
/* D0C08 800D0008 0040F809 */  jalr       $v0
/* D0C0C 800D000C 02603021 */   addu      $a2, $s3, $zero
/* D0C10 800D0010 00408821 */  addu       $s1, $v0, $zero
/* D0C14 800D0014 96820000 */  lhu        $v0, ($s4)
/* D0C18 800D0018 02202021 */  addu       $a0, $s1, $zero
/* D0C1C 800D001C 3C030800 */  lui        $v1, 0x800
/* D0C20 800D0020 26310008 */  addiu      $s1, $s1, 8
/* D0C24 800D0024 00431025 */  or         $v0, $v0, $v1
/* D0C28 800D0028 AC820000 */  sw         $v0, ($a0)
/* D0C2C 800D002C 86020000 */  lh         $v0, ($s0)
/* D0C30 800D0030 00131840 */  sll        $v1, $s3, 1
/* D0C34 800D0034 3063FFFF */  andi       $v1, $v1, 0xffff
/* D0C38 800D0038 24420440 */  addiu      $v0, $v0, 0x440
/* D0C3C 800D003C 00021400 */  sll        $v0, $v0, 0x10
/* D0C40 800D0040 00431025 */  or         $v0, $v0, $v1
/* D0C44 800D0044 AC820004 */  sw         $v0, 4($a0)
/* D0C48 800D0048 86020000 */  lh         $v0, ($s0)
/* D0C4C 800D004C 02202021 */  addu       $a0, $s1, $zero
/* D0C50 800D0050 3C030808 */  lui        $v1, 0x808
/* D0C54 800D0054 24420580 */  addiu      $v0, $v0, 0x580
/* D0C58 800D0058 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0C5C 800D005C 00431025 */  or         $v0, $v0, $v1
/* D0C60 800D0060 AC820000 */  sw         $v0, ($a0)
/* D0C64 800D0064 86020000 */  lh         $v0, ($s0)
/* D0C68 800D0068 244306C0 */  addiu      $v1, $v0, 0x6c0
/* D0C6C 800D006C 00031C00 */  sll        $v1, $v1, 0x10
/* D0C70 800D0070 24420800 */  addiu      $v0, $v0, 0x800
/* D0C74 800D0074 3042FFFF */  andi       $v0, $v0, 0xffff
/* D0C78 800D0078 00621825 */  or         $v1, $v1, $v0
/* D0C7C 800D007C AC830004 */  sw         $v1, 4($a0)
/* D0C80 800D0080 8E420038 */  lw         $v0, 0x38($s2)
/* D0C84 800D0084 10400065 */  beqz       $v0, .L800D021C
/* D0C88 800D0088 26310008 */   addiu     $s1, $s1, 8
/* D0C8C 800D008C 86420018 */  lh         $v0, 0x18($s2)
/* D0C90 800D0090 8643001A */  lh         $v1, 0x1a($s2)
/* D0C94 800D0094 AE400038 */  sw         $zero, 0x38($s2)
/* D0C98 800D0098 00021040 */  sll        $v0, $v0, 1
/* D0C9C 800D009C 3C01800F */  lui        $at, %hi(eqpower)
/* D0CA0 800D00A0 00220821 */  addu       $at, $at, $v0
/* D0CA4 800D00A4 84223B90 */  lh         $v0, %lo(eqpower)($at)
/* D0CA8 800D00A8 00620018 */  mult       $v1, $v0
/* D0CAC 800D00AC 00001812 */  mflo       $v1
/* D0CB0 800D00B0 8642001C */  lh         $v0, 0x1c($s2)
/* D0CB4 800D00B4 8E440034 */  lw         $a0, 0x34($s2)
/* D0CB8 800D00B8 44826000 */  mtc1       $v0, $f12
/* D0CBC 800D00BC 00000000 */  nop
/* D0CC0 800D00C0 46806321 */  cvt.d.w    $f12, $f12
/* D0CC4 800D00C4 00031BC3 */  sra        $v1, $v1, 0xf
/* D0CC8 800D00C8 00031400 */  sll        $v0, $v1, 0x10
/* D0CCC 800D00CC 00021403 */  sra        $v0, $v0, 0x10
/* D0CD0 800D00D0 44827000 */  mtc1       $v0, $f14
/* D0CD4 800D00D4 00000000 */  nop
/* D0CD8 800D00D8 468073A1 */  cvt.d.w    $f14, $f14
/* D0CDC 800D00DC 26420024 */  addiu      $v0, $s2, 0x24
/* D0CE0 800D00E0 A6430028 */  sh         $v1, 0x28($s2)
/* D0CE4 800D00E4 AFA40010 */  sw         $a0, 0x10($sp)
/* D0CE8 800D00E8 0C0340DF */  jal        _getRate
/* D0CEC 800D00EC AFA20014 */   sw        $v0, 0x14($sp)
/* D0CF0 800D00F0 86440018 */  lh         $a0, 0x18($s2)
/* D0CF4 800D00F4 8643001A */  lh         $v1, 0x1a($s2)
/* D0CF8 800D00F8 A6420026 */  sh         $v0, 0x26($s2)
/* D0CFC 800D00FC 2402007F */  addiu      $v0, $zero, 0x7f
/* D0D00 800D0100 00441023 */  subu       $v0, $v0, $a0
/* D0D04 800D0104 00021040 */  sll        $v0, $v0, 1
/* D0D08 800D0108 3C01800F */  lui        $at, %hi(eqpower)
/* D0D0C 800D010C 00220821 */  addu       $at, $at, $v0
/* D0D10 800D0110 84223B90 */  lh         $v0, %lo(eqpower)($at)
/* D0D14 800D0114 00620018 */  mult       $v1, $v0
/* D0D18 800D0118 00001812 */  mflo       $v1
/* D0D1C 800D011C 8642001E */  lh         $v0, 0x1e($s2)
/* D0D20 800D0120 8E440034 */  lw         $a0, 0x34($s2)
/* D0D24 800D0124 44826000 */  mtc1       $v0, $f12
/* D0D28 800D0128 00000000 */  nop
/* D0D2C 800D012C 46806321 */  cvt.d.w    $f12, $f12
/* D0D30 800D0130 00031BC3 */  sra        $v1, $v1, 0xf
/* D0D34 800D0134 00031400 */  sll        $v0, $v1, 0x10
/* D0D38 800D0138 00021403 */  sra        $v0, $v0, 0x10
/* D0D3C 800D013C 44827000 */  mtc1       $v0, $f14
/* D0D40 800D0140 00000000 */  nop
/* D0D44 800D0144 468073A1 */  cvt.d.w    $f14, $f14
/* D0D48 800D0148 2642002A */  addiu      $v0, $s2, 0x2a
/* D0D4C 800D014C A643002E */  sh         $v1, 0x2e($s2)
/* D0D50 800D0150 AFA40010 */  sw         $a0, 0x10($sp)
/* D0D54 800D0154 0C0340DF */  jal        _getRate
/* D0D58 800D0158 AFA20014 */   sw        $v0, 0x14($sp)
/* D0D5C 800D015C 9643001C */  lhu        $v1, 0x1c($s2)
/* D0D60 800D0160 02202021 */  addu       $a0, $s1, $zero
/* D0D64 800D0164 26310008 */  addiu      $s1, $s1, 8
/* D0D68 800D0168 A642002C */  sh         $v0, 0x2c($s2)
/* D0D6C 800D016C 3C020906 */  lui        $v0, 0x906
/* D0D70 800D0170 AC800004 */  sw         $zero, 4($a0)
/* D0D74 800D0174 00621825 */  or         $v1, $v1, $v0
/* D0D78 800D0178 AC830000 */  sw         $v1, ($a0)
/* D0D7C 800D017C 9643001E */  lhu        $v1, 0x1e($s2)
/* D0D80 800D0180 02202021 */  addu       $a0, $s1, $zero
/* D0D84 800D0184 26310008 */  addiu      $s1, $s1, 8
/* D0D88 800D0188 3C020904 */  lui        $v0, 0x904
/* D0D8C 800D018C AC800004 */  sw         $zero, 4($a0)
/* D0D90 800D0190 00621825 */  or         $v1, $v1, $v0
/* D0D94 800D0194 AC830000 */  sw         $v1, ($a0)
/* D0D98 800D0198 96420028 */  lhu        $v0, 0x28($s2)
/* D0D9C 800D019C 02202021 */  addu       $a0, $s1, $zero
/* D0DA0 800D01A0 3C030902 */  lui        $v1, 0x902
/* D0DA4 800D01A4 00431025 */  or         $v0, $v0, $v1
/* D0DA8 800D01A8 AC820000 */  sw         $v0, ($a0)
/* D0DAC 800D01AC 96420026 */  lhu        $v0, 0x26($s2)
/* D0DB0 800D01B0 96430024 */  lhu        $v1, 0x24($s2)
/* D0DB4 800D01B4 26310008 */  addiu      $s1, $s1, 8
/* D0DB8 800D01B8 00021400 */  sll        $v0, $v0, 0x10
/* D0DBC 800D01BC 00431025 */  or         $v0, $v0, $v1
/* D0DC0 800D01C0 AC820004 */  sw         $v0, 4($a0)
/* D0DC4 800D01C4 9642002E */  lhu        $v0, 0x2e($s2)
/* D0DC8 800D01C8 02202021 */  addu       $a0, $s1, $zero
/* D0DCC 800D01CC 3C030900 */  lui        $v1, 0x900
/* D0DD0 800D01D0 00431025 */  or         $v0, $v0, $v1
/* D0DD4 800D01D4 AC820000 */  sw         $v0, ($a0)
/* D0DD8 800D01D8 9642002C */  lhu        $v0, 0x2c($s2)
/* D0DDC 800D01DC 9643002A */  lhu        $v1, 0x2a($s2)
/* D0DE0 800D01E0 26310008 */  addiu      $s1, $s1, 8
/* D0DE4 800D01E4 00021400 */  sll        $v0, $v0, 0x10
/* D0DE8 800D01E8 00431025 */  or         $v0, $v0, $v1
/* D0DEC 800D01EC AC820004 */  sw         $v0, 4($a0)
/* D0DF0 800D01F0 96420020 */  lhu        $v0, 0x20($s2)
/* D0DF4 800D01F4 02202021 */  addu       $a0, $s1, $zero
/* D0DF8 800D01F8 3C030908 */  lui        $v1, 0x908
/* D0DFC 800D01FC 00431025 */  or         $v0, $v0, $v1
/* D0E00 800D0200 AC820000 */  sw         $v0, ($a0)
/* D0E04 800D0204 96420022 */  lhu        $v0, 0x22($s2)
/* D0E08 800D0208 26310008 */  addiu      $s1, $s1, 8
/* D0E0C 800D020C 02208021 */  addu       $s0, $s1, $zero
/* D0E10 800D0210 AC820004 */  sw         $v0, 4($a0)
/* D0E14 800D0214 08034089 */  j          .L800D0224
/* D0E18 800D0218 3C020309 */   lui       $v0, 0x309
.L800D021C:
/* D0E1C 800D021C 02208021 */  addu       $s0, $s1, $zero
/* D0E20 800D0220 3C020308 */  lui        $v0, 0x308
.L800D0224:
/* D0E24 800D0224 AE020000 */  sw         $v0, ($s0)
/* D0E28 800D0228 8E440014 */  lw         $a0, 0x14($s2)
/* D0E2C 800D022C 0C034888 */  jal        osVirtualToPhysical
/* D0E30 800D0230 26310008 */   addiu     $s1, $s1, 8
/* D0E34 800D0234 AE020004 */  sw         $v0, 4($s0)
/* D0E38 800D0238 96820000 */  lhu        $v0, ($s4)
/* D0E3C 800D023C 00131840 */  sll        $v1, $s3, 1
/* D0E40 800D0240 00431021 */  addu       $v0, $v0, $v1
/* D0E44 800D0244 A6820000 */  sh         $v0, ($s4)
/* D0E48 800D0248 8E430030 */  lw         $v1, 0x30($s2)
/* D0E4C 800D024C 02201021 */  addu       $v0, $s1, $zero
/* D0E50 800D0250 00731821 */  addu       $v1, $v1, $s3
/* D0E54 800D0254 AE430030 */  sw         $v1, 0x30($s2)
.L800D0258:
/* D0E58 800D0258 8FBF0034 */  lw         $ra, 0x34($sp)
/* D0E5C 800D025C 8FB40030 */  lw         $s4, 0x30($sp)
/* D0E60 800D0260 8FB3002C */  lw         $s3, 0x2c($sp)
/* D0E64 800D0264 8FB20028 */  lw         $s2, 0x28($sp)
/* D0E68 800D0268 8FB10024 */  lw         $s1, 0x24($sp)
/* D0E6C 800D026C 8FB00020 */  lw         $s0, 0x20($sp)
/* D0E70 800D0270 03E00008 */  jr         $ra
/* D0E74 800D0274 27BD0038 */   addiu     $sp, $sp, 0x38

glabel _frexpf
/* D0E78 800D0278 44800000 */  mtc1       $zero, $f0
/* D0E7C 800D027C 44800800 */  mtc1       $zero, $f1
/* D0E80 800D0280 00000000 */  nop
/* D0E84 800D0284 46206032 */  c.eq.d     $f12, $f0
/* D0E88 800D0288 00000000 */  nop
/* D0E8C 800D028C 00000000 */  nop
/* D0E90 800D0290 45000003 */  bc1f       .L800D02A0
/* D0E94 800D0294 ACC00000 */   sw        $zero, ($a2)
/* D0E98 800D0298 080340D4 */  j          .L800D0350
/* D0E9C 800D029C 46206006 */   mov.d     $f0, $f12
.L800D02A0:
/* D0EA0 800D02A0 462C003C */  c.lt.d     $f0, $f12
/* D0EA4 800D02A4 00000000 */  nop
/* D0EA8 800D02A8 00000000 */  nop
/* D0EAC 800D02AC 45010002 */  bc1t       .L800D02B8
/* D0EB0 800D02B0 46206086 */   mov.d     $f2, $f12
/* D0EB4 800D02B4 46206087 */  neg.d      $f2, $f12
.L800D02B8:
/* D0EB8 800D02B8 3C01800E */  lui        $at, %hi(env_rodata_0048)
/* D0EBC 800D02BC D4205688 */  ldc1       $f0, %lo(env_rodata_0048)($at)
/* D0EC0 800D02C0 4622003E */  c.le.d     $f0, $f2
/* D0EC4 800D02C4 00000000 */  nop
/* D0EC8 800D02C8 4500000B */  bc1f       .L800D02F8
/* D0ECC 800D02CC 00000000 */   nop
/* D0ED0 800D02D0 3C01800E */  lui        $at, %hi(env_rodata_0050)
/* D0ED4 800D02D4 D4245690 */  ldc1       $f4, %lo(env_rodata_0050)($at)
.L800D02D8:
/* D0ED8 800D02D8 00000000 */  nop
/* D0EDC 800D02DC 46241082 */  mul.d      $f2, $f2, $f4
/* D0EE0 800D02E0 8CC20000 */  lw         $v0, ($a2)
/* D0EE4 800D02E4 4622003E */  c.le.d     $f0, $f2
/* D0EE8 800D02E8 24420001 */  addiu      $v0, $v0, 1
/* D0EEC 800D02EC 00000000 */  nop
/* D0EF0 800D02F0 4501FFF9 */  bc1t       .L800D02D8
/* D0EF4 800D02F4 ACC20000 */   sw        $v0, ($a2)
.L800D02F8:
/* D0EF8 800D02F8 3C01800E */  lui        $at, %hi(env_rodata_0058)
/* D0EFC 800D02FC D4205698 */  ldc1       $f0, %lo(env_rodata_0058)($at)
/* D0F00 800D0300 4620103C */  c.lt.d     $f2, $f0
/* D0F04 800D0304 00000000 */  nop
/* D0F08 800D0308 45000008 */  bc1f       .L800D032C
/* D0F0C 800D030C 00000000 */   nop
.L800D0310:
/* D0F10 800D0310 46221080 */  add.d      $f2, $f2, $f2
/* D0F14 800D0314 8CC20000 */  lw         $v0, ($a2)
/* D0F18 800D0318 4620103C */  c.lt.d     $f2, $f0
/* D0F1C 800D031C 2442FFFF */  addiu      $v0, $v0, -1
/* D0F20 800D0320 00000000 */  nop
/* D0F24 800D0324 4501FFFA */  bc1t       .L800D0310
/* D0F28 800D0328 ACC20000 */   sw        $v0, ($a2)
.L800D032C:
/* D0F2C 800D032C 44800000 */  mtc1       $zero, $f0
/* D0F30 800D0330 44800800 */  mtc1       $zero, $f1
/* D0F34 800D0334 00000000 */  nop
/* D0F38 800D0338 462C003C */  c.lt.d     $f0, $f12
/* D0F3C 800D033C 00000000 */  nop
/* D0F40 800D0340 00000000 */  nop
/* D0F44 800D0344 45010002 */  bc1t       .L800D0350
/* D0F48 800D0348 46201006 */   mov.d     $f0, $f2
/* D0F4C 800D034C 46200007 */  neg.d      $f0, $f0
.L800D0350:
/* D0F50 800D0350 03E00008 */  jr         $ra
/* D0F54 800D0354 00000000 */   nop

glabel _ldexpf
/* D0F58 800D0358 10C00006 */  beqz       $a2, .L800D0374
/* D0F5C 800D035C 24020001 */   addiu     $v0, $zero, 1
/* D0F60 800D0360 00C21004 */  sllv       $v0, $v0, $a2
/* D0F64 800D0364 44820000 */  mtc1       $v0, $f0
/* D0F68 800D0368 00000000 */  nop
/* D0F6C 800D036C 46800021 */  cvt.d.w    $f0, $f0
/* D0F70 800D0370 46206302 */  mul.d      $f12, $f12, $f0
.L800D0374:
/* D0F74 800D0374 03E00008 */  jr         $ra
/* D0F78 800D0378 46206006 */   mov.d     $f0, $f12

glabel _getRate
/* D0F7C 800D037C 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* D0F80 800D0380 8FA20058 */  lw         $v0, 0x58($sp)
/* D0F84 800D0384 3C01800E */  lui        $at, %hi(env_rodata_00A0)
/* D0F88 800D0388 D42256E0 */  ldc1       $f2, %lo(env_rodata_00A0)($at)
/* D0F8C 800D038C 8FA9005C */  lw         $t1, 0x5c($sp)
/* D0F90 800D0390 44820000 */  mtc1       $v0, $f0
/* D0F94 800D0394 00000000 */  nop
/* D0F98 800D0398 46800021 */  cvt.d.w    $f0, $f0
/* D0F9C 800D039C 1440000C */  bnez       $v0, .L800D03D0
/* D0FA0 800D03A0 46201103 */   div.d     $f4, $f2, $f0
/* D0FA4 800D03A4 462E603E */  c.le.d     $f12, $f14
/* D0FA8 800D03A8 00000000 */  nop
/* D0FAC 800D03AC 00000000 */  nop
/* D0FB0 800D03B0 45000004 */  bc1f       .L800D03C4
/* D0FB4 800D03B4 3402FFFF */   ori       $v0, $zero, 0xffff
/* D0FB8 800D03B8 A5220000 */  sh         $v0, ($t1)
/* D0FBC 800D03BC 0803417D */  j          .L800D05F4
/* D0FC0 800D03C0 24027FFF */   addiu     $v0, $zero, 0x7fff
.L800D03C4:
/* D0FC4 800D03C4 A5200000 */  sh         $zero, ($t1)
/* D0FC8 800D03C8 0803417D */  j          .L800D05F4
/* D0FCC 800D03CC 00001021 */   addu      $v0, $zero, $zero
.L800D03D0:
/* D0FD0 800D03D0 4622703C */  c.lt.d     $f14, $f2
/* D0FD4 800D03D4 00000000 */  nop
/* D0FD8 800D03D8 00000000 */  nop
/* D0FDC 800D03DC 45030001 */  bc1tl      .L800D03E4
/* D0FE0 800D03E0 46201386 */   mov.d     $f14, $f2
.L800D03E4:
/* D0FE4 800D03E4 44800000 */  mtc1       $zero, $f0
/* D0FE8 800D03E8 44800800 */  mtc1       $zero, $f1
/* D0FEC 800D03EC 00000000 */  nop
/* D0FF0 800D03F0 4620603E */  c.le.d     $f12, $f0
/* D0FF4 800D03F4 00000000 */  nop
/* D0FF8 800D03F8 00000000 */  nop
/* D0FFC 800D03FC 45030001 */  bc1tl      .L800D0404
/* D1000 800D0400 46201306 */   mov.d     $f12, $f2
.L800D0404:
/* D1004 800D0404 03A03821 */  addu       $a3, $sp, $zero
/* D1008 800D0408 3C06800E */  lui        $a2, %hi(env_rodata_0060)
/* D100C 800D040C 24C656A0 */  addiu      $a2, $a2, %lo(env_rodata_0060)
/* D1010 800D0410 24C80040 */  addiu      $t0, $a2, 0x40
.L800D0414:
/* D1014 800D0414 8CC20000 */  lw         $v0, ($a2)
/* D1018 800D0418 8CC30004 */  lw         $v1, 4($a2)
/* D101C 800D041C 8CC40008 */  lw         $a0, 8($a2)
/* D1020 800D0420 8CC5000C */  lw         $a1, 0xc($a2)
/* D1024 800D0424 ACE20000 */  sw         $v0, ($a3)
/* D1028 800D0428 ACE30004 */  sw         $v1, 4($a3)
/* D102C 800D042C ACE40008 */  sw         $a0, 8($a3)
/* D1030 800D0430 ACE5000C */  sw         $a1, 0xc($a3)
/* D1034 800D0434 24C60010 */  addiu      $a2, $a2, 0x10
/* D1038 800D0438 14C8FFF6 */  bne        $a2, $t0, .L800D0414
/* D103C 800D043C 24E70010 */   addiu     $a3, $a3, 0x10
/* D1040 800D0440 462C7303 */  div.d      $f12, $f14, $f12
/* D1044 800D0444 3C01800E */  lui        $at, %hi(env_rodata_00A8)
/* D1048 800D0448 D42056E8 */  ldc1       $f0, %lo(env_rodata_00A8)($at)
/* D104C 800D044C 46202002 */  mul.d      $f0, $f4, $f0
/* D1050 800D0450 44802000 */  mtc1       $zero, $f4
/* D1054 800D0454 44802800 */  mtc1       $zero, $f5
/* D1058 800D0458 00000000 */  nop
/* D105C 800D045C 46246032 */  c.eq.d     $f12, $f4
/* D1060 800D0460 4620008D */  trunc.w.d  $f2, $f0
/* D1064 800D0464 44041000 */  mfc1       $a0, $f2
/* D1068 800D0468 00000000 */  nop
/* D106C 800D046C 4501002E */  bc1t       .L800D0528
/* D1070 800D0470 AFA00040 */   sw        $zero, 0x40($sp)
/* D1074 800D0474 462C203C */  c.lt.d     $f4, $f12
/* D1078 800D0478 00000000 */  nop
/* D107C 800D047C 00000000 */  nop
/* D1080 800D0480 45010002 */  bc1t       .L800D048C
/* D1084 800D0484 46206086 */   mov.d     $f2, $f12
/* D1088 800D0488 46206087 */  neg.d      $f2, $f12
.L800D048C:
/* D108C 800D048C 3C01800E */  lui        $at, %hi(env_rodata_00B0)
/* D1090 800D0490 D42056F0 */  ldc1       $f0, %lo(env_rodata_00B0)($at)
/* D1094 800D0494 4622003E */  c.le.d     $f0, $f2
/* D1098 800D0498 00000000 */  nop
/* D109C 800D049C 4500000B */  bc1f       .L800D04CC
/* D10A0 800D04A0 00000000 */   nop
/* D10A4 800D04A4 3C01800E */  lui        $at, %hi(env_rodata_00B8)
/* D10A8 800D04A8 D42456F8 */  ldc1       $f4, %lo(env_rodata_00B8)($at)
.L800D04AC:
/* D10AC 800D04AC 00000000 */  nop
/* D10B0 800D04B0 46241082 */  mul.d      $f2, $f2, $f4
/* D10B4 800D04B4 8FA20040 */  lw         $v0, 0x40($sp)
/* D10B8 800D04B8 4622003E */  c.le.d     $f0, $f2
/* D10BC 800D04BC 24420001 */  addiu      $v0, $v0, 1
/* D10C0 800D04C0 00000000 */  nop
/* D10C4 800D04C4 4501FFF9 */  bc1t       .L800D04AC
/* D10C8 800D04C8 AFA20040 */   sw        $v0, 0x40($sp)
.L800D04CC:
/* D10CC 800D04CC 3C01800E */  lui        $at, %hi(env_rodata_00C0)
/* D10D0 800D04D0 D4205700 */  ldc1       $f0, %lo(env_rodata_00C0)($at)
/* D10D4 800D04D4 4620103C */  c.lt.d     $f2, $f0
/* D10D8 800D04D8 00000000 */  nop
/* D10DC 800D04DC 45000008 */  bc1f       .L800D0500
/* D10E0 800D04E0 00000000 */   nop
.L800D04E4:
/* D10E4 800D04E4 46221080 */  add.d      $f2, $f2, $f2
/* D10E8 800D04E8 8FA20040 */  lw         $v0, 0x40($sp)
/* D10EC 800D04EC 4620103C */  c.lt.d     $f2, $f0
/* D10F0 800D04F0 2442FFFF */  addiu      $v0, $v0, -1
/* D10F4 800D04F4 00000000 */  nop
/* D10F8 800D04F8 4501FFFA */  bc1t       .L800D04E4
/* D10FC 800D04FC AFA20040 */   sw        $v0, 0x40($sp)
.L800D0500:
/* D1100 800D0500 44800000 */  mtc1       $zero, $f0
/* D1104 800D0504 44800800 */  mtc1       $zero, $f1
/* D1108 800D0508 00000000 */  nop
/* D110C 800D050C 462C003C */  c.lt.d     $f0, $f12
/* D1110 800D0510 00000000 */  nop
/* D1114 800D0514 00000000 */  nop
/* D1118 800D0518 45010002 */  bc1t       .L800D0524
/* D111C 800D051C 46201006 */   mov.d     $f0, $f2
/* D1120 800D0520 46200007 */  neg.d      $f0, $f0
.L800D0524:
/* D1124 800D0524 46200306 */  mov.d      $f12, $f0
.L800D0528:
/* D1128 800D0528 3C01800E */  lui        $at, %hi(env_rodata_00C8)
/* D112C 800D052C D4205708 */  ldc1       $f0, %lo(env_rodata_00C8)($at)
/* D1130 800D0530 46206002 */  mul.d      $f0, $f12, $f0
/* D1134 800D0534 4620008D */  trunc.w.d  $f2, $f0
/* D1138 800D0538 44021000 */  mfc1       $v0, $f2
/* D113C 800D053C 00000000 */  nop
/* D1140 800D0540 000210C0 */  sll        $v0, $v0, 3
/* D1144 800D0544 005D1021 */  addu       $v0, $v0, $sp
/* D1148 800D0548 D440FFC0 */  ldc1       $f0, -0x40($v0)
/* D114C 800D054C C7A20040 */  lwc1       $f2, 0x40($sp)
/* D1150 800D0550 468010A1 */  cvt.d.w    $f2, $f2
/* D1154 800D0554 46220000 */  add.d      $f0, $f0, $f2
/* D1158 800D0558 3C01800E */  lui        $at, %hi(env_rodata_00D0)
/* D115C 800D055C D4225710 */  ldc1       $f2, %lo(env_rodata_00D0)($at)
/* D1160 800D0560 46220002 */  mul.d      $f0, $f0, $f2
/* D1164 800D0564 3C01800E */  lui        $at, %hi(env_rodata_00D8)
/* D1168 800D0568 D4225718 */  ldc1       $f2, %lo(env_rodata_00D8)($at)
/* D116C 800D056C 46220003 */  div.d      $f0, $f0, $f2
/* D1170 800D0570 3C01800E */  lui        $at, %hi(env_rodata_00E0)
/* D1174 800D0574 D4225720 */  ldc1       $f2, %lo(env_rodata_00E0)($at)
/* D1178 800D0578 10800007 */  beqz       $a0, .L800D0598
/* D117C 800D057C 46220000 */   add.d     $f0, $f0, $f2
.L800D0580:
/* D1180 800D0580 30820001 */  andi       $v0, $a0, 1
/* D1184 800D0584 54400001 */  bnel       $v0, $zero, .L800D058C
/* D1188 800D0588 46201082 */   mul.d     $f2, $f2, $f0
.L800D058C:
/* D118C 800D058C 00042043 */  sra        $a0, $a0, 1
/* D1190 800D0590 1480FFFB */  bnez       $a0, .L800D0580
/* D1194 800D0594 46200002 */   mul.d     $f0, $f0, $f0
.L800D0598:
/* D1198 800D0598 00000000 */  nop
/* D119C 800D059C 46221082 */  mul.d      $f2, $f2, $f2
/* D11A0 800D05A0 00000000 */  nop
/* D11A4 800D05A4 46221082 */  mul.d      $f2, $f2, $f2
/* D11A8 800D05A8 00000000 */  nop
/* D11AC 800D05AC 46221082 */  mul.d      $f2, $f2, $f2
/* D11B0 800D05B0 4620100D */  trunc.w.d  $f0, $f2
/* D11B4 800D05B4 44020000 */  mfc1       $v0, $f0
/* D11B8 800D05B8 00000000 */  nop
/* D11BC 800D05BC 00021400 */  sll        $v0, $v0, 0x10
/* D11C0 800D05C0 00021403 */  sra        $v0, $v0, 0x10
/* D11C4 800D05C4 44820000 */  mtc1       $v0, $f0
/* D11C8 800D05C8 00000000 */  nop
/* D11CC 800D05CC 46800020 */  cvt.s.w    $f0, $f0
/* D11D0 800D05D0 46000021 */  cvt.d.s    $f0, $f0
/* D11D4 800D05D4 46201001 */  sub.d      $f0, $f2, $f0
/* D11D8 800D05D8 3C01800E */  lui        $at, %hi(env_rodata_00E8)
/* D11DC 800D05DC D4225728 */  ldc1       $f2, %lo(env_rodata_00E8)($at)
/* D11E0 800D05E0 46220002 */  mul.d      $f0, $f0, $f2
/* D11E4 800D05E4 4620008D */  trunc.w.d  $f2, $f0
/* D11E8 800D05E8 44031000 */  mfc1       $v1, $f2
/* D11EC 800D05EC 00000000 */  nop
/* D11F0 800D05F0 A5230000 */  sh         $v1, ($t1)
.L800D05F4:
/* D11F4 800D05F4 03E00008 */  jr         $ra
/* D11F8 800D05F8 27BD0048 */   addiu     $sp, $sp, 0x48

glabel _getVol
/* D11FC 800D05FC 000528C3 */  sra        $a1, $a1, 3
/* D1200 800D0600 14A00003 */  bnez       $a1, .L800D0610
/* D1204 800D0604 00061400 */   sll       $v0, $a2, 0x10
/* D1208 800D0608 0803419E */  j          .L800D0678
/* D120C 800D060C 46006006 */   mov.s     $f0, $f12
.L800D0610:
/* D1210 800D0610 44821000 */  mtc1       $v0, $f2
/* D1214 800D0614 00000000 */  nop
/* D1218 800D0618 468010A0 */  cvt.s.w    $f2, $f2
/* D121C 800D061C 30E2FFFF */  andi       $v0, $a3, 0xffff
/* D1220 800D0620 44820000 */  mtc1       $v0, $f0
/* D1224 800D0624 00000000 */  nop
/* D1228 800D0628 46800020 */  cvt.s.w    $f0, $f0
/* D122C 800D062C 46001080 */  add.s      $f2, $f2, $f0
/* D1230 800D0630 3C014780 */  lui        $at, 0x4780
/* D1234 800D0634 44810000 */  mtc1       $at, $f0
/* D1238 800D0638 3C013F80 */  lui        $at, 0x3f80
/* D123C 800D063C 44812000 */  mtc1       $at, $f4
/* D1240 800D0640 00001821 */  addu       $v1, $zero, $zero
/* D1244 800D0644 46001083 */  div.s      $f2, $f2, $f0
.L800D0648:
/* D1248 800D0648 30A20001 */  andi       $v0, $a1, 1
/* D124C 800D064C 54400001 */  bnel       $v0, $zero, .L800D0654
/* D1250 800D0650 46022102 */   mul.s     $f4, $f4, $f2
.L800D0654:
/* D1254 800D0654 00052843 */  sra        $a1, $a1, 1
/* D1258 800D0658 50A00007 */  beql       $a1, $zero, .L800D0678
/* D125C 800D065C 46046002 */   mul.s     $f0, $f12, $f4
/* D1260 800D0660 24630001 */  addiu      $v1, $v1, 1
/* D1264 800D0664 28620020 */  slti       $v0, $v1, 0x20
/* D1268 800D0668 1440FFF7 */  bnez       $v0, .L800D0648
/* D126C 800D066C 46021082 */   mul.s     $f2, $f2, $f2
/* D1270 800D0670 00000000 */  nop
/* D1274 800D0674 46046002 */  mul.s      $f0, $f12, $f4
.L800D0678:
/* D1278 800D0678 03E00008 */  jr         $ra
/* D127C 800D067C 00000000 */   nop

glabel alFilterNew
/* D1280 800D0680 AC800000 */  sw         $zero, ($a0)
/* D1284 800D0684 AC850004 */  sw         $a1, 4($a0)
/* D1288 800D0688 AC860008 */  sw         $a2, 8($a0)
/* D128C 800D068C A480000C */  sh         $zero, 0xc($a0)
/* D1290 800D0690 A480000E */  sh         $zero, 0xe($a0)
/* D1294 800D0694 03E00008 */  jr         $ra
/* D1298 800D0698 AC870010 */   sw        $a3, 0x10($a0)
/* D129C 800D069C 00000000 */  nop
