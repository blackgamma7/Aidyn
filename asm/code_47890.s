.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80046C90
/* 47890 80046C90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 47894 80046C94 AFB00010 */  sw         $s0, 0x10($sp)
/* 47898 80046C98 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4789C 80046C9C 0C02E658 */  jal        widget_menu_build
/* 478A0 80046CA0 00808021 */   addu      $s0, $a0, $zero
/* 478A4 80046CA4 3C03800E */  lui        $v1, %hi(D_800DD228)
/* 478A8 80046CA8 2463D228 */  addiu      $v1, $v1, %lo(D_800DD228)
/* 478AC 80046CAC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 478B0 80046CB0 02001021 */  addu       $v0, $s0, $zero
/* 478B4 80046CB4 AE030078 */  sw         $v1, 0x78($s0)
/* 478B8 80046CB8 8FB00010 */  lw         $s0, 0x10($sp)
/* 478BC 80046CBC 03E00008 */  jr         $ra
/* 478C0 80046CC0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80046CC4
/* 478C4 80046CC4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 478C8 80046CC8 AFB10014 */  sw         $s1, 0x14($sp)
/* 478CC 80046CCC 00808821 */  addu       $s1, $a0, $zero
/* 478D0 80046CD0 3C02800E */  lui        $v0, %hi(D_800DD228)
/* 478D4 80046CD4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 478D8 80046CD8 AFB20018 */  sw         $s2, 0x18($sp)
/* 478DC 80046CDC AFB00010 */  sw         $s0, 0x10($sp)
/* 478E0 80046CE0 8E300040 */  lw         $s0, 0x40($s1)
/* 478E4 80046CE4 2442D228 */  addiu      $v0, $v0, %lo(D_800DD228)
/* 478E8 80046CE8 AE220078 */  sw         $v0, 0x78($s1)
/* 478EC 80046CEC 8E020000 */  lw         $v0, ($s0)
/* 478F0 80046CF0 1040000C */  beqz       $v0, .L80046D24
/* 478F4 80046CF4 00A09021 */   addu      $s2, $a1, $zero
/* 478F8 80046CF8 0C02DEEF */  jal        unlink_widgets
/* 478FC 80046CFC 00402821 */   addu      $a1, $v0, $zero
/* 47900 80046D00 8E060000 */  lw         $a2, ($s0)
/* 47904 80046D04 10C00006 */  beqz       $a2, .L80046D20
/* 47908 80046D08 24050003 */   addiu     $a1, $zero, 3
/* 4790C 80046D0C 8CC20078 */  lw         $v0, 0x78($a2)
/* 47910 80046D10 84440008 */  lh         $a0, 8($v0)
/* 47914 80046D14 8C43000C */  lw         $v1, 0xc($v0)
/* 47918 80046D18 0060F809 */  jalr       $v1
/* 4791C 80046D1C 00C42021 */   addu      $a0, $a2, $a0
