.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widgetshadowtext_func_2
/* B9180 800B8580 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B9184 800B8584 AFB1001C */  sw         $s1, 0x1c($sp)
/* B9188 800B8588 30D1FFFF */  andi       $s1, $a2, 0xffff
/* B918C 800B858C AFB20020 */  sw         $s2, 0x20($sp)
/* B9190 800B8590 00809021 */  addu       $s2, $a0, $zero
/* B9194 800B8594 AFB30024 */  sw         $s3, 0x24($sp)
/* B9198 800B8598 00A09821 */  addu       $s3, $a1, $zero
/* B919C 800B859C AFBF0028 */  sw         $ra, 0x28($sp)
/* B91A0 800B85A0 0C02DCFC */  jal        widget_init
/* B91A4 800B85A4 AFB00018 */   sw        $s0, 0x18($sp)
/* B91A8 800B85A8 24040020 */  addiu      $a0, $zero, 0x20
/* B91AC 800B85AC 3C02800E */  lui        $v0, %hi(D_800E4240)
/* B91B0 800B85B0 24424240 */  addiu      $v0, $v0, %lo(D_800E4240)
/* B91B4 800B85B4 0C026259 */  jal        passToMalloc
/* B91B8 800B85B8 AE420078 */   sw        $v0, 0x78($s2)
/* B91BC 800B85BC 00408021 */  addu       $s0, $v0, $zero
/* B91C0 800B85C0 3C01800E */  lui        $at, %hi(D_800E4210)
/* B91C4 800B85C4 C4204210 */  lwc1       $f0, %lo(D_800E4210)($at)
/* B91C8 800B85C8 24020140 */  addiu      $v0, $zero, 0x140
/* B91CC 800B85CC A6020012 */  sh         $v0, 0x12($s0)
/* B91D0 800B85D0 240200FF */  addiu      $v0, $zero, 0xff
/* B91D4 800B85D4 A202001B */  sb         $v0, 0x1b($s0)
/* B91D8 800B85D8 24020001 */  addiu      $v0, $zero, 1
/* B91DC 800B85DC AE02001C */  sw         $v0, 0x1c($s0)
/* B91E0 800B85E0 24020190 */  addiu      $v0, $zero, 0x190
/* B91E4 800B85E4 A6000010 */  sh         $zero, 0x10($s0)
/* B91E8 800B85E8 A6000014 */  sh         $zero, 0x14($s0)
/* B91EC 800B85EC A6000016 */  sh         $zero, 0x16($s0)
/* B91F0 800B85F0 A2000018 */  sb         $zero, 0x18($s0)
/* B91F4 800B85F4 A2000019 */  sb         $zero, 0x19($s0)
/* B91F8 800B85F8 A200001A */  sb         $zero, 0x1a($s0)
/* B91FC 800B85FC E6000008 */  swc1       $f0, 8($s0)
/* B9200 800B8600 16220007 */  bne        $s1, $v0, .L800B8620
/* B9204 800B8604 E600000C */   swc1      $f0, 0xc($s0)
/* B9208 800B8608 12600005 */  beqz       $s3, .L800B8620
/* B920C 800B860C 24110014 */   addiu     $s1, $zero, 0x14
/* B9210 800B8610 0C03353E */  jal        strlen
/* B9214 800B8614 02602021 */   addu      $a0, $s3, $zero
/* B9218 800B8618 24420001 */  addiu      $v0, $v0, 1
/* B921C 800B861C 3051FFFF */  andi       $s1, $v0, 0xffff
.L800B8620:
/* B9220 800B8620 2E220002 */  sltiu      $v0, $s1, 2
/* B9224 800B8624 54400001 */  bnel       $v0, $zero, .L800B862C
/* B9228 800B8628 24110002 */   addiu     $s1, $zero, 2
.L800B862C:
/* B922C 800B862C 02202021 */  addu       $a0, $s1, $zero
/* B9230 800B8630 3C05800E */  lui        $a1, %hi(D_800E41F0)
/* B9234 800B8634 24A541F0 */  addiu      $a1, $a1, %lo(D_800E41F0)
/* B9238 800B8638 0C025F9C */  jal        Malloc
/* B923C 800B863C 2406003C */   addiu     $a2, $zero, 0x3c
/* B9240 800B8640 12600006 */  beqz       $s3, .L800B865C
/* B9244 800B8644 AE020000 */   sw        $v0, ($s0)
/* B9248 800B8648 00402021 */  addu       $a0, $v0, $zero
/* B924C 800B864C 0C0333AC */  jal        sprintf
/* B9250 800B8650 02602821 */   addu      $a1, $s3, $zero
/* B9254 800B8654 0802E19C */  j          .L800B8670
/* B9258 800B8658 02402021 */   addu      $a0, $s2, $zero
.L800B865C:
/* B925C 800B865C 00402021 */  addu       $a0, $v0, $zero
/* B9260 800B8660 3C05800E */  lui        $a1, %hi(D_800E420C)
/* B9264 800B8664 0C0333AC */  jal        sprintf
/* B9268 800B8668 24A5420C */   addiu     $a1, $a1, %lo(D_800E420C)
/* B926C 800B866C 02402021 */  addu       $a0, $s2, $zero
.L800B8670:
/* B9270 800B8670 24050001 */  addiu      $a1, $zero, 1
/* B9274 800B8674 0C02DEC8 */  jal        set_widgets_byte0x70
/* B9278 800B8678 AE500040 */   sw        $s0, 0x40($s2)
/* B927C 800B867C 02402021 */  addu       $a0, $s2, $zero
/* B9280 800B8680 24050050 */  addiu      $a1, $zero, 0x50
/* B9284 800B8684 2406001E */  addiu      $a2, $zero, 0x1e
/* B9288 800B8688 A6400074 */  sh         $zero, 0x74($s2)
/* B928C 800B868C 0C02DD3F */  jal        set_widget_coords
/* B9290 800B8690 A6400072 */   sh        $zero, 0x72($s2)
/* B9294 800B8694 02402021 */  addu       $a0, $s2, $zero
/* B9298 800B8698 240500E1 */  addiu      $a1, $zero, 0xe1
/* B929C 800B869C 240600E1 */  addiu      $a2, $zero, 0xe1
/* B92A0 800B86A0 240200FF */  addiu      $v0, $zero, 0xff
/* B92A4 800B86A4 240700E1 */  addiu      $a3, $zero, 0xe1
/* B92A8 800B86A8 0C02DD4A */  jal        set_widget_color
/* B92AC 800B86AC AFA20010 */   sw        $v0, 0x10($sp)
/* B92B0 800B86B0 02401021 */  addu       $v0, $s2, $zero
/* B92B4 800B86B4 8FBF0028 */  lw         $ra, 0x28($sp)
/* B92B8 800B86B8 8FB30024 */  lw         $s3, 0x24($sp)
/* B92BC 800B86BC 8FB20020 */  lw         $s2, 0x20($sp)
/* B92C0 800B86C0 8FB1001C */  lw         $s1, 0x1c($sp)
/* B92C4 800B86C4 8FB00018 */  lw         $s0, 0x18($sp)
/* B92C8 800B86C8 03E00008 */  jr         $ra
/* B92CC 800B86CC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel free_widgetshadowtext
/* B92D0 800B86D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B92D4 800B86D4 AFB10014 */  sw         $s1, 0x14($sp)
/* B92D8 800B86D8 00808821 */  addu       $s1, $a0, $zero
/* B92DC 800B86DC 3C02800E */  lui        $v0, %hi(D_800E4240)
/* B92E0 800B86E0 24424240 */  addiu      $v0, $v0, %lo(D_800E4240)
/* B92E4 800B86E4 AFBF001C */  sw         $ra, 0x1c($sp)
/* B92E8 800B86E8 AFB20018 */  sw         $s2, 0x18($sp)
/* B92EC 800B86EC AFB00010 */  sw         $s0, 0x10($sp)
/* B92F0 800B86F0 8E300040 */  lw         $s0, 0x40($s1)
/* B92F4 800B86F4 00A09021 */  addu       $s2, $a1, $zero
/* B92F8 800B86F8 1200000A */  beqz       $s0, .L800B8724
/* B92FC 800B86FC AE220078 */   sw        $v0, 0x78($s1)
/* B9300 800B8700 8E040000 */  lw         $a0, ($s0)
/* B9304 800B8704 10800004 */  beqz       $a0, .L800B8718
/* B9308 800B8708 3C05800E */   lui       $a1, %hi(D_800E41F0)
/* B930C 800B870C 24A541F0 */  addiu      $a1, $a1, %lo(D_800E41F0)
/* B9310 800B8710 0C02600C */  jal        Free
/* B9314 800B8714 2406005B */   addiu     $a2, $zero, 0x5b
.L800B8718:
/* B9318 800B8718 0C026262 */  jal        passToFree
/* B931C 800B871C 02002021 */   addu      $a0, $s0, $zero
/* B9320 800B8720 AE200040 */  sw         $zero, 0x40($s1)
.L800B8724:
/* B9324 800B8724 02202021 */  addu       $a0, $s1, $zero
/* B9328 800B8728 0C02DD2B */  jal        free_widget
/* B932C 800B872C 02402821 */   addu      $a1, $s2, $zero
/* B9330 800B8730 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9334 800B8734 8FB20018 */  lw         $s2, 0x18($sp)
/* B9338 800B8738 8FB10014 */  lw         $s1, 0x14($sp)
/* B933C 800B873C 8FB00010 */  lw         $s0, 0x10($sp)
/* B9340 800B8740 03E00008 */  jr         $ra
/* B9344 800B8744 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B8748
/* B9348 800B8748 27BDFF90 */  addiu      $sp, $sp, -0x70
/* B934C 800B874C AFB1004C */  sw         $s1, 0x4c($sp)
/* B9350 800B8750 00808821 */  addu       $s1, $a0, $zero
/* B9354 800B8754 00063400 */  sll        $a2, $a2, 0x10
/* B9358 800B8758 AFB60060 */  sw         $s6, 0x60($sp)
/* B935C 800B875C 0006B403 */  sra        $s6, $a2, 0x10
/* B9360 800B8760 00073C00 */  sll        $a3, $a3, 0x10
/* B9364 800B8764 3C02800F */  lui        $v0, %hi(font_pointer)
/* B9368 800B8768 AFB70064 */  sw         $s7, 0x64($sp)
/* B936C 800B876C 87B70082 */  lh         $s7, 0x82($sp)
/* B9370 800B8770 8C4336F0 */  lw         $v1, %lo(font_pointer)($v0)
/* B9374 800B8774 00073C03 */  sra        $a3, $a3, 0x10
/* B9378 800B8778 AFBE0068 */  sw         $fp, 0x68($sp)
/* B937C 800B877C 87BE0086 */  lh         $fp, 0x86($sp)
/* B9380 800B8780 00405021 */  addu       $t2, $v0, $zero
/* B9384 800B8784 AFBF006C */  sw         $ra, 0x6c($sp)
/* B9388 800B8788 AFB5005C */  sw         $s5, 0x5c($sp)
/* B938C 800B878C AFB40058 */  sw         $s4, 0x58($sp)
/* B9390 800B8790 AFB30054 */  sw         $s3, 0x54($sp)
/* B9394 800B8794 AFB20050 */  sw         $s2, 0x50($sp)
/* B9398 800B8798 AFB00048 */  sw         $s0, 0x48($sp)
/* B939C 800B879C AFA50074 */  sw         $a1, 0x74($sp)
/* B93A0 800B87A0 14600007 */  bnez       $v1, .L800B87C0
/* B93A4 800B87A4 AFA70038 */   sw        $a3, 0x38($sp)
/* B93A8 800B87A8 02C03021 */  addu       $a2, $s6, $zero
/* B93AC 800B87AC AFB70010 */  sw         $s7, 0x10($sp)
/* B93B0 800B87B0 0C02DE14 */  jal        widget_func_8
/* B93B4 800B87B4 AFBE0014 */   sw        $fp, 0x14($sp)
/* B93B8 800B87B8 0802E31F */  j          .L800B8C7C
/* B93BC 800B87BC 8FBF006C */   lw        $ra, 0x6c($sp)
.L800B87C0:
/* B93C0 800B87C0 86330064 */  lh         $s3, 0x64($s1)
/* B93C4 800B87C4 86350066 */  lh         $s5, 0x66($s1)
/* B93C8 800B87C8 86320068 */  lh         $s2, 0x68($s1)
/* B93CC 800B87CC 0276102A */  slt        $v0, $s3, $s6
/* B93D0 800B87D0 10400002 */  beqz       $v0, .L800B87DC
/* B93D4 800B87D4 8634006A */   lh        $s4, 0x6a($s1)
/* B93D8 800B87D8 02C09821 */  addu       $s3, $s6, $zero
.L800B87DC:
/* B93DC 800B87DC 02F5102A */  slt        $v0, $s7, $s5
/* B93E0 800B87E0 54400001 */  bnel       $v0, $zero, .L800B87E8
/* B93E4 800B87E4 02E0A821 */   addu      $s5, $s7, $zero
.L800B87E8:
/* B93E8 800B87E8 8FA30038 */  lw         $v1, 0x38($sp)
/* B93EC 800B87EC 0243102A */  slt        $v0, $s2, $v1
/* B93F0 800B87F0 54400001 */  bnel       $v0, $zero, .L800B87F8
/* B93F4 800B87F4 00609021 */   addu      $s2, $v1, $zero
.L800B87F8:
/* B93F8 800B87F8 03D4102A */  slt        $v0, $fp, $s4
/* B93FC 800B87FC 54400001 */  bnel       $v0, $zero, .L800B8804
/* B9400 800B8800 03C0A021 */   addu      $s4, $fp, $zero
.L800B8804:
/* B9404 800B8804 8E300040 */  lw         $s0, 0x40($s1)
/* B9408 800B8808 00003021 */  addu       $a2, $zero, $zero
/* B940C 800B880C 8E02001C */  lw         $v0, 0x1c($s0)
/* B9410 800B8810 1040009E */  beqz       $v0, .L800B8A8C
/* B9414 800B8814 3C09800F */   lui       $t1, 0x800f
/* B9418 800B8818 8E020014 */  lw         $v0, 0x14($s0)
/* B941C 800B881C 1040009B */  beqz       $v0, .L800B8A8C
/* B9420 800B8820 3C028080 */   lui       $v0, 0x8080
/* B9424 800B8824 9204001B */  lbu        $a0, 0x1b($s0)
/* B9428 800B8828 9225005B */  lbu        $a1, 0x5b($s1)
/* B942C 800B882C 00850018 */  mult       $a0, $a1
/* B9430 800B8830 00001812 */  mflo       $v1
/* B9434 800B8834 34428081 */  ori        $v0, $v0, 0x8081
/* B9438 800B8838 00000000 */  nop
/* B943C 800B883C 00620018 */  mult       $v1, $v0
/* B9440 800B8840 C52436F8 */  lwc1       $f4, 0x36f8($t1)
/* B9444 800B8844 00001010 */  mfhi       $v0
/* B9448 800B8848 00431021 */  addu       $v0, $v0, $v1
/* B944C 800B884C 000211C3 */  sra        $v0, $v0, 7
/* B9450 800B8850 44820000 */  mtc1       $v0, $f0
/* B9454 800B8854 46800020 */  cvt.s.w    $f0, $f0
/* B9458 800B8858 46040002 */  mul.s      $f0, $f0, $f4
/* B945C 800B885C 44801000 */  mtc1       $zero, $f2
/* B9460 800B8860 4600103C */  c.lt.s     $f2, $f0
/* B9464 800B8864 00000000 */  nop
/* B9468 800B8868 45000089 */  bc1f       .L800B8A90
/* B946C 800B886C 00000000 */   nop
/* B9470 800B8870 92020018 */  lbu        $v0, 0x18($s0)
/* B9474 800B8874 44820000 */  mtc1       $v0, $f0
/* B9478 800B8878 46800020 */  cvt.s.w    $f0, $f0
/* B947C 800B887C 46040002 */  mul.s      $f0, $f0, $f4
/* B9480 800B8880 3C01800E */  lui        $at, %hi(D_800E4214)
/* B9484 800B8884 C4224214 */  lwc1       $f2, %lo(D_800E4214)($at)
/* B9488 800B8888 4600103E */  c.le.s     $f2, $f0
/* B948C 800B888C 00000000 */  nop
/* B9490 800B8890 45030005 */  bc1tl      .L800B88A8
/* B9494 800B8894 46020001 */   sub.s     $f0, $f0, $f2
/* B9498 800B8898 4600008D */  trunc.w.s  $f2, $f0
/* B949C 800B889C 44061000 */  mfc1       $a2, $f2
/* B94A0 800B88A0 0802E22F */  j          .L800B88BC
/* B94A4 800B88A4 92020019 */   lbu       $v0, 0x19($s0)
.L800B88A8:
/* B94A8 800B88A8 4600008D */  trunc.w.s  $f2, $f0
/* B94AC 800B88AC 44061000 */  mfc1       $a2, $f2
/* B94B0 800B88B0 3C028000 */  lui        $v0, 0x8000
/* B94B4 800B88B4 00C23025 */  or         $a2, $a2, $v0
/* B94B8 800B88B8 92020019 */  lbu        $v0, 0x19($s0)
.L800B88BC:
/* B94BC 800B88BC C52236F8 */  lwc1       $f2, 0x36f8($t1)
/* B94C0 800B88C0 44820000 */  mtc1       $v0, $f0
/* B94C4 800B88C4 46800020 */  cvt.s.w    $f0, $f0
/* B94C8 800B88C8 46020002 */  mul.s      $f0, $f0, $f2
/* B94CC 800B88CC 3C01800E */  lui        $at, %hi(D_800E4218)
/* B94D0 800B88D0 C4224218 */  lwc1       $f2, %lo(D_800E4218)($at)
/* B94D4 800B88D4 4600103E */  c.le.s     $f2, $f0
/* B94D8 800B88D8 00000000 */  nop
/* B94DC 800B88DC 45010005 */  bc1t       .L800B88F4
/* B94E0 800B88E0 30C800FF */   andi      $t0, $a2, 0xff
/* B94E4 800B88E4 4600008D */  trunc.w.s  $f2, $f0
/* B94E8 800B88E8 44061000 */  mfc1       $a2, $f2
/* B94EC 800B88EC 0802E243 */  j          .L800B890C
/* B94F0 800B88F0 9202001A */   lbu       $v0, 0x1a($s0)
.L800B88F4:
/* B94F4 800B88F4 46020001 */  sub.s      $f0, $f0, $f2
/* B94F8 800B88F8 4600008D */  trunc.w.s  $f2, $f0
/* B94FC 800B88FC 44061000 */  mfc1       $a2, $f2
/* B9500 800B8900 3C028000 */  lui        $v0, 0x8000
/* B9504 800B8904 00C23025 */  or         $a2, $a2, $v0
/* B9508 800B8908 9202001A */  lbu        $v0, 0x1a($s0)
.L800B890C:
/* B950C 800B890C C52236F8 */  lwc1       $f2, 0x36f8($t1)
/* B9510 800B8910 44820000 */  mtc1       $v0, $f0
/* B9514 800B8914 46800020 */  cvt.s.w    $f0, $f0
/* B9518 800B8918 46020002 */  mul.s      $f0, $f0, $f2
/* B951C 800B891C 3C01800E */  lui        $at, %hi(D_800E421C)
/* B9520 800B8920 C422421C */  lwc1       $f2, %lo(D_800E421C)($at)
/* B9524 800B8924 4600103E */  c.le.s     $f2, $f0
/* B9528 800B8928 00000000 */  nop
/* B952C 800B892C 45010006 */  bc1t       .L800B8948
/* B9530 800B8930 30C700FF */   andi      $a3, $a2, 0xff
/* B9534 800B8934 4600008D */  trunc.w.s  $f2, $f0
/* B9538 800B8938 44061000 */  mfc1       $a2, $f2
/* B953C 800B893C 00850018 */  mult       $a0, $a1
/* B9540 800B8940 0802E258 */  j          .L800B8960
/* B9544 800B8944 00000000 */   nop
.L800B8948:
/* B9548 800B8948 46020001 */  sub.s      $f0, $f0, $f2
/* B954C 800B894C 4600008D */  trunc.w.s  $f2, $f0
/* B9550 800B8950 44061000 */  mfc1       $a2, $f2
/* B9554 800B8954 3C028000 */  lui        $v0, 0x8000
/* B9558 800B8958 00C23025 */  or         $a2, $a2, $v0
/* B955C 800B895C 00850018 */  mult       $a0, $a1
.L800B8960:
/* B9560 800B8960 00001812 */  mflo       $v1
/* B9564 800B8964 3C028080 */  lui        $v0, 0x8080
/* B9568 800B8968 34428081 */  ori        $v0, $v0, 0x8081
/* B956C 800B896C 00620018 */  mult       $v1, $v0
/* B9570 800B8970 C52236F8 */  lwc1       $f2, 0x36f8($t1)
/* B9574 800B8974 00001010 */  mfhi       $v0
/* B9578 800B8978 00431021 */  addu       $v0, $v0, $v1
/* B957C 800B897C 000211C3 */  sra        $v0, $v0, 7
/* B9580 800B8980 44820000 */  mtc1       $v0, $f0
/* B9584 800B8984 46800020 */  cvt.s.w    $f0, $f0
/* B9588 800B8988 46020002 */  mul.s      $f0, $f0, $f2
/* B958C 800B898C 3C01800E */  lui        $at, %hi(D_800E4220)
/* B9590 800B8990 C4224220 */  lwc1       $f2, %lo(D_800E4220)($at)
/* B9594 800B8994 4600103E */  c.le.s     $f2, $f0
/* B9598 800B8998 00000000 */  nop
/* B959C 800B899C 45010005 */  bc1t       .L800B89B4
/* B95A0 800B89A0 30C400FF */   andi      $a0, $a2, 0xff
/* B95A4 800B89A4 4600008D */  trunc.w.s  $f2, $f0
/* B95A8 800B89A8 44031000 */  mfc1       $v1, $f2
/* B95AC 800B89AC 0802E273 */  j          .L800B89CC
/* B95B0 800B89B0 8D4236F0 */   lw        $v0, 0x36f0($t2)
.L800B89B4:
/* B95B4 800B89B4 46020001 */  sub.s      $f0, $f0, $f2
/* B95B8 800B89B8 4600008D */  trunc.w.s  $f2, $f0
/* B95BC 800B89BC 44031000 */  mfc1       $v1, $f2
/* B95C0 800B89C0 3C028000 */  lui        $v0, %hi(D_8000001C)
/* B95C4 800B89C4 00621825 */  or         $v1, $v1, $v0
/* B95C8 800B89C8 8D4236F0 */  lw         $v0, 0x36f0($t2)
.L800B89CC:
/* B95CC 800B89CC A048001C */  sb         $t0, %lo(D_8000001C)($v0)
/* B95D0 800B89D0 A047001D */  sb         $a3, 0x1d($v0)
/* B95D4 800B89D4 A044001E */  sb         $a0, 0x1e($v0)
/* B95D8 800B89D8 A043001F */  sb         $v1, 0x1f($v0)
/* B95DC 800B89DC 86230062 */  lh         $v1, 0x62($s1)
/* B95E0 800B89E0 86020016 */  lh         $v0, 0x16($s0)
/* B95E4 800B89E4 86080014 */  lh         $t0, 0x14($s0)
/* B95E8 800B89E8 00621821 */  addu       $v1, $v1, $v0
/* B95EC 800B89EC AFA30010 */  sw         $v1, 0x10($sp)
/* B95F0 800B89F0 96020010 */  lhu        $v0, 0x10($s0)
/* B95F4 800B89F4 96030014 */  lhu        $v1, 0x14($s0)
/* B95F8 800B89F8 00431021 */  addu       $v0, $v0, $v1
/* B95FC 800B89FC 00021400 */  sll        $v0, $v0, 0x10
/* B9600 800B8A00 00021403 */  sra        $v0, $v0, 0x10
/* B9604 800B8A04 AFA20014 */  sw         $v0, 0x14($sp)
/* B9608 800B8A08 96030012 */  lhu        $v1, 0x12($s0)
/* B960C 800B8A0C 96020014 */  lhu        $v0, 0x14($s0)
/* B9610 800B8A10 00621821 */  addu       $v1, $v1, $v0
/* B9614 800B8A14 00031C00 */  sll        $v1, $v1, 0x10
/* B9618 800B8A18 00031C03 */  sra        $v1, $v1, 0x10
/* B961C 800B8A1C AFA30018 */  sw         $v1, 0x18($sp)
/* B9620 800B8A20 86020014 */  lh         $v0, 0x14($s0)
/* B9624 800B8A24 02621021 */  addu       $v0, $s3, $v0
/* B9628 800B8A28 AFA2001C */  sw         $v0, 0x1c($sp)
/* B962C 800B8A2C 86030016 */  lh         $v1, 0x16($s0)
/* B9630 800B8A30 02431821 */  addu       $v1, $s2, $v1
/* B9634 800B8A34 AFA30020 */  sw         $v1, 0x20($sp)
/* B9638 800B8A38 86020014 */  lh         $v0, 0x14($s0)
/* B963C 800B8A3C 02A21021 */  addu       $v0, $s5, $v0
/* B9640 800B8A40 AFA20024 */  sw         $v0, 0x24($sp)
/* B9644 800B8A44 86030016 */  lh         $v1, 0x16($s0)
/* B9648 800B8A48 8D4436F0 */  lw         $a0, 0x36f0($t2)
/* B964C 800B8A4C 02831821 */  addu       $v1, $s4, $v1
/* B9650 800B8A50 AFA30028 */  sw         $v1, 0x28($sp)
/* B9654 800B8A54 C6000008 */  lwc1       $f0, 8($s0)
/* B9658 800B8A58 E7A0002C */  swc1       $f0, 0x2c($sp)
/* B965C 800B8A5C C602000C */  lwc1       $f2, 0xc($s0)
/* B9660 800B8A60 E7A20030 */  swc1       $f2, 0x30($sp)
/* B9664 800B8A64 86270060 */  lh         $a3, 0x60($s1)
/* B9668 800B8A68 8E060000 */  lw         $a2, ($s0)
/* B966C 800B8A6C 27A50074 */  addiu      $a1, $sp, 0x74
/* B9670 800B8A70 AFA90040 */  sw         $t1, 0x40($sp)
/* B9674 800B8A74 AFAA0044 */  sw         $t2, 0x44($sp)
/* B9678 800B8A78 0C02D212 */  jal        display_text_func_A
/* B967C 800B8A7C 00E83821 */   addu      $a3, $a3, $t0
/* B9680 800B8A80 00403021 */  addu       $a2, $v0, $zero
/* B9684 800B8A84 8FAA0044 */  lw         $t2, 0x44($sp)
/* B9688 800B8A88 8FA90040 */  lw         $t1, 0x40($sp)
.L800B8A8C:
/* B968C 800B8A8C C52436F8 */  lwc1       $f4, 0x36f8($t1)
.L800B8A90:
/* B9690 800B8A90 3C01800E */  lui        $at, %hi(D_800E4224)
/* B9694 800B8A94 C4204224 */  lwc1       $f0, %lo(D_800E4224)($at)
/* B9698 800B8A98 46002002 */  mul.s      $f0, $f4, $f0
/* B969C 800B8A9C 44801000 */  mtc1       $zero, $f2
/* B96A0 800B8AA0 4600103C */  c.lt.s     $f2, $f0
/* B96A4 800B8AA4 00000000 */  nop
/* B96A8 800B8AA8 45000068 */  bc1f       .L800B8C4C
/* B96AC 800B8AAC 02202021 */   addu      $a0, $s1, $zero
/* B96B0 800B8AB0 92220058 */  lbu        $v0, 0x58($s1)
/* B96B4 800B8AB4 44820000 */  mtc1       $v0, $f0
/* B96B8 800B8AB8 46800020 */  cvt.s.w    $f0, $f0
/* B96BC 800B8ABC 46040002 */  mul.s      $f0, $f0, $f4
/* B96C0 800B8AC0 3C01800E */  lui        $at, %hi(D_800E4228)
/* B96C4 800B8AC4 C4224228 */  lwc1       $f2, %lo(D_800E4228)($at)
/* B96C8 800B8AC8 4600103E */  c.le.s     $f2, $f0
/* B96CC 800B8ACC 00000000 */  nop
/* B96D0 800B8AD0 45030005 */  bc1tl      .L800B8AE8
/* B96D4 800B8AD4 46020001 */   sub.s     $f0, $f0, $f2
/* B96D8 800B8AD8 4600008D */  trunc.w.s  $f2, $f0
/* B96DC 800B8ADC 44031000 */  mfc1       $v1, $f2
/* B96E0 800B8AE0 0802E2BF */  j          .L800B8AFC
/* B96E4 800B8AE4 92220059 */   lbu       $v0, 0x59($s1)
.L800B8AE8:
/* B96E8 800B8AE8 4600008D */  trunc.w.s  $f2, $f0
/* B96EC 800B8AEC 44031000 */  mfc1       $v1, $f2
/* B96F0 800B8AF0 3C028000 */  lui        $v0, 0x8000
/* B96F4 800B8AF4 00621825 */  or         $v1, $v1, $v0
/* B96F8 800B8AF8 92220059 */  lbu        $v0, 0x59($s1)
.L800B8AFC:
/* B96FC 800B8AFC C52236F8 */  lwc1       $f2, 0x36f8($t1)
/* B9700 800B8B00 44820000 */  mtc1       $v0, $f0
/* B9704 800B8B04 46800020 */  cvt.s.w    $f0, $f0
/* B9708 800B8B08 46020002 */  mul.s      $f0, $f0, $f2
/* B970C 800B8B0C 3C01800E */  lui        $at, %hi(D_800E422C)
/* B9710 800B8B10 C422422C */  lwc1       $f2, %lo(D_800E422C)($at)
/* B9714 800B8B14 4600103E */  c.le.s     $f2, $f0
/* B9718 800B8B18 00000000 */  nop
/* B971C 800B8B1C 45010005 */  bc1t       .L800B8B34
/* B9720 800B8B20 306600FF */   andi      $a2, $v1, 0xff
/* B9724 800B8B24 4600008D */  trunc.w.s  $f2, $f0
/* B9728 800B8B28 44031000 */  mfc1       $v1, $f2
/* B972C 800B8B2C 0802E2D3 */  j          .L800B8B4C
/* B9730 800B8B30 9222005A */   lbu       $v0, 0x5a($s1)
.L800B8B34:
/* B9734 800B8B34 46020001 */  sub.s      $f0, $f0, $f2
/* B9738 800B8B38 4600008D */  trunc.w.s  $f2, $f0
/* B973C 800B8B3C 44031000 */  mfc1       $v1, $f2
/* B9740 800B8B40 3C028000 */  lui        $v0, 0x8000
/* B9744 800B8B44 00621825 */  or         $v1, $v1, $v0
/* B9748 800B8B48 9222005A */  lbu        $v0, 0x5a($s1)
.L800B8B4C:
/* B974C 800B8B4C C52236F8 */  lwc1       $f2, 0x36f8($t1)
/* B9750 800B8B50 44820000 */  mtc1       $v0, $f0
/* B9754 800B8B54 46800020 */  cvt.s.w    $f0, $f0
/* B9758 800B8B58 46020002 */  mul.s      $f0, $f0, $f2
/* B975C 800B8B5C 3C01800E */  lui        $at, %hi(D_800E4230)
/* B9760 800B8B60 C4224230 */  lwc1       $f2, %lo(D_800E4230)($at)
/* B9764 800B8B64 4600103E */  c.le.s     $f2, $f0
/* B9768 800B8B68 00000000 */  nop
/* B976C 800B8B6C 45010005 */  bc1t       .L800B8B84
/* B9770 800B8B70 306500FF */   andi      $a1, $v1, 0xff
/* B9774 800B8B74 4600008D */  trunc.w.s  $f2, $f0
/* B9778 800B8B78 44031000 */  mfc1       $v1, $f2
/* B977C 800B8B7C 0802E2E7 */  j          .L800B8B9C
/* B9780 800B8B80 C52236F8 */   lwc1      $f2, 0x36f8($t1)
.L800B8B84:
/* B9784 800B8B84 46020001 */  sub.s      $f0, $f0, $f2
/* B9788 800B8B88 4600008D */  trunc.w.s  $f2, $f0
/* B978C 800B8B8C 44031000 */  mfc1       $v1, $f2
/* B9790 800B8B90 3C028000 */  lui        $v0, 0x8000
/* B9794 800B8B94 00621825 */  or         $v1, $v1, $v0
/* B9798 800B8B98 C52236F8 */  lwc1       $f2, 0x36f8($t1)
.L800B8B9C:
/* B979C 800B8B9C 3C01800E */  lui        $at, %hi(D_800E4234)
/* B97A0 800B8BA0 C4204234 */  lwc1       $f0, %lo(D_800E4234)($at)
/* B97A4 800B8BA4 46001002 */  mul.s      $f0, $f2, $f0
/* B97A8 800B8BA8 3C01800E */  lui        $at, %hi(D_800E4238)
/* B97AC 800B8BAC C4224238 */  lwc1       $f2, %lo(D_800E4238)($at)
/* B97B0 800B8BB0 4600103E */  c.le.s     $f2, $f0
/* B97B4 800B8BB4 00000000 */  nop
/* B97B8 800B8BB8 45010005 */  bc1t       .L800B8BD0
/* B97BC 800B8BBC 306400FF */   andi      $a0, $v1, 0xff
/* B97C0 800B8BC0 4600008D */  trunc.w.s  $f2, $f0
/* B97C4 800B8BC4 44031000 */  mfc1       $v1, $f2
/* B97C8 800B8BC8 0802E2FA */  j          .L800B8BE8
/* B97CC 800B8BCC 8D4236F0 */   lw        $v0, 0x36f0($t2)
.L800B8BD0:
/* B97D0 800B8BD0 46020001 */  sub.s      $f0, $f0, $f2
/* B97D4 800B8BD4 4600008D */  trunc.w.s  $f2, $f0
/* B97D8 800B8BD8 44031000 */  mfc1       $v1, $f2
/* B97DC 800B8BDC 3C028000 */  lui        $v0, %hi(D_8000001C)
/* B97E0 800B8BE0 00621825 */  or         $v1, $v1, $v0
/* B97E4 800B8BE4 8D4236F0 */  lw         $v0, 0x36f0($t2)
.L800B8BE8:
/* B97E8 800B8BE8 A046001C */  sb         $a2, %lo(D_8000001C)($v0)
/* B97EC 800B8BEC A045001D */  sb         $a1, 0x1d($v0)
/* B97F0 800B8BF0 A044001E */  sb         $a0, 0x1e($v0)
/* B97F4 800B8BF4 A043001F */  sb         $v1, 0x1f($v0)
/* B97F8 800B8BF8 86220062 */  lh         $v0, 0x62($s1)
/* B97FC 800B8BFC 8D4436F0 */  lw         $a0, 0x36f0($t2)
/* B9800 800B8C00 AFA20010 */  sw         $v0, 0x10($sp)
/* B9804 800B8C04 86030010 */  lh         $v1, 0x10($s0)
/* B9808 800B8C08 AFA30014 */  sw         $v1, 0x14($sp)
/* B980C 800B8C0C 86020012 */  lh         $v0, 0x12($s0)
/* B9810 800B8C10 AFB3001C */  sw         $s3, 0x1c($sp)
/* B9814 800B8C14 AFB20020 */  sw         $s2, 0x20($sp)
/* B9818 800B8C18 AFB50024 */  sw         $s5, 0x24($sp)
/* B981C 800B8C1C AFB40028 */  sw         $s4, 0x28($sp)
/* B9820 800B8C20 AFA20018 */  sw         $v0, 0x18($sp)
/* B9824 800B8C24 C6000008 */  lwc1       $f0, 8($s0)
/* B9828 800B8C28 E7A0002C */  swc1       $f0, 0x2c($sp)
/* B982C 800B8C2C C602000C */  lwc1       $f2, 0xc($s0)
/* B9830 800B8C30 E7A20030 */  swc1       $f2, 0x30($sp)
/* B9834 800B8C34 86270060 */  lh         $a3, 0x60($s1)
/* B9838 800B8C38 8E060000 */  lw         $a2, ($s0)
/* B983C 800B8C3C 0C02D212 */  jal        display_text_func_A
/* B9840 800B8C40 27A50074 */   addiu     $a1, $sp, 0x74
/* B9844 800B8C44 00403021 */  addu       $a2, $v0, $zero
/* B9848 800B8C48 02202021 */  addu       $a0, $s1, $zero
.L800B8C4C:
/* B984C 800B8C4C 0C02DD46 */  jal        set_widgetWidth
/* B9850 800B8C50 30C5FFFF */   andi      $a1, $a2, 0xffff
/* B9854 800B8C54 02202021 */  addu       $a0, $s1, $zero
/* B9858 800B8C58 8FA50074 */  lw         $a1, 0x74($sp)
/* B985C 800B8C5C 8FA70038 */  lw         $a3, 0x38($sp)
/* B9860 800B8C60 02C03021 */  addu       $a2, $s6, $zero
/* B9864 800B8C64 AFB70010 */  sw         $s7, 0x10($sp)
/* B9868 800B8C68 0C02DE14 */  jal        widget_func_8
/* B986C 800B8C6C AFBE0014 */   sw        $fp, 0x14($sp)
/* B9870 800B8C70 00401821 */  addu       $v1, $v0, $zero
/* B9874 800B8C74 AFA30074 */  sw         $v1, 0x74($sp)
/* B9878 800B8C78 8FBF006C */  lw         $ra, 0x6c($sp)
.L800B8C7C:
/* B987C 800B8C7C 8FBE0068 */  lw         $fp, 0x68($sp)
/* B9880 800B8C80 8FB70064 */  lw         $s7, 0x64($sp)
/* B9884 800B8C84 8FB60060 */  lw         $s6, 0x60($sp)
/* B9888 800B8C88 8FB5005C */  lw         $s5, 0x5c($sp)
/* B988C 800B8C8C 8FB40058 */  lw         $s4, 0x58($sp)
/* B9890 800B8C90 8FB30054 */  lw         $s3, 0x54($sp)
/* B9894 800B8C94 8FB20050 */  lw         $s2, 0x50($sp)
/* B9898 800B8C98 8FB1004C */  lw         $s1, 0x4c($sp)
/* B989C 800B8C9C 8FB00048 */  lw         $s0, 0x48($sp)
/* B98A0 800B8CA0 03E00008 */  jr         $ra
/* B98A4 800B8CA4 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_800B8CA8
/* B98A8 800B8CA8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B98AC 800B8CAC AFB10014 */  sw         $s1, 0x14($sp)
/* B98B0 800B8CB0 00808821 */  addu       $s1, $a0, $zero
/* B98B4 800B8CB4 3C02800F */  lui        $v0, %hi(font_pointer)
/* B98B8 800B8CB8 AFBF0018 */  sw         $ra, 0x18($sp)
/* B98BC 800B8CBC AFB00010 */  sw         $s0, 0x10($sp)
/* B98C0 800B8CC0 8E300040 */  lw         $s0, 0x40($s1)
/* B98C4 800B8CC4 8C4436F0 */  lw         $a0, %lo(font_pointer)($v0)
/* B98C8 800B8CC8 8E050000 */  lw         $a1, ($s0)
/* B98CC 800B8CCC 0C02D44A */  jal        func_800B5128
/* B98D0 800B8CD0 8E060008 */   lw        $a2, 8($s0)
/* B98D4 800B8CD4 86050012 */  lh         $a1, 0x12($s0)
/* B98D8 800B8CD8 86040010 */  lh         $a0, 0x10($s0)
/* B98DC 800B8CDC 00401821 */  addu       $v1, $v0, $zero
/* B98E0 800B8CE0 00A4102A */  slt        $v0, $a1, $a0
/* B98E4 800B8CE4 10400003 */  beqz       $v0, .L800B8CF4
/* B98E8 800B8CE8 00001021 */   addu      $v0, $zero, $zero
/* B98EC 800B8CEC 0802E347 */  j          .L800B8D1C
/* B98F0 800B8CF0 A6200074 */   sh        $zero, 0x74($s1)
.L800B8CF4:
/* B98F4 800B8CF4 00A42023 */  subu       $a0, $a1, $a0
/* B98F8 800B8CF8 0083102B */  sltu       $v0, $a0, $v1
/* B98FC 800B8CFC 54400001 */  bnel       $v0, $zero, .L800B8D04
/* B9900 800B8D00 00801821 */   addu      $v1, $a0, $zero
.L800B8D04:
/* B9904 800B8D04 86020014 */  lh         $v0, 0x14($s0)
/* B9908 800B8D08 04420001 */  bltzl      $v0, .L800B8D10
/* B990C 800B8D0C 00021023 */   negu      $v0, $v0
.L800B8D10:
/* B9910 800B8D10 00621021 */  addu       $v0, $v1, $v0
/* B9914 800B8D14 A6220074 */  sh         $v0, 0x74($s1)
/* B9918 800B8D18 3042FFFF */  andi       $v0, $v0, 0xffff
.L800B8D1C:
/* B991C 800B8D1C 8FBF0018 */  lw         $ra, 0x18($sp)
/* B9920 800B8D20 8FB10014 */  lw         $s1, 0x14($sp)
/* B9924 800B8D24 8FB00010 */  lw         $s0, 0x10($sp)
/* B9928 800B8D28 03E00008 */  jr         $ra
/* B992C 800B8D2C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B8D30
/* B9930 800B8D30 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B9934 800B8D34 AFB1001C */  sw         $s1, 0x1c($sp)
/* B9938 800B8D38 00808821 */  addu       $s1, $a0, $zero
/* B993C 800B8D3C 3C02800F */  lui        $v0, %hi(font_pointer)
/* B9940 800B8D40 AFBF0020 */  sw         $ra, 0x20($sp)
/* B9944 800B8D44 AFB00018 */  sw         $s0, 0x18($sp)
/* B9948 800B8D48 8E300040 */  lw         $s0, 0x40($s1)
/* B994C 800B8D4C 8C4436F0 */  lw         $a0, %lo(font_pointer)($v0)
/* B9950 800B8D50 C6020008 */  lwc1       $f2, 8($s0)
/* B9954 800B8D54 86060010 */  lh         $a2, 0x10($s0)
/* B9958 800B8D58 86070012 */  lh         $a3, 0x12($s0)
/* B995C 800B8D5C E7A20010 */  swc1       $f2, 0x10($sp)
/* B9960 800B8D60 C600000C */  lwc1       $f0, 0xc($s0)
/* B9964 800B8D64 E7A00014 */  swc1       $f0, 0x14($sp)
/* B9968 800B8D68 0C02D4AD */  jal        func_800B52B4
/* B996C 800B8D6C 8E050000 */   lw        $a1, ($s0)
/* B9970 800B8D70 86030016 */  lh         $v1, 0x16($s0)
/* B9974 800B8D74 8FBF0020 */  lw         $ra, 0x20($sp)
/* B9978 800B8D78 8FB00018 */  lw         $s0, 0x18($sp)
/* B997C 800B8D7C 04620001 */  bltzl      $v1, .L800B8D84
/* B9980 800B8D80 00031823 */   negu      $v1, $v1
.L800B8D84:
/* B9984 800B8D84 00431021 */  addu       $v0, $v0, $v1
/* B9988 800B8D88 A6220072 */  sh         $v0, 0x72($s1)
/* B998C 800B8D8C 8FB1001C */  lw         $s1, 0x1c($sp)
/* B9990 800B8D90 3042FFFF */  andi       $v0, $v0, 0xffff
/* B9994 800B8D94 03E00008 */  jr         $ra
/* B9998 800B8D98 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B8D9C
/* B999C 800B8D9C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B99A0 800B8DA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* B99A4 800B8DA4 0C02DE51 */  jal        func_800B7944
/* B99A8 800B8DA8 00000000 */   nop
/* B99AC 800B8DAC 8FBF0010 */  lw         $ra, 0x10($sp)
/* B99B0 800B8DB0 03E00008 */  jr         $ra
/* B99B4 800B8DB4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Ofunc_widgetshadowtext
/* B99B8 800B8DB8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B99BC 800B8DBC AFB20018 */  sw         $s2, 0x18($sp)
/* B99C0 800B8DC0 00A09021 */  addu       $s2, $a1, $zero
/* B99C4 800B8DC4 AFBF001C */  sw         $ra, 0x1c($sp)
/* B99C8 800B8DC8 AFB10014 */  sw         $s1, 0x14($sp)
/* B99CC 800B8DCC AFB00010 */  sw         $s0, 0x10($sp)
/* B99D0 800B8DD0 8C910040 */  lw         $s1, 0x40($a0)
/* B99D4 800B8DD4 02402021 */  addu       $a0, $s2, $zero
/* B99D8 800B8DD8 0C03353E */  jal        strlen
/* B99DC 800B8DDC 00C08021 */   addu      $s0, $a2, $zero
/* B99E0 800B8DE0 96230004 */  lhu        $v1, 4($s1)
/* B99E4 800B8DE4 24420001 */  addiu      $v0, $v0, 1
/* B99E8 800B8DE8 0062182A */  slt        $v1, $v1, $v0
/* B99EC 800B8DEC 14600006 */  bnez       $v1, .L800B8E08
/* B99F0 800B8DF0 00000000 */   nop
/* B99F4 800B8DF4 8E240000 */  lw         $a0, ($s1)
/* B99F8 800B8DF8 0C0333AC */  jal        sprintf
/* B99FC 800B8DFC 02402821 */   addu      $a1, $s2, $zero
/* B9A00 800B8E00 0802E398 */  j          .L800B8E60
/* B9A04 800B8E04 24020001 */   addiu     $v0, $zero, 1
.L800B8E08:
/* B9A08 800B8E08 16000003 */  bnez       $s0, .L800B8E18
/* B9A0C 800B8E0C 3C10800E */   lui       $s0, %hi(D_800E41F0)
/* B9A10 800B8E10 0802E398 */  j          .L800B8E60
/* B9A14 800B8E14 00001021 */   addu      $v0, $zero, $zero
.L800B8E18:
/* B9A18 800B8E18 261041F0 */  addiu      $s0, $s0, %lo(D_800E41F0)
/* B9A1C 800B8E1C 02002821 */  addu       $a1, $s0, $zero
/* B9A20 800B8E20 8E240000 */  lw         $a0, ($s1)
/* B9A24 800B8E24 0C02600C */  jal        Free
/* B9A28 800B8E28 240600EE */   addiu     $a2, $zero, 0xee
/* B9A2C 800B8E2C 0C03353E */  jal        strlen
/* B9A30 800B8E30 02402021 */   addu      $a0, $s2, $zero
/* B9A34 800B8E34 02002821 */  addu       $a1, $s0, $zero
/* B9A38 800B8E38 24420001 */  addiu      $v0, $v0, 1
/* B9A3C 800B8E3C A6220004 */  sh         $v0, 4($s1)
/* B9A40 800B8E40 3044FFFF */  andi       $a0, $v0, 0xffff
/* B9A44 800B8E44 0C025F9C */  jal        Malloc
/* B9A48 800B8E48 240600F1 */   addiu     $a2, $zero, 0xf1
/* B9A4C 800B8E4C 00402021 */  addu       $a0, $v0, $zero
/* B9A50 800B8E50 02402821 */  addu       $a1, $s2, $zero
/* B9A54 800B8E54 0C02626C */  jal        copy_string
/* B9A58 800B8E58 AE220000 */   sw        $v0, ($s1)
/* B9A5C 800B8E5C 24020001 */  addiu      $v0, $zero, 1
.L800B8E60:
/* B9A60 800B8E60 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9A64 800B8E64 8FB20018 */  lw         $s2, 0x18($sp)
/* B9A68 800B8E68 8FB10014 */  lw         $s1, 0x14($sp)
/* B9A6C 800B8E6C 8FB00010 */  lw         $s0, 0x10($sp)
/* B9A70 800B8E70 03E00008 */  jr         $ra
/* B9A74 800B8E74 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret2
/* B9A78 800B8E78 03E00008 */  jr         $ra
/* B9A7C 800B8E7C 24020002 */   addiu     $v0, $zero, 2

