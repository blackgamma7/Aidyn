.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel camera_set_position
/* B0D60 800B0160 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B0D64 800B0164 AFB10014 */  sw         $s1, 0x14($sp)
/* B0D68 800B0168 00808821 */  addu       $s1, $a0, $zero
/* B0D6C 800B016C AFB00010 */  sw         $s0, 0x10($sp)
/* B0D70 800B0170 00A08021 */  addu       $s0, $a1, $zero
/* B0D74 800B0174 02002021 */  addu       $a0, $s0, $zero
/* B0D78 800B0178 AFBF0018 */  sw         $ra, 0x18($sp)
/* B0D7C 800B017C 0C02AD17 */  jal        copyVec3
/* B0D80 800B0180 02202821 */   addu      $a1, $s1, $zero
/* B0D84 800B0184 02002021 */  addu       $a0, $s0, $zero
/* B0D88 800B0188 0C02AD17 */  jal        copyVec3
/* B0D8C 800B018C 26250018 */   addiu     $a1, $s1, 0x18
/* B0D90 800B0190 8FBF0018 */  lw         $ra, 0x18($sp)
/* B0D94 800B0194 8FB10014 */  lw         $s1, 0x14($sp)
/* B0D98 800B0198 8FB00010 */  lw         $s0, 0x10($sp)
/* B0D9C 800B019C 03E00008 */  jr         $ra
/* B0DA0 800B01A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel camera_set_aim
/* B0DA4 800B01A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B0DA8 800B01A8 AFB10014 */  sw         $s1, 0x14($sp)
/* B0DAC 800B01AC 00808821 */  addu       $s1, $a0, $zero
/* B0DB0 800B01B0 AFB00010 */  sw         $s0, 0x10($sp)
/* B0DB4 800B01B4 00A08021 */  addu       $s0, $a1, $zero
/* B0DB8 800B01B8 02002021 */  addu       $a0, $s0, $zero
/* B0DBC 800B01BC AFBF0018 */  sw         $ra, 0x18($sp)
/* B0DC0 800B01C0 0C02AD17 */  jal        copyVec3
/* B0DC4 800B01C4 2625000C */   addiu     $a1, $s1, 0xc
/* B0DC8 800B01C8 02002021 */  addu       $a0, $s0, $zero
/* B0DCC 800B01CC 0C02AD17 */  jal        copyVec3
/* B0DD0 800B01D0 26250024 */   addiu     $a1, $s1, 0x24
/* B0DD4 800B01D4 8FBF0018 */  lw         $ra, 0x18($sp)
/* B0DD8 800B01D8 8FB10014 */  lw         $s1, 0x14($sp)
/* B0DDC 800B01DC 8FB00010 */  lw         $s0, 0x10($sp)
/* B0DE0 800B01E0 03E00008 */  jr         $ra
/* B0DE4 800B01E4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel camera_init
/* B0DE8 800B01E8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B0DEC 800B01EC AFB00010 */  sw         $s0, 0x10($sp)
/* B0DF0 800B01F0 00808021 */  addu       $s0, $a0, $zero
/* B0DF4 800B01F4 AFB40020 */  sw         $s4, 0x20($sp)
/* B0DF8 800B01F8 00A0A021 */  addu       $s4, $a1, $zero
/* B0DFC 800B01FC 00002821 */  addu       $a1, $zero, $zero
/* B0E00 800B0200 AFB10014 */  sw         $s1, 0x14($sp)
/* B0E04 800B0204 00C08821 */  addu       $s1, $a2, $zero
/* B0E08 800B0208 AFB3001C */  sw         $s3, 0x1c($sp)
/* B0E0C 800B020C 30F3FFFF */  andi       $s3, $a3, 0xffff
/* B0E10 800B0210 AFBF0024 */  sw         $ra, 0x24($sp)
/* B0E14 800B0214 AFB20018 */  sw         $s2, 0x18($sp)
/* B0E18 800B0218 F7B40028 */  sdc1       $f20, 0x28($sp)
/* B0E1C 800B021C 0C026380 */  jal        Calloc
/* B0E20 800B0220 2406011C */   addiu     $a2, $zero, 0x11c
/* B0E24 800B0224 02002021 */  addu       $a0, $s0, $zero
/* B0E28 800B0228 02202821 */  addu       $a1, $s1, $zero
/* B0E2C 800B022C 24120001 */  addiu      $s2, $zero, 1
/* B0E30 800B0230 4480A000 */  mtc1       $zero, $f20
/* B0E34 800B0234 24020003 */  addiu      $v0, $zero, 3
/* B0E38 800B0238 A612007C */  sh         $s2, 0x7c($s0)
/* B0E3C 800B023C A602007E */  sh         $v0, 0x7e($s0)
/* B0E40 800B0240 A6000080 */  sh         $zero, 0x80($s0)
/* B0E44 800B0244 E6140014 */  swc1       $f20, 0x14($s0)
/* B0E48 800B0248 E6140010 */  swc1       $f20, 0x10($s0)
/* B0E4C 800B024C E614000C */  swc1       $f20, 0xc($s0)
/* B0E50 800B0250 E6140024 */  swc1       $f20, 0x24($s0)
/* B0E54 800B0254 E6140028 */  swc1       $f20, 0x28($s0)
/* B0E58 800B0258 E614002C */  swc1       $f20, 0x2c($s0)
/* B0E5C 800B025C E6140070 */  swc1       $f20, 0x70($s0)
/* B0E60 800B0260 E6140074 */  swc1       $f20, 0x74($s0)
/* B0E64 800B0264 0C02C058 */  jal        camera_set_position
/* B0E68 800B0268 E6140078 */   swc1      $f20, 0x78($s0)
/* B0E6C 800B026C 3C01800E */  lui        $at, %hi(D_800E3830)
/* B0E70 800B0270 C4203830 */  lwc1       $f0, %lo(D_800E3830)($at)
/* B0E74 800B0274 3C01800E */  lui        $at, %hi(D_800E3834)
/* B0E78 800B0278 C4223834 */  lwc1       $f2, %lo(D_800E3834)($at)
/* B0E7C 800B027C 3C01800E */  lui        $at, %hi(D_800E3838)
/* B0E80 800B0280 C4263838 */  lwc1       $f6, %lo(D_800E3838)($at)
/* B0E84 800B0284 3C01800E */  lui        $at, %hi(D_800E383C)
/* B0E88 800B0288 C428383C */  lwc1       $f8, %lo(D_800E383C)($at)
/* B0E8C 800B028C 3C01800E */  lui        $at, %hi(D_800E3840)
/* B0E90 800B0290 C4243840 */  lwc1       $f4, %lo(D_800E3840)($at)
/* B0E94 800B0294 3C01800E */  lui        $at, %hi(D_800E3844)
/* B0E98 800B0298 C42A3844 */  lwc1       $f10, %lo(D_800E3844)($at)
/* B0E9C 800B029C 260400D8 */  addiu      $a0, $s0, 0xd8
/* B0EA0 800B02A0 E6140034 */  swc1       $f20, 0x34($s0)
/* B0EA4 800B02A4 E6140040 */  swc1       $f20, 0x40($s0)
/* B0EA8 800B02A8 E614003C */  swc1       $f20, 0x3c($s0)
/* B0EAC 800B02AC E6140050 */  swc1       $f20, 0x50($s0)
/* B0EB0 800B02B0 A6120082 */  sh         $s2, 0x82($s0)
/* B0EB4 800B02B4 A6000084 */  sh         $zero, 0x84($s0)
/* B0EB8 800B02B8 A6130044 */  sh         $s3, 0x44($s0)
/* B0EBC 800B02BC A6130046 */  sh         $s3, 0x46($s0)
/* B0EC0 800B02C0 AE140088 */  sw         $s4, 0x88($s0)
/* B0EC4 800B02C4 E6000030 */  swc1       $f0, 0x30($s0)
/* B0EC8 800B02C8 E6000038 */  swc1       $f0, 0x38($s0)
/* B0ECC 800B02CC E602005C */  swc1       $f2, 0x5c($s0)
/* B0ED0 800B02D0 E6020060 */  swc1       $f2, 0x60($s0)
/* B0ED4 800B02D4 E606006C */  swc1       $f6, 0x6c($s0)
/* B0ED8 800B02D8 E6080064 */  swc1       $f8, 0x64($s0)
/* B0EDC 800B02DC E604004C */  swc1       $f4, 0x4c($s0)
/* B0EE0 800B02E0 E6040048 */  swc1       $f4, 0x48($s0)
/* B0EE4 800B02E4 0C02BC80 */  jal        func_800AF200
/* B0EE8 800B02E8 E60A0054 */   swc1      $f10, 0x54($s0)
/* B0EEC 800B02EC 0C02BC8D */  jal        set_vec7
/* B0EF0 800B02F0 26040100 */   addiu     $a0, $s0, 0x100
/* B0EF4 800B02F4 8FBF0024 */  lw         $ra, 0x24($sp)
/* B0EF8 800B02F8 8FB40020 */  lw         $s4, 0x20($sp)
/* B0EFC 800B02FC 8FB3001C */  lw         $s3, 0x1c($sp)
/* B0F00 800B0300 8FB20018 */  lw         $s2, 0x18($sp)
/* B0F04 800B0304 8FB10014 */  lw         $s1, 0x14($sp)
/* B0F08 800B0308 8FB00010 */  lw         $s0, 0x10($sp)
/* B0F0C 800B030C D7B40028 */  ldc1       $f20, 0x28($sp)
/* B0F10 800B0310 03E00008 */  jr         $ra
/* B0F14 800B0314 27BD0030 */   addiu     $sp, $sp, 0x30

glabel camera_orient
/* B0F18 800B0318 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B0F1C 800B031C AFB00010 */  sw         $s0, 0x10($sp)
/* B0F20 800B0320 00808021 */  addu       $s0, $a0, $zero
/* B0F24 800B0324 AFB10014 */  sw         $s1, 0x14($sp)
/* B0F28 800B0328 26110038 */  addiu      $s1, $s0, 0x38
/* B0F2C 800B032C 02202021 */  addu       $a0, $s1, $zero
/* B0F30 800B0330 2605000C */  addiu      $a1, $s0, 0xc
/* B0F34 800B0334 AFBF0018 */  sw         $ra, 0x18($sp)
/* B0F38 800B0338 0C02AB26 */  jal        Vec3A_BsubC
/* B0F3C 800B033C 02003021 */   addu      $a2, $s0, $zero
/* B0F40 800B0340 8E050038 */  lw         $a1, 0x38($s0)
/* B0F44 800B0344 8E060040 */  lw         $a2, 0x40($s0)
/* B0F48 800B0348 26100030 */  addiu      $s0, $s0, 0x30
/* B0F4C 800B034C 0C02AD55 */  jal        setVec2
/* B0F50 800B0350 02002021 */   addu      $a0, $s0, $zero
/* B0F54 800B0354 0C02ABBB */  jal        vec3_normalize
/* B0F58 800B0358 02202021 */   addu      $a0, $s1, $zero
/* B0F5C 800B035C 0C02AB9F */  jal        vec2_normalize
/* B0F60 800B0360 02002021 */   addu      $a0, $s0, $zero
/* B0F64 800B0364 8FBF0018 */  lw         $ra, 0x18($sp)
/* B0F68 800B0368 8FB10014 */  lw         $s1, 0x14($sp)
/* B0F6C 800B036C 8FB00010 */  lw         $s0, 0x10($sp)
/* B0F70 800B0370 03E00008 */  jr         $ra
/* B0F74 800B0374 27BD0020 */   addiu     $sp, $sp, 0x20

glabel camera_lerp
/* B0F78 800B0378 C4840000 */  lwc1       $f4, ($a0)
/* B0F7C 800B037C C4A00000 */  lwc1       $f0, ($a1)
/* B0F80 800B0380 46002001 */  sub.s      $f0, $f4, $f0
/* B0F84 800B0384 44863000 */  mtc1       $a2, $f6
/* B0F88 800B0388 46060003 */  div.s      $f0, $f0, $f6
/* B0F8C 800B038C 46002101 */  sub.s      $f4, $f4, $f0
/* B0F90 800B0390 C4820004 */  lwc1       $f2, 4($a0)
/* B0F94 800B0394 E4840000 */  swc1       $f4, ($a0)
/* B0F98 800B0398 C4A00004 */  lwc1       $f0, 4($a1)
/* B0F9C 800B039C 46001001 */  sub.s      $f0, $f2, $f0
/* B0FA0 800B03A0 46060003 */  div.s      $f0, $f0, $f6
/* B0FA4 800B03A4 46001081 */  sub.s      $f2, $f2, $f0
/* B0FA8 800B03A8 C4840008 */  lwc1       $f4, 8($a0)
/* B0FAC 800B03AC E4820004 */  swc1       $f2, 4($a0)
/* B0FB0 800B03B0 C4A00008 */  lwc1       $f0, 8($a1)
/* B0FB4 800B03B4 46002001 */  sub.s      $f0, $f4, $f0
/* B0FB8 800B03B8 46060003 */  div.s      $f0, $f0, $f6
/* B0FBC 800B03BC 46002101 */  sub.s      $f4, $f4, $f0
/* B0FC0 800B03C0 03E00008 */  jr         $ra
/* B0FC4 800B03C4 E4840008 */   swc1      $f4, 8($a0)

