.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel get_extra_font_color
/* B4CD0 800B40D0 308400FF */  andi       $a0, $a0, 0xff
/* B4CD4 800B40D4 3C02800F */  lui        $v0, %hi(extraFontColors)
/* B4CD8 800B40D8 244236AC */  addiu      $v0, $v0, %lo(extraFontColors)
/* B4CDC 800B40DC 00044040 */  sll        $t0, $a0, 1
/* B4CE0 800B40E0 01044021 */  addu       $t0, $t0, $a0
/* B4CE4 800B40E4 01021821 */  addu       $v1, $t0, $v0
/* B4CE8 800B40E8 90640000 */  lbu        $a0, ($v1)
/* B4CEC 800B40EC 00481821 */  addu       $v1, $v0, $t0
/* B4CF0 800B40F0 A0A40000 */  sb         $a0, ($a1)
/* B4CF4 800B40F4 90640001 */  lbu        $a0, 1($v1)
/* B4CF8 800B40F8 00601021 */  addu       $v0, $v1, $zero
/* B4CFC 800B40FC A0C40000 */  sb         $a0, ($a2)
/* B4D00 800B4100 90430002 */  lbu        $v1, 2($v0)
/* B4D04 800B4104 03E00008 */  jr         $ra
/* B4D08 800B4108 A0E30000 */   sb        $v1, ($a3)

glabel Init_font
/* B4D0C 800B410C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B4D10 800B4110 AFB00010 */  sw         $s0, 0x10($sp)
/* B4D14 800B4114 00808021 */  addu       $s0, $a0, $zero
/* B4D18 800B4118 AFB10014 */  sw         $s1, 0x14($sp)
/* B4D1C 800B411C 30B100FF */  andi       $s1, $a1, 0xff
/* B4D20 800B4120 00112040 */  sll        $a0, $s1, 1
/* B4D24 800B4124 00912021 */  addu       $a0, $a0, $s1
/* B4D28 800B4128 3C05800E */  lui        $a1, %hi(D_800E3C20)
/* B4D2C 800B412C 000420C0 */  sll        $a0, $a0, 3
/* B4D30 800B4130 24A53C20 */  addiu      $a1, $a1, %lo(D_800E3C20)
/* B4D34 800B4134 AFBF0018 */  sw         $ra, 0x18($sp)
/* B4D38 800B4138 0C025F9C */  jal        Malloc
/* B4D3C 800B413C 2406003F */   addiu     $a2, $zero, 0x3f
/* B4D40 800B4140 14400003 */  bnez       $v0, .L800B4150
/* B4D44 800B4144 AE020000 */   sw        $v0, ($s0)
/* B4D48 800B4148 0802D075 */  j          .L800B41D4
/* B4D4C 800B414C 00001021 */   addu      $v0, $zero, $zero
.L800B4150:
/* B4D50 800B4150 12200013 */  beqz       $s1, .L800B41A0
/* B4D54 800B4154 24020001 */   addiu     $v0, $zero, 1
/* B4D58 800B4158 00002821 */  addu       $a1, $zero, $zero
/* B4D5C 800B415C 02202021 */  addu       $a0, $s1, $zero
.L800B4160:
/* B4D60 800B4160 8E020000 */  lw         $v0, ($s0)
/* B4D64 800B4164 00A21021 */  addu       $v0, $a1, $v0
/* B4D68 800B4168 A0400014 */  sb         $zero, 0x14($v0)
/* B4D6C 800B416C 8E030000 */  lw         $v1, ($s0)
/* B4D70 800B4170 2484FFFF */  addiu      $a0, $a0, -1
/* B4D74 800B4174 AC400000 */  sw         $zero, ($v0)
/* B4D78 800B4178 AC400004 */  sw         $zero, 4($v0)
/* B4D7C 800B417C A440000A */  sh         $zero, 0xa($v0)
/* B4D80 800B4180 A4400008 */  sh         $zero, 8($v0)
/* B4D84 800B4184 A440000E */  sh         $zero, 0xe($v0)
/* B4D88 800B4188 A440000C */  sh         $zero, 0xc($v0)
/* B4D8C 800B418C 00A31821 */  addu       $v1, $a1, $v1
/* B4D90 800B4190 24A50018 */  addiu      $a1, $a1, 0x18
/* B4D94 800B4194 1480FFF2 */  bnez       $a0, .L800B4160
/* B4D98 800B4198 A0600015 */   sb        $zero, 0x15($v1)
/* B4D9C 800B419C 24020001 */  addiu      $v0, $zero, 1
.L800B41A0:
/* B4DA0 800B41A0 3C01800E */  lui        $at, %hi(D_800E3C38)
/* B4DA4 800B41A4 C4203C38 */  lwc1       $f0, %lo(D_800E3C38)($at)
/* B4DA8 800B41A8 240300E1 */  addiu      $v1, $zero, 0xe1
/* B4DAC 800B41AC A203001C */  sb         $v1, 0x1c($s0)
/* B4DB0 800B41B0 A203001D */  sb         $v1, 0x1d($s0)
/* B4DB4 800B41B4 A203001E */  sb         $v1, 0x1e($s0)
/* B4DB8 800B41B8 240300FF */  addiu      $v1, $zero, 0xff
/* B4DBC 800B41BC A203001F */  sb         $v1, 0x1f($s0)
/* B4DC0 800B41C0 A2000009 */  sb         $zero, 9($s0)
/* B4DC4 800B41C4 A211000A */  sb         $s1, 0xa($s0)
/* B4DC8 800B41C8 A2000008 */  sb         $zero, 8($s0)
/* B4DCC 800B41CC AE000004 */  sw         $zero, 4($s0)
/* B4DD0 800B41D0 E6000014 */  swc1       $f0, 0x14($s0)
.L800B41D4:
/* B4DD4 800B41D4 8FBF0018 */  lw         $ra, 0x18($sp)
/* B4DD8 800B41D8 8FB10014 */  lw         $s1, 0x14($sp)
/* B4DDC 800B41DC 8FB00010 */  lw         $s0, 0x10($sp)
/* B4DE0 800B41E0 03E00008 */  jr         $ra
/* B4DE4 800B41E4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel Ofunc_fontEngine
/* B4DE8 800B41E8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B4DEC 800B41EC AFB10014 */  sw         $s1, 0x14($sp)
/* B4DF0 800B41F0 00008821 */  addu       $s1, $zero, $zero
/* B4DF4 800B41F4 AFB20018 */  sw         $s2, 0x18($sp)
/* B4DF8 800B41F8 00809021 */  addu       $s2, $a0, $zero
/* B4DFC 800B41FC AFBF0020 */  sw         $ra, 0x20($sp)
/* B4E00 800B4200 AFB3001C */  sw         $s3, 0x1c($sp)
/* B4E04 800B4204 AFB00010 */  sw         $s0, 0x10($sp)
/* B4E08 800B4208 92420009 */  lbu        $v0, 9($s2)
/* B4E0C 800B420C 10400016 */  beqz       $v0, .L800B4268
/* B4E10 800B4210 3C13800E */   lui       $s3, 0x800e
/* B4E14 800B4214 00008021 */  addu       $s0, $zero, $zero
.L800B4218:
/* B4E18 800B4218 8E420000 */  lw         $v0, ($s2)
/* B4E1C 800B421C 02021021 */  addu       $v0, $s0, $v0
/* B4E20 800B4220 8C440004 */  lw         $a0, 4($v0)
/* B4E24 800B4224 5080000C */  beql       $a0, $zero, .L800B4258
/* B4E28 800B4228 92420009 */   lbu       $v0, 9($s2)
/* B4E2C 800B422C 0C0290BD */  jal        borg8_free_ofunc
/* B4E30 800B4230 00000000 */   nop
/* B4E34 800B4234 8E420000 */  lw         $v0, ($s2)
/* B4E38 800B4238 26653C20 */  addiu      $a1, $s3, 0x3c20
/* B4E3C 800B423C 02021021 */  addu       $v0, $s0, $v0
/* B4E40 800B4240 8C440010 */  lw         $a0, 0x10($v0)
/* B4E44 800B4244 24060072 */  addiu      $a2, $zero, 0x72
/* B4E48 800B4248 AC400004 */  sw         $zero, 4($v0)
/* B4E4C 800B424C 0C02600C */  jal        Free
/* B4E50 800B4250 AC400000 */   sw        $zero, ($v0)
/* B4E54 800B4254 92420009 */  lbu        $v0, 9($s2)
.L800B4258:
/* B4E58 800B4258 26310001 */  addiu      $s1, $s1, 1
/* B4E5C 800B425C 0222102A */  slt        $v0, $s1, $v0
/* B4E60 800B4260 1440FFED */  bnez       $v0, .L800B4218
/* B4E64 800B4264 26100018 */   addiu     $s0, $s0, 0x18
.L800B4268:
/* B4E68 800B4268 26653C20 */  addiu      $a1, $s3, 0x3c20
/* B4E6C 800B426C 8E440000 */  lw         $a0, ($s2)
/* B4E70 800B4270 0C02600C */  jal        Free
/* B4E74 800B4274 24060075 */   addiu     $a2, $zero, 0x75
/* B4E78 800B4278 8FBF0020 */  lw         $ra, 0x20($sp)
/* B4E7C 800B427C 8FB3001C */  lw         $s3, 0x1c($sp)
/* B4E80 800B4280 8FB20018 */  lw         $s2, 0x18($sp)
/* B4E84 800B4284 8FB10014 */  lw         $s1, 0x14($sp)
/* B4E88 800B4288 8FB00010 */  lw         $s0, 0x10($sp)
/* B4E8C 800B428C 03E00008 */  jr         $ra
/* B4E90 800B4290 27BD0028 */   addiu     $sp, $sp, 0x28

glabel load_font_face
/* B4E94 800B4294 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B4E98 800B4298 AFB1001C */  sw         $s1, 0x1c($sp)
/* B4E9C 800B429C 00808821 */  addu       $s1, $a0, $zero
/* B4EA0 800B42A0 AFB40028 */  sw         $s4, 0x28($sp)
/* B4EA4 800B42A4 00A0A021 */  addu       $s4, $a1, $zero
/* B4EA8 800B42A8 AFB30024 */  sw         $s3, 0x24($sp)
/* B4EAC 800B42AC 30D300FF */  andi       $s3, $a2, 0xff
/* B4EB0 800B42B0 AFB20020 */  sw         $s2, 0x20($sp)
/* B4EB4 800B42B4 AFBF002C */  sw         $ra, 0x2c($sp)
/* B4EB8 800B42B8 AFB00018 */  sw         $s0, 0x18($sp)
/* B4EBC 800B42BC 92240009 */  lbu        $a0, 9($s1)
/* B4EC0 800B42C0 9222000A */  lbu        $v0, 0xa($s1)
/* B4EC4 800B42C4 308300FF */  andi       $v1, $a0, 0xff
/* B4EC8 800B42C8 0062102B */  sltu       $v0, $v1, $v0
/* B4ECC 800B42CC 10400040 */  beqz       $v0, .L800B43D0
/* B4ED0 800B42D0 30F200FF */   andi      $s2, $a3, 0xff
/* B4ED4 800B42D4 50600001 */  beql       $v1, $zero, .L800B42DC
/* B4ED8 800B42D8 A2240008 */   sb        $a0, 8($s1)
.L800B42DC:
/* B4EDC 800B42DC 92220009 */  lbu        $v0, 9($s1)
/* B4EE0 800B42E0 02802021 */  addu       $a0, $s4, $zero
/* B4EE4 800B42E4 24420001 */  addiu      $v0, $v0, 1
/* B4EE8 800B42E8 A2220009 */  sb         $v0, 9($s1)
/* B4EEC 800B42EC 304300FF */  andi       $v1, $v0, 0xff
/* B4EF0 800B42F0 00031040 */  sll        $v0, $v1, 1
/* B4EF4 800B42F4 00431021 */  addu       $v0, $v0, $v1
/* B4EF8 800B42F8 000210C0 */  sll        $v0, $v0, 3
/* B4EFC 800B42FC 8E230000 */  lw         $v1, ($s1)
/* B4F00 800B4300 2442FFE8 */  addiu      $v0, $v0, -0x18
/* B4F04 800B4304 0C0290E2 */  jal        get_borg_8
/* B4F08 800B4308 00628021 */   addu      $s0, $v1, $v0
/* B4F0C 800B430C 10400030 */  beqz       $v0, .L800B43D0
/* B4F10 800B4310 AE220004 */   sw        $v0, 4($s1)
/* B4F14 800B4314 AE020004 */  sw         $v0, 4($s0)
/* B4F18 800B4318 8E240004 */  lw         $a0, 4($s1)
/* B4F1C 800B431C 9482000A */  lhu        $v0, 0xa($a0)
/* B4F20 800B4320 A602000C */  sh         $v0, 0xc($s0)
/* B4F24 800B4324 3043FFFF */  andi       $v1, $v0, 0xffff
/* B4F28 800B4328 0072001A */  div        $zero, $v1, $s2
/* B4F2C 800B432C 9482000C */  lhu        $v0, 0xc($a0)
/* B4F30 800B4330 AE140000 */  sw         $s4, ($s0)
/* B4F34 800B4334 A602000E */  sh         $v0, 0xe($s0)
/* B4F38 800B4338 00001812 */  mflo       $v1
/* B4F3C 800B433C 52400001 */  beql       $s2, $zero, .L800B4344
/* B4F40 800B4340 000001CD */   break     0, 7
.L800B4344:
/* B4F44 800B4344 3042FFFF */   andi      $v0, $v0, 0xffff
/* B4F48 800B4348 0053001A */  div        $zero, $v0, $s3
/* B4F4C 800B434C A6030008 */  sh         $v1, 8($s0)
/* B4F50 800B4350 00001012 */  mflo       $v0
/* B4F54 800B4354 52600001 */  beql       $s3, $zero, .L800B435C
/* B4F58 800B4358 000001CD */   break     0, 7
.L800B435C:
/* B4F5C 800B435C 00122040 */   sll       $a0, $s2, 1
/* B4F60 800B4360 02640018 */  mult       $s3, $a0
/* B4F64 800B4364 3C05800E */  lui        $a1, %hi(D_800E3C20)
/* B4F68 800B4368 24A53C20 */  addiu      $a1, $a1, %lo(D_800E3C20)
/* B4F6C 800B436C 240600A0 */  addiu      $a2, $zero, 0xa0
/* B4F70 800B4370 00002012 */  mflo       $a0
/* B4F74 800B4374 0C025F9C */  jal        Malloc
/* B4F78 800B4378 A602000A */   sh        $v0, 0xa($s0)
/* B4F7C 800B437C A2130014 */  sb         $s3, 0x14($s0)
/* B4F80 800B4380 A2120015 */  sb         $s2, 0x15($s0)
/* B4F84 800B4384 8E250004 */  lw         $a1, 4($s1)
/* B4F88 800B4388 02202021 */  addu       $a0, $s1, $zero
/* B4F8C 800B438C AE020010 */  sw         $v0, 0x10($s0)
/* B4F90 800B4390 AFB20010 */  sw         $s2, 0x10($sp)
/* B4F94 800B4394 8E060010 */  lw         $a2, 0x10($s0)
/* B4F98 800B4398 0C02D533 */  jal        func_800B54CC
/* B4F9C 800B439C 02603821 */   addu      $a3, $s3, $zero
/* B4FA0 800B43A0 96030008 */  lhu        $v1, 8($s0)
/* B4FA4 800B43A4 A623000C */  sh         $v1, 0xc($s1)
/* B4FA8 800B43A8 9602000A */  lhu        $v0, 0xa($s0)
/* B4FAC 800B43AC A622000E */  sh         $v0, 0xe($s1)
/* B4FB0 800B43B0 9603000C */  lhu        $v1, 0xc($s0)
/* B4FB4 800B43B4 A6230010 */  sh         $v1, 0x10($s1)
/* B4FB8 800B43B8 9604000E */  lhu        $a0, 0xe($s0)
/* B4FBC 800B43BC 8E030010 */  lw         $v1, 0x10($s0)
/* B4FC0 800B43C0 24020001 */  addiu      $v0, $zero, 1
/* B4FC4 800B43C4 AE230018 */  sw         $v1, 0x18($s1)
/* B4FC8 800B43C8 0802D0F5 */  j          .L800B43D4
/* B4FCC 800B43CC A6240012 */   sh        $a0, 0x12($s1)
.L800B43D0:
/* B4FD0 800B43D0 00001021 */  addu       $v0, $zero, $zero
.L800B43D4:
/* B4FD4 800B43D4 8FBF002C */  lw         $ra, 0x2c($sp)
/* B4FD8 800B43D8 8FB40028 */  lw         $s4, 0x28($sp)
/* B4FDC 800B43DC 8FB30024 */  lw         $s3, 0x24($sp)
/* B4FE0 800B43E0 8FB20020 */  lw         $s2, 0x20($sp)
/* B4FE4 800B43E4 8FB1001C */  lw         $s1, 0x1c($sp)
/* B4FE8 800B43E8 8FB00018 */  lw         $s0, 0x18($sp)
/* B4FEC 800B43EC 03E00008 */  jr         $ra
/* B4FF0 800B43F0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel font_func
/* B4FF4 800B43F4 00803821 */  addu       $a3, $a0, $zero
/* B4FF8 800B43F8 90E20009 */  lbu        $v0, 9($a3)
/* B4FFC 800B43FC 10400035 */  beqz       $v0, .L800B44D4
/* B5000 800B4400 00003021 */   addu      $a2, $zero, $zero
/* B5004 800B4404 8CE80000 */  lw         $t0, ($a3)
/* B5008 800B4408 00402021 */  addu       $a0, $v0, $zero
/* B500C 800B440C 01001821 */  addu       $v1, $t0, $zero
.L800B4410:
/* B5010 800B4410 8C620000 */  lw         $v0, ($v1)
/* B5014 800B4414 5445002C */  bnel       $v0, $a1, .L800B44C8
/* B5018 800B4418 24C60001 */   addiu     $a2, $a2, 1
/* B501C 800B441C A0E60008 */  sb         $a2, 8($a3)
/* B5020 800B4420 30C300FF */  andi       $v1, $a2, 0xff
/* B5024 800B4424 00031040 */  sll        $v0, $v1, 1
/* B5028 800B4428 00431021 */  addu       $v0, $v0, $v1
/* B502C 800B442C 000210C0 */  sll        $v0, $v0, 3
/* B5030 800B4430 00481021 */  addu       $v0, $v0, $t0
/* B5034 800B4434 30C400FF */  andi       $a0, $a2, 0xff
/* B5038 800B4438 94430008 */  lhu        $v1, 8($v0)
/* B503C 800B443C 00041040 */  sll        $v0, $a0, 1
/* B5040 800B4440 00441021 */  addu       $v0, $v0, $a0
/* B5044 800B4444 000210C0 */  sll        $v0, $v0, 3
/* B5048 800B4448 00481021 */  addu       $v0, $v0, $t0
/* B504C 800B444C 00802821 */  addu       $a1, $a0, $zero
/* B5050 800B4450 A4E3000C */  sh         $v1, 0xc($a3)
/* B5054 800B4454 9443000A */  lhu        $v1, 0xa($v0)
/* B5058 800B4458 00041040 */  sll        $v0, $a0, 1
/* B505C 800B445C 00441021 */  addu       $v0, $v0, $a0
/* B5060 800B4460 000210C0 */  sll        $v0, $v0, 3
/* B5064 800B4464 00481021 */  addu       $v0, $v0, $t0
/* B5068 800B4468 00052040 */  sll        $a0, $a1, 1
/* B506C 800B446C 00852021 */  addu       $a0, $a0, $a1
/* B5070 800B4470 000420C0 */  sll        $a0, $a0, 3
/* B5074 800B4474 00882021 */  addu       $a0, $a0, $t0
/* B5078 800B4478 A4E3000E */  sh         $v1, 0xe($a3)
/* B507C 800B447C 9443000C */  lhu        $v1, 0xc($v0)
/* B5080 800B4480 00A01021 */  addu       $v0, $a1, $zero
/* B5084 800B4484 A4E30010 */  sh         $v1, 0x10($a3)
/* B5088 800B4488 00021840 */  sll        $v1, $v0, 1
/* B508C 800B448C 00621821 */  addu       $v1, $v1, $v0
/* B5090 800B4490 000318C0 */  sll        $v1, $v1, 3
/* B5094 800B4494 00681821 */  addu       $v1, $v1, $t0
/* B5098 800B4498 00051040 */  sll        $v0, $a1, 1
/* B509C 800B449C 00451021 */  addu       $v0, $v0, $a1
/* B50A0 800B44A0 000210C0 */  sll        $v0, $v0, 3
/* B50A4 800B44A4 00481021 */  addu       $v0, $v0, $t0
/* B50A8 800B44A8 8C850004 */  lw         $a1, 4($a0)
/* B50AC 800B44AC 9466000E */  lhu        $a2, 0xe($v1)
/* B50B0 800B44B0 8C440010 */  lw         $a0, 0x10($v0)
/* B50B4 800B44B4 24020001 */  addiu      $v0, $zero, 1
/* B50B8 800B44B8 ACE50004 */  sw         $a1, 4($a3)
/* B50BC 800B44BC ACE40018 */  sw         $a0, 0x18($a3)
/* B50C0 800B44C0 03E00008 */  jr         $ra
/* B50C4 800B44C4 A4E60012 */   sh        $a2, 0x12($a3)
.L800B44C8:
/* B50C8 800B44C8 00C4102A */  slt        $v0, $a2, $a0
/* B50CC 800B44CC 1440FFD0 */  bnez       $v0, .L800B4410
/* B50D0 800B44D0 24630018 */   addiu     $v1, $v1, 0x18
.L800B44D4:
/* B50D4 800B44D4 03E00008 */  jr         $ra
/* B50D8 800B44D8 00001021 */   addu      $v0, $zero, $zero

