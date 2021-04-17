.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_romcopy_thread
/* 9D360 8009C760 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9D364 8009C764 AFB20020 */  sw         $s2, 0x20($sp)
/* 9D368 8009C768 309200FF */  andi       $s2, $a0, 0xff
/* 9D36C 8009C76C 24040248 */  addiu      $a0, $zero, 0x248
/* 9D370 8009C770 AFB1001C */  sw         $s1, 0x1c($sp)
/* 9D374 8009C774 30B100FF */  andi       $s1, $a1, 0xff
/* 9D378 8009C778 3C05800E */  lui        $a1, %hi(D_800E2C70)
/* 9D37C 8009C77C 24A52C70 */  addiu      $a1, $a1, %lo(D_800E2C70)
/* 9D380 8009C780 24060079 */  addiu      $a2, $zero, 0x79
/* 9D384 8009C784 AFBF0024 */  sw         $ra, 0x24($sp)
/* 9D388 8009C788 0C025F9C */  jal        Malloc
/* 9D38C 8009C78C AFB00018 */   sw        $s0, 0x18($sp)
/* 9D390 8009C790 3C03800F */  lui        $v1, %hi(romcopy_stack)
/* 9D394 8009C794 247030B0 */  addiu      $s0, $v1, %lo(romcopy_stack)
/* 9D398 8009C798 26100010 */  addiu      $s0, $s0, 0x10
/* 9D39C 8009C79C 02002021 */  addu       $a0, $s0, $zero
/* 9D3A0 8009C7A0 02202821 */  addu       $a1, $s1, $zero
/* 9D3A4 8009C7A4 3C06800A */  lui        $a2, %hi(romcopy_loop)
/* 9D3A8 8009C7A8 24C6C7E4 */  addiu      $a2, $a2, %lo(romcopy_loop)
/* 9D3AC 8009C7AC AC6230B0 */  sw         $v0, 0x30b0($v1)
/* 9D3B0 8009C7B0 24420248 */  addiu      $v0, $v0, 0x248
/* 9D3B4 8009C7B4 00003821 */  addu       $a3, $zero, $zero
/* 9D3B8 8009C7B8 AFA20010 */  sw         $v0, 0x10($sp)
/* 9D3BC 8009C7BC 0C02FBB0 */  jal        osCreateThread
/* 9D3C0 8009C7C0 AFB20014 */   sw        $s2, 0x14($sp)
/* 9D3C4 8009C7C4 0C0334B8 */  jal        osStartThread
/* 9D3C8 8009C7C8 02002021 */   addu      $a0, $s0, $zero
/* 9D3CC 8009C7CC 8FBF0024 */  lw         $ra, 0x24($sp)
/* 9D3D0 8009C7D0 8FB20020 */  lw         $s2, 0x20($sp)
/* 9D3D4 8009C7D4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9D3D8 8009C7D8 8FB00018 */  lw         $s0, 0x18($sp)
/* 9D3DC 8009C7DC 03E00008 */  jr         $ra
/* 9D3E0 8009C7E0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel romcopy_loop
/* 9D3E4 8009C7E4 27BDFF38 */  addiu      $sp, $sp, -0xc8
/* 9D3E8 8009C7E8 AFBF00C0 */  sw         $ra, 0xc0($sp)
/* 9D3EC 8009C7EC AFB500BC */  sw         $s5, 0xbc($sp)
/* 9D3F0 8009C7F0 AFB400B8 */  sw         $s4, 0xb8($sp)
/* 9D3F4 8009C7F4 AFB300B4 */  sw         $s3, 0xb4($sp)
/* 9D3F8 8009C7F8 AFB200B0 */  sw         $s2, 0xb0($sp)
/* 9D3FC 8009C7FC AFB100AC */  sw         $s1, 0xac($sp)
/* 9D400 8009C800 0C02722D */  jal        romcopy_mesgqueue
/* 9D404 8009C804 AFB000A8 */   sw        $s0, 0xa8($sp)
/* 9D408 8009C808 27A40020 */  addiu      $a0, $sp, 0x20
/* 9D40C 8009C80C 27A500A0 */  addiu      $a1, $sp, 0xa0
/* 9D410 8009C810 0C02FBA4 */  jal        osCreateMesgQueue
/* 9D414 8009C814 24060001 */   addiu     $a2, $zero, 1
/* 9D418 8009C818 27B40060 */  addiu      $s4, $sp, 0x60
/* 9D41C 8009C81C 27B200A4 */  addiu      $s2, $sp, 0xa4
/* 9D420 8009C820 3C02800F */  lui        $v0, %hi(D_800F3270)
/* 9D424 8009C824 24533270 */  addiu      $s3, $v0, %lo(D_800F3270)
/* 9D428 8009C828 2675FE40 */  addiu      $s5, $s3, -0x1c0
/* 9D42C 8009C82C 27B10020 */  addiu      $s1, $sp, 0x20
/* 9D430 8009C830 02602021 */  addu       $a0, $s3, $zero
.L8009C834:
/* 9D434 8009C834 02402821 */  addu       $a1, $s2, $zero
/* 9D438 8009C838 0C0321E4 */  jal        osRecvMesg
/* 9D43C 8009C83C 24060001 */   addiu     $a2, $zero, 1
/* 9D440 8009C840 92430003 */  lbu        $v1, 3($s2)
/* 9D444 8009C844 8EB00008 */  lw         $s0, 8($s5)
/* 9D448 8009C848 00031080 */  sll        $v0, $v1, 2
/* 9D44C 8009C84C 00431021 */  addu       $v0, $v0, $v1
/* 9D450 8009C850 000210C0 */  sll        $v0, $v0, 3
/* 9D454 8009C854 02028021 */  addu       $s0, $s0, $v0
/* 9D458 8009C858 8E04001C */  lw         $a0, 0x1c($s0)
/* 9D45C 8009C85C 0C030DB4 */  jal        osInvalDCache
/* 9D460 8009C860 8E050024 */   lw        $a1, 0x24($s0)
/* 9D464 8009C864 8E02001C */  lw         $v0, 0x1c($s0)
/* 9D468 8009C868 02802021 */  addu       $a0, $s4, $zero
/* 9D46C 8009C86C AFA20010 */  sw         $v0, 0x10($sp)
/* 9D470 8009C870 8E030024 */  lw         $v1, 0x24($s0)
/* 9D474 8009C874 00002821 */  addu       $a1, $zero, $zero
/* 9D478 8009C878 AFB10018 */  sw         $s1, 0x18($sp)
/* 9D47C 8009C87C AFA30014 */  sw         $v1, 0x14($sp)
/* 9D480 8009C880 8E070020 */  lw         $a3, 0x20($s0)
/* 9D484 8009C884 0C031DE4 */  jal        osPiStartDma
/* 9D488 8009C888 00003021 */   addu      $a2, $zero, $zero
/* 9D48C 8009C88C 02202021 */  addu       $a0, $s1, $zero
/* 9D490 8009C890 00002821 */  addu       $a1, $zero, $zero
/* 9D494 8009C894 0C0321E4 */  jal        osRecvMesg
/* 9D498 8009C898 24060001 */   addiu     $a2, $zero, 1
/* 9D49C 8009C89C 26040004 */  addiu      $a0, $s0, 4
/* 9D4A0 8009C8A0 00002821 */  addu       $a1, $zero, $zero
/* 9D4A4 8009C8A4 0C03313C */  jal        osSendMesg
/* 9D4A8 8009C8A8 24060001 */   addiu     $a2, $zero, 1
/* 9D4AC 8009C8AC 0802720D */  j          .L8009C834
/* 9D4B0 8009C8B0 02602021 */   addu      $a0, $s3, $zero

