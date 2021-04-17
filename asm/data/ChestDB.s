.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel chestdb_ofunc
/* 75280 80074680 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 75284 80074684 AFB00018 */  sw         $s0, 0x18($sp)
/* 75288 80074688 00808021 */  addu       $s0, $a0, $zero
/* 7528C 8007468C 3C04B1FE */  lui        $a0, %hi(chestdb)
/* 75290 80074690 24840F60 */  addiu      $a0, $a0, %lo(chestdb)
/* 75294 80074694 02002821 */  addu       $a1, $s0, $zero
/* 75298 80074698 27A60010 */  addiu      $a2, $sp, 0x10
/* 7529C 8007469C AFBF001C */  sw         $ra, 0x1c($sp)
/* 752A0 800746A0 0C01D30C */  jal        load_db_array_size
/* 752A4 800746A4 AFA00010 */   sw        $zero, 0x10($sp)
/* 752A8 800746A8 3C05800E */  lui        $a1, %hi(D_800DFDF0)
/* 752AC 800746AC 24A5FDF0 */  addiu      $a1, $a1, %lo(D_800DFDF0)
/* 752B0 800746B0 92020000 */  lbu        $v0, ($s0)
/* 752B4 800746B4 24060036 */  addiu      $a2, $zero, 0x36
/* 752B8 800746B8 000220C0 */  sll        $a0, $v0, 3
/* 752BC 800746BC 00822023 */  subu       $a0, $a0, $v0
/* 752C0 800746C0 00042080 */  sll        $a0, $a0, 2
/* 752C4 800746C4 00822021 */  addu       $a0, $a0, $v0
/* 752C8 800746C8 0C025F9C */  jal        Malloc
/* 752CC 800746CC 00042040 */   sll       $a0, $a0, 1
/* 752D0 800746D0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 752D4 800746D4 AE020004 */  sw         $v0, 4($s0)
/* 752D8 800746D8 8FB00018 */  lw         $s0, 0x18($sp)
/* 752DC 800746DC 03E00008 */  jr         $ra
/* 752E0 800746E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel load_chestDB
/* 752E4 800746E4 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 752E8 800746E8 AFBF0064 */  sw         $ra, 0x64($sp)
/* 752EC 800746EC AFB20060 */  sw         $s2, 0x60($sp)
/* 752F0 800746F0 AFB1005C */  sw         $s1, 0x5c($sp)
/* 752F4 800746F4 AFB00058 */  sw         $s0, 0x58($sp)
/* 752F8 800746F8 8C900004 */  lw         $s0, 4($a0)
/* 752FC 800746FC 27A40018 */  addiu      $a0, $sp, 0x18
/* 75300 80074700 00C09021 */  addu       $s2, $a2, $zero
/* 75304 80074704 24060038 */  addiu      $a2, $zero, 0x38
/* 75308 80074708 3C02800E */  lui        $v0, %hi(D_800DFDF0)
/* 7530C 8007470C 2442FDF0 */  addiu      $v0, $v0, %lo(D_800DFDF0)
/* 75310 80074710 24030047 */  addiu      $v1, $zero, 0x47
/* 75314 80074714 30A700FF */  andi       $a3, $a1, 0xff
/* 75318 80074718 3C05B1FE */  lui        $a1, %hi(chestdb)
/* 7531C 8007471C 24A50F60 */  addiu      $a1, $a1, %lo(chestdb)
/* 75320 80074720 AFA20010 */  sw         $v0, 0x10($sp)
/* 75324 80074724 000710C0 */  sll        $v0, $a3, 3
/* 75328 80074728 00471023 */  subu       $v0, $v0, $a3
/* 7532C 8007472C 00021080 */  sll        $v0, $v0, 2
/* 75330 80074730 00471021 */  addu       $v0, $v0, $a3
/* 75334 80074734 00021040 */  sll        $v0, $v0, 1
/* 75338 80074738 AFA30014 */  sw         $v1, 0x14($sp)
/* 7533C 8007473C 8E510000 */  lw         $s1, ($s2)
/* 75340 80074740 24070001 */  addiu      $a3, $zero, 1
/* 75344 80074744 02252821 */  addu       $a1, $s1, $a1
/* 75348 80074748 0C027269 */  jal        RomCopy
/* 7534C 8007474C 02028021 */   addu      $s0, $s0, $v0
/* 75350 80074750 02002021 */  addu       $a0, $s0, $zero
/* 75354 80074754 27A50018 */  addiu      $a1, $sp, 0x18
/* 75358 80074758 0C033547 */  jal        memcpy
/* 7535C 8007475C 24060014 */   addiu     $a2, $zero, 0x14
/* 75360 80074760 2604001E */  addiu      $a0, $s0, 0x1e
/* 75364 80074764 A2000014 */  sb         $zero, 0x14($s0)
/* 75368 80074768 93A2002D */  lbu        $v0, 0x2d($sp)
/* 7536C 8007476C 93A3002C */  lbu        $v1, 0x2c($sp)
/* 75370 80074770 00021200 */  sll        $v0, $v0, 8
/* 75374 80074774 00621821 */  addu       $v1, $v1, $v0
/* 75378 80074778 A6030016 */  sh         $v1, 0x16($s0)
/* 7537C 8007477C 93A2002F */  lbu        $v0, 0x2f($sp)
/* 75380 80074780 93A3002E */  lbu        $v1, 0x2e($sp)
/* 75384 80074784 00021200 */  sll        $v0, $v0, 8
/* 75388 80074788 00621821 */  addu       $v1, $v1, $v0
/* 7538C 8007478C A6030018 */  sh         $v1, 0x18($s0)
/* 75390 80074790 93A20031 */  lbu        $v0, 0x31($sp)
/* 75394 80074794 93A30030 */  lbu        $v1, 0x30($sp)
/* 75398 80074798 00021200 */  sll        $v0, $v0, 8
/* 7539C 8007479C 00621821 */  addu       $v1, $v1, $v0
/* 753A0 800747A0 A603001A */  sh         $v1, 0x1a($s0)
/* 753A4 800747A4 93A20032 */  lbu        $v0, 0x32($sp)
/* 753A8 800747A8 27A50034 */  addiu      $a1, $sp, 0x34
/* 753AC 800747AC A202001C */  sb         $v0, 0x1c($s0)
/* 753B0 800747B0 93A30033 */  lbu        $v1, 0x33($sp)
/* 753B4 800747B4 24060003 */  addiu      $a2, $zero, 3
/* 753B8 800747B8 0C033547 */  jal        memcpy
/* 753BC 800747BC A203001D */   sb        $v1, 0x1d($s0)
/* 753C0 800747C0 24080022 */  addiu      $t0, $zero, 0x22
/* 753C4 800747C4 00004821 */  addu       $t1, $zero, $zero
/* 753C8 800747C8 260F0024 */  addiu      $t7, $s0, 0x24
/* 753CC 800747CC 27AB0018 */  addiu      $t3, $sp, 0x18
/* 753D0 800747D0 01605021 */  addu       $t2, $t3, $zero
/* 753D4 800747D4 93A20037 */  lbu        $v0, 0x37($sp)
/* 753D8 800747D8 260E0030 */  addiu      $t6, $s0, 0x30
/* 753DC 800747DC A2020021 */  sb         $v0, 0x21($s0)
/* 753E0 800747E0 93A30038 */  lbu        $v1, 0x38($sp)
/* 753E4 800747E4 260D0036 */  addiu      $t5, $s0, 0x36
/* 753E8 800747E8 A2030022 */  sb         $v1, 0x22($s0)
/* 753EC 800747EC 93A20039 */  lbu        $v0, 0x39($sp)
/* 753F0 800747F0 260C0038 */  addiu      $t4, $s0, 0x38
/* 753F4 800747F4 A2020023 */  sb         $v0, 0x23($s0)
/* 753F8 800747F8 01003821 */  addu       $a3, $t0, $zero
.L800747FC:
/* 753FC 800747FC 24E20001 */  addiu      $v0, $a3, 1
/* 75400 80074800 304800FF */  andi       $t0, $v0, 0xff
/* 75404 80074804 01002021 */  addu       $a0, $t0, $zero
/* 75408 80074808 24820001 */  addiu      $v0, $a0, 1
/* 7540C 8007480C 304800FF */  andi       $t0, $v0, 0xff
/* 75410 80074810 01003021 */  addu       $a2, $t0, $zero
/* 75414 80074814 24C20001 */  addiu      $v0, $a2, 1
/* 75418 80074818 304800FF */  andi       $t0, $v0, 0xff
/* 7541C 8007481C 00092840 */  sll        $a1, $t1, 1
/* 75420 80074820 01E52821 */  addu       $a1, $t7, $a1
/* 75424 80074824 01473821 */  addu       $a3, $t2, $a3
/* 75428 80074828 01442021 */  addu       $a0, $t2, $a0
/* 7542C 8007482C 01463021 */  addu       $a2, $t2, $a2
/* 75430 80074830 90820000 */  lbu        $v0, ($a0)
/* 75434 80074834 90E30000 */  lbu        $v1, ($a3)
/* 75438 80074838 00021200 */  sll        $v0, $v0, 8
/* 7543C 8007483C 00621821 */  addu       $v1, $v1, $v0
/* 75440 80074840 A4A30000 */  sh         $v1, ($a1)
/* 75444 80074844 90C30000 */  lbu        $v1, ($a2)
/* 75448 80074848 01C91021 */  addu       $v0, $t6, $t1
/* 7544C 8007484C A0430000 */  sb         $v1, ($v0)
/* 75450 80074850 2D220002 */  sltiu      $v0, $t1, 2
/* 75454 80074854 1040000E */  beqz       $v0, .L80074890
/* 75458 80074858 01001821 */   addu      $v1, $t0, $zero
/* 7545C 8007485C 25020001 */  addiu      $v0, $t0, 1
/* 75460 80074860 304800FF */  andi       $t0, $v0, 0xff
/* 75464 80074864 01002821 */  addu       $a1, $t0, $zero
/* 75468 80074868 24A20001 */  addiu      $v0, $a1, 1
/* 7546C 8007486C 304800FF */  andi       $t0, $v0, 0xff
/* 75470 80074870 01631821 */  addu       $v1, $t3, $v1
/* 75474 80074874 01A91021 */  addu       $v0, $t5, $t1
/* 75478 80074878 90640000 */  lbu        $a0, ($v1)
/* 7547C 8007487C 01652821 */  addu       $a1, $t3, $a1
/* 75480 80074880 A0440000 */  sb         $a0, ($v0)
/* 75484 80074884 90A30000 */  lbu        $v1, ($a1)
/* 75488 80074888 01891021 */  addu       $v0, $t4, $t1
/* 7548C 8007488C A0430000 */  sb         $v1, ($v0)
.L80074890:
/* 75490 80074890 25220001 */  addiu      $v0, $t1, 1
/* 75494 80074894 304900FF */  andi       $t1, $v0, 0xff
/* 75498 80074898 2D230006 */  sltiu      $v1, $t1, 6
/* 7549C 8007489C 1460FFD7 */  bnez       $v1, .L800747FC
/* 754A0 800748A0 01003821 */   addu      $a3, $t0, $zero
/* 754A4 800748A4 8FBF0064 */  lw         $ra, 0x64($sp)
/* 754A8 800748A8 26220038 */  addiu      $v0, $s1, 0x38
/* 754AC 800748AC AE420000 */  sw         $v0, ($s2)
/* 754B0 800748B0 8FB20060 */  lw         $s2, 0x60($sp)
/* 754B4 800748B4 8FB1005C */  lw         $s1, 0x5c($sp)
/* 754B8 800748B8 8FB00058 */  lw         $s0, 0x58($sp)
/* 754BC 800748BC 03E00008 */  jr         $ra
/* 754C0 800748C0 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_800748C4
/* 754C4 800748C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 754C8 800748C8 00003021 */  addu       $a2, $zero, $zero
/* 754CC 800748CC 90820000 */  lbu        $v0, ($a0)
/* 754D0 800748D0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 754D4 800748D4 10400016 */  beqz       $v0, .L80074930
/* 754D8 800748D8 AFBF0018 */   sw        $ra, 0x18($sp)
/* 754DC 800748DC 3C02800F */  lui        $v0, %hi(lootList)
/* 754E0 800748E0 2447F820 */  addiu      $a3, $v0, %lo(lootList)
/* 754E4 800748E4 00C71021 */  addu       $v0, $a2, $a3
.L800748E8:
/* 754E8 800748E8 90430000 */  lbu        $v1, ($v0)
/* 754EC 800748EC 1465000B */  bne        $v1, $a1, .L8007491C
/* 754F0 800748F0 24C30001 */   addiu     $v1, $a2, 1
/* 754F4 800748F4 000610C0 */  sll        $v0, $a2, 3
/* 754F8 800748F8 00461023 */  subu       $v0, $v0, $a2
/* 754FC 800748FC 000210C0 */  sll        $v0, $v0, 3
/* 75500 80074900 24420004 */  addiu      $v0, $v0, 4
/* 75504 80074904 AFA20010 */  sw         $v0, 0x10($sp)
/* 75508 80074908 00C02821 */  addu       $a1, $a2, $zero
/* 7550C 8007490C 0C01D1B9 */  jal        load_chestDB
/* 75510 80074910 27A60010 */   addiu     $a2, $sp, 0x10
/* 75514 80074914 0801D24D */  j          .L80074934
/* 75518 80074918 8FBF0018 */   lw        $ra, 0x18($sp)
.L8007491C:
/* 7551C 8007491C 90820000 */  lbu        $v0, ($a0)
/* 75520 80074920 306600FF */  andi       $a2, $v1, 0xff
/* 75524 80074924 00C2102B */  sltu       $v0, $a2, $v0
/* 75528 80074928 1440FFEF */  bnez       $v0, .L800748E8
/* 7552C 8007492C 00C71021 */   addu      $v0, $a2, $a3
.L80074930:
/* 75530 80074930 8FBF0018 */  lw         $ra, 0x18($sp)
.L80074934:
/* 75534 80074934 03E00008 */  jr         $ra
/* 75538 80074938 27BD0020 */   addiu     $sp, $sp, 0x20