glabel func_800B44DC
/* B50DC 800B44DC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B50E0 800B44E0 8FA20038 */  lw         $v0, 0x38($sp)
/* B50E4 800B44E4 AFBF0020 */  sw         $ra, 0x20($sp)
/* B50E8 800B44E8 C4800014 */  lwc1       $f0, 0x14($a0)
/* B50EC 800B44EC AFA20010 */  sw         $v0, 0x10($sp)
/* B50F0 800B44F0 E7A00014 */  swc1       $f0, 0x14($sp)
/* B50F4 800B44F4 0C02D142 */  jal        func_800B4508
/* B50F8 800B44F8 E7A00018 */   swc1      $f0, 0x18($sp)
/* B50FC 800B44FC 8FBF0020 */  lw         $ra, 0x20($sp)
/* B5100 800B4500 03E00008 */  jr         $ra
/* B5104 800B4504 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B4508
/* B5108 800B4508 27BDFF80 */  addiu      $sp, $sp, -0x80
/* B510C 800B450C AFB60060 */  sw         $s6, 0x60($sp)
/* B5110 800B4510 8FB60090 */  lw         $s6, 0x90($sp)
/* B5114 800B4514 F7B60078 */  sdc1       $f22, 0x78($sp)
/* B5118 800B4518 C7B60094 */  lwc1       $f22, 0x94($sp)
/* B511C 800B451C F7B40070 */  sdc1       $f20, 0x70($sp)
/* B5120 800B4520 C7B40098 */  lwc1       $f20, 0x98($sp)
/* B5124 800B4524 AFB40058 */  sw         $s4, 0x58($sp)
/* B5128 800B4528 00E0A021 */  addu       $s4, $a3, $zero
/* B512C 800B452C AFB1004C */  sw         $s1, 0x4c($sp)
/* B5130 800B4530 00808821 */  addu       $s1, $a0, $zero
/* B5134 800B4534 AFBF006C */  sw         $ra, 0x6c($sp)
/* B5138 800B4538 AFBE0068 */  sw         $fp, 0x68($sp)
/* B513C 800B453C AFB70064 */  sw         $s7, 0x64($sp)
/* B5140 800B4540 AFB5005C */  sw         $s5, 0x5c($sp)
/* B5144 800B4544 AFB30054 */  sw         $s3, 0x54($sp)
/* B5148 800B4548 AFB20050 */  sw         $s2, 0x50($sp)
/* B514C 800B454C AFB00048 */  sw         $s0, 0x48($sp)
/* B5150 800B4550 AFB4003C */  sw         $s4, 0x3c($sp)
/* B5154 800B4554 9622000C */  lhu        $v0, 0xc($s1)
/* B5158 800B4558 00A0F021 */  addu       $fp, $a1, $zero
/* B515C 800B455C AFA20040 */  sw         $v0, 0x40($sp)
/* B5160 800B4560 8E220004 */  lw         $v0, 4($s1)
/* B5164 800B4564 10400067 */  beqz       $v0, .L800B4704
/* B5168 800B4568 9637000E */   lhu       $s7, 0xe($s1)
/* B516C 800B456C 90C20000 */  lbu        $v0, ($a2)
/* B5170 800B4570 10400064 */  beqz       $v0, .L800B4704
/* B5174 800B4574 00C09021 */   addu      $s2, $a2, $zero
/* B5178 800B4578 92470000 */  lbu        $a3, ($s2)
.L800B457C:
/* B517C 800B457C 2402000A */  addiu      $v0, $zero, 0xa
/* B5180 800B4580 30E600FF */  andi       $a2, $a3, 0xff
/* B5184 800B4584 14C2000A */  bne        $a2, $v0, .L800B45B0
/* B5188 800B4588 3C03800F */   lui       $v1, 0x800f
/* B518C 800B458C 9622000E */  lhu        $v0, 0xe($s1)
/* B5190 800B4590 44820000 */  mtc1       $v0, $f0
/* B5194 800B4594 46800020 */  cvt.s.w    $f0, $f0
/* B5198 800B4598 46140002 */  mul.s      $f0, $f0, $f20
/* B519C 800B459C 8FB4003C */  lw         $s4, 0x3c($sp)
/* B51A0 800B45A0 4600008D */  trunc.w.s  $f2, $f0
/* B51A4 800B45A4 44021000 */  mfc1       $v0, $f2
/* B51A8 800B45A8 0802D1BD */  j          .L800B46F4
/* B51AC 800B45AC 02C2B021 */   addu      $s6, $s6, $v0
.L800B45B0:
/* B51B0 800B45B0 92420000 */  lbu        $v0, ($s2)
/* B51B4 800B45B4 24633640 */  addiu      $v1, $v1, 0x3640
/* B51B8 800B45B8 2442FFE0 */  addiu      $v0, $v0, -0x20
/* B51BC 800B45BC 00432821 */  addu       $a1, $v0, $v1
/* B51C0 800B45C0 90A30000 */  lbu        $v1, ($a1)
/* B51C4 800B45C4 2402002B */  addiu      $v0, $zero, 0x2b
/* B51C8 800B45C8 5062004B */  beql       $v1, $v0, .L800B46F8
/* B51CC 800B45CC 26520001 */   addiu     $s2, $s2, 1
/* B51D0 800B45D0 92230008 */  lbu        $v1, 8($s1)
/* B51D4 800B45D4 8E240000 */  lw         $a0, ($s1)
/* B51D8 800B45D8 90B00000 */  lbu        $s0, ($a1)
/* B51DC 800B45DC 00031040 */  sll        $v0, $v1, 1
/* B51E0 800B45E0 00431021 */  addu       $v0, $v0, $v1
/* B51E4 800B45E4 000210C0 */  sll        $v0, $v0, 3
/* B51E8 800B45E8 00441021 */  addu       $v0, $v0, $a0
/* B51EC 800B45EC 90430014 */  lbu        $v1, 0x14($v0)
/* B51F0 800B45F0 0203001A */  div        $zero, $s0, $v1
/* B51F4 800B45F4 00009812 */  mflo       $s3
/* B51F8 800B45F8 0000A810 */  mfhi       $s5
/* B51FC 800B45FC 50600001 */  beql       $v1, $zero, .L800B4604
/* B5200 800B4600 000001CD */   break     0, 7
.L800B4604:
/* B5204 800B4604 50600001 */   beql      $v1, $zero, .L800B460C
/* B5208 800B4608 000001CD */   break     0, 7
.L800B460C:
/* B520C 800B460C 9222001C */   lbu       $v0, 0x1c($s1)
/* B5210 800B4610 9223001D */  lbu        $v1, 0x1d($s1)
/* B5214 800B4614 9224001E */  lbu        $a0, 0x1e($s1)
/* B5218 800B4618 A3A20038 */  sb         $v0, 0x38($sp)
/* B521C 800B461C 2CC2007F */  sltiu      $v0, $a2, 0x7f
/* B5220 800B4620 A3A30039 */  sb         $v1, 0x39($sp)
/* B5224 800B4624 14400007 */  bnez       $v0, .L800B4644
/* B5228 800B4628 A3A4003A */   sb        $a0, 0x3a($sp)
/* B522C 800B462C 24E4FF81 */  addiu      $a0, $a3, -0x7f
/* B5230 800B4630 308400FF */  andi       $a0, $a0, 0xff
/* B5234 800B4634 27A50038 */  addiu      $a1, $sp, 0x38
/* B5238 800B4638 27A60039 */  addiu      $a2, $sp, 0x39
/* B523C 800B463C 0C02D034 */  jal        get_extra_font_color
/* B5240 800B4640 27A7003A */   addiu     $a3, $sp, 0x3a
.L800B4644:
/* B5244 800B4644 8FA20040 */  lw         $v0, 0x40($sp)
/* B5248 800B4648 02620018 */  mult       $s3, $v0
/* B524C 800B464C 44940000 */  mtc1       $s4, $f0
/* B5250 800B4650 46800020 */  cvt.s.w    $f0, $f0
/* B5254 800B4654 44961000 */  mtc1       $s6, $f2
/* B5258 800B4658 468010A0 */  cvt.s.w    $f2, $f2
/* B525C 800B465C 44060000 */  mfc1       $a2, $f0
/* B5260 800B4660 44071000 */  mfc1       $a3, $f2
/* B5264 800B4664 00006012 */  mflo       $t4
/* B5268 800B4668 8FC40000 */  lw         $a0, ($fp)
/* B526C 800B466C 8E250004 */  lw         $a1, 4($s1)
/* B5270 800B4670 02B70018 */  mult       $s5, $s7
/* B5274 800B4674 93AA003A */  lbu        $t2, 0x3a($sp)
/* B5278 800B4678 3182FFFF */  andi       $v0, $t4, 0xffff
/* B527C 800B467C AFA20010 */  sw         $v0, 0x10($sp)
/* B5280 800B4680 00101040 */  sll        $v0, $s0, 1
/* B5284 800B4684 00004812 */  mflo       $t1
/* B5288 800B4688 3123FFFF */  andi       $v1, $t1, 0xffff
/* B528C 800B468C 01374821 */  addu       $t1, $t1, $s7
/* B5290 800B4690 AFA30014 */  sw         $v1, 0x14($sp)
/* B5294 800B4694 8E280018 */  lw         $t0, 0x18($s1)
/* B5298 800B4698 922B001F */  lbu        $t3, 0x1f($s1)
/* B529C 800B469C 00481021 */  addu       $v0, $v0, $t0
/* B52A0 800B46A0 94430000 */  lhu        $v1, ($v0)
/* B52A4 800B46A4 93A80038 */  lbu        $t0, 0x38($sp)
/* B52A8 800B46A8 93A20039 */  lbu        $v0, 0x39($sp)
/* B52AC 800B46AC 3129FFFF */  andi       $t1, $t1, 0xffff
/* B52B0 800B46B0 AFA9001C */  sw         $t1, 0x1c($sp)
/* B52B4 800B46B4 E7B60020 */  swc1       $f22, 0x20($sp)
/* B52B8 800B46B8 E7B40024 */  swc1       $f20, 0x24($sp)
/* B52BC 800B46BC AFAA0030 */  sw         $t2, 0x30($sp)
/* B52C0 800B46C0 AFAB0034 */  sw         $t3, 0x34($sp)
/* B52C4 800B46C4 006C1821 */  addu       $v1, $v1, $t4
/* B52C8 800B46C8 3063FFFF */  andi       $v1, $v1, 0xffff
/* B52CC 800B46CC AFA80028 */  sw         $t0, 0x28($sp)
/* B52D0 800B46D0 AFA2002C */  sw         $v0, 0x2c($sp)
/* B52D4 800B46D4 0C029188 */  jal        N64BorgImageDraw
/* B52D8 800B46D8 AFA30018 */   sw        $v1, 0x18($sp)
/* B52DC 800B46DC AFC20000 */  sw         $v0, ($fp)
/* B52E0 800B46E0 92450000 */  lbu        $a1, ($s2)
/* B52E4 800B46E4 4406B000 */  mfc1       $a2, $f22
/* B52E8 800B46E8 0C02D486 */  jal        func_800B5218
/* B52EC 800B46EC 02202021 */   addu      $a0, $s1, $zero
/* B52F0 800B46F0 0282A021 */  addu       $s4, $s4, $v0
.L800B46F4:
/* B52F4 800B46F4 26520001 */  addiu      $s2, $s2, 1
.L800B46F8:
/* B52F8 800B46F8 92420000 */  lbu        $v0, ($s2)
/* B52FC 800B46FC 5440FF9F */  bnel       $v0, $zero, .L800B457C
/* B5300 800B4700 92470000 */   lbu       $a3, ($s2)
.L800B4704:
/* B5304 800B4704 02801021 */  addu       $v0, $s4, $zero
/* B5308 800B4708 8FBF006C */  lw         $ra, 0x6c($sp)
/* B530C 800B470C 8FBE0068 */  lw         $fp, 0x68($sp)
/* B5310 800B4710 8FB70064 */  lw         $s7, 0x64($sp)
/* B5314 800B4714 8FB60060 */  lw         $s6, 0x60($sp)
/* B5318 800B4718 8FB5005C */  lw         $s5, 0x5c($sp)
/* B531C 800B471C 8FB40058 */  lw         $s4, 0x58($sp)
/* B5320 800B4720 8FB30054 */  lw         $s3, 0x54($sp)
/* B5324 800B4724 8FB20050 */  lw         $s2, 0x50($sp)
/* B5328 800B4728 8FB1004C */  lw         $s1, 0x4c($sp)
/* B532C 800B472C 8FB00048 */  lw         $s0, 0x48($sp)
/* B5330 800B4730 D7B60078 */  ldc1       $f22, 0x78($sp)
/* B5334 800B4734 D7B40070 */  ldc1       $f20, 0x70($sp)
/* B5338 800B4738 03E00008 */  jr         $ra
/* B533C 800B473C 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_800B4740
/* B5340 800B4740 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* B5344 800B4744 8FA20048 */  lw         $v0, 0x48($sp)
/* B5348 800B4748 8FA3004C */  lw         $v1, 0x4c($sp)
/* B534C 800B474C 8FA80050 */  lw         $t0, 0x50($sp)
/* B5350 800B4750 8FA90054 */  lw         $t1, 0x54($sp)
/* B5354 800B4754 8FAA0058 */  lw         $t2, 0x58($sp)
/* B5358 800B4758 AFBF0030 */  sw         $ra, 0x30($sp)
/* B535C 800B475C C4800014 */  lwc1       $f0, 0x14($a0)
/* B5360 800B4760 AFA20010 */  sw         $v0, 0x10($sp)
/* B5364 800B4764 AFA30014 */  sw         $v1, 0x14($sp)
/* B5368 800B4768 AFA80018 */  sw         $t0, 0x18($sp)
/* B536C 800B476C AFA9001C */  sw         $t1, 0x1c($sp)
/* B5370 800B4770 AFAA0020 */  sw         $t2, 0x20($sp)
/* B5374 800B4774 E7A00024 */  swc1       $f0, 0x24($sp)
/* B5378 800B4778 0C02D1E3 */  jal        passto_display_text_func_A
/* B537C 800B477C E7A00028 */   swc1      $f0, 0x28($sp)
/* B5380 800B4780 8FBF0030 */  lw         $ra, 0x30($sp)
/* B5384 800B4784 03E00008 */  jr         $ra
/* B5388 800B4788 27BD0038 */   addiu     $sp, $sp, 0x38

