.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80091E30
/* 92A30 80091E30 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 92A34 80091E34 AFB30024 */  sw         $s3, 0x24($sp)
/* 92A38 80091E38 00809821 */  addu       $s3, $a0, $zero
/* 92A3C 80091E3C 240400B4 */  addiu      $a0, $zero, 0xb4
/* 92A40 80091E40 AFB1001C */  sw         $s1, 0x1c($sp)
/* 92A44 80091E44 00A08821 */  addu       $s1, $a1, $zero
/* 92A48 80091E48 AFB20020 */  sw         $s2, 0x20($sp)
/* 92A4C 80091E4C 00C09021 */  addu       $s2, $a2, $zero
/* 92A50 80091E50 AFB00018 */  sw         $s0, 0x18($sp)
/* 92A54 80091E54 AFBF0028 */  sw         $ra, 0x28($sp)
/* 92A58 80091E58 0C026259 */  jal        passToMalloc
/* 92A5C 80091E5C 00E08021 */   addu      $s0, $a3, $zero
/* 92A60 80091E60 00402021 */  addu       $a0, $v0, $zero
/* 92A64 80091E64 02602821 */  addu       $a1, $s3, $zero
/* 92A68 80091E68 02203021 */  addu       $a2, $s1, $zero
/* 92A6C 80091E6C 02403821 */  addu       $a3, $s2, $zero
/* 92A70 80091E70 0C0248B6 */  jal        combat_layonhands_healherbs_perform
/* 92A74 80091E74 AFB00010 */   sw        $s0, 0x10($sp)
/* 92A78 80091E78 8FBF0028 */  lw         $ra, 0x28($sp)
/* 92A7C 80091E7C 8FB30024 */  lw         $s3, 0x24($sp)
/* 92A80 80091E80 8FB20020 */  lw         $s2, 0x20($sp)
/* 92A84 80091E84 8FB1001C */  lw         $s1, 0x1c($sp)
/* 92A88 80091E88 8FB00018 */  lw         $s0, 0x18($sp)
/* 92A8C 80091E8C 03E00008 */  jr         $ra
/* 92A90 80091E90 27BD0030 */   addiu     $sp, $sp, 0x30

