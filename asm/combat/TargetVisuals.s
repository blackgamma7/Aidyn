.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel combattargetvisuals_init
/* 93B00 80092F00 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 93B04 80092F04 AFB10014 */  sw         $s1, 0x14($sp)
/* 93B08 80092F08 3C11800F */  lui        $s1, %hi(CombatTargetVisuals_dat)
/* 93B0C 80092F0C AFB00010 */  sw         $s0, 0x10($sp)
/* 93B10 80092F10 26301D20 */  addiu      $s0, $s1, %lo(CombatTargetVisuals_dat)
/* 93B14 80092F14 02002021 */  addu       $a0, $s0, $zero
/* 93B18 80092F18 00002821 */  addu       $a1, $zero, $zero
/* 93B1C 80092F1C AFBF0018 */  sw         $ra, 0x18($sp)
/* 93B20 80092F20 0C026380 */  jal        Calloc
/* 93B24 80092F24 24060008 */   addiu     $a2, $zero, 8
/* 93B28 80092F28 3C03800F */  lui        $v1, %hi(combatPointer)
/* 93B2C 80092F2C 3C05800E */  lui        $a1, %hi(D_800E2040)
/* 93B30 80092F30 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 93B34 80092F34 24A52040 */  addiu      $a1, $a1, %lo(D_800E2040)
/* 93B38 80092F38 90430001 */  lbu        $v1, 1($v0)
/* 93B3C 80092F3C 24060080 */  addiu      $a2, $zero, 0x80
/* 93B40 80092F40 000320C0 */  sll        $a0, $v1, 3
/* 93B44 80092F44 0C025F9C */  jal        Malloc
/* 93B48 80092F48 AE030004 */   sw        $v1, 4($s0)
/* 93B4C 80092F4C 00402021 */  addu       $a0, $v0, $zero
/* 93B50 80092F50 8E060004 */  lw         $a2, 4($s0)
/* 93B54 80092F54 00002821 */  addu       $a1, $zero, $zero
/* 93B58 80092F58 AE221D20 */  sw         $v0, 0x1d20($s1)
/* 93B5C 80092F5C 0C026380 */  jal        Calloc
/* 93B60 80092F60 000630C0 */   sll       $a2, $a2, 3
/* 93B64 80092F64 8E030004 */  lw         $v1, 4($s0)
/* 93B68 80092F68 1060000C */  beqz       $v1, .L80092F9C
/* 93B6C 80092F6C 00002821 */   addu      $a1, $zero, $zero
/* 93B70 80092F70 02203021 */  addu       $a2, $s1, $zero
/* 93B74 80092F74 02002021 */  addu       $a0, $s0, $zero
.L80092F78:
/* 93B78 80092F78 8CC21D20 */  lw         $v0, 0x1d20($a2)
/* 93B7C 80092F7C 000518C0 */  sll        $v1, $a1, 3
/* 93B80 80092F80 00431021 */  addu       $v0, $v0, $v1
/* 93B84 80092F84 A0400006 */  sb         $zero, 6($v0)
/* 93B88 80092F88 8C830004 */  lw         $v1, 4($a0)
/* 93B8C 80092F8C 24A50001 */  addiu      $a1, $a1, 1
/* 93B90 80092F90 00A3182B */  sltu       $v1, $a1, $v1
/* 93B94 80092F94 1460FFF8 */  bnez       $v1, .L80092F78
/* 93B98 80092F98 AC400000 */   sw        $zero, ($v0)
.L80092F9C:
/* 93B9C 80092F9C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 93BA0 80092FA0 8FB10014 */  lw         $s1, 0x14($sp)
/* 93BA4 80092FA4 8FB00010 */  lw         $s0, 0x10($sp)
/* 93BA8 80092FA8 03E00008 */  jr         $ra
/* 93BAC 80092FAC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combattargetvisuals_func
/* 93BB0 80092FB0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 93BB4 80092FB4 AFBE0038 */  sw         $fp, 0x38($sp)
/* 93BB8 80092FB8 308400FF */  andi       $a0, $a0, 0xff
/* 93BBC 80092FBC AFBF003C */  sw         $ra, 0x3c($sp)
/* 93BC0 80092FC0 AFB70034 */  sw         $s7, 0x34($sp)
/* 93BC4 80092FC4 AFB60030 */  sw         $s6, 0x30($sp)
/* 93BC8 80092FC8 AFB5002C */  sw         $s5, 0x2c($sp)
/* 93BCC 80092FCC AFB40028 */  sw         $s4, 0x28($sp)
/* 93BD0 80092FD0 AFB30024 */  sw         $s3, 0x24($sp)
/* 93BD4 80092FD4 AFB20020 */  sw         $s2, 0x20($sp)
/* 93BD8 80092FD8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 93BDC 80092FDC AFB00018 */  sw         $s0, 0x18($sp)
/* 93BE0 80092FE0 F7B40040 */  sdc1       $f20, 0x40($sp)
/* 93BE4 80092FE4 14800005 */  bnez       $a0, .L80092FFC
/* 93BE8 80092FE8 00A0F021 */   addu      $fp, $a1, $zero
/* 93BEC 80092FEC 3C02800F */  lui        $v0, %hi(combatPointer)
/* 93BF0 80092FF0 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 93BF4 80092FF4 08024C05 */  j          .L80093014
/* 93BF8 80092FF8 24644EAC */   addiu     $a0, $v1, 0x4eac
.L80092FFC:
/* 93BFC 80092FFC 24020001 */  addiu      $v0, $zero, 1
/* 93C00 80093000 14820004 */  bne        $a0, $v0, .L80093014
/* 93C04 80093004 00002021 */   addu      $a0, $zero, $zero
/* 93C08 80093008 3C02800F */  lui        $v0, %hi(combatPointer)
/* 93C0C 8009300C 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 93C10 80093010 24644F54 */  addiu      $a0, $v1, 0x4f54
.L80093014:
/* 93C14 80093014 3C05800F */  lui        $a1, %hi(CombatTargetVisuals_dat)
/* 93C18 80093018 00009821 */  addu       $s3, $zero, $zero
/* 93C1C 8009301C 24A21D20 */  addiu      $v0, $a1, %lo(CombatTargetVisuals_dat)
/* 93C20 80093020 8C430004 */  lw         $v1, 4($v0)
/* 93C24 80093024 10600063 */  beqz       $v1, .L800931B4
/* 93C28 80093028 00A0B821 */   addu      $s7, $a1, $zero
/* 93C2C 8009302C 3C02800E */  lui        $v0, %hi(combat_PlayerData)
/* 93C30 80093030 24567CA4 */  addiu      $s6, $v0, %lo(combat_PlayerData)
/* 93C34 80093034 0080A821 */  addu       $s5, $a0, $zero
/* 93C38 80093038 0000A021 */  addu       $s4, $zero, $zero
.L8009303C:
/* 93C3C 8009303C 001310C0 */  sll        $v0, $s3, 3
/* 93C40 80093040 8CA31D20 */  lw         $v1, 0x1d20($a1)
/* 93C44 80093044 8EA40000 */  lw         $a0, ($s5)
/* 93C48 80093048 10800034 */  beqz       $a0, .L8009311C
/* 93C4C 8009304C 00628821 */   addu      $s1, $v1, $v0
/* 93C50 80093050 92220006 */  lbu        $v0, 6($s1)
/* 93C54 80093054 54400005 */  bnel       $v0, $zero, .L8009306C
/* 93C58 80093058 96220004 */   lhu       $v0, 4($s1)
/* 93C5C 8009305C 24020001 */  addiu      $v0, $zero, 1
/* 93C60 80093060 A2220006 */  sb         $v0, 6($s1)
/* 93C64 80093064 A6200004 */  sh         $zero, 4($s1)
/* 93C68 80093068 96220004 */  lhu        $v0, 4($s1)
.L8009306C:
/* 93C6C 8009306C 3C01800E */  lui        $at, %hi(D_800E2060)
/* 93C70 80093070 C4342060 */  lwc1       $f20, %lo(D_800E2060)($at)
/* 93C74 80093074 44826000 */  mtc1       $v0, $f12
/* 93C78 80093078 46806320 */  cvt.s.w    $f12, $f12
/* 93C7C 8009307C 46146302 */  mul.s      $f12, $f12, $f20
/* 93C80 80093080 0C03328C */  jal        __sinf
/* 93C84 80093084 00000000 */   nop
/* 93C88 80093088 44801000 */  mtc1       $zero, $f2
/* 93C8C 8009308C 4602003C */  c.lt.s     $f0, $f2
/* 93C90 80093090 00000000 */  nop
/* 93C94 80093094 45000008 */  bc1f       .L800930B8
/* 93C98 80093098 96220004 */   lhu       $v0, 4($s1)
/* 93C9C 8009309C 44826000 */  mtc1       $v0, $f12
/* 93CA0 800930A0 46806320 */  cvt.s.w    $f12, $f12
/* 93CA4 800930A4 46146302 */  mul.s      $f12, $f12, $f20
/* 93CA8 800930A8 0C03328C */  jal        __sinf
/* 93CAC 800930AC 00000000 */   nop
/* 93CB0 800930B0 08024C33 */  j          .L800930CC
/* 93CB4 800930B4 46000007 */   neg.s     $f0, $f0
.L800930B8:
/* 93CB8 800930B8 44826000 */  mtc1       $v0, $f12
/* 93CBC 800930BC 46806320 */  cvt.s.w    $f12, $f12
/* 93CC0 800930C0 46146302 */  mul.s      $f12, $f12, $f20
/* 93CC4 800930C4 0C03328C */  jal        __sinf
/* 93CC8 800930C8 00000000 */   nop
.L800930CC:
/* 93CCC 800930CC 3C03800F */  lui        $v1, %hi(combatPointer)
/* 93CD0 800930D0 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 93CD4 800930D4 00541021 */  addu       $v0, $v0, $s4
/* 93CD8 800930D8 8C4452D0 */  lw         $a0, 0x52d0($v0)
/* 93CDC 800930DC 90830020 */  lbu        $v1, 0x20($a0)
/* 93CE0 800930E0 00031880 */  sll        $v1, $v1, 2
/* 93CE4 800930E4 00761821 */  addu       $v1, $v1, $s6
/* 93CE8 800930E8 8C620000 */  lw         $v0, ($v1)
/* 93CEC 800930EC 10400007 */  beqz       $v0, .L8009310C
/* 93CF0 800930F0 AE220000 */   sw        $v0, ($s1)
/* 93CF4 800930F4 E7A00010 */  swc1       $f0, 0x10($sp)
/* 93CF8 800930F8 8E240000 */  lw         $a0, ($s1)
/* 93CFC 800930FC 44060000 */  mfc1       $a2, $f0
/* 93D00 80093100 3C053F80 */  lui        $a1, 0x3f80
/* 93D04 80093104 0C005CCC */  jal        func_80017330
/* 93D08 80093108 00C03821 */   addu      $a3, $a2, $zero
.L8009310C:
/* 93D0C 8009310C 96220004 */  lhu        $v0, 4($s1)
/* 93D10 80093110 005E1021 */  addu       $v0, $v0, $fp
/* 93D14 80093114 08024C65 */  j          .L80093194
/* 93D18 80093118 A6220004 */   sh        $v0, 4($s1)
.L8009311C:
/* 93D1C 8009311C 92230006 */  lbu        $v1, 6($s1)
/* 93D20 80093120 24020001 */  addiu      $v0, $zero, 1
/* 93D24 80093124 5462001C */  bnel       $v1, $v0, .L80093198
/* 93D28 80093128 26B50004 */   addiu     $s5, $s5, 4
/* 93D2C 8009312C 3C12800F */  lui        $s2, %hi(combatPointer)
/* 93D30 80093130 A2200006 */  sb         $zero, 6($s1)
/* 93D34 80093134 8E42F760 */  lw         $v0, %lo(combatPointer)($s2)
/* 93D38 80093138 00541021 */  addu       $v0, $v0, $s4
/* 93D3C 8009313C 8C5052D0 */  lw         $s0, 0x52d0($v0)
/* 93D40 80093140 52000015 */  beql       $s0, $zero, .L80093198
/* 93D44 80093144 26B50004 */   addiu     $s5, $s5, 4
/* 93D48 80093148 0C01A085 */  jal        CombatEnt_flag_6
/* 93D4C 8009314C 02002021 */   addu      $a0, $s0, $zero
/* 93D50 80093150 54400011 */  bnel       $v0, $zero, .L80093198
/* 93D54 80093154 26B50004 */   addiu     $s5, $s5, 4
/* 93D58 80093158 0C01DF1D */  jal        isDead
/* 93D5C 8009315C 8E040040 */   lw        $a0, 0x40($s0)
/* 93D60 80093160 5440000D */  bnel       $v0, $zero, .L80093198
/* 93D64 80093164 26B50004 */   addiu     $s5, $s5, 4
/* 93D68 80093168 8E42F760 */  lw         $v0, -0x8a0($s2)
/* 93D6C 8009316C 00541021 */  addu       $v0, $v0, $s4
/* 93D70 80093170 8C4452D0 */  lw         $a0, 0x52d0($v0)
/* 93D74 80093174 90830020 */  lbu        $v1, 0x20($a0)
/* 93D78 80093178 00031880 */  sll        $v1, $v1, 2
/* 93D7C 8009317C 00761821 */  addu       $v1, $v1, $s6
/* 93D80 80093180 8C640000 */  lw         $a0, ($v1)
/* 93D84 80093184 10800003 */  beqz       $a0, .L80093194
/* 93D88 80093188 AE240000 */   sw        $a0, ($s1)
/* 93D8C 8009318C 0C005CE2 */  jal        func_80017388
/* 93D90 80093190 00002821 */   addu      $a1, $zero, $zero
.L80093194:
/* 93D94 80093194 26B50004 */  addiu      $s5, $s5, 4
.L80093198:
/* 93D98 80093198 02E02821 */  addu       $a1, $s7, $zero
/* 93D9C 8009319C 24A21D20 */  addiu      $v0, $a1, 0x1d20
/* 93DA0 800931A0 8C430004 */  lw         $v1, 4($v0)
/* 93DA4 800931A4 26730001 */  addiu      $s3, $s3, 1
/* 93DA8 800931A8 0263182B */  sltu       $v1, $s3, $v1
/* 93DAC 800931AC 1460FFA3 */  bnez       $v1, .L8009303C
/* 93DB0 800931B0 26940004 */   addiu     $s4, $s4, 4
.L800931B4:
/* 93DB4 800931B4 8FBF003C */  lw         $ra, 0x3c($sp)
/* 93DB8 800931B8 8FBE0038 */  lw         $fp, 0x38($sp)
/* 93DBC 800931BC 8FB70034 */  lw         $s7, 0x34($sp)
/* 93DC0 800931C0 8FB60030 */  lw         $s6, 0x30($sp)
/* 93DC4 800931C4 8FB5002C */  lw         $s5, 0x2c($sp)
/* 93DC8 800931C8 8FB40028 */  lw         $s4, 0x28($sp)
/* 93DCC 800931CC 8FB30024 */  lw         $s3, 0x24($sp)
/* 93DD0 800931D0 8FB20020 */  lw         $s2, 0x20($sp)
/* 93DD4 800931D4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 93DD8 800931D8 8FB00018 */  lw         $s0, 0x18($sp)
/* 93DDC 800931DC D7B40040 */  ldc1       $f20, 0x40($sp)
/* 93DE0 800931E0 03E00008 */  jr         $ra
/* 93DE4 800931E4 27BD0048 */   addiu     $sp, $sp, 0x48

