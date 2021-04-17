.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel SplashScreen_ShowVerion
/* 20290 8001F690 3C02800F */  lui        $v0, %hi(show_verion_flag)
/* 20294 8001F694 944398E4 */  lhu        $v1, %lo(show_verion_flag)($v0)
/* 20298 8001F698 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 2029C 8001F69C AFB3002C */  sw         $s3, 0x2c($sp)
/* 202A0 8001F6A0 00809821 */  addu       $s3, $a0, $zero
/* 202A4 8001F6A4 AFB20028 */  sw         $s2, 0x28($sp)
/* 202A8 8001F6A8 30B200FF */  andi       $s2, $a1, 0xff
/* 202AC 8001F6AC AFBF0030 */  sw         $ra, 0x30($sp)
/* 202B0 8001F6B0 AFB10024 */  sw         $s1, 0x24($sp)
/* 202B4 8001F6B4 1060001F */  beqz       $v1, .L8001F734
/* 202B8 8001F6B8 AFB00020 */   sw        $s0, 0x20($sp)
/* 202BC 8001F6BC 1240001D */  beqz       $s2, .L8001F734
/* 202C0 8001F6C0 3C10800F */   lui       $s0, %hi(gGlobalsText)
/* 202C4 8001F6C4 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 202C8 8001F6C8 02002021 */  addu       $a0, $s0, $zero
/* 202CC 8001F6CC 3C05800E */  lui        $a1, %hi(D_800D99A0)
/* 202D0 8001F6D0 24A599A0 */  addiu      $a1, $a1, %lo(D_800D99A0)
/* 202D4 8001F6D4 3C06800E */  lui        $a2, %hi(D_800D99E8)
/* 202D8 8001F6D8 24C699E8 */  addiu      $a2, $a2, %lo(D_800D99E8)
/* 202DC 8001F6DC 3C07800E */  lui        $a3, %hi(D_800D99F4)
/* 202E0 8001F6E0 24E799F4 */  addiu      $a3, $a3, %lo(D_800D99F4)
/* 202E4 8001F6E4 3C028010 */  lui        $v0, %hi(clear_end)
/* 202E8 8001F6E8 2442FA50 */  addiu      $v0, $v0, %lo(clear_end)
/* 202EC 8001F6EC 3C038000 */  lui        $v1, %hi(romMain)
/* 202F0 8001F6F0 24630400 */  addiu      $v1, $v1, %lo(romMain)
/* 202F4 8001F6F4 00431023 */  subu       $v0, $v0, $v1
/* 202F8 8001F6F8 24420400 */  addiu      $v0, $v0, 0x400
/* 202FC 8001F6FC AFA20010 */  sw         $v0, 0x10($sp)
/* 20300 8001F700 0C0333AC */  jal        sprintf
/* 20304 8001F704 8E710000 */   lw        $s1, ($s3)
/* 20308 8001F708 02002821 */  addu       $a1, $s0, $zero
/* 2030C 8001F70C 2406001E */  addiu      $a2, $zero, 0x1e
/* 20310 8001F710 2407001E */  addiu      $a3, $zero, 0x1e
/* 20314 8001F714 240200C8 */  addiu      $v0, $zero, 0xc8
/* 20318 8001F718 AFA20010 */  sw         $v0, 0x10($sp)
/* 2031C 8001F71C AFA20014 */  sw         $v0, 0x14($sp)
/* 20320 8001F720 AFA20018 */  sw         $v0, 0x18($sp)
/* 20324 8001F724 AFB2001C */  sw         $s2, 0x1c($sp)
/* 20328 8001F728 0C0028C5 */  jal        some_debug_print
/* 2032C 8001F72C 02202021 */   addu      $a0, $s1, $zero
/* 20330 8001F730 AE620000 */  sw         $v0, ($s3)
.L8001F734:
/* 20334 8001F734 8FBF0030 */  lw         $ra, 0x30($sp)
/* 20338 8001F738 8FB3002C */  lw         $s3, 0x2c($sp)
/* 2033C 8001F73C 8FB20028 */  lw         $s2, 0x28($sp)
/* 20340 8001F740 8FB10024 */  lw         $s1, 0x24($sp)
/* 20344 8001F744 8FB00020 */  lw         $s0, 0x20($sp)
/* 20348 8001F748 03E00008 */  jr         $ra
/* 2034C 8001F74C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel NOOP
/* 20350 8001F750 03E00008 */  jr         $ra
/* 20354 8001F754 00000000 */   nop

glabel splashscreen_timer
/* 20358 8001F758 00005021 */  addu       $t2, $zero, $zero
/* 2035C 8001F75C 90A80000 */  lbu        $t0, ($a1)
/* 20360 8001F760 94890000 */  lhu        $t1, ($a0)
/* 20364 8001F764 10C00002 */  beqz       $a2, .L8001F770
/* 20368 8001F768 93AB0017 */   lbu       $t3, 0x17($sp)
/* 2036C 8001F76C 90CA0000 */  lbu        $t2, ($a2)
.L8001F770:
/* 20370 8001F770 24020001 */  addiu      $v0, $zero, 1
/* 20374 8001F774 1122002C */  beq        $t1, $v0, .L8001F828
/* 20378 8001F778 29220002 */   slti      $v0, $t1, 2
/* 2037C 8001F77C 50400005 */  beql       $v0, $zero, .L8001F794
/* 20380 8001F780 24020002 */   addiu     $v0, $zero, 2
/* 20384 8001F784 11200007 */  beqz       $t1, .L8001F7A4
/* 20388 8001F788 2502001E */   addiu     $v0, $t0, 0x1e
/* 2038C 8001F78C 08007E12 */  j          .L8001F848
/* 20390 8001F790 00000000 */   nop
.L8001F794:
/* 20394 8001F794 1122000E */  beq        $t1, $v0, .L8001F7D0
/* 20398 8001F798 2502FFE2 */   addiu     $v0, $t0, -0x1e
/* 2039C 8001F79C 08007E12 */  j          .L8001F848
/* 203A0 8001F7A0 00000000 */   nop
.L8001F7A4:
/* 203A4 8001F7A4 00021400 */  sll        $v0, $v0, 0x10
/* 203A8 8001F7A8 00024403 */  sra        $t0, $v0, 0x10
/* 203AC 8001F7AC 290300FF */  slti       $v1, $t0, 0xff
/* 203B0 8001F7B0 14600025 */  bnez       $v1, .L8001F848
/* 203B4 8001F7B4 3C02800F */   lui       $v0, %hi(splashscreen_fadeTimer)
/* 203B8 8001F7B8 240800FF */  addiu      $t0, $zero, 0xff
/* 203BC 8001F7BC 24090001 */  addiu      $t1, $zero, 1
/* 203C0 8001F7C0 3C03800E */  lui        $v1, %hi(splashscreen_DisplayTimer)
/* 203C4 8001F7C4 A44098E6 */  sh         $zero, %lo(splashscreen_fadeTimer)($v0)
/* 203C8 8001F7C8 08007E12 */  j          .L8001F848
/* 203CC 8001F7CC AC6068DC */   sw        $zero, %lo(splashscreen_DisplayTimer)($v1)
.L8001F7D0:
/* 203D0 8001F7D0 00021400 */  sll        $v0, $v0, 0x10
/* 203D4 8001F7D4 10C00007 */  beqz       $a2, .L8001F7F4
/* 203D8 8001F7D8 00024403 */   sra       $t0, $v0, 0x10
/* 203DC 8001F7DC 2542001E */  addiu      $v0, $t2, 0x1e
/* 203E0 8001F7E0 00021400 */  sll        $v0, $v0, 0x10
/* 203E4 8001F7E4 00025403 */  sra        $t2, $v0, 0x10
/* 203E8 8001F7E8 294300FF */  slti       $v1, $t2, 0xff
/* 203EC 8001F7EC 50600001 */  beql       $v1, $zero, .L8001F7F4
/* 203F0 8001F7F0 240A00FF */   addiu     $t2, $zero, 0xff
.L8001F7F4:
/* 203F4 8001F7F4 1D000014 */  bgtz       $t0, .L8001F848
/* 203F8 8001F7F8 3C03800F */   lui       $v1, %hi(splashscreen_fadeTimer)
/* 203FC 8001F7FC 946298E6 */  lhu        $v0, %lo(splashscreen_fadeTimer)($v1)
/* 20400 8001F800 24420001 */  addiu      $v0, $v0, 1
/* 20404 8001F804 A46298E6 */  sh         $v0, -0x671a($v1)
/* 20408 8001F808 3042FFFF */  andi       $v0, $v0, 0xffff
/* 2040C 8001F80C 2C420014 */  sltiu      $v0, $v0, 0x14
/* 20410 8001F810 1440000D */  bnez       $v0, .L8001F848
/* 20414 8001F814 00004021 */   addu      $t0, $zero, $zero
/* 20418 8001F818 8FA20010 */  lw         $v0, 0x10($sp)
/* 2041C 8001F81C 00004821 */  addu       $t1, $zero, $zero
/* 20420 8001F820 08007E12 */  j          .L8001F848
/* 20424 8001F824 A04B0000 */   sb        $t3, ($v0)
.L8001F828:
/* 20428 8001F828 3C03800E */  lui        $v1, %hi(gGlobals)
/* 2042C 8001F82C 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 20430 8001F830 8C620034 */  lw         $v0, 0x34($v1)
/* 20434 8001F834 24420001 */  addiu      $v0, $v0, 1
/* 20438 8001F838 AC620034 */  sw         $v0, 0x34($v1)
/* 2043C 8001F83C 0047102B */  sltu       $v0, $v0, $a3
/* 20440 8001F840 50400001 */  beql       $v0, $zero, .L8001F848
/* 20444 8001F844 24090002 */   addiu     $t1, $zero, 2
.L8001F848:
/* 20448 8001F848 54C00001 */  bnel       $a2, $zero, .L8001F850
/* 2044C 8001F84C A0CA0000 */   sb        $t2, ($a2)
.L8001F850:
/* 20450 8001F850 A0A80000 */  sb         $t0, ($a1)
/* 20454 8001F854 03E00008 */  jr         $ra
/* 20458 8001F858 A4890000 */   sh        $t1, ($a0)

