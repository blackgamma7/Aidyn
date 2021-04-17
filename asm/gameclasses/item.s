.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_temp_item
/* 7DEE0 8007D2E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7DEE4 8007D2E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7DEE8 8007D2E8 00808821 */  addu       $s1, $a0, $zero
/* 7DEEC 8007D2EC AFB00010 */  sw         $s0, 0x10($sp)
/* 7DEF0 8007D2F0 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7DEF4 8007D2F4 00002821 */  addu       $a1, $zero, $zero
/* 7DEF8 8007D2F8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7DEFC 8007D2FC 0C026380 */  jal        Calloc
/* 7DF00 8007D300 24060024 */   addiu     $a2, $zero, 0x24
/* 7DF04 8007D304 A6300000 */  sh         $s0, ($s1)
/* 7DF08 8007D308 00108202 */  srl        $s0, $s0, 8
/* 7DF0C 8007D30C 24020007 */  addiu      $v0, $zero, 7
/* 7DF10 8007D310 1202000E */  beq        $s0, $v0, .L8007D34C
/* 7DF14 8007D314 2A020008 */   slti      $v0, $s0, 8
/* 7DF18 8007D318 14400006 */  bnez       $v0, .L8007D334
/* 7DF1C 8007D31C 2A020005 */   slti      $v0, $s0, 5
/* 7DF20 8007D320 24020010 */  addiu      $v0, $zero, 0x10
/* 7DF24 8007D324 1202000D */  beq        $s0, $v0, .L8007D35C
/* 7DF28 8007D328 00000000 */   nop
/* 7DF2C 8007D32C 0801F4DB */  j          .L8007D36C
/* 7DF30 8007D330 00000000 */   nop
.L8007D334:
/* 7DF34 8007D334 1440000D */  bnez       $v0, .L8007D36C
/* 7DF38 8007D338 00000000 */   nop
/* 7DF3C 8007D33C 0C01F504 */  jal        make_temp_armor_2
/* 7DF40 8007D340 02202021 */   addu      $a0, $s1, $zero
/* 7DF44 8007D344 0801F4DE */  j          .L8007D378
/* 7DF48 8007D348 8FBF0018 */   lw        $ra, 0x18($sp)
.L8007D34C:
/* 7DF4C 8007D34C 0C01F549 */  jal        make_temp_weapon_2
/* 7DF50 8007D350 02202021 */   addu      $a0, $s1, $zero
/* 7DF54 8007D354 0801F4DE */  j          .L8007D378
/* 7DF58 8007D358 8FBF0018 */   lw        $ra, 0x18($sp)
.L8007D35C:
/* 7DF5C 8007D35C 0C01F5D7 */  jal        pass_to_make_temp_potion
/* 7DF60 8007D360 02202021 */   addu      $a0, $s1, $zero
/* 7DF64 8007D364 0801F4DE */  j          .L8007D378
/* 7DF68 8007D368 8FBF0018 */   lw        $ra, 0x18($sp)
.L8007D36C:
/* 7DF6C 8007D36C 0C01F58E */  jal        make_temp_gear_2
/* 7DF70 8007D370 02202021 */   addu      $a0, $s1, $zero
/* 7DF74 8007D374 8FBF0018 */  lw         $ra, 0x18($sp)
.L8007D378:
/* 7DF78 8007D378 8FB10014 */  lw         $s1, 0x14($sp)
/* 7DF7C 8007D37C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7DF80 8007D380 03E00008 */  jr         $ra
/* 7DF84 8007D384 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_weapon_effects
/* 7DF88 8007D388 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7DF8C 8007D38C AFB00010 */  sw         $s0, 0x10($sp)
/* 7DF90 8007D390 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7DF94 8007D394 0C01EF3A */  jal        clear_temp_Stat_spell
/* 7DF98 8007D398 00808021 */   addu      $s0, $a0, $zero
/* 7DF9C 8007D39C 8E040018 */  lw         $a0, 0x18($s0)
/* 7DFA0 8007D3A0 10800005 */  beqz       $a0, .L8007D3B8
/* 7DFA4 8007D3A4 3C05800E */   lui       $a1, %hi(D_800E0B00)
/* 7DFA8 8007D3A8 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7DFAC 8007D3AC 0C02600C */  jal        Free
/* 7DFB0 8007D3B0 2406004F */   addiu     $a2, $zero, 0x4f
/* 7DFB4 8007D3B4 AE000018 */  sw         $zero, 0x18($s0)
.L8007D3B8:
/* 7DFB8 8007D3B8 8E04001C */  lw         $a0, 0x1c($s0)
/* 7DFBC 8007D3BC 5080000A */  beql       $a0, $zero, .L8007D3E8
/* 7DFC0 8007D3C0 8E040020 */   lw        $a0, 0x20($s0)
/* 7DFC4 8007D3C4 0C021037 */  jal        func_800840DC
/* 7DFC8 8007D3C8 00000000 */   nop
/* 7DFCC 8007D3CC 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7DFD0 8007D3D0 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7DFD4 8007D3D4 8E04001C */  lw         $a0, 0x1c($s0)
/* 7DFD8 8007D3D8 0C02600C */  jal        Free
/* 7DFDC 8007D3DC 24060056 */   addiu     $a2, $zero, 0x56
/* 7DFE0 8007D3E0 AE00001C */  sw         $zero, 0x1c($s0)
/* 7DFE4 8007D3E4 8E040020 */  lw         $a0, 0x20($s0)
.L8007D3E8:
/* 7DFE8 8007D3E8 10800005 */  beqz       $a0, .L8007D400
/* 7DFEC 8007D3EC 3C05800E */   lui       $a1, %hi(D_800E0B00)
/* 7DFF0 8007D3F0 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7DFF4 8007D3F4 0C02600C */  jal        Free
/* 7DFF8 8007D3F8 2406005C */   addiu     $a2, $zero, 0x5c
/* 7DFFC 8007D3FC AE000020 */  sw         $zero, 0x20($s0)
.L8007D400:
/* 7E000 8007D400 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7E004 8007D404 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E008 8007D408 03E00008 */  jr         $ra
/* 7E00C 8007D40C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel make_temp_armor_2
/* 7E010 8007D410 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7E014 8007D414 AFB1001C */  sw         $s1, 0x1c($sp)
/* 7E018 8007D418 00808821 */  addu       $s1, $a0, $zero
/* 7E01C 8007D41C AFBF0024 */  sw         $ra, 0x24($sp)
/* 7E020 8007D420 AFB20020 */  sw         $s2, 0x20($sp)
/* 7E024 8007D424 AFB00018 */  sw         $s0, 0x18($sp)
/* 7E028 8007D428 0C01EF50 */  jal        make_temp_armor
/* 7E02C 8007D42C 96250000 */   lhu       $a1, ($s1)
/* 7E030 8007D430 00002821 */  addu       $a1, $zero, $zero
/* 7E034 8007D434 96240000 */  lhu        $a0, ($s1)
/* 7E038 8007D438 0C01D77A */  jal        GetIDIndex
/* 7E03C 8007D43C 00003021 */   addu      $a2, $zero, $zero
/* 7E040 8007D440 3C05800F */  lui        $a1, %hi(armour_pointer)
/* 7E044 8007D444 00021840 */  sll        $v1, $v0, 1
/* 7E048 8007D448 00621821 */  addu       $v1, $v1, $v0
/* 7E04C 8007D44C 00031880 */  sll        $v1, $v1, 2
/* 7E050 8007D450 8CA4F7B0 */  lw         $a0, %lo(armour_pointer)($a1)
/* 7E054 8007D454 00621821 */  addu       $v1, $v1, $v0
/* 7E058 8007D458 8C820004 */  lw         $v0, 4($a0)
/* 7E05C 8007D45C 00031880 */  sll        $v1, $v1, 2
/* 7E060 8007D460 00438021 */  addu       $s0, $v0, $v1
/* 7E064 8007D464 82040026 */  lb         $a0, 0x26($s0)
/* 7E068 8007D468 2412FFFF */  addiu      $s2, $zero, -1
/* 7E06C 8007D46C 1092000A */  beq        $a0, $s2, .L8007D498
/* 7E070 8007D470 3C05800E */   lui       $a1, %hi(D_800E0B00)
/* 7E074 8007D474 24040002 */  addiu      $a0, $zero, 2
/* 7E078 8007D478 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E07C 8007D47C 0C025F9C */  jal        Malloc
/* 7E080 8007D480 24060074 */   addiu     $a2, $zero, 0x74
/* 7E084 8007D484 AE220018 */  sw         $v0, 0x18($s1)
/* 7E088 8007D488 92050026 */  lbu        $a1, 0x26($s0)
/* 7E08C 8007D48C 82060027 */  lb         $a2, 0x27($s0)
/* 7E090 8007D490 0C020CC4 */  jal        set_2byte_array
/* 7E094 8007D494 00402021 */   addu      $a0, $v0, $zero
.L8007D498:
/* 7E098 8007D498 8202002B */  lb         $v0, 0x2b($s0)
/* 7E09C 8007D49C 1052000E */  beq        $v0, $s2, .L8007D4D8
/* 7E0A0 8007D4A0 24040018 */   addiu     $a0, $zero, 0x18
/* 7E0A4 8007D4A4 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E0A8 8007D4A8 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E0AC 8007D4AC 0C025F9C */  jal        Malloc
/* 7E0B0 8007D4B0 2406007B */   addiu     $a2, $zero, 0x7b
/* 7E0B4 8007D4B4 00402021 */  addu       $a0, $v0, $zero
/* 7E0B8 8007D4B8 AE22001C */  sw         $v0, 0x1c($s1)
/* 7E0BC 8007D4BC 9205002B */  lbu        $a1, 0x2b($s0)
/* 7E0C0 8007D4C0 9203002C */  lbu        $v1, 0x2c($s0)
/* 7E0C4 8007D4C4 2407FFFF */  addiu      $a3, $zero, -1
/* 7E0C8 8007D4C8 AFA00014 */  sw         $zero, 0x14($sp)
/* 7E0CC 8007D4CC 00603021 */  addu       $a2, $v1, $zero
/* 7E0D0 8007D4D0 0C021021 */  jal        CreateTempEnchant
/* 7E0D4 8007D4D4 AFA30010 */   sw        $v1, 0x10($sp)
.L8007D4D8:
/* 7E0D8 8007D4D8 9202002D */  lbu        $v0, 0x2d($s0)
/* 7E0DC 8007D4DC 1040000B */  beqz       $v0, .L8007D50C
/* 7E0E0 8007D4E0 24040008 */   addiu     $a0, $zero, 8
/* 7E0E4 8007D4E4 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E0E8 8007D4E8 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E0EC 8007D4EC 0C025F9C */  jal        Malloc
/* 7E0F0 8007D4F0 24060082 */   addiu     $a2, $zero, 0x82
/* 7E0F4 8007D4F4 AE220020 */  sw         $v0, 0x20($s1)
/* 7E0F8 8007D4F8 9203002D */  lbu        $v1, 0x2d($s0)
/* 7E0FC 8007D4FC A0430000 */  sb         $v1, ($v0)
/* 7E100 8007D500 8E220020 */  lw         $v0, 0x20($s1)
/* 7E104 8007D504 C6000030 */  lwc1       $f0, 0x30($s0)
/* 7E108 8007D508 E4400004 */  swc1       $f0, 4($v0)
.L8007D50C:
/* 7E10C 8007D50C 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7E110 8007D510 8FB20020 */  lw         $s2, 0x20($sp)
/* 7E114 8007D514 8FB1001C */  lw         $s1, 0x1c($sp)
/* 7E118 8007D518 8FB00018 */  lw         $s0, 0x18($sp)
/* 7E11C 8007D51C 03E00008 */  jr         $ra
/* 7E120 8007D520 27BD0028 */   addiu     $sp, $sp, 0x28

