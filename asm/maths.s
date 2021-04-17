.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel vec2_length
/* AB810 800AAC10 C4800000 */  lwc1       $f0, ($a0)
/* AB814 800AAC14 46000002 */  mul.s      $f0, $f0, $f0
/* AB818 800AAC18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* AB81C 800AAC1C AFBF0010 */  sw         $ra, 0x10($sp)
/* AB820 800AAC20 C48C0004 */  lwc1       $f12, 4($a0)
/* AB824 800AAC24 460C6302 */  mul.s      $f12, $f12, $f12
/* AB828 800AAC28 0C0334B4 */  jal        _sqrtf
/* AB82C 800AAC2C 460C0300 */   add.s     $f12, $f0, $f12
/* AB830 800AAC30 8FBF0010 */  lw         $ra, 0x10($sp)
/* AB834 800AAC34 03E00008 */  jr         $ra
/* AB838 800AAC38 27BD0018 */   addiu     $sp, $sp, 0x18

glabel vec3hypotenouse
/* AB83C 800AAC3C C4820000 */  lwc1       $f2, ($a0)
/* AB840 800AAC40 46021082 */  mul.s      $f2, $f2, $f2
/* AB844 800AAC44 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* AB848 800AAC48 AFBF0010 */  sw         $ra, 0x10($sp)
/* AB84C 800AAC4C C4800004 */  lwc1       $f0, 4($a0)
/* AB850 800AAC50 46000002 */  mul.s      $f0, $f0, $f0
/* AB854 800AAC54 C48C0008 */  lwc1       $f12, 8($a0)
/* AB858 800AAC58 460C6302 */  mul.s      $f12, $f12, $f12
/* AB85C 800AAC5C 46001080 */  add.s      $f2, $f2, $f0
/* AB860 800AAC60 0C0334B4 */  jal        _sqrtf
/* AB864 800AAC64 460C1300 */   add.s     $f12, $f2, $f12
/* AB868 800AAC68 8FBF0010 */  lw         $ra, 0x10($sp)
/* AB86C 800AAC6C 03E00008 */  jr         $ra
/* AB870 800AAC70 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Vec2_Sub
/* AB874 800AAC74 C4A20000 */  lwc1       $f2, ($a1)
/* AB878 800AAC78 C4C00000 */  lwc1       $f0, ($a2)
/* AB87C 800AAC7C 46001081 */  sub.s      $f2, $f2, $f0
/* AB880 800AAC80 E4820000 */  swc1       $f2, ($a0)
/* AB884 800AAC84 C4A00004 */  lwc1       $f0, 4($a1)
/* AB888 800AAC88 C4C20004 */  lwc1       $f2, 4($a2)
/* AB88C 800AAC8C 46020001 */  sub.s      $f0, $f0, $f2
/* AB890 800AAC90 03E00008 */  jr         $ra
/* AB894 800AAC94 E4800004 */   swc1      $f0, 4($a0)

glabel Vec3A_BsubC
/* AB898 800AAC98 C4A20000 */  lwc1       $f2, ($a1)
/* AB89C 800AAC9C C4C00000 */  lwc1       $f0, ($a2)
/* AB8A0 800AACA0 46001081 */  sub.s      $f2, $f2, $f0
/* AB8A4 800AACA4 E4820000 */  swc1       $f2, ($a0)
/* AB8A8 800AACA8 C4A00004 */  lwc1       $f0, 4($a1)
/* AB8AC 800AACAC C4C20004 */  lwc1       $f2, 4($a2)
/* AB8B0 800AACB0 46020001 */  sub.s      $f0, $f0, $f2
/* AB8B4 800AACB4 E4800004 */  swc1       $f0, 4($a0)
/* AB8B8 800AACB8 C4A20008 */  lwc1       $f2, 8($a1)
/* AB8BC 800AACBC C4C00008 */  lwc1       $f0, 8($a2)
/* AB8C0 800AACC0 46001081 */  sub.s      $f2, $f2, $f0
/* AB8C4 800AACC4 03E00008 */  jr         $ra
/* AB8C8 800AACC8 E4820008 */   swc1      $f2, 8($a0)

glabel sybVec4
/* AB8CC 800AACCC C4A20000 */  lwc1       $f2, ($a1)
/* AB8D0 800AACD0 C4C00000 */  lwc1       $f0, ($a2)
/* AB8D4 800AACD4 46001081 */  sub.s      $f2, $f2, $f0
/* AB8D8 800AACD8 E4820000 */  swc1       $f2, ($a0)
/* AB8DC 800AACDC C4A00004 */  lwc1       $f0, 4($a1)
/* AB8E0 800AACE0 C4C20004 */  lwc1       $f2, 4($a2)
/* AB8E4 800AACE4 46020001 */  sub.s      $f0, $f0, $f2
/* AB8E8 800AACE8 E4800004 */  swc1       $f0, 4($a0)
/* AB8EC 800AACEC C4A20008 */  lwc1       $f2, 8($a1)
/* AB8F0 800AACF0 C4C00008 */  lwc1       $f0, 8($a2)
/* AB8F4 800AACF4 46001081 */  sub.s      $f2, $f2, $f0
/* AB8F8 800AACF8 E4820008 */  swc1       $f2, 8($a0)
/* AB8FC 800AACFC C4A0000C */  lwc1       $f0, 0xc($a1)
/* AB900 800AAD00 C4C2000C */  lwc1       $f2, 0xc($a2)
/* AB904 800AAD04 46020001 */  sub.s      $f0, $f0, $f2
/* AB908 800AAD08 03E00008 */  jr         $ra
/* AB90C 800AAD0C E480000C */   swc1      $f0, 0xc($a0)

glabel vec2_sum
/* AB910 800AAD10 C4A20000 */  lwc1       $f2, ($a1)
/* AB914 800AAD14 C4C00000 */  lwc1       $f0, ($a2)
/* AB918 800AAD18 46001080 */  add.s      $f2, $f2, $f0
/* AB91C 800AAD1C E4820000 */  swc1       $f2, ($a0)
/* AB920 800AAD20 C4A00004 */  lwc1       $f0, 4($a1)
/* AB924 800AAD24 C4C20004 */  lwc1       $f2, 4($a2)
/* AB928 800AAD28 46020000 */  add.s      $f0, $f0, $f2
/* AB92C 800AAD2C 03E00008 */  jr         $ra
/* AB930 800AAD30 E4800004 */   swc1      $f0, 4($a0)

glabel vec3_sum
/* AB934 800AAD34 C4A20000 */  lwc1       $f2, ($a1)
/* AB938 800AAD38 C4C00000 */  lwc1       $f0, ($a2)
/* AB93C 800AAD3C 46001080 */  add.s      $f2, $f2, $f0
/* AB940 800AAD40 E4820000 */  swc1       $f2, ($a0)
/* AB944 800AAD44 C4A00004 */  lwc1       $f0, 4($a1)
/* AB948 800AAD48 C4C20004 */  lwc1       $f2, 4($a2)
/* AB94C 800AAD4C 46020000 */  add.s      $f0, $f0, $f2
/* AB950 800AAD50 E4800004 */  swc1       $f0, 4($a0)
/* AB954 800AAD54 C4A20008 */  lwc1       $f2, 8($a1)
/* AB958 800AAD58 C4C00008 */  lwc1       $f0, 8($a2)
/* AB95C 800AAD5C 46001080 */  add.s      $f2, $f2, $f0
/* AB960 800AAD60 03E00008 */  jr         $ra
/* AB964 800AAD64 E4820008 */   swc1      $f2, 8($a0)

glabel get_vec2_proximity
/* AB968 800AAD68 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* AB96C 800AAD6C 00801021 */  addu       $v0, $a0, $zero
/* AB970 800AAD70 27A40010 */  addiu      $a0, $sp, 0x10
/* AB974 800AAD74 00A03021 */  addu       $a2, $a1, $zero
/* AB978 800AAD78 AFBF0050 */  sw         $ra, 0x50($sp)
/* AB97C 800AAD7C 0C02AB1D */  jal        Vec2_Sub
/* AB980 800AAD80 00402821 */   addu      $a1, $v0, $zero
/* AB984 800AAD84 0C02AB04 */  jal        vec2_length
/* AB988 800AAD88 27A40010 */   addiu     $a0, $sp, 0x10
/* AB98C 800AAD8C 8FBF0050 */  lw         $ra, 0x50($sp)
/* AB990 800AAD90 03E00008 */  jr         $ra
/* AB994 800AAD94 27BD0058 */   addiu     $sp, $sp, 0x58

glabel get_vec3_proximity
/* AB998 800AAD98 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* AB99C 800AAD9C 00801021 */  addu       $v0, $a0, $zero
/* AB9A0 800AADA0 27A40010 */  addiu      $a0, $sp, 0x10
/* AB9A4 800AADA4 00A03021 */  addu       $a2, $a1, $zero
/* AB9A8 800AADA8 AFBF0050 */  sw         $ra, 0x50($sp)
/* AB9AC 800AADAC 0C02AB26 */  jal        Vec3A_BsubC
/* AB9B0 800AADB0 00402821 */   addu      $a1, $v0, $zero
/* AB9B4 800AADB4 0C02AB0F */  jal        vec3hypotenouse
/* AB9B8 800AADB8 27A40010 */   addiu     $a0, $sp, 0x10
/* AB9BC 800AADBC 8FBF0050 */  lw         $ra, 0x50($sp)
/* AB9C0 800AADC0 03E00008 */  jr         $ra
/* AB9C4 800AADC4 27BD0058 */   addiu     $sp, $sp, 0x58

glabel vec2_scalar_product
/* AB9C8 800AADC8 C4840000 */  lwc1       $f4, ($a0)
/* AB9CC 800AADCC C4A00000 */  lwc1       $f0, ($a1)
/* AB9D0 800AADD0 46002102 */  mul.s      $f4, $f4, $f0
/* AB9D4 800AADD4 C4A20004 */  lwc1       $f2, 4($a1)
/* AB9D8 800AADD8 C4800004 */  lwc1       $f0, 4($a0)
/* AB9DC 800AADDC 46020002 */  mul.s      $f0, $f0, $f2
/* AB9E0 800AADE0 03E00008 */  jr         $ra
/* AB9E4 800AADE4 46002000 */   add.s     $f0, $f4, $f0

glabel vec3_scalar_product
/* AB9E8 800AADE8 C4860000 */  lwc1       $f6, ($a0)
/* AB9EC 800AADEC C4A00000 */  lwc1       $f0, ($a1)
/* AB9F0 800AADF0 46003182 */  mul.s      $f6, $f6, $f0
/* AB9F4 800AADF4 C4840004 */  lwc1       $f4, 4($a0)
/* AB9F8 800AADF8 C4A00004 */  lwc1       $f0, 4($a1)
/* AB9FC 800AADFC 46002102 */  mul.s      $f4, $f4, $f0
/* ABA00 800AAE00 C4A20008 */  lwc1       $f2, 8($a1)
/* ABA04 800AAE04 C4800008 */  lwc1       $f0, 8($a0)
/* ABA08 800AAE08 46020002 */  mul.s      $f0, $f0, $f2
/* ABA0C 800AAE0C 46043180 */  add.s      $f6, $f6, $f4
/* ABA10 800AAE10 03E00008 */  jr         $ra
/* ABA14 800AAE14 46003000 */   add.s     $f0, $f6, $f0

glabel some_vec3_math
/* ABA18 800AAE18 C4A60004 */  lwc1       $f6, 4($a1)
/* ABA1C 800AAE1C C4C20008 */  lwc1       $f2, 8($a2)
/* ABA20 800AAE20 46023182 */  mul.s      $f6, $f6, $f2
/* ABA24 800AAE24 C4A00008 */  lwc1       $f0, 8($a1)
/* ABA28 800AAE28 C4C20004 */  lwc1       $f2, 4($a2)
/* ABA2C 800AAE2C 46020002 */  mul.s      $f0, $f0, $f2
/* ABA30 800AAE30 46003181 */  sub.s      $f6, $f6, $f0
/* ABA34 800AAE34 E4860000 */  swc1       $f6, ($a0)
/* ABA38 800AAE38 C4A40008 */  lwc1       $f4, 8($a1)
/* ABA3C 800AAE3C C4C20000 */  lwc1       $f2, ($a2)
/* ABA40 800AAE40 46022102 */  mul.s      $f4, $f4, $f2
/* ABA44 800AAE44 C4A00000 */  lwc1       $f0, ($a1)
/* ABA48 800AAE48 C4C20008 */  lwc1       $f2, 8($a2)
/* ABA4C 800AAE4C 46020002 */  mul.s      $f0, $f0, $f2
/* ABA50 800AAE50 46002101 */  sub.s      $f4, $f4, $f0
/* ABA54 800AAE54 E4840004 */  swc1       $f4, 4($a0)
/* ABA58 800AAE58 C4A60000 */  lwc1       $f6, ($a1)
/* ABA5C 800AAE5C C4C20004 */  lwc1       $f2, 4($a2)
/* ABA60 800AAE60 46023182 */  mul.s      $f6, $f6, $f2
/* ABA64 800AAE64 C4A00004 */  lwc1       $f0, 4($a1)
/* ABA68 800AAE68 C4C20000 */  lwc1       $f2, ($a2)
/* ABA6C 800AAE6C 46020002 */  mul.s      $f0, $f0, $f2
/* ABA70 800AAE70 46003181 */  sub.s      $f6, $f6, $f0
/* ABA74 800AAE74 03E00008 */  jr         $ra
/* ABA78 800AAE78 E4860008 */   swc1      $f6, 8($a0)

glabel vec2_normalize
/* ABA7C 800AAE7C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* ABA80 800AAE80 AFB00010 */  sw         $s0, 0x10($sp)
/* ABA84 800AAE84 00808021 */  addu       $s0, $a0, $zero
/* ABA88 800AAE88 AFBF0014 */  sw         $ra, 0x14($sp)
/* ABA8C 800AAE8C C6000000 */  lwc1       $f0, ($s0)
/* ABA90 800AAE90 46000002 */  mul.s      $f0, $f0, $f0
/* ABA94 800AAE94 C60C0004 */  lwc1       $f12, 4($s0)
/* ABA98 800AAE98 460C6302 */  mul.s      $f12, $f12, $f12
/* ABA9C 800AAE9C 0C0334B4 */  jal        _sqrtf
/* ABAA0 800AAEA0 460C0300 */   add.s     $f12, $f0, $f12
/* ABAA4 800AAEA4 3C01800E */  lui        $at, %hi(D_800E3660)
/* ABAA8 800AAEA8 C4223660 */  lwc1       $f2, %lo(D_800E3660)($at)
/* ABAAC 800AAEAC 46000186 */  mov.s      $f6, $f0
/* ABAB0 800AAEB0 4602303C */  c.lt.s     $f6, $f2
/* ABAB4 800AAEB4 00000000 */  nop
/* ABAB8 800AAEB8 45030001 */  bc1tl      .L800AAEC0
/* ABABC 800AAEBC 46001186 */   mov.s     $f6, $f2
.L800AAEC0:
/* ABAC0 800AAEC0 C6020000 */  lwc1       $f2, ($s0)
/* ABAC4 800AAEC4 C6040004 */  lwc1       $f4, 4($s0)
/* ABAC8 800AAEC8 8FBF0014 */  lw         $ra, 0x14($sp)
/* ABACC 800AAECC 46061083 */  div.s      $f2, $f2, $f6
/* ABAD0 800AAED0 46062103 */  div.s      $f4, $f4, $f6
/* ABAD4 800AAED4 E6020000 */  swc1       $f2, ($s0)
/* ABAD8 800AAED8 E6040004 */  swc1       $f4, 4($s0)
/* ABADC 800AAEDC 8FB00010 */  lw         $s0, 0x10($sp)
/* ABAE0 800AAEE0 46003006 */  mov.s      $f0, $f6
/* ABAE4 800AAEE4 03E00008 */  jr         $ra
/* ABAE8 800AAEE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel vec3_normalize
/* ABAEC 800AAEEC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* ABAF0 800AAEF0 AFB00010 */  sw         $s0, 0x10($sp)
/* ABAF4 800AAEF4 00808021 */  addu       $s0, $a0, $zero
/* ABAF8 800AAEF8 AFBF0014 */  sw         $ra, 0x14($sp)
/* ABAFC 800AAEFC C60C0000 */  lwc1       $f12, ($s0)
/* ABB00 800AAF00 460C6302 */  mul.s      $f12, $f12, $f12
/* ABB04 800AAF04 C6020004 */  lwc1       $f2, 4($s0)
/* ABB08 800AAF08 46021082 */  mul.s      $f2, $f2, $f2
/* ABB0C 800AAF0C C6000008 */  lwc1       $f0, 8($s0)
/* ABB10 800AAF10 46000002 */  mul.s      $f0, $f0, $f0
/* ABB14 800AAF14 46026300 */  add.s      $f12, $f12, $f2
/* ABB18 800AAF18 0C0334B4 */  jal        _sqrtf
/* ABB1C 800AAF1C 46006300 */   add.s     $f12, $f12, $f0
/* ABB20 800AAF20 3C01800E */  lui        $at, %hi(D_800E3664)
/* ABB24 800AAF24 C4223664 */  lwc1       $f2, %lo(D_800E3664)($at)
/* ABB28 800AAF28 46000186 */  mov.s      $f6, $f0
/* ABB2C 800AAF2C 4602303C */  c.lt.s     $f6, $f2
/* ABB30 800AAF30 00000000 */  nop
/* ABB34 800AAF34 45030001 */  bc1tl      .L800AAF3C
/* ABB38 800AAF38 46001186 */   mov.s     $f6, $f2
.L800AAF3C:
/* ABB3C 800AAF3C C6020000 */  lwc1       $f2, ($s0)
/* ABB40 800AAF40 C6040004 */  lwc1       $f4, 4($s0)
/* ABB44 800AAF44 8FBF0014 */  lw         $ra, 0x14($sp)
/* ABB48 800AAF48 46061083 */  div.s      $f2, $f2, $f6
/* ABB4C 800AAF4C E6020000 */  swc1       $f2, ($s0)
/* ABB50 800AAF50 C6020008 */  lwc1       $f2, 8($s0)
/* ABB54 800AAF54 46062103 */  div.s      $f4, $f4, $f6
/* ABB58 800AAF58 E6040004 */  swc1       $f4, 4($s0)
/* ABB5C 800AAF5C 46061083 */  div.s      $f2, $f2, $f6
/* ABB60 800AAF60 E6020008 */  swc1       $f2, 8($s0)
/* ABB64 800AAF64 8FB00010 */  lw         $s0, 0x10($sp)
/* ABB68 800AAF68 46003006 */  mov.s      $f0, $f6
/* ABB6C 800AAF6C 03E00008 */  jr         $ra
/* ABB70 800AAF70 27BD0018 */   addiu     $sp, $sp, 0x18

glabel vec4_normalize
/* ABB74 800AAF74 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* ABB78 800AAF78 AFB00010 */  sw         $s0, 0x10($sp)
/* ABB7C 800AAF7C 00808021 */  addu       $s0, $a0, $zero
/* ABB80 800AAF80 AFBF0014 */  sw         $ra, 0x14($sp)
/* ABB84 800AAF84 C60C0000 */  lwc1       $f12, ($s0)
/* ABB88 800AAF88 460C6302 */  mul.s      $f12, $f12, $f12
/* ABB8C 800AAF8C C6040004 */  lwc1       $f4, 4($s0)
/* ABB90 800AAF90 46042102 */  mul.s      $f4, $f4, $f4
/* ABB94 800AAF94 C6020008 */  lwc1       $f2, 8($s0)
/* ABB98 800AAF98 46021082 */  mul.s      $f2, $f2, $f2
/* ABB9C 800AAF9C C600000C */  lwc1       $f0, 0xc($s0)
/* ABBA0 800AAFA0 46000002 */  mul.s      $f0, $f0, $f0
/* ABBA4 800AAFA4 46046300 */  add.s      $f12, $f12, $f4
/* ABBA8 800AAFA8 46026300 */  add.s      $f12, $f12, $f2
/* ABBAC 800AAFAC 0C0334B4 */  jal        _sqrtf
/* ABBB0 800AAFB0 46006300 */   add.s     $f12, $f12, $f0
/* ABBB4 800AAFB4 3C01800E */  lui        $at, %hi(D_800E3668)
/* ABBB8 800AAFB8 C4223668 */  lwc1       $f2, %lo(D_800E3668)($at)
/* ABBBC 800AAFBC 46000186 */  mov.s      $f6, $f0
/* ABBC0 800AAFC0 4602303C */  c.lt.s     $f6, $f2
/* ABBC4 800AAFC4 00000000 */  nop
/* ABBC8 800AAFC8 45030001 */  bc1tl      .L800AAFD0
/* ABBCC 800AAFCC 46001186 */   mov.s     $f6, $f2
.L800AAFD0:
/* ABBD0 800AAFD0 C6020000 */  lwc1       $f2, ($s0)
/* ABBD4 800AAFD4 C6040004 */  lwc1       $f4, 4($s0)
/* ABBD8 800AAFD8 8FBF0014 */  lw         $ra, 0x14($sp)
/* ABBDC 800AAFDC 46061083 */  div.s      $f2, $f2, $f6
/* ABBE0 800AAFE0 E6020000 */  swc1       $f2, ($s0)
/* ABBE4 800AAFE4 C6020008 */  lwc1       $f2, 8($s0)
/* ABBE8 800AAFE8 46062103 */  div.s      $f4, $f4, $f6
/* ABBEC 800AAFEC E6040004 */  swc1       $f4, 4($s0)
/* ABBF0 800AAFF0 C604000C */  lwc1       $f4, 0xc($s0)
/* ABBF4 800AAFF4 46061083 */  div.s      $f2, $f2, $f6
/* ABBF8 800AAFF8 46062103 */  div.s      $f4, $f4, $f6
/* ABBFC 800AAFFC E6020008 */  swc1       $f2, 8($s0)
/* ABC00 800AB000 E604000C */  swc1       $f4, 0xc($s0)
/* ABC04 800AB004 8FB00010 */  lw         $s0, 0x10($sp)
/* ABC08 800AB008 46003006 */  mov.s      $f0, $f6
/* ABC0C 800AB00C 03E00008 */  jr         $ra
/* ABC10 800AB010 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_vec3_math_sphere
/* ABC14 800AB014 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* ABC18 800AB018 AFB3009C */  sw         $s3, 0x9c($sp)
/* ABC1C 800AB01C 00809821 */  addu       $s3, $a0, $zero
/* ABC20 800AB020 27A40010 */  addiu      $a0, $sp, 0x10
/* ABC24 800AB024 AFB00090 */  sw         $s0, 0x90($sp)
/* ABC28 800AB028 00A08021 */  addu       $s0, $a1, $zero
/* ABC2C 800AB02C AFB20098 */  sw         $s2, 0x98($sp)
/* ABC30 800AB030 00E09021 */  addu       $s2, $a3, $zero
/* ABC34 800AB034 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* ABC38 800AB038 0C02AB26 */  jal        Vec3A_BsubC
/* ABC3C 800AB03C AFB10094 */   sw        $s1, 0x94($sp)
/* ABC40 800AB040 27B10050 */  addiu      $s1, $sp, 0x50
/* ABC44 800AB044 02202021 */  addu       $a0, $s1, $zero
/* ABC48 800AB048 02002821 */  addu       $a1, $s0, $zero
/* ABC4C 800AB04C 0C02AB26 */  jal        Vec3A_BsubC
/* ABC50 800AB050 02403021 */   addu      $a2, $s2, $zero
/* ABC54 800AB054 02602021 */  addu       $a0, $s3, $zero
/* ABC58 800AB058 27A50010 */  addiu      $a1, $sp, 0x10
/* ABC5C 800AB05C 0C02AB86 */  jal        some_vec3_math
/* ABC60 800AB060 02203021 */   addu      $a2, $s1, $zero
/* ABC64 800AB064 0C02ABBB */  jal        vec3_normalize
/* ABC68 800AB068 02602021 */   addu      $a0, $s3, $zero
/* ABC6C 800AB06C 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* ABC70 800AB070 8FB3009C */  lw         $s3, 0x9c($sp)
/* ABC74 800AB074 8FB20098 */  lw         $s2, 0x98($sp)
/* ABC78 800AB078 8FB10094 */  lw         $s1, 0x94($sp)
/* ABC7C 800AB07C 8FB00090 */  lw         $s0, 0x90($sp)
/* ABC80 800AB080 03E00008 */  jr         $ra
/* ABC84 800AB084 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel some_trig_func_2
/* ABC88 800AB088 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* ABC8C 800AB08C AFB00090 */  sw         $s0, 0x90($sp)
/* ABC90 800AB090 00808021 */  addu       $s0, $a0, $zero
/* ABC94 800AB094 F7B600A8 */  sdc1       $f22, 0xa8($sp)
/* ABC98 800AB098 4486B000 */  mtc1       $a2, $f22
/* ABC9C 800AB09C AFB10094 */  sw         $s1, 0x94($sp)
/* ABCA0 800AB0A0 AFBF0098 */  sw         $ra, 0x98($sp)
/* ABCA4 800AB0A4 F7BE00C8 */  sdc1       $f30, 0xc8($sp)
/* ABCA8 800AB0A8 F7BC00C0 */  sdc1       $f28, 0xc0($sp)
/* ABCAC 800AB0AC F7BA00B8 */  sdc1       $f26, 0xb8($sp)
/* ABCB0 800AB0B0 F7B800B0 */  sdc1       $f24, 0xb0($sp)
/* ABCB4 800AB0B4 F7B400A0 */  sdc1       $f20, 0xa0($sp)
/* ABCB8 800AB0B8 0C02AB9F */  jal        vec2_normalize
/* ABCBC 800AB0BC 00A08821 */   addu      $s1, $a1, $zero
/* ABCC0 800AB0C0 02202021 */  addu       $a0, $s1, $zero
/* ABCC4 800AB0C4 0C02AB9F */  jal        vec2_normalize
/* ABCC8 800AB0C8 46000706 */   mov.s     $f28, $f0
/* ABCCC 800AB0CC 02002021 */  addu       $a0, $s0, $zero
/* ABCD0 800AB0D0 02202821 */  addu       $a1, $s1, $zero
/* ABCD4 800AB0D4 0C02AB5A */  jal        get_vec2_proximity
/* ABCD8 800AB0D8 46000786 */   mov.s     $f30, $f0
/* ABCDC 800AB0DC 46000506 */  mov.s      $f20, $f0
/* ABCE0 800AB0E0 0C03328C */  jal        __sinf
/* ABCE4 800AB0E4 4600B306 */   mov.s     $f12, $f22
/* ABCE8 800AB0E8 46000686 */  mov.s      $f26, $f0
/* ABCEC 800AB0EC 461AA03E */  c.le.s     $f20, $f26
/* ABCF0 800AB0F0 00000000 */  nop
/* ABCF4 800AB0F4 4500000B */  bc1f       .L800AB124
/* ABCF8 800AB0F8 02202021 */   addu      $a0, $s1, $zero
/* ABCFC 800AB0FC 0C02AD12 */  jal        copyVec2
/* ABD00 800AB100 02002821 */   addu      $a1, $s0, $zero
/* ABD04 800AB104 4405E000 */  mfc1       $a1, $f28
/* ABD08 800AB108 0C02AD34 */  jal        multiVec2
/* ABD0C 800AB10C 02002021 */   addu      $a0, $s0, $zero
/* ABD10 800AB110 4405F000 */  mfc1       $a1, $f30
/* ABD14 800AB114 0C02AD34 */  jal        multiVec2
/* ABD18 800AB118 02202021 */   addu      $a0, $s1, $zero
/* ABD1C 800AB11C 0802AC84 */  j          .L800AB210
/* ABD20 800AB120 24020001 */   addiu     $v0, $zero, 1
.L800AB124:
/* ABD24 800AB124 3C01800E */  lui        $at, %hi(TAU)
/* ABD28 800AB128 C434366C */  lwc1       $f20, %lo(TAU)($at)
/* ABD2C 800AB12C 4616A501 */  sub.s      $f20, $f20, $f22
/* ABD30 800AB130 0C03328C */  jal        __sinf
/* ABD34 800AB134 4600A306 */   mov.s     $f12, $f20
/* ABD38 800AB138 4600B306 */  mov.s      $f12, $f22
/* ABD3C 800AB13C 0C02FB50 */  jal        __cosf
/* ABD40 800AB140 46000606 */   mov.s     $f24, $f0
/* ABD44 800AB144 4600A306 */  mov.s      $f12, $f20
/* ABD48 800AB148 0C02FB50 */  jal        __cosf
/* ABD4C 800AB14C 46000586 */   mov.s     $f22, $f0
/* ABD50 800AB150 C6040000 */  lwc1       $f4, ($s0)
/* ABD54 800AB154 4604B202 */  mul.s      $f8, $f22, $f4
/* ABD58 800AB158 C6020004 */  lwc1       $f2, 4($s0)
/* ABD5C 800AB15C 4602D382 */  mul.s      $f14, $f26, $f2
/* ABD60 800AB160 00000000 */  nop
/* ABD64 800AB164 4602B582 */  mul.s      $f22, $f22, $f2
/* ABD68 800AB168 00000000 */  nop
/* ABD6C 800AB16C 4604D302 */  mul.s      $f12, $f26, $f4
/* ABD70 800AB170 00000000 */  nop
/* ABD74 800AB174 46040182 */  mul.s      $f6, $f0, $f4
/* ABD78 800AB178 00000000 */  nop
/* ABD7C 800AB17C 4602C282 */  mul.s      $f10, $f24, $f2
/* ABD80 800AB180 00000000 */  nop
/* ABD84 800AB184 46020002 */  mul.s      $f0, $f0, $f2
/* ABD88 800AB188 00000000 */  nop
/* ABD8C 800AB18C 4604C602 */  mul.s      $f24, $f24, $f4
/* ABD90 800AB190 460E4200 */  add.s      $f8, $f8, $f14
/* ABD94 800AB194 460CB581 */  sub.s      $f22, $f22, $f12
/* ABD98 800AB198 460A3180 */  add.s      $f6, $f6, $f10
/* ABD9C 800AB19C 27A40010 */  addiu      $a0, $sp, 0x10
/* ABDA0 800AB1A0 02202821 */  addu       $a1, $s1, $zero
/* ABDA4 800AB1A4 46180001 */  sub.s      $f0, $f0, $f24
/* ABDA8 800AB1A8 E7A80010 */  swc1       $f8, 0x10($sp)
/* ABDAC 800AB1AC E7B60014 */  swc1       $f22, 0x14($sp)
/* ABDB0 800AB1B0 E7A60050 */  swc1       $f6, 0x50($sp)
/* ABDB4 800AB1B4 0C02AB5A */  jal        get_vec2_proximity
/* ABDB8 800AB1B8 E7A00054 */   swc1      $f0, 0x54($sp)
/* ABDBC 800AB1BC 27A40050 */  addiu      $a0, $sp, 0x50
/* ABDC0 800AB1C0 02202821 */  addu       $a1, $s1, $zero
/* ABDC4 800AB1C4 0C02AB5A */  jal        get_vec2_proximity
/* ABDC8 800AB1C8 46000506 */   mov.s     $f20, $f0
/* ABDCC 800AB1CC 4600A03C */  c.lt.s     $f20, $f0
/* ABDD0 800AB1D0 00000000 */  nop
/* ABDD4 800AB1D4 45000004 */  bc1f       .L800AB1E8
/* ABDD8 800AB1D8 C7A20010 */   lwc1      $f2, 0x10($sp)
/* ABDDC 800AB1DC 461C1082 */  mul.s      $f2, $f2, $f28
/* ABDE0 800AB1E0 0802AC7D */  j          .L800AB1F4
/* ABDE4 800AB1E4 C7A00014 */   lwc1      $f0, 0x14($sp)
.L800AB1E8:
/* ABDE8 800AB1E8 C7A20050 */  lwc1       $f2, 0x50($sp)
/* ABDEC 800AB1EC 461C1082 */  mul.s      $f2, $f2, $f28
/* ABDF0 800AB1F0 C7A00054 */  lwc1       $f0, 0x54($sp)
.L800AB1F4:
/* ABDF4 800AB1F4 461C0002 */  mul.s      $f0, $f0, $f28
/* ABDF8 800AB1F8 E6020000 */  swc1       $f2, ($s0)
/* ABDFC 800AB1FC E6000004 */  swc1       $f0, 4($s0)
/* ABE00 800AB200 4405F000 */  mfc1       $a1, $f30
/* ABE04 800AB204 0C02AD34 */  jal        multiVec2
/* ABE08 800AB208 02202021 */   addu      $a0, $s1, $zero
/* ABE0C 800AB20C 00001021 */  addu       $v0, $zero, $zero
.L800AB210:
/* ABE10 800AB210 8FBF0098 */  lw         $ra, 0x98($sp)
/* ABE14 800AB214 8FB10094 */  lw         $s1, 0x94($sp)
/* ABE18 800AB218 8FB00090 */  lw         $s0, 0x90($sp)
/* ABE1C 800AB21C D7BE00C8 */  ldc1       $f30, 0xc8($sp)
/* ABE20 800AB220 D7BC00C0 */  ldc1       $f28, 0xc0($sp)
/* ABE24 800AB224 D7BA00B8 */  ldc1       $f26, 0xb8($sp)
/* ABE28 800AB228 D7B800B0 */  ldc1       $f24, 0xb0($sp)
/* ABE2C 800AB22C D7B600A8 */  ldc1       $f22, 0xa8($sp)
/* ABE30 800AB230 D7B400A0 */  ldc1       $f20, 0xa0($sp)
/* ABE34 800AB234 03E00008 */  jr         $ra
/* ABE38 800AB238 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel func_800AB23C
/* ABE3C 800AB23C 27BDFED8 */  addiu      $sp, $sp, -0x128
/* ABE40 800AB240 AFB00110 */  sw         $s0, 0x110($sp)
/* ABE44 800AB244 00808021 */  addu       $s0, $a0, $zero
/* ABE48 800AB248 27A40050 */  addiu      $a0, $sp, 0x50
/* ABE4C 800AB24C AFB10114 */  sw         $s1, 0x114($sp)
/* ABE50 800AB250 00A08821 */  addu       $s1, $a1, $zero
/* ABE54 800AB254 00002821 */  addu       $a1, $zero, $zero
/* ABE58 800AB258 F7B40120 */  sdc1       $f20, 0x120($sp)
/* ABE5C 800AB25C 4486A000 */  mtc1       $a2, $f20
/* ABE60 800AB260 AFBF0118 */  sw         $ra, 0x118($sp)
/* ABE64 800AB264 0C026380 */  jal        Calloc
/* ABE68 800AB268 24060008 */   addiu     $a2, $zero, 8
/* ABE6C 800AB26C C6000000 */  lwc1       $f0, ($s0)
/* ABE70 800AB270 C6020008 */  lwc1       $f2, 8($s0)
/* ABE74 800AB274 27A400D0 */  addiu      $a0, $sp, 0xd0
/* ABE78 800AB278 E7A00050 */  swc1       $f0, 0x50($sp)
/* ABE7C 800AB27C 8FA20050 */  lw         $v0, 0x50($sp)
/* ABE80 800AB280 00002821 */  addu       $a1, $zero, $zero
/* ABE84 800AB284 E7A20054 */  swc1       $f2, 0x54($sp)
/* ABE88 800AB288 8FA30054 */  lw         $v1, 0x54($sp)
/* ABE8C 800AB28C 24060008 */  addiu      $a2, $zero, 8
/* ABE90 800AB290 AFA20010 */  sw         $v0, 0x10($sp)
/* ABE94 800AB294 0C026380 */  jal        Calloc
/* ABE98 800AB298 AFA30014 */   sw        $v1, 0x14($sp)
/* ABE9C 800AB29C C6200000 */  lwc1       $f0, ($s1)
/* ABEA0 800AB2A0 4406A000 */  mfc1       $a2, $f20
/* ABEA4 800AB2A4 C6220008 */  lwc1       $f2, 8($s1)
/* ABEA8 800AB2A8 E7A000D0 */  swc1       $f0, 0xd0($sp)
/* ABEAC 800AB2AC 8FA200D0 */  lw         $v0, 0xd0($sp)
/* ABEB0 800AB2B0 27A40010 */  addiu      $a0, $sp, 0x10
/* ABEB4 800AB2B4 E7A200D4 */  swc1       $f2, 0xd4($sp)
/* ABEB8 800AB2B8 8FA300D4 */  lw         $v1, 0xd4($sp)
/* ABEBC 800AB2BC 27A50090 */  addiu      $a1, $sp, 0x90
/* ABEC0 800AB2C0 AFA20090 */  sw         $v0, 0x90($sp)
/* ABEC4 800AB2C4 0C02AC22 */  jal        some_trig_func_2
/* ABEC8 800AB2C8 AFA30094 */   sw        $v1, 0x94($sp)
/* ABECC 800AB2CC C7A00010 */  lwc1       $f0, 0x10($sp)
/* ABED0 800AB2D0 C7A20014 */  lwc1       $f2, 0x14($sp)
/* ABED4 800AB2D4 8FBF0118 */  lw         $ra, 0x118($sp)
/* ABED8 800AB2D8 8FB10114 */  lw         $s1, 0x114($sp)
/* ABEDC 800AB2DC D7B40120 */  ldc1       $f20, 0x120($sp)
/* ABEE0 800AB2E0 E6000000 */  swc1       $f0, ($s0)
/* ABEE4 800AB2E4 E6020008 */  swc1       $f2, 8($s0)
/* ABEE8 800AB2E8 8FB00110 */  lw         $s0, 0x110($sp)
/* ABEEC 800AB2EC 03E00008 */  jr         $ra
/* ABEF0 800AB2F0 27BD0128 */   addiu     $sp, $sp, 0x128

