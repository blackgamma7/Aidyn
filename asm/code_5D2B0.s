.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel load_cinematic
/* 5D2B0 8005C6B0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5D2B4 8005C6B4 AFB40020 */  sw         $s4, 0x20($sp)
/* 5D2B8 8005C6B8 3094FFFF */  andi       $s4, $a0, 0xffff
/* 5D2BC 8005C6BC AFB00010 */  sw         $s0, 0x10($sp)
/* 5D2C0 8005C6C0 3C10800E */  lui        $s0, %hi(cinematicStruct)
/* 5D2C4 8005C6C4 26107E70 */  addiu      $s0, $s0, %lo(cinematicStruct)
/* 5D2C8 8005C6C8 02002021 */  addu       $a0, $s0, $zero
/* 5D2CC 8005C6CC AFB3001C */  sw         $s3, 0x1c($sp)
/* 5D2D0 8005C6D0 30B3FFFF */  andi       $s3, $a1, 0xffff
/* 5D2D4 8005C6D4 00002821 */  addu       $a1, $zero, $zero
/* 5D2D8 8005C6D8 AFB20018 */  sw         $s2, 0x18($sp)
/* 5D2DC 8005C6DC 00C09021 */  addu       $s2, $a2, $zero
/* 5D2E0 8005C6E0 AFB10014 */  sw         $s1, 0x14($sp)
/* 5D2E4 8005C6E4 00148900 */  sll        $s1, $s4, 4
/* 5D2E8 8005C6E8 3C02800F */  lui        $v0, %hi(cinematic_dat_pointers)
/* 5D2EC 8005C6EC 2442F2F0 */  addiu      $v0, $v0, %lo(cinematic_dat_pointers)
/* 5D2F0 8005C6F0 02228821 */  addu       $s1, $s1, $v0
/* 5D2F4 8005C6F4 AFBF0024 */  sw         $ra, 0x24($sp)
/* 5D2F8 8005C6F8 0C026380 */  jal        Calloc
/* 5D2FC 8005C6FC 24060030 */   addiu     $a2, $zero, 0x30
/* 5D300 8005C700 2604FD30 */  addiu      $a0, $s0, -0x2d0
/* 5D304 8005C704 24050001 */  addiu      $a1, $zero, 1
/* 5D308 8005C708 8E230000 */  lw         $v1, ($s1)
/* 5D30C 8005C70C 8E260004 */  lw         $a2, 4($s1)
/* 5D310 8005C710 8E270008 */  lw         $a3, 8($s1)
/* 5D314 8005C714 8E28000C */  lw         $t0, 0xc($s1)
/* 5D318 8005C718 24020001 */  addiu      $v0, $zero, 1
/* 5D31C 8005C71C A602001E */  sh         $v0, 0x1e($s0)
/* 5D320 8005C720 A6130022 */  sh         $s3, 0x22($s0)
/* 5D324 8005C724 AE120028 */  sw         $s2, 0x28($s0)
/* 5D328 8005C728 AE030014 */  sw         $v1, 0x14($s0)
/* 5D32C 8005C72C AE06000C */  sw         $a2, 0xc($s0)
/* 5D330 8005C730 AE070018 */  sw         $a3, 0x18($s0)
/* 5D334 8005C734 0C015871 */  jal        func_800561C4
/* 5D338 8005C738 AE080010 */   sw        $t0, 0x10($s0)
/* 5D33C 8005C73C 0C0173F0 */  jal        cinematicFade_init
/* 5D340 8005C740 02802021 */   addu      $a0, $s4, $zero
/* 5D344 8005C744 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5D348 8005C748 8FB40020 */  lw         $s4, 0x20($sp)
/* 5D34C 8005C74C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5D350 8005C750 8FB20018 */  lw         $s2, 0x18($sp)
/* 5D354 8005C754 8FB10014 */  lw         $s1, 0x14($sp)
/* 5D358 8005C758 8FB00010 */  lw         $s0, 0x10($sp)
/* 5D35C 8005C75C 03E00008 */  jr         $ra
/* 5D360 8005C760 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_cinematic_func
/* 5D364 8005C764 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 5D368 8005C768 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5D36C 8005C76C AFB00010 */  sw         $s0, 0x10($sp)
/* 5D370 8005C770 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 5D374 8005C774 AFB60028 */  sw         $s6, 0x28($sp)
/* 5D378 8005C778 0080B021 */  addu       $s6, $a0, $zero
/* 5D37C 8005C77C AFB10014 */  sw         $s1, 0x14($sp)
/* 5D380 8005C780 261115C8 */  addiu      $s1, $s0, 0x15c8
/* 5D384 8005C784 3C02800F */  lui        $v0, 0x800f
/* 5D388 8005C788 AFB50024 */  sw         $s5, 0x24($sp)
/* 5D38C 8005C78C 0040A821 */  addu       $s5, $v0, $zero
/* 5D390 8005C790 AFBF0030 */  sw         $ra, 0x30($sp)
/* 5D394 8005C794 AFB7002C */  sw         $s7, 0x2c($sp)
/* 5D398 8005C798 AFB40020 */  sw         $s4, 0x20($sp)
/* 5D39C 8005C79C AFB3001C */  sw         $s3, 0x1c($sp)
/* 5D3A0 8005C7A0 AFB20018 */  sw         $s2, 0x18($sp)
/* 5D3A4 8005C7A4 92140040 */  lbu        $s4, 0x40($s0)
/* 5D3A8 8005C7A8 9043F330 */  lbu        $v1, -0xcd0($v0)
/* 5D3AC 8005C7AC 10600008 */  beqz       $v1, .L8005C7D0
/* 5D3B0 8005C7B0 8ED30000 */   lw        $s3, ($s6)
/* 5D3B4 8005C7B4 0C0173EB */  jal        noop_8005cfac
/* 5D3B8 8005C7B8 00000000 */   nop
/* 5D3BC 8005C7BC 96021E24 */  lhu        $v0, 0x1e24($s0)
/* 5D3C0 8005C7C0 14400046 */  bnez       $v0, .L8005C8DC
/* 5D3C4 8005C7C4 02801021 */   addu      $v0, $s4, $zero
/* 5D3C8 8005C7C8 0C017269 */  jal        func_8005C9A4
/* 5D3CC 8005C7CC A2A0F330 */   sb        $zero, -0xcd0($s5)
.L8005C7D0:
/* 5D3D0 8005C7D0 0C0172D2 */  jal        cinematic_controls
/* 5D3D4 8005C7D4 24120001 */   addiu     $s2, $zero, 1
/* 5D3D8 8005C7D8 96230020 */  lhu        $v1, 0x20($s1)
/* 5D3DC 8005C7DC 1072000C */  beq        $v1, $s2, .L8005C810
/* 5D3E0 8005C7E0 00408021 */   addu      $s0, $v0, $zero
/* 5D3E4 8005C7E4 28620002 */  slti       $v0, $v1, 2
/* 5D3E8 8005C7E8 10400005 */  beqz       $v0, .L8005C800
/* 5D3EC 8005C7EC 24020002 */   addiu     $v0, $zero, 2
/* 5D3F0 8005C7F0 10600026 */  beqz       $v1, .L8005C88C
/* 5D3F4 8005C7F4 3C17800F */   lui       $s7, %hi(D_800EF331)
/* 5D3F8 8005C7F8 0801722B */  j          .L8005C8AC
/* 5D3FC 8005C7FC 92E2F331 */   lbu       $v0, %lo(D_800EF331)($s7)
.L8005C800:
/* 5D400 8005C800 10620027 */  beq        $v1, $v0, .L8005C8A0
/* 5D404 8005C804 3C17800F */   lui       $s7, %hi(D_800EF331)
/* 5D408 8005C808 0801722B */  j          .L8005C8AC
/* 5D40C 8005C80C 92E2F331 */   lbu       $v0, %lo(D_800EF331)($s7)
.L8005C810:
/* 5D410 8005C810 9622001E */  lhu        $v0, 0x1e($s1)
/* 5D414 8005C814 50400005 */  beql       $v0, $zero, .L8005C82C
/* 5D418 8005C818 8E230004 */   lw        $v1, 4($s1)
/* 5D41C 8005C81C A620001E */  sh         $zero, 0x1e($s1)
/* 5D420 8005C820 0C017327 */  jal        func_loading_cinematics
/* 5D424 8005C824 24100001 */   addiu     $s0, $zero, 1
/* 5D428 8005C828 8E230004 */  lw         $v1, 4($s1)
.L8005C82C:
/* 5D42C 8005C82C 1060001E */  beqz       $v1, .L8005C8A8
/* 5D430 8005C830 3C17800F */   lui       $s7, %hi(D_800EF331)
/* 5D434 8005C834 8E220000 */  lw         $v0, ($s1)
/* 5D438 8005C838 5040001C */  beql       $v0, $zero, .L8005C8AC
/* 5D43C 8005C83C 92E2F331 */   lbu       $v0, %lo(D_800EF331)($s7)
/* 5D440 8005C840 8C640020 */  lw         $a0, 0x20($v1)
/* 5D444 8005C844 944301F8 */  lhu        $v1, 0x1f8($v0)
/* 5D448 8005C848 8C82000C */  lw         $v0, 0xc($a0)
/* 5D44C 8005C84C 00701821 */  addu       $v1, $v1, $s0
/* 5D450 8005C850 2442FFFF */  addiu      $v0, $v0, -1
/* 5D454 8005C854 0062182A */  slt        $v1, $v1, $v0
/* 5D458 8005C858 14600005 */  bnez       $v1, .L8005C870
/* 5D45C 8005C85C 02602021 */   addu      $a0, $s3, $zero
/* 5D460 8005C860 0C017242 */  jal        clear_cinematic_borgs
/* 5D464 8005C864 00000000 */   nop
/* 5D468 8005C868 0801722A */  j          .L8005C8A8
/* 5D46C 8005C86C A632001E */   sh        $s2, 0x1e($s1)
.L8005C870:
/* 5D470 8005C870 0C0172F9 */  jal        cinematic_increment
/* 5D474 8005C874 02002821 */   addu      $a1, $s0, $zero
/* 5D478 8005C878 00402021 */  addu       $a0, $v0, $zero
/* 5D47C 8005C87C 0C017410 */  jal        cinematic_fade
/* 5D480 8005C880 02002821 */   addu      $a1, $s0, $zero
/* 5D484 8005C884 0801722A */  j          .L8005C8A8
/* 5D488 8005C888 00409821 */   addu      $s3, $v0, $zero
.L8005C88C:
/* 5D48C 8005C88C 0C017242 */  jal        clear_cinematic_borgs
/* 5D490 8005C890 00000000 */   nop
/* 5D494 8005C894 24020002 */  addiu      $v0, $zero, 2
/* 5D498 8005C898 0801722A */  j          .L8005C8A8
/* 5D49C 8005C89C A6220020 */   sh        $v0, 0x20($s1)
.L8005C8A0:
/* 5D4A0 8005C8A0 3C02800F */  lui        $v0, %hi(D_800EF331)
/* 5D4A4 8005C8A4 A052F331 */  sb         $s2, %lo(D_800EF331)($v0)
.L8005C8A8:
/* 5D4A8 8005C8A8 92E2F331 */  lbu        $v0, -0xccf($s7)
.L8005C8AC:
/* 5D4AC 8005C8AC 10400005 */  beqz       $v0, .L8005C8C4
/* 5D4B0 8005C8B0 24020001 */   addiu     $v0, $zero, 1
/* 5D4B4 8005C8B4 A2A2F330 */  sb         $v0, -0xcd0($s5)
/* 5D4B8 8005C8B8 0C017294 */  jal        cinematic_case_switch
/* 5D4BC 8005C8BC A2E0F331 */   sb        $zero, -0xccf($s7)
/* 5D4C0 8005C8C0 3054FFFF */  andi       $s4, $v0, 0xffff
.L8005C8C4:
/* 5D4C4 8005C8C4 02602021 */  addu       $a0, $s3, $zero
/* 5D4C8 8005C8C8 00102C00 */  sll        $a1, $s0, 0x10
/* 5D4CC 8005C8CC 0C00B703 */  jal        func_with_debug_queue
/* 5D4D0 8005C8D0 00052C03 */   sra       $a1, $a1, 0x10
/* 5D4D4 8005C8D4 AEC20000 */  sw         $v0, ($s6)
/* 5D4D8 8005C8D8 02801021 */  addu       $v0, $s4, $zero
.L8005C8DC:
/* 5D4DC 8005C8DC 8FBF0030 */  lw         $ra, 0x30($sp)
/* 5D4E0 8005C8E0 8FB7002C */  lw         $s7, 0x2c($sp)
/* 5D4E4 8005C8E4 8FB60028 */  lw         $s6, 0x28($sp)
/* 5D4E8 8005C8E8 8FB50024 */  lw         $s5, 0x24($sp)
/* 5D4EC 8005C8EC 8FB40020 */  lw         $s4, 0x20($sp)
/* 5D4F0 8005C8F0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5D4F4 8005C8F4 8FB20018 */  lw         $s2, 0x18($sp)
/* 5D4F8 8005C8F8 8FB10014 */  lw         $s1, 0x14($sp)
/* 5D4FC 8005C8FC 8FB00010 */  lw         $s0, 0x10($sp)
/* 5D500 8005C900 03E00008 */  jr         $ra
/* 5D504 8005C904 27BD0038 */   addiu     $sp, $sp, 0x38