glabel passto_display_text_func_A
/* B538C 800B478C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* B5390 800B4790 8FAA0050 */  lw         $t2, 0x50($sp)
/* B5394 800B4794 8FAB0058 */  lw         $t3, 0x58($sp)
/* B5398 800B4798 8FAC0060 */  lw         $t4, 0x60($sp)
/* B539C 800B479C C7A00064 */  lwc1       $f0, 0x64($sp)
/* B53A0 800B47A0 C7A20068 */  lwc1       $f2, 0x68($sp)
/* B53A4 800B47A4 8FA80054 */  lw         $t0, 0x54($sp)
/* B53A8 800B47A8 87A30056 */  lh         $v1, 0x56($sp)
/* B53AC 800B47AC 8FA9005C */  lw         $t1, 0x5c($sp)
/* B53B0 800B47B0 87A2005E */  lh         $v0, 0x5e($sp)
/* B53B4 800B47B4 AFBF0038 */  sw         $ra, 0x38($sp)
/* B53B8 800B47B8 AFAA0010 */  sw         $t2, 0x10($sp)
/* B53BC 800B47BC AFA30014 */  sw         $v1, 0x14($sp)
/* B53C0 800B47C0 AFA20018 */  sw         $v0, 0x18($sp)
/* B53C4 800B47C4 AFA8001C */  sw         $t0, 0x1c($sp)
/* B53C8 800B47C8 AFAB0020 */  sw         $t3, 0x20($sp)
/* B53CC 800B47CC AFA90024 */  sw         $t1, 0x24($sp)
/* B53D0 800B47D0 AFAC0028 */  sw         $t4, 0x28($sp)
/* B53D4 800B47D4 E7A0002C */  swc1       $f0, 0x2c($sp)
/* B53D8 800B47D8 0C02D212 */  jal        display_text_func_A
/* B53DC 800B47DC E7A20030 */   swc1      $f2, 0x30($sp)
/* B53E0 800B47E0 8FBF0038 */  lw         $ra, 0x38($sp)
/* B53E4 800B47E4 03E00008 */  jr         $ra
/* B53E8 800B47E8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel Ofunc_display_text
/* B53EC 800B47EC 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* B53F0 800B47F0 8FA80050 */  lw         $t0, 0x50($sp)
/* B53F4 800B47F4 8FA9005C */  lw         $t1, 0x5c($sp)
/* B53F8 800B47F8 8FAA0060 */  lw         $t2, 0x60($sp)
/* B53FC 800B47FC 8FAB0064 */  lw         $t3, 0x64($sp)
/* B5400 800B4800 8FAC0068 */  lw         $t4, 0x68($sp)
/* B5404 800B4804 87A20056 */  lh         $v0, 0x56($sp)
/* B5408 800B4808 87A3005A */  lh         $v1, 0x5a($sp)
/* B540C 800B480C AFBF0038 */  sw         $ra, 0x38($sp)
/* B5410 800B4810 C4800014 */  lwc1       $f0, 0x14($a0)
/* B5414 800B4814 AFA80010 */  sw         $t0, 0x10($sp)
/* B5418 800B4818 AFA20014 */  sw         $v0, 0x14($sp)
/* B541C 800B481C AFA30018 */  sw         $v1, 0x18($sp)
/* B5420 800B4820 AFA9001C */  sw         $t1, 0x1c($sp)
/* B5424 800B4824 AFAA0020 */  sw         $t2, 0x20($sp)
/* B5428 800B4828 AFAB0024 */  sw         $t3, 0x24($sp)
/* B542C 800B482C AFAC0028 */  sw         $t4, 0x28($sp)
/* B5430 800B4830 E7A0002C */  swc1       $f0, 0x2c($sp)
/* B5434 800B4834 0C02D212 */  jal        display_text_func_A
/* B5438 800B4838 E7A00030 */   swc1      $f0, 0x30($sp)
/* B543C 800B483C 8FBF0038 */  lw         $ra, 0x38($sp)
/* B5440 800B4840 03E00008 */  jr         $ra
/* B5444 800B4844 27BD0040 */   addiu     $sp, $sp, 0x40

