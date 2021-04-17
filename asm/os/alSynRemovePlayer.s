.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSynNew
/* CE790 800CDB90 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* CE794 800CDB94 AFB5003C */  sw         $s5, 0x3c($sp)
/* CE798 800CDB98 00A0A821 */  addu       $s5, $a1, $zero
/* CE79C 800CDB9C AFBF0048 */  sw         $ra, 0x48($sp)
/* CE7A0 800CDBA0 AFB70044 */  sw         $s7, 0x44($sp)
/* CE7A4 800CDBA4 AFB60040 */  sw         $s6, 0x40($sp)
/* CE7A8 800CDBA8 AFB40038 */  sw         $s4, 0x38($sp)
/* CE7AC 800CDBAC AFB30034 */  sw         $s3, 0x34($sp)
/* CE7B0 800CDBB0 AFB20030 */  sw         $s2, 0x30($sp)
/* CE7B4 800CDBB4 AFB1002C */  sw         $s1, 0x2c($sp)
/* CE7B8 800CDBB8 AFB00028 */  sw         $s0, 0x28($sp)
/* CE7BC 800CDBBC 8EB60014 */  lw         $s6, 0x14($s5)
/* CE7C0 800CDBC0 0080A021 */  addu       $s4, $a0, $zero
/* CE7C4 800CDBC4 AE800000 */  sw         $zero, ($s4)
/* CE7C8 800CDBC8 8EA20004 */  lw         $v0, 4($s5)
/* CE7CC 800CDBCC 00002021 */  addu       $a0, $zero, $zero
/* CE7D0 800CDBD0 AE800020 */  sw         $zero, 0x20($s4)
/* CE7D4 800CDBD4 AE80001C */  sw         $zero, 0x1c($s4)
/* CE7D8 800CDBD8 AE82003C */  sw         $v0, 0x3c($s4)
/* CE7DC 800CDBDC 8EA30018 */  lw         $v1, 0x18($s5)
/* CE7E0 800CDBE0 00002821 */  addu       $a1, $zero, $zero
/* CE7E4 800CDBE4 240200A0 */  addiu      $v0, $zero, 0xa0
/* CE7E8 800CDBE8 AE820048 */  sw         $v0, 0x48($s4)
/* CE7EC 800CDBEC AE830044 */  sw         $v1, 0x44($s4)
/* CE7F0 800CDBF0 8EA20010 */  lw         $v0, 0x10($s5)
/* CE7F4 800CDBF4 24070001 */  addiu      $a3, $zero, 1
/* CE7F8 800CDBF8 02C03021 */  addu       $a2, $s6, $zero
/* CE7FC 800CDBFC AE820024 */  sw         $v0, 0x24($s4)
/* CE800 800CDC00 2402001C */  addiu      $v0, $zero, 0x1c
/* CE804 800CDC04 0C030C44 */  jal        alHeapDBAlloc
/* CE808 800CDC08 AFA20010 */   sw        $v0, 0x10($sp)
/* CE80C 800CDC0C 0040B821 */  addu       $s7, $v0, $zero
/* CE810 800CDC10 0C033E62 */  jal        alSaveNew
/* CE814 800CDC14 02E02021 */   addu      $a0, $s7, $zero
/* CE818 800CDC18 00002021 */  addu       $a0, $zero, $zero
/* CE81C 800CDC1C 00002821 */  addu       $a1, $zero, $zero
/* CE820 800CDC20 02C03021 */  addu       $a2, $s6, $zero
/* CE824 800CDC24 24070001 */  addiu      $a3, $zero, 1
/* CE828 800CDC28 2402004C */  addiu      $v0, $zero, 0x4c
/* CE82C 800CDC2C AE970038 */  sw         $s7, 0x38($s4)
/* CE830 800CDC30 0C030C44 */  jal        alHeapDBAlloc
/* CE834 800CDC34 AFA20010 */   sw        $v0, 0x10($sp)
/* CE838 800CDC38 00002021 */  addu       $a0, $zero, $zero
/* CE83C 800CDC3C AE820034 */  sw         $v0, 0x34($s4)
/* CE840 800CDC40 24020001 */  addiu      $v0, $zero, 1
/* CE844 800CDC44 24100004 */  addiu      $s0, $zero, 4
/* CE848 800CDC48 AE820040 */  sw         $v0, 0x40($s4)
/* CE84C 800CDC4C AFB00010 */  sw         $s0, 0x10($sp)
/* CE850 800CDC50 8EA70004 */  lw         $a3, 4($s5)
/* CE854 800CDC54 00002821 */  addu       $a1, $zero, $zero
/* CE858 800CDC58 0C030C44 */  jal        alHeapDBAlloc
/* CE85C 800CDC5C 02C03021 */   addu      $a2, $s6, $zero
/* CE860 800CDC60 8E840034 */  lw         $a0, 0x34($s4)
/* CE864 800CDC64 8EA60004 */  lw         $a2, 4($s5)
/* CE868 800CDC68 0C033E34 */  jal        alAuxBusNew
/* CE86C 800CDC6C 00402821 */   addu      $a1, $v0, $zero
/* CE870 800CDC70 00002021 */  addu       $a0, $zero, $zero
/* CE874 800CDC74 00002821 */  addu       $a1, $zero, $zero
/* CE878 800CDC78 02C03021 */  addu       $a2, $s6, $zero
/* CE87C 800CDC7C 24070001 */  addiu      $a3, $zero, 1
/* CE880 800CDC80 24020020 */  addiu      $v0, $zero, 0x20
/* CE884 800CDC84 0C030C44 */  jal        alHeapDBAlloc
/* CE888 800CDC88 AFA20010 */   sw        $v0, 0x10($sp)
/* CE88C 800CDC8C 00002021 */  addu       $a0, $zero, $zero
/* CE890 800CDC90 AE820030 */  sw         $v0, 0x30($s4)
/* CE894 800CDC94 AFB00010 */  sw         $s0, 0x10($sp)
/* CE898 800CDC98 8EA70004 */  lw         $a3, 4($s5)
/* CE89C 800CDC9C 00002821 */  addu       $a1, $zero, $zero
/* CE8A0 800CDCA0 0C030C44 */  jal        alHeapDBAlloc
/* CE8A4 800CDCA4 02C03021 */   addu      $a2, $s6, $zero
/* CE8A8 800CDCA8 8E840030 */  lw         $a0, 0x30($s4)
/* CE8AC 800CDCAC 8EA60004 */  lw         $a2, 4($s5)
/* CE8B0 800CDCB0 0C033E4B */  jal        alMainBusNew
/* CE8B4 800CDCB4 00402821 */   addu      $a1, $v0, $zero
/* CE8B8 800CDCB8 92A2001C */  lbu        $v0, 0x1c($s5)
/* CE8BC 800CDCBC 10400007 */  beqz       $v0, .L800CDCDC
/* CE8C0 800CDCC0 02802021 */   addu      $a0, $s4, $zero
/* CE8C4 800CDCC4 00002821 */  addu       $a1, $zero, $zero
/* CE8C8 800CDCC8 02A03021 */  addu       $a2, $s5, $zero
/* CE8CC 800CDCCC 0C0345CC */  jal        alSynAllocFX
/* CE8D0 800CDCD0 02C03821 */   addu      $a3, $s6, $zero
/* CE8D4 800CDCD4 0803373C */  j          .L800CDCF0
/* CE8D8 800CDCD8 00002021 */   addu      $a0, $zero, $zero
.L800CDCDC:
/* CE8DC 800CDCDC 8E840030 */  lw         $a0, 0x30($s4)
/* CE8E0 800CDCE0 8E860034 */  lw         $a2, 0x34($s4)
/* CE8E4 800CDCE4 0C0341F8 */  jal        alMainBusParam
/* CE8E8 800CDCE8 24050002 */   addiu     $a1, $zero, 2
/* CE8EC 800CDCEC 00002021 */  addu       $a0, $zero, $zero
.L800CDCF0:
/* CE8F0 800CDCF0 240200DC */  addiu      $v0, $zero, 0xdc
/* CE8F4 800CDCF4 AE800004 */  sw         $zero, 4($s4)
/* CE8F8 800CDCF8 AE800008 */  sw         $zero, 8($s4)
/* CE8FC 800CDCFC AE800014 */  sw         $zero, 0x14($s4)
/* CE900 800CDD00 AE800018 */  sw         $zero, 0x18($s4)
/* CE904 800CDD04 AE80000C */  sw         $zero, 0xc($s4)
/* CE908 800CDD08 AE800010 */  sw         $zero, 0x10($s4)
/* CE90C 800CDD0C AFA20010 */  sw         $v0, 0x10($sp)
/* CE910 800CDD10 8EA70004 */  lw         $a3, 4($s5)
/* CE914 800CDD14 00002821 */  addu       $a1, $zero, $zero
/* CE918 800CDD18 0C030C44 */  jal        alHeapDBAlloc
/* CE91C 800CDD1C 02C03021 */   addu      $a2, $s6, $zero
/* CE920 800CDD20 8EA30004 */  lw         $v1, 4($s5)
/* CE924 800CDD24 18600029 */  blez       $v1, .L800CDDCC
/* CE928 800CDD28 00009821 */   addu      $s3, $zero, $zero
/* CE92C 800CDD2C 00409021 */  addu       $s2, $v0, $zero
.L800CDD30:
/* CE930 800CDD30 02402021 */  addu       $a0, $s2, $zero
/* CE934 800CDD34 0C033367 */  jal        alLink
/* CE938 800CDD38 26850004 */   addiu     $a1, $s4, 4
/* CE93C 800CDD3C AE400008 */  sw         $zero, 8($s2)
/* CE940 800CDD40 8E850024 */  lw         $a1, 0x24($s4)
/* CE944 800CDD44 26500010 */  addiu      $s0, $s2, 0x10
/* CE948 800CDD48 02002021 */  addu       $a0, $s0, $zero
/* CE94C 800CDD4C 0C033DE5 */  jal        alLoadNew
/* CE950 800CDD50 02C03021 */   addu      $a2, $s6, $zero
/* CE954 800CDD54 02002021 */  addu       $a0, $s0, $zero
/* CE958 800CDD58 24050001 */  addiu      $a1, $zero, 1
/* CE95C 800CDD5C 0C033B3B */  jal        alLoadParam
/* CE960 800CDD60 00003021 */   addu      $a2, $zero, $zero
/* CE964 800CDD64 26510058 */  addiu      $s1, $s2, 0x58
/* CE968 800CDD68 02202021 */  addu       $a0, $s1, $zero
/* CE96C 800CDD6C 0C033E11 */  jal        alResampleNew
/* CE970 800CDD70 02C02821 */   addu      $a1, $s6, $zero
/* CE974 800CDD74 02202021 */  addu       $a0, $s1, $zero
/* CE978 800CDD78 24050001 */  addiu      $a1, $zero, 1
/* CE97C 800CDD7C 0C03427F */  jal        alResampleParam
/* CE980 800CDD80 02003021 */   addu      $a2, $s0, $zero
/* CE984 800CDD84 2650008C */  addiu      $s0, $s2, 0x8c
/* CE988 800CDD88 02002021 */  addu       $a0, $s0, $zero
/* CE98C 800CDD8C 0C033DB7 */  jal        alEnvmixerNew
/* CE990 800CDD90 02C02821 */   addu      $a1, $s6, $zero
/* CE994 800CDD94 02002021 */  addu       $a0, $s0, $zero
/* CE998 800CDD98 24050001 */  addiu      $a1, $zero, 1
/* CE99C 800CDD9C 0C033FB4 */  jal        alEnvmixerParam
/* CE9A0 800CDDA0 02203021 */   addu      $a2, $s1, $zero
/* CE9A4 800CDDA4 8E840034 */  lw         $a0, 0x34($s4)
/* CE9A8 800CDDA8 24050002 */  addiu      $a1, $zero, 2
/* CE9AC 800CDDAC 0C033C4B */  jal        alAuxBusParam
/* CE9B0 800CDDB0 02003021 */   addu      $a2, $s0, $zero
/* CE9B4 800CDDB4 AE50000C */  sw         $s0, 0xc($s2)
/* CE9B8 800CDDB8 8EA20004 */  lw         $v0, 4($s5)
/* CE9BC 800CDDBC 26730001 */  addiu      $s3, $s3, 1
/* CE9C0 800CDDC0 0262102A */  slt        $v0, $s3, $v0
/* CE9C4 800CDDC4 1440FFDA */  bnez       $v0, .L800CDD30
/* CE9C8 800CDDC8 265200DC */   addiu     $s2, $s2, 0xdc
.L800CDDCC:
/* CE9CC 800CDDCC 8E860030 */  lw         $a2, 0x30($s4)
/* CE9D0 800CDDD0 02E02021 */  addu       $a0, $s7, $zero
/* CE9D4 800CDDD4 0C0345C2 */  jal        alSaveParam
/* CE9D8 800CDDD8 24050001 */   addiu     $a1, $zero, 1
/* CE9DC 800CDDDC 00002021 */  addu       $a0, $zero, $zero
/* CE9E0 800CDDE0 2402001C */  addiu      $v0, $zero, 0x1c
/* CE9E4 800CDDE4 AFA20010 */  sw         $v0, 0x10($sp)
/* CE9E8 800CDDE8 8EA70008 */  lw         $a3, 8($s5)
/* CE9EC 800CDDEC 00002821 */  addu       $a1, $zero, $zero
/* CE9F0 800CDDF0 0C030C44 */  jal        alHeapDBAlloc
/* CE9F4 800CDDF4 02C03021 */   addu      $a2, $s6, $zero
/* CE9F8 800CDDF8 AE80002C */  sw         $zero, 0x2c($s4)
/* CE9FC 800CDDFC 8EA30008 */  lw         $v1, 8($s5)
/* CEA00 800CDE00 1860000A */  blez       $v1, .L800CDE2C
/* CEA04 800CDE04 00009821 */   addu      $s3, $zero, $zero
/* CEA08 800CDE08 00401821 */  addu       $v1, $v0, $zero
.L800CDE0C:
/* CEA0C 800CDE0C 8E82002C */  lw         $v0, 0x2c($s4)
/* CEA10 800CDE10 AC620000 */  sw         $v0, ($v1)
/* CEA14 800CDE14 AE83002C */  sw         $v1, 0x2c($s4)
/* CEA18 800CDE18 8EA20008 */  lw         $v0, 8($s5)
/* CEA1C 800CDE1C 26730001 */  addiu      $s3, $s3, 1
/* CEA20 800CDE20 0262102A */  slt        $v0, $s3, $v0
/* CEA24 800CDE24 1440FFF9 */  bnez       $v0, .L800CDE0C
/* CEA28 800CDE28 2463001C */   addiu     $v1, $v1, 0x1c
.L800CDE2C:
/* CEA2C 800CDE2C AE960028 */  sw         $s6, 0x28($s4)
/* CEA30 800CDE30 8FBF0048 */  lw         $ra, 0x48($sp)
/* CEA34 800CDE34 8FB70044 */  lw         $s7, 0x44($sp)
/* CEA38 800CDE38 8FB60040 */  lw         $s6, 0x40($sp)
/* CEA3C 800CDE3C 8FB5003C */  lw         $s5, 0x3c($sp)
/* CEA40 800CDE40 8FB40038 */  lw         $s4, 0x38($sp)
/* CEA44 800CDE44 8FB30034 */  lw         $s3, 0x34($sp)
/* CEA48 800CDE48 8FB20030 */  lw         $s2, 0x30($sp)
/* CEA4C 800CDE4C 8FB1002C */  lw         $s1, 0x2c($sp)
/* CEA50 800CDE50 8FB00028 */  lw         $s0, 0x28($sp)
/* CEA54 800CDE54 03E00008 */  jr         $ra
/* CEA58 800CDE58 27BD0050 */   addiu     $sp, $sp, 0x50

