.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel setBorgFlag
/* A3060 800A2460 3C03800F */  lui        $v1, %hi(borgFlag)
/* A3064 800A2464 24020001 */  addiu      $v0, $zero, 1
/* A3068 800A2468 03E00008 */  jr         $ra
/* A306C 800A246C AC6233D0 */   sw        $v0, %lo(borgFlag)($v1)

glabel clearBorgFlag
/* A3070 800A2470 3C02800F */  lui        $v0, %hi(borgFlag)
/* A3074 800A2474 03E00008 */  jr         $ra
/* A3078 800A2478 AC4033D0 */   sw        $zero, %lo(borgFlag)($v0)

glabel func_800A247C
/* A307C 800A247C 3C03800F */  lui        $v1, %hi(borgTotal)
/* A3080 800A2480 03E00008 */  jr         $ra
/* A3084 800A2484 8C623514 */   lw        $v0, %lo(borgTotal)($v1)

glabel set_borg_mem_things
/* A3088 800A2488 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* A308C 800A248C 00801821 */  addu       $v1, $a0, $zero
/* A3090 800A2490 27A40018 */  addiu      $a0, $sp, 0x18
/* A3094 800A2494 3C02800F */  lui        $v0, %hi(borg_files)
/* A3098 800A2498 AC453510 */  sw         $a1, %lo(borg_files)($v0)
/* A309C 800A249C 00602821 */  addu       $a1, $v1, $zero
/* A30A0 800A24A0 24060008 */  addiu      $a2, $zero, 8
/* A30A4 800A24A4 3C02800F */  lui        $v0, %hi(borg_listing)
/* A30A8 800A24A8 AFB00058 */  sw         $s0, 0x58($sp)
/* A30AC 800A24AC 3C10800E */  lui        $s0, %hi(D_800E3120)
/* A30B0 800A24B0 26103120 */  addiu      $s0, $s0, %lo(D_800E3120)
/* A30B4 800A24B4 AC43350C */  sw         $v1, %lo(borg_listing)($v0)
/* A30B8 800A24B8 240200FC */  addiu      $v0, $zero, 0xfc
/* A30BC 800A24BC 24070001 */  addiu      $a3, $zero, 1
/* A30C0 800A24C0 AFBF005C */  sw         $ra, 0x5c($sp)
/* A30C4 800A24C4 AFB00010 */  sw         $s0, 0x10($sp)
/* A30C8 800A24C8 0C027269 */  jal        RomCopy
/* A30CC 800A24CC AFA20014 */   sw        $v0, 0x14($sp)
/* A30D0 800A24D0 02002821 */  addu       $a1, $s0, $zero
/* A30D4 800A24D4 2406010A */  addiu      $a2, $zero, 0x10a
/* A30D8 800A24D8 8FA30018 */  lw         $v1, 0x18($sp)
/* A30DC 800A24DC 3C02800F */  lui        $v0, %hi(borgTotal)
/* A30E0 800A24E0 00032080 */  sll        $a0, $v1, 2
/* A30E4 800A24E4 0C025F9C */  jal        Malloc
/* A30E8 800A24E8 AC433514 */   sw        $v1, %lo(borgTotal)($v0)
/* A30EC 800A24EC 00402021 */  addu       $a0, $v0, $zero
/* A30F0 800A24F0 00002821 */  addu       $a1, $zero, $zero
/* A30F4 800A24F4 8FA60018 */  lw         $a2, 0x18($sp)
/* A30F8 800A24F8 3C03800F */  lui        $v1, %hi(borg_index_x4)
/* A30FC 800A24FC AC623504 */  sw         $v0, %lo(borg_index_x4)($v1)
/* A3100 800A2500 0C026380 */  jal        Calloc
/* A3104 800A2504 00063080 */   sll       $a2, $a2, 2
/* A3108 800A2508 02002821 */  addu       $a1, $s0, $zero
/* A310C 800A250C 8FA40018 */  lw         $a0, 0x18($sp)
/* A3110 800A2510 0C025F9C */  jal        Malloc
/* A3114 800A2514 2406010D */   addiu     $a2, $zero, 0x10d
/* A3118 800A2518 00402021 */  addu       $a0, $v0, $zero
/* A311C 800A251C 00002821 */  addu       $a1, $zero, $zero
/* A3120 800A2520 8FA60018 */  lw         $a2, 0x18($sp)
/* A3124 800A2524 3C03800F */  lui        $v1, %hi(borg_index_x1)
/* A3128 800A2528 0C026380 */  jal        Calloc
/* A312C 800A252C AC623508 */   sw        $v0, %lo(borg_index_x1)($v1)
/* A3130 800A2530 3C04800F */  lui        $a0, %hi(borg_mem)
/* A3134 800A2534 2484348C */  addiu      $a0, $a0, %lo(borg_mem)
/* A3138 800A2538 00002821 */  addu       $a1, $zero, $zero
/* A313C 800A253C 0C026380 */  jal        Calloc
/* A3140 800A2540 2406003C */   addiu     $a2, $zero, 0x3c
/* A3144 800A2544 3C04800F */  lui        $a0, %hi(borg_count)
/* A3148 800A2548 248434C8 */  addiu      $a0, $a0, %lo(borg_count)
/* A314C 800A254C 00002821 */  addu       $a1, $zero, $zero
/* A3150 800A2550 0C026380 */  jal        Calloc
/* A3154 800A2554 2406003C */   addiu     $a2, $zero, 0x3c
/* A3158 800A2558 8FBF005C */  lw         $ra, 0x5c($sp)
/* A315C 800A255C 8FB00058 */  lw         $s0, 0x58($sp)
/* A3160 800A2560 03E00008 */  jr         $ra
/* A3164 800A2564 27BD0060 */   addiu     $sp, $sp, 0x60

glabel decompressBorg
/* A3168 800A2568 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* A316C 800A256C AFB3002C */  sw         $s3, 0x2c($sp)
/* A3170 800A2570 00809821 */  addu       $s3, $a0, $zero
/* A3174 800A2574 AFB20028 */  sw         $s2, 0x28($sp)
/* A3178 800A2578 00A09021 */  addu       $s2, $a1, $zero
/* A317C 800A257C AFB40030 */  sw         $s4, 0x30($sp)
/* A3180 800A2580 00C0A021 */  addu       $s4, $a2, $zero
/* A3184 800A2584 AFB50034 */  sw         $s5, 0x34($sp)
/* A3188 800A2588 00E0A821 */  addu       $s5, $a3, $zero
/* A318C 800A258C 8FA30050 */  lw         $v1, 0x50($sp)
/* A3190 800A2590 24020001 */  addiu      $v0, $zero, 1
/* A3194 800A2594 AFBF0038 */  sw         $ra, 0x38($sp)
/* A3198 800A2598 AFB10024 */  sw         $s1, 0x24($sp)
/* A319C 800A259C 10620018 */  beq        $v1, $v0, .L800A2600
/* A31A0 800A25A0 AFB00020 */   sw        $s0, 0x20($sp)
/* A31A4 800A25A4 28620002 */  slti       $v0, $v1, 2
/* A31A8 800A25A8 10400005 */  beqz       $v0, .L800A25C0
/* A31AC 800A25AC 24020002 */   addiu     $v0, $zero, 2
/* A31B0 800A25B0 10600007 */  beqz       $v1, .L800A25D0
/* A31B4 800A25B4 8FBF0038 */   lw        $ra, 0x38($sp)
/* A31B8 800A25B8 080289B8 */  j          .L800A26E0
/* A31BC 800A25BC 8FB50034 */   lw        $s5, 0x34($sp)
.L800A25C0:
/* A31C0 800A25C0 1062002B */  beq        $v1, $v0, .L800A2670
/* A31C4 800A25C4 8FBF0038 */   lw        $ra, 0x38($sp)
/* A31C8 800A25C8 080289B8 */  j          .L800A26E0
/* A31CC 800A25CC 8FB50034 */   lw        $s5, 0x34($sp)
.L800A25D0:
/* A31D0 800A25D0 02802021 */  addu       $a0, $s4, $zero
/* A31D4 800A25D4 02602821 */  addu       $a1, $s3, $zero
/* A31D8 800A25D8 02403021 */  addu       $a2, $s2, $zero
/* A31DC 800A25DC 24070001 */  addiu      $a3, $zero, 1
/* A31E0 800A25E0 3C02800E */  lui        $v0, %hi(D_800E3120)
/* A31E4 800A25E4 24423120 */  addiu      $v0, $v0, %lo(D_800E3120)
/* A31E8 800A25E8 24030175 */  addiu      $v1, $zero, 0x175
/* A31EC 800A25EC AFA20010 */  sw         $v0, 0x10($sp)
/* A31F0 800A25F0 0C027269 */  jal        RomCopy
/* A31F4 800A25F4 AFA30014 */   sw        $v1, 0x14($sp)
/* A31F8 800A25F8 080289B7 */  j          .L800A26DC
/* A31FC 800A25FC 8FBF0038 */   lw        $ra, 0x38($sp)
.L800A2600:
/* A3200 800A2600 02402021 */  addu       $a0, $s2, $zero
/* A3204 800A2604 3C10800E */  lui        $s0, %hi(D_800E3120)
/* A3208 800A2608 26103120 */  addiu      $s0, $s0, %lo(D_800E3120)
/* A320C 800A260C 02002821 */  addu       $a1, $s0, $zero
/* A3210 800A2610 0C025F9C */  jal        Malloc
/* A3214 800A2614 2406017F */   addiu     $a2, $zero, 0x17f
/* A3218 800A2618 00408821 */  addu       $s1, $v0, $zero
/* A321C 800A261C 02202021 */  addu       $a0, $s1, $zero
/* A3220 800A2620 02602821 */  addu       $a1, $s3, $zero
/* A3224 800A2624 02403021 */  addu       $a2, $s2, $zero
/* A3228 800A2628 24070001 */  addiu      $a3, $zero, 1
/* A322C 800A262C 24020183 */  addiu      $v0, $zero, 0x183
/* A3230 800A2630 AFB00010 */  sw         $s0, 0x10($sp)
/* A3234 800A2634 0C027269 */  jal        RomCopy
/* A3238 800A2638 AFA20014 */   sw        $v0, 0x14($sp)
/* A323C 800A263C 02202021 */  addu       $a0, $s1, $zero
/* A3240 800A2640 02402821 */  addu       $a1, $s2, $zero
/* A3244 800A2644 02803021 */  addu       $a2, $s4, $zero
/* A3248 800A2648 27A70018 */  addiu      $a3, $sp, 0x18
/* A324C 800A264C AFB50018 */  sw         $s5, 0x18($sp)
/* A3250 800A2650 0C02A73B */  jal        decompress_LZ01
/* A3254 800A2654 AFA00010 */   sw        $zero, 0x10($sp)
/* A3258 800A2658 02202021 */  addu       $a0, $s1, $zero
/* A325C 800A265C 02002821 */  addu       $a1, $s0, $zero
/* A3260 800A2660 0C02600C */  jal        Free
/* A3264 800A2664 2406018D */   addiu     $a2, $zero, 0x18d
/* A3268 800A2668 080289B7 */  j          .L800A26DC
/* A326C 800A266C 8FBF0038 */   lw        $ra, 0x38($sp)
.L800A2670:
/* A3270 800A2670 02402021 */  addu       $a0, $s2, $zero
/* A3274 800A2674 3C10800E */  lui        $s0, %hi(D_800E3120)
/* A3278 800A2678 26103120 */  addiu      $s0, $s0, %lo(D_800E3120)
/* A327C 800A267C 02002821 */  addu       $a1, $s0, $zero
/* A3280 800A2680 0C025F9C */  jal        Malloc
/* A3284 800A2684 24060197 */   addiu     $a2, $zero, 0x197
/* A3288 800A2688 00408821 */  addu       $s1, $v0, $zero
/* A328C 800A268C 02202021 */  addu       $a0, $s1, $zero
/* A3290 800A2690 02602821 */  addu       $a1, $s3, $zero
/* A3294 800A2694 02403021 */  addu       $a2, $s2, $zero
/* A3298 800A2698 24070001 */  addiu      $a3, $zero, 1
/* A329C 800A269C 2402019B */  addiu      $v0, $zero, 0x19b
/* A32A0 800A26A0 AFB00010 */  sw         $s0, 0x10($sp)
/* A32A4 800A26A4 0C027269 */  jal        RomCopy
/* A32A8 800A26A8 AFA20014 */   sw        $v0, 0x14($sp)
/* A32AC 800A26AC 02202021 */  addu       $a0, $s1, $zero
/* A32B0 800A26B0 02402821 */  addu       $a1, $s2, $zero
/* A32B4 800A26B4 02803021 */  addu       $a2, $s4, $zero
/* A32B8 800A26B8 27A70018 */  addiu      $a3, $sp, 0x18
/* A32BC 800A26BC AFB50018 */  sw         $s5, 0x18($sp)
/* A32C0 800A26C0 0C02A8E4 */  jal        decompress_LZB
/* A32C4 800A26C4 AFA00010 */   sw        $zero, 0x10($sp)
/* A32C8 800A26C8 02202021 */  addu       $a0, $s1, $zero
/* A32CC 800A26CC 02002821 */  addu       $a1, $s0, $zero
/* A32D0 800A26D0 0C02600C */  jal        Free
/* A32D4 800A26D4 240601A5 */   addiu     $a2, $zero, 0x1a5
/* A32D8 800A26D8 8FBF0038 */  lw         $ra, 0x38($sp)
.L800A26DC:
/* A32DC 800A26DC 8FB50034 */  lw         $s5, 0x34($sp)
.L800A26E0:
/* A32E0 800A26E0 8FB40030 */  lw         $s4, 0x30($sp)
/* A32E4 800A26E4 8FB3002C */  lw         $s3, 0x2c($sp)
/* A32E8 800A26E8 8FB20028 */  lw         $s2, 0x28($sp)
/* A32EC 800A26EC 8FB10024 */  lw         $s1, 0x24($sp)
/* A32F0 800A26F0 8FB00020 */  lw         $s0, 0x20($sp)
/* A32F4 800A26F4 24020001 */  addiu      $v0, $zero, 1
/* A32F8 800A26F8 03E00008 */  jr         $ra
/* A32FC 800A26FC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel get_borg_listing
/* A3300 800A2700 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* A3304 800A2704 AFB00098 */  sw         $s0, 0x98($sp)
/* A3308 800A2708 00808021 */  addu       $s0, $a0, $zero
/* A330C 800A270C 27A40058 */  addiu      $a0, $sp, 0x58
/* A3310 800A2710 24060008 */  addiu      $a2, $zero, 8
/* A3314 800A2714 24070001 */  addiu      $a3, $zero, 1
/* A3318 800A2718 AFB200A0 */  sw         $s2, 0xa0($sp)
/* A331C 800A271C 3C12800F */  lui        $s2, %hi(borg_listing)
/* A3320 800A2720 3C02800E */  lui        $v0, %hi(D_800E3120)
/* A3324 800A2724 AFB1009C */  sw         $s1, 0x9c($sp)
/* A3328 800A2728 24513120 */  addiu      $s1, $v0, %lo(D_800E3120)
/* A332C 800A272C 8E45350C */  lw         $a1, %lo(borg_listing)($s2)
/* A3330 800A2730 240201BE */  addiu      $v0, $zero, 0x1be
/* A3334 800A2734 AFBF00A4 */  sw         $ra, 0xa4($sp)
/* A3338 800A2738 AFB10010 */  sw         $s1, 0x10($sp)
/* A333C 800A273C 0C027269 */  jal        RomCopy
/* A3340 800A2740 AFA20014 */   sw        $v0, 0x14($sp)
/* A3344 800A2744 06000004 */  bltz       $s0, .L800A2758
/* A3348 800A2748 8FA20058 */   lw        $v0, 0x58($sp)
/* A334C 800A274C 0202102A */  slt        $v0, $s0, $v0
/* A3350 800A2750 14400003 */  bnez       $v0, .L800A2760
/* A3354 800A2754 27A40018 */   addiu     $a0, $sp, 0x18
.L800A2758:
/* A3358 800A2758 080289E3 */  j          .L800A278C
/* A335C 800A275C 2402FFFF */   addiu     $v0, $zero, -1
.L800A2760:
/* A3360 800A2760 24060010 */  addiu      $a2, $zero, 0x10
/* A3364 800A2764 24070001 */  addiu      $a3, $zero, 1
/* A3368 800A2768 8E45350C */  lw         $a1, 0x350c($s2)
/* A336C 800A276C 240201C6 */  addiu      $v0, $zero, 0x1c6
/* A3370 800A2770 AFA20014 */  sw         $v0, 0x14($sp)
/* A3374 800A2774 00101100 */  sll        $v0, $s0, 4
/* A3378 800A2778 AFB10010 */  sw         $s1, 0x10($sp)
/* A337C 800A277C 00A22821 */  addu       $a1, $a1, $v0
/* A3380 800A2780 0C027269 */  jal        RomCopy
/* A3384 800A2784 24A50008 */   addiu     $a1, $a1, 8
/* A3388 800A2788 87A20018 */  lh         $v0, 0x18($sp)
.L800A278C:
/* A338C 800A278C 8FBF00A4 */  lw         $ra, 0xa4($sp)
/* A3390 800A2790 8FB200A0 */  lw         $s2, 0xa0($sp)
/* A3394 800A2794 8FB1009C */  lw         $s1, 0x9c($sp)
/* A3398 800A2798 8FB00098 */  lw         $s0, 0x98($sp)
/* A339C 800A279C 03E00008 */  jr         $ra
/* A33A0 800A27A0 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel GetBorgItemInfo
/* A33A4 800A27A4 27BDFF90 */  addiu      $sp, $sp, -0x70
/* A33A8 800A27A8 AFB20060 */  sw         $s2, 0x60($sp)
/* A33AC 800A27AC 00809021 */  addu       $s2, $a0, $zero
/* A33B0 800A27B0 AFB00058 */  sw         $s0, 0x58($sp)
/* A33B4 800A27B4 00A08021 */  addu       $s0, $a1, $zero
/* A33B8 800A27B8 32420007 */  andi       $v0, $s2, 7
/* A33BC 800A27BC AFBF0068 */  sw         $ra, 0x68($sp)
/* A33C0 800A27C0 AFB30064 */  sw         $s3, 0x64($sp)
/* A33C4 800A27C4 10400006 */  beqz       $v0, .L800A27E0
/* A33C8 800A27C8 AFB1005C */   sw        $s1, 0x5c($sp)
/* A33CC 800A27CC 3C04800E */  lui        $a0, %hi(D_800E3134)
/* A33D0 800A27D0 24843134 */  addiu      $a0, $a0, %lo(D_800E3134)
/* A33D4 800A27D4 3C05800E */  lui        $a1, %hi(D_800E3154)
/* A33D8 800A27D8 0C025F2D */  jal        manualCrash
/* A33DC 800A27DC 24A53154 */   addiu     $a1, $a1, %lo(D_800E3154)
.L800A27E0:
/* A33E0 800A27E0 27A40018 */  addiu      $a0, $sp, 0x18
/* A33E4 800A27E4 24060008 */  addiu      $a2, $zero, 8
/* A33E8 800A27E8 24070001 */  addiu      $a3, $zero, 1
/* A33EC 800A27EC 3C13800F */  lui        $s3, %hi(borg_listing)
/* A33F0 800A27F0 3C02800E */  lui        $v0, %hi(D_800E3120)
/* A33F4 800A27F4 24513120 */  addiu      $s1, $v0, %lo(D_800E3120)
/* A33F8 800A27F8 8E65350C */  lw         $a1, %lo(borg_listing)($s3)
/* A33FC 800A27FC 240201DC */  addiu      $v0, $zero, 0x1dc
/* A3400 800A2800 AFB10010 */  sw         $s1, 0x10($sp)
/* A3404 800A2804 0C027269 */  jal        RomCopy
/* A3408 800A2808 AFA20014 */   sw        $v0, 0x14($sp)
/* A340C 800A280C 06000004 */  bltz       $s0, .L800A2820
/* A3410 800A2810 8FA20018 */   lw        $v0, 0x18($sp)
/* A3414 800A2814 0202102A */  slt        $v0, $s0, $v0
/* A3418 800A2818 14400003 */  bnez       $v0, .L800A2828
/* A341C 800A281C 02402021 */   addu      $a0, $s2, $zero
.L800A2820:
/* A3420 800A2820 08028A15 */  j          .L800A2854
/* A3424 800A2824 2402FFFF */   addiu     $v0, $zero, -1
.L800A2828:
/* A3428 800A2828 24060010 */  addiu      $a2, $zero, 0x10
/* A342C 800A282C 24070001 */  addiu      $a3, $zero, 1
/* A3430 800A2830 8E65350C */  lw         $a1, 0x350c($s3)
/* A3434 800A2834 240201E8 */  addiu      $v0, $zero, 0x1e8
/* A3438 800A2838 AFA20014 */  sw         $v0, 0x14($sp)
/* A343C 800A283C 00101100 */  sll        $v0, $s0, 4
/* A3440 800A2840 AFB10010 */  sw         $s1, 0x10($sp)
/* A3444 800A2844 00A22821 */  addu       $a1, $a1, $v0
/* A3448 800A2848 0C027269 */  jal        RomCopy
/* A344C 800A284C 24A50008 */   addiu     $a1, $a1, 8
/* A3450 800A2850 86420000 */  lh         $v0, ($s2)
.L800A2854:
/* A3454 800A2854 8FBF0068 */  lw         $ra, 0x68($sp)
/* A3458 800A2858 8FB30064 */  lw         $s3, 0x64($sp)
/* A345C 800A285C 8FB20060 */  lw         $s2, 0x60($sp)
/* A3460 800A2860 8FB1005C */  lw         $s1, 0x5c($sp)
/* A3464 800A2864 8FB00058 */  lw         $s0, 0x58($sp)
/* A3468 800A2868 03E00008 */  jr         $ra
/* A346C 800A286C 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_800A2870
/* A3470 800A2870 3C02800F */  lui        $v0, %hi(borg_index_x4)
/* A3474 800A2874 8C433504 */  lw         $v1, %lo(borg_index_x4)($v0)
/* A3478 800A2878 00042080 */  sll        $a0, $a0, 2
/* A347C 800A287C 00832021 */  addu       $a0, $a0, $v1
/* A3480 800A2880 03E00008 */  jr         $ra
/* A3484 800A2884 8C820000 */   lw        $v0, ($a0)

