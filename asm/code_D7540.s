.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800D6940
/* D7540 800D6940 24880010 */  addiu      $t0, $a0, 0x10
/* D7544 800D6944 44870000 */  mtc1       $a3, $f0
/* D7548 800D6948 46800020 */  cvt.s.w    $f0, $f0
/* D754C 800D694C 3C02800E */  lui        $v0, %hi(D_800E52B0)
/* D7550 800D6950 8FA30010 */  lw         $v1, 0x10($sp)
/* D7554 800D6954 244252B0 */  addiu      $v0, $v0, %lo(D_800E52B0)
/* D7558 800D6958 AC800000 */  sw         $zero, ($a0)
/* D755C 800D695C E4800004 */  swc1       $f0, 4($a0)
/* D7560 800D6960 AC85000C */  sw         $a1, 0xc($a0)
/* D7564 800D6964 AC820008 */  sw         $v0, 8($a0)
/* D7568 800D6968 24620030 */  addiu      $v0, $v1, 0x30
.L800D696C:
/* D756C 800D696C 8C670000 */  lw         $a3, ($v1)
/* D7570 800D6970 8C690004 */  lw         $t1, 4($v1)
/* D7574 800D6974 8C6A0008 */  lw         $t2, 8($v1)
/* D7578 800D6978 8C6B000C */  lw         $t3, 0xc($v1)
/* D757C 800D697C AD070000 */  sw         $a3, ($t0)
/* D7580 800D6980 AD090004 */  sw         $t1, 4($t0)
/* D7584 800D6984 AD0A0008 */  sw         $t2, 8($t0)
/* D7588 800D6988 AD0B000C */  sw         $t3, 0xc($t0)
/* D758C 800D698C 24630010 */  addiu      $v1, $v1, 0x10
/* D7590 800D6990 1462FFF6 */  bne        $v1, $v0, .L800D696C
/* D7594 800D6994 25080010 */   addiu     $t0, $t0, 0x10
/* D7598 800D6998 84A20000 */  lh         $v0, ($a1)
/* D759C 800D699C 44820000 */  mtc1       $v0, $f0
/* D75A0 800D69A0 46800021 */  cvt.d.w    $f0, $f0
/* D75A4 800D69A4 F4800040 */  sdc1       $f0, 0x40($a0)
/* D75A8 800D69A8 84C20000 */  lh         $v0, ($a2)
/* D75AC 800D69AC 44820000 */  mtc1       $v0, $f0
/* D75B0 800D69B0 46800021 */  cvt.d.w    $f0, $f0
/* D75B4 800D69B4 F4800048 */  sdc1       $f0, 0x48($a0)
/* D75B8 800D69B8 03E00008 */  jr         $ra
/* D75BC 800D69BC 00801021 */   addu      $v0, $a0, $zero

