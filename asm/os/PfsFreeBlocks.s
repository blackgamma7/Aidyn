.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsFreeBlocks
/* C6CD0 800C60D0 27BDFED0 */  addiu      $sp, $sp, -0x130
/* C6CD4 800C60D4 AFB20118 */  sw         $s2, 0x118($sp)
/* C6CD8 800C60D8 00809021 */  addu       $s2, $a0, $zero
/* C6CDC 800C60DC AFBF0128 */  sw         $ra, 0x128($sp)
/* C6CE0 800C60E0 AFB50124 */  sw         $s5, 0x124($sp)
/* C6CE4 800C60E4 AFB40120 */  sw         $s4, 0x120($sp)
/* C6CE8 800C60E8 AFB3011C */  sw         $s3, 0x11c($sp)
/* C6CEC 800C60EC AFB10114 */  sw         $s1, 0x114($sp)
/* C6CF0 800C60F0 AFB00110 */  sw         $s0, 0x110($sp)
/* C6CF4 800C60F4 8E420000 */  lw         $v0, ($s2)
/* C6CF8 800C60F8 00A0A821 */  addu       $s5, $a1, $zero
/* C6CFC 800C60FC 30420001 */  andi       $v0, $v0, 1
/* C6D00 800C6100 14400003 */  bnez       $v0, .L800C6110
/* C6D04 800C6104 00009821 */   addu      $s3, $zero, $zero
/* C6D08 800C6108 0803186E */  j          .L800C61B8
/* C6D0C 800C610C 24020005 */   addiu     $v0, $zero, 5
.L800C6110:
/* C6D10 800C6110 0C031601 */  jal        __osCheckId
/* C6D14 800C6114 02402021 */   addu      $a0, $s2, $zero
/* C6D18 800C6118 14400027 */  bnez       $v0, .L800C61B8
/* C6D1C 800C611C 00000000 */   nop
/* C6D20 800C6120 92420064 */  lbu        $v0, 0x64($s2)
/* C6D24 800C6124 0262102B */  sltu       $v0, $s3, $v0
/* C6D28 800C6128 10400020 */  beqz       $v0, .L800C61AC
/* C6D2C 800C612C 00008821 */   addu      $s1, $zero, $zero
/* C6D30 800C6130 27B40010 */  addiu      $s4, $sp, 0x10
/* C6D34 800C6134 02402021 */  addu       $a0, $s2, $zero
.L800C6138:
/* C6D38 800C6138 323000FF */  andi       $s0, $s1, 0xff
/* C6D3C 800C613C 27A50010 */  addiu      $a1, $sp, 0x10
/* C6D40 800C6140 00003021 */  addu       $a2, $zero, $zero
/* C6D44 800C6144 0C03162F */  jal        __osPfsRWInode
/* C6D48 800C6148 02003821 */   addu      $a3, $s0, $zero
/* C6D4C 800C614C 1440001A */  bnez       $v0, .L800C61B8
/* C6D50 800C6150 00000000 */   nop
/* C6D54 800C6154 16000002 */  bnez       $s0, .L800C6160
/* C6D58 800C6158 24020001 */   addiu     $v0, $zero, 1
/* C6D5C 800C615C 8E420060 */  lw         $v0, 0x60($s2)
.L800C6160:
/* C6D60 800C6160 00402021 */  addu       $a0, $v0, $zero
/* C6D64 800C6164 28820080 */  slti       $v0, $a0, 0x80
/* C6D68 800C6168 1040000A */  beqz       $v0, .L800C6194
/* C6D6C 800C616C 00041040 */   sll       $v0, $a0, 1
/* C6D70 800C6170 00541821 */  addu       $v1, $v0, $s4
.L800C6174:
/* C6D74 800C6174 94620000 */  lhu        $v0, ($v1)
/* C6D78 800C6178 24840001 */  addiu      $a0, $a0, 1
/* C6D7C 800C617C 38420003 */  xori       $v0, $v0, 3
/* C6D80 800C6180 2C420001 */  sltiu      $v0, $v0, 1
/* C6D84 800C6184 02629821 */  addu       $s3, $s3, $v0
/* C6D88 800C6188 28820080 */  slti       $v0, $a0, 0x80
/* C6D8C 800C618C 1440FFF9 */  bnez       $v0, .L800C6174
/* C6D90 800C6190 24630002 */   addiu     $v1, $v1, 2
.L800C6194:
/* C6D94 800C6194 92430064 */  lbu        $v1, 0x64($s2)
/* C6D98 800C6198 26310001 */  addiu      $s1, $s1, 1
/* C6D9C 800C619C 322200FF */  andi       $v0, $s1, 0xff
/* C6DA0 800C61A0 0043102B */  sltu       $v0, $v0, $v1
/* C6DA4 800C61A4 5440FFE4 */  bnel       $v0, $zero, .L800C6138
/* C6DA8 800C61A8 02402021 */   addu      $a0, $s2, $zero
.L800C61AC:
/* C6DAC 800C61AC 00131200 */  sll        $v0, $s3, 8
/* C6DB0 800C61B0 AEA20000 */  sw         $v0, ($s5)
/* C6DB4 800C61B4 00001021 */  addu       $v0, $zero, $zero
.L800C61B8:
/* C6DB8 800C61B8 8FBF0128 */  lw         $ra, 0x128($sp)
/* C6DBC 800C61BC 8FB50124 */  lw         $s5, 0x124($sp)
/* C6DC0 800C61C0 8FB40120 */  lw         $s4, 0x120($sp)
/* C6DC4 800C61C4 8FB3011C */  lw         $s3, 0x11c($sp)
/* C6DC8 800C61C8 8FB20118 */  lw         $s2, 0x118($sp)
/* C6DCC 800C61CC 8FB10114 */  lw         $s1, 0x114($sp)
/* C6DD0 800C61D0 8FB00110 */  lw         $s0, 0x110($sp)
/* C6DD4 800C61D4 03E00008 */  jr         $ra
/* C6DD8 800C61D8 27BD0130 */   addiu     $sp, $sp, 0x130
/* C6DDC 800C61DC 00000000 */  nop
