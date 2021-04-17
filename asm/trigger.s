.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_checktrigger_pointer
/* AFFC0 800AF3C0 3C02800F */  lui        $v0, %hi(struct_unk_)
/* AFFC4 800AF3C4 03E00008 */  jr         $ra
/* AFFC8 800AF3C8 AC443620 */   sw        $a0, %lo(struct_unk_)($v0)

glabel collisiondat_add_velocity
/* AFFCC 800AF3CC C4800010 */  lwc1       $f0, 0x10($a0)
/* AFFD0 800AF3D0 C4A20000 */  lwc1       $f2, ($a1)
/* AFFD4 800AF3D4 46020000 */  add.s      $f0, $f0, $f2
/* AFFD8 800AF3D8 C4820014 */  lwc1       $f2, 0x14($a0)
/* AFFDC 800AF3DC E4800010 */  swc1       $f0, 0x10($a0)
/* AFFE0 800AF3E0 C4A00004 */  lwc1       $f0, 4($a1)
/* AFFE4 800AF3E4 46001080 */  add.s      $f2, $f2, $f0
/* AFFE8 800AF3E8 C4800018 */  lwc1       $f0, 0x18($a0)
/* AFFEC 800AF3EC E4820014 */  swc1       $f2, 0x14($a0)
/* AFFF0 800AF3F0 C4A20008 */  lwc1       $f2, 8($a1)
/* AFFF4 800AF3F4 46020000 */  add.s      $f0, $f0, $f2
/* AFFF8 800AF3F8 03E00008 */  jr         $ra
/* AFFFC 800AF3FC E4800018 */   swc1      $f0, 0x18($a0)

glabel func_800AF400
/* B0000 800AF400 C4800010 */  lwc1       $f0, 0x10($a0)
/* B0004 800AF404 C4A20000 */  lwc1       $f2, ($a1)
/* B0008 800AF408 46020001 */  sub.s      $f0, $f0, $f2
/* B000C 800AF40C C4820014 */  lwc1       $f2, 0x14($a0)
/* B0010 800AF410 E4800010 */  swc1       $f0, 0x10($a0)
/* B0014 800AF414 C4A00004 */  lwc1       $f0, 4($a1)
/* B0018 800AF418 46001081 */  sub.s      $f2, $f2, $f0
/* B001C 800AF41C C4800018 */  lwc1       $f0, 0x18($a0)
/* B0020 800AF420 E4820014 */  swc1       $f2, 0x14($a0)
/* B0024 800AF424 C4A20008 */  lwc1       $f2, 8($a1)
/* B0028 800AF428 46020001 */  sub.s      $f0, $f0, $f2
/* B002C 800AF42C 03E00008 */  jr         $ra
/* B0030 800AF430 E4800018 */   swc1      $f0, 0x18($a0)

glabel collision_velocity_func
/* B0034 800AF434 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B0038 800AF438 AFB00010 */  sw         $s0, 0x10($sp)
/* B003C 800AF43C 00808021 */  addu       $s0, $a0, $zero
/* B0040 800AF440 AFB10014 */  sw         $s1, 0x14($sp)
/* B0044 800AF444 AFBF0018 */  sw         $ra, 0x18($sp)
/* B0048 800AF448 F7B40020 */  sdc1       $f20, 0x20($sp)
/* B004C 800AF44C 0C02ABBB */  jal        vec3_normalize
/* B0050 800AF450 00A08821 */   addu      $s1, $a1, $zero
/* B0054 800AF454 C6080000 */  lwc1       $f8, ($s0)
/* B0058 800AF458 C62E0000 */  lwc1       $f14, ($s1)
/* B005C 800AF45C 460E4182 */  mul.s      $f6, $f8, $f14
/* B0060 800AF460 C60A0004 */  lwc1       $f10, 4($s0)
/* B0064 800AF464 C6240004 */  lwc1       $f4, 4($s1)
/* B0068 800AF468 46045102 */  mul.s      $f4, $f10, $f4
/* B006C 800AF46C C60C0008 */  lwc1       $f12, 8($s0)
/* B0070 800AF470 C6220008 */  lwc1       $f2, 8($s1)
/* B0074 800AF474 46026082 */  mul.s      $f2, $f12, $f2
/* B0078 800AF478 46043180 */  add.s      $f6, $f6, $f4
/* B007C 800AF47C 46023180 */  add.s      $f6, $f6, $f2
/* B0080 800AF480 44802000 */  mtc1       $zero, $f4
/* B0084 800AF484 4606203C */  c.lt.s     $f4, $f6
/* B0088 800AF488 00000000 */  nop
/* B008C 800AF48C 4500000A */  bc1f       .L800AF4B8
/* B0090 800AF490 46000506 */   mov.s     $f20, $f0
/* B0094 800AF494 46144002 */  mul.s      $f0, $f8, $f20
/* B0098 800AF498 00000000 */  nop
/* B009C 800AF49C 46145082 */  mul.s      $f2, $f10, $f20
/* B00A0 800AF4A0 00000000 */  nop
/* B00A4 800AF4A4 46146102 */  mul.s      $f4, $f12, $f20
/* B00A8 800AF4A8 E6000000 */  swc1       $f0, ($s0)
/* B00AC 800AF4AC E6020004 */  swc1       $f2, 4($s0)
/* B00B0 800AF4B0 0802BD47 */  j          .L800AF51C
/* B00B4 800AF4B4 E6040008 */   swc1      $f4, 8($s0)
.L800AF4B8:
/* B00B8 800AF4B8 46067082 */  mul.s      $f2, $f14, $f6
/* B00BC 800AF4BC 46021080 */  add.s      $f2, $f2, $f2
/* B00C0 800AF4C0 46024081 */  sub.s      $f2, $f8, $f2
/* B00C4 800AF4C4 E6020000 */  swc1       $f2, ($s0)
/* B00C8 800AF4C8 C6200004 */  lwc1       $f0, 4($s1)
/* B00CC 800AF4CC 46060002 */  mul.s      $f0, $f0, $f6
/* B00D0 800AF4D0 46000000 */  add.s      $f0, $f0, $f0
/* B00D4 800AF4D4 46005001 */  sub.s      $f0, $f10, $f0
/* B00D8 800AF4D8 E6000004 */  swc1       $f0, 4($s0)
/* B00DC 800AF4DC C6220008 */  lwc1       $f2, 8($s1)
/* B00E0 800AF4E0 46061082 */  mul.s      $f2, $f2, $f6
/* B00E4 800AF4E4 46021080 */  add.s      $f2, $f2, $f2
/* B00E8 800AF4E8 46026081 */  sub.s      $f2, $f12, $f2
/* B00EC 800AF4EC 02002021 */  addu       $a0, $s0, $zero
/* B00F0 800AF4F0 0C02ABBB */  jal        vec3_normalize
/* B00F4 800AF4F4 E6020008 */   swc1      $f2, 8($s0)
/* B00F8 800AF4F8 C6040000 */  lwc1       $f4, ($s0)
/* B00FC 800AF4FC 46142102 */  mul.s      $f4, $f4, $f20
/* B0100 800AF500 C6020004 */  lwc1       $f2, 4($s0)
/* B0104 800AF504 46141082 */  mul.s      $f2, $f2, $f20
/* B0108 800AF508 C6000008 */  lwc1       $f0, 8($s0)
/* B010C 800AF50C 46140002 */  mul.s      $f0, $f0, $f20
/* B0110 800AF510 E6040000 */  swc1       $f4, ($s0)
/* B0114 800AF514 E6020004 */  swc1       $f2, 4($s0)
/* B0118 800AF518 E6000008 */  swc1       $f0, 8($s0)
.L800AF51C:
/* B011C 800AF51C 8FBF0018 */  lw         $ra, 0x18($sp)
/* B0120 800AF520 8FB10014 */  lw         $s1, 0x14($sp)
/* B0124 800AF524 8FB00010 */  lw         $s0, 0x10($sp)
/* B0128 800AF528 D7B40020 */  ldc1       $f20, 0x20($sp)
/* B012C 800AF52C 03E00008 */  jr         $ra
/* B0130 800AF530 27BD0028 */   addiu     $sp, $sp, 0x28

glabel vec3A_plusBMulC
/* B0134 800AF534 44862000 */  mtc1       $a2, $f4
/* B0138 800AF538 C4A20000 */  lwc1       $f2, ($a1)
/* B013C 800AF53C 46041082 */  mul.s      $f2, $f2, $f4
/* B0140 800AF540 C4800000 */  lwc1       $f0, ($a0)
/* B0144 800AF544 46020000 */  add.s      $f0, $f0, $f2
/* B0148 800AF548 E4800000 */  swc1       $f0, ($a0)
/* B014C 800AF54C C4A20004 */  lwc1       $f2, 4($a1)
/* B0150 800AF550 46041082 */  mul.s      $f2, $f2, $f4
/* B0154 800AF554 C4800004 */  lwc1       $f0, 4($a0)
/* B0158 800AF558 46020000 */  add.s      $f0, $f0, $f2
/* B015C 800AF55C E4800004 */  swc1       $f0, 4($a0)
/* B0160 800AF560 C4A20008 */  lwc1       $f2, 8($a1)
/* B0164 800AF564 46041082 */  mul.s      $f2, $f2, $f4
/* B0168 800AF568 C4800008 */  lwc1       $f0, 8($a0)
/* B016C 800AF56C 46020000 */  add.s      $f0, $f0, $f2
/* B0170 800AF570 03E00008 */  jr         $ra
/* B0174 800AF574 E4800008 */   swc1      $f0, 8($a0)

