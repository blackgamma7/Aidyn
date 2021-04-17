.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800ADAE0
/* AE6E0 800ADAE0 C4C00000 */  lwc1       $f0, ($a2)
/* AE6E4 800ADAE4 27BDFF88 */  addiu      $sp, $sp, -0x78
/* AE6E8 800ADAE8 AFB10054 */  sw         $s1, 0x54($sp)
/* AE6EC 800ADAEC 00808821 */  addu       $s1, $a0, $zero
/* AE6F0 800ADAF0 AFB00050 */  sw         $s0, 0x50($sp)
/* AE6F4 800ADAF4 00A08021 */  addu       $s0, $a1, $zero
/* AE6F8 800ADAF8 AFBF0068 */  sw         $ra, 0x68($sp)
/* AE6FC 800ADAFC AFB50064 */  sw         $s5, 0x64($sp)
/* AE700 800ADB00 AFB40060 */  sw         $s4, 0x60($sp)
/* AE704 800ADB04 AFB3005C */  sw         $s3, 0x5c($sp)
/* AE708 800ADB08 AFB20058 */  sw         $s2, 0x58($sp)
/* AE70C 800ADB0C F7B40070 */  sdc1       $f20, 0x70($sp)
/* AE710 800ADB10 C4C20008 */  lwc1       $f2, 8($a2)
/* AE714 800ADB14 4487A000 */  mtc1       $a3, $f20
/* AE718 800ADB18 8FB20088 */  lw         $s2, 0x88($sp)
/* AE71C 800ADB1C 8FB3008C */  lw         $s3, 0x8c($sp)
/* AE720 800ADB20 8FB40090 */  lw         $s4, 0x90($sp)
/* AE724 800ADB24 8FB50094 */  lw         $s5, 0x94($sp)
/* AE728 800ADB28 27A40010 */  addiu      $a0, $sp, 0x10
/* AE72C 800ADB2C E7A00010 */  swc1       $f0, 0x10($sp)
/* AE730 800ADB30 0C02AB04 */  jal        vec2_length
/* AE734 800ADB34 E7A20014 */   swc1      $f2, 0x14($sp)
/* AE738 800ADB38 46140000 */  add.s      $f0, $f0, $f20
/* AE73C 800ADB3C 3C01800E */  lui        $at, %hi(D_800E36F0)
/* AE740 800ADB40 C42436F0 */  lwc1       $f4, %lo(D_800E36F0)($at)
/* AE744 800ADB44 C6020000 */  lwc1       $f2, ($s0)
/* AE748 800ADB48 46040000 */  add.s      $f0, $f0, $f4
/* AE74C 800ADB4C C6240000 */  lwc1       $f4, ($s1)
/* AE750 800ADB50 46041081 */  sub.s      $f2, $f2, $f4
/* AE754 800ADB54 46001081 */  sub.s      $f2, $f2, $f0
/* AE758 800ADB58 C628000C */  lwc1       $f8, 0xc($s1)
/* AE75C 800ADB5C 46081083 */  div.s      $f2, $f2, $f8
/* AE760 800ADB60 4600110D */  trunc.w.s  $f4, $f2
/* AE764 800ADB64 44022000 */  mfc1       $v0, $f4
/* AE768 800ADB68 A6420000 */  sh         $v0, ($s2)
/* AE76C 800ADB6C C6020008 */  lwc1       $f2, 8($s0)
/* AE770 800ADB70 C6240008 */  lwc1       $f4, 8($s1)
/* AE774 800ADB74 46041081 */  sub.s      $f2, $f2, $f4
/* AE778 800ADB78 46001081 */  sub.s      $f2, $f2, $f0
/* AE77C 800ADB7C C6260010 */  lwc1       $f6, 0x10($s1)
/* AE780 800ADB80 46061083 */  div.s      $f2, $f2, $f6
/* AE784 800ADB84 4600110D */  trunc.w.s  $f4, $f2
/* AE788 800ADB88 44022000 */  mfc1       $v0, $f4
/* AE78C 800ADB8C A6620000 */  sh         $v0, ($s3)
/* AE790 800ADB90 C6020000 */  lwc1       $f2, ($s0)
/* AE794 800ADB94 C6240000 */  lwc1       $f4, ($s1)
/* AE798 800ADB98 46041081 */  sub.s      $f2, $f2, $f4
/* AE79C 800ADB9C 46001080 */  add.s      $f2, $f2, $f0
/* AE7A0 800ADBA0 46081083 */  div.s      $f2, $f2, $f8
/* AE7A4 800ADBA4 4600110D */  trunc.w.s  $f4, $f2
/* AE7A8 800ADBA8 44022000 */  mfc1       $v0, $f4
/* AE7AC 800ADBAC A6820000 */  sh         $v0, ($s4)
/* AE7B0 800ADBB0 C6020008 */  lwc1       $f2, 8($s0)
/* AE7B4 800ADBB4 C6240008 */  lwc1       $f4, 8($s1)
/* AE7B8 800ADBB8 46041081 */  sub.s      $f2, $f2, $f4
/* AE7BC 800ADBBC 46001080 */  add.s      $f2, $f2, $f0
/* AE7C0 800ADBC0 46061083 */  div.s      $f2, $f2, $f6
/* AE7C4 800ADBC4 4600100D */  trunc.w.s  $f0, $f2
/* AE7C8 800ADBC8 44020000 */  mfc1       $v0, $f0
/* AE7CC 800ADBCC A6A20000 */  sh         $v0, ($s5)
/* AE7D0 800ADBD0 86430000 */  lh         $v1, ($s2)
/* AE7D4 800ADBD4 04620001 */  bltzl      $v1, .L800ADBDC
/* AE7D8 800ADBD8 A6400000 */   sh        $zero, ($s2)
.L800ADBDC:
/* AE7DC 800ADBDC 86620000 */  lh         $v0, ($s3)
/* AE7E0 800ADBE0 04420001 */  bltzl      $v0, .L800ADBE8
/* AE7E4 800ADBE4 A6600000 */   sh        $zero, ($s3)
.L800ADBE8:
/* AE7E8 800ADBE8 86820000 */  lh         $v0, ($s4)
/* AE7EC 800ADBEC 9623001C */  lhu        $v1, 0x1c($s1)
/* AE7F0 800ADBF0 0043102A */  slt        $v0, $v0, $v1
/* AE7F4 800ADBF4 54400004 */  bnel       $v0, $zero, .L800ADC08
/* AE7F8 800ADBF8 86A20000 */   lh        $v0, ($s5)
/* AE7FC 800ADBFC 2462FFFF */  addiu      $v0, $v1, -1
/* AE800 800ADC00 A6820000 */  sh         $v0, ($s4)
/* AE804 800ADC04 86A20000 */  lh         $v0, ($s5)
.L800ADC08:
/* AE808 800ADC08 9624001E */  lhu        $a0, 0x1e($s1)
/* AE80C 800ADC0C 0044102A */  slt        $v0, $v0, $a0
/* AE810 800ADC10 14400003 */  bnez       $v0, .L800ADC20
/* AE814 800ADC14 8FBF0068 */   lw        $ra, 0x68($sp)
/* AE818 800ADC18 2482FFFF */  addiu      $v0, $a0, -1
/* AE81C 800ADC1C A6A20000 */  sh         $v0, ($s5)
.L800ADC20:
/* AE820 800ADC20 8FB50064 */  lw         $s5, 0x64($sp)
/* AE824 800ADC24 8FB40060 */  lw         $s4, 0x60($sp)
/* AE828 800ADC28 8FB3005C */  lw         $s3, 0x5c($sp)
/* AE82C 800ADC2C 8FB20058 */  lw         $s2, 0x58($sp)
/* AE830 800ADC30 8FB10054 */  lw         $s1, 0x54($sp)
/* AE834 800ADC34 8FB00050 */  lw         $s0, 0x50($sp)
/* AE838 800ADC38 D7B40070 */  ldc1       $f20, 0x70($sp)
/* AE83C 800ADC3C 03E00008 */  jr         $ra
/* AE840 800ADC40 27BD0078 */   addiu     $sp, $sp, 0x78

