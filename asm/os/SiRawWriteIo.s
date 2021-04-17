.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSiRawWriteIo
/* CD8F0 800CCCF0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD8F4 800CCCF4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD8F8 800CCCF8 00808021 */  addu       $s0, $a0, $zero
/* CD8FC 800CCCFC AFB10014 */  sw         $s1, 0x14($sp)
/* CD900 800CCD00 AFBF0018 */  sw         $ra, 0x18($sp)
/* CD904 800CCD04 0C033334 */  jal        __osSiDeviceBusy
/* CD908 800CCD08 00A08821 */   addu      $s1, $a1, $zero
/* CD90C 800CCD0C 54400005 */  bnel       $v0, $zero, .L800CCD24
/* CD910 800CCD10 2402FFFF */   addiu     $v0, $zero, -1
/* CD914 800CCD14 3C02A000 */  lui        $v0, 0xa000
/* CD918 800CCD18 02021025 */  or         $v0, $s0, $v0
/* CD91C 800CCD1C AC510000 */  sw         $s1, ($v0)
/* CD920 800CCD20 00001021 */  addu       $v0, $zero, $zero
.L800CCD24:
/* CD924 800CCD24 8FBF0018 */  lw         $ra, 0x18($sp)
/* CD928 800CCD28 8FB10014 */  lw         $s1, 0x14($sp)
/* CD92C 800CCD2C 8FB00010 */  lw         $s0, 0x10($sp)
/* CD930 800CCD30 03E00008 */  jr         $ra
/* CD934 800CCD34 27BD0020 */   addiu     $sp, $sp, 0x20
/* CD938 800CCD38 00000000 */  nop
/* CD93C 800CCD3C 00000000 */  nop