glabel item_chances
/* 7553C 8007493C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 75540 80074940 AFB10014 */  sw         $s1, 0x14($sp)
/* 75544 80074944 93B1004B */  lbu        $s1, 0x4b($sp)
/* 75548 80074948 AFB60028 */  sw         $s6, 0x28($sp)
/* 7554C 8007494C 8FB60050 */  lw         $s6, 0x50($sp)
/* 75550 80074950 AFB3001C */  sw         $s3, 0x1c($sp)
/* 75554 80074954 97B3004E */  lhu        $s3, 0x4e($sp)
/* 75558 80074958 AFB7002C */  sw         $s7, 0x2c($sp)
/* 7555C 8007495C 0080B821 */  addu       $s7, $a0, $zero
/* 75560 80074960 AFB00010 */  sw         $s0, 0x10($sp)
/* 75564 80074964 30B000FF */  andi       $s0, $a1, 0xff
/* 75568 80074968 AFB40020 */  sw         $s4, 0x20($sp)
/* 7556C 8007496C 30D400FF */  andi       $s4, $a2, 0xff
/* 75570 80074970 AFB50024 */  sw         $s5, 0x24($sp)
/* 75574 80074974 30F500FF */  andi       $s5, $a3, 0xff
/* 75578 80074978 AFBF0030 */  sw         $ra, 0x30($sp)
/* 7557C 8007497C AFB20018 */  sw         $s2, 0x18($sp)
/* 75580 80074980 12000014 */  beqz       $s0, .L800749D4
/* 75584 80074984 02209021 */   addu      $s2, $s1, $zero
/* 75588 80074988 24040001 */  addiu      $a0, $zero, 1
/* 7558C 8007498C 0C002D03 */  jal        RollD
/* 75590 80074990 24050064 */   addiu     $a1, $zero, 0x64
/* 75594 80074994 0202102B */  sltu       $v0, $s0, $v0
/* 75598 80074998 1440000F */  bnez       $v0, .L800749D8
/* 7559C 8007499C 02201021 */   addu      $v0, $s1, $zero
/* 755A0 800749A0 26220001 */  addiu      $v0, $s1, 1
/* 755A4 800749A4 305100FF */  andi       $s1, $v0, 0xff
/* 755A8 800749A8 00121880 */  sll        $v1, $s2, 2
/* 755AC 800749AC 2463001C */  addiu      $v1, $v1, 0x1c
/* 755B0 800749B0 02E38021 */  addu       $s0, $s7, $v1
/* 755B4 800749B4 24020001 */  addiu      $v0, $zero, 1
/* 755B8 800749B8 A6020002 */  sh         $v0, 2($s0)
/* 755BC 800749BC 12C00005 */  beqz       $s6, .L800749D4
/* 755C0 800749C0 A6130000 */   sh        $s3, ($s0)
/* 755C4 800749C4 02802021 */  addu       $a0, $s4, $zero
/* 755C8 800749C8 0C002CF7 */  jal        rand_range
/* 755CC 800749CC 02A02821 */   addu      $a1, $s5, $zero
/* 755D0 800749D0 A6020002 */  sh         $v0, 2($s0)
.L800749D4:
/* 755D4 800749D4 02201021 */  addu       $v0, $s1, $zero
.L800749D8:
/* 755D8 800749D8 8FBF0030 */  lw         $ra, 0x30($sp)
/* 755DC 800749DC 8FB7002C */  lw         $s7, 0x2c($sp)
/* 755E0 800749E0 8FB60028 */  lw         $s6, 0x28($sp)
/* 755E4 800749E4 8FB50024 */  lw         $s5, 0x24($sp)
/* 755E8 800749E8 8FB40020 */  lw         $s4, 0x20($sp)
/* 755EC 800749EC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 755F0 800749F0 8FB20018 */  lw         $s2, 0x18($sp)
/* 755F4 800749F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 755F8 800749F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 755FC 800749FC 03E00008 */  jr         $ra
/* 75600 80074A00 27BD0038 */   addiu     $sp, $sp, 0x38

