.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSetFpcCsr
/* CD2D0 800CC6D0 4442F800 */  cfc1       $v0, $31
/* CD2D4 800CC6D4 44C4F800 */  ctc1       $a0, $31
/* CD2D8 800CC6D8 03E00008 */  jr         $ra
/* CD2DC 800CC6DC 00000000 */   nop

glabel __osSetGlobalIntMask
/* CD2E0 800CC6E0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD2E4 800CC6E4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD2E8 800CC6E8 AFBF0014 */  sw         $ra, 0x14($sp)
/* CD2EC 800CC6EC 0C030D90 */  jal        __osDisableInt
/* CD2F0 800CC6F0 00808021 */   addu      $s0, $a0, $zero
/* CD2F4 800CC6F4 3C03800F */  lui        $v1, %hi(__OSGlobalIntMask)
/* CD2F8 800CC6F8 8C633840 */  lw         $v1, %lo(__OSGlobalIntMask)($v1)
/* CD2FC 800CC6FC 00701825 */  or         $v1, $v1, $s0
/* CD300 800CC700 3C01800F */  lui        $at, %hi(__OSGlobalIntMask)
/* CD304 800CC704 AC233840 */  sw         $v1, %lo(__OSGlobalIntMask)($at)
/* CD308 800CC708 0C030DAC */  jal        __osRestoreInt
/* CD30C 800CC70C 00402021 */   addu      $a0, $v0, $zero
/* CD310 800CC710 8FBF0014 */  lw         $ra, 0x14($sp)
/* CD314 800CC714 8FB00010 */  lw         $s0, 0x10($sp)
/* CD318 800CC718 03E00008 */  jr         $ra
/* CD31C 800CC71C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel osSetIntMask
/* CD320 800CC720 400C6000 */  mfc0       $t4, $12
/* CD324 800CC724 3182FF01 */  andi       $v0, $t4, 0xff01
/* CD328 800CC728 3C08800F */  lui        $t0, %hi(__OSGlobalIntMask)
/* CD32C 800CC72C 25083840 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* CD330 800CC730 8D0B0000 */  lw         $t3, ($t0)
/* CD334 800CC734 2401FFFF */  addiu      $at, $zero, -1
/* CD338 800CC738 01614026 */  xor        $t0, $t3, $at
/* CD33C 800CC73C 3108FF00 */  andi       $t0, $t0, 0xff00
/* CD340 800CC740 00481025 */  or         $v0, $v0, $t0
/* CD344 800CC744 3C0AA430 */  lui        $t2, %hi(MI_INTR_MASK)
/* CD348 800CC748 8D4A000C */  lw         $t2, %lo(MI_INTR_MASK)($t2)
/* CD34C 800CC74C 11400005 */  beqz       $t2, .L800CC764
/* CD350 800CC750 000B4C02 */   srl       $t1, $t3, 0x10
/* CD354 800CC754 2401FFFF */  addiu      $at, $zero, -1
/* CD358 800CC758 01214826 */  xor        $t1, $t1, $at
/* CD35C 800CC75C 3129003F */  andi       $t1, $t1, 0x3f
/* CD360 800CC760 01495025 */  or         $t2, $t2, $t1
.L800CC764:
/* CD364 800CC764 000A5400 */  sll        $t2, $t2, 0x10
/* CD368 800CC768 004A1025 */  or         $v0, $v0, $t2
/* CD36C 800CC76C 3C01003F */  lui        $at, 0x3f
/* CD370 800CC770 00814024 */  and        $t0, $a0, $at
/* CD374 800CC774 010B4024 */  and        $t0, $t0, $t3
/* CD378 800CC778 000843C2 */  srl        $t0, $t0, 0xf
/* CD37C 800CC77C 3C0A800E */  lui        $t2, %hi(__osRcpImTable)
/* CD380 800CC780 01485021 */  addu       $t2, $t2, $t0
/* CD384 800CC784 954A5500 */  lhu        $t2, %lo(__osRcpImTable)($t2)
/* CD388 800CC788 3C01A430 */  lui        $at, %hi(MI_INTR_MASK)
/* CD38C 800CC78C AC2A000C */  sw         $t2, %lo(MI_INTR_MASK)($at)
/* CD390 800CC790 3088FF01 */  andi       $t0, $a0, 0xff01
/* CD394 800CC794 3169FF00 */  andi       $t1, $t3, 0xff00
/* CD398 800CC798 01094024 */  and        $t0, $t0, $t1
/* CD39C 800CC79C 3C01FFFF */  lui        $at, 0xffff
/* CD3A0 800CC7A0 342100FF */  ori        $at, $at, 0xff
/* CD3A4 800CC7A4 01816024 */  and        $t4, $t4, $at
/* CD3A8 800CC7A8 01886025 */  or         $t4, $t4, $t0
/* CD3AC 800CC7AC 408C6000 */  mtc0       $t4, $12
/* CD3B0 800CC7B0 00000000 */  nop
/* CD3B4 800CC7B4 00000000 */  nop
/* CD3B8 800CC7B8 03E00008 */  jr         $ra
/* CD3BC 800CC7BC 00000000 */   nop
