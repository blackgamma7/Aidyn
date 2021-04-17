.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_memUsedMirror
/* BF40 8000B340 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BF44 8000B344 AFBF0010 */  sw         $ra, 0x10($sp)
/* BF48 8000B348 0C02608C */  jal        get_memUsed
/* BF4C 8000B34C 00000000 */   nop
/* BF50 8000B350 8FBF0010 */  lw         $ra, 0x10($sp)
/* BF54 8000B354 3C03800F */  lui        $v1, %hi(memUsedMirror)
/* BF58 8000B358 AC628D8C */  sw         $v0, %lo(memUsedMirror)($v1)
/* BF5C 8000B35C 03E00008 */  jr         $ra
/* BF60 8000B360 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Ofunc_get_MemUsed_difference
/* BF64 8000B364 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BF68 8000B368 AFB00010 */  sw         $s0, 0x10($sp)
/* BF6C 8000B36C 3C10800F */  lui        $s0, %hi(memUsedMirror)
/* BF70 8000B370 AFB10014 */  sw         $s1, 0x14($sp)
/* BF74 8000B374 8E118D8C */  lw         $s1, %lo(memUsedMirror)($s0)
/* BF78 8000B378 AFBF0018 */  sw         $ra, 0x18($sp)
/* BF7C 8000B37C 0C002CD0 */  jal        set_memUsedMirror
/* BF80 8000B380 00000000 */   nop
/* BF84 8000B384 8E028D8C */  lw         $v0, -0x7274($s0)
/* BF88 8000B388 8FBF0018 */  lw         $ra, 0x18($sp)
/* BF8C 8000B38C 8FB00010 */  lw         $s0, 0x10($sp)
/* BF90 8000B390 02221023 */  subu       $v0, $s1, $v0
/* BF94 8000B394 8FB10014 */  lw         $s1, 0x14($sp)
/* BF98 8000B398 03E00008 */  jr         $ra
/* BF9C 8000B39C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel Ofunc_get_MemUsed_difference_2
/* BFA0 8000B3A0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BFA4 8000B3A4 AFB00010 */  sw         $s0, 0x10($sp)
/* BFA8 8000B3A8 3C10800F */  lui        $s0, %hi(memUsedMirror)
/* BFAC 8000B3AC AFB10014 */  sw         $s1, 0x14($sp)
/* BFB0 8000B3B0 8E118D8C */  lw         $s1, %lo(memUsedMirror)($s0)
/* BFB4 8000B3B4 AFBF0018 */  sw         $ra, 0x18($sp)
/* BFB8 8000B3B8 0C002CD0 */  jal        set_memUsedMirror
/* BFBC 8000B3BC 00000000 */   nop
/* BFC0 8000B3C0 8E028D8C */  lw         $v0, -0x7274($s0)
/* BFC4 8000B3C4 8FBF0018 */  lw         $ra, 0x18($sp)
/* BFC8 8000B3C8 8FB00010 */  lw         $s0, 0x10($sp)
/* BFCC 8000B3CC 00511023 */  subu       $v0, $v0, $s1
/* BFD0 8000B3D0 8FB10014 */  lw         $s1, 0x14($sp)
/* BFD4 8000B3D4 03E00008 */  jr         $ra
/* BFD8 8000B3D8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel rand_range
/* BFDC 8000B3DC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BFE0 8000B3E0 00801021 */  addu       $v0, $a0, $zero
/* BFE4 8000B3E4 00A03021 */  addu       $a2, $a1, $zero
/* BFE8 8000B3E8 10460005 */  beq        $v0, $a2, .L8000B400
/* BFEC 8000B3EC AFBF0010 */   sw        $ra, 0x10($sp)
/* BFF0 8000B3F0 3C04800E */  lui        $a0, %hi(gGlobals)
/* BFF4 8000B3F4 248468A8 */  addiu      $a0, $a0, %lo(gGlobals)
/* BFF8 8000B3F8 0C02734D */  jal        rand_func
/* BFFC 8000B3FC 00402821 */   addu      $a1, $v0, $zero
.L8000B400:
/* C000 8000B400 8FBF0010 */  lw         $ra, 0x10($sp)
/* C004 8000B404 03E00008 */  jr         $ra
/* C008 8000B408 27BD0018 */   addiu     $sp, $sp, 0x18

glabel RollD
/* C00C 8000B40C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C010 8000B410 AFB20018 */  sw         $s2, 0x18($sp)
/* C014 8000B414 00009021 */  addu       $s2, $zero, $zero
/* C018 8000B418 AFB00010 */  sw         $s0, 0x10($sp)
/* C01C 8000B41C 00008021 */  addu       $s0, $zero, $zero
/* C020 8000B420 AFB10014 */  sw         $s1, 0x14($sp)
/* C024 8000B424 309100FF */  andi       $s1, $a0, 0xff
/* C028 8000B428 AFB3001C */  sw         $s3, 0x1c($sp)
/* C02C 8000B42C 30B300FF */  andi       $s3, $a1, 0xff
/* C030 8000B430 1220000B */  beqz       $s1, .L8000B460
/* C034 8000B434 AFBF0020 */   sw        $ra, 0x20($sp)
/* C038 8000B438 24040001 */  addiu      $a0, $zero, 1
.L8000B43C:
/* C03C 8000B43C 0C002CF7 */  jal        rand_range
/* C040 8000B440 02602821 */   addu      $a1, $s3, $zero
/* C044 8000B444 02021021 */  addu       $v0, $s0, $v0
/* C048 8000B448 3050FFFF */  andi       $s0, $v0, 0xffff
/* C04C 8000B44C 26420001 */  addiu      $v0, $s2, 1
/* C050 8000B450 305200FF */  andi       $s2, $v0, 0xff
/* C054 8000B454 0251182B */  sltu       $v1, $s2, $s1
/* C058 8000B458 1460FFF8 */  bnez       $v1, .L8000B43C
/* C05C 8000B45C 24040001 */   addiu     $a0, $zero, 1
.L8000B460:
/* C060 8000B460 02001021 */  addu       $v0, $s0, $zero
/* C064 8000B464 8FBF0020 */  lw         $ra, 0x20($sp)
/* C068 8000B468 8FB3001C */  lw         $s3, 0x1c($sp)
/* C06C 8000B46C 8FB20018 */  lw         $s2, 0x18($sp)
/* C070 8000B470 8FB10014 */  lw         $s1, 0x14($sp)
/* C074 8000B474 8FB00010 */  lw         $s0, 0x10($sp)
/* C078 8000B478 03E00008 */  jr         $ra
/* C07C 8000B47C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_skillcheck_calc
/* C080 8000B480 00042400 */  sll        $a0, $a0, 0x10
/* C084 8000B484 00042403 */  sra        $a0, $a0, 0x10
/* C088 8000B488 24050015 */  addiu      $a1, $zero, 0x15
/* C08C 8000B48C 3C02800F */  lui        $v0, %hi(SkillCheckSteps)
/* C090 8000B490 24468D58 */  addiu      $a2, $v0, %lo(SkillCheckSteps)
.L8000B494:
/* C094 8000B494 10A00009 */  beqz       $a1, .L8000B4BC
/* C098 8000B498 24A20001 */   addiu     $v0, $a1, 1
/* C09C 8000B49C 24A2FFFF */  addiu      $v0, $a1, -1
/* C0A0 8000B4A0 304500FF */  andi       $a1, $v0, 0xff
/* C0A4 8000B4A4 00051840 */  sll        $v1, $a1, 1
/* C0A8 8000B4A8 00661821 */  addu       $v1, $v1, $a2
/* C0AC 8000B4AC 94620000 */  lhu        $v0, ($v1)
/* C0B0 8000B4B0 0082102A */  slt        $v0, $a0, $v0
/* C0B4 8000B4B4 1440FFF7 */  bnez       $v0, .L8000B494
/* C0B8 8000B4B8 24A20001 */   addiu     $v0, $a1, 1
.L8000B4BC:
/* C0BC 8000B4BC 03E00008 */  jr         $ra
/* C0C0 8000B4C0 304200FF */   andi      $v0, $v0, 0xff

