.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800BBAF0
/* BC6F0 800BBAF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BC6F4 800BBAF4 AFB00010 */  sw         $s0, 0x10($sp)
/* BC6F8 800BBAF8 00808021 */  addu       $s0, $a0, $zero
/* BC6FC 800BBAFC AFBF0014 */  sw         $ra, 0x14($sp)
/* BC700 800BBB00 8E030078 */  lw         $v1, 0x78($s0)
/* BC704 800BBB04 84640010 */  lh         $a0, 0x10($v1)
/* BC708 800BBB08 8C620014 */  lw         $v0, 0x14($v1)
/* BC70C 800BBB0C 0040F809 */  jalr       $v0
/* BC710 800BBB10 02042021 */   addu      $a0, $s0, $a0
/* BC714 800BBB14 50400012 */  beql       $v0, $zero, .L800BBB60
/* BC718 800BBB18 8E030040 */   lw        $v1, 0x40($s0)
/* BC71C 800BBB1C 8E030078 */  lw         $v1, 0x78($s0)
/* BC720 800BBB20 84640010 */  lh         $a0, 0x10($v1)
/* BC724 800BBB24 8C620014 */  lw         $v0, 0x14($v1)
/* BC728 800BBB28 0040F809 */  jalr       $v0
/* BC72C 800BBB2C 02042021 */   addu      $a0, $s0, $a0
/* BC730 800BBB30 24030001 */  addiu      $v1, $zero, 1
/* BC734 800BBB34 5043000A */  beql       $v0, $v1, .L800BBB60
/* BC738 800BBB38 8E030040 */   lw        $v1, 0x40($s0)
/* BC73C 800BBB3C 8E030078 */  lw         $v1, 0x78($s0)
/* BC740 800BBB40 84640010 */  lh         $a0, 0x10($v1)
/* BC744 800BBB44 8C620014 */  lw         $v0, 0x14($v1)
/* BC748 800BBB48 0040F809 */  jalr       $v0
/* BC74C 800BBB4C 02042021 */   addu      $a0, $s0, $a0
/* BC750 800BBB50 24030002 */  addiu      $v1, $zero, 2
/* BC754 800BBB54 14430003 */  bne        $v0, $v1, .L800BBB64
/* BC758 800BBB58 00001021 */   addu      $v0, $zero, $zero
/* BC75C 800BBB5C 8E030040 */  lw         $v1, 0x40($s0)
.L800BBB60:
/* BC760 800BBB60 8C620000 */  lw         $v0, ($v1)
.L800BBB64:
/* BC764 800BBB64 8FBF0014 */  lw         $ra, 0x14($sp)
/* BC768 800BBB68 8FB00010 */  lw         $s0, 0x10($sp)
/* BC76C 800BBB6C 03E00008 */  jr         $ra
/* BC770 800BBB70 27BD0018 */   addiu     $sp, $sp, 0x18

