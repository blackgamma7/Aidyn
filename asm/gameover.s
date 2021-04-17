.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel Gameover_func
/* 24C60 80024060 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 24C64 80024064 24040D5F */  addiu      $a0, $zero, 0xd5f
/* 24C68 80024068 3C02800E */  lui        $v0, %hi(GameOverScenes)
/* 24C6C 8002406C 8C459EA0 */  lw         $a1, %lo(GameOverScenes)($v0)
/* 24C70 80024070 24439EA0 */  addiu      $v1, $v0, -0x6160
/* 24C74 80024074 AFBF006C */  sw         $ra, 0x6c($sp)
/* 24C78 80024078 AFB40068 */  sw         $s4, 0x68($sp)
/* 24C7C 8002407C AFB30064 */  sw         $s3, 0x64($sp)
/* 24C80 80024080 AFB20060 */  sw         $s2, 0x60($sp)
/* 24C84 80024084 AFB1005C */  sw         $s1, 0x5c($sp)
/* 24C88 80024088 AFB00058 */  sw         $s0, 0x58($sp)
/* 24C8C 8002408C 8C660004 */  lw         $a2, 4($v1)
/* 24C90 80024090 8C620008 */  lw         $v0, 8($v1)
/* 24C94 80024094 00009021 */  addu       $s2, $zero, $zero
/* 24C98 80024098 AFA50018 */  sw         $a1, 0x18($sp)
/* 24C9C 8002409C AFA6001C */  sw         $a2, 0x1c($sp)
/* 24CA0 800240A0 0C029B65 */  jal        get_borg_9
/* 24CA4 800240A4 AFA20020 */   sw        $v0, 0x20($sp)
/* 24CA8 800240A8 00003021 */  addu       $a2, $zero, $zero
/* 24CAC 800240AC 00008021 */  addu       $s0, $zero, $zero
/* 24CB0 800240B0 0040A021 */  addu       $s4, $v0, $zero
/* 24CB4 800240B4 26870008 */  addiu      $a3, $s4, 8
/* 24CB8 800240B8 08009032 */  j          .L800240C8
/* 24CBC 800240BC 3C08800E */   lui       $t0, 0x800e
.L800240C0:
/* 24CC0 800240C0 00021400 */  sll        $v0, $v0, 0x10
/* 24CC4 800240C4 00023403 */  sra        $a2, $v0, 0x10
.L800240C8:
/* 24CC8 800240C8 94E20028 */  lhu        $v0, 0x28($a3)
/* 24CCC 800240CC 00C2102A */  slt        $v0, $a2, $v0
/* 24CD0 800240D0 10400012 */  beqz       $v0, .L8002411C
/* 24CD4 800240D4 000610C0 */   sll       $v0, $a2, 3
/* 24CD8 800240D8 00461023 */  subu       $v0, $v0, $a2
/* 24CDC 800240DC 00021080 */  sll        $v0, $v0, 2
/* 24CE0 800240E0 00461023 */  subu       $v0, $v0, $a2
/* 24CE4 800240E4 8CE30044 */  lw         $v1, 0x44($a3)
/* 24CE8 800240E8 00021080 */  sll        $v0, $v0, 2
/* 24CEC 800240EC 00622821 */  addu       $a1, $v1, $v0
/* 24CF0 800240F0 94A40016 */  lhu        $a0, 0x16($a1)
/* 24CF4 800240F4 24020009 */  addiu      $v0, $zero, 9
/* 24CF8 800240F8 1482FFF1 */  bne        $a0, $v0, .L800240C0
/* 24CFC 800240FC 24C20001 */   addiu     $v0, $a2, 1
/* 24D00 80024100 00101080 */  sll        $v0, $s0, 2
/* 24D04 80024104 03A21821 */  addu       $v1, $sp, $v0
/* 24D08 80024108 94A40028 */  lhu        $a0, 0x28($a1)
/* 24D0C 8002410C 8C620018 */  lw         $v0, 0x18($v1)
/* 24D10 80024110 1482FFEB */  bne        $a0, $v0, .L800240C0
/* 24D14 80024114 24C20001 */   addiu     $v0, $a2, 1
/* 24D18 80024118 24B20028 */  addiu      $s2, $a1, 0x28
.L8002411C:
/* 24D1C 8002411C 251368A8 */  addiu      $s3, $t0, 0x68a8
/* 24D20 80024120 8E6215F8 */  lw         $v0, 0x15f8($s3)
/* 24D24 80024124 8C510000 */  lw         $s1, ($v0)
/* 24D28 80024128 16200005 */  bnez       $s1, .L80024140
/* 24D2C 8002412C 3C04800E */   lui       $a0, %hi(D_800D9EAC)
/* 24D30 80024130 24849EAC */  addiu      $a0, $a0, %lo(D_800D9EAC)
/* 24D34 80024134 3C05800E */  lui        $a1, %hi(D_800D9EC0)
/* 24D38 80024138 0C025F2D */  jal        manualCrash
/* 24D3C 8002413C 24A59EC0 */   addiu     $a1, $a1, %lo(D_800D9EC0)
.L80024140:
/* 24D40 80024140 0C01DEBD */  jal        getHPMax
/* 24D44 80024144 02202021 */   addu      $a0, $s1, $zero
/* 24D48 80024148 02202021 */  addu       $a0, $s1, $zero
/* 24D4C 8002414C 0C01DED7 */  jal        getHPCurrent
/* 24D50 80024150 00408021 */   addu      $s0, $v0, $zero
/* 24D54 80024154 02202021 */  addu       $a0, $s1, $zero
/* 24D58 80024158 02028023 */  subu       $s0, $s0, $v0
/* 24D5C 8002415C 0C01DFC1 */  jal        addHP
/* 24D60 80024160 3205FFFF */   andi      $a1, $s0, 0xffff
/* 24D64 80024164 56400007 */  bnel       $s2, $zero, .L80024184
/* 24D68 80024168 92630040 */   lbu       $v1, 0x40($s3)
/* 24D6C 8002416C 3C04800E */  lui        $a0, %hi(D_800D9EC0)
/* 24D70 80024170 24849EC0 */  addiu      $a0, $a0, %lo(D_800D9EC0)
/* 24D74 80024174 3C05800E */  lui        $a1, %hi(D_800D9ED4)
/* 24D78 80024178 0C025F2D */  jal        manualCrash
/* 24D7C 8002417C 24A59ED4 */   addiu     $a1, $a1, %lo(D_800D9ED4)
/* 24D80 80024180 92630040 */  lbu        $v1, 0x40($s3)
.L80024184:
/* 24D84 80024184 24020002 */  addiu      $v0, $zero, 2
/* 24D88 80024188 54620004 */  bnel       $v1, $v0, .L8002419C
/* 24D8C 8002418C 96440000 */   lhu       $a0, ($s2)
/* 24D90 80024190 24020015 */  addiu      $v0, $zero, 0x15
/* 24D94 80024194 A26213C8 */  sb         $v0, 0x13c8($s3)
/* 24D98 80024198 96440000 */  lhu        $a0, ($s2)
.L8002419C:
/* 24D9C 8002419C 96450008 */  lhu        $a1, 8($s2)
/* 24DA0 800241A0 86460002 */  lh         $a2, 2($s2)
/* 24DA4 800241A4 86470004 */  lh         $a3, 4($s2)
/* 24DA8 800241A8 86430006 */  lh         $v1, 6($s2)
/* 24DAC 800241AC 24027FFF */  addiu      $v0, $zero, 0x7fff
/* 24DB0 800241B0 AFA20014 */  sw         $v0, 0x14($sp)
/* 24DB4 800241B4 0C015ED0 */  jal        dialoug_func
/* 24DB8 800241B8 AFA30010 */   sw        $v1, 0x10($sp)
/* 24DBC 800241BC 0C029B70 */  jal        remove_borg_9
/* 24DC0 800241C0 02802021 */   addu      $a0, $s4, $zero
/* 24DC4 800241C4 8FBF006C */  lw         $ra, 0x6c($sp)
/* 24DC8 800241C8 8FB40068 */  lw         $s4, 0x68($sp)
/* 24DCC 800241CC 8FB30064 */  lw         $s3, 0x64($sp)
/* 24DD0 800241D0 8FB20060 */  lw         $s2, 0x60($sp)
/* 24DD4 800241D4 8FB1005C */  lw         $s1, 0x5c($sp)
/* 24DD8 800241D8 8FB00058 */  lw         $s0, 0x58($sp)
/* 24DDC 800241DC 03E00008 */  jr         $ra
/* 24DE0 800241E0 27BD0070 */   addiu     $sp, $sp, 0x70
/* 24DE4 800241E4 00000000 */  nop
/* 24DE8 800241E8 00000000 */  nop
/* 24DEC 800241EC 00000000 */  nop
