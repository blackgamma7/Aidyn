.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80094250
/* 94E50 80094250 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 94E54 80094254 AFB50024 */  sw         $s5, 0x24($sp)
/* 94E58 80094258 0080A821 */  addu       $s5, $a0, $zero
/* 94E5C 8009425C AFB20018 */  sw         $s2, 0x18($sp)
/* 94E60 80094260 00A09021 */  addu       $s2, $a1, $zero
/* 94E64 80094264 02402021 */  addu       $a0, $s2, $zero
/* 94E68 80094268 00C01021 */  addu       $v0, $a2, $zero
/* 94E6C 8009426C AFB00010 */  sw         $s0, 0x10($sp)
/* 94E70 80094270 00E08021 */  addu       $s0, $a3, $zero
/* 94E74 80094274 AFBF0028 */  sw         $ra, 0x28($sp)
/* 94E78 80094278 AFB40020 */  sw         $s4, 0x20($sp)
/* 94E7C 8009427C AFB3001C */  sw         $s3, 0x1c($sp)
/* 94E80 80094280 AFB10014 */  sw         $s1, 0x14($sp)
/* 94E84 80094284 8C450000 */  lw         $a1, ($v0)
/* 94E88 80094288 8C460004 */  lw         $a2, 4($v0)
/* 94E8C 8009428C 8C470008 */  lw         $a3, 8($v0)
/* 94E90 80094290 8FB10040 */  lw         $s1, 0x40($sp)
/* 94E94 80094294 8FB40048 */  lw         $s4, 0x48($sp)
/* 94E98 80094298 0C029D7E */  jal        AniDat_rotate_MatrixA
/* 94E9C 8009429C 93B30047 */   lbu       $s3, 0x47($sp)
/* 94EA0 800942A0 8E050000 */  lw         $a1, ($s0)
/* 94EA4 800942A4 8E060004 */  lw         $a2, 4($s0)
/* 94EA8 800942A8 8E070008 */  lw         $a3, 8($s0)
/* 94EAC 800942AC 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 94EB0 800942B0 02402021 */   addu      $a0, $s2, $zero
/* 94EB4 800942B4 8E250000 */  lw         $a1, ($s1)
/* 94EB8 800942B8 8E260004 */  lw         $a2, 4($s1)
/* 94EBC 800942BC 8E270008 */  lw         $a3, 8($s1)
/* 94EC0 800942C0 0C029DDF */  jal        matrix_normalize_scale
/* 94EC4 800942C4 02402021 */   addu      $a0, $s2, $zero
/* 94EC8 800942C8 02402021 */  addu       $a0, $s2, $zero
/* 94ECC 800942CC 02602821 */  addu       $a1, $s3, $zero
/* 94ED0 800942D0 00003021 */  addu       $a2, $zero, $zero
/* 94ED4 800942D4 0C003D48 */  jal        set_anidat_colors
/* 94ED8 800942D8 02803821 */   addu      $a3, $s4, $zero
/* 94EDC 800942DC 02A02021 */  addu       $a0, $s5, $zero
/* 94EE0 800942E0 0C028369 */  jal        func_800A0DA4
/* 94EE4 800942E4 02402821 */   addu      $a1, $s2, $zero
/* 94EE8 800942E8 8FBF0028 */  lw         $ra, 0x28($sp)
/* 94EEC 800942EC 8FB50024 */  lw         $s5, 0x24($sp)
/* 94EF0 800942F0 8FB40020 */  lw         $s4, 0x20($sp)
/* 94EF4 800942F4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 94EF8 800942F8 8FB20018 */  lw         $s2, 0x18($sp)
/* 94EFC 800942FC 8FB10014 */  lw         $s1, 0x14($sp)
/* 94F00 80094300 8FB00010 */  lw         $s0, 0x10($sp)
/* 94F04 80094304 03E00008 */  jr         $ra
/* 94F08 80094308 27BD0030 */   addiu     $sp, $sp, 0x30

