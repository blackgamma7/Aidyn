.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osCreateScheduler
/* CC590 800CB990 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CC594 800CB994 AFB00018 */  sw         $s0, 0x18($sp)
/* CC598 800CB998 00808021 */  addu       $s0, $a0, $zero
/* CC59C 800CB99C AFB40028 */  sw         $s4, 0x28($sp)
/* CC5A0 800CB9A0 00A0A021 */  addu       $s4, $a1, $zero
/* CC5A4 800CB9A4 AFB5002C */  sw         $s5, 0x2c($sp)
/* CC5A8 800CB9A8 00C0A821 */  addu       $s5, $a2, $zero
/* CC5AC 800CB9AC AFB20020 */  sw         $s2, 0x20($sp)
/* CC5B0 800CB9B0 26120040 */  addiu      $s2, $s0, 0x40
/* CC5B4 800CB9B4 02402021 */  addu       $a0, $s2, $zero
/* CC5B8 800CB9B8 26050058 */  addiu      $a1, $s0, 0x58
/* CC5BC 800CB9BC 24060008 */  addiu      $a2, $zero, 8
/* CC5C0 800CB9C0 24020001 */  addiu      $v0, $zero, 1
/* CC5C4 800CB9C4 AFBF0030 */  sw         $ra, 0x30($sp)
/* CC5C8 800CB9C8 AFB30024 */  sw         $s3, 0x24($sp)
/* CC5CC 800CB9CC AFB1001C */  sw         $s1, 0x1c($sp)
/* CC5D0 800CB9D0 A6020000 */  sh         $v0, ($s0)
/* CC5D4 800CB9D4 24020004 */  addiu      $v0, $zero, 4
/* CC5D8 800CB9D8 AE000274 */  sw         $zero, 0x274($s0)
/* CC5DC 800CB9DC AE000278 */  sw         $zero, 0x278($s0)
/* CC5E0 800CB9E0 AE000260 */  sw         $zero, 0x260($s0)
/* CC5E4 800CB9E4 AE00027C */  sw         $zero, 0x27c($s0)
/* CC5E8 800CB9E8 AE000264 */  sw         $zero, 0x264($s0)
/* CC5EC 800CB9EC AE000268 */  sw         $zero, 0x268($s0)
/* CC5F0 800CB9F0 AE00026C */  sw         $zero, 0x26c($s0)
/* CC5F4 800CB9F4 AE000270 */  sw         $zero, 0x270($s0)
/* CC5F8 800CB9F8 A6020020 */  sh         $v0, 0x20($s0)
/* CC5FC 800CB9FC 93B3004B */  lbu        $s3, 0x4b($sp)
/* CC600 800CBA00 0C02FBA4 */  jal        osCreateMesgQueue
/* CC604 800CBA04 00E08821 */   addu      $s1, $a3, $zero
/* CC608 800CBA08 26040078 */  addiu      $a0, $s0, 0x78
/* CC60C 800CBA0C 26050090 */  addiu      $a1, $s0, 0x90
/* CC610 800CBA10 0C02FBA4 */  jal        osCreateMesgQueue
/* CC614 800CBA14 24060008 */   addiu     $a2, $zero, 8
/* CC618 800CBA18 0C0347B4 */  jal        osCreateViManager
/* CC61C 800CBA1C 240400FE */   addiu     $a0, $zero, 0xfe
/* CC620 800CBA20 323100FF */  andi       $s1, $s1, 0xff
/* CC624 800CBA24 00112080 */  sll        $a0, $s1, 2
/* CC628 800CBA28 00912021 */  addu       $a0, $a0, $s1
/* CC62C 800CBA2C 00042100 */  sll        $a0, $a0, 4
/* CC630 800CBA30 3C02800F */  lui        $v0, %hi(osViModeTable)
/* CC634 800CBA34 24423E60 */  addiu      $v0, $v0, %lo(osViModeTable)
/* CC638 800CBA38 0C0348E8 */  jal        osViSetMode
/* CC63C 800CBA3C 00822021 */   addu      $a0, $a0, $v0
/* CC640 800CBA40 0C034738 */  jal        osViBlack
/* CC644 800CBA44 24040001 */   addiu     $a0, $zero, 1
/* CC648 800CBA48 24040004 */  addiu      $a0, $zero, 4
/* CC64C 800CBA4C 02402821 */  addu       $a1, $s2, $zero
/* CC650 800CBA50 0C033188 */  jal        osSetEventMesg
/* CC654 800CBA54 2406029B */   addiu     $a2, $zero, 0x29b
/* CC658 800CBA58 24040009 */  addiu      $a0, $zero, 9
/* CC65C 800CBA5C 02402821 */  addu       $a1, $s2, $zero
/* CC660 800CBA60 0C033188 */  jal        osSetEventMesg
/* CC664 800CBA64 2406029C */   addiu     $a2, $zero, 0x29c
/* CC668 800CBA68 2404000E */  addiu      $a0, $zero, 0xe
/* CC66C 800CBA6C 02402821 */  addu       $a1, $s2, $zero
/* CC670 800CBA70 0C033188 */  jal        osSetEventMesg
/* CC674 800CBA74 2406029D */   addiu     $a2, $zero, 0x29d
/* CC678 800CBA78 02402021 */  addu       $a0, $s2, $zero
/* CC67C 800CBA7C 2405029A */  addiu      $a1, $zero, 0x29a
/* CC680 800CBA80 0C0348D0 */  jal        osViSetEvent
/* CC684 800CBA84 02603021 */   addu      $a2, $s3, $zero
/* CC688 800CBA88 261100B0 */  addiu      $s1, $s0, 0xb0
/* CC68C 800CBA8C 02202021 */  addu       $a0, $s1, $zero
/* CC690 800CBA90 24050004 */  addiu      $a1, $zero, 4
/* CC694 800CBA94 3C06800D */  lui        $a2, %hi(__scMain)
/* CC698 800CBA98 24C6BBC8 */  addiu      $a2, $a2, %lo(__scMain)
/* CC69C 800CBA9C 02003821 */  addu       $a3, $s0, $zero
/* CC6A0 800CBAA0 AFB40010 */  sw         $s4, 0x10($sp)
/* CC6A4 800CBAA4 0C02FBB0 */  jal        osCreateThread
/* CC6A8 800CBAA8 AFB50014 */   sw        $s5, 0x14($sp)
/* CC6AC 800CBAAC 0C0334B8 */  jal        osStartThread
/* CC6B0 800CBAB0 02202021 */   addu      $a0, $s1, $zero
/* CC6B4 800CBAB4 8FBF0030 */  lw         $ra, 0x30($sp)
/* CC6B8 800CBAB8 8FB5002C */  lw         $s5, 0x2c($sp)
/* CC6BC 800CBABC 8FB40028 */  lw         $s4, 0x28($sp)
/* CC6C0 800CBAC0 8FB30024 */  lw         $s3, 0x24($sp)
/* CC6C4 800CBAC4 8FB20020 */  lw         $s2, 0x20($sp)
/* CC6C8 800CBAC8 8FB1001C */  lw         $s1, 0x1c($sp)
/* CC6CC 800CBACC 8FB00018 */  lw         $s0, 0x18($sp)
/* CC6D0 800CBAD0 03E00008 */  jr         $ra
/* CC6D4 800CBAD4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel osScAddClient
/* CC6D8 800CBAD8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CC6DC 800CBADC AFB20018 */  sw         $s2, 0x18($sp)
/* CC6E0 800CBAE0 00809021 */  addu       $s2, $a0, $zero
/* CC6E4 800CBAE4 AFB00010 */  sw         $s0, 0x10($sp)
/* CC6E8 800CBAE8 00A08021 */  addu       $s0, $a1, $zero
/* CC6EC 800CBAEC AFB10014 */  sw         $s1, 0x14($sp)
/* CC6F0 800CBAF0 00C08821 */  addu       $s1, $a2, $zero
/* CC6F4 800CBAF4 AFBF001C */  sw         $ra, 0x1c($sp)
/* CC6F8 800CBAF8 0C0331C8 */  jal        osSetIntMask
/* CC6FC 800CBAFC 24040001 */   addiu     $a0, $zero, 1
/* CC700 800CBB00 AE110004 */  sw         $s1, 4($s0)
/* CC704 800CBB04 8E430260 */  lw         $v1, 0x260($s2)
/* CC708 800CBB08 00402021 */  addu       $a0, $v0, $zero
/* CC70C 800CBB0C AE030000 */  sw         $v1, ($s0)
/* CC710 800CBB10 0C0331C8 */  jal        osSetIntMask
/* CC714 800CBB14 AE500260 */   sw        $s0, 0x260($s2)
/* CC718 800CBB18 8FBF001C */  lw         $ra, 0x1c($sp)
/* CC71C 800CBB1C 8FB20018 */  lw         $s2, 0x18($sp)
/* CC720 800CBB20 8FB10014 */  lw         $s1, 0x14($sp)
/* CC724 800CBB24 8FB00010 */  lw         $s0, 0x10($sp)
/* CC728 800CBB28 03E00008 */  jr         $ra
/* CC72C 800CBB2C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel osScRemoveClient
/* CC730 800CBB30 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CC734 800CBB34 AFB20018 */  sw         $s2, 0x18($sp)
/* CC738 800CBB38 00809021 */  addu       $s2, $a0, $zero
/* CC73C 800CBB3C AFB3001C */  sw         $s3, 0x1c($sp)
/* CC740 800CBB40 00A09821 */  addu       $s3, $a1, $zero
/* CC744 800CBB44 AFBF0020 */  sw         $ra, 0x20($sp)
/* CC748 800CBB48 AFB10014 */  sw         $s1, 0x14($sp)
/* CC74C 800CBB4C AFB00010 */  sw         $s0, 0x10($sp)
/* CC750 800CBB50 8E500260 */  lw         $s0, 0x260($s2)
/* CC754 800CBB54 00008821 */  addu       $s1, $zero, $zero
/* CC758 800CBB58 0C0331C8 */  jal        osSetIntMask
/* CC75C 800CBB5C 24040001 */   addiu     $a0, $zero, 1
/* CC760 800CBB60 1200000E */  beqz       $s0, .L800CBB9C
/* CC764 800CBB64 00402021 */   addu      $a0, $v0, $zero
.L800CBB68:
/* CC768 800CBB68 56130009 */  bnel       $s0, $s3, .L800CBB90
/* CC76C 800CBB6C 02008821 */   addu      $s1, $s0, $zero
/* CC770 800CBB70 12200004 */  beqz       $s1, .L800CBB84
/* CC774 800CBB74 00000000 */   nop
/* CC778 800CBB78 8E020000 */  lw         $v0, ($s0)
/* CC77C 800CBB7C 08032EE7 */  j          .L800CBB9C
/* CC780 800CBB80 AE220000 */   sw        $v0, ($s1)
.L800CBB84:
/* CC784 800CBB84 8E020000 */  lw         $v0, ($s0)
/* CC788 800CBB88 08032EE7 */  j          .L800CBB9C
/* CC78C 800CBB8C AE420260 */   sw        $v0, 0x260($s2)
.L800CBB90:
/* CC790 800CBB90 8E100000 */  lw         $s0, ($s0)
/* CC794 800CBB94 1600FFF4 */  bnez       $s0, .L800CBB68
/* CC798 800CBB98 00000000 */   nop
.L800CBB9C:
/* CC79C 800CBB9C 0C0331C8 */  jal        osSetIntMask
/* CC7A0 800CBBA0 00000000 */   nop
/* CC7A4 800CBBA4 8FBF0020 */  lw         $ra, 0x20($sp)
/* CC7A8 800CBBA8 8FB3001C */  lw         $s3, 0x1c($sp)
/* CC7AC 800CBBAC 8FB20018 */  lw         $s2, 0x18($sp)
/* CC7B0 800CBBB0 8FB10014 */  lw         $s1, 0x14($sp)
/* CC7B4 800CBBB4 8FB00010 */  lw         $s0, 0x10($sp)
/* CC7B8 800CBBB8 03E00008 */  jr         $ra
/* CC7BC 800CBBBC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel osScGetCmdQ
/* CC7C0 800CBBC0 03E00008 */  jr         $ra
/* CC7C4 800CBBC4 24820078 */   addiu     $v0, $a0, 0x78