glabel get_battle_terrain
/* C0C4 8000B4C4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C0C8 8000B4C8 AFB3001C */  sw         $s3, 0x1c($sp)
/* C0CC 8000B4CC 00809821 */  addu       $s3, $a0, $zero
/* C0D0 8000B4D0 AFB20018 */  sw         $s2, 0x18($sp)
/* C0D4 8000B4D4 3C12800F */  lui        $s2, %hi(gGlobalsText)
/* C0D8 8000B4D8 26448920 */  addiu      $a0, $s2, %lo(gGlobalsText)
/* C0DC 8000B4DC AFB10014 */  sw         $s1, 0x14($sp)
/* C0E0 8000B4E0 3C11800F */  lui        $s1, %hi(D_800E8D84)
/* C0E4 8000B4E4 AFB00010 */  sw         $s0, 0x10($sp)
/* C0E8 8000B4E8 3C10800F */  lui        $s0, %hi(D_800E8D88)
/* C0EC 8000B4EC 8E258D84 */  lw         $a1, %lo(D_800E8D84)($s1)
/* C0F0 8000B4F0 8E068D88 */  lw         $a2, %lo(D_800E8D88)($s0)
/* C0F4 8000B4F4 AFBF0020 */  sw         $ra, 0x20($sp)
/* C0F8 8000B4F8 0C0333AC */  jal        sprintf
/* C0FC 8000B4FC 240701E7 */   addiu     $a3, $zero, 0x1e7
/* C100 8000B500 3C03800F */  lui        $v1, %hi(TerrainPointer)
/* C104 8000B504 0C021380 */  jal        getTerrain
/* C108 8000B508 8C641BBC */   lw        $a0, %lo(TerrainPointer)($v1)
/* C10C 8000B50C 00401821 */  addu       $v1, $v0, $zero
/* C110 8000B510 2C62001C */  sltiu      $v0, $v1, 0x1c
/* C114 8000B514 10400072 */  beqz       $v0, .L8000B6E0
/* C118 8000B518 3C02800E */   lui       $v0, %hi(D_800D8200)
/* C11C 8000B51C 24428200 */  addiu      $v0, $v0, %lo(D_800D8200)
/* C120 8000B520 00031880 */  sll        $v1, $v1, 2
/* C124 8000B524 00621821 */  addu       $v1, $v1, $v0
/* C128 8000B528 8C640000 */  lw         $a0, ($v1)
/* C12C 8000B52C 00800008 */  jr         $a0
/* C130 8000B530 00000000 */   nop
/* C134 8000B534 24040006 */  addiu      $a0, $zero, 6
/* C138 8000B538 0C002CF7 */  jal        rand_range
/* C13C 8000B53C 24050007 */   addiu     $a1, $zero, 7
/* C140 8000B540 08002DB8 */  j          .L8000B6E0
/* C144 8000B544 A2620027 */   sb        $v0, 0x27($s3)
/* C148 8000B548 24040002 */  addiu      $a0, $zero, 2
/* C14C 8000B54C 0C002CF7 */  jal        rand_range
/* C150 8000B550 24050003 */   addiu     $a1, $zero, 3
/* C154 8000B554 08002DB8 */  j          .L8000B6E0
/* C158 8000B558 A2620027 */   sb        $v0, 0x27($s3)
/* C15C 8000B55C 00002021 */  addu       $a0, $zero, $zero
/* C160 8000B560 0C002CF7 */  jal        rand_range
/* C164 8000B564 24050001 */   addiu     $a1, $zero, 1
/* C168 8000B568 08002DB8 */  j          .L8000B6E0
/* C16C 8000B56C A2620027 */   sb        $v0, 0x27($s3)
/* C170 8000B570 2404000E */  addiu      $a0, $zero, 0xe
/* C174 8000B574 0C002CF7 */  jal        rand_range
/* C178 8000B578 2405000F */   addiu     $a1, $zero, 0xf
/* C17C 8000B57C 08002DB8 */  j          .L8000B6E0
/* C180 8000B580 A2620027 */   sb        $v0, 0x27($s3)
/* C184 8000B584 08002DB7 */  j          .L8000B6DC
/* C188 8000B588 24020013 */   addiu     $v0, $zero, 0x13
/* C18C 8000B58C 24040004 */  addiu      $a0, $zero, 4
/* C190 8000B590 0C002CF7 */  jal        rand_range
/* C194 8000B594 24050005 */   addiu     $a1, $zero, 5
/* C198 8000B598 08002DB8 */  j          .L8000B6E0
/* C19C 8000B59C A2620027 */   sb        $v0, 0x27($s3)
/* C1A0 8000B5A0 08002DB7 */  j          .L8000B6DC
/* C1A4 8000B5A4 24020012 */   addiu     $v0, $zero, 0x12
/* C1A8 8000B5A8 24040006 */  addiu      $a0, $zero, 6
/* C1AC 8000B5AC 0C002CF7 */  jal        rand_range
/* C1B0 8000B5B0 24050007 */   addiu     $a1, $zero, 7
/* C1B4 8000B5B4 08002DB8 */  j          .L8000B6E0
/* C1B8 8000B5B8 A2620027 */   sb        $v0, 0x27($s3)
/* C1BC 8000B5BC 2404000C */  addiu      $a0, $zero, 0xc
/* C1C0 8000B5C0 0C002CF7 */  jal        rand_range
/* C1C4 8000B5C4 2405000D */   addiu     $a1, $zero, 0xd
/* C1C8 8000B5C8 08002DB8 */  j          .L8000B6E0
/* C1CC 8000B5CC A2620027 */   sb        $v0, 0x27($s3)
/* C1D0 8000B5D0 08002DB7 */  j          .L8000B6DC
/* C1D4 8000B5D4 24020011 */   addiu     $v0, $zero, 0x11
/* C1D8 8000B5D8 08002DB7 */  j          .L8000B6DC
/* C1DC 8000B5DC 24020010 */   addiu     $v0, $zero, 0x10
/* C1E0 8000B5E0 08002DB7 */  j          .L8000B6DC
/* C1E4 8000B5E4 24020017 */   addiu     $v0, $zero, 0x17
/* C1E8 8000B5E8 08002DB7 */  j          .L8000B6DC
/* C1EC 8000B5EC 24020016 */   addiu     $v0, $zero, 0x16
/* C1F0 8000B5F0 08002DB7 */  j          .L8000B6DC
/* C1F4 8000B5F4 24020018 */   addiu     $v0, $zero, 0x18
/* C1F8 8000B5F8 08002DB7 */  j          .L8000B6DC
/* C1FC 8000B5FC 24020019 */   addiu     $v0, $zero, 0x19
/* C200 8000B600 08002DB7 */  j          .L8000B6DC
/* C204 8000B604 2402001A */   addiu     $v0, $zero, 0x1a
/* C208 8000B608 08002DB7 */  j          .L8000B6DC
/* C20C 8000B60C 24020014 */   addiu     $v0, $zero, 0x14
/* C210 8000B610 24040008 */  addiu      $a0, $zero, 8
/* C214 8000B614 0C002CF7 */  jal        rand_range
/* C218 8000B618 2405000B */   addiu     $a1, $zero, 0xb
/* C21C 8000B61C 08002DB8 */  j          .L8000B6E0
/* C220 8000B620 A2620027 */   sb        $v0, 0x27($s3)
/* C224 8000B624 24040001 */  addiu      $a0, $zero, 1
/* C228 8000B628 0C002D03 */  jal        RollD
/* C22C 8000B62C 24050002 */   addiu     $a1, $zero, 2
/* C230 8000B630 24030001 */  addiu      $v1, $zero, 1
/* C234 8000B634 14430006 */  bne        $v0, $v1, .L8000B650
/* C238 8000B638 24040008 */   addiu     $a0, $zero, 8
/* C23C 8000B63C 24040006 */  addiu      $a0, $zero, 6
/* C240 8000B640 0C002CF7 */  jal        rand_range
/* C244 8000B644 24050007 */   addiu     $a1, $zero, 7
/* C248 8000B648 08002DB8 */  j          .L8000B6E0
/* C24C 8000B64C A2620027 */   sb        $v0, 0x27($s3)
.L8000B650:
/* C250 8000B650 0C002CF7 */  jal        rand_range
/* C254 8000B654 2405000B */   addiu     $a1, $zero, 0xb
/* C258 8000B658 08002DB8 */  j          .L8000B6E0
/* C25C 8000B65C A2620027 */   sb        $v0, 0x27($s3)
/* C260 8000B660 24040001 */  addiu      $a0, $zero, 1
/* C264 8000B664 0C002D03 */  jal        RollD
/* C268 8000B668 24050002 */   addiu     $a1, $zero, 2
/* C26C 8000B66C 24030001 */  addiu      $v1, $zero, 1
/* C270 8000B670 14430006 */  bne        $v0, $v1, .L8000B68C
/* C274 8000B674 24040008 */   addiu     $a0, $zero, 8
/* C278 8000B678 24040002 */  addiu      $a0, $zero, 2
/* C27C 8000B67C 0C002CF7 */  jal        rand_range
/* C280 8000B680 24050003 */   addiu     $a1, $zero, 3
/* C284 8000B684 08002DB8 */  j          .L8000B6E0
/* C288 8000B688 A2620027 */   sb        $v0, 0x27($s3)
.L8000B68C:
/* C28C 8000B68C 0C002CF7 */  jal        rand_range
/* C290 8000B690 2405000B */   addiu     $a1, $zero, 0xb
/* C294 8000B694 08002DB8 */  j          .L8000B6E0
/* C298 8000B698 A2620027 */   sb        $v0, 0x27($s3)
/* C29C 8000B69C 24040001 */  addiu      $a0, $zero, 1
/* C2A0 8000B6A0 0C002D03 */  jal        RollD
/* C2A4 8000B6A4 24050002 */   addiu     $a1, $zero, 2
/* C2A8 8000B6A8 24030001 */  addiu      $v1, $zero, 1
/* C2AC 8000B6AC 14430006 */  bne        $v0, $v1, .L8000B6C8
/* C2B0 8000B6B0 24040008 */   addiu     $a0, $zero, 8
/* C2B4 8000B6B4 00002021 */  addu       $a0, $zero, $zero
/* C2B8 8000B6B8 0C002CF7 */  jal        rand_range
/* C2BC 8000B6BC 24050001 */   addiu     $a1, $zero, 1
/* C2C0 8000B6C0 08002DB8 */  j          .L8000B6E0
/* C2C4 8000B6C4 A2620027 */   sb        $v0, 0x27($s3)
.L8000B6C8:
/* C2C8 8000B6C8 0C002CF7 */  jal        rand_range
/* C2CC 8000B6CC 2405000B */   addiu     $a1, $zero, 0xb
/* C2D0 8000B6D0 08002DB8 */  j          .L8000B6E0
/* C2D4 8000B6D4 A2620027 */   sb        $v0, 0x27($s3)
/* C2D8 8000B6D8 2402001B */  addiu      $v0, $zero, 0x1b
.L8000B6DC:
/* C2DC 8000B6DC A2620027 */  sb         $v0, 0x27($s3)
.L8000B6E0:
/* C2E0 8000B6E0 26448920 */  addiu      $a0, $s2, -0x76e0
/* C2E4 8000B6E4 8E258D84 */  lw         $a1, -0x727c($s1)
/* C2E8 8000B6E8 8E068D88 */  lw         $a2, -0x7278($s0)
/* C2EC 8000B6EC 0C0333AC */  jal        sprintf
/* C2F0 8000B6F0 24070253 */   addiu     $a3, $zero, 0x253
/* C2F4 8000B6F4 8FBF0020 */  lw         $ra, 0x20($sp)
/* C2F8 8000B6F8 8FB3001C */  lw         $s3, 0x1c($sp)
/* C2FC 8000B6FC 8FB20018 */  lw         $s2, 0x18($sp)
/* C300 8000B700 8FB10014 */  lw         $s1, 0x14($sp)
/* C304 8000B704 8FB00010 */  lw         $s0, 0x10($sp)
/* C308 8000B708 03E00008 */  jr         $ra
/* C30C 8000B70C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_enemy_avg_lv
/* C310 8000B710 27BDFF78 */  addiu      $sp, $sp, -0x88
/* C314 8000B714 AFB40068 */  sw         $s4, 0x68($sp)
/* C318 8000B718 3094FFFF */  andi       $s4, $a0, 0xffff
/* C31C 8000B71C AFB20060 */  sw         $s2, 0x60($sp)
/* C320 8000B720 3C12800F */  lui        $s2, %hi(gGlobalsText)
/* C324 8000B724 AFB5006C */  sw         $s5, 0x6c($sp)
/* C328 8000B728 26558920 */  addiu      $s5, $s2, %lo(gGlobalsText)
/* C32C 8000B72C 02A02021 */  addu       $a0, $s5, $zero
/* C330 8000B730 AFB1005C */  sw         $s1, 0x5c($sp)
/* C334 8000B734 3C11800F */  lui        $s1, %hi(D_800E8D84)
/* C338 8000B738 AFB00058 */  sw         $s0, 0x58($sp)
/* C33C 8000B73C 3C10800F */  lui        $s0, %hi(D_800E8D88)
/* C340 8000B740 AFA5008C */  sw         $a1, 0x8c($sp)
/* C344 8000B744 8E258D84 */  lw         $a1, %lo(D_800E8D84)($s1)
/* C348 8000B748 8E068D88 */  lw         $a2, %lo(D_800E8D88)($s0)
/* C34C 8000B74C 24070258 */  addiu      $a3, $zero, 0x258
/* C350 8000B750 AFB60070 */  sw         $s6, 0x70($sp)
/* C354 8000B754 AFBF007C */  sw         $ra, 0x7c($sp)
/* C358 8000B758 AFBE0078 */  sw         $fp, 0x78($sp)
/* C35C 8000B75C AFB70074 */  sw         $s7, 0x74($sp)
/* C360 8000B760 AFB30064 */  sw         $s3, 0x64($sp)
/* C364 8000B764 F7B40080 */  sdc1       $f20, 0x80($sp)
/* C368 8000B768 0C0333AC */  jal        sprintf
/* C36C 8000B76C 0000B021 */   addu      $s6, $zero, $zero
/* C370 8000B770 8EA4F580 */  lw         $a0, -0xa80($s5)
/* C374 8000B774 0C01F959 */  jal        get_party_avg_lv
/* C378 8000B778 00009821 */   addu      $s3, $zero, $zero
/* C37C 8000B77C 02A02021 */  addu       $a0, $s5, $zero
/* C380 8000B780 24070259 */  addiu      $a3, $zero, 0x259
/* C384 8000B784 8E258D84 */  lw         $a1, -0x727c($s1)
/* C388 8000B788 8E068D88 */  lw         $a2, -0x7278($s0)
/* C38C 8000B78C 0C0333AC */  jal        sprintf
/* C390 8000B790 0040F021 */   addu      $fp, $v0, $zero
/* C394 8000B794 02A02021 */  addu       $a0, $s5, $zero
/* C398 8000B798 8E258D84 */  lw         $a1, -0x727c($s1)
/* C39C 8000B79C 8E068D88 */  lw         $a2, -0x7278($s0)
/* C3A0 8000B7A0 0C0333AC */  jal        sprintf
/* C3A4 8000B7A4 2407025A */   addiu     $a3, $zero, 0x25a
/* C3A8 8000B7A8 02A02021 */  addu       $a0, $s5, $zero
/* C3AC 8000B7AC 8E258D84 */  lw         $a1, -0x727c($s1)
/* C3B0 8000B7B0 8E068D88 */  lw         $a2, -0x7278($s0)
/* C3B4 8000B7B4 0C0333AC */  jal        sprintf
/* C3B8 8000B7B8 2407025B */   addiu     $a3, $zero, 0x25b
/* C3BC 8000B7BC 02A02021 */  addu       $a0, $s5, $zero
/* C3C0 8000B7C0 8E258D84 */  lw         $a1, -0x727c($s1)
/* C3C4 8000B7C4 8E068D88 */  lw         $a2, -0x7278($s0)
/* C3C8 8000B7C8 0C0333AC */  jal        sprintf
/* C3CC 8000B7CC 2407025E */   addiu     $a3, $zero, 0x25e
/* C3D0 8000B7D0 16800003 */  bnez       $s4, .L8000B7E0
/* C3D4 8000B7D4 02A02021 */   addu      $a0, $s5, $zero
/* C3D8 8000B7D8 08002F30 */  j          .L8000BCC0
/* C3DC 8000B7DC 00001021 */   addu      $v0, $zero, $zero
.L8000B7E0:
/* C3E0 8000B7E0 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C3E4 8000B7E4 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C3E8 8000B7E8 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C3EC 8000B7EC 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C3F0 8000B7F0 0C0333AC */  jal        sprintf
/* C3F4 8000B7F4 24070261 */   addiu     $a3, $zero, 0x261
/* C3F8 8000B7F8 12800024 */  beqz       $s4, .L8000B88C
/* C3FC 8000B7FC 3C02800F */   lui       $v0, 0x800f
/* C400 8000B800 02A09021 */  addu       $s2, $s5, $zero
/* C404 8000B804 3C15800F */  lui        $s5, %hi(D_800E8D84)
/* C408 8000B808 3C11800F */  lui        $s1, %hi(D_800E8D88)
/* C40C 8000B80C 3C17800F */  lui        $s7, 0x800f
.L8000B810:
/* C410 8000B810 02402021 */  addu       $a0, $s2, $zero
/* C414 8000B814 8EA58D84 */  lw         $a1, %lo(D_800E8D84)($s5)
/* C418 8000B818 8E268D88 */  lw         $a2, %lo(D_800E8D88)($s1)
/* C41C 8000B81C 0C0333AC */  jal        sprintf
/* C420 8000B820 24070263 */   addiu     $a3, $zero, 0x263
/* C424 8000B824 00002821 */  addu       $a1, $zero, $zero
/* C428 8000B828 00131040 */  sll        $v0, $s3, 1
/* C42C 8000B82C 3C03800E */  lui        $v1, %hi(encounter_dat)
/* C430 8000B830 24637C74 */  addiu      $v1, $v1, %lo(encounter_dat)
/* C434 8000B834 00621021 */  addu       $v0, $v1, $v0
/* C438 8000B838 94440000 */  lhu        $a0, ($v0)
/* C43C 8000B83C 0C01D77A */  jal        GetIDIndex
/* C440 8000B840 00003021 */   addu      $a2, $zero, $zero
/* C444 8000B844 02402021 */  addu       $a0, $s2, $zero
/* C448 8000B848 24070264 */  addiu      $a3, $zero, 0x264
/* C44C 8000B84C 8EA58D84 */  lw         $a1, -0x727c($s5)
/* C450 8000B850 8E268D88 */  lw         $a2, -0x7278($s1)
/* C454 8000B854 0C0333AC */  jal        sprintf
/* C458 8000B858 00408021 */   addu      $s0, $v0, $zero
/* C45C 8000B85C 8EE313A0 */  lw         $v1, 0x13a0($s7)
/* C460 8000B860 001081C0 */  sll        $s0, $s0, 7
/* C464 8000B864 8C620010 */  lw         $v0, 0x10($v1)
/* C468 8000B868 26630001 */  addiu      $v1, $s3, 1
/* C46C 8000B86C 3073FFFF */  andi       $s3, $v1, 0xffff
/* C470 8000B870 02028021 */  addu       $s0, $s0, $v0
/* C474 8000B874 9202001C */  lbu        $v0, 0x1c($s0)
/* C478 8000B878 0274182B */  sltu       $v1, $s3, $s4
/* C47C 8000B87C 02C21021 */  addu       $v0, $s6, $v0
/* C480 8000B880 1460FFE3 */  bnez       $v1, .L8000B810
/* C484 8000B884 3056FFFF */   andi      $s6, $v0, 0xffff
/* C488 8000B888 3C02800F */  lui        $v0, %hi(gGlobalsText)
.L8000B88C:
/* C48C 8000B88C 24508920 */  addiu      $s0, $v0, %lo(gGlobalsText)
/* C490 8000B890 02002021 */  addu       $a0, $s0, $zero
/* C494 8000B894 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* C498 8000B898 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* C49C 8000B89C 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* C4A0 8000B8A0 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* C4A4 8000B8A4 0C0333AC */  jal        sprintf
/* C4A8 8000B8A8 24070268 */   addiu     $a3, $zero, 0x268
/* C4AC 8000B8AC 02D4001B */  divu       $zero, $s6, $s4
/* C4B0 8000B8B0 00001812 */  mflo       $v1
/* C4B4 8000B8B4 52800001 */  beql       $s4, $zero, .L8000B8BC
/* C4B8 8000B8B8 000001CD */   break     0, 7
.L8000B8BC:
/* C4BC 8000B8BC 3076FFFF */   andi      $s6, $v1, 0xffff
/* C4C0 8000B8C0 02002021 */  addu       $a0, $s0, $zero
/* C4C4 8000B8C4 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C4C8 8000B8C8 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C4CC 8000B8CC 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C4D0 8000B8D0 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C4D4 8000B8D4 0C0333AC */  jal        sprintf
/* C4D8 8000B8D8 2407026B */   addiu     $a3, $zero, 0x26b
/* C4DC 8000B8DC 12C000F7 */  beqz       $s6, .L8000BCBC
/* C4E0 8000B8E0 02002021 */   addu      $a0, $s0, $zero
/* C4E4 8000B8E4 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C4E8 8000B8E8 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C4EC 8000B8EC 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C4F0 8000B8F0 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C4F4 8000B8F4 0C0333AC */  jal        sprintf
/* C4F8 8000B8F8 2407026E */   addiu     $a3, $zero, 0x26e
/* C4FC 8000B8FC 33C3FFFF */  andi       $v1, $fp, 0xffff
/* C500 8000B900 0076182B */  sltu       $v1, $v1, $s6
/* C504 8000B904 106000ED */  beqz       $v1, .L8000BCBC
/* C508 8000B908 02002021 */   addu      $a0, $s0, $zero
/* C50C 8000B90C 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C510 8000B910 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C514 8000B914 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C518 8000B918 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C51C 8000B91C 0C0333AC */  jal        sprintf
/* C520 8000B920 24070272 */   addiu     $a3, $zero, 0x272
/* C524 8000B924 3C01800E */  lui        $at, %hi(D_800D8280)
/* C528 8000B928 C4208280 */  lwc1       $f0, %lo(D_800D8280)($at)
/* C52C 8000B92C 449E1000 */  mtc1       $fp, $f2
/* C530 8000B930 468010A0 */  cvt.s.w    $f2, $f2
/* C534 8000B934 46001082 */  mul.s      $f2, $f2, $f0
/* C538 8000B938 44962000 */  mtc1       $s6, $f4
/* C53C 8000B93C 46802120 */  cvt.s.w    $f4, $f4
/* C540 8000B940 3C01800E */  lui        $at, %hi(D_800D8284)
/* C544 8000B944 C4268284 */  lwc1       $f6, %lo(D_800D8284)($at)
/* C548 8000B948 46041003 */  div.s      $f0, $f2, $f4
/* C54C 8000B94C 4600303E */  c.le.s     $f6, $f0
/* C550 8000B950 00000000 */  nop
/* C554 8000B954 45030005 */  bc1tl      .L8000B96C
/* C558 8000B958 46060001 */   sub.s     $f0, $f0, $f6
/* C55C 8000B95C 4600008D */  trunc.w.s  $f2, $f0
/* C560 8000B960 44101000 */  mfc1       $s0, $f2
/* C564 8000B964 08002E60 */  j          .L8000B980
/* C568 8000B968 3C03800F */   lui       $v1, 0x800f
.L8000B96C:
/* C56C 8000B96C 4600008D */  trunc.w.s  $f2, $f0
/* C570 8000B970 44101000 */  mfc1       $s0, $f2
/* C574 8000B974 3C028000 */  lui        $v0, 0x8000
/* C578 8000B978 02028025 */  or         $s0, $s0, $v0
/* C57C 8000B97C 3C03800F */  lui        $v1, %hi(gGlobalsText)
.L8000B980:
/* C580 8000B980 24718920 */  addiu      $s1, $v1, %lo(gGlobalsText)
/* C584 8000B984 02202021 */  addu       $a0, $s1, $zero
/* C588 8000B988 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C58C 8000B98C 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C590 8000B990 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C594 8000B994 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C598 8000B998 0C0333AC */  jal        sprintf
/* C59C 8000B99C 24070273 */   addiu     $a3, $zero, 0x273
/* C5A0 8000B9A0 02202021 */  addu       $a0, $s1, $zero
/* C5A4 8000B9A4 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C5A8 8000B9A8 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C5AC 8000B9AC 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C5B0 8000B9B0 3C03800E */  lui        $v1, %hi(D_800D8270)
/* C5B4 8000B9B4 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C5B8 8000B9B8 24628270 */  addiu      $v0, $v1, %lo(D_800D8270)
/* C5BC 8000B9BC 8C688270 */  lw         $t0, -0x7d90($v1)
/* C5C0 8000B9C0 8C490004 */  lw         $t1, 4($v0)
/* C5C4 8000B9C4 8C430008 */  lw         $v1, 8($v0)
/* C5C8 8000B9C8 8C4A000C */  lw         $t2, 0xc($v0)
/* C5CC 8000B9CC 24070274 */  addiu      $a3, $zero, 0x274
/* C5D0 8000B9D0 AFA80010 */  sw         $t0, 0x10($sp)
/* C5D4 8000B9D4 AFA90014 */  sw         $t1, 0x14($sp)
/* C5D8 8000B9D8 AFA30018 */  sw         $v1, 0x18($sp)
/* C5DC 8000B9DC 0C0333AC */  jal        sprintf
/* C5E0 8000B9E0 AFAA001C */   sw        $t2, 0x1c($sp)
/* C5E4 8000B9E4 02202021 */  addu       $a0, $s1, $zero
/* C5E8 8000B9E8 24070277 */  addiu      $a3, $zero, 0x277
/* C5EC 8000B9EC 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C5F0 8000B9F0 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C5F4 8000B9F4 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C5F8 8000B9F8 00101080 */  sll        $v0, $s0, 2
/* C5FC 8000B9FC 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C600 8000BA00 03A21821 */  addu       $v1, $sp, $v0
/* C604 8000BA04 0C0333AC */  jal        sprintf
/* C608 8000BA08 C4740010 */   lwc1      $f20, 0x10($v1)
/* C60C 8000BA0C 44800000 */  mtc1       $zero, $f0
/* C610 8000BA10 4600A032 */  c.eq.s     $f20, $f0
/* C614 8000BA14 00000000 */  nop
/* C618 8000BA18 450100A9 */  bc1t       .L8000BCC0
/* C61C 8000BA1C 02801021 */   addu      $v0, $s4, $zero
/* C620 8000BA20 02202021 */  addu       $a0, $s1, $zero
/* C624 8000BA24 2407027A */  addiu      $a3, $zero, 0x27a
/* C628 8000BA28 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C62C 8000BA2C 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C630 8000BA30 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C634 8000BA34 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C638 8000BA38 0C0333AC */  jal        sprintf
/* C63C 8000BA3C 00009821 */   addu      $s3, $zero, $zero
.L8000BA40:
/* C640 8000BA40 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C644 8000BA44 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C648 8000BA48 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C64C 8000BA4C 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C650 8000BA50 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C654 8000BA54 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C658 8000BA58 0C0333AC */  jal        sprintf
/* C65C 8000BA5C 2407027D */   addiu     $a3, $zero, 0x27d
/* C660 8000BA60 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C664 8000BA64 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C668 8000BA68 2407027E */  addiu      $a3, $zero, 0x27e
/* C66C 8000BA6C 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C670 8000BA70 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C674 8000BA74 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C678 8000BA78 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C67C 8000BA7C 8FA3008C */  lw         $v1, 0x8c($sp)
/* C680 8000BA80 00131080 */  sll        $v0, $s3, 2
/* C684 8000BA84 0C0333AC */  jal        sprintf
/* C688 8000BA88 0062F021 */   addu      $fp, $v1, $v0
/* C68C 8000BA8C 97C30000 */  lhu        $v1, ($fp)
/* C690 8000BA90 26730001 */  addiu      $s3, $s3, 1
/* C694 8000BA94 1060007D */  beqz       $v1, .L8000BC8C
/* C698 8000BA98 AFB30050 */   sw        $s3, 0x50($sp)
/* C69C 8000BA9C 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C6A0 8000BAA0 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C6A4 8000BAA4 24070281 */  addiu      $a3, $zero, 0x281
/* C6A8 8000BAA8 00009021 */  addu       $s2, $zero, $zero
/* C6AC 8000BAAC 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C6B0 8000BAB0 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C6B4 8000BAB4 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C6B8 8000BAB8 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C6BC 8000BABC 0C0333AC */  jal        sprintf
/* C6C0 8000BAC0 00008821 */   addu      $s1, $zero, $zero
/* C6C4 8000BAC4 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C6C8 8000BAC8 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C6CC 8000BACC 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C6D0 8000BAD0 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C6D4 8000BAD4 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C6D8 8000BAD8 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C6DC 8000BADC 0C0333AC */  jal        sprintf
/* C6E0 8000BAE0 24070284 */   addiu     $a3, $zero, 0x284
/* C6E4 8000BAE4 1280000D */  beqz       $s4, .L8000BB1C
/* C6E8 8000BAE8 00121040 */   sll       $v0, $s2, 1
/* C6EC 8000BAEC 97C40000 */  lhu        $a0, ($fp)
.L8000BAF0:
/* C6F0 8000BAF0 3C03800E */  lui        $v1, %hi(encounter_dat)
/* C6F4 8000BAF4 24637C74 */  addiu      $v1, $v1, %lo(encounter_dat)
/* C6F8 8000BAF8 00621021 */  addu       $v0, $v1, $v0
/* C6FC 8000BAFC 94430000 */  lhu        $v1, ($v0)
/* C700 8000BB00 50640001 */  beql       $v1, $a0, .L8000BB08
/* C704 8000BB04 26310001 */   addiu     $s1, $s1, 1
.L8000BB08:
/* C708 8000BB08 26420001 */  addiu      $v0, $s2, 1
/* C70C 8000BB0C 3052FFFF */  andi       $s2, $v0, 0xffff
/* C710 8000BB10 0254182B */  sltu       $v1, $s2, $s4
/* C714 8000BB14 1460FFF6 */  bnez       $v1, .L8000BAF0
/* C718 8000BB18 00121040 */   sll       $v0, $s2, 1
.L8000BB1C:
/* C71C 8000BB1C 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C720 8000BB20 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C724 8000BB24 2407028A */  addiu      $a3, $zero, 0x28a
/* C728 8000BB28 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C72C 8000BB2C 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C730 8000BB30 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C734 8000BB34 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C738 8000BB38 0C0333AC */  jal        sprintf
/* C73C 8000BB3C 00009021 */   addu      $s2, $zero, $zero
/* C740 8000BB40 44910000 */  mtc1       $s1, $f0
/* C744 8000BB44 46800020 */  cvt.s.w    $f0, $f0
/* C748 8000BB48 3C04800F */  lui        $a0, %hi(gGlobalsText)
/* C74C 8000BB4C 24848920 */  addiu      $a0, $a0, %lo(gGlobalsText)
/* C750 8000BB50 2407028C */  addiu      $a3, $zero, 0x28c
/* C754 8000BB54 46140002 */  mul.s      $f0, $f0, $f20
/* C758 8000BB58 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C75C 8000BB5C 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C760 8000BB60 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C764 8000BB64 4600008D */  trunc.w.s  $f2, $f0
/* C768 8000BB68 44111000 */  mfc1       $s1, $f2
/* C76C 8000BB6C 0C0333AC */  jal        sprintf
/* C770 8000BB70 8C668D88 */   lw        $a2, %lo(D_800E8D88)($v1)
/* C774 8000BB74 12800046 */  beqz       $s4, .L8000BC90
/* C778 8000BB78 8FA30050 */   lw        $v1, 0x50($sp)
/* C77C 8000BB7C 12200045 */  beqz       $s1, .L8000BC94
/* C780 8000BB80 3073FFFF */   andi      $s3, $v1, 0xffff
/* C784 8000BB84 3C13800F */  lui        $s3, %hi(gGlobalsText)
/* C788 8000BB88 26738920 */  addiu      $s3, $s3, %lo(gGlobalsText)
/* C78C 8000BB8C 3C16800F */  lui        $s6, 0x800f
/* C790 8000BB90 3C15800F */  lui        $s5, 0x800f
/* C794 8000BB94 02602021 */  addu       $a0, $s3, $zero
.L8000BB98:
/* C798 8000BB98 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* C79C 8000BB9C 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* C7A0 8000BBA0 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* C7A4 8000BBA4 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* C7A8 8000BBA8 0C0333AC */  jal        sprintf
/* C7AC 8000BBAC 2407028F */   addiu     $a3, $zero, 0x28f
/* C7B0 8000BBB0 00121840 */  sll        $v1, $s2, 1
/* C7B4 8000BBB4 3C02800E */  lui        $v0, %hi(encounter_dat)
/* C7B8 8000BBB8 24427C74 */  addiu      $v0, $v0, %lo(encounter_dat)
/* C7BC 8000BBBC 00438021 */  addu       $s0, $v0, $v1
/* C7C0 8000BBC0 96040000 */  lhu        $a0, ($s0)
/* C7C4 8000BBC4 97C20000 */  lhu        $v0, ($fp)
/* C7C8 8000BBC8 1482002A */  bne        $a0, $v0, .L8000BC74
/* C7CC 8000BBCC 26570001 */   addiu     $s7, $s2, 1
/* C7D0 8000BBD0 02602021 */  addu       $a0, $s3, $zero
/* C7D4 8000BBD4 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* C7D8 8000BBD8 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* C7DC 8000BBDC 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* C7E0 8000BBE0 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* C7E4 8000BBE4 0C0333AC */  jal        sprintf
/* C7E8 8000BBE8 24070293 */   addiu     $a3, $zero, 0x293
/* C7EC 8000BBEC 02401821 */  addu       $v1, $s2, $zero
/* C7F0 8000BBF0 2684FFFF */  addiu      $a0, $s4, -1
/* C7F4 8000BBF4 0064102B */  sltu       $v0, $v1, $a0
/* C7F8 8000BBF8 00809021 */  addu       $s2, $a0, $zero
/* C7FC 8000BBFC 10400008 */  beqz       $v0, .L8000BC20
/* C800 8000BC00 2631FFFF */   addiu     $s1, $s1, -1
/* C804 8000BC04 02002821 */  addu       $a1, $s0, $zero
.L8000BC08:
/* C808 8000BC08 94A20002 */  lhu        $v0, 2($a1)
/* C80C 8000BC0C 24630001 */  addiu      $v1, $v1, 1
/* C810 8000BC10 A4A20000 */  sh         $v0, ($a1)
/* C814 8000BC14 0064102B */  sltu       $v0, $v1, $a0
/* C818 8000BC18 1440FFFB */  bnez       $v0, .L8000BC08
/* C81C 8000BC1C 24A50002 */   addiu     $a1, $a1, 2
.L8000BC20:
/* C820 8000BC20 02602021 */  addu       $a0, $s3, $zero
/* C824 8000BC24 24070297 */  addiu      $a3, $zero, 0x297
/* C828 8000BC28 8EC58D84 */  lw         $a1, -0x727c($s6)
/* C82C 8000BC2C 8EA68D88 */  lw         $a2, -0x7278($s5)
/* C830 8000BC30 0C0333AC */  jal        sprintf
/* C834 8000BC34 3254FFFF */   andi      $s4, $s2, 0xffff
/* C838 8000BC38 02602021 */  addu       $a0, $s3, $zero
/* C83C 8000BC3C 8EC58D84 */  lw         $a1, -0x727c($s6)
/* C840 8000BC40 8EA68D88 */  lw         $a2, -0x7278($s5)
/* C844 8000BC44 0C0333AC */  jal        sprintf
/* C848 8000BC48 24070298 */   addiu     $a3, $zero, 0x298
/* C84C 8000BC4C 02602021 */  addu       $a0, $s3, $zero
/* C850 8000BC50 8EC58D84 */  lw         $a1, -0x727c($s6)
/* C854 8000BC54 8EA68D88 */  lw         $a2, -0x7278($s5)
/* C858 8000BC58 0C0333AC */  jal        sprintf
/* C85C 8000BC5C 2407029B */   addiu     $a3, $zero, 0x29b
/* C860 8000BC60 00141840 */  sll        $v1, $s4, 1
/* C864 8000BC64 3C02800E */  lui        $v0, %hi(encounter_dat)
/* C868 8000BC68 24427C74 */  addiu      $v0, $v0, %lo(encounter_dat)
/* C86C 8000BC6C 00431821 */  addu       $v1, $v0, $v1
/* C870 8000BC70 A4600000 */  sh         $zero, ($v1)
.L8000BC74:
/* C874 8000BC74 32F2FFFF */  andi       $s2, $s7, 0xffff
/* C878 8000BC78 0254102B */  sltu       $v0, $s2, $s4
/* C87C 8000BC7C 10400004 */  beqz       $v0, .L8000BC90
/* C880 8000BC80 8FA30050 */   lw        $v1, 0x50($sp)
/* C884 8000BC84 1620FFC4 */  bnez       $s1, .L8000BB98
/* C888 8000BC88 02602021 */   addu      $a0, $s3, $zero
.L8000BC8C:
/* C88C 8000BC8C 8FA30050 */  lw         $v1, 0x50($sp)
.L8000BC90:
/* C890 8000BC90 3073FFFF */  andi       $s3, $v1, 0xffff
.L8000BC94:
/* C894 8000BC94 2E620008 */  sltiu      $v0, $s3, 8
/* C898 8000BC98 1440FF69 */  bnez       $v0, .L8000BA40
/* C89C 8000BC9C 3C02800F */   lui       $v0, %hi(gGlobalsText)
/* C8A0 8000BCA0 24448920 */  addiu      $a0, $v0, %lo(gGlobalsText)
/* C8A4 8000BCA4 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* C8A8 8000BCA8 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* C8AC 8000BCAC 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* C8B0 8000BCB0 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* C8B4 8000BCB4 0C0333AC */  jal        sprintf
/* C8B8 8000BCB8 2407029F */   addiu     $a3, $zero, 0x29f
.L8000BCBC:
/* C8BC 8000BCBC 02801021 */  addu       $v0, $s4, $zero
.L8000BCC0:
/* C8C0 8000BCC0 8FBF007C */  lw         $ra, 0x7c($sp)
/* C8C4 8000BCC4 8FBE0078 */  lw         $fp, 0x78($sp)
/* C8C8 8000BCC8 8FB70074 */  lw         $s7, 0x74($sp)
/* C8CC 8000BCCC 8FB60070 */  lw         $s6, 0x70($sp)
/* C8D0 8000BCD0 8FB5006C */  lw         $s5, 0x6c($sp)
/* C8D4 8000BCD4 8FB40068 */  lw         $s4, 0x68($sp)
/* C8D8 8000BCD8 8FB30064 */  lw         $s3, 0x64($sp)
/* C8DC 8000BCDC 8FB20060 */  lw         $s2, 0x60($sp)
/* C8E0 8000BCE0 8FB1005C */  lw         $s1, 0x5c($sp)
/* C8E4 8000BCE4 8FB00058 */  lw         $s0, 0x58($sp)
/* C8E8 8000BCE8 D7B40080 */  ldc1       $f20, 0x80($sp)
/* C8EC 8000BCEC 03E00008 */  jr         $ra
/* C8F0 8000BCF0 27BD0088 */   addiu     $sp, $sp, 0x88