glabel getBorgItem
/* A3488 800A2888 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* A348C 800A288C AFB300A4 */  sw         $s3, 0xa4($sp)
/* A3490 800A2890 00809821 */  addu       $s3, $a0, $zero
/* A3494 800A2894 AFBF00B0 */  sw         $ra, 0xb0($sp)
/* A3498 800A2898 AFB500AC */  sw         $s5, 0xac($sp)
/* A349C 800A289C AFB400A8 */  sw         $s4, 0xa8($sp)
/* A34A0 800A28A0 AFB200A0 */  sw         $s2, 0xa0($sp)
/* A34A4 800A28A4 AFB1009C */  sw         $s1, 0x9c($sp)
/* A34A8 800A28A8 0C02608C */  jal        get_memUsed
/* A34AC 800A28AC AFB00098 */   sw        $s0, 0x98($sp)
/* A34B0 800A28B0 3C03800F */  lui        $v1, %hi(borgTotal)
/* A34B4 800A28B4 8C673514 */  lw         $a3, %lo(borgTotal)($v1)
/* A34B8 800A28B8 0040A821 */  addu       $s5, $v0, $zero
/* A34BC 800A28BC 0267102A */  slt        $v0, $s3, $a3
/* A34C0 800A28C0 10400004 */  beqz       $v0, .L800A28D4
/* A34C4 800A28C4 27B00058 */   addiu     $s0, $sp, 0x58
/* A34C8 800A28C8 0661000D */  bgez       $s3, .L800A2900
/* A34CC 800A28CC 27A40018 */   addiu     $a0, $sp, 0x18
/* A34D0 800A28D0 27B00058 */  addiu      $s0, $sp, 0x58
.L800A28D4:
/* A34D4 800A28D4 02002021 */  addu       $a0, $s0, $zero
/* A34D8 800A28D8 3C05800E */  lui        $a1, %hi(D_800E3178)
/* A34DC 800A28DC 24A53178 */  addiu      $a1, $a1, %lo(D_800E3178)
/* A34E0 800A28E0 02603021 */  addu       $a2, $s3, $zero
/* A34E4 800A28E4 0C0333AC */  jal        sprintf
/* A34E8 800A28E8 24E7FFFF */   addiu     $a3, $a3, -1
/* A34EC 800A28EC 3C04800E */  lui        $a0, %hi(D_800E319C)
/* A34F0 800A28F0 2484319C */  addiu      $a0, $a0, %lo(D_800E319C)
/* A34F4 800A28F4 0C025F2D */  jal        manualCrash
/* A34F8 800A28F8 02002821 */   addu      $a1, $s0, $zero
/* A34FC 800A28FC 27A40018 */  addiu      $a0, $sp, 0x18
.L800A2900:
/* A3500 800A2900 24060010 */  addiu      $a2, $zero, 0x10
/* A3504 800A2904 24070001 */  addiu      $a3, $zero, 1
/* A3508 800A2908 3C10800E */  lui        $s0, %hi(D_800E3120)
/* A350C 800A290C 26113120 */  addiu      $s1, $s0, %lo(D_800E3120)
/* A3510 800A2910 3C02800F */  lui        $v0, %hi(borg_listing)
/* A3514 800A2914 2403021D */  addiu      $v1, $zero, 0x21d
/* A3518 800A2918 8C48350C */  lw         $t0, %lo(borg_listing)($v0)
/* A351C 800A291C 00132900 */  sll        $a1, $s3, 4
/* A3520 800A2920 AFB10010 */  sw         $s1, 0x10($sp)
/* A3524 800A2924 AFA30014 */  sw         $v1, 0x14($sp)
/* A3528 800A2928 25080008 */  addiu      $t0, $t0, 8
/* A352C 800A292C 0C027269 */  jal        RomCopy
/* A3530 800A2930 01052821 */   addu      $a1, $t0, $a1
/* A3534 800A2934 97A30018 */  lhu        $v1, 0x18($sp)
/* A3538 800A2938 2C620003 */  sltiu      $v0, $v1, 3
/* A353C 800A293C 1440000F */  bnez       $v0, .L800A297C
/* A3540 800A2940 3C02800F */   lui       $v0, 0x800f
/* A3544 800A2944 00031400 */  sll        $v0, $v1, 0x10
/* A3548 800A2948 00022403 */  sra        $a0, $v0, 0x10
/* A354C 800A294C 24030006 */  addiu      $v1, $zero, 6
/* A3550 800A2950 10830009 */  beq        $a0, $v1, .L800A2978
/* A3554 800A2954 2402000B */   addiu     $v0, $zero, 0xb
/* A3558 800A2958 10820007 */  beq        $a0, $v0, .L800A2978
/* A355C 800A295C 2402000C */   addiu     $v0, $zero, 0xc
/* A3560 800A2960 10820005 */  beq        $a0, $v0, .L800A2978
/* A3564 800A2964 2402000D */   addiu     $v0, $zero, 0xd
/* A3568 800A2968 10820003 */  beq        $a0, $v0, .L800A2978
/* A356C 800A296C 2402000E */   addiu     $v0, $zero, 0xe
/* A3570 800A2970 1482007C */  bne        $a0, $v0, .L800A2B64
/* A3574 800A2974 3C02800F */   lui       $v0, 0x800f
.L800A2978:
/* A3578 800A2978 3C02800F */  lui        $v0, %hi(borgFlag)
.L800A297C:
/* A357C 800A297C 8C4333D0 */  lw         $v1, %lo(borgFlag)($v0)
/* A3580 800A2980 1460003F */  bnez       $v1, .L800A2A80
/* A3584 800A2984 26103120 */   addiu     $s0, $s0, 0x3120
/* A3588 800A2988 02002821 */  addu       $a1, $s0, $zero
/* A358C 800A298C 3C03800F */  lui        $v1, %hi(borg_padding)
/* A3590 800A2990 87A20018 */  lh         $v0, 0x18($sp)
/* A3594 800A2994 2463344C */  addiu      $v1, $v1, %lo(borg_padding)
/* A3598 800A2998 00021080 */  sll        $v0, $v0, 2
/* A359C 800A299C 00431021 */  addu       $v0, $v0, $v1
/* A35A0 800A29A0 8C440000 */  lw         $a0, ($v0)
/* A35A4 800A29A4 24060231 */  addiu      $a2, $zero, 0x231
/* A35A8 800A29A8 0C025F9C */  jal        Malloc
/* A35AC 800A29AC 24840004 */   addiu     $a0, $a0, 4
/* A35B0 800A29B0 3C11800F */  lui        $s1, %hi(borg_index_x1)
/* A35B4 800A29B4 8E233508 */  lw         $v1, %lo(borg_index_x1)($s1)
/* A35B8 800A29B8 00409021 */  addu       $s2, $v0, $zero
/* A35BC 800A29BC 00732821 */  addu       $a1, $v1, $s3
/* A35C0 800A29C0 80A20000 */  lb         $v0, ($a1)
/* A35C4 800A29C4 14400022 */  bnez       $v0, .L800A2A50
/* A35C8 800A29C8 90A60000 */   lbu       $a2, ($a1)
/* A35CC 800A29CC 02002821 */  addu       $a1, $s0, $zero
/* A35D0 800A29D0 8FA40020 */  lw         $a0, 0x20($sp)
/* A35D4 800A29D4 0C025F9C */  jal        Malloc
/* A35D8 800A29D8 24060236 */   addiu     $a2, $zero, 0x236
/* A35DC 800A29DC 00408021 */  addu       $s0, $v0, $zero
/* A35E0 800A29E0 02003021 */  addu       $a2, $s0, $zero
/* A35E4 800A29E4 3C02800F */  lui        $v0, %hi(borg_files)
/* A35E8 800A29E8 8FA5001C */  lw         $a1, 0x1c($sp)
/* A35EC 800A29EC 8FA70020 */  lw         $a3, 0x20($sp)
/* A35F0 800A29F0 8C433510 */  lw         $v1, %lo(borg_files)($v0)
/* A35F4 800A29F4 8FA40024 */  lw         $a0, 0x24($sp)
/* A35F8 800A29F8 87A2001A */  lh         $v0, 0x1a($sp)
/* A35FC 800A29FC 00642021 */  addu       $a0, $v1, $a0
/* A3600 800A2A00 0C02895A */  jal        decompressBorg
/* A3604 800A2A04 AFA20010 */   sw        $v0, 0x10($sp)
/* A3608 800A2A08 3C03800F */  lui        $v1, %hi(borg_funcs_a)
/* A360C 800A2A0C 87A20018 */  lh         $v0, 0x18($sp)
/* A3610 800A2A10 246333D4 */  addiu      $v1, $v1, %lo(borg_funcs_a)
/* A3614 800A2A14 00021080 */  sll        $v0, $v0, 2
/* A3618 800A2A18 00431021 */  addu       $v0, $v0, $v1
/* A361C 800A2A1C 8C450000 */  lw         $a1, ($v0)
/* A3620 800A2A20 00A0F809 */  jalr       $a1
/* A3624 800A2A24 02002021 */   addu      $a0, $s0, $zero
/* A3628 800A2A28 3C04800F */  lui        $a0, %hi(borg_index_x4)
/* A362C 800A2A2C 00131080 */  sll        $v0, $s3, 2
/* A3630 800A2A30 8C853504 */  lw         $a1, %lo(borg_index_x4)($a0)
/* A3634 800A2A34 8E233508 */  lw         $v1, 0x3508($s1)
/* A3638 800A2A38 00451021 */  addu       $v0, $v0, $a1
/* A363C 800A2A3C 00731821 */  addu       $v1, $v1, $s3
/* A3640 800A2A40 AC500000 */  sw         $s0, ($v0)
/* A3644 800A2A44 24020001 */  addiu      $v0, $zero, 1
/* A3648 800A2A48 08028A9B */  j          .L800A2A6C
/* A364C 800A2A4C A0620000 */   sb        $v0, ($v1)
.L800A2A50:
/* A3650 800A2A50 3C03800F */  lui        $v1, %hi(borg_index_x4)
/* A3654 800A2A54 8C643504 */  lw         $a0, %lo(borg_index_x4)($v1)
/* A3658 800A2A58 00131080 */  sll        $v0, $s3, 2
/* A365C 800A2A5C 00441021 */  addu       $v0, $v0, $a0
/* A3660 800A2A60 8C500000 */  lw         $s0, ($v0)
/* A3664 800A2A64 24C30001 */  addiu      $v1, $a2, 1
/* A3668 800A2A68 A0A30000 */  sb         $v1, ($a1)
.L800A2A6C:
/* A366C 800A2A6C AE530000 */  sw         $s3, ($s2)
/* A3670 800A2A70 AE400004 */  sw         $zero, 4($s2)
/* A3674 800A2A74 02402021 */  addu       $a0, $s2, $zero
/* A3678 800A2A78 08028AD0 */  j          .L800A2B40
/* A367C 800A2A7C 3C02800F */   lui       $v0, 0x800f
.L800A2A80:
/* A3680 800A2A80 02002821 */  addu       $a1, $s0, $zero
/* A3684 800A2A84 3C03800F */  lui        $v1, %hi(borg_padding)
/* A3688 800A2A88 87A20018 */  lh         $v0, 0x18($sp)
/* A368C 800A2A8C 2463344C */  addiu      $v1, $v1, %lo(borg_padding)
/* A3690 800A2A90 00021080 */  sll        $v0, $v0, 2
/* A3694 800A2A94 00431021 */  addu       $v0, $v0, $v1
/* A3698 800A2A98 8C440000 */  lw         $a0, ($v0)
/* A369C 800A2A9C 24060258 */  addiu      $a2, $zero, 0x258
/* A36A0 800A2AA0 0C025F9C */  jal        Malloc
/* A36A4 800A2AA4 24840004 */   addiu     $a0, $a0, 4
/* A36A8 800A2AA8 00409021 */  addu       $s2, $v0, $zero
/* A36AC 800A2AAC 02002821 */  addu       $a1, $s0, $zero
/* A36B0 800A2AB0 8FA40020 */  lw         $a0, 0x20($sp)
/* A36B4 800A2AB4 0C025F9C */  jal        Malloc
/* A36B8 800A2AB8 2406025A */   addiu     $a2, $zero, 0x25a
/* A36BC 800A2ABC 00408021 */  addu       $s0, $v0, $zero
/* A36C0 800A2AC0 02003021 */  addu       $a2, $s0, $zero
/* A36C4 800A2AC4 3C02800F */  lui        $v0, %hi(borg_files)
/* A36C8 800A2AC8 8FA5001C */  lw         $a1, 0x1c($sp)
/* A36CC 800A2ACC 8FA70020 */  lw         $a3, 0x20($sp)
/* A36D0 800A2AD0 8C433510 */  lw         $v1, %lo(borg_files)($v0)
/* A36D4 800A2AD4 8FA40024 */  lw         $a0, 0x24($sp)
/* A36D8 800A2AD8 87A2001A */  lh         $v0, 0x1a($sp)
/* A36DC 800A2ADC 00642021 */  addu       $a0, $v1, $a0
/* A36E0 800A2AE0 0C02895A */  jal        decompressBorg
/* A36E4 800A2AE4 AFA20010 */   sw        $v0, 0x10($sp)
/* A36E8 800A2AE8 3C03800F */  lui        $v1, %hi(borg_funcs_a)
/* A36EC 800A2AEC 87A20018 */  lh         $v0, 0x18($sp)
/* A36F0 800A2AF0 246333D4 */  addiu      $v1, $v1, %lo(borg_funcs_a)
/* A36F4 800A2AF4 00021080 */  sll        $v0, $v0, 2
/* A36F8 800A2AF8 00431021 */  addu       $v0, $v0, $v1
/* A36FC 800A2AFC 8C450000 */  lw         $a1, ($v0)
/* A3700 800A2B00 00A0F809 */  jalr       $a1
/* A3704 800A2B04 02002021 */   addu      $a0, $s0, $zero
/* A3708 800A2B08 02402021 */  addu       $a0, $s2, $zero
/* A370C 800A2B0C 3C07800F */  lui        $a3, %hi(borg_index_x4)
/* A3710 800A2B10 00131880 */  sll        $v1, $s3, 2
/* A3714 800A2B14 3C05800F */  lui        $a1, %hi(borg_index_x1)
/* A3718 800A2B18 8CE63504 */  lw         $a2, %lo(borg_index_x4)($a3)
/* A371C 800A2B1C 8CA23508 */  lw         $v0, %lo(borg_index_x1)($a1)
/* A3720 800A2B20 00661821 */  addu       $v1, $v1, $a2
/* A3724 800A2B24 00531021 */  addu       $v0, $v0, $s3
/* A3728 800A2B28 AC600000 */  sw         $zero, ($v1)
/* A372C 800A2B2C 2403FFFF */  addiu      $v1, $zero, -1
/* A3730 800A2B30 A0400000 */  sb         $zero, ($v0)
/* A3734 800A2B34 3C02800F */  lui        $v0, %hi(borg_funcs_b)
/* A3738 800A2B38 AE430000 */  sw         $v1, ($s2)
/* A373C 800A2B3C AE400004 */  sw         $zero, 4($s2)
.L800A2B40:
/* A3740 800A2B40 87A30018 */  lh         $v1, 0x18($sp)
/* A3744 800A2B44 24423410 */  addiu      $v0, $v0, %lo(borg_funcs_b)
/* A3748 800A2B48 00031880 */  sll        $v1, $v1, 2
/* A374C 800A2B4C 00621821 */  addu       $v1, $v1, $v0
/* A3750 800A2B50 8C620000 */  lw         $v0, ($v1)
/* A3754 800A2B54 0040F809 */  jalr       $v0
/* A3758 800A2B58 02002821 */   addu      $a1, $s0, $zero
/* A375C 800A2B5C 08028B5D */  j          .L800A2D74
/* A3760 800A2B60 00000000 */   nop
.L800A2B64:
/* A3764 800A2B64 8C4333D0 */  lw         $v1, 0x33d0($v0)
/* A3768 800A2B68 1060003B */  beqz       $v1, .L800A2C58
/* A376C 800A2B6C 3C10800F */   lui       $s0, %hi(borg_padding)
/* A3770 800A2B70 02202821 */  addu       $a1, $s1, $zero
/* A3774 800A2B74 2610344C */  addiu      $s0, $s0, %lo(borg_padding)
/* A3778 800A2B78 00041080 */  sll        $v0, $a0, 2
/* A377C 800A2B7C 00501021 */  addu       $v0, $v0, $s0
/* A3780 800A2B80 8C440000 */  lw         $a0, ($v0)
/* A3784 800A2B84 8FA30020 */  lw         $v1, 0x20($sp)
/* A3788 800A2B88 24060273 */  addiu      $a2, $zero, 0x273
/* A378C 800A2B8C 00838821 */  addu       $s1, $a0, $v1
/* A3790 800A2B90 0C025F9C */  jal        Malloc
/* A3794 800A2B94 02202021 */   addu      $a0, $s1, $zero
/* A3798 800A2B98 00409021 */  addu       $s2, $v0, $zero
/* A379C 800A2B9C 02402021 */  addu       $a0, $s2, $zero
/* A37A0 800A2BA0 0C02F9AC */  jal        _bzero
/* A37A4 800A2BA4 02202821 */   addu      $a1, $s1, $zero
/* A37A8 800A2BA8 3C03800F */  lui        $v1, %hi(borg_files)
/* A37AC 800A2BAC 8FA5001C */  lw         $a1, 0x1c($sp)
/* A37B0 800A2BB0 8FA70020 */  lw         $a3, 0x20($sp)
/* A37B4 800A2BB4 87A20018 */  lh         $v0, 0x18($sp)
/* A37B8 800A2BB8 8C683510 */  lw         $t0, %lo(borg_files)($v1)
/* A37BC 800A2BBC 8FA40024 */  lw         $a0, 0x24($sp)
/* A37C0 800A2BC0 87A3001A */  lh         $v1, 0x1a($sp)
/* A37C4 800A2BC4 00021080 */  sll        $v0, $v0, 2
/* A37C8 800A2BC8 00501021 */  addu       $v0, $v0, $s0
/* A37CC 800A2BCC 8C460000 */  lw         $a2, ($v0)
/* A37D0 800A2BD0 01042021 */  addu       $a0, $t0, $a0
/* A37D4 800A2BD4 AFA30010 */  sw         $v1, 0x10($sp)
/* A37D8 800A2BD8 0C02895A */  jal        decompressBorg
/* A37DC 800A2BDC 02463021 */   addu      $a2, $s2, $a2
/* A37E0 800A2BE0 3C03800F */  lui        $v1, %hi(borg_funcs_a)
/* A37E4 800A2BE4 87A20018 */  lh         $v0, 0x18($sp)
/* A37E8 800A2BE8 246333D4 */  addiu      $v1, $v1, %lo(borg_funcs_a)
/* A37EC 800A2BEC 00021080 */  sll        $v0, $v0, 2
/* A37F0 800A2BF0 00431021 */  addu       $v0, $v0, $v1
/* A37F4 800A2BF4 8C450000 */  lw         $a1, ($v0)
/* A37F8 800A2BF8 00A0F809 */  jalr       $a1
/* A37FC 800A2BFC 02402021 */   addu      $a0, $s2, $zero
/* A3800 800A2C00 02402021 */  addu       $a0, $s2, $zero
/* A3804 800A2C04 3C02800F */  lui        $v0, %hi(borg_funcs_b)
/* A3808 800A2C08 87A30018 */  lh         $v1, 0x18($sp)
/* A380C 800A2C0C 24423410 */  addiu      $v0, $v0, %lo(borg_funcs_b)
/* A3810 800A2C10 00031880 */  sll        $v1, $v1, 2
/* A3814 800A2C14 00621821 */  addu       $v1, $v1, $v0
/* A3818 800A2C18 8C620000 */  lw         $v0, ($v1)
/* A381C 800A2C1C 0040F809 */  jalr       $v0
/* A3820 800A2C20 00002821 */   addu      $a1, $zero, $zero
/* A3824 800A2C24 3C06800F */  lui        $a2, %hi(borg_index_x4)
/* A3828 800A2C28 00131880 */  sll        $v1, $s3, 2
/* A382C 800A2C2C 3C04800F */  lui        $a0, %hi(borg_index_x1)
/* A3830 800A2C30 8CC53504 */  lw         $a1, %lo(borg_index_x4)($a2)
/* A3834 800A2C34 8C823508 */  lw         $v0, %lo(borg_index_x1)($a0)
/* A3838 800A2C38 00651821 */  addu       $v1, $v1, $a1
/* A383C 800A2C3C 00531021 */  addu       $v0, $v0, $s3
/* A3840 800A2C40 AC600000 */  sw         $zero, ($v1)
/* A3844 800A2C44 2403FFFF */  addiu      $v1, $zero, -1
/* A3848 800A2C48 A0400000 */  sb         $zero, ($v0)
/* A384C 800A2C4C AE430000 */  sw         $v1, ($s2)
/* A3850 800A2C50 08028B5D */  j          .L800A2D74
/* A3854 800A2C54 AE400004 */   sw        $zero, 4($s2)
.L800A2C58:
/* A3858 800A2C58 3C14800F */  lui        $s4, %hi(borg_index_x1)
/* A385C 800A2C5C 8E823508 */  lw         $v0, %lo(borg_index_x1)($s4)
/* A3860 800A2C60 00533821 */  addu       $a3, $v0, $s3
/* A3864 800A2C64 80E30000 */  lb         $v1, ($a3)
/* A3868 800A2C68 1460003B */  bnez       $v1, .L800A2D58
/* A386C 800A2C6C 90E50000 */   lbu       $a1, ($a3)
/* A3870 800A2C70 02202821 */  addu       $a1, $s1, $zero
/* A3874 800A2C74 3C10800F */  lui        $s0, %hi(borg_padding)
/* A3878 800A2C78 2610344C */  addiu      $s0, $s0, %lo(borg_padding)
/* A387C 800A2C7C 00041080 */  sll        $v0, $a0, 2
/* A3880 800A2C80 00501021 */  addu       $v0, $v0, $s0
/* A3884 800A2C84 8C440000 */  lw         $a0, ($v0)
/* A3888 800A2C88 8FA30020 */  lw         $v1, 0x20($sp)
/* A388C 800A2C8C 2406028D */  addiu      $a2, $zero, 0x28d
/* A3890 800A2C90 00838821 */  addu       $s1, $a0, $v1
/* A3894 800A2C94 0C025F9C */  jal        Malloc
/* A3898 800A2C98 02202021 */   addu      $a0, $s1, $zero
/* A389C 800A2C9C 00409021 */  addu       $s2, $v0, $zero
/* A38A0 800A2CA0 02402021 */  addu       $a0, $s2, $zero
/* A38A4 800A2CA4 0C02F9AC */  jal        _bzero
/* A38A8 800A2CA8 02202821 */   addu      $a1, $s1, $zero
/* A38AC 800A2CAC 3C03800F */  lui        $v1, %hi(borg_files)
/* A38B0 800A2CB0 8FA5001C */  lw         $a1, 0x1c($sp)
/* A38B4 800A2CB4 8FA70020 */  lw         $a3, 0x20($sp)
/* A38B8 800A2CB8 87A20018 */  lh         $v0, 0x18($sp)
/* A38BC 800A2CBC 8C683510 */  lw         $t0, %lo(borg_files)($v1)
/* A38C0 800A2CC0 8FA40024 */  lw         $a0, 0x24($sp)
/* A38C4 800A2CC4 87A3001A */  lh         $v1, 0x1a($sp)
/* A38C8 800A2CC8 00021080 */  sll        $v0, $v0, 2
/* A38CC 800A2CCC 00501021 */  addu       $v0, $v0, $s0
/* A38D0 800A2CD0 8C460000 */  lw         $a2, ($v0)
/* A38D4 800A2CD4 01042021 */  addu       $a0, $t0, $a0
/* A38D8 800A2CD8 AFA30010 */  sw         $v1, 0x10($sp)
/* A38DC 800A2CDC 0C02895A */  jal        decompressBorg
/* A38E0 800A2CE0 02463021 */   addu      $a2, $s2, $a2
/* A38E4 800A2CE4 3C03800F */  lui        $v1, %hi(borg_funcs_a)
/* A38E8 800A2CE8 87A20018 */  lh         $v0, 0x18($sp)
/* A38EC 800A2CEC 246333D4 */  addiu      $v1, $v1, %lo(borg_funcs_a)
/* A38F0 800A2CF0 00021080 */  sll        $v0, $v0, 2
/* A38F4 800A2CF4 00431021 */  addu       $v0, $v0, $v1
/* A38F8 800A2CF8 8C450000 */  lw         $a1, ($v0)
/* A38FC 800A2CFC 00A0F809 */  jalr       $a1
/* A3900 800A2D00 02402021 */   addu      $a0, $s2, $zero
/* A3904 800A2D04 02402021 */  addu       $a0, $s2, $zero
/* A3908 800A2D08 3C02800F */  lui        $v0, %hi(borg_funcs_b)
/* A390C 800A2D0C 87A30018 */  lh         $v1, 0x18($sp)
/* A3910 800A2D10 24423410 */  addiu      $v0, $v0, %lo(borg_funcs_b)
/* A3914 800A2D14 00031880 */  sll        $v1, $v1, 2
/* A3918 800A2D18 00621821 */  addu       $v1, $v1, $v0
/* A391C 800A2D1C 8C620000 */  lw         $v0, ($v1)
/* A3920 800A2D20 0040F809 */  jalr       $v0
/* A3924 800A2D24 00002821 */   addu      $a1, $zero, $zero
/* A3928 800A2D28 3C04800F */  lui        $a0, %hi(borg_index_x4)
/* A392C 800A2D2C 00131080 */  sll        $v0, $s3, 2
/* A3930 800A2D30 8C853504 */  lw         $a1, %lo(borg_index_x4)($a0)
/* A3934 800A2D34 8E833508 */  lw         $v1, 0x3508($s4)
/* A3938 800A2D38 00451021 */  addu       $v0, $v0, $a1
/* A393C 800A2D3C 00731821 */  addu       $v1, $v1, $s3
/* A3940 800A2D40 AC520000 */  sw         $s2, ($v0)
/* A3944 800A2D44 24020001 */  addiu      $v0, $zero, 1
/* A3948 800A2D48 A0620000 */  sb         $v0, ($v1)
/* A394C 800A2D4C AE530000 */  sw         $s3, ($s2)
/* A3950 800A2D50 08028B5D */  j          .L800A2D74
/* A3954 800A2D54 AE400004 */   sw        $zero, 4($s2)
.L800A2D58:
/* A3958 800A2D58 3C03800F */  lui        $v1, %hi(borg_index_x4)
/* A395C 800A2D5C 8C643504 */  lw         $a0, %lo(borg_index_x4)($v1)
/* A3960 800A2D60 00131080 */  sll        $v0, $s3, 2
/* A3964 800A2D64 00441021 */  addu       $v0, $v0, $a0
/* A3968 800A2D68 8C520000 */  lw         $s2, ($v0)
/* A396C 800A2D6C 24A30001 */  addiu      $v1, $a1, 1
/* A3970 800A2D70 A0E30000 */  sb         $v1, ($a3)
.L800A2D74:
/* A3974 800A2D74 0C02608C */  jal        get_memUsed
/* A3978 800A2D78 00000000 */   nop
/* A397C 800A2D7C 00553823 */  subu       $a3, $v0, $s5
/* A3980 800A2D80 02401021 */  addu       $v0, $s2, $zero
/* A3984 800A2D84 3C06800F */  lui        $a2, %hi(borg_mem)
/* A3988 800A2D88 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A398C 800A2D8C 3C03800F */  lui        $v1, %hi(borg_count)
/* A3990 800A2D90 246334C8 */  addiu      $v1, $v1, %lo(borg_count)
/* A3994 800A2D94 87A50018 */  lh         $a1, 0x18($sp)
/* A3998 800A2D98 8FBF00B0 */  lw         $ra, 0xb0($sp)
/* A399C 800A2D9C 8FB500AC */  lw         $s5, 0xac($sp)
/* A39A0 800A2DA0 8FB400A8 */  lw         $s4, 0xa8($sp)
/* A39A4 800A2DA4 8FB300A4 */  lw         $s3, 0xa4($sp)
/* A39A8 800A2DA8 8FB200A0 */  lw         $s2, 0xa0($sp)
/* A39AC 800A2DAC 8FB1009C */  lw         $s1, 0x9c($sp)
/* A39B0 800A2DB0 8FB00098 */  lw         $s0, 0x98($sp)
/* A39B4 800A2DB4 00052880 */  sll        $a1, $a1, 2
/* A39B8 800A2DB8 00A63021 */  addu       $a2, $a1, $a2
/* A39BC 800A2DBC 00A32821 */  addu       $a1, $a1, $v1
/* A39C0 800A2DC0 8CC40000 */  lw         $a0, ($a2)
/* A39C4 800A2DC4 8CA30000 */  lw         $v1, ($a1)
/* A39C8 800A2DC8 00872021 */  addu       $a0, $a0, $a3
/* A39CC 800A2DCC 24630001 */  addiu      $v1, $v1, 1
/* A39D0 800A2DD0 ACC40000 */  sw         $a0, ($a2)
/* A39D4 800A2DD4 ACA30000 */  sw         $v1, ($a1)
/* A39D8 800A2DD8 03E00008 */  jr         $ra
/* A39DC 800A2DDC 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel func_800A2DE0
/* A39E0 800A2DE0 03E00008 */  jr         $ra
/* A39E4 800A2DE4 00000000 */   nop