glabel clear_cinematic_borgs
/* 5D508 8005C908 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5D50C 8005C90C AFB10014 */  sw         $s1, 0x14($sp)
/* 5D510 8005C910 3C11800E */  lui        $s1, %hi(cinematicStruct)
/* 5D514 8005C914 AFB00010 */  sw         $s0, 0x10($sp)
/* 5D518 8005C918 26307E70 */  addiu      $s0, $s1, %lo(cinematicStruct)
/* 5D51C 8005C91C AFBF0018 */  sw         $ra, 0x18($sp)
/* 5D520 8005C920 8E040004 */  lw         $a0, 4($s0)
/* 5D524 8005C924 10800009 */  beqz       $a0, .L8005C94C
/* 5D528 8005C928 8E227E70 */   lw        $v0, 0x7e70($s1)
/* 5D52C 8005C92C 0C027E36 */  jal        clear_borg6
/* 5D530 8005C930 00000000 */   nop
/* 5D534 8005C934 2604005C */  addiu      $a0, $s0, 0x5c
/* 5D538 8005C938 26050004 */  addiu      $a1, $s0, 4
/* 5D53C 8005C93C 24060002 */  addiu      $a2, $zero, 2
/* 5D540 8005C940 0C035867 */  jal        AllocFreeQueueItem
/* 5D544 8005C944 00003821 */   addu      $a3, $zero, $zero
/* 5D548 8005C948 8E227E70 */  lw         $v0, 0x7e70($s1)
.L8005C94C:
/* 5D54C 8005C94C 10400005 */  beqz       $v0, .L8005C964
/* 5D550 8005C950 2604005C */   addiu     $a0, $s0, 0x5c
/* 5D554 8005C954 02002821 */  addu       $a1, $s0, $zero
/* 5D558 8005C958 24060001 */  addiu      $a2, $zero, 1
/* 5D55C 8005C95C 0C035867 */  jal        AllocFreeQueueItem
/* 5D560 8005C960 00003821 */   addu      $a3, $zero, $zero
.L8005C964:
/* 5D564 8005C964 8E020008 */  lw         $v0, 8($s0)
/* 5D568 8005C968 1040000A */  beqz       $v0, .L8005C994
/* 5D56C 8005C96C 8FBF0018 */   lw        $ra, 0x18($sp)
/* 5D570 8005C970 9204002C */  lbu        $a0, 0x2c($s0)
/* 5D574 8005C974 0C026972 */  jal        dcm_remove_func
/* 5D578 8005C978 8E050024 */   lw        $a1, 0x24($s0)
/* 5D57C 8005C97C 2604005C */  addiu      $a0, $s0, 0x5c
/* 5D580 8005C980 26050008 */  addiu      $a1, $s0, 8
/* 5D584 8005C984 24060008 */  addiu      $a2, $zero, 8
/* 5D588 8005C988 0C035867 */  jal        AllocFreeQueueItem
/* 5D58C 8005C98C 00003821 */   addu      $a3, $zero, $zero
/* 5D590 8005C990 8FBF0018 */  lw         $ra, 0x18($sp)
.L8005C994:
/* 5D594 8005C994 8FB10014 */  lw         $s1, 0x14($sp)
/* 5D598 8005C998 8FB00010 */  lw         $s0, 0x10($sp)
/* 5D59C 8005C99C 03E00008 */  jr         $ra
/* 5D5A0 8005C9A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005C9A4
/* 5D5A4 8005C9A4 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 5D5A8 8005C9A8 24040002 */  addiu      $a0, $zero, 2
/* 5D5AC 8005C9AC 00002821 */  addu       $a1, $zero, $zero
/* 5D5B0 8005C9B0 00003021 */  addu       $a2, $zero, $zero
/* 5D5B4 8005C9B4 AFB00110 */  sw         $s0, 0x110($sp)
/* 5D5B8 8005C9B8 3C10800E */  lui        $s0, %hi(cinematicStruct)
/* 5D5BC 8005C9BC 26107E70 */  addiu      $s0, $s0, %lo(cinematicStruct)
/* 5D5C0 8005C9C0 24020001 */  addiu      $v0, $zero, 1
/* 5D5C4 8005C9C4 AFBF0118 */  sw         $ra, 0x118($sp)
/* 5D5C8 8005C9C8 AFB10114 */  sw         $s1, 0x114($sp)
/* 5D5CC 8005C9CC 0C00897E */  jal        SetBackgroundType
/* 5D5D0 8005C9D0 A6020020 */   sh        $v0, 0x20($s0)
/* 5D5D4 8005C9D4 2611EA38 */  addiu      $s1, $s0, -0x15c8
/* 5D5D8 8005C9D8 8E221010 */  lw         $v0, 0x1010($s1)
/* 5D5DC 8005C9DC 10400004 */  beqz       $v0, .L8005C9F0
/* 5D5E0 8005C9E0 24040001 */   addiu     $a0, $zero, 1
/* 5D5E4 8005C9E4 0C004606 */  jal        clear_music_values
/* 5D5E8 8005C9E8 8630101C */   lh        $s0, 0x101c($s1)
/* 5D5EC 8005C9EC A630101A */  sh         $s0, 0x101a($s1)
.L8005C9F0:
/* 5D5F0 8005C9F0 27A40010 */  addiu      $a0, $sp, 0x10
/* 5D5F4 8005C9F4 00002821 */  addu       $a1, $zero, $zero
/* 5D5F8 8005C9F8 0C026380 */  jal        Calloc
/* 5D5FC 8005C9FC 24060100 */   addiu     $a2, $zero, 0x100
/* 5D600 8005CA00 8E3015F8 */  lw         $s0, 0x15f8($s1)
/* 5D604 8005CA04 12000007 */  beqz       $s0, .L8005CA24
/* 5D608 8005CA08 00000000 */   nop
/* 5D60C 8005CA0C 8E100000 */  lw         $s0, ($s0)
/* 5D610 8005CA10 12000004 */  beqz       $s0, .L8005CA24
/* 5D614 8005CA14 00000000 */   nop
/* 5D618 8005CA18 8E050004 */  lw         $a1, 4($s0)
/* 5D61C 8005CA1C 0C02626C */  jal        copy_string
/* 5D620 8005CA20 27A40010 */   addiu     $a0, $sp, 0x10
.L8005CA24:
/* 5D624 8005CA24 0C00B5E6 */  jal        memmaker_func_A
/* 5D628 8005CA28 00000000 */   nop
/* 5D62C 8005CA2C 0C017508 */  jal        cinematictext_init
/* 5D630 8005CA30 27A40010 */   addiu     $a0, $sp, 0x10
/* 5D634 8005CA34 0C0271BF */  jal        cont_delay
/* 5D638 8005CA38 00002021 */   addu      $a0, $zero, $zero
/* 5D63C 8005CA3C 8FBF0118 */  lw         $ra, 0x118($sp)
/* 5D640 8005CA40 8FB10114 */  lw         $s1, 0x114($sp)
/* 5D644 8005CA44 8FB00110 */  lw         $s0, 0x110($sp)
/* 5D648 8005CA48 03E00008 */  jr         $ra
/* 5D64C 8005CA4C 27BD0120 */   addiu     $sp, $sp, 0x120

