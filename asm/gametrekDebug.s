.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel SmallerDebugWidgetUpFunc
/* 26D70 80026170 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 26D74 80026174 AFBF0010 */  sw         $ra, 0x10($sp)
/* 26D78 80026178 8CA60040 */  lw         $a2, 0x40($a1)
/* 26D7C 8002617C 8CC30078 */  lw         $v1, 0x78($a2)
/* 26D80 80026180 84640058 */  lh         $a0, 0x58($v1)
/* 26D84 80026184 8C62005C */  lw         $v0, 0x5c($v1)
/* 26D88 80026188 0040F809 */  jalr       $v0
/* 26D8C 8002618C 00C42021 */   addu      $a0, $a2, $a0
/* 26D90 80026190 8FBF0010 */  lw         $ra, 0x10($sp)
/* 26D94 80026194 03E00008 */  jr         $ra
/* 26D98 80026198 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8002619C
/* 26D9C 8002619C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 26DA0 800261A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 26DA4 800261A4 24110004 */  addiu      $s1, $zero, 4
/* 26DA8 800261A8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 26DAC 800261AC AFB00010 */  sw         $s0, 0x10($sp)
/* 26DB0 800261B0 8CB00040 */  lw         $s0, 0x40($a1)
/* 26DB4 800261B4 8E030078 */  lw         $v1, 0x78($s0)
.L800261B8:
/* 26DB8 800261B8 2631FFFF */  addiu      $s1, $s1, -1
/* 26DBC 800261BC 84640058 */  lh         $a0, 0x58($v1)
/* 26DC0 800261C0 8C62005C */  lw         $v0, 0x5c($v1)
/* 26DC4 800261C4 0040F809 */  jalr       $v0
/* 26DC8 800261C8 02042021 */   addu      $a0, $s0, $a0
/* 26DCC 800261CC 0623FFFA */  bgezl      $s1, .L800261B8
/* 26DD0 800261D0 8E030078 */   lw        $v1, 0x78($s0)
/* 26DD4 800261D4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 26DD8 800261D8 8FB10014 */  lw         $s1, 0x14($sp)
/* 26DDC 800261DC 8FB00010 */  lw         $s0, 0x10($sp)
/* 26DE0 800261E0 00001021 */  addu       $v0, $zero, $zero
/* 26DE4 800261E4 03E00008 */  jr         $ra
/* 26DE8 800261E8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel SmallerDebugWidgetDownFunc
/* 26DEC 800261EC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 26DF0 800261F0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 26DF4 800261F4 8CA60040 */  lw         $a2, 0x40($a1)
/* 26DF8 800261F8 8CC30078 */  lw         $v1, 0x78($a2)
/* 26DFC 800261FC 84640060 */  lh         $a0, 0x60($v1)
/* 26E00 80026200 8C620064 */  lw         $v0, 0x64($v1)
/* 26E04 80026204 0040F809 */  jalr       $v0
/* 26E08 80026208 00C42021 */   addu      $a0, $a2, $a0
/* 26E0C 8002620C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 26E10 80026210 03E00008 */  jr         $ra
/* 26E14 80026214 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80026218
/* 26E18 80026218 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 26E1C 8002621C AFB10014 */  sw         $s1, 0x14($sp)
/* 26E20 80026220 24110004 */  addiu      $s1, $zero, 4
/* 26E24 80026224 AFBF0018 */  sw         $ra, 0x18($sp)
/* 26E28 80026228 AFB00010 */  sw         $s0, 0x10($sp)
/* 26E2C 8002622C 8CB00040 */  lw         $s0, 0x40($a1)
/* 26E30 80026230 8E030078 */  lw         $v1, 0x78($s0)
.L80026234:
/* 26E34 80026234 2631FFFF */  addiu      $s1, $s1, -1
/* 26E38 80026238 84640060 */  lh         $a0, 0x60($v1)
/* 26E3C 8002623C 8C620064 */  lw         $v0, 0x64($v1)
/* 26E40 80026240 0040F809 */  jalr       $v0
/* 26E44 80026244 02042021 */   addu      $a0, $s0, $a0
/* 26E48 80026248 0623FFFA */  bgezl      $s1, .L80026234
/* 26E4C 8002624C 8E030078 */   lw        $v1, 0x78($s0)
/* 26E50 80026250 8FBF0018 */  lw         $ra, 0x18($sp)
/* 26E54 80026254 8FB10014 */  lw         $s1, 0x14($sp)
/* 26E58 80026258 8FB00010 */  lw         $s0, 0x10($sp)
/* 26E5C 8002625C 00001021 */  addu       $v0, $zero, $zero
/* 26E60 80026260 03E00008 */  jr         $ra
/* 26E64 80026264 27BD0020 */   addiu     $sp, $sp, 0x20

glabel SmallerDebugWidgetAFunc
/* 26E68 80026268 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 26E6C 8002626C AFBF0010 */  sw         $ra, 0x10($sp)
/* 26E70 80026270 8CA60040 */  lw         $a2, 0x40($a1)
/* 26E74 80026274 8CC30078 */  lw         $v1, 0x78($a2)
/* 26E78 80026278 84640078 */  lh         $a0, 0x78($v1)
/* 26E7C 8002627C 8C62007C */  lw         $v0, 0x7c($v1)
/* 26E80 80026280 0040F809 */  jalr       $v0
/* 26E84 80026284 00C42021 */   addu      $a0, $a2, $a0
/* 26E88 80026288 8FBF0010 */  lw         $ra, 0x10($sp)
/* 26E8C 8002628C 03E00008 */  jr         $ra
/* 26E90 80026290 27BD0018 */   addiu     $sp, $sp, 0x18

glabel SmallerDebugWidget_ret_a1
/* 26E94 80026294 03E00008 */  jr         $ra
/* 26E98 80026298 00A01021 */   addu      $v0, $a1, $zero

