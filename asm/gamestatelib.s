.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel Ofunc_NOOP
/* D5970 800D4D70 03E00008 */  jr         $ra
/* D5974 800D4D74 00000000 */   nop

glabel func_800D4D78
/* D5978 800D4D78 8C890010 */  lw         $t1, 0x10($a0)
/* D597C 800D4D7C 11200007 */  beqz       $t1, .L800D4D9C
/* D5980 800D4D80 30A5FFFF */   andi      $a1, $a1, 0xffff
/* D5984 800D4D84 94820000 */  lhu        $v0, ($a0)
/* D5988 800D4D88 00004021 */  addu       $t0, $zero, $zero
/* D598C 800D4D8C 3403FFFF */  ori        $v1, $zero, 0xffff
/* D5990 800D4D90 2442FFFF */  addiu      $v0, $v0, -1
/* D5994 800D4D94 14A30005 */  bne        $a1, $v1, .L800D4DAC
/* D5998 800D4D98 3044FFFF */   andi      $a0, $v0, 0xffff
.L800D4D9C:
/* D599C 800D4D9C 03E00008 */  jr         $ra
/* D59A0 800D4DA0 3402FFFF */   ori       $v0, $zero, 0xffff
.L800D4DA4:
/* D59A4 800D4DA4 03E00008 */  jr         $ra
/* D59A8 800D4DA8 94620000 */   lhu       $v0, ($v1)
.L800D4DAC:
/* D59AC 800D4DAC 01041021 */  addu       $v0, $t0, $a0
.L800D4DB0:
/* D59B0 800D4DB0 00023842 */  srl        $a3, $v0, 1
/* D59B4 800D4DB4 00071880 */  sll        $v1, $a3, 2
/* D59B8 800D4DB8 00691821 */  addu       $v1, $v1, $t1
/* D59BC 800D4DBC 94660002 */  lhu        $a2, 2($v1)
/* D59C0 800D4DC0 00A6102B */  sltu       $v0, $a1, $a2
/* D59C4 800D4DC4 10400003 */  beqz       $v0, .L800D4DD4
/* D59C8 800D4DC8 24E2FFFF */   addiu     $v0, $a3, -1
/* D59CC 800D4DCC 08035379 */  j          .L800D4DE4
/* D59D0 800D4DD0 3044FFFF */   andi      $a0, $v0, 0xffff
.L800D4DD4:
/* D59D4 800D4DD4 00C5102B */  sltu       $v0, $a2, $a1
/* D59D8 800D4DD8 1040FFF2 */  beqz       $v0, .L800D4DA4
/* D59DC 800D4DDC 24E20001 */   addiu     $v0, $a3, 1
/* D59E0 800D4DE0 3048FFFF */  andi       $t0, $v0, 0xffff
.L800D4DE4:
/* D59E4 800D4DE4 0088102B */  sltu       $v0, $a0, $t0
/* D59E8 800D4DE8 1040FFF1 */  beqz       $v0, .L800D4DB0
/* D59EC 800D4DEC 01041021 */   addu      $v0, $t0, $a0
/* D59F0 800D4DF0 03E00008 */  jr         $ra
/* D59F4 800D4DF4 3402FFFF */   ori       $v0, $zero, 0xffff