glabel cinematic_case_switch
/* 5D650 8005CA50 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5D654 8005CA54 3C02800E */  lui        $v0, %hi(cinematicStruct)
/* 5D658 8005CA58 AFB00010 */  sw         $s0, 0x10($sp)
/* 5D65C 8005CA5C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5D660 8005CA60 0C017541 */  jal        Cinematictext_free
/* 5D664 8005CA64 24507E70 */   addiu     $s0, $v0, %lo(cinematicStruct)
/* 5D668 8005CA68 0C00B60A */  jal        memmaker_func_B
/* 5D66C 8005CA6C 00000000 */   nop
/* 5D670 8005CA70 8E050014 */  lw         $a1, 0x14($s0)
/* 5D674 8005CA74 8CA20000 */  lw         $v0, ($a1)
/* 5D678 8005CA78 10400008 */  beqz       $v0, .L8005CA9C
/* 5D67C 8005CA7C 00002021 */   addu      $a0, $zero, $zero
/* 5D680 8005CA80 24820001 */  addiu      $v0, $a0, 1
.L8005CA84:
/* 5D684 8005CA84 3044FFFF */  andi       $a0, $v0, 0xffff
/* 5D688 8005CA88 00041880 */  sll        $v1, $a0, 2
/* 5D68C 8005CA8C 00651821 */  addu       $v1, $v1, $a1
/* 5D690 8005CA90 8C620000 */  lw         $v0, ($v1)
/* 5D694 8005CA94 1440FFFB */  bnez       $v0, .L8005CA84
/* 5D698 8005CA98 24820001 */   addiu     $v0, $a0, 1
.L8005CA9C:
/* 5D69C 8005CA9C 8E02000C */  lw         $v0, 0xc($s0)
/* 5D6A0 8005CAA0 00041840 */  sll        $v1, $a0, 1
/* 5D6A4 8005CAA4 00621821 */  addu       $v1, $v1, $v0
/* 5D6A8 8005CAA8 94640000 */  lhu        $a0, ($v1)
/* 5D6AC 8005CAAC 0C00918D */  jal        setEventFlag
/* 5D6B0 8005CAB0 24050001 */   addiu     $a1, $zero, 1
/* 5D6B4 8005CAB4 0C0089E4 */  jal        func_80022790
/* 5D6B8 8005CAB8 00000000 */   nop
/* 5D6BC 8005CABC 96030022 */  lhu        $v1, 0x22($s0)
/* 5D6C0 8005CAC0 2C620005 */  sltiu      $v0, $v1, 5
/* 5D6C4 8005CAC4 1040001B */  beqz       $v0, .L8005CB34
/* 5D6C8 8005CAC8 3C02800E */   lui       $v0, %hi(D_800DF090)
/* 5D6CC 8005CACC 2442F090 */  addiu      $v0, $v0, %lo(D_800DF090)
/* 5D6D0 8005CAD0 00031880 */  sll        $v1, $v1, 2
/* 5D6D4 8005CAD4 00621821 */  addu       $v1, $v1, $v0
/* 5D6D8 8005CAD8 8C640000 */  lw         $a0, ($v1)
/* 5D6DC 8005CADC 00800008 */  jr         $a0
/* 5D6E0 8005CAE0 00000000 */   nop
/* 5D6E4 8005CAE4 0C0173A3 */  jal        load_world_map
/* 5D6E8 8005CAE8 00000000 */   nop
/* 5D6EC 8005CAEC 080172CF */  j          .L8005CB3C
/* 5D6F0 8005CAF0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5D6F4 8005CAF4 0C0173D0 */  jal        func_8005CF40
/* 5D6F8 8005CAF8 00000000 */   nop
/* 5D6FC 8005CAFC 080172CF */  j          .L8005CB3C
/* 5D700 8005CB00 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5D704 8005CB04 0C0173D5 */  jal        set_alaron_to_protag
/* 5D708 8005CB08 00000000 */   nop
/* 5D70C 8005CB0C 080172CF */  j          .L8005CB3C
/* 5D710 8005CB10 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5D714 8005CB14 0C0173E8 */  jal        func_8005CFA0
/* 5D718 8005CB18 00000000 */   nop
/* 5D71C 8005CB1C 080172CF */  j          .L8005CB3C
/* 5D720 8005CB20 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5D724 8005CB24 0C0173ED */  jal        func_8005CFB4
/* 5D728 8005CB28 00000000 */   nop
/* 5D72C 8005CB2C 080172CF */  j          .L8005CB3C
/* 5D730 8005CB30 8FBF0014 */   lw        $ra, 0x14($sp)
.L8005CB34:
/* 5D734 8005CB34 8E020028 */  lw         $v0, 0x28($s0)
/* 5D738 8005CB38 8FBF0014 */  lw         $ra, 0x14($sp)
.L8005CB3C:
/* 5D73C 8005CB3C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5D740 8005CB40 03E00008 */  jr         $ra
/* 5D744 8005CB44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel cinematic_controls
/* 5D748 8005CB48 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5D74C 8005CB4C AFB00018 */  sw         $s0, 0x18($sp)
/* 5D750 8005CB50 00008021 */  addu       $s0, $zero, $zero
/* 5D754 8005CB54 3C02800E */  lui        $v0, %hi(cinematicStruct)
/* 5D758 8005CB58 AFB20020 */  sw         $s2, 0x20($sp)
/* 5D75C 8005CB5C 24527E70 */  addiu      $s2, $v0, %lo(cinematicStruct)
/* 5D760 8005CB60 AFBF0024 */  sw         $ra, 0x24($sp)
/* 5D764 8005CB64 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5D768 8005CB68 AFA00010 */  sw         $zero, 0x10($sp)
/* 5D76C 8005CB6C 080172EB */  j          .L8005CBAC
/* 5D770 8005CB70 27B10010 */   addiu     $s1, $sp, 0x10
.L8005CB74:
/* 5D774 8005CB74 8C620008 */  lw         $v0, 8($v1)
/* 5D778 8005CB78 30425000 */  andi       $v0, $v0, 0x5000
/* 5D77C 8005CB7C 54400001 */  bnel       $v0, $zero, .L8005CB84
/* 5D780 8005CB80 A6400020 */   sh        $zero, 0x20($s2)
.L8005CB84:
/* 5D784 8005CB84 8FA20010 */  lw         $v0, 0x10($sp)
/* 5D788 8005CB88 26030001 */  addiu      $v1, $s0, 1
/* 5D78C 8005CB8C 8C44000C */  lw         $a0, 0xc($v0)
/* 5D790 8005CB90 30828000 */  andi       $v0, $a0, 0x8000
/* 5D794 8005CB94 10400002 */  beqz       $v0, .L8005CBA0
/* 5D798 8005CB98 3070FFFF */   andi      $s0, $v1, 0xffff
/* 5D79C 8005CB9C 2410000C */  addiu      $s0, $zero, 0xc
.L8005CBA0:
/* 5D7A0 8005CBA0 30824000 */  andi       $v0, $a0, 0x4000
/* 5D7A4 8005CBA4 54400001 */  bnel       $v0, $zero, .L8005CBAC
/* 5D7A8 8005CBA8 24100001 */   addiu     $s0, $zero, 1
.L8005CBAC:
/* 5D7AC 8005CBAC 02202021 */  addu       $a0, $s1, $zero
/* 5D7B0 8005CBB0 0C02713D */  jal        get_cont_aidyn
/* 5D7B4 8005CBB4 00002821 */   addu      $a1, $zero, $zero
/* 5D7B8 8005CBB8 1440FFEE */  bnez       $v0, .L8005CB74
/* 5D7BC 8005CBBC 8FA30010 */   lw        $v1, 0x10($sp)
/* 5D7C0 8005CBC0 52000001 */  beql       $s0, $zero, .L8005CBC8
/* 5D7C4 8005CBC4 24100001 */   addiu     $s0, $zero, 1
.L8005CBC8:
/* 5D7C8 8005CBC8 02001021 */  addu       $v0, $s0, $zero
/* 5D7CC 8005CBCC 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5D7D0 8005CBD0 8FB20020 */  lw         $s2, 0x20($sp)
/* 5D7D4 8005CBD4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5D7D8 8005CBD8 8FB00018 */  lw         $s0, 0x18($sp)
/* 5D7DC 8005CBDC 03E00008 */  jr         $ra
/* 5D7E0 8005CBE0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel cinematic_increment
/* 5D7E4 8005CBE4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5D7E8 8005CBE8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5D7EC 8005CBEC 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 5D7F0 8005CBF0 00112C00 */  sll        $a1, $s1, 0x10
/* 5D7F4 8005CBF4 00052C03 */  sra        $a1, $a1, 0x10
/* 5D7F8 8005CBF8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 5D7FC 8005CBFC AFB00018 */  sw         $s0, 0x18($sp)
/* 5D800 8005CC00 0C0087C0 */  jal        RenderSky
/* 5D804 8005CC04 AFA40028 */   sw        $a0, 0x28($sp)
/* 5D808 8005CC08 00402021 */  addu       $a0, $v0, $zero
/* 5D80C 8005CC0C 00002821 */  addu       $a1, $zero, $zero
/* 5D810 8005CC10 AFA20028 */  sw         $v0, 0x28($sp)
/* 5D814 8005CC14 240200F0 */  addiu      $v0, $zero, 0xf0
/* 5D818 8005CC18 00003021 */  addu       $a2, $zero, $zero
/* 5D81C 8005CC1C 24070140 */  addiu      $a3, $zero, 0x140
/* 5D820 8005CC20 0C0023E5 */  jal        some_rsp_func
/* 5D824 8005CC24 AFA20010 */   sw        $v0, 0x10($sp)
/* 5D828 8005CC28 3C10800E */  lui        $s0, %hi(cinematicStruct)
/* 5D82C 8005CC2C 8E047E70 */  lw         $a0, %lo(cinematicStruct)($s0)
/* 5D830 8005CC30 02202821 */  addu       $a1, $s1, $zero
/* 5D834 8005CC34 0C02A024 */  jal        set_animation_speed
/* 5D838 8005CC38 AFA20028 */   sw        $v0, 0x28($sp)
/* 5D83C 8005CC3C 0C02837D */  jal        func_800A0DF4
/* 5D840 8005CC40 8E047E70 */   lw        $a0, 0x7e70($s0)
/* 5D844 8005CC44 8FA40028 */  lw         $a0, 0x28($sp)
/* 5D848 8005CC48 0C02855B */  jal        gsAnimationDataMtx
/* 5D84C 8005CC4C 8E057E70 */   lw        $a1, 0x7e70($s0)
/* 5D850 8005CC50 8E057E70 */  lw         $a1, 0x7e70($s0)
/* 5D854 8005CC54 00402021 */  addu       $a0, $v0, $zero
/* 5D858 8005CC58 0C028369 */  jal        func_800A0DA4
/* 5D85C 8005CC5C AFA20028 */   sw        $v0, 0x28($sp)
/* 5D860 8005CC60 27A40028 */  addiu      $a0, $sp, 0x28
/* 5D864 8005CC64 02202821 */  addu       $a1, $s1, $zero
/* 5D868 8005CC68 0C017633 */  jal        inc_cinematic_runtime
/* 5D86C 8005CC6C AFA20028 */   sw        $v0, 0x28($sp)
/* 5D870 8005CC70 0C0175FF */  jal        cinematic_import_player_name
/* 5D874 8005CC74 00000000 */   nop
/* 5D878 8005CC78 27A40028 */  addiu      $a0, $sp, 0x28
/* 5D87C 8005CC7C 0C017575 */  jal        dec_caption_timer
/* 5D880 8005CC80 02202821 */   addu      $a1, $s1, $zero
/* 5D884 8005CC84 8FA20028 */  lw         $v0, 0x28($sp)
/* 5D888 8005CC88 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5D88C 8005CC8C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5D890 8005CC90 8FB00018 */  lw         $s0, 0x18($sp)
/* 5D894 8005CC94 03E00008 */  jr         $ra
/* 5D898 8005CC98 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_loading_cinematics
/* 5D89C 8005CC9C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5D8A0 8005CCA0 3C02800E */  lui        $v0, %hi(cinematicStruct)
/* 5D8A4 8005CCA4 AFB00020 */  sw         $s0, 0x20($sp)
/* 5D8A8 8005CCA8 24507E70 */  addiu      $s0, $v0, %lo(cinematicStruct)
/* 5D8AC 8005CCAC AFBF0028 */  sw         $ra, 0x28($sp)
/* 5D8B0 8005CCB0 AFB10024 */  sw         $s1, 0x24($sp)
/* 5D8B4 8005CCB4 9605001C */  lhu        $a1, 0x1c($s0)
/* 5D8B8 8005CCB8 8E040014 */  lw         $a0, 0x14($s0)
/* 5D8BC 8005CCBC 00051080 */  sll        $v0, $a1, 2
/* 5D8C0 8005CCC0 00441021 */  addu       $v0, $v0, $a0
/* 5D8C4 8005CCC4 8C430000 */  lw         $v1, ($v0)
/* 5D8C8 8005CCC8 54600003 */  bnel       $v1, $zero, .L8005CCD8
/* 5D8CC 8005CCCC 8E03000C */   lw        $v1, 0xc($s0)
/* 5D8D0 8005CCD0 0801739E */  j          .L8005CE78
/* 5D8D4 8005CCD4 A6000020 */   sh        $zero, 0x20($s0)
.L8005CCD8:
/* 5D8D8 8005CCD8 00051040 */  sll        $v0, $a1, 1
/* 5D8DC 8005CCDC 00431021 */  addu       $v0, $v0, $v1
/* 5D8E0 8005CCE0 0C0176BD */  jal        cinematic_seqs
/* 5D8E4 8005CCE4 94440000 */   lhu       $a0, ($v0)
/* 5D8E8 8005CCE8 0C017409 */  jal        reset_scene_timers
/* 5D8EC 8005CCEC 2411FFFF */   addiu     $s1, $zero, -1
/* 5D8F0 8005CCF0 9602001C */  lhu        $v0, 0x1c($s0)
/* 5D8F4 8005CCF4 8E030018 */  lw         $v1, 0x18($s0)
/* 5D8F8 8005CCF8 00021080 */  sll        $v0, $v0, 2
/* 5D8FC 8005CCFC 00431021 */  addu       $v0, $v0, $v1
/* 5D900 8005CD00 8C440000 */  lw         $a0, ($v0)
/* 5D904 8005CD04 50910040 */  beql       $a0, $s1, .L8005CE08
/* 5D908 8005CD08 9602001C */   lhu       $v0, 0x1c($s0)
/* 5D90C 8005CD0C 0C029BFC */  jal        load_borg_12
/* 5D910 8005CD10 00000000 */   nop
/* 5D914 8005CD14 2604002C */  addiu      $a0, $s0, 0x2c
/* 5D918 8005CD18 8C460008 */  lw         $a2, 8($v0)
/* 5D91C 8005CD1C 26050024 */  addiu      $a1, $s0, 0x24
/* 5D920 8005CD20 AE020008 */  sw         $v0, 8($s0)
/* 5D924 8005CD24 24020080 */  addiu      $v0, $zero, 0x80
/* 5D928 8005CD28 24030001 */  addiu      $v1, $zero, 1
/* 5D92C 8005CD2C 240700FF */  addiu      $a3, $zero, 0xff
/* 5D930 8005CD30 AFA20010 */  sw         $v0, 0x10($sp)
/* 5D934 8005CD34 AFA30014 */  sw         $v1, 0x14($sp)
/* 5D938 8005CD38 AFB10018 */  sw         $s1, 0x18($sp)
/* 5D93C 8005CD3C AFA0001C */  sw         $zero, 0x1c($sp)
/* 5D940 8005CD40 0C026895 */  jal        DCM_func
/* 5D944 8005CD44 24C60008 */   addiu     $a2, $a2, 8
/* 5D948 8005CD48 C6020A90 */  lwc1       $f2, 0xa90($s0)
/* 5D94C 8005CD4C 3C01800E */  lui        $at, %hi(D_800DF0A4)
/* 5D950 8005CD50 C420F0A4 */  lwc1       $f0, %lo(D_800DF0A4)($at)
/* 5D954 8005CD54 46001002 */  mul.s      $f0, $f2, $f0
/* 5D958 8005CD58 3C01800E */  lui        $at, %hi(D_800DF0A8)
/* 5D95C 8005CD5C C422F0A8 */  lwc1       $f2, %lo(D_800DF0A8)($at)
/* 5D960 8005CD60 4600103E */  c.le.s     $f2, $f0
/* 5D964 8005CD64 00000000 */  nop
/* 5D968 8005CD68 45010005 */  bc1t       .L8005CD80
/* 5D96C 8005CD6C 9204002C */   lbu       $a0, 0x2c($s0)
/* 5D970 8005CD70 4600008D */  trunc.w.s  $f2, $f0
/* 5D974 8005CD74 44031000 */  mfc1       $v1, $f2
/* 5D978 8005CD78 08017366 */  j          .L8005CD98
/* 5D97C 8005CD7C 3C02800F */   lui       $v0, 0x800f
.L8005CD80:
/* 5D980 8005CD80 46020001 */  sub.s      $f0, $f0, $f2
/* 5D984 8005CD84 4600008D */  trunc.w.s  $f2, $f0
/* 5D988 8005CD88 44031000 */  mfc1       $v1, $f2
/* 5D98C 8005CD8C 3C028000 */  lui        $v0, 0x8000
/* 5D990 8005CD90 00621825 */  or         $v1, $v1, $v0
/* 5D994 8005CD94 3C02800F */  lui        $v0, %hi(SFX_vol)
.L8005CD98:
/* 5D998 8005CD98 C44288FC */  lwc1       $f2, %lo(SFX_vol)($v0)
/* 5D99C 8005CD9C 3C01800E */  lui        $at, %hi(D_800DF0AC)
/* 5D9A0 8005CDA0 C420F0AC */  lwc1       $f0, %lo(D_800DF0AC)($at)
/* 5D9A4 8005CDA4 46001002 */  mul.s      $f0, $f2, $f0
/* 5D9A8 8005CDA8 3C01800E */  lui        $at, %hi(D_800DF0B0)
/* 5D9AC 8005CDAC C422F0B0 */  lwc1       $f2, %lo(D_800DF0B0)($at)
/* 5D9B0 8005CDB0 4600103E */  c.le.s     $f2, $f0
/* 5D9B4 8005CDB4 00000000 */  nop
/* 5D9B8 8005CDB8 45010005 */  bc1t       .L8005CDD0
/* 5D9BC 8005CDBC 00602821 */   addu      $a1, $v1, $zero
/* 5D9C0 8005CDC0 4600008D */  trunc.w.s  $f2, $f0
/* 5D9C4 8005CDC4 44061000 */  mfc1       $a2, $f2
/* 5D9C8 8005CDC8 0801737A */  j          .L8005CDE8
/* 5D9CC 8005CDCC 30C200FF */   andi      $v0, $a2, 0xff
.L8005CDD0:
/* 5D9D0 8005CDD0 46020001 */  sub.s      $f0, $f0, $f2
/* 5D9D4 8005CDD4 4600008D */  trunc.w.s  $f2, $f0
/* 5D9D8 8005CDD8 44061000 */  mfc1       $a2, $f2
/* 5D9DC 8005CDDC 3C028000 */  lui        $v0, 0x8000
/* 5D9E0 8005CDE0 00C23025 */  or         $a2, $a2, $v0
/* 5D9E4 8005CDE4 30C200FF */  andi       $v0, $a2, 0xff
.L8005CDE8:
/* 5D9E8 8005CDE8 30A300FF */  andi       $v1, $a1, 0xff
/* 5D9EC 8005CDEC 0043102B */  sltu       $v0, $v0, $v1
/* 5D9F0 8005CDF0 54400001 */  bnel       $v0, $zero, .L8005CDF8
/* 5D9F4 8005CDF4 00A03021 */   addu      $a2, $a1, $zero
.L8005CDF8:
/* 5D9F8 8005CDF8 8E050024 */  lw         $a1, 0x24($s0)
/* 5D9FC 8005CDFC 0C0268D2 */  jal        some_music_func
/* 5DA00 8005CE00 30C600FF */   andi      $a2, $a2, 0xff
/* 5DA04 8005CE04 9602001C */  lhu        $v0, 0x1c($s0)
.L8005CE08:
/* 5DA08 8005CE08 8E030014 */  lw         $v1, 0x14($s0)
/* 5DA0C 8005CE0C 00021080 */  sll        $v0, $v0, 2
/* 5DA10 8005CE10 00431021 */  addu       $v0, $v0, $v1
/* 5DA14 8005CE14 0C027EFB */  jal        get_borg_6
/* 5DA18 8005CE18 8C440000 */   lw        $a0, ($v0)
/* 5DA1C 8005CE1C 8C430020 */  lw         $v1, 0x20($v0)
/* 5DA20 8005CE20 8C640000 */  lw         $a0, ($v1)
/* 5DA24 8005CE24 0C027E7A */  jal        BorgAnimLoadScene
/* 5DA28 8005CE28 AE020004 */   sw        $v0, 4($s0)
/* 5DA2C 8005CE2C 8E050004 */  lw         $a1, 4($s0)
/* 5DA30 8005CE30 00402021 */  addu       $a0, $v0, $zero
/* 5DA34 8005CE34 0C027E1F */  jal        func_8009F87C
/* 5DA38 8005CE38 AE020000 */   sw        $v0, ($s0)
/* 5DA3C 8005CE3C 0C029FEB */  jal        func_800A7FAC
/* 5DA40 8005CE40 8E040000 */   lw        $a0, ($s0)
/* 5DA44 8005CE44 0C02A00A */  jal        func_800A8028
/* 5DA48 8005CE48 8E040000 */   lw        $a0, ($s0)
/* 5DA4C 8005CE4C 8E040000 */  lw         $a0, ($s0)
/* 5DA50 8005CE50 9602001C */  lhu        $v0, 0x1c($s0)
/* 5DA54 8005CE54 8E030010 */  lw         $v1, 0x10($s0)
/* 5DA58 8005CE58 000210C0 */  sll        $v0, $v0, 3
/* 5DA5C 8005CE5C 00431021 */  addu       $v0, $v0, $v1
/* 5DA60 8005CE60 8C450000 */  lw         $a1, ($v0)
/* 5DA64 8005CE64 0C029F79 */  jal        setA_with_2floats
/* 5DA68 8005CE68 8C460004 */   lw        $a2, 4($v0)
/* 5DA6C 8005CE6C 9602001C */  lhu        $v0, 0x1c($s0)
/* 5DA70 8005CE70 24420001 */  addiu      $v0, $v0, 1
/* 5DA74 8005CE74 A602001C */  sh         $v0, 0x1c($s0)
.L8005CE78:
/* 5DA78 8005CE78 8FBF0028 */  lw         $ra, 0x28($sp)
/* 5DA7C 8005CE7C 8FB10024 */  lw         $s1, 0x24($sp)
/* 5DA80 8005CE80 8FB00020 */  lw         $s0, 0x20($sp)
/* 5DA84 8005CE84 03E00008 */  jr         $ra
/* 5DA88 8005CE88 27BD0030 */   addiu     $sp, $sp, 0x30