glabel make_temp_weapon_2
/* 7E124 8007D524 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7E128 8007D528 AFB1001C */  sw         $s1, 0x1c($sp)
/* 7E12C 8007D52C 00808821 */  addu       $s1, $a0, $zero
/* 7E130 8007D530 AFBF0024 */  sw         $ra, 0x24($sp)
/* 7E134 8007D534 AFB20020 */  sw         $s2, 0x20($sp)
/* 7E138 8007D538 AFB00018 */  sw         $s0, 0x18($sp)
/* 7E13C 8007D53C 0C01EF8E */  jal        make_temp_weapon
/* 7E140 8007D540 96250000 */   lhu       $a1, ($s1)
/* 7E144 8007D544 00002821 */  addu       $a1, $zero, $zero
/* 7E148 8007D548 96240000 */  lhu        $a0, ($s1)
/* 7E14C 8007D54C 0C01D77A */  jal        GetIDIndex
/* 7E150 8007D550 00003021 */   addu      $a2, $zero, $zero
/* 7E154 8007D554 3C05800F */  lui        $a1, %hi(weapon_pointer)
/* 7E158 8007D558 00021840 */  sll        $v1, $v0, 1
/* 7E15C 8007D55C 00621821 */  addu       $v1, $v1, $v0
/* 7E160 8007D560 00031880 */  sll        $v1, $v1, 2
/* 7E164 8007D564 8CA416F0 */  lw         $a0, %lo(weapon_pointer)($a1)
/* 7E168 8007D568 00621821 */  addu       $v1, $v1, $v0
/* 7E16C 8007D56C 8C820018 */  lw         $v0, 0x18($a0)
/* 7E170 8007D570 00031880 */  sll        $v1, $v1, 2
/* 7E174 8007D574 00438021 */  addu       $s0, $v0, $v1
/* 7E178 8007D578 82040026 */  lb         $a0, 0x26($s0)
/* 7E17C 8007D57C 2412FFFF */  addiu      $s2, $zero, -1
/* 7E180 8007D580 1092000A */  beq        $a0, $s2, .L8007D5AC
/* 7E184 8007D584 3C05800E */   lui       $a1, %hi(D_800E0B00)
/* 7E188 8007D588 24040002 */  addiu      $a0, $zero, 2
/* 7E18C 8007D58C 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E190 8007D590 0C025F9C */  jal        Malloc
/* 7E194 8007D594 2406009B */   addiu     $a2, $zero, 0x9b
/* 7E198 8007D598 AE220018 */  sw         $v0, 0x18($s1)
/* 7E19C 8007D59C 92050026 */  lbu        $a1, 0x26($s0)
/* 7E1A0 8007D5A0 82060027 */  lb         $a2, 0x27($s0)
/* 7E1A4 8007D5A4 0C020CC4 */  jal        set_2byte_array
/* 7E1A8 8007D5A8 00402021 */   addu      $a0, $v0, $zero
.L8007D5AC:
/* 7E1AC 8007D5AC 8202002B */  lb         $v0, 0x2b($s0)
/* 7E1B0 8007D5B0 1052000E */  beq        $v0, $s2, .L8007D5EC
/* 7E1B4 8007D5B4 24040018 */   addiu     $a0, $zero, 0x18
/* 7E1B8 8007D5B8 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E1BC 8007D5BC 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E1C0 8007D5C0 0C025F9C */  jal        Malloc
/* 7E1C4 8007D5C4 240600A2 */   addiu     $a2, $zero, 0xa2
/* 7E1C8 8007D5C8 00402021 */  addu       $a0, $v0, $zero
/* 7E1CC 8007D5CC AE22001C */  sw         $v0, 0x1c($s1)
/* 7E1D0 8007D5D0 9205002B */  lbu        $a1, 0x2b($s0)
/* 7E1D4 8007D5D4 9203002C */  lbu        $v1, 0x2c($s0)
/* 7E1D8 8007D5D8 2407FFFF */  addiu      $a3, $zero, -1
/* 7E1DC 8007D5DC AFA00014 */  sw         $zero, 0x14($sp)
/* 7E1E0 8007D5E0 00603021 */  addu       $a2, $v1, $zero
/* 7E1E4 8007D5E4 0C021021 */  jal        CreateTempEnchant
/* 7E1E8 8007D5E8 AFA30010 */   sw        $v1, 0x10($sp)
.L8007D5EC:
/* 7E1EC 8007D5EC 9202002D */  lbu        $v0, 0x2d($s0)
/* 7E1F0 8007D5F0 1040000B */  beqz       $v0, .L8007D620
/* 7E1F4 8007D5F4 24040008 */   addiu     $a0, $zero, 8
/* 7E1F8 8007D5F8 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E1FC 8007D5FC 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E200 8007D600 0C025F9C */  jal        Malloc
/* 7E204 8007D604 240600A9 */   addiu     $a2, $zero, 0xa9
/* 7E208 8007D608 AE220020 */  sw         $v0, 0x20($s1)
/* 7E20C 8007D60C 9203002D */  lbu        $v1, 0x2d($s0)
/* 7E210 8007D610 A0430000 */  sb         $v1, ($v0)
/* 7E214 8007D614 8E220020 */  lw         $v0, 0x20($s1)
/* 7E218 8007D618 C6000030 */  lwc1       $f0, 0x30($s0)
/* 7E21C 8007D61C E4400004 */  swc1       $f0, 4($v0)
.L8007D620:
/* 7E220 8007D620 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7E224 8007D624 8FB20020 */  lw         $s2, 0x20($sp)
/* 7E228 8007D628 8FB1001C */  lw         $s1, 0x1c($sp)
/* 7E22C 8007D62C 8FB00018 */  lw         $s0, 0x18($sp)
/* 7E230 8007D630 03E00008 */  jr         $ra
/* 7E234 8007D634 27BD0028 */   addiu     $sp, $sp, 0x28