glabel some_trig_func
/* ABEF4 800AB2F4 3C01800E */  lui        $at, %hi(DegToRad)
/* ABEF8 800AB2F8 C4203670 */  lwc1       $f0, %lo(DegToRad)($at)
/* ABEFC 800AB2FC 44851000 */  mtc1       $a1, $f2
/* ABF00 800AB300 27BDFF98 */  addiu      $sp, $sp, -0x68
/* ABF04 800AB304 F7B60060 */  sdc1       $f22, 0x60($sp)
/* ABF08 800AB308 46001582 */  mul.s      $f22, $f2, $f0
/* ABF0C 800AB30C AFB00050 */  sw         $s0, 0x50($sp)
/* ABF10 800AB310 00808021 */  addu       $s0, $a0, $zero
/* ABF14 800AB314 AFBF0054 */  sw         $ra, 0x54($sp)
/* ABF18 800AB318 F7B40058 */  sdc1       $f20, 0x58($sp)
/* ABF1C 800AB31C 0C03328C */  jal        __sinf
/* ABF20 800AB320 4600B306 */   mov.s     $f12, $f22
/* ABF24 800AB324 4600B306 */  mov.s      $f12, $f22
/* ABF28 800AB328 0C02FB50 */  jal        __cosf
/* ABF2C 800AB32C 46000506 */   mov.s     $f20, $f0
/* ABF30 800AB330 C6080000 */  lwc1       $f8, ($s0)
/* ABF34 800AB334 46080102 */  mul.s      $f4, $f0, $f8
/* ABF38 800AB338 C6020004 */  lwc1       $f2, 4($s0)
/* ABF3C 800AB33C 4602A182 */  mul.s      $f6, $f20, $f2
/* ABF40 800AB340 00000000 */  nop
/* ABF44 800AB344 46020002 */  mul.s      $f0, $f0, $f2
/* ABF48 800AB348 00000000 */  nop
/* ABF4C 800AB34C 4608A502 */  mul.s      $f20, $f20, $f8
/* ABF50 800AB350 46062100 */  add.s      $f4, $f4, $f6
/* ABF54 800AB354 8FBF0054 */  lw         $ra, 0x54($sp)
/* ABF58 800AB358 D7B60060 */  ldc1       $f22, 0x60($sp)
/* ABF5C 800AB35C 46140001 */  sub.s      $f0, $f0, $f20
/* ABF60 800AB360 D7B40058 */  ldc1       $f20, 0x58($sp)
/* ABF64 800AB364 E7A40010 */  swc1       $f4, 0x10($sp)
/* ABF68 800AB368 E7A00014 */  swc1       $f0, 0x14($sp)
/* ABF6C 800AB36C E6040000 */  swc1       $f4, ($s0)
/* ABF70 800AB370 E6000004 */  swc1       $f0, 4($s0)
/* ABF74 800AB374 8FB00050 */  lw         $s0, 0x50($sp)
/* ABF78 800AB378 03E00008 */  jr         $ra
/* ABF7C 800AB37C 27BD0068 */   addiu     $sp, $sp, 0x68

glabel some_vec2Math
/* ABF80 800AB380 44860000 */  mtc1       $a2, $f0
/* ABF84 800AB384 C48A0000 */  lwc1       $f10, ($a0)
/* ABF88 800AB388 460A0182 */  mul.s      $f6, $f0, $f10
/* ABF8C 800AB38C 44851000 */  mtc1       $a1, $f2
/* ABF90 800AB390 C4840004 */  lwc1       $f4, 4($a0)
/* ABF94 800AB394 46041202 */  mul.s      $f8, $f2, $f4
/* ABF98 800AB398 00000000 */  nop
/* ABF9C 800AB39C 46040002 */  mul.s      $f0, $f0, $f4
/* ABFA0 800AB3A0 00000000 */  nop
/* ABFA4 800AB3A4 460A1082 */  mul.s      $f2, $f2, $f10
/* ABFA8 800AB3A8 46083180 */  add.s      $f6, $f6, $f8
/* ABFAC 800AB3AC 46020001 */  sub.s      $f0, $f0, $f2
/* ABFB0 800AB3B0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* ABFB4 800AB3B4 E7A60000 */  swc1       $f6, ($sp)
/* ABFB8 800AB3B8 E7A00004 */  swc1       $f0, 4($sp)
/* ABFBC 800AB3BC E4860000 */  swc1       $f6, ($a0)
/* ABFC0 800AB3C0 E4800004 */  swc1       $f0, 4($a0)
/* ABFC4 800AB3C4 03E00008 */  jr         $ra
/* ABFC8 800AB3C8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800AB3CC
/* ABFCC 800AB3CC 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* ABFD0 800AB3D0 AFB00090 */  sw         $s0, 0x90($sp)
/* ABFD4 800AB3D4 00808021 */  addu       $s0, $a0, $zero
/* ABFD8 800AB3D8 27A40050 */  addiu      $a0, $sp, 0x50
/* ABFDC 800AB3DC F7B40098 */  sdc1       $f20, 0x98($sp)
/* ABFE0 800AB3E0 4485A000 */  mtc1       $a1, $f20
/* ABFE4 800AB3E4 00002821 */  addu       $a1, $zero, $zero
/* ABFE8 800AB3E8 AFBF0094 */  sw         $ra, 0x94($sp)
/* ABFEC 800AB3EC 0C026380 */  jal        Calloc
/* ABFF0 800AB3F0 24060008 */   addiu     $a2, $zero, 8
/* ABFF4 800AB3F4 C6000000 */  lwc1       $f0, ($s0)
/* ABFF8 800AB3F8 C6020008 */  lwc1       $f2, 8($s0)
/* ABFFC 800AB3FC 4405A000 */  mfc1       $a1, $f20
/* AC000 800AB400 E7A00050 */  swc1       $f0, 0x50($sp)
/* AC004 800AB404 8FA20050 */  lw         $v0, 0x50($sp)
/* AC008 800AB408 E7A20054 */  swc1       $f2, 0x54($sp)
/* AC00C 800AB40C 8FA30054 */  lw         $v1, 0x54($sp)
/* AC010 800AB410 27A40010 */  addiu      $a0, $sp, 0x10
/* AC014 800AB414 AFA20010 */  sw         $v0, 0x10($sp)
/* AC018 800AB418 0C02ACBD */  jal        some_trig_func
/* AC01C 800AB41C AFA30014 */   sw        $v1, 0x14($sp)
/* AC020 800AB420 02002021 */  addu       $a0, $s0, $zero
/* AC024 800AB424 8FA50010 */  lw         $a1, 0x10($sp)
/* AC028 800AB428 8C860004 */  lw         $a2, 4($a0)
/* AC02C 800AB42C 0C02AD58 */  jal        setVec3
/* AC030 800AB430 8FA70014 */   lw        $a3, 0x14($sp)
/* AC034 800AB434 8FBF0094 */  lw         $ra, 0x94($sp)
/* AC038 800AB438 8FB00090 */  lw         $s0, 0x90($sp)
/* AC03C 800AB43C D7B40098 */  ldc1       $f20, 0x98($sp)
/* AC040 800AB440 03E00008 */  jr         $ra
/* AC044 800AB444 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel copyVec2
/* AC048 800AB448 C4820000 */  lwc1       $f2, ($a0)
/* AC04C 800AB44C E4A20000 */  swc1       $f2, ($a1)
/* AC050 800AB450 C4800004 */  lwc1       $f0, 4($a0)
/* AC054 800AB454 03E00008 */  jr         $ra
/* AC058 800AB458 E4A00004 */   swc1      $f0, 4($a1)

glabel copyVec3
/* AC05C 800AB45C C4820000 */  lwc1       $f2, ($a0)
/* AC060 800AB460 E4A20000 */  swc1       $f2, ($a1)
/* AC064 800AB464 C4800004 */  lwc1       $f0, 4($a0)
/* AC068 800AB468 E4A00004 */  swc1       $f0, 4($a1)
/* AC06C 800AB46C C4820008 */  lwc1       $f2, 8($a0)
/* AC070 800AB470 03E00008 */  jr         $ra
/* AC074 800AB474 E4A20008 */   swc1      $f2, 8($a1)

glabel copyVec4
/* AC078 800AB478 C4820000 */  lwc1       $f2, ($a0)
/* AC07C 800AB47C E4A20000 */  swc1       $f2, ($a1)
/* AC080 800AB480 C4800004 */  lwc1       $f0, 4($a0)
/* AC084 800AB484 E4A00004 */  swc1       $f0, 4($a1)
/* AC088 800AB488 C4820008 */  lwc1       $f2, 8($a0)
/* AC08C 800AB48C E4A20008 */  swc1       $f2, 8($a1)
/* AC090 800AB490 C480000C */  lwc1       $f0, 0xc($a0)
/* AC094 800AB494 03E00008 */  jr         $ra
/* AC098 800AB498 E4A0000C */   swc1      $f0, 0xc($a1)

glabel negVec4
/* AC09C 800AB49C C4800000 */  lwc1       $f0, ($a0)
/* AC0A0 800AB4A0 C4820004 */  lwc1       $f2, 4($a0)
/* AC0A4 800AB4A4 46000007 */  neg.s      $f0, $f0
/* AC0A8 800AB4A8 E4800000 */  swc1       $f0, ($a0)
/* AC0AC 800AB4AC C4800008 */  lwc1       $f0, 8($a0)
/* AC0B0 800AB4B0 46001087 */  neg.s      $f2, $f2
/* AC0B4 800AB4B4 E4820004 */  swc1       $f2, 4($a0)
/* AC0B8 800AB4B8 C482000C */  lwc1       $f2, 0xc($a0)
/* AC0BC 800AB4BC 46000007 */  neg.s      $f0, $f0
/* AC0C0 800AB4C0 46001087 */  neg.s      $f2, $f2
/* AC0C4 800AB4C4 E4800008 */  swc1       $f0, 8($a0)
/* AC0C8 800AB4C8 03E00008 */  jr         $ra
/* AC0CC 800AB4CC E482000C */   swc1      $f2, 0xc($a0)

glabel multiVec2
/* AC0D0 800AB4D0 44852000 */  mtc1       $a1, $f4
/* AC0D4 800AB4D4 C4820000 */  lwc1       $f2, ($a0)
/* AC0D8 800AB4D8 46041082 */  mul.s      $f2, $f2, $f4
/* AC0DC 800AB4DC C4800004 */  lwc1       $f0, 4($a0)
/* AC0E0 800AB4E0 46040002 */  mul.s      $f0, $f0, $f4
/* AC0E4 800AB4E4 E4820000 */  swc1       $f2, ($a0)
/* AC0E8 800AB4E8 03E00008 */  jr         $ra
/* AC0EC 800AB4EC E4800004 */   swc1      $f0, 4($a0)

glabel multiVec3
/* AC0F0 800AB4F0 44852000 */  mtc1       $a1, $f4
/* AC0F4 800AB4F4 C4860000 */  lwc1       $f6, ($a0)
/* AC0F8 800AB4F8 46043182 */  mul.s      $f6, $f6, $f4
/* AC0FC 800AB4FC C4820004 */  lwc1       $f2, 4($a0)
/* AC100 800AB500 46041082 */  mul.s      $f2, $f2, $f4
/* AC104 800AB504 C4800008 */  lwc1       $f0, 8($a0)
/* AC108 800AB508 46040002 */  mul.s      $f0, $f0, $f4
/* AC10C 800AB50C E4860000 */  swc1       $f6, ($a0)
/* AC110 800AB510 E4820004 */  swc1       $f2, 4($a0)
/* AC114 800AB514 03E00008 */  jr         $ra
/* AC118 800AB518 E4800008 */   swc1      $f0, 8($a0)

glabel multiVec4
/* AC11C 800AB51C 44852000 */  mtc1       $a1, $f4
/* AC120 800AB520 C4880000 */  lwc1       $f8, ($a0)
/* AC124 800AB524 46044202 */  mul.s      $f8, $f8, $f4
/* AC128 800AB528 C4860004 */  lwc1       $f6, 4($a0)
/* AC12C 800AB52C 46043182 */  mul.s      $f6, $f6, $f4
/* AC130 800AB530 C4820008 */  lwc1       $f2, 8($a0)
/* AC134 800AB534 46041082 */  mul.s      $f2, $f2, $f4
/* AC138 800AB538 C480000C */  lwc1       $f0, 0xc($a0)
/* AC13C 800AB53C 46040002 */  mul.s      $f0, $f0, $f4
/* AC140 800AB540 E4880000 */  swc1       $f8, ($a0)
/* AC144 800AB544 E4860004 */  swc1       $f6, 4($a0)
/* AC148 800AB548 E4820008 */  swc1       $f2, 8($a0)
/* AC14C 800AB54C 03E00008 */  jr         $ra
/* AC150 800AB550 E480000C */   swc1      $f0, 0xc($a0)

glabel setVec2
/* AC154 800AB554 AC850000 */  sw         $a1, ($a0)
/* AC158 800AB558 03E00008 */  jr         $ra
/* AC15C 800AB55C AC860004 */   sw        $a2, 4($a0)

glabel setVec3
/* AC160 800AB560 AC850000 */  sw         $a1, ($a0)
/* AC164 800AB564 AC860004 */  sw         $a2, 4($a0)
/* AC168 800AB568 03E00008 */  jr         $ra
/* AC16C 800AB56C AC870008 */   sw        $a3, 8($a0)

glabel setVec4
/* AC170 800AB570 C7A00010 */  lwc1       $f0, 0x10($sp)
/* AC174 800AB574 AC850000 */  sw         $a1, ($a0)
/* AC178 800AB578 AC860004 */  sw         $a2, 4($a0)
/* AC17C 800AB57C AC870008 */  sw         $a3, 8($a0)
/* AC180 800AB580 03E00008 */  jr         $ra
/* AC184 800AB584 E480000C */   swc1      $f0, 0xc($a0)

glabel three_vec2_proximities
/* AC188 800AB588 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* AC18C 800AB58C AFB20098 */  sw         $s2, 0x98($sp)
/* AC190 800AB590 00809021 */  addu       $s2, $a0, $zero
/* AC194 800AB594 27A40010 */  addiu      $a0, $sp, 0x10
/* AC198 800AB598 AFB10094 */  sw         $s1, 0x94($sp)
/* AC19C 800AB59C 00C08821 */  addu       $s1, $a2, $zero
/* AC1A0 800AB5A0 02403021 */  addu       $a2, $s2, $zero
/* AC1A4 800AB5A4 AFBF009C */  sw         $ra, 0x9c($sp)
/* AC1A8 800AB5A8 0C02AB1D */  jal        Vec2_Sub
/* AC1AC 800AB5AC AFB00090 */   sw        $s0, 0x90($sp)
/* AC1B0 800AB5B0 0C02AB9F */  jal        vec2_normalize
/* AC1B4 800AB5B4 27A40010 */   addiu     $a0, $sp, 0x10
/* AC1B8 800AB5B8 27B00050 */  addiu      $s0, $sp, 0x50
/* AC1BC 800AB5BC 02002021 */  addu       $a0, $s0, $zero
/* AC1C0 800AB5C0 02202821 */  addu       $a1, $s1, $zero
/* AC1C4 800AB5C4 0C02AB1D */  jal        Vec2_Sub
/* AC1C8 800AB5C8 02403021 */   addu      $a2, $s2, $zero
/* AC1CC 800AB5CC 0C02AB9F */  jal        vec2_normalize
/* AC1D0 800AB5D0 02002021 */   addu      $a0, $s0, $zero
/* AC1D4 800AB5D4 C7A20010 */  lwc1       $f2, 0x10($sp)
/* AC1D8 800AB5D8 C7A00050 */  lwc1       $f0, 0x50($sp)
/* AC1DC 800AB5DC 46001081 */  sub.s      $f2, $f2, $f0
/* AC1E0 800AB5E0 46021082 */  mul.s      $f2, $f2, $f2
/* AC1E4 800AB5E4 C7A40054 */  lwc1       $f4, 0x54($sp)
/* AC1E8 800AB5E8 C7A00014 */  lwc1       $f0, 0x14($sp)
/* AC1EC 800AB5EC 46040001 */  sub.s      $f0, $f0, $f4
/* AC1F0 800AB5F0 46000002 */  mul.s      $f0, $f0, $f0
/* AC1F4 800AB5F4 46001080 */  add.s      $f2, $f2, $f0
/* AC1F8 800AB5F8 3C01800E */  lui        $at, %hi(D_800E3674)
/* AC1FC 800AB5FC C4203674 */  lwc1       $f0, %lo(D_800E3674)($at)
/* AC200 800AB600 46020001 */  sub.s      $f0, $f0, $f2
/* AC204 800AB604 3C01800E */  lui        $at, %hi(D_800E3678)
/* AC208 800AB608 C4243678 */  lwc1       $f4, %lo(D_800E3678)($at)
/* AC20C 800AB60C 8FBF009C */  lw         $ra, 0x9c($sp)
/* AC210 800AB610 46040002 */  mul.s      $f0, $f0, $f4
/* AC214 800AB614 8FB20098 */  lw         $s2, 0x98($sp)
/* AC218 800AB618 8FB10094 */  lw         $s1, 0x94($sp)
/* AC21C 800AB61C 8FB00090 */  lw         $s0, 0x90($sp)
/* AC220 800AB620 03E00008 */  jr         $ra
/* AC224 800AB624 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_800AB628
/* AC228 800AB628 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* AC22C 800AB62C AFBF0010 */  sw         $ra, 0x10($sp)
/* AC230 800AB630 0C02AD62 */  jal        three_vec2_proximities
/* AC234 800AB634 00000000 */   nop
/* AC238 800AB638 46000002 */  mul.s      $f0, $f0, $f0
/* AC23C 800AB63C 3C01800E */  lui        $at, %hi(D_800E367C)
/* AC240 800AB640 C422367C */  lwc1       $f2, %lo(D_800E367C)($at)
/* AC244 800AB644 46001301 */  sub.s      $f12, $f2, $f0
/* AC248 800AB648 44800000 */  mtc1       $zero, $f0
/* AC24C 800AB64C 460C003C */  c.lt.s     $f0, $f12
/* AC250 800AB650 00000000 */  nop
/* AC254 800AB654 45020001 */  bc1fl      .L800AB65C
/* AC258 800AB658 46006307 */   neg.s     $f12, $f12
.L800AB65C:
/* AC25C 800AB65C 0C0334B4 */  jal        _sqrtf
/* AC260 800AB660 00000000 */   nop
/* AC264 800AB664 8FBF0010 */  lw         $ra, 0x10($sp)
/* AC268 800AB668 03E00008 */  jr         $ra
/* AC26C 800AB66C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel big_vec2_math_func
/* AC270 800AB670 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* AC274 800AB674 AFB10114 */  sw         $s1, 0x114($sp)
/* AC278 800AB678 00808821 */  addu       $s1, $a0, $zero
/* AC27C 800AB67C 27A40010 */  addiu      $a0, $sp, 0x10
/* AC280 800AB680 AFB00110 */  sw         $s0, 0x110($sp)
/* AC284 800AB684 00C08021 */  addu       $s0, $a2, $zero
/* AC288 800AB688 AFBF011C */  sw         $ra, 0x11c($sp)
/* AC28C 800AB68C AFB20118 */  sw         $s2, 0x118($sp)
/* AC290 800AB690 F7BA0138 */  sdc1       $f26, 0x138($sp)
/* AC294 800AB694 F7B80130 */  sdc1       $f24, 0x130($sp)
/* AC298 800AB698 F7B60128 */  sdc1       $f22, 0x128($sp)
/* AC29C 800AB69C F7B40120 */  sdc1       $f20, 0x120($sp)
/* AC2A0 800AB6A0 0C02AB1D */  jal        Vec2_Sub
/* AC2A4 800AB6A4 02203021 */   addu      $a2, $s1, $zero
/* AC2A8 800AB6A8 0C02AB9F */  jal        vec2_normalize
/* AC2AC 800AB6AC 27A40010 */   addiu     $a0, $sp, 0x10
/* AC2B0 800AB6B0 27B20050 */  addiu      $s2, $sp, 0x50
/* AC2B4 800AB6B4 02402021 */  addu       $a0, $s2, $zero
/* AC2B8 800AB6B8 02002821 */  addu       $a1, $s0, $zero
/* AC2BC 800AB6BC 0C02AB1D */  jal        Vec2_Sub
/* AC2C0 800AB6C0 02203021 */   addu      $a2, $s1, $zero
/* AC2C4 800AB6C4 0C02AB9F */  jal        vec2_normalize
/* AC2C8 800AB6C8 02402021 */   addu      $a0, $s2, $zero
/* AC2CC 800AB6CC 27A40010 */  addiu      $a0, $sp, 0x10
/* AC2D0 800AB6D0 0C02AB5A */  jal        get_vec2_proximity
/* AC2D4 800AB6D4 02402821 */   addu      $a1, $s2, $zero
/* AC2D8 800AB6D8 46000002 */  mul.s      $f0, $f0, $f0
/* AC2DC 800AB6DC 3C01800E */  lui        $at, %hi(D_800E3680)
/* AC2E0 800AB6E0 C4223680 */  lwc1       $f2, %lo(D_800E3680)($at)
/* AC2E4 800AB6E4 46001081 */  sub.s      $f2, $f2, $f0
/* AC2E8 800AB6E8 3C01800E */  lui        $at, %hi(D_800E3684)
/* AC2EC 800AB6EC C4203684 */  lwc1       $f0, %lo(D_800E3684)($at)
/* AC2F0 800AB6F0 46001602 */  mul.s      $f24, $f2, $f0
/* AC2F4 800AB6F4 00000000 */  nop
/* AC2F8 800AB6F8 4618C102 */  mul.s      $f4, $f24, $f24
/* AC2FC 800AB6FC 3C01800E */  lui        $at, %hi(D_800E3688)
/* AC300 800AB700 C4203688 */  lwc1       $f0, %lo(D_800E3688)($at)
/* AC304 800AB704 46040301 */  sub.s      $f12, $f0, $f4
/* AC308 800AB708 44801000 */  mtc1       $zero, $f2
/* AC30C 800AB70C 460C103C */  c.lt.s     $f2, $f12
/* AC310 800AB710 00000000 */  nop
/* AC314 800AB714 45020001 */  bc1fl      .L800AB71C
/* AC318 800AB718 46006307 */   neg.s     $f12, $f12
.L800AB71C:
/* AC31C 800AB71C 0C0334B4 */  jal        _sqrtf
/* AC320 800AB720 00000000 */   nop
/* AC324 800AB724 3C01800E */  lui        $at, %hi(D_800E368C)
/* AC328 800AB728 C434368C */  lwc1       $f20, %lo(D_800E368C)($at)
/* AC32C 800AB72C 27A40010 */  addiu      $a0, $sp, 0x10
/* AC330 800AB730 4405A000 */  mfc1       $a1, $f20
/* AC334 800AB734 0C02AD34 */  jal        multiVec2
/* AC338 800AB738 46000586 */   mov.s     $f22, $f0
/* AC33C 800AB73C 4405A000 */  mfc1       $a1, $f20
/* AC340 800AB740 0C02AD34 */  jal        multiVec2
/* AC344 800AB744 02402021 */   addu      $a0, $s2, $zero
/* AC348 800AB748 27A40010 */  addiu      $a0, $sp, 0x10
/* AC34C 800AB74C 27B10090 */  addiu      $s1, $sp, 0x90
/* AC350 800AB750 0C02AD12 */  jal        copyVec2
/* AC354 800AB754 02202821 */   addu      $a1, $s1, $zero
/* AC358 800AB758 27A40010 */  addiu      $a0, $sp, 0x10
/* AC35C 800AB75C 27B000D0 */  addiu      $s0, $sp, 0xd0
/* AC360 800AB760 0C02AD12 */  jal        copyVec2
/* AC364 800AB764 02002821 */   addu      $a1, $s0, $zero
/* AC368 800AB768 4405B000 */  mfc1       $a1, $f22
/* AC36C 800AB76C 4406C000 */  mfc1       $a2, $f24
/* AC370 800AB770 0C02ACE0 */  jal        some_vec2Math
/* AC374 800AB774 02202021 */   addu      $a0, $s1, $zero
/* AC378 800AB778 4600B687 */  neg.s      $f26, $f22
/* AC37C 800AB77C 4405D000 */  mfc1       $a1, $f26
/* AC380 800AB780 4406C000 */  mfc1       $a2, $f24
/* AC384 800AB784 0C02ACE0 */  jal        some_vec2Math
/* AC388 800AB788 02002021 */   addu      $a0, $s0, $zero
/* AC38C 800AB78C 02202021 */  addu       $a0, $s1, $zero
/* AC390 800AB790 0C02AB5A */  jal        get_vec2_proximity
/* AC394 800AB794 02402821 */   addu      $a1, $s2, $zero
/* AC398 800AB798 02002021 */  addu       $a0, $s0, $zero
/* AC39C 800AB79C 02402821 */  addu       $a1, $s2, $zero
/* AC3A0 800AB7A0 0C02AB5A */  jal        get_vec2_proximity
/* AC3A4 800AB7A4 46000506 */   mov.s     $f20, $f0
/* AC3A8 800AB7A8 4600A03C */  c.lt.s     $f20, $f0
/* AC3AC 800AB7AC 00000000 */  nop
/* AC3B0 800AB7B0 45010002 */  bc1t       .L800AB7BC
/* AC3B4 800AB7B4 4600B006 */   mov.s     $f0, $f22
/* AC3B8 800AB7B8 4600D006 */  mov.s      $f0, $f26
.L800AB7BC:
/* AC3BC 800AB7BC 8FBF011C */  lw         $ra, 0x11c($sp)
/* AC3C0 800AB7C0 8FB20118 */  lw         $s2, 0x118($sp)
/* AC3C4 800AB7C4 8FB10114 */  lw         $s1, 0x114($sp)
/* AC3C8 800AB7C8 8FB00110 */  lw         $s0, 0x110($sp)
/* AC3CC 800AB7CC D7BA0138 */  ldc1       $f26, 0x138($sp)
/* AC3D0 800AB7D0 D7B80130 */  ldc1       $f24, 0x130($sp)
/* AC3D4 800AB7D4 D7B60128 */  ldc1       $f22, 0x128($sp)
/* AC3D8 800AB7D8 D7B40120 */  ldc1       $f20, 0x120($sp)
/* AC3DC 800AB7DC 03E00008 */  jr         $ra
/* AC3E0 800AB7E0 27BD0140 */   addiu     $sp, $sp, 0x140