glabel splash_screen_func
/* 2045C 8001F85C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 20460 8001F860 AFBF001C */  sw         $ra, 0x1c($sp)
/* 20464 8001F864 AFB00018 */  sw         $s0, 0x18($sp)
/* 20468 8001F868 F7B40020 */  sdc1       $f20, 0x20($sp)
/* 2046C 8001F86C 0C027E7A */  jal        BorgAnimLoadScene
/* 20470 8001F870 240425A8 */   addiu     $a0, $zero, 0x25a8
/* 20474 8001F874 00402021 */  addu       $a0, $v0, $zero
/* 20478 8001F878 3C01800E */  lui        $at, %hi(D_800D9A00)
/* 2047C 8001F87C C4349A00 */  lwc1       $f20, %lo(D_800D9A00)($at)
/* 20480 8001F880 3C064380 */  lui        $a2, 0x4380
/* 20484 8001F884 4405A000 */  mfc1       $a1, $f20
/* 20488 8001F888 3C10800F */  lui        $s0, %hi(splashscreenAniDat)
/* 2048C 8001F88C 0C029F79 */  jal        setA_with_2floats
/* 20490 8001F890 AE0298D8 */   sw        $v0, %lo(splashscreenAniDat)($s0)
/* 20494 8001F894 0C029FE2 */  jal        func_800A7F88
/* 20498 8001F898 8E0498D8 */   lw        $a0, -0x6728($s0)
/* 2049C 8001F89C 0C029FEB */  jal        func_800A7FAC
/* 204A0 8001F8A0 8E0498D8 */   lw        $a0, -0x6728($s0)
/* 204A4 8001F8A4 0C029FDD */  jal        func_800A7F74
/* 204A8 8001F8A8 8E0498D8 */   lw        $a0, -0x6728($s0)
/* 204AC 8001F8AC 00002821 */  addu       $a1, $zero, $zero
/* 204B0 8001F8B0 00003021 */  addu       $a2, $zero, $zero
/* 204B4 8001F8B4 00003821 */  addu       $a3, $zero, $zero
/* 204B8 8001F8B8 8E0498D8 */  lw         $a0, -0x6728($s0)
/* 204BC 8001F8BC 240200FF */  addiu      $v0, $zero, 0xff
/* 204C0 8001F8C0 0C02A0B3 */  jal        set_anidat_color
/* 204C4 8001F8C4 AFA20010 */   sw        $v0, 0x10($sp)
/* 204C8 8001F8C8 2404007C */  addiu      $a0, $zero, 0x7c
/* 204CC 8001F8CC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 204D0 8001F8D0 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 204D4 8001F8D4 3C03800F */  lui        $v1, %hi(D_800F36F8)
/* 204D8 8001F8D8 A440003C */  sh         $zero, 0x3c($v0)
/* 204DC 8001F8DC AC400034 */  sw         $zero, 0x34($v0)
/* 204E0 8001F8E0 0C026259 */  jal        passToMalloc
/* 204E4 8001F8E4 E47436F8 */   swc1      $f20, %lo(D_800F36F8)($v1)
/* 204E8 8001F8E8 240400FA */  addiu      $a0, $zero, 0xfa
/* 204EC 8001F8EC 0C0290E2 */  jal        get_borg_8
/* 204F0 8001F8F0 00408021 */   addu      $s0, $v0, $zero
/* 204F4 8001F8F4 02002021 */  addu       $a0, $s0, $zero
/* 204F8 8001F8F8 0C02E518 */  jal        borg8_widget
/* 204FC 8001F8FC 00402821 */   addu      $a1, $v0, $zero
/* 20500 8001F900 00002821 */  addu       $a1, $zero, $zero
/* 20504 8001F904 8C480078 */  lw         $t0, 0x78($v0)
/* 20508 8001F908 00003021 */  addu       $a2, $zero, $zero
/* 2050C 8001F90C 85040048 */  lh         $a0, 0x48($t0)
/* 20510 8001F910 00003821 */  addu       $a3, $zero, $zero
/* 20514 8001F914 AFA00010 */  sw         $zero, 0x10($sp)
/* 20518 8001F918 8D03004C */  lw         $v1, 0x4c($t0)
/* 2051C 8001F91C 3C10800F */  lui        $s0, %hi(widget_N64Logo)
/* 20520 8001F920 AE0298DC */  sw         $v0, %lo(widget_N64Logo)($s0)
/* 20524 8001F924 0060F809 */  jalr       $v1
/* 20528 8001F928 00442021 */   addu      $a0, $v0, $a0
/* 2052C 8001F92C 8E0598DC */  lw         $a1, -0x6724($s0)
/* 20530 8001F930 8CA30078 */  lw         $v1, 0x78($a1)
/* 20534 8001F934 84640018 */  lh         $a0, 0x18($v1)
/* 20538 8001F938 8C62001C */  lw         $v0, 0x1c($v1)
/* 2053C 8001F93C 0040F809 */  jalr       $v0
/* 20540 8001F940 00A42021 */   addu      $a0, $a1, $a0
/* 20544 8001F944 00021042 */  srl        $v0, $v0, 1
/* 20548 8001F948 3042FFFF */  andi       $v0, $v0, 0xffff
/* 2054C 8001F94C 240500A0 */  addiu      $a1, $zero, 0xa0
/* 20550 8001F950 00A22823 */  subu       $a1, $a1, $v0
/* 20554 8001F954 8E0498DC */  lw         $a0, -0x6724($s0)
/* 20558 8001F958 0C02DD3F */  jal        set_widget_coords
/* 2055C 8001F95C 240600BE */   addiu     $a2, $zero, 0xbe
/* 20560 8001F960 8FBF001C */  lw         $ra, 0x1c($sp)
/* 20564 8001F964 8FB00018 */  lw         $s0, 0x18($sp)
/* 20568 8001F968 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 2056C 8001F96C 03E00008 */  jr         $ra
/* 20570 8001F970 27BD0028 */   addiu     $sp, $sp, 0x28

glabel n64_logo_free
/* 20574 8001F974 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 20578 8001F978 AFB00010 */  sw         $s0, 0x10($sp)
/* 2057C 8001F97C 3C10800E */  lui        $s0, %hi(queueStructA)
/* 20580 8001F980 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 20584 8001F984 02002021 */  addu       $a0, $s0, $zero
/* 20588 8001F988 AFB20018 */  sw         $s2, 0x18($sp)
/* 2058C 8001F98C 3C12800F */  lui        $s2, %hi(splashscreenAniDat)
/* 20590 8001F990 264598D8 */  addiu      $a1, $s2, %lo(splashscreenAniDat)
/* 20594 8001F994 24060001 */  addiu      $a2, $zero, 1
/* 20598 8001F998 00003821 */  addu       $a3, $zero, $zero
/* 2059C 8001F99C AFBF001C */  sw         $ra, 0x1c($sp)
/* 205A0 8001F9A0 0C035867 */  jal        AllocFreeQueueItem
/* 205A4 8001F9A4 AFB10014 */   sw        $s1, 0x14($sp)
/* 205A8 8001F9A8 02002021 */  addu       $a0, $s0, $zero
/* 205AC 8001F9AC 3C11800F */  lui        $s1, %hi(widget_N64Logo)
/* 205B0 8001F9B0 262598DC */  addiu      $a1, $s1, %lo(widget_N64Logo)
/* 205B4 8001F9B4 24060006 */  addiu      $a2, $zero, 6
/* 205B8 8001F9B8 0C035867 */  jal        AllocFreeQueueItem
/* 205BC 8001F9BC 00003821 */   addu      $a3, $zero, $zero
/* 205C0 8001F9C0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 205C4 8001F9C4 AE4098D8 */  sw         $zero, -0x6728($s2)
/* 205C8 8001F9C8 8FB20018 */  lw         $s2, 0x18($sp)
/* 205CC 8001F9CC AE2098DC */  sw         $zero, -0x6724($s1)
/* 205D0 8001F9D0 8FB10014 */  lw         $s1, 0x14($sp)
/* 205D4 8001F9D4 8FB00010 */  lw         $s0, 0x10($sp)
/* 205D8 8001F9D8 03E00008 */  jr         $ra
/* 205DC 8001F9DC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel load_splashscreen_data
/* 205E0 8001F9E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 205E4 8001F9E4 24040101 */  addiu      $a0, $zero, 0x101
/* 205E8 8001F9E8 AFB10014 */  sw         $s1, 0x14($sp)
/* 205EC 8001F9EC 3C11800E */  lui        $s1, %hi(gGlobals)
/* 205F0 8001F9F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 205F4 8001F9F4 263068A8 */  addiu      $s0, $s1, %lo(gGlobals)
/* 205F8 8001F9F8 24020005 */  addiu      $v0, $zero, 5
/* 205FC 8001F9FC AFBF0018 */  sw         $ra, 0x18($sp)
/* 20600 8001FA00 0C0290E2 */  jal        get_borg_8
/* 20604 8001FA04 A2020020 */   sb        $v0, 0x20($s0)
/* 20608 8001FA08 240400DE */  addiu      $a0, $zero, 0xde
/* 2060C 8001FA0C 0C0290E2 */  jal        get_borg_8
/* 20610 8001FA10 AE020024 */   sw        $v0, 0x24($s0)
/* 20614 8001FA14 AE020028 */  sw         $v0, 0x28($s0)
/* 20618 8001FA18 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2061C 8001FA1C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 20620 8001FA20 10600002 */  beqz       $v1, .L8001FA2C
/* 20624 8001FA24 24043759 */   addiu     $a0, $zero, 0x3759
/* 20628 8001FA28 24043758 */  addiu      $a0, $zero, 0x3758
.L8001FA2C:
/* 2062C 8001FA2C 0C0290E2 */  jal        get_borg_8
/* 20630 8001FA30 00000000 */   nop
/* 20634 8001FA34 3C03800F */  lui        $v1, %hi(exp_pack_borg8)
/* 20638 8001FA38 0C007E17 */  jal        splash_screen_func
/* 2063C 8001FA3C AC6298E0 */   sw        $v0, %lo(exp_pack_borg8)($v1)
/* 20640 8001FA40 3C04B200 */  lui        $a0, %hi(copyrightStrings)
/* 20644 8001FA44 24848F30 */  addiu      $a0, $a0, %lo(copyrightStrings)
/* 20648 8001FA48 262268A8 */  addiu      $v0, $s1, 0x68a8
/* 2064C 8001FA4C 240300FF */  addiu      $v1, $zero, 0xff
/* 20650 8001FA50 3C05B200 */  lui        $a1, %hi(journal_ROM)
/* 20654 8001FA54 24A590B0 */  addiu      $a1, $a1, %lo(journal_ROM)
/* 20658 8001FA58 00A42823 */  subu       $a1, $a1, $a0
/* 2065C 8001FA5C AC400034 */  sw         $zero, 0x34($v0)
/* 20660 8001FA60 A0400038 */  sb         $zero, 0x38($v0)
/* 20664 8001FA64 A443003A */  sh         $v1, 0x3a($v0)
/* 20668 8001FA68 A443003C */  sh         $v1, 0x3c($v0)
/* 2066C 8001FA6C 0C0232A0 */  jal        func_romStrings
/* 20670 8001FA70 A440003E */   sh        $zero, 0x3e($v0)
/* 20674 8001FA74 00002021 */  addu       $a0, $zero, $zero
/* 20678 8001FA78 3C03800F */  lui        $v1, %hi(copyrightText)
/* 2067C 8001FA7C 0C0271BF */  jal        cont_delay
/* 20680 8001FA80 AC6298D0 */   sw        $v0, %lo(copyrightText)($v1)
/* 20684 8001FA84 3C038010 */  lui        $v1, %hi(clear_end)
/* 20688 8001FA88 2463FA50 */  addiu      $v1, $v1, %lo(clear_end)
/* 2068C 8001FA8C 3C028000 */  lui        $v0, %hi(romMain)
/* 20690 8001FA90 24420400 */  addiu      $v0, $v0, %lo(romMain)
/* 20694 8001FA94 00621823 */  subu       $v1, $v1, $v0
/* 20698 8001FA98 24630400 */  addiu      $v1, $v1, 0x400
/* 2069C 8001FA9C 3C020010 */  lui        $v0, 0x10
/* 206A0 8001FAA0 0043102B */  sltu       $v0, $v0, $v1
/* 206A4 8001FAA4 10400003 */  beqz       $v0, .L8001FAB4
/* 206A8 8001FAA8 3C03800F */   lui       $v1, %hi(copyright_error)
/* 206AC 8001FAAC 24020001 */  addiu      $v0, $zero, 1
/* 206B0 8001FAB0 A46298D4 */  sh         $v0, %lo(copyright_error)($v1)
.L8001FAB4:
/* 206B4 8001FAB4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 206B8 8001FAB8 8FB10014 */  lw         $s1, 0x14($sp)
/* 206BC 8001FABC 8FB00010 */  lw         $s0, 0x10($sp)
/* 206C0 8001FAC0 03E00008 */  jr         $ra
/* 206C4 8001FAC4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_splashScreen_data
/* 206C8 8001FAC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 206CC 8001FACC AFB00010 */  sw         $s0, 0x10($sp)
/* 206D0 8001FAD0 3C10800E */  lui        $s0, %hi(queueStructA)
/* 206D4 8001FAD4 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 206D8 8001FAD8 02002021 */  addu       $a0, $s0, $zero
/* 206DC 8001FADC 2605EA04 */  addiu      $a1, $s0, -0x15fc
/* 206E0 8001FAE0 24060004 */  addiu      $a2, $zero, 4
/* 206E4 8001FAE4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 206E8 8001FAE8 0C035867 */  jal        AllocFreeQueueItem
/* 206EC 8001FAEC 00003821 */   addu      $a3, $zero, $zero
/* 206F0 8001FAF0 02002021 */  addu       $a0, $s0, $zero
/* 206F4 8001FAF4 2605EA00 */  addiu      $a1, $s0, -0x1600
/* 206F8 8001FAF8 24060004 */  addiu      $a2, $zero, 4
/* 206FC 8001FAFC 0C035867 */  jal        AllocFreeQueueItem
/* 20700 8001FB00 00003821 */   addu      $a3, $zero, $zero
/* 20704 8001FB04 02002021 */  addu       $a0, $s0, $zero
/* 20708 8001FB08 3C05800F */  lui        $a1, %hi(exp_pack_borg8)
/* 2070C 8001FB0C 24A598E0 */  addiu      $a1, $a1, %lo(exp_pack_borg8)
/* 20710 8001FB10 24060004 */  addiu      $a2, $zero, 4
/* 20714 8001FB14 0C035867 */  jal        AllocFreeQueueItem
/* 20718 8001FB18 00003821 */   addu      $a3, $zero, $zero
/* 2071C 8001FB1C 8E04FFDC */  lw         $a0, -0x24($s0)
/* 20720 8001FB20 0C02D0FD */  jal        font_func
/* 20724 8001FB24 2405001C */   addiu     $a1, $zero, 0x1c
/* 20728 8001FB28 3C03800F */  lui        $v1, %hi(copyrightText)
/* 2072C 8001FB2C 0C0232F9 */  jal        free_romstring
/* 20730 8001FB30 8C6498D0 */   lw        $a0, %lo(copyrightText)($v1)
/* 20734 8001FB34 0C007E5D */  jal        n64_logo_free
/* 20738 8001FB38 00000000 */   nop
/* 2073C 8001FB3C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 20740 8001FB40 8FB00010 */  lw         $s0, 0x10($sp)
/* 20744 8001FB44 03E00008 */  jr         $ra
/* 20748 8001FB48 27BD0018 */   addiu     $sp, $sp, 0x18