glabel make_temp_gear_2
/* 7E238 8007D638 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7E23C 8007D63C AFB1001C */  sw         $s1, 0x1c($sp)
/* 7E240 8007D640 00808821 */  addu       $s1, $a0, $zero
/* 7E244 8007D644 AFBF0024 */  sw         $ra, 0x24($sp)
/* 7E248 8007D648 AFB20020 */  sw         $s2, 0x20($sp)
/* 7E24C 8007D64C AFB00018 */  sw         $s0, 0x18($sp)
/* 7E250 8007D650 0C01EFEB */  jal        make_temp_gear
/* 7E254 8007D654 96250000 */   lhu       $a1, ($s1)
/* 7E258 8007D658 0C01D7C6 */  jal        search_item_array
/* 7E25C 8007D65C 96240000 */   lhu       $a0, ($s1)
/* 7E260 8007D660 3C04800F */  lui        $a0, %hi(item_pointer)
/* 7E264 8007D664 00021840 */  sll        $v1, $v0, 1
/* 7E268 8007D668 8C8514F0 */  lw         $a1, %lo(item_pointer)($a0)
/* 7E26C 8007D66C 00621821 */  addu       $v1, $v1, $v0
/* 7E270 8007D670 8CA40018 */  lw         $a0, 0x18($a1)
/* 7E274 8007D674 00031900 */  sll        $v1, $v1, 4
/* 7E278 8007D678 00838021 */  addu       $s0, $a0, $v1
/* 7E27C 8007D67C 9202001A */  lbu        $v0, 0x1a($s0)
/* 7E280 8007D680 A2220014 */  sb         $v0, 0x14($s1)
/* 7E284 8007D684 9203001B */  lbu        $v1, 0x1b($s0)
/* 7E288 8007D688 A2230015 */  sb         $v1, 0x15($s1)
/* 7E28C 8007D68C 9202001D */  lbu        $v0, 0x1d($s0)
/* 7E290 8007D690 A2220016 */  sb         $v0, 0x16($s1)
/* 7E294 8007D694 9203001C */  lbu        $v1, 0x1c($s0)
/* 7E298 8007D698 A2230017 */  sb         $v1, 0x17($s1)
/* 7E29C 8007D69C 82020023 */  lb         $v0, 0x23($s0)
/* 7E2A0 8007D6A0 2412FFFF */  addiu      $s2, $zero, -1
/* 7E2A4 8007D6A4 1052000A */  beq        $v0, $s2, .L8007D6D0
/* 7E2A8 8007D6A8 3C05800E */   lui       $a1, %hi(D_800E0B00)
/* 7E2AC 8007D6AC 24040002 */  addiu      $a0, $zero, 2
/* 7E2B0 8007D6B0 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E2B4 8007D6B4 0C025F9C */  jal        Malloc
/* 7E2B8 8007D6B8 240600C6 */   addiu     $a2, $zero, 0xc6
/* 7E2BC 8007D6BC AE220018 */  sw         $v0, 0x18($s1)
/* 7E2C0 8007D6C0 92050023 */  lbu        $a1, 0x23($s0)
/* 7E2C4 8007D6C4 82060024 */  lb         $a2, 0x24($s0)
/* 7E2C8 8007D6C8 0C020CC4 */  jal        set_2byte_array
/* 7E2CC 8007D6CC 00402021 */   addu      $a0, $v0, $zero
.L8007D6D0:
/* 7E2D0 8007D6D0 82020028 */  lb         $v0, 0x28($s0)
/* 7E2D4 8007D6D4 1052000E */  beq        $v0, $s2, .L8007D710
/* 7E2D8 8007D6D8 24040018 */   addiu     $a0, $zero, 0x18
/* 7E2DC 8007D6DC 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E2E0 8007D6E0 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E2E4 8007D6E4 0C025F9C */  jal        Malloc
/* 7E2E8 8007D6E8 240600CD */   addiu     $a2, $zero, 0xcd
/* 7E2EC 8007D6EC 00402021 */  addu       $a0, $v0, $zero
/* 7E2F0 8007D6F0 AE22001C */  sw         $v0, 0x1c($s1)
/* 7E2F4 8007D6F4 92050028 */  lbu        $a1, 0x28($s0)
/* 7E2F8 8007D6F8 92030029 */  lbu        $v1, 0x29($s0)
/* 7E2FC 8007D6FC 2407FFFF */  addiu      $a3, $zero, -1
/* 7E300 8007D700 AFA00014 */  sw         $zero, 0x14($sp)
/* 7E304 8007D704 00603021 */  addu       $a2, $v1, $zero
/* 7E308 8007D708 0C021021 */  jal        CreateTempEnchant
/* 7E30C 8007D70C AFA30010 */   sw        $v1, 0x10($sp)
.L8007D710:
/* 7E310 8007D710 9202002A */  lbu        $v0, 0x2a($s0)
/* 7E314 8007D714 1040000B */  beqz       $v0, .L8007D744
/* 7E318 8007D718 24040008 */   addiu     $a0, $zero, 8
/* 7E31C 8007D71C 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E320 8007D720 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E324 8007D724 0C025F9C */  jal        Malloc
/* 7E328 8007D728 240600D4 */   addiu     $a2, $zero, 0xd4
/* 7E32C 8007D72C AE220020 */  sw         $v0, 0x20($s1)
/* 7E330 8007D730 9203002A */  lbu        $v1, 0x2a($s0)
/* 7E334 8007D734 A0430000 */  sb         $v1, ($v0)
/* 7E338 8007D738 8E220020 */  lw         $v0, 0x20($s1)
/* 7E33C 8007D73C C600002C */  lwc1       $f0, 0x2c($s0)
/* 7E340 8007D740 E4400004 */  swc1       $f0, 4($v0)
.L8007D744:
/* 7E344 8007D744 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7E348 8007D748 8FB20020 */  lw         $s2, 0x20($sp)
/* 7E34C 8007D74C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 7E350 8007D750 8FB00018 */  lw         $s0, 0x18($sp)
/* 7E354 8007D754 03E00008 */  jr         $ra
/* 7E358 8007D758 27BD0028 */   addiu     $sp, $sp, 0x28

