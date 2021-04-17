.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel setRNGSeed
/* 9D8A0 8009CCA0 8C820000 */  lw         $v0, ($a0)
/* 9D8A4 8009CCA4 14400002 */  bnez       $v0, .L8009CCB0
/* 9D8A8 8009CCA8 24020001 */   addiu     $v0, $zero, 1
/* 9D8AC 8009CCAC AC820000 */  sw         $v0, ($a0)
.L8009CCB0:
/* 9D8B0 8009CCB0 03E00008 */  jr         $ra
/* 9D8B4 8009CCB4 AC850000 */   sw        $a1, ($a0)

glabel ShiftSeed
/* 9D8B8 8009CCB8 3C050019 */  lui        $a1, 0x19
/* 9D8BC 8009CCBC 8C820000 */  lw         $v0, ($a0)
/* 9D8C0 8009CCC0 34A5660D */  ori        $a1, $a1, 0x660d
/* 9D8C4 8009CCC4 00450018 */  mult       $v0, $a1
/* 9D8C8 8009CCC8 3C033C6E */  lui        $v1, 0x3c6e
/* 9D8CC 8009CCCC 3463F35F */  ori        $v1, $v1, 0xf35f
/* 9D8D0 8009CCD0 00001012 */  mflo       $v0
/* 9D8D4 8009CCD4 00431021 */  addu       $v0, $v0, $v1
/* 9D8D8 8009CCD8 03E00008 */  jr         $ra
/* 9D8DC 8009CCDC AC820000 */   sw        $v0, ($a0)

glabel rand_0_to_B
/* 9D8E0 8009CCE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9D8E4 8009CCE4 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D8E8 8009CCE8 00A08021 */  addu       $s0, $a1, $zero
/* 9D8EC 8009CCEC 1200000C */  beqz       $s0, .L8009CD20
/* 9D8F0 8009CCF0 AFBF0014 */   sw        $ra, 0x14($sp)
/* 9D8F4 8009CCF4 0C02732E */  jal        ShiftSeed
/* 9D8F8 8009CCF8 00000000 */   nop
/* 9D8FC 8009CCFC 02020019 */  multu      $s0, $v0
/* 9D900 8009CD00 24060001 */  addiu      $a2, $zero, 1
/* 9D904 8009CD04 24070000 */  addiu      $a3, $zero, 0
/* 9D908 8009CD08 00002010 */  mfhi       $a0
/* 9D90C 8009CD0C 00002812 */  mflo       $a1
/* 9D910 8009CD10 0C02F6D8 */  jal        udivdi3
/* 9D914 8009CD14 00000000 */   nop
/* 9D918 8009CD18 08027349 */  j          .L8009CD24
/* 9D91C 8009CD1C 00601021 */   addu      $v0, $v1, $zero
.L8009CD20:
/* 9D920 8009CD20 00001021 */  addu       $v0, $zero, $zero
.L8009CD24:
/* 9D924 8009CD24 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9D928 8009CD28 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D92C 8009CD2C 03E00008 */  jr         $ra
/* 9D930 8009CD30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rand_func
/* 9D934 8009CD34 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9D938 8009CD38 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D93C 8009CD3C 00A08021 */  addu       $s0, $a1, $zero
/* 9D940 8009CD40 16060003 */  bne        $s0, $a2, .L8009CD50
/* 9D944 8009CD44 AFBF0014 */   sw        $ra, 0x14($sp)
/* 9D948 8009CD48 0802735D */  j          .L8009CD74
/* 9D94C 8009CD4C 02001021 */   addu      $v0, $s0, $zero
.L8009CD50:
/* 9D950 8009CD50 00D0102B */  sltu       $v0, $a2, $s0
/* 9D954 8009CD54 10400003 */  beqz       $v0, .L8009CD64
/* 9D958 8009CD58 02001021 */   addu      $v0, $s0, $zero
/* 9D95C 8009CD5C 00C08021 */  addu       $s0, $a2, $zero
/* 9D960 8009CD60 00403021 */  addu       $a2, $v0, $zero
.L8009CD64:
/* 9D964 8009CD64 00D02823 */  subu       $a1, $a2, $s0
/* 9D968 8009CD68 0C027338 */  jal        rand_0_to_B
/* 9D96C 8009CD6C 24A50001 */   addiu     $a1, $a1, 1
/* 9D970 8009CD70 00501021 */  addu       $v0, $v0, $s0
.L8009CD74:
/* 9D974 8009CD74 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9D978 8009CD78 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D97C 8009CD7C 03E00008 */  jr         $ra
/* 9D980 8009CD80 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8009CD84
/* 9D984 8009CD84 3C050019 */  lui        $a1, 0x19
/* 9D988 8009CD88 8C820000 */  lw         $v0, ($a0)
/* 9D98C 8009CD8C 34A5660D */  ori        $a1, $a1, 0x660d
/* 9D990 8009CD90 00450018 */  mult       $v0, $a1
/* 9D994 8009CD94 3C033C6E */  lui        $v1, 0x3c6e
/* 9D998 8009CD98 3463F35F */  ori        $v1, $v1, 0xf35f
/* 9D99C 8009CD9C 00001012 */  mflo       $v0
/* 9D9A0 8009CDA0 00431021 */  addu       $v0, $v0, $v1
/* 9D9A4 8009CDA4 03E00008 */  jr         $ra
/* 9D9A8 8009CDA8 AC820000 */   sw        $v0, ($a0)