glabel func_800AF578
/* B0178 800AF578 C4CA0000 */  lwc1       $f10, ($a2)
/* B017C 800AF57C C4840020 */  lwc1       $f4, 0x20($a0)
/* B0180 800AF580 46045102 */  mul.s      $f4, $f10, $f4
/* B0184 800AF584 C4C60004 */  lwc1       $f6, 4($a2)
/* B0188 800AF588 C4800024 */  lwc1       $f0, 0x24($a0)
/* B018C 800AF58C 46003182 */  mul.s      $f6, $f6, $f0
/* B0190 800AF590 C4C20008 */  lwc1       $f2, 8($a2)
/* B0194 800AF594 C4800028 */  lwc1       $f0, 0x28($a0)
/* B0198 800AF598 46001082 */  mul.s      $f2, $f2, $f0
/* B019C 800AF59C 46062100 */  add.s      $f4, $f4, $f6
/* B01A0 800AF5A0 00003821 */  addu       $a3, $zero, $zero
/* B01A4 800AF5A4 46022000 */  add.s      $f0, $f4, $f2
/* B01A8 800AF5A8 44802000 */  mtc1       $zero, $f4
/* B01AC 800AF5AC 4600203C */  c.lt.s     $f4, $f0
/* B01B0 800AF5B0 00000000 */  nop
/* B01B4 800AF5B4 45010002 */  bc1t       .L800AF5C0
/* B01B8 800AF5B8 8CA50004 */   lw        $a1, 4($a1)
/* B01BC 800AF5BC 46000007 */  neg.s      $f0, $f0
.L800AF5C0:
/* B01C0 800AF5C0 9482001E */  lhu        $v0, 0x1e($a0)
/* B01C4 800AF5C4 10400008 */  beqz       $v0, .L800AF5E8
/* B01C8 800AF5C8 8C820038 */   lw        $v0, 0x38($a0)
/* B01CC 800AF5CC 3C01800E */  lui        $at, %hi(D_800E3790)
/* B01D0 800AF5D0 D4223790 */  ldc1       $f2, %lo(D_800E3790)($at)
/* B01D4 800AF5D4 46000021 */  cvt.d.s    $f0, $f0
/* B01D8 800AF5D8 4622003C */  c.lt.d     $f0, $f2
/* B01DC 800AF5DC 00000000 */  nop
/* B01E0 800AF5E0 4500002F */  bc1f       .L800AF6A0
/* B01E4 800AF5E4 00000000 */   nop
.L800AF5E8:
/* B01E8 800AF5E8 8C430004 */  lw         $v1, 4($v0)
/* B01EC 800AF5EC C4A20000 */  lwc1       $f2, ($a1)
/* B01F0 800AF5F0 C4600000 */  lwc1       $f0, ($v1)
/* B01F4 800AF5F4 46001082 */  mul.s      $f2, $f2, $f0
/* B01F8 800AF5F8 460A203C */  c.lt.s     $f4, $f10
/* B01FC 800AF5FC 3C01800E */  lui        $at, %hi(D_800E3798)
/* B0200 800AF600 C4263798 */  lwc1       $f6, %lo(D_800E3798)($at)
/* B0204 800AF604 C4840010 */  lwc1       $f4, 0x10($a0)
/* B0208 800AF608 45000004 */  bc1f       .L800AF61C
/* B020C 800AF60C 46023201 */   sub.s     $f8, $f6, $f2
/* B0210 800AF610 46085002 */  mul.s      $f0, $f10, $f8
/* B0214 800AF614 0802BD8A */  j          .L800AF628
/* B0218 800AF618 46003001 */   sub.s     $f0, $f6, $f0
.L800AF61C:
/* B021C 800AF61C 46005007 */  neg.s      $f0, $f10
/* B0220 800AF620 46080002 */  mul.s      $f0, $f0, $f8
/* B0224 800AF624 46003001 */  sub.s      $f0, $f6, $f0
.L800AF628:
/* B0228 800AF628 46002002 */  mul.s      $f0, $f4, $f0
/* B022C 800AF62C E4800010 */  swc1       $f0, 0x10($a0)
/* B0230 800AF630 C4C20004 */  lwc1       $f2, 4($a2)
/* B0234 800AF634 44800000 */  mtc1       $zero, $f0
/* B0238 800AF638 4602003C */  c.lt.s     $f0, $f2
/* B023C 800AF63C 00000000 */  nop
/* B0240 800AF640 45010002 */  bc1t       .L800AF64C
/* B0244 800AF644 C4840014 */   lwc1      $f4, 0x14($a0)
/* B0248 800AF648 46001087 */  neg.s      $f2, $f2
.L800AF64C:
/* B024C 800AF64C 46081082 */  mul.s      $f2, $f2, $f8
/* B0250 800AF650 3C01800E */  lui        $at, %hi(D_800E379C)
/* B0254 800AF654 C420379C */  lwc1       $f0, %lo(D_800E379C)($at)
/* B0258 800AF658 46020001 */  sub.s      $f0, $f0, $f2
/* B025C 800AF65C 46002082 */  mul.s      $f2, $f4, $f0
/* B0260 800AF660 E4820014 */  swc1       $f2, 0x14($a0)
/* B0264 800AF664 C4C20008 */  lwc1       $f2, 8($a2)
/* B0268 800AF668 44800000 */  mtc1       $zero, $f0
/* B026C 800AF66C 4602003C */  c.lt.s     $f0, $f2
/* B0270 800AF670 00000000 */  nop
/* B0274 800AF674 45010002 */  bc1t       .L800AF680
/* B0278 800AF678 C4840018 */   lwc1      $f4, 0x18($a0)
/* B027C 800AF67C 46001087 */  neg.s      $f2, $f2
.L800AF680:
/* B0280 800AF680 46081082 */  mul.s      $f2, $f2, $f8
/* B0284 800AF684 3C01800E */  lui        $at, %hi(D_800E37A0)
/* B0288 800AF688 C42037A0 */  lwc1       $f0, %lo(D_800E37A0)($at)
/* B028C 800AF68C 46020001 */  sub.s      $f0, $f0, $f2
/* B0290 800AF690 46002082 */  mul.s      $f2, $f4, $f0
/* B0294 800AF694 E4820018 */  swc1       $f2, 0x18($a0)
/* B0298 800AF698 24070001 */  addiu      $a3, $zero, 1
/* B029C 800AF69C 8C820038 */  lw         $v0, 0x38($a0)
.L800AF6A0:
/* B02A0 800AF6A0 8C430004 */  lw         $v1, 4($v0)
/* B02A4 800AF6A4 C4A40004 */  lwc1       $f4, 4($a1)
/* B02A8 800AF6A8 C4600004 */  lwc1       $f0, 4($v1)
/* B02AC 800AF6AC 46002102 */  mul.s      $f4, $f4, $f0
/* B02B0 800AF6B0 C4860010 */  lwc1       $f6, 0x10($a0)
/* B02B4 800AF6B4 46043182 */  mul.s      $f6, $f6, $f4
/* B02B8 800AF6B8 C4820014 */  lwc1       $f2, 0x14($a0)
/* B02BC 800AF6BC 46041082 */  mul.s      $f2, $f2, $f4
/* B02C0 800AF6C0 C4800018 */  lwc1       $f0, 0x18($a0)
/* B02C4 800AF6C4 46040002 */  mul.s      $f0, $f0, $f4
/* B02C8 800AF6C8 00E01021 */  addu       $v0, $a3, $zero
/* B02CC 800AF6CC E4860010 */  swc1       $f6, 0x10($a0)
/* B02D0 800AF6D0 E4820014 */  swc1       $f2, 0x14($a0)
/* B02D4 800AF6D4 03E00008 */  jr         $ra
/* B02D8 800AF6D8 E4800018 */   swc1      $f0, 0x18($a0)

