.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_inventory
/* 7D2D0 8007C6D0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7D2D4 8007C6D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D2D8 8007C6D8 00808021 */  addu       $s0, $a0, $zero
/* 7D2DC 8007C6DC 3C02800E */  lui        $v0, %hi(inventory_funcs)
/* 7D2E0 8007C6E0 24420A10 */  addiu      $v0, $v0, %lo(inventory_funcs)
/* 7D2E4 8007C6E4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7D2E8 8007C6E8 0C01F1D7 */  jal        clear_inventory
/* 7D2EC 8007C6EC AE020000 */   sw        $v0, ($s0)
/* 7D2F0 8007C6F0 02001021 */  addu       $v0, $s0, $zero
/* 7D2F4 8007C6F4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7D2F8 8007C6F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D2FC 8007C6FC 03E00008 */  jr         $ra
/* 7D300 8007C700 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007C704
/* 7D304 8007C704 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D308 8007C708 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D30C 8007C70C 00808821 */  addu       $s1, $a0, $zero
/* 7D310 8007C710 3C02800E */  lui        $v0, %hi(inventory_funcs)
/* 7D314 8007C714 24420A10 */  addiu      $v0, $v0, %lo(inventory_funcs)
/* 7D318 8007C718 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D31C 8007C71C 00A08021 */  addu       $s0, $a1, $zero
/* 7D320 8007C720 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7D324 8007C724 0C01F1E4 */  jal        func_8007C790
/* 7D328 8007C728 AE220000 */   sw        $v0, ($s1)
/* 7D32C 8007C72C 3C02800E */  lui        $v0, %hi(D_800E0A88)
/* 7D330 8007C730 24420A88 */  addiu      $v0, $v0, %lo(D_800E0A88)
/* 7D334 8007C734 32100001 */  andi       $s0, $s0, 1
/* 7D338 8007C738 12000003 */  beqz       $s0, .L8007C748
/* 7D33C 8007C73C AE220000 */   sw        $v0, ($s1)
/* 7D340 8007C740 0C026262 */  jal        passToFree
/* 7D344 8007C744 02202021 */   addu      $a0, $s1, $zero
.L8007C748:
/* 7D348 8007C748 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7D34C 8007C74C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D350 8007C750 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D354 8007C754 03E00008 */  jr         $ra
/* 7D358 8007C758 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_inventory
/* 7D35C 8007C75C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7D360 8007C760 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D364 8007C764 00808021 */  addu       $s0, $a0, $zero
/* 7D368 8007C768 26040004 */  addiu      $a0, $s0, 4
/* 7D36C 8007C76C 00002821 */  addu       $a1, $zero, $zero
/* 7D370 8007C770 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7D374 8007C774 0C026380 */  jal        Calloc
/* 7D378 8007C778 240617A0 */   addiu     $a2, $zero, 0x17a0
/* 7D37C 8007C77C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7D380 8007C780 AE0017A4 */  sw         $zero, 0x17a4($s0)
/* 7D384 8007C784 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D388 8007C788 03E00008 */  jr         $ra
/* 7D38C 8007C78C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007C790
/* 7D390 8007C790 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7D394 8007C794 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D398 8007C798 00009021 */  addu       $s2, $zero, $zero
/* 7D39C 8007C79C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7D3A0 8007C7A0 00809821 */  addu       $s3, $a0, $zero
/* 7D3A4 8007C7A4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D3A8 8007C7A8 26710004 */  addiu      $s1, $s3, 4
/* 7D3AC 8007C7AC AFB00010 */  sw         $s0, 0x10($sp)
/* 7D3B0 8007C7B0 26700018 */  addiu      $s0, $s3, 0x18
/* 7D3B4 8007C7B4 AFBF0020 */  sw         $ra, 0x20($sp)
.L8007C7B8:
/* 7D3B8 8007C7B8 8E020000 */  lw         $v0, ($s0)
/* 7D3BC 8007C7BC 50400007 */  beql       $v0, $zero, .L8007C7DC
/* 7D3C0 8007C7C0 26310018 */   addiu     $s1, $s1, 0x18
/* 7D3C4 8007C7C4 9602FFEC */  lhu        $v0, -0x14($s0)
/* 7D3C8 8007C7C8 10400003 */  beqz       $v0, .L8007C7D8
/* 7D3CC 8007C7CC AE000000 */   sw        $zero, ($s0)
/* 7D3D0 8007C7D0 0C01EF3A */  jal        clear_temp_Stat_spell
/* 7D3D4 8007C7D4 02202021 */   addu      $a0, $s1, $zero
.L8007C7D8:
/* 7D3D8 8007C7D8 26310018 */  addiu      $s1, $s1, 0x18
.L8007C7DC:
/* 7D3DC 8007C7DC 26520001 */  addiu      $s2, $s2, 1
/* 7D3E0 8007C7E0 2E4200FC */  sltiu      $v0, $s2, 0xfc
/* 7D3E4 8007C7E4 1440FFF4 */  bnez       $v0, .L8007C7B8
/* 7D3E8 8007C7E8 26100018 */   addiu     $s0, $s0, 0x18
/* 7D3EC 8007C7EC 8E620000 */  lw         $v0, ($s3)
/* 7D3F0 8007C7F0 84440010 */  lh         $a0, 0x10($v0)
/* 7D3F4 8007C7F4 8C430014 */  lw         $v1, 0x14($v0)
/* 7D3F8 8007C7F8 0060F809 */  jalr       $v1
/* 7D3FC 8007C7FC 02642021 */   addu      $a0, $s3, $a0
/* 7D400 8007C800 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7D404 8007C804 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D408 8007C808 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D40C 8007C80C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D410 8007C810 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D414 8007C814 03E00008 */  jr         $ra
/* 7D418 8007C818 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007C81C
/* 7D41C 8007C81C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7D420 8007C820 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D424 8007C824 00809021 */  addu       $s2, $a0, $zero
/* 7D428 8007C828 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7D42C 8007C82C 00009821 */  addu       $s3, $zero, $zero
/* 7D430 8007C830 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7D434 8007C834 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D438 8007C838 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D43C 8007C83C 8E420000 */  lw         $v0, ($s2)
/* 7D440 8007C840 00A08821 */  addu       $s1, $a1, $zero
/* 7D444 8007C844 84440018 */  lh         $a0, 0x18($v0)
/* 7D448 8007C848 8C43001C */  lw         $v1, 0x1c($v0)
/* 7D44C 8007C84C 0060F809 */  jalr       $v1
/* 7D450 8007C850 02442021 */   addu      $a0, $s2, $a0
/* 7D454 8007C854 26500004 */  addiu      $s0, $s2, 4
/* 7D458 8007C858 02202021 */  addu       $a0, $s1, $zero
.L8007C85C:
/* 7D45C 8007C85C 0C0009DF */  jal        two_bitshifting_funcs
/* 7D460 8007C860 24050008 */   addiu     $a1, $zero, 8
/* 7D464 8007C864 14400006 */  bnez       $v0, .L8007C880
/* 7D468 8007C868 AE020014 */   sw        $v0, 0x14($s0)
/* 7D46C 8007C86C 02202021 */  addu       $a0, $s1, $zero
/* 7D470 8007C870 0C007280 */  jal        func_8001CA00
/* 7D474 8007C874 00002821 */   addu      $a1, $zero, $zero
/* 7D478 8007C878 0801F227 */  j          .L8007C89C
/* 7D47C 8007C87C 26100018 */   addiu     $s0, $s0, 0x18
.L8007C880:
/* 7D480 8007C880 02202021 */  addu       $a0, $s1, $zero
/* 7D484 8007C884 0C007280 */  jal        func_8001CA00
/* 7D488 8007C888 02002821 */   addu      $a1, $s0, $zero
/* 7D48C 8007C88C 8E4217A4 */  lw         $v0, 0x17a4($s2)
/* 7D490 8007C890 24420001 */  addiu      $v0, $v0, 1
/* 7D494 8007C894 AE4217A4 */  sw         $v0, 0x17a4($s2)
/* 7D498 8007C898 26100018 */  addiu      $s0, $s0, 0x18
.L8007C89C:
/* 7D49C 8007C89C 26730001 */  addiu      $s3, $s3, 1
/* 7D4A0 8007C8A0 2E620080 */  sltiu      $v0, $s3, 0x80
/* 7D4A4 8007C8A4 5440FFED */  bnel       $v0, $zero, .L8007C85C
/* 7D4A8 8007C8A8 02202021 */   addu      $a0, $s1, $zero
/* 7D4AC 8007C8AC 02402021 */  addu       $a0, $s2, $zero
/* 7D4B0 8007C8B0 0C01F3CA */  jal        func_8007CF28
/* 7D4B4 8007C8B4 02202821 */   addu      $a1, $s1, $zero
/* 7D4B8 8007C8B8 02402021 */  addu       $a0, $s2, $zero
/* 7D4BC 8007C8BC 0C01F3E9 */  jal        func_8007CFA4
/* 7D4C0 8007C8C0 02202821 */   addu      $a1, $s1, $zero
/* 7D4C4 8007C8C4 02402021 */  addu       $a0, $s2, $zero
/* 7D4C8 8007C8C8 0C01F409 */  jal        func_8007D024
/* 7D4CC 8007C8CC 02202821 */   addu      $a1, $s1, $zero
/* 7D4D0 8007C8D0 0C01F485 */  jal        func_8007D214
/* 7D4D4 8007C8D4 02402021 */   addu      $a0, $s2, $zero
/* 7D4D8 8007C8D8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7D4DC 8007C8DC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D4E0 8007C8E0 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D4E4 8007C8E4 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D4E8 8007C8E8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D4EC 8007C8EC 03E00008 */  jr         $ra
/* 7D4F0 8007C8F0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007C8F4
/* 7D4F4 8007C8F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7D4F8 8007C8F8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D4FC 8007C8FC 00A08821 */  addu       $s1, $a1, $zero
/* 7D500 8007C900 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D504 8007C904 00009021 */  addu       $s2, $zero, $zero
/* 7D508 8007C908 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7D50C 8007C90C 00809821 */  addu       $s3, $a0, $zero
/* 7D510 8007C910 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D514 8007C914 26700004 */  addiu      $s0, $s3, 4
/* 7D518 8007C918 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7D51C 8007C91C 02202021 */  addu       $a0, $s1, $zero
.L8007C920:
/* 7D520 8007C920 8E050014 */  lw         $a1, 0x14($s0)
/* 7D524 8007C924 0C0009C0 */  jal        func_80002700
/* 7D528 8007C928 24060008 */   addiu     $a2, $zero, 8
/* 7D52C 8007C92C 8E020014 */  lw         $v0, 0x14($s0)
/* 7D530 8007C930 14400005 */  bnez       $v0, .L8007C948
/* 7D534 8007C934 02202021 */   addu      $a0, $s1, $zero
/* 7D538 8007C938 0C007260 */  jal        func_8001C980
/* 7D53C 8007C93C 00002821 */   addu      $a1, $zero, $zero
/* 7D540 8007C940 0801F255 */  j          .L8007C954
/* 7D544 8007C944 26100018 */   addiu     $s0, $s0, 0x18
.L8007C948:
/* 7D548 8007C948 0C007260 */  jal        func_8001C980
/* 7D54C 8007C94C 02002821 */   addu      $a1, $s0, $zero
/* 7D550 8007C950 26100018 */  addiu      $s0, $s0, 0x18
.L8007C954:
/* 7D554 8007C954 26520001 */  addiu      $s2, $s2, 1
/* 7D558 8007C958 2E420080 */  sltiu      $v0, $s2, 0x80
/* 7D55C 8007C95C 1440FFF0 */  bnez       $v0, .L8007C920
/* 7D560 8007C960 02202021 */   addu      $a0, $s1, $zero
/* 7D564 8007C964 02602021 */  addu       $a0, $s3, $zero
/* 7D568 8007C968 0C01F42A */  jal        func_8007D0A8
/* 7D56C 8007C96C 02202821 */   addu      $a1, $s1, $zero
/* 7D570 8007C970 02602021 */  addu       $a0, $s3, $zero
/* 7D574 8007C974 0C01F441 */  jal        NOOP_8007d104
/* 7D578 8007C978 02202821 */   addu      $a1, $s1, $zero
/* 7D57C 8007C97C 02602021 */  addu       $a0, $s3, $zero
/* 7D580 8007C980 0C01F443 */  jal        func_8007D10C
/* 7D584 8007C984 02202821 */   addu      $a1, $s1, $zero
/* 7D588 8007C988 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7D58C 8007C98C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D590 8007C990 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D594 8007C994 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D598 8007C998 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D59C 8007C99C 03E00008 */  jr         $ra
/* 7D5A0 8007C9A0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel add_items_to_iventory
/* 7D5A4 8007C9A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D5A8 8007C9A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 7D5AC 8007C9AC 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7D5B0 8007C9B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D5B4 8007C9B4 00808821 */  addu       $s1, $a0, $zero
/* 7D5B8 8007C9B8 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D5BC 8007C9BC 00C09021 */  addu       $s2, $a2, $zero
/* 7D5C0 8007C9C0 2402100B */  addiu      $v0, $zero, 0x100b
/* 7D5C4 8007C9C4 16020002 */  bne        $s0, $v0, .L8007C9D0
/* 7D5C8 8007C9C8 AFBF001C */   sw        $ra, 0x1c($sp)
/* 7D5CC 8007C9CC 24101004 */  addiu      $s0, $zero, 0x1004
.L8007C9D0:
/* 7D5D0 8007C9D0 8E230000 */  lw         $v1, ($s1)
/* 7D5D4 8007C9D4 02002821 */  addu       $a1, $s0, $zero
/* 7D5D8 8007C9D8 84640050 */  lh         $a0, 0x50($v1)
/* 7D5DC 8007C9DC 8C620054 */  lw         $v0, 0x54($v1)
/* 7D5E0 8007C9E0 0040F809 */  jalr       $v0
/* 7D5E4 8007C9E4 02242021 */   addu      $a0, $s1, $a0
/* 7D5E8 8007C9E8 00402821 */  addu       $a1, $v0, $zero
/* 7D5EC 8007C9EC 2402FFFF */  addiu      $v0, $zero, -1
/* 7D5F0 8007C9F0 10A20008 */  beq        $a1, $v0, .L8007CA14
/* 7D5F4 8007C9F4 02403021 */   addu      $a2, $s2, $zero
/* 7D5F8 8007C9F8 8E230000 */  lw         $v1, ($s1)
/* 7D5FC 8007C9FC 84640060 */  lh         $a0, 0x60($v1)
/* 7D600 8007CA00 8C620064 */  lw         $v0, 0x64($v1)
/* 7D604 8007CA04 0040F809 */  jalr       $v0
/* 7D608 8007CA08 02242021 */   addu      $a0, $s1, $a0
/* 7D60C 8007CA0C 0801F2A8 */  j          .L8007CAA0
/* 7D610 8007CA10 24020001 */   addiu     $v0, $zero, 1
.L8007CA14:
/* 7D614 8007CA14 02202021 */  addu       $a0, $s1, $zero
/* 7D618 8007CA18 02002821 */  addu       $a1, $s0, $zero
/* 7D61C 8007CA1C 0C01F330 */  jal        add_key_item_scroll
/* 7D620 8007CA20 02403021 */   addu      $a2, $s2, $zero
/* 7D624 8007CA24 1440001E */  bnez       $v0, .L8007CAA0
/* 7D628 8007CA28 24020001 */   addiu     $v0, $zero, 1
/* 7D62C 8007CA2C 02202021 */  addu       $a0, $s1, $zero
/* 7D630 8007CA30 02002821 */  addu       $a1, $s0, $zero
/* 7D634 8007CA34 0C01F34E */  jal        add_keyitem_to_inventory
/* 7D638 8007CA38 02403021 */   addu      $a2, $s2, $zero
/* 7D63C 8007CA3C 14400018 */  bnez       $v0, .L8007CAA0
/* 7D640 8007CA40 24020001 */   addiu     $v0, $zero, 1
/* 7D644 8007CA44 02202021 */  addu       $a0, $s1, $zero
/* 7D648 8007CA48 02002821 */  addu       $a1, $s0, $zero
/* 7D64C 8007CA4C 0C01F37D */  jal        func_8007CDF4
/* 7D650 8007CA50 02403021 */   addu      $a2, $s2, $zero
/* 7D654 8007CA54 10400008 */  beqz       $v0, .L8007CA78
/* 7D658 8007CA58 24020001 */   addiu     $v0, $zero, 1
/* 7D65C 8007CA5C 0801F2A9 */  j          .L8007CAA4
/* 7D660 8007CA60 8FBF001C */   lw        $ra, 0x1c($sp)
.L8007CA64:
/* 7D664 8007CA64 02003021 */  addu       $a2, $s0, $zero
/* 7D668 8007CA68 0C01F45F */  jal        add_item_to_inventory
/* 7D66C 8007CA6C 02403821 */   addu      $a3, $s2, $zero
/* 7D670 8007CA70 0801F2A8 */  j          .L8007CAA0
/* 7D674 8007CA74 24020001 */   addiu     $v0, $zero, 1
.L8007CA78:
/* 7D678 8007CA78 00002821 */  addu       $a1, $zero, $zero
/* 7D67C 8007CA7C 26230018 */  addiu      $v1, $s1, 0x18
.L8007CA80:
/* 7D680 8007CA80 8C620000 */  lw         $v0, ($v1)
/* 7D684 8007CA84 1040FFF7 */  beqz       $v0, .L8007CA64
/* 7D688 8007CA88 02202021 */   addu      $a0, $s1, $zero
/* 7D68C 8007CA8C 24A50001 */  addiu      $a1, $a1, 1
/* 7D690 8007CA90 2CA20080 */  sltiu      $v0, $a1, 0x80
/* 7D694 8007CA94 1440FFFA */  bnez       $v0, .L8007CA80
/* 7D698 8007CA98 24630018 */   addiu     $v1, $v1, 0x18
/* 7D69C 8007CA9C 00001021 */  addu       $v0, $zero, $zero
.L8007CAA0:
/* 7D6A0 8007CAA0 8FBF001C */  lw         $ra, 0x1c($sp)
.L8007CAA4:
/* 7D6A4 8007CAA4 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D6A8 8007CAA8 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D6AC 8007CAAC 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D6B0 8007CAB0 03E00008 */  jr         $ra
/* 7D6B4 8007CAB4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel inventory_bool
/* 7D6B8 8007CAB8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D6BC 8007CABC AFB00010 */  sw         $s0, 0x10($sp)
/* 7D6C0 8007CAC0 00808021 */  addu       $s0, $a0, $zero
/* 7D6C4 8007CAC4 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7D6C8 8007CAC8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7D6CC 8007CACC AFB10014 */  sw         $s1, 0x14($sp)
/* 7D6D0 8007CAD0 8E030000 */  lw         $v1, ($s0)
/* 7D6D4 8007CAD4 00C08821 */  addu       $s1, $a2, $zero
/* 7D6D8 8007CAD8 84640050 */  lh         $a0, 0x50($v1)
/* 7D6DC 8007CADC 8C620054 */  lw         $v0, 0x54($v1)
/* 7D6E0 8007CAE0 0040F809 */  jalr       $v0
/* 7D6E4 8007CAE4 02042021 */   addu      $a0, $s0, $a0
/* 7D6E8 8007CAE8 00402821 */  addu       $a1, $v0, $zero
/* 7D6EC 8007CAEC 2402FFFF */  addiu      $v0, $zero, -1
/* 7D6F0 8007CAF0 10A20008 */  beq        $a1, $v0, .L8007CB14
/* 7D6F4 8007CAF4 00113023 */   negu      $a2, $s1
/* 7D6F8 8007CAF8 8E030000 */  lw         $v1, ($s0)
/* 7D6FC 8007CAFC 84640060 */  lh         $a0, 0x60($v1)
/* 7D700 8007CB00 8C620064 */  lw         $v0, 0x64($v1)
/* 7D704 8007CB04 0040F809 */  jalr       $v0
/* 7D708 8007CB08 02042021 */   addu      $a0, $s0, $a0
/* 7D70C 8007CB0C 0801F2C6 */  j          .L8007CB18
/* 7D710 8007CB10 24020001 */   addiu     $v0, $zero, 1
.L8007CB14:
/* 7D714 8007CB14 00001021 */  addu       $v0, $zero, $zero
.L8007CB18:
/* 7D718 8007CB18 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7D71C 8007CB1C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D720 8007CB20 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D724 8007CB24 03E00008 */  jr         $ra
/* 7D728 8007CB28 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_quantity
/* 7D72C 8007CB2C 03E00008 */  jr         $ra
/* 7D730 8007CB30 8C8217A4 */   lw        $v0, 0x17a4($a0)