glabel combattargetvisuals_free_
/* 93DE8 800931E8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 93DEC 800931EC 00002821 */  addu       $a1, $zero, $zero
/* 93DF0 800931F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 93DF4 800931F4 3C10800F */  lui        $s0, %hi(CombatTargetVisuals_dat)
/* 93DF8 800931F8 AFB10014 */  sw         $s1, 0x14($sp)
/* 93DFC 800931FC 26111D20 */  addiu      $s1, $s0, %lo(CombatTargetVisuals_dat)
/* 93E00 80093200 AFBF0018 */  sw         $ra, 0x18($sp)
/* 93E04 80093204 8E260004 */  lw         $a2, 4($s1)
/* 93E08 80093208 8E041D20 */  lw         $a0, 0x1d20($s0)
/* 93E0C 8009320C 0C026380 */  jal        Calloc
/* 93E10 80093210 000630C0 */   sll       $a2, $a2, 3
/* 93E14 80093214 3C05800E */  lui        $a1, %hi(D_800E2040)
/* 93E18 80093218 24A52040 */  addiu      $a1, $a1, %lo(D_800E2040)
/* 93E1C 8009321C 8E041D20 */  lw         $a0, 0x1d20($s0)
/* 93E20 80093220 0C02600C */  jal        Free
/* 93E24 80093224 240600E6 */   addiu     $a2, $zero, 0xe6
/* 93E28 80093228 02202021 */  addu       $a0, $s1, $zero
/* 93E2C 8009322C 00002821 */  addu       $a1, $zero, $zero
/* 93E30 80093230 0C026380 */  jal        Calloc
/* 93E34 80093234 24060008 */   addiu     $a2, $zero, 8
/* 93E38 80093238 8FBF0018 */  lw         $ra, 0x18($sp)
/* 93E3C 8009323C 8FB10014 */  lw         $s1, 0x14($sp)
/* 93E40 80093240 8FB00010 */  lw         $s0, 0x10($sp)
/* 93E44 80093244 03E00008 */  jr         $ra
/* 93E48 80093248 27BD0020 */   addiu     $sp, $sp, 0x20
/* 93E4C 8009324C 00000000 */  nop
