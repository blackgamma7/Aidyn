.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osAiSetFrequency
/* BED30 800BE130 44841000 */  mtc1       $a0, $f2
/* BED34 800BE134 00000000 */  nop
/* BED38 800BE138 468010A1 */  cvt.d.w    $f2, $f2
/* BED3C 800BE13C 3C01800F */  lui        $at, %hi(osViClock)
/* BED40 800BE140 C4243838 */  lwc1       $f4, %lo(osViClock)($at)
/* BED44 800BE144 46802120 */  cvt.s.w    $f4, $f4
/* BED48 800BE148 04830005 */  bgezl      $a0, .L800BE160
/* BED4C 800BE14C 46201020 */   cvt.s.d   $f0, $f2
/* BED50 800BE150 3C01800E */  lui        $at, %hi(aisetfreq_rodata_0000)
/* BED54 800BE154 D4205310 */  ldc1       $f0, %lo(aisetfreq_rodata_0000)($at)
/* BED58 800BE158 46201080 */  add.d      $f2, $f2, $f0
/* BED5C 800BE15C 46201020 */  cvt.s.d    $f0, $f2
.L800BE160:
/* BED60 800BE160 46002003 */  div.s      $f0, $f4, $f0
/* BED64 800BE164 3C013F00 */  lui        $at, 0x3f00
/* BED68 800BE168 44811000 */  mtc1       $at, $f2
/* BED6C 800BE16C 00000000 */  nop
/* BED70 800BE170 46020080 */  add.s      $f2, $f0, $f2
/* BED74 800BE174 3C014F00 */  lui        $at, 0x4f00
/* BED78 800BE178 44810000 */  mtc1       $at, $f0
/* BED7C 800BE17C 00000000 */  nop
/* BED80 800BE180 4602003E */  c.le.s     $f0, $f2
/* BED84 800BE184 00000000 */  nop
/* BED88 800BE188 00000000 */  nop
/* BED8C 800BE18C 45030006 */  bc1tl      .L800BE1A8
/* BED90 800BE190 46001001 */   sub.s     $f0, $f2, $f0
/* BED94 800BE194 4600100D */  trunc.w.s  $f0, $f2
/* BED98 800BE198 44050000 */  mfc1       $a1, $f0
/* BED9C 800BE19C 00000000 */  nop
/* BEDA0 800BE1A0 0802F86F */  j          .L800BE1BC
/* BEDA4 800BE1A4 2CA20084 */   sltiu     $v0, $a1, 0x84
.L800BE1A8:
/* BEDA8 800BE1A8 4600008D */  trunc.w.s  $f2, $f0
/* BEDAC 800BE1AC 44051000 */  mfc1       $a1, $f2
/* BEDB0 800BE1B0 3C028000 */  lui        $v0, 0x8000
/* BEDB4 800BE1B4 00A22825 */  or         $a1, $a1, $v0
/* BEDB8 800BE1B8 2CA20084 */  sltiu      $v0, $a1, 0x84
.L800BE1BC:
/* BEDBC 800BE1BC 14400020 */  bnez       $v0, .L800BE240
/* BEDC0 800BE1C0 2402FFFF */   addiu     $v0, $zero, -1
/* BEDC4 800BE1C4 3C023E0F */  lui        $v0, 0x3e0f
/* BEDC8 800BE1C8 344283E1 */  ori        $v0, $v0, 0x83e1
/* BEDCC 800BE1CC 00A20019 */  multu      $a1, $v0
/* BEDD0 800BE1D0 00003810 */  mfhi       $a3
/* BEDD4 800BE1D4 00073102 */  srl        $a2, $a3, 4
/* BEDD8 800BE1D8 30C200FF */  andi       $v0, $a2, 0xff
/* BEDDC 800BE1DC 2C420011 */  sltiu      $v0, $v0, 0x11
/* BEDE0 800BE1E0 50400001 */  beql       $v0, $zero, .L800BE1E8
/* BEDE4 800BE1E4 24060010 */   addiu     $a2, $zero, 0x10
.L800BE1E8:
/* BEDE8 800BE1E8 3C03A450 */  lui        $v1, 0xa450
/* BEDEC 800BE1EC 34630010 */  ori        $v1, $v1, 0x10
/* BEDF0 800BE1F0 3C04A450 */  lui        $a0, 0xa450
/* BEDF4 800BE1F4 34840014 */  ori        $a0, $a0, 0x14
/* BEDF8 800BE1F8 24A2FFFF */  addiu      $v0, $a1, -1
/* BEDFC 800BE1FC AC620000 */  sw         $v0, ($v1)
/* BEE00 800BE200 3C02800F */  lui        $v0, %hi(osViClock)
/* BEE04 800BE204 8C423838 */  lw         $v0, %lo(osViClock)($v0)
/* BEE08 800BE208 30C300FF */  andi       $v1, $a2, 0xff
/* BEE0C 800BE20C 2463FFFF */  addiu      $v1, $v1, -1
/* BEE10 800BE210 AC830000 */  sw         $v1, ($a0)
/* BEE14 800BE214 0045001A */  div        $zero, $v0, $a1
/* BEE18 800BE218 14A00002 */  bnez       $a1, .L800BE224
/* BEE1C 800BE21C 00000000 */   nop
/* BEE20 800BE220 0007000D */  break      7
.L800BE224:
/* BEE24 800BE224 2401FFFF */   addiu     $at, $zero, -1
/* BEE28 800BE228 14A10004 */  bne        $a1, $at, .L800BE23C
/* BEE2C 800BE22C 3C018000 */   lui       $at, 0x8000
/* BEE30 800BE230 14410002 */  bne        $v0, $at, .L800BE23C
/* BEE34 800BE234 00000000 */   nop
/* BEE38 800BE238 0006000D */  break      6
.L800BE23C:
/* BEE3C 800BE23C 00001012 */   mflo      $v0
.L800BE240:
/* BEE40 800BE240 03E00008 */  jr         $ra
/* BEE44 800BE244 00000000 */   nop
/* BEE48 800BE248 00000000 */  nop
/* BEE4C 800BE24C 00000000 */  nop