glabel get_quantity_max
/* 7D734 8007CB34 03E00008 */  jr         $ra
/* 7D738 8007CB38 240200FC */   addiu     $v0, $zero, 0xfc

glabel get_inv_item_index
/* 7D73C 8007CB3C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7D740 8007CB40 00001821 */  addu       $v1, $zero, $zero
/* 7D744 8007CB44 24840004 */  addiu      $a0, $a0, 4
.L8007CB48:
/* 7D748 8007CB48 8C820014 */  lw         $v0, 0x14($a0)
/* 7D74C 8007CB4C 50400006 */  beql       $v0, $zero, .L8007CB68
/* 7D750 8007CB50 24630001 */   addiu     $v1, $v1, 1
/* 7D754 8007CB54 94820000 */  lhu        $v0, ($a0)
/* 7D758 8007CB58 54450003 */  bnel       $v0, $a1, .L8007CB68
/* 7D75C 8007CB5C 24630001 */   addiu     $v1, $v1, 1
/* 7D760 8007CB60 03E00008 */  jr         $ra
/* 7D764 8007CB64 00601021 */   addu      $v0, $v1, $zero
.L8007CB68:
/* 7D768 8007CB68 2C6200FC */  sltiu      $v0, $v1, 0xfc
/* 7D76C 8007CB6C 1440FFF6 */  bnez       $v0, .L8007CB48
/* 7D770 8007CB70 24840018 */   addiu     $a0, $a0, 0x18
/* 7D774 8007CB74 03E00008 */  jr         $ra
/* 7D778 8007CB78 2402FFFF */   addiu     $v0, $zero, -1