glabel get_borg_index_count
/* A39E8 800A2DE8 3C02800F */  lui        $v0, %hi(borg_index_x1)
/* A39EC 800A2DEC 8C433508 */  lw         $v1, %lo(borg_index_x1)($v0)
/* A39F0 800A2DF0 00641821 */  addu       $v1, $v1, $a0
/* A39F4 800A2DF4 03E00008 */  jr         $ra
/* A39F8 800A2DF8 80620000 */   lb        $v0, ($v1)

glabel dec_borg_count
/* A39FC 800A2DFC 3C06800F */  lui        $a2, %hi(borg_index_x1)
/* A3A00 800A2E00 8CC23508 */  lw         $v0, %lo(borg_index_x1)($a2)
/* A3A04 800A2E04 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A3A08 800A2E08 AFBF0018 */  sw         $ra, 0x18($sp)
/* A3A0C 800A2E0C AFB10014 */  sw         $s1, 0x14($sp)
/* A3A10 800A2E10 AFB00010 */  sw         $s0, 0x10($sp)
/* A3A14 800A2E14 00442821 */  addu       $a1, $v0, $a0
/* A3A18 800A2E18 80A30000 */  lb         $v1, ($a1)
/* A3A1C 800A2E1C 18600016 */  blez       $v1, .L800A2E78
/* A3A20 800A2E20 90A20000 */   lbu       $v0, ($a1)
/* A3A24 800A2E24 2442FFFF */  addiu      $v0, $v0, -1
/* A3A28 800A2E28 A0A20000 */  sb         $v0, ($a1)
/* A3A2C 800A2E2C 8CC33508 */  lw         $v1, 0x3508($a2)
/* A3A30 800A2E30 00641821 */  addu       $v1, $v1, $a0
/* A3A34 800A2E34 80620000 */  lb         $v0, ($v1)
/* A3A38 800A2E38 14400010 */  bnez       $v0, .L800A2E7C
/* A3A3C 800A2E3C 00001821 */   addu      $v1, $zero, $zero
/* A3A40 800A2E40 3C11800F */  lui        $s1, %hi(borg_index_x4)
/* A3A44 800A2E44 00048080 */  sll        $s0, $a0, 2
/* A3A48 800A2E48 3C05800E */  lui        $a1, %hi(D_800E3120)
/* A3A4C 800A2E4C 8E223504 */  lw         $v0, %lo(borg_index_x4)($s1)
/* A3A50 800A2E50 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A3A54 800A2E54 02021021 */  addu       $v0, $s0, $v0
/* A3A58 800A2E58 8C440000 */  lw         $a0, ($v0)
/* A3A5C 800A2E5C 0C02600C */  jal        Free
/* A3A60 800A2E60 240602F9 */   addiu     $a2, $zero, 0x2f9
/* A3A64 800A2E64 8E223504 */  lw         $v0, 0x3504($s1)
/* A3A68 800A2E68 24030001 */  addiu      $v1, $zero, 1
/* A3A6C 800A2E6C 02028021 */  addu       $s0, $s0, $v0
/* A3A70 800A2E70 08028B9F */  j          .L800A2E7C
/* A3A74 800A2E74 AE000000 */   sw        $zero, ($s0)
.L800A2E78:
/* A3A78 800A2E78 00001821 */  addu       $v1, $zero, $zero
.L800A2E7C:
/* A3A7C 800A2E7C 8FBF0018 */  lw         $ra, 0x18($sp)
/* A3A80 800A2E80 8FB10014 */  lw         $s1, 0x14($sp)
/* A3A84 800A2E84 8FB00010 */  lw         $s0, 0x10($sp)
/* A3A88 800A2E88 00601021 */  addu       $v0, $v1, $zero
/* A3A8C 800A2E8C 03E00008 */  jr         $ra
/* A3A90 800A2E90 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg0_func_a
/* A3A94 800A2E94 8C820000 */  lw         $v0, ($a0)
/* A3A98 800A2E98 00441021 */  addu       $v0, $v0, $a0
/* A3A9C 800A2E9C 03E00008 */  jr         $ra
/* A3AA0 800A2EA0 AC820000 */   sw        $v0, ($a0)

glabel borg0_func_b
/* A3AA4 800A2EA4 AC850008 */  sw         $a1, 8($a0)
/* A3AA8 800A2EA8 03E00008 */  jr         $ra
/* A3AAC 800A2EAC 00001021 */   addu      $v0, $zero, $zero

glabel Ofunc_borg0_free
/* A3AB0 800A2EB0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A3AB4 800A2EB4 AFB10014 */  sw         $s1, 0x14($sp)
/* A3AB8 800A2EB8 00808821 */  addu       $s1, $a0, $zero
/* A3ABC 800A2EBC AFBF001C */  sw         $ra, 0x1c($sp)
/* A3AC0 800A2EC0 AFB20018 */  sw         $s2, 0x18($sp)
/* A3AC4 800A2EC4 0C02608C */  jal        get_memUsed
/* A3AC8 800A2EC8 AFB00010 */   sw        $s0, 0x10($sp)
/* A3ACC 800A2ECC 00409021 */  addu       $s2, $v0, $zero
/* A3AD0 800A2ED0 8E240000 */  lw         $a0, ($s1)
/* A3AD4 800A2ED4 2402FFFF */  addiu      $v0, $zero, -1
/* A3AD8 800A2ED8 14820007 */  bne        $a0, $v0, .L800A2EF8
/* A3ADC 800A2EDC 3C10800E */   lui       $s0, %hi(D_800E3120)
/* A3AE0 800A2EE0 8E240008 */  lw         $a0, 8($s1)
/* A3AE4 800A2EE4 26053120 */  addiu      $a1, $s0, %lo(D_800E3120)
/* A3AE8 800A2EE8 0C02600C */  jal        Free
/* A3AEC 800A2EEC 24060342 */   addiu     $a2, $zero, 0x342
/* A3AF0 800A2EF0 08028BC1 */  j          .L800A2F04
/* A3AF4 800A2EF4 02202021 */   addu      $a0, $s1, $zero
.L800A2EF8:
/* A3AF8 800A2EF8 0C028B7F */  jal        dec_borg_count
/* A3AFC 800A2EFC 00000000 */   nop
/* A3B00 800A2F00 02202021 */  addu       $a0, $s1, $zero
.L800A2F04:
/* A3B04 800A2F04 26053120 */  addiu      $a1, $s0, 0x3120
/* A3B08 800A2F08 0C02600C */  jal        Free
/* A3B0C 800A2F0C 24060349 */   addiu     $a2, $zero, 0x349
/* A3B10 800A2F10 0C02608C */  jal        get_memUsed
/* A3B14 800A2F14 00000000 */   nop
/* A3B18 800A2F18 3C05800F */  lui        $a1, %hi(borg_mem)
/* A3B1C 800A2F1C 02421023 */  subu       $v0, $s2, $v0
/* A3B20 800A2F20 3C06800F */  lui        $a2, %hi(borg_count)
/* A3B24 800A2F24 8CA3348C */  lw         $v1, %lo(borg_mem)($a1)
/* A3B28 800A2F28 8CC434C8 */  lw         $a0, %lo(borg_count)($a2)
/* A3B2C 800A2F2C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A3B30 800A2F30 8FB20018 */  lw         $s2, 0x18($sp)
/* A3B34 800A2F34 8FB10014 */  lw         $s1, 0x14($sp)
/* A3B38 800A2F38 8FB00010 */  lw         $s0, 0x10($sp)
/* A3B3C 800A2F3C 00621823 */  subu       $v1, $v1, $v0
/* A3B40 800A2F40 2484FFFF */  addiu      $a0, $a0, -1
/* A3B44 800A2F44 ACA3348C */  sw         $v1, 0x348c($a1)
/* A3B48 800A2F48 ACC434C8 */  sw         $a0, 0x34c8($a2)
/* A3B4C 800A2F4C 03E00008 */  jr         $ra
/* A3B50 800A2F50 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A2F54
/* A3B54 800A2F54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A3B58 800A2F58 AFB00010 */  sw         $s0, 0x10($sp)
/* A3B5C 800A2F5C AFBF0014 */  sw         $ra, 0x14($sp)
/* A3B60 800A2F60 0C02891C */  jal        clearBorgFlag
/* A3B64 800A2F64 00808021 */   addu      $s0, $a0, $zero
/* A3B68 800A2F68 0C028A22 */  jal        getBorgItem
/* A3B6C 800A2F6C 02002021 */   addu      $a0, $s0, $zero
/* A3B70 800A2F70 8C430008 */  lw         $v1, 8($v0)
/* A3B74 800A2F74 8FBF0014 */  lw         $ra, 0x14($sp)
/* A3B78 800A2F78 8FB00010 */  lw         $s0, 0x10($sp)
/* A3B7C 800A2F7C 8C620000 */  lw         $v0, ($v1)
/* A3B80 800A2F80 03E00008 */  jr         $ra
/* A3B84 800A2F84 27BD0018 */   addiu     $sp, $sp, 0x18

glabel borg1_func_a
/* A3B88 800A2F88 8C820008 */  lw         $v0, 8($a0)
/* A3B8C 800A2F8C 10400002 */  beqz       $v0, .L800A2F98
/* A3B90 800A2F90 00441021 */   addu      $v0, $v0, $a0
/* A3B94 800A2F94 AC820008 */  sw         $v0, 8($a0)
.L800A2F98:
/* A3B98 800A2F98 8C82000C */  lw         $v0, 0xc($a0)
/* A3B9C 800A2F9C 10400002 */  beqz       $v0, .L800A2FA8
/* A3BA0 800A2FA0 00441021 */   addu      $v0, $v0, $a0
/* A3BA4 800A2FA4 AC82000C */  sw         $v0, 0xc($a0)
.L800A2FA8:
/* A3BA8 800A2FA8 8C820010 */  lw         $v0, 0x10($a0)
/* A3BAC 800A2FAC 10400002 */  beqz       $v0, .L800A2FB8
/* A3BB0 800A2FB0 00441021 */   addu      $v0, $v0, $a0
/* A3BB4 800A2FB4 AC820010 */  sw         $v0, 0x10($a0)
.L800A2FB8:
/* A3BB8 800A2FB8 03E00008 */  jr         $ra
/* A3BBC 800A2FBC 00000000 */   nop

