.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80006650
/* 7250 80006650 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7254 80006654 00003021 */  addu       $a2, $zero, $zero
/* 7258 80006658 00001821 */  addu       $v1, $zero, $zero
.L8000665C:
/* 725C 8000665C 24C70001 */  addiu      $a3, $a2, 1
/* 7260 80006660 00061040 */  sll        $v0, $a2, 1
/* 7264 80006664 00461021 */  addu       $v0, $v0, $a2
/* 7268 80006668 000210C0 */  sll        $v0, $v0, 3
/* 726C 8000666C 00461021 */  addu       $v0, $v0, $a2
/* 7270 80006670 00023100 */  sll        $a2, $v0, 4
/* 7274 80006674 00C31021 */  addu       $v0, $a2, $v1
.L80006678:
/* 7278 80006678 00021040 */  sll        $v0, $v0, 1
/* 727C 8000667C 00441021 */  addu       $v0, $v0, $a0
/* 7280 80006680 A4450000 */  sh         $a1, ($v0)
/* 7284 80006684 24630001 */  addiu      $v1, $v1, 1
/* 7288 80006688 3063FFFF */  andi       $v1, $v1, 0xffff
/* 728C 8000668C 2C620190 */  sltiu      $v0, $v1, 0x190
/* 7290 80006690 1440FFF9 */  bnez       $v0, .L80006678
/* 7294 80006694 00C31021 */   addu      $v0, $a2, $v1
/* 7298 80006698 30E6FFFF */  andi       $a2, $a3, 0xffff
/* 729C 8000669C 2CC2012C */  sltiu      $v0, $a2, 0x12c
/* 72A0 800066A0 1440FFEE */  bnez       $v0, .L8000665C
/* 72A4 800066A4 00001821 */   addu      $v1, $zero, $zero
/* 72A8 800066A8 03E00008 */  jr         $ra
/* 72AC 800066AC 00000000 */   nop

glabel crash_strlen
/* 72B0 800066B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 72B4 800066B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 72B8 800066B8 0C03353E */  jal        strlen
/* 72BC 800066BC 00000000 */   nop
/* 72C0 800066C0 00021FC2 */  srl        $v1, $v0, 0x1f
/* 72C4 800066C4 00621821 */  addu       $v1, $v1, $v0
/* 72C8 800066C8 00031843 */  sra        $v1, $v1, 1
/* 72CC 800066CC 000318C0 */  sll        $v1, $v1, 3
/* 72D0 800066D0 240200C8 */  addiu      $v0, $zero, 0xc8
/* 72D4 800066D4 00431023 */  subu       $v0, $v0, $v1
/* 72D8 800066D8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 72DC 800066DC 3042FFF8 */  andi       $v0, $v0, 0xfff8
/* 72E0 800066E0 03E00008 */  jr         $ra
/* 72E4 800066E4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel crash_text
/* 72E8 800066E8 27BDFF40 */  addiu      $sp, $sp, -0xc0
/* 72EC 800066EC AFB000A0 */  sw         $s0, 0xa0($sp)
/* 72F0 800066F0 00808021 */  addu       $s0, $a0, $zero
/* 72F4 800066F4 AFB200A8 */  sw         $s2, 0xa8($sp)
/* 72F8 800066F8 00A09021 */  addu       $s2, $a1, $zero
/* 72FC 800066FC AFBF00B8 */  sw         $ra, 0xb8($sp)
/* 7300 80006700 AFB500B4 */  sw         $s5, 0xb4($sp)
/* 7304 80006704 AFB400B0 */  sw         $s4, 0xb0($sp)
/* 7308 80006708 AFB300AC */  sw         $s3, 0xac($sp)
/* 730C 8000670C 0C030BF0 */  jal        osGetNotactiveQueue
/* 7310 80006710 AFB100A4 */   sw        $s1, 0xa4($sp)
/* 7314 80006714 02402021 */  addu       $a0, $s2, $zero
/* 7318 80006718 24050843 */  addiu      $a1, $zero, 0x843
/* 731C 8000671C 0C001994 */  jal        func_80006650
/* 7320 80006720 00409821 */   addu      $s3, $v0, $zero
/* 7324 80006724 27A40020 */  addiu      $a0, $sp, 0x20
/* 7328 80006728 3C05800D */  lui        $a1, %hi(D_800D7A60)
/* 732C 8000672C 0C0333AC */  jal        sprintf
/* 7330 80006730 24A57A60 */   addiu     $a1, $a1, %lo(D_800D7A60)
/* 7334 80006734 0C0019AC */  jal        crash_strlen
/* 7338 80006738 27A40020 */   addiu     $a0, $sp, 0x20
/* 733C 8000673C 02402021 */  addu       $a0, $s2, $zero
/* 7340 80006740 27A50020 */  addiu      $a1, $sp, 0x20
/* 7344 80006744 00403021 */  addu       $a2, $v0, $zero
/* 7348 80006748 24070014 */  addiu      $a3, $zero, 0x14
/* 734C 8000674C 241100FF */  addiu      $s1, $zero, 0xff
/* 7350 80006750 AFB10010 */  sw         $s1, 0x10($sp)
/* 7354 80006754 AFB10014 */  sw         $s1, 0x14($sp)
/* 7358 80006758 0C001FEB */  jal        crash_print
/* 735C 8000675C AFA00018 */   sw        $zero, 0x18($sp)
/* 7360 80006760 92020104 */  lbu        $v0, 0x104($s0)
/* 7364 80006764 10400034 */  beqz       $v0, .L80006838
/* 7368 80006768 27A40020 */   addiu     $a0, $sp, 0x20
/* 736C 8000676C 3C05800D */  lui        $a1, %hi(D_800D7A7C)
/* 7370 80006770 0C0333AC */  jal        sprintf
/* 7374 80006774 24A57A7C */   addiu     $a1, $a1, %lo(D_800D7A7C)
/* 7378 80006778 0C0019AC */  jal        crash_strlen
/* 737C 8000677C 27A40020 */   addiu     $a0, $sp, 0x20
/* 7380 80006780 02402021 */  addu       $a0, $s2, $zero
/* 7384 80006784 27A50020 */  addiu      $a1, $sp, 0x20
/* 7388 80006788 00403021 */  addu       $a2, $v0, $zero
/* 738C 8000678C 2407001D */  addiu      $a3, $zero, 0x1d
/* 7390 80006790 AFB10010 */  sw         $s1, 0x10($sp)
/* 7394 80006794 AFB10014 */  sw         $s1, 0x14($sp)
/* 7398 80006798 0C001FEB */  jal        crash_print
/* 739C 8000679C AFA00018 */   sw        $zero, 0x18($sp)
/* 73A0 800067A0 02402021 */  addu       $a0, $s2, $zero
/* 73A4 800067A4 3C05800D */  lui        $a1, %hi(D_800D7A8C)
/* 73A8 800067A8 24A57A8C */  addiu      $a1, $a1, %lo(D_800D7A8C)
/* 73AC 800067AC 24060014 */  addiu      $a2, $zero, 0x14
/* 73B0 800067B0 2407002F */  addiu      $a3, $zero, 0x2f
/* 73B4 800067B4 AFB10010 */  sw         $s1, 0x10($sp)
/* 73B8 800067B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 73BC 800067BC 0C001FEB */  jal        crash_print
/* 73C0 800067C0 AFA00018 */   sw        $zero, 0x18($sp)
/* 73C4 800067C4 02402021 */  addu       $a0, $s2, $zero
/* 73C8 800067C8 26050004 */  addiu      $a1, $s0, 4
/* 73CC 800067CC 2406001E */  addiu      $a2, $zero, 0x1e
/* 73D0 800067D0 24070038 */  addiu      $a3, $zero, 0x38
/* 73D4 800067D4 AFA00010 */  sw         $zero, 0x10($sp)
/* 73D8 800067D8 AFB10014 */  sw         $s1, 0x14($sp)
/* 73DC 800067DC 0C001FEB */  jal        crash_print
/* 73E0 800067E0 AFA00018 */   sw        $zero, 0x18($sp)
/* 73E4 800067E4 02402021 */  addu       $a0, $s2, $zero
/* 73E8 800067E8 3C05800D */  lui        $a1, %hi(D_800D7A98)
/* 73EC 800067EC 24A57A98 */  addiu      $a1, $a1, %lo(D_800D7A98)
/* 73F0 800067F0 24060014 */  addiu      $a2, $zero, 0x14
/* 73F4 800067F4 2407005C */  addiu      $a3, $zero, 0x5c
/* 73F8 800067F8 AFB10010 */  sw         $s1, 0x10($sp)
/* 73FC 800067FC AFB10014 */  sw         $s1, 0x14($sp)
/* 7400 80006800 0C001FEB */  jal        crash_print
/* 7404 80006804 AFA00018 */   sw        $zero, 0x18($sp)
/* 7408 80006808 02402021 */  addu       $a0, $s2, $zero
/* 740C 8000680C 26050084 */  addiu      $a1, $s0, 0x84
/* 7410 80006810 2406001E */  addiu      $a2, $zero, 0x1e
/* 7414 80006814 24070065 */  addiu      $a3, $zero, 0x65
/* 7418 80006818 AFA00010 */  sw         $zero, 0x10($sp)
/* 741C 8000681C AFB10014 */  sw         $s1, 0x14($sp)
/* 7420 80006820 0C001FEB */  jal        crash_print
/* 7424 80006824 AFA00018 */   sw        $zero, 0x18($sp)
/* 7428 80006828 24110092 */  addiu      $s1, $zero, 0x92
/* 742C 8000682C 3C14800D */  lui        $s4, 0x800d
/* 7430 80006830 08001A78 */  j          .L800069E0
/* 7434 80006834 3C15800F */   lui       $s5, 0x800f
.L80006838:
/* 7438 80006838 02402021 */  addu       $a0, $s2, $zero
/* 743C 8000683C 3C05800D */  lui        $a1, %hi(D_800D7AA0)
/* 7440 80006840 24A57AA0 */  addiu      $a1, $a1, %lo(D_800D7AA0)
/* 7444 80006844 24060014 */  addiu      $a2, $zero, 0x14
/* 7448 80006848 24070026 */  addiu      $a3, $zero, 0x26
/* 744C 8000684C AFB10010 */  sw         $s1, 0x10($sp)
/* 7450 80006850 AFB10014 */  sw         $s1, 0x14($sp)
/* 7454 80006854 0C001FEB */  jal        crash_print
/* 7458 80006858 AFA00018 */   sw        $zero, 0x18($sp)
/* 745C 8000685C 27A40020 */  addiu      $a0, $sp, 0x20
/* 7460 80006860 3C05800D */  lui        $a1, %hi(D_800D7AA8)
/* 7464 80006864 24A57AA8 */  addiu      $a1, $a1, %lo(D_800D7AA8)
/* 7468 80006868 3C14800D */  lui        $s4, 0x800d
/* 746C 8000686C 8E660014 */  lw         $a2, 0x14($s3)
/* 7470 80006870 0C0333AC */  jal        sprintf
/* 7474 80006874 3C15800F */   lui       $s5, 0x800f
/* 7478 80006878 02402021 */  addu       $a0, $s2, $zero
/* 747C 8000687C 27A50020 */  addiu      $a1, $sp, 0x20
/* 7480 80006880 2406001E */  addiu      $a2, $zero, 0x1e
/* 7484 80006884 2407002F */  addiu      $a3, $zero, 0x2f
/* 7488 80006888 AFA00010 */  sw         $zero, 0x10($sp)
/* 748C 8000688C AFB10014 */  sw         $s1, 0x14($sp)
/* 7490 80006890 0C001FEB */  jal        crash_print
/* 7494 80006894 AFA00018 */   sw        $zero, 0x18($sp)
/* 7498 80006898 02402021 */  addu       $a0, $s2, $zero
/* 749C 8000689C 3C05800D */  lui        $a1, %hi(D_800D7A8C)
/* 74A0 800068A0 24A57A8C */  addiu      $a1, $a1, %lo(D_800D7A8C)
/* 74A4 800068A4 24060014 */  addiu      $a2, $zero, 0x14
/* 74A8 800068A8 24070041 */  addiu      $a3, $zero, 0x41
/* 74AC 800068AC AFB10010 */  sw         $s1, 0x10($sp)
/* 74B0 800068B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 74B4 800068B4 0C001FEB */  jal        crash_print
/* 74B8 800068B8 AFA00018 */   sw        $zero, 0x18($sp)
/* 74BC 800068BC 27A40020 */  addiu      $a0, $sp, 0x20
/* 74C0 800068C0 3C10800D */  lui        $s0, %hi(D_800D7AAC)
/* 74C4 800068C4 26107AAC */  addiu      $s0, $s0, %lo(D_800D7AAC)
/* 74C8 800068C8 8E66011C */  lw         $a2, 0x11c($s3)
/* 74CC 800068CC 0C0333AC */  jal        sprintf
/* 74D0 800068D0 02002821 */   addu      $a1, $s0, $zero
/* 74D4 800068D4 02402021 */  addu       $a0, $s2, $zero
/* 74D8 800068D8 27A50020 */  addiu      $a1, $sp, 0x20
/* 74DC 800068DC 2406001E */  addiu      $a2, $zero, 0x1e
/* 74E0 800068E0 2407004A */  addiu      $a3, $zero, 0x4a
/* 74E4 800068E4 AFA00010 */  sw         $zero, 0x10($sp)
/* 74E8 800068E8 AFB10014 */  sw         $s1, 0x14($sp)
/* 74EC 800068EC 0C001FEB */  jal        crash_print
/* 74F0 800068F0 AFA00018 */   sw        $zero, 0x18($sp)
/* 74F4 800068F4 02402021 */  addu       $a0, $s2, $zero
/* 74F8 800068F8 3C05800D */  lui        $a1, %hi(D_800D7AB4)
/* 74FC 800068FC 24A57AB4 */  addiu      $a1, $a1, %lo(D_800D7AB4)
/* 7500 80006900 24060014 */  addiu      $a2, $zero, 0x14
/* 7504 80006904 2407005C */  addiu      $a3, $zero, 0x5c
/* 7508 80006908 AFB10010 */  sw         $s1, 0x10($sp)
/* 750C 8000690C AFB10014 */  sw         $s1, 0x14($sp)
/* 7510 80006910 0C001FEB */  jal        crash_print
/* 7514 80006914 AFA00018 */   sw        $zero, 0x18($sp)
/* 7518 80006918 27A40020 */  addiu      $a0, $sp, 0x20
/* 751C 8000691C 8E660104 */  lw         $a2, 0x104($s3)
/* 7520 80006920 0C0333AC */  jal        sprintf
/* 7524 80006924 02002821 */   addu      $a1, $s0, $zero
/* 7528 80006928 02402021 */  addu       $a0, $s2, $zero
/* 752C 8000692C 27A50020 */  addiu      $a1, $sp, 0x20
/* 7530 80006930 2406001E */  addiu      $a2, $zero, 0x1e
/* 7534 80006934 24070065 */  addiu      $a3, $zero, 0x65
/* 7538 80006938 AFA00010 */  sw         $zero, 0x10($sp)
/* 753C 8000693C AFB10014 */  sw         $s1, 0x14($sp)
/* 7540 80006940 0C001FEB */  jal        crash_print
/* 7544 80006944 AFA00018 */   sw        $zero, 0x18($sp)
/* 7548 80006948 02402021 */  addu       $a0, $s2, $zero
/* 754C 8000694C 3C05800D */  lui        $a1, %hi(D_800D7A98)
/* 7550 80006950 24A57A98 */  addiu      $a1, $a1, %lo(D_800D7A98)
/* 7554 80006954 24060014 */  addiu      $a2, $zero, 0x14
/* 7558 80006958 24070077 */  addiu      $a3, $zero, 0x77
/* 755C 8000695C AFB10010 */  sw         $s1, 0x10($sp)
/* 7560 80006960 AFB10014 */  sw         $s1, 0x14($sp)
/* 7564 80006964 0C001FEB */  jal        crash_print
/* 7568 80006968 AFA00018 */   sw        $zero, 0x18($sp)
/* 756C 8000696C 3C02800E */  lui        $v0, %hi(CauseStrings)
/* 7570 80006970 8C436240 */  lw         $v1, %lo(CauseStrings)($v0)
/* 7574 80006974 10600010 */  beqz       $v1, .L800069B8
/* 7578 80006978 24506240 */   addiu     $s0, $v0, 0x6240
/* 757C 8000697C 3C11800D */  lui        $s1, 0x800d
/* 7580 80006980 8E620120 */  lw         $v0, 0x120($s3)
.L80006984:
/* 7584 80006984 8E030000 */  lw         $v1, ($s0)
/* 7588 80006988 8E040004 */  lw         $a0, 4($s0)
/* 758C 8000698C 00431024 */  and        $v0, $v0, $v1
/* 7590 80006990 54440006 */  bnel       $v0, $a0, .L800069AC
/* 7594 80006994 2610000C */   addiu     $s0, $s0, 0xc
/* 7598 80006998 27A40020 */  addiu      $a0, $sp, 0x20
/* 759C 8000699C 8E060008 */  lw         $a2, 8($s0)
/* 75A0 800069A0 0C0333AC */  jal        sprintf
/* 75A4 800069A4 26257ABC */   addiu     $a1, $s1, 0x7abc
/* 75A8 800069A8 2610000C */  addiu      $s0, $s0, 0xc
.L800069AC:
/* 75AC 800069AC 8E020000 */  lw         $v0, ($s0)
/* 75B0 800069B0 5440FFF4 */  bnel       $v0, $zero, .L80006984
/* 75B4 800069B4 8E620120 */   lw        $v0, 0x120($s3)
.L800069B8:
/* 75B8 800069B8 02402021 */  addu       $a0, $s2, $zero
/* 75BC 800069BC 27A50020 */  addiu      $a1, $sp, 0x20
/* 75C0 800069C0 2406001E */  addiu      $a2, $zero, 0x1e
/* 75C4 800069C4 24070080 */  addiu      $a3, $zero, 0x80
/* 75C8 800069C8 240200FF */  addiu      $v0, $zero, 0xff
/* 75CC 800069CC AFA00010 */  sw         $zero, 0x10($sp)
/* 75D0 800069D0 AFA20014 */  sw         $v0, 0x14($sp)
/* 75D4 800069D4 0C001FEB */  jal        crash_print
/* 75D8 800069D8 AFA00018 */   sw        $zero, 0x18($sp)
/* 75DC 800069DC 24110092 */  addiu      $s1, $zero, 0x92
.L800069E0:
/* 75E0 800069E0 02402021 */  addu       $a0, $s2, $zero
/* 75E4 800069E4 26857AC0 */  addiu      $a1, $s4, 0x7ac0
/* 75E8 800069E8 24060014 */  addiu      $a2, $zero, 0x14
/* 75EC 800069EC 02203821 */  addu       $a3, $s1, $zero
/* 75F0 800069F0 241000FF */  addiu      $s0, $zero, 0xff
/* 75F4 800069F4 AFB00010 */  sw         $s0, 0x10($sp)
/* 75F8 800069F8 AFB00014 */  sw         $s0, 0x14($sp)
/* 75FC 800069FC 0C001FEB */  jal        crash_print
/* 7600 80006A00 AFA00018 */   sw        $zero, 0x18($sp)
/* 7604 80006A04 02402021 */  addu       $a0, $s2, $zero
/* 7608 80006A08 26A58920 */  addiu      $a1, $s5, -0x76e0
/* 760C 80006A0C 2406001E */  addiu      $a2, $zero, 0x1e
/* 7610 80006A10 26270009 */  addiu      $a3, $s1, 9
/* 7614 80006A14 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 7618 80006A18 AFA00010 */  sw         $zero, 0x10($sp)
/* 761C 80006A1C AFB00014 */  sw         $s0, 0x14($sp)
/* 7620 80006A20 0C001FEB */  jal        crash_print
/* 7624 80006A24 AFA00018 */   sw        $zero, 0x18($sp)
/* 7628 80006A28 8FBF00B8 */  lw         $ra, 0xb8($sp)
/* 762C 80006A2C 8FB500B4 */  lw         $s5, 0xb4($sp)
/* 7630 80006A30 8FB400B0 */  lw         $s4, 0xb0($sp)
/* 7634 80006A34 8FB300AC */  lw         $s3, 0xac($sp)
/* 7638 80006A38 8FB200A8 */  lw         $s2, 0xa8($sp)
/* 763C 80006A3C 8FB100A4 */  lw         $s1, 0xa4($sp)
/* 7640 80006A40 8FB000A0 */  lw         $s0, 0xa0($sp)
/* 7644 80006A44 03E00008 */  jr         $ra
/* 7648 80006A48 27BD00C0 */   addiu     $sp, $sp, 0xc0

