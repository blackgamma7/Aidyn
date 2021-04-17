.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel check_for_cheats
/* 46DE0 800461E0 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* 46DE4 800461E4 AFB5012C */  sw         $s5, 0x12c($sp)
/* 46DE8 800461E8 0000A821 */  addu       $s5, $zero, $zero
/* 46DEC 800461EC AFB60130 */  sw         $s6, 0x130($sp)
/* 46DF0 800461F0 0080B021 */  addu       $s6, $a0, $zero
/* 46DF4 800461F4 3C04B200 */  lui        $a0, %hi(CheatStrings)
/* 46DF8 800461F8 2484D240 */  addiu      $a0, $a0, %lo(CheatStrings)
/* 46DFC 800461FC 3C05B200 */  lui        $a1, %hi(romstring_credits)
/* 46E00 80046200 24A5D330 */  addiu      $a1, $a1, %lo(romstring_credits)
/* 46E04 80046204 00A42823 */  subu       $a1, $a1, $a0
/* 46E08 80046208 AFBF0138 */  sw         $ra, 0x138($sp)
/* 46E0C 8004620C AFB70134 */  sw         $s7, 0x134($sp)
/* 46E10 80046210 AFB40128 */  sw         $s4, 0x128($sp)
/* 46E14 80046214 AFB30124 */  sw         $s3, 0x124($sp)
/* 46E18 80046218 AFB20120 */  sw         $s2, 0x120($sp)
/* 46E1C 8004621C AFB1011C */  sw         $s1, 0x11c($sp)
/* 46E20 80046220 0C0232A0 */  jal        func_romStrings
/* 46E24 80046224 AFB00118 */   sw        $s0, 0x118($sp)
/* 46E28 80046228 27B10098 */  addiu      $s1, $sp, 0x98
/* 46E2C 8004622C 02202021 */  addu       $a0, $s1, $zero
/* 46E30 80046230 00002821 */  addu       $a1, $zero, $zero
/* 46E34 80046234 24060008 */  addiu      $a2, $zero, 8
/* 46E38 80046238 3C10800F */  lui        $s0, %hi(cheatStrings_pointer)
/* 46E3C 8004623C 0C026380 */  jal        Calloc
/* 46E40 80046240 AE02D610 */   sw        $v0, %lo(cheatStrings_pointer)($s0)
/* 46E44 80046244 27A400A0 */  addiu      $a0, $sp, 0xa0
/* 46E48 80046248 00002821 */  addu       $a1, $zero, $zero
/* 46E4C 8004624C 24060008 */  addiu      $a2, $zero, 8
/* 46E50 80046250 0200B821 */  addu       $s7, $s0, $zero
/* 46E54 80046254 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46E58 80046258 3C028004 */  lui        $v0, %hi(_balloon)
/* 46E5C 8004625C 8C670000 */  lw         $a3, ($v1)
/* 46E60 80046260 24426570 */  addiu      $v0, $v0, %lo(_balloon)
/* 46E64 80046264 AFA2009C */  sw         $v0, 0x9c($sp)
/* 46E68 80046268 0C026380 */  jal        Calloc
/* 46E6C 8004626C AFA70098 */   sw        $a3, 0x98($sp)
/* 46E70 80046270 27A400A8 */  addiu      $a0, $sp, 0xa8
/* 46E74 80046274 00002821 */  addu       $a1, $zero, $zero
/* 46E78 80046278 24060008 */  addiu      $a2, $zero, 8
/* 46E7C 8004627C 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46E80 80046280 3C028004 */  lui        $v0, %hi(_Bigw)
/* 46E84 80046284 8C670004 */  lw         $a3, 4($v1)
/* 46E88 80046288 2442658C */  addiu      $v0, $v0, %lo(_Bigw)
/* 46E8C 8004628C AFA200A4 */  sw         $v0, 0xa4($sp)
/* 46E90 80046290 0C026380 */  jal        Calloc
/* 46E94 80046294 AFA700A0 */   sw        $a3, 0xa0($sp)
/* 46E98 80046298 27A400B0 */  addiu      $a0, $sp, 0xb0
/* 46E9C 8004629C 00002821 */  addu       $a1, $zero, $zero
/* 46EA0 800462A0 24060008 */  addiu      $a2, $zero, 8
/* 46EA4 800462A4 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46EA8 800462A8 3C028004 */  lui        $v0, %hi(_Flea)
/* 46EAC 800462AC 8C670008 */  lw         $a3, 8($v1)
/* 46EB0 800462B0 244265A8 */  addiu      $v0, $v0, %lo(_Flea)
/* 46EB4 800462B4 AFA200AC */  sw         $v0, 0xac($sp)
/* 46EB8 800462B8 0C026380 */  jal        Calloc
/* 46EBC 800462BC AFA700A8 */   sw        $a3, 0xa8($sp)
/* 46EC0 800462C0 27A400B8 */  addiu      $a0, $sp, 0xb8
/* 46EC4 800462C4 00002821 */  addu       $a1, $zero, $zero
/* 46EC8 800462C8 24060008 */  addiu      $a2, $zero, 8
/* 46ECC 800462CC 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46ED0 800462D0 3C028004 */  lui        $v0, %hi(_slashing)
/* 46ED4 800462D4 8C67000C */  lw         $a3, 0xc($v1)
/* 46ED8 800462D8 244265C4 */  addiu      $v0, $v0, %lo(_slashing)
/* 46EDC 800462DC AFA200B4 */  sw         $v0, 0xb4($sp)
/* 46EE0 800462E0 0C026380 */  jal        Calloc
/* 46EE4 800462E4 AFA700B0 */   sw        $a3, 0xb0($sp)
/* 46EE8 800462E8 27A400C0 */  addiu      $a0, $sp, 0xc0
/* 46EEC 800462EC 00002821 */  addu       $a1, $zero, $zero
/* 46EF0 800462F0 24060008 */  addiu      $a2, $zero, 8
/* 46EF4 800462F4 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46EF8 800462F8 3C028004 */  lui        $v0, %hi(_darkside)
/* 46EFC 800462FC 8C670010 */  lw         $a3, 0x10($v1)
/* 46F00 80046300 244265E8 */  addiu      $v0, $v0, %lo(_darkside)
/* 46F04 80046304 AFA200BC */  sw         $v0, 0xbc($sp)
/* 46F08 80046308 0C026380 */  jal        Calloc
/* 46F0C 8004630C AFA700B8 */   sw        $a3, 0xb8($sp)
/* 46F10 80046310 27A400C8 */  addiu      $a0, $sp, 0xc8
/* 46F14 80046314 00002821 */  addu       $a1, $zero, $zero
/* 46F18 80046318 24060008 */  addiu      $a2, $zero, 8
/* 46F1C 8004631C 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46F20 80046320 3C028004 */  lui        $v0, %hi(_crawdaddy)
/* 46F24 80046324 8C670014 */  lw         $a3, 0x14($v1)
/* 46F28 80046328 24426674 */  addiu      $v0, $v0, %lo(_crawdaddy)
/* 46F2C 8004632C AFA200C4 */  sw         $v0, 0xc4($sp)
/* 46F30 80046330 0C026380 */  jal        Calloc
/* 46F34 80046334 AFA700C0 */   sw        $a3, 0xc0($sp)
/* 46F38 80046338 27A400D0 */  addiu      $a0, $sp, 0xd0
/* 46F3C 8004633C 00002821 */  addu       $a1, $zero, $zero
/* 46F40 80046340 24060008 */  addiu      $a2, $zero, 8
/* 46F44 80046344 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46F48 80046348 3C028004 */  lui        $v0, %hi(_fatboy)
/* 46F4C 8004634C 8C670018 */  lw         $a3, 0x18($v1)
/* 46F50 80046350 24426690 */  addiu      $v0, $v0, %lo(_fatboy)
/* 46F54 80046354 AFA200CC */  sw         $v0, 0xcc($sp)
/* 46F58 80046358 0C026380 */  jal        Calloc
/* 46F5C 8004635C AFA700C8 */   sw        $a3, 0xc8($sp)
/* 46F60 80046360 27A400D8 */  addiu      $a0, $sp, 0xd8
/* 46F64 80046364 00002821 */  addu       $a1, $zero, $zero
/* 46F68 80046368 24060008 */  addiu      $a2, $zero, 8
/* 46F6C 8004636C 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46F70 80046370 3C028004 */  lui        $v0, %hi(_tweety)
/* 46F74 80046374 8C67001C */  lw         $a3, 0x1c($v1)
/* 46F78 80046378 244266AC */  addiu      $v0, $v0, %lo(_tweety)
/* 46F7C 8004637C AFA200D4 */  sw         $v0, 0xd4($sp)
/* 46F80 80046380 0C026380 */  jal        Calloc
/* 46F84 80046384 AFA700D0 */   sw        $a3, 0xd0($sp)
/* 46F88 80046388 27A400E0 */  addiu      $a0, $sp, 0xe0
/* 46F8C 8004638C 00002821 */  addu       $a1, $zero, $zero
/* 46F90 80046390 24060008 */  addiu      $a2, $zero, 8
/* 46F94 80046394 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46F98 80046398 3C028004 */  lui        $v0, %hi(_Cheater)
/* 46F9C 8004639C 8C670020 */  lw         $a3, 0x20($v1)
/* 46FA0 800463A0 244266C8 */  addiu      $v0, $v0, %lo(_Cheater)
/* 46FA4 800463A4 AFA200DC */  sw         $v0, 0xdc($sp)
/* 46FA8 800463A8 0C026380 */  jal        Calloc
/* 46FAC 800463AC AFA700D8 */   sw        $a3, 0xd8($sp)
/* 46FB0 800463B0 27A400E8 */  addiu      $a0, $sp, 0xe8
/* 46FB4 800463B4 00002821 */  addu       $a1, $zero, $zero
/* 46FB8 800463B8 24060008 */  addiu      $a2, $zero, 8
/* 46FBC 800463BC 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46FC0 800463C0 3C028004 */  lui        $v0, %hi(_bingo)
/* 46FC4 800463C4 8C670024 */  lw         $a3, 0x24($v1)
/* 46FC8 800463C8 24426834 */  addiu      $v0, $v0, %lo(_bingo)
/* 46FCC 800463CC AFA200E4 */  sw         $v0, 0xe4($sp)
/* 46FD0 800463D0 0C026380 */  jal        Calloc
/* 46FD4 800463D4 AFA700E0 */   sw        $a3, 0xe0($sp)
/* 46FD8 800463D8 27A400F0 */  addiu      $a0, $sp, 0xf0
/* 46FDC 800463DC 00002821 */  addu       $a1, $zero, $zero
/* 46FE0 800463E0 24060008 */  addiu      $a2, $zero, 8
/* 46FE4 800463E4 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 46FE8 800463E8 3C028004 */  lui        $v0, %hi(imadoofus)
/* 46FEC 800463EC 8C670028 */  lw         $a3, 0x28($v1)
/* 46FF0 800463F0 244268B0 */  addiu      $v0, $v0, %lo(imadoofus)
/* 46FF4 800463F4 AFA200EC */  sw         $v0, 0xec($sp)
/* 46FF8 800463F8 0C026380 */  jal        Calloc
/* 46FFC 800463FC AFA700E8 */   sw        $a3, 0xe8($sp)
/* 47000 80046400 27A400F8 */  addiu      $a0, $sp, 0xf8
/* 47004 80046404 00002821 */  addu       $a1, $zero, $zero
/* 47008 80046408 24060008 */  addiu      $a2, $zero, 8
/* 4700C 8004640C 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 47010 80046410 3C028004 */  lui        $v0, %hi(keepbusy)
/* 47014 80046414 8C670030 */  lw         $a3, 0x30($v1)
/* 47018 80046418 24426914 */  addiu      $v0, $v0, %lo(keepbusy)
/* 4701C 8004641C AFA200F4 */  sw         $v0, 0xf4($sp)
/* 47020 80046420 0C026380 */  jal        Calloc
/* 47024 80046424 AFA700F0 */   sw        $a3, 0xf0($sp)
/* 47028 80046428 27A40100 */  addiu      $a0, $sp, 0x100
/* 4702C 8004642C 00002821 */  addu       $a1, $zero, $zero
/* 47030 80046430 24060008 */  addiu      $a2, $zero, 8
/* 47034 80046434 8E03D610 */  lw         $v1, -0x29f0($s0)
/* 47038 80046438 3C028004 */  lui        $v0, %hi(_version)
/* 4703C 8004643C 8C670040 */  lw         $a3, 0x40($v1)
/* 47040 80046440 24426978 */  addiu      $v0, $v0, %lo(_version)
/* 47044 80046444 AFA200FC */  sw         $v0, 0xfc($sp)
/* 47048 80046448 0C026380 */  jal        Calloc
/* 4704C 8004644C AFA700F8 */   sw        $a3, 0xf8($sp)
/* 47050 80046450 27A20018 */  addiu      $v0, $sp, 0x18
/* 47054 80046454 27A40108 */  addiu      $a0, $sp, 0x108
/* 47058 80046458 00401821 */  addu       $v1, $v0, $zero
.L8004645C:
/* 4705C 8004645C 8E250000 */  lw         $a1, ($s1)
/* 47060 80046460 8E260004 */  lw         $a2, 4($s1)
/* 47064 80046464 8E270008 */  lw         $a3, 8($s1)
/* 47068 80046468 8E28000C */  lw         $t0, 0xc($s1)
/* 4706C 8004646C AC450000 */  sw         $a1, ($v0)
/* 47070 80046470 AC460004 */  sw         $a2, 4($v0)
/* 47074 80046474 AC470008 */  sw         $a3, 8($v0)
/* 47078 80046478 AC48000C */  sw         $t0, 0xc($v0)
/* 4707C 8004647C 26310010 */  addiu      $s1, $s1, 0x10
/* 47080 80046480 1624FFF6 */  bne        $s1, $a0, .L8004645C
/* 47084 80046484 24420010 */   addiu     $v0, $v0, 0x10
/* 47088 80046488 8FA20018 */  lw         $v0, 0x18($sp)
/* 4708C 8004648C 1040002A */  beqz       $v0, .L80046538
/* 47090 80046490 00008021 */   addu      $s0, $zero, $zero
/* 47094 80046494 3C14800E */  lui        $s4, 0x800e
/* 47098 80046498 241300B4 */  addiu      $s3, $zero, 0xb4
/* 4709C 8004649C 00609021 */  addu       $s2, $v1, $zero
/* 470A0 800464A0 001010C0 */  sll        $v0, $s0, 3
.L800464A4:
/* 470A4 800464A4 02428821 */  addu       $s1, $s2, $v0
/* 470A8 800464A8 8E240000 */  lw         $a0, ($s1)
/* 470AC 800464AC 0C0262BE */  jal        func_80098AF8
/* 470B0 800464B0 02C02821 */   addu      $a1, $s6, $zero
/* 470B4 800464B4 1440001A */  bnez       $v0, .L80046520
/* 470B8 800464B8 26020001 */   addiu     $v0, $s0, 1
/* 470BC 800464BC 269068A8 */  addiu      $s0, $s4, 0x68a8
/* 470C0 800464C0 8E0214CC */  lw         $v0, 0x14cc($s0)
/* 470C4 800464C4 1040001C */  beqz       $v0, .L80046538
/* 470C8 800464C8 24150001 */   addiu     $s5, $zero, 1
/* 470CC 800464CC 8E220004 */  lw         $v0, 4($s1)
/* 470D0 800464D0 0040F809 */  jalr       $v0
/* 470D4 800464D4 00000000 */   nop
/* 470D8 800464D8 10400009 */  beqz       $v0, .L80046500
/* 470DC 800464DC 260412F8 */   addiu     $a0, $s0, 0x12f8
/* 470E0 800464E0 24050718 */  addiu      $a1, $zero, 0x718
/* 470E4 800464E4 3C073F80 */  lui        $a3, 0x3f80
/* 470E8 800464E8 00003021 */  addu       $a2, $zero, $zero
/* 470EC 800464EC AFB30010 */  sw         $s3, 0x10($sp)
/* 470F0 800464F0 0C0156F4 */  jal        play_SFX
/* 470F4 800464F4 AFA00014 */   sw        $zero, 0x14($sp)
/* 470F8 800464F8 0801194E */  j          .L80046538
/* 470FC 800464FC 24150001 */   addiu     $s5, $zero, 1
.L80046500:
/* 47100 80046500 24050721 */  addiu      $a1, $zero, 0x721
/* 47104 80046504 3C073F80 */  lui        $a3, 0x3f80
/* 47108 80046508 00003021 */  addu       $a2, $zero, $zero
/* 4710C 8004650C AFB30010 */  sw         $s3, 0x10($sp)
/* 47110 80046510 0C0156F4 */  jal        play_SFX
/* 47114 80046514 AFA00014 */   sw        $zero, 0x14($sp)
/* 47118 80046518 0801194E */  j          .L80046538
/* 4711C 8004651C 24150001 */   addiu     $s5, $zero, 1
.L80046520:
/* 47120 80046520 3050FFFF */  andi       $s0, $v0, 0xffff
/* 47124 80046524 001018C0 */  sll        $v1, $s0, 3
/* 47128 80046528 02431821 */  addu       $v1, $s2, $v1
/* 4712C 8004652C 8C620000 */  lw         $v0, ($v1)
/* 47130 80046530 1440FFDC */  bnez       $v0, .L800464A4
/* 47134 80046534 001010C0 */   sll       $v0, $s0, 3
.L80046538:
/* 47138 80046538 0C0232F9 */  jal        free_romstring
/* 4713C 8004653C 8EE4D610 */   lw        $a0, -0x29f0($s7)
/* 47140 80046540 02A01021 */  addu       $v0, $s5, $zero
/* 47144 80046544 8FBF0138 */  lw         $ra, 0x138($sp)
/* 47148 80046548 8FB70134 */  lw         $s7, 0x134($sp)
/* 4714C 8004654C 8FB60130 */  lw         $s6, 0x130($sp)
/* 47150 80046550 8FB5012C */  lw         $s5, 0x12c($sp)
/* 47154 80046554 8FB40128 */  lw         $s4, 0x128($sp)
/* 47158 80046558 8FB30124 */  lw         $s3, 0x124($sp)
/* 4715C 8004655C 8FB20120 */  lw         $s2, 0x120($sp)
/* 47160 80046560 8FB1011C */  lw         $s1, 0x11c($sp)
/* 47164 80046564 8FB00118 */  lw         $s0, 0x118($sp)
/* 47168 80046568 03E00008 */  jr         $ra
/* 4716C 8004656C 27BD0140 */   addiu     $sp, $sp, 0x140