glabel load_world_map
/* 5DA8C 8005CE8C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5DA90 8005CE90 24040FDB */  addiu      $a0, $zero, 0xfdb
/* 5DA94 8005CE94 AFBF001C */  sw         $ra, 0x1c($sp)
/* 5DA98 8005CE98 0C029B65 */  jal        get_borg_9
/* 5DA9C 8005CE9C AFB00018 */   sw        $s0, 0x18($sp)
/* 5DAA0 8005CEA0 00408021 */  addu       $s0, $v0, $zero
/* 5DAA4 8005CEA4 26030008 */  addiu      $v1, $s0, 8
/* 5DAA8 8005CEA8 94620028 */  lhu        $v0, 0x28($v1)
/* 5DAAC 8005CEAC 10400014 */  beqz       $v0, .L8005CF00
/* 5DAB0 8005CEB0 00004021 */   addu      $t0, $zero, $zero
/* 5DAB4 8005CEB4 24090009 */  addiu      $t1, $zero, 9
/* 5DAB8 8005CEB8 24070362 */  addiu      $a3, $zero, 0x362
/* 5DABC 8005CEBC 00402821 */  addu       $a1, $v0, $zero
/* 5DAC0 8005CEC0 3C040001 */  lui        $a0, 1
/* 5DAC4 8005CEC4 8C620044 */  lw         $v0, 0x44($v1)
/* 5DAC8 8005CEC8 3C060001 */  lui        $a2, 1
/* 5DACC 8005CECC 24430028 */  addiu      $v1, $v0, 0x28
.L8005CED0:
/* 5DAD0 8005CED0 9462FFEE */  lhu        $v0, -0x12($v1)
/* 5DAD4 8005CED4 14490005 */  bne        $v0, $t1, .L8005CEEC
/* 5DAD8 8005CED8 00801021 */   addu      $v0, $a0, $zero
/* 5DADC 8005CEDC 94620000 */  lhu        $v0, ($v1)
/* 5DAE0 8005CEE0 50470001 */  beql       $v0, $a3, .L8005CEE8
/* 5DAE4 8005CEE4 00604021 */   addu      $t0, $v1, $zero
.L8005CEE8:
/* 5DAE8 8005CEE8 00801021 */  addu       $v0, $a0, $zero
.L8005CEEC:
/* 5DAEC 8005CEEC 00862021 */  addu       $a0, $a0, $a2
/* 5DAF0 8005CEF0 00021403 */  sra        $v0, $v0, 0x10
/* 5DAF4 8005CEF4 0045102A */  slt        $v0, $v0, $a1
/* 5DAF8 8005CEF8 1440FFF5 */  bnez       $v0, .L8005CED0
/* 5DAFC 8005CEFC 2463006C */   addiu     $v1, $v1, 0x6c
.L8005CF00:
/* 5DB00 8005CF00 95040000 */  lhu        $a0, ($t0)
/* 5DB04 8005CF04 95050008 */  lhu        $a1, 8($t0)
/* 5DB08 8005CF08 85060002 */  lh         $a2, 2($t0)
/* 5DB0C 8005CF0C 85070004 */  lh         $a3, 4($t0)
/* 5DB10 8005CF10 85030006 */  lh         $v1, 6($t0)
/* 5DB14 8005CF14 24027FFF */  addiu      $v0, $zero, 0x7fff
/* 5DB18 8005CF18 AFA20014 */  sw         $v0, 0x14($sp)
/* 5DB1C 8005CF1C 0C015ED0 */  jal        dialoug_func
/* 5DB20 8005CF20 AFA30010 */   sw        $v1, 0x10($sp)
/* 5DB24 8005CF24 0C029B70 */  jal        remove_borg_9
/* 5DB28 8005CF28 02002021 */   addu      $a0, $s0, $zero
/* 5DB2C 8005CF2C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 5DB30 8005CF30 8FB00018 */  lw         $s0, 0x18($sp)
/* 5DB34 8005CF34 2402000C */  addiu      $v0, $zero, 0xc
/* 5DB38 8005CF38 03E00008 */  jr         $ra
/* 5DB3C 8005CF3C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005CF40
/* 5DB40 8005CF40 3C03800E */  lui        $v1, %hi(D_800E7DA0)
/* 5DB44 8005CF44 24020002 */  addiu      $v0, $zero, 2
/* 5DB48 8005CF48 A0627DA0 */  sb         $v0, %lo(D_800E7DA0)($v1)
/* 5DB4C 8005CF4C 03E00008 */  jr         $ra
/* 5DB50 8005CF50 24020013 */   addiu     $v0, $zero, 0x13

