.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osContSetCh
/* BF8E0 800BECE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BF8E4 800BECE4 AFB00010 */  sw         $s0, 0x10($sp)
/* BF8E8 800BECE8 AFBF0014 */  sw         $ra, 0x14($sp)
/* BF8EC 800BECEC 0C033265 */  jal        __osSiGetAccess
/* BF8F0 800BECF0 00808021 */   addu      $s0, $a0, $zero
/* BF8F4 800BECF4 320200FF */  andi       $v0, $s0, 0xff
/* BF8F8 800BECF8 2C420005 */  sltiu      $v0, $v0, 5
/* BF8FC 800BECFC 14400005 */  bnez       $v0, .L800BED14
/* BF900 800BED00 24020004 */   addiu     $v0, $zero, 4
/* BF904 800BED04 3C01800F */  lui        $at, %hi(__osMaxControllers)
/* BF908 800BED08 A022575C */  sb         $v0, %lo(__osMaxControllers)($at)
/* BF90C 800BED0C 0802FB48 */  j          .L800BED20
/* BF910 800BED10 240200FE */   addiu     $v0, $zero, 0xfe
.L800BED14:
/* BF914 800BED14 3C01800F */  lui        $at, %hi(__osMaxControllers)
/* BF918 800BED18 A030575C */  sb         $s0, %lo(__osMaxControllers)($at)
/* BF91C 800BED1C 240200FE */  addiu      $v0, $zero, 0xfe
.L800BED20:
/* BF920 800BED20 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* BF924 800BED24 0C033280 */  jal        _osSiRelAccess
/* BF928 800BED28 A02257A0 */   sb        $v0, %lo(__osContLastCmd)($at)
/* BF92C 800BED2C 00001021 */  addu       $v0, $zero, $zero
/* BF930 800BED30 8FBF0014 */  lw         $ra, 0x14($sp)
/* BF934 800BED34 8FB00010 */  lw         $s0, 0x10($sp)
/* BF938 800BED38 03E00008 */  jr         $ra
/* BF93C 800BED3C 27BD0018 */   addiu     $sp, $sp, 0x18
