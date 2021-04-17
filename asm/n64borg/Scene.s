.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel anidat_setMaxtrixA_3
/* A8110 800A7510 AC8500B8 */  sw         $a1, 0xb8($a0)
/* A8114 800A7514 AC8600BC */  sw         $a2, 0xbc($a0)
/* A8118 800A7518 03E00008 */  jr         $ra
/* A811C 800A751C AC8700C0 */   sw        $a3, 0xc0($a0)

glabel anidat_addMaxtrixA_3
/* A8120 800A7520 C48400B8 */  lwc1       $f4, 0xb8($a0)
/* A8124 800A7524 44850000 */  mtc1       $a1, $f0
/* A8128 800A7528 C48200BC */  lwc1       $f2, 0xbc($a0)
/* A812C 800A752C 46002100 */  add.s      $f4, $f4, $f0
/* A8130 800A7530 44863000 */  mtc1       $a2, $f6
/* A8134 800A7534 46061080 */  add.s      $f2, $f2, $f6
/* A8138 800A7538 C48000C0 */  lwc1       $f0, 0xc0($a0)
/* A813C 800A753C 44873000 */  mtc1       $a3, $f6
/* A8140 800A7540 46060000 */  add.s      $f0, $f0, $f6
/* A8144 800A7544 E48400B8 */  swc1       $f4, 0xb8($a0)
/* A8148 800A7548 E48200BC */  swc1       $f2, 0xbc($a0)
/* A814C 800A754C 03E00008 */  jr         $ra
/* A8150 800A7550 E48000C0 */   swc1      $f0, 0xc0($a0)

glabel func_800A7554
/* A8154 800A7554 44855000 */  mtc1       $a1, $f10
/* A8158 800A7558 27BDFFF8 */  addiu      $sp, $sp, -8
/* A815C 800A755C F7B40000 */  sdc1       $f20, ($sp)
/* A8160 800A7560 C4840088 */  lwc1       $f4, 0x88($a0)
/* A8164 800A7564 460A2102 */  mul.s      $f4, $f4, $f10
/* A8168 800A7568 44868000 */  mtc1       $a2, $f16
/* A816C 800A756C C4940098 */  lwc1       $f20, 0x98($a0)
/* A8170 800A7570 4610A502 */  mul.s      $f20, $f20, $f16
/* A8174 800A7574 44873000 */  mtc1       $a3, $f6
/* A8178 800A7578 C49200A8 */  lwc1       $f18, 0xa8($a0)
/* A817C 800A757C 46069482 */  mul.s      $f18, $f18, $f6
/* A8180 800A7580 C480008C */  lwc1       $f0, 0x8c($a0)
/* A8184 800A7584 460A0002 */  mul.s      $f0, $f0, $f10
/* A8188 800A7588 C48C009C */  lwc1       $f12, 0x9c($a0)
/* A818C 800A758C 46106302 */  mul.s      $f12, $f12, $f16
/* A8190 800A7590 C48E00AC */  lwc1       $f14, 0xac($a0)
/* A8194 800A7594 46067382 */  mul.s      $f14, $f14, $f6
/* A8198 800A7598 C4820090 */  lwc1       $f2, 0x90($a0)
/* A819C 800A759C 460A1082 */  mul.s      $f2, $f2, $f10
/* A81A0 800A75A0 C48800A0 */  lwc1       $f8, 0xa0($a0)
/* A81A4 800A75A4 46104202 */  mul.s      $f8, $f8, $f16
/* A81A8 800A75A8 C48A00B0 */  lwc1       $f10, 0xb0($a0)
/* A81AC 800A75AC 46065282 */  mul.s      $f10, $f10, $f6
/* A81B0 800A75B0 46142100 */  add.s      $f4, $f4, $f20
/* A81B4 800A75B4 460C0000 */  add.s      $f0, $f0, $f12
/* A81B8 800A75B8 46081080 */  add.s      $f2, $f2, $f8
/* A81BC 800A75BC 46122100 */  add.s      $f4, $f4, $f18
/* A81C0 800A75C0 460E0000 */  add.s      $f0, $f0, $f14
/* A81C4 800A75C4 460A1080 */  add.s      $f2, $f2, $f10
/* A81C8 800A75C8 C48600B8 */  lwc1       $f6, 0xb8($a0)
/* A81CC 800A75CC 46043180 */  add.s      $f6, $f6, $f4
/* A81D0 800A75D0 C48400BC */  lwc1       $f4, 0xbc($a0)
/* A81D4 800A75D4 46002100 */  add.s      $f4, $f4, $f0
/* A81D8 800A75D8 C48000C0 */  lwc1       $f0, 0xc0($a0)
/* A81DC 800A75DC D7B40000 */  ldc1       $f20, ($sp)
/* A81E0 800A75E0 46020000 */  add.s      $f0, $f0, $f2
/* A81E4 800A75E4 E48600B8 */  swc1       $f6, 0xb8($a0)
/* A81E8 800A75E8 E48400BC */  swc1       $f4, 0xbc($a0)
/* A81EC 800A75EC E48000C0 */  swc1       $f0, 0xc0($a0)
/* A81F0 800A75F0 03E00008 */  jr         $ra
/* A81F4 800A75F4 27BD0008 */   addiu     $sp, $sp, 8

glabel AniDat_rotate_MatrixA
/* A81F8 800A75F8 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* A81FC 800A75FC AFB00050 */  sw         $s0, 0x50($sp)
/* A8200 800A7600 00808021 */  addu       $s0, $a0, $zero
/* A8204 800A7604 44850000 */  mtc1       $a1, $f0
/* A8208 800A7608 00C02821 */  addu       $a1, $a2, $zero
/* A820C 800A760C 44060000 */  mfc1       $a2, $f0
/* A8210 800A7610 AFBF0054 */  sw         $ra, 0x54($sp)
/* A8214 800A7614 0C032D64 */  jal        guRotateRPYF
/* A8218 800A7618 27A40010 */   addiu     $a0, $sp, 0x10
/* A821C 800A761C C7A00010 */  lwc1       $f0, 0x10($sp)
/* A8220 800A7620 C7A20020 */  lwc1       $f2, 0x20($sp)
/* A8224 800A7624 C7A40030 */  lwc1       $f4, 0x30($sp)
/* A8228 800A7628 C7A60014 */  lwc1       $f6, 0x14($sp)
/* A822C 800A762C C7A80024 */  lwc1       $f8, 0x24($sp)
/* A8230 800A7630 C7AA0034 */  lwc1       $f10, 0x34($sp)
/* A8234 800A7634 C7AC0018 */  lwc1       $f12, 0x18($sp)
/* A8238 800A7638 C7AE0028 */  lwc1       $f14, 0x28($sp)
/* A823C 800A763C C7B00038 */  lwc1       $f16, 0x38($sp)
/* A8240 800A7640 8FBF0054 */  lw         $ra, 0x54($sp)
/* A8244 800A7644 E6000088 */  swc1       $f0, 0x88($s0)
/* A8248 800A7648 E6020098 */  swc1       $f2, 0x98($s0)
/* A824C 800A764C E60400A8 */  swc1       $f4, 0xa8($s0)
/* A8250 800A7650 E606008C */  swc1       $f6, 0x8c($s0)
/* A8254 800A7654 E608009C */  swc1       $f8, 0x9c($s0)
/* A8258 800A7658 E60A00AC */  swc1       $f10, 0xac($s0)
/* A825C 800A765C E60C0090 */  swc1       $f12, 0x90($s0)
/* A8260 800A7660 E60E00A0 */  swc1       $f14, 0xa0($s0)
/* A8264 800A7664 E61000B0 */  swc1       $f16, 0xb0($s0)
/* A8268 800A7668 8FB00050 */  lw         $s0, 0x50($sp)
/* A826C 800A766C 03E00008 */  jr         $ra
/* A8270 800A7670 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800A7674
/* A8274 800A7674 27BDFF68 */  addiu      $sp, $sp, -0x98
/* A8278 800A7678 AFB00090 */  sw         $s0, 0x90($sp)
/* A827C 800A767C 00808021 */  addu       $s0, $a0, $zero
/* A8280 800A7680 44850000 */  mtc1       $a1, $f0
/* A8284 800A7684 00C02821 */  addu       $a1, $a2, $zero
/* A8288 800A7688 44060000 */  mfc1       $a2, $f0
/* A828C 800A768C AFBF0094 */  sw         $ra, 0x94($sp)
/* A8290 800A7690 0C032D64 */  jal        guRotateRPYF
/* A8294 800A7694 27A40010 */   addiu     $a0, $sp, 0x10
/* A8298 800A7698 27A30050 */  addiu      $v1, $sp, 0x50
/* A829C 800A769C 26020088 */  addiu      $v0, $s0, 0x88
/* A82A0 800A76A0 260400C8 */  addiu      $a0, $s0, 0xc8
/* A82A4 800A76A4 00603021 */  addu       $a2, $v1, $zero
.L800A76A8:
/* A82A8 800A76A8 8C450000 */  lw         $a1, ($v0)
/* A82AC 800A76AC 8C470004 */  lw         $a3, 4($v0)
/* A82B0 800A76B0 8C480008 */  lw         $t0, 8($v0)
/* A82B4 800A76B4 8C49000C */  lw         $t1, 0xc($v0)
/* A82B8 800A76B8 AC650000 */  sw         $a1, ($v1)
/* A82BC 800A76BC AC670004 */  sw         $a3, 4($v1)
/* A82C0 800A76C0 AC680008 */  sw         $t0, 8($v1)
/* A82C4 800A76C4 AC69000C */  sw         $t1, 0xc($v1)
/* A82C8 800A76C8 24420010 */  addiu      $v0, $v0, 0x10
/* A82CC 800A76CC 1444FFF6 */  bne        $v0, $a0, .L800A76A8
/* A82D0 800A76D0 24630010 */   addiu     $v1, $v1, 0x10
/* A82D4 800A76D4 26040088 */  addiu      $a0, $s0, 0x88
/* A82D8 800A76D8 0C02B127 */  jal        some_oher_matrix_math
/* A82DC 800A76DC 27A50010 */   addiu     $a1, $sp, 0x10
/* A82E0 800A76E0 8FBF0094 */  lw         $ra, 0x94($sp)
/* A82E4 800A76E4 8FB00090 */  lw         $s0, 0x90($sp)
/* A82E8 800A76E8 03E00008 */  jr         $ra
/* A82EC 800A76EC 27BD0098 */   addiu     $sp, $sp, 0x98

glabel func_800A76F0
/* A82F0 800A76F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A82F4 800A76F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* A82F8 800A76F8 0C02B310 */  jal        ofunc_sub_800acc40
/* A82FC 800A76FC 24840088 */   addiu     $a0, $a0, 0x88
/* A8300 800A7700 8FBF0010 */  lw         $ra, 0x10($sp)
/* A8304 800A7704 03E00008 */  jr         $ra
/* A8308 800A7708 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A770C
/* A830C 800A770C 27BDFF68 */  addiu      $sp, $sp, -0x98
/* A8310 800A7710 AFB00090 */  sw         $s0, 0x90($sp)
/* A8314 800A7714 00808021 */  addu       $s0, $a0, $zero
/* A8318 800A7718 AFBF0094 */  sw         $ra, 0x94($sp)
/* A831C 800A771C 0C02B310 */  jal        ofunc_sub_800acc40
/* A8320 800A7720 27A40010 */   addiu     $a0, $sp, 0x10
/* A8324 800A7724 27A30050 */  addiu      $v1, $sp, 0x50
/* A8328 800A7728 26020088 */  addiu      $v0, $s0, 0x88
/* A832C 800A772C 260400C8 */  addiu      $a0, $s0, 0xc8
/* A8330 800A7730 00603021 */  addu       $a2, $v1, $zero
.L800A7734:
/* A8334 800A7734 8C450000 */  lw         $a1, ($v0)
/* A8338 800A7738 8C470004 */  lw         $a3, 4($v0)
/* A833C 800A773C 8C480008 */  lw         $t0, 8($v0)
/* A8340 800A7740 8C49000C */  lw         $t1, 0xc($v0)
/* A8344 800A7744 AC650000 */  sw         $a1, ($v1)
/* A8348 800A7748 AC670004 */  sw         $a3, 4($v1)
/* A834C 800A774C AC680008 */  sw         $t0, 8($v1)
/* A8350 800A7750 AC69000C */  sw         $t1, 0xc($v1)
/* A8354 800A7754 24420010 */  addiu      $v0, $v0, 0x10
/* A8358 800A7758 1444FFF6 */  bne        $v0, $a0, .L800A7734
/* A835C 800A775C 24630010 */   addiu     $v1, $v1, 0x10
/* A8360 800A7760 26040088 */  addiu      $a0, $s0, 0x88
/* A8364 800A7764 0C02B0BA */  jal        func_800AC2E8
/* A8368 800A7768 27A50010 */   addiu     $a1, $sp, 0x10
/* A836C 800A776C 8FBF0094 */  lw         $ra, 0x94($sp)
/* A8370 800A7770 8FB00090 */  lw         $s0, 0x90($sp)
/* A8374 800A7774 03E00008 */  jr         $ra
/* A8378 800A7778 27BD0098 */   addiu     $sp, $sp, 0x98

glabel matrix_normalize_scale
/* A837C 800A777C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* A8380 800A7780 AFB00010 */  sw         $s0, 0x10($sp)
/* A8384 800A7784 00808021 */  addu       $s0, $a0, $zero
/* A8388 800A7788 AFB10014 */  sw         $s1, 0x14($sp)
/* A838C 800A778C 26110088 */  addiu      $s1, $s0, 0x88
/* A8390 800A7790 F7B80030 */  sdc1       $f24, 0x30($sp)
/* A8394 800A7794 4485C000 */  mtc1       $a1, $f24
/* A8398 800A7798 02202021 */  addu       $a0, $s1, $zero
/* A839C 800A779C F7B40020 */  sdc1       $f20, 0x20($sp)
/* A83A0 800A77A0 4486A000 */  mtc1       $a2, $f20
/* A83A4 800A77A4 2605008C */  addiu      $a1, $s0, 0x8c
/* A83A8 800A77A8 F7B60028 */  sdc1       $f22, 0x28($sp)
/* A83AC 800A77AC 4487B000 */  mtc1       $a3, $f22
/* A83B0 800A77B0 26060090 */  addiu      $a2, $s0, 0x90
/* A83B4 800A77B4 AFBF0018 */  sw         $ra, 0x18($sp)
/* A83B8 800A77B8 E61801C8 */  swc1       $f24, 0x1c8($s0)
/* A83BC 800A77BC E61401CC */  swc1       $f20, 0x1cc($s0)
/* A83C0 800A77C0 0C03122C */  jal        guNormalize
/* A83C4 800A77C4 E61601D0 */   swc1      $f22, 0x1d0($s0)
/* A83C8 800A77C8 26040098 */  addiu      $a0, $s0, 0x98
/* A83CC 800A77CC 2605009C */  addiu      $a1, $s0, 0x9c
/* A83D0 800A77D0 0C03122C */  jal        guNormalize
/* A83D4 800A77D4 260600A0 */   addiu     $a2, $s0, 0xa0
/* A83D8 800A77D8 260400A8 */  addiu      $a0, $s0, 0xa8
/* A83DC 800A77DC 260500AC */  addiu      $a1, $s0, 0xac
/* A83E0 800A77E0 0C03122C */  jal        guNormalize
/* A83E4 800A77E4 260600B0 */   addiu     $a2, $s0, 0xb0
/* A83E8 800A77E8 4405C000 */  mfc1       $a1, $f24
/* A83EC 800A77EC 4406A000 */  mfc1       $a2, $f20
/* A83F0 800A77F0 4407B000 */  mfc1       $a3, $f22
/* A83F4 800A77F4 0C02B3EB */  jal        matrix_scale
/* A83F8 800A77F8 02202021 */   addu      $a0, $s1, $zero
/* A83FC 800A77FC 8FBF0018 */  lw         $ra, 0x18($sp)
/* A8400 800A7800 8FB10014 */  lw         $s1, 0x14($sp)
/* A8404 800A7804 8FB00010 */  lw         $s0, 0x10($sp)
/* A8408 800A7808 D7B80030 */  ldc1       $f24, 0x30($sp)
/* A840C 800A780C D7B60028 */  ldc1       $f22, 0x28($sp)
/* A8410 800A7810 D7B40020 */  ldc1       $f20, 0x20($sp)
/* A8414 800A7814 03E00008 */  jr         $ra
/* A8418 800A7818 27BD0038 */   addiu     $sp, $sp, 0x38