glabel add_to_enemy_encounters
/* C8F4 8000BCF4 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* C8F8 8000BCF8 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* C8FC 8000BCFC AFB20020 */  sw         $s2, 0x20($sp)
/* C900 8000BD00 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* C904 8000BD04 AFA40040 */  sw         $a0, 0x40($sp)
/* C908 8000BD08 02402021 */  addu       $a0, $s2, $zero
/* C90C 8000BD0C AFB1001C */  sw         $s1, 0x1c($sp)
/* C910 8000BD10 3C11800F */  lui        $s1, %hi(D_800E8D84)
/* C914 8000BD14 AFB00018 */  sw         $s0, 0x18($sp)
/* C918 8000BD18 3C10800F */  lui        $s0, %hi(D_800E8D88)
/* C91C 8000BD1C AFA50044 */  sw         $a1, 0x44($sp)
/* C920 8000BD20 8E258D84 */  lw         $a1, %lo(D_800E8D84)($s1)
/* C924 8000BD24 8E068D88 */  lw         $a2, %lo(D_800E8D88)($s0)
/* C928 8000BD28 240702A4 */  addiu      $a3, $zero, 0x2a4
/* C92C 8000BD2C AFB30024 */  sw         $s3, 0x24($sp)
/* C930 8000BD30 00009821 */  addu       $s3, $zero, $zero
/* C934 8000BD34 AFB60030 */  sw         $s6, 0x30($sp)
/* C938 8000BD38 0240B021 */  addu       $s6, $s2, $zero
/* C93C 8000BD3C AFBE0038 */  sw         $fp, 0x38($sp)
/* C940 8000BD40 0220F021 */  addu       $fp, $s1, $zero
/* C944 8000BD44 AFB70034 */  sw         $s7, 0x34($sp)
/* C948 8000BD48 0200B821 */  addu       $s7, $s0, $zero
/* C94C 8000BD4C AFBF003C */  sw         $ra, 0x3c($sp)
/* C950 8000BD50 AFB5002C */  sw         $s5, 0x2c($sp)
/* C954 8000BD54 AFB40028 */  sw         $s4, 0x28($sp)
/* C958 8000BD58 0C0333AC */  jal        sprintf
/* C95C 8000BD5C AFA00010 */   sw        $zero, 0x10($sp)
/* C960 8000BD60 02402021 */  addu       $a0, $s2, $zero
/* C964 8000BD64 8E258D84 */  lw         $a1, -0x727c($s1)
/* C968 8000BD68 8E068D88 */  lw         $a2, -0x7278($s0)
/* C96C 8000BD6C 0C0333AC */  jal        sprintf
/* C970 8000BD70 240702A6 */   addiu     $a3, $zero, 0x2a6
/* C974 8000BD74 8FB10044 */  lw         $s1, 0x44($sp)
.L8000BD78:
/* C978 8000BD78 02C02021 */  addu       $a0, $s6, $zero
/* C97C 8000BD7C 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* C980 8000BD80 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* C984 8000BD84 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* C988 8000BD88 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* C98C 8000BD8C 0C0333AC */  jal        sprintf
/* C990 8000BD90 240702A9 */   addiu     $a3, $zero, 0x2a9
/* C994 8000BD94 02C02021 */  addu       $a0, $s6, $zero
/* C998 8000BD98 3C08800F */  lui        $t0, %hi(D_800E8D84)
/* C99C 8000BD9C 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* C9A0 8000BDA0 8D058D84 */  lw         $a1, %lo(D_800E8D84)($t0)
/* C9A4 8000BDA4 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* C9A8 8000BDA8 0C0333AC */  jal        sprintf
/* C9AC 8000BDAC 240702AA */   addiu     $a3, $zero, 0x2aa
/* C9B0 8000BDB0 96230000 */  lhu        $v1, ($s1)
/* C9B4 8000BDB4 1060002D */  beqz       $v1, .L8000BE6C
/* C9B8 8000BDB8 02C02021 */   addu      $a0, $s6, $zero
/* C9BC 8000BDBC 8FC58D84 */  lw         $a1, -0x727c($fp)
/* C9C0 8000BDC0 8EE68D88 */  lw         $a2, -0x7278($s7)
/* C9C4 8000BDC4 0C0333AC */  jal        sprintf
/* C9C8 8000BDC8 240702AD */   addiu     $a3, $zero, 0x2ad
/* C9CC 8000BDCC 92230002 */  lbu        $v1, 2($s1)
/* C9D0 8000BDD0 10600026 */  beqz       $v1, .L8000BE6C
/* C9D4 8000BDD4 00008021 */   addu      $s0, $zero, $zero
/* C9D8 8000BDD8 02C09021 */  addu       $s2, $s6, $zero
/* C9DC 8000BDDC 3C15800F */  lui        $s5, %hi(D_800E8D84)
/* C9E0 8000BDE0 3C14800F */  lui        $s4, %hi(D_800E8D88)
/* C9E4 8000BDE4 02402021 */  addu       $a0, $s2, $zero
.L8000BDE8:
/* C9E8 8000BDE8 8EA58D84 */  lw         $a1, %lo(D_800E8D84)($s5)
/* C9EC 8000BDEC 8E868D88 */  lw         $a2, %lo(D_800E8D88)($s4)
/* C9F0 8000BDF0 0C0333AC */  jal        sprintf
/* C9F4 8000BDF4 240702B0 */   addiu     $a3, $zero, 0x2b0
/* C9F8 8000BDF8 02601821 */  addu       $v1, $s3, $zero
/* C9FC 8000BDFC 24620001 */  addiu      $v0, $v1, 1
/* CA00 8000BE00 3053FFFF */  andi       $s3, $v0, 0xffff
/* CA04 8000BE04 02402021 */  addu       $a0, $s2, $zero
/* CA08 8000BE08 240702B3 */  addiu      $a3, $zero, 0x2b3
/* CA0C 8000BE0C 00031840 */  sll        $v1, $v1, 1
/* CA10 8000BE10 8EA58D84 */  lw         $a1, -0x727c($s5)
/* CA14 8000BE14 8E868D88 */  lw         $a2, -0x7278($s4)
/* CA18 8000BE18 8FA80040 */  lw         $t0, 0x40($sp)
/* CA1C 8000BE1C 96220000 */  lhu        $v0, ($s1)
/* CA20 8000BE20 01031821 */  addu       $v1, $t0, $v1
/* CA24 8000BE24 0C0333AC */  jal        sprintf
/* CA28 8000BE28 A4620000 */   sh        $v0, ($v1)
/* CA2C 8000BE2C 8FA20044 */  lw         $v0, 0x44($sp)
/* CA30 8000BE30 9443002A */  lhu        $v1, 0x2a($v0)
/* CA34 8000BE34 0263182B */  sltu       $v1, $s3, $v1
/* CA38 8000BE38 10600018 */  beqz       $v1, .L8000BE9C
/* CA3C 8000BE3C 02402021 */   addu      $a0, $s2, $zero
/* CA40 8000BE40 8FC58D84 */  lw         $a1, -0x727c($fp)
/* CA44 8000BE44 8EE68D88 */  lw         $a2, -0x7278($s7)
/* CA48 8000BE48 0C0333AC */  jal        sprintf
/* CA4C 8000BE4C 240702B6 */   addiu     $a3, $zero, 0x2b6
/* CA50 8000BE50 2E63000C */  sltiu      $v1, $s3, 0xc
/* CA54 8000BE54 10600011 */  beqz       $v1, .L8000BE9C
/* CA58 8000BE58 26100001 */   addiu     $s0, $s0, 1
/* CA5C 8000BE5C 92220002 */  lbu        $v0, 2($s1)
/* CA60 8000BE60 0202102B */  sltu       $v0, $s0, $v0
/* CA64 8000BE64 1440FFE0 */  bnez       $v0, .L8000BDE8
/* CA68 8000BE68 02402021 */   addu      $a0, $s2, $zero
.L8000BE6C:
/* CA6C 8000BE6C 8FA30010 */  lw         $v1, 0x10($sp)
/* CA70 8000BE70 26310004 */  addiu      $s1, $s1, 4
/* CA74 8000BE74 24630001 */  addiu      $v1, $v1, 1
/* CA78 8000BE78 2C620008 */  sltiu      $v0, $v1, 8
/* CA7C 8000BE7C 1440FFBE */  bnez       $v0, .L8000BD78
/* CA80 8000BE80 AFA30010 */   sw        $v1, 0x10($sp)
/* CA84 8000BE84 3C08800F */  lui        $t0, %hi(gGlobalsText)
/* CA88 8000BE88 25048920 */  addiu      $a0, $t0, %lo(gGlobalsText)
/* CA8C 8000BE8C 8FC58D84 */  lw         $a1, -0x727c($fp)
/* CA90 8000BE90 8EE68D88 */  lw         $a2, -0x7278($s7)
/* CA94 8000BE94 0C0333AC */  jal        sprintf
/* CA98 8000BE98 240702BB */   addiu     $a3, $zero, 0x2bb
.L8000BE9C:
/* CA9C 8000BE9C 02601021 */  addu       $v0, $s3, $zero
/* CAA0 8000BEA0 8FBF003C */  lw         $ra, 0x3c($sp)
/* CAA4 8000BEA4 8FBE0038 */  lw         $fp, 0x38($sp)
/* CAA8 8000BEA8 8FB70034 */  lw         $s7, 0x34($sp)
/* CAAC 8000BEAC 8FB60030 */  lw         $s6, 0x30($sp)
/* CAB0 8000BEB0 8FB5002C */  lw         $s5, 0x2c($sp)
/* CAB4 8000BEB4 8FB40028 */  lw         $s4, 0x28($sp)
/* CAB8 8000BEB8 8FB30024 */  lw         $s3, 0x24($sp)
/* CABC 8000BEBC 8FB20020 */  lw         $s2, 0x20($sp)
/* CAC0 8000BEC0 8FB1001C */  lw         $s1, 0x1c($sp)
/* CAC4 8000BEC4 8FB00018 */  lw         $s0, 0x18($sp)
/* CAC8 8000BEC8 03E00008 */  jr         $ra
/* CACC 8000BECC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8000BED0
/* CAD0 8000BED0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* CAD4 8000BED4 AFB20020 */  sw         $s2, 0x20($sp)
/* CAD8 8000BED8 3C12800F */  lui        $s2, %hi(gGlobalsText)
/* CADC 8000BEDC AFB40028 */  sw         $s4, 0x28($sp)
/* CAE0 8000BEE0 26548920 */  addiu      $s4, $s2, %lo(gGlobalsText)
/* CAE4 8000BEE4 AFA40040 */  sw         $a0, 0x40($sp)
/* CAE8 8000BEE8 02802021 */  addu       $a0, $s4, $zero
/* CAEC 8000BEEC AFB1001C */  sw         $s1, 0x1c($sp)
/* CAF0 8000BEF0 3C11800F */  lui        $s1, %hi(D_800E8D84)
/* CAF4 8000BEF4 AFB00018 */  sw         $s0, 0x18($sp)
/* CAF8 8000BEF8 3C10800F */  lui        $s0, %hi(D_800E8D88)
/* CAFC 8000BEFC AFA50044 */  sw         $a1, 0x44($sp)
/* CB00 8000BF00 8E258D84 */  lw         $a1, %lo(D_800E8D84)($s1)
/* CB04 8000BF04 8E068D88 */  lw         $a2, %lo(D_800E8D88)($s0)
/* CB08 8000BF08 240702C0 */  addiu      $a3, $zero, 0x2c0
/* CB0C 8000BF0C AFBF003C */  sw         $ra, 0x3c($sp)
/* CB10 8000BF10 AFBE0038 */  sw         $fp, 0x38($sp)
/* CB14 8000BF14 AFB70034 */  sw         $s7, 0x34($sp)
/* CB18 8000BF18 AFB60030 */  sw         $s6, 0x30($sp)
/* CB1C 8000BF1C AFB5002C */  sw         $s5, 0x2c($sp)
/* CB20 8000BF20 0C0333AC */  jal        sprintf
/* CB24 8000BF24 AFB30024 */   sw        $s3, 0x24($sp)
/* CB28 8000BF28 8FA40040 */  lw         $a0, 0x40($sp)
/* CB2C 8000BF2C 0C002F3D */  jal        add_to_enemy_encounters
/* CB30 8000BF30 8FA50044 */   lw        $a1, 0x44($sp)
/* CB34 8000BF34 00409821 */  addu       $s3, $v0, $zero
/* CB38 8000BF38 02802021 */  addu       $a0, $s4, $zero
/* CB3C 8000BF3C 8E258D84 */  lw         $a1, -0x727c($s1)
/* CB40 8000BF40 8E068D88 */  lw         $a2, -0x7278($s0)
/* CB44 8000BF44 0C0333AC */  jal        sprintf
/* CB48 8000BF48 240702C3 */   addiu     $a3, $zero, 0x2c3
/* CB4C 8000BF4C 8FA20044 */  lw         $v0, 0x44($sp)
/* CB50 8000BF50 9443002A */  lhu        $v1, 0x2a($v0)
/* CB54 8000BF54 0263182B */  sltu       $v1, $s3, $v1
/* CB58 8000BF58 14600003 */  bnez       $v1, .L8000BF68
/* CB5C 8000BF5C 0200F021 */   addu      $fp, $s0, $zero
/* CB60 8000BF60 0800305C */  j          .L8000C170
/* CB64 8000BF64 9442002A */   lhu       $v0, 0x2a($v0)
.L8000BF68:
/* CB68 8000BF68 02802021 */  addu       $a0, $s4, $zero
/* CB6C 8000BF6C 240702C6 */  addiu      $a3, $zero, 0x2c6
/* CB70 8000BF70 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* CB74 8000BF74 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* CB78 8000BF78 AFA00010 */  sw         $zero, 0x10($sp)
/* CB7C 8000BF7C 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CB80 8000BF80 0C0333AC */  jal        sprintf
/* CB84 8000BF84 0280B821 */   addu      $s7, $s4, $zero
/* CB88 8000BF88 02802021 */  addu       $a0, $s4, $zero
/* CB8C 8000BF8C 3C08800F */  lui        $t0, %hi(D_800E8D84)
/* CB90 8000BF90 8D058D84 */  lw         $a1, %lo(D_800E8D84)($t0)
/* CB94 8000BF94 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CB98 8000BF98 0C0333AC */  jal        sprintf
/* CB9C 8000BF9C 240702C7 */   addiu     $a3, $zero, 0x2c7
.L8000BFA0:
/* CBA0 8000BFA0 02E02021 */  addu       $a0, $s7, $zero
/* CBA4 8000BFA4 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* CBA8 8000BFA8 3C03800F */  lui        $v1, %hi(D_800E8D88)
/* CBAC 8000BFAC 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* CBB0 8000BFB0 8C668D88 */  lw         $a2, %lo(D_800E8D88)($v1)
/* CBB4 8000BFB4 0C0333AC */  jal        sprintf
/* CBB8 8000BFB8 240702CA */   addiu     $a3, $zero, 0x2ca
/* CBBC 8000BFBC 02E02021 */  addu       $a0, $s7, $zero
/* CBC0 8000BFC0 240702CB */  addiu      $a3, $zero, 0x2cb
/* CBC4 8000BFC4 3C08800F */  lui        $t0, %hi(D_800E8D84)
/* CBC8 8000BFC8 3C02800F */  lui        $v0, %hi(D_800E8D88)
/* CBCC 8000BFCC 8D058D84 */  lw         $a1, %lo(D_800E8D84)($t0)
/* CBD0 8000BFD0 8C468D88 */  lw         $a2, %lo(D_800E8D88)($v0)
/* CBD4 8000BFD4 8FA30010 */  lw         $v1, 0x10($sp)
/* CBD8 8000BFD8 8FA80044 */  lw         $t0, 0x44($sp)
/* CBDC 8000BFDC 00031080 */  sll        $v0, $v1, 2
/* CBE0 8000BFE0 0C0333AC */  jal        sprintf
/* CBE4 8000BFE4 01028821 */   addu      $s1, $t0, $v0
/* CBE8 8000BFE8 96230000 */  lhu        $v1, ($s1)
/* CBEC 8000BFEC 10600046 */  beqz       $v1, .L8000C108
/* CBF0 8000BFF0 02E02021 */   addu      $a0, $s7, $zero
/* CBF4 8000BFF4 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* CBF8 8000BFF8 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* CBFC 8000BFFC 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CC00 8000C000 0C0333AC */  jal        sprintf
/* CC04 8000C004 240702CE */   addiu     $a3, $zero, 0x2ce
/* CC08 8000C008 92230002 */  lbu        $v1, 2($s1)
/* CC0C 8000C00C 92220003 */  lbu        $v0, 3($s1)
/* CC10 8000C010 0062182B */  sltu       $v1, $v1, $v0
/* CC14 8000C014 1060003C */  beqz       $v1, .L8000C108
/* CC18 8000C018 02E02021 */   addu      $a0, $s7, $zero
/* CC1C 8000C01C 240702D1 */  addiu      $a3, $zero, 0x2d1
/* CC20 8000C020 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* CC24 8000C024 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* CC28 8000C028 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CC2C 8000C02C 0C0333AC */  jal        sprintf
/* CC30 8000C030 00009021 */   addu      $s2, $zero, $zero
/* CC34 8000C034 92250003 */  lbu        $a1, 3($s1)
/* CC38 8000C038 92220002 */  lbu        $v0, 2($s1)
/* CC3C 8000C03C 00002021 */  addu       $a0, $zero, $zero
/* CC40 8000C040 0C002CF7 */  jal        rand_range
/* CC44 8000C044 00A22823 */   subu      $a1, $a1, $v0
/* CC48 8000C048 02E02021 */  addu       $a0, $s7, $zero
/* CC4C 8000C04C 240702D4 */  addiu      $a3, $zero, 0x2d4
/* CC50 8000C050 3C08800F */  lui        $t0, %hi(D_800E8D84)
/* CC54 8000C054 8D058D84 */  lw         $a1, %lo(D_800E8D84)($t0)
/* CC58 8000C058 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CC5C 8000C05C 0C0333AC */  jal        sprintf
/* CC60 8000C060 305000FF */   andi      $s0, $v0, 0xff
/* CC64 8000C064 3210FFFF */  andi       $s0, $s0, 0xffff
/* CC68 8000C068 12000028 */  beqz       $s0, .L8000C10C
/* CC6C 8000C06C 8FA80010 */   lw        $t0, 0x10($sp)
/* CC70 8000C070 02E0A021 */  addu       $s4, $s7, $zero
/* CC74 8000C074 3C16800F */  lui        $s6, %hi(D_800E8D84)
/* CC78 8000C078 3C15800F */  lui        $s5, %hi(D_800E8D88)
/* CC7C 8000C07C 02802021 */  addu       $a0, $s4, $zero
.L8000C080:
/* CC80 8000C080 8EC58D84 */  lw         $a1, %lo(D_800E8D84)($s6)
/* CC84 8000C084 8EA68D88 */  lw         $a2, %lo(D_800E8D88)($s5)
/* CC88 8000C088 0C0333AC */  jal        sprintf
/* CC8C 8000C08C 240702D6 */   addiu     $a3, $zero, 0x2d6
/* CC90 8000C090 02601821 */  addu       $v1, $s3, $zero
/* CC94 8000C094 24620001 */  addiu      $v0, $v1, 1
/* CC98 8000C098 3053FFFF */  andi       $s3, $v0, 0xffff
/* CC9C 8000C09C 02802021 */  addu       $a0, $s4, $zero
/* CCA0 8000C0A0 240702D9 */  addiu      $a3, $zero, 0x2d9
/* CCA4 8000C0A4 00031840 */  sll        $v1, $v1, 1
/* CCA8 8000C0A8 8EC58D84 */  lw         $a1, -0x727c($s6)
/* CCAC 8000C0AC 8EA68D88 */  lw         $a2, -0x7278($s5)
/* CCB0 8000C0B0 8FA80040 */  lw         $t0, 0x40($sp)
/* CCB4 8000C0B4 96220000 */  lhu        $v0, ($s1)
/* CCB8 8000C0B8 01031821 */  addu       $v1, $t0, $v1
/* CCBC 8000C0BC 0C0333AC */  jal        sprintf
/* CCC0 8000C0C0 A4620000 */   sh        $v0, ($v1)
/* CCC4 8000C0C4 8FA20044 */  lw         $v0, 0x44($sp)
/* CCC8 8000C0C8 9443002A */  lhu        $v1, 0x2a($v0)
/* CCCC 8000C0CC 0263182B */  sltu       $v1, $s3, $v1
/* CCD0 8000C0D0 10600026 */  beqz       $v1, .L8000C16C
/* CCD4 8000C0D4 02802021 */   addu      $a0, $s4, $zero
/* CCD8 8000C0D8 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* CCDC 8000C0DC 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* CCE0 8000C0E0 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CCE4 8000C0E4 0C0333AC */  jal        sprintf
/* CCE8 8000C0E8 240702DA */   addiu     $a3, $zero, 0x2da
/* CCEC 8000C0EC 2E63000C */  sltiu      $v1, $s3, 0xc
/* CCF0 8000C0F0 1060001E */  beqz       $v1, .L8000C16C
/* CCF4 8000C0F4 26420001 */   addiu     $v0, $s2, 1
/* CCF8 8000C0F8 3052FFFF */  andi       $s2, $v0, 0xffff
/* CCFC 8000C0FC 0250182B */  sltu       $v1, $s2, $s0
/* CD00 8000C100 1460FFDF */  bnez       $v1, .L8000C080
/* CD04 8000C104 02802021 */   addu      $a0, $s4, $zero
.L8000C108:
/* CD08 8000C108 8FA80010 */  lw         $t0, 0x10($sp)
.L8000C10C:
/* CD0C 8000C10C 25020001 */  addiu      $v0, $t0, 1
/* CD10 8000C110 3042FFFF */  andi       $v0, $v0, 0xffff
/* CD14 8000C114 2C430008 */  sltiu      $v1, $v0, 8
/* CD18 8000C118 1460FFA1 */  bnez       $v1, .L8000BFA0
/* CD1C 8000C11C AFA20010 */   sw        $v0, 0x10($sp)
/* CD20 8000C120 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* CD24 8000C124 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* CD28 8000C128 02402021 */  addu       $a0, $s2, $zero
/* CD2C 8000C12C 3C03800F */  lui        $v1, %hi(D_800E8D84)
/* CD30 8000C130 8C658D84 */  lw         $a1, %lo(D_800E8D84)($v1)
/* CD34 8000C134 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CD38 8000C138 0C0333AC */  jal        sprintf
/* CD3C 8000C13C 240702DF */   addiu     $a3, $zero, 0x2df
/* CD40 8000C140 8FA80044 */  lw         $t0, 0x44($sp)
/* CD44 8000C144 95030028 */  lhu        $v1, 0x28($t0)
/* CD48 8000C148 0263182B */  sltu       $v1, $s3, $v1
/* CD4C 8000C14C 54600008 */  bnel       $v1, $zero, .L8000C170
/* CD50 8000C150 00001021 */   addu      $v0, $zero, $zero
/* CD54 8000C154 02402021 */  addu       $a0, $s2, $zero
/* CD58 8000C158 3C02800F */  lui        $v0, %hi(D_800E8D84)
/* CD5C 8000C15C 8C458D84 */  lw         $a1, %lo(D_800E8D84)($v0)
/* CD60 8000C160 8FC68D88 */  lw         $a2, -0x7278($fp)
/* CD64 8000C164 0C0333AC */  jal        sprintf
/* CD68 8000C168 240702E2 */   addiu     $a3, $zero, 0x2e2
.L8000C16C:
/* CD6C 8000C16C 02601021 */  addu       $v0, $s3, $zero
.L8000C170:
/* CD70 8000C170 8FBF003C */  lw         $ra, 0x3c($sp)
/* CD74 8000C174 8FBE0038 */  lw         $fp, 0x38($sp)
/* CD78 8000C178 8FB70034 */  lw         $s7, 0x34($sp)
/* CD7C 8000C17C 8FB60030 */  lw         $s6, 0x30($sp)
/* CD80 8000C180 8FB5002C */  lw         $s5, 0x2c($sp)
/* CD84 8000C184 8FB40028 */  lw         $s4, 0x28($sp)
/* CD88 8000C188 8FB30024 */  lw         $s3, 0x24($sp)
/* CD8C 8000C18C 8FB20020 */  lw         $s2, 0x20($sp)
/* CD90 8000C190 8FB1001C */  lw         $s1, 0x1c($sp)
/* CD94 8000C194 8FB00018 */  lw         $s0, 0x18($sp)
/* CD98 8000C198 03E00008 */  jr         $ra
/* CD9C 8000C19C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel Emergency_skeleton_func
/* CDA0 8000C1A0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CDA4 8000C1A4 AFB00010 */  sw         $s0, 0x10($sp)
/* CDA8 8000C1A8 00808021 */  addu       $s0, $a0, $zero
/* CDAC 8000C1AC 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* CDB0 8000C1B0 AFB20018 */  sw         $s2, 0x18($sp)
/* CDB4 8000C1B4 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* CDB8 8000C1B8 02402021 */  addu       $a0, $s2, $zero
/* CDBC 8000C1BC AFB40020 */  sw         $s4, 0x20($sp)
/* CDC0 8000C1C0 3C14800F */  lui        $s4, %hi(D_800E8D84)
/* CDC4 8000C1C4 AFB3001C */  sw         $s3, 0x1c($sp)
/* CDC8 8000C1C8 3C13800F */  lui        $s3, %hi(D_800E8D88)
/* CDCC 8000C1CC 8E858D84 */  lw         $a1, %lo(D_800E8D84)($s4)
/* CDD0 8000C1D0 8E668D88 */  lw         $a2, %lo(D_800E8D88)($s3)
/* CDD4 8000C1D4 240702E7 */  addiu      $a3, $zero, 0x2e7
/* CDD8 8000C1D8 AFBF0028 */  sw         $ra, 0x28($sp)
/* CDDC 8000C1DC AFB50024 */  sw         $s5, 0x24($sp)
/* CDE0 8000C1E0 0C0333AC */  jal        sprintf
/* CDE4 8000C1E4 AFB10014 */   sw        $s1, 0x14($sp)
/* CDE8 8000C1E8 02402021 */  addu       $a0, $s2, $zero
/* CDEC 8000C1EC 8E858D84 */  lw         $a1, -0x727c($s4)
/* CDF0 8000C1F0 8E668D88 */  lw         $a2, -0x7278($s3)
/* CDF4 8000C1F4 0C0333AC */  jal        sprintf
/* CDF8 8000C1F8 240702EA */   addiu     $a3, $zero, 0x2ea
/* CDFC 8000C1FC 2655F354 */  addiu      $s5, $s2, -0xcac
/* CE00 8000C200 02A02021 */  addu       $a0, $s5, $zero
/* CE04 8000C204 00002821 */  addu       $a1, $zero, $zero
/* CE08 8000C208 0C026380 */  jal        Calloc
/* CE0C 8000C20C 24060018 */   addiu     $a2, $zero, 0x18
/* CE10 8000C210 02402021 */  addu       $a0, $s2, $zero
/* CE14 8000C214 8E858D84 */  lw         $a1, -0x727c($s4)
/* CE18 8000C218 8E668D88 */  lw         $a2, -0x7278($s3)
/* CE1C 8000C21C 0C0333AC */  jal        sprintf
/* CE20 8000C220 240702ED */   addiu     $a3, $zero, 0x2ed
/* CE24 8000C224 02A02021 */  addu       $a0, $s5, $zero
/* CE28 8000C228 0C002FB4 */  jal        func_8000BED0
/* CE2C 8000C22C 02002821 */   addu      $a1, $s0, $zero
/* CE30 8000C230 00408821 */  addu       $s1, $v0, $zero
/* CE34 8000C234 02402021 */  addu       $a0, $s2, $zero
/* CE38 8000C238 8E858D84 */  lw         $a1, -0x727c($s4)
/* CE3C 8000C23C 8E668D88 */  lw         $a2, -0x7278($s3)
/* CE40 8000C240 0C0333AC */  jal        sprintf
/* CE44 8000C244 240702F0 */   addiu     $a3, $zero, 0x2f0
/* CE48 8000C248 02202021 */  addu       $a0, $s1, $zero
/* CE4C 8000C24C 0C002DC4 */  jal        get_enemy_avg_lv
/* CE50 8000C250 02002821 */   addu      $a1, $s0, $zero
/* CE54 8000C254 00408821 */  addu       $s1, $v0, $zero
/* CE58 8000C258 02402021 */  addu       $a0, $s2, $zero
/* CE5C 8000C25C 8E858D84 */  lw         $a1, -0x727c($s4)
/* CE60 8000C260 8E668D88 */  lw         $a2, -0x7278($s3)
/* CE64 8000C264 0C0333AC */  jal        sprintf
/* CE68 8000C268 240702F3 */   addiu     $a3, $zero, 0x2f3
/* CE6C 8000C26C 16200006 */  bnez       $s1, .L8000C288
/* CE70 8000C270 02402021 */   addu      $a0, $s2, $zero
/* CE74 8000C274 3C03800F */  lui        $v1, %hi(entityList+0xBB)
/* CE78 8000C278 9062146B */  lbu        $v0, %lo(entityList+0xBB)($v1)
/* CE7C 8000C27C 24110001 */  addiu      $s1, $zero, 1
/* CE80 8000C280 24420200 */  addiu      $v0, $v0, 0x200
/* CE84 8000C284 A642F354 */  sh         $v0, -0xcac($s2)
.L8000C288:
/* CE88 8000C288 8E858D84 */  lw         $a1, -0x727c($s4)
/* CE8C 8000C28C 8E668D88 */  lw         $a2, -0x7278($s3)
/* CE90 8000C290 0C0333AC */  jal        sprintf
/* CE94 8000C294 240702F7 */   addiu     $a3, $zero, 0x2f7
/* CE98 8000C298 2E23000C */  sltiu      $v1, $s1, 0xc
/* CE9C 8000C29C 10600007 */  beqz       $v1, .L8000C2BC
/* CEA0 8000C2A0 00112040 */   sll       $a0, $s1, 1
/* CEA4 8000C2A4 00952021 */  addu       $a0, $a0, $s5
/* CEA8 8000C2A8 00002821 */  addu       $a1, $zero, $zero
/* CEAC 8000C2AC 2406000C */  addiu      $a2, $zero, 0xc
/* CEB0 8000C2B0 00D13023 */  subu       $a2, $a2, $s1
/* CEB4 8000C2B4 0C026380 */  jal        Calloc
/* CEB8 8000C2B8 00063040 */   sll       $a2, $a2, 1
.L8000C2BC:
/* CEBC 8000C2BC 8FBF0028 */  lw         $ra, 0x28($sp)
/* CEC0 8000C2C0 8FB50024 */  lw         $s5, 0x24($sp)
/* CEC4 8000C2C4 8FB40020 */  lw         $s4, 0x20($sp)
/* CEC8 8000C2C8 8FB3001C */  lw         $s3, 0x1c($sp)
/* CECC 8000C2CC 8FB20018 */  lw         $s2, 0x18($sp)
/* CED0 8000C2D0 8FB10014 */  lw         $s1, 0x14($sp)
/* CED4 8000C2D4 8FB00010 */  lw         $s0, 0x10($sp)
/* CED8 8000C2D8 03E00008 */  jr         $ra
/* CEDC 8000C2DC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel battle_setup_func
/* CEE0 8000C2E0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CEE4 8000C2E4 AFB00010 */  sw         $s0, 0x10($sp)
/* CEE8 8000C2E8 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* CEEC 8000C2EC 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* CEF0 8000C2F0 AFA40038 */  sw         $a0, 0x38($sp)
/* CEF4 8000C2F4 02002021 */  addu       $a0, $s0, $zero
/* CEF8 8000C2F8 AFBE0030 */  sw         $fp, 0x30($sp)
/* CEFC 8000C2FC 30BEFFFF */  andi       $fp, $a1, 0xffff
/* CF00 8000C300 AFB20018 */  sw         $s2, 0x18($sp)
/* CF04 8000C304 3C12800F */  lui        $s2, %hi(D_800E8D84)
/* CF08 8000C308 AFB60028 */  sw         $s6, 0x28($sp)
/* CF0C 8000C30C 30D6FFFF */  andi       $s6, $a2, 0xffff
/* CF10 8000C310 AFB10014 */  sw         $s1, 0x14($sp)
/* CF14 8000C314 3C11800F */  lui        $s1, %hi(D_800E8D88)
/* CF18 8000C318 8E458D84 */  lw         $a1, %lo(D_800E8D84)($s2)
/* CF1C 8000C31C 8E268D88 */  lw         $a2, %lo(D_800E8D88)($s1)
/* CF20 8000C320 240702FE */  addiu      $a3, $zero, 0x2fe
/* CF24 8000C324 AFBF0034 */  sw         $ra, 0x34($sp)
/* CF28 8000C328 AFB7002C */  sw         $s7, 0x2c($sp)
/* CF2C 8000C32C AFB50024 */  sw         $s5, 0x24($sp)
/* CF30 8000C330 AFB40020 */  sw         $s4, 0x20($sp)
/* CF34 8000C334 0C0333AC */  jal        sprintf
/* CF38 8000C338 AFB3001C */   sw        $s3, 0x1c($sp)
/* CF3C 8000C33C 02002021 */  addu       $a0, $s0, $zero
/* CF40 8000C340 240702FF */  addiu      $a3, $zero, 0x2ff
/* CF44 8000C344 8E458D84 */  lw         $a1, -0x727c($s2)
/* CF48 8000C348 8FA20038 */  lw         $v0, 0x38($sp)
/* CF4C 8000C34C 8E268D88 */  lw         $a2, -0x7278($s1)
/* CF50 8000C350 0C0333AC */  jal        sprintf
/* CF54 8000C354 24570028 */   addiu     $s7, $v0, 0x28
/* CF58 8000C358 02002021 */  addu       $a0, $s0, $zero
/* CF5C 8000C35C 8E458D84 */  lw         $a1, -0x727c($s2)
/* CF60 8000C360 8E268D88 */  lw         $a2, -0x7278($s1)
/* CF64 8000C364 0C0333AC */  jal        sprintf
/* CF68 8000C368 24070302 */   addiu     $a3, $zero, 0x302
/* CF6C 8000C36C 02002021 */  addu       $a0, $s0, $zero
/* CF70 8000C370 24070303 */  addiu      $a3, $zero, 0x303
/* CF74 8000C374 2613F354 */  addiu      $s3, $s0, -0xcac
/* CF78 8000C378 8E458D84 */  lw         $a1, -0x727c($s2)
/* CF7C 8000C37C 8E268D88 */  lw         $a2, -0x7278($s1)
/* CF80 8000C380 24150001 */  addiu      $s5, $zero, 1
/* CF84 8000C384 0C0333AC */  jal        sprintf
/* CF88 8000C388 A275001C */   sb        $s5, 0x1c($s3)
/* CF8C 8000C38C 02002021 */  addu       $a0, $s0, $zero
/* CF90 8000C390 2614DF88 */  addiu      $s4, $s0, -0x2078
/* CF94 8000C394 8E458D84 */  lw         $a1, -0x727c($s2)
/* CF98 8000C398 8E268D88 */  lw         $a2, -0x7278($s1)
/* CF9C 8000C39C 9682038C */  lhu        $v0, 0x38c($s4)
/* CFA0 8000C3A0 24070304 */  addiu      $a3, $zero, 0x304
/* CFA4 8000C3A4 0C0333AC */  jal        sprintf
/* CFA8 8000C3A8 A6620020 */   sh        $v0, 0x20($s3)
/* CFAC 8000C3AC 02002021 */  addu       $a0, $s0, $zero
/* CFB0 8000C3B0 8E458D84 */  lw         $a1, -0x727c($s2)
/* CFB4 8000C3B4 8E268D88 */  lw         $a2, -0x7278($s1)
/* CFB8 8000C3B8 96820372 */  lhu        $v0, 0x372($s4)
/* CFBC 8000C3BC 24070305 */  addiu      $a3, $zero, 0x305
/* CFC0 8000C3C0 0C0333AC */  jal        sprintf
/* CFC4 8000C3C4 A6620022 */   sh        $v0, 0x22($s3)
/* CFC8 8000C3C8 02002021 */  addu       $a0, $s0, $zero
/* CFCC 8000C3CC 8E458D84 */  lw         $a1, -0x727c($s2)
/* CFD0 8000C3D0 8E268D88 */  lw         $a2, -0x7278($s1)
/* CFD4 8000C3D4 96820374 */  lhu        $v0, 0x374($s4)
/* CFD8 8000C3D8 24070306 */  addiu      $a3, $zero, 0x306
/* CFDC 8000C3DC 0C0333AC */  jal        sprintf
/* CFE0 8000C3E0 A6620024 */   sh        $v0, 0x24($s3)
/* CFE4 8000C3E4 02002021 */  addu       $a0, $s0, $zero
/* CFE8 8000C3E8 8E458D84 */  lw         $a1, -0x727c($s2)
/* CFEC 8000C3EC 8E268D88 */  lw         $a2, -0x7278($s1)
/* CFF0 8000C3F0 96E20022 */  lhu        $v0, 0x22($s7)
/* CFF4 8000C3F4 24070307 */  addiu      $a3, $zero, 0x307
/* CFF8 8000C3F8 0C0333AC */  jal        sprintf
/* CFFC 8000C3FC A6620018 */   sh        $v0, 0x18($s3)
/* D000 8000C400 02002021 */  addu       $a0, $s0, $zero
/* D004 8000C404 8E458D84 */  lw         $a1, -0x727c($s2)
/* D008 8000C408 8E268D88 */  lw         $a2, -0x7278($s1)
/* D00C 8000C40C 24070308 */  addiu      $a3, $zero, 0x308
/* D010 8000C410 0C0333AC */  jal        sprintf
/* D014 8000C414 A67E001A */   sh        $fp, 0x1a($s3)
/* D018 8000C418 02002021 */  addu       $a0, $s0, $zero
/* D01C 8000C41C 8E458D84 */  lw         $a1, -0x727c($s2)
/* D020 8000C420 8E268D88 */  lw         $a2, -0x7278($s1)
/* D024 8000C424 24070309 */  addiu      $a3, $zero, 0x309
/* D028 8000C428 0C0333AC */  jal        sprintf
/* D02C 8000C42C A2750029 */   sb        $s5, 0x29($s3)
/* D030 8000C430 02002021 */  addu       $a0, $s0, $zero
/* D034 8000C434 8E458D84 */  lw         $a1, -0x727c($s2)
/* D038 8000C438 8E268D88 */  lw         $a2, -0x7278($s1)
/* D03C 8000C43C 2407030A */  addiu      $a3, $zero, 0x30a
/* D040 8000C440 0C0333AC */  jal        sprintf
/* D044 8000C444 A676001E */   sh        $s6, 0x1e($s3)
/* D048 8000C448 02002021 */  addu       $a0, $s0, $zero
/* D04C 8000C44C 8E458D84 */  lw         $a1, -0x727c($s2)
/* D050 8000C450 8FA30038 */  lw         $v1, 0x38($sp)
/* D054 8000C454 8E268D88 */  lw         $a2, -0x7278($s1)
/* D058 8000C458 9462001C */  lhu        $v0, 0x1c($v1)
/* D05C 8000C45C 2407030B */  addiu      $a3, $zero, 0x30b
/* D060 8000C460 0C0333AC */  jal        sprintf
/* D064 8000C464 A662002A */   sh        $v0, 0x2a($s3)
/* D068 8000C468 02002021 */  addu       $a0, $s0, $zero
/* D06C 8000C46C 8E458D84 */  lw         $a1, -0x727c($s2)
/* D070 8000C470 8FA30038 */  lw         $v1, 0x38($sp)
/* D074 8000C474 8E268D88 */  lw         $a2, -0x7278($s1)
/* D078 8000C478 94620014 */  lhu        $v0, 0x14($v1)
/* D07C 8000C47C 2407030E */  addiu      $a3, $zero, 0x30e
/* D080 8000C480 0C0333AC */  jal        sprintf
/* D084 8000C484 A662002C */   sh        $v0, 0x2c($s3)
/* D088 8000C488 02002021 */  addu       $a0, $s0, $zero
/* D08C 8000C48C 8E458D84 */  lw         $a1, -0x727c($s2)
/* D090 8000C490 8E268D88 */  lw         $a2, -0x7278($s1)
/* D094 8000C494 24070311 */  addiu      $a3, $zero, 0x311
/* D098 8000C498 0C0333AC */  jal        sprintf
/* D09C 8000C49C A29513CA */   sb        $s5, 0x13ca($s4)
/* D0A0 8000C4A0 0C002D31 */  jal        get_battle_terrain
/* D0A4 8000C4A4 02602021 */   addu      $a0, $s3, $zero
/* D0A8 8000C4A8 02002021 */  addu       $a0, $s0, $zero
/* D0AC 8000C4AC 8E458D84 */  lw         $a1, -0x727c($s2)
/* D0B0 8000C4B0 8E268D88 */  lw         $a2, -0x7278($s1)
/* D0B4 8000C4B4 0C0333AC */  jal        sprintf
/* D0B8 8000C4B8 24070314 */   addiu     $a3, $zero, 0x314
/* D0BC 8000C4BC 0C003068 */  jal        Emergency_skeleton_func
/* D0C0 8000C4C0 02E02021 */   addu      $a0, $s7, $zero
/* D0C4 8000C4C4 02002021 */  addu       $a0, $s0, $zero
/* D0C8 8000C4C8 8E458D84 */  lw         $a1, -0x727c($s2)
/* D0CC 8000C4CC 8E268D88 */  lw         $a2, -0x7278($s1)
/* D0D0 8000C4D0 0C0333AC */  jal        sprintf
/* D0D4 8000C4D4 24070315 */   addiu     $a3, $zero, 0x315
/* D0D8 8000C4D8 8FBF0034 */  lw         $ra, 0x34($sp)
/* D0DC 8000C4DC 8FBE0030 */  lw         $fp, 0x30($sp)
/* D0E0 8000C4E0 8FB7002C */  lw         $s7, 0x2c($sp)
/* D0E4 8000C4E4 8FB60028 */  lw         $s6, 0x28($sp)
/* D0E8 8000C4E8 8FB50024 */  lw         $s5, 0x24($sp)
/* D0EC 8000C4EC 8FB40020 */  lw         $s4, 0x20($sp)
/* D0F0 8000C4F0 8FB3001C */  lw         $s3, 0x1c($sp)
/* D0F4 8000C4F4 8FB20018 */  lw         $s2, 0x18($sp)
/* D0F8 8000C4F8 8FB10014 */  lw         $s1, 0x14($sp)
/* D0FC 8000C4FC 8FB00010 */  lw         $s0, 0x10($sp)
/* D100 8000C500 03E00008 */  jr         $ra
/* D104 8000C504 27BD0038 */   addiu     $sp, $sp, 0x38