glabel __scMain
/* CC7C8 800CBBC8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CC7CC 800CBBCC AFB1001C */  sw         $s1, 0x1c($sp)
/* CC7D0 800CBBD0 00808821 */  addu       $s1, $a0, $zero
/* CC7D4 800CBBD4 AFB5002C */  sw         $s5, 0x2c($sp)
/* CC7D8 800CBBD8 2415029B */  addiu      $s5, $zero, 0x29b
/* CC7DC 800CBBDC AFB40028 */  sw         $s4, 0x28($sp)
/* CC7E0 800CBBE0 2414029A */  addiu      $s4, $zero, 0x29a
/* CC7E4 800CBBE4 AFB30024 */  sw         $s3, 0x24($sp)
/* CC7E8 800CBBE8 2413029C */  addiu      $s3, $zero, 0x29c
/* CC7EC 800CBBEC AFB20020 */  sw         $s2, 0x20($sp)
/* CC7F0 800CBBF0 2412029D */  addiu      $s2, $zero, 0x29d
/* CC7F4 800CBBF4 AFBF0030 */  sw         $ra, 0x30($sp)
/* CC7F8 800CBBF8 AFB00018 */  sw         $s0, 0x18($sp)
/* CC7FC 800CBBFC 26240040 */  addiu      $a0, $s1, 0x40
.L800CBC00:
/* CC800 800CBC00 27A50010 */  addiu      $a1, $sp, 0x10
/* CC804 800CBC04 0C0321E4 */  jal        osRecvMesg
/* CC808 800CBC08 24060001 */   addiu     $a2, $zero, 1
/* CC80C 800CBC0C 8FA30010 */  lw         $v1, 0x10($sp)
/* CC810 800CBC10 10750011 */  beq        $v1, $s5, .L800CBC58
/* CC814 800CBC14 2862029C */   slti      $v0, $v1, 0x29c
/* CC818 800CBC18 10400005 */  beqz       $v0, .L800CBC30
/* CC81C 800CBC1C 00000000 */   nop
/* CC820 800CBC20 10740009 */  beq        $v1, $s4, .L800CBC48
/* CC824 800CBC24 26240040 */   addiu     $a0, $s1, 0x40
/* CC828 800CBC28 08032F00 */  j          .L800CBC00
/* CC82C 800CBC2C 00000000 */   nop
.L800CBC30:
/* CC830 800CBC30 1073000D */  beq        $v1, $s3, .L800CBC68
/* CC834 800CBC34 00000000 */   nop
/* CC838 800CBC38 1072000F */  beq        $v1, $s2, .L800CBC78
/* CC83C 800CBC3C 26240040 */   addiu     $a0, $s1, 0x40
/* CC840 800CBC40 08032F00 */  j          .L800CBC00
/* CC844 800CBC44 00000000 */   nop
.L800CBC48:
/* CC848 800CBC48 0C032F33 */  jal        __scHandleRetrace
/* CC84C 800CBC4C 02202021 */   addu      $a0, $s1, $zero
/* CC850 800CBC50 08032F00 */  j          .L800CBC00
/* CC854 800CBC54 26240040 */   addiu     $a0, $s1, 0x40
.L800CBC58:
/* CC858 800CBC58 0C032F73 */  jal        __scHandleRSP
/* CC85C 800CBC5C 02202021 */   addu      $a0, $s1, $zero
/* CC860 800CBC60 08032F00 */  j          .L800CBC00
/* CC864 800CBC64 26240040 */   addiu     $a0, $s1, 0x40
.L800CBC68:
/* CC868 800CBC68 0C032FBD */  jal        __scHandleRDP
/* CC86C 800CBC6C 02202021 */   addu      $a0, $s1, $zero
/* CC870 800CBC70 08032F00 */  j          .L800CBC00
/* CC874 800CBC74 26240040 */   addiu     $a0, $s1, 0x40
.L800CBC78:
/* CC878 800CBC78 8E300260 */  lw         $s0, 0x260($s1)
/* CC87C 800CBC7C 1200FFE0 */  beqz       $s0, .L800CBC00
/* CC880 800CBC80 00000000 */   nop
.L800CBC84:
/* CC884 800CBC84 8E040004 */  lw         $a0, 4($s0)
/* CC888 800CBC88 26250020 */  addiu      $a1, $s1, 0x20
/* CC88C 800CBC8C 0C03313C */  jal        osSendMesg
/* CC890 800CBC90 00003021 */   addu      $a2, $zero, $zero
/* CC894 800CBC94 8E100000 */  lw         $s0, ($s0)
/* CC898 800CBC98 1600FFFA */  bnez       $s0, .L800CBC84
/* CC89C 800CBC9C 26240040 */   addiu     $a0, $s1, 0x40
/* CC8A0 800CBCA0 08032F00 */  j          .L800CBC00
/* CC8A4 800CBCA4 00000000 */   nop