glabel InitBorgTexture
/* A3BC0 800A2FC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A3BC4 800A2FC4 AFBF0018 */  sw         $ra, 0x18($sp)
/* A3BC8 800A2FC8 AFB10014 */  sw         $s1, 0x14($sp)
/* A3BCC 800A2FCC AFB00010 */  sw         $s0, 0x10($sp)
/* A3BD0 800A2FD0 94A20002 */  lhu        $v0, 2($a1)
/* A3BD4 800A2FD4 00808821 */  addu       $s1, $a0, $zero
/* A3BD8 800A2FD8 30420100 */  andi       $v0, $v0, 0x100
/* A3BDC 800A2FDC 10400036 */  beqz       $v0, .L800A30B8
/* A3BE0 800A2FE0 AE250010 */   sw        $a1, 0x10($s1)
/* A3BE4 800A2FE4 94A50000 */  lhu        $a1, ($a1)
/* A3BE8 800A2FE8 2CA20002 */  sltiu      $v0, $a1, 2
/* A3BEC 800A2FEC 1440000D */  bnez       $v0, .L800A3024
/* A3BF0 800A2FF0 24030002 */   addiu     $v1, $zero, 2
/* A3BF4 800A2FF4 00051400 */  sll        $v0, $a1, 0x10
/* A3BF8 800A2FF8 00021403 */  sra        $v0, $v0, 0x10
/* A3BFC 800A2FFC 24030008 */  addiu      $v1, $zero, 8
/* A3C00 800A3000 14430003 */  bne        $v0, $v1, .L800A3010
/* A3C04 800A3004 3C04800E */   lui       $a0, %hi(D_800E31B8)
/* A3C08 800A3008 08028C09 */  j          .L800A3024
/* A3C0C 800A300C 24030004 */   addiu     $v1, $zero, 4
.L800A3010:
/* A3C10 800A3010 248431B8 */  addiu      $a0, $a0, %lo(D_800E31B8)
/* A3C14 800A3014 3C05800E */  lui        $a1, %hi(D_800E31D8)
/* A3C18 800A3018 0C025F2D */  jal        manualCrash
/* A3C1C 800A301C 24A531D8 */   addiu     $a1, $a1, %lo(D_800E31D8)
/* A3C20 800A3020 00001821 */  addu       $v1, $zero, $zero
.L800A3024:
/* A3C24 800A3024 8E220010 */  lw         $v0, 0x10($s1)
/* A3C28 800A3028 90500004 */  lbu        $s0, 4($v0)
/* A3C2C 800A302C 00700018 */  mult       $v1, $s0
/* A3C30 800A3030 00008012 */  mflo       $s0
/* A3C34 800A3034 90430005 */  lbu        $v1, 5($v0)
/* A3C38 800A3038 3C05800E */  lui        $a1, %hi(D_800E3120)
/* A3C3C 800A303C 02030018 */  mult       $s0, $v1
/* A3C40 800A3040 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A3C44 800A3044 8C43000C */  lw         $v1, 0xc($v0)
/* A3C48 800A3048 240603AF */  addiu      $a2, $zero, 0x3af
/* A3C4C 800A304C AE230008 */  sw         $v1, 8($s1)
/* A3C50 800A3050 00008012 */  mflo       $s0
/* A3C54 800A3054 0C025F9C */  jal        Malloc
/* A3C58 800A3058 02002021 */   addu      $a0, $s0, $zero
/* A3C5C 800A305C 8E230010 */  lw         $v1, 0x10($s1)
/* A3C60 800A3060 00402021 */  addu       $a0, $v0, $zero
/* A3C64 800A3064 AE22000C */  sw         $v0, 0xc($s1)
/* A3C68 800A3068 8C65000C */  lw         $a1, 0xc($v1)
/* A3C6C 800A306C 0C033547 */  jal        memcpy
/* A3C70 800A3070 02003021 */   addu      $a2, $s0, $zero
/* A3C74 800A3074 3C06800F */  lui        $a2, %hi(borg_index_x4)
/* A3C78 800A3078 8E230010 */  lw         $v1, 0x10($s1)
/* A3C7C 800A307C 8E220008 */  lw         $v0, 8($s1)
/* A3C80 800A3080 8E270000 */  lw         $a3, ($s1)
/* A3C84 800A3084 8CC53504 */  lw         $a1, %lo(borg_index_x4)($a2)
/* A3C88 800A3088 3C04800F */  lui        $a0, %hi(borg_index_x1)
/* A3C8C 800A308C AC62000C */  sw         $v0, 0xc($v1)
/* A3C90 800A3090 00071880 */  sll        $v1, $a3, 2
/* A3C94 800A3094 8C823508 */  lw         $v0, %lo(borg_index_x1)($a0)
/* A3C98 800A3098 00651821 */  addu       $v1, $v1, $a1
/* A3C9C 800A309C AC600000 */  sw         $zero, ($v1)
/* A3CA0 800A30A0 2403FFFF */  addiu      $v1, $zero, -1
/* A3CA4 800A30A4 00471021 */  addu       $v0, $v0, $a3
/* A3CA8 800A30A8 A0400000 */  sb         $zero, ($v0)
/* A3CAC 800A30AC AE230000 */  sw         $v1, ($s1)
/* A3CB0 800A30B0 08028C31 */  j          .L800A30C4
/* A3CB4 800A30B4 AE200004 */   sw        $zero, 4($s1)
.L800A30B8:
/* A3CB8 800A30B8 8CA2000C */  lw         $v0, 0xc($a1)
/* A3CBC 800A30BC AE22000C */  sw         $v0, 0xc($s1)
/* A3CC0 800A30C0 AE220008 */  sw         $v0, 8($s1)
.L800A30C4:
/* A3CC4 800A30C4 8FBF0018 */  lw         $ra, 0x18($sp)
/* A3CC8 800A30C8 8FB10014 */  lw         $s1, 0x14($sp)
/* A3CCC 800A30CC 8FB00010 */  lw         $s0, 0x10($sp)
/* A3CD0 800A30D0 00001021 */  addu       $v0, $zero, $zero
/* A3CD4 800A30D4 03E00008 */  jr         $ra
/* A3CD8 800A30D8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg1_free
/* A3CDC 800A30DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A3CE0 800A30E0 AFB00010 */  sw         $s0, 0x10($sp)
/* A3CE4 800A30E4 00808021 */  addu       $s0, $a0, $zero
/* A3CE8 800A30E8 AFBF001C */  sw         $ra, 0x1c($sp)
/* A3CEC 800A30EC AFB20018 */  sw         $s2, 0x18($sp)
/* A3CF0 800A30F0 0C02608C */  jal        get_memUsed
/* A3CF4 800A30F4 AFB10014 */   sw        $s1, 0x14($sp)
/* A3CF8 800A30F8 8E040010 */  lw         $a0, 0x10($s0)
/* A3CFC 800A30FC 3C11800E */  lui        $s1, 0x800e
/* A3D00 800A3100 94830002 */  lhu        $v1, 2($a0)
/* A3D04 800A3104 30630100 */  andi       $v1, $v1, 0x100
/* A3D08 800A3108 10600008 */  beqz       $v1, .L800A312C
/* A3D0C 800A310C 00409021 */   addu      $s2, $v0, $zero
/* A3D10 800A3110 94820000 */  lhu        $v0, ($a0)
/* A3D14 800A3114 2C420002 */  sltiu      $v0, $v0, 2
/* A3D18 800A3118 10400004 */  beqz       $v0, .L800A312C
/* A3D1C 800A311C 26253120 */   addiu     $a1, $s1, 0x3120
/* A3D20 800A3120 8E04000C */  lw         $a0, 0xc($s0)
/* A3D24 800A3124 0C02600C */  jal        Free
/* A3D28 800A3128 240603E4 */   addiu     $a2, $zero, 0x3e4
.L800A312C:
/* A3D2C 800A312C 8E040000 */  lw         $a0, ($s0)
/* A3D30 800A3130 2402FFFF */  addiu      $v0, $zero, -1
/* A3D34 800A3134 14820006 */  bne        $a0, $v0, .L800A3150
/* A3D38 800A3138 26253120 */   addiu     $a1, $s1, 0x3120
/* A3D3C 800A313C 8E040010 */  lw         $a0, 0x10($s0)
/* A3D40 800A3140 0C02600C */  jal        Free
/* A3D44 800A3144 240603E9 */   addiu     $a2, $zero, 0x3e9
/* A3D48 800A3148 08028C57 */  j          .L800A315C
/* A3D4C 800A314C 02002021 */   addu      $a0, $s0, $zero
.L800A3150:
/* A3D50 800A3150 0C028B7F */  jal        dec_borg_count
/* A3D54 800A3154 00000000 */   nop
/* A3D58 800A3158 02002021 */  addu       $a0, $s0, $zero
.L800A315C:
/* A3D5C 800A315C 26253120 */  addiu      $a1, $s1, 0x3120
/* A3D60 800A3160 0C02600C */  jal        Free
/* A3D64 800A3164 240603F0 */   addiu     $a2, $zero, 0x3f0
/* A3D68 800A3168 0C02608C */  jal        get_memUsed
/* A3D6C 800A316C 00000000 */   nop
/* A3D70 800A3170 3C06800F */  lui        $a2, %hi(borg_mem)
/* A3D74 800A3174 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A3D78 800A3178 02421023 */  subu       $v0, $s2, $v0
/* A3D7C 800A317C 3C05800F */  lui        $a1, %hi(borg_count)
/* A3D80 800A3180 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A3D84 800A3184 8CC30004 */  lw         $v1, 4($a2)
/* A3D88 800A3188 8CA40004 */  lw         $a0, 4($a1)
/* A3D8C 800A318C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A3D90 800A3190 8FB20018 */  lw         $s2, 0x18($sp)
/* A3D94 800A3194 8FB10014 */  lw         $s1, 0x14($sp)
/* A3D98 800A3198 8FB00010 */  lw         $s0, 0x10($sp)
/* A3D9C 800A319C 00621823 */  subu       $v1, $v1, $v0
/* A3DA0 800A31A0 2484FFFF */  addiu      $a0, $a0, -1
/* A3DA4 800A31A4 ACC30004 */  sw         $v1, 4($a2)
/* A3DA8 800A31A8 ACA40004 */  sw         $a0, 4($a1)
/* A3DAC 800A31AC 03E00008 */  jr         $ra
/* A3DB0 800A31B0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg2_func_a
/* A3DB4 800A31B4 00802821 */  addu       $a1, $a0, $zero
/* A3DB8 800A31B8 8CA2002C */  lw         $v0, 0x2c($a1)
/* A3DBC 800A31BC 8CA60004 */  lw         $a2, 4($a1)
/* A3DC0 800A31C0 8CA30030 */  lw         $v1, 0x30($a1)
/* A3DC4 800A31C4 00451021 */  addu       $v0, $v0, $a1
/* A3DC8 800A31C8 00402021 */  addu       $a0, $v0, $zero
/* A3DCC 800A31CC ACA2002C */  sw         $v0, 0x2c($a1)
/* A3DD0 800A31D0 8CA20034 */  lw         $v0, 0x34($a1)
/* A3DD4 800A31D4 00651821 */  addu       $v1, $v1, $a1
/* A3DD8 800A31D8 ACA30030 */  sw         $v1, 0x30($a1)
/* A3DDC 800A31DC 8CA30040 */  lw         $v1, 0x40($a1)
/* A3DE0 800A31E0 00451021 */  addu       $v0, $v0, $a1
/* A3DE4 800A31E4 00651821 */  addu       $v1, $v1, $a1
/* A3DE8 800A31E8 ACA20034 */  sw         $v0, 0x34($a1)
/* A3DEC 800A31EC 10C00007 */  beqz       $a2, .L800A320C
/* A3DF0 800A31F0 ACA30040 */   sw        $v1, 0x40($a1)
.L800A31F4:
/* A3DF4 800A31F4 8C820000 */  lw         $v0, ($a0)
/* A3DF8 800A31F8 24C6FFFF */  addiu      $a2, $a2, -1
/* A3DFC 800A31FC 00451021 */  addu       $v0, $v0, $a1
/* A3E00 800A3200 AC820000 */  sw         $v0, ($a0)
/* A3E04 800A3204 14C0FFFB */  bnez       $a2, .L800A31F4
/* A3E08 800A3208 24840004 */   addiu     $a0, $a0, 4
.L800A320C:
/* A3E0C 800A320C 8CA7003C */  lw         $a3, 0x3c($a1)
/* A3E10 800A3210 10E00014 */  beqz       $a3, .L800A3264
/* A3E14 800A3214 00E51021 */   addu      $v0, $a3, $a1
/* A3E18 800A3218 ACA2003C */  sw         $v0, 0x3c($a1)
/* A3E1C 800A321C 8C430004 */  lw         $v1, 4($v0)
/* A3E20 800A3220 00651821 */  addu       $v1, $v1, $a1
/* A3E24 800A3224 AC430004 */  sw         $v1, 4($v0)
/* A3E28 800A3228 8CE40008 */  lw         $a0, 8($a3)
/* A3E2C 800A322C 8CE60000 */  lw         $a2, ($a3)
/* A3E30 800A3230 00852021 */  addu       $a0, $a0, $a1
/* A3E34 800A3234 00801821 */  addu       $v1, $a0, $zero
/* A3E38 800A3238 10C0000A */  beqz       $a2, .L800A3264
/* A3E3C 800A323C ACE40008 */   sw        $a0, 8($a3)
.L800A3240:
/* A3E40 800A3240 8C620000 */  lw         $v0, ($v1)
/* A3E44 800A3244 28420002 */  slti       $v0, $v0, 2
/* A3E48 800A3248 14400004 */  bnez       $v0, .L800A325C
/* A3E4C 800A324C 24C6FFFF */   addiu     $a2, $a2, -1
/* A3E50 800A3250 8C620004 */  lw         $v0, 4($v1)
/* A3E54 800A3254 00451021 */  addu       $v0, $v0, $a1
/* A3E58 800A3258 AC620004 */  sw         $v0, 4($v1)
.L800A325C:
/* A3E5C 800A325C 14C0FFF8 */  bnez       $a2, .L800A3240
/* A3E60 800A3260 24630008 */   addiu     $v1, $v1, 8
.L800A3264:
/* A3E64 800A3264 03E00008 */  jr         $ra
/* A3E68 800A3268 00000000 */   nop

glabel borg2_func_b
/* A3E6C 800A326C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* A3E70 800A3270 AFBF0024 */  sw         $ra, 0x24($sp)
/* A3E74 800A3274 AFB40020 */  sw         $s4, 0x20($sp)
/* A3E78 800A3278 AFB3001C */  sw         $s3, 0x1c($sp)
/* A3E7C 800A327C AFB20018 */  sw         $s2, 0x18($sp)
/* A3E80 800A3280 AFB10014 */  sw         $s1, 0x14($sp)
/* A3E84 800A3284 AFB00010 */  sw         $s0, 0x10($sp)
/* A3E88 800A3288 8CA20004 */  lw         $v0, 4($a1)
/* A3E8C 800A328C 00809021 */  addu       $s2, $a0, $zero
/* A3E90 800A3290 AE400008 */  sw         $zero, 8($s2)
/* A3E94 800A3294 AE40000C */  sw         $zero, 0xc($s2)
/* A3E98 800A3298 10400029 */  beqz       $v0, .L800A3340
/* A3E9C 800A329C AE450058 */   sw        $a1, 0x58($s2)
/* A3EA0 800A32A0 00402021 */  addu       $a0, $v0, $zero
/* A3EA4 800A32A4 3C11800E */  lui        $s1, %hi(D_800E3120)
/* A3EA8 800A32A8 26303120 */  addiu      $s0, $s1, %lo(D_800E3120)
/* A3EAC 800A32AC 02002821 */  addu       $a1, $s0, $zero
/* A3EB0 800A32B0 0C025F9C */  jal        Malloc
/* A3EB4 800A32B4 24060457 */   addiu     $a2, $zero, 0x457
/* A3EB8 800A32B8 02002821 */  addu       $a1, $s0, $zero
/* A3EBC 800A32BC 8E430058 */  lw         $v1, 0x58($s2)
/* A3EC0 800A32C0 24060458 */  addiu      $a2, $zero, 0x458
/* A3EC4 800A32C4 8C640004 */  lw         $a0, 4($v1)
/* A3EC8 800A32C8 00008021 */  addu       $s0, $zero, $zero
/* A3ECC 800A32CC AE420054 */  sw         $v0, 0x54($s2)
/* A3ED0 800A32D0 0C025F9C */  jal        Malloc
/* A3ED4 800A32D4 00042080 */   sll       $a0, $a0, 2
/* A3ED8 800A32D8 8E430058 */  lw         $v1, 0x58($s2)
/* A3EDC 800A32DC 26530010 */  addiu      $s3, $s2, 0x10
/* A3EE0 800A32E0 AE420050 */  sw         $v0, 0x50($s2)
/* A3EE4 800A32E4 8C620004 */  lw         $v0, 4($v1)
/* A3EE8 800A32E8 18400018 */  blez       $v0, .L800A334C
/* A3EEC 800A32EC 0220A021 */   addu      $s4, $s1, $zero
/* A3EF0 800A32F0 24110001 */  addiu      $s1, $zero, 1
/* A3EF4 800A32F4 24040100 */  addiu      $a0, $zero, 0x100
.L800A32F8:
/* A3EF8 800A32F8 26853120 */  addiu      $a1, $s4, 0x3120
/* A3EFC 800A32FC 0C025F9C */  jal        Malloc
/* A3F00 800A3300 2406045E */   addiu     $a2, $zero, 0x45e
/* A3F04 800A3304 00101880 */  sll        $v1, $s0, 2
/* A3F08 800A3308 8E450050 */  lw         $a1, 0x50($s2)
/* A3F0C 800A330C 8E440054 */  lw         $a0, 0x54($s2)
/* A3F10 800A3310 00651821 */  addu       $v1, $v1, $a1
/* A3F14 800A3314 00902021 */  addu       $a0, $a0, $s0
/* A3F18 800A3318 AC620000 */  sw         $v0, ($v1)
/* A3F1C 800A331C A0910000 */  sb         $s1, ($a0)
/* A3F20 800A3320 8E420058 */  lw         $v0, 0x58($s2)
/* A3F24 800A3324 8C430004 */  lw         $v1, 4($v0)
/* A3F28 800A3328 26100001 */  addiu      $s0, $s0, 1
/* A3F2C 800A332C 0203182A */  slt        $v1, $s0, $v1
/* A3F30 800A3330 1460FFF1 */  bnez       $v1, .L800A32F8
/* A3F34 800A3334 24040100 */   addiu     $a0, $zero, 0x100
/* A3F38 800A3338 08028CD3 */  j          .L800A334C
/* A3F3C 800A333C 00000000 */   nop
.L800A3340:
/* A3F40 800A3340 26530010 */  addiu      $s3, $s2, 0x10
/* A3F44 800A3344 AE400054 */  sw         $zero, 0x54($s2)
/* A3F48 800A3348 AE400050 */  sw         $zero, 0x50($s2)
.L800A334C:
/* A3F4C 800A334C 0C0311DC */  jal        guMtxIdentF
/* A3F50 800A3350 02602021 */   addu      $a0, $s3, $zero
/* A3F54 800A3354 8FBF0024 */  lw         $ra, 0x24($sp)
/* A3F58 800A3358 8FB40020 */  lw         $s4, 0x20($sp)
/* A3F5C 800A335C 8FB3001C */  lw         $s3, 0x1c($sp)
/* A3F60 800A3360 8FB20018 */  lw         $s2, 0x18($sp)
/* A3F64 800A3364 8FB10014 */  lw         $s1, 0x14($sp)
/* A3F68 800A3368 8FB00010 */  lw         $s0, 0x10($sp)
/* A3F6C 800A336C 00001021 */  addu       $v0, $zero, $zero
/* A3F70 800A3370 03E00008 */  jr         $ra
/* A3F74 800A3374 27BD0028 */   addiu     $sp, $sp, 0x28

