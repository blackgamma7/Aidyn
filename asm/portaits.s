.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_portait_highlighter
/* 2CA10 8002BE10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2CA14 8002BE14 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2CA18 8002BE18 0C0290E2 */  jal        get_borg_8
/* 2CA1C 8002BE1C 240400DF */   addiu     $a0, $zero, 0xdf
/* 2CA20 8002BE20 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2CA24 8002BE24 3C03800E */  lui        $v1, %hi(portait_border_pointer)
/* 2CA28 8002BE28 AC627D68 */  sw         $v0, %lo(portait_border_pointer)($v1)
/* 2CA2C 8002BE2C 03E00008 */  jr         $ra
/* 2CA30 8002BE30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ofunc_check_portaits_bottom
/* 2CA34 8002BE34 10800006 */  beqz       $a0, .L8002BE50
/* 2CA38 8002BE38 24050001 */   addiu     $a1, $zero, 1
/* 2CA3C 8002BE3C 14850009 */  bne        $a0, $a1, .L8002BE64
/* 2CA40 8002BE40 3C02800F */   lui       $v0, %hi(screen_bottom)
/* 2CA44 8002BE44 94439C40 */  lhu        $v1, %lo(screen_bottom)($v0)
/* 2CA48 8002BE48 0800AF99 */  j          .L8002BE64
/* 2CA4C 8002BE4C 2C6500BA */   sltiu     $a1, $v1, 0xba
.L8002BE50:
/* 2CA50 8002BE50 3C03800F */  lui        $v1, %hi(screen_bottom)
/* 2CA54 8002BE54 94629C40 */  lhu        $v0, %lo(screen_bottom)($v1)
/* 2CA58 8002BE58 2C4200F0 */  sltiu      $v0, $v0, 0xf0
/* 2CA5C 8002BE5C 54400001 */  bnel       $v0, $zero, .L8002BE64
/* 2CA60 8002BE60 00002821 */   addu      $a1, $zero, $zero
.L8002BE64:
/* 2CA64 8002BE64 03E00008 */  jr         $ra
/* 2CA68 8002BE68 00A01021 */   addu      $v0, $a1, $zero

glabel pass_to_draw_portaits
/* 2CA6C 8002BE6C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 2CA70 8002BE70 3C02800E */  lui        $v0, %hi(D_800DA5F0)
/* 2CA74 8002BE74 AFBF0050 */  sw         $ra, 0x50($sp)
/* 2CA78 8002BE78 2448A5F0 */  addiu      $t0, $v0, %lo(D_800DA5F0)
/* 2CA7C 8002BE7C 89030000 */  lwl        $v1, ($t0)
/* 2CA80 8002BE80 99030003 */  lwr        $v1, 3($t0)
/* 2CA84 8002BE84 89060004 */  lwl        $a2, 4($t0)
/* 2CA88 8002BE88 99060007 */  lwr        $a2, 7($t0)
/* 2CA8C 8002BE8C 89070008 */  lwl        $a3, 8($t0)
/* 2CA90 8002BE90 9907000B */  lwr        $a3, 0xb($t0)
/* 2CA94 8002BE94 ABA30010 */  swl        $v1, 0x10($sp)
/* 2CA98 8002BE98 BBA30013 */  swr        $v1, 0x13($sp)
/* 2CA9C 8002BE9C ABA60014 */  swl        $a2, 0x14($sp)
/* 2CAA0 8002BEA0 BBA60017 */  swr        $a2, 0x17($sp)
/* 2CAA4 8002BEA4 ABA70018 */  swl        $a3, 0x18($sp)
/* 2CAA8 8002BEA8 BBA7001B */  swr        $a3, 0x1b($sp)
/* 2CAAC 8002BEAC 8903000C */  lwl        $v1, 0xc($t0)
/* 2CAB0 8002BEB0 9903000F */  lwr        $v1, 0xf($t0)
/* 2CAB4 8002BEB4 ABA3001C */  swl        $v1, 0x1c($sp)
/* 2CAB8 8002BEB8 BBA3001F */  swr        $v1, 0x1f($sp)
/* 2CABC 8002BEBC 0C00B003 */  jal        draw_party_portaits
/* 2CAC0 8002BEC0 27A60010 */   addiu     $a2, $sp, 0x10
/* 2CAC4 8002BEC4 8FBF0050 */  lw         $ra, 0x50($sp)
/* 2CAC8 8002BEC8 03E00008 */  jr         $ra
/* 2CACC 8002BECC 27BD0058 */   addiu     $sp, $sp, 0x58

