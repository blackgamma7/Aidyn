.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel sundail_init
/* 2BB90 8002AF90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2BB94 8002AF94 2404002C */  addiu      $a0, $zero, 0x2c
/* 2BB98 8002AF98 3C05800E */  lui        $a1, %hi(D_800DA490)
/* 2BB9C 8002AF9C 24A5A490 */  addiu      $a1, $a1, %lo(D_800DA490)
/* 2BBA0 8002AFA0 2406006C */  addiu      $a2, $zero, 0x6c
/* 2BBA4 8002AFA4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2BBA8 8002AFA8 0C025F9C */  jal        Malloc
/* 2BBAC 8002AFAC AFB00010 */   sw        $s0, 0x10($sp)
/* 2BBB0 8002AFB0 2404001B */  addiu      $a0, $zero, 0x1b
/* 2BBB4 8002AFB4 3C10800F */  lui        $s0, %hi(sundail_pointer)
/* 2BBB8 8002AFB8 0C0290E2 */  jal        get_borg_8
/* 2BBBC 8002AFBC AE029C30 */   sw        $v0, %lo(sundail_pointer)($s0)
/* 2BBC0 8002AFC0 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BBC4 8002AFC4 240401BA */  addiu      $a0, $zero, 0x1ba
/* 2BBC8 8002AFC8 0C0290E2 */  jal        get_borg_8
/* 2BBCC 8002AFCC AC620000 */   sw        $v0, ($v1)
/* 2BBD0 8002AFD0 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BBD4 8002AFD4 240401B8 */  addiu      $a0, $zero, 0x1b8
/* 2BBD8 8002AFD8 0C0290E2 */  jal        get_borg_8
/* 2BBDC 8002AFDC AC620004 */   sw        $v0, 4($v1)
/* 2BBE0 8002AFE0 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BBE4 8002AFE4 240401B3 */  addiu      $a0, $zero, 0x1b3
/* 2BBE8 8002AFE8 0C0290E2 */  jal        get_borg_8
/* 2BBEC 8002AFEC AC620008 */   sw        $v0, 8($v1)
/* 2BBF0 8002AFF0 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BBF4 8002AFF4 240401B4 */  addiu      $a0, $zero, 0x1b4
/* 2BBF8 8002AFF8 0C0290E2 */  jal        get_borg_8
/* 2BBFC 8002AFFC AC62000C */   sw        $v0, 0xc($v1)
/* 2BC00 8002B000 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC04 8002B004 240401B6 */  addiu      $a0, $zero, 0x1b6
/* 2BC08 8002B008 0C0290E2 */  jal        get_borg_8
/* 2BC0C 8002B00C AC620010 */   sw        $v0, 0x10($v1)
/* 2BC10 8002B010 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC14 8002B014 240401B7 */  addiu      $a0, $zero, 0x1b7
/* 2BC18 8002B018 0C0290E2 */  jal        get_borg_8
/* 2BC1C 8002B01C AC620014 */   sw        $v0, 0x14($v1)
/* 2BC20 8002B020 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC24 8002B024 240401B5 */  addiu      $a0, $zero, 0x1b5
/* 2BC28 8002B028 0C0290E2 */  jal        get_borg_8
/* 2BC2C 8002B02C AC620018 */   sw        $v0, 0x18($v1)
/* 2BC30 8002B030 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC34 8002B034 240401BB */  addiu      $a0, $zero, 0x1bb
/* 2BC38 8002B038 0C0290E2 */  jal        get_borg_8
/* 2BC3C 8002B03C AC62001C */   sw        $v0, 0x1c($v1)
/* 2BC40 8002B040 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC44 8002B044 240401B9 */  addiu      $a0, $zero, 0x1b9
/* 2BC48 8002B048 0C0290E2 */  jal        get_borg_8
/* 2BC4C 8002B04C AC620020 */   sw        $v0, 0x20($v1)
/* 2BC50 8002B050 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BC54 8002B054 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2BC58 8002B058 A0600028 */  sb         $zero, 0x28($v1)
/* 2BC5C 8002B05C 8E049C30 */  lw         $a0, -0x63d0($s0)
/* 2BC60 8002B060 8FB00010 */  lw         $s0, 0x10($sp)
/* 2BC64 8002B064 AC620024 */  sw         $v0, 0x24($v1)
/* 2BC68 8002B068 A0800029 */  sb         $zero, 0x29($a0)
/* 2BC6C 8002B06C 03E00008 */  jr         $ra
/* 2BC70 8002B070 27BD0018 */   addiu     $sp, $sp, 0x18

