.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel has_item_func
/* 7CDC0 8007C1C0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7CDC4 8007C1C4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7CDC8 8007C1C8 8C830000 */  lw         $v1, ($a0)
/* 7CDCC 8007C1CC 84620050 */  lh         $v0, 0x50($v1)
/* 7CDD0 8007C1D0 00822021 */  addu       $a0, $a0, $v0
/* 7CDD4 8007C1D4 8C620054 */  lw         $v0, 0x54($v1)
/* 7CDD8 8007C1D8 0040F809 */  jalr       $v0
/* 7CDDC 8007C1DC 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 7CDE0 8007C1E0 00021027 */  nor        $v0, $zero, $v0
/* 7CDE4 8007C1E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7CDE8 8007C1E8 0002102B */  sltu       $v0, $zero, $v0
/* 7CDEC 8007C1EC 03E00008 */  jr         $ra
/* 7CDF0 8007C1F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel HasNoKeyItem
/* 7CDF4 8007C1F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7CDF8 8007C1F8 AFB20018 */  sw         $s2, 0x18($sp)
/* 7CDFC 8007C1FC 00809021 */  addu       $s2, $a0, $zero
/* 7CE00 8007C200 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CE04 8007C204 00008821 */  addu       $s1, $zero, $zero
/* 7CE08 8007C208 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7CE0C 8007C20C 2413FFFF */  addiu      $s3, $zero, -1
/* 7CE10 8007C210 3C02800F */  lui        $v0, %hi(key_item_ids)
/* 7CE14 8007C214 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CE18 8007C218 24501850 */  addiu      $s0, $v0, %lo(key_item_ids)
/* 7CE1C 8007C21C AFBF0020 */  sw         $ra, 0x20($sp)
.L8007C220:
/* 7CE20 8007C220 8E430000 */  lw         $v1, ($s2)
/* 7CE24 8007C224 96050000 */  lhu        $a1, ($s0)
/* 7CE28 8007C228 84640050 */  lh         $a0, 0x50($v1)
/* 7CE2C 8007C22C 8C620054 */  lw         $v0, 0x54($v1)
/* 7CE30 8007C230 0040F809 */  jalr       $v0
/* 7CE34 8007C234 02442021 */   addu      $a0, $s2, $a0
/* 7CE38 8007C238 14530006 */  bne        $v0, $s3, .L8007C254
/* 7CE3C 8007C23C 00001021 */   addu      $v0, $zero, $zero
/* 7CE40 8007C240 26310001 */  addiu      $s1, $s1, 1
/* 7CE44 8007C244 2E220015 */  sltiu      $v0, $s1, 0x15
/* 7CE48 8007C248 1440FFF5 */  bnez       $v0, .L8007C220
/* 7CE4C 8007C24C 26100002 */   addiu     $s0, $s0, 2
/* 7CE50 8007C250 24020001 */  addiu      $v0, $zero, 1
.L8007C254:
/* 7CE54 8007C254 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7CE58 8007C258 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7CE5C 8007C25C 8FB20018 */  lw         $s2, 0x18($sp)
/* 7CE60 8007C260 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CE64 8007C264 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CE68 8007C268 03E00008 */  jr         $ra
/* 7CE6C 8007C26C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel build_inventory_struct
/* 7CE70 8007C270 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7CE74 8007C274 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CE78 8007C278 00808021 */  addu       $s0, $a0, $zero
/* 7CE7C 8007C27C 3C02800E */  lui        $v0, %hi(D_800E0918)
/* 7CE80 8007C280 24420918 */  addiu      $v0, $v0, %lo(D_800E0918)
/* 7CE84 8007C284 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7CE88 8007C288 0C01F0BF */  jal        calloc_some_menu
/* 7CE8C 8007C28C AE020000 */   sw        $v0, ($s0)
/* 7CE90 8007C290 02001021 */  addu       $v0, $s0, $zero
/* 7CE94 8007C294 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7CE98 8007C298 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CE9C 8007C29C 03E00008 */  jr         $ra
/* 7CEA0 8007C2A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007C2A4
/* 7CEA4 8007C2A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7CEA8 8007C2A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CEAC 8007C2AC 00808821 */  addu       $s1, $a0, $zero
/* 7CEB0 8007C2B0 3C02800E */  lui        $v0, %hi(D_800E0918)
/* 7CEB4 8007C2B4 24420918 */  addiu      $v0, $v0, %lo(D_800E0918)
/* 7CEB8 8007C2B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CEBC 8007C2BC 00A08021 */  addu       $s0, $a1, $zero
/* 7CEC0 8007C2C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7CEC4 8007C2C4 0C01F0CC */  jal        func_8007C330
/* 7CEC8 8007C2C8 AE220000 */   sw        $v0, ($s1)
/* 7CECC 8007C2CC 3C02800E */  lui        $v0, %hi(D_800E0990)
/* 7CED0 8007C2D0 24420990 */  addiu      $v0, $v0, %lo(D_800E0990)
/* 7CED4 8007C2D4 32100001 */  andi       $s0, $s0, 1
/* 7CED8 8007C2D8 12000003 */  beqz       $s0, .L8007C2E8
/* 7CEDC 8007C2DC AE220000 */   sw        $v0, ($s1)
/* 7CEE0 8007C2E0 0C026262 */  jal        passToFree
/* 7CEE4 8007C2E4 02202021 */   addu      $a0, $s1, $zero
.L8007C2E8:
/* 7CEE8 8007C2E8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7CEEC 8007C2EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CEF0 8007C2F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CEF4 8007C2F4 03E00008 */  jr         $ra
/* 7CEF8 8007C2F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel calloc_some_menu
/* 7CEFC 8007C2FC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7CF00 8007C300 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CF04 8007C304 00808021 */  addu       $s0, $a0, $zero
/* 7CF08 8007C308 26040004 */  addiu      $a0, $s0, 4
/* 7CF0C 8007C30C 00002821 */  addu       $a1, $zero, $zero
/* 7CF10 8007C310 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7CF14 8007C314 0C026380 */  jal        Calloc
/* 7CF18 8007C318 24060600 */   addiu     $a2, $zero, 0x600
/* 7CF1C 8007C31C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7CF20 8007C320 AE000604 */  sw         $zero, 0x604($s0)
/* 7CF24 8007C324 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CF28 8007C328 03E00008 */  jr         $ra
/* 7CF2C 8007C32C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007C330
/* 7CF30 8007C330 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7CF34 8007C334 AFB20018 */  sw         $s2, 0x18($sp)
/* 7CF38 8007C338 00009021 */  addu       $s2, $zero, $zero
/* 7CF3C 8007C33C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7CF40 8007C340 00809821 */  addu       $s3, $a0, $zero
/* 7CF44 8007C344 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CF48 8007C348 26710004 */  addiu      $s1, $s3, 4
/* 7CF4C 8007C34C AFB00010 */  sw         $s0, 0x10($sp)
/* 7CF50 8007C350 26700018 */  addiu      $s0, $s3, 0x18
/* 7CF54 8007C354 AFBF0020 */  sw         $ra, 0x20($sp)
.L8007C358:
/* 7CF58 8007C358 8E020000 */  lw         $v0, ($s0)
/* 7CF5C 8007C35C 50400007 */  beql       $v0, $zero, .L8007C37C
/* 7CF60 8007C360 26310018 */   addiu     $s1, $s1, 0x18
/* 7CF64 8007C364 9602FFEC */  lhu        $v0, -0x14($s0)
/* 7CF68 8007C368 10400003 */  beqz       $v0, .L8007C378
/* 7CF6C 8007C36C AE000000 */   sw        $zero, ($s0)
/* 7CF70 8007C370 0C01EF3A */  jal        clear_temp_Stat_spell
/* 7CF74 8007C374 02202021 */   addu      $a0, $s1, $zero
.L8007C378:
/* 7CF78 8007C378 26310018 */  addiu      $s1, $s1, 0x18
.L8007C37C:
/* 7CF7C 8007C37C 26520001 */  addiu      $s2, $s2, 1
/* 7CF80 8007C380 2E420040 */  sltiu      $v0, $s2, 0x40
/* 7CF84 8007C384 1440FFF4 */  bnez       $v0, .L8007C358
/* 7CF88 8007C388 26100018 */   addiu     $s0, $s0, 0x18
/* 7CF8C 8007C38C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7CF90 8007C390 AE600604 */  sw         $zero, 0x604($s3)
/* 7CF94 8007C394 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7CF98 8007C398 8FB20018 */  lw         $s2, 0x18($sp)
/* 7CF9C 8007C39C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CFA0 8007C3A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CFA4 8007C3A4 03E00008 */  jr         $ra
/* 7CFA8 8007C3A8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel NOOP_8007c3ac
/* 7CFAC 8007C3AC 03E00008 */  jr         $ra
/* 7CFB0 8007C3B0 00000000 */   nop

