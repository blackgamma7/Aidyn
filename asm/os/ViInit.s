.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osViInit
/* D2940 800D1D40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2944 800D1D44 AFB00010 */  sw         $s0, 0x10($sp)
/* D2948 800D1D48 3C10800F */  lui        $s0, %hi(__osViCurr)
/* D294C 800D1D4C 26103CE0 */  addiu      $s0, $s0, %lo(__osViCurr)
/* D2950 800D1D50 02002021 */  addu       $a0, $s0, $zero
/* D2954 800D1D54 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2958 800D1D58 0C02F9AC */  jal        _bzero
/* D295C 800D1D5C 24050060 */   addiu     $a1, $zero, 0x60
/* D2960 800D1D60 3C038000 */  lui        $v1, %hi(osTvType)
/* D2964 800D1D64 8C630300 */  lw         $v1, %lo(osTvType)($v1)
/* D2968 800D1D68 3C01800F */  lui        $at, %hi(__osViCurr)
/* D296C 800D1D6C AC303D40 */  sw         $s0, %lo(__osViCurr)($at)
/* D2970 800D1D70 26100030 */  addiu      $s0, $s0, 0x30
/* D2974 800D1D74 24020001 */  addiu      $v0, $zero, 1
/* D2978 800D1D78 3C01800F */  lui        $at, %hi(__osViNext_800f3d10+0x2)
/* D297C 800D1D7C A4223D12 */  sh         $v0, %lo(__osViNext_800f3d10+0x2)($at)
/* D2980 800D1D80 3C01800F */  lui        $at, %hi(__osViCurr+0x2)
/* D2984 800D1D84 A4223CE2 */  sh         $v0, %lo(__osViCurr+0x2)($at)
/* D2988 800D1D88 3C028000 */  lui        $v0, 0x8000
/* D298C 800D1D8C 3C01800F */  lui        $at, %hi(__osViNext)
/* D2990 800D1D90 AC303D44 */  sw         $s0, %lo(__osViNext)($at)
/* D2994 800D1D94 3C01800F */  lui        $at, %hi(__osViNext_800f3d10+0x4)
/* D2998 800D1D98 AC223D14 */  sw         $v0, %lo(__osViNext_800f3d10+0x4)($at)
/* D299C 800D1D9C 3C01800F */  lui        $at, %hi(__osViCurr+0x4)
/* D29A0 800D1DA0 AC223CE4 */  sw         $v0, %lo(__osViCurr+0x4)($at)
/* D29A4 800D1DA4 14600004 */  bnez       $v1, .L800D1DB8
/* D29A8 800D1DA8 24020002 */   addiu     $v0, $zero, 2
/* D29AC 800D1DAC 3C02800F */  lui        $v0, %hi(osViModePalLan1)
/* D29B0 800D1DB0 08034775 */  j          .L800D1DD4
/* D29B4 800D1DB4 24423E10 */   addiu     $v0, $v0, %lo(osViModePalLan1)
.L800D1DB8:
/* D29B8 800D1DB8 14620004 */  bne        $v1, $v0, .L800D1DCC
/* D29BC 800D1DBC 00000000 */   nop
/* D29C0 800D1DC0 3C02800F */  lui        $v0, %hi(osViModeMpalLan1)
/* D29C4 800D1DC4 08034775 */  j          .L800D1DD4
/* D29C8 800D1DC8 24423D70 */   addiu     $v0, $v0, %lo(osViModeMpalLan1)
.L800D1DCC:
/* D29CC 800D1DCC 3C02800F */  lui        $v0, %hi(osViModeNtscLan1)
/* D29D0 800D1DD0 24423DC0 */  addiu      $v0, $v0, %lo(osViModeNtscLan1)
.L800D1DD4:
/* D29D4 800D1DD4 3C01800F */  lui        $at, %hi(__osViNext_800f3d10+0x8)
/* D29D8 800D1DD8 AC223D18 */  sw         $v0, %lo(__osViNext_800f3d10+0x8)($at)
/* D29DC 800D1DDC 3C03800F */  lui        $v1, %hi(__osViNext)
/* D29E0 800D1DE0 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D29E4 800D1DE4 8C640008 */  lw         $a0, 8($v1)
/* D29E8 800D1DE8 24020020 */  addiu      $v0, $zero, 0x20
/* D29EC 800D1DEC A4620000 */  sh         $v0, ($v1)
/* D29F0 800D1DF0 8C820004 */  lw         $v0, 4($a0)
/* D29F4 800D1DF4 3C04A440 */  lui        $a0, 0xa440
/* D29F8 800D1DF8 34840010 */  ori        $a0, $a0, 0x10
/* D29FC 800D1DFC AC62000C */  sw         $v0, 0xc($v1)
/* D2A00 800D1E00 8C820000 */  lw         $v0, ($a0)
/* D2A04 800D1E04 2C42000B */  sltiu      $v0, $v0, 0xb
/* D2A08 800D1E08 14400007 */  bnez       $v0, .L800D1E28
/* D2A0C 800D1E0C 3C02A440 */   lui       $v0, 0xa440
/* D2A10 800D1E10 3C03A440 */  lui        $v1, 0xa440
/* D2A14 800D1E14 34630010 */  ori        $v1, $v1, 0x10
.L800D1E18:
/* D2A18 800D1E18 8C620000 */  lw         $v0, ($v1)
/* D2A1C 800D1E1C 2C42000B */  sltiu      $v0, $v0, 0xb
/* D2A20 800D1E20 1040FFFD */  beqz       $v0, .L800D1E18
/* D2A24 800D1E24 3C02A440 */   lui       $v0, 0xa440
.L800D1E28:
/* D2A28 800D1E28 AC400000 */  sw         $zero, ($v0)
/* D2A2C 800D1E2C 0C03496C */  jal        __osViSwapContext
/* D2A30 800D1E30 00000000 */   nop
/* D2A34 800D1E34 8FBF0014 */  lw         $ra, 0x14($sp)
/* D2A38 800D1E38 8FB00010 */  lw         $s0, 0x10($sp)
/* D2A3C 800D1E3C 03E00008 */  jr         $ra
/* D2A40 800D1E40 27BD0018 */   addiu     $sp, $sp, 0x18
/* D2A44 800D1E44 00000000 */  nop
/* D2A48 800D1E48 00000000 */  nop
/* D2A4C 800D1E4C 00000000 */  nop