glabel func_80006A4C
/* 764C 80006A4C 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 7650 80006A50 AFBE0080 */  sw         $fp, 0x80($sp)
/* 7654 80006A54 0080F021 */  addu       $fp, $a0, $zero
/* 7658 80006A58 AFB20068 */  sw         $s2, 0x68($sp)
/* 765C 80006A5C 2412007D */  addiu      $s2, $zero, 0x7d
/* 7660 80006A60 AFB10064 */  sw         $s1, 0x64($sp)
/* 7664 80006A64 00008821 */  addu       $s1, $zero, $zero
/* 7668 80006A68 AFB50074 */  sw         $s5, 0x74($sp)
/* 766C 80006A6C 0000A821 */  addu       $s5, $zero, $zero
/* 7670 80006A70 AFB40070 */  sw         $s4, 0x70($sp)
/* 7674 80006A74 3C140FFF */  lui        $s4, 0xfff
/* 7678 80006A78 3694FFFF */  ori        $s4, $s4, 0xffff
/* 767C 80006A7C AFB3006C */  sw         $s3, 0x6c($sp)
/* 7680 80006A80 3C13000C */  lui        $s3, 0xc
/* 7684 80006A84 36734863 */  ori        $s3, $s3, 0x4863
/* 7688 80006A88 AFB7007C */  sw         $s7, 0x7c($sp)
/* 768C 80006A8C 24170070 */  addiu      $s7, $zero, 0x70
/* 7690 80006A90 AFB60078 */  sw         $s6, 0x78($sp)
/* 7694 80006A94 24160090 */  addiu      $s6, $zero, 0x90
/* 7698 80006A98 AFB00060 */  sw         $s0, 0x60($sp)
/* 769C 80006A9C 24B000F4 */  addiu      $s0, $a1, 0xf4
/* 76A0 80006AA0 AFBF0084 */  sw         $ra, 0x84($sp)
/* 76A4 80006AA4 2610FFFC */  addiu      $s0, $s0, -4
.L80006AA8:
/* 76A8 80006AA8 8E060000 */  lw         $a2, ($s0)
/* 76AC 80006AAC 04C10024 */  bgez       $a2, .L80006B40
/* 76B0 80006AB0 26A20001 */   addiu     $v0, $s5, 1
/* 76B4 80006AB4 00D43024 */  and        $a2, $a2, $s4
/* 76B8 80006AB8 0266102B */  sltu       $v0, $s3, $a2
/* 76BC 80006ABC 14400020 */  bnez       $v0, .L80006B40
/* 76C0 80006AC0 26A20001 */   addiu     $v0, $s5, 1
/* 76C4 80006AC4 27A40020 */  addiu      $a0, $sp, 0x20
/* 76C8 80006AC8 3C02800D */  lui        $v0, %hi(D_800D7AAC)
/* 76CC 80006ACC 0C0333AC */  jal        sprintf
/* 76D0 80006AD0 24457AAC */   addiu     $a1, $v0, %lo(D_800D7AAC)
/* 76D4 80006AD4 32230001 */  andi       $v1, $s1, 1
/* 76D8 80006AD8 1060000D */  beqz       $v1, .L80006B10
/* 76DC 80006ADC 03C02021 */   addu      $a0, $fp, $zero
/* 76E0 80006AE0 27A50020 */  addiu      $a1, $sp, 0x20
/* 76E4 80006AE4 3C02800D */  lui        $v0, %hi(D_800D7AD4)
/* 76E8 80006AE8 24427AD4 */  addiu      $v0, $v0, %lo(D_800D7AD4)
/* 76EC 80006AEC 94460000 */  lhu        $a2, ($v0)
/* 76F0 80006AF0 02403821 */  addu       $a3, $s2, $zero
/* 76F4 80006AF4 AFA00010 */  sw         $zero, 0x10($sp)
/* 76F8 80006AF8 AFB70014 */  sw         $s7, 0x14($sp)
/* 76FC 80006AFC 0C001FEB */  jal        crash_print
/* 7700 80006B00 AFB60018 */   sw        $s6, 0x18($sp)
/* 7704 80006B04 2642000A */  addiu      $v0, $s2, 0xa
/* 7708 80006B08 08001ACB */  j          .L80006B2C
/* 770C 80006B0C 3052FFFF */   andi      $s2, $v0, 0xffff
.L80006B10:
/* 7710 80006B10 27A50020 */  addiu      $a1, $sp, 0x20
/* 7714 80006B14 240600B8 */  addiu      $a2, $zero, 0xb8
/* 7718 80006B18 02403821 */  addu       $a3, $s2, $zero
/* 771C 80006B1C AFA00010 */  sw         $zero, 0x10($sp)
/* 7720 80006B20 AFB60014 */  sw         $s6, 0x14($sp)
/* 7724 80006B24 0C001FEB */  jal        crash_print
/* 7728 80006B28 AFB70018 */   sw        $s7, 0x18($sp)
.L80006B2C:
/* 772C 80006B2C 26220001 */  addiu      $v0, $s1, 1
/* 7730 80006B30 3051FFFF */  andi       $s1, $v0, 0xffff
/* 7734 80006B34 2E230018 */  sltiu      $v1, $s1, 0x18
/* 7738 80006B38 10600005 */  beqz       $v1, .L80006B50
/* 773C 80006B3C 26A20001 */   addiu     $v0, $s5, 1
.L80006B40:
/* 7740 80006B40 3055FFFF */  andi       $s5, $v0, 0xffff
/* 7744 80006B44 2EA303E8 */  sltiu      $v1, $s5, 0x3e8
/* 7748 80006B48 1460FFD7 */  bnez       $v1, .L80006AA8
/* 774C 80006B4C 2610FFFC */   addiu     $s0, $s0, -4
.L80006B50:
/* 7750 80006B50 8FBF0084 */  lw         $ra, 0x84($sp)
/* 7754 80006B54 8FBE0080 */  lw         $fp, 0x80($sp)
/* 7758 80006B58 8FB7007C */  lw         $s7, 0x7c($sp)
/* 775C 80006B5C 8FB60078 */  lw         $s6, 0x78($sp)
/* 7760 80006B60 8FB50074 */  lw         $s5, 0x74($sp)
/* 7764 80006B64 8FB40070 */  lw         $s4, 0x70($sp)
/* 7768 80006B68 8FB3006C */  lw         $s3, 0x6c($sp)
/* 776C 80006B6C 8FB20068 */  lw         $s2, 0x68($sp)
/* 7770 80006B70 8FB10064 */  lw         $s1, 0x64($sp)
/* 7774 80006B74 8FB00060 */  lw         $s0, 0x60($sp)
/* 7778 80006B78 03E00008 */  jr         $ra
/* 777C 80006B7C 27BD0088 */   addiu     $sp, $sp, 0x88

glabel func_80006B80
/* 7780 80006B80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7784 80006B84 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7788 80006B88 0C03353E */  jal        strlen
/* 778C 80006B8C 00000000 */   nop
/* 7790 80006B90 000210C0 */  sll        $v0, $v0, 3
/* 7794 80006B94 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7798 80006B98 3042FFF8 */  andi       $v0, $v0, 0xfff8
/* 779C 80006B9C 03E00008 */  jr         $ra
/* 77A0 80006BA0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel crash_print_2
/* 77A4 80006BA4 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 77A8 80006BA8 AFB3006C */  sw         $s3, 0x6c($sp)
/* 77AC 80006BAC 00809821 */  addu       $s3, $a0, $zero
/* 77B0 80006BB0 AFB40070 */  sw         $s4, 0x70($sp)
/* 77B4 80006BB4 97B40092 */  lhu        $s4, 0x92($sp)
/* 77B8 80006BB8 27A40020 */  addiu      $a0, $sp, 0x20
/* 77BC 80006BBC AFB50074 */  sw         $s5, 0x74($sp)
/* 77C0 80006BC0 00C0A821 */  addu       $s5, $a2, $zero
/* 77C4 80006BC4 AFB00060 */  sw         $s0, 0x60($sp)
/* 77C8 80006BC8 30F0FFFF */  andi       $s0, $a3, 0xffff
/* 77CC 80006BCC AFBF0078 */  sw         $ra, 0x78($sp)
/* 77D0 80006BD0 AFB20068 */  sw         $s2, 0x68($sp)
/* 77D4 80006BD4 0C0333AC */  jal        sprintf
/* 77D8 80006BD8 AFB10064 */   sw        $s1, 0x64($sp)
/* 77DC 80006BDC 0C001AE0 */  jal        func_80006B80
/* 77E0 80006BE0 27A40020 */   addiu     $a0, $sp, 0x20
/* 77E4 80006BE4 02602021 */  addu       $a0, $s3, $zero
/* 77E8 80006BE8 27A50020 */  addiu      $a1, $sp, 0x20
/* 77EC 80006BEC 02003021 */  addu       $a2, $s0, $zero
/* 77F0 80006BF0 241100FF */  addiu      $s1, $zero, 0xff
/* 77F4 80006BF4 00409021 */  addu       $s2, $v0, $zero
/* 77F8 80006BF8 AFB10010 */  sw         $s1, 0x10($sp)
/* 77FC 80006BFC AFB10014 */  sw         $s1, 0x14($sp)
/* 7800 80006C00 AFA00018 */  sw         $zero, 0x18($sp)
/* 7804 80006C04 0C001FEB */  jal        crash_print
/* 7808 80006C08 02803821 */   addu      $a3, $s4, $zero
/* 780C 80006C0C 27A40020 */  addiu      $a0, $sp, 0x20
/* 7810 80006C10 3C05800D */  lui        $a1, %hi(D_800D7AD8)
/* 7814 80006C14 24A57AD8 */  addiu      $a1, $a1, %lo(D_800D7AD8)
/* 7818 80006C18 0C0333AC */  jal        sprintf
/* 781C 80006C1C 02A03021 */   addu      $a2, $s5, $zero
/* 7820 80006C20 02602021 */  addu       $a0, $s3, $zero
/* 7824 80006C24 27A50020 */  addiu      $a1, $sp, 0x20
/* 7828 80006C28 02128021 */  addu       $s0, $s0, $s2
/* 782C 80006C2C 26100002 */  addiu      $s0, $s0, 2
/* 7830 80006C30 3206FFFF */  andi       $a2, $s0, 0xffff
/* 7834 80006C34 02803821 */  addu       $a3, $s4, $zero
/* 7838 80006C38 AFA00010 */  sw         $zero, 0x10($sp)
/* 783C 80006C3C AFB10014 */  sw         $s1, 0x14($sp)
/* 7840 80006C40 0C001FEB */  jal        crash_print
/* 7844 80006C44 AFA00018 */   sw        $zero, 0x18($sp)
/* 7848 80006C48 8FBF0078 */  lw         $ra, 0x78($sp)
/* 784C 80006C4C 8FB50074 */  lw         $s5, 0x74($sp)
/* 7850 80006C50 8FB40070 */  lw         $s4, 0x70($sp)
/* 7854 80006C54 8FB3006C */  lw         $s3, 0x6c($sp)
/* 7858 80006C58 8FB20068 */  lw         $s2, 0x68($sp)
/* 785C 80006C5C 8FB10064 */  lw         $s1, 0x64($sp)
/* 7860 80006C60 8FB00060 */  lw         $s0, 0x60($sp)
/* 7864 80006C64 03E00008 */  jr         $ra
/* 7868 80006C68 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_80006C6C
/* 786C 80006C6C 00804021 */  addu       $t0, $a0, $zero
/* 7870 80006C70 3C048000 */  lui        $a0, %hi(rspbootTextStart)
/* 7874 80006C74 24840470 */  addiu      $a0, $a0, %lo(rspbootTextStart)
/* 7878 80006C78 3C02000D */  lui        $v0, 0xd
/* 787C 80006C7C 24426544 */  addiu      $v0, $v0, 0x6544
/* 7880 80006C80 00825821 */  addu       $t3, $a0, $v0
/* 7884 80006C84 3C03800E */  lui        $v1, %hi(aspMainTextStart_800e59d0)
/* 7888 80006C88 246C59D0 */  addiu      $t4, $v1, %lo(aspMainTextStart_800e59d0)
/* 788C 80006C8C 3C020001 */  lui        $v0, 1
/* 7890 80006C90 2442F321 */  addiu      $v0, $v0, -0xcdf
/* 7894 80006C94 01825021 */  addu       $t2, $t4, $v0
/* 7898 80006C98 3C03800F */  lui        $v1, %hi(bss_tele_obj)
/* 789C 80006C9C 246351A0 */  addiu      $v1, $v1, %lo(bss_tele_obj)
/* 78A0 80006CA0 3C020001 */  lui        $v0, 1
/* 78A4 80006CA4 2442A7F7 */  addiu      $v0, $v0, -0x5809
/* 78A8 80006CA8 0104202B */  sltu       $a0, $t0, $a0
/* 78AC 80006CAC 14800009 */  bnez       $a0, .L80006CD4
/* 78B0 80006CB0 00624821 */   addu      $t1, $v1, $v0
/* 78B4 80006CB4 0168102B */  sltu       $v0, $t3, $t0
/* 78B8 80006CB8 14400007 */  bnez       $v0, .L80006CD8
/* 78BC 80006CBC 010C102B */   sltu      $v0, $t0, $t4
/* 78C0 80006CC0 240200C0 */  addiu      $v0, $zero, 0xc0
/* 78C4 80006CC4 A0A00000 */  sb         $zero, ($a1)
.L80006CC8:
/* 78C8 80006CC8 A0C20000 */  sb         $v0, ($a2)
/* 78CC 80006CCC 03E00008 */  jr         $ra
/* 78D0 80006CD0 A0E20000 */   sb        $v0, ($a3)
.L80006CD4:
/* 78D4 80006CD4 010C102B */  sltu       $v0, $t0, $t4
.L80006CD8:
/* 78D8 80006CD8 14400009 */  bnez       $v0, .L80006D00
/* 78DC 80006CDC 0103102B */   sltu      $v0, $t0, $v1
/* 78E0 80006CE0 0148102B */  sltu       $v0, $t2, $t0
/* 78E4 80006CE4 14400006 */  bnez       $v0, .L80006D00
/* 78E8 80006CE8 0103102B */   sltu      $v0, $t0, $v1
/* 78EC 80006CEC 240200C0 */  addiu      $v0, $zero, 0xc0
/* 78F0 80006CF0 A0A20000 */  sb         $v0, ($a1)
/* 78F4 80006CF4 A0C00000 */  sb         $zero, ($a2)
/* 78F8 80006CF8 03E00008 */  jr         $ra
/* 78FC 80006CFC A0E20000 */   sb        $v0, ($a3)
.L80006D00:
/* 7900 80006D00 14400007 */  bnez       $v0, .L80006D20
/* 7904 80006D04 240200FF */   addiu     $v0, $zero, 0xff
/* 7908 80006D08 0128102B */  sltu       $v0, $t1, $t0
/* 790C 80006D0C 14400004 */  bnez       $v0, .L80006D20
/* 7910 80006D10 240200FF */   addiu     $v0, $zero, 0xff
/* 7914 80006D14 24020080 */  addiu      $v0, $zero, 0x80
/* 7918 80006D18 08001B32 */  j          .L80006CC8
/* 791C 80006D1C A0A20000 */   sb        $v0, ($a1)
.L80006D20:
/* 7920 80006D20 A0A00000 */  sb         $zero, ($a1)
/* 7924 80006D24 A0C20000 */  sb         $v0, ($a2)
/* 7928 80006D28 03E00008 */  jr         $ra
/* 792C 80006D2C A0E00000 */   sb        $zero, ($a3)