glabel Ofunc_NOOP_800cbca8
/* CC8A8 800CBCA8 8FBF0030 */  lw         $ra, 0x30($sp)
/* CC8AC 800CBCAC 8FB5002C */  lw         $s5, 0x2c($sp)
/* CC8B0 800CBCB0 8FB40028 */  lw         $s4, 0x28($sp)
/* CC8B4 800CBCB4 8FB30024 */  lw         $s3, 0x24($sp)
/* CC8B8 800CBCB8 8FB20020 */  lw         $s2, 0x20($sp)
/* CC8BC 800CBCBC 8FB1001C */  lw         $s1, 0x1c($sp)
/* CC8C0 800CBCC0 8FB00018 */  lw         $s0, 0x18($sp)
/* CC8C4 800CBCC4 03E00008 */  jr         $ra
/* CC8C8 800CBCC8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __scHandleRetrace
/* CC8CC 800CBCCC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CC8D0 800CBCD0 AFB10024 */  sw         $s1, 0x24($sp)
/* CC8D4 800CBCD4 00808821 */  addu       $s1, $a0, $zero
/* CC8D8 800CBCD8 AFBF0028 */  sw         $ra, 0x28($sp)
/* CC8DC 800CBCDC AFB00020 */  sw         $s0, 0x20($sp)
/* CC8E0 800CBCE0 8E22027C */  lw         $v0, 0x27c($s1)
/* CC8E4 800CBCE4 2410FFFF */  addiu      $s0, $zero, -1
/* CC8E8 800CBCE8 AFA00014 */  sw         $zero, 0x14($sp)
/* CC8EC 800CBCEC AFA00018 */  sw         $zero, 0x18($sp)
/* CC8F0 800CBCF0 24420001 */  addiu      $v0, $v0, 1
/* CC8F4 800CBCF4 AE22027C */  sw         $v0, 0x27c($s1)
/* CC8F8 800CBCF8 26240078 */  addiu      $a0, $s1, 0x78
.L800CBCFC:
/* CC8FC 800CBCFC 27A50010 */  addiu      $a1, $sp, 0x10
/* CC900 800CBD00 0C0321E4 */  jal        osRecvMesg
/* CC904 800CBD04 00003021 */   addu      $a2, $zero, $zero
/* CC908 800CBD08 10500006 */  beq        $v0, $s0, .L800CBD24
/* CC90C 800CBD0C 00000000 */   nop
/* CC910 800CBD10 8FA50010 */  lw         $a1, 0x10($sp)
/* CC914 800CBD14 0C033029 */  jal        __scAppendList
/* CC918 800CBD18 02202021 */   addu      $a0, $s1, $zero
/* CC91C 800CBD1C 08032F3F */  j          .L800CBCFC
/* CC920 800CBD20 26240078 */   addiu     $a0, $s1, 0x78
.L800CBD24:
/* CC924 800CBD24 8E220280 */  lw         $v0, 0x280($s1)
/* CC928 800CBD28 10400008 */  beqz       $v0, .L800CBD4C
/* CC92C 800CBD2C 00000000 */   nop
/* CC930 800CBD30 8E220274 */  lw         $v0, 0x274($s1)
/* CC934 800CBD34 10400006 */  beqz       $v0, .L800CBD50
/* CC938 800CBD38 00000000 */   nop
/* CC93C 800CBD3C 0C033076 */  jal        __scYield
/* CC940 800CBD40 02202021 */   addu      $a0, $s1, $zero
/* CC944 800CBD44 08032F64 */  j          .L800CBD90
/* CC948 800CBD48 00000000 */   nop
.L800CBD4C:
/* CC94C 800CBD4C 8E220274 */  lw         $v0, 0x274($s1)
.L800CBD50:
/* CC950 800CBD50 8E230278 */  lw         $v1, 0x278($s1)
/* CC954 800CBD54 2C420001 */  sltiu      $v0, $v0, 1
/* CC958 800CBD58 14600002 */  bnez       $v1, .L800CBD64
/* CC95C 800CBD5C 00028040 */   sll       $s0, $v0, 1
/* CC960 800CBD60 36100001 */  ori        $s0, $s0, 1
.L800CBD64:
/* CC964 800CBD64 02202021 */  addu       $a0, $s1, $zero
/* CC968 800CBD68 27A50014 */  addiu      $a1, $sp, 0x14
/* CC96C 800CBD6C 27A60018 */  addiu      $a2, $sp, 0x18
/* CC970 800CBD70 0C033084 */  jal        __scSchedule
/* CC974 800CBD74 02003821 */   addu      $a3, $s0, $zero
/* CC978 800CBD78 10500005 */  beq        $v0, $s0, .L800CBD90
/* CC97C 800CBD7C 00000000 */   nop
/* CC980 800CBD80 8FA50014 */  lw         $a1, 0x14($sp)
/* CC984 800CBD84 8FA60018 */  lw         $a2, 0x18($sp)
/* CC988 800CBD88 0C03303F */  jal        __scExec
/* CC98C 800CBD8C 02202021 */   addu      $a0, $s1, $zero
.L800CBD90:
/* CC990 800CBD90 8E300260 */  lw         $s0, 0x260($s1)
/* CC994 800CBD94 12000008 */  beqz       $s0, .L800CBDB8
/* CC998 800CBD98 00000000 */   nop
.L800CBD9C:
/* CC99C 800CBD9C 8E040004 */  lw         $a0, 4($s0)
/* CC9A0 800CBDA0 02202821 */  addu       $a1, $s1, $zero
/* CC9A4 800CBDA4 0C03313C */  jal        osSendMesg
/* CC9A8 800CBDA8 00003021 */   addu      $a2, $zero, $zero
/* CC9AC 800CBDAC 8E100000 */  lw         $s0, ($s0)
/* CC9B0 800CBDB0 1600FFFA */  bnez       $s0, .L800CBD9C
/* CC9B4 800CBDB4 00000000 */   nop
.L800CBDB8:
/* CC9B8 800CBDB8 8FBF0028 */  lw         $ra, 0x28($sp)
/* CC9BC 800CBDBC 8FB10024 */  lw         $s1, 0x24($sp)
/* CC9C0 800CBDC0 8FB00020 */  lw         $s0, 0x20($sp)
/* CC9C4 800CBDC4 03E00008 */  jr         $ra
/* CC9C8 800CBDC8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel __scHandleRSP
/* CC9CC 800CBDCC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CC9D0 800CBDD0 AFB1001C */  sw         $s1, 0x1c($sp)
/* CC9D4 800CBDD4 00808821 */  addu       $s1, $a0, $zero
/* CC9D8 800CBDD8 AFBF0020 */  sw         $ra, 0x20($sp)
/* CC9DC 800CBDDC AFB00018 */  sw         $s0, 0x18($sp)
/* CC9E0 800CBDE0 8E300274 */  lw         $s0, 0x274($s1)
/* CC9E4 800CBDE4 AE200274 */  sw         $zero, 0x274($s1)
/* CC9E8 800CBDE8 8E020004 */  lw         $v0, 4($s0)
/* CC9EC 800CBDEC AFA00010 */  sw         $zero, 0x10($sp)
/* CC9F0 800CBDF0 30420010 */  andi       $v0, $v0, 0x10
/* CC9F4 800CBDF4 10400022 */  beqz       $v0, .L800CBE80
/* CC9F8 800CBDF8 AFA00014 */   sw        $zero, 0x14($sp)
/* CC9FC 800CBDFC 0C03349C */  jal        osSpTaskYielded
/* CCA00 800CBE00 26040010 */   addiu     $a0, $s0, 0x10
/* CCA04 800CBE04 1040001F */  beqz       $v0, .L800CBE84
/* CCA08 800CBE08 02202021 */   addu      $a0, $s1, $zero
/* CCA0C 800CBE0C 8E020004 */  lw         $v0, 4($s0)
/* CCA10 800CBE10 34420020 */  ori        $v0, $v0, 0x20
/* CCA14 800CBE14 0C030C1C */  jal        osGetTime
/* CCA18 800CBE18 AE020004 */   sw        $v0, 4($s0)
/* CCA1C 800CBE1C 8E060058 */  lw         $a2, 0x58($s0)
/* CCA20 800CBE20 8E07005C */  lw         $a3, 0x5c($s0)
/* CCA24 800CBE24 8E040060 */  lw         $a0, 0x60($s0)
/* CCA28 800CBE28 8E050064 */  lw         $a1, 0x64($s0)
/* CCA2C 800CBE2C 8E080008 */  lw         $t0, 8($s0)
/* CCA30 800CBE30 0067482B */  sltu       $t1, $v1, $a3
/* CCA34 800CBE34 00671823 */  subu       $v1, $v1, $a3
/* CCA38 800CBE38 00461023 */  subu       $v0, $v0, $a2
/* CCA3C 800CBE3C 00491023 */  subu       $v0, $v0, $t1
/* CCA40 800CBE40 00A32821 */  addu       $a1, $a1, $v1
/* CCA44 800CBE44 00A3302B */  sltu       $a2, $a1, $v1
/* CCA48 800CBE48 00822021 */  addu       $a0, $a0, $v0
/* CCA4C 800CBE4C 00862021 */  addu       $a0, $a0, $a2
/* CCA50 800CBE50 31080007 */  andi       $t0, $t0, 7
/* CCA54 800CBE54 24020003 */  addiu      $v0, $zero, 3
/* CCA58 800CBE58 AE040060 */  sw         $a0, 0x60($s0)
/* CCA5C 800CBE5C 1502000F */  bne        $t0, $v0, .L800CBE9C
/* CCA60 800CBE60 AE050064 */   sw        $a1, 0x64($s0)
/* CCA64 800CBE64 8E220268 */  lw         $v0, 0x268($s1)
/* CCA68 800CBE68 AE020000 */  sw         $v0, ($s0)
/* CCA6C 800CBE6C 8E220270 */  lw         $v0, 0x270($s1)
/* CCA70 800CBE70 1440000A */  bnez       $v0, .L800CBE9C
/* CCA74 800CBE74 AE300268 */   sw        $s0, 0x268($s1)
/* CCA78 800CBE78 08032FA7 */  j          .L800CBE9C
/* CCA7C 800CBE7C AE300270 */   sw        $s0, 0x270($s1)
.L800CBE80:
/* CCA80 800CBE80 02202021 */  addu       $a0, $s1, $zero
.L800CBE84:
/* CCA84 800CBE84 8E020004 */  lw         $v0, 4($s0)
/* CCA88 800CBE88 02002821 */  addu       $a1, $s0, $zero
/* CCA8C 800CBE8C 2403FFFD */  addiu      $v1, $zero, -3
/* CCA90 800CBE90 00431024 */  and        $v0, $v0, $v1
/* CCA94 800CBE94 0C032FF6 */  jal        __scTaskComplete
/* CCA98 800CBE98 ACA20004 */   sw        $v0, 4($a1)
.L800CBE9C:
/* CCA9C 800CBE9C 8E220274 */  lw         $v0, 0x274($s1)
/* CCAA0 800CBEA0 8E230278 */  lw         $v1, 0x278($s1)
/* CCAA4 800CBEA4 2C420001 */  sltiu      $v0, $v0, 1
/* CCAA8 800CBEA8 14600002 */  bnez       $v1, .L800CBEB4
/* CCAAC 800CBEAC 00028040 */   sll       $s0, $v0, 1
/* CCAB0 800CBEB0 36100001 */  ori        $s0, $s0, 1
.L800CBEB4:
/* CCAB4 800CBEB4 02202021 */  addu       $a0, $s1, $zero
/* CCAB8 800CBEB8 27A50010 */  addiu      $a1, $sp, 0x10
/* CCABC 800CBEBC 27A60014 */  addiu      $a2, $sp, 0x14
/* CCAC0 800CBEC0 0C033084 */  jal        __scSchedule
/* CCAC4 800CBEC4 02003821 */   addu      $a3, $s0, $zero
/* CCAC8 800CBEC8 10500005 */  beq        $v0, $s0, .L800CBEE0
/* CCACC 800CBECC 00000000 */   nop
/* CCAD0 800CBED0 8FA50010 */  lw         $a1, 0x10($sp)
/* CCAD4 800CBED4 8FA60014 */  lw         $a2, 0x14($sp)
/* CCAD8 800CBED8 0C03303F */  jal        __scExec
/* CCADC 800CBEDC 02202021 */   addu      $a0, $s1, $zero
.L800CBEE0:
/* CCAE0 800CBEE0 8FBF0020 */  lw         $ra, 0x20($sp)
/* CCAE4 800CBEE4 8FB1001C */  lw         $s1, 0x1c($sp)
/* CCAE8 800CBEE8 8FB00018 */  lw         $s0, 0x18($sp)
/* CCAEC 800CBEEC 03E00008 */  jr         $ra
/* CCAF0 800CBEF0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __scHandleRDP
/* CCAF4 800CBEF4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CCAF8 800CBEF8 AFB1001C */  sw         $s1, 0x1c($sp)
/* CCAFC 800CBEFC 00808821 */  addu       $s1, $a0, $zero
/* CCB00 800CBF00 AFBF0020 */  sw         $ra, 0x20($sp)
/* CCB04 800CBF04 AFB00018 */  sw         $s0, 0x18($sp)
/* CCB08 800CBF08 8E250278 */  lw         $a1, 0x278($s1)
/* CCB0C 800CBF0C AFA00010 */  sw         $zero, 0x10($sp)
/* CCB10 800CBF10 AFA00014 */  sw         $zero, 0x14($sp)
/* CCB14 800CBF14 AE200278 */  sw         $zero, 0x278($s1)
/* CCB18 800CBF18 8CA20004 */  lw         $v0, 4($a1)
/* CCB1C 800CBF1C 2403FFFE */  addiu      $v1, $zero, -2
/* CCB20 800CBF20 00431024 */  and        $v0, $v0, $v1
/* CCB24 800CBF24 0C032FF6 */  jal        __scTaskComplete
/* CCB28 800CBF28 ACA20004 */   sw        $v0, 4($a1)
/* CCB2C 800CBF2C 8E220274 */  lw         $v0, 0x274($s1)
/* CCB30 800CBF30 8E230278 */  lw         $v1, 0x278($s1)
/* CCB34 800CBF34 2C420001 */  sltiu      $v0, $v0, 1
/* CCB38 800CBF38 14600002 */  bnez       $v1, .L800CBF44
/* CCB3C 800CBF3C 00028040 */   sll       $s0, $v0, 1
/* CCB40 800CBF40 36100001 */  ori        $s0, $s0, 1
.L800CBF44:
/* CCB44 800CBF44 02202021 */  addu       $a0, $s1, $zero
/* CCB48 800CBF48 27A50010 */  addiu      $a1, $sp, 0x10
/* CCB4C 800CBF4C 27A60014 */  addiu      $a2, $sp, 0x14
/* CCB50 800CBF50 0C033084 */  jal        __scSchedule
/* CCB54 800CBF54 02003821 */   addu      $a3, $s0, $zero
/* CCB58 800CBF58 10500005 */  beq        $v0, $s0, .L800CBF70
/* CCB5C 800CBF5C 00000000 */   nop
/* CCB60 800CBF60 8FA50010 */  lw         $a1, 0x10($sp)
/* CCB64 800CBF64 8FA60014 */  lw         $a2, 0x14($sp)
/* CCB68 800CBF68 0C03303F */  jal        __scExec
/* CCB6C 800CBF6C 02202021 */   addu      $a0, $s1, $zero
.L800CBF70:
/* CCB70 800CBF70 8FBF0020 */  lw         $ra, 0x20($sp)
/* CCB74 800CBF74 8FB1001C */  lw         $s1, 0x1c($sp)
/* CCB78 800CBF78 8FB00018 */  lw         $s0, 0x18($sp)
/* CCB7C 800CBF7C 03E00008 */  jr         $ra
/* CCB80 800CBF80 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __scTaskReady
/* CCB84 800CBF84 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CCB88 800CBF88 AFB10014 */  sw         $s1, 0x14($sp)
/* CCB8C 800CBF8C 00808821 */  addu       $s1, $a0, $zero
/* CCB90 800CBF90 AFBF0018 */  sw         $ra, 0x18($sp)
/* CCB94 800CBF94 1220000A */  beqz       $s1, .L800CBFC0
/* CCB98 800CBF98 AFB00010 */   sw        $s0, 0x10($sp)
/* CCB9C 800CBF9C 0C034794 */  jal        osViGetCurrentFramebuffer
/* CCBA0 800CBFA0 00000000 */   nop
/* CCBA4 800CBFA4 0C0347A4 */  jal        osViGetNextFramebuffer
/* CCBA8 800CBFA8 00408021 */   addu      $s0, $v0, $zero
/* CCBAC 800CBFAC 02028026 */  xor        $s0, $s0, $v0
/* CCBB0 800CBFB0 2E100001 */  sltiu      $s0, $s0, 1
/* CCBB4 800CBFB4 00108023 */  negu       $s0, $s0
/* CCBB8 800CBFB8 08032FF1 */  j          .L800CBFC4
/* CCBBC 800CBFBC 02301024 */   and       $v0, $s1, $s0
.L800CBFC0:
/* CCBC0 800CBFC0 00001021 */  addu       $v0, $zero, $zero
.L800CBFC4:
/* CCBC4 800CBFC4 8FBF0018 */  lw         $ra, 0x18($sp)
/* CCBC8 800CBFC8 8FB10014 */  lw         $s1, 0x14($sp)
/* CCBCC 800CBFCC 8FB00010 */  lw         $s0, 0x10($sp)
/* CCBD0 800CBFD0 03E00008 */  jr         $ra
/* CCBD4 800CBFD4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __scTaskComplete
/* CCBD8 800CBFD8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CCBDC 800CBFDC AFB00010 */  sw         $s0, 0x10($sp)
/* CCBE0 800CBFE0 00A08021 */  addu       $s0, $a1, $zero
/* CCBE4 800CBFE4 AFBF0014 */  sw         $ra, 0x14($sp)
/* CCBE8 800CBFE8 8E020004 */  lw         $v0, 4($s0)
/* CCBEC 800CBFEC 30420003 */  andi       $v0, $v0, 3
/* CCBF0 800CBFF0 14400028 */  bnez       $v0, .L800CC094
/* CCBF4 800CBFF4 00001021 */   addu      $v0, $zero, $zero
/* CCBF8 800CBFF8 0C030C1C */  jal        osGetTime
/* CCBFC 800CBFFC 00000000 */   nop
/* CCC00 800CC000 8E040050 */  lw         $a0, 0x50($s0)
/* CCC04 800CC004 8E080058 */  lw         $t0, 0x58($s0)
/* CCC08 800CC008 8E09005C */  lw         $t1, 0x5c($s0)
/* CCC0C 800CC00C 8E060060 */  lw         $a2, 0x60($s0)
/* CCC10 800CC010 8E070064 */  lw         $a3, 0x64($s0)
/* CCC14 800CC014 8E050054 */  lw         $a1, 0x54($s0)
/* CCC18 800CC018 0069502B */  sltu       $t2, $v1, $t1
/* CCC1C 800CC01C 00691823 */  subu       $v1, $v1, $t1
/* CCC20 800CC020 00481023 */  subu       $v0, $v0, $t0
/* CCC24 800CC024 004A1023 */  subu       $v0, $v0, $t2
/* CCC28 800CC028 00E33821 */  addu       $a3, $a3, $v1
/* CCC2C 800CC02C 00E3402B */  sltu       $t0, $a3, $v1
/* CCC30 800CC030 00C23021 */  addu       $a2, $a2, $v0
/* CCC34 800CC034 00C83021 */  addu       $a2, $a2, $t0
/* CCC38 800CC038 AE060060 */  sw         $a2, 0x60($s0)
/* CCC3C 800CC03C AE070064 */  sw         $a3, 0x64($s0)
/* CCC40 800CC040 0C03313C */  jal        osSendMesg
/* CCC44 800CC044 24060001 */   addiu     $a2, $zero, 1
/* CCC48 800CC048 8E030010 */  lw         $v1, 0x10($s0)
/* CCC4C 800CC04C 24020001 */  addiu      $v0, $zero, 1
/* CCC50 800CC050 14620010 */  bne        $v1, $v0, .L800CC094
/* CCC54 800CC054 24030060 */   addiu     $v1, $zero, 0x60
/* CCC58 800CC058 8E020008 */  lw         $v0, 8($s0)
/* CCC5C 800CC05C 30420060 */  andi       $v0, $v0, 0x60
/* CCC60 800CC060 1443000C */  bne        $v0, $v1, .L800CC094
/* CCC64 800CC064 24020001 */   addiu     $v0, $zero, 1
/* CCC68 800CC068 3C02800F */  lui        $v0, %hi(sched_data_firstTime)
/* CCC6C 800CC06C 8C4239CC */  lw         $v0, %lo(sched_data_firstTime)($v0)
/* CCC70 800CC070 10400005 */  beqz       $v0, .L800CC088
/* CCC74 800CC074 00000000 */   nop
/* CCC78 800CC078 0C034738 */  jal        osViBlack
/* CCC7C 800CC07C 00002021 */   addu      $a0, $zero, $zero
/* CCC80 800CC080 3C01800F */  lui        $at, %hi(sched_data_firstTime)
/* CCC84 800CC084 AC2039CC */  sw         $zero, %lo(sched_data_firstTime)($at)
.L800CC088:
/* CCC88 800CC088 0C034958 */  jal        osViSwapBuffer
/* CCC8C 800CC08C 8E04000C */   lw        $a0, 0xc($s0)
/* CCC90 800CC090 24020001 */  addiu      $v0, $zero, 1
.L800CC094:
/* CCC94 800CC094 8FBF0014 */  lw         $ra, 0x14($sp)
/* CCC98 800CC098 8FB00010 */  lw         $s0, 0x10($sp)
/* CCC9C 800CC09C 03E00008 */  jr         $ra
/* CCCA0 800CC0A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __scAppendList
/* CCCA4 800CC0A4 8CA30010 */  lw         $v1, 0x10($a1)
/* CCCA8 800CC0A8 24020002 */  addiu      $v0, $zero, 2
/* CCCAC 800CC0AC 14620009 */  bne        $v1, $v0, .L800CC0D4
/* CCCB0 800CC0B0 00000000 */   nop
/* CCCB4 800CC0B4 8C82026C */  lw         $v0, 0x26c($a0)
/* CCCB8 800CC0B8 50400002 */  beql       $v0, $zero, .L800CC0C4
/* CCCBC 800CC0BC AC850264 */   sw        $a1, 0x264($a0)
/* CCCC0 800CC0C0 AC450000 */  sw         $a1, ($v0)
.L800CC0C4:
/* CCCC4 800CC0C4 24020001 */  addiu      $v0, $zero, 1
/* CCCC8 800CC0C8 AC85026C */  sw         $a1, 0x26c($a0)
/* CCCCC 800CC0CC 0803303A */  j          .L800CC0E8
/* CCCD0 800CC0D0 AC820280 */   sw        $v0, 0x280($a0)
.L800CC0D4:
/* CCCD4 800CC0D4 8C820270 */  lw         $v0, 0x270($a0)
/* CCCD8 800CC0D8 50400002 */  beql       $v0, $zero, .L800CC0E4
/* CCCDC 800CC0DC AC850268 */   sw        $a1, 0x268($a0)
/* CCCE0 800CC0E0 AC450000 */  sw         $a1, ($v0)
.L800CC0E4:
/* CCCE4 800CC0E4 AC850270 */  sw         $a1, 0x270($a0)
.L800CC0E8:
/* CCCE8 800CC0E8 8CA20008 */  lw         $v0, 8($a1)
/* CCCEC 800CC0EC ACA00000 */  sw         $zero, ($a1)
/* CCCF0 800CC0F0 30420003 */  andi       $v0, $v0, 3
/* CCCF4 800CC0F4 03E00008 */  jr         $ra
/* CCCF8 800CC0F8 ACA20004 */   sw        $v0, 4($a1)