glabel utilities_func
/* BC774 800BBB74 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BC778 800BBB78 AFB00010 */  sw         $s0, 0x10($sp)
/* BC77C 800BBB7C 00808021 */  addu       $s0, $a0, $zero
/* BC780 800BBB80 AFB3001C */  sw         $s3, 0x1c($sp)
/* BC784 800BBB84 00A09821 */  addu       $s3, $a1, $zero
/* BC788 800BBB88 AFBF0020 */  sw         $ra, 0x20($sp)
/* BC78C 800BBB8C AFB20018 */  sw         $s2, 0x18($sp)
/* BC790 800BBB90 AFB10014 */  sw         $s1, 0x14($sp)
/* BC794 800BBB94 8E030078 */  lw         $v1, 0x78($s0)
/* BC798 800BBB98 00C09021 */  addu       $s2, $a2, $zero
/* BC79C 800BBB9C 84640010 */  lh         $a0, 0x10($v1)
/* BC7A0 800BBBA0 8C620014 */  lw         $v0, 0x14($v1)
/* BC7A4 800BBBA4 0040F809 */  jalr       $v0
/* BC7A8 800BBBA8 02042021 */   addu      $a0, $s0, $a0
/* BC7AC 800BBBAC 10400010 */  beqz       $v0, .L800BBBF0
/* BC7B0 800BBBB0 8E030078 */   lw        $v1, 0x78($s0)
/* BC7B4 800BBBB4 84640010 */  lh         $a0, 0x10($v1)
/* BC7B8 800BBBB8 8C620014 */  lw         $v0, 0x14($v1)
/* BC7BC 800BBBBC 0040F809 */  jalr       $v0
/* BC7C0 800BBBC0 02042021 */   addu      $a0, $s0, $a0
/* BC7C4 800BBBC4 24030001 */  addiu      $v1, $zero, 1
/* BC7C8 800BBBC8 10430009 */  beq        $v0, $v1, .L800BBBF0
/* BC7CC 800BBBCC 8E030078 */   lw        $v1, 0x78($s0)
/* BC7D0 800BBBD0 84640010 */  lh         $a0, 0x10($v1)
/* BC7D4 800BBBD4 8C620014 */  lw         $v0, 0x14($v1)
/* BC7D8 800BBBD8 0040F809 */  jalr       $v0
/* BC7DC 800BBBDC 02042021 */   addu      $a0, $s0, $a0
/* BC7E0 800BBBE0 24030002 */  addiu      $v1, $zero, 2
/* BC7E4 800BBBE4 14430052 */  bne        $v0, $v1, .L800BBD30
/* BC7E8 800BBBE8 8FBF0020 */   lw        $ra, 0x20($sp)
/* BC7EC 800BBBEC 8E030078 */  lw         $v1, 0x78($s0)
.L800BBBF0:
/* BC7F0 800BBBF0 84640010 */  lh         $a0, 0x10($v1)
/* BC7F4 800BBBF4 8C620014 */  lw         $v0, 0x14($v1)
/* BC7F8 800BBBF8 0040F809 */  jalr       $v0
/* BC7FC 800BBBFC 02042021 */   addu      $a0, $s0, $a0
/* BC800 800BBC00 54400011 */  bnel       $v0, $zero, .L800BBC48
/* BC804 800BBC04 8E030078 */   lw        $v1, 0x78($s0)
/* BC808 800BBC08 12400028 */  beqz       $s2, .L800BBCAC
/* BC80C 800BBC0C 8E110040 */   lw        $s1, 0x40($s0)
/* BC810 800BBC10 3C10800E */  lui        $s0, %hi(D_800E4970)
/* BC814 800BBC14 26104970 */  addiu      $s0, $s0, %lo(D_800E4970)
/* BC818 800BBC18 02002821 */  addu       $a1, $s0, $zero
/* BC81C 800BBC1C 8E240000 */  lw         $a0, ($s1)
/* BC820 800BBC20 0C02600C */  jal        Free
/* BC824 800BBC24 2406009F */   addiu     $a2, $zero, 0x9f
/* BC828 800BBC28 0C03353E */  jal        strlen
/* BC82C 800BBC2C 02602021 */   addu      $a0, $s3, $zero
/* BC830 800BBC30 02002821 */  addu       $a1, $s0, $zero
/* BC834 800BBC34 24420001 */  addiu      $v0, $v0, 1
/* BC838 800BBC38 A6220004 */  sh         $v0, 4($s1)
/* BC83C 800BBC3C 3044FFFF */  andi       $a0, $v0, 0xffff
/* BC840 800BBC40 0802EF28 */  j          .L800BBCA0
/* BC844 800BBC44 240600A2 */   addiu     $a2, $zero, 0xa2
.L800BBC48:
/* BC848 800BBC48 84640010 */  lh         $a0, 0x10($v1)
/* BC84C 800BBC4C 8C620014 */  lw         $v0, 0x14($v1)
/* BC850 800BBC50 0040F809 */  jalr       $v0
/* BC854 800BBC54 02042021 */   addu      $a0, $s0, $a0
/* BC858 800BBC58 24030001 */  addiu      $v1, $zero, 1
/* BC85C 800BBC5C 54430018 */  bnel       $v0, $v1, .L800BBCC0
/* BC860 800BBC60 8E030078 */   lw        $v1, 0x78($s0)
/* BC864 800BBC64 12400011 */  beqz       $s2, .L800BBCAC
/* BC868 800BBC68 8E110040 */   lw        $s1, 0x40($s0)
/* BC86C 800BBC6C 3C10800E */  lui        $s0, %hi(D_800E4970)
/* BC870 800BBC70 26104970 */  addiu      $s0, $s0, %lo(D_800E4970)
/* BC874 800BBC74 02002821 */  addu       $a1, $s0, $zero
/* BC878 800BBC78 8E240000 */  lw         $a0, ($s1)
/* BC87C 800BBC7C 0C02600C */  jal        Free
/* BC880 800BBC80 240600AE */   addiu     $a2, $zero, 0xae
/* BC884 800BBC84 0C03353E */  jal        strlen
/* BC888 800BBC88 02602021 */   addu      $a0, $s3, $zero
/* BC88C 800BBC8C 02002821 */  addu       $a1, $s0, $zero
/* BC890 800BBC90 24420001 */  addiu      $v0, $v0, 1
/* BC894 800BBC94 A6220004 */  sh         $v0, 4($s1)
/* BC898 800BBC98 3044FFFF */  andi       $a0, $v0, 0xffff
/* BC89C 800BBC9C 240600B1 */  addiu      $a2, $zero, 0xb1
.L800BBCA0:
/* BC8A0 800BBCA0 0C025F9C */  jal        Malloc
/* BC8A4 800BBCA4 00000000 */   nop
/* BC8A8 800BBCA8 AE220000 */  sw         $v0, ($s1)
.L800BBCAC:
/* BC8AC 800BBCAC 8E240000 */  lw         $a0, ($s1)
/* BC8B0 800BBCB0 0C0333AC */  jal        sprintf
/* BC8B4 800BBCB4 02602821 */   addu      $a1, $s3, $zero
/* BC8B8 800BBCB8 0802EF4C */  j          .L800BBD30
/* BC8BC 800BBCBC 8FBF0020 */   lw        $ra, 0x20($sp)
.L800BBCC0:
/* BC8C0 800BBCC0 84640010 */  lh         $a0, 0x10($v1)
/* BC8C4 800BBCC4 8C620014 */  lw         $v0, 0x14($v1)
/* BC8C8 800BBCC8 0040F809 */  jalr       $v0
/* BC8CC 800BBCCC 02042021 */   addu      $a0, $s0, $a0
/* BC8D0 800BBCD0 24030002 */  addiu      $v1, $zero, 2
/* BC8D4 800BBCD4 14430016 */  bne        $v0, $v1, .L800BBD30
/* BC8D8 800BBCD8 8FBF0020 */   lw        $ra, 0x20($sp)
/* BC8DC 800BBCDC 12400010 */  beqz       $s2, .L800BBD20
/* BC8E0 800BBCE0 8E110040 */   lw        $s1, 0x40($s0)
/* BC8E4 800BBCE4 3C10800E */  lui        $s0, %hi(D_800E4970)
/* BC8E8 800BBCE8 26104970 */  addiu      $s0, $s0, %lo(D_800E4970)
/* BC8EC 800BBCEC 02002821 */  addu       $a1, $s0, $zero
/* BC8F0 800BBCF0 8E240000 */  lw         $a0, ($s1)
/* BC8F4 800BBCF4 0C02600C */  jal        Free
/* BC8F8 800BBCF8 240600BD */   addiu     $a2, $zero, 0xbd
/* BC8FC 800BBCFC 0C03353E */  jal        strlen
/* BC900 800BBD00 02602021 */   addu      $a0, $s3, $zero
/* BC904 800BBD04 02002821 */  addu       $a1, $s0, $zero
/* BC908 800BBD08 24420001 */  addiu      $v0, $v0, 1
/* BC90C 800BBD0C A6220004 */  sh         $v0, 4($s1)
/* BC910 800BBD10 3044FFFF */  andi       $a0, $v0, 0xffff
/* BC914 800BBD14 0C025F9C */  jal        Malloc
/* BC918 800BBD18 240600C0 */   addiu     $a2, $zero, 0xc0
/* BC91C 800BBD1C AE220000 */  sw         $v0, ($s1)
.L800BBD20:
/* BC920 800BBD20 8E240000 */  lw         $a0, ($s1)
/* BC924 800BBD24 0C0333AC */  jal        sprintf
/* BC928 800BBD28 02602821 */   addu      $a1, $s3, $zero
/* BC92C 800BBD2C 8FBF0020 */  lw         $ra, 0x20($sp)
.L800BBD30:
/* BC930 800BBD30 8FB3001C */  lw         $s3, 0x1c($sp)
/* BC934 800BBD34 8FB20018 */  lw         $s2, 0x18($sp)
/* BC938 800BBD38 8FB10014 */  lw         $s1, 0x14($sp)
/* BC93C 800BBD3C 8FB00010 */  lw         $s0, 0x10($sp)
/* BC940 800BBD40 03E00008 */  jr         $ra
/* BC944 800BBD44 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BBD48
/* BC948 800BBD48 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BC94C 800BBD4C AFB00010 */  sw         $s0, 0x10($sp)
/* BC950 800BBD50 00808021 */  addu       $s0, $a0, $zero
/* BC954 800BBD54 00052C00 */  sll        $a1, $a1, 0x10
/* BC958 800BBD58 AFB10014 */  sw         $s1, 0x14($sp)
/* BC95C 800BBD5C 00058C03 */  sra        $s1, $a1, 0x10
/* BC960 800BBD60 00063400 */  sll        $a2, $a2, 0x10
/* BC964 800BBD64 AFBF001C */  sw         $ra, 0x1c($sp)
/* BC968 800BBD68 AFB20018 */  sw         $s2, 0x18($sp)
/* BC96C 800BBD6C 8E030078 */  lw         $v1, 0x78($s0)
/* BC970 800BBD70 00069403 */  sra        $s2, $a2, 0x10
/* BC974 800BBD74 84640010 */  lh         $a0, 0x10($v1)
/* BC978 800BBD78 8C620014 */  lw         $v0, 0x14($v1)
/* BC97C 800BBD7C 0040F809 */  jalr       $v0
/* BC980 800BBD80 02042021 */   addu      $a0, $s0, $a0
/* BC984 800BBD84 54400004 */  bnel       $v0, $zero, .L800BBD98
/* BC988 800BBD88 8E030078 */   lw        $v1, 0x78($s0)
/* BC98C 800BBD8C A6110064 */  sh         $s1, 0x64($s0)
/* BC990 800BBD90 0802EF78 */  j          .L800BBDE0
/* BC994 800BBD94 A6120066 */   sh        $s2, 0x66($s0)
.L800BBD98:
/* BC998 800BBD98 84640010 */  lh         $a0, 0x10($v1)
/* BC99C 800BBD9C 8C620014 */  lw         $v0, 0x14($v1)
/* BC9A0 800BBDA0 0040F809 */  jalr       $v0
/* BC9A4 800BBDA4 02042021 */   addu      $a0, $s0, $a0
/* BC9A8 800BBDA8 24030001 */  addiu      $v1, $zero, 1
/* BC9AC 800BBDAC 5043000A */  beql       $v0, $v1, .L800BBDD8
/* BC9B0 800BBDB0 8E020040 */   lw        $v0, 0x40($s0)
/* BC9B4 800BBDB4 8E030078 */  lw         $v1, 0x78($s0)
/* BC9B8 800BBDB8 84640010 */  lh         $a0, 0x10($v1)
/* BC9BC 800BBDBC 8C620014 */  lw         $v0, 0x14($v1)
/* BC9C0 800BBDC0 0040F809 */  jalr       $v0
/* BC9C4 800BBDC4 02042021 */   addu      $a0, $s0, $a0
/* BC9C8 800BBDC8 24030002 */  addiu      $v1, $zero, 2
/* BC9CC 800BBDCC 14430005 */  bne        $v0, $v1, .L800BBDE4
/* BC9D0 800BBDD0 8FBF001C */   lw        $ra, 0x1c($sp)
/* BC9D4 800BBDD4 8E020040 */  lw         $v0, 0x40($s0)
.L800BBDD8:
/* BC9D8 800BBDD8 A4510010 */  sh         $s1, 0x10($v0)
/* BC9DC 800BBDDC A4520012 */  sh         $s2, 0x12($v0)
.L800BBDE0:
/* BC9E0 800BBDE0 8FBF001C */  lw         $ra, 0x1c($sp)
.L800BBDE4:
/* BC9E4 800BBDE4 8FB20018 */  lw         $s2, 0x18($sp)
/* BC9E8 800BBDE8 8FB10014 */  lw         $s1, 0x14($sp)
/* BC9EC 800BBDEC 8FB00010 */  lw         $s0, 0x10($sp)
/* BC9F0 800BBDF0 03E00008 */  jr         $ra
/* BC9F4 800BBDF4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BBDF8
/* BC9F8 800BBDF8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BC9FC 800BBDFC AFB00010 */  sw         $s0, 0x10($sp)
/* BCA00 800BBE00 00808021 */  addu       $s0, $a0, $zero
/* BCA04 800BBE04 00052C00 */  sll        $a1, $a1, 0x10
/* BCA08 800BBE08 AFBF0018 */  sw         $ra, 0x18($sp)
/* BCA0C 800BBE0C AFB10014 */  sw         $s1, 0x14($sp)
/* BCA10 800BBE10 8E030078 */  lw         $v1, 0x78($s0)
/* BCA14 800BBE14 00058C03 */  sra        $s1, $a1, 0x10
/* BCA18 800BBE18 84640010 */  lh         $a0, 0x10($v1)
/* BCA1C 800BBE1C 8C620014 */  lw         $v0, 0x14($v1)
/* BCA20 800BBE20 0040F809 */  jalr       $v0
/* BCA24 800BBE24 02042021 */   addu      $a0, $s0, $a0
/* BCA28 800BBE28 54400003 */  bnel       $v0, $zero, .L800BBE38
/* BCA2C 800BBE2C 8E030078 */   lw        $v1, 0x78($s0)
/* BCA30 800BBE30 0802EF9F */  j          .L800BBE7C
/* BCA34 800BBE34 A6110064 */   sh        $s1, 0x64($s0)
.L800BBE38:
/* BCA38 800BBE38 84640010 */  lh         $a0, 0x10($v1)
/* BCA3C 800BBE3C 8C620014 */  lw         $v0, 0x14($v1)
/* BCA40 800BBE40 0040F809 */  jalr       $v0
/* BCA44 800BBE44 02042021 */   addu      $a0, $s0, $a0
/* BCA48 800BBE48 24030001 */  addiu      $v1, $zero, 1
/* BCA4C 800BBE4C 5043000A */  beql       $v0, $v1, .L800BBE78
/* BCA50 800BBE50 8E020040 */   lw        $v0, 0x40($s0)
/* BCA54 800BBE54 8E030078 */  lw         $v1, 0x78($s0)
/* BCA58 800BBE58 84640010 */  lh         $a0, 0x10($v1)
/* BCA5C 800BBE5C 8C620014 */  lw         $v0, 0x14($v1)
/* BCA60 800BBE60 0040F809 */  jalr       $v0
/* BCA64 800BBE64 02042021 */   addu      $a0, $s0, $a0
/* BCA68 800BBE68 24030002 */  addiu      $v1, $zero, 2
/* BCA6C 800BBE6C 14430004 */  bne        $v0, $v1, .L800BBE80
/* BCA70 800BBE70 8FBF0018 */   lw        $ra, 0x18($sp)
/* BCA74 800BBE74 8E020040 */  lw         $v0, 0x40($s0)
.L800BBE78:
/* BCA78 800BBE78 A4510010 */  sh         $s1, 0x10($v0)
.L800BBE7C:
/* BCA7C 800BBE7C 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BBE80:
/* BCA80 800BBE80 8FB10014 */  lw         $s1, 0x14($sp)
/* BCA84 800BBE84 8FB00010 */  lw         $s0, 0x10($sp)
/* BCA88 800BBE88 03E00008 */  jr         $ra
/* BCA8C 800BBE8C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BBE90
/* BCA90 800BBE90 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BCA94 800BBE94 AFB00010 */  sw         $s0, 0x10($sp)
/* BCA98 800BBE98 00808021 */  addu       $s0, $a0, $zero
/* BCA9C 800BBE9C 00052C00 */  sll        $a1, $a1, 0x10
/* BCAA0 800BBEA0 AFBF0018 */  sw         $ra, 0x18($sp)
/* BCAA4 800BBEA4 AFB10014 */  sw         $s1, 0x14($sp)
/* BCAA8 800BBEA8 8E030078 */  lw         $v1, 0x78($s0)
/* BCAAC 800BBEAC 00058C03 */  sra        $s1, $a1, 0x10
/* BCAB0 800BBEB0 84640010 */  lh         $a0, 0x10($v1)
/* BCAB4 800BBEB4 8C620014 */  lw         $v0, 0x14($v1)
/* BCAB8 800BBEB8 0040F809 */  jalr       $v0
/* BCABC 800BBEBC 02042021 */   addu      $a0, $s0, $a0
/* BCAC0 800BBEC0 54400003 */  bnel       $v0, $zero, .L800BBED0
/* BCAC4 800BBEC4 8E030078 */   lw        $v1, 0x78($s0)
/* BCAC8 800BBEC8 0802EFC5 */  j          .L800BBF14
/* BCACC 800BBECC A6110066 */   sh        $s1, 0x66($s0)
.L800BBED0:
/* BCAD0 800BBED0 84640010 */  lh         $a0, 0x10($v1)
/* BCAD4 800BBED4 8C620014 */  lw         $v0, 0x14($v1)
/* BCAD8 800BBED8 0040F809 */  jalr       $v0
/* BCADC 800BBEDC 02042021 */   addu      $a0, $s0, $a0
/* BCAE0 800BBEE0 24030001 */  addiu      $v1, $zero, 1
/* BCAE4 800BBEE4 5043000A */  beql       $v0, $v1, .L800BBF10
/* BCAE8 800BBEE8 8E020040 */   lw        $v0, 0x40($s0)
/* BCAEC 800BBEEC 8E030078 */  lw         $v1, 0x78($s0)
/* BCAF0 800BBEF0 84640010 */  lh         $a0, 0x10($v1)
/* BCAF4 800BBEF4 8C620014 */  lw         $v0, 0x14($v1)
/* BCAF8 800BBEF8 0040F809 */  jalr       $v0
/* BCAFC 800BBEFC 02042021 */   addu      $a0, $s0, $a0
/* BCB00 800BBF00 24030002 */  addiu      $v1, $zero, 2
/* BCB04 800BBF04 14430004 */  bne        $v0, $v1, .L800BBF18
/* BCB08 800BBF08 8FBF0018 */   lw        $ra, 0x18($sp)
/* BCB0C 800BBF0C 8E020040 */  lw         $v0, 0x40($s0)
.L800BBF10:
/* BCB10 800BBF10 A4510012 */  sh         $s1, 0x12($v0)
.L800BBF14:
/* BCB14 800BBF14 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BBF18:
/* BCB18 800BBF18 8FB10014 */  lw         $s1, 0x14($sp)
/* BCB1C 800BBF1C 8FB00010 */  lw         $s0, 0x10($sp)
/* BCB20 800BBF20 03E00008 */  jr         $ra
/* BCB24 800BBF24 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BBF28
/* BCB28 800BBF28 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BCB2C 800BBF2C AFB00010 */  sw         $s0, 0x10($sp)
/* BCB30 800BBF30 00808021 */  addu       $s0, $a0, $zero
/* BCB34 800BBF34 AFBF0014 */  sw         $ra, 0x14($sp)
/* BCB38 800BBF38 F7B60020 */  sdc1       $f22, 0x20($sp)
/* BCB3C 800BBF3C F7B40018 */  sdc1       $f20, 0x18($sp)
/* BCB40 800BBF40 8E030078 */  lw         $v1, 0x78($s0)
/* BCB44 800BBF44 4485A000 */  mtc1       $a1, $f20
/* BCB48 800BBF48 4486B000 */  mtc1       $a2, $f22
/* BCB4C 800BBF4C 84640010 */  lh         $a0, 0x10($v1)
/* BCB50 800BBF50 8C620014 */  lw         $v0, 0x14($v1)
/* BCB54 800BBF54 0040F809 */  jalr       $v0
/* BCB58 800BBF58 02042021 */   addu      $a0, $s0, $a0
/* BCB5C 800BBF5C 50400012 */  beql       $v0, $zero, .L800BBFA8
/* BCB60 800BBF60 8E020040 */   lw        $v0, 0x40($s0)
/* BCB64 800BBF64 8E030078 */  lw         $v1, 0x78($s0)
/* BCB68 800BBF68 84640010 */  lh         $a0, 0x10($v1)
/* BCB6C 800BBF6C 8C620014 */  lw         $v0, 0x14($v1)
/* BCB70 800BBF70 0040F809 */  jalr       $v0
/* BCB74 800BBF74 02042021 */   addu      $a0, $s0, $a0
/* BCB78 800BBF78 24030001 */  addiu      $v1, $zero, 1
/* BCB7C 800BBF7C 5043000A */  beql       $v0, $v1, .L800BBFA8
/* BCB80 800BBF80 8E020040 */   lw        $v0, 0x40($s0)
/* BCB84 800BBF84 8E030078 */  lw         $v1, 0x78($s0)
/* BCB88 800BBF88 84640010 */  lh         $a0, 0x10($v1)
/* BCB8C 800BBF8C 8C620014 */  lw         $v0, 0x14($v1)
/* BCB90 800BBF90 0040F809 */  jalr       $v0
/* BCB94 800BBF94 02042021 */   addu      $a0, $s0, $a0
/* BCB98 800BBF98 24030002 */  addiu      $v1, $zero, 2
/* BCB9C 800BBF9C 14430005 */  bne        $v0, $v1, .L800BBFB4
/* BCBA0 800BBFA0 8FBF0014 */   lw        $ra, 0x14($sp)
/* BCBA4 800BBFA4 8E020040 */  lw         $v0, 0x40($s0)
.L800BBFA8:
/* BCBA8 800BBFA8 E4540008 */  swc1       $f20, 8($v0)
/* BCBAC 800BBFAC E456000C */  swc1       $f22, 0xc($v0)
/* BCBB0 800BBFB0 8FBF0014 */  lw         $ra, 0x14($sp)
.L800BBFB4:
/* BCBB4 800BBFB4 8FB00010 */  lw         $s0, 0x10($sp)
/* BCBB8 800BBFB8 D7B60020 */  ldc1       $f22, 0x20($sp)
/* BCBBC 800BBFBC D7B40018 */  ldc1       $f20, 0x18($sp)
/* BCBC0 800BBFC0 03E00008 */  jr         $ra
/* BCBC4 800BBFC4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BBFC8
/* BCBC8 800BBFC8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BCBCC 800BBFCC AFB10014 */  sw         $s1, 0x14($sp)
/* BCBD0 800BBFD0 00808821 */  addu       $s1, $a0, $zero
/* BCBD4 800BBFD4 AFBF0018 */  sw         $ra, 0x18($sp)
/* BCBD8 800BBFD8 AFB00010 */  sw         $s0, 0x10($sp)
/* BCBDC 800BBFDC 8E230078 */  lw         $v1, 0x78($s1)
/* BCBE0 800BBFE0 30B0FFFF */  andi       $s0, $a1, 0xffff
/* BCBE4 800BBFE4 84640010 */  lh         $a0, 0x10($v1)
/* BCBE8 800BBFE8 8C620014 */  lw         $v0, 0x14($v1)
/* BCBEC 800BBFEC 0040F809 */  jalr       $v0
/* BCBF0 800BBFF0 02242021 */   addu      $a0, $s1, $a0
/* BCBF4 800BBFF4 00401821 */  addu       $v1, $v0, $zero
/* BCBF8 800BBFF8 24020009 */  addiu      $v0, $zero, 9
/* BCBFC 800BBFFC 1062000F */  beq        $v1, $v0, .L800BC03C
/* BCC00 800BC000 2862000A */   slti      $v0, $v1, 0xa
/* BCC04 800BC004 10400005 */  beqz       $v0, .L800BC01C
/* BCC08 800BC008 24020008 */   addiu     $v0, $zero, 8
/* BCC0C 800BC00C 10620008 */  beq        $v1, $v0, .L800BC030
/* BCC10 800BC010 8FBF0018 */   lw        $ra, 0x18($sp)
/* BCC14 800BC014 0802F016 */  j          .L800BC058
/* BCC18 800BC018 8FB10014 */   lw        $s1, 0x14($sp)
.L800BC01C:
/* BCC1C 800BC01C 2402000B */  addiu      $v0, $zero, 0xb
/* BCC20 800BC020 10620009 */  beq        $v1, $v0, .L800BC048
/* BCC24 800BC024 8FBF0018 */   lw        $ra, 0x18($sp)
/* BCC28 800BC028 0802F016 */  j          .L800BC058
/* BCC2C 800BC02C 8FB10014 */   lw        $s1, 0x14($sp)
.L800BC030:
/* BCC30 800BC030 8E220040 */  lw         $v0, 0x40($s1)
/* BCC34 800BC034 0802F014 */  j          .L800BC050
/* BCC38 800BC038 A0500022 */   sb        $s0, 0x22($v0)
.L800BC03C:
/* BCC3C 800BC03C 8E220040 */  lw         $v0, 0x40($s1)
/* BCC40 800BC040 0802F014 */  j          .L800BC050
/* BCC44 800BC044 A4500008 */   sh        $s0, 8($v0)
.L800BC048:
/* BCC48 800BC048 8E220040 */  lw         $v0, 0x40($s1)
/* BCC4C 800BC04C A0500013 */  sb         $s0, 0x13($v0)
.L800BC050:
/* BCC50 800BC050 8FBF0018 */  lw         $ra, 0x18($sp)
/* BCC54 800BC054 8FB10014 */  lw         $s1, 0x14($sp)
.L800BC058:
/* BCC58 800BC058 8FB00010 */  lw         $s0, 0x10($sp)
/* BCC5C 800BC05C 03E00008 */  jr         $ra
/* BCC60 800BC060 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC064
/* BCC64 800BC064 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BCC68 800BC068 AFB00010 */  sw         $s0, 0x10($sp)
/* BCC6C 800BC06C 00808021 */  addu       $s0, $a0, $zero
/* BCC70 800BC070 AFBF0018 */  sw         $ra, 0x18($sp)
/* BCC74 800BC074 AFB10014 */  sw         $s1, 0x14($sp)
/* BCC78 800BC078 8E030078 */  lw         $v1, 0x78($s0)
/* BCC7C 800BC07C 30B1FFFF */  andi       $s1, $a1, 0xffff
/* BCC80 800BC080 84640010 */  lh         $a0, 0x10($v1)
/* BCC84 800BC084 8C620014 */  lw         $v0, 0x14($v1)
/* BCC88 800BC088 0040F809 */  jalr       $v0
/* BCC8C 800BC08C 02042021 */   addu      $a0, $s0, $a0
/* BCC90 800BC090 00401821 */  addu       $v1, $v0, $zero
/* BCC94 800BC094 24020008 */  addiu      $v0, $zero, 8
/* BCC98 800BC098 10620003 */  beq        $v1, $v0, .L800BC0A8
/* BCC9C 800BC09C 2402000B */   addiu     $v0, $zero, 0xb
/* BCCA0 800BC0A0 14620004 */  bne        $v1, $v0, .L800BC0B4
/* BCCA4 800BC0A4 8FBF0018 */   lw        $ra, 0x18($sp)
.L800BC0A8:
/* BCCA8 800BC0A8 8E020040 */  lw         $v0, 0x40($s0)
/* BCCAC 800BC0AC A0510000 */  sb         $s1, ($v0)
/* BCCB0 800BC0B0 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BC0B4:
/* BCCB4 800BC0B4 8FB10014 */  lw         $s1, 0x14($sp)
/* BCCB8 800BC0B8 8FB00010 */  lw         $s0, 0x10($sp)
/* BCCBC 800BC0BC 03E00008 */  jr         $ra
/* BCCC0 800BC0C0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC0C4
/* BCCC4 800BC0C4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BCCC8 800BC0C8 AFB00010 */  sw         $s0, 0x10($sp)
/* BCCCC 800BC0CC 00808021 */  addu       $s0, $a0, $zero
/* BCCD0 800BC0D0 AFBF0014 */  sw         $ra, 0x14($sp)
/* BCCD4 800BC0D4 8E030078 */  lw         $v1, 0x78($s0)
/* BCCD8 800BC0D8 84640010 */  lh         $a0, 0x10($v1)
/* BCCDC 800BC0DC 8C620014 */  lw         $v0, 0x14($v1)
/* BCCE0 800BC0E0 0040F809 */  jalr       $v0
/* BCCE4 800BC0E4 02042021 */   addu      $a0, $s0, $a0
/* BCCE8 800BC0E8 24030009 */  addiu      $v1, $zero, 9
/* BCCEC 800BC0EC 54430005 */  bnel       $v0, $v1, .L800BC104
/* BCCF0 800BC0F0 8E030078 */   lw        $v1, 0x78($s0)
/* BCCF4 800BC0F4 8E020040 */  lw         $v0, 0x40($s0)
/* BCCF8 800BC0F8 94430006 */  lhu        $v1, 6($v0)
/* BCCFC 800BC0FC 0802F056 */  j          .L800BC158
/* BCD00 800BC100 8C440000 */   lw        $a0, ($v0)
.L800BC104:
/* BCD04 800BC104 84640010 */  lh         $a0, 0x10($v1)
/* BCD08 800BC108 8C620014 */  lw         $v0, 0x14($v1)
/* BCD0C 800BC10C 0040F809 */  jalr       $v0
/* BCD10 800BC110 02042021 */   addu      $a0, $s0, $a0
/* BCD14 800BC114 24030008 */  addiu      $v1, $zero, 8
/* BCD18 800BC118 54430005 */  bnel       $v0, $v1, .L800BC130
/* BCD1C 800BC11C 8E030078 */   lw        $v1, 0x78($s0)
/* BCD20 800BC120 8E020040 */  lw         $v0, 0x40($s0)
/* BCD24 800BC124 9443001E */  lhu        $v1, 0x1e($v0)
/* BCD28 800BC128 0802F056 */  j          .L800BC158
/* BCD2C 800BC12C 8C440018 */   lw        $a0, 0x18($v0)
.L800BC130:
/* BCD30 800BC130 84640010 */  lh         $a0, 0x10($v1)
/* BCD34 800BC134 8C620014 */  lw         $v0, 0x14($v1)
/* BCD38 800BC138 0040F809 */  jalr       $v0
/* BCD3C 800BC13C 02042021 */   addu      $a0, $s0, $a0
/* BCD40 800BC140 2403000B */  addiu      $v1, $zero, 0xb
/* BCD44 800BC144 14430007 */  bne        $v0, $v1, .L800BC164
/* BCD48 800BC148 00001021 */   addu      $v0, $zero, $zero
/* BCD4C 800BC14C 8E020040 */  lw         $v0, 0x40($s0)
/* BCD50 800BC150 90430011 */  lbu        $v1, 0x11($v0)
/* BCD54 800BC154 8C44000C */  lw         $a0, 0xc($v0)
.L800BC158:
/* BCD58 800BC158 00031880 */  sll        $v1, $v1, 2
/* BCD5C 800BC15C 00641821 */  addu       $v1, $v1, $a0
/* BCD60 800BC160 8C620000 */  lw         $v0, ($v1)
.L800BC164:
/* BCD64 800BC164 8FBF0014 */  lw         $ra, 0x14($sp)
/* BCD68 800BC168 8FB00010 */  lw         $s0, 0x10($sp)
/* BCD6C 800BC16C 03E00008 */  jr         $ra
/* BCD70 800BC170 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800BC174
/* BCD74 800BC174 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BCD78 800BC178 AFB00010 */  sw         $s0, 0x10($sp)
/* BCD7C 800BC17C 00808021 */  addu       $s0, $a0, $zero
/* BCD80 800BC180 AFBF0018 */  sw         $ra, 0x18($sp)
/* BCD84 800BC184 AFB10014 */  sw         $s1, 0x14($sp)
/* BCD88 800BC188 8E030078 */  lw         $v1, 0x78($s0)
/* BCD8C 800BC18C 00008821 */  addu       $s1, $zero, $zero
/* BCD90 800BC190 84640010 */  lh         $a0, 0x10($v1)
/* BCD94 800BC194 8C620014 */  lw         $v0, 0x14($v1)
/* BCD98 800BC198 0040F809 */  jalr       $v0
/* BCD9C 800BC19C 02042021 */   addu      $a0, $s0, $a0
/* BCDA0 800BC1A0 00401821 */  addu       $v1, $v0, $zero
/* BCDA4 800BC1A4 24020009 */  addiu      $v0, $zero, 9
/* BCDA8 800BC1A8 1062000F */  beq        $v1, $v0, .L800BC1E8
/* BCDAC 800BC1AC 2862000A */   slti      $v0, $v1, 0xa
/* BCDB0 800BC1B0 10400005 */  beqz       $v0, .L800BC1C8
/* BCDB4 800BC1B4 24020008 */   addiu     $v0, $zero, 8
/* BCDB8 800BC1B8 10620008 */  beq        $v1, $v0, .L800BC1DC
/* BCDBC 800BC1BC 02201021 */   addu      $v0, $s1, $zero
/* BCDC0 800BC1C0 0802F081 */  j          .L800BC204
/* BCDC4 800BC1C4 8FBF0018 */   lw        $ra, 0x18($sp)
.L800BC1C8:
/* BCDC8 800BC1C8 2402000B */  addiu      $v0, $zero, 0xb
/* BCDCC 800BC1CC 10620009 */  beq        $v1, $v0, .L800BC1F4
/* BCDD0 800BC1D0 02201021 */   addu      $v0, $s1, $zero
/* BCDD4 800BC1D4 0802F081 */  j          .L800BC204
/* BCDD8 800BC1D8 8FBF0018 */   lw        $ra, 0x18($sp)
.L800BC1DC:
/* BCDDC 800BC1DC 8E020040 */  lw         $v0, 0x40($s0)
/* BCDE0 800BC1E0 0802F07F */  j          .L800BC1FC
/* BCDE4 800BC1E4 9451001E */   lhu       $s1, 0x1e($v0)
.L800BC1E8:
/* BCDE8 800BC1E8 8E020040 */  lw         $v0, 0x40($s0)
/* BCDEC 800BC1EC 0802F07F */  j          .L800BC1FC
/* BCDF0 800BC1F0 94510006 */   lhu       $s1, 6($v0)
.L800BC1F4:
/* BCDF4 800BC1F4 8E020040 */  lw         $v0, 0x40($s0)
/* BCDF8 800BC1F8 90510011 */  lbu        $s1, 0x11($v0)
.L800BC1FC:
/* BCDFC 800BC1FC 02201021 */  addu       $v0, $s1, $zero
/* BCE00 800BC200 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BC204:
/* BCE04 800BC204 8FB10014 */  lw         $s1, 0x14($sp)
/* BCE08 800BC208 8FB00010 */  lw         $s0, 0x10($sp)
/* BCE0C 800BC20C 03E00008 */  jr         $ra
/* BCE10 800BC210 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_widgetSubstruct8
/* BCE14 800BC214 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* BCE18 800BC218 AFB00018 */  sw         $s0, 0x18($sp)
/* BCE1C 800BC21C 00808021 */  addu       $s0, $a0, $zero
/* BCE20 800BC220 AFB1001C */  sw         $s1, 0x1c($sp)
/* BCE24 800BC224 30B100FF */  andi       $s1, $a1, 0xff
/* BCE28 800BC228 AFB20020 */  sw         $s2, 0x20($sp)
/* BCE2C 800BC22C 30D200FF */  andi       $s2, $a2, 0xff
/* BCE30 800BC230 AFBF003C */  sw         $ra, 0x3c($sp)
/* BCE34 800BC234 AFBE0038 */  sw         $fp, 0x38($sp)
/* BCE38 800BC238 AFB70034 */  sw         $s7, 0x34($sp)
/* BCE3C 800BC23C AFB60030 */  sw         $s6, 0x30($sp)
/* BCE40 800BC240 AFB5002C */  sw         $s5, 0x2c($sp)
/* BCE44 800BC244 AFB40028 */  sw         $s4, 0x28($sp)
/* BCE48 800BC248 AFB30024 */  sw         $s3, 0x24($sp)
/* BCE4C 800BC24C 8E030078 */  lw         $v1, 0x78($s0)
/* BCE50 800BC250 93B40053 */  lbu        $s4, 0x53($sp)
/* BCE54 800BC254 93B60057 */  lbu        $s6, 0x57($sp)
/* BCE58 800BC258 93B7005B */  lbu        $s7, 0x5b($sp)
/* BCE5C 800BC25C 93BE005F */  lbu        $fp, 0x5f($sp)
/* BCE60 800BC260 93A20063 */  lbu        $v0, 0x63($sp)
/* BCE64 800BC264 97B50066 */  lhu        $s5, 0x66($sp)
/* BCE68 800BC268 84640010 */  lh         $a0, 0x10($v1)
/* BCE6C 800BC26C 30F300FF */  andi       $s3, $a3, 0xff
/* BCE70 800BC270 AFA20010 */  sw         $v0, 0x10($sp)
/* BCE74 800BC274 8C620014 */  lw         $v0, 0x14($v1)
/* BCE78 800BC278 0040F809 */  jalr       $v0
/* BCE7C 800BC27C 02042021 */   addu      $a0, $s0, $a0
/* BCE80 800BC280 24030008 */  addiu      $v1, $zero, 8
/* BCE84 800BC284 14430013 */  bne        $v0, $v1, .L800BC2D4
/* BCE88 800BC288 8FBF003C */   lw        $ra, 0x3c($sp)
/* BCE8C 800BC28C 8E020040 */  lw         $v0, 0x40($s0)
/* BCE90 800BC290 24030001 */  addiu      $v1, $zero, 1
/* BCE94 800BC294 A0430001 */  sb         $v1, 1($v0)
/* BCE98 800BC298 A051000C */  sb         $s1, 0xc($v0)
/* BCE9C 800BC29C A0510002 */  sb         $s1, 2($v0)
/* BCEA0 800BC2A0 A052000D */  sb         $s2, 0xd($v0)
/* BCEA4 800BC2A4 A0520004 */  sb         $s2, 4($v0)
/* BCEA8 800BC2A8 A053000E */  sb         $s3, 0xe($v0)
/* BCEAC 800BC2AC A0530006 */  sb         $s3, 6($v0)
/* BCEB0 800BC2B0 A054000F */  sb         $s4, 0xf($v0)
/* BCEB4 800BC2B4 A0540008 */  sb         $s4, 8($v0)
/* BCEB8 800BC2B8 A0560003 */  sb         $s6, 3($v0)
/* BCEBC 800BC2BC A0570005 */  sb         $s7, 5($v0)
/* BCEC0 800BC2C0 A05E0007 */  sb         $fp, 7($v0)
/* BCEC4 800BC2C4 8FA30010 */  lw         $v1, 0x10($sp)
/* BCEC8 800BC2C8 A055000A */  sb         $s5, 0xa($v0)
/* BCECC 800BC2CC A040000B */  sb         $zero, 0xb($v0)
/* BCED0 800BC2D0 A0430009 */  sb         $v1, 9($v0)
.L800BC2D4:
/* BCED4 800BC2D4 8FBE0038 */  lw         $fp, 0x38($sp)
/* BCED8 800BC2D8 8FB70034 */  lw         $s7, 0x34($sp)
/* BCEDC 800BC2DC 8FB60030 */  lw         $s6, 0x30($sp)
/* BCEE0 800BC2E0 8FB5002C */  lw         $s5, 0x2c($sp)
/* BCEE4 800BC2E4 8FB40028 */  lw         $s4, 0x28($sp)
/* BCEE8 800BC2E8 8FB30024 */  lw         $s3, 0x24($sp)
/* BCEEC 800BC2EC 8FB20020 */  lw         $s2, 0x20($sp)
/* BCEF0 800BC2F0 8FB1001C */  lw         $s1, 0x1c($sp)
/* BCEF4 800BC2F4 8FB00018 */  lw         $s0, 0x18($sp)
/* BCEF8 800BC2F8 03E00008 */  jr         $ra
/* BCEFC 800BC2FC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800BC300
/* BCF00 800BC300 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BCF04 800BC304 AFB10014 */  sw         $s1, 0x14($sp)
/* BCF08 800BC308 00808821 */  addu       $s1, $a0, $zero
/* BCF0C 800BC30C AFBF0018 */  sw         $ra, 0x18($sp)
/* BCF10 800BC310 AFB00010 */  sw         $s0, 0x10($sp)
/* BCF14 800BC314 8E230078 */  lw         $v1, 0x78($s1)
/* BCF18 800BC318 30B0FFFF */  andi       $s0, $a1, 0xffff
/* BCF1C 800BC31C 84640010 */  lh         $a0, 0x10($v1)
/* BCF20 800BC320 8C620014 */  lw         $v0, 0x14($v1)
/* BCF24 800BC324 0040F809 */  jalr       $v0
/* BCF28 800BC328 02242021 */   addu      $a0, $s1, $a0
/* BCF2C 800BC32C 24030008 */  addiu      $v1, $zero, 8
/* BCF30 800BC330 14430023 */  bne        $v0, $v1, .L800BC3C0
/* BCF34 800BC334 8FBF0018 */   lw        $ra, 0x18($sp)
/* BCF38 800BC338 8E260040 */  lw         $a2, 0x40($s1)
/* BCF3C 800BC33C 94C20020 */  lhu        $v0, 0x20($a2)
/* BCF40 800BC340 0202102B */  sltu       $v0, $s0, $v0
/* BCF44 800BC344 5040001F */  beql       $v0, $zero, .L800BC3C4
/* BCF48 800BC348 8FB10014 */   lw        $s1, 0x14($sp)
/* BCF4C 800BC34C 94C20020 */  lhu        $v0, 0x20($a2)
/* BCF50 800BC350 2442FFFF */  addiu      $v0, $v0, -1
/* BCF54 800BC354 0202182A */  slt        $v1, $s0, $v0
/* BCF58 800BC358 5060000C */  beql       $v1, $zero, .L800BC38C
/* BCF5C 800BC35C 00101080 */   sll       $v0, $s0, 2
/* BCF60 800BC360 8CC70018 */  lw         $a3, 0x18($a2)
/* BCF64 800BC364 00402821 */  addu       $a1, $v0, $zero
.L800BC368:
/* BCF68 800BC368 00101880 */  sll        $v1, $s0, 2
/* BCF6C 800BC36C 00671821 */  addu       $v1, $v1, $a3
/* BCF70 800BC370 26020001 */  addiu      $v0, $s0, 1
/* BCF74 800BC374 3050FFFF */  andi       $s0, $v0, 0xffff
/* BCF78 800BC378 8C640004 */  lw         $a0, 4($v1)
/* BCF7C 800BC37C 0205102A */  slt        $v0, $s0, $a1
/* BCF80 800BC380 1440FFF9 */  bnez       $v0, .L800BC368
/* BCF84 800BC384 AC640000 */   sw        $a0, ($v1)
/* BCF88 800BC388 00101080 */  sll        $v0, $s0, 2
.L800BC38C:
/* BCF8C 800BC38C 8CC30018 */  lw         $v1, 0x18($a2)
/* BCF90 800BC390 94C40020 */  lhu        $a0, 0x20($a2)
/* BCF94 800BC394 00431021 */  addu       $v0, $v0, $v1
/* BCF98 800BC398 2484FFFF */  addiu      $a0, $a0, -1
/* BCF9C 800BC39C AC400000 */  sw         $zero, ($v0)
/* BCFA0 800BC3A0 94C2001E */  lhu        $v0, 0x1e($a2)
/* BCFA4 800BC3A4 3083FFFF */  andi       $v1, $a0, 0xffff
/* BCFA8 800BC3A8 0043102B */  sltu       $v0, $v0, $v1
/* BCFAC 800BC3AC 14400003 */  bnez       $v0, .L800BC3BC
/* BCFB0 800BC3B0 A4C40020 */   sh        $a0, 0x20($a2)
/* BCFB4 800BC3B4 2482FFFF */  addiu      $v0, $a0, -1
/* BCFB8 800BC3B8 A4C2001E */  sh         $v0, 0x1e($a2)
.L800BC3BC:
/* BCFBC 800BC3BC 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BC3C0:
/* BCFC0 800BC3C0 8FB10014 */  lw         $s1, 0x14($sp)
.L800BC3C4:
/* BCFC4 800BC3C4 8FB00010 */  lw         $s0, 0x10($sp)
/* BCFC8 800BC3C8 03E00008 */  jr         $ra
/* BCFCC 800BC3CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC3D0
/* BCFD0 800BC3D0 8C840040 */  lw         $a0, 0x40($a0)
/* BCFD4 800BC3D4 94820020 */  lhu        $v0, 0x20($a0)
/* BCFD8 800BC3D8 1040000B */  beqz       $v0, .L800BC408
/* BCFDC 800BC3DC 00001821 */   addu      $v1, $zero, $zero
/* BCFE0 800BC3E0 8C860018 */  lw         $a2, 0x18($a0)
/* BCFE4 800BC3E4 00402821 */  addu       $a1, $v0, $zero
/* BCFE8 800BC3E8 00031080 */  sll        $v0, $v1, 2
.L800BC3EC:
/* BCFEC 800BC3EC 00461021 */  addu       $v0, $v0, $a2
/* BCFF0 800BC3F0 AC400000 */  sw         $zero, ($v0)
/* BCFF4 800BC3F4 24630001 */  addiu      $v1, $v1, 1
/* BCFF8 800BC3F8 3063FFFF */  andi       $v1, $v1, 0xffff
/* BCFFC 800BC3FC 0065102B */  sltu       $v0, $v1, $a1
/* BD000 800BC400 1440FFFA */  bnez       $v0, .L800BC3EC
/* BD004 800BC404 00031080 */   sll       $v0, $v1, 2
.L800BC408:
/* BD008 800BC408 A4800020 */  sh         $zero, 0x20($a0)
/* BD00C 800BC40C 03E00008 */  jr         $ra
/* BD010 800BC410 A480001E */   sh        $zero, 0x1e($a0)