glabel alAudioFrame
/* CEA5C 800CDE5C 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* CEA60 800CDE60 AFB20028 */  sw         $s2, 0x28($sp)
/* CEA64 800CDE64 3C12800F */  lui        $s2, %hi(alGlobals)
/* CEA68 800CDE68 8E5239F0 */  lw         $s2, %lo(alGlobals)($s2)
/* CEA6C 800CDE6C AFB7003C */  sw         $s7, 0x3c($sp)
/* CEA70 800CDE70 0080B821 */  addu       $s7, $a0, $zero
/* CEA74 800CDE74 AFBE0040 */  sw         $fp, 0x40($sp)
/* CEA78 800CDE78 00A0F021 */  addu       $fp, $a1, $zero
/* CEA7C 800CDE7C AFB3002C */  sw         $s3, 0x2c($sp)
/* CEA80 800CDE80 00E09821 */  addu       $s3, $a3, $zero
/* CEA84 800CDE84 AFBF0044 */  sw         $ra, 0x44($sp)
/* CEA88 800CDE88 AFB60038 */  sw         $s6, 0x38($sp)
/* CEA8C 800CDE8C AFB50034 */  sw         $s5, 0x34($sp)
/* CEA90 800CDE90 AFB40030 */  sw         $s4, 0x30($sp)
/* CEA94 800CDE94 AFB10024 */  sw         $s1, 0x24($sp)
/* CEA98 800CDE98 AFB00020 */  sw         $s0, 0x20($sp)
/* CEA9C 800CDE9C 8E420000 */  lw         $v0, ($s2)
/* CEAA0 800CDEA0 02E0A021 */  addu       $s4, $s7, $zero
/* CEAA4 800CDEA4 00C0A821 */  addu       $s5, $a2, $zero
/* CEAA8 800CDEA8 14400003 */  bnez       $v0, .L800CDEB8
/* CEAAC 800CDEAC A7A0001C */   sh        $zero, 0x1c($sp)
/* CEAB0 800CDEB0 080337F6 */  j          .L800CDFD8
/* CEAB4 800CDEB4 AFC00000 */   sw        $zero, ($fp)
.L800CDEB8:
/* CEAB8 800CDEB8 02402021 */  addu       $a0, $s2, $zero
/* CEABC 800CDEBC 0C03385E */  jal        __nextSampleTime
/* CEAC0 800CDEC0 27A50018 */   addiu     $a1, $sp, 0x18
/* CEAC4 800CDEC4 8E430020 */  lw         $v1, 0x20($s2)
/* CEAC8 800CDEC8 AE42001C */  sw         $v0, 0x1c($s2)
/* CEACC 800CDECC 00431023 */  subu       $v0, $v0, $v1
/* CEAD0 800CDED0 0053102A */  slt        $v0, $v0, $s3
/* CEAD4 800CDED4 10400019 */  beqz       $v0, .L800CDF3C
/* CEAD8 800CDED8 00000000 */   nop
/* CEADC 800CDEDC 2410FFF0 */  addiu      $s0, $zero, -0x10
.L800CDEE0:
/* CEAE0 800CDEE0 8E42001C */  lw         $v0, 0x1c($s2)
/* CEAE4 800CDEE4 8FA40018 */  lw         $a0, 0x18($sp)
/* CEAE8 800CDEE8 00501024 */  and        $v0, $v0, $s0
/* CEAEC 800CDEEC AE42001C */  sw         $v0, 0x1c($s2)
/* CEAF0 800CDEF0 8C820008 */  lw         $v0, 8($a0)
/* CEAF4 800CDEF4 0040F809 */  jalr       $v0
/* CEAF8 800CDEF8 00000000 */   nop
/* CEAFC 800CDEFC 02402021 */  addu       $a0, $s2, $zero
/* CEB00 800CDF00 0C033839 */  jal        _timeToSamplesNoRound
/* CEB04 800CDF04 00402821 */   addu      $a1, $v0, $zero
/* CEB08 800CDF08 8FA60018 */  lw         $a2, 0x18($sp)
/* CEB0C 800CDF0C 8CC30010 */  lw         $v1, 0x10($a2)
/* CEB10 800CDF10 02402021 */  addu       $a0, $s2, $zero
/* CEB14 800CDF14 27A50018 */  addiu      $a1, $sp, 0x18
/* CEB18 800CDF18 00621821 */  addu       $v1, $v1, $v0
/* CEB1C 800CDF1C 0C03385E */  jal        __nextSampleTime
/* CEB20 800CDF20 ACC30010 */   sw        $v1, 0x10($a2)
/* CEB24 800CDF24 8E430020 */  lw         $v1, 0x20($s2)
/* CEB28 800CDF28 AE42001C */  sw         $v0, 0x1c($s2)
/* CEB2C 800CDF2C 00431023 */  subu       $v0, $v0, $v1
/* CEB30 800CDF30 0053102A */  slt        $v0, $v0, $s3
/* CEB34 800CDF34 1440FFEA */  bnez       $v0, .L800CDEE0
/* CEB38 800CDF38 00000000 */   nop
.L800CDF3C:
/* CEB3C 800CDF3C 8E42001C */  lw         $v0, 0x1c($s2)
/* CEB40 800CDF40 2403FFF0 */  addiu      $v1, $zero, -0x10
/* CEB44 800CDF44 00431024 */  and        $v0, $v0, $v1
/* CEB48 800CDF48 1A60001E */  blez       $s3, .L800CDFC4
/* CEB4C 800CDF4C AE42001C */   sw        $v0, 0x1c($s2)
/* CEB50 800CDF50 3C160700 */  lui        $s6, 0x700
.L800CDF54:
/* CEB54 800CDF54 8E510048 */  lw         $s1, 0x48($s2)
/* CEB58 800CDF58 0271102A */  slt        $v0, $s3, $s1
/* CEB5C 800CDF5C 54400001 */  bnel       $v0, $zero, .L800CDF64
/* CEB60 800CDF60 02608821 */   addu      $s1, $s3, $zero
.L800CDF64:
/* CEB64 800CDF64 AE960000 */  sw         $s6, ($s4)
/* CEB68 800CDF68 AE800004 */  sw         $zero, 4($s4)
/* CEB6C 800CDF6C 8E500038 */  lw         $s0, 0x38($s2)
/* CEB70 800CDF70 24050006 */  addiu      $a1, $zero, 6
/* CEB74 800CDF74 02A03021 */  addu       $a2, $s5, $zero
/* CEB78 800CDF78 8E020008 */  lw         $v0, 8($s0)
/* CEB7C 800CDF7C 02719823 */  subu       $s3, $s3, $s1
/* CEB80 800CDF80 0040F809 */  jalr       $v0
/* CEB84 800CDF84 02002021 */   addu      $a0, $s0, $zero
/* CEB88 800CDF88 02002021 */  addu       $a0, $s0, $zero
/* CEB8C 800CDF8C 26820008 */  addiu      $v0, $s4, 8
/* CEB90 800CDF90 AFA20010 */  sw         $v0, 0x10($sp)
/* CEB94 800CDF94 8C820004 */  lw         $v0, 4($a0)
/* CEB98 800CDF98 8E470020 */  lw         $a3, 0x20($s2)
/* CEB9C 800CDF9C 27A5001C */  addiu      $a1, $sp, 0x1c
/* CEBA0 800CDFA0 0040F809 */  jalr       $v0
/* CEBA4 800CDFA4 02203021 */   addu      $a2, $s1, $zero
/* CEBA8 800CDFA8 0040A021 */  addu       $s4, $v0, $zero
/* CEBAC 800CDFAC 8E430020 */  lw         $v1, 0x20($s2)
/* CEBB0 800CDFB0 00111080 */  sll        $v0, $s1, 2
/* CEBB4 800CDFB4 02A2A821 */  addu       $s5, $s5, $v0
/* CEBB8 800CDFB8 00711821 */  addu       $v1, $v1, $s1
/* CEBBC 800CDFBC 1E60FFE5 */  bgtz       $s3, .L800CDF54
/* CEBC0 800CDFC0 AE430020 */   sw        $v1, 0x20($s2)
.L800CDFC4:
/* CEBC4 800CDFC4 02971023 */  subu       $v0, $s4, $s7
/* CEBC8 800CDFC8 000210C3 */  sra        $v0, $v0, 3
/* CEBCC 800CDFCC AFC20000 */  sw         $v0, ($fp)
/* CEBD0 800CDFD0 0C033814 */  jal        _collectPVoices
/* CEBD4 800CDFD4 02402021 */   addu      $a0, $s2, $zero
.L800CDFD8:
/* CEBD8 800CDFD8 02801021 */  addu       $v0, $s4, $zero
/* CEBDC 800CDFDC 8FBF0044 */  lw         $ra, 0x44($sp)
/* CEBE0 800CDFE0 8FBE0040 */  lw         $fp, 0x40($sp)
/* CEBE4 800CDFE4 8FB7003C */  lw         $s7, 0x3c($sp)
/* CEBE8 800CDFE8 8FB60038 */  lw         $s6, 0x38($sp)
/* CEBEC 800CDFEC 8FB50034 */  lw         $s5, 0x34($sp)
/* CEBF0 800CDFF0 8FB40030 */  lw         $s4, 0x30($sp)
/* CEBF4 800CDFF4 8FB3002C */  lw         $s3, 0x2c($sp)
/* CEBF8 800CDFF8 8FB20028 */  lw         $s2, 0x28($sp)
/* CEBFC 800CDFFC 8FB10024 */  lw         $s1, 0x24($sp)
/* CEC00 800CE000 8FB00020 */  lw         $s0, 0x20($sp)
/* CEC04 800CE004 03E00008 */  jr         $ra
/* CEC08 800CE008 27BD0048 */   addiu     $sp, $sp, 0x48

