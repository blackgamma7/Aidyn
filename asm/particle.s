.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel calloc_particleStruct
/* B23B0 800B17B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B23B4 800B17B4 AFB00010 */  sw         $s0, 0x10($sp)
/* B23B8 800B17B8 00808021 */  addu       $s0, $a0, $zero
/* B23BC 800B17BC AFB10014 */  sw         $s1, 0x14($sp)
/* B23C0 800B17C0 00058C00 */  sll        $s1, $a1, 0x10
/* B23C4 800B17C4 00118C03 */  sra        $s1, $s1, 0x10
/* B23C8 800B17C8 00002821 */  addu       $a1, $zero, $zero
/* B23CC 800B17CC AFBF0018 */  sw         $ra, 0x18($sp)
/* B23D0 800B17D0 0C026380 */  jal        Calloc
/* B23D4 800B17D4 240601A0 */   addiu     $a2, $zero, 0x1a0
/* B23D8 800B17D8 3C01800E */  lui        $at, %hi(D_800E3960)
/* B23DC 800B17DC C4203960 */  lwc1       $f0, %lo(D_800E3960)($at)
/* B23E0 800B17E0 8FBF0018 */  lw         $ra, 0x18($sp)
/* B23E4 800B17E4 A6110000 */  sh         $s1, ($s0)
/* B23E8 800B17E8 A6110004 */  sh         $s1, 4($s0)
/* B23EC 800B17EC 8FB10014 */  lw         $s1, 0x14($sp)
/* B23F0 800B17F0 2402FFFF */  addiu      $v0, $zero, -1
/* B23F4 800B17F4 A6020006 */  sh         $v0, 6($s0)
/* B23F8 800B17F8 A6020008 */  sh         $v0, 8($s0)
/* B23FC 800B17FC E6000028 */  swc1       $f0, 0x28($s0)
/* B2400 800B1800 E6000024 */  swc1       $f0, 0x24($s0)
/* B2404 800B1804 8FB00010 */  lw         $s0, 0x10($sp)
/* B2408 800B1808 03E00008 */  jr         $ra
/* B240C 800B180C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel init_particleStructs
/* B2410 800B1810 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B2414 800B1814 AFB10014 */  sw         $s1, 0x14($sp)
/* B2418 800B1818 00808821 */  addu       $s1, $a0, $zero
/* B241C 800B181C AFBF0024 */  sw         $ra, 0x24($sp)
/* B2420 800B1820 AFB40020 */  sw         $s4, 0x20($sp)
/* B2424 800B1824 AFB3001C */  sw         $s3, 0x1c($sp)
/* B2428 800B1828 AFB20018 */  sw         $s2, 0x18($sp)
/* B242C 800B182C AFB00010 */  sw         $s0, 0x10($sp)
/* B2430 800B1830 9622033C */  lhu        $v0, 0x33c($s1)
/* B2434 800B1834 24420001 */  addiu      $v0, $v0, 1
/* B2438 800B1838 10400012 */  beqz       $v0, .L800B1884
/* B243C 800B183C 00002821 */   addu      $a1, $zero, $zero
/* B2440 800B1840 3C130001 */  lui        $s3, 1
/* B2444 800B1844 00009021 */  addu       $s2, $zero, $zero
/* B2448 800B1848 26300004 */  addiu      $s0, $s1, 4
/* B244C 800B184C 3C140001 */  lui        $s4, 1
.L800B1850:
/* B2450 800B1850 8E240000 */  lw         $a0, ($s1)
/* B2454 800B1854 A6050000 */  sh         $a1, ($s0)
/* B2458 800B1858 26100002 */  addiu      $s0, $s0, 2
/* B245C 800B185C 0C02C5EC */  jal        calloc_particleStruct
/* B2460 800B1860 00922021 */   addu      $a0, $a0, $s2
/* B2464 800B1864 02601821 */  addu       $v1, $s3, $zero
/* B2468 800B1868 02749821 */  addu       $s3, $s3, $s4
/* B246C 800B186C 9622033C */  lhu        $v0, 0x33c($s1)
/* B2470 800B1870 00032C03 */  sra        $a1, $v1, 0x10
/* B2474 800B1874 24420001 */  addiu      $v0, $v0, 1
/* B2478 800B1878 00A2102A */  slt        $v0, $a1, $v0
/* B247C 800B187C 1440FFF4 */  bnez       $v0, .L800B1850
/* B2480 800B1880 265201A0 */   addiu     $s2, $s2, 0x1a0
.L800B1884:
/* B2484 800B1884 8FBF0024 */  lw         $ra, 0x24($sp)
/* B2488 800B1888 8FB40020 */  lw         $s4, 0x20($sp)
/* B248C 800B188C 8FB3001C */  lw         $s3, 0x1c($sp)
/* B2490 800B1890 8FB20018 */  lw         $s2, 0x18($sp)
/* B2494 800B1894 A620033E */  sh         $zero, 0x33e($s1)
/* B2498 800B1898 8FB10014 */  lw         $s1, 0x14($sp)
/* B249C 800B189C 8FB00010 */  lw         $s0, 0x10($sp)
/* B24A0 800B18A0 03E00008 */  jr         $ra
/* B24A4 800B18A4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B18A8
/* B24A8 800B18A8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B24AC 800B18AC AFB20028 */  sw         $s2, 0x28($sp)
/* B24B0 800B18B0 00809021 */  addu       $s2, $a0, $zero
/* B24B4 800B18B4 AFB00020 */  sw         $s0, 0x20($sp)
/* B24B8 800B18B8 00058400 */  sll        $s0, $a1, 0x10
/* B24BC 800B18BC 00002821 */  addu       $a1, $zero, $zero
/* B24C0 800B18C0 24060210 */  addiu      $a2, $zero, 0x210
/* B24C4 800B18C4 00108403 */  sra        $s0, $s0, 0x10
/* B24C8 800B18C8 AFBF002C */  sw         $ra, 0x2c($sp)
/* B24CC 800B18CC 0C026380 */  jal        Calloc
/* B24D0 800B18D0 AFB10024 */   sw        $s1, 0x24($sp)
/* B24D4 800B18D4 44800000 */  mtc1       $zero, $f0
/* B24D8 800B18D8 3C053E80 */  lui        $a1, 0x3e80
/* B24DC 800B18DC 44060000 */  mfc1       $a2, $f0
/* B24E0 800B18E0 264401D0 */  addiu      $a0, $s2, 0x1d0
/* B24E4 800B18E4 A6500000 */  sh         $s0, ($s2)
/* B24E8 800B18E8 E7A00010 */  swc1       $f0, 0x10($sp)
/* B24EC 800B18EC E7A00014 */  swc1       $f0, 0x14($sp)
/* B24F0 800B18F0 E7A00018 */  swc1       $f0, 0x18($sp)
/* B24F4 800B18F4 E7A0001C */  swc1       $f0, 0x1c($sp)
/* B24F8 800B18F8 0C02BC98 */  jal        set_collision_dat
/* B24FC 800B18FC 00C03821 */   addu      $a3, $a2, $zero
/* B2500 800B1900 3C02800F */  lui        $v0, %hi(D_800F5690)
/* B2504 800B1904 24425690 */  addiu      $v0, $v0, %lo(D_800F5690)
/* B2508 800B1908 00402021 */  addu       $a0, $v0, $zero
/* B250C 800B190C 3C10800F */  lui        $s0, %hi(D_800F5660)
/* B2510 800B1910 3C11800F */  lui        $s1, %hi(D_800F5670)
/* B2514 800B1914 26315670 */  addiu      $s1, $s1, %lo(D_800F5670)
/* B2518 800B1918 AE115660 */  sw         $s1, %lo(D_800F5660)($s0)
/* B251C 800B191C 26105660 */  addiu      $s0, $s0, 0x5660
/* B2520 800B1920 0C02BC80 */  jal        func_800AF200
/* B2524 800B1924 AE020004 */   sw        $v0, 4($s0)
/* B2528 800B1928 0C02BC8D */  jal        set_vec7
/* B252C 800B192C 02202021 */   addu      $a0, $s1, $zero
/* B2530 800B1930 3C01800E */  lui        $at, %hi(D_800E3964)
/* B2534 800B1934 C4203964 */  lwc1       $f0, %lo(D_800E3964)($at)
/* B2538 800B1938 8FBF002C */  lw         $ra, 0x2c($sp)
/* B253C 800B193C AE500208 */  sw         $s0, 0x208($s2)
/* B2540 800B1940 8FB20028 */  lw         $s2, 0x28($sp)
/* B2544 800B1944 8FB00020 */  lw         $s0, 0x20($sp)
/* B2548 800B1948 E6200004 */  swc1       $f0, 4($s1)
/* B254C 800B194C 8FB10024 */  lw         $s1, 0x24($sp)
/* B2550 800B1950 03E00008 */  jr         $ra
/* B2554 800B1954 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800B1958
/* B2558 800B1958 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B255C 800B195C 00002821 */  addu       $a1, $zero, $zero
/* B2560 800B1960 AFB20018 */  sw         $s2, 0x18($sp)
/* B2564 800B1964 3C120001 */  lui        $s2, 1
/* B2568 800B1968 AFB10014 */  sw         $s1, 0x14($sp)
/* B256C 800B196C 00008821 */  addu       $s1, $zero, $zero
/* B2570 800B1970 AFB3001C */  sw         $s3, 0x1c($sp)
/* B2574 800B1974 00809821 */  addu       $s3, $a0, $zero
/* B2578 800B1978 AFB00010 */  sw         $s0, 0x10($sp)
/* B257C 800B197C 2670030C */  addiu      $s0, $s3, 0x30c
/* B2580 800B1980 AFB40020 */  sw         $s4, 0x20($sp)
/* B2584 800B1984 3C140001 */  lui        $s4, 1
/* B2588 800B1988 AFBF0024 */  sw         $ra, 0x24($sp)
.L800B198C:
/* B258C 800B198C 8E640308 */  lw         $a0, 0x308($s3)
/* B2590 800B1990 A6050000 */  sh         $a1, ($s0)
/* B2594 800B1994 26100002 */  addiu      $s0, $s0, 2
/* B2598 800B1998 0C02C62A */  jal        func_800B18A8
/* B259C 800B199C 00912021 */   addu      $a0, $a0, $s1
/* B25A0 800B19A0 02401821 */  addu       $v1, $s2, $zero
/* B25A4 800B19A4 02549021 */  addu       $s2, $s2, $s4
/* B25A8 800B19A8 00032C03 */  sra        $a1, $v1, 0x10
/* B25AC 800B19AC 28A20010 */  slti       $v0, $a1, 0x10
/* B25B0 800B19B0 1440FFF6 */  bnez       $v0, .L800B198C
/* B25B4 800B19B4 26310210 */   addiu     $s1, $s1, 0x210
/* B25B8 800B19B8 8FBF0024 */  lw         $ra, 0x24($sp)
/* B25BC 800B19BC 8FB40020 */  lw         $s4, 0x20($sp)
/* B25C0 800B19C0 A6600340 */  sh         $zero, 0x340($s3)
/* B25C4 800B19C4 8FB3001C */  lw         $s3, 0x1c($sp)
/* B25C8 800B19C8 8FB20018 */  lw         $s2, 0x18($sp)
/* B25CC 800B19CC 8FB10014 */  lw         $s1, 0x14($sp)
/* B25D0 800B19D0 8FB00010 */  lw         $s0, 0x10($sp)
/* B25D4 800B19D4 03E00008 */  jr         $ra
/* B25D8 800B19D8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel particle_malloc
/* B25DC 800B19DC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B25E0 800B19E0 AFB40020 */  sw         $s4, 0x20($sp)
/* B25E4 800B19E4 0080A021 */  addu       $s4, $a0, $zero
/* B25E8 800B19E8 00052C00 */  sll        $a1, $a1, 0x10
/* B25EC 800B19EC AFB20018 */  sw         $s2, 0x18($sp)
/* B25F0 800B19F0 00059403 */  sra        $s2, $a1, 0x10
/* B25F4 800B19F4 00122080 */  sll        $a0, $s2, 2
/* B25F8 800B19F8 AFB00010 */  sw         $s0, 0x10($sp)
/* B25FC 800B19FC 00C08021 */  addu       $s0, $a2, $zero
/* B2600 800B1A00 3C05800E */  lui        $a1, %hi(D_800E3968)
/* B2604 800B1A04 24A53968 */  addiu      $a1, $a1, %lo(D_800E3968)
/* B2608 800B1A08 240600A7 */  addiu      $a2, $zero, 0xa7
/* B260C 800B1A0C AFBF002C */  sw         $ra, 0x2c($sp)
/* B2610 800B1A10 AFB60028 */  sw         $s6, 0x28($sp)
/* B2614 800B1A14 AFB50024 */  sw         $s5, 0x24($sp)
/* B2618 800B1A18 AFB3001C */  sw         $s3, 0x1c($sp)
/* B261C 800B1A1C 0C025F9C */  jal        Malloc
/* B2620 800B1A20 AFB10014 */   sw        $s1, 0x14($sp)
/* B2624 800B1A24 00001821 */  addu       $v1, $zero, $zero
/* B2628 800B1A28 AE82032C */  sw         $v0, 0x32c($s4)
/* B262C 800B1A2C 1A400017 */  blez       $s2, .L800B1A8C
/* B2630 800B1A30 A6920330 */   sh        $s2, 0x330($s4)
/* B2634 800B1A34 2416FFFF */  addiu      $s6, $zero, -1
/* B2638 800B1A38 3C130001 */  lui        $s3, 1
/* B263C 800B1A3C 02008821 */  addu       $s1, $s0, $zero
/* B2640 800B1A40 3C150001 */  lui        $s5, 1
.L800B1A44:
/* B2644 800B1A44 8E240000 */  lw         $a0, ($s1)
/* B2648 800B1A48 10960007 */  beq        $a0, $s6, .L800B1A68
/* B264C 800B1A4C 00038080 */   sll       $s0, $v1, 2
/* B2650 800B1A50 0C028A22 */  jal        getBorgItem
/* B2654 800B1A54 00000000 */   nop
/* B2658 800B1A58 8E83032C */  lw         $v1, 0x32c($s4)
/* B265C 800B1A5C 02031821 */  addu       $v1, $s0, $v1
/* B2660 800B1A60 0802C69D */  j          .L800B1A74
/* B2664 800B1A64 AC620000 */   sw        $v0, ($v1)
.L800B1A68:
/* B2668 800B1A68 8E82032C */  lw         $v0, 0x32c($s4)
/* B266C 800B1A6C 02021021 */  addu       $v0, $s0, $v0
/* B2670 800B1A70 AC400000 */  sw         $zero, ($v0)
.L800B1A74:
/* B2674 800B1A74 02601821 */  addu       $v1, $s3, $zero
/* B2678 800B1A78 02759821 */  addu       $s3, $s3, $s5
/* B267C 800B1A7C 00031C03 */  sra        $v1, $v1, 0x10
/* B2680 800B1A80 0072102A */  slt        $v0, $v1, $s2
/* B2684 800B1A84 1440FFEF */  bnez       $v0, .L800B1A44
/* B2688 800B1A88 26310004 */   addiu     $s1, $s1, 4
.L800B1A8C:
/* B268C 800B1A8C 8FBF002C */  lw         $ra, 0x2c($sp)
/* B2690 800B1A90 8FB60028 */  lw         $s6, 0x28($sp)
/* B2694 800B1A94 8FB50024 */  lw         $s5, 0x24($sp)
/* B2698 800B1A98 8FB40020 */  lw         $s4, 0x20($sp)
/* B269C 800B1A9C 8FB3001C */  lw         $s3, 0x1c($sp)
/* B26A0 800B1AA0 8FB20018 */  lw         $s2, 0x18($sp)
/* B26A4 800B1AA4 8FB10014 */  lw         $s1, 0x14($sp)
/* B26A8 800B1AA8 8FB00010 */  lw         $s0, 0x10($sp)
/* B26AC 800B1AAC 03E00008 */  jr         $ra
/* B26B0 800B1AB0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800B1AB4
/* B26B4 800B1AB4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B26B8 800B1AB8 AFB00010 */  sw         $s0, 0x10($sp)
/* B26BC 800B1ABC 00808021 */  addu       $s0, $a0, $zero
/* B26C0 800B1AC0 AFBF001C */  sw         $ra, 0x1c($sp)
/* B26C4 800B1AC4 AFB20018 */  sw         $s2, 0x18($sp)
/* B26C8 800B1AC8 AFB10014 */  sw         $s1, 0x14($sp)
/* B26CC 800B1ACC 86020330 */  lh         $v0, 0x330($s0)
/* B26D0 800B1AD0 18400011 */  blez       $v0, .L800B1B18
/* B26D4 800B1AD4 00002821 */   addu      $a1, $zero, $zero
/* B26D8 800B1AD8 3C110001 */  lui        $s1, 1
/* B26DC 800B1ADC 3C120001 */  lui        $s2, 1
.L800B1AE0:
/* B26E0 800B1AE0 8E03032C */  lw         $v1, 0x32c($s0)
/* B26E4 800B1AE4 00051080 */  sll        $v0, $a1, 2
/* B26E8 800B1AE8 00431021 */  addu       $v0, $v0, $v1
/* B26EC 800B1AEC 8C440000 */  lw         $a0, ($v0)
/* B26F0 800B1AF0 10800004 */  beqz       $a0, .L800B1B04
/* B26F4 800B1AF4 02201821 */   addu      $v1, $s1, $zero
/* B26F8 800B1AF8 0C028C37 */  jal        borg1_free
/* B26FC 800B1AFC 00000000 */   nop
/* B2700 800B1B00 02201821 */  addu       $v1, $s1, $zero
.L800B1B04:
/* B2704 800B1B04 86020330 */  lh         $v0, 0x330($s0)
/* B2708 800B1B08 00032C03 */  sra        $a1, $v1, 0x10
/* B270C 800B1B0C 00A2102A */  slt        $v0, $a1, $v0
/* B2710 800B1B10 1440FFF3 */  bnez       $v0, .L800B1AE0
/* B2714 800B1B14 02328821 */   addu      $s1, $s1, $s2
.L800B1B18:
/* B2718 800B1B18 3C05800E */  lui        $a1, %hi(D_800E3968)
/* B271C 800B1B1C 24A53968 */  addiu      $a1, $a1, %lo(D_800E3968)
/* B2720 800B1B20 8E04032C */  lw         $a0, 0x32c($s0)
/* B2724 800B1B24 240600C7 */  addiu      $a2, $zero, 0xc7
/* B2728 800B1B28 0C02600C */  jal        Free
/* B272C 800B1B2C A6000330 */   sh        $zero, 0x330($s0)
/* B2730 800B1B30 8FBF001C */  lw         $ra, 0x1c($sp)
/* B2734 800B1B34 8FB20018 */  lw         $s2, 0x18($sp)
/* B2738 800B1B38 8FB10014 */  lw         $s1, 0x14($sp)
/* B273C 800B1B3C AE00032C */  sw         $zero, 0x32c($s0)
/* B2740 800B1B40 8FB00010 */  lw         $s0, 0x10($sp)
/* B2744 800B1B44 03E00008 */  jr         $ra
/* B2748 800B1B48 27BD0020 */   addiu     $sp, $sp, 0x20