glabel func_800ADC44
/* AE844 800ADC44 27BDFF90 */  addiu      $sp, $sp, -0x70
/* AE848 800ADC48 AFB00050 */  sw         $s0, 0x50($sp)
/* AE84C 800ADC4C 00A08021 */  addu       $s0, $a1, $zero
/* AE850 800ADC50 AFB10054 */  sw         $s1, 0x54($sp)
/* AE854 800ADC54 00808821 */  addu       $s1, $a0, $zero
/* AE858 800ADC58 AFB20058 */  sw         $s2, 0x58($sp)
/* AE85C 800ADC5C 00C09021 */  addu       $s2, $a2, $zero
/* AE860 800ADC60 AFB3005C */  sw         $s3, 0x5c($sp)
/* AE864 800ADC64 00E09821 */  addu       $s3, $a3, $zero
/* AE868 800ADC68 AFBF0068 */  sw         $ra, 0x68($sp)
/* AE86C 800ADC6C AFB50064 */  sw         $s5, 0x64($sp)
/* AE870 800ADC70 AFB40060 */  sw         $s4, 0x60($sp)
/* AE874 800ADC74 C6000010 */  lwc1       $f0, 0x10($s0)
/* AE878 800ADC78 C6020018 */  lwc1       $f2, 0x18($s0)
/* AE87C 800ADC7C 8FB40080 */  lw         $s4, 0x80($sp)
/* AE880 800ADC80 8FB50084 */  lw         $s5, 0x84($sp)
/* AE884 800ADC84 27A40010 */  addiu      $a0, $sp, 0x10
/* AE888 800ADC88 E7A00010 */  swc1       $f0, 0x10($sp)
/* AE88C 800ADC8C 0C02AB04 */  jal        vec2_length
/* AE890 800ADC90 E7A20014 */   swc1      $f2, 0x14($sp)
/* AE894 800ADC94 C6020000 */  lwc1       $f2, ($s0)
/* AE898 800ADC98 46020000 */  add.s      $f0, $f0, $f2
/* AE89C 800ADC9C 3C01800E */  lui        $at, %hi(D_800E36F4)
/* AE8A0 800ADCA0 C42436F4 */  lwc1       $f4, %lo(D_800E36F4)($at)
/* AE8A4 800ADCA4 C6020004 */  lwc1       $f2, 4($s0)
/* AE8A8 800ADCA8 46040000 */  add.s      $f0, $f0, $f4
/* AE8AC 800ADCAC C6240000 */  lwc1       $f4, ($s1)
/* AE8B0 800ADCB0 46041081 */  sub.s      $f2, $f2, $f4
/* AE8B4 800ADCB4 46001081 */  sub.s      $f2, $f2, $f0
/* AE8B8 800ADCB8 C628000C */  lwc1       $f8, 0xc($s1)
/* AE8BC 800ADCBC 46081083 */  div.s      $f2, $f2, $f8
/* AE8C0 800ADCC0 4600110D */  trunc.w.s  $f4, $f2
/* AE8C4 800ADCC4 44022000 */  mfc1       $v0, $f4
/* AE8C8 800ADCC8 A6420000 */  sh         $v0, ($s2)
/* AE8CC 800ADCCC C602000C */  lwc1       $f2, 0xc($s0)
/* AE8D0 800ADCD0 C6240008 */  lwc1       $f4, 8($s1)
/* AE8D4 800ADCD4 46041081 */  sub.s      $f2, $f2, $f4
/* AE8D8 800ADCD8 46001081 */  sub.s      $f2, $f2, $f0
/* AE8DC 800ADCDC C6260010 */  lwc1       $f6, 0x10($s1)
/* AE8E0 800ADCE0 46061083 */  div.s      $f2, $f2, $f6
/* AE8E4 800ADCE4 4600110D */  trunc.w.s  $f4, $f2
/* AE8E8 800ADCE8 44022000 */  mfc1       $v0, $f4
/* AE8EC 800ADCEC A6620000 */  sh         $v0, ($s3)
/* AE8F0 800ADCF0 C6020004 */  lwc1       $f2, 4($s0)
/* AE8F4 800ADCF4 C6240000 */  lwc1       $f4, ($s1)
/* AE8F8 800ADCF8 46041081 */  sub.s      $f2, $f2, $f4
/* AE8FC 800ADCFC 46001080 */  add.s      $f2, $f2, $f0
/* AE900 800ADD00 46081083 */  div.s      $f2, $f2, $f8
/* AE904 800ADD04 4600110D */  trunc.w.s  $f4, $f2
/* AE908 800ADD08 44022000 */  mfc1       $v0, $f4
/* AE90C 800ADD0C A6820000 */  sh         $v0, ($s4)
/* AE910 800ADD10 C602000C */  lwc1       $f2, 0xc($s0)
/* AE914 800ADD14 C6240008 */  lwc1       $f4, 8($s1)
/* AE918 800ADD18 46041081 */  sub.s      $f2, $f2, $f4
/* AE91C 800ADD1C 46001080 */  add.s      $f2, $f2, $f0
/* AE920 800ADD20 46061083 */  div.s      $f2, $f2, $f6
/* AE924 800ADD24 4600100D */  trunc.w.s  $f0, $f2
/* AE928 800ADD28 44020000 */  mfc1       $v0, $f0
/* AE92C 800ADD2C A6A20000 */  sh         $v0, ($s5)
/* AE930 800ADD30 86430000 */  lh         $v1, ($s2)
/* AE934 800ADD34 04620001 */  bltzl      $v1, .L800ADD3C
/* AE938 800ADD38 A6400000 */   sh        $zero, ($s2)
.L800ADD3C:
/* AE93C 800ADD3C 86620000 */  lh         $v0, ($s3)
/* AE940 800ADD40 04420001 */  bltzl      $v0, .L800ADD48
/* AE944 800ADD44 A6600000 */   sh        $zero, ($s3)
.L800ADD48:
/* AE948 800ADD48 86820000 */  lh         $v0, ($s4)
/* AE94C 800ADD4C 9623001C */  lhu        $v1, 0x1c($s1)
/* AE950 800ADD50 0043102A */  slt        $v0, $v0, $v1
/* AE954 800ADD54 54400004 */  bnel       $v0, $zero, .L800ADD68
/* AE958 800ADD58 86A20000 */   lh        $v0, ($s5)
/* AE95C 800ADD5C 2462FFFF */  addiu      $v0, $v1, -1
/* AE960 800ADD60 A6820000 */  sh         $v0, ($s4)
/* AE964 800ADD64 86A20000 */  lh         $v0, ($s5)
.L800ADD68:
/* AE968 800ADD68 9624001E */  lhu        $a0, 0x1e($s1)
/* AE96C 800ADD6C 0044102A */  slt        $v0, $v0, $a0
/* AE970 800ADD70 14400003 */  bnez       $v0, .L800ADD80
/* AE974 800ADD74 8FBF0068 */   lw        $ra, 0x68($sp)
/* AE978 800ADD78 2482FFFF */  addiu      $v0, $a0, -1
/* AE97C 800ADD7C A6A20000 */  sh         $v0, ($s5)
.L800ADD80:
/* AE980 800ADD80 8FB50064 */  lw         $s5, 0x64($sp)
/* AE984 800ADD84 8FB40060 */  lw         $s4, 0x60($sp)
/* AE988 800ADD88 8FB3005C */  lw         $s3, 0x5c($sp)
/* AE98C 800ADD8C 8FB20058 */  lw         $s2, 0x58($sp)
/* AE990 800ADD90 8FB10054 */  lw         $s1, 0x54($sp)
/* AE994 800ADD94 8FB00050 */  lw         $s0, 0x50($sp)
/* AE998 800ADD98 03E00008 */  jr         $ra
/* AE99C 800ADD9C 27BD0070 */   addiu     $sp, $sp, 0x70

glabel getZonePositionShorts
/* AE9A0 800ADDA0 C4A00000 */  lwc1       $f0, ($a1)
/* AE9A4 800ADDA4 C4820000 */  lwc1       $f2, ($a0)
/* AE9A8 800ADDA8 46020001 */  sub.s      $f0, $f0, $f2
/* AE9AC 800ADDAC C484000C */  lwc1       $f4, 0xc($a0)
/* AE9B0 800ADDB0 46040003 */  div.s      $f0, $f0, $f4
/* AE9B4 800ADDB4 4600008D */  trunc.w.s  $f2, $f0
/* AE9B8 800ADDB8 44021000 */  mfc1       $v0, $f2
/* AE9BC 800ADDBC A4C20000 */  sh         $v0, ($a2)
/* AE9C0 800ADDC0 C4A00008 */  lwc1       $f0, 8($a1)
/* AE9C4 800ADDC4 C4820008 */  lwc1       $f2, 8($a0)
/* AE9C8 800ADDC8 46020001 */  sub.s      $f0, $f0, $f2
/* AE9CC 800ADDCC C4840010 */  lwc1       $f4, 0x10($a0)
/* AE9D0 800ADDD0 46040003 */  div.s      $f0, $f0, $f4
/* AE9D4 800ADDD4 4600008D */  trunc.w.s  $f2, $f0
/* AE9D8 800ADDD8 44051000 */  mfc1       $a1, $f2
/* AE9DC 800ADDDC A4E50000 */  sh         $a1, ($a3)
/* AE9E0 800ADDE0 84C30000 */  lh         $v1, ($a2)
/* AE9E4 800ADDE4 0462000D */  bltzl      $v1, .L800ADE1C
/* AE9E8 800ADDE8 A4E00000 */   sh        $zero, ($a3)
/* AE9EC 800ADDEC 9482001C */  lhu        $v0, 0x1c($a0)
/* AE9F0 800ADDF0 0062102A */  slt        $v0, $v1, $v0
/* AE9F4 800ADDF4 10400008 */  beqz       $v0, .L800ADE18
/* AE9F8 800ADDF8 00051400 */   sll       $v0, $a1, 0x10
/* AE9FC 800ADDFC 00021C03 */  sra        $v1, $v0, 0x10
/* AEA00 800ADE00 04620006 */  bltzl      $v1, .L800ADE1C
/* AEA04 800ADE04 A4E00000 */   sh        $zero, ($a3)
/* AEA08 800ADE08 9482001E */  lhu        $v0, 0x1e($a0)
/* AEA0C 800ADE0C 0062102A */  slt        $v0, $v1, $v0
/* AEA10 800ADE10 14400003 */  bnez       $v0, .L800ADE20
/* AEA14 800ADE14 00000000 */   nop
.L800ADE18:
/* AEA18 800ADE18 A4E00000 */  sh         $zero, ($a3)
.L800ADE1C:
/* AEA1C 800ADE1C A4C00000 */  sh         $zero, ($a2)
.L800ADE20:
/* AEA20 800ADE20 03E00008 */  jr         $ra
/* AEA24 800ADE24 00000000 */   nop

