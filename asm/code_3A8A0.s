.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80039CA0
/* 3A8A0 80039CA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3A8A4 80039CA4 AFB00010 */  sw         $s0, 0x10($sp)
/* 3A8A8 80039CA8 00808021 */  addu       $s0, $a0, $zero
/* 3A8AC 80039CAC AFBF0014 */  sw         $ra, 0x14($sp)
/* 3A8B0 80039CB0 92020084 */  lbu        $v0, 0x84($s0)
/* 3A8B4 80039CB4 00021080 */  sll        $v0, $v0, 2
/* 3A8B8 80039CB8 02021021 */  addu       $v0, $s0, $v0
/* 3A8BC 80039CBC 8C45007C */  lw         $a1, 0x7c($v0)
/* 3A8C0 80039CC0 8CA30078 */  lw         $v1, 0x78($a1)
/* 3A8C4 80039CC4 84640058 */  lh         $a0, 0x58($v1)
/* 3A8C8 80039CC8 8C62005C */  lw         $v0, 0x5c($v1)
/* 3A8CC 80039CCC 0040F809 */  jalr       $v0
/* 3A8D0 80039CD0 00A42021 */   addu      $a0, $a1, $a0
/* 3A8D4 80039CD4 0C00E6DF */  jal        func_80039B7C
/* 3A8D8 80039CD8 02002021 */   addu      $a0, $s0, $zero
/* 3A8DC 80039CDC 0C00E5B2 */  jal        func_800396C8
/* 3A8E0 80039CE0 02002021 */   addu      $a0, $s0, $zero
/* 3A8E4 80039CE4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3A8E8 80039CE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 3A8EC 80039CEC 00001021 */  addu       $v0, $zero, $zero
/* 3A8F0 80039CF0 03E00008 */  jr         $ra
/* 3A8F4 80039CF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039CF8
/* 3A8F8 80039CF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3A8FC 80039CFC AFB00010 */  sw         $s0, 0x10($sp)
/* 3A900 80039D00 00808021 */  addu       $s0, $a0, $zero
/* 3A904 80039D04 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3A908 80039D08 92020084 */  lbu        $v0, 0x84($s0)
/* 3A90C 80039D0C 00021080 */  sll        $v0, $v0, 2
/* 3A910 80039D10 02021021 */  addu       $v0, $s0, $v0
/* 3A914 80039D14 8C45007C */  lw         $a1, 0x7c($v0)
/* 3A918 80039D18 8CA30078 */  lw         $v1, 0x78($a1)
/* 3A91C 80039D1C 84640060 */  lh         $a0, 0x60($v1)
/* 3A920 80039D20 8C620064 */  lw         $v0, 0x64($v1)
/* 3A924 80039D24 0040F809 */  jalr       $v0
/* 3A928 80039D28 00A42021 */   addu      $a0, $a1, $a0
/* 3A92C 80039D2C 0C00E6DF */  jal        func_80039B7C
/* 3A930 80039D30 02002021 */   addu      $a0, $s0, $zero
/* 3A934 80039D34 0C00E5B2 */  jal        func_800396C8
/* 3A938 80039D38 02002021 */   addu      $a0, $s0, $zero
/* 3A93C 80039D3C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3A940 80039D40 8FB00010 */  lw         $s0, 0x10($sp)
/* 3A944 80039D44 00001021 */  addu       $v0, $zero, $zero
/* 3A948 80039D48 03E00008 */  jr         $ra
/* 3A94C 80039D4C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039D50
/* 3A950 80039D50 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3A954 80039D54 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3A958 80039D58 0C00E685 */  jal        func_80039A14
/* 3A95C 80039D5C 00002821 */   addu      $a1, $zero, $zero
/* 3A960 80039D60 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3A964 80039D64 00001021 */  addu       $v0, $zero, $zero
/* 3A968 80039D68 03E00008 */  jr         $ra
/* 3A96C 80039D6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039D70
/* 3A970 80039D70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3A974 80039D74 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3A978 80039D78 0C00E685 */  jal        func_80039A14
/* 3A97C 80039D7C 24050001 */   addiu     $a1, $zero, 1
/* 3A980 80039D80 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3A984 80039D84 00001021 */  addu       $v0, $zero, $zero
/* 3A988 80039D88 03E00008 */  jr         $ra
/* 3A98C 80039D8C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039D90
/* 3A990 80039D90 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3A994 80039D94 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3A998 80039D98 AFB10014 */  sw         $s1, 0x14($sp)
/* 3A99C 80039D9C AFB00010 */  sw         $s0, 0x10($sp)
/* 3A9A0 80039DA0 90820084 */  lbu        $v0, 0x84($a0)
/* 3A9A4 80039DA4 00021080 */  sll        $v0, $v0, 2
/* 3A9A8 80039DA8 00822021 */  addu       $a0, $a0, $v0
/* 3A9AC 80039DAC 8C83007C */  lw         $v1, 0x7c($a0)
/* 3A9B0 80039DB0 8C650078 */  lw         $a1, 0x78($v1)
/* 3A9B4 80039DB4 84A40078 */  lh         $a0, 0x78($a1)
/* 3A9B8 80039DB8 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 3A9BC 80039DBC 00642021 */  addu       $a0, $v1, $a0
/* 3A9C0 80039DC0 8C437D74 */  lw         $v1, %lo(bigAssMenu)($v0)
/* 3A9C4 80039DC4 8CA2007C */  lw         $v0, 0x7c($a1)
/* 3A9C8 80039DC8 0040F809 */  jalr       $v0
/* 3A9CC 80039DCC 8C710040 */   lw        $s1, 0x40($v1)
/* 3A9D0 80039DD0 00408021 */  addu       $s0, $v0, $zero
/* 3A9D4 80039DD4 12000014 */  beqz       $s0, .L80039E28
/* 3A9D8 80039DD8 00001021 */   addu      $v0, $zero, $zero
/* 3A9DC 80039DDC 8E030078 */  lw         $v1, 0x78($s0)
/* 3A9E0 80039DE0 84640078 */  lh         $a0, 0x78($v1)
/* 3A9E4 80039DE4 8C62007C */  lw         $v0, 0x7c($v1)
/* 3A9E8 80039DE8 0040F809 */  jalr       $v0
/* 3A9EC 80039DEC 02042021 */   addu      $a0, $s0, $a0
/* 3A9F0 80039DF0 8E240004 */  lw         $a0, 4($s1)
/* 3A9F4 80039DF4 8C850088 */  lw         $a1, 0x88($a0)
/* 3A9F8 80039DF8 90A30090 */  lbu        $v1, 0x90($a1)
/* 3A9FC 80039DFC 00031880 */  sll        $v1, $v1, 2
/* 3AA00 80039E00 00A32821 */  addu       $a1, $a1, $v1
/* 3AA04 80039E04 8CA4007C */  lw         $a0, 0x7c($a1)
/* 3AA08 80039E08 9446005E */  lhu        $a2, 0x5e($v0)
/* 3AA0C 80039E0C 8C830078 */  lw         $v1, 0x78($a0)
/* 3AA10 80039E10 9605005E */  lhu        $a1, 0x5e($s0)
/* 3AA14 80039E14 846700D8 */  lh         $a3, 0xd8($v1)
/* 3AA18 80039E18 8C6800DC */  lw         $t0, 0xdc($v1)
/* 3AA1C 80039E1C 0100F809 */  jalr       $t0
/* 3AA20 80039E20 00872021 */   addu      $a0, $a0, $a3
/* 3AA24 80039E24 00001021 */  addu       $v0, $zero, $zero
.L80039E28:
/* 3AA28 80039E28 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3AA2C 80039E2C 8FB10014 */  lw         $s1, 0x14($sp)
/* 3AA30 80039E30 8FB00010 */  lw         $s0, 0x10($sp)
/* 3AA34 80039E34 03E00008 */  jr         $ra
/* 3AA38 80039E38 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80039E3C
/* 3AA3C 80039E3C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3AA40 80039E40 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3AA44 80039E44 90820084 */  lbu        $v0, 0x84($a0)
/* 3AA48 80039E48 00021080 */  sll        $v0, $v0, 2
/* 3AA4C 80039E4C 00822021 */  addu       $a0, $a0, $v0
/* 3AA50 80039E50 8C85007C */  lw         $a1, 0x7c($a0)
/* 3AA54 80039E54 8CA30078 */  lw         $v1, 0x78($a1)
/* 3AA58 80039E58 846400B0 */  lh         $a0, 0xb0($v1)
/* 3AA5C 80039E5C 8C6200B4 */  lw         $v0, 0xb4($v1)
/* 3AA60 80039E60 0040F809 */  jalr       $v0
/* 3AA64 80039E64 00A42021 */   addu      $a0, $a1, $a0
/* 3AA68 80039E68 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3AA6C 80039E6C 00001021 */  addu       $v0, $zero, $zero
/* 3AA70 80039E70 03E00008 */  jr         $ra
/* 3AA74 80039E74 27BD0018 */   addiu     $sp, $sp, 0x18
/* 3AA78 80039E78 00000000 */  nop
/* 3AA7C 80039E7C 00000000 */  nop
