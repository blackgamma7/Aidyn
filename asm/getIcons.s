.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8004C4D0
/* 4D0D0 8004C4D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4D0D4 8004C4D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4D0D8 8004C4D8 00808021 */  addu       $s0, $a0, $zero
/* 4D0DC 8004C4DC 3C02800F */  lui        $v0, %hi(textbox_alpha)
/* 4D0E0 8004C4E0 9044D650 */  lbu        $a0, %lo(textbox_alpha)($v0)
/* 4D0E4 8004C4E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 4D0E8 8004C4E8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4D0EC 8004C4EC 9203005B */  lbu        $v1, 0x5b($s0)
/* 4D0F0 8004C4F0 2482FFA6 */  addiu      $v0, $a0, -0x5a
/* 4D0F4 8004C4F4 0062102A */  slt        $v0, $v1, $v0
/* 4D0F8 8004C4F8 10400004 */  beqz       $v0, .L8004C50C
/* 4D0FC 8004C4FC 00008821 */   addu      $s1, $zero, $zero
/* 4D100 8004C500 2462005A */  addiu      $v0, $v1, 0x5a
/* 4D104 8004C504 08013145 */  j          .L8004C514
/* 4D108 8004C508 A202005B */   sb        $v0, 0x5b($s0)
.L8004C50C:
/* 4D10C 8004C50C A204005B */  sb         $a0, 0x5b($s0)
/* 4D110 8004C510 24110001 */  addiu      $s1, $zero, 1
.L8004C514:
/* 4D114 8004C514 9205005B */  lbu        $a1, 0x5b($s0)
/* 4D118 8004C518 0C02F216 */  jal        widget_fade
/* 4D11C 8004C51C 02002021 */   addu      $a0, $s0, $zero
/* 4D120 8004C520 12200002 */  beqz       $s1, .L8004C52C
/* 4D124 8004C524 24020002 */   addiu     $v0, $zero, 2
/* 4D128 8004C528 A2020070 */  sb         $v0, 0x70($s0)
.L8004C52C:
/* 4D12C 8004C52C 92020070 */  lbu        $v0, 0x70($s0)
/* 4D130 8004C530 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4D134 8004C534 8FB10014 */  lw         $s1, 0x14($sp)
/* 4D138 8004C538 8FB00010 */  lw         $s0, 0x10($sp)
/* 4D13C 8004C53C 03E00008 */  jr         $ra
/* 4D140 8004C540 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004C544
/* 4D144 8004C544 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4D148 8004C548 AFB00010 */  sw         $s0, 0x10($sp)
/* 4D14C 8004C54C 00808021 */  addu       $s0, $a0, $zero
/* 4D150 8004C550 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4D154 8004C554 AFB10014 */  sw         $s1, 0x14($sp)
/* 4D158 8004C558 9203005B */  lbu        $v1, 0x5b($s0)
/* 4D15C 8004C55C 2C62005B */  sltiu      $v0, $v1, 0x5b
/* 4D160 8004C560 14400004 */  bnez       $v0, .L8004C574
/* 4D164 8004C564 00008821 */   addu      $s1, $zero, $zero
/* 4D168 8004C568 2462FFA6 */  addiu      $v0, $v1, -0x5a
/* 4D16C 8004C56C 0801315F */  j          .L8004C57C
/* 4D170 8004C570 A202005B */   sb        $v0, 0x5b($s0)
.L8004C574:
/* 4D174 8004C574 A200005B */  sb         $zero, 0x5b($s0)
/* 4D178 8004C578 24110001 */  addiu      $s1, $zero, 1
.L8004C57C:
/* 4D17C 8004C57C 9205005B */  lbu        $a1, 0x5b($s0)
/* 4D180 8004C580 0C02F216 */  jal        widget_fade
/* 4D184 8004C584 02002021 */   addu      $a0, $s0, $zero
/* 4D188 8004C588 12200002 */  beqz       $s1, .L8004C594
/* 4D18C 8004C58C 24020006 */   addiu     $v0, $zero, 6
/* 4D190 8004C590 A2020070 */  sb         $v0, 0x70($s0)
.L8004C594:
/* 4D194 8004C594 92020070 */  lbu        $v0, 0x70($s0)
/* 4D198 8004C598 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4D19C 8004C59C 8FB10014 */  lw         $s1, 0x14($sp)
/* 4D1A0 8004C5A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 4D1A4 8004C5A4 03E00008 */  jr         $ra
/* 4D1A8 8004C5A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004C5AC
/* 4D1AC 8004C5AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4D1B0 8004C5B0 00A02021 */  addu       $a0, $a1, $zero
/* 4D1B4 8004C5B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4D1B8 8004C5B8 0C02DEC8 */  jal        set_widgets_byte0x70
/* 4D1BC 8004C5BC 24050005 */   addiu     $a1, $zero, 5
/* 4D1C0 8004C5C0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4D1C4 8004C5C4 00001021 */  addu       $v0, $zero, $zero
/* 4D1C8 8004C5C8 03E00008 */  jr         $ra
/* 4D1CC 8004C5CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel another_textbox_func
/* 4D1D0 8004C5D0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 4D1D4 8004C5D4 AFA40050 */  sw         $a0, 0x50($sp)
/* 4D1D8 8004C5D8 2404007C */  addiu      $a0, $zero, 0x7c
/* 4D1DC 8004C5DC AFB20030 */  sw         $s2, 0x30($sp)
/* 4D1E0 8004C5E0 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 4D1E4 8004C5E4 AFB30034 */  sw         $s3, 0x34($sp)
/* 4D1E8 8004C5E8 30D3FFFF */  andi       $s3, $a2, 0xffff
/* 4D1EC 8004C5EC 30E700FF */  andi       $a3, $a3, 0xff
/* 4D1F0 8004C5F0 AFB1002C */  sw         $s1, 0x2c($sp)
/* 4D1F4 8004C5F4 24110140 */  addiu      $s1, $zero, 0x140
/* 4D1F8 8004C5F8 02328823 */  subu       $s1, $s1, $s2
/* 4D1FC 8004C5FC 001117C2 */  srl        $v0, $s1, 0x1f
/* 4D200 8004C600 02228821 */  addu       $s1, $s1, $v0
/* 4D204 8004C604 00118843 */  sra        $s1, $s1, 1
/* 4D208 8004C608 3231FFFF */  andi       $s1, $s1, 0xffff
/* 4D20C 8004C60C AFB00028 */  sw         $s0, 0x28($sp)
/* 4D210 8004C610 241000F0 */  addiu      $s0, $zero, 0xf0
/* 4D214 8004C614 02138023 */  subu       $s0, $s0, $s3
/* 4D218 8004C618 AFB60040 */  sw         $s6, 0x40($sp)
/* 4D21C 8004C61C 93B60063 */  lbu        $s6, 0x63($sp)
/* 4D220 8004C620 001017C2 */  srl        $v0, $s0, 0x1f
/* 4D224 8004C624 AFB70044 */  sw         $s7, 0x44($sp)
/* 4D228 8004C628 93B70067 */  lbu        $s7, 0x67($sp)
/* 4D22C 8004C62C 02028021 */  addu       $s0, $s0, $v0
/* 4D230 8004C630 AFB5003C */  sw         $s5, 0x3c($sp)
/* 4D234 8004C634 93B5006B */  lbu        $s5, 0x6b($sp)
/* 4D238 8004C638 00108043 */  sra        $s0, $s0, 1
/* 4D23C 8004C63C AFB40038 */  sw         $s4, 0x38($sp)
/* 4D240 8004C640 93B4007B */  lbu        $s4, 0x7b($sp)
/* 4D244 8004C644 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4D248 8004C648 AFBF004C */  sw         $ra, 0x4c($sp)
/* 4D24C 8004C64C AFBE0048 */  sw         $fp, 0x48($sp)
/* 4D250 8004C650 0C026259 */  jal        passToMalloc
/* 4D254 8004C654 AFA70020 */   sw        $a3, 0x20($sp)
/* 4D258 8004C658 0C02E658 */  jal        widget_menu_build
/* 4D25C 8004C65C 00402021 */   addu      $a0, $v0, $zero
/* 4D260 8004C660 00112400 */  sll        $a0, $s1, 0x10
/* 4D264 8004C664 00042403 */  sra        $a0, $a0, 0x10
/* 4D268 8004C668 00102C00 */  sll        $a1, $s0, 0x10
/* 4D26C 8004C66C 00052C03 */  sra        $a1, $a1, 0x10
/* 4D270 8004C670 02323021 */  addu       $a2, $s1, $s2
/* 4D274 8004C674 24C60008 */  addiu      $a2, $a2, 8
/* 4D278 8004C678 00063400 */  sll        $a2, $a2, 0x10
/* 4D27C 8004C67C 00063403 */  sra        $a2, $a2, 0x10
/* 4D280 8004C680 02133821 */  addu       $a3, $s0, $s3
/* 4D284 8004C684 00073C00 */  sll        $a3, $a3, 0x10
/* 4D288 8004C688 00073C03 */  sra        $a3, $a3, 0x10
/* 4D28C 8004C68C 0040F021 */  addu       $fp, $v0, $zero
/* 4D290 8004C690 3C028005 */  lui        $v0, %hi(func_8004C4D0)
/* 4D294 8004C694 2442C4D0 */  addiu      $v0, $v0, %lo(func_8004C4D0)
/* 4D298 8004C698 3C038005 */  lui        $v1, %hi(func_8004C544)
/* 4D29C 8004C69C 2463C544 */  addiu      $v1, $v1, %lo(func_8004C544)
/* 4D2A0 8004C6A0 AFC20000 */  sw         $v0, ($fp)
/* 4D2A4 8004C6A4 3C02800F */  lui        $v0, %hi(D_800ED651)
/* 4D2A8 8004C6A8 AFC30004 */  sw         $v1, 4($fp)
/* 4D2AC 8004C6AC 0C0129D4 */  jal        func_8004A750
/* 4D2B0 8004C6B0 A054D651 */   sb        $s4, %lo(D_800ED651)($v0)
/* 4D2B4 8004C6B4 8FC30078 */  lw         $v1, 0x78($fp)
/* 4D2B8 8004C6B8 00402821 */  addu       $a1, $v0, $zero
/* 4D2BC 8004C6BC 84640030 */  lh         $a0, 0x30($v1)
/* 4D2C0 8004C6C0 8C620034 */  lw         $v0, 0x34($v1)
/* 4D2C4 8004C6C4 0040F809 */  jalr       $v0
/* 4D2C8 8004C6C8 03C42021 */   addu      $a0, $fp, $a0
/* 4D2CC 8004C6CC 03C02021 */  addu       $a0, $fp, $zero
/* 4D2D0 8004C6D0 26310004 */  addiu      $s1, $s1, 4
/* 4D2D4 8004C6D4 3226FFFF */  andi       $a2, $s1, 0xffff
/* 4D2D8 8004C6D8 26100004 */  addiu      $s0, $s0, 4
/* 4D2DC 8004C6DC 8FA50050 */  lw         $a1, 0x50($sp)
/* 4D2E0 8004C6E0 3C02800F */  lui        $v0, %hi(textbox_alpha)
/* 4D2E4 8004C6E4 A055D650 */  sb         $s5, %lo(textbox_alpha)($v0)
/* 4D2E8 8004C6E8 8FA20020 */  lw         $v0, 0x20($sp)
/* 4D2EC 8004C6EC 3207FFFF */  andi       $a3, $s0, 0xffff
/* 4D2F0 8004C6F0 AFB60014 */  sw         $s6, 0x14($sp)
/* 4D2F4 8004C6F4 AFB70018 */  sw         $s7, 0x18($sp)
/* 4D2F8 8004C6F8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 4D2FC 8004C6FC 0C02F2BE */  jal        some_textbox_func_800bcaf8
/* 4D300 8004C700 AFA20010 */   sw        $v0, 0x10($sp)
/* 4D304 8004C704 03C02021 */  addu       $a0, $fp, $zero
/* 4D308 8004C708 00002821 */  addu       $a1, $zero, $zero
/* 4D30C 8004C70C 02519021 */  addu       $s2, $s2, $s1
/* 4D310 8004C710 02709821 */  addu       $s3, $s3, $s0
/* 4D314 8004C714 A4520066 */  sh         $s2, 0x66($v0)
/* 4D318 8004C718 A453006A */  sh         $s3, 0x6a($v0)
/* 4D31C 8004C71C 3C028005 */  lui        $v0, %hi(func_8004C5AC)
/* 4D320 8004C720 2442C5AC */  addiu      $v0, $v0, %lo(func_8004C5AC)
/* 4D324 8004C724 AFC2001C */  sw         $v0, 0x1c($fp)
/* 4D328 8004C728 AFC20018 */  sw         $v0, 0x18($fp)
/* 4D32C 8004C72C AFC20034 */  sw         $v0, 0x34($fp)
/* 4D330 8004C730 0C02F216 */  jal        widget_fade
/* 4D334 8004C734 AFC20030 */   sw        $v0, 0x30($fp)
/* 4D338 8004C738 8FA2007C */  lw         $v0, 0x7c($sp)
/* 4D33C 8004C73C 10400004 */  beqz       $v0, .L8004C750
/* 4D340 8004C740 3C02800E */   lui       $v0, %hi(widget_handler_pointer)
/* 4D344 8004C744 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 4D348 8004C748 0C02DC7C */  jal        widgetHandler
/* 4D34C 8004C74C 03C02821 */   addu      $a1, $fp, $zero
.L8004C750:
/* 4D350 8004C750 03C01021 */  addu       $v0, $fp, $zero
/* 4D354 8004C754 8FBF004C */  lw         $ra, 0x4c($sp)
/* 4D358 8004C758 8FBE0048 */  lw         $fp, 0x48($sp)
/* 4D35C 8004C75C 8FB70044 */  lw         $s7, 0x44($sp)
/* 4D360 8004C760 8FB60040 */  lw         $s6, 0x40($sp)
/* 4D364 8004C764 8FB5003C */  lw         $s5, 0x3c($sp)
/* 4D368 8004C768 8FB40038 */  lw         $s4, 0x38($sp)
/* 4D36C 8004C76C 8FB30034 */  lw         $s3, 0x34($sp)
/* 4D370 8004C770 8FB20030 */  lw         $s2, 0x30($sp)
/* 4D374 8004C774 8FB1002C */  lw         $s1, 0x2c($sp)
/* 4D378 8004C778 8FB00028 */  lw         $s0, 0x28($sp)
/* 4D37C 8004C77C 03E00008 */  jr         $ra
/* 4D380 8004C780 27BD0050 */   addiu     $sp, $sp, 0x50