glabel NOOP_8007C3B4
/* 7CFB4 8007C3B4 03E00008 */  jr         $ra
/* 7CFB8 8007C3B8 00000000 */   nop

glabel func_checking_cyclops_club
/* 7CFBC 8007C3BC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7CFC0 8007C3C0 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CFC4 8007C3C4 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 7CFC8 8007C3C8 AFB20018 */  sw         $s2, 0x18($sp)
/* 7CFCC 8007C3CC 00809021 */  addu       $s2, $a0, $zero
/* 7CFD0 8007C3D0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7CFD4 8007C3D4 00C09821 */  addu       $s3, $a2, $zero
/* 7CFD8 8007C3D8 3C03800F */  lui        $v1, %hi(weaponList+0x20)
/* 7CFDC 8007C3DC 90621720 */  lbu        $v0, %lo(weaponList+0x20)($v1)
/* 7CFE0 8007C3E0 2403100B */  addiu      $v1, $zero, 0x100b
/* 7CFE4 8007C3E4 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7CFE8 8007C3E8 34420700 */  ori        $v0, $v0, 0x700
/* 7CFEC 8007C3EC 1051002A */  beq        $v0, $s1, .L8007C498
/* 7CFF0 8007C3F0 AFB00010 */   sw        $s0, 0x10($sp)
/* 7CFF4 8007C3F4 52230001 */  beql       $s1, $v1, .L8007C3FC
/* 7CFF8 8007C3F8 24111004 */   addiu     $s1, $zero, 0x1004
.L8007C3FC:
/* 7CFFC 8007C3FC 8E430000 */  lw         $v1, ($s2)
/* 7D000 8007C400 02202821 */  addu       $a1, $s1, $zero
/* 7D004 8007C404 84640050 */  lh         $a0, 0x50($v1)
/* 7D008 8007C408 8C620054 */  lw         $v0, 0x54($v1)
/* 7D00C 8007C40C 0040F809 */  jalr       $v0
/* 7D010 8007C410 02442021 */   addu      $a0, $s2, $a0
/* 7D014 8007C414 00402821 */  addu       $a1, $v0, $zero
/* 7D018 8007C418 2402FFFF */  addiu      $v0, $zero, -1
/* 7D01C 8007C41C 10A20012 */  beq        $a1, $v0, .L8007C468
/* 7D020 8007C420 02603021 */   addu      $a2, $s3, $zero
/* 7D024 8007C424 8E430000 */  lw         $v1, ($s2)
/* 7D028 8007C428 84640060 */  lh         $a0, 0x60($v1)
/* 7D02C 8007C42C 8C620064 */  lw         $v0, 0x64($v1)
/* 7D030 8007C430 0040F809 */  jalr       $v0
/* 7D034 8007C434 02442021 */   addu      $a0, $s2, $a0
/* 7D038 8007C438 0801F127 */  j          .L8007C49C
/* 7D03C 8007C43C 24020001 */   addiu     $v0, $zero, 1
.L8007C440:
/* 7D040 8007C440 24840004 */  addiu      $a0, $a0, 4
/* 7D044 8007C444 02442021 */  addu       $a0, $s2, $a0
/* 7D048 8007C448 0C01EF1C */  jal        temp_item_check
/* 7D04C 8007C44C 02202821 */   addu      $a1, $s1, $zero
/* 7D050 8007C450 AE130000 */  sw         $s3, ($s0)
/* 7D054 8007C454 8E430604 */  lw         $v1, 0x604($s2)
/* 7D058 8007C458 24020001 */  addiu      $v0, $zero, 1
/* 7D05C 8007C45C 24630001 */  addiu      $v1, $v1, 1
/* 7D060 8007C460 0801F127 */  j          .L8007C49C
/* 7D064 8007C464 AE430604 */   sw        $v1, 0x604($s2)
.L8007C468:
/* 7D068 8007C468 00002821 */  addu       $a1, $zero, $zero
/* 7D06C 8007C46C 26500018 */  addiu      $s0, $s2, 0x18
/* 7D070 8007C470 02001821 */  addu       $v1, $s0, $zero
/* 7D074 8007C474 00002021 */  addu       $a0, $zero, $zero
.L8007C478:
/* 7D078 8007C478 8C620000 */  lw         $v0, ($v1)
/* 7D07C 8007C47C 1040FFF0 */  beqz       $v0, .L8007C440
/* 7D080 8007C480 24630018 */   addiu     $v1, $v1, 0x18
/* 7D084 8007C484 26100018 */  addiu      $s0, $s0, 0x18
/* 7D088 8007C488 24A50001 */  addiu      $a1, $a1, 1
/* 7D08C 8007C48C 2CA20040 */  sltiu      $v0, $a1, 0x40
/* 7D090 8007C490 1440FFF9 */  bnez       $v0, .L8007C478
/* 7D094 8007C494 24840018 */   addiu     $a0, $a0, 0x18
.L8007C498:
/* 7D098 8007C498 00001021 */  addu       $v0, $zero, $zero
.L8007C49C:
/* 7D09C 8007C49C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7D0A0 8007C4A0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7D0A4 8007C4A4 8FB20018 */  lw         $s2, 0x18($sp)
/* 7D0A8 8007C4A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D0AC 8007C4AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D0B0 8007C4B0 03E00008 */  jr         $ra
/* 7D0B4 8007C4B4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007C4B8
/* 7D0B8 8007C4B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D0BC 8007C4BC AFB00010 */  sw         $s0, 0x10($sp)
/* 7D0C0 8007C4C0 00808021 */  addu       $s0, $a0, $zero
/* 7D0C4 8007C4C4 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7D0C8 8007C4C8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7D0CC 8007C4CC AFB10014 */  sw         $s1, 0x14($sp)
/* 7D0D0 8007C4D0 8E030000 */  lw         $v1, ($s0)
/* 7D0D4 8007C4D4 00C08821 */  addu       $s1, $a2, $zero
/* 7D0D8 8007C4D8 84640050 */  lh         $a0, 0x50($v1)
/* 7D0DC 8007C4DC 8C620054 */  lw         $v0, 0x54($v1)
/* 7D0E0 8007C4E0 0040F809 */  jalr       $v0
/* 7D0E4 8007C4E4 02042021 */   addu      $a0, $s0, $a0
/* 7D0E8 8007C4E8 00402821 */  addu       $a1, $v0, $zero
/* 7D0EC 8007C4EC 2402FFFF */  addiu      $v0, $zero, -1
/* 7D0F0 8007C4F0 10A20008 */  beq        $a1, $v0, .L8007C514
/* 7D0F4 8007C4F4 00113023 */   negu      $a2, $s1
/* 7D0F8 8007C4F8 8E030000 */  lw         $v1, ($s0)
/* 7D0FC 8007C4FC 84640060 */  lh         $a0, 0x60($v1)
/* 7D100 8007C500 8C620064 */  lw         $v0, 0x64($v1)
/* 7D104 8007C504 0040F809 */  jalr       $v0
/* 7D108 8007C508 02042021 */   addu      $a0, $s0, $a0
/* 7D10C 8007C50C 0801F146 */  j          .L8007C518
/* 7D110 8007C510 24020001 */   addiu     $v0, $zero, 1
.L8007C514:
/* 7D114 8007C514 00001021 */  addu       $v0, $zero, $zero
.L8007C518:
/* 7D118 8007C518 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7D11C 8007C51C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D120 8007C520 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D124 8007C524 03E00008 */  jr         $ra
/* 7D128 8007C528 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007C52C
/* 7D12C 8007C52C 03E00008 */  jr         $ra
/* 7D130 8007C530 8C820604 */   lw        $v0, 0x604($a0)