glabel borg_2_free
/* A3F78 800A3378 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A3F7C 800A337C AFB10014 */  sw         $s1, 0x14($sp)
/* A3F80 800A3380 00808821 */  addu       $s1, $a0, $zero
/* A3F84 800A3384 AFBF0028 */  sw         $ra, 0x28($sp)
/* A3F88 800A3388 AFB50024 */  sw         $s5, 0x24($sp)
/* A3F8C 800A338C AFB40020 */  sw         $s4, 0x20($sp)
/* A3F90 800A3390 AFB3001C */  sw         $s3, 0x1c($sp)
/* A3F94 800A3394 AFB20018 */  sw         $s2, 0x18($sp)
/* A3F98 800A3398 0C02608C */  jal        get_memUsed
/* A3F9C 800A339C AFB00010 */   sw        $s0, 0x10($sp)
/* A3FA0 800A33A0 3C12800E */  lui        $s2, 0x800e
/* A3FA4 800A33A4 3C14800F */  lui        $s4, 0x800f
/* A3FA8 800A33A8 3C15800F */  lui        $s5, 0x800f
/* A3FAC 800A33AC 8E230050 */  lw         $v1, 0x50($s1)
/* A3FB0 800A33B0 10600017 */  beqz       $v1, .L800A3410
/* A3FB4 800A33B4 00409821 */   addu      $s3, $v0, $zero
/* A3FB8 800A33B8 8E220058 */  lw         $v0, 0x58($s1)
/* A3FBC 800A33BC 8C430004 */  lw         $v1, 4($v0)
/* A3FC0 800A33C0 1860000F */  blez       $v1, .L800A3400
/* A3FC4 800A33C4 00008021 */   addu      $s0, $zero, $zero
/* A3FC8 800A33C8 8E230050 */  lw         $v1, 0x50($s1)
.L800A33CC:
/* A3FCC 800A33CC 00101080 */  sll        $v0, $s0, 2
/* A3FD0 800A33D0 00431021 */  addu       $v0, $v0, $v1
/* A3FD4 800A33D4 8C440000 */  lw         $a0, ($v0)
/* A3FD8 800A33D8 10800003 */  beqz       $a0, .L800A33E8
/* A3FDC 800A33DC 26453120 */   addiu     $a1, $s2, 0x3120
/* A3FE0 800A33E0 0C02600C */  jal        Free
/* A3FE4 800A33E4 24060485 */   addiu     $a2, $zero, 0x485
.L800A33E8:
/* A3FE8 800A33E8 8E220058 */  lw         $v0, 0x58($s1)
/* A3FEC 800A33EC 8C430004 */  lw         $v1, 4($v0)
/* A3FF0 800A33F0 26100001 */  addiu      $s0, $s0, 1
/* A3FF4 800A33F4 0203182A */  slt        $v1, $s0, $v1
/* A3FF8 800A33F8 5460FFF4 */  bnel       $v1, $zero, .L800A33CC
/* A3FFC 800A33FC 8E230050 */   lw        $v1, 0x50($s1)
.L800A3400:
/* A4000 800A3400 8E240050 */  lw         $a0, 0x50($s1)
/* A4004 800A3404 26453120 */  addiu      $a1, $s2, 0x3120
/* A4008 800A3408 0C02600C */  jal        Free
/* A400C 800A340C 24060489 */   addiu     $a2, $zero, 0x489
.L800A3410:
/* A4010 800A3410 8E240054 */  lw         $a0, 0x54($s1)
/* A4014 800A3414 10800003 */  beqz       $a0, .L800A3424
/* A4018 800A3418 26453120 */   addiu     $a1, $s2, 0x3120
/* A401C 800A341C 0C02600C */  jal        Free
/* A4020 800A3420 2406048E */   addiu     $a2, $zero, 0x48e
.L800A3424:
/* A4024 800A3424 8E240000 */  lw         $a0, ($s1)
/* A4028 800A3428 2402FFFF */  addiu      $v0, $zero, -1
/* A402C 800A342C 14820006 */  bne        $a0, $v0, .L800A3448
/* A4030 800A3430 26453120 */   addiu     $a1, $s2, 0x3120
/* A4034 800A3434 8E240058 */  lw         $a0, 0x58($s1)
/* A4038 800A3438 0C02600C */  jal        Free
/* A403C 800A343C 24060493 */   addiu     $a2, $zero, 0x493
/* A4040 800A3440 08028D17 */  j          .L800A345C
/* A4044 800A3444 02202021 */   addu      $a0, $s1, $zero
.L800A3448:
/* A4048 800A3448 0C028B7A */  jal        get_borg_index_count
/* A404C 800A344C 00000000 */   nop
/* A4050 800A3450 0C028B7F */  jal        dec_borg_count
/* A4054 800A3454 8E240000 */   lw        $a0, ($s1)
/* A4058 800A3458 02202021 */  addu       $a0, $s1, $zero
.L800A345C:
/* A405C 800A345C 26453120 */  addiu      $a1, $s2, 0x3120
/* A4060 800A3460 0C02600C */  jal        Free
/* A4064 800A3464 240604A0 */   addiu     $a2, $zero, 0x4a0
/* A4068 800A3468 0C02608C */  jal        get_memUsed
/* A406C 800A346C 00000000 */   nop
/* A4070 800A3470 2685348C */  addiu      $a1, $s4, 0x348c
/* A4074 800A3474 02621023 */  subu       $v0, $s3, $v0
/* A4078 800A3478 26A634C8 */  addiu      $a2, $s5, 0x34c8
/* A407C 800A347C 8CA30008 */  lw         $v1, 8($a1)
/* A4080 800A3480 8CC40008 */  lw         $a0, 8($a2)
/* A4084 800A3484 8FBF0028 */  lw         $ra, 0x28($sp)
/* A4088 800A3488 8FB50024 */  lw         $s5, 0x24($sp)
/* A408C 800A348C 8FB40020 */  lw         $s4, 0x20($sp)
/* A4090 800A3490 8FB3001C */  lw         $s3, 0x1c($sp)
/* A4094 800A3494 8FB20018 */  lw         $s2, 0x18($sp)
/* A4098 800A3498 8FB10014 */  lw         $s1, 0x14($sp)
/* A409C 800A349C 8FB00010 */  lw         $s0, 0x10($sp)
/* A40A0 800A34A0 00621823 */  subu       $v1, $v1, $v0
/* A40A4 800A34A4 2484FFFF */  addiu      $a0, $a0, -1
/* A40A8 800A34A8 ACA30008 */  sw         $v1, 8($a1)
/* A40AC 800A34AC ACC40008 */  sw         $a0, 8($a2)
/* A40B0 800A34B0 03E00008 */  jr         $ra
/* A40B4 800A34B4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel noop_800a34b8
/* A40B8 800A34B8 03E00008 */  jr         $ra
/* A40BC 800A34BC 00000000 */   nop

glabel ret0_800a34c0
/* A40C0 800A34C0 03E00008 */  jr         $ra
/* A40C4 800A34C4 00001021 */   addu      $v0, $zero, $zero

glabel Borg4_free
/* A40C8 800A34C8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A40CC 800A34CC AFB00010 */  sw         $s0, 0x10($sp)
/* A40D0 800A34D0 00808021 */  addu       $s0, $a0, $zero
/* A40D4 800A34D4 AFBF0018 */  sw         $ra, 0x18($sp)
/* A40D8 800A34D8 0C02608C */  jal        get_memUsed
/* A40DC 800A34DC AFB10014 */   sw        $s1, 0x14($sp)
/* A40E0 800A34E0 00408821 */  addu       $s1, $v0, $zero
/* A40E4 800A34E4 8E040000 */  lw         $a0, ($s0)
/* A40E8 800A34E8 2402FFFF */  addiu      $v0, $zero, -1
/* A40EC 800A34EC 14820007 */  bne        $a0, $v0, .L800A350C
/* A40F0 800A34F0 3C05800E */   lui       $a1, %hi(D_800E3120)
/* A40F4 800A34F4 02002021 */  addu       $a0, $s0, $zero
/* A40F8 800A34F8 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A40FC 800A34FC 0C02600C */  jal        Free
/* A4100 800A3500 240604D8 */   addiu     $a2, $zero, 0x4d8
/* A4104 800A3504 08028D45 */  j          .L800A3514
/* A4108 800A3508 00000000 */   nop
.L800A350C:
/* A410C 800A350C 0C028B7F */  jal        dec_borg_count
/* A4110 800A3510 00000000 */   nop
.L800A3514:
/* A4114 800A3514 0C02608C */  jal        get_memUsed
/* A4118 800A3518 00000000 */   nop
/* A411C 800A351C 3C06800F */  lui        $a2, %hi(borg_mem)
/* A4120 800A3520 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A4124 800A3524 02221023 */  subu       $v0, $s1, $v0
/* A4128 800A3528 3C05800F */  lui        $a1, %hi(borg_count)
/* A412C 800A352C 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A4130 800A3530 8CC30010 */  lw         $v1, 0x10($a2)
/* A4134 800A3534 8CA40010 */  lw         $a0, 0x10($a1)
/* A4138 800A3538 8FBF0018 */  lw         $ra, 0x18($sp)
/* A413C 800A353C 8FB10014 */  lw         $s1, 0x14($sp)
/* A4140 800A3540 8FB00010 */  lw         $s0, 0x10($sp)
/* A4144 800A3544 00621823 */  subu       $v1, $v1, $v0
/* A4148 800A3548 2484FFFF */  addiu      $a0, $a0, -1
/* A414C 800A354C ACC30010 */  sw         $v1, 0x10($a2)
/* A4150 800A3550 ACA40010 */  sw         $a0, 0x10($a1)
/* A4154 800A3554 03E00008 */  jr         $ra
/* A4158 800A3558 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg3_func_a
/* A415C 800A355C 8C820028 */  lw         $v0, 0x28($a0)
/* A4160 800A3560 AC80002C */  sw         $zero, 0x2c($a0)
/* A4164 800A3564 24420010 */  addiu      $v0, $v0, 0x10
/* A4168 800A3568 00441021 */  addu       $v0, $v0, $a0
/* A416C 800A356C 03E00008 */  jr         $ra
/* A4170 800A3570 AC820028 */   sw        $v0, 0x28($a0)

glabel ret0_800A3574
/* A4174 800A3574 03E00008 */  jr         $ra
/* A4178 800A3578 00001021 */   addu      $v0, $zero, $zero

glabel borg3_free
/* A417C 800A357C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A4180 800A3580 AFB00010 */  sw         $s0, 0x10($sp)
/* A4184 800A3584 00808021 */  addu       $s0, $a0, $zero
/* A4188 800A3588 AFBF0018 */  sw         $ra, 0x18($sp)
/* A418C 800A358C 0C02608C */  jal        get_memUsed
/* A4190 800A3590 AFB10014 */   sw        $s1, 0x14($sp)
/* A4194 800A3594 00408821 */  addu       $s1, $v0, $zero
/* A4198 800A3598 8E040000 */  lw         $a0, ($s0)
/* A419C 800A359C 2402FFFF */  addiu      $v0, $zero, -1
/* A41A0 800A35A0 14820007 */  bne        $a0, $v0, .L800A35C0
/* A41A4 800A35A4 3C05800E */   lui       $a1, %hi(D_800E3120)
/* A41A8 800A35A8 02002021 */  addu       $a0, $s0, $zero
/* A41AC 800A35AC 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A41B0 800A35B0 0C02600C */  jal        Free
/* A41B4 800A35B4 24060520 */   addiu     $a2, $zero, 0x520
/* A41B8 800A35B8 08028D72 */  j          .L800A35C8
/* A41BC 800A35BC 00000000 */   nop
.L800A35C0:
/* A41C0 800A35C0 0C028B7F */  jal        dec_borg_count
/* A41C4 800A35C4 00000000 */   nop
.L800A35C8:
/* A41C8 800A35C8 0C02608C */  jal        get_memUsed
/* A41CC 800A35CC 00000000 */   nop
/* A41D0 800A35D0 3C06800F */  lui        $a2, %hi(borg_mem)
/* A41D4 800A35D4 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A41D8 800A35D8 02221023 */  subu       $v0, $s1, $v0
/* A41DC 800A35DC 3C05800F */  lui        $a1, %hi(borg_count)
/* A41E0 800A35E0 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A41E4 800A35E4 8CC3000C */  lw         $v1, 0xc($a2)
/* A41E8 800A35E8 8CA4000C */  lw         $a0, 0xc($a1)
/* A41EC 800A35EC 8FBF0018 */  lw         $ra, 0x18($sp)
/* A41F0 800A35F0 8FB10014 */  lw         $s1, 0x14($sp)
/* A41F4 800A35F4 8FB00010 */  lw         $s0, 0x10($sp)
/* A41F8 800A35F8 00621823 */  subu       $v1, $v1, $v0
/* A41FC 800A35FC 2484FFFF */  addiu      $a0, $a0, -1
/* A4200 800A3600 ACC3000C */  sw         $v1, 0xc($a2)
/* A4204 800A3604 ACA4000C */  sw         $a0, 0xc($a1)
/* A4208 800A3608 03E00008 */  jr         $ra
/* A420C 800A360C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg5_func_a
/* A4210 800A3610 8C820028 */  lw         $v0, 0x28($a0)
/* A4214 800A3614 1040000D */  beqz       $v0, .L800A364C
/* A4218 800A3618 24420010 */   addiu     $v0, $v0, 0x10
/* A421C 800A361C 00441021 */  addu       $v0, $v0, $a0
/* A4220 800A3620 8C850010 */  lw         $a1, 0x10($a0)
/* A4224 800A3624 00401821 */  addu       $v1, $v0, $zero
/* A4228 800A3628 10A00008 */  beqz       $a1, .L800A364C
/* A422C 800A362C AC820028 */   sw        $v0, 0x28($a0)
.L800A3630:
/* A4230 800A3630 8C620004 */  lw         $v0, 4($v1)
/* A4234 800A3634 24A5FFFF */  addiu      $a1, $a1, -1
/* A4238 800A3638 24420010 */  addiu      $v0, $v0, 0x10
/* A423C 800A363C 00441021 */  addu       $v0, $v0, $a0
/* A4240 800A3640 AC620004 */  sw         $v0, 4($v1)
/* A4244 800A3644 14A0FFFA */  bnez       $a1, .L800A3630
/* A4248 800A3648 24630040 */   addiu     $v1, $v1, 0x40
.L800A364C:
/* A424C 800A364C 8C820030 */  lw         $v0, 0x30($a0)
/* A4250 800A3650 10400003 */  beqz       $v0, .L800A3660
/* A4254 800A3654 24420010 */   addiu     $v0, $v0, 0x10
/* A4258 800A3658 00441021 */  addu       $v0, $v0, $a0
/* A425C 800A365C AC820030 */  sw         $v0, 0x30($a0)
.L800A3660:
/* A4260 800A3660 8C820038 */  lw         $v0, 0x38($a0)
/* A4264 800A3664 10400003 */  beqz       $v0, .L800A3674
/* A4268 800A3668 24420010 */   addiu     $v0, $v0, 0x10
/* A426C 800A366C 00441021 */  addu       $v0, $v0, $a0
/* A4270 800A3670 AC820038 */  sw         $v0, 0x38($a0)
.L800A3674:
/* A4274 800A3674 8C82003C */  lw         $v0, 0x3c($a0)
/* A4278 800A3678 10400003 */  beqz       $v0, .L800A3688
/* A427C 800A367C 24420010 */   addiu     $v0, $v0, 0x10
/* A4280 800A3680 00441021 */  addu       $v0, $v0, $a0
/* A4284 800A3684 AC82003C */  sw         $v0, 0x3c($a0)
.L800A3688:
/* A4288 800A3688 8C820040 */  lw         $v0, 0x40($a0)
/* A428C 800A368C 10400003 */  beqz       $v0, .L800A369C
/* A4290 800A3690 24420010 */   addiu     $v0, $v0, 0x10
/* A4294 800A3694 00441021 */  addu       $v0, $v0, $a0
/* A4298 800A3698 AC820040 */  sw         $v0, 0x40($a0)
.L800A369C:
/* A429C 800A369C 8C820044 */  lw         $v0, 0x44($a0)
/* A42A0 800A36A0 10400003 */  beqz       $v0, .L800A36B0
/* A42A4 800A36A4 24420010 */   addiu     $v0, $v0, 0x10
/* A42A8 800A36A8 00441021 */  addu       $v0, $v0, $a0
/* A42AC 800A36AC AC820044 */  sw         $v0, 0x44($a0)
.L800A36B0:
/* A42B0 800A36B0 8C820020 */  lw         $v0, 0x20($a0)
/* A42B4 800A36B4 18400009 */  blez       $v0, .L800A36DC
/* A42B8 800A36B8 00402821 */   addu      $a1, $v0, $zero
/* A42BC 800A36BC 8C830044 */  lw         $v1, 0x44($a0)
.L800A36C0:
/* A42C0 800A36C0 8C620010 */  lw         $v0, 0x10($v1)
/* A42C4 800A36C4 24A5FFFF */  addiu      $a1, $a1, -1
/* A42C8 800A36C8 24420010 */  addiu      $v0, $v0, 0x10
/* A42CC 800A36CC 00441021 */  addu       $v0, $v0, $a0
/* A42D0 800A36D0 AC620010 */  sw         $v0, 0x10($v1)
/* A42D4 800A36D4 14A0FFFA */  bnez       $a1, .L800A36C0
/* A42D8 800A36D8 24630018 */   addiu     $v1, $v1, 0x18
.L800A36DC:
/* A42DC 800A36DC 8C820048 */  lw         $v0, 0x48($a0)
/* A42E0 800A36E0 8C83004C */  lw         $v1, 0x4c($a0)
/* A42E4 800A36E4 AC800004 */  sw         $zero, 4($a0)
/* A42E8 800A36E8 24420010 */  addiu      $v0, $v0, 0x10
/* A42EC 800A36EC 00441021 */  addu       $v0, $v0, $a0
/* A42F0 800A36F0 24630010 */  addiu      $v1, $v1, 0x10
/* A42F4 800A36F4 00641821 */  addu       $v1, $v1, $a0
/* A42F8 800A36F8 AC820048 */  sw         $v0, 0x48($a0)
/* A42FC 800A36FC 03E00008 */  jr         $ra
/* A4300 800A3700 AC83004C */   sw        $v1, 0x4c($a0)

