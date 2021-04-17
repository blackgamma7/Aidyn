.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8001AB70
/* 1B770 8001AB70 27BDFF10 */  addiu      $sp, $sp, -0xf0
/* 1B774 8001AB74 AFB600C8 */  sw         $s6, 0xc8($sp)
/* 1B778 8001AB78 0080B021 */  addu       $s6, $a0, $zero
/* 1B77C 8001AB7C 3C02800E */  lui        $v0, %hi(particleEmmiterStruct)
/* 1B780 8001AB80 AFBE00D0 */  sw         $fp, 0xd0($sp)
/* 1B784 8001AB84 245E6CD8 */  addiu      $fp, $v0, %lo(particleEmmiterStruct)
/* 1B788 8001AB88 F7B400D8 */  sdc1       $f20, 0xd8($sp)
/* 1B78C 8001AB8C 4485A000 */  mtc1       $a1, $f20
/* 1B790 8001AB90 87A20102 */  lh         $v0, 0x102($sp)
/* 1B794 8001AB94 03C02021 */  addu       $a0, $fp, $zero
/* 1B798 8001AB98 F7B800E8 */  sdc1       $f24, 0xe8($sp)
/* 1B79C 8001AB9C C7B80108 */  lwc1       $f24, 0x108($sp)
/* 1B7A0 8001ABA0 00073C00 */  sll        $a3, $a3, 0x10
/* 1B7A4 8001ABA4 AFB500C4 */  sw         $s5, 0xc4($sp)
/* 1B7A8 8001ABA8 0007AC03 */  sra        $s5, $a3, 0x10
/* 1B7AC 8001ABAC F7B600E0 */  sdc1       $f22, 0xe0($sp)
/* 1B7B0 8001ABB0 C7B6010C */  lwc1       $f22, 0x10c($sp)
/* 1B7B4 8001ABB4 02A02821 */  addu       $a1, $s5, $zero
/* 1B7B8 8001ABB8 AFB200B8 */  sw         $s2, 0xb8($sp)
/* 1B7BC 8001ABBC 00C09021 */  addu       $s2, $a2, $zero
/* 1B7C0 8001ABC0 AFB700CC */  sw         $s7, 0xcc($sp)
/* 1B7C4 8001ABC4 87B70106 */  lh         $s7, 0x106($sp)
/* 1B7C8 8001ABC8 00403021 */  addu       $a2, $v0, $zero
/* 1B7CC 8001ABCC 97A20116 */  lhu        $v0, 0x116($sp)
/* 1B7D0 8001ABD0 00003821 */  addu       $a3, $zero, $zero
/* 1B7D4 8001ABD4 AFBF00D4 */  sw         $ra, 0xd4($sp)
/* 1B7D8 8001ABD8 AFB400C0 */  sw         $s4, 0xc0($sp)
/* 1B7DC 8001ABDC AFB300BC */  sw         $s3, 0xbc($sp)
/* 1B7E0 8001ABE0 AFB100B4 */  sw         $s1, 0xb4($sp)
/* 1B7E4 8001ABE4 AFB000B0 */  sw         $s0, 0xb0($sp)
/* 1B7E8 8001ABE8 AFA00010 */  sw         $zero, 0x10($sp)
/* 1B7EC 8001ABEC AFA00014 */  sw         $zero, 0x14($sp)
/* 1B7F0 8001ABF0 AFA00018 */  sw         $zero, 0x18($sp)
/* 1B7F4 8001ABF4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 1B7F8 8001ABF8 AFA00020 */  sw         $zero, 0x20($sp)
/* 1B7FC 8001ABFC 0C02CA38 */  jal        AllocParticleEmitter
/* 1B800 8001AC00 AFA200A8 */   sw        $v0, 0xa8($sp)
/* 1B804 8001AC04 00409821 */  addu       $s3, $v0, $zero
/* 1B808 8001AC08 12600070 */  beqz       $s3, .L8001ADCC
/* 1B80C 8001AC0C 8FBF00D4 */   lw        $ra, 0xd4($sp)
/* 1B810 8001AC10 4405A000 */  mfc1       $a1, $f20
/* 1B814 8001AC14 0C02CB3E */  jal        func_800B2CF8
/* 1B818 8001AC18 02602021 */   addu      $a0, $s3, $zero
/* 1B81C 8001AC1C 8E710014 */  lw         $s1, 0x14($s3)
/* 1B820 8001AC20 24050100 */  addiu      $a1, $zero, 0x100
/* 1B824 8001AC24 0C02CB2A */  jal        particle_set_flags
/* 1B828 8001AC28 02202021 */   addu      $a0, $s1, $zero
/* 1B82C 8001AC2C 44800000 */  mtc1       $zero, $f0
/* 1B830 8001AC30 8FA60110 */  lw         $a2, 0x110($sp)
/* 1B834 8001AC34 3C01800E */  lui        $at, %hi(D_800D9680)
/* 1B838 8001AC38 C4229680 */  lwc1       $f2, %lo(D_800D9680)($at)
/* 1B83C 8001AC3C 44050000 */  mfc1       $a1, $f0
/* 1B840 8001AC40 02202021 */  addu       $a0, $s1, $zero
/* 1B844 8001AC44 E7A20010 */  swc1       $f2, 0x10($sp)
/* 1B848 8001AC48 0C02CB24 */  jal        func_800B2C90
/* 1B84C 8001AC4C 00A03821 */   addu      $a3, $a1, $zero
/* 1B850 8001AC50 03C02021 */  addu       $a0, $fp, $zero
/* 1B854 8001AC54 02602821 */  addu       $a1, $s3, $zero
/* 1B858 8001AC58 0C02C9F3 */  jal        func_800B27CC
/* 1B85C 8001AC5C 02A03021 */   addu      $a2, $s5, $zero
/* 1B860 8001AC60 00408821 */  addu       $s1, $v0, $zero
/* 1B864 8001AC64 02202021 */  addu       $a0, $s1, $zero
/* 1B868 8001AC68 0C02CB2A */  jal        particle_set_flags
/* 1B86C 8001AC6C 24050200 */   addiu     $a1, $zero, 0x200
/* 1B870 8001AC70 8E450000 */  lw         $a1, ($s2)
/* 1B874 8001AC74 8E460004 */  lw         $a2, 4($s2)
/* 1B878 8001AC78 8E470008 */  lw         $a3, 8($s2)
/* 1B87C 8001AC7C C640000C */  lwc1       $f0, 0xc($s2)
/* 1B880 8001AC80 02202021 */  addu       $a0, $s1, $zero
/* 1B884 8001AC84 0C02CB24 */  jal        func_800B2C90
/* 1B888 8001AC88 E7A00010 */   swc1      $f0, 0x10($sp)
/* 1B88C 8001AC8C 2630003C */  addiu      $s0, $s1, 0x3c
/* 1B890 8001AC90 0C02AD27 */  jal        negVec4
/* 1B894 8001AC94 02002021 */   addu      $a0, $s0, $zero
/* 1B898 8001AC98 0C02CB0B */  jal        func_800B2C2C
/* 1B89C 8001AC9C 02202021 */   addu      $a0, $s1, $zero
/* 1B8A0 8001ACA0 44050000 */  mfc1       $a1, $f0
/* 1B8A4 8001ACA4 0C02AD47 */  jal        multiVec4
/* 1B8A8 8001ACA8 02002021 */   addu      $a0, $s0, $zero
/* 1B8AC 8001ACAC 1AE00027 */  blez       $s7, .L8001AD4C
/* 1B8B0 8001ACB0 27D4FBD0 */   addiu     $s4, $fp, -0x430
/* 1B8B4 8001ACB4 3C01800E */  lui        $at, %hi(D_800D9684)
/* 1B8B8 8001ACB8 C4349684 */  lwc1       $f20, %lo(D_800D9684)($at)
/* 1B8BC 8001ACBC 3C100001 */  lui        $s0, 1
.L8001ACC0:
/* 1B8C0 8001ACC0 03C02021 */  addu       $a0, $fp, $zero
/* 1B8C4 8001ACC4 02602821 */  addu       $a1, $s3, $zero
/* 1B8C8 8001ACC8 0C02C9DF */  jal        func_800B277C
/* 1B8CC 8001ACCC 02A03021 */   addu      $a2, $s5, $zero
/* 1B8D0 8001ACD0 00408821 */  addu       $s1, $v0, $zero
/* 1B8D4 8001ACD4 4405A000 */  mfc1       $a1, $f20
/* 1B8D8 8001ACD8 4406A000 */  mfc1       $a2, $f20
/* 1B8DC 8001ACDC 0C02CB21 */  jal        func_800B2C84
/* 1B8E0 8001ACE0 02202021 */   addu      $a0, $s1, $zero
/* 1B8E4 8001ACE4 8EC50000 */  lw         $a1, ($s6)
/* 1B8E8 8001ACE8 8EC60004 */  lw         $a2, 4($s6)
/* 1B8EC 8001ACEC 8EC70008 */  lw         $a3, 8($s6)
/* 1B8F0 8001ACF0 0C02CB19 */  jal        func_800B2C64
/* 1B8F4 8001ACF4 02202021 */   addu      $a0, $s1, $zero
/* 1B8F8 8001ACF8 8E450000 */  lw         $a1, ($s2)
/* 1B8FC 8001ACFC 8E460004 */  lw         $a2, 4($s2)
/* 1B900 8001AD00 8E470008 */  lw         $a3, 8($s2)
/* 1B904 8001AD04 C640000C */  lwc1       $f0, 0xc($s2)
/* 1B908 8001AD08 02202021 */  addu       $a0, $s1, $zero
/* 1B90C 8001AD0C 0C02CB13 */  jal        func_800B2C4C
/* 1B910 8001AD10 E7A00010 */   swc1      $f0, 0x10($sp)
/* 1B914 8001AD14 4405C000 */  mfc1       $a1, $f24
/* 1B918 8001AD18 4406B000 */  mfc1       $a2, $f22
/* 1B91C 8001AD1C 0C0273E4 */  jal        rand_float_range
/* 1B920 8001AD20 02802021 */   addu      $a0, $s4, $zero
/* 1B924 8001AD24 02802021 */  addu       $a0, $s4, $zero
/* 1B928 8001AD28 44060000 */  mfc1       $a2, $f0
/* 1B92C 8001AD2C 0C02742B */  jal        rand_vec3
/* 1B930 8001AD30 26250018 */   addiu     $a1, $s1, 0x18
/* 1B934 8001AD34 02001821 */  addu       $v1, $s0, $zero
/* 1B938 8001AD38 3C080001 */  lui        $t0, 1
/* 1B93C 8001AD3C 00031403 */  sra        $v0, $v1, 0x10
/* 1B940 8001AD40 0057102A */  slt        $v0, $v0, $s7
/* 1B944 8001AD44 1440FFDE */  bnez       $v0, .L8001ACC0
/* 1B948 8001AD48 02088021 */   addu      $s0, $s0, $t0
.L8001AD4C:
/* 1B94C 8001AD4C 240200FF */  addiu      $v0, $zero, 0xff
/* 1B950 8001AD50 8FA900A8 */  lw         $t1, 0xa8($sp)
/* 1B954 8001AD54 24030080 */  addiu      $v1, $zero, 0x80
/* 1B958 8001AD58 A3A20028 */  sb         $v0, 0x28($sp)
/* 1B95C 8001AD5C A3A30029 */  sb         $v1, 0x29($sp)
/* 1B960 8001AD60 A3A0002B */  sb         $zero, 0x2b($sp)
/* 1B964 8001AD64 A3A0002A */  sb         $zero, 0x2a($sp)
/* 1B968 8001AD68 A3A0006B */  sb         $zero, 0x6b($sp)
/* 1B96C 8001AD6C A3A0006A */  sb         $zero, 0x6a($sp)
/* 1B970 8001AD70 A3A00069 */  sb         $zero, 0x69($sp)
/* 1B974 8001AD74 11200014 */  beqz       $t1, .L8001ADC8
/* 1B978 8001AD78 A3A00068 */   sb        $zero, 0x68($sp)
/* 1B97C 8001AD7C 3C04800E */  lui        $a0, %hi(dynamic_light_struct)
/* 1B980 8001AD80 24847120 */  addiu      $a0, $a0, %lo(dynamic_light_struct)
/* 1B984 8001AD84 24050078 */  addiu      $a1, $zero, 0x78
/* 1B988 8001AD88 3C074120 */  lui        $a3, 0x4120
/* 1B98C 8001AD8C 3C01800E */  lui        $at, %hi(D_800D9688)
/* 1B990 8001AD90 C4209688 */  lwc1       $f0, %lo(D_800D9688)($at)
/* 1B994 8001AD94 24020001 */  addiu      $v0, $zero, 1
/* 1B998 8001AD98 AFA20010 */  sw         $v0, 0x10($sp)
/* 1B99C 8001AD9C E7A00014 */  swc1       $f0, 0x14($sp)
/* 1B9A0 8001ADA0 8BA20028 */  lwl        $v0, 0x28($sp)
/* 1B9A4 8001ADA4 9BA2002B */  lwr        $v0, 0x2b($sp)
/* 1B9A8 8001ADA8 ABA20018 */  swl        $v0, 0x18($sp)
/* 1B9AC 8001ADAC BBA2001B */  swr        $v0, 0x1b($sp)
/* 1B9B0 8001ADB0 8BA20068 */  lwl        $v0, 0x68($sp)
/* 1B9B4 8001ADB4 9BA2006B */  lwr        $v0, 0x6b($sp)
/* 1B9B8 8001ADB8 ABA2001C */  swl        $v0, 0x1c($sp)
/* 1B9BC 8001ADBC BBA2001F */  swr        $v0, 0x1f($sp)
/* 1B9C0 8001ADC0 0C015560 */  jal        AllocDynamicLight
/* 1B9C4 8001ADC4 02C03021 */   addu      $a2, $s6, $zero
.L8001ADC8:
/* 1B9C8 8001ADC8 8FBF00D4 */  lw         $ra, 0xd4($sp)
.L8001ADCC:
/* 1B9CC 8001ADCC 8FBE00D0 */  lw         $fp, 0xd0($sp)
/* 1B9D0 8001ADD0 8FB700CC */  lw         $s7, 0xcc($sp)
/* 1B9D4 8001ADD4 8FB600C8 */  lw         $s6, 0xc8($sp)
/* 1B9D8 8001ADD8 8FB500C4 */  lw         $s5, 0xc4($sp)
/* 1B9DC 8001ADDC 8FB400C0 */  lw         $s4, 0xc0($sp)
/* 1B9E0 8001ADE0 8FB300BC */  lw         $s3, 0xbc($sp)
/* 1B9E4 8001ADE4 8FB200B8 */  lw         $s2, 0xb8($sp)
/* 1B9E8 8001ADE8 8FB100B4 */  lw         $s1, 0xb4($sp)
/* 1B9EC 8001ADEC 8FB000B0 */  lw         $s0, 0xb0($sp)
/* 1B9F0 8001ADF0 D7B800E8 */  ldc1       $f24, 0xe8($sp)
/* 1B9F4 8001ADF4 D7B600E0 */  ldc1       $f22, 0xe0($sp)
/* 1B9F8 8001ADF8 D7B400D8 */  ldc1       $f20, 0xd8($sp)
/* 1B9FC 8001ADFC 03E00008 */  jr         $ra
/* 1BA00 8001AE00 27BD00F0 */   addiu     $sp, $sp, 0xf0

