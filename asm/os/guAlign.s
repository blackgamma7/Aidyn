.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guAlignF
/* BEF10 800BE310 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* BEF14 800BE314 AFB00010 */  sw         $s0, 0x10($sp)
/* BEF18 800BE318 00808021 */  addu       $s0, $a0, $zero
/* BEF1C 800BE31C 27A40050 */  addiu      $a0, $sp, 0x50
/* BEF20 800BE320 F7B40018 */  sdc1       $f20, 0x18($sp)
/* BEF24 800BE324 4485A000 */  mtc1       $a1, $f20
/* BEF28 800BE328 27A50054 */  addiu      $a1, $sp, 0x54
/* BEF2C 800BE32C AFA60050 */  sw         $a2, 0x50($sp)
/* BEF30 800BE330 27A60058 */  addiu      $a2, $sp, 0x58
/* BEF34 800BE334 AFBF0014 */  sw         $ra, 0x14($sp)
/* BEF38 800BE338 F7BE0040 */  sdc1       $f30, 0x40($sp)
/* BEF3C 800BE33C F7BC0038 */  sdc1       $f28, 0x38($sp)
/* BEF40 800BE340 F7BA0030 */  sdc1       $f26, 0x30($sp)
/* BEF44 800BE344 F7B80028 */  sdc1       $f24, 0x28($sp)
/* BEF48 800BE348 F7B60020 */  sdc1       $f22, 0x20($sp)
/* BEF4C 800BE34C 0C03122C */  jal        guNormalize
/* BEF50 800BE350 AFA70054 */   sw        $a3, 0x54($sp)
/* BEF54 800BE354 3C01800F */  lui        $at, %hi(dtor)
/* BEF58 800BE358 C4203720 */  lwc1       $f0, %lo(dtor)($at)
/* BEF5C 800BE35C 4600A502 */  mul.s      $f20, $f20, $f0
/* BEF60 800BE360 0C03328C */  jal        __sinf
/* BEF64 800BE364 4600A306 */   mov.s     $f12, $f20
/* BEF68 800BE368 4600A306 */  mov.s      $f12, $f20
/* BEF6C 800BE36C 0C02FB50 */  jal        __cosf
/* BEF70 800BE370 46000686 */   mov.s     $f26, $f0
/* BEF74 800BE374 C7A40050 */  lwc1       $f4, 0x50($sp)
/* BEF78 800BE378 46042102 */  mul.s      $f4, $f4, $f4
/* BEF7C 800BE37C C7A20058 */  lwc1       $f2, 0x58($sp)
/* BEF80 800BE380 46021082 */  mul.s      $f2, $f2, $f2
/* BEF84 800BE384 46022300 */  add.s      $f12, $f4, $f2
/* BEF88 800BE388 46006604 */  sqrt.s     $f24, $f12
/* BEF8C 800BE38C 4618C032 */  c.eq.s     $f24, $f24
/* BEF90 800BE390 00000000 */  nop
/* BEF94 800BE394 00000000 */  nop
/* BEF98 800BE398 45010004 */  bc1t       .L800BE3AC
/* BEF9C 800BE39C 46000786 */   mov.s     $f30, $f0
/* BEFA0 800BE3A0 0C0334B4 */  jal        _sqrtf
/* BEFA4 800BE3A4 00000000 */   nop
/* BEFA8 800BE3A8 46000606 */  mov.s      $f24, $f0
.L800BE3AC:
/* BEFAC 800BE3AC 0C0311DC */  jal        guMtxIdentF
/* BEFB0 800BE3B0 02002021 */   addu      $a0, $s0, $zero
/* BEFB4 800BE3B4 4480E000 */  mtc1       $zero, $f28
/* BEFB8 800BE3B8 00000000 */  nop
/* BEFBC 800BE3BC 461CC032 */  c.eq.s     $f24, $f28
/* BEFC0 800BE3C0 00000000 */  nop
/* BEFC4 800BE3C4 4501003B */  bc1t       .L800BE4B4
/* BEFC8 800BE3C8 00000000 */   nop
/* BEFCC 800BE3CC C7A00054 */  lwc1       $f0, 0x54($sp)
/* BEFD0 800BE3D0 4600D002 */  mul.s      $f0, $f26, $f0
/* BEFD4 800BE3D4 3C013F80 */  lui        $at, 0x3f80
/* BEFD8 800BE3D8 4481B000 */  mtc1       $at, $f22
/* BEFDC 800BE3DC C7A20058 */  lwc1       $f2, 0x58($sp)
/* BEFE0 800BE3E0 4618B403 */  div.s      $f16, $f22, $f24
/* BEFE4 800BE3E4 46001087 */  neg.s      $f2, $f2
/* BEFE8 800BE3E8 461E1082 */  mul.s      $f2, $f2, $f30
/* BEFEC 800BE3EC C7A40050 */  lwc1       $f4, 0x50($sp)
/* BEFF0 800BE3F0 46040002 */  mul.s      $f0, $f0, $f4
/* BEFF4 800BE3F4 00000000 */  nop
/* BEFF8 800BE3F8 4618D502 */  mul.s      $f20, $f26, $f24
/* BEFFC 800BE3FC 46001081 */  sub.s      $f2, $f2, $f0
/* BF000 800BE400 46101082 */  mul.s      $f2, $f2, $f16
/* BF004 800BE404 00000000 */  nop
/* BF008 800BE408 4618F482 */  mul.s      $f18, $f30, $f24
/* BF00C 800BE40C E6020000 */  swc1       $f2, ($s0)
/* BF010 800BE410 C7AA0058 */  lwc1       $f10, 0x58($sp)
/* BF014 800BE414 461A5382 */  mul.s      $f14, $f10, $f26
/* BF018 800BE418 C7AC0054 */  lwc1       $f12, 0x54($sp)
/* BF01C 800BE41C 460CF102 */  mul.s      $f4, $f30, $f12
/* BF020 800BE420 00000000 */  nop
/* BF024 800BE424 460CD082 */  mul.s      $f2, $f26, $f12
/* BF028 800BE428 C7A60050 */  lwc1       $f6, 0x50($sp)
/* BF02C 800BE42C 4606F202 */  mul.s      $f8, $f30, $f6
/* BF030 800BE430 00000000 */  nop
/* BF034 800BE434 46062002 */  mul.s      $f0, $f4, $f6
/* BF038 800BE438 00000000 */  nop
/* BF03C 800BE43C 460A1082 */  mul.s      $f2, $f2, $f10
/* BF040 800BE440 00000000 */  nop
/* BF044 800BE444 460A2102 */  mul.s      $f4, $f4, $f10
/* BF048 800BE448 46007381 */  sub.s      $f14, $f14, $f0
/* BF04C 800BE44C 4600D007 */  neg.s      $f0, $f26
/* BF050 800BE450 46060002 */  mul.s      $f0, $f0, $f6
/* BF054 800BE454 00000000 */  nop
/* BF058 800BE458 46107382 */  mul.s      $f14, $f14, $f16
/* BF05C 800BE45C E61C0034 */  swc1       $f28, 0x34($s0)
/* BF060 800BE460 E61C0038 */  swc1       $f28, 0x38($s0)
/* BF064 800BE464 46024201 */  sub.s      $f8, $f8, $f2
/* BF068 800BE468 E61C000C */  swc1       $f28, 0xc($s0)
/* BF06C 800BE46C E61C001C */  swc1       $f28, 0x1c($s0)
/* BF070 800BE470 E61C002C */  swc1       $f28, 0x2c($s0)
/* BF074 800BE474 46104202 */  mul.s      $f8, $f8, $f16
/* BF078 800BE478 46040001 */  sub.s      $f0, $f0, $f4
/* BF07C 800BE47C E616003C */  swc1       $f22, 0x3c($s0)
/* BF080 800BE480 E6140004 */  swc1       $f20, 4($s0)
/* BF084 800BE484 E6120014 */  swc1       $f18, 0x14($s0)
/* BF088 800BE488 46006307 */  neg.s      $f12, $f12
/* BF08C 800BE48C E61C0030 */  swc1       $f28, 0x30($s0)
/* BF090 800BE490 46005287 */  neg.s      $f10, $f10
/* BF094 800BE494 46100002 */  mul.s      $f0, $f0, $f16
/* BF098 800BE498 E60C0024 */  swc1       $f12, 0x24($s0)
/* BF09C 800BE49C 46003187 */  neg.s      $f6, $f6
/* BF0A0 800BE4A0 E60A0028 */  swc1       $f10, 0x28($s0)
/* BF0A4 800BE4A4 E6060020 */  swc1       $f6, 0x20($s0)
/* BF0A8 800BE4A8 E60E0010 */  swc1       $f14, 0x10($s0)
/* BF0AC 800BE4AC E6080008 */  swc1       $f8, 8($s0)
/* BF0B0 800BE4B0 E6000018 */  swc1       $f0, 0x18($s0)
.L800BE4B4:
/* BF0B4 800BE4B4 8FBF0014 */  lw         $ra, 0x14($sp)
/* BF0B8 800BE4B8 8FB00010 */  lw         $s0, 0x10($sp)
/* BF0BC 800BE4BC D7BE0040 */  ldc1       $f30, 0x40($sp)
/* BF0C0 800BE4C0 D7BC0038 */  ldc1       $f28, 0x38($sp)
/* BF0C4 800BE4C4 D7BA0030 */  ldc1       $f26, 0x30($sp)
/* BF0C8 800BE4C8 D7B80028 */  ldc1       $f24, 0x28($sp)
/* BF0CC 800BE4CC D7B60020 */  ldc1       $f22, 0x20($sp)
/* BF0D0 800BE4D0 D7B40018 */  ldc1       $f20, 0x18($sp)
/* BF0D4 800BE4D4 03E00008 */  jr         $ra
/* BF0D8 800BE4D8 27BD0048 */   addiu     $sp, $sp, 0x48

