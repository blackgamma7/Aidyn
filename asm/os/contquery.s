.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osContStartQuery
/* BF350 800BE750 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BF354 800BE754 AFB00010 */  sw         $s0, 0x10($sp)
/* BF358 800BE758 AFBF0014 */  sw         $ra, 0x14($sp)
/* BF35C 800BE75C 0C033265 */  jal        __osSiGetAccess
/* BF360 800BE760 00808021 */   addu      $s0, $a0, $zero
/* BF364 800BE764 3C02800F */  lui        $v0, %hi(__osContLastCmd)
/* BF368 800BE768 904257A0 */  lbu        $v0, %lo(__osContLastCmd)($v0)
/* BF36C 800BE76C 1040000B */  beqz       $v0, .L800BE79C
/* BF370 800BE770 00000000 */   nop
/* BF374 800BE774 0C02FB08 */  jal        __osPackRequestData
/* BF378 800BE778 00002021 */   addu      $a0, $zero, $zero
/* BF37C 800BE77C 3C05800F */  lui        $a1, %hi(__osContPifRam)
/* BF380 800BE780 24A55760 */  addiu      $a1, $a1, %lo(__osContPifRam)
/* BF384 800BE784 0C0332F4 */  jal        __osSiRawStartDma
/* BF388 800BE788 24040001 */   addiu     $a0, $zero, 1
/* BF38C 800BE78C 02002021 */  addu       $a0, $s0, $zero
/* BF390 800BE790 00002821 */  addu       $a1, $zero, $zero
/* BF394 800BE794 0C0321E4 */  jal        osRecvMesg
/* BF398 800BE798 24060001 */   addiu     $a2, $zero, 1
.L800BE79C:
/* BF39C 800BE79C 3C05800F */  lui        $a1, %hi(__osContPifRam)
/* BF3A0 800BE7A0 24A55760 */  addiu      $a1, $a1, %lo(__osContPifRam)
/* BF3A4 800BE7A4 0C0332F4 */  jal        __osSiRawStartDma
/* BF3A8 800BE7A8 00002021 */   addu      $a0, $zero, $zero
/* BF3AC 800BE7AC 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* BF3B0 800BE7B0 A02057A0 */  sb         $zero, %lo(__osContLastCmd)($at)
/* BF3B4 800BE7B4 0C033280 */  jal        _osSiRelAccess
/* BF3B8 800BE7B8 00408021 */   addu      $s0, $v0, $zero
/* BF3BC 800BE7BC 02001021 */  addu       $v0, $s0, $zero
/* BF3C0 800BE7C0 8FBF0014 */  lw         $ra, 0x14($sp)
/* BF3C4 800BE7C4 8FB00010 */  lw         $s0, 0x10($sp)
/* BF3C8 800BE7C8 03E00008 */  jr         $ra
/* BF3CC 800BE7CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel osContGetQuery
/* BF3D0 800BE7D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BF3D4 800BE7D4 AFBF0018 */  sw         $ra, 0x18($sp)
/* BF3D8 800BE7D8 00802821 */  addu       $a1, $a0, $zero
/* BF3DC 800BE7DC 0C02FADB */  jal        __osContGetInitData
/* BF3E0 800BE7E0 27A40010 */   addiu     $a0, $sp, 0x10
/* BF3E4 800BE7E4 8FBF0018 */  lw         $ra, 0x18($sp)
/* BF3E8 800BE7E8 03E00008 */  jr         $ra
/* BF3EC 800BE7EC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel osContStartReadData
/* BF3F0 800BE7F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BF3F4 800BE7F4 AFB00010 */  sw         $s0, 0x10($sp)
/* BF3F8 800BE7F8 AFBF0014 */  sw         $ra, 0x14($sp)
/* BF3FC 800BE7FC 0C033265 */  jal        __osSiGetAccess
/* BF400 800BE800 00808021 */   addu      $s0, $a0, $zero
/* BF404 800BE804 3C03800F */  lui        $v1, %hi(__osContLastCmd)
/* BF408 800BE808 906357A0 */  lbu        $v1, %lo(__osContLastCmd)($v1)
/* BF40C 800BE80C 24020001 */  addiu      $v0, $zero, 1
/* BF410 800BE810 1062000B */  beq        $v1, $v0, .L800BE840
/* BF414 800BE814 00000000 */   nop
/* BF418 800BE818 0C02FA45 */  jal        __osPackReadData
/* BF41C 800BE81C 00000000 */   nop
/* BF420 800BE820 3C05800F */  lui        $a1, %hi(__osContPifRam)
/* BF424 800BE824 24A55760 */  addiu      $a1, $a1, %lo(__osContPifRam)
/* BF428 800BE828 0C0332F4 */  jal        __osSiRawStartDma
/* BF42C 800BE82C 24040001 */   addiu     $a0, $zero, 1
/* BF430 800BE830 02002021 */  addu       $a0, $s0, $zero
/* BF434 800BE834 00002821 */  addu       $a1, $zero, $zero
/* BF438 800BE838 0C0321E4 */  jal        osRecvMesg
/* BF43C 800BE83C 24060001 */   addiu     $a2, $zero, 1
.L800BE840:
/* BF440 800BE840 3C05800F */  lui        $a1, %hi(__osContPifRam)
/* BF444 800BE844 24A55760 */  addiu      $a1, $a1, %lo(__osContPifRam)
/* BF448 800BE848 0C0332F4 */  jal        __osSiRawStartDma
/* BF44C 800BE84C 00002021 */   addu      $a0, $zero, $zero
/* BF450 800BE850 24030001 */  addiu      $v1, $zero, 1
/* BF454 800BE854 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* BF458 800BE858 A02357A0 */  sb         $v1, %lo(__osContLastCmd)($at)
/* BF45C 800BE85C 0C033280 */  jal        _osSiRelAccess
/* BF460 800BE860 00408021 */   addu      $s0, $v0, $zero
/* BF464 800BE864 02001021 */  addu       $v0, $s0, $zero
/* BF468 800BE868 8FBF0014 */  lw         $ra, 0x14($sp)
/* BF46C 800BE86C 8FB00010 */  lw         $s0, 0x10($sp)
/* BF470 800BE870 03E00008 */  jr         $ra
/* BF474 800BE874 27BD0018 */   addiu     $sp, $sp, 0x18