glabel adust_camera_aim
/* B0FC8 800B03C8 27BDFF78 */  addiu      $sp, $sp, -0x88
/* B0FCC 800B03CC F7B80080 */  sdc1       $f24, 0x80($sp)
/* B0FD0 800B03D0 4486C000 */  mtc1       $a2, $f24
/* B0FD4 800B03D4 AFB3005C */  sw         $s3, 0x5c($sp)
/* B0FD8 800B03D8 00809821 */  addu       $s3, $a0, $zero
/* B0FDC 800B03DC AFB50064 */  sw         $s5, 0x64($sp)
/* B0FE0 800B03E0 F7B40070 */  sdc1       $f20, 0x70($sp)
/* B0FE4 800B03E4 C7B40098 */  lwc1       $f20, 0x98($sp)
/* B0FE8 800B03E8 00073C00 */  sll        $a3, $a3, 0x10
/* B0FEC 800B03EC AFB20058 */  sw         $s2, 0x58($sp)
/* B0FF0 800B03F0 00079403 */  sra        $s2, $a3, 0x10
/* B0FF4 800B03F4 AFBF0068 */  sw         $ra, 0x68($sp)
/* B0FF8 800B03F8 AFB40060 */  sw         $s4, 0x60($sp)
/* B0FFC 800B03FC AFB10054 */  sw         $s1, 0x54($sp)
/* B1000 800B0400 AFB00050 */  sw         $s0, 0x50($sp)
/* B1004 800B0404 F7B60078 */  sdc1       $f22, 0x78($sp)
/* B1008 800B0408 1A400022 */  blez       $s2, .L800B0494
/* B100C 800B040C 00A0A821 */   addu      $s5, $a1, $zero
/* B1010 800B0410 3C01800E */  lui        $at, %hi(D_800E3848)
/* B1014 800B0414 D4363848 */  ldc1       $f22, %lo(D_800E3848)($at)
/* B1018 800B0418 3C110001 */  lui        $s1, 1
/* B101C 800B041C 3C140001 */  lui        $s4, 1
/* B1020 800B0420 02201021 */  addu       $v0, $s1, $zero
.L800B0424:
/* B1024 800B0424 02348821 */  addu       $s1, $s1, $s4
/* B1028 800B0428 27A40010 */  addiu      $a0, $sp, 0x10
/* B102C 800B042C 02602821 */  addu       $a1, $s3, $zero
/* B1030 800B0430 02A03021 */  addu       $a2, $s5, $zero
/* B1034 800B0434 0C02AB26 */  jal        Vec3A_BsubC
/* B1038 800B0438 00028403 */   sra       $s0, $v0, 0x10
/* B103C 800B043C 4600C021 */  cvt.d.s    $f0, $f24
/* B1040 800B0440 4620B003 */  div.d      $f0, $f22, $f0
/* B1044 800B0444 46200020 */  cvt.s.d    $f0, $f0
/* B1048 800B0448 44050000 */  mfc1       $a1, $f0
/* B104C 800B044C 0C02AD3C */  jal        multiVec3
/* B1050 800B0450 27A40010 */   addiu     $a0, $sp, 0x10
/* B1054 800B0454 0C02ABBB */  jal        vec3_normalize
/* B1058 800B0458 27A40010 */   addiu     $a0, $sp, 0x10
/* B105C 800B045C 4600A03C */  c.lt.s     $f20, $f0
/* B1060 800B0460 00000000 */  nop
/* B1064 800B0464 45030001 */  bc1tl      .L800B046C
/* B1068 800B0468 4600A006 */   mov.s     $f0, $f20
.L800B046C:
/* B106C 800B046C 44050000 */  mfc1       $a1, $f0
/* B1070 800B0470 0C02AD3C */  jal        multiVec3
/* B1074 800B0474 27A40010 */   addiu     $a0, $sp, 0x10
/* B1078 800B0478 02602021 */  addu       $a0, $s3, $zero
/* B107C 800B047C 02602821 */  addu       $a1, $s3, $zero
/* B1080 800B0480 0C02AB26 */  jal        Vec3A_BsubC
/* B1084 800B0484 27A60010 */   addiu     $a2, $sp, 0x10
/* B1088 800B0488 0212102A */  slt        $v0, $s0, $s2
/* B108C 800B048C 1440FFE5 */  bnez       $v0, .L800B0424
/* B1090 800B0490 02201021 */   addu      $v0, $s1, $zero
.L800B0494:
/* B1094 800B0494 8FBF0068 */  lw         $ra, 0x68($sp)
/* B1098 800B0498 8FB50064 */  lw         $s5, 0x64($sp)
/* B109C 800B049C 8FB40060 */  lw         $s4, 0x60($sp)
/* B10A0 800B04A0 8FB3005C */  lw         $s3, 0x5c($sp)
/* B10A4 800B04A4 8FB20058 */  lw         $s2, 0x58($sp)
/* B10A8 800B04A8 8FB10054 */  lw         $s1, 0x54($sp)
/* B10AC 800B04AC 8FB00050 */  lw         $s0, 0x50($sp)
/* B10B0 800B04B0 D7B80080 */  ldc1       $f24, 0x80($sp)
/* B10B4 800B04B4 D7B60078 */  ldc1       $f22, 0x78($sp)
/* B10B8 800B04B8 D7B40070 */  ldc1       $f20, 0x70($sp)
/* B10BC 800B04BC 03E00008 */  jr         $ra
/* B10C0 800B04C0 27BD0088 */   addiu     $sp, $sp, 0x88

glabel func_800B04C4
/* B10C4 800B04C4 C4A20000 */  lwc1       $f2, ($a1)
/* B10C8 800B04C8 E4820070 */  swc1       $f2, 0x70($a0)
/* B10CC 800B04CC C4A00004 */  lwc1       $f0, 4($a1)
/* B10D0 800B04D0 C482006C */  lwc1       $f2, 0x6c($a0)
/* B10D4 800B04D4 46020000 */  add.s      $f0, $f0, $f2
/* B10D8 800B04D8 E4800074 */  swc1       $f0, 0x74($a0)
/* B10DC 800B04DC C4A20008 */  lwc1       $f2, 8($a1)
/* B10E0 800B04E0 A480007C */  sh         $zero, 0x7c($a0)
/* B10E4 800B04E4 03E00008 */  jr         $ra
/* B10E8 800B04E8 E4820078 */   swc1      $f2, 0x78($a0)

glabel func_800B04EC
/* B10EC 800B04EC 84820082 */  lh         $v0, 0x82($a0)
/* B10F0 800B04F0 10400004 */  beqz       $v0, .L800B0504
/* B10F4 800B04F4 A4800080 */   sh        $zero, 0x80($a0)
/* B10F8 800B04F8 C480004C */  lwc1       $f0, 0x4c($a0)
/* B10FC 800B04FC AC800058 */  sw         $zero, 0x58($a0)
/* B1100 800B0500 E4800048 */  swc1       $f0, 0x48($a0)
.L800B0504:
/* B1104 800B0504 03E00008 */  jr         $ra
/* B1108 800B0508 00000000 */   nop