glabel set_alaron_to_protag
/* 5DB54 8005CF54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5DB58 8005CF58 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 5DB5C 8005CF5C 8C4313A0 */  lw         $v1, %lo(EntityPointer)($v0)
/* 5DB60 8005CF60 3C05800E */  lui        $a1, %hi(partyPointer)
/* 5DB64 8005CF64 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5DB68 8005CF68 8C620010 */  lw         $v0, 0x10($v1)
/* 5DB6C 8005CF6C 8CA47EA0 */  lw         $a0, %lo(partyPointer)($a1)
/* 5DB70 8005CF70 0C01F823 */  jal        get_charsheet
/* 5DB74 8005CF74 94454C80 */   lhu       $a1, 0x4c80($v0)
/* 5DB78 8005CF78 50400006 */  beql       $v0, $zero, .L8005CF94
/* 5DB7C 8005CF7C 24020001 */   addiu     $v0, $zero, 1
/* 5DB80 8005CF80 8C440014 */  lw         $a0, 0x14($v0)
/* 5DB84 8005CF84 9083000C */  lbu        $v1, 0xc($a0)
/* 5DB88 8005CF88 24020001 */  addiu      $v0, $zero, 1
/* 5DB8C 8005CF8C 34630001 */  ori        $v1, $v1, 1
/* 5DB90 8005CF90 A083000C */  sb         $v1, 0xc($a0)
.L8005CF94:
/* 5DB94 8005CF94 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5DB98 8005CF98 03E00008 */  jr         $ra
/* 5DB9C 8005CF9C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005CFA0
/* 5DBA0 8005CFA0 3C03800E */  lui        $v1, %hi(csome_cinematic_dat)
/* 5DBA4 8005CFA4 03E00008 */  jr         $ra
/* 5DBA8 8005CFA8 8C627E98 */   lw        $v0, %lo(csome_cinematic_dat)($v1)