glabel __allocParam
/* CEC0C 800CE00C 3C04800F */  lui        $a0, %hi(alGlobals)
/* CEC10 800CE010 8C8439F0 */  lw         $a0, %lo(alGlobals)($a0)
/* CEC14 800CE014 8C82002C */  lw         $v0, 0x2c($a0)
/* CEC18 800CE018 10400005 */  beqz       $v0, .L800CE030
/* CEC1C 800CE01C 00001821 */   addu      $v1, $zero, $zero
/* CEC20 800CE020 00401821 */  addu       $v1, $v0, $zero
/* CEC24 800CE024 8C620000 */  lw         $v0, ($v1)
/* CEC28 800CE028 AC82002C */  sw         $v0, 0x2c($a0)
/* CEC2C 800CE02C AC600000 */  sw         $zero, ($v1)
.L800CE030:
/* CEC30 800CE030 03E00008 */  jr         $ra
/* CEC34 800CE034 00601021 */   addu      $v0, $v1, $zero

glabel __freeParam
/* CEC38 800CE038 3C03800F */  lui        $v1, %hi(alGlobals)
/* CEC3C 800CE03C 8C6339F0 */  lw         $v1, %lo(alGlobals)($v1)
/* CEC40 800CE040 8C62002C */  lw         $v0, 0x2c($v1)
/* CEC44 800CE044 AC820000 */  sw         $v0, ($a0)
/* CEC48 800CE048 03E00008 */  jr         $ra
/* CEC4C 800CE04C AC64002C */   sw        $a0, 0x2c($v1)