glabel Ofunc_terrain_check
/* 26E9C 8002629C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 26EA0 800262A0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 26EA4 800262A4 AFB20018 */  sw         $s2, 0x18($sp)
/* 26EA8 800262A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 26EAC 800262AC AFB00010 */  sw         $s0, 0x10($sp)
/* 26EB0 800262B0 8CA30040 */  lw         $v1, 0x40($a1)
/* 26EB4 800262B4 8C640040 */  lw         $a0, 0x40($v1)
/* 26EB8 800262B8 9482001E */  lhu        $v0, 0x1e($a0)
/* 26EBC 800262BC 8C850018 */  lw         $a1, 0x18($a0)
/* 26EC0 800262C0 00021080 */  sll        $v0, $v0, 2
/* 26EC4 800262C4 00451021 */  addu       $v0, $v0, $a1
/* 26EC8 800262C8 8C430000 */  lw         $v1, ($v0)
/* 26ECC 800262CC 8C640050 */  lw         $a0, 0x50($v1)
/* 26ED0 800262D0 1080006F */  beqz       $a0, .L80026490
/* 26ED4 800262D4 00008821 */   addu      $s1, $zero, $zero
/* 26ED8 800262D8 9483005E */  lhu        $v1, 0x5e($a0)
/* 26EDC 800262DC 2C620006 */  sltiu      $v0, $v1, 6
/* 26EE0 800262E0 10400053 */  beqz       $v0, .L80026430
/* 26EE4 800262E4 8C920040 */   lw        $s2, 0x40($a0)
/* 26EE8 800262E8 3C02800E */  lui        $v0, %hi(D_800DA040)
/* 26EEC 800262EC 2442A040 */  addiu      $v0, $v0, %lo(D_800DA040)
/* 26EF0 800262F0 00031880 */  sll        $v1, $v1, 2
/* 26EF4 800262F4 00621821 */  addu       $v1, $v1, $v0
/* 26EF8 800262F8 8C640000 */  lw         $a0, ($v1)
/* 26EFC 800262FC 00800008 */  jr         $a0
/* 26F00 80026300 00000000 */   nop
/* 26F04 80026304 3C05800F */  lui        $a1, %hi(TerrainPointer)
/* 26F08 80026308 8CA21BBC */  lw         $v0, %lo(TerrainPointer)($a1)
/* 26F0C 8002630C 90430006 */  lbu        $v1, 6($v0)
/* 26F10 80026310 24630001 */  addiu      $v1, $v1, 1
/* 26F14 80026314 A0430006 */  sb         $v1, 6($v0)
/* 26F18 80026318 8CA31BBC */  lw         $v1, 0x1bbc($a1)
/* 26F1C 8002631C 90620006 */  lbu        $v0, 6($v1)
/* 26F20 80026320 2C420003 */  sltiu      $v0, $v0, 3
/* 26F24 80026324 50400001 */  beql       $v0, $zero, .L8002632C
/* 26F28 80026328 A0600006 */   sb        $zero, 6($v1)
.L8002632C:
/* 26F2C 8002632C 8CA31BBC */  lw         $v1, 0x1bbc($a1)
/* 26F30 80026330 3C05800F */  lui        $a1, %hi(precip_labels)
/* 26F34 80026334 8E440000 */  lw         $a0, ($s2)
/* 26F38 80026338 90620006 */  lbu        $v0, 6($v1)
/* 26F3C 8002633C 8CA61BB8 */  lw         $a2, %lo(precip_labels)($a1)
/* 26F40 80026340 00021080 */  sll        $v0, $v0, 2
/* 26F44 80026344 00461021 */  addu       $v0, $v0, $a2
/* 26F48 80026348 0C0333AC */  jal        sprintf
/* 26F4C 8002634C 8C450000 */   lw        $a1, ($v0)
/* 26F50 80026350 0800990C */  j          .L80026430
/* 26F54 80026354 00000000 */   nop
/* 26F58 80026358 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 26F5C 8002635C 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 26F60 80026360 0800990C */  j          .L80026430
/* 26F64 80026364 24710008 */   addiu     $s1, $v1, 8
/* 26F68 80026368 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 26F6C 8002636C 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 26F70 80026370 0800990C */  j          .L80026430
/* 26F74 80026374 2471000C */   addiu     $s1, $v1, 0xc
/* 26F78 80026378 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 26F7C 8002637C 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 26F80 80026380 0800990C */  j          .L80026430
/* 26F84 80026384 24710010 */   addiu     $s1, $v1, 0x10
/* 26F88 80026388 3C07800F */  lui        $a3, %hi(weather_flag)
/* 26F8C 8002638C 90E29AEE */  lbu        $v0, %lo(weather_flag)($a3)
/* 26F90 80026390 24420001 */  addiu      $v0, $v0, 1
/* 26F94 80026394 A0E29AEE */  sb         $v0, -0x6512($a3)
/* 26F98 80026398 304200FF */  andi       $v0, $v0, 0xff
/* 26F9C 8002639C 2C42000F */  sltiu      $v0, $v0, 0xf
/* 26FA0 800263A0 50400001 */  beql       $v0, $zero, .L800263A8
/* 26FA4 800263A4 A0E09AEE */   sb        $zero, -0x6512($a3)
.L800263A8:
/* 26FA8 800263A8 3C06800F */  lui        $a2, %hi(TerrainPointer)
/* 26FAC 800263AC 3C05800F */  lui        $a1, %hi(ofunc_ushort_array)
/* 26FB0 800263B0 24A59AD0 */  addiu      $a1, $a1, %lo(ofunc_ushort_array)
/* 26FB4 800263B4 90E29AEE */  lbu        $v0, -0x6512($a3)
/* 26FB8 800263B8 8CC41BBC */  lw         $a0, %lo(TerrainPointer)($a2)
/* 26FBC 800263BC 00021040 */  sll        $v0, $v0, 1
/* 26FC0 800263C0 00451021 */  addu       $v0, $v0, $a1
/* 26FC4 800263C4 94430000 */  lhu        $v1, ($v0)
/* 26FC8 800263C8 A4830000 */  sh         $v1, ($a0)
/* 26FCC 800263CC 90E29AEE */  lbu        $v0, -0x6512($a3)
/* 26FD0 800263D0 8E440000 */  lw         $a0, ($s2)
/* 26FD4 800263D4 00021040 */  sll        $v0, $v0, 1
/* 26FD8 800263D8 00451021 */  addu       $v0, $v0, $a1
/* 26FDC 800263DC 3C05800E */  lui        $a1, %hi(D_800DA030)
/* 26FE0 800263E0 94460000 */  lhu        $a2, ($v0)
/* 26FE4 800263E4 0C0333AC */  jal        sprintf
/* 26FE8 800263E8 24A5A030 */   addiu     $a1, $a1, %lo(D_800DA030)
/* 26FEC 800263EC 0800990C */  j          .L80026430
/* 26FF0 800263F0 00000000 */   nop
/* 26FF4 800263F4 3C10800F */  lui        $s0, %hi(TerrainPointer)
/* 26FF8 800263F8 8E041BBC */  lw         $a0, %lo(TerrainPointer)($s0)
/* 26FFC 800263FC 0C021401 */  jal        func_with_timeofDay
/* 27000 80026400 24050001 */   addiu     $a1, $zero, 1
/* 27004 80026404 3C05800F */  lui        $a1, %hi(timeofDay_labels)
/* 27008 80026408 8E031BBC */  lw         $v1, 0x1bbc($s0)
/* 2700C 8002640C 8CA61BA4 */  lw         $a2, %lo(timeofDay_labels)($a1)
/* 27010 80026410 3C05800E */  lui        $a1, 0x800e
/* 27014 80026414 90620002 */  lbu        $v0, 2($v1)
/* 27018 80026418 8E440000 */  lw         $a0, ($s2)
/* 2701C 8002641C 00021080 */  sll        $v0, $v0, 2
/* 27020 80026420 00461021 */  addu       $v0, $v0, $a2
/* 27024 80026424 8C460000 */  lw         $a2, ($v0)
/* 27028 80026428 0C0333AC */  jal        sprintf
/* 2702C 8002642C 24A5A034 */   addiu     $a1, $a1, -0x5fcc
.L80026430:
/* 27030 80026430 12200018 */  beqz       $s1, .L80026494
/* 27034 80026434 8FBF001C */   lw        $ra, 0x1c($sp)
/* 27038 80026438 C6200000 */  lwc1       $f0, ($s1)
/* 2703C 8002643C 3C01800E */  lui        $at, %hi(D_800DA058)
/* 27040 80026440 D422A058 */  ldc1       $f2, %lo(D_800DA058)($at)
/* 27044 80026444 46000021 */  cvt.d.s    $f0, $f0
/* 27048 80026448 46220000 */  add.d      $f0, $f0, $f2
/* 2704C 8002644C 3C01800E */  lui        $at, %hi(D_800DA060)
/* 27050 80026450 D424A060 */  ldc1       $f4, %lo(D_800DA060)($at)
/* 27054 80026454 46200020 */  cvt.s.d    $f0, $f0
/* 27058 80026458 460000A1 */  cvt.d.s    $f2, $f0
/* 2705C 8002645C 4622203C */  c.lt.d     $f4, $f2
/* 27060 80026460 00000000 */  nop
/* 27064 80026464 45000002 */  bc1f       .L80026470
/* 27068 80026468 E6200000 */   swc1      $f0, ($s1)
/* 2706C 8002646C AE200000 */  sw         $zero, ($s1)
.L80026470:
/* 27070 80026470 3C05800E */  lui        $a1, 0x800e
/* 27074 80026474 C6200000 */  lwc1       $f0, ($s1)
/* 27078 80026478 8E440000 */  lw         $a0, ($s2)
/* 2707C 8002647C 460000A1 */  cvt.d.s    $f2, $f0
/* 27080 80026480 44071000 */  mfc1       $a3, $f2
/* 27084 80026484 44061800 */  mfc1       $a2, $f3
/* 27088 80026488 0C0333AC */  jal        sprintf
/* 2708C 8002648C 24A5A038 */   addiu     $a1, $a1, -0x5fc8
.L80026490:
/* 27090 80026490 8FBF001C */  lw         $ra, 0x1c($sp)
.L80026494:
/* 27094 80026494 8FB20018 */  lw         $s2, 0x18($sp)
/* 27098 80026498 8FB10014 */  lw         $s1, 0x14($sp)
/* 2709C 8002649C 8FB00010 */  lw         $s0, 0x10($sp)
/* 270A0 800264A0 00001021 */  addu       $v0, $zero, $zero
/* 270A4 800264A4 03E00008 */  jr         $ra
/* 270A8 800264A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800264AC
/* 270AC 800264AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 270B0 800264B0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 270B4 800264B4 AFB20018 */  sw         $s2, 0x18($sp)
/* 270B8 800264B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 270BC 800264BC AFB00010 */  sw         $s0, 0x10($sp)
/* 270C0 800264C0 8CA30040 */  lw         $v1, 0x40($a1)
/* 270C4 800264C4 8C640040 */  lw         $a0, 0x40($v1)
/* 270C8 800264C8 9482001E */  lhu        $v0, 0x1e($a0)
/* 270CC 800264CC 8C850018 */  lw         $a1, 0x18($a0)
/* 270D0 800264D0 00021080 */  sll        $v0, $v0, 2
/* 270D4 800264D4 00451021 */  addu       $v0, $v0, $a1
/* 270D8 800264D8 8C430000 */  lw         $v1, ($v0)
/* 270DC 800264DC 8C640050 */  lw         $a0, 0x50($v1)
/* 270E0 800264E0 10800070 */  beqz       $a0, .L800266A4
/* 270E4 800264E4 00008821 */   addu      $s1, $zero, $zero
/* 270E8 800264E8 9483005E */  lhu        $v1, 0x5e($a0)
/* 270EC 800264EC 2C620006 */  sltiu      $v0, $v1, 6
/* 270F0 800264F0 10400052 */  beqz       $v0, .L8002663C
/* 270F4 800264F4 8C920040 */   lw        $s2, 0x40($a0)
/* 270F8 800264F8 3C02800E */  lui        $v0, %hi(D_800DA068)
/* 270FC 800264FC 2442A068 */  addiu      $v0, $v0, %lo(D_800DA068)
/* 27100 80026500 00031880 */  sll        $v1, $v1, 2
/* 27104 80026504 00621821 */  addu       $v1, $v1, $v0
/* 27108 80026508 8C640000 */  lw         $a0, ($v1)
/* 2710C 8002650C 00800008 */  jr         $a0
/* 27110 80026510 00000000 */   nop
/* 27114 80026514 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 27118 80026518 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 2711C 8002651C 90640006 */  lbu        $a0, 6($v1)
/* 27120 80026520 10800003 */  beqz       $a0, .L80026530
/* 27124 80026524 00402821 */   addu      $a1, $v0, $zero
/* 27128 80026528 0800994D */  j          .L80026534
/* 2712C 8002652C 2482FFFF */   addiu     $v0, $a0, -1
.L80026530:
/* 27130 80026530 24020002 */  addiu      $v0, $zero, 2
.L80026534:
/* 27134 80026534 A0620006 */  sb         $v0, 6($v1)
/* 27138 80026538 8CA31BBC */  lw         $v1, 0x1bbc($a1)
/* 2713C 8002653C 3C05800F */  lui        $a1, %hi(precip_labels)
/* 27140 80026540 8E440000 */  lw         $a0, ($s2)
/* 27144 80026544 90620006 */  lbu        $v0, 6($v1)
/* 27148 80026548 8CA61BB8 */  lw         $a2, %lo(precip_labels)($a1)
/* 2714C 8002654C 00021080 */  sll        $v0, $v0, 2
/* 27150 80026550 00461021 */  addu       $v0, $v0, $a2
/* 27154 80026554 0C0333AC */  jal        sprintf
/* 27158 80026558 8C450000 */   lw        $a1, ($v0)
/* 2715C 8002655C 0800998F */  j          .L8002663C
/* 27160 80026560 00000000 */   nop
/* 27164 80026564 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 27168 80026568 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 2716C 8002656C 0800998F */  j          .L8002663C
/* 27170 80026570 24710008 */   addiu     $s1, $v1, 8
/* 27174 80026574 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 27178 80026578 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 2717C 8002657C 0800998F */  j          .L8002663C
/* 27180 80026580 2471000C */   addiu     $s1, $v1, 0xc
/* 27184 80026584 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 27188 80026588 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 2718C 8002658C 0800998F */  j          .L8002663C
/* 27190 80026590 24710010 */   addiu     $s1, $v1, 0x10
/* 27194 80026594 3C02800F */  lui        $v0, %hi(weather_flag)
/* 27198 80026598 90439AEE */  lbu        $v1, %lo(weather_flag)($v0)
/* 2719C 8002659C 10600003 */  beqz       $v1, .L800265AC
/* 271A0 800265A0 00403821 */   addu      $a3, $v0, $zero
/* 271A4 800265A4 0800996C */  j          .L800265B0
/* 271A8 800265A8 2462FFFF */   addiu     $v0, $v1, -1
.L800265AC:
/* 271AC 800265AC 2402000E */  addiu      $v0, $zero, 0xe
.L800265B0:
/* 271B0 800265B0 A0E29AEE */  sb         $v0, -0x6512($a3)
/* 271B4 800265B4 3C06800F */  lui        $a2, %hi(TerrainPointer)
/* 271B8 800265B8 3C05800F */  lui        $a1, %hi(ofunc_ushort_array)
/* 271BC 800265BC 24A59AD0 */  addiu      $a1, $a1, %lo(ofunc_ushort_array)
/* 271C0 800265C0 90E29AEE */  lbu        $v0, -0x6512($a3)
/* 271C4 800265C4 8CC41BBC */  lw         $a0, %lo(TerrainPointer)($a2)
/* 271C8 800265C8 00021040 */  sll        $v0, $v0, 1
/* 271CC 800265CC 00451021 */  addu       $v0, $v0, $a1
/* 271D0 800265D0 94430000 */  lhu        $v1, ($v0)
/* 271D4 800265D4 A4830000 */  sh         $v1, ($a0)
/* 271D8 800265D8 90E29AEE */  lbu        $v0, -0x6512($a3)
/* 271DC 800265DC 8E440000 */  lw         $a0, ($s2)
/* 271E0 800265E0 00021040 */  sll        $v0, $v0, 1
/* 271E4 800265E4 00451021 */  addu       $v0, $v0, $a1
/* 271E8 800265E8 3C05800E */  lui        $a1, %hi(D_800DA030)
/* 271EC 800265EC 94460000 */  lhu        $a2, ($v0)
/* 271F0 800265F0 0C0333AC */  jal        sprintf
/* 271F4 800265F4 24A5A030 */   addiu     $a1, $a1, %lo(D_800DA030)
/* 271F8 800265F8 0800998F */  j          .L8002663C
/* 271FC 800265FC 00000000 */   nop
/* 27200 80026600 3C10800F */  lui        $s0, %hi(TerrainPointer)
/* 27204 80026604 8E041BBC */  lw         $a0, %lo(TerrainPointer)($s0)
/* 27208 80026608 0C021401 */  jal        func_with_timeofDay
/* 2720C 8002660C 2405FFFF */   addiu     $a1, $zero, -1
/* 27210 80026610 3C05800F */  lui        $a1, %hi(timeofDay_labels)
/* 27214 80026614 8E031BBC */  lw         $v1, 0x1bbc($s0)
/* 27218 80026618 8CA61BA4 */  lw         $a2, %lo(timeofDay_labels)($a1)
/* 2721C 8002661C 3C05800E */  lui        $a1, 0x800e
/* 27220 80026620 90620002 */  lbu        $v0, 2($v1)
/* 27224 80026624 8E440000 */  lw         $a0, ($s2)
/* 27228 80026628 00021080 */  sll        $v0, $v0, 2
/* 2722C 8002662C 00461021 */  addu       $v0, $v0, $a2
/* 27230 80026630 8C460000 */  lw         $a2, ($v0)
/* 27234 80026634 0C0333AC */  jal        sprintf
/* 27238 80026638 24A5A034 */   addiu     $a1, $a1, -0x5fcc
.L8002663C:
/* 2723C 8002663C 1220001A */  beqz       $s1, .L800266A8
/* 27240 80026640 8FBF001C */   lw        $ra, 0x1c($sp)
/* 27244 80026644 C6200000 */  lwc1       $f0, ($s1)
/* 27248 80026648 3C01800E */  lui        $at, %hi(D_800DA080)
/* 2724C 8002664C D422A080 */  ldc1       $f2, %lo(D_800DA080)($at)
/* 27250 80026650 46000021 */  cvt.d.s    $f0, $f0
/* 27254 80026654 46220001 */  sub.d      $f0, $f0, $f2
/* 27258 80026658 44802000 */  mtc1       $zero, $f4
/* 2725C 8002665C 44802800 */  mtc1       $zero, $f5
/* 27260 80026660 46200020 */  cvt.s.d    $f0, $f0
/* 27264 80026664 460000A1 */  cvt.d.s    $f2, $f0
/* 27268 80026668 4624103C */  c.lt.d     $f2, $f4
/* 2726C 8002666C 00000000 */  nop
/* 27270 80026670 45000004 */  bc1f       .L80026684
/* 27274 80026674 E6200000 */   swc1      $f0, ($s1)
/* 27278 80026678 3C01800E */  lui        $at, %hi(D_800DA088)
/* 2727C 8002667C C420A088 */  lwc1       $f0, %lo(D_800DA088)($at)
/* 27280 80026680 E6200000 */  swc1       $f0, ($s1)
.L80026684:
/* 27284 80026684 3C05800E */  lui        $a1, 0x800e
/* 27288 80026688 C6200000 */  lwc1       $f0, ($s1)
/* 2728C 8002668C 8E440000 */  lw         $a0, ($s2)
/* 27290 80026690 460000A1 */  cvt.d.s    $f2, $f0
/* 27294 80026694 44071000 */  mfc1       $a3, $f2
/* 27298 80026698 44061800 */  mfc1       $a2, $f3
/* 2729C 8002669C 0C0333AC */  jal        sprintf
/* 272A0 800266A0 24A5A038 */   addiu     $a1, $a1, -0x5fc8
.L800266A4:
/* 272A4 800266A4 8FBF001C */  lw         $ra, 0x1c($sp)
.L800266A8:
/* 272A8 800266A8 8FB20018 */  lw         $s2, 0x18($sp)
/* 272AC 800266AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 272B0 800266B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 272B4 800266B4 00001021 */  addu       $v0, $zero, $zero
/* 272B8 800266B8 03E00008 */  jr         $ra
/* 272BC 800266BC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel smaller_debug_menu
/* 272C0 800266C0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 272C4 800266C4 2404007C */  addiu      $a0, $zero, 0x7c
/* 272C8 800266C8 AFB20020 */  sw         $s2, 0x20($sp)
/* 272CC 800266CC 3C12800E */  lui        $s2, %hi(PlayerCharStruct)
/* 272D0 800266D0 26526950 */  addiu      $s2, $s2, %lo(PlayerCharStruct)
/* 272D4 800266D4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 272D8 800266D8 AFB30024 */  sw         $s3, 0x24($sp)
/* 272DC 800266DC AFB1001C */  sw         $s1, 0x1c($sp)
/* 272E0 800266E0 AFB00018 */  sw         $s0, 0x18($sp)
/* 272E4 800266E4 0C026259 */  jal        passToMalloc
/* 272E8 800266E8 8E53155C */   lw        $s3, 0x155c($s2)
/* 272EC 800266EC 0C02E658 */  jal        widget_menu_build
/* 272F0 800266F0 00402021 */   addu      $a0, $v0, $zero
/* 272F4 800266F4 2404007C */  addiu      $a0, $zero, 0x7c
/* 272F8 800266F8 0C026259 */  jal        passToMalloc
/* 272FC 800266FC AE420014 */   sw        $v0, 0x14($s2)
/* 27300 80026700 240401C5 */  addiu      $a0, $zero, 0x1c5
/* 27304 80026704 0C0290E2 */  jal        get_borg_8
/* 27308 80026708 00408021 */   addu      $s0, $v0, $zero
/* 2730C 8002670C 02002021 */  addu       $a0, $s0, $zero
/* 27310 80026710 0C02E518 */  jal        borg8_widget
/* 27314 80026714 00402821 */   addu      $a1, $v0, $zero
/* 27318 80026718 8E460014 */  lw         $a2, 0x14($s2)
/* 2731C 8002671C 00408021 */  addu       $s0, $v0, $zero
/* 27320 80026720 8CC30078 */  lw         $v1, 0x78($a2)
/* 27324 80026724 02002821 */  addu       $a1, $s0, $zero
/* 27328 80026728 84640030 */  lh         $a0, 0x30($v1)
/* 2732C 8002672C 8C620034 */  lw         $v0, 0x34($v1)
/* 27330 80026730 0040F809 */  jalr       $v0
/* 27334 80026734 00C42021 */   addu      $a0, $a2, $a0
/* 27338 80026738 02002021 */  addu       $a0, $s0, $zero
/* 2733C 8002673C 00002821 */  addu       $a1, $zero, $zero
/* 27340 80026740 0C02DD3F */  jal        set_widget_coords
/* 27344 80026744 00003021 */   addu      $a2, $zero, $zero
/* 27348 80026748 02002021 */  addu       $a0, $s0, $zero
/* 2734C 8002674C 0C02DD46 */  jal        set_widgetWidth
/* 27350 80026750 240500F0 */   addiu     $a1, $zero, 0xf0
/* 27354 80026754 02002021 */  addu       $a0, $s0, $zero
/* 27358 80026758 0C02DD42 */  jal        set_widgetHeight
/* 2735C 8002675C 24050140 */   addiu     $a1, $zero, 0x140
/* 27360 80026760 0C026259 */  jal        passToMalloc
/* 27364 80026764 2404007C */   addiu     $a0, $zero, 0x7c
/* 27368 80026768 00402021 */  addu       $a0, $v0, $zero
/* 2736C 8002676C 3C05800E */  lui        $a1, %hi(D_800DA08C)
/* 27370 80026770 24A5A08C */  addiu      $a1, $a1, %lo(D_800DA08C)
/* 27374 80026774 0C02E3A0 */  jal        widgettext_func_2
/* 27378 80026778 24060190 */   addiu     $a2, $zero, 0x190
/* 2737C 8002677C 240500C8 */  addiu      $a1, $zero, 0xc8
/* 27380 80026780 240600C8 */  addiu      $a2, $zero, 0xc8
/* 27384 80026784 00408021 */  addu       $s0, $v0, $zero
/* 27388 80026788 8E080078 */  lw         $t0, 0x78($s0)
/* 2738C 8002678C 24070064 */  addiu      $a3, $zero, 0x64
/* 27390 80026790 85040048 */  lh         $a0, 0x48($t0)
/* 27394 80026794 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27398 80026798 AFA20010 */  sw         $v0, 0x10($sp)
/* 2739C 8002679C 8D03004C */  lw         $v1, 0x4c($t0)
/* 273A0 800267A0 0060F809 */  jalr       $v1
/* 273A4 800267A4 02042021 */   addu      $a0, $s0, $a0
/* 273A8 800267A8 02002021 */  addu       $a0, $s0, $zero
/* 273AC 800267AC 24050082 */  addiu      $a1, $zero, 0x82
/* 273B0 800267B0 0C02DD3F */  jal        set_widget_coords
/* 273B4 800267B4 24060028 */   addiu     $a2, $zero, 0x28
/* 273B8 800267B8 8E460014 */  lw         $a2, 0x14($s2)
/* 273BC 800267BC 8CC30078 */  lw         $v1, 0x78($a2)
/* 273C0 800267C0 02002821 */  addu       $a1, $s0, $zero
/* 273C4 800267C4 84640030 */  lh         $a0, 0x30($v1)
/* 273C8 800267C8 8C620034 */  lw         $v0, 0x34($v1)
/* 273CC 800267CC 0040F809 */  jalr       $v0
/* 273D0 800267D0 00C42021 */   addu      $a0, $a2, $a0
/* 273D4 800267D4 0C026259 */  jal        passToMalloc
/* 273D8 800267D8 2404007C */   addiu     $a0, $zero, 0x7c
/* 273DC 800267DC 00402021 */  addu       $a0, $v0, $zero
/* 273E0 800267E0 0C02E68C */  jal        widgetscrollmenu_init
/* 273E4 800267E4 2405000A */   addiu     $a1, $zero, 0xa
/* 273E8 800267E8 8E460014 */  lw         $a2, 0x14($s2)
/* 273EC 800267EC 00408821 */  addu       $s1, $v0, $zero
/* 273F0 800267F0 8CC30078 */  lw         $v1, 0x78($a2)
/* 273F4 800267F4 02202821 */  addu       $a1, $s1, $zero
/* 273F8 800267F8 84640030 */  lh         $a0, 0x30($v1)
/* 273FC 800267FC 8C620034 */  lw         $v0, 0x34($v1)
/* 27400 80026800 0040F809 */  jalr       $v0
/* 27404 80026804 00C42021 */   addu      $a0, $a2, $a0
/* 27408 80026808 02202021 */  addu       $a0, $s1, $zero
/* 2740C 8002680C 24050078 */  addiu      $a1, $zero, 0x78
/* 27410 80026810 0C02DD3F */  jal        set_widget_coords
/* 27414 80026814 24060041 */   addiu     $a2, $zero, 0x41
/* 27418 80026818 24050096 */  addiu      $a1, $zero, 0x96
/* 2741C 8002681C 24060096 */  addiu      $a2, $zero, 0x96
/* 27420 80026820 8E220078 */  lw         $v0, 0x78($s1)
/* 27424 80026824 24070096 */  addiu      $a3, $zero, 0x96
/* 27428 80026828 84440048 */  lh         $a0, 0x48($v0)
/* 2742C 8002682C 24100096 */  addiu      $s0, $zero, 0x96
/* 27430 80026830 AFB00010 */  sw         $s0, 0x10($sp)
/* 27434 80026834 8C43004C */  lw         $v1, 0x4c($v0)
/* 27438 80026838 0060F809 */  jalr       $v1
/* 2743C 8002683C 02242021 */   addu      $a0, $s1, $a0
/* 27440 80026840 2404007C */  addiu      $a0, $zero, 0x7c
/* 27444 80026844 240500FA */  addiu      $a1, $zero, 0xfa
/* 27448 80026848 8E220040 */  lw         $v0, 0x40($s1)
/* 2744C 8002684C 2403000A */  addiu      $v1, $zero, 0xa
/* 27450 80026850 A0500002 */  sb         $s0, 2($v0)
/* 27454 80026854 A0450003 */  sb         $a1, 3($v0)
/* 27458 80026858 A0500004 */  sb         $s0, 4($v0)
/* 2745C 8002685C A0450005 */  sb         $a1, 5($v0)
/* 27460 80026860 A0500006 */  sb         $s0, 6($v0)
/* 27464 80026864 A0450007 */  sb         $a1, 7($v0)
/* 27468 80026868 A0500008 */  sb         $s0, 8($v0)
/* 2746C 8002686C A0450009 */  sb         $a1, 9($v0)
/* 27470 80026870 0C026259 */  jal        passToMalloc
/* 27474 80026874 A043000A */   sb        $v1, 0xa($v0)
/* 27478 80026878 00402021 */  addu       $a0, $v0, $zero
/* 2747C 8002687C 3C05800E */  lui        $a1, %hi(D_800DA094)
/* 27480 80026880 24A5A094 */  addiu      $a1, $a1, %lo(D_800DA094)
/* 27484 80026884 0C02E3A0 */  jal        widgettext_func_2
/* 27488 80026888 24060190 */   addiu     $a2, $zero, 0x190
/* 2748C 8002688C 02202021 */  addu       $a0, $s1, $zero
/* 27490 80026890 0C02E885 */  jal        link_widget_text
/* 27494 80026894 00402821 */   addu      $a1, $v0, $zero
/* 27498 80026898 0C026259 */  jal        passToMalloc
/* 2749C 8002689C 2404007C */   addiu     $a0, $zero, 0x7c
/* 274A0 800268A0 00402021 */  addu       $a0, $v0, $zero
/* 274A4 800268A4 3C05800E */  lui        $a1, %hi(D_800DA0A0)
/* 274A8 800268A8 24A5A0A0 */  addiu      $a1, $a1, %lo(D_800DA0A0)
/* 274AC 800268AC 0C02E3A0 */  jal        widgettext_func_2
/* 274B0 800268B0 24060190 */   addiu     $a2, $zero, 0x190
/* 274B4 800268B4 02202021 */  addu       $a0, $s1, $zero
/* 274B8 800268B8 0C02E885 */  jal        link_widget_text
/* 274BC 800268BC 00402821 */   addu      $a1, $v0, $zero
/* 274C0 800268C0 0C026259 */  jal        passToMalloc
/* 274C4 800268C4 2404007C */   addiu     $a0, $zero, 0x7c
/* 274C8 800268C8 00402021 */  addu       $a0, $v0, $zero
/* 274CC 800268CC 3C05800E */  lui        $a1, %hi(D_800DA0A8)
/* 274D0 800268D0 24A5A0A8 */  addiu      $a1, $a1, %lo(D_800DA0A8)
/* 274D4 800268D4 0C02E3A0 */  jal        widgettext_func_2
/* 274D8 800268D8 24060190 */   addiu     $a2, $zero, 0x190
/* 274DC 800268DC 02202021 */  addu       $a0, $s1, $zero
/* 274E0 800268E0 0C02E885 */  jal        link_widget_text
/* 274E4 800268E4 00402821 */   addu      $a1, $v0, $zero
/* 274E8 800268E8 0C026259 */  jal        passToMalloc
/* 274EC 800268EC 2404007C */   addiu     $a0, $zero, 0x7c
/* 274F0 800268F0 00402021 */  addu       $a0, $v0, $zero
/* 274F4 800268F4 3C05800E */  lui        $a1, %hi(D_800DA0B0)
/* 274F8 800268F8 24A5A0B0 */  addiu      $a1, $a1, %lo(D_800DA0B0)
/* 274FC 800268FC 0C02E3A0 */  jal        widgettext_func_2
/* 27500 80026900 24060190 */   addiu     $a2, $zero, 0x190
/* 27504 80026904 02202021 */  addu       $a0, $s1, $zero
/* 27508 80026908 0C02E885 */  jal        link_widget_text
/* 2750C 8002690C 00402821 */   addu      $a1, $v0, $zero
/* 27510 80026910 0C026259 */  jal        passToMalloc
/* 27514 80026914 2404007C */   addiu     $a0, $zero, 0x7c
/* 27518 80026918 00402021 */  addu       $a0, $v0, $zero
/* 2751C 8002691C 3C05800E */  lui        $a1, %hi(D_800DA0CC)
/* 27520 80026920 24A5A0CC */  addiu      $a1, $a1, %lo(D_800DA0CC)
/* 27524 80026924 0C02E3A0 */  jal        widgettext_func_2
/* 27528 80026928 24060190 */   addiu     $a2, $zero, 0x190
/* 2752C 8002692C 02202021 */  addu       $a0, $s1, $zero
/* 27530 80026930 0C02E885 */  jal        link_widget_text
/* 27534 80026934 00402821 */   addu      $a1, $v0, $zero
/* 27538 80026938 02602021 */  addu       $a0, $s3, $zero
/* 2753C 8002693C 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetUpFunc)
/* 27540 80026940 24426170 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetUpFunc)
/* 27544 80026944 3C038002 */  lui        $v1, %hi(SmallerDebugWidgetDownFunc)
/* 27548 80026948 8E460014 */  lw         $a2, 0x14($s2)
/* 2754C 8002694C 246361EC */  addiu      $v1, $v1, %lo(SmallerDebugWidgetDownFunc)
/* 27550 80026950 00C02821 */  addu       $a1, $a2, $zero
/* 27554 80026954 ACC20008 */  sw         $v0, 8($a2)
/* 27558 80026958 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetAFunc)
/* 2755C 8002695C 24426268 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetAFunc)
/* 27560 80026960 ACC3000C */  sw         $v1, 0xc($a2)
/* 27564 80026964 3C038002 */  lui        $v1, %hi(SmallerDebugWidget_ret_a1)
/* 27568 80026968 24636294 */  addiu      $v1, $v1, %lo(SmallerDebugWidget_ret_a1)
/* 2756C 8002696C ACC20018 */  sw         $v0, 0x18($a2)
/* 27570 80026970 ACC3001C */  sw         $v1, 0x1c($a2)
/* 27574 80026974 ACC30020 */  sw         $v1, 0x20($a2)
/* 27578 80026978 0C02DC7C */  jal        widgetHandler
/* 2757C 8002697C ACD10040 */   sw        $s1, 0x40($a2)
/* 27580 80026980 8FBF0028 */  lw         $ra, 0x28($sp)
/* 27584 80026984 8FB30024 */  lw         $s3, 0x24($sp)
/* 27588 80026988 8FB20020 */  lw         $s2, 0x20($sp)
/* 2758C 8002698C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 27590 80026990 8FB00018 */  lw         $s0, 0x18($sp)
/* 27594 80026994 03E00008 */  jr         $ra
/* 27598 80026998 27BD0030 */   addiu     $sp, $sp, 0x30

