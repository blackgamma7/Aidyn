.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel load_intro_music
/* 200F0 8001F4F0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 200F4 8001F4F4 3C04800E */  lui        $a0, %hi(gGlobals)
/* 200F8 8001F4F8 AFB00028 */  sw         $s0, 0x28($sp)
/* 200FC 8001F4FC 249068A8 */  addiu      $s0, $a0, %lo(gGlobals)
/* 20100 8001F500 24020001 */  addiu      $v0, $zero, 1
/* 20104 8001F504 3C03800E */  lui        $v1, %hi(ExpPakFlag)
/* 20108 8001F508 AFBF0030 */  sw         $ra, 0x30($sp)
/* 2010C 8001F50C AFB1002C */  sw         $s1, 0x2c($sp)
/* 20110 8001F510 AE020010 */  sw         $v0, 0x10($s0)
/* 20114 8001F514 946266C4 */  lhu        $v0, %lo(ExpPakFlag)($v1)
/* 20118 8001F518 00808821 */  addu       $s1, $a0, $zero
/* 2011C 8001F51C 10400002 */  beqz       $v0, .L8001F528
/* 20120 8001F520 240405D9 */   addiu     $a0, $zero, 0x5d9
/* 20124 8001F524 24040632 */  addiu      $a0, $zero, 0x632
.L8001F528:
/* 20128 8001F528 0C029BFC */  jal        load_borg_12
/* 2012C 8001F52C 00000000 */   nop
/* 20130 8001F530 AE020014 */  sw         $v0, 0x14($s0)
/* 20134 8001F534 263068A8 */  addiu      $s0, $s1, 0x68a8
/* 20138 8001F538 27A40020 */  addiu      $a0, $sp, 0x20
/* 2013C 8001F53C 24020080 */  addiu      $v0, $zero, 0x80
/* 20140 8001F540 27A50024 */  addiu      $a1, $sp, 0x24
/* 20144 8001F544 8E030014 */  lw         $v1, 0x14($s0)
/* 20148 8001F548 240700A5 */  addiu      $a3, $zero, 0xa5
/* 2014C 8001F54C 8C660008 */  lw         $a2, 8($v1)
/* 20150 8001F550 24030001 */  addiu      $v1, $zero, 1
/* 20154 8001F554 AFA20010 */  sw         $v0, 0x10($sp)
/* 20158 8001F558 2402FFFF */  addiu      $v0, $zero, -1
/* 2015C 8001F55C AFA30014 */  sw         $v1, 0x14($sp)
/* 20160 8001F560 AFA20018 */  sw         $v0, 0x18($sp)
/* 20164 8001F564 AFA0001C */  sw         $zero, 0x1c($sp)
/* 20168 8001F568 0C026895 */  jal        DCM_func
/* 2016C 8001F56C 24C60008 */   addiu     $a2, $a2, 8
/* 20170 8001F570 93A30020 */  lbu        $v1, 0x20($sp)
/* 20174 8001F574 8FA20024 */  lw         $v0, 0x24($sp)
/* 20178 8001F578 8FBF0030 */  lw         $ra, 0x30($sp)
/* 2017C 8001F57C 8FB1002C */  lw         $s1, 0x2c($sp)
/* 20180 8001F580 AE030018 */  sw         $v1, 0x18($s0)
/* 20184 8001F584 AE02001C */  sw         $v0, 0x1c($s0)
/* 20188 8001F588 8FB00028 */  lw         $s0, 0x28($sp)
/* 2018C 8001F58C 03E00008 */  jr         $ra
/* 20190 8001F590 27BD0038 */   addiu     $sp, $sp, 0x38

