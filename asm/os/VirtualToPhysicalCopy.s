.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osContRamRead
/* C33B0 800C27B0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* C33B4 800C27B4 AFB40038 */  sw         $s4, 0x38($sp)
/* C33B8 800C27B8 0080A021 */  addu       $s4, $a0, $zero
/* C33BC 800C27BC AFB30034 */  sw         $s3, 0x34($sp)
/* C33C0 800C27C0 00A09821 */  addu       $s3, $a1, $zero
/* C33C4 800C27C4 AFB5003C */  sw         $s5, 0x3c($sp)
/* C33C8 800C27C8 24150002 */  addiu      $s5, $zero, 2
/* C33CC 800C27CC AFB00028 */  sw         $s0, 0x28($sp)
/* C33D0 800C27D0 00C08021 */  addu       $s0, $a2, $zero
/* C33D4 800C27D4 AFBF004C */  sw         $ra, 0x4c($sp)
/* C33D8 800C27D8 AFBE0048 */  sw         $fp, 0x48($sp)
/* C33DC 800C27DC AFB70044 */  sw         $s7, 0x44($sp)
/* C33E0 800C27E0 AFB60040 */  sw         $s6, 0x40($sp)
/* C33E4 800C27E4 AFB20030 */  sw         $s2, 0x30($sp)
/* C33E8 800C27E8 AFB1002C */  sw         $s1, 0x2c($sp)
/* C33EC 800C27EC 0C033265 */  jal        __osSiGetAccess
/* C33F0 800C27F0 AFA70014 */   sw        $a3, 0x14($sp)
/* C33F4 800C27F4 24170002 */  addiu      $s7, $zero, 2
/* C33F8 800C27F8 3216FFFF */  andi       $s6, $s0, 0xffff
/* C33FC 800C27FC 00108140 */  sll        $s0, $s0, 5
/* C3400 800C2800 3C1E800F */  lui        $fp, %hi(__osPfsPifRam)
/* C3404 800C2804 27DE7C30 */  addiu      $fp, $fp, %lo(__osPfsPifRam)
/* C3408 800C2808 AFB0001C */  sw         $s0, 0x1c($sp)
.L800C280C:
/* C340C 800C280C 3C02800F */  lui        $v0, %hi(__osContLastCmd)
/* C3410 800C2810 904257A0 */  lbu        $v0, %lo(__osContLastCmd)($v0)
/* C3414 800C2814 3C10800F */  lui        $s0, %hi(__osPfsPifRam)
/* C3418 800C2818 14570005 */  bne        $v0, $s7, .L800C2830
/* C341C 800C281C 26107C30 */   addiu     $s0, $s0, %lo(__osPfsPifRam)
/* C3420 800C2820 3C02800F */  lui        $v0, %hi(contramread_data_0000)
/* C3424 800C2824 8C423820 */  lw         $v0, %lo(contramread_data_0000)($v0)
/* C3428 800C2828 50530019 */  beql       $v0, $s3, .L800C2890
/* C342C 800C282C 02708021 */   addu      $s0, $s3, $s0
.L800C2830:
/* C3430 800C2830 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* C3434 800C2834 A03757A0 */  sb         $s7, %lo(__osContLastCmd)($at)
/* C3438 800C2838 3C01800F */  lui        $at, %hi(contramread_data_0000)
/* C343C 800C283C AC333820 */  sw         $s3, %lo(contramread_data_0000)($at)
/* C3440 800C2840 1A600006 */  blez       $s3, .L800C285C
/* C3444 800C2844 00001821 */   addu      $v1, $zero, $zero
.L800C2848:
/* C3448 800C2848 A2000000 */  sb         $zero, ($s0)
/* C344C 800C284C 24630001 */  addiu      $v1, $v1, 1
/* C3450 800C2850 0073102A */  slt        $v0, $v1, $s3
/* C3454 800C2854 1440FFFC */  bnez       $v0, .L800C2848
/* C3458 800C2858 26100001 */   addiu     $s0, $s0, 1
.L800C285C:
/* C345C 800C285C 24020001 */  addiu      $v0, $zero, 1
/* C3460 800C2860 3C01800F */  lui        $at, %hi(__osPfsPifRam+0x3C)
/* C3464 800C2864 AC227C6C */  sw         $v0, %lo(__osPfsPifRam+0x3C)($at)
/* C3468 800C2868 240800FF */  addiu      $t0, $zero, 0xff
/* C346C 800C286C 24020003 */  addiu      $v0, $zero, 3
/* C3470 800C2870 A2020001 */  sb         $v0, 1($s0)
/* C3474 800C2874 24020021 */  addiu      $v0, $zero, 0x21
/* C3478 800C2878 A2080000 */  sb         $t0, ($s0)
/* C347C 800C287C A2020002 */  sb         $v0, 2($s0)
/* C3480 800C2880 240200FE */  addiu      $v0, $zero, 0xfe
/* C3484 800C2884 A2170003 */  sb         $s7, 3($s0)
/* C3488 800C2888 A2080026 */  sb         $t0, 0x26($s0)
/* C348C 800C288C A2020027 */  sb         $v0, 0x27($s0)
.L800C2890:
/* C3490 800C2890 02C02021 */  addu       $a0, $s6, $zero
/* C3494 800C2894 001610C2 */  srl        $v0, $s6, 3
/* C3498 800C2898 0C030BB4 */  jal        __osContAddressCrc
/* C349C 800C289C A2020004 */   sb        $v0, 4($s0)
/* C34A0 800C28A0 8FA8001C */  lw         $t0, 0x1c($sp)
/* C34A4 800C28A4 24040001 */  addiu      $a0, $zero, 1
/* C34A8 800C28A8 03C02821 */  addu       $a1, $fp, $zero
/* C34AC 800C28AC 00481025 */  or         $v0, $v0, $t0
/* C34B0 800C28B0 0C0332F4 */  jal        __osSiRawStartDma
/* C34B4 800C28B4 A2020005 */   sb        $v0, 5($s0)
/* C34B8 800C28B8 02802021 */  addu       $a0, $s4, $zero
/* C34BC 800C28BC 00002821 */  addu       $a1, $zero, $zero
/* C34C0 800C28C0 0C0321E4 */  jal        osRecvMesg
/* C34C4 800C28C4 24060001 */   addiu     $a2, $zero, 1
/* C34C8 800C28C8 00002021 */  addu       $a0, $zero, $zero
/* C34CC 800C28CC 0C0332F4 */  jal        __osSiRawStartDma
/* C34D0 800C28D0 03C02821 */   addu      $a1, $fp, $zero
/* C34D4 800C28D4 02802021 */  addu       $a0, $s4, $zero
/* C34D8 800C28D8 00002821 */  addu       $a1, $zero, $zero
/* C34DC 800C28DC 0C0321E4 */  jal        osRecvMesg
/* C34E0 800C28E0 24060001 */   addiu     $a2, $zero, 1
/* C34E4 800C28E4 92020002 */  lbu        $v0, 2($s0)
/* C34E8 800C28E8 304200C0 */  andi       $v0, $v0, 0xc0
/* C34EC 800C28EC 00028902 */  srl        $s1, $v0, 4
/* C34F0 800C28F0 56200015 */  bnel       $s1, $zero, .L800C2948
/* C34F4 800C28F4 24110001 */   addiu     $s1, $zero, 1
/* C34F8 800C28F8 26120006 */  addiu      $s2, $s0, 6
/* C34FC 800C28FC 0C030BCF */  jal        __osContDataCrc
/* C3500 800C2900 02402021 */   addu      $a0, $s2, $zero
/* C3504 800C2904 92030026 */  lbu        $v1, 0x26($s0)
/* C3508 800C2908 304200FF */  andi       $v0, $v0, 0xff
/* C350C 800C290C 10430008 */  beq        $v0, $v1, .L800C2930
/* C3510 800C2910 02802021 */   addu      $a0, $s4, $zero
/* C3514 800C2914 0C031878 */  jal        __osPfsGetStatus
/* C3518 800C2918 02602821 */   addu      $a1, $s3, $zero
/* C351C 800C291C 00408821 */  addu       $s1, $v0, $zero
/* C3520 800C2920 1620000E */  bnez       $s1, .L800C295C
/* C3524 800C2924 00000000 */   nop
/* C3528 800C2928 08030A52 */  j          .L800C2948
/* C352C 800C292C 24110004 */   addiu     $s1, $zero, 4
.L800C2930:
/* C3530 800C2930 8FA50014 */  lw         $a1, 0x14($sp)
/* C3534 800C2934 02402021 */  addu       $a0, $s2, $zero
/* C3538 800C2938 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C353C 800C293C 24060020 */   addiu     $a2, $zero, 0x20
/* C3540 800C2940 08030A53 */  j          .L800C294C
/* C3544 800C2944 24020004 */   addiu     $v0, $zero, 4
.L800C2948:
/* C3548 800C2948 24020004 */  addiu      $v0, $zero, 4
.L800C294C:
/* C354C 800C294C 16220003 */  bne        $s1, $v0, .L800C295C
/* C3550 800C2950 02A01021 */   addu      $v0, $s5, $zero
/* C3554 800C2954 0441FFAD */  bgez       $v0, .L800C280C
/* C3558 800C2958 26B5FFFF */   addiu     $s5, $s5, -1
.L800C295C:
/* C355C 800C295C 0C033280 */  jal        _osSiRelAccess
/* C3560 800C2960 00000000 */   nop
/* C3564 800C2964 02201021 */  addu       $v0, $s1, $zero
/* C3568 800C2968 8FBF004C */  lw         $ra, 0x4c($sp)
/* C356C 800C296C 8FBE0048 */  lw         $fp, 0x48($sp)
/* C3570 800C2970 8FB70044 */  lw         $s7, 0x44($sp)
/* C3574 800C2974 8FB60040 */  lw         $s6, 0x40($sp)
/* C3578 800C2978 8FB5003C */  lw         $s5, 0x3c($sp)
/* C357C 800C297C 8FB40038 */  lw         $s4, 0x38($sp)
/* C3580 800C2980 8FB30034 */  lw         $s3, 0x34($sp)
/* C3584 800C2984 8FB20030 */  lw         $s2, 0x30($sp)
/* C3588 800C2988 8FB1002C */  lw         $s1, 0x2c($sp)
/* C358C 800C298C 8FB00028 */  lw         $s0, 0x28($sp)
/* C3590 800C2990 03E00008 */  jr         $ra
/* C3594 800C2994 27BD0050 */   addiu     $sp, $sp, 0x50
/* C3598 800C2998 00000000 */  nop
/* C359C 800C299C 00000000 */  nop
