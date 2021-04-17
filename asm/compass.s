.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel make_compass
/* 2B400 8002A800 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2B404 8002A804 24040018 */  addiu      $a0, $zero, 0x18
/* 2B408 8002A808 3C05800E */  lui        $a1, %hi(D_800DA3D0)
/* 2B40C 8002A80C 24A5A3D0 */  addiu      $a1, $a1, %lo(D_800DA3D0)
/* 2B410 8002A810 24060065 */  addiu      $a2, $zero, 0x65
/* 2B414 8002A814 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2B418 8002A818 0C025F9C */  jal        Malloc
/* 2B41C 8002A81C AFB00010 */   sw        $s0, 0x10($sp)
/* 2B420 8002A820 2404001B */  addiu      $a0, $zero, 0x1b
/* 2B424 8002A824 3C10800F */  lui        $s0, %hi(compass_pointer)
/* 2B428 8002A828 0C0290E2 */  jal        get_borg_8
/* 2B42C 8002A82C AE029C20 */   sw        $v0, %lo(compass_pointer)($s0)
/* 2B430 8002A830 8E039C20 */  lw         $v1, -0x63e0($s0)
/* 2B434 8002A834 24040018 */  addiu      $a0, $zero, 0x18
/* 2B438 8002A838 0C0290E2 */  jal        get_borg_8
/* 2B43C 8002A83C AC620000 */   sw        $v0, ($v1)
/* 2B440 8002A840 8E039C20 */  lw         $v1, -0x63e0($s0)
/* 2B444 8002A844 24040019 */  addiu      $a0, $zero, 0x19
/* 2B448 8002A848 0C0290E2 */  jal        get_borg_8
/* 2B44C 8002A84C AC620008 */   sw        $v0, 8($v1)
/* 2B450 8002A850 8E039C20 */  lw         $v1, -0x63e0($s0)
/* 2B454 8002A854 2404001A */  addiu      $a0, $zero, 0x1a
/* 2B458 8002A858 0C0290E2 */  jal        get_borg_8
/* 2B45C 8002A85C AC62000C */   sw        $v0, 0xc($v1)
/* 2B460 8002A860 8E039C20 */  lw         $v1, -0x63e0($s0)
/* 2B464 8002A864 24040017 */  addiu      $a0, $zero, 0x17
/* 2B468 8002A868 0C0290E2 */  jal        get_borg_8
/* 2B46C 8002A86C AC620010 */   sw        $v0, 0x10($v1)
/* 2B470 8002A870 8E039C20 */  lw         $v1, -0x63e0($s0)
/* 2B474 8002A874 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2B478 8002A878 8FB00010 */  lw         $s0, 0x10($sp)
/* 2B47C 8002A87C AC620014 */  sw         $v0, 0x14($v1)
/* 2B480 8002A880 03E00008 */  jr         $ra
/* 2B484 8002A884 27BD0018 */   addiu     $sp, $sp, 0x18