glabel some_portait_math
/* 2CAD0 8002BED0 90820000 */  lbu        $v0, ($a0)
/* 2CAD4 8002BED4 44862000 */  mtc1       $a2, $f4
/* 2CAD8 8002BED8 44820000 */  mtc1       $v0, $f0
/* 2CADC 8002BEDC 46800020 */  cvt.s.w    $f0, $f0
/* 2CAE0 8002BEE0 46040002 */  mul.s      $f0, $f0, $f4
/* 2CAE4 8002BEE4 3C01800E */  lui        $at, %hi(D_800DA600)
/* 2CAE8 8002BEE8 C422A600 */  lwc1       $f2, %lo(D_800DA600)($at)
/* 2CAEC 8002BEEC 4600103E */  c.le.s     $f2, $f0
/* 2CAF0 8002BEF0 00000000 */  nop
/* 2CAF4 8002BEF4 45030005 */  bc1tl      .L8002BF0C
/* 2CAF8 8002BEF8 46020001 */   sub.s     $f0, $f0, $f2
/* 2CAFC 8002BEFC 4600008D */  trunc.w.s  $f2, $f0
/* 2CB00 8002BF00 44031000 */  mfc1       $v1, $f2
/* 2CB04 8002BF04 0800AFC8 */  j          .L8002BF20
/* 2CB08 8002BF08 A0A30000 */   sb        $v1, ($a1)
.L8002BF0C:
/* 2CB0C 8002BF0C 4600008D */  trunc.w.s  $f2, $f0
/* 2CB10 8002BF10 44031000 */  mfc1       $v1, $f2
/* 2CB14 8002BF14 3C028000 */  lui        $v0, 0x8000
/* 2CB18 8002BF18 00621825 */  or         $v1, $v1, $v0
/* 2CB1C 8002BF1C A0A30000 */  sb         $v1, ($a1)
.L8002BF20:
/* 2CB20 8002BF20 90820001 */  lbu        $v0, 1($a0)
/* 2CB24 8002BF24 44820000 */  mtc1       $v0, $f0
/* 2CB28 8002BF28 46800020 */  cvt.s.w    $f0, $f0
/* 2CB2C 8002BF2C 46040002 */  mul.s      $f0, $f0, $f4
/* 2CB30 8002BF30 3C01800E */  lui        $at, %hi(D_800DA604)
/* 2CB34 8002BF34 C422A604 */  lwc1       $f2, %lo(D_800DA604)($at)
/* 2CB38 8002BF38 4600103E */  c.le.s     $f2, $f0
/* 2CB3C 8002BF3C 00000000 */  nop
/* 2CB40 8002BF40 45030005 */  bc1tl      .L8002BF58
/* 2CB44 8002BF44 46020001 */   sub.s     $f0, $f0, $f2
/* 2CB48 8002BF48 4600008D */  trunc.w.s  $f2, $f0
/* 2CB4C 8002BF4C 44031000 */  mfc1       $v1, $f2
/* 2CB50 8002BF50 0800AFDB */  j          .L8002BF6C
/* 2CB54 8002BF54 A0A30001 */   sb        $v1, 1($a1)
.L8002BF58:
/* 2CB58 8002BF58 4600008D */  trunc.w.s  $f2, $f0
/* 2CB5C 8002BF5C 44031000 */  mfc1       $v1, $f2
/* 2CB60 8002BF60 3C028000 */  lui        $v0, 0x8000
/* 2CB64 8002BF64 00621825 */  or         $v1, $v1, $v0
/* 2CB68 8002BF68 A0A30001 */  sb         $v1, 1($a1)
.L8002BF6C:
/* 2CB6C 8002BF6C 90820002 */  lbu        $v0, 2($a0)
/* 2CB70 8002BF70 44820000 */  mtc1       $v0, $f0
/* 2CB74 8002BF74 46800020 */  cvt.s.w    $f0, $f0
/* 2CB78 8002BF78 46040002 */  mul.s      $f0, $f0, $f4
/* 2CB7C 8002BF7C 3C01800E */  lui        $at, %hi(D_800DA608)
/* 2CB80 8002BF80 C422A608 */  lwc1       $f2, %lo(D_800DA608)($at)
/* 2CB84 8002BF84 4600103E */  c.le.s     $f2, $f0
/* 2CB88 8002BF88 00000000 */  nop
/* 2CB8C 8002BF8C 45030005 */  bc1tl      .L8002BFA4
/* 2CB90 8002BF90 46020001 */   sub.s     $f0, $f0, $f2
/* 2CB94 8002BF94 4600008D */  trunc.w.s  $f2, $f0
/* 2CB98 8002BF98 44031000 */  mfc1       $v1, $f2
/* 2CB9C 8002BF9C 0800AFEE */  j          .L8002BFB8
/* 2CBA0 8002BFA0 A0A30002 */   sb        $v1, 2($a1)
.L8002BFA4:
/* 2CBA4 8002BFA4 4600008D */  trunc.w.s  $f2, $f0
/* 2CBA8 8002BFA8 44031000 */  mfc1       $v1, $f2
/* 2CBAC 8002BFAC 3C028000 */  lui        $v0, 0x8000
/* 2CBB0 8002BFB0 00621825 */  or         $v1, $v1, $v0
/* 2CBB4 8002BFB4 A0A30002 */  sb         $v1, 2($a1)
.L8002BFB8:
/* 2CBB8 8002BFB8 90820003 */  lbu        $v0, 3($a0)
/* 2CBBC 8002BFBC 44820000 */  mtc1       $v0, $f0
/* 2CBC0 8002BFC0 46800020 */  cvt.s.w    $f0, $f0
/* 2CBC4 8002BFC4 46040002 */  mul.s      $f0, $f0, $f4
/* 2CBC8 8002BFC8 3C01800E */  lui        $at, %hi(D_800DA60C)
/* 2CBCC 8002BFCC C422A60C */  lwc1       $f2, %lo(D_800DA60C)($at)
/* 2CBD0 8002BFD0 4600103E */  c.le.s     $f2, $f0
/* 2CBD4 8002BFD4 00000000 */  nop
/* 2CBD8 8002BFD8 45030005 */  bc1tl      .L8002BFF0
/* 2CBDC 8002BFDC 46020001 */   sub.s     $f0, $f0, $f2
/* 2CBE0 8002BFE0 4600008D */  trunc.w.s  $f2, $f0
/* 2CBE4 8002BFE4 44041000 */  mfc1       $a0, $f2
/* 2CBE8 8002BFE8 03E00008 */  jr         $ra
/* 2CBEC 8002BFEC A0A40003 */   sb        $a0, 3($a1)
.L8002BFF0:
/* 2CBF0 8002BFF0 4600008D */  trunc.w.s  $f2, $f0
/* 2CBF4 8002BFF4 44041000 */  mfc1       $a0, $f2
/* 2CBF8 8002BFF8 3C028000 */  lui        $v0, 0x8000
/* 2CBFC 8002BFFC 00822025 */  or         $a0, $a0, $v0
/* 2CC00 8002C000 A0A40003 */  sb         $a0, 3($a1)
/* 2CC04 8002C004 03E00008 */  jr         $ra
/* 2CC08 8002C008 00000000 */   nop