glabel show_splash_screens
/* 2074C 8001FB4C 3C02800F */  lui        $v0, %hi(splashscreen_load_flag)
/* 20750 8001FB50 904398E8 */  lbu        $v1, %lo(splashscreen_load_flag)($v0)
/* 20754 8001FB54 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 20758 8001FB58 AFB00028 */  sw         $s0, 0x28($sp)
/* 2075C 8001FB5C 00808021 */  addu       $s0, $a0, $zero
/* 20760 8001FB60 AFB30034 */  sw         $s3, 0x34($sp)
/* 20764 8001FB64 00409821 */  addu       $s3, $v0, $zero
/* 20768 8001FB68 AFBF003C */  sw         $ra, 0x3c($sp)
/* 2076C 8001FB6C AFB40038 */  sw         $s4, 0x38($sp)
/* 20770 8001FB70 AFB20030 */  sw         $s2, 0x30($sp)
/* 20774 8001FB74 10600004 */  beqz       $v1, .L8001FB88
/* 20778 8001FB78 AFB1002C */   sw        $s1, 0x2c($sp)
/* 2077C 8001FB7C 0C007E78 */  jal        load_splashscreen_data
/* 20780 8001FB80 00000000 */   nop
/* 20784 8001FB84 A26098E8 */  sb         $zero, -0x6718($s3)
.L8001FB88:
/* 20788 8001FB88 24120001 */  addiu      $s2, $zero, 1
/* 2078C 8001FB8C 240200F0 */  addiu      $v0, $zero, 0xf0
/* 20790 8001FB90 00002821 */  addu       $a1, $zero, $zero
/* 20794 8001FB94 00003021 */  addu       $a2, $zero, $zero
/* 20798 8001FB98 8E040000 */  lw         $a0, ($s0)
/* 2079C 8001FB9C 24070140 */  addiu      $a3, $zero, 0x140
/* 207A0 8001FBA0 AFA20010 */  sw         $v0, 0x10($sp)
/* 207A4 8001FBA4 AFA00014 */  sw         $zero, 0x14($sp)
/* 207A8 8001FBA8 AFA00018 */  sw         $zero, 0x18($sp)
/* 207AC 8001FBAC AFA0001C */  sw         $zero, 0x1c($sp)
/* 207B0 8001FBB0 0C002265 */  jal        some_video_setting_init
/* 207B4 8001FBB4 AFA00020 */   sw        $zero, 0x20($sp)
/* 207B8 8001FBB8 3C03800E */  lui        $v1, %hi(gGlobals)
/* 207BC 8001FBBC AE020000 */  sw         $v0, ($s0)
/* 207C0 8001FBC0 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 207C4 8001FBC4 3C14800F */  lui        $s4, 0x800f
/* 207C8 8001FBC8 90440020 */  lbu        $a0, 0x20($v0)
/* 207CC 8001FBCC 2C820006 */  sltiu      $v0, $a0, 6
/* 207D0 8001FBD0 10400026 */  beqz       $v0, .L8001FC6C
/* 207D4 8001FBD4 00608821 */   addu      $s1, $v1, $zero
/* 207D8 8001FBD8 3C02800E */  lui        $v0, %hi(D_800D9A08)
/* 207DC 8001FBDC 24429A08 */  addiu      $v0, $v0, %lo(D_800D9A08)
/* 207E0 8001FBE0 00041880 */  sll        $v1, $a0, 2
/* 207E4 8001FBE4 00621821 */  addu       $v1, $v1, $v0
/* 207E8 8001FBE8 8C640000 */  lw         $a0, ($v1)
/* 207EC 8001FBEC 00800008 */  jr         $a0
/* 207F0 8001FBF0 00000000 */   nop
/* 207F4 8001FBF4 0C007F69 */  jal        show_expansionPak_screen
/* 207F8 8001FBF8 02002021 */   addu      $a0, $s0, $zero
/* 207FC 8001FBFC 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 20800 8001FC00 08007F1A */  j          .L8001FC68
/* 20804 8001FC04 A0620020 */   sb        $v0, 0x20($v1)
/* 20808 8001FC08 0C007FBD */  jal        copyright_splash_screen
/* 2080C 8001FC0C 02002021 */   addu      $a0, $s0, $zero
/* 20810 8001FC10 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 20814 8001FC14 08007F1A */  j          .L8001FC68
/* 20818 8001FC18 A0620020 */   sb        $v0, 0x20($v1)
/* 2081C 8001FC1C 0C008076 */  jal        show_n64_logo
/* 20820 8001FC20 02002021 */   addu      $a0, $s0, $zero
/* 20824 8001FC24 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 20828 8001FC28 08007F1A */  j          .L8001FC68
/* 2082C 8001FC2C A0620020 */   sb        $v0, 0x20($v1)
/* 20830 8001FC30 0C00811F */  jal        show_THQ_logo
/* 20834 8001FC34 02002021 */   addu      $a0, $s0, $zero
/* 20838 8001FC38 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 2083C 8001FC3C 08007F1A */  j          .L8001FC68
/* 20840 8001FC40 A0620020 */   sb        $v0, 0x20($v1)
/* 20844 8001FC44 0C00815B */  jal        show_h2O_logo
/* 20848 8001FC48 02002021 */   addu      $a0, $s0, $zero
/* 2084C 8001FC4C 262368A8 */  addiu      $v1, $s1, 0x68a8
/* 20850 8001FC50 08007F1A */  j          .L8001FC68
/* 20854 8001FC54 A0620020 */   sb        $v0, 0x20($v1)
/* 20858 8001FC58 3C03800F */  lui        $v1, %hi(splashscreen_clear_flag)
/* 2085C 8001FC5C 24020001 */  addiu      $v0, $zero, 1
/* 20860 8001FC60 A06298E9 */  sb         $v0, %lo(splashscreen_clear_flag)($v1)
/* 20864 8001FC64 00009021 */  addu       $s2, $zero, $zero
.L8001FC68:
/* 20868 8001FC68 3C14800F */  lui        $s4, %hi(splashscreen_clear_flag)
.L8001FC6C:
/* 2086C 8001FC6C 928298E9 */  lbu        $v0, %lo(splashscreen_clear_flag)($s4)
/* 20870 8001FC70 10400007 */  beqz       $v0, .L8001FC90
/* 20874 8001FC74 02401021 */   addu      $v0, $s2, $zero
/* 20878 8001FC78 0C007EB2 */  jal        clear_splashScreen_data
/* 2087C 8001FC7C 00000000 */   nop
/* 20880 8001FC80 24020001 */  addiu      $v0, $zero, 1
/* 20884 8001FC84 A26298E8 */  sb         $v0, -0x6718($s3)
/* 20888 8001FC88 A28098E9 */  sb         $zero, -0x6717($s4)
/* 2088C 8001FC8C 02401021 */  addu       $v0, $s2, $zero
.L8001FC90:
/* 20890 8001FC90 8FBF003C */  lw         $ra, 0x3c($sp)
/* 20894 8001FC94 8FB40038 */  lw         $s4, 0x38($sp)
/* 20898 8001FC98 8FB30034 */  lw         $s3, 0x34($sp)
/* 2089C 8001FC9C 8FB20030 */  lw         $s2, 0x30($sp)
/* 208A0 8001FCA0 8FB1002C */  lw         $s1, 0x2c($sp)
/* 208A4 8001FCA4 8FB00028 */  lw         $s0, 0x28($sp)
/* 208A8 8001FCA8 03E00008 */  jr         $ra
/* 208AC 8001FCAC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel splashScreen_borg8
/* 208B0 8001FCB0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 208B4 8001FCB4 AFB40038 */  sw         $s4, 0x38($sp)
/* 208B8 8001FCB8 0080A021 */  addu       $s4, $a0, $zero
/* 208BC 8001FCBC AFB20030 */  sw         $s2, 0x30($sp)
/* 208C0 8001FCC0 AFB30034 */  sw         $s3, 0x34($sp)
/* 208C4 8001FCC4 30B300FF */  andi       $s3, $a1, 0xff
/* 208C8 8001FCC8 AFBF003C */  sw         $ra, 0x3c($sp)
/* 208CC 8001FCCC AFB1002C */  sw         $s1, 0x2c($sp)
/* 208D0 8001FCD0 AFB00028 */  sw         $s0, 0x28($sp)
/* 208D4 8001FCD4 F7B60048 */  sdc1       $f22, 0x48($sp)
/* 208D8 8001FCD8 F7B40040 */  sdc1       $f20, 0x40($sp)
/* 208DC 8001FCDC 12600027 */  beqz       $s3, .L8001FD7C
/* 208E0 8001FCE0 00C09021 */   addu      $s2, $a2, $zero
/* 208E4 8001FCE4 24020140 */  addiu      $v0, $zero, 0x140
/* 208E8 8001FCE8 9643000A */  lhu        $v1, 0xa($s2)
/* 208EC 8001FCEC 3C01800E */  lui        $at, %hi(D_800D9A20)
/* 208F0 8001FCF0 C4209A20 */  lwc1       $f0, %lo(D_800D9A20)($at)
/* 208F4 8001FCF4 00431023 */  subu       $v0, $v0, $v1
/* 208F8 8001FCF8 4482B000 */  mtc1       $v0, $f22
/* 208FC 8001FCFC 4680B5A0 */  cvt.s.w    $f22, $f22
/* 20900 8001FD00 4600B582 */  mul.s      $f22, $f22, $f0
/* 20904 8001FD04 9643000C */  lhu        $v1, 0xc($s2)
/* 20908 8001FD08 240200F0 */  addiu      $v0, $zero, 0xf0
/* 2090C 8001FD0C 00431023 */  subu       $v0, $v0, $v1
/* 20910 8001FD10 4482A000 */  mtc1       $v0, $f20
/* 20914 8001FD14 4680A520 */  cvt.s.w    $f20, $f20
/* 20918 8001FD18 4600A502 */  mul.s      $f20, $f20, $f0
/* 2091C 8001FD1C 0C0025B4 */  jal        get_hres
/* 20920 8001FD20 8E900000 */   lw        $s0, ($s4)
/* 20924 8001FD24 0C0025B7 */  jal        get_vres
/* 20928 8001FD28 00408821 */   addu      $s1, $v0, $zero
/* 2092C 8001FD2C 02002021 */  addu       $a0, $s0, $zero
/* 20930 8001FD30 24050006 */  addiu      $a1, $zero, 6
/* 20934 8001FD34 02203021 */  addu       $a2, $s1, $zero
/* 20938 8001FD38 0C0290ED */  jal        rsp_func
/* 2093C 8001FD3C 00403821 */   addu      $a3, $v0, $zero
/* 20940 8001FD40 00402021 */  addu       $a0, $v0, $zero
/* 20944 8001FD44 02402821 */  addu       $a1, $s2, $zero
/* 20948 8001FD48 3C01800E */  lui        $at, %hi(D_800D9A24)
/* 2094C 8001FD4C C4209A24 */  lwc1       $f0, %lo(D_800D9A24)($at)
/* 20950 8001FD50 4406B000 */  mfc1       $a2, $f22
/* 20954 8001FD54 4407A000 */  mfc1       $a3, $f20
/* 20958 8001FD58 240200FF */  addiu      $v0, $zero, 0xff
/* 2095C 8001FD5C AFA20018 */  sw         $v0, 0x18($sp)
/* 20960 8001FD60 AFA2001C */  sw         $v0, 0x1c($sp)
/* 20964 8001FD64 AFA20020 */  sw         $v0, 0x20($sp)
/* 20968 8001FD68 AFB30024 */  sw         $s3, 0x24($sp)
/* 2096C 8001FD6C E7A00010 */  swc1       $f0, 0x10($sp)
/* 20970 8001FD70 0C0299A8 */  jal        pass_to_borg_image_draw
/* 20974 8001FD74 E7A00014 */   swc1      $f0, 0x14($sp)
/* 20978 8001FD78 AE820000 */  sw         $v0, ($s4)
.L8001FD7C:
/* 2097C 8001FD7C 8FBF003C */  lw         $ra, 0x3c($sp)
/* 20980 8001FD80 8FB40038 */  lw         $s4, 0x38($sp)
/* 20984 8001FD84 8FB30034 */  lw         $s3, 0x34($sp)
/* 20988 8001FD88 8FB20030 */  lw         $s2, 0x30($sp)
/* 2098C 8001FD8C 8FB1002C */  lw         $s1, 0x2c($sp)
/* 20990 8001FD90 8FB00028 */  lw         $s0, 0x28($sp)
/* 20994 8001FD94 D7B60048 */  ldc1       $f22, 0x48($sp)
/* 20998 8001FD98 D7B40040 */  ldc1       $f20, 0x40($sp)
/* 2099C 8001FD9C 03E00008 */  jr         $ra
/* 209A0 8001FDA0 27BD0050 */   addiu     $sp, $sp, 0x50

