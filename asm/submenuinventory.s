.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8003C590
/* 3D190 8003C590 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D194 8003C594 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D198 8003C598 94820000 */  lhu        $v0, ($a0)
/* 3D19C 8003C59C 94A30000 */  lhu        $v1, ($a1)
/* 3D1A0 8003C5A0 00023A02 */  srl        $a3, $v0, 8
/* 3D1A4 8003C5A4 00033202 */  srl        $a2, $v1, 8
/* 3D1A8 8003C5A8 14E60006 */  bne        $a3, $a2, .L8003C5C4
/* 3D1AC 8003C5AC 3409FFFF */   ori       $t1, $zero, 0xffff
/* 3D1B0 8003C5B0 8C840004 */  lw         $a0, 4($a0)
/* 3D1B4 8003C5B4 0C0262BE */  jal        func_80098AF8
/* 3D1B8 8003C5B8 8CA50004 */   lw        $a1, 4($a1)
/* 3D1BC 8003C5BC 0800F18E */  j          .L8003C638
/* 3D1C0 8003C5C0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8003C5C4:
/* 3D1C4 8003C5C4 3408FFFF */  ori        $t0, $zero, 0xffff
/* 3D1C8 8003C5C8 3C03800F */  lui        $v1, %hi(D_800ED560)
/* 3D1CC 8003C5CC 9462D560 */  lhu        $v0, %lo(D_800ED560)($v1)
/* 3D1D0 8003C5D0 10400014 */  beqz       $v0, .L8003C624
/* 3D1D4 8003C5D4 00002021 */   addu      $a0, $zero, $zero
/* 3D1D8 8003C5D8 2465D560 */  addiu      $a1, $v1, -0x2aa0
/* 3D1DC 8003C5DC 00041040 */  sll        $v0, $a0, 1
.L8003C5E0:
/* 3D1E0 8003C5E0 00451021 */  addu       $v0, $v0, $a1
/* 3D1E4 8003C5E4 94420000 */  lhu        $v0, ($v0)
/* 3D1E8 8003C5E8 50E20001 */  beql       $a3, $v0, .L8003C5F0
/* 3D1EC 8003C5EC 00804821 */   addu      $t1, $a0, $zero
.L8003C5F0:
/* 3D1F0 8003C5F0 50C20001 */  beql       $a2, $v0, .L8003C5F8
/* 3D1F4 8003C5F4 00804021 */   addu      $t0, $a0, $zero
.L8003C5F8:
/* 3D1F8 8003C5F8 24820001 */  addiu      $v0, $a0, 1
/* 3D1FC 8003C5FC 3044FFFF */  andi       $a0, $v0, 0xffff
/* 3D200 8003C600 00041840 */  sll        $v1, $a0, 1
/* 3D204 8003C604 00651821 */  addu       $v1, $v1, $a1
/* 3D208 8003C608 94620000 */  lhu        $v0, ($v1)
/* 3D20C 8003C60C 10400005 */  beqz       $v0, .L8003C624
/* 3D210 8003C610 3402FFFF */   ori       $v0, $zero, 0xffff
/* 3D214 8003C614 5122FFF2 */  beql       $t1, $v0, .L8003C5E0
/* 3D218 8003C618 00041040 */   sll       $v0, $a0, 1
/* 3D21C 8003C61C 1102FFF0 */  beq        $t0, $v0, .L8003C5E0
/* 3D220 8003C620 00041040 */   sll       $v0, $a0, 1
.L8003C624:
/* 3D224 8003C624 0128182B */  sltu       $v1, $t1, $t0
/* 3D228 8003C628 14600002 */  bnez       $v1, .L8003C634
/* 3D22C 8003C62C 2402FFFF */   addiu     $v0, $zero, -1
/* 3D230 8003C630 24020001 */  addiu      $v0, $zero, 1
.L8003C634:
/* 3D234 8003C634 8FBF0010 */  lw         $ra, 0x10($sp)
.L8003C638:
/* 3D238 8003C638 03E00008 */  jr         $ra
/* 3D23C 8003C63C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C640
/* 3D240 8003C640 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D244 8003C644 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3D248 8003C648 AFB00010 */  sw         $s0, 0x10($sp)
/* 3D24C 8003C64C 8C820000 */  lw         $v0, ($a0)
/* 3D250 8003C650 8C430078 */  lw         $v1, 0x78($v0)
/* 3D254 8003C654 84640088 */  lh         $a0, 0x88($v1)
/* 3D258 8003C658 00442021 */  addu       $a0, $v0, $a0
/* 3D25C 8003C65C 8C62008C */  lw         $v0, 0x8c($v1)
/* 3D260 8003C660 0040F809 */  jalr       $v0
/* 3D264 8003C664 8CB00000 */   lw        $s0, ($a1)
/* 3D268 8003C668 8E030078 */  lw         $v1, 0x78($s0)
/* 3D26C 8003C66C 84640088 */  lh         $a0, 0x88($v1)
/* 3D270 8003C670 8C65008C */  lw         $a1, 0x8c($v1)
/* 3D274 8003C674 02042021 */  addu       $a0, $s0, $a0
/* 3D278 8003C678 00A0F809 */  jalr       $a1
/* 3D27C 8003C67C 00408021 */   addu      $s0, $v0, $zero
/* 3D280 8003C680 02002021 */  addu       $a0, $s0, $zero
/* 3D284 8003C684 0C00F164 */  jal        func_8003C590
/* 3D288 8003C688 00402821 */   addu      $a1, $v0, $zero
/* 3D28C 8003C68C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3D290 8003C690 8FB00010 */  lw         $s0, 0x10($sp)
/* 3D294 8003C694 03E00008 */  jr         $ra
/* 3D298 8003C698 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C69C
/* 3D29C 8003C69C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3D2A0 8003C6A0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3D2A4 8003C6A4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3D2A8 8003C6A8 AFB20018 */  sw         $s2, 0x18($sp)
/* 3D2AC 8003C6AC AFB10014 */  sw         $s1, 0x14($sp)
/* 3D2B0 8003C6B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3D2B4 8003C6B4 8C900000 */  lw         $s0, ($a0)
/* 3D2B8 8003C6B8 8E030078 */  lw         $v1, 0x78($s0)
/* 3D2BC 8003C6BC 8CB10000 */  lw         $s1, ($a1)
/* 3D2C0 8003C6C0 84640088 */  lh         $a0, 0x88($v1)
/* 3D2C4 8003C6C4 8C62008C */  lw         $v0, 0x8c($v1)
/* 3D2C8 8003C6C8 0040F809 */  jalr       $v0
/* 3D2CC 8003C6CC 02042021 */   addu      $a0, $s0, $a0
/* 3D2D0 8003C6D0 8E230078 */  lw         $v1, 0x78($s1)
/* 3D2D4 8003C6D4 00409821 */  addu       $s3, $v0, $zero
/* 3D2D8 8003C6D8 84640088 */  lh         $a0, 0x88($v1)
/* 3D2DC 8003C6DC 8C65008C */  lw         $a1, 0x8c($v1)
/* 3D2E0 8003C6E0 00A0F809 */  jalr       $a1
/* 3D2E4 8003C6E4 02242021 */   addu      $a0, $s1, $a0
/* 3D2E8 8003C6E8 8E030078 */  lw         $v1, 0x78($s0)
/* 3D2EC 8003C6EC 00409021 */  addu       $s2, $v0, $zero
/* 3D2F0 8003C6F0 84640078 */  lh         $a0, 0x78($v1)
/* 3D2F4 8003C6F4 8C65007C */  lw         $a1, 0x7c($v1)
/* 3D2F8 8003C6F8 00A0F809 */  jalr       $a1
/* 3D2FC 8003C6FC 02042021 */   addu      $a0, $s0, $a0
/* 3D300 8003C700 8E230078 */  lw         $v1, 0x78($s1)
/* 3D304 8003C704 00408021 */  addu       $s0, $v0, $zero
/* 3D308 8003C708 84640078 */  lh         $a0, 0x78($v1)
/* 3D30C 8003C70C 8C65007C */  lw         $a1, 0x7c($v1)
/* 3D310 8003C710 00A0F809 */  jalr       $a1
/* 3D314 8003C714 02242021 */   addu      $a0, $s1, $a0
/* 3D318 8003C718 9605005E */  lhu        $a1, 0x5e($s0)
/* 3D31C 8003C71C 9444005E */  lhu        $a0, 0x5e($v0)
/* 3D320 8003C720 14A40006 */  bne        $a1, $a0, .L8003C73C
/* 3D324 8003C724 3C02800F */   lui       $v0, 0x800f
/* 3D328 8003C728 02602021 */  addu       $a0, $s3, $zero
/* 3D32C 8003C72C 0C00F164 */  jal        func_8003C590
/* 3D330 8003C730 02402821 */   addu      $a1, $s2, $zero
/* 3D334 8003C734 0800F1DD */  j          .L8003C774
/* 3D338 8003C738 8FBF0020 */   lw        $ra, 0x20($sp)
.L8003C73C:
/* 3D33C 8003C73C 9046D550 */  lbu        $a2, -0x2ab0($v0)
/* 3D340 8003C740 00A6182B */  sltu       $v1, $a1, $a2
/* 3D344 8003C744 10600002 */  beqz       $v1, .L8003C750
/* 3D348 8003C748 24A20004 */   addiu     $v0, $a1, 4
/* 3D34C 8003C74C 3045FFFF */  andi       $a1, $v0, 0xffff
.L8003C750:
/* 3D350 8003C750 0086102B */  sltu       $v0, $a0, $a2
/* 3D354 8003C754 10400002 */  beqz       $v0, .L8003C760
/* 3D358 8003C758 24820004 */   addiu     $v0, $a0, 4
/* 3D35C 8003C75C 3044FFFF */  andi       $a0, $v0, 0xffff
.L8003C760:
/* 3D360 8003C760 00A4182B */  sltu       $v1, $a1, $a0
/* 3D364 8003C764 14600002 */  bnez       $v1, .L8003C770
/* 3D368 8003C768 2402FFFF */   addiu     $v0, $zero, -1
/* 3D36C 8003C76C 24020001 */  addiu      $v0, $zero, 1
.L8003C770:
/* 3D370 8003C770 8FBF0020 */  lw         $ra, 0x20($sp)
.L8003C774:
/* 3D374 8003C774 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3D378 8003C778 8FB20018 */  lw         $s2, 0x18($sp)
/* 3D37C 8003C77C 8FB10014 */  lw         $s1, 0x14($sp)
/* 3D380 8003C780 8FB00010 */  lw         $s0, 0x10($sp)
/* 3D384 8003C784 03E00008 */  jr         $ra
/* 3D388 8003C788 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8003C78C
/* 3D38C 8003C78C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3D390 8003C790 AFB20018 */  sw         $s2, 0x18($sp)
/* 3D394 8003C794 00809021 */  addu       $s2, $a0, $zero
/* 3D398 8003C798 AFBF001C */  sw         $ra, 0x1c($sp)
/* 3D39C 8003C79C AFB10014 */  sw         $s1, 0x14($sp)
/* 3D3A0 8003C7A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3D3A4 8003C7A4 8E420000 */  lw         $v0, ($s2)
/* 3D3A8 8003C7A8 8C430078 */  lw         $v1, 0x78($v0)
/* 3D3AC 8003C7AC 84640078 */  lh         $a0, 0x78($v1)
/* 3D3B0 8003C7B0 00A08821 */  addu       $s1, $a1, $zero
/* 3D3B4 8003C7B4 00442021 */  addu       $a0, $v0, $a0
/* 3D3B8 8003C7B8 8C62007C */  lw         $v0, 0x7c($v1)
/* 3D3BC 8003C7BC 0040F809 */  jalr       $v0
/* 3D3C0 8003C7C0 8E300000 */   lw        $s0, ($s1)
/* 3D3C4 8003C7C4 8E030078 */  lw         $v1, 0x78($s0)
/* 3D3C8 8003C7C8 84640078 */  lh         $a0, 0x78($v1)
/* 3D3CC 8003C7CC 8C65007C */  lw         $a1, 0x7c($v1)
/* 3D3D0 8003C7D0 02042021 */  addu       $a0, $s0, $a0
/* 3D3D4 8003C7D4 00A0F809 */  jalr       $a1
/* 3D3D8 8003C7D8 00408021 */   addu      $s0, $v0, $zero
/* 3D3DC 8003C7DC 12000007 */  beqz       $s0, .L8003C7FC
/* 3D3E0 8003C7E0 00401821 */   addu      $v1, $v0, $zero
/* 3D3E4 8003C7E4 1060000B */  beqz       $v1, .L8003C814
/* 3D3E8 8003C7E8 02402021 */   addu      $a0, $s2, $zero
/* 3D3EC 8003C7EC 0C00F1A7 */  jal        func_8003C69C
/* 3D3F0 8003C7F0 02202821 */   addu      $a1, $s1, $zero
/* 3D3F4 8003C7F4 0800F209 */  j          .L8003C824
/* 3D3F8 8003C7F8 8FBF001C */   lw        $ra, 0x1c($sp)
.L8003C7FC:
/* 3D3FC 8003C7FC 14600005 */  bnez       $v1, .L8003C814
/* 3D400 8003C800 02402021 */   addu      $a0, $s2, $zero
/* 3D404 8003C804 0C00F190 */  jal        func_8003C640
/* 3D408 8003C808 02202821 */   addu      $a1, $s1, $zero
/* 3D40C 8003C80C 0800F209 */  j          .L8003C824
/* 3D410 8003C810 8FBF001C */   lw        $ra, 0x1c($sp)
.L8003C814:
/* 3D414 8003C814 10600002 */  beqz       $v1, .L8003C820
/* 3D418 8003C818 2402FFFF */   addiu     $v0, $zero, -1
/* 3D41C 8003C81C 24020001 */  addiu      $v0, $zero, 1
.L8003C820:
/* 3D420 8003C820 8FBF001C */  lw         $ra, 0x1c($sp)
.L8003C824:
/* 3D424 8003C824 8FB20018 */  lw         $s2, 0x18($sp)
/* 3D428 8003C828 8FB10014 */  lw         $s1, 0x14($sp)
/* 3D42C 8003C82C 8FB00010 */  lw         $s0, 0x10($sp)
/* 3D430 8003C830 03E00008 */  jr         $ra
/* 3D434 8003C834 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_inventory_menu_struct
/* 3D438 8003C838 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3D43C 8003C83C AFB20020 */  sw         $s2, 0x20($sp)
/* 3D440 8003C840 00809021 */  addu       $s2, $a0, $zero
/* 3D444 8003C844 AFB00018 */  sw         $s0, 0x18($sp)
/* 3D448 8003C848 00A08021 */  addu       $s0, $a1, $zero
/* 3D44C 8003C84C 24050012 */  addiu      $a1, $zero, 0x12
/* 3D450 8003C850 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3D454 8003C854 AFBF0024 */  sw         $ra, 0x24($sp)
/* 3D458 8003C858 0C00DF44 */  jal        func_80037D10
/* 3D45C 8003C85C 00C08821 */   addu      $s1, $a2, $zero
/* 3D460 8003C860 02402021 */  addu       $a0, $s2, $zero
/* 3D464 8003C864 24050082 */  addiu      $a1, $zero, 0x82
/* 3D468 8003C868 3C02800E */  lui        $v0, %hi(D_800DC2D8)
/* 3D46C 8003C86C 2442C2D8 */  addiu      $v0, $v0, %lo(D_800DC2D8)
/* 3D470 8003C870 AE420078 */  sw         $v0, 0x78($s2)
/* 3D474 8003C874 3C02800F */  lui        $v0, %hi(partypicker)
/* 3D478 8003C878 24060050 */  addiu      $a2, $zero, 0x50
/* 3D47C 8003C87C AE500090 */  sw         $s0, 0x90($s2)
/* 3D480 8003C880 AE510094 */  sw         $s1, 0x94($s2)
/* 3D484 8003C884 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3D488 8003C888 3C02800E */  lui        $v0, %hi(gGlobals)
/* 3D48C 8003C88C 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 3D490 8003C890 240200FF */  addiu      $v0, $zero, 0xff
/* 3D494 8003C894 A2430088 */  sb         $v1, 0x88($s2)
/* 3D498 8003C898 8E2314EC */  lw         $v1, 0x14ec($s1)
/* 3D49C 8003C89C 24070050 */  addiu      $a3, $zero, 0x50
/* 3D4A0 8003C8A0 AFA20010 */  sw         $v0, 0x10($sp)
/* 3D4A4 8003C8A4 02038026 */  xor        $s0, $s0, $v1
/* 3D4A8 8003C8A8 0C02DD4A */  jal        set_widget_color
/* 3D4AC 8003C8AC 2E100001 */   sltiu     $s0, $s0, 1
/* 3D4B0 8003C8B0 1600001C */  bnez       $s0, .L8003C924
/* 3D4B4 8003C8B4 02402021 */   addu      $a0, $s2, $zero
/* 3D4B8 8003C8B8 8E420094 */  lw         $v0, 0x94($s2)
/* 3D4BC 8003C8BC 14400008 */  bnez       $v0, .L8003C8E0
/* 3D4C0 8003C8C0 3402FFFF */   ori       $v0, $zero, 0xffff
/* 3D4C4 8003C8C4 962314F0 */  lhu        $v1, 0x14f0($s1)
/* 3D4C8 8003C8C8 10620005 */  beq        $v1, $v0, .L8003C8E0
/* 3D4CC 8003C8CC 00000000 */   nop
/* 3D4D0 8003C8D0 0C026259 */  jal        passToMalloc
/* 3D4D4 8003C8D4 2404007C */   addiu     $a0, $zero, 0x7c
/* 3D4D8 8003C8D8 0800F23B */  j          .L8003C8EC
/* 3D4DC 8003C8DC 240400EB */   addiu     $a0, $zero, 0xeb
.L8003C8E0:
/* 3D4E0 8003C8E0 0C026259 */  jal        passToMalloc
/* 3D4E4 8003C8E4 2404007C */   addiu     $a0, $zero, 0x7c
/* 3D4E8 8003C8E8 240400E9 */  addiu      $a0, $zero, 0xe9
.L8003C8EC:
/* 3D4EC 8003C8EC 0C0290E2 */  jal        get_borg_8
/* 3D4F0 8003C8F0 00408021 */   addu      $s0, $v0, $zero
/* 3D4F4 8003C8F4 02002021 */  addu       $a0, $s0, $zero
/* 3D4F8 8003C8F8 0C02E518 */  jal        borg8_widget
/* 3D4FC 8003C8FC 00402821 */   addu      $a1, $v0, $zero
/* 3D500 8003C900 AE42007C */  sw         $v0, 0x7c($s2)
/* 3D504 8003C904 2405009E */  addiu      $a1, $zero, 0x9e
/* 3D508 8003C908 8E44007C */  lw         $a0, 0x7c($s2)
/* 3D50C 8003C90C 0C02DD3F */  jal        set_widget_coords
/* 3D510 8003C910 24060051 */   addiu     $a2, $zero, 0x51
/* 3D514 8003C914 8E45007C */  lw         $a1, 0x7c($s2)
/* 3D518 8003C918 0C02DEDC */  jal        link_widgets
/* 3D51C 8003C91C 02402021 */   addu      $a0, $s2, $zero
/* 3D520 8003C920 02402021 */  addu       $a0, $s2, $zero
.L8003C924:
/* 3D524 8003C924 0C00F25D */  jal        SMInventory
/* 3D528 8003C928 AE400080 */   sw        $zero, 0x80($s2)
/* 3D52C 8003C92C 0C00F3B3 */  jal        func_8003CECC
/* 3D530 8003C930 02402021 */   addu      $a0, $s2, $zero
/* 3D534 8003C934 02401021 */  addu       $v0, $s2, $zero
/* 3D538 8003C938 8FBF0024 */  lw         $ra, 0x24($sp)
/* 3D53C 8003C93C 8FB20020 */  lw         $s2, 0x20($sp)
/* 3D540 8003C940 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3D544 8003C944 8FB00018 */  lw         $s0, 0x18($sp)
/* 3D548 8003C948 03E00008 */  jr         $ra
/* 3D54C 8003C94C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8003C950
/* 3D550 8003C950 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D554 8003C954 3C02800E */  lui        $v0, %hi(D_800DC2D8)
/* 3D558 8003C958 2442C2D8 */  addiu      $v0, $v0, %lo(D_800DC2D8)
/* 3D55C 8003C95C AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D560 8003C960 0C02E66C */  jal        widget_menu_free
/* 3D564 8003C964 AC820078 */   sw        $v0, 0x78($a0)
/* 3D568 8003C968 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D56C 8003C96C 03E00008 */  jr         $ra
/* 3D570 8003C970 27BD0018 */   addiu     $sp, $sp, 0x18