glabel InitBorgScene
/* A4304 800A3704 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A4308 800A3708 AFB3001C */  sw         $s3, 0x1c($sp)
/* A430C 800A370C 00809821 */  addu       $s3, $a0, $zero
/* A4310 800A3710 AFBF002C */  sw         $ra, 0x2c($sp)
/* A4314 800A3714 AFB60028 */  sw         $s6, 0x28($sp)
/* A4318 800A3718 AFB50024 */  sw         $s5, 0x24($sp)
/* A431C 800A371C AFB40020 */  sw         $s4, 0x20($sp)
/* A4320 800A3720 AFB20018 */  sw         $s2, 0x18($sp)
/* A4324 800A3724 AFB10014 */  sw         $s1, 0x14($sp)
/* A4328 800A3728 AFB00010 */  sw         $s0, 0x10($sp)
/* A432C 800A372C 8E640020 */  lw         $a0, 0x20($s3)
/* A4330 800A3730 10800013 */  beqz       $a0, .L800A3780
/* A4334 800A3734 3C16800E */   lui       $s6, %hi(D_800E3120)
/* A4338 800A3738 000420C0 */  sll        $a0, $a0, 3
/* A433C 800A373C 26C53120 */  addiu      $a1, $s6, %lo(D_800E3120)
/* A4340 800A3740 0C025F9C */  jal        Malloc
/* A4344 800A3744 240605BF */   addiu     $a2, $zero, 0x5bf
/* A4348 800A3748 10400008 */  beqz       $v0, .L800A376C
/* A434C 800A374C AE62000C */   sw        $v0, 0xc($s3)
/* A4350 800A3750 00402021 */  addu       $a0, $v0, $zero
/* A4354 800A3754 8E660020 */  lw         $a2, 0x20($s3)
/* A4358 800A3758 00002821 */  addu       $a1, $zero, $zero
/* A435C 800A375C 0C026380 */  jal        Calloc
/* A4360 800A3760 000630C0 */   sll       $a2, $a2, 3
/* A4364 800A3764 08028DE1 */  j          .L800A3784
/* A4368 800A3768 00009021 */   addu      $s2, $zero, $zero
.L800A376C:
/* A436C 800A376C 3C04800E */  lui        $a0, %hi(D_800E321C)
/* A4370 800A3770 2484321C */  addiu      $a0, $a0, %lo(D_800E321C)
/* A4374 800A3774 3C05800E */  lui        $a1, %hi(D_800E323C)
/* A4378 800A3778 0C025F2D */  jal        manualCrash
/* A437C 800A377C 24A5323C */   addiu     $a1, $a1, %lo(D_800E323C)
.L800A3780:
/* A4380 800A3780 00009021 */  addu       $s2, $zero, $zero
.L800A3784:
/* A4384 800A3784 00008821 */  addu       $s1, $zero, $zero
/* A4388 800A3788 8E690010 */  lw         $t1, 0x10($s3)
/* A438C 800A378C 19200014 */  blez       $t1, .L800A37E0
/* A4390 800A3790 8E700028 */   lw        $s0, 0x28($s3)
.L800A3794:
/* A4394 800A3794 26440188 */  addiu      $a0, $s2, 0x188
/* A4398 800A3798 26270001 */  addiu      $a3, $s1, 1
/* A439C 800A379C 26080040 */  addiu      $t0, $s0, 0x40
/* A43A0 800A37A0 92050003 */  lbu        $a1, 3($s0)
/* A43A4 800A37A4 10A00009 */  beqz       $a1, .L800A37CC
/* A43A8 800A37A8 8E060004 */   lw        $a2, 4($s0)
.L800A37AC:
/* A43AC 800A37AC 24A5FFFF */  addiu      $a1, $a1, -1
/* A43B0 800A37B0 8CC20000 */  lw         $v0, ($a2)
/* A43B4 800A37B4 8E630028 */  lw         $v1, 0x28($s3)
/* A43B8 800A37B8 00021180 */  sll        $v0, $v0, 6
/* A43BC 800A37BC 00621821 */  addu       $v1, $v1, $v0
/* A43C0 800A37C0 ACC30000 */  sw         $v1, ($a2)
/* A43C4 800A37C4 14A0FFF9 */  bnez       $a1, .L800A37AC
/* A43C8 800A37C8 24C60004 */   addiu     $a2, $a2, 4
.L800A37CC:
/* A43CC 800A37CC 00809021 */  addu       $s2, $a0, $zero
/* A43D0 800A37D0 00E08821 */  addu       $s1, $a3, $zero
/* A43D4 800A37D4 0229102A */  slt        $v0, $s1, $t1
/* A43D8 800A37D8 1440FFEE */  bnez       $v0, .L800A3794
/* A43DC 800A37DC 01008021 */   addu      $s0, $t0, $zero
.L800A37E0:
/* A43E0 800A37E0 8E630034 */  lw         $v1, 0x34($s3)
/* A43E4 800A37E4 2402FFFF */  addiu      $v0, $zero, -1
/* A43E8 800A37E8 50620006 */  beql       $v1, $v0, .L800A3804
/* A43EC 800A37EC AE600034 */   sw        $zero, 0x34($s3)
/* A43F0 800A37F0 0C028918 */  jal        setBorgFlag
/* A43F4 800A37F4 26520080 */   addiu     $s2, $s2, 0x80
/* A43F8 800A37F8 0C028A22 */  jal        getBorgItem
/* A43FC 800A37FC 8E640034 */   lw        $a0, 0x34($s3)
/* A4400 800A3800 AE620034 */  sw         $v0, 0x34($s3)
.L800A3804:
/* A4404 800A3804 8E640038 */  lw         $a0, 0x38($s3)
/* A4408 800A3808 5080000D */  beql       $a0, $zero, .L800A3840
/* A440C 800A380C 8E64003C */   lw        $a0, 0x3c($s3)
/* A4410 800A3810 8E710014 */  lw         $s1, 0x14($s3)
/* A4414 800A3814 12200009 */  beqz       $s1, .L800A383C
/* A4418 800A3818 00808021 */   addu      $s0, $a0, $zero
.L800A381C:
/* A441C 800A381C 0C028918 */  jal        setBorgFlag
/* A4420 800A3820 26520020 */   addiu     $s2, $s2, 0x20
/* A4424 800A3824 8E040000 */  lw         $a0, ($s0)
/* A4428 800A3828 0C028A22 */  jal        getBorgItem
/* A442C 800A382C 2631FFFF */   addiu     $s1, $s1, -1
/* A4430 800A3830 AE020000 */  sw         $v0, ($s0)
/* A4434 800A3834 1620FFF9 */  bnez       $s1, .L800A381C
/* A4438 800A3838 26100004 */   addiu     $s0, $s0, 4
.L800A383C:
/* A443C 800A383C 8E64003C */  lw         $a0, 0x3c($s3)
.L800A3840:
/* A4440 800A3840 1080002B */  beqz       $a0, .L800A38F0
/* A4444 800A3844 00000000 */   nop
/* A4448 800A3848 8E710018 */  lw         $s1, 0x18($s3)
/* A444C 800A384C 12200028 */  beqz       $s1, .L800A38F0
/* A4450 800A3850 00808021 */   addu      $s0, $a0, $zero
/* A4454 800A3854 2415FFF8 */  addiu      $s5, $zero, -8
/* A4458 800A3858 2414FFFF */  addiu      $s4, $zero, -1
.L800A385C:
/* A445C 800A385C 0C02891C */  jal        clearBorgFlag
/* A4460 800A3860 00000000 */   nop
/* A4464 800A3864 0C028A22 */  jal        getBorgItem
/* A4468 800A3868 8E040000 */   lw        $a0, ($s0)
/* A446C 800A386C 00403021 */  addu       $a2, $v0, $zero
/* A4470 800A3870 8CC40058 */  lw         $a0, 0x58($a2)
/* A4474 800A3874 8C82003C */  lw         $v0, 0x3c($a0)
/* A4478 800A3878 10400006 */  beqz       $v0, .L800A3894
/* A447C 800A387C AE060000 */   sw        $a2, ($s0)
/* A4480 800A3880 26520007 */  addiu      $s2, $s2, 7
/* A4484 800A3884 8C820038 */  lw         $v0, 0x38($a0)
/* A4488 800A3888 02559024 */  and        $s2, $s2, $s5
/* A448C 800A388C 00021100 */  sll        $v0, $v0, 4
/* A4490 800A3890 02429021 */  addu       $s2, $s2, $v0
.L800A3894:
/* A4494 800A3894 00003821 */  addu       $a3, $zero, $zero
/* A4498 800A3898 2629FFFF */  addiu      $t1, $s1, -1
/* A449C 800A389C 8C830040 */  lw         $v1, 0x40($a0)
/* A44A0 800A38A0 8C850004 */  lw         $a1, 4($a0)
/* A44A4 800A38A4 10A00008 */  beqz       $a1, .L800A38C8
/* A44A8 800A38A8 26040004 */   addiu     $a0, $s0, 4
.L800A38AC:
/* A44AC 800A38AC 8C620000 */  lw         $v0, ($v1)
/* A44B0 800A38B0 30420003 */  andi       $v0, $v0, 3
/* A44B4 800A38B4 54400001 */  bnel       $v0, $zero, .L800A38BC
/* A44B8 800A38B8 34E70001 */   ori       $a3, $a3, 1
.L800A38BC:
/* A44BC 800A38BC 24A5FFFF */  addiu      $a1, $a1, -1
/* A44C0 800A38C0 14A0FFFA */  bnez       $a1, .L800A38AC
/* A44C4 800A38C4 24630014 */   addiu     $v1, $v1, 0x14
.L800A38C8:
/* A44C8 800A38C8 50E00005 */  beql       $a3, $zero, .L800A38E0
/* A44CC 800A38CC ACC00008 */   sw        $zero, 8($a2)
/* A44D0 800A38D0 26520060 */  addiu      $s2, $s2, 0x60
/* A44D4 800A38D4 ACD40008 */  sw         $s4, 8($a2)
/* A44D8 800A38D8 08028E39 */  j          .L800A38E4
/* A44DC 800A38DC ACD4000C */   sw        $s4, 0xc($a2)
.L800A38E0:
/* A44E0 800A38E0 ACC0000C */  sw         $zero, 0xc($a2)
.L800A38E4:
/* A44E4 800A38E4 01208821 */  addu       $s1, $t1, $zero
/* A44E8 800A38E8 1620FFDC */  bnez       $s1, .L800A385C
/* A44EC 800A38EC 00808021 */   addu      $s0, $a0, $zero
.L800A38F0:
/* A44F0 800A38F0 0C02891C */  jal        clearBorgFlag
/* A44F4 800A38F4 00000000 */   nop
/* A44F8 800A38F8 8E640040 */  lw         $a0, 0x40($s3)
/* A44FC 800A38FC 5080000B */  beql       $a0, $zero, .L800A392C
/* A4500 800A3900 02402021 */   addu      $a0, $s2, $zero
/* A4504 800A3904 8E71001C */  lw         $s1, 0x1c($s3)
/* A4508 800A3908 12200007 */  beqz       $s1, .L800A3928
/* A450C 800A390C 00808021 */   addu      $s0, $a0, $zero
.L800A3910:
/* A4510 800A3910 8E040000 */  lw         $a0, ($s0)
/* A4514 800A3914 0C028A22 */  jal        getBorgItem
/* A4518 800A3918 2631FFFF */   addiu     $s1, $s1, -1
/* A451C 800A391C AE020000 */  sw         $v0, ($s0)
/* A4520 800A3920 1620FFFB */  bnez       $s1, .L800A3910
/* A4524 800A3924 26100004 */   addiu     $s0, $s0, 4
.L800A3928:
/* A4528 800A3928 02402021 */  addu       $a0, $s2, $zero
.L800A392C:
/* A452C 800A392C 26C53120 */  addiu      $a1, $s6, 0x3120
/* A4530 800A3930 0C025F9C */  jal        Malloc
/* A4534 800A3934 240606BF */   addiu     $a2, $zero, 0x6bf
/* A4538 800A3938 8E700028 */  lw         $s0, 0x28($s3)
/* A453C 800A393C 8E710010 */  lw         $s1, 0x10($s3)
/* A4540 800A3940 00409021 */  addu       $s2, $v0, $zero
/* A4544 800A3944 12200024 */  beqz       $s1, .L800A39D8
/* A4548 800A3948 AE620008 */   sw        $v0, 8($s3)
/* A454C 800A394C AE12000C */  sw         $s2, 0xc($s0)
.L800A3950:
/* A4550 800A3950 02401021 */  addu       $v0, $s2, $zero
/* A4554 800A3954 AC400140 */  sw         $zero, 0x140($v0)
/* A4558 800A3958 8E03000C */  lw         $v1, 0xc($s0)
/* A455C 800A395C AC600144 */  sw         $zero, 0x144($v1)
/* A4560 800A3960 8E02000C */  lw         $v0, 0xc($s0)
/* A4564 800A3964 AC400148 */  sw         $zero, 0x148($v0)
/* A4568 800A3968 8E03000C */  lw         $v1, 0xc($s0)
/* A456C 800A396C AC60014C */  sw         $zero, 0x14c($v1)
/* A4570 800A3970 8E02000C */  lw         $v0, 0xc($s0)
/* A4574 800A3974 AC400150 */  sw         $zero, 0x150($v0)
/* A4578 800A3978 8E03000C */  lw         $v1, 0xc($s0)
/* A457C 800A397C AC600154 */  sw         $zero, 0x154($v1)
/* A4580 800A3980 8E02000C */  lw         $v0, 0xc($s0)
/* A4584 800A3984 AC400158 */  sw         $zero, 0x158($v0)
/* A4588 800A3988 8E03000C */  lw         $v1, 0xc($s0)
/* A458C 800A398C AC60015C */  sw         $zero, 0x15c($v1)
/* A4590 800A3990 8E02000C */  lw         $v0, 0xc($s0)
/* A4594 800A3994 AC400160 */  sw         $zero, 0x160($v0)
/* A4598 800A3998 8E03000C */  lw         $v1, 0xc($s0)
/* A459C 800A399C AC600164 */  sw         $zero, 0x164($v1)
/* A45A0 800A39A0 8E02000C */  lw         $v0, 0xc($s0)
/* A45A4 800A39A4 AC400168 */  sw         $zero, 0x168($v0)
/* A45A8 800A39A8 8E03000C */  lw         $v1, 0xc($s0)
/* A45AC 800A39AC 26520188 */  addiu      $s2, $s2, 0x188
/* A45B0 800A39B0 AC60016C */  sw         $zero, 0x16c($v1)
/* A45B4 800A39B4 8E04000C */  lw         $a0, 0xc($s0)
/* A45B8 800A39B8 0C0311F0 */  jal        guMtxIdent
/* A45BC 800A39BC 2631FFFF */   addiu     $s1, $s1, -1
/* A45C0 800A39C0 8E04000C */  lw         $a0, 0xc($s0)
/* A45C4 800A39C4 26100040 */  addiu      $s0, $s0, 0x40
/* A45C8 800A39C8 0C0311F0 */  jal        guMtxIdent
/* A45CC 800A39CC 24840040 */   addiu     $a0, $a0, 0x40
/* A45D0 800A39D0 5620FFDF */  bnel       $s1, $zero, .L800A3950
/* A45D4 800A39D4 AE12000C */   sw        $s2, 0xc($s0)
.L800A39D8:
/* A45D8 800A39D8 8E620034 */  lw         $v0, 0x34($s3)
/* A45DC 800A39DC 50400004 */  beql       $v0, $zero, .L800A39F0
/* A45E0 800A39E0 8E620038 */   lw        $v0, 0x38($s3)
/* A45E4 800A39E4 AC52002C */  sw         $s2, 0x2c($v0)
/* A45E8 800A39E8 26520080 */  addiu      $s2, $s2, 0x80
/* A45EC 800A39EC 8E620038 */  lw         $v0, 0x38($s3)
.L800A39F0:
/* A45F0 800A39F0 5040000B */  beql       $v0, $zero, .L800A3A20
/* A45F4 800A39F4 8E62003C */   lw        $v0, 0x3c($s3)
/* A45F8 800A39F8 8E710014 */  lw         $s1, 0x14($s3)
/* A45FC 800A39FC 12200007 */  beqz       $s1, .L800A3A1C
/* A4600 800A3A00 00401821 */   addu      $v1, $v0, $zero
.L800A3A04:
/* A4604 800A3A04 2631FFFF */  addiu      $s1, $s1, -1
/* A4608 800A3A08 8C620000 */  lw         $v0, ($v1)
/* A460C 800A3A0C 24630004 */  addiu      $v1, $v1, 4
/* A4610 800A3A10 AC520018 */  sw         $s2, 0x18($v0)
/* A4614 800A3A14 1620FFFB */  bnez       $s1, .L800A3A04
/* A4618 800A3A18 26520020 */   addiu     $s2, $s2, 0x20
.L800A3A1C:
/* A461C 800A3A1C 8E62003C */  lw         $v0, 0x3c($s3)
.L800A3A20:
/* A4620 800A3A20 10400030 */  beqz       $v0, .L800A3AE4
/* A4624 800A3A24 8FBF002C */   lw        $ra, 0x2c($sp)
/* A4628 800A3A28 8E710018 */  lw         $s1, 0x18($s3)
/* A462C 800A3A2C 1220002D */  beqz       $s1, .L800A3AE4
/* A4630 800A3A30 00404021 */   addu      $t0, $v0, $zero
/* A4634 800A3A34 240BFFF8 */  addiu      $t3, $zero, -8
.L800A3A38:
/* A4638 800A3A38 8D020000 */  lw         $v0, ($t0)
/* A463C 800A3A3C 8C430058 */  lw         $v1, 0x58($v0)
/* A4640 800A3A40 2629FFFF */  addiu      $t1, $s1, -1
/* A4644 800A3A44 8C62003C */  lw         $v0, 0x3c($v1)
/* A4648 800A3A48 10400017 */  beqz       $v0, .L800A3AA8
/* A464C 800A3A4C 250A0004 */   addiu     $t2, $t0, 4
/* A4650 800A3A50 26520007 */  addiu      $s2, $s2, 7
/* A4654 800A3A54 024B9024 */  and        $s2, $s2, $t3
/* A4658 800A3A58 8C670038 */  lw         $a3, 0x38($v1)
/* A465C 800A3A5C 8C660034 */  lw         $a2, 0x34($v1)
/* A4660 800A3A60 02402021 */  addu       $a0, $s2, $zero
/* A4664 800A3A64 AC720038 */  sw         $s2, 0x38($v1)
/* A4668 800A3A68 10E0000D */  beqz       $a3, .L800A3AA0
/* A466C 800A3A6C 00E02821 */   addu      $a1, $a3, $zero
.L800A3A70:
/* A4670 800A3A70 8CC20000 */  lw         $v0, ($a2)
/* A4674 800A3A74 AC820000 */  sw         $v0, ($a0)
/* A4678 800A3A78 8CC30004 */  lw         $v1, 4($a2)
/* A467C 800A3A7C AC830004 */  sw         $v1, 4($a0)
/* A4680 800A3A80 8CC20008 */  lw         $v0, 8($a2)
/* A4684 800A3A84 24A5FFFF */  addiu      $a1, $a1, -1
/* A4688 800A3A88 AC820008 */  sw         $v0, 8($a0)
/* A468C 800A3A8C 8CC3000C */  lw         $v1, 0xc($a2)
/* A4690 800A3A90 24C60010 */  addiu      $a2, $a2, 0x10
/* A4694 800A3A94 AC83000C */  sw         $v1, 0xc($a0)
/* A4698 800A3A98 14A0FFF5 */  bnez       $a1, .L800A3A70
/* A469C 800A3A9C 24840010 */   addiu     $a0, $a0, 0x10
.L800A3AA0:
/* A46A0 800A3AA0 00071100 */  sll        $v0, $a3, 4
/* A46A4 800A3AA4 02429021 */  addu       $s2, $s2, $v0
.L800A3AA8:
/* A46A8 800A3AA8 8D030000 */  lw         $v1, ($t0)
/* A46AC 800A3AAC 8C620008 */  lw         $v0, 8($v1)
/* A46B0 800A3AB0 50400005 */  beql       $v0, $zero, .L800A3AC8
/* A46B4 800A3AB4 8C62000C */   lw        $v0, 0xc($v1)
/* A46B8 800A3AB8 AC720008 */  sw         $s2, 8($v1)
/* A46BC 800A3ABC 26520040 */  addiu      $s2, $s2, 0x40
/* A46C0 800A3AC0 8D030000 */  lw         $v1, ($t0)
/* A46C4 800A3AC4 8C62000C */  lw         $v0, 0xc($v1)
.L800A3AC8:
/* A46C8 800A3AC8 10400003 */  beqz       $v0, .L800A3AD8
/* A46CC 800A3ACC 01208821 */   addu      $s1, $t1, $zero
/* A46D0 800A3AD0 AC72000C */  sw         $s2, 0xc($v1)
/* A46D4 800A3AD4 26520020 */  addiu      $s2, $s2, 0x20
.L800A3AD8:
/* A46D8 800A3AD8 1620FFD7 */  bnez       $s1, .L800A3A38
/* A46DC 800A3ADC 01404021 */   addu      $t0, $t2, $zero
/* A46E0 800A3AE0 8FBF002C */  lw         $ra, 0x2c($sp)
.L800A3AE4:
/* A46E4 800A3AE4 8FB60028 */  lw         $s6, 0x28($sp)
/* A46E8 800A3AE8 8FB50024 */  lw         $s5, 0x24($sp)
/* A46EC 800A3AEC 8FB40020 */  lw         $s4, 0x20($sp)
/* A46F0 800A3AF0 8FB3001C */  lw         $s3, 0x1c($sp)
/* A46F4 800A3AF4 8FB20018 */  lw         $s2, 0x18($sp)
/* A46F8 800A3AF8 8FB10014 */  lw         $s1, 0x14($sp)
/* A46FC 800A3AFC 8FB00010 */  lw         $s0, 0x10($sp)
/* A4700 800A3B00 00001021 */  addu       $v0, $zero, $zero
/* A4704 800A3B04 03E00008 */  jr         $ra
/* A4708 800A3B08 27BD0030 */   addiu     $sp, $sp, 0x30