glabel load_camp_ambush
/* D108 8000C508 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* D10C 8000C50C AFB00098 */  sw         $s0, 0x98($sp)
/* D110 8000C510 3C10800E */  lui        $s0, %hi(encounter_dat)
/* D114 8000C514 26107C74 */  addiu      $s0, $s0, %lo(encounter_dat)
/* D118 8000C518 AFBF009C */  sw         $ra, 0x9c($sp)
/* D11C 8000C51C 0C002D31 */  jal        get_battle_terrain
/* D120 8000C520 02002021 */   addu      $a0, $s0, $zero
/* D124 8000C524 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* D128 8000C528 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* D12C 8000C52C 24030002 */  addiu      $v1, $zero, 2
/* D130 8000C530 A2030026 */  sb         $v1, 0x26($s0)
/* D134 8000C534 A6000018 */  sh         $zero, 0x18($s0)
/* D138 8000C538 A2000028 */  sb         $zero, 0x28($s0)
/* D13C 8000C53C A600001A */  sh         $zero, 0x1a($s0)
/* D140 8000C540 A2000029 */  sb         $zero, 0x29($s0)
/* D144 8000C544 2610EC34 */  addiu      $s0, $s0, -0x13cc
/* D148 8000C548 24020001 */  addiu      $v0, $zero, 1
/* D14C 8000C54C 0C021380 */  jal        getTerrain
/* D150 8000C550 A20213CA */   sb        $v0, 0x13ca($s0)
/* D154 8000C554 00021880 */  sll        $v1, $v0, 2
/* D158 8000C558 00621821 */  addu       $v1, $v1, $v0
/* D15C 8000C55C 00031900 */  sll        $v1, $v1, 4
/* D160 8000C560 8E0415F8 */  lw         $a0, 0x15f8($s0)
/* D164 8000C564 0C01F959 */  jal        get_party_avg_lv
/* D168 8000C568 3070FFFF */   andi      $s0, $v1, 0xffff
/* D16C 8000C56C 00401821 */  addu       $v1, $v0, $zero
/* D170 8000C570 2C620015 */  sltiu      $v0, $v1, 0x15
/* D174 8000C574 14400003 */  bnez       $v0, .L8000C584
/* D178 8000C578 2C620010 */   sltiu     $v0, $v1, 0x10
/* D17C 8000C57C 0800316A */  j          .L8000C5A8
/* D180 8000C580 24020004 */   addiu     $v0, $zero, 4
.L8000C584:
/* D184 8000C584 14400003 */  bnez       $v0, .L8000C594
/* D188 8000C588 2C62000B */   sltiu     $v0, $v1, 0xb
/* D18C 8000C58C 0800316A */  j          .L8000C5A8
/* D190 8000C590 24020003 */   addiu     $v0, $zero, 3
.L8000C594:
/* D194 8000C594 14400003 */  bnez       $v0, .L8000C5A4
/* D198 8000C598 2C620006 */   sltiu     $v0, $v1, 6
/* D19C 8000C59C 0800316A */  j          .L8000C5A8
/* D1A0 8000C5A0 24020002 */   addiu     $v0, $zero, 2
.L8000C5A4:
/* D1A4 8000C5A4 38420001 */  xori       $v0, $v0, 1
.L8000C5A8:
/* D1A8 8000C5A8 000210C0 */  sll        $v0, $v0, 3
/* D1AC 8000C5AC 3042FFFF */  andi       $v0, $v0, 0xffff
/* D1B0 8000C5B0 27A40018 */  addiu      $a0, $sp, 0x18
/* D1B4 8000C5B4 3C05B200 */  lui        $a1, %hi(globals_rom)
/* D1B8 8000C5B8 24A5C9D0 */  addiu      $a1, $a1, %lo(globals_rom)
/* D1BC 8000C5BC 00452821 */  addu       $a1, $v0, $a1
/* D1C0 8000C5C0 02052821 */  addu       $a1, $s0, $a1
/* D1C4 8000C5C4 24060008 */  addiu      $a2, $zero, 8
/* D1C8 8000C5C8 3C02800E */  lui        $v0, %hi(D_800D81EC)
/* D1CC 8000C5CC 244281EC */  addiu      $v0, $v0, %lo(D_800D81EC)
/* D1D0 8000C5D0 24030348 */  addiu      $v1, $zero, 0x348
/* D1D4 8000C5D4 24070001 */  addiu      $a3, $zero, 1
/* D1D8 8000C5D8 AFA20010 */  sw         $v0, 0x10($sp)
/* D1DC 8000C5DC 0C027269 */  jal        RomCopy
/* D1E0 8000C5E0 AFA30014 */   sw        $v1, 0x14($sp)
/* D1E4 8000C5E4 27B00058 */  addiu      $s0, $sp, 0x58
/* D1E8 8000C5E8 02002021 */  addu       $a0, $s0, $zero
/* D1EC 8000C5EC 00002821 */  addu       $a1, $zero, $zero
/* D1F0 8000C5F0 0C026380 */  jal        Calloc
/* D1F4 8000C5F4 24060038 */   addiu     $a2, $zero, 0x38
/* D1F8 8000C5F8 00004021 */  addu       $t0, $zero, $zero
/* D1FC 8000C5FC 27A60018 */  addiu      $a2, $sp, 0x18
/* D200 8000C600 02003821 */  addu       $a3, $s0, $zero
/* D204 8000C604 93A2001A */  lbu        $v0, 0x1a($sp)
/* D208 8000C608 93A4001E */  lbu        $a0, 0x1e($sp)
/* D20C 8000C60C 93A3001B */  lbu        $v1, 0x1b($sp)
/* D210 8000C610 93A5001F */  lbu        $a1, 0x1f($sp)
/* D214 8000C614 00441021 */  addu       $v0, $v0, $a0
/* D218 8000C618 00651821 */  addu       $v1, $v1, $a1
/* D21C 8000C61C A7A20080 */  sh         $v0, 0x80($sp)
/* D220 8000C620 A7A30082 */  sh         $v1, 0x82($sp)
.L8000C624:
/* D224 8000C624 94C20000 */  lhu        $v0, ($a2)
/* D228 8000C628 A4E20000 */  sh         $v0, ($a3)
/* D22C 8000C62C 90C30002 */  lbu        $v1, 2($a2)
/* D230 8000C630 25080001 */  addiu      $t0, $t0, 1
/* D234 8000C634 A0E30002 */  sb         $v1, 2($a3)
/* D238 8000C638 90C20003 */  lbu        $v0, 3($a2)
/* D23C 8000C63C 24C60004 */  addiu      $a2, $a2, 4
/* D240 8000C640 A0E20003 */  sb         $v0, 3($a3)
/* D244 8000C644 2D020002 */  sltiu      $v0, $t0, 2
/* D248 8000C648 1440FFF6 */  bnez       $v0, .L8000C624
/* D24C 8000C64C 24E70004 */   addiu     $a3, $a3, 4
/* D250 8000C650 0C003068 */  jal        Emergency_skeleton_func
/* D254 8000C654 02002021 */   addu      $a0, $s0, $zero
/* D258 8000C658 8FBF009C */  lw         $ra, 0x9c($sp)
/* D25C 8000C65C 8FB00098 */  lw         $s0, 0x98($sp)
/* D260 8000C660 03E00008 */  jr         $ra
/* D264 8000C664 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel append_SenseAura_text
/* D268 8000C668 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D26C 8000C66C AFB20018 */  sw         $s2, 0x18($sp)
/* D270 8000C670 00809021 */  addu       $s2, $a0, $zero
/* D274 8000C674 AFB3001C */  sw         $s3, 0x1c($sp)
/* D278 8000C678 00A09821 */  addu       $s3, $a1, $zero
/* D27C 8000C67C AFB40020 */  sw         $s4, 0x20($sp)
/* D280 8000C680 30D400FF */  andi       $s4, $a2, 0xff
/* D284 8000C684 AFBF0024 */  sw         $ra, 0x24($sp)
/* D288 8000C688 AFB10014 */  sw         $s1, 0x14($sp)
/* D28C 8000C68C 0C03353E */  jal        strlen
/* D290 8000C690 AFB00010 */   sw        $s0, 0x10($sp)
/* D294 8000C694 02602021 */  addu       $a0, $s3, $zero
/* D298 8000C698 0C03353E */  jal        strlen
/* D29C 8000C69C 305100FF */   andi      $s1, $v0, 0xff
/* D2A0 8000C6A0 02512021 */  addu       $a0, $s2, $s1
/* D2A4 8000C6A4 305000FF */  andi       $s0, $v0, 0xff
/* D2A8 8000C6A8 3C05800E */  lui        $a1, %hi(D_800D8288)
/* D2AC 8000C6AC 24A58288 */  addiu      $a1, $a1, %lo(D_800D8288)
/* D2B0 8000C6B0 0C0333AC */  jal        sprintf
/* D2B4 8000C6B4 02603021 */   addu      $a2, $s3, $zero
/* D2B8 8000C6B8 02001021 */  addu       $v0, $s0, $zero
/* D2BC 8000C6BC 0290802B */  sltu       $s0, $s4, $s0
/* D2C0 8000C6C0 52000001 */  beql       $s0, $zero, .L8000C6C8
/* D2C4 8000C6C4 02801021 */   addu      $v0, $s4, $zero
.L8000C6C8:
/* D2C8 8000C6C8 8FBF0024 */  lw         $ra, 0x24($sp)
/* D2CC 8000C6CC 8FB40020 */  lw         $s4, 0x20($sp)
/* D2D0 8000C6D0 8FB3001C */  lw         $s3, 0x1c($sp)
/* D2D4 8000C6D4 8FB20018 */  lw         $s2, 0x18($sp)
/* D2D8 8000C6D8 8FB10014 */  lw         $s1, 0x14($sp)
/* D2DC 8000C6DC 8FB00010 */  lw         $s0, 0x10($sp)
/* D2E0 8000C6E0 03E00008 */  jr         $ra
/* D2E4 8000C6E4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8000C6E8
/* D2E8 8000C6E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2EC 8000C6EC AFBF0010 */  sw         $ra, 0x10($sp)
/* D2F0 8000C6F0 0C030C1C */  jal        osGetTime
/* D2F4 8000C6F4 00000000 */   nop
/* D2F8 8000C6F8 00022180 */  sll        $a0, $v0, 6
/* D2FC 8000C6FC 00033682 */  srl        $a2, $v1, 0x1a
/* D300 8000C700 00862025 */  or         $a0, $a0, $a2
/* D304 8000C704 24060000 */  addiu      $a2, $zero, 0
/* D308 8000C708 24070003 */  addiu      $a3, $zero, 3
/* D30C 8000C70C 0C02F6D8 */  jal        udivdi3
/* D310 8000C710 00032980 */   sll       $a1, $v1, 6
/* D314 8000C714 8FBF0010 */  lw         $ra, 0x10($sp)
/* D318 8000C718 3C01800F */  lui        $at, %hi(ofunc_dat)
/* D31C 8000C71C AC228D98 */  sw         $v0, %lo(ofunc_dat)($at)
/* D320 8000C720 3C01800F */  lui        $at, %hi(ofunc_dat_)
/* D324 8000C724 AC238D9C */  sw         $v1, %lo(ofunc_dat_)($at)
/* D328 8000C728 03E00008 */  jr         $ra
/* D32C 8000C72C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8000C730
/* D330 8000C730 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D334 8000C734 AFBF0010 */  sw         $ra, 0x10($sp)
/* D338 8000C738 0C030C1C */  jal        osGetTime
/* D33C 8000C73C 00000000 */   nop
/* D340 8000C740 00022180 */  sll        $a0, $v0, 6
/* D344 8000C744 00033682 */  srl        $a2, $v1, 0x1a
/* D348 8000C748 00862025 */  or         $a0, $a0, $a2
/* D34C 8000C74C 24060000 */  addiu      $a2, $zero, 0
/* D350 8000C750 24070003 */  addiu      $a3, $zero, 3
/* D354 8000C754 0C02F6D8 */  jal        udivdi3
/* D358 8000C758 00032980 */   sll       $a1, $v1, 6
/* D35C 8000C75C 3C04800F */  lui        $a0, %hi(ofunc_dat)
/* D360 8000C760 8C848D98 */  lw         $a0, %lo(ofunc_dat)($a0)
/* D364 8000C764 3C05800F */  lui        $a1, %hi(ofunc_dat_)
/* D368 8000C768 8CA58D9C */  lw         $a1, %lo(ofunc_dat_)($a1)
/* D36C 8000C76C 8FBF0010 */  lw         $ra, 0x10($sp)
/* D370 8000C770 0065302B */  sltu       $a2, $v1, $a1
/* D374 8000C774 00651823 */  subu       $v1, $v1, $a1
/* D378 8000C778 00441023 */  subu       $v0, $v0, $a0
/* D37C 8000C77C 00461023 */  subu       $v0, $v0, $a2
/* D380 8000C780 03E00008 */  jr         $ra
/* D384 8000C784 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8000C788
/* D388 8000C788 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D38C 8000C78C AFB1001C */  sw         $s1, 0x1c($sp)
/* D390 8000C790 00808821 */  addu       $s1, $a0, $zero
/* D394 8000C794 AFBF0020 */  sw         $ra, 0x20($sp)
/* D398 8000C798 0C030C1C */  jal        osGetTime
/* D39C 8000C79C AFB00018 */   sw        $s0, 0x18($sp)
/* D3A0 8000C7A0 00022180 */  sll        $a0, $v0, 6
/* D3A4 8000C7A4 00033682 */  srl        $a2, $v1, 0x1a
/* D3A8 8000C7A8 00862025 */  or         $a0, $a0, $a2
/* D3AC 8000C7AC 24060000 */  addiu      $a2, $zero, 0
/* D3B0 8000C7B0 24070003 */  addiu      $a3, $zero, 3
/* D3B4 8000C7B4 0C02F6D8 */  jal        udivdi3
/* D3B8 8000C7B8 00032980 */   sll       $a1, $v1, 6
/* D3BC 8000C7BC 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* D3C0 8000C7C0 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* D3C4 8000C7C4 02002021 */  addu       $a0, $s0, $zero
/* D3C8 8000C7C8 3C05800E */  lui        $a1, %hi(D_800D828C)
/* D3CC 8000C7CC 24A5828C */  addiu      $a1, $a1, %lo(D_800D828C)
/* D3D0 8000C7D0 3C08800F */  lui        $t0, %hi(ofunc_dat)
/* D3D4 8000C7D4 8D088D98 */  lw         $t0, %lo(ofunc_dat)($t0)
/* D3D8 8000C7D8 3C09800F */  lui        $t1, %hi(ofunc_dat_)
/* D3DC 8000C7DC 8D298D9C */  lw         $t1, %lo(ofunc_dat_)($t1)
/* D3E0 8000C7E0 0069382B */  sltu       $a3, $v1, $t1
/* D3E4 8000C7E4 00691823 */  subu       $v1, $v1, $t1
/* D3E8 8000C7E8 00481023 */  subu       $v0, $v0, $t0
/* D3EC 8000C7EC 00471023 */  subu       $v0, $v0, $a3
/* D3F0 8000C7F0 AFA20010 */  sw         $v0, 0x10($sp)
/* D3F4 8000C7F4 AFA30014 */  sw         $v1, 0x14($sp)
/* D3F8 8000C7F8 0C0333AC */  jal        sprintf
/* D3FC 8000C7FC 02203021 */   addu      $a2, $s1, $zero
/* D400 8000C800 0C00B6B8 */  jal        debug_queue
/* D404 8000C804 02002021 */   addu      $a0, $s0, $zero
/* D408 8000C808 0C030C1C */  jal        osGetTime
/* D40C 8000C80C 00000000 */   nop
/* D410 8000C810 00022180 */  sll        $a0, $v0, 6
/* D414 8000C814 00033682 */  srl        $a2, $v1, 0x1a
/* D418 8000C818 00862025 */  or         $a0, $a0, $a2
/* D41C 8000C81C 24060000 */  addiu      $a2, $zero, 0
/* D420 8000C820 24070003 */  addiu      $a3, $zero, 3
/* D424 8000C824 0C02F6D8 */  jal        udivdi3
/* D428 8000C828 00032980 */   sll       $a1, $v1, 6
/* D42C 8000C82C 8FBF0020 */  lw         $ra, 0x20($sp)
/* D430 8000C830 8FB1001C */  lw         $s1, 0x1c($sp)
/* D434 8000C834 8FB00018 */  lw         $s0, 0x18($sp)
/* D438 8000C838 3C01800F */  lui        $at, %hi(ofunc_dat)
/* D43C 8000C83C AC228D98 */  sw         $v0, %lo(ofunc_dat)($at)
/* D440 8000C840 3C01800F */  lui        $at, %hi(ofunc_dat_)
/* D444 8000C844 AC238D9C */  sw         $v1, %lo(ofunc_dat_)($at)
/* D448 8000C848 03E00008 */  jr         $ra
/* D44C 8000C84C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8000C850
/* D450 8000C850 3C01800E */  lui        $at, %hi(D_800D8298)
/* D454 8000C854 C4208298 */  lwc1       $f0, %lo(D_800D8298)($at)
/* D458 8000C858 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D45C 8000C85C AFBF0020 */  sw         $ra, 0x20($sp)
/* D460 8000C860 AFB3001C */  sw         $s3, 0x1c($sp)
/* D464 8000C864 AFB20018 */  sw         $s2, 0x18($sp)
/* D468 8000C868 AFB10014 */  sw         $s1, 0x14($sp)
/* D46C 8000C86C AFB00010 */  sw         $s0, 0x10($sp)
/* D470 8000C870 F7B60030 */  sdc1       $f22, 0x30($sp)
/* D474 8000C874 F7B40028 */  sdc1       $f20, 0x28($sp)
/* D478 8000C878 46006502 */  mul.s      $f20, $f12, $f0
/* D47C 8000C87C 0C030C1C */  jal        osGetTime
/* D480 8000C880 3C138000 */   lui       $s3, 0x8000
/* D484 8000C884 00022180 */  sll        $a0, $v0, 6
/* D488 8000C888 00033682 */  srl        $a2, $v1, 0x1a
/* D48C 8000C88C 00862025 */  or         $a0, $a0, $a2
/* D490 8000C890 24060000 */  addiu      $a2, $zero, 0
/* D494 8000C894 24070BB8 */  addiu      $a3, $zero, 0xbb8
/* D498 8000C898 0C02F6D8 */  jal        udivdi3
/* D49C 8000C89C 00032980 */   sll       $a1, $v1, 6
/* D4A0 8000C8A0 3C01800E */  lui        $at, %hi(D_800D829C)
/* D4A4 8000C8A4 C436829C */  lwc1       $f22, %lo(D_800D829C)($at)
/* D4A8 8000C8A8 0800322F */  j          .L8000C8BC
/* D4AC 8000C8AC 00609021 */   addu      $s2, $v1, $zero
.L8000C8B0:
/* D4B0 8000C8B0 00B1102B */  sltu       $v0, $a1, $s1
/* D4B4 8000C8B4 50400021 */  beql       $v0, $zero, .L8000C93C
/* D4B8 8000C8B8 8FB3001C */   lw        $s3, 0x1c($sp)
.L8000C8BC:
/* D4BC 8000C8BC 4614B03E */  c.le.s     $f22, $f20
/* D4C0 8000C8C0 00000000 */  nop
/* D4C4 8000C8C4 45030005 */  bc1tl      .L8000C8DC
/* D4C8 8000C8C8 4616A001 */   sub.s     $f0, $f20, $f22
/* D4CC 8000C8CC 4600A00D */  trunc.w.s  $f0, $f20
/* D4D0 8000C8D0 44020000 */  mfc1       $v0, $f0
/* D4D4 8000C8D4 0800323B */  j          .L8000C8EC
/* D4D8 8000C8D8 00408821 */   addu      $s1, $v0, $zero
.L8000C8DC:
/* D4DC 8000C8DC 4600008D */  trunc.w.s  $f2, $f0
/* D4E0 8000C8E0 44021000 */  mfc1       $v0, $f2
/* D4E4 8000C8E4 00531025 */  or         $v0, $v0, $s3
/* D4E8 8000C8E8 00408821 */  addu       $s1, $v0, $zero
.L8000C8EC:
/* D4EC 8000C8EC 0C030C1C */  jal        osGetTime
/* D4F0 8000C8F0 00008021 */   addu      $s0, $zero, $zero
/* D4F4 8000C8F4 00022180 */  sll        $a0, $v0, 6
/* D4F8 8000C8F8 00033682 */  srl        $a2, $v1, 0x1a
/* D4FC 8000C8FC 00862025 */  or         $a0, $a0, $a2
/* D500 8000C900 24060000 */  addiu      $a2, $zero, 0
/* D504 8000C904 24070BB8 */  addiu      $a3, $zero, 0xbb8
/* D508 8000C908 0C02F6D8 */  jal        udivdi3
/* D50C 8000C90C 00032980 */   sll       $a1, $v1, 6
/* D510 8000C910 02402821 */  addu       $a1, $s2, $zero
/* D514 8000C914 00002021 */  addu       $a0, $zero, $zero
/* D518 8000C918 0065302B */  sltu       $a2, $v1, $a1
/* D51C 8000C91C 00442023 */  subu       $a0, $v0, $a0
/* D520 8000C920 00862023 */  subu       $a0, $a0, $a2
/* D524 8000C924 0090102B */  sltu       $v0, $a0, $s0
/* D528 8000C928 1440FFE4 */  bnez       $v0, .L8000C8BC
/* D52C 8000C92C 00652823 */   subu      $a1, $v1, $a1
/* D530 8000C930 1204FFDF */  beq        $s0, $a0, .L8000C8B0
/* D534 8000C934 8FBF0020 */   lw        $ra, 0x20($sp)
/* D538 8000C938 8FB3001C */  lw         $s3, 0x1c($sp)
.L8000C93C:
/* D53C 8000C93C 8FB20018 */  lw         $s2, 0x18($sp)
/* D540 8000C940 8FB10014 */  lw         $s1, 0x14($sp)
/* D544 8000C944 8FB00010 */  lw         $s0, 0x10($sp)
/* D548 8000C948 D7B60030 */  ldc1       $f22, 0x30($sp)
/* D54C 8000C94C D7B40028 */  ldc1       $f20, 0x28($sp)
/* D550 8000C950 03E00008 */  jr         $ra
/* D554 8000C954 27BD0038 */   addiu     $sp, $sp, 0x38