glabel SMInventory
/* 3D574 8003C974 3C02800F */  lui        $v0, %hi(partypicker)
/* 3D578 8003C978 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3D57C 8003C97C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 3D580 8003C980 AFB50044 */  sw         $s5, 0x44($sp)
/* 3D584 8003C984 0080A821 */  addu       $s5, $a0, $zero
/* 3D588 8003C988 AFBF0054 */  sw         $ra, 0x54($sp)
/* 3D58C 8003C98C AFBE0050 */  sw         $fp, 0x50($sp)
/* 3D590 8003C990 AFB7004C */  sw         $s7, 0x4c($sp)
/* 3D594 8003C994 AFB60048 */  sw         $s6, 0x48($sp)
/* 3D598 8003C998 AFB40040 */  sw         $s4, 0x40($sp)
/* 3D59C 8003C99C AFB3003C */  sw         $s3, 0x3c($sp)
/* 3D5A0 8003C9A0 AFB20038 */  sw         $s2, 0x38($sp)
/* 3D5A4 8003C9A4 AFB10034 */  sw         $s1, 0x34($sp)
/* 3D5A8 8003C9A8 AFB00030 */  sw         $s0, 0x30($sp)
/* 3D5AC 8003C9AC 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D5B0 8003C9B0 10800005 */  beqz       $a0, .L8003C9C8
/* 3D5B4 8003C9B4 A2A30088 */   sb        $v1, 0x88($s5)
/* 3D5B8 8003C9B8 0C00BFCC */  jal        func_8002FF30
/* 3D5BC 8003C9BC 00000000 */   nop
/* 3D5C0 8003C9C0 0800F398 */  j          .L8003CE60
/* 3D5C4 8003C9C4 8FBF0054 */   lw        $ra, 0x54($sp)
.L8003C9C8:
/* 3D5C8 8003C9C8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 3D5CC 8003C9CC 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 3D5D0 8003C9D0 8EA30090 */  lw         $v1, 0x90($s5)
/* 3D5D4 8003C9D4 8E2214EC */  lw         $v0, 0x14ec($s1)
/* 3D5D8 8003C9D8 2404007C */  addiu      $a0, $zero, 0x7c
/* 3D5DC 8003C9DC AEA0008C */  sw         $zero, 0x8c($s5)
/* 3D5E0 8003C9E0 00621826 */  xor        $v1, $v1, $v0
/* 3D5E4 8003C9E4 2C630001 */  sltiu      $v1, $v1, 1
/* 3D5E8 8003C9E8 0C026259 */  jal        passToMalloc
/* 3D5EC 8003C9EC AFA30028 */   sw        $v1, 0x28($sp)
/* 3D5F0 8003C9F0 8EA30090 */  lw         $v1, 0x90($s5)
/* 3D5F4 8003C9F4 8C650000 */  lw         $a1, ($v1)
/* 3D5F8 8003C9F8 00408021 */  addu       $s0, $v0, $zero
/* 3D5FC 8003C9FC 84A40048 */  lh         $a0, 0x48($a1)
/* 3D600 8003CA00 8CA6004C */  lw         $a2, 0x4c($a1)
/* 3D604 8003CA04 00C0F809 */  jalr       $a2
/* 3D608 8003CA08 00642021 */   addu      $a0, $v1, $a0
/* 3D60C 8003CA0C 8E2315F8 */  lw         $v1, 0x15f8($s1)
/* 3D610 8003CA10 90650024 */  lbu        $a1, 0x24($v1)
/* 3D614 8003CA14 02002021 */  addu       $a0, $s0, $zero
/* 3D618 8003CA18 00051900 */  sll        $v1, $a1, 4
/* 3D61C 8003CA1C 00651823 */  subu       $v1, $v1, $a1
/* 3D620 8003CA20 00431021 */  addu       $v0, $v0, $v1
/* 3D624 8003CA24 0C00BE10 */  jal        widgetfastscrollmenu_func
/* 3D628 8003CA28 3045FFFF */   andi      $a1, $v0, 0xffff
/* 3D62C 8003CA2C 00402021 */  addu       $a0, $v0, $zero
/* 3D630 8003CA30 24050044 */  addiu      $a1, $zero, 0x44
/* 3D634 8003CA34 2406002A */  addiu      $a2, $zero, 0x2a
/* 3D638 8003CA38 24070022 */  addiu      $a3, $zero, 0x22
/* 3D63C 8003CA3C 8C5E0040 */  lw         $fp, 0x40($v0)
/* 3D640 8003CA40 240800FF */  addiu      $t0, $zero, 0xff
/* 3D644 8003CA44 AEA20080 */  sw         $v0, 0x80($s5)
/* 3D648 8003CA48 24020097 */  addiu      $v0, $zero, 0x97
/* 3D64C 8003CA4C 2403008D */  addiu      $v1, $zero, 0x8d
/* 3D650 8003CA50 AFA20014 */  sw         $v0, 0x14($sp)
/* 3D654 8003CA54 240200BF */  addiu      $v0, $zero, 0xbf
/* 3D658 8003CA58 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3D65C 8003CA5C 24020014 */  addiu      $v0, $zero, 0x14
/* 3D660 8003CA60 AFA80010 */  sw         $t0, 0x10($sp)
/* 3D664 8003CA64 AFA30018 */  sw         $v1, 0x18($sp)
/* 3D668 8003CA68 AFA80020 */  sw         $t0, 0x20($sp)
/* 3D66C 8003CA6C 0C00C0A0 */  jal        func_80030280
/* 3D670 8003CA70 AFA20024 */   sw        $v0, 0x24($sp)
/* 3D674 8003CA74 8EA30078 */  lw         $v1, 0x78($s5)
/* 3D678 8003CA78 8EA50080 */  lw         $a1, 0x80($s5)
/* 3D67C 8003CA7C 84640030 */  lh         $a0, 0x30($v1)
/* 3D680 8003CA80 8C620034 */  lw         $v0, 0x34($v1)
/* 3D684 8003CA84 0040F809 */  jalr       $v0
/* 3D688 8003CA88 02A42021 */   addu      $a0, $s5, $a0
/* 3D68C 8003CA8C 0C00E00B */  jal        make_upDown_arrows
/* 3D690 8003CA90 02A02021 */   addu      $a0, $s5, $zero
/* 3D694 8003CA94 8FA20028 */  lw         $v0, 0x28($sp)
/* 3D698 8003CA98 54400075 */  bnel       $v0, $zero, .L8003CC70
/* 3D69C 8003CA9C 8EA50090 */   lw        $a1, 0x90($s5)
/* 3D6A0 8003CAA0 8E2215F8 */  lw         $v0, 0x15f8($s1)
/* 3D6A4 8003CAA4 90430024 */  lbu        $v1, 0x24($v0)
/* 3D6A8 8003CAA8 10600070 */  beqz       $v1, .L8003CC6C
/* 3D6AC 8003CAAC 0000B021 */   addu      $s6, $zero, $zero
/* 3D6B0 8003CAB0 0220A021 */  addu       $s4, $s1, $zero
/* 3D6B4 8003CAB4 8E8515F8 */  lw         $a1, 0x15f8($s4)
.L8003CAB8:
/* 3D6B8 8003CAB8 92A20088 */  lbu        $v0, 0x88($s5)
/* 3D6BC 8003CABC 90A30024 */  lbu        $v1, 0x24($a1)
/* 3D6C0 8003CAC0 00561021 */  addu       $v0, $v0, $s6
/* 3D6C4 8003CAC4 0043001A */  div        $zero, $v0, $v1
/* 3D6C8 8003CAC8 00002010 */  mfhi       $a0
/* 3D6CC 8003CACC 50600001 */  beql       $v1, $zero, .L8003CAD4
/* 3D6D0 8003CAD0 000001CD */   break     0, 7
.L8003CAD4:
/* 3D6D4 8003CAD4 309300FF */   andi      $s3, $a0, 0xff
/* 3D6D8 8003CAD8 00138080 */  sll        $s0, $s3, 2
/* 3D6DC 8003CADC 00B02821 */  addu       $a1, $a1, $s0
/* 3D6E0 8003CAE0 8CA20000 */  lw         $v0, ($a1)
/* 3D6E4 8003CAE4 8C430024 */  lw         $v1, 0x24($v0)
/* 3D6E8 8003CAE8 5060000F */  beql       $v1, $zero, .L8003CB28
/* 3D6EC 8003CAEC 8E8215F8 */   lw        $v0, 0x15f8($s4)
/* 3D6F0 8003CAF0 0C026259 */  jal        passToMalloc
/* 3D6F4 8003CAF4 24040098 */   addiu     $a0, $zero, 0x98
/* 3D6F8 8003CAF8 8E8315F8 */  lw         $v1, 0x15f8($s4)
/* 3D6FC 8003CAFC 00402021 */  addu       $a0, $v0, $zero
/* 3D700 8003CB00 00701821 */  addu       $v1, $v1, $s0
/* 3D704 8003CB04 8C620000 */  lw         $v0, ($v1)
/* 3D708 8003CB08 24060001 */  addiu      $a2, $zero, 1
/* 3D70C 8003CB0C 8C450024 */  lw         $a1, 0x24($v0)
/* 3D710 8003CB10 0C00F858 */  jal        checkpObject
/* 3D714 8003CB14 02603821 */   addu      $a3, $s3, $zero
/* 3D718 8003CB18 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D71C 8003CB1C 0C00C040 */  jal        func_80030100
/* 3D720 8003CB20 00402821 */   addu      $a1, $v0, $zero
/* 3D724 8003CB24 8E8215F8 */  lw         $v0, 0x15f8($s4)
.L8003CB28:
/* 3D728 8003CB28 00501021 */  addu       $v0, $v0, $s0
/* 3D72C 8003CB2C 8C430000 */  lw         $v1, ($v0)
/* 3D730 8003CB30 8C640020 */  lw         $a0, 0x20($v1)
/* 3D734 8003CB34 8C820000 */  lw         $v0, ($a0)
/* 3D738 8003CB38 50400010 */  beql       $v0, $zero, .L8003CB7C
/* 3D73C 8003CB3C 8E8215F8 */   lw        $v0, 0x15f8($s4)
/* 3D740 8003CB40 0C026259 */  jal        passToMalloc
/* 3D744 8003CB44 24040098 */   addiu     $a0, $zero, 0x98
/* 3D748 8003CB48 8E8315F8 */  lw         $v1, 0x15f8($s4)
/* 3D74C 8003CB4C 00701821 */  addu       $v1, $v1, $s0
/* 3D750 8003CB50 8C650000 */  lw         $a1, ($v1)
/* 3D754 8003CB54 00402021 */  addu       $a0, $v0, $zero
/* 3D758 8003CB58 8CA20020 */  lw         $v0, 0x20($a1)
/* 3D75C 8003CB5C 24060001 */  addiu      $a2, $zero, 1
/* 3D760 8003CB60 8C450000 */  lw         $a1, ($v0)
/* 3D764 8003CB64 0C00F858 */  jal        checkpObject
/* 3D768 8003CB68 02603821 */   addu      $a3, $s3, $zero
/* 3D76C 8003CB6C 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D770 8003CB70 0C00C040 */  jal        func_80030100
/* 3D774 8003CB74 00402821 */   addu      $a1, $v0, $zero
/* 3D778 8003CB78 8E8215F8 */  lw         $v0, 0x15f8($s4)
.L8003CB7C:
/* 3D77C 8003CB7C 00501021 */  addu       $v0, $v0, $s0
/* 3D780 8003CB80 8C430000 */  lw         $v1, ($v0)
/* 3D784 8003CB84 8C640020 */  lw         $a0, 0x20($v1)
/* 3D788 8003CB88 8C820004 */  lw         $v0, 4($a0)
/* 3D78C 8003CB8C 50400010 */  beql       $v0, $zero, .L8003CBD0
/* 3D790 8003CB90 8E8215F8 */   lw        $v0, 0x15f8($s4)
/* 3D794 8003CB94 0C026259 */  jal        passToMalloc
/* 3D798 8003CB98 24040098 */   addiu     $a0, $zero, 0x98
/* 3D79C 8003CB9C 8E8315F8 */  lw         $v1, 0x15f8($s4)
/* 3D7A0 8003CBA0 00701821 */  addu       $v1, $v1, $s0
/* 3D7A4 8003CBA4 8C650000 */  lw         $a1, ($v1)
/* 3D7A8 8003CBA8 00402021 */  addu       $a0, $v0, $zero
/* 3D7AC 8003CBAC 8CA20020 */  lw         $v0, 0x20($a1)
/* 3D7B0 8003CBB0 24060001 */  addiu      $a2, $zero, 1
/* 3D7B4 8003CBB4 8C450004 */  lw         $a1, 4($v0)
/* 3D7B8 8003CBB8 0C00F858 */  jal        checkpObject
/* 3D7BC 8003CBBC 02603821 */   addu      $a3, $s3, $zero
/* 3D7C0 8003CBC0 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D7C4 8003CBC4 0C00C040 */  jal        func_80030100
/* 3D7C8 8003CBC8 00402821 */   addu      $a1, $v0, $zero
/* 3D7CC 8003CBCC 8E8215F8 */  lw         $v0, 0x15f8($s4)
.L8003CBD0:
/* 3D7D0 8003CBD0 00501021 */  addu       $v0, $v0, $s0
/* 3D7D4 8003CBD4 8C430000 */  lw         $v1, ($v0)
/* 3D7D8 8003CBD8 8C720028 */  lw         $s2, 0x28($v1)
/* 3D7DC 8003CBDC 00008821 */  addu       $s1, $zero, $zero
/* 3D7E0 8003CBE0 92420004 */  lbu        $v0, 4($s2)
/* 3D7E4 8003CBE4 1040001B */  beqz       $v0, .L8003CC54
/* 3D7E8 8003CBE8 26D60001 */   addiu     $s6, $s6, 1
/* 3D7EC 8003CBEC 8E430000 */  lw         $v1, ($s2)
.L8003CBF0:
/* 3D7F0 8003CBF0 00111080 */  sll        $v0, $s1, 2
/* 3D7F4 8003CBF4 00431021 */  addu       $v0, $v0, $v1
/* 3D7F8 8003CBF8 8C500000 */  lw         $s0, ($v0)
/* 3D7FC 8003CBFC 5200000E */  beql       $s0, $zero, .L8003CC38
/* 3D800 8003CC00 26310001 */   addiu     $s1, $s1, 1
/* 3D804 8003CC04 0C026259 */  jal        passToMalloc
/* 3D808 8003CC08 24040098 */   addiu     $a0, $zero, 0x98
/* 3D80C 8003CC0C 00402021 */  addu       $a0, $v0, $zero
/* 3D810 8003CC10 02002821 */  addu       $a1, $s0, $zero
/* 3D814 8003CC14 24060001 */  addiu      $a2, $zero, 1
/* 3D818 8003CC18 0C00F858 */  jal        checkpObject
/* 3D81C 8003CC1C 02603821 */   addu      $a3, $s3, $zero
/* 3D820 8003CC20 00408021 */  addu       $s0, $v0, $zero
/* 3D824 8003CC24 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D828 8003CC28 0C00C040 */  jal        func_80030100
/* 3D82C 8003CC2C 02002821 */   addu      $a1, $s0, $zero
/* 3D830 8003CC30 A211005C */  sb         $s1, 0x5c($s0)
/* 3D834 8003CC34 26310001 */  addiu      $s1, $s1, 1
.L8003CC38:
/* 3D838 8003CC38 2E22000F */  sltiu      $v0, $s1, 0xf
/* 3D83C 8003CC3C 50400006 */  beql       $v0, $zero, .L8003CC58
/* 3D840 8003CC40 8E8215F8 */   lw        $v0, 0x15f8($s4)
/* 3D844 8003CC44 92420004 */  lbu        $v0, 4($s2)
/* 3D848 8003CC48 0222102B */  sltu       $v0, $s1, $v0
/* 3D84C 8003CC4C 5440FFE8 */  bnel       $v0, $zero, .L8003CBF0
/* 3D850 8003CC50 8E430000 */   lw        $v1, ($s2)
.L8003CC54:
/* 3D854 8003CC54 8E8215F8 */  lw         $v0, 0x15f8($s4)
.L8003CC58:
/* 3D858 8003CC58 90430024 */  lbu        $v1, 0x24($v0)
/* 3D85C 8003CC5C 32D600FF */  andi       $s6, $s6, 0xff
/* 3D860 8003CC60 02C3182B */  sltu       $v1, $s6, $v1
/* 3D864 8003CC64 5460FF94 */  bnel       $v1, $zero, .L8003CAB8
/* 3D868 8003CC68 8E8515F8 */   lw        $a1, 0x15f8($s4)
.L8003CC6C:
/* 3D86C 8003CC6C 8EA50090 */  lw         $a1, 0x90($s5)
.L8003CC70:
/* 3D870 8003CC70 97C20020 */  lhu        $v0, 0x20($fp)
/* 3D874 8003CC74 8CA30000 */  lw         $v1, ($a1)
/* 3D878 8003CC78 A6A20098 */  sh         $v0, 0x98($s5)
/* 3D87C 8003CC7C 84640040 */  lh         $a0, 0x40($v1)
/* 3D880 8003CC80 8C620044 */  lw         $v0, 0x44($v1)
/* 3D884 8003CC84 0040F809 */  jalr       $v0
/* 3D888 8003CC88 00A42021 */   addu      $a0, $a1, $a0
/* 3D88C 8003CC8C 00022040 */  sll        $a0, $v0, 1
/* 3D890 8003CC90 3C02800E */  lui        $v0, %hi(D_800DC1D0)
/* 3D894 8003CC94 2445C1D0 */  addiu      $a1, $v0, %lo(D_800DC1D0)
/* 3D898 8003CC98 0C025F9C */  jal        Malloc
/* 3D89C 8003CC9C 24060155 */   addiu     $a2, $zero, 0x155
/* 3D8A0 8003CCA0 00008021 */  addu       $s0, $zero, $zero
/* 3D8A4 8003CCA4 8EA50090 */  lw         $a1, 0x90($s5)
/* 3D8A8 8003CCA8 0000A021 */  addu       $s4, $zero, $zero
/* 3D8AC 8003CCAC 8CA60000 */  lw         $a2, ($a1)
/* 3D8B0 8003CCB0 0040B821 */  addu       $s7, $v0, $zero
/* 3D8B4 8003CCB4 84C40048 */  lh         $a0, 0x48($a2)
/* 3D8B8 8003CCB8 8CC3004C */  lw         $v1, 0x4c($a2)
/* 3D8BC 8003CCBC 0060F809 */  jalr       $v1
/* 3D8C0 8003CCC0 00A42021 */   addu      $a0, $a1, $a0
/* 3D8C4 8003CCC4 00408821 */  addu       $s1, $v0, $zero
/* 3D8C8 8003CCC8 52200014 */  beql       $s1, $zero, .L8003CD1C
/* 3D8CC 8003CCCC 8EA50090 */   lw        $a1, 0x90($s5)
/* 3D8D0 8003CCD0 8EA60090 */  lw         $a2, 0x90($s5)
.L8003CCD4:
/* 3D8D4 8003CCD4 8CC30000 */  lw         $v1, ($a2)
/* 3D8D8 8003CCD8 02002821 */  addu       $a1, $s0, $zero
/* 3D8DC 8003CCDC 84640058 */  lh         $a0, 0x58($v1)
/* 3D8E0 8003CCE0 8C62005C */  lw         $v0, 0x5c($v1)
/* 3D8E4 8003CCE4 0040F809 */  jalr       $v0
/* 3D8E8 8003CCE8 00C42021 */   addu      $a0, $a2, $a0
/* 3D8EC 8003CCEC 10400005 */  beqz       $v0, .L8003CD04
/* 3D8F0 8003CCF0 00141040 */   sll       $v0, $s4, 1
/* 3D8F4 8003CCF4 00571021 */  addu       $v0, $v0, $s7
/* 3D8F8 8003CCF8 A4500000 */  sh         $s0, ($v0)
/* 3D8FC 8003CCFC 26830001 */  addiu      $v1, $s4, 1
/* 3D900 8003CD00 3074FFFF */  andi       $s4, $v1, 0xffff
.L8003CD04:
/* 3D904 8003CD04 26020001 */  addiu      $v0, $s0, 1
/* 3D908 8003CD08 3050FFFF */  andi       $s0, $v0, 0xffff
/* 3D90C 8003CD0C 0211182B */  sltu       $v1, $s0, $s1
/* 3D910 8003CD10 5460FFF0 */  bnel       $v1, $zero, .L8003CCD4
/* 3D914 8003CD14 8EA60090 */   lw        $a2, 0x90($s5)
/* 3D918 8003CD18 8EA50090 */  lw         $a1, 0x90($s5)
.L8003CD1C:
/* 3D91C 8003CD1C 8CA30000 */  lw         $v1, ($a1)
/* 3D920 8003CD20 84640040 */  lh         $a0, 0x40($v1)
/* 3D924 8003CD24 8C620044 */  lw         $v0, 0x44($v1)
/* 3D928 8003CD28 0040F809 */  jalr       $v0
/* 3D92C 8003CD2C 00A42021 */   addu      $a0, $a1, $a0
/* 3D930 8003CD30 12820005 */  beq        $s4, $v0, .L8003CD48
/* 3D934 8003CD34 3C04800E */   lui       $a0, %hi(D_800DC1F0)
/* 3D938 8003CD38 2484C1F0 */  addiu      $a0, $a0, %lo(D_800DC1F0)
/* 3D93C 8003CD3C 3C05800E */  lui        $a1, %hi(D_800DC204)
/* 3D940 8003CD40 0C025F2D */  jal        manualCrash
/* 3D944 8003CD44 24A5C204 */   addiu     $a1, $a1, %lo(D_800DC204)
.L8003CD48:
/* 3D948 8003CD48 12800030 */  beqz       $s4, .L8003CE0C
/* 3D94C 8003CD4C 00009821 */   addu      $s3, $zero, $zero
/* 3D950 8003CD50 00138040 */  sll        $s0, $s3, 1
.L8003CD54:
/* 3D954 8003CD54 8EA60090 */  lw         $a2, 0x90($s5)
/* 3D958 8003CD58 02178821 */  addu       $s1, $s0, $s7
/* 3D95C 8003CD5C 8CC30000 */  lw         $v1, ($a2)
/* 3D960 8003CD60 96250000 */  lhu        $a1, ($s1)
/* 3D964 8003CD64 84640058 */  lh         $a0, 0x58($v1)
/* 3D968 8003CD68 8C62005C */  lw         $v0, 0x5c($v1)
/* 3D96C 8003CD6C 0040F809 */  jalr       $v0
/* 3D970 8003CD70 00C42021 */   addu      $a0, $a2, $a0
/* 3D974 8003CD74 00409021 */  addu       $s2, $v0, $zero
/* 3D978 8003CD78 1240001F */  beqz       $s2, .L8003CDF8
/* 3D97C 8003CD7C 0200B021 */   addu      $s6, $s0, $zero
/* 3D980 8003CD80 8EA60090 */  lw         $a2, 0x90($s5)
/* 3D984 8003CD84 8CC30000 */  lw         $v1, ($a2)
/* 3D988 8003CD88 96250000 */  lhu        $a1, ($s1)
/* 3D98C 8003CD8C 84640068 */  lh         $a0, 0x68($v1)
/* 3D990 8003CD90 8C62006C */  lw         $v0, 0x6c($v1)
/* 3D994 8003CD94 0040F809 */  jalr       $v0
/* 3D998 8003CD98 00C42021 */   addu      $a0, $a2, $a0
/* 3D99C 8003CD9C 8FA30028 */  lw         $v1, 0x28($sp)
/* 3D9A0 8003CDA0 10600007 */  beqz       $v1, .L8003CDC0
/* 3D9A4 8003CDA4 305000FF */   andi      $s0, $v0, 0xff
/* 3D9A8 8003CDA8 3C03800E */  lui        $v1, %hi(gGlobals)
/* 3D9AC 8003CDAC 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 3D9B0 8003CDB0 946214F0 */  lhu        $v0, 0x14f0($v1)
/* 3D9B4 8003CDB4 3403FFFF */  ori        $v1, $zero, 0xffff
/* 3D9B8 8003CDB8 54430001 */  bnel       $v0, $v1, .L8003CDC0
/* 3D9BC 8003CDBC 00008021 */   addu      $s0, $zero, $zero
.L8003CDC0:
/* 3D9C0 8003CDC0 0C026259 */  jal        passToMalloc
/* 3D9C4 8003CDC4 24040098 */   addiu     $a0, $zero, 0x98
/* 3D9C8 8003CDC8 00402021 */  addu       $a0, $v0, $zero
/* 3D9CC 8003CDCC 02402821 */  addu       $a1, $s2, $zero
/* 3D9D0 8003CDD0 02003021 */  addu       $a2, $s0, $zero
/* 3D9D4 8003CDD4 0C00F858 */  jal        checkpObject
/* 3D9D8 8003CDD8 240700FF */   addiu     $a3, $zero, 0xff
/* 3D9DC 8003CDDC 00408021 */  addu       $s0, $v0, $zero
/* 3D9E0 8003CDE0 8EA40080 */  lw         $a0, 0x80($s5)
/* 3D9E4 8003CDE4 0C00C040 */  jal        func_80030100
/* 3D9E8 8003CDE8 02002821 */   addu      $a1, $s0, $zero
/* 3D9EC 8003CDEC 02D71821 */  addu       $v1, $s6, $s7
/* 3D9F0 8003CDF0 90620001 */  lbu        $v0, 1($v1)
/* 3D9F4 8003CDF4 A202005C */  sb         $v0, 0x5c($s0)
.L8003CDF8:
/* 3D9F8 8003CDF8 26620001 */  addiu      $v0, $s3, 1
/* 3D9FC 8003CDFC 3053FFFF */  andi       $s3, $v0, 0xffff
/* 3DA00 8003CE00 0274182B */  sltu       $v1, $s3, $s4
/* 3DA04 8003CE04 1460FFD3 */  bnez       $v1, .L8003CD54
/* 3DA08 8003CE08 00138040 */   sll       $s0, $s3, 1
.L8003CE0C:
/* 3DA0C 8003CE0C 02E02021 */  addu       $a0, $s7, $zero
/* 3DA10 8003CE10 3C02800E */  lui        $v0, %hi(D_800DC1D0)
/* 3DA14 8003CE14 2445C1D0 */  addiu      $a1, $v0, %lo(D_800DC1D0)
/* 3DA18 8003CE18 0C02600C */  jal        Free
/* 3DA1C 8003CE1C 2406018B */   addiu     $a2, $zero, 0x18b
/* 3DA20 8003CE20 97C20020 */  lhu        $v0, 0x20($fp)
/* 3DA24 8003CE24 1040000D */  beqz       $v0, .L8003CE5C
/* 3DA28 8003CE28 24060004 */   addiu     $a2, $zero, 4
/* 3DA2C 8003CE2C 00402821 */  addu       $a1, $v0, $zero
/* 3DA30 8003CE30 3C078004 */  lui        $a3, %hi(func_8003C78C)
/* 3DA34 8003CE34 8FC40018 */  lw         $a0, 0x18($fp)
/* 3DA38 8003CE38 0C02F6A5 */  jal        quicksort_func
/* 3DA3C 8003CE3C 24E7C78C */   addiu     $a3, $a3, %lo(func_8003C78C)
/* 3DA40 8003CE40 8EA30078 */  lw         $v1, 0x78($s5)
/* 3DA44 8003CE44 84640028 */  lh         $a0, 0x28($v1)
/* 3DA48 8003CE48 8C62002C */  lw         $v0, 0x2c($v1)
/* 3DA4C 8003CE4C 0040F809 */  jalr       $v0
/* 3DA50 8003CE50 02A42021 */   addu      $a0, $s5, $a0
/* 3DA54 8003CE54 0C00BFCC */  jal        func_8002FF30
/* 3DA58 8003CE58 8EA40080 */   lw        $a0, 0x80($s5)
.L8003CE5C:
/* 3DA5C 8003CE5C 8FBF0054 */  lw         $ra, 0x54($sp)
.L8003CE60:
/* 3DA60 8003CE60 8FBE0050 */  lw         $fp, 0x50($sp)
/* 3DA64 8003CE64 8FB7004C */  lw         $s7, 0x4c($sp)
/* 3DA68 8003CE68 8FB60048 */  lw         $s6, 0x48($sp)
/* 3DA6C 8003CE6C 8FB50044 */  lw         $s5, 0x44($sp)
/* 3DA70 8003CE70 8FB40040 */  lw         $s4, 0x40($sp)
/* 3DA74 8003CE74 8FB3003C */  lw         $s3, 0x3c($sp)
/* 3DA78 8003CE78 8FB20038 */  lw         $s2, 0x38($sp)
/* 3DA7C 8003CE7C 8FB10034 */  lw         $s1, 0x34($sp)
/* 3DA80 8003CE80 8FB00030 */  lw         $s0, 0x30($sp)
/* 3DA84 8003CE84 03E00008 */  jr         $ra
/* 3DA88 8003CE88 27BD0058 */   addiu     $sp, $sp, 0x58

