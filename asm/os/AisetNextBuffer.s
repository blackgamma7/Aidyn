.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osAiSetNextBuffer
/* BEE50 800BE250 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BEE54 800BE254 AFB00010 */  sw         $s0, 0x10($sp)
/* BEE58 800BE258 00808021 */  addu       $s0, $a0, $zero
/* BEE5C 800BE25C AFB10014 */  sw         $s1, 0x14($sp)
/* BEE60 800BE260 AFBF0018 */  sw         $ra, 0x18($sp)
/* BEE64 800BE264 0C02F8BC */  jal        osaiDeviceBusy
/* BEE68 800BE268 00A08821 */   addu      $s1, $a1, $zero
/* BEE6C 800BE26C 14400018 */  bnez       $v0, .L800BE2D0
/* BEE70 800BE270 2402FFFF */   addiu     $v0, $zero, -1
/* BEE74 800BE274 3C02800F */  lui        $v0, %hi(hdwrBugFlag)
/* BEE78 800BE278 90423710 */  lbu        $v0, %lo(hdwrBugFlag)($v0)
/* BEE7C 800BE27C 10400002 */  beqz       $v0, .L800BE288
/* BEE80 800BE280 02002021 */   addu      $a0, $s0, $zero
/* BEE84 800BE284 2484E000 */  addiu      $a0, $a0, -0x2000
.L800BE288:
/* BEE88 800BE288 02111021 */  addu       $v0, $s0, $s1
/* BEE8C 800BE28C 30421FFF */  andi       $v0, $v0, 0x1fff
/* BEE90 800BE290 14400004 */  bnez       $v0, .L800BE2A4
/* BEE94 800BE294 24020001 */   addiu     $v0, $zero, 1
/* BEE98 800BE298 3C01800F */  lui        $at, %hi(hdwrBugFlag)
/* BEE9C 800BE29C 0802F8AB */  j          .L800BE2AC
/* BEEA0 800BE2A0 A0223710 */   sb        $v0, %lo(hdwrBugFlag)($at)
.L800BE2A4:
/* BEEA4 800BE2A4 3C01800F */  lui        $at, %hi(hdwrBugFlag)
/* BEEA8 800BE2A8 A0203710 */  sb         $zero, %lo(hdwrBugFlag)($at)
.L800BE2AC:
/* BEEAC 800BE2AC 0C034888 */  jal        osVirtualToPhysical
/* BEEB0 800BE2B0 00000000 */   nop
/* BEEB4 800BE2B4 3C05A450 */  lui        $a1, 0xa450
/* BEEB8 800BE2B8 34A50004 */  ori        $a1, $a1, 4
/* BEEBC 800BE2BC 00402021 */  addu       $a0, $v0, $zero
/* BEEC0 800BE2C0 00001021 */  addu       $v0, $zero, $zero
/* BEEC4 800BE2C4 3C03A450 */  lui        $v1, 0xa450
/* BEEC8 800BE2C8 AC640000 */  sw         $a0, ($v1)
/* BEECC 800BE2CC ACB10000 */  sw         $s1, ($a1)
.L800BE2D0:
/* BEED0 800BE2D0 8FBF0018 */  lw         $ra, 0x18($sp)
/* BEED4 800BE2D4 8FB10014 */  lw         $s1, 0x14($sp)
/* BEED8 800BE2D8 8FB00010 */  lw         $s0, 0x10($sp)
/* BEEDC 800BE2DC 03E00008 */  jr         $ra
/* BEEE0 800BE2E0 27BD0020 */   addiu     $sp, $sp, 0x20
/* BEEE4 800BE2E4 00000000 */  nop
/* BEEE8 800BE2E8 00000000 */  nop
/* BEEEC 800BE2EC 00000000 */  nop