glabel osContGetReadData
/* BF478 800BE878 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* BF47C 800BE87C 00804821 */  addu       $t1, $a0, $zero
/* BF480 800BE880 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF484 800BE884 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF488 800BE888 3C08800F */  lui        $t0, %hi(__osContPifRam)
/* BF48C 800BE88C 25085760 */  addiu      $t0, $t0, %lo(__osContPifRam)
/* BF490 800BE890 1840001D */  blez       $v0, .L800BE908
/* BF494 800BE894 00003821 */   addu      $a3, $zero, $zero
/* BF498 800BE898 24860003 */  addiu      $a2, $a0, 3
.L800BE89C:
/* BF49C 800BE89C 89020000 */  lwl        $v0, ($t0)
/* BF4A0 800BE8A0 99020003 */  lwr        $v0, 3($t0)
/* BF4A4 800BE8A4 89030004 */  lwl        $v1, 4($t0)
/* BF4A8 800BE8A8 99030007 */  lwr        $v1, 7($t0)
/* BF4AC 800BE8AC ABA20000 */  swl        $v0, ($sp)
/* BF4B0 800BE8B0 BBA20003 */  swr        $v0, 3($sp)
/* BF4B4 800BE8B4 ABA30004 */  swl        $v1, 4($sp)
/* BF4B8 800BE8B8 BBA30007 */  swr        $v1, 7($sp)
/* BF4BC 800BE8BC 93A20002 */  lbu        $v0, 2($sp)
/* BF4C0 800BE8C0 304200C0 */  andi       $v0, $v0, 0xc0
/* BF4C4 800BE8C4 00021102 */  srl        $v0, $v0, 4
/* BF4C8 800BE8C8 14400007 */  bnez       $v0, .L800BE8E8
/* BF4CC 800BE8CC A0C20001 */   sb        $v0, 1($a2)
/* BF4D0 800BE8D0 97A20004 */  lhu        $v0, 4($sp)
/* BF4D4 800BE8D4 A5220000 */  sh         $v0, ($t1)
/* BF4D8 800BE8D8 93A20006 */  lbu        $v0, 6($sp)
/* BF4DC 800BE8DC A0C2FFFF */  sb         $v0, -1($a2)
/* BF4E0 800BE8E0 93A20007 */  lbu        $v0, 7($sp)
/* BF4E4 800BE8E4 A0C20000 */  sb         $v0, ($a2)
.L800BE8E8:
/* BF4E8 800BE8E8 24E70001 */  addiu      $a3, $a3, 1
/* BF4EC 800BE8EC 25080008 */  addiu      $t0, $t0, 8
/* BF4F0 800BE8F0 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF4F4 800BE8F4 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF4F8 800BE8F8 24C60006 */  addiu      $a2, $a2, 6
/* BF4FC 800BE8FC 00E2102A */  slt        $v0, $a3, $v0
/* BF500 800BE900 1440FFE6 */  bnez       $v0, .L800BE89C
/* BF504 800BE904 25290006 */   addiu     $t1, $t1, 6
.L800BE908:
/* BF508 800BE908 27BD0010 */  addiu      $sp, $sp, 0x10
/* BF50C 800BE90C 03E00008 */  jr         $ra
/* BF510 800BE910 00000000 */   nop

