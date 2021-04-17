.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osProbeTLB
/* D2E80 800D2280 40085000 */  mfc0       $t0, $10
/* D2E84 800D2284 310900FF */  andi       $t1, $t0, 0xff
/* D2E88 800D2288 2401E000 */  addiu      $at, $zero, -0x2000
/* D2E8C 800D228C 00815024 */  and        $t2, $a0, $at
/* D2E90 800D2290 012A4825 */  or         $t1, $t1, $t2
/* D2E94 800D2294 40895000 */  mtc0       $t1, $10
/* D2E98 800D2298 00000000 */  nop
/* D2E9C 800D229C 00000000 */  nop
/* D2EA0 800D22A0 00000000 */  nop
/* D2EA4 800D22A4 42000008 */  tlbp
/* D2EA8 800D22A8 00000000 */  nop
/* D2EAC 800D22AC 00000000 */  nop
/* D2EB0 800D22B0 400B0000 */  mfc0       $t3, $0
/* D2EB4 800D22B4 3C018000 */  lui        $at, 0x8000
/* D2EB8 800D22B8 01615824 */  and        $t3, $t3, $at
/* D2EBC 800D22BC 1560001A */  bnez       $t3, .L800D2328
/* D2EC0 800D22C0 00000000 */   nop
/* D2EC4 800D22C4 42000001 */  tlbr
/* D2EC8 800D22C8 00000000 */  nop
/* D2ECC 800D22CC 00000000 */  nop
/* D2ED0 800D22D0 00000000 */  nop
/* D2ED4 800D22D4 400B2800 */  mfc0       $t3, $5
/* D2ED8 800D22D8 216B2000 */  addi       $t3, $t3, 0x2000
/* D2EDC 800D22DC 000B5842 */  srl        $t3, $t3, 1
/* D2EE0 800D22E0 01646024 */  and        $t4, $t3, $a0
/* D2EE4 800D22E4 15800004 */  bnez       $t4, .L800D22F8
/* D2EE8 800D22E8 216BFFFF */   addi      $t3, $t3, -1
/* D2EEC 800D22EC 40021000 */  mfc0       $v0, $2
/* D2EF0 800D22F0 10000002 */  b          .L800D22FC
/* D2EF4 800D22F4 00000000 */   nop
.L800D22F8:
/* D2EF8 800D22F8 40021800 */  mfc0       $v0, $3
.L800D22FC:
/* D2EFC 800D22FC 304D0002 */  andi       $t5, $v0, 2
/* D2F00 800D2300 11A00009 */  beqz       $t5, .L800D2328
/* D2F04 800D2304 00000000 */   nop
/* D2F08 800D2308 3C013FFF */  lui        $at, 0x3fff
/* D2F0C 800D230C 3421FFC0 */  ori        $at, $at, 0xffc0
/* D2F10 800D2310 00411024 */  and        $v0, $v0, $at
/* D2F14 800D2314 00021180 */  sll        $v0, $v0, 6
/* D2F18 800D2318 008B6824 */  and        $t5, $a0, $t3
/* D2F1C 800D231C 004D1020 */  add        $v0, $v0, $t5
/* D2F20 800D2320 10000002 */  b          .L800D232C
/* D2F24 800D2324 00000000 */   nop
.L800D2328:
/* D2F28 800D2328 2402FFFF */  addiu      $v0, $zero, -1
.L800D232C:
/* D2F2C 800D232C 40885000 */  mtc0       $t0, $10
/* D2F30 800D2330 03E00008 */  jr         $ra
/* D2F34 800D2334 00000000 */   nop
/* D2F38 800D2338 00000000 */  nop
/* D2F3C 800D233C 00000000 */  nop