glabel ofunc_sub_8001ae04
/* 1BA04 8001AE04 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1BA08 8001AE08 AFB20020 */  sw         $s2, 0x20($sp)
/* 1BA0C 8001AE0C 00A09021 */  addu       $s2, $a1, $zero
/* 1BA10 8001AE10 AFBF0028 */  sw         $ra, 0x28($sp)
/* 1BA14 8001AE14 AFB30024 */  sw         $s3, 0x24($sp)
/* 1BA18 8001AE18 AFB1001C */  sw         $s1, 0x1c($sp)
/* 1BA1C 8001AE1C AFB00018 */  sw         $s0, 0x18($sp)
/* 1BA20 8001AE20 9642000C */  lhu        $v0, 0xc($s2)
/* 1BA24 8001AE24 30422000 */  andi       $v0, $v0, 0x2000
/* 1BA28 8001AE28 10400002 */  beqz       $v0, .L8001AE34
/* 1BA2C 8001AE2C 8E5301C4 */   lw        $s3, 0x1c4($s2)
/* 1BA30 8001AE30 265301D4 */  addiu      $s3, $s2, 0x1d4
.L8001AE34:
/* 1BA34 8001AE34 02402821 */  addu       $a1, $s2, $zero
/* 1BA38 8001AE38 0C02C9DF */  jal        func_800B277C
/* 1BA3C 8001AE3C 24060078 */   addiu     $a2, $zero, 0x78
/* 1BA40 8001AE40 3C01800E */  lui        $at, %hi(D_800D968C)
/* 1BA44 8001AE44 C420968C */  lwc1       $f0, %lo(D_800D968C)($at)
/* 1BA48 8001AE48 00408821 */  addu       $s1, $v0, $zero
/* 1BA4C 8001AE4C 44050000 */  mfc1       $a1, $f0
/* 1BA50 8001AE50 02202021 */  addu       $a0, $s1, $zero
/* 1BA54 8001AE54 0C02CB21 */  jal        func_800B2C84
/* 1BA58 8001AE58 00A03021 */   addu      $a2, $a1, $zero
/* 1BA5C 8001AE5C C6620000 */  lwc1       $f2, ($s3)
/* 1BA60 8001AE60 C6400030 */  lwc1       $f0, 0x30($s2)
/* 1BA64 8001AE64 C6640004 */  lwc1       $f4, 4($s3)
/* 1BA68 8001AE68 46001080 */  add.s      $f2, $f2, $f0
/* 1BA6C 8001AE6C C6400034 */  lwc1       $f0, 0x34($s2)
/* 1BA70 8001AE70 46002100 */  add.s      $f4, $f4, $f0
/* 1BA74 8001AE74 C6400038 */  lwc1       $f0, 0x38($s2)
/* 1BA78 8001AE78 44051000 */  mfc1       $a1, $f2
/* 1BA7C 8001AE7C C6620008 */  lwc1       $f2, 8($s3)
/* 1BA80 8001AE80 46001080 */  add.s      $f2, $f2, $f0
/* 1BA84 8001AE84 44062000 */  mfc1       $a2, $f4
/* 1BA88 8001AE88 44071000 */  mfc1       $a3, $f2
/* 1BA8C 8001AE8C 0C02CB19 */  jal        func_800B2C64
/* 1BA90 8001AE90 02202021 */   addu      $a0, $s1, $zero
/* 1BA94 8001AE94 8E450044 */  lw         $a1, 0x44($s2)
/* 1BA98 8001AE98 8E460048 */  lw         $a2, 0x48($s2)
/* 1BA9C 8001AE9C 8E47004C */  lw         $a3, 0x4c($s2)
/* 1BAA0 8001AEA0 C6400050 */  lwc1       $f0, 0x50($s2)
/* 1BAA4 8001AEA4 02202021 */  addu       $a0, $s1, $zero
/* 1BAA8 8001AEA8 0C02CB13 */  jal        func_800B2C4C
/* 1BAAC 8001AEAC E7A00010 */   swc1      $f0, 0x10($sp)
/* 1BAB0 8001AEB0 3C10800E */  lui        $s0, %hi(gGlobals)
/* 1BAB4 8001AEB4 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 1BAB8 8001AEB8 3C053C23 */  lui        $a1, 0x3c23
/* 1BABC 8001AEBC 34A5D70A */  ori        $a1, $a1, 0xd70a
/* 1BAC0 8001AEC0 3C063CA3 */  lui        $a2, 0x3ca3
/* 1BAC4 8001AEC4 34C6D70A */  ori        $a2, $a2, 0xd70a
/* 1BAC8 8001AEC8 0C0273E4 */  jal        rand_float_range
/* 1BACC 8001AECC 02002021 */   addu      $a0, $s0, $zero
/* 1BAD0 8001AED0 02002021 */  addu       $a0, $s0, $zero
/* 1BAD4 8001AED4 26310018 */  addiu      $s1, $s1, 0x18
/* 1BAD8 8001AED8 44060000 */  mfc1       $a2, $f0
/* 1BADC 8001AEDC 0C02742B */  jal        rand_vec3
/* 1BAE0 8001AEE0 02202821 */   addu      $a1, $s1, $zero
/* 1BAE4 8001AEE4 02202021 */  addu       $a0, $s1, $zero
/* 1BAE8 8001AEE8 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 1BAEC 8001AEEC 8C451BBC */  lw         $a1, %lo(TerrainPointer)($v0)
/* 1BAF0 8001AEF0 00803021 */  addu       $a2, $a0, $zero
/* 1BAF4 8001AEF4 0C02AB4D */  jal        vec3_sum
/* 1BAF8 8001AEF8 24A50014 */   addiu     $a1, $a1, 0x14
/* 1BAFC 8001AEFC C6600004 */  lwc1       $f0, 4($s3)
/* 1BB00 8001AF00 C6420040 */  lwc1       $f2, 0x40($s2)
/* 1BB04 8001AF04 46020000 */  add.s      $f0, $f0, $f2
/* 1BB08 8001AF08 C6440010 */  lwc1       $f4, 0x10($s2)
/* 1BB0C 8001AF0C 4600203C */  c.lt.s     $f4, $f0
/* 1BB10 8001AF10 00000000 */  nop
/* 1BB14 8001AF14 45000002 */  bc1f       .L8001AF20
/* 1BB18 8001AF18 46000086 */   mov.s     $f2, $f0
/* 1BB1C 8001AF1C 46002086 */  mov.s      $f2, $f4
.L8001AF20:
/* 1BB20 8001AF20 8FBF0028 */  lw         $ra, 0x28($sp)
/* 1BB24 8001AF24 8FB30024 */  lw         $s3, 0x24($sp)
/* 1BB28 8001AF28 E6420010 */  swc1       $f2, 0x10($s2)
/* 1BB2C 8001AF2C 8FB20020 */  lw         $s2, 0x20($sp)
/* 1BB30 8001AF30 8FB1001C */  lw         $s1, 0x1c($sp)
/* 1BB34 8001AF34 8FB00018 */  lw         $s0, 0x18($sp)
/* 1BB38 8001AF38 03E00008 */  jr         $ra
/* 1BB3C 8001AF3C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8001AF40
/* 1BB40 8001AF40 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 1BB44 8001AF44 AFB1002C */  sw         $s1, 0x2c($sp)
/* 1BB48 8001AF48 00808821 */  addu       $s1, $a0, $zero
/* 1BB4C 8001AF4C 3C02800E */  lui        $v0, %hi(particleEmmiterStruct)
/* 1BB50 8001AF50 AFB5003C */  sw         $s5, 0x3c($sp)
/* 1BB54 8001AF54 24556CD8 */  addiu      $s5, $v0, %lo(particleEmmiterStruct)
/* 1BB58 8001AF58 02A02021 */  addu       $a0, $s5, $zero
/* 1BB5C 8001AF5C F7B40048 */  sdc1       $f20, 0x48($sp)
/* 1BB60 8001AF60 4487A000 */  mtc1       $a3, $f20
/* 1BB64 8001AF64 3C028002 */  lui        $v0, %hi(ofunc_sub_8001ae04)
/* 1BB68 8001AF68 AFB30034 */  sw         $s3, 0x34($sp)
/* 1BB6C 8001AF6C 87B30062 */  lh         $s3, 0x62($sp)
/* 1BB70 8001AF70 2442AE04 */  addiu      $v0, $v0, %lo(ofunc_sub_8001ae04)
/* 1BB74 8001AF74 AFA20014 */  sw         $v0, 0x14($sp)
/* 1BB78 8001AF78 87A20066 */  lh         $v0, 0x66($sp)
/* 1BB7C 8001AF7C 00003821 */  addu       $a3, $zero, $zero
/* 1BB80 8001AF80 AFB40038 */  sw         $s4, 0x38($sp)
/* 1BB84 8001AF84 00A0A021 */  addu       $s4, $a1, $zero
/* 1BB88 8001AF88 AFB20030 */  sw         $s2, 0x30($sp)
/* 1BB8C 8001AF8C 00C09021 */  addu       $s2, $a2, $zero
/* 1BB90 8001AF90 AFBF0040 */  sw         $ra, 0x40($sp)
/* 1BB94 8001AF94 AFB00028 */  sw         $s0, 0x28($sp)
/* 1BB98 8001AF98 AFA00010 */  sw         $zero, 0x10($sp)
/* 1BB9C 8001AF9C AFA00018 */  sw         $zero, 0x18($sp)
/* 1BBA0 8001AFA0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 1BBA4 8001AFA4 AFA00020 */  sw         $zero, 0x20($sp)
/* 1BBA8 8001AFA8 02602821 */  addu       $a1, $s3, $zero
/* 1BBAC 8001AFAC 0C02CA38 */  jal        AllocParticleEmitter
/* 1BBB0 8001AFB0 00403021 */   addu      $a2, $v0, $zero
/* 1BBB4 8001AFB4 00408021 */  addu       $s0, $v0, $zero
/* 1BBB8 8001AFB8 12000032 */  beqz       $s0, .L8001B084
/* 1BBBC 8001AFBC 8FBF0040 */   lw        $ra, 0x40($sp)
/* 1BBC0 8001AFC0 C6200004 */  lwc1       $f0, 4($s1)
/* 1BBC4 8001AFC4 3C01800E */  lui        $at, %hi(D_800D9690)
/* 1BBC8 8001AFC8 D4229690 */  ldc1       $f2, %lo(D_800D9690)($at)
/* 1BBCC 8001AFCC 46000021 */  cvt.d.s    $f0, $f0
/* 1BBD0 8001AFD0 46220001 */  sub.d      $f0, $f0, $f2
/* 1BBD4 8001AFD4 46200020 */  cvt.s.d    $f0, $f0
/* 1BBD8 8001AFD8 44050000 */  mfc1       $a1, $f0
/* 1BBDC 8001AFDC 0C02CB3E */  jal        func_800B2CF8
/* 1BBE0 8001AFE0 02002021 */   addu      $a0, $s0, $zero
/* 1BBE4 8001AFE4 02402021 */  addu       $a0, $s2, $zero
/* 1BBE8 8001AFE8 0C02AD1E */  jal        copyVec4
/* 1BBEC 8001AFEC 26050044 */   addiu     $a1, $s0, 0x44
/* 1BBF0 8001AFF0 02802021 */  addu       $a0, $s4, $zero
/* 1BBF4 8001AFF4 0C02AD17 */  jal        copyVec3
/* 1BBF8 8001AFF8 26050030 */   addiu     $a1, $s0, 0x30
/* 1BBFC 8001AFFC 8E110014 */  lw         $s1, 0x14($s0)
/* 1BC00 8001B000 24050100 */  addiu      $a1, $zero, 0x100
/* 1BC04 8001B004 E6140040 */  swc1       $f20, 0x40($s0)
/* 1BC08 8001B008 0C02CB2A */  jal        particle_set_flags
/* 1BC0C 8001B00C 02202021 */   addu      $a0, $s1, $zero
/* 1BC10 8001B010 44800000 */  mtc1       $zero, $f0
/* 1BC14 8001B014 8FA60068 */  lw         $a2, 0x68($sp)
/* 1BC18 8001B018 3C01800E */  lui        $at, %hi(D_800D9698)
/* 1BC1C 8001B01C C4229698 */  lwc1       $f2, %lo(D_800D9698)($at)
/* 1BC20 8001B020 44050000 */  mfc1       $a1, $f0
/* 1BC24 8001B024 02202021 */  addu       $a0, $s1, $zero
/* 1BC28 8001B028 E7A20010 */  swc1       $f2, 0x10($sp)
/* 1BC2C 8001B02C 0C02CB24 */  jal        func_800B2C90
/* 1BC30 8001B030 00A03821 */   addu      $a3, $a1, $zero
/* 1BC34 8001B034 02A02021 */  addu       $a0, $s5, $zero
/* 1BC38 8001B038 02002821 */  addu       $a1, $s0, $zero
/* 1BC3C 8001B03C 0C02C9F3 */  jal        func_800B27CC
/* 1BC40 8001B040 02603021 */   addu      $a2, $s3, $zero
/* 1BC44 8001B044 00408821 */  addu       $s1, $v0, $zero
/* 1BC48 8001B048 02202021 */  addu       $a0, $s1, $zero
/* 1BC4C 8001B04C 0C02CB2A */  jal        particle_set_flags
/* 1BC50 8001B050 24050200 */   addiu     $a1, $zero, 0x200
/* 1BC54 8001B054 8E450000 */  lw         $a1, ($s2)
/* 1BC58 8001B058 8E460004 */  lw         $a2, 4($s2)
/* 1BC5C 8001B05C 8E470008 */  lw         $a3, 8($s2)
/* 1BC60 8001B060 C640000C */  lwc1       $f0, 0xc($s2)
/* 1BC64 8001B064 02202021 */  addu       $a0, $s1, $zero
/* 1BC68 8001B068 0C02CB24 */  jal        func_800B2C90
/* 1BC6C 8001B06C E7A00010 */   swc1      $f0, 0x10($sp)
/* 1BC70 8001B070 3C05BC08 */  lui        $a1, 0xbc08
/* 1BC74 8001B074 34A58889 */  ori        $a1, $a1, 0x8889
/* 1BC78 8001B078 0C02AD47 */  jal        multiVec4
/* 1BC7C 8001B07C 2624003C */   addiu     $a0, $s1, 0x3c
/* 1BC80 8001B080 8FBF0040 */  lw         $ra, 0x40($sp)
.L8001B084:
/* 1BC84 8001B084 8FB5003C */  lw         $s5, 0x3c($sp)
/* 1BC88 8001B088 8FB40038 */  lw         $s4, 0x38($sp)
/* 1BC8C 8001B08C 8FB30034 */  lw         $s3, 0x34($sp)
/* 1BC90 8001B090 8FB20030 */  lw         $s2, 0x30($sp)
/* 1BC94 8001B094 8FB1002C */  lw         $s1, 0x2c($sp)
/* 1BC98 8001B098 8FB00028 */  lw         $s0, 0x28($sp)
/* 1BC9C 8001B09C D7B40048 */  ldc1       $f20, 0x48($sp)
/* 1BCA0 8001B0A0 03E00008 */  jr         $ra
/* 1BCA4 8001B0A4 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_8001B0A8
/* 1BCA8 8001B0A8 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 1BCAC 8001B0AC AFB20098 */  sw         $s2, 0x98($sp)
/* 1BCB0 8001B0B0 00A09021 */  addu       $s2, $a1, $zero
/* 1BCB4 8001B0B4 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 1BCB8 8001B0B8 AFB3009C */  sw         $s3, 0x9c($sp)
/* 1BCBC 8001B0BC AFB10094 */  sw         $s1, 0x94($sp)
/* 1BCC0 8001B0C0 AFB00090 */  sw         $s0, 0x90($sp)
/* 1BCC4 8001B0C4 0C02C9DF */  jal        func_800B277C
/* 1BCC8 8001B0C8 8646001A */   lh        $a2, 0x1a($s2)
/* 1BCCC 8001B0CC 3C01800E */  lui        $at, %hi(D_800D969C)
/* 1BCD0 8001B0D0 C420969C */  lwc1       $f0, %lo(D_800D969C)($at)
/* 1BCD4 8001B0D4 00409821 */  addu       $s3, $v0, $zero
/* 1BCD8 8001B0D8 44050000 */  mfc1       $a1, $f0
/* 1BCDC 8001B0DC 02602021 */  addu       $a0, $s3, $zero
/* 1BCE0 8001B0E0 0C02CB21 */  jal        func_800B2C84
/* 1BCE4 8001B0E4 00A03021 */   addu      $a2, $a1, $zero
/* 1BCE8 8001B0E8 9642000C */  lhu        $v0, 0xc($s2)
/* 1BCEC 8001B0EC 30422000 */  andi       $v0, $v0, 0x2000
/* 1BCF0 8001B0F0 10400002 */  beqz       $v0, .L8001B0FC
/* 1BCF4 8001B0F4 26500024 */   addiu     $s0, $s2, 0x24
/* 1BCF8 8001B0F8 265001D4 */  addiu      $s0, $s2, 0x1d4
.L8001B0FC:
/* 1BCFC 8001B0FC 8E4501C4 */  lw         $a1, 0x1c4($s2)
/* 1BD00 8001B100 10A00008 */  beqz       $a1, .L8001B124
/* 1BD04 8001B104 02002021 */   addu      $a0, $s0, $zero
/* 1BD08 8001B108 8CA20024 */  lw         $v0, 0x24($a1)
/* 1BD0C 8001B10C 84430002 */  lh         $v1, 2($v0)
/* 1BD10 8001B110 50600004 */  beql       $v1, $zero, .L8001B124
/* 1BD14 8001B114 AE4001C4 */   sw        $zero, 0x1c4($s2)
/* 1BD18 8001B118 0C02AD17 */  jal        copyVec3
/* 1BD1C 8001B11C 02002021 */   addu      $a0, $s0, $zero
/* 1BD20 8001B120 02002021 */  addu       $a0, $s0, $zero
.L8001B124:
/* 1BD24 8001B124 0C02AD17 */  jal        copyVec3
/* 1BD28 8001B128 2665000C */   addiu     $a1, $s3, 0xc
/* 1BD2C 8001B12C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 1BD30 8001B130 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 1BD34 8001B134 8E450030 */  lw         $a1, 0x30($s2)
/* 1BD38 8001B138 0C0273D2 */  jal        rand_float_multi
/* 1BD3C 8001B13C 02002021 */   addu      $a0, $s0, $zero
/* 1BD40 8001B140 02002021 */  addu       $a0, $s0, $zero
/* 1BD44 8001B144 27B10050 */  addiu      $s1, $sp, 0x50
/* 1BD48 8001B148 44060000 */  mfc1       $a2, $f0
/* 1BD4C 8001B14C 0C0273FF */  jal        rand_vec2
/* 1BD50 8001B150 02202821 */   addu      $a1, $s1, $zero
/* 1BD54 8001B154 C660000C */  lwc1       $f0, 0xc($s3)
/* 1BD58 8001B158 C7A20050 */  lwc1       $f2, 0x50($sp)
/* 1BD5C 8001B15C 46020000 */  add.s      $f0, $f0, $f2
/* 1BD60 8001B160 C6620014 */  lwc1       $f2, 0x14($s3)
/* 1BD64 8001B164 E660000C */  swc1       $f0, 0xc($s3)
/* 1BD68 8001B168 C7A00054 */  lwc1       $f0, 0x54($sp)
/* 1BD6C 8001B16C 46001080 */  add.s      $f2, $f2, $f0
/* 1BD70 8001B170 E6620014 */  swc1       $f2, 0x14($s3)
/* 1BD74 8001B174 8E450038 */  lw         $a1, 0x38($s2)
/* 1BD78 8001B178 0C0273D2 */  jal        rand_float_multi
/* 1BD7C 8001B17C 02002021 */   addu      $a0, $s0, $zero
/* 1BD80 8001B180 02002021 */  addu       $a0, $s0, $zero
/* 1BD84 8001B184 44060000 */  mfc1       $a2, $f0
/* 1BD88 8001B188 0C0273FF */  jal        rand_vec2
/* 1BD8C 8001B18C 02202821 */   addu      $a1, $s1, $zero
/* 1BD90 8001B190 8642001A */  lh         $v0, 0x1a($s2)
/* 1BD94 8001B194 C6420034 */  lwc1       $f2, 0x34($s2)
/* 1BD98 8001B198 44820000 */  mtc1       $v0, $f0
/* 1BD9C 8001B19C 46800020 */  cvt.s.w    $f0, $f0
/* 1BDA0 8001B1A0 46001083 */  div.s      $f2, $f2, $f0
/* 1BDA4 8001B1A4 44051000 */  mfc1       $a1, $f2
/* 1BDA8 8001B1A8 0C0273D2 */  jal        rand_float_multi
/* 1BDAC 8001B1AC 02002021 */   addu      $a0, $s0, $zero
/* 1BDB0 8001B1B0 8FA50050 */  lw         $a1, 0x50($sp)
/* 1BDB4 8001B1B4 44060000 */  mfc1       $a2, $f0
/* 1BDB8 8001B1B8 8FA70054 */  lw         $a3, 0x54($sp)
/* 1BDBC 8001B1BC 0C02CB1D */  jal        func_800B2C74
/* 1BDC0 8001B1C0 02602021 */   addu      $a0, $s3, $zero
/* 1BDC4 8001B1C4 26440044 */  addiu      $a0, $s2, 0x44
/* 1BDC8 8001B1C8 0C02AD1E */  jal        copyVec4
/* 1BDCC 8001B1CC 2665002C */   addiu     $a1, $s3, 0x2c
/* 1BDD0 8001B1D0 8642001A */  lh         $v0, 0x1a($s2)
/* 1BDD4 8001B1D4 C6420054 */  lwc1       $f2, 0x54($s2)
/* 1BDD8 8001B1D8 44820000 */  mtc1       $v0, $f0
/* 1BDDC 8001B1DC 46800020 */  cvt.s.w    $f0, $f0
/* 1BDE0 8001B1E0 46001083 */  div.s      $f2, $f2, $f0
/* 1BDE4 8001B1E4 44051000 */  mfc1       $a1, $f2
/* 1BDE8 8001B1E8 0C0273D2 */  jal        rand_float_multi
/* 1BDEC 8001B1EC 02002021 */   addu      $a0, $s0, $zero
/* 1BDF0 8001B1F0 E7A00010 */  swc1       $f0, 0x10($sp)
/* 1BDF4 8001B1F4 8642001A */  lh         $v0, 0x1a($s2)
/* 1BDF8 8001B1F8 C6420058 */  lwc1       $f2, 0x58($s2)
/* 1BDFC 8001B1FC 44820000 */  mtc1       $v0, $f0
/* 1BE00 8001B200 46800020 */  cvt.s.w    $f0, $f0
/* 1BE04 8001B204 46001083 */  div.s      $f2, $f2, $f0
/* 1BE08 8001B208 44051000 */  mfc1       $a1, $f2
/* 1BE0C 8001B20C 0C0273D2 */  jal        rand_float_multi
/* 1BE10 8001B210 02002021 */   addu      $a0, $s0, $zero
/* 1BE14 8001B214 E7A00014 */  swc1       $f0, 0x14($sp)
/* 1BE18 8001B218 8642001A */  lh         $v0, 0x1a($s2)
/* 1BE1C 8001B21C C642005C */  lwc1       $f2, 0x5c($s2)
/* 1BE20 8001B220 44820000 */  mtc1       $v0, $f0
/* 1BE24 8001B224 46800020 */  cvt.s.w    $f0, $f0
/* 1BE28 8001B228 46001083 */  div.s      $f2, $f2, $f0
/* 1BE2C 8001B22C 44051000 */  mfc1       $a1, $f2
/* 1BE30 8001B230 0C0273D2 */  jal        rand_float_multi
/* 1BE34 8001B234 02002021 */   addu      $a0, $s0, $zero
/* 1BE38 8001B238 E7A00018 */  swc1       $f0, 0x18($sp)
/* 1BE3C 8001B23C 8642001A */  lh         $v0, 0x1a($s2)
/* 1BE40 8001B240 C6420060 */  lwc1       $f2, 0x60($s2)
/* 1BE44 8001B244 44820000 */  mtc1       $v0, $f0
/* 1BE48 8001B248 46800020 */  cvt.s.w    $f0, $f0
/* 1BE4C 8001B24C 46001083 */  div.s      $f2, $f2, $f0
/* 1BE50 8001B250 44051000 */  mfc1       $a1, $f2
/* 1BE54 8001B254 0C0273D2 */  jal        rand_float_multi
/* 1BE58 8001B258 02002021 */   addu      $a0, $s0, $zero
/* 1BE5C 8001B25C 27A40010 */  addiu      $a0, $sp, 0x10
/* 1BE60 8001B260 2665003C */  addiu      $a1, $s3, 0x3c
/* 1BE64 8001B264 0C02AD1E */  jal        copyVec4
/* 1BE68 8001B268 E7A0001C */   swc1      $f0, 0x1c($sp)
/* 1BE6C 8001B26C 02602021 */  addu       $a0, $s3, $zero
/* 1BE70 8001B270 96620000 */  lhu        $v0, ($s3)
/* 1BE74 8001B274 24050200 */  addiu      $a1, $zero, 0x200
/* 1BE78 8001B278 0C02CB2A */  jal        particle_set_flags
/* 1BE7C 8001B27C A6620004 */   sh        $v0, 4($s3)
/* 1BE80 8001B280 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 1BE84 8001B284 8FB3009C */  lw         $s3, 0x9c($sp)
/* 1BE88 8001B288 8FB20098 */  lw         $s2, 0x98($sp)
/* 1BE8C 8001B28C 8FB10094 */  lw         $s1, 0x94($sp)
/* 1BE90 8001B290 8FB00090 */  lw         $s0, 0x90($sp)
/* 1BE94 8001B294 03E00008 */  jr         $ra
/* 1BE98 8001B298 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel func_8001B29C
/* 1BE9C 8001B29C 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 1BEA0 8001B2A0 AFB00028 */  sw         $s0, 0x28($sp)
/* 1BEA4 8001B2A4 00808021 */  addu       $s0, $a0, $zero
/* 1BEA8 8001B2A8 3C02800E */  lui        $v0, %hi(particleEmmiterStruct)
/* 1BEAC 8001B2AC AFB40038 */  sw         $s4, 0x38($sp)
/* 1BEB0 8001B2B0 24546CD8 */  addiu      $s4, $v0, %lo(particleEmmiterStruct)
/* 1BEB4 8001B2B4 02802021 */  addu       $a0, $s4, $zero
/* 1BEB8 8001B2B8 00052C00 */  sll        $a1, $a1, 0x10
/* 1BEBC 8001B2BC AFB20030 */  sw         $s2, 0x30($sp)
/* 1BEC0 8001B2C0 00059403 */  sra        $s2, $a1, 0x10
/* 1BEC4 8001B2C4 02402821 */  addu       $a1, $s2, $zero
/* 1BEC8 8001B2C8 00063400 */  sll        $a2, $a2, 0x10
/* 1BECC 8001B2CC 00063403 */  sra        $a2, $a2, 0x10
/* 1BED0 8001B2D0 00073C00 */  sll        $a3, $a3, 0x10
/* 1BED4 8001B2D4 00073C03 */  sra        $a3, $a3, 0x10
/* 1BED8 8001B2D8 AFB5003C */  sw         $s5, 0x3c($sp)
/* 1BEDC 8001B2DC 8FB50078 */  lw         $s5, 0x78($sp)
/* 1BEE0 8001B2E0 3C028002 */  lui        $v0, %hi(func_8001B0A8)
/* 1BEE4 8001B2E4 AFB30034 */  sw         $s3, 0x34($sp)
/* 1BEE8 8001B2E8 87B30072 */  lh         $s3, 0x72($sp)
/* 1BEEC 8001B2EC 2442B0A8 */  addiu      $v0, $v0, %lo(func_8001B0A8)
/* 1BEF0 8001B2F0 AFBF0040 */  sw         $ra, 0x40($sp)
/* 1BEF4 8001B2F4 AFB1002C */  sw         $s1, 0x2c($sp)
/* 1BEF8 8001B2F8 F7B80058 */  sdc1       $f24, 0x58($sp)
/* 1BEFC 8001B2FC F7B60050 */  sdc1       $f22, 0x50($sp)
/* 1BF00 8001B300 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 1BF04 8001B304 AFA00010 */  sw         $zero, 0x10($sp)
/* 1BF08 8001B308 AFA20014 */  sw         $v0, 0x14($sp)
/* 1BF0C 8001B30C AFA00018 */  sw         $zero, 0x18($sp)
/* 1BF10 8001B310 AFA0001C */  sw         $zero, 0x1c($sp)
/* 1BF14 8001B314 0C02CA38 */  jal        AllocParticleEmitter
/* 1BF18 8001B318 AFA00020 */   sw        $zero, 0x20($sp)
/* 1BF1C 8001B31C 00408821 */  addu       $s1, $v0, $zero
/* 1BF20 8001B320 12200044 */  beqz       $s1, .L8001B434
/* 1BF24 8001B324 02002021 */   addu      $a0, $s0, $zero
/* 1BF28 8001B328 0C02AD17 */  jal        copyVec3
/* 1BF2C 8001B32C 26250024 */   addiu     $a1, $s1, 0x24
/* 1BF30 8001B330 02A02021 */  addu       $a0, $s5, $zero
/* 1BF34 8001B334 0C02AD1E */  jal        copyVec4
/* 1BF38 8001B338 26250044 */   addiu     $a1, $s1, 0x44
/* 1BF3C 8001B33C 8FA40080 */  lw         $a0, 0x80($sp)
/* 1BF40 8001B340 0C02AD1E */  jal        copyVec4
/* 1BF44 8001B344 26250054 */   addiu     $a1, $s1, 0x54
/* 1BF48 8001B348 8FA40084 */  lw         $a0, 0x84($sp)
/* 1BF4C 8001B34C 0C02AD17 */  jal        copyVec3
/* 1BF50 8001B350 26250030 */   addiu     $a1, $s1, 0x30
/* 1BF54 8001B354 8E300014 */  lw         $s0, 0x14($s1)
/* 1BF58 8001B358 4480B000 */  mtc1       $zero, $f22
/* 1BF5C 8001B35C 24050100 */  addiu      $a1, $zero, 0x100
/* 1BF60 8001B360 A633001A */  sh         $s3, 0x1a($s1)
/* 1BF64 8001B364 0C02CB2A */  jal        particle_set_flags
/* 1BF68 8001B368 02002021 */   addu      $a0, $s0, $zero
/* 1BF6C 8001B36C 4405B000 */  mfc1       $a1, $f22
/* 1BF70 8001B370 3C06387B */  lui        $a2, 0x387b
/* 1BF74 8001B374 34C6A882 */  ori        $a2, $a2, 0xa882
/* 1BF78 8001B378 4407B000 */  mfc1       $a3, $f22
/* 1BF7C 8001B37C 3C01800E */  lui        $at, %hi(D_800D96A0)
/* 1BF80 8001B380 C42096A0 */  lwc1       $f0, %lo(D_800D96A0)($at)
/* 1BF84 8001B384 02002021 */  addu       $a0, $s0, $zero
/* 1BF88 8001B388 0C02CB24 */  jal        func_800B2C90
/* 1BF8C 8001B38C E7A00010 */   swc1      $f0, 0x10($sp)
/* 1BF90 8001B390 02802021 */  addu       $a0, $s4, $zero
/* 1BF94 8001B394 02202821 */  addu       $a1, $s1, $zero
/* 1BF98 8001B398 0C02C9F3 */  jal        func_800B27CC
/* 1BF9C 8001B39C 02403021 */   addu      $a2, $s2, $zero
/* 1BFA0 8001B3A0 00408021 */  addu       $s0, $v0, $zero
/* 1BFA4 8001B3A4 02002021 */  addu       $a0, $s0, $zero
/* 1BFA8 8001B3A8 0C02CB2A */  jal        particle_set_flags
/* 1BFAC 8001B3AC 24050400 */   addiu     $a1, $zero, 0x400
/* 1BFB0 8001B3B0 C7A00074 */  lwc1       $f0, 0x74($sp)
/* 1BFB4 8001B3B4 4493A000 */  mtc1       $s3, $f20
/* 1BFB8 8001B3B8 4680A520 */  cvt.s.w    $f20, $f20
/* 1BFBC 8001B3BC 46140603 */  div.s      $f24, $f0, $f20
/* 1BFC0 8001B3C0 4405C000 */  mfc1       $a1, $f24
/* 1BFC4 8001B3C4 02002021 */  addu       $a0, $s0, $zero
/* 1BFC8 8001B3C8 E7B60010 */  swc1       $f22, 0x10($sp)
/* 1BFCC 8001B3CC 00A03021 */  addu       $a2, $a1, $zero
/* 1BFD0 8001B3D0 0C02CB24 */  jal        func_800B2C90
/* 1BFD4 8001B3D4 00A03821 */   addu      $a3, $a1, $zero
/* 1BFD8 8001B3D8 02802021 */  addu       $a0, $s4, $zero
/* 1BFDC 8001B3DC 02202821 */  addu       $a1, $s1, $zero
/* 1BFE0 8001B3E0 0C02C9F3 */  jal        func_800B27CC
/* 1BFE4 8001B3E4 02403021 */   addu      $a2, $s2, $zero
/* 1BFE8 8001B3E8 00408021 */  addu       $s0, $v0, $zero
/* 1BFEC 8001B3EC 02002021 */  addu       $a0, $s0, $zero
/* 1BFF0 8001B3F0 0C02CB2A */  jal        particle_set_flags
/* 1BFF4 8001B3F4 24050200 */   addiu     $a1, $zero, 0x200
/* 1BFF8 8001B3F8 2610003C */  addiu      $s0, $s0, 0x3c
/* 1BFFC 8001B3FC 02002021 */  addu       $a0, $s0, $zero
/* 1C000 8001B400 02A02821 */  addu       $a1, $s5, $zero
/* 1C004 8001B404 4600A521 */  cvt.d.s    $f20, $f20
/* 1C008 8001B408 3C01800E */  lui        $at, %hi(D_800D96A8)
/* 1C00C 8001B40C D42096A8 */  ldc1       $f0, %lo(D_800D96A8)($at)
/* 1C010 8001B410 8FA6007C */  lw         $a2, 0x7c($sp)
/* 1C014 8001B414 46340003 */  div.d      $f0, $f0, $f20
/* 1C018 8001B418 0C02AB33 */  jal        sybVec4
/* 1C01C 8001B41C 46200620 */   cvt.s.d   $f24, $f0
/* 1C020 8001B420 4405C000 */  mfc1       $a1, $f24
/* 1C024 8001B424 0C02AD47 */  jal        multiVec4
/* 1C028 8001B428 02002021 */   addu      $a0, $s0, $zero
/* 1C02C 8001B42C 08006D0E */  j          .L8001B438
/* 1C030 8001B430 02201021 */   addu      $v0, $s1, $zero
.L8001B434:
/* 1C034 8001B434 00001021 */  addu       $v0, $zero, $zero
.L8001B438:
/* 1C038 8001B438 8FBF0040 */  lw         $ra, 0x40($sp)
/* 1C03C 8001B43C 8FB5003C */  lw         $s5, 0x3c($sp)
/* 1C040 8001B440 8FB40038 */  lw         $s4, 0x38($sp)
/* 1C044 8001B444 8FB30034 */  lw         $s3, 0x34($sp)
/* 1C048 8001B448 8FB20030 */  lw         $s2, 0x30($sp)
/* 1C04C 8001B44C 8FB1002C */  lw         $s1, 0x2c($sp)
/* 1C050 8001B450 8FB00028 */  lw         $s0, 0x28($sp)
/* 1C054 8001B454 D7B80058 */  ldc1       $f24, 0x58($sp)
/* 1C058 8001B458 D7B60050 */  ldc1       $f22, 0x50($sp)
/* 1C05C 8001B45C D7B40048 */  ldc1       $f20, 0x48($sp)
/* 1C060 8001B460 03E00008 */  jr         $ra
/* 1C064 8001B464 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8001B468
/* 1C068 8001B468 3C01800E */  lui        $at, %hi(D_800D96B0)
/* 1C06C 8001B46C C42096B0 */  lwc1       $f0, %lo(D_800D96B0)($at)
/* 1C070 8001B470 27BDFDA0 */  addiu      $sp, $sp, -0x260
/* 1C074 8001B474 AFB60248 */  sw         $s6, 0x248($sp)
/* 1C078 8001B478 30F6FFFF */  andi       $s6, $a3, 0xffff
/* 1C07C 8001B47C AFB40240 */  sw         $s4, 0x240($sp)
/* 1C080 8001B480 0080A021 */  addu       $s4, $a0, $zero
/* 1C084 8001B484 F7B60258 */  sdc1       $f22, 0x258($sp)
/* 1C088 8001B488 4485B000 */  mtc1       $a1, $f22
/* 1C08C 8001B48C 27A40030 */  addiu      $a0, $sp, 0x30
/* 1C090 8001B490 F7B40250 */  sdc1       $f20, 0x250($sp)
/* 1C094 8001B494 4480A000 */  mtc1       $zero, $f20
/* 1C098 8001B498 00061400 */  sll        $v0, $a2, 0x10
/* 1C09C 8001B49C AFB50244 */  sw         $s5, 0x244($sp)
/* 1C0A0 8001B4A0 44050000 */  mfc1       $a1, $f0
/* 1C0A4 8001B4A4 4407A000 */  mfc1       $a3, $f20
/* 1C0A8 8001B4A8 0002AC03 */  sra        $s5, $v0, 0x10
/* 1C0AC 8001B4AC AFBF024C */  sw         $ra, 0x24c($sp)
/* 1C0B0 8001B4B0 AFB3023C */  sw         $s3, 0x23c($sp)
/* 1C0B4 8001B4B4 AFB20238 */  sw         $s2, 0x238($sp)
/* 1C0B8 8001B4B8 AFB10234 */  sw         $s1, 0x234($sp)
/* 1C0BC 8001B4BC AFB00230 */  sw         $s0, 0x230($sp)
/* 1C0C0 8001B4C0 E7A00010 */  swc1       $f0, 0x10($sp)
/* 1C0C4 8001B4C4 0C02AD5C */  jal        setVec4
/* 1C0C8 8001B4C8 00A03021 */   addu      $a2, $a1, $zero
/* 1C0CC 8001B4CC 27B30070 */  addiu      $s3, $sp, 0x70
/* 1C0D0 8001B4D0 3C053F00 */  lui        $a1, 0x3f00
/* 1C0D4 8001B4D4 4406A000 */  mfc1       $a2, $f20
/* 1C0D8 8001B4D8 4407A000 */  mfc1       $a3, $f20
/* 1C0DC 8001B4DC 02602021 */  addu       $a0, $s3, $zero
/* 1C0E0 8001B4E0 0C02AD5C */  jal        setVec4
/* 1C0E4 8001B4E4 E7B40010 */   swc1      $f20, 0x10($sp)
/* 1C0E8 8001B4E8 27B200B0 */  addiu      $s2, $sp, 0xb0
/* 1C0EC 8001B4EC 3C053E4C */  lui        $a1, 0x3e4c
/* 1C0F0 8001B4F0 34A5CCCD */  ori        $a1, $a1, 0xcccd
/* 1C0F4 8001B4F4 3C063DCC */  lui        $a2, 0x3dcc
/* 1C0F8 8001B4F8 34C6CCCD */  ori        $a2, $a2, 0xcccd
/* 1C0FC 8001B4FC 4407A000 */  mfc1       $a3, $f20
/* 1C100 8001B500 02402021 */  addu       $a0, $s2, $zero
/* 1C104 8001B504 0C02AD5C */  jal        setVec4
/* 1C108 8001B508 E7B40010 */   swc1      $f20, 0x10($sp)
/* 1C10C 8001B50C 27B10130 */  addiu      $s1, $sp, 0x130
/* 1C110 8001B510 3C053D4C */  lui        $a1, 0x3d4c
/* 1C114 8001B514 34A5CCCD */  ori        $a1, $a1, 0xcccd
/* 1C118 8001B518 3C063ECC */  lui        $a2, 0x3ecc
/* 1C11C 8001B51C 34C6CCCD */  ori        $a2, $a2, 0xcccd
/* 1C120 8001B520 3C073B23 */  lui        $a3, 0x3b23
/* 1C124 8001B524 34E7D70A */  ori        $a3, $a3, 0xd70a
/* 1C128 8001B528 0C02AD58 */  jal        setVec3
/* 1C12C 8001B52C 02202021 */   addu      $a0, $s1, $zero
/* 1C130 8001B530 27B000F0 */  addiu      $s0, $sp, 0xf0
/* 1C134 8001B534 3C01800E */  lui        $at, %hi(D_800D96B4)
/* 1C138 8001B538 C42096B4 */  lwc1       $f0, %lo(D_800D96B4)($at)
/* 1C13C 8001B53C 02002021 */  addu       $a0, $s0, $zero
/* 1C140 8001B540 44050000 */  mfc1       $a1, $f0
/* 1C144 8001B544 4406A000 */  mfc1       $a2, $f20
/* 1C148 8001B548 0C02AD58 */  jal        setVec3
/* 1C14C 8001B54C 00A03821 */   addu      $a3, $a1, $zero
/* 1C150 8001B550 02802021 */  addu       $a0, $s4, $zero
/* 1C154 8001B554 02A02821 */  addu       $a1, $s5, $zero
/* 1C158 8001B558 24060002 */  addiu      $a2, $zero, 2
/* 1C15C 8001B55C 2407FFFE */  addiu      $a3, $zero, -2
/* 1C160 8001B560 24020078 */  addiu      $v0, $zero, 0x78
/* 1C164 8001B564 AFA20010 */  sw         $v0, 0x10($sp)
/* 1C168 8001B568 27A20030 */  addiu      $v0, $sp, 0x30
/* 1C16C 8001B56C E7B60014 */  swc1       $f22, 0x14($sp)
/* 1C170 8001B570 AFA20018 */  sw         $v0, 0x18($sp)
/* 1C174 8001B574 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1C178 8001B578 AFB20020 */  sw         $s2, 0x20($sp)
/* 1C17C 8001B57C AFB10024 */  sw         $s1, 0x24($sp)
/* 1C180 8001B580 0C006CA7 */  jal        func_8001B29C
/* 1C184 8001B584 AFB00028 */   sw        $s0, 0x28($sp)
/* 1C188 8001B588 00408021 */  addu       $s0, $v0, $zero
/* 1C18C 8001B58C 12000033 */  beqz       $s0, .L8001B65C
/* 1C190 8001B590 8FBF024C */   lw        $ra, 0x24c($sp)
/* 1C194 8001B594 12C00012 */  beqz       $s6, .L8001B5E0
/* 1C198 8001B598 02002021 */   addu      $a0, $s0, $zero
/* 1C19C 8001B59C 0C02CB34 */  jal        func_800B2CD0
/* 1C1A0 8001B5A0 24052000 */   addiu     $a1, $zero, 0x2000
/* 1C1A4 8001B5A4 02802021 */  addu       $a0, $s4, $zero
/* 1C1A8 8001B5A8 0C02AD17 */  jal        copyVec3
/* 1C1AC 8001B5AC 260501D4 */   addiu     $a1, $s0, 0x1d4
/* 1C1B0 8001B5B0 3C04800E */  lui        $a0, %hi(gGlobals)
/* 1C1B4 8001B5B4 248468A8 */  addiu      $a0, $a0, %lo(gGlobals)
/* 1C1B8 8001B5B8 3C063D13 */  lui        $a2, 0x3d13
/* 1C1BC 8001B5BC 34C674BC */  ori        $a2, $a2, 0x74bc
/* 1C1C0 8001B5C0 0C0273FF */  jal        rand_vec2
/* 1C1C4 8001B5C4 27A501F0 */   addiu     $a1, $sp, 0x1f0
/* 1C1C8 8001B5C8 8FA501F0 */  lw         $a1, 0x1f0($sp)
/* 1C1CC 8001B5CC 3C063DF5 */  lui        $a2, 0x3df5
/* 1C1D0 8001B5D0 34C6C28F */  ori        $a2, $a2, 0xc28f
/* 1C1D4 8001B5D4 8FA701F4 */  lw         $a3, 0x1f4($sp)
/* 1C1D8 8001B5D8 0C02AD58 */  jal        setVec3
/* 1C1DC 8001B5DC 260401E0 */   addiu     $a0, $s0, 0x1e0
.L8001B5E0:
/* 1C1E0 8001B5E0 3C04800E */  lui        $a0, %hi(dynamic_light_struct)
/* 1C1E4 8001B5E4 24847120 */  addiu      $a0, $a0, %lo(dynamic_light_struct)
/* 1C1E8 8001B5E8 02A02821 */  addu       $a1, $s5, $zero
/* 1C1EC 8001B5EC 3C0740A0 */  lui        $a3, 0x40a0
/* 1C1F0 8001B5F0 3C01800E */  lui        $at, %hi(D_800D96B8)
/* 1C1F4 8001B5F4 C42096B8 */  lwc1       $f0, %lo(D_800D96B8)($at)
/* 1C1F8 8001B5F8 24020060 */  addiu      $v0, $zero, 0x60
/* 1C1FC 8001B5FC A3A20170 */  sb         $v0, 0x170($sp)
/* 1C200 8001B600 240200FF */  addiu      $v0, $zero, 0xff
/* 1C204 8001B604 A3A201B0 */  sb         $v0, 0x1b0($sp)
/* 1C208 8001B608 A3A201B1 */  sb         $v0, 0x1b1($sp)
/* 1C20C 8001B60C 24020003 */  addiu      $v0, $zero, 3
/* 1C210 8001B610 A3A00173 */  sb         $zero, 0x173($sp)
/* 1C214 8001B614 A3A00172 */  sb         $zero, 0x172($sp)
/* 1C218 8001B618 A3A00171 */  sb         $zero, 0x171($sp)
/* 1C21C 8001B61C A3A001B3 */  sb         $zero, 0x1b3($sp)
/* 1C220 8001B620 A3A001B2 */  sb         $zero, 0x1b2($sp)
/* 1C224 8001B624 AFA20010 */  sw         $v0, 0x10($sp)
/* 1C228 8001B628 E7A00014 */  swc1       $f0, 0x14($sp)
/* 1C22C 8001B62C 8BA20170 */  lwl        $v0, 0x170($sp)
/* 1C230 8001B630 9BA20173 */  lwr        $v0, 0x173($sp)
/* 1C234 8001B634 ABA20018 */  swl        $v0, 0x18($sp)
/* 1C238 8001B638 BBA2001B */  swr        $v0, 0x1b($sp)
/* 1C23C 8001B63C 8BA201B0 */  lwl        $v0, 0x1b0($sp)
/* 1C240 8001B640 9BA201B3 */  lwr        $v0, 0x1b3($sp)
/* 1C244 8001B644 ABA2001C */  swl        $v0, 0x1c($sp)
/* 1C248 8001B648 BBA2001F */  swr        $v0, 0x1f($sp)
/* 1C24C 8001B64C 0C015560 */  jal        AllocDynamicLight
/* 1C250 8001B650 02803021 */   addu      $a2, $s4, $zero
/* 1C254 8001B654 AE0201C4 */  sw         $v0, 0x1c4($s0)
/* 1C258 8001B658 8FBF024C */  lw         $ra, 0x24c($sp)
.L8001B65C:
/* 1C25C 8001B65C 8FB60248 */  lw         $s6, 0x248($sp)
/* 1C260 8001B660 8FB50244 */  lw         $s5, 0x244($sp)
/* 1C264 8001B664 8FB40240 */  lw         $s4, 0x240($sp)
/* 1C268 8001B668 8FB3023C */  lw         $s3, 0x23c($sp)
/* 1C26C 8001B66C 8FB20238 */  lw         $s2, 0x238($sp)
/* 1C270 8001B670 8FB10234 */  lw         $s1, 0x234($sp)
/* 1C274 8001B674 8FB00230 */  lw         $s0, 0x230($sp)
/* 1C278 8001B678 D7B60258 */  ldc1       $f22, 0x258($sp)
/* 1C27C 8001B67C D7B40250 */  ldc1       $f20, 0x250($sp)
/* 1C280 8001B680 03E00008 */  jr         $ra
/* 1C284 8001B684 27BD0260 */   addiu     $sp, $sp, 0x260

