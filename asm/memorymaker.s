.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel memorymaker_init
/* 2E310 8002D710 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2E314 8002D714 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2E318 8002D718 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2E31C 8002D71C AFBF0014 */  sw         $ra, 0x14($sp)
/* 2E320 8002D720 14600008 */  bnez       $v1, .L8002D744
/* 2E324 8002D724 AFB00010 */   sw        $s0, 0x10($sp)
/* 2E328 8002D728 3C10800F */  lui        $s0, 0x800f
/* 2E32C 8002D72C 3C05800E */  lui        $a1, %hi(D_800DA9E0)
/* 2E330 8002D730 24040C00 */  addiu      $a0, $zero, 0xc00
/* 2E334 8002D734 24A5A9E0 */  addiu      $a1, $a1, %lo(D_800DA9E0)
/* 2E338 8002D738 0C025F9C */  jal        Malloc
/* 2E33C 8002D73C 2406005A */   addiu     $a2, $zero, 0x5a
/* 2E340 8002D740 AE02C610 */  sw         $v0, -0x39f0($s0)
.L8002D744:
/* 2E344 8002D744 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2E348 8002D748 8FB00010 */  lw         $s0, 0x10($sp)
/* 2E34C 8002D74C 03E00008 */  jr         $ra
/* 2E350 8002D750 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ofunc_memmaker_free
/* 2E354 8002D754 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2E358 8002D758 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2E35C 8002D75C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2E360 8002D760 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2E364 8002D764 14600008 */  bnez       $v1, .L8002D788
/* 2E368 8002D768 AFB00010 */   sw        $s0, 0x10($sp)
/* 2E36C 8002D76C 3C10800F */  lui        $s0, %hi(memmaker_pointer)
/* 2E370 8002D770 3C05800E */  lui        $a1, %hi(D_800DA9E0)
/* 2E374 8002D774 24A5A9E0 */  addiu      $a1, $a1, %lo(D_800DA9E0)
/* 2E378 8002D778 8E04C610 */  lw         $a0, %lo(memmaker_pointer)($s0)
/* 2E37C 8002D77C 0C02600C */  jal        Free
/* 2E380 8002D780 24060070 */   addiu     $a2, $zero, 0x70
/* 2E384 8002D784 AE00C610 */  sw         $zero, -0x39f0($s0)
.L8002D788:
/* 2E388 8002D788 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2E38C 8002D78C 8FB00010 */  lw         $s0, 0x10($sp)
/* 2E390 8002D790 03E00008 */  jr         $ra
/* 2E394 8002D794 27BD0018 */   addiu     $sp, $sp, 0x18

glabel memmaker_func_A
/* 2E398 8002D798 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2E39C 8002D79C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2E3A0 8002D7A0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 2E3A4 8002D7A4 AFBF0058 */  sw         $ra, 0x58($sp)
/* 2E3A8 8002D7A8 AFB10054 */  sw         $s1, 0x54($sp)
/* 2E3AC 8002D7AC 14600019 */  bnez       $v1, .L8002D814
/* 2E3B0 8002D7B0 AFB00050 */   sw        $s0, 0x50($sp)
/* 2E3B4 8002D7B4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2E3B8 8002D7B8 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 2E3BC 8002D7BC 0C006F5F */  jal        func_8001BD7C
/* 2E3C0 8002D7C0 8E2415F8 */   lw        $a0, 0x15f8($s1)
/* 2E3C4 8002D7C4 00002821 */  addu       $a1, $zero, $zero
/* 2E3C8 8002D7C8 3C10800F */  lui        $s0, %hi(memmaker_pointer)
/* 2E3CC 8002D7CC 8E04C610 */  lw         $a0, %lo(memmaker_pointer)($s0)
/* 2E3D0 8002D7D0 0C026380 */  jal        Calloc
/* 2E3D4 8002D7D4 24060C00 */   addiu     $a2, $zero, 0xc00
/* 2E3D8 8002D7D8 8E04C610 */  lw         $a0, -0x39f0($s0)
/* 2E3DC 8002D7DC 0C00784D */  jal        memMaker_sub
/* 2E3E0 8002D7E0 27A50010 */   addiu     $a1, $sp, 0x10
/* 2E3E4 8002D7E4 27A40010 */  addiu      $a0, $sp, 0x10
/* 2E3E8 8002D7E8 0C00780D */  jal        func_8001E034
/* 2E3EC 8002D7EC 00002821 */   addu      $a1, $zero, $zero
/* 2E3F0 8002D7F0 0C008E2A */  jal        clear_DBs
/* 2E3F4 8002D7F4 00000000 */   nop
/* 2E3F8 8002D7F8 8E2415C0 */  lw         $a0, 0x15c0($s1)
/* 2E3FC 8002D7FC 10800003 */  beqz       $a0, .L8002D80C
/* 2E400 8002D800 00000000 */   nop
/* 2E404 8002D804 0C013C58 */  jal        func_8004F160
/* 2E408 8002D808 24050003 */   addiu     $a1, $zero, 3
.L8002D80C:
/* 2E40C 8002D80C 0C02336C */  jal        clear_common_romstrings
/* 2E410 8002D810 AE2015C0 */   sw        $zero, 0x15c0($s1)
.L8002D814:
/* 2E414 8002D814 8FBF0058 */  lw         $ra, 0x58($sp)
/* 2E418 8002D818 8FB10054 */  lw         $s1, 0x54($sp)
/* 2E41C 8002D81C 8FB00050 */  lw         $s0, 0x50($sp)
/* 2E420 8002D820 03E00008 */  jr         $ra
/* 2E424 8002D824 27BD0060 */   addiu     $sp, $sp, 0x60

