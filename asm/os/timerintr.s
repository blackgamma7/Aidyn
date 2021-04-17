.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osTimerServicesInit
/* D2410 800D1810 3C02800F */  lui        $v0, %hi(__osTimerList)
/* D2414 800D1814 8C423CD0 */  lw         $v0, %lo(__osTimerList)($v0)
/* D2418 800D1818 00002021 */  addu       $a0, $zero, $zero
/* D241C 800D181C 00002821 */  addu       $a1, $zero, $zero
/* D2420 800D1820 3C018010 */  lui        $at, %hi(__osCurrentTime)
/* D2424 800D1824 AC24E7E0 */  sw         $a0, %lo(__osCurrentTime)($at)
/* D2428 800D1828 3C018010 */  lui        $at, %hi(__osCurrentTime+0x4)
/* D242C 800D182C AC25E7E4 */  sw         $a1, %lo(__osCurrentTime+0x4)($at)
/* D2430 800D1830 3C018010 */  lui        $at, %hi(__osBaseCounter)
/* D2434 800D1834 AC20E7D0 */  sw         $zero, %lo(__osBaseCounter)($at)
/* D2438 800D1838 3C018010 */  lui        $at, %hi(__osViIntrCount)
/* D243C 800D183C AC20E7D4 */  sw         $zero, %lo(__osViIntrCount)($at)
/* D2440 800D1840 AC440010 */  sw         $a0, 0x10($v0)
/* D2444 800D1844 AC450014 */  sw         $a1, 0x14($v0)
/* D2448 800D1848 AC440008 */  sw         $a0, 8($v0)
/* D244C 800D184C AC45000C */  sw         $a1, 0xc($v0)
/* D2450 800D1850 AC420004 */  sw         $v0, 4($v0)
/* D2454 800D1854 AC420000 */  sw         $v0, ($v0)
/* D2458 800D1858 AC400018 */  sw         $zero, 0x18($v0)
/* D245C 800D185C 03E00008 */  jr         $ra
/* D2460 800D1860 AC40001C */   sw        $zero, 0x1c($v0)

