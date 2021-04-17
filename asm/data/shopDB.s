.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800766C0
/* 772C0 800766C0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 772C4 800766C4 AFB00018 */  sw         $s0, 0x18($sp)
/* 772C8 800766C8 00808021 */  addu       $s0, $a0, $zero
/* 772CC 800766CC 3C04B1FE */  lui        $a0, %hi(shopdb)
/* 772D0 800766D0 24841D30 */  addiu      $a0, $a0, %lo(shopdb)
/* 772D4 800766D4 02002821 */  addu       $a1, $s0, $zero
/* 772D8 800766D8 27A60010 */  addiu      $a2, $sp, 0x10
/* 772DC 800766DC AFBF001C */  sw         $ra, 0x1c($sp)
/* 772E0 800766E0 0C01D30C */  jal        load_db_array_size
/* 772E4 800766E4 AFA00010 */   sw        $zero, 0x10($sp)
/* 772E8 800766E8 3C05800E */  lui        $a1, %hi(D_800E0220)
/* 772EC 800766EC 24A50220 */  addiu      $a1, $a1, %lo(D_800E0220)
/* 772F0 800766F0 92020000 */  lbu        $v0, ($s0)
/* 772F4 800766F4 24060036 */  addiu      $a2, $zero, 0x36
/* 772F8 800766F8 000220C0 */  sll        $a0, $v0, 3
/* 772FC 800766FC 00822023 */  subu       $a0, $a0, $v0
/* 77300 80076700 00042080 */  sll        $a0, $a0, 2
/* 77304 80076704 00822023 */  subu       $a0, $a0, $v0
/* 77308 80076708 0C025F9C */  jal        Malloc
/* 7730C 8007670C 00042080 */   sll       $a0, $a0, 2
/* 77310 80076710 8FBF001C */  lw         $ra, 0x1c($sp)
/* 77314 80076714 AE020004 */  sw         $v0, 4($s0)
/* 77318 80076718 8FB00018 */  lw         $s0, 0x18($sp)
/* 7731C 8007671C 03E00008 */  jr         $ra
/* 77320 80076720 27BD0020 */   addiu     $sp, $sp, 0x20

