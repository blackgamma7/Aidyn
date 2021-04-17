.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8009D250
/* 9DE50 8009D250 3C02800F */  lui        $v0, %hi(D_800F32B4)
/* 9DE54 8009D254 03E00008 */  jr         $ra
/* 9DE58 8009D258 AC4032B4 */   sw        $zero, %lo(D_800F32B4)($v0)

glabel func_8009D25C
/* 9DE5C 8009D25C 3C02800F */  lui        $v0, %hi(D_800F32B0)
/* 9DE60 8009D260 03E00008 */  jr         $ra
/* 9DE64 8009D264 AC4432B0 */   sw        $a0, %lo(D_800F32B0)($v0)

glabel GetN64ImageDimension
/* 9DE68 8009D268 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9DE6C 8009D26C 00042400 */  sll        $a0, $a0, 0x10
/* 9DE70 8009D270 00041C03 */  sra        $v1, $a0, 0x10
/* 9DE74 8009D274 2C620009 */  sltiu      $v0, $v1, 9
/* 9DE78 8009D278 1040000E */  beqz       $v0, .L8009D2B4
/* 9DE7C 8009D27C AFBF0010 */   sw        $ra, 0x10($sp)
/* 9DE80 8009D280 3C02800E */  lui        $v0, %hi(D_800E2E40)
/* 9DE84 8009D284 24422E40 */  addiu      $v0, $v0, %lo(D_800E2E40)
/* 9DE88 8009D288 00031880 */  sll        $v1, $v1, 2
/* 9DE8C 8009D28C 00621821 */  addu       $v1, $v1, $v0
/* 9DE90 8009D290 8C640000 */  lw         $a0, ($v1)
/* 9DE94 8009D294 00800008 */  jr         $a0
/* 9DE98 8009D298 00000000 */   nop
/* 9DE9C 8009D29C 080274B3 */  j          .L8009D2CC
/* 9DEA0 8009D2A0 24020004 */   addiu     $v0, $zero, 4
/* 9DEA4 8009D2A4 080274B3 */  j          .L8009D2CC
/* 9DEA8 8009D2A8 24020002 */   addiu     $v0, $zero, 2
/* 9DEAC 8009D2AC 080274B3 */  j          .L8009D2CC
/* 9DEB0 8009D2B0 2402FFFF */   addiu     $v0, $zero, -1
.L8009D2B4:
/* 9DEB4 8009D2B4 3C04800E */  lui        $a0, %hi(D_800E2E10)
/* 9DEB8 8009D2B8 3C05800E */  lui        $a1, %hi(D_800E2E28)
/* 9DEBC 8009D2BC 24842E10 */  addiu      $a0, $a0, %lo(D_800E2E10)
/* 9DEC0 8009D2C0 0C025F2D */  jal        manualCrash
/* 9DEC4 8009D2C4 24A52E28 */   addiu     $a1, $a1, %lo(D_800E2E28)
/* 9DEC8 8009D2C8 24020001 */  addiu      $v0, $zero, 1
.L8009D2CC:
/* 9DECC 8009D2CC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 9DED0 8009D2D0 03E00008 */  jr         $ra
/* 9DED4 8009D2D4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009D2D8
/* 9DED8 8009D2D8 2402FFFF */  addiu      $v0, $zero, -1
/* 9DEDC 8009D2DC 00860018 */  mult       $a0, $a2
/* 9DEE0 8009D2E0 14C2000F */  bne        $a2, $v0, .L8009D320
/* 9DEE4 8009D2E4 00000000 */   nop
/* 9DEE8 8009D2E8 000417C2 */  srl        $v0, $a0, 0x1f
/* 9DEEC 8009D2EC 00821021 */  addu       $v0, $a0, $v0
/* 9DEF0 8009D2F0 00021043 */  sra        $v0, $v0, 1
/* 9DEF4 8009D2F4 28420008 */  slti       $v0, $v0, 8
/* 9DEF8 8009D2F8 00850018 */  mult       $a0, $a1
/* 9DEFC 8009D2FC 10400003 */  beqz       $v0, .L8009D30C
/* 9DF00 8009D300 00000000 */   nop
.L8009D304:
/* 9DF04 8009D304 03E00008 */  jr         $ra
/* 9DF08 8009D308 000510C0 */   sll       $v0, $a1, 3
.L8009D30C:
/* 9DF0C 8009D30C 00001012 */  mflo       $v0
/* 9DF10 8009D310 00021FC2 */  srl        $v1, $v0, 0x1f
/* 9DF14 8009D314 00431021 */  addu       $v0, $v0, $v1
/* 9DF18 8009D318 03E00008 */  jr         $ra
/* 9DF1C 8009D31C 00021043 */   sra       $v0, $v0, 1
.L8009D320:
/* 9DF20 8009D320 00001012 */  mflo       $v0
/* 9DF24 8009D324 28420008 */  slti       $v0, $v0, 8
/* 9DF28 8009D328 00850018 */  mult       $a0, $a1
/* 9DF2C 8009D32C 1440FFF5 */  bnez       $v0, .L8009D304
/* 9DF30 8009D330 00000000 */   nop
/* 9DF34 8009D334 00001012 */  mflo       $v0
/* 9DF38 8009D338 00000000 */  nop
/* 9DF3C 8009D33C 00000000 */  nop
/* 9DF40 8009D340 00460018 */  mult       $v0, $a2
/* 9DF44 8009D344 00001012 */  mflo       $v0
/* 9DF48 8009D348 03E00008 */  jr         $ra
/* 9DF4C 8009D34C 00000000 */   nop

glabel func_8009D350
/* 9DF50 8009D350 00042043 */  sra        $a0, $a0, 1
/* 9DF54 8009D354 24020001 */  addiu      $v0, $zero, 1
/* 9DF58 8009D358 10820003 */  beq        $a0, $v0, .L8009D368
/* 9DF5C 8009D35C 30820001 */   andi      $v0, $a0, 1
/* 9DF60 8009D360 54400001 */  bnel       $v0, $zero, .L8009D368
/* 9DF64 8009D364 2484FFFF */   addiu     $a0, $a0, -1
.L8009D368:
/* 9DF68 8009D368 03E00008 */  jr         $ra
/* 9DF6C 8009D36C 00801021 */   addu      $v0, $a0, $zero

glabel func_8009D370
/* 9DF70 8009D370 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9DF74 8009D374 00801021 */  addu       $v0, $a0, $zero
/* 9DF78 8009D378 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DF7C 8009D37C 2410FFFF */  addiu      $s0, $zero, -1
/* 9DF80 8009D380 10400006 */  beqz       $v0, .L8009D39C
/* 9DF84 8009D384 AFBF0014 */   sw        $ra, 0x14($sp)
/* 9DF88 8009D388 26100001 */  addiu      $s0, $s0, 1
.L8009D38C:
/* 9DF8C 8009D38C 0C0274D4 */  jal        func_8009D350
/* 9DF90 8009D390 00402021 */   addu      $a0, $v0, $zero
/* 9DF94 8009D394 5440FFFD */  bnel       $v0, $zero, .L8009D38C
/* 9DF98 8009D398 26100001 */   addiu     $s0, $s0, 1
.L8009D39C:
/* 9DF9C 8009D39C 02001021 */  addu       $v0, $s0, $zero
/* 9DFA0 8009D3A0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9DFA4 8009D3A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DFA8 8009D3A8 03E00008 */  jr         $ra
/* 9DFAC 8009D3AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009D3B0
/* 9DFB0 8009D3B0 0085001A */  div        $zero, $a0, $a1
/* 9DFB4 8009D3B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9DFB8 8009D3B8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 9DFBC 8009D3BC 00002012 */  mflo       $a0
/* 9DFC0 8009D3C0 50A00001 */  beql       $a1, $zero, .L8009D3C8
/* 9DFC4 8009D3C4 000001CD */   break     0, 7
.L8009D3C8:
/* 9DFC8 8009D3C8 0C0274DC */   jal       func_8009D370
/* 9DFCC 8009D3CC 00000000 */   nop
/* 9DFD0 8009D3D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 9DFD4 8009D3D4 03E00008 */  jr         $ra
/* 9DFD8 8009D3D8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009D3DC
/* 9DFDC 8009D3DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9DFE0 8009D3E0 AFB10014 */  sw         $s1, 0x14($sp)
/* 9DFE4 8009D3E4 00A08821 */  addu       $s1, $a1, $zero
/* 9DFE8 8009D3E8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 9DFEC 8009D3EC AFB20018 */  sw         $s2, 0x18($sp)
/* 9DFF0 8009D3F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DFF4 8009D3F4 8E230010 */  lw         $v1, 0x10($s1)
/* 9DFF8 8009D3F8 94620002 */  lhu        $v0, 2($v1)
/* 9DFFC 8009D3FC 30420200 */  andi       $v0, $v0, 0x200
/* 9E000 8009D400 1040002E */  beqz       $v0, .L8009D4BC
/* 9E004 8009D404 00809021 */   addu      $s2, $a0, $zero
/* 9E008 8009D408 90650007 */  lbu        $a1, 7($v1)
/* 9E00C 8009D40C 30A2000F */  andi       $v0, $a1, 0xf
/* 9E010 8009D410 54400013 */  bnel       $v0, $zero, .L8009D460
/* 9E014 8009D414 8E240010 */   lw        $a0, 0x10($s1)
/* 9E018 8009D418 30A200F0 */  andi       $v0, $a1, 0xf0
/* 9E01C 8009D41C 50400010 */  beql       $v0, $zero, .L8009D460
/* 9E020 8009D420 8E240010 */   lw        $a0, 0x10($s1)
/* 9E024 8009D424 94620000 */  lhu        $v0, ($v1)
/* 9E028 8009D428 2C420002 */  sltiu      $v0, $v0, 2
/* 9E02C 8009D42C 10400005 */  beqz       $v0, .L8009D444
/* 9E030 8009D430 02202021 */   addu      $a0, $s1, $zero
/* 9E034 8009D434 0C02759A */  jal        func_8009D668
/* 9E038 8009D438 00052902 */   srl       $a1, $a1, 4
/* 9E03C 8009D43C 08027514 */  j          .L8009D450
/* 9E040 8009D440 00000000 */   nop
.L8009D444:
/* 9E044 8009D444 30A500FF */  andi       $a1, $a1, 0xff
/* 9E048 8009D448 0C027548 */  jal        func_8009D520
/* 9E04C 8009D44C 00052902 */   srl       $a1, $a1, 4
.L8009D450:
/* 9E050 8009D450 0C0275EC */  jal        func_8009D7B0
/* 9E054 8009D454 02202021 */   addu      $a0, $s1, $zero
/* 9E058 8009D458 08027530 */  j          .L8009D4C0
/* 9E05C 8009D45C 8E220010 */   lw        $v0, 0x10($s1)
.L8009D460:
/* 9E060 8009D460 90830007 */  lbu        $v1, 7($a0)
/* 9E064 8009D464 00032902 */  srl        $a1, $v1, 4
/* 9E068 8009D468 3062000F */  andi       $v0, $v1, 0xf
/* 9E06C 8009D46C 14A20012 */  bne        $a1, $v0, .L8009D4B8
/* 9E070 8009D470 24620010 */   addiu     $v0, $v1, 0x10
/* 9E074 8009D474 94820000 */  lhu        $v0, ($a0)
/* 9E078 8009D478 2C420002 */  sltiu      $v0, $v0, 2
/* 9E07C 8009D47C 10400005 */  beqz       $v0, .L8009D494
/* 9E080 8009D480 00000000 */   nop
/* 9E084 8009D484 0C02759A */  jal        func_8009D668
/* 9E088 8009D488 02202021 */   addu      $a0, $s1, $zero
/* 9E08C 8009D48C 08027527 */  j          .L8009D49C
/* 9E090 8009D490 00000000 */   nop
.L8009D494:
/* 9E094 8009D494 0C027548 */  jal        func_8009D520
/* 9E098 8009D498 02202021 */   addu      $a0, $s1, $zero
.L8009D49C:
/* 9E09C 8009D49C 0C0275EC */  jal        func_8009D7B0
/* 9E0A0 8009D4A0 02202021 */   addu      $a0, $s1, $zero
/* 9E0A4 8009D4A4 8E230010 */  lw         $v1, 0x10($s1)
/* 9E0A8 8009D4A8 90620007 */  lbu        $v0, 7($v1)
/* 9E0AC 8009D4AC 3042000F */  andi       $v0, $v0, 0xf
/* 9E0B0 8009D4B0 0802752F */  j          .L8009D4BC
/* 9E0B4 8009D4B4 A0620007 */   sb        $v0, 7($v1)
.L8009D4B8:
/* 9E0B8 8009D4B8 A0820007 */  sb         $v0, 7($a0)
.L8009D4BC:
/* 9E0BC 8009D4BC 8E220010 */  lw         $v0, 0x10($s1)
.L8009D4C0:
/* 9E0C0 8009D4C0 8C430008 */  lw         $v1, 8($v0)
/* 9E0C4 8009D4C4 10600009 */  beqz       $v1, .L8009D4EC
/* 9E0C8 8009D4C8 02408021 */   addu      $s0, $s2, $zero
/* 9E0CC 8009D4CC 3C02DE00 */  lui        $v0, 0xde00
/* 9E0D0 8009D4D0 AE020000 */  sw         $v0, ($s0)
/* 9E0D4 8009D4D4 8E230010 */  lw         $v1, 0x10($s1)
/* 9E0D8 8009D4D8 8C640008 */  lw         $a0, 8($v1)
/* 9E0DC 8009D4DC 0C034888 */  jal        osVirtualToPhysical
/* 9E0E0 8009D4E0 26520008 */   addiu     $s2, $s2, 8
/* 9E0E4 8009D4E4 0802753F */  j          .L8009D4FC
/* 9E0E8 8009D4E8 AE020004 */   sw        $v0, 4($s0)
.L8009D4EC:
/* 9E0EC 8009D4EC 02402021 */  addu       $a0, $s2, $zero
/* 9E0F0 8009D4F0 0C0275F6 */  jal        borganim_LoadTextureImage
/* 9E0F4 8009D4F4 02202821 */   addu      $a1, $s1, $zero
/* 9E0F8 8009D4F8 00409021 */  addu       $s2, $v0, $zero
.L8009D4FC:
/* 9E0FC 8009D4FC 3C02800F */  lui        $v0, %hi(D_800F32B4)
/* 9E100 8009D500 AC5132B4 */  sw         $s1, %lo(D_800F32B4)($v0)
/* 9E104 8009D504 02401021 */  addu       $v0, $s2, $zero
/* 9E108 8009D508 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9E10C 8009D50C 8FB20018 */  lw         $s2, 0x18($sp)
/* 9E110 8009D510 8FB10014 */  lw         $s1, 0x14($sp)
/* 9E114 8009D514 8FB00010 */  lw         $s0, 0x10($sp)
/* 9E118 8009D518 03E00008 */  jr         $ra
/* 9E11C 8009D51C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009D520
/* 9E120 8009D520 27BDFFF8 */  addiu      $sp, $sp, -8
/* 9E124 8009D524 AFB00000 */  sw         $s0, ($sp)
/* 9E128 8009D528 8C820010 */  lw         $v0, 0x10($a0)
/* 9E12C 8009D52C 8C43000C */  lw         $v1, 0xc($v0)
/* 9E130 8009D530 8C820008 */  lw         $v0, 8($a0)
/* 9E134 8009D534 54620004 */  bnel       $v1, $v0, .L8009D548
/* 9E138 8009D538 8C8D000C */   lw        $t5, 0xc($a0)
/* 9E13C 8009D53C 00406821 */  addu       $t5, $v0, $zero
/* 9E140 8009D540 08027553 */  j          .L8009D54C
/* 9E144 8009D544 8C98000C */   lw        $t8, 0xc($a0)
.L8009D548:
/* 9E148 8009D548 0040C021 */  addu       $t8, $v0, $zero
.L8009D54C:
/* 9E14C 8009D54C 8C820010 */  lw         $v0, 0x10($a0)
/* 9E150 8009D550 00003021 */  addu       $a2, $zero, $zero
/* 9E154 8009D554 90500005 */  lbu        $s0, 5($v0)
/* 9E158 8009D558 12000040 */  beqz       $s0, .L8009D65C
/* 9E15C 8009D55C 90490004 */   lbu       $t1, 4($v0)
/* 9E160 8009D560 3139FFFF */  andi       $t9, $t1, 0xffff
/* 9E164 8009D564 00052823 */  negu       $a1, $a1
/* 9E168 8009D568 00C90018 */  mult       $a2, $t1
.L8009D56C:
/* 9E16C 8009D56C 30C20001 */  andi       $v0, $a2, 1
/* 9E170 8009D570 00005812 */  mflo       $t3
/* 9E174 8009D574 1040001C */  beqz       $v0, .L8009D5E8
/* 9E178 8009D578 00003821 */   addu      $a3, $zero, $zero
/* 9E17C 8009D57C 11200031 */  beqz       $t1, .L8009D644
/* 9E180 8009D580 24CF0001 */   addiu     $t7, $a2, 1
/* 9E184 8009D584 00195027 */  nor        $t2, $zero, $t9
/* 9E188 8009D588 3C080001 */  lui        $t0, 1
/* 9E18C 8009D58C 01253021 */  addu       $a2, $t1, $a1
/* 9E190 8009D590 3C0C0001 */  lui        $t4, 1
.L8009D594:
/* 9E194 8009D594 00CA1024 */  and        $v0, $a2, $t2
/* 9E198 8009D598 38420002 */  xori       $v0, $v0, 2
/* 9E19C 8009D59C 00021400 */  sll        $v0, $v0, 0x10
/* 9E1A0 8009D5A0 00021403 */  sra        $v0, $v0, 0x10
/* 9E1A4 8009D5A4 01002021 */  addu       $a0, $t0, $zero
/* 9E1A8 8009D5A8 010C4021 */  addu       $t0, $t0, $t4
/* 9E1AC 8009D5AC 24C60001 */  addiu      $a2, $a2, 1
/* 9E1B0 8009D5B0 38E30002 */  xori       $v1, $a3, 2
/* 9E1B4 8009D5B4 00043C03 */  sra        $a3, $a0, 0x10
/* 9E1B8 8009D5B8 01631821 */  addu       $v1, $t3, $v1
/* 9E1BC 8009D5BC 00031880 */  sll        $v1, $v1, 2
/* 9E1C0 8009D5C0 01621021 */  addu       $v0, $t3, $v0
/* 9E1C4 8009D5C4 00021080 */  sll        $v0, $v0, 2
/* 9E1C8 8009D5C8 004D1021 */  addu       $v0, $v0, $t5
/* 9E1CC 8009D5CC 00781821 */  addu       $v1, $v1, $t8
/* 9E1D0 8009D5D0 8C440000 */  lw         $a0, ($v0)
/* 9E1D4 8009D5D4 00E9102A */  slt        $v0, $a3, $t1
/* 9E1D8 8009D5D8 1440FFEE */  bnez       $v0, .L8009D594
/* 9E1DC 8009D5DC AC640000 */   sw        $a0, ($v1)
/* 9E1E0 8009D5E0 08027592 */  j          .L8009D648
/* 9E1E4 8009D5E4 000F1400 */   sll       $v0, $t7, 0x10
.L8009D5E8:
/* 9E1E8 8009D5E8 11200016 */  beqz       $t1, .L8009D644
/* 9E1EC 8009D5EC 24CF0001 */   addiu     $t7, $a2, 1
/* 9E1F0 8009D5F0 00196027 */  nor        $t4, $zero, $t9
/* 9E1F4 8009D5F4 3C0A0001 */  lui        $t2, 1
/* 9E1F8 8009D5F8 000B1080 */  sll        $v0, $t3, 2
/* 9E1FC 8009D5FC 00584021 */  addu       $t0, $v0, $t8
/* 9E200 8009D600 01253021 */  addu       $a2, $t1, $a1
/* 9E204 8009D604 3C0E0001 */  lui        $t6, 1
.L8009D608:
/* 9E208 8009D608 00CC1024 */  and        $v0, $a2, $t4
/* 9E20C 8009D60C 00021400 */  sll        $v0, $v0, 0x10
/* 9E210 8009D610 00021403 */  sra        $v0, $v0, 0x10
/* 9E214 8009D614 01402021 */  addu       $a0, $t2, $zero
/* 9E218 8009D618 014E5021 */  addu       $t2, $t2, $t6
/* 9E21C 8009D61C 24C60001 */  addiu      $a2, $a2, 1
/* 9E220 8009D620 01621021 */  addu       $v0, $t3, $v0
/* 9E224 8009D624 00021080 */  sll        $v0, $v0, 2
/* 9E228 8009D628 004D1021 */  addu       $v0, $v0, $t5
/* 9E22C 8009D62C 00043C03 */  sra        $a3, $a0, 0x10
/* 9E230 8009D630 8C430000 */  lw         $v1, ($v0)
/* 9E234 8009D634 00E9102A */  slt        $v0, $a3, $t1
/* 9E238 8009D638 AD030000 */  sw         $v1, ($t0)
/* 9E23C 8009D63C 1440FFF2 */  bnez       $v0, .L8009D608
/* 9E240 8009D640 25080004 */   addiu     $t0, $t0, 4
.L8009D644:
/* 9E244 8009D644 000F1400 */  sll        $v0, $t7, 0x10
.L8009D648:
/* 9E248 8009D648 00023403 */  sra        $a2, $v0, 0x10
/* 9E24C 8009D64C 00D0182A */  slt        $v1, $a2, $s0
/* 9E250 8009D650 00C90018 */  mult       $a2, $t1
/* 9E254 8009D654 1460FFC5 */  bnez       $v1, .L8009D56C
/* 9E258 8009D658 00000000 */   nop
.L8009D65C:
/* 9E25C 8009D65C 8FB00000 */  lw         $s0, ($sp)
/* 9E260 8009D660 03E00008 */  jr         $ra
/* 9E264 8009D664 27BD0008 */   addiu     $sp, $sp, 8

glabel func_8009D668
/* 9E268 8009D668 27BDFFF8 */  addiu      $sp, $sp, -8
/* 9E26C 8009D66C AFB00000 */  sw         $s0, ($sp)
/* 9E270 8009D670 8C820010 */  lw         $v0, 0x10($a0)
/* 9E274 8009D674 8C43000C */  lw         $v1, 0xc($v0)
/* 9E278 8009D678 8C820008 */  lw         $v0, 8($a0)
/* 9E27C 8009D67C 54620004 */  bnel       $v1, $v0, .L8009D690
/* 9E280 8009D680 8C8D000C */   lw        $t5, 0xc($a0)
/* 9E284 8009D684 00406821 */  addu       $t5, $v0, $zero
/* 9E288 8009D688 080275A5 */  j          .L8009D694
/* 9E28C 8009D68C 8C98000C */   lw        $t8, 0xc($a0)
.L8009D690:
/* 9E290 8009D690 0040C021 */  addu       $t8, $v0, $zero
.L8009D694:
/* 9E294 8009D694 8C820010 */  lw         $v0, 0x10($a0)
/* 9E298 8009D698 00003021 */  addu       $a2, $zero, $zero
/* 9E29C 8009D69C 90500005 */  lbu        $s0, 5($v0)
/* 9E2A0 8009D6A0 12000040 */  beqz       $s0, .L8009D7A4
/* 9E2A4 8009D6A4 90490004 */   lbu       $t1, 4($v0)
/* 9E2A8 8009D6A8 3139FFFF */  andi       $t9, $t1, 0xffff
/* 9E2AC 8009D6AC 00052823 */  negu       $a1, $a1
/* 9E2B0 8009D6B0 00C90018 */  mult       $a2, $t1
.L8009D6B4:
/* 9E2B4 8009D6B4 30C20001 */  andi       $v0, $a2, 1
/* 9E2B8 8009D6B8 00005812 */  mflo       $t3
/* 9E2BC 8009D6BC 1040001C */  beqz       $v0, .L8009D730
/* 9E2C0 8009D6C0 00003821 */   addu      $a3, $zero, $zero
/* 9E2C4 8009D6C4 11200031 */  beqz       $t1, .L8009D78C
/* 9E2C8 8009D6C8 24CF0001 */   addiu     $t7, $a2, 1
/* 9E2CC 8009D6CC 00195027 */  nor        $t2, $zero, $t9
/* 9E2D0 8009D6D0 3C080001 */  lui        $t0, 1
/* 9E2D4 8009D6D4 01253021 */  addu       $a2, $t1, $a1
/* 9E2D8 8009D6D8 3C0C0001 */  lui        $t4, 1
.L8009D6DC:
/* 9E2DC 8009D6DC 00CA1024 */  and        $v0, $a2, $t2
/* 9E2E0 8009D6E0 38420002 */  xori       $v0, $v0, 2
/* 9E2E4 8009D6E4 00021400 */  sll        $v0, $v0, 0x10
/* 9E2E8 8009D6E8 00021403 */  sra        $v0, $v0, 0x10
/* 9E2EC 8009D6EC 01002021 */  addu       $a0, $t0, $zero
/* 9E2F0 8009D6F0 010C4021 */  addu       $t0, $t0, $t4
/* 9E2F4 8009D6F4 24C60001 */  addiu      $a2, $a2, 1
/* 9E2F8 8009D6F8 38E30002 */  xori       $v1, $a3, 2
/* 9E2FC 8009D6FC 00043C03 */  sra        $a3, $a0, 0x10
/* 9E300 8009D700 01631821 */  addu       $v1, $t3, $v1
/* 9E304 8009D704 00031840 */  sll        $v1, $v1, 1
/* 9E308 8009D708 01621021 */  addu       $v0, $t3, $v0
/* 9E30C 8009D70C 00021040 */  sll        $v0, $v0, 1
/* 9E310 8009D710 004D1021 */  addu       $v0, $v0, $t5
/* 9E314 8009D714 00781821 */  addu       $v1, $v1, $t8
/* 9E318 8009D718 94440000 */  lhu        $a0, ($v0)
/* 9E31C 8009D71C 00E9102A */  slt        $v0, $a3, $t1
/* 9E320 8009D720 1440FFEE */  bnez       $v0, .L8009D6DC
/* 9E324 8009D724 A4640000 */   sh        $a0, ($v1)
/* 9E328 8009D728 080275E4 */  j          .L8009D790
/* 9E32C 8009D72C 000F1400 */   sll       $v0, $t7, 0x10
.L8009D730:
/* 9E330 8009D730 11200016 */  beqz       $t1, .L8009D78C
/* 9E334 8009D734 24CF0001 */   addiu     $t7, $a2, 1
/* 9E338 8009D738 00196027 */  nor        $t4, $zero, $t9
/* 9E33C 8009D73C 3C0A0001 */  lui        $t2, 1
/* 9E340 8009D740 000B1040 */  sll        $v0, $t3, 1
/* 9E344 8009D744 00584021 */  addu       $t0, $v0, $t8
/* 9E348 8009D748 01253021 */  addu       $a2, $t1, $a1
/* 9E34C 8009D74C 3C0E0001 */  lui        $t6, 1
.L8009D750:
/* 9E350 8009D750 00CC1024 */  and        $v0, $a2, $t4
/* 9E354 8009D754 00021400 */  sll        $v0, $v0, 0x10
/* 9E358 8009D758 00021403 */  sra        $v0, $v0, 0x10
/* 9E35C 8009D75C 01402021 */  addu       $a0, $t2, $zero
/* 9E360 8009D760 014E5021 */  addu       $t2, $t2, $t6
/* 9E364 8009D764 24C60001 */  addiu      $a2, $a2, 1
/* 9E368 8009D768 01621021 */  addu       $v0, $t3, $v0
/* 9E36C 8009D76C 00021040 */  sll        $v0, $v0, 1
/* 9E370 8009D770 004D1021 */  addu       $v0, $v0, $t5
/* 9E374 8009D774 00043C03 */  sra        $a3, $a0, 0x10
/* 9E378 8009D778 94430000 */  lhu        $v1, ($v0)
/* 9E37C 8009D77C 00E9102A */  slt        $v0, $a3, $t1
/* 9E380 8009D780 A5030000 */  sh         $v1, ($t0)
/* 9E384 8009D784 1440FFF2 */  bnez       $v0, .L8009D750
/* 9E388 8009D788 25080002 */   addiu     $t0, $t0, 2
.L8009D78C:
/* 9E38C 8009D78C 000F1400 */  sll        $v0, $t7, 0x10
.L8009D790:
/* 9E390 8009D790 00023403 */  sra        $a2, $v0, 0x10
/* 9E394 8009D794 00D0182A */  slt        $v1, $a2, $s0
/* 9E398 8009D798 00C90018 */  mult       $a2, $t1
/* 9E39C 8009D79C 1460FFC5 */  bnez       $v1, .L8009D6B4
/* 9E3A0 8009D7A0 00000000 */   nop
.L8009D7A4:
/* 9E3A4 8009D7A4 8FB00000 */  lw         $s0, ($sp)
/* 9E3A8 8009D7A8 03E00008 */  jr         $ra
/* 9E3AC 8009D7AC 27BD0008 */   addiu     $sp, $sp, 8

glabel func_8009D7B0
/* 9E3B0 8009D7B0 8C830010 */  lw         $v1, 0x10($a0)
/* 9E3B4 8009D7B4 8C850008 */  lw         $a1, 8($a0)
/* 9E3B8 8009D7B8 8C62000C */  lw         $v0, 0xc($v1)
/* 9E3BC 8009D7BC 14450004 */  bne        $v0, $a1, .L8009D7D0
/* 9E3C0 8009D7C0 00000000 */   nop
/* 9E3C4 8009D7C4 8C82000C */  lw         $v0, 0xc($a0)
/* 9E3C8 8009D7C8 03E00008 */  jr         $ra
/* 9E3CC 8009D7CC AC62000C */   sw        $v0, 0xc($v1)
.L8009D7D0:
/* 9E3D0 8009D7D0 03E00008 */  jr         $ra
/* 9E3D4 8009D7D4 AC65000C */   sw        $a1, 0xc($v1)

glabel borganim_LoadTextureImage
/* 9E3D8 8009D7D8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9E3DC 8009D7DC AFB20018 */  sw         $s2, 0x18($sp)
/* 9E3E0 8009D7E0 00809021 */  addu       $s2, $a0, $zero
/* 9E3E4 8009D7E4 26520008 */  addiu      $s2, $s2, 8
/* 9E3E8 8009D7E8 02403021 */  addu       $a2, $s2, $zero
/* 9E3EC 8009D7EC 26520008 */  addiu      $s2, $s2, 8
/* 9E3F0 8009D7F0 3C03DB06 */  lui        $v1, 0xdb06
/* 9E3F4 8009D7F4 3463002C */  ori        $v1, $v1, 0x2c
/* 9E3F8 8009D7F8 3C02E700 */  lui        $v0, 0xe700
/* 9E3FC 8009D7FC AFBF0034 */  sw         $ra, 0x34($sp)
/* 9E400 8009D800 AFBE0030 */  sw         $fp, 0x30($sp)
/* 9E404 8009D804 AFB7002C */  sw         $s7, 0x2c($sp)
/* 9E408 8009D808 AFB60028 */  sw         $s6, 0x28($sp)
/* 9E40C 8009D80C AFB50024 */  sw         $s5, 0x24($sp)
/* 9E410 8009D810 AFB40020 */  sw         $s4, 0x20($sp)
/* 9E414 8009D814 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9E418 8009D818 AFB10014 */  sw         $s1, 0x14($sp)
/* 9E41C 8009D81C AFB00010 */  sw         $s0, 0x10($sp)
/* 9E420 8009D820 AC820000 */  sw         $v0, ($a0)
/* 9E424 8009D824 3C02E800 */  lui        $v0, 0xe800
/* 9E428 8009D828 02408821 */  addu       $s1, $s2, $zero
/* 9E42C 8009D82C 00A0A821 */  addu       $s5, $a1, $zero
/* 9E430 8009D830 AC800004 */  sw         $zero, 4($a0)
/* 9E434 8009D834 ACC20000 */  sw         $v0, ($a2)
/* 9E438 8009D838 ACC00004 */  sw         $zero, 4($a2)
/* 9E43C 8009D83C AE230000 */  sw         $v1, ($s1)
/* 9E440 8009D840 8EA20010 */  lw         $v0, 0x10($s5)
/* 9E444 8009D844 8C44000C */  lw         $a0, 0xc($v0)
/* 9E448 8009D848 0C034888 */  jal        osVirtualToPhysical
/* 9E44C 8009D84C 26520008 */   addiu     $s2, $s2, 8
/* 9E450 8009D850 3C03DB06 */  lui        $v1, 0xdb06
/* 9E454 8009D854 34630030 */  ori        $v1, $v1, 0x30
/* 9E458 8009D858 02408021 */  addu       $s0, $s2, $zero
/* 9E45C 8009D85C AE220004 */  sw         $v0, 4($s1)
/* 9E460 8009D860 AE030000 */  sw         $v1, ($s0)
/* 9E464 8009D864 8EA20010 */  lw         $v0, 0x10($s5)
/* 9E468 8009D868 8C440010 */  lw         $a0, 0x10($v0)
/* 9E46C 8009D86C 0C034888 */  jal        osVirtualToPhysical
/* 9E470 8009D870 26520008 */   addiu     $s2, $s2, 8
/* 9E474 8009D874 AE020004 */  sw         $v0, 4($s0)
/* 9E478 8009D878 8EA20010 */  lw         $v0, 0x10($s5)
/* 9E47C 8009D87C 84440000 */  lh         $a0, ($v0)
/* 9E480 8009D880 0C02749A */  jal        GetN64ImageDimension
/* 9E484 8009D884 00009821 */   addu      $s3, $zero, $zero
/* 9E488 8009D888 0000A021 */  addu       $s4, $zero, $zero
/* 9E48C 8009D88C 3C170B00 */  lui        $s7, 0xb00
/* 9E490 8009D890 3C1E0C00 */  lui        $fp, 0xc00
/* 9E494 8009D894 8EA30010 */  lw         $v1, 0x10($s5)
/* 9E498 8009D898 0040B021 */  addu       $s6, $v0, $zero
/* 9E49C 8009D89C 90710004 */  lbu        $s1, 4($v1)
/* 9E4A0 8009D8A0 80640006 */  lb         $a0, 6($v1)
/* 9E4A4 8009D8A4 04800012 */  bltz       $a0, .L8009D8F0
/* 9E4A8 8009D8A8 90700005 */   lbu       $s0, 5($v1)
/* 9E4AC 8009D8AC 02202021 */  addu       $a0, $s1, $zero
.L8009D8B0:
/* 9E4B0 8009D8B0 02002821 */  addu       $a1, $s0, $zero
/* 9E4B4 8009D8B4 0C0274B6 */  jal        func_8009D2D8
/* 9E4B8 8009D8B8 02C03021 */   addu      $a2, $s6, $zero
/* 9E4BC 8009D8BC 02629821 */  addu       $s3, $s3, $v0
/* 9E4C0 8009D8C0 0C0274D4 */  jal        func_8009D350
/* 9E4C4 8009D8C4 02202021 */   addu      $a0, $s1, $zero
/* 9E4C8 8009D8C8 00408821 */  addu       $s1, $v0, $zero
/* 9E4CC 8009D8CC 0C0274D4 */  jal        func_8009D350
/* 9E4D0 8009D8D0 02002021 */   addu      $a0, $s0, $zero
/* 9E4D4 8009D8D4 8EA30010 */  lw         $v1, 0x10($s5)
/* 9E4D8 8009D8D8 00408021 */  addu       $s0, $v0, $zero
/* 9E4DC 8009D8DC 80620006 */  lb         $v0, 6($v1)
/* 9E4E0 8009D8E0 26940001 */  addiu      $s4, $s4, 1
/* 9E4E4 8009D8E4 0054102A */  slt        $v0, $v0, $s4
/* 9E4E8 8009D8E8 1040FFF1 */  beqz       $v0, .L8009D8B0
/* 9E4EC 8009D8EC 02202021 */   addu      $a0, $s1, $zero
.L8009D8F0:
/* 9E4F0 8009D8F0 8EA20010 */  lw         $v0, 0x10($s5)
/* 9E4F4 8009D8F4 84450000 */  lh         $a1, ($v0)
/* 9E4F8 8009D8F8 2CA30009 */  sltiu      $v1, $a1, 9
/* 9E4FC 8009D8FC 106000BD */  beqz       $v1, .L8009DBF4
/* 9E500 8009D900 3C02800E */   lui       $v0, %hi(D_800E2EA0)
/* 9E504 8009D904 24422EA0 */  addiu      $v0, $v0, %lo(D_800E2EA0)
/* 9E508 8009D908 00051880 */  sll        $v1, $a1, 2
/* 9E50C 8009D90C 00621821 */  addu       $v1, $v1, $v0
/* 9E510 8009D910 8C640000 */  lw         $a0, ($v1)
/* 9E514 8009D914 00800008 */  jr         $a0
/* 9E518 8009D918 00000000 */   nop
/* 9E51C 8009D91C 00131083 */  sra        $v0, $s3, 2
/* 9E520 8009D920 02401821 */  addu       $v1, $s2, $zero
/* 9E524 8009D924 26520008 */  addiu      $s2, $s2, 8
/* 9E528 8009D928 02402021 */  addu       $a0, $s2, $zero
/* 9E52C 8009D92C 26520008 */  addiu      $s2, $s2, 8
/* 9E530 8009D930 02402821 */  addu       $a1, $s2, $zero
/* 9E534 8009D934 26520008 */  addiu      $s2, $s2, 8
/* 9E538 8009D938 02404021 */  addu       $t0, $s2, $zero
/* 9E53C 8009D93C 26520008 */  addiu      $s2, $s2, 8
/* 9E540 8009D940 2447FFFF */  addiu      $a3, $v0, -1
/* 9E544 8009D944 3C02FD18 */  lui        $v0, 0xfd18
/* 9E548 8009D948 AC620000 */  sw         $v0, ($v1)
/* 9E54C 8009D94C 080276E1 */  j          .L8009DB84
/* 9E550 8009D950 3C02F518 */   lui       $v0, 0xf518
/* 9E554 8009D954 080276D5 */  j          .L8009DB54
/* 9E558 8009D958 00131043 */   sra       $v0, $s3, 1
/* 9E55C 8009D95C 080276D5 */  j          .L8009DB54
/* 9E560 8009D960 00131043 */   sra       $v0, $s3, 1
/* 9E564 8009D964 00131043 */  sra        $v0, $s3, 1
/* 9E568 8009D968 02401821 */  addu       $v1, $s2, $zero
/* 9E56C 8009D96C 26520008 */  addiu      $s2, $s2, 8
/* 9E570 8009D970 02402021 */  addu       $a0, $s2, $zero
/* 9E574 8009D974 26520008 */  addiu      $s2, $s2, 8
/* 9E578 8009D978 02402821 */  addu       $a1, $s2, $zero
/* 9E57C 8009D97C 26520008 */  addiu      $s2, $s2, 8
/* 9E580 8009D980 02408021 */  addu       $s0, $s2, $zero
/* 9E584 8009D984 26520008 */  addiu      $s2, $s2, 8
/* 9E588 8009D988 2446FFFF */  addiu      $a2, $v0, -1
/* 9E58C 8009D98C 3C11FD10 */  lui        $s1, 0xfd10
/* 9E590 8009D990 3C02F510 */  lui        $v0, 0xf510
/* 9E594 8009D994 3C0F0700 */  lui        $t7, 0x700
/* 9E598 8009D998 3C13E600 */  lui        $s3, 0xe600
/* 9E59C 8009D99C AC710000 */  sw         $s1, ($v1)
/* 9E5A0 8009D9A0 AC770004 */  sw         $s7, 4($v1)
/* 9E5A4 8009D9A4 AC820000 */  sw         $v0, ($a0)
/* 9E5A8 8009D9A8 3C02F300 */  lui        $v0, 0xf300
/* 9E5AC 8009D9AC 28C30800 */  slti       $v1, $a2, 0x800
/* 9E5B0 8009D9B0 AC8F0004 */  sw         $t7, 4($a0)
/* 9E5B4 8009D9B4 ACB30000 */  sw         $s3, ($a1)
/* 9E5B8 8009D9B8 ACA00004 */  sw         $zero, 4($a1)
/* 9E5BC 8009D9BC 14600002 */  bnez       $v1, .L8009D9C8
/* 9E5C0 8009D9C0 AE020000 */   sw        $v0, ($s0)
/* 9E5C4 8009D9C4 240607FF */  addiu      $a2, $zero, 0x7ff
.L8009D9C8:
/* 9E5C8 8009D9C8 02405821 */  addu       $t3, $s2, $zero
/* 9E5CC 8009D9CC 26520008 */  addiu      $s2, $s2, 8
/* 9E5D0 8009D9D0 02407021 */  addu       $t6, $s2, $zero
/* 9E5D4 8009D9D4 26520008 */  addiu      $s2, $s2, 8
/* 9E5D8 8009D9D8 3C03E300 */  lui        $v1, 0xe300
/* 9E5DC 8009D9DC 34631001 */  ori        $v1, $v1, 0x1001
/* 9E5E0 8009D9E0 02404821 */  addu       $t1, $s2, $zero
/* 9E5E4 8009D9E4 26520008 */  addiu      $s2, $s2, 8
/* 9E5E8 8009D9E8 02406021 */  addu       $t4, $s2, $zero
/* 9E5EC 8009D9EC 26520008 */  addiu      $s2, $s2, 8
/* 9E5F0 8009D9F0 02406821 */  addu       $t5, $s2, $zero
/* 9E5F4 8009D9F4 26520008 */  addiu      $s2, $s2, 8
/* 9E5F8 8009D9F8 3C04F500 */  lui        $a0, 0xf500
/* 9E5FC 8009D9FC 34840100 */  ori        $a0, $a0, 0x100
/* 9E600 8009DA00 02404021 */  addu       $t0, $s2, $zero
/* 9E604 8009DA04 26520008 */  addiu      $s2, $s2, 8
/* 9E608 8009DA08 02405021 */  addu       $t2, $s2, $zero
/* 9E60C 8009DA0C 26520008 */  addiu      $s2, $s2, 8
/* 9E610 8009DA10 080276B7 */  j          .L8009DADC
/* 9E614 8009DA14 3C05073F */   lui       $a1, 0x73f
/* 9E618 8009DA18 080276D5 */  j          .L8009DB54
/* 9E61C 8009DA1C 00131043 */   sra       $v0, $s3, 1
/* 9E620 8009DA20 080276D5 */  j          .L8009DB54
/* 9E624 8009DA24 00131043 */   sra       $v0, $s3, 1
/* 9E628 8009DA28 00131040 */  sll        $v0, $s3, 1
/* 9E62C 8009DA2C 00021083 */  sra        $v0, $v0, 2
/* 9E630 8009DA30 02401821 */  addu       $v1, $s2, $zero
/* 9E634 8009DA34 26520008 */  addiu      $s2, $s2, 8
/* 9E638 8009DA38 02402021 */  addu       $a0, $s2, $zero
/* 9E63C 8009DA3C 26520008 */  addiu      $s2, $s2, 8
/* 9E640 8009DA40 02402821 */  addu       $a1, $s2, $zero
/* 9E644 8009DA44 26520008 */  addiu      $s2, $s2, 8
/* 9E648 8009DA48 02408021 */  addu       $s0, $s2, $zero
/* 9E64C 8009DA4C 26520008 */  addiu      $s2, $s2, 8
/* 9E650 8009DA50 2446FFFF */  addiu      $a2, $v0, -1
/* 9E654 8009DA54 3C11FD10 */  lui        $s1, 0xfd10
/* 9E658 8009DA58 3C02F510 */  lui        $v0, 0xf510
/* 9E65C 8009DA5C 3C0F0700 */  lui        $t7, 0x700
/* 9E660 8009DA60 3C13E600 */  lui        $s3, 0xe600
/* 9E664 8009DA64 AC710000 */  sw         $s1, ($v1)
/* 9E668 8009DA68 AC770004 */  sw         $s7, 4($v1)
/* 9E66C 8009DA6C AC820000 */  sw         $v0, ($a0)
/* 9E670 8009DA70 3C02F300 */  lui        $v0, 0xf300
/* 9E674 8009DA74 28C30800 */  slti       $v1, $a2, 0x800
/* 9E678 8009DA78 AC8F0004 */  sw         $t7, 4($a0)
/* 9E67C 8009DA7C ACB30000 */  sw         $s3, ($a1)
/* 9E680 8009DA80 ACA00004 */  sw         $zero, 4($a1)
/* 9E684 8009DA84 14600002 */  bnez       $v1, .L8009DA90
/* 9E688 8009DA88 AE020000 */   sw        $v0, ($s0)
/* 9E68C 8009DA8C 240607FF */  addiu      $a2, $zero, 0x7ff
.L8009DA90:
/* 9E690 8009DA90 02405821 */  addu       $t3, $s2, $zero
/* 9E694 8009DA94 26520008 */  addiu      $s2, $s2, 8
/* 9E698 8009DA98 02407021 */  addu       $t6, $s2, $zero
/* 9E69C 8009DA9C 26520008 */  addiu      $s2, $s2, 8
/* 9E6A0 8009DAA0 3C03E300 */  lui        $v1, 0xe300
/* 9E6A4 8009DAA4 34631001 */  ori        $v1, $v1, 0x1001
/* 9E6A8 8009DAA8 02404821 */  addu       $t1, $s2, $zero
/* 9E6AC 8009DAAC 26520008 */  addiu      $s2, $s2, 8
/* 9E6B0 8009DAB0 02406021 */  addu       $t4, $s2, $zero
/* 9E6B4 8009DAB4 26520008 */  addiu      $s2, $s2, 8
/* 9E6B8 8009DAB8 02406821 */  addu       $t5, $s2, $zero
/* 9E6BC 8009DABC 26520008 */  addiu      $s2, $s2, 8
/* 9E6C0 8009DAC0 3C04F500 */  lui        $a0, 0xf500
/* 9E6C4 8009DAC4 34840100 */  ori        $a0, $a0, 0x100
/* 9E6C8 8009DAC8 02404021 */  addu       $t0, $s2, $zero
/* 9E6CC 8009DACC 26520008 */  addiu      $s2, $s2, 8
/* 9E6D0 8009DAD0 02405021 */  addu       $t2, $s2, $zero
/* 9E6D4 8009DAD4 26520008 */  addiu      $s2, $s2, 8
/* 9E6D8 8009DAD8 3C050703 */  lui        $a1, 0x703
.L8009DADC:
/* 9E6DC 8009DADC 34A5C000 */  ori        $a1, $a1, 0xc000
/* 9E6E0 8009DAE0 02403821 */  addu       $a3, $s2, $zero
/* 9E6E4 8009DAE4 26520008 */  addiu      $s2, $s2, 8
/* 9E6E8 8009DAE8 30C20FFF */  andi       $v0, $a2, 0xfff
/* 9E6EC 8009DAEC 00021300 */  sll        $v0, $v0, 0xc
/* 9E6F0 8009DAF0 004F1025 */  or         $v0, $v0, $t7
/* 9E6F4 8009DAF4 3C06E700 */  lui        $a2, 0xe700
/* 9E6F8 8009DAF8 AE020004 */  sw         $v0, 4($s0)
/* 9E6FC 8009DAFC 34028000 */  ori        $v0, $zero, 0x8000
/* 9E700 8009DB00 AD660000 */  sw         $a2, ($t3)
/* 9E704 8009DB04 AD600004 */  sw         $zero, 4($t3)
/* 9E708 8009DB08 ADC20004 */  sw         $v0, 4($t6)
/* 9E70C 8009DB0C 3C02E800 */  lui        $v0, 0xe800
/* 9E710 8009DB10 ADC30000 */  sw         $v1, ($t6)
/* 9E714 8009DB14 AD310000 */  sw         $s1, ($t1)
/* 9E718 8009DB18 AD3E0004 */  sw         $fp, 4($t1)
/* 9E71C 8009DB1C AD820000 */  sw         $v0, ($t4)
/* 9E720 8009DB20 3C02F000 */  lui        $v0, 0xf000
/* 9E724 8009DB24 AD800004 */  sw         $zero, 4($t4)
/* 9E728 8009DB28 ADA40000 */  sw         $a0, ($t5)
/* 9E72C 8009DB2C ADAF0004 */  sw         $t7, 4($t5)
/* 9E730 8009DB30 AD130000 */  sw         $s3, ($t0)
/* 9E734 8009DB34 AD000004 */  sw         $zero, 4($t0)
/* 9E738 8009DB38 AD420000 */  sw         $v0, ($t2)
/* 9E73C 8009DB3C AD450004 */  sw         $a1, 4($t2)
/* 9E740 8009DB40 ACE60000 */  sw         $a2, ($a3)
/* 9E744 8009DB44 08027702 */  j          .L8009DC08
/* 9E748 8009DB48 ACE00004 */   sw        $zero, 4($a3)
/* 9E74C 8009DB4C 00131040 */  sll        $v0, $s3, 1
/* 9E750 8009DB50 00021083 */  sra        $v0, $v0, 2
.L8009DB54:
/* 9E754 8009DB54 02401821 */  addu       $v1, $s2, $zero
/* 9E758 8009DB58 26520008 */  addiu      $s2, $s2, 8
/* 9E75C 8009DB5C 02402021 */  addu       $a0, $s2, $zero
/* 9E760 8009DB60 26520008 */  addiu      $s2, $s2, 8
/* 9E764 8009DB64 02402821 */  addu       $a1, $s2, $zero
/* 9E768 8009DB68 26520008 */  addiu      $s2, $s2, 8
/* 9E76C 8009DB6C 02404021 */  addu       $t0, $s2, $zero
/* 9E770 8009DB70 26520008 */  addiu      $s2, $s2, 8
/* 9E774 8009DB74 2447FFFF */  addiu      $a3, $v0, -1
/* 9E778 8009DB78 3C02FD10 */  lui        $v0, 0xfd10
/* 9E77C 8009DB7C AC620000 */  sw         $v0, ($v1)
/* 9E780 8009DB80 3C02F510 */  lui        $v0, 0xf510
.L8009DB84:
/* 9E784 8009DB84 3C090700 */  lui        $t1, 0x700
/* 9E788 8009DB88 AC770004 */  sw         $s7, 4($v1)
/* 9E78C 8009DB8C AC820000 */  sw         $v0, ($a0)
/* 9E790 8009DB90 3C02E600 */  lui        $v0, 0xe600
/* 9E794 8009DB94 AC890004 */  sw         $t1, 4($a0)
/* 9E798 8009DB98 ACA20000 */  sw         $v0, ($a1)
/* 9E79C 8009DB9C 3C02F300 */  lui        $v0, 0xf300
/* 9E7A0 8009DBA0 28E30800 */  slti       $v1, $a3, 0x800
/* 9E7A4 8009DBA4 ACA00004 */  sw         $zero, 4($a1)
/* 9E7A8 8009DBA8 14600002 */  bnez       $v1, .L8009DBB4
/* 9E7AC 8009DBAC AD020000 */   sw        $v0, ($t0)
/* 9E7B0 8009DBB0 240707FF */  addiu      $a3, $zero, 0x7ff
.L8009DBB4:
/* 9E7B4 8009DBB4 02402821 */  addu       $a1, $s2, $zero
/* 9E7B8 8009DBB8 26520008 */  addiu      $s2, $s2, 8
/* 9E7BC 8009DBBC 02403021 */  addu       $a2, $s2, $zero
/* 9E7C0 8009DBC0 26520008 */  addiu      $s2, $s2, 8
/* 9E7C4 8009DBC4 3C04E300 */  lui        $a0, 0xe300
/* 9E7C8 8009DBC8 34841001 */  ori        $a0, $a0, 0x1001
/* 9E7CC 8009DBCC 30E20FFF */  andi       $v0, $a3, 0xfff
/* 9E7D0 8009DBD0 00021300 */  sll        $v0, $v0, 0xc
/* 9E7D4 8009DBD4 00491025 */  or         $v0, $v0, $t1
/* 9E7D8 8009DBD8 3C03E700 */  lui        $v1, 0xe700
/* 9E7DC 8009DBDC AD020004 */  sw         $v0, 4($t0)
/* 9E7E0 8009DBE0 ACA30000 */  sw         $v1, ($a1)
/* 9E7E4 8009DBE4 ACA00004 */  sw         $zero, 4($a1)
/* 9E7E8 8009DBE8 ACC40000 */  sw         $a0, ($a2)
/* 9E7EC 8009DBEC 08027702 */  j          .L8009DC08
/* 9E7F0 8009DBF0 ACC00004 */   sw        $zero, 4($a2)
.L8009DBF4:
/* 9E7F4 8009DBF4 3C04800E */  lui        $a0, %hi(D_800E2E64)
/* 9E7F8 8009DBF8 24842E64 */  addiu      $a0, $a0, %lo(D_800E2E64)
/* 9E7FC 8009DBFC 3C05800E */  lui        $a1, %hi(D_800E2E84)
/* 9E800 8009DC00 0C025F2D */  jal        manualCrash
/* 9E804 8009DC04 24A52E84 */   addiu     $a1, $a1, %lo(D_800E2E84)
.L8009DC08:
/* 9E808 8009DC08 02401021 */  addu       $v0, $s2, $zero
/* 9E80C 8009DC0C 8FBF0034 */  lw         $ra, 0x34($sp)
/* 9E810 8009DC10 8FBE0030 */  lw         $fp, 0x30($sp)
/* 9E814 8009DC14 8FB7002C */  lw         $s7, 0x2c($sp)
/* 9E818 8009DC18 8FB60028 */  lw         $s6, 0x28($sp)
/* 9E81C 8009DC1C 8FB50024 */  lw         $s5, 0x24($sp)
/* 9E820 8009DC20 8FB40020 */  lw         $s4, 0x20($sp)
/* 9E824 8009DC24 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9E828 8009DC28 8FB20018 */  lw         $s2, 0x18($sp)
/* 9E82C 8009DC2C 8FB10014 */  lw         $s1, 0x14($sp)
/* 9E830 8009DC30 8FB00010 */  lw         $s0, 0x10($sp)
/* 9E834 8009DC34 03E00008 */  jr         $ra
/* 9E838 8009DC38 27BD0038 */   addiu     $sp, $sp, 0x38

glabel loadTextureImage
/* 9E83C 8009DC3C 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 9E840 8009DC40 AFB1002C */  sw         $s1, 0x2c($sp)
/* 9E844 8009DC44 00808821 */  addu       $s1, $a0, $zero
/* 9E848 8009DC48 AFBF004C */  sw         $ra, 0x4c($sp)
/* 9E84C 8009DC4C AFBE0048 */  sw         $fp, 0x48($sp)
/* 9E850 8009DC50 AFB70044 */  sw         $s7, 0x44($sp)
/* 9E854 8009DC54 AFB60040 */  sw         $s6, 0x40($sp)
/* 9E858 8009DC58 AFB5003C */  sw         $s5, 0x3c($sp)
/* 9E85C 8009DC5C AFB40038 */  sw         $s4, 0x38($sp)
/* 9E860 8009DC60 AFB30034 */  sw         $s3, 0x34($sp)
/* 9E864 8009DC64 AFB20030 */  sw         $s2, 0x30($sp)
/* 9E868 8009DC68 AFB00028 */  sw         $s0, 0x28($sp)
/* 9E86C 8009DC6C 10C00003 */  beqz       $a2, .L8009DC7C
/* 9E870 8009DC70 AFA50054 */   sw        $a1, 0x54($sp)
/* 9E874 8009DC74 08027720 */  j          .L8009DC80
/* 9E878 8009DC78 84C60002 */   lh        $a2, 2($a2)
.L8009DC7C:
/* 9E87C 8009DC7C 00003021 */  addu       $a2, $zero, $zero
.L8009DC80:
/* 9E880 8009DC80 02202021 */  addu       $a0, $s1, $zero
/* 9E884 8009DC84 26310008 */  addiu      $s1, $s1, 8
/* 9E888 8009DC88 3C02E700 */  lui        $v0, 0xe700
/* 9E88C 8009DC8C 02201821 */  addu       $v1, $s1, $zero
/* 9E890 8009DC90 AC820000 */  sw         $v0, ($a0)
/* 9E894 8009DC94 3C02E800 */  lui        $v0, 0xe800
/* 9E898 8009DC98 AC800004 */  sw         $zero, 4($a0)
/* 9E89C 8009DC9C AC620000 */  sw         $v0, ($v1)
/* 9E8A0 8009DCA0 AC600004 */  sw         $zero, 4($v1)
/* 9E8A4 8009DCA4 8FA30054 */  lw         $v1, 0x54($sp)
/* 9E8A8 8009DCA8 8C620010 */  lw         $v0, 0x10($v1)
/* 9E8AC 8009DCAC 94430002 */  lhu        $v1, 2($v0)
/* 9E8B0 8009DCB0 30620040 */  andi       $v0, $v1, 0x40
/* 9E8B4 8009DCB4 10400007 */  beqz       $v0, .L8009DCD4
/* 9E8B8 8009DCB8 26310008 */   addiu     $s1, $s1, 8
/* 9E8BC 8009DCBC 02201021 */  addu       $v0, $s1, $zero
/* 9E8C0 8009DCC0 26310008 */  addiu      $s1, $s1, 8
/* 9E8C4 8009DCC4 3C03E300 */  lui        $v1, 0xe300
/* 9E8C8 8009DCC8 34630D01 */  ori        $v1, $v1, 0xd01
/* 9E8CC 8009DCCC 0802773C */  j          .L8009DCF0
/* 9E8D0 8009DCD0 3C040004 */   lui       $a0, 4
.L8009DCD4:
/* 9E8D4 8009DCD4 30620080 */  andi       $v0, $v1, 0x80
/* 9E8D8 8009DCD8 10400008 */  beqz       $v0, .L8009DCFC
/* 9E8DC 8009DCDC 02201021 */   addu      $v0, $s1, $zero
/* 9E8E0 8009DCE0 26310008 */  addiu      $s1, $s1, 8
/* 9E8E4 8009DCE4 3C03E300 */  lui        $v1, 0xe300
/* 9E8E8 8009DCE8 34630D01 */  ori        $v1, $v1, 0xd01
/* 9E8EC 8009DCEC 3C040002 */  lui        $a0, 2
.L8009DCF0:
/* 9E8F0 8009DCF0 AC430000 */  sw         $v1, ($v0)
/* 9E8F4 8009DCF4 08027745 */  j          .L8009DD14
/* 9E8F8 8009DCF8 AC440004 */   sw        $a0, 4($v0)
.L8009DCFC:
/* 9E8FC 8009DCFC 02201821 */  addu       $v1, $s1, $zero
/* 9E900 8009DD00 26310008 */  addiu      $s1, $s1, 8
/* 9E904 8009DD04 3C02E300 */  lui        $v0, 0xe300
/* 9E908 8009DD08 34420D01 */  ori        $v0, $v0, 0xd01
/* 9E90C 8009DD0C AC620000 */  sw         $v0, ($v1)
/* 9E910 8009DD10 AC600004 */  sw         $zero, 4($v1)
.L8009DD14:
/* 9E914 8009DD14 8FA40054 */  lw         $a0, 0x54($sp)
/* 9E918 8009DD18 8C820010 */  lw         $v0, 0x10($a0)
/* 9E91C 8009DD1C 80430006 */  lb         $v1, 6($v0)
/* 9E920 8009DD20 18600008 */  blez       $v1, .L8009DD44
/* 9E924 8009DD24 02201021 */   addu      $v0, $s1, $zero
/* 9E928 8009DD28 26310008 */  addiu      $s1, $s1, 8
/* 9E92C 8009DD2C 3C03E300 */  lui        $v1, 0xe300
/* 9E930 8009DD30 34630F00 */  ori        $v1, $v1, 0xf00
/* 9E934 8009DD34 3C040001 */  lui        $a0, 1
/* 9E938 8009DD38 AC430000 */  sw         $v1, ($v0)
/* 9E93C 8009DD3C 08027757 */  j          .L8009DD5C
/* 9E940 8009DD40 AC440004 */   sw        $a0, 4($v0)
.L8009DD44:
/* 9E944 8009DD44 02201821 */  addu       $v1, $s1, $zero
/* 9E948 8009DD48 26310008 */  addiu      $s1, $s1, 8
/* 9E94C 8009DD4C 3C02E300 */  lui        $v0, 0xe300
/* 9E950 8009DD50 34420F00 */  ori        $v0, $v0, 0xf00
/* 9E954 8009DD54 AC620000 */  sw         $v0, ($v1)
/* 9E958 8009DD58 AC600004 */  sw         $zero, 4($v1)
.L8009DD5C:
/* 9E95C 8009DD5C 24070002 */  addiu      $a3, $zero, 2
/* 9E960 8009DD60 AFA70014 */  sw         $a3, 0x14($sp)
/* 9E964 8009DD64 30C21000 */  andi       $v0, $a2, 0x1000
/* 9E968 8009DD68 2C420001 */  sltiu      $v0, $v0, 1
/* 9E96C 8009DD6C 30C34000 */  andi       $v1, $a2, 0x4000
/* 9E970 8009DD70 10600002 */  beqz       $v1, .L8009DD7C
/* 9E974 8009DD74 0002B040 */   sll       $s6, $v0, 1
/* 9E978 8009DD78 36D60001 */  ori        $s6, $s6, 1
.L8009DD7C:
/* 9E97C 8009DD7C 30C22000 */  andi       $v0, $a2, 0x2000
/* 9E980 8009DD80 54400001 */  bnel       $v0, $zero, .L8009DD88
/* 9E984 8009DD84 AFA00014 */   sw        $zero, 0x14($sp)
.L8009DD88:
/* 9E988 8009DD88 30C28000 */  andi       $v0, $a2, 0x8000
/* 9E98C 8009DD8C 10400003 */  beqz       $v0, .L8009DD9C
/* 9E990 8009DD90 8FA20014 */   lw        $v0, 0x14($sp)
/* 9E994 8009DD94 34420001 */  ori        $v0, $v0, 1
/* 9E998 8009DD98 AFA20014 */  sw         $v0, 0x14($sp)
.L8009DD9C:
/* 9E99C 8009DD9C 8FA30054 */  lw         $v1, 0x54($sp)
/* 9E9A0 8009DDA0 8C620010 */  lw         $v0, 0x10($v1)
/* 9E9A4 8009DDA4 90440004 */  lbu        $a0, 4($v0)
/* 9E9A8 8009DDA8 0000F021 */  addu       $fp, $zero, $zero
/* 9E9AC 8009DDAC AFA40018 */  sw         $a0, 0x18($sp)
/* 9E9B0 8009DDB0 90470005 */  lbu        $a3, 5($v0)
/* 9E9B4 8009DDB4 0000B821 */  addu       $s7, $zero, $zero
/* 9E9B8 8009DDB8 AFA7001C */  sw         $a3, 0x1c($sp)
/* 9E9BC 8009DDBC 80420006 */  lb         $v0, 6($v0)
/* 9E9C0 8009DDC0 00808021 */  addu       $s0, $a0, $zero
/* 9E9C4 8009DDC4 AFA70020 */  sw         $a3, 0x20($sp)
/* 9E9C8 8009DDC8 0440010A */  bltz       $v0, .L8009E1F4
/* 9E9CC 8009DDCC AFA20010 */   sw        $v0, 0x10($sp)
.L8009DDD0:
/* 9E9D0 8009DDD0 0C0274DC */  jal        func_8009D370
/* 9E9D4 8009DDD4 02002021 */   addu      $a0, $s0, $zero
/* 9E9D8 8009DDD8 8FA40020 */  lw         $a0, 0x20($sp)
/* 9E9DC 8009DDDC 0C0274DC */  jal        func_8009D370
/* 9E9E0 8009DDE0 0040A021 */   addu      $s4, $v0, $zero
/* 9E9E4 8009DDE4 02002821 */  addu       $a1, $s0, $zero
/* 9E9E8 8009DDE8 8FA40018 */  lw         $a0, 0x18($sp)
/* 9E9EC 8009DDEC 0C0274EC */  jal        func_8009D3B0
/* 9E9F0 8009DDF0 00409821 */   addu      $s3, $v0, $zero
/* 9E9F4 8009DDF4 8FA4001C */  lw         $a0, 0x1c($sp)
/* 9E9F8 8009DDF8 8FA50020 */  lw         $a1, 0x20($sp)
/* 9E9FC 8009DDFC 0C0274EC */  jal        func_8009D3B0
/* 9EA00 8009DE00 0040A821 */   addu      $s5, $v0, $zero
/* 9EA04 8009DE04 8FA40054 */  lw         $a0, 0x54($sp)
/* 9EA08 8009DE08 8C830010 */  lw         $v1, 0x10($a0)
/* 9EA0C 8009DE0C 84630000 */  lh         $v1, ($v1)
/* 9EA10 8009DE10 00404021 */  addu       $t0, $v0, $zero
/* 9EA14 8009DE14 2C620009 */  sltiu      $v0, $v1, 9
/* 9EA18 8009DE18 104000D1 */  beqz       $v0, .L8009E160
/* 9EA1C 8009DE1C 3C02800E */   lui       $v0, %hi(D_800E2EC8)
/* 9EA20 8009DE20 24422EC8 */  addiu      $v0, $v0, %lo(D_800E2EC8)
/* 9EA24 8009DE24 00031880 */  sll        $v1, $v1, 2
/* 9EA28 8009DE28 00621821 */  addu       $v1, $v1, $v0
/* 9EA2C 8009DE2C 8C640000 */  lw         $a0, ($v1)
/* 9EA30 8009DE30 00800008 */  jr         $a0
/* 9EA34 8009DE34 00000000 */   nop
/* 9EA38 8009DE38 2A020002 */  slti       $v0, $s0, 2
/* 9EA3C 8009DE3C 10400003 */  beqz       $v0, .L8009DE4C
/* 9EA40 8009DE40 24020002 */   addiu     $v0, $zero, 2
/* 9EA44 8009DE44 08027797 */  j          .L8009DE5C
/* 9EA48 8009DE48 00501023 */   subu      $v0, $v0, $s0
.L8009DE4C:
/* 9EA4C 8009DE4C 32030001 */  andi       $v1, $s0, 1
/* 9EA50 8009DE50 14600002 */  bnez       $v1, .L8009DE5C
/* 9EA54 8009DE54 00431023 */   subu      $v0, $v0, $v1
/* 9EA58 8009DE58 00001021 */  addu       $v0, $zero, $zero
.L8009DE5C:
/* 9EA5C 8009DE5C 02021021 */  addu       $v0, $s0, $v0
/* 9EA60 8009DE60 00029083 */  sra        $s2, $v0, 2
/* 9EA64 8009DE64 02203021 */  addu       $a2, $s1, $zero
/* 9EA68 8009DE68 26310008 */  addiu      $s1, $s1, 8
/* 9EA6C 8009DE6C 32E40007 */  andi       $a0, $s7, 7
/* 9EA70 8009DE70 00803821 */  addu       $a3, $a0, $zero
/* 9EA74 8009DE74 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EA78 8009DE78 00052A40 */  sll        $a1, $a1, 9
/* 9EA7C 8009DE7C 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EA80 8009DE80 08027841 */  j          .L8009E104
/* 9EA84 8009DE84 3C03F518 */   lui       $v1, 0xf518
/* 9EA88 8009DE88 2A020004 */  slti       $v0, $s0, 4
/* 9EA8C 8009DE8C 10400003 */  beqz       $v0, .L8009DE9C
/* 9EA90 8009DE90 24020004 */   addiu     $v0, $zero, 4
/* 9EA94 8009DE94 080277AB */  j          .L8009DEAC
/* 9EA98 8009DE98 00501023 */   subu      $v0, $v0, $s0
.L8009DE9C:
/* 9EA9C 8009DE9C 32030003 */  andi       $v1, $s0, 3
/* 9EAA0 8009DEA0 14600002 */  bnez       $v1, .L8009DEAC
/* 9EAA4 8009DEA4 00431023 */   subu      $v0, $v0, $v1
/* 9EAA8 8009DEA8 00001021 */  addu       $v0, $zero, $zero
.L8009DEAC:
/* 9EAAC 8009DEAC 02021021 */  addu       $v0, $s0, $v0
/* 9EAB0 8009DEB0 00029083 */  sra        $s2, $v0, 2
/* 9EAB4 8009DEB4 02203021 */  addu       $a2, $s1, $zero
/* 9EAB8 8009DEB8 26310008 */  addiu      $s1, $s1, 8
/* 9EABC 8009DEBC 32E40007 */  andi       $a0, $s7, 7
/* 9EAC0 8009DEC0 00803821 */  addu       $a3, $a0, $zero
/* 9EAC4 8009DEC4 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EAC8 8009DEC8 00052A40 */  sll        $a1, $a1, 9
/* 9EACC 8009DECC 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EAD0 8009DED0 08027841 */  j          .L8009E104
/* 9EAD4 8009DED4 3C03F510 */   lui       $v1, 0xf510
/* 9EAD8 8009DED8 2A020004 */  slti       $v0, $s0, 4
/* 9EADC 8009DEDC 10400003 */  beqz       $v0, .L8009DEEC
/* 9EAE0 8009DEE0 24020004 */   addiu     $v0, $zero, 4
/* 9EAE4 8009DEE4 080277BF */  j          .L8009DEFC
/* 9EAE8 8009DEE8 00501023 */   subu      $v0, $v0, $s0
.L8009DEEC:
/* 9EAEC 8009DEEC 32030003 */  andi       $v1, $s0, 3
/* 9EAF0 8009DEF0 14600002 */  bnez       $v1, .L8009DEFC
/* 9EAF4 8009DEF4 00431023 */   subu      $v0, $v0, $v1
/* 9EAF8 8009DEF8 00001021 */  addu       $v0, $zero, $zero
.L8009DEFC:
/* 9EAFC 8009DEFC 02021021 */  addu       $v0, $s0, $v0
/* 9EB00 8009DF00 00029083 */  sra        $s2, $v0, 2
/* 9EB04 8009DF04 02203021 */  addu       $a2, $s1, $zero
/* 9EB08 8009DF08 26310008 */  addiu      $s1, $s1, 8
/* 9EB0C 8009DF0C 32E40007 */  andi       $a0, $s7, 7
/* 9EB10 8009DF10 00803821 */  addu       $a3, $a0, $zero
/* 9EB14 8009DF14 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EB18 8009DF18 00052A40 */  sll        $a1, $a1, 9
/* 9EB1C 8009DF1C 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EB20 8009DF20 08027841 */  j          .L8009E104
/* 9EB24 8009DF24 3C03F570 */   lui       $v1, 0xf570
/* 9EB28 8009DF28 2A020008 */  slti       $v0, $s0, 8
/* 9EB2C 8009DF2C 10400003 */  beqz       $v0, .L8009DF3C
/* 9EB30 8009DF30 24020008 */   addiu     $v0, $zero, 8
/* 9EB34 8009DF34 080277D3 */  j          .L8009DF4C
/* 9EB38 8009DF38 00501023 */   subu      $v0, $v0, $s0
.L8009DF3C:
/* 9EB3C 8009DF3C 32030007 */  andi       $v1, $s0, 7
/* 9EB40 8009DF40 14600002 */  bnez       $v1, .L8009DF4C
/* 9EB44 8009DF44 00431023 */   subu      $v0, $v0, $v1
/* 9EB48 8009DF48 00001021 */  addu       $v0, $zero, $zero
.L8009DF4C:
/* 9EB4C 8009DF4C 02021021 */  addu       $v0, $s0, $v0
/* 9EB50 8009DF50 000290C3 */  sra        $s2, $v0, 3
/* 9EB54 8009DF54 02203021 */  addu       $a2, $s1, $zero
/* 9EB58 8009DF58 26310008 */  addiu      $s1, $s1, 8
/* 9EB5C 8009DF5C 32E40007 */  andi       $a0, $s7, 7
/* 9EB60 8009DF60 00803821 */  addu       $a3, $a0, $zero
/* 9EB64 8009DF64 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EB68 8009DF68 00052A40 */  sll        $a1, $a1, 9
/* 9EB6C 8009DF6C 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EB70 8009DF70 08027841 */  j          .L8009E104
/* 9EB74 8009DF74 3C03F548 */   lui       $v1, 0xf548
/* 9EB78 8009DF78 2A020008 */  slti       $v0, $s0, 8
/* 9EB7C 8009DF7C 10400003 */  beqz       $v0, .L8009DF8C
/* 9EB80 8009DF80 24020008 */   addiu     $v0, $zero, 8
/* 9EB84 8009DF84 080277E7 */  j          .L8009DF9C
/* 9EB88 8009DF88 00501023 */   subu      $v0, $v0, $s0
.L8009DF8C:
/* 9EB8C 8009DF8C 32030007 */  andi       $v1, $s0, 7
/* 9EB90 8009DF90 14600002 */  bnez       $v1, .L8009DF9C
/* 9EB94 8009DF94 00431023 */   subu      $v0, $v0, $v1
/* 9EB98 8009DF98 00001021 */  addu       $v0, $zero, $zero
.L8009DF9C:
/* 9EB9C 8009DF9C 02021021 */  addu       $v0, $s0, $v0
/* 9EBA0 8009DFA0 000290C3 */  sra        $s2, $v0, 3
/* 9EBA4 8009DFA4 02203021 */  addu       $a2, $s1, $zero
/* 9EBA8 8009DFA8 26310008 */  addiu      $s1, $s1, 8
/* 9EBAC 8009DFAC 32E40007 */  andi       $a0, $s7, 7
/* 9EBB0 8009DFB0 00803821 */  addu       $a3, $a0, $zero
/* 9EBB4 8009DFB4 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EBB8 8009DFB8 00052A40 */  sll        $a1, $a1, 9
/* 9EBBC 8009DFBC 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EBC0 8009DFC0 08027841 */  j          .L8009E104
/* 9EBC4 8009DFC4 3C03F568 */   lui       $v1, 0xf568
/* 9EBC8 8009DFC8 2A020008 */  slti       $v0, $s0, 8
/* 9EBCC 8009DFCC 10400003 */  beqz       $v0, .L8009DFDC
/* 9EBD0 8009DFD0 24020008 */   addiu     $v0, $zero, 8
/* 9EBD4 8009DFD4 080277FB */  j          .L8009DFEC
/* 9EBD8 8009DFD8 00501023 */   subu      $v0, $v0, $s0
.L8009DFDC:
/* 9EBDC 8009DFDC 32030007 */  andi       $v1, $s0, 7
/* 9EBE0 8009DFE0 14600002 */  bnez       $v1, .L8009DFEC
/* 9EBE4 8009DFE4 00431023 */   subu      $v0, $v0, $v1
/* 9EBE8 8009DFE8 00001021 */  addu       $v0, $zero, $zero
.L8009DFEC:
/* 9EBEC 8009DFEC 02021021 */  addu       $v0, $s0, $v0
/* 9EBF0 8009DFF0 000290C3 */  sra        $s2, $v0, 3
/* 9EBF4 8009DFF4 02203021 */  addu       $a2, $s1, $zero
/* 9EBF8 8009DFF8 26310008 */  addiu      $s1, $s1, 8
/* 9EBFC 8009DFFC 32E40007 */  andi       $a0, $s7, 7
/* 9EC00 8009E000 00803821 */  addu       $a3, $a0, $zero
/* 9EC04 8009E004 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EC08 8009E008 00052A40 */  sll        $a1, $a1, 9
/* 9EC0C 8009E00C 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EC10 8009E010 08027841 */  j          .L8009E104
/* 9EC14 8009E014 3C03F588 */   lui       $v1, 0xf588
/* 9EC18 8009E018 2A020010 */  slti       $v0, $s0, 0x10
/* 9EC1C 8009E01C 10400003 */  beqz       $v0, .L8009E02C
/* 9EC20 8009E020 24020010 */   addiu     $v0, $zero, 0x10
/* 9EC24 8009E024 0802780F */  j          .L8009E03C
/* 9EC28 8009E028 00501023 */   subu      $v0, $v0, $s0
.L8009E02C:
/* 9EC2C 8009E02C 3203000F */  andi       $v1, $s0, 0xf
/* 9EC30 8009E030 14600002 */  bnez       $v1, .L8009E03C
/* 9EC34 8009E034 00431023 */   subu      $v0, $v0, $v1
/* 9EC38 8009E038 00001021 */  addu       $v0, $zero, $zero
.L8009E03C:
/* 9EC3C 8009E03C 02021021 */  addu       $v0, $s0, $v0
/* 9EC40 8009E040 00029103 */  sra        $s2, $v0, 4
/* 9EC44 8009E044 02203021 */  addu       $a2, $s1, $zero
/* 9EC48 8009E048 26310008 */  addiu      $s1, $s1, 8
/* 9EC4C 8009E04C 32E40007 */  andi       $a0, $s7, 7
/* 9EC50 8009E050 00803821 */  addu       $a3, $a0, $zero
/* 9EC54 8009E054 324501FF */  andi       $a1, $s2, 0x1ff
/* 9EC58 8009E058 00052A40 */  sll        $a1, $a1, 9
/* 9EC5C 8009E05C 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9EC60 8009E060 08027841 */  j          .L8009E104
/* 9EC64 8009E064 3C03F540 */   lui       $v1, 0xf540
/* 9EC68 8009E068 2A020010 */  slti       $v0, $s0, 0x10
/* 9EC6C 8009E06C 10400003 */  beqz       $v0, .L8009E07C
/* 9EC70 8009E070 24020010 */   addiu     $v0, $zero, 0x10
/* 9EC74 8009E074 08027823 */  j          .L8009E08C
/* 9EC78 8009E078 00501023 */   subu      $v0, $v0, $s0
.L8009E07C:
/* 9EC7C 8009E07C 3203000F */  andi       $v1, $s0, 0xf
/* 9EC80 8009E080 14600002 */  bnez       $v1, .L8009E08C
/* 9EC84 8009E084 00431023 */   subu      $v0, $v0, $v1
/* 9EC88 8009E088 00001021 */  addu       $v0, $zero, $zero
.L8009E08C:
/* 9EC8C 8009E08C 02021021 */  addu       $v0, $s0, $v0
/* 9EC90 8009E090 00029103 */  sra        $s2, $v0, 4
/* 9EC94 8009E094 02203021 */  addu       $a2, $s1, $zero
/* 9EC98 8009E098 26310008 */  addiu      $s1, $s1, 8
/* 9EC9C 8009E09C 32E40007 */  andi       $a0, $s7, 7
/* 9ECA0 8009E0A0 00803821 */  addu       $a3, $a0, $zero
/* 9ECA4 8009E0A4 324501FF */  andi       $a1, $s2, 0x1ff
/* 9ECA8 8009E0A8 00052A40 */  sll        $a1, $a1, 9
/* 9ECAC 8009E0AC 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9ECB0 8009E0B0 08027841 */  j          .L8009E104
/* 9ECB4 8009E0B4 3C03F560 */   lui       $v1, 0xf560
/* 9ECB8 8009E0B8 2A020010 */  slti       $v0, $s0, 0x10
/* 9ECBC 8009E0BC 10400003 */  beqz       $v0, .L8009E0CC
/* 9ECC0 8009E0C0 24020010 */   addiu     $v0, $zero, 0x10
/* 9ECC4 8009E0C4 08027837 */  j          .L8009E0DC
/* 9ECC8 8009E0C8 00501023 */   subu      $v0, $v0, $s0
.L8009E0CC:
/* 9ECCC 8009E0CC 3203000F */  andi       $v1, $s0, 0xf
/* 9ECD0 8009E0D0 14600002 */  bnez       $v1, .L8009E0DC
/* 9ECD4 8009E0D4 00431023 */   subu      $v0, $v0, $v1
/* 9ECD8 8009E0D8 00001021 */  addu       $v0, $zero, $zero
.L8009E0DC:
/* 9ECDC 8009E0DC 02021021 */  addu       $v0, $s0, $v0
/* 9ECE0 8009E0E0 00029103 */  sra        $s2, $v0, 4
/* 9ECE4 8009E0E4 02203021 */  addu       $a2, $s1, $zero
/* 9ECE8 8009E0E8 26310008 */  addiu      $s1, $s1, 8
/* 9ECEC 8009E0EC 32E40007 */  andi       $a0, $s7, 7
/* 9ECF0 8009E0F0 00803821 */  addu       $a3, $a0, $zero
/* 9ECF4 8009E0F4 324501FF */  andi       $a1, $s2, 0x1ff
/* 9ECF8 8009E0F8 00052A40 */  sll        $a1, $a1, 9
/* 9ECFC 8009E0FC 33C201FF */  andi       $v0, $fp, 0x1ff
/* 9ED00 8009E100 3C03F580 */  lui        $v1, 0xf580
.L8009E104:
/* 9ED04 8009E104 00431025 */  or         $v0, $v0, $v1
/* 9ED08 8009E108 00A22825 */  or         $a1, $a1, $v0
/* 9ED0C 8009E10C ACC50000 */  sw         $a1, ($a2)
/* 9ED10 8009E110 8FA30014 */  lw         $v1, 0x14($sp)
/* 9ED14 8009E114 00042600 */  sll        $a0, $a0, 0x18
/* 9ED18 8009E118 30620003 */  andi       $v0, $v1, 3
/* 9ED1C 8009E11C 00021480 */  sll        $v0, $v0, 0x12
/* 9ED20 8009E120 00822025 */  or         $a0, $a0, $v0
/* 9ED24 8009E124 3263000F */  andi       $v1, $s3, 0xf
/* 9ED28 8009E128 00031B80 */  sll        $v1, $v1, 0xe
/* 9ED2C 8009E12C 00832025 */  or         $a0, $a0, $v1
/* 9ED30 8009E130 3102000F */  andi       $v0, $t0, 0xf
/* 9ED34 8009E134 00021280 */  sll        $v0, $v0, 0xa
/* 9ED38 8009E138 00822025 */  or         $a0, $a0, $v0
/* 9ED3C 8009E13C 00161A00 */  sll        $v1, $s6, 8
/* 9ED40 8009E140 00832025 */  or         $a0, $a0, $v1
/* 9ED44 8009E144 3282000F */  andi       $v0, $s4, 0xf
/* 9ED48 8009E148 00021100 */  sll        $v0, $v0, 4
/* 9ED4C 8009E14C 00822025 */  or         $a0, $a0, $v0
/* 9ED50 8009E150 32A3000F */  andi       $v1, $s5, 0xf
/* 9ED54 8009E154 00832025 */  or         $a0, $a0, $v1
/* 9ED58 8009E158 0802785F */  j          .L8009E17C
/* 9ED5C 8009E15C ACC40004 */   sw        $a0, 4($a2)
.L8009E160:
/* 9ED60 8009E160 00009021 */  addu       $s2, $zero, $zero
/* 9ED64 8009E164 3C04800E */  lui        $a0, %hi(D_800E2E64)
/* 9ED68 8009E168 24842E64 */  addiu      $a0, $a0, %lo(D_800E2E64)
/* 9ED6C 8009E16C 3C05800E */  lui        $a1, %hi(D_800E2E84)
/* 9ED70 8009E170 0C025F2D */  jal        manualCrash
/* 9ED74 8009E174 24A52E84 */   addiu     $a1, $a1, %lo(D_800E2E84)
/* 9ED78 8009E178 32E70007 */  andi       $a3, $s7, 7
.L8009E17C:
/* 9ED7C 8009E17C 02203021 */  addu       $a2, $s1, $zero
/* 9ED80 8009E180 26310008 */  addiu      $s1, $s1, 8
/* 9ED84 8009E184 02002021 */  addu       $a0, $s0, $zero
/* 9ED88 8009E188 3C02F200 */  lui        $v0, 0xf200
/* 9ED8C 8009E18C 00072E00 */  sll        $a1, $a3, 0x18
/* 9ED90 8009E190 ACC20000 */  sw         $v0, ($a2)
/* 9ED94 8009E194 2602FFFF */  addiu      $v0, $s0, -1
/* 9ED98 8009E198 00021080 */  sll        $v0, $v0, 2
/* 9ED9C 8009E19C 30420FFF */  andi       $v0, $v0, 0xfff
/* 9EDA0 8009E1A0 00021300 */  sll        $v0, $v0, 0xc
/* 9EDA4 8009E1A4 8FA70020 */  lw         $a3, 0x20($sp)
/* 9EDA8 8009E1A8 00A22825 */  or         $a1, $a1, $v0
/* 9EDAC 8009E1AC 24E3FFFF */  addiu      $v1, $a3, -1
/* 9EDB0 8009E1B0 02470018 */  mult       $s2, $a3
/* 9EDB4 8009E1B4 00031880 */  sll        $v1, $v1, 2
/* 9EDB8 8009E1B8 30630FFF */  andi       $v1, $v1, 0xfff
/* 9EDBC 8009E1BC 00A32825 */  or         $a1, $a1, $v1
/* 9EDC0 8009E1C0 ACC50004 */  sw         $a1, 4($a2)
/* 9EDC4 8009E1C4 00001012 */  mflo       $v0
/* 9EDC8 8009E1C8 0C0274D4 */  jal        func_8009D350
/* 9EDCC 8009E1CC 03C2F021 */   addu      $fp, $fp, $v0
/* 9EDD0 8009E1D0 8FA40020 */  lw         $a0, 0x20($sp)
/* 9EDD4 8009E1D4 0C0274D4 */  jal        func_8009D350
/* 9EDD8 8009E1D8 00408021 */   addu      $s0, $v0, $zero
/* 9EDDC 8009E1DC 8FA30010 */  lw         $v1, 0x10($sp)
/* 9EDE0 8009E1E0 26F70001 */  addiu      $s7, $s7, 1
/* 9EDE4 8009E1E4 AFA20020 */  sw         $v0, 0x20($sp)
/* 9EDE8 8009E1E8 0077102A */  slt        $v0, $v1, $s7
/* 9EDEC 8009E1EC 1040FEF8 */  beqz       $v0, .L8009DDD0
/* 9EDF0 8009E1F0 00000000 */   nop
.L8009E1F4:
/* 9EDF4 8009E1F4 02201021 */  addu       $v0, $s1, $zero
/* 9EDF8 8009E1F8 8FBF004C */  lw         $ra, 0x4c($sp)
/* 9EDFC 8009E1FC 8FBE0048 */  lw         $fp, 0x48($sp)
/* 9EE00 8009E200 8FB70044 */  lw         $s7, 0x44($sp)
/* 9EE04 8009E204 8FB60040 */  lw         $s6, 0x40($sp)
/* 9EE08 8009E208 8FB5003C */  lw         $s5, 0x3c($sp)
/* 9EE0C 8009E20C 8FB40038 */  lw         $s4, 0x38($sp)
/* 9EE10 8009E210 8FB30034 */  lw         $s3, 0x34($sp)
/* 9EE14 8009E214 8FB20030 */  lw         $s2, 0x30($sp)
/* 9EE18 8009E218 8FB1002C */  lw         $s1, 0x2c($sp)
/* 9EE1C 8009E21C 8FB00028 */  lw         $s0, 0x28($sp)
/* 9EE20 8009E220 03E00008 */  jr         $ra
/* 9EE24 8009E224 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_8009E228
/* 9EE28 8009E228 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9EE2C 8009E22C AFB10014 */  sw         $s1, 0x14($sp)
/* 9EE30 8009E230 00A08821 */  addu       $s1, $a1, $zero
/* 9EE34 8009E234 AFBF0024 */  sw         $ra, 0x24($sp)
/* 9EE38 8009E238 AFB40020 */  sw         $s4, 0x20($sp)
/* 9EE3C 8009E23C AFB3001C */  sw         $s3, 0x1c($sp)
/* 9EE40 8009E240 AFB20018 */  sw         $s2, 0x18($sp)
/* 9EE44 8009E244 AFB00010 */  sw         $s0, 0x10($sp)
/* 9EE48 8009E248 8E220058 */  lw         $v0, 0x58($s1)
/* 9EE4C 8009E24C 8C43003C */  lw         $v1, 0x3c($v0)
/* 9EE50 8009E250 10600009 */  beqz       $v1, .L8009E278
/* 9EE54 8009E254 00809821 */   addu      $s3, $a0, $zero
/* 9EE58 8009E258 3C02DB06 */  lui        $v0, 0xdb06
/* 9EE5C 8009E25C 34420028 */  ori        $v0, $v0, 0x28
/* 9EE60 8009E260 02608021 */  addu       $s0, $s3, $zero
/* 9EE64 8009E264 AE020000 */  sw         $v0, ($s0)
/* 9EE68 8009E268 8E230058 */  lw         $v1, 0x58($s1)
/* 9EE6C 8009E26C 00061080 */  sll        $v0, $a2, 2
/* 9EE70 8009E270 080278A3 */  j          .L8009E28C
/* 9EE74 8009E274 00621821 */   addu      $v1, $v1, $v0
.L8009E278:
/* 9EE78 8009E278 3C02DB06 */  lui        $v0, 0xdb06
/* 9EE7C 8009E27C 34420028 */  ori        $v0, $v0, 0x28
/* 9EE80 8009E280 02608021 */  addu       $s0, $s3, $zero
/* 9EE84 8009E284 AE020000 */  sw         $v0, ($s0)
/* 9EE88 8009E288 8E230058 */  lw         $v1, 0x58($s1)
.L8009E28C:
/* 9EE8C 8009E28C 8C640034 */  lw         $a0, 0x34($v1)
/* 9EE90 8009E290 0C034888 */  jal        osVirtualToPhysical
/* 9EE94 8009E294 26730008 */   addiu     $s3, $s3, 8
/* 9EE98 8009E298 AE020004 */  sw         $v0, 4($s0)
/* 9EE9C 8009E29C 8E220058 */  lw         $v0, 0x58($s1)
/* 9EEA0 8009E2A0 8C510004 */  lw         $s1, 4($v0)
/* 9EEA4 8009E2A4 1220000B */  beqz       $s1, .L8009E2D4
/* 9EEA8 8009E2A8 8C52002C */   lw        $s2, 0x2c($v0)
/* 9EEAC 8009E2AC 3C14DE00 */  lui        $s4, 0xde00
.L8009E2B0:
/* 9EEB0 8009E2B0 02608021 */  addu       $s0, $s3, $zero
/* 9EEB4 8009E2B4 26730008 */  addiu      $s3, $s3, 8
/* 9EEB8 8009E2B8 2631FFFF */  addiu      $s1, $s1, -1
/* 9EEBC 8009E2BC AE140000 */  sw         $s4, ($s0)
/* 9EEC0 8009E2C0 8E440000 */  lw         $a0, ($s2)
/* 9EEC4 8009E2C4 0C034888 */  jal        osVirtualToPhysical
/* 9EEC8 8009E2C8 26520004 */   addiu     $s2, $s2, 4
/* 9EECC 8009E2CC 1620FFF8 */  bnez       $s1, .L8009E2B0
/* 9EED0 8009E2D0 AE020004 */   sw        $v0, 4($s0)
.L8009E2D4:
/* 9EED4 8009E2D4 02601021 */  addu       $v0, $s3, $zero
/* 9EED8 8009E2D8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 9EEDC 8009E2DC 8FB40020 */  lw         $s4, 0x20($sp)
/* 9EEE0 8009E2E0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9EEE4 8009E2E4 8FB20018 */  lw         $s2, 0x18($sp)
/* 9EEE8 8009E2E8 8FB10014 */  lw         $s1, 0x14($sp)
/* 9EEEC 8009E2EC 8FB00010 */  lw         $s0, 0x10($sp)
/* 9EEF0 8009E2F0 03E00008 */  jr         $ra
/* 9EEF4 8009E2F4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8009E2F8
/* 9EEF8 8009E2F8 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 9EEFC 8009E2FC AFB1001C */  sw         $s1, 0x1c($sp)
/* 9EF00 8009E300 00808821 */  addu       $s1, $a0, $zero
/* 9EF04 8009E304 AFBF0020 */  sw         $ra, 0x20($sp)
/* 9EF08 8009E308 AFB00018 */  sw         $s0, 0x18($sp)
/* 9EF0C 8009E30C F7BE0050 */  sdc1       $f30, 0x50($sp)
/* 9EF10 8009E310 F7BC0048 */  sdc1       $f28, 0x48($sp)
/* 9EF14 8009E314 F7BA0040 */  sdc1       $f26, 0x40($sp)
/* 9EF18 8009E318 F7B80038 */  sdc1       $f24, 0x38($sp)
/* 9EF1C 8009E31C F7B60030 */  sdc1       $f22, 0x30($sp)
/* 9EF20 8009E320 F7B40028 */  sdc1       $f20, 0x28($sp)
/* 9EF24 8009E324 C6360010 */  lwc1       $f22, 0x10($s1)
/* 9EF28 8009E328 3C01800E */  lui        $at, %hi(D_800E2EEC)
/* 9EF2C 8009E32C C4202EEC */  lwc1       $f0, %lo(D_800E2EEC)($at)
/* 9EF30 8009E330 4600B582 */  mul.s      $f22, $f22, $f0
/* 9EF34 8009E334 C6340014 */  lwc1       $f20, 0x14($s1)
/* 9EF38 8009E338 4600A502 */  mul.s      $f20, $f20, $f0
/* 9EF3C 8009E33C C6380018 */  lwc1       $f24, 0x18($s1)
/* 9EF40 8009E340 00A08021 */  addu       $s0, $a1, $zero
/* 9EF44 8009E344 4600C602 */  mul.s      $f24, $f24, $f0
/* 9EF48 8009E348 0C03328C */  jal        __sinf
/* 9EF4C 8009E34C 4600A306 */   mov.s     $f12, $f20
/* 9EF50 8009E350 4600A306 */  mov.s      $f12, $f20
/* 9EF54 8009E354 0C02FB50 */  jal        __cosf
/* 9EF58 8009E358 46000686 */   mov.s     $f26, $f0
/* 9EF5C 8009E35C 4600B306 */  mov.s      $f12, $f22
/* 9EF60 8009E360 0C03328C */  jal        __sinf
/* 9EF64 8009E364 E7A00010 */   swc1      $f0, 0x10($sp)
/* 9EF68 8009E368 4600B306 */  mov.s      $f12, $f22
/* 9EF6C 8009E36C 0C02FB50 */  jal        __cosf
/* 9EF70 8009E370 46000506 */   mov.s     $f20, $f0
/* 9EF74 8009E374 4600C306 */  mov.s      $f12, $f24
/* 9EF78 8009E378 0C03328C */  jal        __sinf
/* 9EF7C 8009E37C 46000586 */   mov.s     $f22, $f0
/* 9EF80 8009E380 4600C306 */  mov.s      $f12, $f24
/* 9EF84 8009E384 0C02FB50 */  jal        __cosf
/* 9EF88 8009E388 46000706 */   mov.s     $f28, $f0
/* 9EF8C 8009E38C 461AA082 */  mul.s      $f2, $f20, $f26
/* 9EF90 8009E390 00000000 */  nop
/* 9EF94 8009E394 4600B602 */  mul.s      $f24, $f22, $f0
/* 9EF98 8009E398 4600B187 */  neg.s      $f6, $f22
/* 9EF9C 8009E39C 461C3182 */  mul.s      $f6, $f6, $f28
/* 9EFA0 8009E3A0 00000000 */  nop
/* 9EFA4 8009E3A4 461C1102 */  mul.s      $f4, $f2, $f28
/* 9EFA8 8009E3A8 00000000 */  nop
/* 9EFAC 8009E3AC 46001082 */  mul.s      $f2, $f2, $f0
/* 9EFB0 8009E3B0 4604C600 */  add.s      $f24, $f24, $f4
/* 9EFB4 8009E3B4 461AB102 */  mul.s      $f4, $f22, $f26
/* 9EFB8 8009E3B8 C62A0030 */  lwc1       $f10, 0x30($s1)
/* 9EFBC 8009E3BC 4600D687 */  neg.s      $f26, $f26
/* 9EFC0 8009E3C0 460AD682 */  mul.s      $f26, $f26, $f10
/* 9EFC4 8009E3C4 46023180 */  add.s      $f6, $f6, $f2
/* 9EFC8 8009E3C8 C7A20010 */  lwc1       $f2, 0x10($sp)
/* 9EFCC 8009E3CC 4602A482 */  mul.s      $f18, $f20, $f2
/* 9EFD0 8009E3D0 00000000 */  nop
/* 9EFD4 8009E3D4 461C1382 */  mul.s      $f14, $f2, $f28
/* 9EFD8 8009E3D8 00000000 */  nop
/* 9EFDC 8009E3DC 46001402 */  mul.s      $f16, $f2, $f0
/* 9EFE0 8009E3E0 4600A087 */  neg.s      $f2, $f20
/* 9EFE4 8009E3E4 46001082 */  mul.s      $f2, $f2, $f0
/* 9EFE8 8009E3E8 00000000 */  nop
/* 9EFEC 8009E3EC 461CA502 */  mul.s      $f20, $f20, $f28
/* 9EFF0 8009E3F0 C62C0028 */  lwc1       $f12, 0x28($s1)
/* 9EFF4 8009E3F4 460CC602 */  mul.s      $f24, $f24, $f12
/* 9EFF8 8009E3F8 C63E002C */  lwc1       $f30, 0x2c($s1)
/* 9EFFC 8009E3FC 461E3182 */  mul.s      $f6, $f6, $f30
/* 9F000 8009E400 00000000 */  nop
/* 9F004 8009E404 461C2202 */  mul.s      $f8, $f4, $f28
/* 9F008 8009E408 00000000 */  nop
/* 9F00C 8009E40C 46002102 */  mul.s      $f4, $f4, $f0
/* 9F010 8009E410 00000000 */  nop
/* 9F014 8009E414 460A9482 */  mul.s      $f18, $f18, $f10
/* 9F018 8009E418 00000000 */  nop
/* 9F01C 8009E41C 460C7382 */  mul.s      $f14, $f14, $f12
/* 9F020 8009E420 00000000 */  nop
/* 9F024 8009E424 461E8402 */  mul.s      $f16, $f16, $f30
/* 9F028 8009E428 46081080 */  add.s      $f2, $f2, $f8
/* 9F02C 8009E42C C7A80010 */  lwc1       $f8, 0x10($sp)
/* 9F030 8009E430 4608B582 */  mul.s      $f22, $f22, $f8
/* 9F034 8009E434 8FBF0020 */  lw         $ra, 0x20($sp)
/* 9F038 8009E438 D7BC0048 */  ldc1       $f28, 0x48($sp)
/* 9F03C 8009E43C 4604A500 */  add.s      $f20, $f20, $f4
/* 9F040 8009E440 E61A0024 */  swc1       $f26, 0x24($s0)
/* 9F044 8009E444 D7BA0040 */  ldc1       $f26, 0x40($sp)
/* 9F048 8009E448 461EA502 */  mul.s      $f20, $f20, $f30
/* 9F04C 8009E44C E6180000 */  swc1       $f24, ($s0)
/* 9F050 8009E450 D7B80038 */  ldc1       $f24, 0x38($sp)
/* 9F054 8009E454 D7BE0050 */  ldc1       $f30, 0x50($sp)
/* 9F058 8009E458 460C1082 */  mul.s      $f2, $f2, $f12
/* 9F05C 8009E45C E6060010 */  swc1       $f6, 0x10($s0)
/* 9F060 8009E460 E6140018 */  swc1       $f20, 0x18($s0)
/* 9F064 8009E464 D7B40028 */  ldc1       $f20, 0x28($sp)
/* 9F068 8009E468 460AB582 */  mul.s      $f22, $f22, $f10
/* 9F06C 8009E46C E6120020 */  swc1       $f18, 0x20($s0)
/* 9F070 8009E470 E60E0004 */  swc1       $f14, 4($s0)
/* 9F074 8009E474 E6100014 */  swc1       $f16, 0x14($s0)
/* 9F078 8009E478 E6020008 */  swc1       $f2, 8($s0)
/* 9F07C 8009E47C E6160028 */  swc1       $f22, 0x28($s0)
/* 9F080 8009E480 C620001C */  lwc1       $f0, 0x1c($s1)
/* 9F084 8009E484 D7B60030 */  ldc1       $f22, 0x30($sp)
/* 9F088 8009E488 E6000030 */  swc1       $f0, 0x30($s0)
/* 9F08C 8009E48C C6220020 */  lwc1       $f2, 0x20($s1)
/* 9F090 8009E490 3C01800E */  lui        $at, %hi(D_800E2EF0)
/* 9F094 8009E494 C4202EF0 */  lwc1       $f0, %lo(D_800E2EF0)($at)
/* 9F098 8009E498 E6020034 */  swc1       $f2, 0x34($s0)
/* 9F09C 8009E49C C6220024 */  lwc1       $f2, 0x24($s1)
/* 9F0A0 8009E4A0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9F0A4 8009E4A4 E600000C */  swc1       $f0, 0xc($s0)
/* 9F0A8 8009E4A8 E600001C */  swc1       $f0, 0x1c($s0)
/* 9F0AC 8009E4AC E600002C */  swc1       $f0, 0x2c($s0)
/* 9F0B0 8009E4B0 E600003C */  swc1       $f0, 0x3c($s0)
/* 9F0B4 8009E4B4 E6020038 */  swc1       $f2, 0x38($s0)
/* 9F0B8 8009E4B8 8FB00018 */  lw         $s0, 0x18($sp)
/* 9F0BC 8009E4BC 03E00008 */  jr         $ra
/* 9F0C0 8009E4C0 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_8009E4C4
/* 9F0C4 8009E4C4 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* 9F0C8 8009E4C8 AFB10094 */  sw         $s1, 0x94($sp)
/* 9F0CC 8009E4CC 00808821 */  addu       $s1, $a0, $zero
/* 9F0D0 8009E4D0 AFBF0098 */  sw         $ra, 0x98($sp)
/* 9F0D4 8009E4D4 AFB00090 */  sw         $s0, 0x90($sp)
/* 9F0D8 8009E4D8 F7BE00C8 */  sdc1       $f30, 0xc8($sp)
/* 9F0DC 8009E4DC F7BC00C0 */  sdc1       $f28, 0xc0($sp)
/* 9F0E0 8009E4E0 F7BA00B8 */  sdc1       $f26, 0xb8($sp)
/* 9F0E4 8009E4E4 F7B800B0 */  sdc1       $f24, 0xb0($sp)
/* 9F0E8 8009E4E8 F7B600A8 */  sdc1       $f22, 0xa8($sp)
/* 9F0EC 8009E4EC F7B400A0 */  sdc1       $f20, 0xa0($sp)
/* 9F0F0 8009E4F0 C6380010 */  lwc1       $f24, 0x10($s1)
/* 9F0F4 8009E4F4 3C01800E */  lui        $at, %hi(D_800E2EF4)
/* 9F0F8 8009E4F8 C4202EF4 */  lwc1       $f0, %lo(D_800E2EF4)($at)
/* 9F0FC 8009E4FC 4600C602 */  mul.s      $f24, $f24, $f0
/* 9F100 8009E500 C6340014 */  lwc1       $f20, 0x14($s1)
/* 9F104 8009E504 4600A502 */  mul.s      $f20, $f20, $f0
/* 9F108 8009E508 C63A0018 */  lwc1       $f26, 0x18($s1)
/* 9F10C 8009E50C 00A08021 */  addu       $s0, $a1, $zero
/* 9F110 8009E510 4600D682 */  mul.s      $f26, $f26, $f0
/* 9F114 8009E514 0C03328C */  jal        __sinf
/* 9F118 8009E518 4600A306 */   mov.s     $f12, $f20
/* 9F11C 8009E51C 4600A306 */  mov.s      $f12, $f20
/* 9F120 8009E520 0C02FB50 */  jal        __cosf
/* 9F124 8009E524 46000706 */   mov.s     $f28, $f0
/* 9F128 8009E528 4600C306 */  mov.s      $f12, $f24
/* 9F12C 8009E52C 0C03328C */  jal        __sinf
/* 9F130 8009E530 46000786 */   mov.s     $f30, $f0
/* 9F134 8009E534 4600C306 */  mov.s      $f12, $f24
/* 9F138 8009E538 0C02FB50 */  jal        __cosf
/* 9F13C 8009E53C 46000586 */   mov.s     $f22, $f0
/* 9F140 8009E540 4600D306 */  mov.s      $f12, $f26
/* 9F144 8009E544 0C03328C */  jal        __sinf
/* 9F148 8009E548 46000606 */   mov.s     $f24, $f0
/* 9F14C 8009E54C 4600D306 */  mov.s      $f12, $f26
/* 9F150 8009E550 0C02FB50 */  jal        __cosf
/* 9F154 8009E554 46000506 */   mov.s     $f20, $f0
/* 9F158 8009E558 46180382 */  mul.s      $f14, $f0, $f24
/* 9F15C 8009E55C 00000000 */  nop
/* 9F160 8009E560 46160082 */  mul.s      $f2, $f0, $f22
/* 9F164 8009E564 4600A187 */  neg.s      $f6, $f20
/* 9F168 8009E568 461E3182 */  mul.s      $f6, $f6, $f30
/* 9F16C 8009E56C 00000000 */  nop
/* 9F170 8009E570 461CA282 */  mul.s      $f10, $f20, $f28
/* 9F174 8009E574 00000000 */  nop
/* 9F178 8009E578 4618A202 */  mul.s      $f8, $f20, $f24
/* 9F17C 8009E57C 00000000 */  nop
/* 9F180 8009E580 4616A502 */  mul.s      $f20, $f20, $f22
/* 9F184 8009E584 C6320028 */  lwc1       $f18, 0x28($s1)
/* 9F188 8009E588 4600B587 */  neg.s      $f22, $f22
/* 9F18C 8009E58C 4612B582 */  mul.s      $f22, $f22, $f18
/* 9F190 8009E590 00000000 */  nop
/* 9F194 8009E594 46127382 */  mul.s      $f14, $f14, $f18
/* 9F198 8009E598 00000000 */  nop
/* 9F19C 8009E59C 461C1102 */  mul.s      $f4, $f2, $f28
/* 9F1A0 8009E5A0 00000000 */  nop
/* 9F1A4 8009E5A4 461E1082 */  mul.s      $f2, $f2, $f30
/* 9F1A8 8009E5A8 00000000 */  nop
/* 9F1AC 8009E5AC 46124202 */  mul.s      $f8, $f8, $f18
/* 9F1B0 8009E5B0 46043180 */  add.s      $f6, $f6, $f4
/* 9F1B4 8009E5B4 461E0102 */  mul.s      $f4, $f0, $f30
/* 9F1B8 8009E5B8 46025280 */  add.s      $f10, $f10, $f2
/* 9F1BC 8009E5BC 461CA082 */  mul.s      $f2, $f20, $f28
/* 9F1C0 8009E5C0 46000007 */  neg.s      $f0, $f0
/* 9F1C4 8009E5C4 461C0002 */  mul.s      $f0, $f0, $f28
/* 9F1C8 8009E5C8 00000000 */  nop
/* 9F1CC 8009E5CC 461EA502 */  mul.s      $f20, $f20, $f30
/* 9F1D0 8009E5D0 00000000 */  nop
/* 9F1D4 8009E5D4 461CC702 */  mul.s      $f28, $f24, $f28
/* 9F1D8 8009E5D8 00000000 */  nop
/* 9F1DC 8009E5DC 461EC602 */  mul.s      $f24, $f24, $f30
/* 9F1E0 8009E5E0 C62C002C */  lwc1       $f12, 0x2c($s1)
/* 9F1E4 8009E5E4 460C3182 */  mul.s      $f6, $f6, $f12
/* 9F1E8 8009E5E8 C6300030 */  lwc1       $f16, 0x30($s1)
/* 9F1EC 8009E5EC 46105282 */  mul.s      $f10, $f10, $f16
/* 9F1F0 8009E5F0 00000000 */  nop
/* 9F1F4 8009E5F4 460CE702 */  mul.s      $f28, $f28, $f12
/* 9F1F8 8009E5F8 00000000 */  nop
/* 9F1FC 8009E5FC 4610C602 */  mul.s      $f24, $f24, $f16
/* 9F200 8009E600 46022100 */  add.s      $f4, $f4, $f2
/* 9F204 8009E604 460C2102 */  mul.s      $f4, $f4, $f12
/* 9F208 8009E608 E6160008 */  swc1       $f22, 8($s0)
/* 9F20C 8009E60C E60E0000 */  swc1       $f14, ($s0)
/* 9F210 8009E610 46140000 */  add.s      $f0, $f0, $f20
/* 9F214 8009E614 E6080004 */  swc1       $f8, 4($s0)
/* 9F218 8009E618 E6060010 */  swc1       $f6, 0x10($s0)
/* 9F21C 8009E61C 46100002 */  mul.s      $f0, $f0, $f16
/* 9F220 8009E620 E60A0020 */  swc1       $f10, 0x20($s0)
/* 9F224 8009E624 E61C0018 */  swc1       $f28, 0x18($s0)
/* 9F228 8009E628 E6180028 */  swc1       $f24, 0x28($s0)
/* 9F22C 8009E62C E6040014 */  swc1       $f4, 0x14($s0)
/* 9F230 8009E630 E6000024 */  swc1       $f0, 0x24($s0)
/* 9F234 8009E634 C6300034 */  lwc1       $f16, 0x34($s1)
/* 9F238 8009E638 46107382 */  mul.s      $f14, $f14, $f16
/* 9F23C 8009E63C C6320038 */  lwc1       $f18, 0x38($s1)
/* 9F240 8009E640 46123182 */  mul.s      $f6, $f6, $f18
/* 9F244 8009E644 C62C003C */  lwc1       $f12, 0x3c($s1)
/* 9F248 8009E648 460C5282 */  mul.s      $f10, $f10, $f12
/* 9F24C 8009E64C 00000000 */  nop
/* 9F250 8009E650 46104202 */  mul.s      $f8, $f8, $f16
/* 9F254 8009E654 00000000 */  nop
/* 9F258 8009E658 46122102 */  mul.s      $f4, $f4, $f18
/* 9F25C 8009E65C 00000000 */  nop
/* 9F260 8009E660 460C0002 */  mul.s      $f0, $f0, $f12
/* 9F264 8009E664 00000000 */  nop
/* 9F268 8009E668 4610B582 */  mul.s      $f22, $f22, $f16
/* 9F26C 8009E66C 00000000 */  nop
/* 9F270 8009E670 4612E702 */  mul.s      $f28, $f28, $f18
/* 9F274 8009E674 00000000 */  nop
/* 9F278 8009E678 460CC602 */  mul.s      $f24, $f24, $f12
/* 9F27C 8009E67C 46067380 */  add.s      $f14, $f14, $f6
/* 9F280 8009E680 46044200 */  add.s      $f8, $f8, $f4
/* 9F284 8009E684 461CB580 */  add.s      $f22, $f22, $f28
/* 9F288 8009E688 8FBF0098 */  lw         $ra, 0x98($sp)
/* 9F28C 8009E68C 460A7380 */  add.s      $f14, $f14, $f10
/* 9F290 8009E690 D7BA00B8 */  ldc1       $f26, 0xb8($sp)
/* 9F294 8009E694 D7BE00C8 */  ldc1       $f30, 0xc8($sp)
/* 9F298 8009E698 46004200 */  add.s      $f8, $f8, $f0
/* 9F29C 8009E69C D7B400A0 */  ldc1       $f20, 0xa0($sp)
/* 9F2A0 8009E6A0 C622001C */  lwc1       $f2, 0x1c($s1)
/* 9F2A4 8009E6A4 4618B580 */  add.s      $f22, $f22, $f24
/* 9F2A8 8009E6A8 D7BC00C0 */  ldc1       $f28, 0xc0($sp)
/* 9F2AC 8009E6AC 3C01800E */  lui        $at, %hi(D_800E2EF8)
/* 9F2B0 8009E6B0 C4202EF8 */  lwc1       $f0, %lo(D_800E2EF8)($at)
/* 9F2B4 8009E6B4 460E1081 */  sub.s      $f2, $f2, $f14
/* 9F2B8 8009E6B8 D7B800B0 */  ldc1       $f24, 0xb0($sp)
/* 9F2BC 8009E6BC E6020030 */  swc1       $f2, 0x30($s0)
/* 9F2C0 8009E6C0 C6240020 */  lwc1       $f4, 0x20($s1)
/* 9F2C4 8009E6C4 E7B00050 */  swc1       $f16, 0x50($sp)
/* 9F2C8 8009E6C8 46082101 */  sub.s      $f4, $f4, $f8
/* 9F2CC 8009E6CC E7B20054 */  swc1       $f18, 0x54($sp)
/* 9F2D0 8009E6D0 E7AC0058 */  swc1       $f12, 0x58($sp)
/* 9F2D4 8009E6D4 E6040034 */  swc1       $f4, 0x34($s0)
/* 9F2D8 8009E6D8 C6220024 */  lwc1       $f2, 0x24($s1)
/* 9F2DC 8009E6DC 8FB10094 */  lw         $s1, 0x94($sp)
/* 9F2E0 8009E6E0 E7B60018 */  swc1       $f22, 0x18($sp)
/* 9F2E4 8009E6E4 46161081 */  sub.s      $f2, $f2, $f22
/* 9F2E8 8009E6E8 D7B600A8 */  ldc1       $f22, 0xa8($sp)
/* 9F2EC 8009E6EC E7AE0010 */  swc1       $f14, 0x10($sp)
/* 9F2F0 8009E6F0 E7A80014 */  swc1       $f8, 0x14($sp)
/* 9F2F4 8009E6F4 E600000C */  swc1       $f0, 0xc($s0)
/* 9F2F8 8009E6F8 E600001C */  swc1       $f0, 0x1c($s0)
/* 9F2FC 8009E6FC E600002C */  swc1       $f0, 0x2c($s0)
/* 9F300 8009E700 E600003C */  swc1       $f0, 0x3c($s0)
/* 9F304 8009E704 E6020038 */  swc1       $f2, 0x38($s0)
/* 9F308 8009E708 8FB00090 */  lw         $s0, 0x90($sp)
/* 9F30C 8009E70C 03E00008 */  jr         $ra
/* 9F310 8009E710 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel func_8009E714
/* 9F314 8009E714 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 9F318 8009E718 AFB10014 */  sw         $s1, 0x14($sp)
/* 9F31C 8009E71C 00808821 */  addu       $s1, $a0, $zero
/* 9F320 8009E720 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9F324 8009E724 AFB00010 */  sw         $s0, 0x10($sp)
/* 9F328 8009E728 F7BE0048 */  sdc1       $f30, 0x48($sp)
/* 9F32C 8009E72C F7BC0040 */  sdc1       $f28, 0x40($sp)
/* 9F330 8009E730 F7BA0038 */  sdc1       $f26, 0x38($sp)
/* 9F334 8009E734 F7B80030 */  sdc1       $f24, 0x30($sp)
/* 9F338 8009E738 F7B60028 */  sdc1       $f22, 0x28($sp)
/* 9F33C 8009E73C F7B40020 */  sdc1       $f20, 0x20($sp)
/* 9F340 8009E740 C62C0010 */  lwc1       $f12, 0x10($s1)
/* 9F344 8009E744 3C01800E */  lui        $at, %hi(D_800E2EFC)
/* 9F348 8009E748 C4382EFC */  lwc1       $f24, %lo(D_800E2EFC)($at)
/* 9F34C 8009E74C 46006307 */  neg.s      $f12, $f12
/* 9F350 8009E750 46186302 */  mul.s      $f12, $f12, $f24
/* 9F354 8009E754 0C03328C */  jal        __sinf
/* 9F358 8009E758 00A08021 */   addu      $s0, $a1, $zero
/* 9F35C 8009E75C C62C0010 */  lwc1       $f12, 0x10($s1)
/* 9F360 8009E760 46006307 */  neg.s      $f12, $f12
/* 9F364 8009E764 46186302 */  mul.s      $f12, $f12, $f24
/* 9F368 8009E768 0C02FB50 */  jal        __cosf
/* 9F36C 8009E76C 46000786 */   mov.s     $f30, $f0
/* 9F370 8009E770 C62C0014 */  lwc1       $f12, 0x14($s1)
/* 9F374 8009E774 46006307 */  neg.s      $f12, $f12
/* 9F378 8009E778 46186302 */  mul.s      $f12, $f12, $f24
/* 9F37C 8009E77C 0C03328C */  jal        __sinf
/* 9F380 8009E780 46000706 */   mov.s     $f28, $f0
/* 9F384 8009E784 C62C0014 */  lwc1       $f12, 0x14($s1)
/* 9F388 8009E788 46006307 */  neg.s      $f12, $f12
/* 9F38C 8009E78C 46186302 */  mul.s      $f12, $f12, $f24
/* 9F390 8009E790 0C02FB50 */  jal        __cosf
/* 9F394 8009E794 46000686 */   mov.s     $f26, $f0
/* 9F398 8009E798 C62C0018 */  lwc1       $f12, 0x18($s1)
/* 9F39C 8009E79C 46006307 */  neg.s      $f12, $f12
/* 9F3A0 8009E7A0 46186302 */  mul.s      $f12, $f12, $f24
/* 9F3A4 8009E7A4 0C03328C */  jal        __sinf
/* 9F3A8 8009E7A8 46000586 */   mov.s     $f22, $f0
/* 9F3AC 8009E7AC C62C0018 */  lwc1       $f12, 0x18($s1)
/* 9F3B0 8009E7B0 46006307 */  neg.s      $f12, $f12
/* 9F3B4 8009E7B4 46186302 */  mul.s      $f12, $f12, $f24
/* 9F3B8 8009E7B8 0C02FB50 */  jal        __cosf
/* 9F3BC 8009E7BC 46000506 */   mov.s     $f20, $f0
/* 9F3C0 8009E7C0 461C0482 */  mul.s      $f18, $f0, $f28
/* 9F3C4 8009E7C4 00000000 */  nop
/* 9F3C8 8009E7C8 461E0182 */  mul.s      $f6, $f0, $f30
/* 9F3CC 8009E7CC 00000000 */  nop
/* 9F3D0 8009E7D0 4616A282 */  mul.s      $f10, $f20, $f22
/* 9F3D4 8009E7D4 00000000 */  nop
/* 9F3D8 8009E7D8 461AA302 */  mul.s      $f12, $f20, $f26
/* 9F3DC 8009E7DC 4600A107 */  neg.s      $f4, $f20
/* 9F3E0 8009E7E0 461C2102 */  mul.s      $f4, $f4, $f28
/* 9F3E4 8009E7E4 00000000 */  nop
/* 9F3E8 8009E7E8 461EA502 */  mul.s      $f20, $f20, $f30
/* 9F3EC 8009E7EC 00000000 */  nop
/* 9F3F0 8009E7F0 46160202 */  mul.s      $f8, $f0, $f22
/* 9F3F4 8009E7F4 00000000 */  nop
/* 9F3F8 8009E7F8 461A0002 */  mul.s      $f0, $f0, $f26
/* 9F3FC 8009E7FC 4600E087 */  neg.s      $f2, $f28
/* 9F400 8009E800 461A1082 */  mul.s      $f2, $f2, $f26
/* 9F404 8009E804 00000000 */  nop
/* 9F408 8009E808 4616E702 */  mul.s      $f28, $f28, $f22
/* 9F40C 8009E80C 00000000 */  nop
/* 9F410 8009E810 461A3402 */  mul.s      $f16, $f6, $f26
/* 9F414 8009E814 00000000 */  nop
/* 9F418 8009E818 46163182 */  mul.s      $f6, $f6, $f22
/* 9F41C 8009E81C 00000000 */  nop
/* 9F420 8009E820 461AA382 */  mul.s      $f14, $f20, $f26
/* 9F424 8009E824 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9F428 8009E828 E61E0008 */  swc1       $f30, 8($s0)
/* 9F42C 8009E82C D7BE0048 */  ldc1       $f30, 0x48($sp)
/* 9F430 8009E830 4616A502 */  mul.s      $f20, $f20, $f22
/* 9F434 8009E834 D7B80030 */  ldc1       $f24, 0x30($sp)
/* 9F438 8009E838 E61C0028 */  swc1       $f28, 0x28($s0)
/* 9F43C 8009E83C D7BC0040 */  ldc1       $f28, 0x40($sp)
/* 9F440 8009E840 46105280 */  add.s      $f10, $f10, $f16
/* 9F444 8009E844 D7BA0038 */  ldc1       $f26, 0x38($sp)
/* 9F448 8009E848 D7B60028 */  ldc1       $f22, 0x28($sp)
/* 9F44C 8009E84C 46066301 */  sub.s      $f12, $f12, $f6
/* 9F450 8009E850 E6120000 */  swc1       $f18, ($s0)
/* 9F454 8009E854 E6040004 */  swc1       $f4, 4($s0)
/* 9F458 8009E858 46140000 */  add.s      $f0, $f0, $f20
/* 9F45C 8009E85C E6020018 */  swc1       $f2, 0x18($s0)
/* 9F460 8009E860 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 9F464 8009E864 460E4201 */  sub.s      $f8, $f8, $f14
/* 9F468 8009E868 E60A0010 */  swc1       $f10, 0x10($s0)
/* 9F46C 8009E86C E60C0020 */  swc1       $f12, 0x20($s0)
/* 9F470 8009E870 E6080014 */  swc1       $f8, 0x14($s0)
/* 9F474 8009E874 E6000024 */  swc1       $f0, 0x24($s0)
/* 9F478 8009E878 C620001C */  lwc1       $f0, 0x1c($s1)
/* 9F47C 8009E87C E6000030 */  swc1       $f0, 0x30($s0)
/* 9F480 8009E880 C6220020 */  lwc1       $f2, 0x20($s1)
/* 9F484 8009E884 E6020034 */  swc1       $f2, 0x34($s0)
/* 9F488 8009E888 C6200024 */  lwc1       $f0, 0x24($s1)
/* 9F48C 8009E88C E6000038 */  swc1       $f0, 0x38($s0)
/* 9F490 8009E890 C6220028 */  lwc1       $f2, 0x28($s1)
/* 9F494 8009E894 E602000C */  swc1       $f2, 0xc($s0)
/* 9F498 8009E898 C620002C */  lwc1       $f0, 0x2c($s1)
/* 9F49C 8009E89C 3C01800E */  lui        $at, %hi(D_800E2F00)
/* 9F4A0 8009E8A0 C4222F00 */  lwc1       $f2, %lo(D_800E2F00)($at)
/* 9F4A4 8009E8A4 E600001C */  swc1       $f0, 0x1c($s0)
/* 9F4A8 8009E8A8 C6200030 */  lwc1       $f0, 0x30($s1)
/* 9F4AC 8009E8AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 9F4B0 8009E8B0 E602003C */  swc1       $f2, 0x3c($s0)
/* 9F4B4 8009E8B4 E600002C */  swc1       $f0, 0x2c($s0)
/* 9F4B8 8009E8B8 8FB00010 */  lw         $s0, 0x10($sp)
/* 9F4BC 8009E8BC 03E00008 */  jr         $ra
/* 9F4C0 8009E8C0 27BD0050 */   addiu     $sp, $sp, 0x50

glabel some_matrix_func
/* 9F4C4 8009E8C4 27BDFEF8 */  addiu      $sp, $sp, -0x108
/* 9F4C8 8009E8C8 F7BE0100 */  sdc1       $f30, 0x100($sp)
/* 9F4CC 8009E8CC 4485F000 */  mtc1       $a1, $f30
/* 9F4D0 8009E8D0 C7A40118 */  lwc1       $f4, 0x118($sp)
/* 9F4D4 8009E8D4 F7BC00F8 */  sdc1       $f28, 0xf8($sp)
/* 9F4D8 8009E8D8 4486E000 */  mtc1       $a2, $f28
/* 9F4DC 8009E8DC C7A2011C */  lwc1       $f2, 0x11c($sp)
/* 9F4E0 8009E8E0 AFB000D0 */  sw         $s0, 0xd0($sp)
/* 9F4E4 8009E8E4 00808021 */  addu       $s0, $a0, $zero
/* 9F4E8 8009E8E8 F7BA00F0 */  sdc1       $f26, 0xf0($sp)
/* 9F4EC 8009E8EC 4487D000 */  mtc1       $a3, $f26
/* 9F4F0 8009E8F0 C7A00120 */  lwc1       $f0, 0x120($sp)
/* 9F4F4 8009E8F4 27A40010 */  addiu      $a0, $sp, 0x10
/* 9F4F8 8009E8F8 F7B600E0 */  sdc1       $f22, 0xe0($sp)
/* 9F4FC 8009E8FC C7B60124 */  lwc1       $f22, 0x124($sp)
/* 9F500 8009E900 27A50014 */  addiu      $a1, $sp, 0x14
/* 9F504 8009E904 F7B800E8 */  sdc1       $f24, 0xe8($sp)
/* 9F508 8009E908 C7B80128 */  lwc1       $f24, 0x128($sp)
/* 9F50C 8009E90C 4604F101 */  sub.s      $f4, $f30, $f4
/* 9F510 8009E910 F7B400D8 */  sdc1       $f20, 0xd8($sp)
/* 9F514 8009E914 C7B4012C */  lwc1       $f20, 0x12c($sp)
/* 9F518 8009E918 4602E081 */  sub.s      $f2, $f28, $f2
/* 9F51C 8009E91C 27A60018 */  addiu      $a2, $sp, 0x18
/* 9F520 8009E920 AFBF00D4 */  sw         $ra, 0xd4($sp)
/* 9F524 8009E924 4600D001 */  sub.s      $f0, $f26, $f0
/* 9F528 8009E928 E7A40010 */  swc1       $f4, 0x10($sp)
/* 9F52C 8009E92C E7A20014 */  swc1       $f2, 0x14($sp)
/* 9F530 8009E930 0C03122C */  jal        guNormalize
/* 9F534 8009E934 E7A00018 */   swc1      $f0, 0x18($sp)
/* 9F538 8009E938 C7A00018 */  lwc1       $f0, 0x18($sp)
/* 9F53C 8009E93C 4600C082 */  mul.s      $f2, $f24, $f0
/* 9F540 8009E940 C7A60014 */  lwc1       $f6, 0x14($sp)
/* 9F544 8009E944 4606A202 */  mul.s      $f8, $f20, $f6
/* 9F548 8009E948 C7A40010 */  lwc1       $f4, 0x10($sp)
/* 9F54C 8009E94C 4604A502 */  mul.s      $f20, $f20, $f4
/* 9F550 8009E950 00000000 */  nop
/* 9F554 8009E954 4600B002 */  mul.s      $f0, $f22, $f0
/* 9F558 8009E958 00000000 */  nop
/* 9F55C 8009E95C 4606B582 */  mul.s      $f22, $f22, $f6
/* 9F560 8009E960 00000000 */  nop
/* 9F564 8009E964 4604C602 */  mul.s      $f24, $f24, $f4
/* 9F568 8009E968 46081081 */  sub.s      $f2, $f2, $f8
/* 9F56C 8009E96C 46021302 */  mul.s      $f12, $f2, $f2
/* 9F570 8009E970 4600A501 */  sub.s      $f20, $f20, $f0
/* 9F574 8009E974 4614A102 */  mul.s      $f4, $f20, $f20
/* 9F578 8009E978 4618B581 */  sub.s      $f22, $f22, $f24
/* 9F57C 8009E97C 4616B002 */  mul.s      $f0, $f22, $f22
/* 9F580 8009E980 46046300 */  add.s      $f12, $f12, $f4
/* 9F584 8009E984 E7A20050 */  swc1       $f2, 0x50($sp)
/* 9F588 8009E988 46006300 */  add.s      $f12, $f12, $f0
/* 9F58C 8009E98C E7B40054 */  swc1       $f20, 0x54($sp)
/* 9F590 8009E990 0C0334B4 */  jal        _sqrtf
/* 9F594 8009E994 E7B60058 */   swc1      $f22, 0x58($sp)
/* 9F598 8009E998 3C01800E */  lui        $at, %hi(D_800E2F08)
/* 9F59C 8009E99C D4222F08 */  ldc1       $f2, %lo(D_800E2F08)($at)
/* 9F5A0 8009E9A0 46000121 */  cvt.d.s    $f4, $f0
/* 9F5A4 8009E9A4 4622203C */  c.lt.d     $f4, $f2
/* 9F5A8 8009E9A8 00000000 */  nop
/* 9F5AC 8009E9AC 45000009 */  bc1f       .L8009E9D4
/* 9F5B0 8009E9B0 3C02800F */   lui       $v0, %hi(D_800F3384)
/* 9F5B4 8009E9B4 24433384 */  addiu      $v1, $v0, %lo(D_800F3384)
/* 9F5B8 8009E9B8 8C443384 */  lw         $a0, 0x3384($v0)
/* 9F5BC 8009E9BC 8C650004 */  lw         $a1, 4($v1)
/* 9F5C0 8009E9C0 8C620008 */  lw         $v0, 8($v1)
/* 9F5C4 8009E9C4 AFA40050 */  sw         $a0, 0x50($sp)
/* 9F5C8 8009E9C8 AFA50054 */  sw         $a1, 0x54($sp)
/* 9F5CC 8009E9CC 08027A89 */  j          .L8009EA24
/* 9F5D0 8009E9D0 AFA20058 */   sw        $v0, 0x58($sp)
.L8009E9D4:
/* 9F5D4 8009E9D4 3C01800E */  lui        $at, %hi(D_800E2F10)
/* 9F5D8 8009E9D8 D4202F10 */  ldc1       $f0, %lo(D_800E2F10)($at)
/* 9F5DC 8009E9DC C7A20054 */  lwc1       $f2, 0x54($sp)
/* 9F5E0 8009E9E0 46240003 */  div.d      $f0, $f0, $f4
/* 9F5E4 8009E9E4 462001A0 */  cvt.s.d    $f6, $f0
/* 9F5E8 8009E9E8 46061082 */  mul.s      $f2, $f2, $f6
/* 9F5EC 8009E9EC C7A40050 */  lwc1       $f4, 0x50($sp)
/* 9F5F0 8009E9F0 46062102 */  mul.s      $f4, $f4, $f6
/* 9F5F4 8009E9F4 C7A00058 */  lwc1       $f0, 0x58($sp)
/* 9F5F8 8009E9F8 46060002 */  mul.s      $f0, $f0, $f6
/* 9F5FC 8009E9FC E7A20054 */  swc1       $f2, 0x54($sp)
/* 9F600 8009EA00 8FA40054 */  lw         $a0, 0x54($sp)
/* 9F604 8009EA04 E7A40050 */  swc1       $f4, 0x50($sp)
/* 9F608 8009EA08 8FA30050 */  lw         $v1, 0x50($sp)
/* 9F60C 8009EA0C E7A00058 */  swc1       $f0, 0x58($sp)
/* 9F610 8009EA10 AC433384 */  sw         $v1, 0x3384($v0)
/* 9F614 8009EA14 8FA30058 */  lw         $v1, 0x58($sp)
/* 9F618 8009EA18 24423384 */  addiu      $v0, $v0, 0x3384
/* 9F61C 8009EA1C AC440004 */  sw         $a0, 4($v0)
/* 9F620 8009EA20 AC430008 */  sw         $v1, 8($v0)
.L8009EA24:
/* 9F624 8009EA24 27A40090 */  addiu      $a0, $sp, 0x90
/* 9F628 8009EA28 27A50010 */  addiu      $a1, $sp, 0x10
/* 9F62C 8009EA2C 0C02AB86 */  jal        some_vec3_math
/* 9F630 8009EA30 27A60050 */   addiu     $a2, $sp, 0x50
/* 9F634 8009EA34 C7A00050 */  lwc1       $f0, 0x50($sp)
/* 9F638 8009EA38 C7A20054 */  lwc1       $f2, 0x54($sp)
/* 9F63C 8009EA3C C7A40058 */  lwc1       $f4, 0x58($sp)
/* 9F640 8009EA40 C7A60090 */  lwc1       $f6, 0x90($sp)
/* 9F644 8009EA44 C7A80094 */  lwc1       $f8, 0x94($sp)
/* 9F648 8009EA48 C7AA0098 */  lwc1       $f10, 0x98($sp)
/* 9F64C 8009EA4C C7AC0010 */  lwc1       $f12, 0x10($sp)
/* 9F650 8009EA50 C7AE0014 */  lwc1       $f14, 0x14($sp)
/* 9F654 8009EA54 C7B00018 */  lwc1       $f16, 0x18($sp)
/* 9F658 8009EA58 3C01800E */  lui        $at, %hi(D_800E2F18)
/* 9F65C 8009EA5C C4322F18 */  lwc1       $f18, %lo(D_800E2F18)($at)
/* 9F660 8009EA60 8FBF00D4 */  lw         $ra, 0xd4($sp)
/* 9F664 8009EA64 E61E0030 */  swc1       $f30, 0x30($s0)
/* 9F668 8009EA68 D7BE0100 */  ldc1       $f30, 0x100($sp)
/* 9F66C 8009EA6C E61C0034 */  swc1       $f28, 0x34($s0)
/* 9F670 8009EA70 D7BC00F8 */  ldc1       $f28, 0xf8($sp)
/* 9F674 8009EA74 E61A0038 */  swc1       $f26, 0x38($s0)
/* 9F678 8009EA78 D7BA00F0 */  ldc1       $f26, 0xf0($sp)
/* 9F67C 8009EA7C D7B800E8 */  ldc1       $f24, 0xe8($sp)
/* 9F680 8009EA80 D7B600E0 */  ldc1       $f22, 0xe0($sp)
/* 9F684 8009EA84 D7B400D8 */  ldc1       $f20, 0xd8($sp)
/* 9F688 8009EA88 AE00000C */  sw         $zero, 0xc($s0)
/* 9F68C 8009EA8C AE00001C */  sw         $zero, 0x1c($s0)
/* 9F690 8009EA90 AE00002C */  sw         $zero, 0x2c($s0)
/* 9F694 8009EA94 E6000000 */  swc1       $f0, ($s0)
/* 9F698 8009EA98 E6020004 */  swc1       $f2, 4($s0)
/* 9F69C 8009EA9C E6040008 */  swc1       $f4, 8($s0)
/* 9F6A0 8009EAA0 E6060010 */  swc1       $f6, 0x10($s0)
/* 9F6A4 8009EAA4 E6080014 */  swc1       $f8, 0x14($s0)
/* 9F6A8 8009EAA8 E60A0018 */  swc1       $f10, 0x18($s0)
/* 9F6AC 8009EAAC E60C0020 */  swc1       $f12, 0x20($s0)
/* 9F6B0 8009EAB0 E60E0024 */  swc1       $f14, 0x24($s0)
/* 9F6B4 8009EAB4 E6100028 */  swc1       $f16, 0x28($s0)
/* 9F6B8 8009EAB8 E612003C */  swc1       $f18, 0x3c($s0)
/* 9F6BC 8009EABC 8FB000D0 */  lw         $s0, 0xd0($sp)
/* 9F6C0 8009EAC0 03E00008 */  jr         $ra
/* 9F6C4 8009EAC4 27BD0108 */   addiu     $sp, $sp, 0x108

glabel func_8009EAC8
/* 9F6C8 8009EAC8 27BDFED0 */  addiu      $sp, $sp, -0x130
/* 9F6CC 8009EACC AFB00110 */  sw         $s0, 0x110($sp)
/* 9F6D0 8009EAD0 00A08021 */  addu       $s0, $a1, $zero
/* 9F6D4 8009EAD4 AFB10114 */  sw         $s1, 0x114($sp)
/* 9F6D8 8009EAD8 27B100D0 */  addiu      $s1, $sp, 0xd0
/* 9F6DC 8009EADC AFBF0118 */  sw         $ra, 0x118($sp)
/* 9F6E0 8009EAE0 F7B60128 */  sdc1       $f22, 0x128($sp)
/* 9F6E4 8009EAE4 F7B40120 */  sdc1       $f20, 0x120($sp)
/* 9F6E8 8009EAE8 AFA00090 */  sw         $zero, 0x90($sp)
/* 9F6EC 8009EAEC C4820014 */  lwc1       $f2, 0x14($a0)
/* 9F6F0 8009EAF0 C4800010 */  lwc1       $f0, 0x10($a0)
/* 9F6F4 8009EAF4 C4840018 */  lwc1       $f4, 0x18($a0)
/* 9F6F8 8009EAF8 C7B40090 */  lwc1       $f20, 0x90($sp)
/* 9F6FC 8009EAFC 3C01800E */  lui        $at, %hi(D_800E2F1C)
/* 9F700 8009EB00 C4362F1C */  lwc1       $f22, %lo(D_800E2F1C)($at)
/* 9F704 8009EB04 44051000 */  mfc1       $a1, $f2
/* 9F708 8009EB08 44060000 */  mfc1       $a2, $f0
/* 9F70C 8009EB0C 4407A000 */  mfc1       $a3, $f20
/* 9F710 8009EB10 02202021 */  addu       $a0, $s1, $zero
/* 9F714 8009EB14 AFA00094 */  sw         $zero, 0x94($sp)
/* 9F718 8009EB18 E7A00054 */  swc1       $f0, 0x54($sp)
/* 9F71C 8009EB1C E7A20050 */  swc1       $f2, 0x50($sp)
/* 9F720 8009EB20 E7A40058 */  swc1       $f4, 0x58($sp)
/* 9F724 8009EB24 0C032D64 */  jal        guRotateRPYF
/* 9F728 8009EB28 E7B60098 */   swc1      $f22, 0x98($sp)
/* 9F72C 8009EB2C 27A40010 */  addiu      $a0, $sp, 0x10
/* 9F730 8009EB30 02202821 */  addu       $a1, $s1, $zero
/* 9F734 8009EB34 0C02B2C0 */  jal        some_float_multi_math
/* 9F738 8009EB38 27A60090 */   addiu     $a2, $sp, 0x90
/* 9F73C 8009EB3C C7A00010 */  lwc1       $f0, 0x10($sp)
/* 9F740 8009EB40 C7A20014 */  lwc1       $f2, 0x14($sp)
/* 9F744 8009EB44 C7A40018 */  lwc1       $f4, 0x18($sp)
/* 9F748 8009EB48 8FBF0118 */  lw         $ra, 0x118($sp)
/* 9F74C 8009EB4C 8FB10114 */  lw         $s1, 0x114($sp)
/* 9F750 8009EB50 E616000C */  swc1       $f22, 0xc($s0)
/* 9F754 8009EB54 E616001C */  swc1       $f22, 0x1c($s0)
/* 9F758 8009EB58 E616002C */  swc1       $f22, 0x2c($s0)
/* 9F75C 8009EB5C E616003C */  swc1       $f22, 0x3c($s0)
/* 9F760 8009EB60 D7B60128 */  ldc1       $f22, 0x128($sp)
/* 9F764 8009EB64 E6140000 */  swc1       $f20, ($s0)
/* 9F768 8009EB68 E6140004 */  swc1       $f20, 4($s0)
/* 9F76C 8009EB6C E6140008 */  swc1       $f20, 8($s0)
/* 9F770 8009EB70 E6140010 */  swc1       $f20, 0x10($s0)
/* 9F774 8009EB74 E6140014 */  swc1       $f20, 0x14($s0)
/* 9F778 8009EB78 E6140018 */  swc1       $f20, 0x18($s0)
/* 9F77C 8009EB7C E6140030 */  swc1       $f20, 0x30($s0)
/* 9F780 8009EB80 E6140034 */  swc1       $f20, 0x34($s0)
/* 9F784 8009EB84 E6140038 */  swc1       $f20, 0x38($s0)
/* 9F788 8009EB88 D7B40120 */  ldc1       $f20, 0x120($sp)
/* 9F78C 8009EB8C E6000020 */  swc1       $f0, 0x20($s0)
/* 9F790 8009EB90 E6020024 */  swc1       $f2, 0x24($s0)
/* 9F794 8009EB94 E6040028 */  swc1       $f4, 0x28($s0)
/* 9F798 8009EB98 8FB00110 */  lw         $s0, 0x110($sp)
/* 9F79C 8009EB9C 03E00008 */  jr         $ra
/* 9F7A0 8009EBA0 27BD0130 */   addiu     $sp, $sp, 0x130

glabel func_8009EBA4
/* 9F7A4 8009EBA4 27BDFDF0 */  addiu      $sp, $sp, -0x210
/* 9F7A8 8009EBA8 AFB301F4 */  sw         $s3, 0x1f4($sp)
/* 9F7AC 8009EBAC 00A09821 */  addu       $s3, $a1, $zero
/* 9F7B0 8009EBB0 AFB001E8 */  sw         $s0, 0x1e8($sp)
/* 9F7B4 8009EBB4 27B001A8 */  addiu      $s0, $sp, 0x1a8
/* 9F7B8 8009EBB8 AFBF01F8 */  sw         $ra, 0x1f8($sp)
/* 9F7BC 8009EBBC AFB201F0 */  sw         $s2, 0x1f0($sp)
/* 9F7C0 8009EBC0 AFB101EC */  sw         $s1, 0x1ec($sp)
/* 9F7C4 8009EBC4 F7B60208 */  sdc1       $f22, 0x208($sp)
/* 9F7C8 8009EBC8 F7B40200 */  sdc1       $f20, 0x200($sp)
/* 9F7CC 8009EBCC AFA00128 */  sw         $zero, 0x128($sp)
/* 9F7D0 8009EBD0 C48A0014 */  lwc1       $f10, 0x14($a0)
/* 9F7D4 8009EBD4 C4880010 */  lwc1       $f8, 0x10($a0)
/* 9F7D8 8009EBD8 C7B40128 */  lwc1       $f20, 0x128($sp)
/* 9F7DC 8009EBDC C480001C */  lwc1       $f0, 0x1c($a0)
/* 9F7E0 8009EBE0 C4820020 */  lwc1       $f2, 0x20($a0)
/* 9F7E4 8009EBE4 C4840024 */  lwc1       $f4, 0x24($a0)
/* 9F7E8 8009EBE8 C4860018 */  lwc1       $f6, 0x18($a0)
/* 9F7EC 8009EBEC 3C01800E */  lui        $at, %hi(D_800E2F20)
/* 9F7F0 8009EBF0 C4362F20 */  lwc1       $f22, %lo(D_800E2F20)($at)
/* 9F7F4 8009EBF4 44055000 */  mfc1       $a1, $f10
/* 9F7F8 8009EBF8 44064000 */  mfc1       $a2, $f8
/* 9F7FC 8009EBFC 4407A000 */  mfc1       $a3, $f20
/* 9F800 8009EC00 02002021 */  addu       $a0, $s0, $zero
/* 9F804 8009EC04 AFA0012C */  sw         $zero, 0x12c($sp)
/* 9F808 8009EC08 E7A00028 */  swc1       $f0, 0x28($sp)
/* 9F80C 8009EC0C E7A2002C */  swc1       $f2, 0x2c($sp)
/* 9F810 8009EC10 E7A40030 */  swc1       $f4, 0x30($sp)
/* 9F814 8009EC14 E7A800AC */  swc1       $f8, 0xac($sp)
/* 9F818 8009EC18 E7AA00A8 */  swc1       $f10, 0xa8($sp)
/* 9F81C 8009EC1C E7A600B0 */  swc1       $f6, 0xb0($sp)
/* 9F820 8009EC20 0C032D64 */  jal        guRotateRPYF
/* 9F824 8009EC24 E7B60130 */   swc1      $f22, 0x130($sp)
/* 9F828 8009EC28 27B20168 */  addiu      $s2, $sp, 0x168
/* 9F82C 8009EC2C 02402021 */  addu       $a0, $s2, $zero
/* 9F830 8009EC30 02002821 */  addu       $a1, $s0, $zero
/* 9F834 8009EC34 27B10128 */  addiu      $s1, $sp, 0x128
/* 9F838 8009EC38 0C02B2C0 */  jal        some_float_multi_math
/* 9F83C 8009EC3C 02203021 */   addu      $a2, $s1, $zero
/* 9F840 8009EC40 4405A000 */  mfc1       $a1, $f20
/* 9F844 8009EC44 8FA700B0 */  lw         $a3, 0xb0($sp)
/* 9F848 8009EC48 C7A60028 */  lwc1       $f6, 0x28($sp)
/* 9F84C 8009EC4C C7A00168 */  lwc1       $f0, 0x168($sp)
/* 9F850 8009EC50 C7A4002C */  lwc1       $f4, 0x2c($sp)
/* 9F854 8009EC54 C7A2016C */  lwc1       $f2, 0x16c($sp)
/* 9F858 8009EC58 02002021 */  addu       $a0, $s0, $zero
/* 9F85C 8009EC5C E7B40128 */  swc1       $f20, 0x128($sp)
/* 9F860 8009EC60 46003181 */  sub.s      $f6, $f6, $f0
/* 9F864 8009EC64 E7B6012C */  swc1       $f22, 0x12c($sp)
/* 9F868 8009EC68 E7B40130 */  swc1       $f20, 0x130($sp)
/* 9F86C 8009EC6C 46022101 */  sub.s      $f4, $f4, $f2
/* 9F870 8009EC70 C7A00030 */  lwc1       $f0, 0x30($sp)
/* 9F874 8009EC74 C7A20170 */  lwc1       $f2, 0x170($sp)
/* 9F878 8009EC78 00A03021 */  addu       $a2, $a1, $zero
/* 9F87C 8009EC7C 46020001 */  sub.s      $f0, $f0, $f2
/* 9F880 8009EC80 E7A60068 */  swc1       $f6, 0x68($sp)
/* 9F884 8009EC84 E7A4006C */  swc1       $f4, 0x6c($sp)
/* 9F888 8009EC88 0C032D64 */  jal        guRotateRPYF
/* 9F88C 8009EC8C E7A00070 */   swc1      $f0, 0x70($sp)
/* 9F890 8009EC90 02402021 */  addu       $a0, $s2, $zero
/* 9F894 8009EC94 02002821 */  addu       $a1, $s0, $zero
/* 9F898 8009EC98 0C02B2C0 */  jal        some_float_multi_math
/* 9F89C 8009EC9C 02203021 */   addu      $a2, $s1, $zero
/* 9F8A0 8009ECA0 8FA50028 */  lw         $a1, 0x28($sp)
/* 9F8A4 8009ECA4 8FA6002C */  lw         $a2, 0x2c($sp)
/* 9F8A8 8009ECA8 8FA70030 */  lw         $a3, 0x30($sp)
/* 9F8AC 8009ECAC C7A60168 */  lwc1       $f6, 0x168($sp)
/* 9F8B0 8009ECB0 C7A8016C */  lwc1       $f8, 0x16c($sp)
/* 9F8B4 8009ECB4 C7AA0170 */  lwc1       $f10, 0x170($sp)
/* 9F8B8 8009ECB8 C7A00068 */  lwc1       $f0, 0x68($sp)
/* 9F8BC 8009ECBC C7A2006C */  lwc1       $f2, 0x6c($sp)
/* 9F8C0 8009ECC0 C7A40070 */  lwc1       $f4, 0x70($sp)
/* 9F8C4 8009ECC4 02602021 */  addu       $a0, $s3, $zero
/* 9F8C8 8009ECC8 E7A600E8 */  swc1       $f6, 0xe8($sp)
/* 9F8CC 8009ECCC E7A800EC */  swc1       $f8, 0xec($sp)
/* 9F8D0 8009ECD0 E7AA00F0 */  swc1       $f10, 0xf0($sp)
/* 9F8D4 8009ECD4 E7A00010 */  swc1       $f0, 0x10($sp)
/* 9F8D8 8009ECD8 E7A20014 */  swc1       $f2, 0x14($sp)
/* 9F8DC 8009ECDC E7A40018 */  swc1       $f4, 0x18($sp)
/* 9F8E0 8009ECE0 E7A6001C */  swc1       $f6, 0x1c($sp)
/* 9F8E4 8009ECE4 E7A80020 */  swc1       $f8, 0x20($sp)
/* 9F8E8 8009ECE8 0C027A31 */  jal        some_matrix_func
/* 9F8EC 8009ECEC E7AA0024 */   swc1      $f10, 0x24($sp)
/* 9F8F0 8009ECF0 8FBF01F8 */  lw         $ra, 0x1f8($sp)
/* 9F8F4 8009ECF4 8FB301F4 */  lw         $s3, 0x1f4($sp)
/* 9F8F8 8009ECF8 8FB201F0 */  lw         $s2, 0x1f0($sp)
/* 9F8FC 8009ECFC 8FB101EC */  lw         $s1, 0x1ec($sp)
/* 9F900 8009ED00 8FB001E8 */  lw         $s0, 0x1e8($sp)
/* 9F904 8009ED04 D7B60208 */  ldc1       $f22, 0x208($sp)
/* 9F908 8009ED08 D7B40200 */  ldc1       $f20, 0x200($sp)
/* 9F90C 8009ED0C 03E00008 */  jr         $ra
/* 9F910 8009ED10 27BD0210 */   addiu     $sp, $sp, 0x210

glabel some_caseSwitch
/* 9F914 8009ED14 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9F918 8009ED18 00803021 */  addu       $a2, $a0, $zero
/* 9F91C 8009ED1C AFBF0010 */  sw         $ra, 0x10($sp)
/* 9F920 8009ED20 90C30002 */  lbu        $v1, 2($a2)
/* 9F924 8009ED24 2C620005 */  sltiu      $v0, $v1, 5
/* 9F928 8009ED28 10400019 */  beqz       $v0, .L8009ED90
/* 9F92C 8009ED2C 3C02800E */   lui       $v0, %hi(D_800E2F28)
/* 9F930 8009ED30 24422F28 */  addiu      $v0, $v0, %lo(D_800E2F28)
/* 9F934 8009ED34 00031880 */  sll        $v1, $v1, 2
/* 9F938 8009ED38 00621821 */  addu       $v1, $v1, $v0
/* 9F93C 8009ED3C 8C640000 */  lw         $a0, ($v1)
/* 9F940 8009ED40 00800008 */  jr         $a0
/* 9F944 8009ED44 00000000 */   nop
/* 9F948 8009ED48 0C0278BE */  jal        func_8009E2F8
/* 9F94C 8009ED4C 00C02021 */   addu      $a0, $a2, $zero
/* 9F950 8009ED50 08027B65 */  j          .L8009ED94
/* 9F954 8009ED54 8FBF0010 */   lw        $ra, 0x10($sp)
/* 9F958 8009ED58 0C027931 */  jal        func_8009E4C4
/* 9F95C 8009ED5C 00C02021 */   addu      $a0, $a2, $zero
/* 9F960 8009ED60 08027B65 */  j          .L8009ED94
/* 9F964 8009ED64 8FBF0010 */   lw        $ra, 0x10($sp)
/* 9F968 8009ED68 0C0279C5 */  jal        func_8009E714
/* 9F96C 8009ED6C 00C02021 */   addu      $a0, $a2, $zero
/* 9F970 8009ED70 08027B65 */  j          .L8009ED94
/* 9F974 8009ED74 8FBF0010 */   lw        $ra, 0x10($sp)
/* 9F978 8009ED78 0C027AB2 */  jal        func_8009EAC8
/* 9F97C 8009ED7C 00C02021 */   addu      $a0, $a2, $zero
/* 9F980 8009ED80 08027B65 */  j          .L8009ED94
/* 9F984 8009ED84 8FBF0010 */   lw        $ra, 0x10($sp)
/* 9F988 8009ED88 0C027AE9 */  jal        func_8009EBA4
/* 9F98C 8009ED8C 00C02021 */   addu      $a0, $a2, $zero
.L8009ED90:
/* 9F990 8009ED90 8FBF0010 */  lw         $ra, 0x10($sp)
.L8009ED94:
/* 9F994 8009ED94 03E00008 */  jr         $ra
/* 9F998 8009ED98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009ED9C
/* 9F99C 8009ED9C C484000C */  lwc1       $f4, 0xc($a0)
/* 9F9A0 8009EDA0 C4860000 */  lwc1       $f6, ($a0)
/* 9F9A4 8009EDA4 46043182 */  mul.s      $f6, $f6, $f4
/* 9F9A8 8009EDA8 C4820004 */  lwc1       $f2, 4($a0)
/* 9F9AC 8009EDAC 46041082 */  mul.s      $f2, $f2, $f4
/* 9F9B0 8009EDB0 C4800008 */  lwc1       $f0, 8($a0)
/* 9F9B4 8009EDB4 46040002 */  mul.s      $f0, $f0, $f4
/* 9F9B8 8009EDB8 E4A60000 */  swc1       $f6, ($a1)
/* 9F9BC 8009EDBC E4A20004 */  swc1       $f2, 4($a1)
/* 9F9C0 8009EDC0 E4A00008 */  swc1       $f0, 8($a1)
/* 9F9C4 8009EDC4 C484001C */  lwc1       $f4, 0x1c($a0)
/* 9F9C8 8009EDC8 C4860010 */  lwc1       $f6, 0x10($a0)
/* 9F9CC 8009EDCC 46043182 */  mul.s      $f6, $f6, $f4
/* 9F9D0 8009EDD0 C4820014 */  lwc1       $f2, 0x14($a0)
/* 9F9D4 8009EDD4 46041082 */  mul.s      $f2, $f2, $f4
/* 9F9D8 8009EDD8 C4800018 */  lwc1       $f0, 0x18($a0)
/* 9F9DC 8009EDDC 46040002 */  mul.s      $f0, $f0, $f4
/* 9F9E0 8009EDE0 E4A60010 */  swc1       $f6, 0x10($a1)
/* 9F9E4 8009EDE4 E4A20014 */  swc1       $f2, 0x14($a1)
/* 9F9E8 8009EDE8 E4A00018 */  swc1       $f0, 0x18($a1)
/* 9F9EC 8009EDEC C484002C */  lwc1       $f4, 0x2c($a0)
/* 9F9F0 8009EDF0 C4860020 */  lwc1       $f6, 0x20($a0)
/* 9F9F4 8009EDF4 46043182 */  mul.s      $f6, $f6, $f4
/* 9F9F8 8009EDF8 C4820024 */  lwc1       $f2, 0x24($a0)
/* 9F9FC 8009EDFC 46041082 */  mul.s      $f2, $f2, $f4
/* 9FA00 8009EE00 C4800028 */  lwc1       $f0, 0x28($a0)
/* 9FA04 8009EE04 46040002 */  mul.s      $f0, $f0, $f4
/* 9FA08 8009EE08 E4A60020 */  swc1       $f6, 0x20($a1)
/* 9FA0C 8009EE0C E4A20024 */  swc1       $f2, 0x24($a1)
/* 9FA10 8009EE10 E4A00028 */  swc1       $f0, 0x28($a1)
/* 9FA14 8009EE14 C4800030 */  lwc1       $f0, 0x30($a0)
/* 9FA18 8009EE18 E4A00030 */  swc1       $f0, 0x30($a1)
/* 9FA1C 8009EE1C C4820034 */  lwc1       $f2, 0x34($a0)
/* 9FA20 8009EE20 3C01800E */  lui        $at, %hi(D_800E2F3C)
/* 9FA24 8009EE24 C4202F3C */  lwc1       $f0, %lo(D_800E2F3C)($at)
/* 9FA28 8009EE28 E4A20034 */  swc1       $f2, 0x34($a1)
/* 9FA2C 8009EE2C C4840038 */  lwc1       $f4, 0x38($a0)
/* 9FA30 8009EE30 ACA0000C */  sw         $zero, 0xc($a1)
/* 9FA34 8009EE34 ACA0001C */  sw         $zero, 0x1c($a1)
/* 9FA38 8009EE38 ACA0002C */  sw         $zero, 0x2c($a1)
/* 9FA3C 8009EE3C E4A0003C */  swc1       $f0, 0x3c($a1)
/* 9FA40 8009EE40 03E00008 */  jr         $ra
/* 9FA44 8009EE44 E4A40038 */   swc1      $f4, 0x38($a1)

glabel func_8009EE48
/* 9FA48 8009EE48 10A4000D */  beq        $a1, $a0, .L8009EE80
/* 9FA4C 8009EE4C 00A01021 */   addu      $v0, $a1, $zero
/* 9FA50 8009EE50 24830040 */  addiu      $v1, $a0, 0x40
.L8009EE54:
/* 9FA54 8009EE54 8C860000 */  lw         $a2, ($a0)
/* 9FA58 8009EE58 8C870004 */  lw         $a3, 4($a0)
/* 9FA5C 8009EE5C 8C880008 */  lw         $t0, 8($a0)
/* 9FA60 8009EE60 8C89000C */  lw         $t1, 0xc($a0)
/* 9FA64 8009EE64 AC460000 */  sw         $a2, ($v0)
/* 9FA68 8009EE68 AC470004 */  sw         $a3, 4($v0)
/* 9FA6C 8009EE6C AC480008 */  sw         $t0, 8($v0)
/* 9FA70 8009EE70 AC49000C */  sw         $t1, 0xc($v0)
/* 9FA74 8009EE74 24840010 */  addiu      $a0, $a0, 0x10
/* 9FA78 8009EE78 1483FFF6 */  bne        $a0, $v1, .L8009EE54
/* 9FA7C 8009EE7C 24420010 */   addiu     $v0, $v0, 0x10
.L8009EE80:
/* 9FA80 8009EE80 3C01800E */  lui        $at, %hi(D_800E2F40)
/* 9FA84 8009EE84 C4202F40 */  lwc1       $f0, %lo(D_800E2F40)($at)
/* 9FA88 8009EE88 E4A0000C */  swc1       $f0, 0xc($a1)
/* 9FA8C 8009EE8C E4A0001C */  swc1       $f0, 0x1c($a1)
/* 9FA90 8009EE90 03E00008 */  jr         $ra
/* 9FA94 8009EE94 E4A0002C */   swc1      $f0, 0x2c($a1)

glabel func_8009EE98
/* 9FA98 8009EE98 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 9FA9C 8009EE9C AFB10054 */  sw         $s1, 0x54($sp)
/* 9FAA0 8009EEA0 00808821 */  addu       $s1, $a0, $zero
/* 9FAA4 8009EEA4 AFB20058 */  sw         $s2, 0x58($sp)
/* 9FAA8 8009EEA8 00A09021 */  addu       $s2, $a1, $zero
/* 9FAAC 8009EEAC AFB00050 */  sw         $s0, 0x50($sp)
/* 9FAB0 8009EEB0 3C10800F */  lui        $s0, %hi(D_800F54B0)
/* 9FAB4 8009EEB4 261054B0 */  addiu      $s0, $s0, %lo(D_800F54B0)
/* 9FAB8 8009EEB8 AFBF005C */  sw         $ra, 0x5c($sp)
/* 9FABC 8009EEBC 0C027B45 */  jal        some_caseSwitch
/* 9FAC0 8009EEC0 02002821 */   addu      $a1, $s0, $zero
/* 9FAC4 8009EEC4 27A40010 */  addiu      $a0, $sp, 0x10
/* 9FAC8 8009EEC8 02402821 */  addu       $a1, $s2, $zero
/* 9FACC 8009EECC 0C02B002 */  jal        some_float_array_func
/* 9FAD0 8009EED0 02003021 */   addu      $a2, $s0, $zero
/* 9FAD4 8009EED4 8E25000C */  lw         $a1, 0xc($s1)
/* 9FAD8 8009EED8 27A40010 */  addiu      $a0, $sp, 0x10
/* 9FADC 8009EEDC 0C027B67 */  jal        func_8009ED9C
/* 9FAE0 8009EEE0 24A500C0 */   addiu     $a1, $a1, 0xc0
/* 9FAE4 8009EEE4 8E320004 */  lw         $s2, 4($s1)
/* 9FAE8 8009EEE8 96220000 */  lhu        $v0, ($s1)
/* 9FAEC 8009EEEC 92300003 */  lbu        $s0, 3($s1)
/* 9FAF0 8009EEF0 3042FFFD */  andi       $v0, $v0, 0xfffd
/* 9FAF4 8009EEF4 34420010 */  ori        $v0, $v0, 0x10
/* 9FAF8 8009EEF8 12000008 */  beqz       $s0, .L8009EF1C
/* 9FAFC 8009EEFC A6220000 */   sh        $v0, ($s1)
/* 9FB00 8009EF00 8E440000 */  lw         $a0, ($s2)
.L8009EF04:
/* 9FB04 8009EF04 27A50010 */  addiu      $a1, $sp, 0x10
/* 9FB08 8009EF08 2610FFFF */  addiu      $s0, $s0, -1
/* 9FB0C 8009EF0C 0C027BA6 */  jal        func_8009EE98
/* 9FB10 8009EF10 26520004 */   addiu     $s2, $s2, 4
/* 9FB14 8009EF14 5600FFFB */  bnel       $s0, $zero, .L8009EF04
/* 9FB18 8009EF18 8E440000 */   lw        $a0, ($s2)
.L8009EF1C:
/* 9FB1C 8009EF1C 8FBF005C */  lw         $ra, 0x5c($sp)
/* 9FB20 8009EF20 8FB20058 */  lw         $s2, 0x58($sp)
/* 9FB24 8009EF24 8FB10054 */  lw         $s1, 0x54($sp)
/* 9FB28 8009EF28 8FB00050 */  lw         $s0, 0x50($sp)
/* 9FB2C 8009EF2C 03E00008 */  jr         $ra
/* 9FB30 8009EF30 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8009EF34
/* 9FB34 8009EF34 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9FB38 8009EF38 AFB10014 */  sw         $s1, 0x14($sp)
/* 9FB3C 8009EF3C 00808821 */  addu       $s1, $a0, $zero
/* 9FB40 8009EF40 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9FB44 8009EF44 AFB00010 */  sw         $s0, 0x10($sp)
/* 9FB48 8009EF48 8E2201F4 */  lw         $v0, 0x1f4($s1)
/* 9FB4C 8009EF4C 30420004 */  andi       $v0, $v0, 4
/* 9FB50 8009EF50 10400011 */  beqz       $v0, .L8009EF98
/* 9FB54 8009EF54 3C02800F */   lui       $v0, %hi(some_mtx)
/* 9FB58 8009EF58 244454F0 */  addiu      $a0, $v0, %lo(some_mtx)
/* 9FB5C 8009EF5C 26230088 */  addiu      $v1, $s1, 0x88
/* 9FB60 8009EF60 262600C8 */  addiu      $a2, $s1, 0xc8
.L8009EF64:
/* 9FB64 8009EF64 8C650000 */  lw         $a1, ($v1)
/* 9FB68 8009EF68 8C670004 */  lw         $a3, 4($v1)
/* 9FB6C 8009EF6C 8C680008 */  lw         $t0, 8($v1)
/* 9FB70 8009EF70 8C69000C */  lw         $t1, 0xc($v1)
/* 9FB74 8009EF74 AC850000 */  sw         $a1, ($a0)
/* 9FB78 8009EF78 AC870004 */  sw         $a3, 4($a0)
/* 9FB7C 8009EF7C AC880008 */  sw         $t0, 8($a0)
/* 9FB80 8009EF80 AC89000C */  sw         $t1, 0xc($a0)
/* 9FB84 8009EF84 24630010 */  addiu      $v1, $v1, 0x10
/* 9FB88 8009EF88 1466FFF6 */  bne        $v1, $a2, .L8009EF64
/* 9FB8C 8009EF8C 24840010 */   addiu     $a0, $a0, 0x10
/* 9FB90 8009EF90 08027BEB */  j          .L8009EFAC
/* 9FB94 8009EF94 02202021 */   addu      $a0, $s1, $zero
.L8009EF98:
/* 9FB98 8009EF98 3C10800F */  lui        $s0, %hi(some_mtx)
/* 9FB9C 8009EF9C 0C0311DC */  jal        guMtxIdentF
/* 9FBA0 8009EFA0 260454F0 */   addiu     $a0, $s0, %lo(some_mtx)
/* 9FBA4 8009EFA4 02001021 */  addu       $v0, $s0, $zero
/* 9FBA8 8009EFA8 02202021 */  addu       $a0, $s1, $zero
.L8009EFAC:
/* 9FBAC 8009EFAC 0C027C18 */  jal        func_8009F060
/* 9FBB0 8009EFB0 244554F0 */   addiu     $a1, $v0, 0x54f0
/* 9FBB4 8009EFB4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9FBB8 8009EFB8 24020001 */  addiu      $v0, $zero, 1
/* 9FBBC 8009EFBC A22202AC */  sb         $v0, 0x2ac($s1)
/* 9FBC0 8009EFC0 8FB10014 */  lw         $s1, 0x14($sp)
/* 9FBC4 8009EFC4 8FB00010 */  lw         $s0, 0x10($sp)
/* 9FBC8 8009EFC8 03E00008 */  jr         $ra
/* 9FBCC 8009EFCC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009EFD0
/* 9FBD0 8009EFD0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9FBD4 8009EFD4 AFB10014 */  sw         $s1, 0x14($sp)
/* 9FBD8 8009EFD8 00808821 */  addu       $s1, $a0, $zero
/* 9FBDC 8009EFDC AFBF0018 */  sw         $ra, 0x18($sp)
/* 9FBE0 8009EFE0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9FBE4 8009EFE4 8E2201F4 */  lw         $v0, 0x1f4($s1)
/* 9FBE8 8009EFE8 30420004 */  andi       $v0, $v0, 4
/* 9FBEC 8009EFEC 10400006 */  beqz       $v0, .L8009F008
/* 9FBF0 8009EFF0 3C10800F */   lui       $s0, %hi(unused_matrix)
/* 9FBF4 8009EFF4 26045530 */  addiu      $a0, $s0, %lo(unused_matrix)
/* 9FBF8 8009EFF8 0C02AF65 */  jal        ofunc_sub_800abd94
/* 9FBFC 8009EFFC 26260088 */   addiu     $a2, $s1, 0x88
/* 9FC00 8009F000 08027C10 */  j          .L8009F040
/* 9FC04 8009F004 02001021 */   addu      $v0, $s0, $zero
.L8009F008:
/* 9FC08 8009F008 3C02800F */  lui        $v0, %hi(unused_matrix)
/* 9FC0C 8009F00C 24435530 */  addiu      $v1, $v0, %lo(unused_matrix)
/* 9FC10 8009F010 24A40040 */  addiu      $a0, $a1, 0x40
.L8009F014:
/* 9FC14 8009F014 8CA60000 */  lw         $a2, ($a1)
/* 9FC18 8009F018 8CA70004 */  lw         $a3, 4($a1)
/* 9FC1C 8009F01C 8CA80008 */  lw         $t0, 8($a1)
/* 9FC20 8009F020 8CA9000C */  lw         $t1, 0xc($a1)
/* 9FC24 8009F024 AC660000 */  sw         $a2, ($v1)
/* 9FC28 8009F028 AC670004 */  sw         $a3, 4($v1)
/* 9FC2C 8009F02C AC680008 */  sw         $t0, 8($v1)
/* 9FC30 8009F030 AC69000C */  sw         $t1, 0xc($v1)
/* 9FC34 8009F034 24A50010 */  addiu      $a1, $a1, 0x10
/* 9FC38 8009F038 14A4FFF6 */  bne        $a1, $a0, .L8009F014
/* 9FC3C 8009F03C 24630010 */   addiu     $v1, $v1, 0x10
.L8009F040:
/* 9FC40 8009F040 02202021 */  addu       $a0, $s1, $zero
/* 9FC44 8009F044 0C027C18 */  jal        func_8009F060
/* 9FC48 8009F048 24455530 */   addiu     $a1, $v0, 0x5530
/* 9FC4C 8009F04C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9FC50 8009F050 8FB10014 */  lw         $s1, 0x14($sp)
/* 9FC54 8009F054 8FB00010 */  lw         $s0, 0x10($sp)
/* 9FC58 8009F058 03E00008 */  jr         $ra
/* 9FC5C 8009F05C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009F060
/* 9FC60 8009F060 27BDFE20 */  addiu      $sp, $sp, -0x1e0
/* 9FC64 8009F064 27A30020 */  addiu      $v1, $sp, 0x20
/* 9FC68 8009F068 AFB601C8 */  sw         $s6, 0x1c8($sp)
/* 9FC6C 8009F06C 0080B021 */  addu       $s6, $a0, $zero
/* 9FC70 8009F070 AFBF01D4 */  sw         $ra, 0x1d4($sp)
/* 9FC74 8009F074 AFBE01D0 */  sw         $fp, 0x1d0($sp)
/* 9FC78 8009F078 AFB701CC */  sw         $s7, 0x1cc($sp)
/* 9FC7C 8009F07C AFB501C4 */  sw         $s5, 0x1c4($sp)
/* 9FC80 8009F080 AFB401C0 */  sw         $s4, 0x1c0($sp)
/* 9FC84 8009F084 AFB301BC */  sw         $s3, 0x1bc($sp)
/* 9FC88 8009F088 AFB201B8 */  sw         $s2, 0x1b8($sp)
/* 9FC8C 8009F08C AFB101B4 */  sw         $s1, 0x1b4($sp)
/* 9FC90 8009F090 AFB001B0 */  sw         $s0, 0x1b0($sp)
/* 9FC94 8009F094 F7B401D8 */  sdc1       $f20, 0x1d8($sp)
/* 9FC98 8009F098 8EC20000 */  lw         $v0, ($s6)
/* 9FC9C 8009F09C 24A40040 */  addiu      $a0, $a1, 0x40
/* 9FCA0 8009F0A0 24420010 */  addiu      $v0, $v0, 0x10
/* 9FCA4 8009F0A4 AFA201A0 */  sw         $v0, 0x1a0($sp)
.L8009F0A8:
/* 9FCA8 8009F0A8 8CA20000 */  lw         $v0, ($a1)
/* 9FCAC 8009F0AC 8CA60004 */  lw         $a2, 4($a1)
/* 9FCB0 8009F0B0 8CA70008 */  lw         $a3, 8($a1)
/* 9FCB4 8009F0B4 8CA8000C */  lw         $t0, 0xc($a1)
/* 9FCB8 8009F0B8 AC620000 */  sw         $v0, ($v1)
/* 9FCBC 8009F0BC AC660004 */  sw         $a2, 4($v1)
/* 9FCC0 8009F0C0 AC670008 */  sw         $a3, 8($v1)
/* 9FCC4 8009F0C4 AC68000C */  sw         $t0, 0xc($v1)
/* 9FCC8 8009F0C8 24A50010 */  addiu      $a1, $a1, 0x10
/* 9FCCC 8009F0CC 14A4FFF6 */  bne        $a1, $a0, .L8009F0A8
/* 9FCD0 8009F0D0 24630010 */   addiu     $v1, $v1, 0x10
/* 9FCD4 8009F0D4 27A40020 */  addiu      $a0, $sp, 0x20
/* 9FCD8 8009F0D8 0C027B92 */  jal        func_8009EE48
/* 9FCDC 8009F0DC 00802821 */   addu      $a1, $a0, $zero
/* 9FCE0 8009F0E0 8FA901A0 */  lw         $t1, 0x1a0($sp)
/* 9FCE4 8009F0E4 8D340018 */  lw         $s4, 0x18($t1)
/* 9FCE8 8009F0E8 8D220024 */  lw         $v0, 0x24($t1)
/* 9FCEC 8009F0EC 104000B1 */  beqz       $v0, .L8009F3B4
/* 9FCF0 8009F0F0 8D350000 */   lw        $s5, ($t1)
/* 9FCF4 8009F0F4 269E0040 */  addiu      $fp, $s4, 0x40
/* 9FCF8 8009F0F8 8EC301F4 */  lw         $v1, 0x1f4($s6)
/* 9FCFC 8009F0FC 30620040 */  andi       $v0, $v1, 0x40
/* 9FD00 8009F100 144000A9 */  bnez       $v0, .L8009F3A8
/* 9FD04 8009F104 26B7FFFF */   addiu     $s7, $s5, -1
/* 9FD08 8009F108 30620008 */  andi       $v0, $v1, 8
/* 9FD0C 8009F10C 1040001A */  beqz       $v0, .L8009F178
/* 9FD10 8009F110 30620010 */   andi      $v0, $v1, 0x10
/* 9FD14 8009F114 10400008 */  beqz       $v0, .L8009F138
/* 9FD18 8009F118 26D100C8 */   addiu     $s1, $s6, 0xc8
/* 9FD1C 8009F11C 02202021 */  addu       $a0, $s1, $zero
/* 9FD20 8009F120 27B00120 */  addiu      $s0, $sp, 0x120
/* 9FD24 8009F124 0C027B92 */  jal        func_8009EE48
/* 9FD28 8009F128 02002821 */   addu      $a1, $s0, $zero
/* 9FD2C 8009F12C 02209821 */  addu       $s3, $s1, $zero
/* 9FD30 8009F130 08027C74 */  j          .L8009F1D0
/* 9FD34 8009F134 02002021 */   addu      $a0, $s0, $zero
.L8009F138:
/* 9FD38 8009F138 02802021 */  addu       $a0, $s4, $zero
/* 9FD3C 8009F13C 27B200A0 */  addiu      $s2, $sp, 0xa0
/* 9FD40 8009F140 0C027B45 */  jal        some_caseSwitch
/* 9FD44 8009F144 02402821 */   addu      $a1, $s2, $zero
/* 9FD48 8009F148 26D300C8 */  addiu      $s3, $s6, 0xc8
/* 9FD4C 8009F14C 02602021 */  addu       $a0, $s3, $zero
/* 9FD50 8009F150 27B00060 */  addiu      $s0, $sp, 0x60
/* 9FD54 8009F154 0C027B92 */  jal        func_8009EE48
/* 9FD58 8009F158 02002821 */   addu      $a1, $s0, $zero
/* 9FD5C 8009F15C 27B10120 */  addiu      $s1, $sp, 0x120
/* 9FD60 8009F160 02202021 */  addu       $a0, $s1, $zero
/* 9FD64 8009F164 02402821 */  addu       $a1, $s2, $zero
/* 9FD68 8009F168 0C02B002 */  jal        some_float_array_func
/* 9FD6C 8009F16C 02003021 */   addu      $a2, $s0, $zero
/* 9FD70 8009F170 08027C74 */  j          .L8009F1D0
/* 9FD74 8009F174 02202021 */   addu      $a0, $s1, $zero
.L8009F178:
/* 9FD78 8009F178 1040000A */  beqz       $v0, .L8009F1A4
/* 9FD7C 8009F17C 26D000C8 */   addiu     $s0, $s6, 0xc8
/* 9FD80 8009F180 02802021 */  addu       $a0, $s4, $zero
/* 9FD84 8009F184 0C027B45 */  jal        some_caseSwitch
/* 9FD88 8009F188 02002821 */   addu      $a1, $s0, $zero
/* 9FD8C 8009F18C 02002021 */  addu       $a0, $s0, $zero
/* 9FD90 8009F190 27B10120 */  addiu      $s1, $sp, 0x120
/* 9FD94 8009F194 0C027B92 */  jal        func_8009EE48
/* 9FD98 8009F198 02202821 */   addu      $a1, $s1, $zero
/* 9FD9C 8009F19C 08027C73 */  j          .L8009F1CC
/* 9FDA0 8009F1A0 02009821 */   addu      $s3, $s0, $zero
.L8009F1A4:
/* 9FDA4 8009F1A4 02802021 */  addu       $a0, $s4, $zero
/* 9FDA8 8009F1A8 27B000A0 */  addiu      $s0, $sp, 0xa0
/* 9FDAC 8009F1AC 0C027B45 */  jal        some_caseSwitch
/* 9FDB0 8009F1B0 02002821 */   addu      $a1, $s0, $zero
/* 9FDB4 8009F1B4 27B10120 */  addiu      $s1, $sp, 0x120
/* 9FDB8 8009F1B8 02202021 */  addu       $a0, $s1, $zero
/* 9FDBC 8009F1BC 27A50020 */  addiu      $a1, $sp, 0x20
/* 9FDC0 8009F1C0 0C02B002 */  jal        some_float_array_func
/* 9FDC4 8009F1C4 02003021 */   addu      $a2, $s0, $zero
/* 9FDC8 8009F1C8 26D300C8 */  addiu      $s3, $s6, 0xc8
.L8009F1CC:
/* 9FDCC 8009F1CC 02202021 */  addu       $a0, $s1, $zero
.L8009F1D0:
/* 9FDD0 8009F1D0 269E0040 */  addiu      $fp, $s4, 0x40
/* 9FDD4 8009F1D4 8E85000C */  lw         $a1, 0xc($s4)
/* 9FDD8 8009F1D8 26B7FFFF */  addiu      $s7, $s5, -1
/* 9FDDC 8009F1DC 0C027B67 */  jal        func_8009ED9C
/* 9FDE0 8009F1E0 24A500C0 */   addiu     $a1, $a1, 0xc0
/* 9FDE4 8009F1E4 26C50108 */  addiu      $a1, $s6, 0x108
/* 9FDE8 8009F1E8 26D50148 */  addiu      $s5, $s6, 0x148
/* 9FDEC 8009F1EC 27B20160 */  addiu      $s2, $sp, 0x160
/* 9FDF0 8009F1F0 26C20188 */  addiu      $v0, $s6, 0x188
/* 9FDF4 8009F1F4 27A301A0 */  addiu      $v1, $sp, 0x1a0
/* 9FDF8 8009F1F8 AFA201A8 */  sw         $v0, 0x1a8($sp)
/* 9FDFC 8009F1FC AFA301A4 */  sw         $v1, 0x1a4($sp)
/* 9FE00 8009F200 8E82000C */  lw         $v0, 0xc($s4)
/* 9FE04 8009F204 27B100E0 */  addiu      $s1, $sp, 0xe0
/* 9FE08 8009F208 24440080 */  addiu      $a0, $v0, 0x80
/* 9FE0C 8009F20C 244300C0 */  addiu      $v1, $v0, 0xc0
/* 9FE10 8009F210 24420100 */  addiu      $v0, $v0, 0x100
.L8009F214:
/* 9FE14 8009F214 8C660000 */  lw         $a2, ($v1)
/* 9FE18 8009F218 8C670004 */  lw         $a3, 4($v1)
/* 9FE1C 8009F21C 8C680008 */  lw         $t0, 8($v1)
/* 9FE20 8009F220 8C69000C */  lw         $t1, 0xc($v1)
/* 9FE24 8009F224 AC860000 */  sw         $a2, ($a0)
/* 9FE28 8009F228 AC870004 */  sw         $a3, 4($a0)
/* 9FE2C 8009F22C AC880008 */  sw         $t0, 8($a0)
/* 9FE30 8009F230 AC89000C */  sw         $t1, 0xc($a0)
/* 9FE34 8009F234 24630010 */  addiu      $v1, $v1, 0x10
/* 9FE38 8009F238 1462FFF6 */  bne        $v1, $v0, .L8009F214
/* 9FE3C 8009F23C 24840010 */   addiu     $a0, $a0, 0x10
/* 9FE40 8009F240 8E82000C */  lw         $v0, 0xc($s4)
/* 9FE44 8009F244 02608021 */  addu       $s0, $s3, $zero
/* 9FE48 8009F248 24430080 */  addiu      $v1, $v0, 0x80
/* 9FE4C 8009F24C 244200C0 */  addiu      $v0, $v0, 0xc0
.L8009F250:
/* 9FE50 8009F250 8C640000 */  lw         $a0, ($v1)
/* 9FE54 8009F254 8C660004 */  lw         $a2, 4($v1)
/* 9FE58 8009F258 8C670008 */  lw         $a3, 8($v1)
/* 9FE5C 8009F25C 8C68000C */  lw         $t0, 0xc($v1)
/* 9FE60 8009F260 AE040000 */  sw         $a0, ($s0)
/* 9FE64 8009F264 AE060004 */  sw         $a2, 4($s0)
/* 9FE68 8009F268 AE070008 */  sw         $a3, 8($s0)
/* 9FE6C 8009F26C AE08000C */  sw         $t0, 0xc($s0)
/* 9FE70 8009F270 24630010 */  addiu      $v1, $v1, 0x10
/* 9FE74 8009F274 1462FFF6 */  bne        $v1, $v0, .L8009F250
/* 9FE78 8009F278 26100010 */   addiu     $s0, $s0, 0x10
/* 9FE7C 8009F27C 8E84000C */  lw         $a0, 0xc($s4)
/* 9FE80 8009F280 0C02AE20 */  jal        func_800AB880
/* 9FE84 8009F284 248400C0 */   addiu     $a0, $a0, 0xc0
/* 9FE88 8009F288 8E82000C */  lw         $v0, 0xc($s4)
/* 9FE8C 8009F28C 3C01800E */  lui        $at, %hi(D_800E2F44)
/* 9FE90 8009F290 C4342F44 */  lwc1       $f20, %lo(D_800E2F44)($at)
/* 9FE94 8009F294 C44400B0 */  lwc1       $f4, 0xb0($v0)
/* 9FE98 8009F298 46142102 */  mul.s      $f4, $f4, $f20
/* 9FE9C 8009F29C C44200B4 */  lwc1       $f2, 0xb4($v0)
/* 9FEA0 8009F2A0 46141082 */  mul.s      $f2, $f2, $f20
/* 9FEA4 8009F2A4 C44000B8 */  lwc1       $f0, 0xb8($v0)
/* 9FEA8 8009F2A8 46140002 */  mul.s      $f0, $f0, $f20
/* 9FEAC 8009F2AC 02A02821 */  addu       $a1, $s5, $zero
/* 9FEB0 8009F2B0 24440080 */  addiu      $a0, $v0, 0x80
/* 9FEB4 8009F2B4 E44400B0 */  swc1       $f4, 0xb0($v0)
/* 9FEB8 8009F2B8 E44200B4 */  swc1       $f2, 0xb4($v0)
/* 9FEBC 8009F2BC 0C02AE20 */  jal        func_800AB880
/* 9FEC0 8009F2C0 E44000B8 */   swc1      $f0, 0xb8($v0)
/* 9FEC4 8009F2C4 8FA901A0 */  lw         $t1, 0x1a0($sp)
/* 9FEC8 8009F2C8 8D300024 */  lw         $s0, 0x24($t1)
/* 9FECC 8009F2CC C6020018 */  lwc1       $f2, 0x18($s0)
/* 9FED0 8009F2D0 46141082 */  mul.s      $f2, $f2, $f20
/* 9FED4 8009F2D4 02402021 */  addu       $a0, $s2, $zero
/* 9FED8 8009F2D8 96820000 */  lhu        $v0, ($s4)
/* 9FEDC 8009F2DC C600001C */  lwc1       $f0, 0x1c($s0)
/* 9FEE0 8009F2E0 3C01800E */  lui        $at, %hi(D_800E2F48)
/* 9FEE4 8009F2E4 C4242F48 */  lwc1       $f4, %lo(D_800E2F48)($at)
/* 9FEE8 8009F2E8 46140002 */  mul.s      $f0, $f0, $f20
/* 9FEEC 8009F2EC 34420002 */  ori        $v0, $v0, 2
/* 9FEF0 8009F2F0 A6820000 */  sh         $v0, ($s4)
/* 9FEF4 8009F2F4 E7A40018 */  swc1       $f4, 0x18($sp)
/* 9FEF8 8009F2F8 E7A20010 */  swc1       $f2, 0x10($sp)
/* 9FEFC 8009F2FC E7A00014 */  swc1       $f0, 0x14($sp)
/* 9FF00 8009F300 92C501FB */  lbu        $a1, 0x1fb($s6)
/* 9FF04 8009F304 8E060014 */  lw         $a2, 0x14($s0)
/* 9FF08 8009F308 8E070024 */  lw         $a3, 0x24($s0)
/* 9FF0C 8009F30C 00052840 */  sll        $a1, $a1, 1
/* 9FF10 8009F310 24A50008 */  addiu      $a1, $a1, 8
/* 9FF14 8009F314 0C031270 */  jal        guPerspectiveF
/* 9FF18 8009F318 02052821 */   addu      $a1, $s0, $a1
/* 9FF1C 8009F31C 02401821 */  addu       $v1, $s2, $zero
/* 9FF20 8009F320 8FA201A8 */  lw         $v0, 0x1a8($sp)
.L8009F324:
/* 9FF24 8009F324 8C640000 */  lw         $a0, ($v1)
/* 9FF28 8009F328 8C650004 */  lw         $a1, 4($v1)
/* 9FF2C 8009F32C 8C660008 */  lw         $a2, 8($v1)
/* 9FF30 8009F330 8C67000C */  lw         $a3, 0xc($v1)
/* 9FF34 8009F334 AC440000 */  sw         $a0, ($v0)
/* 9FF38 8009F338 AC450004 */  sw         $a1, 4($v0)
/* 9FF3C 8009F33C AC460008 */  sw         $a2, 8($v0)
/* 9FF40 8009F340 AC47000C */  sw         $a3, 0xc($v0)
/* 9FF44 8009F344 24630010 */  addiu      $v1, $v1, 0x10
/* 9FF48 8009F348 8FA801A4 */  lw         $t0, 0x1a4($sp)
/* 9FF4C 8009F34C 1468FFF5 */  bne        $v1, $t0, .L8009F324
/* 9FF50 8009F350 24420010 */   addiu     $v0, $v0, 0x10
/* 9FF54 8009F354 02202021 */  addu       $a0, $s1, $zero
/* 9FF58 8009F358 02402821 */  addu       $a1, $s2, $zero
/* 9FF5C 8009F35C 0C02B127 */  jal        some_oher_matrix_math
/* 9FF60 8009F360 02A03021 */   addu      $a2, $s5, $zero
/* 9FF64 8009F364 8EC201F4 */  lw         $v0, 0x1f4($s6)
/* 9FF68 8009F368 30424000 */  andi       $v0, $v0, 0x4000
/* 9FF6C 8009F36C 10400008 */  beqz       $v0, .L8009F390
/* 9FF70 8009F370 02402021 */   addu      $a0, $s2, $zero
/* 9FF74 8009F374 92C501FB */  lbu        $a1, 0x1fb($s6)
/* 9FF78 8009F378 8E02002C */  lw         $v0, 0x2c($s0)
/* 9FF7C 8009F37C 00052980 */  sll        $a1, $a1, 6
/* 9FF80 8009F380 0C03118C */  jal        guMtxF2L
/* 9FF84 8009F384 00452821 */   addu      $a1, $v0, $a1
/* 9FF88 8009F388 08027CEB */  j          .L8009F3AC
/* 9FF8C 8009F38C 03C0A021 */   addu      $s4, $fp, $zero
.L8009F390:
/* 9FF90 8009F390 02202021 */  addu       $a0, $s1, $zero
/* 9FF94 8009F394 92C501FB */  lbu        $a1, 0x1fb($s6)
/* 9FF98 8009F398 8E02002C */  lw         $v0, 0x2c($s0)
/* 9FF9C 8009F39C 00052980 */  sll        $a1, $a1, 6
/* 9FFA0 8009F3A0 0C03118C */  jal        guMtxF2L
/* 9FFA4 8009F3A4 00452821 */   addu      $a1, $v0, $a1
.L8009F3A8:
/* 9FFA8 8009F3A8 03C0A021 */  addu       $s4, $fp, $zero
.L8009F3AC:
/* 9FFAC 8009F3AC 02E0A821 */  addu       $s5, $s7, $zero
/* 9FFB0 8009F3B0 8FA901A0 */  lw         $t1, 0x1a0($sp)
.L8009F3B4:
/* 9FFB4 8009F3B4 8D220004 */  lw         $v0, 4($t1)
/* 9FFB8 8009F3B8 10400030 */  beqz       $v0, .L8009F47C
/* 9FFBC 8009F3BC 2450FFFF */   addiu     $s0, $v0, -1
/* 9FFC0 8009F3C0 5200002F */  beql       $s0, $zero, .L8009F480
/* 9FFC4 8009F3C4 02A08021 */   addu      $s0, $s5, $zero
/* 9FFC8 8009F3C8 27B200A0 */  addiu      $s2, $sp, 0xa0
.L8009F3CC:
/* 9FFCC 8009F3CC 8EC201F4 */  lw         $v0, 0x1f4($s6)
/* 9FFD0 8009F3D0 30420020 */  andi       $v0, $v0, 0x20
/* 9FFD4 8009F3D4 10400005 */  beqz       $v0, .L8009F3EC
/* 9FFD8 8009F3D8 02802021 */   addu      $a0, $s4, $zero
/* 9FFDC 8009F3DC 0C027B45 */  jal        some_caseSwitch
/* 9FFE0 8009F3E0 27A500E0 */   addiu     $a1, $sp, 0xe0
/* 9FFE4 8009F3E4 08027D02 */  j          .L8009F408
/* 9FFE8 8009F3E8 27B100E0 */   addiu     $s1, $sp, 0xe0
.L8009F3EC:
/* 9FFEC 8009F3EC 0C027B45 */  jal        some_caseSwitch
/* 9FFF0 8009F3F0 02402821 */   addu      $a1, $s2, $zero
/* 9FFF4 8009F3F4 27A400E0 */  addiu      $a0, $sp, 0xe0
/* 9FFF8 8009F3F8 27A50020 */  addiu      $a1, $sp, 0x20
/* 9FFFC 8009F3FC 0C02B002 */  jal        some_float_array_func
/* A0000 8009F400 02403021 */   addu      $a2, $s2, $zero
/* A0004 8009F404 27B100E0 */  addiu      $s1, $sp, 0xe0
.L8009F408:
/* A0008 8009F408 02202021 */  addu       $a0, $s1, $zero
/* A000C 8009F40C 269E0040 */  addiu      $fp, $s4, 0x40
/* A0010 8009F410 8E85000C */  lw         $a1, 0xc($s4)
/* A0014 8009F414 26B7FFFF */  addiu      $s7, $s5, -1
/* A0018 8009F418 0C027B67 */  jal        func_8009ED9C
/* A001C 8009F41C 24A50080 */   addiu     $a1, $a1, 0x80
/* A0020 8009F420 8E82000C */  lw         $v0, 0xc($s4)
/* A0024 8009F424 2605FFFF */  addiu      $a1, $s0, -1
/* A0028 8009F428 244300C0 */  addiu      $v1, $v0, 0xc0
/* A002C 8009F42C 24420080 */  addiu      $v0, $v0, 0x80
/* A0030 8009F430 00602021 */  addu       $a0, $v1, $zero
.L8009F434:
/* A0034 8009F434 8C460000 */  lw         $a2, ($v0)
/* A0038 8009F438 8C470004 */  lw         $a3, 4($v0)
/* A003C 8009F43C 8C480008 */  lw         $t0, 8($v0)
/* A0040 8009F440 8C49000C */  lw         $t1, 0xc($v0)
/* A0044 8009F444 AC660000 */  sw         $a2, ($v1)
/* A0048 8009F448 AC670004 */  sw         $a3, 4($v1)
/* A004C 8009F44C AC680008 */  sw         $t0, 8($v1)
/* A0050 8009F450 AC69000C */  sw         $t1, 0xc($v1)
/* A0054 8009F454 24420010 */  addiu      $v0, $v0, 0x10
/* A0058 8009F458 1444FFF6 */  bne        $v0, $a0, .L8009F434
/* A005C 8009F45C 24630010 */   addiu     $v1, $v1, 0x10
/* A0060 8009F460 00A08021 */  addu       $s0, $a1, $zero
/* A0064 8009F464 96820000 */  lhu        $v0, ($s4)
/* A0068 8009F468 02E0A821 */  addu       $s5, $s7, $zero
/* A006C 8009F46C 34420002 */  ori        $v0, $v0, 2
/* A0070 8009F470 A6820000 */  sh         $v0, ($s4)
/* A0074 8009F474 1600FFD5 */  bnez       $s0, .L8009F3CC
/* A0078 8009F478 03C0A021 */   addu      $s4, $fp, $zero
.L8009F47C:
/* A007C 8009F47C 02A08021 */  addu       $s0, $s5, $zero
.L8009F480:
/* A0080 8009F480 1200000B */  beqz       $s0, .L8009F4B0
/* A0084 8009F484 8FBF01D4 */   lw        $ra, 0x1d4($sp)
.L8009F488:
/* A0088 8009F488 96820000 */  lhu        $v0, ($s4)
/* A008C 8009F48C 30420100 */  andi       $v0, $v0, 0x100
/* A0090 8009F490 10400003 */  beqz       $v0, .L8009F4A0
/* A0094 8009F494 02802021 */   addu      $a0, $s4, $zero
/* A0098 8009F498 0C027BA6 */  jal        func_8009EE98
/* A009C 8009F49C 27A50020 */   addiu     $a1, $sp, 0x20
.L8009F4A0:
/* A00A0 8009F4A0 2610FFFF */  addiu      $s0, $s0, -1
/* A00A4 8009F4A4 1600FFF8 */  bnez       $s0, .L8009F488
/* A00A8 8009F4A8 26940040 */   addiu     $s4, $s4, 0x40
/* A00AC 8009F4AC 8FBF01D4 */  lw         $ra, 0x1d4($sp)
.L8009F4B0:
/* A00B0 8009F4B0 8FBE01D0 */  lw         $fp, 0x1d0($sp)
/* A00B4 8009F4B4 8FB701CC */  lw         $s7, 0x1cc($sp)
/* A00B8 8009F4B8 8FB601C8 */  lw         $s6, 0x1c8($sp)
/* A00BC 8009F4BC 8FB501C4 */  lw         $s5, 0x1c4($sp)
/* A00C0 8009F4C0 8FB401C0 */  lw         $s4, 0x1c0($sp)
/* A00C4 8009F4C4 8FB301BC */  lw         $s3, 0x1bc($sp)
/* A00C8 8009F4C8 8FB201B8 */  lw         $s2, 0x1b8($sp)
/* A00CC 8009F4CC 8FB101B4 */  lw         $s1, 0x1b4($sp)
/* A00D0 8009F4D0 8FB001B0 */  lw         $s0, 0x1b0($sp)
/* A00D4 8009F4D4 D7B401D8 */  ldc1       $f20, 0x1d8($sp)
/* A00D8 8009F4D8 03E00008 */  jr         $ra
/* A00DC 8009F4DC 27BD01E0 */   addiu     $sp, $sp, 0x1e0

glabel func_8009F4E0
/* A00E0 8009F4E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A00E4 8009F4E4 AFBF001C */  sw         $ra, 0x1c($sp)
/* A00E8 8009F4E8 AFB20018 */  sw         $s2, 0x18($sp)
/* A00EC 8009F4EC AFB10014 */  sw         $s1, 0x14($sp)
/* A00F0 8009F4F0 AFB00010 */  sw         $s0, 0x10($sp)
/* A00F4 8009F4F4 8C820000 */  lw         $v0, ($a0)
/* A00F8 8009F4F8 8C500028 */  lw         $s0, 0x28($v0)
/* A00FC 8009F4FC 8C430010 */  lw         $v1, 0x10($v0)
/* A0100 8009F500 1860000E */  blez       $v1, .L8009F53C
/* A0104 8009F504 908201FB */   lbu       $v0, 0x1fb($a0)
/* A0108 8009F508 00029180 */  sll        $s2, $v0, 6
/* A010C 8009F50C 00608821 */  addu       $s1, $v1, $zero
.L8009F510:
/* A0110 8009F510 96020000 */  lhu        $v0, ($s0)
/* A0114 8009F514 30420002 */  andi       $v0, $v0, 2
/* A0118 8009F518 50400006 */  beql       $v0, $zero, .L8009F534
/* A011C 8009F51C 2631FFFF */   addiu     $s1, $s1, -1
/* A0120 8009F520 8E05000C */  lw         $a1, 0xc($s0)
/* A0124 8009F524 24A40080 */  addiu      $a0, $a1, 0x80
/* A0128 8009F528 0C03118C */  jal        guMtxF2L
/* A012C 8009F52C 00B22821 */   addu      $a1, $a1, $s2
/* A0130 8009F530 2631FFFF */  addiu      $s1, $s1, -1
.L8009F534:
/* A0134 8009F534 1620FFF6 */  bnez       $s1, .L8009F510
/* A0138 8009F538 26100040 */   addiu     $s0, $s0, 0x40
.L8009F53C:
/* A013C 8009F53C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A0140 8009F540 8FB20018 */  lw         $s2, 0x18($sp)
/* A0144 8009F544 8FB10014 */  lw         $s1, 0x14($sp)
/* A0148 8009F548 8FB00010 */  lw         $s0, 0x10($sp)
/* A014C 8009F54C 03E00008 */  jr         $ra
/* A0150 8009F550 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009F554
/* A0154 8009F554 8C820000 */  lw         $v0, ($a0)
/* A0158 8009F558 8C440028 */  lw         $a0, 0x28($v0)
/* A015C 8009F55C 8C420010 */  lw         $v0, 0x10($v0)
/* A0160 8009F560 18400027 */  blez       $v0, .L8009F600
/* A0164 8009F564 00403021 */   addu      $a2, $v0, $zero
/* A0168 8009F568 3C01800E */  lui        $at, %hi(D_800E2F4C)
/* A016C 8009F56C C4242F4C */  lwc1       $f4, %lo(D_800E2F4C)($at)
.L8009F570:
/* A0170 8009F570 94820000 */  lhu        $v0, ($a0)
/* A0174 8009F574 30420002 */  andi       $v0, $v0, 2
/* A0178 8009F578 1040001F */  beqz       $v0, .L8009F5F8
/* A017C 8009F57C 24C6FFFF */   addiu     $a2, $a2, -1
/* A0180 8009F580 8C82000C */  lw         $v0, 0xc($a0)
/* A0184 8009F584 C4A20000 */  lwc1       $f2, ($a1)
/* A0188 8009F588 244300C0 */  addiu      $v1, $v0, 0xc0
/* A018C 8009F58C C4600030 */  lwc1       $f0, 0x30($v1)
/* A0190 8009F590 46020000 */  add.s      $f0, $f0, $f2
/* A0194 8009F594 C4620034 */  lwc1       $f2, 0x34($v1)
/* A0198 8009F598 E4600030 */  swc1       $f0, 0x30($v1)
/* A019C 8009F59C C4A00004 */  lwc1       $f0, 4($a1)
/* A01A0 8009F5A0 46001080 */  add.s      $f2, $f2, $f0
/* A01A4 8009F5A4 C4600038 */  lwc1       $f0, 0x38($v1)
/* A01A8 8009F5A8 E4620034 */  swc1       $f2, 0x34($v1)
/* A01AC 8009F5AC C4A20008 */  lwc1       $f2, 8($a1)
/* A01B0 8009F5B0 46020000 */  add.s      $f0, $f0, $f2
/* A01B4 8009F5B4 E4600038 */  swc1       $f0, 0x38($v1)
/* A01B8 8009F5B8 C4A20000 */  lwc1       $f2, ($a1)
/* A01BC 8009F5BC 46041082 */  mul.s      $f2, $f2, $f4
/* A01C0 8009F5C0 24430080 */  addiu      $v1, $v0, 0x80
/* A01C4 8009F5C4 C4600030 */  lwc1       $f0, 0x30($v1)
/* A01C8 8009F5C8 46020000 */  add.s      $f0, $f0, $f2
/* A01CC 8009F5CC E4600030 */  swc1       $f0, 0x30($v1)
/* A01D0 8009F5D0 C4A20004 */  lwc1       $f2, 4($a1)
/* A01D4 8009F5D4 46041082 */  mul.s      $f2, $f2, $f4
/* A01D8 8009F5D8 C4600034 */  lwc1       $f0, 0x34($v1)
/* A01DC 8009F5DC 46020000 */  add.s      $f0, $f0, $f2
/* A01E0 8009F5E0 E4600034 */  swc1       $f0, 0x34($v1)
/* A01E4 8009F5E4 C4A20008 */  lwc1       $f2, 8($a1)
/* A01E8 8009F5E8 46041082 */  mul.s      $f2, $f2, $f4
/* A01EC 8009F5EC C4600038 */  lwc1       $f0, 0x38($v1)
/* A01F0 8009F5F0 46020000 */  add.s      $f0, $f0, $f2
/* A01F4 8009F5F4 E4600038 */  swc1       $f0, 0x38($v1)
.L8009F5F8:
/* A01F8 8009F5F8 14C0FFDD */  bnez       $a2, .L8009F570
/* A01FC 8009F5FC 24840040 */   addiu     $a0, $a0, 0x40
.L8009F600:
/* A0200 8009F600 03E00008 */  jr         $ra
/* A0204 8009F604 00000000 */   nop

glabel func_8009F608
/* A0208 8009F608 8C820000 */  lw         $v0, ($a0)
/* A020C 8009F60C 8C440010 */  lw         $a0, 0x10($v0)
/* A0210 8009F610 10800012 */  beqz       $a0, .L8009F65C
/* A0214 8009F614 8C450028 */   lw        $a1, 0x28($v0)
.L8009F618:
/* A0218 8009F618 8CA2000C */  lw         $v0, 0xc($a1)
/* A021C 8009F61C 244300C0 */  addiu      $v1, $v0, 0xc0
/* A0220 8009F620 C4600030 */  lwc1       $f0, 0x30($v1)
/* A0224 8009F624 C4420170 */  lwc1       $f2, 0x170($v0)
/* A0228 8009F628 46020001 */  sub.s      $f0, $f0, $f2
/* A022C 8009F62C E440017C */  swc1       $f0, 0x17c($v0)
/* A0230 8009F630 C4620034 */  lwc1       $f2, 0x34($v1)
/* A0234 8009F634 C4400174 */  lwc1       $f0, 0x174($v0)
/* A0238 8009F638 46001081 */  sub.s      $f2, $f2, $f0
/* A023C 8009F63C C4400178 */  lwc1       $f0, 0x178($v0)
/* A0240 8009F640 E4420180 */  swc1       $f2, 0x180($v0)
/* A0244 8009F644 C4640038 */  lwc1       $f4, 0x38($v1)
/* A0248 8009F648 46002101 */  sub.s      $f4, $f4, $f0
/* A024C 8009F64C 2484FFFF */  addiu      $a0, $a0, -1
/* A0250 8009F650 24A50040 */  addiu      $a1, $a1, 0x40
/* A0254 8009F654 1480FFF0 */  bnez       $a0, .L8009F618
/* A0258 8009F658 E4440184 */   swc1      $f4, 0x184($v0)
.L8009F65C:
/* A025C 8009F65C 03E00008 */  jr         $ra
/* A0260 8009F660 00000000 */   nop

glabel func_8009F664
/* A0264 8009F664 8C820000 */  lw         $v0, ($a0)
/* A0268 8009F668 8C440010 */  lw         $a0, 0x10($v0)
/* A026C 8009F66C 1080000F */  beqz       $a0, .L8009F6AC
/* A0270 8009F670 8C450028 */   lw        $a1, 0x28($v0)
.L8009F674:
/* A0274 8009F674 8CA2000C */  lw         $v0, 0xc($a1)
/* A0278 8009F678 244300C0 */  addiu      $v1, $v0, 0xc0
/* A027C 8009F67C AC40017C */  sw         $zero, 0x17c($v0)
/* A0280 8009F680 AC400180 */  sw         $zero, 0x180($v0)
/* A0284 8009F684 AC400184 */  sw         $zero, 0x184($v0)
/* A0288 8009F688 C4600030 */  lwc1       $f0, 0x30($v1)
/* A028C 8009F68C E4400170 */  swc1       $f0, 0x170($v0)
/* A0290 8009F690 C4620034 */  lwc1       $f2, 0x34($v1)
/* A0294 8009F694 2484FFFF */  addiu      $a0, $a0, -1
/* A0298 8009F698 E4420174 */  swc1       $f2, 0x174($v0)
/* A029C 8009F69C C4600038 */  lwc1       $f0, 0x38($v1)
/* A02A0 8009F6A0 24A50040 */  addiu      $a1, $a1, 0x40
/* A02A4 8009F6A4 1480FFF3 */  bnez       $a0, .L8009F674
/* A02A8 8009F6A8 E4400178 */   swc1      $f0, 0x178($v0)
.L8009F6AC:
/* A02AC 8009F6AC 03E00008 */  jr         $ra
/* A02B0 8009F6B0 00000000 */   nop

glabel func_8009F6B4
/* A02B4 8009F6B4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A02B8 8009F6B8 AFB60028 */  sw         $s6, 0x28($sp)
/* A02BC 8009F6BC 0080B021 */  addu       $s6, $a0, $zero
/* A02C0 8009F6C0 AFB40020 */  sw         $s4, 0x20($sp)
/* A02C4 8009F6C4 00A0A021 */  addu       $s4, $a1, $zero
/* A02C8 8009F6C8 AFBF002C */  sw         $ra, 0x2c($sp)
/* A02CC 8009F6CC AFB50024 */  sw         $s5, 0x24($sp)
/* A02D0 8009F6D0 AFB3001C */  sw         $s3, 0x1c($sp)
/* A02D4 8009F6D4 AFB20018 */  sw         $s2, 0x18($sp)
/* A02D8 8009F6D8 AFB10014 */  sw         $s1, 0x14($sp)
/* A02DC 8009F6DC 1280005D */  beqz       $s4, .L8009F854
/* A02E0 8009F6E0 AFB00010 */   sw        $s0, 0x10($sp)
/* A02E4 8009F6E4 8E820018 */  lw         $v0, 0x18($s4)
/* A02E8 8009F6E8 30420001 */  andi       $v0, $v0, 1
/* A02EC 8009F6EC 1440005A */  bnez       $v0, .L8009F858
/* A02F0 8009F6F0 8FBF002C */   lw        $ra, 0x2c($sp)
/* A02F4 8009F6F4 8E820020 */  lw         $v0, 0x20($s4)
/* A02F8 8009F6F8 8E900014 */  lw         $s0, 0x14($s4)
/* A02FC 8009F6FC 8C550004 */  lw         $s5, 4($v0)
/* A0300 8009F700 00009821 */  addu       $s3, $zero, $zero
/* A0304 8009F704 1AA00050 */  blez       $s5, .L8009F848
/* A0308 8009F708 AE960008 */   sw        $s6, 8($s4)
.L8009F70C:
/* A030C 8009F70C 8E120000 */  lw         $s2, ($s0)
/* A0310 8009F710 0C028A1C */  jal        func_800A2870
/* A0314 8009F714 8E440000 */   lw        $a0, ($s2)
/* A0318 8009F718 00408821 */  addu       $s1, $v0, $zero
/* A031C 8009F71C 8E430004 */  lw         $v1, 4($s2)
/* A0320 8009F720 24020001 */  addiu      $v0, $zero, 1
/* A0324 8009F724 10620030 */  beq        $v1, $v0, .L8009F7E8
/* A0328 8009F728 28620002 */   slti      $v0, $v1, 2
/* A032C 8009F72C 10400005 */  beqz       $v0, .L8009F744
/* A0330 8009F730 24020002 */   addiu     $v0, $zero, 2
/* A0334 8009F734 10600009 */  beqz       $v1, .L8009F75C
/* A0338 8009F738 00000000 */   nop
/* A033C 8009F73C 08027E0F */  j          .L8009F83C
/* A0340 8009F740 26730001 */   addiu     $s3, $s3, 1
.L8009F744:
/* A0344 8009F744 10620030 */  beq        $v1, $v0, .L8009F808
/* A0348 8009F748 24020003 */   addiu     $v0, $zero, 3
/* A034C 8009F74C 5062003A */  beql       $v1, $v0, .L8009F838
/* A0350 8009F750 AE510000 */   sw        $s1, ($s2)
/* A0354 8009F754 08027E0F */  j          .L8009F83C
/* A0358 8009F758 26730001 */   addiu     $s3, $s3, 1
.L8009F75C:
/* A035C 8009F75C 0C0289C0 */  jal        get_borg_listing
/* A0360 8009F760 8E440000 */   lw        $a0, ($s2)
/* A0364 8009F764 00401821 */  addu       $v1, $v0, $zero
/* A0368 8009F768 2C620007 */  sltiu      $v0, $v1, 7
/* A036C 8009F76C 10400031 */  beqz       $v0, .L8009F834
/* A0370 8009F770 3C02800E */   lui       $v0, %hi(D_800E2F50)
/* A0374 8009F774 24422F50 */  addiu      $v0, $v0, %lo(D_800E2F50)
/* A0378 8009F778 00031880 */  sll        $v1, $v1, 2
/* A037C 8009F77C 00621821 */  addu       $v1, $v1, $v0
/* A0380 8009F780 8C640000 */  lw         $a0, ($v1)
/* A0384 8009F784 00800008 */  jr         $a0
/* A0388 8009F788 00000000 */   nop
/* A038C 8009F78C 8E020010 */  lw         $v0, 0x10($s0)
/* A0390 8009F790 08027DF7 */  j          .L8009F7DC
/* A0394 8009F794 24420008 */   addiu     $v0, $v0, 8
/* A0398 8009F798 8E020010 */  lw         $v0, 0x10($s0)
/* A039C 8009F79C 08027DF7 */  j          .L8009F7DC
/* A03A0 8009F7A0 24420010 */   addiu     $v0, $v0, 0x10
/* A03A4 8009F7A4 8E020010 */  lw         $v0, 0x10($s0)
/* A03A8 8009F7A8 08027DF7 */  j          .L8009F7DC
/* A03AC 8009F7AC 24420058 */   addiu     $v0, $v0, 0x58
/* A03B0 8009F7B0 8E020010 */  lw         $v0, 0x10($s0)
/* A03B4 8009F7B4 08027DF7 */  j          .L8009F7DC
/* A03B8 8009F7B8 24420010 */   addiu     $v0, $v0, 0x10
/* A03BC 8009F7BC 8E020010 */  lw         $v0, 0x10($s0)
/* A03C0 8009F7C0 08027DF7 */  j          .L8009F7DC
/* A03C4 8009F7C4 24420008 */   addiu     $v0, $v0, 8
/* A03C8 8009F7C8 8E020010 */  lw         $v0, 0x10($s0)
/* A03CC 8009F7CC 08027DF7 */  j          .L8009F7DC
/* A03D0 8009F7D0 24420010 */   addiu     $v0, $v0, 0x10
/* A03D4 8009F7D4 8E020010 */  lw         $v0, 0x10($s0)
/* A03D8 8009F7D8 24420020 */  addiu      $v0, $v0, 0x20
.L8009F7DC:
/* A03DC 8009F7DC 00511021 */  addu       $v0, $v0, $s1
/* A03E0 8009F7E0 08027E0D */  j          .L8009F834
/* A03E4 8009F7E4 AE020010 */   sw        $v0, 0x10($s0)
.L8009F7E8:
/* A03E8 8009F7E8 8EC20000 */  lw         $v0, ($s6)
/* A03EC 8009F7EC 8E030010 */  lw         $v1, 0x10($s0)
/* A03F0 8009F7F0 8C440028 */  lw         $a0, 0x28($v0)
/* A03F4 8009F7F4 00031980 */  sll        $v1, $v1, 6
/* A03F8 8009F7F8 00832021 */  addu       $a0, $a0, $v1
/* A03FC 8009F7FC AE040010 */  sw         $a0, 0x10($s0)
/* A0400 8009F800 08027E0E */  j          .L8009F838
/* A0404 8009F804 AE440000 */   sw        $a0, ($s2)
.L8009F808:
/* A0408 8009F808 8E050010 */  lw         $a1, 0x10($s0)
/* A040C 8009F80C 8E240058 */  lw         $a0, 0x58($s1)
/* A0410 8009F810 AE510000 */  sw         $s1, ($s2)
/* A0414 8009F814 00051880 */  sll        $v1, $a1, 2
/* A0418 8009F818 00651821 */  addu       $v1, $v1, $a1
/* A041C 8009F81C 8C820040 */  lw         $v0, 0x40($a0)
/* A0420 8009F820 00031880 */  sll        $v1, $v1, 2
/* A0424 8009F824 00431021 */  addu       $v0, $v0, $v1
/* A0428 8009F828 24420004 */  addiu      $v0, $v0, 4
/* A042C 8009F82C 08027E0E */  j          .L8009F838
/* A0430 8009F830 AE020010 */   sw        $v0, 0x10($s0)
.L8009F834:
/* A0434 8009F834 AE510000 */  sw         $s1, ($s2)
.L8009F838:
/* A0438 8009F838 26730001 */  addiu      $s3, $s3, 1
.L8009F83C:
/* A043C 8009F83C 0275102A */  slt        $v0, $s3, $s5
/* A0440 8009F840 1440FFB2 */  bnez       $v0, .L8009F70C
/* A0444 8009F844 26100018 */   addiu     $s0, $s0, 0x18
.L8009F848:
/* A0448 8009F848 8E820018 */  lw         $v0, 0x18($s4)
/* A044C 8009F84C 34420001 */  ori        $v0, $v0, 1
/* A0450 8009F850 AE820018 */  sw         $v0, 0x18($s4)
.L8009F854:
/* A0454 8009F854 8FBF002C */  lw         $ra, 0x2c($sp)
.L8009F858:
/* A0458 8009F858 8FB60028 */  lw         $s6, 0x28($sp)
/* A045C 8009F85C 8FB50024 */  lw         $s5, 0x24($sp)
/* A0460 8009F860 8FB40020 */  lw         $s4, 0x20($sp)
/* A0464 8009F864 8FB3001C */  lw         $s3, 0x1c($sp)
/* A0468 8009F868 8FB20018 */  lw         $s2, 0x18($sp)
/* A046C 8009F86C 8FB10014 */  lw         $s1, 0x14($sp)
/* A0470 8009F870 8FB00010 */  lw         $s0, 0x10($sp)
/* A0474 8009F874 03E00008 */  jr         $ra
/* A0478 8009F878 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8009F87C
/* A047C 8009F87C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A0480 8009F880 AFB00010 */  sw         $s0, 0x10($sp)
/* A0484 8009F884 00A08021 */  addu       $s0, $a1, $zero
/* A0488 8009F888 AFBF0018 */  sw         $ra, 0x18($sp)
/* A048C 8009F88C AFB10014 */  sw         $s1, 0x14($sp)
/* A0490 8009F890 8E020018 */  lw         $v0, 0x18($s0)
/* A0494 8009F894 30420001 */  andi       $v0, $v0, 1
/* A0498 8009F898 14400003 */  bnez       $v0, .L8009F8A8
/* A049C 8009F89C 00808821 */   addu      $s1, $a0, $zero
/* A04A0 8009F8A0 0C027DAD */  jal        func_8009F6B4
/* A04A4 8009F8A4 00000000 */   nop
.L8009F8A8:
/* A04A8 8009F8A8 8E220004 */  lw         $v0, 4($s1)
/* A04AC 8009F8AC 50400005 */  beql       $v0, $zero, .L8009F8C4
/* A04B0 8009F8B0 AE300004 */   sw        $s0, 4($s1)
/* A04B4 8009F8B4 AE020010 */  sw         $v0, 0x10($s0)
/* A04B8 8009F8B8 8E220004 */  lw         $v0, 4($s1)
/* A04BC 8009F8BC AC50000C */  sw         $s0, 0xc($v0)
/* A04C0 8009F8C0 AE300004 */  sw         $s0, 4($s1)
.L8009F8C4:
/* A04C4 8009F8C4 8FBF0018 */  lw         $ra, 0x18($sp)
/* A04C8 8009F8C8 8FB10014 */  lw         $s1, 0x14($sp)
/* A04CC 8009F8CC 8FB00010 */  lw         $s0, 0x10($sp)
/* A04D0 8009F8D0 03E00008 */  jr         $ra
/* A04D4 8009F8D4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_borg6
/* A04D8 8009F8D8 10800015 */  beqz       $a0, .L8009F930
/* A04DC 8009F8DC 00000000 */   nop
/* A04E0 8009F8E0 8C850008 */  lw         $a1, 8($a0)
/* A04E4 8009F8E4 10A00012 */  beqz       $a1, .L8009F930
/* A04E8 8009F8E8 00000000 */   nop
/* A04EC 8009F8EC 8C83000C */  lw         $v1, 0xc($a0)
/* A04F0 8009F8F0 50600004 */  beql       $v1, $zero, .L8009F904
/* A04F4 8009F8F4 8C830010 */   lw        $v1, 0x10($a0)
/* A04F8 8009F8F8 8C820010 */  lw         $v0, 0x10($a0)
/* A04FC 8009F8FC AC620010 */  sw         $v0, 0x10($v1)
/* A0500 8009F900 8C830010 */  lw         $v1, 0x10($a0)
.L8009F904:
/* A0504 8009F904 50600004 */  beql       $v1, $zero, .L8009F918
/* A0508 8009F908 8CA20004 */   lw        $v0, 4($a1)
/* A050C 8009F90C 8C82000C */  lw         $v0, 0xc($a0)
/* A0510 8009F910 AC62000C */  sw         $v0, 0xc($v1)
/* A0514 8009F914 8CA20004 */  lw         $v0, 4($a1)
.L8009F918:
/* A0518 8009F918 54820004 */  bnel       $a0, $v0, .L8009F92C
/* A051C 8009F91C AC800010 */   sw        $zero, 0x10($a0)
/* A0520 8009F920 8C820010 */  lw         $v0, 0x10($a0)
/* A0524 8009F924 ACA20004 */  sw         $v0, 4($a1)
/* A0528 8009F928 AC800010 */  sw         $zero, 0x10($a0)
.L8009F92C:
/* A052C 8009F92C AC80000C */  sw         $zero, 0xc($a0)
.L8009F930:
/* A0530 8009F930 03E00008 */  jr         $ra
/* A0534 8009F934 00000000 */   nop

glabel func_8009F938
/* A0538 8009F938 00C04821 */  addu       $t1, $a2, $zero
/* A053C 8009F93C 8C880034 */  lw         $t0, 0x34($a0)
/* A0540 8009F940 11000021 */  beqz       $t0, .L8009F9C8
/* A0544 8009F944 8FA60010 */   lw        $a2, 0x10($sp)
/* A0548 8009F948 00A71021 */  addu       $v0, $a1, $a3
/* A054C 8009F94C 00021FC2 */  srl        $v1, $v0, 0x1f
/* A0550 8009F950 00431021 */  addu       $v0, $v0, $v1
/* A0554 8009F954 00021043 */  sra        $v0, $v0, 1
/* A0558 8009F958 8D040028 */  lw         $a0, 0x28($t0)
/* A055C 8009F95C 01261821 */  addu       $v1, $t1, $a2
/* A0560 8009F960 A4820008 */  sh         $v0, 8($a0)
/* A0564 8009F964 000317C2 */  srl        $v0, $v1, 0x1f
/* A0568 8009F968 00621821 */  addu       $v1, $v1, $v0
/* A056C 8009F96C 00031843 */  sra        $v1, $v1, 1
/* A0570 8009F970 8D040028 */  lw         $a0, 0x28($t0)
/* A0574 8009F974 00A7102A */  slt        $v0, $a1, $a3
/* A0578 8009F978 A483000A */  sh         $v1, 0xa($a0)
/* A057C 8009F97C 10400003 */  beqz       $v0, .L8009F98C
/* A0580 8009F980 8D040028 */   lw        $a0, 0x28($t0)
/* A0584 8009F984 08027E64 */  j          .L8009F990
/* A0588 8009F988 00E51023 */   subu      $v0, $a3, $a1
.L8009F98C:
/* A058C 8009F98C 00A71023 */  subu       $v0, $a1, $a3
.L8009F990:
/* A0590 8009F990 00021FC2 */  srl        $v1, $v0, 0x1f
/* A0594 8009F994 00431021 */  addu       $v0, $v0, $v1
/* A0598 8009F998 00021043 */  sra        $v0, $v0, 1
/* A059C 8009F99C A4820000 */  sh         $v0, ($a0)
/* A05A0 8009F9A0 0126102A */  slt        $v0, $t1, $a2
/* A05A4 8009F9A4 10400003 */  beqz       $v0, .L8009F9B4
/* A05A8 8009F9A8 8D040028 */   lw        $a0, 0x28($t0)
/* A05AC 8009F9AC 08027E6E */  j          .L8009F9B8
/* A05B0 8009F9B0 00C91023 */   subu      $v0, $a2, $t1
.L8009F9B4:
/* A05B4 8009F9B4 01261023 */  subu       $v0, $t1, $a2
.L8009F9B8:
/* A05B8 8009F9B8 00021FC2 */  srl        $v1, $v0, 0x1f
/* A05BC 8009F9BC 00431021 */  addu       $v0, $v0, $v1
/* A05C0 8009F9C0 00021043 */  sra        $v0, $v0, 1
/* A05C4 8009F9C4 A4820002 */  sh         $v0, 2($a0)
.L8009F9C8:
/* A05C8 8009F9C8 03E00008 */  jr         $ra
/* A05CC 8009F9CC 00000000 */   nop

glabel func_8009F9D0
/* A05D0 8009F9D0 8C820000 */  lw         $v0, ($a0)
/* A05D4 8009F9D4 8C420034 */  lw         $v0, 0x34($v0)
/* A05D8 8009F9D8 54400001 */  bnel       $v0, $zero, .L8009F9E0
/* A05DC 8009F9DC AC450028 */   sw        $a1, 0x28($v0)
.L8009F9E0:
/* A05E0 8009F9E0 03E00008 */  jr         $ra
/* A05E4 8009F9E4 00000000 */   nop

glabel BorgAnimLoadScene
/* A05E8 8009F9E8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A05EC 8009F9EC AFB20018 */  sw         $s2, 0x18($sp)
/* A05F0 8009F9F0 00809021 */  addu       $s2, $a0, $zero
/* A05F4 8009F9F4 240402B8 */  addiu      $a0, $zero, 0x2b8
/* A05F8 8009F9F8 3C02800E */  lui        $v0, %hi(D_800E2F6C)
/* A05FC 8009F9FC AFB10014 */  sw         $s1, 0x14($sp)
/* A0600 8009FA00 24512F6C */  addiu      $s1, $v0, %lo(D_800E2F6C)
/* A0604 8009FA04 02202821 */  addu       $a1, $s1, $zero
/* A0608 8009FA08 24060AC7 */  addiu      $a2, $zero, 0xac7
/* A060C 8009FA0C AFBF001C */  sw         $ra, 0x1c($sp)
/* A0610 8009FA10 0C025F9C */  jal        Malloc
/* A0614 8009FA14 AFB00010 */   sw        $s0, 0x10($sp)
/* A0618 8009FA18 00408021 */  addu       $s0, $v0, $zero
/* A061C 8009FA1C 02002021 */  addu       $a0, $s0, $zero
/* A0620 8009FA20 00002821 */  addu       $a1, $zero, $zero
/* A0624 8009FA24 0C026380 */  jal        Calloc
/* A0628 8009FA28 240602B8 */   addiu     $a2, $zero, 0x2b8
/* A062C 8009FA2C AE0002A4 */  sw         $zero, 0x2a4($s0)
/* A0630 8009FA30 0C028918 */  jal        setBorgFlag
/* A0634 8009FA34 AE0002A8 */   sw        $zero, 0x2a8($s0)
/* A0638 8009FA38 0C028A22 */  jal        getBorgItem
/* A063C 8009FA3C 02402021 */   addu      $a0, $s2, $zero
/* A0640 8009FA40 1440000A */  bnez       $v0, .L8009FA6C
/* A0644 8009FA44 AE020000 */   sw        $v0, ($s0)
/* A0648 8009FA48 02002021 */  addu       $a0, $s0, $zero
/* A064C 8009FA4C 02202821 */  addu       $a1, $s1, $zero
/* A0650 8009FA50 0C02600C */  jal        Free
/* A0654 8009FA54 24060ADB */   addiu     $a2, $zero, 0xadb
/* A0658 8009FA58 3C04800E */  lui        $a0, %hi(D_800E2F80)
/* A065C 8009FA5C 24842F80 */  addiu      $a0, $a0, %lo(D_800E2F80)
/* A0660 8009FA60 3C05800E */  lui        $a1, %hi(D_800E2F94)
/* A0664 8009FA64 0C025F2D */  jal        manualCrash
/* A0668 8009FA68 24A52F94 */   addiu     $a1, $a1, %lo(D_800E2F94)
.L8009FA6C:
/* A066C 8009FA6C 26040088 */  addiu      $a0, $s0, 0x88
/* A0670 8009FA70 24020001 */  addiu      $v0, $zero, 1
/* A0674 8009FA74 A20002AC */  sb         $zero, 0x2ac($s0)
/* A0678 8009FA78 AE0001F4 */  sw         $zero, 0x1f4($s0)
/* A067C 8009FA7C A20001FB */  sb         $zero, 0x1fb($s0)
/* A0680 8009FA80 A60201F8 */  sh         $v0, 0x1f8($s0)
/* A0684 8009FA84 A20001FA */  sb         $zero, 0x1fa($s0)
/* A0688 8009FA88 0C0311DC */  jal        guMtxIdentF
/* A068C 8009FA8C AE000004 */   sw        $zero, 4($s0)
/* A0690 8009FA90 0C0311DC */  jal        guMtxIdentF
/* A0694 8009FA94 260400C8 */   addiu     $a0, $s0, 0xc8
/* A0698 8009FA98 26040218 */  addiu      $a0, $s0, 0x218
/* A069C 8009FA9C 00002821 */  addu       $a1, $zero, $zero
/* A06A0 8009FAA0 3C01800E */  lui        $at, %hi(D_800E2FAC)
/* A06A4 8009FAA4 C4202FAC */  lwc1       $f0, %lo(D_800E2FAC)($at)
/* A06A8 8009FAA8 24060070 */  addiu      $a2, $zero, 0x70
/* A06AC 8009FAAC E60001FC */  swc1       $f0, 0x1fc($s0)
/* A06B0 8009FAB0 E6000200 */  swc1       $f0, 0x200($s0)
/* A06B4 8009FAB4 E6000204 */  swc1       $f0, 0x204($s0)
/* A06B8 8009FAB8 0C026380 */  jal        Calloc
/* A06BC 8009FABC E6000208 */   swc1      $f0, 0x208($s0)
/* A06C0 8009FAC0 26040288 */  addiu      $a0, $s0, 0x288
/* A06C4 8009FAC4 00002821 */  addu       $a1, $zero, $zero
/* A06C8 8009FAC8 0C026380 */  jal        Calloc
/* A06CC 8009FACC 24060010 */   addiu     $a2, $zero, 0x10
/* A06D0 8009FAD0 00004021 */  addu       $t0, $zero, $zero
/* A06D4 8009FAD4 260C02AD */  addiu      $t4, $s0, 0x2ad
/* A06D8 8009FAD8 260B01D4 */  addiu      $t3, $s0, 0x1d4
/* A06DC 8009FADC 8E090000 */  lw         $t1, ($s0)
/* A06E0 8009FAE0 240DFFFF */  addiu      $t5, $zero, -1
/* A06E4 8009FAE4 AE000298 */  sw         $zero, 0x298($s0)
/* A06E8 8009FAE8 AE00029C */  sw         $zero, 0x29c($s0)
/* A06EC 8009FAEC 00003021 */  addu       $a2, $zero, $zero
.L8009FAF0:
/* A06F0 8009FAF0 01201821 */  addu       $v1, $t1, $zero
/* A06F4 8009FAF4 00002821 */  addu       $a1, $zero, $zero
/* A06F8 8009FAF8 8C620018 */  lw         $v0, 0x18($v1)
/* A06FC 8009FAFC 00083880 */  sll        $a3, $t0, 2
/* A0700 8009FB00 18400010 */  blez       $v0, .L8009FB44
/* A0704 8009FB04 250A0001 */   addiu     $t2, $t0, 1
/* A0708 8009FB08 8C64003C */  lw         $a0, 0x3c($v1)
.L8009FB0C:
/* A070C 8009FB0C 00051080 */  sll        $v0, $a1, 2
/* A0710 8009FB10 00441021 */  addu       $v0, $v0, $a0
/* A0714 8009FB14 8C430000 */  lw         $v1, ($v0)
/* A0718 8009FB18 8C640058 */  lw         $a0, 0x58($v1)
/* A071C 8009FB1C 90820027 */  lbu        $v0, 0x27($a0)
/* A0720 8009FB20 54480002 */  bnel       $v0, $t0, .L8009FB2C
/* A0724 8009FB24 24A50001 */   addiu     $a1, $a1, 1
/* A0728 8009FB28 24060001 */  addiu      $a2, $zero, 1
.L8009FB2C:
/* A072C 8009FB2C 14C00007 */  bnez       $a2, .L8009FB4C
/* A0730 8009FB30 01201821 */   addu      $v1, $t1, $zero
/* A0734 8009FB34 8C620018 */  lw         $v0, 0x18($v1)
/* A0738 8009FB38 00A2102A */  slt        $v0, $a1, $v0
/* A073C 8009FB3C 5440FFF3 */  bnel       $v0, $zero, .L8009FB0C
/* A0740 8009FB40 8C64003C */   lw        $a0, 0x3c($v1)
.L8009FB44:
/* A0744 8009FB44 10C00004 */  beqz       $a2, .L8009FB58
/* A0748 8009FB48 01671021 */   addu      $v0, $t3, $a3
.L8009FB4C:
/* A074C 8009FB4C 01671021 */  addu       $v0, $t3, $a3
/* A0750 8009FB50 08027ED7 */  j          .L8009FB5C
/* A0754 8009FB54 AC450000 */   sw        $a1, ($v0)
.L8009FB58:
/* A0758 8009FB58 AC4D0000 */  sw         $t5, ($v0)
.L8009FB5C:
/* A075C 8009FB5C 314800FF */  andi       $t0, $t2, 0xff
/* A0760 8009FB60 2D020008 */  sltiu      $v0, $t0, 8
/* A0764 8009FB64 1440FFE2 */  bnez       $v0, .L8009FAF0
/* A0768 8009FB68 00003021 */   addu      $a2, $zero, $zero
/* A076C 8009FB6C 01802021 */  addu       $a0, $t4, $zero
/* A0770 8009FB70 3C05800E */  lui        $a1, %hi(D_800E2FA8)
/* A0774 8009FB74 24A52FA8 */  addiu      $a1, $a1, %lo(D_800E2FA8)
/* A0778 8009FB78 3C01800E */  lui        $at, %hi(D_800E2FB0)
/* A077C 8009FB7C C4202FB0 */  lwc1       $f0, %lo(D_800E2FB0)($at)
/* A0780 8009FB80 02403021 */  addu       $a2, $s2, $zero
/* A0784 8009FB84 E60001C8 */  swc1       $f0, 0x1c8($s0)
/* A0788 8009FB88 E60001CC */  swc1       $f0, 0x1cc($s0)
/* A078C 8009FB8C 0C0333AC */  jal        sprintf
/* A0790 8009FB90 E60001D0 */   swc1      $f0, 0x1d0($s0)
/* A0794 8009FB94 02001021 */  addu       $v0, $s0, $zero
/* A0798 8009FB98 8FBF001C */  lw         $ra, 0x1c($sp)
/* A079C 8009FB9C 8FB20018 */  lw         $s2, 0x18($sp)
/* A07A0 8009FBA0 8FB10014 */  lw         $s1, 0x14($sp)
/* A07A4 8009FBA4 8FB00010 */  lw         $s0, 0x10($sp)
/* A07A8 8009FBA8 03E00008 */  jr         $ra
/* A07AC 8009FBAC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel borganim_free
/* A07B0 8009FBB0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A07B4 8009FBB4 AFB00010 */  sw         $s0, 0x10($sp)
/* A07B8 8009FBB8 00808021 */  addu       $s0, $a0, $zero
/* A07BC 8009FBBC AFBF0014 */  sw         $ra, 0x14($sp)
/* A07C0 8009FBC0 0C028EC3 */  jal        borg5_free
/* A07C4 8009FBC4 8E040000 */   lw        $a0, ($s0)
/* A07C8 8009FBC8 02002021 */  addu       $a0, $s0, $zero
/* A07CC 8009FBCC 3C05800E */  lui        $a1, %hi(D_800E2F6C)
/* A07D0 8009FBD0 24A52F6C */  addiu      $a1, $a1, %lo(D_800E2F6C)
/* A07D4 8009FBD4 0C02600C */  jal        Free
/* A07D8 8009FBD8 24060B36 */   addiu     $a2, $zero, 0xb36
/* A07DC 8009FBDC 8FBF0014 */  lw         $ra, 0x14($sp)
/* A07E0 8009FBE0 8FB00010 */  lw         $s0, 0x10($sp)
/* A07E4 8009FBE4 03E00008 */  jr         $ra
/* A07E8 8009FBE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_borg_6
/* A07EC 8009FBEC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A07F0 8009FBF0 AFB00010 */  sw         $s0, 0x10($sp)
/* A07F4 8009FBF4 AFBF0014 */  sw         $ra, 0x14($sp)
/* A07F8 8009FBF8 0C02891C */  jal        clearBorgFlag
/* A07FC 8009FBFC 00808021 */   addu      $s0, $a0, $zero
/* A0800 8009FC00 0C028A22 */  jal        getBorgItem
/* A0804 8009FC04 02002021 */   addu      $a0, $s0, $zero
/* A0808 8009FC08 8FBF0014 */  lw         $ra, 0x14($sp)
/* A080C 8009FC0C 8FB00010 */  lw         $s0, 0x10($sp)
/* A0810 8009FC10 03E00008 */  jr         $ra
/* A0814 8009FC14 27BD0018 */   addiu     $sp, $sp, 0x18

glabel passto_borg_6_free
/* A0818 8009FC18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A081C 8009FC1C AFBF0010 */  sw         $ra, 0x10($sp)
/* A0820 8009FC20 0C028FD2 */  jal        borg_6_free
/* A0824 8009FC24 00000000 */   nop
/* A0828 8009FC28 8FBF0010 */  lw         $ra, 0x10($sp)
/* A082C 8009FC2C 03E00008 */  jr         $ra
/* A0830 8009FC30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_loading_borg7
/* A0834 8009FC34 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A0838 8009FC38 AFB00010 */  sw         $s0, 0x10($sp)
/* A083C 8009FC3C 00808021 */  addu       $s0, $a0, $zero
/* A0840 8009FC40 AFB10014 */  sw         $s1, 0x14($sp)
/* A0844 8009FC44 AFBF0018 */  sw         $ra, 0x18($sp)
/* A0848 8009FC48 0C028918 */  jal        setBorgFlag
/* A084C 8009FC4C 00A08821 */   addu      $s1, $a1, $zero
/* A0850 8009FC50 0C028A22 */  jal        getBorgItem
/* A0854 8009FC54 02002021 */   addu      $a0, $s0, $zero
/* A0858 8009FC58 00408021 */  addu       $s0, $v0, $zero
/* A085C 8009FC5C 8E020054 */  lw         $v0, 0x54($s0)
/* A0860 8009FC60 50400008 */  beql       $v0, $zero, .L8009FC84
/* A0864 8009FC64 8E020008 */   lw        $v0, 8($s0)
/* A0868 8009FC68 8E020018 */  lw         $v0, 0x18($s0)
/* A086C 8009FC6C 8C430004 */  lw         $v1, 4($v0)
/* A0870 8009FC70 8C650020 */  lw         $a1, 0x20($v1)
/* A0874 8009FC74 0C027E7A */  jal        BorgAnimLoadScene
/* A0878 8009FC78 8CA40000 */   lw        $a0, ($a1)
/* A087C 8009FC7C AE020008 */  sw         $v0, 8($s0)
/* A0880 8009FC80 8E020008 */  lw         $v0, 8($s0)
.L8009FC84:
/* A0884 8009FC84 02002021 */  addu       $a0, $s0, $zero
/* A0888 8009FC88 0C028166 */  jal        func_800A0598
/* A088C 8009FC8C AC5102A0 */   sw        $s1, 0x2a0($v0)
/* A0890 8009FC90 02001021 */  addu       $v0, $s0, $zero
/* A0894 8009FC94 8FBF0018 */  lw         $ra, 0x18($sp)
/* A0898 8009FC98 8FB10014 */  lw         $s1, 0x14($sp)
/* A089C 8009FC9C 8FB00010 */  lw         $s0, 0x10($sp)
/* A08A0 8009FCA0 03E00008 */  jr         $ra
/* A08A4 8009FCA4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009FCA8
/* A08A8 8009FCA8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A08AC 8009FCAC AFB20018 */  sw         $s2, 0x18($sp)
/* A08B0 8009FCB0 00809021 */  addu       $s2, $a0, $zero
/* A08B4 8009FCB4 AFBF001C */  sw         $ra, 0x1c($sp)
/* A08B8 8009FCB8 AFB10014 */  sw         $s1, 0x14($sp)
/* A08BC 8009FCBC AFB00010 */  sw         $s0, 0x10($sp)
/* A08C0 8009FCC0 8E450008 */  lw         $a1, 8($s2)
/* A08C4 8009FCC4 50A00004 */  beql       $a1, $zero, .L8009FCD8
/* A08C8 8009FCC8 8E420054 */   lw        $v0, 0x54($s2)
/* A08CC 8009FCCC 0C02CFE7 */  jal        func_800B3F9C
/* A08D0 8009FCD0 8CA402A0 */   lw        $a0, 0x2a0($a1)
/* A08D4 8009FCD4 8E420054 */  lw         $v0, 0x54($s2)
.L8009FCD8:
/* A08D8 8009FCD8 1840000F */  blez       $v0, .L8009FD18
/* A08DC 8009FCDC 00008021 */   addu      $s0, $zero, $zero
/* A08E0 8009FCE0 26510060 */  addiu      $s1, $s2, 0x60
.L8009FCE4:
/* A08E4 8009FCE4 96220000 */  lhu        $v0, ($s1)
/* A08E8 8009FCE8 30420002 */  andi       $v0, $v0, 2
/* A08EC 8009FCEC 10400005 */  beqz       $v0, .L8009FD04
/* A08F0 8009FCF0 001010C0 */   sll       $v0, $s0, 3
/* A08F4 8009FCF4 8E430018 */  lw         $v1, 0x18($s2)
/* A08F8 8009FCF8 00431021 */  addu       $v0, $v0, $v1
/* A08FC 8009FCFC 0C027E36 */  jal        clear_borg6
/* A0900 8009FD00 8C440004 */   lw        $a0, 4($v0)
.L8009FD04:
/* A0904 8009FD04 8E420054 */  lw         $v0, 0x54($s2)
/* A0908 8009FD08 26100001 */  addiu      $s0, $s0, 1
/* A090C 8009FD0C 0202102A */  slt        $v0, $s0, $v0
/* A0910 8009FD10 1440FFF4 */  bnez       $v0, .L8009FCE4
/* A0914 8009FD14 2631000C */   addiu     $s1, $s1, 0xc
.L8009FD18:
/* A0918 8009FD18 0C027EEC */  jal        borganim_free
/* A091C 8009FD1C 8E440008 */   lw        $a0, 8($s2)
/* A0920 8009FD20 0C02906A */  jal        borg7_free
/* A0924 8009FD24 02402021 */   addu      $a0, $s2, $zero
/* A0928 8009FD28 8FBF001C */  lw         $ra, 0x1c($sp)
/* A092C 8009FD2C 8FB20018 */  lw         $s2, 0x18($sp)
/* A0930 8009FD30 8FB10014 */  lw         $s1, 0x14($sp)
/* A0934 8009FD34 8FB00010 */  lw         $s0, 0x10($sp)
/* A0938 8009FD38 03E00008 */  jr         $ra
/* A093C 8009FD3C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009FD40
/* A0940 8009FD40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A0944 8009FD44 AFB00010 */  sw         $s0, 0x10($sp)
/* A0948 8009FD48 00808021 */  addu       $s0, $a0, $zero
/* A094C 8009FD4C AFBF0014 */  sw         $ra, 0x14($sp)
/* A0950 8009FD50 8E05001C */  lw         $a1, 0x1c($s0)
/* A0954 8009FD54 8CA30000 */  lw         $v1, ($a1)
/* A0958 8009FD58 94620004 */  lhu        $v0, 4($v1)
/* A095C 8009FD5C 30420002 */  andi       $v0, $v0, 2
/* A0960 8009FD60 1440000A */  bnez       $v0, .L8009FD8C
/* A0964 8009FD64 8FBF0014 */   lw        $ra, 0x14($sp)
/* A0968 8009FD68 8E040008 */  lw         $a0, 8($s0)
/* A096C 8009FD6C 0C027E1F */  jal        func_8009F87C
/* A0970 8009FD70 8CA50004 */   lw        $a1, 4($a1)
/* A0974 8009FD74 8E02001C */  lw         $v0, 0x1c($s0)
/* A0978 8009FD78 8C440000 */  lw         $a0, ($v0)
/* A097C 8009FD7C 94830004 */  lhu        $v1, 4($a0)
/* A0980 8009FD80 34630002 */  ori        $v1, $v1, 2
/* A0984 8009FD84 A4830004 */  sh         $v1, 4($a0)
/* A0988 8009FD88 8FBF0014 */  lw         $ra, 0x14($sp)
.L8009FD8C:
/* A098C 8009FD8C 8FB00010 */  lw         $s0, 0x10($sp)
/* A0990 8009FD90 03E00008 */  jr         $ra
/* A0994 8009FD94 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009FD98
/* A0998 8009FD98 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A099C 8009FD9C AFB00010 */  sw         $s0, 0x10($sp)
/* A09A0 8009FDA0 00808021 */  addu       $s0, $a0, $zero
/* A09A4 8009FDA4 AFBF0014 */  sw         $ra, 0x14($sp)
/* A09A8 8009FDA8 8E04001C */  lw         $a0, 0x1c($s0)
/* A09AC 8009FDAC 8C830000 */  lw         $v1, ($a0)
/* A09B0 8009FDB0 94620004 */  lhu        $v0, 4($v1)
/* A09B4 8009FDB4 30420002 */  andi       $v0, $v0, 2
/* A09B8 8009FDB8 10400009 */  beqz       $v0, .L8009FDE0
/* A09BC 8009FDBC 8FBF0014 */   lw        $ra, 0x14($sp)
/* A09C0 8009FDC0 0C027E36 */  jal        clear_borg6
/* A09C4 8009FDC4 8C840004 */   lw        $a0, 4($a0)
/* A09C8 8009FDC8 8E02001C */  lw         $v0, 0x1c($s0)
/* A09CC 8009FDCC 8C440000 */  lw         $a0, ($v0)
/* A09D0 8009FDD0 94830004 */  lhu        $v1, 4($a0)
/* A09D4 8009FDD4 3063FFFD */  andi       $v1, $v1, 0xfffd
/* A09D8 8009FDD8 A4830004 */  sh         $v1, 4($a0)
/* A09DC 8009FDDC 8FBF0014 */  lw         $ra, 0x14($sp)
.L8009FDE0:
/* A09E0 8009FDE0 8FB00010 */  lw         $s0, 0x10($sp)
/* A09E4 8009FDE4 03E00008 */  jr         $ra
/* A09E8 8009FDE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009FDEC
/* A09EC 8009FDEC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A09F0 8009FDF0 AFBF0010 */  sw         $ra, 0x10($sp)
/* A09F4 8009FDF4 0C028282 */  jal        func_800A0A08
/* A09F8 8009FDF8 8C840008 */   lw        $a0, 8($a0)
/* A09FC 8009FDFC 8FBF0010 */  lw         $ra, 0x10($sp)
/* A0A00 8009FE00 03E00008 */  jr         $ra
/* A0A04 8009FE04 27BD0018 */   addiu     $sp, $sp, 0x18

glabel takeBranch
/* A0A08 8009FE08 3C03800F */  lui        $v1, %hi(animChache)
/* A0A0C 8009FE0C 90623488 */  lbu        $v0, %lo(animChache)($v1)
/* A0A10 8009FE10 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A0A14 8009FE14 AFB3001C */  sw         $s3, 0x1c($sp)
/* A0A18 8009FE18 00809821 */  addu       $s3, $a0, $zero
/* A0A1C 8009FE1C AFB00010 */  sw         $s0, 0x10($sp)
/* A0A20 8009FE20 00A08021 */  addu       $s0, $a1, $zero
/* A0A24 8009FE24 AFB40020 */  sw         $s4, 0x20($sp)
/* A0A28 8009FE28 0060A021 */  addu       $s4, $v1, $zero
/* A0A2C 8009FE2C AFBF0028 */  sw         $ra, 0x28($sp)
/* A0A30 8009FE30 AFB50024 */  sw         $s5, 0x24($sp)
/* A0A34 8009FE34 AFB20018 */  sw         $s2, 0x18($sp)
/* A0A38 8009FE38 2C420004 */  sltiu      $v0, $v0, 4
/* A0A3C 8009FE3C 14400006 */  bnez       $v0, .L8009FE58
/* A0A40 8009FE40 AFB10014 */   sw        $s1, 0x14($sp)
/* A0A44 8009FE44 3C04800E */  lui        $a0, %hi(D_800E2FB4)
/* A0A48 8009FE48 24842FB4 */  addiu      $a0, $a0, %lo(D_800E2FB4)
/* A0A4C 8009FE4C 3C05800E */  lui        $a1, %hi(D_800E2FC0)
/* A0A50 8009FE50 0C025F2D */  jal        manualCrash
/* A0A54 8009FE54 24A52FC0 */   addiu     $a1, $a1, %lo(D_800E2FC0)
.L8009FE58:
/* A0A58 8009FE58 0C027F66 */  jal        func_8009FD98
/* A0A5C 8009FE5C 02602021 */   addu      $a0, $s3, $zero
/* A0A60 8009FE60 00002821 */  addu       $a1, $zero, $zero
/* A0A64 8009FE64 8E63001C */  lw         $v1, 0x1c($s3)
/* A0A68 8009FE68 00003021 */  addu       $a2, $zero, $zero
/* A0A6C 8009FE6C AC600004 */  sw         $zero, 4($v1)
/* A0A70 8009FE70 82020003 */  lb         $v0, 3($s0)
/* A0A74 8009FE74 8E630018 */  lw         $v1, 0x18($s3)
/* A0A78 8009FE78 000210C0 */  sll        $v0, $v0, 3
/* A0A7C 8009FE7C 00621821 */  addu       $v1, $v1, $v0
/* A0A80 8009FE80 8C620000 */  lw         $v0, ($v1)
/* A0A84 8009FE84 26710038 */  addiu      $s1, $s3, 0x38
/* A0A88 8009FE88 AE63001C */  sw         $v1, 0x1c($s3)
/* A0A8C 8009FE8C 92833488 */  lbu        $v1, 0x3488($s4)
/* A0A90 8009FE90 1060000D */  beqz       $v1, .L8009FEC8
/* A0A94 8009FE94 8C520000 */   lw        $s2, ($v0)
/* A0A98 8009FE98 00602021 */  addu       $a0, $v1, $zero
/* A0A9C 8009FE9C 26630044 */  addiu      $v1, $s3, 0x44
/* A0AA0 8009FEA0 8C620000 */  lw         $v0, ($v1)
.L8009FEA4:
/* A0AA4 8009FEA4 54520003 */  bnel       $v0, $s2, .L8009FEB4
/* A0AA8 8009FEA8 24630004 */   addiu     $v1, $v1, 4
/* A0AAC 8009FEAC 08027FAE */  j          .L8009FEB8
/* A0AB0 8009FEB0 24050001 */   addiu     $a1, $zero, 1
.L8009FEB4:
/* A0AB4 8009FEB4 24C60001 */  addiu      $a2, $a2, 1
.L8009FEB8:
/* A0AB8 8009FEB8 14A00045 */  bnez       $a1, .L8009FFD0
/* A0ABC 8009FEBC 00C4102B */   sltu      $v0, $a2, $a0
/* A0AC0 8009FEC0 5440FFF8 */  bnel       $v0, $zero, .L8009FEA4
/* A0AC4 8009FEC4 8C620000 */   lw        $v0, ($v1)
.L8009FEC8:
/* A0AC8 8009FEC8 14A00042 */  bnez       $a1, .L8009FFD4
/* A0ACC 8009FECC 00061080 */   sll       $v0, $a2, 2
/* A0AD0 8009FED0 92823488 */  lbu        $v0, 0x3488($s4)
/* A0AD4 8009FED4 2442FFFF */  addiu      $v0, $v0, -1
/* A0AD8 8009FED8 00021080 */  sll        $v0, $v0, 2
/* A0ADC 8009FEDC 02221021 */  addu       $v0, $s1, $v0
/* A0AE0 8009FEE0 8C430000 */  lw         $v1, ($v0)
/* A0AE4 8009FEE4 1060001B */  beqz       $v1, .L8009FF54
/* A0AE8 8009FEE8 3C15800F */   lui       $s5, 0x800f
/* A0AEC 8009FEEC 0C02608C */  jal        get_memUsed
/* A0AF0 8009FEF0 00000000 */   nop
/* A0AF4 8009FEF4 92833488 */  lbu        $v1, 0x3488($s4)
/* A0AF8 8009FEF8 2463FFFF */  addiu      $v1, $v1, -1
/* A0AFC 8009FEFC 00031880 */  sll        $v1, $v1, 2
/* A0B00 8009FF00 02231821 */  addu       $v1, $s1, $v1
/* A0B04 8009FF04 8C640000 */  lw         $a0, ($v1)
/* A0B08 8009FF08 0C028FD2 */  jal        borg_6_free
/* A0B0C 8009FF0C 00408021 */   addu      $s0, $v0, $zero
/* A0B10 8009FF10 0C02608C */  jal        get_memUsed
/* A0B14 8009FF14 00000000 */   nop
/* A0B18 8009FF18 26A5348C */  addiu      $a1, $s5, 0x348c
/* A0B1C 8009FF1C 00501023 */  subu       $v0, $v0, $s0
/* A0B20 8009FF20 92833488 */  lbu        $v1, 0x3488($s4)
/* A0B24 8009FF24 8CA4001C */  lw         $a0, 0x1c($a1)
/* A0B28 8009FF28 2463FFFF */  addiu      $v1, $v1, -1
/* A0B2C 8009FF2C 00031880 */  sll        $v1, $v1, 2
/* A0B30 8009FF30 02231821 */  addu       $v1, $s1, $v1
/* A0B34 8009FF34 AC600000 */  sw         $zero, ($v1)
/* A0B38 8009FF38 92833488 */  lbu        $v1, 0x3488($s4)
/* A0B3C 8009FF3C 00822023 */  subu       $a0, $a0, $v0
/* A0B40 8009FF40 ACA4001C */  sw         $a0, 0x1c($a1)
/* A0B44 8009FF44 2463FFFF */  addiu      $v1, $v1, -1
/* A0B48 8009FF48 00031880 */  sll        $v1, $v1, 2
/* A0B4C 8009FF4C 02231821 */  addu       $v1, $s1, $v1
/* A0B50 8009FF50 AC60000C */  sw         $zero, 0xc($v1)
.L8009FF54:
/* A0B54 8009FF54 92823488 */  lbu        $v0, 0x3488($s4)
/* A0B58 8009FF58 2446FFFF */  addiu      $a2, $v0, -1
/* A0B5C 8009FF5C 10C00009 */  beqz       $a2, .L8009FF84
/* A0B60 8009FF60 00061080 */   sll       $v0, $a2, 2
/* A0B64 8009FF64 00512021 */  addu       $a0, $v0, $s1
.L8009FF68:
/* A0B68 8009FF68 8C82FFFC */  lw         $v0, -4($a0)
/* A0B6C 8009FF6C 8C830008 */  lw         $v1, 8($a0)
/* A0B70 8009FF70 24C6FFFF */  addiu      $a2, $a2, -1
/* A0B74 8009FF74 AC820000 */  sw         $v0, ($a0)
/* A0B78 8009FF78 AC83000C */  sw         $v1, 0xc($a0)
/* A0B7C 8009FF7C 14C0FFFA */  bnez       $a2, .L8009FF68
/* A0B80 8009FF80 2484FFFC */   addiu     $a0, $a0, -4
.L8009FF84:
/* A0B84 8009FF84 0C02891C */  jal        clearBorgFlag
/* A0B88 8009FF88 00000000 */   nop
/* A0B8C 8009FF8C 0C02608C */  jal        get_memUsed
/* A0B90 8009FF90 00000000 */   nop
/* A0B94 8009FF94 00408021 */  addu       $s0, $v0, $zero
/* A0B98 8009FF98 0C028A22 */  jal        getBorgItem
/* A0B9C 8009FF9C 02402021 */   addu      $a0, $s2, $zero
/* A0BA0 8009FFA0 0C02608C */  jal        get_memUsed
/* A0BA4 8009FFA4 AE220000 */   sw        $v0, ($s1)
/* A0BA8 8009FFA8 26A5348C */  addiu      $a1, $s5, 0x348c
/* A0BAC 8009FFAC 8CA3001C */  lw         $v1, 0x1c($a1)
/* A0BB0 8009FFB0 8E66001C */  lw         $a2, 0x1c($s3)
/* A0BB4 8009FFB4 8E240000 */  lw         $a0, ($s1)
/* A0BB8 8009FFB8 00501023 */  subu       $v0, $v0, $s0
/* A0BBC 8009FFBC AE32000C */  sw         $s2, 0xc($s1)
/* A0BC0 8009FFC0 00621821 */  addu       $v1, $v1, $v0
/* A0BC4 8009FFC4 ACA3001C */  sw         $v1, 0x1c($a1)
/* A0BC8 8009FFC8 08027FF9 */  j          .L8009FFE4
/* A0BCC 8009FFCC ACC40004 */   sw        $a0, 4($a2)
.L8009FFD0:
/* A0BD0 8009FFD0 00061080 */  sll        $v0, $a2, 2
.L8009FFD4:
/* A0BD4 8009FFD4 02221021 */  addu       $v0, $s1, $v0
/* A0BD8 8009FFD8 8E64001C */  lw         $a0, 0x1c($s3)
/* A0BDC 8009FFDC 8C430000 */  lw         $v1, ($v0)
/* A0BE0 8009FFE0 AC830004 */  sw         $v1, 4($a0)
.L8009FFE4:
/* A0BE4 8009FFE4 0C027F50 */  jal        func_8009FD40
/* A0BE8 8009FFE8 02602021 */   addu      $a0, $s3, $zero
/* A0BEC 8009FFEC 0C027F7B */  jal        func_8009FDEC
/* A0BF0 8009FFF0 02602021 */   addu      $a0, $s3, $zero
/* A0BF4 8009FFF4 8FBF0028 */  lw         $ra, 0x28($sp)
/* A0BF8 8009FFF8 8FB50024 */  lw         $s5, 0x24($sp)
/* A0BFC 8009FFFC 8FB40020 */  lw         $s4, 0x20($sp)
/* A0C00 800A0000 8FB3001C */  lw         $s3, 0x1c($sp)
/* A0C04 800A0004 8FB20018 */  lw         $s2, 0x18($sp)
/* A0C08 800A0008 8FB10014 */  lw         $s1, 0x14($sp)
/* A0C0C 800A000C 8FB00010 */  lw         $s0, 0x10($sp)
/* A0C10 800A0010 03E00008 */  jr         $ra
/* A0C14 800A0014 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800A0018
/* A0C18 800A0018 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A0C1C 800A001C AFB00010 */  sw         $s0, 0x10($sp)
/* A0C20 800A0020 00808021 */  addu       $s0, $a0, $zero
/* A0C24 800A0024 AFBF0014 */  sw         $ra, 0x14($sp)
/* A0C28 800A0028 8E02001C */  lw         $v0, 0x1c($s0)
/* A0C2C 800A002C 8C440000 */  lw         $a0, ($v0)
/* A0C30 800A0030 94830004 */  lhu        $v1, 4($a0)
/* A0C34 800A0034 30630002 */  andi       $v1, $v1, 2
/* A0C38 800A0038 54600004 */  bnel       $v1, $zero, .L800A004C
/* A0C3C 800A003C 8E040008 */   lw        $a0, 8($s0)
/* A0C40 800A0040 0C027F50 */  jal        func_8009FD40
/* A0C44 800A0044 02002021 */   addu      $a0, $s0, $zero
/* A0C48 800A0048 8E040008 */  lw         $a0, 8($s0)
.L800A004C:
/* A0C4C 800A004C 0C02A024 */  jal        set_animation_speed
/* A0C50 800A0050 24050001 */   addiu     $a1, $zero, 1
/* A0C54 800A0054 8FBF0014 */  lw         $ra, 0x14($sp)
/* A0C58 800A0058 8FB00010 */  lw         $s0, 0x10($sp)
/* A0C5C 800A005C 03E00008 */  jr         $ra
/* A0C60 800A0060 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A0064
/* A0C64 800A0064 8C82001C */  lw         $v0, 0x1c($a0)
/* A0C68 800A0068 8C430004 */  lw         $v1, 4($v0)
/* A0C6C 800A006C 8C850008 */  lw         $a1, 8($a0)
/* A0C70 800A0070 8C640020 */  lw         $a0, 0x20($v1)
/* A0C74 800A0074 94A201F8 */  lhu        $v0, 0x1f8($a1)
/* A0C78 800A0078 8C83000C */  lw         $v1, 0xc($a0)
/* A0C7C 800A007C 0043102A */  slt        $v0, $v0, $v1
/* A0C80 800A0080 03E00008 */  jr         $ra
/* A0C84 800A0084 38420001 */   xori      $v0, $v0, 1

glabel func_800A0088
/* A0C88 800A0088 03E00008 */  jr         $ra
/* A0C8C 800A008C 00000000 */   nop

glabel func_800A0090
/* A0C90 800A0090 8C82001C */  lw         $v0, 0x1c($a0)
/* A0C94 800A0094 8C430000 */  lw         $v1, ($v0)
/* A0C98 800A0098 00052C00 */  sll        $a1, $a1, 0x10
/* A0C9C 800A009C 8C660008 */  lw         $a2, 8($v1)
/* A0CA0 800A00A0 84630006 */  lh         $v1, 6($v1)
/* A0CA4 800A00A4 0802802C */  j          .L800A00B0
/* A0CA8 800A00A8 00052C03 */   sra       $a1, $a1, 0x10
.L800A00AC:
/* A0CAC 800A00AC 24C60004 */  addiu      $a2, $a2, 4
.L800A00B0:
/* A0CB0 800A00B0 10600005 */  beqz       $v1, .L800A00C8
/* A0CB4 800A00B4 00000000 */   nop
/* A0CB8 800A00B8 90C20000 */  lbu        $v0, ($a2)
/* A0CBC 800A00BC 14A2FFFB */  bne        $a1, $v0, .L800A00AC
/* A0CC0 800A00C0 2463FFFF */   addiu     $v1, $v1, -1
/* A0CC4 800A00C4 A485000C */  sh         $a1, 0xc($a0)
.L800A00C8:
/* A0CC8 800A00C8 03E00008 */  jr         $ra
/* A0CCC 800A00CC 00000000 */   nop

glabel func_800A00D0
/* A0CD0 800A00D0 3C03800F */  lui        $v1, %hi(D_800F3390)
/* A0CD4 800A00D4 8C623390 */  lw         $v0, %lo(D_800F3390)($v1)
/* A0CD8 800A00D8 27BDFF98 */  addiu      $sp, $sp, -0x68
/* A0CDC 800A00DC AFB10054 */  sw         $s1, 0x54($sp)
/* A0CE0 800A00E0 00808821 */  addu       $s1, $a0, $zero
/* A0CE4 800A00E4 AFBF0060 */  sw         $ra, 0x60($sp)
/* A0CE8 800A00E8 AFB3005C */  sw         $s3, 0x5c($sp)
/* A0CEC 800A00EC AFB20058 */  sw         $s2, 0x58($sp)
/* A0CF0 800A00F0 14400003 */  bnez       $v0, .L800A0100
/* A0CF4 800A00F4 AFB00050 */   sw        $s0, 0x50($sp)
/* A0CF8 800A00F8 24020001 */  addiu      $v0, $zero, 1
/* A0CFC 800A00FC AC623390 */  sw         $v0, 0x3390($v1)
.L800A0100:
/* A0D00 800A0100 00009821 */  addu       $s3, $zero, $zero
/* A0D04 800A0104 8E22001C */  lw         $v0, 0x1c($s1)
/* A0D08 800A0108 02202021 */  addu       $a0, $s1, $zero
/* A0D0C 800A010C 0C028019 */  jal        func_800A0064
/* A0D10 800A0110 8C520000 */   lw        $s2, ($v0)
/* A0D14 800A0114 10400024 */  beqz       $v0, .L800A01A8
/* A0D18 800A0118 3C04800F */   lui       $a0, %hi(D_800F5570)
/* A0D1C 800A011C 24845570 */  addiu      $a0, $a0, %lo(D_800F5570)
/* A0D20 800A0120 00002821 */  addu       $a1, $zero, $zero
/* A0D24 800A0124 24060063 */  addiu      $a2, $zero, 0x63
/* A0D28 800A0128 0C0273A9 */  jal        rand_range_
/* A0D2C 800A012C 8E500008 */   lw        $s0, 8($s2)
/* A0D30 800A0130 00402821 */  addu       $a1, $v0, $zero
/* A0D34 800A0134 00003021 */  addu       $a2, $zero, $zero
/* A0D38 800A0138 86440006 */  lh         $a0, 6($s2)
/* A0D3C 800A013C 08028052 */  j          .L800A0148
/* A0D40 800A0140 240700FF */   addiu     $a3, $zero, 0xff
.L800A0144:
/* A0D44 800A0144 26100004 */  addiu      $s0, $s0, 4
.L800A0148:
/* A0D48 800A0148 10800010 */  beqz       $a0, .L800A018C
/* A0D4C 800A014C 00000000 */   nop
/* A0D50 800A0150 8622000C */  lh         $v0, 0xc($s1)
/* A0D54 800A0154 92030000 */  lbu        $v1, ($s0)
/* A0D58 800A0158 50430004 */  beql       $v0, $v1, .L800A016C
/* A0D5C 800A015C 92020001 */   lbu       $v0, 1($s0)
/* A0D60 800A0160 5467FFF8 */  bnel       $v1, $a3, .L800A0144
/* A0D64 800A0164 2484FFFF */   addiu     $a0, $a0, -1
/* A0D68 800A0168 92020001 */  lbu        $v0, 1($s0)
.L800A016C:
/* A0D6C 800A016C 00A22823 */  subu       $a1, $a1, $v0
/* A0D70 800A0170 1CA0FFF4 */  bgtz       $a1, .L800A0144
/* A0D74 800A0174 2484FFFF */   addiu     $a0, $a0, -1
/* A0D78 800A0178 24130001 */  addiu      $s3, $zero, 1
/* A0D7C 800A017C 02202021 */  addu       $a0, $s1, $zero
/* A0D80 800A0180 0C027F82 */  jal        takeBranch
/* A0D84 800A0184 02002821 */   addu      $a1, $s0, $zero
/* A0D88 800A0188 24060001 */  addiu      $a2, $zero, 1
.L800A018C:
/* A0D8C 800A018C 14C00024 */  bnez       $a2, .L800A0220
/* A0D90 800A0190 00000000 */   nop
/* A0D94 800A0194 24130001 */  addiu      $s3, $zero, 1
/* A0D98 800A0198 0C027F7B */  jal        func_8009FDEC
/* A0D9C 800A019C 02202021 */   addu      $a0, $s1, $zero
/* A0DA0 800A01A0 08028088 */  j          .L800A0220
/* A0DA4 800A01A4 00000000 */   nop
.L800A01A8:
/* A0DA8 800A01A8 8623000E */  lh         $v1, 0xe($s1)
/* A0DAC 800A01AC 8622000C */  lh         $v0, 0xc($s1)
/* A0DB0 800A01B0 1062001F */  beq        $v1, $v0, .L800A0230
/* A0DB4 800A01B4 24845570 */   addiu     $a0, $a0, 0x5570
/* A0DB8 800A01B8 00002821 */  addu       $a1, $zero, $zero
/* A0DBC 800A01BC 24060063 */  addiu      $a2, $zero, 0x63
/* A0DC0 800A01C0 0C0273A9 */  jal        rand_range_
/* A0DC4 800A01C4 8E500008 */   lw        $s0, 8($s2)
/* A0DC8 800A01C8 86440006 */  lh         $a0, 6($s2)
/* A0DCC 800A01CC 08028076 */  j          .L800A01D8
/* A0DD0 800A01D0 00402821 */   addu      $a1, $v0, $zero
.L800A01D4:
/* A0DD4 800A01D4 26100004 */  addiu      $s0, $s0, 4
.L800A01D8:
/* A0DD8 800A01D8 5080001A */  beql       $a0, $zero, .L800A0244
/* A0DDC 800A01DC 8E240008 */   lw        $a0, 8($s1)
/* A0DE0 800A01E0 8623000C */  lh         $v1, 0xc($s1)
/* A0DE4 800A01E4 92020000 */  lbu        $v0, ($s0)
/* A0DE8 800A01E8 5462FFFA */  bnel       $v1, $v0, .L800A01D4
/* A0DEC 800A01EC 2484FFFF */   addiu     $a0, $a0, -1
/* A0DF0 800A01F0 92020002 */  lbu        $v0, 2($s0)
/* A0DF4 800A01F4 30420001 */  andi       $v0, $v0, 1
/* A0DF8 800A01F8 5040FFF6 */  beql       $v0, $zero, .L800A01D4
/* A0DFC 800A01FC 2484FFFF */   addiu     $a0, $a0, -1
/* A0E00 800A0200 92020001 */  lbu        $v0, 1($s0)
/* A0E04 800A0204 00A22823 */  subu       $a1, $a1, $v0
/* A0E08 800A0208 5CA0FFF2 */  bgtzl      $a1, .L800A01D4
/* A0E0C 800A020C 2484FFFF */   addiu     $a0, $a0, -1
/* A0E10 800A0210 24130001 */  addiu      $s3, $zero, 1
/* A0E14 800A0214 02202021 */  addu       $a0, $s1, $zero
/* A0E18 800A0218 0C027F82 */  jal        takeBranch
/* A0E1C 800A021C 02002821 */   addu      $a1, $s0, $zero
.L800A0220:
/* A0E20 800A0220 0C028166 */  jal        func_800A0598
/* A0E24 800A0224 02202021 */   addu      $a0, $s1, $zero
/* A0E28 800A0228 08028091 */  j          .L800A0244
/* A0E2C 800A022C 8E240008 */   lw        $a0, 8($s1)
.L800A0230:
/* A0E30 800A0230 0C028006 */  jal        func_800A0018
/* A0E34 800A0234 02202021 */   addu      $a0, $s1, $zero
/* A0E38 800A0238 0C0282FE */  jal        func_800A0BF8
/* A0E3C 800A023C 8E240008 */   lw        $a0, 8($s1)
/* A0E40 800A0240 8E240008 */  lw         $a0, 8($s1)
.L800A0244:
/* A0E44 800A0244 8E260050 */  lw         $a2, 0x50($s1)
/* A0E48 800A0248 9622000C */  lhu        $v0, 0xc($s1)
/* A0E4C 800A024C 96230010 */  lhu        $v1, 0x10($s1)
/* A0E50 800A0250 27A50010 */  addiu      $a1, $sp, 0x10
/* A0E54 800A0254 A622000E */  sh         $v0, 0xe($s1)
/* A0E58 800A0258 0C02A02B */  jal        func_800A80AC
/* A0E5C 800A025C A623000C */   sh        $v1, 0xc($s1)
/* A0E60 800A0260 86220012 */  lh         $v0, 0x12($s1)
/* A0E64 800A0264 54400004 */  bnel       $v0, $zero, .L800A0278
/* A0E68 800A0268 AE20002C */   sw        $zero, 0x2c($s1)
/* A0E6C 800A026C 12600005 */  beqz       $s3, .L800A0284
/* A0E70 800A0270 C7A60010 */   lwc1      $f6, 0x10($sp)
/* A0E74 800A0274 AE20002C */  sw         $zero, 0x2c($s1)
.L800A0278:
/* A0E78 800A0278 AE200030 */  sw         $zero, 0x30($s1)
/* A0E7C 800A027C 080280AC */  j          .L800A02B0
/* A0E80 800A0280 AE200034 */   sw        $zero, 0x34($s1)
.L800A0284:
/* A0E84 800A0284 C6200020 */  lwc1       $f0, 0x20($s1)
/* A0E88 800A0288 C7A40014 */  lwc1       $f4, 0x14($sp)
/* A0E8C 800A028C 46003181 */  sub.s      $f6, $f6, $f0
/* A0E90 800A0290 C6200024 */  lwc1       $f0, 0x24($s1)
/* A0E94 800A0294 C7A20018 */  lwc1       $f2, 0x18($sp)
/* A0E98 800A0298 46002101 */  sub.s      $f4, $f4, $f0
/* A0E9C 800A029C C6200028 */  lwc1       $f0, 0x28($s1)
/* A0EA0 800A02A0 46001081 */  sub.s      $f2, $f2, $f0
/* A0EA4 800A02A4 E626002C */  swc1       $f6, 0x2c($s1)
/* A0EA8 800A02A8 E6240030 */  swc1       $f4, 0x30($s1)
/* A0EAC 800A02AC E6220034 */  swc1       $f2, 0x34($s1)
.L800A02B0:
/* A0EB0 800A02B0 16600005 */  bnez       $s3, .L800A02C8
/* A0EB4 800A02B4 24020002 */   addiu     $v0, $zero, 2
/* A0EB8 800A02B8 86220012 */  lh         $v0, 0x12($s1)
/* A0EBC 800A02BC 10400003 */  beqz       $v0, .L800A02CC
/* A0EC0 800A02C0 96230012 */   lhu       $v1, 0x12($s1)
/* A0EC4 800A02C4 2462FFFF */  addiu      $v0, $v1, -1
.L800A02C8:
/* A0EC8 800A02C8 A6220012 */  sh         $v0, 0x12($s1)
.L800A02CC:
/* A0ECC 800A02CC 02601021 */  addu       $v0, $s3, $zero
/* A0ED0 800A02D0 C7A00010 */  lwc1       $f0, 0x10($sp)
/* A0ED4 800A02D4 C7A20014 */  lwc1       $f2, 0x14($sp)
/* A0ED8 800A02D8 C7A40018 */  lwc1       $f4, 0x18($sp)
/* A0EDC 800A02DC 8FBF0060 */  lw         $ra, 0x60($sp)
/* A0EE0 800A02E0 8FB3005C */  lw         $s3, 0x5c($sp)
/* A0EE4 800A02E4 8FB20058 */  lw         $s2, 0x58($sp)
/* A0EE8 800A02E8 8FB00050 */  lw         $s0, 0x50($sp)
/* A0EEC 800A02EC E6200020 */  swc1       $f0, 0x20($s1)
/* A0EF0 800A02F0 E6220024 */  swc1       $f2, 0x24($s1)
/* A0EF4 800A02F4 E6240028 */  swc1       $f4, 0x28($s1)
/* A0EF8 800A02F8 8FB10054 */  lw         $s1, 0x54($sp)
/* A0EFC 800A02FC 03E00008 */  jr         $ra
/* A0F00 800A0300 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_800A0304
/* A0F04 800A0304 3C03800F */  lui        $v1, %hi(D_800F3394)
/* A0F08 800A0308 8C623394 */  lw         $v0, %lo(D_800F3394)($v1)
/* A0F0C 800A030C 27BDFF90 */  addiu      $sp, $sp, -0x70
/* A0F10 800A0310 AFB10054 */  sw         $s1, 0x54($sp)
/* A0F14 800A0314 00808821 */  addu       $s1, $a0, $zero
/* A0F18 800A0318 AFB60068 */  sw         $s6, 0x68($sp)
/* A0F1C 800A031C 00A0B021 */  addu       $s6, $a1, $zero
/* A0F20 800A0320 AFBF006C */  sw         $ra, 0x6c($sp)
/* A0F24 800A0324 AFB50064 */  sw         $s5, 0x64($sp)
/* A0F28 800A0328 AFB40060 */  sw         $s4, 0x60($sp)
/* A0F2C 800A032C AFB3005C */  sw         $s3, 0x5c($sp)
/* A0F30 800A0330 AFB20058 */  sw         $s2, 0x58($sp)
/* A0F34 800A0334 14400003 */  bnez       $v0, .L800A0344
/* A0F38 800A0338 AFB00050 */   sw        $s0, 0x50($sp)
/* A0F3C 800A033C 24020001 */  addiu      $v0, $zero, 1
/* A0F40 800A0340 AC623394 */  sw         $v0, 0x3394($v1)
.L800A0344:
/* A0F44 800A0344 00009021 */  addu       $s2, $zero, $zero
/* A0F48 800A0348 8E22001C */  lw         $v0, 0x1c($s1)
/* A0F4C 800A034C 00009821 */  addu       $s3, $zero, $zero
/* A0F50 800A0350 1AC00083 */  blez       $s6, .L800A0560
/* A0F54 800A0354 8C540000 */   lw        $s4, ($v0)
/* A0F58 800A0358 3C15800F */  lui        $s5, %hi(D_800F5574)
.L800A035C:
/* A0F5C 800A035C 0C028019 */  jal        func_800A0064
/* A0F60 800A0360 02202021 */   addu      $a0, $s1, $zero
/* A0F64 800A0364 10400023 */  beqz       $v0, .L800A03F4
/* A0F68 800A0368 26A45574 */   addiu     $a0, $s5, %lo(D_800F5574)
/* A0F6C 800A036C 00002821 */  addu       $a1, $zero, $zero
/* A0F70 800A0370 24060063 */  addiu      $a2, $zero, 0x63
/* A0F74 800A0374 0C0273A9 */  jal        rand_range_
/* A0F78 800A0378 8E900008 */   lw        $s0, 8($s4)
/* A0F7C 800A037C 00402021 */  addu       $a0, $v0, $zero
/* A0F80 800A0380 86850006 */  lh         $a1, 6($s4)
/* A0F84 800A0384 00003021 */  addu       $a2, $zero, $zero
/* A0F88 800A0388 080280E5 */  j          .L800A0394
/* A0F8C 800A038C 26520001 */   addiu     $s2, $s2, 1
.L800A0390:
/* A0F90 800A0390 26100004 */  addiu      $s0, $s0, 4
.L800A0394:
/* A0F94 800A0394 10A00010 */  beqz       $a1, .L800A03D8
/* A0F98 800A0398 00000000 */   nop
/* A0F9C 800A039C 8622000C */  lh         $v0, 0xc($s1)
/* A0FA0 800A03A0 92030000 */  lbu        $v1, ($s0)
/* A0FA4 800A03A4 10430003 */  beq        $v0, $v1, .L800A03B4
/* A0FA8 800A03A8 240200FF */   addiu     $v0, $zero, 0xff
/* A0FAC 800A03AC 5462FFF8 */  bnel       $v1, $v0, .L800A0390
/* A0FB0 800A03B0 24A5FFFF */   addiu     $a1, $a1, -1
.L800A03B4:
/* A0FB4 800A03B4 92020001 */  lbu        $v0, 1($s0)
/* A0FB8 800A03B8 00822023 */  subu       $a0, $a0, $v0
/* A0FBC 800A03BC 1C80FFF4 */  bgtz       $a0, .L800A0390
/* A0FC0 800A03C0 24A5FFFF */   addiu     $a1, $a1, -1
/* A0FC4 800A03C4 24130001 */  addiu      $s3, $zero, 1
/* A0FC8 800A03C8 02202021 */  addu       $a0, $s1, $zero
/* A0FCC 800A03CC 0C027F82 */  jal        takeBranch
/* A0FD0 800A03D0 02002821 */   addu      $a1, $s0, $zero
/* A0FD4 800A03D4 24060001 */  addiu      $a2, $zero, 1
.L800A03D8:
/* A0FD8 800A03D8 14C00024 */  bnez       $a2, .L800A046C
/* A0FDC 800A03DC 00000000 */   nop
/* A0FE0 800A03E0 24130001 */  addiu      $s3, $zero, 1
/* A0FE4 800A03E4 0C027F7B */  jal        func_8009FDEC
/* A0FE8 800A03E8 02202021 */   addu      $a0, $s1, $zero
/* A0FEC 800A03EC 0802811B */  j          .L800A046C
/* A0FF0 800A03F0 00000000 */   nop
.L800A03F4:
/* A0FF4 800A03F4 8623000E */  lh         $v1, 0xe($s1)
/* A0FF8 800A03F8 8622000C */  lh         $v0, 0xc($s1)
/* A0FFC 800A03FC 1062001F */  beq        $v1, $v0, .L800A047C
/* A1000 800A0400 00002821 */   addu      $a1, $zero, $zero
/* A1004 800A0404 24060063 */  addiu      $a2, $zero, 0x63
/* A1008 800A0408 0C0273A9 */  jal        rand_range_
/* A100C 800A040C 8E900008 */   lw        $s0, 8($s4)
/* A1010 800A0410 86850006 */  lh         $a1, 6($s4)
/* A1014 800A0414 00402021 */  addu       $a0, $v0, $zero
/* A1018 800A0418 08028109 */  j          .L800A0424
/* A101C 800A041C 26520001 */   addiu     $s2, $s2, 1
.L800A0420:
/* A1020 800A0420 26100004 */  addiu      $s0, $s0, 4
.L800A0424:
/* A1024 800A0424 50A00024 */  beql       $a1, $zero, .L800A04B8
/* A1028 800A0428 8E240008 */   lw        $a0, 8($s1)
/* A102C 800A042C 8623000C */  lh         $v1, 0xc($s1)
/* A1030 800A0430 92020000 */  lbu        $v0, ($s0)
/* A1034 800A0434 1462FFFA */  bne        $v1, $v0, .L800A0420
/* A1038 800A0438 24A5FFFF */   addiu     $a1, $a1, -1
/* A103C 800A043C 92020002 */  lbu        $v0, 2($s0)
/* A1040 800A0440 30420001 */  andi       $v0, $v0, 1
/* A1044 800A0444 1040FFF6 */  beqz       $v0, .L800A0420
/* A1048 800A0448 00000000 */   nop
/* A104C 800A044C 92020001 */  lbu        $v0, 1($s0)
/* A1050 800A0450 00822023 */  subu       $a0, $a0, $v0
/* A1054 800A0454 5C80FFF3 */  bgtzl      $a0, .L800A0424
/* A1058 800A0458 26100004 */   addiu     $s0, $s0, 4
/* A105C 800A045C 24130001 */  addiu      $s3, $zero, 1
/* A1060 800A0460 02202021 */  addu       $a0, $s1, $zero
/* A1064 800A0464 0C027F82 */  jal        takeBranch
/* A1068 800A0468 02002821 */   addu      $a1, $s0, $zero
.L800A046C:
/* A106C 800A046C 0C028166 */  jal        func_800A0598
/* A1070 800A0470 02202021 */   addu      $a0, $s1, $zero
/* A1074 800A0474 0802812E */  j          .L800A04B8
/* A1078 800A0478 8E240008 */   lw        $a0, 8($s1)
.L800A047C:
/* A107C 800A047C 8E22001C */  lw         $v0, 0x1c($s1)
/* A1080 800A0480 8C440000 */  lw         $a0, ($v0)
/* A1084 800A0484 94830004 */  lhu        $v1, 4($a0)
/* A1088 800A0488 30630002 */  andi       $v1, $v1, 2
/* A108C 800A048C 14600004 */  bnez       $v1, .L800A04A0
/* A1090 800A0490 24050001 */   addiu     $a1, $zero, 1
/* A1094 800A0494 0C027F50 */  jal        func_8009FD40
/* A1098 800A0498 02202021 */   addu      $a0, $s1, $zero
/* A109C 800A049C 24050001 */  addiu      $a1, $zero, 1
.L800A04A0:
/* A10A0 800A04A0 0C02A024 */  jal        set_animation_speed
/* A10A4 800A04A4 8E240008 */   lw        $a0, 8($s1)
/* A10A8 800A04A8 8E240008 */  lw         $a0, 8($s1)
/* A10AC 800A04AC 0C0282FE */  jal        func_800A0BF8
/* A10B0 800A04B0 26520001 */   addiu     $s2, $s2, 1
/* A10B4 800A04B4 8E240008 */  lw         $a0, 8($s1)
.L800A04B8:
/* A10B8 800A04B8 8E260050 */  lw         $a2, 0x50($s1)
/* A10BC 800A04BC 9622000C */  lhu        $v0, 0xc($s1)
/* A10C0 800A04C0 96230010 */  lhu        $v1, 0x10($s1)
/* A10C4 800A04C4 27A50010 */  addiu      $a1, $sp, 0x10
/* A10C8 800A04C8 A622000E */  sh         $v0, 0xe($s1)
/* A10CC 800A04CC 0C02A02B */  jal        func_800A80AC
/* A10D0 800A04D0 A623000C */   sh        $v1, 0xc($s1)
/* A10D4 800A04D4 86220012 */  lh         $v0, 0x12($s1)
/* A10D8 800A04D8 54400004 */  bnel       $v0, $zero, .L800A04EC
/* A10DC 800A04DC AE20002C */   sw        $zero, 0x2c($s1)
/* A10E0 800A04E0 12600005 */  beqz       $s3, .L800A04F8
/* A10E4 800A04E4 C7A60010 */   lwc1      $f6, 0x10($sp)
/* A10E8 800A04E8 AE20002C */  sw         $zero, 0x2c($s1)
.L800A04EC:
/* A10EC 800A04EC AE200030 */  sw         $zero, 0x30($s1)
/* A10F0 800A04F0 08028149 */  j          .L800A0524
/* A10F4 800A04F4 AE200034 */   sw        $zero, 0x34($s1)
.L800A04F8:
/* A10F8 800A04F8 C6200020 */  lwc1       $f0, 0x20($s1)
/* A10FC 800A04FC C7A40014 */  lwc1       $f4, 0x14($sp)
/* A1100 800A0500 46003181 */  sub.s      $f6, $f6, $f0
/* A1104 800A0504 C6200024 */  lwc1       $f0, 0x24($s1)
/* A1108 800A0508 C7A20018 */  lwc1       $f2, 0x18($sp)
/* A110C 800A050C 46002101 */  sub.s      $f4, $f4, $f0
/* A1110 800A0510 C6200028 */  lwc1       $f0, 0x28($s1)
/* A1114 800A0514 46001081 */  sub.s      $f2, $f2, $f0
/* A1118 800A0518 E626002C */  swc1       $f6, 0x2c($s1)
/* A111C 800A051C E6240030 */  swc1       $f4, 0x30($s1)
/* A1120 800A0520 E6220034 */  swc1       $f2, 0x34($s1)
.L800A0524:
/* A1124 800A0524 16600005 */  bnez       $s3, .L800A053C
/* A1128 800A0528 24020002 */   addiu     $v0, $zero, 2
/* A112C 800A052C 86220012 */  lh         $v0, 0x12($s1)
/* A1130 800A0530 10400003 */  beqz       $v0, .L800A0540
/* A1134 800A0534 96230012 */   lhu       $v1, 0x12($s1)
/* A1138 800A0538 2462FFFF */  addiu      $v0, $v1, -1
.L800A053C:
/* A113C 800A053C A6220012 */  sh         $v0, 0x12($s1)
.L800A0540:
/* A1140 800A0540 C7A00010 */  lwc1       $f0, 0x10($sp)
/* A1144 800A0544 C7A20014 */  lwc1       $f2, 0x14($sp)
/* A1148 800A0548 C7A40018 */  lwc1       $f4, 0x18($sp)
/* A114C 800A054C 0256102A */  slt        $v0, $s2, $s6
/* A1150 800A0550 E6200020 */  swc1       $f0, 0x20($s1)
/* A1154 800A0554 E6220024 */  swc1       $f2, 0x24($s1)
/* A1158 800A0558 1440FF80 */  bnez       $v0, .L800A035C
/* A115C 800A055C E6240028 */   swc1      $f4, 0x28($s1)
.L800A0560:
/* A1160 800A0560 02601021 */  addu       $v0, $s3, $zero
/* A1164 800A0564 8FBF006C */  lw         $ra, 0x6c($sp)
/* A1168 800A0568 8FB60068 */  lw         $s6, 0x68($sp)
/* A116C 800A056C 8FB50064 */  lw         $s5, 0x64($sp)
/* A1170 800A0570 8FB40060 */  lw         $s4, 0x60($sp)
/* A1174 800A0574 8FB3005C */  lw         $s3, 0x5c($sp)
/* A1178 800A0578 8FB20058 */  lw         $s2, 0x58($sp)
/* A117C 800A057C 8FB10054 */  lw         $s1, 0x54($sp)
/* A1180 800A0580 8FB00050 */  lw         $s0, 0x50($sp)
/* A1184 800A0584 03E00008 */  jr         $ra
/* A1188 800A0588 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_800A058C
/* A118C 800A058C 8C830008 */  lw         $v1, 8($a0)
/* A1190 800A0590 03E00008 */  jr         $ra
/* A1194 800A0594 946201F8 */   lhu       $v0, 0x1f8($v1)

glabel func_800A0598
/* A1198 800A0598 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* A119C 800A059C AFB3001C */  sw         $s3, 0x1c($sp)
/* A11A0 800A05A0 00809821 */  addu       $s3, $a0, $zero
/* A11A4 800A05A4 AFBF0020 */  sw         $ra, 0x20($sp)
/* A11A8 800A05A8 AFB20018 */  sw         $s2, 0x18($sp)
/* A11AC 800A05AC AFB10014 */  sw         $s1, 0x14($sp)
/* A11B0 800A05B0 AFB00010 */  sw         $s0, 0x10($sp)
/* A11B4 800A05B4 8E630008 */  lw         $v1, 8($s3)
/* A11B8 800A05B8 8C620000 */  lw         $v0, ($v1)
/* A11BC 800A05BC 8C510050 */  lw         $s1, 0x50($v0)
/* A11C0 800A05C0 1220001A */  beqz       $s1, .L800A062C
/* A11C4 800A05C4 8FBF0020 */   lw        $ra, 0x20($sp)
/* A11C8 800A05C8 8C6202A0 */  lw         $v0, 0x2a0($v1)
/* A11CC 800A05CC 50400018 */  beql       $v0, $zero, .L800A0630
/* A11D0 800A05D0 8FB3001C */   lw        $s3, 0x1c($sp)
/* A11D4 800A05D4 12200015 */  beqz       $s1, .L800A062C
/* A11D8 800A05D8 00008021 */   addu      $s0, $zero, $zero
/* A11DC 800A05DC 00009021 */  addu       $s2, $zero, $zero
.L800A05E0:
/* A11E0 800A05E0 8E650008 */  lw         $a1, 8($s3)
/* A11E4 800A05E4 8CA20000 */  lw         $v0, ($a1)
/* A11E8 800A05E8 8C43004C */  lw         $v1, 0x4c($v0)
/* A11EC 800A05EC 00723021 */  addu       $a2, $v1, $s2
/* A11F0 800A05F0 94C2000E */  lhu        $v0, 0xe($a2)
/* A11F4 800A05F4 30420020 */  andi       $v0, $v0, 0x20
/* A11F8 800A05F8 50400008 */  beql       $v0, $zero, .L800A061C
/* A11FC 800A05FC 26100001 */   addiu     $s0, $s0, 1
/* A1200 800A0600 94C30004 */  lhu        $v1, 4($a2)
/* A1204 800A0604 8662000C */  lh         $v0, 0xc($s3)
/* A1208 800A0608 54620004 */  bnel       $v1, $v0, .L800A061C
/* A120C 800A060C 26100001 */   addiu     $s0, $s0, 1
/* A1210 800A0610 0C02CF06 */  jal        func_800B3C18
/* A1214 800A0614 8CA402A0 */   lw        $a0, 0x2a0($a1)
/* A1218 800A0618 26100001 */  addiu      $s0, $s0, 1
.L800A061C:
/* A121C 800A061C 0211102B */  sltu       $v0, $s0, $s1
/* A1220 800A0620 1440FFEF */  bnez       $v0, .L800A05E0
/* A1224 800A0624 265200C0 */   addiu     $s2, $s2, 0xc0
/* A1228 800A0628 8FBF0020 */  lw         $ra, 0x20($sp)
.L800A062C:
/* A122C 800A062C 8FB3001C */  lw         $s3, 0x1c($sp)
.L800A0630:
/* A1230 800A0630 8FB20018 */  lw         $s2, 0x18($sp)
/* A1234 800A0634 8FB10014 */  lw         $s1, 0x14($sp)
/* A1238 800A0638 8FB00010 */  lw         $s0, 0x10($sp)
/* A123C 800A063C 03E00008 */  jr         $ra
/* A1240 800A0640 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800A0644
/* A1244 800A0644 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* A1248 800A0648 44800000 */  mtc1       $zero, $f0
/* A124C 800A064C 3C02800F */  lui        $v0, %hi(D_800F5580)
/* A1250 800A0650 AFB20058 */  sw         $s2, 0x58($sp)
/* A1254 800A0654 24525580 */  addiu      $s2, $v0, %lo(D_800F5580)
/* A1258 800A0658 AFB00050 */  sw         $s0, 0x50($sp)
/* A125C 800A065C 00A08021 */  addu       $s0, $a1, $zero
/* A1260 800A0660 AFBF005C */  sw         $ra, 0x5c($sp)
/* A1264 800A0664 AFB10054 */  sw         $s1, 0x54($sp)
/* A1268 800A0668 E6400008 */  swc1       $f0, 8($s2)
/* A126C 800A066C E6400004 */  swc1       $f0, 4($s2)
/* A1270 800A0670 E4405580 */  swc1       $f0, 0x5580($v0)
/* A1274 800A0674 8E020008 */  lw         $v0, 8($s0)
/* A1278 800A0678 1040001F */  beqz       $v0, .L800A06F8
/* A127C 800A067C 00808821 */   addu      $s1, $a0, $zero
/* A1280 800A0680 00402021 */  addu       $a0, $v0, $zero
/* A1284 800A0684 8E060050 */  lw         $a2, 0x50($s0)
/* A1288 800A0688 0C02A02B */  jal        func_800A80AC
/* A128C 800A068C 27A50010 */   addiu     $a1, $sp, 0x10
/* A1290 800A0690 8E040008 */  lw         $a0, 8($s0)
/* A1294 800A0694 8E060050 */  lw         $a2, 0x50($s0)
/* A1298 800A0698 0C02A036 */  jal        func_800A80D8
/* A129C 800A069C 02402821 */   addu      $a1, $s2, $zero
/* A12A0 800A06A0 0C027BCD */  jal        func_8009EF34
/* A12A4 800A06A4 8E040008 */   lw        $a0, 8($s0)
/* A12A8 800A06A8 8E050008 */  lw         $a1, 8($s0)
/* A12AC 800A06AC 8CA201F4 */  lw         $v0, 0x1f4($a1)
/* A12B0 800A06B0 30420040 */  andi       $v0, $v0, 0x40
/* A12B4 800A06B4 14400009 */  bnez       $v0, .L800A06DC
/* A12B8 800A06B8 00000000 */   nop
/* A12BC 800A06BC 8CA20000 */  lw         $v0, ($a1)
/* A12C0 800A06C0 8C430034 */  lw         $v1, 0x34($v0)
/* A12C4 800A06C4 10600005 */  beqz       $v1, .L800A06DC
/* A12C8 800A06C8 00000000 */   nop
/* A12CC 800A06CC 0C02855B */  jal        gsAnimationDataMtx
/* A12D0 800A06D0 02202021 */   addu      $a0, $s1, $zero
/* A12D4 800A06D4 00408821 */  addu       $s1, $v0, $zero
/* A12D8 800A06D8 8E050008 */  lw         $a1, 8($s0)
.L800A06DC:
/* A12DC 800A06DC 0C02857F */  jal        BorgAnimDrawSceneRaw
/* A12E0 800A06E0 02202021 */   addu      $a0, $s1, $zero
/* A12E4 800A06E4 00408821 */  addu       $s1, $v0, $zero
/* A12E8 800A06E8 8E040008 */  lw         $a0, 8($s0)
/* A12EC 800A06EC 8E060050 */  lw         $a2, 0x50($s0)
/* A12F0 800A06F0 0C02A036 */  jal        func_800A80D8
/* A12F4 800A06F4 27A50010 */   addiu     $a1, $sp, 0x10
.L800A06F8:
/* A12F8 800A06F8 02201021 */  addu       $v0, $s1, $zero
/* A12FC 800A06FC 8FBF005C */  lw         $ra, 0x5c($sp)
/* A1300 800A0700 8FB20058 */  lw         $s2, 0x58($sp)
/* A1304 800A0704 8FB10054 */  lw         $s1, 0x54($sp)
/* A1308 800A0708 8FB00050 */  lw         $s0, 0x50($sp)
/* A130C 800A070C 03E00008 */  jr         $ra
/* A1310 800A0710 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_800A0714
/* A1314 800A0714 8C830000 */  lw         $v1, ($a0)
/* A1318 800A0718 8C860008 */  lw         $a2, 8($a0)
/* A131C 800A071C 8C620004 */  lw         $v0, 4($v1)
/* A1320 800A0720 AC820004 */  sw         $v0, 4($a0)
/* A1324 800A0724 8C650004 */  lw         $a1, 4($v1)
/* A1328 800A0728 24020001 */  addiu      $v0, $zero, 1
/* A132C 800A072C A482000C */  sh         $v0, 0xc($a0)
/* A1330 800A0730 84A30002 */  lh         $v1, 2($a1)
/* A1334 800A0734 10600009 */  beqz       $v1, .L800A075C
/* A1338 800A0738 8CA40004 */   lw        $a0, 4($a1)
.L800A073C:
/* A133C 800A073C 30620001 */  andi       $v0, $v1, 1
/* A1340 800A0740 10400004 */  beqz       $v0, .L800A0754
/* A1344 800A0744 00031843 */   sra       $v1, $v1, 1
/* A1348 800A0748 C4800000 */  lwc1       $f0, ($a0)
/* A134C 800A074C 24840004 */  addiu      $a0, $a0, 4
/* A1350 800A0750 E4C00000 */  swc1       $f0, ($a2)
.L800A0754:
/* A1354 800A0754 1460FFF9 */  bnez       $v1, .L800A073C
/* A1358 800A0758 24C60004 */   addiu     $a2, $a2, 4
.L800A075C:
/* A135C 800A075C 03E00008 */  jr         $ra
/* A1360 800A0760 00000000 */   nop

glabel func_800A0764
/* A1364 800A0764 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A1368 800A0768 00803021 */  addu       $a2, $a0, $zero
/* A136C 800A076C AFBF0010 */  sw         $ra, 0x10($sp)
/* A1370 800A0770 8CC20000 */  lw         $v0, ($a2)
/* A1374 800A0774 24040001 */  addiu      $a0, $zero, 1
/* A1378 800A0778 8C430004 */  lw         $v1, 4($v0)
/* A137C 800A077C 44850000 */  mtc1       $a1, $f0
/* A1380 800A0780 14640005 */  bne        $v1, $a0, .L800A0798
/* A1384 800A0784 00000000 */   nop
/* A1388 800A0788 0C028200 */  jal        func_800A0800
/* A138C 800A078C 00C02021 */   addu      $a0, $a2, $zero
/* A1390 800A0790 080281EA */  j          .L800A07A8
/* A1394 800A0794 8FBF0010 */   lw        $ra, 0x10($sp)
.L800A0798:
/* A1398 800A0798 44050000 */  mfc1       $a1, $f0
/* A139C 800A079C 0C0281EC */  jal        func_800A07B0
/* A13A0 800A07A0 00C02021 */   addu      $a0, $a2, $zero
/* A13A4 800A07A4 8FBF0010 */  lw         $ra, 0x10($sp)
.L800A07A8:
/* A13A8 800A07A8 03E00008 */  jr         $ra
/* A13AC 800A07AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A07B0
/* A13B0 800A07B0 8C86000C */  lw         $a2, 0xc($a0)
/* A13B4 800A07B4 8C820000 */  lw         $v0, ($a0)
/* A13B8 800A07B8 8C43000C */  lw         $v1, 0xc($v0)
/* A13BC 800A07BC 44852000 */  mtc1       $a1, $f4
/* A13C0 800A07C0 1060000D */  beqz       $v1, .L800A07F8
/* A13C4 800A07C4 8C840010 */   lw        $a0, 0x10($a0)
.L800A07C8:
/* A13C8 800A07C8 30620001 */  andi       $v0, $v1, 1
/* A13CC 800A07CC 10400008 */  beqz       $v0, .L800A07F0
/* A13D0 800A07D0 00031843 */   sra       $v1, $v1, 1
/* A13D4 800A07D4 8CC20008 */  lw         $v0, 8($a2)
/* A13D8 800A07D8 C4400000 */  lwc1       $f0, ($v0)
/* A13DC 800A07DC 46040002 */  mul.s      $f0, $f0, $f4
/* A13E0 800A07E0 C4820000 */  lwc1       $f2, ($a0)
/* A13E4 800A07E4 46001080 */  add.s      $f2, $f2, $f0
/* A13E8 800A07E8 24C60010 */  addiu      $a2, $a2, 0x10
/* A13EC 800A07EC E4820000 */  swc1       $f2, ($a0)
.L800A07F0:
/* A13F0 800A07F0 1460FFF5 */  bnez       $v1, .L800A07C8
/* A13F4 800A07F4 24840004 */   addiu     $a0, $a0, 4
.L800A07F8:
/* A13F8 800A07F8 03E00008 */  jr         $ra
/* A13FC 800A07FC 00000000 */   nop

glabel func_800A0800
/* A1400 800A0800 24080003 */  addiu      $t0, $zero, 3
/* A1404 800A0804 44852000 */  mtc1       $a1, $f4
/* A1408 800A0808 8C890010 */  lw         $t1, 0x10($a0)
/* A140C 800A080C 8C87000C */  lw         $a3, 0xc($a0)
/* A1410 800A0810 8C820000 */  lw         $v0, ($a0)
/* A1414 800A0814 25250010 */  addiu      $a1, $t1, 0x10
/* A1418 800A0818 8D23000C */  lw         $v1, 0xc($t1)
/* A141C 800A081C 8C46000C */  lw         $a2, 0xc($v0)
/* A1420 800A0820 24640158 */  addiu      $a0, $v1, 0x158
/* A1424 800A0824 24630164 */  addiu      $v1, $v1, 0x164
.L800A0828:
/* A1428 800A0828 30C20001 */  andi       $v0, $a2, 1
/* A142C 800A082C 10400012 */  beqz       $v0, .L800A0878
/* A1430 800A0830 2508FFFF */   addiu     $t0, $t0, -1
/* A1434 800A0834 8CE20008 */  lw         $v0, 8($a3)
/* A1438 800A0838 C4420000 */  lwc1       $f2, ($v0)
/* A143C 800A083C 46041082 */  mul.s      $f2, $f2, $f4
/* A1440 800A0840 C4A00000 */  lwc1       $f0, ($a1)
/* A1444 800A0844 46020000 */  add.s      $f0, $f0, $f2
/* A1448 800A0848 E4A00000 */  swc1       $f0, ($a1)
/* A144C 800A084C C4420004 */  lwc1       $f2, 4($v0)
/* A1450 800A0850 46041082 */  mul.s      $f2, $f2, $f4
/* A1454 800A0854 C4800000 */  lwc1       $f0, ($a0)
/* A1458 800A0858 46020000 */  add.s      $f0, $f0, $f2
/* A145C 800A085C E4800000 */  swc1       $f0, ($a0)
/* A1460 800A0860 C4420008 */  lwc1       $f2, 8($v0)
/* A1464 800A0864 46041082 */  mul.s      $f2, $f2, $f4
/* A1468 800A0868 C4600000 */  lwc1       $f0, ($v1)
/* A146C 800A086C 46020000 */  add.s      $f0, $f0, $f2
/* A1470 800A0870 24E70010 */  addiu      $a3, $a3, 0x10
/* A1474 800A0874 E4600000 */  swc1       $f0, ($v1)
.L800A0878:
/* A1478 800A0878 00063043 */  sra        $a2, $a2, 1
/* A147C 800A087C 24A50004 */  addiu      $a1, $a1, 4
/* A1480 800A0880 24840004 */  addiu      $a0, $a0, 4
/* A1484 800A0884 1500FFE8 */  bnez       $t0, .L800A0828
/* A1488 800A0888 24630004 */   addiu     $v1, $v1, 4
/* A148C 800A088C 8D22000C */  lw         $v0, 0xc($t1)
/* A1490 800A0890 24080003 */  addiu      $t0, $zero, 3
/* A1494 800A0894 24440140 */  addiu      $a0, $v0, 0x140
/* A1498 800A0898 2443014C */  addiu      $v1, $v0, 0x14c
.L800A089C:
/* A149C 800A089C 30C20001 */  andi       $v0, $a2, 1
/* A14A0 800A08A0 10400012 */  beqz       $v0, .L800A08EC
/* A14A4 800A08A4 2508FFFF */   addiu     $t0, $t0, -1
/* A14A8 800A08A8 8CE20008 */  lw         $v0, 8($a3)
/* A14AC 800A08AC C4420000 */  lwc1       $f2, ($v0)
/* A14B0 800A08B0 46041082 */  mul.s      $f2, $f2, $f4
/* A14B4 800A08B4 C4A00000 */  lwc1       $f0, ($a1)
/* A14B8 800A08B8 46020000 */  add.s      $f0, $f0, $f2
/* A14BC 800A08BC E4A00000 */  swc1       $f0, ($a1)
/* A14C0 800A08C0 C4420004 */  lwc1       $f2, 4($v0)
/* A14C4 800A08C4 46041082 */  mul.s      $f2, $f2, $f4
/* A14C8 800A08C8 C4800000 */  lwc1       $f0, ($a0)
/* A14CC 800A08CC 46020000 */  add.s      $f0, $f0, $f2
/* A14D0 800A08D0 E4800000 */  swc1       $f0, ($a0)
/* A14D4 800A08D4 C4420008 */  lwc1       $f2, 8($v0)
/* A14D8 800A08D8 46041082 */  mul.s      $f2, $f2, $f4
/* A14DC 800A08DC C4600000 */  lwc1       $f0, ($v1)
/* A14E0 800A08E0 46020000 */  add.s      $f0, $f0, $f2
/* A14E4 800A08E4 24E70010 */  addiu      $a3, $a3, 0x10
/* A14E8 800A08E8 E4600000 */  swc1       $f0, ($v1)
.L800A08EC:
/* A14EC 800A08EC 00063043 */  sra        $a2, $a2, 1
/* A14F0 800A08F0 24A50004 */  addiu      $a1, $a1, 4
/* A14F4 800A08F4 24840004 */  addiu      $a0, $a0, 4
/* A14F8 800A08F8 1500FFE8 */  bnez       $t0, .L800A089C
/* A14FC 800A08FC 24630004 */   addiu     $v1, $v1, 4
/* A1500 800A0900 24080003 */  addiu      $t0, $zero, 3
.L800A0904:
/* A1504 800A0904 30C20001 */  andi       $v0, $a2, 1
/* A1508 800A0908 10400008 */  beqz       $v0, .L800A092C
/* A150C 800A090C 2508FFFF */   addiu     $t0, $t0, -1
/* A1510 800A0910 8CE20008 */  lw         $v0, 8($a3)
/* A1514 800A0914 C4400000 */  lwc1       $f0, ($v0)
/* A1518 800A0918 46040002 */  mul.s      $f0, $f0, $f4
/* A151C 800A091C C4A20000 */  lwc1       $f2, ($a1)
/* A1520 800A0920 46001080 */  add.s      $f2, $f2, $f0
/* A1524 800A0924 24E70010 */  addiu      $a3, $a3, 0x10
/* A1528 800A0928 E4A20000 */  swc1       $f2, ($a1)
.L800A092C:
/* A152C 800A092C 00063043 */  sra        $a2, $a2, 1
/* A1530 800A0930 1500FFF4 */  bnez       $t0, .L800A0904
/* A1534 800A0934 24A50004 */   addiu     $a1, $a1, 4
/* A1538 800A0938 03E00008 */  jr         $ra
/* A153C 800A093C 00000000 */   nop

glabel func_800A0940
/* A1540 800A0940 00802821 */  addu       $a1, $a0, $zero
/* A1544 800A0944 8CA20000 */  lw         $v0, ($a1)
/* A1548 800A0948 8C440004 */  lw         $a0, 4($v0)
/* A154C 800A094C 24030001 */  addiu      $v1, $zero, 1
/* A1550 800A0950 14830010 */  bne        $a0, $v1, .L800A0994
/* A1554 800A0954 8CA30010 */   lw        $v1, 0x10($a1)
/* A1558 800A0958 8C62000C */  lw         $v0, 0xc($v1)
/* A155C 800A095C 24630010 */  addiu      $v1, $v1, 0x10
/* A1560 800A0960 AC400140 */  sw         $zero, 0x140($v0)
/* A1564 800A0964 AC400144 */  sw         $zero, 0x144($v0)
/* A1568 800A0968 AC400148 */  sw         $zero, 0x148($v0)
/* A156C 800A096C AC40014C */  sw         $zero, 0x14c($v0)
/* A1570 800A0970 AC400150 */  sw         $zero, 0x150($v0)
/* A1574 800A0974 AC400154 */  sw         $zero, 0x154($v0)
/* A1578 800A0978 AC400158 */  sw         $zero, 0x158($v0)
/* A157C 800A097C AC40015C */  sw         $zero, 0x15c($v0)
/* A1580 800A0980 AC400160 */  sw         $zero, 0x160($v0)
/* A1584 800A0984 AC400164 */  sw         $zero, 0x164($v0)
/* A1588 800A0988 AC400168 */  sw         $zero, 0x168($v0)
/* A158C 800A098C AC40016C */  sw         $zero, 0x16c($v0)
/* A1590 800A0990 8CA20000 */  lw         $v0, ($a1)
.L800A0994:
/* A1594 800A0994 8C44000C */  lw         $a0, 0xc($v0)
/* A1598 800A0998 10800007 */  beqz       $a0, .L800A09B8
/* A159C 800A099C 00000000 */   nop
.L800A09A0:
/* A15A0 800A09A0 30820001 */  andi       $v0, $a0, 1
/* A15A4 800A09A4 54400001 */  bnel       $v0, $zero, .L800A09AC
/* A15A8 800A09A8 AC600000 */   sw        $zero, ($v1)
.L800A09AC:
/* A15AC 800A09AC 00042043 */  sra        $a0, $a0, 1
/* A15B0 800A09B0 1480FFFB */  bnez       $a0, .L800A09A0
/* A15B4 800A09B4 24630004 */   addiu     $v1, $v1, 4
.L800A09B8:
/* A15B8 800A09B8 03E00008 */  jr         $ra
/* A15BC 800A09BC 00000000 */   nop

glabel func_800A09C0
/* A15C0 800A09C0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A15C4 800A09C4 AFBF0018 */  sw         $ra, 0x18($sp)
/* A15C8 800A09C8 AFB10014 */  sw         $s1, 0x14($sp)
/* A15CC 800A09CC AFB00010 */  sw         $s0, 0x10($sp)
/* A15D0 800A09D0 8C820000 */  lw         $v0, ($a0)
/* A15D4 800A09D4 8C500010 */  lw         $s0, 0x10($v0)
/* A15D8 800A09D8 12000006 */  beqz       $s0, .L800A09F4
/* A15DC 800A09DC 8C91000C */   lw        $s1, 0xc($a0)
.L800A09E0:
/* A15E0 800A09E0 0C0281C5 */  jal        func_800A0714
/* A15E4 800A09E4 02202021 */   addu      $a0, $s1, $zero
/* A15E8 800A09E8 2610FFFF */  addiu      $s0, $s0, -1
/* A15EC 800A09EC 1600FFFC */  bnez       $s0, .L800A09E0
/* A15F0 800A09F0 26310010 */   addiu     $s1, $s1, 0x10
.L800A09F4:
/* A15F4 800A09F4 8FBF0018 */  lw         $ra, 0x18($sp)
/* A15F8 800A09F8 8FB10014 */  lw         $s1, 0x14($sp)
/* A15FC 800A09FC 8FB00010 */  lw         $s0, 0x10($sp)
/* A1600 800A0A00 03E00008 */  jr         $ra
/* A1604 800A0A04 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A0A08
/* A1608 800A0A08 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A160C 800A0A0C AFBF001C */  sw         $ra, 0x1c($sp)
/* A1610 800A0A10 AFB20018 */  sw         $s2, 0x18($sp)
/* A1614 800A0A14 AFB10014 */  sw         $s1, 0x14($sp)
/* A1618 800A0A18 AFB00010 */  sw         $s0, 0x10($sp)
/* A161C 800A0A1C 8C920004 */  lw         $s2, 4($a0)
/* A1620 800A0A20 24020001 */  addiu      $v0, $zero, 1
/* A1624 800A0A24 1240000D */  beqz       $s2, .L800A0A5C
/* A1628 800A0A28 A48201F8 */   sh        $v0, 0x1f8($a0)
/* A162C 800A0A2C 8E420020 */  lw         $v0, 0x20($s2)
.L800A0A30:
/* A1630 800A0A30 8C500004 */  lw         $s0, 4($v0)
/* A1634 800A0A34 12000006 */  beqz       $s0, .L800A0A50
/* A1638 800A0A38 8E510014 */   lw        $s1, 0x14($s2)
.L800A0A3C:
/* A163C 800A0A3C 0C028270 */  jal        func_800A09C0
/* A1640 800A0A40 02202021 */   addu      $a0, $s1, $zero
/* A1644 800A0A44 2610FFFF */  addiu      $s0, $s0, -1
/* A1648 800A0A48 1600FFFC */  bnez       $s0, .L800A0A3C
/* A164C 800A0A4C 26310018 */   addiu     $s1, $s1, 0x18
.L800A0A50:
/* A1650 800A0A50 8E520010 */  lw         $s2, 0x10($s2)
/* A1654 800A0A54 5640FFF6 */  bnel       $s2, $zero, .L800A0A30
/* A1658 800A0A58 8E420020 */   lw        $v0, 0x20($s2)
.L800A0A5C:
/* A165C 800A0A5C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A1660 800A0A60 8FB20018 */  lw         $s2, 0x18($sp)
/* A1664 800A0A64 8FB10014 */  lw         $s1, 0x14($sp)
/* A1668 800A0A68 8FB00010 */  lw         $s0, 0x10($sp)
/* A166C 800A0A6C 03E00008 */  jr         $ra
/* A1670 800A0A70 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A0A74
/* A1674 800A0A74 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A1678 800A0A78 AFBF0018 */  sw         $ra, 0x18($sp)
/* A167C 800A0A7C AFB10014 */  sw         $s1, 0x14($sp)
/* A1680 800A0A80 AFB00010 */  sw         $s0, 0x10($sp)
/* A1684 800A0A84 8C820000 */  lw         $v0, ($a0)
/* A1688 800A0A88 8C500010 */  lw         $s0, 0x10($v0)
/* A168C 800A0A8C 12000055 */  beqz       $s0, .L800A0BE4
/* A1690 800A0A90 8C91000C */   lw        $s1, 0xc($a0)
.L800A0A94:
/* A1694 800A0A94 8E230000 */  lw         $v1, ($s1)
/* A1698 800A0A98 8625000C */  lh         $a1, 0xc($s1)
/* A169C 800A0A9C 84620000 */  lh         $v0, ($v1)
/* A16A0 800A0AA0 54A20012 */  bnel       $a1, $v0, .L800A0AEC
/* A16A4 800A0AA4 8E240004 */   lw        $a0, 4($s1)
/* A16A8 800A0AA8 8C630008 */  lw         $v1, 8($v1)
/* A16AC 800A0AAC 24020001 */  addiu      $v0, $zero, 1
/* A16B0 800A0AB0 10620009 */  beq        $v1, $v0, .L800A0AD8
/* A16B4 800A0AB4 28620002 */   slti      $v0, $v1, 2
/* A16B8 800A0AB8 50400005 */  beql       $v0, $zero, .L800A0AD0
/* A16BC 800A0ABC 24020002 */   addiu     $v0, $zero, 2
/* A16C0 800A0AC0 10600005 */  beqz       $v1, .L800A0AD8
/* A16C4 800A0AC4 2608FFFF */   addiu     $t0, $s0, -1
/* A16C8 800A0AC8 080282F6 */  j          .L800A0BD8
/* A16CC 800A0ACC 26270010 */   addiu     $a3, $s1, 0x10
.L800A0AD0:
/* A16D0 800A0AD0 14620004 */  bne        $v1, $v0, .L800A0AE4
/* A16D4 800A0AD4 2608FFFF */   addiu     $t0, $s0, -1
.L800A0AD8:
/* A16D8 800A0AD8 0C0281C5 */  jal        func_800A0714
/* A16DC 800A0ADC 02202021 */   addu      $a0, $s1, $zero
/* A16E0 800A0AE0 2608FFFF */  addiu      $t0, $s0, -1
.L800A0AE4:
/* A16E4 800A0AE4 080282F6 */  j          .L800A0BD8
/* A16E8 800A0AE8 26270010 */   addiu     $a3, $s1, 0x10
.L800A0AEC:
/* A16EC 800A0AEC 2608FFFF */  addiu      $t0, $s0, -1
/* A16F0 800A0AF0 24840008 */  addiu      $a0, $a0, 8
/* A16F4 800A0AF4 84820000 */  lh         $v0, ($a0)
/* A16F8 800A0AF8 1445001B */  bne        $v0, $a1, .L800A0B68
/* A16FC 800A0AFC 26270010 */   addiu     $a3, $s1, 0x10
/* A1700 800A0B00 8E230008 */  lw         $v1, 8($s1)
/* A1704 800A0B04 24060004 */  addiu      $a2, $zero, 4
/* A1708 800A0B08 AE240004 */  sw         $a0, 4($s1)
/* A170C 800A0B0C 84850002 */  lh         $a1, 2($a0)
/* A1710 800A0B10 30A20001 */  andi       $v0, $a1, 1
/* A1714 800A0B14 14400008 */  bnez       $v0, .L800A0B38
/* A1718 800A0B18 8C840004 */   lw        $a0, 4($a0)
/* A171C 800A0B1C 24630004 */  addiu      $v1, $v1, 4
.L800A0B20:
/* A1720 800A0B20 24C6FFFF */  addiu      $a2, $a2, -1
/* A1724 800A0B24 10C00010 */  beqz       $a2, .L800A0B68
/* A1728 800A0B28 00052843 */   sra       $a1, $a1, 1
/* A172C 800A0B2C 30A20001 */  andi       $v0, $a1, 1
/* A1730 800A0B30 5040FFFB */  beql       $v0, $zero, .L800A0B20
/* A1734 800A0B34 24630004 */   addiu     $v1, $v1, 4
.L800A0B38:
/* A1738 800A0B38 50C0000C */  beql       $a2, $zero, .L800A0B6C
/* A173C 800A0B3C 8E240004 */   lw        $a0, 4($s1)
.L800A0B40:
/* A1740 800A0B40 30A20001 */  andi       $v0, $a1, 1
/* A1744 800A0B44 50400004 */  beql       $v0, $zero, .L800A0B58
/* A1748 800A0B48 AC600000 */   sw        $zero, ($v1)
/* A174C 800A0B4C C4800000 */  lwc1       $f0, ($a0)
/* A1750 800A0B50 24840004 */  addiu      $a0, $a0, 4
/* A1754 800A0B54 E4600000 */  swc1       $f0, ($v1)
.L800A0B58:
/* A1758 800A0B58 24630004 */  addiu      $v1, $v1, 4
/* A175C 800A0B5C 24C6FFFF */  addiu      $a2, $a2, -1
/* A1760 800A0B60 14C0FFF7 */  bnez       $a2, .L800A0B40
/* A1764 800A0B64 00052843 */   sra       $a1, $a1, 1
.L800A0B68:
/* A1768 800A0B68 8E240004 */  lw         $a0, 4($s1)
.L800A0B6C:
/* A176C 800A0B6C 8E230008 */  lw         $v1, 8($s1)
/* A1770 800A0B70 84850002 */  lh         $a1, 2($a0)
/* A1774 800A0B74 30A20002 */  andi       $v0, $a1, 2
/* A1778 800A0B78 10400014 */  beqz       $v0, .L800A0BCC
/* A177C 800A0B7C 24640004 */   addiu     $a0, $v1, 4
/* A1780 800A0B80 C4600000 */  lwc1       $f0, ($v1)
/* A1784 800A0B84 C4620004 */  lwc1       $f2, 4($v1)
/* A1788 800A0B88 46020000 */  add.s      $f0, $f0, $f2
/* A178C 800A0B8C 30A20004 */  andi       $v0, $a1, 4
/* A1790 800A0B90 1040000E */  beqz       $v0, .L800A0BCC
/* A1794 800A0B94 E4600000 */   swc1      $f0, ($v1)
/* A1798 800A0B98 00801821 */  addu       $v1, $a0, $zero
/* A179C 800A0B9C C4600000 */  lwc1       $f0, ($v1)
/* A17A0 800A0BA0 C4620004 */  lwc1       $f2, 4($v1)
/* A17A4 800A0BA4 46020000 */  add.s      $f0, $f0, $f2
/* A17A8 800A0BA8 24640004 */  addiu      $a0, $v1, 4
/* A17AC 800A0BAC 30A20008 */  andi       $v0, $a1, 8
/* A17B0 800A0BB0 10400006 */  beqz       $v0, .L800A0BCC
/* A17B4 800A0BB4 E4600000 */   swc1      $f0, ($v1)
/* A17B8 800A0BB8 00801821 */  addu       $v1, $a0, $zero
/* A17BC 800A0BBC C4600000 */  lwc1       $f0, ($v1)
/* A17C0 800A0BC0 C4620004 */  lwc1       $f2, 4($v1)
/* A17C4 800A0BC4 46020000 */  add.s      $f0, $f0, $f2
/* A17C8 800A0BC8 E4600000 */  swc1       $f0, ($v1)
.L800A0BCC:
/* A17CC 800A0BCC 9622000C */  lhu        $v0, 0xc($s1)
/* A17D0 800A0BD0 24420001 */  addiu      $v0, $v0, 1
/* A17D4 800A0BD4 A622000C */  sh         $v0, 0xc($s1)
.L800A0BD8:
/* A17D8 800A0BD8 01008021 */  addu       $s0, $t0, $zero
/* A17DC 800A0BDC 1600FFAD */  bnez       $s0, .L800A0A94
/* A17E0 800A0BE0 00E08821 */   addu      $s1, $a3, $zero
.L800A0BE4:
/* A17E4 800A0BE4 8FBF0018 */  lw         $ra, 0x18($sp)
/* A17E8 800A0BE8 8FB10014 */  lw         $s1, 0x14($sp)
/* A17EC 800A0BEC 8FB00010 */  lw         $s0, 0x10($sp)
/* A17F0 800A0BF0 03E00008 */  jr         $ra
/* A17F4 800A0BF4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A0BF8
/* A17F8 800A0BF8 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* A17FC 800A0BFC AFB50024 */  sw         $s5, 0x24($sp)
/* A1800 800A0C00 0080A821 */  addu       $s5, $a0, $zero
/* A1804 800A0C04 AFBF0028 */  sw         $ra, 0x28($sp)
/* A1808 800A0C08 AFB40020 */  sw         $s4, 0x20($sp)
/* A180C 800A0C0C AFB3001C */  sw         $s3, 0x1c($sp)
/* A1810 800A0C10 AFB20018 */  sw         $s2, 0x18($sp)
/* A1814 800A0C14 AFB10014 */  sw         $s1, 0x14($sp)
/* A1818 800A0C18 AFB00010 */  sw         $s0, 0x10($sp)
/* A181C 800A0C1C F7B60038 */  sdc1       $f22, 0x38($sp)
/* A1820 800A0C20 F7B40030 */  sdc1       $f20, 0x30($sp)
/* A1824 800A0C24 92A201FA */  lbu        $v0, 0x1fa($s5)
/* A1828 800A0C28 10400037 */  beqz       $v0, .L800A0D08
/* A182C 800A0C2C 8FBF0028 */   lw        $ra, 0x28($sp)
/* A1830 800A0C30 8EA20004 */  lw         $v0, 4($s5)
/* A1834 800A0C34 10400034 */  beqz       $v0, .L800A0D08
/* A1838 800A0C38 00409021 */   addu      $s2, $v0, $zero
/* A183C 800A0C3C 8E420020 */  lw         $v0, 0x20($s2)
.L800A0C40:
/* A1840 800A0C40 8C420004 */  lw         $v0, 4($v0)
/* A1844 800A0C44 1040000F */  beqz       $v0, .L800A0C84
/* A1848 800A0C48 8E510014 */   lw        $s1, 0x14($s2)
.L800A0C4C:
/* A184C 800A0C4C 92B001FA */  lbu        $s0, 0x1fa($s5)
/* A1850 800A0C50 2453FFFF */  addiu      $s3, $v0, -1
/* A1854 800A0C54 12000006 */  beqz       $s0, .L800A0C70
/* A1858 800A0C58 26340018 */   addiu     $s4, $s1, 0x18
.L800A0C5C:
/* A185C 800A0C5C 0C02829D */  jal        func_800A0A74
/* A1860 800A0C60 02202021 */   addu      $a0, $s1, $zero
/* A1864 800A0C64 2610FFFF */  addiu      $s0, $s0, -1
/* A1868 800A0C68 1600FFFC */  bnez       $s0, .L800A0C5C
/* A186C 800A0C6C 00000000 */   nop
.L800A0C70:
/* A1870 800A0C70 0C028250 */  jal        func_800A0940
/* A1874 800A0C74 02202021 */   addu      $a0, $s1, $zero
/* A1878 800A0C78 02601021 */  addu       $v0, $s3, $zero
/* A187C 800A0C7C 1440FFF3 */  bnez       $v0, .L800A0C4C
/* A1880 800A0C80 02808821 */   addu      $s1, $s4, $zero
.L800A0C84:
/* A1884 800A0C84 8E520010 */  lw         $s2, 0x10($s2)
/* A1888 800A0C88 5640FFED */  bnel       $s2, $zero, .L800A0C40
/* A188C 800A0C8C 8E420020 */   lw        $v0, 0x20($s2)
/* A1890 800A0C90 8EB20004 */  lw         $s2, 4($s5)
/* A1894 800A0C94 52400018 */  beql       $s2, $zero, .L800A0CF8
/* A1898 800A0C98 92A301FA */   lbu       $v1, 0x1fa($s5)
/* A189C 800A0C9C 4480B000 */  mtc1       $zero, $f22
/* A18A0 800A0CA0 4480B800 */  mtc1       $zero, $f23
/* A18A4 800A0CA4 C654001C */  lwc1       $f20, 0x1c($s2)
.L800A0CA8:
/* A18A8 800A0CA8 4600A021 */  cvt.d.s    $f0, $f20
/* A18AC 800A0CAC 46360032 */  c.eq.d     $f0, $f22
/* A18B0 800A0CB0 00000000 */  nop
/* A18B4 800A0CB4 4503000D */  bc1tl      .L800A0CEC
/* A18B8 800A0CB8 8E520010 */   lw        $s2, 0x10($s2)
/* A18BC 800A0CBC 8E420020 */  lw         $v0, 0x20($s2)
/* A18C0 800A0CC0 8C500004 */  lw         $s0, 4($v0)
/* A18C4 800A0CC4 12000008 */  beqz       $s0, .L800A0CE8
/* A18C8 800A0CC8 8E510014 */   lw        $s1, 0x14($s2)
/* A18CC 800A0CCC 02202021 */  addu       $a0, $s1, $zero
.L800A0CD0:
/* A18D0 800A0CD0 2610FFFF */  addiu      $s0, $s0, -1
/* A18D4 800A0CD4 4405A000 */  mfc1       $a1, $f20
/* A18D8 800A0CD8 0C0281D9 */  jal        func_800A0764
/* A18DC 800A0CDC 26310018 */   addiu     $s1, $s1, 0x18
/* A18E0 800A0CE0 1600FFFB */  bnez       $s0, .L800A0CD0
/* A18E4 800A0CE4 02202021 */   addu      $a0, $s1, $zero
.L800A0CE8:
/* A18E8 800A0CE8 8E520010 */  lw         $s2, 0x10($s2)
.L800A0CEC:
/* A18EC 800A0CEC 5640FFEE */  bnel       $s2, $zero, .L800A0CA8
/* A18F0 800A0CF0 C654001C */   lwc1      $f20, 0x1c($s2)
/* A18F4 800A0CF4 92A301FA */  lbu        $v1, 0x1fa($s5)
.L800A0CF8:
/* A18F8 800A0CF8 96A201F8 */  lhu        $v0, 0x1f8($s5)
/* A18FC 800A0CFC 00431021 */  addu       $v0, $v0, $v1
/* A1900 800A0D00 A6A201F8 */  sh         $v0, 0x1f8($s5)
/* A1904 800A0D04 8FBF0028 */  lw         $ra, 0x28($sp)
.L800A0D08:
/* A1908 800A0D08 8FB50024 */  lw         $s5, 0x24($sp)
/* A190C 800A0D0C 8FB40020 */  lw         $s4, 0x20($sp)
/* A1910 800A0D10 8FB3001C */  lw         $s3, 0x1c($sp)
/* A1914 800A0D14 8FB20018 */  lw         $s2, 0x18($sp)
/* A1918 800A0D18 8FB10014 */  lw         $s1, 0x14($sp)
/* A191C 800A0D1C 8FB00010 */  lw         $s0, 0x10($sp)
/* A1920 800A0D20 D7B60038 */  ldc1       $f22, 0x38($sp)
/* A1924 800A0D24 D7B40030 */  ldc1       $f20, 0x30($sp)
/* A1928 800A0D28 03E00008 */  jr         $ra
/* A192C 800A0D2C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800A0D30
/* A1930 800A0D30 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* A1934 800A0D34 AFBF0020 */  sw         $ra, 0x20($sp)
/* A1938 800A0D38 AFB3001C */  sw         $s3, 0x1c($sp)
/* A193C 800A0D3C AFB20018 */  sw         $s2, 0x18($sp)
/* A1940 800A0D40 AFB10014 */  sw         $s1, 0x14($sp)
/* A1944 800A0D44 AFB00010 */  sw         $s0, 0x10($sp)
/* A1948 800A0D48 8C820020 */  lw         $v0, 0x20($a0)
/* A194C 800A0D4C 00A09821 */  addu       $s3, $a1, $zero
/* A1950 800A0D50 8C420004 */  lw         $v0, 4($v0)
/* A1954 800A0D54 1040000C */  beqz       $v0, .L800A0D88
/* A1958 800A0D58 8C920014 */   lw        $s2, 0x14($a0)
/* A195C 800A0D5C 02608021 */  addu       $s0, $s3, $zero
.L800A0D60:
/* A1960 800A0D60 12000006 */  beqz       $s0, .L800A0D7C
/* A1964 800A0D64 2451FFFF */   addiu     $s1, $v0, -1
.L800A0D68:
/* A1968 800A0D68 0C02829D */  jal        func_800A0A74
/* A196C 800A0D6C 02402021 */   addu      $a0, $s2, $zero
/* A1970 800A0D70 2610FFFF */  addiu      $s0, $s0, -1
/* A1974 800A0D74 1600FFFC */  bnez       $s0, .L800A0D68
/* A1978 800A0D78 00000000 */   nop
.L800A0D7C:
/* A197C 800A0D7C 02201021 */  addu       $v0, $s1, $zero
/* A1980 800A0D80 1440FFF7 */  bnez       $v0, .L800A0D60
/* A1984 800A0D84 02608021 */   addu      $s0, $s3, $zero
.L800A0D88:
/* A1988 800A0D88 8FBF0020 */  lw         $ra, 0x20($sp)
/* A198C 800A0D8C 8FB3001C */  lw         $s3, 0x1c($sp)
/* A1990 800A0D90 8FB20018 */  lw         $s2, 0x18($sp)
/* A1994 800A0D94 8FB10014 */  lw         $s1, 0x14($sp)
/* A1998 800A0D98 8FB00010 */  lw         $s0, 0x10($sp)
/* A199C 800A0D9C 03E00008 */  jr         $ra
/* A19A0 800A0DA0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800A0DA4
/* A19A4 800A0DA4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A19A8 800A0DA8 AFB00010 */  sw         $s0, 0x10($sp)
/* A19AC 800A0DAC 00A08021 */  addu       $s0, $a1, $zero
/* A19B0 800A0DB0 AFBF0018 */  sw         $ra, 0x18($sp)
/* A19B4 800A0DB4 AFB10014 */  sw         $s1, 0x14($sp)
/* A19B8 800A0DB8 920202AC */  lbu        $v0, 0x2ac($s0)
/* A19BC 800A0DBC 14400005 */  bnez       $v0, .L800A0DD4
/* A19C0 800A0DC0 00808821 */   addu      $s1, $a0, $zero
/* A19C4 800A0DC4 0C0282FE */  jal        func_800A0BF8
/* A19C8 800A0DC8 02002021 */   addu      $a0, $s0, $zero
/* A19CC 800A0DCC 0C027BCD */  jal        func_8009EF34
/* A19D0 800A0DD0 02002021 */   addu      $a0, $s0, $zero
.L800A0DD4:
/* A19D4 800A0DD4 02202021 */  addu       $a0, $s1, $zero
/* A19D8 800A0DD8 0C02857F */  jal        BorgAnimDrawSceneRaw
/* A19DC 800A0DDC 02002821 */   addu      $a1, $s0, $zero
/* A19E0 800A0DE0 8FBF0018 */  lw         $ra, 0x18($sp)
/* A19E4 800A0DE4 8FB10014 */  lw         $s1, 0x14($sp)
/* A19E8 800A0DE8 8FB00010 */  lw         $s0, 0x10($sp)
/* A19EC 800A0DEC 03E00008 */  jr         $ra
/* A19F0 800A0DF0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A0DF4
/* A19F4 800A0DF4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A19F8 800A0DF8 AFB00010 */  sw         $s0, 0x10($sp)
/* A19FC 800A0DFC 00808021 */  addu       $s0, $a0, $zero
/* A1A00 800A0E00 AFBF0014 */  sw         $ra, 0x14($sp)
/* A1A04 800A0E04 920202AC */  lbu        $v0, 0x2ac($s0)
/* A1A08 800A0E08 14400006 */  bnez       $v0, .L800A0E24
/* A1A0C 800A0E0C 8FBF0014 */   lw        $ra, 0x14($sp)
/* A1A10 800A0E10 0C0282FE */  jal        func_800A0BF8
/* A1A14 800A0E14 00000000 */   nop
/* A1A18 800A0E18 0C027BCD */  jal        func_8009EF34
/* A1A1C 800A0E1C 02002021 */   addu      $a0, $s0, $zero
/* A1A20 800A0E20 8FBF0014 */  lw         $ra, 0x14($sp)
.L800A0E24:
/* A1A24 800A0E24 8FB00010 */  lw         $s0, 0x10($sp)
/* A1A28 800A0E28 03E00008 */  jr         $ra
/* A1A2C 800A0E2C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A0E30
/* A1A30 800A0E30 00002021 */  addu       $a0, $zero, $zero
/* A1A34 800A0E34 00001821 */  addu       $v1, $zero, $zero
.L800A0E38:
/* A1A38 800A0E38 24840001 */  addiu      $a0, $a0, 1
/* A1A3C 800A0E3C 24630001 */  addiu      $v1, $v1, 1
.L800A0E40:
/* A1A40 800A0E40 2C620004 */  sltiu      $v0, $v1, 4
/* A1A44 800A0E44 5440FFFE */  bnel       $v0, $zero, .L800A0E40
/* A1A48 800A0E48 24630001 */   addiu     $v1, $v1, 1
/* A1A4C 800A0E4C 2C820004 */  sltiu      $v0, $a0, 4
/* A1A50 800A0E50 1440FFF9 */  bnez       $v0, .L800A0E38
/* A1A54 800A0E54 00001821 */   addu      $v1, $zero, $zero
/* A1A58 800A0E58 03E00008 */  jr         $ra
/* A1A5C 800A0E5C 00000000 */   nop

glabel func_800A0E60
/* A1A60 800A0E60 00804021 */  addu       $t0, $a0, $zero
/* A1A64 800A0E64 3C040022 */  lui        $a0, 0x22
/* A1A68 800A0E68 34840405 */  ori        $a0, $a0, 0x405
/* A1A6C 800A0E6C 3C060044 */  lui        $a2, 0x44
/* A1A70 800A0E70 34C62038 */  ori        $a2, $a2, 0x2038
/* A1A74 800A0E74 3C050011 */  lui        $a1, 0x11
/* A1A78 800A0E78 34A52038 */  ori        $a1, $a1, 0x2038
/* A1A7C 800A0E7C 01003821 */  addu       $a3, $t0, $zero
/* A1A80 800A0E80 25080008 */  addiu      $t0, $t0, 8
/* A1A84 800A0E84 3C03800F */  lui        $v1, %hi(D_800F5590)
/* A1A88 800A0E88 246A5590 */  addiu      $t2, $v1, %lo(D_800F5590)
/* A1A8C 800A0E8C 3C02800F */  lui        $v0, %hi(D_800F55F0)
/* A1A90 800A0E90 244255F0 */  addiu      $v0, $v0, %lo(D_800F55F0)
/* A1A94 800A0E94 00404821 */  addu       $t1, $v0, $zero
/* A1A98 800A0E98 252B0060 */  addiu      $t3, $t1, 0x60
/* A1A9C 800A0E9C 3C03000D */  lui        $v1, 0xd
/* A1AA0 800A0EA0 AC430040 */  sw         $v1, 0x40($v0)
/* A1AA4 800A0EA4 24032000 */  addiu      $v1, $zero, 0x2000
/* A1AA8 800A0EA8 AC44003C */  sw         $a0, 0x3c($v0)
/* A1AAC 800A0EAC 3C04DE00 */  lui        $a0, 0xde00
/* A1AB0 800A0EB0 A0400048 */  sb         $zero, 0x48($v0)
/* A1AB4 800A0EB4 A0400049 */  sb         $zero, 0x49($v0)
/* A1AB8 800A0EB8 A040004A */  sb         $zero, 0x4a($v0)
/* A1ABC 800A0EBC A040004B */  sb         $zero, 0x4b($v0)
/* A1AC0 800A0EC0 AC40004C */  sw         $zero, 0x4c($v0)
/* A1AC4 800A0EC4 AC460050 */  sw         $a2, 0x50($v0)
/* A1AC8 800A0EC8 AC450054 */  sw         $a1, 0x54($v0)
/* A1ACC 800A0ECC AC400010 */  sw         $zero, 0x10($v0)
/* A1AD0 800A0ED0 AC430044 */  sw         $v1, 0x44($v0)
/* A1AD4 800A0ED4 3C02800F */  lui        $v0, %hi(D_800F32D8)
/* A1AD8 800A0ED8 244232D8 */  addiu      $v0, $v0, %lo(D_800F32D8)
/* A1ADC 800A0EDC ACE40000 */  sw         $a0, ($a3)
/* A1AE0 800A0EE0 ACE20004 */  sw         $v0, 4($a3)
.L800A0EE4:
/* A1AE4 800A0EE4 8D220000 */  lw         $v0, ($t1)
/* A1AE8 800A0EE8 8D230004 */  lw         $v1, 4($t1)
/* A1AEC 800A0EEC 8D240008 */  lw         $a0, 8($t1)
/* A1AF0 800A0EF0 8D25000C */  lw         $a1, 0xc($t1)
/* A1AF4 800A0EF4 AD420000 */  sw         $v0, ($t2)
/* A1AF8 800A0EF8 AD430004 */  sw         $v1, 4($t2)
/* A1AFC 800A0EFC AD440008 */  sw         $a0, 8($t2)
/* A1B00 800A0F00 AD45000C */  sw         $a1, 0xc($t2)
/* A1B04 800A0F04 25290010 */  addiu      $t1, $t1, 0x10
/* A1B08 800A0F08 152BFFF6 */  bne        $t1, $t3, .L800A0EE4
/* A1B0C 800A0F0C 254A0010 */   addiu     $t2, $t2, 0x10
/* A1B10 800A0F10 03E00008 */  jr         $ra
/* A1B14 800A0F14 01001021 */   addu      $v0, $t0, $zero

glabel setStaticMode
/* A1B18 800A0F18 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A1B1C 800A0F1C AFB00010 */  sw         $s0, 0x10($sp)
/* A1B20 800A0F20 00808021 */  addu       $s0, $a0, $zero
/* A1B24 800A0F24 AFBF001C */  sw         $ra, 0x1c($sp)
/* A1B28 800A0F28 AFB20018 */  sw         $s2, 0x18($sp)
/* A1B2C 800A0F2C 16000006 */  bnez       $s0, .L800A0F48
/* A1B30 800A0F30 AFB10014 */   sw        $s1, 0x14($sp)
/* A1B34 800A0F34 3C04800E */  lui        $a0, %hi(D_800E2F6C)
/* A1B38 800A0F38 24842F6C */  addiu      $a0, $a0, %lo(D_800E2F6C)
/* A1B3C 800A0F3C 3C05800E */  lui        $a1, %hi(D_800E2FD8)
/* A1B40 800A0F40 0C025F2D */  jal        manualCrash
/* A1B44 800A0F44 24A52FD8 */   addiu     $a1, $a1, %lo(D_800E2FD8)
.L800A0F48:
/* A1B48 800A0F48 3C02800F */  lui        $v0, %hi(D_800F55F0)
/* A1B4C 800A0F4C 244655F0 */  addiu      $a2, $v0, %lo(D_800F55F0)
/* A1B50 800A0F50 8CC30014 */  lw         $v1, 0x14($a2)
/* A1B54 800A0F54 24110004 */  addiu      $s1, $zero, 4
/* A1B58 800A0F58 8C640000 */  lw         $a0, ($v1)
/* A1B5C 800A0F5C 30830200 */  andi       $v1, $a0, 0x200
/* A1B60 800A0F60 14600002 */  bnez       $v1, .L800A0F6C
/* A1B64 800A0F64 00409021 */   addu      $s2, $v0, $zero
/* A1B68 800A0F68 24110005 */  addiu      $s1, $zero, 5
.L800A0F6C:
/* A1B6C 800A0F6C 30820010 */  andi       $v0, $a0, 0x10
/* A1B70 800A0F70 10400002 */  beqz       $v0, .L800A0F7C
/* A1B74 800A0F74 3C020020 */   lui       $v0, 0x20
/* A1B78 800A0F78 02228825 */  or         $s1, $s1, $v0
.L800A0F7C:
/* A1B7C 800A0F7C 30820004 */  andi       $v0, $a0, 4
/* A1B80 800A0F80 54400001 */  bnel       $v0, $zero, .L800A0F88
/* A1B84 800A0F84 36310400 */   ori       $s1, $s1, 0x400
.L800A0F88:
/* A1B88 800A0F88 30820008 */  andi       $v0, $a0, 8
/* A1B8C 800A0F8C 14400003 */  bnez       $v0, .L800A0F9C
/* A1B90 800A0F90 8CC50010 */   lw        $a1, 0x10($a2)
/* A1B94 800A0F94 3C020002 */  lui        $v0, 2
/* A1B98 800A0F98 02228825 */  or         $s1, $s1, $v0
.L800A0F9C:
/* A1B9C 800A0F9C 10A00049 */  beqz       $a1, .L800A10C4
/* A1BA0 800A0FA0 30820080 */   andi      $v0, $a0, 0x80
/* A1BA4 800A0FA4 2C420001 */  sltiu      $v0, $v0, 1
/* A1BA8 800A0FA8 30830001 */  andi       $v1, $a0, 1
/* A1BAC 800A0FAC 1060001A */  beqz       $v1, .L800A1018
/* A1BB0 800A0FB0 00023B40 */   sll       $a3, $v0, 0xd
/* A1BB4 800A0FB4 3C020004 */  lui        $v0, 4
/* A1BB8 800A0FB8 30830002 */  andi       $v1, $a0, 2
/* A1BBC 800A0FBC 10600003 */  beqz       $v1, .L800A0FCC
/* A1BC0 800A0FC0 02228825 */   or        $s1, $s1, $v0
/* A1BC4 800A0FC4 3C020008 */  lui        $v0, 8
/* A1BC8 800A0FC8 02228825 */  or         $s1, $s1, $v0
.L800A0FCC:
/* A1BCC 800A0FCC 3C03D700 */  lui        $v1, 0xd700
/* A1BD0 800A0FD0 8CA40010 */  lw         $a0, 0x10($a1)
/* A1BD4 800A0FD4 34630002 */  ori        $v1, $v1, 2
/* A1BD8 800A0FD8 90820006 */  lbu        $v0, 6($a0)
/* A1BDC 800A0FDC 02002821 */  addu       $a1, $s0, $zero
/* A1BE0 800A0FE0 30420007 */  andi       $v0, $v0, 7
/* A1BE4 800A0FE4 000212C0 */  sll        $v0, $v0, 0xb
/* A1BE8 800A0FE8 00431025 */  or         $v0, $v0, $v1
/* A1BEC 800A0FEC ACA20000 */  sw         $v0, ($a1)
/* A1BF0 800A0FF0 8CC30010 */  lw         $v1, 0x10($a2)
/* A1BF4 800A0FF4 8C640010 */  lw         $a0, 0x10($v1)
/* A1BF8 800A0FF8 26100008 */  addiu      $s0, $s0, 8
/* A1BFC 800A0FFC 90830004 */  lbu        $v1, 4($a0)
/* A1C00 800A1000 90820005 */  lbu        $v0, 5($a0)
/* A1C04 800A1004 00031D80 */  sll        $v1, $v1, 0x16
/* A1C08 800A1008 00021180 */  sll        $v0, $v0, 6
/* A1C0C 800A100C 00621825 */  or         $v1, $v1, $v0
/* A1C10 800A1010 0802841D */  j          .L800A1074
/* A1C14 800A1014 ACA30004 */   sw        $v1, 4($a1)
.L800A1018:
/* A1C18 800A1018 8CA30010 */  lw         $v1, 0x10($a1)
/* A1C1C 800A101C 94620002 */  lhu        $v0, 2($v1)
/* A1C20 800A1020 30420040 */  andi       $v0, $v0, 0x40
/* A1C24 800A1024 10400005 */  beqz       $v0, .L800A103C
/* A1C28 800A1028 90620006 */   lbu       $v0, 6($v1)
/* A1C2C 800A102C 00021600 */  sll        $v0, $v0, 0x18
/* A1C30 800A1030 00021603 */  sra        $v0, $v0, 0x18
/* A1C34 800A1034 08028411 */  j          .L800A1044
/* A1C38 800A1038 2442FFFF */   addiu     $v0, $v0, -1
.L800A103C:
/* A1C3C 800A103C 00021600 */  sll        $v0, $v0, 0x18
/* A1C40 800A1040 00021603 */  sra        $v0, $v0, 0x18
.L800A1044:
/* A1C44 800A1044 3042FFFF */  andi       $v0, $v0, 0xffff
/* A1C48 800A1048 02002821 */  addu       $a1, $s0, $zero
/* A1C4C 800A104C 26100008 */  addiu      $s0, $s0, 8
/* A1C50 800A1050 3C03D700 */  lui        $v1, 0xd700
/* A1C54 800A1054 34630002 */  ori        $v1, $v1, 2
/* A1C58 800A1058 3C048000 */  lui        $a0, 0x8000
/* A1C5C 800A105C 34848000 */  ori        $a0, $a0, 0x8000
/* A1C60 800A1060 30420007 */  andi       $v0, $v0, 7
/* A1C64 800A1064 000212C0 */  sll        $v0, $v0, 0xb
/* A1C68 800A1068 00431025 */  or         $v0, $v0, $v1
/* A1C6C 800A106C ACA20000 */  sw         $v0, ($a1)
/* A1C70 800A1070 ACA40004 */  sw         $a0, 4($a1)
.L800A1074:
/* A1C74 800A1074 02002021 */  addu       $a0, $s0, $zero
/* A1C78 800A1078 26100008 */  addiu      $s0, $s0, 8
/* A1C7C 800A107C 3C02E300 */  lui        $v0, 0xe300
/* A1C80 800A1080 34421201 */  ori        $v0, $v0, 0x1201
/* A1C84 800A1084 3C05FC12 */  lui        $a1, 0xfc12
/* A1C88 800A1088 34A57E03 */  ori        $a1, $a1, 0x7e03
/* A1C8C 800A108C 3C03FF0F */  lui        $v1, 0xff0f
/* A1C90 800A1090 3463F3FF */  ori        $v1, $v1, 0xf3ff
/* A1C94 800A1094 AC820000 */  sw         $v0, ($a0)
/* A1C98 800A1098 AC870004 */  sw         $a3, 4($a0)
/* A1C9C 800A109C 02002021 */  addu       $a0, $s0, $zero
/* A1CA0 800A10A0 264255F0 */  addiu      $v0, $s2, 0x55f0
/* A1CA4 800A10A4 AC850000 */  sw         $a1, ($a0)
/* A1CA8 800A10A8 AC830004 */  sw         $v1, 4($a0)
/* A1CAC 800A10AC 8C450010 */  lw         $a1, 0x10($v0)
/* A1CB0 800A10B0 8C460014 */  lw         $a2, 0x14($v0)
/* A1CB4 800A10B4 0C02770F */  jal        loadTextureImage
/* A1CB8 800A10B8 24840008 */   addiu     $a0, $a0, 8
/* A1CBC 800A10BC 08028439 */  j          .L800A10E4
/* A1CC0 800A10C0 00408021 */   addu      $s0, $v0, $zero
.L800A10C4:
/* A1CC4 800A10C4 02002021 */  addu       $a0, $s0, $zero
/* A1CC8 800A10C8 26100008 */  addiu      $s0, $s0, 8
/* A1CCC 800A10CC 3C03FCFF */  lui        $v1, 0xfcff
/* A1CD0 800A10D0 3463FE03 */  ori        $v1, $v1, 0xfe03
/* A1CD4 800A10D4 3C02FF0E */  lui        $v0, 0xff0e
/* A1CD8 800A10D8 344279FF */  ori        $v0, $v0, 0x79ff
/* A1CDC 800A10DC AC830000 */  sw         $v1, ($a0)
/* A1CE0 800A10E0 AC820004 */  sw         $v0, 4($a0)
.L800A10E4:
/* A1CE4 800A10E4 02003021 */  addu       $a2, $s0, $zero
/* A1CE8 800A10E8 26100008 */  addiu      $s0, $s0, 8
/* A1CEC 800A10EC 02003821 */  addu       $a3, $s0, $zero
/* A1CF0 800A10F0 26100008 */  addiu      $s0, $s0, 8
/* A1CF4 800A10F4 3C04D9FF */  lui        $a0, 0xd9ff
/* A1CF8 800A10F8 3484FFFF */  ori        $a0, $a0, 0xffff
/* A1CFC 800A10FC 02002821 */  addu       $a1, $s0, $zero
/* A1D00 800A1100 26100008 */  addiu      $s0, $s0, 8
/* A1D04 800A1104 3C03E300 */  lui        $v1, 0xe300
/* A1D08 800A1108 34630A01 */  ori        $v1, $v1, 0xa01
/* A1D0C 800A110C 3C02800F */  lui        $v0, %hi(D_800F5590)
/* A1D10 800A1110 24495590 */  addiu      $t1, $v0, %lo(D_800F5590)
/* A1D14 800A1114 264855F0 */  addiu      $t0, $s2, 0x55f0
/* A1D18 800A1118 250A0060 */  addiu      $t2, $t0, 0x60
/* A1D1C 800A111C 3C02D900 */  lui        $v0, 0xd900
/* A1D20 800A1120 ACC20000 */  sw         $v0, ($a2)
/* A1D24 800A1124 3C020010 */  lui        $v0, 0x10
/* A1D28 800A1128 ACC00004 */  sw         $zero, 4($a2)
/* A1D2C 800A112C ACE40000 */  sw         $a0, ($a3)
/* A1D30 800A1130 ACF10004 */  sw         $s1, 4($a3)
/* A1D34 800A1134 ACA30000 */  sw         $v1, ($a1)
/* A1D38 800A1138 ACA20004 */  sw         $v0, 4($a1)
.L800A113C:
/* A1D3C 800A113C 8D020000 */  lw         $v0, ($t0)
/* A1D40 800A1140 8D030004 */  lw         $v1, 4($t0)
/* A1D44 800A1144 8D040008 */  lw         $a0, 8($t0)
/* A1D48 800A1148 8D05000C */  lw         $a1, 0xc($t0)
/* A1D4C 800A114C AD220000 */  sw         $v0, ($t1)
/* A1D50 800A1150 AD230004 */  sw         $v1, 4($t1)
/* A1D54 800A1154 AD240008 */  sw         $a0, 8($t1)
/* A1D58 800A1158 AD25000C */  sw         $a1, 0xc($t1)
/* A1D5C 800A115C 25080010 */  addiu      $t0, $t0, 0x10
/* A1D60 800A1160 150AFFF6 */  bne        $t0, $t2, .L800A113C
/* A1D64 800A1164 25290010 */   addiu     $t1, $t1, 0x10
/* A1D68 800A1168 02001021 */  addu       $v0, $s0, $zero
/* A1D6C 800A116C 8FBF001C */  lw         $ra, 0x1c($sp)
/* A1D70 800A1170 8FB20018 */  lw         $s2, 0x18($sp)
/* A1D74 800A1174 8FB10014 */  lw         $s1, 0x14($sp)
/* A1D78 800A1178 8FB00010 */  lw         $s0, 0x10($sp)
/* A1D7C 800A117C 03E00008 */  jr         $ra
/* A1D80 800A1180 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800A1184
/* A1D84 800A1184 00804821 */  addu       $t1, $a0, $zero
/* A1D88 800A1188 3C0F0C08 */  lui        $t7, 0xc08
/* A1D8C 800A118C 3C02800F */  lui        $v0, %hi(D_800F55F0)
/* A1D90 800A1190 244555F0 */  addiu      $a1, $v0, %lo(D_800F55F0)
/* A1D94 800A1194 8CA30010 */  lw         $v1, 0x10($a1)
/* A1D98 800A1198 10600073 */  beqz       $v1, .L800A1368
/* A1D9C 800A119C 00405821 */   addu      $t3, $v0, $zero
/* A1DA0 800A11A0 8D6255F0 */  lw         $v0, 0x55f0($t3)
/* A1DA4 800A11A4 3C01800E */  lui        $at, %hi(D_800E2FEC)
/* A1DA8 800A11A8 C4202FEC */  lwc1       $f0, %lo(D_800E2FEC)($at)
/* A1DAC 800A11AC C44201FC */  lwc1       $f2, 0x1fc($v0)
/* A1DB0 800A11B0 46001002 */  mul.s      $f0, $f2, $f0
/* A1DB4 800A11B4 3C01800E */  lui        $at, %hi(D_800E2FF0)
/* A1DB8 800A11B8 C4222FF0 */  lwc1       $f2, %lo(D_800E2FF0)($at)
/* A1DBC 800A11BC 4600103E */  c.le.s     $f2, $f0
/* A1DC0 800A11C0 00000000 */  nop
/* A1DC4 800A11C4 45030005 */  bc1tl      .L800A11DC
/* A1DC8 800A11C8 46020001 */   sub.s     $f0, $f0, $f2
/* A1DCC 800A11CC 4600008D */  trunc.w.s  $f2, $f0
/* A1DD0 800A11D0 44031000 */  mfc1       $v1, $f2
/* A1DD4 800A11D4 0802847C */  j          .L800A11F0
/* A1DD8 800A11D8 8D6255F0 */   lw        $v0, 0x55f0($t3)
.L800A11DC:
/* A1DDC 800A11DC 4600008D */  trunc.w.s  $f2, $f0
/* A1DE0 800A11E0 44031000 */  mfc1       $v1, $f2
/* A1DE4 800A11E4 3C028000 */  lui        $v0, %hi(D_80000200)
/* A1DE8 800A11E8 00621825 */  or         $v1, $v1, $v0
/* A1DEC 800A11EC 8D6255F0 */  lw         $v0, 0x55f0($t3)
.L800A11F0:
/* A1DF0 800A11F0 3C01800E */  lui        $at, %hi(D_800E2FF4)
/* A1DF4 800A11F4 C4202FF4 */  lwc1       $f0, %lo(D_800E2FF4)($at)
/* A1DF8 800A11F8 C4420200 */  lwc1       $f2, %lo(D_80000200)($v0)
/* A1DFC 800A11FC 46001002 */  mul.s      $f0, $f2, $f0
/* A1E00 800A1200 3C01800E */  lui        $at, %hi(D_800E2FF8)
/* A1E04 800A1204 C4222FF8 */  lwc1       $f2, %lo(D_800E2FF8)($at)
/* A1E08 800A1208 4600103E */  c.le.s     $f2, $f0
/* A1E0C 800A120C 00000000 */  nop
/* A1E10 800A1210 45010005 */  bc1t       .L800A1228
/* A1E14 800A1214 306E00FF */   andi      $t6, $v1, 0xff
/* A1E18 800A1218 4600008D */  trunc.w.s  $f2, $f0
/* A1E1C 800A121C 44041000 */  mfc1       $a0, $f2
/* A1E20 800A1220 08028490 */  j          .L800A1240
/* A1E24 800A1224 8D6255F0 */   lw        $v0, 0x55f0($t3)
.L800A1228:
/* A1E28 800A1228 46020001 */  sub.s      $f0, $f0, $f2
/* A1E2C 800A122C 4600008D */  trunc.w.s  $f2, $f0
/* A1E30 800A1230 44041000 */  mfc1       $a0, $f2
/* A1E34 800A1234 3C028000 */  lui        $v0, %hi(D_80000204)
/* A1E38 800A1238 00822025 */  or         $a0, $a0, $v0
/* A1E3C 800A123C 8D6255F0 */  lw         $v0, 0x55f0($t3)
.L800A1240:
/* A1E40 800A1240 3C01800E */  lui        $at, %hi(D_800E2FFC)
/* A1E44 800A1244 C4202FFC */  lwc1       $f0, %lo(D_800E2FFC)($at)
/* A1E48 800A1248 C4420204 */  lwc1       $f2, %lo(D_80000204)($v0)
/* A1E4C 800A124C 46001002 */  mul.s      $f0, $f2, $f0
/* A1E50 800A1250 3C01800E */  lui        $at, %hi(D_800E3000)
/* A1E54 800A1254 C4223000 */  lwc1       $f2, %lo(D_800E3000)($at)
/* A1E58 800A1258 4600103E */  c.le.s     $f2, $f0
/* A1E5C 800A125C 00000000 */  nop
/* A1E60 800A1260 45010005 */  bc1t       .L800A1278
/* A1E64 800A1264 308D00FF */   andi      $t5, $a0, 0xff
/* A1E68 800A1268 4600008D */  trunc.w.s  $f2, $f0
/* A1E6C 800A126C 44051000 */  mfc1       $a1, $f2
/* A1E70 800A1270 080284A4 */  j          .L800A1290
/* A1E74 800A1274 256355F0 */   addiu     $v1, $t3, 0x55f0
.L800A1278:
/* A1E78 800A1278 46020001 */  sub.s      $f0, $f0, $f2
/* A1E7C 800A127C 4600008D */  trunc.w.s  $f2, $f0
/* A1E80 800A1280 44051000 */  mfc1       $a1, $f2
/* A1E84 800A1284 3C028000 */  lui        $v0, 0x8000
/* A1E88 800A1288 00A22825 */  or         $a1, $a1, $v0
/* A1E8C 800A128C 256355F0 */  addiu      $v1, $t3, 0x55f0
.L800A1290:
/* A1E90 800A1290 8C620014 */  lw         $v0, 0x14($v1)
/* A1E94 800A1294 8C64000C */  lw         $a0, 0xc($v1)
/* A1E98 800A1298 3C01800E */  lui        $at, %hi(D_800E3004)
/* A1E9C 800A129C C4203004 */  lwc1       $f0, %lo(D_800E3004)($at)
/* A1EA0 800A12A0 C4440010 */  lwc1       $f4, 0x10($v0)
/* A1EA4 800A12A4 8C820058 */  lw         $v0, 0x58($a0)
/* A1EA8 800A12A8 46040101 */  sub.s      $f4, $f0, $f4
/* A1EAC 800A12AC C4420000 */  lwc1       $f2, ($v0)
/* A1EB0 800A12B0 46020001 */  sub.s      $f0, $f0, $f2
/* A1EB4 800A12B4 46002102 */  mul.s      $f4, $f4, $f0
/* A1EB8 800A12B8 8D6255F0 */  lw         $v0, 0x55f0($t3)
/* A1EBC 800A12BC C4400208 */  lwc1       $f0, 0x208($v0)
/* A1EC0 800A12C0 46040002 */  mul.s      $f0, $f0, $f4
/* A1EC4 800A12C4 3C01800E */  lui        $at, %hi(D_800E3008)
/* A1EC8 800A12C8 C4223008 */  lwc1       $f2, %lo(D_800E3008)($at)
/* A1ECC 800A12CC 46020002 */  mul.s      $f0, $f0, $f2
/* A1ED0 800A12D0 3C01800E */  lui        $at, %hi(D_800E300C)
/* A1ED4 800A12D4 C422300C */  lwc1       $f2, %lo(D_800E300C)($at)
/* A1ED8 800A12D8 4600103E */  c.le.s     $f2, $f0
/* A1EDC 800A12DC 00000000 */  nop
/* A1EE0 800A12E0 45010005 */  bc1t       .L800A12F8
/* A1EE4 800A12E4 30AC00FF */   andi      $t4, $a1, 0xff
/* A1EE8 800A12E8 4600008D */  trunc.w.s  $f2, $f0
/* A1EEC 800A12EC 44031000 */  mfc1       $v1, $f2
/* A1EF0 800A12F0 080284C4 */  j          .L800A1310
/* A1EF4 800A12F4 306A00FF */   andi      $t2, $v1, 0xff
.L800A12F8:
/* A1EF8 800A12F8 46020001 */  sub.s      $f0, $f0, $f2
/* A1EFC 800A12FC 4600008D */  trunc.w.s  $f2, $f0
/* A1F00 800A1300 44031000 */  mfc1       $v1, $f2
/* A1F04 800A1304 3C028000 */  lui        $v0, 0x8000
/* A1F08 800A1308 00621825 */  or         $v1, $v1, $v0
/* A1F0C 800A130C 306A00FF */  andi       $t2, $v1, 0xff
.L800A1310:
/* A1F10 800A1310 2D4200FF */  sltiu      $v0, $t2, 0xff
/* A1F14 800A1314 14400043 */  bnez       $v0, .L800A1424
/* A1F18 800A1318 3C080010 */   lui       $t0, 0x10
/* A1F1C 800A131C 256255F0 */  addiu      $v0, $t3, 0x55f0
/* A1F20 800A1320 8C430010 */  lw         $v1, 0x10($v0)
/* A1F24 800A1324 8C630010 */  lw         $v1, 0x10($v1)
/* A1F28 800A1328 94620002 */  lhu        $v0, 2($v1)
/* A1F2C 800A132C 30420020 */  andi       $v0, $v0, 0x20
/* A1F30 800A1330 1040000A */  beqz       $v0, .L800A135C
/* A1F34 800A1334 24020001 */   addiu     $v0, $zero, 1
/* A1F38 800A1338 84630000 */  lh         $v1, ($v1)
/* A1F3C 800A133C 10620039 */  beq        $v1, $v0, .L800A1424
/* A1F40 800A1340 24020003 */   addiu     $v0, $zero, 3
/* A1F44 800A1344 10620037 */  beq        $v1, $v0, .L800A1424
/* A1F48 800A1348 24020008 */   addiu     $v0, $zero, 8
/* A1F4C 800A134C 10620034 */  beq        $v1, $v0, .L800A1420
/* A1F50 800A1350 3C080011 */   lui       $t0, 0x11
/* A1F54 800A1354 0802850A */  j          .L800A1428
/* A1F58 800A1358 35083078 */   ori       $t0, $t0, 0x3078
.L800A135C:
/* A1F5C 800A135C 3C080011 */  lui        $t0, 0x11
/* A1F60 800A1360 0802850A */  j          .L800A1428
/* A1F64 800A1364 35082078 */   ori       $t0, $t0, 0x2078
.L800A1368:
/* A1F68 800A1368 8D6455F0 */  lw         $a0, 0x55f0($t3)
/* A1F6C 800A136C 8CA30014 */  lw         $v1, 0x14($a1)
/* A1F70 800A1370 C48A01FC */  lwc1       $f10, 0x1fc($a0)
/* A1F74 800A1374 C4600004 */  lwc1       $f0, 4($v1)
/* A1F78 800A1378 46005282 */  mul.s      $f10, $f10, $f0
/* A1F7C 800A137C C4880200 */  lwc1       $f8, 0x200($a0)
/* A1F80 800A1380 C4600008 */  lwc1       $f0, 8($v1)
/* A1F84 800A1384 46004202 */  mul.s      $f8, $f8, $f0
/* A1F88 800A1388 C4860204 */  lwc1       $f6, 0x204($a0)
/* A1F8C 800A138C C460000C */  lwc1       $f0, 0xc($v1)
/* A1F90 800A1390 46003182 */  mul.s      $f6, $f6, $f0
/* A1F94 800A1394 3C01800E */  lui        $at, %hi(D_800E3010)
/* A1F98 800A1398 C42C3010 */  lwc1       $f12, %lo(D_800E3010)($at)
/* A1F9C 800A139C 460C5282 */  mul.s      $f10, $f10, $f12
/* A1FA0 800A13A0 00000000 */  nop
/* A1FA4 800A13A4 460C4202 */  mul.s      $f8, $f8, $f12
/* A1FA8 800A13A8 8CA2000C */  lw         $v0, 0xc($a1)
/* A1FAC 800A13AC C4640010 */  lwc1       $f4, 0x10($v1)
/* A1FB0 800A13B0 3C01800E */  lui        $at, %hi(D_800E3014)
/* A1FB4 800A13B4 C4203014 */  lwc1       $f0, %lo(D_800E3014)($at)
/* A1FB8 800A13B8 8C430058 */  lw         $v1, 0x58($v0)
/* A1FBC 800A13BC 46040101 */  sub.s      $f4, $f0, $f4
/* A1FC0 800A13C0 C4620000 */  lwc1       $f2, ($v1)
/* A1FC4 800A13C4 46020001 */  sub.s      $f0, $f0, $f2
/* A1FC8 800A13C8 46002102 */  mul.s      $f4, $f4, $f0
/* A1FCC 800A13CC 00000000 */  nop
/* A1FD0 800A13D0 460C3182 */  mul.s      $f6, $f6, $f12
/* A1FD4 800A13D4 C4820208 */  lwc1       $f2, 0x208($a0)
/* A1FD8 800A13D8 46041082 */  mul.s      $f2, $f2, $f4
/* A1FDC 800A13DC 3C080011 */  lui        $t0, 0x11
/* A1FE0 800A13E0 4600500D */  trunc.w.s  $f0, $f10
/* A1FE4 800A13E4 44020000 */  mfc1       $v0, $f0
/* A1FE8 800A13E8 304E00FF */  andi       $t6, $v0, 0xff
/* A1FEC 800A13EC 460C1082 */  mul.s      $f2, $f2, $f12
/* A1FF0 800A13F0 4600400D */  trunc.w.s  $f0, $f8
/* A1FF4 800A13F4 44020000 */  mfc1       $v0, $f0
/* A1FF8 800A13F8 304D00FF */  andi       $t5, $v0, 0xff
/* A1FFC 800A13FC 4600300D */  trunc.w.s  $f0, $f6
/* A2000 800A1400 44030000 */  mfc1       $v1, $f0
/* A2004 800A1404 306C00FF */  andi       $t4, $v1, 0xff
/* A2008 800A1408 4600100D */  trunc.w.s  $f0, $f2
/* A200C 800A140C 44020000 */  mfc1       $v0, $f0
/* A2010 800A1410 304A00FF */  andi       $t2, $v0, 0xff
/* A2014 800A1414 2D4300FF */  sltiu      $v1, $t2, 0xff
/* A2018 800A1418 10600003 */  beqz       $v1, .L800A1428
/* A201C 800A141C 35082078 */   ori       $t0, $t0, 0x2078
.L800A1420:
/* A2020 800A1420 3C080010 */  lui        $t0, 0x10
.L800A1424:
/* A2024 800A1424 350849D8 */  ori        $t0, $t0, 0x49d8
.L800A1428:
/* A2028 800A1428 8D6355F0 */  lw         $v1, 0x55f0($t3)
/* A202C 800A142C 8C6201F4 */  lw         $v0, 0x1f4($v1)
/* A2030 800A1430 30420100 */  andi       $v0, $v0, 0x100
/* A2034 800A1434 10400031 */  beqz       $v0, .L800A14FC
/* A2038 800A1438 01202021 */   addu      $a0, $t1, $zero
/* A203C 800A143C 25290008 */  addiu      $t1, $t1, 8
/* A2040 800A1440 3C02D9FF */  lui        $v0, 0xd9ff
/* A2044 800A1444 3442FFFF */  ori        $v0, $v0, 0xffff
/* A2048 800A1448 3C030001 */  lui        $v1, 1
/* A204C 800A144C 01203021 */  addu       $a2, $t1, $zero
/* A2050 800A1450 AC820000 */  sw         $v0, ($a0)
/* A2054 800A1454 3C02F800 */  lui        $v0, 0xf800
/* A2058 800A1458 25290008 */  addiu      $t1, $t1, 8
/* A205C 800A145C AC830004 */  sw         $v1, 4($a0)
/* A2060 800A1460 ACC20000 */  sw         $v0, ($a2)
/* A2064 800A1464 8D6555F0 */  lw         $a1, 0x55f0($t3)
/* A2068 800A1468 01203821 */  addu       $a3, $t1, $zero
/* A206C 800A146C 90A20214 */  lbu        $v0, 0x214($a1)
/* A2070 800A1470 90A30215 */  lbu        $v1, 0x215($a1)
/* A2074 800A1474 90A40216 */  lbu        $a0, 0x216($a1)
/* A2078 800A1478 00021600 */  sll        $v0, $v0, 0x18
/* A207C 800A147C 00031C00 */  sll        $v1, $v1, 0x10
/* A2080 800A1480 00431025 */  or         $v0, $v0, $v1
/* A2084 800A1484 00042200 */  sll        $a0, $a0, 8
/* A2088 800A1488 90A30217 */  lbu        $v1, 0x217($a1)
/* A208C 800A148C 00441025 */  or         $v0, $v0, $a0
/* A2090 800A1490 00431025 */  or         $v0, $v0, $v1
/* A2094 800A1494 ACC20004 */  sw         $v0, 4($a2)
/* A2098 800A1498 3C02DB08 */  lui        $v0, 0xdb08
/* A209C 800A149C ACE20000 */  sw         $v0, ($a3)
/* A20A0 800A14A0 8D6555F0 */  lw         $a1, 0x55f0($t3)
/* A20A4 800A14A4 3C040001 */  lui        $a0, 1
/* A20A8 800A14A8 8CA30210 */  lw         $v1, 0x210($a1)
/* A20AC 800A14AC 8CA6020C */  lw         $a2, 0x20c($a1)
/* A20B0 800A14B0 3484F400 */  ori        $a0, $a0, 0xf400
/* A20B4 800A14B4 00661823 */  subu       $v1, $v1, $a2
/* A20B8 800A14B8 0083001A */  div        $zero, $a0, $v1
/* A20BC 800A14BC 3C0FC800 */  lui        $t7, 0xc800
/* A20C0 800A14C0 25290008 */  addiu      $t1, $t1, 8
/* A20C4 800A14C4 00002012 */  mflo       $a0
/* A20C8 800A14C8 50600001 */  beql       $v1, $zero, .L800A14D0
/* A20CC 800A14CC 000001CD */   break     0, 7
.L800A14D0:
/* A20D0 800A14D0 240201F4 */   addiu     $v0, $zero, 0x1f4
/* A20D4 800A14D4 00461023 */  subu       $v0, $v0, $a2
/* A20D8 800A14D8 00021200 */  sll        $v0, $v0, 8
/* A20DC 800A14DC 0043001A */  div        $zero, $v0, $v1
/* A20E0 800A14E0 00042400 */  sll        $a0, $a0, 0x10
/* A20E4 800A14E4 00001012 */  mflo       $v0
/* A20E8 800A14E8 50600001 */  beql       $v1, $zero, .L800A14F0
/* A20EC 800A14EC 000001CD */   break     0, 7
.L800A14F0:
/* A20F0 800A14F0 3042FFFF */   andi      $v0, $v0, 0xffff
/* A20F4 800A14F4 00822025 */  or         $a0, $a0, $v0
/* A20F8 800A14F8 ACE40004 */  sw         $a0, 4($a3)
.L800A14FC:
/* A20FC 800A14FC 01202021 */  addu       $a0, $t1, $zero
/* A2100 800A1500 25290008 */  addiu      $t1, $t1, 8
/* A2104 800A1504 3C02E200 */  lui        $v0, 0xe200
/* A2108 800A1508 3442001C */  ori        $v0, $v0, 0x1c
/* A210C 800A150C 01E81825 */  or         $v1, $t7, $t0
/* A2110 800A1510 AC820000 */  sw         $v0, ($a0)
/* A2114 800A1514 01201021 */  addu       $v0, $t1, $zero
/* A2118 800A1518 AC830004 */  sw         $v1, 4($a0)
/* A211C 800A151C 3C04FA00 */  lui        $a0, 0xfa00
/* A2120 800A1520 000E1E00 */  sll        $v1, $t6, 0x18
/* A2124 800A1524 AC440000 */  sw         $a0, ($v0)
/* A2128 800A1528 000D2400 */  sll        $a0, $t5, 0x10
/* A212C 800A152C 00641825 */  or         $v1, $v1, $a0
/* A2130 800A1530 000C2A00 */  sll        $a1, $t4, 8
/* A2134 800A1534 00651825 */  or         $v1, $v1, $a1
/* A2138 800A1538 006A1825 */  or         $v1, $v1, $t2
/* A213C 800A153C AC430004 */  sw         $v1, 4($v0)
/* A2140 800A1540 03E00008 */  jr         $ra
/* A2144 800A1544 24420008 */   addiu     $v0, $v0, 8

glabel func_800A1548
/* A2148 800A1548 C4800000 */  lwc1       $f0, ($a0)
/* A214C 800A154C 3C02800F */  lui        $v0, %hi(D_800F3378)
/* A2150 800A1550 E4403378 */  swc1       $f0, %lo(D_800F3378)($v0)
/* A2154 800A1554 C4820004 */  lwc1       $f2, 4($a0)
/* A2158 800A1558 24423378 */  addiu      $v0, $v0, 0x3378
/* A215C 800A155C E4420004 */  swc1       $f2, 4($v0)
/* A2160 800A1560 C4800008 */  lwc1       $f0, 8($a0)
/* A2164 800A1564 03E00008 */  jr         $ra
/* A2168 800A1568 E4400008 */   swc1      $f0, 8($v0)

glabel gsAnimationDataMtx
/* A216C 800A156C 00803821 */  addu       $a3, $a0, $zero
/* A2170 800A1570 8CA20000 */  lw         $v0, ($a1)
/* A2174 800A1574 90A301FB */  lbu        $v1, 0x1fb($a1)
/* A2178 800A1578 24440010 */  addiu      $a0, $v0, 0x10
/* A217C 800A157C 8C820024 */  lw         $v0, 0x24($a0)
/* A2180 800A1580 1040001C */  beqz       $v0, .L800A15F4
/* A2184 800A1584 30680001 */   andi      $t0, $v1, 1
/* A2188 800A1588 00E03021 */  addu       $a2, $a3, $zero
/* A218C 800A158C 24E70008 */  addiu      $a3, $a3, 8
/* A2190 800A1590 3C02800F */  lui        $v0, %hi(D_800F3378)
/* A2194 800A1594 C4A000F8 */  lwc1       $f0, 0xf8($a1)
/* A2198 800A1598 3C03DA38 */  lui        $v1, 0xda38
/* A219C 800A159C E4403378 */  swc1       $f0, %lo(D_800F3378)($v0)
/* A21A0 800A15A0 C4A200FC */  lwc1       $f2, 0xfc($a1)
/* A21A4 800A15A4 24423378 */  addiu      $v0, $v0, 0x3378
/* A21A8 800A15A8 E4420004 */  swc1       $f2, 4($v0)
/* A21AC 800A15AC C4A00100 */  lwc1       $f0, 0x100($a1)
/* A21B0 800A15B0 34630007 */  ori        $v1, $v1, 7
/* A21B4 800A15B4 E4400008 */  swc1       $f0, 8($v0)
/* A21B8 800A15B8 8C840024 */  lw         $a0, 0x24($a0)
/* A21BC 800A15BC 00E02821 */  addu       $a1, $a3, $zero
/* A21C0 800A15C0 ACC30000 */  sw         $v1, ($a2)
/* A21C4 800A15C4 00081980 */  sll        $v1, $t0, 6
/* A21C8 800A15C8 8C82002C */  lw         $v0, 0x2c($a0)
/* A21CC 800A15CC 24840008 */  addiu      $a0, $a0, 8
/* A21D0 800A15D0 00431021 */  addu       $v0, $v0, $v1
/* A21D4 800A15D4 ACC20004 */  sw         $v0, 4($a2)
/* A21D8 800A15D8 3C02DB0E */  lui        $v0, 0xdb0e
/* A21DC 800A15DC 00081840 */  sll        $v1, $t0, 1
/* A21E0 800A15E0 00832021 */  addu       $a0, $a0, $v1
/* A21E4 800A15E4 ACA20000 */  sw         $v0, ($a1)
/* A21E8 800A15E8 94820000 */  lhu        $v0, ($a0)
/* A21EC 800A15EC 24E70008 */  addiu      $a3, $a3, 8
/* A21F0 800A15F0 ACA20004 */  sw         $v0, 4($a1)
.L800A15F4:
/* A21F4 800A15F4 03E00008 */  jr         $ra
/* A21F8 800A15F8 00E01021 */   addu      $v0, $a3, $zero

glabel BorgAnimDrawSceneRaw
/* A21FC 800A15FC 27BDFDD0 */  addiu      $sp, $sp, -0x230
/* A2200 800A1600 AFB40208 */  sw         $s4, 0x208($sp)
/* A2204 800A1604 0080A021 */  addu       $s4, $a0, $zero
/* A2208 800A1608 3C03800F */  lui        $v1, 0x800f
/* A220C 800A160C AFBF021C */  sw         $ra, 0x21c($sp)
/* A2210 800A1610 AFBE0218 */  sw         $fp, 0x218($sp)
/* A2214 800A1614 AFB70214 */  sw         $s7, 0x214($sp)
/* A2218 800A1618 AFB60210 */  sw         $s6, 0x210($sp)
/* A221C 800A161C AFB5020C */  sw         $s5, 0x20c($sp)
/* A2220 800A1620 AFB30204 */  sw         $s3, 0x204($sp)
/* A2224 800A1624 AFB20200 */  sw         $s2, 0x200($sp)
/* A2228 800A1628 AFB101FC */  sw         $s1, 0x1fc($sp)
/* A222C 800A162C AFB001F8 */  sw         $s0, 0x1f8($sp)
/* A2230 800A1630 F7B60228 */  sdc1       $f22, 0x228($sp)
/* A2234 800A1634 F7B40220 */  sdc1       $f20, 0x220($sp)
/* A2238 800A1638 AFA50234 */  sw         $a1, 0x234($sp)
/* A223C 800A163C 90A401FB */  lbu        $a0, 0x1fb($a1)
/* A2240 800A1640 8CA20000 */  lw         $v0, ($a1)
/* A2244 800A1644 246755F0 */  addiu      $a3, $v1, 0x55f0
/* A2248 800A1648 AC6555F0 */  sw         $a1, 0x55f0($v1)
/* A224C 800A164C ACE0000C */  sw         $zero, 0xc($a3)
/* A2250 800A1650 ACE00010 */  sw         $zero, 0x10($a3)
/* A2254 800A1654 ACE00014 */  sw         $zero, 0x14($a3)
/* A2258 800A1658 24480010 */  addiu      $t0, $v0, 0x10
/* A225C 800A165C 8C450028 */  lw         $a1, 0x28($v0)
/* A2260 800A1660 30840001 */  andi       $a0, $a0, 1
/* A2264 800A1664 ACE80004 */  sw         $t0, 4($a3)
/* A2268 800A1668 AFA401F0 */  sw         $a0, 0x1f0($sp)
/* A226C 800A166C 8D020024 */  lw         $v0, 0x24($t0)
/* A2270 800A1670 54400001 */  bnel       $v0, $zero, .L800A1678
/* A2274 800A1674 24A50040 */   addiu     $a1, $a1, 0x40
.L800A1678:
/* A2278 800A1678 8FA60234 */  lw         $a2, 0x234($sp)
/* A227C 800A167C 8CC401F4 */  lw         $a0, 0x1f4($a2)
/* A2280 800A1680 30828000 */  andi       $v0, $a0, 0x8000
/* A2284 800A1684 10400063 */  beqz       $v0, .L800A1814
/* A2288 800A1688 00006021 */   addu      $t4, $zero, $zero
/* A228C 800A168C 8FA70234 */  lw         $a3, 0x234($sp)
/* A2290 800A1690 8CEA029C */  lw         $t2, 0x29c($a3)
/* A2294 800A1694 11400047 */  beqz       $t2, .L800A17B4
/* A2298 800A1698 3C03800E */   lui       $v1, %hi(D_800E3018)
/* A229C 800A169C 24623018 */  addiu      $v0, $v1, %lo(D_800E3018)
/* A22A0 800A16A0 00009821 */  addu       $s3, $zero, $zero
/* A22A4 800A16A4 8C643018 */  lw         $a0, 0x3018($v1)
/* A22A8 800A16A8 8C450004 */  lw         $a1, 4($v0)
/* A22AC 800A16AC 8C430008 */  lw         $v1, 8($v0)
/* A22B0 800A16B0 8C46000C */  lw         $a2, 0xc($v0)
/* A22B4 800A16B4 8C470010 */  lw         $a3, 0x10($v0)
/* A22B8 800A16B8 8C480014 */  lw         $t0, 0x14($v0)
/* A22BC 800A16BC 8C490018 */  lw         $t1, 0x18($v0)
/* A22C0 800A16C0 27AB0030 */  addiu      $t3, $sp, 0x30
/* A22C4 800A16C4 AFA40030 */  sw         $a0, 0x30($sp)
/* A22C8 800A16C8 AFA50034 */  sw         $a1, 0x34($sp)
/* A22CC 800A16CC AFA30038 */  sw         $v1, 0x38($sp)
/* A22D0 800A16D0 AFA6003C */  sw         $a2, 0x3c($sp)
/* A22D4 800A16D4 AFA70040 */  sw         $a3, 0x40($sp)
/* A22D8 800A16D8 AFA80044 */  sw         $t0, 0x44($sp)
/* A22DC 800A16DC 19400016 */  blez       $t2, .L800A1738
/* A22E0 800A16E0 AFA90048 */   sw        $t1, 0x48($sp)
/* A22E4 800A16E4 3C06DC08 */  lui        $a2, 0xdc08
/* A22E8 800A16E8 34C6000A */  ori        $a2, $a2, 0xa
/* A22EC 800A16EC 3C09800F */  lui        $t1, 0x800f
/* A22F0 800A16F0 24080218 */  addiu      $t0, $zero, 0x218
/* A22F4 800A16F4 24070006 */  addiu      $a3, $zero, 6
.L800A16F8:
/* A22F8 800A16F8 02802821 */  addu       $a1, $s4, $zero
/* A22FC 800A16FC 26940008 */  addiu      $s4, $s4, 8
/* A2300 800A1700 30E200FF */  andi       $v0, $a3, 0xff
/* A2304 800A1704 00021200 */  sll        $v0, $v0, 8
/* A2308 800A1708 00461025 */  or         $v0, $v0, $a2
/* A230C 800A170C ACA20000 */  sw         $v0, ($a1)
/* A2310 800A1710 8D2355F0 */  lw         $v1, 0x55f0($t1)
/* A2314 800A1714 24E70003 */  addiu      $a3, $a3, 3
/* A2318 800A1718 00681821 */  addu       $v1, $v1, $t0
/* A231C 800A171C ACA30004 */  sw         $v1, 4($a1)
/* A2320 800A1720 8D2455F0 */  lw         $a0, 0x55f0($t1)
/* A2324 800A1724 26730001 */  addiu      $s3, $s3, 1
/* A2328 800A1728 8C82029C */  lw         $v0, 0x29c($a0)
/* A232C 800A172C 0262102A */  slt        $v0, $s3, $v0
/* A2330 800A1730 1440FFF1 */  bnez       $v0, .L800A16F8
/* A2334 800A1734 25080010 */   addiu     $t0, $t0, 0x10
.L800A1738:
/* A2338 800A1738 3C04DC08 */  lui        $a0, 0xdc08
/* A233C 800A173C 3484000A */  ori        $a0, $a0, 0xa
/* A2340 800A1740 02803021 */  addu       $a2, $s4, $zero
/* A2344 800A1744 26630001 */  addiu      $v1, $s3, 1
/* A2348 800A1748 00031040 */  sll        $v0, $v1, 1
/* A234C 800A174C 00431021 */  addu       $v0, $v0, $v1
/* A2350 800A1750 24420003 */  addiu      $v0, $v0, 3
/* A2354 800A1754 304200FF */  andi       $v0, $v0, 0xff
/* A2358 800A1758 00021200 */  sll        $v0, $v0, 8
/* A235C 800A175C 00441025 */  or         $v0, $v0, $a0
/* A2360 800A1760 3C08800F */  lui        $t0, 0x800f
/* A2364 800A1764 26940008 */  addiu      $s4, $s4, 8
/* A2368 800A1768 02802821 */  addu       $a1, $s4, $zero
/* A236C 800A176C ACC20000 */  sw         $v0, ($a2)
/* A2370 800A1770 2662FFFF */  addiu      $v0, $s3, -1
/* A2374 800A1774 00021080 */  sll        $v0, $v0, 2
/* A2378 800A1778 8D0355F0 */  lw         $v1, 0x55f0($t0)
/* A237C 800A177C 01621021 */  addu       $v0, $t3, $v0
/* A2380 800A1780 24630288 */  addiu      $v1, $v1, 0x288
/* A2384 800A1784 ACC30004 */  sw         $v1, 4($a2)
/* A2388 800A1788 3C03DB02 */  lui        $v1, 0xdb02
/* A238C 800A178C ACA30000 */  sw         $v1, ($a1)
/* A2390 800A1790 8C440000 */  lw         $a0, ($v0)
/* A2394 800A1794 00041840 */  sll        $v1, $a0, 1
/* A2398 800A1798 00641821 */  addu       $v1, $v1, $a0
/* A239C 800A179C 000318C0 */  sll        $v1, $v1, 3
/* A23A0 800A17A0 ACA30004 */  sw         $v1, 4($a1)
/* A23A4 800A17A4 8D0255F0 */  lw         $v0, 0x55f0($t0)
/* A23A8 800A17A8 26940008 */  addiu      $s4, $s4, 8
/* A23AC 800A17AC 0802875C */  j          .L800A1D70
/* A23B0 800A17B0 AC40029C */   sw        $zero, 0x29c($v0)
.L800A17B4:
/* A23B4 800A17B4 02802821 */  addu       $a1, $s4, $zero
/* A23B8 800A17B8 26940008 */  addiu      $s4, $s4, 8
/* A23BC 800A17BC 3C03DC08 */  lui        $v1, 0xdc08
/* A23C0 800A17C0 3463060A */  ori        $v1, $v1, 0x60a
/* A23C4 800A17C4 02803021 */  addu       $a2, $s4, $zero
/* A23C8 800A17C8 26940008 */  addiu      $s4, $s4, 8
/* A23CC 800A17CC 3C04DC08 */  lui        $a0, 0xdc08
/* A23D0 800A17D0 3484090A */  ori        $a0, $a0, 0x90a
/* A23D4 800A17D4 3C02800F */  lui        $v0, %hi(D_800F32C8)
/* A23D8 800A17D8 244232C8 */  addiu      $v0, $v0, %lo(D_800F32C8)
/* A23DC 800A17DC ACA30000 */  sw         $v1, ($a1)
/* A23E0 800A17E0 ACA20004 */  sw         $v0, 4($a1)
/* A23E4 800A17E4 02802821 */  addu       $a1, $s4, $zero
/* A23E8 800A17E8 3C03800F */  lui        $v1, %hi(D_800F55F0)
/* A23EC 800A17EC 26940008 */  addiu      $s4, $s4, 8
/* A23F0 800A17F0 ACC40000 */  sw         $a0, ($a2)
/* A23F4 800A17F4 8C6255F0 */  lw         $v0, %lo(D_800F55F0)($v1)
/* A23F8 800A17F8 3C03DB02 */  lui        $v1, 0xdb02
/* A23FC 800A17FC 24420288 */  addiu      $v0, $v0, 0x288
/* A2400 800A1800 ACC20004 */  sw         $v0, 4($a2)
/* A2404 800A1804 24020018 */  addiu      $v0, $zero, 0x18
/* A2408 800A1808 ACA30000 */  sw         $v1, ($a1)
/* A240C 800A180C 0802875C */  j          .L800A1D70
/* A2410 800A1810 ACA20004 */   sw        $v0, 4($a1)
.L800A1814:
/* A2414 800A1814 30820080 */  andi       $v0, $a0, 0x80
/* A2418 800A1818 14400004 */  bnez       $v0, .L800A182C
/* A241C 800A181C 8D030004 */   lw        $v1, 4($t0)
/* A2420 800A1820 00601021 */  addu       $v0, $v1, $zero
/* A2424 800A1824 14400018 */  bnez       $v0, .L800A1888
/* A2428 800A1828 00409821 */   addu      $s3, $v0, $zero
.L800A182C:
/* A242C 800A182C 02802821 */  addu       $a1, $s4, $zero
/* A2430 800A1830 26940008 */  addiu      $s4, $s4, 8
/* A2434 800A1834 3C03DC08 */  lui        $v1, 0xdc08
/* A2438 800A1838 3463060A */  ori        $v1, $v1, 0x60a
/* A243C 800A183C 02803021 */  addu       $a2, $s4, $zero
/* A2440 800A1840 26940008 */  addiu      $s4, $s4, 8
/* A2444 800A1844 3C04DC08 */  lui        $a0, 0xdc08
/* A2448 800A1848 3484090A */  ori        $a0, $a0, 0x90a
/* A244C 800A184C 02803821 */  addu       $a3, $s4, $zero
/* A2450 800A1850 26940008 */  addiu      $s4, $s4, 8
/* A2454 800A1854 3C02800F */  lui        $v0, %hi(D_800F32C8)
/* A2458 800A1858 244232C8 */  addiu      $v0, $v0, %lo(D_800F32C8)
/* A245C 800A185C ACA20004 */  sw         $v0, 4($a1)
/* A2460 800A1860 3C02800F */  lui        $v0, %hi(D_800F32B8)
/* A2464 800A1864 244232B8 */  addiu      $v0, $v0, %lo(D_800F32B8)
/* A2468 800A1868 ACA30000 */  sw         $v1, ($a1)
/* A246C 800A186C 3C03DB02 */  lui        $v1, 0xdb02
/* A2470 800A1870 ACC20004 */  sw         $v0, 4($a2)
/* A2474 800A1874 24020018 */  addiu      $v0, $zero, 0x18
/* A2478 800A1878 ACC40000 */  sw         $a0, ($a2)
/* A247C 800A187C ACE30000 */  sw         $v1, ($a3)
/* A2480 800A1880 0802875C */  j          .L800A1D70
/* A2484 800A1884 ACE20004 */   sw        $v0, 4($a3)
.L800A1888:
/* A2488 800A1888 3C0A8000 */  lui        $t2, 0x8000
/* A248C 800A188C 24E7001C */  addiu      $a3, $a3, 0x1c
/* A2490 800A1890 8FA401F0 */  lw         $a0, 0x1f0($sp)
/* A2494 800A1894 8D060028 */  lw         $a2, 0x28($t0)
/* A2498 800A1898 3C01800E */  lui        $at, %hi(D_800E30AC)
/* A249C 800A189C C43030AC */  lwc1       $f16, %lo(D_800E30AC)($at)
/* A24A0 800A18A0 44805000 */  mtc1       $zero, $f10
/* A24A4 800A18A4 3C01800E */  lui        $at, %hi(D_800E30B0)
/* A24A8 800A18A8 C42E30B0 */  lwc1       $f14, %lo(D_800E30B0)($at)
/* A24AC 800A18AC 3C01800E */  lui        $at, %hi(D_800E30B4)
/* A24B0 800A18B0 C42C30B4 */  lwc1       $f12, %lo(D_800E30B4)($at)
/* A24B4 800A18B4 00045900 */  sll        $t3, $a0, 4
/* A24B8 800A18B8 01604821 */  addu       $t1, $t3, $zero
.L800A18BC:
/* A24BC 800A18BC 8CA2000C */  lw         $v0, 0xc($a1)
/* A24C0 800A18C0 C4A00028 */  lwc1       $f0, 0x28($a1)
/* A24C4 800A18C4 4600803C */  c.lt.s     $f16, $f0
/* A24C8 800A18C8 00000000 */  nop
/* A24CC 800A18CC 45010005 */  bc1t       .L800A18E4
/* A24D0 800A18D0 244300C0 */   addiu     $v1, $v0, 0xc0
/* A24D4 800A18D4 460A003C */  c.lt.s     $f0, $f10
/* A24D8 800A18D8 00000000 */  nop
/* A24DC 800A18DC 45010009 */  bc1t       .L800A1904
/* A24E0 800A18E0 00000000 */   nop
.L800A18E4:
/* A24E4 800A18E4 3C01800E */  lui        $at, %hi(D_800E30B8)
/* A24E8 800A18E8 C42230B8 */  lwc1       $f2, %lo(D_800E30B8)($at)
/* A24EC 800A18EC 4600803C */  c.lt.s     $f16, $f0
/* A24F0 800A18F0 00000000 */  nop
/* A24F4 800A18F4 45020004 */  bc1fl      .L800A1908
/* A24F8 800A18F8 46000086 */   mov.s     $f2, $f0
/* A24FC 800A18FC 08028643 */  j          .L800A190C
/* A2500 800A1900 E7A20070 */   swc1      $f2, 0x70($sp)
.L800A1904:
/* A2504 800A1904 44801000 */  mtc1       $zero, $f2
.L800A1908:
/* A2508 800A1908 E7A20070 */  swc1       $f2, 0x70($sp)
.L800A190C:
/* A250C 800A190C C4A0002C */  lwc1       $f0, 0x2c($a1)
/* A2510 800A1910 3C01800E */  lui        $at, %hi(D_800E30BC)
/* A2514 800A1914 C42430BC */  lwc1       $f4, %lo(D_800E30BC)($at)
/* A2518 800A1918 4600203C */  c.lt.s     $f4, $f0
/* A251C 800A191C 00000000 */  nop
/* A2520 800A1920 4501000C */  bc1t       .L800A1954
/* A2524 800A1924 46002086 */   mov.s     $f2, $f4
/* A2528 800A1928 460A003C */  c.lt.s     $f0, $f10
/* A252C 800A192C 00000000 */  nop
/* A2530 800A1930 45010007 */  bc1t       .L800A1950
/* A2534 800A1934 00000000 */   nop
/* A2538 800A1938 4600203C */  c.lt.s     $f4, $f0
/* A253C 800A193C 00000000 */  nop
/* A2540 800A1940 45030005 */  bc1tl      .L800A1958
/* A2544 800A1944 E7A20074 */   swc1      $f2, 0x74($sp)
/* A2548 800A1948 08028655 */  j          .L800A1954
/* A254C 800A194C 46000086 */   mov.s     $f2, $f0
.L800A1950:
/* A2550 800A1950 44801000 */  mtc1       $zero, $f2
.L800A1954:
/* A2554 800A1954 E7A20074 */  swc1       $f2, 0x74($sp)
.L800A1958:
/* A2558 800A1958 C4A00030 */  lwc1       $f0, 0x30($a1)
/* A255C 800A195C 3C01800E */  lui        $at, %hi(D_800E30C0)
/* A2560 800A1960 C42430C0 */  lwc1       $f4, %lo(D_800E30C0)($at)
/* A2564 800A1964 4600203C */  c.lt.s     $f4, $f0
/* A2568 800A1968 00000000 */  nop
/* A256C 800A196C 4503000C */  bc1tl      .L800A19A0
/* A2570 800A1970 46002086 */   mov.s     $f2, $f4
/* A2574 800A1974 460A003C */  c.lt.s     $f0, $f10
/* A2578 800A1978 00000000 */  nop
/* A257C 800A197C 45010007 */  bc1t       .L800A199C
/* A2580 800A1980 00000000 */   nop
/* A2584 800A1984 4600203C */  c.lt.s     $f4, $f0
/* A2588 800A1988 00000000 */  nop
/* A258C 800A198C 45010004 */  bc1t       .L800A19A0
/* A2590 800A1990 46002086 */   mov.s     $f2, $f4
/* A2594 800A1994 08028668 */  j          .L800A19A0
/* A2598 800A1998 46000086 */   mov.s     $f2, $f0
.L800A199C:
/* A259C 800A199C 44801000 */  mtc1       $zero, $f2
.L800A19A0:
/* A25A0 800A19A0 E7A20078 */  swc1       $f2, 0x78($sp)
/* A25A4 800A19A4 8CC20000 */  lw         $v0, ($a2)
/* A25A8 800A19A8 C7A00070 */  lwc1       $f0, 0x70($sp)
/* A25AC 800A19AC C442000C */  lwc1       $f2, 0xc($v0)
/* A25B0 800A19B0 46001082 */  mul.s      $f2, $f2, $f0
/* A25B4 800A19B4 3C01800E */  lui        $at, %hi(D_800E30C4)
/* A25B8 800A19B8 C42030C4 */  lwc1       $f0, %lo(D_800E30C4)($at)
/* A25BC 800A19BC 4600103C */  c.lt.s     $f2, $f0
/* A25C0 800A19C0 00000000 */  nop
/* A25C4 800A19C4 45000006 */  bc1f       .L800A19E0
/* A25C8 800A19C8 00000000 */   nop
/* A25CC 800A19CC 460A103C */  c.lt.s     $f2, $f10
/* A25D0 800A19D0 00000000 */  nop
/* A25D4 800A19D4 45010007 */  bc1t       .L800A19F4
/* A25D8 800A19D8 00000000 */   nop
/* A25DC 800A19DC 4600103C */  c.lt.s     $f2, $f0
.L800A19E0:
/* A25E0 800A19E0 00000000 */  nop
/* A25E4 800A19E4 45010004 */  bc1t       .L800A19F8
/* A25E8 800A19E8 46001186 */   mov.s     $f6, $f2
/* A25EC 800A19EC 0802867E */  j          .L800A19F8
/* A25F0 800A19F0 46000186 */   mov.s     $f6, $f0
.L800A19F4:
/* A25F4 800A19F4 44803000 */  mtc1       $zero, $f6
.L800A19F8:
/* A25F8 800A19F8 8CC20000 */  lw         $v0, ($a2)
/* A25FC 800A19FC C7A00074 */  lwc1       $f0, 0x74($sp)
/* A2600 800A1A00 C4420010 */  lwc1       $f2, 0x10($v0)
/* A2604 800A1A04 46001082 */  mul.s      $f2, $f2, $f0
/* A2608 800A1A08 3C01800E */  lui        $at, %hi(D_800E30C8)
/* A260C 800A1A0C C42030C8 */  lwc1       $f0, %lo(D_800E30C8)($at)
/* A2610 800A1A10 4600103C */  c.lt.s     $f2, $f0
/* A2614 800A1A14 00000000 */  nop
/* A2618 800A1A18 45000006 */  bc1f       .L800A1A34
/* A261C 800A1A1C 00000000 */   nop
/* A2620 800A1A20 460A103C */  c.lt.s     $f2, $f10
/* A2624 800A1A24 00000000 */  nop
/* A2628 800A1A28 45010007 */  bc1t       .L800A1A48
/* A262C 800A1A2C 00000000 */   nop
/* A2630 800A1A30 4600103C */  c.lt.s     $f2, $f0
.L800A1A34:
/* A2634 800A1A34 00000000 */  nop
/* A2638 800A1A38 45010004 */  bc1t       .L800A1A4C
/* A263C 800A1A3C 46001106 */   mov.s     $f4, $f2
/* A2640 800A1A40 08028693 */  j          .L800A1A4C
/* A2644 800A1A44 46000106 */   mov.s     $f4, $f0
.L800A1A48:
/* A2648 800A1A48 44802000 */  mtc1       $zero, $f4
.L800A1A4C:
/* A264C 800A1A4C C4420014 */  lwc1       $f2, 0x14($v0)
/* A2650 800A1A50 C7A00078 */  lwc1       $f0, 0x78($sp)
/* A2654 800A1A54 46001082 */  mul.s      $f2, $f2, $f0
/* A2658 800A1A58 3C01800E */  lui        $at, %hi(D_800E30CC)
/* A265C 800A1A5C C42030CC */  lwc1       $f0, %lo(D_800E30CC)($at)
/* A2660 800A1A60 4600103C */  c.lt.s     $f2, $f0
/* A2664 800A1A64 00000000 */  nop
/* A2668 800A1A68 45000006 */  bc1f       .L800A1A84
/* A266C 800A1A6C 00000000 */   nop
/* A2670 800A1A70 460A103C */  c.lt.s     $f2, $f10
/* A2674 800A1A74 00000000 */  nop
/* A2678 800A1A78 45010007 */  bc1t       .L800A1A98
/* A267C 800A1A7C 00000000 */   nop
/* A2680 800A1A80 4600103C */  c.lt.s     $f2, $f0
.L800A1A84:
/* A2684 800A1A84 00000000 */  nop
/* A2688 800A1A88 45010004 */  bc1t       .L800A1A9C
/* A268C 800A1A8C 46001206 */   mov.s     $f8, $f2
/* A2690 800A1A90 080286A7 */  j          .L800A1A9C
/* A2694 800A1A94 46000206 */   mov.s     $f8, $f0
.L800A1A98:
/* A2698 800A1A98 44804000 */  mtc1       $zero, $f8
.L800A1A9C:
/* A269C 800A1A9C C4600020 */  lwc1       $f0, 0x20($v1)
/* A26A0 800A1AA0 460E0002 */  mul.s      $f0, $f0, $f14
/* A26A4 800A1AA4 8C440018 */  lw         $a0, 0x18($v0)
/* A26A8 800A1AA8 00892021 */  addu       $a0, $a0, $t1
/* A26AC 800A1AAC 4600008D */  trunc.w.s  $f2, $f0
/* A26B0 800A1AB0 44021000 */  mfc1       $v0, $f2
/* A26B4 800A1AB4 A0820008 */  sb         $v0, 8($a0)
/* A26B8 800A1AB8 C4600024 */  lwc1       $f0, 0x24($v1)
/* A26BC 800A1ABC 460E0002 */  mul.s      $f0, $f0, $f14
/* A26C0 800A1AC0 4600008D */  trunc.w.s  $f2, $f0
/* A26C4 800A1AC4 44021000 */  mfc1       $v0, $f2
/* A26C8 800A1AC8 A0820009 */  sb         $v0, 9($a0)
/* A26CC 800A1ACC C4600028 */  lwc1       $f0, 0x28($v1)
/* A26D0 800A1AD0 460E0002 */  mul.s      $f0, $f0, $f14
/* A26D4 800A1AD4 4600008D */  trunc.w.s  $f2, $f0
/* A26D8 800A1AD8 44021000 */  mfc1       $v0, $f2
/* A26DC 800A1ADC 460C3002 */  mul.s      $f0, $f6, $f12
/* A26E0 800A1AE0 A082000A */  sb         $v0, 0xa($a0)
/* A26E4 800A1AE4 8CC30000 */  lw         $v1, ($a2)
/* A26E8 800A1AE8 8C620018 */  lw         $v0, 0x18($v1)
/* A26EC 800A1AEC 3C01800E */  lui        $at, %hi(D_800E30D0)
/* A26F0 800A1AF0 C42230D0 */  lwc1       $f2, %lo(D_800E30D0)($at)
/* A26F4 800A1AF4 4600103E */  c.le.s     $f2, $f0
/* A26F8 800A1AF8 00000000 */  nop
/* A26FC 800A1AFC 45010005 */  bc1t       .L800A1B14
/* A2700 800A1B00 01221821 */   addu      $v1, $t1, $v0
/* A2704 800A1B04 4600008D */  trunc.w.s  $f2, $f0
/* A2708 800A1B08 44021000 */  mfc1       $v0, $f2
/* A270C 800A1B0C 080286C9 */  j          .L800A1B24
/* A2710 800A1B10 00000000 */   nop
.L800A1B14:
/* A2714 800A1B14 46020001 */  sub.s      $f0, $f0, $f2
/* A2718 800A1B18 4600008D */  trunc.w.s  $f2, $f0
/* A271C 800A1B1C 44021000 */  mfc1       $v0, $f2
/* A2720 800A1B20 004A1025 */  or         $v0, $v0, $t2
.L800A1B24:
/* A2724 800A1B24 460C2002 */  mul.s      $f0, $f4, $f12
/* A2728 800A1B28 A0620004 */  sb         $v0, 4($v1)
/* A272C 800A1B2C A0620000 */  sb         $v0, ($v1)
/* A2730 800A1B30 8CC20000 */  lw         $v0, ($a2)
/* A2734 800A1B34 8C430018 */  lw         $v1, 0x18($v0)
/* A2738 800A1B38 3C01800E */  lui        $at, %hi(D_800E30D4)
/* A273C 800A1B3C C42230D4 */  lwc1       $f2, %lo(D_800E30D4)($at)
/* A2740 800A1B40 4600103E */  c.le.s     $f2, $f0
/* A2744 800A1B44 00000000 */  nop
/* A2748 800A1B48 45010005 */  bc1t       .L800A1B60
/* A274C 800A1B4C 01231821 */   addu      $v1, $t1, $v1
/* A2750 800A1B50 4600008D */  trunc.w.s  $f2, $f0
/* A2754 800A1B54 44021000 */  mfc1       $v0, $f2
/* A2758 800A1B58 080286DC */  j          .L800A1B70
/* A275C 800A1B5C 00000000 */   nop
.L800A1B60:
/* A2760 800A1B60 46020001 */  sub.s      $f0, $f0, $f2
/* A2764 800A1B64 4600008D */  trunc.w.s  $f2, $f0
/* A2768 800A1B68 44021000 */  mfc1       $v0, $f2
/* A276C 800A1B6C 004A1025 */  or         $v0, $v0, $t2
.L800A1B70:
/* A2770 800A1B70 460C4002 */  mul.s      $f0, $f8, $f12
/* A2774 800A1B74 A0620005 */  sb         $v0, 5($v1)
/* A2778 800A1B78 A0620001 */  sb         $v0, 1($v1)
/* A277C 800A1B7C 8CC20000 */  lw         $v0, ($a2)
/* A2780 800A1B80 8C430018 */  lw         $v1, 0x18($v0)
/* A2784 800A1B84 3C01800E */  lui        $at, %hi(D_800E30D8)
/* A2788 800A1B88 C42230D8 */  lwc1       $f2, %lo(D_800E30D8)($at)
/* A278C 800A1B8C 4600103E */  c.le.s     $f2, $f0
/* A2790 800A1B90 00000000 */  nop
/* A2794 800A1B94 45010005 */  bc1t       .L800A1BAC
/* A2798 800A1B98 01231821 */   addu      $v1, $t1, $v1
/* A279C 800A1B9C 4600008D */  trunc.w.s  $f2, $f0
/* A27A0 800A1BA0 44021000 */  mfc1       $v0, $f2
/* A27A4 800A1BA4 080286F0 */  j          .L800A1BC0
/* A27A8 800A1BA8 2673FFFF */   addiu     $s3, $s3, -1
.L800A1BAC:
/* A27AC 800A1BAC 46020001 */  sub.s      $f0, $f0, $f2
/* A27B0 800A1BB0 4600008D */  trunc.w.s  $f2, $f0
/* A27B4 800A1BB4 44021000 */  mfc1       $v0, $f2
/* A27B8 800A1BB8 004A1025 */  or         $v0, $v0, $t2
/* A27BC 800A1BBC 2673FFFF */  addiu      $s3, $s3, -1
.L800A1BC0:
/* A27C0 800A1BC0 A0620006 */  sb         $v0, 6($v1)
/* A27C4 800A1BC4 A0620002 */  sb         $v0, 2($v1)
/* A27C8 800A1BC8 8CC20000 */  lw         $v0, ($a2)
/* A27CC 800A1BCC 24C60004 */  addiu      $a2, $a2, 4
/* A27D0 800A1BD0 24A50040 */  addiu      $a1, $a1, 0x40
/* A27D4 800A1BD4 258C0001 */  addiu      $t4, $t4, 1
/* A27D8 800A1BD8 ACE20000 */  sw         $v0, ($a3)
/* A27DC 800A1BDC 1660FF37 */  bnez       $s3, .L800A18BC
/* A27E0 800A1BE0 24E70004 */   addiu     $a3, $a3, 4
/* A27E4 800A1BE4 3C06800F */  lui        $a2, %hi(D_800F55F0)
/* A27E8 800A1BE8 24C555F0 */  addiu      $a1, $a2, %lo(D_800F55F0)
/* A27EC 800A1BEC 8CA30004 */  lw         $v1, 4($a1)
/* A27F0 800A1BF0 8C640004 */  lw         $a0, 4($v1)
/* A27F4 800A1BF4 24020001 */  addiu      $v0, $zero, 1
/* A27F8 800A1BF8 54820016 */  bnel       $a0, $v0, .L800A1C54
/* A27FC 800A1BFC 8C660028 */   lw        $a2, 0x28($v1)
/* A2800 800A1C00 02803821 */  addu       $a3, $s4, $zero
/* A2804 800A1C04 26940008 */  addiu      $s4, $s4, 8
/* A2808 800A1C08 3C02DC08 */  lui        $v0, 0xdc08
/* A280C 800A1C0C 3442090A */  ori        $v0, $v0, 0x90a
/* A2810 800A1C10 02803021 */  addu       $a2, $s4, $zero
/* A2814 800A1C14 ACE20000 */  sw         $v0, ($a3)
/* A2818 800A1C18 8CA20004 */  lw         $v0, 4($a1)
/* A281C 800A1C1C 26940008 */  addiu      $s4, $s4, 8
/* A2820 800A1C20 8C440028 */  lw         $a0, 0x28($v0)
/* A2824 800A1C24 3C03DC08 */  lui        $v1, 0xdc08
/* A2828 800A1C28 8C850000 */  lw         $a1, ($a0)
/* A282C 800A1C2C 3463060A */  ori        $v1, $v1, 0x60a
/* A2830 800A1C30 8CA20018 */  lw         $v0, 0x18($a1)
/* A2834 800A1C34 2588FFFF */  addiu      $t0, $t4, -1
/* A2838 800A1C38 004B1021 */  addu       $v0, $v0, $t3
/* A283C 800A1C3C ACE20004 */  sw         $v0, 4($a3)
/* A2840 800A1C40 3C02800F */  lui        $v0, %hi(D_800F32C8)
/* A2844 800A1C44 244232C8 */  addiu      $v0, $v0, %lo(D_800F32C8)
/* A2848 800A1C48 ACC30000 */  sw         $v1, ($a2)
/* A284C 800A1C4C 0802872A */  j          .L800A1CA8
/* A2850 800A1C50 ACC20004 */   sw        $v0, 4($a2)
.L800A1C54:
/* A2854 800A1C54 00809821 */  addu       $s3, $a0, $zero
/* A2858 800A1C58 12600013 */  beqz       $s3, .L800A1CA8
/* A285C 800A1C5C 2588FFFF */   addiu     $t0, $t4, -1
/* A2860 800A1C60 3C05DC08 */  lui        $a1, 0xdc08
/* A2864 800A1C64 34A5000A */  ori        $a1, $a1, 0xa
/* A2868 800A1C68 01604821 */  addu       $t1, $t3, $zero
/* A286C 800A1C6C 24070006 */  addiu      $a3, $zero, 6
.L800A1C70:
/* A2870 800A1C70 02802021 */  addu       $a0, $s4, $zero
/* A2874 800A1C74 26940008 */  addiu      $s4, $s4, 8
/* A2878 800A1C78 30E200FF */  andi       $v0, $a3, 0xff
/* A287C 800A1C7C 24E70003 */  addiu      $a3, $a3, 3
/* A2880 800A1C80 00021200 */  sll        $v0, $v0, 8
/* A2884 800A1C84 00451025 */  or         $v0, $v0, $a1
/* A2888 800A1C88 AC820000 */  sw         $v0, ($a0)
/* A288C 800A1C8C 8CC30000 */  lw         $v1, ($a2)
/* A2890 800A1C90 2673FFFF */  addiu      $s3, $s3, -1
/* A2894 800A1C94 8C620018 */  lw         $v0, 0x18($v1)
/* A2898 800A1C98 24C60004 */  addiu      $a2, $a2, 4
/* A289C 800A1C9C 00491021 */  addu       $v0, $v0, $t1
/* A28A0 800A1CA0 1660FFF3 */  bnez       $s3, .L800A1C70
/* A28A4 800A1CA4 AC820004 */   sw        $v0, 4($a0)
.L800A1CA8:
/* A28A8 800A1CA8 2D020008 */  sltiu      $v0, $t0, 8
/* A28AC 800A1CAC 10400030 */  beqz       $v0, .L800A1D70
/* A28B0 800A1CB0 3C02800E */   lui       $v0, %hi(D_800E30E0)
/* A28B4 800A1CB4 244230E0 */  addiu      $v0, $v0, %lo(D_800E30E0)
/* A28B8 800A1CB8 00081880 */  sll        $v1, $t0, 2
/* A28BC 800A1CBC 00621821 */  addu       $v1, $v1, $v0
/* A28C0 800A1CC0 8C640000 */  lw         $a0, ($v1)
/* A28C4 800A1CC4 00800008 */  jr         $a0
/* A28C8 800A1CC8 00000000 */   nop
/* A28CC 800A1CCC 02801021 */  addu       $v0, $s4, $zero
/* A28D0 800A1CD0 26940008 */  addiu      $s4, $s4, 8
/* A28D4 800A1CD4 3C03DB02 */  lui        $v1, 0xdb02
/* A28D8 800A1CD8 0802875A */  j          .L800A1D68
/* A28DC 800A1CDC 24040018 */   addiu     $a0, $zero, 0x18
/* A28E0 800A1CE0 02801021 */  addu       $v0, $s4, $zero
/* A28E4 800A1CE4 26940008 */  addiu      $s4, $s4, 8
/* A28E8 800A1CE8 3C03DB02 */  lui        $v1, 0xdb02
/* A28EC 800A1CEC 0802875A */  j          .L800A1D68
/* A28F0 800A1CF0 24040018 */   addiu     $a0, $zero, 0x18
/* A28F4 800A1CF4 02801021 */  addu       $v0, $s4, $zero
/* A28F8 800A1CF8 26940008 */  addiu      $s4, $s4, 8
/* A28FC 800A1CFC 3C03DB02 */  lui        $v1, 0xdb02
/* A2900 800A1D00 0802875A */  j          .L800A1D68
/* A2904 800A1D04 24040030 */   addiu     $a0, $zero, 0x30
/* A2908 800A1D08 02801021 */  addu       $v0, $s4, $zero
/* A290C 800A1D0C 26940008 */  addiu      $s4, $s4, 8
/* A2910 800A1D10 3C03DB02 */  lui        $v1, 0xdb02
/* A2914 800A1D14 0802875A */  j          .L800A1D68
/* A2918 800A1D18 24040048 */   addiu     $a0, $zero, 0x48
/* A291C 800A1D1C 02801021 */  addu       $v0, $s4, $zero
/* A2920 800A1D20 26940008 */  addiu      $s4, $s4, 8
/* A2924 800A1D24 3C03DB02 */  lui        $v1, 0xdb02
/* A2928 800A1D28 0802875A */  j          .L800A1D68
/* A292C 800A1D2C 24040060 */   addiu     $a0, $zero, 0x60
/* A2930 800A1D30 02801021 */  addu       $v0, $s4, $zero
/* A2934 800A1D34 26940008 */  addiu      $s4, $s4, 8
/* A2938 800A1D38 3C03DB02 */  lui        $v1, 0xdb02
/* A293C 800A1D3C 0802875A */  j          .L800A1D68
/* A2940 800A1D40 24040078 */   addiu     $a0, $zero, 0x78
/* A2944 800A1D44 02801021 */  addu       $v0, $s4, $zero
/* A2948 800A1D48 26940008 */  addiu      $s4, $s4, 8
/* A294C 800A1D4C 3C03DB02 */  lui        $v1, 0xdb02
/* A2950 800A1D50 0802875A */  j          .L800A1D68
/* A2954 800A1D54 24040090 */   addiu     $a0, $zero, 0x90
/* A2958 800A1D58 02801021 */  addu       $v0, $s4, $zero
/* A295C 800A1D5C 26940008 */  addiu      $s4, $s4, 8
/* A2960 800A1D60 3C03DB02 */  lui        $v1, 0xdb02
/* A2964 800A1D64 240400A8 */  addiu      $a0, $zero, 0xa8
.L800A1D68:
/* A2968 800A1D68 AC430000 */  sw         $v1, ($v0)
/* A296C 800A1D6C AC440004 */  sw         $a0, 4($v0)
.L800A1D70:
/* A2970 800A1D70 01809821 */  addu       $s3, $t4, $zero
/* A2974 800A1D74 2A620008 */  slti       $v0, $s3, 8
/* A2978 800A1D78 1040000A */  beqz       $v0, .L800A1DA4
/* A297C 800A1D7C 3C03800F */   lui       $v1, %hi(D_800F55F0)
/* A2980 800A1D80 246355F0 */  addiu      $v1, $v1, %lo(D_800F55F0)
/* A2984 800A1D84 00131080 */  sll        $v0, $s3, 2
/* A2988 800A1D88 2442001C */  addiu      $v0, $v0, 0x1c
/* A298C 800A1D8C 00431821 */  addu       $v1, $v0, $v1
.L800A1D90:
/* A2990 800A1D90 AC600000 */  sw         $zero, ($v1)
/* A2994 800A1D94 26730001 */  addiu      $s3, $s3, 1
/* A2998 800A1D98 2A620008 */  slti       $v0, $s3, 8
/* A299C 800A1D9C 1440FFFC */  bnez       $v0, .L800A1D90
/* A29A0 800A1DA0 24630004 */   addiu     $v1, $v1, 4
.L800A1DA4:
/* A29A4 800A1DA4 0C028398 */  jal        func_800A0E60
/* A29A8 800A1DA8 02802021 */   addu      $a0, $s4, $zero
/* A29AC 800A1DAC 3C07800F */  lui        $a3, %hi(D_800F55F0)
/* A29B0 800A1DB0 24E355F0 */  addiu      $v1, $a3, %lo(D_800F55F0)
/* A29B4 800A1DB4 8C640004 */  lw         $a0, 4($v1)
/* A29B8 800A1DB8 0040A021 */  addu       $s4, $v0, $zero
/* A29BC 800A1DBC 8C930014 */  lw         $s3, 0x14($a0)
/* A29C0 800A1DC0 1260018A */  beqz       $s3, .L800A23EC
/* A29C4 800A1DC4 8C950038 */   lw        $s5, 0x38($a0)
.L800A1DC8:
/* A29C8 800A1DC8 2668FFFF */  addiu      $t0, $s3, -1
/* A29CC 800A1DCC AFA801F4 */  sw         $t0, 0x1f4($sp)
/* A29D0 800A1DD0 96A20000 */  lhu        $v0, ($s5)
/* A29D4 800A1DD4 00021C00 */  sll        $v1, $v0, 0x10
/* A29D8 800A1DD8 00031E03 */  sra        $v1, $v1, 0x18
/* A29DC 800A1DDC 305100FF */  andi       $s1, $v0, 0xff
/* A29E0 800A1DE0 2463FFFF */  addiu      $v1, $v1, -1
/* A29E4 800A1DE4 2C620005 */  sltiu      $v0, $v1, 5
/* A29E8 800A1DE8 1040017D */  beqz       $v0, .L800A23E0
/* A29EC 800A1DEC 26BE0002 */   addiu     $fp, $s5, 2
/* A29F0 800A1DF0 3C02800E */  lui        $v0, %hi(D_800E3100)
/* A29F4 800A1DF4 24423100 */  addiu      $v0, $v0, %lo(D_800E3100)
/* A29F8 800A1DF8 00031880 */  sll        $v1, $v1, 2
/* A29FC 800A1DFC 00621821 */  addu       $v1, $v1, $v0
/* A2A00 800A1E00 8C640000 */  lw         $a0, ($v1)
/* A2A04 800A1E04 00800008 */  jr         $a0
/* A2A08 800A1E08 00000000 */   nop
/* A2A0C 800A1E0C 3C04800E */  lui        $a0, %hi(D_800E3034)
/* A2A10 800A1E10 24843034 */  addiu      $a0, $a0, %lo(D_800E3034)
/* A2A14 800A1E14 3C05800E */  lui        $a1, %hi(D_800E304C)
/* A2A18 800A1E18 0C025F2D */  jal        manualCrash
/* A2A1C 800A1E1C 24A5304C */   addiu     $a1, $a1, %lo(D_800E304C)
/* A2A20 800A1E20 240200FF */  addiu      $v0, $zero, 0xff
/* A2A24 800A1E24 1622000D */  bne        $s1, $v0, .L800A1E5C
/* A2A28 800A1E28 02802021 */   addu      $a0, $s4, $zero
/* A2A2C 800A1E2C 02801021 */  addu       $v0, $s4, $zero
/* A2A30 800A1E30 26940008 */  addiu      $s4, $s4, 8
/* A2A34 800A1E34 2673FFFF */  addiu      $s3, $s3, -1
/* A2A38 800A1E38 26BE0002 */  addiu      $fp, $s5, 2
/* A2A3C 800A1E3C 3C04800F */  lui        $a0, %hi(D_800F55F0)
/* A2A40 800A1E40 248355F0 */  addiu      $v1, $a0, %lo(D_800F55F0)
/* A2A44 800A1E44 3C04D700 */  lui        $a0, 0xd700
/* A2A48 800A1E48 AFB301F4 */  sw         $s3, 0x1f4($sp)
/* A2A4C 800A1E4C AC600010 */  sw         $zero, 0x10($v1)
/* A2A50 800A1E50 AC440000 */  sw         $a0, ($v0)
/* A2A54 800A1E54 080288F8 */  j          .L800A23E0
/* A2A58 800A1E58 AC400004 */   sw        $zero, 4($v0)
.L800A1E5C:
/* A2A5C 800A1E5C 3C05800F */  lui        $a1, %hi(D_800F55F0)
/* A2A60 800A1E60 24A755F0 */  addiu      $a3, $a1, %lo(D_800F55F0)
/* A2A64 800A1E64 2673FFFF */  addiu      $s3, $s3, -1
/* A2A68 800A1E68 8CE30004 */  lw         $v1, 4($a3)
/* A2A6C 800A1E6C 00111080 */  sll        $v0, $s1, 2
/* A2A70 800A1E70 AFB301F4 */  sw         $s3, 0x1f4($sp)
/* A2A74 800A1E74 8C650030 */  lw         $a1, 0x30($v1)
/* A2A78 800A1E78 26BE0002 */  addiu      $fp, $s5, 2
/* A2A7C 800A1E7C 00451021 */  addu       $v0, $v0, $a1
/* A2A80 800A1E80 8C430000 */  lw         $v1, ($v0)
/* A2A84 800A1E84 8FA601F0 */  lw         $a2, 0x1f0($sp)
/* A2A88 800A1E88 00602821 */  addu       $a1, $v1, $zero
/* A2A8C 800A1E8C 0C0274F7 */  jal        func_8009D3DC
/* A2A90 800A1E90 ACE30010 */   sw        $v1, 0x10($a3)
/* A2A94 800A1E94 080288F8 */  j          .L800A23E0
/* A2A98 800A1E98 0040A021 */   addu      $s4, $v0, $zero
/* A2A9C 800A1E9C 3C06800F */  lui        $a2, %hi(D_800F55F0)
/* A2AA0 800A1EA0 24C555F0 */  addiu      $a1, $a2, %lo(D_800F55F0)
/* A2AA4 800A1EA4 2673FFFF */  addiu      $s3, $s3, -1
/* A2AA8 800A1EA8 8CA30004 */  lw         $v1, 4($a1)
/* A2AAC 800A1EAC 00111180 */  sll        $v0, $s1, 6
/* A2AB0 800A1EB0 AFB301F4 */  sw         $s3, 0x1f4($sp)
/* A2AB4 800A1EB4 8C640018 */  lw         $a0, 0x18($v1)
/* A2AB8 800A1EB8 26BE0002 */  addiu      $fp, $s5, 2
/* A2ABC 800A1EBC 00829821 */  addu       $s3, $a0, $v0
/* A2AC0 800A1EC0 96630000 */  lhu        $v1, ($s3)
/* A2AC4 800A1EC4 26970008 */  addiu      $s7, $s4, 8
/* A2AC8 800A1EC8 ACB30008 */  sw         $s3, 8($a1)
/* A2ACC 800A1ECC 8FA701F0 */  lw         $a3, 0x1f0($sp)
/* A2AD0 800A1ED0 30620002 */  andi       $v0, $v1, 2
/* A2AD4 800A1ED4 14400085 */  bnez       $v0, .L800A20EC
/* A2AD8 800A1ED8 0007B180 */   sll       $s6, $a3, 6
/* A2ADC 800A1EDC 8E75000C */  lw         $s5, 0xc($s3)
/* A2AE0 800A1EE0 30620200 */  andi       $v0, $v1, 0x200
/* A2AE4 800A1EE4 1040003B */  beqz       $v0, .L800A1FD4
/* A2AE8 800A1EE8 26B20080 */   addiu     $s2, $s5, 0x80
/* A2AEC 800A1EEC 26B000C0 */  addiu      $s0, $s5, 0xc0
/* A2AF0 800A1EF0 3C02800F */  lui        $v0, %hi(D_800F3378)
/* A2AF4 800A1EF4 C6000030 */  lwc1       $f0, 0x30($s0)
/* A2AF8 800A1EF8 C4423378 */  lwc1       $f2, %lo(D_800F3378)($v0)
/* A2AFC 800A1EFC 46020001 */  sub.s      $f0, $f0, $f2
/* A2B00 800A1F00 24423378 */  addiu      $v0, $v0, 0x3378
/* A2B04 800A1F04 E7A000B0 */  swc1       $f0, 0xb0($sp)
/* A2B08 800A1F08 C6000034 */  lwc1       $f0, 0x34($s0)
/* A2B0C 800A1F0C C4420004 */  lwc1       $f2, 4($v0)
/* A2B10 800A1F10 46020001 */  sub.s      $f0, $f0, $f2
/* A2B14 800A1F14 E7A000B4 */  swc1       $f0, 0xb4($sp)
/* A2B18 800A1F18 C6020038 */  lwc1       $f2, 0x38($s0)
/* A2B1C 800A1F1C C4400008 */  lwc1       $f0, 8($v0)
/* A2B20 800A1F20 46001081 */  sub.s      $f2, $f2, $f0
/* A2B24 800A1F24 27A400B0 */  addiu      $a0, $sp, 0xb0
/* A2B28 800A1F28 0C02ABBB */  jal        vec3_normalize
/* A2B2C 800A1F2C E7A200B8 */   swc1      $f2, 0xb8($sp)
/* A2B30 800A1F30 8FA600B0 */  lw         $a2, 0xb0($sp)
/* A2B34 800A1F34 8FA700B4 */  lw         $a3, 0xb4($sp)
/* A2B38 800A1F38 C7A000B8 */  lwc1       $f0, 0xb8($sp)
/* A2B3C 800A1F3C 27B100F0 */  addiu      $s1, $sp, 0xf0
/* A2B40 800A1F40 E7A00010 */  swc1       $f0, 0x10($sp)
/* A2B44 800A1F44 8E650018 */  lw         $a1, 0x18($s3)
/* A2B48 800A1F48 0C02F8C4 */  jal        guAlignF
/* A2B4C 800A1F4C 02202021 */   addu      $a0, $s1, $zero
/* A2B50 800A1F50 02402021 */  addu       $a0, $s2, $zero
/* A2B54 800A1F54 00002821 */  addu       $a1, $zero, $zero
/* A2B58 800A1F58 0C026380 */  jal        Calloc
/* A2B5C 800A1F5C 24060040 */   addiu     $a2, $zero, 0x40
/* A2B60 800A1F60 3C08800F */  lui        $t0, %hi(D_800F55F0)
/* A2B64 800A1F64 8D0355F0 */  lw         $v1, %lo(D_800F55F0)($t0)
/* A2B68 800A1F68 C6600028 */  lwc1       $f0, 0x28($s3)
/* A2B6C 800A1F6C C46201C8 */  lwc1       $f2, 0x1c8($v1)
/* A2B70 800A1F70 46020002 */  mul.s      $f0, $f0, $f2
/* A2B74 800A1F74 E6A00080 */  swc1       $f0, 0x80($s5)
/* A2B78 800A1F78 C662002C */  lwc1       $f2, 0x2c($s3)
/* A2B7C 800A1F7C C46001CC */  lwc1       $f0, 0x1cc($v1)
/* A2B80 800A1F80 46001082 */  mul.s      $f2, $f2, $f0
/* A2B84 800A1F84 E6420014 */  swc1       $f2, 0x14($s2)
/* A2B88 800A1F88 C6600030 */  lwc1       $f0, 0x30($s3)
/* A2B8C 800A1F8C C46201D0 */  lwc1       $f2, 0x1d0($v1)
/* A2B90 800A1F90 46020002 */  mul.s      $f0, $f0, $f2
/* A2B94 800A1F94 E6400028 */  swc1       $f0, 0x28($s2)
/* A2B98 800A1F98 C6020030 */  lwc1       $f2, 0x30($s0)
/* A2B9C 800A1F9C 02202021 */  addu       $a0, $s1, $zero
/* A2BA0 800A1FA0 E6420030 */  swc1       $f2, 0x30($s2)
/* A2BA4 800A1FA4 C6000034 */  lwc1       $f0, 0x34($s0)
/* A2BA8 800A1FA8 02402821 */  addu       $a1, $s2, $zero
/* A2BAC 800A1FAC E6400034 */  swc1       $f0, 0x34($s2)
/* A2BB0 800A1FB0 C6020038 */  lwc1       $f2, 0x38($s0)
/* A2BB4 800A1FB4 3C01800E */  lui        $at, %hi(D_800E3114)
/* A2BB8 800A1FB8 C4203114 */  lwc1       $f0, %lo(D_800E3114)($at)
/* A2BBC 800A1FBC 02403021 */  addu       $a2, $s2, $zero
/* A2BC0 800A1FC0 E640003C */  swc1       $f0, 0x3c($s2)
/* A2BC4 800A1FC4 0C031128 */  jal        guMtxCatF
/* A2BC8 800A1FC8 E6420038 */   swc1      $f2, 0x38($s2)
/* A2BCC 800A1FCC 08028804 */  j          .L800A2010
/* A2BD0 800A1FD0 C6480030 */   lwc1      $f8, 0x30($s2)
.L800A1FD4:
/* A2BD4 800A1FD4 02401821 */  addu       $v1, $s2, $zero
/* A2BD8 800A1FD8 26A200C0 */  addiu      $v0, $s5, 0xc0
/* A2BDC 800A1FDC 26B00100 */  addiu      $s0, $s5, 0x100
.L800A1FE0:
/* A2BE0 800A1FE0 8C440000 */  lw         $a0, ($v0)
/* A2BE4 800A1FE4 8C450004 */  lw         $a1, 4($v0)
/* A2BE8 800A1FE8 8C460008 */  lw         $a2, 8($v0)
/* A2BEC 800A1FEC 8C47000C */  lw         $a3, 0xc($v0)
/* A2BF0 800A1FF0 AC640000 */  sw         $a0, ($v1)
/* A2BF4 800A1FF4 AC650004 */  sw         $a1, 4($v1)
/* A2BF8 800A1FF8 AC660008 */  sw         $a2, 8($v1)
/* A2BFC 800A1FFC AC67000C */  sw         $a3, 0xc($v1)
/* A2C00 800A2000 24420010 */  addiu      $v0, $v0, 0x10
/* A2C04 800A2004 1450FFF6 */  bne        $v0, $s0, .L800A1FE0
/* A2C08 800A2008 24630010 */   addiu     $v1, $v1, 0x10
/* A2C0C 800A200C C6480030 */  lwc1       $f8, 0x30($s2)
.L800A2010:
/* A2C10 800A2010 3C01800E */  lui        $at, %hi(D_800E3118)
/* A2C14 800A2014 C4203118 */  lwc1       $f0, %lo(D_800E3118)($at)
/* A2C18 800A2018 46004202 */  mul.s      $f8, $f8, $f0
/* A2C1C 800A201C C6440034 */  lwc1       $f4, 0x34($s2)
/* A2C20 800A2020 46002102 */  mul.s      $f4, $f4, $f0
/* A2C24 800A2024 3C08800F */  lui        $t0, %hi(D_800F55F0)
/* A2C28 800A2028 251055F0 */  addiu      $s0, $t0, %lo(D_800F55F0)
/* A2C2C 800A202C C6420038 */  lwc1       $f2, 0x38($s2)
/* A2C30 800A2030 8E04000C */  lw         $a0, 0xc($s0)
/* A2C34 800A2034 46001082 */  mul.s      $f2, $f2, $f0
/* A2C38 800A2038 8C820058 */  lw         $v0, 0x58($a0)
/* A2C3C 800A203C C6560000 */  lwc1       $f22, ($s2)
/* A2C40 800A2040 C4460008 */  lwc1       $f6, 8($v0)
/* A2C44 800A2044 4606B582 */  mul.s      $f22, $f22, $f6
/* A2C48 800A2048 C6540010 */  lwc1       $f20, 0x10($s2)
/* A2C4C 800A204C 4606A502 */  mul.s      $f20, $f20, $f6
/* A2C50 800A2050 C6520020 */  lwc1       $f18, 0x20($s2)
/* A2C54 800A2054 46069482 */  mul.s      $f18, $f18, $f6
/* A2C58 800A2058 C64E0004 */  lwc1       $f14, 4($s2)
/* A2C5C 800A205C 46067382 */  mul.s      $f14, $f14, $f6
/* A2C60 800A2060 C6500014 */  lwc1       $f16, 0x14($s2)
/* A2C64 800A2064 46068402 */  mul.s      $f16, $f16, $f6
/* A2C68 800A2068 C64C0024 */  lwc1       $f12, 0x24($s2)
/* A2C6C 800A206C 46066302 */  mul.s      $f12, $f12, $f6
/* A2C70 800A2070 C64A0008 */  lwc1       $f10, 8($s2)
/* A2C74 800A2074 46065282 */  mul.s      $f10, $f10, $f6
/* A2C78 800A2078 02402821 */  addu       $a1, $s2, $zero
/* A2C7C 800A207C C6400018 */  lwc1       $f0, 0x18($s2)
/* A2C80 800A2080 24060040 */  addiu      $a2, $zero, 0x40
/* A2C84 800A2084 46060002 */  mul.s      $f0, $f0, $f6
/* A2C88 800A2088 E6420038 */  swc1       $f2, 0x38($s2)
/* A2C8C 800A208C C6420028 */  lwc1       $f2, 0x28($s2)
/* A2C90 800A2090 24840010 */  addiu      $a0, $a0, 0x10
/* A2C94 800A2094 E6480030 */  swc1       $f8, 0x30($s2)
/* A2C98 800A2098 E6440034 */  swc1       $f4, 0x34($s2)
/* A2C9C 800A209C 46061082 */  mul.s      $f2, $f2, $f6
/* A2CA0 800A20A0 E6560000 */  swc1       $f22, ($s2)
/* A2CA4 800A20A4 E6540010 */  swc1       $f20, 0x10($s2)
/* A2CA8 800A20A8 E6520020 */  swc1       $f18, 0x20($s2)
/* A2CAC 800A20AC E64E0004 */  swc1       $f14, 4($s2)
/* A2CB0 800A20B0 E6500014 */  swc1       $f16, 0x14($s2)
/* A2CB4 800A20B4 E64C0024 */  swc1       $f12, 0x24($s2)
/* A2CB8 800A20B8 E64A0008 */  swc1       $f10, 8($s2)
/* A2CBC 800A20BC E6400018 */  swc1       $f0, 0x18($s2)
/* A2CC0 800A20C0 0C033547 */  jal        memcpy
/* A2CC4 800A20C4 E6420028 */   swc1      $f2, 0x28($s2)
/* A2CC8 800A20C8 8E030008 */  lw         $v1, 8($s0)
/* A2CCC 800A20CC 8C65000C */  lw         $a1, 0xc($v1)
/* A2CD0 800A20D0 02402021 */  addu       $a0, $s2, $zero
/* A2CD4 800A20D4 0C03118C */  jal        guMtxF2L
/* A2CD8 800A20D8 00B62821 */   addu      $a1, $a1, $s6
/* A2CDC 800A20DC 8E030008 */  lw         $v1, 8($s0)
/* A2CE0 800A20E0 94620000 */  lhu        $v0, ($v1)
/* A2CE4 800A20E4 34420002 */  ori        $v0, $v0, 2
/* A2CE8 800A20E8 A4620000 */  sh         $v0, ($v1)
.L800A20EC:
/* A2CEC 800A20EC 3C02DA38 */  lui        $v0, 0xda38
/* A2CF0 800A20F0 34420003 */  ori        $v0, $v0, 3
/* A2CF4 800A20F4 02802821 */  addu       $a1, $s4, $zero
/* A2CF8 800A20F8 ACA20000 */  sw         $v0, ($a1)
/* A2CFC 800A20FC 3C02800F */  lui        $v0, %hi(D_800F55F0)
/* A2D00 800A2100 244355F0 */  addiu      $v1, $v0, %lo(D_800F55F0)
/* A2D04 800A2104 8C620008 */  lw         $v0, 8($v1)
/* A2D08 800A2108 8C44000C */  lw         $a0, 0xc($v0)
/* A2D0C 800A210C 02E0A021 */  addu       $s4, $s7, $zero
/* A2D10 800A2110 00962021 */  addu       $a0, $a0, $s6
/* A2D14 800A2114 080288F8 */  j          .L800A23E0
/* A2D18 800A2118 ACA40004 */   sw        $a0, 4($a1)
/* A2D1C 800A211C 3C03800F */  lui        $v1, %hi(D_800F55F0)
/* A2D20 800A2120 247055F0 */  addiu      $s0, $v1, %lo(D_800F55F0)
/* A2D24 800A2124 3C05DB06 */  lui        $a1, 0xdb06
/* A2D28 800A2128 8E030004 */  lw         $v1, 4($s0)
/* A2D2C 800A212C 00111080 */  sll        $v0, $s1, 2
/* A2D30 800A2130 8C64002C */  lw         $a0, 0x2c($v1)
/* A2D34 800A2134 34A50028 */  ori        $a1, $a1, 0x28
/* A2D38 800A2138 00441021 */  addu       $v0, $v0, $a0
/* A2D3C 800A213C 8C430000 */  lw         $v1, ($v0)
/* A2D40 800A2140 02808821 */  addu       $s1, $s4, $zero
/* A2D44 800A2144 AE03000C */  sw         $v1, 0xc($s0)
/* A2D48 800A2148 AE250000 */  sw         $a1, ($s1)
/* A2D4C 800A214C 8E02000C */  lw         $v0, 0xc($s0)
/* A2D50 800A2150 8C430058 */  lw         $v1, 0x58($v0)
/* A2D54 800A2154 8C640034 */  lw         $a0, 0x34($v1)
/* A2D58 800A2158 0C034888 */  jal        osVirtualToPhysical
/* A2D5C 800A215C 26940008 */   addiu     $s4, $s4, 8
/* A2D60 800A2160 3C03DB06 */  lui        $v1, 0xdb06
/* A2D64 800A2164 34630038 */  ori        $v1, $v1, 0x38
/* A2D68 800A2168 02809021 */  addu       $s2, $s4, $zero
/* A2D6C 800A216C AE220004 */  sw         $v0, 4($s1)
/* A2D70 800A2170 AE430000 */  sw         $v1, ($s2)
/* A2D74 800A2174 8E02000C */  lw         $v0, 0xc($s0)
/* A2D78 800A2178 2673FFFF */  addiu      $s3, $s3, -1
/* A2D7C 800A217C AFB301F4 */  sw         $s3, 0x1f4($sp)
/* A2D80 800A2180 8C430058 */  lw         $v1, 0x58($v0)
/* A2D84 800A2184 26BE0002 */  addiu      $fp, $s5, 2
/* A2D88 800A2188 8C640030 */  lw         $a0, 0x30($v1)
/* A2D8C 800A218C 0C034888 */  jal        osVirtualToPhysical
/* A2D90 800A2190 26940008 */   addiu     $s4, $s4, 8
/* A2D94 800A2194 080288F8 */  j          .L800A23E0
/* A2D98 800A2198 AE420004 */   sw        $v0, 4($s2)
/* A2D9C 800A219C 3C04800F */  lui        $a0, %hi(D_800F55F0)
/* A2DA0 800A21A0 249655F0 */  addiu      $s6, $a0, %lo(D_800F55F0)
/* A2DA4 800A21A4 8EC2000C */  lw         $v0, 0xc($s6)
/* A2DA8 800A21A8 8C460058 */  lw         $a2, 0x58($v0)
/* A2DAC 800A21AC 2665FFFF */  addiu      $a1, $s3, -1
/* A2DB0 800A21B0 AFA501F4 */  sw         $a1, 0x1f4($sp)
/* A2DB4 800A21B4 8CC2002C */  lw         $v0, 0x2c($a2)
/* A2DB8 800A21B8 00119080 */  sll        $s2, $s1, 2
/* A2DBC 800A21BC 02421021 */  addu       $v0, $s2, $v0
/* A2DC0 800A21C0 8C570000 */  lw         $s7, ($v0)
/* A2DC4 800A21C4 12E00086 */  beqz       $s7, .L800A23E0
/* A2DC8 800A21C8 26BE0002 */   addiu     $fp, $s5, 2
/* A2DCC 800A21CC 3C02800F */  lui        $v0, %hi(D_800F3398)
/* A2DD0 800A21D0 8EE40000 */  lw         $a0, ($s7)
/* A2DD4 800A21D4 8C433398 */  lw         $v1, %lo(D_800F3398)($v0)
/* A2DD8 800A21D8 14830005 */  bne        $a0, $v1, .L800A21F0
/* A2DDC 800A21DC 24423398 */   addiu     $v0, $v0, 0x3398
/* A2DE0 800A21E0 8EE30004 */  lw         $v1, 4($s7)
/* A2DE4 800A21E4 8C420004 */  lw         $v0, 4($v0)
/* A2DE8 800A21E8 5062007E */  beql       $v1, $v0, .L800A23E4
/* A2DEC 800A21EC 8FB301F4 */   lw        $s3, 0x1f4($sp)
.L800A21F0:
/* A2DF0 800A21F0 2673FFFF */  addiu      $s3, $s3, -1
/* A2DF4 800A21F4 AFB301F4 */  sw         $s3, 0x1f4($sp)
/* A2DF8 800A21F8 8CC20028 */  lw         $v0, 0x28($a2)
/* A2DFC 800A21FC 38420001 */  xori       $v0, $v0, 1
/* A2E00 800A2200 30420001 */  andi       $v0, $v0, 1
/* A2E04 800A2204 10400076 */  beqz       $v0, .L800A23E0
/* A2E08 800A2208 26BE0002 */   addiu     $fp, $s5, 2
/* A2E0C 800A220C 02511021 */  addu       $v0, $s2, $s1
/* A2E10 800A2210 8CC30040 */  lw         $v1, 0x40($a2)
/* A2E14 800A2214 00021080 */  sll        $v0, $v0, 2
/* A2E18 800A2218 00621821 */  addu       $v1, $v1, $v0
/* A2E1C 800A221C 10600070 */  beqz       $v1, .L800A23E0
/* A2E20 800A2220 AEC30014 */   sw        $v1, 0x14($s6)
/* A2E24 800A2224 C4C00000 */  lwc1       $f0, ($a2)
/* A2E28 800A2228 3C01800E */  lui        $at, %hi(D_800E311C)
/* A2E2C 800A222C C434311C */  lwc1       $f20, %lo(D_800E311C)($at)
/* A2E30 800A2230 4614003C */  c.lt.s     $f0, $f20
/* A2E34 800A2234 00000000 */  nop
/* A2E38 800A2238 4502006A */  bc1fl      .L800A23E4
/* A2E3C 800A223C 8FB301F4 */   lw        $s3, 0x1f4($sp)
/* A2E40 800A2240 C4600010 */  lwc1       $f0, 0x10($v1)
/* A2E44 800A2244 4614003C */  c.lt.s     $f0, $f20
/* A2E48 800A2248 00000000 */  nop
/* A2E4C 800A224C 45020065 */  bc1fl      .L800A23E4
/* A2E50 800A2250 8FB301F4 */   lw        $s3, 0x1f4($sp)
/* A2E54 800A2254 8CC60004 */  lw         $a2, 4($a2)
/* A2E58 800A2258 0226102A */  slt        $v0, $s1, $a2
/* A2E5C 800A225C 5440000C */  bnel       $v0, $zero, .L800A2290
/* A2E60 800A2260 8EC4000C */   lw        $a0, 0xc($s6)
/* A2E64 800A2264 27B00130 */  addiu      $s0, $sp, 0x130
/* A2E68 800A2268 02002021 */  addu       $a0, $s0, $zero
/* A2E6C 800A226C 3C05800E */  lui        $a1, %hi(D_800E3084)
/* A2E70 800A2270 24A53084 */  addiu      $a1, $a1, %lo(D_800E3084)
/* A2E74 800A2274 0C0333AC */  jal        sprintf
/* A2E78 800A2278 02203821 */   addu      $a3, $s1, $zero
/* A2E7C 800A227C 3C04800E */  lui        $a0, %hi(D_800E2F6C)
/* A2E80 800A2280 24842F6C */  addiu      $a0, $a0, %lo(D_800E2F6C)
/* A2E84 800A2284 0C025F2D */  jal        manualCrash
/* A2E88 800A2288 02002821 */   addu      $a1, $s0, $zero
/* A2E8C 800A228C 8EC4000C */  lw         $a0, 0xc($s6)
.L800A2290:
/* A2E90 800A2290 8C820054 */  lw         $v0, 0x54($a0)
/* A2E94 800A2294 00511021 */  addu       $v0, $v0, $s1
/* A2E98 800A2298 90430000 */  lbu        $v1, ($v0)
/* A2E9C 800A229C 1060000D */  beqz       $v1, .L800A22D4
/* A2EA0 800A22A0 02808021 */   addu      $s0, $s4, $zero
/* A2EA4 800A22A4 8C820050 */  lw         $v0, 0x50($a0)
/* A2EA8 800A22A8 02421021 */  addu       $v0, $s2, $v0
/* A2EAC 800A22AC 0C0283C6 */  jal        setStaticMode
/* A2EB0 800A22B0 8C440000 */   lw        $a0, ($v0)
/* A2EB4 800A22B4 3C03DF00 */  lui        $v1, %hi(D_DF000054)
/* A2EB8 800A22B8 AC430000 */  sw         $v1, ($v0)
/* A2EBC 800A22BC AC400004 */  sw         $zero, 4($v0)
/* A2EC0 800A22C0 8EC3000C */  lw         $v1, 0xc($s6)
/* A2EC4 800A22C4 8C620054 */  lw         $v0, %lo(D_DF000054)($v1)
/* A2EC8 800A22C8 00511021 */  addu       $v0, $v0, $s1
/* A2ECC 800A22CC A0400000 */  sb         $zero, ($v0)
/* A2ED0 800A22D0 02808021 */  addu       $s0, $s4, $zero
.L800A22D4:
/* A2ED4 800A22D4 3C13DE00 */  lui        $s3, 0xde00
/* A2ED8 800A22D8 AE130000 */  sw         $s3, ($s0)
/* A2EDC 800A22DC 8EC3000C */  lw         $v1, 0xc($s6)
/* A2EE0 800A22E0 8C620050 */  lw         $v0, 0x50($v1)
/* A2EE4 800A22E4 02421021 */  addu       $v0, $s2, $v0
/* A2EE8 800A22E8 8C440000 */  lw         $a0, ($v0)
/* A2EEC 800A22EC 0C034888 */  jal        osVirtualToPhysical
/* A2EF0 800A22F0 26940008 */   addiu     $s4, $s4, 8
/* A2EF4 800A22F4 02802021 */  addu       $a0, $s4, $zero
/* A2EF8 800A22F8 0C028461 */  jal        func_800A1184
/* A2EFC 800A22FC AE020004 */   sw        $v0, 4($s0)
/* A2F00 800A2300 8EC30014 */  lw         $v1, 0x14($s6)
/* A2F04 800A2304 0040A021 */  addu       $s4, $v0, $zero
/* A2F08 800A2308 8C620000 */  lw         $v0, ($v1)
/* A2F0C 800A230C 30420001 */  andi       $v0, $v0, 1
/* A2F10 800A2310 1040002D */  beqz       $v0, .L800A23C8
/* A2F14 800A2314 02808821 */   addu      $s1, $s4, $zero
/* A2F18 800A2318 8EC2000C */  lw         $v0, 0xc($s6)
/* A2F1C 800A231C 8FA60234 */  lw         $a2, 0x234($sp)
/* A2F20 800A2320 8EC30008 */  lw         $v1, 8($s6)
/* A2F24 800A2324 8FA80234 */  lw         $t0, 0x234($sp)
/* A2F28 800A2328 C4C00100 */  lwc1       $f0, 0x100($a2)
/* A2F2C 800A232C 8C450008 */  lw         $a1, 8($v0)
/* A2F30 800A2330 E7A00010 */  swc1       $f0, 0x10($sp)
/* A2F34 800A2334 8C62000C */  lw         $v0, 0xc($v1)
/* A2F38 800A2338 8CC600F8 */  lw         $a2, 0xf8($a2)
/* A2F3C 800A233C C44000F0 */  lwc1       $f0, 0xf0($v0)
/* A2F40 800A2340 E7A00014 */  swc1       $f0, 0x14($sp)
/* A2F44 800A2344 8C62000C */  lw         $v0, 0xc($v1)
/* A2F48 800A2348 8D0700FC */  lw         $a3, 0xfc($t0)
/* A2F4C 800A234C C44000F4 */  lwc1       $f0, 0xf4($v0)
/* A2F50 800A2350 E7A00018 */  swc1       $f0, 0x18($sp)
/* A2F54 800A2354 8C62000C */  lw         $v0, 0xc($v1)
/* A2F58 800A2358 8FA301F0 */  lw         $v1, 0x1f0($sp)
/* A2F5C 800A235C 27A401B0 */  addiu      $a0, $sp, 0x1b0
/* A2F60 800A2360 00038140 */  sll        $s0, $v1, 5
/* A2F64 800A2364 C44000F8 */  lwc1       $f0, 0xf8($v0)
/* A2F68 800A2368 00B02821 */  addu       $a1, $a1, $s0
/* A2F6C 800A236C AFA00020 */  sw         $zero, 0x20($sp)
/* A2F70 800A2370 E7B40024 */  swc1       $f20, 0x24($sp)
/* A2F74 800A2374 AFA00028 */  sw         $zero, 0x28($sp)
/* A2F78 800A2378 0C03100E */  jal        guLookAtReflect
/* A2F7C 800A237C E7A0001C */   swc1      $f0, 0x1c($sp)
/* A2F80 800A2380 26940008 */  addiu      $s4, $s4, 8
/* A2F84 800A2384 3C02DC08 */  lui        $v0, 0xdc08
/* A2F88 800A2388 3442000A */  ori        $v0, $v0, 0xa
/* A2F8C 800A238C 3C04DC08 */  lui        $a0, 0xdc08
/* A2F90 800A2390 AE220000 */  sw         $v0, ($s1)
/* A2F94 800A2394 8EC3000C */  lw         $v1, 0xc($s6)
/* A2F98 800A2398 3484030A */  ori        $a0, $a0, 0x30a
/* A2F9C 800A239C 8C620008 */  lw         $v0, 8($v1)
/* A2FA0 800A23A0 02802821 */  addu       $a1, $s4, $zero
/* A2FA4 800A23A4 00501021 */  addu       $v0, $v0, $s0
/* A2FA8 800A23A8 AE220004 */  sw         $v0, 4($s1)
/* A2FAC 800A23AC ACA40000 */  sw         $a0, ($a1)
/* A2FB0 800A23B0 8EC3000C */  lw         $v1, 0xc($s6)
/* A2FB4 800A23B4 8C620008 */  lw         $v0, 8($v1)
/* A2FB8 800A23B8 26940008 */  addiu      $s4, $s4, 8
/* A2FBC 800A23BC 00501021 */  addu       $v0, $v0, $s0
/* A2FC0 800A23C0 24420010 */  addiu      $v0, $v0, 0x10
/* A2FC4 800A23C4 ACA20004 */  sw         $v0, 4($a1)
.L800A23C8:
/* A2FC8 800A23C8 02808021 */  addu       $s0, $s4, $zero
/* A2FCC 800A23CC 26940008 */  addiu      $s4, $s4, 8
/* A2FD0 800A23D0 02E02021 */  addu       $a0, $s7, $zero
/* A2FD4 800A23D4 0C034888 */  jal        osVirtualToPhysical
/* A2FD8 800A23D8 AE130000 */   sw        $s3, ($s0)
/* A2FDC 800A23DC AE020004 */  sw         $v0, 4($s0)
.L800A23E0:
/* A2FE0 800A23E0 8FB301F4 */  lw         $s3, 0x1f4($sp)
.L800A23E4:
/* A2FE4 800A23E4 1660FE78 */  bnez       $s3, .L800A1DC8
/* A2FE8 800A23E8 03C0A821 */   addu      $s5, $fp, $zero
.L800A23EC:
/* A2FEC 800A23EC 02801021 */  addu       $v0, $s4, $zero
/* A2FF0 800A23F0 8FA40234 */  lw         $a0, 0x234($sp)
/* A2FF4 800A23F4 8FBF021C */  lw         $ra, 0x21c($sp)
/* A2FF8 800A23F8 8FBE0218 */  lw         $fp, 0x218($sp)
/* A2FFC 800A23FC 8FB70214 */  lw         $s7, 0x214($sp)
/* A3000 800A2400 8FB60210 */  lw         $s6, 0x210($sp)
/* A3004 800A2404 8FB5020C */  lw         $s5, 0x20c($sp)
/* A3008 800A2408 8FB40208 */  lw         $s4, 0x208($sp)
/* A300C 800A240C 8FB30204 */  lw         $s3, 0x204($sp)
/* A3010 800A2410 8FB20200 */  lw         $s2, 0x200($sp)
/* A3014 800A2414 8FB101FC */  lw         $s1, 0x1fc($sp)
/* A3018 800A2418 8FB001F8 */  lw         $s0, 0x1f8($sp)
/* A301C 800A241C D7B60228 */  ldc1       $f22, 0x228($sp)
/* A3020 800A2420 D7B40220 */  ldc1       $f20, 0x220($sp)
/* A3024 800A2424 908301FB */  lbu        $v1, 0x1fb($a0)
/* A3028 800A2428 3C05800F */  lui        $a1, %hi(D_800F55F0)
/* A302C 800A242C A08002AC */  sb         $zero, 0x2ac($a0)
/* A3030 800A2430 38630001 */  xori       $v1, $v1, 1
/* A3034 800A2434 A08301FB */  sb         $v1, 0x1fb($a0)
/* A3038 800A2438 24A455F0 */  addiu      $a0, $a1, %lo(D_800F55F0)
/* A303C 800A243C AC800004 */  sw         $zero, 4($a0)
/* A3040 800A2440 03E00008 */  jr         $ra
/* A3044 800A2444 27BD0230 */   addiu     $sp, $sp, 0x230

glabel NOOP_800a2448
/* A3048 800A2448 03E00008 */  jr         $ra
/* A304C 800A244C 00000000 */   nop

glabel ret_A0
/* A3050 800A2450 03E00008 */  jr         $ra
/* A3054 800A2454 00801021 */   addu      $v0, $a0, $zero
/* A3058 800A2458 00000000 */  nop
/* A305C 800A245C 00000000 */  nop
