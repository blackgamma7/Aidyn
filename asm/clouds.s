.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel clouds_func
/* 2EF80 8002E380 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 2EF84 8002E384 3C04800F */  lui        $a0, 0x800f
/* 2EF88 8002E388 3C02800F */  lui        $v0, 0x800f
/* 2EF8C 8002E38C 3C05800F */  lui        $a1, 0x800f
/* 2EF90 8002E390 3C01800E */  lui        $at, %hi(D_800DAAF4)
/* 2EF94 8002E394 C420AAF4 */  lwc1       $f0, %lo(D_800DAAF4)($at)
/* 2EF98 8002E398 24030003 */  addiu      $v1, $zero, 3
/* 2EF9C 8002E39C AFB3001C */  sw         $s3, 0x1c($sp)
/* 2EFA0 8002E3A0 00809821 */  addu       $s3, $a0, $zero
/* 2EFA4 8002E3A4 AFB60028 */  sw         $s6, 0x28($sp)
/* 2EFA8 8002E3A8 E4408904 */  swc1       $f0, -0x76fc($v0)
/* 2EFAC 8002E3AC 90A2C6C8 */  lbu        $v0, -0x3938($a1)
/* 2EFB0 8002E3B0 3C16800F */  lui        $s6, 0x800f
/* 2EFB4 8002E3B4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 2EFB8 8002E3B8 AFB50024 */  sw         $s5, 0x24($sp)
/* 2EFBC 8002E3BC AFB40020 */  sw         $s4, 0x20($sp)
/* 2EFC0 8002E3C0 AFB20018 */  sw         $s2, 0x18($sp)
/* 2EFC4 8002E3C4 AFB10014 */  sw         $s1, 0x14($sp)
/* 2EFC8 8002E3C8 AFB00010 */  sw         $s0, 0x10($sp)
/* 2EFCC 8002E3CC 10430010 */  beq        $v0, $v1, .L8002E410
/* 2EFD0 8002E3D0 A480C6C0 */   sh        $zero, -0x3940($a0)
/* 2EFD4 8002E3D4 02604021 */  addu       $t0, $s3, $zero
/* 2EFD8 8002E3D8 24A7C6C8 */  addiu      $a3, $a1, -0x3938
/* 2EFDC 8002E3DC 24060003 */  addiu      $a2, $zero, 3
/* 2EFE0 8002E3E0 00002821 */  addu       $a1, $zero, $zero
/* 2EFE4 8002E3E4 24A40001 */  addiu      $a0, $a1, 1
.L8002E3E8:
/* 2EFE8 8002E3E8 00802821 */  addu       $a1, $a0, $zero
/* 2EFEC 8002E3EC 30A2FFFF */  andi       $v0, $a1, 0xffff
/* 2EFF0 8002E3F0 000218C0 */  sll        $v1, $v0, 3
/* 2EFF4 8002E3F4 00621823 */  subu       $v1, $v1, $v0
/* 2EFF8 8002E3F8 00031880 */  sll        $v1, $v1, 2
/* 2EFFC 8002E3FC 00671821 */  addu       $v1, $v1, $a3
/* 2F000 8002E400 90620000 */  lbu        $v0, ($v1)
/* 2F004 8002E404 5446FFF8 */  bnel       $v0, $a2, .L8002E3E8
/* 2F008 8002E408 24A40001 */   addiu     $a0, $a1, 1
/* 2F00C 8002E40C A504C6C0 */  sh         $a0, -0x3940($t0)
.L8002E410:
/* 2F010 8002E410 00008021 */  addu       $s0, $zero, $zero
/* 2F014 8002E414 24150001 */  addiu      $s5, $zero, 1
/* 2F018 8002E418 24140002 */  addiu      $s4, $zero, 2
/* 2F01C 8002E41C 3C02800F */  lui        $v0, %hi(clouds_borg8_array)
/* 2F020 8002E420 24515420 */  addiu      $s1, $v0, %lo(clouds_borg8_array)
/* 2F024 8002E424 02209021 */  addu       $s2, $s1, $zero
.L8002E428:
/* 2F028 8002E428 1215000F */  beq        $s0, $s5, .L8002E468
/* 2F02C 8002E42C 2A020002 */   slti      $v0, $s0, 2
/* 2F030 8002E430 10400005 */  beqz       $v0, .L8002E448
/* 2F034 8002E434 00000000 */   nop
/* 2F038 8002E438 12000007 */  beqz       $s0, .L8002E458
/* 2F03C 8002E43C 00000000 */   nop
/* 2F040 8002E440 0800B921 */  j          .L8002E484
/* 2F044 8002E444 AE200000 */   sw        $zero, ($s1)
.L8002E448:
/* 2F048 8002E448 1214000B */  beq        $s0, $s4, .L8002E478
/* 2F04C 8002E44C 00000000 */   nop
/* 2F050 8002E450 0800B921 */  j          .L8002E484
/* 2F054 8002E454 AE200000 */   sw        $zero, ($s1)
.L8002E458:
/* 2F058 8002E458 0C0290E2 */  jal        get_borg_8
/* 2F05C 8002E45C 2404018F */   addiu     $a0, $zero, 0x18f
/* 2F060 8002E460 0800B921 */  j          .L8002E484
/* 2F064 8002E464 AEC25420 */   sw        $v0, 0x5420($s6)
.L8002E468:
/* 2F068 8002E468 0C0290E2 */  jal        get_borg_8
/* 2F06C 8002E46C 24040190 */   addiu     $a0, $zero, 0x190
/* 2F070 8002E470 0800B921 */  j          .L8002E484
/* 2F074 8002E474 AE420004 */   sw        $v0, 4($s2)
.L8002E478:
/* 2F078 8002E478 0C0290E2 */  jal        get_borg_8
/* 2F07C 8002E47C 24040191 */   addiu     $a0, $zero, 0x191
/* 2F080 8002E480 AE420008 */  sw         $v0, 8($s2)
.L8002E484:
/* 2F084 8002E484 26100001 */  addiu      $s0, $s0, 1
/* 2F088 8002E488 2A020003 */  slti       $v0, $s0, 3
/* 2F08C 8002E48C 1440FFE6 */  bnez       $v0, .L8002E428
/* 2F090 8002E490 26310004 */   addiu     $s1, $s1, 4
/* 2F094 8002E494 3C05800E */  lui        $a1, %hi(D_800DAAE0)
/* 2F098 8002E498 24A5AAE0 */  addiu      $a1, $a1, %lo(D_800DAAE0)
/* 2F09C 8002E49C 9664C6C0 */  lhu        $a0, -0x3940($s3)
/* 2F0A0 8002E4A0 240600E2 */  addiu      $a2, $zero, 0xe2
/* 2F0A4 8002E4A4 0C025F9C */  jal        Malloc
/* 2F0A8 8002E4A8 00042080 */   sll       $a0, $a0, 2
/* 2F0AC 8002E4AC 00401821 */  addu       $v1, $v0, $zero
/* 2F0B0 8002E4B0 9664C6C0 */  lhu        $a0, -0x3940($s3)
/* 2F0B4 8002E4B4 3C02800F */  lui        $v0, %hi(cloud_pointer)
/* 2F0B8 8002E4B8 1080002A */  beqz       $a0, .L8002E564
/* 2F0BC 8002E4BC AC43C6C4 */   sw        $v1, %lo(cloud_pointer)($v0)
/* 2F0C0 8002E4C0 240E0001 */  addiu      $t6, $zero, 1
/* 2F0C4 8002E4C4 240D0002 */  addiu      $t5, $zero, 2
/* 2F0C8 8002E4C8 3C0B800F */  lui        $t3, %hi(clouds_borg8_array)
/* 2F0CC 8002E4CC 25695420 */  addiu      $t1, $t3, %lo(clouds_borg8_array)
/* 2F0D0 8002E4D0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2F0D4 8002E4D4 244C68A8 */  addiu      $t4, $v0, %lo(gGlobals)
/* 2F0D8 8002E4D8 3C0A800F */  lui        $t2, %hi(cloud_dat_array)
/* 2F0DC 8002E4DC 2542C6C8 */  addiu      $v0, $t2, %lo(cloud_dat_array)
/* 2F0E0 8002E4E0 24480018 */  addiu      $t0, $v0, 0x18
/* 2F0E4 8002E4E4 00003821 */  addu       $a3, $zero, $zero
/* 2F0E8 8002E4E8 00602821 */  addu       $a1, $v1, $zero
/* 2F0EC 8002E4EC 00403021 */  addu       $a2, $v0, $zero
.L8002E4F0:
/* 2F0F0 8002E4F0 90C30000 */  lbu        $v1, ($a2)
/* 2F0F4 8002E4F4 506E000C */  beql       $v1, $t6, .L8002E528
/* 2F0F8 8002E4F8 8D220004 */   lw        $v0, 4($t1)
/* 2F0FC 8002E4FC 28620002 */  slti       $v0, $v1, 2
/* 2F100 8002E500 10400005 */  beqz       $v0, .L8002E518
/* 2F104 8002E504 00000000 */   nop
/* 2F108 8002E508 10600007 */  beqz       $v1, .L8002E528
/* 2F10C 8002E50C 8D625420 */   lw        $v0, 0x5420($t3)
/* 2F110 8002E510 0800B94C */  j          .L8002E530
/* 2F114 8002E514 C5020000 */   lwc1      $f2, ($t0)
.L8002E518:
/* 2F118 8002E518 506D0003 */  beql       $v1, $t5, .L8002E528
/* 2F11C 8002E51C 8D220008 */   lw        $v0, 8($t1)
/* 2F120 8002E520 0800B94C */  j          .L8002E530
/* 2F124 8002E524 C5020000 */   lwc1      $f2, ($t0)
.L8002E528:
/* 2F128 8002E528 ACA20000 */  sw         $v0, ($a1)
/* 2F12C 8002E52C C5020000 */  lwc1       $f2, ($t0)
.L8002E530:
/* 2F130 8002E530 C580205C */  lwc1       $f0, 0x205c($t4)
/* 2F134 8002E534 4602003C */  c.lt.s     $f0, $f2
/* 2F138 8002E538 00000000 */  nop
/* 2F13C 8002E53C 45000003 */  bc1f       .L8002E54C
/* 2F140 8002E540 2542C6C8 */   addiu     $v0, $t2, -0x3938
/* 2F144 8002E544 00E21021 */  addu       $v0, $a3, $v0
/* 2F148 8002E548 A0400017 */  sb         $zero, 0x17($v0)
.L8002E54C:
/* 2F14C 8002E54C 2508001C */  addiu      $t0, $t0, 0x1c
/* 2F150 8002E550 24E7001C */  addiu      $a3, $a3, 0x1c
/* 2F154 8002E554 24A50004 */  addiu      $a1, $a1, 4
/* 2F158 8002E558 2484FFFF */  addiu      $a0, $a0, -1
/* 2F15C 8002E55C 1480FFE4 */  bnez       $a0, .L8002E4F0
/* 2F160 8002E560 24C6001C */   addiu     $a2, $a2, 0x1c
.L8002E564:
/* 2F164 8002E564 8FBF002C */  lw         $ra, 0x2c($sp)
/* 2F168 8002E568 8FB60028 */  lw         $s6, 0x28($sp)
/* 2F16C 8002E56C 8FB50024 */  lw         $s5, 0x24($sp)
/* 2F170 8002E570 8FB40020 */  lw         $s4, 0x20($sp)
/* 2F174 8002E574 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2F178 8002E578 8FB20018 */  lw         $s2, 0x18($sp)
/* 2F17C 8002E57C 8FB10014 */  lw         $s1, 0x14($sp)
/* 2F180 8002E580 8FB00010 */  lw         $s0, 0x10($sp)
/* 2F184 8002E584 03E00008 */  jr         $ra
/* 2F188 8002E588 27BD0030 */   addiu     $sp, $sp, 0x30

