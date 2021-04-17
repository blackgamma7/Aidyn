.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel lookforExpansionPak
/* 8D20 80008120 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8D24 80008124 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D28 80008128 00808821 */  addu       $s1, $a0, $zero
/* 8D2C 8000812C AFB00010 */  sw         $s0, 0x10($sp)
/* 8D30 80008130 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8D34 80008134 0C030BF4 */  jal        osGetMemSize
/* 8D38 80008138 00A08021 */   addu      $s0, $a1, $zero
/* 8D3C 8000813C 3C04800E */  lui        $a0, %hi(D_800E6698)
/* 8D40 80008140 24866698 */  addiu      $a2, $a0, %lo(D_800E6698)
/* 8D44 80008144 3C030040 */  lui        $v1, 0x40
/* 8D48 80008148 0062182B */  sltu       $v1, $v1, $v0
/* 8D4C 8000814C 00803821 */  addu       $a3, $a0, $zero
/* 8D50 80008150 ACC20014 */  sw         $v0, 0x14($a2)
/* 8D54 80008154 10600009 */  beqz       $v1, .L8000817C
/* 8D58 80008158 ACD00018 */   sw        $s0, 0x18($a2)
/* 8D5C 8000815C 3C020004 */  lui        $v0, 4
/* 8D60 80008160 3442B000 */  ori        $v0, $v0, 0xb000
/* 8D64 80008164 3C03800E */  lui        $v1, %hi(ExpPakFlag)
/* 8D68 80008168 ACC2001C */  sw         $v0, 0x1c($a2)
/* 8D6C 8000816C ACC20024 */  sw         $v0, 0x24($a2)
/* 8D70 80008170 24020001 */  addiu      $v0, $zero, 1
/* 8D74 80008174 08002065 */  j          .L80008194
/* 8D78 80008178 A46266C4 */   sh        $v0, %lo(ExpPakFlag)($v1)
.L8000817C:
/* 8D7C 8000817C 3C020002 */  lui        $v0, 2
/* 8D80 80008180 34425800 */  ori        $v0, $v0, 0x5800
/* 8D84 80008184 3C03800E */  lui        $v1, %hi(ExpPakFlag)
/* 8D88 80008188 ACC2001C */  sw         $v0, 0x1c($a2)
/* 8D8C 8000818C ACC20024 */  sw         $v0, 0x24($a2)
/* 8D90 80008190 A46066C4 */  sh         $zero, %lo(ExpPakFlag)($v1)
.L80008194:
/* 8D94 80008194 24E56698 */  addiu      $a1, $a3, 0x6698
/* 8D98 80008198 2402FFC0 */  addiu      $v0, $zero, -0x40
/* 8D9C 8000819C 8CA40018 */  lw         $a0, 0x18($a1)
/* 8DA0 800081A0 3C068000 */  lui        $a2, 0x8000
/* 8DA4 800081A4 ACF16698 */  sw         $s1, 0x6698($a3)
/* 8DA8 800081A8 8CA70024 */  lw         $a3, 0x24($a1)
/* 8DAC 800081AC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8DB0 800081B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 8DB4 800081B4 02242021 */  addu       $a0, $s1, $a0
/* 8DB8 800081B8 00822024 */  and        $a0, $a0, $v0
/* 8DBC 800081BC 24840040 */  addiu      $a0, $a0, 0x40
/* 8DC0 800081C0 00071840 */  sll        $v1, $a3, 1
/* 8DC4 800081C4 8CA20014 */  lw         $v0, 0x14($a1)
/* 8DC8 800081C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 8DCC 800081CC 00661821 */  addu       $v1, $v1, $a2
/* 8DD0 800081D0 ACA40004 */  sw         $a0, 4($a1)
/* 8DD4 800081D4 00431023 */  subu       $v0, $v0, $v1
/* 8DD8 800081D8 8CA3001C */  lw         $v1, 0x1c($a1)
/* 8DDC 800081DC 00473821 */  addu       $a3, $v0, $a3
/* 8DE0 800081E0 ACA2000C */  sw         $v0, 0xc($a1)
/* 8DE4 800081E4 ACA70010 */  sw         $a3, 0x10($a1)
/* 8DE8 800081E8 00832021 */  addu       $a0, $a0, $v1
/* 8DEC 800081EC 00441023 */  subu       $v0, $v0, $a0
/* 8DF0 800081F0 ACA40008 */  sw         $a0, 8($a1)
/* 8DF4 800081F4 ACA20020 */  sw         $v0, 0x20($a1)
/* 8DF8 800081F8 03E00008 */  jr         $ra
/* 8DFC 800081FC 27BD0020 */   addiu     $sp, $sp, 0x20