glabel draw_sundail
/* 2BC74 8002B074 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* 2BC78 8002B078 AFB40078 */  sw         $s4, 0x78($sp)
/* 2BC7C 8002B07C AFBF008C */  sw         $ra, 0x8c($sp)
/* 2BC80 8002B080 AFBE0088 */  sw         $fp, 0x88($sp)
/* 2BC84 8002B084 AFB70084 */  sw         $s7, 0x84($sp)
/* 2BC88 8002B088 AFB60080 */  sw         $s6, 0x80($sp)
/* 2BC8C 8002B08C AFB5007C */  sw         $s5, 0x7c($sp)
/* 2BC90 8002B090 AFB30074 */  sw         $s3, 0x74($sp)
/* 2BC94 8002B094 AFB20070 */  sw         $s2, 0x70($sp)
/* 2BC98 8002B098 AFB1006C */  sw         $s1, 0x6c($sp)
/* 2BC9C 8002B09C AFB00068 */  sw         $s0, 0x68($sp)
/* 2BCA0 8002B0A0 F7BC00B0 */  sdc1       $f28, 0xb0($sp)
/* 2BCA4 8002B0A4 F7BA00A8 */  sdc1       $f26, 0xa8($sp)
/* 2BCA8 8002B0A8 F7B800A0 */  sdc1       $f24, 0xa0($sp)
/* 2BCAC 8002B0AC F7B60098 */  sdc1       $f22, 0x98($sp)
/* 2BCB0 8002B0B0 F7B40090 */  sdc1       $f20, 0x90($sp)
/* 2BCB4 8002B0B4 0C0025B4 */  jal        get_hres
/* 2BCB8 8002B0B8 0080A021 */   addu      $s4, $a0, $zero
/* 2BCBC 8002B0BC 0C0025B7 */  jal        get_vres
/* 2BCC0 8002B0C0 00408021 */   addu      $s0, $v0, $zero
/* 2BCC4 8002B0C4 02802021 */  addu       $a0, $s4, $zero
/* 2BCC8 8002B0C8 24050006 */  addiu      $a1, $zero, 6
/* 2BCCC 8002B0CC 02003021 */  addu       $a2, $s0, $zero
/* 2BCD0 8002B0D0 0C0290ED */  jal        rsp_func
/* 2BCD4 8002B0D4 00403821 */   addu      $a3, $v0, $zero
/* 2BCD8 8002B0D8 3C04800E */  lui        $a0, %hi(gGlobals)
/* 2BCDC 8002B0DC 248368A8 */  addiu      $v1, $a0, %lo(gGlobals)
/* 2BCE0 8002B0E0 C462203C */  lwc1       $f2, 0x203c($v1)
/* 2BCE4 8002B0E4 3C01800E */  lui        $at, %hi(D_800DA4A4)
/* 2BCE8 8002B0E8 C420A4A4 */  lwc1       $f0, %lo(D_800DA4A4)($at)
/* 2BCEC 8002B0EC 46001002 */  mul.s      $f0, $f2, $f0
/* 2BCF0 8002B0F0 0040A021 */  addu       $s4, $v0, $zero
/* 2BCF4 8002B0F4 3C01800E */  lui        $at, %hi(D_800DA4A8)
/* 2BCF8 8002B0F8 C422A4A8 */  lwc1       $f2, %lo(D_800DA4A8)($at)
/* 2BCFC 8002B0FC 4600103E */  c.le.s     $f2, $f0
/* 2BD00 8002B100 00000000 */  nop
/* 2BD04 8002B104 45010005 */  bc1t       .L8002B11C
/* 2BD08 8002B108 0080B021 */   addu      $s6, $a0, $zero
/* 2BD0C 8002B10C 4600008D */  trunc.w.s  $f2, $f0
/* 2BD10 8002B110 44031000 */  mfc1       $v1, $f2
/* 2BD14 8002B114 0800AC4D */  j          .L8002B134
/* 2BD18 8002B118 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B11C:
/* 2BD1C 8002B11C 46020001 */  sub.s      $f0, $f0, $f2
/* 2BD20 8002B120 4600008D */  trunc.w.s  $f2, $f0
/* 2BD24 8002B124 44031000 */  mfc1       $v1, $f2
/* 2BD28 8002B128 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BD2C 8002B12C 00621825 */  or         $v1, $v1, $v0
/* 2BD30 8002B130 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B134:
/* 2BD34 8002B134 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BD38 8002B138 3C01800E */  lui        $at, %hi(D_800DA4AC)
/* 2BD3C 8002B13C C420A4AC */  lwc1       $f0, %lo(D_800DA4AC)($at)
/* 2BD40 8002B140 46001002 */  mul.s      $f0, $f2, $f0
/* 2BD44 8002B144 3C01800E */  lui        $at, %hi(D_800DA4B0)
/* 2BD48 8002B148 C422A4B0 */  lwc1       $f2, %lo(D_800DA4B0)($at)
/* 2BD4C 8002B14C 4600103E */  c.le.s     $f2, $f0
/* 2BD50 8002B150 00000000 */  nop
/* 2BD54 8002B154 45010005 */  bc1t       .L8002B16C
/* 2BD58 8002B158 307500FF */   andi      $s5, $v1, 0xff
/* 2BD5C 8002B15C 4600008D */  trunc.w.s  $f2, $f0
/* 2BD60 8002B160 44031000 */  mfc1       $v1, $f2
/* 2BD64 8002B164 0800AC61 */  j          .L8002B184
/* 2BD68 8002B168 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B16C:
/* 2BD6C 8002B16C 46020001 */  sub.s      $f0, $f0, $f2
/* 2BD70 8002B170 4600008D */  trunc.w.s  $f2, $f0
/* 2BD74 8002B174 44031000 */  mfc1       $v1, $f2
/* 2BD78 8002B178 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BD7C 8002B17C 00621825 */  or         $v1, $v1, $v0
/* 2BD80 8002B180 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B184:
/* 2BD84 8002B184 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BD88 8002B188 3C01800E */  lui        $at, %hi(D_800DA4B4)
/* 2BD8C 8002B18C C420A4B4 */  lwc1       $f0, %lo(D_800DA4B4)($at)
/* 2BD90 8002B190 46001002 */  mul.s      $f0, $f2, $f0
/* 2BD94 8002B194 3C01800E */  lui        $at, %hi(D_800DA4B8)
/* 2BD98 8002B198 C422A4B8 */  lwc1       $f2, %lo(D_800DA4B8)($at)
/* 2BD9C 8002B19C 4600103E */  c.le.s     $f2, $f0
/* 2BDA0 8002B1A0 00000000 */  nop
/* 2BDA4 8002B1A4 45010005 */  bc1t       .L8002B1BC
/* 2BDA8 8002B1A8 307300FF */   andi      $s3, $v1, 0xff
/* 2BDAC 8002B1AC 4600008D */  trunc.w.s  $f2, $f0
/* 2BDB0 8002B1B0 44031000 */  mfc1       $v1, $f2
/* 2BDB4 8002B1B4 0800AC75 */  j          .L8002B1D4
/* 2BDB8 8002B1B8 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B1BC:
/* 2BDBC 8002B1BC 46020001 */  sub.s      $f0, $f0, $f2
/* 2BDC0 8002B1C0 4600008D */  trunc.w.s  $f2, $f0
/* 2BDC4 8002B1C4 44031000 */  mfc1       $v1, $f2
/* 2BDC8 8002B1C8 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BDCC 8002B1CC 00621825 */  or         $v1, $v1, $v0
/* 2BDD0 8002B1D0 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B1D4:
/* 2BDD4 8002B1D4 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BDD8 8002B1D8 3C01800E */  lui        $at, %hi(D_800DA4BC)
/* 2BDDC 8002B1DC C420A4BC */  lwc1       $f0, %lo(D_800DA4BC)($at)
/* 2BDE0 8002B1E0 46001002 */  mul.s      $f0, $f2, $f0
/* 2BDE4 8002B1E4 3C01800E */  lui        $at, %hi(D_800DA4C0)
/* 2BDE8 8002B1E8 C422A4C0 */  lwc1       $f2, %lo(D_800DA4C0)($at)
/* 2BDEC 8002B1EC 4600103E */  c.le.s     $f2, $f0
/* 2BDF0 8002B1F0 00000000 */  nop
/* 2BDF4 8002B1F4 45010005 */  bc1t       .L8002B20C
/* 2BDF8 8002B1F8 307200FF */   andi      $s2, $v1, 0xff
/* 2BDFC 8002B1FC 4600008D */  trunc.w.s  $f2, $f0
/* 2BE00 8002B200 44031000 */  mfc1       $v1, $f2
/* 2BE04 8002B204 0800AC89 */  j          .L8002B224
/* 2BE08 8002B208 307100FF */   andi      $s1, $v1, 0xff
.L8002B20C:
/* 2BE0C 8002B20C 46020001 */  sub.s      $f0, $f0, $f2
/* 2BE10 8002B210 4600008D */  trunc.w.s  $f2, $f0
/* 2BE14 8002B214 44031000 */  mfc1       $v1, $f2
/* 2BE18 8002B218 3C028000 */  lui        $v0, 0x8000
/* 2BE1C 8002B21C 00621825 */  or         $v1, $v1, $v0
/* 2BE20 8002B220 307100FF */  andi       $s1, $v1, 0xff
.L8002B224:
/* 2BE24 8002B224 3C10800F */  lui        $s0, %hi(sundail_pointer)
/* 2BE28 8002B228 3C064198 */  lui        $a2, 0x4198
/* 2BE2C 8002B22C 3C074329 */  lui        $a3, 0x4329
/* 2BE30 8002B230 8E029C30 */  lw         $v0, %lo(sundail_pointer)($s0)
/* 2BE34 8002B234 3C01800E */  lui        $at, %hi(D_800DA4C4)
/* 2BE38 8002B238 C420A4C4 */  lwc1       $f0, %lo(D_800DA4C4)($at)
/* 2BE3C 8002B23C 02802021 */  addu       $a0, $s4, $zero
/* 2BE40 8002B240 AFB50018 */  sw         $s5, 0x18($sp)
/* 2BE44 8002B244 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2BE48 8002B248 AFB20020 */  sw         $s2, 0x20($sp)
/* 2BE4C 8002B24C AFB10024 */  sw         $s1, 0x24($sp)
/* 2BE50 8002B250 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2BE54 8002B254 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2BE58 8002B258 8C450000 */  lw         $a1, ($v0)
/* 2BE5C 8002B25C 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2BE60 8002B260 3C1E800F */   lui       $fp, 0x800f
/* 2BE64 8002B264 8E039C30 */  lw         $v1, -0x63d0($s0)
/* 2BE68 8002B268 0040A021 */  addu       $s4, $v0, $zero
/* 2BE6C 8002B26C 90620029 */  lbu        $v0, 0x29($v1)
/* 2BE70 8002B270 14400087 */  bnez       $v0, .L8002B490
/* 2BE74 8002B274 0200B821 */   addu      $s7, $s0, $zero
/* 2BE78 8002B278 26C268A8 */  addiu      $v0, $s6, 0x68a8
/* 2BE7C 8002B27C C442203C */  lwc1       $f2, 0x203c($v0)
/* 2BE80 8002B280 3C01800E */  lui        $at, %hi(D_800DA4C8)
/* 2BE84 8002B284 C420A4C8 */  lwc1       $f0, %lo(D_800DA4C8)($at)
/* 2BE88 8002B288 46001002 */  mul.s      $f0, $f2, $f0
/* 2BE8C 8002B28C 3C01800E */  lui        $at, %hi(D_800DA4CC)
/* 2BE90 8002B290 C422A4CC */  lwc1       $f2, %lo(D_800DA4CC)($at)
/* 2BE94 8002B294 4600103E */  c.le.s     $f2, $f0
/* 2BE98 8002B298 00000000 */  nop
/* 2BE9C 8002B29C 45030005 */  bc1tl      .L8002B2B4
/* 2BEA0 8002B2A0 46020001 */   sub.s     $f0, $f0, $f2
/* 2BEA4 8002B2A4 4600008D */  trunc.w.s  $f2, $f0
/* 2BEA8 8002B2A8 44031000 */  mfc1       $v1, $f2
/* 2BEAC 8002B2AC 0800ACB2 */  j          .L8002B2C8
/* 2BEB0 8002B2B0 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B2B4:
/* 2BEB4 8002B2B4 4600008D */  trunc.w.s  $f2, $f0
/* 2BEB8 8002B2B8 44031000 */  mfc1       $v1, $f2
/* 2BEBC 8002B2BC 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BEC0 8002B2C0 00621825 */  or         $v1, $v1, $v0
/* 2BEC4 8002B2C4 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B2C8:
/* 2BEC8 8002B2C8 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BECC 8002B2CC 3C01800E */  lui        $at, %hi(D_800DA4D0)
/* 2BED0 8002B2D0 C420A4D0 */  lwc1       $f0, %lo(D_800DA4D0)($at)
/* 2BED4 8002B2D4 46001002 */  mul.s      $f0, $f2, $f0
/* 2BED8 8002B2D8 3C01800E */  lui        $at, %hi(D_800DA4D4)
/* 2BEDC 8002B2DC C422A4D4 */  lwc1       $f2, %lo(D_800DA4D4)($at)
/* 2BEE0 8002B2E0 4600103E */  c.le.s     $f2, $f0
/* 2BEE4 8002B2E4 00000000 */  nop
/* 2BEE8 8002B2E8 45010005 */  bc1t       .L8002B300
/* 2BEEC 8002B2EC 307500FF */   andi      $s5, $v1, 0xff
/* 2BEF0 8002B2F0 4600008D */  trunc.w.s  $f2, $f0
/* 2BEF4 8002B2F4 44031000 */  mfc1       $v1, $f2
/* 2BEF8 8002B2F8 0800ACC6 */  j          .L8002B318
/* 2BEFC 8002B2FC 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B300:
/* 2BF00 8002B300 46020001 */  sub.s      $f0, $f0, $f2
/* 2BF04 8002B304 4600008D */  trunc.w.s  $f2, $f0
/* 2BF08 8002B308 44031000 */  mfc1       $v1, $f2
/* 2BF0C 8002B30C 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BF10 8002B310 00621825 */  or         $v1, $v1, $v0
/* 2BF14 8002B314 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B318:
/* 2BF18 8002B318 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BF1C 8002B31C 3C01800E */  lui        $at, %hi(D_800DA4D8)
/* 2BF20 8002B320 C420A4D8 */  lwc1       $f0, %lo(D_800DA4D8)($at)
/* 2BF24 8002B324 46001002 */  mul.s      $f0, $f2, $f0
/* 2BF28 8002B328 3C01800E */  lui        $at, %hi(D_800DA4DC)
/* 2BF2C 8002B32C C422A4DC */  lwc1       $f2, %lo(D_800DA4DC)($at)
/* 2BF30 8002B330 4600103E */  c.le.s     $f2, $f0
/* 2BF34 8002B334 00000000 */  nop
/* 2BF38 8002B338 45010005 */  bc1t       .L8002B350
/* 2BF3C 8002B33C 307300FF */   andi      $s3, $v1, 0xff
/* 2BF40 8002B340 4600008D */  trunc.w.s  $f2, $f0
/* 2BF44 8002B344 44031000 */  mfc1       $v1, $f2
/* 2BF48 8002B348 0800ACDA */  j          .L8002B368
/* 2BF4C 8002B34C 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B350:
/* 2BF50 8002B350 46020001 */  sub.s      $f0, $f0, $f2
/* 2BF54 8002B354 4600008D */  trunc.w.s  $f2, $f0
/* 2BF58 8002B358 44031000 */  mfc1       $v1, $f2
/* 2BF5C 8002B35C 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2BF60 8002B360 00621825 */  or         $v1, $v1, $v0
/* 2BF64 8002B364 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B368:
/* 2BF68 8002B368 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2BF6C 8002B36C 3C01800E */  lui        $at, %hi(D_800DA4E0)
/* 2BF70 8002B370 C420A4E0 */  lwc1       $f0, %lo(D_800DA4E0)($at)
/* 2BF74 8002B374 46001002 */  mul.s      $f0, $f2, $f0
/* 2BF78 8002B378 3C01800E */  lui        $at, %hi(D_800DA4E4)
/* 2BF7C 8002B37C C422A4E4 */  lwc1       $f2, %lo(D_800DA4E4)($at)
/* 2BF80 8002B380 4600103E */  c.le.s     $f2, $f0
/* 2BF84 8002B384 00000000 */  nop
/* 2BF88 8002B388 45010005 */  bc1t       .L8002B3A0
/* 2BF8C 8002B38C 307200FF */   andi      $s2, $v1, 0xff
/* 2BF90 8002B390 4600008D */  trunc.w.s  $f2, $f0
/* 2BF94 8002B394 44031000 */  mfc1       $v1, $f2
/* 2BF98 8002B398 0800ACEE */  j          .L8002B3B8
/* 2BF9C 8002B39C 307100FF */   andi      $s1, $v1, 0xff
.L8002B3A0:
/* 2BFA0 8002B3A0 46020001 */  sub.s      $f0, $f0, $f2
/* 2BFA4 8002B3A4 4600008D */  trunc.w.s  $f2, $f0
/* 2BFA8 8002B3A8 44031000 */  mfc1       $v1, $f2
/* 2BFAC 8002B3AC 3C028000 */  lui        $v0, 0x8000
/* 2BFB0 8002B3B0 00621825 */  or         $v1, $v1, $v0
/* 2BFB4 8002B3B4 307100FF */  andi       $s1, $v1, 0xff
.L8002B3B8:
/* 2BFB8 8002B3B8 27A50028 */  addiu      $a1, $sp, 0x28
/* 2BFBC 8002B3BC 3C10800F */  lui        $s0, %hi(TerrainPointer)
/* 2BFC0 8002B3C0 8E041BBC */  lw         $a0, %lo(TerrainPointer)($s0)
/* 2BFC4 8002B3C4 0C0213E5 */  jal        get_ingame_calendar
/* 2BFC8 8002B3C8 0200F021 */   addu      $fp, $s0, $zero
/* 2BFCC 8002B3CC 93A20029 */  lbu        $v0, 0x29($sp)
/* 2BFD0 8002B3D0 8E031BBC */  lw         $v1, 0x1bbc($s0)
/* 2BFD4 8002B3D4 30420003 */  andi       $v0, $v0, 3
/* 2BFD8 8002B3D8 00022042 */  srl        $a0, $v0, 1
/* 2BFDC 8002B3DC 90630003 */  lbu        $v1, 3($v1)
/* 2BFE0 8002B3E0 24020001 */  addiu      $v0, $zero, 1
/* 2BFE4 8002B3E4 10620010 */  beq        $v1, $v0, .L8002B428
/* 2BFE8 8002B3E8 00002821 */   addu      $a1, $zero, $zero
/* 2BFEC 8002B3EC 28620002 */  slti       $v0, $v1, 2
/* 2BFF0 8002B3F0 10400005 */  beqz       $v0, .L8002B408
/* 2BFF4 8002B3F4 24020002 */   addiu     $v0, $zero, 2
/* 2BFF8 8002B3F8 10600009 */  beqz       $v1, .L8002B420
/* 2BFFC 8002B3FC 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C000 8002B400 0800AD17 */  j          .L8002B45C
/* 2C004 8002B404 00000000 */   nop
.L8002B408:
/* 2C008 8002B408 1062000D */  beq        $v1, $v0, .L8002B440
/* 2C00C 8002B40C 24020003 */   addiu     $v0, $zero, 3
/* 2C010 8002B410 10620011 */  beq        $v1, $v0, .L8002B458
/* 2C014 8002B414 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C018 8002B418 0800AD17 */  j          .L8002B45C
/* 2C01C 8002B41C 00000000 */   nop
.L8002B420:
/* 2C020 8002B420 0800AD17 */  j          .L8002B45C
/* 2C024 8002B424 8C450008 */   lw        $a1, 8($v0)
.L8002B428:
/* 2C028 8002B428 14800003 */  bnez       $a0, .L8002B438
/* 2C02C 8002B42C 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C030 8002B430 0800AD17 */  j          .L8002B45C
/* 2C034 8002B434 8C45000C */   lw        $a1, 0xc($v0)
.L8002B438:
/* 2C038 8002B438 0800AD17 */  j          .L8002B45C
/* 2C03C 8002B43C 8C450010 */   lw        $a1, 0x10($v0)
.L8002B440:
/* 2C040 8002B440 14800003 */  bnez       $a0, .L8002B450
/* 2C044 8002B444 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C048 8002B448 0800AD17 */  j          .L8002B45C
/* 2C04C 8002B44C 8C450014 */   lw        $a1, 0x14($v0)
.L8002B450:
/* 2C050 8002B450 0800AD17 */  j          .L8002B45C
/* 2C054 8002B454 8C450018 */   lw        $a1, 0x18($v0)
.L8002B458:
/* 2C058 8002B458 8C45001C */  lw         $a1, 0x1c($v0)
.L8002B45C:
/* 2C05C 8002B45C 3C06421C */  lui        $a2, 0x421c
/* 2C060 8002B460 3C07433D */  lui        $a3, 0x433d
/* 2C064 8002B464 3C01800E */  lui        $at, %hi(D_800DA4E8)
/* 2C068 8002B468 C420A4E8 */  lwc1       $f0, %lo(D_800DA4E8)($at)
/* 2C06C 8002B46C 02802021 */  addu       $a0, $s4, $zero
/* 2C070 8002B470 AFB50018 */  sw         $s5, 0x18($sp)
/* 2C074 8002B474 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2C078 8002B478 AFB20020 */  sw         $s2, 0x20($sp)
/* 2C07C 8002B47C AFB10024 */  sw         $s1, 0x24($sp)
/* 2C080 8002B480 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2C084 8002B484 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2C088 8002B488 E7A00014 */   swc1      $f0, 0x14($sp)
/* 2C08C 8002B48C 0040A021 */  addu       $s4, $v0, $zero
.L8002B490:
/* 2C090 8002B490 0C02163D */  jal        get_timeofDay_float
/* 2C094 8002B494 8FC41BBC */   lw        $a0, 0x1bbc($fp)
/* 2C098 8002B498 3C01800E */  lui        $at, %hi(D_800DA4EC)
/* 2C09C 8002B49C C422A4EC */  lwc1       $f2, %lo(D_800DA4EC)($at)
/* 2C0A0 8002B4A0 46020002 */  mul.s      $f0, $f0, $f2
/* 2C0A4 8002B4A4 3C02B60B */  lui        $v0, 0xb60b
/* 2C0A8 8002B4A8 344260B7 */  ori        $v0, $v0, 0x60b7
/* 2C0AC 8002B4AC 4600008D */  trunc.w.s  $f2, $f0
/* 2C0B0 8002B4B0 44051000 */  mfc1       $a1, $f2
/* 2C0B4 8002B4B4 00A20018 */  mult       $a1, $v0
/* 2C0B8 8002B4B8 00051FC3 */  sra        $v1, $a1, 0x1f
/* 2C0BC 8002B4BC 3C01800E */  lui        $at, %hi(D_800DA4F0)
/* 2C0C0 8002B4C0 C420A4F0 */  lwc1       $f0, %lo(D_800DA4F0)($at)
/* 2C0C4 8002B4C4 3C01800E */  lui        $at, %hi(D_800DA4F4)
/* 2C0C8 8002B4C8 C422A4F4 */  lwc1       $f2, %lo(D_800DA4F4)($at)
/* 2C0CC 8002B4CC 00001010 */  mfhi       $v0
/* 2C0D0 8002B4D0 00451021 */  addu       $v0, $v0, $a1
/* 2C0D4 8002B4D4 00021243 */  sra        $v0, $v0, 9
/* 2C0D8 8002B4D8 00431023 */  subu       $v0, $v0, $v1
/* 2C0DC 8002B4DC 00022040 */  sll        $a0, $v0, 1
/* 2C0E0 8002B4E0 00822021 */  addu       $a0, $a0, $v0
/* 2C0E4 8002B4E4 00041900 */  sll        $v1, $a0, 4
/* 2C0E8 8002B4E8 00641823 */  subu       $v1, $v1, $a0
/* 2C0EC 8002B4EC 00031900 */  sll        $v1, $v1, 4
/* 2C0F0 8002B4F0 00A32823 */  subu       $a1, $a1, $v1
/* 2C0F4 8002B4F4 4485A000 */  mtc1       $a1, $f20
/* 2C0F8 8002B4F8 4680A520 */  cvt.s.w    $f20, $f20
/* 2C0FC 8002B4FC 4600A583 */  div.s      $f22, $f20, $f0
/* 2C100 8002B500 4602A502 */  mul.s      $f20, $f20, $f2
/* 2C104 8002B504 4480D000 */  mtc1       $zero, $f26
/* 2C108 8002B508 0C03328C */  jal        __sinf
/* 2C10C 8002B50C 4600A306 */   mov.s     $f12, $f20
/* 2C110 8002B510 4600A306 */  mov.s      $f12, $f20
/* 2C114 8002B514 0C02FB50 */  jal        __cosf
/* 2C118 8002B518 46000706 */   mov.s     $f28, $f0
/* 2C11C 8002B51C 4600D506 */  mov.s      $f20, $f26
/* 2C120 8002B520 3C01800E */  lui        $at, %hi(D_800DA4F8)
/* 2C124 8002B524 C422A4F8 */  lwc1       $f2, %lo(D_800DA4F8)($at)
/* 2C128 8002B528 4616103C */  c.lt.s     $f2, $f22
/* 2C12C 8002B52C 00000000 */  nop
/* 2C130 8002B530 45000047 */  bc1f       .L8002B650
/* 2C134 8002B534 46000606 */   mov.s     $f24, $f0
/* 2C138 8002B538 3C01800E */  lui        $at, %hi(D_800DA4FC)
/* 2C13C 8002B53C C420A4FC */  lwc1       $f0, %lo(D_800DA4FC)($at)
/* 2C140 8002B540 4600B03C */  c.lt.s     $f22, $f0
/* 2C144 8002B544 00000000 */  nop
/* 2C148 8002B548 45000041 */  bc1f       .L8002B650
/* 2C14C 8002B54C 26C268A8 */   addiu     $v0, $s6, 0x68a8
/* 2C150 8002B550 C442203C */  lwc1       $f2, 0x203c($v0)
/* 2C154 8002B554 3C01800E */  lui        $at, %hi(D_800DA500)
/* 2C158 8002B558 C420A500 */  lwc1       $f0, %lo(D_800DA500)($at)
/* 2C15C 8002B55C 46001002 */  mul.s      $f0, $f2, $f0
/* 2C160 8002B560 3C01800E */  lui        $at, %hi(D_800DA504)
/* 2C164 8002B564 C422A504 */  lwc1       $f2, %lo(D_800DA504)($at)
/* 2C168 8002B568 4600103E */  c.le.s     $f2, $f0
/* 2C16C 8002B56C 00000000 */  nop
/* 2C170 8002B570 45030005 */  bc1tl      .L8002B588
/* 2C174 8002B574 46020001 */   sub.s     $f0, $f0, $f2
/* 2C178 8002B578 4600008D */  trunc.w.s  $f2, $f0
/* 2C17C 8002B57C 44031000 */  mfc1       $v1, $f2
/* 2C180 8002B580 0800AD67 */  j          .L8002B59C
/* 2C184 8002B584 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B588:
/* 2C188 8002B588 4600008D */  trunc.w.s  $f2, $f0
/* 2C18C 8002B58C 44031000 */  mfc1       $v1, $f2
/* 2C190 8002B590 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2C194 8002B594 00621825 */  or         $v1, $v1, $v0
/* 2C198 8002B598 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B59C:
/* 2C19C 8002B59C C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2C1A0 8002B5A0 3C01800E */  lui        $at, %hi(D_800DA508)
/* 2C1A4 8002B5A4 C420A508 */  lwc1       $f0, %lo(D_800DA508)($at)
/* 2C1A8 8002B5A8 46001002 */  mul.s      $f0, $f2, $f0
/* 2C1AC 8002B5AC 3C01800E */  lui        $at, %hi(D_800DA50C)
/* 2C1B0 8002B5B0 C422A50C */  lwc1       $f2, %lo(D_800DA50C)($at)
/* 2C1B4 8002B5B4 4600103E */  c.le.s     $f2, $f0
/* 2C1B8 8002B5B8 00000000 */  nop
/* 2C1BC 8002B5BC 45010005 */  bc1t       .L8002B5D4
/* 2C1C0 8002B5C0 307500FF */   andi      $s5, $v1, 0xff
/* 2C1C4 8002B5C4 4600008D */  trunc.w.s  $f2, $f0
/* 2C1C8 8002B5C8 44031000 */  mfc1       $v1, $f2
/* 2C1CC 8002B5CC 0800AD7B */  j          .L8002B5EC
/* 2C1D0 8002B5D0 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B5D4:
/* 2C1D4 8002B5D4 46020001 */  sub.s      $f0, $f0, $f2
/* 2C1D8 8002B5D8 4600008D */  trunc.w.s  $f2, $f0
/* 2C1DC 8002B5DC 44031000 */  mfc1       $v1, $f2
/* 2C1E0 8002B5E0 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2C1E4 8002B5E4 00621825 */  or         $v1, $v1, $v0
/* 2C1E8 8002B5E8 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B5EC:
/* 2C1EC 8002B5EC C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2C1F0 8002B5F0 3C01800E */  lui        $at, %hi(D_800DA510)
/* 2C1F4 8002B5F4 C420A510 */  lwc1       $f0, %lo(D_800DA510)($at)
/* 2C1F8 8002B5F8 46001002 */  mul.s      $f0, $f2, $f0
/* 2C1FC 8002B5FC 3C01800E */  lui        $at, %hi(D_800DA514)
/* 2C200 8002B600 C422A514 */  lwc1       $f2, %lo(D_800DA514)($at)
/* 2C204 8002B604 4600103E */  c.le.s     $f2, $f0
/* 2C208 8002B608 00000000 */  nop
/* 2C20C 8002B60C 45010005 */  bc1t       .L8002B624
/* 2C210 8002B610 307300FF */   andi      $s3, $v1, 0xff
/* 2C214 8002B614 4600008D */  trunc.w.s  $f2, $f0
/* 2C218 8002B618 44031000 */  mfc1       $v1, $f2
/* 2C21C 8002B61C 0800AD8F */  j          .L8002B63C
/* 2C220 8002B620 307200FF */   andi      $s2, $v1, 0xff
.L8002B624:
/* 2C224 8002B624 46020001 */  sub.s      $f0, $f0, $f2
/* 2C228 8002B628 4600008D */  trunc.w.s  $f2, $f0
/* 2C22C 8002B62C 44031000 */  mfc1       $v1, $f2
/* 2C230 8002B630 3C028000 */  lui        $v0, 0x8000
/* 2C234 8002B634 00621825 */  or         $v1, $v1, $v0
/* 2C238 8002B638 307200FF */  andi       $s2, $v1, 0xff
.L8002B63C:
/* 2C23C 8002B63C 3C01800E */  lui        $at, %hi(D_800DA518)
/* 2C240 8002B640 C434A518 */  lwc1       $f20, %lo(D_800DA518)($at)
/* 2C244 8002B644 4480D000 */  mtc1       $zero, $f26
/* 2C248 8002B648 0800AE97 */  j          .L8002BA5C
/* 2C24C 8002B64C 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B650:
/* 2C250 8002B650 3C01800E */  lui        $at, %hi(D_800DA51C)
/* 2C254 8002B654 C420A51C */  lwc1       $f0, %lo(D_800DA51C)($at)
/* 2C258 8002B658 4616003C */  c.lt.s     $f0, $f22
/* 2C25C 8002B65C 00000000 */  nop
/* 2C260 8002B660 45010007 */  bc1t       .L8002B680
/* 2C264 8002B664 26C268A8 */   addiu     $v0, $s6, 0x68a8
/* 2C268 8002B668 3C01800E */  lui        $at, %hi(D_800DA520)
/* 2C26C 8002B66C C422A520 */  lwc1       $f2, %lo(D_800DA520)($at)
/* 2C270 8002B670 4602B03C */  c.lt.s     $f22, $f2
/* 2C274 8002B674 00000000 */  nop
/* 2C278 8002B678 45000041 */  bc1f       .L8002B780
/* 2C27C 8002B67C 00000000 */   nop
.L8002B680:
/* 2C280 8002B680 C442203C */  lwc1       $f2, 0x203c($v0)
/* 2C284 8002B684 3C01800E */  lui        $at, %hi(D_800DA524)
/* 2C288 8002B688 C420A524 */  lwc1       $f0, %lo(D_800DA524)($at)
/* 2C28C 8002B68C 46001002 */  mul.s      $f0, $f2, $f0
/* 2C290 8002B690 3C01800E */  lui        $at, %hi(D_800DA528)
/* 2C294 8002B694 C422A528 */  lwc1       $f2, %lo(D_800DA528)($at)
/* 2C298 8002B698 4600103E */  c.le.s     $f2, $f0
/* 2C29C 8002B69C 00000000 */  nop
/* 2C2A0 8002B6A0 45030005 */  bc1tl      .L8002B6B8
/* 2C2A4 8002B6A4 46020001 */   sub.s     $f0, $f0, $f2
/* 2C2A8 8002B6A8 4600008D */  trunc.w.s  $f2, $f0
/* 2C2AC 8002B6AC 44031000 */  mfc1       $v1, $f2
/* 2C2B0 8002B6B0 0800ADB3 */  j          .L8002B6CC
/* 2C2B4 8002B6B4 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B6B8:
/* 2C2B8 8002B6B8 4600008D */  trunc.w.s  $f2, $f0
/* 2C2BC 8002B6BC 44031000 */  mfc1       $v1, $f2
/* 2C2C0 8002B6C0 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2C2C4 8002B6C4 00621825 */  or         $v1, $v1, $v0
/* 2C2C8 8002B6C8 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B6CC:
/* 2C2CC 8002B6CC C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2C2D0 8002B6D0 3C01800E */  lui        $at, %hi(D_800DA52C)
/* 2C2D4 8002B6D4 C420A52C */  lwc1       $f0, %lo(D_800DA52C)($at)
/* 2C2D8 8002B6D8 46001002 */  mul.s      $f0, $f2, $f0
/* 2C2DC 8002B6DC 3C01800E */  lui        $at, %hi(D_800DA530)
/* 2C2E0 8002B6E0 C422A530 */  lwc1       $f2, %lo(D_800DA530)($at)
/* 2C2E4 8002B6E4 4600103E */  c.le.s     $f2, $f0
/* 2C2E8 8002B6E8 00000000 */  nop
/* 2C2EC 8002B6EC 45010005 */  bc1t       .L8002B704
/* 2C2F0 8002B6F0 307500FF */   andi      $s5, $v1, 0xff
/* 2C2F4 8002B6F4 4600008D */  trunc.w.s  $f2, $f0
/* 2C2F8 8002B6F8 44031000 */  mfc1       $v1, $f2
/* 2C2FC 8002B6FC 0800ADC7 */  j          .L8002B71C
/* 2C300 8002B700 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B704:
/* 2C304 8002B704 46020001 */  sub.s      $f0, $f0, $f2
/* 2C308 8002B708 4600008D */  trunc.w.s  $f2, $f0
/* 2C30C 8002B70C 44031000 */  mfc1       $v1, $f2
/* 2C310 8002B710 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2C314 8002B714 00621825 */  or         $v1, $v1, $v0
/* 2C318 8002B718 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002B71C:
/* 2C31C 8002B71C C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2C320 8002B720 3C01800E */  lui        $at, %hi(D_800DA534)
/* 2C324 8002B724 C420A534 */  lwc1       $f0, %lo(D_800DA534)($at)
/* 2C328 8002B728 46001002 */  mul.s      $f0, $f2, $f0
/* 2C32C 8002B72C 3C01800E */  lui        $at, %hi(D_800DA538)
/* 2C330 8002B730 C422A538 */  lwc1       $f2, %lo(D_800DA538)($at)
/* 2C334 8002B734 4600103E */  c.le.s     $f2, $f0
/* 2C338 8002B738 00000000 */  nop
/* 2C33C 8002B73C 45010005 */  bc1t       .L8002B754
/* 2C340 8002B740 307300FF */   andi      $s3, $v1, 0xff
/* 2C344 8002B744 4600008D */  trunc.w.s  $f2, $f0
/* 2C348 8002B748 44031000 */  mfc1       $v1, $f2
/* 2C34C 8002B74C 0800ADDB */  j          .L8002B76C
/* 2C350 8002B750 307200FF */   andi      $s2, $v1, 0xff
.L8002B754:
/* 2C354 8002B754 46020001 */  sub.s      $f0, $f0, $f2
/* 2C358 8002B758 4600008D */  trunc.w.s  $f2, $f0
/* 2C35C 8002B75C 44031000 */  mfc1       $v1, $f2
/* 2C360 8002B760 3C028000 */  lui        $v0, 0x8000
/* 2C364 8002B764 00621825 */  or         $v1, $v1, $v0
/* 2C368 8002B768 307200FF */  andi       $s2, $v1, 0xff
.L8002B76C:
/* 2C36C 8002B76C 4480A000 */  mtc1       $zero, $f20
/* 2C370 8002B770 3C01800E */  lui        $at, %hi(D_800DA53C)
/* 2C374 8002B774 C43AA53C */  lwc1       $f26, %lo(D_800DA53C)($at)
/* 2C378 8002B778 0800AE97 */  j          .L8002BA5C
/* 2C37C 8002B77C 26C268A8 */   addiu     $v0, $s6, 0x68a8
.L8002B780:
/* 2C380 8002B780 4616103E */  c.le.s     $f2, $f22
/* 2C384 8002B784 00000000 */  nop
/* 2C388 8002B788 45000057 */  bc1f       .L8002B8E8
/* 2C38C 8002B78C 00000000 */   nop
/* 2C390 8002B790 3C01800E */  lui        $at, %hi(D_800DA540)
/* 2C394 8002B794 C420A540 */  lwc1       $f0, %lo(D_800DA540)($at)
/* 2C398 8002B798 4600B03E */  c.le.s     $f22, $f0
/* 2C39C 8002B79C 00000000 */  nop
/* 2C3A0 8002B7A0 45000051 */  bc1f       .L8002B8E8
/* 2C3A4 8002B7A4 00000000 */   nop
/* 2C3A8 8002B7A8 4602B001 */  sub.s      $f0, $f22, $f2
/* 2C3AC 8002B7AC 3C01800E */  lui        $at, %hi(D_800DA544)
/* 2C3B0 8002B7B0 C422A544 */  lwc1       $f2, %lo(D_800DA544)($at)
/* 2C3B4 8002B7B4 46020002 */  mul.s      $f0, $f0, $f2
/* 2C3B8 8002B7B8 3C01800E */  lui        $at, %hi(D_800DA548)
/* 2C3BC 8002B7BC C424A548 */  lwc1       $f4, %lo(D_800DA548)($at)
/* 2C3C0 8002B7C0 46040000 */  add.s      $f0, $f0, $f4
/* 2C3C4 8002B7C4 3C01800E */  lui        $at, %hi(D_800DA54C)
/* 2C3C8 8002B7C8 C422A54C */  lwc1       $f2, %lo(D_800DA54C)($at)
/* 2C3CC 8002B7CC 4600103E */  c.le.s     $f2, $f0
/* 2C3D0 8002B7D0 00000000 */  nop
/* 2C3D4 8002B7D4 45030005 */  bc1tl      .L8002B7EC
/* 2C3D8 8002B7D8 46020001 */   sub.s     $f0, $f0, $f2
/* 2C3DC 8002B7DC 4600008D */  trunc.w.s  $f2, $f0
/* 2C3E0 8002B7E0 44031000 */  mfc1       $v1, $f2
/* 2C3E4 8002B7E4 0800ADFF */  j          .L8002B7FC
/* 2C3E8 8002B7E8 00000000 */   nop
.L8002B7EC:
/* 2C3EC 8002B7EC 4600008D */  trunc.w.s  $f2, $f0
/* 2C3F0 8002B7F0 44031000 */  mfc1       $v1, $f2
/* 2C3F4 8002B7F4 3C028000 */  lui        $v0, 0x8000
/* 2C3F8 8002B7F8 00621825 */  or         $v1, $v1, $v0
.L8002B7FC:
/* 2C3FC 8002B7FC 3C01800E */  lui        $at, %hi(D_800DA550)
/* 2C400 8002B800 C420A550 */  lwc1       $f0, %lo(D_800DA550)($at)
/* 2C404 8002B804 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C408 8002B808 3C01800E */  lui        $at, %hi(D_800DA554)
/* 2C40C 8002B80C C422A554 */  lwc1       $f2, %lo(D_800DA554)($at)
/* 2C410 8002B810 46020002 */  mul.s      $f0, $f0, $f2
/* 2C414 8002B814 3C01800E */  lui        $at, %hi(D_800DA558)
/* 2C418 8002B818 C424A558 */  lwc1       $f4, %lo(D_800DA558)($at)
/* 2C41C 8002B81C 46040000 */  add.s      $f0, $f0, $f4
/* 2C420 8002B820 3C01800E */  lui        $at, %hi(D_800DA55C)
/* 2C424 8002B824 C422A55C */  lwc1       $f2, %lo(D_800DA55C)($at)
/* 2C428 8002B828 4600103E */  c.le.s     $f2, $f0
/* 2C42C 8002B82C 00000000 */  nop
/* 2C430 8002B830 45010005 */  bc1t       .L8002B848
/* 2C434 8002B834 307500FF */   andi      $s5, $v1, 0xff
/* 2C438 8002B838 4600008D */  trunc.w.s  $f2, $f0
/* 2C43C 8002B83C 44031000 */  mfc1       $v1, $f2
/* 2C440 8002B840 0800AE17 */  j          .L8002B85C
/* 2C444 8002B844 00000000 */   nop
.L8002B848:
/* 2C448 8002B848 46020001 */  sub.s      $f0, $f0, $f2
/* 2C44C 8002B84C 4600008D */  trunc.w.s  $f2, $f0
/* 2C450 8002B850 44031000 */  mfc1       $v1, $f2
/* 2C454 8002B854 3C028000 */  lui        $v0, 0x8000
/* 2C458 8002B858 00621825 */  or         $v1, $v1, $v0
.L8002B85C:
/* 2C45C 8002B85C 3C01800E */  lui        $at, %hi(D_800DA560)
/* 2C460 8002B860 C420A560 */  lwc1       $f0, %lo(D_800DA560)($at)
/* 2C464 8002B864 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C468 8002B868 3C01800E */  lui        $at, %hi(D_800DA564)
/* 2C46C 8002B86C C422A564 */  lwc1       $f2, %lo(D_800DA564)($at)
/* 2C470 8002B870 46020002 */  mul.s      $f0, $f0, $f2
/* 2C474 8002B874 3C01800E */  lui        $at, %hi(D_800DA568)
/* 2C478 8002B878 C424A568 */  lwc1       $f4, %lo(D_800DA568)($at)
/* 2C47C 8002B87C 46002001 */  sub.s      $f0, $f4, $f0
/* 2C480 8002B880 3C01800E */  lui        $at, %hi(D_800DA56C)
/* 2C484 8002B884 C424A56C */  lwc1       $f4, %lo(D_800DA56C)($at)
/* 2C488 8002B888 4600203E */  c.le.s     $f4, $f0
/* 2C48C 8002B88C 00000000 */  nop
/* 2C490 8002B890 45010005 */  bc1t       .L8002B8A8
/* 2C494 8002B894 307300FF */   andi      $s3, $v1, 0xff
/* 2C498 8002B898 4600008D */  trunc.w.s  $f2, $f0
/* 2C49C 8002B89C 44031000 */  mfc1       $v1, $f2
/* 2C4A0 8002B8A0 0800AE2F */  j          .L8002B8BC
/* 2C4A4 8002B8A4 00000000 */   nop
.L8002B8A8:
/* 2C4A8 8002B8A8 46040001 */  sub.s      $f0, $f0, $f4
/* 2C4AC 8002B8AC 4600008D */  trunc.w.s  $f2, $f0
/* 2C4B0 8002B8B0 44031000 */  mfc1       $v1, $f2
/* 2C4B4 8002B8B4 3C028000 */  lui        $v0, 0x8000
/* 2C4B8 8002B8B8 00621825 */  or         $v1, $v1, $v0
.L8002B8BC:
/* 2C4BC 8002B8BC 3C01800E */  lui        $at, %hi(D_800DA570)
/* 2C4C0 8002B8C0 C420A570 */  lwc1       $f0, %lo(D_800DA570)($at)
/* 2C4C4 8002B8C4 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C4C8 8002B8C8 3C01800E */  lui        $at, %hi(D_800DA574)
/* 2C4CC 8002B8CC C422A574 */  lwc1       $f2, %lo(D_800DA574)($at)
/* 2C4D0 8002B8D0 46020502 */  mul.s      $f20, $f0, $f2
/* 2C4D4 8002B8D4 3C01800E */  lui        $at, %hi(D_800DA578)
/* 2C4D8 8002B8D8 C420A578 */  lwc1       $f0, %lo(D_800DA578)($at)
/* 2C4DC 8002B8DC 307200FF */  andi       $s2, $v1, 0xff
/* 2C4E0 8002B8E0 0800AE96 */  j          .L8002BA58
/* 2C4E4 8002B8E4 46140681 */   sub.s     $f26, $f0, $f20
.L8002B8E8:
/* 2C4E8 8002B8E8 3C01800E */  lui        $at, %hi(D_800DA57C)
/* 2C4EC 8002B8EC C422A57C */  lwc1       $f2, %lo(D_800DA57C)($at)
/* 2C4F0 8002B8F0 4616103E */  c.le.s     $f2, $f22
/* 2C4F4 8002B8F4 00000000 */  nop
/* 2C4F8 8002B8F8 45000058 */  bc1f       .L8002BA5C
/* 2C4FC 8002B8FC 26C268A8 */   addiu     $v0, $s6, 0x68a8
/* 2C500 8002B900 3C01800E */  lui        $at, %hi(D_800DA580)
/* 2C504 8002B904 C420A580 */  lwc1       $f0, %lo(D_800DA580)($at)
/* 2C508 8002B908 4600B03E */  c.le.s     $f22, $f0
/* 2C50C 8002B90C 00000000 */  nop
/* 2C510 8002B910 45020053 */  bc1fl      .L8002BA60
/* 2C514 8002B914 C442203C */   lwc1      $f2, 0x203c($v0)
/* 2C518 8002B918 4602B001 */  sub.s      $f0, $f22, $f2
/* 2C51C 8002B91C 3C01800E */  lui        $at, %hi(D_800DA584)
/* 2C520 8002B920 C422A584 */  lwc1       $f2, %lo(D_800DA584)($at)
/* 2C524 8002B924 46020002 */  mul.s      $f0, $f0, $f2
/* 2C528 8002B928 3C01800E */  lui        $at, %hi(D_800DA588)
/* 2C52C 8002B92C C424A588 */  lwc1       $f4, %lo(D_800DA588)($at)
/* 2C530 8002B930 46002001 */  sub.s      $f0, $f4, $f0
/* 2C534 8002B934 3C01800E */  lui        $at, %hi(D_800DA58C)
/* 2C538 8002B938 C424A58C */  lwc1       $f4, %lo(D_800DA58C)($at)
/* 2C53C 8002B93C 4600203E */  c.le.s     $f4, $f0
/* 2C540 8002B940 00000000 */  nop
/* 2C544 8002B944 45030005 */  bc1tl      .L8002B95C
/* 2C548 8002B948 46040001 */   sub.s     $f0, $f0, $f4
/* 2C54C 8002B94C 4600008D */  trunc.w.s  $f2, $f0
/* 2C550 8002B950 44031000 */  mfc1       $v1, $f2
/* 2C554 8002B954 0800AE5B */  j          .L8002B96C
/* 2C558 8002B958 00000000 */   nop
.L8002B95C:
/* 2C55C 8002B95C 4600008D */  trunc.w.s  $f2, $f0
/* 2C560 8002B960 44031000 */  mfc1       $v1, $f2
/* 2C564 8002B964 3C028000 */  lui        $v0, 0x8000
/* 2C568 8002B968 00621825 */  or         $v1, $v1, $v0
.L8002B96C:
/* 2C56C 8002B96C 3C01800E */  lui        $at, %hi(D_800DA590)
/* 2C570 8002B970 C420A590 */  lwc1       $f0, %lo(D_800DA590)($at)
/* 2C574 8002B974 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C578 8002B978 3C01800E */  lui        $at, %hi(D_800DA594)
/* 2C57C 8002B97C C422A594 */  lwc1       $f2, %lo(D_800DA594)($at)
/* 2C580 8002B980 46020002 */  mul.s      $f0, $f0, $f2
/* 2C584 8002B984 3C01800E */  lui        $at, %hi(D_800DA598)
/* 2C588 8002B988 C424A598 */  lwc1       $f4, %lo(D_800DA598)($at)
/* 2C58C 8002B98C 46002001 */  sub.s      $f0, $f4, $f0
/* 2C590 8002B990 3C01800E */  lui        $at, %hi(D_800DA59C)
/* 2C594 8002B994 C424A59C */  lwc1       $f4, %lo(D_800DA59C)($at)
/* 2C598 8002B998 4600203E */  c.le.s     $f4, $f0
/* 2C59C 8002B99C 00000000 */  nop
/* 2C5A0 8002B9A0 45010005 */  bc1t       .L8002B9B8
/* 2C5A4 8002B9A4 307500FF */   andi      $s5, $v1, 0xff
/* 2C5A8 8002B9A8 4600008D */  trunc.w.s  $f2, $f0
/* 2C5AC 8002B9AC 44031000 */  mfc1       $v1, $f2
/* 2C5B0 8002B9B0 0800AE73 */  j          .L8002B9CC
/* 2C5B4 8002B9B4 00000000 */   nop
.L8002B9B8:
/* 2C5B8 8002B9B8 46040001 */  sub.s      $f0, $f0, $f4
/* 2C5BC 8002B9BC 4600008D */  trunc.w.s  $f2, $f0
/* 2C5C0 8002B9C0 44031000 */  mfc1       $v1, $f2
/* 2C5C4 8002B9C4 3C028000 */  lui        $v0, 0x8000
/* 2C5C8 8002B9C8 00621825 */  or         $v1, $v1, $v0
.L8002B9CC:
/* 2C5CC 8002B9CC 3C01800E */  lui        $at, %hi(D_800DA5A0)
/* 2C5D0 8002B9D0 C420A5A0 */  lwc1       $f0, %lo(D_800DA5A0)($at)
/* 2C5D4 8002B9D4 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C5D8 8002B9D8 3C01800E */  lui        $at, %hi(D_800DA5A4)
/* 2C5DC 8002B9DC C422A5A4 */  lwc1       $f2, %lo(D_800DA5A4)($at)
/* 2C5E0 8002B9E0 46020002 */  mul.s      $f0, $f0, $f2
/* 2C5E4 8002B9E4 3C01800E */  lui        $at, %hi(D_800DA5A8)
/* 2C5E8 8002B9E8 C424A5A8 */  lwc1       $f4, %lo(D_800DA5A8)($at)
/* 2C5EC 8002B9EC 46040000 */  add.s      $f0, $f0, $f4
/* 2C5F0 8002B9F0 3C01800E */  lui        $at, %hi(D_800DA5AC)
/* 2C5F4 8002B9F4 C422A5AC */  lwc1       $f2, %lo(D_800DA5AC)($at)
/* 2C5F8 8002B9F8 4600103E */  c.le.s     $f2, $f0
/* 2C5FC 8002B9FC 00000000 */  nop
/* 2C600 8002BA00 45010005 */  bc1t       .L8002BA18
/* 2C604 8002BA04 307300FF */   andi      $s3, $v1, 0xff
/* 2C608 8002BA08 4600008D */  trunc.w.s  $f2, $f0
/* 2C60C 8002BA0C 44031000 */  mfc1       $v1, $f2
/* 2C610 8002BA10 0800AE8B */  j          .L8002BA2C
/* 2C614 8002BA14 00000000 */   nop
.L8002BA18:
/* 2C618 8002BA18 46020001 */  sub.s      $f0, $f0, $f2
/* 2C61C 8002BA1C 4600008D */  trunc.w.s  $f2, $f0
/* 2C620 8002BA20 44031000 */  mfc1       $v1, $f2
/* 2C624 8002BA24 3C028000 */  lui        $v0, 0x8000
/* 2C628 8002BA28 00621825 */  or         $v1, $v1, $v0
.L8002BA2C:
/* 2C62C 8002BA2C 3C01800E */  lui        $at, %hi(D_800DA5B0)
/* 2C630 8002BA30 C420A5B0 */  lwc1       $f0, %lo(D_800DA5B0)($at)
/* 2C634 8002BA34 4600B001 */  sub.s      $f0, $f22, $f0
/* 2C638 8002BA38 3C01800E */  lui        $at, %hi(D_800DA5B4)
/* 2C63C 8002BA3C C422A5B4 */  lwc1       $f2, %lo(D_800DA5B4)($at)
/* 2C640 8002BA40 46020002 */  mul.s      $f0, $f0, $f2
/* 2C644 8002BA44 307200FF */  andi       $s2, $v1, 0xff
/* 2C648 8002BA48 3C01800E */  lui        $at, %hi(D_800DA5B8)
/* 2C64C 8002BA4C C422A5B8 */  lwc1       $f2, %lo(D_800DA5B8)($at)
/* 2C650 8002BA50 46000686 */  mov.s      $f26, $f0
/* 2C654 8002BA54 46001501 */  sub.s      $f20, $f2, $f0
.L8002BA58:
/* 2C658 8002BA58 26C268A8 */  addiu      $v0, $s6, 0x68a8
.L8002BA5C:
/* 2C65C 8002BA5C C442203C */  lwc1       $f2, 0x203c($v0)
.L8002BA60:
/* 2C660 8002BA60 3C01800E */  lui        $at, %hi(D_800DA5BC)
/* 2C664 8002BA64 C420A5BC */  lwc1       $f0, %lo(D_800DA5BC)($at)
/* 2C668 8002BA68 46001002 */  mul.s      $f0, $f2, $f0
/* 2C66C 8002BA6C 3C01800E */  lui        $at, %hi(D_800DA5C0)
/* 2C670 8002BA70 C422A5C0 */  lwc1       $f2, %lo(D_800DA5C0)($at)
/* 2C674 8002BA74 4600103E */  c.le.s     $f2, $f0
/* 2C678 8002BA78 00000000 */  nop
/* 2C67C 8002BA7C 45030005 */  bc1tl      .L8002BA94
/* 2C680 8002BA80 46020001 */   sub.s     $f0, $f0, $f2
/* 2C684 8002BA84 4600008D */  trunc.w.s  $f2, $f0
/* 2C688 8002BA88 44031000 */  mfc1       $v1, $f2
/* 2C68C 8002BA8C 0800AEA9 */  j          .L8002BAA4
/* 2C690 8002BA90 00000000 */   nop
.L8002BA94:
/* 2C694 8002BA94 4600008D */  trunc.w.s  $f2, $f0
/* 2C698 8002BA98 44031000 */  mfc1       $v1, $f2
/* 2C69C 8002BA9C 3C028000 */  lui        $v0, 0x8000
/* 2C6A0 8002BAA0 00621825 */  or         $v1, $v1, $v0
.L8002BAA4:
/* 2C6A4 8002BAA4 3C0641C0 */  lui        $a2, 0x41c0
/* 2C6A8 8002BAA8 3C07432E */  lui        $a3, 0x432e
/* 2C6AC 8002BAAC 8EE29C30 */  lw         $v0, -0x63d0($s7)
/* 2C6B0 8002BAB0 3C01800E */  lui        $at, %hi(D_800DA5C4)
/* 2C6B4 8002BAB4 C420A5C4 */  lwc1       $f0, %lo(D_800DA5C4)($at)
/* 2C6B8 8002BAB8 307100FF */  andi       $s1, $v1, 0xff
/* 2C6BC 8002BABC AFB50018 */  sw         $s5, 0x18($sp)
/* 2C6C0 8002BAC0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2C6C4 8002BAC4 AFB20020 */  sw         $s2, 0x20($sp)
/* 2C6C8 8002BAC8 AFB10024 */  sw         $s1, 0x24($sp)
/* 2C6CC 8002BACC E7A00010 */  swc1       $f0, 0x10($sp)
/* 2C6D0 8002BAD0 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2C6D4 8002BAD4 8C450004 */  lw         $a1, 4($v0)
/* 2C6D8 8002BAD8 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2C6DC 8002BADC 02802021 */   addu      $a0, $s4, $zero
/* 2C6E0 8002BAE0 8EE39C30 */  lw         $v1, -0x63d0($s7)
/* 2C6E4 8002BAE4 90640028 */  lbu        $a0, 0x28($v1)
/* 2C6E8 8002BAE8 14800054 */  bnez       $a0, .L8002BC3C
/* 2C6EC 8002BAEC 0040A021 */   addu      $s4, $v0, $zero
/* 2C6F0 8002BAF0 3C01800E */  lui        $at, %hi(D_800DA5C8)
/* 2C6F4 8002BAF4 C426A5C8 */  lwc1       $f6, %lo(D_800DA5C8)($at)
/* 2C6F8 8002BAF8 4606E102 */  mul.s      $f4, $f28, $f6
/* 2C6FC 8002BAFC 00000000 */  nop
/* 2C700 8002BB00 4606C182 */  mul.s      $f6, $f24, $f6
/* 2C704 8002BB04 26C268A8 */  addiu      $v0, $s6, 0x68a8
/* 2C708 8002BB08 C440203C */  lwc1       $f0, 0x203c($v0)
/* 2C70C 8002BB0C 4600A502 */  mul.s      $f20, $f20, $f0
/* 2C710 8002BB10 3C01800E */  lui        $at, %hi(D_800DA5CC)
/* 2C714 8002BB14 C422A5CC */  lwc1       $f2, %lo(D_800DA5CC)($at)
/* 2C718 8002BB18 46022100 */  add.s      $f4, $f4, $f2
/* 2C71C 8002BB1C 3C01800E */  lui        $at, %hi(D_800DA5D0)
/* 2C720 8002BB20 C420A5D0 */  lwc1       $f0, %lo(D_800DA5D0)($at)
/* 2C724 8002BB24 46060001 */  sub.s      $f0, $f0, $f6
/* 2C728 8002BB28 3C01800E */  lui        $at, %hi(D_800DA5D4)
/* 2C72C 8002BB2C C428A5D4 */  lwc1       $f8, %lo(D_800DA5D4)($at)
/* 2C730 8002BB30 46082601 */  sub.s      $f24, $f4, $f8
/* 2C734 8002BB34 3C01800E */  lui        $at, %hi(D_800DA5D8)
/* 2C738 8002BB38 C422A5D8 */  lwc1       $f2, %lo(D_800DA5D8)($at)
/* 2C73C 8002BB3C 4614103E */  c.le.s     $f2, $f20
/* 2C740 8002BB40 00000000 */  nop
/* 2C744 8002BB44 45010005 */  bc1t       .L8002BB5C
/* 2C748 8002BB48 46080581 */   sub.s     $f22, $f0, $f8
/* 2C74C 8002BB4C 4600A00D */  trunc.w.s  $f0, $f20
/* 2C750 8002BB50 44030000 */  mfc1       $v1, $f0
/* 2C754 8002BB54 0800AEDD */  j          .L8002BB74
/* 2C758 8002BB58 307100FF */   andi      $s1, $v1, 0xff
.L8002BB5C:
/* 2C75C 8002BB5C 4602A001 */  sub.s      $f0, $f20, $f2
/* 2C760 8002BB60 4600008D */  trunc.w.s  $f2, $f0
/* 2C764 8002BB64 44031000 */  mfc1       $v1, $f2
/* 2C768 8002BB68 3C028000 */  lui        $v0, 0x8000
/* 2C76C 8002BB6C 00621825 */  or         $v1, $v1, $v0
/* 2C770 8002BB70 307100FF */  andi       $s1, $v1, 0xff
.L8002BB74:
/* 2C774 8002BB74 1220000F */  beqz       $s1, .L8002BBB4
/* 2C778 8002BB78 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C77C 8002BB7C 4406C000 */  mfc1       $a2, $f24
/* 2C780 8002BB80 4407B000 */  mfc1       $a3, $f22
/* 2C784 8002BB84 3C01800E */  lui        $at, %hi(D_800DA5DC)
/* 2C788 8002BB88 C420A5DC */  lwc1       $f0, %lo(D_800DA5DC)($at)
/* 2C78C 8002BB8C AFB50018 */  sw         $s5, 0x18($sp)
/* 2C790 8002BB90 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2C794 8002BB94 AFB20020 */  sw         $s2, 0x20($sp)
/* 2C798 8002BB98 AFB10024 */  sw         $s1, 0x24($sp)
/* 2C79C 8002BB9C E7A00010 */  swc1       $f0, 0x10($sp)
/* 2C7A0 8002BBA0 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2C7A4 8002BBA4 8C450020 */  lw         $a1, 0x20($v0)
/* 2C7A8 8002BBA8 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2C7AC 8002BBAC 02802021 */   addu      $a0, $s4, $zero
/* 2C7B0 8002BBB0 0040A021 */  addu       $s4, $v0, $zero
.L8002BBB4:
/* 2C7B4 8002BBB4 26C268A8 */  addiu      $v0, $s6, 0x68a8
/* 2C7B8 8002BBB8 C440203C */  lwc1       $f0, 0x203c($v0)
/* 2C7BC 8002BBBC 4600D002 */  mul.s      $f0, $f26, $f0
/* 2C7C0 8002BBC0 3C01800E */  lui        $at, %hi(D_800DA5E0)
/* 2C7C4 8002BBC4 C422A5E0 */  lwc1       $f2, %lo(D_800DA5E0)($at)
/* 2C7C8 8002BBC8 4600103E */  c.le.s     $f2, $f0
/* 2C7CC 8002BBCC 00000000 */  nop
/* 2C7D0 8002BBD0 45030005 */  bc1tl      .L8002BBE8
/* 2C7D4 8002BBD4 46020001 */   sub.s     $f0, $f0, $f2
/* 2C7D8 8002BBD8 4600008D */  trunc.w.s  $f2, $f0
/* 2C7DC 8002BBDC 44041000 */  mfc1       $a0, $f2
/* 2C7E0 8002BBE0 0800AEFF */  j          .L8002BBFC
/* 2C7E4 8002BBE4 309100FF */   andi      $s1, $a0, 0xff
.L8002BBE8:
/* 2C7E8 8002BBE8 4600008D */  trunc.w.s  $f2, $f0
/* 2C7EC 8002BBEC 44041000 */  mfc1       $a0, $f2
/* 2C7F0 8002BBF0 3C028000 */  lui        $v0, 0x8000
/* 2C7F4 8002BBF4 00822025 */  or         $a0, $a0, $v0
/* 2C7F8 8002BBF8 309100FF */  andi       $s1, $a0, 0xff
.L8002BBFC:
/* 2C7FC 8002BBFC 1220000F */  beqz       $s1, .L8002BC3C
/* 2C800 8002BC00 8EE29C30 */   lw        $v0, -0x63d0($s7)
/* 2C804 8002BC04 4406C000 */  mfc1       $a2, $f24
/* 2C808 8002BC08 4407B000 */  mfc1       $a3, $f22
/* 2C80C 8002BC0C 3C01800E */  lui        $at, %hi(D_800DA5E4)
/* 2C810 8002BC10 C420A5E4 */  lwc1       $f0, %lo(D_800DA5E4)($at)
/* 2C814 8002BC14 AFB50018 */  sw         $s5, 0x18($sp)
/* 2C818 8002BC18 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2C81C 8002BC1C AFB20020 */  sw         $s2, 0x20($sp)
/* 2C820 8002BC20 AFB10024 */  sw         $s1, 0x24($sp)
/* 2C824 8002BC24 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2C828 8002BC28 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2C82C 8002BC2C 8C450024 */  lw         $a1, 0x24($v0)
/* 2C830 8002BC30 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2C834 8002BC34 02802021 */   addu      $a0, $s4, $zero
/* 2C838 8002BC38 0040A021 */  addu       $s4, $v0, $zero
.L8002BC3C:
/* 2C83C 8002BC3C 02801021 */  addu       $v0, $s4, $zero
/* 2C840 8002BC40 8FBF008C */  lw         $ra, 0x8c($sp)
/* 2C844 8002BC44 8FBE0088 */  lw         $fp, 0x88($sp)
/* 2C848 8002BC48 8FB70084 */  lw         $s7, 0x84($sp)
/* 2C84C 8002BC4C 8FB60080 */  lw         $s6, 0x80($sp)
/* 2C850 8002BC50 8FB5007C */  lw         $s5, 0x7c($sp)
/* 2C854 8002BC54 8FB40078 */  lw         $s4, 0x78($sp)
/* 2C858 8002BC58 8FB30074 */  lw         $s3, 0x74($sp)
/* 2C85C 8002BC5C 8FB20070 */  lw         $s2, 0x70($sp)
/* 2C860 8002BC60 8FB1006C */  lw         $s1, 0x6c($sp)
/* 2C864 8002BC64 8FB00068 */  lw         $s0, 0x68($sp)
/* 2C868 8002BC68 D7BC00B0 */  ldc1       $f28, 0xb0($sp)
/* 2C86C 8002BC6C D7BA00A8 */  ldc1       $f26, 0xa8($sp)
/* 2C870 8002BC70 D7B800A0 */  ldc1       $f24, 0xa0($sp)
/* 2C874 8002BC74 D7B60098 */  ldc1       $f22, 0x98($sp)
/* 2C878 8002BC78 D7B40090 */  ldc1       $f20, 0x90($sp)
/* 2C87C 8002BC7C 03E00008 */  jr         $ra
/* 2C880 8002BC80 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel xor_sundail_sun
/* 2C884 8002BC84 3C02800F */  lui        $v0, %hi(sundail_pointer)
/* 2C888 8002BC88 8C439C30 */  lw         $v1, %lo(sundail_pointer)($v0)
/* 2C88C 8002BC8C 38840001 */  xori       $a0, $a0, 1
/* 2C890 8002BC90 03E00008 */  jr         $ra
/* 2C894 8002BC94 A0640029 */   sb        $a0, 0x29($v1)