glabel ret0_8003ce8c
/* 3DA8C 8003CE8C 03E00008 */  jr         $ra
/* 3DA90 8003CE90 00001021 */   addu      $v0, $zero, $zero

glabel func_8003CE94
/* 3DA94 8003CE94 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3DA98 8003CE98 00063400 */  sll        $a2, $a2, 0x10
/* 3DA9C 8003CE9C 00073C00 */  sll        $a3, $a3, 0x10
/* 3DAA0 8003CEA0 00063403 */  sra        $a2, $a2, 0x10
/* 3DAA4 8003CEA4 87A20032 */  lh         $v0, 0x32($sp)
/* 3DAA8 8003CEA8 87A30036 */  lh         $v1, 0x36($sp)
/* 3DAAC 8003CEAC 00073C03 */  sra        $a3, $a3, 0x10
/* 3DAB0 8003CEB0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3DAB4 8003CEB4 AFA20010 */  sw         $v0, 0x10($sp)
/* 3DAB8 8003CEB8 0C02DE14 */  jal        widget_func_8
/* 3DABC 8003CEBC AFA30014 */   sw        $v1, 0x14($sp)
/* 3DAC0 8003CEC0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3DAC4 8003CEC4 03E00008 */  jr         $ra
/* 3DAC8 8003CEC8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003CECC
/* 3DACC 8003CECC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3DAD0 8003CED0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3DAD4 8003CED4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3DAD8 8003CED8 0C00DFB2 */  jal        func_80037EC8
/* 3DADC 8003CEDC 00808021 */   addu      $s0, $a0, $zero
/* 3DAE0 8003CEE0 0C02DE51 */  jal        func_800B7944
/* 3DAE4 8003CEE4 02002021 */   addu      $a0, $s0, $zero
/* 3DAE8 8003CEE8 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3DAEC 8003CEEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 3DAF0 8003CEF0 03E00008 */  jr         $ra
/* 3DAF4 8003CEF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel NOOP_8003cef8
/* 3DAF8 8003CEF8 03E00008 */  jr         $ra
/* 3DAFC 8003CEFC 00000000 */   nop