glabel show_expansionPak_screen
/* 209A4 8001FDA4 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 209A8 8001FDA8 AFB40038 */  sw         $s4, 0x38($sp)
/* 209AC 8001FDAC 0080A021 */  addu       $s4, $a0, $zero
/* 209B0 8001FDB0 3C02800E */  lui        $v0, 0x800e
/* 209B4 8001FDB4 AFBF003C */  sw         $ra, 0x3c($sp)
/* 209B8 8001FDB8 AFB30034 */  sw         $s3, 0x34($sp)
/* 209BC 8001FDBC AFB20030 */  sw         $s2, 0x30($sp)
/* 209C0 8001FDC0 AFB1002C */  sw         $s1, 0x2c($sp)
/* 209C4 8001FDC4 AFB00028 */  sw         $s0, 0x28($sp)
/* 209C8 8001FDC8 8E830000 */  lw         $v1, ($s4)
/* 209CC 8001FDCC 904468C8 */  lbu        $a0, 0x68c8($v0)
/* 209D0 8001FDD0 AFA30020 */  sw         $v1, 0x20($sp)
/* 209D4 8001FDD4 A3A40018 */  sb         $a0, 0x18($sp)
/* 209D8 8001FDD8 3C11800F */  lui        $s1, 0x800f
/* 209DC 8001FDDC 27B0001C */  addiu      $s0, $sp, 0x1c
/* 209E0 8001FDE0 27B20020 */  addiu      $s2, $sp, 0x20
/* 209E4 8001FDE4 08007F84 */  j          .L8001FE10
/* 209E8 8001FDE8 3C13800F */   lui       $s3, 0x800f
.L8001FDEC:
/* 209EC 8001FDEC 248498EA */  addiu      $a0, $a0, -0x6716
/* 209F0 8001FDF0 262598EC */  addiu      $a1, $s1, -0x6714
/* 209F4 8001FDF4 00003021 */  addu       $a2, $zero, $zero
/* 209F8 8001FDF8 27A20018 */  addiu      $v0, $sp, 0x18
/* 209FC 8001FDFC 24030004 */  addiu      $v1, $zero, 4
/* 20A00 8001FE00 24070002 */  addiu      $a3, $zero, 2
/* 20A04 8001FE04 AFA20010 */  sw         $v0, 0x10($sp)
/* 20A08 8001FE08 0C007DD6 */  jal        splashscreen_timer
/* 20A0C 8001FE0C AFA30014 */   sw        $v1, 0x14($sp)
.L8001FE10:
/* 20A10 8001FE10 02002021 */  addu       $a0, $s0, $zero
/* 20A14 8001FE14 0C02713D */  jal        get_cont_aidyn
/* 20A18 8001FE18 00002821 */   addu      $a1, $zero, $zero
/* 20A1C 8001FE1C 1440FFF3 */  bnez       $v0, .L8001FDEC
/* 20A20 8001FE20 3C04800F */   lui       $a0, 0x800f
/* 20A24 8001FE24 922598EC */  lbu        $a1, -0x6714($s1)
/* 20A28 8001FE28 8E6698E0 */  lw         $a2, -0x6720($s3)
/* 20A2C 8001FE2C 0C007F2C */  jal        splashScreen_borg8
/* 20A30 8001FE30 02402021 */   addu      $a0, $s2, $zero
/* 20A34 8001FE34 8FA30020 */  lw         $v1, 0x20($sp)
/* 20A38 8001FE38 93A20018 */  lbu        $v0, 0x18($sp)
/* 20A3C 8001FE3C 8FBF003C */  lw         $ra, 0x3c($sp)
/* 20A40 8001FE40 8FB30034 */  lw         $s3, 0x34($sp)
/* 20A44 8001FE44 8FB20030 */  lw         $s2, 0x30($sp)
/* 20A48 8001FE48 8FB1002C */  lw         $s1, 0x2c($sp)
/* 20A4C 8001FE4C 8FB00028 */  lw         $s0, 0x28($sp)
/* 20A50 8001FE50 AE830000 */  sw         $v1, ($s4)
/* 20A54 8001FE54 8FB40038 */  lw         $s4, 0x38($sp)
/* 20A58 8001FE58 03E00008 */  jr         $ra
/* 20A5C 8001FE5C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel print_copyright_line
/* 20A60 8001FE60 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 20A64 8001FE64 AFB30024 */  sw         $s3, 0x24($sp)
/* 20A68 8001FE68 00809821 */  addu       $s3, $a0, $zero
/* 20A6C 8001FE6C AFB00018 */  sw         $s0, 0x18($sp)
/* 20A70 8001FE70 3C10800E */  lui        $s0, %hi(gGlobals)
/* 20A74 8001FE74 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 20A78 8001FE78 AFB1001C */  sw         $s1, 0x1c($sp)
/* 20A7C 8001FE7C 00A08821 */  addu       $s1, $a1, $zero
/* 20A80 8001FE80 AFB20020 */  sw         $s2, 0x20($sp)
/* 20A84 8001FE84 00C09021 */  addu       $s2, $a2, $zero
/* 20A88 8001FE88 AFBF0028 */  sw         $ra, 0x28($sp)
/* 20A8C 8001FE8C 8E041600 */  lw         $a0, 0x1600($s0)
/* 20A90 8001FE90 0C02D443 */  jal        func_800B510C
/* 20A94 8001FE94 02402821 */   addu      $a1, $s2, $zero
/* 20A98 8001FE98 02602821 */  addu       $a1, $s3, $zero
/* 20A9C 8001FE9C 24070140 */  addiu      $a3, $zero, 0x140
/* 20AA0 8001FEA0 00E23823 */  subu       $a3, $a3, $v0
/* 20AA4 8001FEA4 000717C2 */  srl        $v0, $a3, 0x1f
/* 20AA8 8001FEA8 00E23821 */  addu       $a3, $a3, $v0
/* 20AAC 8001FEAC 02403021 */  addu       $a2, $s2, $zero
/* 20AB0 8001FEB0 8E041600 */  lw         $a0, 0x1600($s0)
/* 20AB4 8001FEB4 86230000 */  lh         $v1, ($s1)
/* 20AB8 8001FEB8 00073843 */  sra        $a3, $a3, 1
/* 20ABC 8001FEBC 0C02D137 */  jal        func_800B44DC
/* 20AC0 8001FEC0 AFA30010 */   sw        $v1, 0x10($sp)
/* 20AC4 8001FEC4 8E041600 */  lw         $a0, 0x1600($s0)
/* 20AC8 8001FEC8 96220000 */  lhu        $v0, ($s1)
/* 20ACC 8001FECC 8FBF0028 */  lw         $ra, 0x28($sp)
/* 20AD0 8001FED0 8FB30024 */  lw         $s3, 0x24($sp)
/* 20AD4 8001FED4 8FB20020 */  lw         $s2, 0x20($sp)
/* 20AD8 8001FED8 9483000E */  lhu        $v1, 0xe($a0)
/* 20ADC 8001FEDC 8FB00018 */  lw         $s0, 0x18($sp)
/* 20AE0 8001FEE0 00431021 */  addu       $v0, $v0, $v1
/* 20AE4 8001FEE4 A6220000 */  sh         $v0, ($s1)
/* 20AE8 8001FEE8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 20AEC 8001FEEC 03E00008 */  jr         $ra
/* 20AF0 8001FEF0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel copyright_splash_screen
/* 20AF4 8001FEF4 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 20AF8 8001FEF8 AFB70054 */  sw         $s7, 0x54($sp)
/* 20AFC 8001FEFC 0080B821 */  addu       $s7, $a0, $zero
/* 20B00 8001FF00 AFB00038 */  sw         $s0, 0x38($sp)
/* 20B04 8001FF04 3C10800E */  lui        $s0, %hi(gGlobals)
/* 20B08 8001FF08 AFB1003C */  sw         $s1, 0x3c($sp)
/* 20B0C 8001FF0C 261168A8 */  addiu      $s1, $s0, %lo(gGlobals)
/* 20B10 8001FF10 AFBF0058 */  sw         $ra, 0x58($sp)
/* 20B14 8001FF14 AFB60050 */  sw         $s6, 0x50($sp)
/* 20B18 8001FF18 AFB5004C */  sw         $s5, 0x4c($sp)
/* 20B1C 8001FF1C AFB40048 */  sw         $s4, 0x48($sp)
/* 20B20 8001FF20 AFB30044 */  sw         $s3, 0x44($sp)
/* 20B24 8001FF24 AFB20040 */  sw         $s2, 0x40($sp)
/* 20B28 8001FF28 8EE20000 */  lw         $v0, ($s7)
/* 20B2C 8001FF2C 92230020 */  lbu        $v1, 0x20($s1)
/* 20B30 8001FF30 AFA20030 */  sw         $v0, 0x30($sp)
/* 20B34 8001FF34 0C0025B7 */  jal        get_vres
/* 20B38 8001FF38 A3A30028 */   sb        $v1, 0x28($sp)
/* 20B3C 8001FF3C 8E231600 */  lw         $v1, 0x1600($s1)
/* 20B40 8001FF40 00021042 */  srl        $v0, $v0, 1
/* 20B44 8001FF44 9464000E */  lhu        $a0, 0xe($v1)
/* 20B48 8001FF48 2442FFF9 */  addiu      $v0, $v0, -7
/* 20B4C 8001FF4C 00041840 */  sll        $v1, $a0, 1
/* 20B50 8001FF50 00641821 */  addu       $v1, $v1, $a0
/* 20B54 8001FF54 00031840 */  sll        $v1, $v1, 1
/* 20B58 8001FF58 00431023 */  subu       $v0, $v0, $v1
/* 20B5C 8001FF5C A7A2002A */  sh         $v0, 0x2a($sp)
/* 20B60 8001FF60 02008821 */  addu       $s1, $s0, $zero
/* 20B64 8001FF64 3C12800F */  lui        $s2, 0x800f
/* 20B68 8001FF68 27B0002C */  addiu      $s0, $sp, 0x2c
/* 20B6C 8001FF6C 3C16800F */  lui        $s6, 0x800f
/* 20B70 8001FF70 27B40030 */  addiu      $s4, $sp, 0x30
/* 20B74 8001FF74 08007FF0 */  j          .L8001FFC0
/* 20B78 8001FF78 27B3002A */   addiu     $s3, $sp, 0x2a
.L8001FF7C:
/* 20B7C 8001FF7C 8C43000C */  lw         $v1, 0xc($v0)
/* 20B80 8001FF80 24020030 */  addiu      $v0, $zero, 0x30
/* 20B84 8001FF84 30630030 */  andi       $v1, $v1, 0x30
/* 20B88 8001FF88 14620004 */  bne        $v1, $v0, .L8001FF9C
/* 20B8C 8001FF8C 3C04800F */   lui       $a0, %hi(D_800E98EE)
/* 20B90 8001FF90 3C03800F */  lui        $v1, %hi(show_verion_flag)
/* 20B94 8001FF94 24020001 */  addiu      $v0, $zero, 1
/* 20B98 8001FF98 A46298E4 */  sh         $v0, %lo(show_verion_flag)($v1)
.L8001FF9C:
/* 20B9C 8001FF9C 248498EE */  addiu      $a0, $a0, %lo(D_800E98EE)
/* 20BA0 8001FFA0 264598F0 */  addiu      $a1, $s2, -0x6710
/* 20BA4 8001FFA4 00003021 */  addu       $a2, $zero, $zero
/* 20BA8 8001FFA8 24070002 */  addiu      $a3, $zero, 2
/* 20BAC 8001FFAC 27A20028 */  addiu      $v0, $sp, 0x28
/* 20BB0 8001FFB0 24030001 */  addiu      $v1, $zero, 1
/* 20BB4 8001FFB4 AFA20010 */  sw         $v0, 0x10($sp)
/* 20BB8 8001FFB8 0C007DD6 */  jal        splashscreen_timer
/* 20BBC 8001FFBC AFA30014 */   sw        $v1, 0x14($sp)
.L8001FFC0:
/* 20BC0 8001FFC0 02002021 */  addu       $a0, $s0, $zero
/* 20BC4 8001FFC4 0C02713D */  jal        get_cont_aidyn
/* 20BC8 8001FFC8 00002821 */   addu      $a1, $zero, $zero
/* 20BCC 8001FFCC 1440FFEB */  bnez       $v0, .L8001FF7C
/* 20BD0 8001FFD0 8FA2002C */   lw        $v0, 0x2c($sp)
/* 20BD4 8001FFD4 0C0025B4 */  jal        get_hres
/* 20BD8 8001FFD8 263568A8 */   addiu     $s5, $s1, 0x68a8
/* 20BDC 8001FFDC 0C0025B7 */  jal        get_vres
/* 20BE0 8001FFE0 00408021 */   addu      $s0, $v0, $zero
/* 20BE4 8001FFE4 24050006 */  addiu      $a1, $zero, 6
/* 20BE8 8001FFE8 02003021 */  addu       $a2, $s0, $zero
/* 20BEC 8001FFEC 8FA40030 */  lw         $a0, 0x30($sp)
/* 20BF0 8001FFF0 0C0290ED */  jal        rsp_func
/* 20BF4 8001FFF4 00403821 */   addu      $a3, $v0, $zero
/* 20BF8 8001FFF8 0C0025B4 */  jal        get_hres
/* 20BFC 8001FFFC AFA20030 */   sw        $v0, 0x30($sp)
/* 20C00 80020000 0C0025B7 */  jal        get_vres
/* 20C04 80020004 00408021 */   addu      $s0, $v0, $zero
/* 20C08 80020008 00002821 */  addu       $a1, $zero, $zero
/* 20C0C 8002000C 00003021 */  addu       $a2, $zero, $zero
/* 20C10 80020010 8FA40030 */  lw         $a0, 0x30($sp)
/* 20C14 80020014 02003821 */  addu       $a3, $s0, $zero
/* 20C18 80020018 AFA20010 */  sw         $v0, 0x10($sp)
/* 20C1C 8002001C AFA00014 */  sw         $zero, 0x14($sp)
/* 20C20 80020020 AFA00018 */  sw         $zero, 0x18($sp)
/* 20C24 80020024 AFA0001C */  sw         $zero, 0x1c($sp)
/* 20C28 80020028 0C0299E5 */  jal        gsFadeInOut
/* 20C2C 8002002C AFA00020 */   sw        $zero, 0x20($sp)
/* 20C30 80020030 8EA41600 */  lw         $a0, 0x1600($s5)
/* 20C34 80020034 2405001D */  addiu      $a1, $zero, 0x1d
/* 20C38 80020038 0C02D0FD */  jal        font_func
/* 20C3C 8002003C AFA20030 */   sw        $v0, 0x30($sp)
/* 20C40 80020040 924398F0 */  lbu        $v1, -0x6710($s2)
/* 20C44 80020044 8EA21600 */  lw         $v0, 0x1600($s5)
/* 20C48 80020048 A043001C */  sb         $v1, 0x1c($v0)
/* 20C4C 8002004C A043001D */  sb         $v1, 0x1d($v0)
/* 20C50 80020050 A043001E */  sb         $v1, 0x1e($v0)
/* 20C54 80020054 A043001F */  sb         $v1, 0x1f($v0)
/* 20C58 80020058 96C498D4 */  lhu        $a0, -0x672c($s6)
/* 20C5C 8002005C 1480001D */  bnez       $a0, .L800200D4
/* 20C60 80020060 26B12078 */   addiu     $s1, $s5, 0x2078
/* 20C64 80020064 00008021 */  addu       $s0, $zero, $zero
/* 20C68 80020068 3C16800F */  lui        $s6, %hi(copyrightText)
/* 20C6C 8002006C 24150001 */  addiu      $s5, $zero, 1
/* 20C70 80020070 24120003 */  addiu      $s2, $zero, 3
/* 20C74 80020074 24110007 */  addiu      $s1, $zero, 7
/* 20C78 80020078 02802021 */  addu       $a0, $s4, $zero
.L8002007C:
/* 20C7C 8002007C 8EC398D0 */  lw         $v1, %lo(copyrightText)($s6)
/* 20C80 80020080 00101080 */  sll        $v0, $s0, 2
/* 20C84 80020084 00431021 */  addu       $v0, $v0, $v1
/* 20C88 80020088 8C460000 */  lw         $a2, ($v0)
/* 20C8C 8002008C 0C007F98 */  jal        print_copyright_line
/* 20C90 80020090 02602821 */   addu      $a1, $s3, $zero
/* 20C94 80020094 12150006 */  beq        $s0, $s5, .L800200B0
/* 20C98 80020098 97A2002A */   lhu       $v0, 0x2a($sp)
/* 20C9C 8002009C 12120005 */  beq        $s0, $s2, .L800200B4
/* 20CA0 800200A0 24420005 */   addiu     $v0, $v0, 5
/* 20CA4 800200A4 16110005 */  bne        $s0, $s1, .L800200BC
/* 20CA8 800200A8 26020001 */   addiu     $v0, $s0, 1
/* 20CAC 800200AC 97A2002A */  lhu        $v0, 0x2a($sp)
.L800200B0:
/* 20CB0 800200B0 24420005 */  addiu      $v0, $v0, 5
.L800200B4:
/* 20CB4 800200B4 A7A2002A */  sh         $v0, 0x2a($sp)
/* 20CB8 800200B8 26020001 */  addiu      $v0, $s0, 1
.L800200BC:
/* 20CBC 800200BC 3050FFFF */  andi       $s0, $v0, 0xffff
/* 20CC0 800200C0 2E03000C */  sltiu      $v1, $s0, 0xc
/* 20CC4 800200C4 1460FFED */  bnez       $v1, .L8002007C
/* 20CC8 800200C8 02802021 */   addu      $a0, $s4, $zero
/* 20CCC 800200CC 08008069 */  j          .L800201A4
/* 20CD0 800200D0 8FA30030 */   lw        $v1, 0x30($sp)
.L800200D4:
/* 20CD4 800200D4 02202021 */  addu       $a0, $s1, $zero
/* 20CD8 800200D8 3C05800E */  lui        $a1, %hi(D_800D9A28)
/* 20CDC 800200DC 24A59A28 */  addiu      $a1, $a1, %lo(D_800D9A28)
/* 20CE0 800200E0 3C120010 */  lui        $s2, 0x10
/* 20CE4 800200E4 3C108010 */  lui        $s0, %hi(clear_end)
/* 20CE8 800200E8 2610FA50 */  addiu      $s0, $s0, %lo(clear_end)
/* 20CEC 800200EC 3C028000 */  lui        $v0, %hi(romMain)
/* 20CF0 800200F0 24420400 */  addiu      $v0, $v0, %lo(romMain)
/* 20CF4 800200F4 02028023 */  subu       $s0, $s0, $v0
/* 20CF8 800200F8 26100400 */  addiu      $s0, $s0, 0x400
/* 20CFC 800200FC 0C0333AC */  jal        sprintf
/* 20D00 80020100 02129023 */   subu      $s2, $s0, $s2
/* 20D04 80020104 02802021 */  addu       $a0, $s4, $zero
/* 20D08 80020108 02602821 */  addu       $a1, $s3, $zero
/* 20D0C 8002010C 0C007F98 */  jal        print_copyright_line
/* 20D10 80020110 02203021 */   addu      $a2, $s1, $zero
/* 20D14 80020114 02202021 */  addu       $a0, $s1, $zero
/* 20D18 80020118 3C05800E */  lui        $a1, %hi(D_800D9A40)
/* 20D1C 8002011C 24A59A40 */  addiu      $a1, $a1, %lo(D_800D9A40)
/* 20D20 80020120 3C060010 */  lui        $a2, 0x10
/* 20D24 80020124 0C0333AC */  jal        sprintf
/* 20D28 80020128 3C070010 */   lui       $a3, 0x10
/* 20D2C 8002012C 02802021 */  addu       $a0, $s4, $zero
/* 20D30 80020130 02602821 */  addu       $a1, $s3, $zero
/* 20D34 80020134 0C007F98 */  jal        print_copyright_line
/* 20D38 80020138 02203021 */   addu      $a2, $s1, $zero
/* 20D3C 8002013C 02202021 */  addu       $a0, $s1, $zero
/* 20D40 80020140 3C05800E */  lui        $a1, %hi(D_800D9A54)
/* 20D44 80020144 24A59A54 */  addiu      $a1, $a1, %lo(D_800D9A54)
/* 20D48 80020148 02003021 */  addu       $a2, $s0, $zero
/* 20D4C 8002014C 0C0333AC */  jal        sprintf
/* 20D50 80020150 00C03821 */   addu      $a3, $a2, $zero
/* 20D54 80020154 02802021 */  addu       $a0, $s4, $zero
/* 20D58 80020158 02602821 */  addu       $a1, $s3, $zero
/* 20D5C 8002015C 0C007F98 */  jal        print_copyright_line
/* 20D60 80020160 02203021 */   addu      $a2, $s1, $zero
/* 20D64 80020164 02202021 */  addu       $a0, $s1, $zero
/* 20D68 80020168 3C05800E */  lui        $a1, %hi(D_800D9A6C)
/* 20D6C 8002016C 24A59A6C */  addiu      $a1, $a1, %lo(D_800D9A6C)
/* 20D70 80020170 02403021 */  addu       $a2, $s2, $zero
/* 20D74 80020174 0C0333AC */  jal        sprintf
/* 20D78 80020178 00C03821 */   addu      $a3, $a2, $zero
/* 20D7C 8002017C 02802021 */  addu       $a0, $s4, $zero
/* 20D80 80020180 02602821 */  addu       $a1, $s3, $zero
/* 20D84 80020184 0C007F98 */  jal        print_copyright_line
/* 20D88 80020188 02203021 */   addu      $a2, $s1, $zero
/* 20D8C 8002018C 3C02800F */  lui        $v0, %hi(D_800E98EE)
/* 20D90 80020190 944498EE */  lhu        $a0, %lo(D_800E98EE)($v0)
/* 20D94 80020194 24030001 */  addiu      $v1, $zero, 1
/* 20D98 80020198 50830001 */  beql       $a0, $v1, .L800201A0
/* 20D9C 8002019C AEA00034 */   sw        $zero, 0x34($s5)
.L800201A0:
/* 20DA0 800201A0 8FA30030 */  lw         $v1, 0x30($sp)
.L800201A4:
/* 20DA4 800201A4 93A20028 */  lbu        $v0, 0x28($sp)
/* 20DA8 800201A8 8FBF0058 */  lw         $ra, 0x58($sp)
/* 20DAC 800201AC 8FB60050 */  lw         $s6, 0x50($sp)
/* 20DB0 800201B0 8FB5004C */  lw         $s5, 0x4c($sp)
/* 20DB4 800201B4 8FB40048 */  lw         $s4, 0x48($sp)
/* 20DB8 800201B8 8FB30044 */  lw         $s3, 0x44($sp)
/* 20DBC 800201BC 8FB20040 */  lw         $s2, 0x40($sp)
/* 20DC0 800201C0 8FB1003C */  lw         $s1, 0x3c($sp)
/* 20DC4 800201C4 8FB00038 */  lw         $s0, 0x38($sp)
/* 20DC8 800201C8 AEE30000 */  sw         $v1, ($s7)
/* 20DCC 800201CC 8FB70054 */  lw         $s7, 0x54($sp)
/* 20DD0 800201D0 03E00008 */  jr         $ra
/* 20DD4 800201D4 27BD0060 */   addiu     $sp, $sp, 0x60

