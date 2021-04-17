.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel sub_square_add_
/* 71290 80070690 308200FF */  andi       $v0, $a0, 0xff
/* 71294 80070694 30C600FF */  andi       $a2, $a2, 0xff
/* 71298 80070698 00461023 */  subu       $v0, $v0, $a2
/* 7129C 8007069C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 712A0 800706A0 00420018 */  mult       $v0, $v0
/* 712A4 800706A4 30A500FF */  andi       $a1, $a1, 0xff
/* 712A8 800706A8 30E700FF */  andi       $a3, $a3, 0xff
/* 712AC 800706AC 00001012 */  mflo       $v0
/* 712B0 800706B0 00A72823 */  subu       $a1, $a1, $a3
/* 712B4 800706B4 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 712B8 800706B8 00A50018 */  mult       $a1, $a1
/* 712BC 800706BC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 712C0 800706C0 00002812 */  mflo       $a1
/* 712C4 800706C4 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 712C8 800706C8 00451021 */  addu       $v0, $v0, $a1
/* 712CC 800706CC 03E00008 */  jr         $ra
/* 712D0 800706D0 3042FFFF */   andi      $v0, $v0, 0xffff

glabel sub_square_add_sqrt
/* 712D4 800706D4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 712D8 800706D8 308400FF */  andi       $a0, $a0, 0xff
/* 712DC 800706DC 30A500FF */  andi       $a1, $a1, 0xff
/* 712E0 800706E0 30C600FF */  andi       $a2, $a2, 0xff
/* 712E4 800706E4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 712E8 800706E8 0C01C1A4 */  jal        sub_square_add_
/* 712EC 800706EC 30E700FF */   andi      $a3, $a3, 0xff
/* 712F0 800706F0 44826000 */  mtc1       $v0, $f12
/* 712F4 800706F4 46806320 */  cvt.s.w    $f12, $f12
/* 712F8 800706F8 0C0334B4 */  jal        _sqrtf
/* 712FC 800706FC 00000000 */   nop
/* 71300 80070700 3C01800E */  lui        $at, %hi(D_800DFCE0)
/* 71304 80070704 C422FCE0 */  lwc1       $f2, %lo(D_800DFCE0)($at)
/* 71308 80070708 4600103E */  c.le.s     $f2, $f0
/* 7130C 8007070C 00000000 */  nop
/* 71310 80070710 45030005 */  bc1tl      .L80070728
/* 71314 80070714 46020001 */   sub.s     $f0, $f0, $f2
/* 71318 80070718 4600008D */  trunc.w.s  $f2, $f0
/* 7131C 8007071C 44031000 */  mfc1       $v1, $f2
/* 71320 80070720 0801C1CF */  j          .L8007073C
/* 71324 80070724 8FBF0010 */   lw        $ra, 0x10($sp)
.L80070728:
/* 71328 80070728 4600008D */  trunc.w.s  $f2, $f0
/* 7132C 8007072C 44031000 */  mfc1       $v1, $f2
/* 71330 80070730 3C028000 */  lui        $v0, 0x8000
/* 71334 80070734 00621825 */  or         $v1, $v1, $v0
/* 71338 80070738 8FBF0010 */  lw         $ra, 0x10($sp)
.L8007073C:
/* 7133C 8007073C 3062FFFF */  andi       $v0, $v1, 0xffff
/* 71340 80070740 03E00008 */  jr         $ra
/* 71344 80070744 27BD0018 */   addiu     $sp, $sp, 0x18

glabel warrior_dividing
/* 71348 80070748 308400FF */  andi       $a0, $a0, 0xff
/* 7134C 8007074C 30A500FF */  andi       $a1, $a1, 0xff
/* 71350 80070750 0085001B */  divu       $zero, $a0, $a1
/* 71354 80070754 00002012 */  mflo       $a0
/* 71358 80070758 93A30013 */  lbu        $v1, 0x13($sp)
/* 7135C 8007075C 30E700FF */  andi       $a3, $a3, 0xff
/* 71360 80070760 00001010 */  mfhi       $v0
/* 71364 80070764 50A00001 */  beql       $a1, $zero, .L8007076C
/* 71368 80070768 000001CD */   break     0, 7
.L8007076C:
/* 7136C 8007076C 10C00006 */   beqz      $a2, .L80070788
/* 71370 80070770 308400FF */   andi      $a0, $a0, 0xff
/* 71374 80070774 50A00001 */  beql       $a1, $zero, .L8007077C
/* 71378 80070778 000001CD */   break     0, 7
.L8007077C:
/* 7137C 8007077C 10400002 */   beqz      $v0, .L80070788
/* 71380 80070780 24820001 */   addiu     $v0, $a0, 1
/* 71384 80070784 304400FF */  andi       $a0, $v0, 0xff
.L80070788:
/* 71388 80070788 10E00003 */  beqz       $a3, .L80070798
/* 7138C 8007078C 0087102B */   sltu      $v0, $a0, $a3
/* 71390 80070790 54400001 */  bnel       $v0, $zero, .L80070798
/* 71394 80070794 00E02021 */   addu      $a0, $a3, $zero
.L80070798:
/* 71398 80070798 10600003 */  beqz       $v1, .L800707A8
/* 7139C 8007079C 0064102B */   sltu      $v0, $v1, $a0
/* 713A0 800707A0 54400001 */  bnel       $v0, $zero, .L800707A8
/* 713A4 800707A4 00602021 */   addu      $a0, $v1, $zero
.L800707A8:
/* 713A8 800707A8 03E00008 */  jr         $ra
/* 713AC 800707AC 00801021 */   addu      $v0, $a0, $zero
