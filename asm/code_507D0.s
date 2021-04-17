.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8004FBD0
/* 507D0 8004FBD0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 507D4 8004FBD4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 507D8 8004FBD8 8CA20040 */  lw         $v0, 0x40($a1)
/* 507DC 8004FBDC 8C450028 */  lw         $a1, 0x28($v0)
/* 507E0 8004FBE0 10A0000C */  beqz       $a1, .L8004FC14
/* 507E4 8004FBE4 00001021 */   addu      $v0, $zero, $zero
/* 507E8 8004FBE8 8CA20040 */  lw         $v0, 0x40($a1)
/* 507EC 8004FBEC 94430020 */  lhu        $v1, 0x20($v0)
/* 507F0 8004FBF0 10600008 */  beqz       $v1, .L8004FC14
/* 507F4 8004FBF4 00001021 */   addu      $v0, $zero, $zero
/* 507F8 8004FBF8 8CA30078 */  lw         $v1, 0x78($a1)
/* 507FC 8004FBFC 84640068 */  lh         $a0, 0x68($v1)
/* 50800 8004FC00 8C62006C */  lw         $v0, 0x6c($v1)
/* 50804 8004FC04 0040F809 */  jalr       $v0
/* 50808 8004FC08 00A42021 */   addu      $a0, $a1, $a0
/* 5080C 8004FC0C 08013F06 */  j          .L8004FC18
/* 50810 8004FC10 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004FC14:
/* 50814 8004FC14 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004FC18:
/* 50818 8004FC18 03E00008 */  jr         $ra
/* 5081C 8004FC1C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004FC20
/* 50820 8004FC20 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 50824 8004FC24 AFBF0010 */  sw         $ra, 0x10($sp)
/* 50828 8004FC28 8CA20040 */  lw         $v0, 0x40($a1)
/* 5082C 8004FC2C 8C450028 */  lw         $a1, 0x28($v0)
/* 50830 8004FC30 10A0000C */  beqz       $a1, .L8004FC64
/* 50834 8004FC34 00001021 */   addu      $v0, $zero, $zero
/* 50838 8004FC38 8CA20040 */  lw         $v0, 0x40($a1)
/* 5083C 8004FC3C 94430020 */  lhu        $v1, 0x20($v0)
/* 50840 8004FC40 10600008 */  beqz       $v1, .L8004FC64
/* 50844 8004FC44 00001021 */   addu      $v0, $zero, $zero
/* 50848 8004FC48 8CA30078 */  lw         $v1, 0x78($a1)
/* 5084C 8004FC4C 84640070 */  lh         $a0, 0x70($v1)
/* 50850 8004FC50 8C620074 */  lw         $v0, 0x74($v1)
/* 50854 8004FC54 0040F809 */  jalr       $v0
/* 50858 8004FC58 00A42021 */   addu      $a0, $a1, $a0
/* 5085C 8004FC5C 08013F1A */  j          .L8004FC68
/* 50860 8004FC60 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004FC64:
/* 50864 8004FC64 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004FC68:
/* 50868 8004FC68 03E00008 */  jr         $ra
/* 5086C 8004FC6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004FC70
/* 50870 8004FC70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 50874 8004FC74 AFBF0010 */  sw         $ra, 0x10($sp)
/* 50878 8004FC78 8CA20040 */  lw         $v0, 0x40($a1)
/* 5087C 8004FC7C 8C450028 */  lw         $a1, 0x28($v0)
/* 50880 8004FC80 10A0000C */  beqz       $a1, .L8004FCB4
/* 50884 8004FC84 00001021 */   addu      $v0, $zero, $zero
/* 50888 8004FC88 8CA20040 */  lw         $v0, 0x40($a1)
/* 5088C 8004FC8C 94430020 */  lhu        $v1, 0x20($v0)
/* 50890 8004FC90 10600008 */  beqz       $v1, .L8004FCB4
/* 50894 8004FC94 00001021 */   addu      $v0, $zero, $zero
/* 50898 8004FC98 8CA30078 */  lw         $v1, 0x78($a1)
/* 5089C 8004FC9C 84640058 */  lh         $a0, 0x58($v1)
/* 508A0 8004FCA0 8C62005C */  lw         $v0, 0x5c($v1)
/* 508A4 8004FCA4 0040F809 */  jalr       $v0
/* 508A8 8004FCA8 00A42021 */   addu      $a0, $a1, $a0
/* 508AC 8004FCAC 08013F2E */  j          .L8004FCB8
/* 508B0 8004FCB0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004FCB4:
/* 508B4 8004FCB4 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004FCB8:
/* 508B8 8004FCB8 03E00008 */  jr         $ra
/* 508BC 8004FCBC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004FCC0
/* 508C0 8004FCC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 508C4 8004FCC4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 508C8 8004FCC8 8CA20040 */  lw         $v0, 0x40($a1)
/* 508CC 8004FCCC 8C450028 */  lw         $a1, 0x28($v0)
/* 508D0 8004FCD0 10A0000C */  beqz       $a1, .L8004FD04
/* 508D4 8004FCD4 00001021 */   addu      $v0, $zero, $zero
/* 508D8 8004FCD8 8CA20040 */  lw         $v0, 0x40($a1)
/* 508DC 8004FCDC 94430020 */  lhu        $v1, 0x20($v0)
/* 508E0 8004FCE0 10600008 */  beqz       $v1, .L8004FD04
/* 508E4 8004FCE4 00001021 */   addu      $v0, $zero, $zero
/* 508E8 8004FCE8 8CA30078 */  lw         $v1, 0x78($a1)
/* 508EC 8004FCEC 84640060 */  lh         $a0, 0x60($v1)
/* 508F0 8004FCF0 8C620064 */  lw         $v0, 0x64($v1)
/* 508F4 8004FCF4 0040F809 */  jalr       $v0
/* 508F8 8004FCF8 00A42021 */   addu      $a0, $a1, $a0
/* 508FC 8004FCFC 08013F42 */  j          .L8004FD08
/* 50900 8004FD00 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004FD04:
/* 50904 8004FD04 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004FD08:
/* 50908 8004FD08 03E00008 */  jr         $ra
/* 5090C 8004FD0C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004FD10
/* 50910 8004FD10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 50914 8004FD14 AFBF0010 */  sw         $ra, 0x10($sp)
/* 50918 8004FD18 8CA40040 */  lw         $a0, 0x40($a1)
/* 5091C 8004FD1C 8C860020 */  lw         $a2, 0x20($a0)
/* 50920 8004FD20 50C00001 */  beql       $a2, $zero, .L8004FD28
/* 50924 8004FD24 8C860024 */   lw        $a2, 0x24($a0)
.L8004FD28:
/* 50928 8004FD28 8C850028 */  lw         $a1, 0x28($a0)
/* 5092C 8004FD2C 10A0000C */  beqz       $a1, .L8004FD60
/* 50930 8004FD30 00C01021 */   addu      $v0, $a2, $zero
/* 50934 8004FD34 8CA20040 */  lw         $v0, 0x40($a1)
/* 50938 8004FD38 94430020 */  lhu        $v1, 0x20($v0)
/* 5093C 8004FD3C 10600008 */  beqz       $v1, .L8004FD60
/* 50940 8004FD40 00C01021 */   addu      $v0, $a2, $zero
/* 50944 8004FD44 8CA30078 */  lw         $v1, 0x78($a1)
/* 50948 8004FD48 84640078 */  lh         $a0, 0x78($v1)
/* 5094C 8004FD4C 8C62007C */  lw         $v0, 0x7c($v1)
/* 50950 8004FD50 0040F809 */  jalr       $v0
/* 50954 8004FD54 00A42021 */   addu      $a0, $a1, $a0
/* 50958 8004FD58 08013F59 */  j          .L8004FD64
/* 5095C 8004FD5C 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004FD60:
/* 50960 8004FD60 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004FD64:
/* 50964 8004FD64 03E00008 */  jr         $ra
/* 50968 8004FD68 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_debug_func
/* 5096C 8004FD6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 50970 8004FD70 3C04800E */  lui        $a0, %hi(some_struct_pointer)
/* 50974 8004FD74 3C05800F */  lui        $a1, %hi(borg_13_pointer)
/* 50978 8004FD78 8C827E68 */  lw         $v0, %lo(some_struct_pointer)($a0)
/* 5097C 8004FD7C 8CA3E964 */  lw         $v1, %lo(borg_13_pointer)($a1)
/* 50980 8004FD80 24060022 */  addiu      $a2, $zero, 0x22
/* 50984 8004FD84 AFBF0010 */  sw         $ra, 0x10($sp)
/* 50988 8004FD88 8C440008 */  lw         $a0, 8($v0)
/* 5098C 8004FD8C 8C650010 */  lw         $a1, 0x10($v1)
/* 50990 8004FD90 0C015CB4 */  jal        dialouge_func_C
/* 50994 8004FD94 00003821 */   addu      $a3, $zero, $zero
/* 50998 8004FD98 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5099C 8004FD9C 00001021 */  addu       $v0, $zero, $zero
/* 509A0 8004FDA0 03E00008 */  jr         $ra
/* 509A4 8004FDA4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004FDA8
/* 509A8 8004FDA8 8CA20040 */  lw         $v0, 0x40($a1)
/* 509AC 8004FDAC 8C430020 */  lw         $v1, 0x20($v0)
/* 509B0 8004FDB0 50600001 */  beql       $v1, $zero, .L8004FDB8
/* 509B4 8004FDB4 8C430024 */   lw        $v1, 0x24($v0)
.L8004FDB8:
/* 509B8 8004FDB8 8C420028 */  lw         $v0, 0x28($v0)
/* 509BC 8004FDBC 54400003 */  bnel       $v0, $zero, .L8004FDCC
/* 509C0 8004FDC0 8C440040 */   lw        $a0, 0x40($v0)
/* 509C4 8004FDC4 03E00008 */  jr         $ra
/* 509C8 8004FDC8 00601021 */   addu      $v0, $v1, $zero
.L8004FDCC:
/* 509CC 8004FDCC 94820020 */  lhu        $v0, 0x20($a0)
/* 509D0 8004FDD0 10400007 */  beqz       $v0, .L8004FDF0
/* 509D4 8004FDD4 00000000 */   nop
/* 509D8 8004FDD8 00401821 */  addu       $v1, $v0, $zero
/* 509DC 8004FDDC 8C820018 */  lw         $v0, 0x18($a0)
/* 509E0 8004FDE0 00031880 */  sll        $v1, $v1, 2
/* 509E4 8004FDE4 00621821 */  addu       $v1, $v1, $v0
/* 509E8 8004FDE8 03E00008 */  jr         $ra
/* 509EC 8004FDEC 8C62FFFC */   lw        $v0, -4($v1)
.L8004FDF0:
/* 509F0 8004FDF0 03E00008 */  jr         $ra
/* 509F4 8004FDF4 00601021 */   addu      $v0, $v1, $zero
/* 509F8 8004FDF8 00000000 */  nop
/* 509FC 8004FDFC 00000000 */  nop