glabel loadShopDB
/* 77324 80076724 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 77328 80076728 3C02800E */  lui        $v0, %hi(D_800E0220)
/* 7732C 8007672C 24420220 */  addiu      $v0, $v0, %lo(D_800E0220)
/* 77330 80076730 24030047 */  addiu      $v1, $zero, 0x47
/* 77334 80076734 AFB200A0 */  sw         $s2, 0xa0($sp)
/* 77338 80076738 00C09021 */  addu       $s2, $a2, $zero
/* 7733C 8007673C AFBF00A4 */  sw         $ra, 0xa4($sp)
/* 77340 80076740 AFB1009C */  sw         $s1, 0x9c($sp)
/* 77344 80076744 AFB00098 */  sw         $s0, 0x98($sp)
/* 77348 80076748 8C900004 */  lw         $s0, 4($a0)
/* 7734C 8007674C 30A500FF */  andi       $a1, $a1, 0xff
/* 77350 80076750 AFA20010 */  sw         $v0, 0x10($sp)
/* 77354 80076754 000510C0 */  sll        $v0, $a1, 3
/* 77358 80076758 00451023 */  subu       $v0, $v0, $a1
/* 7735C 8007675C 00021080 */  sll        $v0, $v0, 2
/* 77360 80076760 00451023 */  subu       $v0, $v0, $a1
/* 77364 80076764 00021080 */  sll        $v0, $v0, 2
/* 77368 80076768 3C05B1FE */  lui        $a1, %hi(shopdb)
/* 7736C 8007676C 24A51D30 */  addiu      $a1, $a1, %lo(shopdb)
/* 77370 80076770 27A40018 */  addiu      $a0, $sp, 0x18
/* 77374 80076774 2406006C */  addiu      $a2, $zero, 0x6c
/* 77378 80076778 24070001 */  addiu      $a3, $zero, 1
/* 7737C 8007677C AFA30014 */  sw         $v1, 0x14($sp)
/* 77380 80076780 8E510000 */  lw         $s1, ($s2)
/* 77384 80076784 02028021 */  addu       $s0, $s0, $v0
/* 77388 80076788 0C027269 */  jal        RomCopy
/* 7738C 8007678C 02252821 */   addu      $a1, $s1, $a1
/* 77390 80076790 24070002 */  addiu      $a3, $zero, 2
/* 77394 80076794 00004021 */  addu       $t0, $zero, $zero
/* 77398 80076798 260E0002 */  addiu      $t6, $s0, 2
/* 7739C 8007679C 27A90018 */  addiu      $t1, $sp, 0x18
/* 773A0 800767A0 01205021 */  addu       $t2, $t1, $zero
/* 773A4 800767A4 260D0030 */  addiu      $t5, $s0, 0x30
/* 773A8 800767A8 260C0044 */  addiu      $t4, $s0, 0x44
/* 773AC 800767AC 260B0058 */  addiu      $t3, $s0, 0x58
/* 773B0 800767B0 93A20019 */  lbu        $v0, 0x19($sp)
/* 773B4 800767B4 93A30018 */  lbu        $v1, 0x18($sp)
/* 773B8 800767B8 00021200 */  sll        $v0, $v0, 8
/* 773BC 800767BC 00621821 */  addu       $v1, $v1, $v0
/* 773C0 800767C0 A6030000 */  sh         $v1, ($s0)
/* 773C4 800767C4 00E03021 */  addu       $a2, $a3, $zero
.L800767C8:
/* 773C8 800767C8 24C20001 */  addiu      $v0, $a2, 1
/* 773CC 800767CC 304700FF */  andi       $a3, $v0, 0xff
/* 773D0 800767D0 00E02021 */  addu       $a0, $a3, $zero
/* 773D4 800767D4 24820001 */  addiu      $v0, $a0, 1
/* 773D8 800767D8 304700FF */  andi       $a3, $v0, 0xff
/* 773DC 800767DC 00082840 */  sll        $a1, $t0, 1
/* 773E0 800767E0 01C52821 */  addu       $a1, $t6, $a1
/* 773E4 800767E4 01463021 */  addu       $a2, $t2, $a2
/* 773E8 800767E8 01442021 */  addu       $a0, $t2, $a0
/* 773EC 800767EC 90820000 */  lbu        $v0, ($a0)
/* 773F0 800767F0 90C30000 */  lbu        $v1, ($a2)
/* 773F4 800767F4 00021200 */  sll        $v0, $v0, 8
/* 773F8 800767F8 00621821 */  addu       $v1, $v1, $v0
/* 773FC 800767FC A4A30000 */  sh         $v1, ($a1)
/* 77400 80076800 2D020014 */  sltiu      $v0, $t0, 0x14
/* 77404 80076804 10400015 */  beqz       $v0, .L8007685C
/* 77408 80076808 00E01821 */   addu      $v1, $a3, $zero
/* 7740C 8007680C 24E20001 */  addiu      $v0, $a3, 1
/* 77410 80076810 304700FF */  andi       $a3, $v0, 0xff
/* 77414 80076814 00E02821 */  addu       $a1, $a3, $zero
/* 77418 80076818 24A20001 */  addiu      $v0, $a1, 1
/* 7741C 8007681C 304700FF */  andi       $a3, $v0, 0xff
/* 77420 80076820 00E03021 */  addu       $a2, $a3, $zero
/* 77424 80076824 24C20001 */  addiu      $v0, $a2, 1
/* 77428 80076828 304700FF */  andi       $a3, $v0, 0xff
/* 7742C 8007682C 01231821 */  addu       $v1, $t1, $v1
/* 77430 80076830 01A81021 */  addu       $v0, $t5, $t0
/* 77434 80076834 01252821 */  addu       $a1, $t1, $a1
/* 77438 80076838 90640000 */  lbu        $a0, ($v1)
/* 7743C 8007683C 01263021 */  addu       $a2, $t1, $a2
/* 77440 80076840 A0440000 */  sb         $a0, ($v0)
/* 77444 80076844 90A30000 */  lbu        $v1, ($a1)
/* 77448 80076848 01881021 */  addu       $v0, $t4, $t0
/* 7744C 8007684C A0430000 */  sb         $v1, ($v0)
/* 77450 80076850 90C30000 */  lbu        $v1, ($a2)
/* 77454 80076854 01681021 */  addu       $v0, $t3, $t0
/* 77458 80076858 A0430000 */  sb         $v1, ($v0)
.L8007685C:
/* 7745C 8007685C 25020001 */  addiu      $v0, $t0, 1
/* 77460 80076860 304800FF */  andi       $t0, $v0, 0xff
/* 77464 80076864 2D030017 */  sltiu      $v1, $t0, 0x17
/* 77468 80076868 1460FFD7 */  bnez       $v1, .L800767C8
/* 7746C 8007686C 00E03021 */   addu      $a2, $a3, $zero
/* 77470 80076870 8FBF00A4 */  lw         $ra, 0xa4($sp)
/* 77474 80076874 2622006C */  addiu      $v0, $s1, 0x6c
/* 77478 80076878 AE420000 */  sw         $v0, ($s2)
/* 7747C 8007687C 8FB200A0 */  lw         $s2, 0xa0($sp)
/* 77480 80076880 8FB1009C */  lw         $s1, 0x9c($sp)
/* 77484 80076884 8FB00098 */  lw         $s0, 0x98($sp)
/* 77488 80076888 03E00008 */  jr         $ra
/* 7748C 8007688C 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel build_shopDB
/* 77490 80076890 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 77494 80076894 AFB20020 */  sw         $s2, 0x20($sp)
/* 77498 80076898 00809021 */  addu       $s2, $a0, $zero
/* 7749C 8007689C 3C04B1FE */  lui        $a0, %hi(shopdb)
/* 774A0 800768A0 24841D30 */  addiu      $a0, $a0, %lo(shopdb)
/* 774A4 800768A4 02402821 */  addu       $a1, $s2, $zero
/* 774A8 800768A8 AFB00018 */  sw         $s0, 0x18($sp)
/* 774AC 800768AC 27B00010 */  addiu      $s0, $sp, 0x10
/* 774B0 800768B0 02003021 */  addu       $a2, $s0, $zero
/* 774B4 800768B4 AFBF0024 */  sw         $ra, 0x24($sp)
/* 774B8 800768B8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 774BC 800768BC 0C01D30C */  jal        load_db_array_size
/* 774C0 800768C0 AFA00010 */   sw        $zero, 0x10($sp)
/* 774C4 800768C4 3C05800E */  lui        $a1, %hi(D_800E0220)
/* 774C8 800768C8 24A50220 */  addiu      $a1, $a1, %lo(D_800E0220)
/* 774CC 800768CC 92420000 */  lbu        $v0, ($s2)
/* 774D0 800768D0 24060074 */  addiu      $a2, $zero, 0x74
/* 774D4 800768D4 000220C0 */  sll        $a0, $v0, 3
/* 774D8 800768D8 00822023 */  subu       $a0, $a0, $v0
/* 774DC 800768DC 00042080 */  sll        $a0, $a0, 2
/* 774E0 800768E0 00822023 */  subu       $a0, $a0, $v0
/* 774E4 800768E4 0C025F9C */  jal        Malloc
/* 774E8 800768E8 00042080 */   sll       $a0, $a0, 2
/* 774EC 800768EC AE420004 */  sw         $v0, 4($s2)
/* 774F0 800768F0 92420000 */  lbu        $v0, ($s2)
/* 774F4 800768F4 1040000B */  beqz       $v0, .L80076924
/* 774F8 800768F8 00008821 */   addu      $s1, $zero, $zero
/* 774FC 800768FC 02402021 */  addu       $a0, $s2, $zero
.L80076900:
/* 77500 80076900 02202821 */  addu       $a1, $s1, $zero
/* 77504 80076904 0C01D9C9 */  jal        loadShopDB
/* 77508 80076908 02003021 */   addu      $a2, $s0, $zero
/* 7750C 8007690C 26230001 */  addiu      $v1, $s1, 1
/* 77510 80076910 92420000 */  lbu        $v0, ($s2)
/* 77514 80076914 307100FF */  andi       $s1, $v1, 0xff
/* 77518 80076918 0222102B */  sltu       $v0, $s1, $v0
/* 7751C 8007691C 1440FFF8 */  bnez       $v0, .L80076900
/* 77520 80076920 02402021 */   addu      $a0, $s2, $zero
.L80076924:
/* 77524 80076924 8FBF0024 */  lw         $ra, 0x24($sp)
/* 77528 80076928 8FB20020 */  lw         $s2, 0x20($sp)
/* 7752C 8007692C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 77530 80076930 8FB00018 */  lw         $s0, 0x18($sp)
/* 77534 80076934 03E00008 */  jr         $ra
/* 77538 80076938 27BD0028 */   addiu     $sp, $sp, 0x28

glabel Shopdb_free
/* 7753C 8007693C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 77540 80076940 3C05800E */  lui        $a1, %hi(D_800E0220)
/* 77544 80076944 24A50220 */  addiu      $a1, $a1, %lo(D_800E0220)
/* 77548 80076948 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7754C 8007694C 8C840004 */  lw         $a0, 4($a0)
/* 77550 80076950 0C02600C */  jal        Free
/* 77554 80076954 24060084 */   addiu     $a2, $zero, 0x84
/* 77558 80076958 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7755C 8007695C 03E00008 */  jr         $ra
/* 77560 80076960 27BD0018 */   addiu     $sp, $sp, 0x18
/* 77564 80076964 00000000 */  nop
/* 77568 80076968 00000000 */  nop
/* 7756C 8007696C 00000000 */  nop
