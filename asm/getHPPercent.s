.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8008F200
/* 8FE00 8008F200 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 8FE04 8008F204 AFB20058 */  sw         $s2, 0x58($sp)
/* 8FE08 8008F208 00809021 */  addu       $s2, $a0, $zero
/* 8FE0C 8008F20C AFB10054 */  sw         $s1, 0x54($sp)
/* 8FE10 8008F210 00A08821 */  addu       $s1, $a1, $zero
/* 8FE14 8008F214 02202021 */  addu       $a0, $s1, $zero
/* 8FE18 8008F218 AFBF005C */  sw         $ra, 0x5c($sp)
/* 8FE1C 8008F21C 0C01DEBD */  jal        getHPMax
/* 8FE20 8008F220 AFB00050 */   sw        $s0, 0x50($sp)
/* 8FE24 8008F224 02202021 */  addu       $a0, $s1, $zero
/* 8FE28 8008F228 0C01DED7 */  jal        getHPCurrent
/* 8FE2C 8008F22C 00408021 */   addu      $s0, $v0, $zero
/* 8FE30 8008F230 00021A00 */  sll        $v1, $v0, 8
/* 8FE34 8008F234 00621823 */  subu       $v1, $v1, $v0
/* 8FE38 8008F238 0070001A */  div        $zero, $v1, $s0
/* 8FE3C 8008F23C 00001812 */  mflo       $v1
/* 8FE40 8008F240 52000001 */  beql       $s0, $zero, .L8008F248
/* 8FE44 8008F244 000001CD */   break     0, 7
.L8008F248:
/* 8FE48 8008F248 28620100 */   slti      $v0, $v1, 0x100
/* 8FE4C 8008F24C 50400001 */  beql       $v0, $zero, .L8008F254
/* 8FE50 8008F250 240300FF */   addiu     $v1, $zero, 0xff
.L8008F254:
/* 8FE54 8008F254 8FBF005C */  lw         $ra, 0x5c($sp)
/* 8FE58 8008F258 02401021 */  addu       $v0, $s2, $zero
/* 8FE5C 8008F25C A3A30011 */  sb         $v1, 0x11($sp)
/* 8FE60 8008F260 00031827 */  nor        $v1, $zero, $v1
/* 8FE64 8008F264 A3A30010 */  sb         $v1, 0x10($sp)
/* 8FE68 8008F268 240300C8 */  addiu      $v1, $zero, 0xc8
/* 8FE6C 8008F26C A3A00012 */  sb         $zero, 0x12($sp)
/* 8FE70 8008F270 A3A30013 */  sb         $v1, 0x13($sp)
/* 8FE74 8008F274 8BA30010 */  lwl        $v1, 0x10($sp)
/* 8FE78 8008F278 9BA30013 */  lwr        $v1, 0x13($sp)
/* 8FE7C 8008F27C AA430000 */  swl        $v1, ($s2)
/* 8FE80 8008F280 BA430003 */  swr        $v1, 3($s2)
/* 8FE84 8008F284 8FB20058 */  lw         $s2, 0x58($sp)
/* 8FE88 8008F288 8FB10054 */  lw         $s1, 0x54($sp)
/* 8FE8C 8008F28C 8FB00050 */  lw         $s0, 0x50($sp)
/* 8FE90 8008F290 03E00008 */  jr         $ra
/* 8FE94 8008F294 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8008F298
/* 8FE98 8008F298 30A500FF */  andi       $a1, $a1, 0xff
/* 8FE9C 8008F29C 30C600FF */  andi       $a2, $a2, 0xff
/* 8FEA0 8008F2A0 30E700FF */  andi       $a3, $a3, 0xff
/* 8FEA4 8008F2A4 93AD0013 */  lbu        $t5, 0x13($sp)
/* 8FEA8 8008F2A8 00004021 */  addu       $t0, $zero, $zero
/* 8FEAC 8008F2AC 248C0208 */  addiu      $t4, $a0, 0x208
/* 8FEB0 8008F2B0 248B0209 */  addiu      $t3, $a0, 0x209
/* 8FEB4 8008F2B4 248A020A */  addiu      $t2, $a0, 0x20a
/* 8FEB8 8008F2B8 2489020B */  addiu      $t1, $a0, 0x20b
.L8008F2BC:
/* 8FEBC 8008F2BC 00082080 */  sll        $a0, $t0, 2
/* 8FEC0 8008F2C0 25020001 */  addiu      $v0, $t0, 1
/* 8FEC4 8008F2C4 304800FF */  andi       $t0, $v0, 0xff
/* 8FEC8 8008F2C8 01841821 */  addu       $v1, $t4, $a0
/* 8FECC 8008F2CC 01641021 */  addu       $v0, $t3, $a0
/* 8FED0 8008F2D0 A0650000 */  sb         $a1, ($v1)
/* 8FED4 8008F2D4 01441821 */  addu       $v1, $t2, $a0
/* 8FED8 8008F2D8 01242021 */  addu       $a0, $t1, $a0
/* 8FEDC 8008F2DC A0460000 */  sb         $a2, ($v0)
/* 8FEE0 8008F2E0 2D020004 */  sltiu      $v0, $t0, 4
/* 8FEE4 8008F2E4 A0670000 */  sb         $a3, ($v1)
/* 8FEE8 8008F2E8 1440FFF4 */  bnez       $v0, .L8008F2BC
/* 8FEEC 8008F2EC A08D0000 */   sb        $t5, ($a0)
/* 8FEF0 8008F2F0 03E00008 */  jr         $ra
/* 8FEF4 8008F2F4 00000000 */   nop
/* 8FEF8 8008F2F8 00000000 */  nop
/* 8FEFC 8008F2FC 00000000 */  nop