glabel __osTimerInterrupt
/* D2464 800D1864 3C03800F */  lui        $v1, %hi(__osTimerList)
/* D2468 800D1868 8C633CD0 */  lw         $v1, %lo(__osTimerList)($v1)
/* D246C 800D186C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2470 800D1870 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2474 800D1874 AFB00010 */  sw         $s0, 0x10($sp)
/* D2478 800D1878 8C620000 */  lw         $v0, ($v1)
/* D247C 800D187C 1043006E */  beq        $v0, $v1, .L800D1A38
/* D2480 800D1880 00000000 */   nop
.L800D1884:
/* D2484 800D1884 3C02800F */  lui        $v0, %hi(__osTimerList)
/* D2488 800D1888 8C423CD0 */  lw         $v0, %lo(__osTimerList)($v0)
/* D248C 800D188C 8C500000 */  lw         $s0, ($v0)
/* D2490 800D1890 16020006 */  bne        $s0, $v0, .L800D18AC
/* D2494 800D1894 00000000 */   nop
/* D2498 800D1898 0C0346EC */  jal        __osSetCompare
/* D249C 800D189C 00002021 */   addu      $a0, $zero, $zero
/* D24A0 800D18A0 3C018010 */  lui        $at, %hi(__osTimerCounter)
/* D24A4 800D18A4 0803468E */  j          .L800D1A38
/* D24A8 800D18A8 AC20E7E8 */   sw        $zero, %lo(__osTimerCounter)($at)
.L800D18AC:
/* D24AC 800D18AC 0C030C40 */  jal        osGetCount
/* D24B0 800D18B0 00000000 */   nop
/* D24B4 800D18B4 3C038010 */  lui        $v1, %hi(__osTimerCounter)
/* D24B8 800D18B8 8C63E7E8 */  lw         $v1, %lo(__osTimerCounter)($v1)
/* D24BC 800D18BC 3C018010 */  lui        $at, %hi(__osTimerCounter)
/* D24C0 800D18C0 AC22E7E8 */  sw         $v0, %lo(__osTimerCounter)($at)
/* D24C4 800D18C4 00431023 */  subu       $v0, $v0, $v1
/* D24C8 800D18C8 8E030010 */  lw         $v1, 0x10($s0)
/* D24CC 800D18CC 00403821 */  addu       $a3, $v0, $zero
/* D24D0 800D18D0 00003021 */  addu       $a2, $zero, $zero
/* D24D4 800D18D4 00C3102B */  sltu       $v0, $a2, $v1
/* D24D8 800D18D8 14400007 */  bnez       $v0, .L800D18F8
/* D24DC 800D18DC 00000000 */   nop
/* D24E0 800D18E0 14660010 */  bne        $v1, $a2, .L800D1924
/* D24E4 800D18E4 00000000 */   nop
/* D24E8 800D18E8 8E020014 */  lw         $v0, 0x14($s0)
/* D24EC 800D18EC 00E2102B */  sltu       $v0, $a3, $v0
/* D24F0 800D18F0 1040000C */  beqz       $v0, .L800D1924
/* D24F4 800D18F4 00000000 */   nop
.L800D18F8:
/* D24F8 800D18F8 8E040010 */  lw         $a0, 0x10($s0)
/* D24FC 800D18FC 8E050014 */  lw         $a1, 0x14($s0)
/* D2500 800D1900 00A7102B */  sltu       $v0, $a1, $a3
/* D2504 800D1904 00A72823 */  subu       $a1, $a1, $a3
/* D2508 800D1908 00862023 */  subu       $a0, $a0, $a2
/* D250C 800D190C 00822023 */  subu       $a0, $a0, $v0
/* D2510 800D1910 AE040010 */  sw         $a0, 0x10($s0)
/* D2514 800D1914 0C034692 */  jal        __osSetTimerIntr
/* D2518 800D1918 AE050014 */   sw        $a1, 0x14($s0)
/* D251C 800D191C 0803468E */  j          .L800D1A38
/* D2520 800D1920 00000000 */   nop
.L800D1924:
/* D2524 800D1924 8E030004 */  lw         $v1, 4($s0)
/* D2528 800D1928 8E020000 */  lw         $v0, ($s0)
/* D252C 800D192C AC620000 */  sw         $v0, ($v1)
/* D2530 800D1930 8E030000 */  lw         $v1, ($s0)
/* D2534 800D1934 8E020004 */  lw         $v0, 4($s0)
/* D2538 800D1938 AC620004 */  sw         $v0, 4($v1)
/* D253C 800D193C 8E040018 */  lw         $a0, 0x18($s0)
/* D2540 800D1940 AE000000 */  sw         $zero, ($s0)
/* D2544 800D1944 1080002E */  beqz       $a0, .L800D1A00
/* D2548 800D1948 AE000004 */   sw        $zero, 4($s0)
/* D254C 800D194C 3C028010 */  lui        $v0, %hi(__osProfTimerQ)
/* D2550 800D1950 2442E818 */  addiu      $v0, $v0, %lo(__osProfTimerQ)
/* D2554 800D1954 1082000D */  beq        $a0, $v0, .L800D198C
/* D2558 800D1958 00000000 */   nop
/* D255C 800D195C 8E05001C */  lw         $a1, 0x1c($s0)
/* D2560 800D1960 0C03313C */  jal        osSendMesg
/* D2564 800D1964 00003021 */   addu      $a2, $zero, $zero
/* D2568 800D1968 08034680 */  j          .L800D1A00
/* D256C 800D196C 00000000 */   nop
.L800D1970:
/* D2570 800D1970 8CA20000 */  lw         $v0, ($a1)
/* D2574 800D1974 00031840 */  sll        $v1, $v1, 1
/* D2578 800D1978 00621821 */  addu       $v1, $v1, $v0
/* D257C 800D197C 94620000 */  lhu        $v0, ($v1)
/* D2580 800D1980 24420001 */  addiu      $v0, $v0, 1
/* D2584 800D1984 08034680 */  j          .L800D1A00
/* D2588 800D1988 A4620000 */   sh        $v0, ($v1)
.L800D198C:
/* D258C 800D198C 3C058010 */  lui        $a1, %hi(__osProfileList)
/* D2590 800D1990 8CA5E7D8 */  lw         $a1, %lo(__osProfileList)($a1)
/* D2594 800D1994 3C02800F */  lui        $v0, %hi(__osRunQueue)
/* D2598 800D1998 8C423CB8 */  lw         $v0, %lo(__osRunQueue)($v0)
/* D259C 800D199C 3C038010 */  lui        $v1, %hi(__osProfileListEnd)
/* D25A0 800D19A0 8C63E810 */  lw         $v1, %lo(__osProfileListEnd)($v1)
/* D25A4 800D19A4 8C46011C */  lw         $a2, 0x11c($v0)
/* D25A8 800D19A8 00A3102B */  sltu       $v0, $a1, $v1
/* D25AC 800D19AC 1040000F */  beqz       $v0, .L800D19EC
/* D25B0 800D19B0 00000000 */   nop
/* D25B4 800D19B4 00603821 */  addu       $a3, $v1, $zero
/* D25B8 800D19B8 24A4000C */  addiu      $a0, $a1, 0xc
.L800D19BC:
/* D25BC 800D19BC 8C82FFFC */  lw         $v0, -4($a0)
/* D25C0 800D19C0 00C21823 */  subu       $v1, $a2, $v0
/* D25C4 800D19C4 04620006 */  bltzl      $v1, .L800D19E0
/* D25C8 800D19C8 24A50010 */   addiu     $a1, $a1, 0x10
/* D25CC 800D19CC 8C820000 */  lw         $v0, ($a0)
/* D25D0 800D19D0 00461023 */  subu       $v0, $v0, $a2
/* D25D4 800D19D4 5C40FFE6 */  bgtzl      $v0, .L800D1970
/* D25D8 800D19D8 00031883 */   sra       $v1, $v1, 2
/* D25DC 800D19DC 24A50010 */  addiu      $a1, $a1, 0x10
.L800D19E0:
/* D25E0 800D19E0 00A7102B */  sltu       $v0, $a1, $a3
/* D25E4 800D19E4 1440FFF5 */  bnez       $v0, .L800D19BC
/* D25E8 800D19E8 24840010 */   addiu     $a0, $a0, 0x10
.L800D19EC:
/* D25EC 800D19EC 3C028010 */  lui        $v0, %hi(__osProfileOverflowBin)
/* D25F0 800D19F0 8C42E7EC */  lw         $v0, %lo(__osProfileOverflowBin)($v0)
/* D25F4 800D19F4 24420001 */  addiu      $v0, $v0, 1
/* D25F8 800D19F8 3C018010 */  lui        $at, %hi(__osProfileOverflowBin)
/* D25FC 800D19FC AC22E7EC */  sw         $v0, %lo(__osProfileOverflowBin)($at)
.L800D1A00:
/* D2600 800D1A00 8E020008 */  lw         $v0, 8($s0)
/* D2604 800D1A04 14400004 */  bnez       $v0, .L800D1A18
/* D2608 800D1A08 00000000 */   nop
/* D260C 800D1A0C 8E02000C */  lw         $v0, 0xc($s0)
/* D2610 800D1A10 1040FF9C */  beqz       $v0, .L800D1884
/* D2614 800D1A14 00000000 */   nop
.L800D1A18:
/* D2618 800D1A18 8E020008 */  lw         $v0, 8($s0)
/* D261C 800D1A1C 8E03000C */  lw         $v1, 0xc($s0)
/* D2620 800D1A20 02002021 */  addu       $a0, $s0, $zero
/* D2624 800D1A24 AC820010 */  sw         $v0, 0x10($a0)
/* D2628 800D1A28 0C0346AA */  jal        __osInsertTimer
/* D262C 800D1A2C AC830014 */   sw        $v1, 0x14($a0)
/* D2630 800D1A30 08034621 */  j          .L800D1884
/* D2634 800D1A34 00000000 */   nop
.L800D1A38:
/* D2638 800D1A38 8FBF0014 */  lw         $ra, 0x14($sp)
/* D263C 800D1A3C 8FB00010 */  lw         $s0, 0x10($sp)
/* D2640 800D1A40 03E00008 */  jr         $ra
/* D2644 800D1A44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __osSetTimerIntr
/* D2648 800D1A48 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D264C 800D1A4C AFB1001C */  sw         $s1, 0x1c($sp)
/* D2650 800D1A50 AFB00018 */  sw         $s0, 0x18($sp)
/* D2654 800D1A54 00808021 */  addu       $s0, $a0, $zero
/* D2658 800D1A58 00A08821 */  addu       $s1, $a1, $zero
/* D265C 800D1A5C AFBF0024 */  sw         $ra, 0x24($sp)
/* D2660 800D1A60 0C030D90 */  jal        __osDisableInt
/* D2664 800D1A64 AFB20020 */   sw        $s2, 0x20($sp)
/* D2668 800D1A68 0C030C40 */  jal        osGetCount
/* D266C 800D1A6C 00409021 */   addu      $s2, $v0, $zero
/* D2670 800D1A70 00402821 */  addu       $a1, $v0, $zero
/* D2674 800D1A74 00002021 */  addu       $a0, $zero, $zero
/* D2678 800D1A78 3C018010 */  lui        $at, %hi(__osTimerCounter)
/* D267C 800D1A7C AC22E7E8 */  sw         $v0, %lo(__osTimerCounter)($at)
/* D2680 800D1A80 0C0346EC */  jal        __osSetCompare
/* D2684 800D1A84 02252021 */   addu      $a0, $s1, $a1
/* D2688 800D1A88 0C030DAC */  jal        __osRestoreInt
/* D268C 800D1A8C 02402021 */   addu      $a0, $s2, $zero
/* D2690 800D1A90 8FBF0024 */  lw         $ra, 0x24($sp)
/* D2694 800D1A94 8FB20020 */  lw         $s2, 0x20($sp)
/* D2698 800D1A98 8FB1001C */  lw         $s1, 0x1c($sp)
/* D269C 800D1A9C 8FB00018 */  lw         $s0, 0x18($sp)
/* D26A0 800D1AA0 03E00008 */  jr         $ra
/* D26A4 800D1AA4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __osInsertTimer
/* D26A8 800D1AA8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D26AC 800D1AAC AFB20018 */  sw         $s2, 0x18($sp)
/* D26B0 800D1AB0 00809021 */  addu       $s2, $a0, $zero
/* D26B4 800D1AB4 AFBF001C */  sw         $ra, 0x1c($sp)
/* D26B8 800D1AB8 AFB10014 */  sw         $s1, 0x14($sp)
/* D26BC 800D1ABC 0C030D90 */  jal        __osDisableInt
/* D26C0 800D1AC0 AFB00010 */   sw        $s0, 0x10($sp)
/* D26C4 800D1AC4 3C03800F */  lui        $v1, %hi(__osTimerList)
/* D26C8 800D1AC8 8C633CD0 */  lw         $v1, %lo(__osTimerList)($v1)
/* D26CC 800D1ACC 8C660000 */  lw         $a2, ($v1)
/* D26D0 800D1AD0 8E500010 */  lw         $s0, 0x10($s2)
/* D26D4 800D1AD4 8E510014 */  lw         $s1, 0x14($s2)
/* D26D8 800D1AD8 10C30017 */  beq        $a2, $v1, .L800D1B38
/* D26DC 800D1ADC 00403821 */   addu      $a3, $v0, $zero
/* D26E0 800D1AE0 080346C4 */  j          .L800D1B10
/* D26E4 800D1AE4 00000000 */   nop
.L800D1AE8:
/* D26E8 800D1AE8 8CC20010 */  lw         $v0, 0x10($a2)
/* D26EC 800D1AEC 8CC30014 */  lw         $v1, 0x14($a2)
/* D26F0 800D1AF0 8CC60000 */  lw         $a2, ($a2)
/* D26F4 800D1AF4 3C04800F */  lui        $a0, %hi(__osTimerList)
/* D26F8 800D1AF8 8C843CD0 */  lw         $a0, %lo(__osTimerList)($a0)
/* D26FC 800D1AFC 0223282B */  sltu       $a1, $s1, $v1
/* D2700 800D1B00 02238823 */  subu       $s1, $s1, $v1
/* D2704 800D1B04 02028023 */  subu       $s0, $s0, $v0
/* D2708 800D1B08 10C4000B */  beq        $a2, $a0, .L800D1B38
/* D270C 800D1B0C 02058023 */   subu      $s0, $s0, $a1
.L800D1B10:
/* D2710 800D1B10 8CC30010 */  lw         $v1, 0x10($a2)
/* D2714 800D1B14 0070102B */  sltu       $v0, $v1, $s0
/* D2718 800D1B18 1440FFF3 */  bnez       $v0, .L800D1AE8
/* D271C 800D1B1C 00000000 */   nop
/* D2720 800D1B20 16030005 */  bne        $s0, $v1, .L800D1B38
/* D2724 800D1B24 00000000 */   nop
/* D2728 800D1B28 8CC20014 */  lw         $v0, 0x14($a2)
/* D272C 800D1B2C 0051102B */  sltu       $v0, $v0, $s1
/* D2730 800D1B30 1440FFED */  bnez       $v0, .L800D1AE8
/* D2734 800D1B34 00000000 */   nop
.L800D1B38:
/* D2738 800D1B38 3C02800F */  lui        $v0, %hi(__osTimerList)
/* D273C 800D1B3C 8C423CD0 */  lw         $v0, %lo(__osTimerList)($v0)
/* D2740 800D1B40 AE500010 */  sw         $s0, 0x10($s2)
/* D2744 800D1B44 AE510014 */  sw         $s1, 0x14($s2)
/* D2748 800D1B48 50C2000A */  beql       $a2, $v0, .L800D1B74
/* D274C 800D1B4C AE460000 */   sw        $a2, ($s2)
/* D2750 800D1B50 8CC20010 */  lw         $v0, 0x10($a2)
/* D2754 800D1B54 8CC30014 */  lw         $v1, 0x14($a2)
/* D2758 800D1B58 0071202B */  sltu       $a0, $v1, $s1
/* D275C 800D1B5C 00711823 */  subu       $v1, $v1, $s1
/* D2760 800D1B60 00501023 */  subu       $v0, $v0, $s0
/* D2764 800D1B64 00441023 */  subu       $v0, $v0, $a0
/* D2768 800D1B68 ACC20010 */  sw         $v0, 0x10($a2)
/* D276C 800D1B6C ACC30014 */  sw         $v1, 0x14($a2)
/* D2770 800D1B70 AE460000 */  sw         $a2, ($s2)
.L800D1B74:
/* D2774 800D1B74 8CC20004 */  lw         $v0, 4($a2)
/* D2778 800D1B78 AE420004 */  sw         $v0, 4($s2)
/* D277C 800D1B7C 8CC20004 */  lw         $v0, 4($a2)
/* D2780 800D1B80 00E02021 */  addu       $a0, $a3, $zero
/* D2784 800D1B84 AC520000 */  sw         $s2, ($v0)
/* D2788 800D1B88 0C030DAC */  jal        __osRestoreInt
/* D278C 800D1B8C ACD20004 */   sw        $s2, 4($a2)
/* D2790 800D1B90 02001021 */  addu       $v0, $s0, $zero
/* D2794 800D1B94 02201821 */  addu       $v1, $s1, $zero
/* D2798 800D1B98 8FBF001C */  lw         $ra, 0x1c($sp)
/* D279C 800D1B9C 8FB20018 */  lw         $s2, 0x18($sp)
/* D27A0 800D1BA0 8FB10014 */  lw         $s1, 0x14($sp)
/* D27A4 800D1BA4 8FB00010 */  lw         $s0, 0x10($sp)
/* D27A8 800D1BA8 03E00008 */  jr         $ra
/* D27AC 800D1BAC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __osSetCompare
/* D27B0 800D1BB0 40845800 */  mtc0       $a0, $11
/* D27B4 800D1BB4 03E00008 */  jr         $ra
/* D27B8 800D1BB8 00000000 */   nop
/* D27BC 800D1BBC 00000000 */  nop