glabel func_800B050C
/* B110C 800B050C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B1110 800B0510 AFB00010 */  sw         $s0, 0x10($sp)
/* B1114 800B0514 00808021 */  addu       $s0, $a0, $zero
/* B1118 800B0518 AFBF0018 */  sw         $ra, 0x18($sp)
/* B111C 800B051C AFB10014 */  sw         $s1, 0x14($sp)
/* B1120 800B0520 C6000048 */  lwc1       $f0, 0x48($s0)
/* B1124 800B0524 C6020050 */  lwc1       $f2, 0x50($s0)
/* B1128 800B0528 4602003C */  c.lt.s     $f0, $f2
/* B112C 800B052C 00000000 */  nop
/* B1130 800B0530 45000003 */  bc1f       .L800B0540
/* B1134 800B0534 00A08821 */   addu      $s1, $a1, $zero
/* B1138 800B0538 E6020048 */  swc1       $f2, 0x48($s0)
/* B113C 800B053C C6000048 */  lwc1       $f0, 0x48($s0)
.L800B0540:
/* B1140 800B0540 C6020054 */  lwc1       $f2, 0x54($s0)
/* B1144 800B0544 4600103C */  c.lt.s     $f2, $f0
/* B1148 800B0548 00000000 */  nop
/* B114C 800B054C 45030001 */  bc1tl      .L800B0554
/* B1150 800B0550 E6020048 */   swc1      $f2, 0x48($s0)
.L800B0554:
/* B1154 800B0554 C6020030 */  lwc1       $f2, 0x30($s0)
/* B1158 800B0558 C604005C */  lwc1       $f4, 0x5c($s0)
/* B115C 800B055C 46041082 */  mul.s      $f2, $f2, $f4
/* B1160 800B0560 C600000C */  lwc1       $f0, 0xc($s0)
/* B1164 800B0564 46020001 */  sub.s      $f0, $f0, $f2
/* B1168 800B0568 3C01800E */  lui        $at, %hi(D_800E3850)
/* B116C 800B056C C42C3850 */  lwc1       $f12, %lo(D_800E3850)($at)
/* B1170 800B0570 E6200000 */  swc1       $f0, ($s1)
/* B1174 800B0574 C6020048 */  lwc1       $f2, 0x48($s0)
/* B1178 800B0578 46026301 */  sub.s      $f12, $f12, $f2
/* B117C 800B057C 3C01800E */  lui        $at, %hi(D_800E3854)
/* B1180 800B0580 C4203854 */  lwc1       $f0, %lo(D_800E3854)($at)
/* B1184 800B0584 46006302 */  mul.s      $f12, $f12, $f0
/* B1188 800B0588 0C03328C */  jal        __sinf
/* B118C 800B058C 00000000 */   nop
/* B1190 800B0590 C604005C */  lwc1       $f4, 0x5c($s0)
/* B1194 800B0594 46040002 */  mul.s      $f0, $f0, $f4
/* B1198 800B0598 C6020010 */  lwc1       $f2, 0x10($s0)
/* B119C 800B059C 46001080 */  add.s      $f2, $f2, $f0
/* B11A0 800B05A0 E6220004 */  swc1       $f2, 4($s1)
/* B11A4 800B05A4 C6040034 */  lwc1       $f4, 0x34($s0)
/* B11A8 800B05A8 C602005C */  lwc1       $f2, 0x5c($s0)
/* B11AC 800B05AC 46022102 */  mul.s      $f4, $f4, $f2
/* B11B0 800B05B0 C6000014 */  lwc1       $f0, 0x14($s0)
/* B11B4 800B05B4 8FBF0018 */  lw         $ra, 0x18($sp)
/* B11B8 800B05B8 46040001 */  sub.s      $f0, $f0, $f4
/* B11BC 800B05BC 8FB00010 */  lw         $s0, 0x10($sp)
/* B11C0 800B05C0 E6200008 */  swc1       $f0, 8($s1)
/* B11C4 800B05C4 8FB10014 */  lw         $s1, 0x14($sp)
/* B11C8 800B05C8 03E00008 */  jr         $ra
/* B11CC 800B05CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B05D0
/* B11D0 800B05D0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B11D4 800B05D4 AFB00010 */  sw         $s0, 0x10($sp)
/* B11D8 800B05D8 00808021 */  addu       $s0, $a0, $zero
/* B11DC 800B05DC AFBF001C */  sw         $ra, 0x1c($sp)
/* B11E0 800B05E0 AFB20018 */  sw         $s2, 0x18($sp)
/* B11E4 800B05E4 AFB10014 */  sw         $s1, 0x14($sp)
/* B11E8 800B05E8 F7B60028 */  sdc1       $f22, 0x28($sp)
/* B11EC 800B05EC F7B40020 */  sdc1       $f20, 0x20($sp)
/* B11F0 800B05F0 C60C0058 */  lwc1       $f12, 0x58($s0)
/* B11F4 800B05F4 3C01800E */  lui        $at, %hi(D_800E3858)
/* B11F8 800B05F8 C4363858 */  lwc1       $f22, %lo(D_800E3858)($at)
/* B11FC 800B05FC 46166302 */  mul.s      $f12, $f12, $f22
/* B1200 800B0600 00A09021 */  addu       $s2, $a1, $zero
/* B1204 800B0604 0C03328C */  jal        __sinf
/* B1208 800B0608 00C08821 */   addu      $s1, $a2, $zero
/* B120C 800B060C C60C0058 */  lwc1       $f12, 0x58($s0)
/* B1210 800B0610 46166302 */  mul.s      $f12, $f12, $f22
/* B1214 800B0614 0C02FB50 */  jal        __cosf
/* B1218 800B0618 46000506 */   mov.s     $f20, $f0
/* B121C 800B061C C6260000 */  lwc1       $f6, ($s1)
/* B1220 800B0620 46060182 */  mul.s      $f6, $f0, $f6
/* B1224 800B0624 C6220008 */  lwc1       $f2, 8($s1)
/* B1228 800B0628 4602A082 */  mul.s      $f2, $f20, $f2
/* B122C 800B062C 46023180 */  add.s      $f6, $f6, $f2
/* B1230 800B0630 E6460000 */  swc1       $f6, ($s2)
/* B1234 800B0634 C6220008 */  lwc1       $f2, 8($s1)
/* B1238 800B0638 46020002 */  mul.s      $f0, $f0, $f2
/* B123C 800B063C C6240000 */  lwc1       $f4, ($s1)
/* B1240 800B0640 4604A502 */  mul.s      $f20, $f20, $f4
/* B1244 800B0644 46140001 */  sub.s      $f0, $f0, $f20
/* B1248 800B0648 E6400008 */  swc1       $f0, 8($s2)
/* B124C 800B064C C602005C */  lwc1       $f2, 0x5c($s0)
/* B1250 800B0650 46023182 */  mul.s      $f6, $f6, $f2
/* B1254 800B0654 C600000C */  lwc1       $f0, 0xc($s0)
/* B1258 800B0658 46060000 */  add.s      $f0, $f0, $f6
/* B125C 800B065C 3C01800E */  lui        $at, %hi(D_800E385C)
/* B1260 800B0660 C42C385C */  lwc1       $f12, %lo(D_800E385C)($at)
/* B1264 800B0664 E6400000 */  swc1       $f0, ($s2)
/* B1268 800B0668 C6020048 */  lwc1       $f2, 0x48($s0)
/* B126C 800B066C 46026301 */  sub.s      $f12, $f12, $f2
/* B1270 800B0670 46166302 */  mul.s      $f12, $f12, $f22
/* B1274 800B0674 0C03328C */  jal        __sinf
/* B1278 800B0678 00000000 */   nop
/* B127C 800B067C C604005C */  lwc1       $f4, 0x5c($s0)
/* B1280 800B0680 46040002 */  mul.s      $f0, $f0, $f4
/* B1284 800B0684 C6020010 */  lwc1       $f2, 0x10($s0)
/* B1288 800B0688 46001080 */  add.s      $f2, $f2, $f0
/* B128C 800B068C C6440008 */  lwc1       $f4, 8($s2)
/* B1290 800B0690 E6420004 */  swc1       $f2, 4($s2)
/* B1294 800B0694 C602005C */  lwc1       $f2, 0x5c($s0)
/* B1298 800B0698 8FBF001C */  lw         $ra, 0x1c($sp)
/* B129C 800B069C 46022102 */  mul.s      $f4, $f4, $f2
/* B12A0 800B06A0 8FB10014 */  lw         $s1, 0x14($sp)
/* B12A4 800B06A4 D7B60028 */  ldc1       $f22, 0x28($sp)
/* B12A8 800B06A8 C6000014 */  lwc1       $f0, 0x14($s0)
/* B12AC 800B06AC D7B40020 */  ldc1       $f20, 0x20($sp)
/* B12B0 800B06B0 46040000 */  add.s      $f0, $f0, $f4
/* B12B4 800B06B4 8FB00010 */  lw         $s0, 0x10($sp)
/* B12B8 800B06B8 E6400008 */  swc1       $f0, 8($s2)
/* B12BC 800B06BC 8FB20018 */  lw         $s2, 0x18($sp)
/* B12C0 800B06C0 03E00008 */  jr         $ra
/* B12C4 800B06C4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel ProcessGameCamera_mode1
/* B12C8 800B06C8 27BDFD50 */  addiu      $sp, $sp, -0x2b0
/* B12CC 800B06CC AFB3026C */  sw         $s3, 0x26c($sp)
/* B12D0 800B06D0 00809821 */  addu       $s3, $a0, $zero
/* B12D4 800B06D4 00A02021 */  addu       $a0, $a1, $zero
/* B12D8 800B06D8 AFB00260 */  sw         $s0, 0x260($sp)
/* B12DC 800B06DC 26700024 */  addiu      $s0, $s3, 0x24
/* B12E0 800B06E0 02002821 */  addu       $a1, $s0, $zero
/* B12E4 800B06E4 AFB7027C */  sw         $s7, 0x27c($sp)
/* B12E8 800B06E8 00C0B821 */  addu       $s7, $a2, $zero
/* B12EC 800B06EC 00073C00 */  sll        $a3, $a3, 0x10
/* B12F0 800B06F0 AFBF0284 */  sw         $ra, 0x284($sp)
/* B12F4 800B06F4 AFBE0280 */  sw         $fp, 0x280($sp)
/* B12F8 800B06F8 AFB60278 */  sw         $s6, 0x278($sp)
/* B12FC 800B06FC AFB50274 */  sw         $s5, 0x274($sp)
/* B1300 800B0700 AFB40270 */  sw         $s4, 0x270($sp)
/* B1304 800B0704 AFB20268 */  sw         $s2, 0x268($sp)
/* B1308 800B0708 AFB10264 */  sw         $s1, 0x264($sp)
/* B130C 800B070C F7BC02A8 */  sdc1       $f28, 0x2a8($sp)
/* B1310 800B0710 F7BA02A0 */  sdc1       $f26, 0x2a0($sp)
/* B1314 800B0714 F7B80298 */  sdc1       $f24, 0x298($sp)
/* B1318 800B0718 F7B60290 */  sdc1       $f22, 0x290($sp)
/* B131C 800B071C F7B40288 */  sdc1       $f20, 0x288($sp)
/* B1320 800B0720 8E620000 */  lw         $v0, ($s3)
/* B1324 800B0724 8E630004 */  lw         $v1, 4($s3)
/* B1328 800B0728 8E680008 */  lw         $t0, 8($s3)
/* B132C 800B072C C7B802C0 */  lwc1       $f24, 0x2c0($sp)
/* B1330 800B0730 C7BA02C4 */  lwc1       $f26, 0x2c4($sp)
/* B1334 800B0734 C7BC02D4 */  lwc1       $f28, 0x2d4($sp)
/* B1338 800B0738 C7B402D8 */  lwc1       $f20, 0x2d8($sp)
/* B133C 800B073C C7B602E0 */  lwc1       $f22, 0x2e0($sp)
/* B1340 800B0740 97BE02EA */  lhu        $fp, 0x2ea($sp)
/* B1344 800B0744 97B602EE */  lhu        $s6, 0x2ee($sp)
/* B1348 800B0748 0007AC03 */  sra        $s5, $a3, 0x10
/* B134C 800B074C AFA20160 */  sw         $v0, 0x160($sp)
/* B1350 800B0750 AFA30164 */  sw         $v1, 0x164($sp)
/* B1354 800B0754 0C02AD17 */  jal        copyVec3
/* B1358 800B0758 AFA80168 */   sw        $t0, 0x168($sp)
/* B135C 800B075C 2664000C */  addiu      $a0, $s3, 0xc
/* B1360 800B0760 02002821 */  addu       $a1, $s0, $zero
/* B1364 800B0764 C6600028 */  lwc1       $f0, 0x28($s3)
/* B1368 800B0768 C662006C */  lwc1       $f2, 0x6c($s3)
/* B136C 800B076C 4406A000 */  mfc1       $a2, $f20
/* B1370 800B0770 46020000 */  add.s      $f0, $f0, $f2
/* B1374 800B0774 02A03821 */  addu       $a3, $s5, $zero
/* B1378 800B0778 E7B60010 */  swc1       $f22, 0x10($sp)
/* B137C 800B077C 0C02C0F2 */  jal        adust_camera_aim
/* B1380 800B0780 E6600028 */   swc1      $f0, 0x28($s3)
/* B1384 800B0784 9662006A */  lhu        $v0, 0x6a($s3)
/* B1388 800B0788 1040000B */  beqz       $v0, .L800B07B8
/* B138C 800B078C 02602021 */   addu      $a0, $s3, $zero
/* B1390 800B0790 02E02821 */  addu       $a1, $s7, $zero
/* B1394 800B0794 4407E000 */  mfc1       $a3, $f28
/* B1398 800B0798 C7A002C8 */  lwc1       $f0, 0x2c8($sp)
/* B139C 800B079C C7A202CC */  lwc1       $f2, 0x2cc($sp)
/* B13A0 800B07A0 02A03021 */  addu       $a2, $s5, $zero
/* B13A4 800B07A4 E7A00010 */  swc1       $f0, 0x10($sp)
/* B13A8 800B07A8 0C02C3EB */  jal        func_800B0FAC
/* B13AC 800B07AC E7A20014 */   swc1      $f2, 0x14($sp)
/* B13B0 800B07B0 0802C2C5 */  j          .L800B0B14
/* B13B4 800B07B4 8FBF0284 */   lw        $ra, 0x284($sp)
.L800B07B8:
/* B13B8 800B07B8 12C00004 */  beqz       $s6, .L800B07CC
/* B13BC 800B07BC C7A202D0 */   lwc1      $f2, 0x2d0($sp)
/* B13C0 800B07C0 C6600028 */  lwc1       $f0, 0x28($s3)
/* B13C4 800B07C4 46020000 */  add.s      $f0, $f0, $f2
/* B13C8 800B07C8 E660001C */  swc1       $f0, 0x1c($s3)
.L800B07CC:
/* B13CC 800B07CC 02602021 */  addu       $a0, $s3, $zero
/* B13D0 800B07D0 26720018 */  addiu      $s2, $s3, 0x18
/* B13D4 800B07D4 02402821 */  addu       $a1, $s2, $zero
/* B13D8 800B07D8 8FA602DC */  lw         $a2, 0x2dc($sp)
/* B13DC 800B07DC C7A002E4 */  lwc1       $f0, 0x2e4($sp)
/* B13E0 800B07E0 02A03821 */  addu       $a3, $s5, $zero
/* B13E4 800B07E4 0C02C0F2 */  jal        adust_camera_aim
/* B13E8 800B07E8 E7A00010 */   swc1      $f0, 0x10($sp)
/* B13EC 800B07EC 8E650024 */  lw         $a1, 0x24($s3)
/* B13F0 800B07F0 8E66002C */  lw         $a2, 0x2c($s3)
/* B13F4 800B07F4 0C02AD55 */  jal        setVec2
/* B13F8 800B07F8 27A40020 */   addiu     $a0, $sp, 0x20
/* B13FC 800B07FC 27B10060 */  addiu      $s1, $sp, 0x60
/* B1400 800B0800 8E650018 */  lw         $a1, 0x18($s3)
/* B1404 800B0804 8E660020 */  lw         $a2, 0x20($s3)
/* B1408 800B0808 0C02AD55 */  jal        setVec2
/* B140C 800B080C 02202021 */   addu      $a0, $s1, $zero
/* B1410 800B0810 27B000A0 */  addiu      $s0, $sp, 0xa0
/* B1414 800B0814 02002021 */  addu       $a0, $s0, $zero
/* B1418 800B0818 02202821 */  addu       $a1, $s1, $zero
/* B141C 800B081C 0C02AB1D */  jal        Vec2_Sub
/* B1420 800B0820 27A60020 */   addiu     $a2, $sp, 0x20
/* B1424 800B0824 0C02AB9F */  jal        vec2_normalize
/* B1428 800B0828 02002021 */   addu      $a0, $s0, $zero
/* B142C 800B082C 12C00021 */  beqz       $s6, .L800B08B4
/* B1430 800B0830 46000506 */   mov.s     $f20, $f0
/* B1434 800B0834 4618A03C */  c.lt.s     $f20, $f24
/* B1438 800B0838 00000000 */  nop
/* B143C 800B083C 4500000D */  bc1f       .L800B0874
/* B1440 800B0840 C7A400A0 */   lwc1      $f4, 0xa0($sp)
/* B1444 800B0844 4604C102 */  mul.s      $f4, $f24, $f4
/* B1448 800B0848 C7A600A4 */  lwc1       $f6, 0xa4($sp)
/* B144C 800B084C 4606C182 */  mul.s      $f6, $f24, $f6
/* B1450 800B0850 C7A00020 */  lwc1       $f0, 0x20($sp)
/* B1454 800B0854 46040000 */  add.s      $f0, $f0, $f4
/* B1458 800B0858 C7A20024 */  lwc1       $f2, 0x24($sp)
/* B145C 800B085C 46061080 */  add.s      $f2, $f2, $f6
/* B1460 800B0860 8E66001C */  lw         $a2, 0x1c($s3)
/* B1464 800B0864 44050000 */  mfc1       $a1, $f0
/* B1468 800B0868 44071000 */  mfc1       $a3, $f2
/* B146C 800B086C 0C02AD58 */  jal        setVec3
/* B1470 800B0870 02402021 */   addu      $a0, $s2, $zero
.L800B0874:
/* B1474 800B0874 4614D03C */  c.lt.s     $f26, $f20
/* B1478 800B0878 00000000 */  nop
/* B147C 800B087C 4500000D */  bc1f       .L800B08B4
/* B1480 800B0880 C7A400A0 */   lwc1      $f4, 0xa0($sp)
/* B1484 800B0884 4604D102 */  mul.s      $f4, $f26, $f4
/* B1488 800B0888 C7A600A4 */  lwc1       $f6, 0xa4($sp)
/* B148C 800B088C 4606D182 */  mul.s      $f6, $f26, $f6
/* B1490 800B0890 C7A00020 */  lwc1       $f0, 0x20($sp)
/* B1494 800B0894 46040000 */  add.s      $f0, $f0, $f4
/* B1498 800B0898 C7A20024 */  lwc1       $f2, 0x24($sp)
/* B149C 800B089C 46061080 */  add.s      $f2, $f2, $f6
/* B14A0 800B08A0 8E66001C */  lw         $a2, 0x1c($s3)
/* B14A4 800B08A4 44050000 */  mfc1       $a1, $f0
/* B14A8 800B08A8 44071000 */  mfc1       $a3, $f2
/* B14AC 800B08AC 0C02AD58 */  jal        setVec3
/* B14B0 800B08B0 02402021 */   addu      $a0, $s2, $zero
.L800B08B4:
/* B14B4 800B08B4 27B001A0 */  addiu      $s0, $sp, 0x1a0
/* B14B8 800B08B8 02002021 */  addu       $a0, $s0, $zero
/* B14BC 800B08BC 02602821 */  addu       $a1, $s3, $zero
/* B14C0 800B08C0 2671000C */  addiu      $s1, $s3, 0xc
/* B14C4 800B08C4 0C02AB26 */  jal        Vec3A_BsubC
/* B14C8 800B08C8 02203021 */   addu      $a2, $s1, $zero
/* B14CC 800B08CC AFA001A4 */  sw         $zero, 0x1a4($sp)
/* B14D0 800B08D0 0C02ABBB */  jal        vec3_normalize
/* B14D4 800B08D4 02002021 */   addu      $a0, $s0, $zero
/* B14D8 800B08D8 4618003C */  c.lt.s     $f0, $f24
/* B14DC 800B08DC 00000000 */  nop
/* B14E0 800B08E0 4500000B */  bc1f       .L800B0910
/* B14E4 800B08E4 0220A021 */   addu      $s4, $s1, $zero
/* B14E8 800B08E8 C7A401A0 */  lwc1       $f4, 0x1a0($sp)
/* B14EC 800B08EC 46182102 */  mul.s      $f4, $f4, $f24
/* B14F0 800B08F0 C7A601A8 */  lwc1       $f6, 0x1a8($sp)
/* B14F4 800B08F4 46183182 */  mul.s      $f6, $f6, $f24
/* B14F8 800B08F8 C662000C */  lwc1       $f2, 0xc($s3)
/* B14FC 800B08FC 46041080 */  add.s      $f2, $f2, $f4
/* B1500 800B0900 C6600014 */  lwc1       $f0, 0x14($s3)
/* B1504 800B0904 46060000 */  add.s      $f0, $f0, $f6
/* B1508 800B0908 E6620000 */  swc1       $f2, ($s3)
/* B150C 800B090C E6600008 */  swc1       $f0, 8($s3)
.L800B0910:
/* B1510 800B0910 27A50160 */  addiu      $a1, $sp, 0x160
/* B1514 800B0914 02603021 */  addu       $a2, $s3, $zero
/* B1518 800B0918 27B100E0 */  addiu      $s1, $sp, 0xe0
/* B151C 800B091C 27B00120 */  addiu      $s0, $sp, 0x120
/* B1520 800B0920 3C01800E */  lui        $at, %hi(D_800E3860)
/* B1524 800B0924 C4343860 */  lwc1       $f20, %lo(D_800E3860)($at)
/* B1528 800B0928 8E640088 */  lw         $a0, 0x88($s3)
/* B152C 800B092C 4407A000 */  mfc1       $a3, $f20
/* B1530 800B0930 24020001 */  addiu      $v0, $zero, 1
/* B1534 800B0934 AFB10010 */  sw         $s1, 0x10($sp)
/* B1538 800B0938 AFB00014 */  sw         $s0, 0x14($sp)
/* B153C 800B093C 0C02B7DE */  jal        func_800ADF78
/* B1540 800B0940 AFA20018 */   sw        $v0, 0x18($sp)
/* B1544 800B0944 1040000E */  beqz       $v0, .L800B0980
/* B1548 800B0948 00000000 */   nop
/* B154C 800B094C 4405A000 */  mfc1       $a1, $f20
/* B1550 800B0950 0C02AD3C */  jal        multiVec3
/* B1554 800B0954 02002021 */   addu      $a0, $s0, $zero
/* B1558 800B0958 02202021 */  addu       $a0, $s1, $zero
/* B155C 800B095C 00802821 */  addu       $a1, $a0, $zero
/* B1560 800B0960 0C02AB4D */  jal        vec3_sum
/* B1564 800B0964 02003021 */   addu      $a2, $s0, $zero
/* B1568 800B0968 8FA200E0 */  lw         $v0, 0xe0($sp)
/* B156C 800B096C 8FA300E4 */  lw         $v1, 0xe4($sp)
/* B1570 800B0970 8FA400E8 */  lw         $a0, 0xe8($sp)
/* B1574 800B0974 AE620000 */  sw         $v0, ($s3)
/* B1578 800B0978 AE630004 */  sw         $v1, 4($s3)
/* B157C 800B097C AE640008 */  sw         $a0, 8($s3)
.L800B0980:
/* B1580 800B0980 13C00019 */  beqz       $fp, .L800B09E8
/* B1584 800B0984 02602021 */   addu      $a0, $s3, $zero
/* B1588 800B0988 02602821 */  addu       $a1, $s3, $zero
/* B158C 800B098C 0C02AB26 */  jal        Vec3A_BsubC
/* B1590 800B0990 02803021 */   addu      $a2, $s4, $zero
/* B1594 800B0994 02402021 */  addu       $a0, $s2, $zero
/* B1598 800B0998 02402821 */  addu       $a1, $s2, $zero
/* B159C 800B099C 0C02AB26 */  jal        Vec3A_BsubC
/* B15A0 800B09A0 02803021 */   addu      $a2, $s4, $zero
/* B15A4 800B09A4 3C01800E */  lui        $at, %hi(D_800E3864)
/* B15A8 800B09A8 C4223864 */  lwc1       $f2, %lo(D_800E3864)($at)
/* B15AC 800B09AC 44950000 */  mtc1       $s5, $f0
/* B15B0 800B09B0 46800020 */  cvt.s.w    $f0, $f0
/* B15B4 800B09B4 46020002 */  mul.s      $f0, $f0, $f2
/* B15B8 800B09B8 02602021 */  addu       $a0, $s3, $zero
/* B15BC 800B09BC 44060000 */  mfc1       $a2, $f0
/* B15C0 800B09C0 0C02AC8F */  jal        func_800AB23C
/* B15C4 800B09C4 02402821 */   addu      $a1, $s2, $zero
/* B15C8 800B09C8 02602021 */  addu       $a0, $s3, $zero
/* B15CC 800B09CC 02602821 */  addu       $a1, $s3, $zero
/* B15D0 800B09D0 0C02AB4D */  jal        vec3_sum
/* B15D4 800B09D4 02803021 */   addu      $a2, $s4, $zero
/* B15D8 800B09D8 02402021 */  addu       $a0, $s2, $zero
/* B15DC 800B09DC 02402821 */  addu       $a1, $s2, $zero
/* B15E0 800B09E0 0C02AB4D */  jal        vec3_sum
/* B15E4 800B09E4 02803021 */   addu      $a2, $s4, $zero
.L800B09E8:
/* B15E8 800B09E8 86620084 */  lh         $v0, 0x84($s3)
/* B15EC 800B09EC 10400006 */  beqz       $v0, .L800B0A08
/* B15F0 800B09F0 96630084 */   lhu       $v1, 0x84($s3)
/* B15F4 800B09F4 00751023 */  subu       $v0, $v1, $s5
/* B15F8 800B09F8 A6620084 */  sh         $v0, 0x84($s3)
/* B15FC 800B09FC 00021400 */  sll        $v0, $v0, 0x10
/* B1600 800B0A00 04420001 */  bltzl      $v0, .L800B0A08
/* B1604 800B0A04 A6600084 */   sh        $zero, 0x84($s3)
.L800B0A08:
/* B1608 800B0A08 12C0003F */  beqz       $s6, .L800B0B08
/* B160C 800B0A0C 00000000 */   nop
/* B1610 800B0A10 86620084 */  lh         $v0, 0x84($s3)
/* B1614 800B0A14 1440003C */  bnez       $v0, .L800B0B08
/* B1618 800B0A18 02602021 */   addu      $a0, $s3, $zero
/* B161C 800B0A1C 0C02AB66 */  jal        get_vec3_proximity
/* B1620 800B0A20 02402821 */   addu      $a1, $s2, $zero
/* B1624 800B0A24 3C01800E */  lui        $at, %hi(D_800E3868)
/* B1628 800B0A28 C4223868 */  lwc1       $f2, %lo(D_800E3868)($at)
/* B162C 800B0A2C 4602003C */  c.lt.s     $f0, $f2
/* B1630 800B0A30 00000000 */  nop
/* B1634 800B0A34 45000034 */  bc1f       .L800B0B08
/* B1638 800B0A38 02802821 */   addu      $a1, $s4, $zero
/* B163C 800B0A3C 02403021 */  addu       $a2, $s2, $zero
/* B1640 800B0A40 3C01800E */  lui        $at, %hi(D_800E386C)
/* B1644 800B0A44 C434386C */  lwc1       $f20, %lo(D_800E386C)($at)
/* B1648 800B0A48 8E640088 */  lw         $a0, 0x88($s3)
/* B164C 800B0A4C 4407A000 */  mfc1       $a3, $f20
/* B1650 800B0A50 24150001 */  addiu      $s5, $zero, 1
/* B1654 800B0A54 AFA00010 */  sw         $zero, 0x10($sp)
/* B1658 800B0A58 AFA00014 */  sw         $zero, 0x14($sp)
/* B165C 800B0A5C 0C02B7DE */  jal        func_800ADF78
/* B1660 800B0A60 AFB50018 */   sw        $s5, 0x18($sp)
/* B1664 800B0A64 10400028 */  beqz       $v0, .L800B0B08
/* B1668 800B0A68 2402012C */   addiu     $v0, $zero, 0x12c
/* B166C 800B0A6C A6620084 */  sh         $v0, 0x84($s3)
/* B1670 800B0A70 8EE50000 */  lw         $a1, ($s7)
/* B1674 800B0A74 8EE60008 */  lw         $a2, 8($s7)
/* B1678 800B0A78 0C02AD55 */  jal        setVec2
/* B167C 800B0A7C 27A400A0 */   addiu     $a0, $sp, 0xa0
/* B1680 800B0A80 0C02AB9F */  jal        vec2_normalize
/* B1684 800B0A84 27A400A0 */   addiu     $a0, $sp, 0xa0
/* B1688 800B0A88 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B168C 800B0A8C 4602E082 */  mul.s      $f2, $f28, $f2
/* B1690 800B0A90 C7A400A4 */  lwc1       $f4, 0xa4($sp)
/* B1694 800B0A94 4604E102 */  mul.s      $f4, $f28, $f4
/* B1698 800B0A98 C7A00020 */  lwc1       $f0, 0x20($sp)
/* B169C 800B0A9C 46020000 */  add.s      $f0, $f0, $f2
/* B16A0 800B0AA0 C7A60024 */  lwc1       $f6, 0x24($sp)
/* B16A4 800B0AA4 27B001E0 */  addiu      $s0, $sp, 0x1e0
/* B16A8 800B0AA8 46043180 */  add.s      $f6, $f6, $f4
/* B16AC 800B0AAC 8E66001C */  lw         $a2, 0x1c($s3)
/* B16B0 800B0AB0 44050000 */  mfc1       $a1, $f0
/* B16B4 800B0AB4 44073000 */  mfc1       $a3, $f6
/* B16B8 800B0AB8 0C02AD58 */  jal        setVec3
/* B16BC 800B0ABC 02002021 */   addu      $a0, $s0, $zero
/* B16C0 800B0AC0 02802821 */  addu       $a1, $s4, $zero
/* B16C4 800B0AC4 02003021 */  addu       $a2, $s0, $zero
/* B16C8 800B0AC8 8E640088 */  lw         $a0, 0x88($s3)
/* B16CC 800B0ACC 4407A000 */  mfc1       $a3, $f20
/* B16D0 800B0AD0 27B10220 */  addiu      $s1, $sp, 0x220
/* B16D4 800B0AD4 AFB10010 */  sw         $s1, 0x10($sp)
/* B16D8 800B0AD8 AFA00014 */  sw         $zero, 0x14($sp)
/* B16DC 800B0ADC 0C02B7DE */  jal        func_800ADF78
/* B16E0 800B0AE0 AFB50018 */   sw        $s5, 0x18($sp)
/* B16E4 800B0AE4 14400006 */  bnez       $v0, .L800B0B00
/* B16E8 800B0AE8 02202021 */   addu      $a0, $s1, $zero
/* B16EC 800B0AEC 02002021 */  addu       $a0, $s0, $zero
/* B16F0 800B0AF0 0C02AD17 */  jal        copyVec3
/* B16F4 800B0AF4 02402821 */   addu      $a1, $s2, $zero
/* B16F8 800B0AF8 0802C2C2 */  j          .L800B0B08
/* B16FC 800B0AFC 00000000 */   nop
.L800B0B00:
/* B1700 800B0B00 0C02AD17 */  jal        copyVec3
/* B1704 800B0B04 02402821 */   addu      $a1, $s2, $zero
.L800B0B08:
/* B1708 800B0B08 0C02C0C6 */  jal        camera_orient
/* B170C 800B0B0C 02602021 */   addu      $a0, $s3, $zero
/* B1710 800B0B10 8FBF0284 */  lw         $ra, 0x284($sp)
.L800B0B14:
/* B1714 800B0B14 8FBE0280 */  lw         $fp, 0x280($sp)
/* B1718 800B0B18 8FB7027C */  lw         $s7, 0x27c($sp)
/* B171C 800B0B1C 8FB60278 */  lw         $s6, 0x278($sp)
/* B1720 800B0B20 8FB50274 */  lw         $s5, 0x274($sp)
/* B1724 800B0B24 8FB40270 */  lw         $s4, 0x270($sp)
/* B1728 800B0B28 8FB3026C */  lw         $s3, 0x26c($sp)
/* B172C 800B0B2C 8FB20268 */  lw         $s2, 0x268($sp)
/* B1730 800B0B30 8FB10264 */  lw         $s1, 0x264($sp)
/* B1734 800B0B34 8FB00260 */  lw         $s0, 0x260($sp)
/* B1738 800B0B38 D7BC02A8 */  ldc1       $f28, 0x2a8($sp)
/* B173C 800B0B3C D7BA02A0 */  ldc1       $f26, 0x2a0($sp)
/* B1740 800B0B40 D7B80298 */  ldc1       $f24, 0x298($sp)
/* B1744 800B0B44 D7B60290 */  ldc1       $f22, 0x290($sp)
/* B1748 800B0B48 D7B40288 */  ldc1       $f20, 0x288($sp)
/* B174C 800B0B4C 03E00008 */  jr         $ra
/* B1750 800B0B50 27BD02B0 */   addiu     $sp, $sp, 0x2b0

