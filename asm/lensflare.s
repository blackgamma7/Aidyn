.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel lensflare_init
/* 2EA10 8002DE10 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 2EA14 8002DE14 24040020 */  addiu      $a0, $zero, 0x20
/* 2EA18 8002DE18 3C05800E */  lui        $a1, %hi(D_800DAA60)
/* 2EA1C 8002DE1C 24A5AA60 */  addiu      $a1, $a1, %lo(D_800DAA60)
/* 2EA20 8002DE20 24060057 */  addiu      $a2, $zero, 0x57
/* 2EA24 8002DE24 AFBF0028 */  sw         $ra, 0x28($sp)
/* 2EA28 8002DE28 AFB50024 */  sw         $s5, 0x24($sp)
/* 2EA2C 8002DE2C AFB40020 */  sw         $s4, 0x20($sp)
/* 2EA30 8002DE30 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2EA34 8002DE34 AFB20018 */  sw         $s2, 0x18($sp)
/* 2EA38 8002DE38 AFB10014 */  sw         $s1, 0x14($sp)
/* 2EA3C 8002DE3C 0C025F9C */  jal        Malloc
/* 2EA40 8002DE40 AFB00010 */   sw        $s0, 0x10($sp)
/* 2EA44 8002DE44 00008021 */  addu       $s0, $zero, $zero
/* 2EA48 8002DE48 3C04800F */  lui        $a0, 0x800f
/* 2EA4C 8002DE4C 00809021 */  addu       $s2, $a0, $zero
/* 2EA50 8002DE50 3C15800F */  lui        $s5, 0x800f
/* 2EA54 8002DE54 24140001 */  addiu      $s4, $zero, 1
/* 2EA58 8002DE58 24130002 */  addiu      $s3, $zero, 2
/* 2EA5C 8002DE5C 3C03800F */  lui        $v1, %hi(lensflare_dat)
/* 2EA60 8002DE60 2471C630 */  addiu      $s1, $v1, %lo(lensflare_dat)
/* 2EA64 8002DE64 AC82C6B8 */  sw         $v0, -0x3948($a0)
/* 2EA68 8002DE68 3C02800F */  lui        $v0, %hi(D_800E88D8)
/* 2EA6C 8002DE6C AC4088D8 */  sw         $zero, %lo(D_800E88D8)($v0)
/* 2EA70 8002DE70 92230000 */  lbu        $v1, ($s1)
.L8002DE74:
/* 2EA74 8002DE74 1074000B */  beq        $v1, $s4, .L8002DEA4
/* 2EA78 8002DE78 28620002 */   slti      $v0, $v1, 2
/* 2EA7C 8002DE7C 10400005 */  beqz       $v0, .L8002DE94
/* 2EA80 8002DE80 00000000 */   nop
/* 2EA84 8002DE84 10600008 */  beqz       $v1, .L8002DEA8
/* 2EA88 8002DE88 24040192 */   addiu     $a0, $zero, 0x192
/* 2EA8C 8002DE8C 0800B7B0 */  j          .L8002DEC0
/* 2EA90 8002DE90 26310010 */   addiu     $s1, $s1, 0x10
.L8002DE94:
/* 2EA94 8002DE94 10730004 */  beq        $v1, $s3, .L8002DEA8
/* 2EA98 8002DE98 24040192 */   addiu     $a0, $zero, 0x192
/* 2EA9C 8002DE9C 0800B7B0 */  j          .L8002DEC0
/* 2EAA0 8002DEA0 26310010 */   addiu     $s1, $s1, 0x10
.L8002DEA4:
/* 2EAA4 8002DEA4 24040193 */  addiu      $a0, $zero, 0x193
.L8002DEA8:
/* 2EAA8 8002DEA8 0C0290E2 */  jal        get_borg_8
/* 2EAAC 8002DEAC 26310010 */   addiu     $s1, $s1, 0x10
/* 2EAB0 8002DEB0 8E44C6B8 */  lw         $a0, -0x3948($s2)
/* 2EAB4 8002DEB4 00101880 */  sll        $v1, $s0, 2
/* 2EAB8 8002DEB8 00641821 */  addu       $v1, $v1, $a0
/* 2EABC 8002DEBC AC620000 */  sw         $v0, ($v1)
.L8002DEC0:
/* 2EAC0 8002DEC0 26100001 */  addiu      $s0, $s0, 1
/* 2EAC4 8002DEC4 2A020008 */  slti       $v0, $s0, 8
/* 2EAC8 8002DEC8 5440FFEA */  bnel       $v0, $zero, .L8002DE74
/* 2EACC 8002DECC 92230000 */   lbu       $v1, ($s1)
/* 2EAD0 8002DED0 3C01800E */  lui        $at, %hi(D_800DAA74)
/* 2EAD4 8002DED4 C420AA74 */  lwc1       $f0, %lo(D_800DAA74)($at)
/* 2EAD8 8002DED8 8FBF0028 */  lw         $ra, 0x28($sp)
/* 2EADC 8002DEDC 8FB40020 */  lw         $s4, 0x20($sp)
/* 2EAE0 8002DEE0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2EAE4 8002DEE4 8FB20018 */  lw         $s2, 0x18($sp)
/* 2EAE8 8002DEE8 8FB10014 */  lw         $s1, 0x14($sp)
/* 2EAEC 8002DEEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 2EAF0 8002DEF0 3C02800F */  lui        $v0, %hi(lensflare_bss)
/* 2EAF4 8002DEF4 A0405410 */  sb         $zero, %lo(lensflare_bss)($v0)
/* 2EAF8 8002DEF8 26A2C6B0 */  addiu      $v0, $s5, -0x3950
/* 2EAFC 8002DEFC E6A0C6B0 */  swc1       $f0, -0x3950($s5)
/* 2EB00 8002DF00 8FB50024 */  lw         $s5, 0x24($sp)
/* 2EB04 8002DF04 E4400004 */  swc1       $f0, 4($v0)
/* 2EB08 8002DF08 03E00008 */  jr         $ra
/* 2EB0C 8002DF0C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel lensflare_free
/* 2EB10 8002DF10 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 2EB14 8002DF14 AFB10014 */  sw         $s1, 0x14($sp)
/* 2EB18 8002DF18 00008821 */  addu       $s1, $zero, $zero
/* 2EB1C 8002DF1C AFB40020 */  sw         $s4, 0x20($sp)
/* 2EB20 8002DF20 3C14800E */  lui        $s4, 0x800e
/* 2EB24 8002DF24 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2EB28 8002DF28 3C13800F */  lui        $s3, 0x800f
/* 2EB2C 8002DF2C AFB20018 */  sw         $s2, 0x18($sp)
/* 2EB30 8002DF30 02609021 */  addu       $s2, $s3, $zero
/* 2EB34 8002DF34 AFBF0024 */  sw         $ra, 0x24($sp)
/* 2EB38 8002DF38 AFB00010 */  sw         $s0, 0x10($sp)
.L8002DF3C:
/* 2EB3C 8002DF3C 26847ECC */  addiu      $a0, $s4, 0x7ecc
/* 2EB40 8002DF40 24060004 */  addiu      $a2, $zero, 4
/* 2EB44 8002DF44 00118080 */  sll        $s0, $s1, 2
/* 2EB48 8002DF48 8E45C6B8 */  lw         $a1, -0x3948($s2)
/* 2EB4C 8002DF4C 00003821 */  addu       $a3, $zero, $zero
/* 2EB50 8002DF50 0C035867 */  jal        AllocFreeQueueItem
/* 2EB54 8002DF54 00B02821 */   addu      $a1, $a1, $s0
/* 2EB58 8002DF58 8E42C6B8 */  lw         $v0, -0x3948($s2)
/* 2EB5C 8002DF5C 26310001 */  addiu      $s1, $s1, 1
/* 2EB60 8002DF60 02028021 */  addu       $s0, $s0, $v0
/* 2EB64 8002DF64 2A220008 */  slti       $v0, $s1, 8
/* 2EB68 8002DF68 1440FFF4 */  bnez       $v0, .L8002DF3C
/* 2EB6C 8002DF6C AE000000 */   sw        $zero, ($s0)
/* 2EB70 8002DF70 3C05800E */  lui        $a1, %hi(D_800DAA60)
/* 2EB74 8002DF74 24A5AA60 */  addiu      $a1, $a1, %lo(D_800DAA60)
/* 2EB78 8002DF78 8E64C6B8 */  lw         $a0, -0x3948($s3)
/* 2EB7C 8002DF7C 0C02600C */  jal        Free
/* 2EB80 8002DF80 2406007C */   addiu     $a2, $zero, 0x7c
/* 2EB84 8002DF84 8FBF0024 */  lw         $ra, 0x24($sp)
/* 2EB88 8002DF88 8FB40020 */  lw         $s4, 0x20($sp)
/* 2EB8C 8002DF8C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2EB90 8002DF90 8FB20018 */  lw         $s2, 0x18($sp)
/* 2EB94 8002DF94 8FB10014 */  lw         $s1, 0x14($sp)
/* 2EB98 8002DF98 8FB00010 */  lw         $s0, 0x10($sp)
/* 2EB9C 8002DF9C 03E00008 */  jr         $ra
/* 2EBA0 8002DFA0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8002DFA4
/* 2EBA4 8002DFA4 27BDFEE0 */  addiu      $sp, $sp, -0x120
/* 2EBA8 8002DFA8 AFB100EC */  sw         $s1, 0xec($sp)
/* 2EBAC 8002DFAC 00808821 */  addu       $s1, $a0, $zero
/* 2EBB0 8002DFB0 3C02800E */  lui        $v0, %hi(Camera)
/* 2EBB4 8002DFB4 24426ABC */  addiu      $v0, $v0, %lo(Camera)
/* 2EBB8 8002DFB8 2444FDEC */  addiu      $a0, $v0, -0x214
/* 2EBBC 8002DFBC AFBF00FC */  sw         $ra, 0xfc($sp)
/* 2EBC0 8002DFC0 AFB400F8 */  sw         $s4, 0xf8($sp)
/* 2EBC4 8002DFC4 AFB300F4 */  sw         $s3, 0xf4($sp)
/* 2EBC8 8002DFC8 AFB200F0 */  sw         $s2, 0xf0($sp)
/* 2EBCC 8002DFCC AFB000E8 */  sw         $s0, 0xe8($sp)
/* 2EBD0 8002DFD0 F7BA0118 */  sdc1       $f26, 0x118($sp)
/* 2EBD4 8002DFD4 F7B80110 */  sdc1       $f24, 0x110($sp)
/* 2EBD8 8002DFD8 F7B60108 */  sdc1       $f22, 0x108($sp)
/* 2EBDC 8002DFDC F7B40100 */  sdc1       $f20, 0x100($sp)
/* 2EBE0 8002DFE0 104000D8 */  beqz       $v0, .L8002E344
/* 2EBE4 8002DFE4 AC801488 */   sw        $zero, 0x1488($a0)
/* 2EBE8 8002DFE8 8483144C */  lh         $v1, 0x144c($a0)
/* 2EBEC 8002DFEC 24020003 */  addiu      $v0, $zero, 3
/* 2EBF0 8002DFF0 146200D5 */  bne        $v1, $v0, .L8002E348
/* 2EBF4 8002DFF4 02201021 */   addu      $v0, $s1, $zero
/* 2EBF8 8002DFF8 8C822030 */  lw         $v0, 0x2030($a0)
/* 2EBFC 8002DFFC 10400019 */  beqz       $v0, .L8002E064
/* 2EC00 8002E000 3C02800F */   lui       $v0, %hi(lensflare_float_A)
/* 2EC04 8002E004 C442C6B0 */  lwc1       $f2, %lo(lensflare_float_A)($v0)
/* 2EC08 8002E008 3C01800E */  lui        $at, %hi(D_800DAA78)
/* 2EC0C 8002E00C C424AA78 */  lwc1       $f4, %lo(D_800DAA78)($at)
/* 2EC10 8002E010 4604103E */  c.le.s     $f2, $f4
/* 2EC14 8002E014 00000000 */  nop
/* 2EC18 8002E018 45010012 */  bc1t       .L8002E064
/* 2EC1C 8002E01C 2442C6B0 */   addiu     $v0, $v0, -0x3950
/* 2EC20 8002E020 3C01800E */  lui        $at, %hi(D_800DAA7C)
/* 2EC24 8002E024 C420AA7C */  lwc1       $f0, %lo(D_800DAA7C)($at)
/* 2EC28 8002E028 4602003E */  c.le.s     $f0, $f2
/* 2EC2C 8002E02C 00000000 */  nop
/* 2EC30 8002E030 4503000D */  bc1tl      .L8002E068
/* 2EC34 8002E034 00001021 */   addu      $v0, $zero, $zero
/* 2EC38 8002E038 C4420004 */  lwc1       $f2, 4($v0)
/* 2EC3C 8002E03C 4604103E */  c.le.s     $f2, $f4
/* 2EC40 8002E040 00000000 */  nop
/* 2EC44 8002E044 45010008 */  bc1t       .L8002E068
/* 2EC48 8002E048 00001021 */   addu      $v0, $zero, $zero
/* 2EC4C 8002E04C 3C01800E */  lui        $at, %hi(D_800DAA80)
/* 2EC50 8002E050 C420AA80 */  lwc1       $f0, %lo(D_800DAA80)($at)
/* 2EC54 8002E054 4602003E */  c.le.s     $f0, $f2
/* 2EC58 8002E058 00000000 */  nop
/* 2EC5C 8002E05C 45000002 */  bc1f       .L8002E068
/* 2EC60 8002E060 24020001 */   addiu     $v0, $zero, 1
.L8002E064:
/* 2EC64 8002E064 00001021 */  addu       $v0, $zero, $zero
.L8002E068:
/* 2EC68 8002E068 1040000F */  beqz       $v0, .L8002E0A8
/* 2EC6C 8002E06C 3C03800F */   lui       $v1, %hi(lensflare_bss)
/* 2EC70 8002E070 90625410 */  lbu        $v0, %lo(lensflare_bss)($v1)
/* 2EC74 8002E074 2C420032 */  sltiu      $v0, $v0, 0x32
/* 2EC78 8002E078 10400015 */  beqz       $v0, .L8002E0D0
/* 2EC7C 8002E07C 00608021 */   addu      $s0, $v1, $zero
/* 2EC80 8002E080 92035410 */  lbu        $v1, 0x5410($s0)
/* 2EC84 8002E084 24040032 */  addiu      $a0, $zero, 0x32
/* 2EC88 8002E088 00831023 */  subu       $v0, $a0, $v1
/* 2EC8C 8002E08C 2842000A */  slti       $v0, $v0, 0xa
/* 2EC90 8002E090 10400003 */  beqz       $v0, .L8002E0A0
/* 2EC94 8002E094 2462000A */   addiu     $v0, $v1, 0xa
/* 2EC98 8002E098 0800B834 */  j          .L8002E0D0
/* 2EC9C 8002E09C A2045410 */   sb        $a0, 0x5410($s0)
.L8002E0A0:
/* 2ECA0 8002E0A0 0800B834 */  j          .L8002E0D0
/* 2ECA4 8002E0A4 A2025410 */   sb        $v0, 0x5410($s0)
.L8002E0A8:
/* 2ECA8 8002E0A8 3C02800F */  lui        $v0, %hi(lensflare_bss)
/* 2ECAC 8002E0AC 90435410 */  lbu        $v1, %lo(lensflare_bss)($v0)
/* 2ECB0 8002E0B0 00408021 */  addu       $s0, $v0, $zero
/* 2ECB4 8002E0B4 306200FF */  andi       $v0, $v1, 0xff
/* 2ECB8 8002E0B8 104000A2 */  beqz       $v0, .L8002E344
/* 2ECBC 8002E0BC 2C42000B */   sltiu     $v0, $v0, 0xb
/* 2ECC0 8002E0C0 54400003 */  bnel       $v0, $zero, .L8002E0D0
/* 2ECC4 8002E0C4 A2005410 */   sb        $zero, 0x5410($s0)
/* 2ECC8 8002E0C8 2462FFF6 */  addiu      $v0, $v1, -0xa
/* 2ECCC 8002E0CC A2025410 */  sb         $v0, 0x5410($s0)
.L8002E0D0:
/* 2ECD0 8002E0D0 92025410 */  lbu        $v0, 0x5410($s0)
/* 2ECD4 8002E0D4 1040009B */  beqz       $v0, .L8002E344
/* 2ECD8 8002E0D8 3C02800F */   lui       $v0, %hi(lensflare_float_A)
/* 2ECDC 8002E0DC C442C6B0 */  lwc1       $f2, %lo(lensflare_float_A)($v0)
/* 2ECE0 8002E0E0 2442C6B0 */  addiu      $v0, $v0, -0x3950
/* 2ECE4 8002E0E4 3C01800E */  lui        $at, %hi(D_800DAA84)
/* 2ECE8 8002E0E8 C426AA84 */  lwc1       $f6, %lo(D_800DAA84)($at)
/* 2ECEC 8002E0EC 3C01800E */  lui        $at, %hi(D_800DAA88)
/* 2ECF0 8002E0F0 C424AA88 */  lwc1       $f4, %lo(D_800DAA88)($at)
/* 2ECF4 8002E0F4 46061081 */  sub.s      $f2, $f2, $f6
/* 2ECF8 8002E0F8 C4400004 */  lwc1       $f0, 4($v0)
/* 2ECFC 8002E0FC 27A400A8 */  addiu      $a0, $sp, 0xa8
/* 2ED00 8002E100 46040001 */  sub.s      $f0, $f0, $f4
/* 2ED04 8002E104 E7A60028 */  swc1       $f6, 0x28($sp)
/* 2ED08 8002E108 E7A4002C */  swc1       $f4, 0x2c($sp)
/* 2ED0C 8002E10C E7A20068 */  swc1       $f2, 0x68($sp)
/* 2ED10 8002E110 E7A0006C */  swc1       $f0, 0x6c($sp)
/* 2ED14 8002E114 E7A200A8 */  swc1       $f2, 0xa8($sp)
/* 2ED18 8002E118 0C02AB9F */  jal        vec2_normalize
/* 2ED1C 8002E11C E7A000AC */   swc1      $f0, 0xac($sp)
/* 2ED20 8002E120 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2ED24 8002E124 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 2ED28 8002E128 9243146C */  lbu        $v1, 0x146c($s2)
/* 2ED2C 8002E12C 3C01800E */  lui        $at, %hi(D_800DAA90)
/* 2ED30 8002E130 D422AA90 */  ldc1       $f2, %lo(D_800DAA90)($at)
/* 2ED34 8002E134 44830000 */  mtc1       $v1, $f0
/* 2ED38 8002E138 46800020 */  cvt.s.w    $f0, $f0
/* 2ED3C 8002E13C 46000021 */  cvt.d.s    $f0, $f0
/* 2ED40 8002E140 46201001 */  sub.d      $f0, $f2, $f0
/* 2ED44 8002E144 3C01800E */  lui        $at, %hi(D_800DAA98)
/* 2ED48 8002E148 D436AA98 */  ldc1       $f22, %lo(D_800DAA98)($at)
/* 2ED4C 8002E14C 92025410 */  lbu        $v0, 0x5410($s0)
/* 2ED50 8002E150 46220003 */  div.d      $f0, $f0, $f2
/* 2ED54 8002E154 4620B001 */  sub.d      $f0, $f22, $f0
/* 2ED58 8002E158 44821000 */  mtc1       $v0, $f2
/* 2ED5C 8002E15C 468010A0 */  cvt.s.w    $f2, $f2
/* 2ED60 8002E160 46200520 */  cvt.s.d    $f20, $f0
/* 2ED64 8002E164 46141602 */  mul.s      $f24, $f2, $f20
/* 2ED68 8002E168 0C02AB04 */  jal        vec2_length
/* 2ED6C 8002E16C 27A40068 */   addiu     $a0, $sp, 0x68
/* 2ED70 8002E170 3C01800E */  lui        $at, %hi(D_800DAAA0)
/* 2ED74 8002E174 C422AAA0 */  lwc1       $f2, %lo(D_800DAAA0)($at)
/* 2ED78 8002E178 46000686 */  mov.s      $f26, $f0
/* 2ED7C 8002E17C 4602D03E */  c.le.s     $f26, $f2
/* 2ED80 8002E180 00000000 */  nop
/* 2ED84 8002E184 45000011 */  bc1f       .L8002E1CC
/* 2ED88 8002E188 92025410 */   lbu       $v0, 0x5410($s0)
/* 2ED8C 8002E18C 4602D083 */  div.s      $f2, $f26, $f2
/* 2ED90 8002E190 460010A1 */  cvt.d.s    $f2, $f2
/* 2ED94 8002E194 4622B081 */  sub.d      $f2, $f22, $f2
/* 2ED98 8002E198 4600A021 */  cvt.d.s    $f0, $f20
/* 2ED9C 8002E19C 46220002 */  mul.d      $f0, $f0, $f2
/* 2EDA0 8002E1A0 3C01800E */  lui        $at, %hi(D_800DAAA8)
/* 2EDA4 8002E1A4 D424AAA8 */  ldc1       $f4, %lo(D_800DAAA8)($at)
/* 2EDA8 8002E1A8 46240002 */  mul.d      $f0, $f0, $f4
/* 2EDAC 8002E1AC 44821000 */  mtc1       $v0, $f2
/* 2EDB0 8002E1B0 468010A1 */  cvt.d.w    $f2, $f2
/* 2EDB4 8002E1B4 46220002 */  mul.d      $f0, $f0, $f2
/* 2EDB8 8002E1B8 3C01800E */  lui        $at, %hi(D_800DAAB0)
/* 2EDBC 8002E1BC D424AAB0 */  ldc1       $f4, %lo(D_800DAAB0)($at)
/* 2EDC0 8002E1C0 46240003 */  div.d      $f0, $f0, $f4
/* 2EDC4 8002E1C4 46200020 */  cvt.s.d    $f0, $f0
/* 2EDC8 8002E1C8 E6401488 */  swc1       $f0, 0x1488($s2)
.L8002E1CC:
/* 2EDCC 8002E1CC 0C0025B4 */  jal        get_hres
/* 2EDD0 8002E1D0 3C14800F */   lui       $s4, 0x800f
/* 2EDD4 8002E1D4 0C0025B7 */  jal        get_vres
/* 2EDD8 8002E1D8 00408021 */   addu      $s0, $v0, $zero
/* 2EDDC 8002E1DC 02202021 */  addu       $a0, $s1, $zero
/* 2EDE0 8002E1E0 24050006 */  addiu      $a1, $zero, 6
/* 2EDE4 8002E1E4 02003021 */  addu       $a2, $s0, $zero
/* 2EDE8 8002E1E8 0C0290ED */  jal        rsp_func
/* 2EDEC 8002E1EC 00403821 */   addu      $a3, $v0, $zero
/* 2EDF0 8002E1F0 00408821 */  addu       $s1, $v0, $zero
/* 2EDF4 8002E1F4 00008021 */  addu       $s0, $zero, $zero
/* 2EDF8 8002E1F8 3C13800F */  lui        $s3, 0x800f
/* 2EDFC 8002E1FC 3C128000 */  lui        $s2, 0x8000
.L8002E200:
/* 2EE00 8002E200 3C01800E */  lui        $at, %hi(D_800DAAB8)
/* 2EE04 8002E204 C420AAB8 */  lwc1       $f0, %lo(D_800DAAB8)($at)
/* 2EE08 8002E208 3C01800E */  lui        $at, %hi(D_800DAAC0)
/* 2EE0C 8002E20C D422AAC0 */  ldc1       $f2, %lo(D_800DAAC0)($at)
/* 2EE10 8002E210 4600D103 */  div.s      $f4, $f26, $f0
/* 2EE14 8002E214 46002021 */  cvt.d.s    $f0, $f4
/* 2EE18 8002E218 4620103C */  c.lt.d     $f2, $f0
/* 2EE1C 8002E21C 00000000 */  nop
/* 2EE20 8002E220 45000003 */  bc1f       .L8002E230
/* 2EE24 8002E224 2687C630 */   addiu     $a3, $s4, -0x39d0
/* 2EE28 8002E228 3C01800E */  lui        $at, %hi(D_800DAAC8)
/* 2EE2C 8002E22C C424AAC8 */  lwc1       $f4, %lo(D_800DAAC8)($at)
.L8002E230:
/* 2EE30 8002E230 00103100 */  sll        $a2, $s0, 4
/* 2EE34 8002E234 00E61821 */  addu       $v1, $a3, $a2
/* 2EE38 8002E238 C4600008 */  lwc1       $f0, 8($v1)
/* 2EE3C 8002E23C 46040282 */  mul.s      $f10, $f0, $f4
/* 2EE40 8002E240 00602821 */  addu       $a1, $v1, $zero
/* 2EE44 8002E244 C4A80004 */  lwc1       $f8, 4($a1)
/* 2EE48 8002E248 C7A40068 */  lwc1       $f4, 0x68($sp)
/* 2EE4C 8002E24C 8E62C6B8 */  lw         $v0, -0x3948($s3)
/* 2EE50 8002E250 46044102 */  mul.s      $f4, $f8, $f4
/* 2EE54 8002E254 00102080 */  sll        $a0, $s0, 2
/* 2EE58 8002E258 00824021 */  addu       $t0, $a0, $v0
/* 2EE5C 8002E25C C7A0006C */  lwc1       $f0, 0x6c($sp)
/* 2EE60 8002E260 8D030000 */  lw         $v1, ($t0)
/* 2EE64 8002E264 46004202 */  mul.s      $f8, $f8, $f0
/* 2EE68 8002E268 9462000A */  lhu        $v0, 0xa($v1)
/* 2EE6C 8002E26C 00021042 */  srl        $v0, $v0, 1
/* 2EE70 8002E270 44821000 */  mtc1       $v0, $f2
/* 2EE74 8002E274 468010A0 */  cvt.s.w    $f2, $f2
/* 2EE78 8002E278 460A1082 */  mul.s      $f2, $f2, $f10
/* 2EE7C 8002E27C 9462000C */  lhu        $v0, 0xc($v1)
/* 2EE80 8002E280 00021042 */  srl        $v0, $v0, 1
/* 2EE84 8002E284 44823000 */  mtc1       $v0, $f6
/* 2EE88 8002E288 468031A0 */  cvt.s.w    $f6, $f6
/* 2EE8C 8002E28C 460A3182 */  mul.s      $f6, $f6, $f10
/* 2EE90 8002E290 C7A00028 */  lwc1       $f0, 0x28($sp)
/* 2EE94 8002E294 46040000 */  add.s      $f0, $f0, $f4
/* 2EE98 8002E298 C7A4002C */  lwc1       $f4, 0x2c($sp)
/* 2EE9C 8002E29C 46082100 */  add.s      $f4, $f4, $f8
/* 2EEA0 8002E2A0 46020301 */  sub.s      $f12, $f0, $f2
/* 2EEA4 8002E2A4 3C01800E */  lui        $at, %hi(D_800DAAD0)
/* 2EEA8 8002E2A8 D422AAD0 */  ldc1       $f2, %lo(D_800DAAD0)($at)
/* 2EEAC 8002E2AC 46005021 */  cvt.d.s    $f0, $f10
/* 2EEB0 8002E2B0 4620103C */  c.lt.d     $f2, $f0
/* 2EEB4 8002E2B4 00000000 */  nop
/* 2EEB8 8002E2B8 4500001E */  bc1f       .L8002E334
/* 2EEBC 8002E2BC 46062101 */   sub.s     $f4, $f4, $f6
/* 2EEC0 8002E2C0 00C71021 */  addu       $v0, $a2, $a3
/* 2EEC4 8002E2C4 E7AA0010 */  swc1       $f10, 0x10($sp)
/* 2EEC8 8002E2C8 E7AA0014 */  swc1       $f10, 0x14($sp)
/* 2EECC 8002E2CC 9044000C */  lbu        $a0, 0xc($v0)
/* 2EED0 8002E2D0 9045000D */  lbu        $a1, 0xd($v0)
/* 2EED4 8002E2D4 3C01800E */  lui        $at, %hi(D_800DAAD8)
/* 2EED8 8002E2D8 C420AAD8 */  lwc1       $f0, %lo(D_800DAAD8)($at)
/* 2EEDC 8002E2DC 9043000E */  lbu        $v1, 0xe($v0)
/* 2EEE0 8002E2E0 4618003E */  c.le.s     $f0, $f24
/* 2EEE4 8002E2E4 AFA40018 */  sw         $a0, 0x18($sp)
/* 2EEE8 8002E2E8 AFA5001C */  sw         $a1, 0x1c($sp)
/* 2EEEC 8002E2EC 45010005 */  bc1t       .L8002E304
/* 2EEF0 8002E2F0 AFA30020 */   sw        $v1, 0x20($sp)
/* 2EEF4 8002E2F4 4600C00D */  trunc.w.s  $f0, $f24
/* 2EEF8 8002E2F8 44020000 */  mfc1       $v0, $f0
/* 2EEFC 8002E2FC 0800B8C6 */  j          .L8002E318
/* 2EF00 8002E300 304200FF */   andi      $v0, $v0, 0xff
.L8002E304:
/* 2EF04 8002E304 4600C001 */  sub.s      $f0, $f24, $f0
/* 2EF08 8002E308 4600008D */  trunc.w.s  $f2, $f0
/* 2EF0C 8002E30C 44021000 */  mfc1       $v0, $f2
/* 2EF10 8002E310 00521025 */  or         $v0, $v0, $s2
/* 2EF14 8002E314 304200FF */  andi       $v0, $v0, 0xff
.L8002E318:
/* 2EF18 8002E318 AFA20024 */  sw         $v0, 0x24($sp)
/* 2EF1C 8002E31C 8D050000 */  lw         $a1, ($t0)
/* 2EF20 8002E320 44066000 */  mfc1       $a2, $f12
/* 2EF24 8002E324 44072000 */  mfc1       $a3, $f4
/* 2EF28 8002E328 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2EF2C 8002E32C 02202021 */   addu      $a0, $s1, $zero
/* 2EF30 8002E330 00408821 */  addu       $s1, $v0, $zero
.L8002E334:
/* 2EF34 8002E334 26100001 */  addiu      $s0, $s0, 1
/* 2EF38 8002E338 2A020008 */  slti       $v0, $s0, 8
/* 2EF3C 8002E33C 1440FFB0 */  bnez       $v0, .L8002E200
/* 2EF40 8002E340 00000000 */   nop
.L8002E344:
/* 2EF44 8002E344 02201021 */  addu       $v0, $s1, $zero
.L8002E348:
/* 2EF48 8002E348 8FBF00FC */  lw         $ra, 0xfc($sp)
/* 2EF4C 8002E34C 8FB400F8 */  lw         $s4, 0xf8($sp)
/* 2EF50 8002E350 8FB300F4 */  lw         $s3, 0xf4($sp)
/* 2EF54 8002E354 8FB200F0 */  lw         $s2, 0xf0($sp)
/* 2EF58 8002E358 8FB100EC */  lw         $s1, 0xec($sp)
/* 2EF5C 8002E35C 8FB000E8 */  lw         $s0, 0xe8($sp)
/* 2EF60 8002E360 D7BA0118 */  ldc1       $f26, 0x118($sp)
/* 2EF64 8002E364 D7B80110 */  ldc1       $f24, 0x110($sp)
/* 2EF68 8002E368 D7B60108 */  ldc1       $f22, 0x108($sp)
/* 2EF6C 8002E36C D7B40100 */  ldc1       $f20, 0x100($sp)
/* 2EF70 8002E370 03E00008 */  jr         $ra
/* 2EF74 8002E374 27BD0120 */   addiu     $sp, $sp, 0x120
/* 2EF78 8002E378 00000000 */  nop
/* 2EF7C 8002E37C 00000000 */  nop