glabel func_800BC414
/* BD014 800BC414 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD018 800BC418 AFBF001C */  sw         $ra, 0x1c($sp)
/* BD01C 800BC41C AFB20018 */  sw         $s2, 0x18($sp)
/* BD020 800BC420 AFB10014 */  sw         $s1, 0x14($sp)
/* BD024 800BC424 AFB00010 */  sw         $s0, 0x10($sp)
/* BD028 800BC428 8C910040 */  lw         $s1, 0x40($a0)
/* BD02C 800BC42C 96220020 */  lhu        $v0, 0x20($s1)
/* BD030 800BC430 10400016 */  beqz       $v0, .L800BC48C
/* BD034 800BC434 00008021 */   addu      $s0, $zero, $zero
/* BD038 800BC438 8E220018 */  lw         $v0, 0x18($s1)
.L800BC43C:
/* BD03C 800BC43C 00109080 */  sll        $s2, $s0, 2
/* BD040 800BC440 02421021 */  addu       $v0, $s2, $v0
/* BD044 800BC444 8C430000 */  lw         $v1, ($v0)
/* BD048 800BC448 5060000B */  beql       $v1, $zero, .L800BC478
/* BD04C 800BC44C 26030001 */   addiu     $v1, $s0, 1
/* BD050 800BC450 8C620078 */  lw         $v0, 0x78($v1)
/* BD054 800BC454 84440008 */  lh         $a0, 8($v0)
/* BD058 800BC458 00642021 */  addu       $a0, $v1, $a0
/* BD05C 800BC45C 8C43000C */  lw         $v1, 0xc($v0)
/* BD060 800BC460 0060F809 */  jalr       $v1
/* BD064 800BC464 24050003 */   addiu     $a1, $zero, 3
/* BD068 800BC468 8E220018 */  lw         $v0, 0x18($s1)
/* BD06C 800BC46C 02421021 */  addu       $v0, $s2, $v0
/* BD070 800BC470 AC400000 */  sw         $zero, ($v0)
/* BD074 800BC474 26030001 */  addiu      $v1, $s0, 1
.L800BC478:
/* BD078 800BC478 96220020 */  lhu        $v0, 0x20($s1)
/* BD07C 800BC47C 3070FFFF */  andi       $s0, $v1, 0xffff
/* BD080 800BC480 0202102B */  sltu       $v0, $s0, $v0
/* BD084 800BC484 5440FFED */  bnel       $v0, $zero, .L800BC43C
/* BD088 800BC488 8E220018 */   lw        $v0, 0x18($s1)
.L800BC48C:
/* BD08C 800BC48C 8FBF001C */  lw         $ra, 0x1c($sp)
/* BD090 800BC490 8FB20018 */  lw         $s2, 0x18($sp)
/* BD094 800BC494 A6200020 */  sh         $zero, 0x20($s1)
/* BD098 800BC498 A620001E */  sh         $zero, 0x1e($s1)
/* BD09C 800BC49C 8FB10014 */  lw         $s1, 0x14($sp)
/* BD0A0 800BC4A0 8FB00010 */  lw         $s0, 0x10($sp)
/* BD0A4 800BC4A4 03E00008 */  jr         $ra
/* BD0A8 800BC4A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_widget_heightWidth_borg8
/* BD0AC 800BC4AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD0B0 800BC4B0 AFB00010 */  sw         $s0, 0x10($sp)
/* BD0B4 800BC4B4 00808021 */  addu       $s0, $a0, $zero
/* BD0B8 800BC4B8 AFB10014 */  sw         $s1, 0x14($sp)
/* BD0BC 800BC4BC 00A08821 */  addu       $s1, $a1, $zero
/* BD0C0 800BC4C0 1220000E */  beqz       $s1, .L800BC4FC
/* BD0C4 800BC4C4 AFBF0018 */   sw        $ra, 0x18($sp)
/* BD0C8 800BC4C8 1200000D */  beqz       $s0, .L800BC500
/* BD0CC 800BC4CC 8FBF0018 */   lw        $ra, 0x18($sp)
/* BD0D0 800BC4D0 50C00004 */  beql       $a2, $zero, .L800BC4E4
/* BD0D4 800BC4D4 9625000A */   lhu       $a1, 0xa($s1)
/* BD0D8 800BC4D8 0C0299C0 */  jal        borg8_free
/* BD0DC 800BC4DC 8E04006C */   lw        $a0, 0x6c($s0)
/* BD0E0 800BC4E0 9625000A */  lhu        $a1, 0xa($s1)
.L800BC4E4:
/* BD0E4 800BC4E4 02002021 */  addu       $a0, $s0, $zero
/* BD0E8 800BC4E8 0C02DD42 */  jal        set_widgetHeight
/* BD0EC 800BC4EC AE11006C */   sw        $s1, 0x6c($s0)
/* BD0F0 800BC4F0 9625000C */  lhu        $a1, 0xc($s1)
/* BD0F4 800BC4F4 0C02DD46 */  jal        set_widgetWidth
/* BD0F8 800BC4F8 02002021 */   addu      $a0, $s0, $zero
.L800BC4FC:
/* BD0FC 800BC4FC 8FBF0018 */  lw         $ra, 0x18($sp)
.L800BC500:
/* BD100 800BC500 8FB10014 */  lw         $s1, 0x14($sp)
/* BD104 800BC504 8FB00010 */  lw         $s0, 0x10($sp)
/* BD108 800BC508 03E00008 */  jr         $ra
/* BD10C 800BC50C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widget_set_size
/* BD110 800BC510 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BD114 800BC514 AFB1001C */  sw         $s1, 0x1c($sp)
/* BD118 800BC518 97B10042 */  lhu        $s1, 0x42($sp)
/* BD11C 800BC51C AFB40028 */  sw         $s4, 0x28($sp)
/* BD120 800BC520 30B4FFFF */  andi       $s4, $a1, 0xffff
/* BD124 800BC524 AFB30024 */  sw         $s3, 0x24($sp)
/* BD128 800BC528 30D3FFFF */  andi       $s3, $a2, 0xffff
/* BD12C 800BC52C AFB20020 */  sw         $s2, 0x20($sp)
/* BD130 800BC530 30F2FFFF */  andi       $s2, $a3, 0xffff
/* BD134 800BC534 AFBF002C */  sw         $ra, 0x2c($sp)
/* BD138 800BC538 10800010 */  beqz       $a0, .L800BC57C
/* BD13C 800BC53C AFB00018 */   sw        $s0, 0x18($sp)
/* BD140 800BC540 8C900050 */  lw         $s0, 0x50($a0)
/* BD144 800BC544 A4940064 */  sh         $s4, 0x64($a0)
/* BD148 800BC548 A4920066 */  sh         $s2, 0x66($a0)
/* BD14C 800BC54C A4930068 */  sh         $s3, 0x68($a0)
/* BD150 800BC550 1200000A */  beqz       $s0, .L800BC57C
/* BD154 800BC554 A491006A */   sh        $s1, 0x6a($a0)
/* BD158 800BC558 02002021 */  addu       $a0, $s0, $zero
.L800BC55C:
/* BD15C 800BC55C 02802821 */  addu       $a1, $s4, $zero
/* BD160 800BC560 02603021 */  addu       $a2, $s3, $zero
/* BD164 800BC564 02403821 */  addu       $a3, $s2, $zero
/* BD168 800BC568 0C02F144 */  jal        widget_set_size
/* BD16C 800BC56C AFB10010 */   sw        $s1, 0x10($sp)
/* BD170 800BC570 8E10004C */  lw         $s0, 0x4c($s0)
/* BD174 800BC574 1600FFF9 */  bnez       $s0, .L800BC55C
/* BD178 800BC578 02002021 */   addu      $a0, $s0, $zero
.L800BC57C:
/* BD17C 800BC57C 8FBF002C */  lw         $ra, 0x2c($sp)
/* BD180 800BC580 8FB40028 */  lw         $s4, 0x28($sp)
/* BD184 800BC584 8FB30024 */  lw         $s3, 0x24($sp)
/* BD188 800BC588 8FB20020 */  lw         $s2, 0x20($sp)
/* BD18C 800BC58C 8FB1001C */  lw         $s1, 0x1c($sp)
/* BD190 800BC590 8FB00018 */  lw         $s0, 0x18($sp)
/* BD194 800BC594 03E00008 */  jr         $ra
/* BD198 800BC598 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800BC59C
/* BD19C 800BC59C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD1A0 800BC5A0 AFB10014 */  sw         $s1, 0x14($sp)
/* BD1A4 800BC5A4 30B1FFFF */  andi       $s1, $a1, 0xffff
/* BD1A8 800BC5A8 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD1AC 800BC5AC 1080000A */  beqz       $a0, .L800BC5D8
/* BD1B0 800BC5B0 AFB00010 */   sw        $s0, 0x10($sp)
/* BD1B4 800BC5B4 8C900050 */  lw         $s0, 0x50($a0)
/* BD1B8 800BC5B8 12000007 */  beqz       $s0, .L800BC5D8
/* BD1BC 800BC5BC A4910064 */   sh        $s1, 0x64($a0)
/* BD1C0 800BC5C0 02002021 */  addu       $a0, $s0, $zero
.L800BC5C4:
/* BD1C4 800BC5C4 0C02F167 */  jal        func_800BC59C
/* BD1C8 800BC5C8 02202821 */   addu      $a1, $s1, $zero
/* BD1CC 800BC5CC 8E10004C */  lw         $s0, 0x4c($s0)
/* BD1D0 800BC5D0 1600FFFC */  bnez       $s0, .L800BC5C4
/* BD1D4 800BC5D4 02002021 */   addu      $a0, $s0, $zero
.L800BC5D8:
/* BD1D8 800BC5D8 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD1DC 800BC5DC 8FB10014 */  lw         $s1, 0x14($sp)
/* BD1E0 800BC5E0 8FB00010 */  lw         $s0, 0x10($sp)
/* BD1E4 800BC5E4 03E00008 */  jr         $ra
/* BD1E8 800BC5E8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC5EC
/* BD1EC 800BC5EC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD1F0 800BC5F0 AFB10014 */  sw         $s1, 0x14($sp)
/* BD1F4 800BC5F4 30B1FFFF */  andi       $s1, $a1, 0xffff
/* BD1F8 800BC5F8 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD1FC 800BC5FC 1080000A */  beqz       $a0, .L800BC628
/* BD200 800BC600 AFB00010 */   sw        $s0, 0x10($sp)
/* BD204 800BC604 8C900050 */  lw         $s0, 0x50($a0)
/* BD208 800BC608 12000007 */  beqz       $s0, .L800BC628
/* BD20C 800BC60C A4910066 */   sh        $s1, 0x66($a0)
/* BD210 800BC610 02002021 */  addu       $a0, $s0, $zero
.L800BC614:
/* BD214 800BC614 0C02F17B */  jal        func_800BC5EC
/* BD218 800BC618 02202821 */   addu      $a1, $s1, $zero
/* BD21C 800BC61C 8E10004C */  lw         $s0, 0x4c($s0)
/* BD220 800BC620 1600FFFC */  bnez       $s0, .L800BC614
/* BD224 800BC624 02002021 */   addu      $a0, $s0, $zero
.L800BC628:
/* BD228 800BC628 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD22C 800BC62C 8FB10014 */  lw         $s1, 0x14($sp)
/* BD230 800BC630 8FB00010 */  lw         $s0, 0x10($sp)
/* BD234 800BC634 03E00008 */  jr         $ra
/* BD238 800BC638 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC63C
/* BD23C 800BC63C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD240 800BC640 AFB10014 */  sw         $s1, 0x14($sp)
/* BD244 800BC644 30B1FFFF */  andi       $s1, $a1, 0xffff
/* BD248 800BC648 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD24C 800BC64C 1080000A */  beqz       $a0, .L800BC678
/* BD250 800BC650 AFB00010 */   sw        $s0, 0x10($sp)
/* BD254 800BC654 8C900050 */  lw         $s0, 0x50($a0)
/* BD258 800BC658 12000007 */  beqz       $s0, .L800BC678
/* BD25C 800BC65C A4910068 */   sh        $s1, 0x68($a0)
/* BD260 800BC660 02002021 */  addu       $a0, $s0, $zero
.L800BC664:
/* BD264 800BC664 0C02F18F */  jal        func_800BC63C
/* BD268 800BC668 02202821 */   addu      $a1, $s1, $zero
/* BD26C 800BC66C 8E10004C */  lw         $s0, 0x4c($s0)
/* BD270 800BC670 1600FFFC */  bnez       $s0, .L800BC664
/* BD274 800BC674 02002021 */   addu      $a0, $s0, $zero
.L800BC678:
/* BD278 800BC678 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD27C 800BC67C 8FB10014 */  lw         $s1, 0x14($sp)
/* BD280 800BC680 8FB00010 */  lw         $s0, 0x10($sp)
/* BD284 800BC684 03E00008 */  jr         $ra
/* BD288 800BC688 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC68C
/* BD28C 800BC68C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD290 800BC690 AFB10014 */  sw         $s1, 0x14($sp)
/* BD294 800BC694 30B1FFFF */  andi       $s1, $a1, 0xffff
/* BD298 800BC698 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD29C 800BC69C 1080000A */  beqz       $a0, .L800BC6C8
/* BD2A0 800BC6A0 AFB00010 */   sw        $s0, 0x10($sp)
/* BD2A4 800BC6A4 8C900050 */  lw         $s0, 0x50($a0)
/* BD2A8 800BC6A8 12000007 */  beqz       $s0, .L800BC6C8
/* BD2AC 800BC6AC A491006A */   sh        $s1, 0x6a($a0)
/* BD2B0 800BC6B0 02002021 */  addu       $a0, $s0, $zero
.L800BC6B4:
/* BD2B4 800BC6B4 0C02F1A3 */  jal        func_800BC68C
/* BD2B8 800BC6B8 02202821 */   addu      $a1, $s1, $zero
/* BD2BC 800BC6BC 8E10004C */  lw         $s0, 0x4c($s0)
/* BD2C0 800BC6C0 1600FFFC */  bnez       $s0, .L800BC6B4
/* BD2C4 800BC6C4 02002021 */   addu      $a0, $s0, $zero
.L800BC6C8:
/* BD2C8 800BC6C8 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD2CC 800BC6CC 8FB10014 */  lw         $s1, 0x14($sp)
/* BD2D0 800BC6D0 8FB00010 */  lw         $s0, 0x10($sp)
/* BD2D4 800BC6D4 03E00008 */  jr         $ra
/* BD2D8 800BC6D8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel Widget_set_color
/* BD2DC 800BC6DC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BD2E0 800BC6E0 AFB1001C */  sw         $s1, 0x1c($sp)
/* BD2E4 800BC6E4 93B10043 */  lbu        $s1, 0x43($sp)
/* BD2E8 800BC6E8 AFB40028 */  sw         $s4, 0x28($sp)
/* BD2EC 800BC6EC 30B400FF */  andi       $s4, $a1, 0xff
/* BD2F0 800BC6F0 AFB30024 */  sw         $s3, 0x24($sp)
/* BD2F4 800BC6F4 30D300FF */  andi       $s3, $a2, 0xff
/* BD2F8 800BC6F8 AFB20020 */  sw         $s2, 0x20($sp)
/* BD2FC 800BC6FC 30F200FF */  andi       $s2, $a3, 0xff
/* BD300 800BC700 AFBF002C */  sw         $ra, 0x2c($sp)
/* BD304 800BC704 10800010 */  beqz       $a0, .L800BC748
/* BD308 800BC708 AFB00018 */   sw        $s0, 0x18($sp)
/* BD30C 800BC70C 8C900050 */  lw         $s0, 0x50($a0)
/* BD310 800BC710 A0940058 */  sb         $s4, 0x58($a0)
/* BD314 800BC714 A0930059 */  sb         $s3, 0x59($a0)
/* BD318 800BC718 A092005A */  sb         $s2, 0x5a($a0)
/* BD31C 800BC71C 1200000A */  beqz       $s0, .L800BC748
/* BD320 800BC720 A091005B */   sb        $s1, 0x5b($a0)
/* BD324 800BC724 02002021 */  addu       $a0, $s0, $zero
.L800BC728:
/* BD328 800BC728 02802821 */  addu       $a1, $s4, $zero
/* BD32C 800BC72C 02603021 */  addu       $a2, $s3, $zero
/* BD330 800BC730 02403821 */  addu       $a3, $s2, $zero
/* BD334 800BC734 0C02F1B7 */  jal        Widget_set_color
/* BD338 800BC738 AFB10010 */   sw        $s1, 0x10($sp)
/* BD33C 800BC73C 8E10004C */  lw         $s0, 0x4c($s0)
/* BD340 800BC740 1600FFF9 */  bnez       $s0, .L800BC728
/* BD344 800BC744 02002021 */   addu      $a0, $s0, $zero
.L800BC748:
/* BD348 800BC748 8FBF002C */  lw         $ra, 0x2c($sp)
/* BD34C 800BC74C 8FB40028 */  lw         $s4, 0x28($sp)
/* BD350 800BC750 8FB30024 */  lw         $s3, 0x24($sp)
/* BD354 800BC754 8FB20020 */  lw         $s2, 0x20($sp)
/* BD358 800BC758 8FB1001C */  lw         $s1, 0x1c($sp)
/* BD35C 800BC75C 8FB00018 */  lw         $s0, 0x18($sp)
/* BD360 800BC760 03E00008 */  jr         $ra
/* BD364 800BC764 27BD0030 */   addiu     $sp, $sp, 0x30