glabel ProcessGameCamera_mode0
/* B1754 800B0B54 27BDFEF0 */  addiu      $sp, $sp, -0x110
/* B1758 800B0B58 AFB300EC */  sw         $s3, 0xec($sp)
/* B175C 800B0B5C 00809821 */  addu       $s3, $a0, $zero
/* B1760 800B0B60 00A04021 */  addu       $t0, $a1, $zero
/* B1764 800B0B64 AFB500F4 */  sw         $s5, 0xf4($sp)
/* B1768 800B0B68 00C0A821 */  addu       $s5, $a2, $zero
/* B176C 800B0B6C 00073C00 */  sll        $a3, $a3, 0x10
/* B1770 800B0B70 AFBF00FC */  sw         $ra, 0xfc($sp)
/* B1774 800B0B74 AFB600F8 */  sw         $s6, 0xf8($sp)
/* B1778 800B0B78 AFB400F0 */  sw         $s4, 0xf0($sp)
/* B177C 800B0B7C AFB200E8 */  sw         $s2, 0xe8($sp)
/* B1780 800B0B80 AFB100E4 */  sw         $s1, 0xe4($sp)
/* B1784 800B0B84 AFB000E0 */  sw         $s0, 0xe0($sp)
/* B1788 800B0B88 F7B60108 */  sdc1       $f22, 0x108($sp)
/* B178C 800B0B8C F7B40100 */  sdc1       $f20, 0x100($sp)
/* B1790 800B0B90 8E620000 */  lw         $v0, ($s3)
/* B1794 800B0B94 8E630004 */  lw         $v1, 4($s3)
/* B1798 800B0B98 8E640008 */  lw         $a0, 8($s3)
/* B179C 800B0B9C 97B60122 */  lhu        $s6, 0x122($sp)
/* B17A0 800B0BA0 4480B000 */  mtc1       $zero, $f22
/* B17A4 800B0BA4 0007A403 */  sra        $s4, $a3, 0x10
/* B17A8 800B0BA8 AFA200A0 */  sw         $v0, 0xa0($sp)
/* B17AC 800B0BAC AFA300A4 */  sw         $v1, 0xa4($sp)
/* B17B0 800B0BB0 AFA400A8 */  sw         $a0, 0xa8($sp)
/* B17B4 800B0BB4 86620068 */  lh         $v0, 0x68($s3)
/* B17B8 800B0BB8 10400009 */  beqz       $v0, .L800B0BE0
/* B17BC 800B0BBC 96630068 */   lhu       $v1, 0x68($s3)
/* B17C0 800B0BC0 00741023 */  subu       $v0, $v1, $s4
/* B17C4 800B0BC4 A6620068 */  sh         $v0, 0x68($s3)
/* B17C8 800B0BC8 00021400 */  sll        $v0, $v0, 0x10
/* B17CC 800B0BCC 5C400005 */  bgtzl      $v0, .L800B0BE4
/* B17D0 800B0BD0 9663006A */   lhu       $v1, 0x6a($s3)
/* B17D4 800B0BD4 C6600060 */  lwc1       $f0, 0x60($s3)
/* B17D8 800B0BD8 A6600068 */  sh         $zero, 0x68($s3)
/* B17DC 800B0BDC E660005C */  swc1       $f0, 0x5c($s3)
.L800B0BE0:
/* B17E0 800B0BE0 9663006A */  lhu        $v1, 0x6a($s3)
.L800B0BE4:
/* B17E4 800B0BE4 1060001E */  beqz       $v1, .L800B0C60
/* B17E8 800B0BE8 24020002 */   addiu     $v0, $zero, 2
/* B17EC 800B0BEC 54620001 */  bnel       $v1, $v0, .L800B0BF4
/* B17F0 800B0BF0 AE600048 */   sw        $zero, 0x48($s3)
.L800B0BF4:
/* B17F4 800B0BF4 01002021 */  addu       $a0, $t0, $zero
/* B17F8 800B0BF8 26700024 */  addiu      $s0, $s3, 0x24
/* B17FC 800B0BFC 0C02AD17 */  jal        copyVec3
/* B1800 800B0C00 02002821 */   addu      $a1, $s0, $zero
/* B1804 800B0C04 2664000C */  addiu      $a0, $s3, 0xc
/* B1808 800B0C08 02002821 */  addu       $a1, $s0, $zero
/* B180C 800B0C0C C6600028 */  lwc1       $f0, 0x28($s3)
/* B1810 800B0C10 C662006C */  lwc1       $f2, 0x6c($s3)
/* B1814 800B0C14 3C064180 */  lui        $a2, 0x4180
/* B1818 800B0C18 3C01800E */  lui        $at, %hi(D_800E3870)
/* B181C 800B0C1C C4243870 */  lwc1       $f4, %lo(D_800E3870)($at)
/* B1820 800B0C20 46020000 */  add.s      $f0, $f0, $f2
/* B1824 800B0C24 02803821 */  addu       $a3, $s4, $zero
/* B1828 800B0C28 E7A40010 */  swc1       $f4, 0x10($sp)
/* B182C 800B0C2C 0C02C0F2 */  jal        adust_camera_aim
/* B1830 800B0C30 E6600028 */   swc1      $f0, 0x28($s3)
/* B1834 800B0C34 02602021 */  addu       $a0, $s3, $zero
/* B1838 800B0C38 3C01800E */  lui        $at, %hi(D_800E3874)
/* B183C 800B0C3C C4203874 */  lwc1       $f0, %lo(D_800E3874)($at)
/* B1840 800B0C40 02A02821 */  addu       $a1, $s5, $zero
/* B1844 800B0C44 AFA00010 */  sw         $zero, 0x10($sp)
/* B1848 800B0C48 E7A00014 */  swc1       $f0, 0x14($sp)
/* B184C 800B0C4C 8C87005C */  lw         $a3, 0x5c($a0)
/* B1850 800B0C50 0C02C3EB */  jal        func_800B0FAC
/* B1854 800B0C54 02803021 */   addu      $a2, $s4, $zero
/* B1858 800B0C58 0802C3E0 */  j          .L800B0F80
/* B185C 800B0C5C 8FBF00FC */   lw        $ra, 0xfc($sp)
.L800B0C60:
/* B1860 800B0C60 2672000C */  addiu      $s2, $s3, 0xc
/* B1864 800B0C64 C5020000 */  lwc1       $f2, ($t0)
/* B1868 800B0C68 02402021 */  addu       $a0, $s2, $zero
/* B186C 800B0C6C E6620024 */  swc1       $f2, 0x24($s3)
/* B1870 800B0C70 C5000004 */  lwc1       $f0, 4($t0)
/* B1874 800B0C74 C662006C */  lwc1       $f2, 0x6c($s3)
/* B1878 800B0C78 26710024 */  addiu      $s1, $s3, 0x24
/* B187C 800B0C7C 46020000 */  add.s      $f0, $f0, $f2
/* B1880 800B0C80 3C064140 */  lui        $a2, 0x4140
/* B1884 800B0C84 02202821 */  addu       $a1, $s1, $zero
/* B1888 800B0C88 E6600028 */  swc1       $f0, 0x28($s3)
/* B188C 800B0C8C C5020008 */  lwc1       $f2, 8($t0)
/* B1890 800B0C90 3C01800E */  lui        $at, %hi(D_800E3878)
/* B1894 800B0C94 C4203878 */  lwc1       $f0, %lo(D_800E3878)($at)
/* B1898 800B0C98 02803821 */  addu       $a3, $s4, $zero
/* B189C 800B0C9C E7A00010 */  swc1       $f0, 0x10($sp)
/* B18A0 800B0CA0 0C02C0F2 */  jal        adust_camera_aim
/* B18A4 800B0CA4 E662002C */   swc1      $f2, 0x2c($s3)
/* B18A8 800B0CA8 27B00060 */  addiu      $s0, $sp, 0x60
/* B18AC 800B0CAC 02002021 */  addu       $a0, $s0, $zero
/* B18B0 800B0CB0 02202821 */  addu       $a1, $s1, $zero
/* B18B4 800B0CB4 0C02AB26 */  jal        Vec3A_BsubC
/* B18B8 800B0CB8 26660070 */   addiu     $a2, $s3, 0x70
/* B18BC 800B0CBC 0C02AB0F */  jal        vec3hypotenouse
/* B18C0 800B0CC0 02002021 */   addu      $a0, $s0, $zero
/* B18C4 800B0CC4 46000506 */  mov.s      $f20, $f0
/* B18C8 800B0CC8 8662007E */  lh         $v0, 0x7e($s3)
/* B18CC 800B0CCC 44820000 */  mtc1       $v0, $f0
/* B18D0 800B0CD0 46800020 */  cvt.s.w    $f0, $f0
/* B18D4 800B0CD4 4614003C */  c.lt.s     $f0, $f20
/* B18D8 800B0CD8 00000000 */  nop
/* B18DC 800B0CDC 45000003 */  bc1f       .L800B0CEC
/* B18E0 800B0CE0 02008821 */   addu      $s1, $s0, $zero
/* B18E4 800B0CE4 24020001 */  addiu      $v0, $zero, 1
/* B18E8 800B0CE8 A662007C */  sh         $v0, 0x7c($s3)
.L800B0CEC:
/* B18EC 800B0CEC 3C01800E */  lui        $at, %hi(D_800E3880)
/* B18F0 800B0CF0 D4223880 */  ldc1       $f2, %lo(D_800E3880)($at)
/* B18F4 800B0CF4 4600A021 */  cvt.d.s    $f0, $f20
/* B18F8 800B0CF8 4620103C */  c.lt.d     $f2, $f0
/* B18FC 800B0CFC 00000000 */  nop
/* B1900 800B0D00 45000004 */  bc1f       .L800B0D14
/* B1904 800B0D04 00000000 */   nop
/* B1908 800B0D08 0C02C13B */  jal        func_800B04EC
/* B190C 800B0D0C 02602021 */   addu      $a0, $s3, $zero
/* B1910 800B0D10 A660007C */  sh         $zero, 0x7c($s3)
.L800B0D14:
/* B1914 800B0D14 0C02C0C6 */  jal        camera_orient
/* B1918 800B0D18 02602021 */   addu      $a0, $s3, $zero
/* B191C 800B0D1C 02602021 */  addu       $a0, $s3, $zero
/* B1920 800B0D20 26700018 */  addiu      $s0, $s3, 0x18
/* B1924 800B0D24 0C02C143 */  jal        func_800B050C
/* B1928 800B0D28 02002821 */   addu      $a1, $s0, $zero
/* B192C 800B0D2C 02602021 */  addu       $a0, $s3, $zero
/* B1930 800B0D30 27A50020 */  addiu      $a1, $sp, 0x20
/* B1934 800B0D34 0C02C174 */  jal        func_800B05D0
/* B1938 800B0D38 02A03021 */   addu      $a2, $s5, $zero
/* B193C 800B0D3C 8662007C */  lh         $v0, 0x7c($s3)
/* B1940 800B0D40 50400005 */  beql       $v0, $zero, .L800B0D58
/* B1944 800B0D44 8662007E */   lh        $v0, 0x7e($s3)
/* B1948 800B0D48 3C01800E */  lui        $at, %hi(D_800E3888)
/* B194C 800B0D4C C4343888 */  lwc1       $f20, %lo(D_800E3888)($at)
/* B1950 800B0D50 0802C365 */  j          .L800B0D94
/* B1954 800B0D54 86620080 */   lh        $v0, 0x80($s3)
.L800B0D58:
/* B1958 800B0D58 44821000 */  mtc1       $v0, $f2
/* B195C 800B0D5C 468010A0 */  cvt.s.w    $f2, $f2
/* B1960 800B0D60 46141001 */  sub.s      $f0, $f2, $f20
/* B1964 800B0D64 3C01800E */  lui        $at, %hi(D_800E388C)
/* B1968 800B0D68 C424388C */  lwc1       $f4, %lo(D_800E388C)($at)
/* B196C 800B0D6C 46020003 */  div.s      $f0, $f0, $f2
/* B1970 800B0D70 46040002 */  mul.s      $f0, $f0, $f4
/* B1974 800B0D74 3C01800E */  lui        $at, %hi(D_800E3890)
/* B1978 800B0D78 C4223890 */  lwc1       $f2, %lo(D_800E3890)($at)
/* B197C 800B0D7C 46020500 */  add.s      $f20, $f0, $f2
/* B1980 800B0D80 4602A03C */  c.lt.s     $f20, $f2
/* B1984 800B0D84 00000000 */  nop
/* B1988 800B0D88 45030001 */  bc1tl      .L800B0D90
/* B198C 800B0D8C 46001506 */   mov.s     $f20, $f2
.L800B0D90:
/* B1990 800B0D90 86620080 */  lh         $v0, 0x80($s3)
.L800B0D94:
/* B1994 800B0D94 10400014 */  beqz       $v0, .L800B0DE8
/* B1998 800B0D98 02002021 */   addu      $a0, $s0, $zero
/* B199C 800B0D9C 0C02AB66 */  jal        get_vec3_proximity
/* B19A0 800B0DA0 27A50020 */   addiu     $a1, $sp, 0x20
/* B19A4 800B0DA4 46000021 */  cvt.d.s    $f0, $f0
/* B19A8 800B0DA8 3C01800E */  lui        $at, %hi(D_800E3898)
/* B19AC 800B0DAC D4223898 */  ldc1       $f2, %lo(D_800E3898)($at)
/* B19B0 800B0DB0 3C01800E */  lui        $at, %hi(D_800E38A0)
/* B19B4 800B0DB4 C43438A0 */  lwc1       $f20, %lo(D_800E38A0)($at)
/* B19B8 800B0DB8 4622003C */  c.lt.d     $f0, $f2
/* B19BC 800B0DBC 00000000 */  nop
/* B19C0 800B0DC0 4500000A */  bc1f       .L800B0DEC
/* B19C4 800B0DC4 02002021 */   addu      $a0, $s0, $zero
/* B19C8 800B0DC8 96620080 */  lhu        $v0, 0x80($s3)
/* B19CC 800B0DCC 2442FFFF */  addiu      $v0, $v0, -1
/* B19D0 800B0DD0 A6620080 */  sh         $v0, 0x80($s3)
/* B19D4 800B0DD4 00021400 */  sll        $v0, $v0, 0x10
/* B19D8 800B0DD8 1C400005 */  bgtz       $v0, .L800B0DF0
/* B19DC 800B0DDC 27A50020 */   addiu     $a1, $sp, 0x20
/* B19E0 800B0DE0 0C02C13B */  jal        func_800B04EC
/* B19E4 800B0DE4 02602021 */   addu      $a0, $s3, $zero
.L800B0DE8:
/* B19E8 800B0DE8 02002021 */  addu       $a0, $s0, $zero
.L800B0DEC:
/* B19EC 800B0DEC 27A50020 */  addiu      $a1, $sp, 0x20
.L800B0DF0:
/* B19F0 800B0DF0 4406A000 */  mfc1       $a2, $f20
/* B19F4 800B0DF4 3C01800E */  lui        $at, %hi(D_800E38A4)
/* B19F8 800B0DF8 C43438A4 */  lwc1       $f20, %lo(D_800E38A4)($at)
/* B19FC 800B0DFC 02803821 */  addu       $a3, $s4, $zero
/* B1A00 800B0E00 0C02C0F2 */  jal        adust_camera_aim
/* B1A04 800B0E04 E7B40010 */   swc1      $f20, 0x10($sp)
/* B1A08 800B0E08 02202021 */  addu       $a0, $s1, $zero
/* B1A0C 800B0E0C 02602821 */  addu       $a1, $s3, $zero
/* B1A10 800B0E10 0C02AB26 */  jal        Vec3A_BsubC
/* B1A14 800B0E14 02403021 */   addu      $a2, $s2, $zero
/* B1A18 800B0E18 02202021 */  addu       $a0, $s1, $zero
/* B1A1C 800B0E1C 0C02ABBB */  jal        vec3_normalize
/* B1A20 800B0E20 AFA00064 */   sw        $zero, 0x64($sp)
/* B1A24 800B0E24 C6620064 */  lwc1       $f2, 0x64($s3)
/* B1A28 800B0E28 4602003C */  c.lt.s     $f0, $f2
/* B1A2C 800B0E2C 00000000 */  nop
/* B1A30 800B0E30 4500000A */  bc1f       .L800B0E5C
/* B1A34 800B0E34 C7A40060 */   lwc1      $f4, 0x60($sp)
/* B1A38 800B0E38 46022102 */  mul.s      $f4, $f4, $f2
/* B1A3C 800B0E3C C7A60068 */  lwc1       $f6, 0x68($sp)
/* B1A40 800B0E40 46023182 */  mul.s      $f6, $f6, $f2
/* B1A44 800B0E44 C662000C */  lwc1       $f2, 0xc($s3)
/* B1A48 800B0E48 46041080 */  add.s      $f2, $f2, $f4
/* B1A4C 800B0E4C C6600014 */  lwc1       $f0, 0x14($s3)
/* B1A50 800B0E50 46060000 */  add.s      $f0, $f0, $f6
/* B1A54 800B0E54 E6620000 */  swc1       $f2, ($s3)
/* B1A58 800B0E58 E6600008 */  swc1       $f0, 8($s3)
.L800B0E5C:
/* B1A5C 800B0E5C 44800000 */  mtc1       $zero, $f0
/* B1A60 800B0E60 4616003C */  c.lt.s     $f0, $f22
/* B1A64 800B0E64 00000000 */  nop
/* B1A68 800B0E68 45000017 */  bc1f       .L800B0EC8
/* B1A6C 800B0E6C 02602021 */   addu      $a0, $s3, $zero
/* B1A70 800B0E70 02602821 */  addu       $a1, $s3, $zero
/* B1A74 800B0E74 0C02AB26 */  jal        Vec3A_BsubC
/* B1A78 800B0E78 02403021 */   addu      $a2, $s2, $zero
/* B1A7C 800B0E7C 02002021 */  addu       $a0, $s0, $zero
/* B1A80 800B0E80 02002821 */  addu       $a1, $s0, $zero
/* B1A84 800B0E84 0C02AB26 */  jal        Vec3A_BsubC
/* B1A88 800B0E88 02403021 */   addu      $a2, $s2, $zero
/* B1A8C 800B0E8C 44940000 */  mtc1       $s4, $f0
/* B1A90 800B0E90 46800020 */  cvt.s.w    $f0, $f0
/* B1A94 800B0E94 4600B582 */  mul.s      $f22, $f22, $f0
/* B1A98 800B0E98 02602021 */  addu       $a0, $s3, $zero
/* B1A9C 800B0E9C 4406B000 */  mfc1       $a2, $f22
/* B1AA0 800B0EA0 0C02AC8F */  jal        func_800AB23C
/* B1AA4 800B0EA4 02002821 */   addu      $a1, $s0, $zero
/* B1AA8 800B0EA8 02602021 */  addu       $a0, $s3, $zero
/* B1AAC 800B0EAC 02602821 */  addu       $a1, $s3, $zero
/* B1AB0 800B0EB0 0C02AB4D */  jal        vec3_sum
/* B1AB4 800B0EB4 02403021 */   addu      $a2, $s2, $zero
/* B1AB8 800B0EB8 02002021 */  addu       $a0, $s0, $zero
/* B1ABC 800B0EBC 02002821 */  addu       $a1, $s0, $zero
/* B1AC0 800B0EC0 0C02AB4D */  jal        vec3_sum
/* B1AC4 800B0EC4 02403021 */   addu      $a2, $s2, $zero
.L800B0EC8:
/* B1AC8 800B0EC8 02602021 */  addu       $a0, $s3, $zero
/* B1ACC 800B0ECC 02002821 */  addu       $a1, $s0, $zero
/* B1AD0 800B0ED0 3C064180 */  lui        $a2, 0x4180
/* B1AD4 800B0ED4 02803821 */  addu       $a3, $s4, $zero
/* B1AD8 800B0ED8 0C02C0F2 */  jal        adust_camera_aim
/* B1ADC 800B0EDC E7B40010 */   swc1      $f20, 0x10($sp)
/* B1AE0 800B0EE0 86620080 */  lh         $v0, 0x80($s3)
/* B1AE4 800B0EE4 28420002 */  slti       $v0, $v0, 2
/* B1AE8 800B0EE8 10400010 */  beqz       $v0, .L800B0F2C
/* B1AEC 800B0EEC 27A500A0 */   addiu     $a1, $sp, 0xa0
/* B1AF0 800B0EF0 12C0000D */  beqz       $s6, .L800B0F28
/* B1AF4 800B0EF4 02602821 */   addu      $a1, $s3, $zero
/* B1AF8 800B0EF8 8E640088 */  lw         $a0, 0x88($s3)
/* B1AFC 800B0EFC 3C073E80 */  lui        $a3, 0x3e80
/* B1B00 800B0F00 02403021 */  addu       $a2, $s2, $zero
/* B1B04 800B0F04 AFA00010 */  sw         $zero, 0x10($sp)
/* B1B08 800B0F08 AFA00014 */  sw         $zero, 0x14($sp)
/* B1B0C 800B0F0C 0C02B7DE */  jal        func_800ADF78
/* B1B10 800B0F10 AFA00018 */   sw        $zero, 0x18($sp)
/* B1B14 800B0F14 10400003 */  beqz       $v0, .L800B0F24
/* B1B18 800B0F18 24020001 */   addiu     $v0, $zero, 1
/* B1B1C 800B0F1C 0802C3CA */  j          .L800B0F28
/* B1B20 800B0F20 A6600082 */   sh        $zero, 0x82($s3)
.L800B0F24:
/* B1B24 800B0F24 A6620082 */  sh         $v0, 0x82($s3)
.L800B0F28:
/* B1B28 800B0F28 27A500A0 */  addiu      $a1, $sp, 0xa0
.L800B0F2C:
/* B1B2C 800B0F2C 02603021 */  addu       $a2, $s3, $zero
/* B1B30 800B0F30 8E640088 */  lw         $a0, 0x88($s3)
/* B1B34 800B0F34 3C073E80 */  lui        $a3, 0x3e80
/* B1B38 800B0F38 24100001 */  addiu      $s0, $zero, 1
/* B1B3C 800B0F3C AFA00010 */  sw         $zero, 0x10($sp)
/* B1B40 800B0F40 AFA00014 */  sw         $zero, 0x14($sp)
/* B1B44 800B0F44 0C02B7DE */  jal        func_800ADF78
/* B1B48 800B0F48 AFB00018 */   sw        $s0, 0x18($sp)
/* B1B4C 800B0F4C 10400009 */  beqz       $v0, .L800B0F74
/* B1B50 800B0F50 00000000 */   nop
/* B1B54 800B0F54 86620080 */  lh         $v0, 0x80($s3)
/* B1B58 800B0F58 14500006 */  bne        $v0, $s0, .L800B0F74
/* B1B5C 800B0F5C 00000000 */   nop
/* B1B60 800B0F60 86620082 */  lh         $v0, 0x82($s3)
/* B1B64 800B0F64 10400003 */  beqz       $v0, .L800B0F74
/* B1B68 800B0F68 00000000 */   nop
/* B1B6C 800B0F6C 0C02C13B */  jal        func_800B04EC
/* B1B70 800B0F70 02602021 */   addu      $a0, $s3, $zero
.L800B0F74:
/* B1B74 800B0F74 0C02C0C6 */  jal        camera_orient
/* B1B78 800B0F78 02602021 */   addu      $a0, $s3, $zero
/* B1B7C 800B0F7C 8FBF00FC */  lw         $ra, 0xfc($sp)
.L800B0F80:
/* B1B80 800B0F80 8FB600F8 */  lw         $s6, 0xf8($sp)
/* B1B84 800B0F84 8FB500F4 */  lw         $s5, 0xf4($sp)
/* B1B88 800B0F88 8FB400F0 */  lw         $s4, 0xf0($sp)
/* B1B8C 800B0F8C 8FB300EC */  lw         $s3, 0xec($sp)
/* B1B90 800B0F90 8FB200E8 */  lw         $s2, 0xe8($sp)
/* B1B94 800B0F94 8FB100E4 */  lw         $s1, 0xe4($sp)
/* B1B98 800B0F98 8FB000E0 */  lw         $s0, 0xe0($sp)
/* B1B9C 800B0F9C D7B60108 */  ldc1       $f22, 0x108($sp)
/* B1BA0 800B0FA0 D7B40100 */  ldc1       $f20, 0x100($sp)
/* B1BA4 800B0FA4 03E00008 */  jr         $ra
/* B1BA8 800B0FA8 27BD0110 */   addiu     $sp, $sp, 0x110