glabel _balloon
/* 47170 80046570 3C03800F */  lui        $v1, %hi(_balloon_flag)
/* 47174 80046574 8C628EC4 */  lw         $v0, %lo(_balloon_flag)($v1)
/* 47178 80046578 38420001 */  xori       $v0, $v0, 1
/* 4717C 8004657C 0002102B */  sltu       $v0, $zero, $v0
/* 47180 80046580 AC628EC4 */  sw         $v0, -0x713c($v1)
/* 47184 80046584 03E00008 */  jr         $ra
/* 47188 80046588 24020001 */   addiu     $v0, $zero, 1

glabel _Bigw
/* 4718C 8004658C 3C03800F */  lui        $v1, %hi(_bigw_flag)
/* 47190 80046590 8C628EC0 */  lw         $v0, %lo(_bigw_flag)($v1)
/* 47194 80046594 38420001 */  xori       $v0, $v0, 1
/* 47198 80046598 0002102B */  sltu       $v0, $zero, $v0
/* 4719C 8004659C AC628EC0 */  sw         $v0, -0x7140($v1)
/* 471A0 800465A0 03E00008 */  jr         $ra
/* 471A4 800465A4 24020001 */   addiu     $v0, $zero, 1

glabel _Flea
/* 471A8 800465A8 3C03800F */  lui        $v1, %hi(_flea_flag)
/* 471AC 800465AC 8C628EC8 */  lw         $v0, %lo(_flea_flag)($v1)
/* 471B0 800465B0 38420001 */  xori       $v0, $v0, 1
/* 471B4 800465B4 0002102B */  sltu       $v0, $zero, $v0
/* 471B8 800465B8 AC628EC8 */  sw         $v0, -0x7138($v1)
/* 471BC 800465BC 03E00008 */  jr         $ra
/* 471C0 800465C0 24020001 */   addiu     $v0, $zero, 1