glabel get_inv_slot
/* 7D77C 8007CB7C 2402FFFF */  addiu      $v0, $zero, -1
/* 7D780 8007CB80 10A2000A */  beq        $a1, $v0, .L8007CBAC
/* 7D784 8007CB84 00051040 */   sll       $v0, $a1, 1
/* 7D788 8007CB88 00451021 */  addu       $v0, $v0, $a1
/* 7D78C 8007CB8C 000210C0 */  sll        $v0, $v0, 3
/* 7D790 8007CB90 24420004 */  addiu      $v0, $v0, 4
/* 7D794 8007CB94 00822021 */  addu       $a0, $a0, $v0
/* 7D798 8007CB98 8C830014 */  lw         $v1, 0x14($a0)
/* 7D79C 8007CB9C 18600004 */  blez       $v1, .L8007CBB0
/* 7D7A0 8007CBA0 00001021 */   addu      $v0, $zero, $zero
/* 7D7A4 8007CBA4 03E00008 */  jr         $ra
/* 7D7A8 8007CBA8 00801021 */   addu      $v0, $a0, $zero
.L8007CBAC:
/* 7D7AC 8007CBAC 00001021 */  addu       $v0, $zero, $zero
.L8007CBB0:
/* 7D7B0 8007CBB0 03E00008 */  jr         $ra
/* 7D7B4 8007CBB4 00000000 */   nop