glabel guAlign
/* BF0DC 800BE4DC 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* BF0E0 800BE4E0 C7A000B8 */  lwc1       $f0, 0xb8($sp)
/* BF0E4 800BE4E4 AFB1006C */  sw         $s1, 0x6c($sp)
/* BF0E8 800BE4E8 00808821 */  addu       $s1, $a0, $zero
/* BF0EC 800BE4EC 27A40058 */  addiu      $a0, $sp, 0x58
/* BF0F0 800BE4F0 F7B40078 */  sdc1       $f20, 0x78($sp)
/* BF0F4 800BE4F4 4485A000 */  mtc1       $a1, $f20
/* BF0F8 800BE4F8 27A5005C */  addiu      $a1, $sp, 0x5c
/* BF0FC 800BE4FC AFA60058 */  sw         $a2, 0x58($sp)
/* BF100 800BE500 27A60060 */  addiu      $a2, $sp, 0x60
/* BF104 800BE504 AFBF0070 */  sw         $ra, 0x70($sp)
/* BF108 800BE508 AFB00068 */  sw         $s0, 0x68($sp)
/* BF10C 800BE50C F7BE00A0 */  sdc1       $f30, 0xa0($sp)
/* BF110 800BE510 F7BC0098 */  sdc1       $f28, 0x98($sp)
/* BF114 800BE514 F7BA0090 */  sdc1       $f26, 0x90($sp)
/* BF118 800BE518 F7B80088 */  sdc1       $f24, 0x88($sp)
/* BF11C 800BE51C F7B60080 */  sdc1       $f22, 0x80($sp)
/* BF120 800BE520 AFA7005C */  sw         $a3, 0x5c($sp)
/* BF124 800BE524 0C03122C */  jal        guNormalize
/* BF128 800BE528 E7A00060 */   swc1      $f0, 0x60($sp)
/* BF12C 800BE52C 3C01800F */  lui        $at, %hi(dtor)
/* BF130 800BE530 C4203720 */  lwc1       $f0, %lo(dtor)($at)
/* BF134 800BE534 4600A502 */  mul.s      $f20, $f20, $f0
/* BF138 800BE538 0C03328C */  jal        __sinf
/* BF13C 800BE53C 4600A306 */   mov.s     $f12, $f20
/* BF140 800BE540 4600A306 */  mov.s      $f12, $f20
/* BF144 800BE544 0C02FB50 */  jal        __cosf
/* BF148 800BE548 46000606 */   mov.s     $f24, $f0
/* BF14C 800BE54C C7A40058 */  lwc1       $f4, 0x58($sp)
/* BF150 800BE550 46042102 */  mul.s      $f4, $f4, $f4
/* BF154 800BE554 C7A20060 */  lwc1       $f2, 0x60($sp)
/* BF158 800BE558 46021082 */  mul.s      $f2, $f2, $f2
/* BF15C 800BE55C 46022300 */  add.s      $f12, $f4, $f2
/* BF160 800BE560 46006684 */  sqrt.s     $f26, $f12
/* BF164 800BE564 461AD032 */  c.eq.s     $f26, $f26
/* BF168 800BE568 27B00010 */  addiu      $s0, $sp, 0x10
/* BF16C 800BE56C 00000000 */  nop
/* BF170 800BE570 45010004 */  bc1t       .L800BE584
/* BF174 800BE574 46000786 */   mov.s     $f30, $f0
/* BF178 800BE578 0C0334B4 */  jal        _sqrtf
/* BF17C 800BE57C 00000000 */   nop
/* BF180 800BE580 46000686 */  mov.s      $f26, $f0
.L800BE584:
/* BF184 800BE584 0C0311DC */  jal        guMtxIdentF
/* BF188 800BE588 02002021 */   addu      $a0, $s0, $zero
/* BF18C 800BE58C 4480E000 */  mtc1       $zero, $f28
/* BF190 800BE590 00000000 */  nop
/* BF194 800BE594 461CD032 */  c.eq.s     $f26, $f28
/* BF198 800BE598 00000000 */  nop
/* BF19C 800BE59C 00000000 */  nop
/* BF1A0 800BE5A0 45010036 */  bc1t       .L800BE67C
/* BF1A4 800BE5A4 02002021 */   addu      $a0, $s0, $zero
/* BF1A8 800BE5A8 C7AE005C */  lwc1       $f14, 0x5c($sp)
/* BF1AC 800BE5AC 460EC182 */  mul.s      $f6, $f24, $f14
/* BF1B0 800BE5B0 00000000 */  nop
/* BF1B4 800BE5B4 460EF102 */  mul.s      $f4, $f30, $f14
/* BF1B8 800BE5B8 C7A80060 */  lwc1       $f8, 0x60($sp)
/* BF1BC 800BE5BC 46184302 */  mul.s      $f12, $f8, $f24
/* BF1C0 800BE5C0 46004587 */  neg.s      $f22, $f8
/* BF1C4 800BE5C4 461EB482 */  mul.s      $f18, $f22, $f30
/* BF1C8 800BE5C8 E7B60038 */  swc1       $f22, 0x38($sp)
/* BF1CC 800BE5CC 461AC582 */  mul.s      $f22, $f24, $f26
/* BF1D0 800BE5D0 C7A20058 */  lwc1       $f2, 0x58($sp)
/* BF1D4 800BE5D4 46023282 */  mul.s      $f10, $f6, $f2
/* BF1D8 800BE5D8 00000000 */  nop
/* BF1DC 800BE5DC 46022002 */  mul.s      $f0, $f4, $f2
/* BF1E0 800BE5E0 00000000 */  nop
/* BF1E4 800BE5E4 46083182 */  mul.s      $f6, $f6, $f8
/* BF1E8 800BE5E8 00000000 */  nop
/* BF1EC 800BE5EC 46082102 */  mul.s      $f4, $f4, $f8
/* BF1F0 800BE5F0 3C013F80 */  lui        $at, 0x3f80
/* BF1F4 800BE5F4 4481A000 */  mtc1       $at, $f20
/* BF1F8 800BE5F8 00000000 */  nop
/* BF1FC 800BE5FC 461AA403 */  div.s      $f16, $f20, $f26
/* BF200 800BE600 461AF202 */  mul.s      $f8, $f30, $f26
/* BF204 800BE604 460A9481 */  sub.s      $f18, $f18, $f10
/* BF208 800BE608 4602F282 */  mul.s      $f10, $f30, $f2
/* BF20C 800BE60C 46006301 */  sub.s      $f12, $f12, $f0
/* BF210 800BE610 4600C007 */  neg.s      $f0, $f24
/* BF214 800BE614 46020002 */  mul.s      $f0, $f0, $f2
/* BF218 800BE618 00000000 */  nop
/* BF21C 800BE61C 46109482 */  mul.s      $f18, $f18, $f16
/* BF220 800BE620 00000000 */  nop
/* BF224 800BE624 46106302 */  mul.s      $f12, $f12, $f16
/* BF228 800BE628 E7BC0040 */  swc1       $f28, 0x40($sp)
/* BF22C 800BE62C E7BC0044 */  swc1       $f28, 0x44($sp)
/* BF230 800BE630 46065281 */  sub.s      $f10, $f10, $f6
/* BF234 800BE634 E7BC0048 */  swc1       $f28, 0x48($sp)
/* BF238 800BE638 E7BC001C */  swc1       $f28, 0x1c($sp)
/* BF23C 800BE63C E7BC002C */  swc1       $f28, 0x2c($sp)
/* BF240 800BE640 46105282 */  mul.s      $f10, $f10, $f16
/* BF244 800BE644 46007387 */  neg.s      $f14, $f14
/* BF248 800BE648 E7BC003C */  swc1       $f28, 0x3c($sp)
/* BF24C 800BE64C 46040001 */  sub.s      $f0, $f0, $f4
/* BF250 800BE650 E7B4004C */  swc1       $f20, 0x4c($sp)
/* BF254 800BE654 E7AE0034 */  swc1       $f14, 0x34($sp)
/* BF258 800BE658 E7B60014 */  swc1       $f22, 0x14($sp)
/* BF25C 800BE65C 46100002 */  mul.s      $f0, $f0, $f16
/* BF260 800BE660 46001087 */  neg.s      $f2, $f2
/* BF264 800BE664 E7A80024 */  swc1       $f8, 0x24($sp)
/* BF268 800BE668 E7A20030 */  swc1       $f2, 0x30($sp)
/* BF26C 800BE66C E7B20010 */  swc1       $f18, 0x10($sp)
/* BF270 800BE670 E7AC0020 */  swc1       $f12, 0x20($sp)
/* BF274 800BE674 E7AA0018 */  swc1       $f10, 0x18($sp)
/* BF278 800BE678 E7A00028 */  swc1       $f0, 0x28($sp)
.L800BE67C:
/* BF27C 800BE67C 0C03118C */  jal        guMtxF2L
/* BF280 800BE680 02202821 */   addu      $a1, $s1, $zero
/* BF284 800BE684 8FBF0070 */  lw         $ra, 0x70($sp)
/* BF288 800BE688 8FB1006C */  lw         $s1, 0x6c($sp)
/* BF28C 800BE68C 8FB00068 */  lw         $s0, 0x68($sp)
/* BF290 800BE690 D7BE00A0 */  ldc1       $f30, 0xa0($sp)
/* BF294 800BE694 D7BC0098 */  ldc1       $f28, 0x98($sp)
/* BF298 800BE698 D7BA0090 */  ldc1       $f26, 0x90($sp)
/* BF29C 800BE69C D7B80088 */  ldc1       $f24, 0x88($sp)
/* BF2A0 800BE6A0 D7B60080 */  ldc1       $f22, 0x80($sp)
/* BF2A4 800BE6A4 D7B40078 */  ldc1       $f20, 0x78($sp)
/* BF2A8 800BE6A8 03E00008 */  jr         $ra
/* BF2AC 800BE6AC 27BD00A8 */   addiu     $sp, $sp, 0xa8