glabel _slashing
/* 471C4 800465C4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 471C8 800465C8 24040E59 */  addiu      $a0, $zero, 0xe59
/* 471CC 800465CC AFBF0010 */  sw         $ra, 0x10($sp)
/* 471D0 800465D0 0C00918D */  jal        setEventFlag
/* 471D4 800465D4 24050001 */   addiu     $a1, $zero, 1
/* 471D8 800465D8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 471DC 800465DC 24020001 */  addiu      $v0, $zero, 1
/* 471E0 800465E0 03E00008 */  jr         $ra
/* 471E4 800465E4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _darkside
/* 471E8 800465E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 471EC 800465EC 24040E5B */  addiu      $a0, $zero, 0xe5b
/* 471F0 800465F0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 471F4 800465F4 0C00918D */  jal        setEventFlag
/* 471F8 800465F8 24050001 */   addiu     $a1, $zero, 1
/* 471FC 800465FC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 47200 80046600 24020001 */  addiu      $v0, $zero, 1
/* 47204 80046604 03E00008 */  jr         $ra
/* 47208 80046608 27BD0018 */   addiu     $sp, $sp, 0x18

glabel fatboy_crawdaddy_tweety
/* 4720C 8004660C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 47210 80046610 3C02800E */  lui        $v0, %hi(gGlobals)
/* 47214 80046614 AFB10014 */  sw         $s1, 0x14($sp)
/* 47218 80046618 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 4721C 8004661C AFBF0018 */  sw         $ra, 0x18($sp)
/* 47220 80046620 AFB00010 */  sw         $s0, 0x10($sp)
/* 47224 80046624 8E2200A8 */  lw         $v0, 0xa8($s1)
/* 47228 80046628 14400003 */  bnez       $v0, .L80046638
/* 4722C 8004662C 00808021 */   addu      $s0, $a0, $zero
/* 47230 80046630 08011998 */  j          .L80046660
/* 47234 80046634 00001021 */   addu      $v0, $zero, $zero
.L80046638:
/* 47238 80046638 0C006198 */  jal        FreePlayerActor
/* 4723C 8004663C 00402021 */   addu      $a0, $v0, $zero
/* 47240 80046640 8E2200AC */  lw         $v0, 0xac($s1)
/* 47244 80046644 50500001 */  beql       $v0, $s0, .L8004664C
/* 47248 80046648 241025F9 */   addiu     $s0, $zero, 0x25f9
.L8004664C:
/* 4724C 8004664C 8E2400A8 */  lw         $a0, 0xa8($s1)
/* 47250 80046650 02002821 */  addu       $a1, $s0, $zero
/* 47254 80046654 0C006134 */  jal        init_playerActor
/* 47258 80046658 AE3000AC */   sw        $s0, 0xac($s1)
/* 4725C 8004665C 24020001 */  addiu      $v0, $zero, 1
.L80046660:
/* 47260 80046660 8FBF0018 */  lw         $ra, 0x18($sp)
/* 47264 80046664 8FB10014 */  lw         $s1, 0x14($sp)
/* 47268 80046668 8FB00010 */  lw         $s0, 0x10($sp)
/* 4726C 8004666C 03E00008 */  jr         $ra
/* 47270 80046670 27BD0020 */   addiu     $sp, $sp, 0x20

