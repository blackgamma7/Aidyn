.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80030300
/* 30F00 80030300 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 30F04 80030304 AFB00010 */  sw         $s0, 0x10($sp)
/* 30F08 80030308 00808021 */  addu       $s0, $a0, $zero
/* 30F0C 8003030C AFB10014 */  sw         $s1, 0x14($sp)
/* 30F10 80030310 00A08821 */  addu       $s1, $a1, $zero
/* 30F14 80030314 AFB20018 */  sw         $s2, 0x18($sp)
/* 30F18 80030318 AFBF001C */  sw         $ra, 0x1c($sp)
/* 30F1C 8003031C 0C02E658 */  jal        widget_menu_build
/* 30F20 80030320 00C09021 */   addu      $s2, $a2, $zero
/* 30F24 80030324 8FBF001C */  lw         $ra, 0x1c($sp)
/* 30F28 80030328 02001021 */  addu       $v0, $s0, $zero
/* 30F2C 8003032C AE120018 */  sw         $s2, 0x18($s0)
/* 30F30 80030330 8FB20018 */  lw         $s2, 0x18($sp)
/* 30F34 80030334 3C03800E */  lui        $v1, %hi(D_800DAE40)
/* 30F38 80030338 AE11007C */  sw         $s1, 0x7c($s0)
/* 30F3C 8003033C 8FB10014 */  lw         $s1, 0x14($sp)
/* 30F40 80030340 2463AE40 */  addiu      $v1, $v1, %lo(D_800DAE40)
/* 30F44 80030344 AE030078 */  sw         $v1, 0x78($s0)
/* 30F48 80030348 8FB00010 */  lw         $s0, 0x10($sp)
/* 30F4C 8003034C 03E00008 */  jr         $ra
/* 30F50 80030350 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80030354
/* 30F54 80030354 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 30F58 80030358 AFB00010 */  sw         $s0, 0x10($sp)
/* 30F5C 8003035C 00808021 */  addu       $s0, $a0, $zero
/* 30F60 80030360 3C02800E */  lui        $v0, %hi(D_800DAE40)
/* 30F64 80030364 2442AE40 */  addiu      $v0, $v0, %lo(D_800DAE40)
/* 30F68 80030368 AFB10014 */  sw         $s1, 0x14($sp)
/* 30F6C 8003036C 00A08821 */  addu       $s1, $a1, $zero
/* 30F70 80030370 AFBF0018 */  sw         $ra, 0x18($sp)
/* 30F74 80030374 0C02DF45 */  jal        widget_AButton
/* 30F78 80030378 AE020078 */   sw        $v0, 0x78($s0)
/* 30F7C 8003037C 02002021 */  addu       $a0, $s0, $zero
/* 30F80 80030380 0C02E66C */  jal        widget_menu_free
/* 30F84 80030384 02202821 */   addu      $a1, $s1, $zero
/* 30F88 80030388 8FBF0018 */  lw         $ra, 0x18($sp)
/* 30F8C 8003038C 8FB10014 */  lw         $s1, 0x14($sp)
/* 30F90 80030390 8FB00010 */  lw         $s0, 0x10($sp)
/* 30F94 80030394 03E00008 */  jr         $ra
/* 30F98 80030398 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003039C
/* 30F9C 8003039C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 30FA0 800303A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 30FA4 800303A4 00808021 */  addu       $s0, $a0, $zero
/* 30FA8 800303A8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 30FAC 800303AC 8E02007C */  lw         $v0, 0x7c($s0)
/* 30FB0 800303B0 14400005 */  bnez       $v0, .L800303C8
/* 30FB4 800303B4 2442FFFF */   addiu     $v0, $v0, -1
/* 30FB8 800303B8 0C02DEC8 */  jal        set_widgets_byte0x70
/* 30FBC 800303BC 24050005 */   addiu     $a1, $zero, 5
/* 30FC0 800303C0 0800C0F3 */  j          .L800303CC
/* 30FC4 800303C4 00000000 */   nop
.L800303C8:
/* 30FC8 800303C8 AE02007C */  sw         $v0, 0x7c($s0)
.L800303CC:
/* 30FCC 800303CC 0C02E683 */  jal        func_800B9A0C
/* 30FD0 800303D0 02002021 */   addu      $a0, $s0, $zero
/* 30FD4 800303D4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 30FD8 800303D8 8FB00010 */  lw         $s0, 0x10($sp)
/* 30FDC 800303DC 03E00008 */  jr         $ra
/* 30FE0 800303E0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret0_800303e4
/* 30FE4 800303E4 03E00008 */  jr         $ra
/* 30FE8 800303E8 00001021 */   addu      $v0, $zero, $zero
/* 30FEC 800303EC 00000000 */  nop