glabel func_8001B688
/* 1C288 8001B688 3C073F4C */  lui        $a3, 0x3f4c
/* 1C28C 8001B68C 34E7CCCD */  ori        $a3, $a3, 0xcccd
/* 1C290 8001B690 27BDFE08 */  addiu      $sp, $sp, -0x1f8
/* 1C294 8001B694 F7B801E8 */  sdc1       $f24, 0x1e8($sp)
/* 1C298 8001B698 3C01800E */  lui        $at, %hi(D_800D96C0)
/* 1C29C 8001B69C D43896C0 */  ldc1       $f24, %lo(D_800D96C0)($at)
/* 1C2A0 8001B6A0 F7BA01F0 */  sdc1       $f26, 0x1f0($sp)
/* 1C2A4 8001B6A4 3C01800E */  lui        $at, %hi(D_800D96C8)
/* 1C2A8 8001B6A8 C43A96C8 */  lwc1       $f26, %lo(D_800D96C8)($at)
/* 1C2AC 8001B6AC AFB101B4 */  sw         $s1, 0x1b4($sp)
/* 1C2B0 8001B6B0 00808821 */  addu       $s1, $a0, $zero
/* 1C2B4 8001B6B4 F7B401D8 */  sdc1       $f20, 0x1d8($sp)
/* 1C2B8 8001B6B8 4480A000 */  mtc1       $zero, $f20
/* 1C2BC 8001B6BC 27A40030 */  addiu      $a0, $sp, 0x30
/* 1C2C0 8001B6C0 AFB201B8 */  sw         $s2, 0x1b8($sp)
/* 1C2C4 8001B6C4 3C120001 */  lui        $s2, 1
/* 1C2C8 8001B6C8 AFB301BC */  sw         $s3, 0x1bc($sp)
/* 1C2CC 8001B6CC 00A09821 */  addu       $s3, $a1, $zero
/* 1C2D0 8001B6D0 F7B601E0 */  sdc1       $f22, 0x1e0($sp)
/* 1C2D4 8001B6D4 3C01800E */  lui        $at, %hi(D_800D96CC)
/* 1C2D8 8001B6D8 C43696CC */  lwc1       $f22, %lo(D_800D96CC)($at)
/* 1C2DC 8001B6DC 00061400 */  sll        $v0, $a2, 0x10
/* 1C2E0 8001B6E0 AFB401C0 */  sw         $s4, 0x1c0($sp)
/* 1C2E4 8001B6E4 4405A000 */  mfc1       $a1, $f20
/* 1C2E8 8001B6E8 4406B000 */  mfc1       $a2, $f22
/* 1C2EC 8001B6EC 0002A403 */  sra        $s4, $v0, 0x10
/* 1C2F0 8001B6F0 AFBF01D4 */  sw         $ra, 0x1d4($sp)
/* 1C2F4 8001B6F4 AFBE01D0 */  sw         $fp, 0x1d0($sp)
/* 1C2F8 8001B6F8 AFB701CC */  sw         $s7, 0x1cc($sp)
/* 1C2FC 8001B6FC AFB601C8 */  sw         $s6, 0x1c8($sp)
/* 1C300 8001B700 AFB501C4 */  sw         $s5, 0x1c4($sp)
/* 1C304 8001B704 AFB001B0 */  sw         $s0, 0x1b0($sp)
/* 1C308 8001B708 0C02AD5C */  jal        setVec4
/* 1C30C 8001B70C E7B60010 */   swc1      $f22, 0x10($sp)
/* 1C310 8001B710 27A20070 */  addiu      $v0, $sp, 0x70
/* 1C314 8001B714 00402021 */  addu       $a0, $v0, $zero
/* 1C318 8001B718 3C01800E */  lui        $at, %hi(D_800D96D0)
/* 1C31C 8001B71C C42096D0 */  lwc1       $f0, %lo(D_800D96D0)($at)
/* 1C320 8001B720 4406A000 */  mfc1       $a2, $f20
/* 1C324 8001B724 44050000 */  mfc1       $a1, $f0
/* 1C328 8001B728 0040F021 */  addu       $fp, $v0, $zero
/* 1C32C 8001B72C E7B40010 */  swc1       $f20, 0x10($sp)
/* 1C330 8001B730 0C02AD5C */  jal        setVec4
/* 1C334 8001B734 00A03821 */   addu      $a3, $a1, $zero
/* 1C338 8001B738 27A200B0 */  addiu      $v0, $sp, 0xb0
/* 1C33C 8001B73C 00402021 */  addu       $a0, $v0, $zero
/* 1C340 8001B740 3C053F19 */  lui        $a1, 0x3f19
/* 1C344 8001B744 34A5999A */  ori        $a1, $a1, 0x999a
/* 1C348 8001B748 3C063E99 */  lui        $a2, 0x3e99
/* 1C34C 8001B74C 34C6999A */  ori        $a2, $a2, 0x999a
/* 1C350 8001B750 3C073E4C */  lui        $a3, 0x3e4c
/* 1C354 8001B754 34E7CCCD */  ori        $a3, $a3, 0xcccd
/* 1C358 8001B758 0040B821 */  addu       $s7, $v0, $zero
/* 1C35C 8001B75C 0C02AD5C */  jal        setVec4
/* 1C360 8001B760 E7B40010 */   swc1      $f20, 0x10($sp)
/* 1C364 8001B764 27A20130 */  addiu      $v0, $sp, 0x130
/* 1C368 8001B768 00402021 */  addu       $a0, $v0, $zero
/* 1C36C 8001B76C 3C053F00 */  lui        $a1, 0x3f00
/* 1C370 8001B770 4406B000 */  mfc1       $a2, $f22
/* 1C374 8001B774 4407A000 */  mfc1       $a3, $f20
/* 1C378 8001B778 0C02AD58 */  jal        setVec3
/* 1C37C 8001B77C 0040B021 */   addu      $s6, $v0, $zero
/* 1C380 8001B780 27A200F0 */  addiu      $v0, $sp, 0xf0
/* 1C384 8001B784 00402021 */  addu       $a0, $v0, $zero
/* 1C388 8001B788 4405A000 */  mfc1       $a1, $f20
/* 1C38C 8001B78C 0040A821 */  addu       $s5, $v0, $zero
/* 1C390 8001B790 00A03021 */  addu       $a2, $a1, $zero
/* 1C394 8001B794 0C02AD58 */  jal        setVec3
/* 1C398 8001B798 00A03821 */   addu      $a3, $a1, $zero
/* 1C39C 8001B79C 02202021 */  addu       $a0, $s1, $zero
/* 1C3A0 8001B7A0 27B00170 */  addiu      $s0, $sp, 0x170
/* 1C3A4 8001B7A4 0C02AD17 */  jal        copyVec3
/* 1C3A8 8001B7A8 02002821 */   addu      $a1, $s0, $zero
/* 1C3AC 8001B7AC 27B10030 */  addiu      $s1, $sp, 0x30
.L8001B7B0:
/* 1C3B0 8001B7B0 C6660000 */  lwc1       $f6, ($s3)
/* 1C3B4 8001B7B4 02002021 */  addu       $a0, $s0, $zero
/* 1C3B8 8001B7B8 460031A1 */  cvt.d.s    $f6, $f6
/* 1C3BC 8001B7BC 46383182 */  mul.d      $f6, $f6, $f24
/* 1C3C0 8001B7C0 02802821 */  addu       $a1, $s4, $zero
/* 1C3C4 8001B7C4 00003021 */  addu       $a2, $zero, $zero
/* 1C3C8 8001B7C8 00003821 */  addu       $a3, $zero, $zero
/* 1C3CC 8001B7CC C6640004 */  lwc1       $f4, 4($s3)
/* 1C3D0 8001B7D0 C7A20170 */  lwc1       $f2, 0x170($sp)
/* 1C3D4 8001B7D4 C7A00178 */  lwc1       $f0, 0x178($sp)
/* 1C3D8 8001B7D8 46002121 */  cvt.d.s    $f4, $f4
/* 1C3DC 8001B7DC 46382102 */  mul.d      $f4, $f4, $f24
/* 1C3E0 8001B7E0 2402005A */  addiu      $v0, $zero, 0x5a
/* 1C3E4 8001B7E4 AFA20010 */  sw         $v0, 0x10($sp)
/* 1C3E8 8001B7E8 E7BA0014 */  swc1       $f26, 0x14($sp)
/* 1C3EC 8001B7EC AFB10018 */  sw         $s1, 0x18($sp)
/* 1C3F0 8001B7F0 AFBE001C */  sw         $fp, 0x1c($sp)
/* 1C3F4 8001B7F4 AFB70020 */  sw         $s7, 0x20($sp)
/* 1C3F8 8001B7F8 460010A1 */  cvt.d.s    $f2, $f2
/* 1C3FC 8001B7FC 46261081 */  sub.d      $f2, $f2, $f6
/* 1C400 8001B800 AFB60024 */  sw         $s6, 0x24($sp)
/* 1C404 8001B804 46000021 */  cvt.d.s    $f0, $f0
/* 1C408 8001B808 46240001 */  sub.d      $f0, $f0, $f4
/* 1C40C 8001B80C AFB50028 */  sw         $s5, 0x28($sp)
/* 1C410 8001B810 462010A0 */  cvt.s.d    $f2, $f2
/* 1C414 8001B814 46200020 */  cvt.s.d    $f0, $f0
/* 1C418 8001B818 E7A20170 */  swc1       $f2, 0x170($sp)
/* 1C41C 8001B81C 0C006CA7 */  jal        func_8001B29C
/* 1C420 8001B820 E7A00178 */   swc1      $f0, 0x178($sp)
/* 1C424 8001B824 02401821 */  addu       $v1, $s2, $zero
/* 1C428 8001B828 3C020001 */  lui        $v0, 1
/* 1C42C 8001B82C 00031C03 */  sra        $v1, $v1, 0x10
/* 1C430 8001B830 2863000C */  slti       $v1, $v1, 0xc
/* 1C434 8001B834 1460FFDE */  bnez       $v1, .L8001B7B0
/* 1C438 8001B838 02429021 */   addu      $s2, $s2, $v0
/* 1C43C 8001B83C 8FBF01D4 */  lw         $ra, 0x1d4($sp)
/* 1C440 8001B840 8FBE01D0 */  lw         $fp, 0x1d0($sp)
/* 1C444 8001B844 8FB701CC */  lw         $s7, 0x1cc($sp)
/* 1C448 8001B848 8FB601C8 */  lw         $s6, 0x1c8($sp)
/* 1C44C 8001B84C 8FB501C4 */  lw         $s5, 0x1c4($sp)
/* 1C450 8001B850 8FB401C0 */  lw         $s4, 0x1c0($sp)
/* 1C454 8001B854 8FB301BC */  lw         $s3, 0x1bc($sp)
/* 1C458 8001B858 8FB201B8 */  lw         $s2, 0x1b8($sp)
/* 1C45C 8001B85C 8FB101B4 */  lw         $s1, 0x1b4($sp)
/* 1C460 8001B860 8FB001B0 */  lw         $s0, 0x1b0($sp)
/* 1C464 8001B864 D7BA01F0 */  ldc1       $f26, 0x1f0($sp)
/* 1C468 8001B868 D7B801E8 */  ldc1       $f24, 0x1e8($sp)
/* 1C46C 8001B86C D7B601E0 */  ldc1       $f22, 0x1e0($sp)
/* 1C470 8001B870 D7B401D8 */  ldc1       $f20, 0x1d8($sp)
/* 1C474 8001B874 03E00008 */  jr         $ra
/* 1C478 8001B878 27BD01F8 */   addiu     $sp, $sp, 0x1f8