glabel setGSF_pointers
/* D59F8 800D4DF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D59FC 800D4DFC AFBF0010 */  sw         $ra, 0x10($sp)
/* D5A00 800D4E00 8C82000C */  lw         $v0, 0xc($a0)
/* D5A04 800D4E04 8C830008 */  lw         $v1, 8($a0)
/* D5A08 800D4E08 00441021 */  addu       $v0, $v0, $a0
/* D5A0C 800D4E0C 00641821 */  addu       $v1, $v1, $a0
/* D5A10 800D4E10 AC82000C */  sw         $v0, 0xc($a0)
/* D5A14 800D4E14 0C03549D */  jal        set_gamestateFunnel_f
/* D5A18 800D4E18 AC830008 */   sw        $v1, 8($a0)
/* D5A1C 800D4E1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* D5A20 800D4E20 03E00008 */  jr         $ra
/* D5A24 800D4E24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel gameStateBitmask
/* D5A28 800D4E28 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D5A2C 800D4E2C AFB3001C */  sw         $s3, 0x1c($sp)
/* D5A30 800D4E30 00A09821 */  addu       $s3, $a1, $zero
/* D5A34 800D4E34 AFBF0030 */  sw         $ra, 0x30($sp)
/* D5A38 800D4E38 AFB7002C */  sw         $s7, 0x2c($sp)
/* D5A3C 800D4E3C AFB60028 */  sw         $s6, 0x28($sp)
/* D5A40 800D4E40 AFB50024 */  sw         $s5, 0x24($sp)
/* D5A44 800D4E44 AFB40020 */  sw         $s4, 0x20($sp)
/* D5A48 800D4E48 AFB20018 */  sw         $s2, 0x18($sp)
/* D5A4C 800D4E4C AFB10014 */  sw         $s1, 0x14($sp)
/* D5A50 800D4E50 AFB00010 */  sw         $s0, 0x10($sp)
/* D5A54 800D4E54 92620004 */  lbu        $v0, 4($s3)
/* D5A58 800D4E58 2C420003 */  sltiu      $v0, $v0, 3
/* D5A5C 800D4E5C 14400003 */  bnez       $v0, .L800D4E6C
/* D5A60 800D4E60 0080A021 */   addu      $s4, $a0, $zero
/* D5A64 800D4E64 080353BE */  j          .L800D4EF8
/* D5A68 800D4E68 00001021 */   addu      $v0, $zero, $zero
.L800D4E6C:
/* D5A6C 800D4E6C 00009021 */  addu       $s2, $zero, $zero
/* D5A70 800D4E70 00008021 */  addu       $s0, $zero, $zero
/* D5A74 800D4E74 96620002 */  lhu        $v0, 2($s3)
/* D5A78 800D4E78 8E83000C */  lw         $v1, 0xc($s4)
/* D5A7C 800D4E7C 92640007 */  lbu        $a0, 7($s3)
/* D5A80 800D4E80 00021040 */  sll        $v0, $v0, 1
/* D5A84 800D4E84 1080001B */  beqz       $a0, .L800D4EF4
/* D5A88 800D4E88 00628821 */   addu      $s1, $v1, $v0
/* D5A8C 800D4E8C 3417FFFF */  ori        $s7, $zero, 0xffff
/* D5A90 800D4E90 24160002 */  addiu      $s6, $zero, 2
/* D5A94 800D4E94 3C02800F */  lui        $v0, %hi(gamestateShortBitfeild)
/* D5A98 800D4E98 2455509C */  addiu      $s5, $v0, %lo(gamestateShortBitfeild)
/* D5A9C 800D4E9C 96250000 */  lhu        $a1, ($s1)
.L800D4EA0:
/* D5AA0 800D4EA0 10B7000E */  beq        $a1, $s7, .L800D4EDC
/* D5AA4 800D4EA4 26310002 */   addiu     $s1, $s1, 2
/* D5AA8 800D4EA8 0C0354D6 */  jal        get_EventFlag
/* D5AAC 800D4EAC 02802021 */   addu      $a0, $s4, $zero
/* D5AB0 800D4EB0 1040000B */  beqz       $v0, .L800D4EE0
/* D5AB4 800D4EB4 26430001 */   addiu     $v1, $s2, 1
/* D5AB8 800D4EB8 92620004 */  lbu        $v0, 4($s3)
/* D5ABC 800D4EBC 14560004 */  bne        $v0, $s6, .L800D4ED0
/* D5AC0 800D4EC0 00121040 */   sll       $v0, $s2, 1
/* D5AC4 800D4EC4 26020001 */  addiu      $v0, $s0, 1
/* D5AC8 800D4EC8 080353B8 */  j          .L800D4EE0
/* D5ACC 800D4ECC 3050FFFF */   andi      $s0, $v0, 0xffff
.L800D4ED0:
/* D5AD0 800D4ED0 00551021 */  addu       $v0, $v0, $s5
/* D5AD4 800D4ED4 94430000 */  lhu        $v1, ($v0)
/* D5AD8 800D4ED8 00708025 */  or         $s0, $v1, $s0
.L800D4EDC:
/* D5ADC 800D4EDC 26430001 */  addiu      $v1, $s2, 1
.L800D4EE0:
/* D5AE0 800D4EE0 92620007 */  lbu        $v0, 7($s3)
/* D5AE4 800D4EE4 3072FFFF */  andi       $s2, $v1, 0xffff
/* D5AE8 800D4EE8 0242102B */  sltu       $v0, $s2, $v0
/* D5AEC 800D4EEC 5440FFEC */  bnel       $v0, $zero, .L800D4EA0
/* D5AF0 800D4EF0 96250000 */   lhu       $a1, ($s1)
.L800D4EF4:
/* D5AF4 800D4EF4 02001021 */  addu       $v0, $s0, $zero
.L800D4EF8:
/* D5AF8 800D4EF8 8FBF0030 */  lw         $ra, 0x30($sp)
/* D5AFC 800D4EFC 8FB7002C */  lw         $s7, 0x2c($sp)
/* D5B00 800D4F00 8FB60028 */  lw         $s6, 0x28($sp)
/* D5B04 800D4F04 8FB50024 */  lw         $s5, 0x24($sp)
/* D5B08 800D4F08 8FB40020 */  lw         $s4, 0x20($sp)
/* D5B0C 800D4F0C 8FB3001C */  lw         $s3, 0x1c($sp)
/* D5B10 800D4F10 8FB20018 */  lw         $s2, 0x18($sp)
/* D5B14 800D4F14 8FB10014 */  lw         $s1, 0x14($sp)
/* D5B18 800D4F18 8FB00010 */  lw         $s0, 0x10($sp)
/* D5B1C 800D4F1C 03E00008 */  jr         $ra
/* D5B20 800D4F20 27BD0038 */   addiu     $sp, $sp, 0x38