glabel inc_inventory_item
/* 7D7B8 8007CBB8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7D7BC 8007CBBC AFB3001C */  sw         $s3, 0x1c($sp)
/* 7D7C0 8007CBC0 00809821 */  addu       $s3, $a0, $zero
/* 7D7C4 8007CBC4 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D7C8 8007CBC8 00A09021 */  addu       $s2, $a1, $zero
/* 7D7CC 8007CBCC 2402FFFF */  addiu      $v0, $zero, -1
/* 7D7D0 8007CBD0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7D7D4 8007CBD4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D7D8 8007CBD8 12420009 */  beq        $s2, $v0, .L8007CC00
/* 7D7DC 8007CBDC AFB00010 */   sw        $s0, 0x10($sp)
/* 7D7E0 8007CBE0 00121040 */  sll        $v0, $s2, 1
/* 7D7E4 8007CBE4 00521021 */  addu       $v0, $v0, $s2
/* 7D7E8 8007CBE8 000210C0 */  sll        $v0, $v0, 3
/* 7D7EC 8007CBEC 24420004 */  addiu      $v0, $v0, 4
/* 7D7F0 8007CBF0 02628821 */  addu       $s1, $s3, $v0
/* 7D7F4 8007CBF4 8E220014 */  lw         $v0, 0x14($s1)
/* 7D7F8 8007CBF8 1C400003 */  bgtz       $v0, .L8007CC08
/* 7D7FC 8007CBFC 00463021 */   addu      $a2, $v0, $a2
.L8007CC00:
/* 7D800 8007CC00 0801F31F */  j          .L8007CC7C
/* 7D804 8007CC04 00001021 */   addu      $v0, $zero, $zero
.L8007CC08:
/* 7D808 8007CC08 28C20063 */  slti       $v0, $a2, 0x63
/* 7D80C 8007CC0C 14400004 */  bnez       $v0, .L8007CC20
/* 7D810 8007CC10 AE260014 */   sw        $a2, 0x14($s1)
/* 7D814 8007CC14 24020063 */  addiu      $v0, $zero, 0x63
/* 7D818 8007CC18 0801F31F */  j          .L8007CC7C
/* 7D81C 8007CC1C AE220014 */   sw        $v0, 0x14($s1)
.L8007CC20:
/* 7D820 8007CC20 5CC00016 */  bgtzl      $a2, .L8007CC7C
/* 7D824 8007CC24 8E220014 */   lw        $v0, 0x14($s1)
/* 7D828 8007CC28 02602021 */  addu       $a0, $s3, $zero
/* 7D82C 8007CC2C 96300000 */  lhu        $s0, ($s1)
/* 7D830 8007CC30 02403021 */  addu       $a2, $s2, $zero
/* 7D834 8007CC34 0C01F39B */  jal        search_from_80_items
/* 7D838 8007CC38 02002821 */   addu      $a1, $s0, $zero
/* 7D83C 8007CC3C 02602021 */  addu       $a0, $s3, $zero
/* 7D840 8007CC40 02002821 */  addu       $a1, $s0, $zero
/* 7D844 8007CC44 0C01F3A7 */  jal        key_item_flags
/* 7D848 8007CC48 02403021 */   addu      $a2, $s2, $zero
/* 7D84C 8007CC4C 02602021 */  addu       $a0, $s3, $zero
/* 7D850 8007CC50 02002821 */  addu       $a1, $s0, $zero
/* 7D854 8007CC54 0C01F3BE */  jal        Item_is_in_some_array
/* 7D858 8007CC58 02403021 */   addu      $a2, $s2, $zero
/* 7D85C 8007CC5C 12000003 */  beqz       $s0, .L8007CC6C
/* 7D860 8007CC60 AE200014 */   sw        $zero, 0x14($s1)
/* 7D864 8007CC64 0C01EF3A */  jal        clear_temp_Stat_spell
/* 7D868 8007CC68 02202021 */   addu      $a0, $s1, $zero
.L8007CC6C:
/* 7D86C 8007CC6C 8E6217A4 */  lw         $v0, 0x17a4($s3)
/* 7D870 8007CC70 2442FFFF */  addiu      $v0, $v0, -1
/* 7D874 8007CC74 AE6217A4 */  sw         $v0, 0x17a4($s3)
/* 7D878 8007CC78 8E220014 */  lw         $v0, 0x14($s1)
.L8007CC7C:
/* 7D87C 8007CC7C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7D880 8007CC80 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D884 8007CC84 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D888 8007CC88 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D88C 8007CC8C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D890 8007CC90 03E00008 */  jr         $ra
/* 7D894 8007CC94 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_item_quantity
/* 7D898 8007CC98 2402FFFF */  addiu      $v0, $zero, -1
/* 7D89C 8007CC9C 10A20006 */  beq        $a1, $v0, .L8007CCB8
/* 7D8A0 8007CCA0 00051840 */   sll       $v1, $a1, 1
/* 7D8A4 8007CCA4 00651821 */  addu       $v1, $v1, $a1
/* 7D8A8 8007CCA8 000318C0 */  sll        $v1, $v1, 3
/* 7D8AC 8007CCAC 00831821 */  addu       $v1, $a0, $v1
/* 7D8B0 8007CCB0 03E00008 */  jr         $ra
/* 7D8B4 8007CCB4 8C620018 */   lw        $v0, 0x18($v1)
.L8007CCB8:
/* 7D8B8 8007CCB8 03E00008 */  jr         $ra
/* 7D8BC 8007CCBC 00001021 */   addu      $v0, $zero, $zero

