.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widgetscrollmenu_upfunc
/* BAF70 800BA370 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BAF74 800BA374 00A05021 */  addu       $t2, $a1, $zero
/* BAF78 800BA378 AFBF001C */  sw         $ra, 0x1c($sp)
/* BAF7C 800BA37C AFB00018 */  sw         $s0, 0x18($sp)
/* BAF80 800BA380 8D500040 */  lw         $s0, 0x40($t2)
/* BAF84 800BA384 96020020 */  lhu        $v0, 0x20($s0)
/* BAF88 800BA388 10400027 */  beqz       $v0, .L800BA428
/* BAF8C 800BA38C 00001021 */   addu      $v0, $zero, $zero
/* BAF90 800BA390 9602001E */  lhu        $v0, 0x1e($s0)
/* BAF94 800BA394 8E030018 */  lw         $v1, 0x18($s0)
/* BAF98 800BA398 00021080 */  sll        $v0, $v0, 2
/* BAF9C 800BA39C 00431021 */  addu       $v0, $v0, $v1
/* BAFA0 800BA3A0 8C490000 */  lw         $t1, ($v0)
/* BAFA4 800BA3A4 11200020 */  beqz       $t1, .L800BA428
/* BAFA8 800BA3A8 00001021 */   addu      $v0, $zero, $zero
/* BAFAC 800BA3AC 8D280078 */  lw         $t0, 0x78($t1)
/* BAFB0 800BA3B0 9142005B */  lbu        $v0, 0x5b($t2)
/* BAFB4 800BA3B4 91450058 */  lbu        $a1, 0x58($t2)
/* BAFB8 800BA3B8 91460059 */  lbu        $a2, 0x59($t2)
/* BAFBC 800BA3BC 9147005A */  lbu        $a3, 0x5a($t2)
/* BAFC0 800BA3C0 85040048 */  lh         $a0, 0x48($t0)
/* BAFC4 800BA3C4 AFA20010 */  sw         $v0, 0x10($sp)
/* BAFC8 800BA3C8 8D03004C */  lw         $v1, 0x4c($t0)
/* BAFCC 800BA3CC 0060F809 */  jalr       $v1
/* BAFD0 800BA3D0 01242021 */   addu      $a0, $t1, $a0
/* BAFD4 800BA3D4 9602001E */  lhu        $v0, 0x1e($s0)
/* BAFD8 800BA3D8 50400001 */  beql       $v0, $zero, .L800BA3E0
/* BAFDC 800BA3DC 96020020 */   lhu       $v0, 0x20($s0)
.L800BA3E0:
/* BAFE0 800BA3E0 2442FFFF */  addiu      $v0, $v0, -1
/* BAFE4 800BA3E4 A602001E */  sh         $v0, 0x1e($s0)
/* BAFE8 800BA3E8 9205000C */  lbu        $a1, 0xc($s0)
/* BAFEC 800BA3EC 9602001E */  lhu        $v0, 0x1e($s0)
/* BAFF0 800BA3F0 8E030018 */  lw         $v1, 0x18($s0)
/* BAFF4 800BA3F4 9206000D */  lbu        $a2, 0xd($s0)
/* BAFF8 800BA3F8 00021080 */  sll        $v0, $v0, 2
/* BAFFC 800BA3FC 00431021 */  addu       $v0, $v0, $v1
/* BB000 800BA400 8C490000 */  lw         $t1, ($v0)
/* BB004 800BA404 9207000E */  lbu        $a3, 0xe($s0)
/* BB008 800BA408 8D280078 */  lw         $t0, 0x78($t1)
/* BB00C 800BA40C 9202000F */  lbu        $v0, 0xf($s0)
/* BB010 800BA410 85040048 */  lh         $a0, 0x48($t0)
/* BB014 800BA414 AFA20010 */  sw         $v0, 0x10($sp)
/* BB018 800BA418 8D03004C */  lw         $v1, 0x4c($t0)
/* BB01C 800BA41C 0060F809 */  jalr       $v1
/* BB020 800BA420 01242021 */   addu      $a0, $t1, $a0
/* BB024 800BA424 00001021 */  addu       $v0, $zero, $zero
.L800BA428:
/* BB028 800BA428 8FBF001C */  lw         $ra, 0x1c($sp)
/* BB02C 800BA42C 8FB00018 */  lw         $s0, 0x18($sp)
/* BB030 800BA430 03E00008 */  jr         $ra
/* BB034 800BA434 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widgetscrollmenu_DownFunc
/* BB038 800BA438 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BB03C 800BA43C 00A05021 */  addu       $t2, $a1, $zero
/* BB040 800BA440 AFBF001C */  sw         $ra, 0x1c($sp)
/* BB044 800BA444 AFB00018 */  sw         $s0, 0x18($sp)
/* BB048 800BA448 8D500040 */  lw         $s0, 0x40($t2)
/* BB04C 800BA44C 96020020 */  lhu        $v0, 0x20($s0)
/* BB050 800BA450 1040002A */  beqz       $v0, .L800BA4FC
/* BB054 800BA454 00001021 */   addu      $v0, $zero, $zero
/* BB058 800BA458 9602001E */  lhu        $v0, 0x1e($s0)
/* BB05C 800BA45C 8E030018 */  lw         $v1, 0x18($s0)
/* BB060 800BA460 00021080 */  sll        $v0, $v0, 2
/* BB064 800BA464 00431021 */  addu       $v0, $v0, $v1
/* BB068 800BA468 8C490000 */  lw         $t1, ($v0)
/* BB06C 800BA46C 11200023 */  beqz       $t1, .L800BA4FC
/* BB070 800BA470 00001021 */   addu      $v0, $zero, $zero
/* BB074 800BA474 8D280078 */  lw         $t0, 0x78($t1)
/* BB078 800BA478 9142005B */  lbu        $v0, 0x5b($t2)
/* BB07C 800BA47C 91450058 */  lbu        $a1, 0x58($t2)
/* BB080 800BA480 91460059 */  lbu        $a2, 0x59($t2)
/* BB084 800BA484 9147005A */  lbu        $a3, 0x5a($t2)
/* BB088 800BA488 85040048 */  lh         $a0, 0x48($t0)
/* BB08C 800BA48C AFA20010 */  sw         $v0, 0x10($sp)
/* BB090 800BA490 8D03004C */  lw         $v1, 0x4c($t0)
/* BB094 800BA494 0060F809 */  jalr       $v1
/* BB098 800BA498 01242021 */   addu      $a0, $t1, $a0
/* BB09C 800BA49C 9602001E */  lhu        $v0, 0x1e($s0)
/* BB0A0 800BA4A0 96030020 */  lhu        $v1, 0x20($s0)
/* BB0A4 800BA4A4 24420001 */  addiu      $v0, $v0, 1
/* BB0A8 800BA4A8 A602001E */  sh         $v0, 0x1e($s0)
/* BB0AC 800BA4AC 3042FFFF */  andi       $v0, $v0, 0xffff
/* BB0B0 800BA4B0 0043102B */  sltu       $v0, $v0, $v1
/* BB0B4 800BA4B4 50400001 */  beql       $v0, $zero, .L800BA4BC
/* BB0B8 800BA4B8 A600001E */   sh        $zero, 0x1e($s0)
.L800BA4BC:
/* BB0BC 800BA4BC 9205000C */  lbu        $a1, 0xc($s0)
/* BB0C0 800BA4C0 9602001E */  lhu        $v0, 0x1e($s0)
/* BB0C4 800BA4C4 8E030018 */  lw         $v1, 0x18($s0)
/* BB0C8 800BA4C8 9206000D */  lbu        $a2, 0xd($s0)
/* BB0CC 800BA4CC 00021080 */  sll        $v0, $v0, 2
/* BB0D0 800BA4D0 00431021 */  addu       $v0, $v0, $v1
/* BB0D4 800BA4D4 8C490000 */  lw         $t1, ($v0)
/* BB0D8 800BA4D8 9207000E */  lbu        $a3, 0xe($s0)
/* BB0DC 800BA4DC 8D280078 */  lw         $t0, 0x78($t1)
/* BB0E0 800BA4E0 9202000F */  lbu        $v0, 0xf($s0)
/* BB0E4 800BA4E4 85040048 */  lh         $a0, 0x48($t0)
/* BB0E8 800BA4E8 AFA20010 */  sw         $v0, 0x10($sp)
/* BB0EC 800BA4EC 8D03004C */  lw         $v1, 0x4c($t0)
/* BB0F0 800BA4F0 0060F809 */  jalr       $v1
/* BB0F4 800BA4F4 01242021 */   addu      $a0, $t1, $a0
/* BB0F8 800BA4F8 00001021 */  addu       $v0, $zero, $zero
.L800BA4FC:
/* BB0FC 800BA4FC 8FBF001C */  lw         $ra, 0x1c($sp)
/* BB100 800BA500 8FB00018 */  lw         $s0, 0x18($sp)
/* BB104 800BA504 03E00008 */  jr         $ra
/* BB108 800BA508 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret0_800ba50c
/* BB10C 800BA50C 03E00008 */  jr         $ra
/* BB110 800BA510 00001021 */   addu      $v0, $zero, $zero

glabel ret0_800BA514
/* BB114 800BA514 03E00008 */  jr         $ra
/* BB118 800BA518 00001021 */   addu      $v0, $zero, $zero

glabel widgetScrollMenu_Afunc
/* BB11C 800BA51C 8CA40040 */  lw         $a0, 0x40($a1)
/* BB120 800BA520 94820020 */  lhu        $v0, 0x20($a0)
/* BB124 800BA524 54400003 */  bnel       $v0, $zero, .L800BA534
/* BB128 800BA528 9483001E */   lhu       $v1, 0x1e($a0)
/* BB12C 800BA52C 03E00008 */  jr         $ra
/* BB130 800BA530 00001021 */   addu      $v0, $zero, $zero
.L800BA534:
/* BB134 800BA534 8C820018 */  lw         $v0, 0x18($a0)
/* BB138 800BA538 00031880 */  sll        $v1, $v1, 2
/* BB13C 800BA53C 00621821 */  addu       $v1, $v1, $v0
/* BB140 800BA540 03E00008 */  jr         $ra
/* BB144 800BA544 8C620000 */   lw        $v0, ($v1)
/* BB148 800BA548 00000000 */  nop
/* BB14C 800BA54C 00000000 */  nop