glabel func_800AB7E4
/* AC3E4 800AB7E4 C48A0000 */  lwc1       $f10, ($a0)
/* AC3E8 800AB7E8 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* AC3EC 800AB7EC F7B60008 */  sdc1       $f22, 8($sp)
/* AC3F0 800AB7F0 F7B40000 */  sdc1       $f20, ($sp)
/* AC3F4 800AB7F4 C4B40004 */  lwc1       $f20, 4($a1)
/* AC3F8 800AB7F8 46145002 */  mul.s      $f0, $f10, $f20
/* AC3FC 800AB7FC C4860004 */  lwc1       $f6, 4($a0)
/* AC400 800AB800 C4B20008 */  lwc1       $f18, 8($a1)
/* AC404 800AB804 46123202 */  mul.s      $f8, $f6, $f18
/* AC408 800AB808 C4820008 */  lwc1       $f2, 8($a0)
/* AC40C 800AB80C C4AC0000 */  lwc1       $f12, ($a1)
/* AC410 800AB810 460C1102 */  mul.s      $f4, $f2, $f12
/* AC414 800AB814 00000000 */  nop
/* AC418 800AB818 46141082 */  mul.s      $f2, $f2, $f20
/* AC41C 800AB81C 00000000 */  nop
/* AC420 800AB820 460C3182 */  mul.s      $f6, $f6, $f12
/* AC424 800AB824 00000000 */  nop
/* AC428 800AB828 46125282 */  mul.s      $f10, $f10, $f18
/* AC42C 800AB82C C4D60008 */  lwc1       $f22, 8($a2)
/* AC430 800AB830 46160002 */  mul.s      $f0, $f0, $f22
/* AC434 800AB834 C4D00000 */  lwc1       $f16, ($a2)
/* AC438 800AB838 46104202 */  mul.s      $f8, $f8, $f16
/* AC43C 800AB83C C4CE0004 */  lwc1       $f14, 4($a2)
/* AC440 800AB840 460E2102 */  mul.s      $f4, $f4, $f14
/* AC444 800AB844 00000000 */  nop
/* AC448 800AB848 46101082 */  mul.s      $f2, $f2, $f16
/* AC44C 800AB84C 00000000 */  nop
/* AC450 800AB850 46163182 */  mul.s      $f6, $f6, $f22
/* AC454 800AB854 00000000 */  nop
/* AC458 800AB858 460E5282 */  mul.s      $f10, $f10, $f14
/* AC45C 800AB85C 46080000 */  add.s      $f0, $f0, $f8
/* AC460 800AB860 46040000 */  add.s      $f0, $f0, $f4
/* AC464 800AB864 46020001 */  sub.s      $f0, $f0, $f2
/* AC468 800AB868 46060001 */  sub.s      $f0, $f0, $f6
/* AC46C 800AB86C D7B40000 */  ldc1       $f20, ($sp)
/* AC470 800AB870 460A0001 */  sub.s      $f0, $f0, $f10
/* AC474 800AB874 D7B60008 */  ldc1       $f22, 8($sp)
/* AC478 800AB878 03E00008 */  jr         $ra
/* AC47C 800AB87C 27BD0010 */   addiu     $sp, $sp, 0x10

glabel func_800AB880
/* AC480 800AB880 C4880000 */  lwc1       $f8, ($a0)
/* AC484 800AB884 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* AC488 800AB888 46084102 */  mul.s      $f4, $f8, $f8
/* AC48C 800AB88C F7B60008 */  sdc1       $f22, 8($sp)
/* AC490 800AB890 F7B40000 */  sdc1       $f20, ($sp)
/* AC494 800AB894 C4820004 */  lwc1       $f2, 4($a0)
/* AC498 800AB898 46021082 */  mul.s      $f2, $f2, $f2
/* AC49C 800AB89C C4800008 */  lwc1       $f0, 8($a0)
/* AC4A0 800AB8A0 46000002 */  mul.s      $f0, $f0, $f0
/* AC4A4 800AB8A4 46022100 */  add.s      $f4, $f4, $f2
/* AC4A8 800AB8A8 46002380 */  add.s      $f14, $f4, $f0
/* AC4AC 800AB8AC C4860010 */  lwc1       $f6, 0x10($a0)
/* AC4B0 800AB8B0 46063182 */  mul.s      $f6, $f6, $f6
/* AC4B4 800AB8B4 3C01800E */  lui        $at, %hi(D_800E3690)
/* AC4B8 800AB8B8 D42A3690 */  ldc1       $f10, %lo(D_800E3690)($at)
/* AC4BC 800AB8BC 46007021 */  cvt.d.s    $f0, $f14
/* AC4C0 800AB8C0 46205003 */  div.d      $f0, $f10, $f0
/* AC4C4 800AB8C4 462003A0 */  cvt.s.d    $f14, $f0
/* AC4C8 800AB8C8 460E4202 */  mul.s      $f8, $f8, $f14
/* AC4CC 800AB8CC C48C0024 */  lwc1       $f12, 0x24($a0)
/* AC4D0 800AB8D0 C4820014 */  lwc1       $f2, 0x14($a0)
/* AC4D4 800AB8D4 C4920028 */  lwc1       $f18, 0x28($a0)
/* AC4D8 800AB8D8 46021082 */  mul.s      $f2, $f2, $f2
/* AC4DC 800AB8DC C4840020 */  lwc1       $f4, 0x20($a0)
/* AC4E0 800AB8E0 C4800018 */  lwc1       $f0, 0x18($a0)
/* AC4E4 800AB8E4 E4A80000 */  swc1       $f8, ($a1)
/* AC4E8 800AB8E8 C4960004 */  lwc1       $f22, 4($a0)
/* AC4EC 800AB8EC 460EB582 */  mul.s      $f22, $f22, $f14
/* AC4F0 800AB8F0 00000000 */  nop
/* AC4F4 800AB8F4 46000002 */  mul.s      $f0, $f0, $f0
/* AC4F8 800AB8F8 E4B60010 */  swc1       $f22, 0x10($a1)
/* AC4FC 800AB8FC C4940008 */  lwc1       $f20, 8($a0)
/* AC500 800AB900 460EA502 */  mul.s      $f20, $f20, $f14
/* AC504 800AB904 46023180 */  add.s      $f6, $f6, $f2
/* AC508 800AB908 46003000 */  add.s      $f0, $f6, $f0
/* AC50C 800AB90C 460C6302 */  mul.s      $f12, $f12, $f12
/* AC510 800AB910 46000021 */  cvt.d.s    $f0, $f0
/* AC514 800AB914 46205003 */  div.d      $f0, $f10, $f0
/* AC518 800AB918 E4B40020 */  swc1       $f20, 0x20($a1)
/* AC51C 800AB91C C4860010 */  lwc1       $f6, 0x10($a0)
/* AC520 800AB920 46200020 */  cvt.s.d    $f0, $f0
/* AC524 800AB924 46003182 */  mul.s      $f6, $f6, $f0
/* AC528 800AB928 00000000 */  nop
/* AC52C 800AB92C 46129482 */  mul.s      $f18, $f18, $f18
/* AC530 800AB930 E4A60004 */  swc1       $f6, 4($a1)
/* AC534 800AB934 C4900014 */  lwc1       $f16, 0x14($a0)
/* AC538 800AB938 46008402 */  mul.s      $f16, $f16, $f0
/* AC53C 800AB93C 00000000 */  nop
/* AC540 800AB940 46042102 */  mul.s      $f4, $f4, $f4
/* AC544 800AB944 E4B00014 */  swc1       $f16, 0x14($a1)
/* AC548 800AB948 C48E0018 */  lwc1       $f14, 0x18($a0)
/* AC54C 800AB94C 46007382 */  mul.s      $f14, $f14, $f0
/* AC550 800AB950 460C2100 */  add.s      $f4, $f4, $f12
/* AC554 800AB954 46122000 */  add.s      $f0, $f4, $f18
/* AC558 800AB958 46000021 */  cvt.d.s    $f0, $f0
/* AC55C 800AB95C 46205283 */  div.d      $f10, $f10, $f0
/* AC560 800AB960 E4AE0024 */  swc1       $f14, 0x24($a1)
/* AC564 800AB964 C4840020 */  lwc1       $f4, 0x20($a0)
/* AC568 800AB968 46205020 */  cvt.s.d    $f0, $f10
/* AC56C 800AB96C 46002102 */  mul.s      $f4, $f4, $f0
/* AC570 800AB970 E4A40008 */  swc1       $f4, 8($a1)
/* AC574 800AB974 C48A0024 */  lwc1       $f10, 0x24($a0)
/* AC578 800AB978 46005282 */  mul.s      $f10, $f10, $f0
/* AC57C 800AB97C E4AA0018 */  swc1       $f10, 0x18($a1)
/* AC580 800AB980 C48C0028 */  lwc1       $f12, 0x28($a0)
/* AC584 800AB984 46006302 */  mul.s      $f12, $f12, $f0
/* AC588 800AB988 E4AC0028 */  swc1       $f12, 0x28($a1)
/* AC58C 800AB98C C4820030 */  lwc1       $f2, 0x30($a0)
/* AC590 800AB990 46004207 */  neg.s      $f8, $f8
/* AC594 800AB994 46024202 */  mul.s      $f8, $f8, $f2
/* AC598 800AB998 C4800034 */  lwc1       $f0, 0x34($a0)
/* AC59C 800AB99C 4600B582 */  mul.s      $f22, $f22, $f0
/* AC5A0 800AB9A0 C4820038 */  lwc1       $f2, 0x38($a0)
/* AC5A4 800AB9A4 4602A502 */  mul.s      $f20, $f20, $f2
/* AC5A8 800AB9A8 46164201 */  sub.s      $f8, $f8, $f22
/* AC5AC 800AB9AC 46144201 */  sub.s      $f8, $f8, $f20
/* AC5B0 800AB9B0 E4A80030 */  swc1       $f8, 0x30($a1)
/* AC5B4 800AB9B4 C4820030 */  lwc1       $f2, 0x30($a0)
/* AC5B8 800AB9B8 46003187 */  neg.s      $f6, $f6
/* AC5BC 800AB9BC 46023182 */  mul.s      $f6, $f6, $f2
/* AC5C0 800AB9C0 C4800034 */  lwc1       $f0, 0x34($a0)
/* AC5C4 800AB9C4 46008402 */  mul.s      $f16, $f16, $f0
/* AC5C8 800AB9C8 C4820038 */  lwc1       $f2, 0x38($a0)
/* AC5CC 800AB9CC 46027382 */  mul.s      $f14, $f14, $f2
/* AC5D0 800AB9D0 46103181 */  sub.s      $f6, $f6, $f16
/* AC5D4 800AB9D4 460E3181 */  sub.s      $f6, $f6, $f14
/* AC5D8 800AB9D8 E4A60034 */  swc1       $f6, 0x34($a1)
/* AC5DC 800AB9DC C4820030 */  lwc1       $f2, 0x30($a0)
/* AC5E0 800AB9E0 46002107 */  neg.s      $f4, $f4
/* AC5E4 800AB9E4 46022102 */  mul.s      $f4, $f4, $f2
/* AC5E8 800AB9E8 C4800034 */  lwc1       $f0, 0x34($a0)
/* AC5EC 800AB9EC 46005282 */  mul.s      $f10, $f10, $f0
/* AC5F0 800AB9F0 C4820038 */  lwc1       $f2, 0x38($a0)
/* AC5F4 800AB9F4 46026302 */  mul.s      $f12, $f12, $f2
/* AC5F8 800AB9F8 D7B60008 */  ldc1       $f22, 8($sp)
/* AC5FC 800AB9FC D7B40000 */  ldc1       $f20, ($sp)
/* AC600 800ABA00 3C01800E */  lui        $at, %hi(D_800E3698)
/* AC604 800ABA04 C4203698 */  lwc1       $f0, %lo(D_800E3698)($at)
/* AC608 800ABA08 460A2101 */  sub.s      $f4, $f4, $f10
/* AC60C 800ABA0C ACA0000C */  sw         $zero, 0xc($a1)
/* AC610 800ABA10 ACA0001C */  sw         $zero, 0x1c($a1)
/* AC614 800ABA14 460C2101 */  sub.s      $f4, $f4, $f12
/* AC618 800ABA18 ACA0002C */  sw         $zero, 0x2c($a1)
/* AC61C 800ABA1C E4A0003C */  swc1       $f0, 0x3c($a1)
/* AC620 800ABA20 E4A40038 */  swc1       $f4, 0x38($a1)
/* AC624 800ABA24 03E00008 */  jr         $ra
/* AC628 800ABA28 27BD0010 */   addiu     $sp, $sp, 0x10

glabel ofunc_sub_800aba2c
/* AC62C 800ABA2C 24030001 */  addiu      $v1, $zero, 1
/* AC630 800ABA30 10A30025 */  beq        $a1, $v1, .L800ABAC8
/* AC634 800ABA34 28A20002 */   slti      $v0, $a1, 2
/* AC638 800ABA38 10400047 */  beqz       $v0, .L800ABB58
/* AC63C 800ABA3C 24020001 */   addiu     $v0, $zero, 1
/* AC640 800ABA40 14A00045 */  bnez       $a1, .L800ABB58
/* AC644 800ABA44 00000000 */   nop
/* AC648 800ABA48 10C30013 */  beq        $a2, $v1, .L800ABA98
/* AC64C 800ABA4C 28C20002 */   slti      $v0, $a2, 2
/* AC650 800ABA50 10400005 */  beqz       $v0, .L800ABA68
/* AC654 800ABA54 24020002 */   addiu     $v0, $zero, 2
/* AC658 800ABA58 10C00007 */  beqz       $a2, .L800ABA78
/* AC65C 800ABA5C 24020001 */   addiu     $v0, $zero, 1
/* AC660 800ABA60 0802AEB3 */  j          .L800ABACC
/* AC664 800ABA64 00000000 */   nop
.L800ABA68:
/* AC668 800ABA68 10C20011 */  beq        $a2, $v0, .L800ABAB0
/* AC66C 800ABA6C 24020001 */   addiu     $v0, $zero, 1
/* AC670 800ABA70 0802AEB3 */  j          .L800ABACC
/* AC674 800ABA74 00000000 */   nop
.L800ABA78:
/* AC678 800ABA78 C4840010 */  lwc1       $f4, 0x10($a0)
/* AC67C 800ABA7C C4800020 */  lwc1       $f0, 0x20($a0)
/* AC680 800ABA80 46002102 */  mul.s      $f4, $f4, $f0
/* AC684 800ABA84 C482001C */  lwc1       $f2, 0x1c($a0)
/* AC688 800ABA88 C4800014 */  lwc1       $f0, 0x14($a0)
.L800ABA8C:
/* AC68C 800ABA8C 46020002 */  mul.s      $f0, $f0, $f2
/* AC690 800ABA90 03E00008 */  jr         $ra
/* AC694 800ABA94 46002001 */   sub.s     $f0, $f4, $f0
.L800ABA98:
/* AC698 800ABA98 C4840014 */  lwc1       $f4, 0x14($a0)
/* AC69C 800ABA9C C4800018 */  lwc1       $f0, 0x18($a0)
/* AC6A0 800ABAA0 46002102 */  mul.s      $f4, $f4, $f0
/* AC6A4 800ABAA4 C4820020 */  lwc1       $f2, 0x20($a0)
/* AC6A8 800ABAA8 0802AEA3 */  j          .L800ABA8C
/* AC6AC 800ABAAC C480000C */   lwc1      $f0, 0xc($a0)
.L800ABAB0:
/* AC6B0 800ABAB0 C484000C */  lwc1       $f4, 0xc($a0)
/* AC6B4 800ABAB4 C480001C */  lwc1       $f0, 0x1c($a0)
/* AC6B8 800ABAB8 46002102 */  mul.s      $f4, $f4, $f0
/* AC6BC 800ABABC C4820018 */  lwc1       $f2, 0x18($a0)
/* AC6C0 800ABAC0 0802AEA3 */  j          .L800ABA8C
/* AC6C4 800ABAC4 C4800010 */   lwc1      $f0, 0x10($a0)
.L800ABAC8:
/* AC6C8 800ABAC8 24020001 */  addiu      $v0, $zero, 1
.L800ABACC:
/* AC6CC 800ABACC 10C20014 */  beq        $a2, $v0, .L800ABB20
/* AC6D0 800ABAD0 28C20002 */   slti      $v0, $a2, 2
/* AC6D4 800ABAD4 10400005 */  beqz       $v0, .L800ABAEC
/* AC6D8 800ABAD8 24020002 */   addiu     $v0, $zero, 2
/* AC6DC 800ABADC 10C00007 */  beqz       $a2, .L800ABAFC
/* AC6E0 800ABAE0 24020001 */   addiu     $v0, $zero, 1
/* AC6E4 800ABAE4 0802AED6 */  j          .L800ABB58
/* AC6E8 800ABAE8 00000000 */   nop
.L800ABAEC:
/* AC6EC 800ABAEC 10C20013 */  beq        $a2, $v0, .L800ABB3C
/* AC6F0 800ABAF0 24020001 */   addiu     $v0, $zero, 1
/* AC6F4 800ABAF4 0802AED6 */  j          .L800ABB58
/* AC6F8 800ABAF8 00000000 */   nop
.L800ABAFC:
/* AC6FC 800ABAFC C4840004 */  lwc1       $f4, 4($a0)
/* AC700 800ABB00 C4800020 */  lwc1       $f0, 0x20($a0)
/* AC704 800ABB04 46002107 */  neg.s      $f4, $f4
/* AC708 800ABB08 46002102 */  mul.s      $f4, $f4, $f0
/* AC70C 800ABB0C C482001C */  lwc1       $f2, 0x1c($a0)
/* AC710 800ABB10 C4800008 */  lwc1       $f0, 8($a0)
.L800ABB14:
/* AC714 800ABB14 46020002 */  mul.s      $f0, $f0, $f2
/* AC718 800ABB18 03E00008 */  jr         $ra
/* AC71C 800ABB1C 46002000 */   add.s     $f0, $f4, $f0
.L800ABB20:
/* AC720 800ABB20 C4840008 */  lwc1       $f4, 8($a0)
/* AC724 800ABB24 C4800018 */  lwc1       $f0, 0x18($a0)
/* AC728 800ABB28 46002107 */  neg.s      $f4, $f4
/* AC72C 800ABB2C 46002102 */  mul.s      $f4, $f4, $f0
/* AC730 800ABB30 C4820020 */  lwc1       $f2, 0x20($a0)
/* AC734 800ABB34 0802AEC5 */  j          .L800ABB14
/* AC738 800ABB38 C4800000 */   lwc1      $f0, ($a0)
.L800ABB3C:
/* AC73C 800ABB3C C4840000 */  lwc1       $f4, ($a0)
/* AC740 800ABB40 C480001C */  lwc1       $f0, 0x1c($a0)
/* AC744 800ABB44 46002107 */  neg.s      $f4, $f4
/* AC748 800ABB48 46002102 */  mul.s      $f4, $f4, $f0
/* AC74C 800ABB4C C4820018 */  lwc1       $f2, 0x18($a0)
/* AC750 800ABB50 0802AEC5 */  j          .L800ABB14
/* AC754 800ABB54 C4800004 */   lwc1      $f0, 4($a0)
.L800ABB58:
/* AC758 800ABB58 10C2000B */  beq        $a2, $v0, .L800ABB88
/* AC75C 800ABB5C 28C20002 */   slti      $v0, $a2, 2
/* AC760 800ABB60 5040000F */  beql       $v0, $zero, .L800ABBA0
/* AC764 800ABB64 C4840000 */   lwc1      $f4, ($a0)
/* AC768 800ABB68 54C0000D */  bnel       $a2, $zero, .L800ABBA0
/* AC76C 800ABB6C C4840000 */   lwc1      $f4, ($a0)
/* AC770 800ABB70 C4840004 */  lwc1       $f4, 4($a0)
/* AC774 800ABB74 C4800014 */  lwc1       $f0, 0x14($a0)
/* AC778 800ABB78 46002102 */  mul.s      $f4, $f4, $f0
/* AC77C 800ABB7C C4820010 */  lwc1       $f2, 0x10($a0)
/* AC780 800ABB80 0802AEA3 */  j          .L800ABA8C
/* AC784 800ABB84 C4800008 */   lwc1      $f0, 8($a0)
.L800ABB88:
/* AC788 800ABB88 C4840008 */  lwc1       $f4, 8($a0)
/* AC78C 800ABB8C C480000C */  lwc1       $f0, 0xc($a0)
/* AC790 800ABB90 46002102 */  mul.s      $f4, $f4, $f0
/* AC794 800ABB94 C4820014 */  lwc1       $f2, 0x14($a0)
/* AC798 800ABB98 0802AEA3 */  j          .L800ABA8C
/* AC79C 800ABB9C C4800000 */   lwc1      $f0, ($a0)
.L800ABBA0:
/* AC7A0 800ABBA0 C4800010 */  lwc1       $f0, 0x10($a0)
/* AC7A4 800ABBA4 46002102 */  mul.s      $f4, $f4, $f0
/* AC7A8 800ABBA8 C482000C */  lwc1       $f2, 0xc($a0)
/* AC7AC 800ABBAC C4800004 */  lwc1       $f0, 4($a0)
/* AC7B0 800ABBB0 46020002 */  mul.s      $f0, $f0, $f2
/* AC7B4 800ABBB4 03E00008 */  jr         $ra
/* AC7B8 800ABBB8 46002001 */   sub.s     $f0, $f4, $f0

glabel ofunc_sub_800abbbc
/* AC7BC 800ABBBC C48A0000 */  lwc1       $f10, ($a0)
/* AC7C0 800ABBC0 C4920010 */  lwc1       $f18, 0x10($a0)
/* AC7C4 800ABBC4 46125002 */  mul.s      $f0, $f10, $f18
/* AC7C8 800ABBC8 C4880014 */  lwc1       $f8, 0x14($a0)
/* AC7CC 800ABBCC 46085282 */  mul.s      $f10, $f10, $f8
/* AC7D0 800ABBD0 C4860004 */  lwc1       $f6, 4($a0)
/* AC7D4 800ABBD4 46083202 */  mul.s      $f8, $f6, $f8
/* AC7D8 800ABBD8 C484000C */  lwc1       $f4, 0xc($a0)
/* AC7DC 800ABBDC 46043182 */  mul.s      $f6, $f6, $f4
/* AC7E0 800ABBE0 C4820008 */  lwc1       $f2, 8($a0)
/* AC7E4 800ABBE4 46041102 */  mul.s      $f4, $f2, $f4
/* AC7E8 800ABBE8 00000000 */  nop
/* AC7EC 800ABBEC 46121082 */  mul.s      $f2, $f2, $f18
/* AC7F0 800ABBF0 C48E0020 */  lwc1       $f14, 0x20($a0)
/* AC7F4 800ABBF4 460E0002 */  mul.s      $f0, $f0, $f14
/* AC7F8 800ABBF8 C490001C */  lwc1       $f16, 0x1c($a0)
/* AC7FC 800ABBFC 46105282 */  mul.s      $f10, $f10, $f16
/* AC800 800ABC00 C48C0018 */  lwc1       $f12, 0x18($a0)
/* AC804 800ABC04 460C4202 */  mul.s      $f8, $f8, $f12
/* AC808 800ABC08 00000000 */  nop
/* AC80C 800ABC0C 460E3182 */  mul.s      $f6, $f6, $f14
/* AC810 800ABC10 00000000 */  nop
/* AC814 800ABC14 46102102 */  mul.s      $f4, $f4, $f16
/* AC818 800ABC18 00000000 */  nop
/* AC81C 800ABC1C 460C1082 */  mul.s      $f2, $f2, $f12
/* AC820 800ABC20 460A0001 */  sub.s      $f0, $f0, $f10
/* AC824 800ABC24 46080000 */  add.s      $f0, $f0, $f8
/* AC828 800ABC28 46060001 */  sub.s      $f0, $f0, $f6
/* AC82C 800ABC2C 46040000 */  add.s      $f0, $f0, $f4
/* AC830 800ABC30 03E00008 */  jr         $ra
/* AC834 800ABC34 46020001 */   sub.s     $f0, $f0, $f2

glabel func_800ABC38
/* AC838 800ABC38 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* AC83C 800ABC3C AFB00010 */  sw         $s0, 0x10($sp)
/* AC840 800ABC40 00808021 */  addu       $s0, $a0, $zero
/* AC844 800ABC44 AFB10014 */  sw         $s1, 0x14($sp)
/* AC848 800ABC48 AFBF0018 */  sw         $ra, 0x18($sp)
/* AC84C 800ABC4C F7B40020 */  sdc1       $f20, 0x20($sp)
/* AC850 800ABC50 0C02AEEF */  jal        ofunc_sub_800abbbc
/* AC854 800ABC54 00A08821 */   addu      $s1, $a1, $zero
/* AC858 800ABC58 46000106 */  mov.s      $f4, $f0
/* AC85C 800ABC5C 44800000 */  mtc1       $zero, $f0
/* AC860 800ABC60 4600203C */  c.lt.s     $f4, $f0
/* AC864 800ABC64 00000000 */  nop
/* AC868 800ABC68 45000002 */  bc1f       .L800ABC74
/* AC86C 800ABC6C 46002186 */   mov.s     $f6, $f4
/* AC870 800ABC70 46002187 */  neg.s      $f6, $f4
.L800ABC74:
/* AC874 800ABC74 3C01800E */  lui        $at, %hi(D_800E36A0)
/* AC878 800ABC78 D42236A0 */  ldc1       $f2, %lo(D_800E36A0)($at)
/* AC87C 800ABC7C 46003021 */  cvt.d.s    $f0, $f6
/* AC880 800ABC80 4622003C */  c.lt.d     $f0, $f2
/* AC884 800ABC84 00000000 */  nop
/* AC888 800ABC88 4501003D */  bc1t       .L800ABD80
/* AC88C 800ABC8C 8FBF0018 */   lw        $ra, 0x18($sp)
/* AC890 800ABC90 02002021 */  addu       $a0, $s0, $zero
/* AC894 800ABC94 00002821 */  addu       $a1, $zero, $zero
/* AC898 800ABC98 00003021 */  addu       $a2, $zero, $zero
/* AC89C 800ABC9C 3C01800E */  lui        $at, %hi(D_800E36A8)
/* AC8A0 800ABCA0 D43436A8 */  ldc1       $f20, %lo(D_800E36A8)($at)
/* AC8A4 800ABCA4 46002021 */  cvt.d.s    $f0, $f4
/* AC8A8 800ABCA8 4620A503 */  div.d      $f20, $f20, $f0
/* AC8AC 800ABCAC 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC8B0 800ABCB0 4620A520 */   cvt.s.d   $f20, $f20
/* AC8B4 800ABCB4 46140002 */  mul.s      $f0, $f0, $f20
/* AC8B8 800ABCB8 02002021 */  addu       $a0, $s0, $zero
/* AC8BC 800ABCBC 24050001 */  addiu      $a1, $zero, 1
/* AC8C0 800ABCC0 00003021 */  addu       $a2, $zero, $zero
/* AC8C4 800ABCC4 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC8C8 800ABCC8 E6200000 */   swc1      $f0, ($s1)
/* AC8CC 800ABCCC 46140002 */  mul.s      $f0, $f0, $f20
/* AC8D0 800ABCD0 02002021 */  addu       $a0, $s0, $zero
/* AC8D4 800ABCD4 24050002 */  addiu      $a1, $zero, 2
/* AC8D8 800ABCD8 00003021 */  addu       $a2, $zero, $zero
/* AC8DC 800ABCDC 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC8E0 800ABCE0 E6200004 */   swc1      $f0, 4($s1)
/* AC8E4 800ABCE4 46140002 */  mul.s      $f0, $f0, $f20
/* AC8E8 800ABCE8 02002021 */  addu       $a0, $s0, $zero
/* AC8EC 800ABCEC 00002821 */  addu       $a1, $zero, $zero
/* AC8F0 800ABCF0 24060001 */  addiu      $a2, $zero, 1
/* AC8F4 800ABCF4 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC8F8 800ABCF8 E6200008 */   swc1      $f0, 8($s1)
/* AC8FC 800ABCFC 46140002 */  mul.s      $f0, $f0, $f20
/* AC900 800ABD00 02002021 */  addu       $a0, $s0, $zero
/* AC904 800ABD04 24050001 */  addiu      $a1, $zero, 1
/* AC908 800ABD08 24060001 */  addiu      $a2, $zero, 1
/* AC90C 800ABD0C 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC910 800ABD10 E620000C */   swc1      $f0, 0xc($s1)
/* AC914 800ABD14 46140002 */  mul.s      $f0, $f0, $f20
/* AC918 800ABD18 02002021 */  addu       $a0, $s0, $zero
/* AC91C 800ABD1C 24050002 */  addiu      $a1, $zero, 2
/* AC920 800ABD20 24060001 */  addiu      $a2, $zero, 1
/* AC924 800ABD24 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC928 800ABD28 E6200010 */   swc1      $f0, 0x10($s1)
/* AC92C 800ABD2C 46140002 */  mul.s      $f0, $f0, $f20
/* AC930 800ABD30 02002021 */  addu       $a0, $s0, $zero
/* AC934 800ABD34 00002821 */  addu       $a1, $zero, $zero
/* AC938 800ABD38 24060002 */  addiu      $a2, $zero, 2
/* AC93C 800ABD3C 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC940 800ABD40 E6200014 */   swc1      $f0, 0x14($s1)
/* AC944 800ABD44 46140002 */  mul.s      $f0, $f0, $f20
/* AC948 800ABD48 02002021 */  addu       $a0, $s0, $zero
/* AC94C 800ABD4C 24050001 */  addiu      $a1, $zero, 1
/* AC950 800ABD50 24060002 */  addiu      $a2, $zero, 2
/* AC954 800ABD54 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC958 800ABD58 E6200018 */   swc1      $f0, 0x18($s1)
/* AC95C 800ABD5C 46140002 */  mul.s      $f0, $f0, $f20
/* AC960 800ABD60 02002021 */  addu       $a0, $s0, $zero
/* AC964 800ABD64 24050002 */  addiu      $a1, $zero, 2
/* AC968 800ABD68 24060002 */  addiu      $a2, $zero, 2
/* AC96C 800ABD6C 0C02AE8B */  jal        ofunc_sub_800aba2c
/* AC970 800ABD70 E620001C */   swc1      $f0, 0x1c($s1)
/* AC974 800ABD74 46140002 */  mul.s      $f0, $f0, $f20
/* AC978 800ABD78 E6200020 */  swc1       $f0, 0x20($s1)
/* AC97C 800ABD7C 8FBF0018 */  lw         $ra, 0x18($sp)
.L800ABD80:
/* AC980 800ABD80 8FB10014 */  lw         $s1, 0x14($sp)
/* AC984 800ABD84 8FB00010 */  lw         $s0, 0x10($sp)
/* AC988 800ABD88 D7B40020 */  ldc1       $f20, 0x20($sp)
/* AC98C 800ABD8C 03E00008 */  jr         $ra
/* AC990 800ABD90 27BD0028 */   addiu     $sp, $sp, 0x28

