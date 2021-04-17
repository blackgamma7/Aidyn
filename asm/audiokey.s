.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel load_audiokey
/* 5CA30 8005BE30 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5CA34 8005BE34 AFB20020 */  sw         $s2, 0x20($sp)
/* 5CA38 8005BE38 3C12B1FF */  lui        $s2, %hi(common_string_array)
/* 5CA3C 8005BE3C 26526700 */  addiu      $s2, $s2, %lo(common_string_array)
/* 5CA40 8005BE40 AFB30024 */  sw         $s3, 0x24($sp)
/* 5CA44 8005BE44 3C13B1FF */  lui        $s3, %hi(audiokey_rom)
/* 5CA48 8005BE48 26735300 */  addiu      $s3, $s3, %lo(audiokey_rom)
/* 5CA4C 8005BE4C 02539023 */  subu       $s2, $s2, $s3
/* 5CA50 8005BE50 02402021 */  addu       $a0, $s2, $zero
/* 5CA54 8005BE54 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5CA58 8005BE58 3C11800E */  lui        $s1, %hi(D_800DF020)
/* 5CA5C 8005BE5C 2631F020 */  addiu      $s1, $s1, %lo(D_800DF020)
/* 5CA60 8005BE60 02202821 */  addu       $a1, $s1, $zero
/* 5CA64 8005BE64 24060046 */  addiu      $a2, $zero, 0x46
/* 5CA68 8005BE68 AFBF0028 */  sw         $ra, 0x28($sp)
/* 5CA6C 8005BE6C 0C025F9C */  jal        Malloc
/* 5CA70 8005BE70 AFB00018 */   sw        $s0, 0x18($sp)
/* 5CA74 8005BE74 00408021 */  addu       $s0, $v0, $zero
/* 5CA78 8005BE78 02002021 */  addu       $a0, $s0, $zero
/* 5CA7C 8005BE7C 02602821 */  addu       $a1, $s3, $zero
/* 5CA80 8005BE80 02403021 */  addu       $a2, $s2, $zero
/* 5CA84 8005BE84 24020048 */  addiu      $v0, $zero, 0x48
/* 5CA88 8005BE88 24070001 */  addiu      $a3, $zero, 1
/* 5CA8C 8005BE8C AFB10010 */  sw         $s1, 0x10($sp)
/* 5CA90 8005BE90 0C027269 */  jal        RomCopy
/* 5CA94 8005BE94 AFA20014 */   sw        $v0, 0x14($sp)
/* 5CA98 8005BE98 8E050000 */  lw         $a1, ($s0)
/* 5CA9C 8005BE9C 0C029AD6 */  jal        set_pointer_offset
/* 5CAA0 8005BEA0 02002021 */   addu      $a0, $s0, $zero
/* 5CAA4 8005BEA4 8E050004 */  lw         $a1, 4($s0)
/* 5CAA8 8005BEA8 02002021 */  addu       $a0, $s0, $zero
/* 5CAAC 8005BEAC 0C029AD6 */  jal        set_pointer_offset
/* 5CAB0 8005BEB0 AE020000 */   sw        $v0, ($s0)
/* 5CAB4 8005BEB4 8E050008 */  lw         $a1, 8($s0)
/* 5CAB8 8005BEB8 02002021 */  addu       $a0, $s0, $zero
/* 5CABC 8005BEBC 0C029AD6 */  jal        set_pointer_offset
/* 5CAC0 8005BEC0 AE020004 */   sw        $v0, 4($s0)
/* 5CAC4 8005BEC4 AE020008 */  sw         $v0, 8($s0)
/* 5CAC8 8005BEC8 02001021 */  addu       $v0, $s0, $zero
/* 5CACC 8005BECC 8FBF0028 */  lw         $ra, 0x28($sp)
/* 5CAD0 8005BED0 8FB30024 */  lw         $s3, 0x24($sp)
/* 5CAD4 8005BED4 8FB20020 */  lw         $s2, 0x20($sp)
/* 5CAD8 8005BED8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5CADC 8005BEDC 8FB00018 */  lw         $s0, 0x18($sp)
/* 5CAE0 8005BEE0 03E00008 */  jr         $ra
/* 5CAE4 8005BEE4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel Audiokey_free
/* 5CAE8 8005BEE8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5CAEC 8005BEEC 10800005 */  beqz       $a0, .L8005BF04
/* 5CAF0 8005BEF0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 5CAF4 8005BEF4 3C05800E */  lui        $a1, %hi(D_800DF020)
/* 5CAF8 8005BEF8 24A5F020 */  addiu      $a1, $a1, %lo(D_800DF020)
/* 5CAFC 8005BEFC 0C02600C */  jal        Free
/* 5CB00 8005BF00 2406005C */   addiu     $a2, $zero, 0x5c
.L8005BF04:
/* 5CB04 8005BF04 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5CB08 8005BF08 03E00008 */  jr         $ra
/* 5CB0C 8005BF0C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005BF10
/* 5CB10 8005BF10 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 5CB14 8005BF14 3C02800F */  lui        $v0, %hi(SFX_vol)
/* 5CB18 8005BF18 AFB10024 */  sw         $s1, 0x24($sp)
/* 5CB1C 8005BF1C 93B1005F */  lbu        $s1, 0x5f($sp)
/* 5CB20 8005BF20 C44288FC */  lwc1       $f2, %lo(SFX_vol)($v0)
/* 5CB24 8005BF24 AFB50034 */  sw         $s5, 0x34($sp)
/* 5CB28 8005BF28 97B5005A */  lhu        $s5, 0x5a($sp)
/* 5CB2C 8005BF2C AFB40030 */  sw         $s4, 0x30($sp)
/* 5CB30 8005BF30 93B40063 */  lbu        $s4, 0x63($sp)
/* 5CB34 8005BF34 AFB20028 */  sw         $s2, 0x28($sp)
/* 5CB38 8005BF38 93B2006B */  lbu        $s2, 0x6b($sp)
/* 5CB3C 8005BF3C AFB3002C */  sw         $s3, 0x2c($sp)
/* 5CB40 8005BF40 97B3006E */  lhu        $s3, 0x6e($sp)
/* 5CB44 8005BF44 AFB7003C */  sw         $s7, 0x3c($sp)
/* 5CB48 8005BF48 30D7FFFF */  andi       $s7, $a2, 0xffff
/* 5CB4C 8005BF4C AFB60038 */  sw         $s6, 0x38($sp)
/* 5CB50 8005BF50 44910000 */  mtc1       $s1, $f0
/* 5CB54 8005BF54 46800020 */  cvt.s.w    $f0, $f0
/* 5CB58 8005BF58 46020002 */  mul.s      $f0, $f0, $f2
/* 5CB5C 8005BF5C 3C01800E */  lui        $at, %hi(D_800DF034)
/* 5CB60 8005BF60 C422F034 */  lwc1       $f2, %lo(D_800DF034)($at)
/* 5CB64 8005BF64 30F6FFFF */  andi       $s6, $a3, 0xffff
/* 5CB68 8005BF68 AFBF0044 */  sw         $ra, 0x44($sp)
/* 5CB6C 8005BF6C AFBE0040 */  sw         $fp, 0x40($sp)
/* 5CB70 8005BF70 AFB00020 */  sw         $s0, 0x20($sp)
/* 5CB74 8005BF74 AFA40048 */  sw         $a0, 0x48($sp)
/* 5CB78 8005BF78 4600103E */  c.le.s     $f2, $f0
/* 5CB7C 8005BF7C 00000000 */  nop
/* 5CB80 8005BF80 45010005 */  bc1t       .L8005BF98
/* 5CB84 8005BF84 AFA5004C */   sw        $a1, 0x4c($sp)
/* 5CB88 8005BF88 4600008D */  trunc.w.s  $f2, $f0
/* 5CB8C 8005BF8C 44071000 */  mfc1       $a3, $f2
/* 5CB90 8005BF90 08016FEC */  j          .L8005BFB0
/* 5CB94 8005BF94 30F100FF */   andi      $s1, $a3, 0xff
.L8005BF98:
/* 5CB98 8005BF98 46020001 */  sub.s      $f0, $f0, $f2
/* 5CB9C 8005BF9C 4600008D */  trunc.w.s  $f2, $f0
/* 5CBA0 8005BFA0 44071000 */  mfc1       $a3, $f2
/* 5CBA4 8005BFA4 3C028000 */  lui        $v0, 0x8000
/* 5CBA8 8005BFA8 00E23825 */  or         $a3, $a3, $v0
/* 5CBAC 8005BFAC 30F100FF */  andi       $s1, $a3, 0xff
.L8005BFB0:
/* 5CBB0 8005BFB0 12200044 */  beqz       $s1, .L8005C0C4
/* 5CBB4 8005BFB4 8FBF0044 */   lw        $ra, 0x44($sp)
/* 5CBB8 8005BFB8 12400042 */  beqz       $s2, .L8005C0C4
/* 5CBBC 8005BFBC 00008021 */   addu      $s0, $zero, $zero
/* 5CBC0 8005BFC0 3C1E8000 */  lui        $fp, 0x8000
/* 5CBC4 8005BFC4 8FA30064 */  lw         $v1, 0x64($sp)
.L8005BFC8:
/* 5CBC8 8005BFC8 00701021 */  addu       $v0, $v1, $s0
/* 5CBCC 8005BFCC 90430000 */  lbu        $v1, ($v0)
/* 5CBD0 8005BFD0 8FA2004C */  lw         $v0, 0x4c($sp)
/* 5CBD4 8005BFD4 000318C0 */  sll        $v1, $v1, 3
/* 5CBD8 8005BFD8 00432821 */  addu       $a1, $v0, $v1
/* 5CBDC 8005BFDC 90A20002 */  lbu        $v0, 2($a1)
/* 5CBE0 8005BFE0 16E2001D */  bne        $s7, $v0, .L8005C058
/* 5CBE4 8005BFE4 00001021 */   addu      $v0, $zero, $zero
/* 5CBE8 8005BFE8 44951000 */  mtc1       $s5, $f2
/* 5CBEC 8005BFEC 468010A0 */  cvt.s.w    $f2, $f2
/* 5CBF0 8005BFF0 94A20000 */  lhu        $v0, ($a1)
/* 5CBF4 8005BFF4 3C01800E */  lui        $at, %hi(D_800DF038)
/* 5CBF8 8005BFF8 C424F038 */  lwc1       $f4, %lo(D_800DF038)($at)
/* 5CBFC 8005BFFC 44820000 */  mtc1       $v0, $f0
/* 5CC00 8005C000 46800020 */  cvt.s.w    $f0, $f0
/* 5CC04 8005C004 46040003 */  div.s      $f0, $f0, $f4
/* 5CC08 8005C008 46020002 */  mul.s      $f0, $f0, $f2
/* 5CC0C 8005C00C 3C01800E */  lui        $at, %hi(D_800DF03C)
/* 5CC10 8005C010 C422F03C */  lwc1       $f2, %lo(D_800DF03C)($at)
/* 5CC14 8005C014 4600103E */  c.le.s     $f2, $f0
/* 5CC18 8005C018 00000000 */  nop
/* 5CC1C 8005C01C 45030005 */  bc1tl      .L8005C034
/* 5CC20 8005C020 46020001 */   sub.s     $f0, $f0, $f2
/* 5CC24 8005C024 4600008D */  trunc.w.s  $f2, $f0
/* 5CC28 8005C028 44021000 */  mfc1       $v0, $f2
/* 5CC2C 8005C02C 08017011 */  j          .L8005C044
/* 5CC30 8005C030 3042FFFF */   andi      $v0, $v0, 0xffff
.L8005C034:
/* 5CC34 8005C034 4600008D */  trunc.w.s  $f2, $f0
/* 5CC38 8005C038 44021000 */  mfc1       $v0, $f2
/* 5CC3C 8005C03C 005E1025 */  or         $v0, $v0, $fp
/* 5CC40 8005C040 3042FFFF */  andi       $v0, $v0, 0xffff
.L8005C044:
/* 5CC44 8005C044 50400001 */  beql       $v0, $zero, .L8005C04C
/* 5CC48 8005C048 24020001 */   addiu     $v0, $zero, 1
.L8005C04C:
/* 5CC4C 8005C04C 14560002 */  bne        $v0, $s6, .L8005C058
/* 5CC50 8005C050 00001021 */   addu      $v0, $zero, $zero
/* 5CC54 8005C054 24020001 */  addiu      $v0, $zero, 1
.L8005C058:
/* 5CC58 8005C058 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5CC5C 8005C05C 10400014 */  beqz       $v0, .L8005C0B0
/* 5CC60 8005C060 26020001 */   addiu     $v0, $s0, 1
/* 5CC64 8005C064 90A20003 */  lbu        $v0, 3($a1)
/* 5CC68 8005C068 10400010 */  beqz       $v0, .L8005C0AC
/* 5CC6C 8005C06C 8FA40048 */   lw        $a0, 0x48($sp)
/* 5CC70 8005C070 02603021 */  addu       $a2, $s3, $zero
/* 5CC74 8005C074 0C00582F */  jal        AllocPlayerAudio
/* 5CC78 8005C078 00003821 */   addu      $a3, $zero, $zero
/* 5CC7C 8005C07C 24440008 */  addiu      $a0, $v0, 8
/* 5CC80 8005C080 24450004 */  addiu      $a1, $v0, 4
/* 5CC84 8005C084 8C430000 */  lw         $v1, ($v0)
/* 5CC88 8005C088 02203821 */  addu       $a3, $s1, $zero
/* 5CC8C 8005C08C 8C660008 */  lw         $a2, 8($v1)
/* 5CC90 8005C090 2402FFFF */  addiu      $v0, $zero, -1
/* 5CC94 8005C094 AFB40010 */  sw         $s4, 0x10($sp)
/* 5CC98 8005C098 AFA00014 */  sw         $zero, 0x14($sp)
/* 5CC9C 8005C09C AFA20018 */  sw         $v0, 0x18($sp)
/* 5CCA0 8005C0A0 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5CCA4 8005C0A4 0C026895 */  jal        DCM_func
/* 5CCA8 8005C0A8 24C60008 */   addiu     $a2, $a2, 8
.L8005C0AC:
/* 5CCAC 8005C0AC 26020001 */  addiu      $v0, $s0, 1
.L8005C0B0:
/* 5CCB0 8005C0B0 305000FF */  andi       $s0, $v0, 0xff
/* 5CCB4 8005C0B4 0212182B */  sltu       $v1, $s0, $s2
/* 5CCB8 8005C0B8 1460FFC3 */  bnez       $v1, .L8005BFC8
/* 5CCBC 8005C0BC 8FA30064 */   lw        $v1, 0x64($sp)
/* 5CCC0 8005C0C0 8FBF0044 */  lw         $ra, 0x44($sp)
.L8005C0C4:
/* 5CCC4 8005C0C4 8FBE0040 */  lw         $fp, 0x40($sp)
/* 5CCC8 8005C0C8 8FB7003C */  lw         $s7, 0x3c($sp)
/* 5CCCC 8005C0CC 8FB60038 */  lw         $s6, 0x38($sp)
/* 5CCD0 8005C0D0 8FB50034 */  lw         $s5, 0x34($sp)
/* 5CCD4 8005C0D4 8FB40030 */  lw         $s4, 0x30($sp)
/* 5CCD8 8005C0D8 8FB3002C */  lw         $s3, 0x2c($sp)
/* 5CCDC 8005C0DC 8FB20028 */  lw         $s2, 0x28($sp)
/* 5CCE0 8005C0E0 8FB10024 */  lw         $s1, 0x24($sp)
/* 5CCE4 8005C0E4 8FB00020 */  lw         $s0, 0x20($sp)
/* 5CCE8 8005C0E8 03E00008 */  jr         $ra
/* 5CCEC 8005C0EC 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_8005C0F0
/* 5CCF0 8005C0F0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 5CCF4 8005C0F4 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5CCF8 8005C0F8 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 5CCFC 8005C0FC AFB20028 */  sw         $s2, 0x28($sp)
/* 5CD00 8005C100 00809021 */  addu       $s2, $a0, $zero
/* 5CD04 8005C104 30ECFFFF */  andi       $t4, $a3, 0xffff
/* 5CD08 8005C108 AFB10024 */  sw         $s1, 0x24($sp)
/* 5CD0C 8005C10C 93B10053 */  lbu        $s1, 0x53($sp)
/* 5CD10 8005C110 00606821 */  addu       $t5, $v1, $zero
/* 5CD14 8005C114 AFBF0030 */  sw         $ra, 0x30($sp)
/* 5CD18 8005C118 AFB3002C */  sw         $s3, 0x2c($sp)
/* 5CD1C 8005C11C AFB00020 */  sw         $s0, 0x20($sp)
/* 5CD20 8005C120 C4422054 */  lwc1       $f2, 0x2054($v0)
/* 5CD24 8005C124 44910000 */  mtc1       $s1, $f0
/* 5CD28 8005C128 46800020 */  cvt.s.w    $f0, $f0
/* 5CD2C 8005C12C 46020002 */  mul.s      $f0, $f0, $f2
/* 5CD30 8005C130 97AB004A */  lhu        $t3, 0x4a($sp)
/* 5CD34 8005C134 97AA004E */  lhu        $t2, 0x4e($sp)
/* 5CD38 8005C138 3C01800E */  lui        $at, %hi(D_800DF040)
/* 5CD3C 8005C13C C422F040 */  lwc1       $f2, %lo(D_800DF040)($at)
/* 5CD40 8005C140 4600103E */  c.le.s     $f2, $f0
/* 5CD44 8005C144 00000000 */  nop
/* 5CD48 8005C148 45010005 */  bc1t       .L8005C160
/* 5CD4C 8005C14C 93B30057 */   lbu       $s3, 0x57($sp)
/* 5CD50 8005C150 4600008D */  trunc.w.s  $f2, $f0
/* 5CD54 8005C154 44071000 */  mfc1       $a3, $f2
/* 5CD58 8005C158 0801705E */  j          .L8005C178
/* 5CD5C 8005C15C 30F100FF */   andi      $s1, $a3, 0xff
.L8005C160:
/* 5CD60 8005C160 46020001 */  sub.s      $f0, $f0, $f2
/* 5CD64 8005C164 4600008D */  trunc.w.s  $f2, $f0
/* 5CD68 8005C168 44071000 */  mfc1       $a3, $f2
/* 5CD6C 8005C16C 3C028000 */  lui        $v0, 0x8000
/* 5CD70 8005C170 00E23825 */  or         $a3, $a3, $v0
/* 5CD74 8005C174 30F100FF */  andi       $s1, $a3, 0xff
.L8005C178:
/* 5CD78 8005C178 56200003 */  bnel       $s1, $zero, .L8005C188
/* 5CD7C 8005C17C 94C20002 */   lhu       $v0, 2($a2)
.L8005C180:
/* 5CD80 8005C180 080170B5 */  j          .L8005C2D4
/* 5CD84 8005C184 24020001 */   addiu     $v0, $zero, 1
.L8005C188:
/* 5CD88 8005C188 00004021 */  addu       $t0, $zero, $zero
/* 5CD8C 8005C18C 10400050 */  beqz       $v0, .L8005C2D0
/* 5CD90 8005C190 00404821 */   addu      $t1, $v0, $zero
/* 5CD94 8005C194 3C078000 */  lui        $a3, 0x8000
/* 5CD98 8005C198 94C20004 */  lhu        $v0, 4($a2)
.L8005C19C:
/* 5CD9C 8005C19C 8CA40008 */  lw         $a0, 8($a1)
/* 5CDA0 8005C1A0 00481021 */  addu       $v0, $v0, $t0
/* 5CDA4 8005C1A4 00021040 */  sll        $v0, $v0, 1
/* 5CDA8 8005C1A8 00441021 */  addu       $v0, $v0, $a0
/* 5CDAC 8005C1AC 94430000 */  lhu        $v1, ($v0)
/* 5CDB0 8005C1B0 8CA40004 */  lw         $a0, 4($a1)
/* 5CDB4 8005C1B4 000318C0 */  sll        $v1, $v1, 3
/* 5CDB8 8005C1B8 00838021 */  addu       $s0, $a0, $v1
/* 5CDBC 8005C1BC 92020002 */  lbu        $v0, 2($s0)
/* 5CDC0 8005C1C0 1582001D */  bne        $t4, $v0, .L8005C238
/* 5CDC4 8005C1C4 00001021 */   addu      $v0, $zero, $zero
/* 5CDC8 8005C1C8 448A1000 */  mtc1       $t2, $f2
/* 5CDCC 8005C1CC 468010A0 */  cvt.s.w    $f2, $f2
/* 5CDD0 8005C1D0 96020000 */  lhu        $v0, ($s0)
/* 5CDD4 8005C1D4 3C01800E */  lui        $at, %hi(D_800DF044)
/* 5CDD8 8005C1D8 C424F044 */  lwc1       $f4, %lo(D_800DF044)($at)
/* 5CDDC 8005C1DC 44820000 */  mtc1       $v0, $f0
/* 5CDE0 8005C1E0 46800020 */  cvt.s.w    $f0, $f0
/* 5CDE4 8005C1E4 46040003 */  div.s      $f0, $f0, $f4
/* 5CDE8 8005C1E8 46020002 */  mul.s      $f0, $f0, $f2
/* 5CDEC 8005C1EC 3C01800E */  lui        $at, %hi(D_800DF048)
/* 5CDF0 8005C1F0 C422F048 */  lwc1       $f2, %lo(D_800DF048)($at)
/* 5CDF4 8005C1F4 4600103E */  c.le.s     $f2, $f0
/* 5CDF8 8005C1F8 00000000 */  nop
/* 5CDFC 8005C1FC 45030005 */  bc1tl      .L8005C214
/* 5CE00 8005C200 46020001 */   sub.s     $f0, $f0, $f2
/* 5CE04 8005C204 4600008D */  trunc.w.s  $f2, $f0
/* 5CE08 8005C208 44021000 */  mfc1       $v0, $f2
/* 5CE0C 8005C20C 08017089 */  j          .L8005C224
/* 5CE10 8005C210 3042FFFF */   andi      $v0, $v0, 0xffff
.L8005C214:
/* 5CE14 8005C214 4600008D */  trunc.w.s  $f2, $f0
/* 5CE18 8005C218 44021000 */  mfc1       $v0, $f2
/* 5CE1C 8005C21C 00471025 */  or         $v0, $v0, $a3
/* 5CE20 8005C220 3042FFFF */  andi       $v0, $v0, 0xffff
.L8005C224:
/* 5CE24 8005C224 50400001 */  beql       $v0, $zero, .L8005C22C
/* 5CE28 8005C228 24020001 */   addiu     $v0, $zero, 1
.L8005C22C:
/* 5CE2C 8005C22C 144B0002 */  bne        $v0, $t3, .L8005C238
/* 5CE30 8005C230 00001021 */   addu      $v0, $zero, $zero
/* 5CE34 8005C234 24020001 */  addiu      $v0, $zero, 1
.L8005C238:
/* 5CE38 8005C238 3042FFFF */  andi       $v0, $v0, 0xffff
/* 5CE3C 8005C23C 1040001F */  beqz       $v0, .L8005C2BC
/* 5CE40 8005C240 25030001 */   addiu     $v1, $t0, 1
/* 5CE44 8005C244 92020003 */  lbu        $v0, 3($s0)
/* 5CE48 8005C248 10400006 */  beqz       $v0, .L8005C264
/* 5CE4C 8005C24C 00402821 */   addu      $a1, $v0, $zero
/* 5CE50 8005C250 0C027338 */  jal        rand_0_to_B
/* 5CE54 8005C254 25A468A8 */   addiu     $a0, $t5, 0x68a8
/* 5CE58 8005C258 02021021 */  addu       $v0, $s0, $v0
/* 5CE5C 8005C25C 0801709B */  j          .L8005C26C
/* 5CE60 8005C260 90420004 */   lbu       $v0, 4($v0)
.L8005C264:
/* 5CE64 8005C264 0C02439A */  jal        func_80090E68
/* 5CE68 8005C268 02402021 */   addu      $a0, $s2, $zero
.L8005C26C:
/* 5CE6C 8005C26C 1040FFC4 */  beqz       $v0, .L8005C180
/* 5CE70 8005C270 02402021 */   addu      $a0, $s2, $zero
/* 5CE74 8005C274 00002821 */  addu       $a1, $zero, $zero
/* 5CE78 8005C278 24060001 */  addiu      $a2, $zero, 1
/* 5CE7C 8005C27C 0C00582F */  jal        AllocPlayerAudio
/* 5CE80 8005C280 00403821 */   addu      $a3, $v0, $zero
/* 5CE84 8005C284 24440008 */  addiu      $a0, $v0, 8
/* 5CE88 8005C288 24450004 */  addiu      $a1, $v0, 4
/* 5CE8C 8005C28C 8C430000 */  lw         $v1, ($v0)
/* 5CE90 8005C290 02203821 */  addu       $a3, $s1, $zero
/* 5CE94 8005C294 8C660008 */  lw         $a2, 8($v1)
/* 5CE98 8005C298 2402FFFF */  addiu      $v0, $zero, -1
/* 5CE9C 8005C29C AFB30010 */  sw         $s3, 0x10($sp)
/* 5CEA0 8005C2A0 AFA00014 */  sw         $zero, 0x14($sp)
/* 5CEA4 8005C2A4 AFA20018 */  sw         $v0, 0x18($sp)
/* 5CEA8 8005C2A8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 5CEAC 8005C2AC 0C026895 */  jal        DCM_func
/* 5CEB0 8005C2B0 24C60008 */   addiu     $a2, $a2, 8
/* 5CEB4 8005C2B4 080170B5 */  j          .L8005C2D4
/* 5CEB8 8005C2B8 24020001 */   addiu     $v0, $zero, 1
.L8005C2BC:
/* 5CEBC 8005C2BC 3068FFFF */  andi       $t0, $v1, 0xffff
/* 5CEC0 8005C2C0 3122FFFF */  andi       $v0, $t1, 0xffff
/* 5CEC4 8005C2C4 0102102B */  sltu       $v0, $t0, $v0
/* 5CEC8 8005C2C8 5440FFB4 */  bnel       $v0, $zero, .L8005C19C
/* 5CECC 8005C2CC 94C20004 */   lhu       $v0, 4($a2)
.L8005C2D0:
/* 5CED0 8005C2D0 00001021 */  addu       $v0, $zero, $zero
.L8005C2D4:
/* 5CED4 8005C2D4 8FBF0030 */  lw         $ra, 0x30($sp)
/* 5CED8 8005C2D8 8FB3002C */  lw         $s3, 0x2c($sp)
/* 5CEDC 8005C2DC 8FB20028 */  lw         $s2, 0x28($sp)
/* 5CEE0 8005C2E0 8FB10024 */  lw         $s1, 0x24($sp)
/* 5CEE4 8005C2E4 8FB00020 */  lw         $s0, 0x20($sp)
/* 5CEE8 8005C2E8 03E00008 */  jr         $ra
/* 5CEEC 8005C2EC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8005C2F0
/* 5CEF0 8005C2F0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5CEF4 8005C2F4 AFB00020 */  sw         $s0, 0x20($sp)
/* 5CEF8 8005C2F8 00808021 */  addu       $s0, $a0, $zero
/* 5CEFC 8005C2FC AFB20028 */  sw         $s2, 0x28($sp)
/* 5CF00 8005C300 93B20043 */  lbu        $s2, 0x43($sp)
/* 5CF04 8005C304 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 5CF08 8005C308 AFBF002C */  sw         $ra, 0x2c($sp)
/* 5CF0C 8005C30C AFB10024 */  sw         $s1, 0x24($sp)
/* 5CF10 8005C310 9602072A */  lhu        $v0, 0x72a($s0)
/* 5CF14 8005C314 10400018 */  beqz       $v0, .L8005C378
/* 5CF18 8005C318 93B10047 */   lbu       $s1, 0x47($sp)
/* 5CF1C 8005C31C 14A20017 */  bne        $a1, $v0, .L8005C37C
/* 5CF20 8005C320 00001021 */   addu      $v0, $zero, $zero
/* 5CF24 8005C324 02002021 */  addu       $a0, $s0, $zero
/* 5CF28 8005C328 00002821 */  addu       $a1, $zero, $zero
/* 5CF2C 8005C32C 9607072C */  lhu        $a3, 0x72c($s0)
/* 5CF30 8005C330 0C00582F */  jal        AllocPlayerAudio
/* 5CF34 8005C334 24060002 */   addiu     $a2, $zero, 2
/* 5CF38 8005C338 24440008 */  addiu      $a0, $v0, 8
/* 5CF3C 8005C33C 24450004 */  addiu      $a1, $v0, 4
/* 5CF40 8005C340 8C430000 */  lw         $v1, ($v0)
/* 5CF44 8005C344 02403821 */  addu       $a3, $s2, $zero
/* 5CF48 8005C348 8C660008 */  lw         $a2, 8($v1)
/* 5CF4C 8005C34C 2402FFFF */  addiu      $v0, $zero, -1
/* 5CF50 8005C350 AFB10010 */  sw         $s1, 0x10($sp)
/* 5CF54 8005C354 AFA00014 */  sw         $zero, 0x14($sp)
/* 5CF58 8005C358 AFA20018 */  sw         $v0, 0x18($sp)
/* 5CF5C 8005C35C AFA0001C */  sw         $zero, 0x1c($sp)
/* 5CF60 8005C360 0C026895 */  jal        DCM_func
/* 5CF64 8005C364 24C60008 */   addiu     $a2, $a2, 8
/* 5CF68 8005C368 24020001 */  addiu      $v0, $zero, 1
/* 5CF6C 8005C36C A600072A */  sh         $zero, 0x72a($s0)
/* 5CF70 8005C370 080170DF */  j          .L8005C37C
/* 5CF74 8005C374 A600072C */   sh        $zero, 0x72c($s0)
.L8005C378:
/* 5CF78 8005C378 00001021 */  addu       $v0, $zero, $zero
.L8005C37C:
/* 5CF7C 8005C37C 8FBF002C */  lw         $ra, 0x2c($sp)
/* 5CF80 8005C380 8FB20028 */  lw         $s2, 0x28($sp)
/* 5CF84 8005C384 8FB10024 */  lw         $s1, 0x24($sp)
/* 5CF88 8005C388 8FB00020 */  lw         $s0, 0x20($sp)
/* 5CF8C 8005C38C 03E00008 */  jr         $ra
/* 5CF90 8005C390 27BD0030 */   addiu     $sp, $sp, 0x30