glabel show_n64_logo
/* 20DD8 800201D8 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 20DDC 800201DC AFB60088 */  sw         $s6, 0x88($sp)
/* 20DE0 800201E0 0080B021 */  addu       $s6, $a0, $zero
/* 20DE4 800201E4 3C02800E */  lui        $v0, 0x800e
/* 20DE8 800201E8 AFB20078 */  sw         $s2, 0x78($sp)
/* 20DEC 800201EC 3C12800F */  lui        $s2, 0x800f
/* 20DF0 800201F0 AFB00070 */  sw         $s0, 0x70($sp)
/* 20DF4 800201F4 3C10800F */  lui        $s0, 0x800f
/* 20DF8 800201F8 AFBF0090 */  sw         $ra, 0x90($sp)
/* 20DFC 800201FC AFB7008C */  sw         $s7, 0x8c($sp)
/* 20E00 80020200 AFB50084 */  sw         $s5, 0x84($sp)
/* 20E04 80020204 AFB40080 */  sw         $s4, 0x80($sp)
/* 20E08 80020208 AFB3007C */  sw         $s3, 0x7c($sp)
/* 20E0C 8002020C AFB10074 */  sw         $s1, 0x74($sp)
/* 20E10 80020210 F7B600A0 */  sdc1       $f22, 0xa0($sp)
/* 20E14 80020214 F7B40098 */  sdc1       $f20, 0x98($sp)
/* 20E18 80020218 8ED30000 */  lw         $s3, ($s6)
/* 20E1C 8002021C 904468C8 */  lbu        $a0, 0x68c8($v0)
/* 20E20 80020220 8E4398DC */  lw         $v1, -0x6724($s2)
/* 20E24 80020224 920298FA */  lbu        $v0, -0x6706($s0)
/* 20E28 80020228 3C11800F */  lui        $s1, 0x800f
/* 20E2C 8002022C A3A40068 */  sb         $a0, 0x68($sp)
/* 20E30 80020230 A062005B */  sb         $v0, 0x5b($v1)
/* 20E34 80020234 A062005A */  sb         $v0, 0x5a($v1)
/* 20E38 80020238 A0620059 */  sb         $v0, 0x59($v1)
/* 20E3C 8002023C A0620058 */  sb         $v0, 0x58($v1)
/* 20E40 80020240 8E2498D8 */  lw         $a0, -0x6728($s1)
/* 20E44 80020244 920598FA */  lbu        $a1, -0x6706($s0)
/* 20E48 80020248 240200FF */  addiu      $v0, $zero, 0xff
/* 20E4C 8002024C AFA20010 */  sw         $v0, 0x10($sp)
/* 20E50 80020250 00A03021 */  addu       $a2, $a1, $zero
/* 20E54 80020254 0C02A0B3 */  jal        set_anidat_color
/* 20E58 80020258 00A03821 */   addu      $a3, $a1, $zero
/* 20E5C 8002025C 3C02800F */  lui        $v0, %hi(n64_logo_float)
/* 20E60 80020260 0240B821 */  addu       $s7, $s2, $zero
/* 20E64 80020264 0200A821 */  addu       $s5, $s0, $zero
/* 20E68 80020268 0220A021 */  addu       $s4, $s1, $zero
/* 20E6C 8002026C C44098F4 */  lwc1       $f0, %lo(n64_logo_float)($v0)
/* 20E70 80020270 3C01800E */  lui        $at, %hi(D_800D9A80)
/* 20E74 80020274 C4229A80 */  lwc1       $f2, %lo(D_800D9A80)($at)
/* 20E78 80020278 3C01800E */  lui        $at, %hi(D_800D9A84)
/* 20E7C 8002027C C4369A84 */  lwc1       $f22, %lo(D_800D9A84)($at)
/* 20E80 80020280 4600103C */  c.lt.s     $f2, $f0
/* 20E84 80020284 00000000 */  nop
/* 20E88 80020288 45000003 */  bc1f       .L80020298
/* 20E8C 8002028C 00409021 */   addu      $s2, $v0, $zero
/* 20E90 80020290 46020001 */  sub.s      $f0, $f0, $f2
/* 20E94 80020294 E64098F4 */  swc1       $f0, -0x670c($s2)
.L80020298:
/* 20E98 80020298 C65498F4 */  lwc1       $f20, -0x670c($s2)
/* 20E9C 8002029C 3C01800E */  lui        $at, %hi(D_800D9A88)
/* 20EA0 800202A0 C4209A88 */  lwc1       $f0, %lo(D_800D9A88)($at)
/* 20EA4 800202A4 4600A502 */  mul.s      $f20, $f20, $f0
/* 20EA8 800202A8 0C03328C */  jal        __sinf
/* 20EAC 800202AC 4600A306 */   mov.s     $f12, $f20
/* 20EB0 800202B0 4600A306 */  mov.s      $f12, $f20
/* 20EB4 800202B4 46160002 */  mul.s      $f0, $f0, $f22
/* 20EB8 800202B8 3C10800F */  lui        $s0, %hi(n64LogoVec3)
/* 20EBC 800202BC 3C01800E */  lui        $at, %hi(D_800D9A8C)
/* 20EC0 800202C0 C4229A8C */  lwc1       $f2, %lo(D_800D9A8C)($at)
/* 20EC4 800202C4 261153C0 */  addiu      $s1, $s0, %lo(n64LogoVec3)
/* 20EC8 800202C8 E6220004 */  swc1       $f2, 4($s1)
/* 20ECC 800202CC 0C02FB50 */  jal        __cosf
/* 20ED0 800202D0 E60053C0 */   swc1      $f0, 0x53c0($s0)
/* 20ED4 800202D4 46160002 */  mul.s      $f0, $f0, $f22
/* 20ED8 800202D8 C60253C0 */  lwc1       $f2, 0x53c0($s0)
/* 20EDC 800202DC C6240004 */  lwc1       $f4, 4($s1)
/* 20EE0 800202E0 46001087 */  neg.s      $f2, $f2
/* 20EE4 800202E4 46002107 */  neg.s      $f4, $f4
/* 20EE8 800202E8 E7A20028 */  swc1       $f2, 0x28($sp)
/* 20EEC 800202EC E7A4002C */  swc1       $f4, 0x2c($sp)
/* 20EF0 800202F0 E6200008 */  swc1       $f0, 8($s1)
/* 20EF4 800202F4 46000007 */  neg.s      $f0, $f0
/* 20EF8 800202F8 E7A00030 */  swc1       $f0, 0x30($sp)
/* 20EFC 800202FC 080080D5 */  j          .L80020354
/* 20F00 80020300 27B1006C */   addiu     $s1, $sp, 0x6c
.L80020304:
/* 20F04 80020304 248498F8 */  addiu      $a0, $a0, -0x6708
/* 20F08 80020308 26A598FA */  addiu      $a1, $s5, -0x6706
/* 20F0C 8002030C 00003021 */  addu       $a2, $zero, $zero
/* 20F10 80020310 24070002 */  addiu      $a3, $zero, 2
/* 20F14 80020314 27A20068 */  addiu      $v0, $sp, 0x68
/* 20F18 80020318 24030002 */  addiu      $v1, $zero, 2
/* 20F1C 8002031C AFA20010 */  sw         $v0, 0x10($sp)
/* 20F20 80020320 0C007DD6 */  jal        splashscreen_timer
/* 20F24 80020324 AFA30014 */   sw        $v1, 0x14($sp)
/* 20F28 80020328 C64098F4 */  lwc1       $f0, -0x670c($s2)
/* 20F2C 8002032C 3C01800E */  lui        $at, %hi(D_800D9A90)
/* 20F30 80020330 D4229A90 */  ldc1       $f2, %lo(D_800D9A90)($at)
/* 20F34 80020334 8FA2006C */  lw         $v0, 0x6c($sp)
/* 20F38 80020338 46000021 */  cvt.d.s    $f0, $f0
/* 20F3C 8002033C 46220000 */  add.d      $f0, $f0, $f2
/* 20F40 80020340 8C44000C */  lw         $a0, 0xc($v0)
/* 20F44 80020344 8C450008 */  lw         $a1, 8($v0)
/* 20F48 80020348 46200020 */  cvt.s.d    $f0, $f0
/* 20F4C 8002034C 0C007DD4 */  jal        NOOP
/* 20F50 80020350 E64098F4 */   swc1      $f0, -0x670c($s2)
.L80020354:
/* 20F54 80020354 02202021 */  addu       $a0, $s1, $zero
/* 20F58 80020358 0C02713D */  jal        get_cont_aidyn
/* 20F5C 8002035C 00002821 */   addu      $a1, $zero, $zero
/* 20F60 80020360 5440FFE8 */  bnel       $v0, $zero, .L80020304
/* 20F64 80020364 3C04800F */   lui       $a0, 0x800f
/* 20F68 80020368 02602021 */  addu       $a0, $s3, $zero
/* 20F6C 8002036C 00002821 */  addu       $a1, $zero, $zero
/* 20F70 80020370 00003021 */  addu       $a2, $zero, $zero
/* 20F74 80020374 24070140 */  addiu      $a3, $zero, 0x140
/* 20F78 80020378 241100F0 */  addiu      $s1, $zero, 0xf0
/* 20F7C 8002037C 0C0023E5 */  jal        some_rsp_func
/* 20F80 80020380 AFB10010 */   sw        $s1, 0x10($sp)
/* 20F84 80020384 260353C0 */  addiu      $v1, $s0, 0x53c0
/* 20F88 80020388 8E8498D8 */  lw         $a0, -0x6728($s4)
/* 20F8C 8002038C 8E0553C0 */  lw         $a1, 0x53c0($s0)
/* 20F90 80020390 8C660004 */  lw         $a2, 4($v1)
/* 20F94 80020394 8C670008 */  lw         $a3, 8($v1)
/* 20F98 80020398 C7A00028 */  lwc1       $f0, 0x28($sp)
/* 20F9C 8002039C C7A2002C */  lwc1       $f2, 0x2c($sp)
/* 20FA0 800203A0 C7A40030 */  lwc1       $f4, 0x30($sp)
/* 20FA4 800203A4 3C01800E */  lui        $at, %hi(D_800D9A98)
/* 20FA8 800203A8 C4269A98 */  lwc1       $f6, %lo(D_800D9A98)($at)
/* 20FAC 800203AC 00409821 */  addu       $s3, $v0, $zero
/* 20FB0 800203B0 AFA0001C */  sw         $zero, 0x1c($sp)
/* 20FB4 800203B4 AFA00024 */  sw         $zero, 0x24($sp)
/* 20FB8 800203B8 E7A00010 */  swc1       $f0, 0x10($sp)
/* 20FBC 800203BC E7A20014 */  swc1       $f2, 0x14($sp)
/* 20FC0 800203C0 E7A40018 */  swc1       $f4, 0x18($sp)
/* 20FC4 800203C4 0C029ED8 */  jal        animationData_math_func
/* 20FC8 800203C8 E7A60020 */   swc1      $f6, 0x20($sp)
/* 20FCC 800203CC 0C02837D */  jal        func_800A0DF4
/* 20FD0 800203D0 8E8498D8 */   lw        $a0, -0x6728($s4)
/* 20FD4 800203D4 8E8598D8 */  lw         $a1, -0x6728($s4)
/* 20FD8 800203D8 0C02855B */  jal        gsAnimationDataMtx
/* 20FDC 800203DC 02602021 */   addu      $a0, $s3, $zero
/* 20FE0 800203E0 8E8598D8 */  lw         $a1, -0x6728($s4)
/* 20FE4 800203E4 0C028369 */  jal        func_800A0DA4
/* 20FE8 800203E8 00402021 */   addu      $a0, $v0, $zero
/* 20FEC 800203EC 0C0025B4 */  jal        get_hres
/* 20FF0 800203F0 00409821 */   addu      $s3, $v0, $zero
/* 20FF4 800203F4 0C0025B7 */  jal        get_vres
/* 20FF8 800203F8 00408021 */   addu      $s0, $v0, $zero
/* 20FFC 800203FC 02602021 */  addu       $a0, $s3, $zero
/* 21000 80020400 24050006 */  addiu      $a1, $zero, 6
/* 21004 80020404 02003021 */  addu       $a2, $s0, $zero
/* 21008 80020408 0C0290ED */  jal        rsp_func
/* 2100C 8002040C 00403821 */   addu      $a3, $v0, $zero
/* 21010 80020410 00402821 */  addu       $a1, $v0, $zero
/* 21014 80020414 8EE898DC */  lw         $t0, -0x6724($s7)
/* 21018 80020418 00003021 */  addu       $a2, $zero, $zero
/* 2101C 8002041C 8D030078 */  lw         $v1, 0x78($t0)
/* 21020 80020420 00003821 */  addu       $a3, $zero, $zero
/* 21024 80020424 84640040 */  lh         $a0, 0x40($v1)
/* 21028 80020428 24020140 */  addiu      $v0, $zero, 0x140
/* 2102C 8002042C AFA20010 */  sw         $v0, 0x10($sp)
/* 21030 80020430 AFB10014 */  sw         $s1, 0x14($sp)
/* 21034 80020434 8C620044 */  lw         $v0, 0x44($v1)
/* 21038 80020438 0040F809 */  jalr       $v0
/* 2103C 8002043C 01042021 */   addu      $a0, $t0, $a0
/* 21040 80020440 AEC20000 */  sw         $v0, ($s6)
/* 21044 80020444 93A20068 */  lbu        $v0, 0x68($sp)
/* 21048 80020448 8FBF0090 */  lw         $ra, 0x90($sp)
/* 2104C 8002044C 8FB7008C */  lw         $s7, 0x8c($sp)
/* 21050 80020450 8FB60088 */  lw         $s6, 0x88($sp)
/* 21054 80020454 8FB50084 */  lw         $s5, 0x84($sp)
/* 21058 80020458 8FB40080 */  lw         $s4, 0x80($sp)
/* 2105C 8002045C 8FB3007C */  lw         $s3, 0x7c($sp)
/* 21060 80020460 8FB20078 */  lw         $s2, 0x78($sp)
/* 21064 80020464 8FB10074 */  lw         $s1, 0x74($sp)
/* 21068 80020468 8FB00070 */  lw         $s0, 0x70($sp)
/* 2106C 8002046C D7B600A0 */  ldc1       $f22, 0xa0($sp)
/* 21070 80020470 D7B40098 */  ldc1       $f20, 0x98($sp)
/* 21074 80020474 03E00008 */  jr         $ra
/* 21078 80020478 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel show_THQ_logo
/* 2107C 8002047C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 21080 80020480 AFB40038 */  sw         $s4, 0x38($sp)
/* 21084 80020484 0080A021 */  addu       $s4, $a0, $zero
/* 21088 80020488 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2108C 8002048C 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* 21090 80020490 AFBF003C */  sw         $ra, 0x3c($sp)
/* 21094 80020494 AFB30034 */  sw         $s3, 0x34($sp)
/* 21098 80020498 AFB20030 */  sw         $s2, 0x30($sp)
/* 2109C 8002049C AFB1002C */  sw         $s1, 0x2c($sp)
/* 210A0 800204A0 AFB00028 */  sw         $s0, 0x28($sp)
/* 210A4 800204A4 8E840000 */  lw         $a0, ($s4)
/* 210A8 800204A8 90650020 */  lbu        $a1, 0x20($v1)
/* 210AC 800204AC AFA40020 */  sw         $a0, 0x20($sp)
/* 210B0 800204B0 A3A50018 */  sb         $a1, 0x18($sp)
/* 210B4 800204B4 00409821 */  addu       $s3, $v0, $zero
/* 210B8 800204B8 3C12800F */  lui        $s2, %hi(THQLogoAlpha)
/* 210BC 800204BC 27B0001C */  addiu      $s0, $sp, 0x1c
/* 210C0 800204C0 0800813F */  j          .L800204FC
/* 210C4 800204C4 27B10020 */   addiu     $s1, $sp, 0x20
.L800204C8:
/* 210C8 800204C8 248498FC */  addiu      $a0, $a0, -0x6704
/* 210CC 800204CC 264598FE */  addiu      $a1, $s2, %lo(THQLogoAlpha)
/* 210D0 800204D0 00003021 */  addu       $a2, $zero, $zero
/* 210D4 800204D4 27A20018 */  addiu      $v0, $sp, 0x18
/* 210D8 800204D8 24030003 */  addiu      $v1, $zero, 3
/* 210DC 800204DC 24070002 */  addiu      $a3, $zero, 2
/* 210E0 800204E0 AFA20010 */  sw         $v0, 0x10($sp)
/* 210E4 800204E4 0C007DD6 */  jal        splashscreen_timer
/* 210E8 800204E8 AFA30014 */   sw        $v1, 0x14($sp)
/* 210EC 800204EC 8FA2001C */  lw         $v0, 0x1c($sp)
/* 210F0 800204F0 8C44000C */  lw         $a0, 0xc($v0)
/* 210F4 800204F4 0C007DD4 */  jal        NOOP
/* 210F8 800204F8 8C450008 */   lw        $a1, 8($v0)
.L800204FC:
/* 210FC 800204FC 02002021 */  addu       $a0, $s0, $zero
/* 21100 80020500 0C02713D */  jal        get_cont_aidyn
/* 21104 80020504 00002821 */   addu      $a1, $zero, $zero
/* 21108 80020508 1440FFEF */  bnez       $v0, .L800204C8
/* 2110C 8002050C 3C04800F */   lui       $a0, 0x800f
/* 21110 80020510 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 21114 80020514 924598FE */  lbu        $a1, -0x6702($s2)
/* 21118 80020518 8C460024 */  lw         $a2, 0x24($v0)
/* 2111C 8002051C 0C007F2C */  jal        splashScreen_borg8
/* 21120 80020520 02202021 */   addu      $a0, $s1, $zero
/* 21124 80020524 924598FE */  lbu        $a1, -0x6702($s2)
/* 21128 80020528 0C007DA4 */  jal        SplashScreen_ShowVerion
/* 2112C 8002052C 02202021 */   addu      $a0, $s1, $zero
/* 21130 80020530 8FA20020 */  lw         $v0, 0x20($sp)
/* 21134 80020534 AE820000 */  sw         $v0, ($s4)
/* 21138 80020538 93A30018 */  lbu        $v1, 0x18($sp)
/* 2113C 8002053C 24020003 */  addiu      $v0, $zero, 3
/* 21140 80020540 50620001 */  beql       $v1, $v0, .L80020548
/* 21144 80020544 A24098FE */   sb        $zero, -0x6702($s2)
.L80020548:
/* 21148 80020548 93A20018 */  lbu        $v0, 0x18($sp)
/* 2114C 8002054C 8FBF003C */  lw         $ra, 0x3c($sp)
/* 21150 80020550 8FB40038 */  lw         $s4, 0x38($sp)
/* 21154 80020554 8FB30034 */  lw         $s3, 0x34($sp)
/* 21158 80020558 8FB20030 */  lw         $s2, 0x30($sp)
/* 2115C 8002055C 8FB1002C */  lw         $s1, 0x2c($sp)
/* 21160 80020560 8FB00028 */  lw         $s0, 0x28($sp)
/* 21164 80020564 03E00008 */  jr         $ra
/* 21168 80020568 27BD0040 */   addiu     $sp, $sp, 0x40

