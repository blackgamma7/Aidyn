.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __sinf
/* CD630 800CCA30 E7AC0000 */  swc1       $f12, ($sp)
/* CD634 800CCA34 8FA20000 */  lw         $v0, ($sp)
/* CD638 800CCA38 00021D83 */  sra        $v1, $v0, 0x16
/* CD63C 800CCA3C 306301FF */  andi       $v1, $v1, 0x1ff
/* CD640 800CCA40 286200FF */  slti       $v0, $v1, 0xff
/* CD644 800CCA44 1040001B */  beqz       $v0, .L800CCAB4
/* CD648 800CCA48 286200E6 */   slti      $v0, $v1, 0xe6
/* CD64C 800CCA4C 14400017 */  bnez       $v0, .L800CCAAC
/* CD650 800CCA50 460061A1 */   cvt.d.s   $f6, $f12
/* CD654 800CCA54 00000000 */  nop
/* CD658 800CCA58 46263102 */  mul.d      $f4, $f6, $f6
/* CD65C 800CCA5C 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x18)
/* CD660 800CCA60 D42055A0 */  ldc1       $f0, %lo(sinf_rodata_0008+0x18)($at)
/* CD664 800CCA64 46240002 */  mul.d      $f0, $f0, $f4
/* CD668 800CCA68 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x10)
/* CD66C 800CCA6C D4225598 */  ldc1       $f2, %lo(sinf_rodata_0008+0x10)($at)
/* CD670 800CCA70 46220000 */  add.d      $f0, $f0, $f2
/* CD674 800CCA74 46240002 */  mul.d      $f0, $f0, $f4
/* CD678 800CCA78 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x8)
/* CD67C 800CCA7C D4225590 */  ldc1       $f2, %lo(sinf_rodata_0008+0x8)($at)
/* CD680 800CCA80 46220000 */  add.d      $f0, $f0, $f2
/* CD684 800CCA84 46240002 */  mul.d      $f0, $f0, $f4
/* CD688 800CCA88 00000000 */  nop
/* CD68C 800CCA8C 46243082 */  mul.d      $f2, $f6, $f4
/* CD690 800CCA90 3C01800E */  lui        $at, %hi(sinf_rodata_0008)
/* CD694 800CCA94 D4245588 */  ldc1       $f4, %lo(sinf_rodata_0008)($at)
/* CD698 800CCA98 46240000 */  add.d      $f0, $f0, $f4
/* CD69C 800CCA9C 46201082 */  mul.d      $f2, $f2, $f0
/* CD6A0 800CCAA0 46223000 */  add.d      $f0, $f6, $f2
/* CD6A4 800CCAA4 080332F2 */  j          .L800CCBC8
/* CD6A8 800CCAA8 46200020 */   cvt.s.d   $f0, $f0
.L800CCAAC:
/* CD6AC 800CCAAC 080332F2 */  j          .L800CCBC8
/* CD6B0 800CCAB0 46006006 */   mov.s     $f0, $f12
.L800CCAB4:
/* CD6B4 800CCAB4 28620136 */  slti       $v0, $v1, 0x136
/* CD6B8 800CCAB8 1040003A */  beqz       $v0, .L800CCBA4
/* CD6BC 800CCABC 00000000 */   nop
/* CD6C0 800CCAC0 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x20)
/* CD6C4 800CCAC4 D42055A8 */  ldc1       $f0, %lo(sinf_rodata_0008+0x20)($at)
/* CD6C8 800CCAC8 460061A1 */  cvt.d.s    $f6, $f12
/* CD6CC 800CCACC 46203102 */  mul.d      $f4, $f6, $f0
/* CD6D0 800CCAD0 44800000 */  mtc1       $zero, $f0
/* CD6D4 800CCAD4 44800800 */  mtc1       $zero, $f1
/* CD6D8 800CCAD8 00000000 */  nop
/* CD6DC 800CCADC 4624003E */  c.le.d     $f0, $f4
/* CD6E0 800CCAE0 00000000 */  nop
/* CD6E4 800CCAE4 45000005 */  bc1f       .L800CCAFC
/* CD6E8 800CCAE8 00000000 */   nop
/* CD6EC 800CCAEC 3C01800E */  lui        $at, %hi(sinf_rodata_0048)
/* CD6F0 800CCAF0 D42055C8 */  ldc1       $f0, %lo(sinf_rodata_0048)($at)
/* CD6F4 800CCAF4 080332C2 */  j          .L800CCB08
/* CD6F8 800CCAF8 46202000 */   add.d     $f0, $f4, $f0
.L800CCAFC:
/* CD6FC 800CCAFC 3C01800E */  lui        $at, %hi(sinf_rodata_0050)
/* CD700 800CCB00 D42055D0 */  ldc1       $f0, %lo(sinf_rodata_0050)($at)
/* CD704 800CCB04 46202001 */  sub.d      $f0, $f4, $f0
.L800CCB08:
/* CD708 800CCB08 4620008D */  trunc.w.d  $f2, $f0
/* CD70C 800CCB0C 44031000 */  mfc1       $v1, $f2
/* CD710 800CCB10 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x28)
/* CD714 800CCB14 D42255B0 */  ldc1       $f2, %lo(sinf_rodata_0008+0x28)($at)
/* CD718 800CCB18 44832000 */  mtc1       $v1, $f4
/* CD71C 800CCB1C 00000000 */  nop
/* CD720 800CCB20 46802121 */  cvt.d.w    $f4, $f4
/* CD724 800CCB24 46222082 */  mul.d      $f2, $f4, $f2
/* CD728 800CCB28 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x30)
/* CD72C 800CCB2C D42055B8 */  ldc1       $f0, %lo(sinf_rodata_0008+0x30)($at)
/* CD730 800CCB30 46202002 */  mul.d      $f0, $f4, $f0
/* CD734 800CCB34 46223181 */  sub.d      $f6, $f6, $f2
/* CD738 800CCB38 46203181 */  sub.d      $f6, $f6, $f0
/* CD73C 800CCB3C 46263102 */  mul.d      $f4, $f6, $f6
/* CD740 800CCB40 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x18)
/* CD744 800CCB44 D42055A0 */  ldc1       $f0, %lo(sinf_rodata_0008+0x18)($at)
/* CD748 800CCB48 46240002 */  mul.d      $f0, $f0, $f4
/* CD74C 800CCB4C 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x10)
/* CD750 800CCB50 D4225598 */  ldc1       $f2, %lo(sinf_rodata_0008+0x10)($at)
/* CD754 800CCB54 46220000 */  add.d      $f0, $f0, $f2
/* CD758 800CCB58 46240002 */  mul.d      $f0, $f0, $f4
/* CD75C 800CCB5C 3C01800E */  lui        $at, %hi(sinf_rodata_0008+0x8)
/* CD760 800CCB60 D4225590 */  ldc1       $f2, %lo(sinf_rodata_0008+0x8)($at)
/* CD764 800CCB64 46220000 */  add.d      $f0, $f0, $f2
/* CD768 800CCB68 46240002 */  mul.d      $f0, $f0, $f4
/* CD76C 800CCB6C 00000000 */  nop
/* CD770 800CCB70 46243082 */  mul.d      $f2, $f6, $f4
/* CD774 800CCB74 3C01800E */  lui        $at, %hi(sinf_rodata_0008)
/* CD778 800CCB78 D4245588 */  ldc1       $f4, %lo(sinf_rodata_0008)($at)
/* CD77C 800CCB7C 46240000 */  add.d      $f0, $f0, $f4
/* CD780 800CCB80 46201082 */  mul.d      $f2, $f2, $f0
/* CD784 800CCB84 30620001 */  andi       $v0, $v1, 1
/* CD788 800CCB88 14400003 */  bnez       $v0, .L800CCB98
/* CD78C 800CCB8C 46223000 */   add.d     $f0, $f6, $f2
/* CD790 800CCB90 080332F2 */  j          .L800CCBC8
/* CD794 800CCB94 46200020 */   cvt.s.d   $f0, $f0
.L800CCB98:
/* CD798 800CCB98 46200020 */  cvt.s.d    $f0, $f0
/* CD79C 800CCB9C 080332F2 */  j          .L800CCBC8
/* CD7A0 800CCBA0 46000007 */   neg.s     $f0, $f0
.L800CCBA4:
/* CD7A4 800CCBA4 460C6032 */  c.eq.s     $f12, $f12
/* CD7A8 800CCBA8 00000000 */  nop
/* CD7AC 800CCBAC 45000004 */  bc1f       .L800CCBC0
/* CD7B0 800CCBB0 00000000 */   nop
/* CD7B4 800CCBB4 3C01800E */  lui        $at, %hi(sinf_rodata_0040)
/* CD7B8 800CCBB8 080332F2 */  j          .L800CCBC8
/* CD7BC 800CCBBC C42055C0 */   lwc1      $f0, %lo(sinf_rodata_0040)($at)
.L800CCBC0:
/* CD7C0 800CCBC0 3C01800E */  lui        $at, %hi(__libm_qnan_f)
/* CD7C4 800CCBC4 C42053F0 */  lwc1       $f0, %lo(__libm_qnan_f)($at)
.L800CCBC8:
/* CD7C8 800CCBC8 03E00008 */  jr         $ra
/* CD7CC 800CCBCC 00000000 */   nop