glabel _crawdaddy
/* 47274 80046674 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 47278 80046678 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4727C 8004667C 0C011983 */  jal        fatboy_crawdaddy_tweety
/* 47280 80046680 24042E82 */   addiu     $a0, $zero, 0x2e82
/* 47284 80046684 8FBF0010 */  lw         $ra, 0x10($sp)
/* 47288 80046688 03E00008 */  jr         $ra
/* 4728C 8004668C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _fatboy
/* 47290 80046690 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 47294 80046694 AFBF0010 */  sw         $ra, 0x10($sp)
/* 47298 80046698 0C011983 */  jal        fatboy_crawdaddy_tweety
/* 4729C 8004669C 2404324D */   addiu     $a0, $zero, 0x324d
/* 472A0 800466A0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 472A4 800466A4 03E00008 */  jr         $ra
/* 472A8 800466A8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _tweety
/* 472AC 800466AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 472B0 800466B0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 472B4 800466B4 0C011983 */  jal        fatboy_crawdaddy_tweety
/* 472B8 800466B8 24043094 */   addiu     $a0, $zero, 0x3094
/* 472BC 800466BC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 472C0 800466C0 03E00008 */  jr         $ra
/* 472C4 800466C4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _Cheater
/* 472C8 800466C8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 472CC 800466CC 24040E6D */  addiu      $a0, $zero, 0xe6d
/* 472D0 800466D0 24050001 */  addiu      $a1, $zero, 1
/* 472D4 800466D4 AFBF0024 */  sw         $ra, 0x24($sp)
/* 472D8 800466D8 AFB40020 */  sw         $s4, 0x20($sp)
/* 472DC 800466DC AFB3001C */  sw         $s3, 0x1c($sp)
/* 472E0 800466E0 AFB20018 */  sw         $s2, 0x18($sp)
/* 472E4 800466E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 472E8 800466E8 0C00918D */  jal        setEventFlag
/* 472EC 800466EC AFB00010 */   sw        $s0, 0x10($sp)
/* 472F0 800466F0 00008021 */  addu       $s0, $zero, $zero
/* 472F4 800466F4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 472F8 800466F8 244468A8 */  addiu      $a0, $v0, %lo(gGlobals)
/* 472FC 800466FC 8C8315F8 */  lw         $v1, 0x15f8($a0)
/* 47300 80046700 00409021 */  addu       $s2, $v0, $zero
/* 47304 80046704 90620024 */  lbu        $v0, 0x24($v1)
/* 47308 80046708 10400012 */  beqz       $v0, .L80046754
/* 4730C 8004670C 3C14800F */   lui       $s4, 0x800f
/* 47310 80046710 00808821 */  addu       $s1, $a0, $zero
/* 47314 80046714 8E2215F8 */  lw         $v0, 0x15f8($s1)
.L80046718:
/* 47318 80046718 00101880 */  sll        $v1, $s0, 2
/* 4731C 8004671C 00431021 */  addu       $v0, $v0, $v1
/* 47320 80046720 8C440000 */  lw         $a0, ($v0)
/* 47324 80046724 50800005 */  beql       $a0, $zero, .L8004673C
/* 47328 80046728 8E2215F8 */   lw        $v0, 0x15f8($s1)
/* 4732C 8004672C 3C050007 */  lui        $a1, 7
/* 47330 80046730 0C01EA4F */  jal        giveExp
/* 47334 80046734 34A5A120 */   ori       $a1, $a1, 0xa120
/* 47338 80046738 8E2215F8 */  lw         $v0, 0x15f8($s1)
.L8004673C:
/* 4733C 8004673C 26040001 */  addiu      $a0, $s0, 1
/* 47340 80046740 90430024 */  lbu        $v1, 0x24($v0)
/* 47344 80046744 309000FF */  andi       $s0, $a0, 0xff
/* 47348 80046748 0203182B */  sltu       $v1, $s0, $v1
/* 4734C 8004674C 5460FFF2 */  bnel       $v1, $zero, .L80046718
/* 47350 80046750 8E2215F8 */   lw        $v0, 0x15f8($s1)
.L80046754:
/* 47354 80046754 264668A8 */  addiu      $a2, $s2, 0x68a8
/* 47358 80046758 8CC214CC */  lw         $v0, 0x14cc($a2)
/* 4735C 8004675C 8C530040 */  lw         $s3, 0x40($v0)
/* 47360 80046760 8E630004 */  lw         $v1, 4($s3)
/* 47364 80046764 9282D550 */  lbu        $v0, -0x2ab0($s4)
/* 47368 80046768 8C650080 */  lw         $a1, 0x80($v1)
/* 4736C 8004676C 8CC315F8 */  lw         $v1, 0x15f8($a2)
/* 47370 80046770 00021080 */  sll        $v0, $v0, 2
/* 47374 80046774 00621821 */  addu       $v1, $v1, $v0
/* 47378 80046778 8CA4007C */  lw         $a0, 0x7c($a1)
/* 4737C 8004677C 0C02EEBC */  jal        func_800BBAF0
/* 47380 80046780 8C720000 */   lw        $s2, ($v1)
/* 47384 80046784 02402021 */  addu       $a0, $s2, $zero
/* 47388 80046788 0C01EAEE */  jal        get_level
/* 4738C 8004678C 00408021 */   addu      $s0, $v0, $zero
/* 47390 80046790 02002021 */  addu       $a0, $s0, $zero
/* 47394 80046794 3C11800E */  lui        $s1, %hi(D_800DD150)
/* 47398 80046798 2631D150 */  addiu      $s1, $s1, %lo(D_800DD150)
/* 4739C 8004679C 02202821 */  addu       $a1, $s1, $zero
/* 473A0 800467A0 0C0333AC */  jal        sprintf
/* 473A4 800467A4 00403021 */   addu      $a2, $v0, $zero
/* 473A8 800467A8 8E630004 */  lw         $v1, 4($s3)
/* 473AC 800467AC 8C620080 */  lw         $v0, 0x80($v1)
/* 473B0 800467B0 0C02EEBC */  jal        func_800BBAF0
/* 473B4 800467B4 8C440084 */   lw        $a0, 0x84($v0)
/* 473B8 800467B8 02402021 */  addu       $a0, $s2, $zero
/* 473BC 800467BC 0C01DED7 */  jal        getHPCurrent
/* 473C0 800467C0 00408021 */   addu      $s0, $v0, $zero
/* 473C4 800467C4 02002021 */  addu       $a0, $s0, $zero
/* 473C8 800467C8 02202821 */  addu       $a1, $s1, $zero
/* 473CC 800467CC 0C0333AC */  jal        sprintf
/* 473D0 800467D0 00403021 */   addu      $a2, $v0, $zero
/* 473D4 800467D4 8E630004 */  lw         $v1, 4($s3)
/* 473D8 800467D8 8C620080 */  lw         $v0, 0x80($v1)
/* 473DC 800467DC 0C02EEBC */  jal        func_800BBAF0
/* 473E0 800467E0 8C440088 */   lw        $a0, 0x88($v0)
/* 473E4 800467E4 02402021 */  addu       $a0, $s2, $zero
/* 473E8 800467E8 0C01DEBD */  jal        getHPMax
/* 473EC 800467EC 00408021 */   addu      $s0, $v0, $zero
/* 473F0 800467F0 02002021 */  addu       $a0, $s0, $zero
/* 473F4 800467F4 02202821 */  addu       $a1, $s1, $zero
/* 473F8 800467F8 0C0333AC */  jal        sprintf
/* 473FC 800467FC 00403021 */   addu      $a2, $v0, $zero
/* 47400 80046800 8E630004 */  lw         $v1, 4($s3)
/* 47404 80046804 9285D550 */  lbu        $a1, -0x2ab0($s4)
/* 47408 80046808 0C00E2F7 */  jal        func_80038BDC
/* 4740C 8004680C 8C640088 */   lw        $a0, 0x88($v1)
/* 47410 80046810 8FBF0024 */  lw         $ra, 0x24($sp)
/* 47414 80046814 8FB40020 */  lw         $s4, 0x20($sp)
/* 47418 80046818 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4741C 8004681C 8FB20018 */  lw         $s2, 0x18($sp)
/* 47420 80046820 8FB10014 */  lw         $s1, 0x14($sp)
/* 47424 80046824 8FB00010 */  lw         $s0, 0x10($sp)
/* 47428 80046828 24020001 */  addiu      $v0, $zero, 1
/* 4742C 8004682C 03E00008 */  jr         $ra
/* 47430 80046830 27BD0028 */   addiu     $sp, $sp, 0x28