glabel InitParticleHead
/* B274C 800B1B4C 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* B2750 800B1B50 AFB10094 */  sw         $s1, 0x94($sp)
/* B2754 800B1B54 00808821 */  addu       $s1, $a0, $zero
/* B2758 800B1B58 24042100 */  addiu      $a0, $zero, 0x2100
/* B275C 800B1B5C AFB400A0 */  sw         $s4, 0xa0($sp)
/* B2760 800B1B60 00A0A021 */  addu       $s4, $a1, $zero
/* B2764 800B1B64 3C02800E */  lui        $v0, %hi(D_800E3968)
/* B2768 800B1B68 AFB20098 */  sw         $s2, 0x98($sp)
/* B276C 800B1B6C 24523968 */  addiu      $s2, $v0, %lo(D_800E3968)
/* B2770 800B1B70 02402821 */  addu       $a1, $s2, $zero
/* B2774 800B1B74 00061400 */  sll        $v0, $a2, 0x10
/* B2778 800B1B78 240600DA */  addiu      $a2, $zero, 0xda
/* B277C 800B1B7C AFB00090 */  sw         $s0, 0x90($sp)
/* B2780 800B1B80 00028403 */  sra        $s0, $v0, 0x10
/* B2784 800B1B84 00073C00 */  sll        $a3, $a3, 0x10
/* B2788 800B1B88 AFB3009C */  sw         $s3, 0x9c($sp)
/* B278C 800B1B8C AFBF00A4 */  sw         $ra, 0xa4($sp)
/* B2790 800B1B90 0C025F9C */  jal        Malloc
/* B2794 800B1B94 00079C03 */   sra       $s3, $a3, 0x10
/* B2798 800B1B98 AE220308 */  sw         $v0, 0x308($s1)
/* B279C 800B1B9C 2A020181 */  slti       $v0, $s0, 0x181
/* B27A0 800B1BA0 1040000D */  beqz       $v0, .L800B1BD8
/* B27A4 800B1BA4 3202FFFF */   andi      $v0, $s0, 0xffff
/* B27A8 800B1BA8 02402821 */  addu       $a1, $s2, $zero
/* B27AC 800B1BAC A630033C */  sh         $s0, 0x33c($s1)
/* B27B0 800B1BB0 240600DF */  addiu      $a2, $zero, 0xdf
/* B27B4 800B1BB4 24420001 */  addiu      $v0, $v0, 1
/* B27B8 800B1BB8 00022040 */  sll        $a0, $v0, 1
/* B27BC 800B1BBC 00822021 */  addu       $a0, $a0, $v0
/* B27C0 800B1BC0 00042080 */  sll        $a0, $a0, 2
/* B27C4 800B1BC4 00822021 */  addu       $a0, $a0, $v0
/* B27C8 800B1BC8 0C025F9C */  jal        Malloc
/* B27CC 800B1BCC 00042140 */   sll       $a0, $a0, 5
/* B27D0 800B1BD0 0802C700 */  j          .L800B1C00
/* B27D4 800B1BD4 AE220000 */   sw        $v0, ($s1)
.L800B1BD8:
/* B27D8 800B1BD8 27A40010 */  addiu      $a0, $sp, 0x10
/* B27DC 800B1BDC 3C05800E */  lui        $a1, %hi(D_800E3980)
/* B27E0 800B1BE0 24A53980 */  addiu      $a1, $a1, %lo(D_800E3980)
/* B27E4 800B1BE4 02003021 */  addu       $a2, $s0, $zero
/* B27E8 800B1BE8 0C0333AC */  jal        sprintf
/* B27EC 800B1BEC 24070180 */   addiu     $a3, $zero, 0x180
/* B27F0 800B1BF0 3C04800E */  lui        $a0, %hi(D_800E39AC)
/* B27F4 800B1BF4 248439AC */  addiu      $a0, $a0, %lo(D_800E39AC)
/* B27F8 800B1BF8 0C025F2D */  jal        manualCrash
/* B27FC 800B1BFC 27A50010 */   addiu     $a1, $sp, 0x10
.L800B1C00:
/* B2800 800B1C00 3C01800E */  lui        $at, %hi(D_800E39C0)
/* B2804 800B1C04 C42039C0 */  lwc1       $f0, %lo(D_800E39C0)($at)
/* B2808 800B1C08 02202021 */  addu       $a0, $s1, $zero
/* B280C 800B1C0C 0C02C656 */  jal        func_800B1958
/* B2810 800B1C10 E6200334 */   swc1      $f0, 0x334($s1)
/* B2814 800B1C14 0C02C604 */  jal        init_particleStructs
/* B2818 800B1C18 02202021 */   addu      $a0, $s1, $zero
/* B281C 800B1C1C 02202021 */  addu       $a0, $s1, $zero
/* B2820 800B1C20 8FA600B8 */  lw         $a2, 0xb8($sp)
/* B2824 800B1C24 0C02C677 */  jal        particle_malloc
/* B2828 800B1C28 02602821 */   addu      $a1, $s3, $zero
/* B282C 800B1C2C 0C030C1C */  jal        osGetTime
/* B2830 800B1C30 AE340338 */   sw        $s4, 0x338($s1)
/* B2834 800B1C34 00022180 */  sll        $a0, $v0, 6
/* B2838 800B1C38 00033682 */  srl        $a2, $v1, 0x1a
/* B283C 800B1C3C 00862025 */  or         $a0, $a0, $a2
/* B2840 800B1C40 24060000 */  addiu      $a2, $zero, 0
/* B2844 800B1C44 24070BB8 */  addiu      $a3, $zero, 0xbb8
/* B2848 800B1C48 0C02F6D8 */  jal        udivdi3
/* B284C 800B1C4C 00032980 */   sll       $a1, $v1, 6
/* B2850 800B1C50 3C04800F */  lui        $a0, %hi(particle_rng_seed)
/* B2854 800B1C54 24843630 */  addiu      $a0, $a0, %lo(particle_rng_seed)
/* B2858 800B1C58 0C027328 */  jal        setRNGSeed
/* B285C 800B1C5C 00602821 */   addu      $a1, $v1, $zero
/* B2860 800B1C60 8FBF00A4 */  lw         $ra, 0xa4($sp)
/* B2864 800B1C64 8FB400A0 */  lw         $s4, 0xa0($sp)
/* B2868 800B1C68 8FB3009C */  lw         $s3, 0x9c($sp)
/* B286C 800B1C6C 8FB20098 */  lw         $s2, 0x98($sp)
/* B2870 800B1C70 8FB10094 */  lw         $s1, 0x94($sp)
/* B2874 800B1C74 8FB00090 */  lw         $s0, 0x90($sp)
/* B2878 800B1C78 03E00008 */  jr         $ra
/* B287C 800B1C7C 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel FreeParticleEmmiter
/* B2880 800B1C80 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B2884 800B1C84 AFB00010 */  sw         $s0, 0x10($sp)
/* B2888 800B1C88 3C10800E */  lui        $s0, %hi(D_800E3968)
/* B288C 800B1C8C 26103968 */  addiu      $s0, $s0, %lo(D_800E3968)
/* B2890 800B1C90 02002821 */  addu       $a1, $s0, $zero
/* B2894 800B1C94 AFB10014 */  sw         $s1, 0x14($sp)
/* B2898 800B1C98 00808821 */  addu       $s1, $a0, $zero
/* B289C 800B1C9C AFBF0018 */  sw         $ra, 0x18($sp)
/* B28A0 800B1CA0 8E240000 */  lw         $a0, ($s1)
/* B28A4 800B1CA4 0C02600C */  jal        Free
/* B28A8 800B1CA8 24060106 */   addiu     $a2, $zero, 0x106
/* B28AC 800B1CAC 02002821 */  addu       $a1, $s0, $zero
/* B28B0 800B1CB0 8E240308 */  lw         $a0, 0x308($s1)
/* B28B4 800B1CB4 0C02600C */  jal        Free
/* B28B8 800B1CB8 24060107 */   addiu     $a2, $zero, 0x107
/* B28BC 800B1CBC 02202021 */  addu       $a0, $s1, $zero
/* B28C0 800B1CC0 AE200308 */  sw         $zero, 0x308($s1)
/* B28C4 800B1CC4 0C02C6AD */  jal        func_800B1AB4
/* B28C8 800B1CC8 AE200000 */   sw        $zero, ($s1)
/* B28CC 800B1CCC 8FBF0018 */  lw         $ra, 0x18($sp)
/* B28D0 800B1CD0 8FB10014 */  lw         $s1, 0x14($sp)
/* B28D4 800B1CD4 8FB00010 */  lw         $s0, 0x10($sp)
/* B28D8 800B1CD8 03E00008 */  jr         $ra
/* B28DC 800B1CDC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B1CE0
/* B28E0 800B1CE0 00073C00 */  sll        $a3, $a3, 0x10
/* B28E4 800B1CE4 00073C03 */  sra        $a3, $a3, 0x10
/* B28E8 800B1CE8 C7A80010 */  lwc1       $f8, 0x10($sp)
/* B28EC 800B1CEC 2402FFFF */  addiu      $v0, $zero, -1
/* B28F0 800B1CF0 10E200D0 */  beq        $a3, $v0, .L800B2034
/* B28F4 800B1CF4 30C6FFFF */   andi      $a2, $a2, 0xffff
/* B28F8 800B1CF8 30C28000 */  andi       $v0, $a2, 0x8000
/* B28FC 800B1CFC 304DFFFF */  andi       $t5, $v0, 0xffff
/* B2900 800B1D00 30CC0040 */  andi       $t4, $a2, 0x40
/* B2904 800B1D04 30C20800 */  andi       $v0, $a2, 0x800
/* B2908 800B1D08 304BFFFF */  andi       $t3, $v0, 0xffff
/* B290C 800B1D0C 30CA0080 */  andi       $t2, $a2, 0x80
/* B2910 800B1D10 30C20100 */  andi       $v0, $a2, 0x100
/* B2914 800B1D14 3049FFFF */  andi       $t1, $v0, 0xffff
/* B2918 800B1D18 30C30200 */  andi       $v1, $a2, 0x200
/* B291C 800B1D1C 3068FFFF */  andi       $t0, $v1, 0xffff
/* B2920 800B1D20 30C20400 */  andi       $v0, $a2, 0x400
/* B2924 800B1D24 3046FFFF */  andi       $a2, $v0, 0xffff
/* B2928 800B1D28 00071040 */  sll        $v0, $a3, 1
.L800B1D2C:
/* B292C 800B1D2C 00471021 */  addu       $v0, $v0, $a3
/* B2930 800B1D30 00021080 */  sll        $v0, $v0, 2
/* B2934 800B1D34 00471021 */  addu       $v0, $v0, $a3
/* B2938 800B1D38 8C830000 */  lw         $v1, ($a0)
/* B293C 800B1D3C 00021140 */  sll        $v0, $v0, 5
/* B2940 800B1D40 00621821 */  addu       $v1, $v1, $v0
/* B2944 800B1D44 15A00002 */  bnez       $t5, .L800B1D50
/* B2948 800B1D48 84670006 */   lh        $a3, 6($v1)
/* B294C 800B1D4C 2407FFFF */  addiu      $a3, $zero, -1
.L800B1D50:
/* B2950 800B1D50 3C01800E */  lui        $at, %hi(D_800E39C4)
/* B2954 800B1D54 C42639C4 */  lwc1       $f6, %lo(D_800E39C4)($at)
/* B2958 800B1D58 55800001 */  bnel       $t4, $zero, .L800B1D60
/* B295C 800B1D5C C4A6000C */   lwc1      $f6, 0xc($a1)
.L800B1D60:
/* B2960 800B1D60 5160001E */  beql       $t3, $zero, .L800B1DDC
/* B2964 800B1D64 9462000A */   lhu       $v0, 0xa($v1)
/* B2968 800B1D68 C4A20000 */  lwc1       $f2, ($a1)
/* B296C 800B1D6C 46081082 */  mul.s      $f2, $f2, $f8
/* B2970 800B1D70 00000000 */  nop
/* B2974 800B1D74 46061082 */  mul.s      $f2, $f2, $f6
/* B2978 800B1D78 C460003C */  lwc1       $f0, 0x3c($v1)
/* B297C 800B1D7C 46020000 */  add.s      $f0, $f0, $f2
/* B2980 800B1D80 E460003C */  swc1       $f0, 0x3c($v1)
/* B2984 800B1D84 C4A20004 */  lwc1       $f2, 4($a1)
/* B2988 800B1D88 46081082 */  mul.s      $f2, $f2, $f8
/* B298C 800B1D8C 00000000 */  nop
/* B2990 800B1D90 46061082 */  mul.s      $f2, $f2, $f6
/* B2994 800B1D94 C4600040 */  lwc1       $f0, 0x40($v1)
/* B2998 800B1D98 46020000 */  add.s      $f0, $f0, $f2
/* B299C 800B1D9C E4600040 */  swc1       $f0, 0x40($v1)
/* B29A0 800B1DA0 C4A20008 */  lwc1       $f2, 8($a1)
/* B29A4 800B1DA4 46081082 */  mul.s      $f2, $f2, $f8
/* B29A8 800B1DA8 00000000 */  nop
/* B29AC 800B1DAC 46061082 */  mul.s      $f2, $f2, $f6
/* B29B0 800B1DB0 C4600044 */  lwc1       $f0, 0x44($v1)
/* B29B4 800B1DB4 46020000 */  add.s      $f0, $f0, $f2
/* B29B8 800B1DB8 E4600044 */  swc1       $f0, 0x44($v1)
/* B29BC 800B1DBC C4A2000C */  lwc1       $f2, 0xc($a1)
/* B29C0 800B1DC0 46081082 */  mul.s      $f2, $f2, $f8
/* B29C4 800B1DC4 00000000 */  nop
/* B29C8 800B1DC8 46061082 */  mul.s      $f2, $f2, $f6
/* B29CC 800B1DCC C4600048 */  lwc1       $f0, 0x48($v1)
/* B29D0 800B1DD0 46020000 */  add.s      $f0, $f0, $f2
/* B29D4 800B1DD4 E4600048 */  swc1       $f0, 0x48($v1)
/* B29D8 800B1DD8 9462000A */  lhu        $v0, 0xa($v1)
.L800B1DDC:
/* B29DC 800B1DDC 30424000 */  andi       $v0, $v0, 0x4000
/* B29E0 800B1DE0 54400092 */  bnel       $v0, $zero, .L800B202C
/* B29E4 800B1DE4 2402FFFF */   addiu     $v0, $zero, -1
/* B29E8 800B1DE8 11400016 */  beqz       $t2, .L800B1E44
/* B29EC 800B1DEC 00000000 */   nop
/* B29F0 800B1DF0 C4A20000 */  lwc1       $f2, ($a1)
/* B29F4 800B1DF4 46081082 */  mul.s      $f2, $f2, $f8
/* B29F8 800B1DF8 00000000 */  nop
/* B29FC 800B1DFC 46061082 */  mul.s      $f2, $f2, $f6
/* B2A00 800B1E00 C460000C */  lwc1       $f0, 0xc($v1)
/* B2A04 800B1E04 46020000 */  add.s      $f0, $f0, $f2
/* B2A08 800B1E08 E460000C */  swc1       $f0, 0xc($v1)
/* B2A0C 800B1E0C C4A20004 */  lwc1       $f2, 4($a1)
/* B2A10 800B1E10 46081082 */  mul.s      $f2, $f2, $f8
/* B2A14 800B1E14 00000000 */  nop
/* B2A18 800B1E18 46061082 */  mul.s      $f2, $f2, $f6
/* B2A1C 800B1E1C C4600010 */  lwc1       $f0, 0x10($v1)
/* B2A20 800B1E20 46020000 */  add.s      $f0, $f0, $f2
/* B2A24 800B1E24 E4600010 */  swc1       $f0, 0x10($v1)
/* B2A28 800B1E28 C4A20008 */  lwc1       $f2, 8($a1)
/* B2A2C 800B1E2C 46081082 */  mul.s      $f2, $f2, $f8
/* B2A30 800B1E30 00000000 */  nop
/* B2A34 800B1E34 46061082 */  mul.s      $f2, $f2, $f6
/* B2A38 800B1E38 C4600014 */  lwc1       $f0, 0x14($v1)
/* B2A3C 800B1E3C 46020000 */  add.s      $f0, $f0, $f2
/* B2A40 800B1E40 E4600014 */  swc1       $f0, 0x14($v1)
.L800B1E44:
/* B2A44 800B1E44 11200016 */  beqz       $t1, .L800B1EA0
/* B2A48 800B1E48 00000000 */   nop
/* B2A4C 800B1E4C C4A20000 */  lwc1       $f2, ($a1)
/* B2A50 800B1E50 46081082 */  mul.s      $f2, $f2, $f8
/* B2A54 800B1E54 00000000 */  nop
/* B2A58 800B1E58 46061082 */  mul.s      $f2, $f2, $f6
/* B2A5C 800B1E5C C4600018 */  lwc1       $f0, 0x18($v1)
/* B2A60 800B1E60 46020000 */  add.s      $f0, $f0, $f2
/* B2A64 800B1E64 E4600018 */  swc1       $f0, 0x18($v1)
/* B2A68 800B1E68 C4A20004 */  lwc1       $f2, 4($a1)
/* B2A6C 800B1E6C 46081082 */  mul.s      $f2, $f2, $f8
/* B2A70 800B1E70 00000000 */  nop
/* B2A74 800B1E74 46061082 */  mul.s      $f2, $f2, $f6
/* B2A78 800B1E78 C460001C */  lwc1       $f0, 0x1c($v1)
/* B2A7C 800B1E7C 46020000 */  add.s      $f0, $f0, $f2
/* B2A80 800B1E80 E460001C */  swc1       $f0, 0x1c($v1)
/* B2A84 800B1E84 C4A20008 */  lwc1       $f2, 8($a1)
/* B2A88 800B1E88 46081082 */  mul.s      $f2, $f2, $f8
/* B2A8C 800B1E8C 00000000 */  nop
/* B2A90 800B1E90 46061082 */  mul.s      $f2, $f2, $f6
/* B2A94 800B1E94 C4600020 */  lwc1       $f0, 0x20($v1)
/* B2A98 800B1E98 46020000 */  add.s      $f0, $f0, $f2
/* B2A9C 800B1E9C E4600020 */  swc1       $f0, 0x20($v1)
.L800B1EA0:
/* B2AA0 800B1EA0 11000047 */  beqz       $t0, .L800B1FC0
/* B2AA4 800B1EA4 00000000 */   nop
/* B2AA8 800B1EA8 C4A00000 */  lwc1       $f0, ($a1)
/* B2AAC 800B1EAC 46080002 */  mul.s      $f0, $f0, $f8
/* B2AB0 800B1EB0 00000000 */  nop
/* B2AB4 800B1EB4 46060002 */  mul.s      $f0, $f0, $f6
/* B2AB8 800B1EB8 C464002C */  lwc1       $f4, 0x2c($v1)
/* B2ABC 800B1EBC 46002100 */  add.s      $f4, $f4, $f0
/* B2AC0 800B1EC0 E464002C */  swc1       $f4, 0x2c($v1)
/* B2AC4 800B1EC4 C4A20004 */  lwc1       $f2, 4($a1)
/* B2AC8 800B1EC8 46081082 */  mul.s      $f2, $f2, $f8
/* B2ACC 800B1ECC 00000000 */  nop
/* B2AD0 800B1ED0 46061082 */  mul.s      $f2, $f2, $f6
/* B2AD4 800B1ED4 C4600030 */  lwc1       $f0, 0x30($v1)
/* B2AD8 800B1ED8 46020000 */  add.s      $f0, $f0, $f2
/* B2ADC 800B1EDC E4600030 */  swc1       $f0, 0x30($v1)
/* B2AE0 800B1EE0 C4A20008 */  lwc1       $f2, 8($a1)
/* B2AE4 800B1EE4 46081082 */  mul.s      $f2, $f2, $f8
/* B2AE8 800B1EE8 00000000 */  nop
/* B2AEC 800B1EEC 46061082 */  mul.s      $f2, $f2, $f6
/* B2AF0 800B1EF0 C4600034 */  lwc1       $f0, 0x34($v1)
/* B2AF4 800B1EF4 46020000 */  add.s      $f0, $f0, $f2
/* B2AF8 800B1EF8 E4600034 */  swc1       $f0, 0x34($v1)
/* B2AFC 800B1EFC C4A2000C */  lwc1       $f2, 0xc($a1)
/* B2B00 800B1F00 46081082 */  mul.s      $f2, $f2, $f8
/* B2B04 800B1F04 00000000 */  nop
/* B2B08 800B1F08 46061082 */  mul.s      $f2, $f2, $f6
/* B2B0C 800B1F0C C4600038 */  lwc1       $f0, 0x38($v1)
/* B2B10 800B1F10 46020000 */  add.s      $f0, $f0, $f2
/* B2B14 800B1F14 3C01800E */  lui        $at, %hi(D_800E39C8)
/* B2B18 800B1F18 C42239C8 */  lwc1       $f2, %lo(D_800E39C8)($at)
/* B2B1C 800B1F1C 4604103C */  c.lt.s     $f2, $f4
/* B2B20 800B1F20 00000000 */  nop
/* B2B24 800B1F24 45000002 */  bc1f       .L800B1F30
/* B2B28 800B1F28 E4600038 */   swc1      $f0, 0x38($v1)
/* B2B2C 800B1F2C E462002C */  swc1       $f2, 0x2c($v1)
.L800B1F30:
/* B2B30 800B1F30 C4600030 */  lwc1       $f0, 0x30($v1)
/* B2B34 800B1F34 4600103C */  c.lt.s     $f2, $f0
/* B2B38 800B1F38 00000000 */  nop
/* B2B3C 800B1F3C 45030001 */  bc1tl      .L800B1F44
/* B2B40 800B1F40 E4620030 */   swc1      $f2, 0x30($v1)
.L800B1F44:
/* B2B44 800B1F44 C4600034 */  lwc1       $f0, 0x34($v1)
/* B2B48 800B1F48 4600103C */  c.lt.s     $f2, $f0
/* B2B4C 800B1F4C 00000000 */  nop
/* B2B50 800B1F50 45030001 */  bc1tl      .L800B1F58
/* B2B54 800B1F54 E4620034 */   swc1      $f2, 0x34($v1)
.L800B1F58:
/* B2B58 800B1F58 C4600038 */  lwc1       $f0, 0x38($v1)
/* B2B5C 800B1F5C 4600103C */  c.lt.s     $f2, $f0
/* B2B60 800B1F60 00000000 */  nop
/* B2B64 800B1F64 45030001 */  bc1tl      .L800B1F6C
/* B2B68 800B1F68 E4620038 */   swc1      $f2, 0x38($v1)
.L800B1F6C:
/* B2B6C 800B1F6C C460002C */  lwc1       $f0, 0x2c($v1)
/* B2B70 800B1F70 44801000 */  mtc1       $zero, $f2
/* B2B74 800B1F74 4602003C */  c.lt.s     $f0, $f2
/* B2B78 800B1F78 00000000 */  nop
/* B2B7C 800B1F7C 45030001 */  bc1tl      .L800B1F84
/* B2B80 800B1F80 E462002C */   swc1      $f2, 0x2c($v1)
.L800B1F84:
/* B2B84 800B1F84 C4600030 */  lwc1       $f0, 0x30($v1)
/* B2B88 800B1F88 4602003C */  c.lt.s     $f0, $f2
/* B2B8C 800B1F8C 00000000 */  nop
/* B2B90 800B1F90 45030001 */  bc1tl      .L800B1F98
/* B2B94 800B1F94 E4620030 */   swc1      $f2, 0x30($v1)
.L800B1F98:
/* B2B98 800B1F98 C4600034 */  lwc1       $f0, 0x34($v1)
/* B2B9C 800B1F9C 4602003C */  c.lt.s     $f0, $f2
/* B2BA0 800B1FA0 00000000 */  nop
/* B2BA4 800B1FA4 45030001 */  bc1tl      .L800B1FAC
/* B2BA8 800B1FA8 E4620034 */   swc1      $f2, 0x34($v1)
.L800B1FAC:
/* B2BAC 800B1FAC C4600038 */  lwc1       $f0, 0x38($v1)
/* B2BB0 800B1FB0 4602003C */  c.lt.s     $f0, $f2
/* B2BB4 800B1FB4 00000000 */  nop
/* B2BB8 800B1FB8 45030001 */  bc1tl      .L800B1FC0
/* B2BBC 800B1FBC E4620038 */   swc1      $f2, 0x38($v1)
.L800B1FC0:
/* B2BC0 800B1FC0 10C0001A */  beqz       $a2, .L800B202C
/* B2BC4 800B1FC4 2402FFFF */   addiu     $v0, $zero, -1
/* B2BC8 800B1FC8 C4A00000 */  lwc1       $f0, ($a1)
/* B2BCC 800B1FCC 46080002 */  mul.s      $f0, $f0, $f8
/* B2BD0 800B1FD0 00000000 */  nop
/* B2BD4 800B1FD4 46060002 */  mul.s      $f0, $f0, $f6
/* B2BD8 800B1FD8 C4640024 */  lwc1       $f4, 0x24($v1)
/* B2BDC 800B1FDC 46002100 */  add.s      $f4, $f4, $f0
/* B2BE0 800B1FE0 E4640024 */  swc1       $f4, 0x24($v1)
/* B2BE4 800B1FE4 C4A00004 */  lwc1       $f0, 4($a1)
/* B2BE8 800B1FE8 46080002 */  mul.s      $f0, $f0, $f8
/* B2BEC 800B1FEC 00000000 */  nop
/* B2BF0 800B1FF0 46060002 */  mul.s      $f0, $f0, $f6
/* B2BF4 800B1FF4 C4620028 */  lwc1       $f2, 0x28($v1)
/* B2BF8 800B1FF8 46001080 */  add.s      $f2, $f2, $f0
/* B2BFC 800B1FFC 44803000 */  mtc1       $zero, $f6
/* B2C00 800B2000 4606203C */  c.lt.s     $f4, $f6
/* B2C04 800B2004 00000000 */  nop
/* B2C08 800B2008 45000002 */  bc1f       .L800B2014
/* B2C0C 800B200C E4620028 */   swc1      $f2, 0x28($v1)
/* B2C10 800B2010 E4660024 */  swc1       $f6, 0x24($v1)
.L800B2014:
/* B2C14 800B2014 C4600028 */  lwc1       $f0, 0x28($v1)
/* B2C18 800B2018 4606003C */  c.lt.s     $f0, $f6
/* B2C1C 800B201C 00000000 */  nop
/* B2C20 800B2020 45030001 */  bc1tl      .L800B2028
/* B2C24 800B2024 E4660028 */   swc1      $f6, 0x28($v1)
.L800B2028:
/* B2C28 800B2028 2402FFFF */  addiu      $v0, $zero, -1
.L800B202C:
/* B2C2C 800B202C 14E2FF3F */  bne        $a3, $v0, .L800B1D2C
/* B2C30 800B2030 00071040 */   sll       $v0, $a3, 1
.L800B2034:
/* B2C34 800B2034 03E00008 */  jr         $ra
/* B2C38 800B2038 00000000 */   nop