glabel pass_to_make_temp_potion
/* 7E35C 8007D75C 94850000 */  lhu        $a1, ($a0)
/* 7E360 8007D760 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7E364 8007D764 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7E368 8007D768 0C01EFCC */  jal        make_temp_potion
/* 7E36C 8007D76C 00000000 */   nop
/* 7E370 8007D770 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7E374 8007D774 03E00008 */  jr         $ra
/* 7E378 8007D778 27BD0018 */   addiu     $sp, $sp, 0x18

glabel create_unknown_charsheet_struct
/* 7E37C 8007D77C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7E380 8007D780 AFB00010 */  sw         $s0, 0x10($sp)
/* 7E384 8007D784 00808021 */  addu       $s0, $a0, $zero
/* 7E388 8007D788 30A200FF */  andi       $v0, $a1, 0xff
/* 7E38C 8007D78C AFB10014 */  sw         $s1, 0x14($sp)
/* 7E390 8007D790 00028880 */  sll        $s1, $v0, 2
/* 7E394 8007D794 02202021 */  addu       $a0, $s1, $zero
/* 7E398 8007D798 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E39C 8007D79C 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E3A0 8007D7A0 240600F3 */  addiu      $a2, $zero, 0xf3
/* 7E3A4 8007D7A4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7E3A8 8007D7A8 A2000004 */  sb         $zero, 4($s0)
/* 7E3AC 8007D7AC 0C025F9C */  jal        Malloc
/* 7E3B0 8007D7B0 A2020005 */   sb        $v0, 5($s0)
/* 7E3B4 8007D7B4 00402021 */  addu       $a0, $v0, $zero
/* 7E3B8 8007D7B8 00002821 */  addu       $a1, $zero, $zero
/* 7E3BC 8007D7BC 02203021 */  addu       $a2, $s1, $zero
/* 7E3C0 8007D7C0 0C026380 */  jal        Calloc
/* 7E3C4 8007D7C4 AE020000 */   sw        $v0, ($s0)
/* 7E3C8 8007D7C8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7E3CC 8007D7CC 8FB10014 */  lw         $s1, 0x14($sp)
/* 7E3D0 8007D7D0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E3D4 8007D7D4 03E00008 */  jr         $ra
/* 7E3D8 8007D7D8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007D7DC
/* 7E3DC 8007D7DC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7E3E0 8007D7E0 AFB20018 */  sw         $s2, 0x18($sp)
/* 7E3E4 8007D7E4 00809021 */  addu       $s2, $a0, $zero
/* 7E3E8 8007D7E8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7E3EC 8007D7EC AFB3001C */  sw         $s3, 0x1c($sp)
/* 7E3F0 8007D7F0 AFB10014 */  sw         $s1, 0x14($sp)
/* 7E3F4 8007D7F4 AFB00010 */  sw         $s0, 0x10($sp)
/* 7E3F8 8007D7F8 8E420000 */  lw         $v0, ($s2)
/* 7E3FC 8007D7FC 1040001F */  beqz       $v0, .L8007D87C
/* 7E400 8007D800 00008821 */   addu      $s1, $zero, $zero
/* 7E404 8007D804 92420005 */  lbu        $v0, 5($s2)
/* 7E408 8007D808 10400017 */  beqz       $v0, .L8007D868
/* 7E40C 8007D80C 3C13800E */   lui       $s3, 0x800e
/* 7E410 8007D810 8E420000 */  lw         $v0, ($s2)
.L8007D814:
/* 7E414 8007D814 00118080 */  sll        $s0, $s1, 2
/* 7E418 8007D818 02021021 */  addu       $v0, $s0, $v0
/* 7E41C 8007D81C 8C440000 */  lw         $a0, ($v0)
/* 7E420 8007D820 5080000D */  beql       $a0, $zero, .L8007D858
/* 7E424 8007D824 92420005 */   lbu       $v0, 5($s2)
/* 7E428 8007D828 0C01F4E2 */  jal        clear_weapon_effects
/* 7E42C 8007D82C 00000000 */   nop
/* 7E430 8007D830 8E420000 */  lw         $v0, ($s2)
/* 7E434 8007D834 26650B00 */  addiu      $a1, $s3, 0xb00
/* 7E438 8007D838 02021021 */  addu       $v0, $s0, $v0
/* 7E43C 8007D83C 8C440000 */  lw         $a0, ($v0)
/* 7E440 8007D840 0C02600C */  jal        Free
/* 7E444 8007D844 2406010C */   addiu     $a2, $zero, 0x10c
/* 7E448 8007D848 8E420000 */  lw         $v0, ($s2)
/* 7E44C 8007D84C 02021021 */  addu       $v0, $s0, $v0
/* 7E450 8007D850 AC400000 */  sw         $zero, ($v0)
/* 7E454 8007D854 92420005 */  lbu        $v0, 5($s2)
.L8007D858:
/* 7E458 8007D858 26310001 */  addiu      $s1, $s1, 1
/* 7E45C 8007D85C 0222102B */  sltu       $v0, $s1, $v0
/* 7E460 8007D860 5440FFEC */  bnel       $v0, $zero, .L8007D814
/* 7E464 8007D864 8E420000 */   lw        $v0, ($s2)
.L8007D868:
/* 7E468 8007D868 26650B00 */  addiu      $a1, $s3, 0xb00
/* 7E46C 8007D86C 8E440000 */  lw         $a0, ($s2)
/* 7E470 8007D870 0C02600C */  jal        Free
/* 7E474 8007D874 24060111 */   addiu     $a2, $zero, 0x111
/* 7E478 8007D878 AE400000 */  sw         $zero, ($s2)
.L8007D87C:
/* 7E47C 8007D87C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7E480 8007D880 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7E484 8007D884 8FB20018 */  lw         $s2, 0x18($sp)
/* 7E488 8007D888 8FB10014 */  lw         $s1, 0x14($sp)
/* 7E48C 8007D88C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E490 8007D890 03E00008 */  jr         $ra
/* 7E494 8007D894 27BD0028 */   addiu     $sp, $sp, 0x28