glabel gamestate_func_with_ANDgate
/* D5B24 800D4F24 3084FFFF */  andi       $a0, $a0, 0xffff
/* D5B28 800D4F28 00003021 */  addu       $a2, $zero, $zero
/* D5B2C 800D4F2C 00002821 */  addu       $a1, $zero, $zero
.L800D4F30:
/* D5B30 800D4F30 30820001 */  andi       $v0, $a0, 1
/* D5B34 800D4F34 10400002 */  beqz       $v0, .L800D4F40
/* D5B38 800D4F38 24C20001 */   addiu     $v0, $a2, 1
/* D5B3C 800D4F3C 3046FFFF */  andi       $a2, $v0, 0xffff
.L800D4F40:
/* D5B40 800D4F40 24A20001 */  addiu      $v0, $a1, 1
/* D5B44 800D4F44 3045FFFF */  andi       $a1, $v0, 0xffff
/* D5B48 800D4F48 2CA30010 */  sltiu      $v1, $a1, 0x10
/* D5B4C 800D4F4C 1460FFF8 */  bnez       $v1, .L800D4F30
/* D5B50 800D4F50 00042042 */   srl       $a0, $a0, 1
/* D5B54 800D4F54 03E00008 */  jr         $ra
/* D5B58 800D4F58 00C01021 */   addu      $v0, $a2, $zero