glabel func_800B203C
/* B2C3C 800B203C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B2C40 800B2040 00063400 */  sll        $a2, $a2, 0x10
/* B2C44 800B2044 00063403 */  sra        $a2, $a2, 0x10
/* B2C48 800B2048 00061040 */  sll        $v0, $a2, 1
/* B2C4C 800B204C 00461021 */  addu       $v0, $v0, $a2
/* B2C50 800B2050 00021080 */  sll        $v0, $v0, 2
/* B2C54 800B2054 00461021 */  addu       $v0, $v0, $a2
/* B2C58 800B2058 8C830000 */  lw         $v1, ($a0)
/* B2C5C 800B205C 44879000 */  mtc1       $a3, $f18
/* B2C60 800B2060 00021140 */  sll        $v0, $v0, 5
/* B2C64 800B2064 AFBF0018 */  sw         $ra, 0x18($sp)
/* B2C68 800B2068 00621821 */  addu       $v1, $v1, $v0
/* B2C6C 800B206C C46E0018 */  lwc1       $f14, 0x18($v1)
/* B2C70 800B2070 46127082 */  mul.s      $f2, $f14, $f18
/* B2C74 800B2074 C46C001C */  lwc1       $f12, 0x1c($v1)
/* B2C78 800B2078 46126182 */  mul.s      $f6, $f12, $f18
/* B2C7C 800B207C C4700020 */  lwc1       $f16, 0x20($v1)
/* B2C80 800B2080 46128202 */  mul.s      $f8, $f16, $f18
/* B2C84 800B2084 C464000C */  lwc1       $f4, 0xc($v1)
/* B2C88 800B2088 46022100 */  add.s      $f4, $f4, $f2
/* B2C8C 800B208C C4600010 */  lwc1       $f0, 0x10($v1)
/* B2C90 800B2090 46060280 */  add.s      $f10, $f0, $f6
/* B2C94 800B2094 C4620014 */  lwc1       $f2, 0x14($v1)
/* B2C98 800B2098 00A03021 */  addu       $a2, $a1, $zero
/* B2C9C 800B209C 46081080 */  add.s      $f2, $f2, $f8
/* B2CA0 800B20A0 E464000C */  swc1       $f4, 0xc($v1)
/* B2CA4 800B20A4 E46A0010 */  swc1       $f10, 0x10($v1)
/* B2CA8 800B20A8 E4620014 */  swc1       $f2, 0x14($v1)
/* B2CAC 800B20AC 94C2000C */  lhu        $v0, 0xc($a2)
/* B2CB0 800B20B0 30424000 */  andi       $v0, $v0, 0x4000
/* B2CB4 800B20B4 50400019 */  beql       $v0, $zero, .L800B211C
/* B2CB8 800B20B8 9462000A */   lhu       $v0, 0xa($v1)
/* B2CBC 800B20BC C4C00010 */  lwc1       $f0, 0x10($a2)
/* B2CC0 800B20C0 4600503C */  c.lt.s     $f10, $f0
/* B2CC4 800B20C4 00000000 */  nop
/* B2CC8 800B20C8 45020014 */  bc1fl      .L800B211C
/* B2CCC 800B20CC 9462000A */   lhu       $v0, 0xa($v1)
/* B2CD0 800B20D0 3C01800E */  lui        $at, %hi(D_800E39D0)
/* B2CD4 800B20D4 D42639D0 */  ldc1       $f6, %lo(D_800E39D0)($at)
/* B2CD8 800B20D8 46007121 */  cvt.d.s    $f4, $f14
/* B2CDC 800B20DC 46262102 */  mul.d      $f4, $f4, $f6
/* B2CE0 800B20E0 3C01800E */  lui        $at, %hi(D_800E39D8)
/* B2CE4 800B20E4 D42039D8 */  ldc1       $f0, %lo(D_800E39D8)($at)
/* B2CE8 800B20E8 460060A1 */  cvt.d.s    $f2, $f12
/* B2CEC 800B20EC 46201082 */  mul.d      $f2, $f2, $f0
/* B2CF0 800B20F0 46008021 */  cvt.d.s    $f0, $f16
/* B2CF4 800B20F4 46260002 */  mul.d      $f0, $f0, $f6
/* B2CF8 800B20F8 460C5201 */  sub.s      $f8, $f10, $f12
/* B2CFC 800B20FC E4680010 */  swc1       $f8, 0x10($v1)
/* B2D00 800B2100 46202120 */  cvt.s.d    $f4, $f4
/* B2D04 800B2104 462010A0 */  cvt.s.d    $f2, $f2
/* B2D08 800B2108 46200020 */  cvt.s.d    $f0, $f0
/* B2D0C 800B210C E4640018 */  swc1       $f4, 0x18($v1)
/* B2D10 800B2110 E462001C */  swc1       $f2, 0x1c($v1)
/* B2D14 800B2114 E4600020 */  swc1       $f0, 0x20($v1)
/* B2D18 800B2118 9462000A */  lhu        $v0, 0xa($v1)
.L800B211C:
/* B2D1C 800B211C 30428000 */  andi       $v0, $v0, 0x8000
/* B2D20 800B2120 10400008 */  beqz       $v0, .L800B2144
/* B2D24 800B2124 2465003C */   addiu     $a1, $v1, 0x3c
/* B2D28 800B2128 8CC20014 */  lw         $v0, 0x14($a2)
/* B2D2C 800B212C 9466000A */  lhu        $a2, 0xa($v1)
/* B2D30 800B2130 84470000 */  lh         $a3, ($v0)
/* B2D34 800B2134 0C02C738 */  jal        func_800B1CE0
/* B2D38 800B2138 E7B20010 */   swc1      $f18, 0x10($sp)
/* B2D3C 800B213C 0802C859 */  j          .L800B2164
/* B2D40 800B2140 8FBF0018 */   lw        $ra, 0x18($sp)
.L800B2144:
/* B2D44 800B2144 84670004 */  lh         $a3, 4($v1)
/* B2D48 800B2148 2402FFFF */  addiu      $v0, $zero, -1
/* B2D4C 800B214C 10E20005 */  beq        $a3, $v0, .L800B2164
/* B2D50 800B2150 8FBF0018 */   lw        $ra, 0x18($sp)
/* B2D54 800B2154 9466000A */  lhu        $a2, 0xa($v1)
/* B2D58 800B2158 0C02C738 */  jal        func_800B1CE0
/* B2D5C 800B215C E7B20010 */   swc1      $f18, 0x10($sp)
/* B2D60 800B2160 8FBF0018 */  lw         $ra, 0x18($sp)
.L800B2164:
/* B2D64 800B2164 03E00008 */  jr         $ra
/* B2D68 800B2168 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ProcessAndRenderParticleHead
/* B2D6C 800B216C 27BDFF70 */  addiu      $sp, $sp, -0x90
/* B2D70 800B2170 AFB30074 */  sw         $s3, 0x74($sp)
/* B2D74 800B2174 00A09821 */  addu       $s3, $a1, $zero
/* B2D78 800B2178 AFB60080 */  sw         $s6, 0x80($sp)
/* B2D7C 800B217C 97B600A2 */  lhu        $s6, 0xa2($sp)
/* B2D80 800B2180 97A200A6 */  lhu        $v0, 0xa6($sp)
/* B2D84 800B2184 00073C00 */  sll        $a3, $a3, 0x10
/* B2D88 800B2188 AFB40078 */  sw         $s4, 0x78($sp)
/* B2D8C 800B218C 0007A403 */  sra        $s4, $a3, 0x10
/* B2D90 800B2190 AFBF008C */  sw         $ra, 0x8c($sp)
/* B2D94 800B2194 AFBE0088 */  sw         $fp, 0x88($sp)
/* B2D98 800B2198 AFB70084 */  sw         $s7, 0x84($sp)
/* B2D9C 800B219C AFB5007C */  sw         $s5, 0x7c($sp)
/* B2DA0 800B21A0 AFB20070 */  sw         $s2, 0x70($sp)
/* B2DA4 800B21A4 AFB1006C */  sw         $s1, 0x6c($sp)
/* B2DA8 800B21A8 AFB00068 */  sw         $s0, 0x68($sp)
/* B2DAC 800B21AC AFA60098 */  sw         $a2, 0x98($sp)
/* B2DB0 800B21B0 AFA00060 */  sw         $zero, 0x60($sp)
/* B2DB4 800B21B4 AFA40090 */  sw         $a0, 0x90($sp)
/* B2DB8 800B21B8 AFA2005C */  sw         $v0, 0x5c($sp)
/* B2DBC 800B21BC 8C820000 */  lw         $v0, ($a0)
/* B2DC0 800B21C0 00008021 */  addu       $s0, $zero, $zero
/* B2DC4 800B21C4 AFA20058 */  sw         $v0, 0x58($sp)
/* B2DC8 800B21C8 00101140 */  sll        $v0, $s0, 5
.L800B21CC:
/* B2DCC 800B21CC 00501021 */  addu       $v0, $v0, $s0
/* B2DD0 800B21D0 8E630308 */  lw         $v1, 0x308($s3)
/* B2DD4 800B21D4 00021100 */  sll        $v0, $v0, 4
/* B2DD8 800B21D8 00628821 */  addu       $s1, $v1, $v0
/* B2DDC 800B21DC 9623000C */  lhu        $v1, 0xc($s1)
/* B2DE0 800B21E0 30628000 */  andi       $v0, $v1, 0x8000
/* B2DE4 800B21E4 104000EA */  beqz       $v0, .L800B2590
/* B2DE8 800B21E8 26150001 */   addiu     $s5, $s0, 1
/* B2DEC 800B21EC 8FA2005C */  lw         $v0, 0x5c($sp)
/* B2DF0 800B21F0 10400005 */  beqz       $v0, .L800B2208
/* B2DF4 800B21F4 30621000 */   andi      $v0, $v1, 0x1000
/* B2DF8 800B21F8 144000E6 */  bnez       $v0, .L800B2594
/* B2DFC 800B21FC 00151400 */   sll       $v0, $s5, 0x10
/* B2E00 800B2200 0802C885 */  j          .L800B2214
/* B2E04 800B2204 86220004 */   lh        $v0, 4($s1)
.L800B2208:
/* B2E08 800B2208 104000E2 */  beqz       $v0, .L800B2594
/* B2E0C 800B220C 00151400 */   sll       $v0, $s5, 0x10
/* B2E10 800B2210 86220004 */  lh         $v0, 4($s1)
.L800B2214:
/* B2E14 800B2214 18400008 */  blez       $v0, .L800B2238
/* B2E18 800B2218 96230004 */   lhu       $v1, 4($s1)
/* B2E1C 800B221C 00741023 */  subu       $v0, $v1, $s4
/* B2E20 800B2220 A6220004 */  sh         $v0, 4($s1)
/* B2E24 800B2224 00021400 */  sll        $v0, $v0, 0x10
/* B2E28 800B2228 044100D9 */  bgez       $v0, .L800B2590
/* B2E2C 800B222C 26150001 */   addiu     $s5, $s0, 1
/* B2E30 800B2230 0802C964 */  j          .L800B2590
/* B2E34 800B2234 A6200004 */   sh        $zero, 4($s1)
.L800B2238:
/* B2E38 800B2238 8FA30060 */  lw         $v1, 0x60($sp)
/* B2E3C 800B223C 5460000F */  bnel       $v1, $zero, .L800B227C
/* B2E40 800B2240 86220002 */   lh        $v0, 2($s1)
/* B2E44 800B2244 24020001 */  addiu      $v0, $zero, 1
/* B2E48 800B2248 02602821 */  addu       $a1, $s3, $zero
/* B2E4C 800B224C 8FA60098 */  lw         $a2, 0x98($sp)
/* B2E50 800B2250 8FA40058 */  lw         $a0, 0x58($sp)
/* B2E54 800B2254 02C03821 */  addu       $a3, $s6, $zero
/* B2E58 800B2258 0C02CB4D */  jal        func_800B2D34
/* B2E5C 800B225C AFA20060 */   sw        $v0, 0x60($sp)
/* B2E60 800B2260 00402021 */  addu       $a0, $v0, $zero
/* B2E64 800B2264 8FA5005C */  lw         $a1, 0x5c($sp)
/* B2E68 800B2268 32C600FF */  andi       $a2, $s6, 0xff
/* B2E6C 800B226C 0C02CBE7 */  jal        func_800B2F9C
/* B2E70 800B2270 AFA20058 */   sw        $v0, 0x58($sp)
/* B2E74 800B2274 AFA20058 */  sw         $v0, 0x58($sp)
/* B2E78 800B2278 86220002 */  lh         $v0, 2($s1)
.L800B227C:
/* B2E7C 800B227C 044000BA */  bltz       $v0, .L800B2568
/* B2E80 800B2280 26150001 */   addiu     $s5, $s0, 1
/* B2E84 800B2284 8E2201B8 */  lw         $v0, 0x1b8($s1)
/* B2E88 800B2288 10400003 */  beqz       $v0, .L800B2298
/* B2E8C 800B228C 02602021 */   addu      $a0, $s3, $zero
/* B2E90 800B2290 0040F809 */  jalr       $v0
/* B2E94 800B2294 02202821 */   addu      $a1, $s1, $zero
.L800B2298:
/* B2E98 800B2298 9622000C */  lhu        $v0, 0xc($s1)
/* B2E9C 800B229C 30422000 */  andi       $v0, $v0, 0x2000
/* B2EA0 800B22A0 50400007 */  beql       $v0, $zero, .L800B22C0
/* B2EA4 800B22A4 8622000A */   lh        $v0, 0xa($s1)
/* B2EA8 800B22A8 8E640338 */  lw         $a0, 0x338($s3)
/* B2EAC 800B22AC 10800003 */  beqz       $a0, .L800B22BC
/* B2EB0 800B22B0 262501D0 */   addiu     $a1, $s1, 0x1d0
/* B2EB4 800B22B4 0C02B917 */  jal        ProcessCollisionSphere
/* B2EB8 800B22B8 02803021 */   addu      $a2, $s4, $zero
.L800B22BC:
/* B2EBC 800B22BC 8622000A */  lh         $v0, 0xa($s1)
.L800B22C0:
/* B2EC0 800B22C0 8E63032C */  lw         $v1, 0x32c($s3)
/* B2EC4 800B22C4 00021080 */  sll        $v0, $v0, 2
/* B2EC8 800B22C8 00431021 */  addu       $v0, $v0, $v1
/* B2ECC 800B22CC 8C450000 */  lw         $a1, ($v0)
/* B2ED0 800B22D0 10A0000E */  beqz       $a1, .L800B230C
/* B2ED4 800B22D4 8FA40058 */   lw        $a0, 0x58($sp)
/* B2ED8 800B22D8 0C0274F7 */  jal        func_8009D3DC
/* B2EDC 800B22DC 00003021 */   addu      $a2, $zero, $zero
/* B2EE0 800B22E0 00402021 */  addu       $a0, $v0, $zero
/* B2EE4 800B22E4 8623000A */  lh         $v1, 0xa($s1)
/* B2EE8 800B22E8 8E65032C */  lw         $a1, 0x32c($s3)
/* B2EEC 800B22EC 00031880 */  sll        $v1, $v1, 2
/* B2EF0 800B22F0 00651821 */  addu       $v1, $v1, $a1
/* B2EF4 800B22F4 8C650000 */  lw         $a1, ($v1)
/* B2EF8 800B22F8 00003021 */  addu       $a2, $zero, $zero
/* B2EFC 800B22FC 0C02770F */  jal        loadTextureImage
/* B2F00 800B2300 AFA20058 */   sw        $v0, 0x58($sp)
/* B2F04 800B2304 0802C8C8 */  j          .L800B2320
/* B2F08 800B2308 AFA20058 */   sw        $v0, 0x58($sp)
.L800B230C:
/* B2F0C 800B230C 3C04800E */  lui        $a0, %hi(D_800E3968)
/* B2F10 800B2310 24843968 */  addiu      $a0, $a0, %lo(D_800E3968)
/* B2F14 800B2314 3C05800E */  lui        $a1, %hi(D_800E39E0)
/* B2F18 800B2318 0C025F2D */  jal        manualCrash
/* B2F1C 800B231C 24A539E0 */   addiu     $a1, $a1, %lo(D_800E39E0)
.L800B2320:
/* B2F20 800B2320 26150001 */  addiu      $s5, $s0, 1
/* B2F24 800B2324 96220002 */  lhu        $v0, 2($s1)
/* B2F28 800B2328 8E2601BC */  lw         $a2, 0x1bc($s1)
/* B2F2C 800B232C 00541023 */  subu       $v0, $v0, $s4
/* B2F30 800B2330 10C00026 */  beqz       $a2, .L800B23CC
/* B2F34 800B2334 A6220002 */   sh        $v0, 2($s1)
/* B2F38 800B2338 00021400 */  sll        $v0, $v0, 0x10
/* B2F3C 800B233C 58400024 */  blezl      $v0, .L800B23D0
/* B2F40 800B2340 8E220014 */   lw        $v0, 0x14($s1)
/* B2F44 800B2344 86220006 */  lh         $v0, 6($s1)
/* B2F48 800B2348 1C40001E */  bgtz       $v0, .L800B23C4
/* B2F4C 800B234C 96230006 */   lhu       $v1, 6($s1)
/* B2F50 800B2350 96220008 */  lhu        $v0, 8($s1)
/* B2F54 800B2354 A6220006 */  sh         $v0, 6($s1)
/* B2F58 800B2358 00021400 */  sll        $v0, $v0, 0x10
/* B2F5C 800B235C 00021403 */  sra        $v0, $v0, 0x10
/* B2F60 800B2360 04410014 */  bgez       $v0, .L800B23B4
/* B2F64 800B2364 02602021 */   addu      $a0, $s3, $zero
/* B2F68 800B2368 04420001 */  bltzl      $v0, .L800B2370
/* B2F6C 800B236C 00021023 */   negu      $v0, $v0
.L800B2370:
/* B2F70 800B2370 18400016 */  blez       $v0, .L800B23CC
/* B2F74 800B2374 3C100001 */   lui       $s0, 1
/* B2F78 800B2378 3C120001 */  lui        $s2, 1
.L800B237C:
/* B2F7C 800B237C 02602021 */  addu       $a0, $s3, $zero
/* B2F80 800B2380 8E2201BC */  lw         $v0, 0x1bc($s1)
/* B2F84 800B2384 0040F809 */  jalr       $v0
/* B2F88 800B2388 02202821 */   addu      $a1, $s1, $zero
/* B2F8C 800B238C 02001821 */  addu       $v1, $s0, $zero
/* B2F90 800B2390 86220008 */  lh         $v0, 8($s1)
/* B2F94 800B2394 00031C03 */  sra        $v1, $v1, 0x10
/* B2F98 800B2398 04420001 */  bltzl      $v0, .L800B23A0
/* B2F9C 800B239C 00021023 */   negu      $v0, $v0
.L800B23A0:
/* B2FA0 800B23A0 0062102A */  slt        $v0, $v1, $v0
/* B2FA4 800B23A4 1440FFF5 */  bnez       $v0, .L800B237C
/* B2FA8 800B23A8 02128021 */   addu      $s0, $s0, $s2
/* B2FAC 800B23AC 0802C8F4 */  j          .L800B23D0
/* B2FB0 800B23B0 8E220014 */   lw        $v0, 0x14($s1)
.L800B23B4:
/* B2FB4 800B23B4 00C0F809 */  jalr       $a2
/* B2FB8 800B23B8 02202821 */   addu      $a1, $s1, $zero
/* B2FBC 800B23BC 0802C8F4 */  j          .L800B23D0
/* B2FC0 800B23C0 8E220014 */   lw        $v0, 0x14($s1)
.L800B23C4:
/* B2FC4 800B23C4 00741023 */  subu       $v0, $v1, $s4
/* B2FC8 800B23C8 A6220006 */  sh         $v0, 6($s1)
.L800B23CC:
/* B2FCC 800B23CC 8E220014 */  lw         $v0, 0x14($s1)
.L800B23D0:
/* B2FD0 800B23D0 1040005E */  beqz       $v0, .L800B254C
/* B2FD4 800B23D4 3C04800E */   lui       $a0, 0x800e
/* B2FD8 800B23D8 84520000 */  lh         $s2, ($v0)
/* B2FDC 800B23DC 2402FFFF */  addiu      $v0, $zero, -1
/* B2FE0 800B23E0 1242005E */  beq        $s2, $v0, .L800B255C
/* B2FE4 800B23E4 3C1E800E */   lui       $fp, 0x800e
/* B2FE8 800B23E8 3C17800E */  lui        $s7, 0x800e
.L800B23EC:
/* B2FEC 800B23EC 06400005 */  bltz       $s2, .L800B2404
/* B2FF0 800B23F0 27A40018 */   addiu     $a0, $sp, 0x18
/* B2FF4 800B23F4 9662033C */  lhu        $v0, 0x33c($s3)
/* B2FF8 800B23F8 0052102A */  slt        $v0, $v0, $s2
/* B2FFC 800B23FC 50400009 */  beql       $v0, $zero, .L800B2424
/* B3000 800B2400 00121040 */   sll       $v0, $s2, 1
.L800B2404:
/* B3004 800B2404 27C53A3C */  addiu      $a1, $fp, 0x3a3c
/* B3008 800B2408 86260000 */  lh         $a2, ($s1)
/* B300C 800B240C 0C0333AC */  jal        sprintf
/* B3010 800B2410 02403821 */   addu      $a3, $s2, $zero
/* B3014 800B2414 26E43A54 */  addiu      $a0, $s7, 0x3a54
/* B3018 800B2418 0C025F2D */  jal        manualCrash
/* B301C 800B241C 27A50018 */   addiu     $a1, $sp, 0x18
/* B3020 800B2420 00121040 */  sll        $v0, $s2, 1
.L800B2424:
/* B3024 800B2424 00521021 */  addu       $v0, $v0, $s2
/* B3028 800B2428 00021080 */  sll        $v0, $v0, 2
/* B302C 800B242C 00521021 */  addu       $v0, $v0, $s2
/* B3030 800B2430 8E630000 */  lw         $v1, ($s3)
/* B3034 800B2434 00021140 */  sll        $v0, $v0, 5
/* B3038 800B2438 00628021 */  addu       $s0, $v1, $v0
/* B303C 800B243C 86040002 */  lh         $a0, 2($s0)
/* B3040 800B2440 04800020 */  bltz       $a0, .L800B24C4
/* B3044 800B2444 96020002 */   lhu       $v0, 2($s0)
/* B3048 800B2448 02602021 */  addu       $a0, $s3, $zero
/* B304C 800B244C 02202821 */  addu       $a1, $s1, $zero
/* B3050 800B2450 02403021 */  addu       $a2, $s2, $zero
/* B3054 800B2454 44940000 */  mtc1       $s4, $f0
/* B3058 800B2458 46800020 */  cvt.s.w    $f0, $f0
/* B305C 800B245C 44070000 */  mfc1       $a3, $f0
/* B3060 800B2460 00541023 */  subu       $v0, $v0, $s4
/* B3064 800B2464 0C02C80F */  jal        func_800B203C
/* B3068 800B2468 A6020002 */   sh        $v0, 2($s0)
/* B306C 800B246C 9603000A */  lhu        $v1, 0xa($s0)
/* B3070 800B2470 30620010 */  andi       $v0, $v1, 0x10
/* B3074 800B2474 10400014 */  beqz       $v0, .L800B24C8
/* B3078 800B2478 86020002 */   lh        $v0, 2($s0)
/* B307C 800B247C 18400011 */  blez       $v0, .L800B24C4
/* B3080 800B2480 30620020 */   andi      $v0, $v1, 0x20
/* B3084 800B2484 10400005 */  beqz       $v0, .L800B249C
/* B3088 800B2488 02002021 */   addu      $a0, $s0, $zero
/* B308C 800B248C 0C02CB2E */  jal        particle_NAND_flags
/* B3090 800B2490 24050020 */   addiu     $a1, $zero, 0x20
/* B3094 800B2494 0802C932 */  j          .L800B24C8
/* B3098 800B2498 86020002 */   lh        $v0, 2($s0)
.L800B249C:
/* B309C 800B249C 27A40058 */  addiu      $a0, $sp, 0x58
/* B30A0 800B24A0 8622000A */  lh         $v0, 0xa($s1)
/* B30A4 800B24A4 02602821 */  addu       $a1, $s3, $zero
/* B30A8 800B24A8 AFB60010 */  sw         $s6, 0x10($sp)
/* B30AC 800B24AC 8E63032C */  lw         $v1, 0x32c($s3)
/* B30B0 800B24B0 00021080 */  sll        $v0, $v0, 2
/* B30B4 800B24B4 00431021 */  addu       $v0, $v0, $v1
/* B30B8 800B24B8 8C470000 */  lw         $a3, ($v0)
/* B30BC 800B24BC 0C02CC2F */  jal        particle_func
/* B30C0 800B24C0 02003021 */   addu      $a2, $s0, $zero
.L800B24C4:
/* B30C4 800B24C4 86020002 */  lh         $v0, 2($s0)
.L800B24C8:
/* B30C8 800B24C8 1C400010 */  bgtz       $v0, .L800B250C
/* B30CC 800B24CC 86120006 */   lh        $s2, 6($s0)
/* B30D0 800B24D0 9602000A */  lhu        $v0, 0xa($s0)
/* B30D4 800B24D4 30420002 */  andi       $v0, $v0, 2
/* B30D8 800B24D8 10400004 */  beqz       $v0, .L800B24EC
/* B30DC 800B24DC 02002021 */   addu      $a0, $s0, $zero
/* B30E0 800B24E0 0C02CB2E */  jal        particle_NAND_flags
/* B30E4 800B24E4 24050010 */   addiu     $a1, $zero, 0x10
/* B30E8 800B24E8 A6000002 */  sh         $zero, 2($s0)
.L800B24EC:
/* B30EC 800B24EC 9602000A */  lhu        $v0, 0xa($s0)
/* B30F0 800B24F0 30420001 */  andi       $v0, $v0, 1
/* B30F4 800B24F4 10400010 */  beqz       $v0, .L800B2538
/* B30F8 800B24F8 02602021 */   addu      $a0, $s3, $zero
/* B30FC 800B24FC 0C02CA0B */  jal        func_800B282C
/* B3100 800B2500 02002821 */   addu      $a1, $s0, $zero
/* B3104 800B2504 0802C94F */  j          .L800B253C
/* B3108 800B2508 2402FFFF */   addiu     $v0, $zero, -1
.L800B250C:
/* B310C 800B250C 8E220014 */  lw         $v0, 0x14($s1)
/* B3110 800B2510 86040000 */  lh         $a0, ($s0)
/* B3114 800B2514 84430000 */  lh         $v1, ($v0)
/* B3118 800B2518 10830008 */  beq        $a0, $v1, .L800B253C
/* B311C 800B251C 2402FFFF */   addiu     $v0, $zero, -1
/* B3120 800B2520 8E2201C0 */  lw         $v0, 0x1c0($s1)
/* B3124 800B2524 10400004 */  beqz       $v0, .L800B2538
/* B3128 800B2528 02602021 */   addu      $a0, $s3, $zero
/* B312C 800B252C 02202821 */  addu       $a1, $s1, $zero
/* B3130 800B2530 0040F809 */  jalr       $v0
/* B3134 800B2534 02003021 */   addu      $a2, $s0, $zero
.L800B2538:
/* B3138 800B2538 2402FFFF */  addiu      $v0, $zero, -1
.L800B253C:
/* B313C 800B253C 1642FFAB */  bne        $s2, $v0, .L800B23EC
/* B3140 800B2540 00000000 */   nop
/* B3144 800B2544 0802C958 */  j          .L800B2560
/* B3148 800B2548 86220002 */   lh        $v0, 2($s1)
.L800B254C:
/* B314C 800B254C 24843A54 */  addiu      $a0, $a0, 0x3a54
/* B3150 800B2550 3C05800E */  lui        $a1, %hi(D_800E3A74)
/* B3154 800B2554 0C025F2D */  jal        manualCrash
/* B3158 800B2558 24A53A74 */   addiu     $a1, $a1, %lo(D_800E3A74)
.L800B255C:
/* B315C 800B255C 86220002 */  lh         $v0, 2($s1)
.L800B2560:
/* B3160 800B2560 1C40000C */  bgtz       $v0, .L800B2594
/* B3164 800B2564 00151400 */   sll       $v0, $s5, 0x10
.L800B2568:
/* B3168 800B2568 9622000C */  lhu        $v0, 0xc($s1)
/* B316C 800B256C 30420002 */  andi       $v0, $v0, 2
/* B3170 800B2570 54400001 */  bnel       $v0, $zero, .L800B2578
/* B3174 800B2574 A6200002 */   sh        $zero, 2($s1)
.L800B2578:
/* B3178 800B2578 9622000C */  lhu        $v0, 0xc($s1)
/* B317C 800B257C 30420001 */  andi       $v0, $v0, 1
/* B3180 800B2580 10400003 */  beqz       $v0, .L800B2590
/* B3184 800B2584 02602021 */   addu      $a0, $s3, $zero
/* B3188 800B2588 0C02CA8E */  jal        FreeParticleEmitter
/* B318C 800B258C 02202821 */   addu      $a1, $s1, $zero
.L800B2590:
/* B3190 800B2590 00151400 */  sll        $v0, $s5, 0x10
.L800B2594:
/* B3194 800B2594 00028403 */  sra        $s0, $v0, 0x10
/* B3198 800B2598 2A030010 */  slti       $v1, $s0, 0x10
/* B319C 800B259C 1460FF0B */  bnez       $v1, .L800B21CC
/* B31A0 800B25A0 00101140 */   sll       $v0, $s0, 5
/* B31A4 800B25A4 8FA20058 */  lw         $v0, 0x58($sp)
/* B31A8 800B25A8 8FA30090 */  lw         $v1, 0x90($sp)
/* B31AC 800B25AC 8FBF008C */  lw         $ra, 0x8c($sp)
/* B31B0 800B25B0 8FBE0088 */  lw         $fp, 0x88($sp)
/* B31B4 800B25B4 8FB70084 */  lw         $s7, 0x84($sp)
/* B31B8 800B25B8 8FB60080 */  lw         $s6, 0x80($sp)
/* B31BC 800B25BC 8FB5007C */  lw         $s5, 0x7c($sp)
/* B31C0 800B25C0 8FB40078 */  lw         $s4, 0x78($sp)
/* B31C4 800B25C4 8FB30074 */  lw         $s3, 0x74($sp)
/* B31C8 800B25C8 8FB20070 */  lw         $s2, 0x70($sp)
/* B31CC 800B25CC 8FB1006C */  lw         $s1, 0x6c($sp)
/* B31D0 800B25D0 8FB00068 */  lw         $s0, 0x68($sp)
/* B31D4 800B25D4 AC620000 */  sw         $v0, ($v1)
/* B31D8 800B25D8 03E00008 */  jr         $ra
/* B31DC 800B25DC 27BD0090 */   addiu     $sp, $sp, 0x90

glabel func_800B25E0
/* B31E0 800B25E0 84C30000 */  lh         $v1, ($a2)
/* B31E4 800B25E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B31E8 800B25E8 AFBF0010 */  sw         $ra, 0x10($sp)
/* B31EC 800B25EC 9482033C */  lhu        $v0, 0x33c($a0)
/* B31F0 800B25F0 14620003 */  bne        $v1, $v0, .L800B2600
/* B31F4 800B25F4 94C70000 */   lhu       $a3, ($a2)
.L800B25F8:
/* B31F8 800B25F8 0802C998 */  j          .L800B2660
/* B31FC 800B25FC 24020001 */   addiu     $v0, $zero, 1
.L800B2600:
/* B3200 800B2600 8CA50014 */  lw         $a1, 0x14($a1)
/* B3204 800B2604 10A00013 */  beqz       $a1, .L800B2654
/* B3208 800B2608 00000000 */   nop
/* B320C 800B260C 94A20006 */  lhu        $v0, 6($a1)
/* B3210 800B2610 A4C20006 */  sh         $v0, 6($a2)
/* B3214 800B2614 94A30000 */  lhu        $v1, ($a1)
/* B3218 800B2618 A4C30008 */  sh         $v1, 8($a2)
/* B321C 800B261C A4A70006 */  sh         $a3, 6($a1)
/* B3220 800B2620 84C30006 */  lh         $v1, 6($a2)
/* B3224 800B2624 2402FFFF */  addiu      $v0, $zero, -1
/* B3228 800B2628 1062FFF3 */  beq        $v1, $v0, .L800B25F8
/* B322C 800B262C 00031040 */   sll       $v0, $v1, 1
/* B3230 800B2630 00431021 */  addu       $v0, $v0, $v1
/* B3234 800B2634 00021080 */  sll        $v0, $v0, 2
/* B3238 800B2638 00431021 */  addu       $v0, $v0, $v1
/* B323C 800B263C 00021140 */  sll        $v0, $v0, 5
/* B3240 800B2640 8C830000 */  lw         $v1, ($a0)
/* B3244 800B2644 94C40000 */  lhu        $a0, ($a2)
/* B3248 800B2648 00431021 */  addu       $v0, $v0, $v1
/* B324C 800B264C 0802C97E */  j          .L800B25F8
/* B3250 800B2650 A4440008 */   sh        $a0, 8($v0)
.L800B2654:
/* B3254 800B2654 0C02CA0B */  jal        func_800B282C
/* B3258 800B2658 00C02821 */   addu      $a1, $a2, $zero
/* B325C 800B265C 00001021 */  addu       $v0, $zero, $zero
.L800B2660:
/* B3260 800B2660 8FBF0010 */  lw         $ra, 0x10($sp)
/* B3264 800B2664 03E00008 */  jr         $ra
/* B3268 800B2668 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B266C
/* B326C 800B266C 84A30006 */  lh         $v1, 6($a1)
/* B3270 800B2670 2406FFFF */  addiu      $a2, $zero, -1
/* B3274 800B2674 1066000A */  beq        $v1, $a2, .L800B26A0
/* B3278 800B2678 00803821 */   addu      $a3, $a0, $zero
/* B327C 800B267C 00031040 */  sll        $v0, $v1, 1
/* B3280 800B2680 00431021 */  addu       $v0, $v0, $v1
/* B3284 800B2684 00021080 */  sll        $v0, $v0, 2
/* B3288 800B2688 00431021 */  addu       $v0, $v0, $v1
/* B328C 800B268C 00021140 */  sll        $v0, $v0, 5
/* B3290 800B2690 8CE30000 */  lw         $v1, ($a3)
/* B3294 800B2694 94A40008 */  lhu        $a0, 8($a1)
/* B3298 800B2698 00431021 */  addu       $v0, $v0, $v1
/* B329C 800B269C A4440008 */  sh         $a0, 8($v0)
.L800B26A0:
/* B32A0 800B26A0 84A30008 */  lh         $v1, 8($a1)
/* B32A4 800B26A4 10660009 */  beq        $v1, $a2, .L800B26CC
/* B32A8 800B26A8 00031040 */   sll       $v0, $v1, 1
/* B32AC 800B26AC 00431021 */  addu       $v0, $v0, $v1
/* B32B0 800B26B0 00021080 */  sll        $v0, $v0, 2
/* B32B4 800B26B4 00431021 */  addu       $v0, $v0, $v1
/* B32B8 800B26B8 00021140 */  sll        $v0, $v0, 5
/* B32BC 800B26BC 8CE30000 */  lw         $v1, ($a3)
/* B32C0 800B26C0 94A40006 */  lhu        $a0, 6($a1)
/* B32C4 800B26C4 00431021 */  addu       $v0, $v0, $v1
/* B32C8 800B26C8 A4440006 */  sh         $a0, 6($v0)
.L800B26CC:
/* B32CC 800B26CC A4A60006 */  sh         $a2, 6($a1)
/* B32D0 800B26D0 03E00008 */  jr         $ra
/* B32D4 800B26D4 A4A60008 */   sh        $a2, 8($a1)