glabel display_text_func_A
/* B5448 800B4848 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* B544C 800B484C AFB40078 */  sw         $s4, 0x78($sp)
/* B5450 800B4850 8FB400B0 */  lw         $s4, 0xb0($sp)
/* B5454 800B4854 F7B40090 */  sdc1       $f20, 0x90($sp)
/* B5458 800B4858 C7B400CC */  lwc1       $f20, 0xcc($sp)
/* B545C 800B485C F7B60098 */  sdc1       $f22, 0x98($sp)
/* B5460 800B4860 C7B600D0 */  lwc1       $f22, 0xd0($sp)
/* B5464 800B4864 87A300B6 */  lh         $v1, 0xb6($sp)
/* B5468 800B4868 87A200BA */  lh         $v0, 0xba($sp)
/* B546C 800B486C AFB30074 */  sw         $s3, 0x74($sp)
/* B5470 800B4870 00E09821 */  addu       $s3, $a3, $zero
/* B5474 800B4874 AFBE0088 */  sw         $fp, 0x88($sp)
/* B5478 800B4878 0080F021 */  addu       $fp, $a0, $zero
/* B547C 800B487C AFBF008C */  sw         $ra, 0x8c($sp)
/* B5480 800B4880 AFB70084 */  sw         $s7, 0x84($sp)
/* B5484 800B4884 AFB60080 */  sw         $s6, 0x80($sp)
/* B5488 800B4888 AFB5007C */  sw         $s5, 0x7c($sp)
/* B548C 800B488C AFB20070 */  sw         $s2, 0x70($sp)
/* B5490 800B4890 AFB1006C */  sw         $s1, 0x6c($sp)
/* B5494 800B4894 AFB00068 */  sw         $s0, 0x68($sp)
/* B5498 800B4898 AFA500A4 */  sw         $a1, 0xa4($sp)
/* B549C 800B489C AFA600A8 */  sw         $a2, 0xa8($sp)
/* B54A0 800B48A0 AFB30040 */  sw         $s3, 0x40($sp)
/* B54A4 800B48A4 AFB40044 */  sw         $s4, 0x44($sp)
/* B54A8 800B48A8 AFA2003C */  sw         $v0, 0x3c($sp)
/* B54AC 800B48AC 97C4000C */  lhu        $a0, 0xc($fp)
/* B54B0 800B48B0 AFA40048 */  sw         $a0, 0x48($sp)
/* B54B4 800B48B4 8FC20004 */  lw         $v0, 4($fp)
/* B54B8 800B48B8 97C5000E */  lhu        $a1, 0xe($fp)
/* B54BC 800B48BC 00006821 */  addu       $t5, $zero, $zero
/* B54C0 800B48C0 1040000D */  beqz       $v0, .L800B48F8
/* B54C4 800B48C4 AFA5004C */   sw        $a1, 0x4c($sp)
/* B54C8 800B48C8 8FA4003C */  lw         $a0, 0x3c($sp)
/* B54CC 800B48CC 0064102A */  slt        $v0, $v1, $a0
/* B54D0 800B48D0 10400009 */  beqz       $v0, .L800B48F8
/* B54D4 800B48D4 8FA500BC */   lw        $a1, 0xbc($sp)
/* B54D8 800B48D8 8FA300C4 */  lw         $v1, 0xc4($sp)
/* B54DC 800B48DC 00A3102A */  slt        $v0, $a1, $v1
/* B54E0 800B48E0 10400005 */  beqz       $v0, .L800B48F8
/* B54E4 800B48E4 8FA400C0 */   lw        $a0, 0xc0($sp)
/* B54E8 800B48E8 8FA500C8 */  lw         $a1, 0xc8($sp)
/* B54EC 800B48EC 0085102A */  slt        $v0, $a0, $a1
/* B54F0 800B48F0 14400003 */  bnez       $v0, .L800B4900
/* B54F4 800B48F4 8FA300A8 */   lw        $v1, 0xa8($sp)
.L800B48F8:
/* B54F8 800B48F8 0802D352 */  j          .L800B4D48
/* B54FC 800B48FC 00001021 */   addu      $v0, $zero, $zero
.L800B4900:
/* B5500 800B4900 C7A0004C */  lwc1       $f0, 0x4c($sp)
/* B5504 800B4904 46800020 */  cvt.s.w    $f0, $f0
/* B5508 800B4908 46160002 */  mul.s      $f0, $f0, $f22
/* B550C 800B490C 3C01800E */  lui        $at, %hi(D_800E3C3C)
/* B5510 800B4910 C4223C3C */  lwc1       $f2, %lo(D_800E3C3C)($at)
/* B5514 800B4914 46020000 */  add.s      $f0, $f0, $f2
/* B5518 800B4918 90620000 */  lbu        $v0, ($v1)
/* B551C 800B491C 4600008D */  trunc.w.s  $f2, $f0
/* B5520 800B4920 E7A20050 */  swc1       $f2, 0x50($sp)
/* B5524 800B4924 10400104 */  beqz       $v0, .L800B4D38
/* B5528 800B4928 8FB200A8 */   lw        $s2, 0xa8($sp)
/* B552C 800B492C 92450000 */  lbu        $a1, ($s2)
.L800B4930:
/* B5530 800B4930 4406A000 */  mfc1       $a2, $f20
/* B5534 800B4934 03C02021 */  addu       $a0, $fp, $zero
/* B5538 800B4938 0C02D486 */  jal        func_800B5218
/* B553C 800B493C AFAD0064 */   sw        $t5, 0x64($sp)
/* B5540 800B4940 92430000 */  lbu        $v1, ($s2)
/* B5544 800B4944 8FAD0064 */  lw         $t5, 0x64($sp)
/* B5548 800B4948 2404000A */  addiu      $a0, $zero, 0xa
/* B554C 800B494C 14640004 */  bne        $v1, $a0, .L800B4960
/* B5550 800B4950 AFA20054 */   sw        $v0, 0x54($sp)
/* B5554 800B4954 26520001 */  addiu      $s2, $s2, 1
/* B5558 800B4958 0802D270 */  j          .L800B49C0
/* B555C 800B495C 25AD0001 */   addiu     $t5, $t5, 1
.L800B4960:
/* B5560 800B4960 3C03800F */  lui        $v1, %hi(struct_unk_+0x20)
/* B5564 800B4964 92460000 */  lbu        $a2, ($s2)
/* B5568 800B4968 24633640 */  addiu      $v1, $v1, %lo(struct_unk_+0x20)
/* B556C 800B496C 24C2FFE0 */  addiu      $v0, $a2, -0x20
/* B5570 800B4970 00432021 */  addu       $a0, $v0, $v1
/* B5574 800B4974 90830000 */  lbu        $v1, ($a0)
/* B5578 800B4978 2402002B */  addiu      $v0, $zero, 0x2b
/* B557C 800B497C 10620007 */  beq        $v1, $v0, .L800B499C
/* B5580 800B4980 00C01821 */   addu      $v1, $a2, $zero
/* B5584 800B4984 24020020 */  addiu      $v0, $zero, 0x20
/* B5588 800B4988 54620039 */  bnel       $v1, $v0, .L800B4A70
/* B558C 800B498C 97C3000E */   lhu       $v1, 0xe($fp)
/* B5590 800B4990 8FA40040 */  lw         $a0, 0x40($sp)
/* B5594 800B4994 56640004 */  bnel       $s3, $a0, .L800B49A8
/* B5598 800B4998 26520001 */   addiu     $s2, $s2, 1
.L800B499C:
/* B559C 800B499C 26520001 */  addiu      $s2, $s2, 1
/* B55A0 800B49A0 0802D34B */  j          .L800B4D2C
/* B55A4 800B49A4 25AD0001 */   addiu     $t5, $t5, 1
.L800B49A8:
/* B55A8 800B49A8 8FA50054 */  lw         $a1, 0x54($sp)
/* B55AC 800B49AC 8FA4003C */  lw         $a0, 0x3c($sp)
/* B55B0 800B49B0 02659821 */  addu       $s3, $s3, $a1
/* B55B4 800B49B4 0093102A */  slt        $v0, $a0, $s3
/* B55B8 800B49B8 10400005 */  beqz       $v0, .L800B49D0
/* B55BC 800B49BC 25AD0001 */   addiu     $t5, $t5, 1
.L800B49C0:
/* B55C0 800B49C0 8FA50050 */  lw         $a1, 0x50($sp)
/* B55C4 800B49C4 8FB30040 */  lw         $s3, 0x40($sp)
/* B55C8 800B49C8 0802D34B */  j          .L800B4D2C
/* B55CC 800B49CC 0285A021 */   addu      $s4, $s4, $a1
.L800B49D0:
/* B55D0 800B49D0 92420000 */  lbu        $v0, ($s2)
/* B55D4 800B49D4 1040001F */  beqz       $v0, .L800B4A54
/* B55D8 800B49D8 02608821 */   addu      $s1, $s3, $zero
/* B55DC 800B49DC 1043001D */  beq        $v0, $v1, .L800B4A54
/* B55E0 800B49E0 2403000A */   addiu     $v1, $zero, 0xa
/* B55E4 800B49E4 1043001B */  beq        $v0, $v1, .L800B4A54
/* B55E8 800B49E8 3C02800F */   lui       $v0, %hi(struct_unk_+0x20)
/* B55EC 800B49EC 24473640 */  addiu      $a3, $v0, %lo(struct_unk_+0x20)
/* B55F0 800B49F0 2417002B */  addiu      $s7, $zero, 0x2b
/* B55F4 800B49F4 24160020 */  addiu      $s6, $zero, 0x20
/* B55F8 800B49F8 8FA400A8 */  lw         $a0, 0xa8($sp)
/* B55FC 800B49FC 2415000A */  addiu      $s5, $zero, 0xa
/* B5600 800B4A00 01A48021 */  addu       $s0, $t5, $a0
/* B5604 800B4A04 92050000 */  lbu        $a1, ($s0)
.L800B4A08:
/* B5608 800B4A08 00A71021 */  addu       $v0, $a1, $a3
/* B560C 800B4A0C 9043FFE0 */  lbu        $v1, -0x20($v0)
/* B5610 800B4A10 10770008 */  beq        $v1, $s7, .L800B4A34
/* B5614 800B4A14 03C02021 */   addu      $a0, $fp, $zero
/* B5618 800B4A18 4406A000 */  mfc1       $a2, $f20
/* B561C 800B4A1C AFA70060 */  sw         $a3, 0x60($sp)
/* B5620 800B4A20 0C02D486 */  jal        func_800B5218
/* B5624 800B4A24 AFAD0064 */   sw        $t5, 0x64($sp)
/* B5628 800B4A28 02228821 */  addu       $s1, $s1, $v0
/* B562C 800B4A2C 8FAD0064 */  lw         $t5, 0x64($sp)
/* B5630 800B4A30 8FA70060 */  lw         $a3, 0x60($sp)
.L800B4A34:
/* B5634 800B4A34 26100001 */  addiu      $s0, $s0, 1
/* B5638 800B4A38 92020000 */  lbu        $v0, ($s0)
/* B563C 800B4A3C 10400006 */  beqz       $v0, .L800B4A58
/* B5640 800B4A40 8FA5003C */   lw        $a1, 0x3c($sp)
/* B5644 800B4A44 50560005 */  beql       $v0, $s6, .L800B4A5C
/* B5648 800B4A48 00B1102A */   slt       $v0, $a1, $s1
/* B564C 800B4A4C 5455FFEE */  bnel       $v0, $s5, .L800B4A08
/* B5650 800B4A50 92050000 */   lbu       $a1, ($s0)
.L800B4A54:
/* B5654 800B4A54 8FA5003C */  lw         $a1, 0x3c($sp)
.L800B4A58:
/* B5658 800B4A58 00B1102A */  slt        $v0, $a1, $s1
.L800B4A5C:
/* B565C 800B4A5C 104000B3 */  beqz       $v0, .L800B4D2C
/* B5660 800B4A60 8FA20050 */   lw        $v0, 0x50($sp)
/* B5664 800B4A64 8FB30040 */  lw         $s3, 0x40($sp)
/* B5668 800B4A68 0802D34B */  j          .L800B4D2C
/* B566C 800B4A6C 0282A021 */   addu      $s4, $s4, $v0
.L800B4A70:
/* B5670 800B4A70 8FA500C0 */  lw         $a1, 0xc0($sp)
/* B5674 800B4A74 90860000 */  lbu        $a2, ($a0)
/* B5678 800B4A78 02831021 */  addu       $v0, $s4, $v1
/* B567C 800B4A7C 00A2102A */  slt        $v0, $a1, $v0
/* B5680 800B4A80 104000A6 */  beqz       $v0, .L800B4D1C
/* B5684 800B4A84 00603821 */   addu      $a3, $v1, $zero
/* B5688 800B4A88 8FA300C8 */  lw         $v1, 0xc8($sp)
/* B568C 800B4A8C 0283102A */  slt        $v0, $s4, $v1
/* B5690 800B4A90 104000A3 */  beqz       $v0, .L800B4D20
/* B5694 800B4A94 8FA50054 */   lw        $a1, 0x54($sp)
/* B5698 800B4A98 93C30008 */  lbu        $v1, 8($fp)
/* B569C 800B4A9C 8FC40000 */  lw         $a0, ($fp)
/* B56A0 800B4AA0 00031040 */  sll        $v0, $v1, 1
/* B56A4 800B4AA4 00431021 */  addu       $v0, $v0, $v1
/* B56A8 800B4AA8 000210C0 */  sll        $v0, $v0, 3
/* B56AC 800B4AAC 00441021 */  addu       $v0, $v0, $a0
/* B56B0 800B4AB0 90430014 */  lbu        $v1, 0x14($v0)
/* B56B4 800B4AB4 00C3001A */  div        $zero, $a2, $v1
/* B56B8 800B4AB8 00002012 */  mflo       $a0
/* B56BC 800B4ABC 00002810 */  mfhi       $a1
/* B56C0 800B4AC0 50600001 */  beql       $v1, $zero, .L800B4AC8
/* B56C4 800B4AC4 000001CD */   break     0, 7
.L800B4AC8:
/* B56C8 800B4AC8 AFA40058 */   sw        $a0, 0x58($sp)
/* B56CC 800B4ACC 50600001 */  beql       $v1, $zero, .L800B4AD4
/* B56D0 800B4AD0 000001CD */   break     0, 7
.L800B4AD4:
/* B56D4 800B4AD4 0000A821 */   addu      $s5, $zero, $zero
/* B56D8 800B4AD8 0000B021 */  addu       $s6, $zero, $zero
/* B56DC 800B4ADC 00008821 */  addu       $s1, $zero, $zero
/* B56E0 800B4AE0 8FA300BC */  lw         $v1, 0xbc($sp)
/* B56E4 800B4AE4 0000B821 */  addu       $s7, $zero, $zero
/* B56E8 800B4AE8 0263102A */  slt        $v0, $s3, $v1
/* B56EC 800B4AEC 1440000D */  bnez       $v0, .L800B4B24
/* B56F0 800B4AF0 AFA5005C */   sw        $a1, 0x5c($sp)
/* B56F4 800B4AF4 00061040 */  sll        $v0, $a2, 1
/* B56F8 800B4AF8 8FC40018 */  lw         $a0, 0x18($fp)
/* B56FC 800B4AFC 00408021 */  addu       $s0, $v0, $zero
/* B5700 800B4B00 00441021 */  addu       $v0, $v0, $a0
/* B5704 800B4B04 94430000 */  lhu        $v1, ($v0)
/* B5708 800B4B08 8FA500C4 */  lw         $a1, 0xc4($sp)
/* B570C 800B4B0C 02631821 */  addu       $v1, $s3, $v1
/* B5710 800B4B10 00A3182A */  slt        $v1, $a1, $v1
/* B5714 800B4B14 10600018 */  beqz       $v1, .L800B4B78
/* B5718 800B4B18 02041021 */   addu      $v0, $s0, $a0
/* B571C 800B4B1C 0802D2D5 */  j          .L800B4B54
/* B5720 800B4B20 94430000 */   lhu       $v1, ($v0)
.L800B4B24:
/* B5724 800B4B24 00068040 */  sll        $s0, $a2, 1
/* B5728 800B4B28 8FA300BC */  lw         $v1, 0xbc($sp)
/* B572C 800B4B2C 8FC40018 */  lw         $a0, 0x18($fp)
/* B5730 800B4B30 00731023 */  subu       $v0, $v1, $s3
/* B5734 800B4B34 44820000 */  mtc1       $v0, $f0
/* B5738 800B4B38 46800020 */  cvt.s.w    $f0, $f0
/* B573C 800B4B3C 46140003 */  div.s      $f0, $f0, $f20
/* B5740 800B4B40 4600008D */  trunc.w.s  $f2, $f0
/* B5744 800B4B44 44111000 */  mfc1       $s1, $f2
/* B5748 800B4B48 02041021 */  addu       $v0, $s0, $a0
/* B574C 800B4B4C 94430000 */  lhu        $v1, ($v0)
/* B5750 800B4B50 8FA500C4 */  lw         $a1, 0xc4($sp)
.L800B4B54:
/* B5754 800B4B54 02631821 */  addu       $v1, $s3, $v1
/* B5758 800B4B58 00A3102A */  slt        $v0, $a1, $v1
/* B575C 800B4B5C 10400006 */  beqz       $v0, .L800B4B78
/* B5760 800B4B60 00651023 */   subu      $v0, $v1, $a1
/* B5764 800B4B64 44820000 */  mtc1       $v0, $f0
/* B5768 800B4B68 46800020 */  cvt.s.w    $f0, $f0
/* B576C 800B4B6C 46140003 */  div.s      $f0, $f0, $f20
/* B5770 800B4B70 4600008D */  trunc.w.s  $f2, $f0
/* B5774 800B4B74 44171000 */  mfc1       $s7, $f2
.L800B4B78:
/* B5778 800B4B78 8FA300C0 */  lw         $v1, 0xc0($sp)
/* B577C 800B4B7C 0283102A */  slt        $v0, $s4, $v1
/* B5780 800B4B80 14400008 */  bnez       $v0, .L800B4BA4
/* B5784 800B4B84 00741023 */   subu      $v0, $v1, $s4
/* B5788 800B4B88 8FA500C8 */  lw         $a1, 0xc8($sp)
/* B578C 800B4B8C 02871021 */  addu       $v0, $s4, $a3
/* B5790 800B4B90 00A2102A */  slt        $v0, $a1, $v0
/* B5794 800B4B94 10400012 */  beqz       $v0, .L800B4BE0
/* B5798 800B4B98 02871821 */   addu      $v1, $s4, $a3
/* B579C 800B4B9C 0802D2F1 */  j          .L800B4BC4
/* B57A0 800B4BA0 00A3102A */   slt       $v0, $a1, $v1
.L800B4BA4:
/* B57A4 800B4BA4 44820000 */  mtc1       $v0, $f0
/* B57A8 800B4BA8 46800020 */  cvt.s.w    $f0, $f0
/* B57AC 800B4BAC 46160003 */  div.s      $f0, $f0, $f22
/* B57B0 800B4BB0 4600008D */  trunc.w.s  $f2, $f0
/* B57B4 800B4BB4 44151000 */  mfc1       $s5, $f2
/* B57B8 800B4BB8 8FA500C8 */  lw         $a1, 0xc8($sp)
/* B57BC 800B4BBC 02871821 */  addu       $v1, $s4, $a3
/* B57C0 800B4BC0 00A3102A */  slt        $v0, $a1, $v1
.L800B4BC4:
/* B57C4 800B4BC4 10400006 */  beqz       $v0, .L800B4BE0
/* B57C8 800B4BC8 00651023 */   subu      $v0, $v1, $a1
/* B57CC 800B4BCC 44820000 */  mtc1       $v0, $f0
/* B57D0 800B4BD0 46800020 */  cvt.s.w    $f0, $f0
/* B57D4 800B4BD4 46160003 */  div.s      $f0, $f0, $f22
/* B57D8 800B4BD8 4600008D */  trunc.w.s  $f2, $f0
/* B57DC 800B4BDC 44161000 */  mfc1       $s6, $f2
.L800B4BE0:
/* B57E0 800B4BE0 02041821 */  addu       $v1, $s0, $a0
/* B57E4 800B4BE4 94620000 */  lhu        $v0, ($v1)
/* B57E8 800B4BE8 00571023 */  subu       $v0, $v0, $s7
/* B57EC 800B4BEC 0222102A */  slt        $v0, $s1, $v0
/* B57F0 800B4BF0 1040004A */  beqz       $v0, .L800B4D1C
/* B57F4 800B4BF4 8FA3004C */   lw        $v1, 0x4c($sp)
/* B57F8 800B4BF8 00761023 */  subu       $v0, $v1, $s6
/* B57FC 800B4BFC 02A2102A */  slt        $v0, $s5, $v0
/* B5800 800B4C00 10400047 */  beqz       $v0, .L800B4D20
/* B5804 800B4C04 8FA50054 */   lw        $a1, 0x54($sp)
/* B5808 800B4C08 93C2001C */  lbu        $v0, 0x1c($fp)
/* B580C 800B4C0C 93C3001D */  lbu        $v1, 0x1d($fp)
/* B5810 800B4C10 93C4001E */  lbu        $a0, 0x1e($fp)
/* B5814 800B4C14 92450000 */  lbu        $a1, ($s2)
/* B5818 800B4C18 A3A20038 */  sb         $v0, 0x38($sp)
/* B581C 800B4C1C 2CA2007F */  sltiu      $v0, $a1, 0x7f
/* B5820 800B4C20 A3A30039 */  sb         $v1, 0x39($sp)
/* B5824 800B4C24 14400009 */  bnez       $v0, .L800B4C4C
/* B5828 800B4C28 A3A4003A */   sb        $a0, 0x3a($sp)
/* B582C 800B4C2C 24A4FF81 */  addiu      $a0, $a1, -0x7f
/* B5830 800B4C30 308400FF */  andi       $a0, $a0, 0xff
/* B5834 800B4C34 27A50038 */  addiu      $a1, $sp, 0x38
/* B5838 800B4C38 27A60039 */  addiu      $a2, $sp, 0x39
/* B583C 800B4C3C 27A7003A */  addiu      $a3, $sp, 0x3a
/* B5840 800B4C40 0C02D034 */  jal        get_extra_font_color
/* B5844 800B4C44 AFAD0064 */   sw        $t5, 0x64($sp)
/* B5848 800B4C48 8FAD0064 */  lw         $t5, 0x64($sp)
.L800B4C4C:
/* B584C 800B4C4C 02711821 */  addu       $v1, $s3, $s1
/* B5850 800B4C50 44830000 */  mtc1       $v1, $f0
/* B5854 800B4C54 46800020 */  cvt.s.w    $f0, $f0
/* B5858 800B4C58 8FA20058 */  lw         $v0, 0x58($sp)
/* B585C 800B4C5C 8FA40048 */  lw         $a0, 0x48($sp)
/* B5860 800B4C60 44060000 */  mfc1       $a2, $f0
/* B5864 800B4C64 8FA3004C */  lw         $v1, 0x4c($sp)
/* B5868 800B4C68 8FC50004 */  lw         $a1, 4($fp)
/* B586C 800B4C6C 00440018 */  mult       $v0, $a0
/* B5870 800B4C70 02951021 */  addu       $v0, $s4, $s5
/* B5874 800B4C74 44821000 */  mtc1       $v0, $f2
/* B5878 800B4C78 468010A0 */  cvt.s.w    $f2, $f2
/* B587C 800B4C7C 8FA200A4 */  lw         $v0, 0xa4($sp)
/* B5880 800B4C80 93A90038 */  lbu        $t1, 0x38($sp)
/* B5884 800B4C84 8C440000 */  lw         $a0, ($v0)
/* B5888 800B4C88 00006012 */  mflo       $t4
/* B588C 800B4C8C 8FA2005C */  lw         $v0, 0x5c($sp)
/* B5890 800B4C90 93AA003A */  lbu        $t2, 0x3a($sp)
/* B5894 800B4C94 00430018 */  mult       $v0, $v1
/* B5898 800B4C98 01911021 */  addu       $v0, $t4, $s1
/* B589C 800B4C9C 3042FFFF */  andi       $v0, $v0, 0xffff
/* B58A0 800B4CA0 AFA20010 */  sw         $v0, 0x10($sp)
/* B58A4 800B4CA4 8FC20018 */  lw         $v0, 0x18($fp)
/* B58A8 800B4CA8 44071000 */  mfc1       $a3, $f2
/* B58AC 800B4CAC 02021021 */  addu       $v0, $s0, $v0
/* B58B0 800B4CB0 00004012 */  mflo       $t0
/* B58B4 800B4CB4 01151821 */  addu       $v1, $t0, $s5
/* B58B8 800B4CB8 3063FFFF */  andi       $v1, $v1, 0xffff
/* B58BC 800B4CBC AFA30014 */  sw         $v1, 0x14($sp)
/* B58C0 800B4CC0 8FA3004C */  lw         $v1, 0x4c($sp)
/* B58C4 800B4CC4 93CB001F */  lbu        $t3, 0x1f($fp)
/* B58C8 800B4CC8 01034021 */  addu       $t0, $t0, $v1
/* B58CC 800B4CCC 01164023 */  subu       $t0, $t0, $s6
/* B58D0 800B4CD0 94430000 */  lhu        $v1, ($v0)
/* B58D4 800B4CD4 93A20039 */  lbu        $v0, 0x39($sp)
/* B58D8 800B4CD8 3108FFFF */  andi       $t0, $t0, 0xffff
/* B58DC 800B4CDC AFA8001C */  sw         $t0, 0x1c($sp)
/* B58E0 800B4CE0 E7B40020 */  swc1       $f20, 0x20($sp)
/* B58E4 800B4CE4 E7B60024 */  swc1       $f22, 0x24($sp)
/* B58E8 800B4CE8 AFA90028 */  sw         $t1, 0x28($sp)
/* B58EC 800B4CEC AFAA0030 */  sw         $t2, 0x30($sp)
/* B58F0 800B4CF0 AFAB0034 */  sw         $t3, 0x34($sp)
/* B58F4 800B4CF4 AFAD0064 */  sw         $t5, 0x64($sp)
/* B58F8 800B4CF8 006C1821 */  addu       $v1, $v1, $t4
/* B58FC 800B4CFC 00771823 */  subu       $v1, $v1, $s7
/* B5900 800B4D00 3063FFFF */  andi       $v1, $v1, 0xffff
/* B5904 800B4D04 AFA2002C */  sw         $v0, 0x2c($sp)
/* B5908 800B4D08 0C029188 */  jal        N64BorgImageDraw
/* B590C 800B4D0C AFA30018 */   sw        $v1, 0x18($sp)
/* B5910 800B4D10 8FA400A4 */  lw         $a0, 0xa4($sp)
/* B5914 800B4D14 AC820000 */  sw         $v0, ($a0)
/* B5918 800B4D18 8FAD0064 */  lw         $t5, 0x64($sp)
.L800B4D1C:
/* B591C 800B4D1C 8FA50054 */  lw         $a1, 0x54($sp)
.L800B4D20:
/* B5920 800B4D20 26520001 */  addiu      $s2, $s2, 1
/* B5924 800B4D24 25AD0001 */  addiu      $t5, $t5, 1
/* B5928 800B4D28 02659821 */  addu       $s3, $s3, $a1
.L800B4D2C:
/* B592C 800B4D2C 92420000 */  lbu        $v0, ($s2)
/* B5930 800B4D30 5440FEFF */  bnel       $v0, $zero, .L800B4930
/* B5934 800B4D34 92450000 */   lbu       $a1, ($s2)
.L800B4D38:
/* B5938 800B4D38 8FA20050 */  lw         $v0, 0x50($sp)
/* B593C 800B4D3C 8FA30044 */  lw         $v1, 0x44($sp)
/* B5940 800B4D40 0282A021 */  addu       $s4, $s4, $v0
/* B5944 800B4D44 02831023 */  subu       $v0, $s4, $v1
.L800B4D48:
/* B5948 800B4D48 8FBF008C */  lw         $ra, 0x8c($sp)
/* B594C 800B4D4C 8FBE0088 */  lw         $fp, 0x88($sp)
/* B5950 800B4D50 8FB70084 */  lw         $s7, 0x84($sp)
/* B5954 800B4D54 8FB60080 */  lw         $s6, 0x80($sp)
/* B5958 800B4D58 8FB5007C */  lw         $s5, 0x7c($sp)
/* B595C 800B4D5C 8FB40078 */  lw         $s4, 0x78($sp)
/* B5960 800B4D60 8FB30074 */  lw         $s3, 0x74($sp)
/* B5964 800B4D64 8FB20070 */  lw         $s2, 0x70($sp)
/* B5968 800B4D68 8FB1006C */  lw         $s1, 0x6c($sp)
/* B596C 800B4D6C 8FB00068 */  lw         $s0, 0x68($sp)
/* B5970 800B4D70 D7B60098 */  ldc1       $f22, 0x98($sp)
/* B5974 800B4D74 D7B40090 */  ldc1       $f20, 0x90($sp)
/* B5978 800B4D78 03E00008 */  jr         $ra
/* B597C 800B4D7C 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_800B4D80
/* B5980 800B4D80 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* B5984 800B4D84 8FA20048 */  lw         $v0, 0x48($sp)
/* B5988 800B4D88 87A3004E */  lh         $v1, 0x4e($sp)
/* B598C 800B4D8C 87A80052 */  lh         $t0, 0x52($sp)
/* B5990 800B4D90 87A90056 */  lh         $t1, 0x56($sp)
/* B5994 800B4D94 87AA005A */  lh         $t2, 0x5a($sp)
/* B5998 800B4D98 AFBF0030 */  sw         $ra, 0x30($sp)
/* B599C 800B4D9C C4800014 */  lwc1       $f0, 0x14($a0)
/* B59A0 800B4DA0 30C600FF */  andi       $a2, $a2, 0xff
/* B59A4 800B4DA4 AFA20010 */  sw         $v0, 0x10($sp)
/* B59A8 800B4DA8 AFA30014 */  sw         $v1, 0x14($sp)
/* B59AC 800B4DAC AFA80018 */  sw         $t0, 0x18($sp)
/* B59B0 800B4DB0 AFA9001C */  sw         $t1, 0x1c($sp)
/* B59B4 800B4DB4 AFAA0020 */  sw         $t2, 0x20($sp)
/* B59B8 800B4DB8 E7A00024 */  swc1       $f0, 0x24($sp)
/* B59BC 800B4DBC 0C02D374 */  jal        func_800B4DD0
/* B59C0 800B4DC0 E7A00028 */   swc1      $f0, 0x28($sp)
/* B59C4 800B4DC4 8FBF0030 */  lw         $ra, 0x30($sp)
/* B59C8 800B4DC8 03E00008 */  jr         $ra
/* B59CC 800B4DCC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800B4DD0
/* B59D0 800B4DD0 27BDFF80 */  addiu      $sp, $sp, -0x80
/* B59D4 800B4DD4 AFB00048 */  sw         $s0, 0x48($sp)
/* B59D8 800B4DD8 00808021 */  addu       $s0, $a0, $zero
/* B59DC 800B4DDC 30CC00FF */  andi       $t4, $a2, 0xff
/* B59E0 800B4DE0 3C03800F */  lui        $v1, %hi(struct_unk_+0x20)
/* B59E4 800B4DE4 24633640 */  addiu      $v1, $v1, %lo(struct_unk_+0x20)
/* B59E8 800B4DE8 01831821 */  addu       $v1, $t4, $v1
/* B59EC 800B4DEC AFBF006C */  sw         $ra, 0x6c($sp)
/* B59F0 800B4DF0 AFBE0068 */  sw         $fp, 0x68($sp)
/* B59F4 800B4DF4 AFB70064 */  sw         $s7, 0x64($sp)
/* B59F8 800B4DF8 AFB60060 */  sw         $s6, 0x60($sp)
/* B59FC 800B4DFC AFB5005C */  sw         $s5, 0x5c($sp)
/* B5A00 800B4E00 AFB40058 */  sw         $s4, 0x58($sp)
/* B5A04 800B4E04 AFB30054 */  sw         $s3, 0x54($sp)
/* B5A08 800B4E08 AFB20050 */  sw         $s2, 0x50($sp)
/* B5A0C 800B4E0C AFB1004C */  sw         $s1, 0x4c($sp)
/* B5A10 800B4E10 F7B60078 */  sdc1       $f22, 0x78($sp)
/* B5A14 800B4E14 F7B40070 */  sdc1       $f20, 0x70($sp)
/* B5A18 800B4E18 92040008 */  lbu        $a0, 8($s0)
/* B5A1C 800B4E1C 8E060000 */  lw         $a2, ($s0)
/* B5A20 800B4E20 9069FFE0 */  lbu        $t1, -0x20($v1)
/* B5A24 800B4E24 00041040 */  sll        $v0, $a0, 1
/* B5A28 800B4E28 00441021 */  addu       $v0, $v0, $a0
/* B5A2C 800B4E2C 000210C0 */  sll        $v0, $v0, 3
/* B5A30 800B4E30 00461021 */  addu       $v0, $v0, $a2
/* B5A34 800B4E34 90440014 */  lbu        $a0, 0x14($v0)
/* B5A38 800B4E38 0124001A */  div        $zero, $t1, $a0
/* B5A3C 800B4E3C 00E09821 */  addu       $s3, $a3, $zero
/* B5A40 800B4E40 0000A821 */  addu       $s5, $zero, $zero
/* B5A44 800B4E44 0000F021 */  addu       $fp, $zero, $zero
/* B5A48 800B4E48 8FB40090 */  lw         $s4, 0x90($sp)
/* B5A4C 800B4E4C C7B400A4 */  lwc1       $f20, 0xa4($sp)
/* B5A50 800B4E50 C7B600A8 */  lwc1       $f22, 0xa8($sp)
/* B5A54 800B4E54 87A80096 */  lh         $t0, 0x96($sp)
/* B5A58 800B4E58 87AA009A */  lh         $t2, 0x9a($sp)
/* B5A5C 800B4E5C 87AB009E */  lh         $t3, 0x9e($sp)
/* B5A60 800B4E60 87A700A2 */  lh         $a3, 0xa2($sp)
/* B5A64 800B4E64 9602000C */  lhu        $v0, 0xc($s0)
/* B5A68 800B4E68 0000B021 */  addu       $s6, $zero, $zero
/* B5A6C 800B4E6C AFA2003C */  sw         $v0, 0x3c($sp)
/* B5A70 800B4E70 9612000E */  lhu        $s2, 0xe($s0)
/* B5A74 800B4E74 00001812 */  mflo       $v1
/* B5A78 800B4E78 0000B821 */  addu       $s7, $zero, $zero
/* B5A7C 800B4E7C AFA50084 */  sw         $a1, 0x84($sp)
/* B5A80 800B4E80 00003010 */  mfhi       $a2
/* B5A84 800B4E84 50800001 */  beql       $a0, $zero, .L800B4E8C
/* B5A88 800B4E88 000001CD */   break     0, 7
.L800B4E8C:
/* B5A8C 800B4E8C AFA30040 */   sw        $v1, 0x40($sp)
/* B5A90 800B4E90 50800001 */  beql       $a0, $zero, .L800B4E98
/* B5A94 800B4E94 000001CD */   break     0, 7
.L800B4E98:
/* B5A98 800B4E98 8E020004 */   lw        $v0, 4($s0)
/* B5A9C 800B4E9C 10400006 */  beqz       $v0, .L800B4EB8
/* B5AA0 800B4EA0 AFA60044 */   sw        $a2, 0x44($sp)
/* B5AA4 800B4EA4 2402002B */  addiu      $v0, $zero, 0x2b
/* B5AA8 800B4EA8 11220003 */  beq        $t1, $v0, .L800B4EB8
/* B5AAC 800B4EAC 2402000A */   addiu     $v0, $zero, 0xa
/* B5AB0 800B4EB0 15820003 */  bne        $t4, $v0, .L800B4EC0
/* B5AB4 800B4EB4 028A102A */   slt       $v0, $s4, $t2
.L800B4EB8:
/* B5AB8 800B4EB8 0802D435 */  j          .L800B50D4
/* B5ABC 800B4EBC 02601021 */   addu      $v0, $s3, $zero
.L800B4EC0:
/* B5AC0 800B4EC0 14400007 */  bnez       $v0, .L800B4EE0
/* B5AC4 800B4EC4 01541023 */   subu      $v0, $t2, $s4
/* B5AC8 800B4EC8 02921021 */  addu       $v0, $s4, $s2
/* B5ACC 800B4ECC 00E2102A */  slt        $v0, $a3, $v0
/* B5AD0 800B4ED0 10400013 */  beqz       $v0, .L800B4F20
/* B5AD4 800B4ED4 0268102A */   slt       $v0, $s3, $t0
/* B5AD8 800B4ED8 0802D3BE */  j          .L800B4EF8
/* B5ADC 800B4EDC 9602000E */   lhu       $v0, 0xe($s0)
.L800B4EE0:
/* B5AE0 800B4EE0 44820000 */  mtc1       $v0, $f0
/* B5AE4 800B4EE4 46800020 */  cvt.s.w    $f0, $f0
/* B5AE8 800B4EE8 46160003 */  div.s      $f0, $f0, $f22
/* B5AEC 800B4EEC 4600008D */  trunc.w.s  $f2, $f0
/* B5AF0 800B4EF0 44151000 */  mfc1       $s5, $f2
/* B5AF4 800B4EF4 9602000E */  lhu        $v0, 0xe($s0)
.L800B4EF8:
/* B5AF8 800B4EF8 02821021 */  addu       $v0, $s4, $v0
/* B5AFC 800B4EFC 00E2182A */  slt        $v1, $a3, $v0
/* B5B00 800B4F00 10600006 */  beqz       $v1, .L800B4F1C
/* B5B04 800B4F04 00471023 */   subu      $v0, $v0, $a3
/* B5B08 800B4F08 44820000 */  mtc1       $v0, $f0
/* B5B0C 800B4F0C 46800020 */  cvt.s.w    $f0, $f0
/* B5B10 800B4F10 46160003 */  div.s      $f0, $f0, $f22
/* B5B14 800B4F14 4600008D */  trunc.w.s  $f2, $f0
/* B5B18 800B4F18 441E1000 */  mfc1       $fp, $f2
.L800B4F1C:
/* B5B1C 800B4F1C 0268102A */  slt        $v0, $s3, $t0
.L800B4F20:
/* B5B20 800B4F20 1440000C */  bnez       $v0, .L800B4F54
/* B5B24 800B4F24 01131023 */   subu      $v0, $t0, $s3
/* B5B28 800B4F28 00091040 */  sll        $v0, $t1, 1
/* B5B2C 800B4F2C 8E040018 */  lw         $a0, 0x18($s0)
/* B5B30 800B4F30 00408821 */  addu       $s1, $v0, $zero
/* B5B34 800B4F34 00441021 */  addu       $v0, $v0, $a0
/* B5B38 800B4F38 94430000 */  lhu        $v1, ($v0)
/* B5B3C 800B4F3C 02631821 */  addu       $v1, $s3, $v1
/* B5B40 800B4F40 0163182A */  slt        $v1, $t3, $v1
/* B5B44 800B4F44 10600015 */  beqz       $v1, .L800B4F9C
/* B5B48 800B4F48 02241021 */   addu      $v0, $s1, $a0
/* B5B4C 800B4F4C 0802D3DE */  j          .L800B4F78
/* B5B50 800B4F50 94430000 */   lhu       $v1, ($v0)
.L800B4F54:
/* B5B54 800B4F54 44820000 */  mtc1       $v0, $f0
/* B5B58 800B4F58 46800020 */  cvt.s.w    $f0, $f0
/* B5B5C 800B4F5C 46140003 */  div.s      $f0, $f0, $f20
/* B5B60 800B4F60 4600008D */  trunc.w.s  $f2, $f0
/* B5B64 800B4F64 44161000 */  mfc1       $s6, $f2
/* B5B68 800B4F68 8E040018 */  lw         $a0, 0x18($s0)
/* B5B6C 800B4F6C 00098840 */  sll        $s1, $t1, 1
/* B5B70 800B4F70 02241021 */  addu       $v0, $s1, $a0
/* B5B74 800B4F74 94430000 */  lhu        $v1, ($v0)
.L800B4F78:
/* B5B78 800B4F78 02632021 */  addu       $a0, $s3, $v1
/* B5B7C 800B4F7C 0164102A */  slt        $v0, $t3, $a0
/* B5B80 800B4F80 10400006 */  beqz       $v0, .L800B4F9C
/* B5B84 800B4F84 008B1023 */   subu      $v0, $a0, $t3
/* B5B88 800B4F88 44820000 */  mtc1       $v0, $f0
/* B5B8C 800B4F8C 46800020 */  cvt.s.w    $f0, $f0
/* B5B90 800B4F90 46140003 */  div.s      $f0, $f0, $f20
/* B5B94 800B4F94 4600008D */  trunc.w.s  $f2, $f0
/* B5B98 800B4F98 44171000 */  mfc1       $s7, $f2
.L800B4F9C:
/* B5B9C 800B4F9C 8E020018 */  lw         $v0, 0x18($s0)
/* B5BA0 800B4FA0 02221021 */  addu       $v0, $s1, $v0
/* B5BA4 800B4FA4 94430000 */  lhu        $v1, ($v0)
/* B5BA8 800B4FA8 00771823 */  subu       $v1, $v1, $s7
/* B5BAC 800B4FAC 02C3182A */  slt        $v1, $s6, $v1
/* B5BB0 800B4FB0 10600042 */  beqz       $v1, .L800B50BC
/* B5BB4 800B4FB4 025E1023 */   subu      $v0, $s2, $fp
/* B5BB8 800B4FB8 02A2102A */  slt        $v0, $s5, $v0
/* B5BBC 800B4FBC 50400040 */  beql       $v0, $zero, .L800B50C0
/* B5BC0 800B4FC0 8E030018 */   lw        $v1, 0x18($s0)
/* B5BC4 800B4FC4 9202001C */  lbu        $v0, 0x1c($s0)
/* B5BC8 800B4FC8 9203001D */  lbu        $v1, 0x1d($s0)
/* B5BCC 800B4FCC 9204001E */  lbu        $a0, 0x1e($s0)
/* B5BD0 800B4FD0 A3A20038 */  sb         $v0, 0x38($sp)
/* B5BD4 800B4FD4 2D82007F */  sltiu      $v0, $t4, 0x7f
/* B5BD8 800B4FD8 A3A30039 */  sb         $v1, 0x39($sp)
/* B5BDC 800B4FDC 14400007 */  bnez       $v0, .L800B4FFC
/* B5BE0 800B4FE0 A3A4003A */   sb        $a0, 0x3a($sp)
/* B5BE4 800B4FE4 2584FF81 */  addiu      $a0, $t4, -0x7f
/* B5BE8 800B4FE8 308400FF */  andi       $a0, $a0, 0xff
/* B5BEC 800B4FEC 27A50038 */  addiu      $a1, $sp, 0x38
/* B5BF0 800B4FF0 27A60039 */  addiu      $a2, $sp, 0x39
/* B5BF4 800B4FF4 0C02D034 */  jal        get_extra_font_color
/* B5BF8 800B4FF8 27A7003A */   addiu     $a3, $sp, 0x3a
.L800B4FFC:
/* B5BFC 800B4FFC 02761821 */  addu       $v1, $s3, $s6
/* B5C00 800B5000 44830000 */  mtc1       $v1, $f0
/* B5C04 800B5004 46800020 */  cvt.s.w    $f0, $f0
/* B5C08 800B5008 8FA20040 */  lw         $v0, 0x40($sp)
/* B5C0C 800B500C 8FA4003C */  lw         $a0, 0x3c($sp)
/* B5C10 800B5010 44060000 */  mfc1       $a2, $f0
/* B5C14 800B5014 00440018 */  mult       $v0, $a0
/* B5C18 800B5018 02951021 */  addu       $v0, $s4, $s5
/* B5C1C 800B501C 44821000 */  mtc1       $v0, $f2
/* B5C20 800B5020 468010A0 */  cvt.s.w    $f2, $f2
/* B5C24 800B5024 8FA20084 */  lw         $v0, 0x84($sp)
/* B5C28 800B5028 8E050004 */  lw         $a1, 4($s0)
/* B5C2C 800B502C 8C440000 */  lw         $a0, ($v0)
/* B5C30 800B5030 00006012 */  mflo       $t4
/* B5C34 800B5034 8FA20044 */  lw         $v0, 0x44($sp)
/* B5C38 800B5038 93AA003A */  lbu        $t2, 0x3a($sp)
/* B5C3C 800B503C 00520018 */  mult       $v0, $s2
/* B5C40 800B5040 01961021 */  addu       $v0, $t4, $s6
/* B5C44 800B5044 3042FFFF */  andi       $v0, $v0, 0xffff
/* B5C48 800B5048 AFA20010 */  sw         $v0, 0x10($sp)
/* B5C4C 800B504C 8E090018 */  lw         $t1, 0x18($s0)
/* B5C50 800B5050 44071000 */  mfc1       $a3, $f2
/* B5C54 800B5054 02294821 */  addu       $t1, $s1, $t1
/* B5C58 800B5058 00004012 */  mflo       $t0
/* B5C5C 800B505C 01151821 */  addu       $v1, $t0, $s5
/* B5C60 800B5060 3063FFFF */  andi       $v1, $v1, 0xffff
/* B5C64 800B5064 01124021 */  addu       $t0, $t0, $s2
/* B5C68 800B5068 011E4023 */  subu       $t0, $t0, $fp
/* B5C6C 800B506C AFA30014 */  sw         $v1, 0x14($sp)
/* B5C70 800B5070 95220000 */  lhu        $v0, ($t1)
/* B5C74 800B5074 93A30038 */  lbu        $v1, 0x38($sp)
/* B5C78 800B5078 93A90039 */  lbu        $t1, 0x39($sp)
/* B5C7C 800B507C 920B001F */  lbu        $t3, 0x1f($s0)
/* B5C80 800B5080 3108FFFF */  andi       $t0, $t0, 0xffff
/* B5C84 800B5084 AFA8001C */  sw         $t0, 0x1c($sp)
/* B5C88 800B5088 E7B40020 */  swc1       $f20, 0x20($sp)
/* B5C8C 800B508C E7B60024 */  swc1       $f22, 0x24($sp)
/* B5C90 800B5090 AFAA0030 */  sw         $t2, 0x30($sp)
/* B5C94 800B5094 004C1021 */  addu       $v0, $v0, $t4
/* B5C98 800B5098 00571023 */  subu       $v0, $v0, $s7
/* B5C9C 800B509C 3042FFFF */  andi       $v0, $v0, 0xffff
/* B5CA0 800B50A0 AFA30028 */  sw         $v1, 0x28($sp)
/* B5CA4 800B50A4 AFA9002C */  sw         $t1, 0x2c($sp)
/* B5CA8 800B50A8 AFAB0034 */  sw         $t3, 0x34($sp)
/* B5CAC 800B50AC 0C029188 */  jal        N64BorgImageDraw
/* B5CB0 800B50B0 AFA20018 */   sw        $v0, 0x18($sp)
/* B5CB4 800B50B4 8FA30084 */  lw         $v1, 0x84($sp)
/* B5CB8 800B50B8 AC620000 */  sw         $v0, ($v1)
.L800B50BC:
/* B5CBC 800B50BC 8E030018 */  lw         $v1, 0x18($s0)
.L800B50C0:
/* B5CC0 800B50C0 02231821 */  addu       $v1, $s1, $v1
/* B5CC4 800B50C4 94620000 */  lhu        $v0, ($v1)
/* B5CC8 800B50C8 00571023 */  subu       $v0, $v0, $s7
/* B5CCC 800B50CC 00561023 */  subu       $v0, $v0, $s6
/* B5CD0 800B50D0 02621021 */  addu       $v0, $s3, $v0
.L800B50D4:
/* B5CD4 800B50D4 8FBF006C */  lw         $ra, 0x6c($sp)
/* B5CD8 800B50D8 8FBE0068 */  lw         $fp, 0x68($sp)
/* B5CDC 800B50DC 8FB70064 */  lw         $s7, 0x64($sp)
/* B5CE0 800B50E0 8FB60060 */  lw         $s6, 0x60($sp)
/* B5CE4 800B50E4 8FB5005C */  lw         $s5, 0x5c($sp)
/* B5CE8 800B50E8 8FB40058 */  lw         $s4, 0x58($sp)
/* B5CEC 800B50EC 8FB30054 */  lw         $s3, 0x54($sp)
/* B5CF0 800B50F0 8FB20050 */  lw         $s2, 0x50($sp)
/* B5CF4 800B50F4 8FB1004C */  lw         $s1, 0x4c($sp)
/* B5CF8 800B50F8 8FB00048 */  lw         $s0, 0x48($sp)
/* B5CFC 800B50FC D7B60078 */  ldc1       $f22, 0x78($sp)
/* B5D00 800B5100 D7B40070 */  ldc1       $f20, 0x70($sp)
/* B5D04 800B5104 03E00008 */  jr         $ra
/* B5D08 800B5108 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_800B510C
/* B5D0C 800B510C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B5D10 800B5110 AFBF0010 */  sw         $ra, 0x10($sp)
/* B5D14 800B5114 0C02D44A */  jal        func_800B5128
/* B5D18 800B5118 8C860014 */   lw        $a2, 0x14($a0)
/* B5D1C 800B511C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B5D20 800B5120 03E00008 */  jr         $ra
/* B5D24 800B5124 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B5128
/* B5D28 800B5128 00804021 */  addu       $t0, $a0, $zero
/* B5D2C 800B512C 8D020004 */  lw         $v0, 4($t0)
/* B5D30 800B5130 44861000 */  mtc1       $a2, $f2
/* B5D34 800B5134 14400003 */  bnez       $v0, .L800B5144
/* B5D38 800B5138 00003821 */   addu      $a3, $zero, $zero
/* B5D3C 800B513C 03E00008 */  jr         $ra
/* B5D40 800B5140 00001021 */   addu      $v0, $zero, $zero
.L800B5144:
/* B5D44 800B5144 90A20000 */  lbu        $v0, ($a1)
/* B5D48 800B5148 1040001A */  beqz       $v0, .L800B51B4
/* B5D4C 800B514C 3C02800F */   lui       $v0, %hi(struct_unk_+0x20)
/* B5D50 800B5150 244A3640 */  addiu      $t2, $v0, %lo(struct_unk_+0x20)
/* B5D54 800B5154 2409002B */  addiu      $t1, $zero, 0x2b
/* B5D58 800B5158 2406000A */  addiu      $a2, $zero, 0xa
/* B5D5C 800B515C 90A40000 */  lbu        $a0, ($a1)
.L800B5160:
/* B5D60 800B5160 2482FFE0 */  addiu      $v0, $a0, -0x20
/* B5D64 800B5164 004A1021 */  addu       $v0, $v0, $t2
/* B5D68 800B5168 90430000 */  lbu        $v1, ($v0)
/* B5D6C 800B516C 5069000E */  beql       $v1, $t1, .L800B51A8
/* B5D70 800B5170 24A50001 */   addiu     $a1, $a1, 1
/* B5D74 800B5174 1086000B */  beq        $a0, $a2, .L800B51A4
/* B5D78 800B5178 00601021 */   addu      $v0, $v1, $zero
/* B5D7C 800B517C 8D040018 */  lw         $a0, 0x18($t0)
/* B5D80 800B5180 00021040 */  sll        $v0, $v0, 1
/* B5D84 800B5184 00441021 */  addu       $v0, $v0, $a0
/* B5D88 800B5188 94430000 */  lhu        $v1, ($v0)
/* B5D8C 800B518C 44830000 */  mtc1       $v1, $f0
/* B5D90 800B5190 46800020 */  cvt.s.w    $f0, $f0
/* B5D94 800B5194 46020002 */  mul.s      $f0, $f0, $f2
/* B5D98 800B5198 4600010D */  trunc.w.s  $f4, $f0
/* B5D9C 800B519C 44022000 */  mfc1       $v0, $f4
/* B5DA0 800B51A0 00E23821 */  addu       $a3, $a3, $v0
.L800B51A4:
/* B5DA4 800B51A4 24A50001 */  addiu      $a1, $a1, 1
.L800B51A8:
/* B5DA8 800B51A8 90A20000 */  lbu        $v0, ($a1)
/* B5DAC 800B51AC 5440FFEC */  bnel       $v0, $zero, .L800B5160
/* B5DB0 800B51B0 90A40000 */   lbu       $a0, ($a1)
.L800B51B4:
/* B5DB4 800B51B4 03E00008 */  jr         $ra
/* B5DB8 800B51B8 00E01021 */   addu      $v0, $a3, $zero

