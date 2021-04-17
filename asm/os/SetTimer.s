.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osSetTimer
/* CD4A0 800CC8A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD4A4 800CC8A4 8FA20028 */  lw         $v0, 0x28($sp)
/* CD4A8 800CC8A8 8FA3002C */  lw         $v1, 0x2c($sp)
/* CD4AC 800CC8AC AFB00010 */  sw         $s0, 0x10($sp)
/* CD4B0 800CC8B0 00808021 */  addu       $s0, $a0, $zero
/* CD4B4 800CC8B4 AFBF0014 */  sw         $ra, 0x14($sp)
/* CD4B8 800CC8B8 AE000000 */  sw         $zero, ($s0)
/* CD4BC 800CC8BC AE000004 */  sw         $zero, 4($s0)
/* CD4C0 800CC8C0 AE060010 */  sw         $a2, 0x10($s0)
/* CD4C4 800CC8C4 AE070014 */  sw         $a3, 0x14($s0)
/* CD4C8 800CC8C8 AE020008 */  sw         $v0, 8($s0)
/* CD4CC 800CC8CC AE03000C */  sw         $v1, 0xc($s0)
/* CD4D0 800CC8D0 8FA50030 */  lw         $a1, 0x30($sp)
/* CD4D4 800CC8D4 8FA80034 */  lw         $t0, 0x34($sp)
/* CD4D8 800CC8D8 14C00006 */  bnez       $a2, .L800CC8F4
/* CD4DC 800CC8DC 02002021 */   addu      $a0, $s0, $zero
/* CD4E0 800CC8E0 54E00005 */  bnel       $a3, $zero, .L800CC8F8
/* CD4E4 800CC8E4 AE050018 */   sw        $a1, 0x18($s0)
/* CD4E8 800CC8E8 AE020010 */  sw         $v0, 0x10($s0)
/* CD4EC 800CC8EC AE030014 */  sw         $v1, 0x14($s0)
/* CD4F0 800CC8F0 02002021 */  addu       $a0, $s0, $zero
.L800CC8F4:
/* CD4F4 800CC8F4 AE050018 */  sw         $a1, 0x18($s0)
.L800CC8F8:
/* CD4F8 800CC8F8 0C0346AA */  jal        __osInsertTimer
/* CD4FC 800CC8FC AE08001C */   sw        $t0, 0x1c($s0)
/* CD500 800CC900 3C04800F */  lui        $a0, %hi(__osTimerList)
/* CD504 800CC904 8C843CD0 */  lw         $a0, %lo(__osTimerList)($a0)
/* CD508 800CC908 8C840000 */  lw         $a0, ($a0)
/* CD50C 800CC90C 54900005 */  bnel       $a0, $s0, .L800CC924
/* CD510 800CC910 00001021 */   addu      $v0, $zero, $zero
/* CD514 800CC914 00402021 */  addu       $a0, $v0, $zero
/* CD518 800CC918 0C034692 */  jal        __osSetTimerIntr
/* CD51C 800CC91C 00602821 */   addu      $a1, $v1, $zero
/* CD520 800CC920 00001021 */  addu       $v0, $zero, $zero
.L800CC924:
/* CD524 800CC924 8FBF0014 */  lw         $ra, 0x14($sp)
/* CD528 800CC928 8FB00010 */  lw         $s0, 0x10($sp)
/* CD52C 800CC92C 03E00008 */  jr         $ra
/* CD530 800CC930 27BD0018 */   addiu     $sp, $sp, 0x18
/* CD534 800CC934 00000000 */  nop
/* CD538 800CC938 00000000 */  nop
/* CD53C 800CC93C 00000000 */  nop