glabel debug_combat_options
/* 2759C 8002699C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 275A0 800269A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 275A4 800269A4 00808021 */  addu       $s0, $a0, $zero
/* 275A8 800269A8 3C03800E */  lui        $v1, %hi(PlayerCharStruct)
/* 275AC 800269AC AFBF0018 */  sw         $ra, 0x18($sp)
/* 275B0 800269B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 275B4 800269B4 8E050078 */  lw         $a1, 0x78($s0)
/* 275B8 800269B8 24716950 */  addiu      $s1, $v1, %lo(PlayerCharStruct)
/* 275BC 800269BC 84A40010 */  lh         $a0, 0x10($a1)
/* 275C0 800269C0 8CA20014 */  lw         $v0, 0x14($a1)
/* 275C4 800269C4 0040F809 */  jalr       $v0
/* 275C8 800269C8 02042021 */   addu      $a0, $s0, $a0
/* 275CC 800269CC 54400069 */  bnel       $v0, $zero, .L80026B74
/* 275D0 800269D0 8E220014 */   lw        $v0, 0x14($s1)
/* 275D4 800269D4 8E100040 */  lw         $s0, 0x40($s0)
/* 275D8 800269D8 3C05800E */  lui        $a1, %hi(D_800DA0A8)
/* 275DC 800269DC 8E040000 */  lw         $a0, ($s0)
/* 275E0 800269E0 0C0262BE */  jal        func_80098AF8
/* 275E4 800269E4 24A5A0A8 */   addiu     $a1, $a1, %lo(D_800DA0A8)
/* 275E8 800269E8 54400010 */  bnel       $v0, $zero, .L80026A2C
/* 275EC 800269EC 8E040000 */   lw        $a0, ($s0)
/* 275F0 800269F0 8E24155C */  lw         $a0, 0x155c($s1)
/* 275F4 800269F4 0C02DCB3 */  jal        func_800B72CC
/* 275F8 800269F8 8E250014 */   lw        $a1, 0x14($s1)
/* 275FC 800269FC 8E260014 */  lw         $a2, 0x14($s1)
/* 27600 80026A00 10C00006 */  beqz       $a2, .L80026A1C
/* 27604 80026A04 24050003 */   addiu     $a1, $zero, 3
/* 27608 80026A08 8CC20078 */  lw         $v0, 0x78($a2)
/* 2760C 80026A0C 84440008 */  lh         $a0, 8($v0)
/* 27610 80026A10 8C43000C */  lw         $v1, 0xc($v0)
/* 27614 80026A14 0060F809 */  jalr       $v1
/* 27618 80026A18 00C42021 */   addu      $a0, $a2, $a0
.L80026A1C:
/* 2761C 80026A1C 24020002 */  addiu      $v0, $zero, 2
/* 27620 80026A20 AE200014 */  sw         $zero, 0x14($s1)
/* 27624 80026A24 08009AE3 */  j          .L80026B8C
/* 27628 80026A28 A2220034 */   sb        $v0, 0x34($s1)
.L80026A2C:
/* 2762C 80026A2C 3C05800E */  lui        $a1, %hi(D_800DA0B0)
/* 27630 80026A30 0C0262BE */  jal        func_80098AF8
/* 27634 80026A34 24A5A0B0 */   addiu     $a1, $a1, %lo(D_800DA0B0)
/* 27638 80026A38 54400012 */  bnel       $v0, $zero, .L80026A84
/* 2763C 80026A3C 8E040000 */   lw        $a0, ($s0)
/* 27640 80026A40 8E24155C */  lw         $a0, 0x155c($s1)
/* 27644 80026A44 0C02DCB3 */  jal        func_800B72CC
/* 27648 80026A48 8E250014 */   lw        $a1, 0x14($s1)
/* 2764C 80026A4C 8E260014 */  lw         $a2, 0x14($s1)
/* 27650 80026A50 10C00006 */  beqz       $a2, .L80026A6C
/* 27654 80026A54 24050003 */   addiu     $a1, $zero, 3
/* 27658 80026A58 8CC20078 */  lw         $v0, 0x78($a2)
/* 2765C 80026A5C 84440008 */  lh         $a0, 8($v0)
/* 27660 80026A60 8C43000C */  lw         $v1, 0xc($v0)
/* 27664 80026A64 0060F809 */  jalr       $v1
/* 27668 80026A68 00C42021 */   addu      $a0, $a2, $a0
.L80026A6C:
/* 2766C 80026A6C 0C00A7D0 */  jal        random_enemy_generator
/* 27670 80026A70 AE200014 */   sw        $zero, 0x14($s1)
/* 27674 80026A74 0C009BD5 */  jal        choose_combat_arena
/* 27678 80026A78 00000000 */   nop
/* 2767C 80026A7C 08009AE4 */  j          .L80026B90
/* 27680 80026A80 8FBF0018 */   lw        $ra, 0x18($sp)
.L80026A84:
/* 27684 80026A84 3C05800E */  lui        $a1, %hi(D_800DA0CC)
/* 27688 80026A88 0C0262BE */  jal        func_80098AF8
/* 2768C 80026A8C 24A5A0CC */   addiu     $a1, $a1, %lo(D_800DA0CC)
/* 27690 80026A90 54400010 */  bnel       $v0, $zero, .L80026AD4
/* 27694 80026A94 8E040000 */   lw        $a0, ($s0)
/* 27698 80026A98 8E24155C */  lw         $a0, 0x155c($s1)
/* 2769C 80026A9C 0C02DCB3 */  jal        func_800B72CC
/* 276A0 80026AA0 8E250014 */   lw        $a1, 0x14($s1)
/* 276A4 80026AA4 8E260014 */  lw         $a2, 0x14($s1)
/* 276A8 80026AA8 10C00006 */  beqz       $a2, .L80026AC4
/* 276AC 80026AAC 24050003 */   addiu     $a1, $zero, 3
/* 276B0 80026AB0 8CC20078 */  lw         $v0, 0x78($a2)
/* 276B4 80026AB4 84440008 */  lh         $a0, 8($v0)
/* 276B8 80026AB8 8C43000C */  lw         $v1, 0xc($v0)
/* 276BC 80026ABC 0060F809 */  jalr       $v1
/* 276C0 80026AC0 00C42021 */   addu      $a0, $a2, $a0
.L80026AC4:
/* 276C4 80026AC4 0C009AE8 */  jal        create_enemy_list
/* 276C8 80026AC8 AE200014 */   sw        $zero, 0x14($s1)
/* 276CC 80026ACC 08009AE4 */  j          .L80026B90
/* 276D0 80026AD0 8FBF0018 */   lw        $ra, 0x18($sp)
.L80026AD4:
/* 276D4 80026AD4 3C05800E */  lui        $a1, %hi(D_800DA094)
/* 276D8 80026AD8 0C0262BE */  jal        func_80098AF8
/* 276DC 80026ADC 24A5A094 */   addiu     $a1, $a1, %lo(D_800DA094)
/* 276E0 80026AE0 54400010 */  bnel       $v0, $zero, .L80026B24
/* 276E4 80026AE4 8E040000 */   lw        $a0, ($s0)
/* 276E8 80026AE8 8E24155C */  lw         $a0, 0x155c($s1)
/* 276EC 80026AEC 0C02DCB3 */  jal        func_800B72CC
/* 276F0 80026AF0 8E250014 */   lw        $a1, 0x14($s1)
/* 276F4 80026AF4 8E260014 */  lw         $a2, 0x14($s1)
/* 276F8 80026AF8 10C00006 */  beqz       $a2, .L80026B14
/* 276FC 80026AFC 24050003 */   addiu     $a1, $zero, 3
/* 27700 80026B00 8CC20078 */  lw         $v0, 0x78($a2)
/* 27704 80026B04 84440008 */  lh         $a0, 8($v0)
/* 27708 80026B08 8C43000C */  lw         $v1, 0xc($v0)
/* 2770C 80026B0C 0060F809 */  jalr       $v1
/* 27710 80026B10 00C42021 */   addu      $a0, $a2, $a0
.L80026B14:
/* 27714 80026B14 0C009D96 */  jal        func_80027658
/* 27718 80026B18 AE200014 */   sw        $zero, 0x14($s1)
/* 2771C 80026B1C 08009AE4 */  j          .L80026B90
/* 27720 80026B20 8FBF0018 */   lw        $ra, 0x18($sp)
.L80026B24:
/* 27724 80026B24 3C05800E */  lui        $a1, %hi(D_800DA0A0)
/* 27728 80026B28 0C0262BE */  jal        func_80098AF8
/* 2772C 80026B2C 24A5A0A0 */   addiu     $a1, $a1, %lo(D_800DA0A0)
/* 27730 80026B30 14400017 */  bnez       $v0, .L80026B90
/* 27734 80026B34 8FBF0018 */   lw        $ra, 0x18($sp)
/* 27738 80026B38 8E24155C */  lw         $a0, 0x155c($s1)
/* 2773C 80026B3C 0C02DCB3 */  jal        func_800B72CC
/* 27740 80026B40 8E250014 */   lw        $a1, 0x14($s1)
/* 27744 80026B44 8E260014 */  lw         $a2, 0x14($s1)
/* 27748 80026B48 10C00006 */  beqz       $a2, .L80026B64
/* 2774C 80026B4C 24050003 */   addiu     $a1, $zero, 3
/* 27750 80026B50 8CC20078 */  lw         $v0, 0x78($a2)
/* 27754 80026B54 84440008 */  lh         $a0, 8($v0)
/* 27758 80026B58 8C43000C */  lw         $v1, 0xc($v0)
/* 2775C 80026B5C 0060F809 */  jalr       $v1
/* 27760 80026B60 00C42021 */   addu      $a0, $a2, $a0
.L80026B64:
/* 27764 80026B64 0C009CAE */  jal        change_actor_menu
/* 27768 80026B68 AE200014 */   sw        $zero, 0x14($s1)
/* 2776C 80026B6C 08009AE4 */  j          .L80026B90
/* 27770 80026B70 8FBF0018 */   lw        $ra, 0x18($sp)
.L80026B74:
/* 27774 80026B74 16020006 */  bne        $s0, $v0, .L80026B90
/* 27778 80026B78 8FBF0018 */   lw        $ra, 0x18($sp)
/* 2777C 80026B7C 8E24155C */  lw         $a0, 0x155c($s1)
/* 27780 80026B80 0C02DC59 */  jal        func_800B7164
/* 27784 80026B84 02002821 */   addu      $a1, $s0, $zero
/* 27788 80026B88 AE200014 */  sw         $zero, 0x14($s1)
.L80026B8C:
/* 2778C 80026B8C 8FBF0018 */  lw         $ra, 0x18($sp)
.L80026B90:
/* 27790 80026B90 8FB10014 */  lw         $s1, 0x14($sp)
/* 27794 80026B94 8FB00010 */  lw         $s0, 0x10($sp)
/* 27798 80026B98 03E00008 */  jr         $ra
/* 2779C 80026B9C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel create_enemy_list
/* 277A0 80026BA0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 277A4 80026BA4 2404007C */  addiu      $a0, $zero, 0x7c
/* 277A8 80026BA8 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 277AC 80026BAC AFB5002C */  sw         $s5, 0x2c($sp)
/* 277B0 80026BB0 24556950 */  addiu      $s5, $v0, %lo(PlayerCharStruct)
/* 277B4 80026BB4 AFBF0034 */  sw         $ra, 0x34($sp)
/* 277B8 80026BB8 AFB60030 */  sw         $s6, 0x30($sp)
/* 277BC 80026BBC AFB40028 */  sw         $s4, 0x28($sp)
/* 277C0 80026BC0 AFB30024 */  sw         $s3, 0x24($sp)
/* 277C4 80026BC4 AFB20020 */  sw         $s2, 0x20($sp)
/* 277C8 80026BC8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 277CC 80026BCC AFB00018 */  sw         $s0, 0x18($sp)
/* 277D0 80026BD0 0C026259 */  jal        passToMalloc
/* 277D4 80026BD4 8EB6155C */   lw        $s6, 0x155c($s5)
/* 277D8 80026BD8 0C02E658 */  jal        widget_menu_build
/* 277DC 80026BDC 00402021 */   addu      $a0, $v0, $zero
/* 277E0 80026BE0 2404007C */  addiu      $a0, $zero, 0x7c
/* 277E4 80026BE4 0C026259 */  jal        passToMalloc
/* 277E8 80026BE8 AEA20024 */   sw        $v0, 0x24($s5)
/* 277EC 80026BEC 240401C5 */  addiu      $a0, $zero, 0x1c5
/* 277F0 80026BF0 0C0290E2 */  jal        get_borg_8
/* 277F4 80026BF4 00408021 */   addu      $s0, $v0, $zero
/* 277F8 80026BF8 02002021 */  addu       $a0, $s0, $zero
/* 277FC 80026BFC 0C02E518 */  jal        borg8_widget
/* 27800 80026C00 00402821 */   addu      $a1, $v0, $zero
/* 27804 80026C04 8EA60024 */  lw         $a2, 0x24($s5)
/* 27808 80026C08 00408021 */  addu       $s0, $v0, $zero
/* 2780C 80026C0C 8CC30078 */  lw         $v1, 0x78($a2)
/* 27810 80026C10 02002821 */  addu       $a1, $s0, $zero
/* 27814 80026C14 84640030 */  lh         $a0, 0x30($v1)
/* 27818 80026C18 8C620034 */  lw         $v0, 0x34($v1)
/* 2781C 80026C1C 0040F809 */  jalr       $v0
/* 27820 80026C20 00C42021 */   addu      $a0, $a2, $a0
/* 27824 80026C24 02002021 */  addu       $a0, $s0, $zero
/* 27828 80026C28 00002821 */  addu       $a1, $zero, $zero
/* 2782C 80026C2C 0C02DD3F */  jal        set_widget_coords
/* 27830 80026C30 00003021 */   addu      $a2, $zero, $zero
/* 27834 80026C34 02002021 */  addu       $a0, $s0, $zero
/* 27838 80026C38 0C02DD46 */  jal        set_widgetWidth
/* 2783C 80026C3C 240500F0 */   addiu     $a1, $zero, 0xf0
/* 27840 80026C40 02002021 */  addu       $a0, $s0, $zero
/* 27844 80026C44 0C02DD42 */  jal        set_widgetHeight
/* 27848 80026C48 24050140 */   addiu     $a1, $zero, 0x140
/* 2784C 80026C4C 0C026259 */  jal        passToMalloc
/* 27850 80026C50 2404007C */   addiu     $a0, $zero, 0x7c
/* 27854 80026C54 00402021 */  addu       $a0, $v0, $zero
/* 27858 80026C58 3C05800E */  lui        $a1, %hi(D_800DA0E4)
/* 2785C 80026C5C 24A5A0E4 */  addiu      $a1, $a1, %lo(D_800DA0E4)
/* 27860 80026C60 0C02E3A0 */  jal        widgettext_func_2
/* 27864 80026C64 24060190 */   addiu     $a2, $zero, 0x190
/* 27868 80026C68 00408821 */  addu       $s1, $v0, $zero
/* 2786C 80026C6C 240500C8 */  addiu      $a1, $zero, 0xc8
/* 27870 80026C70 240600C8 */  addiu      $a2, $zero, 0xc8
/* 27874 80026C74 8E280078 */  lw         $t0, 0x78($s1)
/* 27878 80026C78 240700C8 */  addiu      $a3, $zero, 0xc8
/* 2787C 80026C7C 85040048 */  lh         $a0, 0x48($t0)
/* 27880 80026C80 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27884 80026C84 AFA20010 */  sw         $v0, 0x10($sp)
/* 27888 80026C88 8D03004C */  lw         $v1, 0x4c($t0)
/* 2788C 80026C8C 0060F809 */  jalr       $v1
/* 27890 80026C90 02242021 */   addu      $a0, $s1, $a0
/* 27894 80026C94 02202021 */  addu       $a0, $s1, $zero
/* 27898 80026C98 24050028 */  addiu      $a1, $zero, 0x28
/* 2789C 80026C9C 0C02DD3F */  jal        set_widget_coords
/* 278A0 80026CA0 24060032 */   addiu     $a2, $zero, 0x32
/* 278A4 80026CA4 8EA60024 */  lw         $a2, 0x24($s5)
/* 278A8 80026CA8 8CC30078 */  lw         $v1, 0x78($a2)
/* 278AC 80026CAC 02202821 */  addu       $a1, $s1, $zero
/* 278B0 80026CB0 84640030 */  lh         $a0, 0x30($v1)
/* 278B4 80026CB4 8C620034 */  lw         $v0, 0x34($v1)
/* 278B8 80026CB8 0040F809 */  jalr       $v0
/* 278BC 80026CBC 00C42021 */   addu      $a0, $a2, $a0
/* 278C0 80026CC0 0C026259 */  jal        passToMalloc
/* 278C4 80026CC4 2404007C */   addiu     $a0, $zero, 0x7c
/* 278C8 80026CC8 3C10800F */  lui        $s0, %hi(EntityPointer)
/* 278CC 80026CCC 8E0313A0 */  lw         $v1, %lo(EntityPointer)($s0)
/* 278D0 80026CD0 90650000 */  lbu        $a1, ($v1)
/* 278D4 80026CD4 0C02E68C */  jal        widgetscrollmenu_init
/* 278D8 80026CD8 00402021 */   addu      $a0, $v0, $zero
/* 278DC 80026CDC 00409821 */  addu       $s3, $v0, $zero
/* 278E0 80026CE0 02602021 */  addu       $a0, $s3, $zero
/* 278E4 80026CE4 24050028 */  addiu      $a1, $zero, 0x28
/* 278E8 80026CE8 0C02DD3F */  jal        set_widget_coords
/* 278EC 80026CEC 2406004B */   addiu     $a2, $zero, 0x4b
/* 278F0 80026CF0 8E0213A0 */  lw         $v0, 0x13a0($s0)
/* 278F4 80026CF4 00009021 */  addu       $s2, $zero, $zero
/* 278F8 80026CF8 90430000 */  lbu        $v1, ($v0)
/* 278FC 80026CFC 1060001B */  beqz       $v1, .L80026D6C
/* 27900 80026D00 0200A021 */   addu      $s4, $s0, $zero
/* 27904 80026D04 8E8213A0 */  lw         $v0, 0x13a0($s4)
.L80026D08:
/* 27908 80026D08 8C440010 */  lw         $a0, 0x10($v0)
/* 2790C 80026D0C 001219C0 */  sll        $v1, $s2, 7
/* 27910 80026D10 00838021 */  addu       $s0, $a0, $v1
/* 27914 80026D14 0C019490 */  jal        EntityCannotFight
/* 27918 80026D18 96040000 */   lhu       $a0, ($s0)
/* 2791C 80026D1C 1440000E */  bnez       $v0, .L80026D58
/* 27920 80026D20 8E8213A0 */   lw        $v0, 0x13a0($s4)
/* 27924 80026D24 0C026259 */  jal        passToMalloc
/* 27928 80026D28 2404007C */   addiu     $a0, $zero, 0x7c
/* 2792C 80026D2C 00402021 */  addu       $a0, $v0, $zero
/* 27930 80026D30 26050002 */  addiu      $a1, $s0, 2
/* 27934 80026D34 0C02E3A0 */  jal        widgettext_func_2
/* 27938 80026D38 24060190 */   addiu     $a2, $zero, 0x190
/* 2793C 80026D3C 00408821 */  addu       $s1, $v0, $zero
/* 27940 80026D40 02602021 */  addu       $a0, $s3, $zero
/* 27944 80026D44 96020000 */  lhu        $v0, ($s0)
/* 27948 80026D48 02202821 */  addu       $a1, $s1, $zero
/* 2794C 80026D4C 0C02E885 */  jal        link_widget_text
/* 27950 80026D50 A622005E */   sh        $v0, 0x5e($s1)
/* 27954 80026D54 8E8213A0 */  lw         $v0, 0x13a0($s4)
.L80026D58:
/* 27958 80026D58 90430000 */  lbu        $v1, ($v0)
/* 2795C 80026D5C 26520001 */  addiu      $s2, $s2, 1
/* 27960 80026D60 0243182A */  slt        $v1, $s2, $v1
/* 27964 80026D64 1460FFE8 */  bnez       $v1, .L80026D08
/* 27968 80026D68 8E8213A0 */   lw        $v0, 0x13a0($s4)
.L80026D6C:
/* 2796C 80026D6C 24050096 */  addiu      $a1, $zero, 0x96
/* 27970 80026D70 24060096 */  addiu      $a2, $zero, 0x96
/* 27974 80026D74 24070096 */  addiu      $a3, $zero, 0x96
/* 27978 80026D78 8E680078 */  lw         $t0, 0x78($s3)
/* 2797C 80026D7C 2402004B */  addiu      $v0, $zero, 0x4b
/* 27980 80026D80 A6620068 */  sh         $v0, 0x68($s3)
/* 27984 80026D84 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27988 80026D88 A662006A */  sh         $v0, 0x6a($s3)
/* 2798C 80026D8C 85040048 */  lh         $a0, 0x48($t0)
/* 27990 80026D90 24020096 */  addiu      $v0, $zero, 0x96
/* 27994 80026D94 AFA20010 */  sw         $v0, 0x10($sp)
/* 27998 80026D98 8D03004C */  lw         $v1, 0x4c($t0)
/* 2799C 80026D9C 0060F809 */  jalr       $v1
/* 279A0 80026DA0 02642021 */   addu      $a0, $s3, $a0
/* 279A4 80026DA4 8E640040 */  lw         $a0, 0x40($s3)
/* 279A8 80026DA8 24020014 */  addiu      $v0, $zero, 0x14
/* 279AC 80026DAC A0820000 */  sb         $v0, ($a0)
/* 279B0 80026DB0 8EA40024 */  lw         $a0, 0x24($s5)
/* 279B4 80026DB4 8C860078 */  lw         $a2, 0x78($a0)
/* 279B8 80026DB8 02602821 */  addu       $a1, $s3, $zero
/* 279BC 80026DBC AC930040 */  sw         $s3, 0x40($a0)
/* 279C0 80026DC0 84C30030 */  lh         $v1, 0x30($a2)
/* 279C4 80026DC4 8CC20034 */  lw         $v0, 0x34($a2)
/* 279C8 80026DC8 0040F809 */  jalr       $v0
/* 279CC 80026DCC 00832021 */   addu      $a0, $a0, $v1
/* 279D0 80026DD0 02C02021 */  addu       $a0, $s6, $zero
/* 279D4 80026DD4 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetUpFunc)
/* 279D8 80026DD8 24426170 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetUpFunc)
/* 279DC 80026DDC 3C038002 */  lui        $v1, %hi(SmallerDebugWidgetDownFunc)
/* 279E0 80026DE0 8EA60024 */  lw         $a2, 0x24($s5)
/* 279E4 80026DE4 246361EC */  addiu      $v1, $v1, %lo(SmallerDebugWidgetDownFunc)
/* 279E8 80026DE8 00C02821 */  addu       $a1, $a2, $zero
/* 279EC 80026DEC ACC20008 */  sw         $v0, 8($a2)
/* 279F0 80026DF0 3C028002 */  lui        $v0, %hi(func_8002619C)
/* 279F4 80026DF4 2442619C */  addiu      $v0, $v0, %lo(func_8002619C)
/* 279F8 80026DF8 ACC3000C */  sw         $v1, 0xc($a2)
/* 279FC 80026DFC 3C038002 */  lui        $v1, %hi(func_80026218)
/* 27A00 80026E00 24636218 */  addiu      $v1, $v1, %lo(func_80026218)
/* 27A04 80026E04 ACC20010 */  sw         $v0, 0x10($a2)
/* 27A08 80026E08 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetAFunc)
/* 27A0C 80026E0C 24426268 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetAFunc)
/* 27A10 80026E10 ACC30014 */  sw         $v1, 0x14($a2)
/* 27A14 80026E14 3C038002 */  lui        $v1, %hi(SmallerDebugWidget_ret_a1)
/* 27A18 80026E18 24636294 */  addiu      $v1, $v1, %lo(SmallerDebugWidget_ret_a1)
/* 27A1C 80026E1C ACC20018 */  sw         $v0, 0x18($a2)
/* 27A20 80026E20 ACC3001C */  sw         $v1, 0x1c($a2)
/* 27A24 80026E24 0C02DC7C */  jal        widgetHandler
/* 27A28 80026E28 ACC30020 */   sw        $v1, 0x20($a2)
/* 27A2C 80026E2C 8FBF0034 */  lw         $ra, 0x34($sp)
/* 27A30 80026E30 8FB60030 */  lw         $s6, 0x30($sp)
/* 27A34 80026E34 8FB5002C */  lw         $s5, 0x2c($sp)
/* 27A38 80026E38 8FB40028 */  lw         $s4, 0x28($sp)
/* 27A3C 80026E3C 8FB30024 */  lw         $s3, 0x24($sp)
/* 27A40 80026E40 8FB20020 */  lw         $s2, 0x20($sp)
/* 27A44 80026E44 8FB1001C */  lw         $s1, 0x1c($sp)
/* 27A48 80026E48 8FB00018 */  lw         $s0, 0x18($sp)
/* 27A4C 80026E4C 03E00008 */  jr         $ra
/* 27A50 80026E50 27BD0038 */   addiu     $sp, $sp, 0x38