glabel crash_text_2
/* 7930 80006D30 27BDFEB8 */  addiu      $sp, $sp, -0x148
/* 7934 80006D34 AFB10124 */  sw         $s1, 0x124($sp)
/* 7938 80006D38 00808821 */  addu       $s1, $a0, $zero
/* 793C 80006D3C AFB3012C */  sw         $s3, 0x12c($sp)
/* 7940 80006D40 00A09821 */  addu       $s3, $a1, $zero
/* 7944 80006D44 AFBF0144 */  sw         $ra, 0x144($sp)
/* 7948 80006D48 AFBE0140 */  sw         $fp, 0x140($sp)
/* 794C 80006D4C AFB7013C */  sw         $s7, 0x13c($sp)
/* 7950 80006D50 AFB60138 */  sw         $s6, 0x138($sp)
/* 7954 80006D54 AFB50134 */  sw         $s5, 0x134($sp)
/* 7958 80006D58 AFB40130 */  sw         $s4, 0x130($sp)
/* 795C 80006D5C AFB20128 */  sw         $s2, 0x128($sp)
/* 7960 80006D60 0C030BF0 */  jal        osGetNotactiveQueue
/* 7964 80006D64 AFB00120 */   sw        $s0, 0x120($sp)
/* 7968 80006D68 02602021 */  addu       $a0, $s3, $zero
/* 796C 80006D6C 24050843 */  addiu      $a1, $zero, 0x843
/* 7970 80006D70 0C001994 */  jal        func_80006650
/* 7974 80006D74 00409021 */   addu      $s2, $v0, $zero
/* 7978 80006D78 27A40020 */  addiu      $a0, $sp, 0x20
/* 797C 80006D7C 3C05800D */  lui        $a1, %hi(D_800D7A60)
/* 7980 80006D80 0C0333AC */  jal        sprintf
/* 7984 80006D84 24A57A60 */   addiu     $a1, $a1, %lo(D_800D7A60)
/* 7988 80006D88 0C0019AC */  jal        crash_strlen
/* 798C 80006D8C 27A40020 */   addiu     $a0, $sp, 0x20
/* 7990 80006D90 02602021 */  addu       $a0, $s3, $zero
/* 7994 80006D94 27A50020 */  addiu      $a1, $sp, 0x20
/* 7998 80006D98 00403021 */  addu       $a2, $v0, $zero
/* 799C 80006D9C 2407000F */  addiu      $a3, $zero, 0xf
/* 79A0 80006DA0 240200FF */  addiu      $v0, $zero, 0xff
/* 79A4 80006DA4 AFA20010 */  sw         $v0, 0x10($sp)
/* 79A8 80006DA8 AFA20014 */  sw         $v0, 0x14($sp)
/* 79AC 80006DAC 0C001FEB */  jal        crash_print
/* 79B0 80006DB0 AFA00018 */   sw        $zero, 0x18($sp)
/* 79B4 80006DB4 0000A021 */  addu       $s4, $zero, $zero
/* 79B8 80006DB8 3C031234 */  lui        $v1, 0x1234
/* 79BC 80006DBC 3C02800F */  lui        $v0, %hi(D_800E96D0)
/* 79C0 80006DC0 34635678 */  ori        $v1, $v1, 0x5678
/* 79C4 80006DC4 3C15800D */  lui        $s5, 0x800d
/* 79C8 80006DC8 3C16800D */  lui        $s6, 0x800d
/* 79CC 80006DCC 3C17800D */  lui        $s7, 0x800d
/* 79D0 80006DD0 8C4496D0 */  lw         $a0, %lo(D_800E96D0)($v0)
/* 79D4 80006DD4 3C1E800E */  lui        $fp, 0x800e
/* 79D8 80006DD8 8C820000 */  lw         $v0, ($a0)
/* 79DC 80006DDC 14430007 */  bne        $v0, $v1, .L80006DFC
/* 79E0 80006DE0 24840004 */   addiu     $a0, $a0, 4
/* 79E4 80006DE4 3C031234 */  lui        $v1, 0x1234
/* 79E8 80006DE8 34635678 */  ori        $v1, $v1, 0x5678
.L80006DEC:
/* 79EC 80006DEC 26940001 */  addiu      $s4, $s4, 1
/* 79F0 80006DF0 8C820000 */  lw         $v0, ($a0)
/* 79F4 80006DF4 1043FFFD */  beq        $v0, $v1, .L80006DEC
/* 79F8 80006DF8 24840004 */   addiu     $a0, $a0, 4
.L80006DFC:
/* 79FC 80006DFC 92220104 */  lbu        $v0, 0x104($s1)
/* 7A00 80006E00 10400034 */  beqz       $v0, .L80006ED4
/* 7A04 80006E04 0014A080 */   sll       $s4, $s4, 2
/* 7A08 80006E08 02602021 */  addu       $a0, $s3, $zero
/* 7A0C 80006E0C 26A57A8C */  addiu      $a1, $s5, 0x7a8c
/* 7A10 80006E10 24060014 */  addiu      $a2, $zero, 0x14
/* 7A14 80006E14 24070019 */  addiu      $a3, $zero, 0x19
/* 7A18 80006E18 241000FF */  addiu      $s0, $zero, 0xff
/* 7A1C 80006E1C AFB00010 */  sw         $s0, 0x10($sp)
/* 7A20 80006E20 AFB00014 */  sw         $s0, 0x14($sp)
/* 7A24 80006E24 0C001FEB */  jal        crash_print
/* 7A28 80006E28 AFA00018 */   sw        $zero, 0x18($sp)
/* 7A2C 80006E2C 02602021 */  addu       $a0, $s3, $zero
/* 7A30 80006E30 26250004 */  addiu      $a1, $s1, 4
/* 7A34 80006E34 2406001E */  addiu      $a2, $zero, 0x1e
/* 7A38 80006E38 24070022 */  addiu      $a3, $zero, 0x22
/* 7A3C 80006E3C AFA00010 */  sw         $zero, 0x10($sp)
/* 7A40 80006E40 AFB00014 */  sw         $s0, 0x14($sp)
/* 7A44 80006E44 0C001FEB */  jal        crash_print
/* 7A48 80006E48 AFA00018 */   sw        $zero, 0x18($sp)
/* 7A4C 80006E4C 02602021 */  addu       $a0, $s3, $zero
/* 7A50 80006E50 26C57A98 */  addiu      $a1, $s6, 0x7a98
/* 7A54 80006E54 24060014 */  addiu      $a2, $zero, 0x14
/* 7A58 80006E58 24070046 */  addiu      $a3, $zero, 0x46
/* 7A5C 80006E5C AFB00010 */  sw         $s0, 0x10($sp)
/* 7A60 80006E60 AFB00014 */  sw         $s0, 0x14($sp)
/* 7A64 80006E64 0C001FEB */  jal        crash_print
/* 7A68 80006E68 AFA00018 */   sw        $zero, 0x18($sp)
/* 7A6C 80006E6C 02602021 */  addu       $a0, $s3, $zero
/* 7A70 80006E70 26250084 */  addiu      $a1, $s1, 0x84
/* 7A74 80006E74 2406001E */  addiu      $a2, $zero, 0x1e
/* 7A78 80006E78 2407004F */  addiu      $a3, $zero, 0x4f
/* 7A7C 80006E7C AFA00010 */  sw         $zero, 0x10($sp)
/* 7A80 80006E80 AFB00014 */  sw         $s0, 0x14($sp)
/* 7A84 80006E84 0C001FEB */  jal        crash_print
/* 7A88 80006E88 AFA00018 */   sw        $zero, 0x18($sp)
/* 7A8C 80006E8C 2412007C */  addiu      $s2, $zero, 0x7c
/* 7A90 80006E90 02602021 */  addu       $a0, $s3, $zero
/* 7A94 80006E94 26E57ADC */  addiu      $a1, $s7, 0x7adc
/* 7A98 80006E98 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 7A9C 80006E9C 8C460008 */  lw         $a2, 8($v0)
/* 7AA0 80006EA0 24070014 */  addiu      $a3, $zero, 0x14
/* 7AA4 80006EA4 AFB20010 */  sw         $s2, 0x10($sp)
/* 7AA8 80006EA8 0C001AE9 */  jal        crash_print_2
/* 7AAC 80006EAC 24120085 */   addiu     $s2, $zero, 0x85
/* 7AB0 80006EB0 02602021 */  addu       $a0, $s3, $zero
/* 7AB4 80006EB4 3C02800D */  lui        $v0, %hi(D_800D7AEC)
/* 7AB8 80006EB8 24457AEC */  addiu      $a1, $v0, %lo(D_800D7AEC)
/* 7ABC 80006EBC 02803021 */  addu       $a2, $s4, $zero
/* 7AC0 80006EC0 24070014 */  addiu      $a3, $zero, 0x14
/* 7AC4 80006EC4 0C001AE9 */  jal        crash_print_2
/* 7AC8 80006EC8 AFB20010 */   sw        $s2, 0x10($sp)
/* 7ACC 80006ECC 08001C2C */  j          .L800070B0
/* 7AD0 80006ED0 02602021 */   addu      $a0, $s3, $zero
.L80006ED4:
/* 7AD4 80006ED4 02602021 */  addu       $a0, $s3, $zero
/* 7AD8 80006ED8 3C05800D */  lui        $a1, %hi(D_800D7AA0)
/* 7ADC 80006EDC 24A57AA0 */  addiu      $a1, $a1, %lo(D_800D7AA0)
/* 7AE0 80006EE0 24060014 */  addiu      $a2, $zero, 0x14
/* 7AE4 80006EE4 24070019 */  addiu      $a3, $zero, 0x19
/* 7AE8 80006EE8 241000FF */  addiu      $s0, $zero, 0xff
/* 7AEC 80006EEC AFB00010 */  sw         $s0, 0x10($sp)
/* 7AF0 80006EF0 AFB00014 */  sw         $s0, 0x14($sp)
/* 7AF4 80006EF4 0C001FEB */  jal        crash_print
/* 7AF8 80006EF8 AFA00018 */   sw        $zero, 0x18($sp)
/* 7AFC 80006EFC 27A40020 */  addiu      $a0, $sp, 0x20
/* 7B00 80006F00 3C05800D */  lui        $a1, %hi(D_800D7AA8)
/* 7B04 80006F04 8E460014 */  lw         $a2, 0x14($s2)
/* 7B08 80006F08 0C0333AC */  jal        sprintf
/* 7B0C 80006F0C 24A57AA8 */   addiu     $a1, $a1, %lo(D_800D7AA8)
/* 7B10 80006F10 02602021 */  addu       $a0, $s3, $zero
/* 7B14 80006F14 27A50020 */  addiu      $a1, $sp, 0x20
/* 7B18 80006F18 2406001E */  addiu      $a2, $zero, 0x1e
/* 7B1C 80006F1C 24070022 */  addiu      $a3, $zero, 0x22
/* 7B20 80006F20 AFA00010 */  sw         $zero, 0x10($sp)
/* 7B24 80006F24 AFB00014 */  sw         $s0, 0x14($sp)
/* 7B28 80006F28 0C001FEB */  jal        crash_print
/* 7B2C 80006F2C AFA00018 */   sw        $zero, 0x18($sp)
/* 7B30 80006F30 02602021 */  addu       $a0, $s3, $zero
/* 7B34 80006F34 26A57A8C */  addiu      $a1, $s5, 0x7a8c
/* 7B38 80006F38 24060014 */  addiu      $a2, $zero, 0x14
/* 7B3C 80006F3C 24070034 */  addiu      $a3, $zero, 0x34
/* 7B40 80006F40 AFB00010 */  sw         $s0, 0x10($sp)
/* 7B44 80006F44 AFB00014 */  sw         $s0, 0x14($sp)
/* 7B48 80006F48 0C001FEB */  jal        crash_print
/* 7B4C 80006F4C AFA00018 */   sw        $zero, 0x18($sp)
/* 7B50 80006F50 27A40020 */  addiu      $a0, $sp, 0x20
/* 7B54 80006F54 3C11800D */  lui        $s1, %hi(D_800D7AAC)
/* 7B58 80006F58 26317AAC */  addiu      $s1, $s1, %lo(D_800D7AAC)
/* 7B5C 80006F5C 8E46011C */  lw         $a2, 0x11c($s2)
/* 7B60 80006F60 0C0333AC */  jal        sprintf
/* 7B64 80006F64 02202821 */   addu      $a1, $s1, $zero
/* 7B68 80006F68 02602021 */  addu       $a0, $s3, $zero
/* 7B6C 80006F6C 27A50020 */  addiu      $a1, $sp, 0x20
/* 7B70 80006F70 2406001E */  addiu      $a2, $zero, 0x1e
/* 7B74 80006F74 2407003D */  addiu      $a3, $zero, 0x3d
/* 7B78 80006F78 AFA00010 */  sw         $zero, 0x10($sp)
/* 7B7C 80006F7C AFB00014 */  sw         $s0, 0x14($sp)
/* 7B80 80006F80 0C001FEB */  jal        crash_print
/* 7B84 80006F84 AFA00018 */   sw        $zero, 0x18($sp)
/* 7B88 80006F88 02602021 */  addu       $a0, $s3, $zero
/* 7B8C 80006F8C 3C05800D */  lui        $a1, %hi(D_800D7AB4)
/* 7B90 80006F90 24A57AB4 */  addiu      $a1, $a1, %lo(D_800D7AB4)
/* 7B94 80006F94 24060014 */  addiu      $a2, $zero, 0x14
/* 7B98 80006F98 2407004F */  addiu      $a3, $zero, 0x4f
/* 7B9C 80006F9C AFB00010 */  sw         $s0, 0x10($sp)
/* 7BA0 80006FA0 AFB00014 */  sw         $s0, 0x14($sp)
/* 7BA4 80006FA4 0C001FEB */  jal        crash_print
/* 7BA8 80006FA8 AFA00018 */   sw        $zero, 0x18($sp)
/* 7BAC 80006FAC 27A40020 */  addiu      $a0, $sp, 0x20
/* 7BB0 80006FB0 8E460104 */  lw         $a2, 0x104($s2)
/* 7BB4 80006FB4 0C0333AC */  jal        sprintf
/* 7BB8 80006FB8 02202821 */   addu      $a1, $s1, $zero
/* 7BBC 80006FBC 02602021 */  addu       $a0, $s3, $zero
/* 7BC0 80006FC0 27A50020 */  addiu      $a1, $sp, 0x20
/* 7BC4 80006FC4 2406001E */  addiu      $a2, $zero, 0x1e
/* 7BC8 80006FC8 24070058 */  addiu      $a3, $zero, 0x58
/* 7BCC 80006FCC AFA00010 */  sw         $zero, 0x10($sp)
/* 7BD0 80006FD0 AFB00014 */  sw         $s0, 0x14($sp)
/* 7BD4 80006FD4 0C001FEB */  jal        crash_print
/* 7BD8 80006FD8 AFA00018 */   sw        $zero, 0x18($sp)
/* 7BDC 80006FDC 02602021 */  addu       $a0, $s3, $zero
/* 7BE0 80006FE0 26C57A98 */  addiu      $a1, $s6, 0x7a98
/* 7BE4 80006FE4 24060014 */  addiu      $a2, $zero, 0x14
/* 7BE8 80006FE8 2407006A */  addiu      $a3, $zero, 0x6a
/* 7BEC 80006FEC AFB00010 */  sw         $s0, 0x10($sp)
/* 7BF0 80006FF0 AFB00014 */  sw         $s0, 0x14($sp)
/* 7BF4 80006FF4 0C001FEB */  jal        crash_print
/* 7BF8 80006FF8 AFA00018 */   sw        $zero, 0x18($sp)
/* 7BFC 80006FFC 3C02800E */  lui        $v0, %hi(CauseStrings)
/* 7C00 80007000 8C436240 */  lw         $v1, %lo(CauseStrings)($v0)
/* 7C04 80007004 10600010 */  beqz       $v1, .L80007048
/* 7C08 80007008 24506240 */   addiu     $s0, $v0, 0x6240
/* 7C0C 8000700C 3C11800D */  lui        $s1, 0x800d
/* 7C10 80007010 8E420120 */  lw         $v0, 0x120($s2)
.L80007014:
/* 7C14 80007014 8E030000 */  lw         $v1, ($s0)
/* 7C18 80007018 8E040004 */  lw         $a0, 4($s0)
/* 7C1C 8000701C 00431024 */  and        $v0, $v0, $v1
/* 7C20 80007020 54440006 */  bnel       $v0, $a0, .L8000703C
/* 7C24 80007024 2610000C */   addiu     $s0, $s0, 0xc
/* 7C28 80007028 27A40020 */  addiu      $a0, $sp, 0x20
/* 7C2C 8000702C 8E060008 */  lw         $a2, 8($s0)
/* 7C30 80007030 0C0333AC */  jal        sprintf
/* 7C34 80007034 26257ABC */   addiu     $a1, $s1, 0x7abc
/* 7C38 80007038 2610000C */  addiu      $s0, $s0, 0xc
.L8000703C:
/* 7C3C 8000703C 8E020000 */  lw         $v0, ($s0)
/* 7C40 80007040 5440FFF4 */  bnel       $v0, $zero, .L80007014
/* 7C44 80007044 8E420120 */   lw        $v0, 0x120($s2)
.L80007048:
/* 7C48 80007048 02602021 */  addu       $a0, $s3, $zero
/* 7C4C 8000704C 27A50020 */  addiu      $a1, $sp, 0x20
/* 7C50 80007050 2406001E */  addiu      $a2, $zero, 0x1e
/* 7C54 80007054 24070073 */  addiu      $a3, $zero, 0x73
/* 7C58 80007058 240200FF */  addiu      $v0, $zero, 0xff
/* 7C5C 8000705C AFA00010 */  sw         $zero, 0x10($sp)
/* 7C60 80007060 AFA20014 */  sw         $v0, 0x14($sp)
/* 7C64 80007064 0C001FEB */  jal        crash_print
/* 7C68 80007068 AFA00018 */   sw        $zero, 0x18($sp)
/* 7C6C 8000706C 24120085 */  addiu      $s2, $zero, 0x85
/* 7C70 80007070 02602021 */  addu       $a0, $s3, $zero
/* 7C74 80007074 26E57ADC */  addiu      $a1, $s7, 0x7adc
/* 7C78 80007078 27C268A8 */  addiu      $v0, $fp, 0x68a8
/* 7C7C 8000707C 8C460008 */  lw         $a2, 8($v0)
/* 7C80 80007080 24070014 */  addiu      $a3, $zero, 0x14
/* 7C84 80007084 AFB20010 */  sw         $s2, 0x10($sp)
/* 7C88 80007088 0C001AE9 */  jal        crash_print_2
/* 7C8C 8000708C 2412008E */   addiu     $s2, $zero, 0x8e
/* 7C90 80007090 02602021 */  addu       $a0, $s3, $zero
/* 7C94 80007094 3C02800D */  lui        $v0, %hi(D_800D7AEC)
/* 7C98 80007098 24457AEC */  addiu      $a1, $v0, %lo(D_800D7AEC)
/* 7C9C 8000709C 02803021 */  addu       $a2, $s4, $zero
/* 7CA0 800070A0 24070014 */  addiu      $a3, $zero, 0x14
/* 7CA4 800070A4 0C001AE9 */  jal        crash_print_2
/* 7CA8 800070A8 AFB20010 */   sw        $s2, 0x10($sp)
/* 7CAC 800070AC 02602021 */  addu       $a0, $s3, $zero
.L800070B0:
/* 7CB0 800070B0 3C05800D */  lui        $a1, %hi(D_800D7AC0)
/* 7CB4 800070B4 24A57AC0 */  addiu      $a1, $a1, %lo(D_800D7AC0)
/* 7CB8 800070B8 240600C8 */  addiu      $a2, $zero, 0xc8
/* 7CBC 800070BC 02403821 */  addu       $a3, $s2, $zero
/* 7CC0 800070C0 241100FF */  addiu      $s1, $zero, 0xff
/* 7CC4 800070C4 AFB10010 */  sw         $s1, 0x10($sp)
/* 7CC8 800070C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CCC 800070CC 0C001FEB */  jal        crash_print
/* 7CD0 800070D0 AFA00018 */   sw        $zero, 0x18($sp)
/* 7CD4 800070D4 02602021 */  addu       $a0, $s3, $zero
/* 7CD8 800070D8 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 7CDC 800070DC 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 7CE0 800070E0 02002821 */  addu       $a1, $s0, $zero
/* 7CE4 800070E4 240600C8 */  addiu      $a2, $zero, 0xc8
/* 7CE8 800070E8 26470009 */  addiu      $a3, $s2, 9
/* 7CEC 800070EC 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 7CF0 800070F0 AFA00010 */  sw         $zero, 0x10($sp)
/* 7CF4 800070F4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CF8 800070F8 0C001FEB */  jal        crash_print
/* 7CFC 800070FC AFA00018 */   sw        $zero, 0x18($sp)
/* 7D00 80007100 8E02DF90 */  lw         $v0, -0x2070($s0)
/* 7D04 80007104 1040005A */  beqz       $v0, .L80007270
/* 7D08 80007108 8FBF0144 */   lw        $ra, 0x144($sp)
/* 7D0C 8000710C 0C0025B4 */  jal        get_hres
/* 7D10 80007110 00000000 */   nop
/* 7D14 80007114 0C0025B7 */  jal        get_vres
/* 7D18 80007118 00408021 */   addu      $s0, $v0, $zero
/* 7D1C 8000711C 0C0025BA */  jal        get_colorDepth
/* 7D20 80007120 0040A821 */   addu      $s5, $v0, $zero
/* 7D24 80007124 0C002593 */  jal        get_vi_buffer_choice
/* 7D28 80007128 00408821 */   addu      $s1, $v0, $zero
/* 7D2C 8000712C 0040A021 */  addu       $s4, $v0, $zero
/* 7D30 80007130 24020010 */  addiu      $v0, $zero, 0x10
/* 7D34 80007134 16220008 */  bne        $s1, $v0, .L80007158
/* 7D38 80007138 00000000 */   nop
/* 7D3C 8000713C 0C0025A4 */  jal        get_vi_buffer
/* 7D40 80007140 00002021 */   addu      $a0, $zero, $zero
/* 7D44 80007144 24040001 */  addiu      $a0, $zero, 1
/* 7D48 80007148 0C0025A4 */  jal        get_vi_buffer
/* 7D4C 8000714C AFA200E0 */   sw        $v0, 0xe0($sp)
/* 7D50 80007150 08001C5C */  j          .L80007170
/* 7D54 80007154 AFA200E4 */   sw        $v0, 0xe4($sp)
.L80007158:
/* 7D58 80007158 0C0025A4 */  jal        get_vi_buffer
/* 7D5C 8000715C 00002021 */   addu      $a0, $zero, $zero
/* 7D60 80007160 24040001 */  addiu      $a0, $zero, 1
/* 7D64 80007164 0C0025A4 */  jal        get_vi_buffer
/* 7D68 80007168 AFA200A0 */   sw        $v0, 0xa0($sp)
/* 7D6C 8000716C AFA200A4 */  sw         $v0, 0xa4($sp)
.L80007170:
/* 7D70 80007170 12A0003E */  beqz       $s5, .L8000726C
/* 7D74 80007174 00009021 */   addu      $s2, $zero, $zero
/* 7D78 80007178 00146080 */  sll        $t4, $s4, 2
/* 7D7C 8000717C 27B400E0 */  addiu      $s4, $sp, 0xe0
/* 7D80 80007180 27AF00A0 */  addiu      $t7, $sp, 0xa0
/* 7D84 80007184 00003021 */  addu       $a2, $zero, $zero
.L80007188:
/* 7D88 80007188 12000034 */  beqz       $s0, .L8000725C
/* 7D8C 8000718C 264D0002 */   addiu     $t5, $s2, 2
/* 7D90 80007190 240E0010 */  addiu      $t6, $zero, 0x10
/* 7D94 80007194 028C5821 */  addu       $t3, $s4, $t4
/* 7D98 80007198 00121842 */  srl        $v1, $s2, 1
/* 7D9C 8000719C 00031040 */  sll        $v0, $v1, 1
/* 7DA0 800071A0 00431021 */  addu       $v0, $v0, $v1
/* 7DA4 800071A4 000210C0 */  sll        $v0, $v0, 3
/* 7DA8 800071A8 00431021 */  addu       $v0, $v0, $v1
/* 7DAC 800071AC 02500018 */  mult       $s2, $s0
/* 7DB0 800071B0 00024900 */  sll        $t1, $v0, 4
/* 7DB4 800071B4 3C080001 */  lui        $t0, 1
/* 7DB8 800071B8 3508D510 */  ori        $t0, $t0, 0xd510
/* 7DBC 800071BC 01EC5021 */  addu       $t2, $t7, $t4
/* 7DC0 800071C0 00003812 */  mflo       $a3
.L800071C4:
/* 7DC4 800071C4 162E000C */  bne        $s1, $t6, .L800071F8
/* 7DC8 800071C8 00E61021 */   addu      $v0, $a3, $a2
/* 7DCC 800071CC 8D630000 */  lw         $v1, ($t3)
/* 7DD0 800071D0 00021040 */  sll        $v0, $v0, 1
/* 7DD4 800071D4 00431021 */  addu       $v0, $v0, $v1
/* 7DD8 800071D8 00061842 */  srl        $v1, $a2, 1
/* 7DDC 800071DC 01231821 */  addu       $v1, $t1, $v1
/* 7DE0 800071E0 00031840 */  sll        $v1, $v1, 1
/* 7DE4 800071E4 00731821 */  addu       $v1, $v1, $s3
/* 7DE8 800071E8 94440000 */  lhu        $a0, ($v0)
/* 7DEC 800071EC 00681821 */  addu       $v1, $v1, $t0
/* 7DF0 800071F0 08001C92 */  j          .L80007248
/* 7DF4 800071F4 A4640000 */   sh        $a0, ($v1)
.L800071F8:
/* 7DF8 800071F8 8D430000 */  lw         $v1, ($t2)
/* 7DFC 800071FC 00021080 */  sll        $v0, $v0, 2
/* 7E00 80007200 00431021 */  addu       $v0, $v0, $v1
/* 7E04 80007204 8C440000 */  lw         $a0, ($v0)
/* 7E08 80007208 00042C02 */  srl        $a1, $a0, 0x10
/* 7E0C 8000720C 30A5F800 */  andi       $a1, $a1, 0xf800
/* 7E10 80007210 00041342 */  srl        $v0, $a0, 0xd
/* 7E14 80007214 304207C0 */  andi       $v0, $v0, 0x7c0
/* 7E18 80007218 00A22825 */  or         $a1, $a1, $v0
/* 7E1C 8000721C 00041A82 */  srl        $v1, $a0, 0xa
/* 7E20 80007220 3063003E */  andi       $v1, $v1, 0x3e
/* 7E24 80007224 00A32825 */  or         $a1, $a1, $v1
/* 7E28 80007228 30840001 */  andi       $a0, $a0, 1
/* 7E2C 8000722C 00A42025 */  or         $a0, $a1, $a0
/* 7E30 80007230 00061042 */  srl        $v0, $a2, 1
/* 7E34 80007234 01221021 */  addu       $v0, $t1, $v0
/* 7E38 80007238 00021040 */  sll        $v0, $v0, 1
/* 7E3C 8000723C 00531021 */  addu       $v0, $v0, $s3
/* 7E40 80007240 00481021 */  addu       $v0, $v0, $t0
/* 7E44 80007244 A4440000 */  sh         $a0, ($v0)
.L80007248:
/* 7E48 80007248 24C20002 */  addiu      $v0, $a2, 2
/* 7E4C 8000724C 3046FFFF */  andi       $a2, $v0, 0xffff
/* 7E50 80007250 00D0182B */  sltu       $v1, $a2, $s0
/* 7E54 80007254 1460FFDB */  bnez       $v1, .L800071C4
/* 7E58 80007258 00000000 */   nop
.L8000725C:
/* 7E5C 8000725C 31B2FFFF */  andi       $s2, $t5, 0xffff
/* 7E60 80007260 0255102B */  sltu       $v0, $s2, $s5
/* 7E64 80007264 5440FFC8 */  bnel       $v0, $zero, .L80007188
/* 7E68 80007268 00003021 */   addu      $a2, $zero, $zero
.L8000726C:
/* 7E6C 8000726C 8FBF0144 */  lw         $ra, 0x144($sp)
.L80007270:
/* 7E70 80007270 8FBE0140 */  lw         $fp, 0x140($sp)
/* 7E74 80007274 8FB7013C */  lw         $s7, 0x13c($sp)
/* 7E78 80007278 8FB60138 */  lw         $s6, 0x138($sp)
/* 7E7C 8000727C 8FB50134 */  lw         $s5, 0x134($sp)
/* 7E80 80007280 8FB40130 */  lw         $s4, 0x130($sp)
/* 7E84 80007284 8FB3012C */  lw         $s3, 0x12c($sp)
/* 7E88 80007288 8FB20128 */  lw         $s2, 0x128($sp)
/* 7E8C 8000728C 8FB10124 */  lw         $s1, 0x124($sp)
/* 7E90 80007290 8FB00120 */  lw         $s0, 0x120($sp)
/* 7E94 80007294 03E00008 */  jr         $ra
/* 7E98 80007298 27BD0148 */   addiu     $sp, $sp, 0x148