glabel func_800ADE28
/* AEA28 800ADE28 C4A00000 */  lwc1       $f0, ($a1)
/* AEA2C 800ADE2C C4820000 */  lwc1       $f2, ($a0)
/* AEA30 800ADE30 46020001 */  sub.s      $f0, $f0, $f2
/* AEA34 800ADE34 C484000C */  lwc1       $f4, 0xc($a0)
/* AEA38 800ADE38 46040003 */  div.s      $f0, $f0, $f4
/* AEA3C 800ADE3C 4600008D */  trunc.w.s  $f2, $f0
/* AEA40 800ADE40 44021000 */  mfc1       $v0, $f2
/* AEA44 800ADE44 A4C20000 */  sh         $v0, ($a2)
/* AEA48 800ADE48 C4A00008 */  lwc1       $f0, 8($a1)
/* AEA4C 800ADE4C C4820008 */  lwc1       $f2, 8($a0)
/* AEA50 800ADE50 46020001 */  sub.s      $f0, $f0, $f2
/* AEA54 800ADE54 C4840010 */  lwc1       $f4, 0x10($a0)
/* AEA58 800ADE58 46040003 */  div.s      $f0, $f0, $f4
/* AEA5C 800ADE5C 4600008D */  trunc.w.s  $f2, $f0
/* AEA60 800ADE60 44051000 */  mfc1       $a1, $f2
/* AEA64 800ADE64 A4E50000 */  sh         $a1, ($a3)
/* AEA68 800ADE68 84C30000 */  lh         $v1, ($a2)
/* AEA6C 800ADE6C 0460000C */  bltz       $v1, .L800ADEA0
/* AEA70 800ADE70 00000000 */   nop
/* AEA74 800ADE74 9482001C */  lhu        $v0, 0x1c($a0)
/* AEA78 800ADE78 0062102A */  slt        $v0, $v1, $v0
/* AEA7C 800ADE7C 10400008 */  beqz       $v0, .L800ADEA0
/* AEA80 800ADE80 00051400 */   sll       $v0, $a1, 0x10
/* AEA84 800ADE84 00021C03 */  sra        $v1, $v0, 0x10
/* AEA88 800ADE88 04600005 */  bltz       $v1, .L800ADEA0
/* AEA8C 800ADE8C 00000000 */   nop
/* AEA90 800ADE90 9482001E */  lhu        $v0, 0x1e($a0)
/* AEA94 800ADE94 0062102A */  slt        $v0, $v1, $v0
/* AEA98 800ADE98 14400003 */  bnez       $v0, .L800ADEA8
/* AEA9C 800ADE9C 00000000 */   nop
.L800ADEA0:
/* AEAA0 800ADEA0 03E00008 */  jr         $ra
/* AEAA4 800ADEA4 00001021 */   addu      $v0, $zero, $zero
.L800ADEA8:
/* AEAA8 800ADEA8 03E00008 */  jr         $ra
/* AEAAC 800ADEAC 24020001 */   addiu     $v0, $zero, 1