glabel show_h2O_logo
/* 2116C 8002056C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 21170 80020570 AFB40038 */  sw         $s4, 0x38($sp)
/* 21174 80020574 0080A021 */  addu       $s4, $a0, $zero
/* 21178 80020578 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2117C 8002057C 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* 21180 80020580 AFBF003C */  sw         $ra, 0x3c($sp)
/* 21184 80020584 AFB30034 */  sw         $s3, 0x34($sp)
/* 21188 80020588 AFB20030 */  sw         $s2, 0x30($sp)
/* 2118C 8002058C AFB1002C */  sw         $s1, 0x2c($sp)
/* 21190 80020590 AFB00028 */  sw         $s0, 0x28($sp)
/* 21194 80020594 8E840000 */  lw         $a0, ($s4)
/* 21198 80020598 90650020 */  lbu        $a1, 0x20($v1)
/* 2119C 8002059C AFA40020 */  sw         $a0, 0x20($sp)
/* 211A0 800205A0 A3A50018 */  sb         $a1, 0x18($sp)
/* 211A4 800205A4 00409821 */  addu       $s3, $v0, $zero
/* 211A8 800205A8 3C12800F */  lui        $s2, 0x800f
/* 211AC 800205AC 27B0001C */  addiu      $s0, $sp, 0x1c
/* 211B0 800205B0 0800817A */  j          .L800205E8
/* 211B4 800205B4 27B10020 */   addiu     $s1, $sp, 0x20
.L800205B8:
/* 211B8 800205B8 8C44000C */  lw         $a0, 0xc($v0)
/* 211BC 800205BC 0C007DD4 */  jal        NOOP
/* 211C0 800205C0 8C450008 */   lw        $a1, 8($v0)
/* 211C4 800205C4 3C04800F */  lui        $a0, %hi(D_800E9900)
/* 211C8 800205C8 24849900 */  addiu      $a0, $a0, %lo(D_800E9900)
/* 211CC 800205CC 26459902 */  addiu      $a1, $s2, -0x66fe
/* 211D0 800205D0 00003021 */  addu       $a2, $zero, $zero
/* 211D4 800205D4 27A20018 */  addiu      $v0, $sp, 0x18
/* 211D8 800205D8 24070002 */  addiu      $a3, $zero, 2
/* 211DC 800205DC AFA20010 */  sw         $v0, 0x10($sp)
/* 211E0 800205E0 0C007DD6 */  jal        splashscreen_timer
/* 211E4 800205E4 AFA00014 */   sw        $zero, 0x14($sp)
.L800205E8:
/* 211E8 800205E8 02002021 */  addu       $a0, $s0, $zero
/* 211EC 800205EC 0C02713D */  jal        get_cont_aidyn
/* 211F0 800205F0 00002821 */   addu      $a1, $zero, $zero
/* 211F4 800205F4 1440FFF0 */  bnez       $v0, .L800205B8
/* 211F8 800205F8 8FA2001C */   lw        $v0, 0x1c($sp)
/* 211FC 800205FC 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 21200 80020600 92459902 */  lbu        $a1, -0x66fe($s2)
/* 21204 80020604 8C460028 */  lw         $a2, 0x28($v0)
/* 21208 80020608 0C007F2C */  jal        splashScreen_borg8
/* 2120C 8002060C 02202021 */   addu      $a0, $s1, $zero
/* 21210 80020610 92459902 */  lbu        $a1, -0x66fe($s2)
/* 21214 80020614 0C007DA4 */  jal        SplashScreen_ShowVerion
/* 21218 80020618 02202021 */   addu      $a0, $s1, $zero
/* 2121C 8002061C 8FA20020 */  lw         $v0, 0x20($sp)
/* 21220 80020620 93A30018 */  lbu        $v1, 0x18($sp)
/* 21224 80020624 14600002 */  bnez       $v1, .L80020630
/* 21228 80020628 AE820000 */   sw        $v0, ($s4)
/* 2122C 8002062C A2409902 */  sb         $zero, -0x66fe($s2)
.L80020630:
/* 21230 80020630 93A20018 */  lbu        $v0, 0x18($sp)
/* 21234 80020634 8FBF003C */  lw         $ra, 0x3c($sp)
/* 21238 80020638 8FB40038 */  lw         $s4, 0x38($sp)
/* 2123C 8002063C 8FB30034 */  lw         $s3, 0x34($sp)
/* 21240 80020640 8FB20030 */  lw         $s2, 0x30($sp)
/* 21244 80020644 8FB1002C */  lw         $s1, 0x2c($sp)
/* 21248 80020648 8FB00028 */  lw         $s0, 0x28($sp)
/* 2124C 8002064C 03E00008 */  jr         $ra
/* 21250 80020650 27BD0040 */   addiu     $sp, $sp, 0x40
/* 21254 80020654 00000000 */  nop
/* 21258 80020658 00000000 */  nop
/* 2125C 8002065C 00000000 */  nop