glabel func_8000729C
/* 7E9C 8000729C 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* 7EA0 800072A0 8FA200E0 */  lw         $v0, 0xe0($sp)
/* 7EA4 800072A4 8FA300E4 */  lw         $v1, 0xe4($sp)
/* 7EA8 800072A8 AFA400D0 */  sw         $a0, 0xd0($sp)
/* 7EAC 800072AC 8FA400E8 */  lw         $a0, 0xe8($sp)
/* 7EB0 800072B0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7EB4 800072B4 AFBE00C8 */  sw         $fp, 0xc8($sp)
/* 7EB8 800072B8 30DEFFFF */  andi       $fp, $a2, 0xffff
/* 7EBC 800072BC AFA500A4 */  sw         $a1, 0xa4($sp)
/* 7EC0 800072C0 8FA500EC */  lw         $a1, 0xec($sp)
/* 7EC4 800072C4 8FA600F0 */  lw         $a2, 0xf0($sp)
/* 7EC8 800072C8 8FA800F4 */  lw         $t0, 0xf4($sp)
/* 7ECC 800072CC 8FA900F8 */  lw         $t1, 0xf8($sp)
/* 7ED0 800072D0 AFB200B0 */  sw         $s2, 0xb0($sp)
/* 7ED4 800072D4 00009021 */  addu       $s2, $zero, $zero
/* 7ED8 800072D8 AFB700C4 */  sw         $s7, 0xc4($sp)
/* 7EDC 800072DC 27B70020 */  addiu      $s7, $sp, 0x20
/* 7EE0 800072E0 AFB600C0 */  sw         $s6, 0xc0($sp)
/* 7EE4 800072E4 27B600A0 */  addiu      $s6, $sp, 0xa0
/* 7EE8 800072E8 AFB500BC */  sw         $s5, 0xbc($sp)
/* 7EEC 800072EC 27B500A1 */  addiu      $s5, $sp, 0xa1
/* 7EF0 800072F0 AFB400B8 */  sw         $s4, 0xb8($sp)
/* 7EF4 800072F4 27B400A2 */  addiu      $s4, $sp, 0xa2
/* 7EF8 800072F8 AFB300B4 */  sw         $s3, 0xb4($sp)
/* 7EFC 800072FC 27B30060 */  addiu      $s3, $sp, 0x60
/* 7F00 80007300 AFBF00CC */  sw         $ra, 0xcc($sp)
/* 7F04 80007304 AFB100AC */  sw         $s1, 0xac($sp)
/* 7F08 80007308 AFB000A8 */  sw         $s0, 0xa8($sp)
/* 7F0C 8000730C AFA70020 */  sw         $a3, 0x20($sp)
/* 7F10 80007310 AFA20024 */  sw         $v0, 0x24($sp)
/* 7F14 80007314 AFA30028 */  sw         $v1, 0x28($sp)
/* 7F18 80007318 AFA4002C */  sw         $a0, 0x2c($sp)
/* 7F1C 8000731C AFA50030 */  sw         $a1, 0x30($sp)
/* 7F20 80007320 AFA60034 */  sw         $a2, 0x34($sp)
/* 7F24 80007324 AFA80038 */  sw         $t0, 0x38($sp)
/* 7F28 80007328 AFA9003C */  sw         $t1, 0x3c($sp)
/* 7F2C 8000732C 02C02821 */  addu       $a1, $s6, $zero
.L80007330:
/* 7F30 80007330 02A03021 */  addu       $a2, $s5, $zero
/* 7F34 80007334 00128080 */  sll        $s0, $s2, 2
/* 7F38 80007338 02F08821 */  addu       $s1, $s7, $s0
/* 7F3C 8000733C 8E240000 */  lw         $a0, ($s1)
/* 7F40 80007340 0C001B1B */  jal        func_80006C6C
/* 7F44 80007344 02803821 */   addu      $a3, $s4, $zero
/* 7F48 80007348 02602021 */  addu       $a0, $s3, $zero
/* 7F4C 8000734C 3C02800D */  lui        $v0, %hi(D_800D7AAC)
/* 7F50 80007350 8E260000 */  lw         $a2, ($s1)
/* 7F54 80007354 0C0333AC */  jal        sprintf
/* 7F58 80007358 24457AAC */   addiu     $a1, $v0, %lo(D_800D7AAC)
/* 7F5C 8000735C 02602821 */  addu       $a1, $s3, $zero
/* 7F60 80007360 02128021 */  addu       $s0, $s0, $s2
/* 7F64 80007364 00108040 */  sll        $s0, $s0, 1
/* 7F68 80007368 03D08021 */  addu       $s0, $fp, $s0
/* 7F6C 8000736C 8FA400D0 */  lw         $a0, 0xd0($sp)
/* 7F70 80007370 8FA600A4 */  lw         $a2, 0xa4($sp)
/* 7F74 80007374 93A200A0 */  lbu        $v0, 0xa0($sp)
/* 7F78 80007378 93A300A1 */  lbu        $v1, 0xa1($sp)
/* 7F7C 8000737C 93A800A2 */  lbu        $t0, 0xa2($sp)
/* 7F80 80007380 3207FFFF */  andi       $a3, $s0, 0xffff
/* 7F84 80007384 AFA20010 */  sw         $v0, 0x10($sp)
/* 7F88 80007388 AFA30014 */  sw         $v1, 0x14($sp)
/* 7F8C 8000738C 0C001FEB */  jal        crash_print
/* 7F90 80007390 AFA80018 */   sw        $t0, 0x18($sp)
/* 7F94 80007394 26420001 */  addiu      $v0, $s2, 1
/* 7F98 80007398 3052FFFF */  andi       $s2, $v0, 0xffff
/* 7F9C 8000739C 2E430008 */  sltiu      $v1, $s2, 8
/* 7FA0 800073A0 1460FFE3 */  bnez       $v1, .L80007330
/* 7FA4 800073A4 02C02821 */   addu      $a1, $s6, $zero
/* 7FA8 800073A8 8FBF00CC */  lw         $ra, 0xcc($sp)
/* 7FAC 800073AC 8FBE00C8 */  lw         $fp, 0xc8($sp)
/* 7FB0 800073B0 8FB700C4 */  lw         $s7, 0xc4($sp)
/* 7FB4 800073B4 8FB600C0 */  lw         $s6, 0xc0($sp)
/* 7FB8 800073B8 8FB500BC */  lw         $s5, 0xbc($sp)
/* 7FBC 800073BC 8FB400B8 */  lw         $s4, 0xb8($sp)
/* 7FC0 800073C0 8FB300B4 */  lw         $s3, 0xb4($sp)
/* 7FC4 800073C4 8FB200B0 */  lw         $s2, 0xb0($sp)
/* 7FC8 800073C8 8FB100AC */  lw         $s1, 0xac($sp)
/* 7FCC 800073CC 8FB000A8 */  lw         $s0, 0xa8($sp)
/* 7FD0 800073D0 03E00008 */  jr         $ra
/* 7FD4 800073D4 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel stack_dump
/* 7FD8 800073D8 27BDFEA0 */  addiu      $sp, $sp, -0x160
/* 7FDC 800073DC AFBE0158 */  sw         $fp, 0x158($sp)
/* 7FE0 800073E0 00A0F021 */  addu       $fp, $a1, $zero
/* 7FE4 800073E4 AFB20140 */  sw         $s2, 0x140($sp)
/* 7FE8 800073E8 3C12000D */  lui        $s2, 0xd
/* 7FEC 800073EC 26526544 */  addiu      $s2, $s2, 0x6544
/* 7FF0 800073F0 AFB30144 */  sw         $s3, 0x144($sp)
/* 7FF4 800073F4 3C13800E */  lui        $s3, %hi(aspMainTextStart_800e59d0)
/* 7FF8 800073F8 267359D0 */  addiu      $s3, $s3, %lo(aspMainTextStart_800e59d0)
/* 7FFC 800073FC AFB60150 */  sw         $s6, 0x150($sp)
/* 8000 80007400 3C160001 */  lui        $s6, 1
/* 8004 80007404 26D6F321 */  addiu      $s6, $s6, -0xcdf
/* 8008 80007408 AFB70154 */  sw         $s7, 0x154($sp)
/* 800C 8000740C 3C17800F */  lui        $s7, %hi(bss_tele_obj)
/* 8010 80007410 26F751A0 */  addiu      $s7, $s7, %lo(bss_tele_obj)
/* 8014 80007414 AFBF015C */  sw         $ra, 0x15c($sp)
/* 8018 80007418 AFB5014C */  sw         $s5, 0x14c($sp)
/* 801C 8000741C AFB40148 */  sw         $s4, 0x148($sp)
/* 8020 80007420 AFB1013C */  sw         $s1, 0x13c($sp)
/* 8024 80007424 0C030BF0 */  jal        osGetNotactiveQueue
/* 8028 80007428 AFB00138 */   sw        $s0, 0x138($sp)
/* 802C 8000742C 03C02021 */  addu       $a0, $fp, $zero
/* 8030 80007430 AFA20128 */  sw         $v0, 0x128($sp)
/* 8034 80007434 8C4200F4 */  lw         $v0, 0xf4($v0)
/* 8038 80007438 24050843 */  addiu      $a1, $zero, 0x843
/* 803C 8000743C 0C001994 */  jal        func_80006650
/* 8040 80007440 AFA2012C */   sw        $v0, 0x12c($sp)
/* 8044 80007444 03C02021 */  addu       $a0, $fp, $zero
/* 8048 80007448 3C05800D */  lui        $a1, %hi(D_800D7AFC)
/* 804C 8000744C 24A57AFC */  addiu      $a1, $a1, %lo(D_800D7AFC)
/* 8050 80007450 24060019 */  addiu      $a2, $zero, 0x19
/* 8054 80007454 24070019 */  addiu      $a3, $zero, 0x19
/* 8058 80007458 241000C0 */  addiu      $s0, $zero, 0xc0
/* 805C 8000745C AFA00010 */  sw         $zero, 0x10($sp)
/* 8060 80007460 AFB00014 */  sw         $s0, 0x14($sp)
/* 8064 80007464 0C001FEB */  jal        crash_print
/* 8068 80007468 AFB00018 */   sw        $s0, 0x18($sp)
/* 806C 8000746C 27A40020 */  addiu      $a0, $sp, 0x20
/* 8070 80007470 3C15800D */  lui        $s5, %hi(D_800D7B04)
/* 8074 80007474 26B57B04 */  addiu      $s5, $s5, %lo(D_800D7B04)
/* 8078 80007478 0C0333AC */  jal        sprintf
/* 807C 8000747C 02A02821 */   addu      $a1, $s5, $zero
/* 8080 80007480 03C02021 */  addu       $a0, $fp, $zero
/* 8084 80007484 27A50020 */  addiu      $a1, $sp, 0x20
/* 8088 80007488 24060019 */  addiu      $a2, $zero, 0x19
/* 808C 8000748C 24070019 */  addiu      $a3, $zero, 0x19
/* 8090 80007490 241100FF */  addiu      $s1, $zero, 0xff
/* 8094 80007494 AFB10010 */  sw         $s1, 0x10($sp)
/* 8098 80007498 AFB10014 */  sw         $s1, 0x14($sp)
/* 809C 8000749C 0C001FEB */  jal        crash_print
/* 80A0 800074A0 AFA00018 */   sw        $zero, 0x18($sp)
/* 80A4 800074A4 27A40020 */  addiu      $a0, $sp, 0x20
/* 80A8 800074A8 3C14800D */  lui        $s4, %hi(D_800D7B18)
/* 80AC 800074AC 26947B18 */  addiu      $s4, $s4, %lo(D_800D7B18)
/* 80B0 800074B0 02802821 */  addu       $a1, $s4, $zero
/* 80B4 800074B4 3C068000 */  lui        $a2, %hi(rspbootTextStart)
/* 80B8 800074B8 24C60470 */  addiu      $a2, $a2, %lo(rspbootTextStart)
/* 80BC 800074BC 00D21821 */  addu       $v1, $a2, $s2
/* 80C0 800074C0 00603821 */  addu       $a3, $v1, $zero
/* 80C4 800074C4 AFA30124 */  sw         $v1, 0x124($sp)
/* 80C8 800074C8 0C0333AC */  jal        sprintf
/* 80CC 800074CC AFB20010 */   sw        $s2, 0x10($sp)
/* 80D0 800074D0 03C02021 */  addu       $a0, $fp, $zero
/* 80D4 800074D4 27A50020 */  addiu      $a1, $sp, 0x20
/* 80D8 800074D8 24060043 */  addiu      $a2, $zero, 0x43
/* 80DC 800074DC 24070019 */  addiu      $a3, $zero, 0x19
/* 80E0 800074E0 AFA00010 */  sw         $zero, 0x10($sp)
/* 80E4 800074E4 AFB00014 */  sw         $s0, 0x14($sp)
/* 80E8 800074E8 0C001FEB */  jal        crash_print
/* 80EC 800074EC AFB00018 */   sw        $s0, 0x18($sp)
/* 80F0 800074F0 03C02021 */  addu       $a0, $fp, $zero
/* 80F4 800074F4 3C05800D */  lui        $a1, %hi(D_800D7B28)
/* 80F8 800074F8 24A57B28 */  addiu      $a1, $a1, %lo(D_800D7B28)
/* 80FC 800074FC 24060089 */  addiu      $a2, $zero, 0x89
/* 8100 80007500 24070019 */  addiu      $a3, $zero, 0x19
/* 8104 80007504 AFB00010 */  sw         $s0, 0x10($sp)
/* 8108 80007508 AFA00014 */  sw         $zero, 0x14($sp)
/* 810C 8000750C 0C001FEB */  jal        crash_print
/* 8110 80007510 AFB00018 */   sw        $s0, 0x18($sp)
/* 8114 80007514 27A40020 */  addiu      $a0, $sp, 0x20
/* 8118 80007518 0C0333AC */  jal        sprintf
/* 811C 8000751C 02A02821 */   addu      $a1, $s5, $zero
/* 8120 80007520 03C02021 */  addu       $a0, $fp, $zero
/* 8124 80007524 27A50020 */  addiu      $a1, $sp, 0x20
/* 8128 80007528 24060089 */  addiu      $a2, $zero, 0x89
/* 812C 8000752C 24070019 */  addiu      $a3, $zero, 0x19
/* 8130 80007530 AFB10010 */  sw         $s1, 0x10($sp)
/* 8134 80007534 AFB10014 */  sw         $s1, 0x14($sp)
/* 8138 80007538 0C001FEB */  jal        crash_print
/* 813C 8000753C AFA00018 */   sw        $zero, 0x18($sp)
/* 8140 80007540 27A40020 */  addiu      $a0, $sp, 0x20
/* 8144 80007544 02802821 */  addu       $a1, $s4, $zero
/* 8148 80007548 02603021 */  addu       $a2, $s3, $zero
/* 814C 8000754C 02769821 */  addu       $s3, $s3, $s6
/* 8150 80007550 02603821 */  addu       $a3, $s3, $zero
/* 8154 80007554 0C0333AC */  jal        sprintf
/* 8158 80007558 AFB60010 */   sw        $s6, 0x10($sp)
/* 815C 8000755C 03C02021 */  addu       $a0, $fp, $zero
/* 8160 80007560 27A50020 */  addiu      $a1, $sp, 0x20
/* 8164 80007564 240600B3 */  addiu      $a2, $zero, 0xb3
/* 8168 80007568 24070019 */  addiu      $a3, $zero, 0x19
/* 816C 8000756C AFB00010 */  sw         $s0, 0x10($sp)
/* 8170 80007570 AFA00014 */  sw         $zero, 0x14($sp)
/* 8174 80007574 0C001FEB */  jal        crash_print
/* 8178 80007578 AFB00018 */   sw        $s0, 0x18($sp)
/* 817C 8000757C 03C02021 */  addu       $a0, $fp, $zero
/* 8180 80007580 3C05800D */  lui        $a1, %hi(D_800D7B30)
/* 8184 80007584 24A57B30 */  addiu      $a1, $a1, %lo(D_800D7B30)
/* 8188 80007588 240600F9 */  addiu      $a2, $zero, 0xf9
/* 818C 8000758C 24070019 */  addiu      $a3, $zero, 0x19
/* 8190 80007590 24100080 */  addiu      $s0, $zero, 0x80
/* 8194 80007594 AFB00010 */  sw         $s0, 0x10($sp)
/* 8198 80007598 AFB00014 */  sw         $s0, 0x14($sp)
/* 819C 8000759C 0C001FEB */  jal        crash_print
/* 81A0 800075A0 AFB00018 */   sw        $s0, 0x18($sp)
/* 81A4 800075A4 27A40020 */  addiu      $a0, $sp, 0x20
/* 81A8 800075A8 0C0333AC */  jal        sprintf
/* 81AC 800075AC 02A02821 */   addu      $a1, $s5, $zero
/* 81B0 800075B0 03C02021 */  addu       $a0, $fp, $zero
/* 81B4 800075B4 27A50020 */  addiu      $a1, $sp, 0x20
/* 81B8 800075B8 240600F9 */  addiu      $a2, $zero, 0xf9
/* 81BC 800075BC 24070019 */  addiu      $a3, $zero, 0x19
/* 81C0 800075C0 AFB10010 */  sw         $s1, 0x10($sp)
/* 81C4 800075C4 AFB10014 */  sw         $s1, 0x14($sp)
/* 81C8 800075C8 0C001FEB */  jal        crash_print
/* 81CC 800075CC AFA00018 */   sw        $zero, 0x18($sp)
/* 81D0 800075D0 27A40020 */  addiu      $a0, $sp, 0x20
/* 81D4 800075D4 02802821 */  addu       $a1, $s4, $zero
/* 81D8 800075D8 02E03021 */  addu       $a2, $s7, $zero
/* 81DC 800075DC 3C020001 */  lui        $v0, 1
/* 81E0 800075E0 2442A7F7 */  addiu      $v0, $v0, -0x5809
/* 81E4 800075E4 02E2B821 */  addu       $s7, $s7, $v0
/* 81E8 800075E8 02E03821 */  addu       $a3, $s7, $zero
/* 81EC 800075EC 0C0333AC */  jal        sprintf
/* 81F0 800075F0 AFA20010 */   sw        $v0, 0x10($sp)
/* 81F4 800075F4 03C02021 */  addu       $a0, $fp, $zero
/* 81F8 800075F8 27A50020 */  addiu      $a1, $sp, 0x20
/* 81FC 800075FC 24060123 */  addiu      $a2, $zero, 0x123
/* 8200 80007600 24070019 */  addiu      $a3, $zero, 0x19
/* 8204 80007604 AFB00010 */  sw         $s0, 0x10($sp)
/* 8208 80007608 AFB00014 */  sw         $s0, 0x14($sp)
/* 820C 8000760C 0C001FEB */  jal        crash_print
/* 8210 80007610 AFB00018 */   sw        $s0, 0x18($sp)
/* 8214 80007614 03C02021 */  addu       $a0, $fp, $zero
/* 8218 80007618 3C05800D */  lui        $a1, %hi(D_800D7B34)
/* 821C 8000761C 24A57B34 */  addiu      $a1, $a1, %lo(D_800D7B34)
/* 8220 80007620 24060019 */  addiu      $a2, $zero, 0x19
/* 8224 80007624 24070046 */  addiu      $a3, $zero, 0x46
/* 8228 80007628 AFB10010 */  sw         $s1, 0x10($sp)
/* 822C 8000762C AFB10014 */  sw         $s1, 0x14($sp)
/* 8230 80007630 0C001FEB */  jal        crash_print
/* 8234 80007634 AFA00018 */   sw        $zero, 0x18($sp)
/* 8238 80007638 00008021 */  addu       $s0, $zero, $zero
/* 823C 8000763C 00008821 */  addu       $s1, $zero, $zero
/* 8240 80007640 3C14800D */  lui        $s4, 0x800d
/* 8244 80007644 27A20120 */  addiu      $v0, $sp, 0x120
/* 8248 80007648 27B70121 */  addiu      $s7, $sp, 0x121
/* 824C 8000764C 27B60122 */  addiu      $s6, $sp, 0x122
/* 8250 80007650 8FA30128 */  lw         $v1, 0x128($sp)
/* 8254 80007654 241300C0 */  addiu      $s3, $zero, 0xc0
/* 8258 80007658 AFA20130 */  sw         $v0, 0x130($sp)
/* 825C 8000765C 24750020 */  addiu      $s5, $v1, 0x20
/* 8260 80007660 8C720104 */  lw         $s2, 0x104($v1)
/* 8264 80007664 2E02000C */  sltiu      $v0, $s0, 0xc
.L80007668:
/* 8268 80007668 10400022 */  beqz       $v0, .L800076F4
/* 826C 8000766C 00111080 */   sll       $v0, $s1, 2
/* 8270 80007670 00551021 */  addu       $v0, $v0, $s5
/* 8274 80007674 8C460000 */  lw         $a2, ($v0)
/* 8278 80007678 10D2001E */  beq        $a2, $s2, .L800076F4
/* 827C 8000767C 3C038000 */   lui       $v1, %hi(rspbootTextStart)
/* 8280 80007680 24630470 */  addiu      $v1, $v1, %lo(rspbootTextStart)
/* 8284 80007684 00C3102B */  sltu       $v0, $a2, $v1
/* 8288 80007688 1440001B */  bnez       $v0, .L800076F8
/* 828C 8000768C 26220001 */   addiu     $v0, $s1, 1
/* 8290 80007690 8FA30124 */  lw         $v1, 0x124($sp)
/* 8294 80007694 0066102B */  sltu       $v0, $v1, $a2
/* 8298 80007698 14400017 */  bnez       $v0, .L800076F8
/* 829C 8000769C 26220001 */   addiu     $v0, $s1, 1
/* 82A0 800076A0 27A40020 */  addiu      $a0, $sp, 0x20
/* 82A4 800076A4 0C0333AC */  jal        sprintf
/* 82A8 800076A8 26857AAC */   addiu     $a1, $s4, 0x7aac
/* 82AC 800076AC 03C02021 */  addu       $a0, $fp, $zero
/* 82B0 800076B0 27A50020 */  addiu      $a1, $sp, 0x20
/* 82B4 800076B4 32020003 */  andi       $v0, $s0, 3
/* 82B8 800076B8 00023080 */  sll        $a2, $v0, 2
/* 82BC 800076BC 00C23021 */  addu       $a2, $a2, $v0
/* 82C0 800076C0 00063100 */  sll        $a2, $a2, 4
/* 82C4 800076C4 24C60019 */  addiu      $a2, $a2, 0x19
/* 82C8 800076C8 00101082 */  srl        $v0, $s0, 2
/* 82CC 800076CC 000238C0 */  sll        $a3, $v0, 3
/* 82D0 800076D0 00E23821 */  addu       $a3, $a3, $v0
/* 82D4 800076D4 24E7004F */  addiu      $a3, $a3, 0x4f
/* 82D8 800076D8 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 82DC 800076DC AFA00010 */  sw         $zero, 0x10($sp)
/* 82E0 800076E0 AFB30014 */  sw         $s3, 0x14($sp)
/* 82E4 800076E4 0C001FEB */  jal        crash_print
/* 82E8 800076E8 AFB30018 */   sw        $s3, 0x18($sp)
/* 82EC 800076EC 26020001 */  addiu      $v0, $s0, 1
/* 82F0 800076F0 3050FFFF */  andi       $s0, $v0, 0xffff
.L800076F4:
/* 82F4 800076F4 26220001 */  addiu      $v0, $s1, 1
.L800076F8:
/* 82F8 800076F8 3051FFFF */  andi       $s1, $v0, 0xffff
/* 82FC 800076FC 2E230040 */  sltiu      $v1, $s1, 0x40
/* 8300 80007700 1460FFD9 */  bnez       $v1, .L80007668
/* 8304 80007704 2E02000C */   sltiu     $v0, $s0, 0xc
/* 8308 80007708 27A40020 */  addiu      $a0, $sp, 0x20
/* 830C 8000770C 26857AAC */  addiu      $a1, $s4, 0x7aac
/* 8310 80007710 0C0333AC */  jal        sprintf
/* 8314 80007714 02403021 */   addu      $a2, $s2, $zero
/* 8318 80007718 03C02021 */  addu       $a0, $fp, $zero
/* 831C 8000771C 27A50020 */  addiu      $a1, $sp, 0x20
/* 8320 80007720 32020003 */  andi       $v0, $s0, 3
/* 8324 80007724 00023080 */  sll        $a2, $v0, 2
/* 8328 80007728 00C23021 */  addu       $a2, $a2, $v0
/* 832C 8000772C 00063100 */  sll        $a2, $a2, 4
/* 8330 80007730 24C60019 */  addiu      $a2, $a2, 0x19
/* 8334 80007734 00101082 */  srl        $v0, $s0, 2
/* 8338 80007738 000238C0 */  sll        $a3, $v0, 3
/* 833C 8000773C 00E23821 */  addu       $a3, $a3, $v0
/* 8340 80007740 24E7004F */  addiu      $a3, $a3, 0x4f
/* 8344 80007744 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8348 80007748 240200C0 */  addiu      $v0, $zero, 0xc0
/* 834C 8000774C AFA00010 */  sw         $zero, 0x10($sp)
/* 8350 80007750 AFA20014 */  sw         $v0, 0x14($sp)
/* 8354 80007754 0C001FEB */  jal        crash_print
/* 8358 80007758 AFA20018 */   sw        $v0, 0x18($sp)
/* 835C 8000775C 26020001 */  addiu      $v0, $s0, 1
/* 8360 80007760 3050FFFF */  andi       $s0, $v0, 0xffff
/* 8364 80007764 00008821 */  addu       $s1, $zero, $zero
/* 8368 80007768 241200C0 */  addiu      $s2, $zero, 0xc0
/* 836C 8000776C 2E02000C */  sltiu      $v0, $s0, 0xc
.L80007770:
/* 8370 80007770 10400022 */  beqz       $v0, .L800077FC
/* 8374 80007774 8FA3012C */   lw        $v1, 0x12c($sp)
/* 8378 80007778 00111080 */  sll        $v0, $s1, 2
/* 837C 8000777C 00431021 */  addu       $v0, $v0, $v1
/* 8380 80007780 8C460000 */  lw         $a2, ($v0)
/* 8384 80007784 3C028000 */  lui        $v0, %hi(rspbootTextStart)
/* 8388 80007788 24420470 */  addiu      $v0, $v0, %lo(rspbootTextStart)
/* 838C 8000778C 00C2182B */  sltu       $v1, $a2, $v0
/* 8390 80007790 1460001B */  bnez       $v1, .L80007800
/* 8394 80007794 26220001 */   addiu     $v0, $s1, 1
/* 8398 80007798 8FA30124 */  lw         $v1, 0x124($sp)
/* 839C 8000779C 0066102B */  sltu       $v0, $v1, $a2
/* 83A0 800077A0 14400017 */  bnez       $v0, .L80007800
/* 83A4 800077A4 26220001 */   addiu     $v0, $s1, 1
/* 83A8 800077A8 27A40020 */  addiu      $a0, $sp, 0x20
/* 83AC 800077AC 0C0333AC */  jal        sprintf
/* 83B0 800077B0 26857AAC */   addiu     $a1, $s4, 0x7aac
/* 83B4 800077B4 03C02021 */  addu       $a0, $fp, $zero
/* 83B8 800077B8 27A50020 */  addiu      $a1, $sp, 0x20
/* 83BC 800077BC 32020003 */  andi       $v0, $s0, 3
/* 83C0 800077C0 00023080 */  sll        $a2, $v0, 2
/* 83C4 800077C4 00C23021 */  addu       $a2, $a2, $v0
/* 83C8 800077C8 00063100 */  sll        $a2, $a2, 4
/* 83CC 800077CC 24C60019 */  addiu      $a2, $a2, 0x19
/* 83D0 800077D0 00101082 */  srl        $v0, $s0, 2
/* 83D4 800077D4 000238C0 */  sll        $a3, $v0, 3
/* 83D8 800077D8 00E23821 */  addu       $a3, $a3, $v0
/* 83DC 800077DC 24E7004F */  addiu      $a3, $a3, 0x4f
/* 83E0 800077E0 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 83E4 800077E4 AFA00010 */  sw         $zero, 0x10($sp)
/* 83E8 800077E8 AFB20014 */  sw         $s2, 0x14($sp)
/* 83EC 800077EC 0C001FEB */  jal        crash_print
/* 83F0 800077F0 AFB20018 */   sw        $s2, 0x18($sp)
/* 83F4 800077F4 26020001 */  addiu      $v0, $s0, 1
/* 83F8 800077F8 3050FFFF */  andi       $s0, $v0, 0xffff
.L800077FC:
/* 83FC 800077FC 26220001 */  addiu      $v0, $s1, 1
.L80007800:
/* 8400 80007800 3051FFFF */  andi       $s1, $v0, 0xffff
/* 8404 80007804 2E230800 */  sltiu      $v1, $s1, 0x800
/* 8408 80007808 1460FFD9 */  bnez       $v1, .L80007770
/* 840C 8000780C 2E02000C */   sltiu     $v0, $s0, 0xc
/* 8410 80007810 24120073 */  addiu      $s2, $zero, 0x73
/* 8414 80007814 00003021 */  addu       $a2, $zero, $zero
/* 8418 80007818 3C021234 */  lui        $v0, 0x1234
/* 841C 8000781C 3C03800F */  lui        $v1, %hi(D_800E96D0)
/* 8420 80007820 8C6496D0 */  lw         $a0, %lo(D_800E96D0)($v1)
/* 8424 80007824 34425678 */  ori        $v0, $v0, 0x5678
/* 8428 80007828 8C830000 */  lw         $v1, ($a0)
/* 842C 8000782C 14620007 */  bne        $v1, $v0, .L8000784C
/* 8430 80007830 24840004 */   addiu     $a0, $a0, 4
/* 8434 80007834 3C031234 */  lui        $v1, 0x1234
/* 8438 80007838 34635678 */  ori        $v1, $v1, 0x5678
.L8000783C:
/* 843C 8000783C 24C60001 */  addiu      $a2, $a2, 1
/* 8440 80007840 8C820000 */  lw         $v0, ($a0)
/* 8444 80007844 1043FFFD */  beq        $v0, $v1, .L8000783C
/* 8448 80007848 24840004 */   addiu     $a0, $a0, 4
.L8000784C:
/* 844C 8000784C 00063080 */  sll        $a2, $a2, 2
/* 8450 80007850 10C00006 */  beqz       $a2, .L8000786C
/* 8454 80007854 27A40020 */   addiu     $a0, $sp, 0x20
/* 8458 80007858 3C05800D */  lui        $a1, %hi(D_800D7B48)
/* 845C 8000785C 0C0333AC */  jal        sprintf
/* 8460 80007860 24A57B48 */   addiu     $a1, $a1, %lo(D_800D7B48)
/* 8464 80007864 08001E1F */  j          .L8000787C
/* 8468 80007868 03C02021 */   addu      $a0, $fp, $zero
.L8000786C:
/* 846C 8000786C 3C05800D */  lui        $a1, %hi(D_800D7B64)
/* 8470 80007870 0C0333AC */  jal        sprintf
/* 8474 80007874 24A57B64 */   addiu     $a1, $a1, %lo(D_800D7B64)
/* 8478 80007878 03C02021 */  addu       $a0, $fp, $zero
.L8000787C:
/* 847C 8000787C 27A50020 */  addiu      $a1, $sp, 0x20
/* 8480 80007880 24060019 */  addiu      $a2, $zero, 0x19
/* 8484 80007884 02403821 */  addu       $a3, $s2, $zero
/* 8488 80007888 240200FF */  addiu      $v0, $zero, 0xff
/* 848C 8000788C AFA20010 */  sw         $v0, 0x10($sp)
/* 8490 80007890 AFA20014 */  sw         $v0, 0x14($sp)
/* 8494 80007894 0C001FEB */  jal        crash_print
/* 8498 80007898 AFA00018 */   sw        $zero, 0x18($sp)
/* 849C 8000789C 26420009 */  addiu      $v0, $s2, 9
/* 84A0 800078A0 3052FFFF */  andi       $s2, $v0, 0xffff
/* 84A4 800078A4 00008821 */  addu       $s1, $zero, $zero
/* 84A8 800078A8 27A40020 */  addiu      $a0, $sp, 0x20
.L800078AC:
/* 84AC 800078AC 8FA3012C */  lw         $v1, 0x12c($sp)
/* 84B0 800078B0 00111080 */  sll        $v0, $s1, 2
/* 84B4 800078B4 00431021 */  addu       $v0, $v0, $v1
/* 84B8 800078B8 8C500000 */  lw         $s0, ($v0)
/* 84BC 800078BC 26857AAC */  addiu      $a1, $s4, 0x7aac
/* 84C0 800078C0 0C0333AC */  jal        sprintf
/* 84C4 800078C4 02003021 */   addu      $a2, $s0, $zero
/* 84C8 800078C8 02002021 */  addu       $a0, $s0, $zero
/* 84CC 800078CC 02E03021 */  addu       $a2, $s7, $zero
/* 84D0 800078D0 8FA50130 */  lw         $a1, 0x130($sp)
/* 84D4 800078D4 0C001B1B */  jal        func_80006C6C
/* 84D8 800078D8 02C03821 */   addu      $a3, $s6, $zero
/* 84DC 800078DC 03C02021 */  addu       $a0, $fp, $zero
/* 84E0 800078E0 27A50020 */  addiu      $a1, $sp, 0x20
/* 84E4 800078E4 32220003 */  andi       $v0, $s1, 3
/* 84E8 800078E8 00023080 */  sll        $a2, $v0, 2
/* 84EC 800078EC 00C23021 */  addu       $a2, $a2, $v0
/* 84F0 800078F0 00063100 */  sll        $a2, $a2, 4
/* 84F4 800078F4 24C60019 */  addiu      $a2, $a2, 0x19
/* 84F8 800078F8 00111082 */  srl        $v0, $s1, 2
/* 84FC 800078FC 000238C0 */  sll        $a3, $v0, 3
/* 8500 80007900 00E23821 */  addu       $a3, $a3, $v0
/* 8504 80007904 02473821 */  addu       $a3, $s2, $a3
/* 8508 80007908 93A20120 */  lbu        $v0, 0x120($sp)
/* 850C 8000790C 93A30121 */  lbu        $v1, 0x121($sp)
/* 8510 80007910 93A80122 */  lbu        $t0, 0x122($sp)
/* 8514 80007914 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8518 80007918 AFA20010 */  sw         $v0, 0x10($sp)
/* 851C 8000791C AFA30014 */  sw         $v1, 0x14($sp)
/* 8520 80007920 0C001FEB */  jal        crash_print
/* 8524 80007924 AFA80018 */   sw        $t0, 0x18($sp)
/* 8528 80007928 26220001 */  addiu      $v0, $s1, 1
/* 852C 8000792C 3051FFFF */  andi       $s1, $v0, 0xffff
/* 8530 80007930 2E230030 */  sltiu      $v1, $s1, 0x30
/* 8534 80007934 1460FFDD */  bnez       $v1, .L800078AC
/* 8538 80007938 27A40020 */   addiu     $a0, $sp, 0x20
/* 853C 8000793C 8FBF015C */  lw         $ra, 0x15c($sp)
/* 8540 80007940 8FBE0158 */  lw         $fp, 0x158($sp)
/* 8544 80007944 8FB70154 */  lw         $s7, 0x154($sp)
/* 8548 80007948 8FB60150 */  lw         $s6, 0x150($sp)
/* 854C 8000794C 8FB5014C */  lw         $s5, 0x14c($sp)
/* 8550 80007950 8FB40148 */  lw         $s4, 0x148($sp)
/* 8554 80007954 8FB30144 */  lw         $s3, 0x144($sp)
/* 8558 80007958 8FB20140 */  lw         $s2, 0x140($sp)
/* 855C 8000795C 8FB1013C */  lw         $s1, 0x13c($sp)
/* 8560 80007960 8FB00138 */  lw         $s0, 0x138($sp)
/* 8564 80007964 03E00008 */  jr         $ra
/* 8568 80007968 27BD0160 */   addiu     $sp, $sp, 0x160