glabel ofunc_sub_800abd94
/* AC994 800ABD94 C4A20000 */  lwc1       $f2, ($a1)
/* AC998 800ABD98 C4C00000 */  lwc1       $f0, ($a2)
/* AC99C 800ABD9C 46001082 */  mul.s      $f2, $f2, $f0
/* AC9A0 800ABDA0 C4A60010 */  lwc1       $f6, 0x10($a1)
/* AC9A4 800ABDA4 C4C00004 */  lwc1       $f0, 4($a2)
/* AC9A8 800ABDA8 46003182 */  mul.s      $f6, $f6, $f0
/* AC9AC 800ABDAC C4A40020 */  lwc1       $f4, 0x20($a1)
/* AC9B0 800ABDB0 C4C00008 */  lwc1       $f0, 8($a2)
/* AC9B4 800ABDB4 46002102 */  mul.s      $f4, $f4, $f0
/* AC9B8 800ABDB8 46061080 */  add.s      $f2, $f2, $f6
/* AC9BC 800ABDBC 46041080 */  add.s      $f2, $f2, $f4
/* AC9C0 800ABDC0 E4820000 */  swc1       $f2, ($a0)
/* AC9C4 800ABDC4 C4A00000 */  lwc1       $f0, ($a1)
/* AC9C8 800ABDC8 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AC9CC 800ABDCC 46020002 */  mul.s      $f0, $f0, $f2
/* AC9D0 800ABDD0 C4A60010 */  lwc1       $f6, 0x10($a1)
/* AC9D4 800ABDD4 C4C20014 */  lwc1       $f2, 0x14($a2)
/* AC9D8 800ABDD8 46023182 */  mul.s      $f6, $f6, $f2
/* AC9DC 800ABDDC C4A40020 */  lwc1       $f4, 0x20($a1)
/* AC9E0 800ABDE0 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AC9E4 800ABDE4 46022102 */  mul.s      $f4, $f4, $f2
/* AC9E8 800ABDE8 46060000 */  add.s      $f0, $f0, $f6
/* AC9EC 800ABDEC 46040000 */  add.s      $f0, $f0, $f4
/* AC9F0 800ABDF0 E4800010 */  swc1       $f0, 0x10($a0)
/* AC9F4 800ABDF4 C4A20000 */  lwc1       $f2, ($a1)
/* AC9F8 800ABDF8 C4C00020 */  lwc1       $f0, 0x20($a2)
/* AC9FC 800ABDFC 46001082 */  mul.s      $f2, $f2, $f0
/* ACA00 800ABE00 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACA04 800ABE04 C4C00024 */  lwc1       $f0, 0x24($a2)
/* ACA08 800ABE08 46003182 */  mul.s      $f6, $f6, $f0
/* ACA0C 800ABE0C C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACA10 800ABE10 C4C00028 */  lwc1       $f0, 0x28($a2)
/* ACA14 800ABE14 46002102 */  mul.s      $f4, $f4, $f0
/* ACA18 800ABE18 46061080 */  add.s      $f2, $f2, $f6
/* ACA1C 800ABE1C 46041080 */  add.s      $f2, $f2, $f4
/* ACA20 800ABE20 E4820020 */  swc1       $f2, 0x20($a0)
/* ACA24 800ABE24 C4A00000 */  lwc1       $f0, ($a1)
/* ACA28 800ABE28 C4C20030 */  lwc1       $f2, 0x30($a2)
/* ACA2C 800ABE2C 46020002 */  mul.s      $f0, $f0, $f2
/* ACA30 800ABE30 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACA34 800ABE34 C4C20034 */  lwc1       $f2, 0x34($a2)
/* ACA38 800ABE38 46023182 */  mul.s      $f6, $f6, $f2
/* ACA3C 800ABE3C C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACA40 800ABE40 C4C20038 */  lwc1       $f2, 0x38($a2)
/* ACA44 800ABE44 46022102 */  mul.s      $f4, $f4, $f2
/* ACA48 800ABE48 46060000 */  add.s      $f0, $f0, $f6
/* ACA4C 800ABE4C 46040000 */  add.s      $f0, $f0, $f4
/* ACA50 800ABE50 C4A20030 */  lwc1       $f2, 0x30($a1)
/* ACA54 800ABE54 46020000 */  add.s      $f0, $f0, $f2
/* ACA58 800ABE58 E4800030 */  swc1       $f0, 0x30($a0)
/* ACA5C 800ABE5C C4A20004 */  lwc1       $f2, 4($a1)
/* ACA60 800ABE60 C4C00000 */  lwc1       $f0, ($a2)
/* ACA64 800ABE64 46001082 */  mul.s      $f2, $f2, $f0
/* ACA68 800ABE68 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACA6C 800ABE6C C4C00004 */  lwc1       $f0, 4($a2)
/* ACA70 800ABE70 46003182 */  mul.s      $f6, $f6, $f0
/* ACA74 800ABE74 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACA78 800ABE78 C4C00008 */  lwc1       $f0, 8($a2)
/* ACA7C 800ABE7C 46002102 */  mul.s      $f4, $f4, $f0
/* ACA80 800ABE80 46061080 */  add.s      $f2, $f2, $f6
/* ACA84 800ABE84 46041080 */  add.s      $f2, $f2, $f4
/* ACA88 800ABE88 E4820004 */  swc1       $f2, 4($a0)
/* ACA8C 800ABE8C C4A00004 */  lwc1       $f0, 4($a1)
/* ACA90 800ABE90 C4C20010 */  lwc1       $f2, 0x10($a2)
/* ACA94 800ABE94 46020002 */  mul.s      $f0, $f0, $f2
/* ACA98 800ABE98 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACA9C 800ABE9C C4C20014 */  lwc1       $f2, 0x14($a2)
/* ACAA0 800ABEA0 46023182 */  mul.s      $f6, $f6, $f2
/* ACAA4 800ABEA4 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACAA8 800ABEA8 C4C20018 */  lwc1       $f2, 0x18($a2)
/* ACAAC 800ABEAC 46022102 */  mul.s      $f4, $f4, $f2
/* ACAB0 800ABEB0 46060000 */  add.s      $f0, $f0, $f6
/* ACAB4 800ABEB4 46040000 */  add.s      $f0, $f0, $f4
/* ACAB8 800ABEB8 E4800014 */  swc1       $f0, 0x14($a0)
/* ACABC 800ABEBC C4A20004 */  lwc1       $f2, 4($a1)
/* ACAC0 800ABEC0 C4C00020 */  lwc1       $f0, 0x20($a2)
/* ACAC4 800ABEC4 46001082 */  mul.s      $f2, $f2, $f0
/* ACAC8 800ABEC8 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACACC 800ABECC C4C00024 */  lwc1       $f0, 0x24($a2)
/* ACAD0 800ABED0 46003182 */  mul.s      $f6, $f6, $f0
/* ACAD4 800ABED4 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACAD8 800ABED8 C4C00028 */  lwc1       $f0, 0x28($a2)
/* ACADC 800ABEDC 46002102 */  mul.s      $f4, $f4, $f0
/* ACAE0 800ABEE0 46061080 */  add.s      $f2, $f2, $f6
/* ACAE4 800ABEE4 46041080 */  add.s      $f2, $f2, $f4
/* ACAE8 800ABEE8 E4820024 */  swc1       $f2, 0x24($a0)
/* ACAEC 800ABEEC C4A00004 */  lwc1       $f0, 4($a1)
/* ACAF0 800ABEF0 C4C20030 */  lwc1       $f2, 0x30($a2)
/* ACAF4 800ABEF4 46020002 */  mul.s      $f0, $f0, $f2
/* ACAF8 800ABEF8 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACAFC 800ABEFC C4C20034 */  lwc1       $f2, 0x34($a2)
/* ACB00 800ABF00 46023182 */  mul.s      $f6, $f6, $f2
/* ACB04 800ABF04 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACB08 800ABF08 C4C20038 */  lwc1       $f2, 0x38($a2)
/* ACB0C 800ABF0C 46022102 */  mul.s      $f4, $f4, $f2
/* ACB10 800ABF10 46060000 */  add.s      $f0, $f0, $f6
/* ACB14 800ABF14 46040000 */  add.s      $f0, $f0, $f4
/* ACB18 800ABF18 C4A20034 */  lwc1       $f2, 0x34($a1)
/* ACB1C 800ABF1C 46020000 */  add.s      $f0, $f0, $f2
/* ACB20 800ABF20 E4800034 */  swc1       $f0, 0x34($a0)
/* ACB24 800ABF24 C4A20008 */  lwc1       $f2, 8($a1)
/* ACB28 800ABF28 C4C00000 */  lwc1       $f0, ($a2)
/* ACB2C 800ABF2C 46001082 */  mul.s      $f2, $f2, $f0
/* ACB30 800ABF30 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACB34 800ABF34 C4C00004 */  lwc1       $f0, 4($a2)
/* ACB38 800ABF38 46003182 */  mul.s      $f6, $f6, $f0
/* ACB3C 800ABF3C C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACB40 800ABF40 C4C00008 */  lwc1       $f0, 8($a2)
/* ACB44 800ABF44 46002102 */  mul.s      $f4, $f4, $f0
/* ACB48 800ABF48 46061080 */  add.s      $f2, $f2, $f6
/* ACB4C 800ABF4C 46041080 */  add.s      $f2, $f2, $f4
/* ACB50 800ABF50 E4820008 */  swc1       $f2, 8($a0)
/* ACB54 800ABF54 C4A00008 */  lwc1       $f0, 8($a1)
/* ACB58 800ABF58 C4C20010 */  lwc1       $f2, 0x10($a2)
/* ACB5C 800ABF5C 46020002 */  mul.s      $f0, $f0, $f2
/* ACB60 800ABF60 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACB64 800ABF64 C4C20014 */  lwc1       $f2, 0x14($a2)
/* ACB68 800ABF68 46023182 */  mul.s      $f6, $f6, $f2
/* ACB6C 800ABF6C C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACB70 800ABF70 C4C20018 */  lwc1       $f2, 0x18($a2)
/* ACB74 800ABF74 46022102 */  mul.s      $f4, $f4, $f2
/* ACB78 800ABF78 46060000 */  add.s      $f0, $f0, $f6
/* ACB7C 800ABF7C 46040000 */  add.s      $f0, $f0, $f4
/* ACB80 800ABF80 E4800018 */  swc1       $f0, 0x18($a0)
/* ACB84 800ABF84 C4A20008 */  lwc1       $f2, 8($a1)
/* ACB88 800ABF88 C4C00020 */  lwc1       $f0, 0x20($a2)
/* ACB8C 800ABF8C 46001082 */  mul.s      $f2, $f2, $f0
/* ACB90 800ABF90 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACB94 800ABF94 C4C00024 */  lwc1       $f0, 0x24($a2)
/* ACB98 800ABF98 46003182 */  mul.s      $f6, $f6, $f0
/* ACB9C 800ABF9C C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACBA0 800ABFA0 C4C00028 */  lwc1       $f0, 0x28($a2)
/* ACBA4 800ABFA4 46002102 */  mul.s      $f4, $f4, $f0
/* ACBA8 800ABFA8 46061080 */  add.s      $f2, $f2, $f6
/* ACBAC 800ABFAC 46041080 */  add.s      $f2, $f2, $f4
/* ACBB0 800ABFB0 E4820028 */  swc1       $f2, 0x28($a0)
/* ACBB4 800ABFB4 C4A40008 */  lwc1       $f4, 8($a1)
/* ACBB8 800ABFB8 C4C00030 */  lwc1       $f0, 0x30($a2)
/* ACBBC 800ABFBC 46002102 */  mul.s      $f4, $f4, $f0
/* ACBC0 800ABFC0 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACBC4 800ABFC4 C4C00034 */  lwc1       $f0, 0x34($a2)
/* ACBC8 800ABFC8 46003182 */  mul.s      $f6, $f6, $f0
/* ACBCC 800ABFCC C4A20028 */  lwc1       $f2, 0x28($a1)
/* ACBD0 800ABFD0 C4C00038 */  lwc1       $f0, 0x38($a2)
/* ACBD4 800ABFD4 46001082 */  mul.s      $f2, $f2, $f0
/* ACBD8 800ABFD8 C4A80038 */  lwc1       $f8, 0x38($a1)
/* ACBDC 800ABFDC 46062100 */  add.s      $f4, $f4, $f6
/* ACBE0 800ABFE0 AC80000C */  sw         $zero, 0xc($a0)
/* ACBE4 800ABFE4 46022100 */  add.s      $f4, $f4, $f2
/* ACBE8 800ABFE8 AC80001C */  sw         $zero, 0x1c($a0)
/* ACBEC 800ABFEC 3C01800E */  lui        $at, %hi(D_800E36B0)
/* ACBF0 800ABFF0 C42036B0 */  lwc1       $f0, %lo(D_800E36B0)($at)
/* ACBF4 800ABFF4 46082100 */  add.s      $f4, $f4, $f8
/* ACBF8 800ABFF8 AC80002C */  sw         $zero, 0x2c($a0)
/* ACBFC 800ABFFC E480003C */  swc1       $f0, 0x3c($a0)
/* ACC00 800AC000 03E00008 */  jr         $ra
/* ACC04 800AC004 E4840038 */   swc1      $f4, 0x38($a0)

glabel some_float_array_func
/* ACC08 800AC008 C4A20000 */  lwc1       $f2, ($a1)
/* ACC0C 800AC00C C4C00000 */  lwc1       $f0, ($a2)
/* ACC10 800AC010 46001082 */  mul.s      $f2, $f2, $f0
/* ACC14 800AC014 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACC18 800AC018 C4C00004 */  lwc1       $f0, 4($a2)
/* ACC1C 800AC01C 46003182 */  mul.s      $f6, $f6, $f0
/* ACC20 800AC020 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACC24 800AC024 C4C00008 */  lwc1       $f0, 8($a2)
/* ACC28 800AC028 46002102 */  mul.s      $f4, $f4, $f0
/* ACC2C 800AC02C 46061080 */  add.s      $f2, $f2, $f6
/* ACC30 800AC030 46041080 */  add.s      $f2, $f2, $f4
/* ACC34 800AC034 E4820000 */  swc1       $f2, ($a0)
/* ACC38 800AC038 C4A00000 */  lwc1       $f0, ($a1)
/* ACC3C 800AC03C C4C20010 */  lwc1       $f2, 0x10($a2)
/* ACC40 800AC040 46020002 */  mul.s      $f0, $f0, $f2
/* ACC44 800AC044 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACC48 800AC048 C4C20014 */  lwc1       $f2, 0x14($a2)
/* ACC4C 800AC04C 46023182 */  mul.s      $f6, $f6, $f2
/* ACC50 800AC050 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACC54 800AC054 C4C20018 */  lwc1       $f2, 0x18($a2)
/* ACC58 800AC058 46022102 */  mul.s      $f4, $f4, $f2
/* ACC5C 800AC05C 46060000 */  add.s      $f0, $f0, $f6
/* ACC60 800AC060 46040000 */  add.s      $f0, $f0, $f4
/* ACC64 800AC064 E4800010 */  swc1       $f0, 0x10($a0)
/* ACC68 800AC068 C4A20000 */  lwc1       $f2, ($a1)
/* ACC6C 800AC06C C4C00020 */  lwc1       $f0, 0x20($a2)
/* ACC70 800AC070 46001082 */  mul.s      $f2, $f2, $f0
/* ACC74 800AC074 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACC78 800AC078 C4C00024 */  lwc1       $f0, 0x24($a2)
/* ACC7C 800AC07C 46003182 */  mul.s      $f6, $f6, $f0
/* ACC80 800AC080 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACC84 800AC084 C4C00028 */  lwc1       $f0, 0x28($a2)
/* ACC88 800AC088 46002102 */  mul.s      $f4, $f4, $f0
/* ACC8C 800AC08C 46061080 */  add.s      $f2, $f2, $f6
/* ACC90 800AC090 46041080 */  add.s      $f2, $f2, $f4
/* ACC94 800AC094 E4820020 */  swc1       $f2, 0x20($a0)
/* ACC98 800AC098 C4A60000 */  lwc1       $f6, ($a1)
/* ACC9C 800AC09C C4C00030 */  lwc1       $f0, 0x30($a2)
/* ACCA0 800AC0A0 46003182 */  mul.s      $f6, $f6, $f0
/* ACCA4 800AC0A4 C4A80010 */  lwc1       $f8, 0x10($a1)
/* ACCA8 800AC0A8 C4C00034 */  lwc1       $f0, 0x34($a2)
/* ACCAC 800AC0AC 46004202 */  mul.s      $f8, $f8, $f0
/* ACCB0 800AC0B0 C4A2000C */  lwc1       $f2, 0xc($a1)
/* ACCB4 800AC0B4 46023182 */  mul.s      $f6, $f6, $f2
/* ACCB8 800AC0B8 C4A2001C */  lwc1       $f2, 0x1c($a1)
/* ACCBC 800AC0BC 46024202 */  mul.s      $f8, $f8, $f2
/* ACCC0 800AC0C0 C4A00020 */  lwc1       $f0, 0x20($a1)
/* ACCC4 800AC0C4 C4C20038 */  lwc1       $f2, 0x38($a2)
/* ACCC8 800AC0C8 46020002 */  mul.s      $f0, $f0, $f2
/* ACCCC 800AC0CC C4A4002C */  lwc1       $f4, 0x2c($a1)
/* ACCD0 800AC0D0 46040002 */  mul.s      $f0, $f0, $f4
/* ACCD4 800AC0D4 46083180 */  add.s      $f6, $f6, $f8
/* ACCD8 800AC0D8 46003180 */  add.s      $f6, $f6, $f0
/* ACCDC 800AC0DC C4A20030 */  lwc1       $f2, 0x30($a1)
/* ACCE0 800AC0E0 46023180 */  add.s      $f6, $f6, $f2
/* ACCE4 800AC0E4 E4860030 */  swc1       $f6, 0x30($a0)
/* ACCE8 800AC0E8 C4A00004 */  lwc1       $f0, 4($a1)
/* ACCEC 800AC0EC C4C20000 */  lwc1       $f2, ($a2)
/* ACCF0 800AC0F0 46020002 */  mul.s      $f0, $f0, $f2
/* ACCF4 800AC0F4 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACCF8 800AC0F8 C4C20004 */  lwc1       $f2, 4($a2)
/* ACCFC 800AC0FC 46023182 */  mul.s      $f6, $f6, $f2
/* ACD00 800AC100 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACD04 800AC104 C4C20008 */  lwc1       $f2, 8($a2)
/* ACD08 800AC108 46022102 */  mul.s      $f4, $f4, $f2
/* ACD0C 800AC10C 46060000 */  add.s      $f0, $f0, $f6
/* ACD10 800AC110 46040000 */  add.s      $f0, $f0, $f4
/* ACD14 800AC114 E4800004 */  swc1       $f0, 4($a0)
/* ACD18 800AC118 C4A20004 */  lwc1       $f2, 4($a1)
/* ACD1C 800AC11C C4C00010 */  lwc1       $f0, 0x10($a2)
/* ACD20 800AC120 46001082 */  mul.s      $f2, $f2, $f0
/* ACD24 800AC124 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACD28 800AC128 C4C00014 */  lwc1       $f0, 0x14($a2)
/* ACD2C 800AC12C 46003182 */  mul.s      $f6, $f6, $f0
/* ACD30 800AC130 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACD34 800AC134 C4C00018 */  lwc1       $f0, 0x18($a2)
/* ACD38 800AC138 46002102 */  mul.s      $f4, $f4, $f0
/* ACD3C 800AC13C 46061080 */  add.s      $f2, $f2, $f6
/* ACD40 800AC140 46041080 */  add.s      $f2, $f2, $f4
/* ACD44 800AC144 E4820014 */  swc1       $f2, 0x14($a0)
/* ACD48 800AC148 C4A00004 */  lwc1       $f0, 4($a1)
/* ACD4C 800AC14C C4C20020 */  lwc1       $f2, 0x20($a2)
/* ACD50 800AC150 46020002 */  mul.s      $f0, $f0, $f2
/* ACD54 800AC154 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACD58 800AC158 C4C20024 */  lwc1       $f2, 0x24($a2)
/* ACD5C 800AC15C 46023182 */  mul.s      $f6, $f6, $f2
/* ACD60 800AC160 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACD64 800AC164 C4C20028 */  lwc1       $f2, 0x28($a2)
/* ACD68 800AC168 46022102 */  mul.s      $f4, $f4, $f2
/* ACD6C 800AC16C 46060000 */  add.s      $f0, $f0, $f6
/* ACD70 800AC170 46040000 */  add.s      $f0, $f0, $f4
/* ACD74 800AC174 E4800024 */  swc1       $f0, 0x24($a0)
/* ACD78 800AC178 C4A60004 */  lwc1       $f6, 4($a1)
/* ACD7C 800AC17C C4C00030 */  lwc1       $f0, 0x30($a2)
/* ACD80 800AC180 46003182 */  mul.s      $f6, $f6, $f0
/* ACD84 800AC184 C4A80014 */  lwc1       $f8, 0x14($a1)
/* ACD88 800AC188 C4C00034 */  lwc1       $f0, 0x34($a2)
/* ACD8C 800AC18C 46004202 */  mul.s      $f8, $f8, $f0
/* ACD90 800AC190 C4A2000C */  lwc1       $f2, 0xc($a1)
/* ACD94 800AC194 46023182 */  mul.s      $f6, $f6, $f2
/* ACD98 800AC198 C4A2001C */  lwc1       $f2, 0x1c($a1)
/* ACD9C 800AC19C 46024202 */  mul.s      $f8, $f8, $f2
/* ACDA0 800AC1A0 C4A00024 */  lwc1       $f0, 0x24($a1)
/* ACDA4 800AC1A4 C4C20038 */  lwc1       $f2, 0x38($a2)
/* ACDA8 800AC1A8 46020002 */  mul.s      $f0, $f0, $f2
/* ACDAC 800AC1AC C4A4002C */  lwc1       $f4, 0x2c($a1)
/* ACDB0 800AC1B0 46040002 */  mul.s      $f0, $f0, $f4
/* ACDB4 800AC1B4 46083180 */  add.s      $f6, $f6, $f8
/* ACDB8 800AC1B8 46003180 */  add.s      $f6, $f6, $f0
/* ACDBC 800AC1BC C4A20034 */  lwc1       $f2, 0x34($a1)
/* ACDC0 800AC1C0 46023180 */  add.s      $f6, $f6, $f2
/* ACDC4 800AC1C4 E4860034 */  swc1       $f6, 0x34($a0)
/* ACDC8 800AC1C8 C4A00008 */  lwc1       $f0, 8($a1)
/* ACDCC 800AC1CC C4C20000 */  lwc1       $f2, ($a2)
/* ACDD0 800AC1D0 46020002 */  mul.s      $f0, $f0, $f2
/* ACDD4 800AC1D4 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACDD8 800AC1D8 C4C20004 */  lwc1       $f2, 4($a2)
/* ACDDC 800AC1DC 46023182 */  mul.s      $f6, $f6, $f2
/* ACDE0 800AC1E0 C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACDE4 800AC1E4 C4C20008 */  lwc1       $f2, 8($a2)
/* ACDE8 800AC1E8 46022102 */  mul.s      $f4, $f4, $f2
/* ACDEC 800AC1EC 46060000 */  add.s      $f0, $f0, $f6
/* ACDF0 800AC1F0 46040000 */  add.s      $f0, $f0, $f4
/* ACDF4 800AC1F4 E4800008 */  swc1       $f0, 8($a0)
/* ACDF8 800AC1F8 C4A20008 */  lwc1       $f2, 8($a1)
/* ACDFC 800AC1FC C4C00010 */  lwc1       $f0, 0x10($a2)
/* ACE00 800AC200 46001082 */  mul.s      $f2, $f2, $f0
/* ACE04 800AC204 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACE08 800AC208 C4C00014 */  lwc1       $f0, 0x14($a2)
/* ACE0C 800AC20C 46003182 */  mul.s      $f6, $f6, $f0
/* ACE10 800AC210 C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACE14 800AC214 C4C00018 */  lwc1       $f0, 0x18($a2)
/* ACE18 800AC218 46002102 */  mul.s      $f4, $f4, $f0
/* ACE1C 800AC21C 46061080 */  add.s      $f2, $f2, $f6
/* ACE20 800AC220 46041080 */  add.s      $f2, $f2, $f4
/* ACE24 800AC224 E4820018 */  swc1       $f2, 0x18($a0)
/* ACE28 800AC228 C4A00008 */  lwc1       $f0, 8($a1)
/* ACE2C 800AC22C C4C20020 */  lwc1       $f2, 0x20($a2)
/* ACE30 800AC230 46020002 */  mul.s      $f0, $f0, $f2
/* ACE34 800AC234 C4A60018 */  lwc1       $f6, 0x18($a1)
/* ACE38 800AC238 C4C20024 */  lwc1       $f2, 0x24($a2)
/* ACE3C 800AC23C 46023182 */  mul.s      $f6, $f6, $f2
/* ACE40 800AC240 C4A40028 */  lwc1       $f4, 0x28($a1)
/* ACE44 800AC244 C4C20028 */  lwc1       $f2, 0x28($a2)
/* ACE48 800AC248 46022102 */  mul.s      $f4, $f4, $f2
/* ACE4C 800AC24C 46060000 */  add.s      $f0, $f0, $f6
/* ACE50 800AC250 46040000 */  add.s      $f0, $f0, $f4
/* ACE54 800AC254 E4800028 */  swc1       $f0, 0x28($a0)
/* ACE58 800AC258 C4A60008 */  lwc1       $f6, 8($a1)
/* ACE5C 800AC25C C4C00030 */  lwc1       $f0, 0x30($a2)
/* ACE60 800AC260 46003182 */  mul.s      $f6, $f6, $f0
/* ACE64 800AC264 C4A80018 */  lwc1       $f8, 0x18($a1)
/* ACE68 800AC268 C4C00034 */  lwc1       $f0, 0x34($a2)
/* ACE6C 800AC26C 46004202 */  mul.s      $f8, $f8, $f0
/* ACE70 800AC270 C4A2000C */  lwc1       $f2, 0xc($a1)
/* ACE74 800AC274 46023182 */  mul.s      $f6, $f6, $f2
/* ACE78 800AC278 C4A2001C */  lwc1       $f2, 0x1c($a1)
/* ACE7C 800AC27C 46024202 */  mul.s      $f8, $f8, $f2
/* ACE80 800AC280 C4A00028 */  lwc1       $f0, 0x28($a1)
/* ACE84 800AC284 C4C20038 */  lwc1       $f2, 0x38($a2)
/* ACE88 800AC288 46020002 */  mul.s      $f0, $f0, $f2
/* ACE8C 800AC28C C4A4002C */  lwc1       $f4, 0x2c($a1)
/* ACE90 800AC290 46040002 */  mul.s      $f0, $f0, $f4
/* ACE94 800AC294 46083180 */  add.s      $f6, $f6, $f8
/* ACE98 800AC298 46003180 */  add.s      $f6, $f6, $f0
/* ACE9C 800AC29C C4A20038 */  lwc1       $f2, 0x38($a1)
/* ACEA0 800AC2A0 46023180 */  add.s      $f6, $f6, $f2
/* ACEA4 800AC2A4 E4860038 */  swc1       $f6, 0x38($a0)
/* ACEA8 800AC2A8 C4A0000C */  lwc1       $f0, 0xc($a1)
/* ACEAC 800AC2AC C4C2000C */  lwc1       $f2, 0xc($a2)
/* ACEB0 800AC2B0 46020002 */  mul.s      $f0, $f0, $f2
/* ACEB4 800AC2B4 E480000C */  swc1       $f0, 0xc($a0)
/* ACEB8 800AC2B8 C4A2001C */  lwc1       $f2, 0x1c($a1)
/* ACEBC 800AC2BC C4C0001C */  lwc1       $f0, 0x1c($a2)
/* ACEC0 800AC2C0 46001082 */  mul.s      $f2, $f2, $f0
/* ACEC4 800AC2C4 E482001C */  swc1       $f2, 0x1c($a0)
/* ACEC8 800AC2C8 C4A4002C */  lwc1       $f4, 0x2c($a1)
/* ACECC 800AC2CC C4C0002C */  lwc1       $f0, 0x2c($a2)
/* ACED0 800AC2D0 46002102 */  mul.s      $f4, $f4, $f0
/* ACED4 800AC2D4 3C01800E */  lui        $at, %hi(D_800E36B4)
/* ACED8 800AC2D8 C42236B4 */  lwc1       $f2, %lo(D_800E36B4)($at)
/* ACEDC 800AC2DC E482003C */  swc1       $f2, 0x3c($a0)
/* ACEE0 800AC2E0 03E00008 */  jr         $ra
/* ACEE4 800AC2E4 E484002C */   swc1      $f4, 0x2c($a0)

