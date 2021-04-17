.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel superMenuClasses_init
/* 4ED00 8004E100 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4ED04 8004E104 AFB10014 */  sw         $s1, 0x14($sp)
/* 4ED08 8004E108 3C11800F */  lui        $s1, %hi(supermenuclasses_pointer)
/* 4ED0C 8004E10C 8E22DB80 */  lw         $v0, %lo(supermenuclasses_pointer)($s1)
/* 4ED10 8004E110 00801821 */  addu       $v1, $a0, $zero
/* 4ED14 8004E114 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4ED18 8004E118 1440000E */  bnez       $v0, .L8004E154
/* 4ED1C 8004E11C AFB00010 */   sw        $s0, 0x10($sp)
/* 4ED20 8004E120 000380C0 */  sll        $s0, $v1, 3
/* 4ED24 8004E124 02002021 */  addu       $a0, $s0, $zero
/* 4ED28 8004E128 3C05800E */  lui        $a1, %hi(D_800DDA30)
/* 4ED2C 8004E12C 24A5DA30 */  addiu      $a1, $a1, %lo(D_800DDA30)
/* 4ED30 8004E130 2406008B */  addiu      $a2, $zero, 0x8b
/* 4ED34 8004E134 3C02800F */  lui        $v0, %hi(supermenuclasses_count)
/* 4ED38 8004E138 0C025F9C */  jal        Malloc
/* 4ED3C 8004E13C AC43DB84 */   sw        $v1, %lo(supermenuclasses_count)($v0)
/* 4ED40 8004E140 00402021 */  addu       $a0, $v0, $zero
/* 4ED44 8004E144 00002821 */  addu       $a1, $zero, $zero
/* 4ED48 8004E148 02003021 */  addu       $a2, $s0, $zero
/* 4ED4C 8004E14C 0C026380 */  jal        Calloc
/* 4ED50 8004E150 AE22DB80 */   sw        $v0, -0x2480($s1)
.L8004E154:
/* 4ED54 8004E154 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4ED58 8004E158 8FB10014 */  lw         $s1, 0x14($sp)
/* 4ED5C 8004E15C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4ED60 8004E160 03E00008 */  jr         $ra
/* 4ED64 8004E164 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_superMenuClasses
/* 4ED68 8004E168 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4ED6C 8004E16C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4ED70 8004E170 0C013840 */  jal        superMenuClasses_init
/* 4ED74 8004E174 24040010 */   addiu     $a0, $zero, 0x10
/* 4ED78 8004E178 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4ED7C 8004E17C 03E00008 */  jr         $ra
/* 4ED80 8004E180 27BD0018 */   addiu     $sp, $sp, 0x18

glabel supermenuclasses_free
/* 4ED84 8004E184 3C02800F */  lui        $v0, %hi(supermenuclasses_pointer)
/* 4ED88 8004E188 8C45DB80 */  lw         $a1, %lo(supermenuclasses_pointer)($v0)
/* 4ED8C 8004E18C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4ED90 8004E190 AFB20018 */  sw         $s2, 0x18($sp)
/* 4ED94 8004E194 00409021 */  addu       $s2, $v0, $zero
/* 4ED98 8004E198 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4ED9C 8004E19C AFB10014 */  sw         $s1, 0x14($sp)
/* 4EDA0 8004E1A0 10A00016 */  beqz       $a1, .L8004E1FC
/* 4EDA4 8004E1A4 AFB00010 */   sw        $s0, 0x10($sp)
/* 4EDA8 8004E1A8 00A08021 */  addu       $s0, $a1, $zero
/* 4EDAC 8004E1AC 8E020000 */  lw         $v0, ($s0)
/* 4EDB0 8004E1B0 1040000A */  beqz       $v0, .L8004E1DC
/* 4EDB4 8004E1B4 3C11800E */   lui       $s1, %hi(queueStructA)
/* 4EDB8 8004E1B8 26247ECC */  addiu      $a0, $s1, %lo(queueStructA)
.L8004E1BC:
/* 4EDBC 8004E1BC 02002821 */  addu       $a1, $s0, $zero
/* 4EDC0 8004E1C0 24060004 */  addiu      $a2, $zero, 4
/* 4EDC4 8004E1C4 0C035867 */  jal        AllocFreeQueueItem
/* 4EDC8 8004E1C8 00003821 */   addu      $a3, $zero, $zero
/* 4EDCC 8004E1CC 26100008 */  addiu      $s0, $s0, 8
/* 4EDD0 8004E1D0 8E020000 */  lw         $v0, ($s0)
/* 4EDD4 8004E1D4 1440FFF9 */  bnez       $v0, .L8004E1BC
/* 4EDD8 8004E1D8 26247ECC */   addiu     $a0, $s1, 0x7ecc
.L8004E1DC:
/* 4EDDC 8004E1DC 3C05800E */  lui        $a1, %hi(D_800DDA30)
/* 4EDE0 8004E1E0 24A5DA30 */  addiu      $a1, $a1, %lo(D_800DDA30)
/* 4EDE4 8004E1E4 8E44DB80 */  lw         $a0, -0x2480($s2)
/* 4EDE8 8004E1E8 0C02600C */  jal        Free
/* 4EDEC 8004E1EC 240600A3 */   addiu     $a2, $zero, 0xa3
/* 4EDF0 8004E1F0 3C02800F */  lui        $v0, %hi(supermenuclasses_count)
/* 4EDF4 8004E1F4 AE40DB80 */  sw         $zero, -0x2480($s2)
/* 4EDF8 8004E1F8 AC40DB84 */  sw         $zero, %lo(supermenuclasses_count)($v0)
.L8004E1FC:
/* 4EDFC 8004E1FC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4EE00 8004E200 8FB20018 */  lw         $s2, 0x18($sp)
/* 4EE04 8004E204 8FB10014 */  lw         $s1, 0x14($sp)
/* 4EE08 8004E208 8FB00010 */  lw         $s0, 0x10($sp)
/* 4EE0C 8004E20C 03E00008 */  jr         $ra
/* 4EE10 8004E210 27BD0020 */   addiu     $sp, $sp, 0x20