glabel get_chest_loot
/* 75604 80074A04 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 75608 80074A08 AFB3002C */  sw         $s3, 0x2c($sp)
/* 7560C 80074A0C 00A09821 */  addu       $s3, $a1, $zero
/* 75610 80074A10 00002821 */  addu       $a1, $zero, $zero
/* 75614 80074A14 00003021 */  addu       $a2, $zero, $zero
/* 75618 80074A18 AFB10024 */  sw         $s1, 0x24($sp)
/* 7561C 80074A1C 00808821 */  addu       $s1, $a0, $zero
/* 75620 80074A20 AFBF0040 */  sw         $ra, 0x40($sp)
/* 75624 80074A24 AFB7003C */  sw         $s7, 0x3c($sp)
/* 75628 80074A28 AFB60038 */  sw         $s6, 0x38($sp)
/* 7562C 80074A2C AFB50034 */  sw         $s5, 0x34($sp)
/* 75630 80074A30 AFB40030 */  sw         $s4, 0x30($sp)
/* 75634 80074A34 AFB20028 */  sw         $s2, 0x28($sp)
/* 75638 80074A38 AFB00020 */  sw         $s0, 0x20($sp)
/* 7563C 80074A3C 96640010 */  lhu        $a0, 0x10($s3)
/* 75640 80074A40 0C01D77A */  jal        GetIDIndex
/* 75644 80074A44 00009021 */   addu      $s2, $zero, $zero
/* 75648 80074A48 000218C0 */  sll        $v1, $v0, 3
/* 7564C 80074A4C 00621823 */  subu       $v1, $v1, $v0
/* 75650 80074A50 00031880 */  sll        $v1, $v1, 2
/* 75654 80074A54 00621821 */  addu       $v1, $v1, $v0
/* 75658 80074A58 8E300004 */  lw         $s0, 4($s1)
/* 7565C 80074A5C 00031840 */  sll        $v1, $v1, 1
/* 75660 80074A60 02038021 */  addu       $s0, $s0, $v1
/* 75664 80074A64 26170030 */  addiu      $s7, $s0, 0x30
/* 75668 80074A68 26160036 */  addiu      $s6, $s0, 0x36
/* 7566C 80074A6C 26150038 */  addiu      $s5, $s0, 0x38
/* 75670 80074A70 96040018 */  lhu        $a0, 0x18($s0)
/* 75674 80074A74 9605001A */  lhu        $a1, 0x1a($s0)
/* 75678 80074A78 0C002CF7 */  jal        rand_range
/* 7567C 80074A7C 26140024 */   addiu     $s4, $s0, 0x24
/* 75680 80074A80 2404001E */  addiu      $a0, $zero, 0x1e
/* 75684 80074A84 24050020 */  addiu      $a1, $zero, 0x20
/* 75688 80074A88 00021040 */  sll        $v0, $v0, 1
/* 7568C 80074A8C 3C11800F */  lui        $s1, %hi(itemID_array)
/* 75690 80074A90 26311500 */  addiu      $s1, $s1, %lo(itemID_array)
/* 75694 80074A94 0C002CF7 */  jal        rand_range
/* 75698 80074A98 A6620016 */   sh        $v0, 0x16($s3)
/* 7569C 80074A9C 24030001 */  addiu      $v1, $zero, 1
/* 756A0 80074AA0 304200FF */  andi       $v0, $v0, 0xff
/* 756A4 80074AA4 00021040 */  sll        $v0, $v0, 1
/* 756A8 80074AA8 92050021 */  lbu        $a1, 0x21($s0)
/* 756AC 80074AAC 92060022 */  lbu        $a2, 0x22($s0)
/* 756B0 80074AB0 92070023 */  lbu        $a3, 0x23($s0)
/* 756B4 80074AB4 00511021 */  addu       $v0, $v0, $s1
/* 756B8 80074AB8 AFA00010 */  sw         $zero, 0x10($sp)
/* 756BC 80074ABC AFA30018 */  sw         $v1, 0x18($sp)
/* 756C0 80074AC0 94430000 */  lhu        $v1, ($v0)
/* 756C4 80074AC4 02602021 */  addu       $a0, $s3, $zero
/* 756C8 80074AC8 0C01D24F */  jal        item_chances
/* 756CC 80074ACC AFA30014 */   sw        $v1, 0x14($sp)
/* 756D0 80074AD0 00404021 */  addu       $t0, $v0, $zero
/* 756D4 80074AD4 02F21021 */  addu       $v0, $s7, $s2
.L80074AD8:
/* 756D8 80074AD8 02D21821 */  addu       $v1, $s6, $s2
/* 756DC 80074ADC 02B22021 */  addu       $a0, $s5, $s2
/* 756E0 80074AE0 90870000 */  lbu        $a3, ($a0)
/* 756E4 80074AE4 02602021 */  addu       $a0, $s3, $zero
/* 756E8 80074AE8 90450000 */  lbu        $a1, ($v0)
/* 756EC 80074AEC 00121040 */  sll        $v0, $s2, 1
/* 756F0 80074AF0 90660000 */  lbu        $a2, ($v1)
/* 756F4 80074AF4 02821021 */  addu       $v0, $s4, $v0
/* 756F8 80074AF8 AFA80010 */  sw         $t0, 0x10($sp)
/* 756FC 80074AFC 94480000 */  lhu        $t0, ($v0)
/* 75700 80074B00 2E430002 */  sltiu      $v1, $s2, 2
/* 75704 80074B04 AFA30018 */  sw         $v1, 0x18($sp)
/* 75708 80074B08 0C01D24F */  jal        item_chances
/* 7570C 80074B0C AFA80014 */   sw        $t0, 0x14($sp)
/* 75710 80074B10 00404021 */  addu       $t0, $v0, $zero
/* 75714 80074B14 26420001 */  addiu      $v0, $s2, 1
/* 75718 80074B18 3052FFFF */  andi       $s2, $v0, 0xffff
/* 7571C 80074B1C 2E430006 */  sltiu      $v1, $s2, 6
/* 75720 80074B20 5460FFED */  bnel       $v1, $zero, .L80074AD8
/* 75724 80074B24 02F21021 */   addu      $v0, $s7, $s2
/* 75728 80074B28 8FBF0040 */  lw         $ra, 0x40($sp)
/* 7572C 80074B2C 8FB7003C */  lw         $s7, 0x3c($sp)
/* 75730 80074B30 8FB60038 */  lw         $s6, 0x38($sp)
/* 75734 80074B34 8FB50034 */  lw         $s5, 0x34($sp)
/* 75738 80074B38 8FB40030 */  lw         $s4, 0x30($sp)
/* 7573C 80074B3C 8FB3002C */  lw         $s3, 0x2c($sp)
/* 75740 80074B40 8FB20028 */  lw         $s2, 0x28($sp)
/* 75744 80074B44 8FB10024 */  lw         $s1, 0x24($sp)
/* 75748 80074B48 8FB00020 */  lw         $s0, 0x20($sp)
/* 7574C 80074B4C 03E00008 */  jr         $ra
/* 75750 80074B50 27BD0048 */   addiu     $sp, $sp, 0x48