glabel prepare_singe_enemy
/* 27A54 80026E54 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 27A58 80026E58 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 27A5C 80026E5C AFB10014 */  sw         $s1, 0x14($sp)
/* 27A60 80026E60 24516950 */  addiu      $s1, $v0, %lo(PlayerCharStruct)
/* 27A64 80026E64 AFBF0018 */  sw         $ra, 0x18($sp)
/* 27A68 80026E68 AFB00010 */  sw         $s0, 0x10($sp)
/* 27A6C 80026E6C 8E230024 */  lw         $v1, 0x24($s1)
/* 27A70 80026E70 00808021 */  addu       $s0, $a0, $zero
/* 27A74 80026E74 56030011 */  bnel       $s0, $v1, .L80026EBC
/* 27A78 80026E78 8E030078 */   lw        $v1, 0x78($s0)
/* 27A7C 80026E7C 8E24155C */  lw         $a0, 0x155c($s1)
/* 27A80 80026E80 0C02DCB3 */  jal        func_800B72CC
/* 27A84 80026E84 02002821 */   addu      $a1, $s0, $zero
/* 27A88 80026E88 8E260024 */  lw         $a2, 0x24($s1)
/* 27A8C 80026E8C 10C00006 */  beqz       $a2, .L80026EA8
/* 27A90 80026E90 24050003 */   addiu     $a1, $zero, 3
/* 27A94 80026E94 8CC20078 */  lw         $v0, 0x78($a2)
/* 27A98 80026E98 84440008 */  lh         $a0, 8($v0)
/* 27A9C 80026E9C 8C43000C */  lw         $v1, 0xc($v0)
/* 27AA0 80026EA0 0060F809 */  jalr       $v1
/* 27AA4 80026EA4 00C42021 */   addu      $a0, $a2, $a0
.L80026EA8:
/* 27AA8 80026EA8 AE200024 */  sw         $zero, 0x24($s1)
/* 27AAC 80026EAC 0C0099B0 */  jal        smaller_debug_menu
/* 27AB0 80026EB0 00002021 */   addu      $a0, $zero, $zero
/* 27AB4 80026EB4 08009BD1 */  j          .L80026F44
/* 27AB8 80026EB8 8FBF0018 */   lw        $ra, 0x18($sp)
.L80026EBC:
/* 27ABC 80026EBC 84640010 */  lh         $a0, 0x10($v1)
/* 27AC0 80026EC0 8C620014 */  lw         $v0, 0x14($v1)
/* 27AC4 80026EC4 0040F809 */  jalr       $v0
/* 27AC8 80026EC8 02042021 */   addu      $a0, $s0, $a0
/* 27ACC 80026ECC 1440001D */  bnez       $v0, .L80026F44
/* 27AD0 80026ED0 8FBF0018 */   lw        $ra, 0x18($sp)
/* 27AD4 80026ED4 26241324 */  addiu      $a0, $s1, 0x1324
/* 27AD8 80026ED8 9602005E */  lhu        $v0, 0x5e($s0)
/* 27ADC 80026EDC 24030001 */  addiu      $v1, $zero, 1
/* 27AE0 80026EE0 A6221324 */  sh         $v0, 0x1324($s1)
/* 27AE4 80026EE4 00031040 */  sll        $v0, $v1, 1
.L80026EE8:
/* 27AE8 80026EE8 00821021 */  addu       $v0, $a0, $v0
/* 27AEC 80026EEC A4400000 */  sh         $zero, ($v0)
/* 27AF0 80026EF0 24630001 */  addiu      $v1, $v1, 1
/* 27AF4 80026EF4 306300FF */  andi       $v1, $v1, 0xff
/* 27AF8 80026EF8 2C62000C */  sltiu      $v0, $v1, 0xc
/* 27AFC 80026EFC 1440FFFA */  bnez       $v0, .L80026EE8
/* 27B00 80026F00 00031040 */   sll       $v0, $v1, 1
/* 27B04 80026F04 3C02800E */  lui        $v0, %hi(gGlobals)
/* 27B08 80026F08 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 27B0C 80026F0C 8C441604 */  lw         $a0, 0x1604($v0)
/* 27B10 80026F10 0C02DCB3 */  jal        func_800B72CC
/* 27B14 80026F14 8E250024 */   lw        $a1, 0x24($s1)
/* 27B18 80026F18 8E260024 */  lw         $a2, 0x24($s1)
/* 27B1C 80026F1C 10C00006 */  beqz       $a2, .L80026F38
/* 27B20 80026F20 24050003 */   addiu     $a1, $zero, 3
/* 27B24 80026F24 8CC20078 */  lw         $v0, 0x78($a2)
/* 27B28 80026F28 84440008 */  lh         $a0, 8($v0)
/* 27B2C 80026F2C 8C43000C */  lw         $v1, 0xc($v0)
/* 27B30 80026F30 0060F809 */  jalr       $v1
/* 27B34 80026F34 00C42021 */   addu      $a0, $a2, $a0
.L80026F38:
/* 27B38 80026F38 0C009BD5 */  jal        choose_combat_arena
/* 27B3C 80026F3C AE200024 */   sw        $zero, 0x24($s1)
/* 27B40 80026F40 8FBF0018 */  lw         $ra, 0x18($sp)
.L80026F44:
/* 27B44 80026F44 8FB10014 */  lw         $s1, 0x14($sp)
/* 27B48 80026F48 8FB00010 */  lw         $s0, 0x10($sp)
/* 27B4C 80026F4C 03E00008 */  jr         $ra
/* 27B50 80026F50 27BD0020 */   addiu     $sp, $sp, 0x20