glabel supermenuclasses_func
/* 4EE14 8004E214 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4EE18 8004E218 3C03800F */  lui        $v1, %hi(supermenuclasses_pointer)
/* 4EE1C 8004E21C AFB00010 */  sw         $s0, 0x10($sp)
/* 4EE20 8004E220 8C70DB80 */  lw         $s0, %lo(supermenuclasses_pointer)($v1)
/* 4EE24 8004E224 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4EE28 8004E228 AFB10014 */  sw         $s1, 0x14($sp)
/* 4EE2C 8004E22C 8E020000 */  lw         $v0, ($s0)
/* 4EE30 8004E230 10400009 */  beqz       $v0, .L8004E258
/* 4EE34 8004E234 00808821 */   addu      $s1, $a0, $zero
/* 4EE38 8004E238 8E020004 */  lw         $v0, 4($s0)
.L8004E23C:
/* 4EE3C 8004E23C 54510003 */  bnel       $v0, $s1, .L8004E24C
/* 4EE40 8004E240 26100008 */   addiu     $s0, $s0, 8
/* 4EE44 8004E244 080138AA */  j          .L8004E2A8
/* 4EE48 8004E248 8E020000 */   lw        $v0, ($s0)
.L8004E24C:
/* 4EE4C 8004E24C 8E020000 */  lw         $v0, ($s0)
/* 4EE50 8004E250 5440FFFA */  bnel       $v0, $zero, .L8004E23C
/* 4EE54 8004E254 8E020004 */   lw        $v0, 4($s0)
.L8004E258:
/* 4EE58 8004E258 8C62DB80 */  lw         $v0, -0x2480($v1)
/* 4EE5C 8004E25C 3C03800F */  lui        $v1, %hi(supermenuclasses_count)
/* 4EE60 8004E260 8C64DB84 */  lw         $a0, %lo(supermenuclasses_count)($v1)
/* 4EE64 8004E264 02021023 */  subu       $v0, $s0, $v0
/* 4EE68 8004E268 000210C3 */  sra        $v0, $v0, 3
/* 4EE6C 8004E26C 0044102B */  sltu       $v0, $v0, $a0
/* 4EE70 8004E270 14400007 */  bnez       $v0, .L8004E290
/* 4EE74 8004E274 02202021 */   addu      $a0, $s1, $zero
/* 4EE78 8004E278 3C04800E */  lui        $a0, %hi(D_800DDA30)
/* 4EE7C 8004E27C 2484DA30 */  addiu      $a0, $a0, %lo(D_800DDA30)
/* 4EE80 8004E280 3C05800E */  lui        $a1, %hi(D_800DDA50)
/* 4EE84 8004E284 0C025F2D */  jal        manualCrash
/* 4EE88 8004E288 24A5DA50 */   addiu     $a1, $a1, %lo(D_800DDA50)
/* 4EE8C 8004E28C 02202021 */  addu       $a0, $s1, $zero
.L8004E290:
/* 4EE90 8004E290 0C0290E2 */  jal        get_borg_8
/* 4EE94 8004E294 AE110004 */   sw        $s1, 4($s0)
/* 4EE98 8004E298 00401821 */  addu       $v1, $v0, $zero
/* 4EE9C 8004E29C 14600002 */  bnez       $v1, .L8004E2A8
/* 4EEA0 8004E2A0 AE030000 */   sw        $v1, ($s0)
/* 4EEA4 8004E2A4 00001021 */  addu       $v0, $zero, $zero
.L8004E2A8:
/* 4EEA8 8004E2A8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4EEAC 8004E2AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 4EEB0 8004E2B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 4EEB4 8004E2B4 03E00008 */  jr         $ra
/* 4EEB8 8004E2B8 27BD0020 */   addiu     $sp, $sp, 0x20
/* 4EEBC 8004E2BC 00000000 */  nop