glabel func_800B26D8
/* B32D8 800B26D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B32DC 800B26DC 00803021 */  addu       $a2, $a0, $zero
/* B32E0 800B26E0 00052C00 */  sll        $a1, $a1, 0x10
/* B32E4 800B26E4 AFB10014 */  sw         $s1, 0x14($sp)
/* B32E8 800B26E8 00058C03 */  sra        $s1, $a1, 0x10
/* B32EC 800B26EC AFBF0018 */  sw         $ra, 0x18($sp)
/* B32F0 800B26F0 AFB00010 */  sw         $s0, 0x10($sp)
/* B32F4 800B26F4 84C3033E */  lh         $v1, 0x33e($a2)
/* B32F8 800B26F8 94C2033C */  lhu        $v0, 0x33c($a2)
/* B32FC 800B26FC 14620007 */  bne        $v1, $v0, .L800B271C
/* B3300 800B2700 94C4033E */   lhu       $a0, 0x33e($a2)
/* B3304 800B2704 00031040 */  sll        $v0, $v1, 1
/* B3308 800B2708 00431021 */  addu       $v0, $v0, $v1
/* B330C 800B270C 00021080 */  sll        $v0, $v0, 2
/* B3310 800B2710 00431021 */  addu       $v0, $v0, $v1
/* B3314 800B2714 0802C9D1 */  j          .L800B2744
/* B3318 800B2718 8CC30000 */   lw        $v1, ($a2)
.L800B271C:
/* B331C 800B271C 24820001 */  addiu      $v0, $a0, 1
/* B3320 800B2720 00031840 */  sll        $v1, $v1, 1
/* B3324 800B2724 00C31821 */  addu       $v1, $a2, $v1
/* B3328 800B2728 A4C2033E */  sh         $v0, 0x33e($a2)
/* B332C 800B272C 84640004 */  lh         $a0, 4($v1)
/* B3330 800B2730 8CC30000 */  lw         $v1, ($a2)
/* B3334 800B2734 00041040 */  sll        $v0, $a0, 1
/* B3338 800B2738 00441021 */  addu       $v0, $v0, $a0
/* B333C 800B273C 00021080 */  sll        $v0, $v0, 2
/* B3340 800B2740 00441021 */  addu       $v0, $v0, $a0
.L800B2744:
/* B3344 800B2744 00021140 */  sll        $v0, $v0, 5
/* B3348 800B2748 00628021 */  addu       $s0, $v1, $v0
/* B334C 800B274C 86050000 */  lh         $a1, ($s0)
/* B3350 800B2750 0C02C5EC */  jal        calloc_particleStruct
/* B3354 800B2754 02002021 */   addu      $a0, $s0, $zero
/* B3358 800B2758 8FBF0018 */  lw         $ra, 0x18($sp)
/* B335C 800B275C 24020031 */  addiu      $v0, $zero, 0x31
/* B3360 800B2760 A602000A */  sh         $v0, 0xa($s0)
/* B3364 800B2764 02001021 */  addu       $v0, $s0, $zero
/* B3368 800B2768 A6110002 */  sh         $s1, 2($s0)
/* B336C 800B276C 8FB10014 */  lw         $s1, 0x14($sp)
/* B3370 800B2770 8FB00010 */  lw         $s0, 0x10($sp)
/* B3374 800B2774 03E00008 */  jr         $ra
/* B3378 800B2778 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B277C
/* B337C 800B277C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B3380 800B2780 AFB00010 */  sw         $s0, 0x10($sp)
/* B3384 800B2784 00808021 */  addu       $s0, $a0, $zero
/* B3388 800B2788 AFB10014 */  sw         $s1, 0x14($sp)
/* B338C 800B278C 00A08821 */  addu       $s1, $a1, $zero
/* B3390 800B2790 00062C00 */  sll        $a1, $a2, 0x10
/* B3394 800B2794 AFBF0018 */  sw         $ra, 0x18($sp)
/* B3398 800B2798 0C02C9B6 */  jal        func_800B26D8
/* B339C 800B279C 00052C03 */   sra       $a1, $a1, 0x10
/* B33A0 800B27A0 02002021 */  addu       $a0, $s0, $zero
/* B33A4 800B27A4 02202821 */  addu       $a1, $s1, $zero
/* B33A8 800B27A8 00408021 */  addu       $s0, $v0, $zero
/* B33AC 800B27AC 0C02C978 */  jal        func_800B25E0
/* B33B0 800B27B0 02003021 */   addu      $a2, $s0, $zero
/* B33B4 800B27B4 02001021 */  addu       $v0, $s0, $zero
/* B33B8 800B27B8 8FBF0018 */  lw         $ra, 0x18($sp)
/* B33BC 800B27BC 8FB10014 */  lw         $s1, 0x14($sp)
/* B33C0 800B27C0 8FB00010 */  lw         $s0, 0x10($sp)
/* B33C4 800B27C4 03E00008 */  jr         $ra
/* B33C8 800B27C8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B27CC
/* B33CC 800B27CC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B33D0 800B27D0 AFB10014 */  sw         $s1, 0x14($sp)
/* B33D4 800B27D4 00808821 */  addu       $s1, $a0, $zero
/* B33D8 800B27D8 AFB20018 */  sw         $s2, 0x18($sp)
/* B33DC 800B27DC 00A09021 */  addu       $s2, $a1, $zero
/* B33E0 800B27E0 00062C00 */  sll        $a1, $a2, 0x10
/* B33E4 800B27E4 00052C03 */  sra        $a1, $a1, 0x10
/* B33E8 800B27E8 AFBF001C */  sw         $ra, 0x1c($sp)
/* B33EC 800B27EC 0C02C9B6 */  jal        func_800B26D8
/* B33F0 800B27F0 AFB00010 */   sw        $s0, 0x10($sp)
/* B33F4 800B27F4 00408021 */  addu       $s0, $v0, $zero
/* B33F8 800B27F8 3402C00A */  ori        $v0, $zero, 0xc00a
/* B33FC 800B27FC 02202021 */  addu       $a0, $s1, $zero
/* B3400 800B2800 02402821 */  addu       $a1, $s2, $zero
/* B3404 800B2804 02003021 */  addu       $a2, $s0, $zero
/* B3408 800B2808 0C02C978 */  jal        func_800B25E0
/* B340C 800B280C A602000A */   sh        $v0, 0xa($s0)
/* B3410 800B2810 02001021 */  addu       $v0, $s0, $zero
/* B3414 800B2814 8FBF001C */  lw         $ra, 0x1c($sp)
/* B3418 800B2818 8FB20018 */  lw         $s2, 0x18($sp)
/* B341C 800B281C 8FB10014 */  lw         $s1, 0x14($sp)
/* B3420 800B2820 8FB00010 */  lw         $s0, 0x10($sp)
/* B3424 800B2824 03E00008 */  jr         $ra
/* B3428 800B2828 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B282C
/* B342C 800B282C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B3430 800B2830 AFB00010 */  sw         $s0, 0x10($sp)
/* B3434 800B2834 00808021 */  addu       $s0, $a0, $zero
/* B3438 800B2838 AFB10014 */  sw         $s1, 0x14($sp)
/* B343C 800B283C AFBF0018 */  sw         $ra, 0x18($sp)
/* B3440 800B2840 0C02C99B */  jal        func_800B266C
/* B3444 800B2844 00A08821 */   addu      $s1, $a1, $zero
/* B3448 800B2848 86230000 */  lh         $v1, ($s1)
/* B344C 800B284C 9602033C */  lhu        $v0, 0x33c($s0)
/* B3450 800B2850 10620009 */  beq        $v1, $v0, .L800B2878
/* B3454 800B2854 8FBF0018 */   lw        $ra, 0x18($sp)
/* B3458 800B2858 9602033E */  lhu        $v0, 0x33e($s0)
/* B345C 800B285C 2442FFFF */  addiu      $v0, $v0, -1
/* B3460 800B2860 A602033E */  sh         $v0, 0x33e($s0)
/* B3464 800B2864 00021400 */  sll        $v0, $v0, 0x10
/* B3468 800B2868 000213C3 */  sra        $v0, $v0, 0xf
/* B346C 800B286C 96230000 */  lhu        $v1, ($s1)
/* B3470 800B2870 02021021 */  addu       $v0, $s0, $v0
/* B3474 800B2874 A4430004 */  sh         $v1, 4($v0)
.L800B2878:
/* B3478 800B2878 A620000A */  sh         $zero, 0xa($s1)
/* B347C 800B287C A6200002 */  sh         $zero, 2($s1)
/* B3480 800B2880 8FB10014 */  lw         $s1, 0x14($sp)
/* B3484 800B2884 8FB00010 */  lw         $s0, 0x10($sp)
/* B3488 800B2888 03E00008 */  jr         $ra
/* B348C 800B288C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B2890
/* B3490 800B2890 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B3494 800B2894 AFB00010 */  sw         $s0, 0x10($sp)
/* B3498 800B2898 00808021 */  addu       $s0, $a0, $zero
/* B349C 800B289C AFB20018 */  sw         $s2, 0x18($sp)
/* B34A0 800B28A0 00A09021 */  addu       $s2, $a1, $zero
/* B34A4 800B28A4 AFB10014 */  sw         $s1, 0x14($sp)
/* B34A8 800B28A8 00C08821 */  addu       $s1, $a2, $zero
/* B34AC 800B28AC AFBF001C */  sw         $ra, 0x1c($sp)
/* B34B0 800B28B0 0C02C99B */  jal        func_800B266C
/* B34B4 800B28B4 02202821 */   addu      $a1, $s1, $zero
/* B34B8 800B28B8 02002021 */  addu       $a0, $s0, $zero
/* B34BC 800B28BC 02402821 */  addu       $a1, $s2, $zero
/* B34C0 800B28C0 0C02C978 */  jal        func_800B25E0
/* B34C4 800B28C4 02203021 */   addu      $a2, $s1, $zero
/* B34C8 800B28C8 8FBF001C */  lw         $ra, 0x1c($sp)
/* B34CC 800B28CC 8FB20018 */  lw         $s2, 0x18($sp)
/* B34D0 800B28D0 8FB10014 */  lw         $s1, 0x14($sp)
/* B34D4 800B28D4 8FB00010 */  lw         $s0, 0x10($sp)
/* B34D8 800B28D8 03E00008 */  jr         $ra
/* B34DC 800B28DC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel AllocParticleEmitter
/* B34E0 800B28E0 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* B34E4 800B28E4 AFB10094 */  sw         $s1, 0x94($sp)
/* B34E8 800B28E8 00808821 */  addu       $s1, $a0, $zero
/* B34EC 800B28EC 00052C00 */  sll        $a1, $a1, 0x10
/* B34F0 800B28F0 AFB400A0 */  sw         $s4, 0xa0($sp)
/* B34F4 800B28F4 0005A403 */  sra        $s4, $a1, 0x10
/* B34F8 800B28F8 00063400 */  sll        $a2, $a2, 0x10
/* B34FC 800B28FC AFB20098 */  sw         $s2, 0x98($sp)
/* B3500 800B2900 00069403 */  sra        $s2, $a2, 0x10
/* B3504 800B2904 00073C00 */  sll        $a3, $a3, 0x10
/* B3508 800B2908 AFBF00A8 */  sw         $ra, 0xa8($sp)
/* B350C 800B290C AFB500A4 */  sw         $s5, 0xa4($sp)
/* B3510 800B2910 AFB3009C */  sw         $s3, 0x9c($sp)
/* B3514 800B2914 AFB00090 */  sw         $s0, 0x90($sp)
/* B3518 800B2918 86220340 */  lh         $v0, 0x340($s1)
/* B351C 800B291C 28420010 */  slti       $v0, $v0, 0x10
/* B3520 800B2920 10400009 */  beqz       $v0, .L800B2948
/* B3524 800B2924 0007AC03 */   sra       $s5, $a3, 0x10
/* B3528 800B2928 02202021 */  addu       $a0, $s1, $zero
/* B352C 800B292C 0C02C9B6 */  jal        func_800B26D8
/* B3530 800B2930 02802821 */   addu      $a1, $s4, $zero
/* B3534 800B2934 00409821 */  addu       $s3, $v0, $zero
/* B3538 800B2938 86630000 */  lh         $v1, ($s3)
/* B353C 800B293C 9622033C */  lhu        $v0, 0x33c($s1)
/* B3540 800B2940 54620003 */  bnel       $v1, $v0, .L800B2950
/* B3544 800B2944 96220340 */   lhu       $v0, 0x340($s1)
.L800B2948:
/* B3548 800B2948 0802CA85 */  j          .L800B2A14
/* B354C 800B294C 00001021 */   addu      $v0, $zero, $zero
.L800B2950:
/* B3550 800B2950 24430001 */  addiu      $v1, $v0, 1
/* B3554 800B2954 00021400 */  sll        $v0, $v0, 0x10
/* B3558 800B2958 000213C3 */  sra        $v0, $v0, 0xf
/* B355C 800B295C 02221021 */  addu       $v0, $s1, $v0
/* B3560 800B2960 A6230340 */  sh         $v1, 0x340($s1)
/* B3564 800B2964 8444030C */  lh         $a0, 0x30c($v0)
/* B3568 800B2968 8E220308 */  lw         $v0, 0x308($s1)
/* B356C 800B296C 00041940 */  sll        $v1, $a0, 5
/* B3570 800B2970 00641821 */  addu       $v1, $v1, $a0
/* B3574 800B2974 00031900 */  sll        $v1, $v1, 4
/* B3578 800B2978 00438021 */  addu       $s0, $v0, $v1
/* B357C 800B297C 86050000 */  lh         $a1, ($s0)
/* B3580 800B2980 0C02C62A */  jal        func_800B18A8
/* B3584 800B2984 02002021 */   addu      $a0, $s0, $zero
/* B3588 800B2988 34028007 */  ori        $v0, $zero, 0x8007
/* B358C 800B298C A6140002 */  sh         $s4, 2($s0)
/* B3590 800B2990 A602000C */  sh         $v0, 0xc($s0)
/* B3594 800B2994 A6150008 */  sh         $s5, 8($s0)
/* B3598 800B2998 8FA200C0 */  lw         $v0, 0xc0($sp)
/* B359C 800B299C AE0201B8 */  sw         $v0, 0x1b8($s0)
/* B35A0 800B29A0 8FA300C4 */  lw         $v1, 0xc4($sp)
/* B35A4 800B29A4 AE0301BC */  sw         $v1, 0x1bc($s0)
/* B35A8 800B29A8 8FA200C8 */  lw         $v0, 0xc8($sp)
/* B35AC 800B29AC AE0201C0 */  sw         $v0, 0x1c0($s0)
/* B35B0 800B29B0 8FA300CC */  lw         $v1, 0xcc($sp)
/* B35B4 800B29B4 AE0301C4 */  sw         $v1, 0x1c4($s0)
/* B35B8 800B29B8 8FA200D0 */  lw         $v0, 0xd0($sp)
/* B35BC 800B29BC A612000A */  sh         $s2, 0xa($s0)
/* B35C0 800B29C0 06400005 */  bltz       $s2, .L800B29D8
/* B35C4 800B29C4 AE0201C8 */   sw        $v0, 0x1c8($s0)
/* B35C8 800B29C8 86220330 */  lh         $v0, 0x330($s1)
/* B35CC 800B29CC 0242102A */  slt        $v0, $s2, $v0
/* B35D0 800B29D0 1440000D */  bnez       $v0, .L800B2A08
/* B35D4 800B29D4 02001021 */   addu      $v0, $s0, $zero
.L800B29D8:
/* B35D8 800B29D8 27A40010 */  addiu      $a0, $sp, 0x10
/* B35DC 800B29DC 3C05800E */  lui        $a1, %hi(D_800E3A90)
/* B35E0 800B29E0 24A53A90 */  addiu      $a1, $a1, %lo(D_800E3A90)
/* B35E4 800B29E4 86270330 */  lh         $a3, 0x330($s1)
/* B35E8 800B29E8 02403021 */  addu       $a2, $s2, $zero
/* B35EC 800B29EC 0C0333AC */  jal        sprintf
/* B35F0 800B29F0 24E7FFFF */   addiu     $a3, $a3, -1
/* B35F4 800B29F4 3C04800E */  lui        $a0, %hi(D_800E3AB4)
/* B35F8 800B29F8 24843AB4 */  addiu      $a0, $a0, %lo(D_800E3AB4)
/* B35FC 800B29FC 0C025F2D */  jal        manualCrash
/* B3600 800B2A00 27A50010 */   addiu     $a1, $sp, 0x10
/* B3604 800B2A04 02001021 */  addu       $v0, $s0, $zero
.L800B2A08:
/* B3608 800B2A08 3403C00A */  ori        $v1, $zero, 0xc00a
/* B360C 800B2A0C AE130014 */  sw         $s3, 0x14($s0)
/* B3610 800B2A10 A663000A */  sh         $v1, 0xa($s3)
.L800B2A14:
/* B3614 800B2A14 8FBF00A8 */  lw         $ra, 0xa8($sp)
/* B3618 800B2A18 8FB500A4 */  lw         $s5, 0xa4($sp)
/* B361C 800B2A1C 8FB400A0 */  lw         $s4, 0xa0($sp)
/* B3620 800B2A20 8FB3009C */  lw         $s3, 0x9c($sp)
/* B3624 800B2A24 8FB20098 */  lw         $s2, 0x98($sp)
/* B3628 800B2A28 8FB10094 */  lw         $s1, 0x94($sp)
/* B362C 800B2A2C 8FB00090 */  lw         $s0, 0x90($sp)
/* B3630 800B2A30 03E00008 */  jr         $ra
/* B3634 800B2A34 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel FreeParticleEmitter
/* B3638 800B2A38 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B363C 800B2A3C AFB20018 */  sw         $s2, 0x18($sp)
/* B3640 800B2A40 00A09021 */  addu       $s2, $a1, $zero
/* B3644 800B2A44 AFBF0024 */  sw         $ra, 0x24($sp)
/* B3648 800B2A48 AFB40020 */  sw         $s4, 0x20($sp)
/* B364C 800B2A4C AFB3001C */  sw         $s3, 0x1c($sp)
/* B3650 800B2A50 AFB10014 */  sw         $s1, 0x14($sp)
/* B3654 800B2A54 AFB00010 */  sw         $s0, 0x10($sp)
/* B3658 800B2A58 9642000C */  lhu        $v0, 0xc($s2)
/* B365C 800B2A5C 30420004 */  andi       $v0, $v0, 4
/* B3660 800B2A60 10400015 */  beqz       $v0, .L800B2AB8
/* B3664 800B2A64 00808821 */   addu      $s1, $a0, $zero
/* B3668 800B2A68 8E420014 */  lw         $v0, 0x14($s2)
/* B366C 800B2A6C 84500006 */  lh         $s0, 6($v0)
/* B3670 800B2A70 2403FFFF */  addiu      $v1, $zero, -1
/* B3674 800B2A74 12030011 */  beq        $s0, $v1, .L800B2ABC
/* B3678 800B2A78 00000000 */   nop
/* B367C 800B2A7C 8E240000 */  lw         $a0, ($s1)
/* B3680 800B2A80 2405FFFF */  addiu      $a1, $zero, -1
/* B3684 800B2A84 00101040 */  sll        $v0, $s0, 1
.L800B2A88:
/* B3688 800B2A88 00501021 */  addu       $v0, $v0, $s0
/* B368C 800B2A8C 00021080 */  sll        $v0, $v0, 2
/* B3690 800B2A90 00501021 */  addu       $v0, $v0, $s0
/* B3694 800B2A94 00021140 */  sll        $v0, $v0, 5
/* B3698 800B2A98 00441021 */  addu       $v0, $v0, $a0
/* B369C 800B2A9C 9443000A */  lhu        $v1, 0xa($v0)
/* B36A0 800B2AA0 30630008 */  andi       $v1, $v1, 8
/* B36A4 800B2AA4 1060002F */  beqz       $v1, .L800B2B64
/* B36A8 800B2AA8 8FBF0024 */   lw        $ra, 0x24($sp)
/* B36AC 800B2AAC 84500006 */  lh         $s0, 6($v0)
/* B36B0 800B2AB0 1605FFF5 */  bne        $s0, $a1, .L800B2A88
/* B36B4 800B2AB4 00101040 */   sll       $v0, $s0, 1
.L800B2AB8:
/* B36B8 800B2AB8 8E420014 */  lw         $v0, 0x14($s2)
.L800B2ABC:
/* B36BC 800B2ABC 10400015 */  beqz       $v0, .L800B2B14
/* B36C0 800B2AC0 2634030C */   addiu     $s4, $s1, 0x30c
/* B36C4 800B2AC4 84500006 */  lh         $s0, 6($v0)
/* B36C8 800B2AC8 2402FFFF */  addiu      $v0, $zero, -1
/* B36CC 800B2ACC 1202000E */  beq        $s0, $v0, .L800B2B08
/* B36D0 800B2AD0 2413FFFF */   addiu     $s3, $zero, -1
/* B36D4 800B2AD4 02202021 */  addu       $a0, $s1, $zero
.L800B2AD8:
/* B36D8 800B2AD8 00101040 */  sll        $v0, $s0, 1
/* B36DC 800B2ADC 00501021 */  addu       $v0, $v0, $s0
/* B36E0 800B2AE0 00021080 */  sll        $v0, $v0, 2
/* B36E4 800B2AE4 00501021 */  addu       $v0, $v0, $s0
/* B36E8 800B2AE8 8E230000 */  lw         $v1, ($s1)
/* B36EC 800B2AEC 00021140 */  sll        $v0, $v0, 5
/* B36F0 800B2AF0 00431021 */  addu       $v0, $v0, $v1
/* B36F4 800B2AF4 00402821 */  addu       $a1, $v0, $zero
/* B36F8 800B2AF8 0C02CA0B */  jal        func_800B282C
/* B36FC 800B2AFC 84500006 */   lh        $s0, 6($v0)
/* B3700 800B2B00 1613FFF5 */  bne        $s0, $s3, .L800B2AD8
/* B3704 800B2B04 02202021 */   addu      $a0, $s1, $zero
.L800B2B08:
/* B3708 800B2B08 8E450014 */  lw         $a1, 0x14($s2)
/* B370C 800B2B0C 0C02CA0B */  jal        func_800B282C
/* B3710 800B2B10 02202021 */   addu      $a0, $s1, $zero
.L800B2B14:
/* B3714 800B2B14 96220340 */  lhu        $v0, 0x340($s1)
/* B3718 800B2B18 AE400014 */  sw         $zero, 0x14($s2)
/* B371C 800B2B1C 2442FFFF */  addiu      $v0, $v0, -1
/* B3720 800B2B20 A6220340 */  sh         $v0, 0x340($s1)
/* B3724 800B2B24 00021400 */  sll        $v0, $v0, 0x10
/* B3728 800B2B28 000213C3 */  sra        $v0, $v0, 0xf
/* B372C 800B2B2C 96430000 */  lhu        $v1, ($s2)
/* B3730 800B2B30 02821021 */  addu       $v0, $s4, $v0
/* B3734 800B2B34 A4430000 */  sh         $v1, ($v0)
/* B3738 800B2B38 A6400002 */  sh         $zero, 2($s2)
/* B373C 800B2B3C A640000C */  sh         $zero, 0xc($s2)
/* B3740 800B2B40 86220340 */  lh         $v0, 0x340($s1)
/* B3744 800B2B44 04410007 */  bgez       $v0, .L800B2B64
/* B3748 800B2B48 8FBF0024 */   lw        $ra, 0x24($sp)
/* B374C 800B2B4C 3C04800E */  lui        $a0, %hi(D_800E3ACC)
/* B3750 800B2B50 24843ACC */  addiu      $a0, $a0, %lo(D_800E3ACC)
/* B3754 800B2B54 3C05800E */  lui        $a1, %hi(D_800E3AE0)
/* B3758 800B2B58 0C025F2D */  jal        manualCrash
/* B375C 800B2B5C 24A53AE0 */   addiu     $a1, $a1, %lo(D_800E3AE0)
/* B3760 800B2B60 8FBF0024 */  lw         $ra, 0x24($sp)
.L800B2B64:
/* B3764 800B2B64 8FB40020 */  lw         $s4, 0x20($sp)
/* B3768 800B2B68 8FB3001C */  lw         $s3, 0x1c($sp)
/* B376C 800B2B6C 8FB20018 */  lw         $s2, 0x18($sp)
/* B3770 800B2B70 8FB10014 */  lw         $s1, 0x14($sp)
/* B3774 800B2B74 8FB00010 */  lw         $s0, 0x10($sp)
/* B3778 800B2B78 03E00008 */  jr         $ra
/* B377C 800B2B7C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B2B80
/* B3780 800B2B80 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B3784 800B2B84 AFB10014 */  sw         $s1, 0x14($sp)
/* B3788 800B2B88 00808821 */  addu       $s1, $a0, $zero
/* B378C 800B2B8C AFB00010 */  sw         $s0, 0x10($sp)
/* B3790 800B2B90 00A08021 */  addu       $s0, $a1, $zero
/* B3794 800B2B94 02002021 */  addu       $a0, $s0, $zero
/* B3798 800B2B98 AFBF0018 */  sw         $ra, 0x18($sp)
/* B379C 800B2B9C 0C02CB38 */  jal        func_800B2CE0
/* B37A0 800B2BA0 24050004 */   addiu     $a1, $zero, 4
/* B37A4 800B2BA4 02202021 */  addu       $a0, $s1, $zero
/* B37A8 800B2BA8 0C02CA8E */  jal        FreeParticleEmitter
/* B37AC 800B2BAC 02002821 */   addu      $a1, $s0, $zero
/* B37B0 800B2BB0 8FBF0018 */  lw         $ra, 0x18($sp)
/* B37B4 800B2BB4 8FB10014 */  lw         $s1, 0x14($sp)
/* B37B8 800B2BB8 8FB00010 */  lw         $s0, 0x10($sp)
/* B37BC 800B2BBC 03E00008 */  jr         $ra
/* B37C0 800B2BC0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B2BC4
/* B37C4 800B2BC4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B37C8 800B2BC8 AFB10014 */  sw         $s1, 0x14($sp)
/* B37CC 800B2BCC 00808821 */  addu       $s1, $a0, $zero
/* B37D0 800B2BD0 AFB00010 */  sw         $s0, 0x10($sp)
/* B37D4 800B2BD4 00008021 */  addu       $s0, $zero, $zero
/* B37D8 800B2BD8 AFBF0018 */  sw         $ra, 0x18($sp)
/* B37DC 800B2BDC 00101140 */  sll        $v0, $s0, 5
.L800B2BE0:
/* B37E0 800B2BE0 00501021 */  addu       $v0, $v0, $s0
/* B37E4 800B2BE4 8E240308 */  lw         $a0, 0x308($s1)
/* B37E8 800B2BE8 00021100 */  sll        $v0, $v0, 4
/* B37EC 800B2BEC 00442821 */  addu       $a1, $v0, $a0
/* B37F0 800B2BF0 84A30002 */  lh         $v1, 2($a1)
/* B37F4 800B2BF4 18600004 */  blez       $v1, .L800B2C08
/* B37F8 800B2BF8 26020001 */   addiu     $v0, $s0, 1
/* B37FC 800B2BFC 0C02CAE0 */  jal        func_800B2B80
/* B3800 800B2C00 02202021 */   addu      $a0, $s1, $zero
/* B3804 800B2C04 26020001 */  addiu      $v0, $s0, 1
.L800B2C08:
/* B3808 800B2C08 3050FFFF */  andi       $s0, $v0, 0xffff
/* B380C 800B2C0C 2E030010 */  sltiu      $v1, $s0, 0x10
/* B3810 800B2C10 5460FFF3 */  bnel       $v1, $zero, .L800B2BE0
/* B3814 800B2C14 00101140 */   sll       $v0, $s0, 5
/* B3818 800B2C18 8FBF0018 */  lw         $ra, 0x18($sp)
/* B381C 800B2C1C 8FB10014 */  lw         $s1, 0x14($sp)
/* B3820 800B2C20 8FB00010 */  lw         $s0, 0x10($sp)
/* B3824 800B2C24 03E00008 */  jr         $ra
/* B3828 800B2C28 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B2C2C
/* B382C 800B2C2C 84820002 */  lh         $v0, 2($a0)
/* B3830 800B2C30 3C01800E */  lui        $at, %hi(D_800E3AF4)
/* B3834 800B2C34 C4223AF4 */  lwc1       $f2, %lo(D_800E3AF4)($at)
/* B3838 800B2C38 2442FFFF */  addiu      $v0, $v0, -1
/* B383C 800B2C3C 44820000 */  mtc1       $v0, $f0
/* B3840 800B2C40 46800020 */  cvt.s.w    $f0, $f0
/* B3844 800B2C44 03E00008 */  jr         $ra
/* B3848 800B2C48 46001003 */   div.s     $f0, $f2, $f0

glabel func_800B2C4C
/* B384C 800B2C4C C7A00010 */  lwc1       $f0, 0x10($sp)
/* B3850 800B2C50 AC85002C */  sw         $a1, 0x2c($a0)
/* B3854 800B2C54 AC860030 */  sw         $a2, 0x30($a0)
/* B3858 800B2C58 AC870034 */  sw         $a3, 0x34($a0)
/* B385C 800B2C5C 03E00008 */  jr         $ra
/* B3860 800B2C60 E4800038 */   swc1      $f0, 0x38($a0)

glabel func_800B2C64
/* B3864 800B2C64 AC85000C */  sw         $a1, 0xc($a0)
/* B3868 800B2C68 AC860010 */  sw         $a2, 0x10($a0)
/* B386C 800B2C6C 03E00008 */  jr         $ra
/* B3870 800B2C70 AC870014 */   sw        $a3, 0x14($a0)