glabel some_textbox_func
/* 4D384 8004C784 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 4D388 8004C788 AFB00030 */  sw         $s0, 0x30($sp)
/* 4D38C 8004C78C 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 4D390 8004C790 AFB20038 */  sw         $s2, 0x38($sp)
/* 4D394 8004C794 00809021 */  addu       $s2, $a0, $zero
/* 4D398 8004C798 02402821 */  addu       $a1, $s2, $zero
/* 4D39C 8004C79C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4D3A0 8004C7A0 AFB40040 */  sw         $s4, 0x40($sp)
/* 4D3A4 8004C7A4 245468A8 */  addiu      $s4, $v0, %lo(gGlobals)
/* 4D3A8 8004C7A8 AFB10034 */  sw         $s1, 0x34($sp)
/* 4D3AC 8004C7AC 00C08821 */  addu       $s1, $a2, $zero
/* 4D3B0 8004C7B0 AFBF0044 */  sw         $ra, 0x44($sp)
/* 4D3B4 8004C7B4 AFB3003C */  sw         $s3, 0x3c($sp)
/* 4D3B8 8004C7B8 8E841600 */  lw         $a0, 0x1600($s4)
/* 4D3BC 8004C7BC 0C02D443 */  jal        func_800B510C
/* 4D3C0 8004C7C0 00E09821 */   addu      $s3, $a3, $zero
/* 4D3C4 8004C7C4 3043FFFF */  andi       $v1, $v0, 0xffff
/* 4D3C8 8004C7C8 0070102B */  sltu       $v0, $v1, $s0
/* 4D3CC 8004C7CC 54400001 */  bnel       $v0, $zero, .L8004C7D4
/* 4D3D0 8004C7D0 00608021 */   addu      $s0, $v1, $zero
.L8004C7D4:
/* 4D3D4 8004C7D4 02402821 */  addu       $a1, $s2, $zero
/* 4D3D8 8004C7D8 00003021 */  addu       $a2, $zero, $zero
/* 4D3DC 8004C7DC 8E841600 */  lw         $a0, 0x1600($s4)
/* 4D3E0 8004C7E0 0C02D4A4 */  jal        func_800B5290
/* 4D3E4 8004C7E4 02003821 */   addu      $a3, $s0, $zero
/* 4D3E8 8004C7E8 24420005 */  addiu      $v0, $v0, 5
/* 4D3EC 8004C7EC 3046FFFF */  andi       $a2, $v0, 0xffff
/* 4D3F0 8004C7F0 8FA20058 */  lw         $v0, 0x58($sp)
/* 4D3F4 8004C7F4 02402021 */  addu       $a0, $s2, $zero
/* 4D3F8 8004C7F8 AFA2002C */  sw         $v0, 0x2c($sp)
/* 4D3FC 8004C7FC 92270000 */  lbu        $a3, ($s1)
/* 4D400 8004C800 92220001 */  lbu        $v0, 1($s1)
/* 4D404 8004C804 92230002 */  lbu        $v1, 2($s1)
/* 4D408 8004C808 92280003 */  lbu        $t0, 3($s1)
/* 4D40C 8004C80C 92690000 */  lbu        $t1, ($s3)
/* 4D410 8004C810 926A0001 */  lbu        $t2, 1($s3)
/* 4D414 8004C814 926B0002 */  lbu        $t3, 2($s3)
/* 4D418 8004C818 926C0003 */  lbu        $t4, 3($s3)
/* 4D41C 8004C81C 02002821 */  addu       $a1, $s0, $zero
/* 4D420 8004C820 AFA20010 */  sw         $v0, 0x10($sp)
/* 4D424 8004C824 AFA30014 */  sw         $v1, 0x14($sp)
/* 4D428 8004C828 AFA80018 */  sw         $t0, 0x18($sp)
/* 4D42C 8004C82C AFA9001C */  sw         $t1, 0x1c($sp)
/* 4D430 8004C830 AFAA0020 */  sw         $t2, 0x20($sp)
/* 4D434 8004C834 AFAB0024 */  sw         $t3, 0x24($sp)
/* 4D438 8004C838 0C013174 */  jal        another_textbox_func
/* 4D43C 8004C83C AFAC0028 */   sw        $t4, 0x28($sp)
/* 4D440 8004C840 8FBF0044 */  lw         $ra, 0x44($sp)
/* 4D444 8004C844 8FB40040 */  lw         $s4, 0x40($sp)
/* 4D448 8004C848 8FB3003C */  lw         $s3, 0x3c($sp)
/* 4D44C 8004C84C 8FB20038 */  lw         $s2, 0x38($sp)
/* 4D450 8004C850 8FB10034 */  lw         $s1, 0x34($sp)
/* 4D454 8004C854 8FB00030 */  lw         $s0, 0x30($sp)
/* 4D458 8004C858 03E00008 */  jr         $ra
/* 4D45C 8004C85C 27BD0048 */   addiu     $sp, $sp, 0x48