glabel func_800ADEB0
/* AEAB0 800ADEB0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* AEAB4 800ADEB4 AFB00050 */  sw         $s0, 0x50($sp)
/* AEAB8 800ADEB8 00A08021 */  addu       $s0, $a1, $zero
/* AEABC 800ADEBC AFB10054 */  sw         $s1, 0x54($sp)
/* AEAC0 800ADEC0 00C08821 */  addu       $s1, $a2, $zero
/* AEAC4 800ADEC4 AFBF0058 */  sw         $ra, 0x58($sp)
/* AEAC8 800ADEC8 C6200000 */  lwc1       $f0, ($s1)
/* AEACC 800ADECC C6020004 */  lwc1       $f2, 4($s0)
/* AEAD0 800ADED0 46020001 */  sub.s      $f0, $f0, $f2
/* AEAD4 800ADED4 E6000010 */  swc1       $f0, 0x10($s0)
/* AEAD8 800ADED8 C6220004 */  lwc1       $f2, 4($s1)
/* AEADC 800ADEDC C6000008 */  lwc1       $f0, 8($s0)
/* AEAE0 800ADEE0 46001081 */  sub.s      $f2, $f2, $f0
/* AEAE4 800ADEE4 E6020014 */  swc1       $f2, 0x14($s0)
/* AEAE8 800ADEE8 C6200008 */  lwc1       $f0, 8($s1)
/* AEAEC 800ADEEC C602000C */  lwc1       $f2, 0xc($s0)
/* AEAF0 800ADEF0 46020001 */  sub.s      $f0, $f0, $f2
/* AEAF4 800ADEF4 E6000018 */  swc1       $f0, 0x18($s0)
/* AEAF8 800ADEF8 C6220000 */  lwc1       $f2, ($s1)
/* AEAFC 800ADEFC C6200004 */  lwc1       $f0, 4($s1)
/* AEB00 800ADF00 C6240008 */  lwc1       $f4, 8($s1)
/* AEB04 800ADF04 24060001 */  addiu      $a2, $zero, 1
/* AEB08 800ADF08 E7A20010 */  swc1       $f2, 0x10($sp)
/* AEB0C 800ADF0C E7A00014 */  swc1       $f0, 0x14($sp)
/* AEB10 800ADF10 0C02B917 */  jal        ProcessCollisionSphere
/* AEB14 800ADF14 E7A40018 */   swc1      $f4, 0x18($sp)
/* AEB18 800ADF18 C6000004 */  lwc1       $f0, 4($s0)
/* AEB1C 800ADF1C E6200000 */  swc1       $f0, ($s1)
/* AEB20 800ADF20 C6020008 */  lwc1       $f2, 8($s0)
/* AEB24 800ADF24 02202021 */  addu       $a0, $s1, $zero
/* AEB28 800ADF28 E6220004 */  swc1       $f2, 4($s1)
/* AEB2C 800ADF2C C600000C */  lwc1       $f0, 0xc($s0)
/* AEB30 800ADF30 27A50010 */  addiu      $a1, $sp, 0x10
/* AEB34 800ADF34 E6200008 */  swc1       $f0, 8($s1)
/* AEB38 800ADF38 AE000010 */  sw         $zero, 0x10($s0)
/* AEB3C 800ADF3C AE000014 */  sw         $zero, 0x14($s0)
/* AEB40 800ADF40 0C02AB66 */  jal        get_vec3_proximity
/* AEB44 800ADF44 AE000018 */   sw        $zero, 0x18($s0)
/* AEB48 800ADF48 3C01800E */  lui        $at, %hi(D_800E36F8)
/* AEB4C 800ADF4C C42236F8 */  lwc1       $f2, %lo(D_800E36F8)($at)
/* AEB50 800ADF50 4600103C */  c.lt.s     $f2, $f0
/* AEB54 800ADF54 00000000 */  nop
/* AEB58 800ADF58 45010002 */  bc1t       .L800ADF64
/* AEB5C 800ADF5C 24020001 */   addiu     $v0, $zero, 1
/* AEB60 800ADF60 00001021 */  addu       $v0, $zero, $zero
.L800ADF64:
/* AEB64 800ADF64 8FBF0058 */  lw         $ra, 0x58($sp)
/* AEB68 800ADF68 8FB10054 */  lw         $s1, 0x54($sp)
/* AEB6C 800ADF6C 8FB00050 */  lw         $s0, 0x50($sp)
/* AEB70 800ADF70 03E00008 */  jr         $ra
/* AEB74 800ADF74 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_800ADF78
/* AEB78 800ADF78 27BDFF18 */  addiu      $sp, $sp, -0xe8
/* AEB7C 800ADF7C F7B600E0 */  sdc1       $f22, 0xe0($sp)
/* AEB80 800ADF80 4487B000 */  mtc1       $a3, $f22
/* AEB84 800ADF84 87A20102 */  lh         $v0, 0x102($sp)
/* AEB88 800ADF88 8FA300F8 */  lw         $v1, 0xf8($sp)
/* AEB8C 800ADF8C AFB000B0 */  sw         $s0, 0xb0($sp)
/* AEB90 800ADF90 00C08021 */  addu       $s0, $a2, $zero
/* AEB94 800ADF94 AFBF00D4 */  sw         $ra, 0xd4($sp)
/* AEB98 800ADF98 AFBE00D0 */  sw         $fp, 0xd0($sp)
/* AEB9C 800ADF9C AFB700CC */  sw         $s7, 0xcc($sp)
/* AEBA0 800ADFA0 AFB600C8 */  sw         $s6, 0xc8($sp)
/* AEBA4 800ADFA4 AFB500C4 */  sw         $s5, 0xc4($sp)
/* AEBA8 800ADFA8 AFB400C0 */  sw         $s4, 0xc0($sp)
/* AEBAC 800ADFAC AFB300BC */  sw         $s3, 0xbc($sp)
/* AEBB0 800ADFB0 AFB200B8 */  sw         $s2, 0xb8($sp)
/* AEBB4 800ADFB4 AFB100B4 */  sw         $s1, 0xb4($sp)
/* AEBB8 800ADFB8 F7B400D8 */  sdc1       $f20, 0xd8($sp)
/* AEBBC 800ADFBC AFA400E8 */  sw         $a0, 0xe8($sp)
/* AEBC0 800ADFC0 AFA500EC */  sw         $a1, 0xec($sp)
/* AEBC4 800ADFC4 10600007 */  beqz       $v1, .L800ADFE4
/* AEBC8 800ADFC8 AFA200AC */   sw        $v0, 0xac($sp)
/* AEBCC 800ADFCC 44800000 */  mtc1       $zero, $f0
/* AEBD0 800ADFD0 44050000 */  mfc1       $a1, $f0
/* AEBD4 800ADFD4 00602021 */  addu       $a0, $v1, $zero
/* AEBD8 800ADFD8 00A03021 */  addu       $a2, $a1, $zero
/* AEBDC 800ADFDC 0C02AD58 */  jal        setVec3
/* AEBE0 800ADFE0 00A03821 */   addu      $a3, $a1, $zero
.L800ADFE4:
/* AEBE4 800ADFE4 8FA200FC */  lw         $v0, 0xfc($sp)
/* AEBE8 800ADFE8 10400006 */  beqz       $v0, .L800AE004
/* AEBEC 800ADFEC 00402021 */   addu      $a0, $v0, $zero
/* AEBF0 800ADFF0 44800000 */  mtc1       $zero, $f0
/* AEBF4 800ADFF4 44050000 */  mfc1       $a1, $f0
/* AEBF8 800ADFF8 00A03021 */  addu       $a2, $a1, $zero
/* AEBFC 800ADFFC 0C02AD58 */  jal        setVec3
/* AEC00 800AE000 00A03821 */   addu      $a3, $a1, $zero
.L800AE004:
/* AEC04 800AE004 8FA300E8 */  lw         $v1, 0xe8($sp)
/* AEC08 800AE008 1060006E */  beqz       $v1, .L800AE1C4
/* AEC0C 800AE00C 27A40020 */   addiu     $a0, $sp, 0x20
/* AEC10 800AE010 8FA600EC */  lw         $a2, 0xec($sp)
/* AEC14 800AE014 0C02AB26 */  jal        Vec3A_BsubC
/* AEC18 800AE018 02002821 */   addu      $a1, $s0, $zero
/* AEC1C 800AE01C 27A60020 */  addiu      $a2, $sp, 0x20
/* AEC20 800AE020 27A200A0 */  addiu      $v0, $sp, 0xa0
/* AEC24 800AE024 8FA400E8 */  lw         $a0, 0xe8($sp)
/* AEC28 800AE028 8FA500EC */  lw         $a1, 0xec($sp)
/* AEC2C 800AE02C 4407B000 */  mfc1       $a3, $f22
/* AEC30 800AE030 27A300A2 */  addiu      $v1, $sp, 0xa2
/* AEC34 800AE034 AFA20010 */  sw         $v0, 0x10($sp)
/* AEC38 800AE038 27A200A4 */  addiu      $v0, $sp, 0xa4
/* AEC3C 800AE03C AFA30014 */  sw         $v1, 0x14($sp)
/* AEC40 800AE040 27A300A6 */  addiu      $v1, $sp, 0xa6
/* AEC44 800AE044 AFA20018 */  sw         $v0, 0x18($sp)
/* AEC48 800AE048 0C02B6B8 */  jal        func_800ADAE0
/* AEC4C 800AE04C AFA3001C */   sw        $v1, 0x1c($sp)
/* AEC50 800AE050 87B500A0 */  lh         $s5, 0xa0($sp)
/* AEC54 800AE054 87A200A4 */  lh         $v0, 0xa4($sp)
/* AEC58 800AE058 0055102A */  slt        $v0, $v0, $s5
/* AEC5C 800AE05C 1440005A */  bnez       $v0, .L800AE1C8
/* AEC60 800AE060 00001021 */   addu      $v0, $zero, $zero
/* AEC64 800AE064 00151C00 */  sll        $v1, $s5, 0x10
/* AEC68 800AE068 3C020001 */  lui        $v0, 1
/* AEC6C 800AE06C 0062B821 */  addu       $s7, $v1, $v0
/* AEC70 800AE070 87A600A2 */  lh         $a2, 0xa2($sp)
.L800AE074:
/* AEC74 800AE074 87A200A6 */  lh         $v0, 0xa6($sp)
/* AEC78 800AE078 0046102A */  slt        $v0, $v0, $a2
/* AEC7C 800AE07C 5440004A */  bnel       $v0, $zero, .L800AE1A8
/* AEC80 800AE080 02E01821 */   addu      $v1, $s7, $zero
/* AEC84 800AE084 00061400 */  sll        $v0, $a2, 0x10
/* AEC88 800AE088 3C030001 */  lui        $v1, 1
/* AEC8C 800AE08C 0043A021 */  addu       $s4, $v0, $v1
/* AEC90 800AE090 8FA400E8 */  lw         $a0, 0xe8($sp)
.L800AE094:
/* AEC94 800AE094 0C02BCCE */  jal        borg9_get_unkStruct
/* AEC98 800AE098 02A02821 */   addu      $a1, $s5, $zero
/* AEC9C 800AE09C 00409021 */  addu       $s2, $v0, $zero
/* AECA0 800AE0A0 9642000C */  lhu        $v0, 0xc($s2)
/* AECA4 800AE0A4 10400037 */  beqz       $v0, .L800AE184
/* AECA8 800AE0A8 00001821 */   addu      $v1, $zero, $zero
/* AECAC 800AE0AC 4480A000 */  mtc1       $zero, $f20
/* AECB0 800AE0B0 27B600A8 */  addiu      $s6, $sp, 0xa8
/* AECB4 800AE0B4 3C130001 */  lui        $s3, 1
/* AECB8 800AE0B8 3C1E0001 */  lui        $fp, 1
.L800AE0BC:
/* AECBC 800AE0BC 8E440000 */  lw         $a0, ($s2)
/* AECC0 800AE0C0 00031040 */  sll        $v0, $v1, 1
/* AECC4 800AE0C4 00441021 */  addu       $v0, $v0, $a0
/* AECC8 800AE0C8 94430000 */  lhu        $v1, ($v0)
/* AECCC 800AE0CC 8FA200E8 */  lw         $v0, 0xe8($sp)
/* AECD0 800AE0D0 8C44003C */  lw         $a0, 0x3c($v0)
/* AECD4 800AE0D4 00031940 */  sll        $v1, $v1, 5
/* AECD8 800AE0D8 00838021 */  addu       $s0, $a0, $v1
/* AECDC 800AE0DC 8FA300AC */  lw         $v1, 0xac($sp)
/* AECE0 800AE0E0 10600006 */  beqz       $v1, .L800AE0FC
/* AECE4 800AE0E4 27A40020 */   addiu     $a0, $sp, 0x20
/* AECE8 800AE0E8 9602001C */  lhu        $v0, 0x1c($s0)
/* AECEC 800AE0EC 30420200 */  andi       $v0, $v0, 0x200
/* AECF0 800AE0F0 1440001F */  bnez       $v0, .L800AE170
/* AECF4 800AE0F4 02601821 */   addu      $v1, $s3, $zero
/* AECF8 800AE0F8 27A40020 */  addiu      $a0, $sp, 0x20
.L800AE0FC:
/* AECFC 800AE0FC 2611000C */  addiu      $s1, $s0, 0xc
/* AED00 800AE100 0C02AB7A */  jal        vec3_scalar_product
/* AED04 800AE104 02202821 */   addu      $a1, $s1, $zero
/* AED08 800AE108 4600A03C */  c.lt.s     $f20, $f0
/* AED0C 800AE10C 00000000 */  nop
/* AED10 800AE110 45010017 */  bc1t       .L800AE170
/* AED14 800AE114 02601821 */   addu      $v1, $s3, $zero
/* AED18 800AE118 27A50020 */  addiu      $a1, $sp, 0x20
/* AED1C 800AE11C 02003821 */  addu       $a3, $s0, $zero
/* AED20 800AE120 8FA400EC */  lw         $a0, 0xec($sp)
/* AED24 800AE124 4406B000 */  mfc1       $a2, $f22
/* AED28 800AE128 27B00060 */  addiu      $s0, $sp, 0x60
/* AED2C 800AE12C AFB60010 */  sw         $s6, 0x10($sp)
/* AED30 800AE130 0C02BB07 */  jal        func_800AEC1C
/* AED34 800AE134 AFB00014 */   sw        $s0, 0x14($sp)
/* AED38 800AE138 1040000C */  beqz       $v0, .L800AE16C
/* AED3C 800AE13C 8FA200F8 */   lw        $v0, 0xf8($sp)
/* AED40 800AE140 10400003 */  beqz       $v0, .L800AE150
/* AED44 800AE144 02002021 */   addu      $a0, $s0, $zero
/* AED48 800AE148 0C02AD17 */  jal        copyVec3
/* AED4C 800AE14C 00402821 */   addu      $a1, $v0, $zero
.L800AE150:
/* AED50 800AE150 8FA300FC */  lw         $v1, 0xfc($sp)
/* AED54 800AE154 10600003 */  beqz       $v1, .L800AE164
/* AED58 800AE158 02202021 */   addu      $a0, $s1, $zero
/* AED5C 800AE15C 0C02AD17 */  jal        copyVec3
/* AED60 800AE160 00602821 */   addu      $a1, $v1, $zero
.L800AE164:
/* AED64 800AE164 0802B872 */  j          .L800AE1C8
/* AED68 800AE168 24020001 */   addiu     $v0, $zero, 1
.L800AE16C:
/* AED6C 800AE16C 02601821 */  addu       $v1, $s3, $zero
.L800AE170:
/* AED70 800AE170 9642000C */  lhu        $v0, 0xc($s2)
/* AED74 800AE174 00031C03 */  sra        $v1, $v1, 0x10
/* AED78 800AE178 0062102A */  slt        $v0, $v1, $v0
/* AED7C 800AE17C 1440FFCF */  bnez       $v0, .L800AE0BC
/* AED80 800AE180 027E9821 */   addu      $s3, $s3, $fp
.L800AE184:
/* AED84 800AE184 02801821 */  addu       $v1, $s4, $zero
/* AED88 800AE188 3C020001 */  lui        $v0, 1
/* AED8C 800AE18C 0282A021 */  addu       $s4, $s4, $v0
/* AED90 800AE190 87A200A6 */  lh         $v0, 0xa6($sp)
/* AED94 800AE194 00033403 */  sra        $a2, $v1, 0x10
/* AED98 800AE198 0046102A */  slt        $v0, $v0, $a2
/* AED9C 800AE19C 1040FFBD */  beqz       $v0, .L800AE094
/* AEDA0 800AE1A0 8FA400E8 */   lw        $a0, 0xe8($sp)
/* AEDA4 800AE1A4 02E01821 */  addu       $v1, $s7, $zero
.L800AE1A8:
/* AEDA8 800AE1A8 3C020001 */  lui        $v0, 1
/* AEDAC 800AE1AC 02E2B821 */  addu       $s7, $s7, $v0
/* AEDB0 800AE1B0 87A200A4 */  lh         $v0, 0xa4($sp)
/* AEDB4 800AE1B4 0003AC03 */  sra        $s5, $v1, 0x10
/* AEDB8 800AE1B8 0055102A */  slt        $v0, $v0, $s5
/* AEDBC 800AE1BC 5040FFAD */  beql       $v0, $zero, .L800AE074
/* AEDC0 800AE1C0 87A600A2 */   lh        $a2, 0xa2($sp)
.L800AE1C4:
/* AEDC4 800AE1C4 00001021 */  addu       $v0, $zero, $zero
.L800AE1C8:
/* AEDC8 800AE1C8 8FBF00D4 */  lw         $ra, 0xd4($sp)
/* AEDCC 800AE1CC 8FBE00D0 */  lw         $fp, 0xd0($sp)
/* AEDD0 800AE1D0 8FB700CC */  lw         $s7, 0xcc($sp)
/* AEDD4 800AE1D4 8FB600C8 */  lw         $s6, 0xc8($sp)
/* AEDD8 800AE1D8 8FB500C4 */  lw         $s5, 0xc4($sp)
/* AEDDC 800AE1DC 8FB400C0 */  lw         $s4, 0xc0($sp)
/* AEDE0 800AE1E0 8FB300BC */  lw         $s3, 0xbc($sp)
/* AEDE4 800AE1E4 8FB200B8 */  lw         $s2, 0xb8($sp)
/* AEDE8 800AE1E8 8FB100B4 */  lw         $s1, 0xb4($sp)
/* AEDEC 800AE1EC 8FB000B0 */  lw         $s0, 0xb0($sp)
/* AEDF0 800AE1F0 D7B600E0 */  ldc1       $f22, 0xe0($sp)
/* AEDF4 800AE1F4 D7B400D8 */  ldc1       $f20, 0xd8($sp)
/* AEDF8 800AE1F8 03E00008 */  jr         $ra
/* AEDFC 800AE1FC 27BD00E8 */   addiu     $sp, $sp, 0xe8