glabel set_CombatCurrentEnt_y
/* 94F0C 8009430C 3C02800F */  lui        $v0, %hi(combat_SomeAnimationData)
/* 94F10 80094310 3C03800F */  lui        $v1, %hi(combatPointer)
/* 94F14 80094314 AC401D80 */  sw         $zero, %lo(combat_SomeAnimationData)($v0)
/* 94F18 80094318 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 94F1C 8009431C 3C04800F */  lui        $a0, %hi(CombatCurrentEnt_Y)
/* 94F20 80094320 1040000D */  beqz       $v0, .L80094358
/* 94F24 80094324 AC801D84 */   sw        $zero, %lo(CombatCurrentEnt_Y)($a0)
/* 94F28 80094328 8C42002C */  lw         $v0, 0x2c($v0)
/* 94F2C 8009432C 1040000A */  beqz       $v0, .L80094358
/* 94F30 80094330 3C03800E */   lui       $v1, %hi(combat_bytes)
/* 94F34 80094334 90420020 */  lbu        $v0, 0x20($v0)
/* 94F38 80094338 24637C70 */  addiu      $v1, $v1, %lo(combat_bytes)
/* 94F3C 8009433C 00021080 */  sll        $v0, $v0, 2
/* 94F40 80094340 00621821 */  addu       $v1, $v1, $v0
/* 94F44 80094344 8C620034 */  lw         $v0, 0x34($v1)
/* 94F48 80094348 10400003 */  beqz       $v0, .L80094358
/* 94F4C 8009434C 00000000 */   nop
/* 94F50 80094350 C440006C */  lwc1       $f0, 0x6c($v0)
/* 94F54 80094354 E4801D84 */  swc1       $f0, 0x1d84($a0)
.L80094358:
/* 94F58 80094358 03E00008 */  jr         $ra
/* 94F5C 8009435C 00000000 */   nop