glabel clouds_free
/* 2F18C 8002E58C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 2F190 8002E590 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2F194 8002E594 3C13800F */  lui        $s3, 0x800f
/* 2F198 8002E598 AFB20018 */  sw         $s2, 0x18($sp)
/* 2F19C 8002E59C 3C12800E */  lui        $s2, 0x800e
/* 2F1A0 8002E5A0 3C02800F */  lui        $v0, %hi(clouds_borg8_array)
/* 2F1A4 8002E5A4 AFB00010 */  sw         $s0, 0x10($sp)
/* 2F1A8 8002E5A8 24505420 */  addiu      $s0, $v0, %lo(clouds_borg8_array)
/* 2F1AC 8002E5AC AFB10014 */  sw         $s1, 0x14($sp)
/* 2F1B0 8002E5B0 24110002 */  addiu      $s1, $zero, 2
/* 2F1B4 8002E5B4 AFBF0020 */  sw         $ra, 0x20($sp)
.L8002E5B8:
/* 2F1B8 8002E5B8 8E020000 */  lw         $v0, ($s0)
/* 2F1BC 8002E5BC 10400006 */  beqz       $v0, .L8002E5D8
/* 2F1C0 8002E5C0 26447ECC */   addiu     $a0, $s2, 0x7ecc
/* 2F1C4 8002E5C4 02002821 */  addu       $a1, $s0, $zero
/* 2F1C8 8002E5C8 24060004 */  addiu      $a2, $zero, 4
/* 2F1CC 8002E5CC 0C035867 */  jal        AllocFreeQueueItem
/* 2F1D0 8002E5D0 00003821 */   addu      $a3, $zero, $zero
/* 2F1D4 8002E5D4 AE000000 */  sw         $zero, ($s0)
.L8002E5D8:
/* 2F1D8 8002E5D8 2631FFFF */  addiu      $s1, $s1, -1
/* 2F1DC 8002E5DC 0621FFF6 */  bgez       $s1, .L8002E5B8
/* 2F1E0 8002E5E0 26100004 */   addiu     $s0, $s0, 4
/* 2F1E4 8002E5E4 3C02800F */  lui        $v0, %hi(D_800EC6C0)
/* 2F1E8 8002E5E8 9444C6C0 */  lhu        $a0, %lo(D_800EC6C0)($v0)
/* 2F1EC 8002E5EC 10800008 */  beqz       $a0, .L8002E610
/* 2F1F0 8002E5F0 3C02800F */   lui       $v0, %hi(cloud_pointer)
/* 2F1F4 8002E5F4 8C43C6C4 */  lw         $v1, %lo(cloud_pointer)($v0)
.L8002E5F8:
/* 2F1F8 8002E5F8 8C620000 */  lw         $v0, ($v1)
/* 2F1FC 8002E5FC 54400001 */  bnel       $v0, $zero, .L8002E604
/* 2F200 8002E600 AC600000 */   sw        $zero, ($v1)
.L8002E604:
/* 2F204 8002E604 2484FFFF */  addiu      $a0, $a0, -1
/* 2F208 8002E608 1480FFFB */  bnez       $a0, .L8002E5F8
/* 2F20C 8002E60C 24630004 */   addiu     $v1, $v1, 4
.L8002E610:
/* 2F210 8002E610 3C05800E */  lui        $a1, %hi(D_800DAAE0)
/* 2F214 8002E614 24A5AAE0 */  addiu      $a1, $a1, %lo(D_800DAAE0)
/* 2F218 8002E618 8E64C6C4 */  lw         $a0, -0x393c($s3)
/* 2F21C 8002E61C 0C02600C */  jal        Free
/* 2F220 8002E620 24060119 */   addiu     $a2, $zero, 0x119
/* 2F224 8002E624 8FBF0020 */  lw         $ra, 0x20($sp)
/* 2F228 8002E628 AE60C6C4 */  sw         $zero, -0x393c($s3)
/* 2F22C 8002E62C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2F230 8002E630 8FB20018 */  lw         $s2, 0x18($sp)
/* 2F234 8002E634 8FB10014 */  lw         $s1, 0x14($sp)
/* 2F238 8002E638 8FB00010 */  lw         $s0, 0x10($sp)
/* 2F23C 8002E63C 03E00008 */  jr         $ra
/* 2F240 8002E640 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8002E644
/* 2F244 8002E644 27BDFE78 */  addiu      $sp, $sp, -0x188
/* 2F248 8002E648 AFB1013C */  sw         $s1, 0x13c($sp)
/* 2F24C 8002E64C 3C02800E */  lui        $v0, %hi(Camera)
/* 2F250 8002E650 AFB00138 */  sw         $s0, 0x138($sp)
/* 2F254 8002E654 24506ABC */  addiu      $s0, $v0, %lo(Camera)
/* 2F258 8002E658 AFBF0154 */  sw         $ra, 0x154($sp)
/* 2F25C 8002E65C AFB60150 */  sw         $s6, 0x150($sp)
/* 2F260 8002E660 AFB5014C */  sw         $s5, 0x14c($sp)
/* 2F264 8002E664 AFB40148 */  sw         $s4, 0x148($sp)
/* 2F268 8002E668 AFB30144 */  sw         $s3, 0x144($sp)
/* 2F26C 8002E66C AFB20140 */  sw         $s2, 0x140($sp)
/* 2F270 8002E670 F7BE0180 */  sdc1       $f30, 0x180($sp)
/* 2F274 8002E674 F7BC0178 */  sdc1       $f28, 0x178($sp)
/* 2F278 8002E678 F7BA0170 */  sdc1       $f26, 0x170($sp)
/* 2F27C 8002E67C F7B80168 */  sdc1       $f24, 0x168($sp)
/* 2F280 8002E680 F7B60160 */  sdc1       $f22, 0x160($sp)
/* 2F284 8002E684 F7B40158 */  sdc1       $f20, 0x158($sp)
/* 2F288 8002E688 120000D1 */  beqz       $s0, .L8002E9D0
/* 2F28C 8002E68C 00808821 */   addu      $s1, $a0, $zero
/* 2F290 8002E690 2613FDEC */  addiu      $s3, $s0, -0x214
/* 2F294 8002E694 8663144C */  lh         $v1, 0x144c($s3)
/* 2F298 8002E698 24020003 */  addiu      $v0, $zero, 3
/* 2F29C 8002E69C 146200CD */  bne        $v1, $v0, .L8002E9D4
/* 2F2A0 8002E6A0 02201021 */   addu      $v0, $s1, $zero
/* 2F2A4 8002E6A4 0C00BA85 */  jal        func_8002EA14
/* 2F2A8 8002E6A8 00009021 */   addu      $s2, $zero, $zero
/* 2F2AC 8002E6AC C6040038 */  lwc1       $f4, 0x38($s0)
/* 2F2B0 8002E6B0 AFA0002C */  sw         $zero, 0x2c($sp)
/* 2F2B4 8002E6B4 C6000030 */  lwc1       $f0, 0x30($s0)
/* 2F2B8 8002E6B8 46042182 */  mul.s      $f6, $f4, $f4
/* 2F2BC 8002E6BC E7A00128 */  swc1       $f0, 0x128($sp)
/* 2F2C0 8002E6C0 C6020040 */  lwc1       $f2, 0x40($s0)
/* 2F2C4 8002E6C4 C60A0034 */  lwc1       $f10, 0x34($s0)
/* 2F2C8 8002E6C8 E7A00028 */  swc1       $f0, 0x28($sp)
/* 2F2CC 8002E6CC 46021302 */  mul.s      $f12, $f2, $f2
/* 2F2D0 8002E6D0 E7A40068 */  swc1       $f4, 0x68($sp)
/* 2F2D4 8002E6D4 E7AA012C */  swc1       $f10, 0x12c($sp)
/* 2F2D8 8002E6D8 E7AA0030 */  swc1       $f10, 0x30($sp)
/* 2F2DC 8002E6DC C600003C */  lwc1       $f0, 0x3c($s0)
/* 2F2E0 8002E6E0 460C3300 */  add.s      $f12, $f6, $f12
/* 2F2E4 8002E6E4 E7A20070 */  swc1       $f2, 0x70($sp)
/* 2F2E8 8002E6E8 0C0334B4 */  jal        _sqrtf
/* 2F2EC 8002E6EC E7A0006C */   swc1      $f0, 0x6c($sp)
/* 2F2F0 8002E6F0 E7A00130 */  swc1       $f0, 0x130($sp)
/* 2F2F4 8002E6F4 C7A0006C */  lwc1       $f0, 0x6c($sp)
/* 2F2F8 8002E6F8 0C0025B4 */  jal        get_hres
/* 2F2FC 8002E6FC E7A00134 */   swc1      $f0, 0x134($sp)
/* 2F300 8002E700 0C0025B7 */  jal        get_vres
/* 2F304 8002E704 00408021 */   addu      $s0, $v0, $zero
/* 2F308 8002E708 02202021 */  addu       $a0, $s1, $zero
/* 2F30C 8002E70C 24050006 */  addiu      $a1, $zero, 6
/* 2F310 8002E710 02003021 */  addu       $a2, $s0, $zero
/* 2F314 8002E714 0C0290ED */  jal        rsp_func
/* 2F318 8002E718 00403821 */   addu      $a3, $v0, $zero
/* 2F31C 8002E71C 00408821 */  addu       $s1, $v0, $zero
/* 2F320 8002E720 3C02800F */  lui        $v0, %hi(D_800EC6C0)
/* 2F324 8002E724 9443C6C0 */  lhu        $v1, %lo(D_800EC6C0)($v0)
/* 2F328 8002E728 106000A9 */  beqz       $v1, .L8002E9D0
/* 2F32C 8002E72C 0040B021 */   addu      $s6, $v0, $zero
/* 2F330 8002E730 0260A021 */  addu       $s4, $s3, $zero
/* 2F334 8002E734 3C02800F */  lui        $v0, %hi(cloud_dat_array)
/* 2F338 8002E738 2455C6C8 */  addiu      $s5, $v0, %lo(cloud_dat_array)
/* 2F33C 8002E73C 26B30017 */  addiu      $s3, $s5, 0x17
/* 2F340 8002E740 00008021 */  addu       $s0, $zero, $zero
.L8002E744:
/* 2F344 8002E744 27A400A8 */  addiu      $a0, $sp, 0xa8
/* 2F348 8002E748 02B01021 */  addu       $v0, $s5, $s0
/* 2F34C 8002E74C 00401821 */  addu       $v1, $v0, $zero
/* 2F350 8002E750 AFA000AC */  sw         $zero, 0xac($sp)
/* 2F354 8002E754 C4400004 */  lwc1       $f0, 4($v0)
/* 2F358 8002E758 C462000C */  lwc1       $f2, 0xc($v1)
/* 2F35C 8002E75C 46000007 */  neg.s      $f0, $f0
/* 2F360 8002E760 E7A000A8 */  swc1       $f0, 0xa8($sp)
/* 2F364 8002E764 46001087 */  neg.s      $f2, $f2
/* 2F368 8002E768 0C02ABBB */  jal        vec3_normalize
/* 2F36C 8002E76C E7A200B0 */   swc1      $f2, 0xb0($sp)
/* 2F370 8002E770 C7A200A8 */  lwc1       $f2, 0xa8($sp)
/* 2F374 8002E774 C7A400B0 */  lwc1       $f4, 0xb0($sp)
/* 2F378 8002E778 E7A200E8 */  swc1       $f2, 0xe8($sp)
/* 2F37C 8002E77C 3C01800E */  lui        $at, %hi(D_800DAAF8)
/* 2F380 8002E780 C422AAF8 */  lwc1       $f2, %lo(D_800DAAF8)($at)
/* 2F384 8002E784 27A400E8 */  addiu      $a0, $sp, 0xe8
/* 2F388 8002E788 E7A400EC */  swc1       $f4, 0xec($sp)
/* 2F38C 8002E78C 3C01800E */  lui        $at, %hi(D_800DAAFC)
/* 2F390 8002E790 C424AAFC */  lwc1       $f4, %lo(D_800DAAFC)($at)
/* 2F394 8002E794 46020003 */  div.s      $f0, $f0, $f2
/* 2F398 8002E798 0C02AB9F */  jal        vec2_normalize
/* 2F39C 8002E79C 46002601 */   sub.s     $f24, $f4, $f0
/* 2F3A0 8002E7A0 C7AA00E8 */  lwc1       $f10, 0xe8($sp)
/* 2F3A4 8002E7A4 C7A20128 */  lwc1       $f2, 0x128($sp)
/* 2F3A8 8002E7A8 46025102 */  mul.s      $f4, $f10, $f2
/* 2F3AC 8002E7AC C7AC00B0 */  lwc1       $f12, 0xb0($sp)
/* 2F3B0 8002E7B0 460C6302 */  mul.s      $f12, $f12, $f12
/* 2F3B4 8002E7B4 C7A600EC */  lwc1       $f6, 0xec($sp)
/* 2F3B8 8002E7B8 C7A2012C */  lwc1       $f2, 0x12c($sp)
/* 2F3BC 8002E7BC 46023002 */  mul.s      $f0, $f6, $f2
/* 2F3C0 8002E7C0 00000000 */  nop
/* 2F3C4 8002E7C4 46025202 */  mul.s      $f8, $f10, $f2
/* 2F3C8 8002E7C8 C7A200A8 */  lwc1       $f2, 0xa8($sp)
/* 2F3CC 8002E7CC 46021082 */  mul.s      $f2, $f2, $f2
/* 2F3D0 8002E7D0 C7AA0128 */  lwc1       $f10, 0x128($sp)
/* 2F3D4 8002E7D4 460A3182 */  mul.s      $f6, $f6, $f10
/* 2F3D8 8002E7D8 46002101 */  sub.s      $f4, $f4, $f0
/* 2F3DC 8002E7DC 3C01800E */  lui        $at, %hi(D_800DAB00)
/* 2F3E0 8002E7E0 C420AB00 */  lwc1       $f0, %lo(D_800DAB00)($at)
/* 2F3E4 8002E7E4 46002102 */  mul.s      $f4, $f4, $f0
/* 2F3E8 8002E7E8 460C1300 */  add.s      $f12, $f2, $f12
/* 2F3EC 8002E7EC 46064780 */  add.s      $f30, $f8, $f6
/* 2F3F0 8002E7F0 3C01800E */  lui        $at, %hi(D_800DAB04)
/* 2F3F4 8002E7F4 C420AB04 */  lwc1       $f0, %lo(D_800DAB04)($at)
/* 2F3F8 8002E7F8 0C0334B4 */  jal        _sqrtf
/* 2F3FC 8002E7FC 46002680 */   add.s     $f26, $f4, $f0
/* 2F400 8002E800 92620000 */  lbu        $v0, ($s3)
/* 2F404 8002E804 C68203A0 */  lwc1       $f2, 0x3a0($s4)
/* 2F408 8002E808 44826000 */  mtc1       $v0, $f12
/* 2F40C 8002E80C 46806320 */  cvt.s.w    $f12, $f12
/* 2F410 8002E810 46026082 */  mul.s      $f2, $f12, $f2
/* 2F414 8002E814 3C01800E */  lui        $at, %hi(D_800DAB08)
/* 2F418 8002E818 D424AB08 */  ldc1       $f4, %lo(D_800DAB08)($at)
/* 2F41C 8002E81C 460010A1 */  cvt.d.s    $f2, $f2
/* 2F420 8002E820 46241082 */  mul.d      $f2, $f2, $f4
/* 2F424 8002E824 46000286 */  mov.s      $f10, $f0
/* 2F428 8002E828 C7A00130 */  lwc1       $f0, 0x130($sp)
/* 2F42C 8002E82C 46005202 */  mul.s      $f8, $f10, $f0
/* 2F430 8002E830 C7A60134 */  lwc1       $f6, 0x134($sp)
/* 2F434 8002E834 46065102 */  mul.s      $f4, $f10, $f6
/* 2F438 8002E838 C7A600AC */  lwc1       $f6, 0xac($sp)
/* 2F43C 8002E83C 46003002 */  mul.s      $f0, $f6, $f0
/* 2F440 8002E840 C7AA0134 */  lwc1       $f10, 0x134($sp)
/* 2F444 8002E844 460A3182 */  mul.s      $f6, $f6, $f10
/* 2F448 8002E848 46002100 */  add.s      $f4, $f4, $f0
/* 2F44C 8002E84C 3C01800E */  lui        $at, %hi(D_800DAB10)
/* 2F450 8002E850 C420AB10 */  lwc1       $f0, %lo(D_800DAB10)($at)
/* 2F454 8002E854 46002102 */  mul.s      $f4, $f4, $f0
/* 2F458 8002E858 46064701 */  sub.s      $f28, $f8, $f6
/* 2F45C 8002E85C 46201520 */  cvt.s.d    $f20, $f2
/* 2F460 8002E860 3C01800E */  lui        $at, %hi(D_800DAB14)
/* 2F464 8002E864 C420AB14 */  lwc1       $f0, %lo(D_800DAB14)($at)
/* 2F468 8002E868 4614603C */  c.lt.s     $f12, $f20
/* 2F46C 8002E86C 00000000 */  nop
/* 2F470 8002E870 45000003 */  bc1f       .L8002E880
/* 2F474 8002E874 46002580 */   add.s     $f22, $f4, $f0
/* 2F478 8002E878 0800BA25 */  j          .L8002E894
/* 2F47C 8002E87C 46006506 */   mov.s     $f20, $f12
.L8002E880:
/* 2F480 8002E880 44800000 */  mtc1       $zero, $f0
/* 2F484 8002E884 4600A03C */  c.lt.s     $f20, $f0
/* 2F488 8002E888 00000000 */  nop
/* 2F48C 8002E88C 45030001 */  bc1tl      .L8002E894
/* 2F490 8002E890 46000506 */   mov.s     $f20, $f0
.L8002E894:
/* 2F494 8002E894 0C0334B4 */  jal        _sqrtf
/* 2F498 8002E898 4600C306 */   mov.s     $f12, $f24
/* 2F49C 8002E89C 3C01800E */  lui        $at, %hi(D_800DAB18)
/* 2F4A0 8002E8A0 C424AB18 */  lwc1       $f4, %lo(D_800DAB18)($at)
/* 2F4A4 8002E8A4 92620000 */  lbu        $v0, ($s3)
/* 2F4A8 8002E8A8 4604C102 */  mul.s      $f4, $f24, $f4
/* 2F4AC 8002E8AC 00121880 */  sll        $v1, $s2, 2
/* 2F4B0 8002E8B0 44821000 */  mtc1       $v0, $f2
/* 2F4B4 8002E8B4 468010A0 */  cvt.s.w    $f2, $f2
/* 2F4B8 8002E8B8 3C02800F */  lui        $v0, %hi(cloud_pointer)
/* 2F4BC 8002E8BC 8C44C6C4 */  lw         $a0, %lo(cloud_pointer)($v0)
/* 2F4C0 8002E8C0 46141081 */  sub.s      $f2, $f2, $f20
/* 2F4C4 8002E8C4 00642821 */  addu       $a1, $v1, $a0
/* 2F4C8 8002E8C8 8CA30000 */  lw         $v1, ($a1)
/* 2F4CC 8002E8CC 46001502 */  mul.s      $f20, $f2, $f0
/* 2F4D0 8002E8D0 9462000A */  lhu        $v0, 0xa($v1)
/* 2F4D4 8002E8D4 44820000 */  mtc1       $v0, $f0
/* 2F4D8 8002E8D8 46800020 */  cvt.s.w    $f0, $f0
/* 2F4DC 8002E8DC 46180002 */  mul.s      $f0, $f0, $f24
/* 2F4E0 8002E8E0 9462000C */  lhu        $v0, 0xc($v1)
/* 2F4E4 8002E8E4 44821000 */  mtc1       $v0, $f2
/* 2F4E8 8002E8E8 468010A0 */  cvt.s.w    $f2, $f2
/* 2F4EC 8002E8EC 46181082 */  mul.s      $f2, $f2, $f24
/* 2F4F0 8002E8F0 3C01800E */  lui        $at, %hi(D_800DAB1C)
/* 2F4F4 8002E8F4 C426AB1C */  lwc1       $f6, %lo(D_800DAB1C)($at)
/* 2F4F8 8002E8F8 46060002 */  mul.s      $f0, $f0, $f6
/* 2F4FC 8002E8FC 00000000 */  nop
/* 2F500 8002E900 46061082 */  mul.s      $f2, $f2, $f6
/* 2F504 8002E904 4604B581 */  sub.s      $f22, $f22, $f4
/* 2F508 8002E908 4600D681 */  sub.s      $f26, $f26, $f0
/* 2F50C 8002E90C 44800000 */  mtc1       $zero, $f0
/* 2F510 8002E910 461E003C */  c.lt.s     $f0, $f30
/* 2F514 8002E914 00000000 */  nop
/* 2F518 8002E918 45000027 */  bc1f       .L8002E9B8
/* 2F51C 8002E91C 4602B581 */   sub.s     $f22, $f22, $f2
/* 2F520 8002E920 461C003C */  c.lt.s     $f0, $f28
/* 2F524 8002E924 00000000 */  nop
/* 2F528 8002E928 45020024 */  bc1fl      .L8002E9BC
/* 2F52C 8002E92C 2673001C */   addiu     $s3, $s3, 0x1c
/* 2F530 8002E930 4600C021 */  cvt.d.s    $f0, $f24
/* 2F534 8002E934 3C01800E */  lui        $at, %hi(D_800DAB20)
/* 2F538 8002E938 C424AB20 */  lwc1       $f4, %lo(D_800DAB20)($at)
/* 2F53C 8002E93C 92821478 */  lbu        $v0, 0x1478($s4)
/* 2F540 8002E940 3C01800E */  lui        $at, %hi(D_800DAB28)
/* 2F544 8002E944 D422AB28 */  ldc1       $f2, %lo(D_800DAB28)($at)
/* 2F548 8002E948 4614203E */  c.le.s     $f4, $f20
/* 2F54C 8002E94C AFA20018 */  sw         $v0, 0x18($sp)
/* 2F550 8002E950 92821479 */  lbu        $v0, 0x1479($s4)
/* 2F554 8002E954 9283147A */  lbu        $v1, 0x147a($s4)
/* 2F558 8002E958 46220000 */  add.d      $f0, $f0, $f2
/* 2F55C 8002E95C AFA2001C */  sw         $v0, 0x1c($sp)
/* 2F560 8002E960 AFA30020 */  sw         $v1, 0x20($sp)
/* 2F564 8002E964 46200020 */  cvt.s.d    $f0, $f0
/* 2F568 8002E968 E7A00010 */  swc1       $f0, 0x10($sp)
/* 2F56C 8002E96C 45010005 */  bc1t       .L8002E984
/* 2F570 8002E970 E7A00014 */   swc1      $f0, 0x14($sp)
/* 2F574 8002E974 4600A28D */  trunc.w.s  $f10, $f20
/* 2F578 8002E978 44035000 */  mfc1       $v1, $f10
/* 2F57C 8002E97C 0800BA67 */  j          .L8002E99C
/* 2F580 8002E980 306200FF */   andi      $v0, $v1, 0xff
.L8002E984:
/* 2F584 8002E984 4604A001 */  sub.s      $f0, $f20, $f4
/* 2F588 8002E988 4600008D */  trunc.w.s  $f2, $f0
/* 2F58C 8002E98C 44031000 */  mfc1       $v1, $f2
/* 2F590 8002E990 3C028000 */  lui        $v0, 0x8000
/* 2F594 8002E994 00621825 */  or         $v1, $v1, $v0
/* 2F598 8002E998 306200FF */  andi       $v0, $v1, 0xff
.L8002E99C:
/* 2F59C 8002E99C AFA20024 */  sw         $v0, 0x24($sp)
/* 2F5A0 8002E9A0 8CA50000 */  lw         $a1, ($a1)
/* 2F5A4 8002E9A4 4406D000 */  mfc1       $a2, $f26
/* 2F5A8 8002E9A8 4407B000 */  mfc1       $a3, $f22
/* 2F5AC 8002E9AC 0C0299A8 */  jal        pass_to_borg_image_draw
/* 2F5B0 8002E9B0 02202021 */   addu      $a0, $s1, $zero
/* 2F5B4 8002E9B4 00408821 */  addu       $s1, $v0, $zero
.L8002E9B8:
/* 2F5B8 8002E9B8 2673001C */  addiu      $s3, $s3, 0x1c
.L8002E9BC:
/* 2F5BC 8002E9BC 96C2C6C0 */  lhu        $v0, -0x3940($s6)
/* 2F5C0 8002E9C0 26520001 */  addiu      $s2, $s2, 1
/* 2F5C4 8002E9C4 0242102A */  slt        $v0, $s2, $v0
/* 2F5C8 8002E9C8 1440FF5E */  bnez       $v0, .L8002E744
/* 2F5CC 8002E9CC 2610001C */   addiu     $s0, $s0, 0x1c
.L8002E9D0:
/* 2F5D0 8002E9D0 02201021 */  addu       $v0, $s1, $zero
.L8002E9D4:
/* 2F5D4 8002E9D4 8FBF0154 */  lw         $ra, 0x154($sp)
/* 2F5D8 8002E9D8 8FB60150 */  lw         $s6, 0x150($sp)
/* 2F5DC 8002E9DC 8FB5014C */  lw         $s5, 0x14c($sp)
/* 2F5E0 8002E9E0 8FB40148 */  lw         $s4, 0x148($sp)
/* 2F5E4 8002E9E4 8FB30144 */  lw         $s3, 0x144($sp)
/* 2F5E8 8002E9E8 8FB20140 */  lw         $s2, 0x140($sp)
/* 2F5EC 8002E9EC 8FB1013C */  lw         $s1, 0x13c($sp)
/* 2F5F0 8002E9F0 8FB00138 */  lw         $s0, 0x138($sp)
/* 2F5F4 8002E9F4 D7BE0180 */  ldc1       $f30, 0x180($sp)
/* 2F5F8 8002E9F8 D7BC0178 */  ldc1       $f28, 0x178($sp)
/* 2F5FC 8002E9FC D7BA0170 */  ldc1       $f26, 0x170($sp)
/* 2F600 8002EA00 D7B80168 */  ldc1       $f24, 0x168($sp)
/* 2F604 8002EA04 D7B60160 */  ldc1       $f22, 0x160($sp)
/* 2F608 8002EA08 D7B40158 */  ldc1       $f20, 0x158($sp)
/* 2F60C 8002EA0C 03E00008 */  jr         $ra
/* 2F610 8002EA10 27BD0188 */   addiu     $sp, $sp, 0x188

