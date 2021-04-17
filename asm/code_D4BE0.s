.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel lldiv_sub
/* D4BE0 800D3FE0 04810008 */  bgez       $a0, .L800D4004
/* D4BE4 800D3FE4 0000C021 */   addu      $t8, $zero, $zero
/* D4BE8 800D3FE8 2418FFFF */  addiu      $t8, $zero, -1
/* D4BEC 800D3FEC 00054823 */  negu       $t1, $a1
/* D4BF0 800D3FF0 00041823 */  negu       $v1, $a0
/* D4BF4 800D3FF4 0009102B */  sltu       $v0, $zero, $t1
/* D4BF8 800D3FF8 00624023 */  subu       $t0, $v1, $v0
/* D4BFC 800D3FFC 01002021 */  addu       $a0, $t0, $zero
/* D4C00 800D4000 01202821 */  addu       $a1, $t1, $zero
.L800D4004:
/* D4C04 800D4004 04C10009 */  bgez       $a2, .L800D402C
/* D4C08 800D4008 00E04821 */   addu      $t1, $a3, $zero
/* D4C0C 800D400C 0018C027 */  nor        $t8, $zero, $t8
/* D4C10 800D4010 00075823 */  negu       $t3, $a3
/* D4C14 800D4014 00061823 */  negu       $v1, $a2
/* D4C18 800D4018 000B102B */  sltu       $v0, $zero, $t3
/* D4C1C 800D401C 00625023 */  subu       $t2, $v1, $v0
/* D4C20 800D4020 01403021 */  addu       $a2, $t2, $zero
/* D4C24 800D4024 01603821 */  addu       $a3, $t3, $zero
/* D4C28 800D4028 00E04821 */  addu       $t1, $a3, $zero
.L800D402C:
/* D4C2C 800D402C 00C04021 */  addu       $t0, $a2, $zero
/* D4C30 800D4030 150000E8 */  bnez       $t0, .L800D43D4
/* D4C34 800D4034 00A05821 */   addu      $t3, $a1, $zero
/* D4C38 800D4038 0089102B */  sltu       $v0, $a0, $t1
/* D4C3C 800D403C 10400051 */  beqz       $v0, .L800D4184
/* D4C40 800D4040 3402FFFF */   ori       $v0, $zero, 0xffff
/* D4C44 800D4044 0049102B */  sltu       $v0, $v0, $t1
/* D4C48 800D4048 14400005 */  bnez       $v0, .L800D4060
/* D4C4C 800D404C 00E01821 */   addu      $v1, $a3, $zero
/* D4C50 800D4050 2D220100 */  sltiu      $v0, $t1, 0x100
/* D4C54 800D4054 38420001 */  xori       $v0, $v0, 1
/* D4C58 800D4058 0803501E */  j          .L800D4078
/* D4C5C 800D405C 000240C0 */   sll       $t0, $v0, 3
.L800D4060:
/* D4C60 800D4060 3C0200FF */  lui        $v0, 0xff
/* D4C64 800D4064 3442FFFF */  ori        $v0, $v0, 0xffff
/* D4C68 800D4068 0049102B */  sltu       $v0, $v0, $t1
/* D4C6C 800D406C 14400002 */  bnez       $v0, .L800D4078
/* D4C70 800D4070 24080018 */   addiu     $t0, $zero, 0x18
/* D4C74 800D4074 24080010 */  addiu      $t0, $zero, 0x10
.L800D4078:
/* D4C78 800D4078 3C02800E */  lui        $v0, %hi(lldiv_sub_array)
/* D4C7C 800D407C 24424BC0 */  addiu      $v0, $v0, %lo(lldiv_sub_array)
/* D4C80 800D4080 01031806 */  srlv       $v1, $v1, $t0
/* D4C84 800D4084 00621821 */  addu       $v1, $v1, $v0
/* D4C88 800D4088 90620000 */  lbu        $v0, ($v1)
/* D4C8C 800D408C 24050020 */  addiu      $a1, $zero, 0x20
/* D4C90 800D4090 00481021 */  addu       $v0, $v0, $t0
/* D4C94 800D4094 00A23023 */  subu       $a2, $a1, $v0
/* D4C98 800D4098 10C00006 */  beqz       $a2, .L800D40B4
/* D4C9C 800D409C 00C41804 */   sllv      $v1, $a0, $a2
/* D4CA0 800D40A0 00C94804 */  sllv       $t1, $t1, $a2
/* D4CA4 800D40A4 00A61023 */  subu       $v0, $a1, $a2
/* D4CA8 800D40A8 004B1006 */  srlv       $v0, $t3, $v0
/* D4CAC 800D40AC 00622025 */  or         $a0, $v1, $v0
/* D4CB0 800D40B0 00CB5804 */  sllv       $t3, $t3, $a2
.L800D40B4:
/* D4CB4 800D40B4 00093402 */  srl        $a2, $t1, 0x10
/* D4CB8 800D40B8 0086001B */  divu       $zero, $a0, $a2
/* D4CBC 800D40BC 14C00002 */  bnez       $a2, .L800D40C8
/* D4CC0 800D40C0 00000000 */   nop
/* D4CC4 800D40C4 0007000D */  break      7
.L800D40C8:
/* D4CC8 800D40C8 00003812 */   mflo      $a3
/* D4CCC 800D40CC 00001810 */  mfhi       $v1
/* D4CD0 800D40D0 3128FFFF */  andi       $t0, $t1, 0xffff
/* D4CD4 800D40D4 00000000 */  nop
/* D4CD8 800D40D8 00E80018 */  mult       $a3, $t0
/* D4CDC 800D40DC 000B1402 */  srl        $v0, $t3, 0x10
/* D4CE0 800D40E0 00031C00 */  sll        $v1, $v1, 0x10
/* D4CE4 800D40E4 00621825 */  or         $v1, $v1, $v0
/* D4CE8 800D40E8 00002812 */  mflo       $a1
/* D4CEC 800D40EC 0065102B */  sltu       $v0, $v1, $a1
/* D4CF0 800D40F0 5040000B */  beql       $v0, $zero, .L800D4120
/* D4CF4 800D40F4 00651823 */   subu      $v1, $v1, $a1
/* D4CF8 800D40F8 00691821 */  addu       $v1, $v1, $t1
/* D4CFC 800D40FC 0069102B */  sltu       $v0, $v1, $t1
/* D4D00 800D4100 14400006 */  bnez       $v0, .L800D411C
/* D4D04 800D4104 24E7FFFF */   addiu     $a3, $a3, -1
/* D4D08 800D4108 0065102B */  sltu       $v0, $v1, $a1
/* D4D0C 800D410C 50400004 */  beql       $v0, $zero, .L800D4120
/* D4D10 800D4110 00651823 */   subu      $v1, $v1, $a1
/* D4D14 800D4114 24E7FFFF */  addiu      $a3, $a3, -1
/* D4D18 800D4118 00691821 */  addu       $v1, $v1, $t1
.L800D411C:
/* D4D1C 800D411C 00651823 */  subu       $v1, $v1, $a1
.L800D4120:
/* D4D20 800D4120 0066001B */  divu       $zero, $v1, $a2
/* D4D24 800D4124 14C00002 */  bnez       $a2, .L800D4130
/* D4D28 800D4128 00000000 */   nop
/* D4D2C 800D412C 0007000D */  break      7
.L800D4130:
/* D4D30 800D4130 00002012 */   mflo      $a0
/* D4D34 800D4134 00001810 */  mfhi       $v1
/* D4D38 800D4138 00000000 */  nop
/* D4D3C 800D413C 00000000 */  nop
/* D4D40 800D4140 00880018 */  mult       $a0, $t0
/* D4D44 800D4144 3162FFFF */  andi       $v0, $t3, 0xffff
/* D4D48 800D4148 00031C00 */  sll        $v1, $v1, 0x10
/* D4D4C 800D414C 00621825 */  or         $v1, $v1, $v0
/* D4D50 800D4150 00002812 */  mflo       $a1
/* D4D54 800D4154 0065102B */  sltu       $v0, $v1, $a1
/* D4D58 800D4158 10400007 */  beqz       $v0, .L800D4178
/* D4D5C 800D415C 00691821 */   addu      $v1, $v1, $t1
/* D4D60 800D4160 0069102B */  sltu       $v0, $v1, $t1
/* D4D64 800D4164 14400004 */  bnez       $v0, .L800D4178
/* D4D68 800D4168 2484FFFF */   addiu     $a0, $a0, -1
/* D4D6C 800D416C 0065102B */  sltu       $v0, $v1, $a1
/* D4D70 800D4170 54400001 */  bnel       $v0, $zero, .L800D4178
/* D4D74 800D4174 2484FFFF */   addiu     $a0, $a0, -1
.L800D4178:
/* D4D78 800D4178 00071400 */  sll        $v0, $a3, 0x10
/* D4D7C 800D417C 08035165 */  j          .L800D4594
/* D4D80 800D4180 00443025 */   or        $a2, $v0, $a0
.L800D4184:
/* D4D84 800D4184 15200009 */  bnez       $t1, .L800D41AC
/* D4D88 800D4188 0049102B */   sltu      $v0, $v0, $t1
/* D4D8C 800D418C 24020001 */  addiu      $v0, $zero, 1
/* D4D90 800D4190 0048001B */  divu       $zero, $v0, $t0
/* D4D94 800D4194 15000002 */  bnez       $t0, .L800D41A0
/* D4D98 800D4198 00000000 */   nop
/* D4D9C 800D419C 0007000D */  break      7
.L800D41A0:
/* D4DA0 800D41A0 00004812 */   mflo      $t1
/* D4DA4 800D41A4 3402FFFF */  ori        $v0, $zero, 0xffff
/* D4DA8 800D41A8 0049102B */  sltu       $v0, $v0, $t1
.L800D41AC:
/* D4DAC 800D41AC 14400005 */  bnez       $v0, .L800D41C4
/* D4DB0 800D41B0 01201821 */   addu      $v1, $t1, $zero
/* D4DB4 800D41B4 2D220100 */  sltiu      $v0, $t1, 0x100
/* D4DB8 800D41B8 38420001 */  xori       $v0, $v0, 1
/* D4DBC 800D41BC 08035077 */  j          .L800D41DC
/* D4DC0 800D41C0 000230C0 */   sll       $a2, $v0, 3
.L800D41C4:
/* D4DC4 800D41C4 3C0200FF */  lui        $v0, 0xff
/* D4DC8 800D41C8 3442FFFF */  ori        $v0, $v0, 0xffff
/* D4DCC 800D41CC 0049102B */  sltu       $v0, $v0, $t1
/* D4DD0 800D41D0 14400002 */  bnez       $v0, .L800D41DC
/* D4DD4 800D41D4 24060018 */   addiu     $a2, $zero, 0x18
/* D4DD8 800D41D8 24060010 */  addiu      $a2, $zero, 0x10
.L800D41DC:
/* D4DDC 800D41DC 3C02800E */  lui        $v0, %hi(lldiv_sub_array)
/* D4DE0 800D41E0 24424BC0 */  addiu      $v0, $v0, %lo(lldiv_sub_array)
/* D4DE4 800D41E4 00C31806 */  srlv       $v1, $v1, $a2
/* D4DE8 800D41E8 00621821 */  addu       $v1, $v1, $v0
/* D4DEC 800D41EC 90620000 */  lbu        $v0, ($v1)
/* D4DF0 800D41F0 24030020 */  addiu      $v1, $zero, 0x20
/* D4DF4 800D41F4 00461021 */  addu       $v0, $v0, $a2
/* D4DF8 800D41F8 00623023 */  subu       $a2, $v1, $v0
/* D4DFC 800D41FC 14C00004 */  bnez       $a2, .L800D4210
/* D4E00 800D4200 00662823 */   subu      $a1, $v1, $a2
/* D4E04 800D4204 00892023 */  subu       $a0, $a0, $t1
/* D4E08 800D4208 080350C1 */  j          .L800D4304
/* D4E0C 800D420C 240A0001 */   addiu     $t2, $zero, 1
.L800D4210:
/* D4E10 800D4210 00C94804 */  sllv       $t1, $t1, $a2
/* D4E14 800D4214 00A43806 */  srlv       $a3, $a0, $a1
/* D4E18 800D4218 00C41804 */  sllv       $v1, $a0, $a2
/* D4E1C 800D421C 00AB1006 */  srlv       $v0, $t3, $a1
/* D4E20 800D4220 00622025 */  or         $a0, $v1, $v0
/* D4E24 800D4224 00CB5804 */  sllv       $t3, $t3, $a2
/* D4E28 800D4228 00093402 */  srl        $a2, $t1, 0x10
/* D4E2C 800D422C 00E6001B */  divu       $zero, $a3, $a2
/* D4E30 800D4230 14C00002 */  bnez       $a2, .L800D423C
/* D4E34 800D4234 00000000 */   nop
/* D4E38 800D4238 0007000D */  break      7
.L800D423C:
/* D4E3C 800D423C 00004012 */   mflo      $t0
/* D4E40 800D4240 00001810 */  mfhi       $v1
/* D4E44 800D4244 3125FFFF */  andi       $a1, $t1, 0xffff
/* D4E48 800D4248 00000000 */  nop
/* D4E4C 800D424C 01050018 */  mult       $t0, $a1
/* D4E50 800D4250 00041402 */  srl        $v0, $a0, 0x10
/* D4E54 800D4254 00031C00 */  sll        $v1, $v1, 0x10
/* D4E58 800D4258 00621825 */  or         $v1, $v1, $v0
/* D4E5C 800D425C 00003812 */  mflo       $a3
/* D4E60 800D4260 0067102B */  sltu       $v0, $v1, $a3
/* D4E64 800D4264 5040000B */  beql       $v0, $zero, .L800D4294
/* D4E68 800D4268 00671823 */   subu      $v1, $v1, $a3
/* D4E6C 800D426C 00691821 */  addu       $v1, $v1, $t1
/* D4E70 800D4270 0069102B */  sltu       $v0, $v1, $t1
/* D4E74 800D4274 14400006 */  bnez       $v0, .L800D4290
/* D4E78 800D4278 2508FFFF */   addiu     $t0, $t0, -1
/* D4E7C 800D427C 0067102B */  sltu       $v0, $v1, $a3
/* D4E80 800D4280 50400004 */  beql       $v0, $zero, .L800D4294
/* D4E84 800D4284 00671823 */   subu      $v1, $v1, $a3
/* D4E88 800D4288 2508FFFF */  addiu      $t0, $t0, -1
/* D4E8C 800D428C 00691821 */  addu       $v1, $v1, $t1
.L800D4290:
/* D4E90 800D4290 00671823 */  subu       $v1, $v1, $a3
.L800D4294:
/* D4E94 800D4294 0066001B */  divu       $zero, $v1, $a2
/* D4E98 800D4298 14C00002 */  bnez       $a2, .L800D42A4
/* D4E9C 800D429C 00000000 */   nop
/* D4EA0 800D42A0 0007000D */  break      7
.L800D42A4:
/* D4EA4 800D42A4 00003012 */   mflo      $a2
/* D4EA8 800D42A8 00001810 */  mfhi       $v1
/* D4EAC 800D42AC 00000000 */  nop
/* D4EB0 800D42B0 00000000 */  nop
/* D4EB4 800D42B4 00C50018 */  mult       $a2, $a1
/* D4EB8 800D42B8 3082FFFF */  andi       $v0, $a0, 0xffff
/* D4EBC 800D42BC 00031C00 */  sll        $v1, $v1, 0x10
/* D4EC0 800D42C0 00621825 */  or         $v1, $v1, $v0
/* D4EC4 800D42C4 00003812 */  mflo       $a3
/* D4EC8 800D42C8 0067102B */  sltu       $v0, $v1, $a3
/* D4ECC 800D42CC 1040000B */  beqz       $v0, .L800D42FC
/* D4ED0 800D42D0 00081400 */   sll       $v0, $t0, 0x10
/* D4ED4 800D42D4 00691821 */  addu       $v1, $v1, $t1
/* D4ED8 800D42D8 0069102B */  sltu       $v0, $v1, $t1
/* D4EDC 800D42DC 14400006 */  bnez       $v0, .L800D42F8
/* D4EE0 800D42E0 24C6FFFF */   addiu     $a2, $a2, -1
/* D4EE4 800D42E4 0067102B */  sltu       $v0, $v1, $a3
/* D4EE8 800D42E8 10400004 */  beqz       $v0, .L800D42FC
/* D4EEC 800D42EC 00081400 */   sll       $v0, $t0, 0x10
/* D4EF0 800D42F0 24C6FFFF */  addiu      $a2, $a2, -1
/* D4EF4 800D42F4 00691821 */  addu       $v1, $v1, $t1
.L800D42F8:
/* D4EF8 800D42F8 00081400 */  sll        $v0, $t0, 0x10
.L800D42FC:
/* D4EFC 800D42FC 00465025 */  or         $t2, $v0, $a2
/* D4F00 800D4300 00672023 */  subu       $a0, $v1, $a3
.L800D4304:
/* D4F04 800D4304 00093402 */  srl        $a2, $t1, 0x10
/* D4F08 800D4308 0086001B */  divu       $zero, $a0, $a2
/* D4F0C 800D430C 14C00002 */  bnez       $a2, .L800D4318
/* D4F10 800D4310 00000000 */   nop
/* D4F14 800D4314 0007000D */  break      7
.L800D4318:
/* D4F18 800D4318 00003812 */   mflo      $a3
/* D4F1C 800D431C 00001810 */  mfhi       $v1
/* D4F20 800D4320 3128FFFF */  andi       $t0, $t1, 0xffff
/* D4F24 800D4324 00000000 */  nop
/* D4F28 800D4328 00E80018 */  mult       $a3, $t0
/* D4F2C 800D432C 000B1402 */  srl        $v0, $t3, 0x10
/* D4F30 800D4330 00031C00 */  sll        $v1, $v1, 0x10
/* D4F34 800D4334 00621825 */  or         $v1, $v1, $v0
/* D4F38 800D4338 00002812 */  mflo       $a1
/* D4F3C 800D433C 0065102B */  sltu       $v0, $v1, $a1
/* D4F40 800D4340 5040000B */  beql       $v0, $zero, .L800D4370
/* D4F44 800D4344 00651823 */   subu      $v1, $v1, $a1
/* D4F48 800D4348 00691821 */  addu       $v1, $v1, $t1
/* D4F4C 800D434C 0069102B */  sltu       $v0, $v1, $t1
/* D4F50 800D4350 14400006 */  bnez       $v0, .L800D436C
/* D4F54 800D4354 24E7FFFF */   addiu     $a3, $a3, -1
/* D4F58 800D4358 0065102B */  sltu       $v0, $v1, $a1
/* D4F5C 800D435C 50400004 */  beql       $v0, $zero, .L800D4370
/* D4F60 800D4360 00651823 */   subu      $v1, $v1, $a1
/* D4F64 800D4364 24E7FFFF */  addiu      $a3, $a3, -1
/* D4F68 800D4368 00691821 */  addu       $v1, $v1, $t1
.L800D436C:
/* D4F6C 800D436C 00651823 */  subu       $v1, $v1, $a1
.L800D4370:
/* D4F70 800D4370 0066001B */  divu       $zero, $v1, $a2
/* D4F74 800D4374 14C00002 */  bnez       $a2, .L800D4380
/* D4F78 800D4378 00000000 */   nop
/* D4F7C 800D437C 0007000D */  break      7
.L800D4380:
/* D4F80 800D4380 00002012 */   mflo      $a0
/* D4F84 800D4384 00001810 */  mfhi       $v1
/* D4F88 800D4388 00000000 */  nop
/* D4F8C 800D438C 00000000 */  nop
/* D4F90 800D4390 00880018 */  mult       $a0, $t0
/* D4F94 800D4394 3162FFFF */  andi       $v0, $t3, 0xffff
/* D4F98 800D4398 00031C00 */  sll        $v1, $v1, 0x10
/* D4F9C 800D439C 00621825 */  or         $v1, $v1, $v0
/* D4FA0 800D43A0 00002812 */  mflo       $a1
/* D4FA4 800D43A4 0065102B */  sltu       $v0, $v1, $a1
/* D4FA8 800D43A8 10400007 */  beqz       $v0, .L800D43C8
/* D4FAC 800D43AC 00691821 */   addu      $v1, $v1, $t1
/* D4FB0 800D43B0 0069102B */  sltu       $v0, $v1, $t1
/* D4FB4 800D43B4 14400004 */  bnez       $v0, .L800D43C8
/* D4FB8 800D43B8 2484FFFF */   addiu     $a0, $a0, -1
/* D4FBC 800D43BC 0065102B */  sltu       $v0, $v1, $a1
/* D4FC0 800D43C0 54400001 */  bnel       $v0, $zero, .L800D43C8
/* D4FC4 800D43C4 2484FFFF */   addiu     $a0, $a0, -1
.L800D43C8:
/* D4FC8 800D43C8 00071400 */  sll        $v0, $a3, 0x10
/* D4FCC 800D43CC 08035166 */  j          .L800D4598
/* D4FD0 800D43D0 00443025 */   or        $a2, $v0, $a0
.L800D43D4:
/* D4FD4 800D43D4 0088102B */  sltu       $v0, $a0, $t0
/* D4FD8 800D43D8 10400003 */  beqz       $v0, .L800D43E8
/* D4FDC 800D43DC 3402FFFF */   ori       $v0, $zero, 0xffff
/* D4FE0 800D43E0 08035165 */  j          .L800D4594
/* D4FE4 800D43E4 00003021 */   addu      $a2, $zero, $zero
.L800D43E8:
/* D4FE8 800D43E8 0048102B */  sltu       $v0, $v0, $t0
/* D4FEC 800D43EC 14400005 */  bnez       $v0, .L800D4404
/* D4FF0 800D43F0 01001821 */   addu      $v1, $t0, $zero
/* D4FF4 800D43F4 2D020100 */  sltiu      $v0, $t0, 0x100
/* D4FF8 800D43F8 38420001 */  xori       $v0, $v0, 1
/* D4FFC 800D43FC 08035107 */  j          .L800D441C
/* D5000 800D4400 000230C0 */   sll       $a2, $v0, 3
.L800D4404:
/* D5004 800D4404 3C0200FF */  lui        $v0, 0xff
/* D5008 800D4408 3442FFFF */  ori        $v0, $v0, 0xffff
/* D500C 800D440C 0048102B */  sltu       $v0, $v0, $t0
/* D5010 800D4410 14400002 */  bnez       $v0, .L800D441C
/* D5014 800D4414 24060018 */   addiu     $a2, $zero, 0x18
/* D5018 800D4418 24060010 */  addiu      $a2, $zero, 0x10
.L800D441C:
/* D501C 800D441C 3C02800E */  lui        $v0, %hi(lldiv_sub_array)
/* D5020 800D4420 24424BC0 */  addiu      $v0, $v0, %lo(lldiv_sub_array)
/* D5024 800D4424 00C31806 */  srlv       $v1, $v1, $a2
/* D5028 800D4428 00621821 */  addu       $v1, $v1, $v0
/* D502C 800D442C 90620000 */  lbu        $v0, ($v1)
/* D5030 800D4430 24030020 */  addiu      $v1, $zero, 0x20
/* D5034 800D4434 00461021 */  addu       $v0, $v0, $a2
/* D5038 800D4438 00623023 */  subu       $a2, $v1, $v0
/* D503C 800D443C 14C00009 */  bnez       $a2, .L800D4464
/* D5040 800D4440 00662823 */   subu      $a1, $v1, $a2
/* D5044 800D4444 0104102B */  sltu       $v0, $t0, $a0
/* D5048 800D4448 14400052 */  bnez       $v0, .L800D4594
/* D504C 800D444C 24060001 */   addiu     $a2, $zero, 1
/* D5050 800D4450 0169102B */  sltu       $v0, $t3, $t1
/* D5054 800D4454 1440004F */  bnez       $v0, .L800D4594
/* D5058 800D4458 00003021 */   addu      $a2, $zero, $zero
/* D505C 800D445C 08035165 */  j          .L800D4594
/* D5060 800D4460 24060001 */   addiu     $a2, $zero, 1
.L800D4464:
/* D5064 800D4464 00C81804 */  sllv       $v1, $t0, $a2
/* D5068 800D4468 00A91006 */  srlv       $v0, $t1, $a1
/* D506C 800D446C 00624025 */  or         $t0, $v1, $v0
/* D5070 800D4470 00C94804 */  sllv       $t1, $t1, $a2
/* D5074 800D4474 00A43806 */  srlv       $a3, $a0, $a1
/* D5078 800D4478 00C41804 */  sllv       $v1, $a0, $a2
/* D507C 800D447C 00AB1006 */  srlv       $v0, $t3, $a1
/* D5080 800D4480 00622025 */  or         $a0, $v1, $v0
/* D5084 800D4484 00CB5804 */  sllv       $t3, $t3, $a2
/* D5088 800D4488 00083402 */  srl        $a2, $t0, 0x10
/* D508C 800D448C 00E6001B */  divu       $zero, $a3, $a2
/* D5090 800D4490 14C00002 */  bnez       $a2, .L800D449C
/* D5094 800D4494 00000000 */   nop
/* D5098 800D4498 0007000D */  break      7
.L800D449C:
/* D509C 800D449C 00005012 */   mflo      $t2
/* D50A0 800D44A0 00001810 */  mfhi       $v1
/* D50A4 800D44A4 3105FFFF */  andi       $a1, $t0, 0xffff
/* D50A8 800D44A8 00000000 */  nop
/* D50AC 800D44AC 01450018 */  mult       $t2, $a1
/* D50B0 800D44B0 00041402 */  srl        $v0, $a0, 0x10
/* D50B4 800D44B4 00031C00 */  sll        $v1, $v1, 0x10
/* D50B8 800D44B8 00621825 */  or         $v1, $v1, $v0
/* D50BC 800D44BC 00003812 */  mflo       $a3
/* D50C0 800D44C0 0067102B */  sltu       $v0, $v1, $a3
/* D50C4 800D44C4 5040000B */  beql       $v0, $zero, .L800D44F4
/* D50C8 800D44C8 00671823 */   subu      $v1, $v1, $a3
/* D50CC 800D44CC 00681821 */  addu       $v1, $v1, $t0
/* D50D0 800D44D0 0068102B */  sltu       $v0, $v1, $t0
/* D50D4 800D44D4 14400006 */  bnez       $v0, .L800D44F0
/* D50D8 800D44D8 254AFFFF */   addiu     $t2, $t2, -1
/* D50DC 800D44DC 0067102B */  sltu       $v0, $v1, $a3
/* D50E0 800D44E0 50400004 */  beql       $v0, $zero, .L800D44F4
/* D50E4 800D44E4 00671823 */   subu      $v1, $v1, $a3
/* D50E8 800D44E8 254AFFFF */  addiu      $t2, $t2, -1
/* D50EC 800D44EC 00681821 */  addu       $v1, $v1, $t0
.L800D44F0:
/* D50F0 800D44F0 00671823 */  subu       $v1, $v1, $a3
.L800D44F4:
/* D50F4 800D44F4 0066001B */  divu       $zero, $v1, $a2
/* D50F8 800D44F8 14C00002 */  bnez       $a2, .L800D4504
/* D50FC 800D44FC 00000000 */   nop
/* D5100 800D4500 0007000D */  break      7
.L800D4504:
/* D5104 800D4504 00003012 */   mflo      $a2
/* D5108 800D4508 00001810 */  mfhi       $v1
/* D510C 800D450C 00000000 */  nop
/* D5110 800D4510 00000000 */  nop
/* D5114 800D4514 00C50018 */  mult       $a2, $a1
/* D5118 800D4518 3082FFFF */  andi       $v0, $a0, 0xffff
/* D511C 800D451C 00031C00 */  sll        $v1, $v1, 0x10
/* D5120 800D4520 00621825 */  or         $v1, $v1, $v0
/* D5124 800D4524 00003812 */  mflo       $a3
/* D5128 800D4528 0067102B */  sltu       $v0, $v1, $a3
/* D512C 800D452C 1040000B */  beqz       $v0, .L800D455C
/* D5130 800D4530 000A1400 */   sll       $v0, $t2, 0x10
/* D5134 800D4534 00681821 */  addu       $v1, $v1, $t0
/* D5138 800D4538 0068102B */  sltu       $v0, $v1, $t0
/* D513C 800D453C 14400006 */  bnez       $v0, .L800D4558
/* D5140 800D4540 24C6FFFF */   addiu     $a2, $a2, -1
/* D5144 800D4544 0067102B */  sltu       $v0, $v1, $a3
/* D5148 800D4548 10400004 */  beqz       $v0, .L800D455C
/* D514C 800D454C 000A1400 */   sll       $v0, $t2, 0x10
/* D5150 800D4550 24C6FFFF */  addiu      $a2, $a2, -1
/* D5154 800D4554 00681821 */  addu       $v1, $v1, $t0
.L800D4558:
/* D5158 800D4558 000A1400 */  sll        $v0, $t2, 0x10
.L800D455C:
/* D515C 800D455C 00463025 */  or         $a2, $v0, $a2
/* D5160 800D4560 00672023 */  subu       $a0, $v1, $a3
/* D5164 800D4564 00C90019 */  multu      $a2, $t1
/* D5168 800D4568 00001810 */  mfhi       $v1
/* D516C 800D456C 0083102B */  sltu       $v0, $a0, $v1
/* D5170 800D4570 00004012 */  mflo       $t0
/* D5174 800D4574 54400007 */  bnel       $v0, $zero, .L800D4594
/* D5178 800D4578 24C6FFFF */   addiu     $a2, $a2, -1
/* D517C 800D457C 14640006 */  bne        $v1, $a0, .L800D4598
/* D5180 800D4580 00005021 */   addu      $t2, $zero, $zero
/* D5184 800D4584 0168102B */  sltu       $v0, $t3, $t0
/* D5188 800D4588 10400004 */  beqz       $v0, .L800D459C
/* D518C 800D458C 00C07821 */   addu      $t7, $a2, $zero
/* D5190 800D4590 24C6FFFF */  addiu      $a2, $a2, -1
.L800D4594:
/* D5194 800D4594 00005021 */  addu       $t2, $zero, $zero
.L800D4598:
/* D5198 800D4598 00C07821 */  addu       $t7, $a2, $zero
.L800D459C:
/* D519C 800D459C 01407021 */  addu       $t6, $t2, $zero
/* D51A0 800D45A0 01C01021 */  addu       $v0, $t6, $zero
/* D51A4 800D45A4 13000007 */  beqz       $t8, .L800D45C4
/* D51A8 800D45A8 01E01821 */   addu      $v1, $t7, $zero
/* D51AC 800D45AC 00036823 */  negu       $t5, $v1
/* D51B0 800D45B0 00021823 */  negu       $v1, $v0
/* D51B4 800D45B4 000D102B */  sltu       $v0, $zero, $t5
/* D51B8 800D45B8 00626023 */  subu       $t4, $v1, $v0
/* D51BC 800D45BC 01801021 */  addu       $v0, $t4, $zero
/* D51C0 800D45C0 01A01821 */  addu       $v1, $t5, $zero
.L800D45C4:
/* D51C4 800D45C4 03E00008 */  jr         $ra
/* D51C8 800D45C8 00000000 */   nop
/* D51CC 800D45CC 00000000 */  nop