glabel scale_body_part
/* A841C 800A781C 44850000 */  mtc1       $a1, $f0
/* A8420 800A7820 44861000 */  mtc1       $a2, $f2
/* A8424 800A7824 44872000 */  mtc1       $a3, $f4
/* A8428 800A7828 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A842C 800A782C AFBF0010 */  sw         $ra, 0x10($sp)
/* A8430 800A7830 E48001C8 */  swc1       $f0, 0x1c8($a0)
/* A8434 800A7834 E48201CC */  swc1       $f2, 0x1cc($a0)
/* A8438 800A7838 E48401D0 */  swc1       $f4, 0x1d0($a0)
/* A843C 800A783C 0C02B3EB */  jal        matrix_scale
/* A8440 800A7840 24840088 */   addiu     $a0, $a0, 0x88
/* A8444 800A7844 8FBF0010 */  lw         $ra, 0x10($sp)
/* A8448 800A7848 03E00008 */  jr         $ra
/* A844C 800A784C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel align_matrix
/* A8450 800A7850 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* A8454 800A7854 44850000 */  mtc1       $a1, $f0
/* A8458 800A7858 44861000 */  mtc1       $a2, $f2
/* A845C 800A785C 8FA50070 */  lw         $a1, 0x70($sp)
/* A8460 800A7860 AFB00058 */  sw         $s0, 0x58($sp)
/* A8464 800A7864 00808021 */  addu       $s0, $a0, $zero
/* A8468 800A7868 AFA70010 */  sw         $a3, 0x10($sp)
/* A846C 800A786C 44060000 */  mfc1       $a2, $f0
/* A8470 800A7870 44071000 */  mfc1       $a3, $f2
/* A8474 800A7874 AFBF005C */  sw         $ra, 0x5c($sp)
/* A8478 800A7878 0C02F8C4 */  jal        guAlignF
/* A847C 800A787C 27A40018 */   addiu     $a0, $sp, 0x18
/* A8480 800A7880 C7A00018 */  lwc1       $f0, 0x18($sp)
/* A8484 800A7884 8FBF005C */  lw         $ra, 0x5c($sp)
/* A8488 800A7888 E6000088 */  swc1       $f0, 0x88($s0)
/* A848C 800A788C C7A20028 */  lwc1       $f2, 0x28($sp)
/* A8490 800A7890 C7A00038 */  lwc1       $f0, 0x38($sp)
/* A8494 800A7894 C7A4001C */  lwc1       $f4, 0x1c($sp)
/* A8498 800A7898 C7A6002C */  lwc1       $f6, 0x2c($sp)
/* A849C 800A789C C7A8003C */  lwc1       $f8, 0x3c($sp)
/* A84A0 800A78A0 C7AA0020 */  lwc1       $f10, 0x20($sp)
/* A84A4 800A78A4 C7AC0030 */  lwc1       $f12, 0x30($sp)
/* A84A8 800A78A8 C7AE0040 */  lwc1       $f14, 0x40($sp)
/* A84AC 800A78AC 26100088 */  addiu      $s0, $s0, 0x88
/* A84B0 800A78B0 E6020010 */  swc1       $f2, 0x10($s0)
/* A84B4 800A78B4 E6000020 */  swc1       $f0, 0x20($s0)
/* A84B8 800A78B8 E6040004 */  swc1       $f4, 4($s0)
/* A84BC 800A78BC E6060014 */  swc1       $f6, 0x14($s0)
/* A84C0 800A78C0 E6080024 */  swc1       $f8, 0x24($s0)
/* A84C4 800A78C4 E60A0008 */  swc1       $f10, 8($s0)
/* A84C8 800A78C8 E60C0018 */  swc1       $f12, 0x18($s0)
/* A84CC 800A78CC E60E0028 */  swc1       $f14, 0x28($s0)
/* A84D0 800A78D0 8FB00058 */  lw         $s0, 0x58($sp)
/* A84D4 800A78D4 03E00008 */  jr         $ra
/* A84D8 800A78D8 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_800A78DC
/* A84DC 800A78DC AC8500F8 */  sw         $a1, 0xf8($a0)
/* A84E0 800A78E0 AC8600FC */  sw         $a2, 0xfc($a0)
/* A84E4 800A78E4 03E00008 */  jr         $ra
/* A84E8 800A78E8 AC870100 */   sw        $a3, 0x100($a0)

glabel func_800A78EC
/* A84EC 800A78EC C48400F8 */  lwc1       $f4, 0xf8($a0)
/* A84F0 800A78F0 44850000 */  mtc1       $a1, $f0
/* A84F4 800A78F4 C48200FC */  lwc1       $f2, 0xfc($a0)
/* A84F8 800A78F8 46002100 */  add.s      $f4, $f4, $f0
/* A84FC 800A78FC 44863000 */  mtc1       $a2, $f6
/* A8500 800A7900 46061080 */  add.s      $f2, $f2, $f6
/* A8504 800A7904 C4800100 */  lwc1       $f0, 0x100($a0)
/* A8508 800A7908 44873000 */  mtc1       $a3, $f6
/* A850C 800A790C 46060000 */  add.s      $f0, $f0, $f6
/* A8510 800A7910 E48400F8 */  swc1       $f4, 0xf8($a0)
/* A8514 800A7914 E48200FC */  swc1       $f2, 0xfc($a0)
/* A8518 800A7918 03E00008 */  jr         $ra
/* A851C 800A791C E4800100 */   swc1      $f0, 0x100($a0)

glabel func_800A7920
/* A8520 800A7920 44855000 */  mtc1       $a1, $f10
/* A8524 800A7924 27BDFFF8 */  addiu      $sp, $sp, -8
/* A8528 800A7928 F7B40000 */  sdc1       $f20, ($sp)
/* A852C 800A792C C48400C8 */  lwc1       $f4, 0xc8($a0)
/* A8530 800A7930 460A2102 */  mul.s      $f4, $f4, $f10
/* A8534 800A7934 44868000 */  mtc1       $a2, $f16
/* A8538 800A7938 C49400D8 */  lwc1       $f20, 0xd8($a0)
/* A853C 800A793C 4610A502 */  mul.s      $f20, $f20, $f16
/* A8540 800A7940 44873000 */  mtc1       $a3, $f6
/* A8544 800A7944 C49200E8 */  lwc1       $f18, 0xe8($a0)
/* A8548 800A7948 46069482 */  mul.s      $f18, $f18, $f6
/* A854C 800A794C C48000CC */  lwc1       $f0, 0xcc($a0)
/* A8550 800A7950 460A0002 */  mul.s      $f0, $f0, $f10
/* A8554 800A7954 C48C00DC */  lwc1       $f12, 0xdc($a0)
/* A8558 800A7958 46106302 */  mul.s      $f12, $f12, $f16
/* A855C 800A795C C48E00EC */  lwc1       $f14, 0xec($a0)
/* A8560 800A7960 46067382 */  mul.s      $f14, $f14, $f6
/* A8564 800A7964 C48200D0 */  lwc1       $f2, 0xd0($a0)
/* A8568 800A7968 460A1082 */  mul.s      $f2, $f2, $f10
/* A856C 800A796C C48800E0 */  lwc1       $f8, 0xe0($a0)
/* A8570 800A7970 46104202 */  mul.s      $f8, $f8, $f16
/* A8574 800A7974 C48A00F0 */  lwc1       $f10, 0xf0($a0)
/* A8578 800A7978 46065282 */  mul.s      $f10, $f10, $f6
/* A857C 800A797C 46142100 */  add.s      $f4, $f4, $f20
/* A8580 800A7980 460C0000 */  add.s      $f0, $f0, $f12
/* A8584 800A7984 46081080 */  add.s      $f2, $f2, $f8
/* A8588 800A7988 46122100 */  add.s      $f4, $f4, $f18
/* A858C 800A798C 460E0000 */  add.s      $f0, $f0, $f14
/* A8590 800A7990 460A1080 */  add.s      $f2, $f2, $f10
/* A8594 800A7994 C48600F8 */  lwc1       $f6, 0xf8($a0)
/* A8598 800A7998 46043180 */  add.s      $f6, $f6, $f4
/* A859C 800A799C C48400FC */  lwc1       $f4, 0xfc($a0)
/* A85A0 800A79A0 46002100 */  add.s      $f4, $f4, $f0
/* A85A4 800A79A4 C4800100 */  lwc1       $f0, 0x100($a0)
/* A85A8 800A79A8 D7B40000 */  ldc1       $f20, ($sp)
/* A85AC 800A79AC 46020000 */  add.s      $f0, $f0, $f2
/* A85B0 800A79B0 E48600F8 */  swc1       $f6, 0xf8($a0)
/* A85B4 800A79B4 E48400FC */  swc1       $f4, 0xfc($a0)
/* A85B8 800A79B8 E4800100 */  swc1       $f0, 0x100($a0)
/* A85BC 800A79BC 03E00008 */  jr         $ra
/* A85C0 800A79C0 27BD0008 */   addiu     $sp, $sp, 8

glabel func_800A79C4
/* A85C4 800A79C4 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* A85C8 800A79C8 AFB00050 */  sw         $s0, 0x50($sp)
/* A85CC 800A79CC 00808021 */  addu       $s0, $a0, $zero
/* A85D0 800A79D0 44850000 */  mtc1       $a1, $f0
/* A85D4 800A79D4 00C02821 */  addu       $a1, $a2, $zero
/* A85D8 800A79D8 44060000 */  mfc1       $a2, $f0
/* A85DC 800A79DC AFBF0054 */  sw         $ra, 0x54($sp)
/* A85E0 800A79E0 0C032D64 */  jal        guRotateRPYF
/* A85E4 800A79E4 27A40010 */   addiu     $a0, $sp, 0x10
/* A85E8 800A79E8 C7A00010 */  lwc1       $f0, 0x10($sp)
/* A85EC 800A79EC C7A20020 */  lwc1       $f2, 0x20($sp)
/* A85F0 800A79F0 C7A40030 */  lwc1       $f4, 0x30($sp)
/* A85F4 800A79F4 C7A60014 */  lwc1       $f6, 0x14($sp)
/* A85F8 800A79F8 C7A80024 */  lwc1       $f8, 0x24($sp)
/* A85FC 800A79FC C7AA0034 */  lwc1       $f10, 0x34($sp)
/* A8600 800A7A00 C7AC0018 */  lwc1       $f12, 0x18($sp)
/* A8604 800A7A04 C7AE0028 */  lwc1       $f14, 0x28($sp)
/* A8608 800A7A08 C7B00038 */  lwc1       $f16, 0x38($sp)
/* A860C 800A7A0C 8FBF0054 */  lw         $ra, 0x54($sp)
/* A8610 800A7A10 E60000C8 */  swc1       $f0, 0xc8($s0)
/* A8614 800A7A14 E60200D8 */  swc1       $f2, 0xd8($s0)
/* A8618 800A7A18 E60400E8 */  swc1       $f4, 0xe8($s0)
/* A861C 800A7A1C E60600CC */  swc1       $f6, 0xcc($s0)
/* A8620 800A7A20 E60800DC */  swc1       $f8, 0xdc($s0)
/* A8624 800A7A24 E60A00EC */  swc1       $f10, 0xec($s0)
/* A8628 800A7A28 E60C00D0 */  swc1       $f12, 0xd0($s0)
/* A862C 800A7A2C E60E00E0 */  swc1       $f14, 0xe0($s0)
/* A8630 800A7A30 E61000F0 */  swc1       $f16, 0xf0($s0)
/* A8634 800A7A34 8FB00050 */  lw         $s0, 0x50($sp)
/* A8638 800A7A38 03E00008 */  jr         $ra
/* A863C 800A7A3C 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800A7A40
/* A8640 800A7A40 27BDFF68 */  addiu      $sp, $sp, -0x98
/* A8644 800A7A44 AFB00090 */  sw         $s0, 0x90($sp)
/* A8648 800A7A48 00808021 */  addu       $s0, $a0, $zero
/* A864C 800A7A4C 44850000 */  mtc1       $a1, $f0
/* A8650 800A7A50 00C02821 */  addu       $a1, $a2, $zero
/* A8654 800A7A54 44060000 */  mfc1       $a2, $f0
/* A8658 800A7A58 AFBF0094 */  sw         $ra, 0x94($sp)
/* A865C 800A7A5C 0C032D64 */  jal        guRotateRPYF
/* A8660 800A7A60 27A40010 */   addiu     $a0, $sp, 0x10
/* A8664 800A7A64 27A30050 */  addiu      $v1, $sp, 0x50
/* A8668 800A7A68 260200C8 */  addiu      $v0, $s0, 0xc8
/* A866C 800A7A6C 26040108 */  addiu      $a0, $s0, 0x108
/* A8670 800A7A70 00603021 */  addu       $a2, $v1, $zero
.L800A7A74:
/* A8674 800A7A74 8C450000 */  lw         $a1, ($v0)
/* A8678 800A7A78 8C470004 */  lw         $a3, 4($v0)
/* A867C 800A7A7C 8C480008 */  lw         $t0, 8($v0)
/* A8680 800A7A80 8C49000C */  lw         $t1, 0xc($v0)
/* A8684 800A7A84 AC650000 */  sw         $a1, ($v1)
/* A8688 800A7A88 AC670004 */  sw         $a3, 4($v1)
/* A868C 800A7A8C AC680008 */  sw         $t0, 8($v1)
/* A8690 800A7A90 AC69000C */  sw         $t1, 0xc($v1)
/* A8694 800A7A94 24420010 */  addiu      $v0, $v0, 0x10
/* A8698 800A7A98 1444FFF6 */  bne        $v0, $a0, .L800A7A74
/* A869C 800A7A9C 24630010 */   addiu     $v1, $v1, 0x10
/* A86A0 800A7AA0 260400C8 */  addiu      $a0, $s0, 0xc8
/* A86A4 800A7AA4 0C02B127 */  jal        some_oher_matrix_math
/* A86A8 800A7AA8 27A50010 */   addiu     $a1, $sp, 0x10
/* A86AC 800A7AAC 8FBF0094 */  lw         $ra, 0x94($sp)
/* A86B0 800A7AB0 8FB00090 */  lw         $s0, 0x90($sp)
/* A86B4 800A7AB4 03E00008 */  jr         $ra
/* A86B8 800A7AB8 27BD0098 */   addiu     $sp, $sp, 0x98

glabel func_800A7ABC
/* A86BC 800A7ABC 248400C8 */  addiu      $a0, $a0, 0xc8
/* A86C0 800A7AC0 24A20040 */  addiu      $v0, $a1, 0x40
.L800A7AC4:
/* A86C4 800A7AC4 8CA30000 */  lw         $v1, ($a1)
/* A86C8 800A7AC8 8CA60004 */  lw         $a2, 4($a1)
/* A86CC 800A7ACC 8CA70008 */  lw         $a3, 8($a1)
/* A86D0 800A7AD0 8CA8000C */  lw         $t0, 0xc($a1)
/* A86D4 800A7AD4 AC830000 */  sw         $v1, ($a0)
/* A86D8 800A7AD8 AC860004 */  sw         $a2, 4($a0)
/* A86DC 800A7ADC AC870008 */  sw         $a3, 8($a0)
/* A86E0 800A7AE0 AC88000C */  sw         $t0, 0xc($a0)
/* A86E4 800A7AE4 24A50010 */  addiu      $a1, $a1, 0x10
/* A86E8 800A7AE8 14A2FFF6 */  bne        $a1, $v0, .L800A7AC4
/* A86EC 800A7AEC 24840010 */   addiu     $a0, $a0, 0x10
/* A86F0 800A7AF0 03E00008 */  jr         $ra
/* A86F4 800A7AF4 00000000 */   nop

glabel func_800A7AF8
/* A86F8 800A7AF8 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A86FC 800A7AFC 34420040 */  ori        $v0, $v0, 0x40
/* A8700 800A7B00 03E00008 */  jr         $ra
/* A8704 800A7B04 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7B08
/* A8708 800A7B08 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A870C 800A7B0C 2403FFBF */  addiu      $v1, $zero, -0x41
/* A8710 800A7B10 00431024 */  and        $v0, $v0, $v1
/* A8714 800A7B14 03E00008 */  jr         $ra
/* A8718 800A7B18 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7B1C
/* A871C 800A7B1C 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8720 800A7B20 34420080 */  ori        $v0, $v0, 0x80
/* A8724 800A7B24 03E00008 */  jr         $ra
/* A8728 800A7B28 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7B2C
/* A872C 800A7B2C 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8730 800A7B30 2403FF7F */  addiu      $v1, $zero, -0x81
/* A8734 800A7B34 00431024 */  and        $v0, $v0, $v1
/* A8738 800A7B38 03E00008 */  jr         $ra
/* A873C 800A7B3C AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7B40
/* A8740 800A7B40 8C840000 */  lw         $a0, ($a0)
/* A8744 800A7B44 8C820034 */  lw         $v0, 0x34($a0)
/* A8748 800A7B48 10400003 */  beqz       $v0, .L800A7B58
/* A874C 800A7B4C 00000000 */   nop
/* A8750 800A7B50 03E00008 */  jr         $ra
/* A8754 800A7B54 8C820028 */   lw        $v0, 0x28($a0)
.L800A7B58:
/* A8758 800A7B58 03E00008 */  jr         $ra
/* A875C 800A7B5C 00001021 */   addu      $v0, $zero, $zero