glabel func_8007C534
/* 7D134 8007C534 03E00008 */  jr         $ra
/* 7D138 8007C538 24020040 */   addiu     $v0, $zero, 0x40

glabel func_8007C53C
/* 7D13C 8007C53C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7D140 8007C540 00001821 */  addu       $v1, $zero, $zero
/* 7D144 8007C544 24840004 */  addiu      $a0, $a0, 4
.L8007C548:
/* 7D148 8007C548 8C820014 */  lw         $v0, 0x14($a0)
/* 7D14C 8007C54C 50400006 */  beql       $v0, $zero, .L8007C568
/* 7D150 8007C550 24630001 */   addiu     $v1, $v1, 1
/* 7D154 8007C554 94820000 */  lhu        $v0, ($a0)
/* 7D158 8007C558 54450003 */  bnel       $v0, $a1, .L8007C568
/* 7D15C 8007C55C 24630001 */   addiu     $v1, $v1, 1
/* 7D160 8007C560 03E00008 */  jr         $ra
/* 7D164 8007C564 00601021 */   addu      $v0, $v1, $zero
.L8007C568:
/* 7D168 8007C568 2C620040 */  sltiu      $v0, $v1, 0x40
/* 7D16C 8007C56C 1440FFF6 */  bnez       $v0, .L8007C548
/* 7D170 8007C570 24840018 */   addiu     $a0, $a0, 0x18
/* 7D174 8007C574 03E00008 */  jr         $ra
/* 7D178 8007C578 2402FFFF */   addiu     $v0, $zero, -1

