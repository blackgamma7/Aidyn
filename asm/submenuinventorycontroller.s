.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_checking_niesen
/* 3E3A0 8003D7A0 27BDFCA8 */  addiu      $sp, $sp, -0x358
/* 3E3A4 8003D7A4 AFB30344 */  sw         $s3, 0x344($sp)
/* 3E3A8 8003D7A8 00809821 */  addu       $s3, $a0, $zero
/* 3E3AC 8003D7AC AFBF0354 */  sw         $ra, 0x354($sp)
/* 3E3B0 8003D7B0 AFB60350 */  sw         $s6, 0x350($sp)
/* 3E3B4 8003D7B4 AFB5034C */  sw         $s5, 0x34c($sp)
/* 3E3B8 8003D7B8 AFB40348 */  sw         $s4, 0x348($sp)
/* 3E3BC 8003D7BC AFB20340 */  sw         $s2, 0x340($sp)
/* 3E3C0 8003D7C0 AFB1033C */  sw         $s1, 0x33c($sp)
/* 3E3C4 8003D7C4 AFB00338 */  sw         $s0, 0x338($sp)
/* 3E3C8 8003D7C8 8E650080 */  lw         $a1, 0x80($s3)
/* 3E3CC 8003D7CC 8CA30078 */  lw         $v1, 0x78($a1)
/* 3E3D0 8003D7D0 84640078 */  lh         $a0, 0x78($v1)
/* 3E3D4 8003D7D4 8C62007C */  lw         $v0, 0x7c($v1)
/* 3E3D8 8003D7D8 0040F809 */  jalr       $v0
/* 3E3DC 8003D7DC 00A42021 */   addu      $a0, $a1, $a0
/* 3E3E0 8003D7E0 00409021 */  addu       $s2, $v0, $zero
/* 3E3E4 8003D7E4 124001C0 */  beqz       $s2, .L8003DEE8
/* 3E3E8 8003D7E8 00001021 */   addu      $v0, $zero, $zero
/* 3E3EC 8003D7EC 3C04800F */  lui        $a0, %hi(D_800ED580)
/* 3E3F0 8003D7F0 8C82D580 */  lw         $v0, %lo(D_800ED580)($a0)
/* 3E3F4 8003D7F4 144001BC */  bnez       $v0, .L8003DEE8
/* 3E3F8 8003D7F8 00001021 */   addu      $v0, $zero, $zero
/* 3E3FC 8003D7FC 8E430078 */  lw         $v1, 0x78($s2)
/* 3E400 8003D800 24100001 */  addiu      $s0, $zero, 1
/* 3E404 8003D804 AC90D580 */  sw         $s0, -0x2a80($a0)
/* 3E408 8003D808 84640078 */  lh         $a0, 0x78($v1)
/* 3E40C 8003D80C 8C62007C */  lw         $v0, 0x7c($v1)
/* 3E410 8003D810 0040F809 */  jalr       $v0
/* 3E414 8003D814 02442021 */   addu      $a0, $s2, $a0
/* 3E418 8003D818 00408821 */  addu       $s1, $v0, $zero
/* 3E41C 8003D81C 3C05800E */  lui        $a1, %hi(gGlobals)
/* 3E420 8003D820 24A768A8 */  addiu      $a3, $a1, %lo(gGlobals)
/* 3E424 8003D824 24040003 */  addiu      $a0, $zero, 3
/* 3E428 8003D828 00A0A821 */  addu       $s5, $a1, $zero
/* 3E42C 8003D82C 92620088 */  lbu        $v0, 0x88($s3)
/* 3E430 8003D830 8CE315F8 */  lw         $v1, 0x15f8($a3)
/* 3E434 8003D834 00021080 */  sll        $v0, $v0, 2
/* 3E438 8003D838 00621821 */  addu       $v1, $v1, $v0
/* 3E43C 8003D83C 90E214C4 */  lbu        $v0, 0x14c4($a3)
/* 3E440 8003D840 14440036 */  bne        $v0, $a0, .L8003D91C
/* 3E444 8003D844 8C760000 */   lw        $s6, ($v1)
/* 3E448 8003D848 3C02800F */  lui        $v0, %hi(combatPointer)
/* 3E44C 8003D84C 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 3E450 8003D850 8C64002C */  lw         $a0, 0x2c($v1)
/* 3E454 8003D854 1620001A */  bnez       $s1, .L8003D8C0
/* 3E458 8003D858 90840020 */   lbu       $a0, 0x20($a0)
/* 3E45C 8003D85C 3C02800F */  lui        $v0, %hi(partypicker)
/* 3E460 8003D860 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 3E464 8003D864 1064002D */  beq        $v1, $a0, .L8003D91C
/* 3E468 8003D868 24050096 */   addiu     $a1, $zero, 0x96
/* 3E46C 8003D86C 27A40030 */  addiu      $a0, $sp, 0x30
/* 3E470 8003D870 00803021 */  addu       $a2, $a0, $zero
/* 3E474 8003D874 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E478 8003D878 240300FF */  addiu      $v1, $zero, 0xff
/* 3E47C 8003D87C A3A20030 */  sb         $v0, 0x30($sp)
/* 3E480 8003D880 A0820001 */  sb         $v0, 1($a0)
/* 3E484 8003D884 A0820002 */  sb         $v0, 2($a0)
/* 3E488 8003D888 24020032 */  addiu      $v0, $zero, 0x32
/* 3E48C 8003D88C A0830003 */  sb         $v1, 3($a0)
/* 3E490 8003D890 A3A20070 */  sb         $v0, 0x70($sp)
/* 3E494 8003D894 A3A20071 */  sb         $v0, 0x71($sp)
/* 3E498 8003D898 A3A20072 */  sb         $v0, 0x72($sp)
/* 3E49C 8003D89C 8CE3204C */  lw         $v1, 0x204c($a3)
/* 3E4A0 8003D8A0 24020096 */  addiu      $v0, $zero, 0x96
/* 3E4A4 8003D8A4 A3A20073 */  sb         $v0, 0x73($sp)
/* 3E4A8 8003D8A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 3E4AC 8003D8AC 8C6407A4 */  lw         $a0, 0x7a4($v1)
/* 3E4B0 8003D8B0 0C0131E1 */  jal        some_textbox_func
/* 3E4B4 8003D8B4 27A70070 */   addiu     $a3, $sp, 0x70
/* 3E4B8 8003D8B8 0800F7BA */  j          .L8003DEE8
/* 3E4BC 8003D8BC 00001021 */   addu      $v0, $zero, $zero
.L8003D8C0:
/* 3E4C0 8003D8C0 9622005E */  lhu        $v0, 0x5e($s1)
/* 3E4C4 8003D8C4 10440015 */  beq        $v0, $a0, .L8003D91C
/* 3E4C8 8003D8C8 24050096 */   addiu     $a1, $zero, 0x96
/* 3E4CC 8003D8CC 27A600B0 */  addiu      $a2, $sp, 0xb0
/* 3E4D0 8003D8D0 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E4D4 8003D8D4 240300FF */  addiu      $v1, $zero, 0xff
/* 3E4D8 8003D8D8 A3A200B0 */  sb         $v0, 0xb0($sp)
/* 3E4DC 8003D8DC A3A200B1 */  sb         $v0, 0xb1($sp)
/* 3E4E0 8003D8E0 A3A200B2 */  sb         $v0, 0xb2($sp)
/* 3E4E4 8003D8E4 24020032 */  addiu      $v0, $zero, 0x32
/* 3E4E8 8003D8E8 A3A300B3 */  sb         $v1, 0xb3($sp)
/* 3E4EC 8003D8EC A3A200F0 */  sb         $v0, 0xf0($sp)
/* 3E4F0 8003D8F0 A3A200F1 */  sb         $v0, 0xf1($sp)
/* 3E4F4 8003D8F4 A3A200F2 */  sb         $v0, 0xf2($sp)
/* 3E4F8 8003D8F8 8CE3204C */  lw         $v1, 0x204c($a3)
/* 3E4FC 8003D8FC 24020096 */  addiu      $v0, $zero, 0x96
/* 3E500 8003D900 A3A200F3 */  sb         $v0, 0xf3($sp)
/* 3E504 8003D904 AFB00010 */  sw         $s0, 0x10($sp)
/* 3E508 8003D908 8C6407A8 */  lw         $a0, 0x7a8($v1)
/* 3E50C 8003D90C 0C0131E1 */  jal        some_textbox_func
/* 3E510 8003D910 27A700F0 */   addiu     $a3, $sp, 0xf0
/* 3E514 8003D914 0800F7BA */  j          .L8003DEE8
/* 3E518 8003D918 00001021 */   addu      $v0, $zero, $zero
.L8003D91C:
/* 3E51C 8003D91C 8E430078 */  lw         $v1, 0x78($s2)
/* 3E520 8003D920 84640088 */  lh         $a0, 0x88($v1)
/* 3E524 8003D924 8C62008C */  lw         $v0, 0x8c($v1)
/* 3E528 8003D928 0040F809 */  jalr       $v0
/* 3E52C 8003D92C 02442021 */   addu      $a0, $s2, $a0
/* 3E530 8003D930 00408021 */  addu       $s0, $v0, $zero
/* 3E534 8003D934 1220007F */  beqz       $s1, .L8003DB34
/* 3E538 8003D938 9652005E */   lhu       $s2, 0x5e($s2)
/* 3E53C 8003D93C 96020000 */  lhu        $v0, ($s0)
/* 3E540 8003D940 24030007 */  addiu      $v1, $zero, 7
/* 3E544 8003D944 00022202 */  srl        $a0, $v0, 8
/* 3E548 8003D948 1483003B */  bne        $a0, $v1, .L8003DA38
/* 3E54C 8003D94C 24020005 */   addiu     $v0, $zero, 5
/* 3E550 8003D950 26A668A8 */  addiu      $a2, $s5, 0x68a8
/* 3E554 8003D954 9622005E */  lhu        $v0, 0x5e($s1)
/* 3E558 8003D958 8CC315F8 */  lw         $v1, 0x15f8($a2)
/* 3E55C 8003D95C 00021080 */  sll        $v0, $v0, 2
/* 3E560 8003D960 00621821 */  addu       $v1, $v1, $v0
/* 3E564 8003D964 8C650000 */  lw         $a1, ($v1)
/* 3E568 8003D968 10A00025 */  beqz       $a1, .L8003DA00
/* 3E56C 8003D96C 3C02800F */   lui       $v0, %hi(entityList+0xA2)
/* 3E570 8003D970 90431452 */  lbu        $v1, %lo(entityList+0xA2)($v0)
/* 3E574 8003D974 94A40000 */  lhu        $a0, ($a1)
/* 3E578 8003D978 24630200 */  addiu      $v1, $v1, 0x200
/* 3E57C 8003D97C 14640021 */  bne        $v1, $a0, .L8003DA04
/* 3E580 8003D980 26A268A8 */   addiu     $v0, $s5, 0x68a8
/* 3E584 8003D984 24D02078 */  addiu      $s0, $a2, 0x2078
/* 3E588 8003D988 02002021 */  addu       $a0, $s0, $zero
/* 3E58C 8003D98C 3C02800F */  lui        $v0, %hi(weapon_pointer)
/* 3E590 8003D990 8CA70004 */  lw         $a3, 4($a1)
/* 3E594 8003D994 8C4316F0 */  lw         $v1, %lo(weapon_pointer)($v0)
/* 3E598 8003D998 8CC8204C */  lw         $t0, 0x204c($a2)
/* 3E59C 8003D99C 8C660018 */  lw         $a2, 0x18($v1)
/* 3E5A0 8003D9A0 8D0508A8 */  lw         $a1, 0x8a8($t0)
/* 3E5A4 8003D9A4 0C0333AC */  jal        sprintf
/* 3E5A8 8003D9A8 24C60D6A */   addiu     $a2, $a2, 0xd6a
/* 3E5AC 8003D9AC 02002021 */  addu       $a0, $s0, $zero
/* 3E5B0 8003D9B0 24050096 */  addiu      $a1, $zero, 0x96
/* 3E5B4 8003D9B4 27A60130 */  addiu      $a2, $sp, 0x130
/* 3E5B8 8003D9B8 27A70170 */  addiu      $a3, $sp, 0x170
/* 3E5BC 8003D9BC 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E5C0 8003D9C0 240300FF */  addiu      $v1, $zero, 0xff
/* 3E5C4 8003D9C4 A3A20130 */  sb         $v0, 0x130($sp)
/* 3E5C8 8003D9C8 A3A20131 */  sb         $v0, 0x131($sp)
/* 3E5CC 8003D9CC A3A20132 */  sb         $v0, 0x132($sp)
/* 3E5D0 8003D9D0 24020032 */  addiu      $v0, $zero, 0x32
/* 3E5D4 8003D9D4 A3A30133 */  sb         $v1, 0x133($sp)
/* 3E5D8 8003D9D8 24030096 */  addiu      $v1, $zero, 0x96
/* 3E5DC 8003D9DC A3A20170 */  sb         $v0, 0x170($sp)
/* 3E5E0 8003D9E0 A3A20171 */  sb         $v0, 0x171($sp)
/* 3E5E4 8003D9E4 A3A20172 */  sb         $v0, 0x172($sp)
/* 3E5E8 8003D9E8 24020001 */  addiu      $v0, $zero, 1
/* 3E5EC 8003D9EC A3A30173 */  sb         $v1, 0x173($sp)
/* 3E5F0 8003D9F0 0C0131E1 */  jal        some_textbox_func
/* 3E5F4 8003D9F4 AFA20010 */   sw        $v0, 0x10($sp)
/* 3E5F8 8003D9F8 0800F7BA */  j          .L8003DEE8
/* 3E5FC 8003D9FC 00001021 */   addu      $v0, $zero, $zero
.L8003DA00:
/* 3E600 8003DA00 26A268A8 */  addiu      $v0, $s5, 0x68a8
.L8003DA04:
/* 3E604 8003DA04 8C4415F8 */  lw         $a0, 0x15f8($v0)
/* 3E608 8003DA08 0C01FE04 */  jal        MoveWeaponsToInventory
/* 3E60C 8003DA0C 9225005F */   lbu       $a1, 0x5f($s1)
/* 3E610 8003DA10 54400120 */  bnel       $v0, $zero, .L8003DE94
/* 3E614 8003DA14 8E630078 */   lw        $v1, 0x78($s3)
/* 3E618 8003DA18 02602021 */  addu       $a0, $s3, $zero
/* 3E61C 8003DA1C 02402821 */  addu       $a1, $s2, $zero
/* 3E620 8003DA20 24060001 */  addiu      $a2, $zero, 1
/* 3E624 8003DA24 240700FF */  addiu      $a3, $zero, 0xff
/* 3E628 8003DA28 3C02800E */  lui        $v0, %hi(D_800DC3E0)
/* 3E62C 8003DA2C 2442C3E0 */  addiu      $v0, $v0, %lo(D_800DC3E0)
/* 3E630 8003DA30 0800F6C3 */  j          .L8003DB0C
/* 3E634 8003DA34 2403007B */   addiu     $v1, $zero, 0x7b
.L8003DA38:
/* 3E638 8003DA38 1482000F */  bne        $a0, $v0, .L8003DA78
/* 3E63C 8003DA3C 24020006 */   addiu     $v0, $zero, 6
/* 3E640 8003DA40 26A268A8 */  addiu      $v0, $s5, 0x68a8
/* 3E644 8003DA44 8C4415F8 */  lw         $a0, 0x15f8($v0)
/* 3E648 8003DA48 0C01FD5C */  jal        remove_armor_from_character
/* 3E64C 8003DA4C 9225005F */   lbu       $a1, 0x5f($s1)
/* 3E650 8003DA50 54400110 */  bnel       $v0, $zero, .L8003DE94
/* 3E654 8003DA54 8E630078 */   lw        $v1, 0x78($s3)
/* 3E658 8003DA58 02602021 */  addu       $a0, $s3, $zero
/* 3E65C 8003DA5C 02402821 */  addu       $a1, $s2, $zero
/* 3E660 8003DA60 24060001 */  addiu      $a2, $zero, 1
/* 3E664 8003DA64 240700FF */  addiu      $a3, $zero, 0xff
/* 3E668 8003DA68 3C02800E */  lui        $v0, %hi(D_800DC3E0)
/* 3E66C 8003DA6C 2442C3E0 */  addiu      $v0, $v0, %lo(D_800DC3E0)
/* 3E670 8003DA70 0800F6C3 */  j          .L8003DB0C
/* 3E674 8003DA74 24030085 */   addiu     $v1, $zero, 0x85
.L8003DA78:
/* 3E678 8003DA78 1482000F */  bne        $a0, $v0, .L8003DAB8
/* 3E67C 8003DA7C 26B068A8 */   addiu     $s0, $s5, 0x68a8
/* 3E680 8003DA80 26A268A8 */  addiu      $v0, $s5, 0x68a8
/* 3E684 8003DA84 8C4415F8 */  lw         $a0, 0x15f8($v0)
/* 3E688 8003DA88 0C01FDB0 */  jal        removeArmorIntoInventory
/* 3E68C 8003DA8C 9225005F */   lbu       $a1, 0x5f($s1)
/* 3E690 8003DA90 54400100 */  bnel       $v0, $zero, .L8003DE94
/* 3E694 8003DA94 8E630078 */   lw        $v1, 0x78($s3)
/* 3E698 8003DA98 02602021 */  addu       $a0, $s3, $zero
/* 3E69C 8003DA9C 02402821 */  addu       $a1, $s2, $zero
/* 3E6A0 8003DAA0 24060001 */  addiu      $a2, $zero, 1
/* 3E6A4 8003DAA4 240700FF */  addiu      $a3, $zero, 0xff
/* 3E6A8 8003DAA8 3C02800E */  lui        $v0, %hi(D_800DC3E0)
/* 3E6AC 8003DAAC 2442C3E0 */  addiu      $v0, $v0, %lo(D_800DC3E0)
/* 3E6B0 8003DAB0 0800F6C3 */  j          .L8003DB0C
/* 3E6B4 8003DAB4 2403008F */   addiu     $v1, $zero, 0x8f
.L8003DAB8:
/* 3E6B8 8003DAB8 9622005E */  lhu        $v0, 0x5e($s1)
/* 3E6BC 8003DABC 8E0315F8 */  lw         $v1, 0x15f8($s0)
/* 3E6C0 8003DAC0 00021080 */  sll        $v0, $v0, 2
/* 3E6C4 8003DAC4 00621821 */  addu       $v1, $v1, $v0
/* 3E6C8 8003DAC8 8C650000 */  lw         $a1, ($v1)
/* 3E6CC 8003DACC 8CA40028 */  lw         $a0, 0x28($a1)
/* 3E6D0 8003DAD0 0C01F6AA */  jal        func_8007DAA8
/* 3E6D4 8003DAD4 02402821 */   addu      $a1, $s2, $zero
/* 3E6D8 8003DAD8 8E0415F8 */  lw         $a0, 0x15f8($s0)
/* 3E6DC 8003DADC 9225005F */  lbu        $a1, 0x5f($s1)
/* 3E6E0 8003DAE0 0C01FE6E */  jal        func_8007F9B8
/* 3E6E4 8003DAE4 304600FF */   andi      $a2, $v0, 0xff
/* 3E6E8 8003DAE8 544000EA */  bnel       $v0, $zero, .L8003DE94
/* 3E6EC 8003DAEC 8E630078 */   lw        $v1, 0x78($s3)
/* 3E6F0 8003DAF0 02602021 */  addu       $a0, $s3, $zero
/* 3E6F4 8003DAF4 02402821 */  addu       $a1, $s2, $zero
/* 3E6F8 8003DAF8 24060001 */  addiu      $a2, $zero, 1
/* 3E6FC 8003DAFC 240700FF */  addiu      $a3, $zero, 0xff
/* 3E700 8003DB00 3C02800E */  lui        $v0, %hi(D_800DC3E0)
/* 3E704 8003DB04 2442C3E0 */  addiu      $v0, $v0, %lo(D_800DC3E0)
/* 3E708 8003DB08 2403009F */  addiu      $v1, $zero, 0x9f
.L8003DB0C:
/* 3E70C 8003DB0C AFA20010 */  sw         $v0, 0x10($sp)
/* 3E710 8003DB10 0C00F4DE */  jal        SMI_AddItem
/* 3E714 8003DB14 AFA30014 */   sw        $v1, 0x14($sp)
/* 3E718 8003DB18 02602021 */  addu       $a0, $s3, $zero
/* 3E71C 8003DB1C 0C00F465 */  jal        func_8003D194
/* 3E720 8003DB20 24050001 */   addiu     $a1, $zero, 1
/* 3E724 8003DB24 0C00F590 */  jal        func_8003D640
/* 3E728 8003DB28 02602021 */   addu      $a0, $s3, $zero
/* 3E72C 8003DB2C 0800F7A5 */  j          .L8003DE94
/* 3E730 8003DB30 8E630078 */   lw        $v1, 0x78($s3)
.L8003DB34:
/* 3E734 8003DB34 8E660090 */  lw         $a2, 0x90($s3)
/* 3E738 8003DB38 8CC30000 */  lw         $v1, ($a2)
/* 3E73C 8003DB3C 02402821 */  addu       $a1, $s2, $zero
/* 3E740 8003DB40 84640050 */  lh         $a0, 0x50($v1)
/* 3E744 8003DB44 8C620054 */  lw         $v0, 0x54($v1)
/* 3E748 8003DB48 0040F809 */  jalr       $v0
/* 3E74C 8003DB4C 00C42021 */   addu      $a0, $a2, $a0
/* 3E750 8003DB50 12000079 */  beqz       $s0, .L8003DD38
/* 3E754 8003DB54 00402821 */   addu      $a1, $v0, $zero
/* 3E758 8003DB58 96020000 */  lhu        $v0, ($s0)
/* 3E75C 8003DB5C 24030010 */  addiu      $v1, $zero, 0x10
/* 3E760 8003DB60 00022202 */  srl        $a0, $v0, 8
/* 3E764 8003DB64 14830062 */  bne        $a0, $v1, .L8003DCF0
/* 3E768 8003DB68 24020011 */   addiu     $v0, $zero, 0x11
/* 3E76C 8003DB6C 26B168A8 */  addiu      $s1, $s5, 0x68a8
/* 3E770 8003DB70 922313C8 */  lbu        $v1, 0x13c8($s1)
/* 3E774 8003DB74 2402000E */  addiu      $v0, $zero, 0xe
/* 3E778 8003DB78 14620041 */  bne        $v1, $v0, .L8003DC80
/* 3E77C 8003DB7C 02C02021 */   addu      $a0, $s6, $zero
/* 3E780 8003DB80 96040000 */  lhu        $a0, ($s0)
/* 3E784 8003DB84 00002821 */  addu       $a1, $zero, $zero
/* 3E788 8003DB88 0C01D77A */  jal        GetIDIndex
/* 3E78C 8003DB8C 00003021 */   addu      $a2, $zero, $zero
/* 3E790 8003DB90 2C420004 */  sltiu      $v0, $v0, 4
/* 3E794 8003DB94 54400015 */  bnel       $v0, $zero, .L8003DBEC
/* 3E798 8003DB98 8E2315F8 */   lw        $v1, 0x15f8($s1)
/* 3E79C 8003DB9C 240500C8 */  addiu      $a1, $zero, 0xc8
/* 3E7A0 8003DBA0 24060040 */  addiu      $a2, $zero, 0x40
/* 3E7A4 8003DBA4 240200FF */  addiu      $v0, $zero, 0xff
/* 3E7A8 8003DBA8 24030032 */  addiu      $v1, $zero, 0x32
/* 3E7AC 8003DBAC AFA20010 */  sw         $v0, 0x10($sp)
/* 3E7B0 8003DBB0 AFA20014 */  sw         $v0, 0x14($sp)
/* 3E7B4 8003DBB4 AFA20018 */  sw         $v0, 0x18($sp)
/* 3E7B8 8003DBB8 24020096 */  addiu      $v0, $zero, 0x96
/* 3E7BC 8003DBBC AFA3001C */  sw         $v1, 0x1c($sp)
/* 3E7C0 8003DBC0 AFA30020 */  sw         $v1, 0x20($sp)
/* 3E7C4 8003DBC4 AFA30024 */  sw         $v1, 0x24($sp)
/* 3E7C8 8003DBC8 AFA20028 */  sw         $v0, 0x28($sp)
/* 3E7CC 8003DBCC 8E23204C */  lw         $v1, 0x204c($s1)
/* 3E7D0 8003DBD0 24020001 */  addiu      $v0, $zero, 1
/* 3E7D4 8003DBD4 AFA2002C */  sw         $v0, 0x2c($sp)
/* 3E7D8 8003DBD8 8C6407A0 */  lw         $a0, 0x7a0($v1)
/* 3E7DC 8003DBDC 0C013174 */  jal        another_textbox_func
/* 3E7E0 8003DBE0 240700FF */   addiu     $a3, $zero, 0xff
/* 3E7E4 8003DBE4 0800F7BA */  j          .L8003DEE8
/* 3E7E8 8003DBE8 00001021 */   addu      $v0, $zero, $zero
.L8003DBEC:
/* 3E7EC 8003DBEC 92620088 */  lbu        $v0, 0x88($s3)
/* 3E7F0 8003DBF0 96070000 */  lhu        $a3, ($s0)
/* 3E7F4 8003DBF4 00602021 */  addu       $a0, $v1, $zero
/* 3E7F8 8003DBF8 00403021 */  addu       $a2, $v0, $zero
/* 3E7FC 8003DBFC 00021080 */  sll        $v0, $v0, 2
/* 3E800 8003DC00 00621821 */  addu       $v1, $v1, $v0
/* 3E804 8003DC04 8C650000 */  lw         $a1, ($v1)
/* 3E808 8003DC08 AFA00010 */  sw         $zero, 0x10($sp)
/* 3E80C 8003DC0C 0C01FA08 */  jal        func_checking_niesen_
/* 3E810 8003DC10 AFA00014 */   sw        $zero, 0x14($sp)
/* 3E814 8003DC14 00403821 */  addu       $a3, $v0, $zero
/* 3E818 8003DC18 10E0009D */  beqz       $a3, .L8003DE90
/* 3E81C 8003DC1C 24050096 */   addiu     $a1, $zero, 0x96
/* 3E820 8003DC20 27A601B0 */  addiu      $a2, $sp, 0x1b0
/* 3E824 8003DC24 240300FF */  addiu      $v1, $zero, 0xff
/* 3E828 8003DC28 A3A301B3 */  sb         $v1, 0x1b3($sp)
/* 3E82C 8003DC2C 24030096 */  addiu      $v1, $zero, 0x96
/* 3E830 8003DC30 A3A301F3 */  sb         $v1, 0x1f3($sp)
/* 3E834 8003DC34 3C03800F */  lui        $v1, %hi(equip_error_labels)
/* 3E838 8003DC38 8C641A10 */  lw         $a0, %lo(equip_error_labels)($v1)
/* 3E83C 8003DC3C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E840 8003DC40 A3A201B0 */  sb         $v0, 0x1b0($sp)
/* 3E844 8003DC44 A3A201B1 */  sb         $v0, 0x1b1($sp)
/* 3E848 8003DC48 A3A201B2 */  sb         $v0, 0x1b2($sp)
/* 3E84C 8003DC4C 24020032 */  addiu      $v0, $zero, 0x32
/* 3E850 8003DC50 A3A201F0 */  sb         $v0, 0x1f0($sp)
/* 3E854 8003DC54 A3A201F1 */  sb         $v0, 0x1f1($sp)
/* 3E858 8003DC58 A3A201F2 */  sb         $v0, 0x1f2($sp)
/* 3E85C 8003DC5C 24020001 */  addiu      $v0, $zero, 1
/* 3E860 8003DC60 AFA20010 */  sw         $v0, 0x10($sp)
/* 3E864 8003DC64 00071080 */  sll        $v0, $a3, 2
/* 3E868 8003DC68 00441021 */  addu       $v0, $v0, $a0
/* 3E86C 8003DC6C 8C440000 */  lw         $a0, ($v0)
/* 3E870 8003DC70 0C0131E1 */  jal        some_textbox_func
/* 3E874 8003DC74 27A701F0 */   addiu     $a3, $sp, 0x1f0
/* 3E878 8003DC78 0800F7BA */  j          .L8003DEE8
/* 3E87C 8003DC7C 00001021 */   addu      $v0, $zero, $zero
.L8003DC80:
/* 3E880 8003DC80 30A500FF */  andi       $a1, $a1, 0xff
/* 3E884 8003DC84 92060001 */  lbu        $a2, 1($s0)
/* 3E888 8003DC88 26302078 */  addiu      $s0, $s1, 0x2078
/* 3E88C 8003DC8C 0C01E415 */  jal        potion_effects
/* 3E890 8003DC90 02003821 */   addu      $a3, $s0, $zero
/* 3E894 8003DC94 14400024 */  bnez       $v0, .L8003DD28
/* 3E898 8003DC98 02602021 */   addu      $a0, $s3, $zero
/* 3E89C 8003DC9C 02002021 */  addu       $a0, $s0, $zero
/* 3E8A0 8003DCA0 24050096 */  addiu      $a1, $zero, 0x96
/* 3E8A4 8003DCA4 27A60230 */  addiu      $a2, $sp, 0x230
/* 3E8A8 8003DCA8 27A70270 */  addiu      $a3, $sp, 0x270
/* 3E8AC 8003DCAC 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E8B0 8003DCB0 240300FF */  addiu      $v1, $zero, 0xff
/* 3E8B4 8003DCB4 A3A20230 */  sb         $v0, 0x230($sp)
/* 3E8B8 8003DCB8 A3A20231 */  sb         $v0, 0x231($sp)
/* 3E8BC 8003DCBC A3A20232 */  sb         $v0, 0x232($sp)
/* 3E8C0 8003DCC0 24020032 */  addiu      $v0, $zero, 0x32
/* 3E8C4 8003DCC4 A3A30233 */  sb         $v1, 0x233($sp)
/* 3E8C8 8003DCC8 24030096 */  addiu      $v1, $zero, 0x96
/* 3E8CC 8003DCCC A3A20270 */  sb         $v0, 0x270($sp)
/* 3E8D0 8003DCD0 A3A20271 */  sb         $v0, 0x271($sp)
/* 3E8D4 8003DCD4 A3A20272 */  sb         $v0, 0x272($sp)
/* 3E8D8 8003DCD8 24020001 */  addiu      $v0, $zero, 1
/* 3E8DC 8003DCDC A3A30273 */  sb         $v1, 0x273($sp)
/* 3E8E0 8003DCE0 0C0131E1 */  jal        some_textbox_func
/* 3E8E4 8003DCE4 AFA20010 */   sw        $v0, 0x10($sp)
/* 3E8E8 8003DCE8 0800F7BA */  j          .L8003DEE8
/* 3E8EC 8003DCEC 00001021 */   addu      $v0, $zero, $zero
.L8003DCF0:
/* 3E8F0 8003DCF0 14820012 */  bne        $a0, $v0, .L8003DD3C
/* 3E8F4 8003DCF4 30A600FF */   andi      $a2, $a1, 0xff
/* 3E8F8 8003DCF8 26A468A8 */  addiu      $a0, $s5, 0x68a8
/* 3E8FC 8003DCFC 908313C8 */  lbu        $v1, 0x13c8($a0)
/* 3E900 8003DD00 2402000E */  addiu      $v0, $zero, 0xe
/* 3E904 8003DD04 1062000E */  beq        $v1, $v0, .L8003DD40
/* 3E908 8003DD08 26A268A8 */   addiu     $v0, $s5, 0x68a8
/* 3E90C 8003DD0C 8C8415F8 */  lw         $a0, 0x15f8($a0)
/* 3E910 8003DD10 92650088 */  lbu        $a1, 0x88($s3)
/* 3E914 8003DD14 0C01FA44 */  jal        get_equip_error
/* 3E918 8003DD18 00003821 */   addu      $a3, $zero, $zero
/* 3E91C 8003DD1C 5440005D */  bnel       $v0, $zero, .L8003DE94
/* 3E920 8003DD20 8E630078 */   lw        $v1, 0x78($s3)
/* 3E924 8003DD24 02602021 */  addu       $a0, $s3, $zero
.L8003DD28:
/* 3E928 8003DD28 0C00F465 */  jal        func_8003D194
/* 3E92C 8003DD2C 24050001 */   addiu     $a1, $zero, 1
/* 3E930 8003DD30 0800F7A5 */  j          .L8003DE94
/* 3E934 8003DD34 8E630078 */   lw        $v1, 0x78($s3)
.L8003DD38:
/* 3E938 8003DD38 30A600FF */  andi       $a2, $a1, 0xff
.L8003DD3C:
/* 3E93C 8003DD3C 26A268A8 */  addiu      $v0, $s5, 0x68a8
.L8003DD40:
/* 3E940 8003DD40 8C4415F8 */  lw         $a0, 0x15f8($v0)
/* 3E944 8003DD44 92650088 */  lbu        $a1, 0x88($s3)
/* 3E948 8003DD48 8E620080 */  lw         $v0, 0x80($s3)
/* 3E94C 8003DD4C 27A702B0 */  addiu      $a3, $sp, 0x2b0
/* 3E950 8003DD50 A7A002B0 */  sh         $zero, 0x2b0($sp)
/* 3E954 8003DD54 0C01FA44 */  jal        get_equip_error
/* 3E958 8003DD58 8C510040 */   lw        $s1, 0x40($v0)
/* 3E95C 8003DD5C 00403821 */  addu       $a3, $v0, $zero
/* 3E960 8003DD60 10E00019 */  beqz       $a3, .L8003DDC8
/* 3E964 8003DD64 24050096 */   addiu     $a1, $zero, 0x96
/* 3E968 8003DD68 27A602B8 */  addiu      $a2, $sp, 0x2b8
/* 3E96C 8003DD6C 240300FF */  addiu      $v1, $zero, 0xff
/* 3E970 8003DD70 A3A302BB */  sb         $v1, 0x2bb($sp)
/* 3E974 8003DD74 24030096 */  addiu      $v1, $zero, 0x96
/* 3E978 8003DD78 A3A302FB */  sb         $v1, 0x2fb($sp)
/* 3E97C 8003DD7C 3C03800F */  lui        $v1, %hi(equip_error_labels)
/* 3E980 8003DD80 8C641A10 */  lw         $a0, %lo(equip_error_labels)($v1)
/* 3E984 8003DD84 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3E988 8003DD88 A3A202B8 */  sb         $v0, 0x2b8($sp)
/* 3E98C 8003DD8C A3A202B9 */  sb         $v0, 0x2b9($sp)
/* 3E990 8003DD90 A3A202BA */  sb         $v0, 0x2ba($sp)
/* 3E994 8003DD94 24020032 */  addiu      $v0, $zero, 0x32
/* 3E998 8003DD98 A3A202F8 */  sb         $v0, 0x2f8($sp)
/* 3E99C 8003DD9C A3A202F9 */  sb         $v0, 0x2f9($sp)
/* 3E9A0 8003DDA0 A3A202FA */  sb         $v0, 0x2fa($sp)
/* 3E9A4 8003DDA4 24020001 */  addiu      $v0, $zero, 1
/* 3E9A8 8003DDA8 AFA20010 */  sw         $v0, 0x10($sp)
/* 3E9AC 8003DDAC 00071080 */  sll        $v0, $a3, 2
/* 3E9B0 8003DDB0 00441021 */  addu       $v0, $v0, $a0
/* 3E9B4 8003DDB4 8C440000 */  lw         $a0, ($v0)
/* 3E9B8 8003DDB8 0C0131E1 */  jal        some_textbox_func
/* 3E9BC 8003DDBC 27A702F8 */   addiu     $a3, $sp, 0x2f8
/* 3E9C0 8003DDC0 0800F7BA */  j          .L8003DEE8
/* 3E9C4 8003DDC4 00001021 */   addu      $v0, $zero, $zero
.L8003DDC8:
/* 3E9C8 8003DDC8 8E620080 */  lw         $v0, 0x80($s3)
/* 3E9CC 8003DDCC 02602021 */  addu       $a0, $s3, $zero
/* 3E9D0 8003DDD0 8C430040 */  lw         $v1, 0x40($v0)
/* 3E9D4 8003DDD4 24050001 */  addiu      $a1, $zero, 1
/* 3E9D8 8003DDD8 0C00F465 */  jal        func_8003D194
/* 3E9DC 8003DDDC 9470001E */   lhu       $s0, 0x1e($v1)
/* 3E9E0 8003DDE0 97A302B0 */  lhu        $v1, 0x2b0($sp)
/* 3E9E4 8003DDE4 1060000F */  beqz       $v1, .L8003DE24
/* 3E9E8 8003DDE8 3C14800E */   lui       $s4, %hi(D_800DC3E0)
/* 3E9EC 8003DDEC 02602021 */  addu       $a0, $s3, $zero
/* 3E9F0 8003DDF0 24060001 */  addiu      $a2, $zero, 1
/* 3E9F4 8003DDF4 240700FF */  addiu      $a3, $zero, 0xff
/* 3E9F8 8003DDF8 2682C3E0 */  addiu      $v0, $s4, %lo(D_800DC3E0)
/* 3E9FC 8003DDFC 00602821 */  addu       $a1, $v1, $zero
/* 3EA00 8003DE00 AFA20010 */  sw         $v0, 0x10($sp)
/* 3EA04 8003DE04 240200E9 */  addiu      $v0, $zero, 0xe9
/* 3EA08 8003DE08 0C00F4DE */  jal        SMI_AddItem
/* 3EA0C 8003DE0C AFA20014 */   sw        $v0, 0x14($sp)
/* 3EA10 8003DE10 02602021 */  addu       $a0, $s3, $zero
/* 3EA14 8003DE14 97A502B0 */  lhu        $a1, 0x2b0($sp)
/* 3EA18 8003DE18 92670088 */  lbu        $a3, 0x88($s3)
/* 3EA1C 8003DE1C 0C00F419 */  jal        func_8003D064
/* 3EA20 8003DE20 24060001 */   addiu     $a2, $zero, 1
.L8003DE24:
/* 3EA24 8003DE24 02602021 */  addu       $a0, $s3, $zero
/* 3EA28 8003DE28 02402821 */  addu       $a1, $s2, $zero
/* 3EA2C 8003DE2C 24060001 */  addiu      $a2, $zero, 1
/* 3EA30 8003DE30 2682C3E0 */  addiu      $v0, $s4, -0x3c20
/* 3EA34 8003DE34 AFA20010 */  sw         $v0, 0x10($sp)
/* 3EA38 8003DE38 92670088 */  lbu        $a3, 0x88($s3)
/* 3EA3C 8003DE3C 240200F0 */  addiu      $v0, $zero, 0xf0
/* 3EA40 8003DE40 0C00F4DE */  jal        SMI_AddItem
/* 3EA44 8003DE44 AFA20014 */   sw        $v0, 0x14($sp)
/* 3EA48 8003DE48 0C00F590 */  jal        func_8003D640
/* 3EA4C 8003DE4C 02602021 */   addu      $a0, $s3, $zero
/* 3EA50 8003DE50 96220020 */  lhu        $v0, 0x20($s1)
/* 3EA54 8003DE54 2442FFFF */  addiu      $v0, $v0, -1
/* 3EA58 8003DE58 0202102A */  slt        $v0, $s0, $v0
/* 3EA5C 8003DE5C 1040000B */  beqz       $v0, .L8003DE8C
/* 3EA60 8003DE60 00101080 */   sll       $v0, $s0, 2
/* 3EA64 8003DE64 8E230018 */  lw         $v1, 0x18($s1)
/* 3EA68 8003DE68 00431021 */  addu       $v0, $v0, $v1
/* 3EA6C 8003DE6C 8C420004 */  lw         $v0, 4($v0)
/* 3EA70 8003DE70 50400007 */  beql       $v0, $zero, .L8003DE90
/* 3EA74 8003DE74 A630001E */   sh        $s0, 0x1e($s1)
/* 3EA78 8003DE78 9442005E */  lhu        $v0, 0x5e($v0)
/* 3EA7C 8003DE7C 54520004 */  bnel       $v0, $s2, .L8003DE90
/* 3EA80 8003DE80 A630001E */   sh        $s0, 0x1e($s1)
/* 3EA84 8003DE84 26020001 */  addiu      $v0, $s0, 1
/* 3EA88 8003DE88 3050FFFF */  andi       $s0, $v0, 0xffff
.L8003DE8C:
/* 3EA8C 8003DE8C A630001E */  sh         $s0, 0x1e($s1)
.L8003DE90:
/* 3EA90 8003DE90 8E630078 */  lw         $v1, 0x78($s3)
.L8003DE94:
/* 3EA94 8003DE94 84640028 */  lh         $a0, 0x28($v1)
/* 3EA98 8003DE98 8C62002C */  lw         $v0, 0x2c($v1)
/* 3EA9C 8003DE9C 0040F809 */  jalr       $v0
/* 3EAA0 8003DEA0 02642021 */   addu      $a0, $s3, $a0
/* 3EAA4 8003DEA4 0C00BFCC */  jal        func_8002FF30
/* 3EAA8 8003DEA8 8E640080 */   lw        $a0, 0x80($s3)
/* 3EAAC 8003DEAC 8E640094 */  lw         $a0, 0x94($s3)
/* 3EAB0 8003DEB0 0C011701 */  jal        dollmenu_get_item_icons
/* 3EAB4 8003DEB4 02C02821 */   addu      $a1, $s6, $zero
/* 3EAB8 8003DEB8 26A268A8 */  addiu      $v0, $s5, 0x68a8
/* 3EABC 8003DEBC 8C4314CC */  lw         $v1, 0x14cc($v0)
/* 3EAC0 8003DEC0 8C700040 */  lw         $s0, 0x40($v1)
/* 3EAC4 8003DEC4 8E020004 */  lw         $v0, 4($s0)
/* 3EAC8 8003DEC8 8C440080 */  lw         $a0, 0x80($v0)
/* 3EACC 8003DECC 0C010DA7 */  jal        func_8004369C
/* 3EAD0 8003DED0 02C02821 */   addu      $a1, $s6, $zero
/* 3EAD4 8003DED4 8E020004 */  lw         $v0, 4($s0)
/* 3EAD8 8003DED8 92650088 */  lbu        $a1, 0x88($s3)
/* 3EADC 8003DEDC 0C00E2F7 */  jal        func_80038BDC
/* 3EAE0 8003DEE0 8C440088 */   lw        $a0, 0x88($v0)
/* 3EAE4 8003DEE4 00001021 */  addu       $v0, $zero, $zero
.L8003DEE8:
/* 3EAE8 8003DEE8 8FBF0354 */  lw         $ra, 0x354($sp)
/* 3EAEC 8003DEEC 8FB60350 */  lw         $s6, 0x350($sp)
/* 3EAF0 8003DEF0 8FB5034C */  lw         $s5, 0x34c($sp)
/* 3EAF4 8003DEF4 8FB40348 */  lw         $s4, 0x348($sp)
/* 3EAF8 8003DEF8 8FB30344 */  lw         $s3, 0x344($sp)
/* 3EAFC 8003DEFC 8FB20340 */  lw         $s2, 0x340($sp)
/* 3EB00 8003DF00 8FB1033C */  lw         $s1, 0x33c($sp)
/* 3EB04 8003DF04 8FB00338 */  lw         $s0, 0x338($sp)
/* 3EB08 8003DF08 03E00008 */  jr         $ra
/* 3EB0C 8003DF0C 27BD0358 */   addiu     $sp, $sp, 0x358