glabel minimap_struct_init_or_free
/* D558 8000C958 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D55C 8000C95C 3402FFFF */  ori        $v0, $zero, 0xffff
/* D560 8000C960 14A2000B */  bne        $a1, $v0, .L8000C990
/* D564 8000C964 AFBF0010 */   sw        $ra, 0x10($sp)
/* D568 8000C968 10800006 */  beqz       $a0, .L8000C984
/* D56C 8000C96C 3C04800E */   lui       $a0, %hi(gGlobals)
/* D570 8000C970 248468A8 */  addiu      $a0, $a0, %lo(gGlobals)
/* D574 8000C974 0C0144ED */  jal        minimap_struct_init
/* D578 8000C978 2484150C */   addiu     $a0, $a0, 0x150c
/* D57C 8000C97C 08003265 */  j          .L8000C994
/* D580 8000C980 8FBF0010 */   lw        $ra, 0x10($sp)
.L8000C984:
/* D584 8000C984 248468A8 */  addiu      $a0, $a0, 0x68a8
/* D588 8000C988 0C01450E */  jal        passto_minimap_struct_free
/* D58C 8000C98C 2484150C */   addiu     $a0, $a0, 0x150c
.L8000C990:
/* D590 8000C990 8FBF0010 */  lw         $ra, 0x10($sp)
.L8000C994:
/* D594 8000C994 03E00008 */  jr         $ra
/* D598 8000C998 27BD0018 */   addiu     $sp, $sp, 0x18

glabel minimap_struct_init_2
/* D59C 8000C99C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5A0 8000C9A0 24040001 */  addiu      $a0, $zero, 1
/* D5A4 8000C9A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* D5A8 8000C9A8 0C003256 */  jal        minimap_struct_init_or_free
/* D5AC 8000C9AC 3405FFFF */   ori       $a1, $zero, 0xffff
/* D5B0 8000C9B0 8FBF0010 */  lw         $ra, 0x10($sp)
/* D5B4 8000C9B4 03E00008 */  jr         $ra
/* D5B8 8000C9B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel minimap_struct_free_2
/* D5BC 8000C9BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D5C0 8000C9C0 00002021 */  addu       $a0, $zero, $zero
/* D5C4 8000C9C4 AFBF0010 */  sw         $ra, 0x10($sp)
/* D5C8 8000C9C8 0C003256 */  jal        minimap_struct_init_or_free
/* D5CC 8000C9CC 3405FFFF */   ori       $a1, $zero, 0xffff
/* D5D0 8000C9D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* D5D4 8000C9D4 03E00008 */  jr         $ra
/* D5D8 8000C9D8 27BD0018 */   addiu     $sp, $sp, 0x18
/* D5DC 8000C9DC 00000000 */  nop
