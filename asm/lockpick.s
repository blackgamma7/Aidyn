.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel lockpicking_check
/* 31F20 80031320 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 31F24 80031324 AFB20018 */  sw         $s2, 0x18($sp)
/* 31F28 80031328 00809021 */  addu       $s2, $a0, $zero
/* 31F2C 8003132C AFBF001C */  sw         $ra, 0x1c($sp)
/* 31F30 80031330 AFB10014 */  sw         $s1, 0x14($sp)
/* 31F34 80031334 AFB00010 */  sw         $s0, 0x10($sp)
/* 31F38 80031338 96430016 */  lhu        $v1, 0x16($s2)
/* 31F3C 8003133C 24040007 */  addiu      $a0, $zero, 7
/* 31F40 80031340 10640003 */  beq        $v1, $a0, .L80031350
/* 31F44 80031344 24020001 */   addiu     $v0, $zero, 1
/* 31F48 80031348 1462001C */  bne        $v1, $v0, .L800313BC
/* 31F4C 8003134C 8FBF001C */   lw        $ra, 0x1c($sp)
.L80031350:
/* 31F50 80031350 24020001 */  addiu      $v0, $zero, 1
/* 31F54 80031354 14620002 */  bne        $v1, $v0, .L80031360
/* 31F58 80031358 00008821 */   addu      $s1, $zero, $zero
/* 31F5C 8003135C 2651003C */  addiu      $s1, $s2, 0x3c
.L80031360:
/* 31F60 80031360 50640001 */  beql       $v1, $a0, .L80031368
/* 31F64 80031364 26510034 */   addiu     $s1, $s2, 0x34
.L80031368:
/* 31F68 80031368 3C02800E */  lui        $v0, %hi(gGlobals)
/* 31F6C 8003136C 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 31F70 80031370 24502078 */  addiu      $s0, $v0, 0x2078
/* 31F74 80031374 8C4415F8 */  lw         $a0, 0x15f8($v0)
/* 31F78 80031378 92250001 */  lbu        $a1, 1($s1)
/* 31F7C 8003137C 0C020558 */  jal        lockpicking_func
/* 31F80 80031380 02003021 */   addu      $a2, $s0, $zero
/* 31F84 80031384 1040000A */  beqz       $v0, .L800313B0
/* 31F88 80031388 00000000 */   nop
/* 31F8C 8003138C 0C0053D0 */  jal        textbox_func
/* 31F90 80031390 02002021 */   addu      $a0, $s0, $zero
/* 31F94 80031394 3C038003 */  lui        $v1, %hi(func_800313D0)
/* 31F98 80031398 246313D0 */  addiu      $v1, $v1, %lo(func_800313D0)
/* 31F9C 8003139C AC43001C */  sw         $v1, 0x1c($v0)
/* 31FA0 800313A0 AC430018 */  sw         $v1, 0x18($v0)
/* 31FA4 800313A4 AC520040 */  sw         $s2, 0x40($v0)
/* 31FA8 800313A8 0800C4EE */  j          .L800313B8
/* 31FAC 800313AC A6200000 */   sh        $zero, ($s1)
.L800313B0:
/* 31FB0 800313B0 0C0053D0 */  jal        textbox_func
/* 31FB4 800313B4 02002021 */   addu      $a0, $s0, $zero
.L800313B8:
/* 31FB8 800313B8 8FBF001C */  lw         $ra, 0x1c($sp)
.L800313BC:
/* 31FBC 800313BC 8FB20018 */  lw         $s2, 0x18($sp)
/* 31FC0 800313C0 8FB10014 */  lw         $s1, 0x14($sp)
/* 31FC4 800313C4 8FB00010 */  lw         $s0, 0x10($sp)
/* 31FC8 800313C8 03E00008 */  jr         $ra
/* 31FCC 800313CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800313D0
/* 31FD0 800313D0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 31FD4 800313D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 31FD8 800313D8 00A08021 */  addu       $s0, $a1, $zero
/* 31FDC 800313DC 02002021 */  addu       $a0, $s0, $zero
/* 31FE0 800313E0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 31FE4 800313E4 0C02DEC8 */  jal        set_widgets_byte0x70
/* 31FE8 800313E8 24050005 */   addiu     $a1, $zero, 5
/* 31FEC 800313EC 8E100040 */  lw         $s0, 0x40($s0)
/* 31FF0 800313F0 3C02800E */  lui        $v0, %hi(PlayerCharStruct+0x30)
/* 31FF4 800313F4 1200000C */  beqz       $s0, .L80031428
/* 31FF8 800313F8 AC406980 */   sw        $zero, %lo(PlayerCharStruct+0x30)($v0)
/* 31FFC 800313FC 96030016 */  lhu        $v1, 0x16($s0)
/* 32000 80031400 24020007 */  addiu      $v0, $zero, 7
/* 32004 80031404 14620005 */  bne        $v1, $v0, .L8003141C
/* 32008 80031408 02002021 */   addu      $a0, $s0, $zero
/* 3200C 8003140C 9604003A */  lhu        $a0, 0x3a($s0)
/* 32010 80031410 0C00918D */  jal        setEventFlag
/* 32014 80031414 24050001 */   addiu     $a1, $zero, 1
/* 32018 80031418 02002021 */  addu       $a0, $s0, $zero
.L8003141C:
/* 3201C 8003141C 24057FFF */  addiu      $a1, $zero, 0x7fff
/* 32020 80031420 0C004E4D */  jal        run_voxelFuncs0
/* 32024 80031424 00003021 */   addu      $a2, $zero, $zero
.L80031428:
/* 32028 80031428 00001021 */  addu       $v0, $zero, $zero
/* 3202C 8003142C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 32030 80031430 8FB00010 */  lw         $s0, 0x10($sp)
/* 32034 80031434 03E00008 */  jr         $ra
/* 32038 80031438 27BD0018 */   addiu     $sp, $sp, 0x18
/* 3203C 8003143C 00000000 */  nop