glabel __osPackReadData
/* BF514 800BE914 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* BF518 800BE918 3C07800F */  lui        $a3, %hi(__osContPifRam)
/* BF51C 800BE91C 24E75760 */  addiu      $a3, $a3, %lo(__osContPifRam)
/* BF520 800BE920 2406000E */  addiu      $a2, $zero, 0xe
/* BF524 800BE924 24E20038 */  addiu      $v0, $a3, 0x38
.L800BE928:
/* BF528 800BE928 AC400000 */  sw         $zero, ($v0)
/* BF52C 800BE92C 24C6FFFF */  addiu      $a2, $a2, -1
/* BF530 800BE930 04C1FFFD */  bgez       $a2, .L800BE928
/* BF534 800BE934 2442FFFC */   addiu     $v0, $v0, -4
/* BF538 800BE938 24020001 */  addiu      $v0, $zero, 1
/* BF53C 800BE93C 3C04800F */  lui        $a0, %hi(__osMaxControllers)
/* BF540 800BE940 9084575C */  lbu        $a0, %lo(__osMaxControllers)($a0)
/* BF544 800BE944 00003021 */  addu       $a2, $zero, $zero
/* BF548 800BE948 3C01800F */  lui        $at, %hi(__osContPifRam+0x3C)
/* BF54C 800BE94C AC22579C */  sw         $v0, %lo(__osContPifRam+0x3C)($at)
/* BF550 800BE950 240200FF */  addiu      $v0, $zero, 0xff
/* BF554 800BE954 24030001 */  addiu      $v1, $zero, 1
/* BF558 800BE958 A3A20000 */  sb         $v0, ($sp)
/* BF55C 800BE95C 24020004 */  addiu      $v0, $zero, 4
/* BF560 800BE960 A3A20002 */  sb         $v0, 2($sp)
/* BF564 800BE964 3402FFFF */  ori        $v0, $zero, 0xffff
/* BF568 800BE968 A7A20004 */  sh         $v0, 4($sp)
/* BF56C 800BE96C 2402FFFF */  addiu      $v0, $zero, -1
/* BF570 800BE970 A3A30001 */  sb         $v1, 1($sp)
/* BF574 800BE974 A3A30003 */  sb         $v1, 3($sp)
/* BF578 800BE978 A3A20006 */  sb         $v0, 6($sp)
/* BF57C 800BE97C 1880000F */  blez       $a0, .L800BE9BC
/* BF580 800BE980 A3A20007 */   sb        $v0, 7($sp)
.L800BE984:
/* BF584 800BE984 8BA20000 */  lwl        $v0, ($sp)
/* BF588 800BE988 9BA20003 */  lwr        $v0, 3($sp)
/* BF58C 800BE98C 8BA30004 */  lwl        $v1, 4($sp)
/* BF590 800BE990 9BA30007 */  lwr        $v1, 7($sp)
/* BF594 800BE994 A8E20000 */  swl        $v0, ($a3)
/* BF598 800BE998 B8E20003 */  swr        $v0, 3($a3)
/* BF59C 800BE99C A8E30004 */  swl        $v1, 4($a3)
/* BF5A0 800BE9A0 B8E30007 */  swr        $v1, 7($a3)
/* BF5A4 800BE9A4 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF5A8 800BE9A8 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF5AC 800BE9AC 24C60001 */  addiu      $a2, $a2, 1
/* BF5B0 800BE9B0 00C2102A */  slt        $v0, $a2, $v0
/* BF5B4 800BE9B4 1440FFF3 */  bnez       $v0, .L800BE984
/* BF5B8 800BE9B8 24E70008 */   addiu     $a3, $a3, 8
.L800BE9BC:
/* BF5BC 800BE9BC 240200FE */  addiu      $v0, $zero, 0xfe
/* BF5C0 800BE9C0 A0E20000 */  sb         $v0, ($a3)
/* BF5C4 800BE9C4 03E00008 */  jr         $ra
/* BF5C8 800BE9C8 27BD0010 */   addiu     $sp, $sp, 0x10
/* BF5CC 800BE9CC 00000000 */  nop