glabel draw_party_portaits
/* 2CC0C 8002C00C 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 2CC10 8002C010 AFB20070 */  sw         $s2, 0x70($sp)
/* 2CC14 8002C014 00809021 */  addu       $s2, $a0, $zero
/* 2CC18 8002C018 AFB30074 */  sw         $s3, 0x74($sp)
/* 2CC1C 8002C01C AFBF007C */  sw         $ra, 0x7c($sp)
/* 2CC20 8002C020 AFB40078 */  sw         $s4, 0x78($sp)
/* 2CC24 8002C024 AFB1006C */  sw         $s1, 0x6c($sp)
/* 2CC28 8002C028 AFB00068 */  sw         $s0, 0x68($sp)
/* 2CC2C 8002C02C F7B40080 */  sdc1       $f20, 0x80($sp)
/* 2CC30 8002C030 10A0000A */  beqz       $a1, .L8002C05C
/* 2CC34 8002C034 00C09821 */   addu      $s3, $a2, $zero
/* 2CC38 8002C038 24020001 */  addiu      $v0, $zero, 1
/* 2CC3C 8002C03C 14A2000E */  bne        $a1, $v0, .L8002C078
/* 2CC40 8002C040 3C14800F */   lui       $s4, %hi(screen_bottom)
/* 2CC44 8002C044 96839C40 */  lhu        $v1, %lo(screen_bottom)($s4)
/* 2CC48 8002C048 2C6200BA */  sltiu      $v0, $v1, 0xba
/* 2CC4C 8002C04C 1440000A */  bnez       $v0, .L8002C078
/* 2CC50 8002C050 2462FFFC */   addiu     $v0, $v1, -4
/* 2CC54 8002C054 0800B01E */  j          .L8002C078
/* 2CC58 8002C058 A6829C40 */   sh        $v0, -0x63c0($s4)
.L8002C05C:
/* 2CC5C 8002C05C 3C03800F */  lui        $v1, %hi(screen_bottom)
/* 2CC60 8002C060 94649C40 */  lhu        $a0, %lo(screen_bottom)($v1)
/* 2CC64 8002C064 2C8200F0 */  sltiu      $v0, $a0, 0xf0
/* 2CC68 8002C068 10400003 */  beqz       $v0, .L8002C078
/* 2CC6C 8002C06C 0060A021 */   addu      $s4, $v1, $zero
/* 2CC70 8002C070 24820004 */  addiu      $v0, $a0, 4
/* 2CC74 8002C074 A6829C40 */  sh         $v0, -0x63c0($s4)
.L8002C078:
/* 2CC78 8002C078 0C0025B4 */  jal        get_hres
/* 2CC7C 8002C07C 3C11800E */   lui       $s1, 0x800e
/* 2CC80 8002C080 0C0025B7 */  jal        get_vres
/* 2CC84 8002C084 00408021 */   addu      $s0, $v0, $zero
/* 2CC88 8002C088 02402021 */  addu       $a0, $s2, $zero
/* 2CC8C 8002C08C 24050006 */  addiu      $a1, $zero, 6
/* 2CC90 8002C090 02003021 */  addu       $a2, $s0, $zero
/* 2CC94 8002C094 0C0290ED */  jal        rsp_func
/* 2CC98 8002C098 00403821 */   addu      $a3, $v0, $zero
/* 2CC9C 8002C09C 00409021 */  addu       $s2, $v0, $zero
/* 2CCA0 8002C0A0 02602021 */  addu       $a0, $s3, $zero
/* 2CCA4 8002C0A4 263068A8 */  addiu      $s0, $s1, 0x68a8
/* 2CCA8 8002C0A8 8E06203C */  lw         $a2, 0x203c($s0)
/* 2CCAC 8002C0AC 0C00AFB4 */  jal        some_portait_math
/* 2CCB0 8002C0B0 27A50028 */   addiu     $a1, $sp, 0x28
/* 2CCB4 8002C0B4 8E0514C0 */  lw         $a1, 0x14c0($s0)
/* 2CCB8 8002C0B8 3C0642A8 */  lui        $a2, 0x42a8
/* 2CCBC 8002C0BC 968A9C40 */  lhu        $t2, -0x63c0($s4)
/* 2CCC0 8002C0C0 3C01800E */  lui        $at, %hi(D_800DA610)
/* 2CCC4 8002C0C4 C434A610 */  lwc1       $f20, %lo(D_800DA610)($at)
/* 2CCC8 8002C0C8 93A20028 */  lbu        $v0, 0x28($sp)
/* 2CCCC 8002C0CC 93A30029 */  lbu        $v1, 0x29($sp)
/* 2CCD0 8002C0D0 93A8002A */  lbu        $t0, 0x2a($sp)
/* 2CCD4 8002C0D4 93A9002B */  lbu        $t1, 0x2b($sp)
/* 2CCD8 8002C0D8 448A0000 */  mtc1       $t2, $f0
/* 2CCDC 8002C0DC 46800020 */  cvt.s.w    $f0, $f0
/* 2CCE0 8002C0E0 44070000 */  mfc1       $a3, $f0
/* 2CCE4 8002C0E4 02402021 */  addu       $a0, $s2, $zero
/* 2CCE8 8002C0E8 E7B40010 */  swc1       $f20, 0x10($sp)
/* 2CCEC 8002C0EC E7B40014 */  swc1       $f20, 0x14($sp)
/* 2CCF0 8002C0F0 AFA20018 */  sw         $v0, 0x18($sp)
/* 2CCF4 8002C0F4 AFA3001C */  sw         $v1, 0x1c($sp)
/* 2CCF8 8002C0F8 AFA80020 */  sw         $t0, 0x20($sp)
/* 2CCFC 8002C0FC 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CD00 8002C100 AFA90024 */   sw        $t1, 0x24($sp)
/* 2CD04 8002C104 00409021 */  addu       $s2, $v0, $zero
/* 2CD08 8002C108 26640004 */  addiu      $a0, $s3, 4
/* 2CD0C 8002C10C 8E06203C */  lw         $a2, 0x203c($s0)
/* 2CD10 8002C110 0C00AFB4 */  jal        some_portait_math
/* 2CD14 8002C114 27A50028 */   addiu     $a1, $sp, 0x28
/* 2CD18 8002C118 8E0514C0 */  lw         $a1, 0x14c0($s0)
/* 2CD1C 8002C11C 3C0642F4 */  lui        $a2, 0x42f4
/* 2CD20 8002C120 968A9C40 */  lhu        $t2, -0x63c0($s4)
/* 2CD24 8002C124 93A20028 */  lbu        $v0, 0x28($sp)
/* 2CD28 8002C128 93A30029 */  lbu        $v1, 0x29($sp)
/* 2CD2C 8002C12C 93A8002A */  lbu        $t0, 0x2a($sp)
/* 2CD30 8002C130 93A9002B */  lbu        $t1, 0x2b($sp)
/* 2CD34 8002C134 448A0000 */  mtc1       $t2, $f0
/* 2CD38 8002C138 46800020 */  cvt.s.w    $f0, $f0
/* 2CD3C 8002C13C 44070000 */  mfc1       $a3, $f0
/* 2CD40 8002C140 02402021 */  addu       $a0, $s2, $zero
/* 2CD44 8002C144 E7B40010 */  swc1       $f20, 0x10($sp)
/* 2CD48 8002C148 E7B40014 */  swc1       $f20, 0x14($sp)
/* 2CD4C 8002C14C AFA20018 */  sw         $v0, 0x18($sp)
/* 2CD50 8002C150 AFA3001C */  sw         $v1, 0x1c($sp)
/* 2CD54 8002C154 AFA80020 */  sw         $t0, 0x20($sp)
/* 2CD58 8002C158 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CD5C 8002C15C AFA90024 */   sw        $t1, 0x24($sp)
/* 2CD60 8002C160 00409021 */  addu       $s2, $v0, $zero
/* 2CD64 8002C164 26640008 */  addiu      $a0, $s3, 8
/* 2CD68 8002C168 8E06203C */  lw         $a2, 0x203c($s0)
/* 2CD6C 8002C16C 0C00AFB4 */  jal        some_portait_math
/* 2CD70 8002C170 27A50028 */   addiu     $a1, $sp, 0x28
/* 2CD74 8002C174 8E0514C0 */  lw         $a1, 0x14c0($s0)
/* 2CD78 8002C178 3C064320 */  lui        $a2, 0x4320
/* 2CD7C 8002C17C 968A9C40 */  lhu        $t2, -0x63c0($s4)
/* 2CD80 8002C180 93A20028 */  lbu        $v0, 0x28($sp)
/* 2CD84 8002C184 93A30029 */  lbu        $v1, 0x29($sp)
/* 2CD88 8002C188 93A8002A */  lbu        $t0, 0x2a($sp)
/* 2CD8C 8002C18C 93A9002B */  lbu        $t1, 0x2b($sp)
/* 2CD90 8002C190 448A0000 */  mtc1       $t2, $f0
/* 2CD94 8002C194 46800020 */  cvt.s.w    $f0, $f0
/* 2CD98 8002C198 44070000 */  mfc1       $a3, $f0
/* 2CD9C 8002C19C 02402021 */  addu       $a0, $s2, $zero
/* 2CDA0 8002C1A0 E7B40010 */  swc1       $f20, 0x10($sp)
/* 2CDA4 8002C1A4 E7B40014 */  swc1       $f20, 0x14($sp)
/* 2CDA8 8002C1A8 AFA20018 */  sw         $v0, 0x18($sp)
/* 2CDAC 8002C1AC AFA3001C */  sw         $v1, 0x1c($sp)
/* 2CDB0 8002C1B0 AFA80020 */  sw         $t0, 0x20($sp)
/* 2CDB4 8002C1B4 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CDB8 8002C1B8 AFA90024 */   sw        $t1, 0x24($sp)
/* 2CDBC 8002C1BC 00409021 */  addu       $s2, $v0, $zero
/* 2CDC0 8002C1C0 2664000C */  addiu      $a0, $s3, 0xc
/* 2CDC4 8002C1C4 8E06203C */  lw         $a2, 0x203c($s0)
/* 2CDC8 8002C1C8 0C00AFB4 */  jal        some_portait_math
/* 2CDCC 8002C1CC 27A50028 */   addiu     $a1, $sp, 0x28
/* 2CDD0 8002C1D0 8E0514C0 */  lw         $a1, 0x14c0($s0)
/* 2CDD4 8002C1D4 3C064346 */  lui        $a2, 0x4346
/* 2CDD8 8002C1D8 968A9C40 */  lhu        $t2, -0x63c0($s4)
/* 2CDDC 8002C1DC 93A20028 */  lbu        $v0, 0x28($sp)
/* 2CDE0 8002C1E0 93A30029 */  lbu        $v1, 0x29($sp)
/* 2CDE4 8002C1E4 93A8002A */  lbu        $t0, 0x2a($sp)
/* 2CDE8 8002C1E8 93A9002B */  lbu        $t1, 0x2b($sp)
/* 2CDEC 8002C1EC 448A0000 */  mtc1       $t2, $f0
/* 2CDF0 8002C1F0 46800020 */  cvt.s.w    $f0, $f0
/* 2CDF4 8002C1F4 44070000 */  mfc1       $a3, $f0
/* 2CDF8 8002C1F8 02402021 */  addu       $a0, $s2, $zero
/* 2CDFC 8002C1FC E7B40010 */  swc1       $f20, 0x10($sp)
/* 2CE00 8002C200 E7B40014 */  swc1       $f20, 0x14($sp)
/* 2CE04 8002C204 AFA20018 */  sw         $v0, 0x18($sp)
/* 2CE08 8002C208 AFA3001C */  sw         $v1, 0x1c($sp)
/* 2CE0C 8002C20C AFA80020 */  sw         $t0, 0x20($sp)
/* 2CE10 8002C210 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CE14 8002C214 AFA90024 */   sw        $t1, 0x24($sp)
/* 2CE18 8002C218 00409021 */  addu       $s2, $v0, $zero
/* 2CE1C 8002C21C 27A40028 */  addiu      $a0, $sp, 0x28
/* 2CE20 8002C220 00802821 */  addu       $a1, $a0, $zero
/* 2CE24 8002C224 240300FF */  addiu      $v1, $zero, 0xff
/* 2CE28 8002C228 8E06203C */  lw         $a2, 0x203c($s0)
/* 2CE2C 8002C22C 24020080 */  addiu      $v0, $zero, 0x80
/* 2CE30 8002C230 A3A30029 */  sb         $v1, 0x29($sp)
/* 2CE34 8002C234 A3A30028 */  sb         $v1, 0x28($sp)
/* 2CE38 8002C238 0C00AFB4 */  jal        some_portait_math
/* 2CE3C 8002C23C A3A2002B */   sb        $v0, 0x2b($sp)
/* 2CE40 8002C240 8E0215F8 */  lw         $v0, 0x15f8($s0)
/* 2CE44 8002C244 8C490000 */  lw         $t1, ($v0)
/* 2CE48 8002C248 1120001A */  beqz       $t1, .L8002C2B4
/* 2CE4C 8002C24C 262268A8 */   addiu     $v0, $s1, 0x68a8
/* 2CE50 8002C250 8D220044 */  lw         $v0, 0x44($t1)
/* 2CE54 8002C254 10400016 */  beqz       $v0, .L8002C2B0
/* 2CE58 8002C258 96829C40 */   lhu       $v0, -0x63c0($s4)
/* 2CE5C 8002C25C 3C0642B4 */  lui        $a2, 0x42b4
/* 2CE60 8002C260 3C01800E */  lui        $at, %hi(D_800DA614)
/* 2CE64 8002C264 C420A614 */  lwc1       $f0, %lo(D_800DA614)($at)
/* 2CE68 8002C268 93A30028 */  lbu        $v1, 0x28($sp)
/* 2CE6C 8002C26C 93A50029 */  lbu        $a1, 0x29($sp)
/* 2CE70 8002C270 93A7002A */  lbu        $a3, 0x2a($sp)
/* 2CE74 8002C274 93A8002B */  lbu        $t0, 0x2b($sp)
/* 2CE78 8002C278 24420006 */  addiu      $v0, $v0, 6
/* 2CE7C 8002C27C E7A00010 */  swc1       $f0, 0x10($sp)
/* 2CE80 8002C280 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2CE84 8002C284 44820000 */  mtc1       $v0, $f0
/* 2CE88 8002C288 46800020 */  cvt.s.w    $f0, $f0
/* 2CE8C 8002C28C AFA30018 */  sw         $v1, 0x18($sp)
/* 2CE90 8002C290 AFA5001C */  sw         $a1, 0x1c($sp)
/* 2CE94 8002C294 AFA70020 */  sw         $a3, 0x20($sp)
/* 2CE98 8002C298 AFA80024 */  sw         $t0, 0x24($sp)
/* 2CE9C 8002C29C 8D250044 */  lw         $a1, 0x44($t1)
/* 2CEA0 8002C2A0 44070000 */  mfc1       $a3, $f0
/* 2CEA4 8002C2A4 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CEA8 8002C2A8 02402021 */   addu      $a0, $s2, $zero
/* 2CEAC 8002C2AC 00409021 */  addu       $s2, $v0, $zero
.L8002C2B0:
/* 2CEB0 8002C2B0 262268A8 */  addiu      $v0, $s1, 0x68a8
.L8002C2B4:
/* 2CEB4 8002C2B4 8C4315F8 */  lw         $v1, 0x15f8($v0)
/* 2CEB8 8002C2B8 8C690004 */  lw         $t1, 4($v1)
/* 2CEBC 8002C2BC 1120001A */  beqz       $t1, .L8002C328
/* 2CEC0 8002C2C0 262268A8 */   addiu     $v0, $s1, 0x68a8
/* 2CEC4 8002C2C4 8D220044 */  lw         $v0, 0x44($t1)
/* 2CEC8 8002C2C8 10400016 */  beqz       $v0, .L8002C324
/* 2CECC 8002C2CC 96829C40 */   lhu       $v0, -0x63c0($s4)
/* 2CED0 8002C2D0 3C064300 */  lui        $a2, 0x4300
/* 2CED4 8002C2D4 3C01800E */  lui        $at, %hi(D_800DA618)
/* 2CED8 8002C2D8 C420A618 */  lwc1       $f0, %lo(D_800DA618)($at)
/* 2CEDC 8002C2DC 93A30028 */  lbu        $v1, 0x28($sp)
/* 2CEE0 8002C2E0 93A50029 */  lbu        $a1, 0x29($sp)
/* 2CEE4 8002C2E4 93A7002A */  lbu        $a3, 0x2a($sp)
/* 2CEE8 8002C2E8 93A8002B */  lbu        $t0, 0x2b($sp)
/* 2CEEC 8002C2EC 24420006 */  addiu      $v0, $v0, 6
/* 2CEF0 8002C2F0 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2CEF4 8002C2F4 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2CEF8 8002C2F8 44820000 */  mtc1       $v0, $f0
/* 2CEFC 8002C2FC 46800020 */  cvt.s.w    $f0, $f0
/* 2CF00 8002C300 AFA30018 */  sw         $v1, 0x18($sp)
/* 2CF04 8002C304 AFA5001C */  sw         $a1, 0x1c($sp)
/* 2CF08 8002C308 AFA70020 */  sw         $a3, 0x20($sp)
/* 2CF0C 8002C30C AFA80024 */  sw         $t0, 0x24($sp)
/* 2CF10 8002C310 8D250044 */  lw         $a1, 0x44($t1)
/* 2CF14 8002C314 44070000 */  mfc1       $a3, $f0
/* 2CF18 8002C318 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CF1C 8002C31C 02402021 */   addu      $a0, $s2, $zero
/* 2CF20 8002C320 00409021 */  addu       $s2, $v0, $zero
.L8002C324:
/* 2CF24 8002C324 262268A8 */  addiu      $v0, $s1, 0x68a8
.L8002C328:
/* 2CF28 8002C328 8C4315F8 */  lw         $v1, 0x15f8($v0)
/* 2CF2C 8002C32C 8C690008 */  lw         $t1, 8($v1)
/* 2CF30 8002C330 1120001A */  beqz       $t1, .L8002C39C
/* 2CF34 8002C334 262268A8 */   addiu     $v0, $s1, 0x68a8
/* 2CF38 8002C338 8D220044 */  lw         $v0, 0x44($t1)
/* 2CF3C 8002C33C 10400016 */  beqz       $v0, .L8002C398
/* 2CF40 8002C340 96829C40 */   lhu       $v0, -0x63c0($s4)
/* 2CF44 8002C344 3C064326 */  lui        $a2, 0x4326
/* 2CF48 8002C348 3C01800E */  lui        $at, %hi(D_800DA61C)
/* 2CF4C 8002C34C C420A61C */  lwc1       $f0, %lo(D_800DA61C)($at)
/* 2CF50 8002C350 93A30028 */  lbu        $v1, 0x28($sp)
/* 2CF54 8002C354 93A50029 */  lbu        $a1, 0x29($sp)
/* 2CF58 8002C358 93A7002A */  lbu        $a3, 0x2a($sp)
/* 2CF5C 8002C35C 93A8002B */  lbu        $t0, 0x2b($sp)
/* 2CF60 8002C360 24420006 */  addiu      $v0, $v0, 6
/* 2CF64 8002C364 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2CF68 8002C368 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2CF6C 8002C36C 44820000 */  mtc1       $v0, $f0
/* 2CF70 8002C370 46800020 */  cvt.s.w    $f0, $f0
/* 2CF74 8002C374 AFA30018 */  sw         $v1, 0x18($sp)
/* 2CF78 8002C378 AFA5001C */  sw         $a1, 0x1c($sp)
/* 2CF7C 8002C37C AFA70020 */  sw         $a3, 0x20($sp)
/* 2CF80 8002C380 AFA80024 */  sw         $t0, 0x24($sp)
/* 2CF84 8002C384 8D250044 */  lw         $a1, 0x44($t1)
/* 2CF88 8002C388 44070000 */  mfc1       $a3, $f0
/* 2CF8C 8002C38C 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2CF90 8002C390 02402021 */   addu      $a0, $s2, $zero
/* 2CF94 8002C394 00409021 */  addu       $s2, $v0, $zero
.L8002C398:
/* 2CF98 8002C398 262268A8 */  addiu      $v0, $s1, 0x68a8
.L8002C39C:
/* 2CF9C 8002C39C 8C4315F8 */  lw         $v1, 0x15f8($v0)
/* 2CFA0 8002C3A0 8C71000C */  lw         $s1, 0xc($v1)
/* 2CFA4 8002C3A4 1220001A */  beqz       $s1, .L8002C410
/* 2CFA8 8002C3A8 02401021 */   addu      $v0, $s2, $zero
/* 2CFAC 8002C3AC 8E220044 */  lw         $v0, 0x44($s1)
/* 2CFB0 8002C3B0 10400016 */  beqz       $v0, .L8002C40C
/* 2CFB4 8002C3B4 96829C40 */   lhu       $v0, -0x63c0($s4)
/* 2CFB8 8002C3B8 3C06434C */  lui        $a2, 0x434c
/* 2CFBC 8002C3BC 3C01800E */  lui        $at, %hi(D_800DA620)
/* 2CFC0 8002C3C0 C420A620 */  lwc1       $f0, %lo(D_800DA620)($at)
/* 2CFC4 8002C3C4 93A30028 */  lbu        $v1, 0x28($sp)
/* 2CFC8 8002C3C8 93A50029 */  lbu        $a1, 0x29($sp)
/* 2CFCC 8002C3CC 93A7002A */  lbu        $a3, 0x2a($sp)
/* 2CFD0 8002C3D0 93A8002B */  lbu        $t0, 0x2b($sp)
/* 2CFD4 8002C3D4 24420006 */  addiu      $v0, $v0, 6
/* 2CFD8 8002C3D8 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2CFDC 8002C3DC E7A00014 */  swc1       $f0, 0x14($sp)
/* 2CFE0 8002C3E0 44820000 */  mtc1       $v0, $f0
/* 2CFE4 8002C3E4 46800020 */  cvt.s.w    $f0, $f0
/* 2CFE8 8002C3E8 AFA30018 */  sw         $v1, 0x18($sp)
/* 2CFEC 8002C3EC AFA5001C */  sw         $a1, 0x1c($sp)
/* 2CFF0 8002C3F0 AFA70020 */  sw         $a3, 0x20($sp)
/* 2CFF4 8002C3F4 AFA80024 */  sw         $t0, 0x24($sp)
/* 2CFF8 8002C3F8 8E250044 */  lw         $a1, 0x44($s1)
/* 2CFFC 8002C3FC 44070000 */  mfc1       $a3, $f0
/* 2D000 8002C400 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2D004 8002C404 02402021 */   addu      $a0, $s2, $zero
/* 2D008 8002C408 00409021 */  addu       $s2, $v0, $zero
.L8002C40C:
/* 2D00C 8002C40C 02401021 */  addu       $v0, $s2, $zero
.L8002C410:
/* 2D010 8002C410 8FBF007C */  lw         $ra, 0x7c($sp)
/* 2D014 8002C414 8FB40078 */  lw         $s4, 0x78($sp)
/* 2D018 8002C418 8FB30074 */  lw         $s3, 0x74($sp)
/* 2D01C 8002C41C 8FB20070 */  lw         $s2, 0x70($sp)
/* 2D020 8002C420 8FB1006C */  lw         $s1, 0x6c($sp)
/* 2D024 8002C424 8FB00068 */  lw         $s0, 0x68($sp)
/* 2D028 8002C428 D7B40080 */  ldc1       $f20, 0x80($sp)
/* 2D02C 8002C42C 03E00008 */  jr         $ra
/* 2D030 8002C430 27BD0088 */   addiu     $sp, $sp, 0x88

glabel portait_border_free
/* 2D034 8002C434 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2D038 8002C438 AFB00010 */  sw         $s0, 0x10($sp)
/* 2D03C 8002C43C 3C10800E */  lui        $s0, %hi(queueStructA)
/* 2D040 8002C440 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 2D044 8002C444 02002021 */  addu       $a0, $s0, $zero
/* 2D048 8002C448 2605FE9C */  addiu      $a1, $s0, -0x164
/* 2D04C 8002C44C 24060004 */  addiu      $a2, $zero, 4
/* 2D050 8002C450 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2D054 8002C454 0C035867 */  jal        AllocFreeQueueItem
/* 2D058 8002C458 00003821 */   addu      $a3, $zero, $zero
/* 2D05C 8002C45C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2D060 8002C460 AE00FE9C */  sw         $zero, -0x164($s0)
/* 2D064 8002C464 8FB00010 */  lw         $s0, 0x10($sp)
/* 2D068 8002C468 03E00008 */  jr         $ra
/* 2D06C 8002C46C 27BD0018 */   addiu     $sp, $sp, 0x18