glabel widgettext_func_2
/* B9A80 800B8E80 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B9A84 800B8E84 AFB00018 */  sw         $s0, 0x18($sp)
/* B9A88 800B8E88 30D0FFFF */  andi       $s0, $a2, 0xffff
/* B9A8C 800B8E8C AFB20020 */  sw         $s2, 0x20($sp)
/* B9A90 800B8E90 00809021 */  addu       $s2, $a0, $zero
/* B9A94 800B8E94 AFB30024 */  sw         $s3, 0x24($sp)
/* B9A98 800B8E98 00A09821 */  addu       $s3, $a1, $zero
/* B9A9C 800B8E9C AFBF0028 */  sw         $ra, 0x28($sp)
/* B9AA0 800B8EA0 0C02DCFC */  jal        widget_init
/* B9AA4 800B8EA4 AFB1001C */   sw        $s1, 0x1c($sp)
/* B9AA8 800B8EA8 24040010 */  addiu      $a0, $zero, 0x10
/* B9AAC 800B8EAC 3C02800E */  lui        $v0, %hi(widgettext_methods)
/* B9AB0 800B8EB0 24424340 */  addiu      $v0, $v0, %lo(widgettext_methods)
/* B9AB4 800B8EB4 0C026259 */  jal        passToMalloc
/* B9AB8 800B8EB8 AE420078 */   sw        $v0, 0x78($s2)
/* B9ABC 800B8EBC 00408821 */  addu       $s1, $v0, $zero
/* B9AC0 800B8EC0 3C01800E */  lui        $at, %hi(D_800E432C)
/* B9AC4 800B8EC4 C420432C */  lwc1       $f0, %lo(D_800E432C)($at)
/* B9AC8 800B8EC8 2E020002 */  sltiu      $v0, $s0, 2
/* B9ACC 800B8ECC E6200008 */  swc1       $f0, 8($s1)
/* B9AD0 800B8ED0 10400002 */  beqz       $v0, .L800B8EDC
/* B9AD4 800B8ED4 E620000C */   swc1      $f0, 0xc($s1)
/* B9AD8 800B8ED8 24100002 */  addiu      $s0, $zero, 2
.L800B8EDC:
/* B9ADC 800B8EDC 02002021 */  addu       $a0, $s0, $zero
/* B9AE0 800B8EE0 3C05800E */  lui        $a1, %hi(D_800E4310)
/* B9AE4 800B8EE4 24A54310 */  addiu      $a1, $a1, %lo(D_800E4310)
/* B9AE8 800B8EE8 0C025F9C */  jal        Malloc
/* B9AEC 800B8EEC 24060024 */   addiu     $a2, $zero, 0x24
/* B9AF0 800B8EF0 12600006 */  beqz       $s3, .L800B8F0C
/* B9AF4 800B8EF4 AE220000 */   sw        $v0, ($s1)
/* B9AF8 800B8EF8 00402021 */  addu       $a0, $v0, $zero
/* B9AFC 800B8EFC 0C0333AC */  jal        sprintf
/* B9B00 800B8F00 02602821 */   addu      $a1, $s3, $zero
/* B9B04 800B8F04 0802E3C8 */  j          .L800B8F20
/* B9B08 800B8F08 02402021 */   addu      $a0, $s2, $zero
.L800B8F0C:
/* B9B0C 800B8F0C 00402021 */  addu       $a0, $v0, $zero
/* B9B10 800B8F10 3C05800E */  lui        $a1, %hi(D_800E4328)
/* B9B14 800B8F14 0C0333AC */  jal        sprintf
/* B9B18 800B8F18 24A54328 */   addiu     $a1, $a1, %lo(D_800E4328)
/* B9B1C 800B8F1C 02402021 */  addu       $a0, $s2, $zero
.L800B8F20:
/* B9B20 800B8F20 24050001 */  addiu      $a1, $zero, 1
/* B9B24 800B8F24 0C02DEC8 */  jal        set_widgets_byte0x70
/* B9B28 800B8F28 AE510040 */   sw        $s1, 0x40($s2)
/* B9B2C 800B8F2C 02402021 */  addu       $a0, $s2, $zero
/* B9B30 800B8F30 24050050 */  addiu      $a1, $zero, 0x50
/* B9B34 800B8F34 2406001E */  addiu      $a2, $zero, 0x1e
/* B9B38 800B8F38 A6400074 */  sh         $zero, 0x74($s2)
/* B9B3C 800B8F3C 0C02DD3F */  jal        set_widget_coords
/* B9B40 800B8F40 A6400072 */   sh        $zero, 0x72($s2)
/* B9B44 800B8F44 02402021 */  addu       $a0, $s2, $zero
/* B9B48 800B8F48 240500E1 */  addiu      $a1, $zero, 0xe1
/* B9B4C 800B8F4C 240600E1 */  addiu      $a2, $zero, 0xe1
/* B9B50 800B8F50 240200FF */  addiu      $v0, $zero, 0xff
/* B9B54 800B8F54 240700E1 */  addiu      $a3, $zero, 0xe1
/* B9B58 800B8F58 0C02DD4A */  jal        set_widget_color
/* B9B5C 800B8F5C AFA20010 */   sw        $v0, 0x10($sp)
/* B9B60 800B8F60 02401021 */  addu       $v0, $s2, $zero
/* B9B64 800B8F64 8FBF0028 */  lw         $ra, 0x28($sp)
/* B9B68 800B8F68 8FB30024 */  lw         $s3, 0x24($sp)
/* B9B6C 800B8F6C 8FB20020 */  lw         $s2, 0x20($sp)
/* B9B70 800B8F70 8FB1001C */  lw         $s1, 0x1c($sp)
/* B9B74 800B8F74 8FB00018 */  lw         $s0, 0x18($sp)
/* B9B78 800B8F78 03E00008 */  jr         $ra
/* B9B7C 800B8F7C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel widgettext_free
/* B9B80 800B8F80 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B9B84 800B8F84 AFB10014 */  sw         $s1, 0x14($sp)
/* B9B88 800B8F88 00808821 */  addu       $s1, $a0, $zero
/* B9B8C 800B8F8C 3C02800E */  lui        $v0, %hi(widgettext_methods)
/* B9B90 800B8F90 24424340 */  addiu      $v0, $v0, %lo(widgettext_methods)
/* B9B94 800B8F94 AFBF001C */  sw         $ra, 0x1c($sp)
/* B9B98 800B8F98 AFB20018 */  sw         $s2, 0x18($sp)
/* B9B9C 800B8F9C AFB00010 */  sw         $s0, 0x10($sp)
/* B9BA0 800B8FA0 8E300040 */  lw         $s0, 0x40($s1)
/* B9BA4 800B8FA4 00A09021 */  addu       $s2, $a1, $zero
/* B9BA8 800B8FA8 1200000A */  beqz       $s0, .L800B8FD4
/* B9BAC 800B8FAC AE220078 */   sw        $v0, 0x78($s1)
/* B9BB0 800B8FB0 8E040000 */  lw         $a0, ($s0)
/* B9BB4 800B8FB4 10800004 */  beqz       $a0, .L800B8FC8
/* B9BB8 800B8FB8 3C05800E */   lui       $a1, %hi(D_800E4310)
/* B9BBC 800B8FBC 24A54310 */  addiu      $a1, $a1, %lo(D_800E4310)
/* B9BC0 800B8FC0 0C02600C */  jal        Free
/* B9BC4 800B8FC4 24060041 */   addiu     $a2, $zero, 0x41
.L800B8FC8:
/* B9BC8 800B8FC8 0C026262 */  jal        passToFree
/* B9BCC 800B8FCC 02002021 */   addu      $a0, $s0, $zero
/* B9BD0 800B8FD0 AE200040 */  sw         $zero, 0x40($s1)
.L800B8FD4:
/* B9BD4 800B8FD4 02202021 */  addu       $a0, $s1, $zero
/* B9BD8 800B8FD8 0C02DD2B */  jal        free_widget
/* B9BDC 800B8FDC 02402821 */   addu      $a1, $s2, $zero
/* B9BE0 800B8FE0 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9BE4 800B8FE4 8FB20018 */  lw         $s2, 0x18($sp)
/* B9BE8 800B8FE8 8FB10014 */  lw         $s1, 0x14($sp)
/* B9BEC 800B8FEC 8FB00010 */  lw         $s0, 0x10($sp)
/* B9BF0 800B8FF0 03E00008 */  jr         $ra
/* B9BF4 800B8FF4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B8FF8
/* B9BF8 800B8FF8 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* B9BFC 800B8FFC AFB00030 */  sw         $s0, 0x30($sp)
/* B9C00 800B9000 00808021 */  addu       $s0, $a0, $zero
/* B9C04 800B9004 00063400 */  sll        $a2, $a2, 0x10
/* B9C08 800B9008 AFB10034 */  sw         $s1, 0x34($sp)
/* B9C0C 800B900C 00068C03 */  sra        $s1, $a2, 0x10
/* B9C10 800B9010 3C02800F */  lui        $v0, %hi(font_pointer)
/* B9C14 800B9014 AFB20038 */  sw         $s2, 0x38($sp)
/* B9C18 800B9018 87B2005A */  lh         $s2, 0x5a($sp)
/* B9C1C 800B901C 8C4336F0 */  lw         $v1, %lo(font_pointer)($v0)
/* B9C20 800B9020 00073C00 */  sll        $a3, $a3, 0x10
/* B9C24 800B9024 AFB40040 */  sw         $s4, 0x40($sp)
/* B9C28 800B9028 0007A403 */  sra        $s4, $a3, 0x10
/* B9C2C 800B902C AFB3003C */  sw         $s3, 0x3c($sp)
/* B9C30 800B9030 87B3005E */  lh         $s3, 0x5e($sp)
/* B9C34 800B9034 00407021 */  addu       $t6, $v0, $zero
/* B9C38 800B9038 AFBF0044 */  sw         $ra, 0x44($sp)
/* B9C3C 800B903C 14600008 */  bnez       $v1, .L800B9060
/* B9C40 800B9040 AFA5004C */   sw        $a1, 0x4c($sp)
/* B9C44 800B9044 02203021 */  addu       $a2, $s1, $zero
/* B9C48 800B9048 02803821 */  addu       $a3, $s4, $zero
/* B9C4C 800B904C AFB20010 */  sw         $s2, 0x10($sp)
/* B9C50 800B9050 0C02DE14 */  jal        widget_func_8
/* B9C54 800B9054 AFB30014 */   sw        $s3, 0x14($sp)
/* B9C58 800B9058 0802E4A6 */  j          .L800B9298
/* B9C5C 800B905C 8FBF0044 */   lw        $ra, 0x44($sp)
.L800B9060:
/* B9C60 800B9060 86080064 */  lh         $t0, 0x64($s0)
/* B9C64 800B9064 860A0066 */  lh         $t2, 0x66($s0)
/* B9C68 800B9068 86070068 */  lh         $a3, 0x68($s0)
/* B9C6C 800B906C 0111102A */  slt        $v0, $t0, $s1
/* B9C70 800B9070 10400002 */  beqz       $v0, .L800B907C
/* B9C74 800B9074 8609006A */   lh        $t1, 0x6a($s0)
/* B9C78 800B9078 02204021 */  addu       $t0, $s1, $zero
.L800B907C:
/* B9C7C 800B907C 024A102A */  slt        $v0, $s2, $t2
/* B9C80 800B9080 54400001 */  bnel       $v0, $zero, .L800B9088
/* B9C84 800B9084 02405021 */   addu      $t2, $s2, $zero
.L800B9088:
/* B9C88 800B9088 00F4102A */  slt        $v0, $a3, $s4
/* B9C8C 800B908C 54400001 */  bnel       $v0, $zero, .L800B9094
/* B9C90 800B9090 02803821 */   addu      $a3, $s4, $zero
.L800B9094:
/* B9C94 800B9094 0269102A */  slt        $v0, $s3, $t1
/* B9C98 800B9098 54400001 */  bnel       $v0, $zero, .L800B90A0
/* B9C9C 800B909C 02604821 */   addu      $t1, $s3, $zero
.L800B90A0:
/* B9CA0 800B90A0 3C03800F */  lui        $v1, %hi(D_800F36F8)
/* B9CA4 800B90A4 92020058 */  lbu        $v0, 0x58($s0)
/* B9CA8 800B90A8 C46236F8 */  lwc1       $f2, %lo(D_800F36F8)($v1)
/* B9CAC 800B90AC 44820000 */  mtc1       $v0, $f0
/* B9CB0 800B90B0 46800020 */  cvt.s.w    $f0, $f0
/* B9CB4 800B90B4 46020002 */  mul.s      $f0, $f0, $f2
/* B9CB8 800B90B8 00002821 */  addu       $a1, $zero, $zero
/* B9CBC 800B90BC 00605821 */  addu       $t3, $v1, $zero
/* B9CC0 800B90C0 3C01800E */  lui        $at, %hi(D_800E4330)
/* B9CC4 800B90C4 C4224330 */  lwc1       $f2, %lo(D_800E4330)($at)
/* B9CC8 800B90C8 4600103E */  c.le.s     $f2, $f0
/* B9CCC 800B90CC 00000000 */  nop
/* B9CD0 800B90D0 45010005 */  bc1t       .L800B90E8
/* B9CD4 800B90D4 8E060040 */   lw        $a2, 0x40($s0)
/* B9CD8 800B90D8 4600008D */  trunc.w.s  $f2, $f0
/* B9CDC 800B90DC 44031000 */  mfc1       $v1, $f2
/* B9CE0 800B90E0 0802E440 */  j          .L800B9100
/* B9CE4 800B90E4 92020059 */   lbu       $v0, 0x59($s0)
.L800B90E8:
/* B9CE8 800B90E8 46020001 */  sub.s      $f0, $f0, $f2
/* B9CEC 800B90EC 4600008D */  trunc.w.s  $f2, $f0
/* B9CF0 800B90F0 44031000 */  mfc1       $v1, $f2
/* B9CF4 800B90F4 3C028000 */  lui        $v0, 0x8000
/* B9CF8 800B90F8 00621825 */  or         $v1, $v1, $v0
/* B9CFC 800B90FC 92020059 */  lbu        $v0, 0x59($s0)
.L800B9100:
/* B9D00 800B9100 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B9D04 800B9104 44820000 */  mtc1       $v0, $f0
/* B9D08 800B9108 46800020 */  cvt.s.w    $f0, $f0
/* B9D0C 800B910C 46020002 */  mul.s      $f0, $f0, $f2
/* B9D10 800B9110 3C01800E */  lui        $at, %hi(D_800E4334)
/* B9D14 800B9114 C4224334 */  lwc1       $f2, %lo(D_800E4334)($at)
/* B9D18 800B9118 4600103E */  c.le.s     $f2, $f0
/* B9D1C 800B911C 00000000 */  nop
/* B9D20 800B9120 45010005 */  bc1t       .L800B9138
/* B9D24 800B9124 306D00FF */   andi      $t5, $v1, 0xff
/* B9D28 800B9128 4600008D */  trunc.w.s  $f2, $f0
/* B9D2C 800B912C 44031000 */  mfc1       $v1, $f2
/* B9D30 800B9130 0802E454 */  j          .L800B9150
/* B9D34 800B9134 9202005A */   lbu       $v0, 0x5a($s0)
.L800B9138:
/* B9D38 800B9138 46020001 */  sub.s      $f0, $f0, $f2
/* B9D3C 800B913C 4600008D */  trunc.w.s  $f2, $f0
/* B9D40 800B9140 44031000 */  mfc1       $v1, $f2
/* B9D44 800B9144 3C028000 */  lui        $v0, 0x8000
/* B9D48 800B9148 00621825 */  or         $v1, $v1, $v0
/* B9D4C 800B914C 9202005A */  lbu        $v0, 0x5a($s0)
.L800B9150:
/* B9D50 800B9150 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B9D54 800B9154 44820000 */  mtc1       $v0, $f0
/* B9D58 800B9158 46800020 */  cvt.s.w    $f0, $f0
/* B9D5C 800B915C 46020002 */  mul.s      $f0, $f0, $f2
/* B9D60 800B9160 3C01800E */  lui        $at, %hi(D_800E4338)
/* B9D64 800B9164 C4224338 */  lwc1       $f2, %lo(D_800E4338)($at)
/* B9D68 800B9168 4600103E */  c.le.s     $f2, $f0
/* B9D6C 800B916C 00000000 */  nop
/* B9D70 800B9170 45010005 */  bc1t       .L800B9188
/* B9D74 800B9174 306C00FF */   andi      $t4, $v1, 0xff
/* B9D78 800B9178 4600008D */  trunc.w.s  $f2, $f0
/* B9D7C 800B917C 44031000 */  mfc1       $v1, $f2
/* B9D80 800B9180 0802E468 */  j          .L800B91A0
/* B9D84 800B9184 9202005B */   lbu       $v0, 0x5b($s0)
.L800B9188:
/* B9D88 800B9188 46020001 */  sub.s      $f0, $f0, $f2
/* B9D8C 800B918C 4600008D */  trunc.w.s  $f2, $f0
/* B9D90 800B9190 44031000 */  mfc1       $v1, $f2
/* B9D94 800B9194 3C028000 */  lui        $v0, 0x8000
/* B9D98 800B9198 00621825 */  or         $v1, $v1, $v0
/* B9D9C 800B919C 9202005B */  lbu        $v0, 0x5b($s0)
.L800B91A0:
/* B9DA0 800B91A0 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B9DA4 800B91A4 44820000 */  mtc1       $v0, $f0
/* B9DA8 800B91A8 46800020 */  cvt.s.w    $f0, $f0
/* B9DAC 800B91AC 46020002 */  mul.s      $f0, $f0, $f2
/* B9DB0 800B91B0 3C01800E */  lui        $at, %hi(D_800E433C)
/* B9DB4 800B91B4 C422433C */  lwc1       $f2, %lo(D_800E433C)($at)
/* B9DB8 800B91B8 4600103E */  c.le.s     $f2, $f0
/* B9DBC 800B91BC 00000000 */  nop
/* B9DC0 800B91C0 45010005 */  bc1t       .L800B91D8
/* B9DC4 800B91C4 306400FF */   andi      $a0, $v1, 0xff
/* B9DC8 800B91C8 4600008D */  trunc.w.s  $f2, $f0
/* B9DCC 800B91CC 44031000 */  mfc1       $v1, $f2
/* B9DD0 800B91D0 0802E47C */  j          .L800B91F0
/* B9DD4 800B91D4 8DC236F0 */   lw        $v0, 0x36f0($t6)
.L800B91D8:
/* B9DD8 800B91D8 46020001 */  sub.s      $f0, $f0, $f2
/* B9DDC 800B91DC 4600008D */  trunc.w.s  $f2, $f0
/* B9DE0 800B91E0 44031000 */  mfc1       $v1, $f2
/* B9DE4 800B91E4 3C028000 */  lui        $v0, %hi(D_8000001C)
/* B9DE8 800B91E8 00621825 */  or         $v1, $v1, $v0
/* B9DEC 800B91EC 8DC236F0 */  lw         $v0, 0x36f0($t6)
.L800B91F0:
/* B9DF0 800B91F0 A04D001C */  sb         $t5, %lo(D_8000001C)($v0)
/* B9DF4 800B91F4 A04C001D */  sb         $t4, 0x1d($v0)
/* B9DF8 800B91F8 A044001E */  sb         $a0, 0x1e($v0)
/* B9DFC 800B91FC A043001F */  sb         $v1, 0x1f($v0)
/* B9E00 800B9200 9203005B */  lbu        $v1, 0x5b($s0)
/* B9E04 800B9204 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B9E08 800B9208 44830000 */  mtc1       $v1, $f0
/* B9E0C 800B920C 46800020 */  cvt.s.w    $f0, $f0
/* B9E10 800B9210 46020002 */  mul.s      $f0, $f0, $f2
/* B9E14 800B9214 44802000 */  mtc1       $zero, $f4
/* B9E18 800B9218 4600203C */  c.lt.s     $f4, $f0
/* B9E1C 800B921C 00000000 */  nop
/* B9E20 800B9220 45000010 */  bc1f       .L800B9264
/* B9E24 800B9224 8DC436F0 */   lw        $a0, 0x36f0($t6)
/* B9E28 800B9228 86020062 */  lh         $v0, 0x62($s0)
/* B9E2C 800B922C AFA80014 */  sw         $t0, 0x14($sp)
/* B9E30 800B9230 AFA70018 */  sw         $a3, 0x18($sp)
/* B9E34 800B9234 AFAA001C */  sw         $t2, 0x1c($sp)
/* B9E38 800B9238 AFA90020 */  sw         $t1, 0x20($sp)
/* B9E3C 800B923C AFA20010 */  sw         $v0, 0x10($sp)
/* B9E40 800B9240 C4C00008 */  lwc1       $f0, 8($a2)
/* B9E44 800B9244 E7A00024 */  swc1       $f0, 0x24($sp)
/* B9E48 800B9248 C4C2000C */  lwc1       $f2, 0xc($a2)
/* B9E4C 800B924C E7A20028 */  swc1       $f2, 0x28($sp)
/* B9E50 800B9250 86070060 */  lh         $a3, 0x60($s0)
/* B9E54 800B9254 8CC60000 */  lw         $a2, ($a2)
/* B9E58 800B9258 0C02D1E3 */  jal        passto_display_text_func_A
/* B9E5C 800B925C 27A5004C */   addiu     $a1, $sp, 0x4c
/* B9E60 800B9260 00402821 */  addu       $a1, $v0, $zero
.L800B9264:
/* B9E64 800B9264 02002021 */  addu       $a0, $s0, $zero
/* B9E68 800B9268 0C02DD46 */  jal        set_widgetWidth
/* B9E6C 800B926C 30A5FFFF */   andi      $a1, $a1, 0xffff
/* B9E70 800B9270 02002021 */  addu       $a0, $s0, $zero
/* B9E74 800B9274 02203021 */  addu       $a2, $s1, $zero
/* B9E78 800B9278 8FA5004C */  lw         $a1, 0x4c($sp)
/* B9E7C 800B927C 02803821 */  addu       $a3, $s4, $zero
/* B9E80 800B9280 AFB20010 */  sw         $s2, 0x10($sp)
/* B9E84 800B9284 0C02DE14 */  jal        widget_func_8
/* B9E88 800B9288 AFB30014 */   sw        $s3, 0x14($sp)
/* B9E8C 800B928C 00401821 */  addu       $v1, $v0, $zero
/* B9E90 800B9290 AFA3004C */  sw         $v1, 0x4c($sp)
/* B9E94 800B9294 8FBF0044 */  lw         $ra, 0x44($sp)
.L800B9298:
/* B9E98 800B9298 8FB40040 */  lw         $s4, 0x40($sp)
/* B9E9C 800B929C 8FB3003C */  lw         $s3, 0x3c($sp)
/* B9EA0 800B92A0 8FB20038 */  lw         $s2, 0x38($sp)
/* B9EA4 800B92A4 8FB10034 */  lw         $s1, 0x34($sp)
/* B9EA8 800B92A8 8FB00030 */  lw         $s0, 0x30($sp)
/* B9EAC 800B92AC 03E00008 */  jr         $ra
/* B9EB0 800B92B0 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800B92B4
/* B9EB4 800B92B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B9EB8 800B92B8 AFB00010 */  sw         $s0, 0x10($sp)
/* B9EBC 800B92BC 00808021 */  addu       $s0, $a0, $zero
/* B9EC0 800B92C0 3C02800F */  lui        $v0, %hi(font_pointer)
/* B9EC4 800B92C4 AFBF0014 */  sw         $ra, 0x14($sp)
/* B9EC8 800B92C8 8E030040 */  lw         $v1, 0x40($s0)
/* B9ECC 800B92CC 8C4436F0 */  lw         $a0, %lo(font_pointer)($v0)
/* B9ED0 800B92D0 8C650000 */  lw         $a1, ($v1)
/* B9ED4 800B92D4 0C02D44A */  jal        func_800B5128
/* B9ED8 800B92D8 8C660008 */   lw        $a2, 8($v1)
/* B9EDC 800B92DC 86050066 */  lh         $a1, 0x66($s0)
/* B9EE0 800B92E0 86040064 */  lh         $a0, 0x64($s0)
/* B9EE4 800B92E4 00401821 */  addu       $v1, $v0, $zero
/* B9EE8 800B92E8 00A4102A */  slt        $v0, $a1, $a0
/* B9EEC 800B92EC 10400003 */  beqz       $v0, .L800B92FC
/* B9EF0 800B92F0 00001021 */   addu      $v0, $zero, $zero
/* B9EF4 800B92F4 0802E4C5 */  j          .L800B9314
/* B9EF8 800B92F8 A6000074 */   sh        $zero, 0x74($s0)
.L800B92FC:
/* B9EFC 800B92FC 00A42023 */  subu       $a0, $a1, $a0
/* B9F00 800B9300 0083102B */  sltu       $v0, $a0, $v1
/* B9F04 800B9304 54400001 */  bnel       $v0, $zero, .L800B930C
/* B9F08 800B9308 00801821 */   addu      $v1, $a0, $zero
.L800B930C:
/* B9F0C 800B930C A6030074 */  sh         $v1, 0x74($s0)
/* B9F10 800B9310 3062FFFF */  andi       $v0, $v1, 0xffff
.L800B9314:
/* B9F14 800B9314 8FBF0014 */  lw         $ra, 0x14($sp)
/* B9F18 800B9318 8FB00010 */  lw         $s0, 0x10($sp)
/* B9F1C 800B931C 03E00008 */  jr         $ra
/* B9F20 800B9320 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B9324
/* B9F24 800B9324 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B9F28 800B9328 AFB00018 */  sw         $s0, 0x18($sp)
/* B9F2C 800B932C 00808021 */  addu       $s0, $a0, $zero
/* B9F30 800B9330 3C03800F */  lui        $v1, %hi(font_pointer)
/* B9F34 800B9334 AFBF001C */  sw         $ra, 0x1c($sp)
/* B9F38 800B9338 8E020040 */  lw         $v0, 0x40($s0)
/* B9F3C 800B933C 8C6436F0 */  lw         $a0, %lo(font_pointer)($v1)
/* B9F40 800B9340 C4400008 */  lwc1       $f0, 8($v0)
/* B9F44 800B9344 E7A00010 */  swc1       $f0, 0x10($sp)
/* B9F48 800B9348 C442000C */  lwc1       $f2, 0xc($v0)
/* B9F4C 800B934C E7A20014 */  swc1       $f2, 0x14($sp)
/* B9F50 800B9350 86060060 */  lh         $a2, 0x60($s0)
/* B9F54 800B9354 86070066 */  lh         $a3, 0x66($s0)
/* B9F58 800B9358 0C02D4AD */  jal        func_800B52B4
/* B9F5C 800B935C 8C450000 */   lw        $a1, ($v0)
/* B9F60 800B9360 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9F64 800B9364 A6020072 */  sh         $v0, 0x72($s0)
/* B9F68 800B9368 8FB00018 */  lw         $s0, 0x18($sp)
/* B9F6C 800B936C 3042FFFF */  andi       $v0, $v0, 0xffff
/* B9F70 800B9370 03E00008 */  jr         $ra
/* B9F74 800B9374 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B9378
/* B9F78 800B9378 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B9F7C 800B937C AFBF0010 */  sw         $ra, 0x10($sp)
/* B9F80 800B9380 0C02DE51 */  jal        func_800B7944
/* B9F84 800B9384 00000000 */   nop
/* B9F88 800B9388 8FBF0010 */  lw         $ra, 0x10($sp)
/* B9F8C 800B938C 03E00008 */  jr         $ra
/* B9F90 800B9390 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widgettext_func
/* B9F94 800B9394 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B9F98 800B9398 AFB20018 */  sw         $s2, 0x18($sp)
/* B9F9C 800B939C 00A09021 */  addu       $s2, $a1, $zero
/* B9FA0 800B93A0 AFBF001C */  sw         $ra, 0x1c($sp)
/* B9FA4 800B93A4 AFB10014 */  sw         $s1, 0x14($sp)
/* B9FA8 800B93A8 AFB00010 */  sw         $s0, 0x10($sp)
/* B9FAC 800B93AC 8C910040 */  lw         $s1, 0x40($a0)
/* B9FB0 800B93B0 02402021 */  addu       $a0, $s2, $zero
/* B9FB4 800B93B4 0C03353E */  jal        strlen
/* B9FB8 800B93B8 00C08021 */   addu      $s0, $a2, $zero
/* B9FBC 800B93BC 96230004 */  lhu        $v1, 4($s1)
/* B9FC0 800B93C0 24420001 */  addiu      $v0, $v0, 1
/* B9FC4 800B93C4 0062182A */  slt        $v1, $v1, $v0
/* B9FC8 800B93C8 14600006 */  bnez       $v1, .L800B93E4
/* B9FCC 800B93CC 00000000 */   nop
/* B9FD0 800B93D0 8E240000 */  lw         $a0, ($s1)
/* B9FD4 800B93D4 0C0333AC */  jal        sprintf
/* B9FD8 800B93D8 02402821 */   addu      $a1, $s2, $zero
/* B9FDC 800B93DC 0802E50F */  j          .L800B943C
/* B9FE0 800B93E0 24020001 */   addiu     $v0, $zero, 1
.L800B93E4:
/* B9FE4 800B93E4 16000003 */  bnez       $s0, .L800B93F4
/* B9FE8 800B93E8 3C10800E */   lui       $s0, %hi(D_800E4310)
/* B9FEC 800B93EC 0802E50F */  j          .L800B943C
/* B9FF0 800B93F0 00001021 */   addu      $v0, $zero, $zero
.L800B93F4:
/* B9FF4 800B93F4 26104310 */  addiu      $s0, $s0, %lo(D_800E4310)
/* B9FF8 800B93F8 02002821 */  addu       $a1, $s0, $zero
/* B9FFC 800B93FC 8E240000 */  lw         $a0, ($s1)
/* BA000 800B9400 0C02600C */  jal        Free
/* BA004 800B9404 240600AD */   addiu     $a2, $zero, 0xad
/* BA008 800B9408 0C03353E */  jal        strlen
/* BA00C 800B940C 02402021 */   addu      $a0, $s2, $zero
/* BA010 800B9410 02002821 */  addu       $a1, $s0, $zero
/* BA014 800B9414 24420001 */  addiu      $v0, $v0, 1
/* BA018 800B9418 A6220004 */  sh         $v0, 4($s1)
/* BA01C 800B941C 3044FFFF */  andi       $a0, $v0, 0xffff
/* BA020 800B9420 0C025F9C */  jal        Malloc
/* BA024 800B9424 240600B0 */   addiu     $a2, $zero, 0xb0
/* BA028 800B9428 00402021 */  addu       $a0, $v0, $zero
/* BA02C 800B942C 02402821 */  addu       $a1, $s2, $zero
/* BA030 800B9430 0C02626C */  jal        copy_string
/* BA034 800B9434 AE220000 */   sw        $v0, ($s1)
/* BA038 800B9438 24020001 */  addiu      $v0, $zero, 1
.L800B943C:
/* BA03C 800B943C 8FBF001C */  lw         $ra, 0x1c($sp)
/* BA040 800B9440 8FB20018 */  lw         $s2, 0x18($sp)
/* BA044 800B9444 8FB10014 */  lw         $s1, 0x14($sp)
/* BA048 800B9448 8FB00010 */  lw         $s0, 0x10($sp)
/* BA04C 800B944C 03E00008 */  jr         $ra
/* BA050 800B9450 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret0_800b9454
/* BA054 800B9454 03E00008 */  jr         $ra
/* BA058 800B9458 00001021 */   addu      $v0, $zero, $zero
/* BA05C 800B945C 00000000 */  nop