glabel func_800D69C0
/* D75C0 800D69C0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D75C4 800D69C4 3C02800E */  lui        $v0, %hi(D_800E52E0)
/* D75C8 800D69C8 244252E0 */  addiu      $v0, $v0, %lo(D_800E52E0)
/* D75CC 800D69CC AFBF0010 */  sw         $ra, 0x10($sp)
/* D75D0 800D69D0 D4800048 */  ldc1       $f0, 0x48($a0)
/* D75D4 800D69D4 8C83000C */  lw         $v1, 0xc($a0)
/* D75D8 800D69D8 30A50001 */  andi       $a1, $a1, 1
/* D75DC 800D69DC AC820008 */  sw         $v0, 8($a0)
/* D75E0 800D69E0 4620008D */  trunc.w.d  $f2, $f0
/* D75E4 800D69E4 44021000 */  mfc1       $v0, $f2
/* D75E8 800D69E8 10A00003 */  beqz       $a1, .L800D69F8
/* D75EC 800D69EC A4620000 */   sh        $v0, ($v1)
/* D75F0 800D69F0 0C026262 */  jal        passToFree
/* D75F4 800D69F4 00000000 */   nop
.L800D69F8:
/* D75F8 800D69F8 8FBF0010 */  lw         $ra, 0x10($sp)
/* D75FC 800D69FC 03E00008 */  jr         $ra
/* D7600 800D6A00 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6A04
/* D7604 800D6A04 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7608 800D6A08 AFB00010 */  sw         $s0, 0x10($sp)
/* D760C 800D6A0C 00808021 */  addu       $s0, $a0, $zero
/* D7610 800D6A10 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7614 800D6A14 D6020038 */  ldc1       $f2, 0x38($s0)
/* D7618 800D6A18 D6040030 */  ldc1       $f4, 0x30($s0)
/* D761C 800D6A1C 44853000 */  mtc1       $a1, $f6
/* D7620 800D6A20 46241081 */  sub.d      $f2, $f2, $f4
/* D7624 800D6A24 46003021 */  cvt.d.s    $f0, $f6
/* D7628 800D6A28 46220002 */  mul.d      $f0, $f0, $f2
/* D762C 800D6A2C 46202100 */  add.d      $f4, $f4, $f0
/* D7630 800D6A30 D6020020 */  ldc1       $f2, 0x20($s0)
/* D7634 800D6A34 46222101 */  sub.d      $f4, $f4, $f2
/* D7638 800D6A38 D60C0018 */  ldc1       $f12, 0x18($s0)
/* D763C 800D6A3C 46246302 */  mul.d      $f12, $f12, $f4
/* D7640 800D6A40 0C03328C */  jal        __sinf
/* D7644 800D6A44 46206320 */   cvt.s.d   $f12, $f12
/* D7648 800D6A48 D6040010 */  ldc1       $f4, 0x10($s0)
/* D764C 800D6A4C 46000021 */  cvt.d.s    $f0, $f0
/* D7650 800D6A50 46202102 */  mul.d      $f4, $f4, $f0
/* D7654 800D6A54 D6020048 */  ldc1       $f2, 0x48($s0)
/* D7658 800D6A58 D6000040 */  ldc1       $f0, 0x40($s0)
/* D765C 800D6A5C 46201081 */  sub.d      $f2, $f2, $f0
/* D7660 800D6A60 D6060028 */  ldc1       $f6, 0x28($s0)
/* D7664 800D6A64 46262100 */  add.d      $f4, $f4, $f6
/* D7668 800D6A68 46241082 */  mul.d      $f2, $f2, $f4
/* D766C 800D6A6C 46220000 */  add.d      $f0, $f0, $f2
/* D7670 800D6A70 8FBF0014 */  lw         $ra, 0x14($sp)
/* D7674 800D6A74 8FB00010 */  lw         $s0, 0x10($sp)
/* D7678 800D6A78 4620008D */  trunc.w.d  $f2, $f0
/* D767C 800D6A7C 44021000 */  mfc1       $v0, $f2
/* D7680 800D6A80 00021400 */  sll        $v0, $v0, 0x10
/* D7684 800D6A84 00021403 */  sra        $v0, $v0, 0x10
/* D7688 800D6A88 03E00008 */  jr         $ra
/* D768C 800D6A8C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6A90
/* D7690 800D6A90 24880010 */  addiu      $t0, $a0, 0x10
/* D7694 800D6A94 44870000 */  mtc1       $a3, $f0
/* D7698 800D6A98 46800020 */  cvt.s.w    $f0, $f0
/* D769C 800D6A9C 3C02800E */  lui        $v0, %hi(D_800E5280)
/* D76A0 800D6AA0 8FA30010 */  lw         $v1, 0x10($sp)
/* D76A4 800D6AA4 24425280 */  addiu      $v0, $v0, %lo(D_800E5280)
/* D76A8 800D6AA8 AC800000 */  sw         $zero, ($a0)
/* D76AC 800D6AAC E4800004 */  swc1       $f0, 4($a0)
/* D76B0 800D6AB0 AC85000C */  sw         $a1, 0xc($a0)
/* D76B4 800D6AB4 AC820008 */  sw         $v0, 8($a0)
/* D76B8 800D6AB8 24620030 */  addiu      $v0, $v1, 0x30
.L800D6ABC:
/* D76BC 800D6ABC 8C670000 */  lw         $a3, ($v1)
/* D76C0 800D6AC0 8C690004 */  lw         $t1, 4($v1)
/* D76C4 800D6AC4 8C6A0008 */  lw         $t2, 8($v1)
/* D76C8 800D6AC8 8C6B000C */  lw         $t3, 0xc($v1)
/* D76CC 800D6ACC AD070000 */  sw         $a3, ($t0)
/* D76D0 800D6AD0 AD090004 */  sw         $t1, 4($t0)
/* D76D4 800D6AD4 AD0A0008 */  sw         $t2, 8($t0)
/* D76D8 800D6AD8 AD0B000C */  sw         $t3, 0xc($t0)
/* D76DC 800D6ADC 24630010 */  addiu      $v1, $v1, 0x10
/* D76E0 800D6AE0 1462FFF6 */  bne        $v1, $v0, .L800D6ABC
/* D76E4 800D6AE4 25080010 */   addiu     $t0, $t0, 0x10
/* D76E8 800D6AE8 94A20000 */  lhu        $v0, ($a1)
/* D76EC 800D6AEC 94C30000 */  lhu        $v1, ($a2)
/* D76F0 800D6AF0 44820000 */  mtc1       $v0, $f0
/* D76F4 800D6AF4 46800021 */  cvt.d.w    $f0, $f0
/* D76F8 800D6AF8 44831000 */  mtc1       $v1, $f2
/* D76FC 800D6AFC 468010A1 */  cvt.d.w    $f2, $f2
/* D7700 800D6B00 F4800040 */  sdc1       $f0, 0x40($a0)
/* D7704 800D6B04 F4820048 */  sdc1       $f2, 0x48($a0)
/* D7708 800D6B08 03E00008 */  jr         $ra
/* D770C 800D6B0C 00801021 */   addu      $v0, $a0, $zero