glabel func_800B2C74
/* B3874 800B2C74 AC850018 */  sw         $a1, 0x18($a0)
/* B3878 800B2C78 AC86001C */  sw         $a2, 0x1c($a0)
/* B387C 800B2C7C 03E00008 */  jr         $ra
/* B3880 800B2C80 AC870020 */   sw        $a3, 0x20($a0)

glabel func_800B2C84
/* B3884 800B2C84 AC850024 */  sw         $a1, 0x24($a0)
/* B3888 800B2C88 03E00008 */  jr         $ra
/* B388C 800B2C8C AC860028 */   sw        $a2, 0x28($a0)

glabel func_800B2C90
/* B3890 800B2C90 C7A00010 */  lwc1       $f0, 0x10($sp)
/* B3894 800B2C94 AC85003C */  sw         $a1, 0x3c($a0)
/* B3898 800B2C98 AC860040 */  sw         $a2, 0x40($a0)
/* B389C 800B2C9C AC870044 */  sw         $a3, 0x44($a0)
/* B38A0 800B2CA0 03E00008 */  jr         $ra
/* B38A4 800B2CA4 E4800048 */   swc1      $f0, 0x48($a0)

glabel particle_set_flags
/* B38A8 800B2CA8 9482000A */  lhu        $v0, 0xa($a0)
/* B38AC 800B2CAC 00451025 */  or         $v0, $v0, $a1
/* B38B0 800B2CB0 03E00008 */  jr         $ra
/* B38B4 800B2CB4 A482000A */   sh        $v0, 0xa($a0)

glabel particle_NAND_flags
/* B38B8 800B2CB8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* B38BC 800B2CBC 9482000A */  lhu        $v0, 0xa($a0)
/* B38C0 800B2CC0 00052827 */  nor        $a1, $zero, $a1
/* B38C4 800B2CC4 00451024 */  and        $v0, $v0, $a1
/* B38C8 800B2CC8 03E00008 */  jr         $ra
/* B38CC 800B2CCC A482000A */   sh        $v0, 0xa($a0)

glabel func_800B2CD0
/* B38D0 800B2CD0 9482000C */  lhu        $v0, 0xc($a0)
/* B38D4 800B2CD4 00451025 */  or         $v0, $v0, $a1
/* B38D8 800B2CD8 03E00008 */  jr         $ra
/* B38DC 800B2CDC A482000C */   sh        $v0, 0xc($a0)

glabel func_800B2CE0
/* B38E0 800B2CE0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* B38E4 800B2CE4 9482000C */  lhu        $v0, 0xc($a0)
/* B38E8 800B2CE8 00052827 */  nor        $a1, $zero, $a1
/* B38EC 800B2CEC 00451024 */  and        $v0, $v0, $a1
/* B38F0 800B2CF0 03E00008 */  jr         $ra
/* B38F4 800B2CF4 A482000C */   sh        $v0, 0xc($a0)

glabel func_800B2CF8
/* B38F8 800B2CF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B38FC 800B2CFC AFBF0010 */  sw         $ra, 0x10($sp)
/* B3900 800B2D00 AC850010 */  sw         $a1, 0x10($a0)
/* B3904 800B2D04 0C02CB34 */  jal        func_800B2CD0
/* B3908 800B2D08 24054000 */   addiu     $a1, $zero, 0x4000
/* B390C 800B2D0C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B3910 800B2D10 03E00008 */  jr         $ra
/* B3914 800B2D14 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B2D18
/* B3918 800B2D18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B391C 800B2D1C AFBF0010 */  sw         $ra, 0x10($sp)
/* B3920 800B2D20 0C02CB38 */  jal        func_800B2CE0
/* B3924 800B2D24 24054000 */   addiu     $a1, $zero, 0x4000
/* B3928 800B2D28 8FBF0010 */  lw         $ra, 0x10($sp)
/* B392C 800B2D2C 03E00008 */  jr         $ra
/* B3930 800B2D30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B2D34
/* B3934 800B2D34 27BDFF90 */  addiu      $sp, $sp, -0x70
/* B3938 800B2D38 00C01021 */  addu       $v0, $a2, $zero
/* B393C 800B2D3C AFB00048 */  sw         $s0, 0x48($sp)
/* B3940 800B2D40 00808021 */  addu       $s0, $a0, $zero
/* B3944 800B2D44 30E4FFFF */  andi       $a0, $a3, 0xffff
/* B3948 800B2D48 AFBF006C */  sw         $ra, 0x6c($sp)
/* B394C 800B2D4C AFBE0068 */  sw         $fp, 0x68($sp)
/* B3950 800B2D50 AFB70064 */  sw         $s7, 0x64($sp)
/* B3954 800B2D54 AFB60060 */  sw         $s6, 0x60($sp)
/* B3958 800B2D58 AFB5005C */  sw         $s5, 0x5c($sp)
/* B395C 800B2D5C AFB40058 */  sw         $s4, 0x58($sp)
/* B3960 800B2D60 AFB30054 */  sw         $s3, 0x54($sp)
/* B3964 800B2D64 AFB20050 */  sw         $s2, 0x50($sp)
/* B3968 800B2D68 AFB1004C */  sw         $s1, 0x4c($sp)
/* B396C 800B2D6C C4400008 */  lwc1       $f0, 8($v0)
/* B3970 800B2D70 00042180 */  sll        $a0, $a0, 6
/* B3974 800B2D74 E7A00010 */  swc1       $f0, 0x10($sp)
/* B3978 800B2D78 C4420000 */  lwc1       $f2, ($v0)
/* B397C 800B2D7C 3C01800E */  lui        $at, %hi(D_800E3AF8)
/* B3980 800B2D80 C4203AF8 */  lwc1       $f0, %lo(D_800E3AF8)($at)
/* B3984 800B2D84 24840348 */  addiu      $a0, $a0, 0x348
/* B3988 800B2D88 46001080 */  add.s      $f2, $f2, $f0
/* B398C 800B2D8C 00A42021 */  addu       $a0, $a1, $a0
/* B3990 800B2D90 8C470004 */  lw         $a3, 4($v0)
/* B3994 800B2D94 44061000 */  mfc1       $a2, $f2
/* B3998 800B2D98 0C02F937 */  jal        guAlign
/* B399C 800B2D9C 00002821 */   addu      $a1, $zero, $zero
/* B39A0 800B2DA0 AFB00018 */  sw         $s0, 0x18($sp)
/* B39A4 800B2DA4 26100008 */  addiu      $s0, $s0, 8
/* B39A8 800B2DA8 AFB0001C */  sw         $s0, 0x1c($sp)
/* B39AC 800B2DAC 26100008 */  addiu      $s0, $s0, 8
/* B39B0 800B2DB0 3C15E300 */  lui        $s5, 0xe300
/* B39B4 800B2DB4 36B50A01 */  ori        $s5, $s5, 0xa01
/* B39B8 800B2DB8 AFB00020 */  sw         $s0, 0x20($sp)
/* B39BC 800B2DBC 26100008 */  addiu      $s0, $s0, 8
/* B39C0 800B2DC0 3C14E300 */  lui        $s4, 0xe300
/* B39C4 800B2DC4 36940800 */  ori        $s4, $s4, 0x800
/* B39C8 800B2DC8 AFB00024 */  sw         $s0, 0x24($sp)
/* B39CC 800B2DCC 26100008 */  addiu      $s0, $s0, 8
/* B39D0 800B2DD0 3C13E200 */  lui        $s3, 0xe200
/* B39D4 800B2DD4 3673001C */  ori        $s3, $s3, 0x1c
/* B39D8 800B2DD8 3C120050 */  lui        $s2, 0x50
/* B39DC 800B2DDC 36524A50 */  ori        $s2, $s2, 0x4a50
/* B39E0 800B2DE0 AFB00028 */  sw         $s0, 0x28($sp)
/* B39E4 800B2DE4 26100008 */  addiu      $s0, $s0, 8
/* B39E8 800B2DE8 3C11FC12 */  lui        $s1, 0xfc12
/* B39EC 800B2DEC 36311824 */  ori        $s1, $s1, 0x1824
/* B39F0 800B2DF0 3C0FFF33 */  lui        $t7, 0xff33
/* B39F4 800B2DF4 35EFFFFF */  ori        $t7, $t7, 0xffff
/* B39F8 800B2DF8 AFB0002C */  sw         $s0, 0x2c($sp)
/* B39FC 800B2DFC 26100008 */  addiu      $s0, $s0, 8
/* B3A00 800B2E00 3C0EE300 */  lui        $t6, 0xe300
/* B3A04 800B2E04 35CE1700 */  ori        $t6, $t6, 0x1700
/* B3A08 800B2E08 AFB00030 */  sw         $s0, 0x30($sp)
/* B3A0C 800B2E0C 26100008 */  addiu      $s0, $s0, 8
/* B3A10 800B2E10 3C0DE300 */  lui        $t5, 0xe300
/* B3A14 800B2E14 35AD1801 */  ori        $t5, $t5, 0x1801
/* B3A18 800B2E18 AFB00034 */  sw         $s0, 0x34($sp)
/* B3A1C 800B2E1C 26100008 */  addiu      $s0, $s0, 8
/* B3A20 800B2E20 3C0CE200 */  lui        $t4, 0xe200
/* B3A24 800B2E24 358C1E01 */  ori        $t4, $t4, 0x1e01
/* B3A28 800B2E28 AFB00038 */  sw         $s0, 0x38($sp)
/* B3A2C 800B2E2C 26100008 */  addiu      $s0, $s0, 8
/* B3A30 800B2E30 3C0BE300 */  lui        $t3, 0xe300
/* B3A34 800B2E34 356B1A01 */  ori        $t3, $t3, 0x1a01
/* B3A38 800B2E38 AFB0003C */  sw         $s0, 0x3c($sp)
/* B3A3C 800B2E3C 26100008 */  addiu      $s0, $s0, 8
/* B3A40 800B2E40 3C0AE300 */  lui        $t2, 0xe300
/* B3A44 800B2E44 354A0F00 */  ori        $t2, $t2, 0xf00
/* B3A48 800B2E48 AFB00040 */  sw         $s0, 0x40($sp)
/* B3A4C 800B2E4C 26100008 */  addiu      $s0, $s0, 8
/* B3A50 800B2E50 3C09E300 */  lui        $t1, 0xe300
/* B3A54 800B2E54 35291001 */  ori        $t1, $t1, 0x1001
/* B3A58 800B2E58 0200C821 */  addu       $t9, $s0, $zero
/* B3A5C 800B2E5C 26100008 */  addiu      $s0, $s0, 8
/* B3A60 800B2E60 3C08E300 */  lui        $t0, 0xe300
/* B3A64 800B2E64 35081402 */  ori        $t0, $t0, 0x1402
/* B3A68 800B2E68 0200C021 */  addu       $t8, $s0, $zero
/* B3A6C 800B2E6C 26100008 */  addiu      $s0, $s0, 8
/* B3A70 800B2E70 3C07E300 */  lui        $a3, 0xe300
/* B3A74 800B2E74 34E71201 */  ori        $a3, $a3, 0x1201
/* B3A78 800B2E78 0200B821 */  addu       $s7, $s0, $zero
/* B3A7C 800B2E7C 26100008 */  addiu      $s0, $s0, 8
/* B3A80 800B2E80 8FBE0018 */  lw         $fp, 0x18($sp)
/* B3A84 800B2E84 3C02E700 */  lui        $v0, 0xe700
/* B3A88 800B2E88 AFC20000 */  sw         $v0, ($fp)
/* B3A8C 800B2E8C AFC00004 */  sw         $zero, 4($fp)
/* B3A90 800B2E90 8FA2001C */  lw         $v0, 0x1c($sp)
/* B3A94 800B2E94 3C05E300 */  lui        $a1, 0xe300
/* B3A98 800B2E98 AC550000 */  sw         $s5, ($v0)
/* B3A9C 800B2E9C AC400004 */  sw         $zero, 4($v0)
/* B3AA0 800B2EA0 8FBE0020 */  lw         $fp, 0x20($sp)
/* B3AA4 800B2EA4 34A50C00 */  ori        $a1, $a1, 0xc00
/* B3AA8 800B2EA8 AFD40000 */  sw         $s4, ($fp)
/* B3AAC 800B2EAC AFC00004 */  sw         $zero, 4($fp)
/* B3AB0 800B2EB0 8FA20024 */  lw         $v0, 0x24($sp)
/* B3AB4 800B2EB4 0200B021 */  addu       $s6, $s0, $zero
/* B3AB8 800B2EB8 AC530000 */  sw         $s3, ($v0)
/* B3ABC 800B2EBC AC520004 */  sw         $s2, 4($v0)
/* B3AC0 800B2EC0 8FBE0028 */  lw         $fp, 0x28($sp)
/* B3AC4 800B2EC4 26100008 */  addiu      $s0, $s0, 8
/* B3AC8 800B2EC8 AFD10000 */  sw         $s1, ($fp)
/* B3ACC 800B2ECC AFCF0004 */  sw         $t7, 4($fp)
/* B3AD0 800B2ED0 8FA2002C */  lw         $v0, 0x2c($sp)
/* B3AD4 800B2ED4 3C03E300 */  lui        $v1, 0xe300
/* B3AD8 800B2ED8 AC4E0000 */  sw         $t6, ($v0)
/* B3ADC 800B2EDC AC400004 */  sw         $zero, 4($v0)
/* B3AE0 800B2EE0 8FBE0030 */  lw         $fp, 0x30($sp)
/* B3AE4 800B2EE4 24020080 */  addiu      $v0, $zero, 0x80
/* B3AE8 800B2EE8 AFCD0000 */  sw         $t5, ($fp)
/* B3AEC 800B2EEC AFC20004 */  sw         $v0, 4($fp)
/* B3AF0 800B2EF0 8FA20034 */  lw         $v0, 0x34($sp)
/* B3AF4 800B2EF4 34630D01 */  ori        $v1, $v1, 0xd01
/* B3AF8 800B2EF8 AC4C0000 */  sw         $t4, ($v0)
/* B3AFC 800B2EFC AC400004 */  sw         $zero, 4($v0)
/* B3B00 800B2F00 8FAD0038 */  lw         $t5, 0x38($sp)
/* B3B04 800B2F04 8FBF006C */  lw         $ra, 0x6c($sp)
/* B3B08 800B2F08 8FB5005C */  lw         $s5, 0x5c($sp)
/* B3B0C 800B2F0C 8FB40058 */  lw         $s4, 0x58($sp)
/* B3B10 800B2F10 8FB30054 */  lw         $s3, 0x54($sp)
/* B3B14 800B2F14 8FB20050 */  lw         $s2, 0x50($sp)
/* B3B18 800B2F18 8FB1004C */  lw         $s1, 0x4c($sp)
/* B3B1C 800B2F1C 3C06D700 */  lui        $a2, 0xd700
/* B3B20 800B2F20 ADAB0000 */  sw         $t3, ($t5)
/* B3B24 800B2F24 ADA00004 */  sw         $zero, 4($t5)
/* B3B28 800B2F28 8FBE003C */  lw         $fp, 0x3c($sp)
/* B3B2C 800B2F2C 34C60002 */  ori        $a2, $a2, 2
/* B3B30 800B2F30 AFCA0000 */  sw         $t2, ($fp)
/* B3B34 800B2F34 AFC00004 */  sw         $zero, 4($fp)
/* B3B38 800B2F38 8FA20040 */  lw         $v0, 0x40($sp)
/* B3B3C 800B2F3C 8FBE0068 */  lw         $fp, 0x68($sp)
/* B3B40 800B2F40 3C048000 */  lui        $a0, 0x8000
/* B3B44 800B2F44 AC490000 */  sw         $t1, ($v0)
/* B3B48 800B2F48 AC400004 */  sw         $zero, 4($v0)
/* B3B4C 800B2F4C 24020C00 */  addiu      $v0, $zero, 0xc00
/* B3B50 800B2F50 AF220004 */  sw         $v0, 4($t9)
/* B3B54 800B2F54 24022000 */  addiu      $v0, $zero, 0x2000
/* B3B58 800B2F58 AF280000 */  sw         $t0, ($t9)
/* B3B5C 800B2F5C AF020004 */  sw         $v0, 4($t8)
/* B3B60 800B2F60 3C020008 */  lui        $v0, 8
/* B3B64 800B2F64 AF070000 */  sw         $a3, ($t8)
/* B3B68 800B2F68 AEE50000 */  sw         $a1, ($s7)
/* B3B6C 800B2F6C AEE20004 */  sw         $v0, 4($s7)
/* B3B70 800B2F70 8FB70064 */  lw         $s7, 0x64($sp)
/* B3B74 800B2F74 34848000 */  ori        $a0, $a0, 0x8000
/* B3B78 800B2F78 AEC30000 */  sw         $v1, ($s6)
/* B3B7C 800B2F7C AEC00004 */  sw         $zero, 4($s6)
/* B3B80 800B2F80 8FB60060 */  lw         $s6, 0x60($sp)
/* B3B84 800B2F84 26020008 */  addiu      $v0, $s0, 8
/* B3B88 800B2F88 AE060000 */  sw         $a2, ($s0)
/* B3B8C 800B2F8C AE040004 */  sw         $a0, 4($s0)
/* B3B90 800B2F90 8FB00048 */  lw         $s0, 0x48($sp)
/* B3B94 800B2F94 03E00008 */  jr         $ra
/* B3B98 800B2F98 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_800B2F9C
/* B3B9C 800B2F9C 00803821 */  addu       $a3, $a0, $zero
/* B3BA0 800B2FA0 00E01021 */  addu       $v0, $a3, $zero
/* B3BA4 800B2FA4 24E70008 */  addiu      $a3, $a3, 8
/* B3BA8 800B2FA8 3C03D900 */  lui        $v1, 0xd900
/* B3BAC 800B2FAC 30A5FFFF */  andi       $a1, $a1, 0xffff
/* B3BB0 800B2FB0 AC430000 */  sw         $v1, ($v0)
/* B3BB4 800B2FB4 10A00010 */  beqz       $a1, .L800B2FF8
/* B3BB8 800B2FB8 AC400004 */   sw        $zero, 4($v0)
/* B3BBC 800B2FBC 00E03021 */  addu       $a2, $a3, $zero
/* B3BC0 800B2FC0 24E70008 */  addiu      $a3, $a3, 8
/* B3BC4 800B2FC4 3C04D9FF */  lui        $a0, 0xd9ff
/* B3BC8 800B2FC8 3484FFFF */  ori        $a0, $a0, 0xffff
/* B3BCC 800B2FCC 3C030020 */  lui        $v1, 0x20
/* B3BD0 800B2FD0 34630005 */  ori        $v1, $v1, 5
/* B3BD4 800B2FD4 00E02821 */  addu       $a1, $a3, $zero
/* B3BD8 800B2FD8 24E70008 */  addiu      $a3, $a3, 8
/* B3BDC 800B2FDC 3C02E200 */  lui        $v0, 0xe200
/* B3BE0 800B2FE0 34421D00 */  ori        $v0, $v0, 0x1d00
/* B3BE4 800B2FE4 ACC40000 */  sw         $a0, ($a2)
/* B3BE8 800B2FE8 ACC30004 */  sw         $v1, 4($a2)
/* B3BEC 800B2FEC ACA20000 */  sw         $v0, ($a1)
/* B3BF0 800B2FF0 0802CC0D */  j          .L800B3034
/* B3BF4 800B2FF4 ACA00004 */   sw        $zero, 4($a1)
.L800B2FF8:
/* B3BF8 800B2FF8 00E03021 */  addu       $a2, $a3, $zero
/* B3BFC 800B2FFC 24E70008 */  addiu      $a3, $a3, 8
/* B3C00 800B3000 3C04D9FF */  lui        $a0, 0xd9ff
/* B3C04 800B3004 3484FFFF */  ori        $a0, $a0, 0xffff
/* B3C08 800B3008 3C030020 */  lui        $v1, 0x20
/* B3C0C 800B300C 34630004 */  ori        $v1, $v1, 4
/* B3C10 800B3010 00E02821 */  addu       $a1, $a3, $zero
/* B3C14 800B3014 24E70008 */  addiu      $a3, $a3, 8
/* B3C18 800B3018 3C02E200 */  lui        $v0, 0xe200
/* B3C1C 800B301C 34421D00 */  ori        $v0, $v0, 0x1d00
/* B3C20 800B3020 ACC30004 */  sw         $v1, 4($a2)
/* B3C24 800B3024 24030004 */  addiu      $v1, $zero, 4
/* B3C28 800B3028 ACC40000 */  sw         $a0, ($a2)
/* B3C2C 800B302C ACA20000 */  sw         $v0, ($a1)
/* B3C30 800B3030 ACA30004 */  sw         $v1, 4($a1)
.L800B3034:
/* B3C34 800B3034 03E00008 */  jr         $ra
/* B3C38 800B3038 00E01021 */   addu      $v0, $a3, $zero

glabel func_800B303C
/* B3C3C 800B303C 3C01800E */  lui        $at, %hi(D_800E3AFC)
/* B3C40 800B3040 C4203AFC */  lwc1       $f0, %lo(D_800E3AFC)($at)
/* B3C44 800B3044 44851000 */  mtc1       $a1, $f2
/* B3C48 800B3048 46001182 */  mul.s      $f6, $f2, $f0
/* B3C4C 800B304C 97A20012 */  lhu        $v0, 0x12($sp)
/* B3C50 800B3050 97A30016 */  lhu        $v1, 0x16($sp)
/* B3C54 800B3054 44864000 */  mtc1       $a2, $f8
/* B3C58 800B3058 97A8001A */  lhu        $t0, 0x1a($sp)
/* B3C5C 800B305C 46004102 */  mul.s      $f4, $f8, $f0
/* B3C60 800B3060 A4820006 */  sh         $v0, 6($a0)
/* B3C64 800B3064 A4830008 */  sh         $v1, 8($a0)
/* B3C68 800B3068 A488000A */  sh         $t0, 0xa($a0)
/* B3C6C 800B306C 93A2001F */  lbu        $v0, 0x1f($sp)
/* B3C70 800B3070 93A30023 */  lbu        $v1, 0x23($sp)
/* B3C74 800B3074 93A50027 */  lbu        $a1, 0x27($sp)
/* B3C78 800B3078 44874000 */  mtc1       $a3, $f8
/* B3C7C 800B307C 93A8002B */  lbu        $t0, 0x2b($sp)
/* B3C80 800B3080 46004082 */  mul.s      $f2, $f8, $f0
/* B3C84 800B3084 A082000C */  sb         $v0, 0xc($a0)
/* B3C88 800B3088 A083000D */  sb         $v1, 0xd($a0)
/* B3C8C 800B308C A085000E */  sb         $a1, 0xe($a0)
/* B3C90 800B3090 A088000F */  sb         $t0, 0xf($a0)
/* B3C94 800B3094 4600300D */  trunc.w.s  $f0, $f6
/* B3C98 800B3098 44020000 */  mfc1       $v0, $f0
/* B3C9C 800B309C A4820000 */  sh         $v0, ($a0)
/* B3CA0 800B30A0 4600200D */  trunc.w.s  $f0, $f4
/* B3CA4 800B30A4 44030000 */  mfc1       $v1, $f0
/* B3CA8 800B30A8 A4830002 */  sh         $v1, 2($a0)
/* B3CAC 800B30AC 4600100D */  trunc.w.s  $f0, $f2
/* B3CB0 800B30B0 44020000 */  mfc1       $v0, $f0
/* B3CB4 800B30B4 03E00008 */  jr         $ra
/* B3CB8 800B30B8 A4820004 */   sh        $v0, 4($a0)