glabel draw_compass
/* 2B488 8002A888 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 2B48C 8002A88C AFB1006C */  sw         $s1, 0x6c($sp)
/* 2B490 8002A890 00808821 */  addu       $s1, $a0, $zero
/* 2B494 8002A894 AFB60080 */  sw         $s6, 0x80($sp)
/* 2B498 8002A898 AFBF0084 */  sw         $ra, 0x84($sp)
/* 2B49C 8002A89C AFB5007C */  sw         $s5, 0x7c($sp)
/* 2B4A0 8002A8A0 AFB40078 */  sw         $s4, 0x78($sp)
/* 2B4A4 8002A8A4 AFB30074 */  sw         $s3, 0x74($sp)
/* 2B4A8 8002A8A8 AFB20070 */  sw         $s2, 0x70($sp)
/* 2B4AC 8002A8AC AFB00068 */  sw         $s0, 0x68($sp)
/* 2B4B0 8002A8B0 F7BA00A0 */  sdc1       $f26, 0xa0($sp)
/* 2B4B4 8002A8B4 F7B80098 */  sdc1       $f24, 0x98($sp)
/* 2B4B8 8002A8B8 F7B60090 */  sdc1       $f22, 0x90($sp)
/* 2B4BC 8002A8BC F7B40088 */  sdc1       $f20, 0x88($sp)
/* 2B4C0 8002A8C0 0C0025B4 */  jal        get_hres
/* 2B4C4 8002A8C4 00A0B021 */   addu      $s6, $a1, $zero
/* 2B4C8 8002A8C8 0C0025B7 */  jal        get_vres
/* 2B4CC 8002A8CC 00408021 */   addu      $s0, $v0, $zero
/* 2B4D0 8002A8D0 02202021 */  addu       $a0, $s1, $zero
/* 2B4D4 8002A8D4 24050006 */  addiu      $a1, $zero, 6
/* 2B4D8 8002A8D8 02003021 */  addu       $a2, $s0, $zero
/* 2B4DC 8002A8DC 0C0290ED */  jal        rsp_func
/* 2B4E0 8002A8E0 00403821 */   addu      $a3, $v0, $zero
/* 2B4E4 8002A8E4 3C04800E */  lui        $a0, %hi(gGlobals)
/* 2B4E8 8002A8E8 248368A8 */  addiu      $v1, $a0, %lo(gGlobals)
/* 2B4EC 8002A8EC C462203C */  lwc1       $f2, 0x203c($v1)
/* 2B4F0 8002A8F0 3C01800E */  lui        $at, %hi(D_800DA3E4)
/* 2B4F4 8002A8F4 C420A3E4 */  lwc1       $f0, %lo(D_800DA3E4)($at)
/* 2B4F8 8002A8F8 46001002 */  mul.s      $f0, $f2, $f0
/* 2B4FC 8002A8FC 00408821 */  addu       $s1, $v0, $zero
/* 2B500 8002A900 3C01800E */  lui        $at, %hi(D_800DA3E8)
/* 2B504 8002A904 C422A3E8 */  lwc1       $f2, %lo(D_800DA3E8)($at)
/* 2B508 8002A908 4600103E */  c.le.s     $f2, $f0
/* 2B50C 8002A90C 00000000 */  nop
/* 2B510 8002A910 45010005 */  bc1t       .L8002A928
/* 2B514 8002A914 0080A021 */   addu      $s4, $a0, $zero
/* 2B518 8002A918 4600008D */  trunc.w.s  $f2, $f0
/* 2B51C 8002A91C 44031000 */  mfc1       $v1, $f2
/* 2B520 8002A920 0800AA50 */  j          .L8002A940
/* 2B524 8002A924 268268A8 */   addiu     $v0, $s4, 0x68a8
.L8002A928:
/* 2B528 8002A928 46020001 */  sub.s      $f0, $f0, $f2
/* 2B52C 8002A92C 4600008D */  trunc.w.s  $f2, $f0
/* 2B530 8002A930 44031000 */  mfc1       $v1, $f2
/* 2B534 8002A934 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2B538 8002A938 00621825 */  or         $v1, $v1, $v0
/* 2B53C 8002A93C 268268A8 */  addiu      $v0, $s4, 0x68a8
.L8002A940:
/* 2B540 8002A940 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2B544 8002A944 3C01800E */  lui        $at, %hi(D_800DA3EC)
/* 2B548 8002A948 C420A3EC */  lwc1       $f0, %lo(D_800DA3EC)($at)
/* 2B54C 8002A94C 46001002 */  mul.s      $f0, $f2, $f0
/* 2B550 8002A950 3C01800E */  lui        $at, %hi(D_800DA3F0)
/* 2B554 8002A954 C422A3F0 */  lwc1       $f2, %lo(D_800DA3F0)($at)
/* 2B558 8002A958 4600103E */  c.le.s     $f2, $f0
/* 2B55C 8002A95C 00000000 */  nop
/* 2B560 8002A960 45010005 */  bc1t       .L8002A978
/* 2B564 8002A964 307500FF */   andi      $s5, $v1, 0xff
/* 2B568 8002A968 4600008D */  trunc.w.s  $f2, $f0
/* 2B56C 8002A96C 44031000 */  mfc1       $v1, $f2
/* 2B570 8002A970 0800AA64 */  j          .L8002A990
/* 2B574 8002A974 268268A8 */   addiu     $v0, $s4, 0x68a8
.L8002A978:
/* 2B578 8002A978 46020001 */  sub.s      $f0, $f0, $f2
/* 2B57C 8002A97C 4600008D */  trunc.w.s  $f2, $f0
/* 2B580 8002A980 44031000 */  mfc1       $v1, $f2
/* 2B584 8002A984 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2B588 8002A988 00621825 */  or         $v1, $v1, $v0
/* 2B58C 8002A98C 268268A8 */  addiu      $v0, $s4, 0x68a8
.L8002A990:
/* 2B590 8002A990 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2B594 8002A994 3C01800E */  lui        $at, %hi(D_800DA3F4)
/* 2B598 8002A998 C420A3F4 */  lwc1       $f0, %lo(D_800DA3F4)($at)
/* 2B59C 8002A99C 46001002 */  mul.s      $f0, $f2, $f0
/* 2B5A0 8002A9A0 3C01800E */  lui        $at, %hi(D_800DA3F8)
/* 2B5A4 8002A9A4 C422A3F8 */  lwc1       $f2, %lo(D_800DA3F8)($at)
/* 2B5A8 8002A9A8 4600103E */  c.le.s     $f2, $f0
/* 2B5AC 8002A9AC 00000000 */  nop
/* 2B5B0 8002A9B0 45010005 */  bc1t       .L8002A9C8
/* 2B5B4 8002A9B4 307300FF */   andi      $s3, $v1, 0xff
/* 2B5B8 8002A9B8 4600008D */  trunc.w.s  $f2, $f0
/* 2B5BC 8002A9BC 44031000 */  mfc1       $v1, $f2
/* 2B5C0 8002A9C0 0800AA78 */  j          .L8002A9E0
/* 2B5C4 8002A9C4 268268A8 */   addiu     $v0, $s4, 0x68a8
.L8002A9C8:
/* 2B5C8 8002A9C8 46020001 */  sub.s      $f0, $f0, $f2
/* 2B5CC 8002A9CC 4600008D */  trunc.w.s  $f2, $f0
/* 2B5D0 8002A9D0 44031000 */  mfc1       $v1, $f2
/* 2B5D4 8002A9D4 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2B5D8 8002A9D8 00621825 */  or         $v1, $v1, $v0
/* 2B5DC 8002A9DC 268268A8 */  addiu      $v0, $s4, 0x68a8
.L8002A9E0:
/* 2B5E0 8002A9E0 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2B5E4 8002A9E4 3C01800E */  lui        $at, %hi(D_800DA3FC)
/* 2B5E8 8002A9E8 C420A3FC */  lwc1       $f0, %lo(D_800DA3FC)($at)
/* 2B5EC 8002A9EC 46001002 */  mul.s      $f0, $f2, $f0
/* 2B5F0 8002A9F0 3C01800E */  lui        $at, %hi(D_800DA400)
/* 2B5F4 8002A9F4 C422A400 */  lwc1       $f2, %lo(D_800DA400)($at)
/* 2B5F8 8002A9F8 4600103E */  c.le.s     $f2, $f0
/* 2B5FC 8002A9FC 00000000 */  nop
/* 2B600 8002AA00 45010005 */  bc1t       .L8002AA18
/* 2B604 8002AA04 307200FF */   andi      $s2, $v1, 0xff
/* 2B608 8002AA08 4600008D */  trunc.w.s  $f2, $f0
/* 2B60C 8002AA0C 44031000 */  mfc1       $v1, $f2
/* 2B610 8002AA10 0800AA8C */  j          .L8002AA30
/* 2B614 8002AA14 3C10800F */   lui       $s0, 0x800f
.L8002AA18:
/* 2B618 8002AA18 46020001 */  sub.s      $f0, $f0, $f2
/* 2B61C 8002AA1C 4600008D */  trunc.w.s  $f2, $f0
/* 2B620 8002AA20 44031000 */  mfc1       $v1, $f2
/* 2B624 8002AA24 3C028000 */  lui        $v0, 0x8000
/* 2B628 8002AA28 00621825 */  or         $v1, $v1, $v0
/* 2B62C 8002AA2C 3C10800F */  lui        $s0, %hi(compass_pointer)
.L8002AA30:
/* 2B630 8002AA30 3C064371 */  lui        $a2, 0x4371
/* 2B634 8002AA34 3C074329 */  lui        $a3, 0x4329
/* 2B638 8002AA38 8E029C20 */  lw         $v0, %lo(compass_pointer)($s0)
/* 2B63C 8002AA3C 3C01800E */  lui        $at, %hi(D_800DA404)
/* 2B640 8002AA40 C436A404 */  lwc1       $f22, %lo(D_800DA404)($at)
/* 2B644 8002AA44 306300FF */  andi       $v1, $v1, 0xff
/* 2B648 8002AA48 AFB50018 */  sw         $s5, 0x18($sp)
/* 2B64C 8002AA4C AFB3001C */  sw         $s3, 0x1c($sp)
/* 2B650 8002AA50 AFB20020 */  sw         $s2, 0x20($sp)
/* 2B654 8002AA54 AFA30024 */  sw         $v1, 0x24($sp)
/* 2B658 8002AA58 E7B60010 */  swc1       $f22, 0x10($sp)
/* 2B65C 8002AA5C E7B60014 */  swc1       $f22, 0x14($sp)
/* 2B660 8002AA60 8C450000 */  lw         $a1, ($v0)
/* 2B664 8002AA64 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2B668 8002AA68 02202021 */   addu      $a0, $s1, $zero
/* 2B66C 8002AA6C 00408821 */  addu       $s1, $v0, $zero
/* 2B670 8002AA70 02C02021 */  addu       $a0, $s6, $zero
/* 2B674 8002AA74 27A50028 */  addiu      $a1, $sp, 0x28
/* 2B678 8002AA78 E7B60028 */  swc1       $f22, 0x28($sp)
/* 2B67C 8002AA7C 0C02AB72 */  jal        vec2_scalar_product
/* 2B680 8002AA80 AFA0002C */   sw        $zero, 0x2c($sp)
/* 2B684 8002AA84 02C02021 */  addu       $a0, $s6, $zero
/* 2B688 8002AA88 27A50028 */  addiu      $a1, $sp, 0x28
/* 2B68C 8002AA8C 46000506 */  mov.s      $f20, $f0
/* 2B690 8002AA90 AFA00028 */  sw         $zero, 0x28($sp)
/* 2B694 8002AA94 0C02AB72 */  jal        vec2_scalar_product
/* 2B698 8002AA98 E7B6002C */   swc1      $f22, 0x2c($sp)
/* 2B69C 8002AA9C 3C01800E */  lui        $at, %hi(D_800DA408)
/* 2B6A0 8002AAA0 C422A408 */  lwc1       $f2, %lo(D_800DA408)($at)
/* 2B6A4 8002AAA4 4602A602 */  mul.s      $f24, $f20, $f2
/* 2B6A8 8002AAA8 3C01800E */  lui        $at, %hi(D_800DA40C)
/* 2B6AC 8002AAAC C426A40C */  lwc1       $f6, %lo(D_800DA40C)($at)
/* 2B6B0 8002AAB0 4606A682 */  mul.s      $f26, $f20, $f6
/* 2B6B4 8002AAB4 00000000 */  nop
/* 2B6B8 8002AAB8 46020582 */  mul.s      $f22, $f0, $f2
/* 2B6BC 8002AABC 00000000 */  nop
/* 2B6C0 8002AAC0 46060502 */  mul.s      $f20, $f0, $f6
/* 2B6C4 8002AAC4 268268A8 */  addiu      $v0, $s4, 0x68a8
/* 2B6C8 8002AAC8 C444203C */  lwc1       $f4, 0x203c($v0)
/* 2B6CC 8002AACC 3C01800E */  lui        $at, %hi(D_800DA410)
/* 2B6D0 8002AAD0 C422A410 */  lwc1       $f2, %lo(D_800DA410)($at)
/* 2B6D4 8002AAD4 46022102 */  mul.s      $f4, $f4, $f2
/* 2B6D8 8002AAD8 3C01800E */  lui        $at, %hi(D_800DA414)
/* 2B6DC 8002AADC C422A414 */  lwc1       $f2, %lo(D_800DA414)($at)
/* 2B6E0 8002AAE0 4604103E */  c.le.s     $f2, $f4
/* 2B6E4 8002AAE4 00000000 */  nop
/* 2B6E8 8002AAE8 45030005 */  bc1tl      .L8002AB00
/* 2B6EC 8002AAEC 46022001 */   sub.s     $f0, $f4, $f2
/* 2B6F0 8002AAF0 4600200D */  trunc.w.s  $f0, $f4
/* 2B6F4 8002AAF4 44030000 */  mfc1       $v1, $f0
/* 2B6F8 8002AAF8 0800AAC5 */  j          .L8002AB14
/* 2B6FC 8002AAFC 268268A8 */   addiu     $v0, $s4, 0x68a8
.L8002AB00:
/* 2B700 8002AB00 4600008D */  trunc.w.s  $f2, $f0
/* 2B704 8002AB04 44031000 */  mfc1       $v1, $f2
/* 2B708 8002AB08 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2B70C 8002AB0C 00621825 */  or         $v1, $v1, $v0
/* 2B710 8002AB10 268268A8 */  addiu      $v0, $s4, 0x68a8
.L8002AB14:
/* 2B714 8002AB14 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2B718 8002AB18 3C01800E */  lui        $at, %hi(D_800DA418)
/* 2B71C 8002AB1C C420A418 */  lwc1       $f0, %lo(D_800DA418)($at)
/* 2B720 8002AB20 46001002 */  mul.s      $f0, $f2, $f0
/* 2B724 8002AB24 3C01800E */  lui        $at, %hi(D_800DA41C)
/* 2B728 8002AB28 C422A41C */  lwc1       $f2, %lo(D_800DA41C)($at)
/* 2B72C 8002AB2C 4600103E */  c.le.s     $f2, $f0
/* 2B730 8002AB30 00000000 */  nop
/* 2B734 8002AB34 45010005 */  bc1t       .L8002AB4C
/* 2B738 8002AB38 307500FF */   andi      $s5, $v1, 0xff
/* 2B73C 8002AB3C 4600008D */  trunc.w.s  $f2, $f0
/* 2B740 8002AB40 44031000 */  mfc1       $v1, $f2
/* 2B744 8002AB44 0800AAD9 */  j          .L8002AB64
/* 2B748 8002AB48 268268A8 */   addiu     $v0, $s4, 0x68a8
.L8002AB4C:
/* 2B74C 8002AB4C 46020001 */  sub.s      $f0, $f0, $f2
/* 2B750 8002AB50 4600008D */  trunc.w.s  $f2, $f0
/* 2B754 8002AB54 44031000 */  mfc1       $v1, $f2
/* 2B758 8002AB58 3C028000 */  lui        $v0, %hi(gspF3DEX2_fifoTextStart+0xCDC)
/* 2B75C 8002AB5C 00621825 */  or         $v1, $v1, $v0
/* 2B760 8002AB60 268268A8 */  addiu      $v0, $s4, 0x68a8
.L8002AB64:
/* 2B764 8002AB64 C442203C */  lwc1       $f2, %lo(gspF3DEX2_fifoTextStart+0xCDC)($v0)
/* 2B768 8002AB68 3C01800E */  lui        $at, %hi(D_800DA420)
/* 2B76C 8002AB6C C420A420 */  lwc1       $f0, %lo(D_800DA420)($at)
/* 2B770 8002AB70 46001002 */  mul.s      $f0, $f2, $f0
/* 2B774 8002AB74 3C01800E */  lui        $at, %hi(D_800DA424)
/* 2B778 8002AB78 C422A424 */  lwc1       $f2, %lo(D_800DA424)($at)
/* 2B77C 8002AB7C 4600103E */  c.le.s     $f2, $f0
/* 2B780 8002AB80 00000000 */  nop
/* 2B784 8002AB84 45010005 */  bc1t       .L8002AB9C
/* 2B788 8002AB88 307300FF */   andi      $s3, $v1, 0xff
/* 2B78C 8002AB8C 4600008D */  trunc.w.s  $f2, $f0
/* 2B790 8002AB90 44031000 */  mfc1       $v1, $f2
/* 2B794 8002AB94 0800AAEC */  j          .L8002ABB0
/* 2B798 8002AB98 00000000 */   nop
.L8002AB9C:
/* 2B79C 8002AB9C 46020001 */  sub.s      $f0, $f0, $f2
/* 2B7A0 8002ABA0 4600008D */  trunc.w.s  $f2, $f0
/* 2B7A4 8002ABA4 44031000 */  mfc1       $v1, $f2
/* 2B7A8 8002ABA8 3C028000 */  lui        $v0, 0x8000
/* 2B7AC 8002ABAC 00621825 */  or         $v1, $v1, $v0
.L8002ABB0:
/* 2B7B0 8002ABB0 3C01800E */  lui        $at, %hi(D_800DA428)
/* 2B7B4 8002ABB4 C422A428 */  lwc1       $f2, %lo(D_800DA428)($at)
/* 2B7B8 8002ABB8 268268A8 */  addiu      $v0, $s4, 0x68a8
/* 2B7BC 8002ABBC 46141081 */  sub.s      $f2, $f2, $f20
/* 2B7C0 8002ABC0 C444203C */  lwc1       $f4, 0x203c($v0)
/* 2B7C4 8002ABC4 46041182 */  mul.s      $f6, $f2, $f4
/* 2B7C8 8002ABC8 3C01800E */  lui        $at, %hi(D_800DA42C)
/* 2B7CC 8002ABCC C420A42C */  lwc1       $f0, %lo(D_800DA42C)($at)
/* 2B7D0 8002ABD0 46180001 */  sub.s      $f0, $f0, $f24
/* 2B7D4 8002ABD4 3C01800E */  lui        $at, %hi(D_800DA430)
/* 2B7D8 8002ABD8 C424A430 */  lwc1       $f4, %lo(D_800DA430)($at)
/* 2B7DC 8002ABDC 46040201 */  sub.s      $f8, $f0, $f4
/* 2B7E0 8002ABE0 3C01800E */  lui        $at, %hi(D_800DA434)
/* 2B7E4 8002ABE4 C422A434 */  lwc1       $f2, %lo(D_800DA434)($at)
/* 2B7E8 8002ABE8 4602B080 */  add.s      $f2, $f22, $f2
/* 2B7EC 8002ABEC 46041081 */  sub.s      $f2, $f2, $f4
/* 2B7F0 8002ABF0 3C01800E */  lui        $at, %hi(D_800DA438)
/* 2B7F4 8002ABF4 C420A438 */  lwc1       $f0, %lo(D_800DA438)($at)
/* 2B7F8 8002ABF8 4606003E */  c.le.s     $f0, $f6
/* 2B7FC 8002ABFC 00000000 */  nop
/* 2B800 8002AC00 45010005 */  bc1t       .L8002AC18
/* 2B804 8002AC04 307200FF */   andi      $s2, $v1, 0xff
/* 2B808 8002AC08 4600300D */  trunc.w.s  $f0, $f6
/* 2B80C 8002AC0C 44030000 */  mfc1       $v1, $f0
/* 2B810 8002AC10 0800AB0B */  j          .L8002AC2C
/* 2B814 8002AC14 00000000 */   nop
.L8002AC18:
/* 2B818 8002AC18 46003001 */  sub.s      $f0, $f6, $f0
/* 2B81C 8002AC1C 4600010D */  trunc.w.s  $f4, $f0
/* 2B820 8002AC20 44032000 */  mfc1       $v1, $f4
/* 2B824 8002AC24 3C028000 */  lui        $v0, 0x8000
/* 2B828 8002AC28 00621825 */  or         $v1, $v1, $v0
.L8002AC2C:
/* 2B82C 8002AC2C 44064000 */  mfc1       $a2, $f8
/* 2B830 8002AC30 44071000 */  mfc1       $a3, $f2
/* 2B834 8002AC34 8E029C20 */  lw         $v0, -0x63e0($s0)
/* 2B838 8002AC38 3C01800E */  lui        $at, %hi(D_800DA43C)
/* 2B83C 8002AC3C C420A43C */  lwc1       $f0, %lo(D_800DA43C)($at)
/* 2B840 8002AC40 306300FF */  andi       $v1, $v1, 0xff
/* 2B844 8002AC44 AFB50018 */  sw         $s5, 0x18($sp)
/* 2B848 8002AC48 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2B84C 8002AC4C AFB20020 */  sw         $s2, 0x20($sp)
/* 2B850 8002AC50 AFA30024 */  sw         $v1, 0x24($sp)
/* 2B854 8002AC54 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2B858 8002AC58 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2B85C 8002AC5C 8C450008 */  lw         $a1, 8($v0)
/* 2B860 8002AC60 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2B864 8002AC64 02202021 */   addu      $a0, $s1, $zero
/* 2B868 8002AC68 3C01800E */  lui        $at, %hi(D_800DA440)
/* 2B86C 8002AC6C C420A440 */  lwc1       $f0, %lo(D_800DA440)($at)
/* 2B870 8002AC70 268368A8 */  addiu      $v1, $s4, 0x68a8
/* 2B874 8002AC74 4600A000 */  add.s      $f0, $f20, $f0
/* 2B878 8002AC78 C464203C */  lwc1       $f4, 0x203c($v1)
/* 2B87C 8002AC7C 46040182 */  mul.s      $f6, $f0, $f4
/* 2B880 8002AC80 3C01800E */  lui        $at, %hi(D_800DA444)
/* 2B884 8002AC84 C422A444 */  lwc1       $f2, %lo(D_800DA444)($at)
/* 2B888 8002AC88 4602C080 */  add.s      $f2, $f24, $f2
/* 2B88C 8002AC8C 3C01800E */  lui        $at, %hi(D_800DA448)
/* 2B890 8002AC90 C420A448 */  lwc1       $f0, %lo(D_800DA448)($at)
/* 2B894 8002AC94 46160001 */  sub.s      $f0, $f0, $f22
/* 2B898 8002AC98 3C01800E */  lui        $at, %hi(D_800DA44C)
/* 2B89C 8002AC9C C424A44C */  lwc1       $f4, %lo(D_800DA44C)($at)
/* 2B8A0 8002ACA0 46041201 */  sub.s      $f8, $f2, $f4
/* 2B8A4 8002ACA4 46040081 */  sub.s      $f2, $f0, $f4
/* 2B8A8 8002ACA8 3C01800E */  lui        $at, %hi(D_800DA450)
/* 2B8AC 8002ACAC C420A450 */  lwc1       $f0, %lo(D_800DA450)($at)
/* 2B8B0 8002ACB0 4606003E */  c.le.s     $f0, $f6
/* 2B8B4 8002ACB4 00000000 */  nop
/* 2B8B8 8002ACB8 45010005 */  bc1t       .L8002ACD0
/* 2B8BC 8002ACBC 00408821 */   addu      $s1, $v0, $zero
/* 2B8C0 8002ACC0 4600300D */  trunc.w.s  $f0, $f6
/* 2B8C4 8002ACC4 44030000 */  mfc1       $v1, $f0
/* 2B8C8 8002ACC8 0800AB39 */  j          .L8002ACE4
/* 2B8CC 8002ACCC 00000000 */   nop
.L8002ACD0:
/* 2B8D0 8002ACD0 46003001 */  sub.s      $f0, $f6, $f0
/* 2B8D4 8002ACD4 4600010D */  trunc.w.s  $f4, $f0
/* 2B8D8 8002ACD8 44032000 */  mfc1       $v1, $f4
/* 2B8DC 8002ACDC 3C028000 */  lui        $v0, 0x8000
/* 2B8E0 8002ACE0 00621825 */  or         $v1, $v1, $v0
.L8002ACE4:
/* 2B8E4 8002ACE4 44064000 */  mfc1       $a2, $f8
/* 2B8E8 8002ACE8 44071000 */  mfc1       $a3, $f2
/* 2B8EC 8002ACEC 8E029C20 */  lw         $v0, -0x63e0($s0)
/* 2B8F0 8002ACF0 3C01800E */  lui        $at, %hi(D_800DA454)
/* 2B8F4 8002ACF4 C420A454 */  lwc1       $f0, %lo(D_800DA454)($at)
/* 2B8F8 8002ACF8 306300FF */  andi       $v1, $v1, 0xff
/* 2B8FC 8002ACFC AFB50018 */  sw         $s5, 0x18($sp)
/* 2B900 8002AD00 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2B904 8002AD04 AFB20020 */  sw         $s2, 0x20($sp)
/* 2B908 8002AD08 AFA30024 */  sw         $v1, 0x24($sp)
/* 2B90C 8002AD0C E7A00010 */  swc1       $f0, 0x10($sp)
/* 2B910 8002AD10 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2B914 8002AD14 8C45000C */  lw         $a1, 0xc($v0)
/* 2B918 8002AD18 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2B91C 8002AD1C 02202021 */   addu      $a0, $s1, $zero
/* 2B920 8002AD20 3C01800E */  lui        $at, %hi(D_800DA458)
/* 2B924 8002AD24 C420A458 */  lwc1       $f0, %lo(D_800DA458)($at)
/* 2B928 8002AD28 268368A8 */  addiu      $v1, $s4, 0x68a8
/* 2B92C 8002AD2C 461A0001 */  sub.s      $f0, $f0, $f26
/* 2B930 8002AD30 C464203C */  lwc1       $f4, 0x203c($v1)
/* 2B934 8002AD34 46040182 */  mul.s      $f6, $f0, $f4
/* 2B938 8002AD38 3C01800E */  lui        $at, %hi(D_800DA45C)
/* 2B93C 8002AD3C C422A45C */  lwc1       $f2, %lo(D_800DA45C)($at)
/* 2B940 8002AD40 4602B080 */  add.s      $f2, $f22, $f2
/* 2B944 8002AD44 3C01800E */  lui        $at, %hi(D_800DA460)
/* 2B948 8002AD48 C420A460 */  lwc1       $f0, %lo(D_800DA460)($at)
/* 2B94C 8002AD4C 4600C000 */  add.s      $f0, $f24, $f0
/* 2B950 8002AD50 3C01800E */  lui        $at, %hi(D_800DA464)
/* 2B954 8002AD54 C424A464 */  lwc1       $f4, %lo(D_800DA464)($at)
/* 2B958 8002AD58 46041201 */  sub.s      $f8, $f2, $f4
/* 2B95C 8002AD5C 46040081 */  sub.s      $f2, $f0, $f4
/* 2B960 8002AD60 3C01800E */  lui        $at, %hi(D_800DA468)
/* 2B964 8002AD64 C420A468 */  lwc1       $f0, %lo(D_800DA468)($at)
/* 2B968 8002AD68 4606003E */  c.le.s     $f0, $f6
/* 2B96C 8002AD6C 00000000 */  nop
/* 2B970 8002AD70 45010005 */  bc1t       .L8002AD88
/* 2B974 8002AD74 00408821 */   addu      $s1, $v0, $zero
/* 2B978 8002AD78 4600300D */  trunc.w.s  $f0, $f6
/* 2B97C 8002AD7C 44030000 */  mfc1       $v1, $f0
/* 2B980 8002AD80 0800AB67 */  j          .L8002AD9C
/* 2B984 8002AD84 00000000 */   nop
.L8002AD88:
/* 2B988 8002AD88 46003001 */  sub.s      $f0, $f6, $f0
/* 2B98C 8002AD8C 4600010D */  trunc.w.s  $f4, $f0
/* 2B990 8002AD90 44032000 */  mfc1       $v1, $f4
/* 2B994 8002AD94 3C028000 */  lui        $v0, 0x8000
/* 2B998 8002AD98 00621825 */  or         $v1, $v1, $v0
.L8002AD9C:
/* 2B99C 8002AD9C 44064000 */  mfc1       $a2, $f8
/* 2B9A0 8002ADA0 44071000 */  mfc1       $a3, $f2
/* 2B9A4 8002ADA4 8E029C20 */  lw         $v0, -0x63e0($s0)
/* 2B9A8 8002ADA8 3C01800E */  lui        $at, %hi(D_800DA46C)
/* 2B9AC 8002ADAC C420A46C */  lwc1       $f0, %lo(D_800DA46C)($at)
/* 2B9B0 8002ADB0 306300FF */  andi       $v1, $v1, 0xff
/* 2B9B4 8002ADB4 AFB50018 */  sw         $s5, 0x18($sp)
/* 2B9B8 8002ADB8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2B9BC 8002ADBC AFB20020 */  sw         $s2, 0x20($sp)
/* 2B9C0 8002ADC0 AFA30024 */  sw         $v1, 0x24($sp)
/* 2B9C4 8002ADC4 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2B9C8 8002ADC8 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2B9CC 8002ADCC 8C450010 */  lw         $a1, 0x10($v0)
/* 2B9D0 8002ADD0 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2B9D4 8002ADD4 02202021 */   addu      $a0, $s1, $zero
/* 2B9D8 8002ADD8 3C01800E */  lui        $at, %hi(D_800DA470)
/* 2B9DC 8002ADDC C420A470 */  lwc1       $f0, %lo(D_800DA470)($at)
/* 2B9E0 8002ADE0 268368A8 */  addiu      $v1, $s4, 0x68a8
/* 2B9E4 8002ADE4 4600D000 */  add.s      $f0, $f26, $f0
/* 2B9E8 8002ADE8 C464203C */  lwc1       $f4, 0x203c($v1)
/* 2B9EC 8002ADEC 46040502 */  mul.s      $f20, $f0, $f4
/* 2B9F0 8002ADF0 3C01800E */  lui        $at, %hi(D_800DA474)
/* 2B9F4 8002ADF4 C422A474 */  lwc1       $f2, %lo(D_800DA474)($at)
/* 2B9F8 8002ADF8 46161081 */  sub.s      $f2, $f2, $f22
/* 2B9FC 8002ADFC 3C01800E */  lui        $at, %hi(D_800DA478)
/* 2BA00 8002AE00 C420A478 */  lwc1       $f0, %lo(D_800DA478)($at)
/* 2BA04 8002AE04 46180001 */  sub.s      $f0, $f0, $f24
/* 2BA08 8002AE08 3C01800E */  lui        $at, %hi(D_800DA47C)
/* 2BA0C 8002AE0C C424A47C */  lwc1       $f4, %lo(D_800DA47C)($at)
/* 2BA10 8002AE10 46041201 */  sub.s      $f8, $f2, $f4
/* 2BA14 8002AE14 46040081 */  sub.s      $f2, $f0, $f4
/* 2BA18 8002AE18 3C01800E */  lui        $at, %hi(D_800DA480)
/* 2BA1C 8002AE1C C420A480 */  lwc1       $f0, %lo(D_800DA480)($at)
/* 2BA20 8002AE20 4614003E */  c.le.s     $f0, $f20
/* 2BA24 8002AE24 00000000 */  nop
/* 2BA28 8002AE28 45010005 */  bc1t       .L8002AE40
/* 2BA2C 8002AE2C 00408821 */   addu      $s1, $v0, $zero
/* 2BA30 8002AE30 4600A00D */  trunc.w.s  $f0, $f20
/* 2BA34 8002AE34 44030000 */  mfc1       $v1, $f0
/* 2BA38 8002AE38 0800AB95 */  j          .L8002AE54
/* 2BA3C 8002AE3C 00000000 */   nop
.L8002AE40:
/* 2BA40 8002AE40 4600A001 */  sub.s      $f0, $f20, $f0
/* 2BA44 8002AE44 4600010D */  trunc.w.s  $f4, $f0
/* 2BA48 8002AE48 44032000 */  mfc1       $v1, $f4
/* 2BA4C 8002AE4C 3C028000 */  lui        $v0, 0x8000
/* 2BA50 8002AE50 00621825 */  or         $v1, $v1, $v0
.L8002AE54:
/* 2BA54 8002AE54 44064000 */  mfc1       $a2, $f8
/* 2BA58 8002AE58 44071000 */  mfc1       $a3, $f2
/* 2BA5C 8002AE5C 8E029C20 */  lw         $v0, -0x63e0($s0)
/* 2BA60 8002AE60 3C01800E */  lui        $at, %hi(D_800DA484)
/* 2BA64 8002AE64 C420A484 */  lwc1       $f0, %lo(D_800DA484)($at)
/* 2BA68 8002AE68 306300FF */  andi       $v1, $v1, 0xff
/* 2BA6C 8002AE6C AFB50018 */  sw         $s5, 0x18($sp)
/* 2BA70 8002AE70 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2BA74 8002AE74 AFB20020 */  sw         $s2, 0x20($sp)
/* 2BA78 8002AE78 AFA30024 */  sw         $v1, 0x24($sp)
/* 2BA7C 8002AE7C E7A00010 */  swc1       $f0, 0x10($sp)
/* 2BA80 8002AE80 E7A00014 */  swc1       $f0, 0x14($sp)
/* 2BA84 8002AE84 8C450014 */  lw         $a1, 0x14($v0)
/* 2BA88 8002AE88 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2BA8C 8002AE8C 02202021 */   addu      $a0, $s1, $zero
/* 2BA90 8002AE90 8FBF0084 */  lw         $ra, 0x84($sp)
/* 2BA94 8002AE94 8FB60080 */  lw         $s6, 0x80($sp)
/* 2BA98 8002AE98 8FB5007C */  lw         $s5, 0x7c($sp)
/* 2BA9C 8002AE9C 8FB40078 */  lw         $s4, 0x78($sp)
/* 2BAA0 8002AEA0 8FB30074 */  lw         $s3, 0x74($sp)
/* 2BAA4 8002AEA4 8FB20070 */  lw         $s2, 0x70($sp)
/* 2BAA8 8002AEA8 8FB1006C */  lw         $s1, 0x6c($sp)
/* 2BAAC 8002AEAC 8FB00068 */  lw         $s0, 0x68($sp)
/* 2BAB0 8002AEB0 D7BA00A0 */  ldc1       $f26, 0xa0($sp)
/* 2BAB4 8002AEB4 D7B80098 */  ldc1       $f24, 0x98($sp)
/* 2BAB8 8002AEB8 D7B60090 */  ldc1       $f22, 0x90($sp)
/* 2BABC 8002AEBC D7B40088 */  ldc1       $f20, 0x88($sp)
/* 2BAC0 8002AEC0 03E00008 */  jr         $ra
/* 2BAC4 8002AEC4 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel compass_free
/* 2BAC8 8002AEC8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2BACC 8002AECC AFB00010 */  sw         $s0, 0x10($sp)
/* 2BAD0 8002AED0 3C10800E */  lui        $s0, %hi(queueStructA)
/* 2BAD4 8002AED4 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 2BAD8 8002AED8 02002021 */  addu       $a0, $s0, $zero
/* 2BADC 8002AEDC 24060004 */  addiu      $a2, $zero, 4
/* 2BAE0 8002AEE0 AFB10014 */  sw         $s1, 0x14($sp)
/* 2BAE4 8002AEE4 3C11800F */  lui        $s1, %hi(compass_pointer)
/* 2BAE8 8002AEE8 8E259C20 */  lw         $a1, %lo(compass_pointer)($s1)
/* 2BAEC 8002AEEC AFBF0018 */  sw         $ra, 0x18($sp)
/* 2BAF0 8002AEF0 0C035867 */  jal        AllocFreeQueueItem
/* 2BAF4 8002AEF4 00003821 */   addu      $a3, $zero, $zero
/* 2BAF8 8002AEF8 02002021 */  addu       $a0, $s0, $zero
/* 2BAFC 8002AEFC 24060004 */  addiu      $a2, $zero, 4
/* 2BB00 8002AF00 8E259C20 */  lw         $a1, -0x63e0($s1)
/* 2BB04 8002AF04 00003821 */  addu       $a3, $zero, $zero
/* 2BB08 8002AF08 0C035867 */  jal        AllocFreeQueueItem
/* 2BB0C 8002AF0C 24A50008 */   addiu     $a1, $a1, 8
/* 2BB10 8002AF10 02002021 */  addu       $a0, $s0, $zero
/* 2BB14 8002AF14 24060004 */  addiu      $a2, $zero, 4
/* 2BB18 8002AF18 8E259C20 */  lw         $a1, -0x63e0($s1)
/* 2BB1C 8002AF1C 00003821 */  addu       $a3, $zero, $zero
/* 2BB20 8002AF20 0C035867 */  jal        AllocFreeQueueItem
/* 2BB24 8002AF24 24A5000C */   addiu     $a1, $a1, 0xc
/* 2BB28 8002AF28 02002021 */  addu       $a0, $s0, $zero
/* 2BB2C 8002AF2C 24060004 */  addiu      $a2, $zero, 4
/* 2BB30 8002AF30 8E259C20 */  lw         $a1, -0x63e0($s1)
/* 2BB34 8002AF34 00003821 */  addu       $a3, $zero, $zero
/* 2BB38 8002AF38 0C035867 */  jal        AllocFreeQueueItem
/* 2BB3C 8002AF3C 24A50010 */   addiu     $a1, $a1, 0x10
/* 2BB40 8002AF40 02002021 */  addu       $a0, $s0, $zero
/* 2BB44 8002AF44 24060004 */  addiu      $a2, $zero, 4
/* 2BB48 8002AF48 8E259C20 */  lw         $a1, -0x63e0($s1)
/* 2BB4C 8002AF4C 00003821 */  addu       $a3, $zero, $zero
/* 2BB50 8002AF50 0C035867 */  jal        AllocFreeQueueItem
/* 2BB54 8002AF54 24A50014 */   addiu     $a1, $a1, 0x14
/* 2BB58 8002AF58 3C05800E */  lui        $a1, %hi(D_800DA3D0)
/* 2BB5C 8002AF5C 24A5A3D0 */  addiu      $a1, $a1, %lo(D_800DA3D0)
/* 2BB60 8002AF60 8E249C20 */  lw         $a0, -0x63e0($s1)
/* 2BB64 8002AF64 0C02600C */  jal        Free
/* 2BB68 8002AF68 240600D1 */   addiu     $a2, $zero, 0xd1
/* 2BB6C 8002AF6C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 2BB70 8002AF70 AE209C20 */  sw         $zero, -0x63e0($s1)
/* 2BB74 8002AF74 8FB10014 */  lw         $s1, 0x14($sp)
/* 2BB78 8002AF78 8FB00010 */  lw         $s0, 0x10($sp)
/* 2BB7C 8002AF7C 03E00008 */  jr         $ra
/* 2BB80 8002AF80 27BD0020 */   addiu     $sp, $sp, 0x20
/* 2BB84 8002AF84 00000000 */  nop
/* 2BB88 8002AF88 00000000 */  nop
/* 2BB8C 8002AF8C 00000000 */  nop
