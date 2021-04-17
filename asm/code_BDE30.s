.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800BD230
/* BDE30 800BD230 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* BDE34 800BD234 AFB00098 */  sw         $s0, 0x98($sp)
/* BDE38 800BD238 AFBF009C */  sw         $ra, 0x9c($sp)
/* BDE3C 800BD23C 0C02DCFC */  jal        widget_init
/* BDE40 800BD240 00808021 */   addu      $s0, $a0, $zero
/* BDE44 800BD244 27A40018 */  addiu      $a0, $sp, 0x18
/* BDE48 800BD248 00002821 */  addu       $a1, $zero, $zero
/* BDE4C 800BD24C 3C02800E */  lui        $v0, %hi(D_800E49A0)
/* BDE50 800BD250 244249A0 */  addiu      $v0, $v0, %lo(D_800E49A0)
/* BDE54 800BD254 240300FA */  addiu      $v1, $zero, 0xfa
/* BDE58 800BD258 00003021 */  addu       $a2, $zero, $zero
/* BDE5C 800BD25C 00003821 */  addu       $a3, $zero, $zero
/* BDE60 800BD260 AE020078 */  sw         $v0, 0x78($s0)
/* BDE64 800BD264 0C02F4A3 */  jal        func_800BD28C
/* BDE68 800BD268 AFA30010 */   sw        $v1, 0x10($sp)
/* BDE6C 800BD26C 27A40018 */  addiu      $a0, $sp, 0x18
/* BDE70 800BD270 0C02F4C9 */  jal        func_800BD324
/* BDE74 800BD274 24050002 */   addiu     $a1, $zero, 2
/* BDE78 800BD278 02001021 */  addu       $v0, $s0, $zero
/* BDE7C 800BD27C 8FBF009C */  lw         $ra, 0x9c($sp)
/* BDE80 800BD280 8FB00098 */  lw         $s0, 0x98($sp)
/* BDE84 800BD284 03E00008 */  jr         $ra
/* BDE88 800BD288 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_800BD28C
/* BDE8C 800BD28C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BDE90 800BD290 AFB00018 */  sw         $s0, 0x18($sp)
/* BDE94 800BD294 00808021 */  addu       $s0, $a0, $zero
/* BDE98 800BD298 AFB1001C */  sw         $s1, 0x1c($sp)
/* BDE9C 800BD29C 8FB10040 */  lw         $s1, 0x40($sp)
/* BDEA0 800BD2A0 AFB20020 */  sw         $s2, 0x20($sp)
/* BDEA4 800BD2A4 00A09021 */  addu       $s2, $a1, $zero
/* BDEA8 800BD2A8 AFB30024 */  sw         $s3, 0x24($sp)
/* BDEAC 800BD2AC 00C09821 */  addu       $s3, $a2, $zero
/* BDEB0 800BD2B0 AFB40028 */  sw         $s4, 0x28($sp)
/* BDEB4 800BD2B4 AFBF002C */  sw         $ra, 0x2c($sp)
/* BDEB8 800BD2B8 0C02DCFC */  jal        widget_init
/* BDEBC 800BD2BC 00E0A021 */   addu      $s4, $a3, $zero
/* BDEC0 800BD2C0 02002021 */  addu       $a0, $s0, $zero
/* BDEC4 800BD2C4 3C02800E */  lui        $v0, %hi(D_800E49A0)
/* BDEC8 800BD2C8 244249A0 */  addiu      $v0, $v0, %lo(D_800E49A0)
/* BDECC 800BD2CC 24030020 */  addiu      $v1, $zero, 0x20
/* BDED0 800BD2D0 AE020078 */  sw         $v0, 0x78($s0)
/* BDED4 800BD2D4 24020090 */  addiu      $v0, $zero, 0x90
/* BDED8 800BD2D8 A6030074 */  sh         $v1, 0x74($s0)
/* BDEDC 800BD2DC A6030072 */  sh         $v1, 0x72($s0)
/* BDEE0 800BD2E0 24030068 */  addiu      $v1, $zero, 0x68
/* BDEE4 800BD2E4 02402821 */  addu       $a1, $s2, $zero
/* BDEE8 800BD2E8 02603021 */  addu       $a2, $s3, $zero
/* BDEEC 800BD2EC 02803821 */  addu       $a3, $s4, $zero
/* BDEF0 800BD2F0 A6020060 */  sh         $v0, 0x60($s0)
/* BDEF4 800BD2F4 A6030062 */  sh         $v1, 0x62($s0)
/* BDEF8 800BD2F8 0C02DD4A */  jal        set_widget_color
/* BDEFC 800BD2FC AFB10010 */   sw        $s1, 0x10($sp)
/* BDF00 800BD300 02001021 */  addu       $v0, $s0, $zero
/* BDF04 800BD304 8FBF002C */  lw         $ra, 0x2c($sp)
/* BDF08 800BD308 8FB40028 */  lw         $s4, 0x28($sp)
/* BDF0C 800BD30C 8FB30024 */  lw         $s3, 0x24($sp)
/* BDF10 800BD310 8FB20020 */  lw         $s2, 0x20($sp)
/* BDF14 800BD314 8FB1001C */  lw         $s1, 0x1c($sp)
/* BDF18 800BD318 8FB00018 */  lw         $s0, 0x18($sp)
/* BDF1C 800BD31C 03E00008 */  jr         $ra
/* BDF20 800BD320 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800BD324
/* BDF24 800BD324 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BDF28 800BD328 3C02800E */  lui        $v0, %hi(D_800E49A0)
/* BDF2C 800BD32C 244249A0 */  addiu      $v0, $v0, %lo(D_800E49A0)
/* BDF30 800BD330 AFBF0010 */  sw         $ra, 0x10($sp)
/* BDF34 800BD334 0C02DD2B */  jal        free_widget
/* BDF38 800BD338 AC820078 */   sw        $v0, 0x78($a0)
/* BDF3C 800BD33C 8FBF0010 */  lw         $ra, 0x10($sp)
/* BDF40 800BD340 03E00008 */  jr         $ra
/* BDF44 800BD344 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800BD348
/* BDF48 800BD348 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* BDF4C 800BD34C 00A07021 */  addu       $t6, $a1, $zero
/* BDF50 800BD350 AFB00028 */  sw         $s0, 0x28($sp)
/* BDF54 800BD354 00808021 */  addu       $s0, $a0, $zero
/* BDF58 800BD358 00063400 */  sll        $a2, $a2, 0x10
/* BDF5C 800BD35C AFB1002C */  sw         $s1, 0x2c($sp)
/* BDF60 800BD360 00068C03 */  sra        $s1, $a2, 0x10
/* BDF64 800BD364 00073C00 */  sll        $a3, $a3, 0x10
/* BDF68 800BD368 AFB20030 */  sw         $s2, 0x30($sp)
/* BDF6C 800BD36C 00079403 */  sra        $s2, $a3, 0x10
/* BDF70 800BD370 AFBF003C */  sw         $ra, 0x3c($sp)
/* BDF74 800BD374 AFB40038 */  sw         $s4, 0x38($sp)
/* BDF78 800BD378 AFB30034 */  sw         $s3, 0x34($sp)
/* BDF7C 800BD37C 86050060 */  lh         $a1, 0x60($s0)
/* BDF80 800BD380 860D0062 */  lh         $t5, 0x62($s0)
/* BDF84 800BD384 86090064 */  lh         $t1, 0x64($s0)
/* BDF88 800BD388 860B0066 */  lh         $t3, 0x66($s0)
/* BDF8C 800BD38C 860A0068 */  lh         $t2, 0x68($s0)
/* BDF90 800BD390 96030074 */  lhu        $v1, 0x74($s0)
/* BDF94 800BD394 860C006A */  lh         $t4, 0x6a($s0)
/* BDF98 800BD398 96020072 */  lhu        $v0, 0x72($s0)
/* BDF9C 800BD39C 87B30052 */  lh         $s3, 0x52($sp)
/* BDFA0 800BD3A0 87B40056 */  lh         $s4, 0x56($sp)
/* BDFA4 800BD3A4 00651821 */  addu       $v1, $v1, $a1
/* BDFA8 800BD3A8 00031C00 */  sll        $v1, $v1, 0x10
/* BDFAC 800BD3AC 004D1021 */  addu       $v0, $v0, $t5
/* BDFB0 800BD3B0 00021400 */  sll        $v0, $v0, 0x10
/* BDFB4 800BD3B4 00022403 */  sra        $a0, $v0, 0x10
/* BDFB8 800BD3B8 0131102A */  slt        $v0, $t1, $s1
/* BDFBC 800BD3BC 10400002 */  beqz       $v0, .L800BD3C8
/* BDFC0 800BD3C0 00034403 */   sra       $t0, $v1, 0x10
/* BDFC4 800BD3C4 02204821 */  addu       $t1, $s1, $zero
.L800BD3C8:
/* BDFC8 800BD3C8 026B102A */  slt        $v0, $s3, $t3
/* BDFCC 800BD3CC 54400001 */  bnel       $v0, $zero, .L800BD3D4
/* BDFD0 800BD3D0 02605821 */   addu      $t3, $s3, $zero
.L800BD3D4:
/* BDFD4 800BD3D4 0152102A */  slt        $v0, $t2, $s2
/* BDFD8 800BD3D8 54400001 */  bnel       $v0, $zero, .L800BD3E0
/* BDFDC 800BD3DC 02405021 */   addu      $t2, $s2, $zero
.L800BD3E0:
/* BDFE0 800BD3E0 028C102A */  slt        $v0, $s4, $t4
/* BDFE4 800BD3E4 54400001 */  bnel       $v0, $zero, .L800BD3EC
/* BDFE8 800BD3E8 02806021 */   addu      $t4, $s4, $zero
.L800BD3EC:
/* BDFEC 800BD3EC 0109102A */  slt        $v0, $t0, $t1
/* BDFF0 800BD3F0 54400084 */  bnel       $v0, $zero, .L800BD604
/* BDFF4 800BD3F4 02002021 */   addu      $a0, $s0, $zero
/* BDFF8 800BD3F8 008A102A */  slt        $v0, $a0, $t2
/* BDFFC 800BD3FC 54400081 */  bnel       $v0, $zero, .L800BD604
/* BE000 800BD400 02002021 */   addu      $a0, $s0, $zero
/* BE004 800BD404 0165102A */  slt        $v0, $t3, $a1
/* BE008 800BD408 5440007E */  bnel       $v0, $zero, .L800BD604
/* BE00C 800BD40C 02002021 */   addu      $a0, $s0, $zero
/* BE010 800BD410 018D102A */  slt        $v0, $t4, $t5
/* BE014 800BD414 5440007B */  bnel       $v0, $zero, .L800BD604
/* BE018 800BD418 02002021 */   addu      $a0, $s0, $zero
/* BE01C 800BD41C 00A9102A */  slt        $v0, $a1, $t1
/* BE020 800BD420 54400001 */  bnel       $v0, $zero, .L800BD428
/* BE024 800BD424 01202821 */   addu      $a1, $t1, $zero
.L800BD428:
/* BE028 800BD428 01AA102A */  slt        $v0, $t5, $t2
/* BE02C 800BD42C 54400001 */  bnel       $v0, $zero, .L800BD434
/* BE030 800BD430 01406821 */   addu      $t5, $t2, $zero
.L800BD434:
/* BE034 800BD434 0168102A */  slt        $v0, $t3, $t0
/* BE038 800BD438 54400001 */  bnel       $v0, $zero, .L800BD440
/* BE03C 800BD43C 01604021 */   addu      $t0, $t3, $zero
.L800BD440:
/* BE040 800BD440 0184102A */  slt        $v0, $t4, $a0
/* BE044 800BD444 54400001 */  bnel       $v0, $zero, .L800BD44C
/* BE048 800BD448 01802021 */   addu      $a0, $t4, $zero
.L800BD44C:
/* BE04C 800BD44C 14A80003 */  bne        $a1, $t0, .L800BD45C
/* BE050 800BD450 25020001 */   addiu     $v0, $t0, 1
/* BE054 800BD454 00021400 */  sll        $v0, $v0, 0x10
/* BE058 800BD458 00024403 */  sra        $t0, $v0, 0x10
.L800BD45C:
/* BE05C 800BD45C 15A40004 */  bne        $t5, $a0, .L800BD470
/* BE060 800BD460 3C03800F */   lui       $v1, %hi(D_800F36F8)
/* BE064 800BD464 24820001 */  addiu      $v0, $a0, 1
/* BE068 800BD468 00021400 */  sll        $v0, $v0, 0x10
/* BE06C 800BD46C 00022403 */  sra        $a0, $v0, 0x10
.L800BD470:
/* BE070 800BD470 9202005B */  lbu        $v0, 0x5b($s0)
/* BE074 800BD474 C46436F8 */  lwc1       $f4, %lo(D_800F36F8)($v1)
/* BE078 800BD478 44820000 */  mtc1       $v0, $f0
/* BE07C 800BD47C 46800020 */  cvt.s.w    $f0, $f0
/* BE080 800BD480 46040002 */  mul.s      $f0, $f0, $f4
/* BE084 800BD484 44801000 */  mtc1       $zero, $f2
/* BE088 800BD488 4600103C */  c.lt.s     $f2, $f0
/* BE08C 800BD48C 00000000 */  nop
/* BE090 800BD490 4500005B */  bc1f       .L800BD600
/* BE094 800BD494 30A5FFFF */   andi      $a1, $a1, 0xffff
/* BE098 800BD498 31A6FFFF */  andi       $a2, $t5, 0xffff
/* BE09C 800BD49C 92020058 */  lbu        $v0, 0x58($s0)
/* BE0A0 800BD4A0 3107FFFF */  andi       $a3, $t0, 0xffff
/* BE0A4 800BD4A4 44820000 */  mtc1       $v0, $f0
/* BE0A8 800BD4A8 46800020 */  cvt.s.w    $f0, $f0
/* BE0AC 800BD4AC 46040002 */  mul.s      $f0, $f0, $f4
/* BE0B0 800BD4B0 3C01800E */  lui        $at, %hi(D_800E4990)
/* BE0B4 800BD4B4 C4224990 */  lwc1       $f2, %lo(D_800E4990)($at)
/* BE0B8 800BD4B8 3082FFFF */  andi       $v0, $a0, 0xffff
/* BE0BC 800BD4BC 01C02021 */  addu       $a0, $t6, $zero
/* BE0C0 800BD4C0 4600103E */  c.le.s     $f2, $f0
/* BE0C4 800BD4C4 00000000 */  nop
/* BE0C8 800BD4C8 45010005 */  bc1t       .L800BD4E0
/* BE0CC 800BD4CC AFA20010 */   sw        $v0, 0x10($sp)
/* BE0D0 800BD4D0 4600008D */  trunc.w.s  $f2, $f0
/* BE0D4 800BD4D4 44081000 */  mfc1       $t0, $f2
/* BE0D8 800BD4D8 0802F53E */  j          .L800BD4F8
/* BE0DC 800BD4DC 92020059 */   lbu       $v0, 0x59($s0)
.L800BD4E0:
/* BE0E0 800BD4E0 46020001 */  sub.s      $f0, $f0, $f2
/* BE0E4 800BD4E4 4600008D */  trunc.w.s  $f2, $f0
/* BE0E8 800BD4E8 44081000 */  mfc1       $t0, $f2
/* BE0EC 800BD4EC 3C028000 */  lui        $v0, 0x8000
/* BE0F0 800BD4F0 01024025 */  or         $t0, $t0, $v0
/* BE0F4 800BD4F4 92020059 */  lbu        $v0, 0x59($s0)
.L800BD4F8:
/* BE0F8 800BD4F8 C46236F8 */  lwc1       $f2, 0x36f8($v1)
/* BE0FC 800BD4FC 44820000 */  mtc1       $v0, $f0
/* BE100 800BD500 46800020 */  cvt.s.w    $f0, $f0
/* BE104 800BD504 46020002 */  mul.s      $f0, $f0, $f2
/* BE108 800BD508 3C01800E */  lui        $at, %hi(D_800E4994)
/* BE10C 800BD50C C4224994 */  lwc1       $f2, %lo(D_800E4994)($at)
/* BE110 800BD510 310200FF */  andi       $v0, $t0, 0xff
/* BE114 800BD514 4600103E */  c.le.s     $f2, $f0
/* BE118 800BD518 00000000 */  nop
/* BE11C 800BD51C 45010005 */  bc1t       .L800BD534
/* BE120 800BD520 AFA20014 */   sw        $v0, 0x14($sp)
/* BE124 800BD524 4600008D */  trunc.w.s  $f2, $f0
/* BE128 800BD528 44081000 */  mfc1       $t0, $f2
/* BE12C 800BD52C 0802F553 */  j          .L800BD54C
/* BE130 800BD530 9202005A */   lbu       $v0, 0x5a($s0)
.L800BD534:
/* BE134 800BD534 46020001 */  sub.s      $f0, $f0, $f2
/* BE138 800BD538 4600008D */  trunc.w.s  $f2, $f0
/* BE13C 800BD53C 44081000 */  mfc1       $t0, $f2
/* BE140 800BD540 3C028000 */  lui        $v0, 0x8000
/* BE144 800BD544 01024025 */  or         $t0, $t0, $v0
/* BE148 800BD548 9202005A */  lbu        $v0, 0x5a($s0)
.L800BD54C:
/* BE14C 800BD54C C46236F8 */  lwc1       $f2, 0x36f8($v1)
/* BE150 800BD550 44820000 */  mtc1       $v0, $f0
/* BE154 800BD554 46800020 */  cvt.s.w    $f0, $f0
/* BE158 800BD558 46020002 */  mul.s      $f0, $f0, $f2
/* BE15C 800BD55C 3C01800E */  lui        $at, %hi(D_800E4998)
/* BE160 800BD560 C4224998 */  lwc1       $f2, %lo(D_800E4998)($at)
/* BE164 800BD564 310200FF */  andi       $v0, $t0, 0xff
/* BE168 800BD568 4600103E */  c.le.s     $f2, $f0
/* BE16C 800BD56C 00000000 */  nop
/* BE170 800BD570 45010005 */  bc1t       .L800BD588
/* BE174 800BD574 AFA20018 */   sw        $v0, 0x18($sp)
/* BE178 800BD578 4600008D */  trunc.w.s  $f2, $f0
/* BE17C 800BD57C 44081000 */  mfc1       $t0, $f2
/* BE180 800BD580 0802F568 */  j          .L800BD5A0
/* BE184 800BD584 9202005B */   lbu       $v0, 0x5b($s0)
.L800BD588:
/* BE188 800BD588 46020001 */  sub.s      $f0, $f0, $f2
/* BE18C 800BD58C 4600008D */  trunc.w.s  $f2, $f0
/* BE190 800BD590 44081000 */  mfc1       $t0, $f2
/* BE194 800BD594 3C028000 */  lui        $v0, 0x8000
/* BE198 800BD598 01024025 */  or         $t0, $t0, $v0
/* BE19C 800BD59C 9202005B */  lbu        $v0, 0x5b($s0)
.L800BD5A0:
/* BE1A0 800BD5A0 C46236F8 */  lwc1       $f2, 0x36f8($v1)
/* BE1A4 800BD5A4 44820000 */  mtc1       $v0, $f0
/* BE1A8 800BD5A8 46800020 */  cvt.s.w    $f0, $f0
/* BE1AC 800BD5AC 46020002 */  mul.s      $f0, $f0, $f2
/* BE1B0 800BD5B0 3C01800E */  lui        $at, %hi(D_800E499C)
/* BE1B4 800BD5B4 C422499C */  lwc1       $f2, %lo(D_800E499C)($at)
/* BE1B8 800BD5B8 310200FF */  andi       $v0, $t0, 0xff
/* BE1BC 800BD5BC 4600103E */  c.le.s     $f2, $f0
/* BE1C0 800BD5C0 00000000 */  nop
/* BE1C4 800BD5C4 45010005 */  bc1t       .L800BD5DC
/* BE1C8 800BD5C8 AFA2001C */   sw        $v0, 0x1c($sp)
/* BE1CC 800BD5CC 4600008D */  trunc.w.s  $f2, $f0
/* BE1D0 800BD5D0 44031000 */  mfc1       $v1, $f2
/* BE1D4 800BD5D4 0802F57D */  j          .L800BD5F4
/* BE1D8 800BD5D8 306200FF */   andi      $v0, $v1, 0xff
.L800BD5DC:
/* BE1DC 800BD5DC 46020001 */  sub.s      $f0, $f0, $f2
/* BE1E0 800BD5E0 4600008D */  trunc.w.s  $f2, $f0
/* BE1E4 800BD5E4 44031000 */  mfc1       $v1, $f2
/* BE1E8 800BD5E8 3C028000 */  lui        $v0, 0x8000
/* BE1EC 800BD5EC 00621825 */  or         $v1, $v1, $v0
/* BE1F0 800BD5F0 306200FF */  andi       $v0, $v1, 0xff
.L800BD5F4:
/* BE1F4 800BD5F4 0C0299E5 */  jal        gsFadeInOut
/* BE1F8 800BD5F8 AFA20020 */   sw        $v0, 0x20($sp)
/* BE1FC 800BD5FC 00407021 */  addu       $t6, $v0, $zero
.L800BD600:
/* BE200 800BD600 02002021 */  addu       $a0, $s0, $zero
.L800BD604:
/* BE204 800BD604 01C02821 */  addu       $a1, $t6, $zero
/* BE208 800BD608 02203021 */  addu       $a2, $s1, $zero
/* BE20C 800BD60C 02403821 */  addu       $a3, $s2, $zero
/* BE210 800BD610 AFB30010 */  sw         $s3, 0x10($sp)
/* BE214 800BD614 0C02DE14 */  jal        widget_func_8
/* BE218 800BD618 AFB40014 */   sw        $s4, 0x14($sp)
/* BE21C 800BD61C 8FBF003C */  lw         $ra, 0x3c($sp)
/* BE220 800BD620 8FB40038 */  lw         $s4, 0x38($sp)
/* BE224 800BD624 8FB30034 */  lw         $s3, 0x34($sp)
/* BE228 800BD628 8FB20030 */  lw         $s2, 0x30($sp)
/* BE22C 800BD62C 8FB1002C */  lw         $s1, 0x2c($sp)
/* BE230 800BD630 8FB00028 */  lw         $s0, 0x28($sp)
/* BE234 800BD634 03E00008 */  jr         $ra
/* BE238 800BD638 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_800BD63C
/* BE23C 800BD63C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BE240 800BD640 AFBF0010 */  sw         $ra, 0x10($sp)
/* BE244 800BD644 0C02DE51 */  jal        func_800B7944
/* BE248 800BD648 00000000 */   nop
/* BE24C 800BD64C 8FBF0010 */  lw         $ra, 0x10($sp)
/* BE250 800BD650 03E00008 */  jr         $ra
/* BE254 800BD654 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret5
/* BE258 800BD658 03E00008 */  jr         $ra
/* BE25C 800BD65C 24020005 */   addiu     $v0, $zero, 5