glabel char_func_icon
/* 92A94 80091E94 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 92A98 80091E98 AFB20020 */  sw         $s2, 0x20($sp)
/* 92A9C 80091E9C 8FB20050 */  lw         $s2, 0x50($sp)
/* 92AA0 80091EA0 AFB00018 */  sw         $s0, 0x18($sp)
/* 92AA4 80091EA4 8FB00054 */  lw         $s0, 0x54($sp)
/* 92AA8 80091EA8 AFB40028 */  sw         $s4, 0x28($sp)
/* 92AAC 80091EAC 0080A021 */  addu       $s4, $a0, $zero
/* 92AB0 80091EB0 AFB30024 */  sw         $s3, 0x24($sp)
/* 92AB4 80091EB4 97B3005A */  lhu        $s3, 0x5a($sp)
/* 92AB8 80091EB8 24040088 */  addiu      $a0, $zero, 0x88
/* 92ABC 80091EBC AFB70034 */  sw         $s7, 0x34($sp)
/* 92AC0 80091EC0 00A0B821 */  addu       $s7, $a1, $zero
/* 92AC4 80091EC4 AFB5002C */  sw         $s5, 0x2c($sp)
/* 92AC8 80091EC8 30D5FFFF */  andi       $s5, $a2, 0xffff
/* 92ACC 80091ECC AFB60030 */  sw         $s6, 0x30($sp)
/* 92AD0 80091ED0 30F600FF */  andi       $s6, $a3, 0xff
/* 92AD4 80091ED4 AFBF0038 */  sw         $ra, 0x38($sp)
/* 92AD8 80091ED8 0C026259 */  jal        passToMalloc
/* 92ADC 80091EDC AFB1001C */   sw        $s1, 0x1c($sp)
/* 92AE0 80091EE0 00402021 */  addu       $a0, $v0, $zero
/* 92AE4 80091EE4 0C00C850 */  jal        init_widget_grouo
/* 92AE8 80091EE8 24050002 */   addiu     $a1, $zero, 2
/* 92AEC 80091EEC 1200000F */  beqz       $s0, .L80091F2C
/* 92AF0 80091EF0 00408821 */   addu      $s1, $v0, $zero
/* 92AF4 80091EF4 0C0290E2 */  jal        get_borg_8
/* 92AF8 80091EF8 02002021 */   addu      $a0, $s0, $zero
/* 92AFC 80091EFC 2404007C */  addiu      $a0, $zero, 0x7c
/* 92B00 80091F00 0C026259 */  jal        passToMalloc
/* 92B04 80091F04 00408021 */   addu      $s0, $v0, $zero
/* 92B08 80091F08 00402021 */  addu       $a0, $v0, $zero
/* 92B0C 80091F0C 0C02E518 */  jal        borg8_widget
/* 92B10 80091F10 02002821 */   addu      $a1, $s0, $zero
/* 92B14 80091F14 AFA00010 */  sw         $zero, 0x10($sp)
/* 92B18 80091F18 02202021 */  addu       $a0, $s1, $zero
/* 92B1C 80091F1C 00402821 */  addu       $a1, $v0, $zero
/* 92B20 80091F20 00003021 */  addu       $a2, $zero, $zero
/* 92B24 80091F24 0C00C9A6 */  jal        func_80032698
/* 92B28 80091F28 00003821 */   addu      $a3, $zero, $zero
.L80091F2C:
/* 92B2C 80091F2C 0C026259 */  jal        passToMalloc
/* 92B30 80091F30 2404007C */   addiu     $a0, $zero, 0x7c
/* 92B34 80091F34 02802021 */  addu       $a0, $s4, $zero
/* 92B38 80091F38 0C03353E */  jal        strlen
/* 92B3C 80091F3C 00408021 */   addu      $s0, $v0, $zero
/* 92B40 80091F40 02002021 */  addu       $a0, $s0, $zero
/* 92B44 80091F44 02802821 */  addu       $a1, $s4, $zero
/* 92B48 80091F48 24420001 */  addiu      $v0, $v0, 1
/* 92B4C 80091F4C 0C02E3A0 */  jal        widgettext_func_2
/* 92B50 80091F50 3046FFFF */   andi      $a2, $v0, 0xffff
/* 92B54 80091F54 00408021 */  addu       $s0, $v0, $zero
/* 92B58 80091F58 8E030078 */  lw         $v1, 0x78($s0)
/* 92B5C 80091F5C 84640020 */  lh         $a0, 0x20($v1)
/* 92B60 80091F60 8C620024 */  lw         $v0, 0x24($v1)
/* 92B64 80091F64 0040F809 */  jalr       $v0
/* 92B68 80091F68 02042021 */   addu      $a0, $s0, $a0
/* 92B6C 80091F6C 02202021 */  addu       $a0, $s1, $zero
/* 92B70 80091F70 02002821 */  addu       $a1, $s0, $zero
/* 92B74 80091F74 26660005 */  addiu      $a2, $s3, 5
/* 92B78 80091F78 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 92B7C 80091F7C 00133842 */  srl        $a3, $s3, 1
/* 92B80 80091F80 00021042 */  srl        $v0, $v0, 1
/* 92B84 80091F84 00E23823 */  subu       $a3, $a3, $v0
/* 92B88 80091F88 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 92B8C 80091F8C 24020001 */  addiu      $v0, $zero, 1
/* 92B90 80091F90 0C00C9A6 */  jal        func_80032698
/* 92B94 80091F94 AFA20010 */   sw        $v0, 0x10($sp)
/* 92B98 80091F98 8E280078 */  lw         $t0, 0x78($s1)
/* 92B9C 80091F9C 92420003 */  lbu        $v0, 3($s2)
/* 92BA0 80091FA0 92450000 */  lbu        $a1, ($s2)
/* 92BA4 80091FA4 92460001 */  lbu        $a2, 1($s2)
/* 92BA8 80091FA8 92470002 */  lbu        $a3, 2($s2)
/* 92BAC 80091FAC 85040048 */  lh         $a0, 0x48($t0)
/* 92BB0 80091FB0 AFA20010 */  sw         $v0, 0x10($sp)
/* 92BB4 80091FB4 8D03004C */  lw         $v1, 0x4c($t0)
/* 92BB8 80091FB8 0060F809 */  jalr       $v1
/* 92BBC 80091FBC 02242021 */   addu      $a0, $s1, $a0
/* 92BC0 80091FC0 8FBF0038 */  lw         $ra, 0x38($sp)
/* 92BC4 80091FC4 AE370018 */  sw         $s7, 0x18($s1)
/* 92BC8 80091FC8 8FB70034 */  lw         $s7, 0x34($sp)
/* 92BCC 80091FCC A236005C */  sb         $s6, 0x5c($s1)
/* 92BD0 80091FD0 8FB60030 */  lw         $s6, 0x30($sp)
/* 92BD4 80091FD4 02201021 */  addu       $v0, $s1, $zero
/* 92BD8 80091FD8 A635005E */  sh         $s5, 0x5e($s1)
/* 92BDC 80091FDC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 92BE0 80091FE0 8FB40028 */  lw         $s4, 0x28($sp)
/* 92BE4 80091FE4 8FB30024 */  lw         $s3, 0x24($sp)
/* 92BE8 80091FE8 8FB20020 */  lw         $s2, 0x20($sp)
/* 92BEC 80091FEC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 92BF0 80091FF0 8FB00018 */  lw         $s0, 0x18($sp)
/* 92BF4 80091FF4 03E00008 */  jr         $ra
/* 92BF8 80091FF8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80091FFC
/* 92BFC 80091FFC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 92C00 80092000 AFB10014 */  sw         $s1, 0x14($sp)
/* 92C04 80092004 00808821 */  addu       $s1, $a0, $zero
/* 92C08 80092008 AFBF0018 */  sw         $ra, 0x18($sp)
/* 92C0C 8009200C AFB00010 */  sw         $s0, 0x10($sp)
/* 92C10 80092010 8E230078 */  lw         $v1, 0x78($s1)
/* 92C14 80092014 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 92C18 80092018 84640018 */  lh         $a0, 0x18($v1)
/* 92C1C 8009201C 8C62001C */  lw         $v0, 0x1c($v1)
/* 92C20 80092020 0040F809 */  jalr       $v0
/* 92C24 80092024 02242021 */   addu      $a0, $s1, $a0
/* 92C28 80092028 0050102B */  sltu       $v0, $v0, $s0
/* 92C2C 8009202C 14400008 */  bnez       $v0, .L80092050
/* 92C30 80092030 02001021 */   addu      $v0, $s0, $zero
/* 92C34 80092034 8E230078 */  lw         $v1, 0x78($s1)
/* 92C38 80092038 84640018 */  lh         $a0, 0x18($v1)
/* 92C3C 8009203C 8C62001C */  lw         $v0, 0x1c($v1)
/* 92C40 80092040 0040F809 */  jalr       $v0
/* 92C44 80092044 02242021 */   addu      $a0, $s1, $a0
/* 92C48 80092048 08024815 */  j          .L80092054
/* 92C4C 8009204C 8FBF0018 */   lw        $ra, 0x18($sp)
.L80092050:
/* 92C50 80092050 8FBF0018 */  lw         $ra, 0x18($sp)
.L80092054:
/* 92C54 80092054 8FB10014 */  lw         $s1, 0x14($sp)
/* 92C58 80092058 8FB00010 */  lw         $s0, 0x10($sp)
/* 92C5C 8009205C 03E00008 */  jr         $ra
/* 92C60 80092060 27BD0020 */   addiu     $sp, $sp, 0x20

glabel find_char_in_party
/* 92C64 80092064 14800005 */  bnez       $a0, .L8009207C
/* 92C68 80092068 00002821 */   addu      $a1, $zero, $zero
/* 92C6C 8009206C 03E00008 */  jr         $ra
/* 92C70 80092070 2402FFFF */   addiu     $v0, $zero, -1
.L80092074:
/* 92C74 80092074 03E00008 */  jr         $ra
/* 92C78 80092078 00A01021 */   addu      $v0, $a1, $zero
.L8009207C:
/* 92C7C 8009207C 3C02800E */  lui        $v0, %hi(partyPointer)
/* 92C80 80092080 8C437EA0 */  lw         $v1, %lo(partyPointer)($v0)
.L80092084:
/* 92C84 80092084 8C620000 */  lw         $v0, ($v1)
/* 92C88 80092088 1044FFFA */  beq        $v0, $a0, .L80092074
/* 92C8C 8009208C 00000000 */   nop
/* 92C90 80092090 24A50001 */  addiu      $a1, $a1, 1
/* 92C94 80092094 2CA20004 */  sltiu      $v0, $a1, 4
/* 92C98 80092098 1440FFFA */  bnez       $v0, .L80092084
/* 92C9C 8009209C 24630004 */   addiu     $v1, $v1, 4
/* 92CA0 800920A0 03E00008 */  jr         $ra
/* 92CA4 800920A4 2402FFFF */   addiu     $v0, $zero, -1