glabel GetItemImage
/* 4D460 8004C860 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 4D464 8004C864 AFB1009C */  sw         $s1, 0x9c($sp)
/* 4D468 8004C868 00A08821 */  addu       $s1, $a1, $zero
/* 4D46C 8004C86C 3086FFFF */  andi       $a2, $a0, 0xffff
/* 4D470 8004C870 00061202 */  srl        $v0, $a2, 8
/* 4D474 8004C874 2444FFFF */  addiu      $a0, $v0, -1
/* 4D478 8004C878 2C830013 */  sltiu      $v1, $a0, 0x13
/* 4D47C 8004C87C AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 4D480 8004C880 1060002A */  beqz       $v1, .L8004C92C
/* 4D484 8004C884 AFB00098 */   sw        $s0, 0x98($sp)
/* 4D488 8004C888 3C02800E */  lui        $v0, %hi(D_800DD908)
/* 4D48C 8004C88C 2442D908 */  addiu      $v0, $v0, %lo(D_800DD908)
/* 4D490 8004C890 00041880 */  sll        $v1, $a0, 2
/* 4D494 8004C894 00621821 */  addu       $v1, $v1, $v0
/* 4D498 8004C898 8C640000 */  lw         $a0, ($v1)
/* 4D49C 8004C89C 00800008 */  jr         $a0
/* 4D4A0 8004C8A0 00000000 */   nop
/* 4D4A4 8004C8A4 08013243 */  j          .L8004C90C
/* 4D4A8 8004C8A8 240235E5 */   addiu     $v0, $zero, 0x35e5
/* 4D4AC 8004C8AC 3C02800F */  lui        $v0, %hi(item_icon_count)
/* 4D4B0 8004C8B0 8C42DAD8 */  lw         $v0, %lo(item_icon_count)($v0)
/* 4D4B4 8004C8B4 1040000C */  beqz       $v0, .L8004C8E8
/* 4D4B8 8004C8B8 00001821 */   addu      $v1, $zero, $zero
/* 4D4BC 8004C8BC 00403821 */  addu       $a3, $v0, $zero
/* 4D4C0 8004C8C0 3C02800F */  lui        $v0, %hi(item_icons)
/* 4D4C4 8004C8C4 2448D660 */  addiu      $t0, $v0, %lo(item_icons)
/* 4D4C8 8004C8C8 01002821 */  addu       $a1, $t0, $zero
.L8004C8CC:
/* 4D4CC 8004C8CC 94A20000 */  lhu        $v0, ($a1)
/* 4D4D0 8004C8D0 10460011 */  beq        $v0, $a2, .L8004C918
/* 4D4D4 8004C8D4 00032080 */   sll       $a0, $v1, 2
/* 4D4D8 8004C8D8 24630001 */  addiu      $v1, $v1, 1
/* 4D4DC 8004C8DC 0067102B */  sltu       $v0, $v1, $a3
/* 4D4E0 8004C8E0 1440FFFA */  bnez       $v0, .L8004C8CC
/* 4D4E4 8004C8E4 24A50004 */   addiu     $a1, $a1, 4
.L8004C8E8:
/* 4D4E8 8004C8E8 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 4D4EC 8004C8EC 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 4D4F0 8004C8F0 02002021 */  addu       $a0, $s0, $zero
/* 4D4F4 8004C8F4 3C05800E */  lui        $a1, %hi(D_800DD8A0)
/* 4D4F8 8004C8F8 0C0333AC */  jal        sprintf
/* 4D4FC 8004C8FC 24A5D8A0 */   addiu     $a1, $a1, %lo(D_800DD8A0)
/* 4D500 8004C900 0C00B6B8 */  jal        debug_queue
/* 4D504 8004C904 02002021 */   addu      $a0, $s0, $zero
/* 4D508 8004C908 240235DC */  addiu      $v0, $zero, 0x35dc
.L8004C90C:
/* 4D50C 8004C90C AE220000 */  sw         $v0, ($s1)
/* 4D510 8004C910 08013257 */  j          .L8004C95C
/* 4D514 8004C914 24020001 */   addiu     $v0, $zero, 1
.L8004C918:
/* 4D518 8004C918 01041021 */  addu       $v0, $t0, $a0
/* 4D51C 8004C91C 94430002 */  lhu        $v1, 2($v0)
/* 4D520 8004C920 24020001 */  addiu      $v0, $zero, 1
/* 4D524 8004C924 08013257 */  j          .L8004C95C
/* 4D528 8004C928 AE230000 */   sw        $v1, ($s1)
.L8004C92C:
/* 4D52C 8004C92C 30C200FF */  andi       $v0, $a2, 0xff
/* 4D530 8004C930 AFA20010 */  sw         $v0, 0x10($sp)
/* 4D534 8004C934 27A40018 */  addiu      $a0, $sp, 0x18
/* 4D538 8004C938 3C05800E */  lui        $a1, %hi(D_800DD8BC)
/* 4D53C 8004C93C 24A5D8BC */  addiu      $a1, $a1, %lo(D_800DD8BC)
/* 4D540 8004C940 0C0333AC */  jal        sprintf
/* 4D544 8004C944 00063A02 */   srl       $a3, $a2, 8
/* 4D548 8004C948 3C04800E */  lui        $a0, %hi(D_800DD8F4)
/* 4D54C 8004C94C 2484D8F4 */  addiu      $a0, $a0, %lo(D_800DD8F4)
/* 4D550 8004C950 0C025F2D */  jal        manualCrash
/* 4D554 8004C954 27A50018 */   addiu     $a1, $sp, 0x18
/* 4D558 8004C958 00001021 */  addu       $v0, $zero, $zero
.L8004C95C:
/* 4D55C 8004C95C 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 4D560 8004C960 8FB1009C */  lw         $s1, 0x9c($sp)
/* 4D564 8004C964 8FB00098 */  lw         $s0, 0x98($sp)
/* 4D568 8004C968 03E00008 */  jr         $ra
/* 4D56C 8004C96C 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel getAspectIcon
/* 4D570 8004C970 00003821 */  addu       $a3, $zero, $zero
/* 4D574 8004C974 3C03800F */  lui        $v1, %hi(aspectIconCount)
/* 4D578 8004C978 8C62DB1C */  lw         $v0, %lo(aspectIconCount)($v1)
/* 4D57C 8004C97C 10400014 */  beqz       $v0, .L8004C9D0
/* 4D580 8004C980 3084FFFF */   andi      $a0, $a0, 0xffff
/* 4D584 8004C984 3C02800F */  lui        $v0, %hi(D_800EDB10)
/* 4D588 8004C988 2448DB10 */  addiu      $t0, $v0, %lo(D_800EDB10)
/* 4D58C 8004C98C 250A0002 */  addiu      $t2, $t0, 2
/* 4D590 8004C990 00604821 */  addu       $t1, $v1, $zero
/* 4D594 8004C994 00073080 */  sll        $a2, $a3, 2
.L8004C998:
/* 4D598 8004C998 00C81021 */  addu       $v0, $a2, $t0
/* 4D59C 8004C99C 94430000 */  lhu        $v1, ($v0)
/* 4D5A0 8004C9A0 14830006 */  bne        $a0, $v1, .L8004C9BC
/* 4D5A4 8004C9A4 24E30001 */   addiu     $v1, $a3, 1
/* 4D5A8 8004C9A8 00CA1021 */  addu       $v0, $a2, $t2
/* 4D5AC 8004C9AC 94430000 */  lhu        $v1, ($v0)
/* 4D5B0 8004C9B0 24020001 */  addiu      $v0, $zero, 1
/* 4D5B4 8004C9B4 03E00008 */  jr         $ra
/* 4D5B8 8004C9B8 ACA30000 */   sw        $v1, ($a1)
.L8004C9BC:
/* 4D5BC 8004C9BC 8D22DB1C */  lw         $v0, -0x24e4($t1)
/* 4D5C0 8004C9C0 3067FFFF */  andi       $a3, $v1, 0xffff
/* 4D5C4 8004C9C4 00E2102B */  sltu       $v0, $a3, $v0
/* 4D5C8 8004C9C8 1440FFF3 */  bnez       $v0, .L8004C998
/* 4D5CC 8004C9CC 00073080 */   sll       $a2, $a3, 2
.L8004C9D0:
/* 4D5D0 8004C9D0 03E00008 */  jr         $ra
/* 4D5D4 8004C9D4 00001021 */   addu      $v0, $zero, $zero