glabel processPlayers_sub
/* AEE00 800AE200 27BDFF18 */  addiu      $sp, $sp, -0xe8
/* AEE04 800AE204 F7B400E0 */  sdc1       $f20, 0xe0($sp)
/* AEE08 800AE208 4487A000 */  mtc1       $a3, $f20
/* AEE0C 800AE20C 8FA200F8 */  lw         $v0, 0xf8($sp)
/* AEE10 800AE210 AFB000B8 */  sw         $s0, 0xb8($sp)
/* AEE14 800AE214 00C08021 */  addu       $s0, $a2, $zero
/* AEE18 800AE218 AFBF00DC */  sw         $ra, 0xdc($sp)
/* AEE1C 800AE21C AFBE00D8 */  sw         $fp, 0xd8($sp)
/* AEE20 800AE220 AFB700D4 */  sw         $s7, 0xd4($sp)
/* AEE24 800AE224 AFB600D0 */  sw         $s6, 0xd0($sp)
/* AEE28 800AE228 AFB500CC */  sw         $s5, 0xcc($sp)
/* AEE2C 800AE22C AFB400C8 */  sw         $s4, 0xc8($sp)
/* AEE30 800AE230 AFB300C4 */  sw         $s3, 0xc4($sp)
/* AEE34 800AE234 AFB200C0 */  sw         $s2, 0xc0($sp)
/* AEE38 800AE238 AFB100BC */  sw         $s1, 0xbc($sp)
/* AEE3C 800AE23C AFA400E8 */  sw         $a0, 0xe8($sp)
/* AEE40 800AE240 10400007 */  beqz       $v0, .L800AE260
/* AEE44 800AE244 AFA500EC */   sw        $a1, 0xec($sp)
/* AEE48 800AE248 44800000 */  mtc1       $zero, $f0
/* AEE4C 800AE24C 44050000 */  mfc1       $a1, $f0
/* AEE50 800AE250 00402021 */  addu       $a0, $v0, $zero
/* AEE54 800AE254 00A03021 */  addu       $a2, $a1, $zero
/* AEE58 800AE258 0C02AD58 */  jal        setVec3
/* AEE5C 800AE25C 00A03821 */   addu      $a3, $a1, $zero
.L800AE260:
/* AEE60 800AE260 8FA300FC */  lw         $v1, 0xfc($sp)
/* AEE64 800AE264 10600006 */  beqz       $v1, .L800AE280
/* AEE68 800AE268 00602021 */   addu      $a0, $v1, $zero
/* AEE6C 800AE26C 44800000 */  mtc1       $zero, $f0
/* AEE70 800AE270 44050000 */  mfc1       $a1, $f0
/* AEE74 800AE274 00A03021 */  addu       $a2, $a1, $zero
/* AEE78 800AE278 0C02AD58 */  jal        setVec3
/* AEE7C 800AE27C 00A03821 */   addu      $a3, $a1, $zero
.L800AE280:
/* AEE80 800AE280 27A40020 */  addiu      $a0, $sp, 0x20
/* AEE84 800AE284 8FA600EC */  lw         $a2, 0xec($sp)
/* AEE88 800AE288 0C02AB26 */  jal        Vec3A_BsubC
/* AEE8C 800AE28C 02002821 */   addu      $a1, $s0, $zero
/* AEE90 800AE290 27A60020 */  addiu      $a2, $sp, 0x20
/* AEE94 800AE294 27A200A0 */  addiu      $v0, $sp, 0xa0
/* AEE98 800AE298 8FA400E8 */  lw         $a0, 0xe8($sp)
/* AEE9C 800AE29C 8FA500EC */  lw         $a1, 0xec($sp)
/* AEEA0 800AE2A0 4407A000 */  mfc1       $a3, $f20
/* AEEA4 800AE2A4 27A300A2 */  addiu      $v1, $sp, 0xa2
/* AEEA8 800AE2A8 AFA20010 */  sw         $v0, 0x10($sp)
/* AEEAC 800AE2AC 27A200A4 */  addiu      $v0, $sp, 0xa4
/* AEEB0 800AE2B0 AFA30014 */  sw         $v1, 0x14($sp)
/* AEEB4 800AE2B4 27A300A6 */  addiu      $v1, $sp, 0xa6
/* AEEB8 800AE2B8 AFA20018 */  sw         $v0, 0x18($sp)
/* AEEBC 800AE2BC 0C02B6B8 */  jal        func_800ADAE0
/* AEEC0 800AE2C0 AFA3001C */   sw        $v1, 0x1c($sp)
/* AEEC4 800AE2C4 87B500A0 */  lh         $s5, 0xa0($sp)
/* AEEC8 800AE2C8 87A200A4 */  lh         $v0, 0xa4($sp)
/* AEECC 800AE2CC 0055102A */  slt        $v0, $v0, $s5
/* AEED0 800AE2D0 14400055 */  bnez       $v0, .L800AE428
/* AEED4 800AE2D4 00001021 */   addu      $v0, $zero, $zero
/* AEED8 800AE2D8 00151C00 */  sll        $v1, $s5, 0x10
/* AEEDC 800AE2DC 3C020001 */  lui        $v0, 1
/* AEEE0 800AE2E0 0062F021 */  addu       $fp, $v1, $v0
/* AEEE4 800AE2E4 87A600A2 */  lh         $a2, 0xa2($sp)
.L800AE2E8:
/* AEEE8 800AE2E8 87A200A6 */  lh         $v0, 0xa6($sp)
/* AEEEC 800AE2EC 0046102A */  slt        $v0, $v0, $a2
/* AEEF0 800AE2F0 54400045 */  bnel       $v0, $zero, .L800AE408
/* AEEF4 800AE2F4 03C01821 */   addu      $v1, $fp, $zero
/* AEEF8 800AE2F8 00061400 */  sll        $v0, $a2, 0x10
/* AEEFC 800AE2FC 3C030001 */  lui        $v1, 1
/* AEF00 800AE300 0043A021 */  addu       $s4, $v0, $v1
/* AEF04 800AE304 8FA400E8 */  lw         $a0, 0xe8($sp)
.L800AE308:
/* AEF08 800AE308 0C02BCCE */  jal        borg9_get_unkStruct
/* AEF0C 800AE30C 02A02821 */   addu      $a1, $s5, $zero
/* AEF10 800AE310 00409021 */  addu       $s2, $v0, $zero
/* AEF14 800AE314 9642000C */  lhu        $v0, 0xc($s2)
/* AEF18 800AE318 10400032 */  beqz       $v0, .L800AE3E4
/* AEF1C 800AE31C 00001821 */   addu      $v1, $zero, $zero
/* AEF20 800AE320 24090001 */  addiu      $t1, $zero, 1
/* AEF24 800AE324 24080002 */  addiu      $t0, $zero, 2
/* AEF28 800AE328 27B600A8 */  addiu      $s6, $sp, 0xa8
/* AEF2C 800AE32C 3C130001 */  lui        $s3, 1
/* AEF30 800AE330 3C170001 */  lui        $s7, 1
.L800AE334:
/* AEF34 800AE334 8E440000 */  lw         $a0, ($s2)
/* AEF38 800AE338 00031040 */  sll        $v0, $v1, 1
/* AEF3C 800AE33C 00441021 */  addu       $v0, $v0, $a0
/* AEF40 800AE340 94430000 */  lhu        $v1, ($v0)
/* AEF44 800AE344 8FA200E8 */  lw         $v0, 0xe8($sp)
/* AEF48 800AE348 8C44003C */  lw         $a0, 0x3c($v0)
/* AEF4C 800AE34C 00031940 */  sll        $v1, $v1, 5
/* AEF50 800AE350 00838821 */  addu       $s1, $a0, $v1
/* AEF54 800AE354 9622001E */  lhu        $v0, 0x1e($s1)
/* AEF58 800AE358 3042001F */  andi       $v0, $v0, 0x1f
/* AEF5C 800AE35C 1049001C */  beq        $v0, $t1, .L800AE3D0
/* AEF60 800AE360 02601821 */   addu      $v1, $s3, $zero
/* AEF64 800AE364 1048001A */  beq        $v0, $t0, .L800AE3D0
/* AEF68 800AE368 27A50020 */   addiu     $a1, $sp, 0x20
/* AEF6C 800AE36C 02203821 */  addu       $a3, $s1, $zero
/* AEF70 800AE370 8FA400EC */  lw         $a0, 0xec($sp)
/* AEF74 800AE374 4406A000 */  mfc1       $a2, $f20
/* AEF78 800AE378 27B00060 */  addiu      $s0, $sp, 0x60
/* AEF7C 800AE37C AFB60010 */  sw         $s6, 0x10($sp)
/* AEF80 800AE380 AFB00014 */  sw         $s0, 0x14($sp)
/* AEF84 800AE384 AFA800B0 */  sw         $t0, 0xb0($sp)
/* AEF88 800AE388 0C02BB07 */  jal        func_800AEC1C
/* AEF8C 800AE38C AFA900B4 */   sw        $t1, 0xb4($sp)
/* AEF90 800AE390 8FA800B0 */  lw         $t0, 0xb0($sp)
/* AEF94 800AE394 1040000D */  beqz       $v0, .L800AE3CC
/* AEF98 800AE398 8FA900B4 */   lw        $t1, 0xb4($sp)
/* AEF9C 800AE39C 8FA300F8 */  lw         $v1, 0xf8($sp)
/* AEFA0 800AE3A0 10600003 */  beqz       $v1, .L800AE3B0
/* AEFA4 800AE3A4 02002021 */   addu      $a0, $s0, $zero
/* AEFA8 800AE3A8 0C02AD17 */  jal        copyVec3
/* AEFAC 800AE3AC 00602821 */   addu      $a1, $v1, $zero
.L800AE3B0:
/* AEFB0 800AE3B0 8FA200FC */  lw         $v0, 0xfc($sp)
/* AEFB4 800AE3B4 10400003 */  beqz       $v0, .L800AE3C4
/* AEFB8 800AE3B8 2624000C */   addiu     $a0, $s1, 0xc
/* AEFBC 800AE3BC 0C02AD17 */  jal        copyVec3
/* AEFC0 800AE3C0 00402821 */   addu      $a1, $v0, $zero
.L800AE3C4:
/* AEFC4 800AE3C4 0802B90A */  j          .L800AE428
/* AEFC8 800AE3C8 24020001 */   addiu     $v0, $zero, 1
.L800AE3CC:
/* AEFCC 800AE3CC 02601821 */  addu       $v1, $s3, $zero
.L800AE3D0:
/* AEFD0 800AE3D0 9642000C */  lhu        $v0, 0xc($s2)
/* AEFD4 800AE3D4 00031C03 */  sra        $v1, $v1, 0x10
/* AEFD8 800AE3D8 0062102A */  slt        $v0, $v1, $v0
/* AEFDC 800AE3DC 1440FFD5 */  bnez       $v0, .L800AE334
/* AEFE0 800AE3E0 02779821 */   addu      $s3, $s3, $s7
.L800AE3E4:
/* AEFE4 800AE3E4 02801821 */  addu       $v1, $s4, $zero
/* AEFE8 800AE3E8 3C020001 */  lui        $v0, 1
/* AEFEC 800AE3EC 0282A021 */  addu       $s4, $s4, $v0
/* AEFF0 800AE3F0 87A200A6 */  lh         $v0, 0xa6($sp)
/* AEFF4 800AE3F4 00033403 */  sra        $a2, $v1, 0x10
/* AEFF8 800AE3F8 0046102A */  slt        $v0, $v0, $a2
/* AEFFC 800AE3FC 1040FFC2 */  beqz       $v0, .L800AE308
/* AF000 800AE400 8FA400E8 */   lw        $a0, 0xe8($sp)
/* AF004 800AE404 03C01821 */  addu       $v1, $fp, $zero
.L800AE408:
/* AF008 800AE408 3C020001 */  lui        $v0, 1
/* AF00C 800AE40C 03C2F021 */  addu       $fp, $fp, $v0
/* AF010 800AE410 87A200A4 */  lh         $v0, 0xa4($sp)
/* AF014 800AE414 0003AC03 */  sra        $s5, $v1, 0x10
/* AF018 800AE418 0055102A */  slt        $v0, $v0, $s5
/* AF01C 800AE41C 5040FFB2 */  beql       $v0, $zero, .L800AE2E8
/* AF020 800AE420 87A600A2 */   lh        $a2, 0xa2($sp)
/* AF024 800AE424 00001021 */  addu       $v0, $zero, $zero
.L800AE428:
/* AF028 800AE428 8FBF00DC */  lw         $ra, 0xdc($sp)
/* AF02C 800AE42C 8FBE00D8 */  lw         $fp, 0xd8($sp)
/* AF030 800AE430 8FB700D4 */  lw         $s7, 0xd4($sp)
/* AF034 800AE434 8FB600D0 */  lw         $s6, 0xd0($sp)
/* AF038 800AE438 8FB500CC */  lw         $s5, 0xcc($sp)
/* AF03C 800AE43C 8FB400C8 */  lw         $s4, 0xc8($sp)
/* AF040 800AE440 8FB300C4 */  lw         $s3, 0xc4($sp)
/* AF044 800AE444 8FB200C0 */  lw         $s2, 0xc0($sp)
/* AF048 800AE448 8FB100BC */  lw         $s1, 0xbc($sp)
/* AF04C 800AE44C 8FB000B8 */  lw         $s0, 0xb8($sp)
/* AF050 800AE450 D7B400E0 */  ldc1       $f20, 0xe0($sp)
/* AF054 800AE454 03E00008 */  jr         $ra
/* AF058 800AE458 27BD00E8 */   addiu     $sp, $sp, 0xe8

