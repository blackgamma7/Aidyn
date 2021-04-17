.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ret0_800a7040
/* A7C40 800A7040 03E00008 */  jr         $ra
/* A7C44 800A7044 00001021 */   addu      $v0, $zero, $zero

glabel noop_800a7048
/* A7C48 800A7048 03E00008 */  jr         $ra
/* A7C4C 800A704C 00000000 */   nop

glabel borg_10_clear
/* A7C50 800A7050 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A7C54 800A7054 AFB00010 */  sw         $s0, 0x10($sp)
/* A7C58 800A7058 00808021 */  addu       $s0, $a0, $zero
/* A7C5C 800A705C AFBF0018 */  sw         $ra, 0x18($sp)
/* A7C60 800A7060 0C02608C */  jal        get_memUsed
/* A7C64 800A7064 AFB10014 */   sw        $s1, 0x14($sp)
/* A7C68 800A7068 00408821 */  addu       $s1, $v0, $zero
/* A7C6C 800A706C 8E040000 */  lw         $a0, ($s0)
/* A7C70 800A7070 2402FFFF */  addiu      $v0, $zero, -1
/* A7C74 800A7074 14820007 */  bne        $a0, $v0, .L800A7094
/* A7C78 800A7078 3C05800E */   lui       $a1, %hi(D_800E33D0)
/* A7C7C 800A707C 02002021 */  addu       $a0, $s0, $zero
/* A7C80 800A7080 24A533D0 */  addiu      $a1, $a1, %lo(D_800E33D0)
/* A7C84 800A7084 0C02600C */  jal        Free
/* A7C88 800A7088 2406007B */   addiu     $a2, $zero, 0x7b
/* A7C8C 800A708C 08029C27 */  j          .L800A709C
/* A7C90 800A7090 00000000 */   nop
.L800A7094:
/* A7C94 800A7094 0C028B7F */  jal        dec_borg_count
/* A7C98 800A7098 00000000 */   nop
.L800A709C:
/* A7C9C 800A709C 0C02608C */  jal        get_memUsed
/* A7CA0 800A70A0 00000000 */   nop
/* A7CA4 800A70A4 3C06800F */  lui        $a2, %hi(borg_mem)
/* A7CA8 800A70A8 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A7CAC 800A70AC 02221023 */  subu       $v0, $s1, $v0
/* A7CB0 800A70B0 3C05800F */  lui        $a1, %hi(borg_count)
/* A7CB4 800A70B4 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A7CB8 800A70B8 8CC30028 */  lw         $v1, 0x28($a2)
/* A7CBC 800A70BC 8CA40028 */  lw         $a0, 0x28($a1)
/* A7CC0 800A70C0 8FBF0018 */  lw         $ra, 0x18($sp)
/* A7CC4 800A70C4 8FB10014 */  lw         $s1, 0x14($sp)
/* A7CC8 800A70C8 8FB00010 */  lw         $s0, 0x10($sp)
/* A7CCC 800A70CC 00621823 */  subu       $v1, $v1, $v0
/* A7CD0 800A70D0 2484FFFF */  addiu      $a0, $a0, -1
/* A7CD4 800A70D4 ACC30028 */  sw         $v1, 0x28($a2)
/* A7CD8 800A70D8 ACA40028 */  sw         $a0, 0x28($a1)
/* A7CDC 800A70DC 03E00008 */  jr         $ra
/* A7CE0 800A70E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A70E4
/* A7CE4 800A70E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7CE8 800A70E8 AFB00010 */  sw         $s0, 0x10($sp)
/* A7CEC 800A70EC AFBF0014 */  sw         $ra, 0x14($sp)
/* A7CF0 800A70F0 0C02891C */  jal        clearBorgFlag
/* A7CF4 800A70F4 00808021 */   addu      $s0, $a0, $zero
/* A7CF8 800A70F8 0C028A22 */  jal        getBorgItem
/* A7CFC 800A70FC 02002021 */   addu      $a0, $s0, $zero
/* A7D00 800A7100 8FBF0014 */  lw         $ra, 0x14($sp)
/* A7D04 800A7104 8FB00010 */  lw         $s0, 0x10($sp)
/* A7D08 800A7108 03E00008 */  jr         $ra
/* A7D0C 800A710C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A7110
/* A7D10 800A7110 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7D14 800A7114 AFBF0010 */  sw         $ra, 0x10($sp)
/* A7D18 800A7118 0C029C14 */  jal        borg_10_clear
/* A7D1C 800A711C 00000000 */   nop
/* A7D20 800A7120 8FBF0010 */  lw         $ra, 0x10($sp)
/* A7D24 800A7124 03E00008 */  jr         $ra
/* A7D28 800A7128 27BD0018 */   addiu     $sp, $sp, 0x18
/* A7D2C 800A712C 00000000 */  nop