glabel func_800B51BC
/* B5DBC 800B51BC 00803021 */  addu       $a2, $a0, $zero
/* B5DC0 800B51C0 8CC20004 */  lw         $v0, 4($a2)
/* B5DC4 800B51C4 14400003 */  bnez       $v0, .L800B51D4
/* B5DC8 800B51C8 30A500FF */   andi      $a1, $a1, 0xff
/* B5DCC 800B51CC 03E00008 */  jr         $ra
/* B5DD0 800B51D0 00001021 */   addu      $v0, $zero, $zero
.L800B51D4:
/* B5DD4 800B51D4 3C02800F */  lui        $v0, %hi(struct_unk_+0x20)
/* B5DD8 800B51D8 24423640 */  addiu      $v0, $v0, %lo(struct_unk_+0x20)
/* B5DDC 800B51DC 24A3FFE0 */  addiu      $v1, $a1, -0x20
/* B5DE0 800B51E0 00621821 */  addu       $v1, $v1, $v0
/* B5DE4 800B51E4 90640000 */  lbu        $a0, ($v1)
/* B5DE8 800B51E8 2402002B */  addiu      $v0, $zero, 0x2b
/* B5DEC 800B51EC 10820008 */  beq        $a0, $v0, .L800B5210
/* B5DF0 800B51F0 2402000A */   addiu     $v0, $zero, 0xa
/* B5DF4 800B51F4 10A20006 */  beq        $a1, $v0, .L800B5210
/* B5DF8 800B51F8 00801821 */   addu      $v1, $a0, $zero
/* B5DFC 800B51FC 8CC20018 */  lw         $v0, 0x18($a2)
/* B5E00 800B5200 00031840 */  sll        $v1, $v1, 1
/* B5E04 800B5204 00621821 */  addu       $v1, $v1, $v0
/* B5E08 800B5208 03E00008 */  jr         $ra
/* B5E0C 800B520C 94620000 */   lhu       $v0, ($v1)
.L800B5210:
/* B5E10 800B5210 03E00008 */  jr         $ra
/* B5E14 800B5214 00001021 */   addu      $v0, $zero, $zero

