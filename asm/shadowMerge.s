.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel boost_from_shadow_merge
/* 713B0 800707B0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 713B4 800707B4 24050004 */  addiu      $a1, $zero, 4
/* 713B8 800707B8 24060006 */  addiu      $a2, $zero, 6
/* 713BC 800707BC 00042600 */  sll        $a0, $a0, 0x18
/* 713C0 800707C0 3C07800E */  lui        $a3, %hi(partyPointer)
/* 713C4 800707C4 3C08800F */  lui        $t0, %hi(combatPointer)
/* 713C8 800707C8 8CE37EA0 */  lw         $v1, %lo(partyPointer)($a3)
/* 713CC 800707CC 8D02F760 */  lw         $v0, %lo(combatPointer)($t0)
/* 713D0 800707D0 00042583 */  sra        $a0, $a0, 0x16
/* 713D4 800707D4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 713D8 800707D8 AFB5002C */  sw         $s5, 0x2c($sp)
/* 713DC 800707DC AFB40028 */  sw         $s4, 0x28($sp)
/* 713E0 800707E0 AFB30024 */  sw         $s3, 0x24($sp)
/* 713E4 800707E4 AFB20020 */  sw         $s2, 0x20($sp)
/* 713E8 800707E8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 713EC 800707EC AFB00018 */  sw         $s0, 0x18($sp)
/* 713F0 800707F0 00441021 */  addu       $v0, $v0, $a0
/* 713F4 800707F4 8C740000 */  lw         $s4, ($v1)
/* 713F8 800707F8 8C4352D0 */  lw         $v1, 0x52d0($v0)
/* 713FC 800707FC 8E900018 */  lw         $s0, 0x18($s4)
/* 71400 80070800 8C750040 */  lw         $s5, 0x40($v1)
/* 71404 80070804 0C021226 */  jal        addBaseStat
/* 71408 80070808 02002021 */   addu      $a0, $s0, $zero
/* 7140C 8007080C 02002021 */  addu       $a0, $s0, $zero
/* 71410 80070810 00002821 */  addu       $a1, $zero, $zero
/* 71414 80070814 0C021226 */  jal        addBaseStat
/* 71418 80070818 24060003 */   addiu     $a2, $zero, 3
/* 7141C 8007081C 02002021 */  addu       $a0, $s0, $zero
/* 71420 80070820 24050001 */  addiu      $a1, $zero, 1
/* 71424 80070824 0C021226 */  jal        addBaseStat
/* 71428 80070828 24060003 */   addiu     $a2, $zero, 3
/* 7142C 8007082C 02002021 */  addu       $a0, $s0, $zero
/* 71430 80070830 24050003 */  addiu      $a1, $zero, 3
/* 71434 80070834 0C021226 */  jal        addBaseStat
/* 71438 80070838 24060003 */   addiu     $a2, $zero, 3
/* 7143C 8007083C 02002021 */  addu       $a0, $s0, $zero
/* 71440 80070840 24050005 */  addiu      $a1, $zero, 5
/* 71444 80070844 0C021226 */  jal        addBaseStat
/* 71448 80070848 2406000A */   addiu     $a2, $zero, 0xa
/* 7144C 8007084C 8E830014 */  lw         $v1, 0x14($s4)
/* 71450 80070850 90620002 */  lbu        $v0, 2($v1)
/* 71454 80070854 00008821 */  addu       $s1, $zero, $zero
/* 71458 80070858 24420005 */  addiu      $v0, $v0, 5
/* 7145C 8007085C A0620002 */  sb         $v0, 2($v1)
/* 71460 80070860 8E93001C */  lw         $s3, 0x1c($s4)
/* 71464 80070864 8EB2001C */  lw         $s2, 0x1c($s5)
/* 71468 80070868 02402021 */  addu       $a0, $s2, $zero
.L8007086C:
/* 7146C 8007086C 0C020F67 */  jal        getModdedSkill
/* 71470 80070870 02202821 */   addu      $a1, $s1, $zero
/* 71474 80070874 1040000F */  beqz       $v0, .L800708B4
/* 71478 80070878 02402021 */   addu      $a0, $s2, $zero
/* 7147C 8007087C 0C020F4B */  jal        capskillBaseMax
/* 71480 80070880 02202821 */   addu      $a1, $s1, $zero
/* 71484 80070884 02602021 */  addu       $a0, $s3, $zero
/* 71488 80070888 02202821 */  addu       $a1, $s1, $zero
/* 7148C 8007088C 0C020F4B */  jal        capskillBaseMax
/* 71490 80070890 00408021 */   addu      $s0, $v0, $zero
/* 71494 80070894 02028023 */  subu       $s0, $s0, $v0
/* 71498 80070898 00108600 */  sll        $s0, $s0, 0x18
/* 7149C 8007089C 00103603 */  sra        $a2, $s0, 0x18
/* 714A0 800708A0 58C00001 */  blezl      $a2, .L800708A8
/* 714A4 800708A4 24060002 */   addiu     $a2, $zero, 2
.L800708A8:
/* 714A8 800708A8 02602021 */  addu       $a0, $s3, $zero
/* 714AC 800708AC 0C020EE7 */  jal        wonky_baseskill_check
/* 714B0 800708B0 02202821 */   addu      $a1, $s1, $zero
.L800708B4:
/* 714B4 800708B4 26220001 */  addiu      $v0, $s1, 1
/* 714B8 800708B8 305100FF */  andi       $s1, $v0, 0xff
/* 714BC 800708BC 2E23000C */  sltiu      $v1, $s1, 0xc
/* 714C0 800708C0 1460FFEA */  bnez       $v1, .L8007086C
/* 714C4 800708C4 02402021 */   addu      $a0, $s2, $zero
/* 714C8 800708C8 00008821 */  addu       $s1, $zero, $zero
.L800708CC:
/* 714CC 800708CC 0C020F71 */  jal        getModdedWeapon
/* 714D0 800708D0 02202821 */   addu      $a1, $s1, $zero
/* 714D4 800708D4 1040000F */  beqz       $v0, .L80070914
/* 714D8 800708D8 02402021 */   addu      $a0, $s2, $zero
/* 714DC 800708DC 0C020F55 */  jal        capWeaponBaseMax
/* 714E0 800708E0 02202821 */   addu      $a1, $s1, $zero
/* 714E4 800708E4 02602021 */  addu       $a0, $s3, $zero
/* 714E8 800708E8 02202821 */  addu       $a1, $s1, $zero
/* 714EC 800708EC 0C020F55 */  jal        capWeaponBaseMax
/* 714F0 800708F0 00408021 */   addu      $s0, $v0, $zero
/* 714F4 800708F4 02028023 */  subu       $s0, $s0, $v0
/* 714F8 800708F8 00108600 */  sll        $s0, $s0, 0x18
/* 714FC 800708FC 00103603 */  sra        $a2, $s0, 0x18
/* 71500 80070900 58C00001 */  blezl      $a2, .L80070908
/* 71504 80070904 24060002 */   addiu     $a2, $zero, 2
.L80070908:
/* 71508 80070908 02602021 */  addu       $a0, $s3, $zero
/* 7150C 8007090C 0C020EF2 */  jal        wonky_weapon_check
/* 71510 80070910 02202821 */   addu      $a1, $s1, $zero
.L80070914:
/* 71514 80070914 26220001 */  addiu      $v0, $s1, 1
/* 71518 80070918 305100FF */  andi       $s1, $v0, 0xff
/* 7151C 8007091C 2E23000B */  sltiu      $v1, $s1, 0xb
/* 71520 80070920 1460FFEA */  bnez       $v1, .L800708CC
/* 71524 80070924 02402021 */   addu      $a0, $s2, $zero
/* 71528 80070928 0C020F7B */  jal        getModdedSheild
/* 7152C 8007092C 02402021 */   addu      $a0, $s2, $zero
/* 71530 80070930 5440000F */  bnel       $v0, $zero, .L80070970
/* 71534 80070934 8EB3002C */   lw        $s3, 0x2c($s5)
/* 71538 80070938 0C020F5F */  jal        CapBaseSheild
/* 7153C 8007093C 02402021 */   addu      $a0, $s2, $zero
/* 71540 80070940 02602021 */  addu       $a0, $s3, $zero
/* 71544 80070944 0C020F5F */  jal        CapBaseSheild
/* 71548 80070948 00408021 */   addu      $s0, $v0, $zero
/* 7154C 8007094C 02028023 */  subu       $s0, $s0, $v0
/* 71550 80070950 00108600 */  sll        $s0, $s0, 0x18
/* 71554 80070954 00103603 */  sra        $a2, $s0, 0x18
/* 71558 80070958 58C00001 */  blezl      $a2, .L80070960
/* 7155C 8007095C 24060002 */   addiu     $a2, $zero, 2
.L80070960:
/* 71560 80070960 02602021 */  addu       $a0, $s3, $zero
/* 71564 80070964 0C020EFF */  jal        wonky_sheild_check
/* 71568 80070968 00C02821 */   addu      $a1, $a2, $zero
/* 7156C 8007096C 8EB3002C */  lw         $s3, 0x2c($s5)
.L80070970:
/* 71570 80070970 00008821 */  addu       $s1, $zero, $zero
/* 71574 80070974 92620004 */  lbu        $v0, 4($s3)
/* 71578 80070978 10400029 */  beqz       $v0, .L80070A20
/* 7157C 8007097C 8E92002C */   lw        $s2, 0x2c($s4)
/* 71580 80070980 8E630000 */  lw         $v1, ($s3)
.L80070984:
/* 71584 80070984 00111080 */  sll        $v0, $s1, 2
/* 71588 80070988 00431021 */  addu       $v0, $v0, $v1
/* 7158C 8007098C 8C500000 */  lw         $s0, ($v0)
/* 71590 80070990 1200001E */  beqz       $s0, .L80070A0C
/* 71594 80070994 26230001 */   addiu     $v1, $s1, 1
/* 71598 80070998 02402021 */  addu       $a0, $s2, $zero
/* 7159C 8007099C 96050000 */  lhu        $a1, ($s0)
/* 715A0 800709A0 0C021108 */  jal        knows_spell
/* 715A4 800709A4 27A60010 */   addiu     $a2, $sp, 0x10
/* 715A8 800709A8 10400013 */  beqz       $v0, .L800709F8
/* 715AC 800709AC 93A20010 */   lbu       $v0, 0x10($sp)
/* 715B0 800709B0 8E430000 */  lw         $v1, ($s2)
/* 715B4 800709B4 00021080 */  sll        $v0, $v0, 2
/* 715B8 800709B8 00431021 */  addu       $v0, $v0, $v1
/* 715BC 800709BC 8C440000 */  lw         $a0, ($v0)
/* 715C0 800709C0 92030014 */  lbu        $v1, 0x14($s0)
/* 715C4 800709C4 90820014 */  lbu        $v0, 0x14($a0)
/* 715C8 800709C8 00621823 */  subu       $v1, $v1, $v0
/* 715CC 800709CC 00031E00 */  sll        $v1, $v1, 0x18
/* 715D0 800709D0 00033603 */  sra        $a2, $v1, 0x18
/* 715D4 800709D4 58C00001 */  blezl      $a2, .L800709DC
/* 715D8 800709D8 24060002 */   addiu     $a2, $zero, 2
.L800709DC:
/* 715DC 800709DC 90820014 */  lbu        $v0, 0x14($a0)
/* 715E0 800709E0 00461021 */  addu       $v0, $v0, $a2
/* 715E4 800709E4 2843000B */  slti       $v1, $v0, 0xb
/* 715E8 800709E8 50600001 */  beql       $v1, $zero, .L800709F0
/* 715EC 800709EC 2402000A */   addiu     $v0, $zero, 0xa
.L800709F0:
/* 715F0 800709F0 0801C282 */  j          .L80070A08
/* 715F4 800709F4 A0820014 */   sb        $v0, 0x14($a0)
.L800709F8:
/* 715F8 800709F8 96050000 */  lhu        $a1, ($s0)
/* 715FC 800709FC 92060014 */  lbu        $a2, 0x14($s0)
/* 71600 80070A00 0C0210AC */  jal        learn_spell
/* 71604 80070A04 02402021 */   addu      $a0, $s2, $zero
.L80070A08:
/* 71608 80070A08 26230001 */  addiu      $v1, $s1, 1
.L80070A0C:
/* 7160C 80070A0C 92620004 */  lbu        $v0, 4($s3)
/* 71610 80070A10 307100FF */  andi       $s1, $v1, 0xff
/* 71614 80070A14 0222102B */  sltu       $v0, $s1, $v0
/* 71618 80070A18 5440FFDA */  bnel       $v0, $zero, .L80070984
/* 7161C 80070A1C 8E630000 */   lw        $v1, ($s3)
.L80070A20:
/* 71620 80070A20 24040236 */  addiu      $a0, $zero, 0x236
/* 71624 80070A24 0C00918D */  jal        setEventFlag
/* 71628 80070A28 24050001 */   addiu     $a1, $zero, 1
/* 7162C 80070A2C 8FBF0030 */  lw         $ra, 0x30($sp)
/* 71630 80070A30 8FB5002C */  lw         $s5, 0x2c($sp)
/* 71634 80070A34 8FB40028 */  lw         $s4, 0x28($sp)
/* 71638 80070A38 8FB30024 */  lw         $s3, 0x24($sp)
/* 7163C 80070A3C 8FB20020 */  lw         $s2, 0x20($sp)
/* 71640 80070A40 8FB1001C */  lw         $s1, 0x1c($sp)
/* 71644 80070A44 8FB00018 */  lw         $s0, 0x18($sp)
/* 71648 80070A48 03E00008 */  jr         $ra
/* 7164C 80070A4C 27BD0038 */   addiu     $sp, $sp, 0x38