glabel init_combatSkillValues
/* 92CA8 800920A8 00001821 */  addu       $v1, $zero, $zero
/* 92CAC 800920AC 3C02800F */  lui        $v0, %hi(combatSkillValues)
/* 92CB0 800920B0 24451D00 */  addiu      $a1, $v0, %lo(combatSkillValues)
/* 92CB4 800920B4 2404FFFF */  addiu      $a0, $zero, -1
/* 92CB8 800920B8 00651021 */  addu       $v0, $v1, $a1
.L800920BC:
/* 92CBC 800920BC A0440000 */  sb         $a0, ($v0)
/* 92CC0 800920C0 24630001 */  addiu      $v1, $v1, 1
/* 92CC4 800920C4 2C620004 */  sltiu      $v0, $v1, 4
/* 92CC8 800920C8 1440FFFC */  bnez       $v0, .L800920BC
/* 92CCC 800920CC 00651021 */   addu      $v0, $v1, $a1
/* 92CD0 800920D0 03E00008 */  jr         $ra
/* 92CD4 800920D4 00000000 */   nop

glabel func_800920D8
/* 92CD8 800920D8 3C02800F */  lui        $v0, %hi(combatPointer)
/* 92CDC 800920DC 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 92CE0 800920E0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 92CE4 800920E4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 92CE8 800920E8 8C64002C */  lw         $a0, 0x2c($v1)
/* 92CEC 800920EC 8C860040 */  lw         $a2, 0x40($a0)
/* 92CF0 800920F0 8CC3002C */  lw         $v1, 0x2c($a2)
/* 92CF4 800920F4 90A2005C */  lbu        $v0, 0x5c($a1)
/* 92CF8 800920F8 8C640000 */  lw         $a0, ($v1)
/* 92CFC 800920FC 00021080 */  sll        $v0, $v0, 2
/* 92D00 80092100 00441021 */  addu       $v0, $v0, $a0
/* 92D04 80092104 8C430000 */  lw         $v1, ($v0)
/* 92D08 80092108 10600005 */  beqz       $v1, .L80092120
/* 92D0C 8009210C 24020001 */   addiu     $v0, $zero, 1
/* 92D10 80092110 A0C2003D */  sb         $v0, 0x3d($a2)
/* 92D14 80092114 90A3005C */  lbu        $v1, 0x5c($a1)
/* 92D18 80092118 0C02355B */  jal        func_8008D56C
/* 92D1C 8009211C A0C3003E */   sb        $v1, 0x3e($a2)
.L80092120:
/* 92D20 80092120 00001021 */  addu       $v0, $zero, $zero
/* 92D24 80092124 8FBF0010 */  lw         $ra, 0x10($sp)
/* 92D28 80092128 03E00008 */  jr         $ra
/* 92D2C 8009212C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Troubador_perform
/* 92D30 80092130 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 92D34 80092134 3C05800E */  lui        $a1, %hi(combat_bytes)
/* 92D38 80092138 3C02800F */  lui        $v0, %hi(combatPointer)
/* 92D3C 8009213C 8C44F760 */  lw         $a0, %lo(combatPointer)($v0)
/* 92D40 80092140 24030019 */  addiu      $v1, $zero, 0x19
/* 92D44 80092144 AFBF0010 */  sw         $ra, 0x10($sp)
/* 92D48 80092148 A0A37C70 */  sb         $v1, %lo(combat_bytes)($a1)
/* 92D4C 8009214C 8C85002C */  lw         $a1, 0x2c($a0)
/* 92D50 80092150 0C01C915 */  jal        func_80072454
/* 92D54 80092154 24844E64 */   addiu     $a0, $a0, 0x4e64
/* 92D58 80092158 8FBF0010 */  lw         $ra, 0x10($sp)
/* 92D5C 8009215C 00001021 */  addu       $v0, $zero, $zero
/* 92D60 80092160 03E00008 */  jr         $ra
/* 92D64 80092164 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_layOnHands
/* 92D68 80092168 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 92D6C 8009216C AFB10014 */  sw         $s1, 0x14($sp)
/* 92D70 80092170 3C11800F */  lui        $s1, %hi(combatPointer)
/* 92D74 80092174 8E22F760 */  lw         $v0, %lo(combatPointer)($s1)
/* 92D78 80092178 AFBF0018 */  sw         $ra, 0x18($sp)
/* 92D7C 8009217C AFB00010 */  sw         $s0, 0x10($sp)
/* 92D80 80092180 8C50002C */  lw         $s0, 0x2c($v0)
/* 92D84 80092184 24050100 */  addiu      $a1, $zero, 0x100
/* 92D88 80092188 0C01A095 */  jal        CombatEnt_NAND_flags
/* 92D8C 8009218C 02002021 */   addu      $a0, $s0, $zero
/* 92D90 80092190 02002021 */  addu       $a0, $s0, $zero
/* 92D94 80092194 0C01A095 */  jal        CombatEnt_NAND_flags
/* 92D98 80092198 24050200 */   addiu     $a1, $zero, 0x200
/* 92D9C 8009219C 0C01BE28 */  jal        func_8006F8A0
/* 92DA0 800921A0 02002021 */   addu      $a0, $s0, $zero
/* 92DA4 800921A4 02002821 */  addu       $a1, $s0, $zero
/* 92DA8 800921A8 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 92DAC 800921AC 8E24F760 */  lw         $a0, -0x8a0($s1)
/* 92DB0 800921B0 24020009 */  addiu      $v0, $zero, 9
/* 92DB4 800921B4 A0627C70 */  sb         $v0, %lo(combat_bytes)($v1)
/* 92DB8 800921B8 0C01C9A6 */  jal        func_80072698
/* 92DBC 800921BC 24844E64 */   addiu     $a0, $a0, 0x4e64
/* 92DC0 800921C0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 92DC4 800921C4 8FB10014 */  lw         $s1, 0x14($sp)
/* 92DC8 800921C8 8FB00010 */  lw         $s0, 0x10($sp)
/* 92DCC 800921CC 00001021 */  addu       $v0, $zero, $zero
/* 92DD0 800921D0 03E00008 */  jr         $ra
/* 92DD4 800921D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combat_healWithHerbs
/* 92DD8 800921D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 92DDC 800921DC AFB10014 */  sw         $s1, 0x14($sp)
/* 92DE0 800921E0 3C11800F */  lui        $s1, %hi(combatPointer)
/* 92DE4 800921E4 8E22F760 */  lw         $v0, %lo(combatPointer)($s1)
/* 92DE8 800921E8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 92DEC 800921EC AFB00010 */  sw         $s0, 0x10($sp)
/* 92DF0 800921F0 8C50002C */  lw         $s0, 0x2c($v0)
/* 92DF4 800921F4 24050100 */  addiu      $a1, $zero, 0x100
/* 92DF8 800921F8 0C01A095 */  jal        CombatEnt_NAND_flags
/* 92DFC 800921FC 02002021 */   addu      $a0, $s0, $zero
/* 92E00 80092200 02002021 */  addu       $a0, $s0, $zero
/* 92E04 80092204 0C01A095 */  jal        CombatEnt_NAND_flags
/* 92E08 80092208 24050200 */   addiu     $a1, $zero, 0x200
/* 92E0C 8009220C 0C01BE2F */  jal        func_8006F8BC
/* 92E10 80092210 02002021 */   addu      $a0, $s0, $zero
/* 92E14 80092214 02002821 */  addu       $a1, $s0, $zero
/* 92E18 80092218 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 92E1C 8009221C 8E24F760 */  lw         $a0, -0x8a0($s1)
/* 92E20 80092220 24020009 */  addiu      $v0, $zero, 9
/* 92E24 80092224 A0627C70 */  sb         $v0, %lo(combat_bytes)($v1)
/* 92E28 80092228 0C01C9A6 */  jal        func_80072698
/* 92E2C 8009222C 24844E64 */   addiu     $a0, $a0, 0x4e64
/* 92E30 80092230 8FBF0018 */  lw         $ra, 0x18($sp)
/* 92E34 80092234 8FB10014 */  lw         $s1, 0x14($sp)
/* 92E38 80092238 8FB00010 */  lw         $s0, 0x10($sp)
/* 92E3C 8009223C 00001021 */  addu       $v0, $zero, $zero
/* 92E40 80092240 03E00008 */  jr         $ra
/* 92E44 80092244 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80092248
/* 92E48 80092248 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 92E4C 8009224C AFBF0010 */  sw         $ra, 0x10($sp)
/* 92E50 80092250 8C820000 */  lw         $v0, ($a0)
/* 92E54 80092254 8CA30000 */  lw         $v1, ($a1)
/* 92E58 80092258 8C440004 */  lw         $a0, 4($v0)
/* 92E5C 8009225C 0C0262BE */  jal        func_80098AF8
/* 92E60 80092260 8C650004 */   lw        $a1, 4($v1)
/* 92E64 80092264 8FBF0010 */  lw         $ra, 0x10($sp)
/* 92E68 80092268 03E00008 */  jr         $ra
/* 92E6C 8009226C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80092270
/* 92E70 80092270 8CC6002C */  lw         $a2, 0x2c($a2)
/* 92E74 80092274 00003821 */  addu       $a3, $zero, $zero
/* 92E78 80092278 90C20004 */  lbu        $v0, 4($a2)
/* 92E7C 8009227C 10400014 */  beqz       $v0, .L800922D0
/* 92E80 80092280 00004021 */   addu      $t0, $zero, $zero
/* 92E84 80092284 00871021 */  addu       $v0, $a0, $a3
.L80092288:
/* 92E88 80092288 90430000 */  lbu        $v1, ($v0)
/* 92E8C 8009228C 1060000A */  beqz       $v1, .L800922B8
/* 92E90 80092290 00071080 */   sll       $v0, $a3, 2
/* 92E94 80092294 8CC30000 */  lw         $v1, ($a2)
/* 92E98 80092298 00431021 */  addu       $v0, $v0, $v1
/* 92E9C 8009229C 8C420000 */  lw         $v0, ($v0)
/* 92EA0 800922A0 10400006 */  beqz       $v0, .L800922BC
/* 92EA4 800922A4 24E30001 */   addiu     $v1, $a3, 1
/* 92EA8 800922A8 ACA70004 */  sw         $a3, 4($a1)
/* 92EAC 800922AC ACA20000 */  sw         $v0, ($a1)
/* 92EB0 800922B0 24A50008 */  addiu      $a1, $a1, 8
/* 92EB4 800922B4 25080001 */  addiu      $t0, $t0, 1
.L800922B8:
/* 92EB8 800922B8 24E30001 */  addiu      $v1, $a3, 1
.L800922BC:
/* 92EBC 800922BC 90C20004 */  lbu        $v0, 4($a2)
/* 92EC0 800922C0 3067FFFF */  andi       $a3, $v1, 0xffff
/* 92EC4 800922C4 00E2102B */  sltu       $v0, $a3, $v0
/* 92EC8 800922C8 1440FFEF */  bnez       $v0, .L80092288
/* 92ECC 800922CC 00871021 */   addu      $v0, $a0, $a3
.L800922D0:
/* 92ED0 800922D0 03E00008 */  jr         $ra
/* 92ED4 800922D4 01001021 */   addu      $v0, $t0, $zero