glabel func_800AC2E8
/* ACEE8 800AC2E8 C4A20000 */  lwc1       $f2, ($a1)
/* ACEEC 800AC2EC C4C00000 */  lwc1       $f0, ($a2)
/* ACEF0 800AC2F0 46001082 */  mul.s      $f2, $f2, $f0
/* ACEF4 800AC2F4 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACEF8 800AC2F8 C4C00004 */  lwc1       $f0, 4($a2)
/* ACEFC 800AC2FC 46003182 */  mul.s      $f6, $f6, $f0
/* ACF00 800AC300 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACF04 800AC304 C4C00008 */  lwc1       $f0, 8($a2)
/* ACF08 800AC308 46002102 */  mul.s      $f4, $f4, $f0
/* ACF0C 800AC30C 46061080 */  add.s      $f2, $f2, $f6
/* ACF10 800AC310 46041080 */  add.s      $f2, $f2, $f4
/* ACF14 800AC314 E4820000 */  swc1       $f2, ($a0)
/* ACF18 800AC318 C4A00000 */  lwc1       $f0, ($a1)
/* ACF1C 800AC31C C4C20010 */  lwc1       $f2, 0x10($a2)
/* ACF20 800AC320 46020002 */  mul.s      $f0, $f0, $f2
/* ACF24 800AC324 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACF28 800AC328 C4C20014 */  lwc1       $f2, 0x14($a2)
/* ACF2C 800AC32C 46023182 */  mul.s      $f6, $f6, $f2
/* ACF30 800AC330 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACF34 800AC334 C4C20018 */  lwc1       $f2, 0x18($a2)
/* ACF38 800AC338 46022102 */  mul.s      $f4, $f4, $f2
/* ACF3C 800AC33C 46060000 */  add.s      $f0, $f0, $f6
/* ACF40 800AC340 46040000 */  add.s      $f0, $f0, $f4
/* ACF44 800AC344 E4800010 */  swc1       $f0, 0x10($a0)
/* ACF48 800AC348 C4A20000 */  lwc1       $f2, ($a1)
/* ACF4C 800AC34C C4C00020 */  lwc1       $f0, 0x20($a2)
/* ACF50 800AC350 46001082 */  mul.s      $f2, $f2, $f0
/* ACF54 800AC354 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ACF58 800AC358 C4C00024 */  lwc1       $f0, 0x24($a2)
/* ACF5C 800AC35C 46003182 */  mul.s      $f6, $f6, $f0
/* ACF60 800AC360 C4A40020 */  lwc1       $f4, 0x20($a1)
/* ACF64 800AC364 C4C00028 */  lwc1       $f0, 0x28($a2)
/* ACF68 800AC368 46002102 */  mul.s      $f4, $f4, $f0
/* ACF6C 800AC36C 46061080 */  add.s      $f2, $f2, $f6
/* ACF70 800AC370 46041080 */  add.s      $f2, $f2, $f4
/* ACF74 800AC374 E4820020 */  swc1       $f2, 0x20($a0)
/* ACF78 800AC378 C4A00004 */  lwc1       $f0, 4($a1)
/* ACF7C 800AC37C C4C20000 */  lwc1       $f2, ($a2)
/* ACF80 800AC380 46020002 */  mul.s      $f0, $f0, $f2
/* ACF84 800AC384 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACF88 800AC388 C4C20004 */  lwc1       $f2, 4($a2)
/* ACF8C 800AC38C 46023182 */  mul.s      $f6, $f6, $f2
/* ACF90 800AC390 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACF94 800AC394 C4C20008 */  lwc1       $f2, 8($a2)
/* ACF98 800AC398 46022102 */  mul.s      $f4, $f4, $f2
/* ACF9C 800AC39C 46060000 */  add.s      $f0, $f0, $f6
/* ACFA0 800AC3A0 46040000 */  add.s      $f0, $f0, $f4
/* ACFA4 800AC3A4 E4800004 */  swc1       $f0, 4($a0)
/* ACFA8 800AC3A8 C4A20004 */  lwc1       $f2, 4($a1)
/* ACFAC 800AC3AC C4C00010 */  lwc1       $f0, 0x10($a2)
/* ACFB0 800AC3B0 46001082 */  mul.s      $f2, $f2, $f0
/* ACFB4 800AC3B4 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACFB8 800AC3B8 C4C00014 */  lwc1       $f0, 0x14($a2)
/* ACFBC 800AC3BC 46003182 */  mul.s      $f6, $f6, $f0
/* ACFC0 800AC3C0 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACFC4 800AC3C4 C4C00018 */  lwc1       $f0, 0x18($a2)
/* ACFC8 800AC3C8 46002102 */  mul.s      $f4, $f4, $f0
/* ACFCC 800AC3CC 46061080 */  add.s      $f2, $f2, $f6
/* ACFD0 800AC3D0 46041080 */  add.s      $f2, $f2, $f4
/* ACFD4 800AC3D4 E4820014 */  swc1       $f2, 0x14($a0)
/* ACFD8 800AC3D8 C4A00004 */  lwc1       $f0, 4($a1)
/* ACFDC 800AC3DC C4C20020 */  lwc1       $f2, 0x20($a2)
/* ACFE0 800AC3E0 46020002 */  mul.s      $f0, $f0, $f2
/* ACFE4 800AC3E4 C4A60014 */  lwc1       $f6, 0x14($a1)
/* ACFE8 800AC3E8 C4C20024 */  lwc1       $f2, 0x24($a2)
/* ACFEC 800AC3EC 46023182 */  mul.s      $f6, $f6, $f2
/* ACFF0 800AC3F0 C4A40024 */  lwc1       $f4, 0x24($a1)
/* ACFF4 800AC3F4 C4C20028 */  lwc1       $f2, 0x28($a2)
/* ACFF8 800AC3F8 46022102 */  mul.s      $f4, $f4, $f2
/* ACFFC 800AC3FC 46060000 */  add.s      $f0, $f0, $f6
/* AD000 800AC400 46040000 */  add.s      $f0, $f0, $f4
/* AD004 800AC404 E4800024 */  swc1       $f0, 0x24($a0)
/* AD008 800AC408 C4A20008 */  lwc1       $f2, 8($a1)
/* AD00C 800AC40C C4C00000 */  lwc1       $f0, ($a2)
/* AD010 800AC410 46001082 */  mul.s      $f2, $f2, $f0
/* AD014 800AC414 C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD018 800AC418 C4C00004 */  lwc1       $f0, 4($a2)
/* AD01C 800AC41C 46003182 */  mul.s      $f6, $f6, $f0
/* AD020 800AC420 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD024 800AC424 C4C00008 */  lwc1       $f0, 8($a2)
/* AD028 800AC428 46002102 */  mul.s      $f4, $f4, $f0
/* AD02C 800AC42C 46061080 */  add.s      $f2, $f2, $f6
/* AD030 800AC430 46041080 */  add.s      $f2, $f2, $f4
/* AD034 800AC434 E4820008 */  swc1       $f2, 8($a0)
/* AD038 800AC438 C4A00008 */  lwc1       $f0, 8($a1)
/* AD03C 800AC43C C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD040 800AC440 46020002 */  mul.s      $f0, $f0, $f2
/* AD044 800AC444 C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD048 800AC448 C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD04C 800AC44C 46023182 */  mul.s      $f6, $f6, $f2
/* AD050 800AC450 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD054 800AC454 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD058 800AC458 46022102 */  mul.s      $f4, $f4, $f2
/* AD05C 800AC45C 46060000 */  add.s      $f0, $f0, $f6
/* AD060 800AC460 46040000 */  add.s      $f0, $f0, $f4
/* AD064 800AC464 E4800018 */  swc1       $f0, 0x18($a0)
/* AD068 800AC468 C4A20008 */  lwc1       $f2, 8($a1)
/* AD06C 800AC46C C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD070 800AC470 46001082 */  mul.s      $f2, $f2, $f0
/* AD074 800AC474 C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD078 800AC478 C4C00024 */  lwc1       $f0, 0x24($a2)
/* AD07C 800AC47C 46003182 */  mul.s      $f6, $f6, $f0
/* AD080 800AC480 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD084 800AC484 C4C00028 */  lwc1       $f0, 0x28($a2)
/* AD088 800AC488 46002102 */  mul.s      $f4, $f4, $f0
/* AD08C 800AC48C 46061080 */  add.s      $f2, $f2, $f6
/* AD090 800AC490 46041080 */  add.s      $f2, $f2, $f4
/* AD094 800AC494 03E00008 */  jr         $ra
/* AD098 800AC498 E4820028 */   swc1      $f2, 0x28($a0)

glabel some_oher_matrix_math
/* AD09C 800AC49C C4A20000 */  lwc1       $f2, ($a1)
/* AD0A0 800AC4A0 C4C00000 */  lwc1       $f0, ($a2)
/* AD0A4 800AC4A4 46001082 */  mul.s      $f2, $f2, $f0
/* AD0A8 800AC4A8 C4A80010 */  lwc1       $f8, 0x10($a1)
/* AD0AC 800AC4AC C4C00004 */  lwc1       $f0, 4($a2)
/* AD0B0 800AC4B0 46004202 */  mul.s      $f8, $f8, $f0
/* AD0B4 800AC4B4 C4A60020 */  lwc1       $f6, 0x20($a1)
/* AD0B8 800AC4B8 C4C00008 */  lwc1       $f0, 8($a2)
/* AD0BC 800AC4BC 46003182 */  mul.s      $f6, $f6, $f0
/* AD0C0 800AC4C0 C4A40030 */  lwc1       $f4, 0x30($a1)
/* AD0C4 800AC4C4 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD0C8 800AC4C8 46002102 */  mul.s      $f4, $f4, $f0
/* AD0CC 800AC4CC 46081080 */  add.s      $f2, $f2, $f8
/* AD0D0 800AC4D0 46061080 */  add.s      $f2, $f2, $f6
/* AD0D4 800AC4D4 46041080 */  add.s      $f2, $f2, $f4
/* AD0D8 800AC4D8 E4820000 */  swc1       $f2, ($a0)
/* AD0DC 800AC4DC C4A00000 */  lwc1       $f0, ($a1)
/* AD0E0 800AC4E0 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD0E4 800AC4E4 46020002 */  mul.s      $f0, $f0, $f2
/* AD0E8 800AC4E8 C4A80010 */  lwc1       $f8, 0x10($a1)
/* AD0EC 800AC4EC C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD0F0 800AC4F0 46024202 */  mul.s      $f8, $f8, $f2
/* AD0F4 800AC4F4 C4A60020 */  lwc1       $f6, 0x20($a1)
/* AD0F8 800AC4F8 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD0FC 800AC4FC 46023182 */  mul.s      $f6, $f6, $f2
/* AD100 800AC500 C4A40030 */  lwc1       $f4, 0x30($a1)
/* AD104 800AC504 C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD108 800AC508 46022102 */  mul.s      $f4, $f4, $f2
/* AD10C 800AC50C 46080000 */  add.s      $f0, $f0, $f8
/* AD110 800AC510 46060000 */  add.s      $f0, $f0, $f6
/* AD114 800AC514 46040000 */  add.s      $f0, $f0, $f4
/* AD118 800AC518 E4800010 */  swc1       $f0, 0x10($a0)
/* AD11C 800AC51C C4A20000 */  lwc1       $f2, ($a1)
/* AD120 800AC520 C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD124 800AC524 46001082 */  mul.s      $f2, $f2, $f0
/* AD128 800AC528 C4A80010 */  lwc1       $f8, 0x10($a1)
/* AD12C 800AC52C C4C00024 */  lwc1       $f0, 0x24($a2)
/* AD130 800AC530 46004202 */  mul.s      $f8, $f8, $f0
/* AD134 800AC534 C4A60020 */  lwc1       $f6, 0x20($a1)
/* AD138 800AC538 C4C00028 */  lwc1       $f0, 0x28($a2)
/* AD13C 800AC53C 46003182 */  mul.s      $f6, $f6, $f0
/* AD140 800AC540 C4A40030 */  lwc1       $f4, 0x30($a1)
/* AD144 800AC544 C4C0002C */  lwc1       $f0, 0x2c($a2)
/* AD148 800AC548 46002102 */  mul.s      $f4, $f4, $f0
/* AD14C 800AC54C 46081080 */  add.s      $f2, $f2, $f8
/* AD150 800AC550 46061080 */  add.s      $f2, $f2, $f6
/* AD154 800AC554 46041080 */  add.s      $f2, $f2, $f4
/* AD158 800AC558 E4820020 */  swc1       $f2, 0x20($a0)
/* AD15C 800AC55C C4A00000 */  lwc1       $f0, ($a1)
/* AD160 800AC560 C4C20030 */  lwc1       $f2, 0x30($a2)
/* AD164 800AC564 46020002 */  mul.s      $f0, $f0, $f2
/* AD168 800AC568 C4A80010 */  lwc1       $f8, 0x10($a1)
/* AD16C 800AC56C C4C20034 */  lwc1       $f2, 0x34($a2)
/* AD170 800AC570 46024202 */  mul.s      $f8, $f8, $f2
/* AD174 800AC574 C4A60020 */  lwc1       $f6, 0x20($a1)
/* AD178 800AC578 C4C20038 */  lwc1       $f2, 0x38($a2)
/* AD17C 800AC57C 46023182 */  mul.s      $f6, $f6, $f2
/* AD180 800AC580 C4A40030 */  lwc1       $f4, 0x30($a1)
/* AD184 800AC584 C4C2003C */  lwc1       $f2, 0x3c($a2)
/* AD188 800AC588 46022102 */  mul.s      $f4, $f4, $f2
/* AD18C 800AC58C 46080000 */  add.s      $f0, $f0, $f8
/* AD190 800AC590 46060000 */  add.s      $f0, $f0, $f6
/* AD194 800AC594 46040000 */  add.s      $f0, $f0, $f4
/* AD198 800AC598 E4800030 */  swc1       $f0, 0x30($a0)
/* AD19C 800AC59C C4A20004 */  lwc1       $f2, 4($a1)
/* AD1A0 800AC5A0 C4C00000 */  lwc1       $f0, ($a2)
/* AD1A4 800AC5A4 46001082 */  mul.s      $f2, $f2, $f0
/* AD1A8 800AC5A8 C4A80014 */  lwc1       $f8, 0x14($a1)
/* AD1AC 800AC5AC C4C00004 */  lwc1       $f0, 4($a2)
/* AD1B0 800AC5B0 46004202 */  mul.s      $f8, $f8, $f0
/* AD1B4 800AC5B4 C4A60024 */  lwc1       $f6, 0x24($a1)
/* AD1B8 800AC5B8 C4C00008 */  lwc1       $f0, 8($a2)
/* AD1BC 800AC5BC 46003182 */  mul.s      $f6, $f6, $f0
/* AD1C0 800AC5C0 C4A40034 */  lwc1       $f4, 0x34($a1)
/* AD1C4 800AC5C4 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD1C8 800AC5C8 46002102 */  mul.s      $f4, $f4, $f0
/* AD1CC 800AC5CC 46081080 */  add.s      $f2, $f2, $f8
/* AD1D0 800AC5D0 46061080 */  add.s      $f2, $f2, $f6
/* AD1D4 800AC5D4 46041080 */  add.s      $f2, $f2, $f4
/* AD1D8 800AC5D8 E4820004 */  swc1       $f2, 4($a0)
/* AD1DC 800AC5DC C4A00004 */  lwc1       $f0, 4($a1)
/* AD1E0 800AC5E0 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD1E4 800AC5E4 46020002 */  mul.s      $f0, $f0, $f2
/* AD1E8 800AC5E8 C4A80014 */  lwc1       $f8, 0x14($a1)
/* AD1EC 800AC5EC C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD1F0 800AC5F0 46024202 */  mul.s      $f8, $f8, $f2
/* AD1F4 800AC5F4 C4A60024 */  lwc1       $f6, 0x24($a1)
/* AD1F8 800AC5F8 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD1FC 800AC5FC 46023182 */  mul.s      $f6, $f6, $f2
/* AD200 800AC600 C4A40034 */  lwc1       $f4, 0x34($a1)
/* AD204 800AC604 C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD208 800AC608 46022102 */  mul.s      $f4, $f4, $f2
/* AD20C 800AC60C 46080000 */  add.s      $f0, $f0, $f8
/* AD210 800AC610 46060000 */  add.s      $f0, $f0, $f6
/* AD214 800AC614 46040000 */  add.s      $f0, $f0, $f4
/* AD218 800AC618 E4800014 */  swc1       $f0, 0x14($a0)
/* AD21C 800AC61C C4A20004 */  lwc1       $f2, 4($a1)
/* AD220 800AC620 C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD224 800AC624 46001082 */  mul.s      $f2, $f2, $f0
/* AD228 800AC628 C4A80014 */  lwc1       $f8, 0x14($a1)
/* AD22C 800AC62C C4C00024 */  lwc1       $f0, 0x24($a2)
/* AD230 800AC630 46004202 */  mul.s      $f8, $f8, $f0
/* AD234 800AC634 C4A60024 */  lwc1       $f6, 0x24($a1)
/* AD238 800AC638 C4C00028 */  lwc1       $f0, 0x28($a2)
/* AD23C 800AC63C 46003182 */  mul.s      $f6, $f6, $f0
/* AD240 800AC640 C4A40034 */  lwc1       $f4, 0x34($a1)
/* AD244 800AC644 C4C0002C */  lwc1       $f0, 0x2c($a2)
/* AD248 800AC648 46002102 */  mul.s      $f4, $f4, $f0
/* AD24C 800AC64C 46081080 */  add.s      $f2, $f2, $f8
/* AD250 800AC650 46061080 */  add.s      $f2, $f2, $f6
/* AD254 800AC654 46041080 */  add.s      $f2, $f2, $f4
/* AD258 800AC658 E4820024 */  swc1       $f2, 0x24($a0)
/* AD25C 800AC65C C4A00004 */  lwc1       $f0, 4($a1)
/* AD260 800AC660 C4C20030 */  lwc1       $f2, 0x30($a2)
/* AD264 800AC664 46020002 */  mul.s      $f0, $f0, $f2
/* AD268 800AC668 C4A80014 */  lwc1       $f8, 0x14($a1)
/* AD26C 800AC66C C4C20034 */  lwc1       $f2, 0x34($a2)
/* AD270 800AC670 46024202 */  mul.s      $f8, $f8, $f2
/* AD274 800AC674 C4A60024 */  lwc1       $f6, 0x24($a1)
/* AD278 800AC678 C4C20038 */  lwc1       $f2, 0x38($a2)
/* AD27C 800AC67C 46023182 */  mul.s      $f6, $f6, $f2
/* AD280 800AC680 C4A40034 */  lwc1       $f4, 0x34($a1)
/* AD284 800AC684 C4C2003C */  lwc1       $f2, 0x3c($a2)
/* AD288 800AC688 46022102 */  mul.s      $f4, $f4, $f2
/* AD28C 800AC68C 46080000 */  add.s      $f0, $f0, $f8
/* AD290 800AC690 46060000 */  add.s      $f0, $f0, $f6
/* AD294 800AC694 46040000 */  add.s      $f0, $f0, $f4
/* AD298 800AC698 E4800034 */  swc1       $f0, 0x34($a0)
/* AD29C 800AC69C C4A20008 */  lwc1       $f2, 8($a1)
/* AD2A0 800AC6A0 C4C00000 */  lwc1       $f0, ($a2)
/* AD2A4 800AC6A4 46001082 */  mul.s      $f2, $f2, $f0
/* AD2A8 800AC6A8 C4A80018 */  lwc1       $f8, 0x18($a1)
/* AD2AC 800AC6AC C4C00004 */  lwc1       $f0, 4($a2)
/* AD2B0 800AC6B0 46004202 */  mul.s      $f8, $f8, $f0
/* AD2B4 800AC6B4 C4A60028 */  lwc1       $f6, 0x28($a1)
/* AD2B8 800AC6B8 C4C00008 */  lwc1       $f0, 8($a2)
/* AD2BC 800AC6BC 46003182 */  mul.s      $f6, $f6, $f0
/* AD2C0 800AC6C0 C4A40038 */  lwc1       $f4, 0x38($a1)
/* AD2C4 800AC6C4 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD2C8 800AC6C8 46002102 */  mul.s      $f4, $f4, $f0
/* AD2CC 800AC6CC 46081080 */  add.s      $f2, $f2, $f8
/* AD2D0 800AC6D0 46061080 */  add.s      $f2, $f2, $f6
/* AD2D4 800AC6D4 46041080 */  add.s      $f2, $f2, $f4
/* AD2D8 800AC6D8 E4820008 */  swc1       $f2, 8($a0)
/* AD2DC 800AC6DC C4A00008 */  lwc1       $f0, 8($a1)
/* AD2E0 800AC6E0 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD2E4 800AC6E4 46020002 */  mul.s      $f0, $f0, $f2
/* AD2E8 800AC6E8 C4A80018 */  lwc1       $f8, 0x18($a1)
/* AD2EC 800AC6EC C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD2F0 800AC6F0 46024202 */  mul.s      $f8, $f8, $f2
/* AD2F4 800AC6F4 C4A60028 */  lwc1       $f6, 0x28($a1)
/* AD2F8 800AC6F8 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD2FC 800AC6FC 46023182 */  mul.s      $f6, $f6, $f2
/* AD300 800AC700 C4A40038 */  lwc1       $f4, 0x38($a1)
/* AD304 800AC704 C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD308 800AC708 46022102 */  mul.s      $f4, $f4, $f2
/* AD30C 800AC70C 46080000 */  add.s      $f0, $f0, $f8
/* AD310 800AC710 46060000 */  add.s      $f0, $f0, $f6
/* AD314 800AC714 46040000 */  add.s      $f0, $f0, $f4
/* AD318 800AC718 E4800018 */  swc1       $f0, 0x18($a0)
/* AD31C 800AC71C C4A20008 */  lwc1       $f2, 8($a1)
/* AD320 800AC720 C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD324 800AC724 46001082 */  mul.s      $f2, $f2, $f0
/* AD328 800AC728 C4A80018 */  lwc1       $f8, 0x18($a1)
/* AD32C 800AC72C C4C00024 */  lwc1       $f0, 0x24($a2)
/* AD330 800AC730 46004202 */  mul.s      $f8, $f8, $f0
/* AD334 800AC734 C4A60028 */  lwc1       $f6, 0x28($a1)
/* AD338 800AC738 C4C00028 */  lwc1       $f0, 0x28($a2)
/* AD33C 800AC73C 46003182 */  mul.s      $f6, $f6, $f0
/* AD340 800AC740 C4A40038 */  lwc1       $f4, 0x38($a1)
/* AD344 800AC744 C4C0002C */  lwc1       $f0, 0x2c($a2)
/* AD348 800AC748 46002102 */  mul.s      $f4, $f4, $f0
/* AD34C 800AC74C 46081080 */  add.s      $f2, $f2, $f8
/* AD350 800AC750 46061080 */  add.s      $f2, $f2, $f6
/* AD354 800AC754 46041080 */  add.s      $f2, $f2, $f4
/* AD358 800AC758 E4820028 */  swc1       $f2, 0x28($a0)
/* AD35C 800AC75C C4A00008 */  lwc1       $f0, 8($a1)
/* AD360 800AC760 C4C20030 */  lwc1       $f2, 0x30($a2)
/* AD364 800AC764 46020002 */  mul.s      $f0, $f0, $f2
/* AD368 800AC768 C4A80018 */  lwc1       $f8, 0x18($a1)
/* AD36C 800AC76C C4C20034 */  lwc1       $f2, 0x34($a2)
/* AD370 800AC770 46024202 */  mul.s      $f8, $f8, $f2
/* AD374 800AC774 C4A60028 */  lwc1       $f6, 0x28($a1)
/* AD378 800AC778 C4C20038 */  lwc1       $f2, 0x38($a2)
/* AD37C 800AC77C 46023182 */  mul.s      $f6, $f6, $f2
/* AD380 800AC780 C4A40038 */  lwc1       $f4, 0x38($a1)
/* AD384 800AC784 C4C2003C */  lwc1       $f2, 0x3c($a2)
/* AD388 800AC788 46022102 */  mul.s      $f4, $f4, $f2
/* AD38C 800AC78C 46080000 */  add.s      $f0, $f0, $f8
/* AD390 800AC790 46060000 */  add.s      $f0, $f0, $f6
/* AD394 800AC794 46040000 */  add.s      $f0, $f0, $f4
/* AD398 800AC798 E4800038 */  swc1       $f0, 0x38($a0)
/* AD39C 800AC79C C4A2000C */  lwc1       $f2, 0xc($a1)
/* AD3A0 800AC7A0 C4C00000 */  lwc1       $f0, ($a2)
/* AD3A4 800AC7A4 46001082 */  mul.s      $f2, $f2, $f0
/* AD3A8 800AC7A8 C4A8001C */  lwc1       $f8, 0x1c($a1)
/* AD3AC 800AC7AC C4C00004 */  lwc1       $f0, 4($a2)
/* AD3B0 800AC7B0 46004202 */  mul.s      $f8, $f8, $f0
/* AD3B4 800AC7B4 C4A6002C */  lwc1       $f6, 0x2c($a1)
/* AD3B8 800AC7B8 C4C00008 */  lwc1       $f0, 8($a2)
/* AD3BC 800AC7BC 46003182 */  mul.s      $f6, $f6, $f0
/* AD3C0 800AC7C0 C4A4003C */  lwc1       $f4, 0x3c($a1)
/* AD3C4 800AC7C4 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD3C8 800AC7C8 46002102 */  mul.s      $f4, $f4, $f0
/* AD3CC 800AC7CC 46081080 */  add.s      $f2, $f2, $f8
/* AD3D0 800AC7D0 46061080 */  add.s      $f2, $f2, $f6
/* AD3D4 800AC7D4 46041080 */  add.s      $f2, $f2, $f4
/* AD3D8 800AC7D8 E482000C */  swc1       $f2, 0xc($a0)
/* AD3DC 800AC7DC C4A0000C */  lwc1       $f0, 0xc($a1)
/* AD3E0 800AC7E0 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD3E4 800AC7E4 46020002 */  mul.s      $f0, $f0, $f2
/* AD3E8 800AC7E8 C4A8001C */  lwc1       $f8, 0x1c($a1)
/* AD3EC 800AC7EC C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD3F0 800AC7F0 46024202 */  mul.s      $f8, $f8, $f2
/* AD3F4 800AC7F4 C4A6002C */  lwc1       $f6, 0x2c($a1)
/* AD3F8 800AC7F8 C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD3FC 800AC7FC 46023182 */  mul.s      $f6, $f6, $f2
/* AD400 800AC800 C4A4003C */  lwc1       $f4, 0x3c($a1)
/* AD404 800AC804 C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD408 800AC808 46022102 */  mul.s      $f4, $f4, $f2
/* AD40C 800AC80C 46080000 */  add.s      $f0, $f0, $f8
/* AD410 800AC810 46060000 */  add.s      $f0, $f0, $f6
/* AD414 800AC814 46040000 */  add.s      $f0, $f0, $f4
/* AD418 800AC818 E480001C */  swc1       $f0, 0x1c($a0)
/* AD41C 800AC81C C4A2000C */  lwc1       $f2, 0xc($a1)
/* AD420 800AC820 C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD424 800AC824 46001082 */  mul.s      $f2, $f2, $f0
/* AD428 800AC828 C4A8001C */  lwc1       $f8, 0x1c($a1)
/* AD42C 800AC82C C4C00024 */  lwc1       $f0, 0x24($a2)
/* AD430 800AC830 46004202 */  mul.s      $f8, $f8, $f0
/* AD434 800AC834 C4A6002C */  lwc1       $f6, 0x2c($a1)
/* AD438 800AC838 C4C00028 */  lwc1       $f0, 0x28($a2)
/* AD43C 800AC83C 46003182 */  mul.s      $f6, $f6, $f0
/* AD440 800AC840 C4A4003C */  lwc1       $f4, 0x3c($a1)
/* AD444 800AC844 C4C0002C */  lwc1       $f0, 0x2c($a2)
/* AD448 800AC848 46002102 */  mul.s      $f4, $f4, $f0
/* AD44C 800AC84C 46081080 */  add.s      $f2, $f2, $f8
/* AD450 800AC850 46061080 */  add.s      $f2, $f2, $f6
/* AD454 800AC854 46041080 */  add.s      $f2, $f2, $f4
/* AD458 800AC858 E482002C */  swc1       $f2, 0x2c($a0)
/* AD45C 800AC85C C4A0000C */  lwc1       $f0, 0xc($a1)
/* AD460 800AC860 C4C20030 */  lwc1       $f2, 0x30($a2)
/* AD464 800AC864 46020002 */  mul.s      $f0, $f0, $f2
/* AD468 800AC868 C4A8001C */  lwc1       $f8, 0x1c($a1)
/* AD46C 800AC86C C4C20034 */  lwc1       $f2, 0x34($a2)
/* AD470 800AC870 46024202 */  mul.s      $f8, $f8, $f2
/* AD474 800AC874 C4A6002C */  lwc1       $f6, 0x2c($a1)
/* AD478 800AC878 C4C20038 */  lwc1       $f2, 0x38($a2)
/* AD47C 800AC87C 46023182 */  mul.s      $f6, $f6, $f2
/* AD480 800AC880 C4A4003C */  lwc1       $f4, 0x3c($a1)
/* AD484 800AC884 C4C2003C */  lwc1       $f2, 0x3c($a2)
/* AD488 800AC888 46022102 */  mul.s      $f4, $f4, $f2
/* AD48C 800AC88C 46080000 */  add.s      $f0, $f0, $f8
/* AD490 800AC890 46060000 */  add.s      $f0, $f0, $f6
/* AD494 800AC894 46040000 */  add.s      $f0, $f0, $f4
/* AD498 800AC898 03E00008 */  jr         $ra
/* AD49C 800AC89C E480003C */   swc1      $f0, 0x3c($a0)

glabel func_800AC8A0
/* AD4A0 800AC8A0 C4A20000 */  lwc1       $f2, ($a1)
/* AD4A4 800AC8A4 C4C00000 */  lwc1       $f0, ($a2)
/* AD4A8 800AC8A8 46001082 */  mul.s      $f2, $f2, $f0
/* AD4AC 800AC8AC C4A60010 */  lwc1       $f6, 0x10($a1)
/* AD4B0 800AC8B0 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD4B4 800AC8B4 46003182 */  mul.s      $f6, $f6, $f0
/* AD4B8 800AC8B8 C4A40020 */  lwc1       $f4, 0x20($a1)
/* AD4BC 800AC8BC C4C00018 */  lwc1       $f0, 0x18($a2)
/* AD4C0 800AC8C0 46002102 */  mul.s      $f4, $f4, $f0
/* AD4C4 800AC8C4 46061080 */  add.s      $f2, $f2, $f6
/* AD4C8 800AC8C8 46041080 */  add.s      $f2, $f2, $f4
/* AD4CC 800AC8CC E4820000 */  swc1       $f2, ($a0)
/* AD4D0 800AC8D0 C4A00000 */  lwc1       $f0, ($a1)
/* AD4D4 800AC8D4 C4C20004 */  lwc1       $f2, 4($a2)
/* AD4D8 800AC8D8 46020002 */  mul.s      $f0, $f0, $f2
/* AD4DC 800AC8DC C4A60010 */  lwc1       $f6, 0x10($a1)
/* AD4E0 800AC8E0 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD4E4 800AC8E4 46023182 */  mul.s      $f6, $f6, $f2
/* AD4E8 800AC8E8 C4A40020 */  lwc1       $f4, 0x20($a1)
/* AD4EC 800AC8EC C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD4F0 800AC8F0 46022102 */  mul.s      $f4, $f4, $f2
/* AD4F4 800AC8F4 46060000 */  add.s      $f0, $f0, $f6
/* AD4F8 800AC8F8 46040000 */  add.s      $f0, $f0, $f4
/* AD4FC 800AC8FC E4800004 */  swc1       $f0, 4($a0)
/* AD500 800AC900 C4A20000 */  lwc1       $f2, ($a1)
/* AD504 800AC904 C4C00008 */  lwc1       $f0, 8($a2)
/* AD508 800AC908 46001082 */  mul.s      $f2, $f2, $f0
/* AD50C 800AC90C C4A60010 */  lwc1       $f6, 0x10($a1)
/* AD510 800AC910 C4C00014 */  lwc1       $f0, 0x14($a2)
/* AD514 800AC914 46003182 */  mul.s      $f6, $f6, $f0
/* AD518 800AC918 C4A40020 */  lwc1       $f4, 0x20($a1)
/* AD51C 800AC91C C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD520 800AC920 46002102 */  mul.s      $f4, $f4, $f0
/* AD524 800AC924 46061080 */  add.s      $f2, $f2, $f6
/* AD528 800AC928 46041080 */  add.s      $f2, $f2, $f4
/* AD52C 800AC92C E4820008 */  swc1       $f2, 8($a0)
/* AD530 800AC930 C4A00004 */  lwc1       $f0, 4($a1)
/* AD534 800AC934 C4C20000 */  lwc1       $f2, ($a2)
/* AD538 800AC938 46020002 */  mul.s      $f0, $f0, $f2
/* AD53C 800AC93C C4A60014 */  lwc1       $f6, 0x14($a1)
/* AD540 800AC940 C4C2000C */  lwc1       $f2, 0xc($a2)
/* AD544 800AC944 46023182 */  mul.s      $f6, $f6, $f2
/* AD548 800AC948 C4A40024 */  lwc1       $f4, 0x24($a1)
/* AD54C 800AC94C C4C20018 */  lwc1       $f2, 0x18($a2)
/* AD550 800AC950 46022102 */  mul.s      $f4, $f4, $f2
/* AD554 800AC954 46060000 */  add.s      $f0, $f0, $f6
/* AD558 800AC958 46040000 */  add.s      $f0, $f0, $f4
/* AD55C 800AC95C E480000C */  swc1       $f0, 0xc($a0)
/* AD560 800AC960 C4A20004 */  lwc1       $f2, 4($a1)
/* AD564 800AC964 C4C00004 */  lwc1       $f0, 4($a2)
/* AD568 800AC968 46001082 */  mul.s      $f2, $f2, $f0
/* AD56C 800AC96C C4A60014 */  lwc1       $f6, 0x14($a1)
/* AD570 800AC970 C4C00010 */  lwc1       $f0, 0x10($a2)
/* AD574 800AC974 46003182 */  mul.s      $f6, $f6, $f0
/* AD578 800AC978 C4A40024 */  lwc1       $f4, 0x24($a1)
/* AD57C 800AC97C C4C0001C */  lwc1       $f0, 0x1c($a2)
/* AD580 800AC980 46002102 */  mul.s      $f4, $f4, $f0
/* AD584 800AC984 46061080 */  add.s      $f2, $f2, $f6
/* AD588 800AC988 46041080 */  add.s      $f2, $f2, $f4
/* AD58C 800AC98C E4820010 */  swc1       $f2, 0x10($a0)
/* AD590 800AC990 C4A00004 */  lwc1       $f0, 4($a1)
/* AD594 800AC994 C4C20008 */  lwc1       $f2, 8($a2)
/* AD598 800AC998 46020002 */  mul.s      $f0, $f0, $f2
/* AD59C 800AC99C C4A60014 */  lwc1       $f6, 0x14($a1)
/* AD5A0 800AC9A0 C4C20014 */  lwc1       $f2, 0x14($a2)
/* AD5A4 800AC9A4 46023182 */  mul.s      $f6, $f6, $f2
/* AD5A8 800AC9A8 C4A40024 */  lwc1       $f4, 0x24($a1)
/* AD5AC 800AC9AC C4C20020 */  lwc1       $f2, 0x20($a2)
/* AD5B0 800AC9B0 46022102 */  mul.s      $f4, $f4, $f2
/* AD5B4 800AC9B4 46060000 */  add.s      $f0, $f0, $f6
/* AD5B8 800AC9B8 46040000 */  add.s      $f0, $f0, $f4
/* AD5BC 800AC9BC E4800014 */  swc1       $f0, 0x14($a0)
/* AD5C0 800AC9C0 C4A20008 */  lwc1       $f2, 8($a1)
/* AD5C4 800AC9C4 C4C00000 */  lwc1       $f0, ($a2)
/* AD5C8 800AC9C8 46001082 */  mul.s      $f2, $f2, $f0
/* AD5CC 800AC9CC C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD5D0 800AC9D0 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AD5D4 800AC9D4 46003182 */  mul.s      $f6, $f6, $f0
/* AD5D8 800AC9D8 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD5DC 800AC9DC C4C00018 */  lwc1       $f0, 0x18($a2)
/* AD5E0 800AC9E0 46002102 */  mul.s      $f4, $f4, $f0
/* AD5E4 800AC9E4 46061080 */  add.s      $f2, $f2, $f6
/* AD5E8 800AC9E8 46041080 */  add.s      $f2, $f2, $f4
/* AD5EC 800AC9EC E4820018 */  swc1       $f2, 0x18($a0)
/* AD5F0 800AC9F0 C4A00008 */  lwc1       $f0, 8($a1)
/* AD5F4 800AC9F4 C4C20004 */  lwc1       $f2, 4($a2)
/* AD5F8 800AC9F8 46020002 */  mul.s      $f0, $f0, $f2
/* AD5FC 800AC9FC C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD600 800ACA00 C4C20010 */  lwc1       $f2, 0x10($a2)
/* AD604 800ACA04 46023182 */  mul.s      $f6, $f6, $f2
/* AD608 800ACA08 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD60C 800ACA0C C4C2001C */  lwc1       $f2, 0x1c($a2)
/* AD610 800ACA10 46022102 */  mul.s      $f4, $f4, $f2
/* AD614 800ACA14 46060000 */  add.s      $f0, $f0, $f6
/* AD618 800ACA18 46040000 */  add.s      $f0, $f0, $f4
/* AD61C 800ACA1C E480001C */  swc1       $f0, 0x1c($a0)
/* AD620 800ACA20 C4A20008 */  lwc1       $f2, 8($a1)
/* AD624 800ACA24 C4C00008 */  lwc1       $f0, 8($a2)
/* AD628 800ACA28 46001082 */  mul.s      $f2, $f2, $f0
/* AD62C 800ACA2C C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD630 800ACA30 C4C00014 */  lwc1       $f0, 0x14($a2)
/* AD634 800ACA34 46003182 */  mul.s      $f6, $f6, $f0
/* AD638 800ACA38 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD63C 800ACA3C C4C00020 */  lwc1       $f0, 0x20($a2)
/* AD640 800ACA40 46002102 */  mul.s      $f4, $f4, $f0
/* AD644 800ACA44 46061080 */  add.s      $f2, $f2, $f6
/* AD648 800ACA48 46041080 */  add.s      $f2, $f2, $f4
/* AD64C 800ACA4C 03E00008 */  jr         $ra
/* AD650 800ACA50 E4820020 */   swc1      $f2, 0x20($a0)

