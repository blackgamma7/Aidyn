.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel borg11_func_a
/* A7D30 800A7130 8C82000C */  lw         $v0, 0xc($a0)
/* A7D34 800A7134 00441021 */  addu       $v0, $v0, $a0
/* A7D38 800A7138 03E00008 */  jr         $ra
/* A7D3C 800A713C AC82000C */   sw        $v0, 0xc($a0)

glabel borg11_func_b
/* A7D40 800A7140 AC850008 */  sw         $a1, 8($a0)
/* A7D44 800A7144 03E00008 */  jr         $ra
/* A7D48 800A7148 00001021 */   addu      $v0, $zero, $zero

glabel borg11_free
/* A7D4C 800A714C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A7D50 800A7150 AFB10014 */  sw         $s1, 0x14($sp)
/* A7D54 800A7154 00808821 */  addu       $s1, $a0, $zero
/* A7D58 800A7158 AFBF001C */  sw         $ra, 0x1c($sp)
/* A7D5C 800A715C AFB20018 */  sw         $s2, 0x18($sp)
/* A7D60 800A7160 0C02608C */  jal        get_memUsed
/* A7D64 800A7164 AFB00010 */   sw        $s0, 0x10($sp)
/* A7D68 800A7168 00409021 */  addu       $s2, $v0, $zero
/* A7D6C 800A716C 8E240000 */  lw         $a0, ($s1)
/* A7D70 800A7170 2402FFFF */  addiu      $v0, $zero, -1
/* A7D74 800A7174 14820007 */  bne        $a0, $v0, .L800A7194
/* A7D78 800A7178 3C10800E */   lui       $s0, %hi(D_800E3400)
/* A7D7C 800A717C 8E240008 */  lw         $a0, 8($s1)
/* A7D80 800A7180 26053400 */  addiu      $a1, $s0, %lo(D_800E3400)
/* A7D84 800A7184 0C02600C */  jal        Free
/* A7D88 800A7188 2406007D */   addiu     $a2, $zero, 0x7d
/* A7D8C 800A718C 08029C68 */  j          .L800A71A0
/* A7D90 800A7190 02202021 */   addu      $a0, $s1, $zero
.L800A7194:
/* A7D94 800A7194 0C028B7F */  jal        dec_borg_count
/* A7D98 800A7198 00000000 */   nop
/* A7D9C 800A719C 02202021 */  addu       $a0, $s1, $zero
.L800A71A0:
/* A7DA0 800A71A0 26053400 */  addiu      $a1, $s0, 0x3400
/* A7DA4 800A71A4 0C02600C */  jal        Free
/* A7DA8 800A71A8 24060084 */   addiu     $a2, $zero, 0x84
/* A7DAC 800A71AC 0C02608C */  jal        get_memUsed
/* A7DB0 800A71B0 00000000 */   nop
/* A7DB4 800A71B4 3C06800F */  lui        $a2, %hi(borg_mem)
/* A7DB8 800A71B8 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A7DBC 800A71BC 02421023 */  subu       $v0, $s2, $v0
/* A7DC0 800A71C0 3C05800F */  lui        $a1, %hi(borg_count)
/* A7DC4 800A71C4 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A7DC8 800A71C8 8CC3002C */  lw         $v1, 0x2c($a2)
/* A7DCC 800A71CC 8CA4002C */  lw         $a0, 0x2c($a1)
/* A7DD0 800A71D0 8FBF001C */  lw         $ra, 0x1c($sp)
/* A7DD4 800A71D4 8FB20018 */  lw         $s2, 0x18($sp)
/* A7DD8 800A71D8 8FB10014 */  lw         $s1, 0x14($sp)
/* A7DDC 800A71DC 8FB00010 */  lw         $s0, 0x10($sp)
/* A7DE0 800A71E0 00621823 */  subu       $v1, $v1, $v0
/* A7DE4 800A71E4 2484FFFF */  addiu      $a0, $a0, -1
/* A7DE8 800A71E8 ACC3002C */  sw         $v1, 0x2c($a2)
/* A7DEC 800A71EC ACA4002C */  sw         $a0, 0x2c($a1)
/* A7DF0 800A71F0 03E00008 */  jr         $ra
/* A7DF4 800A71F4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A71F8
/* A7DF8 800A71F8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7DFC 800A71FC AFB00010 */  sw         $s0, 0x10($sp)
/* A7E00 800A7200 AFBF0014 */  sw         $ra, 0x14($sp)
/* A7E04 800A7204 0C02891C */  jal        clearBorgFlag
/* A7E08 800A7208 00808021 */   addu      $s0, $a0, $zero
/* A7E0C 800A720C 0C028A22 */  jal        getBorgItem
/* A7E10 800A7210 02002021 */   addu      $a0, $s0, $zero
/* A7E14 800A7214 8FBF0014 */  lw         $ra, 0x14($sp)
/* A7E18 800A7218 8FB00010 */  lw         $s0, 0x10($sp)
/* A7E1C 800A721C 03E00008 */  jr         $ra
/* A7E20 800A7220 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A7224
/* A7E24 800A7224 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7E28 800A7228 AFBF0010 */  sw         $ra, 0x10($sp)
/* A7E2C 800A722C 0C029C53 */  jal        borg11_free
/* A7E30 800A7230 00000000 */   nop
/* A7E34 800A7234 8FBF0010 */  lw         $ra, 0x10($sp)
/* A7E38 800A7238 03E00008 */  jr         $ra
/* A7E3C 800A723C 27BD0018 */   addiu     $sp, $sp, 0x18