glabel _bingo
/* 47434 80046834 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 47438 80046838 24040E6E */  addiu      $a0, $zero, 0xe6e
/* 4743C 8004683C 24050001 */  addiu      $a1, $zero, 1
/* 47440 80046840 AFBF0014 */  sw         $ra, 0x14($sp)
/* 47444 80046844 0C00918D */  jal        setEventFlag
/* 47448 80046848 AFB00010 */   sw        $s0, 0x10($sp)
/* 4744C 8004684C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 47450 80046850 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 47454 80046854 8E0214CC */  lw         $v0, 0x14cc($s0)
/* 47458 80046858 3C030001 */  lui        $v1, 1
/* 4745C 8004685C 8C440040 */  lw         $a0, 0x40($v0)
/* 47460 80046860 346386A0 */  ori        $v1, $v1, 0x86a0
/* 47464 80046864 8C850004 */  lw         $a1, 4($a0)
/* 47468 80046868 8E0715F8 */  lw         $a3, 0x15f8($s0)
/* 4746C 8004686C 8CA60080 */  lw         $a2, 0x80($a1)
/* 47470 80046870 8CE20014 */  lw         $v0, 0x14($a3)
/* 47474 80046874 8CC40080 */  lw         $a0, 0x80($a2)
/* 47478 80046878 00431021 */  addu       $v0, $v0, $v1
/* 4747C 8004687C 0C02EEBC */  jal        func_800BBAF0
/* 47480 80046880 ACE20014 */   sw        $v0, 0x14($a3)
/* 47484 80046884 00402021 */  addu       $a0, $v0, $zero
/* 47488 80046888 8E0215F8 */  lw         $v0, 0x15f8($s0)
/* 4748C 8004688C 3C05800E */  lui        $a1, %hi(D_800DD154)
/* 47490 80046890 8C460014 */  lw         $a2, 0x14($v0)
/* 47494 80046894 0C0333AC */  jal        sprintf
/* 47498 80046898 24A5D154 */   addiu     $a1, $a1, %lo(D_800DD154)
/* 4749C 8004689C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 474A0 800468A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 474A4 800468A4 24020001 */  addiu      $v0, $zero, 1
/* 474A8 800468A8 03E00008 */  jr         $ra
/* 474AC 800468AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel imadoofus
/* 474B0 800468B0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 474B4 800468B4 240200FF */  addiu      $v0, $zero, 0xff
/* 474B8 800468B8 24030032 */  addiu      $v1, $zero, 0x32
/* 474BC 800468BC AFA20010 */  sw         $v0, 0x10($sp)
/* 474C0 800468C0 AFA20014 */  sw         $v0, 0x14($sp)
/* 474C4 800468C4 AFA20018 */  sw         $v0, 0x18($sp)
/* 474C8 800468C8 24020096 */  addiu      $v0, $zero, 0x96
/* 474CC 800468CC AFA3001C */  sw         $v1, 0x1c($sp)
/* 474D0 800468D0 AFA30020 */  sw         $v1, 0x20($sp)
/* 474D4 800468D4 AFA30024 */  sw         $v1, 0x24($sp)
/* 474D8 800468D8 24030001 */  addiu      $v1, $zero, 1
/* 474DC 800468DC AFA20028 */  sw         $v0, 0x28($sp)
/* 474E0 800468E0 3C02800F */  lui        $v0, %hi(cheatStrings_pointer)
/* 474E4 800468E4 240500C8 */  addiu      $a1, $zero, 0xc8
/* 474E8 800468E8 AFA3002C */  sw         $v1, 0x2c($sp)
/* 474EC 800468EC 8C43D610 */  lw         $v1, %lo(cheatStrings_pointer)($v0)
/* 474F0 800468F0 2406001E */  addiu      $a2, $zero, 0x1e
/* 474F4 800468F4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 474F8 800468F8 8C64002C */  lw         $a0, 0x2c($v1)
/* 474FC 800468FC 0C013174 */  jal        another_textbox_func
/* 47500 80046900 240700FF */   addiu     $a3, $zero, 0xff
/* 47504 80046904 8FBF0030 */  lw         $ra, 0x30($sp)
/* 47508 80046908 24020001 */  addiu      $v0, $zero, 1
/* 4750C 8004690C 03E00008 */  jr         $ra
/* 47510 80046910 27BD0038 */   addiu     $sp, $sp, 0x38

