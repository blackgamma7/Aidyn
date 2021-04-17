.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsFindFile
/* C8160 800C7560 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* C8164 800C7564 AFB30044 */  sw         $s3, 0x44($sp)
/* C8168 800C7568 8FB30070 */  lw         $s3, 0x70($sp)
/* C816C 800C756C AFB00038 */  sw         $s0, 0x38($sp)
/* C8170 800C7570 00808021 */  addu       $s0, $a0, $zero
/* C8174 800C7574 AFBE0058 */  sw         $fp, 0x58($sp)
/* C8178 800C7578 00C0F021 */  addu       $fp, $a2, $zero
/* C817C 800C757C AFB20040 */  sw         $s2, 0x40($sp)
/* C8180 800C7580 00E09021 */  addu       $s2, $a3, $zero
/* C8184 800C7584 AFBF005C */  sw         $ra, 0x5c($sp)
/* C8188 800C7588 AFB70054 */  sw         $s7, 0x54($sp)
/* C818C 800C758C AFB60050 */  sw         $s6, 0x50($sp)
/* C8190 800C7590 AFB5004C */  sw         $s5, 0x4c($sp)
/* C8194 800C7594 AFB40048 */  sw         $s4, 0x48($sp)
/* C8198 800C7598 AFB1003C */  sw         $s1, 0x3c($sp)
/* C819C 800C759C 8E020000 */  lw         $v0, ($s0)
/* C81A0 800C75A0 8FB40074 */  lw         $s4, 0x74($sp)
/* C81A4 800C75A4 30420001 */  andi       $v0, $v0, 1
/* C81A8 800C75A8 1040004E */  beqz       $v0, .L800C76E4
/* C81AC 800C75AC 00A0B821 */   addu      $s7, $a1, $zero
/* C81B0 800C75B0 0C031601 */  jal        __osCheckId
/* C81B4 800C75B4 02002021 */   addu      $a0, $s0, $zero
/* C81B8 800C75B8 00403821 */  addu       $a3, $v0, $zero
/* C81BC 800C75BC 14E0004A */  bnez       $a3, .L800C76E8
/* C81C0 800C75C0 00000000 */   nop
/* C81C4 800C75C4 8E020050 */  lw         $v0, 0x50($s0)
/* C81C8 800C75C8 18400044 */  blez       $v0, .L800C76DC
/* C81CC 800C75CC 00008821 */   addu      $s1, $zero, $zero
/* C81D0 800C75D0 27B60020 */  addiu      $s6, $sp, 0x20
/* C81D4 800C75D4 27B5001C */  addiu      $s5, $sp, 0x1c
.L800C75D8:
/* C81D8 800C75D8 8E06005C */  lw         $a2, 0x5c($s0)
/* C81DC 800C75DC 8E040004 */  lw         $a0, 4($s0)
/* C81E0 800C75E0 8E050008 */  lw         $a1, 8($s0)
/* C81E4 800C75E4 27A70010 */  addiu      $a3, $sp, 0x10
/* C81E8 800C75E8 00D13021 */  addu       $a2, $a2, $s1
/* C81EC 800C75EC 0C0309EC */  jal        __osContRamRead
/* C81F0 800C75F0 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C81F4 800C75F4 00403821 */  addu       $a3, $v0, $zero
/* C81F8 800C75F8 14E0003B */  bnez       $a3, .L800C76E8
/* C81FC 800C75FC 00E01021 */   addu      $v0, $a3, $zero
/* C8200 800C7600 8E040004 */  lw         $a0, 4($s0)
/* C8204 800C7604 0C031878 */  jal        __osPfsGetStatus
/* C8208 800C7608 8E050008 */   lw        $a1, 8($s0)
/* C820C 800C760C 00403821 */  addu       $a3, $v0, $zero
/* C8210 800C7610 14E00027 */  bnez       $a3, .L800C76B0
/* C8214 800C7614 32E2FFFF */   andi      $v0, $s7, 0xffff
/* C8218 800C7618 97A30014 */  lhu        $v1, 0x14($sp)
/* C821C 800C761C 1462002A */  bne        $v1, $v0, .L800C76C8
/* C8220 800C7620 00000000 */   nop
/* C8224 800C7624 8FA20010 */  lw         $v0, 0x10($sp)
/* C8228 800C7628 145E0027 */  bne        $v0, $fp, .L800C76C8
/* C822C 800C762C 00000000 */   nop
/* C8230 800C7630 1240000C */  beqz       $s2, .L800C7664
/* C8234 800C7634 00004021 */   addu      $t0, $zero, $zero
/* C8238 800C7638 00002021 */  addu       $a0, $zero, $zero
/* C823C 800C763C 02403021 */  addu       $a2, $s2, $zero
/* C8240 800C7640 02C02821 */  addu       $a1, $s6, $zero
.L800C7644:
/* C8244 800C7644 90A30000 */  lbu        $v1, ($a1)
/* C8248 800C7648 90C20000 */  lbu        $v0, ($a2)
/* C824C 800C764C 1462001C */  bne        $v1, $v0, .L800C76C0
/* C8250 800C7650 24C60001 */   addiu     $a2, $a2, 1
/* C8254 800C7654 24840001 */  addiu      $a0, $a0, 1
/* C8258 800C7658 28820010 */  slti       $v0, $a0, 0x10
/* C825C 800C765C 1440FFF9 */  bnez       $v0, .L800C7644
/* C8260 800C7660 24A50001 */   addiu     $a1, $a1, 1
.L800C7664:
/* C8264 800C7664 0013102B */  sltu       $v0, $zero, $s3
/* C8268 800C7668 2D030001 */  sltiu      $v1, $t0, 1
/* C826C 800C766C 00431024 */  and        $v0, $v0, $v1
/* C8270 800C7670 1040000C */  beqz       $v0, .L800C76A4
/* C8274 800C7674 00000000 */   nop
/* C8278 800C7678 00002021 */  addu       $a0, $zero, $zero
/* C827C 800C767C 02603021 */  addu       $a2, $s3, $zero
/* C8280 800C7680 02A02821 */  addu       $a1, $s5, $zero
.L800C7684:
/* C8284 800C7684 90A30000 */  lbu        $v1, ($a1)
/* C8288 800C7688 90C20000 */  lbu        $v0, ($a2)
/* C828C 800C768C 1462000A */  bne        $v1, $v0, .L800C76B8
/* C8290 800C7690 24C60001 */   addiu     $a2, $a2, 1
/* C8294 800C7694 24840001 */  addiu      $a0, $a0, 1
/* C8298 800C7698 28820004 */  slti       $v0, $a0, 4
/* C829C 800C769C 1440FFF9 */  bnez       $v0, .L800C7684
/* C82A0 800C76A0 24A50001 */   addiu     $a1, $a1, 1
.L800C76A4:
/* C82A4 800C76A4 15000008 */  bnez       $t0, .L800C76C8
/* C82A8 800C76A8 00000000 */   nop
/* C82AC 800C76AC AE910000 */  sw         $s1, ($s4)
.L800C76B0:
/* C82B0 800C76B0 08031DBA */  j          .L800C76E8
/* C82B4 800C76B4 00E01021 */   addu      $v0, $a3, $zero
.L800C76B8:
/* C82B8 800C76B8 08031DA9 */  j          .L800C76A4
/* C82BC 800C76BC 24080001 */   addiu     $t0, $zero, 1
.L800C76C0:
/* C82C0 800C76C0 08031D99 */  j          .L800C7664
/* C82C4 800C76C4 24080001 */   addiu     $t0, $zero, 1
.L800C76C8:
/* C82C8 800C76C8 8E020050 */  lw         $v0, 0x50($s0)
/* C82CC 800C76CC 26310001 */  addiu      $s1, $s1, 1
/* C82D0 800C76D0 0222102A */  slt        $v0, $s1, $v0
/* C82D4 800C76D4 1440FFC0 */  bnez       $v0, .L800C75D8
/* C82D8 800C76D8 00000000 */   nop
.L800C76DC:
/* C82DC 800C76DC 2402FFFF */  addiu      $v0, $zero, -1
/* C82E0 800C76E0 AE820000 */  sw         $v0, ($s4)
.L800C76E4:
/* C82E4 800C76E4 24020005 */  addiu      $v0, $zero, 5
.L800C76E8:
/* C82E8 800C76E8 8FBF005C */  lw         $ra, 0x5c($sp)
/* C82EC 800C76EC 8FBE0058 */  lw         $fp, 0x58($sp)
/* C82F0 800C76F0 8FB70054 */  lw         $s7, 0x54($sp)
/* C82F4 800C76F4 8FB60050 */  lw         $s6, 0x50($sp)
/* C82F8 800C76F8 8FB5004C */  lw         $s5, 0x4c($sp)
/* C82FC 800C76FC 8FB40048 */  lw         $s4, 0x48($sp)
/* C8300 800C7700 8FB30044 */  lw         $s3, 0x44($sp)
/* C8304 800C7704 8FB20040 */  lw         $s2, 0x40($sp)
/* C8308 800C7708 8FB1003C */  lw         $s1, 0x3c($sp)
/* C830C 800C770C 8FB00038 */  lw         $s0, 0x38($sp)
/* C8310 800C7710 03E00008 */  jr         $ra
/* C8314 800C7714 27BD0060 */   addiu     $sp, $sp, 0x60
/* C8318 800C7718 00000000 */  nop
/* C831C 800C771C 00000000 */  nop