glabel func_8002EA14
/* 2F614 8002EA14 3C02800F */  lui        $v0, %hi(D_800EC6C0)
/* 2F618 8002EA18 9443C6C0 */  lhu        $v1, %lo(D_800EC6C0)($v0)
/* 2F61C 8002EA1C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 2F620 8002EA20 AFB40020 */  sw         $s4, 0x20($sp)
/* 2F624 8002EA24 AFBF0034 */  sw         $ra, 0x34($sp)
/* 2F628 8002EA28 AFBE0030 */  sw         $fp, 0x30($sp)
/* 2F62C 8002EA2C AFB7002C */  sw         $s7, 0x2c($sp)
/* 2F630 8002EA30 AFB60028 */  sw         $s6, 0x28($sp)
/* 2F634 8002EA34 AFB50024 */  sw         $s5, 0x24($sp)
/* 2F638 8002EA38 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2F63C 8002EA3C AFB20018 */  sw         $s2, 0x18($sp)
/* 2F640 8002EA40 AFB10014 */  sw         $s1, 0x14($sp)
/* 2F644 8002EA44 AFB00010 */  sw         $s0, 0x10($sp)
/* 2F648 8002EA48 F7B40038 */  sdc1       $f20, 0x38($sp)
/* 2F64C 8002EA4C 10600052 */  beqz       $v1, .L8002EB98
/* 2F650 8002EA50 0000A021 */   addu      $s4, $zero, $zero
/* 2F654 8002EA54 3C17800F */  lui        $s7, 0x800f
/* 2F658 8002EA58 3C01800E */  lui        $at, %hi(D_800DAB30)
/* 2F65C 8002EA5C C434AB30 */  lwc1       $f20, %lo(D_800DAB30)($at)
/* 2F660 8002EA60 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2F664 8002EA64 245668A8 */  addiu      $s6, $v0, %lo(gGlobals)
/* 2F668 8002EA68 00009821 */  addu       $s3, $zero, $zero
/* 2F66C 8002EA6C 3C1E800F */  lui        $fp, %hi(cloud_dat_array)
/* 2F670 8002EA70 27D5C6C8 */  addiu      $s5, $fp, %lo(cloud_dat_array)
/* 2F674 8002EA74 02A09021 */  addu       $s2, $s5, $zero
.L8002EA78:
/* 2F678 8002EA78 8EE31BBC */  lw         $v1, 0x1bbc($s7)
/* 2F67C 8002EA7C C4620014 */  lwc1       $f2, 0x14($v1)
/* 2F680 8002EA80 46141082 */  mul.s      $f2, $f2, $f20
/* 2F684 8002EA84 26A20004 */  addiu      $v0, $s5, 4
/* 2F688 8002EA88 02628021 */  addu       $s0, $s3, $v0
/* 2F68C 8002EA8C C6000000 */  lwc1       $f0, ($s0)
/* 2F690 8002EA90 46020000 */  add.s      $f0, $f0, $f2
/* 2F694 8002EA94 E6000000 */  swc1       $f0, ($s0)
/* 2F698 8002EA98 C462001C */  lwc1       $f2, 0x1c($v1)
/* 2F69C 8002EA9C 46141082 */  mul.s      $f2, $f2, $f20
/* 2F6A0 8002EAA0 26A2000C */  addiu      $v0, $s5, 0xc
/* 2F6A4 8002EAA4 02628821 */  addu       $s1, $s3, $v0
/* 2F6A8 8002EAA8 C62C0000 */  lwc1       $f12, ($s1)
/* 2F6AC 8002EAAC 46026300 */  add.s      $f12, $f12, $f2
/* 2F6B0 8002EAB0 E62C0000 */  swc1       $f12, ($s1)
/* 2F6B4 8002EAB4 460C6302 */  mul.s      $f12, $f12, $f12
/* 2F6B8 8002EAB8 C6000000 */  lwc1       $f0, ($s0)
/* 2F6BC 8002EABC 46000002 */  mul.s      $f0, $f0, $f0
/* 2F6C0 8002EAC0 0C0334B4 */  jal        _sqrtf
/* 2F6C4 8002EAC4 460C0300 */   add.s     $f12, $f0, $f12
/* 2F6C8 8002EAC8 3C01800E */  lui        $at, %hi(D_800DAB34)
/* 2F6CC 8002EACC C422AB34 */  lwc1       $f2, %lo(D_800DAB34)($at)
/* 2F6D0 8002EAD0 4600103C */  c.lt.s     $f2, $f0
/* 2F6D4 8002EAD4 00000000 */  nop
/* 2F6D8 8002EAD8 4500000B */  bc1f       .L8002EB08
/* 2F6DC 8002EADC 8EE21BBC */   lw        $v0, 0x1bbc($s7)
/* 2F6E0 8002EAE0 C4400014 */  lwc1       $f0, 0x14($v0)
/* 2F6E4 8002EAE4 46140002 */  mul.s      $f0, $f0, $f20
/* 2F6E8 8002EAE8 C6020000 */  lwc1       $f2, ($s0)
/* 2F6EC 8002EAEC 46020001 */  sub.s      $f0, $f0, $f2
/* 2F6F0 8002EAF0 E6000000 */  swc1       $f0, ($s0)
/* 2F6F4 8002EAF4 C442001C */  lwc1       $f2, 0x1c($v0)
/* 2F6F8 8002EAF8 46141082 */  mul.s      $f2, $f2, $f20
/* 2F6FC 8002EAFC C6200000 */  lwc1       $f0, ($s1)
/* 2F700 8002EB00 46001081 */  sub.s      $f2, $f2, $f0
/* 2F704 8002EB04 E6220000 */  swc1       $f2, ($s1)
.L8002EB08:
/* 2F708 8002EB08 C6420018 */  lwc1       $f2, 0x18($s2)
/* 2F70C 8002EB0C C6C0205C */  lwc1       $f0, 0x205c($s6)
/* 2F710 8002EB10 4602003C */  c.lt.s     $f0, $f2
/* 2F714 8002EB14 00000000 */  nop
/* 2F718 8002EB18 4500000A */  bc1f       .L8002EB44
/* 2F71C 8002EB1C 00000000 */   nop
/* 2F720 8002EB20 92430017 */  lbu        $v1, 0x17($s2)
/* 2F724 8002EB24 306200FF */  andi       $v0, $v1, 0xff
/* 2F728 8002EB28 10400006 */  beqz       $v0, .L8002EB44
/* 2F72C 8002EB2C 2C420002 */   sltiu     $v0, $v0, 2
/* 2F730 8002EB30 54400012 */  bnel       $v0, $zero, .L8002EB7C
/* 2F734 8002EB34 A2400017 */   sb        $zero, 0x17($s2)
/* 2F738 8002EB38 2462FFFF */  addiu      $v0, $v1, -1
/* 2F73C 8002EB3C 0800BADF */  j          .L8002EB7C
/* 2F740 8002EB40 A2420017 */   sb        $v0, 0x17($s2)
.L8002EB44:
/* 2F744 8002EB44 4600103E */  c.le.s     $f2, $f0
/* 2F748 8002EB48 00000000 */  nop
/* 2F74C 8002EB4C 4500000B */  bc1f       .L8002EB7C
/* 2F750 8002EB50 27C2C6C8 */   addiu     $v0, $fp, -0x3938
/* 2F754 8002EB54 02622021 */  addu       $a0, $s3, $v0
/* 2F758 8002EB58 90850017 */  lbu        $a1, 0x17($a0)
/* 2F75C 8002EB5C 30A300FF */  andi       $v1, $a1, 0xff
/* 2F760 8002EB60 2C6200FF */  sltiu      $v0, $v1, 0xff
/* 2F764 8002EB64 10400005 */  beqz       $v0, .L8002EB7C
/* 2F768 8002EB68 2C6200FE */   sltiu     $v0, $v1, 0xfe
/* 2F76C 8002EB6C 14400002 */  bnez       $v0, .L8002EB78
/* 2F770 8002EB70 24A20001 */   addiu     $v0, $a1, 1
/* 2F774 8002EB74 240200FF */  addiu      $v0, $zero, 0xff
.L8002EB78:
/* 2F778 8002EB78 A0820017 */  sb         $v0, 0x17($a0)
.L8002EB7C:
/* 2F77C 8002EB7C 2673001C */  addiu      $s3, $s3, 0x1c
/* 2F780 8002EB80 3C03800F */  lui        $v1, %hi(D_800EC6C0)
/* 2F784 8002EB84 9462C6C0 */  lhu        $v0, %lo(D_800EC6C0)($v1)
/* 2F788 8002EB88 26940001 */  addiu      $s4, $s4, 1
/* 2F78C 8002EB8C 0282102A */  slt        $v0, $s4, $v0
/* 2F790 8002EB90 1440FFB9 */  bnez       $v0, .L8002EA78
/* 2F794 8002EB94 2652001C */   addiu     $s2, $s2, 0x1c
.L8002EB98:
/* 2F798 8002EB98 8FBF0034 */  lw         $ra, 0x34($sp)
/* 2F79C 8002EB9C 8FBE0030 */  lw         $fp, 0x30($sp)
/* 2F7A0 8002EBA0 8FB7002C */  lw         $s7, 0x2c($sp)
/* 2F7A4 8002EBA4 8FB60028 */  lw         $s6, 0x28($sp)
/* 2F7A8 8002EBA8 8FB50024 */  lw         $s5, 0x24($sp)
/* 2F7AC 8002EBAC 8FB40020 */  lw         $s4, 0x20($sp)
/* 2F7B0 8002EBB0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2F7B4 8002EBB4 8FB20018 */  lw         $s2, 0x18($sp)
/* 2F7B8 8002EBB8 8FB10014 */  lw         $s1, 0x14($sp)
/* 2F7BC 8002EBBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 2F7C0 8002EBC0 D7B40038 */  ldc1       $f20, 0x38($sp)
/* 2F7C4 8002EBC4 03E00008 */  jr         $ra
/* 2F7C8 8002EBC8 27BD0040 */   addiu     $sp, $sp, 0x40
/* 2F7CC 8002EBCC 00000000 */  nop