glabel _collectPVoices
/* CEC50 800CE050 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CEC54 800CE054 AFB10014 */  sw         $s1, 0x14($sp)
/* CEC58 800CE058 00808821 */  addu       $s1, $a0, $zero
/* CEC5C 800CE05C AFBF0018 */  sw         $ra, 0x18($sp)
/* CEC60 800CE060 AFB00010 */  sw         $s0, 0x10($sp)
/* CEC64 800CE064 8E300014 */  lw         $s0, 0x14($s1)
/* CEC68 800CE068 12000009 */  beqz       $s0, .L800CE090
/* CEC6C 800CE06C 00000000 */   nop
.L800CE070:
/* CEC70 800CE070 0C03336F */  jal        alUnlink
/* CEC74 800CE074 02002021 */   addu      $a0, $s0, $zero
/* CEC78 800CE078 02002021 */  addu       $a0, $s0, $zero
/* CEC7C 800CE07C 0C033367 */  jal        alLink
/* CEC80 800CE080 26250004 */   addiu     $a1, $s1, 4
/* CEC84 800CE084 8E300014 */  lw         $s0, 0x14($s1)
/* CEC88 800CE088 1600FFF9 */  bnez       $s0, .L800CE070
/* CEC8C 800CE08C 00000000 */   nop
.L800CE090:
/* CEC90 800CE090 8FBF0018 */  lw         $ra, 0x18($sp)
/* CEC94 800CE094 8FB10014 */  lw         $s1, 0x14($sp)
/* CEC98 800CE098 8FB00010 */  lw         $s0, 0x10($sp)
/* CEC9C 800CE09C 03E00008 */  jr         $ra
/* CECA0 800CE0A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel _freePVoice
/* CECA4 800CE0A4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CECA8 800CE0A8 AFB10014 */  sw         $s1, 0x14($sp)
/* CECAC 800CE0AC 00808821 */  addu       $s1, $a0, $zero
/* CECB0 800CE0B0 AFB00010 */  sw         $s0, 0x10($sp)
/* CECB4 800CE0B4 00A08021 */  addu       $s0, $a1, $zero
/* CECB8 800CE0B8 AFBF0018 */  sw         $ra, 0x18($sp)
/* CECBC 800CE0BC 0C03336F */  jal        alUnlink
/* CECC0 800CE0C0 02002021 */   addu      $a0, $s0, $zero
/* CECC4 800CE0C4 02002021 */  addu       $a0, $s0, $zero
/* CECC8 800CE0C8 0C033367 */  jal        alLink
/* CECCC 800CE0CC 26250014 */   addiu     $a1, $s1, 0x14
/* CECD0 800CE0D0 8FBF0018 */  lw         $ra, 0x18($sp)
/* CECD4 800CE0D4 8FB10014 */  lw         $s1, 0x14($sp)
/* CECD8 800CE0D8 8FB00010 */  lw         $s0, 0x10($sp)
/* CECDC 800CE0DC 03E00008 */  jr         $ra
/* CECE0 800CE0E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel _timeToSamplesNoRound
/* CECE4 800CE0E4 44850000 */  mtc1       $a1, $f0
/* CECE8 800CE0E8 00000000 */  nop
/* CECEC 800CE0EC 46800020 */  cvt.s.w    $f0, $f0
/* CECF0 800CE0F0 C4820044 */  lwc1       $f2, 0x44($a0)
/* CECF4 800CE0F4 468010A0 */  cvt.s.w    $f2, $f2
/* CECF8 800CE0F8 46020002 */  mul.s      $f0, $f0, $f2
/* CECFC 800CE0FC 3C01800E */  lui        $at, %hi(synthesizer_rodata_0000)
/* CED00 800CE100 D42255E0 */  ldc1       $f2, %lo(synthesizer_rodata_0000)($at)
/* CED04 800CE104 46000021 */  cvt.d.s    $f0, $f0
/* CED08 800CE108 46220003 */  div.d      $f0, $f0, $f2
/* CED0C 800CE10C 3C01800E */  lui        $at, %hi(synthesizer_rodata_0008)
/* CED10 800CE110 D42255E8 */  ldc1       $f2, %lo(synthesizer_rodata_0008)($at)
/* CED14 800CE114 46220000 */  add.d      $f0, $f0, $f2
/* CED18 800CE118 46200020 */  cvt.s.d    $f0, $f0
/* CED1C 800CE11C 4600008D */  trunc.w.s  $f2, $f0
/* CED20 800CE120 44021000 */  mfc1       $v0, $f2
/* CED24 800CE124 03E00008 */  jr         $ra
/* CED28 800CE128 00000000 */   nop

