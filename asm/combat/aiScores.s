.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80064F60
/* 65B60 80064F60 8C820000 */  lw         $v0, ($a0)
/* 65B64 80064F64 8CA30000 */  lw         $v1, ($a1)
/* 65B68 80064F68 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 65B6C 80064F6C AFA20000 */  sw         $v0, ($sp)
/* 65B70 80064F70 AFA30040 */  sw         $v1, 0x40($sp)
/* 65B74 80064F74 8C820004 */  lw         $v0, 4($a0)
/* 65B78 80064F78 8CA30004 */  lw         $v1, 4($a1)
/* 65B7C 80064F7C 93A50000 */  lbu        $a1, ($sp)
/* 65B80 80064F80 93A40040 */  lbu        $a0, 0x40($sp)
/* 65B84 80064F84 AFA20004 */  sw         $v0, 4($sp)
/* 65B88 80064F88 00A4102B */  sltu       $v0, $a1, $a0
/* 65B8C 80064F8C 14400006 */  bnez       $v0, .L80064FA8
/* 65B90 80064F90 AFA30044 */   sw        $v1, 0x44($sp)
/* 65B94 80064F94 0085182B */  sltu       $v1, $a0, $a1
/* 65B98 80064F98 14600004 */  bnez       $v1, .L80064FAC
/* 65B9C 80064F9C 2402FFFF */   addiu     $v0, $zero, -1
/* 65BA0 80064FA0 080193EB */  j          .L80064FAC
/* 65BA4 80064FA4 00001021 */   addu      $v0, $zero, $zero
.L80064FA8:
/* 65BA8 80064FA8 24020001 */  addiu      $v0, $zero, 1
.L80064FAC:
/* 65BAC 80064FAC 03E00008 */  jr         $ra
/* 65BB0 80064FB0 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_80064FB4
/* 65BB4 80064FB4 8C820000 */  lw         $v0, ($a0)
/* 65BB8 80064FB8 8CA30000 */  lw         $v1, ($a1)
/* 65BBC 80064FBC 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 65BC0 80064FC0 AFA20000 */  sw         $v0, ($sp)
/* 65BC4 80064FC4 AFA30040 */  sw         $v1, 0x40($sp)
/* 65BC8 80064FC8 8C820004 */  lw         $v0, 4($a0)
/* 65BCC 80064FCC 8CA30004 */  lw         $v1, 4($a1)
/* 65BD0 80064FD0 93A50000 */  lbu        $a1, ($sp)
/* 65BD4 80064FD4 93A40040 */  lbu        $a0, 0x40($sp)
/* 65BD8 80064FD8 AFA20004 */  sw         $v0, 4($sp)
/* 65BDC 80064FDC 0085102B */  sltu       $v0, $a0, $a1
/* 65BE0 80064FE0 14400006 */  bnez       $v0, .L80064FFC
/* 65BE4 80064FE4 AFA30044 */   sw        $v1, 0x44($sp)
/* 65BE8 80064FE8 00A4182B */  sltu       $v1, $a1, $a0
/* 65BEC 80064FEC 14600004 */  bnez       $v1, .L80065000
/* 65BF0 80064FF0 2402FFFF */   addiu     $v0, $zero, -1
/* 65BF4 80064FF4 08019400 */  j          .L80065000
/* 65BF8 80064FF8 00001021 */   addu      $v0, $zero, $zero
.L80064FFC:
/* 65BFC 80064FFC 24020001 */  addiu      $v0, $zero, 1
.L80065000:
/* 65C00 80065000 03E00008 */  jr         $ra
/* 65C04 80065004 27BD0080 */   addiu     $sp, $sp, 0x80