glabel get_school_icon
/* 4D5D8 8004C9D8 00003821 */  addu       $a3, $zero, $zero
/* 4D5DC 8004C9DC 3C03800F */  lui        $v1, %hi(SchoolIconCount)
/* 4D5E0 8004C9E0 8C62DB38 */  lw         $v0, %lo(SchoolIconCount)($v1)
/* 4D5E4 8004C9E4 10400014 */  beqz       $v0, .L8004CA38
/* 4D5E8 8004C9E8 3084FFFF */   andi      $a0, $a0, 0xffff
/* 4D5EC 8004C9EC 3C02800F */  lui        $v0, %hi(D_800EDB20)
/* 4D5F0 8004C9F0 2448DB20 */  addiu      $t0, $v0, %lo(D_800EDB20)
/* 4D5F4 8004C9F4 250A0002 */  addiu      $t2, $t0, 2
/* 4D5F8 8004C9F8 00604821 */  addu       $t1, $v1, $zero
/* 4D5FC 8004C9FC 00073080 */  sll        $a2, $a3, 2
.L8004CA00:
/* 4D600 8004CA00 00C81021 */  addu       $v0, $a2, $t0
/* 4D604 8004CA04 94430000 */  lhu        $v1, ($v0)
/* 4D608 8004CA08 14830006 */  bne        $a0, $v1, .L8004CA24
/* 4D60C 8004CA0C 24E30001 */   addiu     $v1, $a3, 1
/* 4D610 8004CA10 00CA1021 */  addu       $v0, $a2, $t2
/* 4D614 8004CA14 94430000 */  lhu        $v1, ($v0)
/* 4D618 8004CA18 24020001 */  addiu      $v0, $zero, 1
/* 4D61C 8004CA1C 03E00008 */  jr         $ra
/* 4D620 8004CA20 ACA30000 */   sw        $v1, ($a1)
.L8004CA24:
/* 4D624 8004CA24 8D22DB38 */  lw         $v0, -0x24c8($t1)
/* 4D628 8004CA28 3067FFFF */  andi       $a3, $v1, 0xffff
/* 4D62C 8004CA2C 00E2102B */  sltu       $v0, $a3, $v0
/* 4D630 8004CA30 1440FFF3 */  bnez       $v0, .L8004CA00
/* 4D634 8004CA34 00073080 */   sll       $a2, $a3, 2
.L8004CA38:
/* 4D638 8004CA38 03E00008 */  jr         $ra
/* 4D63C 8004CA3C 00001021 */   addu      $v0, $zero, $zero