glabel malloc_temp_gear
/* 7E498 8007D898 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7E49C 8007D89C AFB10014 */  sw         $s1, 0x14($sp)
/* 7E4A0 8007D8A0 00808821 */  addu       $s1, $a0, $zero
/* 7E4A4 8007D8A4 AFB20018 */  sw         $s2, 0x18($sp)
/* 7E4A8 8007D8A8 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 7E4AC 8007D8AC 02402821 */  addu       $a1, $s2, $zero
/* 7E4B0 8007D8B0 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7E4B4 8007D8B4 0C01F64E */  jal        func_8007D938
/* 7E4B8 8007D8B8 AFB00010 */   sw        $s0, 0x10($sp)
/* 7E4BC 8007D8BC 10400018 */  beqz       $v0, .L8007D920
/* 7E4C0 8007D8C0 00001021 */   addu      $v0, $zero, $zero
/* 7E4C4 8007D8C4 0C01F65F */  jal        func_8007D97C
/* 7E4C8 8007D8C8 02202021 */   addu      $a0, $s1, $zero
/* 7E4CC 8007D8CC 00408021 */  addu       $s0, $v0, $zero
/* 7E4D0 8007D8D0 2402FFFF */  addiu      $v0, $zero, -1
/* 7E4D4 8007D8D4 12020011 */  beq        $s0, $v0, .L8007D91C
/* 7E4D8 8007D8D8 24040024 */   addiu     $a0, $zero, 0x24
/* 7E4DC 8007D8DC 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E4E0 8007D8E0 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E4E4 8007D8E4 0C025F9C */  jal        Malloc
/* 7E4E8 8007D8E8 24060126 */   addiu     $a2, $zero, 0x126
/* 7E4EC 8007D8EC 00402021 */  addu       $a0, $v0, $zero
/* 7E4F0 8007D8F0 02402821 */  addu       $a1, $s2, $zero
/* 7E4F4 8007D8F4 8E260000 */  lw         $a2, ($s1)
/* 7E4F8 8007D8F8 00101880 */  sll        $v1, $s0, 2
/* 7E4FC 8007D8FC 00661821 */  addu       $v1, $v1, $a2
/* 7E500 8007D900 0C01F4B8 */  jal        make_temp_item
/* 7E504 8007D904 AC620000 */   sw        $v0, ($v1)
/* 7E508 8007D908 92230004 */  lbu        $v1, 4($s1)
/* 7E50C 8007D90C 24020001 */  addiu      $v0, $zero, 1
/* 7E510 8007D910 24630001 */  addiu      $v1, $v1, 1
/* 7E514 8007D914 0801F648 */  j          .L8007D920
/* 7E518 8007D918 A2230004 */   sb        $v1, 4($s1)
.L8007D91C:
/* 7E51C 8007D91C 00001021 */  addu       $v0, $zero, $zero
.L8007D920:
/* 7E520 8007D920 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7E524 8007D924 8FB20018 */  lw         $s2, 0x18($sp)
/* 7E528 8007D928 8FB10014 */  lw         $s1, 0x14($sp)
/* 7E52C 8007D92C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E530 8007D930 03E00008 */  jr         $ra
/* 7E534 8007D934 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007D938
/* 7E538 8007D938 8C820000 */  lw         $v0, ($a0)
/* 7E53C 8007D93C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7E540 8007D940 1040000A */  beqz       $v0, .L8007D96C
/* 7E544 8007D944 AFBF0010 */   sw        $ra, 0x10($sp)
/* 7E548 8007D948 90830004 */  lbu        $v1, 4($a0)
/* 7E54C 8007D94C 90820005 */  lbu        $v0, 5($a0)
/* 7E550 8007D950 50620007 */  beql       $v1, $v0, .L8007D970
/* 7E554 8007D954 00001021 */   addu      $v0, $zero, $zero
/* 7E558 8007D958 0C01F65F */  jal        func_8007D97C
/* 7E55C 8007D95C 00000000 */   nop
/* 7E560 8007D960 00021027 */  nor        $v0, $zero, $v0
/* 7E564 8007D964 0801F65C */  j          .L8007D970
/* 7E568 8007D968 0002102B */   sltu      $v0, $zero, $v0
.L8007D96C:
/* 7E56C 8007D96C 00001021 */  addu       $v0, $zero, $zero
.L8007D970:
/* 7E570 8007D970 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7E574 8007D974 03E00008 */  jr         $ra
/* 7E578 8007D978 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007D97C
/* 7E57C 8007D97C 90850005 */  lbu        $a1, 5($a0)
/* 7E580 8007D980 10A0000A */  beqz       $a1, .L8007D9AC
/* 7E584 8007D984 00001821 */   addu      $v1, $zero, $zero
/* 7E588 8007D988 8C840000 */  lw         $a0, ($a0)
.L8007D98C:
/* 7E58C 8007D98C 8C820000 */  lw         $v0, ($a0)
/* 7E590 8007D990 54400003 */  bnel       $v0, $zero, .L8007D9A0
/* 7E594 8007D994 24630001 */   addiu     $v1, $v1, 1
/* 7E598 8007D998 03E00008 */  jr         $ra
/* 7E59C 8007D99C 00601021 */   addu      $v0, $v1, $zero
.L8007D9A0:
/* 7E5A0 8007D9A0 0065102B */  sltu       $v0, $v1, $a1
/* 7E5A4 8007D9A4 1440FFF9 */  bnez       $v0, .L8007D98C
/* 7E5A8 8007D9A8 24840004 */   addiu     $a0, $a0, 4
.L8007D9AC:
/* 7E5AC 8007D9AC 03E00008 */  jr         $ra
/* 7E5B0 8007D9B0 2402FFFF */   addiu     $v0, $zero, -1