glabel NOOP_8003CF00
/* 3DB00 8003CF00 03E00008 */  jr         $ra
/* 3DB04 8003CF04 00000000 */   nop

glabel ret0_8003CF08
/* 3DB08 8003CF08 03E00008 */  jr         $ra
/* 3DB0C 8003CF0C 00001021 */   addu      $v0, $zero, $zero

glabel func_8003CF10
/* 3DB10 8003CF10 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3DB14 8003CF14 AFB10014 */  sw         $s1, 0x14($sp)
/* 3DB18 8003CF18 00808821 */  addu       $s1, $a0, $zero
/* 3DB1C 8003CF1C AFBF0018 */  sw         $ra, 0x18($sp)
/* 3DB20 8003CF20 AFB00010 */  sw         $s0, 0x10($sp)
/* 3DB24 8003CF24 8E250080 */  lw         $a1, 0x80($s1)
/* 3DB28 8003CF28 8CA30078 */  lw         $v1, 0x78($a1)
/* 3DB2C 8003CF2C 84640078 */  lh         $a0, 0x78($v1)
/* 3DB30 8003CF30 8C62007C */  lw         $v0, 0x7c($v1)
/* 3DB34 8003CF34 0040F809 */  jalr       $v0
/* 3DB38 8003CF38 00A42021 */   addu      $a0, $a1, $a0
/* 3DB3C 8003CF3C 3C04800E */  lui        $a0, %hi(shop_inventory)
/* 3DB40 8003CF40 8E230090 */  lw         $v1, 0x90($s1)
/* 3DB44 8003CF44 8C857D94 */  lw         $a1, %lo(shop_inventory)($a0)
/* 3DB48 8003CF48 00403021 */  addu       $a2, $v0, $zero
/* 3DB4C 8003CF4C 00651826 */  xor        $v1, $v1, $a1
/* 3DB50 8003CF50 14C00003 */  bnez       $a2, .L8003CF60
/* 3DB54 8003CF54 0003802B */   sltu      $s0, $zero, $v1
/* 3DB58 8003CF58 0800F414 */  j          .L8003D050
/* 3DB5C 8003CF5C 00001021 */   addu      $v0, $zero, $zero
.L8003CF60:
/* 3DB60 8003CF60 8CC30078 */  lw         $v1, 0x78($a2)
/* 3DB64 8003CF64 84640088 */  lh         $a0, 0x88($v1)
/* 3DB68 8003CF68 8C62008C */  lw         $v0, 0x8c($v1)
/* 3DB6C 8003CF6C 0040F809 */  jalr       $v0
/* 3DB70 8003CF70 00C42021 */   addu      $a0, $a2, $a0
/* 3DB74 8003CF74 00402021 */  addu       $a0, $v0, $zero
/* 3DB78 8003CF78 3C02800F */  lui        $v0, %hi(barter_float)
/* 3DB7C 8003CF7C 9483000A */  lhu        $v1, 0xa($a0)
/* 3DB80 8003CF80 12000018 */  beqz       $s0, .L8003CFE4
/* 3DB84 8003CF84 C444D5C0 */   lwc1      $f4, %lo(barter_float)($v0)
/* 3DB88 8003CF88 44831000 */  mtc1       $v1, $f2
/* 3DB8C 8003CF8C 468010A1 */  cvt.d.w    $f2, $f2
/* 3DB90 8003CF90 04610004 */  bgez       $v1, .L8003CFA4
/* 3DB94 8003CF94 00000000 */   nop
/* 3DB98 8003CF98 3C01800E */  lui        $at, %hi(D_800DC218)
/* 3DB9C 8003CF9C D420C218 */  ldc1       $f0, %lo(D_800DC218)($at)
/* 3DBA0 8003CFA0 46201080 */  add.d      $f2, $f2, $f0
.L8003CFA4:
/* 3DBA4 8003CFA4 3C01800E */  lui        $at, %hi(D_800DC220)
/* 3DBA8 8003CFA8 C420C220 */  lwc1       $f0, %lo(D_800DC220)($at)
/* 3DBAC 8003CFAC 46040001 */  sub.s      $f0, $f0, $f4
/* 3DBB0 8003CFB0 462010A0 */  cvt.s.d    $f2, $f2
/* 3DBB4 8003CFB4 46001082 */  mul.s      $f2, $f2, $f0
/* 3DBB8 8003CFB8 3C01800E */  lui        $at, %hi(D_800DC224)
/* 3DBBC 8003CFBC C424C224 */  lwc1       $f4, %lo(D_800DC224)($at)
/* 3DBC0 8003CFC0 46041002 */  mul.s      $f0, $f2, $f4
/* 3DBC4 8003CFC4 3C01800E */  lui        $at, %hi(D_800DC228)
/* 3DBC8 8003CFC8 C422C228 */  lwc1       $f2, %lo(D_800DC228)($at)
/* 3DBCC 8003CFCC 4600103E */  c.le.s     $f2, $f0
/* 3DBD0 8003CFD0 00000000 */  nop
/* 3DBD4 8003CFD4 45000013 */  bc1f       .L8003D024
/* 3DBD8 8003CFD8 00000000 */   nop
/* 3DBDC 8003CFDC 0800F40D */  j          .L8003D034
/* 3DBE0 8003CFE0 46020001 */   sub.s     $f0, $f0, $f2
.L8003CFE4:
/* 3DBE4 8003CFE4 44831000 */  mtc1       $v1, $f2
/* 3DBE8 8003CFE8 468010A1 */  cvt.d.w    $f2, $f2
/* 3DBEC 8003CFEC 04630005 */  bgezl      $v1, .L8003D004
/* 3DBF0 8003CFF0 462010A0 */   cvt.s.d   $f2, $f2
/* 3DBF4 8003CFF4 3C01800E */  lui        $at, %hi(D_800DC230)
/* 3DBF8 8003CFF8 D420C230 */  ldc1       $f0, %lo(D_800DC230)($at)
/* 3DBFC 8003CFFC 46201080 */  add.d      $f2, $f2, $f0
/* 3DC00 8003D000 462010A0 */  cvt.s.d    $f2, $f2
.L8003D004:
/* 3DC04 8003D004 46022002 */  mul.s      $f0, $f4, $f2
/* 3DC08 8003D008 46020000 */  add.s      $f0, $f0, $f2
/* 3DC0C 8003D00C 3C01800E */  lui        $at, %hi(D_800DC238)
/* 3DC10 8003D010 C422C238 */  lwc1       $f2, %lo(D_800DC238)($at)
/* 3DC14 8003D014 4600103E */  c.le.s     $f2, $f0
/* 3DC18 8003D018 00000000 */  nop
/* 3DC1C 8003D01C 45030005 */  bc1tl      .L8003D034
/* 3DC20 8003D020 46020001 */   sub.s     $f0, $f0, $f2
.L8003D024:
/* 3DC24 8003D024 4600008D */  trunc.w.s  $f2, $f0
/* 3DC28 8003D028 44031000 */  mfc1       $v1, $f2
/* 3DC2C 8003D02C 0800F412 */  j          .L8003D048
/* 3DC30 8003D030 3063FFFF */   andi      $v1, $v1, 0xffff
.L8003D034:
/* 3DC34 8003D034 4600008D */  trunc.w.s  $f2, $f0
/* 3DC38 8003D038 44031000 */  mfc1       $v1, $f2
/* 3DC3C 8003D03C 3C028000 */  lui        $v0, 0x8000
/* 3DC40 8003D040 00621825 */  or         $v1, $v1, $v0
/* 3DC44 8003D044 3063FFFF */  andi       $v1, $v1, 0xffff
.L8003D048:
/* 3DC48 8003D048 AE24008C */  sw         $a0, 0x8c($s1)
/* 3DC4C 8003D04C 00601021 */  addu       $v0, $v1, $zero
.L8003D050:
/* 3DC50 8003D050 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3DC54 8003D054 8FB10014 */  lw         $s1, 0x14($sp)
/* 3DC58 8003D058 8FB00010 */  lw         $s0, 0x10($sp)
/* 3DC5C 8003D05C 03E00008 */  jr         $ra
/* 3DC60 8003D060 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003D064
/* 3DC64 8003D064 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 3DC68 8003D068 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3DC6C 8003D06C 00809821 */  addu       $s3, $a0, $zero
/* 3DC70 8003D070 AFB40020 */  sw         $s4, 0x20($sp)
/* 3DC74 8003D074 30B4FFFF */  andi       $s4, $a1, 0xffff
/* 3DC78 8003D078 AFB60028 */  sw         $s6, 0x28($sp)
/* 3DC7C 8003D07C 30D600FF */  andi       $s6, $a2, 0xff
/* 3DC80 8003D080 30E700FF */  andi       $a3, $a3, 0xff
/* 3DC84 8003D084 AFBF002C */  sw         $ra, 0x2c($sp)
/* 3DC88 8003D088 AFB50024 */  sw         $s5, 0x24($sp)
/* 3DC8C 8003D08C AFB20018 */  sw         $s2, 0x18($sp)
/* 3DC90 8003D090 AFB10014 */  sw         $s1, 0x14($sp)
/* 3DC94 8003D094 AFB00010 */  sw         $s0, 0x10($sp)
/* 3DC98 8003D098 8E620080 */  lw         $v0, 0x80($s3)
/* 3DC9C 8003D09C 240300FF */  addiu      $v1, $zero, 0xff
/* 3DCA0 8003D0A0 14E30019 */  bne        $a3, $v1, .L8003D108
/* 3DCA4 8003D0A4 8C520040 */   lw        $s2, 0x40($v0)
/* 3DCA8 8003D0A8 96650098 */  lhu        $a1, 0x98($s3)
/* 3DCAC 8003D0AC 96430020 */  lhu        $v1, 0x20($s2)
/* 3DCB0 8003D0B0 00A3102B */  sltu       $v0, $a1, $v1
/* 3DCB4 8003D0B4 1040002C */  beqz       $v0, .L8003D168
/* 3DCB8 8003D0B8 00603021 */   addu      $a2, $v1, $zero
/* 3DCBC 8003D0BC 8E470018 */  lw         $a3, 0x18($s2)
/* 3DCC0 8003D0C0 00051080 */  sll        $v0, $a1, 2
.L8003D0C4:
/* 3DCC4 8003D0C4 00471021 */  addu       $v0, $v0, $a3
/* 3DCC8 8003D0C8 8C430000 */  lw         $v1, ($v0)
/* 3DCCC 8003D0CC 9464005E */  lhu        $a0, 0x5e($v1)
/* 3DCD0 8003D0D0 10940007 */  beq        $a0, $s4, .L8003D0F0
/* 3DCD4 8003D0D4 24A20001 */   addiu     $v0, $a1, 1
/* 3DCD8 8003D0D8 3045FFFF */  andi       $a1, $v0, 0xffff
/* 3DCDC 8003D0DC 00A6182B */  sltu       $v1, $a1, $a2
/* 3DCE0 8003D0E0 1460FFF8 */  bnez       $v1, .L8003D0C4
/* 3DCE4 8003D0E4 00051080 */   sll       $v0, $a1, 2
/* 3DCE8 8003D0E8 0800F45B */  j          .L8003D16C
/* 3DCEC 8003D0EC 00001021 */   addu      $v0, $zero, $zero
.L8003D0F0:
/* 3DCF0 8003D0F0 A645001E */  sh         $a1, 0x1e($s2)
.L8003D0F4:
/* 3DCF4 8003D0F4 02602021 */  addu       $a0, $s3, $zero
/* 3DCF8 8003D0F8 0C00F465 */  jal        func_8003D194
/* 3DCFC 8003D0FC 02C02821 */   addu      $a1, $s6, $zero
/* 3DD00 8003D100 0800F45C */  j          .L8003D170
/* 3DD04 8003D104 8FBF002C */   lw        $ra, 0x2c($sp)
.L8003D108:
/* 3DD08 8003D108 96620098 */  lhu        $v0, 0x98($s3)
/* 3DD0C 8003D10C 10400016 */  beqz       $v0, .L8003D168
/* 3DD10 8003D110 00008821 */   addu      $s1, $zero, $zero
/* 3DD14 8003D114 30F5FFFF */  andi       $s5, $a3, 0xffff
/* 3DD18 8003D118 8E430018 */  lw         $v1, 0x18($s2)
.L8003D11C:
/* 3DD1C 8003D11C 00111080 */  sll        $v0, $s1, 2
/* 3DD20 8003D120 00431021 */  addu       $v0, $v0, $v1
/* 3DD24 8003D124 8C500000 */  lw         $s0, ($v0)
/* 3DD28 8003D128 8E030078 */  lw         $v1, 0x78($s0)
/* 3DD2C 8003D12C 84640078 */  lh         $a0, 0x78($v1)
/* 3DD30 8003D130 8C62007C */  lw         $v0, 0x7c($v1)
/* 3DD34 8003D134 0040F809 */  jalr       $v0
/* 3DD38 8003D138 02042021 */   addu      $a0, $s0, $a0
/* 3DD3C 8003D13C 9443005E */  lhu        $v1, 0x5e($v0)
/* 3DD40 8003D140 14750004 */  bne        $v1, $s5, .L8003D154
/* 3DD44 8003D144 26230001 */   addiu     $v1, $s1, 1
/* 3DD48 8003D148 9602005E */  lhu        $v0, 0x5e($s0)
/* 3DD4C 8003D14C 5054FFE9 */  beql       $v0, $s4, .L8003D0F4
/* 3DD50 8003D150 A651001E */   sh        $s1, 0x1e($s2)
.L8003D154:
/* 3DD54 8003D154 96620098 */  lhu        $v0, 0x98($s3)
/* 3DD58 8003D158 3071FFFF */  andi       $s1, $v1, 0xffff
/* 3DD5C 8003D15C 0222102B */  sltu       $v0, $s1, $v0
/* 3DD60 8003D160 5440FFEE */  bnel       $v0, $zero, .L8003D11C
/* 3DD64 8003D164 8E430018 */   lw        $v1, 0x18($s2)
.L8003D168:
/* 3DD68 8003D168 00001021 */  addu       $v0, $zero, $zero
.L8003D16C:
/* 3DD6C 8003D16C 8FBF002C */  lw         $ra, 0x2c($sp)
.L8003D170:
/* 3DD70 8003D170 8FB60028 */  lw         $s6, 0x28($sp)
/* 3DD74 8003D174 8FB50024 */  lw         $s5, 0x24($sp)
/* 3DD78 8003D178 8FB40020 */  lw         $s4, 0x20($sp)
/* 3DD7C 8003D17C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3DD80 8003D180 8FB20018 */  lw         $s2, 0x18($sp)
/* 3DD84 8003D184 8FB10014 */  lw         $s1, 0x14($sp)
/* 3DD88 8003D188 8FB00010 */  lw         $s0, 0x10($sp)
/* 3DD8C 8003D18C 03E00008 */  jr         $ra
/* 3DD90 8003D190 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8003D194
/* 3DD94 8003D194 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 3DD98 8003D198 AFB30064 */  sw         $s3, 0x64($sp)
/* 3DD9C 8003D19C 00809821 */  addu       $s3, $a0, $zero
/* 3DDA0 8003D1A0 AFB1005C */  sw         $s1, 0x5c($sp)
/* 3DDA4 8003D1A4 30B100FF */  andi       $s1, $a1, 0xff
/* 3DDA8 8003D1A8 AFBF0068 */  sw         $ra, 0x68($sp)
/* 3DDAC 8003D1AC AFB20060 */  sw         $s2, 0x60($sp)
/* 3DDB0 8003D1B0 16200003 */  bnez       $s1, .L8003D1C0
/* 3DDB4 8003D1B4 AFB00058 */   sw        $s0, 0x58($sp)
/* 3DDB8 8003D1B8 0800F4B6 */  j          .L8003D2D8
/* 3DDBC 8003D1BC 24020001 */   addiu     $v0, $zero, 1
.L8003D1C0:
/* 3DDC0 8003D1C0 8E630080 */  lw         $v1, 0x80($s3)
/* 3DDC4 8003D1C4 8C720040 */  lw         $s2, 0x40($v1)
/* 3DDC8 8003D1C8 9642001E */  lhu        $v0, 0x1e($s2)
/* 3DDCC 8003D1CC 8E430018 */  lw         $v1, 0x18($s2)
/* 3DDD0 8003D1D0 00021080 */  sll        $v0, $v0, 2
/* 3DDD4 8003D1D4 00431021 */  addu       $v0, $v0, $v1
/* 3DDD8 8003D1D8 8C440000 */  lw         $a0, ($v0)
/* 3DDDC 8003D1DC 8C830078 */  lw         $v1, 0x78($a0)
/* 3DDE0 8003D1E0 AFA40050 */  sw         $a0, 0x50($sp)
/* 3DDE4 8003D1E4 84650080 */  lh         $a1, 0x80($v1)
/* 3DDE8 8003D1E8 8C620084 */  lw         $v0, 0x84($v1)
/* 3DDEC 8003D1EC 0040F809 */  jalr       $v0
/* 3DDF0 8003D1F0 00852021 */   addu      $a0, $a0, $a1
/* 3DDF4 8003D1F4 00408021 */  addu       $s0, $v0, $zero
/* 3DDF8 8003D1F8 9602005E */  lhu        $v0, 0x5e($s0)
/* 3DDFC 8003D1FC 0051102B */  sltu       $v0, $v0, $s1
/* 3DE00 8003D200 54400001 */  bnel       $v0, $zero, .L8003D208
/* 3DE04 8003D204 A611005E */   sh        $s1, 0x5e($s0)
.L8003D208:
/* 3DE08 8003D208 9602005E */  lhu        $v0, 0x5e($s0)
/* 3DE0C 8003D20C 00511023 */  subu       $v0, $v0, $s1
/* 3DE10 8003D210 A602005E */  sh         $v0, 0x5e($s0)
/* 3DE14 8003D214 3042FFFF */  andi       $v0, $v0, 0xffff
/* 3DE18 8003D218 1040000B */  beqz       $v0, .L8003D248
/* 3DE1C 8003D21C 3C05800E */   lui       $a1, %hi(D_800DC23C)
/* 3DE20 8003D220 27A40010 */  addiu      $a0, $sp, 0x10
/* 3DE24 8003D224 9606005E */  lhu        $a2, 0x5e($s0)
/* 3DE28 8003D228 0C0333AC */  jal        sprintf
/* 3DE2C 8003D22C 24A5C23C */   addiu     $a1, $a1, %lo(D_800DC23C)
/* 3DE30 8003D230 02002021 */  addu       $a0, $s0, $zero
/* 3DE34 8003D234 27A50010 */  addiu      $a1, $sp, 0x10
/* 3DE38 8003D238 0C02EEDD */  jal        utilities_func
/* 3DE3C 8003D23C 24060001 */   addiu     $a2, $zero, 1
/* 3DE40 8003D240 0800F4B6 */  j          .L8003D2D8
/* 3DE44 8003D244 24020001 */   addiu     $v0, $zero, 1
.L8003D248:
/* 3DE48 8003D248 8FA50050 */  lw         $a1, 0x50($sp)
/* 3DE4C 8003D24C 8CA30078 */  lw         $v1, 0x78($a1)
/* 3DE50 8003D250 84640078 */  lh         $a0, 0x78($v1)
/* 3DE54 8003D254 8C62007C */  lw         $v0, 0x7c($v1)
/* 3DE58 8003D258 0040F809 */  jalr       $v0
/* 3DE5C 8003D25C 00A42021 */   addu      $a0, $a1, $a0
/* 3DE60 8003D260 10400004 */  beqz       $v0, .L8003D274
/* 3DE64 8003D264 3C04800E */   lui       $a0, %hi(queueStructA)
/* 3DE68 8003D268 96620098 */  lhu        $v0, 0x98($s3)
/* 3DE6C 8003D26C 2442FFFF */  addiu      $v0, $v0, -1
/* 3DE70 8003D270 A6620098 */  sh         $v0, 0x98($s3)
.L8003D274:
/* 3DE74 8003D274 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 3DE78 8003D278 27A50050 */  addiu      $a1, $sp, 0x50
/* 3DE7C 8003D27C 24060006 */  addiu      $a2, $zero, 6
/* 3DE80 8003D280 0C035867 */  jal        AllocFreeQueueItem
/* 3DE84 8003D284 00003821 */   addu      $a3, $zero, $zero
/* 3DE88 8003D288 96430020 */  lhu        $v1, 0x20($s2)
/* 3DE8C 8003D28C 9645001E */  lhu        $a1, 0x1e($s2)
/* 3DE90 8003D290 2463FFFF */  addiu      $v1, $v1, -1
/* 3DE94 8003D294 00A3102A */  slt        $v0, $a1, $v1
/* 3DE98 8003D298 5040000C */  beql       $v0, $zero, .L8003D2CC
/* 3DE9C 8003D29C 96430020 */   lhu       $v1, 0x20($s2)
/* 3DEA0 8003D2A0 8E470018 */  lw         $a3, 0x18($s2)
/* 3DEA4 8003D2A4 00603021 */  addu       $a2, $v1, $zero
.L8003D2A8:
/* 3DEA8 8003D2A8 00051880 */  sll        $v1, $a1, 2
/* 3DEAC 8003D2AC 00671821 */  addu       $v1, $v1, $a3
/* 3DEB0 8003D2B0 24A20001 */  addiu      $v0, $a1, 1
/* 3DEB4 8003D2B4 3045FFFF */  andi       $a1, $v0, 0xffff
/* 3DEB8 8003D2B8 8C640004 */  lw         $a0, 4($v1)
/* 3DEBC 8003D2BC 00A6102A */  slt        $v0, $a1, $a2
/* 3DEC0 8003D2C0 1440FFF9 */  bnez       $v0, .L8003D2A8
/* 3DEC4 8003D2C4 AC640000 */   sw        $a0, ($v1)
/* 3DEC8 8003D2C8 96430020 */  lhu        $v1, 0x20($s2)
.L8003D2CC:
/* 3DECC 8003D2CC 24020001 */  addiu      $v0, $zero, 1
/* 3DED0 8003D2D0 2463FFFF */  addiu      $v1, $v1, -1
/* 3DED4 8003D2D4 A6430020 */  sh         $v1, 0x20($s2)
.L8003D2D8:
/* 3DED8 8003D2D8 8FBF0068 */  lw         $ra, 0x68($sp)
/* 3DEDC 8003D2DC 8FB30064 */  lw         $s3, 0x64($sp)
/* 3DEE0 8003D2E0 8FB20060 */  lw         $s2, 0x60($sp)
/* 3DEE4 8003D2E4 8FB1005C */  lw         $s1, 0x5c($sp)
/* 3DEE8 8003D2E8 8FB00058 */  lw         $s0, 0x58($sp)
/* 3DEEC 8003D2EC 03E00008 */  jr         $ra
/* 3DEF0 8003D2F0 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_8003D2F4
/* 3DEF4 8003D2F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3DEF8 8003D2F8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3DEFC 8003D2FC 00809821 */  addu       $s3, $a0, $zero
/* 3DF00 8003D300 24040098 */  addiu      $a0, $zero, 0x98
/* 3DF04 8003D304 AFB00010 */  sw         $s0, 0x10($sp)
/* 3DF08 8003D308 00A08021 */  addu       $s0, $a1, $zero
/* 3DF0C 8003D30C AFB10014 */  sw         $s1, 0x14($sp)
/* 3DF10 8003D310 30D100FF */  andi       $s1, $a2, 0xff
/* 3DF14 8003D314 AFB20018 */  sw         $s2, 0x18($sp)
/* 3DF18 8003D318 AFBF0020 */  sw         $ra, 0x20($sp)
/* 3DF1C 8003D31C 0C026259 */  jal        passToMalloc
/* 3DF20 8003D320 30F200FF */   andi      $s2, $a3, 0xff
/* 3DF24 8003D324 00402021 */  addu       $a0, $v0, $zero
/* 3DF28 8003D328 02002821 */  addu       $a1, $s0, $zero
/* 3DF2C 8003D32C 02203021 */  addu       $a2, $s1, $zero
/* 3DF30 8003D330 0C00F858 */  jal        checkpObject
/* 3DF34 8003D334 02403821 */   addu      $a3, $s2, $zero
/* 3DF38 8003D338 8E640080 */  lw         $a0, 0x80($s3)
/* 3DF3C 8003D33C 0C00C040 */  jal        func_80030100
/* 3DF40 8003D340 00402821 */   addu      $a1, $v0, $zero
/* 3DF44 8003D344 240300FF */  addiu      $v1, $zero, 0xff
/* 3DF48 8003D348 12430004 */  beq        $s2, $v1, .L8003D35C
/* 3DF4C 8003D34C 8FBF0020 */   lw        $ra, 0x20($sp)
/* 3DF50 8003D350 96620098 */  lhu        $v0, 0x98($s3)
/* 3DF54 8003D354 24420001 */  addiu      $v0, $v0, 1
/* 3DF58 8003D358 A6620098 */  sh         $v0, 0x98($s3)
.L8003D35C:
/* 3DF5C 8003D35C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3DF60 8003D360 8FB20018 */  lw         $s2, 0x18($sp)
/* 3DF64 8003D364 8FB10014 */  lw         $s1, 0x14($sp)
/* 3DF68 8003D368 8FB00010 */  lw         $s0, 0x10($sp)
/* 3DF6C 8003D36C 24020001 */  addiu      $v0, $zero, 1
/* 3DF70 8003D370 03E00008 */  jr         $ra
/* 3DF74 8003D374 27BD0028 */   addiu     $sp, $sp, 0x28