glabel combat_layonhands_healherbs_perform
/* 92ED8 800922D8 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 92EDC 800922DC 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 92EE0 800922E0 27BDFD30 */  addiu      $sp, $sp, -0x2d0
/* 92EE4 800922E4 AFB202B0 */  sw         $s2, 0x2b0($sp)
/* 92EE8 800922E8 8FB202E0 */  lw         $s2, 0x2e0($sp)
/* 92EEC 800922EC 24080037 */  addiu      $t0, $zero, 0x37
/* 92EF0 800922F0 AFB502BC */  sw         $s5, 0x2bc($sp)
/* 92EF4 800922F4 0080A821 */  addu       $s5, $a0, $zero
/* 92EF8 800922F8 AFB402B8 */  sw         $s4, 0x2b8($sp)
/* 92EFC 800922FC 00A0A021 */  addu       $s4, $a1, $zero
/* 92F00 80092300 AFB302B4 */  sw         $s3, 0x2b4($sp)
/* 92F04 80092304 00C09821 */  addu       $s3, $a2, $zero
/* 92F08 80092308 AFB002A8 */  sw         $s0, 0x2a8($sp)
/* 92F0C 8009230C 00E08021 */  addu       $s0, $a3, $zero
/* 92F10 80092310 AFBF02CC */  sw         $ra, 0x2cc($sp)
/* 92F14 80092314 AFBE02C8 */  sw         $fp, 0x2c8($sp)
/* 92F18 80092318 AFB702C4 */  sw         $s7, 0x2c4($sp)
/* 92F1C 8009231C AFB602C0 */  sw         $s6, 0x2c0($sp)
/* 92F20 80092320 10600002 */  beqz       $v1, .L8009232C
/* 92F24 80092324 AFB102AC */   sw        $s1, 0x2ac($sp)
/* 92F28 80092328 2408005F */  addiu      $t0, $zero, 0x5f
.L8009232C:
/* 92F2C 8009232C 02A02021 */  addu       $a0, $s5, $zero
/* 92F30 80092330 2405003E */  addiu      $a1, $zero, 0x3e
/* 92F34 80092334 24060078 */  addiu      $a2, $zero, 0x78
/* 92F38 80092338 01003821 */  addu       $a3, $t0, $zero
/* 92F3C 8009233C AFA00010 */  sw         $zero, 0x10($sp)
/* 92F40 80092340 0C013521 */  jal        func_8004D484
/* 92F44 80092344 AFA00014 */   sw        $zero, 0x14($sp)
/* 92F48 80092348 24160078 */  addiu      $s6, $zero, 0x78
/* 92F4C 8009234C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 92F50 80092350 2404018C */  addiu      $a0, $zero, 0x18c
/* 92F54 80092354 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 92F58 80092358 3C02800E */  lui        $v0, %hi(D_800E1E98)
/* 92F5C 8009235C 24421E98 */  addiu      $v0, $v0, %lo(D_800E1E98)
/* 92F60 80092360 8C65002C */  lw         $a1, 0x2c($v1)
/* 92F64 80092364 27B10020 */  addiu      $s1, $sp, 0x20
/* 92F68 80092368 8CA50040 */  lw         $a1, 0x40($a1)
/* 92F6C 8009236C 240300E1 */  addiu      $v1, $zero, 0xe1
/* 92F70 80092370 AFA502A4 */  sw         $a1, 0x2a4($sp)
/* 92F74 80092374 AEA20078 */  sw         $v0, 0x78($s5)
/* 92F78 80092378 24020080 */  addiu      $v0, $zero, 0x80
/* 92F7C 8009237C A3A00020 */  sb         $zero, 0x20($sp)
/* 92F80 80092380 A2220001 */  sb         $v0, 1($s1)
/* 92F84 80092384 24020050 */  addiu      $v0, $zero, 0x50
/* 92F88 80092388 A2230002 */  sb         $v1, 2($s1)
/* 92F8C 8009238C A2230003 */  sb         $v1, 3($s1)
/* 92F90 80092390 A3A30060 */  sb         $v1, 0x60($sp)
/* 92F94 80092394 A3A20061 */  sb         $v0, 0x61($sp)
/* 92F98 80092398 A3A20062 */  sb         $v0, 0x62($sp)
/* 92F9C 8009239C 0C0290E2 */  jal        get_borg_8
/* 92FA0 800923A0 A3A30063 */   sb        $v1, 0x63($sp)
/* 92FA4 800923A4 00402021 */  addu       $a0, $v0, $zero
/* 92FA8 800923A8 0C0299C0 */  jal        borg8_free
/* 92FAC 800923AC 9457000A */   lhu       $s7, 0xa($v0)
/* 92FB0 800923B0 12000013 */  beqz       $s0, .L80092400
/* 92FB4 800923B4 3C04800E */   lui       $a0, %hi(D_800E1E70)
/* 92FB8 800923B8 24841E70 */  addiu      $a0, $a0, %lo(D_800E1E70)
/* 92FBC 800923BC 3C058009 */  lui        $a1, %hi(combat_layOnHands)
/* 92FC0 800923C0 24A52168 */  addiu      $a1, $a1, %lo(combat_layOnHands)
/* 92FC4 800923C4 00003021 */  addu       $a2, $zero, $zero
/* 92FC8 800923C8 00003821 */  addu       $a3, $zero, $zero
/* 92FCC 800923CC 24020185 */  addiu      $v0, $zero, 0x185
/* 92FD0 800923D0 AFB10010 */  sw         $s1, 0x10($sp)
/* 92FD4 800923D4 AFA20014 */  sw         $v0, 0x14($sp)
/* 92FD8 800923D8 0C0247A5 */  jal        char_func_icon
/* 92FDC 800923DC AFB70018 */   sw        $s7, 0x18($sp)
/* 92FE0 800923E0 00408021 */  addu       $s0, $v0, $zero
/* 92FE4 800923E4 02002021 */  addu       $a0, $s0, $zero
/* 92FE8 800923E8 0C0247FF */  jal        func_80091FFC
/* 92FEC 800923EC 24050078 */   addiu     $a1, $zero, 0x78
/* 92FF0 800923F0 0040B021 */  addu       $s6, $v0, $zero
/* 92FF4 800923F4 02A02021 */  addu       $a0, $s5, $zero
/* 92FF8 800923F8 0C013626 */  jal        func_8004D898
/* 92FFC 800923FC 02002821 */   addu      $a1, $s0, $zero
.L80092400:
/* 93000 80092400 12400013 */  beqz       $s2, .L80092450
/* 93004 80092404 3C04800E */   lui       $a0, %hi(D_800E1E80)
/* 93008 80092408 24841E80 */  addiu      $a0, $a0, %lo(D_800E1E80)
/* 9300C 8009240C 3C058009 */  lui        $a1, %hi(combat_healWithHerbs)
/* 93010 80092410 24A521D8 */  addiu      $a1, $a1, %lo(combat_healWithHerbs)
/* 93014 80092414 00003021 */  addu       $a2, $zero, $zero
/* 93018 80092418 00003821 */  addu       $a3, $zero, $zero
/* 9301C 8009241C 24020185 */  addiu      $v0, $zero, 0x185
/* 93020 80092420 AFB10010 */  sw         $s1, 0x10($sp)
/* 93024 80092424 AFA20014 */  sw         $v0, 0x14($sp)
/* 93028 80092428 0C0247A5 */  jal        char_func_icon
/* 9302C 8009242C AFB70018 */   sw        $s7, 0x18($sp)
/* 93030 80092430 00408021 */  addu       $s0, $v0, $zero
/* 93034 80092434 02002021 */  addu       $a0, $s0, $zero
/* 93038 80092438 0C0247FF */  jal        func_80091FFC
/* 9303C 8009243C 02C02821 */   addu      $a1, $s6, $zero
/* 93040 80092440 0040B021 */  addu       $s6, $v0, $zero
/* 93044 80092444 02A02021 */  addu       $a0, $s5, $zero
/* 93048 80092448 0C013626 */  jal        func_8004D898
/* 9304C 8009244C 02002821 */   addu      $a1, $s0, $zero
.L80092450:
/* 93050 80092450 12600013 */  beqz       $s3, .L800924A0
/* 93054 80092454 3C04800E */   lui       $a0, %hi(D_800E1E90)
/* 93058 80092458 24841E90 */  addiu      $a0, $a0, %lo(D_800E1E90)
/* 9305C 8009245C 3C058009 */  lui        $a1, %hi(Troubador_perform)
/* 93060 80092460 24A52130 */  addiu      $a1, $a1, %lo(Troubador_perform)
/* 93064 80092464 00003021 */  addu       $a2, $zero, $zero
/* 93068 80092468 00003821 */  addu       $a3, $zero, $zero
/* 9306C 8009246C 2402018C */  addiu      $v0, $zero, 0x18c
/* 93070 80092470 AFB10010 */  sw         $s1, 0x10($sp)
/* 93074 80092474 AFA20014 */  sw         $v0, 0x14($sp)
/* 93078 80092478 0C0247A5 */  jal        char_func_icon
/* 9307C 8009247C AFB70018 */   sw        $s7, 0x18($sp)
/* 93080 80092480 00408021 */  addu       $s0, $v0, $zero
/* 93084 80092484 02002021 */  addu       $a0, $s0, $zero
/* 93088 80092488 0C0247FF */  jal        func_80091FFC
/* 9308C 8009248C 02C02821 */   addu      $a1, $s6, $zero
/* 93090 80092490 0040B021 */  addu       $s6, $v0, $zero
/* 93094 80092494 02A02021 */  addu       $a0, $s5, $zero
/* 93098 80092498 0C013626 */  jal        func_8004D898
/* 9309C 8009249C 02002821 */   addu      $a1, $s0, $zero
.L800924A0:
/* 930A0 800924A0 02802021 */  addu       $a0, $s4, $zero
/* 930A4 800924A4 27B000A0 */  addiu      $s0, $sp, 0xa0
/* 930A8 800924A8 8FA602A4 */  lw         $a2, 0x2a4($sp)
/* 930AC 800924AC 0C02489C */  jal        func_80092270
/* 930B0 800924B0 02002821 */   addu      $a1, $s0, $zero
/* 930B4 800924B4 02002021 */  addu       $a0, $s0, $zero
/* 930B8 800924B8 0040A021 */  addu       $s4, $v0, $zero
/* 930BC 800924BC 02802821 */  addu       $a1, $s4, $zero
/* 930C0 800924C0 24060008 */  addiu      $a2, $zero, 8
/* 930C4 800924C4 3C078009 */  lui        $a3, %hi(func_80092248)
/* 930C8 800924C8 0C02F6A5 */  jal        quicksort_func
/* 930CC 800924CC 24E72248 */   addiu     $a3, $a3, %lo(func_80092248)
/* 930D0 800924D0 00009021 */  addu       $s2, $zero, $zero
/* 930D4 800924D4 12800021 */  beqz       $s4, .L8009255C
/* 930D8 800924D8 AFA002A0 */   sw        $zero, 0x2a0($sp)
/* 930DC 800924DC 27BE0060 */  addiu      $fp, $sp, 0x60
/* 930E0 800924E0 27B100A7 */  addiu      $s1, $sp, 0xa7
/* 930E4 800924E4 02009821 */  addu       $s3, $s0, $zero
.L800924E8:
/* 930E8 800924E8 8E700000 */  lw         $s0, ($s3)
/* 930EC 800924EC 52000017 */  beql       $s0, $zero, .L8009254C
/* 930F0 800924F0 26310008 */   addiu     $s1, $s1, 8
/* 930F4 800924F4 92040015 */  lbu        $a0, 0x15($s0)
/* 930F8 800924F8 0C013276 */  jal        get_school_icon
/* 930FC 800924FC 27A502A0 */   addiu     $a1, $sp, 0x2a0
/* 93100 80092500 3C028009 */  lui        $v0, %hi(func_800920D8)
/* 93104 80092504 244520D8 */  addiu      $a1, $v0, %lo(func_800920D8)
/* 93108 80092508 8FA202A0 */  lw         $v0, 0x2a0($sp)
/* 9310C 8009250C AFBE0010 */  sw         $fp, 0x10($sp)
/* 93110 80092510 AFB70018 */  sw         $s7, 0x18($sp)
/* 93114 80092514 AFA20014 */  sw         $v0, 0x14($sp)
/* 93118 80092518 92270000 */  lbu        $a3, ($s1)
/* 9311C 8009251C 8E040004 */  lw         $a0, 4($s0)
/* 93120 80092520 0C0247A5 */  jal        char_func_icon
/* 93124 80092524 00003021 */   addu      $a2, $zero, $zero
/* 93128 80092528 00408021 */  addu       $s0, $v0, $zero
/* 9312C 8009252C 02002021 */  addu       $a0, $s0, $zero
/* 93130 80092530 0C0247FF */  jal        func_80091FFC
/* 93134 80092534 02C02821 */   addu      $a1, $s6, $zero
/* 93138 80092538 0040B021 */  addu       $s6, $v0, $zero
/* 9313C 8009253C 02A02021 */  addu       $a0, $s5, $zero
/* 93140 80092540 0C013626 */  jal        func_8004D898
/* 93144 80092544 02002821 */   addu      $a1, $s0, $zero
/* 93148 80092548 26310008 */  addiu      $s1, $s1, 8
.L8009254C:
/* 9314C 8009254C 26520001 */  addiu      $s2, $s2, 1
/* 93150 80092550 0254102B */  sltu       $v0, $s2, $s4
/* 93154 80092554 1440FFE4 */  bnez       $v0, .L800924E8
/* 93158 80092558 26730008 */   addiu     $s3, $s3, 8
.L8009255C:
/* 9315C 8009255C 8EA4007C */  lw         $a0, 0x7c($s5)
/* 93160 80092560 0C02EFF2 */  jal        func_800BBFC8
/* 93164 80092564 24050003 */   addiu     $a1, $zero, 3
/* 93168 80092568 0C013786 */  jal        func_8004DE18
/* 9316C 8009256C 02A02021 */   addu      $a0, $s5, $zero
/* 93170 80092570 0C024819 */  jal        find_char_in_party
/* 93174 80092574 8FA402A4 */   lw        $a0, 0x2a4($sp)
/* 93178 80092578 2404007C */  addiu      $a0, $zero, 0x7c
/* 9317C 8009257C 0C026259 */  jal        passToMalloc
/* 93180 80092580 00409021 */   addu      $s2, $v0, $zero
/* 93184 80092584 240438D0 */  addiu      $a0, $zero, 0x38d0
/* 93188 80092588 0C0290E2 */  jal        get_borg_8
/* 9318C 8009258C 00408021 */   addu      $s0, $v0, $zero
/* 93190 80092590 02002021 */  addu       $a0, $s0, $zero
/* 93194 80092594 0C02E518 */  jal        borg8_widget
/* 93198 80092598 00402821 */   addu      $a1, $v0, $zero
/* 9319C 8009259C 2404007C */  addiu      $a0, $zero, 0x7c
/* 931A0 800925A0 0C026259 */  jal        passToMalloc
/* 931A4 800925A4 00408821 */   addu      $s1, $v0, $zero
/* 931A8 800925A8 240438CF */  addiu      $a0, $zero, 0x38cf
/* 931AC 800925AC 0C0290E2 */  jal        get_borg_8
/* 931B0 800925B0 00408021 */   addu      $s0, $v0, $zero
/* 931B4 800925B4 02002021 */  addu       $a0, $s0, $zero
/* 931B8 800925B8 0C02E518 */  jal        borg8_widget
/* 931BC 800925BC 00402821 */   addu      $a1, $v0, $zero
/* 931C0 800925C0 8E230078 */  lw         $v1, 0x78($s1)
/* 931C4 800925C4 00408021 */  addu       $s0, $v0, $zero
/* 931C8 800925C8 84640020 */  lh         $a0, 0x20($v1)
/* 931CC 800925CC 8C650024 */  lw         $a1, 0x24($v1)
/* 931D0 800925D0 00A0F809 */  jalr       $a1
/* 931D4 800925D4 02242021 */   addu      $a0, $s1, $a0
/* 931D8 800925D8 8EA3007C */  lw         $v1, 0x7c($s5)
/* 931DC 800925DC 02202021 */  addu       $a0, $s1, $zero
/* 931E0 800925E0 84650060 */  lh         $a1, 0x60($v1)
/* 931E4 800925E4 84660062 */  lh         $a2, 0x62($v1)
/* 931E8 800925E8 24A5FFF8 */  addiu      $a1, $a1, -8
/* 931EC 800925EC 00C23023 */  subu       $a2, $a2, $v0
/* 931F0 800925F0 0C02DD3F */  jal        set_widget_coords
/* 931F4 800925F4 24C6FFFE */   addiu     $a2, $a2, -2
/* 931F8 800925F8 8EA2007C */  lw         $v0, 0x7c($s5)
/* 931FC 800925FC 02002021 */  addu       $a0, $s0, $zero
/* 93200 80092600 84450060 */  lh         $a1, 0x60($v0)
/* 93204 80092604 8446006A */  lh         $a2, 0x6a($v0)
/* 93208 80092608 24A5FFF8 */  addiu      $a1, $a1, -8
/* 9320C 8009260C 0C02DD3F */  jal        set_widget_coords
/* 93210 80092610 24C60002 */   addiu     $a2, $a2, 2
/* 93214 80092614 0C026259 */  jal        passToMalloc
/* 93218 80092618 24040080 */   addiu     $a0, $zero, 0x80
/* 9321C 8009261C 00402021 */  addu       $a0, $v0, $zero
/* 93220 80092620 02203021 */  addu       $a2, $s1, $zero
/* 93224 80092624 8EA5007C */  lw         $a1, 0x7c($s5)
/* 93228 80092628 02003821 */  addu       $a3, $s0, $zero
/* 9322C 8009262C 0C02ED4C */  jal        func_800BB530
/* 93230 80092630 AFA00010 */   sw        $zero, 0x10($sp)
/* 93234 80092634 240500FF */  addiu      $a1, $zero, 0xff
/* 93238 80092638 240600FF */  addiu      $a2, $zero, 0xff
/* 9323C 8009263C 8C490078 */  lw         $t1, 0x78($v0)
/* 93240 80092640 240700FF */  addiu      $a3, $zero, 0xff
/* 93244 80092644 AEA200B0 */  sw         $v0, 0xb0($s5)
/* 93248 80092648 85240048 */  lh         $a0, 0x48($t1)
/* 9324C 8009264C 240300FF */  addiu      $v1, $zero, 0xff
/* 93250 80092650 AFA30010 */  sw         $v1, 0x10($sp)
/* 93254 80092654 8D28004C */  lw         $t0, 0x4c($t1)
/* 93258 80092658 0100F809 */  jalr       $t0
/* 9325C 8009265C 00442021 */   addu      $a0, $v0, $a0
/* 93260 80092660 8EA6007C */  lw         $a2, 0x7c($s5)
/* 93264 80092664 8CC30078 */  lw         $v1, 0x78($a2)
/* 93268 80092668 8EA500B0 */  lw         $a1, 0xb0($s5)
/* 9326C 8009266C 84640030 */  lh         $a0, 0x30($v1)
/* 93270 80092670 8C620034 */  lw         $v0, 0x34($v1)
/* 93274 80092674 0040F809 */  jalr       $v0
/* 93278 80092678 00C42021 */   addu      $a0, $a2, $a0
/* 9327C 8009267C 3C03800F */  lui        $v1, %hi(combatSkillValues)
/* 93280 80092680 24631D00 */  addiu      $v1, $v1, %lo(combatSkillValues)
/* 93284 80092684 02439021 */  addu       $s2, $s2, $v1
/* 93288 80092688 82440000 */  lb         $a0, ($s2)
/* 9328C 8009268C 2402FFFF */  addiu      $v0, $zero, -1
/* 93290 80092690 10820013 */  beq        $a0, $v0, .L800926E0
/* 93294 80092694 02A01021 */   addu      $v0, $s5, $zero
/* 93298 80092698 8EA5007C */  lw         $a1, 0x7c($s5)
/* 9329C 8009269C 8CB00040 */  lw         $s0, 0x40($a1)
/* 932A0 800926A0 96030020 */  lhu        $v1, 0x20($s0)
/* 932A4 800926A4 2463FFFF */  addiu      $v1, $v1, -1
/* 932A8 800926A8 0064102A */  slt        $v0, $v1, $a0
/* 932AC 800926AC 54400001 */  bnel       $v0, $zero, .L800926B4
/* 932B0 800926B0 00602021 */   addu      $a0, $v1, $zero
.L800926B4:
/* 932B4 800926B4 00041600 */  sll        $v0, $a0, 0x18
/* 932B8 800926B8 8CA30078 */  lw         $v1, 0x78($a1)
/* 932BC 800926BC 00022603 */  sra        $a0, $v0, 0x18
/* 932C0 800926C0 A604001E */  sh         $a0, 0x1e($s0)
/* 932C4 800926C4 84640028 */  lh         $a0, 0x28($v1)
/* 932C8 800926C8 8C62002C */  lw         $v0, 0x2c($v1)
/* 932CC 800926CC 0040F809 */  jalr       $v0
/* 932D0 800926D0 00A42021 */   addu      $a0, $a1, $a0
/* 932D4 800926D4 96030016 */  lhu        $v1, 0x16($s0)
/* 932D8 800926D8 A6030012 */  sh         $v1, 0x12($s0)
/* 932DC 800926DC 02A01021 */  addu       $v0, $s5, $zero
.L800926E0:
/* 932E0 800926E0 8FBF02CC */  lw         $ra, 0x2cc($sp)
/* 932E4 800926E4 8FBE02C8 */  lw         $fp, 0x2c8($sp)
/* 932E8 800926E8 8FB702C4 */  lw         $s7, 0x2c4($sp)
/* 932EC 800926EC 8FB602C0 */  lw         $s6, 0x2c0($sp)
/* 932F0 800926F0 8FB502BC */  lw         $s5, 0x2bc($sp)
/* 932F4 800926F4 8FB402B8 */  lw         $s4, 0x2b8($sp)
/* 932F8 800926F8 8FB302B4 */  lw         $s3, 0x2b4($sp)
/* 932FC 800926FC 8FB202B0 */  lw         $s2, 0x2b0($sp)
/* 93300 80092700 8FB102AC */  lw         $s1, 0x2ac($sp)
/* 93304 80092704 8FB002A8 */  lw         $s0, 0x2a8($sp)
/* 93308 80092708 03E00008 */  jr         $ra
/* 9330C 8009270C 27BD02D0 */   addiu     $sp, $sp, 0x2d0

