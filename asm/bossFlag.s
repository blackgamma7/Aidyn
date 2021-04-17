.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_boss_flag
/* 71650 80070A50 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 71654 80070A54 3C02800E */  lui        $v0, %hi(encounter_dat)
/* 71658 80070A58 AFB10014 */  sw         $s1, 0x14($sp)
/* 7165C 80070A5C 24517C74 */  addiu      $s1, $v0, %lo(encounter_dat)
/* 71660 80070A60 AFB00010 */  sw         $s0, 0x10($sp)
/* 71664 80070A64 00008021 */  addu       $s0, $zero, $zero
/* 71668 80070A68 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7166C 80070A6C 00101040 */  sll        $v0, $s0, 1
.L80070A70:
/* 71670 80070A70 02221021 */  addu       $v0, $s1, $v0
/* 71674 80070A74 94430000 */  lhu        $v1, ($v0)
/* 71678 80070A78 10600028 */  beqz       $v1, .L80070B1C
/* 7167C 80070A7C 00602021 */   addu      $a0, $v1, $zero
/* 71680 80070A80 00002821 */  addu       $a1, $zero, $zero
/* 71684 80070A84 0C01D77A */  jal        GetIDIndex
/* 71688 80070A88 00003021 */   addu      $a2, $zero, $zero
/* 7168C 80070A8C 2443FF58 */  addiu      $v1, $v0, -0xa8
/* 71690 80070A90 2C620013 */  sltiu      $v0, $v1, 0x13
/* 71694 80070A94 10400021 */  beqz       $v0, .L80070B1C
/* 71698 80070A98 3C02800E */   lui       $v0, %hi(D_800DFCF0)
/* 7169C 80070A9C 2442FCF0 */  addiu      $v0, $v0, %lo(D_800DFCF0)
/* 716A0 80070AA0 00031880 */  sll        $v1, $v1, 2
/* 716A4 80070AA4 00621821 */  addu       $v1, $v1, $v0
/* 716A8 80070AA8 8C640000 */  lw         $a0, ($v1)
/* 716AC 80070AAC 00800008 */  jr         $a0
/* 716B0 80070AB0 00000000 */   nop
/* 716B4 80070AB4 0801C2C0 */  j          .L80070B00
/* 716B8 80070AB8 240401CA */   addiu     $a0, $zero, 0x1ca
/* 716BC 80070ABC 0801C2C0 */  j          .L80070B00
/* 716C0 80070AC0 24040215 */   addiu     $a0, $zero, 0x215
/* 716C4 80070AC4 0801C2C0 */  j          .L80070B00
/* 716C8 80070AC8 24040C84 */   addiu     $a0, $zero, 0xc84
/* 716CC 80070ACC 0801C2C0 */  j          .L80070B00
/* 716D0 80070AD0 2404009A */   addiu     $a0, $zero, 0x9a
/* 716D4 80070AD4 0801C2C0 */  j          .L80070B00
/* 716D8 80070AD8 24040E95 */   addiu     $a0, $zero, 0xe95
/* 716DC 80070ADC 0801C2C0 */  j          .L80070B00
/* 716E0 80070AE0 24040E96 */   addiu     $a0, $zero, 0xe96
/* 716E4 80070AE4 0801C2C0 */  j          .L80070B00
/* 716E8 80070AE8 24040E97 */   addiu     $a0, $zero, 0xe97
/* 716EC 80070AEC 0801C2C0 */  j          .L80070B00
/* 716F0 80070AF0 24040E98 */   addiu     $a0, $zero, 0xe98
/* 716F4 80070AF4 0801C2C0 */  j          .L80070B00
/* 716F8 80070AF8 24040E99 */   addiu     $a0, $zero, 0xe99
/* 716FC 80070AFC 24040E9A */  addiu      $a0, $zero, 0xe9a
.L80070B00:
/* 71700 80070B00 0C00918D */  jal        setEventFlag
/* 71704 80070B04 24050001 */   addiu     $a1, $zero, 1
/* 71708 80070B08 0801C2C8 */  j          .L80070B20
/* 7170C 80070B0C 26020001 */   addiu     $v0, $s0, 1
/* 71710 80070B10 24040E9B */  addiu      $a0, $zero, 0xe9b
/* 71714 80070B14 0C00918D */  jal        setEventFlag
/* 71718 80070B18 24050001 */   addiu     $a1, $zero, 1
.L80070B1C:
/* 7171C 80070B1C 26020001 */  addiu      $v0, $s0, 1
.L80070B20:
/* 71720 80070B20 305000FF */  andi       $s0, $v0, 0xff
/* 71724 80070B24 2E030004 */  sltiu      $v1, $s0, 4
/* 71728 80070B28 5460FFD1 */  bnel       $v1, $zero, .L80070A70
/* 7172C 80070B2C 00101040 */   sll       $v0, $s0, 1
/* 71730 80070B30 8FBF0018 */  lw         $ra, 0x18($sp)
/* 71734 80070B34 8FB10014 */  lw         $s1, 0x14($sp)
/* 71738 80070B38 8FB00010 */  lw         $s0, 0x10($sp)
/* 7173C 80070B3C 03E00008 */  jr         $ra
/* 71740 80070B40 27BD0020 */   addiu     $sp, $sp, 0x20
/* 71744 80070B44 00000000 */  nop
/* 71748 80070B48 00000000 */  nop
/* 7174C 80070B4C 00000000 */  nop