glabel func_8007C57C
/* 7D17C 8007C57C 2402FFFF */  addiu      $v0, $zero, -1
/* 7D180 8007C580 10A2000A */  beq        $a1, $v0, .L8007C5AC
/* 7D184 8007C584 00051040 */   sll       $v0, $a1, 1
/* 7D188 8007C588 00451021 */  addu       $v0, $v0, $a1
/* 7D18C 8007C58C 000210C0 */  sll        $v0, $v0, 3
/* 7D190 8007C590 24420004 */  addiu      $v0, $v0, 4
/* 7D194 8007C594 00822021 */  addu       $a0, $a0, $v0
/* 7D198 8007C598 8C830014 */  lw         $v1, 0x14($a0)
/* 7D19C 8007C59C 18600004 */  blez       $v1, .L8007C5B0
/* 7D1A0 8007C5A0 00001021 */   addu      $v0, $zero, $zero
/* 7D1A4 8007C5A4 03E00008 */  jr         $ra
/* 7D1A8 8007C5A8 00801021 */   addu      $v0, $a0, $zero
.L8007C5AC:
/* 7D1AC 8007C5AC 00001021 */  addu       $v0, $zero, $zero
.L8007C5B0:
/* 7D1B0 8007C5B0 03E00008 */  jr         $ra
/* 7D1B4 8007C5B4 00000000 */   nop