glabel choose_combat_arena
/* 27B54 80026F54 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 27B58 80026F58 2404007C */  addiu      $a0, $zero, 0x7c
/* 27B5C 80026F5C 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 27B60 80026F60 AFB40028 */  sw         $s4, 0x28($sp)
/* 27B64 80026F64 24546950 */  addiu      $s4, $v0, %lo(PlayerCharStruct)
/* 27B68 80026F68 AFBF0030 */  sw         $ra, 0x30($sp)
/* 27B6C 80026F6C AFB5002C */  sw         $s5, 0x2c($sp)
/* 27B70 80026F70 AFB30024 */  sw         $s3, 0x24($sp)
/* 27B74 80026F74 AFB20020 */  sw         $s2, 0x20($sp)
/* 27B78 80026F78 AFB1001C */  sw         $s1, 0x1c($sp)
/* 27B7C 80026F7C AFB00018 */  sw         $s0, 0x18($sp)
/* 27B80 80026F80 0C026259 */  jal        passToMalloc
/* 27B84 80026F84 8E95155C */   lw        $s5, 0x155c($s4)
/* 27B88 80026F88 0C02E658 */  jal        widget_menu_build
/* 27B8C 80026F8C 00402021 */   addu      $a0, $v0, $zero
/* 27B90 80026F90 2404007C */  addiu      $a0, $zero, 0x7c
/* 27B94 80026F94 0C026259 */  jal        passToMalloc
/* 27B98 80026F98 AE820028 */   sw        $v0, 0x28($s4)
/* 27B9C 80026F9C 240401C5 */  addiu      $a0, $zero, 0x1c5
/* 27BA0 80026FA0 0C0290E2 */  jal        get_borg_8
/* 27BA4 80026FA4 00408021 */   addu      $s0, $v0, $zero
/* 27BA8 80026FA8 02002021 */  addu       $a0, $s0, $zero
/* 27BAC 80026FAC 0C02E518 */  jal        borg8_widget
/* 27BB0 80026FB0 00402821 */   addu      $a1, $v0, $zero
/* 27BB4 80026FB4 8E860028 */  lw         $a2, 0x28($s4)
/* 27BB8 80026FB8 00408021 */  addu       $s0, $v0, $zero
/* 27BBC 80026FBC 8CC30078 */  lw         $v1, 0x78($a2)
/* 27BC0 80026FC0 02002821 */  addu       $a1, $s0, $zero
/* 27BC4 80026FC4 84640030 */  lh         $a0, 0x30($v1)
/* 27BC8 80026FC8 8C620034 */  lw         $v0, 0x34($v1)
/* 27BCC 80026FCC 0040F809 */  jalr       $v0
/* 27BD0 80026FD0 00C42021 */   addu      $a0, $a2, $a0
/* 27BD4 80026FD4 02002021 */  addu       $a0, $s0, $zero
/* 27BD8 80026FD8 00002821 */  addu       $a1, $zero, $zero
/* 27BDC 80026FDC 0C02DD3F */  jal        set_widget_coords
/* 27BE0 80026FE0 00003021 */   addu      $a2, $zero, $zero
/* 27BE4 80026FE4 02002021 */  addu       $a0, $s0, $zero
/* 27BE8 80026FE8 0C02DD46 */  jal        set_widgetWidth
/* 27BEC 80026FEC 240500F0 */   addiu     $a1, $zero, 0xf0
/* 27BF0 80026FF0 02002021 */  addu       $a0, $s0, $zero
/* 27BF4 80026FF4 0C02DD42 */  jal        set_widgetHeight
/* 27BF8 80026FF8 24050140 */   addiu     $a1, $zero, 0x140
/* 27BFC 80026FFC 0C026259 */  jal        passToMalloc
/* 27C00 80027000 2404007C */   addiu     $a0, $zero, 0x7c
/* 27C04 80027004 00402021 */  addu       $a0, $v0, $zero
/* 27C08 80027008 3C05800E */  lui        $a1, %hi(D_800DA214)
/* 27C0C 8002700C 24A5A214 */  addiu      $a1, $a1, %lo(D_800DA214)
/* 27C10 80027010 0C02E3A0 */  jal        widgettext_func_2
/* 27C14 80027014 24060190 */   addiu     $a2, $zero, 0x190
/* 27C18 80027018 00408021 */  addu       $s0, $v0, $zero
/* 27C1C 8002701C 240500C8 */  addiu      $a1, $zero, 0xc8
/* 27C20 80027020 240600C8 */  addiu      $a2, $zero, 0xc8
/* 27C24 80027024 8E080078 */  lw         $t0, 0x78($s0)
/* 27C28 80027028 240700C8 */  addiu      $a3, $zero, 0xc8
/* 27C2C 8002702C 85040048 */  lh         $a0, 0x48($t0)
/* 27C30 80027030 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27C34 80027034 AFA20010 */  sw         $v0, 0x10($sp)
/* 27C38 80027038 8D03004C */  lw         $v1, 0x4c($t0)
/* 27C3C 8002703C 0060F809 */  jalr       $v1
/* 27C40 80027040 02042021 */   addu      $a0, $s0, $a0
/* 27C44 80027044 02002021 */  addu       $a0, $s0, $zero
/* 27C48 80027048 24050028 */  addiu      $a1, $zero, 0x28
/* 27C4C 8002704C 0C02DD3F */  jal        set_widget_coords
/* 27C50 80027050 24060032 */   addiu     $a2, $zero, 0x32
/* 27C54 80027054 8E860028 */  lw         $a2, 0x28($s4)
/* 27C58 80027058 00009821 */  addu       $s3, $zero, $zero
/* 27C5C 8002705C 8CC30078 */  lw         $v1, 0x78($a2)
/* 27C60 80027060 02002821 */  addu       $a1, $s0, $zero
/* 27C64 80027064 84640030 */  lh         $a0, 0x30($v1)
/* 27C68 80027068 8C620034 */  lw         $v0, 0x34($v1)
/* 27C6C 8002706C 0040F809 */  jalr       $v0
/* 27C70 80027070 00C42021 */   addu      $a0, $a2, $a0
/* 27C74 80027074 0C026259 */  jal        passToMalloc
/* 27C78 80027078 2404007C */   addiu     $a0, $zero, 0x7c
/* 27C7C 8002707C 00402021 */  addu       $a0, $v0, $zero
/* 27C80 80027080 0C02E68C */  jal        widgetscrollmenu_init
/* 27C84 80027084 2405001C */   addiu     $a1, $zero, 0x1c
/* 27C88 80027088 00408821 */  addu       $s1, $v0, $zero
/* 27C8C 8002708C 02202021 */  addu       $a0, $s1, $zero
/* 27C90 80027090 24050028 */  addiu      $a1, $zero, 0x28
/* 27C94 80027094 0C02DD3F */  jal        set_widget_coords
/* 27C98 80027098 2406004B */   addiu     $a2, $zero, 0x4b
/* 27C9C 8002709C 3C02800F */  lui        $v0, %hi(arena_name_list)
/* 27CA0 800270A0 24529AF0 */  addiu      $s2, $v0, %lo(arena_name_list)
.L800270A4:
/* 27CA4 800270A4 8E420000 */  lw         $v0, ($s2)
/* 27CA8 800270A8 5040000D */  beql       $v0, $zero, .L800270E0
/* 27CAC 800270AC 26730001 */   addiu     $s3, $s3, 1
/* 27CB0 800270B0 0C026259 */  jal        passToMalloc
/* 27CB4 800270B4 2404007C */   addiu     $a0, $zero, 0x7c
/* 27CB8 800270B8 00402021 */  addu       $a0, $v0, $zero
/* 27CBC 800270BC 8E450000 */  lw         $a1, ($s2)
/* 27CC0 800270C0 0C02E3A0 */  jal        widgettext_func_2
/* 27CC4 800270C4 24060190 */   addiu     $a2, $zero, 0x190
/* 27CC8 800270C8 00408021 */  addu       $s0, $v0, $zero
/* 27CCC 800270CC 02202021 */  addu       $a0, $s1, $zero
/* 27CD0 800270D0 02002821 */  addu       $a1, $s0, $zero
/* 27CD4 800270D4 0C02E885 */  jal        link_widget_text
/* 27CD8 800270D8 A613005E */   sh        $s3, 0x5e($s0)
/* 27CDC 800270DC 26730001 */  addiu      $s3, $s3, 1
.L800270E0:
/* 27CE0 800270E0 2A62001C */  slti       $v0, $s3, 0x1c
/* 27CE4 800270E4 1440FFEF */  bnez       $v0, .L800270A4
/* 27CE8 800270E8 26520004 */   addiu     $s2, $s2, 4
/* 27CEC 800270EC 24050096 */  addiu      $a1, $zero, 0x96
/* 27CF0 800270F0 24060096 */  addiu      $a2, $zero, 0x96
/* 27CF4 800270F4 24070096 */  addiu      $a3, $zero, 0x96
/* 27CF8 800270F8 8E280078 */  lw         $t0, 0x78($s1)
/* 27CFC 800270FC 2402004B */  addiu      $v0, $zero, 0x4b
/* 27D00 80027100 A6220068 */  sh         $v0, 0x68($s1)
/* 27D04 80027104 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27D08 80027108 A622006A */  sh         $v0, 0x6a($s1)
/* 27D0C 8002710C 85040048 */  lh         $a0, 0x48($t0)
/* 27D10 80027110 24020096 */  addiu      $v0, $zero, 0x96
/* 27D14 80027114 AFA20010 */  sw         $v0, 0x10($sp)
/* 27D18 80027118 8D03004C */  lw         $v1, 0x4c($t0)
/* 27D1C 8002711C 0060F809 */  jalr       $v1
/* 27D20 80027120 02242021 */   addu      $a0, $s1, $a0
/* 27D24 80027124 8E240040 */  lw         $a0, 0x40($s1)
/* 27D28 80027128 24020014 */  addiu      $v0, $zero, 0x14
/* 27D2C 8002712C A0820000 */  sb         $v0, ($a0)
/* 27D30 80027130 8E840028 */  lw         $a0, 0x28($s4)
/* 27D34 80027134 8C860078 */  lw         $a2, 0x78($a0)
/* 27D38 80027138 02202821 */  addu       $a1, $s1, $zero
/* 27D3C 8002713C AC910040 */  sw         $s1, 0x40($a0)
/* 27D40 80027140 84C30030 */  lh         $v1, 0x30($a2)
/* 27D44 80027144 8CC20034 */  lw         $v0, 0x34($a2)
/* 27D48 80027148 0040F809 */  jalr       $v0
/* 27D4C 8002714C 00832021 */   addu      $a0, $a0, $v1
/* 27D50 80027150 02A02021 */  addu       $a0, $s5, $zero
/* 27D54 80027154 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetUpFunc)
/* 27D58 80027158 24426170 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetUpFunc)
/* 27D5C 8002715C 3C038002 */  lui        $v1, %hi(SmallerDebugWidgetDownFunc)
/* 27D60 80027160 8E860028 */  lw         $a2, 0x28($s4)
/* 27D64 80027164 246361EC */  addiu      $v1, $v1, %lo(SmallerDebugWidgetDownFunc)
/* 27D68 80027168 00C02821 */  addu       $a1, $a2, $zero
/* 27D6C 8002716C ACC20008 */  sw         $v0, 8($a2)
/* 27D70 80027170 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetAFunc)
/* 27D74 80027174 24426268 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetAFunc)
/* 27D78 80027178 ACC3000C */  sw         $v1, 0xc($a2)
/* 27D7C 8002717C 3C038002 */  lui        $v1, %hi(SmallerDebugWidget_ret_a1)
/* 27D80 80027180 24636294 */  addiu      $v1, $v1, %lo(SmallerDebugWidget_ret_a1)
/* 27D84 80027184 ACC20018 */  sw         $v0, 0x18($a2)
/* 27D88 80027188 ACC3001C */  sw         $v1, 0x1c($a2)
/* 27D8C 8002718C 0C02DC7C */  jal        widgetHandler
/* 27D90 80027190 ACC30020 */   sw        $v1, 0x20($a2)
/* 27D94 80027194 8FBF0030 */  lw         $ra, 0x30($sp)
/* 27D98 80027198 8FB5002C */  lw         $s5, 0x2c($sp)
/* 27D9C 8002719C 8FB40028 */  lw         $s4, 0x28($sp)
/* 27DA0 800271A0 8FB30024 */  lw         $s3, 0x24($sp)
/* 27DA4 800271A4 8FB20020 */  lw         $s2, 0x20($sp)
/* 27DA8 800271A8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 27DAC 800271AC 8FB00018 */  lw         $s0, 0x18($sp)
/* 27DB0 800271B0 03E00008 */  jr         $ra
/* 27DB4 800271B4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel set_debug_combat_battlefeild
/* 27DB8 800271B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 27DBC 800271BC 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 27DC0 800271C0 AFB10014 */  sw         $s1, 0x14($sp)
/* 27DC4 800271C4 24516950 */  addiu      $s1, $v0, %lo(PlayerCharStruct)
/* 27DC8 800271C8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 27DCC 800271CC AFB00010 */  sw         $s0, 0x10($sp)
/* 27DD0 800271D0 8E230028 */  lw         $v1, 0x28($s1)
/* 27DD4 800271D4 00808021 */  addu       $s0, $a0, $zero
/* 27DD8 800271D8 56030011 */  bnel       $s0, $v1, .L80027220
/* 27DDC 800271DC 8E030078 */   lw        $v1, 0x78($s0)
/* 27DE0 800271E0 8E24155C */  lw         $a0, 0x155c($s1)
/* 27DE4 800271E4 0C02DCB3 */  jal        func_800B72CC
/* 27DE8 800271E8 02002821 */   addu      $a1, $s0, $zero
/* 27DEC 800271EC 8E260028 */  lw         $a2, 0x28($s1)
/* 27DF0 800271F0 10C00006 */  beqz       $a2, .L8002720C
/* 27DF4 800271F4 24050003 */   addiu     $a1, $zero, 3
/* 27DF8 800271F8 8CC20078 */  lw         $v0, 0x78($a2)
/* 27DFC 800271FC 84440008 */  lh         $a0, 8($v0)
/* 27E00 80027200 8C43000C */  lw         $v1, 0xc($v0)
/* 27E04 80027204 0060F809 */  jalr       $v1
/* 27E08 80027208 00C42021 */   addu      $a0, $a2, $a0
.L8002720C:
/* 27E0C 8002720C AE200028 */  sw         $zero, 0x28($s1)
/* 27E10 80027210 0C0099B0 */  jal        smaller_debug_menu
/* 27E14 80027214 00002021 */   addu      $a0, $zero, $zero
/* 27E18 80027218 08009CAA */  j          .L800272A8
/* 27E1C 8002721C 8FBF0018 */   lw        $ra, 0x18($sp)
.L80027220:
/* 27E20 80027220 84640010 */  lh         $a0, 0x10($v1)
/* 27E24 80027224 8C620014 */  lw         $v0, 0x14($v1)
/* 27E28 80027228 0040F809 */  jalr       $v0
/* 27E2C 8002722C 02042021 */   addu      $a0, $s0, $a0
/* 27E30 80027230 1440001D */  bnez       $v0, .L800272A8
/* 27E34 80027234 8FBF0018 */   lw        $ra, 0x18($sp)
/* 27E38 80027238 24040001 */  addiu      $a0, $zero, 1
/* 27E3C 8002723C 24050002 */  addiu      $a1, $zero, 2
/* 27E40 80027240 9202005F */  lbu        $v0, 0x5f($s0)
/* 27E44 80027244 26301324 */  addiu      $s0, $s1, 0x1324
/* 27E48 80027248 0C002CF7 */  jal        rand_range
/* 27E4C 8002724C A2020027 */   sb        $v0, 0x27($s0)
/* 27E50 80027250 8E24155C */  lw         $a0, 0x155c($s1)
/* 27E54 80027254 8E250028 */  lw         $a1, 0x28($s1)
/* 27E58 80027258 24030001 */  addiu      $v1, $zero, 1
/* 27E5C 8002725C A2020026 */  sb         $v0, 0x26($s0)
/* 27E60 80027260 26221320 */  addiu      $v0, $s1, 0x1320
/* 27E64 80027264 A2000028 */  sb         $zero, 0x28($s0)
/* 27E68 80027268 A600001A */  sh         $zero, 0x1a($s0)
/* 27E6C 8002726C A2030029 */  sb         $v1, 0x29($s0)
/* 27E70 80027270 0C02DCB3 */  jal        func_800B72CC
/* 27E74 80027274 A0430002 */   sb        $v1, 2($v0)
/* 27E78 80027278 8E260028 */  lw         $a2, 0x28($s1)
/* 27E7C 8002727C 10C00006 */  beqz       $a2, .L80027298
/* 27E80 80027280 24050003 */   addiu     $a1, $zero, 3
/* 27E84 80027284 8CC20078 */  lw         $v0, 0x78($a2)
/* 27E88 80027288 84440008 */  lh         $a0, 8($v0)
/* 27E8C 8002728C 8C43000C */  lw         $v1, 0xc($v0)
/* 27E90 80027290 0060F809 */  jalr       $v1
/* 27E94 80027294 00C42021 */   addu      $a0, $a2, $a0
.L80027298:
/* 27E98 80027298 24020002 */  addiu      $v0, $zero, 2
/* 27E9C 8002729C AE200028 */  sw         $zero, 0x28($s1)
/* 27EA0 800272A0 A2220034 */  sb         $v0, 0x34($s1)
/* 27EA4 800272A4 8FBF0018 */  lw         $ra, 0x18($sp)
.L800272A8:
/* 27EA8 800272A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 27EAC 800272AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 27EB0 800272B0 03E00008 */  jr         $ra
/* 27EB4 800272B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel change_actor_menu
/* 27EB8 800272B8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 27EBC 800272BC 2404007C */  addiu      $a0, $zero, 0x7c
/* 27EC0 800272C0 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 27EC4 800272C4 AFB40028 */  sw         $s4, 0x28($sp)
/* 27EC8 800272C8 24546950 */  addiu      $s4, $v0, %lo(PlayerCharStruct)
/* 27ECC 800272CC AFBF0030 */  sw         $ra, 0x30($sp)
/* 27ED0 800272D0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 27ED4 800272D4 AFB30024 */  sw         $s3, 0x24($sp)
/* 27ED8 800272D8 AFB20020 */  sw         $s2, 0x20($sp)
/* 27EDC 800272DC AFB1001C */  sw         $s1, 0x1c($sp)
/* 27EE0 800272E0 AFB00018 */  sw         $s0, 0x18($sp)
/* 27EE4 800272E4 0C026259 */  jal        passToMalloc
/* 27EE8 800272E8 8E95155C */   lw        $s5, 0x155c($s4)
/* 27EEC 800272EC 0C02E658 */  jal        widget_menu_build
/* 27EF0 800272F0 00402021 */   addu      $a0, $v0, $zero
/* 27EF4 800272F4 2404007C */  addiu      $a0, $zero, 0x7c
/* 27EF8 800272F8 0C026259 */  jal        passToMalloc
/* 27EFC 800272FC AE82001C */   sw        $v0, 0x1c($s4)
/* 27F00 80027300 240401C5 */  addiu      $a0, $zero, 0x1c5
/* 27F04 80027304 0C0290E2 */  jal        get_borg_8
/* 27F08 80027308 00408021 */   addu      $s0, $v0, $zero
/* 27F0C 8002730C 02002021 */  addu       $a0, $s0, $zero
/* 27F10 80027310 0C02E518 */  jal        borg8_widget
/* 27F14 80027314 00402821 */   addu      $a1, $v0, $zero
/* 27F18 80027318 8E86001C */  lw         $a2, 0x1c($s4)
/* 27F1C 8002731C 00408021 */  addu       $s0, $v0, $zero
/* 27F20 80027320 8CC30078 */  lw         $v1, 0x78($a2)
/* 27F24 80027324 02002821 */  addu       $a1, $s0, $zero
/* 27F28 80027328 84640030 */  lh         $a0, 0x30($v1)
/* 27F2C 8002732C 8C620034 */  lw         $v0, 0x34($v1)
/* 27F30 80027330 0040F809 */  jalr       $v0
/* 27F34 80027334 00C42021 */   addu      $a0, $a2, $a0
/* 27F38 80027338 02002021 */  addu       $a0, $s0, $zero
/* 27F3C 8002733C 00002821 */  addu       $a1, $zero, $zero
/* 27F40 80027340 0C02DD3F */  jal        set_widget_coords
/* 27F44 80027344 00003021 */   addu      $a2, $zero, $zero
/* 27F48 80027348 02002021 */  addu       $a0, $s0, $zero
/* 27F4C 8002734C 0C02DD46 */  jal        set_widgetWidth
/* 27F50 80027350 240500F0 */   addiu     $a1, $zero, 0xf0
/* 27F54 80027354 02002021 */  addu       $a0, $s0, $zero
/* 27F58 80027358 0C02DD42 */  jal        set_widgetHeight
/* 27F5C 8002735C 24050140 */   addiu     $a1, $zero, 0x140
/* 27F60 80027360 0C026259 */  jal        passToMalloc
/* 27F64 80027364 2404007C */   addiu     $a0, $zero, 0x7c
/* 27F68 80027368 00402021 */  addu       $a0, $v0, $zero
/* 27F6C 8002736C 3C05800E */  lui        $a1, %hi(D_800DA21C)
/* 27F70 80027370 24A5A21C */  addiu      $a1, $a1, %lo(D_800DA21C)
/* 27F74 80027374 0C02E3A0 */  jal        widgettext_func_2
/* 27F78 80027378 24060190 */   addiu     $a2, $zero, 0x190
/* 27F7C 8002737C 00408021 */  addu       $s0, $v0, $zero
/* 27F80 80027380 240500C8 */  addiu      $a1, $zero, 0xc8
/* 27F84 80027384 240600C8 */  addiu      $a2, $zero, 0xc8
/* 27F88 80027388 8E080078 */  lw         $t0, 0x78($s0)
/* 27F8C 8002738C 240700C8 */  addiu      $a3, $zero, 0xc8
/* 27F90 80027390 85040048 */  lh         $a0, 0x48($t0)
/* 27F94 80027394 240200C8 */  addiu      $v0, $zero, 0xc8
/* 27F98 80027398 AFA20010 */  sw         $v0, 0x10($sp)
/* 27F9C 8002739C 8D03004C */  lw         $v1, 0x4c($t0)
/* 27FA0 800273A0 0060F809 */  jalr       $v1
/* 27FA4 800273A4 02042021 */   addu      $a0, $s0, $a0
/* 27FA8 800273A8 02002021 */  addu       $a0, $s0, $zero
/* 27FAC 800273AC 24050028 */  addiu      $a1, $zero, 0x28
/* 27FB0 800273B0 0C02DD3F */  jal        set_widget_coords
/* 27FB4 800273B4 24060032 */   addiu     $a2, $zero, 0x32
/* 27FB8 800273B8 8E86001C */  lw         $a2, 0x1c($s4)
/* 27FBC 800273BC 00008821 */  addu       $s1, $zero, $zero
/* 27FC0 800273C0 8CC30078 */  lw         $v1, 0x78($a2)
/* 27FC4 800273C4 02002821 */  addu       $a1, $s0, $zero
/* 27FC8 800273C8 84640030 */  lh         $a0, 0x30($v1)
/* 27FCC 800273CC 8C620034 */  lw         $v0, 0x34($v1)
/* 27FD0 800273D0 0040F809 */  jalr       $v0
/* 27FD4 800273D4 00C42021 */   addu      $a0, $a2, $a0
/* 27FD8 800273D8 3C03800F */  lui        $v1, %hi(debugCharacters)
/* 27FDC 800273DC 24648CE8 */  addiu      $a0, $v1, %lo(debugCharacters)
/* 27FE0 800273E0 8C820008 */  lw         $v0, 8($a0)
/* 27FE4 800273E4 10400006 */  beqz       $v0, .L80027400
/* 27FE8 800273E8 00608021 */   addu      $s0, $v1, $zero
/* 27FEC 800273EC 24830008 */  addiu      $v1, $a0, 8
.L800273F0:
/* 27FF0 800273F0 2463000C */  addiu      $v1, $v1, 0xc
/* 27FF4 800273F4 8C620000 */  lw         $v0, ($v1)
/* 27FF8 800273F8 1440FFFD */  bnez       $v0, .L800273F0
/* 27FFC 800273FC 26310001 */   addiu     $s1, $s1, 1
.L80027400:
/* 28000 80027400 0C026259 */  jal        passToMalloc
/* 28004 80027404 2404007C */   addiu     $a0, $zero, 0x7c
/* 28008 80027408 00402021 */  addu       $a0, $v0, $zero
/* 2800C 8002740C 0C02E68C */  jal        widgetscrollmenu_init
/* 28010 80027410 3225FFFF */   andi      $a1, $s1, 0xffff
/* 28014 80027414 00409021 */  addu       $s2, $v0, $zero
/* 28018 80027418 02402021 */  addu       $a0, $s2, $zero
/* 2801C 8002741C 24050028 */  addiu      $a1, $zero, 0x28
/* 28020 80027420 0C02DD3F */  jal        set_widget_coords
/* 28024 80027424 2406004B */   addiu     $a2, $zero, 0x4b
/* 28028 80027428 26038CE8 */  addiu      $v1, $s0, -0x7318
/* 2802C 8002742C 8C620008 */  lw         $v0, 8($v1)
/* 28030 80027430 10400011 */  beqz       $v0, .L80027478
/* 28034 80027434 00009821 */   addu      $s3, $zero, $zero
/* 28038 80027438 24710008 */  addiu      $s1, $v1, 8
.L8002743C:
/* 2803C 8002743C 0C026259 */  jal        passToMalloc
/* 28040 80027440 2404007C */   addiu     $a0, $zero, 0x7c
/* 28044 80027444 00402021 */  addu       $a0, $v0, $zero
/* 28048 80027448 24060190 */  addiu      $a2, $zero, 0x190
/* 2804C 8002744C 8E250000 */  lw         $a1, ($s1)
/* 28050 80027450 0C02E3A0 */  jal        widgettext_func_2
/* 28054 80027454 2631000C */   addiu     $s1, $s1, 0xc
/* 28058 80027458 00408021 */  addu       $s0, $v0, $zero
/* 2805C 8002745C 02402021 */  addu       $a0, $s2, $zero
/* 28060 80027460 02002821 */  addu       $a1, $s0, $zero
/* 28064 80027464 0C02E885 */  jal        link_widget_text
/* 28068 80027468 A613005E */   sh        $s3, 0x5e($s0)
/* 2806C 8002746C 8E230000 */  lw         $v1, ($s1)
/* 28070 80027470 1460FFF2 */  bnez       $v1, .L8002743C
/* 28074 80027474 26730001 */   addiu     $s3, $s3, 1
.L80027478:
/* 28078 80027478 24050096 */  addiu      $a1, $zero, 0x96
/* 2807C 8002747C 24060096 */  addiu      $a2, $zero, 0x96
/* 28080 80027480 24070096 */  addiu      $a3, $zero, 0x96
/* 28084 80027484 8E480078 */  lw         $t0, 0x78($s2)
/* 28088 80027488 2402004B */  addiu      $v0, $zero, 0x4b
/* 2808C 8002748C A6420068 */  sh         $v0, 0x68($s2)
/* 28090 80027490 240200C8 */  addiu      $v0, $zero, 0xc8
/* 28094 80027494 A642006A */  sh         $v0, 0x6a($s2)
/* 28098 80027498 85040048 */  lh         $a0, 0x48($t0)
/* 2809C 8002749C 24020096 */  addiu      $v0, $zero, 0x96
/* 280A0 800274A0 AFA20010 */  sw         $v0, 0x10($sp)
/* 280A4 800274A4 8D03004C */  lw         $v1, 0x4c($t0)
/* 280A8 800274A8 0060F809 */  jalr       $v1
/* 280AC 800274AC 02442021 */   addu      $a0, $s2, $a0
/* 280B0 800274B0 8E440040 */  lw         $a0, 0x40($s2)
/* 280B4 800274B4 24020014 */  addiu      $v0, $zero, 0x14
/* 280B8 800274B8 A0820000 */  sb         $v0, ($a0)
/* 280BC 800274BC 8E430078 */  lw         $v1, 0x78($s2)
/* 280C0 800274C0 84640028 */  lh         $a0, 0x28($v1)
/* 280C4 800274C4 8C62002C */  lw         $v0, 0x2c($v1)
/* 280C8 800274C8 0040F809 */  jalr       $v0
/* 280CC 800274CC 02442021 */   addu      $a0, $s2, $a0
/* 280D0 800274D0 8E84001C */  lw         $a0, 0x1c($s4)
/* 280D4 800274D4 8C860078 */  lw         $a2, 0x78($a0)
/* 280D8 800274D8 02402821 */  addu       $a1, $s2, $zero
/* 280DC 800274DC AC920040 */  sw         $s2, 0x40($a0)
/* 280E0 800274E0 84C30030 */  lh         $v1, 0x30($a2)
/* 280E4 800274E4 8CC20034 */  lw         $v0, 0x34($a2)
/* 280E8 800274E8 0040F809 */  jalr       $v0
/* 280EC 800274EC 00832021 */   addu      $a0, $a0, $v1
/* 280F0 800274F0 02A02021 */  addu       $a0, $s5, $zero
/* 280F4 800274F4 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetUpFunc)
/* 280F8 800274F8 24426170 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetUpFunc)
/* 280FC 800274FC 3C038002 */  lui        $v1, %hi(SmallerDebugWidgetDownFunc)
/* 28100 80027500 8E86001C */  lw         $a2, 0x1c($s4)
/* 28104 80027504 246361EC */  addiu      $v1, $v1, %lo(SmallerDebugWidgetDownFunc)
/* 28108 80027508 00C02821 */  addu       $a1, $a2, $zero
/* 2810C 8002750C ACC20008 */  sw         $v0, 8($a2)
/* 28110 80027510 3C028002 */  lui        $v0, %hi(func_8002619C)
/* 28114 80027514 2442619C */  addiu      $v0, $v0, %lo(func_8002619C)
/* 28118 80027518 ACC3000C */  sw         $v1, 0xc($a2)
/* 2811C 8002751C 3C038002 */  lui        $v1, %hi(func_80026218)
/* 28120 80027520 24636218 */  addiu      $v1, $v1, %lo(func_80026218)
/* 28124 80027524 ACC20010 */  sw         $v0, 0x10($a2)
/* 28128 80027528 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetAFunc)
/* 2812C 8002752C 24426268 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetAFunc)
/* 28130 80027530 ACC30014 */  sw         $v1, 0x14($a2)
/* 28134 80027534 3C038002 */  lui        $v1, %hi(SmallerDebugWidget_ret_a1)
/* 28138 80027538 24636294 */  addiu      $v1, $v1, %lo(SmallerDebugWidget_ret_a1)
/* 2813C 8002753C ACC20018 */  sw         $v0, 0x18($a2)
/* 28140 80027540 ACC3001C */  sw         $v1, 0x1c($a2)
/* 28144 80027544 0C02DC7C */  jal        widgetHandler
/* 28148 80027548 ACC30020 */   sw        $v1, 0x20($a2)
/* 2814C 8002754C 8FBF0030 */  lw         $ra, 0x30($sp)
/* 28150 80027550 8FB5002C */  lw         $s5, 0x2c($sp)
/* 28154 80027554 8FB40028 */  lw         $s4, 0x28($sp)
/* 28158 80027558 8FB30024 */  lw         $s3, 0x24($sp)
/* 2815C 8002755C 8FB20020 */  lw         $s2, 0x20($sp)
/* 28160 80027560 8FB1001C */  lw         $s1, 0x1c($sp)
/* 28164 80027564 8FB00018 */  lw         $s0, 0x18($sp)
/* 28168 80027568 03E00008 */  jr         $ra
/* 2816C 8002756C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel debug_change_form
/* 28170 80027570 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 28174 80027574 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 28178 80027578 AFB00010 */  sw         $s0, 0x10($sp)
/* 2817C 8002757C 24506950 */  addiu      $s0, $v0, %lo(PlayerCharStruct)
/* 28180 80027580 AFBF0014 */  sw         $ra, 0x14($sp)
/* 28184 80027584 8E07001C */  lw         $a3, 0x1c($s0)
/* 28188 80027588 00803021 */  addu       $a2, $a0, $zero
/* 2818C 8002758C 14C70011 */  bne        $a2, $a3, .L800275D4
/* 28190 80027590 3C05800F */   lui       $a1, 0x800f
/* 28194 80027594 8E04155C */  lw         $a0, 0x155c($s0)
/* 28198 80027598 0C02DCB3 */  jal        func_800B72CC
/* 2819C 8002759C 00E02821 */   addu      $a1, $a3, $zero
/* 281A0 800275A0 8E06001C */  lw         $a2, 0x1c($s0)
/* 281A4 800275A4 10C00006 */  beqz       $a2, .L800275C0
/* 281A8 800275A8 24050003 */   addiu     $a1, $zero, 3
/* 281AC 800275AC 8CC20078 */  lw         $v0, 0x78($a2)
/* 281B0 800275B0 84440008 */  lh         $a0, 8($v0)
/* 281B4 800275B4 8C43000C */  lw         $v1, 0xc($v0)
/* 281B8 800275B8 0060F809 */  jalr       $v1
/* 281BC 800275BC 00C42021 */   addu      $a0, $a2, $a0
.L800275C0:
/* 281C0 800275C0 AE00001C */  sw         $zero, 0x1c($s0)
/* 281C4 800275C4 0C0099B0 */  jal        smaller_debug_menu
/* 281C8 800275C8 00002021 */   addu      $a0, $zero, $zero
/* 281CC 800275CC 08009D93 */  j          .L8002764C
/* 281D0 800275D0 8FBF0014 */   lw        $ra, 0x14($sp)
.L800275D4:
/* 281D4 800275D4 24A58CE8 */  addiu      $a1, $a1, -0x7318
/* 281D8 800275D8 94C2005E */  lhu        $v0, 0x5e($a2)
/* 281DC 800275DC 8E04155C */  lw         $a0, 0x155c($s0)
/* 281E0 800275E0 00021840 */  sll        $v1, $v0, 1
/* 281E4 800275E4 00621821 */  addu       $v1, $v1, $v0
/* 281E8 800275E8 00031880 */  sll        $v1, $v1, 2
/* 281EC 800275EC 00403021 */  addu       $a2, $v0, $zero
/* 281F0 800275F0 00651821 */  addu       $v1, $v1, $a1
/* 281F4 800275F4 00061040 */  sll        $v0, $a2, 1
/* 281F8 800275F8 00461021 */  addu       $v0, $v0, $a2
/* 281FC 800275FC 00021080 */  sll        $v0, $v0, 2
/* 28200 80027600 00A22821 */  addu       $a1, $a1, $v0
/* 28204 80027604 8C660000 */  lw         $a2, ($v1)
/* 28208 80027608 C4A00004 */  lwc1       $f0, 4($a1)
/* 2820C 8002760C 00E02821 */  addu       $a1, $a3, $zero
/* 28210 80027610 AE060004 */  sw         $a2, 4($s0)
/* 28214 80027614 0C02DCB3 */  jal        func_800B72CC
/* 28218 80027618 E6000008 */   swc1      $f0, 8($s0)
/* 2821C 8002761C 8E06001C */  lw         $a2, 0x1c($s0)
/* 28220 80027620 10C00006 */  beqz       $a2, .L8002763C
/* 28224 80027624 24050003 */   addiu     $a1, $zero, 3
/* 28228 80027628 8CC20078 */  lw         $v0, 0x78($a2)
/* 2822C 8002762C 84440008 */  lh         $a0, 8($v0)
/* 28230 80027630 8C43000C */  lw         $v1, 0xc($v0)
/* 28234 80027634 0060F809 */  jalr       $v1
/* 28238 80027638 00C42021 */   addu      $a0, $a2, $a0
.L8002763C:
/* 2823C 8002763C 24020004 */  addiu      $v0, $zero, 4
/* 28240 80027640 AE00001C */  sw         $zero, 0x1c($s0)
/* 28244 80027644 A2020034 */  sb         $v0, 0x34($s0)
/* 28248 80027648 8FBF0014 */  lw         $ra, 0x14($sp)
.L8002764C:
/* 2824C 8002764C 8FB00010 */  lw         $s0, 0x10($sp)
/* 28250 80027650 03E00008 */  jr         $ra
/* 28254 80027654 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80027658
/* 28258 80027658 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 2825C 8002765C 2404007C */  addiu      $a0, $zero, 0x7c
/* 28260 80027660 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 28264 80027664 AFB40028 */  sw         $s4, 0x28($sp)
/* 28268 80027668 24546950 */  addiu      $s4, $v0, %lo(PlayerCharStruct)
/* 2826C 8002766C AFBF0030 */  sw         $ra, 0x30($sp)
/* 28270 80027670 AFB5002C */  sw         $s5, 0x2c($sp)
/* 28274 80027674 AFB30024 */  sw         $s3, 0x24($sp)
/* 28278 80027678 AFB20020 */  sw         $s2, 0x20($sp)
/* 2827C 8002767C AFB1001C */  sw         $s1, 0x1c($sp)
/* 28280 80027680 AFB00018 */  sw         $s0, 0x18($sp)
/* 28284 80027684 0C026259 */  jal        passToMalloc
/* 28288 80027688 8E95155C */   lw        $s5, 0x155c($s4)
/* 2828C 8002768C 0C02E658 */  jal        widget_menu_build
/* 28290 80027690 00402021 */   addu      $a0, $v0, $zero
/* 28294 80027694 2404007C */  addiu      $a0, $zero, 0x7c
/* 28298 80027698 0C026259 */  jal        passToMalloc
/* 2829C 8002769C AE820018 */   sw        $v0, 0x18($s4)
/* 282A0 800276A0 240401C5 */  addiu      $a0, $zero, 0x1c5
/* 282A4 800276A4 0C0290E2 */  jal        get_borg_8
/* 282A8 800276A8 00408021 */   addu      $s0, $v0, $zero
/* 282AC 800276AC 02002021 */  addu       $a0, $s0, $zero
/* 282B0 800276B0 0C02E518 */  jal        borg8_widget
/* 282B4 800276B4 00402821 */   addu      $a1, $v0, $zero
/* 282B8 800276B8 8E860018 */  lw         $a2, 0x18($s4)
/* 282BC 800276BC 00408021 */  addu       $s0, $v0, $zero
/* 282C0 800276C0 8CC30078 */  lw         $v1, 0x78($a2)
/* 282C4 800276C4 02002821 */  addu       $a1, $s0, $zero
/* 282C8 800276C8 84640030 */  lh         $a0, 0x30($v1)
/* 282CC 800276CC 8C620034 */  lw         $v0, 0x34($v1)
/* 282D0 800276D0 0040F809 */  jalr       $v0
/* 282D4 800276D4 00C42021 */   addu      $a0, $a2, $a0
/* 282D8 800276D8 02002021 */  addu       $a0, $s0, $zero
/* 282DC 800276DC 00002821 */  addu       $a1, $zero, $zero
/* 282E0 800276E0 0C02DD3F */  jal        set_widget_coords
/* 282E4 800276E4 00003021 */   addu      $a2, $zero, $zero
/* 282E8 800276E8 02002021 */  addu       $a0, $s0, $zero
/* 282EC 800276EC 0C02DD46 */  jal        set_widgetWidth
/* 282F0 800276F0 240500F0 */   addiu     $a1, $zero, 0xf0
/* 282F4 800276F4 02002021 */  addu       $a0, $s0, $zero
/* 282F8 800276F8 0C02DD42 */  jal        set_widgetHeight
/* 282FC 800276FC 24050140 */   addiu     $a1, $zero, 0x140
/* 28300 80027700 0C026259 */  jal        passToMalloc
/* 28304 80027704 2404007C */   addiu     $a0, $zero, 0x7c
/* 28308 80027708 00402021 */  addu       $a0, $v0, $zero
/* 2830C 8002770C 3C05800E */  lui        $a1, %hi(D_800DA224)
/* 28310 80027710 24A5A224 */  addiu      $a1, $a1, %lo(D_800DA224)
/* 28314 80027714 0C02E3A0 */  jal        widgettext_func_2
/* 28318 80027718 24060190 */   addiu     $a2, $zero, 0x190
/* 2831C 8002771C 00408021 */  addu       $s0, $v0, $zero
/* 28320 80027720 240500C8 */  addiu      $a1, $zero, 0xc8
/* 28324 80027724 240600C8 */  addiu      $a2, $zero, 0xc8
/* 28328 80027728 8E030078 */  lw         $v1, 0x78($s0)
/* 2832C 8002772C 240200C8 */  addiu      $v0, $zero, 0xc8
/* 28330 80027730 84640048 */  lh         $a0, 0x48($v1)
/* 28334 80027734 240700C8 */  addiu      $a3, $zero, 0xc8
/* 28338 80027738 AFA20010 */  sw         $v0, 0x10($sp)
/* 2833C 8002773C 8C62004C */  lw         $v0, 0x4c($v1)
/* 28340 80027740 0040F809 */  jalr       $v0
/* 28344 80027744 02042021 */   addu      $a0, $s0, $a0
/* 28348 80027748 02002021 */  addu       $a0, $s0, $zero
/* 2834C 8002774C 24050028 */  addiu      $a1, $zero, 0x28
/* 28350 80027750 0C02DD3F */  jal        set_widget_coords
/* 28354 80027754 24060032 */   addiu     $a2, $zero, 0x32
/* 28358 80027758 8E860018 */  lw         $a2, 0x18($s4)
/* 2835C 8002775C 00008821 */  addu       $s1, $zero, $zero
/* 28360 80027760 8CC30078 */  lw         $v1, 0x78($a2)
/* 28364 80027764 02002821 */  addu       $a1, $s0, $zero
/* 28368 80027768 84640030 */  lh         $a0, 0x30($v1)
/* 2836C 8002776C 8C620034 */  lw         $v0, 0x34($v1)
/* 28370 80027770 0040F809 */  jalr       $v0
/* 28374 80027774 00C42021 */   addu      $a0, $a2, $a0
/* 28378 80027778 3C03800F */  lui        $v1, %hi(debugMapLabels)
/* 2837C 8002777C 24648B20 */  addiu      $a0, $v1, %lo(debugMapLabels)
/* 28380 80027780 8C820008 */  lw         $v0, 8($a0)
/* 28384 80027784 10400006 */  beqz       $v0, .L800277A0
/* 28388 80027788 00608021 */   addu      $s0, $v1, $zero
/* 2838C 8002778C 24830008 */  addiu      $v1, $a0, 8
.L80027790:
/* 28390 80027790 2463000C */  addiu      $v1, $v1, 0xc
/* 28394 80027794 8C620000 */  lw         $v0, ($v1)
/* 28398 80027798 1440FFFD */  bnez       $v0, .L80027790
/* 2839C 8002779C 26310001 */   addiu     $s1, $s1, 1
.L800277A0:
/* 283A0 800277A0 0C026259 */  jal        passToMalloc
/* 283A4 800277A4 2404007C */   addiu     $a0, $zero, 0x7c
/* 283A8 800277A8 00402021 */  addu       $a0, $v0, $zero
/* 283AC 800277AC 0C02E68C */  jal        widgetscrollmenu_init
/* 283B0 800277B0 3225FFFF */   andi      $a1, $s1, 0xffff
/* 283B4 800277B4 00409021 */  addu       $s2, $v0, $zero
/* 283B8 800277B8 02402021 */  addu       $a0, $s2, $zero
/* 283BC 800277BC 24050028 */  addiu      $a1, $zero, 0x28
/* 283C0 800277C0 0C02DD3F */  jal        set_widget_coords
/* 283C4 800277C4 2406004B */   addiu     $a2, $zero, 0x4b
/* 283C8 800277C8 26038B20 */  addiu      $v1, $s0, -0x74e0
/* 283CC 800277CC 8C620008 */  lw         $v0, 8($v1)
/* 283D0 800277D0 10400011 */  beqz       $v0, .L80027818
/* 283D4 800277D4 00009821 */   addu      $s3, $zero, $zero
/* 283D8 800277D8 24710008 */  addiu      $s1, $v1, 8
.L800277DC:
/* 283DC 800277DC 0C026259 */  jal        passToMalloc
/* 283E0 800277E0 2404007C */   addiu     $a0, $zero, 0x7c
/* 283E4 800277E4 00402021 */  addu       $a0, $v0, $zero
/* 283E8 800277E8 24060190 */  addiu      $a2, $zero, 0x190
/* 283EC 800277EC 8E250000 */  lw         $a1, ($s1)
/* 283F0 800277F0 0C02E3A0 */  jal        widgettext_func_2
/* 283F4 800277F4 2631000C */   addiu     $s1, $s1, 0xc
/* 283F8 800277F8 00408021 */  addu       $s0, $v0, $zero
/* 283FC 800277FC 02402021 */  addu       $a0, $s2, $zero
/* 28400 80027800 0C02E885 */  jal        link_widget_text
/* 28404 80027804 02002821 */   addu      $a1, $s0, $zero
/* 28408 80027808 8E220000 */  lw         $v0, ($s1)
/* 2840C 8002780C A613005E */  sh         $s3, 0x5e($s0)
/* 28410 80027810 1440FFF2 */  bnez       $v0, .L800277DC
/* 28414 80027814 26730001 */   addiu     $s3, $s3, 1
.L80027818:
/* 28418 80027818 02402821 */  addu       $a1, $s2, $zero
/* 2841C 8002781C 8E860018 */  lw         $a2, 0x18($s4)
/* 28420 80027820 2402004B */  addiu      $v0, $zero, 0x4b
/* 28424 80027824 A6420068 */  sh         $v0, 0x68($s2)
/* 28428 80027828 8CC30078 */  lw         $v1, 0x78($a2)
/* 2842C 8002782C 240200C8 */  addiu      $v0, $zero, 0xc8
/* 28430 80027830 A642006A */  sh         $v0, 0x6a($s2)
/* 28434 80027834 84640030 */  lh         $a0, 0x30($v1)
/* 28438 80027838 8C620034 */  lw         $v0, 0x34($v1)
/* 2843C 8002783C 0040F809 */  jalr       $v0
/* 28440 80027840 00C42021 */   addu      $a0, $a2, $a0
/* 28444 80027844 02A02021 */  addu       $a0, $s5, $zero
/* 28448 80027848 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetUpFunc)
/* 2844C 8002784C 24426170 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetUpFunc)
/* 28450 80027850 3C038002 */  lui        $v1, %hi(SmallerDebugWidgetDownFunc)
/* 28454 80027854 8E860018 */  lw         $a2, 0x18($s4)
/* 28458 80027858 246361EC */  addiu      $v1, $v1, %lo(SmallerDebugWidgetDownFunc)
/* 2845C 8002785C 00C02821 */  addu       $a1, $a2, $zero
/* 28460 80027860 ACC20008 */  sw         $v0, 8($a2)
/* 28464 80027864 3C028002 */  lui        $v0, %hi(func_8002619C)
/* 28468 80027868 2442619C */  addiu      $v0, $v0, %lo(func_8002619C)
/* 2846C 8002786C ACC3000C */  sw         $v1, 0xc($a2)
/* 28470 80027870 3C038002 */  lui        $v1, %hi(func_80026218)
/* 28474 80027874 24636218 */  addiu      $v1, $v1, %lo(func_80026218)
/* 28478 80027878 ACC20010 */  sw         $v0, 0x10($a2)
/* 2847C 8002787C 3C028002 */  lui        $v0, %hi(SmallerDebugWidgetAFunc)
/* 28480 80027880 24426268 */  addiu      $v0, $v0, %lo(SmallerDebugWidgetAFunc)
/* 28484 80027884 ACC30014 */  sw         $v1, 0x14($a2)
/* 28488 80027888 3C038002 */  lui        $v1, %hi(SmallerDebugWidget_ret_a1)
/* 2848C 8002788C 24636294 */  addiu      $v1, $v1, %lo(SmallerDebugWidget_ret_a1)
/* 28490 80027890 ACC20018 */  sw         $v0, 0x18($a2)
/* 28494 80027894 ACC3001C */  sw         $v1, 0x1c($a2)
/* 28498 80027898 ACC30020 */  sw         $v1, 0x20($a2)
/* 2849C 8002789C 0C02DC7C */  jal        widgetHandler
/* 284A0 800278A0 ACD20040 */   sw        $s2, 0x40($a2)
/* 284A4 800278A4 8FBF0030 */  lw         $ra, 0x30($sp)
/* 284A8 800278A8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 284AC 800278AC 8FB40028 */  lw         $s4, 0x28($sp)
/* 284B0 800278B0 8FB30024 */  lw         $s3, 0x24($sp)
/* 284B4 800278B4 8FB20020 */  lw         $s2, 0x20($sp)
/* 284B8 800278B8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 284BC 800278BC 8FB00018 */  lw         $s0, 0x18($sp)
/* 284C0 800278C0 03E00008 */  jr         $ra
/* 284C4 800278C4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel debug_teleport
/* 284C8 800278C8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 284CC 800278CC 00802821 */  addu       $a1, $a0, $zero
/* 284D0 800278D0 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 284D4 800278D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 284D8 800278D8 24506950 */  addiu      $s0, $v0, %lo(PlayerCharStruct)
/* 284DC 800278DC AFBF0014 */  sw         $ra, 0x14($sp)
/* 284E0 800278E0 8E070018 */  lw         $a3, 0x18($s0)
/* 284E4 800278E4 14A70011 */  bne        $a1, $a3, .L8002792C
/* 284E8 800278E8 26080038 */   addiu     $t0, $s0, 0x38
/* 284EC 800278EC 8E04155C */  lw         $a0, 0x155c($s0)
/* 284F0 800278F0 0C02DCB3 */  jal        func_800B72CC
/* 284F4 800278F4 00E02821 */   addu      $a1, $a3, $zero
/* 284F8 800278F8 8E060018 */  lw         $a2, 0x18($s0)
/* 284FC 800278FC 10C00006 */  beqz       $a2, .L80027918
/* 28500 80027900 24050003 */   addiu     $a1, $zero, 3
/* 28504 80027904 8CC20078 */  lw         $v0, 0x78($a2)
/* 28508 80027908 84440008 */  lh         $a0, 8($v0)
/* 2850C 8002790C 8C43000C */  lw         $v1, 0xc($v0)
/* 28510 80027910 0060F809 */  jalr       $v1
/* 28514 80027914 00C42021 */   addu      $a0, $a2, $a0
.L80027918:
/* 28518 80027918 AE000018 */  sw         $zero, 0x18($s0)
/* 2851C 8002791C 0C0099B0 */  jal        smaller_debug_menu
/* 28520 80027920 00002021 */   addu      $a0, $zero, $zero
/* 28524 80027924 08009E72 */  j          .L800279C8
/* 28528 80027928 8FBF0014 */   lw        $ra, 0x14($sp)
.L8002792C:
/* 2852C 8002792C 3C06800F */  lui        $a2, %hi(debugMapLabels)
/* 28530 80027930 94A3005E */  lhu        $v1, 0x5e($a1)
/* 28534 80027934 24C68B20 */  addiu      $a2, $a2, %lo(debugMapLabels)
/* 28538 80027938 00031040 */  sll        $v0, $v1, 1
/* 2853C 8002793C 00431021 */  addu       $v0, $v0, $v1
/* 28540 80027940 00021080 */  sll        $v0, $v0, 2
/* 28544 80027944 00461021 */  addu       $v0, $v0, $a2
/* 28548 80027948 94430000 */  lhu        $v1, ($v0)
/* 2854C 8002794C A50302AC */  sh         $v1, 0x2ac($t0)
/* 28550 80027950 94A4005E */  lhu        $a0, 0x5e($a1)
/* 28554 80027954 00041040 */  sll        $v0, $a0, 1
/* 28558 80027958 00441021 */  addu       $v0, $v0, $a0
/* 2855C 8002795C 00021080 */  sll        $v0, $v0, 2
/* 28560 80027960 00461021 */  addu       $v0, $v0, $a2
/* 28564 80027964 94430002 */  lhu        $v1, 2($v0)
/* 28568 80027968 A50302AE */  sh         $v1, 0x2ae($t0)
/* 2856C 8002796C 94A5005E */  lhu        $a1, 0x5e($a1)
/* 28570 80027970 8E04155C */  lw         $a0, 0x155c($s0)
/* 28574 80027974 00051040 */  sll        $v0, $a1, 1
/* 28578 80027978 00451021 */  addu       $v0, $v0, $a1
/* 2857C 8002797C 00021080 */  sll        $v0, $v0, 2
/* 28580 80027980 00461021 */  addu       $v0, $v0, $a2
/* 28584 80027984 94430004 */  lhu        $v1, 4($v0)
/* 28588 80027988 00E02821 */  addu       $a1, $a3, $zero
/* 2858C 8002798C A600000E */  sh         $zero, 0xe($s0)
/* 28590 80027990 0C02DCB3 */  jal        func_800B72CC
/* 28594 80027994 A50302B0 */   sh        $v1, 0x2b0($t0)
/* 28598 80027998 8E060018 */  lw         $a2, 0x18($s0)
/* 2859C 8002799C 10C00006 */  beqz       $a2, .L800279B8
/* 285A0 800279A0 24050003 */   addiu     $a1, $zero, 3
/* 285A4 800279A4 8CC20078 */  lw         $v0, 0x78($a2)
/* 285A8 800279A8 84440008 */  lh         $a0, 8($v0)
/* 285AC 800279AC 8C43000C */  lw         $v1, 0xc($v0)
/* 285B0 800279B0 0060F809 */  jalr       $v1
/* 285B4 800279B4 00C42021 */   addu      $a0, $a2, $a0
.L800279B8:
/* 285B8 800279B8 24020004 */  addiu      $v0, $zero, 4
/* 285BC 800279BC AE000018 */  sw         $zero, 0x18($s0)
/* 285C0 800279C0 A2020034 */  sb         $v0, 0x34($s0)
/* 285C4 800279C4 8FBF0014 */  lw         $ra, 0x14($sp)
.L800279C8:
/* 285C8 800279C8 8FB00010 */  lw         $s0, 0x10($sp)
/* 285CC 800279CC 03E00008 */  jr         $ra
/* 285D0 800279D0 27BD0018 */   addiu     $sp, $sp, 0x18
/* 285D4 800279D4 00000000 */  nop
/* 285D8 800279D8 00000000 */  nop
/* 285DC 800279DC 00000000 */  nop