glabel keepbusy
/* 47514 80046914 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 47518 80046918 240200FF */  addiu      $v0, $zero, 0xff
/* 4751C 8004691C 24030032 */  addiu      $v1, $zero, 0x32
/* 47520 80046920 AFA20010 */  sw         $v0, 0x10($sp)
/* 47524 80046924 AFA20014 */  sw         $v0, 0x14($sp)
/* 47528 80046928 AFA20018 */  sw         $v0, 0x18($sp)
/* 4752C 8004692C 24020096 */  addiu      $v0, $zero, 0x96
/* 47530 80046930 AFA3001C */  sw         $v1, 0x1c($sp)
/* 47534 80046934 AFA30020 */  sw         $v1, 0x20($sp)
/* 47538 80046938 AFA30024 */  sw         $v1, 0x24($sp)
/* 4753C 8004693C 24030001 */  addiu      $v1, $zero, 1
/* 47540 80046940 AFA20028 */  sw         $v0, 0x28($sp)
/* 47544 80046944 3C02800F */  lui        $v0, %hi(cheatStrings_pointer)
/* 47548 80046948 240500C8 */  addiu      $a1, $zero, 0xc8
/* 4754C 8004694C AFA3002C */  sw         $v1, 0x2c($sp)
/* 47550 80046950 8C43D610 */  lw         $v1, %lo(cheatStrings_pointer)($v0)
/* 47554 80046954 2406001E */  addiu      $a2, $zero, 0x1e
/* 47558 80046958 AFBF0030 */  sw         $ra, 0x30($sp)
/* 4755C 8004695C 8C640034 */  lw         $a0, 0x34($v1)
/* 47560 80046960 0C013174 */  jal        another_textbox_func
/* 47564 80046964 240700FF */   addiu     $a3, $zero, 0xff
/* 47568 80046968 8FBF0030 */  lw         $ra, 0x30($sp)
/* 4756C 8004696C 24020001 */  addiu      $v0, $zero, 1
/* 47570 80046970 03E00008 */  jr         $ra
/* 47574 80046974 27BD0038 */   addiu     $sp, $sp, 0x38

