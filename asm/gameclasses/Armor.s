.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_temp_armor_3
/* 77E80 80077280 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 77E84 80077284 AFB10014 */  sw         $s1, 0x14($sp)
/* 77E88 80077288 00808821 */  addu       $s1, $a0, $zero
/* 77E8C 8007728C AFB00010 */  sw         $s0, 0x10($sp)
/* 77E90 80077290 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 77E94 80077294 AFBF0018 */  sw         $ra, 0x18($sp)
/* 77E98 80077298 0C01F4B8 */  jal        make_temp_item
/* 77E9C 8007729C 02002821 */   addu      $a1, $s0, $zero
/* 77EA0 800772A0 02002021 */  addu       $a0, $s0, $zero
/* 77EA4 800772A4 00002821 */  addu       $a1, $zero, $zero
/* 77EA8 800772A8 0C01D77A */  jal        GetIDIndex
/* 77EAC 800772AC 00003021 */   addu      $a2, $zero, $zero
/* 77EB0 800772B0 3C05800F */  lui        $a1, 0x800f
/* 77EB4 800772B4 00021840 */  sll        $v1, $v0, 1
/* 77EB8 800772B8 00621821 */  addu       $v1, $v1, $v0
/* 77EBC 800772BC 00031880 */  sll        $v1, $v1, 2
/* 77EC0 800772C0 00621821 */  addu       $v1, $v1, $v0
/* 77EC4 800772C4 00031880 */  sll        $v1, $v1, 2
/* 77EC8 800772C8 8CA4F7B0 */  lw         $a0, -0x850($a1)
/* 77ECC 800772CC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 77ED0 800772D0 8C820004 */  lw         $v0, 4($a0)
/* 77ED4 800772D4 8FB00010 */  lw         $s0, 0x10($sp)
/* 77ED8 800772D8 00431021 */  addu       $v0, $v0, $v1
/* 77EDC 800772DC 9044001E */  lbu        $a0, 0x1e($v0)
/* 77EE0 800772E0 A2240017 */  sb         $a0, 0x17($s1)
/* 77EE4 800772E4 9043001B */  lbu        $v1, 0x1b($v0)
/* 77EE8 800772E8 A2230024 */  sb         $v1, 0x24($s1)
/* 77EEC 800772EC 9044001C */  lbu        $a0, 0x1c($v0)
/* 77EF0 800772F0 A2240025 */  sb         $a0, 0x25($s1)
/* 77EF4 800772F4 9043001D */  lbu        $v1, 0x1d($v0)
/* 77EF8 800772F8 A2230026 */  sb         $v1, 0x26($s1)
/* 77EFC 800772FC 9044001F */  lbu        $a0, 0x1f($v0)
/* 77F00 80077300 A2240027 */  sb         $a0, 0x27($s1)
/* 77F04 80077304 8FB10014 */  lw         $s1, 0x14($sp)
/* 77F08 80077308 03E00008 */  jr         $ra
/* 77F0C 8007730C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel pssto_clear_weapon_effects
/* 77F10 80077310 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 77F14 80077314 AFBF0010 */  sw         $ra, 0x10($sp)
/* 77F18 80077318 0C01F4E2 */  jal        clear_weapon_effects
/* 77F1C 8007731C 00000000 */   nop
/* 77F20 80077320 8FBF0010 */  lw         $ra, 0x10($sp)
/* 77F24 80077324 03E00008 */  jr         $ra
/* 77F28 80077328 27BD0018 */   addiu     $sp, $sp, 0x18
/* 77F2C 8007732C 00000000 */  nop