glabel animationData_math_func
/* A8760 800A7B60 27BDFEF8 */  addiu      $sp, $sp, -0x108
/* A8764 800A7B64 F7BE0100 */  sdc1       $f30, 0x100($sp)
/* A8768 800A7B68 4485F000 */  mtc1       $a1, $f30
/* A876C 800A7B6C C7A40118 */  lwc1       $f4, 0x118($sp)
/* A8770 800A7B70 F7BC00F8 */  sdc1       $f28, 0xf8($sp)
/* A8774 800A7B74 4486E000 */  mtc1       $a2, $f28
/* A8778 800A7B78 C7A2011C */  lwc1       $f2, 0x11c($sp)
/* A877C 800A7B7C AFB000D0 */  sw         $s0, 0xd0($sp)
/* A8780 800A7B80 00808021 */  addu       $s0, $a0, $zero
/* A8784 800A7B84 F7BA00F0 */  sdc1       $f26, 0xf0($sp)
/* A8788 800A7B88 4487D000 */  mtc1       $a3, $f26
/* A878C 800A7B8C C7A00120 */  lwc1       $f0, 0x120($sp)
/* A8790 800A7B90 27A40010 */  addiu      $a0, $sp, 0x10
/* A8794 800A7B94 F7B600E0 */  sdc1       $f22, 0xe0($sp)
/* A8798 800A7B98 C7B60124 */  lwc1       $f22, 0x124($sp)
/* A879C 800A7B9C 27A50014 */  addiu      $a1, $sp, 0x14
/* A87A0 800A7BA0 F7B800E8 */  sdc1       $f24, 0xe8($sp)
/* A87A4 800A7BA4 C7B80128 */  lwc1       $f24, 0x128($sp)
/* A87A8 800A7BA8 4604F101 */  sub.s      $f4, $f30, $f4
/* A87AC 800A7BAC F7B400D8 */  sdc1       $f20, 0xd8($sp)
/* A87B0 800A7BB0 C7B4012C */  lwc1       $f20, 0x12c($sp)
/* A87B4 800A7BB4 4602E081 */  sub.s      $f2, $f28, $f2
/* A87B8 800A7BB8 27A60018 */  addiu      $a2, $sp, 0x18
/* A87BC 800A7BBC AFBF00D4 */  sw         $ra, 0xd4($sp)
/* A87C0 800A7BC0 4600D001 */  sub.s      $f0, $f26, $f0
/* A87C4 800A7BC4 E7A40010 */  swc1       $f4, 0x10($sp)
/* A87C8 800A7BC8 E7A20014 */  swc1       $f2, 0x14($sp)
/* A87CC 800A7BCC 0C03122C */  jal        guNormalize
/* A87D0 800A7BD0 E7A00018 */   swc1      $f0, 0x18($sp)
/* A87D4 800A7BD4 C7A00018 */  lwc1       $f0, 0x18($sp)
/* A87D8 800A7BD8 4600C082 */  mul.s      $f2, $f24, $f0
/* A87DC 800A7BDC C7A60014 */  lwc1       $f6, 0x14($sp)
/* A87E0 800A7BE0 4606A202 */  mul.s      $f8, $f20, $f6
/* A87E4 800A7BE4 C7A40010 */  lwc1       $f4, 0x10($sp)
/* A87E8 800A7BE8 4604A502 */  mul.s      $f20, $f20, $f4
/* A87EC 800A7BEC 00000000 */  nop
/* A87F0 800A7BF0 4600B002 */  mul.s      $f0, $f22, $f0
/* A87F4 800A7BF4 00000000 */  nop
/* A87F8 800A7BF8 4606B582 */  mul.s      $f22, $f22, $f6
/* A87FC 800A7BFC 00000000 */  nop
/* A8800 800A7C00 4604C602 */  mul.s      $f24, $f24, $f4
/* A8804 800A7C04 46081081 */  sub.s      $f2, $f2, $f8
/* A8808 800A7C08 46021302 */  mul.s      $f12, $f2, $f2
/* A880C 800A7C0C 4600A501 */  sub.s      $f20, $f20, $f0
/* A8810 800A7C10 4614A102 */  mul.s      $f4, $f20, $f20
/* A8814 800A7C14 4618B581 */  sub.s      $f22, $f22, $f24
/* A8818 800A7C18 4616B002 */  mul.s      $f0, $f22, $f22
/* A881C 800A7C1C 46046300 */  add.s      $f12, $f12, $f4
/* A8820 800A7C20 E7A20050 */  swc1       $f2, 0x50($sp)
/* A8824 800A7C24 46006300 */  add.s      $f12, $f12, $f0
/* A8828 800A7C28 E7B40054 */  swc1       $f20, 0x54($sp)
/* A882C 800A7C2C 0C0334B4 */  jal        _sqrtf
/* A8830 800A7C30 E7B60058 */   swc1      $f22, 0x58($sp)
/* A8834 800A7C34 3C01800E */  lui        $at, %hi(D_800E3460)
/* A8838 800A7C38 D4223460 */  ldc1       $f2, %lo(D_800E3460)($at)
/* A883C 800A7C3C 46000121 */  cvt.d.s    $f4, $f0
/* A8840 800A7C40 4622203C */  c.lt.d     $f4, $f2
/* A8844 800A7C44 00000000 */  nop
/* A8848 800A7C48 45000009 */  bc1f       .L800A7C70
/* A884C 800A7C4C 3C02800F */   lui       $v0, %hi(D_800F3580)
/* A8850 800A7C50 24433580 */  addiu      $v1, $v0, %lo(D_800F3580)
/* A8854 800A7C54 8C443580 */  lw         $a0, 0x3580($v0)
/* A8858 800A7C58 8C650004 */  lw         $a1, 4($v1)
/* A885C 800A7C5C 8C620008 */  lw         $v0, 8($v1)
/* A8860 800A7C60 AFA40050 */  sw         $a0, 0x50($sp)
/* A8864 800A7C64 AFA50054 */  sw         $a1, 0x54($sp)
/* A8868 800A7C68 08029F30 */  j          .L800A7CC0
/* A886C 800A7C6C AFA20058 */   sw        $v0, 0x58($sp)
.L800A7C70:
/* A8870 800A7C70 3C01800E */  lui        $at, %hi(D_800E3468)
/* A8874 800A7C74 D4203468 */  ldc1       $f0, %lo(D_800E3468)($at)
/* A8878 800A7C78 C7A20054 */  lwc1       $f2, 0x54($sp)
/* A887C 800A7C7C 46240003 */  div.d      $f0, $f0, $f4
/* A8880 800A7C80 462001A0 */  cvt.s.d    $f6, $f0
/* A8884 800A7C84 46061082 */  mul.s      $f2, $f2, $f6
/* A8888 800A7C88 C7A40050 */  lwc1       $f4, 0x50($sp)
/* A888C 800A7C8C 46062102 */  mul.s      $f4, $f4, $f6
/* A8890 800A7C90 C7A00058 */  lwc1       $f0, 0x58($sp)
/* A8894 800A7C94 46060002 */  mul.s      $f0, $f0, $f6
/* A8898 800A7C98 E7A20054 */  swc1       $f2, 0x54($sp)
/* A889C 800A7C9C 8FA40054 */  lw         $a0, 0x54($sp)
/* A88A0 800A7CA0 E7A40050 */  swc1       $f4, 0x50($sp)
/* A88A4 800A7CA4 8FA30050 */  lw         $v1, 0x50($sp)
/* A88A8 800A7CA8 E7A00058 */  swc1       $f0, 0x58($sp)
/* A88AC 800A7CAC AC433580 */  sw         $v1, 0x3580($v0)
/* A88B0 800A7CB0 8FA30058 */  lw         $v1, 0x58($sp)
/* A88B4 800A7CB4 24423580 */  addiu      $v0, $v0, 0x3580
/* A88B8 800A7CB8 AC440004 */  sw         $a0, 4($v0)
/* A88BC 800A7CBC AC430008 */  sw         $v1, 8($v0)
.L800A7CC0:
/* A88C0 800A7CC0 27A40090 */  addiu      $a0, $sp, 0x90
/* A88C4 800A7CC4 27A50010 */  addiu      $a1, $sp, 0x10
/* A88C8 800A7CC8 0C02AB86 */  jal        some_vec3_math
/* A88CC 800A7CCC 27A60050 */   addiu     $a2, $sp, 0x50
/* A88D0 800A7CD0 C7A00050 */  lwc1       $f0, 0x50($sp)
/* A88D4 800A7CD4 C7A20054 */  lwc1       $f2, 0x54($sp)
/* A88D8 800A7CD8 C7A40058 */  lwc1       $f4, 0x58($sp)
/* A88DC 800A7CDC C7A60090 */  lwc1       $f6, 0x90($sp)
/* A88E0 800A7CE0 C7A80094 */  lwc1       $f8, 0x94($sp)
/* A88E4 800A7CE4 C7AA0098 */  lwc1       $f10, 0x98($sp)
/* A88E8 800A7CE8 C7AC0010 */  lwc1       $f12, 0x10($sp)
/* A88EC 800A7CEC C7AE0014 */  lwc1       $f14, 0x14($sp)
/* A88F0 800A7CF0 C7B00018 */  lwc1       $f16, 0x18($sp)
/* A88F4 800A7CF4 3C01800E */  lui        $at, %hi(D_800E3470)
/* A88F8 800A7CF8 C4323470 */  lwc1       $f18, %lo(D_800E3470)($at)
/* A88FC 800A7CFC 8FBF00D4 */  lw         $ra, 0xd4($sp)
/* A8900 800A7D00 E61E00F8 */  swc1       $f30, 0xf8($s0)
/* A8904 800A7D04 D7BE0100 */  ldc1       $f30, 0x100($sp)
/* A8908 800A7D08 E61C00FC */  swc1       $f28, 0xfc($s0)
/* A890C 800A7D0C D7BC00F8 */  ldc1       $f28, 0xf8($sp)
/* A8910 800A7D10 E61A0100 */  swc1       $f26, 0x100($s0)
/* A8914 800A7D14 D7BA00F0 */  ldc1       $f26, 0xf0($sp)
/* A8918 800A7D18 D7B800E8 */  ldc1       $f24, 0xe8($sp)
/* A891C 800A7D1C D7B600E0 */  ldc1       $f22, 0xe0($sp)
/* A8920 800A7D20 D7B400D8 */  ldc1       $f20, 0xd8($sp)
/* A8924 800A7D24 AE0000D4 */  sw         $zero, 0xd4($s0)
/* A8928 800A7D28 AE0000E4 */  sw         $zero, 0xe4($s0)
/* A892C 800A7D2C AE0000F4 */  sw         $zero, 0xf4($s0)
/* A8930 800A7D30 E60000C8 */  swc1       $f0, 0xc8($s0)
/* A8934 800A7D34 E60200CC */  swc1       $f2, 0xcc($s0)
/* A8938 800A7D38 E60400D0 */  swc1       $f4, 0xd0($s0)
/* A893C 800A7D3C E60600D8 */  swc1       $f6, 0xd8($s0)
/* A8940 800A7D40 E60800DC */  swc1       $f8, 0xdc($s0)
/* A8944 800A7D44 E60A00E0 */  swc1       $f10, 0xe0($s0)
/* A8948 800A7D48 E60C00E8 */  swc1       $f12, 0xe8($s0)
/* A894C 800A7D4C E60E00EC */  swc1       $f14, 0xec($s0)
/* A8950 800A7D50 E61000F0 */  swc1       $f16, 0xf0($s0)
/* A8954 800A7D54 E6120104 */  swc1       $f18, 0x104($s0)
/* A8958 800A7D58 8FB000D0 */  lw         $s0, 0xd0($sp)
/* A895C 800A7D5C 03E00008 */  jr         $ra
/* A8960 800A7D60 27BD0108 */   addiu     $sp, $sp, 0x108

glabel SceneSetCameraLookAt
/* A8964 800A7D64 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A8968 800A7D68 C7A00040 */  lwc1       $f0, 0x40($sp)
/* A896C 800A7D6C C7A20044 */  lwc1       $f2, 0x44($sp)
/* A8970 800A7D70 C7A40048 */  lwc1       $f4, 0x48($sp)
/* A8974 800A7D74 3C01800E */  lui        $at, %hi(D_800E3474)
/* A8978 800A7D78 C4263474 */  lwc1       $f6, %lo(D_800E3474)($at)
/* A897C 800A7D7C AFBF0028 */  sw         $ra, 0x28($sp)
/* A8980 800A7D80 AFA0001C */  sw         $zero, 0x1c($sp)
/* A8984 800A7D84 AFA00024 */  sw         $zero, 0x24($sp)
/* A8988 800A7D88 E7A00010 */  swc1       $f0, 0x10($sp)
/* A898C 800A7D8C E7A20014 */  swc1       $f2, 0x14($sp)
/* A8990 800A7D90 E7A40018 */  swc1       $f4, 0x18($sp)
/* A8994 800A7D94 0C029ED8 */  jal        animationData_math_func
/* A8998 800A7D98 E7A60020 */   swc1      $f6, 0x20($sp)
/* A899C 800A7D9C 8FBF0028 */  lw         $ra, 0x28($sp)
/* A89A0 800A7DA0 03E00008 */  jr         $ra
/* A89A4 800A7DA4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800A7DA8
/* A89A8 800A7DA8 8C820000 */  lw         $v0, ($a0)
/* A89AC 800A7DAC 8C420034 */  lw         $v0, 0x34($v0)
/* A89B0 800A7DB0 44850000 */  mtc1       $a1, $f0
/* A89B4 800A7DB4 54400001 */  bnel       $v0, $zero, .L800A7DBC
/* A89B8 800A7DB8 E4400014 */   swc1      $f0, 0x14($v0)
.L800A7DBC:
/* A89BC 800A7DBC 03E00008 */  jr         $ra
/* A89C0 800A7DC0 00000000 */   nop

glabel func_800A7DC4
/* A89C4 800A7DC4 8C820000 */  lw         $v0, ($a0)
/* A89C8 800A7DC8 8C420034 */  lw         $v0, 0x34($v0)
/* A89CC 800A7DCC 3C01800E */  lui        $at, %hi(D_800E3478)
/* A89D0 800A7DD0 C4203478 */  lwc1       $f0, %lo(D_800E3478)($at)
/* A89D4 800A7DD4 54400001 */  bnel       $v0, $zero, .L800A7DDC
/* A89D8 800A7DD8 C4400014 */   lwc1      $f0, 0x14($v0)
.L800A7DDC:
/* A89DC 800A7DDC 03E00008 */  jr         $ra
/* A89E0 800A7DE0 00000000 */   nop

glabel setA_with_2floats
/* A89E4 800A7DE4 8C820000 */  lw         $v0, ($a0)
/* A89E8 800A7DE8 44851000 */  mtc1       $a1, $f2
/* A89EC 800A7DEC 8C420034 */  lw         $v0, 0x34($v0)
/* A89F0 800A7DF0 44860000 */  mtc1       $a2, $f0
/* A89F4 800A7DF4 10400003 */  beqz       $v0, .L800A7E04
/* A89F8 800A7DF8 00000000 */   nop
/* A89FC 800A7DFC E4420018 */  swc1       $f2, 0x18($v0)
/* A8A00 800A7E00 E440001C */  swc1       $f0, 0x1c($v0)
.L800A7E04:
/* A8A04 800A7E04 03E00008 */  jr         $ra
/* A8A08 800A7E08 00000000 */   nop

glabel func_800A7E0C
/* A8A0C 800A7E0C 8C820000 */  lw         $v0, ($a0)
/* A8A10 800A7E10 8C420034 */  lw         $v0, 0x34($v0)
/* A8A14 800A7E14 3C01800E */  lui        $at, %hi(D_800E347C)
/* A8A18 800A7E18 C420347C */  lwc1       $f0, %lo(D_800E347C)($at)
/* A8A1C 800A7E1C 54400001 */  bnel       $v0, $zero, .L800A7E24
/* A8A20 800A7E20 C440001C */   lwc1      $f0, 0x1c($v0)
.L800A7E24:
/* A8A24 800A7E24 03E00008 */  jr         $ra
/* A8A28 800A7E28 00000000 */   nop

glabel func_800A7E2C
/* A8A2C 800A7E2C 8C820000 */  lw         $v0, ($a0)
/* A8A30 800A7E30 8C420034 */  lw         $v0, 0x34($v0)
/* A8A34 800A7E34 3C01800E */  lui        $at, %hi(D_800E3480)
/* A8A38 800A7E38 C4203480 */  lwc1       $f0, %lo(D_800E3480)($at)
/* A8A3C 800A7E3C 54400001 */  bnel       $v0, $zero, .L800A7E44
/* A8A40 800A7E40 C4400018 */   lwc1      $f0, 0x18($v0)
.L800A7E44:
/* A8A44 800A7E44 03E00008 */  jr         $ra
/* A8A48 800A7E48 00000000 */   nop

glabel func_800A7E4C
/* A8A4C 800A7E4C 8C820000 */  lw         $v0, ($a0)
/* A8A50 800A7E50 8C420034 */  lw         $v0, 0x34($v0)
/* A8A54 800A7E54 44850000 */  mtc1       $a1, $f0
/* A8A58 800A7E58 54400001 */  bnel       $v0, $zero, .L800A7E60
/* A8A5C 800A7E5C E4400010 */   swc1      $f0, 0x10($v0)
.L800A7E60:
/* A8A60 800A7E60 03E00008 */  jr         $ra
/* A8A64 800A7E64 00000000 */   nop

glabel func_800A7E68
/* A8A68 800A7E68 8C820000 */  lw         $v0, ($a0)
/* A8A6C 800A7E6C 8C420034 */  lw         $v0, 0x34($v0)
/* A8A70 800A7E70 44800000 */  mtc1       $zero, $f0
/* A8A74 800A7E74 54400001 */  bnel       $v0, $zero, .L800A7E7C
/* A8A78 800A7E78 C4400010 */   lwc1      $f0, 0x10($v0)
.L800A7E7C:
/* A8A7C 800A7E7C 03E00008 */  jr         $ra
/* A8A80 800A7E80 00000000 */   nop

glabel func_800A7E84
/* A8A84 800A7E84 8C820000 */  lw         $v0, ($a0)
/* A8A88 800A7E88 8C420034 */  lw         $v0, 0x34($v0)
/* A8A8C 800A7E8C 44850000 */  mtc1       $a1, $f0
/* A8A90 800A7E90 54400001 */  bnel       $v0, $zero, .L800A7E98
/* A8A94 800A7E94 E4400024 */   swc1      $f0, 0x24($v0)
.L800A7E98:
/* A8A98 800A7E98 03E00008 */  jr         $ra
/* A8A9C 800A7E9C 00000000 */   nop

glabel func_800A7EA0
/* A8AA0 800A7EA0 8C820000 */  lw         $v0, ($a0)
/* A8AA4 800A7EA4 8C420034 */  lw         $v0, 0x34($v0)
/* A8AA8 800A7EA8 3C01800E */  lui        $at, %hi(D_800E3484)
/* A8AAC 800A7EAC C4203484 */  lwc1       $f0, %lo(D_800E3484)($at)
/* A8AB0 800A7EB0 54400001 */  bnel       $v0, $zero, .L800A7EB8
/* A8AB4 800A7EB4 C4400024 */   lwc1      $f0, 0x24($v0)
.L800A7EB8:
/* A8AB8 800A7EB8 03E00008 */  jr         $ra
/* A8ABC 800A7EBC 00000000 */   nop

glabel func_800A7EC0
/* A8AC0 800A7EC0 44854000 */  mtc1       $a1, $f8
/* A8AC4 800A7EC4 44865000 */  mtc1       $a2, $f10
/* A8AC8 800A7EC8 8C820000 */  lw         $v0, ($a0)
/* A8ACC 800A7ECC 44872000 */  mtc1       $a3, $f4
/* A8AD0 800A7ED0 8C420034 */  lw         $v0, 0x34($v0)
/* A8AD4 800A7ED4 1040001A */  beqz       $v0, .L800A7F40
/* A8AD8 800A7ED8 C7A60010 */   lwc1      $f6, 0x10($sp)
/* A8ADC 800A7EDC 46044000 */  add.s      $f0, $f8, $f4
/* A8AE0 800A7EE0 46065080 */  add.s      $f2, $f10, $f6
/* A8AE4 800A7EE4 46082101 */  sub.s      $f4, $f4, $f8
/* A8AE8 800A7EE8 46000021 */  cvt.d.s    $f0, $f0
/* A8AEC 800A7EEC 46200000 */  add.d      $f0, $f0, $f0
/* A8AF0 800A7EF0 460010A1 */  cvt.d.s    $f2, $f2
/* A8AF4 800A7EF4 46221080 */  add.d      $f2, $f2, $f2
/* A8AF8 800A7EF8 8C440028 */  lw         $a0, 0x28($v0)
/* A8AFC 800A7EFC 46002121 */  cvt.d.s    $f4, $f4
/* A8B00 800A7F00 46242100 */  add.d      $f4, $f4, $f4
/* A8B04 800A7F04 4620020D */  trunc.w.d  $f8, $f0
/* A8B08 800A7F08 44024000 */  mfc1       $v0, $f8
/* A8B0C 800A7F0C A4820008 */  sh         $v0, 8($a0)
/* A8B10 800A7F10 460A3001 */  sub.s      $f0, $f6, $f10
/* A8B14 800A7F14 4620118D */  trunc.w.d  $f6, $f2
/* A8B18 800A7F18 44023000 */  mfc1       $v0, $f6
/* A8B1C 800A7F1C A482000A */  sh         $v0, 0xa($a0)
/* A8B20 800A7F20 46000021 */  cvt.d.s    $f0, $f0
/* A8B24 800A7F24 46200000 */  add.d      $f0, $f0, $f0
/* A8B28 800A7F28 4620208D */  trunc.w.d  $f2, $f4
/* A8B2C 800A7F2C 44021000 */  mfc1       $v0, $f2
/* A8B30 800A7F30 A4820000 */  sh         $v0, ($a0)
/* A8B34 800A7F34 4620008D */  trunc.w.d  $f2, $f0
/* A8B38 800A7F38 44031000 */  mfc1       $v1, $f2
/* A8B3C 800A7F3C A4830002 */  sh         $v1, 2($a0)
.L800A7F40:
/* A8B40 800A7F40 03E00008 */  jr         $ra
/* A8B44 800A7F44 00000000 */   nop