glabel __scExec
/* CCCFC 800CC0FC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CCD00 800CC100 AFB3001C */  sw         $s3, 0x1c($sp)
/* CCD04 800CC104 00809821 */  addu       $s3, $a0, $zero
/* CCD08 800CC108 AFB10014 */  sw         $s1, 0x14($sp)
/* CCD0C 800CC10C 00A08821 */  addu       $s1, $a1, $zero
/* CCD10 800CC110 AFB20018 */  sw         $s2, 0x18($sp)
/* CCD14 800CC114 00C09021 */  addu       $s2, $a2, $zero
/* CCD18 800CC118 AFBF0020 */  sw         $ra, 0x20($sp)
/* CCD1C 800CC11C 12200016 */  beqz       $s1, .L800CC178
/* CCD20 800CC120 AFB00010 */   sw        $s0, 0x10($sp)
/* CCD24 800CC124 8E230010 */  lw         $v1, 0x10($s1)
/* CCD28 800CC128 24020002 */  addiu      $v0, $zero, 2
/* CCD2C 800CC12C 14620003 */  bne        $v1, $v0, .L800CC13C
/* CCD30 800CC130 00000000 */   nop
/* CCD34 800CC134 0C034A50 */  jal        osWritebackDCacheAll
/* CCD38 800CC138 00000000 */   nop
.L800CC13C:
/* CCD3C 800CC13C 8E220004 */  lw         $v0, 4($s1)
/* CCD40 800CC140 2403FFCF */  addiu      $v1, $zero, -0x31
/* CCD44 800CC144 00431024 */  and        $v0, $v0, $v1
/* CCD48 800CC148 0C030C1C */  jal        osGetTime
/* CCD4C 800CC14C AE220004 */   sw        $v0, 4($s1)
/* CCD50 800CC150 26300010 */  addiu      $s0, $s1, 0x10
/* CCD54 800CC154 AE220058 */  sw         $v0, 0x58($s1)
/* CCD58 800CC158 AE23005C */  sw         $v1, 0x5c($s1)
/* CCD5C 800CC15C 0C0333DC */  jal        osSpTaskLoad
/* CCD60 800CC160 02002021 */   addu      $a0, $s0, $zero
/* CCD64 800CC164 0C03345F */  jal        osSpTaskStartGo
/* CCD68 800CC168 02002021 */   addu      $a0, $s0, $zero
/* CCD6C 800CC16C 16320002 */  bne        $s1, $s2, .L800CC178
/* CCD70 800CC170 AE710274 */   sw        $s1, 0x274($s3)
/* CCD74 800CC174 AE720278 */  sw         $s2, 0x278($s3)
.L800CC178:
/* CCD78 800CC178 0012182B */  sltu       $v1, $zero, $s2
/* CCD7C 800CC17C 02511026 */  xor        $v0, $s2, $s1
/* CCD80 800CC180 0002102B */  sltu       $v0, $zero, $v0
/* CCD84 800CC184 00621824 */  and        $v1, $v1, $v0
/* CCD88 800CC188 1060000C */  beqz       $v1, .L800CC1BC
/* CCD8C 800CC18C 00000000 */   nop
/* CCD90 800CC190 8E42003C */  lw         $v0, 0x3c($s2)
/* CCD94 800CC194 8E440038 */  lw         $a0, 0x38($s2)
/* CCD98 800CC198 8C460000 */  lw         $a2, ($v0)
/* CCD9C 800CC19C 0C03310C */  jal        osDpSetNextBuffer
/* CCDA0 800CC1A0 8C470004 */   lw        $a3, 4($v0)
/* CCDA4 800CC1A4 24020001 */  addiu      $v0, $zero, 1
/* CCDA8 800CC1A8 3C01800F */  lui        $at, %hi(sched_data_0004)
/* CCDAC 800CC1AC AC2239C4 */  sw         $v0, %lo(sched_data_0004)($at)
/* CCDB0 800CC1B0 3C01800F */  lui        $at, %hi(sched_data_0008)
/* CCDB4 800CC1B4 AC2039C8 */  sw         $zero, %lo(sched_data_0008)($at)
/* CCDB8 800CC1B8 AE720278 */  sw         $s2, 0x278($s3)
.L800CC1BC:
/* CCDBC 800CC1BC 8FBF0020 */  lw         $ra, 0x20($sp)
/* CCDC0 800CC1C0 8FB3001C */  lw         $s3, 0x1c($sp)
/* CCDC4 800CC1C4 8FB20018 */  lw         $s2, 0x18($sp)
/* CCDC8 800CC1C8 8FB10014 */  lw         $s1, 0x14($sp)
/* CCDCC 800CC1CC 8FB00010 */  lw         $s0, 0x10($sp)
/* CCDD0 800CC1D0 03E00008 */  jr         $ra
/* CCDD4 800CC1D4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __scYield
/* CCDD8 800CC1D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CCDDC 800CC1DC AFBF0010 */  sw         $ra, 0x10($sp)
/* CCDE0 800CC1E0 8C840274 */  lw         $a0, 0x274($a0)
/* CCDE4 800CC1E4 8C830010 */  lw         $v1, 0x10($a0)
/* CCDE8 800CC1E8 24020001 */  addiu      $v0, $zero, 1
/* CCDEC 800CC1EC 14620005 */  bne        $v1, $v0, .L800CC204
/* CCDF0 800CC1F0 00000000 */   nop
/* CCDF4 800CC1F4 8C820004 */  lw         $v0, 4($a0)
/* CCDF8 800CC1F8 34420010 */  ori        $v0, $v0, 0x10
/* CCDFC 800CC1FC 0C033494 */  jal        osSpTaskYield
/* CCE00 800CC200 AC820004 */   sw        $v0, 4($a0)
.L800CC204:
/* CCE04 800CC204 8FBF0010 */  lw         $ra, 0x10($sp)
/* CCE08 800CC208 03E00008 */  jr         $ra
/* CCE0C 800CC20C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __scSchedule
/* CCE10 800CC210 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CCE14 800CC214 AFB3001C */  sw         $s3, 0x1c($sp)
/* CCE18 800CC218 00809821 */  addu       $s3, $a0, $zero
/* CCE1C 800CC21C AFB40020 */  sw         $s4, 0x20($sp)
/* CCE20 800CC220 00A0A021 */  addu       $s4, $a1, $zero
/* CCE24 800CC224 AFB50024 */  sw         $s5, 0x24($sp)
/* CCE28 800CC228 00C0A821 */  addu       $s5, $a2, $zero
/* CCE2C 800CC22C AFB20018 */  sw         $s2, 0x18($sp)
/* CCE30 800CC230 00E09021 */  addu       $s2, $a3, $zero
/* CCE34 800CC234 AFB60028 */  sw         $s6, 0x28($sp)
/* CCE38 800CC238 AFBF002C */  sw         $ra, 0x2c($sp)
/* CCE3C 800CC23C AFB10014 */  sw         $s1, 0x14($sp)
/* CCE40 800CC240 AFB00010 */  sw         $s0, 0x10($sp)
/* CCE44 800CC244 8E620280 */  lw         $v0, 0x280($s3)
/* CCE48 800CC248 8E710268 */  lw         $s1, 0x268($s3)
/* CCE4C 800CC24C 8E630264 */  lw         $v1, 0x264($s3)
/* CCE50 800CC250 10400014 */  beqz       $v0, .L800CC2A4
/* CCE54 800CC254 0240B021 */   addu      $s6, $s2, $zero
/* CCE58 800CC258 32420002 */  andi       $v0, $s2, 2
/* CCE5C 800CC25C 10400011 */  beqz       $v0, .L800CC2A4
/* CCE60 800CC260 00000000 */   nop
/* CCE64 800CC264 52200006 */  beql       $s1, $zero, .L800CC280
/* CCE68 800CC268 AE830000 */   sw        $v1, ($s4)
/* CCE6C 800CC26C 8E220008 */  lw         $v0, 8($s1)
/* CCE70 800CC270 30420010 */  andi       $v0, $v0, 0x10
/* CCE74 800CC274 54400049 */  bnel       $v0, $zero, .L800CC39C
/* CCE78 800CC278 AE910000 */   sw        $s1, ($s4)
/* CCE7C 800CC27C AE830000 */  sw         $v1, ($s4)
.L800CC280:
/* CCE80 800CC280 8E620264 */  lw         $v0, 0x264($s3)
/* CCE84 800CC284 AE600280 */  sw         $zero, 0x280($s3)
/* CCE88 800CC288 8C430000 */  lw         $v1, ($v0)
/* CCE8C 800CC28C 2402FFFD */  addiu      $v0, $zero, -3
/* CCE90 800CC290 02429024 */  and        $s2, $s2, $v0
/* CCE94 800CC294 14600051 */  bnez       $v1, .L800CC3DC
/* CCE98 800CC298 AE630264 */   sw        $v1, 0x264($s3)
/* CCE9C 800CC29C 080330F7 */  j          .L800CC3DC
/* CCEA0 800CC2A0 AE60026C */   sw        $zero, 0x26c($s3)
.L800CC2A4:
/* CCEA4 800CC2A4 52200009 */  beql       $s1, $zero, .L800CC2CC
/* CCEA8 800CC2A8 00001021 */   addu      $v0, $zero, $zero
/* CCEAC 800CC2AC 0C034794 */  jal        osViGetCurrentFramebuffer
/* CCEB0 800CC2B0 00000000 */   nop
/* CCEB4 800CC2B4 0C0347A4 */  jal        osViGetNextFramebuffer
/* CCEB8 800CC2B8 00408021 */   addu      $s0, $v0, $zero
/* CCEBC 800CC2BC 02028026 */  xor        $s0, $s0, $v0
/* CCEC0 800CC2C0 2E100001 */  sltiu      $s0, $s0, 1
/* CCEC4 800CC2C4 00108023 */  negu       $s0, $s0
/* CCEC8 800CC2C8 02301024 */  and        $v0, $s1, $s0
.L800CC2CC:
/* CCECC 800CC2CC 10400043 */  beqz       $v0, .L800CC3DC
/* CCED0 800CC2D0 00000000 */   nop
/* CCED4 800CC2D4 8E220008 */  lw         $v0, 8($s1)
/* CCED8 800CC2D8 30420007 */  andi       $v0, $v0, 7
/* CCEDC 800CC2DC 2443FFFF */  addiu      $v1, $v0, -1
/* CCEE0 800CC2E0 2C620007 */  sltiu      $v0, $v1, 7
/* CCEE4 800CC2E4 1040003D */  beqz       $v0, .L800CC3DC
/* CCEE8 800CC2E8 00031080 */   sll       $v0, $v1, 2
/* CCEEC 800CC2EC 3C01800E */  lui        $at, %hi(jtbl_800E54E0)
/* CCEF0 800CC2F0 00220821 */  addu       $at, $at, $v0
/* CCEF4 800CC2F4 8C2254E0 */  lw         $v0, %lo(jtbl_800E54E0)($at)
/* CCEF8 800CC2F8 00400008 */  jr         $v0
/* CCEFC 800CC2FC 00000000 */   nop
glabel L800CC300_CCF00
/* CCF00 800CC300 8E220004 */  lw         $v0, 4($s1)
/* CCF04 800CC304 30420020 */  andi       $v0, $v0, 0x20
/* CCF08 800CC308 10400011 */  beqz       $v0, .L800CC350
/* CCF0C 800CC30C 32420002 */   andi      $v0, $s2, 2
/* CCF10 800CC310 10400032 */  beqz       $v0, .L800CC3DC
/* CCF14 800CC314 2403FFFD */   addiu     $v1, $zero, -3
/* CCF18 800CC318 AE910000 */  sw         $s1, ($s4)
/* CCF1C 800CC31C 8E220004 */  lw         $v0, 4($s1)
/* CCF20 800CC320 30420001 */  andi       $v0, $v0, 1
/* CCF24 800CC324 10400004 */  beqz       $v0, .L800CC338
/* CCF28 800CC328 02439024 */   and       $s2, $s2, $v1
/* CCF2C 800CC32C AEB10000 */  sw         $s1, ($s5)
/* CCF30 800CC330 2402FFFE */  addiu      $v0, $zero, -2
/* CCF34 800CC334 02429024 */  and        $s2, $s2, $v0
.L800CC338:
/* CCF38 800CC338 8E620268 */  lw         $v0, 0x268($s3)
/* CCF3C 800CC33C 8C420000 */  lw         $v0, ($v0)
/* CCF40 800CC340 14400026 */  bnez       $v0, .L800CC3DC
/* CCF44 800CC344 AE620268 */   sw        $v0, 0x268($s3)
/* CCF48 800CC348 080330F7 */  j          .L800CC3DC
/* CCF4C 800CC34C AE600270 */   sw        $zero, 0x270($s3)
.L800CC350:
/* CCF50 800CC350 24020003 */  addiu      $v0, $zero, 3
/* CCF54 800CC354 16420021 */  bne        $s2, $v0, .L800CC3DC
/* CCF58 800CC358 00000000 */   nop
/* CCF5C 800CC35C AEB10000 */  sw         $s1, ($s5)
/* CCF60 800CC360 AE910000 */  sw         $s1, ($s4)
/* CCF64 800CC364 8E620268 */  lw         $v0, 0x268($s3)
/* CCF68 800CC368 8C420000 */  lw         $v0, ($v0)
/* CCF6C 800CC36C 00009021 */  addu       $s2, $zero, $zero
/* CCF70 800CC370 1440001A */  bnez       $v0, .L800CC3DC
/* CCF74 800CC374 AE620268 */   sw        $v0, 0x268($s3)
/* CCF78 800CC378 080330F7 */  j          .L800CC3DC
/* CCF7C 800CC37C AE600270 */   sw        $zero, 0x270($s3)
glabel L800CC380_CCF80
/* CCF80 800CC380 8E230004 */  lw         $v1, 4($s1)
/* CCF84 800CC384 30620002 */  andi       $v0, $v1, 2
/* CCF88 800CC388 10400007 */  beqz       $v0, .L800CC3A8
/* CCF8C 800CC38C 32420002 */   andi      $v0, $s2, 2
/* CCF90 800CC390 10400012 */  beqz       $v0, .L800CC3DC
/* CCF94 800CC394 00000000 */   nop
/* CCF98 800CC398 AE910000 */  sw         $s1, ($s4)
.L800CC39C:
/* CCF9C 800CC39C 2402FFFD */  addiu      $v0, $zero, -3
/* CCFA0 800CC3A0 080330F7 */  j          .L800CC3DC
/* CCFA4 800CC3A4 02429024 */   and       $s2, $s2, $v0
.L800CC3A8:
/* CCFA8 800CC3A8 30620001 */  andi       $v0, $v1, 1
/* CCFAC 800CC3AC 1040000B */  beqz       $v0, .L800CC3DC
/* CCFB0 800CC3B0 32420001 */   andi      $v0, $s2, 1
/* CCFB4 800CC3B4 10400009 */  beqz       $v0, .L800CC3DC
/* CCFB8 800CC3B8 00000000 */   nop
/* CCFBC 800CC3BC AEB10000 */  sw         $s1, ($s5)
/* CCFC0 800CC3C0 8E620268 */  lw         $v0, 0x268($s3)
/* CCFC4 800CC3C4 8C430000 */  lw         $v1, ($v0)
/* CCFC8 800CC3C8 2402FFFE */  addiu      $v0, $zero, -2
/* CCFCC 800CC3CC 02429024 */  and        $s2, $s2, $v0
/* CCFD0 800CC3D0 14600002 */  bnez       $v1, .L800CC3DC
/* CCFD4 800CC3D4 AE630268 */   sw        $v1, 0x268($s3)
/* CCFD8 800CC3D8 AE600270 */  sw         $zero, 0x270($s3)
.L800CC3DC:
glabel L800CC3DC_CCFDC
/* CCFDC 800CC3DC 12560006 */  beq        $s2, $s6, .L800CC3F8
/* CCFE0 800CC3E0 02602021 */   addu      $a0, $s3, $zero
/* CCFE4 800CC3E4 02802821 */  addu       $a1, $s4, $zero
/* CCFE8 800CC3E8 02A03021 */  addu       $a2, $s5, $zero
/* CCFEC 800CC3EC 0C033084 */  jal        __scSchedule
/* CCFF0 800CC3F0 02403821 */   addu      $a3, $s2, $zero
/* CCFF4 800CC3F4 00409021 */  addu       $s2, $v0, $zero
.L800CC3F8:
/* CCFF8 800CC3F8 02401021 */  addu       $v0, $s2, $zero
/* CCFFC 800CC3FC 8FBF002C */  lw         $ra, 0x2c($sp)
/* CD000 800CC400 8FB60028 */  lw         $s6, 0x28($sp)
/* CD004 800CC404 8FB50024 */  lw         $s5, 0x24($sp)
/* CD008 800CC408 8FB40020 */  lw         $s4, 0x20($sp)
/* CD00C 800CC40C 8FB3001C */  lw         $s3, 0x1c($sp)
/* CD010 800CC410 8FB20018 */  lw         $s2, 0x18($sp)
/* CD014 800CC414 8FB10014 */  lw         $s1, 0x14($sp)
/* CD018 800CC418 8FB00010 */  lw         $s0, 0x10($sp)
/* CD01C 800CC41C 03E00008 */  jr         $ra
/* CD020 800CC420 27BD0030 */   addiu     $sp, $sp, 0x30
/* CD024 800CC424 00000000 */  nop
/* CD028 800CC428 00000000 */  nop
/* CD02C 800CC42C 00000000 */  nop
