.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80057A70
/* 58670 80057A70 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 58674 80057A74 AFB1001C */  sw         $s1, 0x1c($sp)
/* 58678 80057A78 00808821 */  addu       $s1, $a0, $zero
/* 5867C 80057A7C AFBF0020 */  sw         $ra, 0x20($sp)
/* 58680 80057A80 0C0025B4 */  jal        get_hres
/* 58684 80057A84 AFB00018 */   sw        $s0, 0x18($sp)
/* 58688 80057A88 0C0025B7 */  jal        get_vres
/* 5868C 80057A8C 00408021 */   addu      $s0, $v0, $zero
/* 58690 80057A90 02202021 */  addu       $a0, $s1, $zero
/* 58694 80057A94 24050006 */  addiu      $a1, $zero, 6
/* 58698 80057A98 02003021 */  addu       $a2, $s0, $zero
/* 5869C 80057A9C 0C0290ED */  jal        rsp_func
/* 586A0 80057AA0 00403821 */   addu      $a3, $v0, $zero
/* 586A4 80057AA4 00408821 */  addu       $s1, $v0, $zero
/* 586A8 80057AA8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 586AC 80057AAC 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* 586B0 80057AB0 C460000C */  lwc1       $f0, 0xc($v1)
/* 586B4 80057AB4 3C01800E */  lui        $at, %hi(D_800DEB30)
/* 586B8 80057AB8 C422EB30 */  lwc1       $f2, %lo(D_800DEB30)($at)
/* 586BC 80057ABC 4600103E */  c.le.s     $f2, $f0
/* 586C0 80057AC0 00000000 */  nop
/* 586C4 80057AC4 45010005 */  bc1t       .L80057ADC
/* 586C8 80057AC8 00408021 */   addu      $s0, $v0, $zero
/* 586CC 80057ACC 4600008D */  trunc.w.s  $f2, $f0
/* 586D0 80057AD0 44051000 */  mfc1       $a1, $f2
/* 586D4 80057AD4 08015EBD */  j          .L80057AF4
/* 586D8 80057AD8 8C641604 */   lw        $a0, 0x1604($v1)
.L80057ADC:
/* 586DC 80057ADC 46020001 */  sub.s      $f0, $f0, $f2
/* 586E0 80057AE0 4600008D */  trunc.w.s  $f2, $f0
/* 586E4 80057AE4 44051000 */  mfc1       $a1, $f2
/* 586E8 80057AE8 3C028000 */  lui        $v0, 0x8000
/* 586EC 80057AEC 00A22825 */  or         $a1, $a1, $v0
/* 586F0 80057AF0 8C641604 */  lw         $a0, 0x1604($v1)
.L80057AF4:
/* 586F4 80057AF4 0C02DBF7 */  jal        func_800B6FDC
/* 586F8 80057AF8 30A500FF */   andi      $a1, $a1, 0xff
/* 586FC 80057AFC 02202821 */  addu       $a1, $s1, $zero
/* 58700 80057B00 00003021 */  addu       $a2, $zero, $zero
/* 58704 80057B04 00003821 */  addu       $a3, $zero, $zero
/* 58708 80057B08 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 5870C 80057B0C 24030140 */  addiu      $v1, $zero, 0x140
/* 58710 80057B10 8C441604 */  lw         $a0, 0x1604($v0)
/* 58714 80057B14 240200F0 */  addiu      $v0, $zero, 0xf0
/* 58718 80057B18 AFA30010 */  sw         $v1, 0x10($sp)
/* 5871C 80057B1C 0C02DCCE */  jal        func_800B7338
/* 58720 80057B20 AFA20014 */   sw        $v0, 0x14($sp)
/* 58724 80057B24 8FBF0020 */  lw         $ra, 0x20($sp)
/* 58728 80057B28 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5872C 80057B2C 8FB00018 */  lw         $s0, 0x18($sp)
/* 58730 80057B30 03E00008 */  jr         $ra
/* 58734 80057B34 27BD0028 */   addiu     $sp, $sp, 0x28
/* 58738 80057B38 00000000 */  nop
/* 5873C 80057B3C 00000000 */  nop
