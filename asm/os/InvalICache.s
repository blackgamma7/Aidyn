.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osInvalICache
/* C4380 800C3780 18A00011 */  blez       $a1, .L800C37C8
/* C4384 800C3784 00000000 */   nop
/* C4388 800C3788 240B4000 */  addiu      $t3, $zero, 0x4000
/* C438C 800C378C 00AB082B */  sltu       $at, $a1, $t3
/* C4390 800C3790 1020000F */  beqz       $at, .L800C37D0
/* C4394 800C3794 00000000 */   nop
/* C4398 800C3798 00804021 */  addu       $t0, $a0, $zero
/* C439C 800C379C 00854821 */  addu       $t1, $a0, $a1
/* C43A0 800C37A0 0109082B */  sltu       $at, $t0, $t1
/* C43A4 800C37A4 10200008 */  beqz       $at, .L800C37C8
/* C43A8 800C37A8 00000000 */   nop
/* C43AC 800C37AC 2529FFE0 */  addiu      $t1, $t1, -0x20
/* C43B0 800C37B0 310A001F */  andi       $t2, $t0, 0x1f
/* C43B4 800C37B4 010A4023 */  subu       $t0, $t0, $t2
.L800C37B8:
/* C43B8 800C37B8 BD100000 */  cache      0x10, ($t0)
/* C43BC 800C37BC 0109082B */  sltu       $at, $t0, $t1
/* C43C0 800C37C0 1420FFFD */  bnez       $at, .L800C37B8
/* C43C4 800C37C4 25080020 */   addiu     $t0, $t0, 0x20
.L800C37C8:
/* C43C8 800C37C8 03E00008 */  jr         $ra
/* C43CC 800C37CC 00000000 */   nop
.L800C37D0:
/* C43D0 800C37D0 3C088000 */  lui        $t0, 0x8000
/* C43D4 800C37D4 010B4821 */  addu       $t1, $t0, $t3
/* C43D8 800C37D8 2529FFE0 */  addiu      $t1, $t1, -0x20
.L800C37DC:
/* C43DC 800C37DC BD000000 */  cache      0, ($t0)
/* C43E0 800C37E0 0109082B */  sltu       $at, $t0, $t1
/* C43E4 800C37E4 1420FFFD */  bnez       $at, .L800C37DC
/* C43E8 800C37E8 25080020 */   addiu     $t0, $t0, 0x20
/* C43EC 800C37EC 03E00008 */  jr         $ra
/* C43F0 800C37F0 00000000 */   nop
/* C43F4 800C37F4 00000000 */  nop
/* C43F8 800C37F8 00000000 */  nop
/* C43FC 800C37FC 00000000 */  nop