glabel func_80094360
/* 94F60 80094360 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 94F64 80094364 3C02800F */  lui        $v0, %hi(combat_SomeAnimationData)
/* 94F68 80094368 8C431D80 */  lw         $v1, %lo(combat_SomeAnimationData)($v0)
/* 94F6C 8009436C 24451D80 */  addiu      $a1, $v0, 0x1d80
/* 94F70 80094370 10600006 */  beqz       $v1, .L8009438C
/* 94F74 80094374 AFBF0010 */   sw        $ra, 0x10($sp)
/* 94F78 80094378 3C04800E */  lui        $a0, %hi(queueStructA)
/* 94F7C 8009437C 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 94F80 80094380 24060001 */  addiu      $a2, $zero, 1
/* 94F84 80094384 0C035867 */  jal        AllocFreeQueueItem
/* 94F88 80094388 00003821 */   addu      $a3, $zero, $zero
.L8009438C:
/* 94F8C 8009438C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 94F90 80094390 03E00008 */  jr         $ra
/* 94F94 80094394 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_with_spell_range
/* 94F98 80094398 27BDFE78 */  addiu      $sp, $sp, -0x188
/* 94F9C 8009439C AFB3016C */  sw         $s3, 0x16c($sp)
/* 94FA0 800943A0 3C13800F */  lui        $s3, %hi(combat_SomeAnimationData)
/* 94FA4 800943A4 8E621D80 */  lw         $v0, %lo(combat_SomeAnimationData)($s3)
/* 94FA8 800943A8 AFB50174 */  sw         $s5, 0x174($sp)
/* 94FAC 800943AC 0080A821 */  addu       $s5, $a0, $zero
/* 94FB0 800943B0 AFB60178 */  sw         $s6, 0x178($sp)
/* 94FB4 800943B4 00E0B021 */  addu       $s6, $a3, $zero
/* 94FB8 800943B8 AFB00160 */  sw         $s0, 0x160($sp)
/* 94FBC 800943BC AFBF017C */  sw         $ra, 0x17c($sp)
/* 94FC0 800943C0 AFB40170 */  sw         $s4, 0x170($sp)
/* 94FC4 800943C4 AFB20168 */  sw         $s2, 0x168($sp)
/* 94FC8 800943C8 AFB10164 */  sw         $s1, 0x164($sp)
/* 94FCC 800943CC F7B40180 */  sdc1       $f20, 0x180($sp)
/* 94FD0 800943D0 14400004 */  bnez       $v0, .L800943E4
/* 94FD4 800943D4 30D000FF */   andi      $s0, $a2, 0xff
/* 94FD8 800943D8 0C003D38 */  jal        load_borg_5_func
/* 94FDC 800943DC 24040797 */   addiu     $a0, $zero, 0x797
/* 94FE0 800943E0 AE621D80 */  sw         $v0, 0x1d80($s3)
.L800943E4:
/* 94FE4 800943E4 27A40020 */  addiu      $a0, $sp, 0x20
/* 94FE8 800943E8 3C14800F */  lui        $s4, 0x800f
/* 94FEC 800943EC 3C11800F */  lui        $s1, %hi(combatPointer)
/* 94FF0 800943F0 44900000 */  mtc1       $s0, $f0
/* 94FF4 800943F4 46800020 */  cvt.s.w    $f0, $f0
/* 94FF8 800943F8 8E22F760 */  lw         $v0, %lo(combatPointer)($s1)
/* 94FFC 800943FC 3C064248 */  lui        $a2, 0x4248
/* 95000 80094400 3C01800E */  lui        $at, %hi(D_800E21D0)
/* 95004 80094404 C42221D0 */  lwc1       $f2, %lo(D_800E21D0)($at)
/* 95008 80094408 8C450018 */  lw         $a1, 0x18($v0)
/* 9500C 8009440C 8C47001C */  lw         $a3, 0x1c($v0)
/* 95010 80094410 0C02AD58 */  jal        setVec3
/* 95014 80094414 46020500 */   add.s     $f20, $f0, $f2
/* 95018 80094418 27B00060 */  addiu      $s0, $sp, 0x60
/* 9501C 8009441C 8E22F760 */  lw         $v0, -0x8a0($s1)
/* 95020 80094420 3C06C120 */  lui        $a2, 0xc120
/* 95024 80094424 8C450018 */  lw         $a1, 0x18($v0)
/* 95028 80094428 8C47001C */  lw         $a3, 0x1c($v0)
/* 9502C 8009442C 0C02AD58 */  jal        setVec3
/* 95030 80094430 02002021 */   addu      $a0, $s0, $zero
/* 95034 80094434 27A50020 */  addiu      $a1, $sp, 0x20
/* 95038 80094438 02003021 */  addu       $a2, $s0, $zero
/* 9503C 8009443C 3C02800E */  lui        $v0, %hi(zoneDatMatrix+0x8C)
/* 95040 80094440 3C073F80 */  lui        $a3, 0x3f80
/* 95044 80094444 8C446A14 */  lw         $a0, %lo(zoneDatMatrix+0x8C)($v0)
/* 95048 80094448 27B200A0 */  addiu      $s2, $sp, 0xa0
/* 9504C 8009444C AFB20010 */  sw         $s2, 0x10($sp)
/* 95050 80094450 AFA00014 */  sw         $zero, 0x14($sp)
/* 95054 80094454 AFA00018 */  sw         $zero, 0x18($sp)
/* 95058 80094458 0C02B7DE */  jal        func_800ADF78
/* 9505C 8009445C 24840008 */   addiu     $a0, $a0, 8
/* 95060 80094460 54400008 */  bnel       $v0, $zero, .L80094484
/* 95064 80094464 27B100E0 */   addiu     $s1, $sp, 0xe0
/* 95068 80094468 02402021 */  addu       $a0, $s2, $zero
/* 9506C 8009446C 8E22F760 */  lw         $v0, -0x8a0($s1)
/* 95070 80094470 8E861D84 */  lw         $a2, 0x1d84($s4)
/* 95074 80094474 8C450018 */  lw         $a1, 0x18($v0)
/* 95078 80094478 0C02AD58 */  jal        setVec3
/* 9507C 8009447C 8C47001C */   lw        $a3, 0x1c($v0)
/* 95080 80094480 27B100E0 */  addiu      $s1, $sp, 0xe0
.L80094484:
/* 95084 80094484 02202021 */  addu       $a0, $s1, $zero
/* 95088 80094488 00002821 */  addu       $a1, $zero, $zero
/* 9508C 8009448C 0C026380 */  jal        Calloc
/* 95090 80094490 2406000C */   addiu     $a2, $zero, 0xc
/* 95094 80094494 27B00120 */  addiu      $s0, $sp, 0x120
/* 95098 80094498 02002021 */  addu       $a0, $s0, $zero
/* 9509C 8009449C 00002821 */  addu       $a1, $zero, $zero
/* 950A0 800944A0 3C01800E */  lui        $at, %hi(D_800E21D4)
/* 950A4 800944A4 C42021D4 */  lwc1       $f0, %lo(D_800E21D4)($at)
/* 950A8 800944A8 2406000C */  addiu      $a2, $zero, 0xc
/* 950AC 800944AC E7B400E0 */  swc1       $f20, 0xe0($sp)
/* 950B0 800944B0 E7B400E8 */  swc1       $f20, 0xe8($sp)
/* 950B4 800944B4 0C026380 */  jal        Calloc
/* 950B8 800944B8 E7A000E4 */   swc1      $f0, 0xe4($sp)
/* 950BC 800944BC 02A02021 */  addu       $a0, $s5, $zero
/* 950C0 800944C0 02003021 */  addu       $a2, $s0, $zero
/* 950C4 800944C4 02403821 */  addu       $a3, $s2, $zero
/* 950C8 800944C8 8E651D80 */  lw         $a1, 0x1d80($s3)
/* 950CC 800944CC 24020040 */  addiu      $v0, $zero, 0x40
/* 950D0 800944D0 AFB10010 */  sw         $s1, 0x10($sp)
/* 950D4 800944D4 AFA20014 */  sw         $v0, 0x14($sp)
/* 950D8 800944D8 0C025094 */  jal        func_80094250
/* 950DC 800944DC AFB60018 */   sw        $s6, 0x18($sp)
/* 950E0 800944E0 C7A000A4 */  lwc1       $f0, 0xa4($sp)
/* 950E4 800944E4 8FBF017C */  lw         $ra, 0x17c($sp)
/* 950E8 800944E8 8FB60178 */  lw         $s6, 0x178($sp)
/* 950EC 800944EC 8FB50174 */  lw         $s5, 0x174($sp)
/* 950F0 800944F0 8FB3016C */  lw         $s3, 0x16c($sp)
/* 950F4 800944F4 8FB20168 */  lw         $s2, 0x168($sp)
/* 950F8 800944F8 8FB10164 */  lw         $s1, 0x164($sp)
/* 950FC 800944FC 8FB00160 */  lw         $s0, 0x160($sp)
/* 95100 80094500 D7B40180 */  ldc1       $f20, 0x180($sp)
/* 95104 80094504 E6801D84 */  swc1       $f0, 0x1d84($s4)
/* 95108 80094508 8FB40170 */  lw         $s4, 0x170($sp)
/* 9510C 8009450C 03E00008 */  jr         $ra
/* 95110 80094510 27BD0188 */   addiu     $sp, $sp, 0x188
/* 95114 80094514 00000000 */  nop
/* 95118 80094518 00000000 */  nop
/* 9511C 8009451C 00000000 */  nop