glabel func_800D6B10
/* D7710 800D6B10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7714 800D6B14 3C02800E */  lui        $v0, 0x800e
/* D7718 800D6B18 AFBF0010 */  sw         $ra, 0x10($sp)
/* D771C 800D6B1C D4800048 */  ldc1       $f0, 0x48($a0)
/* D7720 800D6B20 3C01800E */  lui        $at, %hi(D_800E5230)
/* D7724 800D6B24 D4225230 */  ldc1       $f2, %lo(D_800E5230)($at)
/* D7728 800D6B28 8C87000C */  lw         $a3, 0xc($a0)
/* D772C 800D6B2C 24425280 */  addiu      $v0, $v0, 0x5280
/* D7730 800D6B30 4620103E */  c.le.d     $f2, $f0
/* D7734 800D6B34 00000000 */  nop
/* D7738 800D6B38 45010005 */  bc1t       .L800D6B50
/* D773C 800D6B3C AC820008 */   sw        $v0, 8($a0)
/* D7740 800D6B40 4620008D */  trunc.w.d  $f2, $f0
/* D7744 800D6B44 44061000 */  mfc1       $a2, $f2
/* D7748 800D6B48 08035ADA */  j          .L800D6B68
/* D774C 800D6B4C 3C02800E */   lui       $v0, 0x800e
.L800D6B50:
/* D7750 800D6B50 46220001 */  sub.d      $f0, $f0, $f2
/* D7754 800D6B54 4620008D */  trunc.w.d  $f2, $f0
/* D7758 800D6B58 44061000 */  mfc1       $a2, $f2
/* D775C 800D6B5C 3C028000 */  lui        $v0, 0x8000
/* D7760 800D6B60 00C23025 */  or         $a2, $a2, $v0
/* D7764 800D6B64 3C02800E */  lui        $v0, %hi(D_800E52E0)
.L800D6B68:
/* D7768 800D6B68 244252E0 */  addiu      $v0, $v0, %lo(D_800E52E0)
/* D776C 800D6B6C 30A30001 */  andi       $v1, $a1, 1
/* D7770 800D6B70 A4E60000 */  sh         $a2, ($a3)
/* D7774 800D6B74 10600003 */  beqz       $v1, .L800D6B84
/* D7778 800D6B78 AC820008 */   sw        $v0, 8($a0)
/* D777C 800D6B7C 0C026262 */  jal        passToFree
/* D7780 800D6B80 00000000 */   nop
.L800D6B84:
/* D7784 800D6B84 8FBF0010 */  lw         $ra, 0x10($sp)
/* D7788 800D6B88 03E00008 */  jr         $ra
/* D778C 800D6B8C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6B90
/* D7790 800D6B90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7794 800D6B94 AFB00010 */  sw         $s0, 0x10($sp)
/* D7798 800D6B98 00808021 */  addu       $s0, $a0, $zero
/* D779C 800D6B9C AFBF0014 */  sw         $ra, 0x14($sp)
/* D77A0 800D6BA0 D6020038 */  ldc1       $f2, 0x38($s0)
/* D77A4 800D6BA4 D6040030 */  ldc1       $f4, 0x30($s0)
/* D77A8 800D6BA8 44853000 */  mtc1       $a1, $f6
/* D77AC 800D6BAC 46241081 */  sub.d      $f2, $f2, $f4
/* D77B0 800D6BB0 46003021 */  cvt.d.s    $f0, $f6
/* D77B4 800D6BB4 46220002 */  mul.d      $f0, $f0, $f2
/* D77B8 800D6BB8 46202100 */  add.d      $f4, $f4, $f0
/* D77BC 800D6BBC D6020020 */  ldc1       $f2, 0x20($s0)
/* D77C0 800D6BC0 46222101 */  sub.d      $f4, $f4, $f2
/* D77C4 800D6BC4 D60C0018 */  ldc1       $f12, 0x18($s0)
/* D77C8 800D6BC8 46246302 */  mul.d      $f12, $f12, $f4
/* D77CC 800D6BCC 0C03328C */  jal        __sinf
/* D77D0 800D6BD0 46206320 */   cvt.s.d   $f12, $f12
/* D77D4 800D6BD4 D6020010 */  ldc1       $f2, 0x10($s0)
/* D77D8 800D6BD8 46000021 */  cvt.d.s    $f0, $f0
/* D77DC 800D6BDC 46201082 */  mul.d      $f2, $f2, $f0
/* D77E0 800D6BE0 D6060040 */  ldc1       $f6, 0x40($s0)
/* D77E4 800D6BE4 D6000048 */  ldc1       $f0, 0x48($s0)
/* D77E8 800D6BE8 46260001 */  sub.d      $f0, $f0, $f6
/* D77EC 800D6BEC D6040028 */  ldc1       $f4, 0x28($s0)
/* D77F0 800D6BF0 46241080 */  add.d      $f2, $f2, $f4
/* D77F4 800D6BF4 46220002 */  mul.d      $f0, $f0, $f2
/* D77F8 800D6BF8 46203000 */  add.d      $f0, $f6, $f0
/* D77FC 800D6BFC 3C01800E */  lui        $at, %hi(D_800E5238)
/* D7800 800D6C00 D4265238 */  ldc1       $f6, %lo(D_800E5238)($at)
/* D7804 800D6C04 4620303E */  c.le.d     $f6, $f0
/* D7808 800D6C08 00000000 */  nop
/* D780C 800D6C0C 45030005 */  bc1tl      .L800D6C24
/* D7810 800D6C10 46260001 */   sub.d     $f0, $f0, $f6
/* D7814 800D6C14 4620008D */  trunc.w.d  $f2, $f0
/* D7818 800D6C18 44031000 */  mfc1       $v1, $f2
/* D781C 800D6C1C 08035B0E */  j          .L800D6C38
/* D7820 800D6C20 8FBF0014 */   lw        $ra, 0x14($sp)
.L800D6C24:
/* D7824 800D6C24 4620008D */  trunc.w.d  $f2, $f0
/* D7828 800D6C28 44031000 */  mfc1       $v1, $f2
/* D782C 800D6C2C 3C028000 */  lui        $v0, 0x8000
/* D7830 800D6C30 00621825 */  or         $v1, $v1, $v0
/* D7834 800D6C34 8FBF0014 */  lw         $ra, 0x14($sp)
.L800D6C38:
/* D7838 800D6C38 8FB00010 */  lw         $s0, 0x10($sp)
/* D783C 800D6C3C 3062FFFF */  andi       $v0, $v1, 0xffff
/* D7840 800D6C40 03E00008 */  jr         $ra
/* D7844 800D6C44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6C48
/* D7848 800D6C48 24880010 */  addiu      $t0, $a0, 0x10
/* D784C 800D6C4C 44870000 */  mtc1       $a3, $f0
/* D7850 800D6C50 46800020 */  cvt.s.w    $f0, $f0
/* D7854 800D6C54 3C02800E */  lui        $v0, %hi(D_800E5250)
/* D7858 800D6C58 8FA30010 */  lw         $v1, 0x10($sp)
/* D785C 800D6C5C 24425250 */  addiu      $v0, $v0, %lo(D_800E5250)
/* D7860 800D6C60 AC800000 */  sw         $zero, ($a0)
/* D7864 800D6C64 E4800004 */  swc1       $f0, 4($a0)
/* D7868 800D6C68 AC85000C */  sw         $a1, 0xc($a0)
/* D786C 800D6C6C AC820008 */  sw         $v0, 8($a0)
/* D7870 800D6C70 24620030 */  addiu      $v0, $v1, 0x30
.L800D6C74:
/* D7874 800D6C74 8C670000 */  lw         $a3, ($v1)
/* D7878 800D6C78 8C690004 */  lw         $t1, 4($v1)
/* D787C 800D6C7C 8C6A0008 */  lw         $t2, 8($v1)
/* D7880 800D6C80 8C6B000C */  lw         $t3, 0xc($v1)
/* D7884 800D6C84 AD070000 */  sw         $a3, ($t0)
/* D7888 800D6C88 AD090004 */  sw         $t1, 4($t0)
/* D788C 800D6C8C AD0A0008 */  sw         $t2, 8($t0)
/* D7890 800D6C90 AD0B000C */  sw         $t3, 0xc($t0)
/* D7894 800D6C94 24630010 */  addiu      $v1, $v1, 0x10
/* D7898 800D6C98 1462FFF6 */  bne        $v1, $v0, .L800D6C74
/* D789C 800D6C9C 25080010 */   addiu     $t0, $t0, 0x10
/* D78A0 800D6CA0 90A20000 */  lbu        $v0, ($a1)
/* D78A4 800D6CA4 44820000 */  mtc1       $v0, $f0
/* D78A8 800D6CA8 46800021 */  cvt.d.w    $f0, $f0
/* D78AC 800D6CAC F4800040 */  sdc1       $f0, 0x40($a0)
/* D78B0 800D6CB0 90C20000 */  lbu        $v0, ($a2)
/* D78B4 800D6CB4 44820000 */  mtc1       $v0, $f0
/* D78B8 800D6CB8 46800021 */  cvt.d.w    $f0, $f0
/* D78BC 800D6CBC F4800048 */  sdc1       $f0, 0x48($a0)
/* D78C0 800D6CC0 03E00008 */  jr         $ra
/* D78C4 800D6CC4 00801021 */   addu      $v0, $a0, $zero

