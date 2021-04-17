.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_charsheet_potion
/* 83E00 80083200 3402FFFF */  ori        $v0, $zero, 0xffff
/* 83E04 80083204 A0850000 */  sb         $a1, ($a0)
/* 83E08 80083208 A0860001 */  sb         $a2, 1($a0)
/* 83E0C 8008320C AC870004 */  sw         $a3, 4($a0)
/* 83E10 80083210 03E00008 */  jr         $ra
/* 83E14 80083214 AC820008 */   sw        $v0, 8($a0)

glabel func_with_potion_unk2
/* 83E18 80083218 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83E1C 8008321C AFBF0010 */  sw         $ra, 0x10($sp)
/* 83E20 80083220 8C850008 */  lw         $a1, 8($a0)
/* 83E24 80083224 3402FFFF */  ori        $v0, $zero, 0xffff
/* 83E28 80083228 10A20007 */  beq        $a1, $v0, .L80083248
/* 83E2C 8008322C 3C02800E */   lui       $v0, %hi(screenFadeMode_switch)
/* 83E30 80083230 904468E8 */  lbu        $a0, %lo(screenFadeMode_switch)($v0)
/* 83E34 80083234 24030002 */  addiu      $v1, $zero, 2
/* 83E38 80083238 14830004 */  bne        $a0, $v1, .L8008324C
/* 83E3C 8008323C 8FBF0010 */   lw        $ra, 0x10($sp)
/* 83E40 80083240 0C025083 */  jal        func_8009420C
/* 83E44 80083244 00A02021 */   addu      $a0, $a1, $zero
.L80083248:
/* 83E48 80083248 8FBF0010 */  lw         $ra, 0x10($sp)
.L8008324C:
/* 83E4C 8008324C 03E00008 */  jr         $ra
/* 83E50 80083250 27BD0018 */   addiu     $sp, $sp, 0x18

glabel check_charsheet_potion_timer
/* 83E54 80083254 8C830004 */  lw         $v1, 4($a0)
/* 83E58 80083258 14600003 */  bnez       $v1, .L80083268
/* 83E5C 8008325C 30A2FFFF */   andi      $v0, $a1, 0xffff
/* 83E60 80083260 03E00008 */  jr         $ra
/* 83E64 80083264 24020001 */   addiu     $v0, $zero, 1
.L80083268:
/* 83E68 80083268 00460018 */  mult       $v0, $a2
/* 83E6C 8008326C 10400007 */  beqz       $v0, .L8008328C
/* 83E70 80083270 00000000 */   nop
/* 83E74 80083274 00002812 */  mflo       $a1
/* 83E78 80083278 00A3102B */  sltu       $v0, $a1, $v1
/* 83E7C 8008327C 10400009 */  beqz       $v0, .L800832A4
/* 83E80 80083280 00651023 */   subu      $v0, $v1, $a1
/* 83E84 80083284 08020CAA */  j          .L800832A8
/* 83E88 80083288 AC820004 */   sw        $v0, 4($a0)
.L8008328C:
/* 83E8C 8008328C 2C620259 */  sltiu      $v0, $v1, 0x259
/* 83E90 80083290 54400005 */  bnel       $v0, $zero, .L800832A8
/* 83E94 80083294 AC800004 */   sw        $zero, 4($a0)
/* 83E98 80083298 2462FDA8 */  addiu      $v0, $v1, -0x258
/* 83E9C 8008329C 08020CAA */  j          .L800832A8
/* 83EA0 800832A0 AC820004 */   sw        $v0, 4($a0)
.L800832A4:
/* 83EA4 800832A4 AC800004 */  sw         $zero, 4($a0)
.L800832A8:
/* 83EA8 800832A8 03E00008 */  jr         $ra
/* 83EAC 800832AC 00001021 */   addu      $v0, $zero, $zero

glabel load_potion_romstring
/* 83EB0 800832B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83EB4 800832B4 3C04B200 */  lui        $a0, %hi(RomstringPotion)
/* 83EB8 800832B8 2484DA20 */  addiu      $a0, $a0, %lo(RomstringPotion)
/* 83EBC 800832BC 3C05B200 */  lui        $a1, %hi(D_B1FFDB20)
/* 83EC0 800832C0 24A5DB20 */  addiu      $a1, $a1, %lo(D_B1FFDB20)
/* 83EC4 800832C4 00A42823 */  subu       $a1, $a1, $a0
/* 83EC8 800832C8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 83ECC 800832CC 0C0232A0 */  jal        func_romStrings
/* 83ED0 800832D0 AFB00010 */   sw        $s0, 0x10($sp)
/* 83ED4 800832D4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 83ED8 800832D8 3C10800F */  lui        $s0, %hi(potion_names)
/* 83EDC 800832DC AE021B30 */  sw         $v0, %lo(potion_names)($s0)
/* 83EE0 800832E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 83EE4 800832E4 03E00008 */  jr         $ra
/* 83EE8 800832E8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel clear_potion_romstrings
/* 83EEC 800832EC 3C02800F */  lui        $v0, %hi(potion_names)
/* 83EF0 800832F0 8C441B30 */  lw         $a0, %lo(potion_names)($v0)
/* 83EF4 800832F4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83EF8 800832F8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 83EFC 800832FC 0C0232F9 */  jal        free_romstring
/* 83F00 80083300 00000000 */   nop
/* 83F04 80083304 8FBF0010 */  lw         $ra, 0x10($sp)
/* 83F08 80083308 03E00008 */  jr         $ra
/* 83F0C 8008330C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_2byte_array
/* 83F10 80083310 A0850000 */  sb         $a1, ($a0)
/* 83F14 80083314 03E00008 */  jr         $ra
/* 83F18 80083318 A0860001 */   sb        $a2, 1($a0)
/* 83F1C 8008331C 00000000 */  nop