glabel func_800A7F48
/* A8B48 800A7F48 8C820000 */  lw         $v0, ($a0)
/* A8B4C 800A7F4C 8C420034 */  lw         $v0, 0x34($v0)
/* A8B50 800A7F50 44850000 */  mtc1       $a1, $f0
/* A8B54 800A7F54 54400001 */  bnel       $v0, $zero, .L800A7F5C
/* A8B58 800A7F58 E4400020 */   swc1      $f0, 0x20($v0)
.L800A7F5C:
/* A8B5C 800A7F5C 03E00008 */  jr         $ra
/* A8B60 800A7F60 00000000 */   nop

glabel func_800A7F64
/* A8B64 800A7F64 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8B68 800A7F68 34420004 */  ori        $v0, $v0, 4
/* A8B6C 800A7F6C 03E00008 */  jr         $ra
/* A8B70 800A7F70 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7F74
/* A8B74 800A7F74 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8B78 800A7F78 2403FFFB */  addiu      $v1, $zero, -5
/* A8B7C 800A7F7C 00431024 */  and        $v0, $v0, $v1
/* A8B80 800A7F80 03E00008 */  jr         $ra
/* A8B84 800A7F84 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7F88
/* A8B88 800A7F88 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8B8C 800A7F8C 34420008 */  ori        $v0, $v0, 8
/* A8B90 800A7F90 03E00008 */  jr         $ra
/* A8B94 800A7F94 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7F98
/* A8B98 800A7F98 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8B9C 800A7F9C 2403FFF7 */  addiu      $v1, $zero, -9
/* A8BA0 800A7FA0 00431024 */  and        $v0, $v0, $v1
/* A8BA4 800A7FA4 03E00008 */  jr         $ra
/* A8BA8 800A7FA8 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7FAC
/* A8BAC 800A7FAC 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8BB0 800A7FB0 34420010 */  ori        $v0, $v0, 0x10
/* A8BB4 800A7FB4 03E00008 */  jr         $ra
/* A8BB8 800A7FB8 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7FBC
/* A8BBC 800A7FBC 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8BC0 800A7FC0 2403FFEF */  addiu      $v1, $zero, -0x11
/* A8BC4 800A7FC4 00431024 */  and        $v0, $v0, $v1
/* A8BC8 800A7FC8 03E00008 */  jr         $ra
/* A8BCC 800A7FCC AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7FD0
/* A8BD0 800A7FD0 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8BD4 800A7FD4 34420020 */  ori        $v0, $v0, 0x20
/* A8BD8 800A7FD8 03E00008 */  jr         $ra
/* A8BDC 800A7FDC AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7FE0
/* A8BE0 800A7FE0 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8BE4 800A7FE4 2403FFDF */  addiu      $v1, $zero, -0x21
/* A8BE8 800A7FE8 00431024 */  and        $v0, $v0, $v1
/* A8BEC 800A7FEC 03E00008 */  jr         $ra
/* A8BF0 800A7FF0 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A7FF4
/* A8BF4 800A7FF4 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8BF8 800A7FF8 34420040 */  ori        $v0, $v0, 0x40
/* A8BFC 800A7FFC 03E00008 */  jr         $ra
/* A8C00 800A8000 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A8004
/* A8C04 800A8004 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8C08 800A8008 2403FFBF */  addiu      $v1, $zero, -0x41
/* A8C0C 800A800C 00431024 */  and        $v0, $v0, $v1
/* A8C10 800A8010 03E00008 */  jr         $ra
/* A8C14 800A8014 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A8018
/* A8C18 800A8018 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8C1C 800A801C 34420080 */  ori        $v0, $v0, 0x80
/* A8C20 800A8020 03E00008 */  jr         $ra
/* A8C24 800A8024 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A8028
/* A8C28 800A8028 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8C2C 800A802C 2403FF7F */  addiu      $v1, $zero, -0x81
/* A8C30 800A8030 00431024 */  and        $v0, $v0, $v1
/* A8C34 800A8034 03E00008 */  jr         $ra
/* A8C38 800A8038 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A803C
/* A8C3C 800A803C 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8C40 800A8040 34420200 */  ori        $v0, $v0, 0x200
/* A8C44 800A8044 03E00008 */  jr         $ra
/* A8C48 800A8048 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A804C
/* A8C4C 800A804C 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8C50 800A8050 2403FDFF */  addiu      $v1, $zero, -0x201
/* A8C54 800A8054 00431024 */  and        $v0, $v0, $v1
/* A8C58 800A8058 03E00008 */  jr         $ra
/* A8C5C 800A805C AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A8060
/* A8C60 800A8060 30A50001 */  andi       $a1, $a1, 1
/* A8C64 800A8064 03E00008 */  jr         $ra
/* A8C68 800A8068 A08501FB */   sb        $a1, 0x1fb($a0)

glabel func_800A806C
/* A8C6C 800A806C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A8C70 800A8070 24020001 */  addiu      $v0, $zero, 1
/* A8C74 800A8074 AFBF0010 */  sw         $ra, 0x10($sp)
/* A8C78 800A8078 A48201F8 */  sh         $v0, 0x1f8($a0)
/* A8C7C 800A807C 0C028282 */  jal        func_800A0A08
/* A8C80 800A8080 A08001FA */   sb        $zero, 0x1fa($a0)
/* A8C84 800A8084 8FBF0010 */  lw         $ra, 0x10($sp)
/* A8C88 800A8088 03E00008 */  jr         $ra
/* A8C8C 800A808C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_animation_speed
/* A8C90 800A8090 03E00008 */  jr         $ra
/* A8C94 800A8094 A08501FA */   sb        $a1, 0x1fa($a0)

glabel func_800A8098
/* A8C98 800A8098 8C830000 */  lw         $v1, ($a0)
/* A8C9C 800A809C 8C620028 */  lw         $v0, 0x28($v1)
/* A8CA0 800A80A0 00052980 */  sll        $a1, $a1, 6
/* A8CA4 800A80A4 03E00008 */  jr         $ra
/* A8CA8 800A80A8 00451021 */   addu      $v0, $v0, $a1

glabel func_800A80AC
/* A8CAC 800A80AC 8C820000 */  lw         $v0, ($a0)
/* A8CB0 800A80B0 8C430028 */  lw         $v1, 0x28($v0)
/* A8CB4 800A80B4 00063180 */  sll        $a2, $a2, 6
/* A8CB8 800A80B8 00661821 */  addu       $v1, $v1, $a2
/* A8CBC 800A80BC C462001C */  lwc1       $f2, 0x1c($v1)
/* A8CC0 800A80C0 E4A20000 */  swc1       $f2, ($a1)
/* A8CC4 800A80C4 C4600020 */  lwc1       $f0, 0x20($v1)
/* A8CC8 800A80C8 E4A00004 */  swc1       $f0, 4($a1)
/* A8CCC 800A80CC C4620024 */  lwc1       $f2, 0x24($v1)
/* A8CD0 800A80D0 03E00008 */  jr         $ra
/* A8CD4 800A80D4 E4A20008 */   swc1      $f2, 8($a1)

glabel func_800A80D8
/* A8CD8 800A80D8 8C830000 */  lw         $v1, ($a0)
/* A8CDC 800A80DC 00063180 */  sll        $a2, $a2, 6
/* A8CE0 800A80E0 8C620028 */  lw         $v0, 0x28($v1)
/* A8CE4 800A80E4 C4A20000 */  lwc1       $f2, ($a1)
/* A8CE8 800A80E8 00461021 */  addu       $v0, $v0, $a2
/* A8CEC 800A80EC E442001C */  swc1       $f2, 0x1c($v0)
/* A8CF0 800A80F0 C4A00004 */  lwc1       $f0, 4($a1)
/* A8CF4 800A80F4 E4400020 */  swc1       $f0, 0x20($v0)
/* A8CF8 800A80F8 C4A20008 */  lwc1       $f2, 8($a1)
/* A8CFC 800A80FC 03E00008 */  jr         $ra
/* A8D00 800A8100 E4420024 */   swc1      $f2, 0x24($v0)

glabel func_800A8104
/* A8D04 800A8104 44860000 */  mtc1       $a2, $f0
/* A8D08 800A8108 04A0000B */  bltz       $a1, .L800A8138
/* A8D0C 800A810C 00000000 */   nop
/* A8D10 800A8110 8C840000 */  lw         $a0, ($a0)
/* A8D14 800A8114 8C820018 */  lw         $v0, 0x18($a0)
/* A8D18 800A8118 00A2102A */  slt        $v0, $a1, $v0
/* A8D1C 800A811C 10400006 */  beqz       $v0, .L800A8138
/* A8D20 800A8120 00051080 */   sll       $v0, $a1, 2
/* A8D24 800A8124 8C84003C */  lw         $a0, 0x3c($a0)
/* A8D28 800A8128 00441021 */  addu       $v0, $v0, $a0
/* A8D2C 800A812C 8C430000 */  lw         $v1, ($v0)
/* A8D30 800A8130 8C640058 */  lw         $a0, 0x58($v1)
/* A8D34 800A8134 E4800000 */  swc1       $f0, ($a0)
.L800A8138:
/* A8D38 800A8138 03E00008 */  jr         $ra
/* A8D3C 800A813C 00000000 */   nop

glabel func_800A8140
/* A8D40 800A8140 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8D44 800A8144 34420100 */  ori        $v0, $v0, 0x100
/* A8D48 800A8148 03E00008 */  jr         $ra
/* A8D4C 800A814C AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A8150
/* A8D50 800A8150 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8D54 800A8154 2403FEFF */  addiu      $v1, $zero, -0x101
/* A8D58 800A8158 00431024 */  and        $v0, $v0, $v1
/* A8D5C 800A815C 03E00008 */  jr         $ra
/* A8D60 800A8160 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel set_Anidat_colorByte
/* A8D64 800A8164 04A10002 */  bgez       $a1, .L800A8170
/* A8D68 800A8168 8FA30010 */   lw        $v1, 0x10($sp)
/* A8D6C 800A816C 00002821 */  addu       $a1, $zero, $zero
.L800A8170:
/* A8D70 800A8170 28A20100 */  slti       $v0, $a1, 0x100
/* A8D74 800A8174 50400001 */  beql       $v0, $zero, .L800A817C
/* A8D78 800A8178 240500FF */   addiu     $a1, $zero, 0xff
.L800A817C:
/* A8D7C 800A817C 04C20001 */  bltzl      $a2, .L800A8184
/* A8D80 800A8180 00003021 */   addu      $a2, $zero, $zero
.L800A8184:
/* A8D84 800A8184 28C20100 */  slti       $v0, $a2, 0x100
/* A8D88 800A8188 50400001 */  beql       $v0, $zero, .L800A8190
/* A8D8C 800A818C 240600FF */   addiu     $a2, $zero, 0xff
.L800A8190:
/* A8D90 800A8190 04E20001 */  bltzl      $a3, .L800A8198
/* A8D94 800A8194 00003821 */   addu      $a3, $zero, $zero
.L800A8198:
/* A8D98 800A8198 28E20100 */  slti       $v0, $a3, 0x100
/* A8D9C 800A819C 50400001 */  beql       $v0, $zero, .L800A81A4
/* A8DA0 800A81A0 240700FF */   addiu     $a3, $zero, 0xff
.L800A81A4:
/* A8DA4 800A81A4 04620001 */  bltzl      $v1, .L800A81AC
/* A8DA8 800A81A8 00001821 */   addu      $v1, $zero, $zero
.L800A81AC:
/* A8DAC 800A81AC 28620100 */  slti       $v0, $v1, 0x100
/* A8DB0 800A81B0 50400001 */  beql       $v0, $zero, .L800A81B8
/* A8DB4 800A81B4 240300FF */   addiu     $v1, $zero, 0xff
.L800A81B8:
/* A8DB8 800A81B8 A0850214 */  sb         $a1, 0x214($a0)
/* A8DBC 800A81BC A0860215 */  sb         $a2, 0x215($a0)
/* A8DC0 800A81C0 A0870216 */  sb         $a3, 0x216($a0)
/* A8DC4 800A81C4 03E00008 */  jr         $ra
/* A8DC8 800A81C8 A0830217 */   sb        $v1, 0x217($a0)

glabel func_800A81CC
/* A8DCC 800A81CC 04A20001 */  bltzl      $a1, .L800A81D4
/* A8DD0 800A81D0 00002821 */   addu      $a1, $zero, $zero
.L800A81D4:
/* A8DD4 800A81D4 28A203E9 */  slti       $v0, $a1, 0x3e9
/* A8DD8 800A81D8 50400001 */  beql       $v0, $zero, .L800A81E0
/* A8DDC 800A81DC 240503E8 */   addiu     $a1, $zero, 0x3e8
.L800A81E0:
/* A8DE0 800A81E0 04C20001 */  bltzl      $a2, .L800A81E8
/* A8DE4 800A81E4 00003021 */   addu      $a2, $zero, $zero
.L800A81E8:
/* A8DE8 800A81E8 28C203E9 */  slti       $v0, $a2, 0x3e9
/* A8DEC 800A81EC 50400001 */  beql       $v0, $zero, .L800A81F4
/* A8DF0 800A81F0 240603E8 */   addiu     $a2, $zero, 0x3e8
.L800A81F4:
/* A8DF4 800A81F4 54A60007 */  bnel       $a1, $a2, .L800A8214
/* A8DF8 800A81F8 AC85020C */   sw        $a1, 0x20c($a0)
/* A8DFC 800A81FC 24C5FFFF */  addiu      $a1, $a2, -1
/* A8E00 800A8200 04A30004 */  bgezl      $a1, .L800A8214
/* A8E04 800A8204 AC85020C */   sw        $a1, 0x20c($a0)
/* A8E08 800A8208 00C02821 */  addu       $a1, $a2, $zero
/* A8E0C 800A820C 24C60001 */  addiu      $a2, $a2, 1
/* A8E10 800A8210 AC85020C */  sw         $a1, 0x20c($a0)
.L800A8214:
/* A8E14 800A8214 03E00008 */  jr         $ra
/* A8E18 800A8218 AC860210 */   sw        $a2, 0x210($a0)

glabel func_800A821C
/* A8E1C 800A821C 8C820000 */  lw         $v0, ($a0)
/* A8E20 800A8220 00052880 */  sll        $a1, $a1, 2
/* A8E24 800A8224 8C43003C */  lw         $v1, 0x3c($v0)
/* A8E28 800A8228 C4E20000 */  lwc1       $f2, ($a3)
/* A8E2C 800A822C 00A32821 */  addu       $a1, $a1, $v1
/* A8E30 800A8230 8CA30000 */  lw         $v1, ($a1)
/* A8E34 800A8234 00061080 */  sll        $v0, $a2, 2
/* A8E38 800A8238 8C640058 */  lw         $a0, 0x58($v1)
/* A8E3C 800A823C 00461021 */  addu       $v0, $v0, $a2
/* A8E40 800A8240 8C830040 */  lw         $v1, 0x40($a0)
/* A8E44 800A8244 00021080 */  sll        $v0, $v0, 2
/* A8E48 800A8248 00621821 */  addu       $v1, $v1, $v0
/* A8E4C 800A824C E4620004 */  swc1       $f2, 4($v1)
/* A8E50 800A8250 C4E00004 */  lwc1       $f0, 4($a3)
/* A8E54 800A8254 E4600008 */  swc1       $f0, 8($v1)
/* A8E58 800A8258 C4E20008 */  lwc1       $f2, 8($a3)
/* A8E5C 800A825C E462000C */  swc1       $f2, 0xc($v1)
/* A8E60 800A8260 C4E4000C */  lwc1       $f4, 0xc($a3)
/* A8E64 800A8264 44800000 */  mtc1       $zero, $f0
/* A8E68 800A8268 44800800 */  mtc1       $zero, $f1
/* A8E6C 800A826C 46002121 */  cvt.d.s    $f4, $f4
/* A8E70 800A8270 46202032 */  c.eq.d     $f4, $f0
/* A8E74 800A8274 00000000 */  nop
/* A8E78 800A8278 45000005 */  bc1f       .L800A8290
/* A8E7C 800A827C 00000000 */   nop
/* A8E80 800A8280 3C01800E */  lui        $at, %hi(D_800E3488)
/* A8E84 800A8284 C4203488 */  lwc1       $f0, %lo(D_800E3488)($at)
/* A8E88 800A8288 03E00008 */  jr         $ra
/* A8E8C 800A828C E4600010 */   swc1      $f0, 0x10($v1)
.L800A8290:
/* A8E90 800A8290 3C01800E */  lui        $at, %hi(D_800E3490)
/* A8E94 800A8294 D4203490 */  ldc1       $f0, %lo(D_800E3490)($at)
/* A8E98 800A8298 46240001 */  sub.d      $f0, $f0, $f4
/* A8E9C 800A829C 46200020 */  cvt.s.d    $f0, $f0
/* A8EA0 800A82A0 03E00008 */  jr         $ra
/* A8EA4 800A82A4 E4600010 */   swc1      $f0, 0x10($v1)