glabel crash_handler
/* 856C 8000796C 27BDFE78 */  addiu      $sp, $sp, -0x188
/* 8570 80007970 AFB50174 */  sw         $s5, 0x174($sp)
/* 8574 80007974 0080A821 */  addu       $s5, $a0, $zero
/* 8578 80007978 AFBF0184 */  sw         $ra, 0x184($sp)
/* 857C 8000797C AFBE0180 */  sw         $fp, 0x180($sp)
/* 8580 80007980 AFB7017C */  sw         $s7, 0x17c($sp)
/* 8584 80007984 AFB60178 */  sw         $s6, 0x178($sp)
/* 8588 80007988 AFB40170 */  sw         $s4, 0x170($sp)
/* 858C 8000798C AFB3016C */  sw         $s3, 0x16c($sp)
/* 8590 80007990 AFB20168 */  sw         $s2, 0x168($sp)
/* 8594 80007994 AFB10164 */  sw         $s1, 0x164($sp)
/* 8598 80007998 0C033494 */  jal        osSpTaskYield
/* 859C 8000799C AFB00160 */   sw        $s0, 0x160($sp)
/* 85A0 800079A0 27B300D0 */  addiu      $s3, $sp, 0xd0
/* 85A4 800079A4 27B00158 */  addiu      $s0, $sp, 0x158
/* 85A8 800079A8 27B20110 */  addiu      $s2, $sp, 0x110
/* 85AC 800079AC 27B10090 */  addiu      $s1, $sp, 0x90
/* 85B0 800079B0 27BE0118 */  addiu      $fp, $sp, 0x118
.L800079B4:
/* 85B4 800079B4 0C02F840 */  jal        osAfterPreNMI
/* 85B8 800079B8 00000000 */   nop
/* 85BC 800079BC 1440FFFD */  bnez       $v0, .L800079B4
/* 85C0 800079C0 3C028000 */   lui       $v0, %hi(osTvType)
/* 85C4 800079C4 8C420300 */  lw         $v0, %lo(osTvType)($v0)
/* 85C8 800079C8 24030002 */  addiu      $v1, $zero, 2
/* 85CC 800079CC 14430004 */  bne        $v0, $v1, .L800079E0
/* 85D0 800079D0 27A40010 */   addiu     $a0, $sp, 0x10
/* 85D4 800079D4 3C05800F */  lui        $a1, %hi(MPAL_ViModes)
/* 85D8 800079D8 08001E7C */  j          .L800079F0
/* 85DC 800079DC 24A547C0 */   addiu     $a1, $a1, %lo(MPAL_ViModes)
.L800079E0:
/* 85E0 800079E0 14400007 */  bnez       $v0, .L80007A00
/* 85E4 800079E4 00000000 */   nop
/* 85E8 800079E8 3C05800F */  lui        $a1, %hi(PAL_vimode)
/* 85EC 800079EC 24A54360 */  addiu      $a1, $a1, %lo(PAL_vimode)
.L800079F0:
/* 85F0 800079F0 0C033547 */  jal        memcpy
/* 85F4 800079F4 24060050 */   addiu     $a2, $zero, 0x50
/* 85F8 800079F8 08001E85 */  j          .L80007A14
/* 85FC 800079FC 240400FE */   addiu     $a0, $zero, 0xfe
.L80007A00:
/* 8600 80007A00 3C05800F */  lui        $a1, %hi(osViModeTable+0xA0)
/* 8604 80007A04 24A53F00 */  addiu      $a1, $a1, %lo(osViModeTable+0xA0)
/* 8608 80007A08 0C033547 */  jal        memcpy
/* 860C 80007A0C 24060050 */   addiu     $a2, $zero, 0x50
/* 8610 80007A10 240400FE */  addiu      $a0, $zero, 0xfe
.L80007A14:
/* 8614 80007A14 24020190 */  addiu      $v0, $zero, 0x190
/* 8618 80007A18 24030280 */  addiu      $v1, $zero, 0x280
/* 861C 80007A1C AFA20018 */  sw         $v0, 0x18($sp)
/* 8620 80007A20 24020320 */  addiu      $v0, $zero, 0x320
/* 8624 80007A24 AFA30030 */  sw         $v1, 0x30($sp)
/* 8628 80007A28 2403050A */  addiu      $v1, $zero, 0x50a
/* 862C 80007A2C AFA20038 */  sw         $v0, 0x38($sp)
/* 8630 80007A30 0C0347B4 */  jal        osCreateViManager
/* 8634 80007A34 AFA3003C */   sw        $v1, 0x3c($sp)
/* 8638 80007A38 0C0348E8 */  jal        osViSetMode
/* 863C 80007A3C 27A40010 */   addiu     $a0, $sp, 0x10
/* 8640 80007A40 0C0348FC */  jal        osViSetSpecialFeatures
/* 8644 80007A44 24040042 */   addiu     $a0, $zero, 0x42
/* 8648 80007A48 02602021 */  addu       $a0, $s3, $zero
/* 864C 80007A4C 02002821 */  addu       $a1, $s0, $zero
/* 8650 80007A50 0C02FBA4 */  jal        osCreateMesgQueue
/* 8654 80007A54 24060001 */   addiu     $a2, $zero, 1
/* 8658 80007A58 24040005 */  addiu      $a0, $zero, 5
/* 865C 80007A5C 02602821 */  addu       $a1, $s3, $zero
/* 8660 80007A60 0C033188 */  jal        osSetEventMesg
/* 8664 80007A64 24060001 */   addiu     $a2, $zero, 1
/* 8668 80007A68 0C02FB38 */  jal        osContSetCh
/* 866C 80007A6C 24040001 */   addiu     $a0, $zero, 1
/* 8670 80007A70 02602021 */  addu       $a0, $s3, $zero
/* 8674 80007A74 02402821 */  addu       $a1, $s2, $zero
/* 8678 80007A78 0C02FA74 */  jal        osContInit
/* 867C 80007A7C 02203021 */   addu      $a2, $s1, $zero
/* 8680 80007A80 02A02021 */  addu       $a0, $s5, $zero
/* 8684 80007A84 3C028010 */  lui        $v0, %hi(clear_end)
/* 8688 80007A88 2442FA50 */  addiu      $v0, $v0, %lo(clear_end)
/* 868C 80007A8C 2403FFC0 */  addiu      $v1, $zero, -0x40
/* 8690 80007A90 00431024 */  and        $v0, $v0, $v1
/* 8694 80007A94 24510040 */  addiu      $s1, $v0, 0x40
/* 8698 80007A98 0C001B4C */  jal        crash_text_2
/* 869C 80007A9C 02202821 */   addu      $a1, $s1, $zero
/* 86A0 80007AA0 0C034A50 */  jal        osWritebackDCacheAll
/* 86A4 80007AA4 0000B821 */   addu      $s7, $zero, $zero
/* 86A8 80007AA8 0C034958 */  jal        osViSwapBuffer
/* 86AC 80007AAC 02202021 */   addu      $a0, $s1, $zero
/* 86B0 80007AB0 00009021 */  addu       $s2, $zero, $zero
/* 86B4 80007AB4 24160001 */  addiu      $s6, $zero, 1
/* 86B8 80007AB8 3C14800E */  lui        $s4, 0x800e
.L80007ABC:
/* 86BC 80007ABC 0C02F9FC */  jal        osContStartReadData
/* 86C0 80007AC0 02602021 */   addu      $a0, $s3, $zero
/* 86C4 80007AC4 02602021 */  addu       $a0, $s3, $zero
.L80007AC8:
/* 86C8 80007AC8 00002821 */  addu       $a1, $zero, $zero
/* 86CC 80007ACC 0C0321E4 */  jal        osRecvMesg
/* 86D0 80007AD0 00003021 */   addu      $a2, $zero, $zero
/* 86D4 80007AD4 1440FFFC */  bnez       $v0, .L80007AC8
/* 86D8 80007AD8 02602021 */   addu      $a0, $s3, $zero
/* 86DC 80007ADC 0C02FA1E */  jal        osContGetReadData
/* 86E0 80007AE0 03C02021 */   addu      $a0, $fp, $zero
/* 86E4 80007AE4 93A2011C */  lbu        $v0, 0x11c($sp)
/* 86E8 80007AE8 30420008 */  andi       $v0, $v0, 8
/* 86EC 80007AEC 1440FFF3 */  bnez       $v0, .L80007ABC
/* 86F0 80007AF0 97B00118 */   lhu       $s0, 0x118($sp)
/* 86F4 80007AF4 02171024 */  and        $v0, $s0, $s7
/* 86F8 80007AF8 00501026 */  xor        $v0, $v0, $s0
/* 86FC 80007AFC 30428000 */  andi       $v0, $v0, 0x8000
/* 8700 80007B00 1040002A */  beqz       $v0, .L80007BAC
/* 8704 80007B04 0200B821 */   addu      $s7, $s0, $zero
/* 8708 80007B08 26420001 */  addiu      $v0, $s2, 1
/* 870C 80007B0C 305200FF */  andi       $s2, $v0, 0xff
/* 8710 80007B10 92A30104 */  lbu        $v1, 0x104($s5)
/* 8714 80007B14 24020003 */  addiu      $v0, $zero, 3
/* 8718 80007B18 00431023 */  subu       $v0, $v0, $v1
/* 871C 80007B1C 0242001A */  div        $zero, $s2, $v0
/* 8720 80007B20 00002010 */  mfhi       $a0
/* 8724 80007B24 50400001 */  beql       $v0, $zero, .L80007B2C
/* 8728 80007B28 000001CD */   break     0, 7
.L80007B2C:
/* 872C 80007B2C 309200FF */   andi      $s2, $a0, 0xff
/* 8730 80007B30 1256000F */  beq        $s2, $s6, .L80007B70
/* 8734 80007B34 2A420002 */   slti      $v0, $s2, 2
/* 8738 80007B38 50400005 */  beql       $v0, $zero, .L80007B50
/* 873C 80007B3C 24020002 */   addiu     $v0, $zero, 2
/* 8740 80007B40 12400007 */  beqz       $s2, .L80007B60
/* 8744 80007B44 02A02021 */   addu      $a0, $s5, $zero
/* 8748 80007B48 08001EEB */  j          .L80007BAC
/* 874C 80007B4C 00000000 */   nop
.L80007B50:
/* 8750 80007B50 12420010 */  beq        $s2, $v0, .L80007B94
/* 8754 80007B54 02A02021 */   addu      $a0, $s5, $zero
/* 8758 80007B58 08001EEB */  j          .L80007BAC
/* 875C 80007B5C 00000000 */   nop
.L80007B60:
/* 8760 80007B60 0C001B4C */  jal        crash_text_2
/* 8764 80007B64 02202821 */   addu      $a1, $s1, $zero
/* 8768 80007B68 08001EDF */  j          .L80007B7C
/* 876C 80007B6C 00000000 */   nop
.L80007B70:
/* 8770 80007B70 02A02021 */  addu       $a0, $s5, $zero
/* 8774 80007B74 0C001FA7 */  jal        heap_walk
/* 8778 80007B78 02202821 */   addu      $a1, $s1, $zero
.L80007B7C:
/* 877C 80007B7C 0C034A50 */  jal        osWritebackDCacheAll
/* 8780 80007B80 00000000 */   nop
/* 8784 80007B84 0C034958 */  jal        osViSwapBuffer
/* 8788 80007B88 02202021 */   addu      $a0, $s1, $zero
/* 878C 80007B8C 08001EEB */  j          .L80007BAC
/* 8790 80007B90 00000000 */   nop
.L80007B94:
/* 8794 80007B94 0C001CF6 */  jal        stack_dump
/* 8798 80007B98 02202821 */   addu      $a1, $s1, $zero
/* 879C 80007B9C 0C034A50 */  jal        osWritebackDCacheAll
/* 87A0 80007BA0 00000000 */   nop
/* 87A4 80007BA4 0C034958 */  jal        osViSwapBuffer
/* 87A8 80007BA8 02202021 */   addu      $a0, $s1, $zero
.L80007BAC:
/* 87AC 80007BAC 1656FFC3 */  bne        $s2, $s6, .L80007ABC
/* 87B0 80007BB0 32020400 */   andi      $v0, $s0, 0x400
/* 87B4 80007BB4 10400005 */  beqz       $v0, .L80007BCC
/* 87B8 80007BB8 00002821 */   addu      $a1, $zero, $zero
/* 87BC 80007BBC 8E826390 */  lw         $v0, 0x6390($s4)
/* 87C0 80007BC0 24050001 */  addiu      $a1, $zero, 1
/* 87C4 80007BC4 24420001 */  addiu      $v0, $v0, 1
/* 87C8 80007BC8 AE826390 */  sw         $v0, 0x6390($s4)
.L80007BCC:
/* 87CC 80007BCC 32020100 */  andi       $v0, $s0, 0x100
/* 87D0 80007BD0 10400004 */  beqz       $v0, .L80007BE4
/* 87D4 80007BD4 8E826390 */   lw        $v0, 0x6390($s4)
/* 87D8 80007BD8 24050001 */  addiu      $a1, $zero, 1
/* 87DC 80007BDC 24420017 */  addiu      $v0, $v0, 0x17
/* 87E0 80007BE0 AE826390 */  sw         $v0, 0x6390($s4)
.L80007BE4:
/* 87E4 80007BE4 32020800 */  andi       $v0, $s0, 0x800
/* 87E8 80007BE8 10400006 */  beqz       $v0, .L80007C04
/* 87EC 80007BEC 3C03800E */   lui       $v1, %hi(heapScroll)
/* 87F0 80007BF0 8C626390 */  lw         $v0, %lo(heapScroll)($v1)
/* 87F4 80007BF4 10400003 */  beqz       $v0, .L80007C04
/* 87F8 80007BF8 2442FFFF */   addiu     $v0, $v0, -1
/* 87FC 80007BFC AC626390 */  sw         $v0, 0x6390($v1)
/* 8800 80007C00 24050001 */  addiu      $a1, $zero, 1
.L80007C04:
/* 8804 80007C04 32020200 */  andi       $v0, $s0, 0x200
/* 8808 80007C08 10400007 */  beqz       $v0, .L80007C28
/* 880C 80007C0C 3C04800E */   lui       $a0, %hi(heapScroll)
/* 8810 80007C10 8C836390 */  lw         $v1, %lo(heapScroll)($a0)
/* 8814 80007C14 2C620017 */  sltiu      $v0, $v1, 0x17
/* 8818 80007C18 14400003 */  bnez       $v0, .L80007C28
/* 881C 80007C1C 2462FFE9 */   addiu     $v0, $v1, -0x17
/* 8820 80007C20 AC826390 */  sw         $v0, 0x6390($a0)
/* 8824 80007C24 24050001 */  addiu      $a1, $zero, 1
.L80007C28:
/* 8828 80007C28 10A0FFA4 */  beqz       $a1, .L80007ABC
/* 882C 80007C2C 02A02021 */   addu      $a0, $s5, $zero
/* 8830 80007C30 0C001FA7 */  jal        heap_walk
/* 8834 80007C34 02202821 */   addu      $a1, $s1, $zero
/* 8838 80007C38 0C034A50 */  jal        osWritebackDCacheAll
/* 883C 80007C3C 00000000 */   nop
/* 8840 80007C40 0C034958 */  jal        osViSwapBuffer
/* 8844 80007C44 02202021 */   addu      $a0, $s1, $zero
/* 8848 80007C48 08001EAF */  j          .L80007ABC
/* 884C 80007C4C 00000000 */   nop