glabel xor_sundail_moon
/* 2C898 8002BC98 3C02800F */  lui        $v0, %hi(sundail_pointer)
/* 2C89C 8002BC9C 8C439C30 */  lw         $v1, %lo(sundail_pointer)($v0)
/* 2C8A0 8002BCA0 38840001 */  xori       $a0, $a0, 1
/* 2C8A4 8002BCA4 03E00008 */  jr         $ra
/* 2C8A8 8002BCA8 A0640028 */   sb        $a0, 0x28($v1)

glabel sundail_free
/* 2C8AC 8002BCAC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2C8B0 8002BCB0 AFB00010 */  sw         $s0, 0x10($sp)
/* 2C8B4 8002BCB4 3C10800E */  lui        $s0, %hi(queueStructA)
/* 2C8B8 8002BCB8 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 2C8BC 8002BCBC 02002021 */  addu       $a0, $s0, $zero
/* 2C8C0 8002BCC0 24060004 */  addiu      $a2, $zero, 4
/* 2C8C4 8002BCC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 2C8C8 8002BCC8 3C11800F */  lui        $s1, %hi(sundail_pointer)
/* 2C8CC 8002BCCC 8E259C30 */  lw         $a1, %lo(sundail_pointer)($s1)
/* 2C8D0 8002BCD0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 2C8D4 8002BCD4 0C035867 */  jal        AllocFreeQueueItem
/* 2C8D8 8002BCD8 00003821 */   addu      $a3, $zero, $zero
/* 2C8DC 8002BCDC 02002021 */  addu       $a0, $s0, $zero
/* 2C8E0 8002BCE0 24060004 */  addiu      $a2, $zero, 4
/* 2C8E4 8002BCE4 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C8E8 8002BCE8 00003821 */  addu       $a3, $zero, $zero
/* 2C8EC 8002BCEC 24450004 */  addiu      $a1, $v0, 4
/* 2C8F0 8002BCF0 0C035867 */  jal        AllocFreeQueueItem
/* 2C8F4 8002BCF4 AC400000 */   sw        $zero, ($v0)
/* 2C8F8 8002BCF8 02002021 */  addu       $a0, $s0, $zero
/* 2C8FC 8002BCFC 24060004 */  addiu      $a2, $zero, 4
/* 2C900 8002BD00 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C904 8002BD04 00003821 */  addu       $a3, $zero, $zero
/* 2C908 8002BD08 24450008 */  addiu      $a1, $v0, 8
/* 2C90C 8002BD0C 0C035867 */  jal        AllocFreeQueueItem
/* 2C910 8002BD10 AC400004 */   sw        $zero, 4($v0)
/* 2C914 8002BD14 02002021 */  addu       $a0, $s0, $zero
/* 2C918 8002BD18 24060004 */  addiu      $a2, $zero, 4
/* 2C91C 8002BD1C 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C920 8002BD20 00003821 */  addu       $a3, $zero, $zero
/* 2C924 8002BD24 2445000C */  addiu      $a1, $v0, 0xc
/* 2C928 8002BD28 0C035867 */  jal        AllocFreeQueueItem
/* 2C92C 8002BD2C AC400008 */   sw        $zero, 8($v0)
/* 2C930 8002BD30 02002021 */  addu       $a0, $s0, $zero
/* 2C934 8002BD34 24060004 */  addiu      $a2, $zero, 4
/* 2C938 8002BD38 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C93C 8002BD3C 00003821 */  addu       $a3, $zero, $zero
/* 2C940 8002BD40 24450010 */  addiu      $a1, $v0, 0x10
/* 2C944 8002BD44 0C035867 */  jal        AllocFreeQueueItem
/* 2C948 8002BD48 AC40000C */   sw        $zero, 0xc($v0)
/* 2C94C 8002BD4C 02002021 */  addu       $a0, $s0, $zero
/* 2C950 8002BD50 24060004 */  addiu      $a2, $zero, 4
/* 2C954 8002BD54 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C958 8002BD58 00003821 */  addu       $a3, $zero, $zero
/* 2C95C 8002BD5C 24450014 */  addiu      $a1, $v0, 0x14
/* 2C960 8002BD60 0C035867 */  jal        AllocFreeQueueItem
/* 2C964 8002BD64 AC400010 */   sw        $zero, 0x10($v0)
/* 2C968 8002BD68 02002021 */  addu       $a0, $s0, $zero
/* 2C96C 8002BD6C 24060004 */  addiu      $a2, $zero, 4
/* 2C970 8002BD70 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C974 8002BD74 00003821 */  addu       $a3, $zero, $zero
/* 2C978 8002BD78 24450018 */  addiu      $a1, $v0, 0x18
/* 2C97C 8002BD7C 0C035867 */  jal        AllocFreeQueueItem
/* 2C980 8002BD80 AC400014 */   sw        $zero, 0x14($v0)
/* 2C984 8002BD84 02002021 */  addu       $a0, $s0, $zero
/* 2C988 8002BD88 24060004 */  addiu      $a2, $zero, 4
/* 2C98C 8002BD8C 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C990 8002BD90 00003821 */  addu       $a3, $zero, $zero
/* 2C994 8002BD94 2445001C */  addiu      $a1, $v0, 0x1c
/* 2C998 8002BD98 0C035867 */  jal        AllocFreeQueueItem
/* 2C99C 8002BD9C AC400018 */   sw        $zero, 0x18($v0)
/* 2C9A0 8002BDA0 02002021 */  addu       $a0, $s0, $zero
/* 2C9A4 8002BDA4 24060004 */  addiu      $a2, $zero, 4
/* 2C9A8 8002BDA8 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C9AC 8002BDAC 00003821 */  addu       $a3, $zero, $zero
/* 2C9B0 8002BDB0 24450020 */  addiu      $a1, $v0, 0x20
/* 2C9B4 8002BDB4 0C035867 */  jal        AllocFreeQueueItem
/* 2C9B8 8002BDB8 AC40001C */   sw        $zero, 0x1c($v0)
/* 2C9BC 8002BDBC 02002021 */  addu       $a0, $s0, $zero
/* 2C9C0 8002BDC0 24060004 */  addiu      $a2, $zero, 4
/* 2C9C4 8002BDC4 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C9C8 8002BDC8 00003821 */  addu       $a3, $zero, $zero
/* 2C9CC 8002BDCC 24450024 */  addiu      $a1, $v0, 0x24
/* 2C9D0 8002BDD0 0C035867 */  jal        AllocFreeQueueItem
/* 2C9D4 8002BDD4 AC400020 */   sw        $zero, 0x20($v0)
/* 2C9D8 8002BDD8 02002021 */  addu       $a0, $s0, $zero
/* 2C9DC 8002BDDC 26259C30 */  addiu      $a1, $s1, -0x63d0
/* 2C9E0 8002BDE0 24060007 */  addiu      $a2, $zero, 7
/* 2C9E4 8002BDE4 8E229C30 */  lw         $v0, -0x63d0($s1)
/* 2C9E8 8002BDE8 00003821 */  addu       $a3, $zero, $zero
/* 2C9EC 8002BDEC 0C035867 */  jal        AllocFreeQueueItem
/* 2C9F0 8002BDF0 AC400024 */   sw        $zero, 0x24($v0)
/* 2C9F4 8002BDF4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 2C9F8 8002BDF8 AE209C30 */  sw         $zero, -0x63d0($s1)
/* 2C9FC 8002BDFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 2CA00 8002BE00 8FB00010 */  lw         $s0, 0x10($sp)
/* 2CA04 8002BE04 03E00008 */  jr         $ra
/* 2CA08 8002BE08 27BD0020 */   addiu     $sp, $sp, 0x20
/* 2CA0C 8002BE0C 00000000 */  nop