glabel player_audiokey
/* 5CF94 8005C394 27BDFF70 */  addiu      $sp, $sp, -0x90
/* 5CF98 8005C398 AFB00070 */  sw         $s0, 0x70($sp)
/* 5CF9C 8005C39C 00808021 */  addu       $s0, $a0, $zero
/* 5CFA0 8005C3A0 AFB10074 */  sw         $s1, 0x74($sp)
/* 5CFA4 8005C3A4 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 5CFA8 8005C3A8 AFB20078 */  sw         $s2, 0x78($sp)
/* 5CFAC 8005C3AC 30D2FFFF */  andi       $s2, $a2, 0xffff
/* 5CFB0 8005C3B0 AFB3007C */  sw         $s3, 0x7c($sp)
/* 5CFB4 8005C3B4 30F3FFFF */  andi       $s3, $a3, 0xffff
/* 5CFB8 8005C3B8 3C02800E */  lui        $v0, %hi(player_handler+0x74)
/* 5CFBC 8005C3BC AFBF0088 */  sw         $ra, 0x88($sp)
/* 5CFC0 8005C3C0 AFB50084 */  sw         $s5, 0x84($sp)
/* 5CFC4 8005C3C4 AFB40080 */  sw         $s4, 0x80($sp)
/* 5CFC8 8005C3C8 96030758 */  lhu        $v1, 0x758($s0)
/* 5CFCC 8005C3CC 8C556CD4 */  lw         $s5, %lo(player_handler+0x74)($v0)
/* 5CFD0 8005C3D0 96050100 */  lhu        $a1, 0x100($s0)
/* 5CFD4 8005C3D4 000318C0 */  sll        $v1, $v1, 3
/* 5CFD8 8005C3D8 8EA40000 */  lw         $a0, ($s5)
/* 5CFDC 8005C3DC 28A20003 */  slti       $v0, $a1, 3
/* 5CFE0 8005C3E0 10400003 */  beqz       $v0, .L8005C3F0
/* 5CFE4 8005C3E4 0083A021 */   addu      $s4, $a0, $v1
/* 5CFE8 8005C3E8 04A10003 */  bgez       $a1, .L8005C3F8
/* 5CFEC 8005C3EC 02002021 */   addu      $a0, $s0, $zero
.L8005C3F0:
/* 5CFF0 8005C3F0 A6050102 */  sh         $a1, 0x102($s0)
/* 5CFF4 8005C3F4 02002021 */  addu       $a0, $s0, $zero
.L8005C3F8:
/* 5CFF8 8005C3F8 0C0054FF */  jal        func_800153FC
/* 5CFFC 8005C3FC 27A50028 */   addiu     $a1, $sp, 0x28
/* 5D000 8005C400 27A40028 */  addiu      $a0, $sp, 0x28
/* 5D004 8005C404 3C06800E */  lui        $a2, %hi(Camera)
/* 5D008 8005C408 24C66ABC */  addiu      $a2, $a2, %lo(Camera)
/* 5D00C 8005C40C 27A70068 */  addiu      $a3, $sp, 0x68
/* 5D010 8005C410 3C054170 */  lui        $a1, 0x4170
/* 5D014 8005C414 27A20069 */  addiu      $v0, $sp, 0x69
/* 5D018 8005C418 0C015987 */  jal        func_8005661C
/* 5D01C 8005C41C AFA20010 */   sw        $v0, 0x10($sp)
/* 5D020 8005C420 93A20068 */  lbu        $v0, 0x68($sp)
/* 5D024 8005C424 10400098 */  beqz       $v0, .L8005C688
/* 5D028 8005C428 24020001 */   addiu     $v0, $zero, 1
/* 5D02C 8005C42C 96830000 */  lhu        $v1, ($s4)
/* 5D030 8005C430 1062000B */  beq        $v1, $v0, .L8005C460
/* 5D034 8005C434 28620002 */   slti      $v0, $v1, 2
/* 5D038 8005C438 50400005 */  beql       $v0, $zero, .L8005C450
/* 5D03C 8005C43C 24020002 */   addiu     $v0, $zero, 2
/* 5D040 8005C440 10600091 */  beqz       $v1, .L8005C688
/* 5D044 8005C444 93A80068 */   lbu       $t0, 0x68($sp)
/* 5D048 8005C448 0801713D */  j          .L8005C4F4
/* 5D04C 8005C44C 00000000 */   nop
.L8005C450:
/* 5D050 8005C450 10620012 */  beq        $v1, $v0, .L8005C49C
/* 5D054 8005C454 93A80068 */   lbu       $t0, 0x68($sp)
/* 5D058 8005C458 0801713D */  j          .L8005C4F4
/* 5D05C 8005C45C 00000000 */   nop
.L8005C460:
/* 5D060 8005C460 93A20068 */  lbu        $v0, 0x68($sp)
/* 5D064 8005C464 3C01800E */  lui        $at, %hi(D_800DF050)
/* 5D068 8005C468 D422F050 */  ldc1       $f2, %lo(D_800DF050)($at)
/* 5D06C 8005C46C 44820000 */  mtc1       $v0, $f0
/* 5D070 8005C470 46800020 */  cvt.s.w    $f0, $f0
/* 5D074 8005C474 46000021 */  cvt.d.s    $f0, $f0
/* 5D078 8005C478 46220002 */  mul.d      $f0, $f0, $f2
/* 5D07C 8005C47C 3C01800E */  lui        $at, %hi(D_800DF058)
/* 5D080 8005C480 D422F058 */  ldc1       $f2, %lo(D_800DF058)($at)
/* 5D084 8005C484 4620103E */  c.le.d     $f2, $f0
/* 5D088 8005C488 00000000 */  nop
/* 5D08C 8005C48C 45000010 */  bc1f       .L8005C4D0
/* 5D090 8005C490 00000000 */   nop
/* 5D094 8005C494 08017138 */  j          .L8005C4E0
/* 5D098 8005C498 46220001 */   sub.d     $f0, $f0, $f2
.L8005C49C:
/* 5D09C 8005C49C 93A20068 */  lbu        $v0, 0x68($sp)
/* 5D0A0 8005C4A0 3C01800E */  lui        $at, %hi(D_800DF060)
/* 5D0A4 8005C4A4 D422F060 */  ldc1       $f2, %lo(D_800DF060)($at)
/* 5D0A8 8005C4A8 44820000 */  mtc1       $v0, $f0
/* 5D0AC 8005C4AC 46800020 */  cvt.s.w    $f0, $f0
/* 5D0B0 8005C4B0 46000021 */  cvt.d.s    $f0, $f0
/* 5D0B4 8005C4B4 46220002 */  mul.d      $f0, $f0, $f2
/* 5D0B8 8005C4B8 3C01800E */  lui        $at, %hi(D_800DF068)
/* 5D0BC 8005C4BC D422F068 */  ldc1       $f2, %lo(D_800DF068)($at)
/* 5D0C0 8005C4C0 4620103E */  c.le.d     $f2, $f0
/* 5D0C4 8005C4C4 00000000 */  nop
/* 5D0C8 8005C4C8 45030005 */  bc1tl      .L8005C4E0
/* 5D0CC 8005C4CC 46220001 */   sub.d     $f0, $f0, $f2
.L8005C4D0:
/* 5D0D0 8005C4D0 4620008D */  trunc.w.d  $f2, $f0
/* 5D0D4 8005C4D4 44041000 */  mfc1       $a0, $f2
/* 5D0D8 8005C4D8 0801713D */  j          .L8005C4F4
/* 5D0DC 8005C4DC 308800FF */   andi      $t0, $a0, 0xff
.L8005C4E0:
/* 5D0E0 8005C4E0 4620008D */  trunc.w.d  $f2, $f0
/* 5D0E4 8005C4E4 44041000 */  mfc1       $a0, $f2
/* 5D0E8 8005C4E8 3C028000 */  lui        $v0, 0x8000
/* 5D0EC 8005C4EC 00822025 */  or         $a0, $a0, $v0
/* 5D0F0 8005C4F0 308800FF */  andi       $t0, $a0, 0xff
.L8005C4F4:
/* 5D0F4 8005C4F4 11000050 */  beqz       $t0, .L8005C638
/* 5D0F8 8005C4F8 2463FFFF */   addiu     $v1, $v1, -1
/* 5D0FC 8005C4FC 2C620005 */  sltiu      $v0, $v1, 5
/* 5D100 8005C500 1040004D */  beqz       $v0, .L8005C638
/* 5D104 8005C504 3C02800E */   lui       $v0, %hi(D_800DF070)
/* 5D108 8005C508 2442F070 */  addiu      $v0, $v0, %lo(D_800DF070)
/* 5D10C 8005C50C 00031880 */  sll        $v1, $v1, 2
/* 5D110 8005C510 00621821 */  addu       $v1, $v1, $v0
/* 5D114 8005C514 8C640000 */  lw         $a0, ($v1)
/* 5D118 8005C518 00800008 */  jr         $a0
/* 5D11C 8005C51C 00000000 */   nop
/* 5D120 8005C520 02002021 */  addu       $a0, $s0, $zero
/* 5D124 8005C524 3C05800F */  lui        $a1, %hi(D_800EE9D0)
/* 5D128 8005C528 24A5E9D0 */  addiu      $a1, $a1, %lo(D_800EE9D0)
/* 5D12C 8005C52C 02203021 */  addu       $a2, $s1, $zero
/* 5D130 8005C530 02403821 */  addu       $a3, $s2, $zero
/* 5D134 8005C534 AFB30010 */  sw         $s3, 0x10($sp)
/* 5D138 8005C538 AFA80014 */  sw         $t0, 0x14($sp)
/* 5D13C 8005C53C 96080102 */  lhu        $t0, 0x102($s0)
/* 5D140 8005C540 24020003 */  addiu      $v0, $zero, 3
/* 5D144 8005C544 AFA20020 */  sw         $v0, 0x20($sp)
/* 5D148 8005C548 3C02800F */  lui        $v0, %hi(audiokey_unk1)
/* 5D14C 8005C54C 93A90069 */  lbu        $t1, 0x69($sp)
/* 5D150 8005C550 08017171 */  j          .L8005C5C4
/* 5D154 8005C554 2442EB58 */   addiu     $v0, $v0, %lo(audiokey_unk1)
/* 5D158 8005C558 02002021 */  addu       $a0, $s0, $zero
/* 5D15C 8005C55C 3C05800F */  lui        $a1, %hi(D_800EE9D0)
/* 5D160 8005C560 24A5E9D0 */  addiu      $a1, $a1, %lo(D_800EE9D0)
/* 5D164 8005C564 02203021 */  addu       $a2, $s1, $zero
/* 5D168 8005C568 02403821 */  addu       $a3, $s2, $zero
/* 5D16C 8005C56C AFB30010 */  sw         $s3, 0x10($sp)
/* 5D170 8005C570 AFA80014 */  sw         $t0, 0x14($sp)
/* 5D174 8005C574 96080102 */  lhu        $t0, 0x102($s0)
/* 5D178 8005C578 24020003 */  addiu      $v0, $zero, 3
/* 5D17C 8005C57C AFA20020 */  sw         $v0, 0x20($sp)
/* 5D180 8005C580 3C02800F */  lui        $v0, %hi(audiokey_unk2)
/* 5D184 8005C584 93A90069 */  lbu        $t1, 0x69($sp)
/* 5D188 8005C588 08017171 */  j          .L8005C5C4
/* 5D18C 8005C58C 2442EBA8 */   addiu     $v0, $v0, %lo(audiokey_unk2)
/* 5D190 8005C590 02002021 */  addu       $a0, $s0, $zero
/* 5D194 8005C594 3C05800F */  lui        $a1, %hi(D_800EE9D0)
/* 5D198 8005C598 24A5E9D0 */  addiu      $a1, $a1, %lo(D_800EE9D0)
/* 5D19C 8005C59C 02203021 */  addu       $a2, $s1, $zero
/* 5D1A0 8005C5A0 02403821 */  addu       $a3, $s2, $zero
/* 5D1A4 8005C5A4 AFB30010 */  sw         $s3, 0x10($sp)
/* 5D1A8 8005C5A8 AFA80014 */  sw         $t0, 0x14($sp)
/* 5D1AC 8005C5AC 96080102 */  lhu        $t0, 0x102($s0)
/* 5D1B0 8005C5B0 24020003 */  addiu      $v0, $zero, 3
/* 5D1B4 8005C5B4 AFA20020 */  sw         $v0, 0x20($sp)
/* 5D1B8 8005C5B8 3C02800F */  lui        $v0, %hi(audiokey_unk3)
/* 5D1BC 8005C5BC 93A90069 */  lbu        $t1, 0x69($sp)
/* 5D1C0 8005C5C0 2442EBF8 */  addiu      $v0, $v0, %lo(audiokey_unk3)
.L8005C5C4:
/* 5D1C4 8005C5C4 AFA00024 */  sw         $zero, 0x24($sp)
/* 5D1C8 8005C5C8 00081840 */  sll        $v1, $t0, 1
/* 5D1CC 8005C5CC 00681821 */  addu       $v1, $v1, $t0
/* 5D1D0 8005C5D0 00621821 */  addu       $v1, $v1, $v0
/* 5D1D4 8005C5D4 AFA90018 */  sw         $t1, 0x18($sp)
/* 5D1D8 8005C5D8 0C016FC4 */  jal        func_8005BF10
/* 5D1DC 8005C5DC AFA3001C */   sw        $v1, 0x1c($sp)
/* 5D1E0 8005C5E0 0801718F */  j          .L8005C63C
/* 5D1E4 8005C5E4 02002021 */   addu      $a0, $s0, $zero
/* 5D1E8 8005C5E8 02002021 */  addu       $a0, $s0, $zero
/* 5D1EC 8005C5EC 3C05800F */  lui        $a1, %hi(D_800EE9D0)
/* 5D1F0 8005C5F0 24A5E9D0 */  addiu      $a1, $a1, %lo(D_800EE9D0)
/* 5D1F4 8005C5F4 02203021 */  addu       $a2, $s1, $zero
/* 5D1F8 8005C5F8 02403821 */  addu       $a3, $s2, $zero
/* 5D1FC 8005C5FC AFB30010 */  sw         $s3, 0x10($sp)
/* 5D200 8005C600 AFA80014 */  sw         $t0, 0x14($sp)
/* 5D204 8005C604 96080102 */  lhu        $t0, 0x102($s0)
/* 5D208 8005C608 24020003 */  addiu      $v0, $zero, 3
/* 5D20C 8005C60C AFA20020 */  sw         $v0, 0x20($sp)
/* 5D210 8005C610 3C02800F */  lui        $v0, %hi(D_800EEC48)
/* 5D214 8005C614 93A90069 */  lbu        $t1, 0x69($sp)
/* 5D218 8005C618 2442EC48 */  addiu      $v0, $v0, %lo(D_800EEC48)
/* 5D21C 8005C61C AFA00024 */  sw         $zero, 0x24($sp)
/* 5D220 8005C620 00081840 */  sll        $v1, $t0, 1
/* 5D224 8005C624 00681821 */  addu       $v1, $v1, $t0
/* 5D228 8005C628 00621821 */  addu       $v1, $v1, $v0
/* 5D22C 8005C62C AFA90018 */  sw         $t1, 0x18($sp)
/* 5D230 8005C630 0C016FC4 */  jal        func_8005BF10
/* 5D234 8005C634 AFA3001C */   sw        $v1, 0x1c($sp)
.L8005C638:
/* 5D238 8005C638 02002021 */  addu       $a0, $s0, $zero
.L8005C63C:
/* 5D23C 8005C63C 02A02821 */  addu       $a1, $s5, $zero
/* 5D240 8005C640 02803021 */  addu       $a2, $s4, $zero
/* 5D244 8005C644 93A20068 */  lbu        $v0, 0x68($sp)
/* 5D248 8005C648 93A30069 */  lbu        $v1, 0x69($sp)
/* 5D24C 8005C64C 02203821 */  addu       $a3, $s1, $zero
/* 5D250 8005C650 AFB20010 */  sw         $s2, 0x10($sp)
/* 5D254 8005C654 AFB30014 */  sw         $s3, 0x14($sp)
/* 5D258 8005C658 AFA20018 */  sw         $v0, 0x18($sp)
/* 5D25C 8005C65C 0C01703C */  jal        func_8005C0F0
/* 5D260 8005C660 AFA3001C */   sw        $v1, 0x1c($sp)
/* 5D264 8005C664 02002021 */  addu       $a0, $s0, $zero
/* 5D268 8005C668 02202821 */  addu       $a1, $s1, $zero
/* 5D26C 8005C66C 02403021 */  addu       $a2, $s2, $zero
/* 5D270 8005C670 93A20068 */  lbu        $v0, 0x68($sp)
/* 5D274 8005C674 93A30069 */  lbu        $v1, 0x69($sp)
/* 5D278 8005C678 02603821 */  addu       $a3, $s3, $zero
/* 5D27C 8005C67C AFA20010 */  sw         $v0, 0x10($sp)
/* 5D280 8005C680 0C0170BC */  jal        func_8005C2F0
/* 5D284 8005C684 AFA30014 */   sw        $v1, 0x14($sp)
.L8005C688:
/* 5D288 8005C688 8FBF0088 */  lw         $ra, 0x88($sp)
/* 5D28C 8005C68C 8FB50084 */  lw         $s5, 0x84($sp)
/* 5D290 8005C690 8FB40080 */  lw         $s4, 0x80($sp)
/* 5D294 8005C694 8FB3007C */  lw         $s3, 0x7c($sp)
/* 5D298 8005C698 8FB20078 */  lw         $s2, 0x78($sp)
/* 5D29C 8005C69C 8FB10074 */  lw         $s1, 0x74($sp)
/* 5D2A0 8005C6A0 8FB00070 */  lw         $s0, 0x70($sp)
/* 5D2A4 8005C6A4 03E00008 */  jr         $ra
/* 5D2A8 8005C6A8 27BD0090 */   addiu     $sp, $sp, 0x90
/* 5D2AC 8005C6AC 00000000 */  nop