glabel romcopy_mesgqueue
/* 9D4B4 8009C8B4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9D4B8 8009C8B8 24040020 */  addiu      $a0, $zero, 0x20
/* 9D4BC 8009C8BC AFB10014 */  sw         $s1, 0x14($sp)
/* 9D4C0 8009C8C0 3C11800E */  lui        $s1, %hi(D_800E2C70)
/* 9D4C4 8009C8C4 26312C70 */  addiu      $s1, $s1, %lo(D_800E2C70)
/* 9D4C8 8009C8C8 02202821 */  addu       $a1, $s1, $zero
/* 9D4CC 8009C8CC 240600B0 */  addiu      $a2, $zero, 0xb0
/* 9D4D0 8009C8D0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 9D4D4 8009C8D4 AFB40020 */  sw         $s4, 0x20($sp)
/* 9D4D8 8009C8D8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9D4DC 8009C8DC AFB20018 */  sw         $s2, 0x18($sp)
/* 9D4E0 8009C8E0 0C025F9C */  jal        Malloc
/* 9D4E4 8009C8E4 AFB00010 */   sw        $s0, 0x10($sp)
/* 9D4E8 8009C8E8 3C12800F */  lui        $s2, %hi(romcopy_stack)
/* 9D4EC 8009C8EC 265030B0 */  addiu      $s0, $s2, %lo(romcopy_stack)
/* 9D4F0 8009C8F0 260401C0 */  addiu      $a0, $s0, 0x1c0
/* 9D4F4 8009C8F4 00402821 */  addu       $a1, $v0, $zero
/* 9D4F8 8009C8F8 24060008 */  addiu      $a2, $zero, 8
/* 9D4FC 8009C8FC 0C02FBA4 */  jal        osCreateMesgQueue
/* 9D500 8009C900 AE020004 */   sw        $v0, 4($s0)
/* 9D504 8009C904 260401DC */  addiu      $a0, $s0, 0x1dc
/* 9D508 8009C908 260501D8 */  addiu      $a1, $s0, 0x1d8
/* 9D50C 8009C90C 0C02FBA4 */  jal        osCreateMesgQueue
/* 9D510 8009C910 24060001 */   addiu     $a2, $zero, 1
/* 9D514 8009C914 24040140 */  addiu      $a0, $zero, 0x140
/* 9D518 8009C918 02202821 */  addu       $a1, $s1, $zero
/* 9D51C 8009C91C 0C025F9C */  jal        Malloc
/* 9D520 8009C920 240600B6 */   addiu     $a2, $zero, 0xb6
/* 9D524 8009C924 24040008 */  addiu      $a0, $zero, 8
/* 9D528 8009C928 02202821 */  addu       $a1, $s1, $zero
/* 9D52C 8009C92C 240600B8 */  addiu      $a2, $zero, 0xb8
/* 9D530 8009C930 0C025F9C */  jal        Malloc
/* 9D534 8009C934 AE020008 */   sw        $v0, 8($s0)
/* 9D538 8009C938 00008821 */  addu       $s1, $zero, $zero
/* 9D53C 8009C93C 0240A021 */  addu       $s4, $s2, $zero
/* 9D540 8009C940 02009821 */  addu       $s3, $s0, $zero
/* 9D544 8009C944 00009021 */  addu       $s2, $zero, $zero
/* 9D548 8009C948 AE02000C */  sw         $v0, 0xc($s0)
.L8009C94C:
/* 9D54C 8009C94C 8E650008 */  lw         $a1, 8($s3)
/* 9D550 8009C950 24060001 */  addiu      $a2, $zero, 1
/* 9D554 8009C954 00B22821 */  addu       $a1, $a1, $s2
/* 9D558 8009C958 0C02FBA4 */  jal        osCreateMesgQueue
/* 9D55C 8009C95C 24A40004 */   addiu     $a0, $a1, 4
/* 9D560 8009C960 8E62000C */  lw         $v0, 0xc($s3)
/* 9D564 8009C964 00511021 */  addu       $v0, $v0, $s1
/* 9D568 8009C968 A0510000 */  sb         $s1, ($v0)
/* 9D56C 8009C96C 26310001 */  addiu      $s1, $s1, 1
/* 9D570 8009C970 2E220008 */  sltiu      $v0, $s1, 8
/* 9D574 8009C974 1440FFF5 */  bnez       $v0, .L8009C94C
/* 9D578 8009C978 26520028 */   addiu     $s2, $s2, 0x28
/* 9D57C 8009C97C 268230B0 */  addiu      $v0, $s4, 0x30b0
/* 9D580 8009C980 8FBF0024 */  lw         $ra, 0x24($sp)
/* 9D584 8009C984 8FB40020 */  lw         $s4, 0x20($sp)
/* 9D588 8009C988 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9D58C 8009C98C 8FB20018 */  lw         $s2, 0x18($sp)
/* 9D590 8009C990 8FB10014 */  lw         $s1, 0x14($sp)
/* 9D594 8009C994 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D598 8009C998 A04001F4 */  sb         $zero, 0x1f4($v0)
/* 9D59C 8009C99C 03E00008 */  jr         $ra
/* 9D5A0 8009C9A0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel RomCopy
/* 9D5A4 8009C9A4 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* 9D5A8 8009C9A8 AFB500A4 */  sw         $s5, 0xa4($sp)
/* 9D5AC 8009C9AC 0080A821 */  addu       $s5, $a0, $zero
/* 9D5B0 8009C9B0 3C04800F */  lui        $a0, %hi(D_800F328C)
/* 9D5B4 8009C9B4 2484328C */  addiu      $a0, $a0, %lo(D_800F328C)
/* 9D5B8 8009C9B8 AFB400A0 */  sw         $s4, 0xa0($sp)
/* 9D5BC 8009C9BC 00A0A021 */  addu       $s4, $a1, $zero
/* 9D5C0 8009C9C0 AFB00090 */  sw         $s0, 0x90($sp)
/* 9D5C4 8009C9C4 8FB000C0 */  lw         $s0, 0xc0($sp)
/* 9D5C8 8009C9C8 00002821 */  addu       $a1, $zero, $zero
/* 9D5CC 8009C9CC AFB3009C */  sw         $s3, 0x9c($sp)
/* 9D5D0 8009C9D0 00C09821 */  addu       $s3, $a2, $zero
/* 9D5D4 8009C9D4 AFB10094 */  sw         $s1, 0x94($sp)
/* 9D5D8 8009C9D8 8FB100C4 */  lw         $s1, 0xc4($sp)
/* 9D5DC 8009C9DC 24060001 */  addiu      $a2, $zero, 1
/* 9D5E0 8009C9E0 AFB600A8 */  sw         $s6, 0xa8($sp)
/* 9D5E4 8009C9E4 00E0B021 */  addu       $s6, $a3, $zero
/* 9D5E8 8009C9E8 AFBF00AC */  sw         $ra, 0xac($sp)
/* 9D5EC 8009C9EC 0C03313C */  jal        osSendMesg
/* 9D5F0 8009C9F0 AFB20098 */   sw        $s2, 0x98($sp)
/* 9D5F4 8009C9F4 32A30007 */  andi       $v1, $s5, 7
/* 9D5F8 8009C9F8 10600004 */  beqz       $v1, .L8009CA0C
/* 9D5FC 8009C9FC 27A40010 */   addiu     $a0, $sp, 0x10
/* 9D600 8009CA00 3C05800E */  lui        $a1, %hi(D_800E2C84)
/* 9D604 8009CA04 0802728D */  j          .L8009CA34
/* 9D608 8009CA08 24A52C84 */   addiu     $a1, $a1, %lo(D_800E2C84)
.L8009CA0C:
/* 9D60C 8009CA0C 32820001 */  andi       $v0, $s4, 1
/* 9D610 8009CA10 10400003 */  beqz       $v0, .L8009CA20
/* 9D614 8009CA14 3C05800E */   lui       $a1, %hi(D_800E2CF0)
/* 9D618 8009CA18 0802728D */  j          .L8009CA34
/* 9D61C 8009CA1C 24A52CF0 */   addiu     $a1, $a1, %lo(D_800E2CF0)
.L8009CA20:
/* 9D620 8009CA20 32620001 */  andi       $v0, $s3, 1
/* 9D624 8009CA24 1040000C */  beqz       $v0, .L8009CA58
/* 9D628 8009CA28 27A40010 */   addiu     $a0, $sp, 0x10
/* 9D62C 8009CA2C 3C05800E */  lui        $a1, %hi(D_800E2D28)
/* 9D630 8009CA30 24A52D28 */  addiu      $a1, $a1, %lo(D_800E2D28)
.L8009CA34:
/* 9D634 8009CA34 02003021 */  addu       $a2, $s0, $zero
/* 9D638 8009CA38 0C0333AC */  jal        sprintf
/* 9D63C 8009CA3C 02203821 */   addu      $a3, $s1, $zero
/* 9D640 8009CA40 3C04800E */  lui        $a0, %hi(D_800E2CBC)
/* 9D644 8009CA44 24842CBC */  addiu      $a0, $a0, %lo(D_800E2CBC)
/* 9D648 8009CA48 0C025F2D */  jal        manualCrash
/* 9D64C 8009CA4C 27A50010 */   addiu     $a1, $sp, 0x10
/* 9D650 8009CA50 080272A4 */  j          .L8009CA90
/* 9D654 8009CA54 3C02800F */   lui       $v0, 0x800f
.L8009CA58:
/* 9D658 8009CA58 2EC20002 */  sltiu      $v0, $s6, 2
/* 9D65C 8009CA5C 1440000C */  bnez       $v0, .L8009CA90
/* 9D660 8009CA60 3C02800F */   lui       $v0, 0x800f
/* 9D664 8009CA64 27A40010 */  addiu      $a0, $sp, 0x10
/* 9D668 8009CA68 3C05800E */  lui        $a1, %hi(D_800E2D60)
/* 9D66C 8009CA6C 24A52D60 */  addiu      $a1, $a1, %lo(D_800E2D60)
/* 9D670 8009CA70 02003021 */  addu       $a2, $s0, $zero
/* 9D674 8009CA74 0C0333AC */  jal        sprintf
/* 9D678 8009CA78 02203821 */   addu      $a3, $s1, $zero
/* 9D67C 8009CA7C 3C04800E */  lui        $a0, %hi(D_800E2CBC)
/* 9D680 8009CA80 24842CBC */  addiu      $a0, $a0, %lo(D_800E2CBC)
/* 9D684 8009CA84 0C025F2D */  jal        manualCrash
/* 9D688 8009CA88 27A50010 */   addiu     $a1, $sp, 0x10
/* 9D68C 8009CA8C 3C02800F */  lui        $v0, %hi(romcopy_stack)
.L8009CA90:
/* 9D690 8009CA90 245130B0 */  addiu      $s1, $v0, %lo(romcopy_stack)
/* 9D694 8009CA94 262401C0 */  addiu      $a0, $s1, 0x1c0
/* 9D698 8009CA98 922301F4 */  lbu        $v1, 0x1f4($s1)
/* 9D69C 8009CA9C 8E22000C */  lw         $v0, 0xc($s1)
/* 9D6A0 8009CAA0 00003021 */  addu       $a2, $zero, $zero
/* 9D6A4 8009CAA4 00431021 */  addu       $v0, $v0, $v1
/* 9D6A8 8009CAA8 90520000 */  lbu        $s2, ($v0)
/* 9D6AC 8009CAAC 24630001 */  addiu      $v1, $v1, 1
/* 9D6B0 8009CAB0 A22301F4 */  sb         $v1, 0x1f4($s1)
/* 9D6B4 8009CAB4 8E230008 */  lw         $v1, 8($s1)
/* 9D6B8 8009CAB8 02402821 */  addu       $a1, $s2, $zero
/* 9D6BC 8009CABC 00121080 */  sll        $v0, $s2, 2
/* 9D6C0 8009CAC0 00521021 */  addu       $v0, $v0, $s2
/* 9D6C4 8009CAC4 000210C0 */  sll        $v0, $v0, 3
/* 9D6C8 8009CAC8 00628021 */  addu       $s0, $v1, $v0
/* 9D6CC 8009CACC AE15001C */  sw         $s5, 0x1c($s0)
/* 9D6D0 8009CAD0 AE140020 */  sw         $s4, 0x20($s0)
/* 9D6D4 8009CAD4 0C03313C */  jal        osSendMesg
/* 9D6D8 8009CAD8 AE130024 */   sw        $s3, 0x24($s0)
/* 9D6DC 8009CADC 10400005 */  beqz       $v0, .L8009CAF4
/* 9D6E0 8009CAE0 3C04800E */   lui       $a0, %hi(D_800E2D84)
/* 9D6E4 8009CAE4 24842D84 */  addiu      $a0, $a0, %lo(D_800E2D84)
/* 9D6E8 8009CAE8 3C05800E */  lui        $a1, %hi(D_800E2DBC)
/* 9D6EC 8009CAEC 0C025F2D */  jal        manualCrash
/* 9D6F0 8009CAF0 24A52DBC */   addiu     $a1, $a1, %lo(D_800E2DBC)
.L8009CAF4:
/* 9D6F4 8009CAF4 263301DC */  addiu      $s3, $s1, 0x1dc
/* 9D6F8 8009CAF8 02602021 */  addu       $a0, $s3, $zero
/* 9D6FC 8009CAFC 00002821 */  addu       $a1, $zero, $zero
/* 9D700 8009CB00 0C0321E4 */  jal        osRecvMesg
/* 9D704 8009CB04 24060001 */   addiu     $a2, $zero, 1
/* 9D708 8009CB08 24030001 */  addiu      $v1, $zero, 1
/* 9D70C 8009CB0C 16C30015 */  bne        $s6, $v1, .L8009CB64
/* 9D710 8009CB10 02401021 */   addu      $v0, $s2, $zero
/* 9D714 8009CB14 26040004 */  addiu      $a0, $s0, 4
/* 9D718 8009CB18 00002821 */  addu       $a1, $zero, $zero
/* 9D71C 8009CB1C 0C0321E4 */  jal        osRecvMesg
/* 9D720 8009CB20 24060001 */   addiu     $a2, $zero, 1
/* 9D724 8009CB24 02602021 */  addu       $a0, $s3, $zero
/* 9D728 8009CB28 00002821 */  addu       $a1, $zero, $zero
/* 9D72C 8009CB2C 0C03313C */  jal        osSendMesg
/* 9D730 8009CB30 24060001 */   addiu     $a2, $zero, 1
/* 9D734 8009CB34 02602021 */  addu       $a0, $s3, $zero
/* 9D738 8009CB38 922201F4 */  lbu        $v0, 0x1f4($s1)
/* 9D73C 8009CB3C 00002821 */  addu       $a1, $zero, $zero
/* 9D740 8009CB40 2442FFFF */  addiu      $v0, $v0, -1
/* 9D744 8009CB44 A22201F4 */  sb         $v0, 0x1f4($s1)
/* 9D748 8009CB48 304300FF */  andi       $v1, $v0, 0xff
/* 9D74C 8009CB4C 8E22000C */  lw         $v0, 0xc($s1)
/* 9D750 8009CB50 24060001 */  addiu      $a2, $zero, 1
/* 9D754 8009CB54 00431021 */  addu       $v0, $v0, $v1
/* 9D758 8009CB58 0C0321E4 */  jal        osRecvMesg
/* 9D75C 8009CB5C A0520000 */   sb        $s2, ($v0)
/* 9D760 8009CB60 02401021 */  addu       $v0, $s2, $zero
.L8009CB64:
/* 9D764 8009CB64 8FBF00AC */  lw         $ra, 0xac($sp)
/* 9D768 8009CB68 8FB600A8 */  lw         $s6, 0xa8($sp)
/* 9D76C 8009CB6C 8FB500A4 */  lw         $s5, 0xa4($sp)
/* 9D770 8009CB70 8FB400A0 */  lw         $s4, 0xa0($sp)
/* 9D774 8009CB74 8FB3009C */  lw         $s3, 0x9c($sp)
/* 9D778 8009CB78 8FB20098 */  lw         $s2, 0x98($sp)
/* 9D77C 8009CB7C 8FB10094 */  lw         $s1, 0x94($sp)
/* 9D780 8009CB80 8FB00090 */  lw         $s0, 0x90($sp)
/* 9D784 8009CB84 03E00008 */  jr         $ra
/* 9D788 8009CB88 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel func_8009CB8C
/* 9D78C 8009CB8C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9D790 8009CB90 AFB20018 */  sw         $s2, 0x18($sp)
/* 9D794 8009CB94 309200FF */  andi       $s2, $a0, 0xff
/* 9D798 8009CB98 24020001 */  addiu      $v0, $zero, 1
/* 9D79C 8009CB9C AFBF001C */  sw         $ra, 0x1c($sp)
/* 9D7A0 8009CBA0 AFB10014 */  sw         $s1, 0x14($sp)
/* 9D7A4 8009CBA4 14A20019 */  bne        $a1, $v0, .L8009CC0C
/* 9D7A8 8009CBA8 AFB00010 */   sw        $s0, 0x10($sp)
/* 9D7AC 8009CBAC 00002821 */  addu       $a1, $zero, $zero
/* 9D7B0 8009CBB0 24060001 */  addiu      $a2, $zero, 1
/* 9D7B4 8009CBB4 3C10800F */  lui        $s0, %hi(romcopy_stack)
/* 9D7B8 8009CBB8 261030B0 */  addiu      $s0, $s0, %lo(romcopy_stack)
/* 9D7BC 8009CBBC 00121080 */  sll        $v0, $s2, 2
/* 9D7C0 8009CBC0 00521021 */  addu       $v0, $v0, $s2
/* 9D7C4 8009CBC4 8E040008 */  lw         $a0, 8($s0)
/* 9D7C8 8009CBC8 000210C0 */  sll        $v0, $v0, 3
/* 9D7CC 8009CBCC 00822021 */  addu       $a0, $a0, $v0
/* 9D7D0 8009CBD0 0C0321E4 */  jal        osRecvMesg
/* 9D7D4 8009CBD4 24840004 */   addiu     $a0, $a0, 4
/* 9D7D8 8009CBD8 261101DC */  addiu      $s1, $s0, 0x1dc
/* 9D7DC 8009CBDC 02202021 */  addu       $a0, $s1, $zero
/* 9D7E0 8009CBE0 00002821 */  addu       $a1, $zero, $zero
/* 9D7E4 8009CBE4 0C03313C */  jal        osSendMesg
/* 9D7E8 8009CBE8 24060001 */   addiu     $a2, $zero, 1
/* 9D7EC 8009CBEC 02202021 */  addu       $a0, $s1, $zero
/* 9D7F0 8009CBF0 920201F4 */  lbu        $v0, 0x1f4($s0)
/* 9D7F4 8009CBF4 00002821 */  addu       $a1, $zero, $zero
/* 9D7F8 8009CBF8 2442FFFF */  addiu      $v0, $v0, -1
/* 9D7FC 8009CBFC A20201F4 */  sb         $v0, 0x1f4($s0)
/* 9D800 8009CC00 304300FF */  andi       $v1, $v0, 0xff
/* 9D804 8009CC04 0802731C */  j          .L8009CC70
/* 9D808 8009CC08 8E02000C */   lw        $v0, 0xc($s0)
.L8009CC0C:
/* 9D80C 8009CC0C 00002821 */  addu       $a1, $zero, $zero
/* 9D810 8009CC10 00003021 */  addu       $a2, $zero, $zero
/* 9D814 8009CC14 3C02800F */  lui        $v0, %hi(romcopy_stack)
/* 9D818 8009CC18 245130B0 */  addiu      $s1, $v0, %lo(romcopy_stack)
/* 9D81C 8009CC1C 00121880 */  sll        $v1, $s2, 2
/* 9D820 8009CC20 00721821 */  addu       $v1, $v1, $s2
/* 9D824 8009CC24 8E240008 */  lw         $a0, 8($s1)
/* 9D828 8009CC28 000318C0 */  sll        $v1, $v1, 3
/* 9D82C 8009CC2C 00832021 */  addu       $a0, $a0, $v1
/* 9D830 8009CC30 0C0321E4 */  jal        osRecvMesg
/* 9D834 8009CC34 24840004 */   addiu     $a0, $a0, 4
/* 9D838 8009CC38 14400012 */  bnez       $v0, .L8009CC84
/* 9D83C 8009CC3C 00001021 */   addu      $v0, $zero, $zero
/* 9D840 8009CC40 263001DC */  addiu      $s0, $s1, 0x1dc
/* 9D844 8009CC44 02002021 */  addu       $a0, $s0, $zero
/* 9D848 8009CC48 00002821 */  addu       $a1, $zero, $zero
/* 9D84C 8009CC4C 0C03313C */  jal        osSendMesg
/* 9D850 8009CC50 24060001 */   addiu     $a2, $zero, 1
/* 9D854 8009CC54 02002021 */  addu       $a0, $s0, $zero
/* 9D858 8009CC58 922201F4 */  lbu        $v0, 0x1f4($s1)
/* 9D85C 8009CC5C 00002821 */  addu       $a1, $zero, $zero
/* 9D860 8009CC60 2442FFFF */  addiu      $v0, $v0, -1
/* 9D864 8009CC64 A22201F4 */  sb         $v0, 0x1f4($s1)
/* 9D868 8009CC68 304300FF */  andi       $v1, $v0, 0xff
/* 9D86C 8009CC6C 8E22000C */  lw         $v0, 0xc($s1)
.L8009CC70:
/* 9D870 8009CC70 24060001 */  addiu      $a2, $zero, 1
/* 9D874 8009CC74 00431021 */  addu       $v0, $v0, $v1
/* 9D878 8009CC78 0C0321E4 */  jal        osRecvMesg
/* 9D87C 8009CC7C A0520000 */   sb        $s2, ($v0)
/* 9D880 8009CC80 24020001 */  addiu      $v0, $zero, 1
.L8009CC84:
/* 9D884 8009CC84 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9D888 8009CC88 8FB20018 */  lw         $s2, 0x18($sp)
/* 9D88C 8009CC8C 8FB10014 */  lw         $s1, 0x14($sp)
/* 9D890 8009CC90 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D894 8009CC94 03E00008 */  jr         $ra
/* 9D898 8009CC98 27BD0020 */   addiu     $sp, $sp, 0x20
/* 9D89C 8009CC9C 00000000 */  nop