glabel heap_error
/* 8850 80007C50 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 8854 80007C54 AFB000A0 */  sw         $s0, 0xa0($sp)
/* 8858 80007C58 00808021 */  addu       $s0, $a0, $zero
/* 885C 80007C5C 00A06021 */  addu       $t4, $a1, $zero
/* 8860 80007C60 3C02800E */  lui        $v0, %hi(heapMax)
/* 8864 80007C64 3C03800E */  lui        $v1, %hi(heapScroll)
/* 8868 80007C68 00E05021 */  addu       $t2, $a3, $zero
/* 886C 80007C6C 8C456394 */  lw         $a1, %lo(heapMax)($v0)
/* 8870 80007C70 8C646390 */  lw         $a0, %lo(heapScroll)($v1)
/* 8874 80007C74 8FAB00C0 */  lw         $t3, 0xc0($sp)
/* 8878 80007C78 8FA700C4 */  lw         $a3, 0xc4($sp)
/* 887C 80007C7C 8FA900C8 */  lw         $t1, 0xc8($sp)
/* 8880 80007C80 8FA800D0 */  lw         $t0, 0xd0($sp)
/* 8884 80007C84 AFB100A4 */  sw         $s1, 0xa4($sp)
/* 8888 80007C88 00408821 */  addu       $s1, $v0, $zero
/* 888C 80007C8C 00A4182B */  sltu       $v1, $a1, $a0
/* 8890 80007C90 1460007A */  bnez       $v1, .L80007E7C
/* 8894 80007C94 AFBF00A8 */   sw        $ra, 0xa8($sp)
/* 8898 80007C98 00A41023 */  subu       $v0, $a1, $a0
/* 889C 80007C9C 2C420017 */  sltiu      $v0, $v0, 0x17
/* 88A0 80007CA0 50400077 */  beql       $v0, $zero, .L80007E80
/* 88A4 80007CA4 8E226394 */   lw        $v0, 0x6394($s1)
/* 88A8 80007CA8 14EA0003 */  bne        $a3, $t2, .L80007CB8
/* 88AC 80007CAC 00000000 */   nop
/* 88B0 80007CB0 112B0025 */  beq        $t1, $t3, .L80007D48
/* 88B4 80007CB4 00000000 */   nop
.L80007CB8:
/* 88B8 80007CB8 448A2000 */  mtc1       $t2, $f4
/* 88BC 80007CBC 46802121 */  cvt.d.w    $f4, $f4
/* 88C0 80007CC0 3C02800D */  lui        $v0, %hi(D_800D7B84)
/* 88C4 80007CC4 05410004 */  bgez       $t2, .L80007CD8
/* 88C8 80007CC8 24457B84 */   addiu     $a1, $v0, %lo(D_800D7B84)
/* 88CC 80007CCC 3C01800D */  lui        $at, %hi(D_800D7BC8)
/* 88D0 80007CD0 D4207BC8 */  ldc1       $f0, %lo(D_800D7BC8)($at)
/* 88D4 80007CD4 46202100 */  add.d      $f4, $f4, $f0
.L80007CD8:
/* 88D8 80007CD8 44881000 */  mtc1       $t0, $f2
/* 88DC 80007CDC 468010A1 */  cvt.d.w    $f2, $f2
/* 88E0 80007CE0 05010004 */  bgez       $t0, .L80007CF4
/* 88E4 80007CE4 46202120 */   cvt.s.d   $f4, $f4
/* 88E8 80007CE8 3C01800D */  lui        $at, %hi(D_800D7BD0)
/* 88EC 80007CEC D4207BD0 */  ldc1       $f0, %lo(D_800D7BD0)($at)
/* 88F0 80007CF0 46201080 */  add.d      $f2, $f2, $f0
.L80007CF4:
/* 88F4 80007CF4 46201020 */  cvt.s.d    $f0, $f2
/* 88F8 80007CF8 3C01800D */  lui        $at, %hi(D_800D7BD8)
/* 88FC 80007CFC C4227BD8 */  lwc1       $f2, %lo(D_800D7BD8)($at)
/* 8900 80007D00 46002003 */  div.s      $f0, $f4, $f0
/* 8904 80007D04 46020002 */  mul.s      $f0, $f0, $f2
/* 8908 80007D08 27A40020 */  addiu      $a0, $sp, 0x20
/* 890C 80007D0C AFAC0018 */  sw         $t4, 0x18($sp)
/* 8910 80007D10 46000021 */  cvt.d.s    $f0, $f0
/* 8914 80007D14 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 8918 80007D18 0C0333AC */  jal        sprintf
/* 891C 80007D1C 01403821 */   addu      $a3, $t2, $zero
/* 8920 80007D20 02002021 */  addu       $a0, $s0, $zero
/* 8924 80007D24 27A50020 */  addiu      $a1, $sp, 0x20
/* 8928 80007D28 24060014 */  addiu      $a2, $zero, 0x14
/* 892C 80007D2C 3C10800E */  lui        $s0, %hi(heapPrinted)
/* 8930 80007D30 26026398 */  addiu      $v0, $s0, %lo(heapPrinted)
/* 8934 80007D34 94470002 */  lhu        $a3, 2($v0)
/* 8938 80007D38 240300FF */  addiu      $v1, $zero, 0xff
/* 893C 80007D3C AFA30010 */  sw         $v1, 0x10($sp)
/* 8940 80007D40 08001F75 */  j          .L80007DD4
/* 8944 80007D44 AFA00014 */   sw        $zero, 0x14($sp)
.L80007D48:
/* 8948 80007D48 15200026 */  bnez       $t1, .L80007DE4
/* 894C 80007D4C 3C02800D */   lui       $v0, %hi(D_800D7BB0)
/* 8950 80007D50 44872000 */  mtc1       $a3, $f4
/* 8954 80007D54 46802121 */  cvt.d.w    $f4, $f4
/* 8958 80007D58 04E10004 */  bgez       $a3, .L80007D6C
/* 895C 80007D5C 24457BB0 */   addiu     $a1, $v0, %lo(D_800D7BB0)
/* 8960 80007D60 3C01800D */  lui        $at, %hi(D_800D7BE0)
/* 8964 80007D64 D4207BE0 */  ldc1       $f0, %lo(D_800D7BE0)($at)
/* 8968 80007D68 46202100 */  add.d      $f4, $f4, $f0
.L80007D6C:
/* 896C 80007D6C 44881000 */  mtc1       $t0, $f2
/* 8970 80007D70 468010A1 */  cvt.d.w    $f2, $f2
/* 8974 80007D74 05010004 */  bgez       $t0, .L80007D88
/* 8978 80007D78 46202120 */   cvt.s.d   $f4, $f4
/* 897C 80007D7C 3C01800D */  lui        $at, %hi(D_800D7BE8)
/* 8980 80007D80 D4207BE8 */  ldc1       $f0, %lo(D_800D7BE8)($at)
/* 8984 80007D84 46201080 */  add.d      $f2, $f2, $f0
.L80007D88:
/* 8988 80007D88 46201020 */  cvt.s.d    $f0, $f2
/* 898C 80007D8C 3C01800D */  lui        $at, %hi(D_800D7BF0)
/* 8990 80007D90 C4227BF0 */  lwc1       $f2, %lo(D_800D7BF0)($at)
/* 8994 80007D94 46002003 */  div.s      $f0, $f4, $f0
/* 8998 80007D98 46020002 */  mul.s      $f0, $f0, $f2
/* 899C 80007D9C AFAC0018 */  sw         $t4, 0x18($sp)
/* 89A0 80007DA0 46000021 */  cvt.d.s    $f0, $f0
/* 89A4 80007DA4 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 89A8 80007DA8 0C0333AC */  jal        sprintf
/* 89AC 80007DAC 27A40020 */   addiu     $a0, $sp, 0x20
/* 89B0 80007DB0 02002021 */  addu       $a0, $s0, $zero
/* 89B4 80007DB4 27A50020 */  addiu      $a1, $sp, 0x20
/* 89B8 80007DB8 24060014 */  addiu      $a2, $zero, 0x14
/* 89BC 80007DBC 3C10800E */  lui        $s0, %hi(heapPrinted)
/* 89C0 80007DC0 26026398 */  addiu      $v0, $s0, %lo(heapPrinted)
/* 89C4 80007DC4 AFA00010 */  sw         $zero, 0x10($sp)
/* 89C8 80007DC8 94470002 */  lhu        $a3, 2($v0)
/* 89CC 80007DCC 240300FF */  addiu      $v1, $zero, 0xff
/* 89D0 80007DD0 AFA30014 */  sw         $v1, 0x14($sp)
.L80007DD4:
/* 89D4 80007DD4 0C001FEB */  jal        crash_print
/* 89D8 80007DD8 AFA00018 */   sw        $zero, 0x18($sp)
/* 89DC 80007DDC 08001F9D */  j          .L80007E74
/* 89E0 80007DE0 8E026398 */   lw        $v0, 0x6398($s0)
.L80007DE4:
/* 89E4 80007DE4 44871000 */  mtc1       $a3, $f2
/* 89E8 80007DE8 468010A1 */  cvt.d.w    $f2, $f2
/* 89EC 80007DEC 04E10004 */  bgez       $a3, .L80007E00
/* 89F0 80007DF0 24457BB0 */   addiu     $a1, $v0, 0x7bb0
/* 89F4 80007DF4 3C01800D */  lui        $at, %hi(D_800D7BF8)
/* 89F8 80007DF8 D4207BF8 */  ldc1       $f0, %lo(D_800D7BF8)($at)
/* 89FC 80007DFC 46201080 */  add.d      $f2, $f2, $f0
.L80007E00:
/* 8A00 80007E00 44882000 */  mtc1       $t0, $f4
/* 8A04 80007E04 46802121 */  cvt.d.w    $f4, $f4
/* 8A08 80007E08 05010004 */  bgez       $t0, .L80007E1C
/* 8A0C 80007E0C 462011A0 */   cvt.s.d   $f6, $f2
/* 8A10 80007E10 3C01800D */  lui        $at, %hi(D_800D7C00)
/* 8A14 80007E14 D4207C00 */  ldc1       $f0, %lo(D_800D7C00)($at)
/* 8A18 80007E18 46202100 */  add.d      $f4, $f4, $f0
.L80007E1C:
/* 8A1C 80007E1C 46202020 */  cvt.s.d    $f0, $f4
/* 8A20 80007E20 3C01800D */  lui        $at, %hi(D_800D7C08)
/* 8A24 80007E24 C4227C08 */  lwc1       $f2, %lo(D_800D7C08)($at)
/* 8A28 80007E28 46003003 */  div.s      $f0, $f6, $f0
/* 8A2C 80007E2C 46020002 */  mul.s      $f0, $f0, $f2
/* 8A30 80007E30 AFAC0018 */  sw         $t4, 0x18($sp)
/* 8A34 80007E34 46000021 */  cvt.d.s    $f0, $f0
/* 8A38 80007E38 F7A00010 */  sdc1       $f0, 0x10($sp)
/* 8A3C 80007E3C 0C0333AC */  jal        sprintf
/* 8A40 80007E40 27A40020 */   addiu     $a0, $sp, 0x20
/* 8A44 80007E44 02002021 */  addu       $a0, $s0, $zero
/* 8A48 80007E48 27A50020 */  addiu      $a1, $sp, 0x20
/* 8A4C 80007E4C 24060014 */  addiu      $a2, $zero, 0x14
/* 8A50 80007E50 3C10800E */  lui        $s0, %hi(heapPrinted)
/* 8A54 80007E54 26026398 */  addiu      $v0, $s0, %lo(heapPrinted)
/* 8A58 80007E58 94470002 */  lhu        $a3, 2($v0)
/* 8A5C 80007E5C 240300FF */  addiu      $v1, $zero, 0xff
/* 8A60 80007E60 AFA30010 */  sw         $v1, 0x10($sp)
/* 8A64 80007E64 AFA30014 */  sw         $v1, 0x14($sp)
/* 8A68 80007E68 0C001FEB */  jal        crash_print
/* 8A6C 80007E6C AFA00018 */   sw        $zero, 0x18($sp)
/* 8A70 80007E70 8E026398 */  lw         $v0, 0x6398($s0)
.L80007E74:
/* 8A74 80007E74 2442000A */  addiu      $v0, $v0, 0xa
/* 8A78 80007E78 AE026398 */  sw         $v0, 0x6398($s0)
.L80007E7C:
/* 8A7C 80007E7C 8E226394 */  lw         $v0, 0x6394($s1)
.L80007E80:
/* 8A80 80007E80 8FBF00A8 */  lw         $ra, 0xa8($sp)
/* 8A84 80007E84 8FB000A0 */  lw         $s0, 0xa0($sp)
/* 8A88 80007E88 24420001 */  addiu      $v0, $v0, 1
/* 8A8C 80007E8C AE226394 */  sw         $v0, 0x6394($s1)
/* 8A90 80007E90 8FB100A4 */  lw         $s1, 0xa4($sp)
/* 8A94 80007E94 03E00008 */  jr         $ra
/* 8A98 80007E98 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel heap_walk
/* 8A9C 80007E9C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8AA0 80007EA0 AFB20028 */  sw         $s2, 0x28($sp)
/* 8AA4 80007EA4 00A09021 */  addu       $s2, $a1, $zero
/* 8AA8 80007EA8 02402021 */  addu       $a0, $s2, $zero
/* 8AAC 80007EAC 24050843 */  addiu      $a1, $zero, 0x843
/* 8AB0 80007EB0 AFBF002C */  sw         $ra, 0x2c($sp)
/* 8AB4 80007EB4 AFB10024 */  sw         $s1, 0x24($sp)
/* 8AB8 80007EB8 0C001994 */  jal        func_80006650
/* 8ABC 80007EBC AFB00020 */   sw        $s0, 0x20($sp)
/* 8AC0 80007EC0 3C02800E */  lui        $v0, %hi(RamSize)
/* 8AC4 80007EC4 8C4466AC */  lw         $a0, %lo(RamSize)($v0)
/* 8AC8 80007EC8 3C030040 */  lui        $v1, 0x40
/* 8ACC 80007ECC 0064182B */  sltu       $v1, $v1, $a0
/* 8AD0 80007ED0 10600027 */  beqz       $v1, .L80007F70
/* 8AD4 80007ED4 02402021 */   addu      $a0, $s2, $zero
/* 8AD8 80007ED8 3C05800D */  lui        $a1, %hi(D_800D7C0C)
/* 8ADC 80007EDC 24A57C0C */  addiu      $a1, $a1, %lo(D_800D7C0C)
/* 8AE0 80007EE0 24060014 */  addiu      $a2, $zero, 0x14
/* 8AE4 80007EE4 24070014 */  addiu      $a3, $zero, 0x14
/* 8AE8 80007EE8 241100FF */  addiu      $s1, $zero, 0xff
/* 8AEC 80007EEC AFA00010 */  sw         $zero, 0x10($sp)
/* 8AF0 80007EF0 AFB10014 */  sw         $s1, 0x14($sp)
/* 8AF4 80007EF4 0C001FEB */  jal        crash_print
/* 8AF8 80007EF8 AFB10018 */   sw        $s1, 0x18($sp)
/* 8AFC 80007EFC 02402021 */  addu       $a0, $s2, $zero
/* 8B00 80007F00 3C10800D */  lui        $s0, %hi(D_800D7C18)
/* 8B04 80007F04 26107C18 */  addiu      $s0, $s0, %lo(D_800D7C18)
/* 8B08 80007F08 02002821 */  addu       $a1, $s0, $zero
/* 8B0C 80007F0C 24060014 */  addiu      $a2, $zero, 0x14
/* 8B10 80007F10 2407001E */  addiu      $a3, $zero, 0x1e
/* 8B14 80007F14 AFA00010 */  sw         $zero, 0x10($sp)
/* 8B18 80007F18 AFB10014 */  sw         $s1, 0x14($sp)
/* 8B1C 80007F1C 0C001FEB */  jal        crash_print
/* 8B20 80007F20 AFB10018 */   sw        $s1, 0x18($sp)
/* 8B24 80007F24 3C048000 */  lui        $a0, %hi(heap_error)
/* 8B28 80007F28 24847C50 */  addiu      $a0, $a0, %lo(heap_error)
/* 8B2C 80007F2C 02402821 */  addu       $a1, $s2, $zero
/* 8B30 80007F30 3C02800E */  lui        $v0, %hi(heapMax)
/* 8B34 80007F34 3C03800E */  lui        $v1, %hi(heapPrinted)
/* 8B38 80007F38 AC406394 */  sw         $zero, %lo(heapMax)($v0)
/* 8B3C 80007F3C 24020028 */  addiu      $v0, $zero, 0x28
/* 8B40 80007F40 0C0260C1 */  jal        print_mem_allocated
/* 8B44 80007F44 AC626398 */   sw        $v0, %lo(heapPrinted)($v1)
/* 8B48 80007F48 02402021 */  addu       $a0, $s2, $zero
/* 8B4C 80007F4C 02002821 */  addu       $a1, $s0, $zero
/* 8B50 80007F50 24060014 */  addiu      $a2, $zero, 0x14
/* 8B54 80007F54 2407010E */  addiu      $a3, $zero, 0x10e
/* 8B58 80007F58 AFA00010 */  sw         $zero, 0x10($sp)
/* 8B5C 80007F5C AFB10014 */  sw         $s1, 0x14($sp)
/* 8B60 80007F60 0C001FEB */  jal        crash_print
/* 8B64 80007F64 AFB10018 */   sw        $s1, 0x18($sp)
/* 8B68 80007F68 08001FE6 */  j          .L80007F98
/* 8B6C 80007F6C 8FBF002C */   lw        $ra, 0x2c($sp)
.L80007F70:
/* 8B70 80007F70 3C05800D */  lui        $a1, %hi(D_800D7C3C)
/* 8B74 80007F74 24A57C3C */  addiu      $a1, $a1, %lo(D_800D7C3C)
/* 8B78 80007F78 24060014 */  addiu      $a2, $zero, 0x14
/* 8B7C 80007F7C 24070064 */  addiu      $a3, $zero, 0x64
/* 8B80 80007F80 240200FF */  addiu      $v0, $zero, 0xff
/* 8B84 80007F84 AFA20010 */  sw         $v0, 0x10($sp)
/* 8B88 80007F88 AFA00014 */  sw         $zero, 0x14($sp)
/* 8B8C 80007F8C 0C001FEB */  jal        crash_print
/* 8B90 80007F90 AFA00018 */   sw        $zero, 0x18($sp)
/* 8B94 80007F94 8FBF002C */  lw         $ra, 0x2c($sp)
.L80007F98:
/* 8B98 80007F98 8FB20028 */  lw         $s2, 0x28($sp)
/* 8B9C 80007F9C 8FB10024 */  lw         $s1, 0x24($sp)
/* 8BA0 80007FA0 8FB00020 */  lw         $s0, 0x20($sp)
/* 8BA4 80007FA4 03E00008 */  jr         $ra
/* 8BA8 80007FA8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel crash_print
/* 8BAC 80007FAC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8BB0 80007FB0 AFB00000 */  sw         $s0, ($sp)
/* 8BB4 80007FB4 00808021 */  addu       $s0, $a0, $zero
/* 8BB8 80007FB8 AFB40010 */  sw         $s4, 0x10($sp)
/* 8BBC 80007FBC 00A0A021 */  addu       $s4, $a1, $zero
/* 8BC0 80007FC0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8BC4 80007FC4 00C05021 */  addu       $t2, $a2, $zero
/* 8BC8 80007FC8 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8BCC 80007FCC 24050001 */  addiu      $a1, $zero, 1
/* 8BD0 80007FD0 93A4002B */  lbu        $a0, 0x2b($sp)
/* 8BD4 80007FD4 93A3002F */  lbu        $v1, 0x2f($sp)
/* 8BD8 80007FD8 93A20033 */  lbu        $v0, 0x33($sp)
/* 8BDC 80007FDC 00005821 */  addu       $t3, $zero, $zero
/* 8BE0 80007FE0 AFB3000C */  sw         $s3, 0xc($sp)
/* 8BE4 80007FE4 2413000A */  addiu      $s3, $zero, 0xa
/* 8BE8 80007FE8 AFB20008 */  sw         $s2, 8($sp)
/* 8BEC 80007FEC 3C12800E */  lui        $s2, 0x800e
/* 8BF0 80007FF0 AFB10004 */  sw         $s1, 4($sp)
/* 8BF4 80007FF4 00042200 */  sll        $a0, $a0, 8
/* 8BF8 80007FF8 3084F800 */  andi       $a0, $a0, 0xf800
/* 8BFC 80007FFC 000318C0 */  sll        $v1, $v1, 3
/* 8C00 80008000 306307C0 */  andi       $v1, $v1, 0x7c0
/* 8C04 80008004 00832025 */  or         $a0, $a0, $v1
/* 8C08 80008008 00021082 */  srl        $v0, $v0, 2
/* 8C0C 8000800C 3042003E */  andi       $v0, $v0, 0x3e
/* 8C10 80008010 00448825 */  or         $s1, $v0, $a0
/* 8C14 80008014 028B1021 */  addu       $v0, $s4, $t3
.L80008018:
/* 8C18 80008018 80430000 */  lb         $v1, ($v0)
/* 8C1C 8000801C 14730005 */  bne        $v1, $s3, .L80008034
/* 8C20 80008020 24E2000A */   addiu     $v0, $a3, 0xa
/* 8C24 80008024 3047FFFF */  andi       $a3, $v0, 0xffff
/* 8C28 80008028 00C05021 */  addu       $t2, $a2, $zero
/* 8C2C 8000802C 0800203E */  j          .L800080F8
/* 8C30 80008030 256B0001 */   addiu     $t3, $t3, 1
.L80008034:
/* 8C34 80008034 1060002F */  beqz       $v1, .L800080F4
/* 8C38 80008038 2D420172 */   sltiu     $v0, $t2, 0x172
/* 8C3C 8000803C 14400004 */  bnez       $v0, .L80008050
/* 8C40 80008040 2463FFE0 */   addiu     $v1, $v1, -0x20
/* 8C44 80008044 24E2000A */  addiu      $v0, $a3, 0xa
/* 8C48 80008048 3047FFFF */  andi       $a3, $v0, 0xffff
/* 8C4C 8000804C 00C05021 */  addu       $t2, $a2, $zero
.L80008050:
/* 8C50 80008050 00031E00 */  sll        $v1, $v1, 0x18
/* 8C54 80008054 00031D43 */  sra        $v1, $v1, 0x15
/* 8C58 80008058 00071040 */  sll        $v0, $a3, 1
/* 8C5C 8000805C 00471021 */  addu       $v0, $v0, $a3
/* 8C60 80008060 000210C0 */  sll        $v0, $v0, 3
/* 8C64 80008064 00471021 */  addu       $v0, $v0, $a3
/* 8C68 80008068 00021100 */  sll        $v0, $v0, 4
/* 8C6C 8000806C 004A4821 */  addu       $t1, $v0, $t2
/* 8C70 80008070 00004021 */  addu       $t0, $zero, $zero
/* 8C74 80008074 256F0001 */  addiu      $t7, $t3, 1
/* 8C78 80008078 254E0008 */  addiu      $t6, $t2, 8
/* 8C7C 8000807C 265963A0 */  addiu      $t9, $s2, 0x63a0
/* 8C80 80008080 24180008 */  addiu      $t8, $zero, 8
/* 8C84 80008084 362D0001 */  ori        $t5, $s1, 1
.L80008088:
/* 8C88 80008088 00002021 */  addu       $a0, $zero, $zero
/* 8C8C 8000808C 252C0190 */  addiu      $t4, $t1, 0x190
/* 8C90 80008090 246A0001 */  addiu      $t2, $v1, 1
/* 8C94 80008094 250B0001 */  addiu      $t3, $t0, 1
/* 8C98 80008098 00794021 */  addu       $t0, $v1, $t9
/* 8C9C 8000809C 91020000 */  lbu        $v0, ($t0)
.L800080A0:
/* 8CA0 800080A0 03041823 */  subu       $v1, $t8, $a0
/* 8CA4 800080A4 00621007 */  srav       $v0, $v0, $v1
/* 8CA8 800080A8 30420001 */  andi       $v0, $v0, 1
/* 8CAC 800080AC 10400004 */  beqz       $v0, .L800080C0
/* 8CB0 800080B0 01241021 */   addu      $v0, $t1, $a0
/* 8CB4 800080B4 00021040 */  sll        $v0, $v0, 1
/* 8CB8 800080B8 00501021 */  addu       $v0, $v0, $s0
/* 8CBC 800080BC A44D0000 */  sh         $t5, ($v0)
.L800080C0:
/* 8CC0 800080C0 24820001 */  addiu      $v0, $a0, 1
/* 8CC4 800080C4 304400FF */  andi       $a0, $v0, 0xff
/* 8CC8 800080C8 2C830008 */  sltiu      $v1, $a0, 8
/* 8CCC 800080CC 5460FFF4 */  bnel       $v1, $zero, .L800080A0
/* 8CD0 800080D0 91020000 */   lbu       $v0, ($t0)
/* 8CD4 800080D4 01804821 */  addu       $t1, $t4, $zero
/* 8CD8 800080D8 316800FF */  andi       $t0, $t3, 0xff
/* 8CDC 800080DC 2D020008 */  sltiu      $v0, $t0, 8
/* 8CE0 800080E0 1440FFE9 */  bnez       $v0, .L80008088
/* 8CE4 800080E4 01401821 */   addu      $v1, $t2, $zero
/* 8CE8 800080E8 31CAFFFF */  andi       $t2, $t6, 0xffff
/* 8CEC 800080EC 0800203E */  j          .L800080F8
/* 8CF0 800080F0 01E05821 */   addu      $t3, $t7, $zero
.L800080F4:
/* 8CF4 800080F4 00002821 */  addu       $a1, $zero, $zero
.L800080F8:
/* 8CF8 800080F8 14A0FFC7 */  bnez       $a1, .L80008018
/* 8CFC 800080FC 028B1021 */   addu      $v0, $s4, $t3
/* 8D00 80008100 8FB40010 */  lw         $s4, 0x10($sp)
/* 8D04 80008104 8FB3000C */  lw         $s3, 0xc($sp)
/* 8D08 80008108 8FB20008 */  lw         $s2, 8($sp)
/* 8D0C 8000810C 8FB10004 */  lw         $s1, 4($sp)
/* 8D10 80008110 8FB00000 */  lw         $s0, ($sp)
/* 8D14 80008114 03E00008 */  jr         $ra
/* 8D18 80008118 27BD0018 */   addiu     $sp, $sp, 0x18
/* 8D1C 8000811C 00000000 */  nop