glabel PerformCallback
/* B02DC 800AF6DC 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* B02E0 800AF6E0 00C03821 */  addu       $a3, $a2, $zero
/* B02E4 800AF6E4 AFBF0050 */  sw         $ra, 0x50($sp)
/* B02E8 800AF6E8 94A2001C */  lhu        $v0, 0x1c($a1)
/* B02EC 800AF6EC 30421000 */  andi       $v0, $v0, 0x1000
/* B02F0 800AF6F0 1440002B */  bnez       $v0, .L800AF7A0
/* B02F4 800AF6F4 3086FFFF */   andi      $a2, $a0, 0xffff
/* B02F8 800AF6F8 24020002 */  addiu      $v0, $zero, 2
/* B02FC 800AF6FC 50C20014 */  beql       $a2, $v0, .L800AF750
/* B0300 800AF700 8CA20038 */   lw        $v0, 0x38($a1)
/* B0304 800AF704 28C20003 */  slti       $v0, $a2, 3
/* B0308 800AF708 10400005 */  beqz       $v0, .L800AF720
/* B030C 800AF70C 24020001 */   addiu     $v0, $zero, 1
/* B0310 800AF710 10C2000B */  beq        $a2, $v0, .L800AF740
/* B0314 800AF714 27A40010 */   addiu     $a0, $sp, 0x10
/* B0318 800AF718 0802BDE2 */  j          .L800AF788
/* B031C 800AF71C 3C05800E */   lui       $a1, %hi(D_800E0038)
.L800AF720:
/* B0320 800AF720 24020004 */  addiu      $v0, $zero, 4
/* B0324 800AF724 50C2000D */  beql       $a2, $v0, .L800AF75C
/* B0328 800AF728 8CA20038 */   lw        $v0, %lo(D_800E0038)($a1)
/* B032C 800AF72C 24020008 */  addiu      $v0, $zero, 8
/* B0330 800AF730 10C2000D */  beq        $a2, $v0, .L800AF768
/* B0334 800AF734 27A40010 */   addiu     $a0, $sp, 0x10
/* B0338 800AF738 0802BDE2 */  j          .L800AF788
/* B033C 800AF73C 3C05800E */   lui       $a1, %hi(D_800E0038)
.L800AF740:
/* B0340 800AF740 8CA20038 */  lw         $v0, %lo(D_800E0038)($a1)
/* B0344 800AF744 8C430004 */  lw         $v1, 4($v0)
/* B0348 800AF748 0802BDDC */  j          .L800AF770
/* B034C 800AF74C 8C62001C */   lw        $v0, 0x1c($v1)
.L800AF750:
/* B0350 800AF750 8C430004 */  lw         $v1, 4($v0)
/* B0354 800AF754 0802BDDC */  j          .L800AF770
/* B0358 800AF758 8C620020 */   lw        $v0, 0x20($v1)
.L800AF75C:
/* B035C 800AF75C 8C430004 */  lw         $v1, 4($v0)
/* B0360 800AF760 0802BDDC */  j          .L800AF770
/* B0364 800AF764 8C620024 */   lw        $v0, 0x24($v1)
.L800AF768:
/* B0368 800AF768 3C02800F */  lui        $v0, %hi(struct_unk_)
/* B036C 800AF76C 8C423620 */  lw         $v0, %lo(struct_unk_)($v0)
.L800AF770:
/* B0370 800AF770 1040000B */  beqz       $v0, .L800AF7A0
/* B0374 800AF774 00A02021 */   addu      $a0, $a1, $zero
/* B0378 800AF778 0040F809 */  jalr       $v0
/* B037C 800AF77C 00E02821 */   addu      $a1, $a3, $zero
/* B0380 800AF780 0802BDE9 */  j          .L800AF7A4
/* B0384 800AF784 8FBF0050 */   lw        $ra, 0x50($sp)
.L800AF788:
/* B0388 800AF788 0C0333AC */  jal        sprintf
/* B038C 800AF78C 24A537A4 */   addiu     $a1, $a1, 0x37a4
/* B0390 800AF790 3C04800E */  lui        $a0, %hi(D_800E37BC)
/* B0394 800AF794 248437BC */  addiu      $a0, $a0, %lo(D_800E37BC)
/* B0398 800AF798 0C025F2D */  jal        manualCrash
/* B039C 800AF79C 27A50010 */   addiu     $a1, $sp, 0x10
.L800AF7A0:
/* B03A0 800AF7A0 8FBF0050 */  lw         $ra, 0x50($sp)
.L800AF7A4:
/* B03A4 800AF7A4 03E00008 */  jr         $ra
/* B03A8 800AF7A8 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800AF7AC
/* B03AC 800AF7AC 8C820038 */  lw         $v0, 0x38($a0)
/* B03B0 800AF7B0 8C430004 */  lw         $v1, 4($v0)
/* B03B4 800AF7B4 AC65001C */  sw         $a1, 0x1c($v1)
/* B03B8 800AF7B8 8C850038 */  lw         $a1, 0x38($a0)
/* B03BC 800AF7BC 8CA30004 */  lw         $v1, 4($a1)
/* B03C0 800AF7C0 94620014 */  lhu        $v0, 0x14($v1)
/* B03C4 800AF7C4 34420001 */  ori        $v0, $v0, 1
/* B03C8 800AF7C8 03E00008 */  jr         $ra
/* B03CC 800AF7CC A4620014 */   sh        $v0, 0x14($v1)

glabel func_800AF7D0
/* B03D0 800AF7D0 8C820038 */  lw         $v0, 0x38($a0)
/* B03D4 800AF7D4 8C430004 */  lw         $v1, 4($v0)
/* B03D8 800AF7D8 AC650020 */  sw         $a1, 0x20($v1)
/* B03DC 800AF7DC 8C850038 */  lw         $a1, 0x38($a0)
/* B03E0 800AF7E0 8CA30004 */  lw         $v1, 4($a1)
/* B03E4 800AF7E4 94620014 */  lhu        $v0, 0x14($v1)
/* B03E8 800AF7E8 34420002 */  ori        $v0, $v0, 2
/* B03EC 800AF7EC 03E00008 */  jr         $ra
/* B03F0 800AF7F0 A4620014 */   sh        $v0, 0x14($v1)

glabel func_800AF7F4
/* B03F4 800AF7F4 8C820038 */  lw         $v0, 0x38($a0)
/* B03F8 800AF7F8 8C430004 */  lw         $v1, 4($v0)
/* B03FC 800AF7FC AC650024 */  sw         $a1, 0x24($v1)
/* B0400 800AF800 8C850038 */  lw         $a1, 0x38($a0)
/* B0404 800AF804 8CA30004 */  lw         $v1, 4($a1)
/* B0408 800AF808 94620014 */  lhu        $v0, 0x14($v1)
/* B040C 800AF80C 34420004 */  ori        $v0, $v0, 4
/* B0410 800AF810 03E00008 */  jr         $ra
/* B0414 800AF814 A4620014 */   sh        $v0, 0x14($v1)