glabel generic_inventory
/* 7D1B8 8007C5B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7D1BC 8007C5BC AFB10014 */  sw         $s1, 0x14($sp)
/* 7D1C0 8007C5C0 00808821 */  addu       $s1, $a0, $zero
/* 7D1C4 8007C5C4 2402FFFF */  addiu      $v0, $zero, -1
/* 7D1C8 8007C5C8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7D1CC 8007C5CC 10A20009 */  beq        $a1, $v0, .L8007C5F4
/* 7D1D0 8007C5D0 AFB00010 */   sw        $s0, 0x10($sp)
/* 7D1D4 8007C5D4 00051040 */  sll        $v0, $a1, 1
/* 7D1D8 8007C5D8 00451021 */  addu       $v0, $v0, $a1
/* 7D1DC 8007C5DC 000210C0 */  sll        $v0, $v0, 3
/* 7D1E0 8007C5E0 24420004 */  addiu      $v0, $v0, 4
/* 7D1E4 8007C5E4 02228021 */  addu       $s0, $s1, $v0
/* 7D1E8 8007C5E8 8E020014 */  lw         $v0, 0x14($s0)
/* 7D1EC 8007C5EC 1C400003 */  bgtz       $v0, .L8007C5FC
/* 7D1F0 8007C5F0 00463021 */   addu      $a2, $v0, $a2
.L8007C5F4:
/* 7D1F4 8007C5F4 0801F198 */  j          .L8007C660
/* 7D1F8 8007C5F8 00001021 */   addu      $v0, $zero, $zero
.L8007C5FC:
/* 7D1FC 8007C5FC 28C20063 */  slti       $v0, $a2, 0x63
/* 7D200 8007C600 14400004 */  bnez       $v0, .L8007C614
/* 7D204 8007C604 AE060014 */   sw        $a2, 0x14($s0)
/* 7D208 8007C608 24020063 */  addiu      $v0, $zero, 0x63
/* 7D20C 8007C60C 0801F198 */  j          .L8007C660
/* 7D210 8007C610 AE020014 */   sw        $v0, 0x14($s0)
.L8007C614:
/* 7D214 8007C614 5CC00012 */  bgtzl      $a2, .L8007C660
/* 7D218 8007C618 8E020014 */   lw        $v0, 0x14($s0)
/* 7D21C 8007C61C 96020000 */  lhu        $v0, ($s0)
/* 7D220 8007C620 10400003 */  beqz       $v0, .L8007C630
/* 7D224 8007C624 AE000014 */   sw        $zero, 0x14($s0)
/* 7D228 8007C628 0C01EF3A */  jal        clear_temp_Stat_spell
/* 7D22C 8007C62C 02002021 */   addu      $a0, $s0, $zero
.L8007C630:
/* 7D230 8007C630 8E220604 */  lw         $v0, 0x604($s1)
/* 7D234 8007C634 14400008 */  bnez       $v0, .L8007C658
/* 7D238 8007C638 2442FFFF */   addiu     $v0, $v0, -1
/* 7D23C 8007C63C 3C04800E */  lui        $a0, %hi(D_800E0904)
/* 7D240 8007C640 3C02800F */  lui        $v0, %hi(D_800F1880)
/* 7D244 8007C644 8C451880 */  lw         $a1, %lo(D_800F1880)($v0)
/* 7D248 8007C648 0C025F2D */  jal        manualCrash
/* 7D24C 8007C64C 24840904 */   addiu     $a0, $a0, %lo(D_800E0904)
/* 7D250 8007C650 8E220604 */  lw         $v0, 0x604($s1)
/* 7D254 8007C654 2442FFFF */  addiu      $v0, $v0, -1
.L8007C658:
/* 7D258 8007C658 AE220604 */  sw         $v0, 0x604($s1)
/* 7D25C 8007C65C 8E020014 */  lw         $v0, 0x14($s0)
.L8007C660:
/* 7D260 8007C660 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7D264 8007C664 8FB10014 */  lw         $s1, 0x14($sp)
/* 7D268 8007C668 8FB00010 */  lw         $s0, 0x10($sp)
/* 7D26C 8007C66C 03E00008 */  jr         $ra
/* 7D270 8007C670 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007C674
/* 7D274 8007C674 2402FFFF */  addiu      $v0, $zero, -1
/* 7D278 8007C678 10A20006 */  beq        $a1, $v0, .L8007C694
/* 7D27C 8007C67C 00051840 */   sll       $v1, $a1, 1
/* 7D280 8007C680 00651821 */  addu       $v1, $v1, $a1
/* 7D284 8007C684 000318C0 */  sll        $v1, $v1, 3
/* 7D288 8007C688 00831821 */  addu       $v1, $a0, $v1
/* 7D28C 8007C68C 03E00008 */  jr         $ra
/* 7D290 8007C690 8C620018 */   lw        $v0, 0x18($v1)
.L8007C694:
/* 7D294 8007C694 03E00008 */  jr         $ra
/* 7D298 8007C698 00001021 */   addu      $v0, $zero, $zero

glabel func_8007C69C
/* 7D29C 8007C69C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7D2A0 8007C6A0 3C02800E */  lui        $v0, %hi(D_800E0990)
/* 7D2A4 8007C6A4 24420990 */  addiu      $v0, $v0, %lo(D_800E0990)
/* 7D2A8 8007C6A8 30A50001 */  andi       $a1, $a1, 1
/* 7D2AC 8007C6AC AFBF0010 */  sw         $ra, 0x10($sp)
/* 7D2B0 8007C6B0 10A00003 */  beqz       $a1, .L8007C6C0
/* 7D2B4 8007C6B4 AC820000 */   sw        $v0, ($a0)
/* 7D2B8 8007C6B8 0C026262 */  jal        passToFree
/* 7D2BC 8007C6BC 00000000 */   nop
.L8007C6C0:
/* 7D2C0 8007C6C0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7D2C4 8007C6C4 03E00008 */  jr         $ra
/* 7D2C8 8007C6C8 27BD0018 */   addiu     $sp, $sp, 0x18
/* 7D2CC 8007C6CC 00000000 */  nop