glabel particle_func
/* B3CBC 800B30BC 27BDFF10 */  addiu      $sp, $sp, -0xf0
/* B3CC0 800B30C0 AFB600C8 */  sw         $s6, 0xc8($sp)
/* B3CC4 800B30C4 3C16800F */  lui        $s6, 0x800f
/* B3CC8 800B30C8 AFB700CC */  sw         $s7, 0xcc($sp)
/* B3CCC 800B30CC 00A0B821 */  addu       $s7, $a1, $zero
/* B3CD0 800B30D0 AFB300BC */  sw         $s3, 0xbc($sp)
/* B3CD4 800B30D4 00C09821 */  addu       $s3, $a2, $zero
/* B3CD8 800B30D8 AFBE00D0 */  sw         $fp, 0xd0($sp)
/* B3CDC 800B30DC 00E0F021 */  addu       $fp, $a3, $zero
/* B3CE0 800B30E0 3C03800F */  lui        $v1, 0x800f
/* B3CE4 800B30E4 AFBF00D4 */  sw         $ra, 0xd4($sp)
/* B3CE8 800B30E8 AFB500C4 */  sw         $s5, 0xc4($sp)
/* B3CEC 800B30EC AFB400C0 */  sw         $s4, 0xc0($sp)
/* B3CF0 800B30F0 AFB200B8 */  sw         $s2, 0xb8($sp)
/* B3CF4 800B30F4 AFB100B4 */  sw         $s1, 0xb4($sp)
/* B3CF8 800B30F8 AFB000B0 */  sw         $s0, 0xb0($sp)
/* B3CFC 800B30FC F7B800E8 */  sdc1       $f24, 0xe8($sp)
/* B3D00 800B3100 F7B600E0 */  sdc1       $f22, 0xe0($sp)
/* B3D04 800B3104 F7B400D8 */  sdc1       $f20, 0xd8($sp)
/* B3D08 800B3108 AFA400F0 */  sw         $a0, 0xf0($sp)
/* B3D0C 800B310C 8C950000 */  lw         $s5, ($a0)
/* B3D10 800B3110 94623634 */  lhu        $v0, 0x3634($v1)
/* B3D14 800B3114 1040003A */  beqz       $v0, .L800B3200
/* B3D18 800B3118 97B40102 */   lhu       $s4, 0x102($sp)
/* B3D1C 800B311C 26D256C0 */  addiu      $s2, $s6, 0x56c0
/* B3D20 800B3120 02402021 */  addu       $a0, $s2, $zero
/* B3D24 800B3124 24110400 */  addiu      $s1, $zero, 0x400
/* B3D28 800B3128 3C01800E */  lui        $at, %hi(D_800E3B1C)
/* B3D2C 800B312C C4383B1C */  lwc1       $f24, %lo(D_800E3B1C)($at)
/* B3D30 800B3130 3C01800E */  lui        $at, %hi(D_800E3B20)
/* B3D34 800B3134 C4343B20 */  lwc1       $f20, %lo(D_800E3B20)($at)
/* B3D38 800B3138 4480B000 */  mtc1       $zero, $f22
/* B3D3C 800B313C 4405C000 */  mfc1       $a1, $f24
/* B3D40 800B3140 4406A000 */  mfc1       $a2, $f20
/* B3D44 800B3144 4407B000 */  mfc1       $a3, $f22
/* B3D48 800B3148 241000FF */  addiu      $s0, $zero, 0xff
/* B3D4C 800B314C A4603634 */  sh         $zero, 0x3634($v1)
/* B3D50 800B3150 AFA00010 */  sw         $zero, 0x10($sp)
/* B3D54 800B3154 AFA00014 */  sw         $zero, 0x14($sp)
/* B3D58 800B3158 AFB10018 */  sw         $s1, 0x18($sp)
/* B3D5C 800B315C AFB0001C */  sw         $s0, 0x1c($sp)
/* B3D60 800B3160 AFB00020 */  sw         $s0, 0x20($sp)
/* B3D64 800B3164 AFB00024 */  sw         $s0, 0x24($sp)
/* B3D68 800B3168 0C02CC0F */  jal        func_800B303C
/* B3D6C 800B316C AFB00028 */   sw        $s0, 0x28($sp)
/* B3D70 800B3170 4405A000 */  mfc1       $a1, $f20
/* B3D74 800B3174 4406A000 */  mfc1       $a2, $f20
/* B3D78 800B3178 4407B000 */  mfc1       $a3, $f22
/* B3D7C 800B317C 26440010 */  addiu      $a0, $s2, 0x10
/* B3D80 800B3180 AFA00010 */  sw         $zero, 0x10($sp)
/* B3D84 800B3184 AFB10014 */  sw         $s1, 0x14($sp)
/* B3D88 800B3188 AFB10018 */  sw         $s1, 0x18($sp)
/* B3D8C 800B318C AFB0001C */  sw         $s0, 0x1c($sp)
/* B3D90 800B3190 AFB00020 */  sw         $s0, 0x20($sp)
/* B3D94 800B3194 AFB00024 */  sw         $s0, 0x24($sp)
/* B3D98 800B3198 0C02CC0F */  jal        func_800B303C
/* B3D9C 800B319C AFB00028 */   sw        $s0, 0x28($sp)
/* B3DA0 800B31A0 4405C000 */  mfc1       $a1, $f24
/* B3DA4 800B31A4 4406C000 */  mfc1       $a2, $f24
/* B3DA8 800B31A8 4407B000 */  mfc1       $a3, $f22
/* B3DAC 800B31AC 26440020 */  addiu      $a0, $s2, 0x20
/* B3DB0 800B31B0 AFA00010 */  sw         $zero, 0x10($sp)
/* B3DB4 800B31B4 AFA00014 */  sw         $zero, 0x14($sp)
/* B3DB8 800B31B8 AFA00018 */  sw         $zero, 0x18($sp)
/* B3DBC 800B31BC AFB0001C */  sw         $s0, 0x1c($sp)
/* B3DC0 800B31C0 AFB00020 */  sw         $s0, 0x20($sp)
/* B3DC4 800B31C4 AFB00024 */  sw         $s0, 0x24($sp)
/* B3DC8 800B31C8 0C02CC0F */  jal        func_800B303C
/* B3DCC 800B31CC AFB00028 */   sw        $s0, 0x28($sp)
/* B3DD0 800B31D0 4405A000 */  mfc1       $a1, $f20
/* B3DD4 800B31D4 4406C000 */  mfc1       $a2, $f24
/* B3DD8 800B31D8 4407B000 */  mfc1       $a3, $f22
/* B3DDC 800B31DC 26440030 */  addiu      $a0, $s2, 0x30
/* B3DE0 800B31E0 AFA00010 */  sw         $zero, 0x10($sp)
/* B3DE4 800B31E4 AFB10014 */  sw         $s1, 0x14($sp)
/* B3DE8 800B31E8 AFA00018 */  sw         $zero, 0x18($sp)
/* B3DEC 800B31EC AFB0001C */  sw         $s0, 0x1c($sp)
/* B3DF0 800B31F0 AFB00020 */  sw         $s0, 0x20($sp)
/* B3DF4 800B31F4 AFB00024 */  sw         $s0, 0x24($sp)
/* B3DF8 800B31F8 0C02CC0F */  jal        func_800B303C
/* B3DFC 800B31FC AFB00028 */   sw        $s0, 0x28($sp)
.L800B3200:
/* B3E00 800B3200 8E63002C */  lw         $v1, 0x2c($s3)
/* B3E04 800B3204 8E640030 */  lw         $a0, 0x30($s3)
/* B3E08 800B3208 8E650034 */  lw         $a1, 0x34($s3)
/* B3E0C 800B320C C6E20334 */  lwc1       $f2, 0x334($s7)
/* B3E10 800B3210 3C01800E */  lui        $at, %hi(D_800E3B24)
/* B3E14 800B3214 C4203B24 */  lwc1       $f0, %lo(D_800E3B24)($at)
/* B3E18 800B3218 8E620038 */  lw         $v0, 0x38($s3)
/* B3E1C 800B321C 4600103C */  c.lt.s     $f2, $f0
/* B3E20 800B3220 AFA30070 */  sw         $v1, 0x70($sp)
/* B3E24 800B3224 AFA40074 */  sw         $a0, 0x74($sp)
/* B3E28 800B3228 AFA50078 */  sw         $a1, 0x78($sp)
/* B3E2C 800B322C 45000004 */  bc1f       .L800B3240
/* B3E30 800B3230 AFA2007C */   sw        $v0, 0x7c($sp)
/* B3E34 800B3234 44051000 */  mfc1       $a1, $f2
/* B3E38 800B3238 0C02AD47 */  jal        multiVec4
/* B3E3C 800B323C 27A40070 */   addiu     $a0, $sp, 0x70
.L800B3240:
/* B3E40 800B3240 C7A20070 */  lwc1       $f2, 0x70($sp)
/* B3E44 800B3244 3C01800E */  lui        $at, %hi(D_800E3B28)
/* B3E48 800B3248 C4203B28 */  lwc1       $f0, %lo(D_800E3B28)($at)
/* B3E4C 800B324C 46001002 */  mul.s      $f0, $f2, $f0
/* B3E50 800B3250 3C01800E */  lui        $at, %hi(D_800E3B2C)
/* B3E54 800B3254 C4223B2C */  lwc1       $f2, %lo(D_800E3B2C)($at)
/* B3E58 800B3258 4600103E */  c.le.s     $f2, $f0
/* B3E5C 800B325C 00000000 */  nop
/* B3E60 800B3260 45030005 */  bc1tl      .L800B3278
/* B3E64 800B3264 46020001 */   sub.s     $f0, $f0, $f2
/* B3E68 800B3268 4600008D */  trunc.w.s  $f2, $f0
/* B3E6C 800B326C 44031000 */  mfc1       $v1, $f2
/* B3E70 800B3270 0802CCA3 */  j          .L800B328C
/* B3E74 800B3274 C7A20074 */   lwc1      $f2, 0x74($sp)
.L800B3278:
/* B3E78 800B3278 4600008D */  trunc.w.s  $f2, $f0
/* B3E7C 800B327C 44031000 */  mfc1       $v1, $f2
/* B3E80 800B3280 3C028000 */  lui        $v0, 0x8000
/* B3E84 800B3284 00621825 */  or         $v1, $v1, $v0
/* B3E88 800B3288 C7A20074 */  lwc1       $f2, 0x74($sp)
.L800B328C:
/* B3E8C 800B328C 3C01800E */  lui        $at, %hi(D_800E3B30)
/* B3E90 800B3290 C4203B30 */  lwc1       $f0, %lo(D_800E3B30)($at)
/* B3E94 800B3294 46001002 */  mul.s      $f0, $f2, $f0
/* B3E98 800B3298 3C01800E */  lui        $at, %hi(D_800E3B34)
/* B3E9C 800B329C C4223B34 */  lwc1       $f2, %lo(D_800E3B34)($at)
/* B3EA0 800B32A0 4600103E */  c.le.s     $f2, $f0
/* B3EA4 800B32A4 00000000 */  nop
/* B3EA8 800B32A8 45010005 */  bc1t       .L800B32C0
/* B3EAC 800B32AC A3A30030 */   sb        $v1, 0x30($sp)
/* B3EB0 800B32B0 4600008D */  trunc.w.s  $f2, $f0
/* B3EB4 800B32B4 44031000 */  mfc1       $v1, $f2
/* B3EB8 800B32B8 0802CCB6 */  j          .L800B32D8
/* B3EBC 800B32BC C7A20078 */   lwc1      $f2, 0x78($sp)
.L800B32C0:
/* B3EC0 800B32C0 46020001 */  sub.s      $f0, $f0, $f2
/* B3EC4 800B32C4 4600008D */  trunc.w.s  $f2, $f0
/* B3EC8 800B32C8 44031000 */  mfc1       $v1, $f2
/* B3ECC 800B32CC 3C028000 */  lui        $v0, 0x8000
/* B3ED0 800B32D0 00621825 */  or         $v1, $v1, $v0
/* B3ED4 800B32D4 C7A20078 */  lwc1       $f2, 0x78($sp)
.L800B32D8:
/* B3ED8 800B32D8 3C01800E */  lui        $at, %hi(D_800E3B38)
/* B3EDC 800B32DC C4203B38 */  lwc1       $f0, %lo(D_800E3B38)($at)
/* B3EE0 800B32E0 46001002 */  mul.s      $f0, $f2, $f0
/* B3EE4 800B32E4 3C01800E */  lui        $at, %hi(D_800E3B3C)
/* B3EE8 800B32E8 C4223B3C */  lwc1       $f2, %lo(D_800E3B3C)($at)
/* B3EEC 800B32EC 4600103E */  c.le.s     $f2, $f0
/* B3EF0 800B32F0 00000000 */  nop
/* B3EF4 800B32F4 45010005 */  bc1t       .L800B330C
/* B3EF8 800B32F8 A3A30031 */   sb        $v1, 0x31($sp)
/* B3EFC 800B32FC 4600008D */  trunc.w.s  $f2, $f0
/* B3F00 800B3300 44031000 */  mfc1       $v1, $f2
/* B3F04 800B3304 0802CCC9 */  j          .L800B3324
/* B3F08 800B3308 C7A2007C */   lwc1      $f2, 0x7c($sp)
.L800B330C:
/* B3F0C 800B330C 46020001 */  sub.s      $f0, $f0, $f2
/* B3F10 800B3310 4600008D */  trunc.w.s  $f2, $f0
/* B3F14 800B3314 44031000 */  mfc1       $v1, $f2
/* B3F18 800B3318 3C028000 */  lui        $v0, 0x8000
/* B3F1C 800B331C 00621825 */  or         $v1, $v1, $v0
/* B3F20 800B3320 C7A2007C */  lwc1       $f2, 0x7c($sp)
.L800B3324:
/* B3F24 800B3324 3C01800E */  lui        $at, %hi(D_800E3B40)
/* B3F28 800B3328 C4203B40 */  lwc1       $f0, %lo(D_800E3B40)($at)
/* B3F2C 800B332C 46001002 */  mul.s      $f0, $f2, $f0
/* B3F30 800B3330 3C01800E */  lui        $at, %hi(D_800E3B44)
/* B3F34 800B3334 C4223B44 */  lwc1       $f2, %lo(D_800E3B44)($at)
/* B3F38 800B3338 4600103E */  c.le.s     $f2, $f0
/* B3F3C 800B333C 00000000 */  nop
/* B3F40 800B3340 45010005 */  bc1t       .L800B3358
/* B3F44 800B3344 A3A30032 */   sb        $v1, 0x32($sp)
/* B3F48 800B3348 4600008D */  trunc.w.s  $f2, $f0
/* B3F4C 800B334C 44031000 */  mfc1       $v1, $f2
/* B3F50 800B3350 0802CCDC */  j          .L800B3370
/* B3F54 800B3354 C6620024 */   lwc1      $f2, 0x24($s3)
.L800B3358:
/* B3F58 800B3358 46020001 */  sub.s      $f0, $f0, $f2
/* B3F5C 800B335C 4600008D */  trunc.w.s  $f2, $f0
/* B3F60 800B3360 44031000 */  mfc1       $v1, $f2
/* B3F64 800B3364 3C028000 */  lui        $v0, 0x8000
/* B3F68 800B3368 00621825 */  or         $v1, $v1, $v0
/* B3F6C 800B336C C6620024 */  lwc1       $f2, 0x24($s3)
.L800B3370:
/* B3F70 800B3370 3C01800E */  lui        $at, %hi(D_800E3B48)
/* B3F74 800B3374 D4243B48 */  ldc1       $f4, %lo(D_800E3B48)($at)
/* B3F78 800B3378 460010A1 */  cvt.d.s    $f2, $f2
/* B3F7C 800B337C 46241082 */  mul.d      $f2, $f2, $f4
/* B3F80 800B3380 C6600028 */  lwc1       $f0, 0x28($s3)
/* B3F84 800B3384 46000021 */  cvt.d.s    $f0, $f0
/* B3F88 800B3388 46240002 */  mul.d      $f0, $f0, $f4
/* B3F8C 800B338C 00148980 */  sll        $s1, $s4, 6
/* B3F90 800B3390 26240060 */  addiu      $a0, $s1, 0x60
/* B3F94 800B3394 02642021 */  addu       $a0, $s3, $a0
/* B3F98 800B3398 462010A0 */  cvt.s.d    $f2, $f2
/* B3F9C 800B339C 46200020 */  cvt.s.d    $f0, $f0
/* B3FA0 800B33A0 44051000 */  mfc1       $a1, $f2
/* B3FA4 800B33A4 44060000 */  mfc1       $a2, $f0
/* B3FA8 800B33A8 00003821 */  addu       $a3, $zero, $zero
/* B3FAC 800B33AC 0C032E44 */  jal        guScale
/* B3FB0 800B33B0 A3A30033 */   sb        $v1, 0x33($sp)
/* B3FB4 800B33B4 C662000C */  lwc1       $f2, 0xc($s3)
/* B3FB8 800B33B8 3C01800E */  lui        $at, %hi(D_800E3B50)
/* B3FBC 800B33BC C4243B50 */  lwc1       $f4, %lo(D_800E3B50)($at)
/* B3FC0 800B33C0 46041082 */  mul.s      $f2, $f2, $f4
/* B3FC4 800B33C4 C6600010 */  lwc1       $f0, 0x10($s3)
/* B3FC8 800B33C8 46040002 */  mul.s      $f0, $f0, $f4
/* B3FCC 800B33CC 44051000 */  mfc1       $a1, $f2
/* B3FD0 800B33D0 C6620014 */  lwc1       $f2, 0x14($s3)
/* B3FD4 800B33D4 46041082 */  mul.s      $f2, $f2, $f4
/* B3FD8 800B33D8 263000E0 */  addiu      $s0, $s1, 0xe0
/* B3FDC 800B33DC 02708021 */  addu       $s0, $s3, $s0
/* B3FE0 800B33E0 44060000 */  mfc1       $a2, $f0
/* B3FE4 800B33E4 44071000 */  mfc1       $a3, $f2
/* B3FE8 800B33E8 0C034705 */  jal        guTranslate
/* B3FEC 800B33EC 02002021 */   addu      $a0, $s0, $zero
/* B3FF0 800B33F0 3C02DA38 */  lui        $v0, 0xda38
/* B3FF4 800B33F4 34420003 */  ori        $v0, $v0, 3
/* B3FF8 800B33F8 02A01821 */  addu       $v1, $s5, $zero
/* B3FFC 800B33FC AC620000 */  sw         $v0, ($v1)
/* B4000 800B3400 AC700004 */  sw         $s0, 4($v1)
/* B4004 800B3404 9662000A */  lhu        $v0, 0xa($s3)
/* B4008 800B3408 30420004 */  andi       $v0, $v0, 4
/* B400C 800B340C 10400007 */  beqz       $v0, .L800B342C
/* B4010 800B3410 26B50008 */   addiu     $s5, $s5, 8
/* B4014 800B3414 02A01021 */  addu       $v0, $s5, $zero
/* B4018 800B3418 26B50008 */  addiu      $s5, $s5, 8
/* B401C 800B341C 3C03DA38 */  lui        $v1, 0xda38
/* B4020 800B3420 34630001 */  ori        $v1, $v1, 1
/* B4024 800B3424 0802CD11 */  j          .L800B3444
/* B4028 800B3428 26640160 */   addiu     $a0, $s3, 0x160
.L800B342C:
/* B402C 800B342C 02A01021 */  addu       $v0, $s5, $zero
/* B4030 800B3430 26B50008 */  addiu      $s5, $s5, 8
/* B4034 800B3434 3C03DA38 */  lui        $v1, 0xda38
/* B4038 800B3438 34630001 */  ori        $v1, $v1, 1
/* B403C 800B343C 26240348 */  addiu      $a0, $s1, 0x348
/* B4040 800B3440 02E42021 */  addu       $a0, $s7, $a0
.L800B3444:
/* B4044 800B3444 AC430000 */  sw         $v1, ($v0)
/* B4048 800B3448 AC440004 */  sw         $a0, 4($v0)
/* B404C 800B344C 02A01021 */  addu       $v0, $s5, $zero
/* B4050 800B3450 26B50008 */  addiu      $s5, $s5, 8
/* B4054 800B3454 3C03DA38 */  lui        $v1, 0xda38
/* B4058 800B3458 34630001 */  ori        $v1, $v1, 1
/* B405C 800B345C 26240060 */  addiu      $a0, $s1, 0x60
/* B4060 800B3460 02642021 */  addu       $a0, $s3, $a0
/* B4064 800B3464 AC430000 */  sw         $v1, ($v0)
/* B4068 800B3468 13C00007 */  beqz       $fp, .L800B3488
/* B406C 800B346C AC440004 */   sw        $a0, 4($v0)
/* B4070 800B3470 8FC20010 */  lw         $v0, 0x10($fp)
/* B4074 800B3474 90430004 */  lbu        $v1, 4($v0)
/* B4078 800B3478 90440005 */  lbu        $a0, 5($v0)
/* B407C 800B347C 0003C940 */  sll        $t9, $v1, 5
/* B4080 800B3480 0802CD29 */  j          .L800B34A4
/* B4084 800B3484 0004C140 */   sll       $t8, $a0, 5
.L800B3488:
/* B4088 800B3488 3C04800E */  lui        $a0, %hi(D_800E3968)
/* B408C 800B348C 24843968 */  addiu      $a0, $a0, %lo(D_800E3968)
/* B4090 800B3490 3C05800E */  lui        $a1, %hi(D_800E3B00)
/* B4094 800B3494 0C025F2D */  jal        manualCrash
/* B4098 800B3498 24A53B00 */   addiu     $a1, $a1, %lo(D_800E3B00)
/* B409C 800B349C 0000C821 */  addu       $t9, $zero, $zero
/* B40A0 800B34A0 0000C021 */  addu       $t8, $zero, $zero
.L800B34A4:
/* B40A4 800B34A4 02A02021 */  addu       $a0, $s5, $zero
/* B40A8 800B34A8 26B50008 */  addiu      $s5, $s5, 8
/* B40AC 800B34AC 3C030100 */  lui        $v1, 0x100
/* B40B0 800B34B0 34634008 */  ori        $v1, $v1, 0x4008
/* B40B4 800B34B4 02A07021 */  addu       $t6, $s5, $zero
/* B40B8 800B34B8 26B50008 */  addiu      $s5, $s5, 8
/* B40BC 800B34BC 02A07821 */  addu       $t7, $s5, $zero
/* B40C0 800B34C0 26B50008 */  addiu      $s5, $s5, 8
/* B40C4 800B34C4 02A09021 */  addu       $s2, $s5, $zero
/* B40C8 800B34C8 26B50008 */  addiu      $s5, $s5, 8
/* B40CC 800B34CC 3C080210 */  lui        $t0, 0x210
/* B40D0 800B34D0 35080002 */  ori        $t0, $t0, 2
/* B40D4 800B34D4 02A09821 */  addu       $s3, $s5, $zero
/* B40D8 800B34D8 26B50008 */  addiu      $s5, $s5, 8
/* B40DC 800B34DC 3C090214 */  lui        $t1, 0x214
/* B40E0 800B34E0 35290002 */  ori        $t1, $t1, 2
/* B40E4 800B34E4 02A0A021 */  addu       $s4, $s5, $zero
/* B40E8 800B34E8 26B50008 */  addiu      $s5, $s5, 8
/* B40EC 800B34EC 3C0A0210 */  lui        $t2, 0x210
/* B40F0 800B34F0 354A0004 */  ori        $t2, $t2, 4
/* B40F4 800B34F4 02A08021 */  addu       $s0, $s5, $zero
/* B40F8 800B34F8 26B50008 */  addiu      $s5, $s5, 8
/* B40FC 800B34FC 3C0B0214 */  lui        $t3, 0x214
/* B4100 800B3500 356B0004 */  ori        $t3, $t3, 4
/* B4104 800B3504 02A08821 */  addu       $s1, $s5, $zero
/* B4108 800B3508 26B50008 */  addiu      $s5, $s5, 8
/* B410C 800B350C 3C060210 */  lui        $a2, 0x210
/* B4110 800B3510 34C60006 */  ori        $a2, $a2, 6
/* B4114 800B3514 02A06821 */  addu       $t5, $s5, $zero
/* B4118 800B3518 26B50008 */  addiu      $s5, $s5, 8
/* B411C 800B351C 3C070214 */  lui        $a3, 0x214
/* B4120 800B3520 34E70006 */  ori        $a3, $a3, 6
/* B4124 800B3524 02A06021 */  addu       $t4, $s5, $zero
/* B4128 800B3528 26C256C0 */  addiu      $v0, $s6, 0x56c0
/* B412C 800B352C AC830000 */  sw         $v1, ($a0)
/* B4130 800B3530 3C030210 */  lui        $v1, 0x210
/* B4134 800B3534 3C050600 */  lui        $a1, 0x600
/* B4138 800B3538 AC820004 */  sw         $v0, 4($a0)
/* B413C 800B353C 3C020214 */  lui        $v0, 0x214
/* B4140 800B3540 ADC30000 */  sw         $v1, ($t6)
/* B4144 800B3544 8FA40030 */  lw         $a0, 0x30($sp)
/* B4148 800B3548 8FBF00D4 */  lw         $ra, 0xd4($sp)
/* B414C 800B354C 8FBE00D0 */  lw         $fp, 0xd0($sp)
/* B4150 800B3550 8FB700CC */  lw         $s7, 0xcc($sp)
/* B4154 800B3554 8FB600C8 */  lw         $s6, 0xc8($sp)
/* B4158 800B3558 D7B800E8 */  ldc1       $f24, 0xe8($sp)
/* B415C 800B355C D7B600E0 */  ldc1       $f22, 0xe0($sp)
/* B4160 800B3560 D7B400D8 */  ldc1       $f20, 0xd8($sp)
/* B4164 800B3564 34A50204 */  ori        $a1, $a1, 0x204
/* B4168 800B3568 ADC40004 */  sw         $a0, 4($t6)
/* B416C 800B356C ADE20000 */  sw         $v0, ($t7)
/* B4170 800B3570 ADF80004 */  sw         $t8, 4($t7)
/* B4174 800B3574 AE480000 */  sw         $t0, ($s2)
/* B4178 800B3578 8FA20030 */  lw         $v0, 0x30($sp)
/* B417C 800B357C 00192400 */  sll        $a0, $t9, 0x10
/* B4180 800B3580 AE420004 */  sw         $v0, 4($s2)
/* B4184 800B3584 00981025 */  or         $v0, $a0, $t8
/* B4188 800B3588 AE690000 */  sw         $t1, ($s3)
/* B418C 800B358C AE620004 */  sw         $v0, 4($s3)
/* B4190 800B3590 AE8A0000 */  sw         $t2, ($s4)
/* B4194 800B3594 8FA20030 */  lw         $v0, 0x30($sp)
/* B4198 800B3598 8FB300BC */  lw         $s3, 0xbc($sp)
/* B419C 800B359C 8FB200B8 */  lw         $s2, 0xb8($sp)
/* B41A0 800B35A0 3C030004 */  lui        $v1, 4
/* B41A4 800B35A4 AE820004 */  sw         $v0, 4($s4)
/* B41A8 800B35A8 AE0B0000 */  sw         $t3, ($s0)
/* B41AC 800B35AC AE000004 */  sw         $zero, 4($s0)
/* B41B0 800B35B0 AE260000 */  sw         $a2, ($s1)
/* B41B4 800B35B4 8FA20030 */  lw         $v0, 0x30($sp)
/* B41B8 800B35B8 8FB400C0 */  lw         $s4, 0xc0($sp)
/* B41BC 800B35BC 8FB000B0 */  lw         $s0, 0xb0($sp)
/* B41C0 800B35C0 34630206 */  ori        $v1, $v1, 0x206
/* B41C4 800B35C4 AE220004 */  sw         $v0, 4($s1)
/* B41C8 800B35C8 ADA70000 */  sw         $a3, ($t5)
/* B41CC 800B35CC ADA40004 */  sw         $a0, 4($t5)
/* B41D0 800B35D0 AD850000 */  sw         $a1, ($t4)
/* B41D4 800B35D4 AD830004 */  sw         $v1, 4($t4)
/* B41D8 800B35D8 8FA200F0 */  lw         $v0, 0xf0($sp)
/* B41DC 800B35DC 8FB100B4 */  lw         $s1, 0xb4($sp)
/* B41E0 800B35E0 26B50008 */  addiu      $s5, $s5, 8
/* B41E4 800B35E4 AC550000 */  sw         $s5, ($v0)
/* B41E8 800B35E8 8FB500C4 */  lw         $s5, 0xc4($sp)
/* B41EC 800B35EC 03E00008 */  jr         $ra
/* B41F0 800B35F0 27BD00F0 */   addiu     $sp, $sp, 0xf0

glabel GetLocatorScene
/* B41F4 800B35F4 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* B41F8 800B35F8 AFB20118 */  sw         $s2, 0x118($sp)
/* B41FC 800B35FC 00009021 */  addu       $s2, $zero, $zero
/* B4200 800B3600 AFB10114 */  sw         $s1, 0x114($sp)
/* B4204 800B3604 30B1FFFF */  andi       $s1, $a1, 0xffff
/* B4208 800B3608 24020001 */  addiu      $v0, $zero, 1
/* B420C 800B360C AFBF011C */  sw         $ra, 0x11c($sp)
/* B4210 800B3610 1222000C */  beq        $s1, $v0, .L800B3644
/* B4214 800B3614 AFB00110 */   sw        $s0, 0x110($sp)
/* B4218 800B3618 2A220002 */  slti       $v0, $s1, 2
/* B421C 800B361C 10400005 */  beqz       $v0, .L800B3634
/* B4220 800B3620 24020002 */   addiu     $v0, $zero, 2
/* B4224 800B3624 52200011 */  beql       $s1, $zero, .L800B366C
/* B4228 800B3628 00809021 */   addu      $s2, $a0, $zero
/* B422C 800B362C 0802CD93 */  j          .L800B364C
/* B4230 800B3630 27A40010 */   addiu     $a0, $sp, 0x10
.L800B3634:
/* B4234 800B3634 5222000D */  beql       $s1, $v0, .L800B366C
/* B4238 800B3638 8C9202A8 */   lw        $s2, 0x2a8($a0)
/* B423C 800B363C 0802CD93 */  j          .L800B364C
/* B4240 800B3640 27A40010 */   addiu     $a0, $sp, 0x10
.L800B3644:
/* B4244 800B3644 0802CD9B */  j          .L800B366C
/* B4248 800B3648 8C9202A4 */   lw        $s2, 0x2a4($a0)
.L800B364C:
/* B424C 800B364C 3C05800E */  lui        $a1, %hi(D_800E3B54)
/* B4250 800B3650 24A53B54 */  addiu      $a1, $a1, %lo(D_800E3B54)
/* B4254 800B3654 0C0333AC */  jal        sprintf
/* B4258 800B3658 02203021 */   addu      $a2, $s1, $zero
/* B425C 800B365C 3C04800E */  lui        $a0, %hi(D_800E3968)
/* B4260 800B3660 24843968 */  addiu      $a0, $a0, %lo(D_800E3968)
/* B4264 800B3664 0C025F2D */  jal        manualCrash
/* B4268 800B3668 27A50010 */   addiu     $a1, $sp, 0x10
.L800B366C:
/* B426C 800B366C 1640000C */  bnez       $s2, .L800B36A0
/* B4270 800B3670 02401021 */   addu      $v0, $s2, $zero
/* B4274 800B3674 27B00090 */  addiu      $s0, $sp, 0x90
/* B4278 800B3678 02002021 */  addu       $a0, $s0, $zero
/* B427C 800B367C 3C05800E */  lui        $a1, %hi(D_800E3B80)
/* B4280 800B3680 24A53B80 */  addiu      $a1, $a1, %lo(D_800E3B80)
/* B4284 800B3684 0C0333AC */  jal        sprintf
/* B4288 800B3688 02203021 */   addu      $a2, $s1, $zero
/* B428C 800B368C 3C04800E */  lui        $a0, %hi(D_800E3968)
/* B4290 800B3690 24843968 */  addiu      $a0, $a0, %lo(D_800E3968)
/* B4294 800B3694 0C025F2D */  jal        manualCrash
/* B4298 800B3698 02002821 */   addu      $a1, $s0, $zero
/* B429C 800B369C 02401021 */  addu       $v0, $s2, $zero
.L800B36A0:
/* B42A0 800B36A0 8FBF011C */  lw         $ra, 0x11c($sp)
/* B42A4 800B36A4 8FB20118 */  lw         $s2, 0x118($sp)
/* B42A8 800B36A8 8FB10114 */  lw         $s1, 0x114($sp)
/* B42AC 800B36AC 8FB00110 */  lw         $s0, 0x110($sp)
/* B42B0 800B36B0 03E00008 */  jr         $ra
/* B42B4 800B36B4 27BD0120 */   addiu     $sp, $sp, 0x120