glabel appstate_0
/* 20194 8001F594 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 20198 8001F598 AFB50024 */  sw         $s5, 0x24($sp)
/* 2019C 8001F59C 0000A821 */  addu       $s5, $zero, $zero
/* 201A0 8001F5A0 AFB60028 */  sw         $s6, 0x28($sp)
/* 201A4 8001F5A4 0080B021 */  addu       $s6, $a0, $zero
/* 201A8 8001F5A8 AFBF002C */  sw         $ra, 0x2c($sp)
/* 201AC 8001F5AC AFB40020 */  sw         $s4, 0x20($sp)
/* 201B0 8001F5B0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 201B4 8001F5B4 AFB20018 */  sw         $s2, 0x18($sp)
/* 201B8 8001F5B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 201BC 8001F5BC AFB00010 */  sw         $s0, 0x10($sp)
/* 201C0 8001F5C0 3C11800E */  lui        $s1, 0x800e
/* 201C4 8001F5C4 3C13800F */  lui        $s3, 0x800f
/* 201C8 8001F5C8 08007D76 */  j          .L8001F5D8
/* 201CC 8001F5CC 3C14800F */   lui       $s4, 0x800f
.L8001F5D0:
/* 201D0 8001F5D0 0C02DBF7 */  jal        func_800B6FDC
/* 201D4 8001F5D4 24050001 */   addiu     $a1, $zero, 1
.L8001F5D8:
/* 201D8 8001F5D8 263068A8 */  addiu      $s0, $s1, 0x68a8
/* 201DC 8001F5DC 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 201E0 8001F5E0 8E041604 */   lw        $a0, 0x1604($s0)
/* 201E4 8001F5E4 5440FFFA */  bnel       $v0, $zero, .L8001F5D0
/* 201E8 8001F5E8 8E041604 */   lw        $a0, 0x1604($s0)
/* 201EC 8001F5EC 926298C0 */  lbu        $v0, -0x6740($s3)
/* 201F0 8001F5F0 10400004 */  beqz       $v0, .L8001F604
/* 201F4 8001F5F4 02009021 */   addu      $s2, $s0, $zero
/* 201F8 8001F5F8 0C007D3C */  jal        load_intro_music
/* 201FC 8001F5FC 00000000 */   nop
/* 20200 8001F600 A26098C0 */  sb         $zero, -0x6740($s3)
.L8001F604:
/* 20204 8001F604 8E420010 */  lw         $v0, 0x10($s2)
/* 20208 8001F608 24110001 */  addiu      $s1, $zero, 1
/* 2020C 8001F60C 54510006 */  bnel       $v0, $s1, .L8001F628
/* 20210 8001F610 8E020010 */   lw        $v0, 0x10($s0)
/* 20214 8001F614 0C007ED3 */  jal        show_splash_screens
/* 20218 8001F618 02C02021 */   addu      $a0, $s6, $zero
/* 2021C 8001F61C AE420010 */  sw         $v0, 0x10($s2)
/* 20220 8001F620 0000A821 */  addu       $s5, $zero, $zero
/* 20224 8001F624 8E020010 */  lw         $v0, 0x10($s0)
.L8001F628:
/* 20228 8001F628 14400004 */  bnez       $v0, .L8001F63C
/* 2022C 8001F62C 928298C1 */   lbu       $v0, -0x673f($s4)
/* 20230 8001F630 A29198C1 */  sb         $s1, -0x673f($s4)
/* 20234 8001F634 24150001 */  addiu      $s5, $zero, 1
/* 20238 8001F638 928298C1 */  lbu        $v0, -0x673f($s4)
.L8001F63C:
/* 2023C 8001F63C 10400006 */  beqz       $v0, .L8001F658
/* 20240 8001F640 02A01021 */   addu      $v0, $s5, $zero
/* 20244 8001F644 0C007DA0 */  jal        noop
/* 20248 8001F648 00000000 */   nop
/* 2024C 8001F64C A27198C0 */  sb         $s1, -0x6740($s3)
/* 20250 8001F650 A28098C1 */  sb         $zero, -0x673f($s4)
/* 20254 8001F654 02A01021 */  addu       $v0, $s5, $zero
.L8001F658:
/* 20258 8001F658 8FBF002C */  lw         $ra, 0x2c($sp)
/* 2025C 8001F65C 8FB60028 */  lw         $s6, 0x28($sp)
/* 20260 8001F660 8FB50024 */  lw         $s5, 0x24($sp)
/* 20264 8001F664 8FB40020 */  lw         $s4, 0x20($sp)
/* 20268 8001F668 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2026C 8001F66C 8FB20018 */  lw         $s2, 0x18($sp)
/* 20270 8001F670 8FB10014 */  lw         $s1, 0x14($sp)
/* 20274 8001F674 8FB00010 */  lw         $s0, 0x10($sp)
/* 20278 8001F678 03E00008 */  jr         $ra
/* 2027C 8001F67C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel noop
/* 20280 8001F680 03E00008 */  jr         $ra
/* 20284 8001F684 00000000 */   nop
/* 20288 8001F688 00000000 */  nop
/* 2028C 8001F68C 00000000 */  nop
