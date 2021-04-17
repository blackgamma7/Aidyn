.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8001C640
/* 1D240 8001C640 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D244 8001C644 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D248 8001C648 00808821 */  addu       $s1, $a0, $zero
/* 1D24C 8001C64C AFB00010 */  sw         $s0, 0x10($sp)
/* 1D250 8001C650 00A08021 */  addu       $s0, $a1, $zero
/* 1D254 8001C654 16000005 */  bnez       $s0, .L8001C66C
/* 1D258 8001C658 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1D25C 8001C65C 0C0009FD */  jal        func_800027F4
/* 1D260 8001C660 24050014 */   addiu     $a1, $zero, 0x14
/* 1D264 8001C664 080071A7 */  j          .L8001C69C
/* 1D268 8001C668 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001C66C:
/* 1D26C 8001C66C 02202021 */  addu       $a0, $s1, $zero
/* 1D270 8001C670 92050000 */  lbu        $a1, ($s0)
/* 1D274 8001C674 0C0009C0 */  jal        func_80002700
/* 1D278 8001C678 24060004 */   addiu     $a2, $zero, 4
/* 1D27C 8001C67C 02202021 */  addu       $a0, $s1, $zero
/* 1D280 8001C680 92050001 */  lbu        $a1, 1($s0)
/* 1D284 8001C684 0C0009C0 */  jal        func_80002700
/* 1D288 8001C688 24060004 */   addiu     $a2, $zero, 4
/* 1D28C 8001C68C 8E050004 */  lw         $a1, 4($s0)
/* 1D290 8001C690 0C0073EF */  jal        func_8001CFBC
/* 1D294 8001C694 02202021 */   addu      $a0, $s1, $zero
/* 1D298 8001C698 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001C69C:
/* 1D29C 8001C69C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D2A0 8001C6A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D2A4 8001C6A4 03E00008 */  jr         $ra
/* 1D2A8 8001C6A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001C6AC
/* 1D2AC 8001C6AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D2B0 8001C6B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 1D2B4 8001C6B4 00808021 */  addu       $s0, $a0, $zero
/* 1D2B8 8001C6B8 AFB20018 */  sw         $s2, 0x18($sp)
/* 1D2BC 8001C6BC 00A09021 */  addu       $s2, $a1, $zero
/* 1D2C0 8001C6C0 24050004 */  addiu      $a1, $zero, 4
/* 1D2C4 8001C6C4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1D2C8 8001C6C8 0C0009DF */  jal        two_bitshifting_funcs
/* 1D2CC 8001C6CC AFB10014 */   sw        $s1, 0x14($sp)
/* 1D2D0 8001C6D0 305100FF */  andi       $s1, $v0, 0xff
/* 1D2D4 8001C6D4 1220000D */  beqz       $s1, .L8001C70C
/* 1D2D8 8001C6D8 02002021 */   addu      $a0, $s0, $zero
/* 1D2DC 8001C6DC 0C0009DF */  jal        two_bitshifting_funcs
/* 1D2E0 8001C6E0 24050004 */   addiu     $a1, $zero, 4
/* 1D2E4 8001C6E4 02002021 */  addu       $a0, $s0, $zero
/* 1D2E8 8001C6E8 0C0073FC */  jal        load_unk_party_var
/* 1D2EC 8001C6EC 305000FF */   andi      $s0, $v0, 0xff
/* 1D2F0 8001C6F0 02402021 */  addu       $a0, $s2, $zero
/* 1D2F4 8001C6F4 02202821 */  addu       $a1, $s1, $zero
/* 1D2F8 8001C6F8 02003021 */  addu       $a2, $s0, $zero
/* 1D2FC 8001C6FC 0C01E29B */  jal        Buffing_potion_effect
/* 1D300 8001C700 00403821 */   addu      $a3, $v0, $zero
/* 1D304 8001C704 080071C6 */  j          .L8001C718
/* 1D308 8001C708 00001021 */   addu      $v0, $zero, $zero
.L8001C70C:
/* 1D30C 8001C70C 0C0009FD */  jal        func_800027F4
/* 1D310 8001C710 24050010 */   addiu     $a1, $zero, 0x10
/* 1D314 8001C714 00001021 */  addu       $v0, $zero, $zero
.L8001C718:
/* 1D318 8001C718 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1D31C 8001C71C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D320 8001C720 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D324 8001C724 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D328 8001C728 03E00008 */  jr         $ra
/* 1D32C 8001C72C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001C730
/* 1D330 8001C730 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D334 8001C734 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D338 8001C738 00808821 */  addu       $s1, $a0, $zero
/* 1D33C 8001C73C AFB00010 */  sw         $s0, 0x10($sp)
/* 1D340 8001C740 00A08021 */  addu       $s0, $a1, $zero
/* 1D344 8001C744 16000005 */  bnez       $s0, .L8001C75C
/* 1D348 8001C748 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1D34C 8001C74C 0C0009FD */  jal        func_800027F4
/* 1D350 8001C750 2405001C */   addiu     $a1, $zero, 0x1c
/* 1D354 8001C754 080071ED */  j          .L8001C7B4
/* 1D358 8001C758 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001C75C:
/* 1D35C 8001C75C 02202021 */  addu       $a0, $s1, $zero
/* 1D360 8001C760 92050001 */  lbu        $a1, 1($s0)
/* 1D364 8001C764 0C0009C0 */  jal        func_80002700
/* 1D368 8001C768 24060004 */   addiu     $a2, $zero, 4
/* 1D36C 8001C76C 02202021 */  addu       $a0, $s1, $zero
/* 1D370 8001C770 92050000 */  lbu        $a1, ($s0)
/* 1D374 8001C774 0C0009C0 */  jal        func_80002700
/* 1D378 8001C778 24060006 */   addiu     $a2, $zero, 6
/* 1D37C 8001C77C 02202021 */  addu       $a0, $s1, $zero
/* 1D380 8001C780 92050003 */  lbu        $a1, 3($s0)
/* 1D384 8001C784 24060005 */  addiu      $a2, $zero, 5
/* 1D388 8001C788 0C0009C0 */  jal        func_80002700
/* 1D38C 8001C78C 30A5001F */   andi      $a1, $a1, 0x1f
/* 1D390 8001C790 02202021 */  addu       $a0, $s1, $zero
/* 1D394 8001C794 8E050004 */  lw         $a1, 4($s0)
/* 1D398 8001C798 24060001 */  addiu      $a2, $zero, 1
/* 1D39C 8001C79C 0C0009C0 */  jal        func_80002700
/* 1D3A0 8001C7A0 0005282B */   sltu      $a1, $zero, $a1
/* 1D3A4 8001C7A4 8E050008 */  lw         $a1, 8($s0)
/* 1D3A8 8001C7A8 0C0073EF */  jal        func_8001CFBC
/* 1D3AC 8001C7AC 02202021 */   addu      $a0, $s1, $zero
/* 1D3B0 8001C7B0 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001C7B4:
/* 1D3B4 8001C7B4 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D3B8 8001C7B8 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D3BC 8001C7BC 03E00008 */  jr         $ra
/* 1D3C0 8001C7C0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel saveParty_func
/* 1D3C4 8001C7C4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1D3C8 8001C7C8 AFB30024 */  sw         $s3, 0x24($sp)
/* 1D3CC 8001C7CC 00809821 */  addu       $s3, $a0, $zero
/* 1D3D0 8001C7D0 24050004 */  addiu      $a1, $zero, 4
/* 1D3D4 8001C7D4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 1D3D8 8001C7D8 AFB40028 */  sw         $s4, 0x28($sp)
/* 1D3DC 8001C7DC AFB20020 */  sw         $s2, 0x20($sp)
/* 1D3E0 8001C7E0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 1D3E4 8001C7E4 0C0009DF */  jal        two_bitshifting_funcs
/* 1D3E8 8001C7E8 AFB00018 */   sw        $s0, 0x18($sp)
/* 1D3EC 8001C7EC 305400FF */  andi       $s4, $v0, 0xff
/* 1D3F0 8001C7F0 16800006 */  bnez       $s4, .L8001C80C
/* 1D3F4 8001C7F4 24040018 */   addiu     $a0, $zero, 0x18
/* 1D3F8 8001C7F8 02602021 */  addu       $a0, $s3, $zero
/* 1D3FC 8001C7FC 0C0009FD */  jal        func_800027F4
/* 1D400 8001C800 24050018 */   addiu     $a1, $zero, 0x18
/* 1D404 8001C804 08007225 */  j          .L8001C894
/* 1D408 8001C808 00001021 */   addu      $v0, $zero, $zero
.L8001C80C:
/* 1D40C 8001C80C 3C05800E */  lui        $a1, %hi(D_800D9720)
/* 1D410 8001C810 24A59720 */  addiu      $a1, $a1, %lo(D_800D9720)
/* 1D414 8001C814 0C025F9C */  jal        Malloc
/* 1D418 8001C818 240600A7 */   addiu     $a2, $zero, 0xa7
/* 1D41C 8001C81C 02602021 */  addu       $a0, $s3, $zero
/* 1D420 8001C820 24050006 */  addiu      $a1, $zero, 6
/* 1D424 8001C824 0C0009DF */  jal        two_bitshifting_funcs
/* 1D428 8001C828 00409021 */   addu      $s2, $v0, $zero
/* 1D42C 8001C82C 02602021 */  addu       $a0, $s3, $zero
/* 1D430 8001C830 24050005 */  addiu      $a1, $zero, 5
/* 1D434 8001C834 0C0009DF */  jal        two_bitshifting_funcs
/* 1D438 8001C838 305100FF */   andi      $s1, $v0, 0xff
/* 1D43C 8001C83C 02602021 */  addu       $a0, $s3, $zero
/* 1D440 8001C840 24050001 */  addiu      $a1, $zero, 1
/* 1D444 8001C844 0C0009DF */  jal        two_bitshifting_funcs
/* 1D448 8001C848 305000FF */   andi      $s0, $v0, 0xff
/* 1D44C 8001C84C 02402021 */  addu       $a0, $s2, $zero
/* 1D450 8001C850 02202821 */  addu       $a1, $s1, $zero
/* 1D454 8001C854 02803021 */  addu       $a2, $s4, $zero
/* 1D458 8001C858 304200FF */  andi       $v0, $v0, 0xff
/* 1D45C 8001C85C 0002102B */  sltu       $v0, $zero, $v0
/* 1D460 8001C860 00003821 */  addu       $a3, $zero, $zero
/* 1D464 8001C864 AFB00010 */  sw         $s0, 0x10($sp)
/* 1D468 8001C868 0C021021 */  jal        CreateTempEnchant
/* 1D46C 8001C86C AFA20014 */   sw        $v0, 0x14($sp)
/* 1D470 8001C870 82430003 */  lb         $v1, 3($s2)
/* 1D474 8001C874 2402001F */  addiu      $v0, $zero, 0x1f
/* 1D478 8001C878 14620002 */  bne        $v1, $v0, .L8001C884
/* 1D47C 8001C87C 2402FFFF */   addiu     $v0, $zero, -1
/* 1D480 8001C880 A2420003 */  sb         $v0, 3($s2)
.L8001C884:
/* 1D484 8001C884 0C0073FC */  jal        load_unk_party_var
/* 1D488 8001C888 02602021 */   addu      $a0, $s3, $zero
/* 1D48C 8001C88C AE420008 */  sw         $v0, 8($s2)
/* 1D490 8001C890 02401021 */  addu       $v0, $s2, $zero
.L8001C894:
/* 1D494 8001C894 8FBF002C */  lw         $ra, 0x2c($sp)
/* 1D498 8001C898 8FB40028 */  lw         $s4, 0x28($sp)
/* 1D49C 8001C89C 8FB30024 */  lw         $s3, 0x24($sp)
/* 1D4A0 8001C8A0 8FB20020 */  lw         $s2, 0x20($sp)
/* 1D4A4 8001C8A4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 1D4A8 8001C8A8 8FB00018 */  lw         $s0, 0x18($sp)
/* 1D4AC 8001C8AC 03E00008 */  jr         $ra
/* 1D4B0 8001C8B0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8001C8B4
/* 1D4B4 8001C8B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1D4B8 8001C8B8 00A01021 */  addu       $v0, $a1, $zero
/* 1D4BC 8001C8BC 14400005 */  bnez       $v0, .L8001C8D4
/* 1D4C0 8001C8C0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 1D4C4 8001C8C4 0C0009FD */  jal        func_800027F4
/* 1D4C8 8001C8C8 2405000A */   addiu     $a1, $zero, 0xa
/* 1D4CC 8001C8CC 08007240 */  j          .L8001C900
/* 1D4D0 8001C8D0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8001C8D4:
/* 1D4D4 8001C8D4 2406000A */  addiu      $a2, $zero, 0xa
/* 1D4D8 8001C8D8 90450001 */  lbu        $a1, 1($v0)
/* 1D4DC 8001C8DC 90420000 */  lbu        $v0, ($v0)
/* 1D4E0 8001C8E0 00052E00 */  sll        $a1, $a1, 0x18
/* 1D4E4 8001C8E4 00052E03 */  sra        $a1, $a1, 0x18
/* 1D4E8 8001C8E8 24A50032 */  addiu      $a1, $a1, 0x32
/* 1D4EC 8001C8EC 30A5007F */  andi       $a1, $a1, 0x7f
/* 1D4F0 8001C8F0 000211C0 */  sll        $v0, $v0, 7
/* 1D4F4 8001C8F4 0C0009C0 */  jal        func_80002700
/* 1D4F8 8001C8F8 00A22825 */   or        $a1, $a1, $v0
/* 1D4FC 8001C8FC 8FBF0010 */  lw         $ra, 0x10($sp)
.L8001C900:
/* 1D500 8001C900 03E00008 */  jr         $ra
/* 1D504 8001C904 27BD0018 */   addiu     $sp, $sp, 0x18