glabel func_800A82A8
/* A8EA8 800A82A8 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8EAC 800A82AC 34424000 */  ori        $v0, $v0, 0x4000
/* A8EB0 800A82B0 03E00008 */  jr         $ra
/* A8EB4 800A82B4 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel func_800A82B8
/* A8EB8 800A82B8 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8EBC 800A82BC 2403BFFF */  addiu      $v1, $zero, -0x4001
/* A8EC0 800A82C0 00431024 */  and        $v0, $v0, $v1
/* A8EC4 800A82C4 03E00008 */  jr         $ra
/* A8EC8 800A82C8 AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel set_anidat_color
/* A8ECC 800A82CC 30A500FF */  andi       $a1, $a1, 0xff
/* A8ED0 800A82D0 44850000 */  mtc1       $a1, $f0
/* A8ED4 800A82D4 46800020 */  cvt.s.w    $f0, $f0
/* A8ED8 800A82D8 30C600FF */  andi       $a2, $a2, 0xff
/* A8EDC 800A82DC 30E700FF */  andi       $a3, $a3, 0xff
/* A8EE0 800A82E0 3C01800E */  lui        $at, %hi(D_800E3498)
/* A8EE4 800A82E4 C4243498 */  lwc1       $f4, %lo(D_800E3498)($at)
/* A8EE8 800A82E8 44871000 */  mtc1       $a3, $f2
/* A8EEC 800A82EC 468010A0 */  cvt.s.w    $f2, $f2
/* A8EF0 800A82F0 46040003 */  div.s      $f0, $f0, $f4
/* A8EF4 800A82F4 E48001FC */  swc1       $f0, 0x1fc($a0)
/* A8EF8 800A82F8 44860000 */  mtc1       $a2, $f0
/* A8EFC 800A82FC 46800020 */  cvt.s.w    $f0, $f0
/* A8F00 800A8300 46040003 */  div.s      $f0, $f0, $f4
/* A8F04 800A8304 E4800200 */  swc1       $f0, 0x200($a0)
/* A8F08 800A8308 93A20013 */  lbu        $v0, 0x13($sp)
/* A8F0C 800A830C 46041083 */  div.s      $f2, $f2, $f4
/* A8F10 800A8310 E4820204 */  swc1       $f2, 0x204($a0)
/* A8F14 800A8314 44820000 */  mtc1       $v0, $f0
/* A8F18 800A8318 46800020 */  cvt.s.w    $f0, $f0
/* A8F1C 800A831C 46040003 */  div.s      $f0, $f0, $f4
/* A8F20 800A8320 03E00008 */  jr         $ra
/* A8F24 800A8324 E4800208 */   swc1      $f0, 0x208($a0)

glabel anidat_set_light_data
/* A8F28 800A8328 24020007 */  addiu      $v0, $zero, 7
/* A8F2C 800A832C AC820298 */  sw         $v0, 0x298($a0)
/* A8F30 800A8330 240200FF */  addiu      $v0, $zero, 0xff
/* A8F34 800A8334 A0820288 */  sb         $v0, 0x288($a0)
/* A8F38 800A8338 A0820289 */  sb         $v0, 0x289($a0)
/* A8F3C 800A833C A082028A */  sb         $v0, 0x28a($a0)
/* A8F40 800A8340 A082028C */  sb         $v0, 0x28c($a0)
/* A8F44 800A8344 A082028D */  sb         $v0, 0x28d($a0)
/* A8F48 800A8348 A082028E */  sb         $v0, 0x28e($a0)
/* A8F4C 800A834C 8C8201F4 */  lw         $v0, 0x1f4($a0)
/* A8F50 800A8350 2403FF7F */  addiu      $v1, $zero, -0x81
/* A8F54 800A8354 AC80029C */  sw         $zero, 0x29c($a0)
/* A8F58 800A8358 A080028B */  sb         $zero, 0x28b($a0)
/* A8F5C 800A835C A080028F */  sb         $zero, 0x28f($a0)
/* A8F60 800A8360 A0800290 */  sb         $zero, 0x290($a0)
/* A8F64 800A8364 A0800291 */  sb         $zero, 0x291($a0)
/* A8F68 800A8368 A0800292 */  sb         $zero, 0x292($a0)
/* A8F6C 800A836C A0800293 */  sb         $zero, 0x293($a0)
/* A8F70 800A8370 00431024 */  and        $v0, $v0, $v1
/* A8F74 800A8374 34428000 */  ori        $v0, $v0, 0x8000
/* A8F78 800A8378 03E00008 */  jr         $ra
/* A8F7C 800A837C AC8201F4 */   sw        $v0, 0x1f4($a0)

glabel SceneSetMaxDynamicDirLights
/* A8F80 800A8380 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A8F84 800A8384 30A500FF */  andi       $a1, $a1, 0xff
/* A8F88 800A8388 2CA20008 */  sltiu      $v0, $a1, 8
/* A8F8C 800A838C 10400003 */  beqz       $v0, .L800A839C
/* A8F90 800A8390 AFBF0010 */   sw        $ra, 0x10($sp)
/* A8F94 800A8394 0802A0EC */  j          .L800A83B0
/* A8F98 800A8398 AC850298 */   sw        $a1, 0x298($a0)
.L800A839C:
/* A8F9C 800A839C 3C04800E */  lui        $a0, %hi(D_800E349C)
/* A8FA0 800A83A0 3C05800E */  lui        $a1, %hi(D_800E34C8)
/* A8FA4 800A83A4 2484349C */  addiu      $a0, $a0, %lo(D_800E349C)
/* A8FA8 800A83A8 0C025F2D */  jal        manualCrash
/* A8FAC 800A83AC 24A534C8 */   addiu     $a1, $a1, %lo(D_800E34C8)
.L800A83B0:
/* A8FB0 800A83B0 8FBF0010 */  lw         $ra, 0x10($sp)
/* A8FB4 800A83B4 03E00008 */  jr         $ra
/* A8FB8 800A83B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ASquared_BSquared_CSquared
/* A8FBC 800A83BC 308200FF */  andi       $v0, $a0, 0xff
/* A8FC0 800A83C0 00420018 */  mult       $v0, $v0
/* A8FC4 800A83C4 00001012 */  mflo       $v0
/* A8FC8 800A83C8 30A500FF */  andi       $a1, $a1, 0xff
/* A8FCC 800A83CC 00000000 */  nop
/* A8FD0 800A83D0 00A50018 */  mult       $a1, $a1
/* A8FD4 800A83D4 00002812 */  mflo       $a1
/* A8FD8 800A83D8 30C600FF */  andi       $a2, $a2, 0xff
/* A8FDC 800A83DC 00000000 */  nop
/* A8FE0 800A83E0 00C60018 */  mult       $a2, $a2
/* A8FE4 800A83E4 00451021 */  addu       $v0, $v0, $a1
/* A8FE8 800A83E8 00003012 */  mflo       $a2
/* A8FEC 800A83EC 03E00008 */  jr         $ra
/* A8FF0 800A83F0 00461021 */   addu      $v0, $v0, $a2

glabel func_800A83F4
/* A8FF4 800A83F4 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* A8FF8 800A83F8 AFB40028 */  sw         $s4, 0x28($sp)
/* A8FFC 800A83FC 0080A021 */  addu       $s4, $a0, $zero
/* A9000 800A8400 AFBF003C */  sw         $ra, 0x3c($sp)
/* A9004 800A8404 AFBE0038 */  sw         $fp, 0x38($sp)
/* A9008 800A8408 AFB70034 */  sw         $s7, 0x34($sp)
/* A900C 800A840C AFB60030 */  sw         $s6, 0x30($sp)
/* A9010 800A8410 AFB5002C */  sw         $s5, 0x2c($sp)
/* A9014 800A8414 AFB30024 */  sw         $s3, 0x24($sp)
/* A9018 800A8418 AFB20020 */  sw         $s2, 0x20($sp)
/* A901C 800A841C AFB1001C */  sw         $s1, 0x1c($sp)
/* A9020 800A8420 AFB00018 */  sw         $s0, 0x18($sp)
/* A9024 800A8424 F7B60048 */  sdc1       $f22, 0x48($sp)
/* A9028 800A8428 F7B40040 */  sdc1       $f20, 0x40($sp)
/* A902C 800A842C 8E83029C */  lw         $v1, 0x29c($s4)
/* A9030 800A8430 8E820298 */  lw         $v0, 0x298($s4)
/* A9034 800A8434 4486A000 */  mtc1       $a2, $f20
/* A9038 800A8438 4487B000 */  mtc1       $a3, $f22
/* A903C 800A843C 93B70067 */  lbu        $s7, 0x67($sp)
/* A9040 800A8440 93BE006B */  lbu        $fp, 0x6b($sp)
/* A9044 800A8444 93A4006F */  lbu        $a0, 0x6f($sp)
/* A9048 800A8448 97B00076 */  lhu        $s0, 0x76($sp)
/* A904C 800A844C 0062102B */  sltu       $v0, $v1, $v0
/* A9050 800A8450 1440002D */  bnez       $v0, .L800A8508
/* A9054 800A8454 AFA40010 */   sw        $a0, 0x10($sp)
/* A9058 800A8458 2415FFFF */  addiu      $s5, $zero, -1
/* A905C 800A845C 02E02021 */  addu       $a0, $s7, $zero
/* A9060 800A8460 8FA60010 */  lw         $a2, 0x10($sp)
/* A9064 800A8464 0C02A0EF */  jal        ASquared_BSquared_CSquared
/* A9068 800A8468 03C02821 */   addu      $a1, $fp, $zero
/* A906C 800A846C 00409821 */  addu       $s3, $v0, $zero
/* A9070 800A8470 00101C00 */  sll        $v1, $s0, 0x10
/* A9074 800A8474 8682029A */  lh         $v0, 0x29a($s4)
/* A9078 800A8478 00038C03 */  sra        $s1, $v1, 0x10
/* A907C 800A847C 0222102A */  slt        $v0, $s1, $v0
/* A9080 800A8480 10400019 */  beqz       $v0, .L800A84E8
/* A9084 800A8484 3C030001 */   lui       $v1, 1
/* A9088 800A8488 00112400 */  sll        $a0, $s1, 0x10
/* A908C 800A848C 00839021 */  addu       $s2, $a0, $v1
/* A9090 800A8490 00111100 */  sll        $v0, $s1, 4
/* A9094 800A8494 24420218 */  addiu      $v0, $v0, 0x218
/* A9098 800A8498 00542021 */  addu       $a0, $v0, $s4
/* A909C 800A849C 3C160001 */  lui        $s6, 1
.L800A84A0:
/* A90A0 800A84A0 00808021 */  addu       $s0, $a0, $zero
/* A90A4 800A84A4 92040004 */  lbu        $a0, 4($s0)
/* A90A8 800A84A8 92050005 */  lbu        $a1, 5($s0)
/* A90AC 800A84AC 0C02A0EF */  jal        ASquared_BSquared_CSquared
/* A90B0 800A84B0 92060006 */   lbu       $a2, 6($s0)
/* A90B4 800A84B4 00401821 */  addu       $v1, $v0, $zero
/* A90B8 800A84B8 0073102B */  sltu       $v0, $v1, $s3
/* A90BC 800A84BC 50400004 */  beql       $v0, $zero, .L800A84D0
/* A90C0 800A84C0 02401821 */   addu      $v1, $s2, $zero
/* A90C4 800A84C4 00609821 */  addu       $s3, $v1, $zero
/* A90C8 800A84C8 0220A821 */  addu       $s5, $s1, $zero
/* A90CC 800A84CC 02401821 */  addu       $v1, $s2, $zero
.L800A84D0:
/* A90D0 800A84D0 02569021 */  addu       $s2, $s2, $s6
/* A90D4 800A84D4 8682029A */  lh         $v0, 0x29a($s4)
/* A90D8 800A84D8 00038C03 */  sra        $s1, $v1, 0x10
/* A90DC 800A84DC 0222102A */  slt        $v0, $s1, $v0
/* A90E0 800A84E0 1440FFEF */  bnez       $v0, .L800A84A0
/* A90E4 800A84E4 26040010 */   addiu     $a0, $s0, 0x10
.L800A84E8:
/* A90E8 800A84E8 06A10003 */  bgez       $s5, .L800A84F8
/* A90EC 800A84EC 32A4FFFF */   andi      $a0, $s5, 0xffff
/* A90F0 800A84F0 0802A18A */  j          .L800A8628
/* A90F4 800A84F4 3402FFFF */   ori       $v0, $zero, 0xffff
.L800A84F8:
/* A90F8 800A84F8 00151100 */  sll        $v0, $s5, 4
/* A90FC 800A84FC 24420218 */  addiu      $v0, $v0, 0x218
/* A9100 800A8500 0802A148 */  j          .L800A8520
/* A9104 800A8504 02828021 */   addu      $s0, $s4, $v0
.L800A8508:
/* A9108 800A8508 00031100 */  sll        $v0, $v1, 4
/* A910C 800A850C 24420218 */  addiu      $v0, $v0, 0x218
/* A9110 800A8510 02828021 */  addu       $s0, $s4, $v0
/* A9114 800A8514 9684029E */  lhu        $a0, 0x29e($s4)
/* A9118 800A8518 24620001 */  addiu      $v0, $v1, 1
/* A911C 800A851C AE82029C */  sw         $v0, 0x29c($s4)
.L800A8520:
/* A9120 800A8520 3C01800E */  lui        $at, %hi(D_800E34F0)
/* A9124 800A8524 C42034F0 */  lwc1       $f0, %lo(D_800E34F0)($at)
/* A9128 800A8528 3C01800E */  lui        $at, %hi(D_800E34F4)
/* A912C 800A852C C42234F4 */  lwc1       $f2, %lo(D_800E34F4)($at)
/* A9130 800A8530 A2000000 */  sb         $zero, ($s0)
/* A9134 800A8534 A2000001 */  sb         $zero, 1($s0)
/* A9138 800A8538 A2000002 */  sb         $zero, 2($s0)
/* A913C 800A853C A2000003 */  sb         $zero, 3($s0)
/* A9140 800A8540 A2170004 */  sb         $s7, 4($s0)
/* A9144 800A8544 A21E0005 */  sb         $fp, 5($s0)
/* A9148 800A8548 4600A002 */  mul.s      $f0, $f20, $f0
/* A914C 800A854C 8FA20010 */  lw         $v0, 0x10($sp)
/* A9150 800A8550 A2000007 */  sb         $zero, 7($s0)
/* A9154 800A8554 4600103E */  c.le.s     $f2, $f0
/* A9158 800A8558 00000000 */  nop
/* A915C 800A855C 45010005 */  bc1t       .L800A8574
/* A9160 800A8560 A2020006 */   sb        $v0, 6($s0)
/* A9164 800A8564 4600008D */  trunc.w.s  $f2, $f0
/* A9168 800A8568 44061000 */  mfc1       $a2, $f2
/* A916C 800A856C 0802A162 */  j          .L800A8588
/* A9170 800A8570 00000000 */   nop
.L800A8574:
/* A9174 800A8574 46020001 */  sub.s      $f0, $f0, $f2
/* A9178 800A8578 4600008D */  trunc.w.s  $f2, $f0
/* A917C 800A857C 44061000 */  mfc1       $a2, $f2
/* A9180 800A8580 3C028000 */  lui        $v0, 0x8000
/* A9184 800A8584 00C23025 */  or         $a2, $a2, $v0
.L800A8588:
/* A9188 800A8588 3C01800E */  lui        $at, %hi(D_800E34F8)
/* A918C 800A858C C42034F8 */  lwc1       $f0, %lo(D_800E34F8)($at)
/* A9190 800A8590 4600B002 */  mul.s      $f0, $f22, $f0
/* A9194 800A8594 3C01800E */  lui        $at, %hi(D_800E34FC)
/* A9198 800A8598 C42234FC */  lwc1       $f2, %lo(D_800E34FC)($at)
/* A919C 800A859C 4600103E */  c.le.s     $f2, $f0
/* A91A0 800A85A0 00000000 */  nop
/* A91A4 800A85A4 45010005 */  bc1t       .L800A85BC
/* A91A8 800A85A8 A2060008 */   sb        $a2, 8($s0)
/* A91AC 800A85AC 4600008D */  trunc.w.s  $f2, $f0
/* A91B0 800A85B0 44071000 */  mfc1       $a3, $f2
/* A91B4 800A85B4 0802A174 */  j          .L800A85D0
/* A91B8 800A85B8 00000000 */   nop
.L800A85BC:
/* A91BC 800A85BC 46020001 */  sub.s      $f0, $f0, $f2
/* A91C0 800A85C0 4600008D */  trunc.w.s  $f2, $f0
/* A91C4 800A85C4 44071000 */  mfc1       $a3, $f2
/* A91C8 800A85C8 3C028000 */  lui        $v0, 0x8000
/* A91CC 800A85CC 00E23825 */  or         $a3, $a3, $v0
.L800A85D0:
/* A91D0 800A85D0 3C01800E */  lui        $at, %hi(D_800E3500)
/* A91D4 800A85D4 C4223500 */  lwc1       $f2, %lo(D_800E3500)($at)
/* A91D8 800A85D8 C7A00060 */  lwc1       $f0, 0x60($sp)
/* A91DC 800A85DC 46020002 */  mul.s      $f0, $f0, $f2
/* A91E0 800A85E0 3C01800E */  lui        $at, %hi(D_800E3504)
/* A91E4 800A85E4 C4223504 */  lwc1       $f2, %lo(D_800E3504)($at)
/* A91E8 800A85E8 4600103E */  c.le.s     $f2, $f0
/* A91EC 800A85EC 00000000 */  nop
/* A91F0 800A85F0 45010005 */  bc1t       .L800A8608
/* A91F4 800A85F4 A2070009 */   sb        $a3, 9($s0)
/* A91F8 800A85F8 4600008D */  trunc.w.s  $f2, $f0
/* A91FC 800A85FC 44031000 */  mfc1       $v1, $f2
/* A9200 800A8600 0802A188 */  j          .L800A8620
/* A9204 800A8604 00801021 */   addu      $v0, $a0, $zero
.L800A8608:
/* A9208 800A8608 46020001 */  sub.s      $f0, $f0, $f2
/* A920C 800A860C 4600008D */  trunc.w.s  $f2, $f0
/* A9210 800A8610 44031000 */  mfc1       $v1, $f2
/* A9214 800A8614 3C028000 */  lui        $v0, 0x8000
/* A9218 800A8618 00621825 */  or         $v1, $v1, $v0
/* A921C 800A861C 00801021 */  addu       $v0, $a0, $zero
.L800A8620:
/* A9220 800A8620 A203000A */  sb         $v1, 0xa($s0)
/* A9224 800A8624 A200000B */  sb         $zero, 0xb($s0)
.L800A8628:
/* A9228 800A8628 8FBF003C */  lw         $ra, 0x3c($sp)
/* A922C 800A862C 8FBE0038 */  lw         $fp, 0x38($sp)
/* A9230 800A8630 8FB70034 */  lw         $s7, 0x34($sp)
/* A9234 800A8634 8FB60030 */  lw         $s6, 0x30($sp)
/* A9238 800A8638 8FB5002C */  lw         $s5, 0x2c($sp)
/* A923C 800A863C 8FB40028 */  lw         $s4, 0x28($sp)
/* A9240 800A8640 8FB30024 */  lw         $s3, 0x24($sp)
/* A9244 800A8644 8FB20020 */  lw         $s2, 0x20($sp)
/* A9248 800A8648 8FB1001C */  lw         $s1, 0x1c($sp)
/* A924C 800A864C 8FB00018 */  lw         $s0, 0x18($sp)
/* A9250 800A8650 D7B60048 */  ldc1       $f22, 0x48($sp)
/* A9254 800A8654 D7B40040 */  ldc1       $f20, 0x40($sp)
/* A9258 800A8658 03E00008 */  jr         $ra
/* A925C 800A865C 27BD0050 */   addiu     $sp, $sp, 0x50