glabel widget_set_red
/* BD368 800BC768 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD36C 800BC76C AFB10014 */  sw         $s1, 0x14($sp)
/* BD370 800BC770 30B100FF */  andi       $s1, $a1, 0xff
/* BD374 800BC774 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD378 800BC778 1080000A */  beqz       $a0, .L800BC7A4
/* BD37C 800BC77C AFB00010 */   sw        $s0, 0x10($sp)
/* BD380 800BC780 8C900050 */  lw         $s0, 0x50($a0)
/* BD384 800BC784 12000007 */  beqz       $s0, .L800BC7A4
/* BD388 800BC788 A0910058 */   sb        $s1, 0x58($a0)
/* BD38C 800BC78C 02002021 */  addu       $a0, $s0, $zero
.L800BC790:
/* BD390 800BC790 0C02F1DA */  jal        widget_set_red
/* BD394 800BC794 02202821 */   addu      $a1, $s1, $zero
/* BD398 800BC798 8E10004C */  lw         $s0, 0x4c($s0)
/* BD39C 800BC79C 1600FFFC */  bnez       $s0, .L800BC790
/* BD3A0 800BC7A0 02002021 */   addu      $a0, $s0, $zero
.L800BC7A4:
/* BD3A4 800BC7A4 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD3A8 800BC7A8 8FB10014 */  lw         $s1, 0x14($sp)
/* BD3AC 800BC7AC 8FB00010 */  lw         $s0, 0x10($sp)
/* BD3B0 800BC7B0 03E00008 */  jr         $ra
/* BD3B4 800BC7B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widget_set_green
/* BD3B8 800BC7B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD3BC 800BC7BC AFB10014 */  sw         $s1, 0x14($sp)
/* BD3C0 800BC7C0 30B100FF */  andi       $s1, $a1, 0xff
/* BD3C4 800BC7C4 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD3C8 800BC7C8 1080000A */  beqz       $a0, .L800BC7F4
/* BD3CC 800BC7CC AFB00010 */   sw        $s0, 0x10($sp)
/* BD3D0 800BC7D0 8C900050 */  lw         $s0, 0x50($a0)
/* BD3D4 800BC7D4 12000007 */  beqz       $s0, .L800BC7F4
/* BD3D8 800BC7D8 A0910059 */   sb        $s1, 0x59($a0)
/* BD3DC 800BC7DC 02002021 */  addu       $a0, $s0, $zero
.L800BC7E0:
/* BD3E0 800BC7E0 0C02F1EE */  jal        widget_set_green
/* BD3E4 800BC7E4 02202821 */   addu      $a1, $s1, $zero
/* BD3E8 800BC7E8 8E10004C */  lw         $s0, 0x4c($s0)
/* BD3EC 800BC7EC 1600FFFC */  bnez       $s0, .L800BC7E0
/* BD3F0 800BC7F0 02002021 */   addu      $a0, $s0, $zero
.L800BC7F4:
/* BD3F4 800BC7F4 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD3F8 800BC7F8 8FB10014 */  lw         $s1, 0x14($sp)
/* BD3FC 800BC7FC 8FB00010 */  lw         $s0, 0x10($sp)
/* BD400 800BC800 03E00008 */  jr         $ra
/* BD404 800BC804 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widget_set_blue
/* BD408 800BC808 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD40C 800BC80C AFB10014 */  sw         $s1, 0x14($sp)
/* BD410 800BC810 30B100FF */  andi       $s1, $a1, 0xff
/* BD414 800BC814 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD418 800BC818 1080000A */  beqz       $a0, .L800BC844
/* BD41C 800BC81C AFB00010 */   sw        $s0, 0x10($sp)
/* BD420 800BC820 8C900050 */  lw         $s0, 0x50($a0)
/* BD424 800BC824 12000007 */  beqz       $s0, .L800BC844
/* BD428 800BC828 A091005A */   sb        $s1, 0x5a($a0)
/* BD42C 800BC82C 02002021 */  addu       $a0, $s0, $zero
.L800BC830:
/* BD430 800BC830 0C02F202 */  jal        widget_set_blue
/* BD434 800BC834 02202821 */   addu      $a1, $s1, $zero
/* BD438 800BC838 8E10004C */  lw         $s0, 0x4c($s0)
/* BD43C 800BC83C 1600FFFC */  bnez       $s0, .L800BC830
/* BD440 800BC840 02002021 */   addu      $a0, $s0, $zero
.L800BC844:
/* BD444 800BC844 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD448 800BC848 8FB10014 */  lw         $s1, 0x14($sp)
/* BD44C 800BC84C 8FB00010 */  lw         $s0, 0x10($sp)
/* BD450 800BC850 03E00008 */  jr         $ra
/* BD454 800BC854 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widget_fade
/* BD458 800BC858 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD45C 800BC85C AFB10014 */  sw         $s1, 0x14($sp)
/* BD460 800BC860 30B100FF */  andi       $s1, $a1, 0xff
/* BD464 800BC864 AFBF0018 */  sw         $ra, 0x18($sp)
/* BD468 800BC868 1080000A */  beqz       $a0, .L800BC894
/* BD46C 800BC86C AFB00010 */   sw        $s0, 0x10($sp)
/* BD470 800BC870 8C900050 */  lw         $s0, 0x50($a0)
/* BD474 800BC874 12000007 */  beqz       $s0, .L800BC894
/* BD478 800BC878 A091005B */   sb        $s1, 0x5b($a0)
/* BD47C 800BC87C 02002021 */  addu       $a0, $s0, $zero
.L800BC880:
/* BD480 800BC880 0C02F216 */  jal        widget_fade
/* BD484 800BC884 02202821 */   addu      $a1, $s1, $zero
/* BD488 800BC888 8E10004C */  lw         $s0, 0x4c($s0)
/* BD48C 800BC88C 1600FFFC */  bnez       $s0, .L800BC880
/* BD490 800BC890 02002021 */   addu      $a0, $s0, $zero
.L800BC894:
/* BD494 800BC894 8FBF0018 */  lw         $ra, 0x18($sp)
/* BD498 800BC898 8FB10014 */  lw         $s1, 0x14($sp)
/* BD49C 800BC89C 8FB00010 */  lw         $s0, 0x10($sp)
/* BD4A0 800BC8A0 03E00008 */  jr         $ra
/* BD4A4 800BC8A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widget_move
/* BD4A8 800BC8A8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BD4AC 800BC8AC AFB00010 */  sw         $s0, 0x10($sp)
/* BD4B0 800BC8B0 00808021 */  addu       $s0, $a0, $zero
/* BD4B4 800BC8B4 00052C00 */  sll        $a1, $a1, 0x10
/* BD4B8 800BC8B8 AFB10014 */  sw         $s1, 0x14($sp)
/* BD4BC 800BC8BC 00058C03 */  sra        $s1, $a1, 0x10
/* BD4C0 800BC8C0 00063400 */  sll        $a2, $a2, 0x10
/* BD4C4 800BC8C4 AFB20018 */  sw         $s2, 0x18($sp)
/* BD4C8 800BC8C8 00069403 */  sra        $s2, $a2, 0x10
/* BD4CC 800BC8CC 12000034 */  beqz       $s0, .L800BC9A0
/* BD4D0 800BC8D0 AFBF001C */   sw        $ra, 0x1c($sp)
/* BD4D4 800BC8D4 96020060 */  lhu        $v0, 0x60($s0)
/* BD4D8 800BC8D8 96030062 */  lhu        $v1, 0x62($s0)
/* BD4DC 800BC8DC 96040064 */  lhu        $a0, 0x64($s0)
/* BD4E0 800BC8E0 02221021 */  addu       $v0, $s1, $v0
/* BD4E4 800BC8E4 A6020060 */  sh         $v0, 0x60($s0)
/* BD4E8 800BC8E8 96020066 */  lhu        $v0, 0x66($s0)
/* BD4EC 800BC8EC 02431821 */  addu       $v1, $s2, $v1
/* BD4F0 800BC8F0 A6030062 */  sh         $v1, 0x62($s0)
/* BD4F4 800BC8F4 96030068 */  lhu        $v1, 0x68($s0)
/* BD4F8 800BC8F8 02242021 */  addu       $a0, $s1, $a0
/* BD4FC 800BC8FC A6040064 */  sh         $a0, 0x64($s0)
/* BD500 800BC900 02221021 */  addu       $v0, $s1, $v0
/* BD504 800BC904 A6020066 */  sh         $v0, 0x66($s0)
/* BD508 800BC908 9602006A */  lhu        $v0, 0x6a($s0)
/* BD50C 800BC90C 02431821 */  addu       $v1, $s2, $v1
/* BD510 800BC910 A6030068 */  sh         $v1, 0x68($s0)
/* BD514 800BC914 8E030078 */  lw         $v1, 0x78($s0)
/* BD518 800BC918 02421021 */  addu       $v0, $s2, $v0
/* BD51C 800BC91C A602006A */  sh         $v0, 0x6a($s0)
/* BD520 800BC920 84640010 */  lh         $a0, 0x10($v1)
/* BD524 800BC924 8C620014 */  lw         $v0, 0x14($v1)
/* BD528 800BC928 0040F809 */  jalr       $v0
/* BD52C 800BC92C 02042021 */   addu      $a0, $s0, $a0
/* BD530 800BC930 24030001 */  addiu      $v1, $zero, 1
/* BD534 800BC934 5043000A */  beql       $v0, $v1, .L800BC960
/* BD538 800BC938 8E020040 */   lw        $v0, 0x40($s0)
/* BD53C 800BC93C 8E030078 */  lw         $v1, 0x78($s0)
/* BD540 800BC940 84640010 */  lh         $a0, 0x10($v1)
/* BD544 800BC944 8C620014 */  lw         $v0, 0x14($v1)
/* BD548 800BC948 0040F809 */  jalr       $v0
/* BD54C 800BC94C 02042021 */   addu      $a0, $s0, $a0
/* BD550 800BC950 24030002 */  addiu      $v1, $zero, 2
/* BD554 800BC954 54430009 */  bnel       $v0, $v1, .L800BC97C
/* BD558 800BC958 8E100050 */   lw        $s0, 0x50($s0)
/* BD55C 800BC95C 8E020040 */  lw         $v0, 0x40($s0)
.L800BC960:
/* BD560 800BC960 94430010 */  lhu        $v1, 0x10($v0)
/* BD564 800BC964 94440012 */  lhu        $a0, 0x12($v0)
/* BD568 800BC968 02231821 */  addu       $v1, $s1, $v1
/* BD56C 800BC96C 02242021 */  addu       $a0, $s1, $a0
/* BD570 800BC970 A4430010 */  sh         $v1, 0x10($v0)
/* BD574 800BC974 A4440012 */  sh         $a0, 0x12($v0)
/* BD578 800BC978 8E100050 */  lw         $s0, 0x50($s0)
.L800BC97C:
/* BD57C 800BC97C 12000009 */  beqz       $s0, .L800BC9A4
/* BD580 800BC980 8FBF001C */   lw        $ra, 0x1c($sp)
/* BD584 800BC984 02002021 */  addu       $a0, $s0, $zero
.L800BC988:
/* BD588 800BC988 02202821 */  addu       $a1, $s1, $zero
/* BD58C 800BC98C 0C02F22A */  jal        widget_move
/* BD590 800BC990 02403021 */   addu      $a2, $s2, $zero
/* BD594 800BC994 8E10004C */  lw         $s0, 0x4c($s0)
/* BD598 800BC998 1600FFFB */  bnez       $s0, .L800BC988
/* BD59C 800BC99C 02002021 */   addu      $a0, $s0, $zero
.L800BC9A0:
/* BD5A0 800BC9A0 8FBF001C */  lw         $ra, 0x1c($sp)
.L800BC9A4:
/* BD5A4 800BC9A4 8FB20018 */  lw         $s2, 0x18($sp)
/* BD5A8 800BC9A8 8FB10014 */  lw         $s1, 0x14($sp)
/* BD5AC 800BC9AC 8FB00010 */  lw         $s0, 0x10($sp)
/* BD5B0 800BC9B0 03E00008 */  jr         $ra
/* BD5B4 800BC9B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BC9B8
/* BD5B8 800BC9B8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BD5BC 800BC9BC AFBF0010 */  sw         $ra, 0x10($sp)
/* BD5C0 800BC9C0 94820060 */  lhu        $v0, 0x60($a0)
/* BD5C4 800BC9C4 94830062 */  lhu        $v1, 0x62($a0)
/* BD5C8 800BC9C8 00A22823 */  subu       $a1, $a1, $v0
/* BD5CC 800BC9CC 00052C00 */  sll        $a1, $a1, 0x10
/* BD5D0 800BC9D0 00C33023 */  subu       $a2, $a2, $v1
/* BD5D4 800BC9D4 00063400 */  sll        $a2, $a2, 0x10
/* BD5D8 800BC9D8 00052C03 */  sra        $a1, $a1, 0x10
/* BD5DC 800BC9DC 0C02F22A */  jal        widget_move
/* BD5E0 800BC9E0 00063403 */   sra       $a2, $a2, 0x10
/* BD5E4 800BC9E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* BD5E8 800BC9E8 03E00008 */  jr         $ra
/* BD5EC 800BC9EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800BC9F0
/* BD5F0 800BC9F0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* BD5F4 800BC9F4 AFB30024 */  sw         $s3, 0x24($sp)
/* BD5F8 800BC9F8 97B30052 */  lhu        $s3, 0x52($sp)
/* BD5FC 800BC9FC AFB40028 */  sw         $s4, 0x28($sp)
/* BD600 800BCA00 93B40057 */  lbu        $s4, 0x57($sp)
/* BD604 800BCA04 AFB60030 */  sw         $s6, 0x30($sp)
/* BD608 800BCA08 93B6005B */  lbu        $s6, 0x5b($sp)
/* BD60C 800BCA0C AFB70034 */  sw         $s7, 0x34($sp)
/* BD610 800BCA10 93B7005F */  lbu        $s7, 0x5f($sp)
/* BD614 800BCA14 AFB5002C */  sw         $s5, 0x2c($sp)
/* BD618 800BCA18 93B50063 */  lbu        $s5, 0x63($sp)
/* BD61C 800BCA1C AFA40040 */  sw         $a0, 0x40($sp)
/* BD620 800BCA20 2404007C */  addiu      $a0, $zero, 0x7c
/* BD624 800BCA24 AFB00018 */  sw         $s0, 0x18($sp)
/* BD628 800BCA28 30B0FFFF */  andi       $s0, $a1, 0xffff
/* BD62C 800BCA2C AFB1001C */  sw         $s1, 0x1c($sp)
/* BD630 800BCA30 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BD634 800BCA34 AFB20020 */  sw         $s2, 0x20($sp)
/* BD638 800BCA38 30F2FFFF */  andi       $s2, $a3, 0xffff
/* BD63C 800BCA3C AFBF003C */  sw         $ra, 0x3c($sp)
/* BD640 800BCA40 0C026259 */  jal        passToMalloc
/* BD644 800BCA44 AFBE0038 */   sw        $fp, 0x38($sp)
/* BD648 800BCA48 0C02F48C */  jal        func_800BD230
/* BD64C 800BCA4C 00402021 */   addu      $a0, $v0, $zero
/* BD650 800BCA50 0040F021 */  addu       $fp, $v0, $zero
/* BD654 800BCA54 03C02021 */  addu       $a0, $fp, $zero
/* BD658 800BCA58 02002821 */  addu       $a1, $s0, $zero
/* BD65C 800BCA5C 0C02DD3F */  jal        set_widget_coords
/* BD660 800BCA60 02203021 */   addu      $a2, $s1, $zero
/* BD664 800BCA64 03C02021 */  addu       $a0, $fp, $zero
/* BD668 800BCA68 0C02DD42 */  jal        set_widgetHeight
/* BD66C 800BCA6C 02402821 */   addu      $a1, $s2, $zero
/* BD670 800BCA70 03C02021 */  addu       $a0, $fp, $zero
/* BD674 800BCA74 0C02DD46 */  jal        set_widgetWidth
/* BD678 800BCA78 02602821 */   addu      $a1, $s3, $zero
/* BD67C 800BCA7C 02802821 */  addu       $a1, $s4, $zero
/* BD680 800BCA80 8FC30078 */  lw         $v1, 0x78($fp)
/* BD684 800BCA84 02C03021 */  addu       $a2, $s6, $zero
/* BD688 800BCA88 84640048 */  lh         $a0, 0x48($v1)
/* BD68C 800BCA8C 02E03821 */  addu       $a3, $s7, $zero
/* BD690 800BCA90 AFB50010 */  sw         $s5, 0x10($sp)
/* BD694 800BCA94 8C62004C */  lw         $v0, 0x4c($v1)
/* BD698 800BCA98 0040F809 */  jalr       $v0
/* BD69C 800BCA9C 03C42021 */   addu      $a0, $fp, $a0
/* BD6A0 800BCAA0 8FA20040 */  lw         $v0, 0x40($sp)
/* BD6A4 800BCAA4 10400007 */  beqz       $v0, .L800BCAC4
/* BD6A8 800BCAA8 03C02821 */   addu      $a1, $fp, $zero
/* BD6AC 800BCAAC 8C430078 */  lw         $v1, 0x78($v0)
/* BD6B0 800BCAB0 84640030 */  lh         $a0, 0x30($v1)
/* BD6B4 800BCAB4 8C620034 */  lw         $v0, 0x34($v1)
/* BD6B8 800BCAB8 8FA30040 */  lw         $v1, 0x40($sp)
/* BD6BC 800BCABC 0040F809 */  jalr       $v0
/* BD6C0 800BCAC0 00642021 */   addu      $a0, $v1, $a0
.L800BCAC4:
/* BD6C4 800BCAC4 03C01021 */  addu       $v0, $fp, $zero
/* BD6C8 800BCAC8 8FBF003C */  lw         $ra, 0x3c($sp)
/* BD6CC 800BCACC 8FBE0038 */  lw         $fp, 0x38($sp)
/* BD6D0 800BCAD0 8FB70034 */  lw         $s7, 0x34($sp)
/* BD6D4 800BCAD4 8FB60030 */  lw         $s6, 0x30($sp)
/* BD6D8 800BCAD8 8FB5002C */  lw         $s5, 0x2c($sp)
/* BD6DC 800BCADC 8FB40028 */  lw         $s4, 0x28($sp)
/* BD6E0 800BCAE0 8FB30024 */  lw         $s3, 0x24($sp)
/* BD6E4 800BCAE4 8FB20020 */  lw         $s2, 0x20($sp)
/* BD6E8 800BCAE8 8FB1001C */  lw         $s1, 0x1c($sp)
/* BD6EC 800BCAEC 8FB00018 */  lw         $s0, 0x18($sp)
/* BD6F0 800BCAF0 03E00008 */  jr         $ra
/* BD6F4 800BCAF4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel some_textbox_func_800bcaf8
/* BD6F8 800BCAF8 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* BD6FC 800BCAFC AFB30024 */  sw         $s3, 0x24($sp)
/* BD700 800BCB00 93B30053 */  lbu        $s3, 0x53($sp)
/* BD704 800BCB04 AFB5002C */  sw         $s5, 0x2c($sp)
/* BD708 800BCB08 93B50057 */  lbu        $s5, 0x57($sp)
/* BD70C 800BCB0C AFB60030 */  sw         $s6, 0x30($sp)
/* BD710 800BCB10 93B6005B */  lbu        $s6, 0x5b($sp)
/* BD714 800BCB14 AFB70034 */  sw         $s7, 0x34($sp)
/* BD718 800BCB18 0080B821 */  addu       $s7, $a0, $zero
/* BD71C 800BCB1C AFB40028 */  sw         $s4, 0x28($sp)
/* BD720 800BCB20 93B4005F */  lbu        $s4, 0x5f($sp)
/* BD724 800BCB24 2404007C */  addiu      $a0, $zero, 0x7c
/* BD728 800BCB28 AFB00018 */  sw         $s0, 0x18($sp)
/* BD72C 800BCB2C 00A08021 */  addu       $s0, $a1, $zero
/* BD730 800BCB30 AFB1001C */  sw         $s1, 0x1c($sp)
/* BD734 800BCB34 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BD738 800BCB38 AFB20020 */  sw         $s2, 0x20($sp)
/* BD73C 800BCB3C AFBF0038 */  sw         $ra, 0x38($sp)
/* BD740 800BCB40 0C026259 */  jal        passToMalloc
/* BD744 800BCB44 30F2FFFF */   andi      $s2, $a3, 0xffff
/* BD748 800BCB48 00402021 */  addu       $a0, $v0, $zero
/* BD74C 800BCB4C 02002821 */  addu       $a1, $s0, $zero
/* BD750 800BCB50 0C02E3A0 */  jal        widgettext_func_2
/* BD754 800BCB54 24060190 */   addiu     $a2, $zero, 0x190
/* BD758 800BCB58 00408021 */  addu       $s0, $v0, $zero
/* BD75C 800BCB5C 02002021 */  addu       $a0, $s0, $zero
/* BD760 800BCB60 02202821 */  addu       $a1, $s1, $zero
/* BD764 800BCB64 0C02DD3F */  jal        set_widget_coords
/* BD768 800BCB68 02403021 */   addu      $a2, $s2, $zero
/* BD76C 800BCB6C 8E030078 */  lw         $v1, 0x78($s0)
/* BD770 800BCB70 02602821 */  addu       $a1, $s3, $zero
/* BD774 800BCB74 02A03021 */  addu       $a2, $s5, $zero
/* BD778 800BCB78 84640048 */  lh         $a0, 0x48($v1)
/* BD77C 800BCB7C 02C03821 */  addu       $a3, $s6, $zero
/* BD780 800BCB80 AFB40010 */  sw         $s4, 0x10($sp)
/* BD784 800BCB84 8C62004C */  lw         $v0, 0x4c($v1)
/* BD788 800BCB88 0040F809 */  jalr       $v0
/* BD78C 800BCB8C 02042021 */   addu      $a0, $s0, $a0
/* BD790 800BCB90 12E00006 */  beqz       $s7, .L800BCBAC
/* BD794 800BCB94 02002821 */   addu      $a1, $s0, $zero
/* BD798 800BCB98 8EE30078 */  lw         $v1, 0x78($s7)
/* BD79C 800BCB9C 84640030 */  lh         $a0, 0x30($v1)
/* BD7A0 800BCBA0 8C620034 */  lw         $v0, 0x34($v1)
/* BD7A4 800BCBA4 0040F809 */  jalr       $v0
/* BD7A8 800BCBA8 02E42021 */   addu      $a0, $s7, $a0
.L800BCBAC:
/* BD7AC 800BCBAC 02001021 */  addu       $v0, $s0, $zero
/* BD7B0 800BCBB0 8FBF0038 */  lw         $ra, 0x38($sp)
/* BD7B4 800BCBB4 8FB70034 */  lw         $s7, 0x34($sp)
/* BD7B8 800BCBB8 8FB60030 */  lw         $s6, 0x30($sp)
/* BD7BC 800BCBBC 8FB5002C */  lw         $s5, 0x2c($sp)
/* BD7C0 800BCBC0 8FB40028 */  lw         $s4, 0x28($sp)
/* BD7C4 800BCBC4 8FB30024 */  lw         $s3, 0x24($sp)
/* BD7C8 800BCBC8 8FB20020 */  lw         $s2, 0x20($sp)
/* BD7CC 800BCBCC 8FB1001C */  lw         $s1, 0x1c($sp)
/* BD7D0 800BCBD0 8FB00018 */  lw         $s0, 0x18($sp)
/* BD7D4 800BCBD4 03E00008 */  jr         $ra
/* BD7D8 800BCBD8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800BCBDC
/* BD7DC 800BCBDC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BD7E0 800BCBE0 AFB3001C */  sw         $s3, 0x1c($sp)
/* BD7E4 800BCBE4 97B30042 */  lhu        $s3, 0x42($sp)
/* BD7E8 800BCBE8 AFB50024 */  sw         $s5, 0x24($sp)
/* BD7EC 800BCBEC 0080A821 */  addu       $s5, $a0, $zero
/* BD7F0 800BCBF0 AFB40020 */  sw         $s4, 0x20($sp)
/* BD7F4 800BCBF4 97B40046 */  lhu        $s4, 0x46($sp)
/* BD7F8 800BCBF8 2404007C */  addiu      $a0, $zero, 0x7c
/* BD7FC 800BCBFC AFB00010 */  sw         $s0, 0x10($sp)
/* BD800 800BCC00 00A08021 */  addu       $s0, $a1, $zero
/* BD804 800BCC04 AFB10014 */  sw         $s1, 0x14($sp)
/* BD808 800BCC08 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BD80C 800BCC0C AFB20018 */  sw         $s2, 0x18($sp)
/* BD810 800BCC10 AFBF0028 */  sw         $ra, 0x28($sp)
/* BD814 800BCC14 0C026259 */  jal        passToMalloc
/* BD818 800BCC18 30F2FFFF */   andi      $s2, $a3, 0xffff
/* BD81C 800BCC1C 00402021 */  addu       $a0, $v0, $zero
/* BD820 800BCC20 02002821 */  addu       $a1, $s0, $zero
/* BD824 800BCC24 0C02E3A0 */  jal        widgettext_func_2
/* BD828 800BCC28 24060190 */   addiu     $a2, $zero, 0x190
/* BD82C 800BCC2C 00408021 */  addu       $s0, $v0, $zero
/* BD830 800BCC30 02002021 */  addu       $a0, $s0, $zero
/* BD834 800BCC34 02202821 */  addu       $a1, $s1, $zero
/* BD838 800BCC38 02403021 */  addu       $a2, $s2, $zero
/* BD83C 800BCC3C A6110064 */  sh         $s1, 0x64($s0)
/* BD840 800BCC40 A6120068 */  sh         $s2, 0x68($s0)
/* BD844 800BCC44 A6130066 */  sh         $s3, 0x66($s0)
/* BD848 800BCC48 0C02DD3F */  jal        set_widget_coords
/* BD84C 800BCC4C A614006A */   sh        $s4, 0x6a($s0)
/* BD850 800BCC50 12A00006 */  beqz       $s5, .L800BCC6C
/* BD854 800BCC54 02002821 */   addu      $a1, $s0, $zero
/* BD858 800BCC58 8EA30078 */  lw         $v1, 0x78($s5)
/* BD85C 800BCC5C 84640030 */  lh         $a0, 0x30($v1)
/* BD860 800BCC60 8C620034 */  lw         $v0, 0x34($v1)
/* BD864 800BCC64 0040F809 */  jalr       $v0
/* BD868 800BCC68 02A42021 */   addu      $a0, $s5, $a0
.L800BCC6C:
/* BD86C 800BCC6C 02001021 */  addu       $v0, $s0, $zero
/* BD870 800BCC70 8FBF0028 */  lw         $ra, 0x28($sp)
/* BD874 800BCC74 8FB50024 */  lw         $s5, 0x24($sp)
/* BD878 800BCC78 8FB40020 */  lw         $s4, 0x20($sp)
/* BD87C 800BCC7C 8FB3001C */  lw         $s3, 0x1c($sp)
/* BD880 800BCC80 8FB20018 */  lw         $s2, 0x18($sp)
/* BD884 800BCC84 8FB10014 */  lw         $s1, 0x14($sp)
/* BD888 800BCC88 8FB00010 */  lw         $s0, 0x10($sp)
/* BD88C 800BCC8C 03E00008 */  jr         $ra
/* BD890 800BCC90 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800BCC94
/* BD894 800BCC94 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* BD898 800BCC98 AFB50034 */  sw         $s5, 0x34($sp)
/* BD89C 800BCC9C 97B5005A */  lhu        $s5, 0x5a($sp)
/* BD8A0 800BCCA0 AFB60038 */  sw         $s6, 0x38($sp)
/* BD8A4 800BCCA4 97B6005E */  lhu        $s6, 0x5e($sp)
/* BD8A8 800BCCA8 AFB3002C */  sw         $s3, 0x2c($sp)
/* BD8AC 800BCCAC 93B30063 */  lbu        $s3, 0x63($sp)
/* BD8B0 800BCCB0 AFB7003C */  sw         $s7, 0x3c($sp)
/* BD8B4 800BCCB4 93B70067 */  lbu        $s7, 0x67($sp)
/* BD8B8 800BCCB8 93A2006B */  lbu        $v0, 0x6b($sp)
/* BD8BC 800BCCBC AFBE0040 */  sw         $fp, 0x40($sp)
/* BD8C0 800BCCC0 0080F021 */  addu       $fp, $a0, $zero
/* BD8C4 800BCCC4 AFB40030 */  sw         $s4, 0x30($sp)
/* BD8C8 800BCCC8 93B4006F */  lbu        $s4, 0x6f($sp)
/* BD8CC 800BCCCC 2404007C */  addiu      $a0, $zero, 0x7c
/* BD8D0 800BCCD0 AFB00020 */  sw         $s0, 0x20($sp)
/* BD8D4 800BCCD4 00A08021 */  addu       $s0, $a1, $zero
/* BD8D8 800BCCD8 AFB10024 */  sw         $s1, 0x24($sp)
/* BD8DC 800BCCDC 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BD8E0 800BCCE0 AFB20028 */  sw         $s2, 0x28($sp)
/* BD8E4 800BCCE4 30F2FFFF */  andi       $s2, $a3, 0xffff
/* BD8E8 800BCCE8 AFBF0044 */  sw         $ra, 0x44($sp)
/* BD8EC 800BCCEC 0C026259 */  jal        passToMalloc
/* BD8F0 800BCCF0 AFA20018 */   sw        $v0, 0x18($sp)
/* BD8F4 800BCCF4 00402021 */  addu       $a0, $v0, $zero
/* BD8F8 800BCCF8 02002821 */  addu       $a1, $s0, $zero
/* BD8FC 800BCCFC 0C02E3A0 */  jal        widgettext_func_2
/* BD900 800BCD00 24060190 */   addiu     $a2, $zero, 0x190
/* BD904 800BCD04 00408021 */  addu       $s0, $v0, $zero
/* BD908 800BCD08 02002021 */  addu       $a0, $s0, $zero
/* BD90C 800BCD0C 02202821 */  addu       $a1, $s1, $zero
/* BD910 800BCD10 0C02DD3F */  jal        set_widget_coords
/* BD914 800BCD14 02403021 */   addu      $a2, $s2, $zero
/* BD918 800BCD18 8E030078 */  lw         $v1, 0x78($s0)
/* BD91C 800BCD1C 02602821 */  addu       $a1, $s3, $zero
/* BD920 800BCD20 A6110064 */  sh         $s1, 0x64($s0)
/* BD924 800BCD24 A6120068 */  sh         $s2, 0x68($s0)
/* BD928 800BCD28 A6150066 */  sh         $s5, 0x66($s0)
/* BD92C 800BCD2C A616006A */  sh         $s6, 0x6a($s0)
/* BD930 800BCD30 8FA70018 */  lw         $a3, 0x18($sp)
/* BD934 800BCD34 84640048 */  lh         $a0, 0x48($v1)
/* BD938 800BCD38 02E03021 */  addu       $a2, $s7, $zero
/* BD93C 800BCD3C AFB40010 */  sw         $s4, 0x10($sp)
/* BD940 800BCD40 8C62004C */  lw         $v0, 0x4c($v1)
/* BD944 800BCD44 0040F809 */  jalr       $v0
/* BD948 800BCD48 02042021 */   addu      $a0, $s0, $a0
/* BD94C 800BCD4C 13C00006 */  beqz       $fp, .L800BCD68
/* BD950 800BCD50 02002821 */   addu      $a1, $s0, $zero
/* BD954 800BCD54 8FC30078 */  lw         $v1, 0x78($fp)
/* BD958 800BCD58 84640030 */  lh         $a0, 0x30($v1)
/* BD95C 800BCD5C 8C620034 */  lw         $v0, 0x34($v1)
/* BD960 800BCD60 0040F809 */  jalr       $v0
/* BD964 800BCD64 03C42021 */   addu      $a0, $fp, $a0
.L800BCD68:
/* BD968 800BCD68 02001021 */  addu       $v0, $s0, $zero
/* BD96C 800BCD6C 8FBF0044 */  lw         $ra, 0x44($sp)
/* BD970 800BCD70 8FBE0040 */  lw         $fp, 0x40($sp)
/* BD974 800BCD74 8FB7003C */  lw         $s7, 0x3c($sp)
/* BD978 800BCD78 8FB60038 */  lw         $s6, 0x38($sp)
/* BD97C 800BCD7C 8FB50034 */  lw         $s5, 0x34($sp)
/* BD980 800BCD80 8FB40030 */  lw         $s4, 0x30($sp)
/* BD984 800BCD84 8FB3002C */  lw         $s3, 0x2c($sp)
/* BD988 800BCD88 8FB20028 */  lw         $s2, 0x28($sp)
/* BD98C 800BCD8C 8FB10024 */  lw         $s1, 0x24($sp)
/* BD990 800BCD90 8FB00020 */  lw         $s0, 0x20($sp)
/* BD994 800BCD94 03E00008 */  jr         $ra
/* BD998 800BCD98 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800BCD9C
/* BD99C 800BCD9C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BD9A0 800BCDA0 AFB40020 */  sw         $s4, 0x20($sp)
/* BD9A4 800BCDA4 97B40042 */  lhu        $s4, 0x42($sp)
/* BD9A8 800BCDA8 AFB50024 */  sw         $s5, 0x24($sp)
/* BD9AC 800BCDAC 97B50046 */  lhu        $s5, 0x46($sp)
/* BD9B0 800BCDB0 AFB60028 */  sw         $s6, 0x28($sp)
/* BD9B4 800BCDB4 0080B021 */  addu       $s6, $a0, $zero
/* BD9B8 800BCDB8 AFB00010 */  sw         $s0, 0x10($sp)
/* BD9BC 800BCDBC 97B0004A */  lhu        $s0, 0x4a($sp)
/* BD9C0 800BCDC0 2404007C */  addiu      $a0, $zero, 0x7c
/* BD9C4 800BCDC4 AFB20018 */  sw         $s2, 0x18($sp)
/* BD9C8 800BCDC8 00A09021 */  addu       $s2, $a1, $zero
/* BD9CC 800BCDCC AFB10014 */  sw         $s1, 0x14($sp)
/* BD9D0 800BCDD0 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BD9D4 800BCDD4 AFB3001C */  sw         $s3, 0x1c($sp)
/* BD9D8 800BCDD8 AFBF002C */  sw         $ra, 0x2c($sp)
/* BD9DC 800BCDDC 0C026259 */  jal        passToMalloc
/* BD9E0 800BCDE0 30F3FFFF */   andi      $s3, $a3, 0xffff
/* BD9E4 800BCDE4 00402021 */  addu       $a0, $v0, $zero
/* BD9E8 800BCDE8 02402821 */  addu       $a1, $s2, $zero
/* BD9EC 800BCDEC 0C02DFC8 */  jal        widgetcliptext_init
/* BD9F0 800BCDF0 02003021 */   addu      $a2, $s0, $zero
/* BD9F4 800BCDF4 00408021 */  addu       $s0, $v0, $zero
/* BD9F8 800BCDF8 02002021 */  addu       $a0, $s0, $zero
/* BD9FC 800BCDFC 02202821 */  addu       $a1, $s1, $zero
/* BDA00 800BCE00 0C02DD3F */  jal        set_widget_coords
/* BDA04 800BCE04 02603021 */   addu      $a2, $s3, $zero
/* BDA08 800BCE08 02002021 */  addu       $a0, $s0, $zero
/* BDA0C 800BCE0C 00112C00 */  sll        $a1, $s1, 0x10
/* BDA10 800BCE10 00052C03 */  sra        $a1, $a1, 0x10
/* BDA14 800BCE14 00143400 */  sll        $a2, $s4, 0x10
/* BDA18 800BCE18 00063403 */  sra        $a2, $a2, 0x10
/* BDA1C 800BCE1C A6110064 */  sh         $s1, 0x64($s0)
/* BDA20 800BCE20 A6130068 */  sh         $s3, 0x68($s0)
/* BDA24 800BCE24 A6140066 */  sh         $s4, 0x66($s0)
/* BDA28 800BCE28 0C02EF52 */  jal        func_800BBD48
/* BDA2C 800BCE2C A615006A */   sh        $s5, 0x6a($s0)
/* BDA30 800BCE30 12C00006 */  beqz       $s6, .L800BCE4C
/* BDA34 800BCE34 02002821 */   addu      $a1, $s0, $zero
/* BDA38 800BCE38 8EC30078 */  lw         $v1, 0x78($s6)
/* BDA3C 800BCE3C 84640030 */  lh         $a0, 0x30($v1)
/* BDA40 800BCE40 8C620034 */  lw         $v0, 0x34($v1)
/* BDA44 800BCE44 0040F809 */  jalr       $v0
/* BDA48 800BCE48 02C42021 */   addu      $a0, $s6, $a0
.L800BCE4C:
/* BDA4C 800BCE4C 02001021 */  addu       $v0, $s0, $zero
/* BDA50 800BCE50 8FBF002C */  lw         $ra, 0x2c($sp)
/* BDA54 800BCE54 8FB60028 */  lw         $s6, 0x28($sp)
/* BDA58 800BCE58 8FB50024 */  lw         $s5, 0x24($sp)
/* BDA5C 800BCE5C 8FB40020 */  lw         $s4, 0x20($sp)
/* BDA60 800BCE60 8FB3001C */  lw         $s3, 0x1c($sp)
/* BDA64 800BCE64 8FB20018 */  lw         $s2, 0x18($sp)
/* BDA68 800BCE68 8FB10014 */  lw         $s1, 0x14($sp)
/* BDA6C 800BCE6C 8FB00010 */  lw         $s0, 0x10($sp)
/* BDA70 800BCE70 03E00008 */  jr         $ra
/* BDA74 800BCE74 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800BCE78
/* BDA78 800BCE78 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* BDA7C 800BCE7C AFB30034 */  sw         $s3, 0x34($sp)
/* BDA80 800BCE80 97B30062 */  lhu        $s3, 0x62($sp)
/* BDA84 800BCE84 AFB70044 */  sw         $s7, 0x44($sp)
/* BDA88 800BCE88 97B70066 */  lhu        $s7, 0x66($sp)
/* BDA8C 800BCE8C 97A2006A */  lhu        $v0, 0x6a($sp)
/* BDA90 800BCE90 AFB5003C */  sw         $s5, 0x3c($sp)
/* BDA94 800BCE94 97B5006E */  lhu        $s5, 0x6e($sp)
/* BDA98 800BCE98 AFB20030 */  sw         $s2, 0x30($sp)
/* BDA9C 800BCE9C 93B20077 */  lbu        $s2, 0x77($sp)
/* BDAA0 800BCEA0 AFBE0048 */  sw         $fp, 0x48($sp)
/* BDAA4 800BCEA4 0080F021 */  addu       $fp, $a0, $zero
/* BDAA8 800BCEA8 AFB60040 */  sw         $s6, 0x40($sp)
/* BDAAC 800BCEAC 93B60083 */  lbu        $s6, 0x83($sp)
/* BDAB0 800BCEB0 2404007C */  addiu      $a0, $zero, 0x7c
/* BDAB4 800BCEB4 AFB00028 */  sw         $s0, 0x28($sp)
/* BDAB8 800BCEB8 AFA20018 */  sw         $v0, 0x18($sp)
/* BDABC 800BCEBC 97A20072 */  lhu        $v0, 0x72($sp)
/* BDAC0 800BCEC0 30B0FFFF */  andi       $s0, $a1, 0xffff
/* BDAC4 800BCEC4 AFB40038 */  sw         $s4, 0x38($sp)
/* BDAC8 800BCEC8 AFA2001C */  sw         $v0, 0x1c($sp)
/* BDACC 800BCECC 93A2007B */  lbu        $v0, 0x7b($sp)
/* BDAD0 800BCED0 30D400FF */  andi       $s4, $a2, 0xff
/* BDAD4 800BCED4 AFB1002C */  sw         $s1, 0x2c($sp)
/* BDAD8 800BCED8 AFA20020 */  sw         $v0, 0x20($sp)
/* BDADC 800BCEDC 93A2007F */  lbu        $v0, 0x7f($sp)
/* BDAE0 800BCEE0 30F1FFFF */  andi       $s1, $a3, 0xffff
/* BDAE4 800BCEE4 AFBF004C */  sw         $ra, 0x4c($sp)
/* BDAE8 800BCEE8 0C026259 */  jal        passToMalloc
/* BDAEC 800BCEEC AFA20024 */   sw        $v0, 0x24($sp)
/* BDAF0 800BCEF0 00402021 */  addu       $a0, $v0, $zero
/* BDAF4 800BCEF4 0C02E9D7 */  jal        widgetarraymenu_func
/* BDAF8 800BCEF8 02002821 */   addu      $a1, $s0, $zero
/* BDAFC 800BCEFC 00408021 */  addu       $s0, $v0, $zero
/* BDB00 800BCF00 02002021 */  addu       $a0, $s0, $zero
/* BDB04 800BCF04 02202821 */  addu       $a1, $s1, $zero
/* BDB08 800BCF08 8E020040 */  lw         $v0, 0x40($s0)
/* BDB0C 800BCF0C 02603021 */  addu       $a2, $s3, $zero
/* BDB10 800BCF10 0C02DD3F */  jal        set_widget_coords
/* BDB14 800BCF14 A454000A */   sh        $s4, 0xa($v0)
/* BDB18 800BCF18 A6170064 */  sh         $s7, 0x64($s0)
/* BDB1C 800BCF1C A6150066 */  sh         $s5, 0x66($s0)
/* BDB20 800BCF20 8FA20018 */  lw         $v0, 0x18($sp)
/* BDB24 800BCF24 8E030078 */  lw         $v1, 0x78($s0)
/* BDB28 800BCF28 A6020068 */  sh         $v0, 0x68($s0)
/* BDB2C 800BCF2C 8FA2001C */  lw         $v0, 0x1c($sp)
/* BDB30 800BCF30 A602006A */  sh         $v0, 0x6a($s0)
/* BDB34 800BCF34 84640048 */  lh         $a0, 0x48($v1)
/* BDB38 800BCF38 8FA60020 */  lw         $a2, 0x20($sp)
/* BDB3C 800BCF3C 02402821 */  addu       $a1, $s2, $zero
/* BDB40 800BCF40 AFB60010 */  sw         $s6, 0x10($sp)
/* BDB44 800BCF44 8C62004C */  lw         $v0, 0x4c($v1)
/* BDB48 800BCF48 8FA70024 */  lw         $a3, 0x24($sp)
/* BDB4C 800BCF4C 0040F809 */  jalr       $v0
/* BDB50 800BCF50 02042021 */   addu      $a0, $s0, $a0
/* BDB54 800BCF54 13C00006 */  beqz       $fp, .L800BCF70
/* BDB58 800BCF58 02002821 */   addu      $a1, $s0, $zero
/* BDB5C 800BCF5C 8FC30078 */  lw         $v1, 0x78($fp)
/* BDB60 800BCF60 84640030 */  lh         $a0, 0x30($v1)
/* BDB64 800BCF64 8C620034 */  lw         $v0, 0x34($v1)
/* BDB68 800BCF68 0040F809 */  jalr       $v0
/* BDB6C 800BCF6C 03C42021 */   addu      $a0, $fp, $a0
.L800BCF70:
/* BDB70 800BCF70 02001021 */  addu       $v0, $s0, $zero
/* BDB74 800BCF74 8FBF004C */  lw         $ra, 0x4c($sp)
/* BDB78 800BCF78 8FBE0048 */  lw         $fp, 0x48($sp)
/* BDB7C 800BCF7C 8FB70044 */  lw         $s7, 0x44($sp)
/* BDB80 800BCF80 8FB60040 */  lw         $s6, 0x40($sp)
/* BDB84 800BCF84 8FB5003C */  lw         $s5, 0x3c($sp)
/* BDB88 800BCF88 8FB40038 */  lw         $s4, 0x38($sp)
/* BDB8C 800BCF8C 8FB30034 */  lw         $s3, 0x34($sp)
/* BDB90 800BCF90 8FB20030 */  lw         $s2, 0x30($sp)
/* BDB94 800BCF94 8FB1002C */  lw         $s1, 0x2c($sp)
/* BDB98 800BCF98 8FB00028 */  lw         $s0, 0x28($sp)
/* BDB9C 800BCF9C 03E00008 */  jr         $ra
/* BDBA0 800BCFA0 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_800BCFA4
/* BDBA4 800BCFA4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BDBA8 800BCFA8 AFB3001C */  sw         $s3, 0x1c($sp)
/* BDBAC 800BCFAC 00809821 */  addu       $s3, $a0, $zero
/* BDBB0 800BCFB0 2404007C */  addiu      $a0, $zero, 0x7c
/* BDBB4 800BCFB4 AFB00010 */  sw         $s0, 0x10($sp)
/* BDBB8 800BCFB8 00A08021 */  addu       $s0, $a1, $zero
/* BDBBC 800BCFBC AFB10014 */  sw         $s1, 0x14($sp)
/* BDBC0 800BCFC0 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BDBC4 800BCFC4 AFB20018 */  sw         $s2, 0x18($sp)
/* BDBC8 800BCFC8 AFBF0020 */  sw         $ra, 0x20($sp)
/* BDBCC 800BCFCC 0C026259 */  jal        passToMalloc
/* BDBD0 800BCFD0 30F2FFFF */   andi      $s2, $a3, 0xffff
/* BDBD4 800BCFD4 00402021 */  addu       $a0, $v0, $zero
/* BDBD8 800BCFD8 0C02E518 */  jal        borg8_widget
/* BDBDC 800BCFDC 02002821 */   addu      $a1, $s0, $zero
/* BDBE0 800BCFE0 00408021 */  addu       $s0, $v0, $zero
/* BDBE4 800BCFE4 16000003 */  bnez       $s0, .L800BCFF4
/* BDBE8 800BCFE8 02002021 */   addu      $a0, $s0, $zero
/* BDBEC 800BCFEC 0802F408 */  j          .L800BD020
/* BDBF0 800BCFF0 00001021 */   addu      $v0, $zero, $zero
.L800BCFF4:
/* BDBF4 800BCFF4 02202821 */  addu       $a1, $s1, $zero
/* BDBF8 800BCFF8 0C02DD3F */  jal        set_widget_coords
/* BDBFC 800BCFFC 02403021 */   addu      $a2, $s2, $zero
/* BDC00 800BD000 12600006 */  beqz       $s3, .L800BD01C
/* BDC04 800BD004 02002821 */   addu      $a1, $s0, $zero
/* BDC08 800BD008 8E630078 */  lw         $v1, 0x78($s3)
/* BDC0C 800BD00C 84640030 */  lh         $a0, 0x30($v1)
/* BDC10 800BD010 8C620034 */  lw         $v0, 0x34($v1)
/* BDC14 800BD014 0040F809 */  jalr       $v0
/* BDC18 800BD018 02642021 */   addu      $a0, $s3, $a0
.L800BD01C:
/* BDC1C 800BD01C 02001021 */  addu       $v0, $s0, $zero
.L800BD020:
/* BDC20 800BD020 8FBF0020 */  lw         $ra, 0x20($sp)
/* BDC24 800BD024 8FB3001C */  lw         $s3, 0x1c($sp)
/* BDC28 800BD028 8FB20018 */  lw         $s2, 0x18($sp)
/* BDC2C 800BD02C 8FB10014 */  lw         $s1, 0x14($sp)
/* BDC30 800BD030 8FB00010 */  lw         $s0, 0x10($sp)
/* BDC34 800BD034 03E00008 */  jr         $ra
/* BDC38 800BD038 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BD03C
/* BDC3C 800BD03C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BDC40 800BD040 AFB20018 */  sw         $s2, 0x18($sp)
/* BDC44 800BD044 30D2FFFF */  andi       $s2, $a2, 0xffff
/* BDC48 800BD048 AFB3001C */  sw         $s3, 0x1c($sp)
/* BDC4C 800BD04C 30F3FFFF */  andi       $s3, $a3, 0xffff
/* BDC50 800BD050 AFB00010 */  sw         $s0, 0x10($sp)
/* BDC54 800BD054 97B0003A */  lhu        $s0, 0x3a($sp)
/* BDC58 800BD058 02403021 */  addu       $a2, $s2, $zero
/* BDC5C 800BD05C AFB40020 */  sw         $s4, 0x20($sp)
/* BDC60 800BD060 97B4003E */  lhu        $s4, 0x3e($sp)
/* BDC64 800BD064 02603821 */  addu       $a3, $s3, $zero
/* BDC68 800BD068 AFBF0024 */  sw         $ra, 0x24($sp)
/* BDC6C 800BD06C 0C02F3E9 */  jal        func_800BCFA4
/* BDC70 800BD070 AFB10014 */   sw        $s1, 0x14($sp)
/* BDC74 800BD074 00408821 */  addu       $s1, $v0, $zero
/* BDC78 800BD078 1220000D */  beqz       $s1, .L800BD0B0
/* BDC7C 800BD07C 02202021 */   addu      $a0, $s1, $zero
/* BDC80 800BD080 02122823 */  subu       $a1, $s0, $s2
/* BDC84 800BD084 24A50001 */  addiu      $a1, $a1, 1
/* BDC88 800BD088 30A5FFFF */  andi       $a1, $a1, 0xffff
/* BDC8C 800BD08C 02938023 */  subu       $s0, $s4, $s3
/* BDC90 800BD090 26100001 */  addiu      $s0, $s0, 1
/* BDC94 800BD094 0C02DD42 */  jal        set_widgetHeight
/* BDC98 800BD098 3210FFFF */   andi      $s0, $s0, 0xffff
/* BDC9C 800BD09C 02202021 */  addu       $a0, $s1, $zero
/* BDCA0 800BD0A0 0C02DD46 */  jal        set_widgetWidth
/* BDCA4 800BD0A4 02002821 */   addu      $a1, $s0, $zero
/* BDCA8 800BD0A8 0802F42D */  j          .L800BD0B4
/* BDCAC 800BD0AC 02201021 */   addu      $v0, $s1, $zero
.L800BD0B0:
/* BDCB0 800BD0B0 00001021 */  addu       $v0, $zero, $zero
.L800BD0B4:
/* BDCB4 800BD0B4 8FBF0024 */  lw         $ra, 0x24($sp)
/* BDCB8 800BD0B8 8FB40020 */  lw         $s4, 0x20($sp)
/* BDCBC 800BD0BC 8FB3001C */  lw         $s3, 0x1c($sp)
/* BDCC0 800BD0C0 8FB20018 */  lw         $s2, 0x18($sp)
/* BDCC4 800BD0C4 8FB10014 */  lw         $s1, 0x14($sp)
/* BDCC8 800BD0C8 8FB00010 */  lw         $s0, 0x10($sp)
/* BDCCC 800BD0CC 03E00008 */  jr         $ra
/* BDCD0 800BD0D0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel widgetscrollmenu_init_2
/* BDCD4 800BD0D4 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* BDCD8 800BD0D8 AFB40030 */  sw         $s4, 0x30($sp)
/* BDCDC 800BD0DC 97B4005A */  lhu        $s4, 0x5a($sp)
/* BDCE0 800BD0E0 97A2005E */  lhu        $v0, 0x5e($sp)
/* BDCE4 800BD0E4 AFB3002C */  sw         $s3, 0x2c($sp)
/* BDCE8 800BD0E8 97B30062 */  lhu        $s3, 0x62($sp)
/* BDCEC 800BD0EC AFB50034 */  sw         $s5, 0x34($sp)
/* BDCF0 800BD0F0 97B50066 */  lhu        $s5, 0x66($sp)
/* BDCF4 800BD0F4 AFB7003C */  sw         $s7, 0x3c($sp)
/* BDCF8 800BD0F8 93B7006B */  lbu        $s7, 0x6b($sp)
/* BDCFC 800BD0FC AFBE0040 */  sw         $fp, 0x40($sp)
/* BDD00 800BD100 93BE006F */  lbu        $fp, 0x6f($sp)
/* BDD04 800BD104 AFB60038 */  sw         $s6, 0x38($sp)
/* BDD08 800BD108 93B60073 */  lbu        $s6, 0x73($sp)
/* BDD0C 800BD10C 93A30077 */  lbu        $v1, 0x77($sp)
/* BDD10 800BD110 AFA40048 */  sw         $a0, 0x48($sp)
/* BDD14 800BD114 2404007C */  addiu      $a0, $zero, 0x7c
/* BDD18 800BD118 AFB00020 */  sw         $s0, 0x20($sp)
/* BDD1C 800BD11C 30B0FFFF */  andi       $s0, $a1, 0xffff
/* BDD20 800BD120 AFB10024 */  sw         $s1, 0x24($sp)
/* BDD24 800BD124 30D1FFFF */  andi       $s1, $a2, 0xffff
/* BDD28 800BD128 AFB20028 */  sw         $s2, 0x28($sp)
/* BDD2C 800BD12C 30F2FFFF */  andi       $s2, $a3, 0xffff
/* BDD30 800BD130 AFBF0044 */  sw         $ra, 0x44($sp)
/* BDD34 800BD134 AFA20018 */  sw         $v0, 0x18($sp)
/* BDD38 800BD138 0C026259 */  jal        passToMalloc
/* BDD3C 800BD13C AFA3001C */   sw        $v1, 0x1c($sp)
/* BDD40 800BD140 00402021 */  addu       $a0, $v0, $zero
/* BDD44 800BD144 0C02E68C */  jal        widgetscrollmenu_init
/* BDD48 800BD148 02002821 */   addu      $a1, $s0, $zero
/* BDD4C 800BD14C 00408021 */  addu       $s0, $v0, $zero
/* BDD50 800BD150 02002021 */  addu       $a0, $s0, $zero
/* BDD54 800BD154 02202821 */  addu       $a1, $s1, $zero
/* BDD58 800BD158 0C02DD3F */  jal        set_widget_coords
/* BDD5C 800BD15C 02403021 */   addu      $a2, $s2, $zero
/* BDD60 800BD160 8E030078 */  lw         $v1, 0x78($s0)
/* BDD64 800BD164 02E02821 */  addu       $a1, $s7, $zero
/* BDD68 800BD168 A6140064 */  sh         $s4, 0x64($s0)
/* BDD6C 800BD16C A6130066 */  sh         $s3, 0x66($s0)
/* BDD70 800BD170 8FA40018 */  lw         $a0, 0x18($sp)
/* BDD74 800BD174 03C03021 */  addu       $a2, $fp, $zero
/* BDD78 800BD178 A615006A */  sh         $s5, 0x6a($s0)
/* BDD7C 800BD17C A6040068 */  sh         $a0, 0x68($s0)
/* BDD80 800BD180 84640048 */  lh         $a0, 0x48($v1)
/* BDD84 800BD184 8FA2001C */  lw         $v0, 0x1c($sp)
/* BDD88 800BD188 02C03821 */  addu       $a3, $s6, $zero
/* BDD8C 800BD18C AFA20010 */  sw         $v0, 0x10($sp)
/* BDD90 800BD190 8C62004C */  lw         $v0, 0x4c($v1)
/* BDD94 800BD194 0040F809 */  jalr       $v0
/* BDD98 800BD198 02042021 */   addu      $a0, $s0, $a0
/* BDD9C 800BD19C 8FA30048 */  lw         $v1, 0x48($sp)
/* BDDA0 800BD1A0 10600007 */  beqz       $v1, .L800BD1C0
/* BDDA4 800BD1A4 02002821 */   addu      $a1, $s0, $zero
/* BDDA8 800BD1A8 8C630078 */  lw         $v1, 0x78($v1)
/* BDDAC 800BD1AC 84640030 */  lh         $a0, 0x30($v1)
/* BDDB0 800BD1B0 8C620034 */  lw         $v0, 0x34($v1)
/* BDDB4 800BD1B4 8FA30048 */  lw         $v1, 0x48($sp)
/* BDDB8 800BD1B8 0040F809 */  jalr       $v0
/* BDDBC 800BD1BC 00642021 */   addu      $a0, $v1, $a0
.L800BD1C0:
/* BDDC0 800BD1C0 8FA40078 */  lw         $a0, 0x78($sp)
/* BDDC4 800BD1C4 1080000B */  beqz       $a0, .L800BD1F4
/* BDDC8 800BD1C8 02001021 */   addu      $v0, $s0, $zero
/* BDDCC 800BD1CC 8E030040 */  lw         $v1, 0x40($s0)
/* BDDD0 800BD1D0 A0770003 */  sb         $s7, 3($v1)
/* BDDD4 800BD1D4 A0770002 */  sb         $s7, 2($v1)
/* BDDD8 800BD1D8 A07E0005 */  sb         $fp, 5($v1)
/* BDDDC 800BD1DC A07E0004 */  sb         $fp, 4($v1)
/* BDDE0 800BD1E0 A0760007 */  sb         $s6, 7($v1)
/* BDDE4 800BD1E4 A0760006 */  sb         $s6, 6($v1)
/* BDDE8 800BD1E8 8FA4001C */  lw         $a0, 0x1c($sp)
/* BDDEC 800BD1EC A0640009 */  sb         $a0, 9($v1)
/* BDDF0 800BD1F0 A0640008 */  sb         $a0, 8($v1)
.L800BD1F4:
/* BDDF4 800BD1F4 8FBF0044 */  lw         $ra, 0x44($sp)
/* BDDF8 800BD1F8 8FBE0040 */  lw         $fp, 0x40($sp)
/* BDDFC 800BD1FC 8FB7003C */  lw         $s7, 0x3c($sp)
/* BDE00 800BD200 8FB60038 */  lw         $s6, 0x38($sp)
/* BDE04 800BD204 8FB50034 */  lw         $s5, 0x34($sp)
/* BDE08 800BD208 8FB40030 */  lw         $s4, 0x30($sp)
/* BDE0C 800BD20C 8FB3002C */  lw         $s3, 0x2c($sp)
/* BDE10 800BD210 8FB20028 */  lw         $s2, 0x28($sp)
/* BDE14 800BD214 8FB10024 */  lw         $s1, 0x24($sp)
/* BDE18 800BD218 8FB00020 */  lw         $s0, 0x20($sp)
/* BDE1C 800BD21C 03E00008 */  jr         $ra
/* BDE20 800BD220 27BD0048 */   addiu     $sp, $sp, 0x48
/* BDE24 800BD224 00000000 */  nop
/* BDE28 800BD228 00000000 */  nop
/* BDE2C 800BD22C 00000000 */  nop