glabel saveparty_malloc
/* 1D508 8001C908 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D50C 8001C90C 2405000A */  addiu      $a1, $zero, 0xa
/* 1D510 8001C910 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1D514 8001C914 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D518 8001C918 0C0009DF */  jal        two_bitshifting_funcs
/* 1D51C 8001C91C AFB00010 */   sw        $s0, 0x10($sp)
/* 1D520 8001C920 3051FFFF */  andi       $s1, $v0, 0xffff
/* 1D524 8001C924 12200010 */  beqz       $s1, .L8001C968
/* 1D528 8001C928 24040002 */   addiu     $a0, $zero, 2
/* 1D52C 8001C92C 3C05800E */  lui        $a1, %hi(D_800D9720)
/* 1D530 8001C930 24A59720 */  addiu      $a1, $a1, %lo(D_800D9720)
/* 1D534 8001C934 0C025F9C */  jal        Malloc
/* 1D538 8001C938 240600E1 */   addiu     $a2, $zero, 0xe1
/* 1D53C 8001C93C 001129C2 */  srl        $a1, $s1, 7
/* 1D540 8001C940 00408021 */  addu       $s0, $v0, $zero
/* 1D544 8001C944 02002021 */  addu       $a0, $s0, $zero
/* 1D548 8001C948 30A500FF */  andi       $a1, $a1, 0xff
/* 1D54C 8001C94C 3226007F */  andi       $a2, $s1, 0x7f
/* 1D550 8001C950 24C6FFCE */  addiu      $a2, $a2, -0x32
/* 1D554 8001C954 00063600 */  sll        $a2, $a2, 0x18
/* 1D558 8001C958 0C021154 */  jal        make_2byte_array
/* 1D55C 8001C95C 00063603 */   sra       $a2, $a2, 0x18
/* 1D560 8001C960 0800725B */  j          .L8001C96C
/* 1D564 8001C964 02001021 */   addu      $v0, $s0, $zero
.L8001C968:
/* 1D568 8001C968 00001021 */  addu       $v0, $zero, $zero
.L8001C96C:
/* 1D56C 8001C96C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1D570 8001C970 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D574 8001C974 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D578 8001C978 03E00008 */  jr         $ra
/* 1D57C 8001C97C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001C980
/* 1D580 8001C980 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D584 8001C984 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D588 8001C988 00808821 */  addu       $s1, $a0, $zero
/* 1D58C 8001C98C AFB00010 */  sw         $s0, 0x10($sp)
/* 1D590 8001C990 00A08021 */  addu       $s0, $a1, $zero
/* 1D594 8001C994 12000004 */  beqz       $s0, .L8001C9A8
/* 1D598 8001C998 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1D59C 8001C99C 96020000 */  lhu        $v0, ($s0)
/* 1D5A0 8001C9A0 14400005 */  bnez       $v0, .L8001C9B8
/* 1D5A4 8001C9A4 02202021 */   addu      $a0, $s1, $zero
.L8001C9A8:
/* 1D5A8 8001C9A8 0C0009FD */  jal        func_800027F4
/* 1D5AC 8001C9AC 2405001C */   addiu     $a1, $zero, 0x1c
/* 1D5B0 8001C9B0 0800727C */  j          .L8001C9F0
/* 1D5B4 8001C9B4 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001C9B8:
/* 1D5B8 8001C9B8 96050000 */  lhu        $a1, ($s0)
/* 1D5BC 8001C9BC 0C0009C0 */  jal        func_80002700
/* 1D5C0 8001C9C0 2406000D */   addiu     $a2, $zero, 0xd
/* 1D5C4 8001C9C4 8E020010 */  lw         $v0, 0x10($s0)
/* 1D5C8 8001C9C8 10400002 */  beqz       $v0, .L8001C9D4
/* 1D5CC 8001C9CC 00002821 */   addu      $a1, $zero, $zero
/* 1D5D0 8001C9D0 90450004 */  lbu        $a1, 4($v0)
.L8001C9D4:
/* 1D5D4 8001C9D4 02202021 */  addu       $a0, $s1, $zero
/* 1D5D8 8001C9D8 0C0009C0 */  jal        func_80002700
/* 1D5DC 8001C9DC 24060005 */   addiu     $a2, $zero, 5
/* 1D5E0 8001C9E0 8E05000C */  lw         $a1, 0xc($s0)
/* 1D5E4 8001C9E4 0C00722D */  jal        func_8001C8B4
/* 1D5E8 8001C9E8 02202021 */   addu      $a0, $s1, $zero
/* 1D5EC 8001C9EC 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001C9F0:
/* 1D5F0 8001C9F0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D5F4 8001C9F4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D5F8 8001C9F8 03E00008 */  jr         $ra
/* 1D5FC 8001C9FC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001CA00
/* 1D600 8001CA00 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D604 8001CA04 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D608 8001CA08 00808821 */  addu       $s1, $a0, $zero
/* 1D60C 8001CA0C AFB00010 */  sw         $s0, 0x10($sp)
/* 1D610 8001CA10 00A08021 */  addu       $s0, $a1, $zero
/* 1D614 8001CA14 16000005 */  bnez       $s0, .L8001CA2C
/* 1D618 8001CA18 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1D61C 8001CA1C 0C0009FD */  jal        func_800027F4
/* 1D620 8001CA20 2405001C */   addiu     $a1, $zero, 0x1c
/* 1D624 8001CA24 080072A8 */  j          .L8001CAA0
/* 1D628 8001CA28 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001CA2C:
/* 1D62C 8001CA2C 02202021 */  addu       $a0, $s1, $zero
/* 1D630 8001CA30 0C0009DF */  jal        two_bitshifting_funcs
/* 1D634 8001CA34 2405000D */   addiu     $a1, $zero, 0xd
/* 1D638 8001CA38 3045FFFF */  andi       $a1, $v0, 0xffff
/* 1D63C 8001CA3C 14A00005 */  bnez       $a1, .L8001CA54
/* 1D640 8001CA40 02202021 */   addu      $a0, $s1, $zero
/* 1D644 8001CA44 0C0009FD */  jal        func_800027F4
/* 1D648 8001CA48 2405000F */   addiu     $a1, $zero, 0xf
/* 1D64C 8001CA4C 080072A8 */  j          .L8001CAA0
/* 1D650 8001CA50 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001CA54:
/* 1D654 8001CA54 0C01EF1C */  jal        temp_item_check
/* 1D658 8001CA58 02002021 */   addu      $a0, $s0, $zero
/* 1D65C 8001CA5C 02202021 */  addu       $a0, $s1, $zero
/* 1D660 8001CA60 0C0009DF */  jal        two_bitshifting_funcs
/* 1D664 8001CA64 24050005 */   addiu     $a1, $zero, 5
/* 1D668 8001CA68 8E030010 */  lw         $v1, 0x10($s0)
/* 1D66C 8001CA6C 10600002 */  beqz       $v1, .L8001CA78
/* 1D670 8001CA70 304200FF */   andi      $v0, $v0, 0xff
/* 1D674 8001CA74 A0620004 */  sb         $v0, 4($v1)
.L8001CA78:
/* 1D678 8001CA78 8E04000C */  lw         $a0, 0xc($s0)
/* 1D67C 8001CA7C 10800004 */  beqz       $a0, .L8001CA90
/* 1D680 8001CA80 3C05800E */   lui       $a1, %hi(D_800D9720)
/* 1D684 8001CA84 24A59720 */  addiu      $a1, $a1, %lo(D_800D9720)
/* 1D688 8001CA88 0C02600C */  jal        Free
/* 1D68C 8001CA8C 24060134 */   addiu     $a2, $zero, 0x134
.L8001CA90:
/* 1D690 8001CA90 0C007242 */  jal        saveparty_malloc
/* 1D694 8001CA94 02202021 */   addu      $a0, $s1, $zero
/* 1D698 8001CA98 AE02000C */  sw         $v0, 0xc($s0)
/* 1D69C 8001CA9C 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001CAA0:
/* 1D6A0 8001CAA0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D6A4 8001CAA4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D6A8 8001CAA8 03E00008 */  jr         $ra
/* 1D6AC 8001CAAC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001CAB0
/* 1D6B0 8001CAB0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D6B4 8001CAB4 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D6B8 8001CAB8 00808821 */  addu       $s1, $a0, $zero
/* 1D6BC 8001CABC AFB00010 */  sw         $s0, 0x10($sp)
/* 1D6C0 8001CAC0 00A08021 */  addu       $s0, $a1, $zero
/* 1D6C4 8001CAC4 16000005 */  bnez       $s0, .L8001CADC
/* 1D6C8 8001CAC8 AFBF0018 */   sw        $ra, 0x18($sp)
/* 1D6CC 8001CACC 0C0009FD */  jal        func_800027F4
/* 1D6D0 8001CAD0 24050030 */   addiu     $a1, $zero, 0x30
/* 1D6D4 8001CAD4 080072C0 */  j          .L8001CB00
/* 1D6D8 8001CAD8 8FBF0018 */   lw        $ra, 0x18($sp)
.L8001CADC:
/* 1D6DC 8001CADC 02202021 */  addu       $a0, $s1, $zero
/* 1D6E0 8001CAE0 8E050004 */  lw         $a1, 4($s0)
/* 1D6E4 8001CAE4 0C0009C0 */  jal        func_80002700
/* 1D6E8 8001CAE8 24060018 */   addiu     $a2, $zero, 0x18
/* 1D6EC 8001CAEC 02202021 */  addu       $a0, $s1, $zero
/* 1D6F0 8001CAF0 8E050008 */  lw         $a1, 8($s0)
/* 1D6F4 8001CAF4 0C0009C0 */  jal        func_80002700
/* 1D6F8 8001CAF8 24060018 */   addiu     $a2, $zero, 0x18
/* 1D6FC 8001CAFC 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001CB00:
/* 1D700 8001CB00 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D704 8001CB04 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D708 8001CB08 03E00008 */  jr         $ra
/* 1D70C 8001CB0C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001CB10
/* 1D710 8001CB10 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D714 8001CB14 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D718 8001CB18 00808821 */  addu       $s1, $a0, $zero
/* 1D71C 8001CB1C AFB20018 */  sw         $s2, 0x18($sp)
/* 1D720 8001CB20 00A09021 */  addu       $s2, $a1, $zero
/* 1D724 8001CB24 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1D728 8001CB28 16400005 */  bnez       $s2, .L8001CB40
/* 1D72C 8001CB2C AFB00010 */   sw        $s0, 0x10($sp)
/* 1D730 8001CB30 0C0009FD */  jal        func_800027F4
/* 1D734 8001CB34 24050030 */   addiu     $a1, $zero, 0x30
/* 1D738 8001CB38 080072DD */  j          .L8001CB74
/* 1D73C 8001CB3C 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001CB40:
/* 1D740 8001CB40 02202021 */  addu       $a0, $s1, $zero
/* 1D744 8001CB44 0C0009DF */  jal        two_bitshifting_funcs
/* 1D748 8001CB48 24050018 */   addiu     $a1, $zero, 0x18
/* 1D74C 8001CB4C 3C1000FF */  lui        $s0, 0xff
/* 1D750 8001CB50 3610FFFF */  ori        $s0, $s0, 0xffff
/* 1D754 8001CB54 02202021 */  addu       $a0, $s1, $zero
/* 1D758 8001CB58 24050018 */  addiu      $a1, $zero, 0x18
/* 1D75C 8001CB5C 00501024 */  and        $v0, $v0, $s0
/* 1D760 8001CB60 0C0009DF */  jal        two_bitshifting_funcs
/* 1D764 8001CB64 AE420004 */   sw        $v0, 4($s2)
/* 1D768 8001CB68 00501024 */  and        $v0, $v0, $s0
/* 1D76C 8001CB6C AE420008 */  sw         $v0, 8($s2)
/* 1D770 8001CB70 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001CB74:
/* 1D774 8001CB74 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D778 8001CB78 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D77C 8001CB7C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D780 8001CB80 03E00008 */  jr         $ra
/* 1D784 8001CB84 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001CB88
/* 1D788 8001CB88 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1D78C 8001CB8C AFBF0010 */  sw         $ra, 0x10($sp)
/* 1D790 8001CB90 8CA20018 */  lw         $v0, 0x18($a1)
/* 1D794 8001CB94 14400005 */  bnez       $v0, .L8001CBAC
/* 1D798 8001CB98 00802821 */   addu      $a1, $a0, $zero
/* 1D79C 8001CB9C 0C0009FD */  jal        func_800027F4
/* 1D7A0 8001CBA0 24050050 */   addiu     $a1, $zero, 0x50
/* 1D7A4 8001CBA4 080072EE */  j          .L8001CBB8
/* 1D7A8 8001CBA8 8FBF0010 */   lw        $ra, 0x10($sp)
.L8001CBAC:
/* 1D7AC 8001CBAC 0C02117F */  jal        func_800845FC
/* 1D7B0 8001CBB0 00402021 */   addu      $a0, $v0, $zero
/* 1D7B4 8001CBB4 8FBF0010 */  lw         $ra, 0x10($sp)
.L8001CBB8:
/* 1D7B8 8001CBB8 03E00008 */  jr         $ra
/* 1D7BC 8001CBBC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001CBC0
/* 1D7C0 8001CBC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1D7C4 8001CBC4 00801021 */  addu       $v0, $a0, $zero
/* 1D7C8 8001CBC8 00A02021 */  addu       $a0, $a1, $zero
/* 1D7CC 8001CBCC 14800006 */  bnez       $a0, .L8001CBE8
/* 1D7D0 8001CBD0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 1D7D4 8001CBD4 00402021 */  addu       $a0, $v0, $zero
/* 1D7D8 8001CBD8 0C0009FD */  jal        func_800027F4
/* 1D7DC 8001CBDC 24050050 */   addiu     $a1, $zero, 0x50
/* 1D7E0 8001CBE0 080072FD */  j          .L8001CBF4
/* 1D7E4 8001CBE4 8FBF0010 */   lw        $ra, 0x10($sp)
.L8001CBE8:
/* 1D7E8 8001CBE8 0C0211C2 */  jal        func_80084708
/* 1D7EC 8001CBEC 00402821 */   addu      $a1, $v0, $zero
/* 1D7F0 8001CBF0 8FBF0010 */  lw         $ra, 0x10($sp)
.L8001CBF4:
/* 1D7F4 8001CBF4 03E00008 */  jr         $ra
/* 1D7F8 8001CBF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001CBFC
/* 1D7FC 8001CBFC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1D800 8001CC00 30C300FF */  andi       $v1, $a2, 0xff
/* 1D804 8001CC04 AFB30024 */  sw         $s3, 0x24($sp)
/* 1D808 8001CC08 00809821 */  addu       $s3, $a0, $zero
/* 1D80C 8001CC0C AFB20020 */  sw         $s2, 0x20($sp)
/* 1D810 8001CC10 00A09021 */  addu       $s2, $a1, $zero
/* 1D814 8001CC14 AFBF002C */  sw         $ra, 0x2c($sp)
/* 1D818 8001CC18 AFB40028 */  sw         $s4, 0x28($sp)
/* 1D81C 8001CC1C AFB1001C */  sw         $s1, 0x1c($sp)
/* 1D820 8001CC20 14600002 */  bnez       $v1, .L8001CC2C
/* 1D824 8001CC24 AFB00018 */   sw        $s0, 0x18($sp)
/* 1D828 8001CC28 24030005 */  addiu      $v1, $zero, 5
.L8001CC2C:
/* 1D82C 8001CC2C 3C06800F */  lui        $a2, %hi(spell_pointer)
/* 1D830 8001CC30 8CC216A0 */  lw         $v0, %lo(spell_pointer)($a2)
/* 1D834 8001CC34 00432021 */  addu       $a0, $v0, $v1
/* 1D838 8001CC38 00801021 */  addu       $v0, $a0, $zero
/* 1D83C 8001CC3C 90830007 */  lbu        $v1, 7($a0)
/* 1D840 8001CC40 90450001 */  lbu        $a1, 1($v0)
/* 1D844 8001CC44 00608021 */  addu       $s0, $v1, $zero
/* 1D848 8001CC48 00651821 */  addu       $v1, $v1, $a1
/* 1D84C 8001CC4C 307100FF */  andi       $s1, $v1, 0xff
/* 1D850 8001CC50 0211102B */  sltu       $v0, $s0, $s1
/* 1D854 8001CC54 10400021 */  beqz       $v0, .L8001CCDC
/* 1D858 8001CC58 00C0A021 */   addu      $s4, $a2, $zero
/* 1D85C 8001CC5C 02402021 */  addu       $a0, $s2, $zero
.L8001CC60:
/* 1D860 8001CC60 00101080 */  sll        $v0, $s0, 2
/* 1D864 8001CC64 00501021 */  addu       $v0, $v0, $s0
/* 1D868 8001CC68 00021080 */  sll        $v0, $v0, 2
/* 1D86C 8001CC6C 8E8316A0 */  lw         $v1, 0x16a0($s4)
/* 1D870 8001CC70 00501023 */  subu       $v0, $v0, $s0
/* 1D874 8001CC74 8C650010 */  lw         $a1, 0x10($v1)
/* 1D878 8001CC78 00021040 */  sll        $v0, $v0, 1
/* 1D87C 8001CC7C 00451021 */  addu       $v0, $v0, $a1
/* 1D880 8001CC80 94450000 */  lhu        $a1, ($v0)
/* 1D884 8001CC84 0C021108 */  jal        knows_spell
/* 1D888 8001CC88 27A60010 */   addiu     $a2, $sp, 0x10
/* 1D88C 8001CC8C 1040000B */  beqz       $v0, .L8001CCBC
/* 1D890 8001CC90 93A20010 */   lbu       $v0, 0x10($sp)
/* 1D894 8001CC94 8E430000 */  lw         $v1, ($s2)
/* 1D898 8001CC98 00021080 */  sll        $v0, $v0, 2
/* 1D89C 8001CC9C 00431021 */  addu       $v0, $v0, $v1
/* 1D8A0 8001CCA0 8C460000 */  lw         $a2, ($v0)
/* 1D8A4 8001CCA4 02602021 */  addu       $a0, $s3, $zero
/* 1D8A8 8001CCA8 90C50014 */  lbu        $a1, 0x14($a2)
/* 1D8AC 8001CCAC 0C0009C0 */  jal        func_80002700
/* 1D8B0 8001CCB0 24060004 */   addiu     $a2, $zero, 4
/* 1D8B4 8001CCB4 08007333 */  j          .L8001CCCC
/* 1D8B8 8001CCB8 26020001 */   addiu     $v0, $s0, 1
.L8001CCBC:
/* 1D8BC 8001CCBC 02602021 */  addu       $a0, $s3, $zero
/* 1D8C0 8001CCC0 0C0009FD */  jal        func_800027F4
/* 1D8C4 8001CCC4 24050004 */   addiu     $a1, $zero, 4
/* 1D8C8 8001CCC8 26020001 */  addiu      $v0, $s0, 1
.L8001CCCC:
/* 1D8CC 8001CCCC 305000FF */  andi       $s0, $v0, 0xff
/* 1D8D0 8001CCD0 0211182B */  sltu       $v1, $s0, $s1
/* 1D8D4 8001CCD4 1460FFE2 */  bnez       $v1, .L8001CC60
/* 1D8D8 8001CCD8 02402021 */   addu      $a0, $s2, $zero
.L8001CCDC:
/* 1D8DC 8001CCDC 8FBF002C */  lw         $ra, 0x2c($sp)
/* 1D8E0 8001CCE0 8FB40028 */  lw         $s4, 0x28($sp)
/* 1D8E4 8001CCE4 8FB30024 */  lw         $s3, 0x24($sp)
/* 1D8E8 8001CCE8 8FB20020 */  lw         $s2, 0x20($sp)
/* 1D8EC 8001CCEC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 1D8F0 8001CCF0 8FB00018 */  lw         $s0, 0x18($sp)
/* 1D8F4 8001CCF4 03E00008 */  jr         $ra
/* 1D8F8 8001CCF8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8001CCFC
/* 1D8FC 8001CCFC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1D900 8001CD00 30C300FF */  andi       $v1, $a2, 0xff
/* 1D904 8001CD04 AFB40020 */  sw         $s4, 0x20($sp)
/* 1D908 8001CD08 0080A021 */  addu       $s4, $a0, $zero
/* 1D90C 8001CD0C AFB3001C */  sw         $s3, 0x1c($sp)
/* 1D910 8001CD10 00A09821 */  addu       $s3, $a1, $zero
/* 1D914 8001CD14 AFBF0024 */  sw         $ra, 0x24($sp)
/* 1D918 8001CD18 AFB20018 */  sw         $s2, 0x18($sp)
/* 1D91C 8001CD1C AFB10014 */  sw         $s1, 0x14($sp)
/* 1D920 8001CD20 14600002 */  bnez       $v1, .L8001CD2C
/* 1D924 8001CD24 AFB00010 */   sw        $s0, 0x10($sp)
/* 1D928 8001CD28 24030005 */  addiu      $v1, $zero, 5
.L8001CD2C:
/* 1D92C 8001CD2C 3C06800F */  lui        $a2, %hi(spell_pointer)
/* 1D930 8001CD30 8CC216A0 */  lw         $v0, %lo(spell_pointer)($a2)
/* 1D934 8001CD34 00432021 */  addu       $a0, $v0, $v1
/* 1D938 8001CD38 00801021 */  addu       $v0, $a0, $zero
/* 1D93C 8001CD3C 90830007 */  lbu        $v1, 7($a0)
/* 1D940 8001CD40 90450001 */  lbu        $a1, 1($v0)
/* 1D944 8001CD44 00608021 */  addu       $s0, $v1, $zero
/* 1D948 8001CD48 00651821 */  addu       $v1, $v1, $a1
/* 1D94C 8001CD4C 307100FF */  andi       $s1, $v1, 0xff
/* 1D950 8001CD50 0211102B */  sltu       $v0, $s0, $s1
/* 1D954 8001CD54 10400017 */  beqz       $v0, .L8001CDB4
/* 1D958 8001CD58 00C09021 */   addu      $s2, $a2, $zero
/* 1D95C 8001CD5C 02802021 */  addu       $a0, $s4, $zero
.L8001CD60:
/* 1D960 8001CD60 0C0009DF */  jal        two_bitshifting_funcs
/* 1D964 8001CD64 24050004 */   addiu     $a1, $zero, 4
/* 1D968 8001CD68 3046FFFF */  andi       $a2, $v0, 0xffff
/* 1D96C 8001CD6C 10C0000C */  beqz       $a2, .L8001CDA0
/* 1D970 8001CD70 02602021 */   addu      $a0, $s3, $zero
/* 1D974 8001CD74 00101080 */  sll        $v0, $s0, 2
/* 1D978 8001CD78 00501021 */  addu       $v0, $v0, $s0
/* 1D97C 8001CD7C 00021080 */  sll        $v0, $v0, 2
/* 1D980 8001CD80 8E4316A0 */  lw         $v1, 0x16a0($s2)
/* 1D984 8001CD84 00501023 */  subu       $v0, $v0, $s0
/* 1D988 8001CD88 8C650010 */  lw         $a1, 0x10($v1)
/* 1D98C 8001CD8C 00021040 */  sll        $v0, $v0, 1
/* 1D990 8001CD90 00451021 */  addu       $v0, $v0, $a1
/* 1D994 8001CD94 94450000 */  lhu        $a1, ($v0)
/* 1D998 8001CD98 0C0210AC */  jal        learn_spell
/* 1D99C 8001CD9C 30C600FF */   andi      $a2, $a2, 0xff
.L8001CDA0:
/* 1D9A0 8001CDA0 26020001 */  addiu      $v0, $s0, 1
/* 1D9A4 8001CDA4 305000FF */  andi       $s0, $v0, 0xff
/* 1D9A8 8001CDA8 0211182B */  sltu       $v1, $s0, $s1
/* 1D9AC 8001CDAC 1460FFEC */  bnez       $v1, .L8001CD60
/* 1D9B0 8001CDB0 02802021 */   addu      $a0, $s4, $zero
.L8001CDB4:
/* 1D9B4 8001CDB4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 1D9B8 8001CDB8 8FB40020 */  lw         $s4, 0x20($sp)
/* 1D9BC 8001CDBC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1D9C0 8001CDC0 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D9C4 8001CDC4 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D9C8 8001CDC8 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D9CC 8001CDCC 03E00008 */  jr         $ra
/* 1D9D0 8001CDD0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8001CDD4
/* 1D9D4 8001CDD4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D9D8 8001CDD8 AFB20018 */  sw         $s2, 0x18($sp)
/* 1D9DC 8001CDDC 00809021 */  addu       $s2, $a0, $zero
/* 1D9E0 8001CDE0 AFB00010 */  sw         $s0, 0x10($sp)
/* 1D9E4 8001CDE4 00A08021 */  addu       $s0, $a1, $zero
/* 1D9E8 8001CDE8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D9EC 8001CDEC 30D100FF */  andi       $s1, $a2, 0xff
/* 1D9F0 8001CDF0 16000005 */  bnez       $s0, .L8001CE08
/* 1D9F4 8001CDF4 AFBF001C */   sw        $ra, 0x1c($sp)
/* 1D9F8 8001CDF8 0C0009FD */  jal        func_800027F4
/* 1D9FC 8001CDFC 2405005C */   addiu     $a1, $zero, 0x5c
/* 1DA00 8001CE00 08007397 */  j          .L8001CE5C
/* 1DA04 8001CE04 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001CE08:
/* 1DA08 8001CE08 02402021 */  addu       $a0, $s2, $zero
/* 1DA0C 8001CE0C 02002821 */  addu       $a1, $s0, $zero
/* 1DA10 8001CE10 0C0072FF */  jal        func_8001CBFC
/* 1DA14 8001CE14 24060004 */   addiu     $a2, $zero, 4
/* 1DA18 8001CE18 02402021 */  addu       $a0, $s2, $zero
/* 1DA1C 8001CE1C 02002821 */  addu       $a1, $s0, $zero
/* 1DA20 8001CE20 0C0072FF */  jal        func_8001CBFC
/* 1DA24 8001CE24 02203021 */   addu      $a2, $s1, $zero
/* 1DA28 8001CE28 3C03800F */  lui        $v1, %hi(spell_pointer)
/* 1DA2C 8001CE2C 8C6216A0 */  lw         $v0, %lo(spell_pointer)($v1)
/* 1DA30 8001CE30 00511021 */  addu       $v0, $v0, $s1
/* 1DA34 8001CE34 90440001 */  lbu        $a0, 1($v0)
/* 1DA38 8001CE38 2403000D */  addiu      $v1, $zero, 0xd
/* 1DA3C 8001CE3C 00641823 */  subu       $v1, $v1, $a0
/* 1DA40 8001CE40 306300FF */  andi       $v1, $v1, 0xff
/* 1DA44 8001CE44 10600004 */  beqz       $v1, .L8001CE58
/* 1DA48 8001CE48 02402021 */   addu      $a0, $s2, $zero
/* 1DA4C 8001CE4C 00032880 */  sll        $a1, $v1, 2
/* 1DA50 8001CE50 0C0009FD */  jal        func_800027F4
/* 1DA54 8001CE54 30A500FC */   andi      $a1, $a1, 0xfc
.L8001CE58:
/* 1DA58 8001CE58 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001CE5C:
/* 1DA5C 8001CE5C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DA60 8001CE60 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DA64 8001CE64 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DA68 8001CE68 03E00008 */  jr         $ra
/* 1DA6C 8001CE6C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel loadSpellsFromSave
/* 1DA70 8001CE70 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1DA74 8001CE74 AFB20018 */  sw         $s2, 0x18($sp)
/* 1DA78 8001CE78 00809021 */  addu       $s2, $a0, $zero
/* 1DA7C 8001CE7C AFB00010 */  sw         $s0, 0x10($sp)
/* 1DA80 8001CE80 00A08021 */  addu       $s0, $a1, $zero
/* 1DA84 8001CE84 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DA88 8001CE88 30D100FF */  andi       $s1, $a2, 0xff
/* 1DA8C 8001CE8C 16000005 */  bnez       $s0, .L8001CEA4
/* 1DA90 8001CE90 AFBF001C */   sw        $ra, 0x1c($sp)
/* 1DA94 8001CE94 0C0009FD */  jal        func_800027F4
/* 1DA98 8001CE98 2405005C */   addiu     $a1, $zero, 0x5c
/* 1DA9C 8001CE9C 080073BE */  j          .L8001CEF8
/* 1DAA0 8001CEA0 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001CEA4:
/* 1DAA4 8001CEA4 02402021 */  addu       $a0, $s2, $zero
/* 1DAA8 8001CEA8 02002821 */  addu       $a1, $s0, $zero
/* 1DAAC 8001CEAC 0C00733F */  jal        func_8001CCFC
/* 1DAB0 8001CEB0 24060004 */   addiu     $a2, $zero, 4
/* 1DAB4 8001CEB4 02402021 */  addu       $a0, $s2, $zero
/* 1DAB8 8001CEB8 02002821 */  addu       $a1, $s0, $zero
/* 1DABC 8001CEBC 0C00733F */  jal        func_8001CCFC
/* 1DAC0 8001CEC0 02203021 */   addu      $a2, $s1, $zero
/* 1DAC4 8001CEC4 3C03800F */  lui        $v1, %hi(spell_pointer)
/* 1DAC8 8001CEC8 8C6216A0 */  lw         $v0, %lo(spell_pointer)($v1)
/* 1DACC 8001CECC 00511021 */  addu       $v0, $v0, $s1
/* 1DAD0 8001CED0 90440001 */  lbu        $a0, 1($v0)
/* 1DAD4 8001CED4 2403000D */  addiu      $v1, $zero, 0xd
/* 1DAD8 8001CED8 00641823 */  subu       $v1, $v1, $a0
/* 1DADC 8001CEDC 306300FF */  andi       $v1, $v1, 0xff
/* 1DAE0 8001CEE0 10600004 */  beqz       $v1, .L8001CEF4
/* 1DAE4 8001CEE4 02402021 */   addu      $a0, $s2, $zero
/* 1DAE8 8001CEE8 00032880 */  sll        $a1, $v1, 2
/* 1DAEC 8001CEEC 0C0009FD */  jal        func_800027F4
/* 1DAF0 8001CEF0 30A500FC */   andi      $a1, $a1, 0xfc
.L8001CEF4:
/* 1DAF4 8001CEF4 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001CEF8:
/* 1DAF8 8001CEF8 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DAFC 8001CEFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DB00 8001CF00 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DB04 8001CF04 03E00008 */  jr         $ra
/* 1DB08 8001CF08 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001CF0C
/* 1DB0C 8001CF0C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DB10 8001CF10 AFB00010 */  sw         $s0, 0x10($sp)
/* 1DB14 8001CF14 00808021 */  addu       $s0, $a0, $zero
/* 1DB18 8001CF18 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 1DB1C 8001CF1C 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* 1DB20 8001CF20 AFBF0014 */  sw         $ra, 0x14($sp)
/* 1DB24 8001CF24 0C0215C6 */  jal        get_inGame_time
/* 1DB28 8001CF28 00000000 */   nop
/* 1DB2C 8001CF2C 02002021 */  addu       $a0, $s0, $zero
/* 1DB30 8001CF30 00402821 */  addu       $a1, $v0, $zero
/* 1DB34 8001CF34 0C0009C0 */  jal        func_80002700
/* 1DB38 8001CF38 24060020 */   addiu     $a2, $zero, 0x20
/* 1DB3C 8001CF3C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1DB40 8001CF40 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DB44 8001CF44 03E00008 */  jr         $ra
/* 1DB48 8001CF48 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_ingame_time
/* 1DB4C 8001CF4C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DB50 8001CF50 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1DB54 8001CF54 0C0009DF */  jal        two_bitshifting_funcs
/* 1DB58 8001CF58 24050020 */   addiu     $a1, $zero, 0x20
/* 1DB5C 8001CF5C 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* 1DB60 8001CF60 8C641BBC */  lw         $a0, %lo(TerrainPointer)($v1)
/* 1DB64 8001CF64 0C0215C8 */  jal        set_inGame_time
/* 1DB68 8001CF68 00402821 */   addu      $a1, $v0, $zero
/* 1DB6C 8001CF6C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1DB70 8001CF70 03E00008 */  jr         $ra
/* 1DB74 8001CF74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_gold
/* 1DB78 8001CF78 3C02800E */  lui        $v0, %hi(partyPointer)
/* 1DB7C 8001CF7C 8C437EA0 */  lw         $v1, %lo(partyPointer)($v0)
/* 1DB80 8001CF80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DB84 8001CF84 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1DB88 8001CF88 8C650014 */  lw         $a1, 0x14($v1)
/* 1DB8C 8001CF8C 0C0009C0 */  jal        func_80002700
/* 1DB90 8001CF90 24060020 */   addiu     $a2, $zero, 0x20
/* 1DB94 8001CF94 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1DB98 8001CF98 03E00008 */  jr         $ra
/* 1DB9C 8001CF9C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_gold_
/* 1DBA0 8001CFA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DBA4 8001CFA4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1DBA8 8001CFA8 0C0009DF */  jal        two_bitshifting_funcs
/* 1DBAC 8001CFAC 24050020 */   addiu     $a1, $zero, 0x20
/* 1DBB0 8001CFB0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1DBB4 8001CFB4 03E00008 */  jr         $ra
/* 1DBB8 8001CFB8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001CFBC
/* 1DBBC 8001CFBC 3C0291A2 */  lui        $v0, 0x91a2
/* 1DBC0 8001CFC0 3442B3C5 */  ori        $v0, $v0, 0xb3c5
/* 1DBC4 8001CFC4 00A20019 */  multu      $a1, $v0
/* 1DBC8 8001CFC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DBCC 8001CFCC 2406000C */  addiu      $a2, $zero, 0xc
/* 1DBD0 8001CFD0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1DBD4 8001CFD4 00002810 */  mfhi       $a1
/* 1DBD8 8001CFD8 00052B02 */  srl        $a1, $a1, 0xc
/* 1DBDC 8001CFDC 0C0009C0 */  jal        func_80002700
/* 1DBE0 8001CFE0 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 1DBE4 8001CFE4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1DBE8 8001CFE8 03E00008 */  jr         $ra
/* 1DBEC 8001CFEC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel load_unk_party_var
/* 1DBF0 8001CFF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DBF4 8001CFF4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1DBF8 8001CFF8 0C0009DF */  jal        two_bitshifting_funcs
/* 1DBFC 8001CFFC 2405000C */   addiu     $a1, $zero, 0xc
/* 1DC00 8001D000 00401821 */  addu       $v1, $v0, $zero
/* 1DC04 8001D004 24020FFF */  addiu      $v0, $zero, 0xfff
/* 1DC08 8001D008 14620003 */  bne        $v1, $v0, .L8001D018
/* 1DC0C 8001D00C 000310C0 */   sll       $v0, $v1, 3
/* 1DC10 8001D010 0800740A */  j          .L8001D028
/* 1DC14 8001D014 2403FFFF */   addiu     $v1, $zero, -1
.L8001D018:
/* 1DC18 8001D018 00431023 */  subu       $v0, $v0, $v1
/* 1DC1C 8001D01C 00021140 */  sll        $v0, $v0, 5
/* 1DC20 8001D020 00431021 */  addu       $v0, $v0, $v1
/* 1DC24 8001D024 00021940 */  sll        $v1, $v0, 5
.L8001D028:
/* 1DC28 8001D028 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1DC2C 8001D02C 00601021 */  addu       $v0, $v1, $zero
/* 1DC30 8001D030 03E00008 */  jr         $ra
/* 1DC34 8001D034 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001D038
/* 1DC38 8001D038 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1DC3C 8001D03C AFB20018 */  sw         $s2, 0x18($sp)
/* 1DC40 8001D040 00809021 */  addu       $s2, $a0, $zero
/* 1DC44 8001D044 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1DC48 8001D048 00A09821 */  addu       $s3, $a1, $zero
/* 1DC4C 8001D04C AFBF0020 */  sw         $ra, 0x20($sp)
/* 1DC50 8001D050 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DC54 8001D054 AFB00010 */  sw         $s0, 0x10($sp)
/* 1DC58 8001D058 8E640004 */  lw         $a0, 4($s3)
/* 1DC5C 8001D05C 0C03353E */  jal        strlen
/* 1DC60 8001D060 00008021 */   addu      $s0, $zero, $zero
/* 1DC64 8001D064 305100FF */  andi       $s1, $v0, 0xff
/* 1DC68 8001D068 1220000D */  beqz       $s1, .L8001D0A0
/* 1DC6C 8001D06C 02402021 */   addu      $a0, $s2, $zero
/* 1DC70 8001D070 8E620004 */  lw         $v0, 4($s3)
.L8001D074:
/* 1DC74 8001D074 02402021 */  addu       $a0, $s2, $zero
/* 1DC78 8001D078 00501021 */  addu       $v0, $v0, $s0
/* 1DC7C 8001D07C 90450000 */  lbu        $a1, ($v0)
/* 1DC80 8001D080 0C0009C0 */  jal        func_80002700
/* 1DC84 8001D084 24060008 */   addiu     $a2, $zero, 8
/* 1DC88 8001D088 26020001 */  addiu      $v0, $s0, 1
/* 1DC8C 8001D08C 305000FF */  andi       $s0, $v0, 0xff
/* 1DC90 8001D090 0211182B */  sltu       $v1, $s0, $s1
/* 1DC94 8001D094 5460FFF7 */  bnel       $v1, $zero, .L8001D074
/* 1DC98 8001D098 8E620004 */   lw        $v0, 4($s3)
/* 1DC9C 8001D09C 02402021 */  addu       $a0, $s2, $zero
.L8001D0A0:
/* 1DCA0 8001D0A0 24050014 */  addiu      $a1, $zero, 0x14
/* 1DCA4 8001D0A4 00B12823 */  subu       $a1, $a1, $s1
/* 1DCA8 8001D0A8 0C0009FD */  jal        func_800027F4
/* 1DCAC 8001D0AC 000528C0 */   sll       $a1, $a1, 3
/* 1DCB0 8001D0B0 02402021 */  addu       $a0, $s2, $zero
/* 1DCB4 8001D0B4 8E65002C */  lw         $a1, 0x2c($s3)
/* 1DCB8 8001D0B8 0C0072FF */  jal        func_8001CBFC
/* 1DCBC 8001D0BC 24060001 */   addiu     $a2, $zero, 1
/* 1DCC0 8001D0C0 02402021 */  addu       $a0, $s2, $zero
/* 1DCC4 8001D0C4 8E65002C */  lw         $a1, 0x2c($s3)
/* 1DCC8 8001D0C8 0C0072FF */  jal        func_8001CBFC
/* 1DCCC 8001D0CC 24060002 */   addiu     $a2, $zero, 2
/* 1DCD0 8001D0D0 02402021 */  addu       $a0, $s2, $zero
/* 1DCD4 8001D0D4 8E65002C */  lw         $a1, 0x2c($s3)
/* 1DCD8 8001D0D8 0C0072FF */  jal        func_8001CBFC
/* 1DCDC 8001D0DC 24060003 */   addiu     $a2, $zero, 3
/* 1DCE0 8001D0E0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1DCE4 8001D0E4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1DCE8 8001D0E8 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DCEC 8001D0EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DCF0 8001D0F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DCF4 8001D0F4 03E00008 */  jr         $ra
/* 1DCF8 8001D0F8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8001D0FC
/* 1DCFC 8001D0FC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1DD00 8001D100 AFB20018 */  sw         $s2, 0x18($sp)
/* 1DD04 8001D104 00809021 */  addu       $s2, $a0, $zero
/* 1DD08 8001D108 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DD0C 8001D10C 00A08821 */  addu       $s1, $a1, $zero
/* 1DD10 8001D110 00002821 */  addu       $a1, $zero, $zero
/* 1DD14 8001D114 24060014 */  addiu      $a2, $zero, 0x14
/* 1DD18 8001D118 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1DD1C 8001D11C AFB00010 */  sw         $s0, 0x10($sp)
/* 1DD20 8001D120 8E240004 */  lw         $a0, 4($s1)
/* 1DD24 8001D124 0C026380 */  jal        Calloc
/* 1DD28 8001D128 00008021 */   addu      $s0, $zero, $zero
/* 1DD2C 8001D12C 02402021 */  addu       $a0, $s2, $zero
.L8001D130:
/* 1DD30 8001D130 0C0009DF */  jal        two_bitshifting_funcs
/* 1DD34 8001D134 24050008 */   addiu     $a1, $zero, 8
/* 1DD38 8001D138 8E230004 */  lw         $v1, 4($s1)
/* 1DD3C 8001D13C 26040001 */  addiu      $a0, $s0, 1
/* 1DD40 8001D140 00701821 */  addu       $v1, $v1, $s0
/* 1DD44 8001D144 309000FF */  andi       $s0, $a0, 0xff
/* 1DD48 8001D148 A0620000 */  sb         $v0, ($v1)
/* 1DD4C 8001D14C 2E020014 */  sltiu      $v0, $s0, 0x14
/* 1DD50 8001D150 1440FFF7 */  bnez       $v0, .L8001D130
/* 1DD54 8001D154 02402021 */   addu      $a0, $s2, $zero
/* 1DD58 8001D158 8E25002C */  lw         $a1, 0x2c($s1)
/* 1DD5C 8001D15C 0C00733F */  jal        func_8001CCFC
/* 1DD60 8001D160 24060001 */   addiu     $a2, $zero, 1
/* 1DD64 8001D164 02402021 */  addu       $a0, $s2, $zero
/* 1DD68 8001D168 8E25002C */  lw         $a1, 0x2c($s1)
/* 1DD6C 8001D16C 0C00733F */  jal        func_8001CCFC
/* 1DD70 8001D170 24060002 */   addiu     $a2, $zero, 2
/* 1DD74 8001D174 02402021 */  addu       $a0, $s2, $zero
/* 1DD78 8001D178 8E25002C */  lw         $a1, 0x2c($s1)
/* 1DD7C 8001D17C 0C00733F */  jal        func_8001CCFC
/* 1DD80 8001D180 24060003 */   addiu     $a2, $zero, 3
/* 1DD84 8001D184 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1DD88 8001D188 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DD8C 8001D18C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DD90 8001D190 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DD94 8001D194 03E00008 */  jr         $ra
/* 1DD98 8001D198 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D19C
/* 1DD9C 8001D19C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1DDA0 8001D1A0 AFB20018 */  sw         $s2, 0x18($sp)
/* 1DDA4 8001D1A4 00809021 */  addu       $s2, $a0, $zero
/* 1DDA8 8001D1A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DDAC 8001D1AC 00A08821 */  addu       $s1, $a1, $zero
/* 1DDB0 8001D1B0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1DDB4 8001D1B4 16200005 */  bnez       $s1, .L8001D1CC
/* 1DDB8 8001D1B8 AFB00010 */   sw        $s0, 0x10($sp)
/* 1DDBC 8001D1BC 0C0009FD */  jal        func_800027F4
/* 1DDC0 8001D1C0 240502D0 */   addiu     $a1, $zero, 0x2d0
/* 1DDC4 8001D1C4 080074A2 */  j          .L8001D288
/* 1DDC8 8001D1C8 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D1CC:
/* 1DDCC 8001D1CC 02402021 */  addu       $a0, $s2, $zero
/* 1DDD0 8001D1D0 24060008 */  addiu      $a2, $zero, 8
/* 1DDD4 8001D1D4 92250001 */  lbu        $a1, 1($s1)
/* 1DDD8 8001D1D8 0C0009C0 */  jal        func_80002700
/* 1DDDC 8001D1DC 00008021 */   addu      $s0, $zero, $zero
/* 1DDE0 8001D1E0 8E250014 */  lw         $a1, 0x14($s1)
/* 1DDE4 8001D1E4 0C0072AC */  jal        func_8001CAB0
/* 1DDE8 8001D1E8 02402021 */   addu      $a0, $s2, $zero
/* 1DDEC 8001D1EC 02402021 */  addu       $a0, $s2, $zero
/* 1DDF0 8001D1F0 0C0072E2 */  jal        func_8001CB88
/* 1DDF4 8001D1F4 02202821 */   addu      $a1, $s1, $zero
/* 1DDF8 8001D1F8 8E24001C */  lw         $a0, 0x1c($s1)
/* 1DDFC 8001D1FC 0C020D0D */  jal        func_80083434
/* 1DE00 8001D200 02402821 */   addu      $a1, $s2, $zero
/* 1DE04 8001D204 8E230020 */  lw         $v1, 0x20($s1)
.L8001D208:
/* 1DE08 8001D208 00101080 */  sll        $v0, $s0, 2
/* 1DE0C 8001D20C 00431021 */  addu       $v0, $v0, $v1
/* 1DE10 8001D210 8C450000 */  lw         $a1, ($v0)
/* 1DE14 8001D214 0C007260 */  jal        func_8001C980
/* 1DE18 8001D218 02402021 */   addu      $a0, $s2, $zero
/* 1DE1C 8001D21C 26020001 */  addiu      $v0, $s0, 1
/* 1DE20 8001D220 305000FF */  andi       $s0, $v0, 0xff
/* 1DE24 8001D224 2E030002 */  sltiu      $v1, $s0, 2
/* 1DE28 8001D228 5460FFF7 */  bnel       $v1, $zero, .L8001D208
/* 1DE2C 8001D22C 8E230020 */   lw        $v1, 0x20($s1)
/* 1DE30 8001D230 02402021 */  addu       $a0, $s2, $zero
/* 1DE34 8001D234 8E250024 */  lw         $a1, 0x24($s1)
/* 1DE38 8001D238 0C007260 */  jal        func_8001C980
/* 1DE3C 8001D23C 00008021 */   addu      $s0, $zero, $zero
/* 1DE40 8001D240 8E230028 */  lw         $v1, 0x28($s1)
.L8001D244:
/* 1DE44 8001D244 8C640000 */  lw         $a0, ($v1)
/* 1DE48 8001D248 00101080 */  sll        $v0, $s0, 2
/* 1DE4C 8001D24C 00441021 */  addu       $v0, $v0, $a0
/* 1DE50 8001D250 8C450000 */  lw         $a1, ($v0)
/* 1DE54 8001D254 0C007260 */  jal        func_8001C980
/* 1DE58 8001D258 02402021 */   addu      $a0, $s2, $zero
/* 1DE5C 8001D25C 26020001 */  addiu      $v0, $s0, 1
/* 1DE60 8001D260 305000FF */  andi       $s0, $v0, 0xff
/* 1DE64 8001D264 2E03000C */  sltiu      $v1, $s0, 0xc
/* 1DE68 8001D268 5460FFF6 */  bnel       $v1, $zero, .L8001D244
/* 1DE6C 8001D26C 8E230028 */   lw        $v1, 0x28($s1)
/* 1DE70 8001D270 8E220014 */  lw         $v0, 0x14($s1)
/* 1DE74 8001D274 8E25002C */  lw         $a1, 0x2c($s1)
/* 1DE78 8001D278 90460001 */  lbu        $a2, 1($v0)
/* 1DE7C 8001D27C 0C007375 */  jal        func_8001CDD4
/* 1DE80 8001D280 02402021 */   addu      $a0, $s2, $zero
/* 1DE84 8001D284 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D288:
/* 1DE88 8001D288 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DE8C 8001D28C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DE90 8001D290 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DE94 8001D294 03E00008 */  jr         $ra
/* 1DE98 8001D298 27BD0020 */   addiu     $sp, $sp, 0x20