glabel set_combatSkillValue
/* 93310 80092710 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 93314 80092714 AFB00010 */  sw         $s0, 0x10($sp)
/* 93318 80092718 00808021 */  addu       $s0, $a0, $zero
/* 9331C 8009271C 3C02800E */  lui        $v0, %hi(D_800E1E98)
/* 93320 80092720 24421E98 */  addiu      $v0, $v0, %lo(D_800E1E98)
/* 93324 80092724 AFBF0018 */  sw         $ra, 0x18($sp)
/* 93328 80092728 AFB10014 */  sw         $s1, 0x14($sp)
/* 9332C 8009272C 8E04007C */  lw         $a0, 0x7c($s0)
/* 93330 80092730 00A08821 */  addu       $s1, $a1, $zero
/* 93334 80092734 0C02F031 */  jal        func_800BC0C4
/* 93338 80092738 AE020078 */   sw        $v0, 0x78($s0)
/* 9333C 8009273C 8C430078 */  lw         $v1, 0x78($v0)
/* 93340 80092740 84640078 */  lh         $a0, 0x78($v1)
/* 93344 80092744 8C65007C */  lw         $a1, 0x7c($v1)
/* 93348 80092748 00A0F809 */  jalr       $a1
/* 9334C 8009274C 00442021 */   addu      $a0, $v0, $a0
/* 93350 80092750 3C03800F */  lui        $v1, %hi(combatPointer)
/* 93354 80092754 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 93358 80092758 8C45002C */  lw         $a1, 0x2c($v0)
/* 9335C 8009275C 0C024819 */  jal        find_char_in_party
/* 93360 80092760 8CA40040 */   lw        $a0, 0x40($a1)
/* 93364 80092764 8E04007C */  lw         $a0, 0x7c($s0)
/* 93368 80092768 3C03800F */  lui        $v1, %hi(combatSkillValues)
/* 9336C 8009276C 8C850040 */  lw         $a1, 0x40($a0)
/* 93370 80092770 24631D00 */  addiu      $v1, $v1, %lo(combatSkillValues)
/* 93374 80092774 90A4001F */  lbu        $a0, 0x1f($a1)
/* 93378 80092778 00431021 */  addu       $v0, $v0, $v1
/* 9337C 8009277C A0440000 */  sb         $a0, ($v0)
/* 93380 80092780 8E06007C */  lw         $a2, 0x7c($s0)
/* 93384 80092784 A200005C */  sb         $zero, 0x5c($s0)
/* 93388 80092788 8CC30078 */  lw         $v1, 0x78($a2)
/* 9338C 8009278C 8E0500B0 */  lw         $a1, 0xb0($s0)
/* 93390 80092790 84640038 */  lh         $a0, 0x38($v1)
/* 93394 80092794 8C62003C */  lw         $v0, 0x3c($v1)
/* 93398 80092798 0040F809 */  jalr       $v0
/* 9339C 8009279C 00C42021 */   addu      $a0, $a2, $a0
/* 933A0 800927A0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 933A4 800927A4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 933A8 800927A8 260500B0 */  addiu      $a1, $s0, 0xb0
/* 933AC 800927AC 24060006 */  addiu      $a2, $zero, 6
/* 933B0 800927B0 0C035867 */  jal        AllocFreeQueueItem
/* 933B4 800927B4 00003821 */   addu      $a3, $zero, $zero
/* 933B8 800927B8 02002021 */  addu       $a0, $s0, $zero
/* 933BC 800927BC 0C01357B */  jal        func_8004D5EC
/* 933C0 800927C0 02202821 */   addu      $a1, $s1, $zero
/* 933C4 800927C4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 933C8 800927C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 933CC 800927CC 8FB00010 */  lw         $s0, 0x10($sp)
/* 933D0 800927D0 03E00008 */  jr         $ra
/* 933D4 800927D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret0_800927d8
/* 933D8 800927D8 03E00008 */  jr         $ra
/* 933DC 800927DC 00001021 */   addu      $v0, $zero, $zero

glabel ret0_800927E0
/* 933E0 800927E0 03E00008 */  jr         $ra
/* 933E4 800927E4 00001021 */   addu      $v0, $zero, $zero
/* 933E8 800927E8 00000000 */  nop
/* 933EC 800927EC 00000000 */  nop