glabel randAudio
/* 9D9AC 8009CDAC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9D9B0 8009CDB0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D9B4 8009CDB4 00A08021 */  addu       $s0, $a1, $zero
/* 9D9B8 8009CDB8 16000003 */  bnez       $s0, .L8009CDC8
/* 9D9BC 8009CDBC AFBF0014 */   sw        $ra, 0x14($sp)
/* 9D9C0 8009CDC0 080273A5 */  j          .L8009CE94
/* 9D9C4 8009CDC4 00001021 */   addu      $v0, $zero, $zero
.L8009CDC8:
/* 9D9C8 8009CDC8 0600001A */  bltz       $s0, .L8009CE34
/* 9D9CC 8009CDCC 00000000 */   nop
/* 9D9D0 8009CDD0 0C02732E */  jal        ShiftSeed
/* 9D9D4 8009CDD4 00000000 */   nop
/* 9D9D8 8009CDD8 06010002 */  bgez       $s0, .L8009CDE4
/* 9D9DC 8009CDDC 02001821 */   addu      $v1, $s0, $zero
/* 9D9E0 8009CDE0 00031823 */  negu       $v1, $v1
.L8009CDE4:
/* 9D9E4 8009CDE4 00604821 */  addu       $t1, $v1, $zero
/* 9D9E8 8009CDE8 00403821 */  addu       $a3, $v0, $zero
/* 9D9EC 8009CDEC 01220019 */  multu      $t1, $v0
/* 9D9F0 8009CDF0 00002010 */  mfhi       $a0
/* 9D9F4 8009CDF4 00002812 */  mflo       $a1
/* 9D9F8 8009CDF8 00003021 */  addu       $a2, $zero, $zero
/* 9D9FC 8009CDFC 00000000 */  nop
/* 9DA00 8009CE00 01260018 */  mult       $t1, $a2
/* 9DA04 8009CE04 00001012 */  mflo       $v0
/* 9DA08 8009CE08 000347C3 */  sra        $t0, $v1, 0x1f
/* 9DA0C 8009CE0C 00000000 */  nop
/* 9DA10 8009CE10 00E80018 */  mult       $a3, $t0
/* 9DA14 8009CE14 24060001 */  addiu      $a2, $zero, 1
/* 9DA18 8009CE18 24070000 */  addiu      $a3, $zero, 0
/* 9DA1C 8009CE1C 00822021 */  addu       $a0, $a0, $v0
/* 9DA20 8009CE20 00004012 */  mflo       $t0
/* 9DA24 8009CE24 0C02F6D8 */  jal        udivdi3
/* 9DA28 8009CE28 00882021 */   addu      $a0, $a0, $t0
/* 9DA2C 8009CE2C 080273A5 */  j          .L8009CE94
/* 9DA30 8009CE30 00601021 */   addu      $v0, $v1, $zero
.L8009CE34:
/* 9DA34 8009CE34 0C02732E */  jal        ShiftSeed
/* 9DA38 8009CE38 00000000 */   nop
/* 9DA3C 8009CE3C 06010002 */  bgez       $s0, .L8009CE48
/* 9DA40 8009CE40 02001821 */   addu      $v1, $s0, $zero
/* 9DA44 8009CE44 00031823 */  negu       $v1, $v1
.L8009CE48:
/* 9DA48 8009CE48 00604821 */  addu       $t1, $v1, $zero
/* 9DA4C 8009CE4C 00403821 */  addu       $a3, $v0, $zero
/* 9DA50 8009CE50 01220019 */  multu      $t1, $v0
/* 9DA54 8009CE54 00002010 */  mfhi       $a0
/* 9DA58 8009CE58 00002812 */  mflo       $a1
/* 9DA5C 8009CE5C 00003021 */  addu       $a2, $zero, $zero
/* 9DA60 8009CE60 00000000 */  nop
/* 9DA64 8009CE64 01260018 */  mult       $t1, $a2
/* 9DA68 8009CE68 00001012 */  mflo       $v0
/* 9DA6C 8009CE6C 000347C3 */  sra        $t0, $v1, 0x1f
/* 9DA70 8009CE70 00000000 */  nop
/* 9DA74 8009CE74 00E80018 */  mult       $a3, $t0
/* 9DA78 8009CE78 24060001 */  addiu      $a2, $zero, 1
/* 9DA7C 8009CE7C 24070000 */  addiu      $a3, $zero, 0
/* 9DA80 8009CE80 00822021 */  addu       $a0, $a0, $v0
/* 9DA84 8009CE84 00004012 */  mflo       $t0
/* 9DA88 8009CE88 0C02F6D8 */  jal        udivdi3
/* 9DA8C 8009CE8C 00882021 */   addu      $a0, $a0, $t0
/* 9DA90 8009CE90 00031023 */  negu       $v0, $v1
.L8009CE94:
/* 9DA94 8009CE94 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9DA98 8009CE98 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DA9C 8009CE9C 03E00008 */  jr         $ra
/* 9DAA0 8009CEA0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rand_range_
/* 9DAA4 8009CEA4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9DAA8 8009CEA8 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DAAC 8009CEAC 00A08021 */  addu       $s0, $a1, $zero
/* 9DAB0 8009CEB0 16060003 */  bne        $s0, $a2, .L8009CEC0
/* 9DAB4 8009CEB4 AFBF0014 */   sw        $ra, 0x14($sp)
/* 9DAB8 8009CEB8 080273B9 */  j          .L8009CEE4
/* 9DABC 8009CEBC 02001021 */   addu      $v0, $s0, $zero
.L8009CEC0:
/* 9DAC0 8009CEC0 00D0102A */  slt        $v0, $a2, $s0
/* 9DAC4 8009CEC4 10400003 */  beqz       $v0, .L8009CED4
/* 9DAC8 8009CEC8 02001021 */   addu      $v0, $s0, $zero
/* 9DACC 8009CECC 00C08021 */  addu       $s0, $a2, $zero
/* 9DAD0 8009CED0 00403021 */  addu       $a2, $v0, $zero
.L8009CED4:
/* 9DAD4 8009CED4 00D02823 */  subu       $a1, $a2, $s0
/* 9DAD8 8009CED8 0C027338 */  jal        rand_0_to_B
/* 9DADC 8009CEDC 24A50001 */   addiu     $a1, $a1, 1
/* 9DAE0 8009CEE0 00501021 */  addu       $v0, $v0, $s0
.L8009CEE4:
/* 9DAE4 8009CEE4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9DAE8 8009CEE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DAEC 8009CEEC 03E00008 */  jr         $ra
/* 9DAF0 8009CEF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rand_float
/* 9DAF4 8009CEF4 3C050019 */  lui        $a1, 0x19
/* 9DAF8 8009CEF8 8C830000 */  lw         $v1, ($a0)
/* 9DAFC 8009CEFC 34A5660D */  ori        $a1, $a1, 0x660d
/* 9DB00 8009CF00 00650018 */  mult       $v1, $a1
/* 9DB04 8009CF04 3C023C6E */  lui        $v0, 0x3c6e
/* 9DB08 8009CF08 3442F35F */  ori        $v0, $v0, 0xf35f
/* 9DB0C 8009CF0C 00001812 */  mflo       $v1
/* 9DB10 8009CF10 00621821 */  addu       $v1, $v1, $v0
/* 9DB14 8009CF14 44832000 */  mtc1       $v1, $f4
/* 9DB18 8009CF18 46802121 */  cvt.d.w    $f4, $f4
/* 9DB1C 8009CF1C 04610004 */  bgez       $v1, .L8009CF30
/* 9DB20 8009CF20 AC830000 */   sw        $v1, ($a0)
/* 9DB24 8009CF24 3C01800E */  lui        $at, %hi(D_800E2DE0)
/* 9DB28 8009CF28 D4202DE0 */  ldc1       $f0, %lo(D_800E2DE0)($at)
/* 9DB2C 8009CF2C 46202100 */  add.d      $f4, $f4, $f0
.L8009CF30:
/* 9DB30 8009CF30 3C01800E */  lui        $at, %hi(D_800E2DE8)
/* 9DB34 8009CF34 C4222DE8 */  lwc1       $f2, %lo(D_800E2DE8)($at)
/* 9DB38 8009CF38 46202020 */  cvt.s.d    $f0, $f4
/* 9DB3C 8009CF3C 46020002 */  mul.s      $f0, $f0, $f2
/* 9DB40 8009CF40 03E00008 */  jr         $ra
/* 9DB44 8009CF44 00000000 */   nop