glabel load_charsheet_values
/* 1DE9C 8001D29C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1DEA0 8001D2A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DEA4 8001D2A4 00808821 */  addu       $s1, $a0, $zero
/* 1DEA8 8001D2A8 24050008 */  addiu      $a1, $zero, 8
/* 1DEAC 8001D2AC AFBF001C */  sw         $ra, 0x1c($sp)
/* 1DEB0 8001D2B0 AFB20018 */  sw         $s2, 0x18($sp)
/* 1DEB4 8001D2B4 0C0009DF */  jal        two_bitshifting_funcs
/* 1DEB8 8001D2B8 AFB00010 */   sw        $s0, 0x10($sp)
/* 1DEBC 8001D2BC 3052FFFF */  andi       $s2, $v0, 0xffff
/* 1DEC0 8001D2C0 16400006 */  bnez       $s2, .L8001D2DC
/* 1DEC4 8001D2C4 24040048 */   addiu     $a0, $zero, 0x48
/* 1DEC8 8001D2C8 02202021 */  addu       $a0, $s1, $zero
/* 1DECC 8001D2CC 0C0009FD */  jal        func_800027F4
/* 1DED0 8001D2D0 240502C8 */   addiu     $a1, $zero, 0x2c8
/* 1DED4 8001D2D4 080074E9 */  j          .L8001D3A4
/* 1DED8 8001D2D8 00001021 */   addu      $v0, $zero, $zero
.L8001D2DC:
/* 1DEDC 8001D2DC 3C05800E */  lui        $a1, %hi(D_800D9720)
/* 1DEE0 8001D2E0 24A59720 */  addiu      $a1, $a1, %lo(D_800D9720)
/* 1DEE4 8001D2E4 0C025F9C */  jal        Malloc
/* 1DEE8 8001D2E8 240603B8 */   addiu     $a2, $zero, 0x3b8
/* 1DEEC 8001D2EC 00408021 */  addu       $s0, $v0, $zero
/* 1DEF0 8001D2F0 02002021 */  addu       $a0, $s0, $zero
/* 1DEF4 8001D2F4 26450200 */  addiu      $a1, $s2, 0x200
/* 1DEF8 8001D2F8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 1DEFC 8001D2FC 0C01DD95 */  jal        create_CharSheet
/* 1DF00 8001D300 24060003 */   addiu     $a2, $zero, 3
/* 1DF04 8001D304 0C01E26C */  jal        func_800789B0
/* 1DF08 8001D308 02002021 */   addu      $a0, $s0, $zero
/* 1DF0C 8001D30C 02202021 */  addu       $a0, $s1, $zero
/* 1DF10 8001D310 8E050014 */  lw         $a1, 0x14($s0)
/* 1DF14 8001D314 0C0072C4 */  jal        func_8001CB10
/* 1DF18 8001D318 00009021 */   addu      $s2, $zero, $zero
/* 1DF1C 8001D31C 8E050018 */  lw         $a1, 0x18($s0)
/* 1DF20 8001D320 0C0072F0 */  jal        func_8001CBC0
/* 1DF24 8001D324 02202021 */   addu      $a0, $s1, $zero
/* 1DF28 8001D328 8E04001C */  lw         $a0, 0x1c($s0)
/* 1DF2C 8001D32C 0C020D73 */  jal        func_800835CC
/* 1DF30 8001D330 02202821 */   addu      $a1, $s1, $zero
/* 1DF34 8001D334 02202021 */  addu       $a0, $s1, $zero
/* 1DF38 8001D338 0C0075B6 */  jal        func_8001D6D8
/* 1DF3C 8001D33C 02002821 */   addu      $a1, $s0, $zero
/* 1DF40 8001D340 02202021 */  addu       $a0, $s1, $zero
/* 1DF44 8001D344 0C007564 */  jal        func_8001D590
/* 1DF48 8001D348 02002821 */   addu      $a1, $s0, $zero
/* 1DF4C 8001D34C 02202021 */  addu       $a0, $s1, $zero
/* 1DF50 8001D350 0C00758E */  jal        func_8001D638
/* 1DF54 8001D354 02002821 */   addu      $a1, $s0, $zero
/* 1DF58 8001D358 02202021 */  addu       $a0, $s1, $zero
.L8001D35C:
/* 1DF5C 8001D35C 0C0075E0 */  jal        func_8001D780
/* 1DF60 8001D360 02002821 */   addu      $a1, $s0, $zero
/* 1DF64 8001D364 26420001 */  addiu      $v0, $s2, 1
/* 1DF68 8001D368 305200FF */  andi       $s2, $v0, 0xff
/* 1DF6C 8001D36C 2E43000C */  sltiu      $v1, $s2, 0xc
/* 1DF70 8001D370 5460FFFA */  bnel       $v1, $zero, .L8001D35C
/* 1DF74 8001D374 02202021 */   addu      $a0, $s1, $zero
/* 1DF78 8001D378 0C021122 */  jal        spellbok_free
/* 1DF7C 8001D37C 8E04002C */   lw        $a0, 0x2c($s0)
/* 1DF80 8001D380 8E04002C */  lw         $a0, 0x2c($s0)
/* 1DF84 8001D384 0C021093 */  jal        malloc_spell
/* 1DF88 8001D388 00002821 */   addu      $a1, $zero, $zero
/* 1DF8C 8001D38C 8E020014 */  lw         $v0, 0x14($s0)
/* 1DF90 8001D390 8E05002C */  lw         $a1, 0x2c($s0)
/* 1DF94 8001D394 90460001 */  lbu        $a2, 1($v0)
/* 1DF98 8001D398 0C00739C */  jal        loadSpellsFromSave
/* 1DF9C 8001D39C 02202021 */   addu      $a0, $s1, $zero
/* 1DFA0 8001D3A0 02001021 */  addu       $v0, $s0, $zero
.L8001D3A4:
/* 1DFA4 8001D3A4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1DFA8 8001D3A8 8FB20018 */  lw         $s2, 0x18($sp)
/* 1DFAC 8001D3AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 1DFB0 8001D3B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 1DFB4 8001D3B4 03E00008 */  jr         $ra
/* 1DFB8 8001D3B8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D3BC
/* 1DFBC 8001D3BC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1DFC0 8001D3C0 AFB20018 */  sw         $s2, 0x18($sp)
/* 1DFC4 8001D3C4 00809021 */  addu       $s2, $a0, $zero
/* 1DFC8 8001D3C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1DFCC 8001D3CC 00A08821 */  addu       $s1, $a1, $zero
/* 1DFD0 8001D3D0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1DFD4 8001D3D4 16200005 */  bnez       $s1, .L8001D3EC
/* 1DFD8 8001D3D8 AFB00010 */   sw        $s0, 0x10($sp)
/* 1DFDC 8001D3DC 0C0009FD */  jal        func_800027F4
/* 1DFE0 8001D3E0 24050500 */   addiu     $a1, $zero, 0x500
/* 1DFE4 8001D3E4 08007525 */  j          .L8001D494
/* 1DFE8 8001D3E8 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D3EC:
/* 1DFEC 8001D3EC 02402021 */  addu       $a0, $s2, $zero
/* 1DFF0 8001D3F0 0C007467 */  jal        func_8001D19C
/* 1DFF4 8001D3F4 02202821 */   addu      $a1, $s1, $zero
/* 1DFF8 8001D3F8 8E220034 */  lw         $v0, 0x34($s1)
/* 1DFFC 8001D3FC 1040000E */  beqz       $v0, .L8001D438
/* 1E000 8001D400 00008021 */   addu      $s0, $zero, $zero
/* 1E004 8001D404 8E230034 */  lw         $v1, 0x34($s1)
.L8001D408:
/* 1E008 8001D408 00101080 */  sll        $v0, $s0, 2
/* 1E00C 8001D40C 00431021 */  addu       $v0, $v0, $v1
/* 1E010 8001D410 8C450000 */  lw         $a1, ($v0)
/* 1E014 8001D414 0C0071CC */  jal        func_8001C730
/* 1E018 8001D418 02402021 */   addu      $a0, $s2, $zero
/* 1E01C 8001D41C 26020001 */  addiu      $v0, $s0, 1
/* 1E020 8001D420 305000FF */  andi       $s0, $v0, 0xff
/* 1E024 8001D424 2E03000F */  sltiu      $v1, $s0, 0xf
/* 1E028 8001D428 5460FFF7 */  bnel       $v1, $zero, .L8001D408
/* 1E02C 8001D42C 8E230034 */   lw        $v1, 0x34($s1)
/* 1E030 8001D430 08007512 */  j          .L8001D448
/* 1E034 8001D434 8E220038 */   lw        $v0, 0x38($s1)
.L8001D438:
/* 1E038 8001D438 02402021 */  addu       $a0, $s2, $zero
/* 1E03C 8001D43C 0C0009FD */  jal        func_800027F4
/* 1E040 8001D440 240501A4 */   addiu     $a1, $zero, 0x1a4
/* 1E044 8001D444 8E220038 */  lw         $v0, 0x38($s1)
.L8001D448:
/* 1E048 8001D448 1040000E */  beqz       $v0, .L8001D484
/* 1E04C 8001D44C 00008021 */   addu      $s0, $zero, $zero
/* 1E050 8001D450 8E230038 */  lw         $v1, 0x38($s1)
.L8001D454:
/* 1E054 8001D454 00101080 */  sll        $v0, $s0, 2
/* 1E058 8001D458 00431021 */  addu       $v0, $v0, $v1
/* 1E05C 8001D45C 8C450000 */  lw         $a1, ($v0)
/* 1E060 8001D460 0C007190 */  jal        func_8001C640
/* 1E064 8001D464 02402021 */   addu      $a0, $s2, $zero
/* 1E068 8001D468 26020001 */  addiu      $v0, $s0, 1
/* 1E06C 8001D46C 305000FF */  andi       $s0, $v0, 0xff
/* 1E070 8001D470 2E030007 */  sltiu      $v1, $s0, 7
/* 1E074 8001D474 5460FFF7 */  bnel       $v1, $zero, .L8001D454
/* 1E078 8001D478 8E230038 */   lw        $v1, 0x38($s1)
/* 1E07C 8001D47C 08007525 */  j          .L8001D494
/* 1E080 8001D480 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D484:
/* 1E084 8001D484 02402021 */  addu       $a0, $s2, $zero
/* 1E088 8001D488 0C0009FD */  jal        func_800027F4
/* 1E08C 8001D48C 2405008C */   addiu     $a1, $zero, 0x8c
/* 1E090 8001D490 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D494:
/* 1E094 8001D494 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E098 8001D498 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E09C 8001D49C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E0A0 8001D4A0 03E00008 */  jr         $ra
/* 1E0A4 8001D4A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel load_charsheet
/* 1E0A8 8001D4A8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1E0AC 8001D4AC AFB20018 */  sw         $s2, 0x18($sp)
/* 1E0B0 8001D4B0 00809021 */  addu       $s2, $a0, $zero
/* 1E0B4 8001D4B4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1E0B8 8001D4B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1E0BC 8001D4BC 0C0074A7 */  jal        load_charsheet_values
/* 1E0C0 8001D4C0 AFB00010 */   sw        $s0, 0x10($sp)
/* 1E0C4 8001D4C4 00408821 */  addu       $s1, $v0, $zero
/* 1E0C8 8001D4C8 16200006 */  bnez       $s1, .L8001D4E4
/* 1E0CC 8001D4CC 00008021 */   addu      $s0, $zero, $zero
/* 1E0D0 8001D4D0 02402021 */  addu       $a0, $s2, $zero
/* 1E0D4 8001D4D4 0C0009FD */  jal        func_800027F4
/* 1E0D8 8001D4D8 24050230 */   addiu     $a1, $zero, 0x230
/* 1E0DC 8001D4DC 0800755E */  j          .L8001D578
/* 1E0E0 8001D4E0 00001021 */   addu      $v0, $zero, $zero
.L8001D4E4:
/* 1E0E4 8001D4E4 0C0071F1 */  jal        saveParty_func
/* 1E0E8 8001D4E8 02402021 */   addu      $a0, $s2, $zero
/* 1E0EC 8001D4EC 00101880 */  sll        $v1, $s0, 2
/* 1E0F0 8001D4F0 26040001 */  addiu      $a0, $s0, 1
/* 1E0F4 8001D4F4 8E250034 */  lw         $a1, 0x34($s1)
/* 1E0F8 8001D4F8 309000FF */  andi       $s0, $a0, 0xff
/* 1E0FC 8001D4FC 00651821 */  addu       $v1, $v1, $a1
/* 1E100 8001D500 AC620000 */  sw         $v0, ($v1)
/* 1E104 8001D504 2E02000F */  sltiu      $v0, $s0, 0xf
/* 1E108 8001D508 1440FFF6 */  bnez       $v0, .L8001D4E4
/* 1E10C 8001D50C 2404001C */   addiu     $a0, $zero, 0x1c
/* 1E110 8001D510 3C05800E */  lui        $a1, %hi(D_800D9720)
/* 1E114 8001D514 24A59720 */  addiu      $a1, $a1, %lo(D_800D9720)
/* 1E118 8001D518 0C025F9C */  jal        Malloc
/* 1E11C 8001D51C 2406041F */   addiu     $a2, $zero, 0x41f
/* 1E120 8001D520 AE220038 */  sw         $v0, 0x38($s1)
/* 1E124 8001D524 00402021 */  addu       $a0, $v0, $zero
/* 1E128 8001D528 00002821 */  addu       $a1, $zero, $zero
/* 1E12C 8001D52C 0C026380 */  jal        Calloc
/* 1E130 8001D530 2406001C */   addiu     $a2, $zero, 0x1c
/* 1E134 8001D534 00008021 */  addu       $s0, $zero, $zero
/* 1E138 8001D538 02402021 */  addu       $a0, $s2, $zero
.L8001D53C:
/* 1E13C 8001D53C 0C0071AB */  jal        func_8001C6AC
/* 1E140 8001D540 02202821 */   addu      $a1, $s1, $zero
/* 1E144 8001D544 26030001 */  addiu      $v1, $s0, 1
/* 1E148 8001D548 307000FF */  andi       $s0, $v1, 0xff
/* 1E14C 8001D54C 2E020007 */  sltiu      $v0, $s0, 7
/* 1E150 8001D550 5440FFFA */  bnel       $v0, $zero, .L8001D53C
/* 1E154 8001D554 02402021 */   addu      $a0, $s2, $zero
/* 1E158 8001D558 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 1E15C 8001D55C 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 1E160 8001D560 0C01D531 */  jal        getEntityPortait
/* 1E164 8001D564 96250000 */   lhu       $a1, ($s1)
/* 1E168 8001D568 0C0290E2 */  jal        get_borg_8
/* 1E16C 8001D56C 00402021 */   addu      $a0, $v0, $zero
/* 1E170 8001D570 AE220044 */  sw         $v0, 0x44($s1)
/* 1E174 8001D574 02201021 */  addu       $v0, $s1, $zero
.L8001D578:
/* 1E178 8001D578 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1E17C 8001D57C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E180 8001D580 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E184 8001D584 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E188 8001D588 03E00008 */  jr         $ra
/* 1E18C 8001D58C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D590
/* 1E190 8001D590 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1E194 8001D594 AFB20018 */  sw         $s2, 0x18($sp)
/* 1E198 8001D598 00A09021 */  addu       $s2, $a1, $zero
/* 1E19C 8001D59C AFBF001C */  sw         $ra, 0x1c($sp)
/* 1E1A0 8001D5A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 1E1A4 8001D5A4 AFB00010 */  sw         $s0, 0x10($sp)
/* 1E1A8 8001D5A8 8E420020 */  lw         $v0, 0x20($s2)
/* 1E1AC 8001D5AC 8C430004 */  lw         $v1, 4($v0)
/* 1E1B0 8001D5B0 10600003 */  beqz       $v1, .L8001D5C0
/* 1E1B4 8001D5B4 00808021 */   addu      $s0, $a0, $zero
/* 1E1B8 8001D5B8 0C01E1AC */  jal        remove_sheild
/* 1E1BC 8001D5BC 02402021 */   addu      $a0, $s2, $zero
.L8001D5C0:
/* 1E1C0 8001D5C0 02002021 */  addu       $a0, $s0, $zero
/* 1E1C4 8001D5C4 0C0009DF */  jal        two_bitshifting_funcs
/* 1E1C8 8001D5C8 2405000D */   addiu     $a1, $zero, 0xd
/* 1E1CC 8001D5CC 3051FFFF */  andi       $s1, $v0, 0xffff
/* 1E1D0 8001D5D0 16200005 */  bnez       $s1, .L8001D5E8
/* 1E1D4 8001D5D4 02002021 */   addu      $a0, $s0, $zero
/* 1E1D8 8001D5D8 0C0009FD */  jal        func_800027F4
/* 1E1DC 8001D5DC 2405000F */   addiu     $a1, $zero, 0xf
/* 1E1E0 8001D5E0 08007589 */  j          .L8001D624
/* 1E1E4 8001D5E4 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D5E8:
/* 1E1E8 8001D5E8 0C0009DF */  jal        two_bitshifting_funcs
/* 1E1EC 8001D5EC 24050005 */   addiu     $a1, $zero, 5
/* 1E1F0 8001D5F0 02002021 */  addu       $a0, $s0, $zero
/* 1E1F4 8001D5F4 0C007242 */  jal        saveparty_malloc
/* 1E1F8 8001D5F8 305000FF */   andi      $s0, $v0, 0xff
/* 1E1FC 8001D5FC 02402021 */  addu       $a0, $s2, $zero
/* 1E200 8001D600 02202821 */  addu       $a1, $s1, $zero
/* 1E204 8001D604 0C01E0CA */  jal        EquipSheild
/* 1E208 8001D608 00403021 */   addu      $a2, $v0, $zero
/* 1E20C 8001D60C 8E430020 */  lw         $v1, 0x20($s2)
/* 1E210 8001D610 8C620004 */  lw         $v0, 4($v1)
/* 1E214 8001D614 8C440010 */  lw         $a0, 0x10($v0)
/* 1E218 8001D618 54800001 */  bnel       $a0, $zero, .L8001D620
/* 1E21C 8001D61C A0900004 */   sb        $s0, 4($a0)
.L8001D620:
/* 1E220 8001D620 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D624:
/* 1E224 8001D624 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E228 8001D628 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E22C 8001D62C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E230 8001D630 03E00008 */  jr         $ra
/* 1E234 8001D634 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D638
/* 1E238 8001D638 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1E23C 8001D63C AFB20018 */  sw         $s2, 0x18($sp)
/* 1E240 8001D640 00A09021 */  addu       $s2, $a1, $zero
/* 1E244 8001D644 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1E248 8001D648 AFB10014 */  sw         $s1, 0x14($sp)
/* 1E24C 8001D64C AFB00010 */  sw         $s0, 0x10($sp)
/* 1E250 8001D650 8E420024 */  lw         $v0, 0x24($s2)
/* 1E254 8001D654 10400003 */  beqz       $v0, .L8001D664
/* 1E258 8001D658 00808021 */   addu      $s0, $a0, $zero
/* 1E25C 8001D65C 0C01E1E4 */  jal        unequp_weapons
/* 1E260 8001D660 02402021 */   addu      $a0, $s2, $zero
.L8001D664:
/* 1E264 8001D664 02002021 */  addu       $a0, $s0, $zero
/* 1E268 8001D668 0C0009DF */  jal        two_bitshifting_funcs
/* 1E26C 8001D66C 2405000D */   addiu     $a1, $zero, 0xd
/* 1E270 8001D670 3051FFFF */  andi       $s1, $v0, 0xffff
/* 1E274 8001D674 16200005 */  bnez       $s1, .L8001D68C
/* 1E278 8001D678 02002021 */   addu      $a0, $s0, $zero
/* 1E27C 8001D67C 0C0009FD */  jal        func_800027F4
/* 1E280 8001D680 2405000F */   addiu     $a1, $zero, 0xf
/* 1E284 8001D684 080075B1 */  j          .L8001D6C4
/* 1E288 8001D688 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D68C:
/* 1E28C 8001D68C 0C0009DF */  jal        two_bitshifting_funcs
/* 1E290 8001D690 24050005 */   addiu     $a1, $zero, 5
/* 1E294 8001D694 02002021 */  addu       $a0, $s0, $zero
/* 1E298 8001D698 0C007242 */  jal        saveparty_malloc
/* 1E29C 8001D69C 305000FF */   andi      $s0, $v0, 0xff
/* 1E2A0 8001D6A0 02402021 */  addu       $a0, $s2, $zero
/* 1E2A4 8001D6A4 02202821 */  addu       $a1, $s1, $zero
/* 1E2A8 8001D6A8 0C01E0E2 */  jal        EquipWeapon
/* 1E2AC 8001D6AC 00403021 */   addu      $a2, $v0, $zero
/* 1E2B0 8001D6B0 8E430024 */  lw         $v1, 0x24($s2)
/* 1E2B4 8001D6B4 8C640010 */  lw         $a0, 0x10($v1)
/* 1E2B8 8001D6B8 54800001 */  bnel       $a0, $zero, .L8001D6C0
/* 1E2BC 8001D6BC A0900004 */   sb        $s0, 4($a0)
.L8001D6C0:
/* 1E2C0 8001D6C0 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D6C4:
/* 1E2C4 8001D6C4 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E2C8 8001D6C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E2CC 8001D6CC 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E2D0 8001D6D0 03E00008 */  jr         $ra
/* 1E2D4 8001D6D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D6D8
/* 1E2D8 8001D6D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1E2DC 8001D6DC AFB20018 */  sw         $s2, 0x18($sp)
/* 1E2E0 8001D6E0 00A09021 */  addu       $s2, $a1, $zero
/* 1E2E4 8001D6E4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1E2E8 8001D6E8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1E2EC 8001D6EC AFB00010 */  sw         $s0, 0x10($sp)
/* 1E2F0 8001D6F0 8E420020 */  lw         $v0, 0x20($s2)
/* 1E2F4 8001D6F4 8C430000 */  lw         $v1, ($v0)
/* 1E2F8 8001D6F8 10600003 */  beqz       $v1, .L8001D708
/* 1E2FC 8001D6FC 00808021 */   addu      $s0, $a0, $zero
/* 1E300 8001D700 0C01E1A5 */  jal        remove_chestArmor
/* 1E304 8001D704 02402021 */   addu      $a0, $s2, $zero
.L8001D708:
/* 1E308 8001D708 02002021 */  addu       $a0, $s0, $zero
/* 1E30C 8001D70C 0C0009DF */  jal        two_bitshifting_funcs
/* 1E310 8001D710 2405000D */   addiu     $a1, $zero, 0xd
/* 1E314 8001D714 3051FFFF */  andi       $s1, $v0, 0xffff
/* 1E318 8001D718 16200005 */  bnez       $s1, .L8001D730
/* 1E31C 8001D71C 02002021 */   addu      $a0, $s0, $zero
/* 1E320 8001D720 0C0009FD */  jal        func_800027F4
/* 1E324 8001D724 2405000F */   addiu     $a1, $zero, 0xf
/* 1E328 8001D728 080075DB */  j          .L8001D76C
/* 1E32C 8001D72C 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D730:
/* 1E330 8001D730 0C0009DF */  jal        two_bitshifting_funcs
/* 1E334 8001D734 24050005 */   addiu     $a1, $zero, 5
/* 1E338 8001D738 02002021 */  addu       $a0, $s0, $zero
/* 1E33C 8001D73C 0C007242 */  jal        saveparty_malloc
/* 1E340 8001D740 305000FF */   andi      $s0, $v0, 0xff
/* 1E344 8001D744 02402021 */  addu       $a0, $s2, $zero
/* 1E348 8001D748 02202821 */  addu       $a1, $s1, $zero
/* 1E34C 8001D74C 0C01E0C2 */  jal        Equip_Armor
/* 1E350 8001D750 00403021 */   addu      $a2, $v0, $zero
/* 1E354 8001D754 8E420020 */  lw         $v0, 0x20($s2)
/* 1E358 8001D758 8C430000 */  lw         $v1, ($v0)
/* 1E35C 8001D75C 8C640010 */  lw         $a0, 0x10($v1)
/* 1E360 8001D760 54800001 */  bnel       $a0, $zero, .L8001D768
/* 1E364 8001D764 A0900004 */   sb        $s0, 4($a0)
.L8001D768:
/* 1E368 8001D768 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D76C:
/* 1E36C 8001D76C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E370 8001D770 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E374 8001D774 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E378 8001D778 03E00008 */  jr         $ra
/* 1E37C 8001D77C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001D780
/* 1E380 8001D780 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1E384 8001D784 AFB00010 */  sw         $s0, 0x10($sp)
/* 1E388 8001D788 00808021 */  addu       $s0, $a0, $zero
/* 1E38C 8001D78C AFB20018 */  sw         $s2, 0x18($sp)
/* 1E390 8001D790 00A09021 */  addu       $s2, $a1, $zero
/* 1E394 8001D794 2405000D */  addiu      $a1, $zero, 0xd
/* 1E398 8001D798 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1E39C 8001D79C 0C0009DF */  jal        two_bitshifting_funcs
/* 1E3A0 8001D7A0 AFB10014 */   sw        $s1, 0x14($sp)
/* 1E3A4 8001D7A4 3051FFFF */  andi       $s1, $v0, 0xffff
/* 1E3A8 8001D7A8 16200005 */  bnez       $s1, .L8001D7C0
/* 1E3AC 8001D7AC 02002021 */   addu      $a0, $s0, $zero
/* 1E3B0 8001D7B0 0C0009FD */  jal        func_800027F4
/* 1E3B4 8001D7B4 2405000F */   addiu     $a1, $zero, 0xf
/* 1E3B8 8001D7B8 08007602 */  j          .L8001D808
/* 1E3BC 8001D7BC 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001D7C0:
/* 1E3C0 8001D7C0 0C0009DF */  jal        two_bitshifting_funcs
/* 1E3C4 8001D7C4 24050005 */   addiu     $a1, $zero, 5
/* 1E3C8 8001D7C8 02002021 */  addu       $a0, $s0, $zero
/* 1E3CC 8001D7CC 0C007242 */  jal        saveparty_malloc
/* 1E3D0 8001D7D0 305000FF */   andi      $s0, $v0, 0xff
/* 1E3D4 8001D7D4 02402021 */  addu       $a0, $s2, $zero
/* 1E3D8 8001D7D8 02202821 */  addu       $a1, $s1, $zero
/* 1E3DC 8001D7DC 0C01E103 */  jal        func_8007840C
/* 1E3E0 8001D7E0 00403021 */   addu      $a2, $v0, $zero
/* 1E3E4 8001D7E4 8E430028 */  lw         $v1, 0x28($s2)
/* 1E3E8 8001D7E8 8C640000 */  lw         $a0, ($v1)
/* 1E3EC 8001D7EC 00021080 */  sll        $v0, $v0, 2
/* 1E3F0 8001D7F0 00441021 */  addu       $v0, $v0, $a0
/* 1E3F4 8001D7F4 8C430000 */  lw         $v1, ($v0)
/* 1E3F8 8001D7F8 8C640010 */  lw         $a0, 0x10($v1)
/* 1E3FC 8001D7FC 54800001 */  bnel       $a0, $zero, .L8001D804
/* 1E400 8001D800 A0900004 */   sb        $s0, 4($a0)
.L8001D804:
/* 1E404 8001D804 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001D808:
/* 1E408 8001D808 8FB20018 */  lw         $s2, 0x18($sp)
/* 1E40C 8001D80C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1E410 8001D810 8FB00010 */  lw         $s0, 0x10($sp)
/* 1E414 8001D814 03E00008 */  jr         $ra
/* 1E418 8001D818 27BD0020 */   addiu     $sp, $sp, 0x20
/* 1E41C 8001D81C 00000000 */  nop