glabel _timeToSamples
/* CED2C 800CE12C 44850000 */  mtc1       $a1, $f0
/* CED30 800CE130 00000000 */  nop
/* CED34 800CE134 46800020 */  cvt.s.w    $f0, $f0
/* CED38 800CE138 C4820044 */  lwc1       $f2, 0x44($a0)
/* CED3C 800CE13C 468010A0 */  cvt.s.w    $f2, $f2
/* CED40 800CE140 46020002 */  mul.s      $f0, $f0, $f2
/* CED44 800CE144 3C01800E */  lui        $at, %hi(synthesizer_rodata_0010)
/* CED48 800CE148 D42255F0 */  ldc1       $f2, %lo(synthesizer_rodata_0010)($at)
/* CED4C 800CE14C 46000021 */  cvt.d.s    $f0, $f0
/* CED50 800CE150 46220003 */  div.d      $f0, $f0, $f2
/* CED54 800CE154 3C01800E */  lui        $at, %hi(synthesizer_rodata_0018)
/* CED58 800CE158 D42255F8 */  ldc1       $f2, %lo(synthesizer_rodata_0018)($at)
/* CED5C 800CE15C 46220000 */  add.d      $f0, $f0, $f2
/* CED60 800CE160 46200020 */  cvt.s.d    $f0, $f0
/* CED64 800CE164 4600008D */  trunc.w.s  $f2, $f0
/* CED68 800CE168 44031000 */  mfc1       $v1, $f2
/* CED6C 800CE16C 2402FFF0 */  addiu      $v0, $zero, -0x10
/* CED70 800CE170 03E00008 */  jr         $ra
/* CED74 800CE174 00621024 */   and       $v0, $v1, $v0