glabel noop_8005cfac
/* 5DBAC 8005CFAC 03E00008 */  jr         $ra
/* 5DBB0 8005CFB0 00000000 */   nop

glabel func_8005CFB4
/* 5DBB4 8005CFB4 3C03800E */  lui        $v1, %hi(csome_cinematic_dat)
/* 5DBB8 8005CFB8 03E00008 */  jr         $ra
/* 5DBBC 8005CFBC 8C627E98 */   lw        $v0, %lo(csome_cinematic_dat)($v1)

glabel cinematicFade_init
/* 5DBC0 8005CFC0 3C02800F */  lui        $v0, %hi(cinematic_fade_color)
/* 5DBC4 8005CFC4 A040F51C */  sb         $zero, %lo(cinematic_fade_color)($v0)
/* 5DBC8 8005CFC8 2442F51C */  addiu      $v0, $v0, -0xae4
/* 5DBCC 8005CFCC 3C03800F */  lui        $v1, %hi(cinematic_fade_short)
/* 5DBD0 8005CFD0 A0400001 */  sb         $zero, 1($v0)
/* 5DBD4 8005CFD4 A0400002 */  sb         $zero, 2($v0)
/* 5DBD8 8005CFD8 A0400003 */  sb         $zero, 3($v0)
/* 5DBDC 8005CFDC 3C02800F */  lui        $v0, %hi(cinematic_fade_float)
/* 5DBE0 8005CFE0 A460F520 */  sh         $zero, %lo(cinematic_fade_short)($v1)
/* 5DBE4 8005CFE4 3C03800F */  lui        $v1, %hi(cinematic_fade_speed)
/* 5DBE8 8005CFE8 AC40F524 */  sw         $zero, %lo(cinematic_fade_float)($v0)
/* 5DBEC 8005CFEC 3C02800F */  lui        $v0, %hi(cinematic_scene_runtime)
/* 5DBF0 8005CFF0 AC60F528 */  sw         $zero, %lo(cinematic_fade_speed)($v1)
/* 5DBF4 8005CFF4 3C03800F */  lui        $v1, 0x800f
/* 5DBF8 8005CFF8 3084FFFF */  andi       $a0, $a0, 0xffff
/* 5DBFC 8005CFFC A440F52C */  sh         $zero, %lo(cinematic_scene_runtime)($v0)
/* 5DC00 8005D000 3C02800F */  lui        $v0, %hi(cinematicFadePointers)
/* 5DC04 8005D004 2442F508 */  addiu      $v0, $v0, %lo(cinematicFadePointers)
/* 5DC08 8005D008 00042080 */  sll        $a0, $a0, 2
/* 5DC0C 8005D00C 00822021 */  addu       $a0, $a0, $v0
/* 5DC10 8005D010 A460F52E */  sh         $zero, -0xad2($v1)
/* 5DC14 8005D014 8C830000 */  lw         $v1, ($a0)
/* 5DC18 8005D018 3C02800F */  lui        $v0, %hi(cinematicFadePointer)
/* 5DC1C 8005D01C 03E00008 */  jr         $ra
/* 5DC20 8005D020 AC43F518 */   sw        $v1, %lo(cinematicFadePointer)($v0)

glabel reset_scene_timers
/* 5DC24 8005D024 3C02800F */  lui        $v0, %hi(cinematic_scene_tally)
/* 5DC28 8005D028 9443F52E */  lhu        $v1, %lo(cinematic_scene_tally)($v0)
/* 5DC2C 8005D02C 3C04800F */  lui        $a0, %hi(cinematic_scene_runtime)
/* 5DC30 8005D030 A480F52C */  sh         $zero, %lo(cinematic_scene_runtime)($a0)
/* 5DC34 8005D034 24630001 */  addiu      $v1, $v1, 1
/* 5DC38 8005D038 03E00008 */  jr         $ra
/* 5DC3C 8005D03C A443F52E */   sh        $v1, -0xad2($v0)

