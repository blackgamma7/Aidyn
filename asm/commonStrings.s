.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel load_commonstrings
/* 8D840 8008CC40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D844 8008CC44 3C04B1FF */  lui        $a0, %hi(common_string_array)
/* 8D848 8008CC48 24846700 */  addiu      $a0, $a0, %lo(common_string_array)
/* 8D84C 8008CC4C 3C05B200 */  lui        $a1, %hi(copyrightStrings)
/* 8D850 8008CC50 24A58F30 */  addiu      $a1, $a1, %lo(copyrightStrings)
/* 8D854 8008CC54 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D858 8008CC58 0C0232A0 */  jal        func_romStrings
/* 8D85C 8008CC5C 00A42823 */   subu      $a1, $a1, $a0
/* 8D860 8008CC60 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 8D864 8008CC64 3C04800E */  lui        $a0, %hi(commonstrings)
/* 8D868 8008CC68 3C05800F */  lui        $a1, %hi(encounterType_labels)
/* 8D86C 8008CC6C AC6288F4 */  sw         $v0, %lo(commonstringsmirror)($v1)
/* 8D870 8008CC70 244303A8 */  addiu      $v1, $v0, 0x3a8
/* 8D874 8008CC74 AC8261F0 */  sw         $v0, %lo(commonstrings)($a0)
/* 8D878 8008CC78 3C04800F */  lui        $a0, %hi(walking_labels)
/* 8D87C 8008CC7C ACA3F764 */  sw         $v1, %lo(encounterType_labels)($a1)
/* 8D880 8008CC80 244303B4 */  addiu      $v1, $v0, 0x3b4
/* 8D884 8008CC84 3C05800F */  lui        $a1, %hi(element_labels)
/* 8D888 8008CC88 AC83F768 */  sw         $v1, %lo(walking_labels)($a0)
/* 8D88C 8008CC8C 244303C4 */  addiu      $v1, $v0, 0x3c4
/* 8D890 8008CC90 3C04800F */  lui        $a0, %hi(spell_error_labels)
/* 8D894 8008CC94 ACA3F770 */  sw         $v1, %lo(element_labels)($a1)
/* 8D898 8008CC98 24430408 */  addiu      $v1, $v0, 0x408
/* 8D89C 8008CC9C 3C05800F */  lui        $a1, %hi(skill_strings)
/* 8D8A0 8008CCA0 AC831774 */  sw         $v1, %lo(spell_error_labels)($a0)
/* 8D8A4 8008CCA4 2443043C */  addiu      $v1, $v0, 0x43c
/* 8D8A8 8008CCA8 3C04800F */  lui        $a0, %hi(weapon_strings)
/* 8D8AC 8008CCAC ACA31B40 */  sw         $v1, %lo(skill_strings)($a1)
/* 8D8B0 8008CCB0 2443046C */  addiu      $v1, $v0, 0x46c
/* 8D8B4 8008CCB4 3C05800F */  lui        $a1, %hi(aspect_labels)
/* 8D8B8 8008CCB8 AC831B44 */  sw         $v1, %lo(weapon_strings)($a0)
/* 8D8BC 8008CCBC 24430498 */  addiu      $v1, $v0, 0x498
/* 8D8C0 8008CCC0 3C04800F */  lui        $a0, %hi(magic_school_labels)
/* 8D8C4 8008CCC4 ACA31B50 */  sw         $v1, %lo(aspect_labels)($a1)
/* 8D8C8 8008CCC8 244304A4 */  addiu      $v1, $v0, 0x4a4
/* 8D8CC 8008CCCC 3C05800F */  lui        $a1, %hi(Stat_labels)
/* 8D8D0 8008CCD0 AC831B54 */  sw         $v1, %lo(magic_school_labels)($a0)
/* 8D8D4 8008CCD4 244304BC */  addiu      $v1, $v0, 0x4bc
/* 8D8D8 8008CCD8 3C04800F */  lui        $a0, %hi(humidity_labels)
/* 8D8DC 8008CCDC ACA31B60 */  sw         $v1, %lo(Stat_labels)($a1)
/* 8D8E0 8008CCE0 244304D8 */  addiu      $v1, $v0, 0x4d8
/* 8D8E4 8008CCE4 3C05800F */  lui        $a1, %hi(timeofDay_labels)
/* 8D8E8 8008CCE8 AC831BA0 */  sw         $v1, %lo(humidity_labels)($a0)
/* 8D8EC 8008CCEC 244304E4 */  addiu      $v1, $v0, 0x4e4
/* 8D8F0 8008CCF0 3C04800F */  lui        $a0, %hi(moon_phase_labels)
/* 8D8F4 8008CCF4 ACA31BA4 */  sw         $v1, %lo(timeofDay_labels)($a1)
/* 8D8F8 8008CCF8 244304F8 */  addiu      $v1, $v0, 0x4f8
/* 8D8FC 8008CCFC 3C05800F */  lui        $a1, %hi(dark_strorm_labels)
/* 8D900 8008CD00 AC831BA8 */  sw         $v1, %lo(moon_phase_labels)($a0)
/* 8D904 8008CD04 24430508 */  addiu      $v1, $v0, 0x508
/* 8D908 8008CD08 3C04800F */  lui        $a0, %hi(weekday_labels)
/* 8D90C 8008CD0C ACA31BAC */  sw         $v1, %lo(dark_strorm_labels)($a1)
/* 8D910 8008CD10 24430520 */  addiu      $v1, $v0, 0x520
/* 8D914 8008CD14 3C05800F */  lui        $a1, %hi(terrain_labels)
/* 8D918 8008CD18 AC831BB0 */  sw         $v1, %lo(weekday_labels)($a0)
/* 8D91C 8008CD1C 2443053C */  addiu      $v1, $v0, 0x53c
/* 8D920 8008CD20 3C04800F */  lui        $a0, %hi(precip_labels)
/* 8D924 8008CD24 ACA31BB4 */  sw         $v1, %lo(terrain_labels)($a1)
/* 8D928 8008CD28 2443055C */  addiu      $v1, $v0, 0x55c
/* 8D92C 8008CD2C 3C05800F */  lui        $a1, %hi(ground_labels)
/* 8D930 8008CD30 AC831BB8 */  sw         $v1, %lo(precip_labels)($a0)
/* 8D934 8008CD34 24430568 */  addiu      $v1, $v0, 0x568
/* 8D938 8008CD38 3C04800F */  lui        $a0, %hi(price_strings)
/* 8D93C 8008CD3C ACA38DC8 */  sw         $v1, %lo(ground_labels)($a1)
/* 8D940 8008CD40 24430600 */  addiu      $v1, $v0, 0x600
/* 8D944 8008CD44 3C05800E */  lui        $a1, %hi(debug_switch_labels)
/* 8D948 8008CD48 AC831AB4 */  sw         $v1, %lo(price_strings)($a0)
/* 8D94C 8008CD4C 244300BC */  addiu      $v1, $v0, 0xbc
/* 8D950 8008CD50 3C04800E */  lui        $a0, %hi(boolean_labels)
/* 8D954 8008CD54 24460074 */  addiu      $a2, $v0, 0x74
/* 8D958 8008CD58 ACA361B0 */  sw         $v1, %lo(debug_switch_labels)($a1)
/* 8D95C 8008CD5C 3C05800E */  lui        $a1, %hi(cheatStatus_labels)
/* 8D960 8008CD60 24430098 */  addiu      $v1, $v0, 0x98
/* 8D964 8008CD64 AC8661B4 */  sw         $a2, %lo(boolean_labels)($a0)
/* 8D968 8008CD68 3C04800F */  lui        $a0, %hi(task_failure_labels)
/* 8D96C 8008CD6C ACA361B8 */  sw         $v1, %lo(cheatStatus_labels)($a1)
/* 8D970 8008CD70 24430160 */  addiu      $v1, $v0, 0x160
/* 8D974 8008CD74 3C05800F */  lui        $a1, %hi(equip_error_labels)
/* 8D978 8008CD78 AC831A14 */  sw         $v1, %lo(task_failure_labels)($a0)
/* 8D97C 8008CD7C 2443017C */  addiu      $v1, $v0, 0x17c
/* 8D980 8008CD80 3C04800F */  lui        $a0, 0x800f
/* 8D984 8008CD84 ACA31A10 */  sw         $v1, %lo(equip_error_labels)($a1)
/* 8D988 8008CD88 244301AC */  addiu      $v1, $v0, 0x1ac
/* 8D98C 8008CD8C 3C05800F */  lui        $a1, %hi(on_off_labels)
/* 8D990 8008CD90 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D994 8008CD94 244201DC */  addiu      $v0, $v0, 0x1dc
/* 8D998 8008CD98 ACA2D470 */  sw         $v0, %lo(on_off_labels)($a1)
/* 8D99C 8008CD9C 3C02800F */  lui        $v0, %hi(bool_labels)
/* 8D9A0 8008CDA0 AC83D468 */  sw         $v1, -0x2b98($a0)
/* 8D9A4 8008CDA4 AC46D46C */  sw         $a2, %lo(bool_labels)($v0)
/* 8D9A8 8008CDA8 03E00008 */  jr         $ra
/* 8D9AC 8008CDAC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel clear_common_romstrings
/* 8D9B0 8008CDB0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D9B4 8008CDB4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 8D9B8 8008CDB8 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D9BC 8008CDBC 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 8D9C0 8008CDC0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8D9C4 8008CDC4 8E04204C */  lw         $a0, 0x204c($s0)
/* 8D9C8 8008CDC8 10800017 */  beqz       $a0, .L8008CE28
/* 8D9CC 8008CDCC 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8D9D0 8008CDD0 0C0232F9 */  jal        free_romstring
/* 8D9D4 8008CDD4 00000000 */   nop
/* 8D9D8 8008CDD8 3C02800E */  lui        $v0, %hi(commonstrings)
/* 8D9DC 8008CDDC 3C03800E */  lui        $v1, %hi(debug_switch_labels)
/* 8D9E0 8008CDE0 AC4061F0 */  sw         $zero, %lo(commonstrings)($v0)
/* 8D9E4 8008CDE4 3C02800E */  lui        $v0, %hi(boolean_labels)
/* 8D9E8 8008CDE8 AC6061B0 */  sw         $zero, %lo(debug_switch_labels)($v1)
/* 8D9EC 8008CDEC 3C03800E */  lui        $v1, %hi(cheatStatus_labels)
/* 8D9F0 8008CDF0 AC4061B4 */  sw         $zero, %lo(boolean_labels)($v0)
/* 8D9F4 8008CDF4 3C02800F */  lui        $v0, %hi(task_failure_labels)
/* 8D9F8 8008CDF8 AC6061B8 */  sw         $zero, %lo(cheatStatus_labels)($v1)
/* 8D9FC 8008CDFC 3C03800F */  lui        $v1, %hi(equip_error_labels)
/* 8DA00 8008CE00 AC401A14 */  sw         $zero, %lo(task_failure_labels)($v0)
/* 8DA04 8008CE04 3C02800F */  lui        $v0, %hi(debug_state_labels)
/* 8DA08 8008CE08 AC601A10 */  sw         $zero, %lo(equip_error_labels)($v1)
/* 8DA0C 8008CE0C 3C03800F */  lui        $v1, %hi(on_off_labels)
/* 8DA10 8008CE10 AC40D468 */  sw         $zero, %lo(debug_state_labels)($v0)
/* 8DA14 8008CE14 3C02800F */  lui        $v0, %hi(bool_labels)
/* 8DA18 8008CE18 AE00204C */  sw         $zero, 0x204c($s0)
/* 8DA1C 8008CE1C AC60D470 */  sw         $zero, %lo(on_off_labels)($v1)
/* 8DA20 8008CE20 AC40D46C */  sw         $zero, %lo(bool_labels)($v0)
/* 8DA24 8008CE24 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008CE28:
/* 8DA28 8008CE28 8FB00010 */  lw         $s0, 0x10($sp)
/* 8DA2C 8008CE2C 03E00008 */  jr         $ra
/* 8DA30 8008CE30 27BD0018 */   addiu     $sp, $sp, 0x18
/* 8DA34 8008CE34 00000000 */  nop
/* 8DA38 8008CE38 00000000 */  nop
/* 8DA3C 8008CE3C 00000000 */  nop
