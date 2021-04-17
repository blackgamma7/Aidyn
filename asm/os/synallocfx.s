.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSynAllocFX
/* D2330 800D1730 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D2334 800D1734 AFB10014 */  sw         $s1, 0x14($sp)
/* D2338 800D1738 00808821 */  addu       $s1, $a0, $zero
/* D233C 800D173C 00051400 */  sll        $v0, $a1, 0x10
/* D2340 800D1740 00C02821 */  addu       $a1, $a2, $zero
/* D2344 800D1744 00E03021 */  addu       $a2, $a3, $zero
/* D2348 800D1748 00021403 */  sra        $v0, $v0, 0x10
/* D234C 800D174C AFB00010 */  sw         $s0, 0x10($sp)
/* D2350 800D1750 00028080 */  sll        $s0, $v0, 2
/* D2354 800D1754 02028021 */  addu       $s0, $s0, $v0
/* D2358 800D1758 00108080 */  sll        $s0, $s0, 2
/* D235C 800D175C AFBF0018 */  sw         $ra, 0x18($sp)
/* D2360 800D1760 8E240034 */  lw         $a0, 0x34($s1)
/* D2364 800D1764 02028023 */  subu       $s0, $s0, $v0
/* D2368 800D1768 00108080 */  sll        $s0, $s0, 2
/* D236C 800D176C 00902021 */  addu       $a0, $a0, $s0
/* D2370 800D1770 0C033C91 */  jal        alFxNew
/* D2374 800D1774 24840020 */   addiu     $a0, $a0, 0x20
/* D2378 800D1778 8E260034 */  lw         $a2, 0x34($s1)
/* D237C 800D177C 24050001 */  addiu      $a1, $zero, 1
/* D2380 800D1780 00D03021 */  addu       $a2, $a2, $s0
/* D2384 800D1784 0C03438D */  jal        alFxParam
/* D2388 800D1788 24C40020 */   addiu     $a0, $a2, 0x20
/* D238C 800D178C 8E260034 */  lw         $a2, 0x34($s1)
/* D2390 800D1790 8E240030 */  lw         $a0, 0x30($s1)
/* D2394 800D1794 24050002 */  addiu      $a1, $zero, 2
/* D2398 800D1798 00D03021 */  addu       $a2, $a2, $s0
/* D239C 800D179C 0C0341F8 */  jal        alMainBusParam
/* D23A0 800D17A0 24C60020 */   addiu     $a2, $a2, 0x20
/* D23A4 800D17A4 8E220034 */  lw         $v0, 0x34($s1)
/* D23A8 800D17A8 00501021 */  addu       $v0, $v0, $s0
/* D23AC 800D17AC 24420020 */  addiu      $v0, $v0, 0x20
/* D23B0 800D17B0 8FBF0018 */  lw         $ra, 0x18($sp)
/* D23B4 800D17B4 8FB10014 */  lw         $s1, 0x14($sp)
/* D23B8 800D17B8 8FB00010 */  lw         $s0, 0x10($sp)
/* D23BC 800D17BC 03E00008 */  jr         $ra
/* D23C0 800D17C0 27BD0020 */   addiu     $sp, $sp, 0x20
/* D23C4 800D17C4 00000000 */  nop
/* D23C8 800D17C8 00000000 */  nop
/* D23CC 800D17CC 00000000 */  nop