glabel cinematic_fade
/* 5DC40 8005D040 30ACFFFF */  andi       $t4, $a1, 0xffff
/* 5DC44 8005D044 3C06800F */  lui        $a2, %hi(cinematic_scene_runtime)
/* 5DC48 8005D048 3C05800F */  lui        $a1, %hi(cinematicFadePointer)
/* 5DC4C 8005D04C 94C8F52C */  lhu        $t0, %lo(cinematic_scene_runtime)($a2)
/* 5DC50 8005D050 8CAAF518 */  lw         $t2, %lo(cinematicFadePointer)($a1)
/* 5DC54 8005D054 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 5DC58 8005D058 AFB30034 */  sw         $s3, 0x34($sp)
/* 5DC5C 8005D05C 00809821 */  addu       $s3, $a0, $zero
/* 5DC60 8005D060 AFBF0038 */  sw         $ra, 0x38($sp)
/* 5DC64 8005D064 AFB20030 */  sw         $s2, 0x30($sp)
/* 5DC68 8005D068 AFB1002C */  sw         $s1, 0x2c($sp)
/* 5DC6C 8005D06C AFB00028 */  sw         $s0, 0x28($sp)
/* 5DC70 8005D070 01881021 */  addu       $v0, $t4, $t0
/* 5DC74 8005D074 A4C2F52C */  sh         $v0, -0xad4($a2)
/* 5DC78 8005D078 3C02800F */  lui        $v0, %hi(cinematic_scene_tally)
/* 5DC7C 8005D07C 91440000 */  lbu        $a0, ($t2)
/* 5DC80 8005D080 9443F52E */  lhu        $v1, %lo(cinematic_scene_tally)($v0)
/* 5DC84 8005D084 14830052 */  bne        $a0, $v1, .L8005D1D0
/* 5DC88 8005D088 3C0D800F */   lui       $t5, 0x800f
/* 5DC8C 8005D08C 95430002 */  lhu        $v1, 2($t2)
/* 5DC90 8005D090 94CBF52C */  lhu        $t3, -0xad4($a2)
/* 5DC94 8005D094 00033840 */  sll        $a3, $v1, 1
/* 5DC98 8005D098 0167102A */  slt        $v0, $t3, $a3
/* 5DC9C 8005D09C 1440004D */  bnez       $v0, .L8005D1D4
/* 5DCA0 8005D0A0 85A2F520 */   lh        $v0, -0xae0($t5)
/* 5DCA4 8005D0A4 00E8102A */  slt        $v0, $a3, $t0
/* 5DCA8 8005D0A8 1440004A */  bnez       $v0, .L8005D1D4
/* 5DCAC 8005D0AC 85A2F520 */   lh        $v0, -0xae0($t5)
/* 5DCB0 8005D0B0 95430004 */  lhu        $v1, 4($t2)
/* 5DCB4 8005D0B4 95440006 */  lhu        $a0, 6($t2)
/* 5DCB8 8005D0B8 00034840 */  sll        $t1, $v1, 1
/* 5DCBC 8005D0BC 2522FFFC */  addiu      $v0, $t1, -4
/* 5DCC0 8005D0C0 3046FFFF */  andi       $a2, $v0, 0xffff
/* 5DCC4 8005D0C4 00042040 */  sll        $a0, $a0, 1
/* 5DCC8 8005D0C8 24820040 */  addiu      $v0, $a0, 0x40
/* 5DCCC 8005D0CC 2C630005 */  sltiu      $v1, $v1, 5
/* 5DCD0 8005D0D0 10600003 */  beqz       $v1, .L8005D0E0
/* 5DCD4 8005D0D4 3048FFFF */   andi      $t0, $v0, 0xffff
/* 5DCD8 8005D0D8 3126FFFF */  andi       $a2, $t1, 0xffff
/* 5DCDC 8005D0DC 3088FFFF */  andi       $t0, $a0, 0xffff
.L8005D0E0:
/* 5DCE0 8005D0E0 01671023 */  subu       $v0, $t3, $a3
/* 5DCE4 8005D0E4 01821021 */  addu       $v0, $t4, $v0
/* 5DCE8 8005D0E8 304CFFFF */  andi       $t4, $v0, 0xffff
/* 5DCEC 8005D0EC 01061821 */  addu       $v1, $t0, $a2
/* 5DCF0 8005D0F0 3C04800F */  lui        $a0, 0x800f
/* 5DCF4 8005D0F4 44860000 */  mtc1       $a2, $f0
/* 5DCF8 8005D0F8 46800020 */  cvt.s.w    $f0, $f0
/* 5DCFC 8005D0FC 3C01800E */  lui        $at, %hi(D_800DF0C0)
/* 5DD00 8005D100 D422F0C0 */  ldc1       $f2, %lo(D_800DF0C0)($at)
/* 5DD04 8005D104 46000021 */  cvt.d.s    $f0, $f0
/* 5DD08 8005D108 A5A3F520 */  sh         $v1, -0xae0($t5)
/* 5DD0C 8005D10C 46201083 */  div.d      $f2, $f2, $f0
/* 5DD10 8005D110 46201020 */  cvt.s.d    $f0, $f2
/* 5DD14 8005D114 E480F528 */  swc1       $f0, -0xad8($a0)
/* 5DD18 8005D118 91430001 */  lbu        $v1, 1($t2)
/* 5DD1C 8005D11C 24020001 */  addiu      $v0, $zero, 1
/* 5DD20 8005D120 10620014 */  beq        $v1, $v0, .L8005D174
/* 5DD24 8005D124 28620002 */   slti      $v0, $v1, 2
/* 5DD28 8005D128 10400005 */  beqz       $v0, .L8005D140
/* 5DD2C 8005D12C 24020002 */   addiu     $v0, $zero, 2
/* 5DD30 8005D130 10600009 */  beqz       $v1, .L8005D158
/* 5DD34 8005D134 8CA2F518 */   lw        $v0, -0xae8($a1)
/* 5DD38 8005D138 08017473 */  j          .L8005D1CC
/* 5DD3C 8005D13C 24420008 */   addiu     $v0, $v0, 8
.L8005D140:
/* 5DD40 8005D140 1062000F */  beq        $v1, $v0, .L8005D180
/* 5DD44 8005D144 24020003 */   addiu     $v0, $zero, 3
/* 5DD48 8005D148 10620016 */  beq        $v1, $v0, .L8005D1A4
/* 5DD4C 8005D14C 8CA2F518 */   lw        $v0, -0xae8($a1)
/* 5DD50 8005D150 08017473 */  j          .L8005D1CC
/* 5DD54 8005D154 24420008 */   addiu     $v0, $v0, 8
.L8005D158:
/* 5DD58 8005D158 3C02800F */  lui        $v0, 0x800f
/* 5DD5C 8005D15C 3C01800E */  lui        $at, %hi(D_800DF0C8)
/* 5DD60 8005D160 C422F0C8 */  lwc1       $f2, %lo(D_800DF0C8)($at)
/* 5DD64 8005D164 46000007 */  neg.s      $f0, $f0
/* 5DD68 8005D168 E480F528 */  swc1       $f0, -0xad8($a0)
/* 5DD6C 8005D16C 08017471 */  j          .L8005D1C4
/* 5DD70 8005D170 E442F524 */   swc1      $f2, -0xadc($v0)
.L8005D174:
/* 5DD74 8005D174 3C02800F */  lui        $v0, %hi(cinematic_fade_color)
/* 5DD78 8005D178 0801746C */  j          .L8005D1B0
/* 5DD7C 8005D17C A040F51C */   sb        $zero, %lo(cinematic_fade_color)($v0)
.L8005D180:
/* 5DD80 8005D180 3C02800F */  lui        $v0, %hi(cinematic_fade_color)
/* 5DD84 8005D184 240300FF */  addiu      $v1, $zero, 0xff
/* 5DD88 8005D188 A043F51C */  sb         $v1, %lo(cinematic_fade_color)($v0)
/* 5DD8C 8005D18C 2442F51C */  addiu      $v0, $v0, -0xae4
/* 5DD90 8005D190 3C04800F */  lui        $a0, %hi(cinematic_fade_float)
/* 5DD94 8005D194 A0430001 */  sb         $v1, 1($v0)
/* 5DD98 8005D198 A0430002 */  sb         $v1, 2($v0)
/* 5DD9C 8005D19C 08017471 */  j          .L8005D1C4
/* 5DDA0 8005D1A0 AC80F524 */   sw        $zero, %lo(cinematic_fade_float)($a0)
.L8005D1A4:
/* 5DDA4 8005D1A4 3C02800F */  lui        $v0, %hi(cinematic_fade_color)
/* 5DDA8 8005D1A8 240300FF */  addiu      $v1, $zero, 0xff
/* 5DDAC 8005D1AC A043F51C */  sb         $v1, %lo(cinematic_fade_color)($v0)
.L8005D1B0:
/* 5DDB0 8005D1B0 2442F51C */  addiu      $v0, $v0, -0xae4
/* 5DDB4 8005D1B4 3C03800F */  lui        $v1, %hi(cinematic_fade_float)
/* 5DDB8 8005D1B8 A0400001 */  sb         $zero, 1($v0)
/* 5DDBC 8005D1BC A0400002 */  sb         $zero, 2($v0)
/* 5DDC0 8005D1C0 AC60F524 */  sw         $zero, %lo(cinematic_fade_float)($v1)
.L8005D1C4:
/* 5DDC4 8005D1C4 8CA2F518 */  lw         $v0, -0xae8($a1)
/* 5DDC8 8005D1C8 24420008 */  addiu      $v0, $v0, 8
.L8005D1CC:
/* 5DDCC 8005D1CC ACA2F518 */  sw         $v0, -0xae8($a1)
.L8005D1D0:
/* 5DDD0 8005D1D0 85A2F520 */  lh         $v0, -0xae0($t5)
.L8005D1D4:
/* 5DDD4 8005D1D4 1040004E */  beqz       $v0, .L8005D310
/* 5DDD8 8005D1D8 95A3F520 */   lhu       $v1, -0xae0($t5)
/* 5DDDC 8005D1DC 006C1023 */  subu       $v0, $v1, $t4
/* 5DDE0 8005D1E0 A5A2F520 */  sh         $v0, -0xae0($t5)
/* 5DDE4 8005D1E4 00021400 */  sll        $v0, $v0, 0x10
/* 5DDE8 8005D1E8 04420001 */  bltzl      $v0, .L8005D1F0
/* 5DDEC 8005D1EC A5A0F520 */   sh        $zero, -0xae0($t5)
.L8005D1F0:
/* 5DDF0 8005D1F0 3C02800F */  lui        $v0, %hi(cinematic_fade_speed)
/* 5DDF4 8005D1F4 C442F528 */  lwc1       $f2, %lo(cinematic_fade_speed)($v0)
/* 5DDF8 8005D1F8 448C0000 */  mtc1       $t4, $f0
/* 5DDFC 8005D1FC 46800020 */  cvt.s.w    $f0, $f0
/* 5DE00 8005D200 46001082 */  mul.s      $f2, $f2, $f0
/* 5DE04 8005D204 3C02800F */  lui        $v0, %hi(cinematic_fade_float)
/* 5DE08 8005D208 C440F524 */  lwc1       $f0, %lo(cinematic_fade_float)($v0)
/* 5DE0C 8005D20C 46020000 */  add.s      $f0, $f0, $f2
/* 5DE10 8005D210 3C01800E */  lui        $at, %hi(D_800DF0CC)
/* 5DE14 8005D214 C422F0CC */  lwc1       $f2, %lo(D_800DF0CC)($at)
/* 5DE18 8005D218 4600103C */  c.lt.s     $f2, $f0
/* 5DE1C 8005D21C 00000000 */  nop
/* 5DE20 8005D220 45000002 */  bc1f       .L8005D22C
/* 5DE24 8005D224 E440F524 */   swc1      $f0, -0xadc($v0)
/* 5DE28 8005D228 E442F524 */  swc1       $f2, -0xadc($v0)
.L8005D22C:
/* 5DE2C 8005D22C C440F524 */  lwc1       $f0, -0xadc($v0)
/* 5DE30 8005D230 44801000 */  mtc1       $zero, $f2
/* 5DE34 8005D234 4602003C */  c.lt.s     $f0, $f2
/* 5DE38 8005D238 00000000 */  nop
/* 5DE3C 8005D23C 45030001 */  bc1tl      .L8005D244
/* 5DE40 8005D240 E442F524 */   swc1      $f2, -0xadc($v0)
.L8005D244:
/* 5DE44 8005D244 C440F524 */  lwc1       $f0, -0xadc($v0)
/* 5DE48 8005D248 3C01800E */  lui        $at, %hi(D_800DF0D0)
/* 5DE4C 8005D24C C422F0D0 */  lwc1       $f2, %lo(D_800DF0D0)($at)
/* 5DE50 8005D250 46020002 */  mul.s      $f0, $f0, $f2
/* 5DE54 8005D254 3C02800F */  lui        $v0, %hi(cinematic_fade_color)
/* 5DE58 8005D258 2444F51C */  addiu      $a0, $v0, %lo(cinematic_fade_color)
/* 5DE5C 8005D25C 3C01800E */  lui        $at, %hi(D_800DF0D4)
/* 5DE60 8005D260 C422F0D4 */  lwc1       $f2, %lo(D_800DF0D4)($at)
/* 5DE64 8005D264 4600103E */  c.le.s     $f2, $f0
/* 5DE68 8005D268 00000000 */  nop
/* 5DE6C 8005D26C 45010005 */  bc1t       .L8005D284
/* 5DE70 8005D270 00409021 */   addu      $s2, $v0, $zero
/* 5DE74 8005D274 4600008D */  trunc.w.s  $f2, $f0
/* 5DE78 8005D278 44031000 */  mfc1       $v1, $f2
/* 5DE7C 8005D27C 080174A7 */  j          .L8005D29C
/* 5DE80 8005D280 2651F51C */   addiu     $s1, $s2, -0xae4
.L8005D284:
/* 5DE84 8005D284 46020001 */  sub.s      $f0, $f0, $f2
/* 5DE88 8005D288 4600008D */  trunc.w.s  $f2, $f0
/* 5DE8C 8005D28C 44031000 */  mfc1       $v1, $f2
/* 5DE90 8005D290 3C028000 */  lui        $v0, 0x8000
/* 5DE94 8005D294 00621825 */  or         $v1, $v1, $v0
/* 5DE98 8005D298 2651F51C */  addiu      $s1, $s2, -0xae4
.L8005D29C:
/* 5DE9C 8005D29C A0830003 */  sb         $v1, 3($a0)
/* 5DEA0 8005D2A0 92220003 */  lbu        $v0, 3($s1)
/* 5DEA4 8005D2A4 1040001B */  beqz       $v0, .L8005D314
/* 5DEA8 8005D2A8 02601021 */   addu      $v0, $s3, $zero
/* 5DEAC 8005D2AC 0C0025B4 */  jal        get_hres
/* 5DEB0 8005D2B0 00000000 */   nop
/* 5DEB4 8005D2B4 0C0025B7 */  jal        get_vres
/* 5DEB8 8005D2B8 00408021 */   addu      $s0, $v0, $zero
/* 5DEBC 8005D2BC 02602021 */  addu       $a0, $s3, $zero
/* 5DEC0 8005D2C0 24050006 */  addiu      $a1, $zero, 6
/* 5DEC4 8005D2C4 02003021 */  addu       $a2, $s0, $zero
/* 5DEC8 8005D2C8 0C0290ED */  jal        rsp_func
/* 5DECC 8005D2CC 00403821 */   addu      $a3, $v0, $zero
/* 5DED0 8005D2D0 00402021 */  addu       $a0, $v0, $zero
/* 5DED4 8005D2D4 00002821 */  addu       $a1, $zero, $zero
/* 5DED8 8005D2D8 00003021 */  addu       $a2, $zero, $zero
/* 5DEDC 8005D2DC 24070140 */  addiu      $a3, $zero, 0x140
/* 5DEE0 8005D2E0 9243F51C */  lbu        $v1, -0xae4($s2)
/* 5DEE4 8005D2E4 92280001 */  lbu        $t0, 1($s1)
/* 5DEE8 8005D2E8 92290002 */  lbu        $t1, 2($s1)
/* 5DEEC 8005D2EC 922A0003 */  lbu        $t2, 3($s1)
/* 5DEF0 8005D2F0 240200F0 */  addiu      $v0, $zero, 0xf0
/* 5DEF4 8005D2F4 AFA20010 */  sw         $v0, 0x10($sp)
/* 5DEF8 8005D2F8 AFA30014 */  sw         $v1, 0x14($sp)
/* 5DEFC 8005D2FC AFA80018 */  sw         $t0, 0x18($sp)
/* 5DF00 8005D300 AFA9001C */  sw         $t1, 0x1c($sp)
/* 5DF04 8005D304 0C0299E5 */  jal        gsFadeInOut
/* 5DF08 8005D308 AFAA0020 */   sw        $t2, 0x20($sp)
/* 5DF0C 8005D30C 00409821 */  addu       $s3, $v0, $zero
.L8005D310:
/* 5DF10 8005D310 02601021 */  addu       $v0, $s3, $zero
.L8005D314:
/* 5DF14 8005D314 8FBF0038 */  lw         $ra, 0x38($sp)
/* 5DF18 8005D318 8FB30034 */  lw         $s3, 0x34($sp)
/* 5DF1C 8005D31C 8FB20030 */  lw         $s2, 0x30($sp)
/* 5DF20 8005D320 8FB1002C */  lw         $s1, 0x2c($sp)
/* 5DF24 8005D324 8FB00028 */  lw         $s0, 0x28($sp)
/* 5DF28 8005D328 03E00008 */  jr         $ra
/* 5DF2C 8005D32C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8005D330
/* 5DF30 8005D330 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 5DF34 8005D334 AFB40028 */  sw         $s4, 0x28($sp)
/* 5DF38 8005D338 97B40052 */  lhu        $s4, 0x52($sp)
/* 5DF3C 8005D33C AFB5002C */  sw         $s5, 0x2c($sp)
/* 5DF40 8005D340 97B50056 */  lhu        $s5, 0x56($sp)
/* 5DF44 8005D344 AFB60030 */  sw         $s6, 0x30($sp)
/* 5DF48 8005D348 93B6005B */  lbu        $s6, 0x5b($sp)
/* 5DF4C 8005D34C AFB70034 */  sw         $s7, 0x34($sp)
/* 5DF50 8005D350 93B7005F */  lbu        $s7, 0x5f($sp)
/* 5DF54 8005D354 AFBE0038 */  sw         $fp, 0x38($sp)
/* 5DF58 8005D358 93BE0063 */  lbu        $fp, 0x63($sp)
/* 5DF5C 8005D35C AFB20020 */  sw         $s2, 0x20($sp)
/* 5DF60 8005D360 93B20067 */  lbu        $s2, 0x67($sp)
/* 5DF64 8005D364 AFA40040 */  sw         $a0, 0x40($sp)
/* 5DF68 8005D368 2404007C */  addiu      $a0, $zero, 0x7c
/* 5DF6C 8005D36C AFB00018 */  sw         $s0, 0x18($sp)
/* 5DF70 8005D370 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 5DF74 8005D374 AFB30024 */  sw         $s3, 0x24($sp)
/* 5DF78 8005D378 30D3FFFF */  andi       $s3, $a2, 0xffff
/* 5DF7C 8005D37C AFB1001C */  sw         $s1, 0x1c($sp)
/* 5DF80 8005D380 AFBF003C */  sw         $ra, 0x3c($sp)
/* 5DF84 8005D384 0C026259 */  jal        passToMalloc
/* 5DF88 8005D388 30F1FFFF */   andi      $s1, $a3, 0xffff
/* 5DF8C 8005D38C 00402021 */  addu       $a0, $v0, $zero
/* 5DF90 8005D390 8FA50040 */  lw         $a1, 0x40($sp)
/* 5DF94 8005D394 0C02E3A0 */  jal        widgettext_func_2
/* 5DF98 8005D398 02003021 */   addu      $a2, $s0, $zero
/* 5DF9C 8005D39C 00408021 */  addu       $s0, $v0, $zero
/* 5DFA0 8005D3A0 02002021 */  addu       $a0, $s0, $zero
/* 5DFA4 8005D3A4 02602821 */  addu       $a1, $s3, $zero
/* 5DFA8 8005D3A8 0C02DD3F */  jal        set_widget_coords
/* 5DFAC 8005D3AC 02203021 */   addu      $a2, $s1, $zero
/* 5DFB0 8005D3B0 02002021 */  addu       $a0, $s0, $zero
/* 5DFB4 8005D3B4 02202821 */  addu       $a1, $s1, $zero
/* 5DFB8 8005D3B8 02603021 */  addu       $a2, $s3, $zero
/* 5DFBC 8005D3BC 02803821 */  addu       $a3, $s4, $zero
/* 5DFC0 8005D3C0 0C02DD6A */  jal        some_widget_setter
/* 5DFC4 8005D3C4 AFB50010 */   sw        $s5, 0x10($sp)
/* 5DFC8 8005D3C8 02C02821 */  addu       $a1, $s6, $zero
/* 5DFCC 8005D3CC 8E030078 */  lw         $v1, 0x78($s0)
/* 5DFD0 8005D3D0 02E03021 */  addu       $a2, $s7, $zero
/* 5DFD4 8005D3D4 84640048 */  lh         $a0, 0x48($v1)
/* 5DFD8 8005D3D8 03C03821 */  addu       $a3, $fp, $zero
/* 5DFDC 8005D3DC AFB20010 */  sw         $s2, 0x10($sp)
/* 5DFE0 8005D3E0 8C62004C */  lw         $v0, 0x4c($v1)
/* 5DFE4 8005D3E4 0040F809 */  jalr       $v0
/* 5DFE8 8005D3E8 02042021 */   addu      $a0, $s0, $a0
/* 5DFEC 8005D3EC 02001021 */  addu       $v0, $s0, $zero
/* 5DFF0 8005D3F0 8FBF003C */  lw         $ra, 0x3c($sp)
/* 5DFF4 8005D3F4 8FBE0038 */  lw         $fp, 0x38($sp)
/* 5DFF8 8005D3F8 8FB70034 */  lw         $s7, 0x34($sp)
/* 5DFFC 8005D3FC 8FB60030 */  lw         $s6, 0x30($sp)
/* 5E000 8005D400 8FB5002C */  lw         $s5, 0x2c($sp)
/* 5E004 8005D404 8FB40028 */  lw         $s4, 0x28($sp)
/* 5E008 8005D408 8FB30024 */  lw         $s3, 0x24($sp)
/* 5E00C 8005D40C 8FB20020 */  lw         $s2, 0x20($sp)
/* 5E010 8005D410 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5E014 8005D414 8FB00018 */  lw         $s0, 0x18($sp)
/* 5E018 8005D418 03E00008 */  jr         $ra
/* 5E01C 8005D41C 27BD0040 */   addiu     $sp, $sp, 0x40