glabel borg5_free
/* A470C 800A3B0C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A4710 800A3B10 AFB20018 */  sw         $s2, 0x18($sp)
/* A4714 800A3B14 00809021 */  addu       $s2, $a0, $zero
/* A4718 800A3B18 AFBF0028 */  sw         $ra, 0x28($sp)
/* A471C 800A3B1C AFB50024 */  sw         $s5, 0x24($sp)
/* A4720 800A3B20 AFB40020 */  sw         $s4, 0x20($sp)
/* A4724 800A3B24 AFB3001C */  sw         $s3, 0x1c($sp)
/* A4728 800A3B28 AFB10014 */  sw         $s1, 0x14($sp)
/* A472C 800A3B2C 0C02608C */  jal        get_memUsed
/* A4730 800A3B30 AFB00010 */   sw        $s0, 0x10($sp)
/* A4734 800A3B34 8E440034 */  lw         $a0, 0x34($s2)
/* A4738 800A3B38 10800003 */  beqz       $a0, .L800A3B48
/* A473C 800A3B3C 0040A821 */   addu      $s5, $v0, $zero
/* A4740 800A3B40 0C028D5F */  jal        borg3_free
/* A4744 800A3B44 00000000 */   nop
.L800A3B48:
/* A4748 800A3B48 3C13800F */  lui        $s3, 0x800f
/* A474C 800A3B4C 8E440038 */  lw         $a0, 0x38($s2)
/* A4750 800A3B50 1080000A */  beqz       $a0, .L800A3B7C
/* A4754 800A3B54 3C14800F */   lui       $s4, 0x800f
/* A4758 800A3B58 8E500014 */  lw         $s0, 0x14($s2)
/* A475C 800A3B5C 12000007 */  beqz       $s0, .L800A3B7C
/* A4760 800A3B60 00808821 */   addu      $s1, $a0, $zero
/* A4764 800A3B64 8E240000 */  lw         $a0, ($s1)
.L800A3B68:
/* A4768 800A3B68 2610FFFF */  addiu      $s0, $s0, -1
/* A476C 800A3B6C 0C028D32 */  jal        Borg4_free
/* A4770 800A3B70 26310004 */   addiu     $s1, $s1, 4
/* A4774 800A3B74 5600FFFC */  bnel       $s0, $zero, .L800A3B68
/* A4778 800A3B78 8E240000 */   lw        $a0, ($s1)
.L800A3B7C:
/* A477C 800A3B7C 8E44003C */  lw         $a0, 0x3c($s2)
/* A4780 800A3B80 5080000B */  beql       $a0, $zero, .L800A3BB0
/* A4784 800A3B84 8E440040 */   lw        $a0, 0x40($s2)
/* A4788 800A3B88 8E500018 */  lw         $s0, 0x18($s2)
/* A478C 800A3B8C 12000007 */  beqz       $s0, .L800A3BAC
/* A4790 800A3B90 00808821 */   addu      $s1, $a0, $zero
/* A4794 800A3B94 8E240000 */  lw         $a0, ($s1)
.L800A3B98:
/* A4798 800A3B98 2610FFFF */  addiu      $s0, $s0, -1
/* A479C 800A3B9C 0C028CDE */  jal        borg_2_free
/* A47A0 800A3BA0 26310004 */   addiu     $s1, $s1, 4
/* A47A4 800A3BA4 5600FFFC */  bnel       $s0, $zero, .L800A3B98
/* A47A8 800A3BA8 8E240000 */   lw        $a0, ($s1)
.L800A3BAC:
/* A47AC 800A3BAC 8E440040 */  lw         $a0, 0x40($s2)
.L800A3BB0:
/* A47B0 800A3BB0 5080000B */  beql       $a0, $zero, .L800A3BE0
/* A47B4 800A3BB4 8E440000 */   lw        $a0, ($s2)
/* A47B8 800A3BB8 8E50001C */  lw         $s0, 0x1c($s2)
/* A47BC 800A3BBC 12000007 */  beqz       $s0, .L800A3BDC
/* A47C0 800A3BC0 00808821 */   addu      $s1, $a0, $zero
/* A47C4 800A3BC4 8E240000 */  lw         $a0, ($s1)
.L800A3BC8:
/* A47C8 800A3BC8 2610FFFF */  addiu      $s0, $s0, -1
/* A47CC 800A3BCC 0C028C37 */  jal        borg1_free
/* A47D0 800A3BD0 26310004 */   addiu     $s1, $s1, 4
/* A47D4 800A3BD4 5600FFFC */  bnel       $s0, $zero, .L800A3BC8
/* A47D8 800A3BD8 8E240000 */   lw        $a0, ($s1)
.L800A3BDC:
/* A47DC 800A3BDC 8E440000 */  lw         $a0, ($s2)
.L800A3BE0:
/* A47E0 800A3BE0 2402FFFF */  addiu      $v0, $zero, -1
/* A47E4 800A3BE4 1482000C */  bne        $a0, $v0, .L800A3C18
/* A47E8 800A3BE8 3C10800E */   lui       $s0, %hi(D_800E3120)
/* A47EC 800A3BEC 8E440008 */  lw         $a0, 8($s2)
/* A47F0 800A3BF0 26103120 */  addiu      $s0, $s0, %lo(D_800E3120)
/* A47F4 800A3BF4 02002821 */  addu       $a1, $s0, $zero
/* A47F8 800A3BF8 0C02600C */  jal        Free
/* A47FC 800A3BFC 2406078B */   addiu     $a2, $zero, 0x78b
/* A4800 800A3C00 02402021 */  addu       $a0, $s2, $zero
/* A4804 800A3C04 02002821 */  addu       $a1, $s0, $zero
/* A4808 800A3C08 0C02600C */  jal        Free
/* A480C 800A3C0C 2406078F */   addiu     $a2, $zero, 0x78f
/* A4810 800A3C10 08028F11 */  j          .L800A3C44
/* A4814 800A3C14 00000000 */   nop
.L800A3C18:
/* A4818 800A3C18 0C028B7A */  jal        get_borg_index_count
/* A481C 800A3C1C 00000000 */   nop
/* A4820 800A3C20 24030001 */  addiu      $v1, $zero, 1
/* A4824 800A3C24 14430005 */  bne        $v0, $v1, .L800A3C3C
/* A4828 800A3C28 3C05800E */   lui       $a1, %hi(D_800E3120)
/* A482C 800A3C2C 8E440008 */  lw         $a0, 8($s2)
/* A4830 800A3C30 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A4834 800A3C34 0C02600C */  jal        Free
/* A4838 800A3C38 24060795 */   addiu     $a2, $zero, 0x795
.L800A3C3C:
/* A483C 800A3C3C 0C028B7F */  jal        dec_borg_count
/* A4840 800A3C40 8E440000 */   lw        $a0, ($s2)
.L800A3C44:
/* A4844 800A3C44 0C02608C */  jal        get_memUsed
/* A4848 800A3C48 00000000 */   nop
/* A484C 800A3C4C 2665348C */  addiu      $a1, $s3, 0x348c
/* A4850 800A3C50 02A21023 */  subu       $v0, $s5, $v0
/* A4854 800A3C54 268634C8 */  addiu      $a2, $s4, 0x34c8
/* A4858 800A3C58 8CA30014 */  lw         $v1, 0x14($a1)
/* A485C 800A3C5C 8CC40014 */  lw         $a0, 0x14($a2)
/* A4860 800A3C60 8FBF0028 */  lw         $ra, 0x28($sp)
/* A4864 800A3C64 8FB50024 */  lw         $s5, 0x24($sp)
/* A4868 800A3C68 8FB40020 */  lw         $s4, 0x20($sp)
/* A486C 800A3C6C 8FB3001C */  lw         $s3, 0x1c($sp)
/* A4870 800A3C70 8FB20018 */  lw         $s2, 0x18($sp)
/* A4874 800A3C74 8FB10014 */  lw         $s1, 0x14($sp)
/* A4878 800A3C78 8FB00010 */  lw         $s0, 0x10($sp)
/* A487C 800A3C7C 00621823 */  subu       $v1, $v1, $v0
/* A4880 800A3C80 2484FFFF */  addiu      $a0, $a0, -1
/* A4884 800A3C84 ACA30014 */  sw         $v1, 0x14($a1)
/* A4888 800A3C88 ACC40014 */  sw         $a0, 0x14($a2)
/* A488C 800A3C8C 03E00008 */  jr         $ra
/* A4890 800A3C90 27BD0030 */   addiu     $sp, $sp, 0x30

glabel borg6_func_a
/* A4894 800A3C94 00002821 */  addu       $a1, $zero, $zero
/* A4898 800A3C98 8C820008 */  lw         $v0, 8($a0)
/* A489C 800A3C9C 8C8C0004 */  lw         $t4, 4($a0)
/* A48A0 800A3CA0 00441021 */  addu       $v0, $v0, $a0
/* A48A4 800A3CA4 00401821 */  addu       $v1, $v0, $zero
/* A48A8 800A3CA8 19800024 */  blez       $t4, .L800A3D3C
/* A48AC 800A3CAC AC820008 */   sw        $v0, 8($a0)
.L800A3CB0:
/* A48B0 800A3CB0 00003821 */  addu       $a3, $zero, $zero
/* A48B4 800A3CB4 24AB0001 */  addiu      $t3, $a1, 1
/* A48B8 800A3CB8 246A0018 */  addiu      $t2, $v1, 0x18
/* A48BC 800A3CBC 8C620014 */  lw         $v0, 0x14($v1)
/* A48C0 800A3CC0 8C690010 */  lw         $t1, 0x10($v1)
/* A48C4 800A3CC4 00441021 */  addu       $v0, $v0, $a0
/* A48C8 800A3CC8 00403021 */  addu       $a2, $v0, $zero
/* A48CC 800A3CCC 19200017 */  blez       $t1, .L800A3D2C
/* A48D0 800A3CD0 AC620014 */   sw        $v0, 0x14($v1)
.L800A3CD4:
/* A48D4 800A3CD4 8CC20004 */  lw         $v0, 4($a2)
/* A48D8 800A3CD8 24E70001 */  addiu      $a3, $a3, 1
/* A48DC 800A3CDC 00441021 */  addu       $v0, $v0, $a0
/* A48E0 800A3CE0 00402821 */  addu       $a1, $v0, $zero
/* A48E4 800A3CE4 ACC20004 */  sw         $v0, 4($a2)
/* A48E8 800A3CE8 8CA30004 */  lw         $v1, 4($a1)
/* A48EC 800A3CEC 84A20000 */  lh         $v0, ($a1)
/* A48F0 800A3CF0 00641821 */  addu       $v1, $v1, $a0
/* A48F4 800A3CF4 ACA30004 */  sw         $v1, 4($a1)
/* A48F8 800A3CF8 84C30000 */  lh         $v1, ($a2)
/* A48FC 800A3CFC 10430008 */  beq        $v0, $v1, .L800A3D20
/* A4900 800A3D00 24C80010 */   addiu     $t0, $a2, 0x10
/* A4904 800A3D04 00603021 */  addu       $a2, $v1, $zero
.L800A3D08:
/* A4908 800A3D08 24A50008 */  addiu      $a1, $a1, 8
/* A490C 800A3D0C 8CA20004 */  lw         $v0, 4($a1)
/* A4910 800A3D10 84A30000 */  lh         $v1, ($a1)
/* A4914 800A3D14 00441021 */  addu       $v0, $v0, $a0
/* A4918 800A3D18 1466FFFB */  bne        $v1, $a2, .L800A3D08
/* A491C 800A3D1C ACA20004 */   sw        $v0, 4($a1)
.L800A3D20:
/* A4920 800A3D20 00E9102A */  slt        $v0, $a3, $t1
/* A4924 800A3D24 1440FFEB */  bnez       $v0, .L800A3CD4
/* A4928 800A3D28 01003021 */   addu      $a2, $t0, $zero
.L800A3D2C:
/* A492C 800A3D2C 01602821 */  addu       $a1, $t3, $zero
/* A4930 800A3D30 00AC102A */  slt        $v0, $a1, $t4
/* A4934 800A3D34 1440FFDE */  bnez       $v0, .L800A3CB0
/* A4938 800A3D38 01401821 */   addu      $v1, $t2, $zero
.L800A3D3C:
/* A493C 800A3D3C 03E00008 */  jr         $ra
/* A4940 800A3D40 00000000 */   nop

glabel borg6_func_b
/* A4944 800A3D44 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A4948 800A3D48 00A01821 */  addu       $v1, $a1, $zero
/* A494C 800A3D4C AFB00010 */  sw         $s0, 0x10($sp)
/* A4950 800A3D50 3C10800E */  lui        $s0, %hi(D_800E3120)
/* A4954 800A3D54 26053120 */  addiu      $a1, $s0, %lo(D_800E3120)
/* A4958 800A3D58 24060810 */  addiu      $a2, $zero, 0x810
/* A495C 800A3D5C AFB50024 */  sw         $s5, 0x24($sp)
/* A4960 800A3D60 0000A821 */  addu       $s5, $zero, $zero
/* A4964 800A3D64 AFB3001C */  sw         $s3, 0x1c($sp)
/* A4968 800A3D68 00009821 */  addu       $s3, $zero, $zero
/* A496C 800A3D6C AFBF002C */  sw         $ra, 0x2c($sp)
/* A4970 800A3D70 AFB60028 */  sw         $s6, 0x28($sp)
/* A4974 800A3D74 AFB40020 */  sw         $s4, 0x20($sp)
/* A4978 800A3D78 AFB20018 */  sw         $s2, 0x18($sp)
/* A497C 800A3D7C AFB10014 */  sw         $s1, 0x14($sp)
/* A4980 800A3D80 8C620004 */  lw         $v0, 4($v1)
/* A4984 800A3D84 3C01800E */  lui        $at, %hi(D_800E3268)
/* A4988 800A3D88 C4203268 */  lwc1       $f0, %lo(D_800E3268)($at)
/* A498C 800A3D8C 0080B021 */  addu       $s6, $a0, $zero
/* A4990 800A3D90 AEC30020 */  sw         $v1, 0x20($s6)
/* A4994 800A3D94 AEC00018 */  sw         $zero, 0x18($s6)
/* A4998 800A3D98 00022040 */  sll        $a0, $v0, 1
/* A499C 800A3D9C 00822021 */  addu       $a0, $a0, $v0
/* A49A0 800A3DA0 000420C0 */  sll        $a0, $a0, 3
/* A49A4 800A3DA4 0C025F9C */  jal        Malloc
/* A49A8 800A3DA8 E6C0001C */   swc1      $f0, 0x1c($s6)
/* A49AC 800A3DAC 8EC30020 */  lw         $v1, 0x20($s6)
/* A49B0 800A3DB0 00409021 */  addu       $s2, $v0, $zero
/* A49B4 800A3DB4 AEC20014 */  sw         $v0, 0x14($s6)
/* A49B8 800A3DB8 8C740004 */  lw         $s4, 4($v1)
/* A49BC 800A3DBC 1A800023 */  blez       $s4, .L800A3E4C
/* A49C0 800A3DC0 8C710008 */   lw        $s1, 8($v1)
.L800A3DC4:
/* A49C4 800A3DC4 26053120 */  addiu      $a1, $s0, 0x3120
/* A49C8 800A3DC8 8E240010 */  lw         $a0, 0x10($s1)
/* A49CC 800A3DCC 24060821 */  addiu      $a2, $zero, 0x821
/* A49D0 800A3DD0 AE510000 */  sw         $s1, ($s2)
/* A49D4 800A3DD4 AE400004 */  sw         $zero, 4($s2)
/* A49D8 800A3DD8 AE400008 */  sw         $zero, 8($s2)
/* A49DC 800A3DDC 0C025F9C */  jal        Malloc
/* A49E0 800A3DE0 00042100 */   sll       $a0, $a0, 4
/* A49E4 800A3DE4 00402821 */  addu       $a1, $v0, $zero
/* A49E8 800A3DE8 266F0001 */  addiu      $t7, $s3, 1
/* A49EC 800A3DEC 8E260014 */  lw         $a2, 0x14($s1)
/* A49F0 800A3DF0 8E230008 */  lw         $v1, 8($s1)
/* A49F4 800A3DF4 262E0018 */  addiu      $t6, $s1, 0x18
/* A49F8 800A3DF8 AE430010 */  sw         $v1, 0x10($s2)
/* A49FC 800A3DFC 8E280010 */  lw         $t0, 0x10($s1)
/* A4A00 800A3E00 264D0018 */  addiu      $t5, $s2, 0x18
/* A4A04 800A3E04 1900000C */  blez       $t0, .L800A3E38
/* A4A08 800A3E08 AE42000C */   sw        $v0, 0xc($s2)
/* A4A0C 800A3E0C 24030001 */  addiu      $v1, $zero, 1
/* A4A10 800A3E10 01002021 */  addu       $a0, $t0, $zero
.L800A3E14:
/* A4A14 800A3E14 26B50010 */  addiu      $s5, $s5, 0x10
/* A4A18 800A3E18 8CC20004 */  lw         $v0, 4($a2)
/* A4A1C 800A3E1C 2484FFFF */  addiu      $a0, $a0, -1
/* A4A20 800A3E20 ACA60000 */  sw         $a2, ($a1)
/* A4A24 800A3E24 24C60010 */  addiu      $a2, $a2, 0x10
/* A4A28 800A3E28 A4A3000C */  sh         $v1, 0xc($a1)
/* A4A2C 800A3E2C ACA20004 */  sw         $v0, 4($a1)
/* A4A30 800A3E30 1480FFF8 */  bnez       $a0, .L800A3E14
/* A4A34 800A3E34 24A50010 */   addiu     $a1, $a1, 0x10
.L800A3E38:
/* A4A38 800A3E38 01E09821 */  addu       $s3, $t7, $zero
/* A4A3C 800A3E3C 01C08821 */  addu       $s1, $t6, $zero
/* A4A40 800A3E40 0274102A */  slt        $v0, $s3, $s4
/* A4A44 800A3E44 1440FFDF */  bnez       $v0, .L800A3DC4
/* A4A48 800A3E48 01A09021 */   addu      $s2, $t5, $zero
.L800A3E4C:
/* A4A4C 800A3E4C 02A02021 */  addu       $a0, $s5, $zero
/* A4A50 800A3E50 26053120 */  addiu      $a1, $s0, 0x3120
/* A4A54 800A3E54 0C025F9C */  jal        Malloc
/* A4A58 800A3E58 2406087D */   addiu     $a2, $zero, 0x87d
/* A4A5C 800A3E5C 00404821 */  addu       $t1, $v0, $zero
/* A4A60 800A3E60 00009821 */  addu       $s3, $zero, $zero
/* A4A64 800A3E64 8EC20020 */  lw         $v0, 0x20($s6)
/* A4A68 800A3E68 8ED20014 */  lw         $s2, 0x14($s6)
/* A4A6C 800A3E6C 8C540004 */  lw         $s4, 4($v0)
/* A4A70 800A3E70 1A800028 */  blez       $s4, .L800A3F14
/* A4A74 800A3E74 8C510008 */   lw        $s1, 8($v0)
.L800A3E78:
/* A4A78 800A3E78 00002021 */  addu       $a0, $zero, $zero
/* A4A7C 800A3E7C 266F0001 */  addiu      $t7, $s3, 1
/* A4A80 800A3E80 262E0018 */  addiu      $t6, $s1, 0x18
/* A4A84 800A3E84 264D0018 */  addiu      $t5, $s2, 0x18
/* A4A88 800A3E88 8E280010 */  lw         $t0, 0x10($s1)
/* A4A8C 800A3E8C 8E260014 */  lw         $a2, 0x14($s1)
/* A4A90 800A3E90 1900001B */  blez       $t0, .L800A3F00
/* A4A94 800A3E94 8E45000C */   lw        $a1, 0xc($s2)
.L800A3E98:
/* A4A98 800A3E98 01201821 */  addu       $v1, $t1, $zero
/* A4A9C 800A3E9C 24070004 */  addiu      $a3, $zero, 4
/* A4AA0 800A3EA0 248A0001 */  addiu      $t2, $a0, 1
/* A4AA4 800A3EA4 24CB0010 */  addiu      $t3, $a2, 0x10
/* A4AA8 800A3EA8 24AC0010 */  addiu      $t4, $a1, 0x10
/* A4AAC 800A3EAC 8CC20004 */  lw         $v0, 4($a2)
/* A4AB0 800A3EB0 24660010 */  addiu      $a2, $v1, 0x10
/* A4AB4 800A3EB4 ACA90008 */  sw         $t1, 8($a1)
/* A4AB8 800A3EB8 84450002 */  lh         $a1, 2($v0)
/* A4ABC 800A3EBC 8C440004 */  lw         $a0, 4($v0)
.L800A3EC0:
/* A4AC0 800A3EC0 30A20001 */  andi       $v0, $a1, 1
/* A4AC4 800A3EC4 50400004 */  beql       $v0, $zero, .L800A3ED8
/* A4AC8 800A3EC8 AC600000 */   sw        $zero, ($v1)
/* A4ACC 800A3ECC C4800000 */  lwc1       $f0, ($a0)
/* A4AD0 800A3ED0 24840004 */  addiu      $a0, $a0, 4
/* A4AD4 800A3ED4 E4600000 */  swc1       $f0, ($v1)
.L800A3ED8:
/* A4AD8 800A3ED8 00052843 */  sra        $a1, $a1, 1
/* A4ADC 800A3EDC 24E7FFFF */  addiu      $a3, $a3, -1
/* A4AE0 800A3EE0 14E0FFF7 */  bnez       $a3, .L800A3EC0
/* A4AE4 800A3EE4 24630004 */   addiu     $v1, $v1, 4
/* A4AE8 800A3EE8 00C04821 */  addu       $t1, $a2, $zero
/* A4AEC 800A3EEC 01402021 */  addu       $a0, $t2, $zero
/* A4AF0 800A3EF0 01603021 */  addu       $a2, $t3, $zero
/* A4AF4 800A3EF4 0088102A */  slt        $v0, $a0, $t0
/* A4AF8 800A3EF8 1440FFE7 */  bnez       $v0, .L800A3E98
/* A4AFC 800A3EFC 01802821 */   addu      $a1, $t4, $zero
.L800A3F00:
/* A4B00 800A3F00 01E09821 */  addu       $s3, $t7, $zero
/* A4B04 800A3F04 01C08821 */  addu       $s1, $t6, $zero
/* A4B08 800A3F08 0274102A */  slt        $v0, $s3, $s4
/* A4B0C 800A3F0C 1440FFDA */  bnez       $v0, .L800A3E78
/* A4B10 800A3F10 01A09021 */   addu      $s2, $t5, $zero
.L800A3F14:
/* A4B14 800A3F14 8FBF002C */  lw         $ra, 0x2c($sp)
/* A4B18 800A3F18 AEC0000C */  sw         $zero, 0xc($s6)
/* A4B1C 800A3F1C AEC00010 */  sw         $zero, 0x10($s6)
/* A4B20 800A3F20 8FB60028 */  lw         $s6, 0x28($sp)
/* A4B24 800A3F24 8FB50024 */  lw         $s5, 0x24($sp)
/* A4B28 800A3F28 8FB40020 */  lw         $s4, 0x20($sp)
/* A4B2C 800A3F2C 8FB3001C */  lw         $s3, 0x1c($sp)
/* A4B30 800A3F30 8FB20018 */  lw         $s2, 0x18($sp)
/* A4B34 800A3F34 8FB10014 */  lw         $s1, 0x14($sp)
/* A4B38 800A3F38 8FB00010 */  lw         $s0, 0x10($sp)
/* A4B3C 800A3F3C 00001021 */  addu       $v0, $zero, $zero
/* A4B40 800A3F40 03E00008 */  jr         $ra
/* A4B44 800A3F44 27BD0030 */   addiu     $sp, $sp, 0x30