glabel func_800ACA54
/* AD654 800ACA54 C4A20000 */  lwc1       $f2, ($a1)
/* AD658 800ACA58 C4C00000 */  lwc1       $f0, ($a2)
/* AD65C 800ACA5C 46001082 */  mul.s      $f2, $f2, $f0
/* AD660 800ACA60 C4A60010 */  lwc1       $f6, 0x10($a1)
/* AD664 800ACA64 C4C00004 */  lwc1       $f0, 4($a2)
/* AD668 800ACA68 46003182 */  mul.s      $f6, $f6, $f0
/* AD66C 800ACA6C C4A40020 */  lwc1       $f4, 0x20($a1)
/* AD670 800ACA70 C4C00008 */  lwc1       $f0, 8($a2)
/* AD674 800ACA74 46002102 */  mul.s      $f4, $f4, $f0
/* AD678 800ACA78 46061080 */  add.s      $f2, $f2, $f6
/* AD67C 800ACA7C 46041080 */  add.s      $f2, $f2, $f4
/* AD680 800ACA80 C4A00030 */  lwc1       $f0, 0x30($a1)
/* AD684 800ACA84 46001080 */  add.s      $f2, $f2, $f0
/* AD688 800ACA88 E4820000 */  swc1       $f2, ($a0)
/* AD68C 800ACA8C C4A00004 */  lwc1       $f0, 4($a1)
/* AD690 800ACA90 C4C20000 */  lwc1       $f2, ($a2)
/* AD694 800ACA94 46020002 */  mul.s      $f0, $f0, $f2
/* AD698 800ACA98 C4A60014 */  lwc1       $f6, 0x14($a1)
/* AD69C 800ACA9C C4C20004 */  lwc1       $f2, 4($a2)
/* AD6A0 800ACAA0 46023182 */  mul.s      $f6, $f6, $f2
/* AD6A4 800ACAA4 C4A40024 */  lwc1       $f4, 0x24($a1)
/* AD6A8 800ACAA8 C4C20008 */  lwc1       $f2, 8($a2)
/* AD6AC 800ACAAC 46022102 */  mul.s      $f4, $f4, $f2
/* AD6B0 800ACAB0 46060000 */  add.s      $f0, $f0, $f6
/* AD6B4 800ACAB4 46040000 */  add.s      $f0, $f0, $f4
/* AD6B8 800ACAB8 C4A20034 */  lwc1       $f2, 0x34($a1)
/* AD6BC 800ACABC 46020000 */  add.s      $f0, $f0, $f2
/* AD6C0 800ACAC0 E4800004 */  swc1       $f0, 4($a0)
/* AD6C4 800ACAC4 C4A20008 */  lwc1       $f2, 8($a1)
/* AD6C8 800ACAC8 C4C00000 */  lwc1       $f0, ($a2)
/* AD6CC 800ACACC 46001082 */  mul.s      $f2, $f2, $f0
/* AD6D0 800ACAD0 C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD6D4 800ACAD4 C4C00004 */  lwc1       $f0, 4($a2)
/* AD6D8 800ACAD8 46003182 */  mul.s      $f6, $f6, $f0
/* AD6DC 800ACADC C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD6E0 800ACAE0 C4C00008 */  lwc1       $f0, 8($a2)
/* AD6E4 800ACAE4 46002102 */  mul.s      $f4, $f4, $f0
/* AD6E8 800ACAE8 46061080 */  add.s      $f2, $f2, $f6
/* AD6EC 800ACAEC 46041080 */  add.s      $f2, $f2, $f4
/* AD6F0 800ACAF0 C4A00038 */  lwc1       $f0, 0x38($a1)
/* AD6F4 800ACAF4 46001080 */  add.s      $f2, $f2, $f0
/* AD6F8 800ACAF8 03E00008 */  jr         $ra
/* AD6FC 800ACAFC E4820008 */   swc1      $f2, 8($a0)

glabel some_float_multi_math
/* AD700 800ACB00 C4A20000 */  lwc1       $f2, ($a1)
/* AD704 800ACB04 C4C00000 */  lwc1       $f0, ($a2)
/* AD708 800ACB08 46001082 */  mul.s      $f2, $f2, $f0
/* AD70C 800ACB0C C4A60010 */  lwc1       $f6, 0x10($a1)
/* AD710 800ACB10 C4C00004 */  lwc1       $f0, 4($a2)
/* AD714 800ACB14 46003182 */  mul.s      $f6, $f6, $f0
/* AD718 800ACB18 C4A40020 */  lwc1       $f4, 0x20($a1)
/* AD71C 800ACB1C C4C00008 */  lwc1       $f0, 8($a2)
/* AD720 800ACB20 46002102 */  mul.s      $f4, $f4, $f0
/* AD724 800ACB24 46061080 */  add.s      $f2, $f2, $f6
/* AD728 800ACB28 46041080 */  add.s      $f2, $f2, $f4
/* AD72C 800ACB2C E4820000 */  swc1       $f2, ($a0)
/* AD730 800ACB30 C4A00004 */  lwc1       $f0, 4($a1)
/* AD734 800ACB34 C4C20000 */  lwc1       $f2, ($a2)
/* AD738 800ACB38 46020002 */  mul.s      $f0, $f0, $f2
/* AD73C 800ACB3C C4A60014 */  lwc1       $f6, 0x14($a1)
/* AD740 800ACB40 C4C20004 */  lwc1       $f2, 4($a2)
/* AD744 800ACB44 46023182 */  mul.s      $f6, $f6, $f2
/* AD748 800ACB48 C4A40024 */  lwc1       $f4, 0x24($a1)
/* AD74C 800ACB4C C4C20008 */  lwc1       $f2, 8($a2)
/* AD750 800ACB50 46022102 */  mul.s      $f4, $f4, $f2
/* AD754 800ACB54 46060000 */  add.s      $f0, $f0, $f6
/* AD758 800ACB58 46040000 */  add.s      $f0, $f0, $f4
/* AD75C 800ACB5C E4800004 */  swc1       $f0, 4($a0)
/* AD760 800ACB60 C4A20008 */  lwc1       $f2, 8($a1)
/* AD764 800ACB64 C4C00000 */  lwc1       $f0, ($a2)
/* AD768 800ACB68 46001082 */  mul.s      $f2, $f2, $f0
/* AD76C 800ACB6C C4A60018 */  lwc1       $f6, 0x18($a1)
/* AD770 800ACB70 C4C00004 */  lwc1       $f0, 4($a2)
/* AD774 800ACB74 46003182 */  mul.s      $f6, $f6, $f0
/* AD778 800ACB78 C4A40028 */  lwc1       $f4, 0x28($a1)
/* AD77C 800ACB7C C4C00008 */  lwc1       $f0, 8($a2)
/* AD780 800ACB80 46002102 */  mul.s      $f4, $f4, $f0
/* AD784 800ACB84 46061080 */  add.s      $f2, $f2, $f6
/* AD788 800ACB88 46041080 */  add.s      $f2, $f2, $f4
/* AD78C 800ACB8C 03E00008 */  jr         $ra
/* AD790 800ACB90 E4820008 */   swc1      $f2, 8($a0)

glabel NOOP_800acb94
/* AD794 800ACB94 03E00008 */  jr         $ra
/* AD798 800ACB98 00000000 */   nop

glabel NOOP_800ACB9C
/* AD79C 800ACB9C 03E00008 */  jr         $ra
/* AD7A0 800ACBA0 00000000 */   nop

glabel func_800ACBA4
/* AD7A4 800ACBA4 00A03821 */  addu       $a3, $a1, $zero
/* AD7A8 800ACBA8 24E90020 */  addiu      $t1, $a3, 0x20
/* AD7AC 800ACBAC 00803021 */  addu       $a2, $a0, $zero
/* AD7B0 800ACBB0 24C80008 */  addiu      $t0, $a2, 8
/* AD7B4 800ACBB4 00001821 */  addu       $v1, $zero, $zero
/* AD7B8 800ACBB8 3C0CFFFF */  lui        $t4, 0xffff
/* AD7BC 800ACBBC 3C01800E */  lui        $at, %hi(D_800E36B8)
/* AD7C0 800ACBC0 C42436B8 */  lwc1       $f4, %lo(D_800E36B8)($at)
/* AD7C4 800ACBC4 246B0001 */  addiu      $t3, $v1, 1
.L800ACBC8:
/* AD7C8 800ACBC8 240A0001 */  addiu      $t2, $zero, 1
.L800ACBCC:
/* AD7CC 800ACBCC 8CE30000 */  lw         $v1, ($a3)
/* AD7D0 800ACBD0 8D250000 */  lw         $a1, ($t1)
/* AD7D4 800ACBD4 25290004 */  addiu      $t1, $t1, 4
/* AD7D8 800ACBD8 006C2024 */  and        $a0, $v1, $t4
/* AD7DC 800ACBDC 00051402 */  srl        $v0, $a1, 0x10
/* AD7E0 800ACBE0 00822025 */  or         $a0, $a0, $v0
/* AD7E4 800ACBE4 00031C00 */  sll        $v1, $v1, 0x10
/* AD7E8 800ACBE8 44841000 */  mtc1       $a0, $f2
/* AD7EC 800ACBEC 468010A0 */  cvt.s.w    $f2, $f2
/* AD7F0 800ACBF0 46041082 */  mul.s      $f2, $f2, $f4
/* AD7F4 800ACBF4 006C1824 */  and        $v1, $v1, $t4
/* AD7F8 800ACBF8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* AD7FC 800ACBFC 00651825 */  or         $v1, $v1, $a1
/* AD800 800ACC00 44830000 */  mtc1       $v1, $f0
/* AD804 800ACC04 46800020 */  cvt.s.w    $f0, $f0
/* AD808 800ACC08 46040002 */  mul.s      $f0, $f0, $f4
/* AD80C 800ACC0C 24E70004 */  addiu      $a3, $a3, 4
/* AD810 800ACC10 254AFFFF */  addiu      $t2, $t2, -1
/* AD814 800ACC14 E4C20000 */  swc1       $f2, ($a2)
/* AD818 800ACC18 24C60008 */  addiu      $a2, $a2, 8
/* AD81C 800ACC1C E5000000 */  swc1       $f0, ($t0)
/* AD820 800ACC20 0541FFEA */  bgez       $t2, .L800ACBCC
/* AD824 800ACC24 25080008 */   addiu     $t0, $t0, 8
/* AD828 800ACC28 01601821 */  addu       $v1, $t3, $zero
/* AD82C 800ACC2C 28620004 */  slti       $v0, $v1, 4
/* AD830 800ACC30 1440FFE5 */  bnez       $v0, .L800ACBC8
/* AD834 800ACC34 246B0001 */   addiu     $t3, $v1, 1
/* AD838 800ACC38 03E00008 */  jr         $ra
/* AD83C 800ACC3C 00000000 */   nop

glabel ofunc_sub_800acc40
/* AD840 800ACC40 3C01800E */  lui        $at, %hi(D_800E36BC)
/* AD844 800ACC44 C42036BC */  lwc1       $f0, %lo(D_800E36BC)($at)
/* AD848 800ACC48 44861000 */  mtc1       $a2, $f2
/* AD84C 800ACC4C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* AD850 800ACC50 AFB00010 */  sw         $s0, 0x10($sp)
/* AD854 800ACC54 00808021 */  addu       $s0, $a0, $zero
/* AD858 800ACC58 AFB10014 */  sw         $s1, 0x14($sp)
/* AD85C 800ACC5C 00A08821 */  addu       $s1, $a1, $zero
/* AD860 800ACC60 F7B60028 */  sdc1       $f22, 0x28($sp)
/* AD864 800ACC64 46001582 */  mul.s      $f22, $f2, $f0
/* AD868 800ACC68 AFBF0018 */  sw         $ra, 0x18($sp)
/* AD86C 800ACC6C F7BA0038 */  sdc1       $f26, 0x38($sp)
/* AD870 800ACC70 F7B80030 */  sdc1       $f24, 0x30($sp)
/* AD874 800ACC74 F7B40020 */  sdc1       $f20, 0x20($sp)
/* AD878 800ACC78 0C02FB50 */  jal        __cosf
/* AD87C 800ACC7C 4600B306 */   mov.s     $f12, $f22
/* AD880 800ACC80 4600B306 */  mov.s      $f12, $f22
/* AD884 800ACC84 0C03328C */  jal        __sinf
/* AD888 800ACC88 46000506 */   mov.s     $f20, $f0
/* AD88C 800ACC8C C6320000 */  lwc1       $f18, ($s1)
/* AD890 800ACC90 46120482 */  mul.s      $f18, $f0, $f18
/* AD894 800ACC94 460093A1 */  cvt.d.s    $f14, $f18
/* AD898 800ACC98 462E7300 */  add.d      $f12, $f14, $f14
/* AD89C 800ACC9C 4600A221 */  cvt.d.s    $f8, $f20
/* AD8A0 800ACCA0 46286602 */  mul.d      $f24, $f12, $f8
/* AD8A4 800ACCA4 C6300004 */  lwc1       $f16, 4($s1)
/* AD8A8 800ACCA8 46100402 */  mul.s      $f16, $f0, $f16
/* AD8AC 800ACCAC 46008121 */  cvt.d.s    $f4, $f16
/* AD8B0 800ACCB0 46242280 */  add.d      $f10, $f4, $f4
/* AD8B4 800ACCB4 46285582 */  mul.d      $f22, $f10, $f8
/* AD8B8 800ACCB8 C6260008 */  lwc1       $f6, 8($s1)
/* AD8BC 800ACCBC 46060002 */  mul.s      $f0, $f0, $f6
/* AD8C0 800ACCC0 460000A1 */  cvt.d.s    $f2, $f0
/* AD8C4 800ACCC4 46221180 */  add.d      $f6, $f2, $f2
/* AD8C8 800ACCC8 46283202 */  mul.d      $f8, $f6, $f8
/* AD8CC 800ACCCC 00000000 */  nop
/* AD8D0 800ACCD0 46246302 */  mul.d      $f12, $f12, $f4
/* AD8D4 800ACCD4 00000000 */  nop
/* AD8D8 800ACCD8 46225282 */  mul.d      $f10, $f10, $f2
/* AD8DC 800ACCDC 00000000 */  nop
/* AD8E0 800ACCE0 462E3182 */  mul.d      $f6, $f6, $f14
/* AD8E4 800ACCE4 00000000 */  nop
/* AD8E8 800ACCE8 4614A502 */  mul.s      $f20, $f20, $f20
/* AD8EC 800ACCEC 00000000 */  nop
/* AD8F0 800ACCF0 46129482 */  mul.s      $f18, $f18, $f18
/* AD8F4 800ACCF4 00000000 */  nop
/* AD8F8 800ACCF8 46108402 */  mul.s      $f16, $f16, $f16
/* AD8FC 800ACCFC 00000000 */  nop
/* AD900 800ACD00 46000002 */  mul.s      $f0, $f0, $f0
/* AD904 800ACD04 4612A100 */  add.s      $f4, $f20, $f18
/* AD908 800ACD08 4612A501 */  sub.s      $f20, $f20, $f18
/* AD90C 800ACD0C 46102101 */  sub.s      $f4, $f4, $f16
/* AD910 800ACD10 4610A080 */  add.s      $f2, $f20, $f16
/* AD914 800ACD14 4610A501 */  sub.s      $f20, $f20, $f16
/* AD918 800ACD18 46002101 */  sub.s      $f4, $f4, $f0
/* AD91C 800ACD1C 46001081 */  sub.s      $f2, $f2, $f0
/* AD920 800ACD20 4600A500 */  add.s      $f20, $f20, $f0
/* AD924 800ACD24 4620B5A0 */  cvt.s.d    $f22, $f22
/* AD928 800ACD28 462031A0 */  cvt.s.d    $f6, $f6
/* AD92C 800ACD2C 46163380 */  add.s      $f14, $f6, $f22
/* AD930 800ACD30 4620C620 */  cvt.s.d    $f24, $f24
/* AD934 800ACD34 462052A0 */  cvt.s.d    $f10, $f10
/* AD938 800ACD38 46185001 */  sub.s      $f0, $f10, $f24
/* AD93C 800ACD3C 8FBF0018 */  lw         $ra, 0x18($sp)
/* AD940 800ACD40 8FB10014 */  lw         $s1, 0x14($sp)
/* AD944 800ACD44 46163181 */  sub.s      $f6, $f6, $f22
/* AD948 800ACD48 46204220 */  cvt.s.d    $f8, $f8
/* AD94C 800ACD4C 46206320 */  cvt.s.d    $f12, $f12
/* AD950 800ACD50 46185280 */  add.s      $f10, $f10, $f24
/* AD954 800ACD54 D7B80030 */  ldc1       $f24, 0x30($sp)
/* AD958 800ACD58 D7B60028 */  ldc1       $f22, 0x28($sp)
/* AD95C 800ACD5C 46086681 */  sub.s      $f26, $f12, $f8
/* AD960 800ACD60 E6140028 */  swc1       $f20, 0x28($s0)
/* AD964 800ACD64 D7B40020 */  ldc1       $f20, 0x20($sp)
/* AD968 800ACD68 46086300 */  add.s      $f12, $f12, $f8
/* AD96C 800ACD6C E6040000 */  swc1       $f4, ($s0)
/* AD970 800ACD70 E6020014 */  swc1       $f2, 0x14($s0)
/* AD974 800ACD74 E61A0010 */  swc1       $f26, 0x10($s0)
/* AD978 800ACD78 E60E0020 */  swc1       $f14, 0x20($s0)
/* AD97C 800ACD7C E60C0004 */  swc1       $f12, 4($s0)
/* AD980 800ACD80 E6000024 */  swc1       $f0, 0x24($s0)
/* AD984 800ACD84 E6060008 */  swc1       $f6, 8($s0)
/* AD988 800ACD88 E60A0018 */  swc1       $f10, 0x18($s0)
/* AD98C 800ACD8C 8FB00010 */  lw         $s0, 0x10($sp)
/* AD990 800ACD90 D7BA0038 */  ldc1       $f26, 0x38($sp)
/* AD994 800ACD94 03E00008 */  jr         $ra
/* AD998 800ACD98 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800ACD9C
/* AD99C 800ACD9C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* AD9A0 800ACDA0 AFB00050 */  sw         $s0, 0x50($sp)
/* AD9A4 800ACDA4 00808021 */  addu       $s0, $a0, $zero
/* AD9A8 800ACDA8 AFBF0054 */  sw         $ra, 0x54($sp)
/* AD9AC 800ACDAC 8CA20000 */  lw         $v0, ($a1)
/* AD9B0 800ACDB0 8CA30004 */  lw         $v1, 4($a1)
/* AD9B4 800ACDB4 8CA60008 */  lw         $a2, 8($a1)
/* AD9B8 800ACDB8 27A40010 */  addiu      $a0, $sp, 0x10
/* AD9BC 800ACDBC AFA20010 */  sw         $v0, 0x10($sp)
/* AD9C0 800ACDC0 AFA30014 */  sw         $v1, 0x14($sp)
/* AD9C4 800ACDC4 0C02ABBB */  jal        vec3_normalize
/* AD9C8 800ACDC8 AFA60018 */   sw        $a2, 0x18($sp)
/* AD9CC 800ACDCC 02002021 */  addu       $a0, $s0, $zero
/* AD9D0 800ACDD0 44060000 */  mfc1       $a2, $f0
/* AD9D4 800ACDD4 0C02B310 */  jal        ofunc_sub_800acc40
/* AD9D8 800ACDD8 27A50010 */   addiu     $a1, $sp, 0x10
/* AD9DC 800ACDDC 3C01800E */  lui        $at, %hi(D_800E36C0)
/* AD9E0 800ACDE0 C42036C0 */  lwc1       $f0, %lo(D_800E36C0)($at)
/* AD9E4 800ACDE4 8FBF0054 */  lw         $ra, 0x54($sp)
/* AD9E8 800ACDE8 AE000030 */  sw         $zero, 0x30($s0)
/* AD9EC 800ACDEC AE000034 */  sw         $zero, 0x34($s0)
/* AD9F0 800ACDF0 AE000038 */  sw         $zero, 0x38($s0)
/* AD9F4 800ACDF4 AE00000C */  sw         $zero, 0xc($s0)
/* AD9F8 800ACDF8 AE00001C */  sw         $zero, 0x1c($s0)
/* AD9FC 800ACDFC AE00002C */  sw         $zero, 0x2c($s0)
/* ADA00 800ACE00 E600003C */  swc1       $f0, 0x3c($s0)
/* ADA04 800ACE04 8FB00050 */  lw         $s0, 0x50($sp)
/* ADA08 800ACE08 03E00008 */  jr         $ra
/* ADA0C 800ACE0C 27BD0058 */   addiu     $sp, $sp, 0x58

glabel ofunc_sub_800ace10
/* ADA10 800ACE10 3C01800E */  lui        $at, %hi(DegToRad)
/* ADA14 800ACE14 C42036C4 */  lwc1       $f0, %lo(DegToRad)($at)
/* ADA18 800ACE18 44851000 */  mtc1       $a1, $f2
/* ADA1C 800ACE1C 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* ADA20 800ACE20 F7B40018 */  sdc1       $f20, 0x18($sp)
/* ADA24 800ACE24 46001502 */  mul.s      $f20, $f2, $f0
/* ADA28 800ACE28 44861000 */  mtc1       $a2, $f2
/* ADA2C 800ACE2C AFB00010 */  sw         $s0, 0x10($sp)
/* ADA30 800ACE30 F7B60020 */  sdc1       $f22, 0x20($sp)
/* ADA34 800ACE34 46001582 */  mul.s      $f22, $f2, $f0
/* ADA38 800ACE38 44871000 */  mtc1       $a3, $f2
/* ADA3C 800ACE3C 00808021 */  addu       $s0, $a0, $zero
/* ADA40 800ACE40 AFBF0014 */  sw         $ra, 0x14($sp)
/* ADA44 800ACE44 F7BE0040 */  sdc1       $f30, 0x40($sp)
/* ADA48 800ACE48 F7BC0038 */  sdc1       $f28, 0x38($sp)
/* ADA4C 800ACE4C F7BA0030 */  sdc1       $f26, 0x30($sp)
/* ADA50 800ACE50 F7B80028 */  sdc1       $f24, 0x28($sp)
/* ADA54 800ACE54 46001782 */  mul.s      $f30, $f2, $f0
/* ADA58 800ACE58 0C02FB50 */  jal        __cosf
/* ADA5C 800ACE5C 4600A306 */   mov.s     $f12, $f20
/* ADA60 800ACE60 46000706 */  mov.s      $f28, $f0
/* ADA64 800ACE64 0C02FB50 */  jal        __cosf
/* ADA68 800ACE68 4600B306 */   mov.s     $f12, $f22
/* ADA6C 800ACE6C 46000686 */  mov.s      $f26, $f0
/* ADA70 800ACE70 0C02FB50 */  jal        __cosf
/* ADA74 800ACE74 4600F306 */   mov.s     $f12, $f30
/* ADA78 800ACE78 4600A306 */  mov.s      $f12, $f20
/* ADA7C 800ACE7C 0C03328C */  jal        __sinf
/* ADA80 800ACE80 46000606 */   mov.s     $f24, $f0
/* ADA84 800ACE84 4600B306 */  mov.s      $f12, $f22
/* ADA88 800ACE88 0C03328C */  jal        __sinf
/* ADA8C 800ACE8C 46000506 */   mov.s     $f20, $f0
/* ADA90 800ACE90 4600F306 */  mov.s      $f12, $f30
/* ADA94 800ACE94 0C03328C */  jal        __sinf
/* ADA98 800ACE98 46000586 */   mov.s     $f22, $f0
/* ADA9C 800ACE9C 4618E282 */  mul.s      $f10, $f28, $f24
/* ADAA0 800ACEA0 00000000 */  nop
/* ADAA4 800ACEA4 4616A182 */  mul.s      $f6, $f20, $f22
/* ADAA8 800ACEA8 4600E207 */  neg.s      $f8, $f28
/* ADAAC 800ACEAC 46004202 */  mul.s      $f8, $f8, $f0
/* ADAB0 800ACEB0 00000000 */  nop
/* ADAB4 800ACEB4 461AA382 */  mul.s      $f14, $f20, $f26
/* ADAB8 800ACEB8 00000000 */  nop
/* ADABC 800ACEBC 4600D482 */  mul.s      $f18, $f26, $f0
/* ADAC0 800ACEC0 00000000 */  nop
/* ADAC4 800ACEC4 4618D782 */  mul.s      $f30, $f26, $f24
/* ADAC8 800ACEC8 00000000 */  nop
/* ADACC 800ACECC 4616E102 */  mul.s      $f4, $f28, $f22
/* ADAD0 800ACED0 4600A087 */  neg.s      $f2, $f20
/* ADAD4 800ACED4 46181082 */  mul.s      $f2, $f2, $f24
/* ADAD8 800ACED8 00000000 */  nop
/* ADADC 800ACEDC 4600A502 */  mul.s      $f20, $f20, $f0
/* ADAE0 800ACEE0 00000000 */  nop
/* ADAE4 800ACEE4 461AE702 */  mul.s      $f28, $f28, $f26
/* ADAE8 800ACEE8 00000000 */  nop
/* ADAEC 800ACEEC 46003402 */  mul.s      $f16, $f6, $f0
/* ADAF0 800ACEF0 00000000 */  nop
/* ADAF4 800ACEF4 46183182 */  mul.s      $f6, $f6, $f24
/* ADAF8 800ACEF8 00000000 */  nop
/* ADAFC 800ACEFC 46002302 */  mul.s      $f12, $f4, $f0
/* ADB00 800ACF00 8FBF0014 */  lw         $ra, 0x14($sp)
/* ADB04 800ACF04 D7BA0030 */  ldc1       $f26, 0x30($sp)
/* ADB08 800ACF08 4600B587 */  neg.s      $f22, $f22
/* ADB0C 800ACF0C E6160024 */  swc1       $f22, 0x24($s0)
/* ADB10 800ACF10 46182102 */  mul.s      $f4, $f4, $f24
/* ADB14 800ACF14 D7B60020 */  ldc1       $f22, 0x20($sp)
/* ADB18 800ACF18 E61E0014 */  swc1       $f30, 0x14($s0)
/* ADB1C 800ACF1C D7BE0040 */  ldc1       $f30, 0x40($sp)
/* ADB20 800ACF20 46105280 */  add.s      $f10, $f10, $f16
/* ADB24 800ACF24 E61C0028 */  swc1       $f28, 0x28($s0)
/* ADB28 800ACF28 46064200 */  add.s      $f8, $f8, $f6
/* ADB2C 800ACF2C D7BC0038 */  ldc1       $f28, 0x38($sp)
/* ADB30 800ACF30 D7B80028 */  ldc1       $f24, 0x28($sp)
/* ADB34 800ACF34 460C1080 */  add.s      $f2, $f2, $f12
/* ADB38 800ACF38 E60E0020 */  swc1       $f14, 0x20($s0)
/* ADB3C 800ACF3C E6120004 */  swc1       $f18, 4($s0)
/* ADB40 800ACF40 4604A500 */  add.s      $f20, $f20, $f4
/* ADB44 800ACF44 E60A0000 */  swc1       $f10, ($s0)
/* ADB48 800ACF48 E6080010 */  swc1       $f8, 0x10($s0)
/* ADB4C 800ACF4C E6020008 */  swc1       $f2, 8($s0)
/* ADB50 800ACF50 E6140018 */  swc1       $f20, 0x18($s0)
/* ADB54 800ACF54 8FB00010 */  lw         $s0, 0x10($sp)
/* ADB58 800ACF58 D7B40018 */  ldc1       $f20, 0x18($sp)
/* ADB5C 800ACF5C 03E00008 */  jr         $ra
/* ADB60 800ACF60 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800ACF64
/* ADB64 800ACF64 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* ADB68 800ACF68 AFB00010 */  sw         $s0, 0x10($sp)
/* ADB6C 800ACF6C AFBF0014 */  sw         $ra, 0x14($sp)
/* ADB70 800ACF70 0C02B384 */  jal        ofunc_sub_800ace10
/* ADB74 800ACF74 00808021 */   addu      $s0, $a0, $zero
/* ADB78 800ACF78 3C01800E */  lui        $at, %hi(D_800E36C8)
/* ADB7C 800ACF7C C42036C8 */  lwc1       $f0, %lo(D_800E36C8)($at)
/* ADB80 800ACF80 8FBF0014 */  lw         $ra, 0x14($sp)
/* ADB84 800ACF84 AE000030 */  sw         $zero, 0x30($s0)
/* ADB88 800ACF88 AE000034 */  sw         $zero, 0x34($s0)
/* ADB8C 800ACF8C AE000038 */  sw         $zero, 0x38($s0)
/* ADB90 800ACF90 AE00000C */  sw         $zero, 0xc($s0)
/* ADB94 800ACF94 AE00001C */  sw         $zero, 0x1c($s0)
/* ADB98 800ACF98 AE00002C */  sw         $zero, 0x2c($s0)
/* ADB9C 800ACF9C E600003C */  swc1       $f0, 0x3c($s0)
/* ADBA0 800ACFA0 8FB00010 */  lw         $s0, 0x10($sp)
/* ADBA4 800ACFA4 03E00008 */  jr         $ra
/* ADBA8 800ACFA8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel matrix_scale
/* ADBAC 800ACFAC 44850000 */  mtc1       $a1, $f0
/* ADBB0 800ACFB0 C4920000 */  lwc1       $f18, ($a0)
/* ADBB4 800ACFB4 46009482 */  mul.s      $f18, $f18, $f0
/* ADBB8 800ACFB8 C4900004 */  lwc1       $f16, 4($a0)
/* ADBBC 800ACFBC 46008402 */  mul.s      $f16, $f16, $f0
/* ADBC0 800ACFC0 C48E0008 */  lwc1       $f14, 8($a0)
/* ADBC4 800ACFC4 46007382 */  mul.s      $f14, $f14, $f0
/* ADBC8 800ACFC8 44861000 */  mtc1       $a2, $f2
/* ADBCC 800ACFCC C48A0010 */  lwc1       $f10, 0x10($a0)
/* ADBD0 800ACFD0 46025282 */  mul.s      $f10, $f10, $f2
/* ADBD4 800ACFD4 C48C0014 */  lwc1       $f12, 0x14($a0)
/* ADBD8 800ACFD8 46026302 */  mul.s      $f12, $f12, $f2
/* ADBDC 800ACFDC C4880018 */  lwc1       $f8, 0x18($a0)
/* ADBE0 800ACFE0 46024202 */  mul.s      $f8, $f8, $f2
/* ADBE4 800ACFE4 C4860020 */  lwc1       $f6, 0x20($a0)
/* ADBE8 800ACFE8 44870000 */  mtc1       $a3, $f0
/* ADBEC 800ACFEC 46003182 */  mul.s      $f6, $f6, $f0
/* ADBF0 800ACFF0 C4820024 */  lwc1       $f2, 0x24($a0)
/* ADBF4 800ACFF4 46001082 */  mul.s      $f2, $f2, $f0
/* ADBF8 800ACFF8 C4840028 */  lwc1       $f4, 0x28($a0)
/* ADBFC 800ACFFC 46002102 */  mul.s      $f4, $f4, $f0
/* ADC00 800AD000 E4920000 */  swc1       $f18, ($a0)
/* ADC04 800AD004 E4900004 */  swc1       $f16, 4($a0)
/* ADC08 800AD008 E48E0008 */  swc1       $f14, 8($a0)
/* ADC0C 800AD00C E48A0010 */  swc1       $f10, 0x10($a0)
/* ADC10 800AD010 E48C0014 */  swc1       $f12, 0x14($a0)
/* ADC14 800AD014 E4880018 */  swc1       $f8, 0x18($a0)
/* ADC18 800AD018 E4860020 */  swc1       $f6, 0x20($a0)
/* ADC1C 800AD01C E4820024 */  swc1       $f2, 0x24($a0)
/* ADC20 800AD020 03E00008 */  jr         $ra
/* ADC24 800AD024 E4840028 */   swc1      $f4, 0x28($a0)

