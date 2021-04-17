.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8005BCE0
/* 5C8E0 8005BCE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C8E4 8005BCE4 AFB00010 */  sw         $s0, 0x10($sp)
/* 5C8E8 8005BCE8 00808021 */  addu       $s0, $a0, $zero
/* 5C8EC 8005BCEC AFBF0014 */  sw         $ra, 0x14($sp)
/* 5C8F0 8005BCF0 9203005B */  lbu        $v1, 0x5b($s0)
/* 5C8F4 8005BCF4 2C6200C3 */  sltiu      $v0, $v1, 0xc3
/* 5C8F8 8005BCF8 10400003 */  beqz       $v0, .L8005BD08
/* 5C8FC 8005BCFC 2462003C */   addiu     $v0, $v1, 0x3c
/* 5C900 8005BD00 08016F46 */  j          .L8005BD18
/* 5C904 8005BD04 A202005B */   sb        $v0, 0x5b($s0)
.L8005BD08:
/* 5C908 8005BD08 240200FF */  addiu      $v0, $zero, 0xff
/* 5C90C 8005BD0C 24030002 */  addiu      $v1, $zero, 2
/* 5C910 8005BD10 A202005B */  sb         $v0, 0x5b($s0)
/* 5C914 8005BD14 A2030070 */  sb         $v1, 0x70($s0)
.L8005BD18:
/* 5C918 8005BD18 8E030078 */  lw         $v1, 0x78($s0)
/* 5C91C 8005BD1C 84640028 */  lh         $a0, 0x28($v1)
/* 5C920 8005BD20 8C62002C */  lw         $v0, 0x2c($v1)
/* 5C924 8005BD24 0040F809 */  jalr       $v0
/* 5C928 8005BD28 02042021 */   addu      $a0, $s0, $a0
/* 5C92C 8005BD2C 92020070 */  lbu        $v0, 0x70($s0)
/* 5C930 8005BD30 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5C934 8005BD34 8FB00010 */  lw         $s0, 0x10($sp)
/* 5C938 8005BD38 03E00008 */  jr         $ra
/* 5C93C 8005BD3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005BD40
/* 5C940 8005BD40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C944 8005BD44 AFB00010 */  sw         $s0, 0x10($sp)
/* 5C948 8005BD48 00808021 */  addu       $s0, $a0, $zero
/* 5C94C 8005BD4C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5C950 8005BD50 9203005B */  lbu        $v1, 0x5b($s0)
/* 5C954 8005BD54 2C62003D */  sltiu      $v0, $v1, 0x3d
/* 5C958 8005BD58 14400004 */  bnez       $v0, .L8005BD6C
/* 5C95C 8005BD5C 24020006 */   addiu     $v0, $zero, 6
/* 5C960 8005BD60 2462FFC4 */  addiu      $v0, $v1, -0x3c
/* 5C964 8005BD64 08016F5D */  j          .L8005BD74
/* 5C968 8005BD68 A202005B */   sb        $v0, 0x5b($s0)
.L8005BD6C:
/* 5C96C 8005BD6C A200005B */  sb         $zero, 0x5b($s0)
/* 5C970 8005BD70 A2020070 */  sb         $v0, 0x70($s0)
.L8005BD74:
/* 5C974 8005BD74 8E030078 */  lw         $v1, 0x78($s0)
/* 5C978 8005BD78 84640028 */  lh         $a0, 0x28($v1)
/* 5C97C 8005BD7C 8C62002C */  lw         $v0, 0x2c($v1)
/* 5C980 8005BD80 0040F809 */  jalr       $v0
/* 5C984 8005BD84 02042021 */   addu      $a0, $s0, $a0
/* 5C988 8005BD88 92020070 */  lbu        $v0, 0x70($s0)
/* 5C98C 8005BD8C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5C990 8005BD90 8FB00010 */  lw         $s0, 0x10($sp)
/* 5C994 8005BD94 03E00008 */  jr         $ra
/* 5C998 8005BD98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005BD9C
/* 5C99C 8005BD9C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C9A0 8005BDA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5C9A4 8005BDA4 8C85007C */  lw         $a1, 0x7c($a0)
/* 5C9A8 8005BDA8 8CA30078 */  lw         $v1, 0x78($a1)
/* 5C9AC 8005BDAC 84640058 */  lh         $a0, 0x58($v1)
/* 5C9B0 8005BDB0 8C62005C */  lw         $v0, 0x5c($v1)
/* 5C9B4 8005BDB4 0040F809 */  jalr       $v0
/* 5C9B8 8005BDB8 00A42021 */   addu      $a0, $a1, $a0
/* 5C9BC 8005BDBC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5C9C0 8005BDC0 03E00008 */  jr         $ra
/* 5C9C4 8005BDC4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005BDC8
/* 5C9C8 8005BDC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C9CC 8005BDCC AFBF0010 */  sw         $ra, 0x10($sp)
/* 5C9D0 8005BDD0 8C85007C */  lw         $a1, 0x7c($a0)
/* 5C9D4 8005BDD4 8CA30078 */  lw         $v1, 0x78($a1)
/* 5C9D8 8005BDD8 84640060 */  lh         $a0, 0x60($v1)
/* 5C9DC 8005BDDC 8C620064 */  lw         $v0, 0x64($v1)
/* 5C9E0 8005BDE0 0040F809 */  jalr       $v0
/* 5C9E4 8005BDE4 00A42021 */   addu      $a0, $a1, $a0
/* 5C9E8 8005BDE8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5C9EC 8005BDEC 03E00008 */  jr         $ra
/* 5C9F0 8005BDF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005BDF4
/* 5C9F4 8005BDF4 24020005 */  addiu      $v0, $zero, 5
/* 5C9F8 8005BDF8 A0820070 */  sb         $v0, 0x70($a0)
/* 5C9FC 8005BDFC 03E00008 */  jr         $ra
/* 5CA00 8005BE00 00001021 */   addu      $v0, $zero, $zero

glabel func_8005BE04
/* 5CA04 8005BE04 24020005 */  addiu      $v0, $zero, 5
/* 5CA08 8005BE08 A0820070 */  sb         $v0, 0x70($a0)
/* 5CA0C 8005BE0C 03E00008 */  jr         $ra
/* 5CA10 8005BE10 00001021 */   addu      $v0, $zero, $zero

glabel func_8005BE14
/* 5CA14 8005BE14 24020005 */  addiu      $v0, $zero, 5
/* 5CA18 8005BE18 A0820070 */  sb         $v0, 0x70($a0)
/* 5CA1C 8005BE1C 03E00008 */  jr         $ra
/* 5CA20 8005BE20 00001021 */   addu      $v0, $zero, $zero
/* 5CA24 8005BE24 00000000 */  nop
/* 5CA28 8005BE28 00000000 */  nop
/* 5CA2C 8005BE2C 00000000 */  nop