glabel add_key_item_scroll
/* 7D8C0 8007CCC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D8C4 8007CCC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D8C8 8007CCC8 00808821 */  addu       $s1, $a0, $zero
/* 7D8CC 8007CCCC AFB00010 */  sw         $s0, 0x10($sp)
/* 7D8D0 8007CCD0 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7D8D4 8007CCD4 3C05800F */  lui        $a1, %hi(D_800F1890)
/* 7D8D8 8007CCD8 24A51890 */  addiu      $a1, $a1, %lo(D_800F1890)
/* 7D8DC 8007CCDC AFB20018 */  sw         $s2, 0x18($sp)
/* 7D8E0 8007CCE0 00C09021 */  addu       $s2, $a2, $zero
/* 7D8E4 8007CCE4 24060050 */  addiu      $a2, $zero, 0x50
/* 7D8E8 8007CCE8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7D8EC 8007CCEC 0C01F478 */  jal        search_for_item_in_array
/* 7D8F0 8007CCF0 02003821 */   addu      $a3, $s0, $zero
/* 7D8F4 8007CCF4 00402821 */  addu       $a1, $v0, $zero
/* 7D8F8 8007CCF8 2402FFFF */  addiu      $v0, $zero, -1
/* 7D8FC 8007CCFC 10A20007 */  beq        $a1, $v0, .L8007CD1C
/* 7D900 8007CD00 02202021 */   addu      $a0, $s1, $zero
/* 7D904 8007CD04 24A50080 */  addiu      $a1, $a1, 0x80
/* 7D908 8007CD08 02003021 */  addu       $a2, $s0, $zero
/* 7D90C 8007CD0C 0C01F45F */  jal        add_item_to_inventory
/* 7D910 8007CD10 02403821 */   addu      $a3, $s2, $zero
/* 7D914 8007CD14 0801F348 */  j          .L8007CD20
/* 7D918 8007CD18 24020001 */   addiu     $v0, $zero, 1
.L8007CD1C:
/* 7D91C 8007CD1C 00001021 */  addu       $v0, $zero, $zero
.L8007CD20:
/* 7D920 8007CD20 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7D924 8007CD24 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D928 8007CD28 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D92C 8007CD2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D930 8007CD30 03E00008 */  jr         $ra
/* 7D934 8007CD34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel add_keyitem_to_inventory
/* 7D938 8007CD38 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7D93C 8007CD3C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7D940 8007CD40 00809821 */  addu       $s3, $a0, $zero
/* 7D944 8007CD44 AFB20018 */  sw         $s2, 0x18($sp)
/* 7D948 8007CD48 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 7D94C 8007CD4C 3C05800F */  lui        $a1, %hi(key_item_array_1)
/* 7D950 8007CD50 24A51970 */  addiu      $a1, $a1, %lo(key_item_array_1)
/* 7D954 8007CD54 AFB40020 */  sw         $s4, 0x20($sp)
/* 7D958 8007CD58 00C0A021 */  addu       $s4, $a2, $zero
/* 7D95C 8007CD5C 2406001F */  addiu      $a2, $zero, 0x1f
/* 7D960 8007CD60 02403821 */  addu       $a3, $s2, $zero
/* 7D964 8007CD64 AFBF0024 */  sw         $ra, 0x24($sp)
/* 7D968 8007CD68 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D96C 8007CD6C 0C01F478 */  jal        search_for_item_in_array
/* 7D970 8007CD70 AFB00010 */   sw        $s0, 0x10($sp)
/* 7D974 8007CD74 00408821 */  addu       $s1, $v0, $zero
/* 7D978 8007CD78 2402FFFF */  addiu      $v0, $zero, -1
/* 7D97C 8007CD7C 12220014 */  beq        $s1, $v0, .L8007CDD0
/* 7D980 8007CD80 3C02800F */   lui       $v0, %hi(key_item_flags_2)
/* 7D984 8007CD84 244219B0 */  addiu      $v0, $v0, %lo(key_item_flags_2)
/* 7D988 8007CD88 00118040 */  sll        $s0, $s1, 1
/* 7D98C 8007CD8C 02021021 */  addu       $v0, $s0, $v0
/* 7D990 8007CD90 94440000 */  lhu        $a0, ($v0)
/* 7D994 8007CD94 0C00918D */  jal        setEventFlag
/* 7D998 8007CD98 24050001 */   addiu     $a1, $zero, 1
/* 7D99C 8007CD9C 02602021 */  addu       $a0, $s3, $zero
/* 7D9A0 8007CDA0 262500D0 */  addiu      $a1, $s1, 0xd0
/* 7D9A4 8007CDA4 02403021 */  addu       $a2, $s2, $zero
/* 7D9A8 8007CDA8 0C01F45F */  jal        add_item_to_inventory
/* 7D9AC 8007CDAC 02803821 */   addu      $a3, $s4, $zero
/* 7D9B0 8007CDB0 3C02800F */  lui        $v0, %hi(key_item_flags_800f1930)
/* 7D9B4 8007CDB4 24421930 */  addiu      $v0, $v0, %lo(key_item_flags_800f1930)
/* 7D9B8 8007CDB8 02028021 */  addu       $s0, $s0, $v0
/* 7D9BC 8007CDBC 96040000 */  lhu        $a0, ($s0)
/* 7D9C0 8007CDC0 0C00918D */  jal        setEventFlag
/* 7D9C4 8007CDC4 24050001 */   addiu     $a1, $zero, 1
/* 7D9C8 8007CDC8 0801F375 */  j          .L8007CDD4
/* 7D9CC 8007CDCC 24020001 */   addiu     $v0, $zero, 1
.L8007CDD0:
/* 7D9D0 8007CDD0 00001021 */  addu       $v0, $zero, $zero
.L8007CDD4:
/* 7D9D4 8007CDD4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7D9D8 8007CDD8 8FB40020 */  lw         $s4, 0x20($sp)
/* 7D9DC 8007CDDC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D9E0 8007CDE0 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D9E4 8007CDE4 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D9E8 8007CDE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D9EC 8007CDEC 03E00008 */  jr         $ra
/* 7D9F0 8007CDF0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007CDF4
/* 7D9F4 8007CDF4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D9F8 8007CDF8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7D9FC 8007CDFC 00808821 */  addu       $s1, $a0, $zero
/* 7DA00 8007CE00 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DA04 8007CE04 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7DA08 8007CE08 3C05800F */  lui        $a1, %hi(D_800F19F0)
/* 7DA0C 8007CE0C 24A519F0 */  addiu      $a1, $a1, %lo(D_800F19F0)
/* 7DA10 8007CE10 AFB20018 */  sw         $s2, 0x18($sp)
/* 7DA14 8007CE14 00C09021 */  addu       $s2, $a2, $zero
/* 7DA18 8007CE18 2406000D */  addiu      $a2, $zero, 0xd
/* 7DA1C 8007CE1C AFBF001C */  sw         $ra, 0x1c($sp)
/* 7DA20 8007CE20 0C01F478 */  jal        search_for_item_in_array
/* 7DA24 8007CE24 02003821 */   addu      $a3, $s0, $zero
/* 7DA28 8007CE28 00402821 */  addu       $a1, $v0, $zero
/* 7DA2C 8007CE2C 2402FFFF */  addiu      $v0, $zero, -1
/* 7DA30 8007CE30 10A20007 */  beq        $a1, $v0, .L8007CE50
/* 7DA34 8007CE34 02202021 */   addu      $a0, $s1, $zero
/* 7DA38 8007CE38 24A500EF */  addiu      $a1, $a1, 0xef
/* 7DA3C 8007CE3C 02003021 */  addu       $a2, $s0, $zero
/* 7DA40 8007CE40 0C01F45F */  jal        add_item_to_inventory
/* 7DA44 8007CE44 02403821 */   addu      $a3, $s2, $zero
/* 7DA48 8007CE48 0801F395 */  j          .L8007CE54
/* 7DA4C 8007CE4C 24020001 */   addiu     $v0, $zero, 1
.L8007CE50:
/* 7DA50 8007CE50 00001021 */  addu       $v0, $zero, $zero
.L8007CE54:
/* 7DA54 8007CE54 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7DA58 8007CE58 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DA5C 8007CE5C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DA60 8007CE60 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DA64 8007CE64 03E00008 */  jr         $ra
/* 7DA68 8007CE68 27BD0020 */   addiu     $sp, $sp, 0x20