glabel BorgParticleEmitterCallback
/* B42B8 800B36B8 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* B42BC 800B36BC AFB50024 */  sw         $s5, 0x24($sp)
/* B42C0 800B36C0 00A0A821 */  addu       $s5, $a1, $zero
/* B42C4 800B36C4 AFBF0028 */  sw         $ra, 0x28($sp)
/* B42C8 800B36C8 AFB40020 */  sw         $s4, 0x20($sp)
/* B42CC 800B36CC AFB3001C */  sw         $s3, 0x1c($sp)
/* B42D0 800B36D0 AFB20018 */  sw         $s2, 0x18($sp)
/* B42D4 800B36D4 AFB10014 */  sw         $s1, 0x14($sp)
/* B42D8 800B36D8 AFB00010 */  sw         $s0, 0x10($sp)
/* B42DC 800B36DC F7B60038 */  sdc1       $f22, 0x38($sp)
/* B42E0 800B36E0 F7B40030 */  sdc1       $f20, 0x30($sp)
/* B42E4 800B36E4 8EB401CC */  lw         $s4, 0x1cc($s5)
/* B42E8 800B36E8 16800006 */  bnez       $s4, .L800B3704
/* B42EC 800B36EC 8EB001C4 */   lw        $s0, 0x1c4($s5)
/* B42F0 800B36F0 3C04800E */  lui        $a0, %hi(D_800E3BB0)
/* B42F4 800B36F4 24843BB0 */  addiu      $a0, $a0, %lo(D_800E3BB0)
/* B42F8 800B36F8 3C05800E */  lui        $a1, %hi(D_800E3BCC)
/* B42FC 800B36FC 0C025F2D */  jal        manualCrash
/* B4300 800B3700 24A53BCC */   addiu     $a1, $a1, %lo(D_800E3BCC)
.L800B3704:
/* B4304 800B3704 96050000 */  lhu        $a1, ($s0)
/* B4308 800B3708 02802021 */  addu       $a0, $s4, $zero
/* B430C 800B370C 30A50180 */  andi       $a1, $a1, 0x180
/* B4310 800B3710 0C02CD7D */  jal        GetLocatorScene
/* B4314 800B3714 000529C2 */   srl       $a1, $a1, 7
/* B4318 800B3718 00409821 */  addu       $s3, $v0, $zero
/* B431C 800B371C 02602021 */  addu       $a0, $s3, $zero
/* B4320 800B3720 2612001C */  addiu      $s2, $s0, 0x1c
/* B4324 800B3724 96020000 */  lhu        $v0, ($s0)
/* B4328 800B3728 02402821 */  addu       $a1, $s2, $zero
/* B432C 800B372C 30510007 */  andi       $s1, $v0, 7
/* B4330 800B3730 0C02A22F */  jal        SCeneGetLocatorPos
/* B4334 800B3734 02203021 */   addu      $a2, $s1, $zero
/* B4338 800B3738 54400015 */  bnel       $v0, $zero, .L800B3790
/* B433C 800B373C 9602000E */   lhu       $v0, 0xe($s0)
/* B4340 800B3740 4480A000 */  mtc1       $zero, $f20
/* B4344 800B3744 4405A000 */  mfc1       $a1, $f20
/* B4348 800B3748 4406A000 */  mfc1       $a2, $f20
/* B434C 800B374C 4407A000 */  mfc1       $a3, $f20
/* B4350 800B3750 0C02AD58 */  jal        setVec3
/* B4354 800B3754 02402021 */   addu      $a0, $s2, $zero
/* B4358 800B3758 26040084 */  addiu      $a0, $s0, 0x84
/* B435C 800B375C 3C01800E */  lui        $at, %hi(D_800E3BEC)
/* B4360 800B3760 C4363BEC */  lwc1       $f22, %lo(D_800E3BEC)($at)
/* B4364 800B3764 4405A000 */  mfc1       $a1, $f20
/* B4368 800B3768 4406B000 */  mfc1       $a2, $f22
/* B436C 800B376C 0C02AD58 */  jal        setVec3
/* B4370 800B3770 00A03821 */   addu      $a3, $a1, $zero
/* B4374 800B3774 4405B000 */  mfc1       $a1, $f22
/* B4378 800B3778 2604002C */  addiu      $a0, $s0, 0x2c
/* B437C 800B377C 00A03021 */  addu       $a2, $a1, $zero
/* B4380 800B3780 0C02AD58 */  jal        setVec3
/* B4384 800B3784 00A03821 */   addu      $a3, $a1, $zero
/* B4388 800B3788 0802CDF7 */  j          .L800B37DC
/* B438C 800B378C A6A00002 */   sh        $zero, 2($s5)
.L800B3790:
/* B4390 800B3790 30420010 */  andi       $v0, $v0, 0x10
/* B4394 800B3794 10400004 */  beqz       $v0, .L800B37A8
/* B4398 800B3798 02602021 */   addu      $a0, $s3, $zero
/* B439C 800B379C 26050084 */  addiu      $a1, $s0, 0x84
/* B43A0 800B37A0 0C02A280 */  jal        SceneGetLocatorNorm
/* B43A4 800B37A4 02203021 */   addu      $a2, $s1, $zero
.L800B37A8:
/* B43A8 800B37A8 9602000E */  lhu        $v0, 0xe($s0)
/* B43AC 800B37AC 30422000 */  andi       $v0, $v0, 0x2000
/* B43B0 800B37B0 1040000A */  beqz       $v0, .L800B37DC
/* B43B4 800B37B4 02802021 */   addu      $a0, $s4, $zero
/* B43B8 800B37B8 96050002 */  lhu        $a1, 2($s0)
/* B43BC 800B37BC 30A50180 */  andi       $a1, $a1, 0x180
/* B43C0 800B37C0 0C02CD7D */  jal        GetLocatorScene
/* B43C4 800B37C4 000529C2 */   srl       $a1, $a1, 7
/* B43C8 800B37C8 00402021 */  addu       $a0, $v0, $zero
/* B43CC 800B37CC 96060002 */  lhu        $a2, 2($s0)
/* B43D0 800B37D0 2605002C */  addiu      $a1, $s0, 0x2c
/* B43D4 800B37D4 0C02A22F */  jal        SCeneGetLocatorPos
/* B43D8 800B37D8 30C60007 */   andi      $a2, $a2, 7
.L800B37DC:
/* B43DC 800B37DC 8FBF0028 */  lw         $ra, 0x28($sp)
/* B43E0 800B37E0 8FB50024 */  lw         $s5, 0x24($sp)
/* B43E4 800B37E4 8FB40020 */  lw         $s4, 0x20($sp)
/* B43E8 800B37E8 8FB3001C */  lw         $s3, 0x1c($sp)
/* B43EC 800B37EC 8FB20018 */  lw         $s2, 0x18($sp)
/* B43F0 800B37F0 8FB10014 */  lw         $s1, 0x14($sp)
/* B43F4 800B37F4 8FB00010 */  lw         $s0, 0x10($sp)
/* B43F8 800B37F8 D7B60038 */  ldc1       $f22, 0x38($sp)
/* B43FC 800B37FC D7B40030 */  ldc1       $f20, 0x30($sp)
/* B4400 800B3800 03E00008 */  jr         $ra
/* B4404 800B3804 27BD0040 */   addiu     $sp, $sp, 0x40