glabel CollideCollisionSphereWithVoxelPolys
/* B0418 800AF818 27BDFF00 */  addiu      $sp, $sp, -0x100
/* B041C 800AF81C AFB600D0 */  sw         $s6, 0xd0($sp)
/* B0420 800AF820 0000B021 */  addu       $s6, $zero, $zero
/* B0424 800AF824 AFB300C4 */  sw         $s3, 0xc4($sp)
/* B0428 800AF828 00809821 */  addu       $s3, $a0, $zero
/* B042C 800AF82C AFBF00DC */  sw         $ra, 0xdc($sp)
/* B0430 800AF830 AFBE00D8 */  sw         $fp, 0xd8($sp)
/* B0434 800AF834 AFB700D4 */  sw         $s7, 0xd4($sp)
/* B0438 800AF838 AFB500CC */  sw         $s5, 0xcc($sp)
/* B043C 800AF83C AFB400C8 */  sw         $s4, 0xc8($sp)
/* B0440 800AF840 AFB200C0 */  sw         $s2, 0xc0($sp)
/* B0444 800AF844 AFB100BC */  sw         $s1, 0xbc($sp)
/* B0448 800AF848 AFB000B8 */  sw         $s0, 0xb8($sp)
/* B044C 800AF84C F7BA00F8 */  sdc1       $f26, 0xf8($sp)
/* B0450 800AF850 F7B800F0 */  sdc1       $f24, 0xf0($sp)
/* B0454 800AF854 F7B600E8 */  sdc1       $f22, 0xe8($sp)
/* B0458 800AF858 F7B400E0 */  sdc1       $f20, 0xe0($sp)
/* B045C 800AF85C AFA000A4 */  sw         $zero, 0xa4($sp)
/* B0460 800AF860 AFA000A8 */  sw         $zero, 0xa8($sp)
/* B0464 800AF864 AFA50104 */  sw         $a1, 0x104($sp)
/* B0468 800AF868 9662001C */  lhu        $v0, 0x1c($s3)
/* B046C 800AF86C 0000A021 */  addu       $s4, $zero, $zero
/* B0470 800AF870 AFA60108 */  sw         $a2, 0x108($sp)
/* B0474 800AF874 94A3000C */  lhu        $v1, 0xc($a1)
/* B0478 800AF878 30420200 */  andi       $v0, $v0, 0x200
/* B047C 800AF87C 0002102B */  sltu       $v0, $zero, $v0
/* B0480 800AF880 1060018F */  beqz       $v1, .L800AFEC0
/* B0484 800AF884 AFA200AC */   sw        $v0, 0xac($sp)
/* B0488 800AF888 4480D000 */  mtc1       $zero, $f26
/* B048C 800AF88C 3C01800E */  lui        $at, %hi(D_800E3828)
/* B0490 800AF890 D4383828 */  ldc1       $f24, %lo(D_800E3828)($at)
/* B0494 800AF894 8FA30104 */  lw         $v1, 0x104($sp)
.L800AF898:
/* B0498 800AF898 8C620000 */  lw         $v0, ($v1)
/* B049C 800AF89C 00161840 */  sll        $v1, $s6, 1
/* B04A0 800AF8A0 00621821 */  addu       $v1, $v1, $v0
/* B04A4 800AF8A4 94640000 */  lhu        $a0, ($v1)
/* B04A8 800AF8A8 8FA20108 */  lw         $v0, 0x108($sp)
/* B04AC 800AF8AC 8FA300AC */  lw         $v1, 0xac($sp)
/* B04B0 800AF8B0 00042140 */  sll        $a0, $a0, 5
/* B04B4 800AF8B4 10600005 */  beqz       $v1, .L800AF8CC
/* B04B8 800AF8B8 00449021 */   addu      $s2, $v0, $a0
/* B04BC 800AF8BC 9642001C */  lhu        $v0, 0x1c($s2)
/* B04C0 800AF8C0 30420200 */  andi       $v0, $v0, 0x200
/* B04C4 800AF8C4 14400177 */  bnez       $v0, .L800AFEA4
/* B04C8 800AF8C8 26D70001 */   addiu     $s7, $s6, 1
.L800AF8CC:
/* B04CC 800AF8CC 9643001C */  lhu        $v1, 0x1c($s2)
/* B04D0 800AF8D0 0000F021 */  addu       $fp, $zero, $zero
/* B04D4 800AF8D4 30620001 */  andi       $v0, $v1, 1
/* B04D8 800AF8D8 30630100 */  andi       $v1, $v1, 0x100
/* B04DC 800AF8DC 10600006 */  beqz       $v1, .L800AF8F8
/* B04E0 800AF8E0 2C550001 */   sltiu     $s5, $v0, 1
/* B04E4 800AF8E4 8E450000 */  lw         $a1, ($s2)
/* B04E8 800AF8E8 8E460004 */  lw         $a2, 4($s2)
/* B04EC 800AF8EC 8E470008 */  lw         $a3, 8($s2)
/* B04F0 800AF8F0 0C02AC05 */  jal        some_vec3_math_sphere
/* B04F4 800AF8F4 2644000C */   addiu     $a0, $s2, 0xc
.L800AF8F8:
/* B04F8 800AF8F8 C6760000 */  lwc1       $f22, ($s3)
/* B04FC 800AF8FC 8E620038 */  lw         $v0, 0x38($s3)
/* B0500 800AF900 8E430018 */  lw         $v1, 0x18($s2)
/* B0504 800AF904 8C440004 */  lw         $a0, 4($v0)
/* B0508 800AF908 8C650004 */  lw         $a1, 4($v1)
/* B050C 800AF90C 9642001C */  lhu        $v0, 0x1c($s2)
/* B0510 800AF910 C4820008 */  lwc1       $f2, 8($a0)
/* B0514 800AF914 C4A00008 */  lwc1       $f0, 8($a1)
/* B0518 800AF918 30422000 */  andi       $v0, $v0, 0x2000
/* B051C 800AF91C 10400002 */  beqz       $v0, .L800AF928
/* B0520 800AF920 46001500 */   add.s     $f20, $f2, $f0
/* B0524 800AF924 4480A000 */  mtc1       $zero, $f20
.L800AF928:
/* B0528 800AF928 26640004 */  addiu      $a0, $s3, 4
/* B052C 800AF92C 26650010 */  addiu      $a1, $s3, 0x10
/* B0530 800AF930 4614B000 */  add.s      $f0, $f22, $f20
/* B0534 800AF934 02403821 */  addu       $a3, $s2, $zero
/* B0538 800AF938 27B100A0 */  addiu      $s1, $sp, 0xa0
/* B053C 800AF93C 44060000 */  mfc1       $a2, $f0
/* B0540 800AF940 27B00060 */  addiu      $s0, $sp, 0x60
/* B0544 800AF944 AFB10010 */  sw         $s1, 0x10($sp)
/* B0548 800AF948 0C02BA91 */  jal        func_800AEA44
/* B054C 800AF94C AFB00014 */   sw        $s0, 0x14($sp)
/* B0550 800AF950 26630004 */  addiu      $v1, $s3, 4
/* B0554 800AF954 26640010 */  addiu      $a0, $s3, 0x10
/* B0558 800AF958 AFA300B0 */  sw         $v1, 0xb0($sp)
/* B055C 800AF95C 10400048 */  beqz       $v0, .L800AFA80
/* B0560 800AF960 AFA400B4 */   sw        $a0, 0xb4($sp)
/* B0564 800AF964 4614D03C */  c.lt.s     $f26, $f20
/* B0568 800AF968 00000000 */  nop
/* B056C 800AF96C 4500000C */  bc1f       .L800AF9A0
/* B0570 800AF970 C7A000A0 */   lwc1      $f0, 0xa0($sp)
/* B0574 800AF974 46000007 */  neg.s      $f0, $f0
/* B0578 800AF978 4614003C */  c.lt.s     $f0, $f20
/* B057C 800AF97C 00000000 */  nop
/* B0580 800AF980 45000007 */  bc1f       .L800AF9A0
/* B0584 800AF984 3C04800E */   lui       $a0, %hi(D_800E37CC)
/* B0588 800AF988 248437CC */  addiu      $a0, $a0, %lo(D_800E37CC)
/* B058C 800AF98C 3C05800E */  lui        $a1, %hi(D_800E37D8)
/* B0590 800AF990 0C025F2D */  jal        manualCrash
/* B0594 800AF994 24A537D8 */   addiu     $a1, $a1, %lo(D_800E37D8)
/* B0598 800AF998 0802BF98 */  j          .L800AFE60
/* B059C 800AF99C 26D70001 */   addiu     $s7, $s6, 1
.L800AF9A0:
/* B05A0 800AF9A0 12A00029 */  beqz       $s5, .L800AFA48
/* B05A4 800AF9A4 C7A000A0 */   lwc1      $f0, 0xa0($sp)
/* B05A8 800AF9A8 2650000C */  addiu      $s0, $s2, 0xc
/* B05AC 800AF9AC 46140000 */  add.s      $f0, $f0, $f20
/* B05B0 800AF9B0 8FA400B4 */  lw         $a0, 0xb4($sp)
/* B05B4 800AF9B4 02002821 */  addu       $a1, $s0, $zero
/* B05B8 800AF9B8 0C02BD0D */  jal        collision_velocity_func
/* B05BC 800AF9BC E7A000A0 */   swc1      $f0, 0xa0($sp)
/* B05C0 800AF9C0 C7A000A0 */  lwc1       $f0, 0xa0($sp)
/* B05C4 800AF9C4 8FA400B0 */  lw         $a0, 0xb0($sp)
/* B05C8 800AF9C8 46000007 */  neg.s      $f0, $f0
/* B05CC 800AF9CC 44060000 */  mfc1       $a2, $f0
/* B05D0 800AF9D0 0C02BD4D */  jal        vec3A_plusBMulC
/* B05D4 800AF9D4 02002821 */   addu      $a1, $s0, $zero
/* B05D8 800AF9D8 02602021 */  addu       $a0, $s3, $zero
/* B05DC 800AF9DC 8E450018 */  lw         $a1, 0x18($s2)
/* B05E0 800AF9E0 0C02BD5E */  jal        func_800AF578
/* B05E4 800AF9E4 02003021 */   addu      $a2, $s0, $zero
/* B05E8 800AF9E8 8FA30060 */  lw         $v1, 0x60($sp)
/* B05EC 800AF9EC 8FA40064 */  lw         $a0, 0x64($sp)
/* B05F0 800AF9F0 8FA50068 */  lw         $a1, 0x68($sp)
/* B05F4 800AF9F4 AE63002C */  sw         $v1, 0x2c($s3)
/* B05F8 800AF9F8 AE640030 */  sw         $a0, 0x30($s3)
/* B05FC 800AF9FC AE650034 */  sw         $a1, 0x34($s3)
/* B0600 800AFA00 8E43000C */  lw         $v1, 0xc($s2)
/* B0604 800AFA04 AE630020 */  sw         $v1, 0x20($s3)
/* B0608 800AFA08 8E440010 */  lw         $a0, 0x10($s2)
/* B060C 800AFA0C AE640024 */  sw         $a0, 0x24($s3)
/* B0610 800AFA10 8E430014 */  lw         $v1, 0x14($s2)
/* B0614 800AFA14 1040000A */  beqz       $v0, .L800AFA40
/* B0618 800AFA18 AE630028 */   sw        $v1, 0x28($s3)
/* B061C 800AFA1C 8E620038 */  lw         $v0, 0x38($s3)
/* B0620 800AFA20 8C440004 */  lw         $a0, 4($v0)
/* B0624 800AFA24 94830014 */  lhu        $v1, 0x14($a0)
/* B0628 800AFA28 30630001 */  andi       $v1, $v1, 1
/* B062C 800AFA2C 10600004 */  beqz       $v1, .L800AFA40
/* B0630 800AFA30 24040001 */   addiu     $a0, $zero, 1
/* B0634 800AFA34 02602821 */  addu       $a1, $s3, $zero
/* B0638 800AFA38 0C02BDB7 */  jal        PerformCallback
/* B063C 800AFA3C 02403021 */   addu      $a2, $s2, $zero
.L800AFA40:
/* B0640 800AFA40 0802BE9D */  j          .L800AFA74
/* B0644 800AFA44 24140001 */   addiu     $s4, $zero, 1
.L800AFA48:
/* B0648 800AFA48 1280000B */  beqz       $s4, .L800AFA78
/* B064C 800AFA4C 241E0001 */   addiu     $fp, $zero, 1
/* B0650 800AFA50 8E620038 */  lw         $v0, 0x38($s3)
/* B0654 800AFA54 8C440004 */  lw         $a0, 4($v0)
/* B0658 800AFA58 94830014 */  lhu        $v1, 0x14($a0)
/* B065C 800AFA5C 30630001 */  andi       $v1, $v1, 1
/* B0660 800AFA60 10600005 */  beqz       $v1, .L800AFA78
/* B0664 800AFA64 24040001 */   addiu     $a0, $zero, 1
/* B0668 800AFA68 02602821 */  addu       $a1, $s3, $zero
/* B066C 800AFA6C 0C02BDB7 */  jal        PerformCallback
/* B0670 800AFA70 02403021 */   addu      $a2, $s2, $zero
.L800AFA74:
/* B0674 800AFA74 241E0001 */  addiu      $fp, $zero, 1
.L800AFA78:
/* B0678 800AFA78 0802BF98 */  j          .L800AFE60
/* B067C 800AFA7C 26D70001 */   addiu     $s7, $s6, 1
.L800AFA80:
/* B0680 800AFA80 12A00108 */  beqz       $s5, .L800AFEA4
/* B0684 800AFA84 26D70001 */   addiu     $s7, $s6, 1
/* B0688 800AFA88 C7A000A0 */  lwc1       $f0, 0xa0($sp)
/* B068C 800AFA8C 46160001 */  sub.s      $f0, $f0, $f22
/* B0690 800AFA90 4600D03C */  c.lt.s     $f26, $f0
/* B0694 800AFA94 00000000 */  nop
/* B0698 800AFA98 45020001 */  bc1fl      .L800AFAA0
/* B069C 800AFA9C 46000007 */   neg.s     $f0, $f0
.L800AFAA0:
/* B06A0 800AFAA0 46000021 */  cvt.d.s    $f0, $f0
/* B06A4 800AFAA4 4638003C */  c.lt.d     $f0, $f24
/* B06A8 800AFAA8 00000000 */  nop
/* B06AC 800AFAAC 45020005 */  bc1fl      .L800AFAC4
/* B06B0 800AFAB0 9642001C */   lhu       $v0, 0x1c($s2)
/* B06B4 800AFAB4 9662001E */  lhu        $v0, 0x1e($s3)
/* B06B8 800AFAB8 54400001 */  bnel       $v0, $zero, .L800AFAC0
/* B06BC 800AFABC 24140001 */   addiu     $s4, $zero, 1
.L800AFAC0:
/* B06C0 800AFAC0 9642001C */  lhu        $v0, 0x1c($s2)
.L800AFAC4:
/* B06C4 800AFAC4 3042001C */  andi       $v0, $v0, 0x1c
/* B06C8 800AFAC8 10400076 */  beqz       $v0, .L800AFCA4
/* B06CC 800AFACC 26D70001 */   addiu     $s7, $s6, 1
/* B06D0 800AFAD0 C6760000 */  lwc1       $f22, ($s3)
/* B06D4 800AFAD4 00008021 */  addu       $s0, $zero, $zero
/* B06D8 800AFAD8 3C16800E */  lui        $s6, 0x800e
/* B06DC 800AFADC 3C15800E */  lui        $s5, 0x800e
/* B06E0 800AFAE0 24020001 */  addiu      $v0, $zero, 1
.L800AFAE4:
/* B06E4 800AFAE4 1202000F */  beq        $s0, $v0, .L800AFB24
/* B06E8 800AFAE8 2A020002 */   slti      $v0, $s0, 2
/* B06EC 800AFAEC 10400005 */  beqz       $v0, .L800AFB04
/* B06F0 800AFAF0 24020002 */   addiu     $v0, $zero, 2
/* B06F4 800AFAF4 12000007 */  beqz       $s0, .L800AFB14
/* B06F8 800AFAF8 26C437E0 */   addiu     $a0, $s6, 0x37e0
/* B06FC 800AFAFC 0802BED1 */  j          .L800AFB44
/* B0700 800AFB00 00000000 */   nop
.L800AFB04:
/* B0704 800AFB04 1202000B */  beq        $s0, $v0, .L800AFB34
/* B0708 800AFB08 26C437E0 */   addiu     $a0, $s6, 0x37e0
/* B070C 800AFB0C 0802BED1 */  j          .L800AFB44
/* B0710 800AFB10 00000000 */   nop
.L800AFB14:
/* B0714 800AFB14 9642001C */  lhu        $v0, 0x1c($s2)
/* B0718 800AFB18 30420004 */  andi       $v0, $v0, 4
/* B071C 800AFB1C 0802BED3 */  j          .L800AFB4C
/* B0720 800AFB20 AFA200A4 */   sw        $v0, 0xa4($sp)
.L800AFB24:
/* B0724 800AFB24 9642001C */  lhu        $v0, 0x1c($s2)
/* B0728 800AFB28 30420010 */  andi       $v0, $v0, 0x10
/* B072C 800AFB2C 0802BED3 */  j          .L800AFB4C
/* B0730 800AFB30 AFA200A4 */   sw        $v0, 0xa4($sp)
.L800AFB34:
/* B0734 800AFB34 9642001C */  lhu        $v0, 0x1c($s2)
/* B0738 800AFB38 30420008 */  andi       $v0, $v0, 8
/* B073C 800AFB3C 0802BED3 */  j          .L800AFB4C
/* B0740 800AFB40 AFA200A4 */   sw        $v0, 0xa4($sp)
.L800AFB44:
/* B0744 800AFB44 0C025F2D */  jal        manualCrash
/* B0748 800AFB48 26A53808 */   addiu     $a1, $s5, 0x3808
.L800AFB4C:
/* B074C 800AFB4C 8FA200A4 */  lw         $v0, 0xa4($sp)
/* B0750 800AFB50 1040004F */  beqz       $v0, .L800AFC90
/* B0754 800AFB54 26110001 */   addiu     $s1, $s0, 1
/* B0758 800AFB58 3C075555 */  lui        $a3, 0x5555
/* B075C 800AFB5C 34E75556 */  ori        $a3, $a3, 0x5556
/* B0760 800AFB60 00101080 */  sll        $v0, $s0, 2
/* B0764 800AFB64 02421021 */  addu       $v0, $s2, $v0
/* B0768 800AFB68 02602021 */  addu       $a0, $s3, $zero
/* B076C 800AFB6C 8C460000 */  lw         $a2, ($v0)
/* B0770 800AFB70 27A200A0 */  addiu      $v0, $sp, 0xa0
/* B0774 800AFB74 02270018 */  mult       $s1, $a3
/* B0778 800AFB78 00111FC3 */  sra        $v1, $s1, 0x1f
/* B077C 800AFB7C 4405B000 */  mfc1       $a1, $f22
/* B0780 800AFB80 27B00020 */  addiu      $s0, $sp, 0x20
/* B0784 800AFB84 AFA20010 */  sw         $v0, 0x10($sp)
/* B0788 800AFB88 00003810 */  mfhi       $a3
/* B078C 800AFB8C 00E33823 */  subu       $a3, $a3, $v1
/* B0790 800AFB90 00071040 */  sll        $v0, $a3, 1
/* B0794 800AFB94 00471021 */  addu       $v0, $v0, $a3
/* B0798 800AFB98 02221023 */  subu       $v0, $s1, $v0
/* B079C 800AFB9C 00021080 */  sll        $v0, $v0, 2
/* B07A0 800AFBA0 02421021 */  addu       $v0, $s2, $v0
/* B07A4 800AFBA4 8C470000 */  lw         $a3, ($v0)
/* B07A8 800AFBA8 27A30060 */  addiu      $v1, $sp, 0x60
/* B07AC 800AFBAC AFB00014 */  sw         $s0, 0x14($sp)
/* B07B0 800AFBB0 0C02BB7A */  jal        func_800AEDE8
/* B07B4 800AFBB4 AFA30018 */   sw        $v1, 0x18($sp)
/* B07B8 800AFBB8 10400027 */  beqz       $v0, .L800AFC58
/* B07BC 800AFBBC 8FA400B4 */   lw        $a0, 0xb4($sp)
/* B07C0 800AFBC0 0C02BD0D */  jal        collision_velocity_func
/* B07C4 800AFBC4 02002821 */   addu      $a1, $s0, $zero
/* B07C8 800AFBC8 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B07CC 800AFBCC C6600000 */  lwc1       $f0, ($s3)
/* B07D0 800AFBD0 46001081 */  sub.s      $f2, $f2, $f0
/* B07D4 800AFBD4 8FA400B0 */  lw         $a0, 0xb0($sp)
/* B07D8 800AFBD8 44061000 */  mfc1       $a2, $f2
/* B07DC 800AFBDC 0C02BD4D */  jal        vec3A_plusBMulC
/* B07E0 800AFBE0 02002821 */   addu      $a1, $s0, $zero
/* B07E4 800AFBE4 02602021 */  addu       $a0, $s3, $zero
/* B07E8 800AFBE8 8E450018 */  lw         $a1, 0x18($s2)
/* B07EC 800AFBEC 0C02BD5E */  jal        func_800AF578
/* B07F0 800AFBF0 02003021 */   addu      $a2, $s0, $zero
/* B07F4 800AFBF4 8FA30060 */  lw         $v1, 0x60($sp)
/* B07F8 800AFBF8 8FA40064 */  lw         $a0, 0x64($sp)
/* B07FC 800AFBFC 8FA50068 */  lw         $a1, 0x68($sp)
/* B0800 800AFC00 8FA60020 */  lw         $a2, 0x20($sp)
/* B0804 800AFC04 8FA70024 */  lw         $a3, 0x24($sp)
/* B0808 800AFC08 8FA80028 */  lw         $t0, 0x28($sp)
/* B080C 800AFC0C AE63002C */  sw         $v1, 0x2c($s3)
/* B0810 800AFC10 AE640030 */  sw         $a0, 0x30($s3)
/* B0814 800AFC14 AE650034 */  sw         $a1, 0x34($s3)
/* B0818 800AFC18 AE660020 */  sw         $a2, 0x20($s3)
/* B081C 800AFC1C AE670024 */  sw         $a3, 0x24($s3)
/* B0820 800AFC20 1040000A */  beqz       $v0, .L800AFC4C
/* B0824 800AFC24 AE680028 */   sw        $t0, 0x28($s3)
/* B0828 800AFC28 8E620038 */  lw         $v0, 0x38($s3)
/* B082C 800AFC2C 8C440004 */  lw         $a0, 4($v0)
/* B0830 800AFC30 94830014 */  lhu        $v1, 0x14($a0)
/* B0834 800AFC34 30630001 */  andi       $v1, $v1, 1
/* B0838 800AFC38 10600004 */  beqz       $v1, .L800AFC4C
/* B083C 800AFC3C 24040001 */   addiu     $a0, $zero, 1
/* B0840 800AFC40 02602821 */  addu       $a1, $s3, $zero
/* B0844 800AFC44 0C02BDB7 */  jal        PerformCallback
/* B0848 800AFC48 02403021 */   addu      $a2, $s2, $zero
.L800AFC4C:
/* B084C 800AFC4C 24140001 */  addiu      $s4, $zero, 1
/* B0850 800AFC50 0802BF29 */  j          .L800AFCA4
/* B0854 800AFC54 241E0001 */   addiu     $fp, $zero, 1
.L800AFC58:
/* B0858 800AFC58 C7A000A0 */  lwc1       $f0, 0xa0($sp)
/* B085C 800AFC5C 46160001 */  sub.s      $f0, $f0, $f22
/* B0860 800AFC60 4600D03C */  c.lt.s     $f26, $f0
/* B0864 800AFC64 00000000 */  nop
/* B0868 800AFC68 45020001 */  bc1fl      .L800AFC70
/* B086C 800AFC6C 46000007 */   neg.s     $f0, $f0
.L800AFC70:
/* B0870 800AFC70 46000021 */  cvt.d.s    $f0, $f0
/* B0874 800AFC74 4638003C */  c.lt.d     $f0, $f24
/* B0878 800AFC78 00000000 */  nop
/* B087C 800AFC7C 45000005 */  bc1f       .L800AFC94
/* B0880 800AFC80 00111400 */   sll       $v0, $s1, 0x10
/* B0884 800AFC84 9662001E */  lhu        $v0, 0x1e($s3)
/* B0888 800AFC88 54400001 */  bnel       $v0, $zero, .L800AFC90
/* B088C 800AFC8C 24140001 */   addiu     $s4, $zero, 1
.L800AFC90:
/* B0890 800AFC90 00111400 */  sll        $v0, $s1, 0x10
.L800AFC94:
/* B0894 800AFC94 00028403 */  sra        $s0, $v0, 0x10
/* B0898 800AFC98 2A030003 */  slti       $v1, $s0, 3
/* B089C 800AFC9C 1460FF91 */  bnez       $v1, .L800AFAE4
/* B08A0 800AFCA0 24020001 */   addiu     $v0, $zero, 1
.L800AFCA4:
/* B08A4 800AFCA4 17C00071 */  bnez       $fp, .L800AFE6C
/* B08A8 800AFCA8 9642001C */   lhu       $v0, 0x1c($s2)
/* B08AC 800AFCAC 304200E0 */  andi       $v0, $v0, 0xe0
/* B08B0 800AFCB0 1040006B */  beqz       $v0, .L800AFE60
/* B08B4 800AFCB4 00000000 */   nop
/* B08B8 800AFCB8 C6760000 */  lwc1       $f22, ($s3)
/* B08BC 800AFCBC 00008021 */  addu       $s0, $zero, $zero
/* B08C0 800AFCC0 3C150001 */  lui        $s5, 1
/* B08C4 800AFCC4 02408821 */  addu       $s1, $s2, $zero
/* B08C8 800AFCC8 3C16800E */  lui        $s6, 0x800e
.L800AFCCC:
/* B08CC 800AFCCC 24020001 */  addiu      $v0, $zero, 1
/* B08D0 800AFCD0 1202000F */  beq        $s0, $v0, .L800AFD10
/* B08D4 800AFCD4 2A020002 */   slti      $v0, $s0, 2
/* B08D8 800AFCD8 10400005 */  beqz       $v0, .L800AFCF0
/* B08DC 800AFCDC 24020002 */   addiu     $v0, $zero, 2
/* B08E0 800AFCE0 12000007 */  beqz       $s0, .L800AFD00
/* B08E4 800AFCE4 3C02800E */   lui       $v0, %hi(D_800E37E0)
/* B08E8 800AFCE8 0802BF4C */  j          .L800AFD30
/* B08EC 800AFCEC 244437E0 */   addiu     $a0, $v0, %lo(D_800E37E0)
.L800AFCF0:
/* B08F0 800AFCF0 1202000B */  beq        $s0, $v0, .L800AFD20
/* B08F4 800AFCF4 3C02800E */   lui       $v0, %hi(D_800E37E0)
/* B08F8 800AFCF8 0802BF4C */  j          .L800AFD30
/* B08FC 800AFCFC 244437E0 */   addiu     $a0, $v0, %lo(D_800E37E0)
.L800AFD00:
/* B0900 800AFD00 9642001C */  lhu        $v0, 0x1c($s2)
/* B0904 800AFD04 30420020 */  andi       $v0, $v0, 0x20
/* B0908 800AFD08 0802BF4E */  j          .L800AFD38
/* B090C 800AFD0C AFA200A8 */   sw        $v0, 0xa8($sp)
.L800AFD10:
/* B0910 800AFD10 9642001C */  lhu        $v0, 0x1c($s2)
/* B0914 800AFD14 30420040 */  andi       $v0, $v0, 0x40
/* B0918 800AFD18 0802BF4E */  j          .L800AFD38
/* B091C 800AFD1C AFA200A8 */   sw        $v0, 0xa8($sp)
.L800AFD20:
/* B0920 800AFD20 9642001C */  lhu        $v0, 0x1c($s2)
/* B0924 800AFD24 30420080 */  andi       $v0, $v0, 0x80
/* B0928 800AFD28 0802BF4E */  j          .L800AFD38
/* B092C 800AFD2C AFA200A8 */   sw        $v0, 0xa8($sp)
.L800AFD30:
/* B0930 800AFD30 0C025F2D */  jal        manualCrash
/* B0934 800AFD34 26C53818 */   addiu     $a1, $s6, 0x3818
.L800AFD38:
/* B0938 800AFD38 8FA300A8 */  lw         $v1, 0xa8($sp)
/* B093C 800AFD3C 10600041 */  beqz       $v1, .L800AFE44
/* B0940 800AFD40 02602021 */   addu      $a0, $s3, $zero
/* B0944 800AFD44 27A200A0 */  addiu      $v0, $sp, 0xa0
/* B0948 800AFD48 27B00020 */  addiu      $s0, $sp, 0x20
/* B094C 800AFD4C 4405B000 */  mfc1       $a1, $f22
/* B0950 800AFD50 4480A000 */  mtc1       $zero, $f20
/* B0954 800AFD54 8E260000 */  lw         $a2, ($s1)
/* B0958 800AFD58 4407A000 */  mfc1       $a3, $f20
/* B095C 800AFD5C 27A30060 */  addiu      $v1, $sp, 0x60
/* B0960 800AFD60 AFA20010 */  sw         $v0, 0x10($sp)
/* B0964 800AFD64 AFB00014 */  sw         $s0, 0x14($sp)
/* B0968 800AFD68 0C02BC14 */  jal        func_800AF050
/* B096C 800AFD6C AFA30018 */   sw        $v1, 0x18($sp)
/* B0970 800AFD70 10400026 */  beqz       $v0, .L800AFE0C
/* B0974 800AFD74 8FA400B4 */   lw        $a0, 0xb4($sp)
/* B0978 800AFD78 0C02BD0D */  jal        collision_velocity_func
/* B097C 800AFD7C 02002821 */   addu      $a1, $s0, $zero
/* B0980 800AFD80 C7A000A0 */  lwc1       $f0, 0xa0($sp)
/* B0984 800AFD84 46160001 */  sub.s      $f0, $f0, $f22
/* B0988 800AFD88 8FA400B0 */  lw         $a0, 0xb0($sp)
/* B098C 800AFD8C 44060000 */  mfc1       $a2, $f0
/* B0990 800AFD90 0C02BD4D */  jal        vec3A_plusBMulC
/* B0994 800AFD94 02002821 */   addu      $a1, $s0, $zero
/* B0998 800AFD98 02602021 */  addu       $a0, $s3, $zero
/* B099C 800AFD9C 8E450018 */  lw         $a1, 0x18($s2)
/* B09A0 800AFDA0 0C02BD5E */  jal        func_800AF578
/* B09A4 800AFDA4 02003021 */   addu      $a2, $s0, $zero
/* B09A8 800AFDA8 8FA30060 */  lw         $v1, 0x60($sp)
/* B09AC 800AFDAC 8FA40064 */  lw         $a0, 0x64($sp)
/* B09B0 800AFDB0 8FA50068 */  lw         $a1, 0x68($sp)
/* B09B4 800AFDB4 AE63002C */  sw         $v1, 0x2c($s3)
/* B09B8 800AFDB8 AE640030 */  sw         $a0, 0x30($s3)
/* B09BC 800AFDBC AE650034 */  sw         $a1, 0x34($s3)
/* B09C0 800AFDC0 8E43000C */  lw         $v1, 0xc($s2)
/* B09C4 800AFDC4 AE630020 */  sw         $v1, 0x20($s3)
/* B09C8 800AFDC8 8E440010 */  lw         $a0, 0x10($s2)
/* B09CC 800AFDCC AE640024 */  sw         $a0, 0x24($s3)
/* B09D0 800AFDD0 8E430014 */  lw         $v1, 0x14($s2)
/* B09D4 800AFDD4 1040000A */  beqz       $v0, .L800AFE00
/* B09D8 800AFDD8 AE630028 */   sw        $v1, 0x28($s3)
/* B09DC 800AFDDC 8E620038 */  lw         $v0, 0x38($s3)
/* B09E0 800AFDE0 8C440004 */  lw         $a0, 4($v0)
/* B09E4 800AFDE4 94830014 */  lhu        $v1, 0x14($a0)
/* B09E8 800AFDE8 30630001 */  andi       $v1, $v1, 1
/* B09EC 800AFDEC 10600004 */  beqz       $v1, .L800AFE00
/* B09F0 800AFDF0 24040001 */   addiu     $a0, $zero, 1
/* B09F4 800AFDF4 02602821 */  addu       $a1, $s3, $zero
/* B09F8 800AFDF8 0C02BDB7 */  jal        PerformCallback
/* B09FC 800AFDFC 02403021 */   addu      $a2, $s2, $zero
.L800AFE00:
/* B0A00 800AFE00 24140001 */  addiu      $s4, $zero, 1
/* B0A04 800AFE04 0802BF98 */  j          .L800AFE60
/* B0A08 800AFE08 241E0001 */   addiu     $fp, $zero, 1
.L800AFE0C:
/* B0A0C 800AFE0C C7A000A0 */  lwc1       $f0, 0xa0($sp)
/* B0A10 800AFE10 46160001 */  sub.s      $f0, $f0, $f22
/* B0A14 800AFE14 4600A03C */  c.lt.s     $f20, $f0
/* B0A18 800AFE18 00000000 */  nop
/* B0A1C 800AFE1C 45020001 */  bc1fl      .L800AFE24
/* B0A20 800AFE20 46000007 */   neg.s     $f0, $f0
.L800AFE24:
/* B0A24 800AFE24 46000021 */  cvt.d.s    $f0, $f0
/* B0A28 800AFE28 4638003C */  c.lt.d     $f0, $f24
/* B0A2C 800AFE2C 00000000 */  nop
/* B0A30 800AFE30 45000005 */  bc1f       .L800AFE48
/* B0A34 800AFE34 02A01021 */   addu      $v0, $s5, $zero
/* B0A38 800AFE38 9662001E */  lhu        $v0, 0x1e($s3)
/* B0A3C 800AFE3C 54400001 */  bnel       $v0, $zero, .L800AFE44
/* B0A40 800AFE40 24140001 */   addiu     $s4, $zero, 1
.L800AFE44:
/* B0A44 800AFE44 02A01021 */  addu       $v0, $s5, $zero
.L800AFE48:
/* B0A48 800AFE48 3C030001 */  lui        $v1, 1
/* B0A4C 800AFE4C 02A3A821 */  addu       $s5, $s5, $v1
/* B0A50 800AFE50 00028403 */  sra        $s0, $v0, 0x10
/* B0A54 800AFE54 2A030003 */  slti       $v1, $s0, 3
/* B0A58 800AFE58 1460FF9C */  bnez       $v1, .L800AFCCC
/* B0A5C 800AFE5C 26310004 */   addiu     $s1, $s1, 4
.L800AFE60:
/* B0A60 800AFE60 13C00011 */  beqz       $fp, .L800AFEA8
/* B0A64 800AFE64 8FA40104 */   lw        $a0, 0x104($sp)
/* B0A68 800AFE68 9642001C */  lhu        $v0, 0x1c($s2)
.L800AFE6C:
/* B0A6C 800AFE6C 30420002 */  andi       $v0, $v0, 2
/* B0A70 800AFE70 50400006 */  beql       $v0, $zero, .L800AFE8C
/* B0A74 800AFE74 9642001C */   lhu       $v0, 0x1c($s2)
/* B0A78 800AFE78 8E420018 */  lw         $v0, 0x18($s2)
/* B0A7C 800AFE7C 8E640038 */  lw         $a0, 0x38($s3)
/* B0A80 800AFE80 8C430000 */  lw         $v1, ($v0)
/* B0A84 800AFE84 AC830000 */  sw         $v1, ($a0)
/* B0A88 800AFE88 9642001C */  lhu        $v0, 0x1c($s2)
.L800AFE8C:
/* B0A8C 800AFE8C 30421000 */  andi       $v0, $v0, 0x1000
/* B0A90 800AFE90 10400004 */  beqz       $v0, .L800AFEA4
/* B0A94 800AFE94 24040008 */   addiu     $a0, $zero, 8
/* B0A98 800AFE98 02602821 */  addu       $a1, $s3, $zero
/* B0A9C 800AFE9C 0C02BDB7 */  jal        PerformCallback
/* B0AA0 800AFEA0 02403021 */   addu      $a2, $s2, $zero
.L800AFEA4:
/* B0AA4 800AFEA4 8FA40104 */  lw         $a0, 0x104($sp)
.L800AFEA8:
/* B0AA8 800AFEA8 00171C00 */  sll        $v1, $s7, 0x10
/* B0AAC 800AFEAC 9482000C */  lhu        $v0, 0xc($a0)
/* B0AB0 800AFEB0 0003B403 */  sra        $s6, $v1, 0x10
/* B0AB4 800AFEB4 02C2102A */  slt        $v0, $s6, $v0
/* B0AB8 800AFEB8 1440FE77 */  bnez       $v0, .L800AF898
/* B0ABC 800AFEBC 8FA30104 */   lw        $v1, 0x104($sp)
.L800AFEC0:
/* B0AC0 800AFEC0 1280000F */  beqz       $s4, .L800AFF00
/* B0AC4 800AFEC4 9662001E */   lhu       $v0, 0x1e($s3)
/* B0AC8 800AFEC8 1040000A */  beqz       $v0, .L800AFEF4
/* B0ACC 800AFECC 00000000 */   nop
/* B0AD0 800AFED0 8E620038 */  lw         $v0, 0x38($s3)
/* B0AD4 800AFED4 8C440004 */  lw         $a0, 4($v0)
/* B0AD8 800AFED8 94830014 */  lhu        $v1, 0x14($a0)
/* B0ADC 800AFEDC 30630002 */  andi       $v1, $v1, 2
/* B0AE0 800AFEE0 10600004 */  beqz       $v1, .L800AFEF4
/* B0AE4 800AFEE4 24040002 */   addiu     $a0, $zero, 2
/* B0AE8 800AFEE8 02602821 */  addu       $a1, $s3, $zero
/* B0AEC 800AFEEC 0C02BDB7 */  jal        PerformCallback
/* B0AF0 800AFEF0 00003021 */   addu      $a2, $zero, $zero
.L800AFEF4:
/* B0AF4 800AFEF4 1680000E */  bnez       $s4, .L800AFF30
/* B0AF8 800AFEF8 02801021 */   addu      $v0, $s4, $zero
/* B0AFC 800AFEFC 9662001E */  lhu        $v0, 0x1e($s3)
.L800AFF00:
/* B0B00 800AFF00 1040000B */  beqz       $v0, .L800AFF30
/* B0B04 800AFF04 02801021 */   addu      $v0, $s4, $zero
/* B0B08 800AFF08 8E620038 */  lw         $v0, 0x38($s3)
/* B0B0C 800AFF0C 8C440004 */  lw         $a0, 4($v0)
/* B0B10 800AFF10 94830014 */  lhu        $v1, 0x14($a0)
/* B0B14 800AFF14 30630004 */  andi       $v1, $v1, 4
/* B0B18 800AFF18 10600004 */  beqz       $v1, .L800AFF2C
/* B0B1C 800AFF1C 24040004 */   addiu     $a0, $zero, 4
/* B0B20 800AFF20 02602821 */  addu       $a1, $s3, $zero
/* B0B24 800AFF24 0C02BDB7 */  jal        PerformCallback
/* B0B28 800AFF28 00003021 */   addu      $a2, $zero, $zero
.L800AFF2C:
/* B0B2C 800AFF2C 02801021 */  addu       $v0, $s4, $zero
.L800AFF30:
/* B0B30 800AFF30 9663001E */  lhu        $v1, 0x1e($s3)
/* B0B34 800AFF34 8FBF00DC */  lw         $ra, 0xdc($sp)
/* B0B38 800AFF38 8FBE00D8 */  lw         $fp, 0xd8($sp)
/* B0B3C 800AFF3C 8FB700D4 */  lw         $s7, 0xd4($sp)
/* B0B40 800AFF40 8FB600D0 */  lw         $s6, 0xd0($sp)
/* B0B44 800AFF44 8FB500CC */  lw         $s5, 0xcc($sp)
/* B0B48 800AFF48 8FB200C0 */  lw         $s2, 0xc0($sp)
/* B0B4C 800AFF4C 8FB100BC */  lw         $s1, 0xbc($sp)
/* B0B50 800AFF50 8FB000B8 */  lw         $s0, 0xb8($sp)
/* B0B54 800AFF54 D7BA00F8 */  ldc1       $f26, 0xf8($sp)
/* B0B58 800AFF58 D7B800F0 */  ldc1       $f24, 0xf0($sp)
/* B0B5C 800AFF5C D7B600E8 */  ldc1       $f22, 0xe8($sp)
/* B0B60 800AFF60 D7B400E0 */  ldc1       $f20, 0xe0($sp)
/* B0B64 800AFF64 00741821 */  addu       $v1, $v1, $s4
/* B0B68 800AFF68 8FB400C8 */  lw         $s4, 0xc8($sp)
/* B0B6C 800AFF6C A663001E */  sh         $v1, 0x1e($s3)
/* B0B70 800AFF70 8FB300C4 */  lw         $s3, 0xc4($sp)
/* B0B74 800AFF74 03E00008 */  jr         $ra
/* B0B78 800AFF78 27BD0100 */   addiu     $sp, $sp, 0x100

