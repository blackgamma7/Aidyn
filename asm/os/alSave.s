.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSavePull
/* D2260 800D1660 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D2264 800D1664 8FA20038 */  lw         $v0, 0x38($sp)
/* D2268 800D1668 AFB1001C */  sw         $s1, 0x1c($sp)
/* D226C 800D166C 00808821 */  addu       $s1, $a0, $zero
/* D2270 800D1670 AFBF0020 */  sw         $ra, 0x20($sp)
/* D2274 800D1674 AFB00018 */  sw         $s0, 0x18($sp)
/* D2278 800D1678 8E240000 */  lw         $a0, ($s1)
/* D227C 800D167C AFA20010 */  sw         $v0, 0x10($sp)
/* D2280 800D1680 8C820004 */  lw         $v0, 4($a0)
/* D2284 800D1684 0040F809 */  jalr       $v0
/* D2288 800D1688 00C08021 */   addu      $s0, $a2, $zero
/* D228C 800D168C 00401821 */  addu       $v1, $v0, $zero
/* D2290 800D1690 00602821 */  addu       $a1, $v1, $zero
/* D2294 800D1694 24630008 */  addiu      $v1, $v1, 8
/* D2298 800D1698 00603021 */  addu       $a2, $v1, $zero
/* D229C 800D169C 24630008 */  addiu      $v1, $v1, 8
/* D22A0 800D16A0 3C080440 */  lui        $t0, 0x440
/* D22A4 800D16A4 35080580 */  ori        $t0, $t0, 0x580
/* D22A8 800D16A8 00603821 */  addu       $a3, $v1, $zero
/* D22AC 800D16AC 24630008 */  addiu      $v1, $v1, 8
/* D22B0 800D16B0 3C040800 */  lui        $a0, 0x800
/* D22B4 800D16B4 00101040 */  sll        $v0, $s0, 1
/* D22B8 800D16B8 3042FFFF */  andi       $v0, $v0, 0xffff
/* D22BC 800D16BC ACA20004 */  sw         $v0, 4($a1)
/* D22C0 800D16C0 3C020D00 */  lui        $v0, 0xd00
/* D22C4 800D16C4 00108080 */  sll        $s0, $s0, 2
/* D22C8 800D16C8 3210FFFF */  andi       $s0, $s0, 0xffff
/* D22CC 800D16CC ACA40000 */  sw         $a0, ($a1)
/* D22D0 800D16D0 ACC20000 */  sw         $v0, ($a2)
/* D22D4 800D16D4 3C020600 */  lui        $v0, 0x600
/* D22D8 800D16D8 ACC80004 */  sw         $t0, 4($a2)
/* D22DC 800D16DC ACE40000 */  sw         $a0, ($a3)
/* D22E0 800D16E0 ACF00004 */  sw         $s0, 4($a3)
/* D22E4 800D16E4 AC620000 */  sw         $v0, ($v1)
/* D22E8 800D16E8 8E240014 */  lw         $a0, 0x14($s1)
/* D22EC 800D16EC 24620008 */  addiu      $v0, $v1, 8
/* D22F0 800D16F0 AC640004 */  sw         $a0, 4($v1)
/* D22F4 800D16F4 8FBF0020 */  lw         $ra, 0x20($sp)
/* D22F8 800D16F8 8FB1001C */  lw         $s1, 0x1c($sp)
/* D22FC 800D16FC 8FB00018 */  lw         $s0, 0x18($sp)
/* D2300 800D1700 03E00008 */  jr         $ra
/* D2304 800D1704 27BD0028 */   addiu     $sp, $sp, 0x28

glabel alSaveParam
/* D2308 800D1708 24020001 */  addiu      $v0, $zero, 1
/* D230C 800D170C 10A20005 */  beq        $a1, $v0, .L800D1724
/* D2310 800D1710 24020006 */   addiu     $v0, $zero, 6
/* D2314 800D1714 50A20004 */  beql       $a1, $v0, .L800D1728
/* D2318 800D1718 AC860014 */   sw        $a2, 0x14($a0)
/* D231C 800D171C 080345CA */  j          .L800D1728
/* D2320 800D1720 00000000 */   nop
.L800D1724:
/* D2324 800D1724 AC860000 */  sw         $a2, ($a0)
.L800D1728:
/* D2328 800D1728 03E00008 */  jr         $ra
/* D232C 800D172C 00001021 */   addu      $v0, $zero, $zero