glabel search_from_80_items
/* 7DA6C 8007CE6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7DA70 8007CE70 30A7FFFF */  andi       $a3, $a1, 0xffff
/* 7DA74 8007CE74 3C05800F */  lui        $a1, %hi(D_800F1890)
/* 7DA78 8007CE78 24A51890 */  addiu      $a1, $a1, %lo(D_800F1890)
/* 7DA7C 8007CE7C AFBF0010 */  sw         $ra, 0x10($sp)
/* 7DA80 8007CE80 0C01F478 */  jal        search_for_item_in_array
/* 7DA84 8007CE84 24060050 */   addiu     $a2, $zero, 0x50
/* 7DA88 8007CE88 00021027 */  nor        $v0, $zero, $v0
/* 7DA8C 8007CE8C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7DA90 8007CE90 0002102B */  sltu       $v0, $zero, $v0
/* 7DA94 8007CE94 03E00008 */  jr         $ra
/* 7DA98 8007CE98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel key_item_flags
/* 7DA9C 8007CE9C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7DAA0 8007CEA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7DAA4 8007CEA4 30A7FFFF */  andi       $a3, $a1, 0xffff
/* 7DAA8 8007CEA8 3C05800F */  lui        $a1, %hi(key_item_array_1)
/* 7DAAC 8007CEAC 24A51970 */  addiu      $a1, $a1, %lo(key_item_array_1)
/* 7DAB0 8007CEB0 0C01F478 */  jal        search_for_item_in_array
/* 7DAB4 8007CEB4 2406001F */   addiu     $a2, $zero, 0x1f
/* 7DAB8 8007CEB8 00402021 */  addu       $a0, $v0, $zero
/* 7DABC 8007CEBC 2402FFFF */  addiu      $v0, $zero, -1
/* 7DAC0 8007CEC0 10820009 */  beq        $a0, $v0, .L8007CEE8
/* 7DAC4 8007CEC4 3C03800F */   lui       $v1, %hi(key_item_flags_800f1930)
/* 7DAC8 8007CEC8 24631930 */  addiu      $v1, $v1, %lo(key_item_flags_800f1930)
/* 7DACC 8007CECC 00041040 */  sll        $v0, $a0, 1
/* 7DAD0 8007CED0 00431021 */  addu       $v0, $v0, $v1
/* 7DAD4 8007CED4 94440000 */  lhu        $a0, ($v0)
/* 7DAD8 8007CED8 0C00918D */  jal        setEventFlag
/* 7DADC 8007CEDC 00002821 */   addu      $a1, $zero, $zero
/* 7DAE0 8007CEE0 0801F3BB */  j          .L8007CEEC
/* 7DAE4 8007CEE4 24020001 */   addiu     $v0, $zero, 1
.L8007CEE8:
/* 7DAE8 8007CEE8 00001021 */  addu       $v0, $zero, $zero
.L8007CEEC:
/* 7DAEC 8007CEEC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7DAF0 8007CEF0 03E00008 */  jr         $ra
/* 7DAF4 8007CEF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Item_is_in_some_array
/* 7DAF8 8007CEF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7DAFC 8007CEFC 30A7FFFF */  andi       $a3, $a1, 0xffff
/* 7DB00 8007CF00 3C05800F */  lui        $a1, %hi(D_800F19F0)
/* 7DB04 8007CF04 24A519F0 */  addiu      $a1, $a1, %lo(D_800F19F0)
/* 7DB08 8007CF08 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7DB0C 8007CF0C 0C01F478 */  jal        search_for_item_in_array
/* 7DB10 8007CF10 2406000D */   addiu     $a2, $zero, 0xd
/* 7DB14 8007CF14 00021027 */  nor        $v0, $zero, $v0
/* 7DB18 8007CF18 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7DB1C 8007CF1C 0002102B */  sltu       $v0, $zero, $v0
/* 7DB20 8007CF20 03E00008 */  jr         $ra
/* 7DB24 8007CF24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007CF28
/* 7DB28 8007CF28 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7DB2C 8007CF2C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7DB30 8007CF30 00809821 */  addu       $s3, $a0, $zero
/* 7DB34 8007CF34 AFB20018 */  sw         $s2, 0x18($sp)
/* 7DB38 8007CF38 00A09021 */  addu       $s2, $a1, $zero
/* 7DB3C 8007CF3C AFB00010 */  sw         $s0, 0x10($sp)
/* 7DB40 8007CF40 00008021 */  addu       $s0, $zero, $zero
/* 7DB44 8007CF44 3C02800F */  lui        $v0, %hi(D_800F1890)
/* 7DB48 8007CF48 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DB4C 8007CF4C 24511890 */  addiu      $s1, $v0, %lo(D_800F1890)
/* 7DB50 8007CF50 AFBF0020 */  sw         $ra, 0x20($sp)
.L8007CF54:
/* 7DB54 8007CF54 02402021 */  addu       $a0, $s2, $zero
/* 7DB58 8007CF58 0C0009DF */  jal        two_bitshifting_funcs
/* 7DB5C 8007CF5C 24050008 */   addiu     $a1, $zero, 8
/* 7DB60 8007CF60 10400005 */  beqz       $v0, .L8007CF78
/* 7DB64 8007CF64 02602021 */   addu      $a0, $s3, $zero
/* 7DB68 8007CF68 26050080 */  addiu      $a1, $s0, 0x80
/* 7DB6C 8007CF6C 96260000 */  lhu        $a2, ($s1)
/* 7DB70 8007CF70 0C01F45F */  jal        add_item_to_inventory
/* 7DB74 8007CF74 00403821 */   addu      $a3, $v0, $zero
.L8007CF78:
/* 7DB78 8007CF78 26100001 */  addiu      $s0, $s0, 1
/* 7DB7C 8007CF7C 2E020050 */  sltiu      $v0, $s0, 0x50
/* 7DB80 8007CF80 1440FFF4 */  bnez       $v0, .L8007CF54
/* 7DB84 8007CF84 26310002 */   addiu     $s1, $s1, 2
/* 7DB88 8007CF88 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7DB8C 8007CF8C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7DB90 8007CF90 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DB94 8007CF94 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DB98 8007CF98 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DB9C 8007CF9C 03E00008 */  jr         $ra
/* 7DBA0 8007CFA0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007CFA4
/* 7DBA4 8007CFA4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7DBA8 8007CFA8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7DBAC 8007CFAC 00809821 */  addu       $s3, $a0, $zero
/* 7DBB0 8007CFB0 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DBB4 8007CFB4 00008021 */  addu       $s0, $zero, $zero
/* 7DBB8 8007CFB8 3C02800F */  lui        $v0, %hi(key_item_array_1)
/* 7DBBC 8007CFBC AFB20018 */  sw         $s2, 0x18($sp)
/* 7DBC0 8007CFC0 24521970 */  addiu      $s2, $v0, %lo(key_item_array_1)
/* 7DBC4 8007CFC4 3C03800F */  lui        $v1, %hi(key_item_flags_800f1930)
/* 7DBC8 8007CFC8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DBCC 8007CFCC 24711930 */  addiu      $s1, $v1, %lo(key_item_flags_800f1930)
/* 7DBD0 8007CFD0 AFBF0020 */  sw         $ra, 0x20($sp)
.L8007CFD4:
/* 7DBD4 8007CFD4 0C009168 */  jal        get_event_flag
/* 7DBD8 8007CFD8 96240000 */   lhu       $a0, ($s1)
/* 7DBDC 8007CFDC 10400005 */  beqz       $v0, .L8007CFF4
/* 7DBE0 8007CFE0 02602021 */   addu      $a0, $s3, $zero
/* 7DBE4 8007CFE4 260500D0 */  addiu      $a1, $s0, 0xd0
/* 7DBE8 8007CFE8 96460000 */  lhu        $a2, ($s2)
/* 7DBEC 8007CFEC 0C01F45F */  jal        add_item_to_inventory
/* 7DBF0 8007CFF0 24070001 */   addiu     $a3, $zero, 1
.L8007CFF4:
/* 7DBF4 8007CFF4 26520002 */  addiu      $s2, $s2, 2
/* 7DBF8 8007CFF8 26100001 */  addiu      $s0, $s0, 1
/* 7DBFC 8007CFFC 2E02001F */  sltiu      $v0, $s0, 0x1f
/* 7DC00 8007D000 1440FFF4 */  bnez       $v0, .L8007CFD4
/* 7DC04 8007D004 26310002 */   addiu     $s1, $s1, 2
/* 7DC08 8007D008 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7DC0C 8007D00C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7DC10 8007D010 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DC14 8007D014 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DC18 8007D018 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DC1C 8007D01C 03E00008 */  jr         $ra
/* 7DC20 8007D020 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007D024
/* 7DC24 8007D024 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7DC28 8007D028 AFB40020 */  sw         $s4, 0x20($sp)
/* 7DC2C 8007D02C 00A0A021 */  addu       $s4, $a1, $zero
/* 7DC30 8007D030 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DC34 8007D034 00008821 */  addu       $s1, $zero, $zero
/* 7DC38 8007D038 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7DC3C 8007D03C 24130001 */  addiu      $s3, $zero, 1
/* 7DC40 8007D040 AFB20018 */  sw         $s2, 0x18($sp)
/* 7DC44 8007D044 00809021 */  addu       $s2, $a0, $zero
/* 7DC48 8007D048 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DC4C 8007D04C 2650166C */  addiu      $s0, $s2, 0x166c
/* 7DC50 8007D050 AFBF0024 */  sw         $ra, 0x24($sp)
.L8007D054:
/* 7DC54 8007D054 02802021 */  addu       $a0, $s4, $zero
/* 7DC58 8007D058 0C007280 */  jal        func_8001CA00
/* 7DC5C 8007D05C 02002821 */   addu      $a1, $s0, $zero
/* 7DC60 8007D060 96020000 */  lhu        $v0, ($s0)
/* 7DC64 8007D064 10400005 */  beqz       $v0, .L8007D07C
/* 7DC68 8007D068 26310001 */   addiu     $s1, $s1, 1
/* 7DC6C 8007D06C AE130014 */  sw         $s3, 0x14($s0)
/* 7DC70 8007D070 8E4217A4 */  lw         $v0, 0x17a4($s2)
/* 7DC74 8007D074 24420001 */  addiu      $v0, $v0, 1
/* 7DC78 8007D078 AE4217A4 */  sw         $v0, 0x17a4($s2)
.L8007D07C:
/* 7DC7C 8007D07C 2E22000D */  sltiu      $v0, $s1, 0xd
/* 7DC80 8007D080 1440FFF4 */  bnez       $v0, .L8007D054
/* 7DC84 8007D084 26100018 */   addiu     $s0, $s0, 0x18
/* 7DC88 8007D088 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7DC8C 8007D08C 8FB40020 */  lw         $s4, 0x20($sp)
/* 7DC90 8007D090 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7DC94 8007D094 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DC98 8007D098 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DC9C 8007D09C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DCA0 8007D0A0 03E00008 */  jr         $ra
/* 7DCA4 8007D0A4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007D0A8
/* 7DCA8 8007D0A8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7DCAC 8007D0AC AFB20018 */  sw         $s2, 0x18($sp)
/* 7DCB0 8007D0B0 00A09021 */  addu       $s2, $a1, $zero
/* 7DCB4 8007D0B4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DCB8 8007D0B8 00008821 */  addu       $s1, $zero, $zero
/* 7DCBC 8007D0BC AFB00010 */  sw         $s0, 0x10($sp)
/* 7DCC0 8007D0C0 24900C18 */  addiu      $s0, $a0, 0xc18
/* 7DCC4 8007D0C4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7DCC8 8007D0C8 8E050000 */  lw         $a1, ($s0)
.L8007D0CC:
/* 7DCCC 8007D0CC 26100018 */  addiu      $s0, $s0, 0x18
/* 7DCD0 8007D0D0 26310001 */  addiu      $s1, $s1, 1
/* 7DCD4 8007D0D4 02402021 */  addu       $a0, $s2, $zero
/* 7DCD8 8007D0D8 0C0009C0 */  jal        func_80002700
/* 7DCDC 8007D0DC 24060008 */   addiu     $a2, $zero, 8
/* 7DCE0 8007D0E0 2E220050 */  sltiu      $v0, $s1, 0x50
/* 7DCE4 8007D0E4 5440FFF9 */  bnel       $v0, $zero, .L8007D0CC
/* 7DCE8 8007D0E8 8E050000 */   lw        $a1, ($s0)
/* 7DCEC 8007D0EC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7DCF0 8007D0F0 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DCF4 8007D0F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DCF8 8007D0F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DCFC 8007D0FC 03E00008 */  jr         $ra
/* 7DD00 8007D100 27BD0020 */   addiu     $sp, $sp, 0x20

