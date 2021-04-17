.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __cosf
/* BF940 800BED40 E7AC0000 */  swc1       $f12, ($sp)
/* BF944 800BED44 8FA20000 */  lw         $v0, ($sp)
/* BF948 800BED48 00021583 */  sra        $v0, $v0, 0x16
/* BF94C 800BED4C 304201FF */  andi       $v0, $v0, 0x1ff
/* BF950 800BED50 28420136 */  slti       $v0, $v0, 0x136
/* BF954 800BED54 10400043 */  beqz       $v0, .L800BEE64
/* BF958 800BED58 00000000 */   nop
/* BF95C 800BED5C 44800000 */  mtc1       $zero, $f0
/* BF960 800BED60 00000000 */  nop
/* BF964 800BED64 460C003C */  c.lt.s     $f0, $f12
/* BF968 800BED68 00000000 */  nop
/* BF96C 800BED6C 00000000 */  nop
/* BF970 800BED70 45010002 */  bc1t       .L800BED7C
/* BF974 800BED74 46006106 */   mov.s     $f4, $f12
/* BF978 800BED78 46006107 */  neg.s      $f4, $f12
.L800BED7C:
/* BF97C 800BED7C 3C01800E */  lui        $at, %hi(D_800E5348)
/* BF980 800BED80 D4205348 */  ldc1       $f0, %lo(D_800E5348)($at)
/* BF984 800BED84 460021A1 */  cvt.d.s    $f6, $f4
/* BF988 800BED88 46203002 */  mul.d      $f0, $f6, $f0
/* BF98C 800BED8C 3C01800E */  lui        $at, %hi(cosf_rodata_0048)
/* BF990 800BED90 D4225368 */  ldc1       $f2, %lo(cosf_rodata_0048)($at)
/* BF994 800BED94 46220100 */  add.d      $f4, $f0, $f2
/* BF998 800BED98 44800000 */  mtc1       $zero, $f0
/* BF99C 800BED9C 44800800 */  mtc1       $zero, $f1
/* BF9A0 800BEDA0 00000000 */  nop
/* BF9A4 800BEDA4 4624003E */  c.le.d     $f0, $f4
/* BF9A8 800BEDA8 00000000 */  nop
/* BF9AC 800BEDAC 00000000 */  nop
/* BF9B0 800BEDB0 45020002 */  bc1fl      .L800BEDBC
/* BF9B4 800BEDB4 46222001 */   sub.d     $f0, $f4, $f2
/* BF9B8 800BEDB8 46222000 */  add.d      $f0, $f4, $f2
.L800BEDBC:
/* BF9BC 800BEDBC 4620008D */  trunc.w.d  $f2, $f0
/* BF9C0 800BEDC0 44031000 */  mfc1       $v1, $f2
/* BF9C4 800BEDC4 3C01800E */  lui        $at, %hi(cosf_rodata_0050)
/* BF9C8 800BEDC8 D4205370 */  ldc1       $f0, %lo(cosf_rodata_0050)($at)
/* BF9CC 800BEDCC 44832000 */  mtc1       $v1, $f4
/* BF9D0 800BEDD0 00000000 */  nop
/* BF9D4 800BEDD4 46802121 */  cvt.d.w    $f4, $f4
/* BF9D8 800BEDD8 46202101 */  sub.d      $f4, $f4, $f0
/* BF9DC 800BEDDC 3C01800E */  lui        $at, %hi(D_800E5350)
/* BF9E0 800BEDE0 D4225350 */  ldc1       $f2, %lo(D_800E5350)($at)
/* BF9E4 800BEDE4 46222082 */  mul.d      $f2, $f4, $f2
/* BF9E8 800BEDE8 3C01800E */  lui        $at, %hi(D_800E5358)
/* BF9EC 800BEDEC D4205358 */  ldc1       $f0, %lo(D_800E5358)($at)
/* BF9F0 800BEDF0 46202002 */  mul.d      $f0, $f4, $f0
/* BF9F4 800BEDF4 46223181 */  sub.d      $f6, $f6, $f2
/* BF9F8 800BEDF8 46203181 */  sub.d      $f6, $f6, $f0
/* BF9FC 800BEDFC 46263102 */  mul.d      $f4, $f6, $f6
/* BFA00 800BEE00 3C01800E */  lui        $at, %hi(D_800E5340)
/* BFA04 800BEE04 D4205340 */  ldc1       $f0, %lo(D_800E5340)($at)
/* BFA08 800BEE08 46240002 */  mul.d      $f0, $f0, $f4
/* BFA0C 800BEE0C 3C01800E */  lui        $at, %hi(D_800E5338)
/* BFA10 800BEE10 D4225338 */  ldc1       $f2, %lo(D_800E5338)($at)
/* BFA14 800BEE14 46220000 */  add.d      $f0, $f0, $f2
/* BFA18 800BEE18 46240002 */  mul.d      $f0, $f0, $f4
/* BFA1C 800BEE1C 3C01800E */  lui        $at, %hi(D_800E5330)
/* BFA20 800BEE20 D4225330 */  ldc1       $f2, %lo(D_800E5330)($at)
/* BFA24 800BEE24 46220000 */  add.d      $f0, $f0, $f2
/* BFA28 800BEE28 46240002 */  mul.d      $f0, $f0, $f4
/* BFA2C 800BEE2C 00000000 */  nop
/* BFA30 800BEE30 46243102 */  mul.d      $f4, $f6, $f4
/* BFA34 800BEE34 3C01800E */  lui        $at, %hi(cosf_rodata_0008)
/* BFA38 800BEE38 D4225328 */  ldc1       $f2, %lo(cosf_rodata_0008)($at)
/* BFA3C 800BEE3C 46220000 */  add.d      $f0, $f0, $f2
/* BFA40 800BEE40 46202102 */  mul.d      $f4, $f4, $f0
/* BFA44 800BEE44 30620001 */  andi       $v0, $v1, 1
/* BFA48 800BEE48 14400003 */  bnez       $v0, .L800BEE58
/* BFA4C 800BEE4C 46243000 */   add.d     $f0, $f6, $f4
/* BFA50 800BEE50 0802FBA2 */  j          .L800BEE88
/* BFA54 800BEE54 46200020 */   cvt.s.d   $f0, $f0
.L800BEE58:
/* BFA58 800BEE58 46200020 */  cvt.s.d    $f0, $f0
/* BFA5C 800BEE5C 0802FBA2 */  j          .L800BEE88
/* BFA60 800BEE60 46000007 */   neg.s     $f0, $f0
.L800BEE64:
/* BFA64 800BEE64 460C6032 */  c.eq.s     $f12, $f12
/* BFA68 800BEE68 00000000 */  nop
/* BFA6C 800BEE6C 45000004 */  bc1f       .L800BEE80
/* BFA70 800BEE70 00000000 */   nop
/* BFA74 800BEE74 3C01800E */  lui        $at, %hi(cosf_rodata_0040)
/* BFA78 800BEE78 0802FBA2 */  j          .L800BEE88
/* BFA7C 800BEE7C C4205360 */   lwc1      $f0, %lo(cosf_rodata_0040)($at)
.L800BEE80:
/* BFA80 800BEE80 3C01800E */  lui        $at, %hi(__libm_qnan_f)
/* BFA84 800BEE84 C42053F0 */  lwc1       $f0, %lo(__libm_qnan_f)($at)
.L800BEE88:
/* BFA88 800BEE88 03E00008 */  jr         $ra
/* BFA8C 800BEE8C 00000000 */   nop