glabel SMI_AddItem
/* 3DF78 8003D378 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 3DF7C 8003D37C AFB70074 */  sw         $s7, 0x74($sp)
/* 3DF80 8003D380 0080B821 */  addu       $s7, $a0, $zero
/* 3DF84 8003D384 AFB5006C */  sw         $s5, 0x6c($sp)
/* 3DF88 8003D388 30B5FFFF */  andi       $s5, $a1, 0xffff
/* 3DF8C 8003D38C AFBE0078 */  sw         $fp, 0x78($sp)
/* 3DF90 8003D390 30DE00FF */  andi       $fp, $a2, 0xff
/* 3DF94 8003D394 AFB60070 */  sw         $s6, 0x70($sp)
/* 3DF98 8003D398 30F600FF */  andi       $s6, $a3, 0xff
/* 3DF9C 8003D39C 240300FF */  addiu      $v1, $zero, 0xff
/* 3DFA0 8003D3A0 AFBF007C */  sw         $ra, 0x7c($sp)
/* 3DFA4 8003D3A4 AFB40068 */  sw         $s4, 0x68($sp)
/* 3DFA8 8003D3A8 AFB30064 */  sw         $s3, 0x64($sp)
/* 3DFAC 8003D3AC AFB20060 */  sw         $s2, 0x60($sp)
/* 3DFB0 8003D3B0 AFB1005C */  sw         $s1, 0x5c($sp)
/* 3DFB4 8003D3B4 AFB00058 */  sw         $s0, 0x58($sp)
/* 3DFB8 8003D3B8 8EE20080 */  lw         $v0, 0x80($s7)
/* 3DFBC 8003D3BC 97B10096 */  lhu        $s1, 0x96($sp)
/* 3DFC0 8003D3C0 16C3005D */  bne        $s6, $v1, .L8003D538
/* 3DFC4 8003D3C4 8C520040 */   lw        $s2, 0x40($v0)
/* 3DFC8 8003D3C8 8EE60090 */  lw         $a2, 0x90($s7)
/* 3DFCC 8003D3CC 8CC30000 */  lw         $v1, ($a2)
/* 3DFD0 8003D3D0 02A02821 */  addu       $a1, $s5, $zero
/* 3DFD4 8003D3D4 84640050 */  lh         $a0, 0x50($v1)
/* 3DFD8 8003D3D8 8C620054 */  lw         $v0, 0x54($v1)
/* 3DFDC 8003D3DC 0040F809 */  jalr       $v0
/* 3DFE0 8003D3E0 00C42021 */   addu      $a0, $a2, $a0
/* 3DFE4 8003D3E4 00408021 */  addu       $s0, $v0, $zero
/* 3DFE8 8003D3E8 2402FFFF */  addiu      $v0, $zero, -1
/* 3DFEC 8003D3EC 56020008 */  bnel       $s0, $v0, .L8003D410
/* 3DFF0 8003D3F0 8EE60090 */   lw        $a2, 0x90($s7)
/* 3DFF4 8003D3F4 3C04800E */  lui        $a0, %hi(D_800DC240)
/* 3DFF8 8003D3F8 2484C240 */  addiu      $a0, $a0, %lo(D_800DC240)
/* 3DFFC 8003D3FC 3C05800E */  lui        $a1, %hi(D_800DC250)
/* 3E000 8003D400 0C025F2D */  jal        manualCrash
/* 3E004 8003D404 24A5C250 */   addiu     $a1, $a1, %lo(D_800DC250)
/* 3E008 8003D408 0800F56B */  j          .L8003D5AC
/* 3E00C 8003D40C 00001021 */   addu      $v0, $zero, $zero
.L8003D410:
/* 3E010 8003D410 8CC30000 */  lw         $v1, ($a2)
/* 3E014 8003D414 02002821 */  addu       $a1, $s0, $zero
/* 3E018 8003D418 84640058 */  lh         $a0, 0x58($v1)
/* 3E01C 8003D41C 8C62005C */  lw         $v0, 0x5c($v1)
/* 3E020 8003D420 0040F809 */  jalr       $v0
/* 3E024 8003D424 00C42021 */   addu      $a0, $a2, $a0
/* 3E028 8003D428 0040A021 */  addu       $s4, $v0, $zero
/* 3E02C 8003D42C 56800007 */  bnel       $s4, $zero, .L8003D44C
/* 3E030 8003D430 8EE60090 */   lw        $a2, 0x90($s7)
/* 3E034 8003D434 3C04800E */  lui        $a0, %hi(D_800DC240)
/* 3E038 8003D438 2484C240 */  addiu      $a0, $a0, %lo(D_800DC240)
/* 3E03C 8003D43C 3C05800E */  lui        $a1, %hi(D_800DC270)
/* 3E040 8003D440 0C025F2D */  jal        manualCrash
/* 3E044 8003D444 24A5C270 */   addiu     $a1, $a1, %lo(D_800DC270)
/* 3E048 8003D448 8EE60090 */  lw         $a2, 0x90($s7)
.L8003D44C:
/* 3E04C 8003D44C 8CC30000 */  lw         $v1, ($a2)
/* 3E050 8003D450 02002821 */  addu       $a1, $s0, $zero
/* 3E054 8003D454 84640068 */  lh         $a0, 0x68($v1)
/* 3E058 8003D458 8C62006C */  lw         $v0, 0x6c($v1)
/* 3E05C 8003D45C 0040F809 */  jalr       $v0
/* 3E060 8003D460 00C42021 */   addu      $a0, $a2, $a0
/* 3E064 8003D464 00409821 */  addu       $s3, $v0, $zero
/* 3E068 8003D468 2E620002 */  sltiu      $v0, $s3, 2
/* 3E06C 8003D46C 5440004A */  bnel       $v0, $zero, .L8003D598
/* 3E070 8003D470 02E02021 */   addu      $a0, $s7, $zero
/* 3E074 8003D474 96420020 */  lhu        $v0, 0x20($s2)
/* 3E078 8003D478 14400008 */  bnez       $v0, .L8003D49C
/* 3E07C 8003D47C 2450FFFF */   addiu     $s0, $v0, -1
/* 3E080 8003D480 3C04800E */  lui        $a0, %hi(D_800DC240)
/* 3E084 8003D484 2484C240 */  addiu      $a0, $a0, %lo(D_800DC240)
/* 3E088 8003D488 3C05800E */  lui        $a1, %hi(D_800DC280)
/* 3E08C 8003D48C 0C025F2D */  jal        manualCrash
/* 3E090 8003D490 24A5C280 */   addiu     $a1, $a1, %lo(D_800DC280)
/* 3E094 8003D494 96420020 */  lhu        $v0, 0x20($s2)
/* 3E098 8003D498 2450FFFF */  addiu      $s0, $v0, -1
.L8003D49C:
/* 3E09C 8003D49C 0602003E */  bltzl      $s0, .L8003D598
/* 3E0A0 8003D4A0 02E02021 */   addu      $a0, $s7, $zero
/* 3E0A4 8003D4A4 8E420018 */  lw         $v0, 0x18($s2)
.L8003D4A8:
/* 3E0A8 8003D4A8 00108880 */  sll        $s1, $s0, 2
/* 3E0AC 8003D4AC 02221021 */  addu       $v0, $s1, $v0
/* 3E0B0 8003D4B0 8C450000 */  lw         $a1, ($v0)
/* 3E0B4 8003D4B4 8CA30078 */  lw         $v1, 0x78($a1)
/* 3E0B8 8003D4B8 84640088 */  lh         $a0, 0x88($v1)
/* 3E0BC 8003D4BC 8C62008C */  lw         $v0, 0x8c($v1)
/* 3E0C0 8003D4C0 0040F809 */  jalr       $v0
/* 3E0C4 8003D4C4 00A42021 */   addu      $a0, $a1, $a0
/* 3E0C8 8003D4C8 94430000 */  lhu        $v1, ($v0)
/* 3E0CC 8003D4CC 10750005 */  beq        $v1, $s5, .L8003D4E4
/* 3E0D0 8003D4D0 2610FFFF */   addiu     $s0, $s0, -1
/* 3E0D4 8003D4D4 0603FFF4 */  bgezl      $s0, .L8003D4A8
/* 3E0D8 8003D4D8 8E420018 */   lw        $v0, 0x18($s2)
/* 3E0DC 8003D4DC 0800F566 */  j          .L8003D598
/* 3E0E0 8003D4E0 02E02021 */   addu      $a0, $s7, $zero
.L8003D4E4:
/* 3E0E4 8003D4E4 8E420018 */  lw         $v0, 0x18($s2)
/* 3E0E8 8003D4E8 02221021 */  addu       $v0, $s1, $v0
/* 3E0EC 8003D4EC 8C450000 */  lw         $a1, ($v0)
/* 3E0F0 8003D4F0 8CA30078 */  lw         $v1, 0x78($a1)
/* 3E0F4 8003D4F4 84640080 */  lh         $a0, 0x80($v1)
/* 3E0F8 8003D4F8 8C620084 */  lw         $v0, 0x84($v1)
/* 3E0FC 8003D4FC 0040F809 */  jalr       $v0
/* 3E100 8003D500 00A42021 */   addu      $a0, $a1, $a0
/* 3E104 8003D504 27A40018 */  addiu      $a0, $sp, 0x18
/* 3E108 8003D508 3C05800E */  lui        $a1, %hi(D_800DC2A8)
/* 3E10C 8003D50C 24A5C2A8 */  addiu      $a1, $a1, %lo(D_800DC2A8)
/* 3E110 8003D510 02603021 */  addu       $a2, $s3, $zero
/* 3E114 8003D514 0C0333AC */  jal        sprintf
/* 3E118 8003D518 00408021 */   addu      $s0, $v0, $zero
/* 3E11C 8003D51C 02002021 */  addu       $a0, $s0, $zero
/* 3E120 8003D520 27A50018 */  addiu      $a1, $sp, 0x18
/* 3E124 8003D524 0C02EEDD */  jal        utilities_func
/* 3E128 8003D528 24060001 */   addiu     $a2, $zero, 1
/* 3E12C 8003D52C 24020001 */  addiu      $v0, $zero, 1
/* 3E130 8003D530 0800F56B */  j          .L8003D5AC
/* 3E134 8003D534 A613005E */   sh        $s3, 0x5e($s0)
.L8003D538:
/* 3E138 8003D538 3C10800E */  lui        $s0, %hi(gGlobals)
/* 3E13C 8003D53C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 3E140 8003D540 8E0215F8 */  lw         $v0, 0x15f8($s0)
/* 3E144 8003D544 00161880 */  sll        $v1, $s6, 2
/* 3E148 8003D548 00431021 */  addu       $v0, $v0, $v1
/* 3E14C 8003D54C 8C440000 */  lw         $a0, ($v0)
/* 3E150 8003D550 0C01ED0F */  jal        Has_Item_equipped_character
/* 3E154 8003D554 02A02821 */   addu      $a1, $s5, $zero
/* 3E158 8003D558 0040A021 */  addu       $s4, $v0, $zero
/* 3E15C 8003D55C 26102078 */  addiu      $s0, $s0, 0x2078
/* 3E160 8003D560 02002021 */  addu       $a0, $s0, $zero
/* 3E164 8003D564 3C05800E */  lui        $a1, %hi(D_800DC2AC)
/* 3E168 8003D568 24A5C2AC */  addiu      $a1, $a1, %lo(D_800DC2AC)
/* 3E16C 8003D56C 8FA70090 */  lw         $a3, 0x90($sp)
/* 3E170 8003D570 02A03021 */  addu       $a2, $s5, $zero
/* 3E174 8003D574 0C0333AC */  jal        sprintf
/* 3E178 8003D578 AFB10010 */   sw        $s1, 0x10($sp)
/* 3E17C 8003D57C 16800006 */  bnez       $s4, .L8003D598
/* 3E180 8003D580 02E02021 */   addu      $a0, $s7, $zero
/* 3E184 8003D584 3C04800E */  lui        $a0, %hi(D_800DC240)
/* 3E188 8003D588 2484C240 */  addiu      $a0, $a0, %lo(D_800DC240)
/* 3E18C 8003D58C 0C025F2D */  jal        manualCrash
/* 3E190 8003D590 02002821 */   addu      $a1, $s0, $zero
/* 3E194 8003D594 02E02021 */  addu       $a0, $s7, $zero
.L8003D598:
/* 3E198 8003D598 02802821 */  addu       $a1, $s4, $zero
/* 3E19C 8003D59C 03C03021 */  addu       $a2, $fp, $zero
/* 3E1A0 8003D5A0 0C00F4BD */  jal        func_8003D2F4
/* 3E1A4 8003D5A4 02C03821 */   addu      $a3, $s6, $zero
/* 3E1A8 8003D5A8 24020001 */  addiu      $v0, $zero, 1
.L8003D5AC:
/* 3E1AC 8003D5AC 8FBF007C */  lw         $ra, 0x7c($sp)
/* 3E1B0 8003D5B0 8FBE0078 */  lw         $fp, 0x78($sp)
/* 3E1B4 8003D5B4 8FB70074 */  lw         $s7, 0x74($sp)
/* 3E1B8 8003D5B8 8FB60070 */  lw         $s6, 0x70($sp)
/* 3E1BC 8003D5BC 8FB5006C */  lw         $s5, 0x6c($sp)
/* 3E1C0 8003D5C0 8FB40068 */  lw         $s4, 0x68($sp)
/* 3E1C4 8003D5C4 8FB30064 */  lw         $s3, 0x64($sp)
/* 3E1C8 8003D5C8 8FB20060 */  lw         $s2, 0x60($sp)
/* 3E1CC 8003D5CC 8FB1005C */  lw         $s1, 0x5c($sp)
/* 3E1D0 8003D5D0 8FB00058 */  lw         $s0, 0x58($sp)
/* 3E1D4 8003D5D4 03E00008 */  jr         $ra
/* 3E1D8 8003D5D8 27BD0080 */   addiu     $sp, $sp, 0x80