glabel func_800AD028
/* ADC28 800AD028 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* ADC2C 800AD02C AFB00010 */  sw         $s0, 0x10($sp)
/* ADC30 800AD030 00808021 */  addu       $s0, $a0, $zero
/* ADC34 800AD034 AFBF0014 */  sw         $ra, 0x14($sp)
/* ADC38 800AD038 F7BA0030 */  sdc1       $f26, 0x30($sp)
/* ADC3C 800AD03C F7B80028 */  sdc1       $f24, 0x28($sp)
/* ADC40 800AD040 F7B60020 */  sdc1       $f22, 0x20($sp)
/* ADC44 800AD044 F7B40018 */  sdc1       $f20, 0x18($sp)
/* ADC48 800AD048 C60C0000 */  lwc1       $f12, ($s0)
/* ADC4C 800AD04C 460C6302 */  mul.s      $f12, $f12, $f12
/* ADC50 800AD050 C6100004 */  lwc1       $f16, 4($s0)
/* ADC54 800AD054 46108402 */  mul.s      $f16, $f16, $f16
/* ADC58 800AD058 C60E0008 */  lwc1       $f14, 8($s0)
/* ADC5C 800AD05C 460E7382 */  mul.s      $f14, $f14, $f14
/* ADC60 800AD060 C6080010 */  lwc1       $f8, 0x10($s0)
/* ADC64 800AD064 46084202 */  mul.s      $f8, $f8, $f8
/* ADC68 800AD068 C60A0014 */  lwc1       $f10, 0x14($s0)
/* ADC6C 800AD06C 460A5282 */  mul.s      $f10, $f10, $f10
/* ADC70 800AD070 C6060018 */  lwc1       $f6, 0x18($s0)
/* ADC74 800AD074 46063182 */  mul.s      $f6, $f6, $f6
/* ADC78 800AD078 C6020020 */  lwc1       $f2, 0x20($s0)
/* ADC7C 800AD07C 46021082 */  mul.s      $f2, $f2, $f2
/* ADC80 800AD080 C6040024 */  lwc1       $f4, 0x24($s0)
/* ADC84 800AD084 46042102 */  mul.s      $f4, $f4, $f4
/* ADC88 800AD088 C6000028 */  lwc1       $f0, 0x28($s0)
/* ADC8C 800AD08C 46000002 */  mul.s      $f0, $f0, $f0
/* ADC90 800AD090 460A4200 */  add.s      $f8, $f8, $f10
/* ADC94 800AD094 46106300 */  add.s      $f12, $f12, $f16
/* ADC98 800AD098 46041080 */  add.s      $f2, $f2, $f4
/* ADC9C 800AD09C 46064600 */  add.s      $f24, $f8, $f6
/* ADCA0 800AD0A0 460E6300 */  add.s      $f12, $f12, $f14
/* ADCA4 800AD0A4 0C0334B4 */  jal        _sqrtf
/* ADCA8 800AD0A8 46001680 */   add.s     $f26, $f2, $f0
/* ADCAC 800AD0AC 4600C306 */  mov.s      $f12, $f24
/* ADCB0 800AD0B0 3C01800E */  lui        $at, %hi(D_800E36D0)
/* ADCB4 800AD0B4 D43636D0 */  ldc1       $f22, %lo(D_800E36D0)($at)
/* ADCB8 800AD0B8 46000521 */  cvt.d.s    $f20, $f0
/* ADCBC 800AD0BC 4634B503 */  div.d      $f20, $f22, $f20
/* ADCC0 800AD0C0 0C0334B4 */  jal        _sqrtf
/* ADCC4 800AD0C4 4620A520 */   cvt.s.d   $f20, $f20
/* ADCC8 800AD0C8 46000021 */  cvt.d.s    $f0, $f0
/* ADCCC 800AD0CC 4620B003 */  div.d      $f0, $f22, $f0
/* ADCD0 800AD0D0 46200620 */  cvt.s.d    $f24, $f0
/* ADCD4 800AD0D4 0C0334B4 */  jal        _sqrtf
/* ADCD8 800AD0D8 4600D306 */   mov.s     $f12, $f26
/* ADCDC 800AD0DC C6100000 */  lwc1       $f16, ($s0)
/* ADCE0 800AD0E0 46148402 */  mul.s      $f16, $f16, $f20
/* ADCE4 800AD0E4 C60E0004 */  lwc1       $f14, 4($s0)
/* ADCE8 800AD0E8 46147382 */  mul.s      $f14, $f14, $f20
/* ADCEC 800AD0EC C6080010 */  lwc1       $f8, 0x10($s0)
/* ADCF0 800AD0F0 46184202 */  mul.s      $f8, $f8, $f24
/* ADCF4 800AD0F4 C60A0014 */  lwc1       $f10, 0x14($s0)
/* ADCF8 800AD0F8 46185282 */  mul.s      $f10, $f10, $f24
/* ADCFC 800AD0FC C6060018 */  lwc1       $f6, 0x18($s0)
/* ADD00 800AD100 46183182 */  mul.s      $f6, $f6, $f24
/* ADD04 800AD104 46000021 */  cvt.d.s    $f0, $f0
/* ADD08 800AD108 4620B583 */  div.d      $f22, $f22, $f0
/* ADD0C 800AD10C C6040020 */  lwc1       $f4, 0x20($s0)
/* ADD10 800AD110 4620B6A0 */  cvt.s.d    $f26, $f22
/* ADD14 800AD114 461A2102 */  mul.s      $f4, $f4, $f26
/* ADD18 800AD118 C6000024 */  lwc1       $f0, 0x24($s0)
/* ADD1C 800AD11C 461A0002 */  mul.s      $f0, $f0, $f26
/* ADD20 800AD120 C6020028 */  lwc1       $f2, 0x28($s0)
/* ADD24 800AD124 C60C0008 */  lwc1       $f12, 8($s0)
/* ADD28 800AD128 461A1082 */  mul.s      $f2, $f2, $f26
/* ADD2C 800AD12C 8FBF0014 */  lw         $ra, 0x14($sp)
/* ADD30 800AD130 D7B60020 */  ldc1       $f22, 0x20($sp)
/* ADD34 800AD134 D7BA0030 */  ldc1       $f26, 0x30($sp)
/* ADD38 800AD138 D7B80028 */  ldc1       $f24, 0x28($sp)
/* ADD3C 800AD13C 46146302 */  mul.s      $f12, $f12, $f20
/* ADD40 800AD140 D7B40018 */  ldc1       $f20, 0x18($sp)
/* ADD44 800AD144 E6100000 */  swc1       $f16, ($s0)
/* ADD48 800AD148 E60E0004 */  swc1       $f14, 4($s0)
/* ADD4C 800AD14C E60C0008 */  swc1       $f12, 8($s0)
/* ADD50 800AD150 E6080010 */  swc1       $f8, 0x10($s0)
/* ADD54 800AD154 E60A0014 */  swc1       $f10, 0x14($s0)
/* ADD58 800AD158 E6060018 */  swc1       $f6, 0x18($s0)
/* ADD5C 800AD15C E6040020 */  swc1       $f4, 0x20($s0)
/* ADD60 800AD160 E6000024 */  swc1       $f0, 0x24($s0)
/* ADD64 800AD164 E6020028 */  swc1       $f2, 0x28($s0)
/* ADD68 800AD168 8FB00010 */  lw         $s0, 0x10($sp)
/* ADD6C 800AD16C 03E00008 */  jr         $ra
/* ADD70 800AD170 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800AD174
/* ADD74 800AD174 27BDFF98 */  addiu      $sp, $sp, -0x68
/* ADD78 800AD178 AFB10054 */  sw         $s1, 0x54($sp)
/* ADD7C 800AD17C 00808821 */  addu       $s1, $a0, $zero
/* ADD80 800AD180 C4C80000 */  lwc1       $f8, ($a2)
/* ADD84 800AD184 27A40010 */  addiu      $a0, $sp, 0x10
/* ADD88 800AD188 AFB20058 */  sw         $s2, 0x58($sp)
/* ADD8C 800AD18C 00A09021 */  addu       $s2, $a1, $zero
/* ADD90 800AD190 AFB00050 */  sw         $s0, 0x50($sp)
/* ADD94 800AD194 00E08021 */  addu       $s0, $a3, $zero
/* ADD98 800AD198 AFBF005C */  sw         $ra, 0x5c($sp)
/* ADD9C 800AD19C F7B40060 */  sdc1       $f20, 0x60($sp)
/* ADDA0 800AD1A0 C6000000 */  lwc1       $f0, ($s0)
/* ADDA4 800AD1A4 C4C60004 */  lwc1       $f6, 4($a2)
/* ADDA8 800AD1A8 46004201 */  sub.s      $f8, $f8, $f0
/* ADDAC 800AD1AC C6020004 */  lwc1       $f2, 4($s0)
/* ADDB0 800AD1B0 C6040008 */  lwc1       $f4, 8($s0)
/* ADDB4 800AD1B4 46023181 */  sub.s      $f6, $f6, $f2
/* ADDB8 800AD1B8 C4C00008 */  lwc1       $f0, 8($a2)
/* ADDBC 800AD1BC 46040001 */  sub.s      $f0, $f0, $f4
/* ADDC0 800AD1C0 E7A80010 */  swc1       $f8, 0x10($sp)
/* ADDC4 800AD1C4 E7A60014 */  swc1       $f6, 0x14($sp)
/* ADDC8 800AD1C8 0C02AB7A */  jal        vec3_scalar_product
/* ADDCC 800AD1CC E7A00018 */   swc1      $f0, 0x18($sp)
/* ADDD0 800AD1D0 02002021 */  addu       $a0, $s0, $zero
/* ADDD4 800AD1D4 02402821 */  addu       $a1, $s2, $zero
/* ADDD8 800AD1D8 0C02AB7A */  jal        vec3_scalar_product
/* ADDDC 800AD1DC 46000506 */   mov.s     $f20, $f0
/* ADDE0 800AD1E0 C6020000 */  lwc1       $f2, ($s0)
/* ADDE4 800AD1E4 C6440000 */  lwc1       $f4, ($s2)
/* ADDE8 800AD1E8 46001087 */  neg.s      $f2, $f2
/* ADDEC 800AD1EC 46041082 */  mul.s      $f2, $f2, $f4
/* ADDF0 800AD1F0 46141081 */  sub.s      $f2, $f2, $f20
/* ADDF4 800AD1F4 E6220000 */  swc1       $f2, ($s1)
/* ADDF8 800AD1F8 C6040000 */  lwc1       $f4, ($s0)
/* ADDFC 800AD1FC C6420004 */  lwc1       $f2, 4($s2)
/* ADE00 800AD200 46002107 */  neg.s      $f4, $f4
/* ADE04 800AD204 46022102 */  mul.s      $f4, $f4, $f2
/* ADE08 800AD208 E6240010 */  swc1       $f4, 0x10($s1)
/* ADE0C 800AD20C C6020000 */  lwc1       $f2, ($s0)
/* ADE10 800AD210 C6440008 */  lwc1       $f4, 8($s2)
/* ADE14 800AD214 46001087 */  neg.s      $f2, $f2
/* ADE18 800AD218 46041082 */  mul.s      $f2, $f2, $f4
/* ADE1C 800AD21C 4600A200 */  add.s      $f8, $f20, $f0
/* ADE20 800AD220 E6220020 */  swc1       $f2, 0x20($s1)
/* ADE24 800AD224 C6020000 */  lwc1       $f2, ($s0)
/* ADE28 800AD228 46081082 */  mul.s      $f2, $f2, $f8
/* ADE2C 800AD22C E6220030 */  swc1       $f2, 0x30($s1)
/* ADE30 800AD230 C6040004 */  lwc1       $f4, 4($s0)
/* ADE34 800AD234 C6420000 */  lwc1       $f2, ($s2)
/* ADE38 800AD238 46002107 */  neg.s      $f4, $f4
/* ADE3C 800AD23C 46022102 */  mul.s      $f4, $f4, $f2
/* ADE40 800AD240 E6240004 */  swc1       $f4, 4($s1)
/* ADE44 800AD244 C6020004 */  lwc1       $f2, 4($s0)
/* ADE48 800AD248 C6440004 */  lwc1       $f4, 4($s2)
/* ADE4C 800AD24C 46001087 */  neg.s      $f2, $f2
/* ADE50 800AD250 46041082 */  mul.s      $f2, $f2, $f4
/* ADE54 800AD254 46141081 */  sub.s      $f2, $f2, $f20
/* ADE58 800AD258 E6220014 */  swc1       $f2, 0x14($s1)
/* ADE5C 800AD25C C6040004 */  lwc1       $f4, 4($s0)
/* ADE60 800AD260 C6420008 */  lwc1       $f2, 8($s2)
/* ADE64 800AD264 46002107 */  neg.s      $f4, $f4
/* ADE68 800AD268 46022102 */  mul.s      $f4, $f4, $f2
/* ADE6C 800AD26C E6240024 */  swc1       $f4, 0x24($s1)
/* ADE70 800AD270 C6020004 */  lwc1       $f2, 4($s0)
/* ADE74 800AD274 46081082 */  mul.s      $f2, $f2, $f8
/* ADE78 800AD278 E6220034 */  swc1       $f2, 0x34($s1)
/* ADE7C 800AD27C C6040008 */  lwc1       $f4, 8($s0)
/* ADE80 800AD280 C6420000 */  lwc1       $f2, ($s2)
/* ADE84 800AD284 46002107 */  neg.s      $f4, $f4
/* ADE88 800AD288 46022102 */  mul.s      $f4, $f4, $f2
/* ADE8C 800AD28C E6240008 */  swc1       $f4, 8($s1)
/* ADE90 800AD290 C6060008 */  lwc1       $f6, 8($s0)
/* ADE94 800AD294 C6420004 */  lwc1       $f2, 4($s2)
/* ADE98 800AD298 46003187 */  neg.s      $f6, $f6
/* ADE9C 800AD29C 46023182 */  mul.s      $f6, $f6, $f2
/* ADEA0 800AD2A0 E6260018 */  swc1       $f6, 0x18($s1)
/* ADEA4 800AD2A4 C6020008 */  lwc1       $f2, 8($s0)
/* ADEA8 800AD2A8 C6440008 */  lwc1       $f4, 8($s2)
/* ADEAC 800AD2AC 46001087 */  neg.s      $f2, $f2
/* ADEB0 800AD2B0 46041082 */  mul.s      $f2, $f2, $f4
/* ADEB4 800AD2B4 46141081 */  sub.s      $f2, $f2, $f20
/* ADEB8 800AD2B8 E6220028 */  swc1       $f2, 0x28($s1)
/* ADEBC 800AD2BC C6040008 */  lwc1       $f4, 8($s0)
/* ADEC0 800AD2C0 46082102 */  mul.s      $f4, $f4, $f8
/* ADEC4 800AD2C4 E6240038 */  swc1       $f4, 0x38($s1)
/* ADEC8 800AD2C8 C6420000 */  lwc1       $f2, ($s2)
/* ADECC 800AD2CC 46001087 */  neg.s      $f2, $f2
/* ADED0 800AD2D0 E622000C */  swc1       $f2, 0xc($s1)
/* ADED4 800AD2D4 C6440004 */  lwc1       $f4, 4($s2)
/* ADED8 800AD2D8 8FBF005C */  lw         $ra, 0x5c($sp)
/* ADEDC 800AD2DC 8FB00050 */  lw         $s0, 0x50($sp)
/* ADEE0 800AD2E0 D7B40060 */  ldc1       $f20, 0x60($sp)
/* ADEE4 800AD2E4 46002107 */  neg.s      $f4, $f4
/* ADEE8 800AD2E8 E624001C */  swc1       $f4, 0x1c($s1)
/* ADEEC 800AD2EC C6420008 */  lwc1       $f2, 8($s2)
/* ADEF0 800AD2F0 8FB20058 */  lw         $s2, 0x58($sp)
/* ADEF4 800AD2F4 E620003C */  swc1       $f0, 0x3c($s1)
/* ADEF8 800AD2F8 46001087 */  neg.s      $f2, $f2
/* ADEFC 800AD2FC E622002C */  swc1       $f2, 0x2c($s1)
/* ADF00 800AD300 8FB10054 */  lw         $s1, 0x54($sp)
/* ADF04 800AD304 03E00008 */  jr         $ra
/* ADF08 800AD308 27BD0068 */   addiu     $sp, $sp, 0x68

glabel ofunc_sub_800ad30c
/* ADF0C 800AD30C 24070003 */  addiu      $a3, $zero, 3
/* ADF10 800AD310 3C0BFFFF */  lui        $t3, 0xffff
.L800AD314:
/* ADF14 800AD314 00C01821 */  addu       $v1, $a2, $zero
/* ADF18 800AD318 24020003 */  addiu      $v0, $zero, 3
/* ADF1C 800AD31C 24EAFFFF */  addiu      $t2, $a3, -1
.L800AD320:
/* ADF20 800AD320 44802000 */  mtc1       $zero, $f4
/* ADF24 800AD324 24880004 */  addiu      $t0, $a0, 4
/* ADF28 800AD328 2449FFFF */  addiu      $t1, $v0, -1
/* ADF2C 800AD32C 3C070002 */  lui        $a3, 2
.L800AD330:
/* ADF30 800AD330 C4A00000 */  lwc1       $f0, ($a1)
/* ADF34 800AD334 C4620000 */  lwc1       $f2, ($v1)
/* ADF38 800AD338 24A50004 */  addiu      $a1, $a1, 4
/* ADF3C 800AD33C 46020002 */  mul.s      $f0, $f0, $f2
/* ADF40 800AD340 2463000C */  addiu      $v1, $v1, 0xc
/* ADF44 800AD344 00E01021 */  addu       $v0, $a3, $zero
/* ADF48 800AD348 00EB3821 */  addu       $a3, $a3, $t3
/* ADF4C 800AD34C 00021403 */  sra        $v0, $v0, 0x10
/* ADF50 800AD350 1440FFF7 */  bnez       $v0, .L800AD330
/* ADF54 800AD354 46002100 */   add.s     $f4, $f4, $f0
/* ADF58 800AD358 E4840000 */  swc1       $f4, ($a0)
/* ADF5C 800AD35C 01002021 */  addu       $a0, $t0, $zero
/* ADF60 800AD360 24A5FFF4 */  addiu      $a1, $a1, -0xc
/* ADF64 800AD364 00091400 */  sll        $v0, $t1, 0x10
/* ADF68 800AD368 00021403 */  sra        $v0, $v0, 0x10
/* ADF6C 800AD36C 1440FFEC */  bnez       $v0, .L800AD320
/* ADF70 800AD370 2463FFE0 */   addiu     $v1, $v1, -0x20
/* ADF74 800AD374 000A1400 */  sll        $v0, $t2, 0x10
/* ADF78 800AD378 00023C03 */  sra        $a3, $v0, 0x10
/* ADF7C 800AD37C 14E0FFE5 */  bnez       $a3, .L800AD314
/* ADF80 800AD380 24A5000C */   addiu     $a1, $a1, 0xc
/* ADF84 800AD384 03E00008 */  jr         $ra
/* ADF88 800AD388 00000000 */   nop

glabel func_800AD38C
/* ADF8C 800AD38C C4A20000 */  lwc1       $f2, ($a1)
/* ADF90 800AD390 C4C00000 */  lwc1       $f0, ($a2)
/* ADF94 800AD394 46001082 */  mul.s      $f2, $f2, $f0
/* ADF98 800AD398 C4A60004 */  lwc1       $f6, 4($a1)
/* ADF9C 800AD39C C4C00004 */  lwc1       $f0, 4($a2)
/* ADFA0 800AD3A0 46003182 */  mul.s      $f6, $f6, $f0
/* ADFA4 800AD3A4 C4A40008 */  lwc1       $f4, 8($a1)
/* ADFA8 800AD3A8 C4C00008 */  lwc1       $f0, 8($a2)
/* ADFAC 800AD3AC 46002102 */  mul.s      $f4, $f4, $f0
/* ADFB0 800AD3B0 46061080 */  add.s      $f2, $f2, $f6
/* ADFB4 800AD3B4 46041080 */  add.s      $f2, $f2, $f4
/* ADFB8 800AD3B8 E4820000 */  swc1       $f2, ($a0)
/* ADFBC 800AD3BC C4A0000C */  lwc1       $f0, 0xc($a1)
/* ADFC0 800AD3C0 C4C20000 */  lwc1       $f2, ($a2)
/* ADFC4 800AD3C4 46020002 */  mul.s      $f0, $f0, $f2
/* ADFC8 800AD3C8 C4A60010 */  lwc1       $f6, 0x10($a1)
/* ADFCC 800AD3CC C4C20004 */  lwc1       $f2, 4($a2)
/* ADFD0 800AD3D0 46023182 */  mul.s      $f6, $f6, $f2
/* ADFD4 800AD3D4 C4A40014 */  lwc1       $f4, 0x14($a1)
/* ADFD8 800AD3D8 C4C20008 */  lwc1       $f2, 8($a2)
/* ADFDC 800AD3DC 46022102 */  mul.s      $f4, $f4, $f2
/* ADFE0 800AD3E0 46060000 */  add.s      $f0, $f0, $f6
/* ADFE4 800AD3E4 46040000 */  add.s      $f0, $f0, $f4
/* ADFE8 800AD3E8 E4800004 */  swc1       $f0, 4($a0)
/* ADFEC 800AD3EC C4A20018 */  lwc1       $f2, 0x18($a1)
/* ADFF0 800AD3F0 C4C00000 */  lwc1       $f0, ($a2)
/* ADFF4 800AD3F4 46001082 */  mul.s      $f2, $f2, $f0
/* ADFF8 800AD3F8 C4A6001C */  lwc1       $f6, 0x1c($a1)
/* ADFFC 800AD3FC C4C00004 */  lwc1       $f0, 4($a2)
/* AE000 800AD400 46003182 */  mul.s      $f6, $f6, $f0
/* AE004 800AD404 C4A40020 */  lwc1       $f4, 0x20($a1)
/* AE008 800AD408 C4C00008 */  lwc1       $f0, 8($a2)
/* AE00C 800AD40C 46002102 */  mul.s      $f4, $f4, $f0
/* AE010 800AD410 46061080 */  add.s      $f2, $f2, $f6
/* AE014 800AD414 46041080 */  add.s      $f2, $f2, $f4
/* AE018 800AD418 03E00008 */  jr         $ra
/* AE01C 800AD41C E4820008 */   swc1      $f2, 8($a0)

glabel func_800AD420
/* AE020 800AD420 C4800000 */  lwc1       $f0, ($a0)
/* AE024 800AD424 C4A80000 */  lwc1       $f8, ($a1)
/* AE028 800AD428 46080002 */  mul.s      $f0, $f0, $f8
/* AE02C 800AD42C C4860004 */  lwc1       $f6, 4($a0)
/* AE030 800AD430 C4A20004 */  lwc1       $f2, 4($a1)
/* AE034 800AD434 46023182 */  mul.s      $f6, $f6, $f2
/* AE038 800AD438 C4840008 */  lwc1       $f4, 8($a0)
/* AE03C 800AD43C C4A20008 */  lwc1       $f2, 8($a1)
/* AE040 800AD440 46022102 */  mul.s      $f4, $f4, $f2
/* AE044 800AD444 46060000 */  add.s      $f0, $f0, $f6
/* AE048 800AD448 46040000 */  add.s      $f0, $f0, $f4
/* AE04C 800AD44C 46004202 */  mul.s      $f8, $f8, $f0
/* AE050 800AD450 E4C80000 */  swc1       $f8, ($a2)
/* AE054 800AD454 C4A20004 */  lwc1       $f2, 4($a1)
/* AE058 800AD458 46001082 */  mul.s      $f2, $f2, $f0
/* AE05C 800AD45C E4C20004 */  swc1       $f2, 4($a2)
/* AE060 800AD460 C4A40008 */  lwc1       $f4, 8($a1)
/* AE064 800AD464 46002102 */  mul.s      $f4, $f4, $f0
/* AE068 800AD468 E4C40008 */  swc1       $f4, 8($a2)
/* AE06C 800AD46C C4820000 */  lwc1       $f2, ($a0)
/* AE070 800AD470 46081081 */  sub.s      $f2, $f2, $f8
/* AE074 800AD474 E4E20000 */  swc1       $f2, ($a3)
/* AE078 800AD478 C4840004 */  lwc1       $f4, 4($a0)
/* AE07C 800AD47C C4C20004 */  lwc1       $f2, 4($a2)
/* AE080 800AD480 46022101 */  sub.s      $f4, $f4, $f2
/* AE084 800AD484 E4E40004 */  swc1       $f4, 4($a3)
/* AE088 800AD488 C4820008 */  lwc1       $f2, 8($a0)
/* AE08C 800AD48C C4C40008 */  lwc1       $f4, 8($a2)
/* AE090 800AD490 46041081 */  sub.s      $f2, $f2, $f4
/* AE094 800AD494 03E00008 */  jr         $ra
/* AE098 800AD498 E4E20008 */   swc1      $f2, 8($a3)