glabel func_800D6CC8
/* D78C8 800D6CC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D78CC 800D6CCC 3C02800E */  lui        $v0, 0x800e
/* D78D0 800D6CD0 AFBF0010 */  sw         $ra, 0x10($sp)
/* D78D4 800D6CD4 D4800048 */  ldc1       $f0, 0x48($a0)
/* D78D8 800D6CD8 3C01800E */  lui        $at, %hi(D_800E5240)
/* D78DC 800D6CDC D4225240 */  ldc1       $f2, %lo(D_800E5240)($at)
/* D78E0 800D6CE0 8C87000C */  lw         $a3, 0xc($a0)
/* D78E4 800D6CE4 24425250 */  addiu      $v0, $v0, 0x5250
/* D78E8 800D6CE8 4620103E */  c.le.d     $f2, $f0
/* D78EC 800D6CEC 00000000 */  nop
/* D78F0 800D6CF0 45010005 */  bc1t       .L800D6D08
/* D78F4 800D6CF4 AC820008 */   sw        $v0, 8($a0)
/* D78F8 800D6CF8 4620008D */  trunc.w.d  $f2, $f0
/* D78FC 800D6CFC 44061000 */  mfc1       $a2, $f2
/* D7900 800D6D00 08035B48 */  j          .L800D6D20
/* D7904 800D6D04 3C02800E */   lui       $v0, 0x800e
.L800D6D08:
/* D7908 800D6D08 46220001 */  sub.d      $f0, $f0, $f2
/* D790C 800D6D0C 4620008D */  trunc.w.d  $f2, $f0
/* D7910 800D6D10 44061000 */  mfc1       $a2, $f2
/* D7914 800D6D14 3C028000 */  lui        $v0, 0x8000
/* D7918 800D6D18 00C23025 */  or         $a2, $a2, $v0
/* D791C 800D6D1C 3C02800E */  lui        $v0, %hi(D_800E52E0)
.L800D6D20:
/* D7920 800D6D20 244252E0 */  addiu      $v0, $v0, %lo(D_800E52E0)
/* D7924 800D6D24 30A30001 */  andi       $v1, $a1, 1
/* D7928 800D6D28 A0E60000 */  sb         $a2, ($a3)
/* D792C 800D6D2C 10600003 */  beqz       $v1, .L800D6D3C
/* D7930 800D6D30 AC820008 */   sw        $v0, 8($a0)
/* D7934 800D6D34 0C026262 */  jal        passToFree
/* D7938 800D6D38 00000000 */   nop
.L800D6D3C:
/* D793C 800D6D3C 8FBF0010 */  lw         $ra, 0x10($sp)
/* D7940 800D6D40 03E00008 */  jr         $ra
/* D7944 800D6D44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6D48
/* D7948 800D6D48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D794C 800D6D4C AFB00010 */  sw         $s0, 0x10($sp)
/* D7950 800D6D50 00808021 */  addu       $s0, $a0, $zero
/* D7954 800D6D54 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7958 800D6D58 D6020038 */  ldc1       $f2, 0x38($s0)
/* D795C 800D6D5C D6040030 */  ldc1       $f4, 0x30($s0)
/* D7960 800D6D60 44853000 */  mtc1       $a1, $f6
/* D7964 800D6D64 46241081 */  sub.d      $f2, $f2, $f4
/* D7968 800D6D68 46003021 */  cvt.d.s    $f0, $f6
/* D796C 800D6D6C 46220002 */  mul.d      $f0, $f0, $f2
/* D7970 800D6D70 46202100 */  add.d      $f4, $f4, $f0
/* D7974 800D6D74 D6020020 */  ldc1       $f2, 0x20($s0)
/* D7978 800D6D78 46222101 */  sub.d      $f4, $f4, $f2
/* D797C 800D6D7C D60C0018 */  ldc1       $f12, 0x18($s0)
/* D7980 800D6D80 46246302 */  mul.d      $f12, $f12, $f4
/* D7984 800D6D84 0C03328C */  jal        __sinf
/* D7988 800D6D88 46206320 */   cvt.s.d   $f12, $f12
/* D798C 800D6D8C D6020010 */  ldc1       $f2, 0x10($s0)
/* D7990 800D6D90 46000021 */  cvt.d.s    $f0, $f0
/* D7994 800D6D94 46201082 */  mul.d      $f2, $f2, $f0
/* D7998 800D6D98 D6060040 */  ldc1       $f6, 0x40($s0)
/* D799C 800D6D9C D6000048 */  ldc1       $f0, 0x48($s0)
/* D79A0 800D6DA0 46260001 */  sub.d      $f0, $f0, $f6
/* D79A4 800D6DA4 D6040028 */  ldc1       $f4, 0x28($s0)
/* D79A8 800D6DA8 46241080 */  add.d      $f2, $f2, $f4
/* D79AC 800D6DAC 46220002 */  mul.d      $f0, $f0, $f2
/* D79B0 800D6DB0 46203000 */  add.d      $f0, $f6, $f0
/* D79B4 800D6DB4 3C01800E */  lui        $at, %hi(D_800E5248)
/* D79B8 800D6DB8 D4265248 */  ldc1       $f6, %lo(D_800E5248)($at)
/* D79BC 800D6DBC 4620303E */  c.le.d     $f6, $f0
/* D79C0 800D6DC0 00000000 */  nop
/* D79C4 800D6DC4 45030005 */  bc1tl      .L800D6DDC
/* D79C8 800D6DC8 46260001 */   sub.d     $f0, $f0, $f6
/* D79CC 800D6DCC 4620008D */  trunc.w.d  $f2, $f0
/* D79D0 800D6DD0 44031000 */  mfc1       $v1, $f2
/* D79D4 800D6DD4 08035B7C */  j          .L800D6DF0
/* D79D8 800D6DD8 8FBF0014 */   lw        $ra, 0x14($sp)
.L800D6DDC:
/* D79DC 800D6DDC 4620008D */  trunc.w.d  $f2, $f0
/* D79E0 800D6DE0 44031000 */  mfc1       $v1, $f2
/* D79E4 800D6DE4 3C028000 */  lui        $v0, 0x8000
/* D79E8 800D6DE8 00621825 */  or         $v1, $v1, $v0
/* D79EC 800D6DEC 8FBF0014 */  lw         $ra, 0x14($sp)
.L800D6DF0:
/* D79F0 800D6DF0 8FB00010 */  lw         $s0, 0x10($sp)
/* D79F4 800D6DF4 306200FF */  andi       $v0, $v1, 0xff
/* D79F8 800D6DF8 03E00008 */  jr         $ra
/* D79FC 800D6DFC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6E00
/* D7A00 800D6E00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7A04 800D6E04 3C02800E */  lui        $v0, %hi(D_800E52E0)
/* D7A08 800D6E08 244252E0 */  addiu      $v0, $v0, %lo(D_800E52E0)
/* D7A0C 800D6E0C 30A50001 */  andi       $a1, $a1, 1
/* D7A10 800D6E10 AFBF0010 */  sw         $ra, 0x10($sp)
/* D7A14 800D6E14 10A00003 */  beqz       $a1, .L800D6E24
/* D7A18 800D6E18 AC820008 */   sw        $v0, 8($a0)
/* D7A1C 800D6E1C 0C026262 */  jal        passToFree
/* D7A20 800D6E20 00000000 */   nop
.L800D6E24:
/* D7A24 800D6E24 8FBF0010 */  lw         $ra, 0x10($sp)
/* D7A28 800D6E28 03E00008 */  jr         $ra
/* D7A2C 800D6E2C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6E30
/* D7A30 800D6E30 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7A34 800D6E34 00801021 */  addu       $v0, $a0, $zero
/* D7A38 800D6E38 AFBF0010 */  sw         $ra, 0x10($sp)
/* D7A3C 800D6E3C C4460000 */  lwc1       $f6, ($v0)
/* D7A40 800D6E40 C4440004 */  lwc1       $f4, 4($v0)
/* D7A44 800D6E44 4606203E */  c.le.s     $f4, $f6
/* D7A48 800D6E48 00000000 */  nop
/* D7A4C 800D6E4C 45010002 */  bc1t       .L800D6E58
/* D7A50 800D6E50 24030001 */   addiu     $v1, $zero, 1
/* D7A54 800D6E54 00001821 */  addu       $v1, $zero, $zero
.L800D6E58:
/* D7A58 800D6E58 1460001A */  bnez       $v1, .L800D6EC4
/* D7A5C 800D6E5C 8FBF0010 */   lw        $ra, 0x10($sp)
/* D7A60 800D6E60 44851000 */  mtc1       $a1, $f2
/* D7A64 800D6E64 468010A1 */  cvt.d.w    $f2, $f2
/* D7A68 800D6E68 04A30005 */  bgezl      $a1, .L800D6E80
/* D7A6C 800D6E6C 46201020 */   cvt.s.d   $f0, $f2
/* D7A70 800D6E70 3C01800E */  lui        $at, %hi(D_800E5308)
/* D7A74 800D6E74 D4205308 */  ldc1       $f0, %lo(D_800E5308)($at)
/* D7A78 800D6E78 46201080 */  add.d      $f2, $f2, $f0
/* D7A7C 800D6E7C 46201020 */  cvt.s.d    $f0, $f2
.L800D6E80:
/* D7A80 800D6E80 46003000 */  add.s      $f0, $f6, $f0
/* D7A84 800D6E84 4600203C */  c.lt.s     $f4, $f0
/* D7A88 800D6E88 00000000 */  nop
/* D7A8C 800D6E8C 45000002 */  bc1f       .L800D6E98
/* D7A90 800D6E90 E4400000 */   swc1      $f0, ($v0)
/* D7A94 800D6E94 E4440000 */  swc1       $f4, ($v0)
.L800D6E98:
/* D7A98 800D6E98 C4420000 */  lwc1       $f2, ($v0)
/* D7A9C 800D6E9C C4400004 */  lwc1       $f0, 4($v0)
/* D7AA0 800D6EA0 8C430008 */  lw         $v1, 8($v0)
/* D7AA4 800D6EA4 46001083 */  div.s      $f2, $f2, $f0
/* D7AA8 800D6EA8 84640018 */  lh         $a0, 0x18($v1)
/* D7AAC 800D6EAC 44051000 */  mfc1       $a1, $f2
/* D7AB0 800D6EB0 00442021 */  addu       $a0, $v0, $a0
/* D7AB4 800D6EB4 8C62001C */  lw         $v0, 0x1c($v1)
/* D7AB8 800D6EB8 0040F809 */  jalr       $v0
/* D7ABC 800D6EBC 00000000 */   nop
/* D7AC0 800D6EC0 8FBF0010 */  lw         $ra, 0x10($sp)
.L800D6EC4:
/* D7AC4 800D6EC4 03E00008 */  jr         $ra
/* D7AC8 800D6EC8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6ECC
/* D7ACC 800D6ECC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7AD0 800D6ED0 AFB00010 */  sw         $s0, 0x10($sp)
/* D7AD4 800D6ED4 00808021 */  addu       $s0, $a0, $zero
/* D7AD8 800D6ED8 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7ADC 800D6EDC 8E030008 */  lw         $v1, 8($s0)
/* D7AE0 800D6EE0 84640020 */  lh         $a0, 0x20($v1)
/* D7AE4 800D6EE4 8C620024 */  lw         $v0, 0x24($v1)
/* D7AE8 800D6EE8 0040F809 */  jalr       $v0
/* D7AEC 800D6EEC 02042021 */   addu      $a0, $s0, $a0
/* D7AF0 800D6EF0 8E03000C */  lw         $v1, 0xc($s0)
/* D7AF4 800D6EF4 8FBF0014 */  lw         $ra, 0x14($sp)
/* D7AF8 800D6EF8 8FB00010 */  lw         $s0, 0x10($sp)
/* D7AFC 800D6EFC A0620000 */  sb         $v0, ($v1)
/* D7B00 800D6F00 03E00008 */  jr         $ra
/* D7B04 800D6F04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6F08
/* D7B08 800D6F08 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7B0C 800D6F0C AFB00010 */  sw         $s0, 0x10($sp)
/* D7B10 800D6F10 00808021 */  addu       $s0, $a0, $zero
/* D7B14 800D6F14 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7B18 800D6F18 8E030008 */  lw         $v1, 8($s0)
/* D7B1C 800D6F1C 84640020 */  lh         $a0, 0x20($v1)
/* D7B20 800D6F20 8C620024 */  lw         $v0, 0x24($v1)
/* D7B24 800D6F24 0040F809 */  jalr       $v0
/* D7B28 800D6F28 02042021 */   addu      $a0, $s0, $a0
/* D7B2C 800D6F2C 8E03000C */  lw         $v1, 0xc($s0)
/* D7B30 800D6F30 8FBF0014 */  lw         $ra, 0x14($sp)
/* D7B34 800D6F34 8FB00010 */  lw         $s0, 0x10($sp)
/* D7B38 800D6F38 A4620000 */  sh         $v0, ($v1)
/* D7B3C 800D6F3C 03E00008 */  jr         $ra
/* D7B40 800D6F40 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D6F44
/* D7B44 800D6F44 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7B48 800D6F48 AFB00010 */  sw         $s0, 0x10($sp)
/* D7B4C 800D6F4C 00808021 */  addu       $s0, $a0, $zero
/* D7B50 800D6F50 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7B54 800D6F54 8E030008 */  lw         $v1, 8($s0)
/* D7B58 800D6F58 84640020 */  lh         $a0, 0x20($v1)
/* D7B5C 800D6F5C 8C620024 */  lw         $v0, 0x24($v1)
/* D7B60 800D6F60 0040F809 */  jalr       $v0
/* D7B64 800D6F64 02042021 */   addu      $a0, $s0, $a0
/* D7B68 800D6F68 8E03000C */  lw         $v1, 0xc($s0)
/* D7B6C 800D6F6C 8FBF0014 */  lw         $ra, 0x14($sp)
/* D7B70 800D6F70 8FB00010 */  lw         $s0, 0x10($sp)
/* D7B74 800D6F74 A4620000 */  sh         $v0, ($v1)
/* D7B78 800D6F78 03E00008 */  jr         $ra
/* D7B7C 800D6F7C 27BD0018 */   addiu     $sp, $sp, 0x18