glabel func_800B0FAC
/* B1BAC 800B0FAC 27BDFDE8 */  addiu      $sp, $sp, -0x218
/* B1BB0 800B0FB0 AFB101E4 */  sw         $s1, 0x1e4($sp)
/* B1BB4 800B0FB4 00808821 */  addu       $s1, $a0, $zero
/* B1BB8 800B0FB8 00063400 */  sll        $a2, $a2, 0x10
/* B1BBC 800B0FBC AFB301EC */  sw         $s3, 0x1ec($sp)
/* B1BC0 800B0FC0 24030001 */  addiu      $v1, $zero, 1
/* B1BC4 800B0FC4 AFBF0200 */  sw         $ra, 0x200($sp)
/* B1BC8 800B0FC8 AFB701FC */  sw         $s7, 0x1fc($sp)
/* B1BCC 800B0FCC AFB601F8 */  sw         $s6, 0x1f8($sp)
/* B1BD0 800B0FD0 AFB501F4 */  sw         $s5, 0x1f4($sp)
/* B1BD4 800B0FD4 AFB401F0 */  sw         $s4, 0x1f0($sp)
/* B1BD8 800B0FD8 AFB201E8 */  sw         $s2, 0x1e8($sp)
/* B1BDC 800B0FDC AFB001E0 */  sw         $s0, 0x1e0($sp)
/* B1BE0 800B0FE0 F7B60210 */  sdc1       $f22, 0x210($sp)
/* B1BE4 800B0FE4 F7B40208 */  sdc1       $f20, 0x208($sp)
/* B1BE8 800B0FE8 9622006A */  lhu        $v0, 0x6a($s1)
/* B1BEC 800B0FEC 4487B000 */  mtc1       $a3, $f22
/* B1BF0 800B0FF0 14430009 */  bne        $v0, $v1, .L800B1018
/* B1BF4 800B0FF4 00069C03 */   sra       $s3, $a2, 0x10
/* B1BF8 800B0FF8 8E230000 */  lw         $v1, ($s1)
/* B1BFC 800B0FFC 8E240004 */  lw         $a0, 4($s1)
/* B1C00 800B1000 8E250008 */  lw         $a1, 8($s1)
/* B1C04 800B1004 24020002 */  addiu      $v0, $zero, 2
/* B1C08 800B1008 A622006A */  sh         $v0, 0x6a($s1)
/* B1C0C 800B100C AE230018 */  sw         $v1, 0x18($s1)
/* B1C10 800B1010 AE24001C */  sw         $a0, 0x1c($s1)
/* B1C14 800B1014 AE250020 */  sw         $a1, 0x20($s1)
.L800B1018:
/* B1C18 800B1018 9623006A */  lhu        $v1, 0x6a($s1)
/* B1C1C 800B101C 24020003 */  addiu      $v0, $zero, 3
/* B1C20 800B1020 54620009 */  bnel       $v1, $v0, .L800B1048
/* B1C24 800B1024 27A40020 */   addiu     $a0, $sp, 0x20
/* B1C28 800B1028 8E220000 */  lw         $v0, ($s1)
/* B1C2C 800B102C 8E230004 */  lw         $v1, 4($s1)
/* B1C30 800B1030 8E240008 */  lw         $a0, 8($s1)
/* B1C34 800B1034 A620006A */  sh         $zero, 0x6a($s1)
/* B1C38 800B1038 AE220018 */  sw         $v0, 0x18($s1)
/* B1C3C 800B103C AE23001C */  sw         $v1, 0x1c($s1)
/* B1C40 800B1040 AE240020 */  sw         $a0, 0x20($s1)
/* B1C44 800B1044 27A40020 */  addiu      $a0, $sp, 0x20
.L800B1048:
/* B1C48 800B1048 02202821 */  addu       $a1, $s1, $zero
/* B1C4C 800B104C 2630000C */  addiu      $s0, $s1, 0xc
/* B1C50 800B1050 0C02AB26 */  jal        Vec3A_BsubC
/* B1C54 800B1054 02003021 */   addu      $a2, $s0, $zero
/* B1C58 800B1058 AFA00024 */  sw         $zero, 0x24($sp)
/* B1C5C 800B105C 0C02ABBB */  jal        vec3_normalize
/* B1C60 800B1060 27A40020 */   addiu     $a0, $sp, 0x20
/* B1C64 800B1064 46000506 */  mov.s      $f20, $f0
/* B1C68 800B1068 00001821 */  addu       $v1, $zero, $zero
/* B1C6C 800B106C 0200A821 */  addu       $s5, $s0, $zero
/* B1C70 800B1070 26250018 */  addiu      $a1, $s1, 0x18
/* B1C74 800B1074 27B20160 */  addiu      $s2, $sp, 0x160
/* B1C78 800B1078 27B000E0 */  addiu      $s0, $sp, 0xe0
/* B1C7C 800B107C 27B40120 */  addiu      $s4, $sp, 0x120
/* B1C80 800B1080 27B70060 */  addiu      $s7, $sp, 0x60
/* B1C84 800B1084 1A60000D */  blez       $s3, .L800B10BC
/* B1C88 800B1088 27B600A0 */   addiu     $s6, $sp, 0xa0
/* B1C8C 800B108C 3C01800E */  lui        $at, %hi(D_800E38A8)
/* B1C90 800B1090 D42438A8 */  ldc1       $f4, %lo(D_800E38A8)($at)
.L800B1094:
/* B1C94 800B1094 4616A001 */  sub.s      $f0, $f20, $f22
/* B1C98 800B1098 46000021 */  cvt.d.s    $f0, $f0
/* B1C9C 800B109C 46240002 */  mul.d      $f0, $f0, $f4
/* B1CA0 800B10A0 4600A0A1 */  cvt.d.s    $f2, $f20
/* B1CA4 800B10A4 24620001 */  addiu      $v0, $v1, 1
/* B1CA8 800B10A8 46201081 */  sub.d      $f2, $f2, $f0
/* B1CAC 800B10AC 3043FFFF */  andi       $v1, $v0, 0xffff
/* B1CB0 800B10B0 0073102A */  slt        $v0, $v1, $s3
/* B1CB4 800B10B4 1440FFF7 */  bnez       $v0, .L800B1094
/* B1CB8 800B10B8 46201520 */   cvt.s.d   $f20, $f2
.L800B10BC:
/* B1CBC 800B10BC 27A40020 */  addiu      $a0, $sp, 0x20
/* B1CC0 800B10C0 0C02AB26 */  jal        Vec3A_BsubC
/* B1CC4 800B10C4 02A03021 */   addu      $a2, $s5, $zero
/* B1CC8 800B10C8 8FA50020 */  lw         $a1, 0x20($sp)
/* B1CCC 800B10CC 8FA60028 */  lw         $a2, 0x28($sp)
/* B1CD0 800B10D0 0C02AD55 */  jal        setVec2
/* B1CD4 800B10D4 02402021 */   addu      $a0, $s2, $zero
/* B1CD8 800B10D8 0C02AB9F */  jal        vec2_normalize
/* B1CDC 800B10DC 02402021 */   addu      $a0, $s2, $zero
/* B1CE0 800B10E0 8E250058 */  lw         $a1, 0x58($s1)
/* B1CE4 800B10E4 0C02ACBD */  jal        some_trig_func
/* B1CE8 800B10E8 02402021 */   addu      $a0, $s2, $zero
/* B1CEC 800B10EC 4405A000 */  mfc1       $a1, $f20
/* B1CF0 800B10F0 0C02AD34 */  jal        multiVec2
/* B1CF4 800B10F4 02402021 */   addu      $a0, $s2, $zero
/* B1CF8 800B10F8 C7A20160 */  lwc1       $f2, 0x160($sp)
/* B1CFC 800B10FC C620000C */  lwc1       $f0, 0xc($s1)
/* B1D00 800B1100 C7A40164 */  lwc1       $f4, 0x164($sp)
/* B1D04 800B1104 46001080 */  add.s      $f2, $f2, $f0
/* B1D08 800B1108 C6200014 */  lwc1       $f0, 0x14($s1)
/* B1D0C 800B110C 46002100 */  add.s      $f4, $f4, $f0
/* B1D10 800B1110 8E26001C */  lw         $a2, 0x1c($s1)
/* B1D14 800B1114 44051000 */  mfc1       $a1, $f2
/* B1D18 800B1118 44072000 */  mfc1       $a3, $f4
/* B1D1C 800B111C 0C02AD58 */  jal        setVec3
/* B1D20 800B1120 02202021 */   addu      $a0, $s1, $zero
/* B1D24 800B1124 02A02821 */  addu       $a1, $s5, $zero
/* B1D28 800B1128 02203021 */  addu       $a2, $s1, $zero
/* B1D2C 800B112C 8E240088 */  lw         $a0, 0x88($s1)
/* B1D30 800B1130 3C073E80 */  lui        $a3, 0x3e80
/* B1D34 800B1134 24020001 */  addiu      $v0, $zero, 1
/* B1D38 800B1138 AFB00010 */  sw         $s0, 0x10($sp)
/* B1D3C 800B113C AFB40014 */  sw         $s4, 0x14($sp)
/* B1D40 800B1140 0C02B7DE */  jal        func_800ADF78
/* B1D44 800B1144 AFA20018 */   sw        $v0, 0x18($sp)
/* B1D48 800B1148 5040002C */  beql       $v0, $zero, .L800B11FC
/* B1D4C 800B114C 8E25000C */   lw        $a1, 0xc($s1)
/* B1D50 800B1150 3C05BE80 */  lui        $a1, 0xbe80
/* B1D54 800B1154 0C02AD3C */  jal        multiVec3
/* B1D58 800B1158 02802021 */   addu      $a0, $s4, $zero
/* B1D5C 800B115C 02002021 */  addu       $a0, $s0, $zero
/* B1D60 800B1160 02002821 */  addu       $a1, $s0, $zero
/* B1D64 800B1164 0C02AB4D */  jal        vec3_sum
/* B1D68 800B1168 02803021 */   addu      $a2, $s4, $zero
/* B1D6C 800B116C 27A40020 */  addiu      $a0, $sp, 0x20
/* B1D70 800B1170 02002821 */  addu       $a1, $s0, $zero
/* B1D74 800B1174 0C02AB26 */  jal        Vec3A_BsubC
/* B1D78 800B1178 02A03021 */   addu      $a2, $s5, $zero
/* B1D7C 800B117C 27B001A0 */  addiu      $s0, $sp, 0x1a0
/* B1D80 800B1180 8FA50020 */  lw         $a1, 0x20($sp)
/* B1D84 800B1184 8FA60028 */  lw         $a2, 0x28($sp)
/* B1D88 800B1188 0C02AD55 */  jal        setVec2
/* B1D8C 800B118C 02002021 */   addu      $a0, $s0, $zero
/* B1D90 800B1190 0C02AB04 */  jal        vec2_length
/* B1D94 800B1194 02002021 */   addu      $a0, $s0, $zero
/* B1D98 800B1198 4600A001 */  sub.s      $f0, $f20, $f0
/* B1D9C 800B119C 3C01800E */  lui        $at, %hi(D_800E38B0)
/* B1DA0 800B11A0 D42438B0 */  ldc1       $f4, %lo(D_800E38B0)($at)
/* B1DA4 800B11A4 46000021 */  cvt.d.s    $f0, $f0
/* B1DA8 800B11A8 46240002 */  mul.d      $f0, $f0, $f4
/* B1DAC 800B11AC 4600A0A1 */  cvt.d.s    $f2, $f20
/* B1DB0 800B11B0 46201081 */  sub.d      $f2, $f2, $f0
/* B1DB4 800B11B4 02402021 */  addu       $a0, $s2, $zero
/* B1DB8 800B11B8 0C02AB9F */  jal        vec2_normalize
/* B1DBC 800B11BC 46201520 */   cvt.s.d   $f20, $f2
/* B1DC0 800B11C0 4405A000 */  mfc1       $a1, $f20
/* B1DC4 800B11C4 0C02AD34 */  jal        multiVec2
/* B1DC8 800B11C8 02402021 */   addu      $a0, $s2, $zero
/* B1DCC 800B11CC C7A20160 */  lwc1       $f2, 0x160($sp)
/* B1DD0 800B11D0 C620000C */  lwc1       $f0, 0xc($s1)
/* B1DD4 800B11D4 C7A40164 */  lwc1       $f4, 0x164($sp)
/* B1DD8 800B11D8 46001080 */  add.s      $f2, $f2, $f0
/* B1DDC 800B11DC C6200014 */  lwc1       $f0, 0x14($s1)
/* B1DE0 800B11E0 46002100 */  add.s      $f4, $f4, $f0
/* B1DE4 800B11E4 8E26001C */  lw         $a2, 0x1c($s1)
/* B1DE8 800B11E8 44051000 */  mfc1       $a1, $f2
/* B1DEC 800B11EC 44072000 */  mfc1       $a3, $f4
/* B1DF0 800B11F0 0C02AD58 */  jal        setVec3
/* B1DF4 800B11F4 02202021 */   addu      $a0, $s1, $zero
/* B1DF8 800B11F8 8E25000C */  lw         $a1, 0xc($s1)
.L800B11FC:
/* B1DFC 800B11FC 8E260014 */  lw         $a2, 0x14($s1)
/* B1E00 800B1200 0C02AD55 */  jal        setVec2
/* B1E04 800B1204 02E02021 */   addu      $a0, $s7, $zero
/* B1E08 800B1208 8E250000 */  lw         $a1, ($s1)
/* B1E0C 800B120C 8E260008 */  lw         $a2, 8($s1)
/* B1E10 800B1210 0C02AD55 */  jal        setVec2
/* B1E14 800B1214 02C02021 */   addu      $a0, $s6, $zero
/* B1E18 800B1218 02402021 */  addu       $a0, $s2, $zero
/* B1E1C 800B121C 02C02821 */  addu       $a1, $s6, $zero
/* B1E20 800B1220 0C02AB1D */  jal        Vec2_Sub
/* B1E24 800B1224 02E03021 */   addu      $a2, $s7, $zero
/* B1E28 800B1228 0C02AB9F */  jal        vec2_normalize
/* B1E2C 800B122C 02402021 */   addu      $a0, $s2, $zero
/* B1E30 800B1230 3C01800E */  lui        $at, %hi(D_800E38B8)
/* B1E34 800B1234 D42238B8 */  ldc1       $f2, %lo(D_800E38B8)($at)
/* B1E38 800B1238 46000021 */  cvt.d.s    $f0, $f0
/* B1E3C 800B123C 4622003C */  c.lt.d     $f0, $f2
/* B1E40 800B1240 00000000 */  nop
/* B1E44 800B1244 45000013 */  bc1f       .L800B1294
/* B1E48 800B1248 C7A40160 */   lwc1      $f4, 0x160($sp)
/* B1E4C 800B124C 46002121 */  cvt.d.s    $f4, $f4
/* B1E50 800B1250 46222102 */  mul.d      $f4, $f4, $f2
/* B1E54 800B1254 C7A60164 */  lwc1       $f6, 0x164($sp)
/* B1E58 800B1258 460031A1 */  cvt.d.s    $f6, $f6
/* B1E5C 800B125C 46223182 */  mul.d      $f6, $f6, $f2
/* B1E60 800B1260 C7A20060 */  lwc1       $f2, 0x60($sp)
/* B1E64 800B1264 C7A00064 */  lwc1       $f0, 0x64($sp)
/* B1E68 800B1268 460010A1 */  cvt.d.s    $f2, $f2
/* B1E6C 800B126C 46241080 */  add.d      $f2, $f2, $f4
/* B1E70 800B1270 46000021 */  cvt.d.s    $f0, $f0
/* B1E74 800B1274 46260000 */  add.d      $f0, $f0, $f6
/* B1E78 800B1278 8E260004 */  lw         $a2, 4($s1)
/* B1E7C 800B127C 462010A0 */  cvt.s.d    $f2, $f2
/* B1E80 800B1280 46200020 */  cvt.s.d    $f0, $f0
/* B1E84 800B1284 44051000 */  mfc1       $a1, $f2
/* B1E88 800B1288 44070000 */  mfc1       $a3, $f0
/* B1E8C 800B128C 0C02AD58 */  jal        setVec3
/* B1E90 800B1290 02202021 */   addu      $a0, $s1, $zero
.L800B1294:
/* B1E94 800B1294 C6200048 */  lwc1       $f0, 0x48($s1)
/* B1E98 800B1298 3C01800E */  lui        $at, %hi(D_800E38C0)
/* B1E9C 800B129C C42638C0 */  lwc1       $f6, %lo(D_800E38C0)($at)
/* B1EA0 800B12A0 C6220004 */  lwc1       $f2, 4($s1)
/* B1EA4 800B12A4 C6240010 */  lwc1       $f4, 0x10($s1)
/* B1EA8 800B12A8 46060003 */  div.s      $f0, $f0, $f6
/* B1EAC 800B12AC 46001080 */  add.s      $f2, $f2, $f0
/* B1EB0 800B12B0 C7A00228 */  lwc1       $f0, 0x228($sp)
/* B1EB4 800B12B4 46002100 */  add.s      $f4, $f4, $f0
/* B1EB8 800B12B8 4604103C */  c.lt.s     $f2, $f4
/* B1EBC 800B12BC 00000000 */  nop
/* B1EC0 800B12C0 45000006 */  bc1f       .L800B12DC
/* B1EC4 800B12C4 E6220004 */   swc1      $f2, 4($s1)
/* B1EC8 800B12C8 C620001C */  lwc1       $f0, 0x1c($s1)
/* B1ECC 800B12CC 46002001 */  sub.s      $f0, $f4, $f0
/* B1ED0 800B12D0 46060002 */  mul.s      $f0, $f0, $f6
/* B1ED4 800B12D4 E6240004 */  swc1       $f4, 4($s1)
/* B1ED8 800B12D8 E6200048 */  swc1       $f0, 0x48($s1)
.L800B12DC:
/* B1EDC 800B12DC C6200010 */  lwc1       $f0, 0x10($s1)
/* B1EE0 800B12E0 C7A2022C */  lwc1       $f2, 0x22c($sp)
/* B1EE4 800B12E4 46020080 */  add.s      $f2, $f0, $f2
/* B1EE8 800B12E8 C6240004 */  lwc1       $f4, 4($s1)
/* B1EEC 800B12EC 4604103C */  c.lt.s     $f2, $f4
/* B1EF0 800B12F0 00000000 */  nop
/* B1EF4 800B12F4 45000006 */  bc1f       .L800B1310
/* B1EF8 800B12F8 00000000 */   nop
/* B1EFC 800B12FC C620001C */  lwc1       $f0, 0x1c($s1)
/* B1F00 800B1300 46001001 */  sub.s      $f0, $f2, $f0
/* B1F04 800B1304 46060002 */  mul.s      $f0, $f0, $f6
/* B1F08 800B1308 E6220004 */  swc1       $f2, 4($s1)
/* B1F0C 800B130C E6200048 */  swc1       $f0, 0x48($s1)
.L800B1310:
/* B1F10 800B1310 0C02C0C6 */  jal        camera_orient
/* B1F14 800B1314 02202021 */   addu      $a0, $s1, $zero
/* B1F18 800B1318 8FBF0200 */  lw         $ra, 0x200($sp)
/* B1F1C 800B131C 8FB701FC */  lw         $s7, 0x1fc($sp)
/* B1F20 800B1320 8FB601F8 */  lw         $s6, 0x1f8($sp)
/* B1F24 800B1324 8FB501F4 */  lw         $s5, 0x1f4($sp)
/* B1F28 800B1328 8FB401F0 */  lw         $s4, 0x1f0($sp)
/* B1F2C 800B132C 8FB301EC */  lw         $s3, 0x1ec($sp)
/* B1F30 800B1330 8FB201E8 */  lw         $s2, 0x1e8($sp)
/* B1F34 800B1334 8FB101E4 */  lw         $s1, 0x1e4($sp)
/* B1F38 800B1338 8FB001E0 */  lw         $s0, 0x1e0($sp)
/* B1F3C 800B133C D7B60210 */  ldc1       $f22, 0x210($sp)
/* B1F40 800B1340 D7B40208 */  ldc1       $f20, 0x208($sp)
/* B1F44 800B1344 03E00008 */  jr         $ra
/* B1F48 800B1348 27BD0218 */   addiu     $sp, $sp, 0x218