glabel quicksort_call_1
/* 3E1DC 8003D5DC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3E1E0 8003D5E0 AFB00010 */  sw         $s0, 0x10($sp)
/* 3E1E4 8003D5E4 00808021 */  addu       $s0, $a0, $zero
/* 3E1E8 8003D5E8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3E1EC 8003D5EC 96020098 */  lhu        $v0, 0x98($s0)
/* 3E1F0 8003D5F0 1040000F */  beqz       $v0, .L8003D630
/* 3E1F4 8003D5F4 3C078004 */   lui       $a3, 0x8004
/* 3E1F8 8003D5F8 8E020080 */  lw         $v0, 0x80($s0)
/* 3E1FC 8003D5FC 24060004 */  addiu      $a2, $zero, 4
/* 3E200 8003D600 8C430040 */  lw         $v1, 0x40($v0)
/* 3E204 8003D604 96050098 */  lhu        $a1, 0x98($s0)
/* 3E208 8003D608 8C640018 */  lw         $a0, 0x18($v1)
/* 3E20C 8003D60C 0C02F6A5 */  jal        quicksort_func
/* 3E210 8003D610 24E7C69C */   addiu     $a3, $a3, -0x3964
/* 3E214 8003D614 8E030078 */  lw         $v1, 0x78($s0)
/* 3E218 8003D618 84640028 */  lh         $a0, 0x28($v1)
/* 3E21C 8003D61C 8C62002C */  lw         $v0, 0x2c($v1)
/* 3E220 8003D620 0040F809 */  jalr       $v0
/* 3E224 8003D624 02042021 */   addu      $a0, $s0, $a0
/* 3E228 8003D628 0C00BFCC */  jal        func_8002FF30
/* 3E22C 8003D62C 8E040080 */   lw        $a0, 0x80($s0)
.L8003D630:
/* 3E230 8003D630 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3E234 8003D634 8FB00010 */  lw         $s0, 0x10($sp)
/* 3E238 8003D638 03E00008 */  jr         $ra
/* 3E23C 8003D63C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003D640
/* 3E240 8003D640 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3E244 8003D644 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3E248 8003D648 8C820080 */  lw         $v0, 0x80($a0)
/* 3E24C 8003D64C 3C078004 */  lui        $a3, 0x8004
/* 3E250 8003D650 8C430040 */  lw         $v1, 0x40($v0)
/* 3E254 8003D654 24060004 */  addiu      $a2, $zero, 4
/* 3E258 8003D658 8C640018 */  lw         $a0, 0x18($v1)
/* 3E25C 8003D65C 94650020 */  lhu        $a1, 0x20($v1)
/* 3E260 8003D660 0C02F6A5 */  jal        quicksort_func
/* 3E264 8003D664 24E7C78C */   addiu     $a3, $a3, -0x3874
/* 3E268 8003D668 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3E26C 8003D66C 03E00008 */  jr         $ra
/* 3E270 8003D670 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003D674
/* 3E274 8003D674 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 3E278 8003D678 AFB40020 */  sw         $s4, 0x20($sp)
/* 3E27C 8003D67C 0080A021 */  addu       $s4, $a0, $zero
/* 3E280 8003D680 AFB3001C */  sw         $s3, 0x1c($sp)
/* 3E284 8003D684 30B3FFFF */  andi       $s3, $a1, 0xffff
/* 3E288 8003D688 30C600FF */  andi       $a2, $a2, 0xff
/* 3E28C 8003D68C AFBF0028 */  sw         $ra, 0x28($sp)
/* 3E290 8003D690 AFB50024 */  sw         $s5, 0x24($sp)
/* 3E294 8003D694 AFB20018 */  sw         $s2, 0x18($sp)
/* 3E298 8003D698 AFB10014 */  sw         $s1, 0x14($sp)
/* 3E29C 8003D69C AFB00010 */  sw         $s0, 0x10($sp)
/* 3E2A0 8003D6A0 8E820080 */  lw         $v0, 0x80($s4)
/* 3E2A4 8003D6A4 240300FF */  addiu      $v1, $zero, 0xff
/* 3E2A8 8003D6A8 14C30018 */  bne        $a2, $v1, .L8003D70C
/* 3E2AC 8003D6AC 8C520040 */   lw        $s2, 0x40($v0)
/* 3E2B0 8003D6B0 96850098 */  lhu        $a1, 0x98($s4)
/* 3E2B4 8003D6B4 96430020 */  lhu        $v1, 0x20($s2)
/* 3E2B8 8003D6B8 00A3102B */  sltu       $v0, $a1, $v1
/* 3E2BC 8003D6BC 1040002B */  beqz       $v0, .L8003D76C
/* 3E2C0 8003D6C0 00603021 */   addu      $a2, $v1, $zero
/* 3E2C4 8003D6C4 8E470018 */  lw         $a3, 0x18($s2)
/* 3E2C8 8003D6C8 00051080 */  sll        $v0, $a1, 2
.L8003D6CC:
/* 3E2CC 8003D6CC 00471021 */  addu       $v0, $v0, $a3
/* 3E2D0 8003D6D0 8C430000 */  lw         $v1, ($v0)
/* 3E2D4 8003D6D4 9464005E */  lhu        $a0, 0x5e($v1)
/* 3E2D8 8003D6D8 10930007 */  beq        $a0, $s3, .L8003D6F8
/* 3E2DC 8003D6DC 24A20001 */   addiu     $v0, $a1, 1
/* 3E2E0 8003D6E0 3045FFFF */  andi       $a1, $v0, 0xffff
/* 3E2E4 8003D6E4 00A6182B */  sltu       $v1, $a1, $a2
/* 3E2E8 8003D6E8 1460FFF8 */  bnez       $v1, .L8003D6CC
/* 3E2EC 8003D6EC 00051080 */   sll       $v0, $a1, 2
/* 3E2F0 8003D6F0 0800F5DC */  j          .L8003D770
/* 3E2F4 8003D6F4 00001021 */   addu      $v0, $zero, $zero
.L8003D6F8:
/* 3E2F8 8003D6F8 A645001E */  sh         $a1, 0x1e($s2)
/* 3E2FC 8003D6FC 0800F5DC */  j          .L8003D770
/* 3E300 8003D700 24020001 */   addiu     $v0, $zero, 1
.L8003D704:
/* 3E304 8003D704 0800F5DC */  j          .L8003D770
/* 3E308 8003D708 24020001 */   addiu     $v0, $zero, 1
.L8003D70C:
/* 3E30C 8003D70C 96820098 */  lhu        $v0, 0x98($s4)
/* 3E310 8003D710 10400016 */  beqz       $v0, .L8003D76C
/* 3E314 8003D714 00008821 */   addu      $s1, $zero, $zero
/* 3E318 8003D718 30D5FFFF */  andi       $s5, $a2, 0xffff
/* 3E31C 8003D71C 8E430018 */  lw         $v1, 0x18($s2)
.L8003D720:
/* 3E320 8003D720 00111080 */  sll        $v0, $s1, 2
/* 3E324 8003D724 00431021 */  addu       $v0, $v0, $v1
/* 3E328 8003D728 8C500000 */  lw         $s0, ($v0)
/* 3E32C 8003D72C 8E030078 */  lw         $v1, 0x78($s0)
/* 3E330 8003D730 84640080 */  lh         $a0, 0x80($v1)
/* 3E334 8003D734 8C620084 */  lw         $v0, 0x84($v1)
/* 3E338 8003D738 0040F809 */  jalr       $v0
/* 3E33C 8003D73C 02042021 */   addu      $a0, $s0, $a0
/* 3E340 8003D740 9443005E */  lhu        $v1, 0x5e($v0)
/* 3E344 8003D744 14750004 */  bne        $v1, $s5, .L8003D758
/* 3E348 8003D748 26230001 */   addiu     $v1, $s1, 1
/* 3E34C 8003D74C 9602005E */  lhu        $v0, 0x5e($s0)
/* 3E350 8003D750 5053FFEC */  beql       $v0, $s3, .L8003D704
/* 3E354 8003D754 A651001E */   sh        $s1, 0x1e($s2)
.L8003D758:
/* 3E358 8003D758 96820098 */  lhu        $v0, 0x98($s4)
/* 3E35C 8003D75C 3071FFFF */  andi       $s1, $v1, 0xffff
/* 3E360 8003D760 0222102B */  sltu       $v0, $s1, $v0
/* 3E364 8003D764 5440FFEE */  bnel       $v0, $zero, .L8003D720
/* 3E368 8003D768 8E430018 */   lw        $v1, 0x18($s2)
.L8003D76C:
/* 3E36C 8003D76C 00001021 */  addu       $v0, $zero, $zero
.L8003D770:
/* 3E370 8003D770 8FBF0028 */  lw         $ra, 0x28($sp)
/* 3E374 8003D774 8FB50024 */  lw         $s5, 0x24($sp)
/* 3E378 8003D778 8FB40020 */  lw         $s4, 0x20($sp)
/* 3E37C 8003D77C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3E380 8003D780 8FB20018 */  lw         $s2, 0x18($sp)
/* 3E384 8003D784 8FB10014 */  lw         $s1, 0x14($sp)
/* 3E388 8003D788 8FB00010 */  lw         $s0, 0x10($sp)
/* 3E38C 8003D78C 03E00008 */  jr         $ra
/* 3E390 8003D790 27BD0030 */   addiu     $sp, $sp, 0x30

glabel ret12_8003d794
/* 3E394 8003D794 03E00008 */  jr         $ra
/* 3E398 8003D798 2402000C */   addiu     $v0, $zero, 0xc
/* 3E39C 8003D79C 00000000 */  nop