glabel func_8007D9B4
/* 7E5B4 8007D9B4 90820004 */  lbu        $v0, 4($a0)
/* 7E5B8 8007D9B8 14400005 */  bnez       $v0, .L8007D9D0
/* 7E5BC 8007D9BC 30A500FF */   andi      $a1, $a1, 0xff
/* 7E5C0 8007D9C0 03E00008 */  jr         $ra
/* 7E5C4 8007D9C4 00001021 */   addu      $v0, $zero, $zero
.L8007D9C8:
/* 7E5C8 8007D9C8 03E00008 */  jr         $ra
/* 7E5CC 8007D9CC 94620000 */   lhu       $v0, ($v1)
.L8007D9D0:
/* 7E5D0 8007D9D0 90820005 */  lbu        $v0, 5($a0)
/* 7E5D4 8007D9D4 10400011 */  beqz       $v0, .L8007DA1C
/* 7E5D8 8007D9D8 00003821 */   addu      $a3, $zero, $zero
/* 7E5DC 8007D9DC 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7E5E0 8007D9E0 00404021 */  addu       $t0, $v0, $zero
/* 7E5E4 8007D9E4 8C840000 */  lw         $a0, ($a0)
.L8007D9E8:
/* 7E5E8 8007D9E8 8C830000 */  lw         $v1, ($a0)
/* 7E5EC 8007D9EC 10600008 */  beqz       $v1, .L8007DA10
/* 7E5F0 8007D9F0 24E70001 */   addiu     $a3, $a3, 1
/* 7E5F4 8007D9F4 94620000 */  lhu        $v0, ($v1)
/* 7E5F8 8007D9F8 00021202 */  srl        $v0, $v0, 8
/* 7E5FC 8007D9FC 14450004 */  bne        $v0, $a1, .L8007DA10
/* 7E600 8007DA00 00000000 */   nop
/* 7E604 8007DA04 24C6FFFF */  addiu      $a2, $a2, -1
/* 7E608 8007DA08 10C0FFEF */  beqz       $a2, .L8007D9C8
/* 7E60C 8007DA0C 00000000 */   nop
.L8007DA10:
/* 7E610 8007DA10 00E8102B */  sltu       $v0, $a3, $t0
/* 7E614 8007DA14 1440FFF4 */  bnez       $v0, .L8007D9E8
/* 7E618 8007DA18 24840004 */   addiu     $a0, $a0, 4
.L8007DA1C:
/* 7E61C 8007DA1C 03E00008 */  jr         $ra
/* 7E620 8007DA20 00001021 */   addu      $v0, $zero, $zero