glabel func_800B5218
/* B5E18 800B5218 00803821 */  addu       $a3, $a0, $zero
/* B5E1C 800B521C 8CE20004 */  lw         $v0, 4($a3)
/* B5E20 800B5220 44861000 */  mtc1       $a2, $f2
/* B5E24 800B5224 14400003 */  bnez       $v0, .L800B5234
/* B5E28 800B5228 30A500FF */   andi      $a1, $a1, 0xff
/* B5E2C 800B522C 03E00008 */  jr         $ra
/* B5E30 800B5230 00001021 */   addu      $v0, $zero, $zero
.L800B5234:
/* B5E34 800B5234 3C02800F */  lui        $v0, %hi(struct_unk_+0x20)
/* B5E38 800B5238 24423640 */  addiu      $v0, $v0, %lo(struct_unk_+0x20)
/* B5E3C 800B523C 24A3FFE0 */  addiu      $v1, $a1, -0x20
/* B5E40 800B5240 00621821 */  addu       $v1, $v1, $v0
/* B5E44 800B5244 90640000 */  lbu        $a0, ($v1)
/* B5E48 800B5248 2402002B */  addiu      $v0, $zero, 0x2b
/* B5E4C 800B524C 1082000E */  beq        $a0, $v0, .L800B5288
/* B5E50 800B5250 2402000A */   addiu     $v0, $zero, 0xa
/* B5E54 800B5254 10A2000C */  beq        $a1, $v0, .L800B5288
/* B5E58 800B5258 00801021 */   addu      $v0, $a0, $zero
/* B5E5C 800B525C 8CE40018 */  lw         $a0, 0x18($a3)
/* B5E60 800B5260 00021040 */  sll        $v0, $v0, 1
/* B5E64 800B5264 00441021 */  addu       $v0, $v0, $a0
/* B5E68 800B5268 94430000 */  lhu        $v1, ($v0)
/* B5E6C 800B526C 44830000 */  mtc1       $v1, $f0
/* B5E70 800B5270 46800020 */  cvt.s.w    $f0, $f0
/* B5E74 800B5274 46020002 */  mul.s      $f0, $f0, $f2
/* B5E78 800B5278 4600008D */  trunc.w.s  $f2, $f0
/* B5E7C 800B527C 44021000 */  mfc1       $v0, $f2
/* B5E80 800B5280 03E00008 */  jr         $ra
/* B5E84 800B5284 00000000 */   nop
.L800B5288:
/* B5E88 800B5288 03E00008 */  jr         $ra
/* B5E8C 800B528C 00001021 */   addu      $v0, $zero, $zero