glabel submenuinventorycontroller_free
/* 3EB10 8003DF10 27BDFF20 */  addiu      $sp, $sp, -0xe0
/* 3EB14 8003DF14 AFBF00D8 */  sw         $ra, 0xd8($sp)
/* 3EB18 8003DF18 AFB100D4 */  sw         $s1, 0xd4($sp)
/* 3EB1C 8003DF1C AFB000D0 */  sw         $s0, 0xd0($sp)
/* 3EB20 8003DF20 8C830080 */  lw         $v1, 0x80($a0)
/* 3EB24 8003DF24 8C640040 */  lw         $a0, 0x40($v1)
/* 3EB28 8003DF28 9482001E */  lhu        $v0, 0x1e($a0)
/* 3EB2C 8003DF2C 8C830018 */  lw         $v1, 0x18($a0)
/* 3EB30 8003DF30 00021080 */  sll        $v0, $v0, 2
/* 3EB34 8003DF34 00431021 */  addu       $v0, $v0, $v1
/* 3EB38 8003DF38 8C450000 */  lw         $a1, ($v0)
/* 3EB3C 8003DF3C 10A00080 */  beqz       $a1, .L8003E140
/* 3EB40 8003DF40 00001021 */   addu      $v0, $zero, $zero
/* 3EB44 8003DF44 8CA30078 */  lw         $v1, 0x78($a1)
/* 3EB48 8003DF48 84640088 */  lh         $a0, 0x88($v1)
/* 3EB4C 8003DF4C 8C62008C */  lw         $v0, 0x8c($v1)
/* 3EB50 8003DF50 0040F809 */  jalr       $v0
/* 3EB54 8003DF54 00A42021 */   addu      $a0, $a1, $a0
/* 3EB58 8003DF58 00408021 */  addu       $s0, $v0, $zero
/* 3EB5C 8003DF5C 96020000 */  lhu        $v0, ($s0)
/* 3EB60 8003DF60 24110012 */  addiu      $s1, $zero, 0x12
/* 3EB64 8003DF64 00021202 */  srl        $v0, $v0, 8
/* 3EB68 8003DF68 10510075 */  beq        $v0, $s1, .L8003E140
/* 3EB6C 8003DF6C 00001021 */   addu      $v0, $zero, $zero
/* 3EB70 8003DF70 0C01D728 */  jal        func_80075CA0
/* 3EB74 8003DF74 96040000 */   lhu       $a0, ($s0)
/* 3EB78 8003DF78 14400071 */  bnez       $v0, .L8003E140
/* 3EB7C 8003DF7C 00001021 */   addu      $v0, $zero, $zero
/* 3EB80 8003DF80 96020000 */  lhu        $v0, ($s0)
/* 3EB84 8003DF84 00021A02 */  srl        $v1, $v0, 8
/* 3EB88 8003DF88 3064FFFF */  andi       $a0, $v1, 0xffff
/* 3EB8C 8003DF8C 24020007 */  addiu      $v0, $zero, 7
/* 3EB90 8003DF90 1482001D */  bne        $a0, $v0, .L8003E008
/* 3EB94 8003DF94 2462FFFB */   addiu     $v0, $v1, -5
/* 3EB98 8003DF98 96050000 */  lhu        $a1, ($s0)
/* 3EB9C 8003DF9C 0C0212EC */  jal        createTempWeapon
/* 3EBA0 8003DFA0 27A40010 */   addiu     $a0, $sp, 0x10
/* 3EBA4 8003DFA4 8FA4001C */  lw         $a0, 0x1c($sp)
/* 3EBA8 8003DFA8 10800006 */  beqz       $a0, .L8003DFC4
/* 3EBAC 8003DFAC 3C05800E */   lui       $a1, %hi(D_800DC3E0)
/* 3EBB0 8003DFB0 24A5C3E0 */  addiu      $a1, $a1, %lo(D_800DC3E0)
/* 3EBB4 8003DFB4 0C02600C */  jal        Free
/* 3EBB8 8003DFB8 24060134 */   addiu     $a2, $zero, 0x134
/* 3EBBC 8003DFBC 8E02000C */  lw         $v0, 0xc($s0)
/* 3EBC0 8003DFC0 AFA2001C */  sw         $v0, 0x1c($sp)
.L8003DFC4:
/* 3EBC4 8003DFC4 8FA40020 */  lw         $a0, 0x20($sp)
/* 3EBC8 8003DFC8 10800004 */  beqz       $a0, .L8003DFDC
/* 3EBCC 8003DFCC 00000000 */   nop
/* 3EBD0 8003DFD0 8E020010 */  lw         $v0, 0x10($s0)
/* 3EBD4 8003DFD4 90430004 */  lbu        $v1, 4($v0)
/* 3EBD8 8003DFD8 A0830004 */  sb         $v1, 4($a0)
.L8003DFDC:
/* 3EBDC 8003DFDC 0C026259 */  jal        passToMalloc
/* 3EBE0 8003DFE0 24040080 */   addiu     $a0, $zero, 0x80
/* 3EBE4 8003DFE4 00402021 */  addu       $a0, $v0, $zero
/* 3EBE8 8003DFE8 0C00EDDC */  jal        weapon_info
/* 3EBEC 8003DFEC 27A50010 */   addiu     $a1, $sp, 0x10
/* 3EBF0 8003DFF0 00408021 */  addu       $s0, $v0, $zero
/* 3EBF4 8003DFF4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 3EBF8 8003DFF8 0C021315 */  jal        passto_clear_weapon_effects
/* 3EBFC 8003DFFC 27A40010 */   addiu     $a0, $sp, 0x10
/* 3EC00 8003E000 0800F84A */  j          .L8003E128
/* 3EC04 8003E004 00000000 */   nop
.L8003E008:
/* 3EC08 8003E008 2C420002 */  sltiu      $v0, $v0, 2
/* 3EC0C 8003E00C 1040001D */  beqz       $v0, .L8003E084
/* 3EC10 8003E010 2462FFF0 */   addiu     $v0, $v1, -0x10
/* 3EC14 8003E014 27B10050 */  addiu      $s1, $sp, 0x50
/* 3EC18 8003E018 96050000 */  lhu        $a1, ($s0)
/* 3EC1C 8003E01C 0C01DCA0 */  jal        make_temp_armor_3
/* 3EC20 8003E020 02202021 */   addu      $a0, $s1, $zero
/* 3EC24 8003E024 8FA4005C */  lw         $a0, 0x5c($sp)
/* 3EC28 8003E028 10800004 */  beqz       $a0, .L8003E03C
/* 3EC2C 8003E02C 3C05800E */   lui       $a1, %hi(D_800DC3E0)
/* 3EC30 8003E030 24A5C3E0 */  addiu      $a1, $a1, %lo(D_800DC3E0)
/* 3EC34 8003E034 0C02600C */  jal        Free
/* 3EC38 8003E038 24060149 */   addiu     $a2, $zero, 0x149
.L8003E03C:
/* 3EC3C 8003E03C 8E02000C */  lw         $v0, 0xc($s0)
/* 3EC40 8003E040 8FA40060 */  lw         $a0, 0x60($sp)
/* 3EC44 8003E044 10800004 */  beqz       $a0, .L8003E058
/* 3EC48 8003E048 AFA2005C */   sw        $v0, 0x5c($sp)
/* 3EC4C 8003E04C 8E020010 */  lw         $v0, 0x10($s0)
/* 3EC50 8003E050 90430004 */  lbu        $v1, 4($v0)
/* 3EC54 8003E054 A0830004 */  sb         $v1, 4($a0)
.L8003E058:
/* 3EC58 8003E058 0C026259 */  jal        passToMalloc
/* 3EC5C 8003E05C 24040080 */   addiu     $a0, $zero, 0x80
/* 3EC60 8003E060 00402021 */  addu       $a0, $v0, $zero
/* 3EC64 8003E064 0C00EE24 */  jal        armor_info
/* 3EC68 8003E068 02202821 */   addu      $a1, $s1, $zero
/* 3EC6C 8003E06C 00408021 */  addu       $s0, $v0, $zero
/* 3EC70 8003E070 AFA0005C */  sw         $zero, 0x5c($sp)
/* 3EC74 8003E074 0C01DCC4 */  jal        pssto_clear_weapon_effects
/* 3EC78 8003E078 02202021 */   addu      $a0, $s1, $zero
/* 3EC7C 8003E07C 0800F84A */  j          .L8003E128
/* 3EC80 8003E080 00000000 */   nop
.L8003E084:
/* 3EC84 8003E084 2C420002 */  sltiu      $v0, $v0, 2
/* 3EC88 8003E088 14400021 */  bnez       $v0, .L8003E110
/* 3EC8C 8003E08C 24020001 */   addiu     $v0, $zero, 1
/* 3EC90 8003E090 1082001F */  beq        $a0, $v0, .L8003E110
/* 3EC94 8003E094 00000000 */   nop
/* 3EC98 8003E098 1091001D */  beq        $a0, $s1, .L8003E110
/* 3EC9C 8003E09C 27B10090 */   addiu     $s1, $sp, 0x90
/* 3ECA0 8003E0A0 96050000 */  lhu        $a1, ($s0)
/* 3ECA4 8003E0A4 0C01F4B8 */  jal        make_temp_item
/* 3ECA8 8003E0A8 02202021 */   addu      $a0, $s1, $zero
/* 3ECAC 8003E0AC 8FA4009C */  lw         $a0, 0x9c($sp)
/* 3ECB0 8003E0B0 10800006 */  beqz       $a0, .L8003E0CC
/* 3ECB4 8003E0B4 3C05800E */   lui       $a1, %hi(D_800DC3E0)
/* 3ECB8 8003E0B8 24A5C3E0 */  addiu      $a1, $a1, %lo(D_800DC3E0)
/* 3ECBC 8003E0BC 0C02600C */  jal        Free
/* 3ECC0 8003E0C0 24060167 */   addiu     $a2, $zero, 0x167
/* 3ECC4 8003E0C4 8E02000C */  lw         $v0, 0xc($s0)
/* 3ECC8 8003E0C8 AFA2009C */  sw         $v0, 0x9c($sp)
.L8003E0CC:
/* 3ECCC 8003E0CC 8FA400A0 */  lw         $a0, 0xa0($sp)
/* 3ECD0 8003E0D0 10800004 */  beqz       $a0, .L8003E0E4
/* 3ECD4 8003E0D4 00000000 */   nop
/* 3ECD8 8003E0D8 8E020010 */  lw         $v0, 0x10($s0)
/* 3ECDC 8003E0DC 90430004 */  lbu        $v1, 4($v0)
/* 3ECE0 8003E0E0 A0830004 */  sb         $v1, 4($a0)
.L8003E0E4:
/* 3ECE4 8003E0E4 0C026259 */  jal        passToMalloc
/* 3ECE8 8003E0E8 24040080 */   addiu     $a0, $zero, 0x80
/* 3ECEC 8003E0EC 00402021 */  addu       $a0, $v0, $zero
/* 3ECF0 8003E0F0 0C00EFDD */  jal        func_8003BF74
/* 3ECF4 8003E0F4 02202821 */   addu      $a1, $s1, $zero
/* 3ECF8 8003E0F8 00408021 */  addu       $s0, $v0, $zero
/* 3ECFC 8003E0FC AFA0009C */  sw         $zero, 0x9c($sp)
/* 3ED00 8003E100 0C01F4E2 */  jal        clear_weapon_effects
/* 3ED04 8003E104 02202021 */   addu      $a0, $s1, $zero
/* 3ED08 8003E108 0800F84A */  j          .L8003E128
/* 3ED0C 8003E10C 00000000 */   nop
.L8003E110:
/* 3ED10 8003E110 0C026259 */  jal        passToMalloc
/* 3ED14 8003E114 24040080 */   addiu     $a0, $zero, 0x80
/* 3ED18 8003E118 00402021 */  addu       $a0, $v0, $zero
/* 3ED1C 8003E11C 0C00E829 */  jal        itemdetail_potion_other
/* 3ED20 8003E120 02002821 */   addu      $a1, $s0, $zero
/* 3ED24 8003E124 00408021 */  addu       $s0, $v0, $zero
.L8003E128:
/* 3ED28 8003E128 12000004 */  beqz       $s0, .L8003E13C
/* 3ED2C 8003E12C 3C02800E */   lui       $v0, %hi(widget_handler_pointer)
/* 3ED30 8003E130 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 3ED34 8003E134 0C02DC7C */  jal        widgetHandler
/* 3ED38 8003E138 02002821 */   addu      $a1, $s0, $zero
.L8003E13C:
/* 3ED3C 8003E13C 00001021 */  addu       $v0, $zero, $zero
.L8003E140:
/* 3ED40 8003E140 8FBF00D8 */  lw         $ra, 0xd8($sp)
/* 3ED44 8003E144 8FB100D4 */  lw         $s1, 0xd4($sp)
/* 3ED48 8003E148 8FB000D0 */  lw         $s0, 0xd0($sp)
/* 3ED4C 8003E14C 03E00008 */  jr         $ra
/* 3ED50 8003E150 27BD00E0 */   addiu     $sp, $sp, 0xe0
/* 3ED54 8003E154 00000000 */  nop
/* 3ED58 8003E158 00000000 */  nop
/* 3ED5C 8003E15C 00000000 */  nop
