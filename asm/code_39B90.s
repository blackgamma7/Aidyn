.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80038F90
/* 39B90 80038F90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 39B94 80038F94 AFB00010 */  sw         $s0, 0x10($sp)
/* 39B98 80038F98 00808021 */  addu       $s0, $a0, $zero
/* 39B9C 80038F9C AFBF0014 */  sw         $ra, 0x14($sp)
/* 39BA0 80038FA0 92020090 */  lbu        $v0, 0x90($s0)
/* 39BA4 80038FA4 00021080 */  sll        $v0, $v0, 2
/* 39BA8 80038FA8 02021021 */  addu       $v0, $s0, $v0
/* 39BAC 80038FAC 8C45007C */  lw         $a1, 0x7c($v0)
/* 39BB0 80038FB0 8CA30078 */  lw         $v1, 0x78($a1)
/* 39BB4 80038FB4 84640058 */  lh         $a0, 0x58($v1)
/* 39BB8 80038FB8 8C62005C */  lw         $v0, 0x5c($v1)
/* 39BBC 80038FBC 0040F809 */  jalr       $v0
/* 39BC0 80038FC0 00A42021 */   addu      $a0, $a1, $a0
/* 39BC4 80038FC4 0C00E388 */  jal        show_EXP_costs
/* 39BC8 80038FC8 02002021 */   addu      $a0, $s0, $zero
/* 39BCC 80038FCC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 39BD0 80038FD0 8FB00010 */  lw         $s0, 0x10($sp)
/* 39BD4 80038FD4 00001021 */  addu       $v0, $zero, $zero
/* 39BD8 80038FD8 03E00008 */  jr         $ra
/* 39BDC 80038FDC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80038FE0
/* 39BE0 80038FE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 39BE4 80038FE4 AFB00010 */  sw         $s0, 0x10($sp)
/* 39BE8 80038FE8 00808021 */  addu       $s0, $a0, $zero
/* 39BEC 80038FEC AFBF0014 */  sw         $ra, 0x14($sp)
/* 39BF0 80038FF0 92020090 */  lbu        $v0, 0x90($s0)
/* 39BF4 80038FF4 00021080 */  sll        $v0, $v0, 2
/* 39BF8 80038FF8 02021021 */  addu       $v0, $s0, $v0
/* 39BFC 80038FFC 8C45007C */  lw         $a1, 0x7c($v0)
/* 39C00 80039000 8CA30078 */  lw         $v1, 0x78($a1)
/* 39C04 80039004 84640060 */  lh         $a0, 0x60($v1)
/* 39C08 80039008 8C620064 */  lw         $v0, 0x64($v1)
/* 39C0C 8003900C 0040F809 */  jalr       $v0
/* 39C10 80039010 00A42021 */   addu      $a0, $a1, $a0
/* 39C14 80039014 0C00E388 */  jal        show_EXP_costs
/* 39C18 80039018 02002021 */   addu      $a0, $s0, $zero
/* 39C1C 8003901C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 39C20 80039020 8FB00010 */  lw         $s0, 0x10($sp)
/* 39C24 80039024 00001021 */  addu       $v0, $zero, $zero
/* 39C28 80039028 03E00008 */  jr         $ra
/* 39C2C 8003902C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039030
/* 39C30 80039030 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 39C34 80039034 AFBF0010 */  sw         $ra, 0x10($sp)
/* 39C38 80039038 0C00E318 */  jal        func_80038C60
/* 39C3C 8003903C 00002821 */   addu      $a1, $zero, $zero
/* 39C40 80039040 8FBF0010 */  lw         $ra, 0x10($sp)
/* 39C44 80039044 00001021 */  addu       $v0, $zero, $zero
/* 39C48 80039048 03E00008 */  jr         $ra
/* 39C4C 8003904C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039050
/* 39C50 80039050 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 39C54 80039054 AFBF0010 */  sw         $ra, 0x10($sp)
/* 39C58 80039058 0C00E318 */  jal        func_80038C60
/* 39C5C 8003905C 24050001 */   addiu     $a1, $zero, 1
/* 39C60 80039060 8FBF0010 */  lw         $ra, 0x10($sp)
/* 39C64 80039064 00001021 */  addu       $v0, $zero, $zero
/* 39C68 80039068 03E00008 */  jr         $ra
/* 39C6C 8003906C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80039070
/* 39C70 80039070 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 39C74 80039074 AFB00010 */  sw         $s0, 0x10($sp)
/* 39C78 80039078 00808021 */  addu       $s0, $a0, $zero
/* 39C7C 8003907C AFBF0018 */  sw         $ra, 0x18($sp)
/* 39C80 80039080 AFB10014 */  sw         $s1, 0x14($sp)
/* 39C84 80039084 92020090 */  lbu        $v0, 0x90($s0)
/* 39C88 80039088 2611007C */  addiu      $s1, $s0, 0x7c
/* 39C8C 8003908C 00021080 */  sll        $v0, $v0, 2
/* 39C90 80039090 02221021 */  addu       $v0, $s1, $v0
/* 39C94 80039094 8C450000 */  lw         $a1, ($v0)
/* 39C98 80039098 8CA30078 */  lw         $v1, 0x78($a1)
/* 39C9C 8003909C 84640078 */  lh         $a0, 0x78($v1)
/* 39CA0 800390A0 8C62007C */  lw         $v0, 0x7c($v1)
/* 39CA4 800390A4 0040F809 */  jalr       $v0
/* 39CA8 800390A8 00A42021 */   addu      $a0, $a1, $a0
/* 39CAC 800390AC 00403021 */  addu       $a2, $v0, $zero
/* 39CB0 800390B0 10C00010 */  beqz       $a2, .L800390F4
/* 39CB4 800390B4 3C02800E */   lui       $v0, %hi(someCase_1)
/* 39CB8 800390B8 90447D6C */  lbu        $a0, %lo(someCase_1)($v0)
/* 39CBC 800390BC 24030005 */  addiu      $v1, $zero, 5
/* 39CC0 800390C0 1483000D */  bne        $a0, $v1, .L800390F8
/* 39CC4 800390C4 00001021 */   addu      $v0, $zero, $zero
/* 39CC8 800390C8 92020090 */  lbu        $v0, 0x90($s0)
/* 39CCC 800390CC 00021080 */  sll        $v0, $v0, 2
/* 39CD0 800390D0 02221021 */  addu       $v0, $s1, $v0
/* 39CD4 800390D4 8C430000 */  lw         $v1, ($v0)
/* 39CD8 800390D8 8C650078 */  lw         $a1, 0x78($v1)
/* 39CDC 800390DC 84A400D8 */  lh         $a0, 0xd8($a1)
/* 39CE0 800390E0 8CA200DC */  lw         $v0, 0xdc($a1)
/* 39CE4 800390E4 94C5005E */  lhu        $a1, 0x5e($a2)
/* 39CE8 800390E8 240600FF */  addiu      $a2, $zero, 0xff
/* 39CEC 800390EC 0040F809 */  jalr       $v0
/* 39CF0 800390F0 00642021 */   addu      $a0, $v1, $a0
.L800390F4:
/* 39CF4 800390F4 00001021 */  addu       $v0, $zero, $zero
.L800390F8:
/* 39CF8 800390F8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 39CFC 800390FC 8FB10014 */  lw         $s1, 0x14($sp)
/* 39D00 80039100 8FB00010 */  lw         $s0, 0x10($sp)
/* 39D04 80039104 03E00008 */  jr         $ra
/* 39D08 80039108 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8003910C
/* 39D0C 8003910C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 39D10 80039110 AFBF0010 */  sw         $ra, 0x10($sp)
/* 39D14 80039114 90820090 */  lbu        $v0, 0x90($a0)
/* 39D18 80039118 00021080 */  sll        $v0, $v0, 2
/* 39D1C 8003911C 00822021 */  addu       $a0, $a0, $v0
/* 39D20 80039120 8C85007C */  lw         $a1, 0x7c($a0)
/* 39D24 80039124 8CA30078 */  lw         $v1, 0x78($a1)
/* 39D28 80039128 846400B0 */  lh         $a0, 0xb0($v1)
/* 39D2C 8003912C 8C6200B4 */  lw         $v0, 0xb4($v1)
/* 39D30 80039130 0040F809 */  jalr       $v0
/* 39D34 80039134 00A42021 */   addu      $a0, $a1, $a0
/* 39D38 80039138 8FBF0010 */  lw         $ra, 0x10($sp)
/* 39D3C 8003913C 00001021 */  addu       $v0, $zero, $zero
/* 39D40 80039140 03E00008 */  jr         $ra
/* 39D44 80039144 27BD0018 */   addiu     $sp, $sp, 0x18
/* 39D48 80039148 00000000 */  nop
/* 39D4C 8003914C 00000000 */  nop
