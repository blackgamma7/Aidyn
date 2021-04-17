.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _bzero
/* BF2B0 800BE6B0 00041823 */  negu       $v1, $a0
/* BF2B4 800BE6B4 28A1000C */  slti       $at, $a1, 0xc
/* BF2B8 800BE6B8 1420001D */  bnez       $at, .L800BE730
/* BF2BC 800BE6BC 00000000 */   nop
/* BF2C0 800BE6C0 30630003 */  andi       $v1, $v1, 3
/* BF2C4 800BE6C4 10600003 */  beqz       $v1, .L800BE6D4
/* BF2C8 800BE6C8 00A32823 */   subu      $a1, $a1, $v1
/* BF2CC 800BE6CC A8800000 */  swl        $zero, ($a0)
/* BF2D0 800BE6D0 00832021 */  addu       $a0, $a0, $v1
.L800BE6D4:
/* BF2D4 800BE6D4 2401FFE0 */  addiu      $at, $zero, -0x20
/* BF2D8 800BE6D8 00A13824 */  and        $a3, $a1, $at
/* BF2DC 800BE6DC 10E0000C */  beqz       $a3, .L800BE710
/* BF2E0 800BE6E0 00A72823 */   subu      $a1, $a1, $a3
/* BF2E4 800BE6E4 00E43821 */  addu       $a3, $a3, $a0
.L800BE6E8:
/* BF2E8 800BE6E8 AC800000 */  sw         $zero, ($a0)
/* BF2EC 800BE6EC AC800004 */  sw         $zero, 4($a0)
/* BF2F0 800BE6F0 AC800008 */  sw         $zero, 8($a0)
/* BF2F4 800BE6F4 AC80000C */  sw         $zero, 0xc($a0)
/* BF2F8 800BE6F8 24840020 */  addiu      $a0, $a0, 0x20
/* BF2FC 800BE6FC AC80FFF0 */  sw         $zero, -0x10($a0)
/* BF300 800BE700 AC80FFF4 */  sw         $zero, -0xc($a0)
/* BF304 800BE704 AC80FFF8 */  sw         $zero, -8($a0)
/* BF308 800BE708 1487FFF7 */  bne        $a0, $a3, .L800BE6E8
/* BF30C 800BE70C AC80FFFC */   sw        $zero, -4($a0)
.L800BE710:
/* BF310 800BE710 2401FFFC */  addiu      $at, $zero, -4
/* BF314 800BE714 00A13824 */  and        $a3, $a1, $at
/* BF318 800BE718 10E00005 */  beqz       $a3, .L800BE730
/* BF31C 800BE71C 00A72823 */   subu      $a1, $a1, $a3
/* BF320 800BE720 00E43821 */  addu       $a3, $a3, $a0
.L800BE724:
/* BF324 800BE724 24840004 */  addiu      $a0, $a0, 4
/* BF328 800BE728 1487FFFE */  bne        $a0, $a3, .L800BE724
/* BF32C 800BE72C AC80FFFC */   sw        $zero, -4($a0)
.L800BE730:
/* BF330 800BE730 18A00005 */  blez       $a1, .L800BE748
/* BF334 800BE734 00000000 */   nop
/* BF338 800BE738 00A42821 */  addu       $a1, $a1, $a0
.L800BE73C:
/* BF33C 800BE73C 24840001 */  addiu      $a0, $a0, 1
/* BF340 800BE740 1485FFFE */  bne        $a0, $a1, .L800BE73C
/* BF344 800BE744 A080FFFF */   sb        $zero, -1($a0)
.L800BE748:
/* BF348 800BE748 03E00008 */  jr         $ra
/* BF34C 800BE74C 00000000 */   nop