glabel combat_aiscores_clear
/* 65C08 80065008 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 65C0C 8006500C AFB20018 */  sw         $s2, 0x18($sp)
/* 65C10 80065010 3C12800E */  lui        $s2, 0x800e
/* 65C14 80065014 AFB40020 */  sw         $s4, 0x20($sp)
/* 65C18 80065018 3C14800F */  lui        $s4, %hi(aiscores_move)
/* 65C1C 8006501C AFB10014 */  sw         $s1, 0x14($sp)
/* 65C20 80065020 2691F750 */  addiu      $s1, $s4, %lo(aiscores_move)
/* 65C24 80065024 AFBF0024 */  sw         $ra, 0x24($sp)
/* 65C28 80065028 AFB3001C */  sw         $s3, 0x1c($sp)
/* 65C2C 8006502C AFB00010 */  sw         $s0, 0x10($sp)
/* 65C30 80065030 8E220004 */  lw         $v0, 4($s1)
/* 65C34 80065034 10400006 */  beqz       $v0, .L80065050
/* 65C38 80065038 3093FFFF */   andi      $s3, $a0, 0xffff
/* 65C3C 8006503C 00402021 */  addu       $a0, $v0, $zero
/* 65C40 80065040 2645F760 */  addiu      $a1, $s2, -0x8a0
/* 65C44 80065044 0C02600C */  jal        Free
/* 65C48 80065048 24060055 */   addiu     $a2, $zero, 0x55
/* 65C4C 8006504C AE200004 */  sw         $zero, 4($s1)
.L80065050:
/* 65C50 80065050 001380C0 */  sll        $s0, $s3, 3
/* 65C54 80065054 02002021 */  addu       $a0, $s0, $zero
/* 65C58 80065058 2645F760 */  addiu      $a1, $s2, -0x8a0
/* 65C5C 8006505C 0C025F9C */  jal        Malloc
/* 65C60 80065060 24060059 */   addiu     $a2, $zero, 0x59
/* 65C64 80065064 00402021 */  addu       $a0, $v0, $zero
/* 65C68 80065068 00002821 */  addu       $a1, $zero, $zero
/* 65C6C 8006506C 02003021 */  addu       $a2, $s0, $zero
/* 65C70 80065070 0C026380 */  jal        Calloc
/* 65C74 80065074 AE220004 */   sw        $v0, 4($s1)
/* 65C78 80065078 8FBF0024 */  lw         $ra, 0x24($sp)
/* 65C7C 8006507C A693F750 */  sh         $s3, -0x8b0($s4)
/* 65C80 80065080 8FB40020 */  lw         $s4, 0x20($sp)
/* 65C84 80065084 8FB3001C */  lw         $s3, 0x1c($sp)
/* 65C88 80065088 8FB20018 */  lw         $s2, 0x18($sp)
/* 65C8C 8006508C A6200002 */  sh         $zero, 2($s1)
/* 65C90 80065090 8FB10014 */  lw         $s1, 0x14($sp)
/* 65C94 80065094 8FB00010 */  lw         $s0, 0x10($sp)
/* 65C98 80065098 03E00008 */  jr         $ra
/* 65C9C 8006509C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel set_combat_aiscore
/* 65CA0 800650A0 308900FF */  andi       $t1, $a0, 0xff
/* 65CA4 800650A4 30A500FF */  andi       $a1, $a1, 0xff
/* 65CA8 800650A8 30C600FF */  andi       $a2, $a2, 0xff
/* 65CAC 800650AC 3C02800F */  lui        $v0, %hi(aiscores_move)
/* 65CB0 800650B0 2448F750 */  addiu      $t0, $v0, %lo(aiscores_move)
/* 65CB4 800650B4 95030002 */  lhu        $v1, 2($t0)
/* 65CB8 800650B8 9444F750 */  lhu        $a0, -0x8b0($v0)
/* 65CBC 800650BC 0064182B */  sltu       $v1, $v1, $a0
/* 65CC0 800650C0 1060001E */  beqz       $v1, .L8006513C
/* 65CC4 800650C4 30E700FF */   andi      $a3, $a3, 0xff
/* 65CC8 800650C8 95020002 */  lhu        $v0, 2($t0)
/* 65CCC 800650CC 8D030004 */  lw         $v1, 4($t0)
/* 65CD0 800650D0 000210C0 */  sll        $v0, $v0, 3
/* 65CD4 800650D4 00431021 */  addu       $v0, $v0, $v1
/* 65CD8 800650D8 A0470000 */  sb         $a3, ($v0)
/* 65CDC 800650DC 95030002 */  lhu        $v1, 2($t0)
/* 65CE0 800650E0 8D020004 */  lw         $v0, 4($t0)
/* 65CE4 800650E4 000318C0 */  sll        $v1, $v1, 3
/* 65CE8 800650E8 00621821 */  addu       $v1, $v1, $v0
/* 65CEC 800650EC A0690001 */  sb         $t1, 1($v1)
/* 65CF0 800650F0 95020002 */  lhu        $v0, 2($t0)
/* 65CF4 800650F4 8D030004 */  lw         $v1, 4($t0)
/* 65CF8 800650F8 000210C0 */  sll        $v0, $v0, 3
/* 65CFC 800650FC 00431021 */  addu       $v0, $v0, $v1
/* 65D00 80065100 A0450002 */  sb         $a1, 2($v0)
/* 65D04 80065104 95030002 */  lhu        $v1, 2($t0)
/* 65D08 80065108 8D020004 */  lw         $v0, 4($t0)
/* 65D0C 8006510C 000318C0 */  sll        $v1, $v1, 3
/* 65D10 80065110 00621821 */  addu       $v1, $v1, $v0
/* 65D14 80065114 A0660003 */  sb         $a2, 3($v1)
/* 65D18 80065118 95020002 */  lhu        $v0, 2($t0)
/* 65D1C 8006511C 8D050004 */  lw         $a1, 4($t0)
/* 65D20 80065120 95040002 */  lhu        $a0, 2($t0)
/* 65D24 80065124 8FA30010 */  lw         $v1, 0x10($sp)
/* 65D28 80065128 000210C0 */  sll        $v0, $v0, 3
/* 65D2C 8006512C 00451021 */  addu       $v0, $v0, $a1
/* 65D30 80065130 24840001 */  addiu      $a0, $a0, 1
/* 65D34 80065134 AC430004 */  sw         $v1, 4($v0)
/* 65D38 80065138 A5040002 */  sh         $a0, 2($t0)
.L8006513C:
/* 65D3C 8006513C 03E00008 */  jr         $ra