glabel aniDat_set_LightColors
/* A9260 800A8660 30A500FF */  andi       $a1, $a1, 0xff
/* A9264 800A8664 30C600FF */  andi       $a2, $a2, 0xff
/* A9268 800A8668 A0850288 */  sb         $a1, 0x288($a0)
/* A926C 800A866C 24840288 */  addiu      $a0, $a0, 0x288
/* A9270 800A8670 30E700FF */  andi       $a3, $a3, 0xff
/* A9274 800A8674 A0860001 */  sb         $a2, 1($a0)
/* A9278 800A8678 A0870002 */  sb         $a3, 2($a0)
/* A927C 800A867C A0800003 */  sb         $zero, 3($a0)
/* A9280 800A8680 A0850004 */  sb         $a1, 4($a0)
/* A9284 800A8684 A0860005 */  sb         $a2, 5($a0)
/* A9288 800A8688 A0870006 */  sb         $a3, 6($a0)
/* A928C 800A868C A0800007 */  sb         $zero, 7($a0)
/* A9290 800A8690 A0800008 */  sb         $zero, 8($a0)
/* A9294 800A8694 A0800009 */  sb         $zero, 9($a0)
/* A9298 800A8698 A080000A */  sb         $zero, 0xa($a0)
/* A929C 800A869C 03E00008 */  jr         $ra
/* A92A0 800A86A0 A080000B */   sb        $zero, 0xb($a0)

glabel HasLocator
/* A92A4 800A86A4 28A20008 */  slti       $v0, $a1, 8
/* A92A8 800A86A8 10400006 */  beqz       $v0, .L800A86C4
/* A92AC 800A86AC 00051880 */   sll       $v1, $a1, 2
/* A92B0 800A86B0 00831821 */  addu       $v1, $a0, $v1
/* A92B4 800A86B4 8C6201D4 */  lw         $v0, 0x1d4($v1)
/* A92B8 800A86B8 00021027 */  nor        $v0, $zero, $v0
/* A92BC 800A86BC 03E00008 */  jr         $ra
/* A92C0 800A86C0 0002102B */   sltu      $v0, $zero, $v0
.L800A86C4:
/* A92C4 800A86C4 03E00008 */  jr         $ra
/* A92C8 800A86C8 00001021 */   addu      $v0, $zero, $zero

glabel SceneGetLocatorMtx
/* A92CC 800A86CC 27BDFE98 */  addiu      $sp, $sp, -0x168
/* A92D0 800A86D0 00803821 */  addu       $a3, $a0, $zero
/* A92D4 800A86D4 AFB3015C */  sw         $s3, 0x15c($sp)
/* A92D8 800A86D8 00A09821 */  addu       $s3, $a1, $zero
/* A92DC 800A86DC 28C20008 */  slti       $v0, $a2, 8
/* A92E0 800A86E0 AFBF0160 */  sw         $ra, 0x160($sp)
/* A92E4 800A86E4 AFB20158 */  sw         $s2, 0x158($sp)
/* A92E8 800A86E8 AFB10154 */  sw         $s1, 0x154($sp)
/* A92EC 800A86EC 10400066 */  beqz       $v0, .L800A8888
/* A92F0 800A86F0 AFB00150 */   sw        $s0, 0x150($sp)
/* A92F4 800A86F4 00061080 */  sll        $v0, $a2, 2
/* A92F8 800A86F8 00E21021 */  addu       $v0, $a3, $v0
/* A92FC 800A86FC 8C4201D4 */  lw         $v0, 0x1d4($v0)
/* A9300 800A8700 2403FFFF */  addiu      $v1, $zero, -1
/* A9304 800A8704 10430054 */  beq        $v0, $v1, .L800A8858
/* A9308 800A8708 27A40010 */   addiu     $a0, $sp, 0x10
/* A930C 800A870C 8CE30000 */  lw         $v1, ($a3)
/* A9310 800A8710 8C65003C */  lw         $a1, 0x3c($v1)
/* A9314 800A8714 00021080 */  sll        $v0, $v0, 2
/* A9318 800A8718 00451021 */  addu       $v0, $v0, $a1
/* A931C 800A871C 0C0311DC */  jal        guMtxIdentF
/* A9320 800A8720 8C510000 */   lw        $s1, ($v0)
/* A9324 800A8724 8E220058 */  lw         $v0, 0x58($s1)
/* A9328 800A8728 3C01800E */  lui        $at, %hi(D_800E3574)
/* A932C 800A872C C4243574 */  lwc1       $f4, %lo(D_800E3574)($at)
/* A9330 800A8730 C4420018 */  lwc1       $f2, 0x18($v0)
/* A9334 800A8734 46041082 */  mul.s      $f2, $f2, $f4
/* A9338 800A8738 C440001C */  lwc1       $f0, 0x1c($v0)
/* A933C 800A873C 46040002 */  mul.s      $f0, $f0, $f4
/* A9340 800A8740 44051000 */  mfc1       $a1, $f2
/* A9344 800A8744 C4420020 */  lwc1       $f2, 0x20($v0)
/* A9348 800A8748 46041082 */  mul.s      $f2, $f2, $f4
/* A934C 800A874C 44060000 */  mfc1       $a2, $f0
/* A9350 800A8750 44071000 */  mfc1       $a3, $f2
/* A9354 800A8754 0C032D64 */  jal        guRotateRPYF
/* A9358 800A8758 27A40010 */   addiu     $a0, $sp, 0x10
/* A935C 800A875C 27B20050 */  addiu      $s2, $sp, 0x50
/* A9360 800A8760 0C0311DC */  jal        guMtxIdentF
/* A9364 800A8764 02402021 */   addu      $a0, $s2, $zero
/* A9368 800A8768 8E220058 */  lw         $v0, 0x58($s1)
/* A936C 800A876C C440000C */  lwc1       $f0, 0xc($v0)
/* A9370 800A8770 E7A00080 */  swc1       $f0, 0x80($sp)
/* A9374 800A8774 C4420010 */  lwc1       $f2, 0x10($v0)
/* A9378 800A8778 E7A20084 */  swc1       $f2, 0x84($sp)
/* A937C 800A877C C4400014 */  lwc1       $f0, 0x14($v0)
/* A9380 800A8780 02602021 */  addu       $a0, $s3, $zero
/* A9384 800A8784 0C0311DC */  jal        guMtxIdentF
/* A9388 800A8788 E7A00088 */   swc1      $f0, 0x88($sp)
/* A938C 800A878C 27B00090 */  addiu      $s0, $sp, 0x90
/* A9390 800A8790 02002021 */  addu       $a0, $s0, $zero
/* A9394 800A8794 02402821 */  addu       $a1, $s2, $zero
/* A9398 800A8798 0C02B127 */  jal        some_oher_matrix_math
/* A939C 800A879C 27A60010 */   addiu     $a2, $sp, 0x10
/* A93A0 800A87A0 02602021 */  addu       $a0, $s3, $zero
/* A93A4 800A87A4 26250010 */  addiu      $a1, $s1, 0x10
/* A93A8 800A87A8 0C02B127 */  jal        some_oher_matrix_math
/* A93AC 800A87AC 02003021 */   addu      $a2, $s0, $zero
/* A93B0 800A87B0 24020001 */  addiu      $v0, $zero, 1
/* A93B4 800A87B4 C66A0030 */  lwc1       $f10, 0x30($s3)
/* A93B8 800A87B8 3C01800E */  lui        $at, %hi(D_800E3578)
/* A93BC 800A87BC C4283578 */  lwc1       $f8, %lo(D_800E3578)($at)
/* A93C0 800A87C0 8E230058 */  lw         $v1, 0x58($s1)
/* A93C4 800A87C4 46085282 */  mul.s      $f10, $f10, $f8
/* A93C8 800A87C8 C6600000 */  lwc1       $f0, ($s3)
/* A93CC 800A87CC C6620010 */  lwc1       $f2, 0x10($s3)
/* A93D0 800A87D0 C6660034 */  lwc1       $f6, 0x34($s3)
/* A93D4 800A87D4 C4640008 */  lwc1       $f4, 8($v1)
/* A93D8 800A87D8 46083182 */  mul.s      $f6, $f6, $f8
/* A93DC 800A87DC 46040003 */  div.s      $f0, $f0, $f4
/* A93E0 800A87E0 E6600000 */  swc1       $f0, ($s3)
/* A93E4 800A87E4 C6600020 */  lwc1       $f0, 0x20($s3)
/* A93E8 800A87E8 46041083 */  div.s      $f2, $f2, $f4
/* A93EC 800A87EC E6620010 */  swc1       $f2, 0x10($s3)
/* A93F0 800A87F0 C6620004 */  lwc1       $f2, 4($s3)
/* A93F4 800A87F4 46040003 */  div.s      $f0, $f0, $f4
/* A93F8 800A87F8 E6600020 */  swc1       $f0, 0x20($s3)
/* A93FC 800A87FC C6600014 */  lwc1       $f0, 0x14($s3)
/* A9400 800A8800 46041083 */  div.s      $f2, $f2, $f4
/* A9404 800A8804 E6620004 */  swc1       $f2, 4($s3)
/* A9408 800A8808 C6620024 */  lwc1       $f2, 0x24($s3)
/* A940C 800A880C 46040003 */  div.s      $f0, $f0, $f4
/* A9410 800A8810 E6600014 */  swc1       $f0, 0x14($s3)
/* A9414 800A8814 C6600008 */  lwc1       $f0, 8($s3)
/* A9418 800A8818 46041083 */  div.s      $f2, $f2, $f4
/* A941C 800A881C E6620024 */  swc1       $f2, 0x24($s3)
/* A9420 800A8820 46040003 */  div.s      $f0, $f0, $f4
/* A9424 800A8824 E6600008 */  swc1       $f0, 8($s3)
/* A9428 800A8828 C6600018 */  lwc1       $f0, 0x18($s3)
/* A942C 800A882C C6620038 */  lwc1       $f2, 0x38($s3)
/* A9430 800A8830 46040003 */  div.s      $f0, $f0, $f4
/* A9434 800A8834 E6600018 */  swc1       $f0, 0x18($s3)
/* A9438 800A8838 C6600028 */  lwc1       $f0, 0x28($s3)
/* A943C 800A883C 46081082 */  mul.s      $f2, $f2, $f8
/* A9440 800A8840 E66A0030 */  swc1       $f10, 0x30($s3)
/* A9444 800A8844 E6660034 */  swc1       $f6, 0x34($s3)
/* A9448 800A8848 46040003 */  div.s      $f0, $f0, $f4
/* A944C 800A884C E6600028 */  swc1       $f0, 0x28($s3)
/* A9450 800A8850 0802A228 */  j          .L800A88A0
/* A9454 800A8854 E6620038 */   swc1      $f2, 0x38($s3)
.L800A8858:
/* A9458 800A8858 27B000D0 */  addiu      $s0, $sp, 0xd0
/* A945C 800A885C 02002021 */  addu       $a0, $s0, $zero
/* A9460 800A8860 3C05800E */  lui        $a1, %hi(D_800E3508)
/* A9464 800A8864 24A53508 */  addiu      $a1, $a1, %lo(D_800E3508)
/* A9468 800A8868 0C0333AC */  jal        sprintf
/* A946C 800A886C 24E702AD */   addiu     $a3, $a3, 0x2ad
/* A9470 800A8870 3C04800E */  lui        $a0, %hi(D_800E352C)
/* A9474 800A8874 2484352C */  addiu      $a0, $a0, %lo(D_800E352C)
/* A9478 800A8878 0C025F2D */  jal        manualCrash
/* A947C 800A887C 02002821 */   addu      $a1, $s0, $zero
/* A9480 800A8880 0802A228 */  j          .L800A88A0
/* A9484 800A8884 00001021 */   addu      $v0, $zero, $zero
.L800A8888:
/* A9488 800A8888 3C04800E */  lui        $a0, %hi(D_800E352C)
/* A948C 800A888C 2484352C */  addiu      $a0, $a0, %lo(D_800E352C)
/* A9490 800A8890 3C05800E */  lui        $a1, %hi(D_800E354C)
/* A9494 800A8894 0C025F2D */  jal        manualCrash
/* A9498 800A8898 24A5354C */   addiu     $a1, $a1, %lo(D_800E354C)
/* A949C 800A889C 00001021 */  addu       $v0, $zero, $zero
.L800A88A0:
/* A94A0 800A88A0 8FBF0160 */  lw         $ra, 0x160($sp)
/* A94A4 800A88A4 8FB3015C */  lw         $s3, 0x15c($sp)
/* A94A8 800A88A8 8FB20158 */  lw         $s2, 0x158($sp)
/* A94AC 800A88AC 8FB10154 */  lw         $s1, 0x154($sp)
/* A94B0 800A88B0 8FB00150 */  lw         $s0, 0x150($sp)
/* A94B4 800A88B4 03E00008 */  jr         $ra
/* A94B8 800A88B8 27BD0168 */   addiu     $sp, $sp, 0x168