glabel func_800AFF7C
/* B0B7C 800AFF7C 27BDFF48 */  addiu      $sp, $sp, -0xb8
/* B0B80 800AFF80 AFB000A8 */  sw         $s0, 0xa8($sp)
/* B0B84 800AFF84 00808021 */  addu       $s0, $a0, $zero
/* B0B88 800AFF88 AFB200B0 */  sw         $s2, 0xb0($sp)
/* B0B8C 800AFF8C 00A09021 */  addu       $s2, $a1, $zero
/* B0B90 800AFF90 26460004 */  addiu      $a2, $s2, 4
/* B0B94 800AFF94 27A200A0 */  addiu      $v0, $sp, 0xa0
/* B0B98 800AFF98 AFBF00B4 */  sw         $ra, 0xb4($sp)
/* B0B9C 800AFF9C AFB100AC */  sw         $s1, 0xac($sp)
/* B0BA0 800AFFA0 8E050000 */  lw         $a1, ($s0)
/* B0BA4 800AFFA4 27B10020 */  addiu      $s1, $sp, 0x20
/* B0BA8 800AFFA8 AFA20010 */  sw         $v0, 0x10($sp)
/* B0BAC 800AFFAC AFB10014 */  sw         $s1, 0x14($sp)
/* B0BB0 800AFFB0 8E470000 */  lw         $a3, ($s2)
/* B0BB4 800AFFB4 27A20060 */  addiu      $v0, $sp, 0x60
/* B0BB8 800AFFB8 0C02BC14 */  jal        func_800AF050
/* B0BBC 800AFFBC AFA20018 */   sw        $v0, 0x18($sp)
/* B0BC0 800AFFC0 10400018 */  beqz       $v0, .L800B0024
/* B0BC4 800AFFC4 00001021 */   addu      $v0, $zero, $zero
/* B0BC8 800AFFC8 9602001C */  lhu        $v0, 0x1c($s0)
/* B0BCC 800AFFCC 30420001 */  andi       $v0, $v0, 1
/* B0BD0 800AFFD0 14400014 */  bnez       $v0, .L800B0024
/* B0BD4 800AFFD4 24020001 */   addiu     $v0, $zero, 1
/* B0BD8 800AFFD8 9642001C */  lhu        $v0, 0x1c($s2)
/* B0BDC 800AFFDC 30420001 */  andi       $v0, $v0, 1
/* B0BE0 800AFFE0 14400010 */  bnez       $v0, .L800B0024
/* B0BE4 800AFFE4 24020001 */   addiu     $v0, $zero, 1
/* B0BE8 800AFFE8 26040010 */  addiu      $a0, $s0, 0x10
/* B0BEC 800AFFEC 0C02BD0D */  jal        collision_velocity_func
/* B0BF0 800AFFF0 02202821 */   addu      $a1, $s1, $zero
/* B0BF4 800AFFF4 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B0BF8 800AFFF8 C6000000 */  lwc1       $f0, ($s0)
/* B0BFC 800AFFFC 46001081 */  sub.s      $f2, $f2, $f0
/* B0C00 800B0000 26040004 */  addiu      $a0, $s0, 4
/* B0C04 800B0004 44061000 */  mfc1       $a2, $f2
/* B0C08 800B0008 0C02BD4D */  jal        vec3A_plusBMulC
/* B0C0C 800B000C 02202821 */   addu      $a1, $s1, $zero
/* B0C10 800B0010 02002021 */  addu       $a0, $s0, $zero
/* B0C14 800B0014 8E450038 */  lw         $a1, 0x38($s2)
/* B0C18 800B0018 0C02BD5E */  jal        func_800AF578
/* B0C1C 800B001C 02203021 */   addu      $a2, $s1, $zero
/* B0C20 800B0020 24020001 */  addiu      $v0, $zero, 1
.L800B0024:
/* B0C24 800B0024 8FBF00B4 */  lw         $ra, 0xb4($sp)
/* B0C28 800B0028 8FB200B0 */  lw         $s2, 0xb0($sp)
/* B0C2C 800B002C 8FB100AC */  lw         $s1, 0xac($sp)
/* B0C30 800B0030 8FB000A8 */  lw         $s0, 0xa8($sp)
/* B0C34 800B0034 03E00008 */  jr         $ra
/* B0C38 800B0038 27BD00B8 */   addiu     $sp, $sp, 0xb8

