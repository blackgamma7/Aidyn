.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel createTempWeapon
/* 857B0 80084BB0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 857B4 80084BB4 AFB10014 */  sw         $s1, 0x14($sp)
/* 857B8 80084BB8 00808821 */  addu       $s1, $a0, $zero
/* 857BC 80084BBC AFB00010 */  sw         $s0, 0x10($sp)
/* 857C0 80084BC0 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 857C4 80084BC4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 857C8 80084BC8 0C01F4B8 */  jal        make_temp_item
/* 857CC 80084BCC 02002821 */   addu      $a1, $s0, $zero
/* 857D0 80084BD0 02002021 */  addu       $a0, $s0, $zero
/* 857D4 80084BD4 00002821 */  addu       $a1, $zero, $zero
/* 857D8 80084BD8 00003021 */  addu       $a2, $zero, $zero
/* 857DC 80084BDC 0C01D77A */  jal        GetIDIndex
/* 857E0 80084BE0 A6300000 */   sh        $s0, ($s1)
/* 857E4 80084BE4 3C05800F */  lui        $a1, 0x800f
/* 857E8 80084BE8 00021840 */  sll        $v1, $v0, 1
/* 857EC 80084BEC 00621821 */  addu       $v1, $v1, $v0
/* 857F0 80084BF0 00031880 */  sll        $v1, $v1, 2
/* 857F4 80084BF4 00621821 */  addu       $v1, $v1, $v0
/* 857F8 80084BF8 00031880 */  sll        $v1, $v1, 2
/* 857FC 80084BFC 8CA416F0 */  lw         $a0, 0x16f0($a1)
/* 85800 80084C00 8FBF0018 */  lw         $ra, 0x18($sp)
/* 85804 80084C04 8C820018 */  lw         $v0, 0x18($a0)
/* 85808 80084C08 8FB00010 */  lw         $s0, 0x10($sp)
/* 8580C 80084C0C 00431021 */  addu       $v0, $v0, $v1
/* 85810 80084C10 90440018 */  lbu        $a0, 0x18($v0)
/* 85814 80084C14 A2240024 */  sb         $a0, 0x24($s1)
/* 85818 80084C18 9043001A */  lbu        $v1, 0x1a($v0)
/* 8581C 80084C1C A2230025 */  sb         $v1, 0x25($s1)
/* 85820 80084C20 9044001B */  lbu        $a0, 0x1b($v0)
/* 85824 80084C24 A2240026 */  sb         $a0, 0x26($s1)
/* 85828 80084C28 9043001F */  lbu        $v1, 0x1f($v0)
/* 8582C 80084C2C A2230027 */  sb         $v1, 0x27($s1)
/* 85830 80084C30 90440020 */  lbu        $a0, 0x20($v0)
/* 85834 80084C34 A2240028 */  sb         $a0, 0x28($s1)
/* 85838 80084C38 90430022 */  lbu        $v1, 0x22($v0)
/* 8583C 80084C3C A2230029 */  sb         $v1, 0x29($s1)
/* 85840 80084C40 90440019 */  lbu        $a0, 0x19($v0)
/* 85844 80084C44 A2240017 */  sb         $a0, 0x17($s1)
/* 85848 80084C48 8FB10014 */  lw         $s1, 0x14($sp)
/* 8584C 80084C4C 03E00008 */  jr         $ra
/* 85850 80084C50 27BD0020 */   addiu     $sp, $sp, 0x20

glabel passto_clear_weapon_effects
/* 85854 80084C54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 85858 80084C58 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8585C 80084C5C 0C01F4E2 */  jal        clear_weapon_effects
/* 85860 80084C60 00000000 */   nop
/* 85864 80084C64 8FBF0010 */  lw         $ra, 0x10($sp)
/* 85868 80084C68 03E00008 */  jr         $ra
/* 8586C 80084C6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel isBreathSpitOrSpikes
/* 85870 80084C70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 85874 80084C74 AFB00010 */  sw         $s0, 0x10($sp)
/* 85878 80084C78 00808021 */  addu       $s0, $a0, $zero
/* 8587C 80084C7C 00002821 */  addu       $a1, $zero, $zero
/* 85880 80084C80 AFBF0014 */  sw         $ra, 0x14($sp)
/* 85884 80084C84 96040000 */  lhu        $a0, ($s0)
/* 85888 80084C88 0C01D77A */  jal        GetIDIndex
/* 8588C 80084C8C 00003021 */   addu      $a2, $zero, $zero
/* 85890 80084C90 00003021 */  addu       $a2, $zero, $zero
/* 85894 80084C94 92030027 */  lbu        $v1, 0x27($s0)
/* 85898 80084C98 10600009 */  beqz       $v1, .L80084CC0
/* 8589C 80084C9C 00402821 */   addu      $a1, $v0, $zero
/* 858A0 80084CA0 92040024 */  lbu        $a0, 0x24($s0)
/* 858A4 80084CA4 24020001 */  addiu      $v0, $zero, 1
/* 858A8 80084CA8 10820005 */  beq        $a0, $v0, .L80084CC0
/* 858AC 80084CAC 24020006 */   addiu     $v0, $zero, 6
/* 858B0 80084CB0 10820003 */  beq        $a0, $v0, .L80084CC0
/* 858B4 80084CB4 24020064 */   addiu     $v0, $zero, 0x64
/* 858B8 80084CB8 14A20003 */  bne        $a1, $v0, .L80084CC8
/* 858BC 80084CBC 8FBF0014 */   lw        $ra, 0x14($sp)
.L80084CC0:
/* 858C0 80084CC0 24060001 */  addiu      $a2, $zero, 1
/* 858C4 80084CC4 8FBF0014 */  lw         $ra, 0x14($sp)
.L80084CC8:
/* 858C8 80084CC8 8FB00010 */  lw         $s0, 0x10($sp)
/* 858CC 80084CCC 00C01021 */  addu       $v0, $a2, $zero
/* 858D0 80084CD0 03E00008 */  jr         $ra
/* 858D4 80084CD4 27BD0018 */   addiu     $sp, $sp, 0x18
/* 858D8 80084CD8 00000000 */  nop
/* 858DC 80084CDC 00000000 */  nop