glabel SCeneGetLocatorPos
/* A94BC 800A88BC 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* A94C0 800A88C0 AFB000A0 */  sw         $s0, 0xa0($sp)
/* A94C4 800A88C4 00808021 */  addu       $s0, $a0, $zero
/* A94C8 800A88C8 AFB100A4 */  sw         $s1, 0xa4($sp)
/* A94CC 800A88CC 00A08821 */  addu       $s1, $a1, $zero
/* A94D0 800A88D0 AFB200A8 */  sw         $s2, 0xa8($sp)
/* A94D4 800A88D4 00C09021 */  addu       $s2, $a2, $zero
/* A94D8 800A88D8 16000006 */  bnez       $s0, .L800A88F4
/* A94DC 800A88DC AFBF00AC */   sw        $ra, 0xac($sp)
/* A94E0 800A88E0 3C04800E */  lui        $a0, %hi(D_800E357C)
/* A94E4 800A88E4 2484357C */  addiu      $a0, $a0, %lo(D_800E357C)
/* A94E8 800A88E8 3C05800E */  lui        $a1, %hi(D_800E359C)
/* A94EC 800A88EC 0C025F2D */  jal        manualCrash
/* A94F0 800A88F0 24A5359C */   addiu     $a1, $a1, %lo(D_800E359C)
.L800A88F4:
/* A94F4 800A88F4 2A420008 */  slti       $v0, $s2, 8
/* A94F8 800A88F8 10400035 */  beqz       $v0, .L800A89D0
/* A94FC 800A88FC 00121080 */   sll       $v0, $s2, 2
/* A9500 800A8900 02021021 */  addu       $v0, $s0, $v0
/* A9504 800A8904 8C4501D4 */  lw         $a1, 0x1d4($v0)
/* A9508 800A8908 2403FFFF */  addiu      $v1, $zero, -1
/* A950C 800A890C 10A30024 */  beq        $a1, $v1, .L800A89A0
/* A9510 800A8910 00051880 */   sll       $v1, $a1, 2
/* A9514 800A8914 8E020000 */  lw         $v0, ($s0)
/* A9518 800A8918 8C44003C */  lw         $a0, 0x3c($v0)
/* A951C 800A891C 00641821 */  addu       $v1, $v1, $a0
/* A9520 800A8920 8C700000 */  lw         $s0, ($v1)
/* A9524 800A8924 16000007 */  bnez       $s0, .L800A8944
/* A9528 800A8928 26220004 */   addiu     $v0, $s1, 4
/* A952C 800A892C 3C04800E */  lui        $a0, %hi(D_800E357C)
/* A9530 800A8930 2484357C */  addiu      $a0, $a0, %lo(D_800E357C)
/* A9534 800A8934 3C05800E */  lui        $a1, %hi(D_800E35A4)
/* A9538 800A8938 0C025F2D */  jal        manualCrash
/* A953C 800A893C 24A535A4 */   addiu     $a1, $a1, %lo(D_800E35A4)
/* A9540 800A8940 26220004 */  addiu      $v0, $s1, 4
.L800A8944:
/* A9544 800A8944 8E040058 */  lw         $a0, 0x58($s0)
/* A9548 800A8948 26230008 */  addiu      $v1, $s1, 8
/* A954C 800A894C AFB10010 */  sw         $s1, 0x10($sp)
/* A9550 800A8950 AFA20014 */  sw         $v0, 0x14($sp)
/* A9554 800A8954 AFA30018 */  sw         $v1, 0x18($sp)
/* A9558 800A8958 8C85000C */  lw         $a1, 0xc($a0)
/* A955C 800A895C 8C860010 */  lw         $a2, 0x10($a0)
/* A9560 800A8960 8C870014 */  lw         $a3, 0x14($a0)
/* A9564 800A8964 0C03115F */  jal        guMtxXFMF
/* A9568 800A8968 26040010 */   addiu     $a0, $s0, 0x10
/* A956C 800A896C C6260000 */  lwc1       $f6, ($s1)
/* A9570 800A8970 3C01800E */  lui        $at, %hi(D_800E35AC)
/* A9574 800A8974 C42035AC */  lwc1       $f0, %lo(D_800E35AC)($at)
/* A9578 800A8978 46003182 */  mul.s      $f6, $f6, $f0
/* A957C 800A897C C6240004 */  lwc1       $f4, 4($s1)
/* A9580 800A8980 46002102 */  mul.s      $f4, $f4, $f0
/* A9584 800A8984 C6220008 */  lwc1       $f2, 8($s1)
/* A9588 800A8988 46001082 */  mul.s      $f2, $f2, $f0
/* A958C 800A898C 24020001 */  addiu      $v0, $zero, 1
/* A9590 800A8990 E6260000 */  swc1       $f6, ($s1)
/* A9594 800A8994 E6240004 */  swc1       $f4, 4($s1)
/* A9598 800A8998 0802A27A */  j          .L800A89E8
/* A959C 800A899C E6220008 */   swc1      $f2, 8($s1)
.L800A89A0:
/* A95A0 800A89A0 27A40020 */  addiu      $a0, $sp, 0x20
/* A95A4 800A89A4 3C05800E */  lui        $a1, %hi(D_800E3508)
/* A95A8 800A89A8 24A53508 */  addiu      $a1, $a1, %lo(D_800E3508)
/* A95AC 800A89AC 02403021 */  addu       $a2, $s2, $zero
/* A95B0 800A89B0 0C0333AC */  jal        sprintf
/* A95B4 800A89B4 260702AD */   addiu     $a3, $s0, 0x2ad
/* A95B8 800A89B8 3C04800E */  lui        $a0, %hi(D_800E357C)
/* A95BC 800A89BC 2484357C */  addiu      $a0, $a0, %lo(D_800E357C)
/* A95C0 800A89C0 0C025F2D */  jal        manualCrash
/* A95C4 800A89C4 27A50020 */   addiu     $a1, $sp, 0x20
/* A95C8 800A89C8 0802A27A */  j          .L800A89E8
/* A95CC 800A89CC 00001021 */   addu      $v0, $zero, $zero
.L800A89D0:
/* A95D0 800A89D0 3C04800E */  lui        $a0, %hi(D_800E357C)
/* A95D4 800A89D4 2484357C */  addiu      $a0, $a0, %lo(D_800E357C)
/* A95D8 800A89D8 3C05800E */  lui        $a1, %hi(D_800E354C)
/* A95DC 800A89DC 0C025F2D */  jal        manualCrash
/* A95E0 800A89E0 24A5354C */   addiu     $a1, $a1, %lo(D_800E354C)
/* A95E4 800A89E4 00001021 */  addu       $v0, $zero, $zero
.L800A89E8:
/* A95E8 800A89E8 8FBF00AC */  lw         $ra, 0xac($sp)
/* A95EC 800A89EC 8FB200A8 */  lw         $s2, 0xa8($sp)
/* A95F0 800A89F0 8FB100A4 */  lw         $s1, 0xa4($sp)
/* A95F4 800A89F4 8FB000A0 */  lw         $s0, 0xa0($sp)
/* A95F8 800A89F8 03E00008 */  jr         $ra
/* A95FC 800A89FC 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel SceneGetLocatorNorm
/* A9600 800A8A00 27BDFE90 */  addiu      $sp, $sp, -0x170
/* A9604 800A8A04 00803821 */  addu       $a3, $a0, $zero
/* A9608 800A8A08 AFB20168 */  sw         $s2, 0x168($sp)
/* A960C 800A8A0C 00A09021 */  addu       $s2, $a1, $zero
/* A9610 800A8A10 28C20008 */  slti       $v0, $a2, 8
/* A9614 800A8A14 AFBF016C */  sw         $ra, 0x16c($sp)
/* A9618 800A8A18 AFB10164 */  sw         $s1, 0x164($sp)
/* A961C 800A8A1C 10400077 */  beqz       $v0, .L800A8BFC
/* A9620 800A8A20 AFB00160 */   sw        $s0, 0x160($sp)
/* A9624 800A8A24 00061080 */  sll        $v0, $a2, 2
/* A9628 800A8A28 00E21021 */  addu       $v0, $a3, $v0
/* A962C 800A8A2C 8C4201D4 */  lw         $v0, 0x1d4($v0)
/* A9630 800A8A30 2403FFFF */  addiu      $v1, $zero, -1
/* A9634 800A8A34 10430065 */  beq        $v0, $v1, .L800A8BCC
/* A9638 800A8A38 27A40020 */   addiu     $a0, $sp, 0x20
/* A963C 800A8A3C 8CE30000 */  lw         $v1, ($a3)
/* A9640 800A8A40 8C65003C */  lw         $a1, 0x3c($v1)
/* A9644 800A8A44 00021080 */  sll        $v0, $v0, 2
/* A9648 800A8A48 00451021 */  addu       $v0, $v0, $a1
/* A964C 800A8A4C 0C0311DC */  jal        guMtxIdentF
/* A9650 800A8A50 8C510000 */   lw        $s1, ($v0)
/* A9654 800A8A54 8E220058 */  lw         $v0, 0x58($s1)
/* A9658 800A8A58 3C01800E */  lui        $at, %hi(D_800E35D4)
/* A965C 800A8A5C C42435D4 */  lwc1       $f4, %lo(D_800E35D4)($at)
/* A9660 800A8A60 C4420018 */  lwc1       $f2, 0x18($v0)
/* A9664 800A8A64 46041082 */  mul.s      $f2, $f2, $f4
/* A9668 800A8A68 C440001C */  lwc1       $f0, 0x1c($v0)
/* A966C 800A8A6C 46040002 */  mul.s      $f0, $f0, $f4
/* A9670 800A8A70 44051000 */  mfc1       $a1, $f2
/* A9674 800A8A74 C4420020 */  lwc1       $f2, 0x20($v0)
/* A9678 800A8A78 46041082 */  mul.s      $f2, $f2, $f4
/* A967C 800A8A7C 44060000 */  mfc1       $a2, $f0
/* A9680 800A8A80 44071000 */  mfc1       $a3, $f2
/* A9684 800A8A84 0C032D64 */  jal        guRotateRPYF
/* A9688 800A8A88 27A40020 */   addiu     $a0, $sp, 0x20
/* A968C 800A8A8C 27B00060 */  addiu      $s0, $sp, 0x60
/* A9690 800A8A90 0C0311DC */  jal        guMtxIdentF
/* A9694 800A8A94 02002021 */   addu      $a0, $s0, $zero
/* A9698 800A8A98 02002021 */  addu       $a0, $s0, $zero
/* A969C 800A8A9C 26250010 */  addiu      $a1, $s1, 0x10
/* A96A0 800A8AA0 0C02B127 */  jal        some_oher_matrix_math
/* A96A4 800A8AA4 27A60020 */   addiu     $a2, $sp, 0x20
/* A96A8 800A8AA8 8E220058 */  lw         $v0, 0x58($s1)
/* A96AC 800A8AAC 3C01800E */  lui        $at, %hi(D_800E35D8)
/* A96B0 800A8AB0 C42035D8 */  lwc1       $f0, %lo(D_800E35D8)($at)
/* A96B4 800A8AB4 C7A20070 */  lwc1       $f2, 0x70($sp)
/* A96B8 800A8AB8 C7A40080 */  lwc1       $f4, 0x80($sp)
/* A96BC 800A8ABC C4460008 */  lwc1       $f6, 8($v0)
/* A96C0 800A8AC0 02002021 */  addu       $a0, $s0, $zero
/* A96C4 800A8AC4 AFA00090 */  sw         $zero, 0x90($sp)
/* A96C8 800A8AC8 8FA50090 */  lw         $a1, 0x90($sp)
/* A96CC 800A8ACC 44060000 */  mfc1       $a2, $f0
/* A96D0 800A8AD0 26430008 */  addiu      $v1, $s2, 8
/* A96D4 800A8AD4 E7A000A4 */  swc1       $f0, 0xa4($sp)
/* A96D8 800A8AD8 C7A00060 */  lwc1       $f0, 0x60($sp)
/* A96DC 800A8ADC 26420004 */  addiu      $v0, $s2, 4
/* A96E0 800A8AE0 AFA00094 */  sw         $zero, 0x94($sp)
/* A96E4 800A8AE4 AFA00098 */  sw         $zero, 0x98($sp)
/* A96E8 800A8AE8 AFA000A0 */  sw         $zero, 0xa0($sp)
/* A96EC 800A8AEC AFA000A8 */  sw         $zero, 0xa8($sp)
/* A96F0 800A8AF0 AFB20010 */  sw         $s2, 0x10($sp)
/* A96F4 800A8AF4 AFA20014 */  sw         $v0, 0x14($sp)
/* A96F8 800A8AF8 AFA30018 */  sw         $v1, 0x18($sp)
/* A96FC 800A8AFC 00A03821 */  addu       $a3, $a1, $zero
/* A9700 800A8B00 46060003 */  div.s      $f0, $f0, $f6
/* A9704 800A8B04 E7A00060 */  swc1       $f0, 0x60($sp)
/* A9708 800A8B08 C7A00064 */  lwc1       $f0, 0x64($sp)
/* A970C 800A8B0C 46061083 */  div.s      $f2, $f2, $f6
/* A9710 800A8B10 E7A20070 */  swc1       $f2, 0x70($sp)
/* A9714 800A8B14 C7A20074 */  lwc1       $f2, 0x74($sp)
/* A9718 800A8B18 46062103 */  div.s      $f4, $f4, $f6
/* A971C 800A8B1C E7A40080 */  swc1       $f4, 0x80($sp)
/* A9720 800A8B20 46060003 */  div.s      $f0, $f0, $f6
/* A9724 800A8B24 E7A00064 */  swc1       $f0, 0x64($sp)
/* A9728 800A8B28 C7A00084 */  lwc1       $f0, 0x84($sp)
/* A972C 800A8B2C 46061083 */  div.s      $f2, $f2, $f6
/* A9730 800A8B30 E7A20074 */  swc1       $f2, 0x74($sp)
/* A9734 800A8B34 C7A20068 */  lwc1       $f2, 0x68($sp)
/* A9738 800A8B38 46060003 */  div.s      $f0, $f0, $f6
/* A973C 800A8B3C E7A00084 */  swc1       $f0, 0x84($sp)
/* A9740 800A8B40 C7A00078 */  lwc1       $f0, 0x78($sp)
/* A9744 800A8B44 46061083 */  div.s      $f2, $f2, $f6
/* A9748 800A8B48 E7A20068 */  swc1       $f2, 0x68($sp)
/* A974C 800A8B4C C7A20088 */  lwc1       $f2, 0x88($sp)
/* A9750 800A8B50 46060003 */  div.s      $f0, $f0, $f6
/* A9754 800A8B54 46061083 */  div.s      $f2, $f2, $f6
/* A9758 800A8B58 E7A00078 */  swc1       $f0, 0x78($sp)
/* A975C 800A8B5C 0C03115F */  jal        guMtxXFMF
/* A9760 800A8B60 E7A20088 */   swc1      $f2, 0x88($sp)
/* A9764 800A8B64 C6400000 */  lwc1       $f0, ($s2)
/* A9768 800A8B68 44801000 */  mtc1       $zero, $f2
/* A976C 800A8B6C 46020032 */  c.eq.s     $f0, $f2
/* A9770 800A8B70 00000000 */  nop
/* A9774 800A8B74 45020005 */  bc1fl      .L800A8B8C
/* A9778 800A8B78 C6400004 */   lwc1      $f0, 4($s2)
/* A977C 800A8B7C 3C01800E */  lui        $at, %hi(D_800E35DC)
/* A9780 800A8B80 C42035DC */  lwc1       $f0, %lo(D_800E35DC)($at)
/* A9784 800A8B84 E6400000 */  swc1       $f0, ($s2)
/* A9788 800A8B88 C6400004 */  lwc1       $f0, 4($s2)
.L800A8B8C:
/* A978C 800A8B8C 46020032 */  c.eq.s     $f0, $f2
/* A9790 800A8B90 00000000 */  nop
/* A9794 800A8B94 45020005 */  bc1fl      .L800A8BAC
/* A9798 800A8B98 C6400008 */   lwc1      $f0, 8($s2)
/* A979C 800A8B9C 3C01800E */  lui        $at, %hi(D_800E35E0)
/* A97A0 800A8BA0 C42035E0 */  lwc1       $f0, %lo(D_800E35E0)($at)
/* A97A4 800A8BA4 E6400004 */  swc1       $f0, 4($s2)
/* A97A8 800A8BA8 C6400008 */  lwc1       $f0, 8($s2)
.L800A8BAC:
/* A97AC 800A8BAC 46020032 */  c.eq.s     $f0, $f2
/* A97B0 800A8BB0 00000000 */  nop
/* A97B4 800A8BB4 45000017 */  bc1f       .L800A8C14
/* A97B8 800A8BB8 24020001 */   addiu     $v0, $zero, 1
/* A97BC 800A8BBC 3C01800E */  lui        $at, %hi(D_800E35E4)
/* A97C0 800A8BC0 C42035E4 */  lwc1       $f0, %lo(D_800E35E4)($at)
/* A97C4 800A8BC4 0802A305 */  j          .L800A8C14
/* A97C8 800A8BC8 E6400008 */   swc1      $f0, 8($s2)
.L800A8BCC:
/* A97CC 800A8BCC 27B000E0 */  addiu      $s0, $sp, 0xe0
/* A97D0 800A8BD0 02002021 */  addu       $a0, $s0, $zero
/* A97D4 800A8BD4 3C05800E */  lui        $a1, %hi(D_800E3508)
/* A97D8 800A8BD8 24A53508 */  addiu      $a1, $a1, %lo(D_800E3508)
/* A97DC 800A8BDC 0C0333AC */  jal        sprintf
/* A97E0 800A8BE0 24E702AD */   addiu     $a3, $a3, 0x2ad
/* A97E4 800A8BE4 3C04800E */  lui        $a0, %hi(D_800E35B0)
/* A97E8 800A8BE8 248435B0 */  addiu      $a0, $a0, %lo(D_800E35B0)
/* A97EC 800A8BEC 0C025F2D */  jal        manualCrash
/* A97F0 800A8BF0 02002821 */   addu      $a1, $s0, $zero
/* A97F4 800A8BF4 0802A305 */  j          .L800A8C14
/* A97F8 800A8BF8 00001021 */   addu      $v0, $zero, $zero
.L800A8BFC:
/* A97FC 800A8BFC 3C04800E */  lui        $a0, %hi(D_800E35B0)
/* A9800 800A8C00 248435B0 */  addiu      $a0, $a0, %lo(D_800E35B0)
/* A9804 800A8C04 3C05800E */  lui        $a1, %hi(D_800E354C)
/* A9808 800A8C08 0C025F2D */  jal        manualCrash
/* A980C 800A8C0C 24A5354C */   addiu     $a1, $a1, %lo(D_800E354C)
/* A9810 800A8C10 00001021 */  addu       $v0, $zero, $zero
.L800A8C14:
/* A9814 800A8C14 8FBF016C */  lw         $ra, 0x16c($sp)
/* A9818 800A8C18 8FB20168 */  lw         $s2, 0x168($sp)
/* A981C 800A8C1C 8FB10164 */  lw         $s1, 0x164($sp)
/* A9820 800A8C20 8FB00160 */  lw         $s0, 0x160($sp)
/* A9824 800A8C24 03E00008 */  jr         $ra
/* A9828 800A8C28 27BD0170 */   addiu     $sp, $sp, 0x170