glabel UNK_NOOP
/* 1C47C 8001B87C 27BDFED0 */  addiu      $sp, $sp, -0x130
/* 1C480 8001B880 03E00008 */  jr         $ra
/* 1C484 8001B884 27BD0130 */   addiu     $sp, $sp, 0x130

glabel func_8001B888
/* 1C488 8001B888 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1C48C 8001B88C AFB50024 */  sw         $s5, 0x24($sp)
/* 1C490 8001B890 0080A821 */  addu       $s5, $a0, $zero
/* 1C494 8001B894 AFB40020 */  sw         $s4, 0x20($sp)
/* 1C498 8001B898 00A0A021 */  addu       $s4, $a1, $zero
/* 1C49C 8001B89C 3C02800E */  lui        $v0, %hi(weatherDat)
/* 1C4A0 8001B8A0 AFB60028 */  sw         $s6, 0x28($sp)
/* 1C4A4 8001B8A4 24566C3C */  addiu      $s6, $v0, %lo(weatherDat)
/* 1C4A8 8001B8A8 00002021 */  addu       $a0, $zero, $zero
/* 1C4AC 8001B8AC AFBF002C */  sw         $ra, 0x2c($sp)
/* 1C4B0 8001B8B0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1C4B4 8001B8B4 AFB20018 */  sw         $s2, 0x18($sp)
/* 1C4B8 8001B8B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1C4BC 8001B8BC AFB00010 */  sw         $s0, 0x10($sp)
/* 1C4C0 8001B8C0 00041140 */  sll        $v0, $a0, 5
.L8001B8C4:
/* 1C4C4 8001B8C4 00441021 */  addu       $v0, $v0, $a0
/* 1C4C8 8001B8C8 00021100 */  sll        $v0, $v0, 4
/* 1C4CC 8001B8CC 8EA30308 */  lw         $v1, 0x308($s5)
/* 1C4D0 8001B8D0 24920001 */  addiu      $s2, $a0, 1
/* 1C4D4 8001B8D4 00628821 */  addu       $s1, $v1, $v0
/* 1C4D8 8001B8D8 86220002 */  lh         $v0, 2($s1)
/* 1C4DC 8001B8DC 1840001C */  blez       $v0, .L8001B950
/* 1C4E0 8001B8E0 8E300014 */   lw        $s0, 0x14($s1)
/* 1C4E4 8001B8E4 1200001B */  beqz       $s0, .L8001B954
/* 1C4E8 8001B8E8 00121400 */   sll       $v0, $s2, 0x10
/* 1C4EC 8001B8EC 2413FFFF */  addiu      $s3, $zero, -1
/* 1C4F0 8001B8F0 2604000C */  addiu      $a0, $s0, 0xc
.L8001B8F4:
/* 1C4F4 8001B8F4 00802821 */  addu       $a1, $a0, $zero
/* 1C4F8 8001B8F8 0C02AB4D */  jal        vec3_sum
/* 1C4FC 8001B8FC 02803021 */   addu      $a2, $s4, $zero
/* 1C500 8001B900 8EC20014 */  lw         $v0, 0x14($s6)
/* 1C504 8001B904 54510006 */  bnel       $v0, $s1, .L8001B920
/* 1C508 8001B908 86030006 */   lh        $v1, 6($s0)
/* 1C50C 8001B90C 2604004C */  addiu      $a0, $s0, 0x4c
/* 1C510 8001B910 00802821 */  addu       $a1, $a0, $zero
/* 1C514 8001B914 0C02AB4D */  jal        vec3_sum
/* 1C518 8001B918 02803021 */   addu      $a2, $s4, $zero
/* 1C51C 8001B91C 86030006 */  lh         $v1, 6($s0)
.L8001B920:
/* 1C520 8001B920 14730003 */  bne        $v1, $s3, .L8001B930
/* 1C524 8001B924 00031040 */   sll       $v0, $v1, 1
/* 1C528 8001B928 08006E52 */  j          .L8001B948
/* 1C52C 8001B92C 00008021 */   addu      $s0, $zero, $zero
.L8001B930:
/* 1C530 8001B930 00431021 */  addu       $v0, $v0, $v1
/* 1C534 8001B934 00021080 */  sll        $v0, $v0, 2
/* 1C538 8001B938 00431021 */  addu       $v0, $v0, $v1
/* 1C53C 8001B93C 8EA30000 */  lw         $v1, ($s5)
/* 1C540 8001B940 00021140 */  sll        $v0, $v0, 5
/* 1C544 8001B944 00628021 */  addu       $s0, $v1, $v0
.L8001B948:
/* 1C548 8001B948 1600FFEA */  bnez       $s0, .L8001B8F4
/* 1C54C 8001B94C 2604000C */   addiu     $a0, $s0, 0xc
.L8001B950:
/* 1C550 8001B950 00121400 */  sll        $v0, $s2, 0x10
.L8001B954:
/* 1C554 8001B954 00022403 */  sra        $a0, $v0, 0x10
/* 1C558 8001B958 28830010 */  slti       $v1, $a0, 0x10
/* 1C55C 8001B95C 5460FFD9 */  bnel       $v1, $zero, .L8001B8C4
/* 1C560 8001B960 00041140 */   sll       $v0, $a0, 5
/* 1C564 8001B964 8FBF002C */  lw         $ra, 0x2c($sp)
/* 1C568 8001B968 8FB60028 */  lw         $s6, 0x28($sp)
/* 1C56C 8001B96C 8FB50024 */  lw         $s5, 0x24($sp)
/* 1C570 8001B970 8FB40020 */  lw         $s4, 0x20($sp)
/* 1C574 8001B974 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1C578 8001B978 8FB20018 */  lw         $s2, 0x18($sp)
/* 1C57C 8001B97C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1C580 8001B980 8FB00010 */  lw         $s0, 0x10($sp)
/* 1C584 8001B984 03E00008 */  jr         $ra
/* 1C588 8001B988 27BD0030 */   addiu     $sp, $sp, 0x30
/* 1C58C 8001B98C 00000000 */  nop