glabel build_chestdb
/* 75754 80074B54 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 75758 80074B58 AFB20020 */  sw         $s2, 0x20($sp)
/* 7575C 80074B5C 00809021 */  addu       $s2, $a0, $zero
/* 75760 80074B60 3C04B1FE */  lui        $a0, %hi(chestdb)
/* 75764 80074B64 24840F60 */  addiu      $a0, $a0, %lo(chestdb)
/* 75768 80074B68 02402821 */  addu       $a1, $s2, $zero
/* 7576C 80074B6C AFB00018 */  sw         $s0, 0x18($sp)
/* 75770 80074B70 27B00010 */  addiu      $s0, $sp, 0x10
/* 75774 80074B74 02003021 */  addu       $a2, $s0, $zero
/* 75778 80074B78 AFBF0024 */  sw         $ra, 0x24($sp)
/* 7577C 80074B7C AFB1001C */  sw         $s1, 0x1c($sp)
/* 75780 80074B80 0C01D30C */  jal        load_db_array_size
/* 75784 80074B84 AFA00010 */   sw        $zero, 0x10($sp)
/* 75788 80074B88 3C05800E */  lui        $a1, %hi(D_800DFDF0)
/* 7578C 80074B8C 24A5FDF0 */  addiu      $a1, $a1, %lo(D_800DFDF0)
/* 75790 80074B90 92420000 */  lbu        $v0, ($s2)
/* 75794 80074B94 24060165 */  addiu      $a2, $zero, 0x165
/* 75798 80074B98 000220C0 */  sll        $a0, $v0, 3
/* 7579C 80074B9C 00822023 */  subu       $a0, $a0, $v0
/* 757A0 80074BA0 00042080 */  sll        $a0, $a0, 2
/* 757A4 80074BA4 00822021 */  addu       $a0, $a0, $v0
/* 757A8 80074BA8 0C025F9C */  jal        Malloc
/* 757AC 80074BAC 00042040 */   sll       $a0, $a0, 1
/* 757B0 80074BB0 AE420004 */  sw         $v0, 4($s2)
/* 757B4 80074BB4 92420000 */  lbu        $v0, ($s2)
/* 757B8 80074BB8 1040000B */  beqz       $v0, .L80074BE8
/* 757BC 80074BBC 00008821 */   addu      $s1, $zero, $zero
/* 757C0 80074BC0 02402021 */  addu       $a0, $s2, $zero
.L80074BC4:
/* 757C4 80074BC4 02202821 */  addu       $a1, $s1, $zero
/* 757C8 80074BC8 0C01D1B9 */  jal        load_chestDB
/* 757CC 80074BCC 02003021 */   addu      $a2, $s0, $zero
/* 757D0 80074BD0 26230001 */  addiu      $v1, $s1, 1
/* 757D4 80074BD4 92420000 */  lbu        $v0, ($s2)
/* 757D8 80074BD8 307100FF */  andi       $s1, $v1, 0xff
/* 757DC 80074BDC 0222102B */  sltu       $v0, $s1, $v0
/* 757E0 80074BE0 1440FFF8 */  bnez       $v0, .L80074BC4
/* 757E4 80074BE4 02402021 */   addu      $a0, $s2, $zero
.L80074BE8:
/* 757E8 80074BE8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 757EC 80074BEC 8FB20020 */  lw         $s2, 0x20($sp)
/* 757F0 80074BF0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 757F4 80074BF4 8FB00018 */  lw         $s0, 0x18($sp)
/* 757F8 80074BF8 03E00008 */  jr         $ra
/* 757FC 80074BFC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel Chestdb_free
/* 75800 80074C00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 75804 80074C04 3C05800E */  lui        $a1, %hi(D_800DFDF0)
/* 75808 80074C08 24A5FDF0 */  addiu      $a1, $a1, %lo(D_800DFDF0)
/* 7580C 80074C0C AFBF0010 */  sw         $ra, 0x10($sp)
/* 75810 80074C10 8C840004 */  lw         $a0, 4($a0)
/* 75814 80074C14 0C02600C */  jal        Free
/* 75818 80074C18 24060173 */   addiu     $a2, $zero, 0x173
/* 7581C 80074C1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 75820 80074C20 03E00008 */  jr         $ra
/* 75824 80074C24 27BD0018 */   addiu     $sp, $sp, 0x18
/* 75828 80074C28 00000000 */  nop
/* 7582C 80074C2C 00000000 */  nop
