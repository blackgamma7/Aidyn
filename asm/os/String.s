.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel strchr
/* CE0C0 800CD4C0 90830000 */  lbu        $v1, ($a0)
/* CE0C4 800CD4C4 30A500FF */  andi       $a1, $a1, 0xff
/* CE0C8 800CD4C8 306200FF */  andi       $v0, $v1, 0xff
/* CE0CC 800CD4CC 10450008 */  beq        $v0, $a1, .L800CD4F0
/* CE0D0 800CD4D0 00801021 */   addu      $v0, $a0, $zero
.L800CD4D4:
/* CE0D4 800CD4D4 14600003 */  bnez       $v1, .L800CD4E4
/* CE0D8 800CD4D8 24840001 */   addiu     $a0, $a0, 1
/* CE0DC 800CD4DC 0803353C */  j          .L800CD4F0
/* CE0E0 800CD4E0 00001021 */   addu      $v0, $zero, $zero
.L800CD4E4:
/* CE0E4 800CD4E4 90830000 */  lbu        $v1, ($a0)
/* CE0E8 800CD4E8 1465FFFA */  bne        $v1, $a1, .L800CD4D4
/* CE0EC 800CD4EC 00801021 */   addu      $v0, $a0, $zero
.L800CD4F0:
/* CE0F0 800CD4F0 03E00008 */  jr         $ra
/* CE0F4 800CD4F4 00000000 */   nop

glabel strlen
/* CE0F8 800CD4F8 90820000 */  lbu        $v0, ($a0)
/* CE0FC 800CD4FC 10400005 */  beqz       $v0, .L800CD514
/* CE100 800CD500 00801821 */   addu      $v1, $a0, $zero
/* CE104 800CD504 24630001 */  addiu      $v1, $v1, 1
.L800CD508:
/* CE108 800CD508 90620000 */  lbu        $v0, ($v1)
/* CE10C 800CD50C 5440FFFE */  bnel       $v0, $zero, .L800CD508
/* CE110 800CD510 24630001 */   addiu     $v1, $v1, 1
.L800CD514:
/* CE114 800CD514 03E00008 */  jr         $ra
/* CE118 800CD518 00641023 */   subu      $v0, $v1, $a0

glabel memcpy
/* CE11C 800CD51C 10C00007 */  beqz       $a2, .L800CD53C
/* CE120 800CD520 00801821 */   addu      $v1, $a0, $zero
.L800CD524:
/* CE124 800CD524 90A20000 */  lbu        $v0, ($a1)
/* CE128 800CD528 24A50001 */  addiu      $a1, $a1, 1
/* CE12C 800CD52C 24C6FFFF */  addiu      $a2, $a2, -1
/* CE130 800CD530 A0620000 */  sb         $v0, ($v1)
/* CE134 800CD534 14C0FFFB */  bnez       $a2, .L800CD524
/* CE138 800CD538 24630001 */   addiu     $v1, $v1, 1
.L800CD53C:
/* CE13C 800CD53C 03E00008 */  jr         $ra
/* CE140 800CD540 00801021 */   addu      $v0, $a0, $zero
/* CE144 800CD544 00000000 */  nop
/* CE148 800CD548 00000000 */  nop
/* CE14C 800CD54C 00000000 */  nop