glabel func_800B003C
/* B0C3C 800B003C 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* B0C40 800B0040 F7B400C0 */  sdc1       $f20, 0xc0($sp)
/* B0C44 800B0044 4485A000 */  mtc1       $a1, $f20
/* B0C48 800B0048 AFB100AC */  sw         $s1, 0xac($sp)
/* B0C4C 800B004C 00808821 */  addu       $s1, $a0, $zero
/* B0C50 800B0050 AFBF00B8 */  sw         $ra, 0xb8($sp)
/* B0C54 800B0054 AFB300B4 */  sw         $s3, 0xb4($sp)
/* B0C58 800B0058 AFB200B0 */  sw         $s2, 0xb0($sp)
/* B0C5C 800B005C AFB000A8 */  sw         $s0, 0xa8($sp)
/* B0C60 800B0060 F7B600C8 */  sdc1       $f22, 0xc8($sp)
/* B0C64 800B0064 C6200000 */  lwc1       $f0, ($s1)
/* B0C68 800B0068 46140002 */  mul.s      $f0, $f0, $f20
/* B0C6C 800B006C 00C09021 */  addu       $s2, $a2, $zero
/* B0C70 800B0070 4487B000 */  mtc1       $a3, $f22
/* B0C74 800B0074 27A200A0 */  addiu      $v0, $sp, 0xa0
/* B0C78 800B0078 AFA20010 */  sw         $v0, 0x10($sp)
/* B0C7C 800B007C 44050000 */  mfc1       $a1, $f0
/* B0C80 800B0080 C6400000 */  lwc1       $f0, ($s2)
/* B0C84 800B0084 46160002 */  mul.s      $f0, $f0, $f22
/* B0C88 800B0088 26460004 */  addiu      $a2, $s2, 4
/* B0C8C 800B008C 27B00020 */  addiu      $s0, $sp, 0x20
/* B0C90 800B0090 8FB300E0 */  lw         $s3, 0xe0($sp)
/* B0C94 800B0094 44070000 */  mfc1       $a3, $f0
/* B0C98 800B0098 27A20060 */  addiu      $v0, $sp, 0x60
/* B0C9C 800B009C AFB00014 */  sw         $s0, 0x14($sp)
/* B0CA0 800B00A0 0C02BC48 */  jal        func_800AF120
/* B0CA4 800B00A4 AFA20018 */   sw        $v0, 0x18($sp)
/* B0CA8 800B00A8 5040001E */  beql       $v0, $zero, .L800B0124
/* B0CAC 800B00AC C6400000 */   lwc1      $f0, ($s2)
/* B0CB0 800B00B0 9622001C */  lhu        $v0, 0x1c($s1)
/* B0CB4 800B00B4 30420001 */  andi       $v0, $v0, 1
/* B0CB8 800B00B8 1440001F */  bnez       $v0, .L800B0138
/* B0CBC 800B00BC 24020001 */   addiu     $v0, $zero, 1
/* B0CC0 800B00C0 9642001C */  lhu        $v0, 0x1c($s2)
/* B0CC4 800B00C4 30420001 */  andi       $v0, $v0, 1
/* B0CC8 800B00C8 1440001B */  bnez       $v0, .L800B0138
/* B0CCC 800B00CC 24020001 */   addiu     $v0, $zero, 1
/* B0CD0 800B00D0 26240010 */  addiu      $a0, $s1, 0x10
/* B0CD4 800B00D4 0C02BD0D */  jal        collision_velocity_func
/* B0CD8 800B00D8 02002821 */   addu      $a1, $s0, $zero
/* B0CDC 800B00DC C6200000 */  lwc1       $f0, ($s1)
/* B0CE0 800B00E0 46140002 */  mul.s      $f0, $f0, $f20
/* B0CE4 800B00E4 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B0CE8 800B00E8 46001081 */  sub.s      $f2, $f2, $f0
/* B0CEC 800B00EC 26240004 */  addiu      $a0, $s1, 4
/* B0CF0 800B00F0 44061000 */  mfc1       $a2, $f2
/* B0CF4 800B00F4 0C02BD4D */  jal        vec3A_plusBMulC
/* B0CF8 800B00F8 02002821 */   addu      $a1, $s0, $zero
/* B0CFC 800B00FC 02202021 */  addu       $a0, $s1, $zero
/* B0D00 800B0100 8E450038 */  lw         $a1, 0x38($s2)
/* B0D04 800B0104 0C02BD5E */  jal        func_800AF578
/* B0D08 800B0108 02003021 */   addu      $a2, $s0, $zero
/* B0D0C 800B010C C6400000 */  lwc1       $f0, ($s2)
/* B0D10 800B0110 46160002 */  mul.s      $f0, $f0, $f22
/* B0D14 800B0114 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B0D18 800B0118 46001080 */  add.s      $f2, $f2, $f0
/* B0D1C 800B011C 0802C04D */  j          .L800B0134
/* B0D20 800B0120 24020001 */   addiu     $v0, $zero, 1
.L800B0124:
/* B0D24 800B0124 46140002 */  mul.s      $f0, $f0, $f20
/* B0D28 800B0128 C7A200A0 */  lwc1       $f2, 0xa0($sp)
/* B0D2C 800B012C 46001080 */  add.s      $f2, $f2, $f0
/* B0D30 800B0130 00001021 */  addu       $v0, $zero, $zero
.L800B0134:
/* B0D34 800B0134 E6620000 */  swc1       $f2, ($s3)
.L800B0138:
/* B0D38 800B0138 8FBF00B8 */  lw         $ra, 0xb8($sp)
/* B0D3C 800B013C 8FB300B4 */  lw         $s3, 0xb4($sp)
/* B0D40 800B0140 8FB200B0 */  lw         $s2, 0xb0($sp)
/* B0D44 800B0144 8FB100AC */  lw         $s1, 0xac($sp)
/* B0D48 800B0148 8FB000A8 */  lw         $s0, 0xa8($sp)
/* B0D4C 800B014C D7B600C8 */  ldc1       $f22, 0xc8($sp)
/* B0D50 800B0150 D7B400C0 */  ldc1       $f20, 0xc0($sp)
/* B0D54 800B0154 03E00008 */  jr         $ra
/* B0D58 800B0158 27BD00D0 */   addiu     $sp, $sp, 0xd0
/* B0D5C 800B015C 00000000 */  nop