glabel func_800AD49C
/* AE09C 800AD49C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* AE0A0 800AD4A0 AFB10014 */  sw         $s1, 0x14($sp)
/* AE0A4 800AD4A4 00808821 */  addu       $s1, $a0, $zero
/* AE0A8 800AD4A8 AFB00010 */  sw         $s0, 0x10($sp)
/* AE0AC 800AD4AC AFBF0018 */  sw         $ra, 0x18($sp)
/* AE0B0 800AD4B0 0C02AB7A */  jal        vec3_scalar_product
/* AE0B4 800AD4B4 00A08021 */   addu      $s0, $a1, $zero
/* AE0B8 800AD4B8 C6240000 */  lwc1       $f4, ($s1)
/* AE0BC 800AD4BC 46000007 */  neg.s      $f0, $f0
/* AE0C0 800AD4C0 46002102 */  mul.s      $f4, $f4, $f0
/* AE0C4 800AD4C4 C6020000 */  lwc1       $f2, ($s0)
/* AE0C8 800AD4C8 46041080 */  add.s      $f2, $f2, $f4
/* AE0CC 800AD4CC E6020000 */  swc1       $f2, ($s0)
/* AE0D0 800AD4D0 C6240004 */  lwc1       $f4, 4($s1)
/* AE0D4 800AD4D4 46002102 */  mul.s      $f4, $f4, $f0
/* AE0D8 800AD4D8 C6020004 */  lwc1       $f2, 4($s0)
/* AE0DC 800AD4DC 46041080 */  add.s      $f2, $f2, $f4
/* AE0E0 800AD4E0 E6020004 */  swc1       $f2, 4($s0)
/* AE0E4 800AD4E4 C6240008 */  lwc1       $f4, 8($s1)
/* AE0E8 800AD4E8 46002102 */  mul.s      $f4, $f4, $f0
/* AE0EC 800AD4EC C6000008 */  lwc1       $f0, 8($s0)
/* AE0F0 800AD4F0 8FBF0018 */  lw         $ra, 0x18($sp)
/* AE0F4 800AD4F4 46040000 */  add.s      $f0, $f0, $f4
/* AE0F8 800AD4F8 8FB10014 */  lw         $s1, 0x14($sp)
/* AE0FC 800AD4FC E6000008 */  swc1       $f0, 8($s0)
/* AE100 800AD500 8FB00010 */  lw         $s0, 0x10($sp)
/* AE104 800AD504 03E00008 */  jr         $ra
/* AE108 800AD508 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800AD50C
/* AE10C 800AD50C 27BDFE78 */  addiu      $sp, $sp, -0x188
/* AE110 800AD510 AFBF0154 */  sw         $ra, 0x154($sp)
/* AE114 800AD514 AFB00150 */  sw         $s0, 0x150($sp)
/* AE118 800AD518 F7BE0180 */  sdc1       $f30, 0x180($sp)
/* AE11C 800AD51C F7BC0178 */  sdc1       $f28, 0x178($sp)
/* AE120 800AD520 F7BA0170 */  sdc1       $f26, 0x170($sp)
/* AE124 800AD524 F7B80168 */  sdc1       $f24, 0x168($sp)
/* AE128 800AD528 F7B60160 */  sdc1       $f22, 0x160($sp)
/* AE12C 800AD52C F7B40158 */  sdc1       $f20, 0x158($sp)
/* AE130 800AD530 C4A80000 */  lwc1       $f8, ($a1)
/* AE134 800AD534 C4C40000 */  lwc1       $f4, ($a2)
/* AE138 800AD538 46044582 */  mul.s      $f22, $f8, $f4
/* AE13C 800AD53C C4CC0004 */  lwc1       $f12, 4($a2)
/* AE140 800AD540 460C4502 */  mul.s      $f20, $f8, $f12
/* AE144 800AD544 C4CA0008 */  lwc1       $f10, 8($a2)
/* AE148 800AD548 460A4202 */  mul.s      $f8, $f8, $f10
/* AE14C 800AD54C C4A60004 */  lwc1       $f6, 4($a1)
/* AE150 800AD550 C4E20000 */  lwc1       $f2, ($a3)
/* AE154 800AD554 8FA20198 */  lw         $v0, 0x198($sp)
/* AE158 800AD558 46023482 */  mul.s      $f18, $f6, $f2
/* AE15C 800AD55C E7A40050 */  swc1       $f4, 0x50($sp)
/* AE160 800AD560 C4E00004 */  lwc1       $f0, 4($a3)
/* AE164 800AD564 C4EE0008 */  lwc1       $f14, 8($a3)
/* AE168 800AD568 46003402 */  mul.s      $f16, $f6, $f0
/* AE16C 800AD56C E7AC005C */  swc1       $f12, 0x5c($sp)
/* AE170 800AD570 E7AA0068 */  swc1       $f10, 0x68($sp)
/* AE174 800AD574 E7A20054 */  swc1       $f2, 0x54($sp)
/* AE178 800AD578 460E3182 */  mul.s      $f6, $f6, $f14
/* AE17C 800AD57C E7A00060 */  swc1       $f0, 0x60($sp)
/* AE180 800AD580 C4A00008 */  lwc1       $f0, 8($a1)
/* AE184 800AD584 C4440000 */  lwc1       $f4, ($v0)
/* AE188 800AD588 46040302 */  mul.s      $f12, $f0, $f4
/* AE18C 800AD58C C4420004 */  lwc1       $f2, 4($v0)
/* AE190 800AD590 C44A0008 */  lwc1       $f10, 8($v0)
/* AE194 800AD594 00808021 */  addu       $s0, $a0, $zero
/* AE198 800AD598 E7A20064 */  swc1       $f2, 0x64($sp)
/* AE19C 800AD59C 46020082 */  mul.s      $f2, $f0, $f2
/* AE1A0 800AD5A0 27A40090 */  addiu      $a0, $sp, 0x90
/* AE1A4 800AD5A4 27A60010 */  addiu      $a2, $sp, 0x10
/* AE1A8 800AD5A8 27A50050 */  addiu      $a1, $sp, 0x50
/* AE1AC 800AD5AC E7AE006C */  swc1       $f14, 0x6c($sp)
/* AE1B0 800AD5B0 460A0002 */  mul.s      $f0, $f0, $f10
/* AE1B4 800AD5B4 E7A40058 */  swc1       $f4, 0x58($sp)
/* AE1B8 800AD5B8 E7AA0070 */  swc1       $f10, 0x70($sp)
/* AE1BC 800AD5BC E7B60010 */  swc1       $f22, 0x10($sp)
/* AE1C0 800AD5C0 E7B40014 */  swc1       $f20, 0x14($sp)
/* AE1C4 800AD5C4 E7A80018 */  swc1       $f8, 0x18($sp)
/* AE1C8 800AD5C8 E7B2001C */  swc1       $f18, 0x1c($sp)
/* AE1CC 800AD5CC E7B00020 */  swc1       $f16, 0x20($sp)
/* AE1D0 800AD5D0 E7A60024 */  swc1       $f6, 0x24($sp)
/* AE1D4 800AD5D4 E7AC0028 */  swc1       $f12, 0x28($sp)
/* AE1D8 800AD5D8 E7A2002C */  swc1       $f2, 0x2c($sp)
/* AE1DC 800AD5DC 0C02B4C3 */  jal        ofunc_sub_800ad30c
/* AE1E0 800AD5E0 E7A00030 */   swc1      $f0, 0x30($sp)
/* AE1E4 800AD5E4 27A300D0 */  addiu      $v1, $sp, 0xd0
/* AE1E8 800AD5E8 02001021 */  addu       $v0, $s0, $zero
/* AE1EC 800AD5EC 26040040 */  addiu      $a0, $s0, 0x40
.L800AD5F0:
/* AE1F0 800AD5F0 8C450000 */  lw         $a1, ($v0)
/* AE1F4 800AD5F4 8C460004 */  lw         $a2, 4($v0)
/* AE1F8 800AD5F8 8C470008 */  lw         $a3, 8($v0)
/* AE1FC 800AD5FC 8C48000C */  lw         $t0, 0xc($v0)
/* AE200 800AD600 AC650000 */  sw         $a1, ($v1)
/* AE204 800AD604 AC660004 */  sw         $a2, 4($v1)
/* AE208 800AD608 AC670008 */  sw         $a3, 8($v1)
/* AE20C 800AD60C AC68000C */  sw         $t0, 0xc($v1)
/* AE210 800AD610 24420010 */  addiu      $v0, $v0, 0x10
/* AE214 800AD614 1444FFF6 */  bne        $v0, $a0, .L800AD5F0
/* AE218 800AD618 24630010 */   addiu     $v1, $v1, 0x10
/* AE21C 800AD61C C7A60090 */  lwc1       $f6, 0x90($sp)
/* AE220 800AD620 C7A800D0 */  lwc1       $f8, 0xd0($sp)
/* AE224 800AD624 46083002 */  mul.s      $f0, $f6, $f8
/* AE228 800AD628 C7BE0094 */  lwc1       $f30, 0x94($sp)
/* AE22C 800AD62C C7AC00D4 */  lwc1       $f12, 0xd4($sp)
/* AE230 800AD630 460CF082 */  mul.s      $f2, $f30, $f12
/* AE234 800AD634 C7AE0098 */  lwc1       $f14, 0x98($sp)
/* AE238 800AD638 C7B200D8 */  lwc1       $f18, 0xd8($sp)
/* AE23C 800AD63C 46127382 */  mul.s      $f14, $f14, $f18
/* AE240 800AD640 C7A400E0 */  lwc1       $f4, 0xe0($sp)
/* AE244 800AD644 46043502 */  mul.s      $f20, $f6, $f4
/* AE248 800AD648 C7BC00E4 */  lwc1       $f28, 0xe4($sp)
/* AE24C 800AD64C 461CF702 */  mul.s      $f28, $f30, $f28
/* AE250 800AD650 C7AA00AC */  lwc1       $f10, 0xac($sp)
/* AE254 800AD654 460C5602 */  mul.s      $f24, $f10, $f12
/* AE258 800AD658 E7A00110 */  swc1       $f0, 0x110($sp)
/* AE25C 800AD65C C7A00098 */  lwc1       $f0, 0x98($sp)
/* AE260 800AD660 E7A20114 */  swc1       $f2, 0x114($sp)
/* AE264 800AD664 C7A200E8 */  lwc1       $f2, 0xe8($sp)
/* AE268 800AD668 46020002 */  mul.s      $f0, $f0, $f2
/* AE26C 800AD66C E7AE0118 */  swc1       $f14, 0x118($sp)
/* AE270 800AD670 C7AE00F0 */  lwc1       $f14, 0xf0($sp)
/* AE274 800AD674 460E3182 */  mul.s      $f6, $f6, $f14
/* AE278 800AD678 E7B4011C */  swc1       $f20, 0x11c($sp)
/* AE27C 800AD67C C7B400F4 */  lwc1       $f20, 0xf4($sp)
/* AE280 800AD680 C7B200F8 */  lwc1       $f18, 0xf8($sp)
/* AE284 800AD684 4614F782 */  mul.s      $f30, $f30, $f20
/* AE288 800AD688 E7BC0120 */  swc1       $f28, 0x120($sp)
/* AE28C 800AD68C C7BC0098 */  lwc1       $f28, 0x98($sp)
/* AE290 800AD690 4612E702 */  mul.s      $f28, $f28, $f18
/* AE294 800AD694 C7A2009C */  lwc1       $f2, 0x9c($sp)
/* AE298 800AD698 46081682 */  mul.s      $f26, $f2, $f8
/* AE29C 800AD69C 00000000 */  nop
/* AE2A0 800AD6A0 46041582 */  mul.s      $f22, $f2, $f4
/* AE2A4 800AD6A4 C7B000A4 */  lwc1       $f16, 0xa4($sp)
/* AE2A8 800AD6A8 C7AE00A0 */  lwc1       $f14, 0xa0($sp)
/* AE2AC 800AD6AC E7BE0148 */  swc1       $f30, 0x148($sp)
/* AE2B0 800AD6B0 460C7782 */  mul.s      $f30, $f14, $f12
/* AE2B4 800AD6B4 E7A00124 */  swc1       $f0, 0x124($sp)
/* AE2B8 800AD6B8 C7A000D8 */  lwc1       $f0, 0xd8($sp)
/* AE2BC 800AD6BC 46008002 */  mul.s      $f0, $f16, $f0
/* AE2C0 800AD6C0 E7BC0128 */  swc1       $f28, 0x128($sp)
/* AE2C4 800AD6C4 C7BC00E4 */  lwc1       $f28, 0xe4($sp)
/* AE2C8 800AD6C8 461C7702 */  mul.s      $f28, $f14, $f28
/* AE2CC 800AD6CC 00000000 */  nop
/* AE2D0 800AD6D0 46147382 */  mul.s      $f14, $f14, $f20
/* AE2D4 800AD6D4 E7BE012C */  swc1       $f30, 0x12c($sp)
/* AE2D8 800AD6D8 C7BE00E8 */  lwc1       $f30, 0xe8($sp)
/* AE2DC 800AD6DC 461E8782 */  mul.s      $f30, $f16, $f30
/* AE2E0 800AD6E0 00000000 */  nop
/* AE2E4 800AD6E4 46128402 */  mul.s      $f16, $f16, $f18
/* AE2E8 800AD6E8 E7A00130 */  swc1       $f0, 0x130($sp)
/* AE2EC 800AD6EC C7A000F0 */  lwc1       $f0, 0xf0($sp)
/* AE2F0 800AD6F0 C7AC00B0 */  lwc1       $f12, 0xb0($sp)
/* AE2F4 800AD6F4 46001082 */  mul.s      $f2, $f2, $f0
/* AE2F8 800AD6F8 E7BC0134 */  swc1       $f28, 0x134($sp)
/* AE2FC 800AD6FC C7BC00D8 */  lwc1       $f28, 0xd8($sp)
/* AE300 800AD700 461C6702 */  mul.s      $f28, $f12, $f28
/* AE304 800AD704 C7A000A8 */  lwc1       $f0, 0xa8($sp)
/* AE308 800AD708 46080202 */  mul.s      $f8, $f0, $f8
/* AE30C 800AD70C 00000000 */  nop
/* AE310 800AD710 46040102 */  mul.s      $f4, $f0, $f4
/* AE314 800AD714 E7BE0138 */  swc1       $f30, 0x138($sp)
/* AE318 800AD718 E7BC013C */  swc1       $f28, 0x13c($sp)
/* AE31C 800AD71C C7BE00E4 */  lwc1       $f30, 0xe4($sp)
/* AE320 800AD720 461E5782 */  mul.s      $f30, $f10, $f30
/* AE324 800AD724 C7BC00E8 */  lwc1       $f28, 0xe8($sp)
/* AE328 800AD728 461C6702 */  mul.s      $f28, $f12, $f28
/* AE32C 800AD72C 00000000 */  nop
/* AE330 800AD730 46145282 */  mul.s      $f10, $f10, $f20
/* AE334 800AD734 00000000 */  nop
/* AE338 800AD738 46126302 */  mul.s      $f12, $f12, $f18
/* AE33C 800AD73C E7BE014C */  swc1       $f30, 0x14c($sp)
/* AE340 800AD740 C7BE00F0 */  lwc1       $f30, 0xf0($sp)
/* AE344 800AD744 461E0002 */  mul.s      $f0, $f0, $f30
/* AE348 800AD748 460E1080 */  add.s      $f2, $f2, $f14
/* AE34C 800AD74C 46184200 */  add.s      $f8, $f8, $f24
/* AE350 800AD750 C7B40110 */  lwc1       $f20, 0x110($sp)
/* AE354 800AD754 46101080 */  add.s      $f2, $f2, $f16
/* AE358 800AD758 E7BC0140 */  swc1       $f28, 0x140($sp)
/* AE35C 800AD75C C7BC0114 */  lwc1       $f28, 0x114($sp)
/* AE360 800AD760 461CA480 */  add.s      $f18, $f20, $f28
/* AE364 800AD764 C7BE0118 */  lwc1       $f30, 0x118($sp)
/* AE368 800AD768 C7BC011C */  lwc1       $f28, 0x11c($sp)
/* AE36C 800AD76C 461E9500 */  add.s      $f20, $f18, $f30
/* AE370 800AD770 C7BE0120 */  lwc1       $f30, 0x120($sp)
/* AE374 800AD774 461EE480 */  add.s      $f18, $f28, $f30
/* AE378 800AD778 C7BC0148 */  lwc1       $f28, 0x148($sp)
/* AE37C 800AD77C 461C3180 */  add.s      $f6, $f6, $f28
/* AE380 800AD780 C7BE0124 */  lwc1       $f30, 0x124($sp)
/* AE384 800AD784 461E9480 */  add.s      $f18, $f18, $f30
/* AE388 800AD788 8FBF0154 */  lw         $ra, 0x154($sp)
/* AE38C 800AD78C 460A0000 */  add.s      $f0, $f0, $f10
/* AE390 800AD790 E6120010 */  swc1       $f18, 0x10($s0)
/* AE394 800AD794 C7B20128 */  lwc1       $f18, 0x128($sp)
/* AE398 800AD798 D7B80168 */  ldc1       $f24, 0x168($sp)
/* AE39C 800AD79C 46123180 */  add.s      $f6, $f6, $f18
/* AE3A0 800AD7A0 C7BC012C */  lwc1       $f28, 0x12c($sp)
/* AE3A4 800AD7A4 C7BE0134 */  lwc1       $f30, 0x134($sp)
/* AE3A8 800AD7A8 461CD680 */  add.s      $f26, $f26, $f28
/* AE3AC 800AD7AC C7AE014C */  lwc1       $f14, 0x14c($sp)
/* AE3B0 800AD7B0 C7B20130 */  lwc1       $f18, 0x130($sp)
/* AE3B4 800AD7B4 461EB580 */  add.s      $f22, $f22, $f30
/* AE3B8 800AD7B8 C7BE013C */  lwc1       $f30, 0x13c($sp)
/* AE3BC 800AD7BC C7BC0138 */  lwc1       $f28, 0x138($sp)
/* AE3C0 800AD7C0 461E4200 */  add.s      $f8, $f8, $f30
/* AE3C4 800AD7C4 E6140000 */  swc1       $f20, ($s0)
/* AE3C8 800AD7C8 4612D680 */  add.s      $f26, $f26, $f18
/* AE3CC 800AD7CC D7B40158 */  ldc1       $f20, 0x158($sp)
/* AE3D0 800AD7D0 D7BE0180 */  ldc1       $f30, 0x180($sp)
/* AE3D4 800AD7D4 461CB580 */  add.s      $f22, $f22, $f28
/* AE3D8 800AD7D8 C7B20140 */  lwc1       $f18, 0x140($sp)
/* AE3DC 800AD7DC D7BC0178 */  ldc1       $f28, 0x178($sp)
/* AE3E0 800AD7E0 460C0000 */  add.s      $f0, $f0, $f12
/* AE3E4 800AD7E4 E61A0004 */  swc1       $f26, 4($s0)
/* AE3E8 800AD7E8 D7BA0170 */  ldc1       $f26, 0x170($sp)
/* AE3EC 800AD7EC 460E2100 */  add.s      $f4, $f4, $f14
/* AE3F0 800AD7F0 E6060020 */  swc1       $f6, 0x20($s0)
/* AE3F4 800AD7F4 E6020024 */  swc1       $f2, 0x24($s0)
/* AE3F8 800AD7F8 E6160014 */  swc1       $f22, 0x14($s0)
/* AE3FC 800AD7FC D7B60160 */  ldc1       $f22, 0x160($sp)
/* AE400 800AD800 46122100 */  add.s      $f4, $f4, $f18
/* AE404 800AD804 E6000028 */  swc1       $f0, 0x28($s0)
/* AE408 800AD808 E6080008 */  swc1       $f8, 8($s0)
/* AE40C 800AD80C E6040018 */  swc1       $f4, 0x18($s0)
/* AE410 800AD810 8FB00150 */  lw         $s0, 0x150($sp)
/* AE414 800AD814 03E00008 */  jr         $ra
/* AE418 800AD818 27BD0188 */   addiu     $sp, $sp, 0x188

glabel func_800AD81C
/* AE41C 800AD81C 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* AE420 800AD820 AFB00090 */  sw         $s0, 0x90($sp)
/* AE424 800AD824 00808021 */  addu       $s0, $a0, $zero
/* AE428 800AD828 27A40010 */  addiu      $a0, $sp, 0x10
/* AE42C 800AD82C AFB10094 */  sw         $s1, 0x94($sp)
/* AE430 800AD830 00A08821 */  addu       $s1, $a1, $zero
/* AE434 800AD834 AFB20098 */  sw         $s2, 0x98($sp)
/* AE438 800AD838 27B20050 */  addiu      $s2, $sp, 0x50
/* AE43C 800AD83C AFBF009C */  sw         $ra, 0x9c($sp)
/* AE440 800AD840 C6000020 */  lwc1       $f0, 0x20($s0)
/* AE444 800AD844 C6020024 */  lwc1       $f2, 0x24($s0)
/* AE448 800AD848 C6040028 */  lwc1       $f4, 0x28($s0)
/* AE44C 800AD84C 02403021 */  addu       $a2, $s2, $zero
/* AE450 800AD850 E7A00050 */  swc1       $f0, 0x50($sp)
/* AE454 800AD854 E7A20054 */  swc1       $f2, 0x54($sp)
/* AE458 800AD858 0C02AB86 */  jal        some_vec3_math
/* AE45C 800AD85C E7A40058 */   swc1      $f4, 0x58($sp)
/* AE460 800AD860 0C02ABBB */  jal        vec3_normalize
/* AE464 800AD864 27A40010 */   addiu     $a0, $sp, 0x10
/* AE468 800AD868 02402021 */  addu       $a0, $s2, $zero
/* AE46C 800AD86C 27A50010 */  addiu      $a1, $sp, 0x10
/* AE470 800AD870 0C02AB86 */  jal        some_vec3_math
/* AE474 800AD874 02203021 */   addu      $a2, $s1, $zero
/* AE478 800AD878 C7A00010 */  lwc1       $f0, 0x10($sp)
/* AE47C 800AD87C C7A20014 */  lwc1       $f2, 0x14($sp)
/* AE480 800AD880 C7A40018 */  lwc1       $f4, 0x18($sp)
/* AE484 800AD884 8FBF009C */  lw         $ra, 0x9c($sp)
/* AE488 800AD888 8FB20098 */  lw         $s2, 0x98($sp)
/* AE48C 800AD88C E6000000 */  swc1       $f0, ($s0)
/* AE490 800AD890 E6020004 */  swc1       $f2, 4($s0)
/* AE494 800AD894 E6040008 */  swc1       $f4, 8($s0)
/* AE498 800AD898 C6200000 */  lwc1       $f0, ($s1)
/* AE49C 800AD89C E6000010 */  swc1       $f0, 0x10($s0)
/* AE4A0 800AD8A0 C6220004 */  lwc1       $f2, 4($s1)
/* AE4A4 800AD8A4 E6020014 */  swc1       $f2, 0x14($s0)
/* AE4A8 800AD8A8 C7A40050 */  lwc1       $f4, 0x50($sp)
/* AE4AC 800AD8AC C6260008 */  lwc1       $f6, 8($s1)
/* AE4B0 800AD8B0 C7A00054 */  lwc1       $f0, 0x54($sp)
/* AE4B4 800AD8B4 C7A20058 */  lwc1       $f2, 0x58($sp)
/* AE4B8 800AD8B8 8FB10094 */  lw         $s1, 0x94($sp)
/* AE4BC 800AD8BC E6040020 */  swc1       $f4, 0x20($s0)
/* AE4C0 800AD8C0 E6000024 */  swc1       $f0, 0x24($s0)
/* AE4C4 800AD8C4 E6020028 */  swc1       $f2, 0x28($s0)
/* AE4C8 800AD8C8 E6060018 */  swc1       $f6, 0x18($s0)
/* AE4CC 800AD8CC 8FB00090 */  lw         $s0, 0x90($sp)
/* AE4D0 800AD8D0 03E00008 */  jr         $ra
/* AE4D4 800AD8D4 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_800AD8D8
/* AE4D8 800AD8D8 3C01800E */  lui        $at, %hi(D_800E36D8)
/* AE4DC 800AD8DC D42236D8 */  ldc1       $f2, %lo(D_800E36D8)($at)
/* AE4E0 800AD8E0 46006021 */  cvt.d.s    $f0, $f12
/* AE4E4 800AD8E4 4620103C */  c.lt.d     $f2, $f0
/* AE4E8 800AD8E8 00000000 */  nop
/* AE4EC 800AD8EC 45000003 */  bc1f       .L800AD8FC
/* AE4F0 800AD8F0 00000000 */   nop
/* AE4F4 800AD8F4 3C01800E */  lui        $at, %hi(D_800E36E0)
/* AE4F8 800AD8F8 C42C36E0 */  lwc1       $f12, %lo(D_800E36E0)($at)
.L800AD8FC:
/* AE4FC 800AD8FC 44801000 */  mtc1       $zero, $f2
/* AE500 800AD900 44801800 */  mtc1       $zero, $f3
/* AE504 800AD904 46006021 */  cvt.d.s    $f0, $f12
/* AE508 800AD908 4622003C */  c.lt.d     $f0, $f2
/* AE50C 800AD90C 00000000 */  nop
/* AE510 800AD910 45000002 */  bc1f       .L800AD91C
/* AE514 800AD914 00000000 */   nop
/* AE518 800AD918 44806000 */  mtc1       $zero, $f12
.L800AD91C:
/* AE51C 800AD91C 44026000 */  mfc1       $v0, $f12
/* AE520 800AD920 00402021 */  addu       $a0, $v0, $zero
/* AE524 800AD924 00042DC2 */  srl        $a1, $a0, 0x17
/* AE528 800AD928 30A500FF */  andi       $a1, $a1, 0xff
/* AE52C 800AD92C 24A5FF81 */  addiu      $a1, $a1, -0x7f
/* AE530 800AD930 14A00003 */  bnez       $a1, .L800AD940
/* AE534 800AD934 3C02007F */   lui       $v0, 0x7f
/* AE538 800AD938 03E00008 */  jr         $ra
/* AE53C 800AD93C 240200FF */   addiu     $v0, $zero, 0xff
.L800AD940:
/* AE540 800AD940 3442FFFF */  ori        $v0, $v0, 0xffff
/* AE544 800AD944 00822024 */  and        $a0, $a0, $v0
/* AE548 800AD948 3C030080 */  lui        $v1, 0x80
/* AE54C 800AD94C 00832025 */  or         $a0, $a0, $v1
/* AE550 800AD950 28A2FFF8 */  slti       $v0, $a1, -8
/* AE554 800AD954 10400003 */  beqz       $v0, .L800AD964
/* AE558 800AD958 00042402 */   srl       $a0, $a0, 0x10
/* AE55C 800AD95C 03E00008 */  jr         $ra
/* AE560 800AD960 00001021 */   addu      $v0, $zero, $zero
.L800AD964:
/* AE564 800AD964 04A20001 */  bltzl      $a1, .L800AD96C
/* AE568 800AD968 00A42006 */   srlv      $a0, $a0, $a1
.L800AD96C:
/* AE56C 800AD96C 03E00008 */  jr         $ra
/* AE570 800AD970 308200FF */   andi      $v0, $a0, 0xff

glabel func_800AD974
/* AE574 800AD974 44853000 */  mtc1       $a1, $f6
/* AE578 800AD978 3C01800E */  lui        $at, %hi(D_800E36E4)
/* AE57C 800AD97C C42036E4 */  lwc1       $f0, %lo(D_800E36E4)($at)
/* AE580 800AD980 3C01800E */  lui        $at, %hi(D_800E36E8)
/* AE584 800AD984 C42836E8 */  lwc1       $f8, %lo(D_800E36E8)($at)
/* AE588 800AD988 46063102 */  mul.s      $f4, $f6, $f6
/* AE58C 800AD98C AC800000 */  sw         $zero, ($a0)
/* AE590 800AD990 AC800004 */  sw         $zero, 4($a0)
/* AE594 800AD994 AC800008 */  sw         $zero, 8($a0)
/* AE598 800AD998 AC80001C */  sw         $zero, 0x1c($a0)
/* AE59C 800AD99C 46062282 */  mul.s      $f10, $f4, $f6
/* AE5A0 800AD9A0 AC800028 */  sw         $zero, 0x28($a0)
/* AE5A4 800AD9A4 AC80002C */  sw         $zero, 0x2c($a0)
/* AE5A8 800AD9A8 AC800034 */  sw         $zero, 0x34($a0)
/* AE5AC 800AD9AC AC800038 */  sw         $zero, 0x38($a0)
/* AE5B0 800AD9B0 46042080 */  add.s      $f2, $f4, $f4
/* AE5B4 800AD9B4 AC80003C */  sw         $zero, 0x3c($a0)
/* AE5B8 800AD9B8 E488000C */  swc1       $f8, 0xc($a0)
/* AE5BC 800AD9BC 46005002 */  mul.s      $f0, $f10, $f0
/* AE5C0 800AD9C0 E4860018 */  swc1       $f6, 0x18($a0)
/* AE5C4 800AD9C4 E4840014 */  swc1       $f4, 0x14($a0)
/* AE5C8 800AD9C8 E4820024 */  swc1       $f2, 0x24($a0)
/* AE5CC 800AD9CC E48A0010 */  swc1       $f10, 0x10($a0)
/* AE5D0 800AD9D0 E4800020 */  swc1       $f0, 0x20($a0)
/* AE5D4 800AD9D4 03E00008 */  jr         $ra
/* AE5D8 800AD9D8 E4800030 */   swc1      $f0, 0x30($a0)

glabel func_800AD9DC
/* AE5DC 800AD9DC C4A20000 */  lwc1       $f2, ($a1)
/* AE5E0 800AD9E0 C4C00000 */  lwc1       $f0, ($a2)
/* AE5E4 800AD9E4 46001082 */  mul.s      $f2, $f2, $f0
/* AE5E8 800AD9E8 C4A80010 */  lwc1       $f8, 0x10($a1)
/* AE5EC 800AD9EC C4C00004 */  lwc1       $f0, 4($a2)
/* AE5F0 800AD9F0 46004202 */  mul.s      $f8, $f8, $f0
/* AE5F4 800AD9F4 C4A60020 */  lwc1       $f6, 0x20($a1)
/* AE5F8 800AD9F8 C4C00008 */  lwc1       $f0, 8($a2)
/* AE5FC 800AD9FC 46003182 */  mul.s      $f6, $f6, $f0
/* AE600 800ADA00 C4A40030 */  lwc1       $f4, 0x30($a1)
/* AE604 800ADA04 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AE608 800ADA08 46002102 */  mul.s      $f4, $f4, $f0
/* AE60C 800ADA0C 46081080 */  add.s      $f2, $f2, $f8
/* AE610 800ADA10 46061080 */  add.s      $f2, $f2, $f6
/* AE614 800ADA14 46041080 */  add.s      $f2, $f2, $f4
/* AE618 800ADA18 E4820000 */  swc1       $f2, ($a0)
/* AE61C 800ADA1C C4A00004 */  lwc1       $f0, 4($a1)
/* AE620 800ADA20 C4C20000 */  lwc1       $f2, ($a2)
/* AE624 800ADA24 46020002 */  mul.s      $f0, $f0, $f2
/* AE628 800ADA28 C4A80014 */  lwc1       $f8, 0x14($a1)
/* AE62C 800ADA2C C4C20004 */  lwc1       $f2, 4($a2)
/* AE630 800ADA30 46024202 */  mul.s      $f8, $f8, $f2
/* AE634 800ADA34 C4A60024 */  lwc1       $f6, 0x24($a1)
/* AE638 800ADA38 C4C20008 */  lwc1       $f2, 8($a2)
/* AE63C 800ADA3C 46023182 */  mul.s      $f6, $f6, $f2
/* AE640 800ADA40 C4A40034 */  lwc1       $f4, 0x34($a1)
/* AE644 800ADA44 C4C2000C */  lwc1       $f2, 0xc($a2)
/* AE648 800ADA48 46022102 */  mul.s      $f4, $f4, $f2
/* AE64C 800ADA4C 46080000 */  add.s      $f0, $f0, $f8
/* AE650 800ADA50 46060000 */  add.s      $f0, $f0, $f6
/* AE654 800ADA54 46040000 */  add.s      $f0, $f0, $f4
/* AE658 800ADA58 E4800004 */  swc1       $f0, 4($a0)
/* AE65C 800ADA5C C4A20008 */  lwc1       $f2, 8($a1)
/* AE660 800ADA60 C4C00000 */  lwc1       $f0, ($a2)
/* AE664 800ADA64 46001082 */  mul.s      $f2, $f2, $f0
/* AE668 800ADA68 C4A80018 */  lwc1       $f8, 0x18($a1)
/* AE66C 800ADA6C C4C00004 */  lwc1       $f0, 4($a2)
/* AE670 800ADA70 46004202 */  mul.s      $f8, $f8, $f0
/* AE674 800ADA74 C4A60028 */  lwc1       $f6, 0x28($a1)
/* AE678 800ADA78 C4C00008 */  lwc1       $f0, 8($a2)
/* AE67C 800ADA7C 46003182 */  mul.s      $f6, $f6, $f0
/* AE680 800ADA80 C4A40038 */  lwc1       $f4, 0x38($a1)
/* AE684 800ADA84 C4C0000C */  lwc1       $f0, 0xc($a2)
/* AE688 800ADA88 46002102 */  mul.s      $f4, $f4, $f0
/* AE68C 800ADA8C 46081080 */  add.s      $f2, $f2, $f8
/* AE690 800ADA90 46061080 */  add.s      $f2, $f2, $f6
/* AE694 800ADA94 46041080 */  add.s      $f2, $f2, $f4
/* AE698 800ADA98 E4820008 */  swc1       $f2, 8($a0)
/* AE69C 800ADA9C C4A0000C */  lwc1       $f0, 0xc($a1)
/* AE6A0 800ADAA0 C4C20000 */  lwc1       $f2, ($a2)
/* AE6A4 800ADAA4 46020002 */  mul.s      $f0, $f0, $f2
/* AE6A8 800ADAA8 C4A8001C */  lwc1       $f8, 0x1c($a1)
/* AE6AC 800ADAAC C4C20004 */  lwc1       $f2, 4($a2)
/* AE6B0 800ADAB0 46024202 */  mul.s      $f8, $f8, $f2
/* AE6B4 800ADAB4 C4A6002C */  lwc1       $f6, 0x2c($a1)
/* AE6B8 800ADAB8 C4C20008 */  lwc1       $f2, 8($a2)
/* AE6BC 800ADABC 46023182 */  mul.s      $f6, $f6, $f2
/* AE6C0 800ADAC0 C4A4003C */  lwc1       $f4, 0x3c($a1)
/* AE6C4 800ADAC4 C4C2000C */  lwc1       $f2, 0xc($a2)
/* AE6C8 800ADAC8 46022102 */  mul.s      $f4, $f4, $f2
/* AE6CC 800ADACC 46080000 */  add.s      $f0, $f0, $f8
/* AE6D0 800ADAD0 46060000 */  add.s      $f0, $f0, $f6
/* AE6D4 800ADAD4 46040000 */  add.s      $f0, $f0, $f4
/* AE6D8 800ADAD8 03E00008 */  jr         $ra
/* AE6DC 800ADADC E480000C */   swc1      $f0, 0xc($a0)