glabel GameStateCrash
/* D5B5C 800D4F5C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5B60 800D4F60 00802821 */  addu       $a1, $a0, $zero
/* D5B64 800D4F64 3C04800E */  lui        $a0, %hi(D_800E4DC0)
/* D5B68 800D4F68 AFBF0010 */  sw         $ra, 0x10($sp)
/* D5B6C 800D4F6C 0C025F2D */  jal        manualCrash
/* D5B70 800D4F70 24844DC0 */   addiu     $a0, $a0, %lo(D_800E4DC0)
/* D5B74 800D4F74 8FBF0010 */  lw         $ra, 0x10($sp)
/* D5B78 800D4F78 03E00008 */  jr         $ra
/* D5B7C 800D4F7C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ProcessGameStates
/* D5B80 800D4F80 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D5B84 800D4F84 AFB3001C */  sw         $s3, 0x1c($sp)
/* D5B88 800D4F88 00809821 */  addu       $s3, $a0, $zero
/* D5B8C 800D4F8C AFBF0020 */  sw         $ra, 0x20($sp)
/* D5B90 800D4F90 AFB20018 */  sw         $s2, 0x18($sp)
/* D5B94 800D4F94 AFB10014 */  sw         $s1, 0x14($sp)
/* D5B98 800D4F98 AFB00010 */  sw         $s0, 0x10($sp)
.L800D4F9C:
/* D5B9C 800D4F9C 96620006 */  lhu        $v0, 6($s3)
.L800D4FA0:
/* D5BA0 800D4FA0 104000AE */  beqz       $v0, .L800D525C
/* D5BA4 800D4FA4 8FBF0020 */   lw        $ra, 0x20($sp)
/* D5BA8 800D4FA8 96720004 */  lhu        $s2, 4($s3)
/* D5BAC 800D4FAC 96620000 */  lhu        $v0, ($s3)
/* D5BB0 800D4FB0 0242102B */  sltu       $v0, $s2, $v0
/* D5BB4 800D4FB4 1040FFF9 */  beqz       $v0, .L800D4F9C
/* D5BB8 800D4FB8 A6600006 */   sh        $zero, 6($s3)
/* D5BBC 800D4FBC 02602021 */  addu       $a0, $s3, $zero
.L800D4FC0:
/* D5BC0 800D4FC0 0C0354DC */  jal        get_struct_state
/* D5BC4 800D4FC4 02402821 */   addu      $a1, $s2, $zero
/* D5BC8 800D4FC8 02602021 */  addu       $a0, $s3, $zero
/* D5BCC 800D4FCC 00408021 */  addu       $s0, $v0, $zero
/* D5BD0 800D4FD0 0C03538A */  jal        gameStateBitmask
/* D5BD4 800D4FD4 02002821 */   addu      $a1, $s0, $zero
/* D5BD8 800D4FD8 00403021 */  addu       $a2, $v0, $zero
/* D5BDC 800D4FDC 92030004 */  lbu        $v1, 4($s0)
/* D5BE0 800D4FE0 24020001 */  addiu      $v0, $zero, 1
/* D5BE4 800D4FE4 10620052 */  beq        $v1, $v0, .L800D5130
/* D5BE8 800D4FE8 00008821 */   addu      $s1, $zero, $zero
/* D5BEC 800D4FEC 28620002 */  slti       $v0, $v1, 2
/* D5BF0 800D4FF0 10400005 */  beqz       $v0, .L800D5008
/* D5BF4 800D4FF4 24020002 */   addiu     $v0, $zero, 2
/* D5BF8 800D4FF8 10600007 */  beqz       $v1, .L800D5018
/* D5BFC 800D4FFC 3C04800E */   lui       $a0, %hi(D_800E4DC0)
/* D5C00 800D5000 08035488 */  j          .L800D5220
/* D5C04 800D5004 24844DC0 */   addiu     $a0, $a0, %lo(D_800E4DC0)
.L800D5008:
/* D5C08 800D5008 1062005F */  beq        $v1, $v0, .L800D5188
/* D5C0C 800D500C 3C04800E */   lui       $a0, %hi(D_800E4DC0)
/* D5C10 800D5010 08035488 */  j          .L800D5220
/* D5C14 800D5014 24844DC0 */   addiu     $a0, $a0, %lo(D_800E4DC0)
.L800D5018:
/* D5C18 800D5018 92050005 */  lbu        $a1, 5($s0)
/* D5C1C 800D501C 2CA20005 */  sltiu      $v0, $a1, 5
/* D5C20 800D5020 10400007 */  beqz       $v0, .L800D5040
/* D5C24 800D5024 3C02800E */   lui       $v0, %hi(D_800E4E60)
/* D5C28 800D5028 24424E60 */  addiu      $v0, $v0, %lo(D_800E4E60)
/* D5C2C 800D502C 00051880 */  sll        $v1, $a1, 2
/* D5C30 800D5030 00621821 */  addu       $v1, $v1, $v0
/* D5C34 800D5034 8C640000 */  lw         $a0, ($v1)
/* D5C38 800D5038 00800008 */  jr         $a0
/* D5C3C 800D503C 00000000 */   nop
.L800D5040:
/* D5C40 800D5040 3C04800E */  lui        $a0, %hi(D_800E4DE8)
/* D5C44 800D5044 0C0353D7 */  jal        GameStateCrash
/* D5C48 800D5048 24844DE8 */   addiu     $a0, $a0, %lo(D_800E4DE8)
/* D5C4C 800D504C 0803548C */  j          .L800D5230
/* D5C50 800D5050 02602021 */   addu      $a0, $s3, $zero
/* D5C54 800D5054 3C04800F */  lui        $a0, %hi(gamestateShortANDfeild)
/* D5C58 800D5058 92020007 */  lbu        $v0, 7($s0)
/* D5C5C 800D505C 248450BC */  addiu      $a0, $a0, %lo(gamestateShortANDfeild)
/* D5C60 800D5060 00021040 */  sll        $v0, $v0, 1
/* D5C64 800D5064 00441021 */  addu       $v0, $v0, $a0
/* D5C68 800D5068 94430000 */  lhu        $v1, ($v0)
/* D5C6C 800D506C 08035448 */  j          .L800D5120
/* D5C70 800D5070 00662024 */   and       $a0, $v1, $a2
/* D5C74 800D5074 3C02800F */  lui        $v0, %hi(gamestateShortANDfeild)
/* D5C78 800D5078 92030007 */  lbu        $v1, 7($s0)
/* D5C7C 800D507C 244250BC */  addiu      $v0, $v0, %lo(gamestateShortANDfeild)
/* D5C80 800D5080 00031840 */  sll        $v1, $v1, 1
/* D5C84 800D5084 00621821 */  addu       $v1, $v1, $v0
/* D5C88 800D5088 94640000 */  lhu        $a0, ($v1)
/* D5C8C 800D508C 00862024 */  and        $a0, $a0, $a2
/* D5C90 800D5090 54800066 */  bnel       $a0, $zero, .L800D522C
/* D5C94 800D5094 24110001 */   addiu     $s1, $zero, 1
/* D5C98 800D5098 0803548C */  j          .L800D5230
/* D5C9C 800D509C 02602021 */   addu      $a0, $s3, $zero
/* D5CA0 800D50A0 3C03800F */  lui        $v1, %hi(gamestateShortANDfeild)
/* D5CA4 800D50A4 92020007 */  lbu        $v0, 7($s0)
/* D5CA8 800D50A8 246350BC */  addiu      $v1, $v1, %lo(gamestateShortANDfeild)
/* D5CAC 800D50AC 00021040 */  sll        $v0, $v0, 1
/* D5CB0 800D50B0 00431021 */  addu       $v0, $v0, $v1
/* D5CB4 800D50B4 94440000 */  lhu        $a0, ($v0)
/* D5CB8 800D50B8 0C0353C9 */  jal        gamestate_func_with_ANDgate
/* D5CBC 800D50BC 00862024 */   and       $a0, $a0, $a2
/* D5CC0 800D50C0 24030001 */  addiu      $v1, $zero, 1
/* D5CC4 800D50C4 50430059 */  beql       $v0, $v1, .L800D522C
/* D5CC8 800D50C8 24110001 */   addiu     $s1, $zero, 1
/* D5CCC 800D50CC 0803548C */  j          .L800D5230
/* D5CD0 800D50D0 02602021 */   addu      $a0, $s3, $zero
/* D5CD4 800D50D4 3C02800F */  lui        $v0, %hi(gamestateShortANDfeild)
/* D5CD8 800D50D8 92030007 */  lbu        $v1, 7($s0)
/* D5CDC 800D50DC 244250BC */  addiu      $v0, $v0, %lo(gamestateShortANDfeild)
/* D5CE0 800D50E0 00031840 */  sll        $v1, $v1, 1
/* D5CE4 800D50E4 00621821 */  addu       $v1, $v1, $v0
/* D5CE8 800D50E8 94640000 */  lhu        $a0, ($v1)
/* D5CEC 800D50EC 00862024 */  and        $a0, $a0, $a2
/* D5CF0 800D50F0 5080004E */  beql       $a0, $zero, .L800D522C
/* D5CF4 800D50F4 24110001 */   addiu     $s1, $zero, 1
/* D5CF8 800D50F8 0803548C */  j          .L800D5230
/* D5CFC 800D50FC 02602021 */   addu      $a0, $s3, $zero
/* D5D00 800D5100 3C04800F */  lui        $a0, %hi(gamestateShortANDfeild)
/* D5D04 800D5104 92020007 */  lbu        $v0, 7($s0)
/* D5D08 800D5108 248450BC */  addiu      $a0, $a0, %lo(gamestateShortANDfeild)
/* D5D0C 800D510C 00021040 */  sll        $v0, $v0, 1
/* D5D10 800D5110 00441021 */  addu       $v0, $v0, $a0
/* D5D14 800D5114 94430000 */  lhu        $v1, ($v0)
/* D5D18 800D5118 96040000 */  lhu        $a0, ($s0)
/* D5D1C 800D511C 00661824 */  and        $v1, $v1, $a2
.L800D5120:
/* D5D20 800D5120 50640042 */  beql       $v1, $a0, .L800D522C
/* D5D24 800D5124 24110001 */   addiu     $s1, $zero, 1
/* D5D28 800D5128 0803548C */  j          .L800D5230
/* D5D2C 800D512C 02602021 */   addu      $a0, $s3, $zero
.L800D5130:
/* D5D30 800D5130 92050005 */  lbu        $a1, 5($s0)
/* D5D34 800D5134 24020006 */  addiu      $v0, $zero, 6
/* D5D38 800D5138 50A20011 */  beql       $a1, $v0, .L800D5180
/* D5D3C 800D513C 96020000 */   lhu       $v0, ($s0)
/* D5D40 800D5140 28A20007 */  slti       $v0, $a1, 7
/* D5D44 800D5144 10400005 */  beqz       $v0, .L800D515C
/* D5D48 800D5148 24020005 */   addiu     $v0, $zero, 5
/* D5D4C 800D514C 10A20022 */  beq        $a1, $v0, .L800D51D8
/* D5D50 800D5150 3C04800E */   lui       $a0, 0x800e
/* D5D54 800D5154 0803545C */  j          .L800D5170
/* D5D58 800D5158 00000000 */   nop
.L800D515C:
/* D5D5C 800D515C 24020007 */  addiu      $v0, $zero, 7
/* D5D60 800D5160 10A20024 */  beq        $a1, $v0, .L800D51F4
/* D5D64 800D5164 24020008 */   addiu     $v0, $zero, 8
/* D5D68 800D5168 10A20028 */  beq        $a1, $v0, .L800D520C
/* D5D6C 800D516C 3C04800E */   lui       $a0, %hi(D_800E4E08)
.L800D5170:
/* D5D70 800D5170 0C0353D7 */  jal        GameStateCrash
/* D5D74 800D5174 24844E08 */   addiu     $a0, $a0, %lo(D_800E4E08)
/* D5D78 800D5178 0803548C */  j          .L800D5230
/* D5D7C 800D517C 02602021 */   addu      $a0, $s3, $zero
.L800D5180:
/* D5D80 800D5180 0803547F */  j          .L800D51FC
/* D5D84 800D5184 0046102B */   sltu      $v0, $v0, $a2
.L800D5188:
/* D5D88 800D5188 92050005 */  lbu        $a1, 5($s0)
/* D5D8C 800D518C 24020006 */  addiu      $v0, $zero, 6
/* D5D90 800D5190 50A20016 */  beql       $a1, $v0, .L800D51EC
/* D5D94 800D5194 96020000 */   lhu       $v0, ($s0)
/* D5D98 800D5198 28A20007 */  slti       $v0, $a1, 7
/* D5D9C 800D519C 10400005 */  beqz       $v0, .L800D51B4
/* D5DA0 800D51A0 24020005 */   addiu     $v0, $zero, 5
/* D5DA4 800D51A4 10A2000C */  beq        $a1, $v0, .L800D51D8
/* D5DA8 800D51A8 3C04800E */   lui       $a0, 0x800e
/* D5DAC 800D51AC 08035472 */  j          .L800D51C8
/* D5DB0 800D51B0 00000000 */   nop
.L800D51B4:
/* D5DB4 800D51B4 24020007 */  addiu      $v0, $zero, 7
/* D5DB8 800D51B8 10A2000E */  beq        $a1, $v0, .L800D51F4
/* D5DBC 800D51BC 24020008 */   addiu     $v0, $zero, 8
/* D5DC0 800D51C0 10A20012 */  beq        $a1, $v0, .L800D520C
/* D5DC4 800D51C4 3C04800E */   lui       $a0, %hi(D_800E4E28)
.L800D51C8:
/* D5DC8 800D51C8 0C0353D7 */  jal        GameStateCrash
/* D5DCC 800D51CC 24844E28 */   addiu     $a0, $a0, %lo(D_800E4E28)
/* D5DD0 800D51D0 0803548C */  j          .L800D5230
/* D5DD4 800D51D4 02602021 */   addu      $a0, $s3, $zero
.L800D51D8:
/* D5DD8 800D51D8 96020000 */  lhu        $v0, ($s0)
/* D5DDC 800D51DC 50C20013 */  beql       $a2, $v0, .L800D522C
/* D5DE0 800D51E0 24110001 */   addiu     $s1, $zero, 1
/* D5DE4 800D51E4 0803548C */  j          .L800D5230
/* D5DE8 800D51E8 02602021 */   addu      $a0, $s3, $zero
.L800D51EC:
/* D5DEC 800D51EC 0803547F */  j          .L800D51FC
/* D5DF0 800D51F0 0046102B */   sltu      $v0, $v0, $a2
.L800D51F4:
/* D5DF4 800D51F4 96020000 */  lhu        $v0, ($s0)
/* D5DF8 800D51F8 00C2102B */  sltu       $v0, $a2, $v0
.L800D51FC:
/* D5DFC 800D51FC 5440000B */  bnel       $v0, $zero, .L800D522C
/* D5E00 800D5200 24110001 */   addiu     $s1, $zero, 1
/* D5E04 800D5204 0803548C */  j          .L800D5230
/* D5E08 800D5208 02602021 */   addu      $a0, $s3, $zero
.L800D520C:
/* D5E0C 800D520C 96020000 */  lhu        $v0, ($s0)
/* D5E10 800D5210 54C20006 */  bnel       $a2, $v0, .L800D522C
/* D5E14 800D5214 24110001 */   addiu     $s1, $zero, 1
/* D5E18 800D5218 0803548C */  j          .L800D5230
/* D5E1C 800D521C 02602021 */   addu      $a0, $s3, $zero
.L800D5220:
/* D5E20 800D5220 3C05800E */  lui        $a1, %hi(D_800E4E48)
/* D5E24 800D5224 0C025F2D */  jal        manualCrash
/* D5E28 800D5228 24A54E48 */   addiu     $a1, $a1, %lo(D_800E4E48)
.L800D522C:
/* D5E2C 800D522C 02602021 */  addu       $a0, $s3, $zero
.L800D5230:
/* D5E30 800D5230 02402821 */  addu       $a1, $s2, $zero
/* D5E34 800D5234 0C0354A5 */  jal        set_journalentry_flag
/* D5E38 800D5238 02203021 */   addu      $a2, $s1, $zero
/* D5E3C 800D523C 26430001 */  addiu      $v1, $s2, 1
/* D5E40 800D5240 96620000 */  lhu        $v0, ($s3)
/* D5E44 800D5244 3072FFFF */  andi       $s2, $v1, 0xffff
/* D5E48 800D5248 0242102B */  sltu       $v0, $s2, $v0
/* D5E4C 800D524C 1440FF5C */  bnez       $v0, .L800D4FC0
/* D5E50 800D5250 02602021 */   addu      $a0, $s3, $zero
/* D5E54 800D5254 080353E8 */  j          .L800D4FA0
/* D5E58 800D5258 96620006 */   lhu       $v0, 6($s3)
.L800D525C:
/* D5E5C 800D525C 8FB3001C */  lw         $s3, 0x1c($sp)
/* D5E60 800D5260 8FB20018 */  lw         $s2, 0x18($sp)
/* D5E64 800D5264 8FB10014 */  lw         $s1, 0x14($sp)
/* D5E68 800D5268 8FB00010 */  lw         $s0, 0x10($sp)
/* D5E6C 800D526C 03E00008 */  jr         $ra
/* D5E70 800D5270 27BD0028 */   addiu     $sp, $sp, 0x28