glabel memmaker_func_B
/* 2E428 8002D828 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2E42C 8002D82C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2E430 8002D830 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 2E434 8002D834 AFBF0054 */  sw         $ra, 0x54($sp)
/* 2E438 8002D838 14600016 */  bnez       $v1, .L8002D894
/* 2E43C 8002D83C AFB00050 */   sw        $s0, 0x50($sp)
/* 2E440 8002D840 0C023310 */  jal        load_commonstrings
/* 2E444 8002D844 3C10800E */   lui       $s0, %hi(gGlobals)
/* 2E448 8002D848 24040028 */  addiu      $a0, $zero, 0x28
/* 2E44C 8002D84C 0C026259 */  jal        passToMalloc
/* 2E450 8002D850 261068A8 */   addiu     $s0, $s0, %lo(gGlobals)
/* 2E454 8002D854 8E051604 */  lw         $a1, 0x1604($s0)
/* 2E458 8002D858 0C013A61 */  jal        init_some_Struct
/* 2E45C 8002D85C 00402021 */   addu      $a0, $v0, $zero
/* 2E460 8002D860 0C008D8C */  jal        init_DBs
/* 2E464 8002D864 AE0215C0 */   sw        $v0, 0x15c0($s0)
/* 2E468 8002D868 3C10800F */  lui        $s0, %hi(memmaker_pointer)
/* 2E46C 8002D86C 8E04C610 */  lw         $a0, %lo(memmaker_pointer)($s0)
/* 2E470 8002D870 0C00784D */  jal        memMaker_sub
/* 2E474 8002D874 27A50010 */   addiu     $a1, $sp, 0x10
/* 2E478 8002D878 27A40010 */  addiu      $a0, $sp, 0x10
/* 2E47C 8002D87C 0C00785A */  jal        some_loadgame_func
/* 2E480 8002D880 00002821 */   addu      $a1, $zero, $zero
/* 2E484 8002D884 00002821 */  addu       $a1, $zero, $zero
/* 2E488 8002D888 8E04C610 */  lw         $a0, -0x39f0($s0)
/* 2E48C 8002D88C 0C026380 */  jal        Calloc
/* 2E490 8002D890 24060C00 */   addiu     $a2, $zero, 0xc00
.L8002D894:
/* 2E494 8002D894 8FBF0054 */  lw         $ra, 0x54($sp)
/* 2E498 8002D898 8FB00050 */  lw         $s0, 0x50($sp)
/* 2E49C 8002D89C 03E00008 */  jr         $ra
/* 2E4A0 8002D8A0 27BD0058 */   addiu     $sp, $sp, 0x58

glabel ofunc_noop
/* 2E4A4 8002D8A4 03E00008 */  jr         $ra
/* 2E4A8 8002D8A8 00000000 */   nop

glabel ofunc_noop_
/* 2E4AC 8002D8AC 03E00008 */  jr         $ra
/* 2E4B0 8002D8B0 00000000 */   nop
/* 2E4B4 8002D8B4 00000000 */  nop
/* 2E4B8 8002D8B8 00000000 */  nop
/* 2E4BC 8002D8BC 00000000 */  nop