glabel NOOP_8007d104
/* 7DD04 8007D104 03E00008 */  jr         $ra
/* 7DD08 8007D108 00000000 */   nop

glabel func_8007D10C
/* 7DD0C 8007D10C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7DD10 8007D110 AFB20018 */  sw         $s2, 0x18($sp)
/* 7DD14 8007D114 00A09021 */  addu       $s2, $a1, $zero
/* 7DD18 8007D118 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DD1C 8007D11C 00008821 */  addu       $s1, $zero, $zero
/* 7DD20 8007D120 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DD24 8007D124 2490166C */  addiu      $s0, $a0, 0x166c
/* 7DD28 8007D128 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7DD2C 8007D12C 8E020014 */  lw         $v0, 0x14($s0)
.L8007D130:
/* 7DD30 8007D130 10400005 */  beqz       $v0, .L8007D148
/* 7DD34 8007D134 02402021 */   addu      $a0, $s2, $zero
/* 7DD38 8007D138 0C007260 */  jal        func_8001C980
/* 7DD3C 8007D13C 02002821 */   addu      $a1, $s0, $zero
/* 7DD40 8007D140 0801F455 */  j          .L8007D154
/* 7DD44 8007D144 26100018 */   addiu     $s0, $s0, 0x18
.L8007D148:
/* 7DD48 8007D148 0C007260 */  jal        func_8001C980
/* 7DD4C 8007D14C 00002821 */   addu      $a1, $zero, $zero
/* 7DD50 8007D150 26100018 */  addiu      $s0, $s0, 0x18
.L8007D154:
/* 7DD54 8007D154 26310001 */  addiu      $s1, $s1, 1
/* 7DD58 8007D158 2E22000D */  sltiu      $v0, $s1, 0xd
/* 7DD5C 8007D15C 5440FFF4 */  bnel       $v0, $zero, .L8007D130
/* 7DD60 8007D160 8E020014 */   lw        $v0, 0x14($s0)
/* 7DD64 8007D164 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7DD68 8007D168 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DD6C 8007D16C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DD70 8007D170 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DD74 8007D174 03E00008 */  jr         $ra
/* 7DD78 8007D178 27BD0020 */   addiu     $sp, $sp, 0x20