glabel func_8007DA24
/* 7E624 8007DA24 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7E628 8007DA28 AFB10014 */  sw         $s1, 0x14($sp)
/* 7E62C 8007DA2C 00808821 */  addu       $s1, $a0, $zero
/* 7E630 8007DA30 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7E634 8007DA34 AFB00010 */  sw         $s0, 0x10($sp)
/* 7E638 8007DA38 8E230000 */  lw         $v1, ($s1)
/* 7E63C 8007DA3C 10600015 */  beqz       $v1, .L8007DA94
/* 7E640 8007DA40 30A200FF */   andi      $v0, $a1, 0xff
/* 7E644 8007DA44 00028080 */  sll        $s0, $v0, 2
/* 7E648 8007DA48 02031021 */  addu       $v0, $s0, $v1
/* 7E64C 8007DA4C 8C440000 */  lw         $a0, ($v0)
/* 7E650 8007DA50 10800011 */  beqz       $a0, .L8007DA98
/* 7E654 8007DA54 8FBF0018 */   lw        $ra, 0x18($sp)
/* 7E658 8007DA58 0C01F4E2 */  jal        clear_weapon_effects
/* 7E65C 8007DA5C 00000000 */   nop
/* 7E660 8007DA60 3C05800E */  lui        $a1, %hi(D_800E0B00)
/* 7E664 8007DA64 8E220000 */  lw         $v0, ($s1)
/* 7E668 8007DA68 24A50B00 */  addiu      $a1, $a1, %lo(D_800E0B00)
/* 7E66C 8007DA6C 02021021 */  addu       $v0, $s0, $v0
/* 7E670 8007DA70 8C440000 */  lw         $a0, ($v0)
/* 7E674 8007DA74 0C02600C */  jal        Free
/* 7E678 8007DA78 24060185 */   addiu     $a2, $zero, 0x185
/* 7E67C 8007DA7C 8E220000 */  lw         $v0, ($s1)
/* 7E680 8007DA80 02021021 */  addu       $v0, $s0, $v0
/* 7E684 8007DA84 AC400000 */  sw         $zero, ($v0)
/* 7E688 8007DA88 92230004 */  lbu        $v1, 4($s1)
/* 7E68C 8007DA8C 2463FFFF */  addiu      $v1, $v1, -1
/* 7E690 8007DA90 A2230004 */  sb         $v1, 4($s1)
.L8007DA94:
/* 7E694 8007DA94 8FBF0018 */  lw         $ra, 0x18($sp)
.L8007DA98:
/* 7E698 8007DA98 8FB10014 */  lw         $s1, 0x14($sp)
/* 7E69C 8007DA9C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E6A0 8007DAA0 03E00008 */  jr         $ra
/* 7E6A4 8007DAA4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007DAA8
/* 7E6A8 8007DAA8 8C820000 */  lw         $v0, ($a0)
/* 7E6AC 8007DAAC 14400005 */  bnez       $v0, .L8007DAC4
/* 7E6B0 8007DAB0 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 7E6B4 8007DAB4 03E00008 */  jr         $ra
/* 7E6B8 8007DAB8 3402FFFF */   ori       $v0, $zero, 0xffff
.L8007DABC:
/* 7E6BC 8007DABC 03E00008 */  jr         $ra
/* 7E6C0 8007DAC0 00C01021 */   addu      $v0, $a2, $zero
.L8007DAC4:
/* 7E6C4 8007DAC4 90840005 */  lbu        $a0, 5($a0)
/* 7E6C8 8007DAC8 1080000E */  beqz       $a0, .L8007DB04
/* 7E6CC 8007DACC 00003021 */   addu      $a2, $zero, $zero
/* 7E6D0 8007DAD0 00403821 */  addu       $a3, $v0, $zero
/* 7E6D4 8007DAD4 00061080 */  sll        $v0, $a2, 2
.L8007DAD8:
/* 7E6D8 8007DAD8 00471021 */  addu       $v0, $v0, $a3
/* 7E6DC 8007DADC 8C420000 */  lw         $v0, ($v0)
/* 7E6E0 8007DAE0 50400004 */  beql       $v0, $zero, .L8007DAF4
/* 7E6E4 8007DAE4 24C20001 */   addiu     $v0, $a2, 1
/* 7E6E8 8007DAE8 94420000 */  lhu        $v0, ($v0)
/* 7E6EC 8007DAEC 1045FFF3 */  beq        $v0, $a1, .L8007DABC
/* 7E6F0 8007DAF0 24C20001 */   addiu     $v0, $a2, 1
.L8007DAF4:
/* 7E6F4 8007DAF4 304600FF */  andi       $a2, $v0, 0xff
/* 7E6F8 8007DAF8 00C4182B */  sltu       $v1, $a2, $a0
/* 7E6FC 8007DAFC 1460FFF6 */  bnez       $v1, .L8007DAD8
/* 7E700 8007DB00 00061080 */   sll       $v0, $a2, 2
.L8007DB04:
/* 7E704 8007DB04 03E00008 */  jr         $ra
/* 7E708 8007DB08 3402FFFF */   ori       $v0, $zero, 0xffff
/* 7E70C 8007DB0C 00000000 */  nop