glabel rand_float_multi
/* 9DB48 8009CF48 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9DB4C 8009CF4C F7B40018 */  sdc1       $f20, 0x18($sp)
/* 9DB50 8009CF50 4485A000 */  mtc1       $a1, $f20
/* 9DB54 8009CF54 44800000 */  mtc1       $zero, $f0
/* 9DB58 8009CF58 4600A032 */  c.eq.s     $f20, $f0
/* 9DB5C 8009CF5C 00000000 */  nop
/* 9DB60 8009CF60 45010006 */  bc1t       .L8009CF7C
/* 9DB64 8009CF64 AFBF0010 */   sw        $ra, 0x10($sp)
/* 9DB68 8009CF68 0C0273BD */  jal        rand_float
/* 9DB6C 8009CF6C 00000000 */   nop
/* 9DB70 8009CF70 46140002 */  mul.s      $f0, $f0, $f20
/* 9DB74 8009CF74 080273E1 */  j          .L8009CF84
/* 9DB78 8009CF78 8FBF0010 */   lw        $ra, 0x10($sp)
.L8009CF7C:
/* 9DB7C 8009CF7C 4600A006 */  mov.s      $f0, $f20
/* 9DB80 8009CF80 8FBF0010 */  lw         $ra, 0x10($sp)
.L8009CF84:
/* 9DB84 8009CF84 D7B40018 */  ldc1       $f20, 0x18($sp)
/* 9DB88 8009CF88 03E00008 */  jr         $ra
/* 9DB8C 8009CF8C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel rand_float_range
/* 9DB90 8009CF90 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9DB94 8009CF94 F7B40018 */  sdc1       $f20, 0x18($sp)
/* 9DB98 8009CF98 4485A000 */  mtc1       $a1, $f20
/* 9DB9C 8009CF9C F7B60020 */  sdc1       $f22, 0x20($sp)
/* 9DBA0 8009CFA0 4486B000 */  mtc1       $a2, $f22
/* 9DBA4 8009CFA4 4616A032 */  c.eq.s     $f20, $f22
/* 9DBA8 8009CFA8 00000000 */  nop
/* 9DBAC 8009CFAC 45000003 */  bc1f       .L8009CFBC
/* 9DBB0 8009CFB0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 9DBB4 8009CFB4 080273FA */  j          .L8009CFE8
/* 9DBB8 8009CFB8 4600A006 */   mov.s     $f0, $f20
.L8009CFBC:
/* 9DBBC 8009CFBC 4614B03C */  c.lt.s     $f22, $f20
/* 9DBC0 8009CFC0 00000000 */  nop
/* 9DBC4 8009CFC4 45000003 */  bc1f       .L8009CFD4
/* 9DBC8 8009CFC8 4600A006 */   mov.s     $f0, $f20
/* 9DBCC 8009CFCC 4600B506 */  mov.s      $f20, $f22
/* 9DBD0 8009CFD0 46000586 */  mov.s      $f22, $f0
.L8009CFD4:
/* 9DBD4 8009CFD4 0C0273BD */  jal        rand_float
/* 9DBD8 8009CFD8 00000000 */   nop
/* 9DBDC 8009CFDC 4614B081 */  sub.s      $f2, $f22, $f20
/* 9DBE0 8009CFE0 46020002 */  mul.s      $f0, $f0, $f2
/* 9DBE4 8009CFE4 46140000 */  add.s      $f0, $f0, $f20
.L8009CFE8:
/* 9DBE8 8009CFE8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 9DBEC 8009CFEC D7B60020 */  ldc1       $f22, 0x20($sp)
/* 9DBF0 8009CFF0 D7B40018 */  ldc1       $f20, 0x18($sp)
/* 9DBF4 8009CFF4 03E00008 */  jr         $ra
/* 9DBF8 8009CFF8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel rand_vec2
/* 9DBFC 8009CFFC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9DC00 8009D000 F7B60028 */  sdc1       $f22, 0x28($sp)
/* 9DC04 8009D004 3C01800E */  lui        $at, %hi(D_800E2DEC)
/* 9DC08 8009D008 C4362DEC */  lwc1       $f22, %lo(D_800E2DEC)($at)
/* 9DC0C 8009D00C F7B40020 */  sdc1       $f20, 0x20($sp)
/* 9DC10 8009D010 3C01800E */  lui        $at, %hi(D_800E2DF0)
/* 9DC14 8009D014 C4342DF0 */  lwc1       $f20, %lo(D_800E2DF0)($at)
/* 9DC18 8009D018 AFB10014 */  sw         $s1, 0x14($sp)
/* 9DC1C 8009D01C 00A08821 */  addu       $s1, $a1, $zero
/* 9DC20 8009D020 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DC24 8009D024 F7B80030 */  sdc1       $f24, 0x30($sp)
/* 9DC28 8009D028 4486C000 */  mtc1       $a2, $f24
/* 9DC2C 8009D02C 4405B000 */  mfc1       $a1, $f22
/* 9DC30 8009D030 4406A000 */  mfc1       $a2, $f20
/* 9DC34 8009D034 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9DC38 8009D038 0C0273E4 */  jal        rand_float_range
/* 9DC3C 8009D03C 00808021 */   addu      $s0, $a0, $zero
/* 9DC40 8009D040 4405B000 */  mfc1       $a1, $f22
/* 9DC44 8009D044 4406A000 */  mfc1       $a2, $f20
/* 9DC48 8009D048 02002021 */  addu       $a0, $s0, $zero
/* 9DC4C 8009D04C 0C0273E4 */  jal        rand_float_range
/* 9DC50 8009D050 E6200000 */   swc1      $f0, ($s1)
/* 9DC54 8009D054 C6240000 */  lwc1       $f4, ($s1)
/* 9DC58 8009D058 44801000 */  mtc1       $zero, $f2
/* 9DC5C 8009D05C 46022032 */  c.eq.s     $f4, $f2
/* 9DC60 8009D060 00000000 */  nop
/* 9DC64 8009D064 45000004 */  bc1f       .L8009D078
/* 9DC68 8009D068 E6200004 */   swc1      $f0, 4($s1)
/* 9DC6C 8009D06C 3C01800E */  lui        $at, %hi(D_800E2DF4)
/* 9DC70 8009D070 C4202DF4 */  lwc1       $f0, %lo(D_800E2DF4)($at)
/* 9DC74 8009D074 E6200000 */  swc1       $f0, ($s1)
.L8009D078:
/* 9DC78 8009D078 0C02AB9F */  jal        vec2_normalize
/* 9DC7C 8009D07C 02202021 */   addu      $a0, $s1, $zero
/* 9DC80 8009D080 4405C000 */  mfc1       $a1, $f24
/* 9DC84 8009D084 0C02AD34 */  jal        multiVec2
/* 9DC88 8009D088 02202021 */   addu      $a0, $s1, $zero
/* 9DC8C 8009D08C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9DC90 8009D090 8FB10014 */  lw         $s1, 0x14($sp)
/* 9DC94 8009D094 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DC98 8009D098 D7B80030 */  ldc1       $f24, 0x30($sp)
/* 9DC9C 8009D09C D7B60028 */  ldc1       $f22, 0x28($sp)
/* 9DCA0 8009D0A0 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 9DCA4 8009D0A4 03E00008 */  jr         $ra
/* 9DCA8 8009D0A8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel rand_vec3
/* 9DCAC 8009D0AC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9DCB0 8009D0B0 F7B60028 */  sdc1       $f22, 0x28($sp)
/* 9DCB4 8009D0B4 3C01800E */  lui        $at, %hi(D_800E2DF8)
/* 9DCB8 8009D0B8 C4362DF8 */  lwc1       $f22, %lo(D_800E2DF8)($at)
/* 9DCBC 8009D0BC F7B40020 */  sdc1       $f20, 0x20($sp)
/* 9DCC0 8009D0C0 3C01800E */  lui        $at, %hi(D_800E2DFC)
/* 9DCC4 8009D0C4 C4342DFC */  lwc1       $f20, %lo(D_800E2DFC)($at)
/* 9DCC8 8009D0C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 9DCCC 8009D0CC 00A08821 */  addu       $s1, $a1, $zero
/* 9DCD0 8009D0D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DCD4 8009D0D4 F7B80030 */  sdc1       $f24, 0x30($sp)
/* 9DCD8 8009D0D8 4486C000 */  mtc1       $a2, $f24
/* 9DCDC 8009D0DC 4405B000 */  mfc1       $a1, $f22
/* 9DCE0 8009D0E0 4406A000 */  mfc1       $a2, $f20
/* 9DCE4 8009D0E4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9DCE8 8009D0E8 0C0273E4 */  jal        rand_float_range
/* 9DCEC 8009D0EC 00808021 */   addu      $s0, $a0, $zero
/* 9DCF0 8009D0F0 4405B000 */  mfc1       $a1, $f22
/* 9DCF4 8009D0F4 4406A000 */  mfc1       $a2, $f20
/* 9DCF8 8009D0F8 02002021 */  addu       $a0, $s0, $zero
/* 9DCFC 8009D0FC 0C0273E4 */  jal        rand_float_range
/* 9DD00 8009D100 E6200000 */   swc1      $f0, ($s1)
/* 9DD04 8009D104 4405B000 */  mfc1       $a1, $f22
/* 9DD08 8009D108 4406A000 */  mfc1       $a2, $f20
/* 9DD0C 8009D10C 02002021 */  addu       $a0, $s0, $zero
/* 9DD10 8009D110 0C0273E4 */  jal        rand_float_range
/* 9DD14 8009D114 E6200004 */   swc1      $f0, 4($s1)
/* 9DD18 8009D118 C6240000 */  lwc1       $f4, ($s1)
/* 9DD1C 8009D11C 44801000 */  mtc1       $zero, $f2
/* 9DD20 8009D120 46022032 */  c.eq.s     $f4, $f2
/* 9DD24 8009D124 00000000 */  nop
/* 9DD28 8009D128 45000004 */  bc1f       .L8009D13C
/* 9DD2C 8009D12C E6200008 */   swc1      $f0, 8($s1)
/* 9DD30 8009D130 3C01800E */  lui        $at, %hi(D_800E2E00)
/* 9DD34 8009D134 C4202E00 */  lwc1       $f0, %lo(D_800E2E00)($at)
/* 9DD38 8009D138 E6200000 */  swc1       $f0, ($s1)
.L8009D13C:
/* 9DD3C 8009D13C 0C02ABBB */  jal        vec3_normalize
/* 9DD40 8009D140 02202021 */   addu      $a0, $s1, $zero
/* 9DD44 8009D144 4405C000 */  mfc1       $a1, $f24
/* 9DD48 8009D148 0C02AD3C */  jal        multiVec3
/* 9DD4C 8009D14C 02202021 */   addu      $a0, $s1, $zero
/* 9DD50 8009D150 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9DD54 8009D154 8FB10014 */  lw         $s1, 0x14($sp)
/* 9DD58 8009D158 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DD5C 8009D15C D7B80030 */  ldc1       $f24, 0x30($sp)
/* 9DD60 8009D160 D7B60028 */  ldc1       $f22, 0x28($sp)
/* 9DD64 8009D164 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 9DD68 8009D168 03E00008 */  jr         $ra
/* 9DD6C 8009D16C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel Ofunc_rand_vec4
/* 9DD70 8009D170 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9DD74 8009D174 F7B60028 */  sdc1       $f22, 0x28($sp)
/* 9DD78 8009D178 3C01800E */  lui        $at, %hi(D_800E2E04)
/* 9DD7C 8009D17C C4362E04 */  lwc1       $f22, %lo(D_800E2E04)($at)
/* 9DD80 8009D180 F7B40020 */  sdc1       $f20, 0x20($sp)
/* 9DD84 8009D184 3C01800E */  lui        $at, %hi(D_800E2E08)
/* 9DD88 8009D188 C4342E08 */  lwc1       $f20, %lo(D_800E2E08)($at)
/* 9DD8C 8009D18C AFB10014 */  sw         $s1, 0x14($sp)
/* 9DD90 8009D190 00A08821 */  addu       $s1, $a1, $zero
/* 9DD94 8009D194 AFB00010 */  sw         $s0, 0x10($sp)
/* 9DD98 8009D198 F7B80030 */  sdc1       $f24, 0x30($sp)
/* 9DD9C 8009D19C 4486C000 */  mtc1       $a2, $f24
/* 9DDA0 8009D1A0 4405B000 */  mfc1       $a1, $f22
/* 9DDA4 8009D1A4 4406A000 */  mfc1       $a2, $f20
/* 9DDA8 8009D1A8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9DDAC 8009D1AC 0C0273E4 */  jal        rand_float_range
/* 9DDB0 8009D1B0 00808021 */   addu      $s0, $a0, $zero
/* 9DDB4 8009D1B4 4405B000 */  mfc1       $a1, $f22
/* 9DDB8 8009D1B8 4406A000 */  mfc1       $a2, $f20
/* 9DDBC 8009D1BC 02002021 */  addu       $a0, $s0, $zero
/* 9DDC0 8009D1C0 0C0273E4 */  jal        rand_float_range
/* 9DDC4 8009D1C4 E6200000 */   swc1      $f0, ($s1)
/* 9DDC8 8009D1C8 4405B000 */  mfc1       $a1, $f22
/* 9DDCC 8009D1CC 4406A000 */  mfc1       $a2, $f20
/* 9DDD0 8009D1D0 02002021 */  addu       $a0, $s0, $zero
/* 9DDD4 8009D1D4 0C0273E4 */  jal        rand_float_range
/* 9DDD8 8009D1D8 E6200004 */   swc1      $f0, 4($s1)
/* 9DDDC 8009D1DC 4405B000 */  mfc1       $a1, $f22
/* 9DDE0 8009D1E0 4406A000 */  mfc1       $a2, $f20
/* 9DDE4 8009D1E4 02002021 */  addu       $a0, $s0, $zero
/* 9DDE8 8009D1E8 0C0273E4 */  jal        rand_float_range
/* 9DDEC 8009D1EC E6200008 */   swc1      $f0, 8($s1)
/* 9DDF0 8009D1F0 C6240000 */  lwc1       $f4, ($s1)
/* 9DDF4 8009D1F4 44801000 */  mtc1       $zero, $f2
/* 9DDF8 8009D1F8 46022032 */  c.eq.s     $f4, $f2
/* 9DDFC 8009D1FC 00000000 */  nop
/* 9DE00 8009D200 45000004 */  bc1f       .L8009D214
/* 9DE04 8009D204 E620000C */   swc1      $f0, 0xc($s1)
/* 9DE08 8009D208 3C01800E */  lui        $at, %hi(D_800E2E0C)
/* 9DE0C 8009D20C C4202E0C */  lwc1       $f0, %lo(D_800E2E0C)($at)
/* 9DE10 8009D210 E6200000 */  swc1       $f0, ($s1)
.L8009D214:
/* 9DE14 8009D214 0C02ABDD */  jal        vec4_normalize
/* 9DE18 8009D218 02202021 */   addu      $a0, $s1, $zero
/* 9DE1C 8009D21C 4405C000 */  mfc1       $a1, $f24
/* 9DE20 8009D220 0C02AD47 */  jal        multiVec4
/* 9DE24 8009D224 02202021 */   addu      $a0, $s1, $zero
/* 9DE28 8009D228 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9DE2C 8009D22C 8FB10014 */  lw         $s1, 0x14($sp)
/* 9DE30 8009D230 8FB00010 */  lw         $s0, 0x10($sp)
/* 9DE34 8009D234 D7B80030 */  ldc1       $f24, 0x30($sp)
/* 9DE38 8009D238 D7B60028 */  ldc1       $f22, 0x28($sp)
/* 9DE3C 8009D23C D7B40020 */  ldc1       $f20, 0x20($sp)
/* 9DE40 8009D240 03E00008 */  jr         $ra
/* 9DE44 8009D244 27BD0038 */   addiu     $sp, $sp, 0x38
/* 9DE48 8009D248 00000000 */  nop
/* 9DE4C 8009D24C 00000000 */  nop