glabel borg_6_free
/* A4B48 800A3F48 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A4B4C 800A3F4C AFB20018 */  sw         $s2, 0x18($sp)
/* A4B50 800A3F50 00809021 */  addu       $s2, $a0, $zero
/* A4B54 800A3F54 AFBF002C */  sw         $ra, 0x2c($sp)
/* A4B58 800A3F58 AFB60028 */  sw         $s6, 0x28($sp)
/* A4B5C 800A3F5C AFB50024 */  sw         $s5, 0x24($sp)
/* A4B60 800A3F60 AFB40020 */  sw         $s4, 0x20($sp)
/* A4B64 800A3F64 AFB3001C */  sw         $s3, 0x1c($sp)
/* A4B68 800A3F68 AFB10014 */  sw         $s1, 0x14($sp)
/* A4B6C 800A3F6C 0C02608C */  jal        get_memUsed
/* A4B70 800A3F70 AFB00010 */   sw        $s0, 0x10($sp)
/* A4B74 800A3F74 3C13800E */  lui        $s3, 0x800e
/* A4B78 800A3F78 3C15800F */  lui        $s5, 0x800f
/* A4B7C 800A3F7C 3C16800F */  lui        $s6, 0x800f
/* A4B80 800A3F80 8E430014 */  lw         $v1, 0x14($s2)
/* A4B84 800A3F84 1060001B */  beqz       $v1, .L800A3FF4
/* A4B88 800A3F88 0040A021 */   addu      $s4, $v0, $zero
/* A4B8C 800A3F8C 8C62000C */  lw         $v0, 0xc($v1)
/* A4B90 800A3F90 26653120 */  addiu      $a1, $s3, 0x3120
/* A4B94 800A3F94 8C440008 */  lw         $a0, 8($v0)
/* A4B98 800A3F98 0C02600C */  jal        Free
/* A4B9C 800A3F9C 240608D7 */   addiu     $a2, $zero, 0x8d7
/* A4BA0 800A3FA0 8E420020 */  lw         $v0, 0x20($s2)
/* A4BA4 800A3FA4 8C430004 */  lw         $v1, 4($v0)
/* A4BA8 800A3FA8 1860000E */  blez       $v1, .L800A3FE4
/* A4BAC 800A3FAC 00008021 */   addu      $s0, $zero, $zero
/* A4BB0 800A3FB0 00008821 */  addu       $s1, $zero, $zero
.L800A3FB4:
/* A4BB4 800A3FB4 8E420014 */  lw         $v0, 0x14($s2)
/* A4BB8 800A3FB8 26653120 */  addiu      $a1, $s3, 0x3120
/* A4BBC 800A3FBC 02221021 */  addu       $v0, $s1, $v0
/* A4BC0 800A3FC0 8C44000C */  lw         $a0, 0xc($v0)
/* A4BC4 800A3FC4 0C02600C */  jal        Free
/* A4BC8 800A3FC8 240608DD */   addiu     $a2, $zero, 0x8dd
/* A4BCC 800A3FCC 8E430020 */  lw         $v1, 0x20($s2)
/* A4BD0 800A3FD0 26100001 */  addiu      $s0, $s0, 1
/* A4BD4 800A3FD4 8C620004 */  lw         $v0, 4($v1)
/* A4BD8 800A3FD8 0202102A */  slt        $v0, $s0, $v0
/* A4BDC 800A3FDC 1440FFF5 */  bnez       $v0, .L800A3FB4
/* A4BE0 800A3FE0 26310018 */   addiu     $s1, $s1, 0x18
.L800A3FE4:
/* A4BE4 800A3FE4 8E440014 */  lw         $a0, 0x14($s2)
/* A4BE8 800A3FE8 26653120 */  addiu      $a1, $s3, 0x3120
/* A4BEC 800A3FEC 0C02600C */  jal        Free
/* A4BF0 800A3FF0 240608E0 */   addiu     $a2, $zero, 0x8e0
.L800A3FF4:
/* A4BF4 800A3FF4 8E440000 */  lw         $a0, ($s2)
/* A4BF8 800A3FF8 2402FFFF */  addiu      $v0, $zero, -1
/* A4BFC 800A3FFC 14820006 */  bne        $a0, $v0, .L800A4018
/* A4C00 800A4000 26653120 */   addiu     $a1, $s3, 0x3120
/* A4C04 800A4004 8E440020 */  lw         $a0, 0x20($s2)
/* A4C08 800A4008 0C02600C */  jal        Free
/* A4C0C 800A400C 240608E5 */   addiu     $a2, $zero, 0x8e5
/* A4C10 800A4010 08029009 */  j          .L800A4024
/* A4C14 800A4014 02402021 */   addu      $a0, $s2, $zero
.L800A4018:
/* A4C18 800A4018 0C028B7F */  jal        dec_borg_count
/* A4C1C 800A401C 00000000 */   nop
/* A4C20 800A4020 02402021 */  addu       $a0, $s2, $zero
.L800A4024:
/* A4C24 800A4024 26653120 */  addiu      $a1, $s3, 0x3120
/* A4C28 800A4028 0C02600C */  jal        Free
/* A4C2C 800A402C 240608EC */   addiu     $a2, $zero, 0x8ec
/* A4C30 800A4030 0C02608C */  jal        get_memUsed
/* A4C34 800A4034 00000000 */   nop
/* A4C38 800A4038 26A5348C */  addiu      $a1, $s5, 0x348c
/* A4C3C 800A403C 02821023 */  subu       $v0, $s4, $v0
/* A4C40 800A4040 26C634C8 */  addiu      $a2, $s6, 0x34c8
/* A4C44 800A4044 8CA30018 */  lw         $v1, 0x18($a1)
/* A4C48 800A4048 8CC40018 */  lw         $a0, 0x18($a2)
/* A4C4C 800A404C 8FBF002C */  lw         $ra, 0x2c($sp)
/* A4C50 800A4050 8FB60028 */  lw         $s6, 0x28($sp)
/* A4C54 800A4054 8FB50024 */  lw         $s5, 0x24($sp)
/* A4C58 800A4058 8FB40020 */  lw         $s4, 0x20($sp)
/* A4C5C 800A405C 8FB3001C */  lw         $s3, 0x1c($sp)
/* A4C60 800A4060 8FB20018 */  lw         $s2, 0x18($sp)
/* A4C64 800A4064 8FB10014 */  lw         $s1, 0x14($sp)
/* A4C68 800A4068 8FB00010 */  lw         $s0, 0x10($sp)
/* A4C6C 800A406C 00621823 */  subu       $v1, $v1, $v0
/* A4C70 800A4070 2484FFFF */  addiu      $a0, $a0, -1
/* A4C74 800A4074 ACA30018 */  sw         $v1, 0x18($a1)
/* A4C78 800A4078 ACC40018 */  sw         $a0, 0x18($a2)
/* A4C7C 800A407C 03E00008 */  jr         $ra
/* A4C80 800A4080 27BD0030 */   addiu     $sp, $sp, 0x30

glabel borg7_func_a
/* A4C84 800A4084 24840050 */  addiu      $a0, $a0, 0x50
/* A4C88 800A4088 8C820004 */  lw         $v0, 4($a0)
/* A4C8C 800A408C 18400008 */  blez       $v0, .L800A40B0
/* A4C90 800A4090 00801821 */   addu      $v1, $a0, $zero
/* A4C94 800A4094 00402821 */  addu       $a1, $v0, $zero
.L800A4098:
/* A4C98 800A4098 8C620014 */  lw         $v0, 0x14($v1)
/* A4C9C 800A409C 24A5FFFF */  addiu      $a1, $a1, -1
/* A4CA0 800A40A0 00441021 */  addu       $v0, $v0, $a0
/* A4CA4 800A40A4 AC620014 */  sw         $v0, 0x14($v1)
/* A4CA8 800A40A8 14A0FFFB */  bnez       $a1, .L800A4098
/* A4CAC 800A40AC 2463000C */   addiu     $v1, $v1, 0xc
.L800A40B0:
/* A4CB0 800A40B0 03E00008 */  jr         $ra
/* A4CB4 800A40B4 00000000 */   nop

glabel borg7_func_b
/* A4CB8 800A40B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A4CBC 800A40BC 3C05800E */  lui        $a1, %hi(D_800E3120)
/* A4CC0 800A40C0 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A4CC4 800A40C4 AFB00010 */  sw         $s0, 0x10($sp)
/* A4CC8 800A40C8 00808021 */  addu       $s0, $a0, $zero
/* A4CCC 800A40CC AFB20018 */  sw         $s2, 0x18($sp)
/* A4CD0 800A40D0 26120050 */  addiu      $s2, $s0, 0x50
/* A4CD4 800A40D4 AFBF001C */  sw         $ra, 0x1c($sp)
/* A4CD8 800A40D8 AFB10014 */  sw         $s1, 0x14($sp)
/* A4CDC 800A40DC 8E510004 */  lw         $s1, 4($s2)
/* A4CE0 800A40E0 2406092E */  addiu      $a2, $zero, 0x92e
/* A4CE4 800A40E4 0C025F9C */  jal        Malloc
/* A4CE8 800A40E8 001120C0 */   sll       $a0, $s1, 3
/* A4CEC 800A40EC 1A200009 */  blez       $s1, .L800A4114
/* A4CF0 800A40F0 AE020018 */   sw        $v0, 0x18($s0)
/* A4CF4 800A40F4 2603005C */  addiu      $v1, $s0, 0x5c
/* A4CF8 800A40F8 02202021 */  addu       $a0, $s1, $zero
.L800A40FC:
/* A4CFC 800A40FC AC430000 */  sw         $v1, ($v0)
/* A4D00 800A4100 2463000C */  addiu      $v1, $v1, 0xc
/* A4D04 800A4104 AC400004 */  sw         $zero, 4($v0)
/* A4D08 800A4108 2484FFFF */  addiu      $a0, $a0, -1
/* A4D0C 800A410C 1480FFFB */  bnez       $a0, .L800A40FC
/* A4D10 800A4110 24420008 */   addiu     $v0, $v0, 8
.L800A4114:
/* A4D14 800A4114 26040038 */  addiu      $a0, $s0, 0x38
/* A4D18 800A4118 00002821 */  addu       $a1, $zero, $zero
/* A4D1C 800A411C 0C026380 */  jal        Calloc
/* A4D20 800A4120 24060018 */   addiu     $a2, $zero, 0x18
/* A4D24 800A4124 0C02891C */  jal        clearBorgFlag
/* A4D28 800A4128 00000000 */   nop
/* A4D2C 800A412C 0C028A22 */  jal        getBorgItem
/* A4D30 800A4130 8E44000C */   lw        $a0, 0xc($s2)
/* A4D34 800A4134 8E46000C */  lw         $a2, 0xc($s2)
/* A4D38 800A4138 8E050018 */  lw         $a1, 0x18($s0)
/* A4D3C 800A413C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A4D40 800A4140 8FB10014 */  lw         $s1, 0x14($sp)
/* A4D44 800A4144 00401821 */  addu       $v1, $v0, $zero
/* A4D48 800A4148 AE030038 */  sw         $v1, 0x38($s0)
/* A4D4C 800A414C AE000008 */  sw         $zero, 8($s0)
/* A4D50 800A4150 A600000C */  sh         $zero, 0xc($s0)
/* A4D54 800A4154 A600000E */  sh         $zero, 0xe($s0)
/* A4D58 800A4158 A6000010 */  sh         $zero, 0x10($s0)
/* A4D5C 800A415C ACA30004 */  sw         $v1, 4($a1)
/* A4D60 800A4160 AE000020 */  sw         $zero, 0x20($s0)
/* A4D64 800A4164 AE000024 */  sw         $zero, 0x24($s0)
/* A4D68 800A4168 AE000028 */  sw         $zero, 0x28($s0)
/* A4D6C 800A416C AE00002C */  sw         $zero, 0x2c($s0)
/* A4D70 800A4170 AE000030 */  sw         $zero, 0x30($s0)
/* A4D74 800A4174 AE000034 */  sw         $zero, 0x34($s0)
/* A4D78 800A4178 8E440008 */  lw         $a0, 8($s2)
/* A4D7C 800A417C 8FB20018 */  lw         $s2, 0x18($sp)
/* A4D80 800A4180 24030001 */  addiu      $v1, $zero, 1
/* A4D84 800A4184 A6030012 */  sh         $v1, 0x12($s0)
/* A4D88 800A4188 AE060044 */  sw         $a2, 0x44($s0)
/* A4D8C 800A418C 000420C0 */  sll        $a0, $a0, 3
/* A4D90 800A4190 00A42821 */  addu       $a1, $a1, $a0
/* A4D94 800A4194 AE05001C */  sw         $a1, 0x1c($s0)
/* A4D98 800A4198 8FB00010 */  lw         $s0, 0x10($sp)
/* A4D9C 800A419C 24020001 */  addiu      $v0, $zero, 1
/* A4DA0 800A41A0 03E00008 */  jr         $ra
/* A4DA4 800A41A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borg7_free
/* A4DA8 800A41A8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A4DAC 800A41AC AFB20018 */  sw         $s2, 0x18($sp)
/* A4DB0 800A41B0 00809021 */  addu       $s2, $a0, $zero
/* A4DB4 800A41B4 AFB00010 */  sw         $s0, 0x10($sp)
/* A4DB8 800A41B8 26500038 */  addiu      $s0, $s2, 0x38
/* A4DBC 800A41BC AFB10014 */  sw         $s1, 0x14($sp)
/* A4DC0 800A41C0 24110002 */  addiu      $s1, $zero, 2
/* A4DC4 800A41C4 AFBF001C */  sw         $ra, 0x1c($sp)
.L800A41C8:
/* A4DC8 800A41C8 8E040000 */  lw         $a0, ($s0)
/* A4DCC 800A41CC 10800003 */  beqz       $a0, .L800A41DC
/* A4DD0 800A41D0 2631FFFF */   addiu     $s1, $s1, -1
/* A4DD4 800A41D4 0C028FD2 */  jal        borg_6_free
/* A4DD8 800A41D8 00000000 */   nop
.L800A41DC:
/* A4DDC 800A41DC 0621FFFA */  bgez       $s1, .L800A41C8
/* A4DE0 800A41E0 26100004 */   addiu     $s0, $s0, 4
/* A4DE4 800A41E4 0C02608C */  jal        get_memUsed
/* A4DE8 800A41E8 00000000 */   nop
/* A4DEC 800A41EC 00408821 */  addu       $s1, $v0, $zero
/* A4DF0 800A41F0 8E440000 */  lw         $a0, ($s2)
/* A4DF4 800A41F4 2402FFFF */  addiu      $v0, $zero, -1
/* A4DF8 800A41F8 1482000C */  bne        $a0, $v0, .L800A422C
/* A4DFC 800A41FC 3C10800E */   lui       $s0, %hi(D_800E3120)
/* A4E00 800A4200 8E440018 */  lw         $a0, 0x18($s2)
/* A4E04 800A4204 26103120 */  addiu      $s0, $s0, %lo(D_800E3120)
/* A4E08 800A4208 02002821 */  addu       $a1, $s0, $zero
/* A4E0C 800A420C 0C02600C */  jal        Free
/* A4E10 800A4210 24060976 */   addiu     $a2, $zero, 0x976
/* A4E14 800A4214 02402021 */  addu       $a0, $s2, $zero
/* A4E18 800A4218 02002821 */  addu       $a1, $s0, $zero
/* A4E1C 800A421C 0C02600C */  jal        Free
/* A4E20 800A4220 24060978 */   addiu     $a2, $zero, 0x978
/* A4E24 800A4224 08029096 */  j          .L800A4258
/* A4E28 800A4228 00000000 */   nop
.L800A422C:
/* A4E2C 800A422C 0C028B7A */  jal        get_borg_index_count
/* A4E30 800A4230 00000000 */   nop
/* A4E34 800A4234 24030001 */  addiu      $v1, $zero, 1
/* A4E38 800A4238 14430005 */  bne        $v0, $v1, .L800A4250
/* A4E3C 800A423C 3C05800E */   lui       $a1, %hi(D_800E3120)
/* A4E40 800A4240 8E440018 */  lw         $a0, 0x18($s2)
/* A4E44 800A4244 24A53120 */  addiu      $a1, $a1, %lo(D_800E3120)
/* A4E48 800A4248 0C02600C */  jal        Free
/* A4E4C 800A424C 2406097E */   addiu     $a2, $zero, 0x97e
.L800A4250:
/* A4E50 800A4250 0C028B7F */  jal        dec_borg_count
/* A4E54 800A4254 8E440000 */   lw        $a0, ($s2)
.L800A4258:
/* A4E58 800A4258 0C02608C */  jal        get_memUsed
/* A4E5C 800A425C 00000000 */   nop
/* A4E60 800A4260 3C06800F */  lui        $a2, %hi(borg_mem)
/* A4E64 800A4264 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A4E68 800A4268 02221023 */  subu       $v0, $s1, $v0
/* A4E6C 800A426C 3C05800F */  lui        $a1, %hi(borg_count)
/* A4E70 800A4270 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A4E74 800A4274 8CC3001C */  lw         $v1, 0x1c($a2)
/* A4E78 800A4278 8CA4001C */  lw         $a0, 0x1c($a1)
/* A4E7C 800A427C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A4E80 800A4280 8FB20018 */  lw         $s2, 0x18($sp)
/* A4E84 800A4284 8FB10014 */  lw         $s1, 0x14($sp)
/* A4E88 800A4288 8FB00010 */  lw         $s0, 0x10($sp)
/* A4E8C 800A428C 00621823 */  subu       $v1, $v1, $v0
/* A4E90 800A4290 2484FFFF */  addiu      $a0, $a0, -1
/* A4E94 800A4294 ACC3001C */  sw         $v1, 0x1c($a2)
/* A4E98 800A4298 ACA4001C */  sw         $a0, 0x1c($a1)
/* A4E9C 800A429C 03E00008 */  jr         $ra
/* A4EA0 800A42A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_AnimCache
/* A4EA4 800A42A4 3C02800F */  lui        $v0, %hi(animChache)
/* A4EA8 800A42A8 03E00008 */  jr         $ra
/* A4EAC 800A42AC A0443488 */   sb        $a0, %lo(animChache)($v0)
