.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViSetSpecialFeatures
/* D2FF0 800D23F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2FF4 800D23F4 AFB00010 */  sw         $s0, 0x10($sp)
/* D2FF8 800D23F8 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2FFC 800D23FC 0C030D90 */  jal        __osDisableInt
/* D3000 800D2400 00808021 */   addu      $s0, $a0, $zero
/* D3004 800D2404 00403021 */  addu       $a2, $v0, $zero
/* D3008 800D2408 32020001 */  andi       $v0, $s0, 1
/* D300C 800D240C 10400007 */  beqz       $v0, .L800D242C
/* D3010 800D2410 32020002 */   andi      $v0, $s0, 2
/* D3014 800D2414 3C03800F */  lui        $v1, %hi(__osViNext)
/* D3018 800D2418 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D301C 800D241C 8C62000C */  lw         $v0, 0xc($v1)
/* D3020 800D2420 34420008 */  ori        $v0, $v0, 8
/* D3024 800D2424 AC62000C */  sw         $v0, 0xc($v1)
/* D3028 800D2428 32020002 */  andi       $v0, $s0, 2
.L800D242C:
/* D302C 800D242C 10400006 */  beqz       $v0, .L800D2448
/* D3030 800D2430 2404FFF7 */   addiu     $a0, $zero, -9
/* D3034 800D2434 3C02800F */  lui        $v0, %hi(__osViNext)
/* D3038 800D2438 8C423D44 */  lw         $v0, %lo(__osViNext)($v0)
/* D303C 800D243C 8C43000C */  lw         $v1, 0xc($v0)
/* D3040 800D2440 00641824 */  and        $v1, $v1, $a0
/* D3044 800D2444 AC43000C */  sw         $v1, 0xc($v0)
.L800D2448:
/* D3048 800D2448 32020004 */  andi       $v0, $s0, 4
/* D304C 800D244C 10400007 */  beqz       $v0, .L800D246C
/* D3050 800D2450 32020008 */   andi      $v0, $s0, 8
/* D3054 800D2454 3C03800F */  lui        $v1, %hi(__osViNext)
/* D3058 800D2458 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D305C 800D245C 8C62000C */  lw         $v0, 0xc($v1)
/* D3060 800D2460 34420004 */  ori        $v0, $v0, 4
/* D3064 800D2464 AC62000C */  sw         $v0, 0xc($v1)
/* D3068 800D2468 32020008 */  andi       $v0, $s0, 8
.L800D246C:
/* D306C 800D246C 10400006 */  beqz       $v0, .L800D2488
/* D3070 800D2470 2404FFFB */   addiu     $a0, $zero, -5
/* D3074 800D2474 3C02800F */  lui        $v0, %hi(__osViNext)
/* D3078 800D2478 8C423D44 */  lw         $v0, %lo(__osViNext)($v0)
/* D307C 800D247C 8C43000C */  lw         $v1, 0xc($v0)
/* D3080 800D2480 00641824 */  and        $v1, $v1, $a0
/* D3084 800D2484 AC43000C */  sw         $v1, 0xc($v0)
.L800D2488:
/* D3088 800D2488 32020010 */  andi       $v0, $s0, 0x10
/* D308C 800D248C 10400007 */  beqz       $v0, .L800D24AC
/* D3090 800D2490 32020020 */   andi      $v0, $s0, 0x20
/* D3094 800D2494 3C03800F */  lui        $v1, %hi(__osViNext)
/* D3098 800D2498 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D309C 800D249C 8C62000C */  lw         $v0, 0xc($v1)
/* D30A0 800D24A0 34420010 */  ori        $v0, $v0, 0x10
/* D30A4 800D24A4 AC62000C */  sw         $v0, 0xc($v1)
/* D30A8 800D24A8 32020020 */  andi       $v0, $s0, 0x20
.L800D24AC:
/* D30AC 800D24AC 10400006 */  beqz       $v0, .L800D24C8
/* D30B0 800D24B0 2404FFEF */   addiu     $a0, $zero, -0x11
/* D30B4 800D24B4 3C02800F */  lui        $v0, %hi(__osViNext)
/* D30B8 800D24B8 8C423D44 */  lw         $v0, %lo(__osViNext)($v0)
/* D30BC 800D24BC 8C43000C */  lw         $v1, 0xc($v0)
/* D30C0 800D24C0 00641824 */  and        $v1, $v1, $a0
/* D30C4 800D24C4 AC43000C */  sw         $v1, 0xc($v0)
.L800D24C8:
/* D30C8 800D24C8 32020040 */  andi       $v0, $s0, 0x40
/* D30CC 800D24CC 10400008 */  beqz       $v0, .L800D24F0
/* D30D0 800D24D0 3C030001 */   lui       $v1, 1
/* D30D4 800D24D4 3C04800F */  lui        $a0, %hi(__osViNext)
/* D30D8 800D24D8 8C843D44 */  lw         $a0, %lo(__osViNext)($a0)
/* D30DC 800D24DC 8C82000C */  lw         $v0, 0xc($a0)
/* D30E0 800D24E0 00431025 */  or         $v0, $v0, $v1
/* D30E4 800D24E4 2403FCFF */  addiu      $v1, $zero, -0x301
/* D30E8 800D24E8 00431024 */  and        $v0, $v0, $v1
/* D30EC 800D24EC AC82000C */  sw         $v0, 0xc($a0)
.L800D24F0:
/* D30F0 800D24F0 32020080 */  andi       $v0, $s0, 0x80
/* D30F4 800D24F4 1040000C */  beqz       $v0, .L800D2528
/* D30F8 800D24F8 3C02FFFE */   lui       $v0, 0xfffe
/* D30FC 800D24FC 3C04800F */  lui        $a0, %hi(__osViNext)
/* D3100 800D2500 8C843D44 */  lw         $a0, %lo(__osViNext)($a0)
/* D3104 800D2504 8C83000C */  lw         $v1, 0xc($a0)
/* D3108 800D2508 8C850008 */  lw         $a1, 8($a0)
/* D310C 800D250C 3442FFFF */  ori        $v0, $v0, 0xffff
/* D3110 800D2510 00621824 */  and        $v1, $v1, $v0
/* D3114 800D2514 AC83000C */  sw         $v1, 0xc($a0)
/* D3118 800D2518 8CA20004 */  lw         $v0, 4($a1)
/* D311C 800D251C 30420300 */  andi       $v0, $v0, 0x300
/* D3120 800D2520 00621825 */  or         $v1, $v1, $v0
/* D3124 800D2524 AC83000C */  sw         $v1, 0xc($a0)
.L800D2528:
/* D3128 800D2528 3C03800F */  lui        $v1, %hi(__osViNext)
/* D312C 800D252C 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D3130 800D2530 94620000 */  lhu        $v0, ($v1)
/* D3134 800D2534 00C02021 */  addu       $a0, $a2, $zero
/* D3138 800D2538 34420008 */  ori        $v0, $v0, 8
/* D313C 800D253C 0C030DAC */  jal        __osRestoreInt
/* D3140 800D2540 A4620000 */   sh        $v0, ($v1)
/* D3144 800D2544 8FBF0014 */  lw         $ra, 0x14($sp)
/* D3148 800D2548 8FB00010 */  lw         $s0, 0x10($sp)
/* D314C 800D254C 03E00008 */  jr         $ra
/* D3150 800D2550 27BD0018 */   addiu     $sp, $sp, 0x18
/* D3154 800D2554 00000000 */  nop
/* D3158 800D2558 00000000 */  nop
/* D315C 800D255C 00000000 */  nop