glabel ProcessCollisionSphere
/* AF05C 800AE45C 27BDFF70 */  addiu      $sp, $sp, -0x90
/* AF060 800AE460 AFB50074 */  sw         $s5, 0x74($sp)
/* AF064 800AE464 0080A821 */  addu       $s5, $a0, $zero
/* AF068 800AE468 AFB20068 */  sw         $s2, 0x68($sp)
/* AF06C 800AE46C 00A09021 */  addu       $s2, $a1, $zero
/* AF070 800AE470 AFBF0080 */  sw         $ra, 0x80($sp)
/* AF074 800AE474 AFB7007C */  sw         $s7, 0x7c($sp)
/* AF078 800AE478 AFB60078 */  sw         $s6, 0x78($sp)
/* AF07C 800AE47C AFB40070 */  sw         $s4, 0x70($sp)
/* AF080 800AE480 AFB3006C */  sw         $s3, 0x6c($sp)
/* AF084 800AE484 AFB10064 */  sw         $s1, 0x64($sp)
/* AF088 800AE488 AFB00060 */  sw         $s0, 0x60($sp)
/* AF08C 800AE48C F7B40088 */  sdc1       $f20, 0x88($sp)
/* AF090 800AE490 8E420038 */  lw         $v0, 0x38($s2)
/* AF094 800AE494 00063400 */  sll        $a2, $a2, 0x10
/* AF098 800AE498 8C430000 */  lw         $v1, ($v0)
/* AF09C 800AE49C 14600008 */  bnez       $v1, .L800AE4C0
/* AF0A0 800AE4A0 0006B403 */   sra       $s6, $a2, 0x10
/* AF0A4 800AE4A4 3C04800E */  lui        $a0, %hi(D_800E36FC)
/* AF0A8 800AE4A8 248436FC */  addiu      $a0, $a0, %lo(D_800E36FC)
/* AF0AC 800AE4AC 3C05800E */  lui        $a1, %hi(D_800E3714)
/* AF0B0 800AE4B0 0C025F2D */  jal        manualCrash
/* AF0B4 800AE4B4 24A53714 */   addiu     $a1, $a1, %lo(D_800E3714)
/* AF0B8 800AE4B8 0802B9CB */  j          .L800AE72C
/* AF0BC 800AE4BC 8FBF0080 */   lw        $ra, 0x80($sp)
.L800AE4C0:
/* AF0C0 800AE4C0 9642001C */  lhu        $v0, 0x1c($s2)
/* AF0C4 800AE4C4 30438000 */  andi       $v1, $v0, 0x8000
/* AF0C8 800AE4C8 14600098 */  bnez       $v1, .L800AE72C
/* AF0CC 800AE4CC 8FBF0080 */   lw        $ra, 0x80($sp)
/* AF0D0 800AE4D0 C6440004 */  lwc1       $f4, 4($s2)
/* AF0D4 800AE4D4 3C01800E */  lui        $at, %hi(D_800E3740)
/* AF0D8 800AE4D8 C4283740 */  lwc1       $f8, %lo(D_800E3740)($at)
/* AF0DC 800AE4DC 4604403E */  c.le.s     $f8, $f4
/* AF0E0 800AE4E0 00000000 */  nop
/* AF0E4 800AE4E4 45030019 */  bc1tl      .L800AE54C
/* AF0E8 800AE4E8 34428000 */   ori       $v0, $v0, 0x8000
/* AF0EC 800AE4EC 3C01800E */  lui        $at, %hi(D_800E3744)
/* AF0F0 800AE4F0 C4263744 */  lwc1       $f6, %lo(D_800E3744)($at)
/* AF0F4 800AE4F4 4606203E */  c.le.s     $f4, $f6
/* AF0F8 800AE4F8 00000000 */  nop
/* AF0FC 800AE4FC 45030013 */  bc1tl      .L800AE54C
/* AF100 800AE500 34428000 */   ori       $v0, $v0, 0x8000
/* AF104 800AE504 C6420008 */  lwc1       $f2, 8($s2)
/* AF108 800AE508 4602403E */  c.le.s     $f8, $f2
/* AF10C 800AE50C 00000000 */  nop
/* AF110 800AE510 4503000E */  bc1tl      .L800AE54C
/* AF114 800AE514 34428000 */   ori       $v0, $v0, 0x8000
/* AF118 800AE518 4606103E */  c.le.s     $f2, $f6
/* AF11C 800AE51C 00000000 */  nop
/* AF120 800AE520 4501000A */  bc1t       .L800AE54C
/* AF124 800AE524 34428000 */   ori       $v0, $v0, 0x8000
/* AF128 800AE528 C640000C */  lwc1       $f0, 0xc($s2)
/* AF12C 800AE52C 4600403E */  c.le.s     $f8, $f0
/* AF130 800AE530 00000000 */  nop
/* AF134 800AE534 45010005 */  bc1t       .L800AE54C
/* AF138 800AE538 00000000 */   nop
/* AF13C 800AE53C 4606003E */  c.le.s     $f0, $f6
/* AF140 800AE540 00000000 */  nop
/* AF144 800AE544 45020003 */  bc1fl      .L800AE554
/* AF148 800AE548 E7A40018 */   swc1      $f4, 0x18($sp)
.L800AE54C:
/* AF14C 800AE54C 0802B9CA */  j          .L800AE728
/* AF150 800AE550 A642001C */   sh        $v0, 0x1c($s2)
.L800AE554:
/* AF154 800AE554 E7A2001C */  swc1       $f2, 0x1c($sp)
/* AF158 800AE558 1AC00026 */  blez       $s6, .L800AE5F4
/* AF15C 800AE55C E7A00020 */   swc1      $f0, 0x20($sp)
/* AF160 800AE560 3C100001 */  lui        $s0, 1
/* AF164 800AE564 3C110001 */  lui        $s1, 1
.L800AE568:
/* AF168 800AE568 8E420038 */  lw         $v0, 0x38($s2)
/* AF16C 800AE56C 8C450000 */  lw         $a1, ($v0)
/* AF170 800AE570 0C02BCF3 */  jal        collisiondat_add_velocity
/* AF174 800AE574 02402021 */   addu      $a0, $s2, $zero
/* AF178 800AE578 8E420038 */  lw         $v0, 0x38($s2)
/* AF17C 800AE57C 8C450000 */  lw         $a1, ($v0)
/* AF180 800AE580 02402021 */  addu       $a0, $s2, $zero
/* AF184 800AE584 0C02BCF3 */  jal        collisiondat_add_velocity
/* AF188 800AE588 24A5000C */   addiu     $a1, $a1, 0xc
/* AF18C 800AE58C 8E420038 */  lw         $v0, 0x38($s2)
/* AF190 800AE590 8C430000 */  lw         $v1, ($v0)
/* AF194 800AE594 C6420010 */  lwc1       $f2, 0x10($s2)
/* AF198 800AE598 C4600018 */  lwc1       $f0, 0x18($v1)
/* AF19C 800AE59C 46001082 */  mul.s      $f2, $f2, $f0
/* AF1A0 800AE5A0 C6440014 */  lwc1       $f4, 0x14($s2)
/* AF1A4 800AE5A4 46002102 */  mul.s      $f4, $f4, $f0
/* AF1A8 800AE5A8 C6460018 */  lwc1       $f6, 0x18($s2)
/* AF1AC 800AE5AC C6480004 */  lwc1       $f8, 4($s2)
/* AF1B0 800AE5B0 02001821 */  addu       $v1, $s0, $zero
/* AF1B4 800AE5B4 46003182 */  mul.s      $f6, $f6, $f0
/* AF1B8 800AE5B8 02118021 */  addu       $s0, $s0, $s1
/* AF1BC 800AE5BC 00031403 */  sra        $v0, $v1, 0x10
/* AF1C0 800AE5C0 0056102A */  slt        $v0, $v0, $s6
/* AF1C4 800AE5C4 C6400008 */  lwc1       $f0, 8($s2)
/* AF1C8 800AE5C8 46024200 */  add.s      $f8, $f8, $f2
/* AF1CC 800AE5CC E6420010 */  swc1       $f2, 0x10($s2)
/* AF1D0 800AE5D0 C642000C */  lwc1       $f2, 0xc($s2)
/* AF1D4 800AE5D4 46040000 */  add.s      $f0, $f0, $f4
/* AF1D8 800AE5D8 E6440014 */  swc1       $f4, 0x14($s2)
/* AF1DC 800AE5DC E6460018 */  swc1       $f6, 0x18($s2)
/* AF1E0 800AE5E0 46061080 */  add.s      $f2, $f2, $f6
/* AF1E4 800AE5E4 E6480004 */  swc1       $f8, 4($s2)
/* AF1E8 800AE5E8 E6400008 */  swc1       $f0, 8($s2)
/* AF1EC 800AE5EC 1440FFDE */  bnez       $v0, .L800AE568
/* AF1F0 800AE5F0 E642000C */   swc1      $f2, 0xc($s2)
.L800AE5F4:
/* AF1F4 800AE5F4 9642001C */  lhu        $v0, 0x1c($s2)
/* AF1F8 800AE5F8 30424000 */  andi       $v0, $v0, 0x4000
/* AF1FC 800AE5FC 1440004B */  bnez       $v0, .L800AE72C
/* AF200 800AE600 8FBF0080 */   lw        $ra, 0x80($sp)
/* AF204 800AE604 02A02021 */  addu       $a0, $s5, $zero
/* AF208 800AE608 02402821 */  addu       $a1, $s2, $zero
/* AF20C 800AE60C 27A60058 */  addiu      $a2, $sp, 0x58
/* AF210 800AE610 27A2005C */  addiu      $v0, $sp, 0x5c
/* AF214 800AE614 27A3005E */  addiu      $v1, $sp, 0x5e
/* AF218 800AE618 27A7005A */  addiu      $a3, $sp, 0x5a
/* AF21C 800AE61C AFA20010 */  sw         $v0, 0x10($sp)
/* AF220 800AE620 0C02B711 */  jal        func_800ADC44
/* AF224 800AE624 AFA30014 */   sw        $v1, 0x14($sp)
/* AF228 800AE628 87B10058 */  lh         $s1, 0x58($sp)
/* AF22C 800AE62C 87A2005C */  lh         $v0, 0x5c($sp)
/* AF230 800AE630 0051102A */  slt        $v0, $v0, $s1
/* AF234 800AE634 1440001D */  bnez       $v0, .L800AE6AC
/* AF238 800AE638 A640001E */   sh        $zero, 0x1e($s2)
/* AF23C 800AE63C 3C170001 */  lui        $s7, 1
/* AF240 800AE640 87A6005A */  lh         $a2, 0x5a($sp)
.L800AE644:
/* AF244 800AE644 87A2005E */  lh         $v0, 0x5e($sp)
/* AF248 800AE648 0046102A */  slt        $v0, $v0, $a2
/* AF24C 800AE64C 14400011 */  bnez       $v0, .L800AE694
/* AF250 800AE650 26330001 */   addiu     $s3, $s1, 1
/* AF254 800AE654 00061400 */  sll        $v0, $a2, 0x10
/* AF258 800AE658 00578021 */  addu       $s0, $v0, $s7
/* AF25C 800AE65C 3C140001 */  lui        $s4, 1
.L800AE660:
/* AF260 800AE660 02A02021 */  addu       $a0, $s5, $zero
/* AF264 800AE664 0C02BCCE */  jal        borg9_get_unkStruct
/* AF268 800AE668 02202821 */   addu      $a1, $s1, $zero
/* AF26C 800AE66C 02402021 */  addu       $a0, $s2, $zero
/* AF270 800AE670 8EA6003C */  lw         $a2, 0x3c($s5)
/* AF274 800AE674 0C02BE06 */  jal        CollideCollisionSphereWithVoxelPolys
/* AF278 800AE678 00402821 */   addu      $a1, $v0, $zero
/* AF27C 800AE67C 02001821 */  addu       $v1, $s0, $zero
/* AF280 800AE680 87A2005E */  lh         $v0, 0x5e($sp)
/* AF284 800AE684 00033403 */  sra        $a2, $v1, 0x10
/* AF288 800AE688 0046102A */  slt        $v0, $v0, $a2
/* AF28C 800AE68C 1040FFF4 */  beqz       $v0, .L800AE660
/* AF290 800AE690 02148021 */   addu      $s0, $s0, $s4
.L800AE694:
/* AF294 800AE694 00131C00 */  sll        $v1, $s3, 0x10
/* AF298 800AE698 87A2005C */  lh         $v0, 0x5c($sp)
/* AF29C 800AE69C 00038C03 */  sra        $s1, $v1, 0x10
/* AF2A0 800AE6A0 0051102A */  slt        $v0, $v0, $s1
/* AF2A4 800AE6A4 5040FFE7 */  beql       $v0, $zero, .L800AE644
/* AF2A8 800AE6A8 87A6005A */   lh        $a2, 0x5a($sp)
.L800AE6AC:
/* AF2AC 800AE6AC 9642001E */  lhu        $v0, 0x1e($s2)
/* AF2B0 800AE6B0 1040001E */  beqz       $v0, .L800AE72C
/* AF2B4 800AE6B4 8FBF0080 */   lw        $ra, 0x80($sp)
/* AF2B8 800AE6B8 0C02AB0F */  jal        vec3hypotenouse
/* AF2BC 800AE6BC 26440010 */   addiu     $a0, $s2, 0x10
/* AF2C0 800AE6C0 44961000 */  mtc1       $s6, $f2
/* AF2C4 800AE6C4 468010A0 */  cvt.s.w    $f2, $f2
/* AF2C8 800AE6C8 3C01800E */  lui        $at, %hi(D_800E3748)
/* AF2CC 800AE6CC D4243748 */  ldc1       $f4, %lo(D_800E3748)($at)
/* AF2D0 800AE6D0 460010A1 */  cvt.d.s    $f2, $f2
/* AF2D4 800AE6D4 46241502 */  mul.d      $f20, $f2, $f4
/* AF2D8 800AE6D8 46000021 */  cvt.d.s    $f0, $f0
/* AF2DC 800AE6DC 4634003C */  c.lt.d     $f0, $f20
/* AF2E0 800AE6E0 00000000 */  nop
/* AF2E4 800AE6E4 45000010 */  bc1f       .L800AE728
/* AF2E8 800AE6E8 27A40018 */   addiu     $a0, $sp, 0x18
/* AF2EC 800AE6EC 0C02AB66 */  jal        get_vec3_proximity
/* AF2F0 800AE6F0 26450004 */   addiu     $a1, $s2, 4
/* AF2F4 800AE6F4 46000021 */  cvt.d.s    $f0, $f0
/* AF2F8 800AE6F8 4634003C */  c.lt.d     $f0, $f20
/* AF2FC 800AE6FC 00000000 */  nop
/* AF300 800AE700 45000009 */  bc1f       .L800AE728
/* AF304 800AE704 C7A00018 */   lwc1      $f0, 0x18($sp)
/* AF308 800AE708 C7A2001C */  lwc1       $f2, 0x1c($sp)
/* AF30C 800AE70C C7A40020 */  lwc1       $f4, 0x20($sp)
/* AF310 800AE710 AE400010 */  sw         $zero, 0x10($s2)
/* AF314 800AE714 AE400014 */  sw         $zero, 0x14($s2)
/* AF318 800AE718 AE400018 */  sw         $zero, 0x18($s2)
/* AF31C 800AE71C E6400004 */  swc1       $f0, 4($s2)
/* AF320 800AE720 E6420008 */  swc1       $f2, 8($s2)
/* AF324 800AE724 E644000C */  swc1       $f4, 0xc($s2)
.L800AE728:
/* AF328 800AE728 8FBF0080 */  lw         $ra, 0x80($sp)
.L800AE72C:
/* AF32C 800AE72C 8FB7007C */  lw         $s7, 0x7c($sp)
/* AF330 800AE730 8FB60078 */  lw         $s6, 0x78($sp)
/* AF334 800AE734 8FB50074 */  lw         $s5, 0x74($sp)
/* AF338 800AE738 8FB40070 */  lw         $s4, 0x70($sp)
/* AF33C 800AE73C 8FB3006C */  lw         $s3, 0x6c($sp)
/* AF340 800AE740 8FB20068 */  lw         $s2, 0x68($sp)
/* AF344 800AE744 8FB10064 */  lw         $s1, 0x64($sp)
/* AF348 800AE748 8FB00060 */  lw         $s0, 0x60($sp)
/* AF34C 800AE74C D7B40088 */  ldc1       $f20, 0x88($sp)
/* AF350 800AE750 03E00008 */  jr         $ra
/* AF354 800AE754 27BD0090 */   addiu     $sp, $sp, 0x90
/* AF358 800AE758 00000000 */  nop
/* AF35C 800AE75C 00000000 */  nop