glabel NOOP_800b134c
/* B1F4C 800B134C 03E00008 */  jr         $ra
/* B1F50 800B1350 00000000 */   nop

glabel set_camera_mode
/* B1F54 800B1354 94820046 */  lhu        $v0, 0x46($a0)
/* B1F58 800B1358 30A5FFFF */  andi       $a1, $a1, 0xffff
/* B1F5C 800B135C 10450003 */  beq        $v0, $a1, .L800B136C
/* B1F60 800B1360 00000000 */   nop
/* B1F64 800B1364 A4820044 */  sh         $v0, 0x44($a0)
/* B1F68 800B1368 A4850046 */  sh         $a1, 0x46($a0)
.L800B136C:
/* B1F6C 800B136C 03E00008 */  jr         $ra
/* B1F70 800B1370 00000000 */   nop

glabel revert_camera_mode
/* B1F74 800B1374 94820044 */  lhu        $v0, 0x44($a0)
/* B1F78 800B1378 03E00008 */  jr         $ra
/* B1F7C 800B137C A4820046 */   sh        $v0, 0x46($a0)

glabel ProcessGameCamera
/* B1F80 800B1380 27BDFF78 */  addiu      $sp, $sp, -0x88
/* B1F84 800B1384 AFB00080 */  sw         $s0, 0x80($sp)
/* B1F88 800B1388 00808021 */  addu       $s0, $a0, $zero
/* B1F8C 800B138C 00073C00 */  sll        $a3, $a3, 0x10
/* B1F90 800B1390 00073C03 */  sra        $a3, $a3, 0x10
/* B1F94 800B1394 24020001 */  addiu      $v0, $zero, 1
/* B1F98 800B1398 AFBF0084 */  sw         $ra, 0x84($sp)
/* B1F9C 800B139C 96030046 */  lhu        $v1, 0x46($s0)
/* B1FA0 800B13A0 1062001B */  beq        $v1, $v0, .L800B1410
/* B1FA4 800B13A4 97A4009A */   lhu       $a0, 0x9a($sp)
/* B1FA8 800B13A8 28620002 */  slti       $v0, $v1, 2
/* B1FAC 800B13AC 10400005 */  beqz       $v0, .L800B13C4
/* B1FB0 800B13B0 24020002 */   addiu     $v0, $zero, 2
/* B1FB4 800B13B4 50600012 */  beql       $v1, $zero, .L800B1400
/* B1FB8 800B13B8 AFA40010 */   sw        $a0, 0x10($sp)
/* B1FBC 800B13BC 0802C4F6 */  j          .L800B13D8
/* B1FC0 800B13C0 27A40040 */   addiu     $a0, $sp, 0x40
.L800B13C4:
/* B1FC4 800B13C4 10620036 */  beq        $v1, $v0, .L800B14A0
/* B1FC8 800B13C8 24020003 */   addiu     $v0, $zero, 3
/* B1FCC 800B13CC 10620039 */  beq        $v1, $v0, .L800B14B4
/* B1FD0 800B13D0 8FBF0084 */   lw        $ra, 0x84($sp)
/* B1FD4 800B13D4 27A40040 */  addiu      $a0, $sp, 0x40
.L800B13D8:
/* B1FD8 800B13D8 96060046 */  lhu        $a2, 0x46($s0)
/* B1FDC 800B13DC 3C05800E */  lui        $a1, %hi(D_800E38C4)
/* B1FE0 800B13E0 0C0333AC */  jal        sprintf
/* B1FE4 800B13E4 24A538C4 */   addiu     $a1, $a1, %lo(D_800E38C4)
/* B1FE8 800B13E8 3C04800E */  lui        $a0, %hi(D_800E38D8)
/* B1FEC 800B13EC 248438D8 */  addiu      $a0, $a0, %lo(D_800E38D8)
/* B1FF0 800B13F0 0C025F2D */  jal        manualCrash
/* B1FF4 800B13F4 27A50040 */   addiu     $a1, $sp, 0x40
/* B1FF8 800B13F8 0802C52D */  j          .L800B14B4
/* B1FFC 800B13FC 8FBF0084 */   lw        $ra, 0x84($sp)
.L800B1400:
/* B2000 800B1400 0C02C2D5 */  jal        ProcessGameCamera_mode0
/* B2004 800B1404 02002021 */   addu      $a0, $s0, $zero
/* B2008 800B1408 0802C52D */  j          .L800B14B4
/* B200C 800B140C 8FBF0084 */   lw        $ra, 0x84($sp)
.L800B1410:
/* B2010 800B1410 3C01800E */  lui        $at, %hi(D_800E38EC)
/* B2014 800B1414 C42038EC */  lwc1       $f0, %lo(D_800E38EC)($at)
/* B2018 800B1418 3C01800E */  lui        $at, %hi(D_800E38F0)
/* B201C 800B141C C42238F0 */  lwc1       $f2, %lo(D_800E38F0)($at)
/* B2020 800B1420 3C01800E */  lui        $at, %hi(D_800E38F4)
/* B2024 800B1424 C42438F4 */  lwc1       $f4, %lo(D_800E38F4)($at)
/* B2028 800B1428 3C01800E */  lui        $at, %hi(D_800E38F8)
/* B202C 800B142C C42638F8 */  lwc1       $f6, %lo(D_800E38F8)($at)
/* B2030 800B1430 3C01800E */  lui        $at, %hi(D_800E38FC)
/* B2034 800B1434 C42838FC */  lwc1       $f8, %lo(D_800E38FC)($at)
/* B2038 800B1438 3C01800E */  lui        $at, %hi(D_800E3900)
/* B203C 800B143C C42A3900 */  lwc1       $f10, %lo(D_800E3900)($at)
/* B2040 800B1440 3C01800E */  lui        $at, %hi(D_800E3904)
/* B2044 800B1444 C42C3904 */  lwc1       $f12, %lo(D_800E3904)($at)
/* B2048 800B1448 3C01800E */  lui        $at, %hi(D_800E3908)
/* B204C 800B144C C42E3908 */  lwc1       $f14, %lo(D_800E3908)($at)
/* B2050 800B1450 3C01800E */  lui        $at, %hi(D_800E390C)
/* B2054 800B1454 C430390C */  lwc1       $f16, %lo(D_800E390C)($at)
/* B2058 800B1458 3C01800E */  lui        $at, %hi(D_800E3910)
/* B205C 800B145C C4323910 */  lwc1       $f18, %lo(D_800E3910)($at)
/* B2060 800B1460 02002021 */  addu       $a0, $s0, $zero
/* B2064 800B1464 AFA30038 */  sw         $v1, 0x38($sp)
/* B2068 800B1468 AFA3003C */  sw         $v1, 0x3c($sp)
/* B206C 800B146C E7A00010 */  swc1       $f0, 0x10($sp)
/* B2070 800B1470 E7A20014 */  swc1       $f2, 0x14($sp)
/* B2074 800B1474 E7A40018 */  swc1       $f4, 0x18($sp)
/* B2078 800B1478 E7A6001C */  swc1       $f6, 0x1c($sp)
/* B207C 800B147C E7A80020 */  swc1       $f8, 0x20($sp)
/* B2080 800B1480 E7AA0024 */  swc1       $f10, 0x24($sp)
/* B2084 800B1484 E7AC0028 */  swc1       $f12, 0x28($sp)
/* B2088 800B1488 E7AE002C */  swc1       $f14, 0x2c($sp)
/* B208C 800B148C E7B00030 */  swc1       $f16, 0x30($sp)
/* B2090 800B1490 0C02C1B2 */  jal        ProcessGameCamera_mode1
/* B2094 800B1494 E7B20034 */   swc1      $f18, 0x34($sp)
/* B2098 800B1498 0802C52D */  j          .L800B14B4
/* B209C 800B149C 8FBF0084 */   lw        $ra, 0x84($sp)
.L800B14A0:
/* B20A0 800B14A0 0C02C4D3 */  jal        NOOP_800b134c
/* B20A4 800B14A4 02002021 */   addu      $a0, $s0, $zero
/* B20A8 800B14A8 0C02C4DD */  jal        revert_camera_mode
/* B20AC 800B14AC 02002021 */   addu      $a0, $s0, $zero
/* B20B0 800B14B0 8FBF0084 */  lw         $ra, 0x84($sp)
.L800B14B4:
/* B20B4 800B14B4 8FB00080 */  lw         $s0, 0x80($sp)
/* B20B8 800B14B8 03E00008 */  jr         $ra
/* B20BC 800B14BC 27BD0088 */   addiu     $sp, $sp, 0x88