glabel set_gamestateFunnel_f
/* D5E74 800D5274 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5E78 800D5278 24020001 */  addiu      $v0, $zero, 1
/* D5E7C 800D527C AFBF0010 */  sw         $ra, 0x10($sp)
/* D5E80 800D5280 0C0353E0 */  jal        ProcessGameStates
/* D5E84 800D5284 A4820006 */   sh        $v0, 6($a0)
/* D5E88 800D5288 8FBF0010 */  lw         $ra, 0x10($sp)
/* D5E8C 800D528C 03E00008 */  jr         $ra
/* D5E90 800D5290 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_journalentry_flag
/* D5E94 800D5294 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5E98 800D5298 00803821 */  addu       $a3, $a0, $zero
/* D5E9C 800D529C 30A4FFFF */  andi       $a0, $a1, 0xffff
/* D5EA0 800D52A0 AFBF0014 */  sw         $ra, 0x14($sp)
/* D5EA4 800D52A4 AFB00010 */  sw         $s0, 0x10($sp)
/* D5EA8 800D52A8 8CE30008 */  lw         $v1, 8($a3)
/* D5EAC 800D52AC 000410C0 */  sll        $v0, $a0, 3
/* D5EB0 800D52B0 00621821 */  addu       $v1, $v1, $v0
/* D5EB4 800D52B4 90700006 */  lbu        $s0, 6($v1)
/* D5EB8 800D52B8 30C6FFFF */  andi       $a2, $a2, 0xffff
/* D5EBC 800D52BC 1206000C */  beq        $s0, $a2, .L800D52F0
/* D5EC0 800D52C0 2C8215B4 */   sltiu     $v0, $a0, 0x15b4
/* D5EC4 800D52C4 A0660006 */  sb         $a2, 6($v1)
/* D5EC8 800D52C8 24030001 */  addiu      $v1, $zero, 1
/* D5ECC 800D52CC 14400008 */  bnez       $v0, .L800D52F0
/* D5ED0 800D52D0 A4E30006 */   sh        $v1, 6($a3)
/* D5ED4 800D52D4 10C00006 */  beqz       $a2, .L800D52F0
/* D5ED8 800D52D8 2484EA4C */   addiu     $a0, $a0, -0x15b4
/* D5EDC 800D52DC 00042400 */  sll        $a0, $a0, 0x10
/* D5EE0 800D52E0 8CE20008 */  lw         $v0, 8($a3)
/* D5EE4 800D52E4 00042403 */  sra        $a0, $a0, 0x10
/* D5EE8 800D52E8 0C009765 */  jal        set_jounal_short
/* D5EEC 800D52EC A043710E */   sb        $v1, 0x710e($v0)
.L800D52F0:
/* D5EF0 800D52F0 02001021 */  addu       $v0, $s0, $zero
/* D5EF4 800D52F4 8FBF0014 */  lw         $ra, 0x14($sp)
/* D5EF8 800D52F8 8FB00010 */  lw         $s0, 0x10($sp)
/* D5EFC 800D52FC 03E00008 */  jr         $ra
/* D5F00 800D5300 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_eventFlag_
/* D5F04 800D5304 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5F08 800D5308 30A5FFFF */  andi       $a1, $a1, 0xffff
/* D5F0C 800D530C AFBF0014 */  sw         $ra, 0x14($sp)
/* D5F10 800D5310 AFB00010 */  sw         $s0, 0x10($sp)
/* D5F14 800D5314 8C820008 */  lw         $v0, 8($a0)
/* D5F18 800D5318 000528C0 */  sll        $a1, $a1, 3
/* D5F1C 800D531C 00458021 */  addu       $s0, $v0, $a1
/* D5F20 800D5320 92030004 */  lbu        $v1, 4($s0)
/* D5F24 800D5324 24020003 */  addiu      $v0, $zero, 3
/* D5F28 800D5328 50620007 */  beql       $v1, $v0, .L800D5348
/* D5F2C 800D532C 92020006 */   lbu       $v0, 6($s0)
/* D5F30 800D5330 94820006 */  lhu        $v0, 6($a0)
/* D5F34 800D5334 50400004 */  beql       $v0, $zero, .L800D5348
/* D5F38 800D5338 92020006 */   lbu       $v0, 6($s0)
/* D5F3C 800D533C 0C0353E0 */  jal        ProcessGameStates
/* D5F40 800D5340 00000000 */   nop
/* D5F44 800D5344 92020006 */  lbu        $v0, 6($s0)
.L800D5348:
/* D5F48 800D5348 8FBF0014 */  lw         $ra, 0x14($sp)
/* D5F4C 800D534C 8FB00010 */  lw         $s0, 0x10($sp)
/* D5F50 800D5350 03E00008 */  jr         $ra
/* D5F54 800D5354 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_EventFlag
/* D5F58 800D5358 30A5FFFF */  andi       $a1, $a1, 0xffff
/* D5F5C 800D535C 8C830008 */  lw         $v1, 8($a0)
/* D5F60 800D5360 000528C0 */  sll        $a1, $a1, 3
/* D5F64 800D5364 00651821 */  addu       $v1, $v1, $a1
/* D5F68 800D5368 03E00008 */  jr         $ra
/* D5F6C 800D536C 90620006 */   lbu       $v0, 6($v1)

glabel get_struct_state
/* D5F70 800D5370 30A5FFFF */  andi       $a1, $a1, 0xffff
/* D5F74 800D5374 8C820008 */  lw         $v0, 8($a0)
/* D5F78 800D5378 000528C0 */  sll        $a1, $a1, 3
/* D5F7C 800D537C 03E00008 */  jr         $ra
/* D5F80 800D5380 00451021 */   addu      $v0, $v0, $a1
/* D5F84 800D5384 00000000 */  nop
/* D5F88 800D5388 00000000 */  nop
/* D5F8C 800D538C 00000000 */  nop