glabel __nextSampleTime
/* CED78 800CE178 ACA00000 */  sw         $zero, ($a1)
/* CED7C 800CE17C 8C860000 */  lw         $a2, ($a0)
/* CED80 800CE180 3C077FFF */  lui        $a3, 0x7fff
/* CED84 800CE184 10C0000E */  beqz       $a2, .L800CE1C0
/* CED88 800CE188 34E7FFFF */   ori       $a3, $a3, 0xffff
.L800CE18C:
/* CED8C 800CE18C 8CC20010 */  lw         $v0, 0x10($a2)
/* CED90 800CE190 8C830020 */  lw         $v1, 0x20($a0)
/* CED94 800CE194 00431023 */  subu       $v0, $v0, $v1
/* CED98 800CE198 0047102A */  slt        $v0, $v0, $a3
/* CED9C 800CE19C 10400005 */  beqz       $v0, .L800CE1B4
/* CEDA0 800CE1A0 00000000 */   nop
/* CEDA4 800CE1A4 ACA60000 */  sw         $a2, ($a1)
/* CEDA8 800CE1A8 8CC30010 */  lw         $v1, 0x10($a2)
/* CEDAC 800CE1AC 8C820020 */  lw         $v0, 0x20($a0)
/* CEDB0 800CE1B0 00623823 */  subu       $a3, $v1, $v0
.L800CE1B4:
/* CEDB4 800CE1B4 8CC60000 */  lw         $a2, ($a2)
/* CEDB8 800CE1B8 14C0FFF4 */  bnez       $a2, .L800CE18C
/* CEDBC 800CE1BC 00000000 */   nop
.L800CE1C0:
/* CEDC0 800CE1C0 8CA20000 */  lw         $v0, ($a1)
/* CEDC4 800CE1C4 03E00008 */  jr         $ra
/* CEDC8 800CE1C8 8C420010 */   lw        $v0, 0x10($v0)
/* CEDCC 800CE1CC 00000000 */  nop