glabel particle_emmiter_rand
/* B4408 800B3808 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* B440C 800B380C AFB3009C */  sw         $s3, 0x9c($sp)
/* B4410 800B3810 00A09821 */  addu       $s3, $a1, $zero
/* B4414 800B3814 AFBF00A8 */  sw         $ra, 0xa8($sp)
/* B4418 800B3818 AFB500A4 */  sw         $s5, 0xa4($sp)
/* B441C 800B381C AFB400A0 */  sw         $s4, 0xa0($sp)
/* B4420 800B3820 AFB20098 */  sw         $s2, 0x98($sp)
/* B4424 800B3824 AFB10094 */  sw         $s1, 0x94($sp)
/* B4428 800B3828 AFB00090 */  sw         $s0, 0x90($sp)
/* B442C 800B382C F7B400B0 */  sdc1       $f20, 0xb0($sp)
/* B4430 800B3830 8E7101C4 */  lw         $s1, 0x1c4($s3)
/* B4434 800B3834 0C02C9DF */  jal        func_800B277C
/* B4438 800B3838 8626000A */   lh        $a2, 0xa($s1)
/* B443C 800B383C 9623000E */  lhu        $v1, 0xe($s1)
/* B4440 800B3840 30630008 */  andi       $v1, $v1, 8
/* B4444 800B3844 10600009 */  beqz       $v1, .L800B386C
/* B4448 800B3848 00409021 */   addu      $s2, $v0, $zero
/* B444C 800B384C 3C02800F */  lui        $v0, %hi(particle_rng_seed)
/* B4450 800B3850 24443630 */  addiu      $a0, $v0, %lo(particle_rng_seed)
/* B4454 800B3854 27A50010 */  addiu      $a1, $sp, 0x10
/* B4458 800B3858 8E260028 */  lw         $a2, 0x28($s1)
/* B445C 800B385C 0C02742B */  jal        rand_vec3
/* B4460 800B3860 0040A021 */   addu      $s4, $v0, $zero
/* B4464 800B3864 0802CE27 */  j          .L800B389C
/* B4468 800B3868 9622000E */   lhu       $v0, 0xe($s1)
.L800B386C:
/* B446C 800B386C 3C02800F */  lui        $v0, %hi(particle_rng_seed)
/* B4470 800B3870 24503630 */  addiu      $s0, $v0, %lo(particle_rng_seed)
/* B4474 800B3874 02002021 */  addu       $a0, $s0, $zero
/* B4478 800B3878 00002821 */  addu       $a1, $zero, $zero
/* B447C 800B387C 8E260028 */  lw         $a2, 0x28($s1)
/* B4480 800B3880 0C0273E4 */  jal        rand_float_range
/* B4484 800B3884 0040A021 */   addu      $s4, $v0, $zero
/* B4488 800B3888 02002021 */  addu       $a0, $s0, $zero
/* B448C 800B388C 44060000 */  mfc1       $a2, $f0
/* B4490 800B3890 0C02742B */  jal        rand_vec3
/* B4494 800B3894 27A50010 */   addiu     $a1, $sp, 0x10
/* B4498 800B3898 9622000E */  lhu        $v0, 0xe($s1)
.L800B389C:
/* B449C 800B389C 30420200 */  andi       $v0, $v0, 0x200
/* B44A0 800B38A0 10400007 */  beqz       $v0, .L800B38C0
/* B44A4 800B38A4 2650000C */   addiu     $s0, $s2, 0xc
/* B44A8 800B38A8 02002021 */  addu       $a0, $s0, $zero
/* B44AC 800B38AC 266501D4 */  addiu      $a1, $s3, 0x1d4
/* B44B0 800B38B0 0C02AB4D */  jal        vec3_sum
/* B44B4 800B38B4 27A60010 */   addiu     $a2, $sp, 0x10
/* B44B8 800B38B8 0802CE35 */  j          .L800B38D4
/* B44BC 800B38BC 0200A821 */   addu      $s5, $s0, $zero
.L800B38C0:
/* B44C0 800B38C0 02002021 */  addu       $a0, $s0, $zero
/* B44C4 800B38C4 2625001C */  addiu      $a1, $s1, 0x1c
/* B44C8 800B38C8 0C02AB4D */  jal        vec3_sum
/* B44CC 800B38CC 27A60010 */   addiu     $a2, $sp, 0x10
/* B44D0 800B38D0 0200A821 */  addu       $s5, $s0, $zero
.L800B38D4:
/* B44D4 800B38D4 26933630 */  addiu      $s3, $s4, 0x3630
/* B44D8 800B38D8 02602021 */  addu       $a0, $s3, $zero
/* B44DC 800B38DC 26500018 */  addiu      $s0, $s2, 0x18
/* B44E0 800B38E0 8E26003C */  lw         $a2, 0x3c($s1)
/* B44E4 800B38E4 0C02742B */  jal        rand_vec3
/* B44E8 800B38E8 02002821 */   addu      $a1, $s0, $zero
/* B44EC 800B38EC C6200084 */  lwc1       $f0, 0x84($s1)
/* B44F0 800B38F0 C6220090 */  lwc1       $f2, 0x90($s1)
/* B44F4 800B38F4 46020002 */  mul.s      $f0, $f0, $f2
/* B44F8 800B38F8 E7A00010 */  swc1       $f0, 0x10($sp)
/* B44FC 800B38FC C6220088 */  lwc1       $f2, 0x88($s1)
/* B4500 800B3900 C6200090 */  lwc1       $f0, 0x90($s1)
/* B4504 800B3904 46001082 */  mul.s      $f2, $f2, $f0
/* B4508 800B3908 E7A20014 */  swc1       $f2, 0x14($sp)
/* B450C 800B390C C624008C */  lwc1       $f4, 0x8c($s1)
/* B4510 800B3910 C6200090 */  lwc1       $f0, 0x90($s1)
/* B4514 800B3914 46002102 */  mul.s      $f4, $f4, $f0
/* B4518 800B3918 02002021 */  addu       $a0, $s0, $zero
/* B451C 800B391C 02002821 */  addu       $a1, $s0, $zero
/* B4520 800B3920 27A60010 */  addiu      $a2, $sp, 0x10
/* B4524 800B3924 0C02AB4D */  jal        vec3_sum
/* B4528 800B3928 E7A40018 */   swc1      $f4, 0x18($sp)
/* B452C 800B392C 3C053BC4 */  lui        $a1, 0x3bc4
/* B4530 800B3930 34A59BA6 */  ori        $a1, $a1, 0x9ba6
/* B4534 800B3934 0C02AD3C */  jal        multiVec3
/* B4538 800B3938 02002021 */   addu      $a0, $s0, $zero
/* B453C 800B393C 8E250094 */  lw         $a1, 0x94($s1)
/* B4540 800B3940 8E260098 */  lw         $a2, 0x98($s1)
/* B4544 800B3944 0C0273E4 */  jal        rand_float_range
/* B4548 800B3948 02602021 */   addu      $a0, $s3, $zero
/* B454C 800B394C 44050000 */  mfc1       $a1, $f0
/* B4550 800B3950 02402021 */  addu       $a0, $s2, $zero
/* B4554 800B3954 0C02CB21 */  jal        func_800B2C84
/* B4558 800B3958 00A03021 */   addu      $a2, $a1, $zero
/* B455C 800B395C 922200A0 */  lbu        $v0, 0xa0($s1)
/* B4560 800B3960 3C01800E */  lui        $at, %hi(D_800E3BF0)
/* B4564 800B3964 D4343BF0 */  ldc1       $f20, %lo(D_800E3BF0)($at)
/* B4568 800B3968 44821000 */  mtc1       $v0, $f2
/* B456C 800B396C 468010A0 */  cvt.s.w    $f2, $f2
/* B4570 800B3970 460010A1 */  cvt.d.s    $f2, $f2
/* B4574 800B3974 46341083 */  div.d      $f2, $f2, $f20
/* B4578 800B3978 462010A0 */  cvt.s.d    $f2, $f2
/* B457C 800B397C 922200A4 */  lbu        $v0, 0xa4($s1)
/* B4580 800B3980 44051000 */  mfc1       $a1, $f2
/* B4584 800B3984 44820000 */  mtc1       $v0, $f0
/* B4588 800B3988 46800020 */  cvt.s.w    $f0, $f0
/* B458C 800B398C 46000021 */  cvt.d.s    $f0, $f0
/* B4590 800B3990 46340003 */  div.d      $f0, $f0, $f20
/* B4594 800B3994 46200020 */  cvt.s.d    $f0, $f0
/* B4598 800B3998 44060000 */  mfc1       $a2, $f0
/* B459C 800B399C 0C0273E4 */  jal        rand_float_range
/* B45A0 800B39A0 02602021 */   addu      $a0, $s3, $zero
/* B45A4 800B39A4 E640002C */  swc1       $f0, 0x2c($s2)
/* B45A8 800B39A8 922200A1 */  lbu        $v0, 0xa1($s1)
/* B45AC 800B39AC 44821000 */  mtc1       $v0, $f2
/* B45B0 800B39B0 468010A0 */  cvt.s.w    $f2, $f2
/* B45B4 800B39B4 460010A1 */  cvt.d.s    $f2, $f2
/* B45B8 800B39B8 46341083 */  div.d      $f2, $f2, $f20
/* B45BC 800B39BC 462010A0 */  cvt.s.d    $f2, $f2
/* B45C0 800B39C0 922200A5 */  lbu        $v0, 0xa5($s1)
/* B45C4 800B39C4 44051000 */  mfc1       $a1, $f2
/* B45C8 800B39C8 44820000 */  mtc1       $v0, $f0
/* B45CC 800B39CC 46800020 */  cvt.s.w    $f0, $f0
/* B45D0 800B39D0 46000021 */  cvt.d.s    $f0, $f0
/* B45D4 800B39D4 46340003 */  div.d      $f0, $f0, $f20
/* B45D8 800B39D8 46200020 */  cvt.s.d    $f0, $f0
/* B45DC 800B39DC 44060000 */  mfc1       $a2, $f0
/* B45E0 800B39E0 0C0273E4 */  jal        rand_float_range
/* B45E4 800B39E4 02602021 */   addu      $a0, $s3, $zero
/* B45E8 800B39E8 E6400030 */  swc1       $f0, 0x30($s2)
/* B45EC 800B39EC 922200A2 */  lbu        $v0, 0xa2($s1)
/* B45F0 800B39F0 44821000 */  mtc1       $v0, $f2
/* B45F4 800B39F4 468010A0 */  cvt.s.w    $f2, $f2
/* B45F8 800B39F8 460010A1 */  cvt.d.s    $f2, $f2
/* B45FC 800B39FC 46341083 */  div.d      $f2, $f2, $f20
/* B4600 800B3A00 462010A0 */  cvt.s.d    $f2, $f2
/* B4604 800B3A04 922200A6 */  lbu        $v0, 0xa6($s1)
/* B4608 800B3A08 44051000 */  mfc1       $a1, $f2
/* B460C 800B3A0C 44820000 */  mtc1       $v0, $f0
/* B4610 800B3A10 46800020 */  cvt.s.w    $f0, $f0
/* B4614 800B3A14 46000021 */  cvt.d.s    $f0, $f0
/* B4618 800B3A18 46340003 */  div.d      $f0, $f0, $f20
/* B461C 800B3A1C 46200020 */  cvt.s.d    $f0, $f0
/* B4620 800B3A20 44060000 */  mfc1       $a2, $f0
/* B4624 800B3A24 0C0273E4 */  jal        rand_float_range
/* B4628 800B3A28 02602021 */   addu      $a0, $s3, $zero
/* B462C 800B3A2C E6400034 */  swc1       $f0, 0x34($s2)
/* B4630 800B3A30 922200A3 */  lbu        $v0, 0xa3($s1)
/* B4634 800B3A34 44821000 */  mtc1       $v0, $f2
/* B4638 800B3A38 468010A0 */  cvt.s.w    $f2, $f2
/* B463C 800B3A3C 460010A1 */  cvt.d.s    $f2, $f2
/* B4640 800B3A40 46341083 */  div.d      $f2, $f2, $f20
/* B4644 800B3A44 462010A0 */  cvt.s.d    $f2, $f2
/* B4648 800B3A48 922200A7 */  lbu        $v0, 0xa7($s1)
/* B464C 800B3A4C 44051000 */  mfc1       $a1, $f2
/* B4650 800B3A50 44820000 */  mtc1       $v0, $f0
/* B4654 800B3A54 46800020 */  cvt.s.w    $f0, $f0
/* B4658 800B3A58 46000021 */  cvt.d.s    $f0, $f0
/* B465C 800B3A5C 46340003 */  div.d      $f0, $f0, $f20
/* B4660 800B3A60 46200020 */  cvt.s.d    $f0, $f0
/* B4664 800B3A64 44060000 */  mfc1       $a2, $f0
/* B4668 800B3A68 0C0273E4 */  jal        rand_float_range
/* B466C 800B3A6C 02602021 */   addu      $a0, $s3, $zero
/* B4670 800B3A70 E6400038 */  swc1       $f0, 0x38($s2)
/* B4674 800B3A74 9623000E */  lhu        $v1, 0xe($s1)
/* B4678 800B3A78 30622000 */  andi       $v0, $v1, 0x2000
/* B467C 800B3A7C 10400026 */  beqz       $v0, .L800B3B18
/* B4680 800B3A80 30620004 */   andi      $v0, $v1, 4
/* B4684 800B3A84 10400006 */  beqz       $v0, .L800B3AA0
/* B4688 800B3A88 02602021 */   addu      $a0, $s3, $zero
/* B468C 800B3A8C 8E260038 */  lw         $a2, 0x38($s1)
/* B4690 800B3A90 0C02742B */  jal        rand_vec3
/* B4694 800B3A94 27A50010 */   addiu     $a1, $sp, 0x10
/* B4698 800B3A98 0802CEB0 */  j          .L800B3AC0
/* B469C 800B3A9C 27A40010 */   addiu     $a0, $sp, 0x10
.L800B3AA0:
/* B46A0 800B3AA0 8E260038 */  lw         $a2, 0x38($s1)
/* B46A4 800B3AA4 0C0273E4 */  jal        rand_float_range
/* B46A8 800B3AA8 00002821 */   addu      $a1, $zero, $zero
/* B46AC 800B3AAC 02602021 */  addu       $a0, $s3, $zero
/* B46B0 800B3AB0 44060000 */  mfc1       $a2, $f0
/* B46B4 800B3AB4 0C02742B */  jal        rand_vec3
/* B46B8 800B3AB8 27A50010 */   addiu     $a1, $sp, 0x10
/* B46BC 800B3ABC 27A40010 */  addiu      $a0, $sp, 0x10
.L800B3AC0:
/* B46C0 800B3AC0 00802821 */  addu       $a1, $a0, $zero
/* B46C4 800B3AC4 0C02AB4D */  jal        vec3_sum
/* B46C8 800B3AC8 2626002C */   addiu     $a2, $s1, 0x2c
/* B46CC 800B3ACC 27A40010 */  addiu      $a0, $sp, 0x10
/* B46D0 800B3AD0 00802821 */  addu       $a1, $a0, $zero
/* B46D4 800B3AD4 0C02AB26 */  jal        Vec3A_BsubC
/* B46D8 800B3AD8 02A03021 */   addu      $a2, $s5, $zero
/* B46DC 800B3ADC 86420002 */  lh         $v0, 2($s2)
/* B46E0 800B3AE0 3C01800E */  lui        $at, %hi(D_800E3BF8)
/* B46E4 800B3AE4 D4223BF8 */  ldc1       $f2, %lo(D_800E3BF8)($at)
/* B46E8 800B3AE8 44820000 */  mtc1       $v0, $f0
/* B46EC 800B3AEC 46800020 */  cvt.s.w    $f0, $f0
/* B46F0 800B3AF0 46000021 */  cvt.d.s    $f0, $f0
/* B46F4 800B3AF4 46201083 */  div.d      $f2, $f2, $f0
/* B46F8 800B3AF8 462010A0 */  cvt.s.d    $f2, $f2
/* B46FC 800B3AFC 44051000 */  mfc1       $a1, $f2
/* B4700 800B3B00 0C02AD3C */  jal        multiVec3
/* B4704 800B3B04 27A40010 */   addiu     $a0, $sp, 0x10
/* B4708 800B3B08 02002021 */  addu       $a0, $s0, $zero
/* B470C 800B3B0C 00802821 */  addu       $a1, $a0, $zero
/* B4710 800B3B10 0C02AB4D */  jal        vec3_sum
/* B4714 800B3B14 27A60010 */   addiu     $a2, $sp, 0x10
.L800B3B18:
/* B4718 800B3B18 9622000E */  lhu        $v0, 0xe($s1)
/* B471C 800B3B1C 30424000 */  andi       $v0, $v0, 0x4000
/* B4720 800B3B20 10400033 */  beqz       $v0, .L800B3BF0
/* B4724 800B3B24 2650003C */   addiu     $s0, $s2, 0x3c
/* B4728 800B3B28 922200A8 */  lbu        $v0, 0xa8($s1)
/* B472C 800B3B2C 3C01800E */  lui        $at, %hi(D_800E3C00)
/* B4730 800B3B30 D4223C00 */  ldc1       $f2, %lo(D_800E3C00)($at)
/* B4734 800B3B34 44820000 */  mtc1       $v0, $f0
/* B4738 800B3B38 46800020 */  cvt.s.w    $f0, $f0
/* B473C 800B3B3C 46000021 */  cvt.d.s    $f0, $f0
/* B4740 800B3B40 46220003 */  div.d      $f0, $f0, $f2
/* B4744 800B3B44 46200020 */  cvt.s.d    $f0, $f0
/* B4748 800B3B48 E7A00050 */  swc1       $f0, 0x50($sp)
/* B474C 800B3B4C 922200A9 */  lbu        $v0, 0xa9($s1)
/* B4750 800B3B50 02002021 */  addu       $a0, $s0, $zero
/* B4754 800B3B54 44820000 */  mtc1       $v0, $f0
/* B4758 800B3B58 46800020 */  cvt.s.w    $f0, $f0
/* B475C 800B3B5C 46000021 */  cvt.d.s    $f0, $f0
/* B4760 800B3B60 46220003 */  div.d      $f0, $f0, $f2
/* B4764 800B3B64 46200020 */  cvt.s.d    $f0, $f0
/* B4768 800B3B68 E7A00054 */  swc1       $f0, 0x54($sp)
/* B476C 800B3B6C 922200AA */  lbu        $v0, 0xaa($s1)
/* B4770 800B3B70 27A50050 */  addiu      $a1, $sp, 0x50
/* B4774 800B3B74 44820000 */  mtc1       $v0, $f0
/* B4778 800B3B78 46800020 */  cvt.s.w    $f0, $f0
/* B477C 800B3B7C 46000021 */  cvt.d.s    $f0, $f0
/* B4780 800B3B80 46220003 */  div.d      $f0, $f0, $f2
/* B4784 800B3B84 46200020 */  cvt.s.d    $f0, $f0
/* B4788 800B3B88 E7A00058 */  swc1       $f0, 0x58($sp)
/* B478C 800B3B8C 922200AB */  lbu        $v0, 0xab($s1)
/* B4790 800B3B90 2646002C */  addiu      $a2, $s2, 0x2c
/* B4794 800B3B94 44820000 */  mtc1       $v0, $f0
/* B4798 800B3B98 46800020 */  cvt.s.w    $f0, $f0
/* B479C 800B3B9C 46000021 */  cvt.d.s    $f0, $f0
/* B47A0 800B3BA0 46220003 */  div.d      $f0, $f0, $f2
/* B47A4 800B3BA4 46200020 */  cvt.s.d    $f0, $f0
/* B47A8 800B3BA8 0C02AB33 */  jal        sybVec4
/* B47AC 800B3BAC E7A0005C */   swc1      $f0, 0x5c($sp)
/* B47B0 800B3BB0 86420002 */  lh         $v0, 2($s2)
/* B47B4 800B3BB4 3C01800E */  lui        $at, %hi(D_800E3C08)
/* B47B8 800B3BB8 D4223C08 */  ldc1       $f2, %lo(D_800E3C08)($at)
/* B47BC 800B3BBC 44820000 */  mtc1       $v0, $f0
/* B47C0 800B3BC0 46800020 */  cvt.s.w    $f0, $f0
/* B47C4 800B3BC4 46000021 */  cvt.d.s    $f0, $f0
/* B47C8 800B3BC8 46201083 */  div.d      $f2, $f2, $f0
/* B47CC 800B3BCC 462010A0 */  cvt.s.d    $f2, $f2
/* B47D0 800B3BD0 44051000 */  mfc1       $a1, $f2
/* B47D4 800B3BD4 0C02AD47 */  jal        multiVec4
/* B47D8 800B3BD8 02002021 */   addu      $a0, $s0, $zero
/* B47DC 800B3BDC 02402021 */  addu       $a0, $s2, $zero
/* B47E0 800B3BE0 96420000 */  lhu        $v0, ($s2)
/* B47E4 800B3BE4 24050200 */  addiu      $a1, $zero, 0x200
/* B47E8 800B3BE8 0C02CB2A */  jal        particle_set_flags
/* B47EC 800B3BEC A6420004 */   sh        $v0, 4($s2)
.L800B3BF0:
/* B47F0 800B3BF0 8FBF00A8 */  lw         $ra, 0xa8($sp)
/* B47F4 800B3BF4 8FB500A4 */  lw         $s5, 0xa4($sp)
/* B47F8 800B3BF8 8FB400A0 */  lw         $s4, 0xa0($sp)
/* B47FC 800B3BFC 8FB3009C */  lw         $s3, 0x9c($sp)
/* B4800 800B3C00 8FB20098 */  lw         $s2, 0x98($sp)
/* B4804 800B3C04 8FB10094 */  lw         $s1, 0x94($sp)
/* B4808 800B3C08 8FB00090 */  lw         $s0, 0x90($sp)
/* B480C 800B3C0C D7B400B0 */  ldc1       $f20, 0xb0($sp)
/* B4810 800B3C10 03E00008 */  jr         $ra
/* B4814 800B3C14 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel func_800B3C18
/* B4818 800B3C18 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* B481C 800B3C1C AFB40038 */  sw         $s4, 0x38($sp)
/* B4820 800B3C20 0080A021 */  addu       $s4, $a0, $zero
/* B4824 800B3C24 AFB20030 */  sw         $s2, 0x30($sp)
/* B4828 800B3C28 00C09021 */  addu       $s2, $a2, $zero
/* B482C 800B3C2C AFBF003C */  sw         $ra, 0x3c($sp)
/* B4830 800B3C30 AFB30034 */  sw         $s3, 0x34($sp)
/* B4834 800B3C34 AFB1002C */  sw         $s1, 0x2c($sp)
/* B4838 800B3C38 AFB00028 */  sw         $s0, 0x28($sp)
/* B483C 800B3C3C F7B40040 */  sdc1       $f20, 0x40($sp)
/* B4840 800B3C40 86430008 */  lh         $v1, 8($s2)
/* B4844 800B3C44 00A08021 */  addu       $s0, $a1, $zero
/* B4848 800B3C48 186000CB */  blez       $v1, .L800B3F78
/* B484C 800B3C4C 00001021 */   addu      $v0, $zero, $zero
/* B4850 800B3C50 8642000A */  lh         $v0, 0xa($s2)
/* B4854 800B3C54 1840008D */  blez       $v0, .L800B3E8C
/* B4858 800B3C58 02802021 */   addu      $a0, $s4, $zero
/* B485C 800B3C5C 3C02800B */  lui        $v0, %hi(BorgParticleEmitterCallback)
/* B4860 800B3C60 244236B8 */  addiu      $v0, $v0, %lo(BorgParticleEmitterCallback)
/* B4864 800B3C64 AFA20010 */  sw         $v0, 0x10($sp)
/* B4868 800B3C68 AFA00014 */  sw         $zero, 0x14($sp)
/* B486C 800B3C6C AFA00018 */  sw         $zero, 0x18($sp)
/* B4870 800B3C70 AFB2001C */  sw         $s2, 0x1c($sp)
/* B4874 800B3C74 AFA00020 */  sw         $zero, 0x20($sp)
/* B4878 800B3C78 86460018 */  lh         $a2, 0x18($s2)
/* B487C 800B3C7C 86470014 */  lh         $a3, 0x14($s2)
/* B4880 800B3C80 0C02CA38 */  jal        AllocParticleEmitter
/* B4884 800B3C84 00602821 */   addu      $a1, $v1, $zero
/* B4888 800B3C88 00409821 */  addu       $s3, $v0, $zero
/* B488C 800B3C8C 126000BA */  beqz       $s3, .L800B3F78
/* B4890 800B3C90 00001021 */   addu      $v0, $zero, $zero
/* B4894 800B3C94 AE7001CC */  sw         $s0, 0x1cc($s3)
/* B4898 800B3C98 86420014 */  lh         $v0, 0x14($s2)
/* B489C 800B3C9C 10400003 */  beqz       $v0, .L800B3CAC
/* B48A0 800B3CA0 3C02800B */   lui       $v0, %hi(particle_emmiter_rand)
/* B48A4 800B3CA4 24423808 */  addiu      $v0, $v0, %lo(particle_emmiter_rand)
/* B48A8 800B3CA8 AE6201BC */  sw         $v0, 0x1bc($s3)
.L800B3CAC:
/* B48AC 800B3CAC 9643000C */  lhu        $v1, 0xc($s2)
/* B48B0 800B3CB0 A6630004 */  sh         $v1, 4($s3)
/* B48B4 800B3CB4 9642000E */  lhu        $v0, 0xe($s2)
/* B48B8 800B3CB8 30420001 */  andi       $v0, $v0, 1
/* B48BC 800B3CBC 50400005 */  beql       $v0, $zero, .L800B3CD4
/* B48C0 800B3CC0 8E700014 */   lw        $s0, 0x14($s3)
/* B48C4 800B3CC4 02602021 */  addu       $a0, $s3, $zero
/* B48C8 800B3CC8 0C02CB3E */  jal        func_800B2CF8
/* B48CC 800B3CCC 00002821 */   addu      $a1, $zero, $zero
/* B48D0 800B3CD0 8E700014 */  lw         $s0, 0x14($s3)
.L800B3CD4:
/* B48D4 800B3CD4 24050140 */  addiu      $a1, $zero, 0x140
/* B48D8 800B3CD8 0C02CB2A */  jal        particle_set_flags
/* B48DC 800B3CDC 02002021 */   addu      $a0, $s0, $zero
/* B48E0 800B3CE0 8E450044 */  lw         $a1, 0x44($s2)
/* B48E4 800B3CE4 8E460048 */  lw         $a2, 0x48($s2)
/* B48E8 800B3CE8 8E47004C */  lw         $a3, 0x4c($s2)
/* B48EC 800B3CEC C6400050 */  lwc1       $f0, 0x50($s2)
/* B48F0 800B3CF0 3C01800E */  lui        $at, %hi(D_800E3C10)
/* B48F4 800B3CF4 C4343C10 */  lwc1       $f20, %lo(D_800E3C10)($at)
/* B48F8 800B3CF8 02002021 */  addu       $a0, $s0, $zero
/* B48FC 800B3CFC 0C02CB24 */  jal        func_800B2C90
/* B4900 800B3D00 E7A00010 */   swc1      $f0, 0x10($sp)
/* B4904 800B3D04 4405A000 */  mfc1       $a1, $f20
/* B4908 800B3D08 0C02AD3C */  jal        multiVec3
/* B490C 800B3D0C 2604003C */   addiu     $a0, $s0, 0x3c
/* B4910 800B3D10 9642000E */  lhu        $v0, 0xe($s2)
/* B4914 800B3D14 30421000 */  andi       $v0, $v0, 0x1000
/* B4918 800B3D18 5040001B */  beql       $v0, $zero, .L800B3D88
/* B491C 800B3D1C 9642000E */   lhu       $v0, 0xe($s2)
/* B4920 800B3D20 02802021 */  addu       $a0, $s4, $zero
/* B4924 800B3D24 86460008 */  lh         $a2, 8($s2)
/* B4928 800B3D28 0C02C9DF */  jal        func_800B277C
/* B492C 800B3D2C 02602821 */   addu      $a1, $s3, $zero
/* B4930 800B3D30 00408021 */  addu       $s0, $v0, $zero
/* B4934 800B3D34 12000052 */  beqz       $s0, .L800B3E80
/* B4938 800B3D38 02002021 */   addu      $a0, $s0, $zero
/* B493C 800B3D3C 0C02CB2A */  jal        particle_set_flags
/* B4940 800B3D40 24050800 */   addiu     $a1, $zero, 0x800
/* B4944 800B3D44 02002021 */  addu       $a0, $s0, $zero
/* B4948 800B3D48 0C02CB2E */  jal        particle_NAND_flags
/* B494C 800B3D4C 24050010 */   addiu     $a1, $zero, 0x10
/* B4950 800B3D50 8E620014 */  lw         $v0, 0x14($s3)
/* B4954 800B3D54 94430000 */  lhu        $v1, ($v0)
/* B4958 800B3D58 A6030004 */  sh         $v1, 4($s0)
/* B495C 800B3D5C 8E450054 */  lw         $a1, 0x54($s2)
/* B4960 800B3D60 8E460058 */  lw         $a2, 0x58($s2)
/* B4964 800B3D64 8E47005C */  lw         $a3, 0x5c($s2)
/* B4968 800B3D68 C6400060 */  lwc1       $f0, 0x60($s2)
/* B496C 800B3D6C 02002021 */  addu       $a0, $s0, $zero
/* B4970 800B3D70 0C02CB24 */  jal        func_800B2C90
/* B4974 800B3D74 E7A00010 */   swc1      $f0, 0x10($sp)
/* B4978 800B3D78 4405A000 */  mfc1       $a1, $f20
/* B497C 800B3D7C 0C02AD3C */  jal        multiVec3
/* B4980 800B3D80 2604003C */   addiu     $a0, $s0, 0x3c
/* B4984 800B3D84 9642000E */  lhu        $v0, 0xe($s2)
.L800B3D88:
/* B4988 800B3D88 30420800 */  andi       $v0, $v0, 0x800
/* B498C 800B3D8C 50400033 */  beql       $v0, $zero, .L800B3E5C
/* B4990 800B3D90 9642000E */   lhu       $v0, 0xe($s2)
/* B4994 800B3D94 02802021 */  addu       $a0, $s4, $zero
/* B4998 800B3D98 86460008 */  lh         $a2, 8($s2)
/* B499C 800B3D9C 0C02C9F3 */  jal        func_800B27CC
/* B49A0 800B3DA0 02602821 */   addu      $a1, $s3, $zero
/* B49A4 800B3DA4 00408021 */  addu       $s0, $v0, $zero
/* B49A8 800B3DA8 12000035 */  beqz       $s0, .L800B3E80
/* B49AC 800B3DAC 02002021 */   addu      $a0, $s0, $zero
/* B49B0 800B3DB0 24050140 */  addiu      $a1, $zero, 0x140
/* B49B4 800B3DB4 0C02CB2A */  jal        particle_set_flags
/* B49B8 800B3DB8 96110000 */   lhu       $s1, ($s0)
/* B49BC 800B3DBC 8E450064 */  lw         $a1, 0x64($s2)
/* B49C0 800B3DC0 8E460068 */  lw         $a2, 0x68($s2)
/* B49C4 800B3DC4 8E47006C */  lw         $a3, 0x6c($s2)
/* B49C8 800B3DC8 C6400070 */  lwc1       $f0, 0x70($s2)
/* B49CC 800B3DCC 3C01800E */  lui        $at, %hi(D_800E3C14)
/* B49D0 800B3DD0 C4343C14 */  lwc1       $f20, %lo(D_800E3C14)($at)
/* B49D4 800B3DD4 02002021 */  addu       $a0, $s0, $zero
/* B49D8 800B3DD8 0C02CB24 */  jal        func_800B2C90
/* B49DC 800B3DDC E7A00010 */   swc1      $f0, 0x10($sp)
/* B49E0 800B3DE0 4405A000 */  mfc1       $a1, $f20
/* B49E4 800B3DE4 0C02AD3C */  jal        multiVec3
/* B49E8 800B3DE8 2604003C */   addiu     $a0, $s0, 0x3c
/* B49EC 800B3DEC 9642000E */  lhu        $v0, 0xe($s2)
/* B49F0 800B3DF0 30420400 */  andi       $v0, $v0, 0x400
/* B49F4 800B3DF4 50400019 */  beql       $v0, $zero, .L800B3E5C
/* B49F8 800B3DF8 9642000E */   lhu       $v0, 0xe($s2)
/* B49FC 800B3DFC 02802021 */  addu       $a0, $s4, $zero
/* B4A00 800B3E00 86460008 */  lh         $a2, 8($s2)
/* B4A04 800B3E04 0C02C9DF */  jal        func_800B277C
/* B4A08 800B3E08 02602821 */   addu      $a1, $s3, $zero
/* B4A0C 800B3E0C 00408021 */  addu       $s0, $v0, $zero
/* B4A10 800B3E10 1200001B */  beqz       $s0, .L800B3E80
/* B4A14 800B3E14 02002021 */   addu      $a0, $s0, $zero
/* B4A18 800B3E18 0C02CB2A */  jal        particle_set_flags
/* B4A1C 800B3E1C 24050800 */   addiu     $a1, $zero, 0x800
/* B4A20 800B3E20 02002021 */  addu       $a0, $s0, $zero
/* B4A24 800B3E24 0C02CB2E */  jal        particle_NAND_flags
/* B4A28 800B3E28 24050010 */   addiu     $a1, $zero, 0x10
/* B4A2C 800B3E2C A6110004 */  sh         $s1, 4($s0)
/* B4A30 800B3E30 8E450074 */  lw         $a1, 0x74($s2)
/* B4A34 800B3E34 8E460078 */  lw         $a2, 0x78($s2)
/* B4A38 800B3E38 8E47007C */  lw         $a3, 0x7c($s2)
/* B4A3C 800B3E3C C6400080 */  lwc1       $f0, 0x80($s2)
/* B4A40 800B3E40 02002021 */  addu       $a0, $s0, $zero
/* B4A44 800B3E44 0C02CB24 */  jal        func_800B2C90
/* B4A48 800B3E48 E7A00010 */   swc1      $f0, 0x10($sp)
/* B4A4C 800B3E4C 4405A000 */  mfc1       $a1, $f20
/* B4A50 800B3E50 0C02AD3C */  jal        multiVec3
/* B4A54 800B3E54 2604003C */   addiu     $a0, $s0, 0x3c
/* B4A58 800B3E58 9642000E */  lhu        $v0, 0xe($s2)
.L800B3E5C:
/* B4A5C 800B3E5C 30428000 */  andi       $v0, $v0, 0x8000
/* B4A60 800B3E60 1040001B */  beqz       $v0, .L800B3ED0
/* B4A64 800B3E64 02802021 */   addu      $a0, $s4, $zero
/* B4A68 800B3E68 86460008 */  lh         $a2, 8($s2)
/* B4A6C 800B3E6C 0C02C9F3 */  jal        func_800B27CC
/* B4A70 800B3E70 02602821 */   addu      $a1, $s3, $zero
/* B4A74 800B3E74 00408021 */  addu       $s0, $v0, $zero
/* B4A78 800B3E78 16000006 */  bnez       $s0, .L800B3E94
/* B4A7C 800B3E7C 02002021 */   addu      $a0, $s0, $zero
.L800B3E80:
/* B4A80 800B3E80 02802021 */  addu       $a0, $s4, $zero
/* B4A84 800B3E84 0C02CA8E */  jal        FreeParticleEmitter
/* B4A88 800B3E88 02602821 */   addu      $a1, $s3, $zero
.L800B3E8C:
/* B4A8C 800B3E8C 0802CFDE */  j          .L800B3F78
/* B4A90 800B3E90 00001021 */   addu      $v0, $zero, $zero
.L800B3E94:
/* B4A94 800B3E94 0C02CB2A */  jal        particle_set_flags
/* B4A98 800B3E98 24050400 */   addiu     $a1, $zero, 0x400
/* B4A9C 800B3E9C C640009C */  lwc1       $f0, 0x9c($s2)
/* B4AA0 800B3EA0 C6420094 */  lwc1       $f2, 0x94($s2)
/* B4AA4 800B3EA4 8642000A */  lh         $v0, 0xa($s2)
/* B4AA8 800B3EA8 46020001 */  sub.s      $f0, $f0, $f2
/* B4AAC 800B3EAC 44821000 */  mtc1       $v0, $f2
/* B4AB0 800B3EB0 468010A0 */  cvt.s.w    $f2, $f2
/* B4AB4 800B3EB4 46020003 */  div.s      $f0, $f0, $f2
/* B4AB8 800B3EB8 44050000 */  mfc1       $a1, $f0
/* B4ABC 800B3EBC 02002021 */  addu       $a0, $s0, $zero
/* B4AC0 800B3EC0 AFA00010 */  sw         $zero, 0x10($sp)
/* B4AC4 800B3EC4 00A03021 */  addu       $a2, $a1, $zero
/* B4AC8 800B3EC8 0C02CB24 */  jal        func_800B2C90
/* B4ACC 800B3ECC 00A03821 */   addu      $a3, $a1, $zero
.L800B3ED0:
/* B4AD0 800B3ED0 9642000E */  lhu        $v0, 0xe($s2)
/* B4AD4 800B3ED4 30420200 */  andi       $v0, $v0, 0x200
/* B4AD8 800B3ED8 10400017 */  beqz       $v0, .L800B3F38
/* B4ADC 800B3EDC 02602021 */   addu      $a0, $s3, $zero
/* B4AE0 800B3EE0 0C02CB34 */  jal        func_800B2CD0
/* B4AE4 800B3EE4 24052000 */   addiu     $a1, $zero, 0x2000
/* B4AE8 800B3EE8 2651001C */  addiu      $s1, $s2, 0x1c
/* B4AEC 800B3EEC 02202021 */  addu       $a0, $s1, $zero
/* B4AF0 800B3EF0 0C02AD17 */  jal        copyVec3
/* B4AF4 800B3EF4 266501D4 */   addiu     $a1, $s3, 0x1d4
/* B4AF8 800B3EF8 267001E0 */  addiu      $s0, $s3, 0x1e0
/* B4AFC 800B3EFC 02002021 */  addu       $a0, $s0, $zero
/* B4B00 800B3F00 02202821 */  addu       $a1, $s1, $zero
/* B4B04 800B3F04 0C02AB26 */  jal        Vec3A_BsubC
/* B4B08 800B3F08 2646002C */   addiu     $a2, $s2, 0x2c
/* B4B0C 800B3F0C 0C02ABBB */  jal        vec3_normalize
/* B4B10 800B3F10 02002021 */   addu      $a0, $s0, $zero
/* B4B14 800B3F14 C6420010 */  lwc1       $f2, 0x10($s2)
/* B4B18 800B3F18 3C01800E */  lui        $at, %hi(D_800E3C18)
/* B4B1C 800B3F1C D4203C18 */  ldc1       $f0, %lo(D_800E3C18)($at)
/* B4B20 800B3F20 460010A1 */  cvt.d.s    $f2, $f2
/* B4B24 800B3F24 46201082 */  mul.d      $f2, $f2, $f0
/* B4B28 800B3F28 462010A0 */  cvt.s.d    $f2, $f2
/* B4B2C 800B3F2C 44051000 */  mfc1       $a1, $f2
/* B4B30 800B3F30 0C02AD3C */  jal        multiVec3
/* B4B34 800B3F34 02002021 */   addu      $a0, $s0, $zero
.L800B3F38:
/* B4B38 800B3F38 02802021 */  addu       $a0, $s4, $zero
/* B4B3C 800B3F3C 0C02CDAE */  jal        BorgParticleEmitterCallback
/* B4B40 800B3F40 02602821 */   addu      $a1, $s3, $zero
/* B4B44 800B3F44 9642001A */  lhu        $v0, 0x1a($s2)
/* B4B48 800B3F48 1040000A */  beqz       $v0, .L800B3F74
/* B4B4C 800B3F4C 00008021 */   addu      $s0, $zero, $zero
/* B4B50 800B3F50 02802021 */  addu       $a0, $s4, $zero
.L800B3F54:
/* B4B54 800B3F54 0C02CE02 */  jal        particle_emmiter_rand
/* B4B58 800B3F58 02602821 */   addu      $a1, $s3, $zero
/* B4B5C 800B3F5C 26030001 */  addiu      $v1, $s0, 1
/* B4B60 800B3F60 9642001A */  lhu        $v0, 0x1a($s2)
/* B4B64 800B3F64 3070FFFF */  andi       $s0, $v1, 0xffff
/* B4B68 800B3F68 0202102B */  sltu       $v0, $s0, $v0
/* B4B6C 800B3F6C 1440FFF9 */  bnez       $v0, .L800B3F54
/* B4B70 800B3F70 02802021 */   addu      $a0, $s4, $zero
.L800B3F74:
/* B4B74 800B3F74 02601021 */  addu       $v0, $s3, $zero
.L800B3F78:
/* B4B78 800B3F78 8FBF003C */  lw         $ra, 0x3c($sp)
/* B4B7C 800B3F7C 8FB40038 */  lw         $s4, 0x38($sp)
/* B4B80 800B3F80 8FB30034 */  lw         $s3, 0x34($sp)
/* B4B84 800B3F84 8FB20030 */  lw         $s2, 0x30($sp)
/* B4B88 800B3F88 8FB1002C */  lw         $s1, 0x2c($sp)
/* B4B8C 800B3F8C 8FB00028 */  lw         $s0, 0x28($sp)
/* B4B90 800B3F90 D7B40040 */  ldc1       $f20, 0x40($sp)
/* B4B94 800B3F94 03E00008 */  jr         $ra
/* B4B98 800B3F98 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800B3F9C
/* B4B9C 800B3F9C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B4BA0 800B3FA0 AFB10014 */  sw         $s1, 0x14($sp)
/* B4BA4 800B3FA4 00808821 */  addu       $s1, $a0, $zero
/* B4BA8 800B3FA8 AFB20018 */  sw         $s2, 0x18($sp)
/* B4BAC 800B3FAC 00A09021 */  addu       $s2, $a1, $zero
/* B4BB0 800B3FB0 AFBF001C */  sw         $ra, 0x1c($sp)
/* B4BB4 800B3FB4 12200018 */  beqz       $s1, .L800B4018
/* B4BB8 800B3FB8 AFB00010 */   sw        $s0, 0x10($sp)
/* B4BBC 800B3FBC 12400017 */  beqz       $s2, .L800B401C
/* B4BC0 800B3FC0 8FBF001C */   lw        $ra, 0x1c($sp)
/* B4BC4 800B3FC4 8E220308 */  lw         $v0, 0x308($s1)
/* B4BC8 800B3FC8 10400014 */  beqz       $v0, .L800B401C
/* B4BCC 800B3FCC 00008021 */   addu      $s0, $zero, $zero
/* B4BD0 800B3FD0 00101140 */  sll        $v0, $s0, 5
.L800B3FD4:
/* B4BD4 800B3FD4 00501021 */  addu       $v0, $v0, $s0
/* B4BD8 800B3FD8 8E240308 */  lw         $a0, 0x308($s1)
/* B4BDC 800B3FDC 00021100 */  sll        $v0, $v0, 4
/* B4BE0 800B3FE0 00822821 */  addu       $a1, $a0, $v0
/* B4BE4 800B3FE4 94A3000C */  lhu        $v1, 0xc($a1)
/* B4BE8 800B3FE8 30638000 */  andi       $v1, $v1, 0x8000
/* B4BEC 800B3FEC 10600005 */  beqz       $v1, .L800B4004
/* B4BF0 800B3FF0 8CA201CC */   lw        $v0, 0x1cc($a1)
/* B4BF4 800B3FF4 16420004 */  bne        $s2, $v0, .L800B4008
/* B4BF8 800B3FF8 26020001 */   addiu     $v0, $s0, 1
/* B4BFC 800B3FFC 0C02CAE0 */  jal        func_800B2B80
/* B4C00 800B4000 02202021 */   addu      $a0, $s1, $zero
.L800B4004:
/* B4C04 800B4004 26020001 */  addiu      $v0, $s0, 1
.L800B4008:
/* B4C08 800B4008 3050FFFF */  andi       $s0, $v0, 0xffff
/* B4C0C 800B400C 2E030010 */  sltiu      $v1, $s0, 0x10
/* B4C10 800B4010 1460FFF0 */  bnez       $v1, .L800B3FD4
/* B4C14 800B4014 00101140 */   sll       $v0, $s0, 5
.L800B4018:
/* B4C18 800B4018 8FBF001C */  lw         $ra, 0x1c($sp)
.L800B401C:
/* B4C1C 800B401C 8FB20018 */  lw         $s2, 0x18($sp)
/* B4C20 800B4020 8FB10014 */  lw         $s1, 0x14($sp)
/* B4C24 800B4024 8FB00010 */  lw         $s0, 0x10($sp)
/* B4C28 800B4028 03E00008 */  jr         $ra
/* B4C2C 800B402C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B4030
/* B4C30 800B4030 10800006 */  beqz       $a0, .L800B404C
/* B4C34 800B4034 00000000 */   nop
/* B4C38 800B4038 10A00004 */  beqz       $a1, .L800B404C
/* B4C3C 800B403C 00000000 */   nop
/* B4C40 800B4040 8C820308 */  lw         $v0, 0x308($a0)
/* B4C44 800B4044 14400005 */  bnez       $v0, .L800B405C
/* B4C48 800B4048 00003021 */   addu      $a2, $zero, $zero
.L800B404C:
/* B4C4C 800B404C 03E00008 */  jr         $ra
/* B4C50 800B4050 00001021 */   addu      $v0, $zero, $zero
.L800B4054:
/* B4C54 800B4054 03E00008 */  jr         $ra
/* B4C58 800B4058 24020001 */   addiu     $v0, $zero, 1
.L800B405C:
/* B4C5C 800B405C 00402021 */  addu       $a0, $v0, $zero
/* B4C60 800B4060 00061140 */  sll        $v0, $a2, 5
.L800B4064:
/* B4C64 800B4064 00461021 */  addu       $v0, $v0, $a2
/* B4C68 800B4068 00021100 */  sll        $v0, $v0, 4
/* B4C6C 800B406C 00821021 */  addu       $v0, $a0, $v0
/* B4C70 800B4070 9443000C */  lhu        $v1, 0xc($v0)
/* B4C74 800B4074 30638000 */  andi       $v1, $v1, 0x8000
/* B4C78 800B4078 10600003 */  beqz       $v1, .L800B4088
/* B4C7C 800B407C 8C4201CC */   lw        $v0, 0x1cc($v0)
/* B4C80 800B4080 10A2FFF4 */  beq        $a1, $v0, .L800B4054
/* B4C84 800B4084 00000000 */   nop
.L800B4088:
/* B4C88 800B4088 24C20001 */  addiu      $v0, $a2, 1
/* B4C8C 800B408C 3046FFFF */  andi       $a2, $v0, 0xffff
/* B4C90 800B4090 2CC30010 */  sltiu      $v1, $a2, 0x10
/* B4C94 800B4094 1460FFF3 */  bnez       $v1, .L800B4064
/* B4C98 800B4098 00061140 */   sll       $v0, $a2, 5
/* B4C9C 800B409C 03E00008 */  jr         $ra
/* B4CA0 800B40A0 00001021 */   addu      $v0, $zero, $zero

glabel noop_800b40a4
/* B4CA4 800B40A4 03E00008 */  jr         $ra
/* B4CA8 800B40A8 00000000 */   nop

glabel passto_noop_800b40a4
/* B4CAC 800B40AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B4CB0 800B40B0 24040001 */  addiu      $a0, $zero, 1
/* B4CB4 800B40B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* B4CB8 800B40B8 0C02D029 */  jal        noop_800b40a4
/* B4CBC 800B40BC 3405FFFF */   ori       $a1, $zero, 0xffff
/* B4CC0 800B40C0 8FBF0010 */  lw         $ra, 0x10($sp)
/* B4CC4 800B40C4 03E00008 */  jr         $ra
/* B4CC8 800B40C8 27BD0018 */   addiu     $sp, $sp, 0x18
/* B4CCC 800B40CC 00000000 */  nop