glabel add_item_to_inventory
/* 7DD7C 8007D17C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7DD80 8007D180 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DD84 8007D184 00808821 */  addu       $s1, $a0, $zero
/* 7DD88 8007D188 AFB20018 */  sw         $s2, 0x18($sp)
/* 7DD8C 8007D18C 00E09021 */  addu       $s2, $a3, $zero
/* 7DD90 8007D190 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DD94 8007D194 00058040 */  sll        $s0, $a1, 1
/* 7DD98 8007D198 02058021 */  addu       $s0, $s0, $a1
/* 7DD9C 8007D19C 001080C0 */  sll        $s0, $s0, 3
/* 7DDA0 8007D1A0 26100004 */  addiu      $s0, $s0, 4
/* 7DDA4 8007D1A4 02308021 */  addu       $s0, $s1, $s0
/* 7DDA8 8007D1A8 02002021 */  addu       $a0, $s0, $zero
/* 7DDAC 8007D1AC AFBF001C */  sw         $ra, 0x1c($sp)
/* 7DDB0 8007D1B0 0C01EF1C */  jal        temp_item_check
/* 7DDB4 8007D1B4 30C5FFFF */   andi      $a1, $a2, 0xffff
/* 7DDB8 8007D1B8 AE120014 */  sw         $s2, 0x14($s0)
/* 7DDBC 8007D1BC 8E2217A4 */  lw         $v0, 0x17a4($s1)
/* 7DDC0 8007D1C0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7DDC4 8007D1C4 8FB20018 */  lw         $s2, 0x18($sp)
/* 7DDC8 8007D1C8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DDCC 8007D1CC 24420001 */  addiu      $v0, $v0, 1
/* 7DDD0 8007D1D0 AE2217A4 */  sw         $v0, 0x17a4($s1)
/* 7DDD4 8007D1D4 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DDD8 8007D1D8 03E00008 */  jr         $ra
/* 7DDDC 8007D1DC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel search_for_item_in_array
/* 7DDE0 8007D1E0 00001821 */  addu       $v1, $zero, $zero
/* 7DDE4 8007D1E4 10C00009 */  beqz       $a2, .L8007D20C
/* 7DDE8 8007D1E8 30E7FFFF */   andi      $a3, $a3, 0xffff
.L8007D1EC:
/* 7DDEC 8007D1EC 94A20000 */  lhu        $v0, ($a1)
/* 7DDF0 8007D1F0 54470003 */  bnel       $v0, $a3, .L8007D200
/* 7DDF4 8007D1F4 24630001 */   addiu     $v1, $v1, 1
/* 7DDF8 8007D1F8 03E00008 */  jr         $ra
/* 7DDFC 8007D1FC 00601021 */   addu      $v0, $v1, $zero
.L8007D200:
/* 7DE00 8007D200 0066102B */  sltu       $v0, $v1, $a2
/* 7DE04 8007D204 1440FFF9 */  bnez       $v0, .L8007D1EC
/* 7DE08 8007D208 24A50002 */   addiu     $a1, $a1, 2
.L8007D20C:
/* 7DE0C 8007D20C 03E00008 */  jr         $ra
/* 7DE10 8007D210 2402FFFF */   addiu     $v0, $zero, -1

glabel func_8007D214
/* 7DE14 8007D214 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7DE18 8007D218 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DE1C 8007D21C 00808821 */  addu       $s1, $a0, $zero
/* 7DE20 8007D220 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7DE24 8007D224 AFB00010 */  sw         $s0, 0x10($sp)
/* 7DE28 8007D228 8E230000 */  lw         $v1, ($s1)
/* 7DE2C 8007D22C 2405100B */  addiu      $a1, $zero, 0x100b
/* 7DE30 8007D230 84640050 */  lh         $a0, 0x50($v1)
/* 7DE34 8007D234 8C620054 */  lw         $v0, 0x54($v1)
/* 7DE38 8007D238 0040F809 */  jalr       $v0
/* 7DE3C 8007D23C 02242021 */   addu      $a0, $s1, $a0
/* 7DE40 8007D240 00401821 */  addu       $v1, $v0, $zero
/* 7DE44 8007D244 2402FFFF */  addiu      $v0, $zero, -1
/* 7DE48 8007D248 10620013 */  beq        $v1, $v0, .L8007D298
/* 7DE4C 8007D24C 24051004 */   addiu     $a1, $zero, 0x1004
/* 7DE50 8007D250 00038040 */  sll        $s0, $v1, 1
/* 7DE54 8007D254 02038021 */  addu       $s0, $s0, $v1
/* 7DE58 8007D258 001080C0 */  sll        $s0, $s0, 3
/* 7DE5C 8007D25C 26100004 */  addiu      $s0, $s0, 4
/* 7DE60 8007D260 02308021 */  addu       $s0, $s1, $s0
/* 7DE64 8007D264 8E230000 */  lw         $v1, ($s1)
/* 7DE68 8007D268 8E060014 */  lw         $a2, 0x14($s0)
/* 7DE6C 8007D26C 84640030 */  lh         $a0, 0x30($v1)
/* 7DE70 8007D270 8C620034 */  lw         $v0, 0x34($v1)
/* 7DE74 8007D274 0040F809 */  jalr       $v0
/* 7DE78 8007D278 02242021 */   addu      $a0, $s1, $a0
/* 7DE7C 8007D27C 96050000 */  lhu        $a1, ($s0)
/* 7DE80 8007D280 8E230000 */  lw         $v1, ($s1)
/* 7DE84 8007D284 8E060014 */  lw         $a2, 0x14($s0)
/* 7DE88 8007D288 84640038 */  lh         $a0, 0x38($v1)
/* 7DE8C 8007D28C 8C62003C */  lw         $v0, 0x3c($v1)
/* 7DE90 8007D290 0040F809 */  jalr       $v0
/* 7DE94 8007D294 02242021 */   addu      $a0, $s1, $a0
.L8007D298:
/* 7DE98 8007D298 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7DE9C 8007D29C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DEA0 8007D2A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DEA4 8007D2A4 03E00008 */  jr         $ra
/* 7DEA8 8007D2A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007D2AC
/* 7DEAC 8007D2AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7DEB0 8007D2B0 3C02800E */  lui        $v0, %hi(D_800E0A88)
/* 7DEB4 8007D2B4 24420A88 */  addiu      $v0, $v0, %lo(D_800E0A88)
/* 7DEB8 8007D2B8 30A50001 */  andi       $a1, $a1, 1
/* 7DEBC 8007D2BC AFBF0010 */  sw         $ra, 0x10($sp)
/* 7DEC0 8007D2C0 10A00003 */  beqz       $a1, .L8007D2D0
/* 7DEC4 8007D2C4 AC820000 */   sw        $v0, ($a0)
/* 7DEC8 8007D2C8 0C026262 */  jal        passToFree
/* 7DECC 8007D2CC 00000000 */   nop
.L8007D2D0:
/* 7DED0 8007D2D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7DED4 8007D2D4 03E00008 */  jr         $ra
/* 7DED8 8007D2D8 27BD0018 */   addiu     $sp, $sp, 0x18
/* 7DEDC 8007D2DC 00000000 */  nop