glabel _version
/* 47578 80046978 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 4757C 8004697C AFB00030 */  sw         $s0, 0x30($sp)
/* 47580 80046980 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 47584 80046984 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 47588 80046988 02002021 */  addu       $a0, $s0, $zero
/* 4758C 8004698C 3C05800E */  lui        $a1, %hi(D_800DD158)
/* 47590 80046990 24A5D158 */  addiu      $a1, $a1, %lo(D_800DD158)
/* 47594 80046994 3C06800E */  lui        $a2, %hi(D_800DD1A0)
/* 47598 80046998 24C6D1A0 */  addiu      $a2, $a2, %lo(D_800DD1A0)
/* 4759C 8004699C 3C07800E */  lui        $a3, %hi(D_800DD1AC)
/* 475A0 800469A0 24E7D1AC */  addiu      $a3, $a3, %lo(D_800DD1AC)
/* 475A4 800469A4 3C028010 */  lui        $v0, %hi(clear_end)
/* 475A8 800469A8 2442FA50 */  addiu      $v0, $v0, %lo(clear_end)
/* 475AC 800469AC 3C038000 */  lui        $v1, %hi(romMain)
/* 475B0 800469B0 24630400 */  addiu      $v1, $v1, %lo(romMain)
/* 475B4 800469B4 00431023 */  subu       $v0, $v0, $v1
/* 475B8 800469B8 24420400 */  addiu      $v0, $v0, 0x400
/* 475BC 800469BC AFBF0034 */  sw         $ra, 0x34($sp)
/* 475C0 800469C0 0C0333AC */  jal        sprintf
/* 475C4 800469C4 AFA20010 */   sw        $v0, 0x10($sp)
/* 475C8 800469C8 02002021 */  addu       $a0, $s0, $zero
/* 475CC 800469CC 240500C8 */  addiu      $a1, $zero, 0xc8
/* 475D0 800469D0 24060032 */  addiu      $a2, $zero, 0x32
/* 475D4 800469D4 240700FF */  addiu      $a3, $zero, 0xff
/* 475D8 800469D8 240200FF */  addiu      $v0, $zero, 0xff
/* 475DC 800469DC 24030032 */  addiu      $v1, $zero, 0x32
/* 475E0 800469E0 AFA20010 */  sw         $v0, 0x10($sp)
/* 475E4 800469E4 AFA20014 */  sw         $v0, 0x14($sp)
/* 475E8 800469E8 AFA20018 */  sw         $v0, 0x18($sp)
/* 475EC 800469EC 24020096 */  addiu      $v0, $zero, 0x96
/* 475F0 800469F0 AFA3001C */  sw         $v1, 0x1c($sp)
/* 475F4 800469F4 AFA30020 */  sw         $v1, 0x20($sp)
/* 475F8 800469F8 AFA30024 */  sw         $v1, 0x24($sp)
/* 475FC 800469FC 24030001 */  addiu      $v1, $zero, 1
/* 47600 80046A00 AFA20028 */  sw         $v0, 0x28($sp)
/* 47604 80046A04 0C013174 */  jal        another_textbox_func
/* 47608 80046A08 AFA3002C */   sw        $v1, 0x2c($sp)
/* 4760C 80046A0C 8FBF0034 */  lw         $ra, 0x34($sp)
/* 47610 80046A10 8FB00030 */  lw         $s0, 0x30($sp)
/* 47614 80046A14 24020001 */  addiu      $v0, $zero, 1
/* 47618 80046A18 03E00008 */  jr         $ra
/* 4761C 80046A1C 27BD0038 */   addiu     $sp, $sp, 0x38