glabel func_800B5290
/* B5E90 800B5290 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B5E94 800B5294 AFBF0018 */  sw         $ra, 0x18($sp)
/* B5E98 800B5298 C4800014 */  lwc1       $f0, 0x14($a0)
/* B5E9C 800B529C E7A00010 */  swc1       $f0, 0x10($sp)
/* B5EA0 800B52A0 0C02D4AD */  jal        func_800B52B4
/* B5EA4 800B52A4 E7A00014 */   swc1      $f0, 0x14($sp)
/* B5EA8 800B52A8 8FBF0018 */  lw         $ra, 0x18($sp)
/* B5EAC 800B52AC 03E00008 */  jr         $ra
/* B5EB0 800B52B0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B52B4
/* B5EB4 800B52B4 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* B5EB8 800B52B8 AFB40030 */  sw         $s4, 0x30($sp)
/* B5EBC 800B52BC 0000A021 */  addu       $s4, $zero, $zero
/* B5EC0 800B52C0 AFB3002C */  sw         $s3, 0x2c($sp)
/* B5EC4 800B52C4 00C09821 */  addu       $s3, $a2, $zero
/* B5EC8 800B52C8 00004821 */  addu       $t1, $zero, $zero
/* B5ECC 800B52CC AFB7003C */  sw         $s7, 0x3c($sp)
/* B5ED0 800B52D0 0260B821 */  addu       $s7, $s3, $zero
/* B5ED4 800B52D4 AFBF0044 */  sw         $ra, 0x44($sp)
/* B5ED8 800B52D8 AFBE0040 */  sw         $fp, 0x40($sp)
/* B5EDC 800B52DC AFB60038 */  sw         $s6, 0x38($sp)
/* B5EE0 800B52E0 AFB50034 */  sw         $s5, 0x34($sp)
/* B5EE4 800B52E4 AFB20028 */  sw         $s2, 0x28($sp)
/* B5EE8 800B52E8 AFB10024 */  sw         $s1, 0x24($sp)
/* B5EEC 800B52EC AFB00020 */  sw         $s0, 0x20($sp)
/* B5EF0 800B52F0 F7B40048 */  sdc1       $f20, 0x48($sp)
/* B5EF4 800B52F4 AFA40050 */  sw         $a0, 0x50($sp)
/* B5EF8 800B52F8 AFA50054 */  sw         $a1, 0x54($sp)
/* B5EFC 800B52FC AFA7005C */  sw         $a3, 0x5c($sp)
/* B5F00 800B5300 8C820004 */  lw         $v0, 4($a0)
/* B5F04 800B5304 10400008 */  beqz       $v0, .L800B5328
/* B5F08 800B5308 C7B40060 */   lwc1      $f20, 0x60($sp)
/* B5F0C 800B530C 10A00006 */  beqz       $a1, .L800B5328
/* B5F10 800B5310 0267102A */   slt       $v0, $s3, $a3
/* B5F14 800B5314 10400060 */  beqz       $v0, .L800B5498
/* B5F18 800B5318 00001021 */   addu      $v0, $zero, $zero
/* B5F1C 800B531C 90A20000 */  lbu        $v0, ($a1)
/* B5F20 800B5320 14400003 */  bnez       $v0, .L800B5330
/* B5F24 800B5324 8FA30050 */   lw        $v1, 0x50($sp)
.L800B5328:
/* B5F28 800B5328 0802D526 */  j          .L800B5498
/* B5F2C 800B532C 00001021 */   addu      $v0, $zero, $zero
.L800B5330:
/* B5F30 800B5330 9462000E */  lhu        $v0, 0xe($v1)
/* B5F34 800B5334 C7A00064 */  lwc1       $f0, 0x64($sp)
/* B5F38 800B5338 44821000 */  mtc1       $v0, $f2
/* B5F3C 800B533C 468010A0 */  cvt.s.w    $f2, $f2
/* B5F40 800B5340 46001082 */  mul.s      $f2, $f2, $f0
/* B5F44 800B5344 3C01800E */  lui        $at, %hi(D_800E3C40)
/* B5F48 800B5348 C4203C40 */  lwc1       $f0, %lo(D_800E3C40)($at)
/* B5F4C 800B534C 46001080 */  add.s      $f2, $f2, $f0
/* B5F50 800B5350 8FB10054 */  lw         $s1, 0x54($sp)
/* B5F54 800B5354 4600100D */  trunc.w.s  $f0, $f2
/* B5F58 800B5358 44150000 */  mfc1       $s5, $f0
/* B5F5C 800B535C 92250000 */  lbu        $a1, ($s1)
.L800B5360:
/* B5F60 800B5360 4406A000 */  mfc1       $a2, $f20
/* B5F64 800B5364 8FA40050 */  lw         $a0, 0x50($sp)
/* B5F68 800B5368 0C02D486 */  jal        func_800B5218
/* B5F6C 800B536C AFA90018 */   sw        $t1, 0x18($sp)
/* B5F70 800B5370 00402821 */  addu       $a1, $v0, $zero
/* B5F74 800B5374 2404000A */  addiu      $a0, $zero, 0xa
/* B5F78 800B5378 92230000 */  lbu        $v1, ($s1)
/* B5F7C 800B537C 14640004 */  bne        $v1, $a0, .L800B5390
/* B5F80 800B5380 8FA90018 */   lw        $t1, 0x18($sp)
/* B5F84 800B5384 02E09821 */  addu       $s3, $s7, $zero
/* B5F88 800B5388 0802D520 */  j          .L800B5480
/* B5F8C 800B538C 01354821 */   addu      $t1, $t1, $s5
.L800B5390:
/* B5F90 800B5390 3C03800F */  lui        $v1, %hi(struct_unk_+0x20)
/* B5F94 800B5394 92240000 */  lbu        $a0, ($s1)
/* B5F98 800B5398 24633640 */  addiu      $v1, $v1, %lo(struct_unk_+0x20)
/* B5F9C 800B539C 00831021 */  addu       $v0, $a0, $v1
/* B5FA0 800B53A0 9043FFE0 */  lbu        $v1, -0x20($v0)
/* B5FA4 800B53A4 2402002B */  addiu      $v0, $zero, 0x2b
/* B5FA8 800B53A8 10620035 */  beq        $v1, $v0, .L800B5480
/* B5FAC 800B53AC 00801821 */   addu      $v1, $a0, $zero
/* B5FB0 800B53B0 24020020 */  addiu      $v0, $zero, 0x20
/* B5FB4 800B53B4 54620032 */  bnel       $v1, $v0, .L800B5480
/* B5FB8 800B53B8 02659821 */   addu      $s3, $s3, $a1
/* B5FBC 800B53BC 12770030 */  beq        $s3, $s7, .L800B5480
/* B5FC0 800B53C0 8FA4005C */   lw        $a0, 0x5c($sp)
/* B5FC4 800B53C4 02659821 */  addu       $s3, $s3, $a1
/* B5FC8 800B53C8 26310001 */  addiu      $s1, $s1, 1
/* B5FCC 800B53CC 0093102A */  slt        $v0, $a0, $s3
/* B5FD0 800B53D0 14400028 */  bnez       $v0, .L800B5474
/* B5FD4 800B53D4 26940001 */   addiu     $s4, $s4, 1
/* B5FD8 800B53D8 92220000 */  lbu        $v0, ($s1)
/* B5FDC 800B53DC 10400021 */  beqz       $v0, .L800B5464
/* B5FE0 800B53E0 02609021 */   addu      $s2, $s3, $zero
/* B5FE4 800B53E4 1043001F */  beq        $v0, $v1, .L800B5464
/* B5FE8 800B53E8 2403000A */   addiu     $v1, $zero, 0xa
/* B5FEC 800B53EC 1043001D */  beq        $v0, $v1, .L800B5464
/* B5FF0 800B53F0 3C02800F */   lui       $v0, %hi(struct_unk_+0x20)
/* B5FF4 800B53F4 24483640 */  addiu      $t0, $v0, %lo(struct_unk_+0x20)
/* B5FF8 800B53F8 2407002B */  addiu      $a3, $zero, 0x2b
/* B5FFC 800B53FC 241E0020 */  addiu      $fp, $zero, 0x20
/* B6000 800B5400 8FA40054 */  lw         $a0, 0x54($sp)
/* B6004 800B5404 2416000A */  addiu      $s6, $zero, 0xa
/* B6008 800B5408 02848021 */  addu       $s0, $s4, $a0
/* B600C 800B540C 92050000 */  lbu        $a1, ($s0)
.L800B5410:
/* B6010 800B5410 00A81021 */  addu       $v0, $a1, $t0
/* B6014 800B5414 9043FFE0 */  lbu        $v1, -0x20($v0)
/* B6018 800B5418 1067000A */  beq        $v1, $a3, .L800B5444
/* B601C 800B541C 8FA40050 */   lw        $a0, 0x50($sp)
/* B6020 800B5420 4406A000 */  mfc1       $a2, $f20
/* B6024 800B5424 AFA70010 */  sw         $a3, 0x10($sp)
/* B6028 800B5428 AFA80014 */  sw         $t0, 0x14($sp)
/* B602C 800B542C 0C02D486 */  jal        func_800B5218
/* B6030 800B5430 AFA90018 */   sw        $t1, 0x18($sp)
/* B6034 800B5434 02429021 */  addu       $s2, $s2, $v0
/* B6038 800B5438 8FA90018 */  lw         $t1, 0x18($sp)
/* B603C 800B543C 8FA80014 */  lw         $t0, 0x14($sp)
/* B6040 800B5440 8FA70010 */  lw         $a3, 0x10($sp)
.L800B5444:
/* B6044 800B5444 26100001 */  addiu      $s0, $s0, 1
/* B6048 800B5448 92020000 */  lbu        $v0, ($s0)
/* B604C 800B544C 10400006 */  beqz       $v0, .L800B5468
/* B6050 800B5450 8FA3005C */   lw        $v1, 0x5c($sp)
/* B6054 800B5454 505E0005 */  beql       $v0, $fp, .L800B546C
/* B6058 800B5458 0072102A */   slt       $v0, $v1, $s2
/* B605C 800B545C 5456FFEC */  bnel       $v0, $s6, .L800B5410
/* B6060 800B5460 92050000 */   lbu       $a1, ($s0)
.L800B5464:
/* B6064 800B5464 8FA3005C */  lw         $v1, 0x5c($sp)
.L800B5468:
/* B6068 800B5468 0072102A */  slt        $v0, $v1, $s2
.L800B546C:
/* B606C 800B546C 50400007 */  beql       $v0, $zero, .L800B548C
/* B6070 800B5470 92220000 */   lbu       $v0, ($s1)
.L800B5474:
/* B6074 800B5474 02E09821 */  addu       $s3, $s7, $zero
/* B6078 800B5478 0802D522 */  j          .L800B5488
/* B607C 800B547C 01354821 */   addu      $t1, $t1, $s5
.L800B5480:
/* B6080 800B5480 26310001 */  addiu      $s1, $s1, 1
/* B6084 800B5484 26940001 */  addiu      $s4, $s4, 1
.L800B5488:
/* B6088 800B5488 92220000 */  lbu        $v0, ($s1)
.L800B548C:
/* B608C 800B548C 5440FFB4 */  bnel       $v0, $zero, .L800B5360
/* B6090 800B5490 92250000 */   lbu       $a1, ($s1)
/* B6094 800B5494 01351021 */  addu       $v0, $t1, $s5
.L800B5498:
/* B6098 800B5498 8FBF0044 */  lw         $ra, 0x44($sp)
/* B609C 800B549C 8FBE0040 */  lw         $fp, 0x40($sp)
/* B60A0 800B54A0 8FB7003C */  lw         $s7, 0x3c($sp)
/* B60A4 800B54A4 8FB60038 */  lw         $s6, 0x38($sp)
/* B60A8 800B54A8 8FB50034 */  lw         $s5, 0x34($sp)
/* B60AC 800B54AC 8FB40030 */  lw         $s4, 0x30($sp)
/* B60B0 800B54B0 8FB3002C */  lw         $s3, 0x2c($sp)
/* B60B4 800B54B4 8FB20028 */  lw         $s2, 0x28($sp)
/* B60B8 800B54B8 8FB10024 */  lw         $s1, 0x24($sp)
/* B60BC 800B54BC 8FB00020 */  lw         $s0, 0x20($sp)
/* B60C0 800B54C0 D7B40048 */  ldc1       $f20, 0x48($sp)
/* B60C4 800B54C4 03E00008 */  jr         $ra
/* B60C8 800B54C8 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_800B54CC
/* B60CC 800B54CC 97A80012 */  lhu        $t0, 0x12($sp)
/* B60D0 800B54D0 94A4000A */  lhu        $a0, 0xa($a1)
/* B60D4 800B54D4 0088001B */  divu       $zero, $a0, $t0
/* B60D8 800B54D8 30E7FFFF */  andi       $a3, $a3, 0xffff
/* B60DC 800B54DC 00001812 */  mflo       $v1
/* B60E0 800B54E0 51000001 */  beql       $t0, $zero, .L800B54E8
/* B60E4 800B54E4 000001CD */   break     0, 7
.L800B54E8:
/* B60E8 800B54E8 94A2000C */   lhu       $v0, 0xc($a1)
/* B60EC 800B54EC 0047001B */  divu       $zero, $v0, $a3
/* B60F0 800B54F0 306DFFFF */  andi       $t5, $v1, 0xffff
/* B60F4 800B54F4 00001012 */  mflo       $v0
/* B60F8 800B54F8 50E00001 */  beql       $a3, $zero, .L800B5500
/* B60FC 800B54FC 000001CD */   break     0, 7
.L800B5500:
/* B6100 800B5500 304FFFFF */   andi      $t7, $v0, 0xffff
/* B6104 800B5504 94A30008 */  lhu        $v1, 8($a1)
/* B6108 800B5508 2463FFFF */  addiu      $v1, $v1, -1
/* B610C 800B550C 2C620009 */  sltiu      $v0, $v1, 9
/* B6110 800B5510 104000E5 */  beqz       $v0, .L800B58A8
/* B6114 800B5514 00807021 */   addu      $t6, $a0, $zero
/* B6118 800B5518 3C02800E */  lui        $v0, %hi(D_800E3C48)
/* B611C 800B551C 24423C48 */  addiu      $v0, $v0, %lo(D_800E3C48)
/* B6120 800B5520 00031880 */  sll        $v1, $v1, 2
/* B6124 800B5524 00621821 */  addu       $v1, $v1, $v0
/* B6128 800B5528 8C640000 */  lw         $a0, ($v1)
/* B612C 800B552C 00800008 */  jr         $a0
/* B6130 800B5530 00000000 */   nop
/* B6134 800B5534 00E80018 */  mult       $a3, $t0
/* B6138 800B5538 00001012 */  mflo       $v0
/* B613C 800B553C 184000DC */  blez       $v0, .L800B58B0
/* B6140 800B5540 00004821 */   addu      $t1, $zero, $zero
/* B6144 800B5544 8CA50014 */  lw         $a1, 0x14($a1)
/* B6148 800B5548 0040C021 */  addu       $t8, $v0, $zero
/* B614C 800B554C 0127001A */  div        $zero, $t1, $a3
.L800B5550:
/* B6150 800B5550 00002012 */  mflo       $a0
/* B6154 800B5554 00001010 */  mfhi       $v0
/* B6158 800B5558 50E00001 */  beql       $a3, $zero, .L800B5560
/* B615C 800B555C 000001CD */   break     0, 7
.L800B5560:
/* B6160 800B5560 50E00001 */   beql      $a3, $zero, .L800B5568
/* B6164 800B5564 000001CD */   break     0, 7
.L800B5568:
/* B6168 800B5568 01C20018 */   mult      $t6, $v0
/* B616C 800B556C 00001812 */  mflo       $v1
/* B6170 800B5570 00000000 */  nop
/* B6174 800B5574 00000000 */  nop
/* B6178 800B5578 008D0018 */  mult       $a0, $t5
/* B617C 800B557C 00002012 */  mflo       $a0
/* B6180 800B5580 00000000 */  nop
/* B6184 800B5584 00000000 */  nop
/* B6188 800B5588 006F0018 */  mult       $v1, $t7
/* B618C 800B558C 00091040 */  sll        $v0, $t1, 1
/* B6190 800B5590 00464021 */  addu       $t0, $v0, $a2
/* B6194 800B5594 A50D0000 */  sh         $t5, ($t0)
/* B6198 800B5598 31AAFFFF */  andi       $t2, $t5, 0xffff
/* B619C 800B559C 00001812 */  mflo       $v1
/* B61A0 800B55A0 00832021 */  addu       $a0, $a0, $v1
/* B61A4 800B55A4 008A1021 */  addu       $v0, $a0, $t2
/* B61A8 800B55A8 00021080 */  sll        $v0, $v0, 2
/* B61AC 800B55AC 00451021 */  addu       $v0, $v0, $a1
/* B61B0 800B55B0 008D1821 */  addu       $v1, $a0, $t5
/* B61B4 800B55B4 00031880 */  sll        $v1, $v1, 2
/* B61B8 800B55B8 00651821 */  addu       $v1, $v1, $a1
/* B61BC 800B55BC 8C42FFFC */  lw         $v0, -4($v0)
/* B61C0 800B55C0 8C630000 */  lw         $v1, ($v1)
/* B61C4 800B55C4 1443000D */  bne        $v0, $v1, .L800B55FC
/* B61C8 800B55C8 252C0001 */   addiu     $t4, $t1, 1
/* B61CC 800B55CC 01005821 */  addu       $t3, $t0, $zero
/* B61D0 800B55D0 01404021 */  addu       $t0, $t2, $zero
/* B61D4 800B55D4 2509FFFF */  addiu      $t1, $t0, -1
.L800B55D8:
/* B61D8 800B55D8 01204021 */  addu       $t0, $t1, $zero
/* B61DC 800B55DC 3102FFFF */  andi       $v0, $t0, 0xffff
/* B61E0 800B55E0 00821021 */  addu       $v0, $a0, $v0
/* B61E4 800B55E4 00021080 */  sll        $v0, $v0, 2
/* B61E8 800B55E8 00451021 */  addu       $v0, $v0, $a1
/* B61EC 800B55EC 8C42FFFC */  lw         $v0, -4($v0)
/* B61F0 800B55F0 5043FFF9 */  beql       $v0, $v1, .L800B55D8
/* B61F4 800B55F4 2509FFFF */   addiu     $t1, $t0, -1
/* B61F8 800B55F8 A5690000 */  sh         $t1, ($t3)
.L800B55FC:
/* B61FC 800B55FC 01804821 */  addu       $t1, $t4, $zero
/* B6200 800B5600 0138102A */  slt        $v0, $t1, $t8
/* B6204 800B5604 0127001A */  div        $zero, $t1, $a3
/* B6208 800B5608 5440FFD1 */  bnel       $v0, $zero, .L800B5550
/* B620C 800B560C 00000000 */   nop
/* B6210 800B5610 03E00008 */  jr         $ra
/* B6214 800B5614 24020001 */   addiu     $v0, $zero, 1
/* B6218 800B5618 00E80018 */  mult       $a3, $t0
/* B621C 800B561C 00001012 */  mflo       $v0
/* B6220 800B5620 184000A3 */  blez       $v0, .L800B58B0
/* B6224 800B5624 00004821 */   addu      $t1, $zero, $zero
/* B6228 800B5628 8CA50014 */  lw         $a1, 0x14($a1)
/* B622C 800B562C 00405821 */  addu       $t3, $v0, $zero
/* B6230 800B5630 0127001A */  div        $zero, $t1, $a3
.L800B5634:
/* B6234 800B5634 00002012 */  mflo       $a0
/* B6238 800B5638 00001010 */  mfhi       $v0
/* B623C 800B563C 50E00001 */  beql       $a3, $zero, .L800B5644
/* B6240 800B5640 000001CD */   break     0, 7
.L800B5644:
/* B6244 800B5644 50E00001 */   beql      $a3, $zero, .L800B564C
/* B6248 800B5648 000001CD */   break     0, 7
.L800B564C:
/* B624C 800B564C 01C20018 */   mult      $t6, $v0
/* B6250 800B5650 00001812 */  mflo       $v1
/* B6254 800B5654 00000000 */  nop
/* B6258 800B5658 00000000 */  nop
/* B625C 800B565C 008D0018 */  mult       $a0, $t5
/* B6260 800B5660 00002012 */  mflo       $a0
/* B6264 800B5664 00000000 */  nop
/* B6268 800B5668 00000000 */  nop
/* B626C 800B566C 006F0018 */  mult       $v1, $t7
/* B6270 800B5670 00091040 */  sll        $v0, $t1, 1
/* B6274 800B5674 00464021 */  addu       $t0, $v0, $a2
/* B6278 800B5678 A50D0000 */  sh         $t5, ($t0)
/* B627C 800B567C 31A2FFFF */  andi       $v0, $t5, 0xffff
/* B6280 800B5680 00001812 */  mflo       $v1
/* B6284 800B5684 00832021 */  addu       $a0, $a0, $v1
/* B6288 800B5688 00821021 */  addu       $v0, $a0, $v0
/* B628C 800B568C 00021040 */  sll        $v0, $v0, 1
/* B6290 800B5690 00451021 */  addu       $v0, $v0, $a1
/* B6294 800B5694 008D1821 */  addu       $v1, $a0, $t5
/* B6298 800B5698 00031840 */  sll        $v1, $v1, 1
/* B629C 800B569C 00651821 */  addu       $v1, $v1, $a1
/* B62A0 800B56A0 9442FFFE */  lhu        $v0, -2($v0)
/* B62A4 800B56A4 946A0000 */  lhu        $t2, ($v1)
/* B62A8 800B56A8 144A000B */  bne        $v0, $t2, .L800B56D8
/* B62AC 800B56AC 25290001 */   addiu     $t1, $t1, 1
/* B62B0 800B56B0 95030000 */  lhu        $v1, ($t0)
.L800B56B4:
/* B62B4 800B56B4 2463FFFF */  addiu      $v1, $v1, -1
/* B62B8 800B56B8 A5030000 */  sh         $v1, ($t0)
/* B62BC 800B56BC 3062FFFF */  andi       $v0, $v1, 0xffff
/* B62C0 800B56C0 00821021 */  addu       $v0, $a0, $v0
/* B62C4 800B56C4 00021040 */  sll        $v0, $v0, 1
/* B62C8 800B56C8 00451021 */  addu       $v0, $v0, $a1
/* B62CC 800B56CC 9442FFFE */  lhu        $v0, -2($v0)
/* B62D0 800B56D0 504AFFF8 */  beql       $v0, $t2, .L800B56B4
/* B62D4 800B56D4 95030000 */   lhu       $v1, ($t0)
.L800B56D8:
/* B62D8 800B56D8 012B102A */  slt        $v0, $t1, $t3
/* B62DC 800B56DC 0127001A */  div        $zero, $t1, $a3
/* B62E0 800B56E0 5440FFD4 */  bnel       $v0, $zero, .L800B5634
/* B62E4 800B56E4 00000000 */   nop
/* B62E8 800B56E8 03E00008 */  jr         $ra
/* B62EC 800B56EC 24020001 */   addiu     $v0, $zero, 1
/* B62F0 800B56F0 00E80018 */  mult       $a3, $t0
/* B62F4 800B56F4 00001012 */  mflo       $v0
/* B62F8 800B56F8 1840006D */  blez       $v0, .L800B58B0
/* B62FC 800B56FC 00004821 */   addu      $t1, $zero, $zero
/* B6300 800B5700 8CAB0014 */  lw         $t3, 0x14($a1)
/* B6304 800B5704 00406021 */  addu       $t4, $v0, $zero
/* B6308 800B5708 0127001A */  div        $zero, $t1, $a3
.L800B570C:
/* B630C 800B570C 00002812 */  mflo       $a1
/* B6310 800B5710 00001010 */  mfhi       $v0
/* B6314 800B5714 50E00001 */  beql       $a3, $zero, .L800B571C
/* B6318 800B5718 000001CD */   break     0, 7
.L800B571C:
/* B631C 800B571C 50E00001 */   beql      $a3, $zero, .L800B5724
/* B6320 800B5720 000001CD */   break     0, 7
.L800B5724:
/* B6324 800B5724 01C20018 */   mult      $t6, $v0
/* B6328 800B5728 00002012 */  mflo       $a0
/* B632C 800B572C 00000000 */  nop
/* B6330 800B5730 00000000 */  nop
/* B6334 800B5734 00AD0018 */  mult       $a1, $t5
/* B6338 800B5738 00002812 */  mflo       $a1
/* B633C 800B573C 00000000 */  nop
/* B6340 800B5740 00000000 */  nop
/* B6344 800B5744 008F0018 */  mult       $a0, $t7
/* B6348 800B5748 00091040 */  sll        $v0, $t1, 1
/* B634C 800B574C 00464021 */  addu       $t0, $v0, $a2
/* B6350 800B5750 A50D0000 */  sh         $t5, ($t0)
/* B6354 800B5754 31A3FFFF */  andi       $v1, $t5, 0xffff
/* B6358 800B5758 00002012 */  mflo       $a0
/* B635C 800B575C 00A42821 */  addu       $a1, $a1, $a0
/* B6360 800B5760 00A31821 */  addu       $v1, $a1, $v1
/* B6364 800B5764 006B1821 */  addu       $v1, $v1, $t3
/* B6368 800B5768 00AD1021 */  addu       $v0, $a1, $t5
/* B636C 800B576C 004B1021 */  addu       $v0, $v0, $t3
/* B6370 800B5770 9063FFFF */  lbu        $v1, -1($v1)
/* B6374 800B5774 904AFFFF */  lbu        $t2, -1($v0)
/* B6378 800B5778 146A000B */  bne        $v1, $t2, .L800B57A8
/* B637C 800B577C 25290001 */   addiu     $t1, $t1, 1
/* B6380 800B5780 01002021 */  addu       $a0, $t0, $zero
/* B6384 800B5784 94830000 */  lhu        $v1, ($a0)
.L800B5788:
/* B6388 800B5788 2463FFFF */  addiu      $v1, $v1, -1
/* B638C 800B578C A4830000 */  sh         $v1, ($a0)
/* B6390 800B5790 3062FFFF */  andi       $v0, $v1, 0xffff
/* B6394 800B5794 00A21021 */  addu       $v0, $a1, $v0
/* B6398 800B5798 004B1021 */  addu       $v0, $v0, $t3
/* B639C 800B579C 9043FFFF */  lbu        $v1, -1($v0)
/* B63A0 800B57A0 506AFFF9 */  beql       $v1, $t2, .L800B5788
/* B63A4 800B57A4 94830000 */   lhu       $v1, ($a0)
.L800B57A8:
/* B63A8 800B57A8 012C102A */  slt        $v0, $t1, $t4
/* B63AC 800B57AC 0127001A */  div        $zero, $t1, $a3
/* B63B0 800B57B0 5440FFD6 */  bnel       $v0, $zero, .L800B570C
/* B63B4 800B57B4 00000000 */   nop
/* B63B8 800B57B8 03E00008 */  jr         $ra
/* B63BC 800B57BC 24020001 */   addiu     $v0, $zero, 1
/* B63C0 800B57C0 00E80018 */  mult       $a3, $t0
/* B63C4 800B57C4 00001012 */  mflo       $v0
/* B63C8 800B57C8 18400039 */  blez       $v0, .L800B58B0
/* B63CC 800B57CC 00004021 */   addu      $t0, $zero, $zero
/* B63D0 800B57D0 8CAB0014 */  lw         $t3, 0x14($a1)
/* B63D4 800B57D4 0040C821 */  addu       $t9, $v0, $zero
/* B63D8 800B57D8 016DC021 */  addu       $t8, $t3, $t5
/* B63DC 800B57DC 0107001A */  div        $zero, $t0, $a3
.L800B57E0:
/* B63E0 800B57E0 00002012 */  mflo       $a0
/* B63E4 800B57E4 00001010 */  mfhi       $v0
/* B63E8 800B57E8 50E00001 */  beql       $a3, $zero, .L800B57F0
/* B63EC 800B57EC 000001CD */   break     0, 7
.L800B57F0:
/* B63F0 800B57F0 50E00001 */   beql      $a3, $zero, .L800B57F8
/* B63F4 800B57F4 000001CD */   break     0, 7
.L800B57F8:
/* B63F8 800B57F8 008D0018 */   mult      $a0, $t5
/* B63FC 800B57FC 00002012 */  mflo       $a0
/* B6400 800B5800 00000000 */  nop
/* B6404 800B5804 00000000 */  nop
/* B6408 800B5808 01C20018 */  mult       $t6, $v0
/* B640C 800B580C 00082840 */  sll        $a1, $t0, 1
/* B6410 800B5810 00001812 */  mflo       $v1
/* B6414 800B5814 00A61021 */  addu       $v0, $a1, $a2
/* B6418 800B5818 A44D0000 */  sh         $t5, ($v0)
/* B641C 800B581C 006F0018 */  mult       $v1, $t7
/* B6420 800B5820 93020000 */  lbu        $v0, ($t8)
/* B6424 800B5824 304A0007 */  andi       $t2, $v0, 7
/* B6428 800B5828 01401021 */  addu       $v0, $t2, $zero
/* B642C 800B582C 00001812 */  mflo       $v1
/* B6430 800B5830 00832021 */  addu       $a0, $a0, $v1
/* B6434 800B5834 0802D616 */  j          .L800B5858
/* B6438 800B5838 250C0001 */   addiu     $t4, $t0, 1
.L800B583C:
/* B643C 800B583C A5020000 */  sh         $v0, ($t0)
/* B6440 800B5840 3043FFFF */  andi       $v1, $v0, 0xffff
/* B6444 800B5844 00831821 */  addu       $v1, $a0, $v1
/* B6448 800B5848 006B1821 */  addu       $v1, $v1, $t3
/* B644C 800B584C 9062FFFF */  lbu        $v0, -1($v1)
/* B6450 800B5850 00021102 */  srl        $v0, $v0, 4
/* B6454 800B5854 30420007 */  andi       $v0, $v0, 7
.L800B5858:
/* B6458 800B5858 144A000C */  bne        $v0, $t2, .L800B588C
/* B645C 800B585C 00A64021 */   addu      $t0, $a1, $a2
/* B6460 800B5860 95020000 */  lhu        $v0, ($t0)
/* B6464 800B5864 2442FFFF */  addiu      $v0, $v0, -1
/* B6468 800B5868 A5020000 */  sh         $v0, ($t0)
/* B646C 800B586C 3049FFFF */  andi       $t1, $v0, 0xffff
/* B6470 800B5870 00891021 */  addu       $v0, $a0, $t1
/* B6474 800B5874 004B1021 */  addu       $v0, $v0, $t3
/* B6478 800B5878 9043FFFF */  lbu        $v1, -1($v0)
/* B647C 800B587C 00031902 */  srl        $v1, $v1, 4
/* B6480 800B5880 30620007 */  andi       $v0, $v1, 7
/* B6484 800B5884 104AFFED */  beq        $v0, $t2, .L800B583C
/* B6488 800B5888 2522FFFF */   addiu     $v0, $t1, -1
.L800B588C:
/* B648C 800B588C 01804021 */  addu       $t0, $t4, $zero
/* B6490 800B5890 0119102A */  slt        $v0, $t0, $t9
/* B6494 800B5894 0107001A */  div        $zero, $t0, $a3
/* B6498 800B5898 5440FFD1 */  bnel       $v0, $zero, .L800B57E0
/* B649C 800B589C 00000000 */   nop
/* B64A0 800B58A0 03E00008 */  jr         $ra
/* B64A4 800B58A4 24020001 */   addiu     $v0, $zero, 1
.L800B58A8:
/* B64A8 800B58A8 03E00008 */  jr         $ra
/* B64AC 800B58AC 00001021 */   addu      $v0, $zero, $zero
.L800B58B0:
/* B64B0 800B58B0 24020001 */  addiu      $v0, $zero, 1
/* B64B4 800B58B4 03E00008 */  jr         $ra
/* B64B8 800B58B8 00000000 */   nop
/* B64BC 800B58BC 00000000 */  nop