glabel SceneGetLocatorAlign
/* A982C 800A8C2C 27BDFE90 */  addiu      $sp, $sp, -0x170
/* A9830 800A8C30 00803821 */  addu       $a3, $a0, $zero
/* A9834 800A8C34 AFB20168 */  sw         $s2, 0x168($sp)
/* A9838 800A8C38 00A09021 */  addu       $s2, $a1, $zero
/* A983C 800A8C3C 28C20008 */  slti       $v0, $a2, 8
/* A9840 800A8C40 AFBF016C */  sw         $ra, 0x16c($sp)
/* A9844 800A8C44 AFB10164 */  sw         $s1, 0x164($sp)
/* A9848 800A8C48 10400077 */  beqz       $v0, .L800A8E28
/* A984C 800A8C4C AFB00160 */   sw        $s0, 0x160($sp)
/* A9850 800A8C50 00061080 */  sll        $v0, $a2, 2
/* A9854 800A8C54 00E21021 */  addu       $v0, $a3, $v0
/* A9858 800A8C58 8C4201D4 */  lw         $v0, 0x1d4($v0)
/* A985C 800A8C5C 2403FFFF */  addiu      $v1, $zero, -1
/* A9860 800A8C60 10430065 */  beq        $v0, $v1, .L800A8DF8
/* A9864 800A8C64 27A40020 */   addiu     $a0, $sp, 0x20
/* A9868 800A8C68 8CE30000 */  lw         $v1, ($a3)
/* A986C 800A8C6C 8C65003C */  lw         $a1, 0x3c($v1)
/* A9870 800A8C70 00021080 */  sll        $v0, $v0, 2
/* A9874 800A8C74 00451021 */  addu       $v0, $v0, $a1
/* A9878 800A8C78 0C0311DC */  jal        guMtxIdentF
/* A987C 800A8C7C 8C510000 */   lw        $s1, ($v0)
/* A9880 800A8C80 8E220058 */  lw         $v0, 0x58($s1)
/* A9884 800A8C84 3C01800E */  lui        $at, %hi(D_800E360C)
/* A9888 800A8C88 C424360C */  lwc1       $f4, %lo(D_800E360C)($at)
/* A988C 800A8C8C C4420018 */  lwc1       $f2, 0x18($v0)
/* A9890 800A8C90 46041082 */  mul.s      $f2, $f2, $f4
/* A9894 800A8C94 C440001C */  lwc1       $f0, 0x1c($v0)
/* A9898 800A8C98 46040002 */  mul.s      $f0, $f0, $f4
/* A989C 800A8C9C 44051000 */  mfc1       $a1, $f2
/* A98A0 800A8CA0 C4420020 */  lwc1       $f2, 0x20($v0)
/* A98A4 800A8CA4 46041082 */  mul.s      $f2, $f2, $f4
/* A98A8 800A8CA8 44060000 */  mfc1       $a2, $f0
/* A98AC 800A8CAC 44071000 */  mfc1       $a3, $f2
/* A98B0 800A8CB0 0C032D64 */  jal        guRotateRPYF
/* A98B4 800A8CB4 27A40020 */   addiu     $a0, $sp, 0x20
/* A98B8 800A8CB8 27B00060 */  addiu      $s0, $sp, 0x60
/* A98BC 800A8CBC 0C0311DC */  jal        guMtxIdentF
/* A98C0 800A8CC0 02002021 */   addu      $a0, $s0, $zero
/* A98C4 800A8CC4 02002021 */  addu       $a0, $s0, $zero
/* A98C8 800A8CC8 26250010 */  addiu      $a1, $s1, 0x10
/* A98CC 800A8CCC 0C02B127 */  jal        some_oher_matrix_math
/* A98D0 800A8CD0 27A60020 */   addiu     $a2, $sp, 0x20
/* A98D4 800A8CD4 8E220058 */  lw         $v0, 0x58($s1)
/* A98D8 800A8CD8 3C01800E */  lui        $at, %hi(D_800E3610)
/* A98DC 800A8CDC C4203610 */  lwc1       $f0, %lo(D_800E3610)($at)
/* A98E0 800A8CE0 C7A20070 */  lwc1       $f2, 0x70($sp)
/* A98E4 800A8CE4 C7A40080 */  lwc1       $f4, 0x80($sp)
/* A98E8 800A8CE8 C4460008 */  lwc1       $f6, 8($v0)
/* A98EC 800A8CEC 02002021 */  addu       $a0, $s0, $zero
/* A98F0 800A8CF0 AFA00090 */  sw         $zero, 0x90($sp)
/* A98F4 800A8CF4 8FA50090 */  lw         $a1, 0x90($sp)
/* A98F8 800A8CF8 44070000 */  mfc1       $a3, $f0
/* A98FC 800A8CFC 26430008 */  addiu      $v1, $s2, 8
/* A9900 800A8D00 E7A000A8 */  swc1       $f0, 0xa8($sp)
/* A9904 800A8D04 C7A00060 */  lwc1       $f0, 0x60($sp)
/* A9908 800A8D08 26420004 */  addiu      $v0, $s2, 4
/* A990C 800A8D0C AFA00094 */  sw         $zero, 0x94($sp)
/* A9910 800A8D10 AFA00098 */  sw         $zero, 0x98($sp)
/* A9914 800A8D14 AFA000A0 */  sw         $zero, 0xa0($sp)
/* A9918 800A8D18 AFA000A4 */  sw         $zero, 0xa4($sp)
/* A991C 800A8D1C AFB20010 */  sw         $s2, 0x10($sp)
/* A9920 800A8D20 AFA20014 */  sw         $v0, 0x14($sp)
/* A9924 800A8D24 AFA30018 */  sw         $v1, 0x18($sp)
/* A9928 800A8D28 00A03021 */  addu       $a2, $a1, $zero
/* A992C 800A8D2C 46060003 */  div.s      $f0, $f0, $f6
/* A9930 800A8D30 E7A00060 */  swc1       $f0, 0x60($sp)
/* A9934 800A8D34 C7A00064 */  lwc1       $f0, 0x64($sp)
/* A9938 800A8D38 46061083 */  div.s      $f2, $f2, $f6
/* A993C 800A8D3C E7A20070 */  swc1       $f2, 0x70($sp)
/* A9940 800A8D40 C7A20074 */  lwc1       $f2, 0x74($sp)
/* A9944 800A8D44 46062103 */  div.s      $f4, $f4, $f6
/* A9948 800A8D48 E7A40080 */  swc1       $f4, 0x80($sp)
/* A994C 800A8D4C 46060003 */  div.s      $f0, $f0, $f6
/* A9950 800A8D50 E7A00064 */  swc1       $f0, 0x64($sp)
/* A9954 800A8D54 C7A00084 */  lwc1       $f0, 0x84($sp)
/* A9958 800A8D58 46061083 */  div.s      $f2, $f2, $f6
/* A995C 800A8D5C E7A20074 */  swc1       $f2, 0x74($sp)
/* A9960 800A8D60 C7A20068 */  lwc1       $f2, 0x68($sp)
/* A9964 800A8D64 46060003 */  div.s      $f0, $f0, $f6
/* A9968 800A8D68 E7A00084 */  swc1       $f0, 0x84($sp)
/* A996C 800A8D6C C7A00078 */  lwc1       $f0, 0x78($sp)
/* A9970 800A8D70 46061083 */  div.s      $f2, $f2, $f6
/* A9974 800A8D74 E7A20068 */  swc1       $f2, 0x68($sp)
/* A9978 800A8D78 C7A20088 */  lwc1       $f2, 0x88($sp)
/* A997C 800A8D7C 46060003 */  div.s      $f0, $f0, $f6
/* A9980 800A8D80 46061083 */  div.s      $f2, $f2, $f6
/* A9984 800A8D84 E7A00078 */  swc1       $f0, 0x78($sp)
/* A9988 800A8D88 0C03115F */  jal        guMtxXFMF
/* A998C 800A8D8C E7A20088 */   swc1      $f2, 0x88($sp)
/* A9990 800A8D90 C6400000 */  lwc1       $f0, ($s2)
/* A9994 800A8D94 44801000 */  mtc1       $zero, $f2
/* A9998 800A8D98 46020032 */  c.eq.s     $f0, $f2
/* A999C 800A8D9C 00000000 */  nop
/* A99A0 800A8DA0 45020005 */  bc1fl      .L800A8DB8
/* A99A4 800A8DA4 C6400004 */   lwc1      $f0, 4($s2)
/* A99A8 800A8DA8 3C01800E */  lui        $at, %hi(D_800E3614)
/* A99AC 800A8DAC C4203614 */  lwc1       $f0, %lo(D_800E3614)($at)
/* A99B0 800A8DB0 E6400000 */  swc1       $f0, ($s2)
/* A99B4 800A8DB4 C6400004 */  lwc1       $f0, 4($s2)
.L800A8DB8:
/* A99B8 800A8DB8 46020032 */  c.eq.s     $f0, $f2
/* A99BC 800A8DBC 00000000 */  nop
/* A99C0 800A8DC0 45020005 */  bc1fl      .L800A8DD8
/* A99C4 800A8DC4 C6400008 */   lwc1      $f0, 8($s2)
/* A99C8 800A8DC8 3C01800E */  lui        $at, %hi(D_800E3618)
/* A99CC 800A8DCC C4203618 */  lwc1       $f0, %lo(D_800E3618)($at)
/* A99D0 800A8DD0 E6400004 */  swc1       $f0, 4($s2)
/* A99D4 800A8DD4 C6400008 */  lwc1       $f0, 8($s2)
.L800A8DD8:
/* A99D8 800A8DD8 46020032 */  c.eq.s     $f0, $f2
/* A99DC 800A8DDC 00000000 */  nop
/* A99E0 800A8DE0 45000017 */  bc1f       .L800A8E40
/* A99E4 800A8DE4 24020001 */   addiu     $v0, $zero, 1
/* A99E8 800A8DE8 3C01800E */  lui        $at, %hi(D_800E361C)
/* A99EC 800A8DEC C420361C */  lwc1       $f0, %lo(D_800E361C)($at)
/* A99F0 800A8DF0 0802A390 */  j          .L800A8E40
/* A99F4 800A8DF4 E6400008 */   swc1      $f0, 8($s2)
.L800A8DF8:
/* A99F8 800A8DF8 27B000E0 */  addiu      $s0, $sp, 0xe0
/* A99FC 800A8DFC 02002021 */  addu       $a0, $s0, $zero
/* A9A00 800A8E00 3C05800E */  lui        $a1, %hi(D_800E3508)
/* A9A04 800A8E04 24A53508 */  addiu      $a1, $a1, %lo(D_800E3508)
/* A9A08 800A8E08 0C0333AC */  jal        sprintf
/* A9A0C 800A8E0C 24E702AD */   addiu     $a3, $a3, 0x2ad
/* A9A10 800A8E10 3C04800E */  lui        $a0, %hi(D_800E35E8)
/* A9A14 800A8E14 248435E8 */  addiu      $a0, $a0, %lo(D_800E35E8)
/* A9A18 800A8E18 0C025F2D */  jal        manualCrash
/* A9A1C 800A8E1C 02002821 */   addu      $a1, $s0, $zero
/* A9A20 800A8E20 0802A390 */  j          .L800A8E40
/* A9A24 800A8E24 00001021 */   addu      $v0, $zero, $zero
.L800A8E28:
/* A9A28 800A8E28 3C04800E */  lui        $a0, %hi(D_800E35B0)
/* A9A2C 800A8E2C 248435B0 */  addiu      $a0, $a0, %lo(D_800E35B0)
/* A9A30 800A8E30 3C05800E */  lui        $a1, %hi(D_800E354C)
/* A9A34 800A8E34 0C025F2D */  jal        manualCrash
/* A9A38 800A8E38 24A5354C */   addiu     $a1, $a1, %lo(D_800E354C)
/* A9A3C 800A8E3C 00001021 */  addu       $v0, $zero, $zero
.L800A8E40:
/* A9A40 800A8E40 8FBF016C */  lw         $ra, 0x16c($sp)
/* A9A44 800A8E44 8FB20168 */  lw         $s2, 0x168($sp)
/* A9A48 800A8E48 8FB10164 */  lw         $s1, 0x164($sp)
/* A9A4C 800A8E4C 8FB00160 */  lw         $s0, 0x160($sp)
/* A9A50 800A8E50 03E00008 */  jr         $ra
/* A9A54 800A8E54 27BD0170 */   addiu     $sp, $sp, 0x170

glabel func_800A8E58
/* A9A58 800A8E58 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A9A5C 800A8E5C 24840088 */  addiu      $a0, $a0, 0x88
/* A9A60 800A8E60 AFBF0010 */  sw         $ra, 0x10($sp)
/* A9A64 800A8E64 0C033547 */  jal        memcpy
/* A9A68 800A8E68 24060040 */   addiu     $a2, $zero, 0x40
/* A9A6C 800A8E6C 8FBF0010 */  lw         $ra, 0x10($sp)
/* A9A70 800A8E70 03E00008 */  jr         $ra
/* A9A74 800A8E74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A8E78
/* A9A78 800A8E78 03E00008 */  jr         $ra
/* A9A7C 800A8E7C AC8502A0 */   sw        $a1, 0x2a0($a0)

glabel func_800A8E80
/* A9A80 800A8E80 03E00008 */  jr         $ra
/* A9A84 800A8E84 AC8502A4 */   sw        $a1, 0x2a4($a0)

glabel func_800A8E88
/* A9A88 800A8E88 03E00008 */  jr         $ra
/* A9A8C 800A8E8C AC8502A8 */   sw        $a1, 0x2a8($a0)

glabel func_800A8E90
/* A9A90 800A8E90 27BDFEC8 */  addiu      $sp, $sp, -0x138
/* A9A94 800A8E94 AFB20118 */  sw         $s2, 0x118($sp)
/* A9A98 800A8E98 00A09021 */  addu       $s2, $a1, $zero
/* A9A9C 800A8E9C AFBF0124 */  sw         $ra, 0x124($sp)
/* A9AA0 800A8EA0 AFB40120 */  sw         $s4, 0x120($sp)
/* A9AA4 800A8EA4 AFB3011C */  sw         $s3, 0x11c($sp)
/* A9AA8 800A8EA8 AFB10114 */  sw         $s1, 0x114($sp)
/* A9AAC 800A8EAC AFB00110 */  sw         $s0, 0x110($sp)
/* A9AB0 800A8EB0 F7B60130 */  sdc1       $f22, 0x130($sp)
/* A9AB4 800A8EB4 F7B40128 */  sdc1       $f20, 0x128($sp)
/* A9AB8 800A8EB8 8C820000 */  lw         $v0, ($a0)
/* A9ABC 800A8EBC 00C09821 */  addu       $s3, $a2, $zero
/* A9AC0 800A8EC0 8C420028 */  lw         $v0, 0x28($v0)
/* A9AC4 800A8EC4 1040003E */  beqz       $v0, .L800A8FC0
/* A9AC8 800A8EC8 00E0A021 */   addu      $s4, $a3, $zero
/* A9ACC 800A8ECC C440001C */  lwc1       $f0, 0x1c($v0)
/* A9AD0 800A8ED0 3C01800E */  lui        $at, %hi(D_800E3620)
/* A9AD4 800A8ED4 C4363620 */  lwc1       $f22, %lo(D_800E3620)($at)
/* A9AD8 800A8ED8 E6400000 */  swc1       $f0, ($s2)
/* A9ADC 800A8EDC C4420020 */  lwc1       $f2, 0x20($v0)
/* A9AE0 800A8EE0 E6420004 */  swc1       $f2, 4($s2)
/* A9AE4 800A8EE4 C4400024 */  lwc1       $f0, 0x24($v0)
/* A9AE8 800A8EE8 E6400008 */  swc1       $f0, 8($s2)
/* A9AEC 800A8EEC C4420010 */  lwc1       $f2, 0x10($v0)
/* A9AF0 800A8EF0 E7A20054 */  swc1       $f2, 0x54($sp)
/* A9AF4 800A8EF4 C4400014 */  lwc1       $f0, 0x14($v0)
/* A9AF8 800A8EF8 44061000 */  mfc1       $a2, $f2
/* A9AFC 800A8EFC E7A00050 */  swc1       $f0, 0x50($sp)
/* A9B00 800A8F00 C4420018 */  lwc1       $f2, 0x18($v0)
/* A9B04 800A8F04 AFA00090 */  sw         $zero, 0x90($sp)
/* A9B08 800A8F08 C7B40090 */  lwc1       $f20, 0x90($sp)
/* A9B0C 800A8F0C 44050000 */  mfc1       $a1, $f0
/* A9B10 800A8F10 4407A000 */  mfc1       $a3, $f20
/* A9B14 800A8F14 27A40010 */  addiu      $a0, $sp, 0x10
/* A9B18 800A8F18 AFA00094 */  sw         $zero, 0x94($sp)
/* A9B1C 800A8F1C E7B60098 */  swc1       $f22, 0x98($sp)
/* A9B20 800A8F20 0C032D64 */  jal        guRotateRPYF
/* A9B24 800A8F24 E7A20058 */   swc1      $f2, 0x58($sp)
/* A9B28 800A8F28 27B100D0 */  addiu      $s1, $sp, 0xd0
/* A9B2C 800A8F2C 02202021 */  addu       $a0, $s1, $zero
/* A9B30 800A8F30 27A50010 */  addiu      $a1, $sp, 0x10
/* A9B34 800A8F34 27B00090 */  addiu      $s0, $sp, 0x90
/* A9B38 800A8F38 0C02B2C0 */  jal        some_float_multi_math
/* A9B3C 800A8F3C 02003021 */   addu      $a2, $s0, $zero
/* A9B40 800A8F40 C6400000 */  lwc1       $f0, ($s2)
/* A9B44 800A8F44 C7A200D0 */  lwc1       $f2, 0xd0($sp)
/* A9B48 800A8F48 46020001 */  sub.s      $f0, $f0, $f2
/* A9B4C 800A8F4C E6600000 */  swc1       $f0, ($s3)
/* A9B50 800A8F50 C6420004 */  lwc1       $f2, 4($s2)
/* A9B54 800A8F54 C7A000D4 */  lwc1       $f0, 0xd4($sp)
/* A9B58 800A8F58 4405A000 */  mfc1       $a1, $f20
/* A9B5C 800A8F5C 46001081 */  sub.s      $f2, $f2, $f0
/* A9B60 800A8F60 8FA70058 */  lw         $a3, 0x58($sp)
/* A9B64 800A8F64 27A40010 */  addiu      $a0, $sp, 0x10
/* A9B68 800A8F68 E6620004 */  swc1       $f2, 4($s3)
/* A9B6C 800A8F6C C6400008 */  lwc1       $f0, 8($s2)
/* A9B70 800A8F70 C7A200D8 */  lwc1       $f2, 0xd8($sp)
/* A9B74 800A8F74 00A03021 */  addu       $a2, $a1, $zero
/* A9B78 800A8F78 E7B40090 */  swc1       $f20, 0x90($sp)
/* A9B7C 800A8F7C 46020001 */  sub.s      $f0, $f0, $f2
/* A9B80 800A8F80 E7B60094 */  swc1       $f22, 0x94($sp)
/* A9B84 800A8F84 E7B40098 */  swc1       $f20, 0x98($sp)
/* A9B88 800A8F88 0C032D64 */  jal        guRotateRPYF
/* A9B8C 800A8F8C E6600008 */   swc1      $f0, 8($s3)
/* A9B90 800A8F90 02202021 */  addu       $a0, $s1, $zero
/* A9B94 800A8F94 27A50010 */  addiu      $a1, $sp, 0x10
/* A9B98 800A8F98 0C02B2C0 */  jal        some_float_multi_math
/* A9B9C 800A8F9C 02003021 */   addu      $a2, $s0, $zero
/* A9BA0 800A8FA0 C7A000D0 */  lwc1       $f0, 0xd0($sp)
/* A9BA4 800A8FA4 C7A200D4 */  lwc1       $f2, 0xd4($sp)
/* A9BA8 800A8FA8 C7A400D8 */  lwc1       $f4, 0xd8($sp)
/* A9BAC 800A8FAC 24020001 */  addiu      $v0, $zero, 1
/* A9BB0 800A8FB0 E6800000 */  swc1       $f0, ($s4)
/* A9BB4 800A8FB4 E6820004 */  swc1       $f2, 4($s4)
/* A9BB8 800A8FB8 0802A3F1 */  j          .L800A8FC4
/* A9BBC 800A8FBC E6840008 */   swc1      $f4, 8($s4)
.L800A8FC0:
/* A9BC0 800A8FC0 00001021 */  addu       $v0, $zero, $zero
.L800A8FC4:
/* A9BC4 800A8FC4 8FBF0124 */  lw         $ra, 0x124($sp)
/* A9BC8 800A8FC8 8FB40120 */  lw         $s4, 0x120($sp)
/* A9BCC 800A8FCC 8FB3011C */  lw         $s3, 0x11c($sp)
/* A9BD0 800A8FD0 8FB20118 */  lw         $s2, 0x118($sp)
/* A9BD4 800A8FD4 8FB10114 */  lw         $s1, 0x114($sp)
/* A9BD8 800A8FD8 8FB00110 */  lw         $s0, 0x110($sp)
/* A9BDC 800A8FDC D7B60130 */  ldc1       $f22, 0x130($sp)
/* A9BE0 800A8FE0 D7B40128 */  ldc1       $f20, 0x128($sp)
/* A9BE4 800A8FE4 03E00008 */  jr         $ra
/* A9BE8 800A8FE8 27BD0138 */   addiu     $sp, $sp, 0x138
/* A9BEC 800A8FEC 00000000 */  nop