glabel some_camera_func
/* B20C0 800B14C0 27BDFF68 */  addiu      $sp, $sp, -0x98
/* B20C4 800B14C4 AFBE0070 */  sw         $fp, 0x70($sp)
/* B20C8 800B14C8 0080F021 */  addu       $fp, $a0, $zero
/* B20CC 800B14CC AFB7006C */  sw         $s7, 0x6c($sp)
/* B20D0 800B14D0 00C0B821 */  addu       $s7, $a2, $zero
/* B20D4 800B14D4 00073C00 */  sll        $a3, $a3, 0x10
/* B20D8 800B14D8 AFB3005C */  sw         $s3, 0x5c($sp)
/* B20DC 800B14DC 00079C03 */  sra        $s3, $a3, 0x10
/* B20E0 800B14E0 F7BA0090 */  sdc1       $f26, 0x90($sp)
/* B20E4 800B14E4 C7BA00A8 */  lwc1       $f26, 0xa8($sp)
/* B20E8 800B14E8 2A620002 */  slti       $v0, $s3, 2
/* B20EC 800B14EC AFBF0074 */  sw         $ra, 0x74($sp)
/* B20F0 800B14F0 AFB60068 */  sw         $s6, 0x68($sp)
/* B20F4 800B14F4 AFB50064 */  sw         $s5, 0x64($sp)
/* B20F8 800B14F8 AFB40060 */  sw         $s4, 0x60($sp)
/* B20FC 800B14FC AFB20058 */  sw         $s2, 0x58($sp)
/* B2100 800B1500 AFB10054 */  sw         $s1, 0x54($sp)
/* B2104 800B1504 AFB00050 */  sw         $s0, 0x50($sp)
/* B2108 800B1508 F7B80088 */  sdc1       $f24, 0x88($sp)
/* B210C 800B150C F7B60080 */  sdc1       $f22, 0x80($sp)
/* B2110 800B1510 F7B40078 */  sdc1       $f20, 0x78($sp)
/* B2114 800B1514 10400006 */  beqz       $v0, .L800B1530
/* B2118 800B1518 AFA5009C */   sw        $a1, 0x9c($sp)
/* B211C 800B151C 3C04800E */  lui        $a0, %hi(D_800E3914)
/* B2120 800B1520 24843914 */  addiu      $a0, $a0, %lo(D_800E3914)
/* B2124 800B1524 3C05800E */  lui        $a1, %hi(D_800E3928)
/* B2128 800B1528 0C025F2D */  jal        manualCrash
/* B212C 800B152C 24A53928 */   addiu     $a1, $a1, %lo(D_800E3928)
.L800B1530:
/* B2130 800B1530 3C01800E */  lui        $at, %hi(D_800E3934)
/* B2134 800B1534 C4203934 */  lwc1       $f0, %lo(D_800E3934)($at)
/* B2138 800B1538 4600D681 */  sub.s      $f26, $f26, $f0
/* B213C 800B153C 3C01800E */  lui        $at, %hi(D_800E3938)
/* B2140 800B1540 C4223938 */  lwc1       $f2, %lo(D_800E3938)($at)
/* B2144 800B1544 4602D682 */  mul.s      $f26, $f26, $f2
/* B2148 800B1548 3C01800E */  lui        $at, %hi(D_800E393C)
/* B214C 800B154C C420393C */  lwc1       $f0, %lo(D_800E393C)($at)
/* B2150 800B1550 4600D002 */  mul.s      $f0, $f26, $f0
/* B2154 800B1554 3C027482 */  lui        $v0, 0x7482
/* B2158 800B1558 3442296B */  ori        $v0, $v0, 0x296b
/* B215C 800B155C 4600008D */  trunc.w.s  $f2, $f0
/* B2160 800B1560 44051000 */  mfc1       $a1, $f2
/* B2164 800B1564 00A20018 */  mult       $a1, $v0
/* B2168 800B1568 000527C3 */  sra        $a0, $a1, 0x1f
/* B216C 800B156C 00001010 */  mfhi       $v0
/* B2170 800B1570 00021303 */  sra        $v0, $v0, 0xc
/* B2174 800B1574 00441023 */  subu       $v0, $v0, $a0
/* B2178 800B1578 00021880 */  sll        $v1, $v0, 2
/* B217C 800B157C 00621821 */  addu       $v1, $v1, $v0
/* B2180 800B1580 00032100 */  sll        $a0, $v1, 4
/* B2184 800B1584 00832023 */  subu       $a0, $a0, $v1
/* B2188 800B1588 00041100 */  sll        $v0, $a0, 4
/* B218C 800B158C 00441023 */  subu       $v0, $v0, $a0
/* B2190 800B1590 000210C0 */  sll        $v0, $v0, 3
/* B2194 800B1594 14A20004 */  bne        $a1, $v0, .L800B15A8
/* B2198 800B1598 00000000 */   nop
/* B219C 800B159C 3C01800E */  lui        $at, %hi(D_800E3940)
/* B21A0 800B15A0 C4203940 */  lwc1       $f0, %lo(D_800E3940)($at)
/* B21A4 800B15A4 4600D680 */  add.s      $f26, $f26, $f0
.L800B15A8:
/* B21A8 800B15A8 44800000 */  mtc1       $zero, $f0
/* B21AC 800B15AC 44050000 */  mfc1       $a1, $f0
/* B21B0 800B15B0 27A40010 */  addiu      $a0, $sp, 0x10
/* B21B4 800B15B4 00A03021 */  addu       $a2, $a1, $zero
/* B21B8 800B15B8 0C02AD58 */  jal        setVec3
/* B21BC 800B15BC 00A03821 */   addu      $a3, $a1, $zero
/* B21C0 800B15C0 4493B000 */  mtc1       $s3, $f22
/* B21C4 800B15C4 4680B5A0 */  cvt.s.w    $f22, $f22
/* B21C8 800B15C8 1A60000D */  blez       $s3, .L800B1600
/* B21CC 800B15CC 3C120001 */   lui       $s2, 1
/* B21D0 800B15D0 02E08821 */  addu       $s1, $s7, $zero
/* B21D4 800B15D4 3C140001 */  lui        $s4, 1
.L800B15D8:
/* B21D8 800B15D8 27A40010 */  addiu      $a0, $sp, 0x10
/* B21DC 800B15DC 00802821 */  addu       $a1, $a0, $zero
/* B21E0 800B15E0 8E260000 */  lw         $a2, ($s1)
/* B21E4 800B15E4 0C02AB4D */  jal        vec3_sum
/* B21E8 800B15E8 26310004 */   addiu     $s1, $s1, 4
/* B21EC 800B15EC 02401821 */  addu       $v1, $s2, $zero
/* B21F0 800B15F0 00038403 */  sra        $s0, $v1, 0x10
/* B21F4 800B15F4 0213102A */  slt        $v0, $s0, $s3
/* B21F8 800B15F8 1440FFF7 */  bnez       $v0, .L800B15D8
/* B21FC 800B15FC 02549021 */   addu      $s2, $s2, $s4
.L800B1600:
/* B2200 800B1600 27A40010 */  addiu      $a0, $sp, 0x10
/* B2204 800B1604 0000A821 */  addu       $s5, $zero, $zero
/* B2208 800B1608 00008021 */  addu       $s0, $zero, $zero
/* B220C 800B160C 3C01800E */  lui        $at, %hi(D_800E3948)
/* B2210 800B1610 D4203948 */  ldc1       $f0, %lo(D_800E3948)($at)
/* B2214 800B1614 4600B0A1 */  cvt.d.s    $f2, $f22
/* B2218 800B1618 46220003 */  div.d      $f0, $f0, $f2
/* B221C 800B161C 46200020 */  cvt.s.d    $f0, $f0
/* B2220 800B1620 44050000 */  mfc1       $a1, $f0
/* B2224 800B1624 4480A000 */  mtc1       $zero, $f20
/* B2228 800B1628 0C02AD3C */  jal        multiVec3
/* B222C 800B162C 00009021 */   addu      $s2, $zero, $zero
/* B2230 800B1630 1A60001D */  blez       $s3, .L800B16A8
/* B2234 800B1634 4600A606 */   mov.s     $f24, $f20
/* B2238 800B1638 3C140001 */  lui        $s4, 1
/* B223C 800B163C 02E08821 */  addu       $s1, $s7, $zero
/* B2240 800B1640 3C160001 */  lui        $s6, 1
.L800B1644:
/* B2244 800B1644 8E250000 */  lw         $a1, ($s1)
/* B2248 800B1648 0C02AB66 */  jal        get_vec3_proximity
/* B224C 800B164C 27A40010 */   addiu     $a0, $sp, 0x10
/* B2250 800B1650 46000586 */  mov.s      $f22, $f0
/* B2254 800B1654 4616A03C */  c.lt.s     $f20, $f22
/* B2258 800B1658 00000000 */  nop
/* B225C 800B165C 45000006 */  bc1f       .L800B1678
/* B2260 800B1660 00000000 */   nop
/* B2264 800B1664 02A09021 */  addu       $s2, $s5, $zero
/* B2268 800B1668 4600A606 */  mov.s      $f24, $f20
/* B226C 800B166C 0200A821 */  addu       $s5, $s0, $zero
/* B2270 800B1670 0802C5A4 */  j          .L800B1690
/* B2274 800B1674 4600B506 */   mov.s     $f20, $f22
.L800B1678:
/* B2278 800B1678 4616C03C */  c.lt.s     $f24, $f22
/* B227C 800B167C 00000000 */  nop
/* B2280 800B1680 45000004 */  bc1f       .L800B1694
/* B2284 800B1684 02801821 */   addu      $v1, $s4, $zero
/* B2288 800B1688 02009021 */  addu       $s2, $s0, $zero
/* B228C 800B168C 4600B606 */  mov.s      $f24, $f22
.L800B1690:
/* B2290 800B1690 02801821 */  addu       $v1, $s4, $zero
.L800B1694:
/* B2294 800B1694 0296A021 */  addu       $s4, $s4, $s6
/* B2298 800B1698 00038403 */  sra        $s0, $v1, 0x10
/* B229C 800B169C 0213102A */  slt        $v0, $s0, $s3
/* B22A0 800B16A0 1440FFE8 */  bnez       $v0, .L800B1644
/* B22A4 800B16A4 26310004 */   addiu     $s1, $s1, 4
.L800B16A8:
/* B22A8 800B16A8 00151080 */  sll        $v0, $s5, 2
/* B22AC 800B16AC 00578021 */  addu       $s0, $v0, $s7
/* B22B0 800B16B0 00121080 */  sll        $v0, $s2, 2
/* B22B4 800B16B4 00571021 */  addu       $v0, $v0, $s7
/* B22B8 800B16B8 8E050000 */  lw         $a1, ($s0)
/* B22BC 800B16BC 8C460000 */  lw         $a2, ($v0)
/* B22C0 800B16C0 0C02AB4D */  jal        vec3_sum
/* B22C4 800B16C4 03C02021 */   addu      $a0, $fp, $zero
/* B22C8 800B16C8 3C053F00 */  lui        $a1, 0x3f00
/* B22CC 800B16CC 0C02AD3C */  jal        multiVec3
/* B22D0 800B16D0 03C02021 */   addu      $a0, $fp, $zero
/* B22D4 800B16D4 27A40010 */  addiu      $a0, $sp, 0x10
/* B22D8 800B16D8 8E060000 */  lw         $a2, ($s0)
/* B22DC 800B16DC 0C02AB26 */  jal        Vec3A_BsubC
/* B22E0 800B16E0 03C02821 */   addu      $a1, $fp, $zero
/* B22E4 800B16E4 C7A00018 */  lwc1       $f0, 0x18($sp)
/* B22E8 800B16E8 44802000 */  mtc1       $zero, $f4
/* B22EC 800B16EC 4600203C */  c.lt.s     $f4, $f0
/* B22F0 800B16F0 00000000 */  nop
/* B22F4 800B16F4 45030001 */  bc1tl      .L800B16FC
/* B22F8 800B16F8 46000007 */   neg.s     $f0, $f0
.L800B16FC:
/* B22FC 800B16FC C7A20010 */  lwc1       $f2, 0x10($sp)
/* B2300 800B1700 8FA2009C */  lw         $v0, 0x9c($sp)
/* B2304 800B1704 4602203C */  c.lt.s     $f4, $f2
/* B2308 800B1708 00000000 */  nop
/* B230C 800B170C 45010002 */  bc1t       .L800B1718
/* B2310 800B1710 E4400000 */   swc1      $f0, ($v0)
/* B2314 800B1714 46001087 */  neg.s      $f2, $f2
.L800B1718:
/* B2318 800B1718 8FA4009C */  lw         $a0, 0x9c($sp)
/* B231C 800B171C 0C02AB9F */  jal        vec2_normalize
/* B2320 800B1720 E4820004 */   swc1      $f2, 4($a0)
/* B2324 800B1724 8E050000 */  lw         $a1, ($s0)
/* B2328 800B1728 0C02AB66 */  jal        get_vec3_proximity
/* B232C 800B172C 03C02021 */   addu      $a0, $fp, $zero
/* B2330 800B1730 3C01800E */  lui        $at, %hi(D_800E3950)
/* B2334 800B1734 C4223950 */  lwc1       $f2, %lo(D_800E3950)($at)
/* B2338 800B1738 4602D502 */  mul.s      $f20, $f26, $f2
/* B233C 800B173C 3C01800E */  lui        $at, %hi(D_800E3954)
/* B2340 800B1740 C4243954 */  lwc1       $f4, %lo(D_800E3954)($at)
/* B2344 800B1744 46040580 */  add.s      $f22, $f0, $f4
/* B2348 800B1748 0C03328C */  jal        __sinf
/* B234C 800B174C 4600A306 */   mov.s     $f12, $f20
/* B2350 800B1750 4600A306 */  mov.s      $f12, $f20
/* B2354 800B1754 0C02FB50 */  jal        __cosf
/* B2358 800B1758 46000506 */   mov.s     $f20, $f0
/* B235C 800B175C 4600A503 */  div.s      $f20, $f20, $f0
/* B2360 800B1760 4614B003 */  div.s      $f0, $f22, $f20
/* B2364 800B1764 8FBF0074 */  lw         $ra, 0x74($sp)
/* B2368 800B1768 8FBE0070 */  lw         $fp, 0x70($sp)
/* B236C 800B176C 8FB7006C */  lw         $s7, 0x6c($sp)
/* B2370 800B1770 8FB60068 */  lw         $s6, 0x68($sp)
/* B2374 800B1774 8FB50064 */  lw         $s5, 0x64($sp)
/* B2378 800B1778 8FB40060 */  lw         $s4, 0x60($sp)
/* B237C 800B177C 8FB3005C */  lw         $s3, 0x5c($sp)
/* B2380 800B1780 8FB20058 */  lw         $s2, 0x58($sp)
/* B2384 800B1784 8FB10054 */  lw         $s1, 0x54($sp)
/* B2388 800B1788 8FB00050 */  lw         $s0, 0x50($sp)
/* B238C 800B178C D7BA0090 */  ldc1       $f26, 0x90($sp)
/* B2390 800B1790 D7B80088 */  ldc1       $f24, 0x88($sp)
/* B2394 800B1794 D7B60080 */  ldc1       $f22, 0x80($sp)
/* B2398 800B1798 D7B40078 */  ldc1       $f20, 0x78($sp)
/* B239C 800B179C 03E00008 */  jr         $ra
/* B23A0 800B17A0 27BD0098 */   addiu     $sp, $sp, 0x98
/* B23A4 800B17A4 00000000 */  nop
/* B23A8 800B17A8 00000000 */  nop
/* B23AC 800B17AC 00000000 */  nop
