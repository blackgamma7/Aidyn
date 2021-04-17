.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alAdpcmPull
/* CEDD0 800CE1D0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* CEDD4 800CE1D4 8FA80058 */  lw         $t0, 0x58($sp)
/* CEDD8 800CE1D8 AFB40030 */  sw         $s4, 0x30($sp)
/* CEDDC 800CE1DC 00C0A021 */  addu       $s4, $a2, $zero
/* CEDE0 800CE1E0 AFB7003C */  sw         $s7, 0x3c($sp)
/* CEDE4 800CE1E4 0000B821 */  addu       $s7, $zero, $zero
/* CEDE8 800CE1E8 AFB10024 */  sw         $s1, 0x24($sp)
/* CEDEC 800CE1EC 00808821 */  addu       $s1, $a0, $zero
/* CEDF0 800CE1F0 AFB50034 */  sw         $s5, 0x34($sp)
/* CEDF4 800CE1F4 00A0A821 */  addu       $s5, $a1, $zero
/* CEDF8 800CE1F8 AFBF0040 */  sw         $ra, 0x40($sp)
/* CEDFC 800CE1FC AFB60038 */  sw         $s6, 0x38($sp)
/* CEE00 800CE200 AFB3002C */  sw         $s3, 0x2c($sp)
/* CEE04 800CE204 AFB20028 */  sw         $s2, 0x28($sp)
/* CEE08 800CE208 AFB00020 */  sw         $s0, 0x20($sp)
/* CEE0C 800CE20C 128000E9 */  beqz       $s4, .L800CE5B4
/* CEE10 800CE210 01003021 */   addu      $a2, $t0, $zero
/* CEE14 800CE214 25080008 */  addiu      $t0, $t0, 8
/* CEE18 800CE218 3C0300FF */  lui        $v1, 0xff
/* CEE1C 800CE21C 3463FFFF */  ori        $v1, $v1, 0xffff
/* CEE20 800CE220 3C051FFF */  lui        $a1, 0x1fff
/* CEE24 800CE224 8E22002C */  lw         $v0, 0x2c($s1)
/* CEE28 800CE228 3C040B00 */  lui        $a0, 0xb00
/* CEE2C 800CE22C 00431024 */  and        $v0, $v0, $v1
/* CEE30 800CE230 00441025 */  or         $v0, $v0, $a0
/* CEE34 800CE234 ACC20000 */  sw         $v0, ($a2)
/* CEE38 800CE238 8E230028 */  lw         $v1, 0x28($s1)
/* CEE3C 800CE23C 34A5FFFF */  ori        $a1, $a1, 0xffff
/* CEE40 800CE240 8C620010 */  lw         $v0, 0x10($v1)
/* CEE44 800CE244 24420008 */  addiu      $v0, $v0, 8
/* CEE48 800CE248 00451024 */  and        $v0, $v0, $a1
/* CEE4C 800CE24C ACC20004 */  sw         $v0, 4($a2)
/* CEE50 800CE250 8E240038 */  lw         $a0, 0x38($s1)
/* CEE54 800CE254 8E230020 */  lw         $v1, 0x20($s1)
/* CEE58 800CE258 02841021 */  addu       $v0, $s4, $a0
/* CEE5C 800CE25C 0062102B */  sltu       $v0, $v1, $v0
/* CEE60 800CE260 10400003 */  beqz       $v0, .L800CE270
/* CEE64 800CE264 00005021 */   addu      $t2, $zero, $zero
/* CEE68 800CE268 8E220024 */  lw         $v0, 0x24($s1)
/* CEE6C 800CE26C 0002502B */  sltu       $t2, $zero, $v0
.L800CE270:
/* CEE70 800CE270 11400002 */  beqz       $t2, .L800CE27C
/* CEE74 800CE274 02808021 */   addu      $s0, $s4, $zero
/* CEE78 800CE278 00648023 */  subu       $s0, $v1, $a0
.L800CE27C:
/* CEE7C 800CE27C 8E23003C */  lw         $v1, 0x3c($s1)
/* CEE80 800CE280 10600003 */  beqz       $v1, .L800CE290
/* CEE84 800CE284 24020010 */   addiu     $v0, $zero, 0x10
/* CEE88 800CE288 080338A5 */  j          .L800CE294
/* CEE8C 800CE28C 00434823 */   subu      $t1, $v0, $v1
.L800CE290:
/* CEE90 800CE290 00004821 */  addu       $t1, $zero, $zero
.L800CE294:
/* CEE94 800CE294 02093023 */  subu       $a2, $s0, $t1
/* CEE98 800CE298 04C20001 */  bltzl      $a2, .L800CE2A0
/* CEE9C 800CE29C 00003021 */   addu      $a2, $zero, $zero
.L800CE2A0:
/* CEEA0 800CE2A0 24C2000F */  addiu      $v0, $a2, 0xf
/* CEEA4 800CE2A4 00029903 */  sra        $s3, $v0, 4
/* CEEA8 800CE2A8 001318C0 */  sll        $v1, $s3, 3
/* CEEAC 800CE2AC 1140006C */  beqz       $t2, .L800CE460
/* CEEB0 800CE2B0 00733821 */   addu      $a3, $v1, $s3
/* CEEB4 800CE2B4 01002021 */  addu       $a0, $t0, $zero
/* CEEB8 800CE2B8 86A20000 */  lh         $v0, ($s5)
/* CEEBC 800CE2BC 8E230040 */  lw         $v1, 0x40($s1)
/* CEEC0 800CE2C0 02202821 */  addu       $a1, $s1, $zero
/* CEEC4 800CE2C4 AFA00014 */  sw         $zero, 0x14($sp)
/* CEEC8 800CE2C8 AFA20010 */  sw         $v0, 0x10($sp)
/* CEECC 800CE2CC 0C033BBB */  jal        func_800CEEEC
/* CEED0 800CE2D0 AFA30018 */   sw        $v1, 0x18($sp)
/* CEED4 800CE2D4 8E23003C */  lw         $v1, 0x3c($s1)
/* CEED8 800CE2D8 10600007 */  beqz       $v1, .L800CE2F8
/* CEEDC 800CE2DC 00404021 */   addu      $t0, $v0, $zero
/* CEEE0 800CE2E0 9622003E */  lhu        $v0, 0x3e($s1)
/* CEEE4 800CE2E4 96A30000 */  lhu        $v1, ($s5)
/* CEEE8 800CE2E8 00021040 */  sll        $v0, $v0, 1
/* CEEEC 800CE2EC 00621821 */  addu       $v1, $v1, $v0
/* CEEF0 800CE2F0 080338C1 */  j          .L800CE304
/* CEEF4 800CE2F4 A6A30000 */   sh        $v1, ($s5)
.L800CE2F8:
/* CEEF8 800CE2F8 96A20000 */  lhu        $v0, ($s5)
/* CEEFC 800CE2FC 24420020 */  addiu      $v0, $v0, 0x20
/* CEF00 800CE300 A6A20000 */  sh         $v0, ($s5)
.L800CE304:
/* CEF04 800CE304 8E22001C */  lw         $v0, 0x1c($s1)
/* CEF08 800CE308 8E250028 */  lw         $a1, 0x28($s1)
/* CEF0C 800CE30C 3043000F */  andi       $v1, $v0, 0xf
/* CEF10 800CE310 AE220038 */  sw         $v0, 0x38($s1)
/* CEF14 800CE314 00021102 */  srl        $v0, $v0, 4
/* CEF18 800CE318 24420001 */  addiu      $v0, $v0, 1
/* CEF1C 800CE31C AE23003C */  sw         $v1, 0x3c($s1)
/* CEF20 800CE320 000218C0 */  sll        $v1, $v0, 3
/* CEF24 800CE324 00621821 */  addu       $v1, $v1, $v0
/* CEF28 800CE328 8CA40000 */  lw         $a0, ($a1)
/* CEF2C 800CE32C 0214102A */  slt        $v0, $s0, $s4
/* CEF30 800CE330 00832021 */  addu       $a0, $a0, $v1
/* CEF34 800CE334 AE240044 */  sw         $a0, 0x44($s1)
/* CEF38 800CE338 1040003B */  beqz       $v0, .L800CE428
/* CEF3C 800CE33C 86B20000 */   lh        $s2, ($s5)
/* CEF40 800CE340 2417FFE0 */  addiu      $s7, $zero, -0x20
/* CEF44 800CE344 2416FFFF */  addiu      $s6, $zero, -1
.L800CE348:
/* CEF48 800CE348 0290A023 */  subu       $s4, $s4, $s0
/* CEF4C 800CE34C 26630001 */  addiu      $v1, $s3, 1
/* CEF50 800CE350 00031940 */  sll        $v1, $v1, 5
/* CEF54 800CE354 02431821 */  addu       $v1, $s2, $v1
/* CEF58 800CE358 00101040 */  sll        $v0, $s0, 1
/* CEF5C 800CE35C 02429021 */  addu       $s2, $s2, $v0
/* CEF60 800CE360 8E220024 */  lw         $v0, 0x24($s1)
/* CEF64 800CE364 10560004 */  beq        $v0, $s6, .L800CE378
/* CEF68 800CE368 0077A824 */   and       $s5, $v1, $s7
/* CEF6C 800CE36C 10400002 */  beqz       $v0, .L800CE378
/* CEF70 800CE370 2442FFFF */   addiu     $v0, $v0, -1
/* CEF74 800CE374 AE220024 */  sw         $v0, 0x24($s1)
.L800CE378:
/* CEF78 800CE378 8E220020 */  lw         $v0, 0x20($s1)
/* CEF7C 800CE37C 8E23001C */  lw         $v1, 0x1c($s1)
/* CEF80 800CE380 00438023 */  subu       $s0, $v0, $v1
/* CEF84 800CE384 0290202B */  sltu       $a0, $s4, $s0
/* CEF88 800CE388 54800001 */  bnel       $a0, $zero, .L800CE390
/* CEF8C 800CE38C 02808021 */   addu      $s0, $s4, $zero
.L800CE390:
/* CEF90 800CE390 8E22003C */  lw         $v0, 0x3c($s1)
/* CEF94 800CE394 2442FFF0 */  addiu      $v0, $v0, -0x10
/* CEF98 800CE398 02023021 */  addu       $a2, $s0, $v0
/* CEF9C 800CE39C 04C20001 */  bltzl      $a2, .L800CE3A4
/* CEFA0 800CE3A0 00003021 */   addu      $a2, $zero, $zero
.L800CE3A4:
/* CEFA4 800CE3A4 24C2000F */  addiu      $v0, $a2, 0xf
/* CEFA8 800CE3A8 00029903 */  sra        $s3, $v0, 4
/* CEFAC 800CE3AC 01002021 */  addu       $a0, $t0, $zero
/* CEFB0 800CE3B0 02202821 */  addu       $a1, $s1, $zero
/* CEFB4 800CE3B4 001338C0 */  sll        $a3, $s3, 3
/* CEFB8 800CE3B8 00F33821 */  addu       $a3, $a3, $s3
/* CEFBC 800CE3BC 00151400 */  sll        $v0, $s5, 0x10
/* CEFC0 800CE3C0 8E230040 */  lw         $v1, 0x40($s1)
/* CEFC4 800CE3C4 00021403 */  sra        $v0, $v0, 0x10
/* CEFC8 800CE3C8 AFA20010 */  sw         $v0, 0x10($sp)
/* CEFCC 800CE3CC AFA00014 */  sw         $zero, 0x14($sp)
/* CEFD0 800CE3D0 34630002 */  ori        $v1, $v1, 2
/* CEFD4 800CE3D4 0C033BBB */  jal        func_800CEEEC
/* CEFD8 800CE3D8 AFA30018 */   sw        $v1, 0x18($sp)
/* CEFDC 800CE3DC 00404021 */  addu       $t0, $v0, $zero
/* CEFE0 800CE3E0 01003021 */  addu       $a2, $t0, $zero
/* CEFE4 800CE3E4 25080008 */  addiu      $t0, $t0, 8
/* CEFE8 800CE3E8 3C0500FF */  lui        $a1, 0xff
/* CEFEC 800CE3EC 34A5FFFF */  ori        $a1, $a1, 0xffff
/* CEFF0 800CE3F0 00122400 */  sll        $a0, $s2, 0x10
/* CEFF4 800CE3F4 00101840 */  sll        $v1, $s0, 1
/* CEFF8 800CE3F8 3063FFFF */  andi       $v1, $v1, 0xffff
/* CEFFC 800CE3FC 00832025 */  or         $a0, $a0, $v1
/* CF000 800CE400 8E22003C */  lw         $v0, 0x3c($s1)
/* CF004 800CE404 3C030A00 */  lui        $v1, 0xa00
/* CF008 800CE408 ACC40004 */  sw         $a0, 4($a2)
/* CF00C 800CE40C 00021040 */  sll        $v0, $v0, 1
/* CF010 800CE410 02A21021 */  addu       $v0, $s5, $v0
/* CF014 800CE414 00451024 */  and        $v0, $v0, $a1
/* CF018 800CE418 00431025 */  or         $v0, $v0, $v1
/* CF01C 800CE41C 0214182A */  slt        $v1, $s0, $s4
/* CF020 800CE420 1460FFC9 */  bnez       $v1, .L800CE348
/* CF024 800CE424 ACC20000 */   sw        $v0, ($a2)
.L800CE428:
/* CF028 800CE428 01001021 */  addu       $v0, $t0, $zero
/* CF02C 800CE42C 8E23003C */  lw         $v1, 0x3c($s1)
/* CF030 800CE430 8E240038 */  lw         $a0, 0x38($s1)
/* CF034 800CE434 02831821 */  addu       $v1, $s4, $v1
/* CF038 800CE438 3063000F */  andi       $v1, $v1, 0xf
/* CF03C 800CE43C 00942021 */  addu       $a0, $a0, $s4
/* CF040 800CE440 AE23003C */  sw         $v1, 0x3c($s1)
/* CF044 800CE444 001318C0 */  sll        $v1, $s3, 3
/* CF048 800CE448 AE240038 */  sw         $a0, 0x38($s1)
/* CF04C 800CE44C 8E240044 */  lw         $a0, 0x44($s1)
/* CF050 800CE450 00731821 */  addu       $v1, $v1, $s3
/* CF054 800CE454 00832021 */  addu       $a0, $a0, $v1
/* CF058 800CE458 0803396E */  j          .L800CE5B8
/* CF05C 800CE45C AE240044 */   sw        $a0, 0x44($s1)
.L800CE460:
/* CF060 800CE460 8E230028 */  lw         $v1, 0x28($s1)
/* CF064 800CE464 8E250044 */  lw         $a1, 0x44($s1)
/* CF068 800CE468 8C620000 */  lw         $v0, ($v1)
/* CF06C 800CE46C 8C640004 */  lw         $a0, 4($v1)
/* CF070 800CE470 00A72821 */  addu       $a1, $a1, $a3
/* CF074 800CE474 00441021 */  addu       $v0, $v0, $a0
/* CF078 800CE478 00A22023 */  subu       $a0, $a1, $v0
/* CF07C 800CE47C 04810002 */  bgez       $a0, .L800CE488
/* CF080 800CE480 00138100 */   sll       $s0, $s3, 4
/* CF084 800CE484 00002021 */  addu       $a0, $zero, $zero
.L800CE488:
/* CF088 800CE488 3C0238E3 */  lui        $v0, 0x38e3
/* CF08C 800CE48C 34428E39 */  ori        $v0, $v0, 0x8e39
/* CF090 800CE490 00820018 */  mult       $a0, $v0
/* CF094 800CE494 00041FC3 */  sra        $v1, $a0, 0x1f
/* CF098 800CE498 00001010 */  mfhi       $v0
/* CF09C 800CE49C 00021043 */  sra        $v0, $v0, 1
/* CF0A0 800CE4A0 00431023 */  subu       $v0, $v0, $v1
/* CF0A4 800CE4A4 00029100 */  sll        $s2, $v0, 4
/* CF0A8 800CE4A8 02091821 */  addu       $v1, $s0, $t1
/* CF0AC 800CE4AC 0072102A */  slt        $v0, $v1, $s2
/* CF0B0 800CE4B0 10400002 */  beqz       $v0, .L800CE4BC
/* CF0B4 800CE4B4 0060B021 */   addu      $s6, $v1, $zero
/* CF0B8 800CE4B8 02C09021 */  addu       $s2, $s6, $zero
.L800CE4BC:
/* CF0BC 800CE4BC 3242000F */  andi       $v0, $s2, 0xf
/* CF0C0 800CE4C0 02421023 */  subu       $v0, $s2, $v0
/* CF0C4 800CE4C4 0054102A */  slt        $v0, $v0, $s4
/* CF0C8 800CE4C8 10400024 */  beqz       $v0, .L800CE55C
/* CF0CC 800CE4CC 00E43823 */   subu      $a3, $a3, $a0
/* CF0D0 800CE4D0 24170001 */  addiu      $s7, $zero, 1
/* CF0D4 800CE4D4 01002021 */  addu       $a0, $t0, $zero
/* CF0D8 800CE4D8 02202821 */  addu       $a1, $s1, $zero
/* CF0DC 800CE4DC 86A20000 */  lh         $v0, ($s5)
/* CF0E0 800CE4E0 8E230040 */  lw         $v1, 0x40($s1)
/* CF0E4 800CE4E4 02123023 */  subu       $a2, $s0, $s2
/* CF0E8 800CE4E8 AFA00014 */  sw         $zero, 0x14($sp)
/* CF0EC 800CE4EC AFA20010 */  sw         $v0, 0x10($sp)
/* CF0F0 800CE4F0 0C033BBB */  jal        func_800CEEEC
/* CF0F4 800CE4F4 AFA30018 */   sw        $v1, 0x18($sp)
/* CF0F8 800CE4F8 8E23003C */  lw         $v1, 0x3c($s1)
/* CF0FC 800CE4FC 10600007 */  beqz       $v1, .L800CE51C
/* CF100 800CE500 00404021 */   addu      $t0, $v0, $zero
/* CF104 800CE504 9622003E */  lhu        $v0, 0x3e($s1)
/* CF108 800CE508 96A30000 */  lhu        $v1, ($s5)
/* CF10C 800CE50C 00021040 */  sll        $v0, $v0, 1
/* CF110 800CE510 00621821 */  addu       $v1, $v1, $v0
/* CF114 800CE514 0803394A */  j          .L800CE528
/* CF118 800CE518 A6A30000 */   sh        $v1, ($s5)
.L800CE51C:
/* CF11C 800CE51C 96A20000 */  lhu        $v0, ($s5)
/* CF120 800CE520 24420020 */  addiu      $v0, $v0, 0x20
/* CF124 800CE524 A6A20000 */  sh         $v0, ($s5)
.L800CE528:
/* CF128 800CE528 8E22003C */  lw         $v0, 0x3c($s1)
/* CF12C 800CE52C 8E230038 */  lw         $v1, 0x38($s1)
/* CF130 800CE530 02821021 */  addu       $v0, $s4, $v0
/* CF134 800CE534 3042000F */  andi       $v0, $v0, 0xf
/* CF138 800CE538 00741821 */  addu       $v1, $v1, $s4
/* CF13C 800CE53C AE22003C */  sw         $v0, 0x3c($s1)
/* CF140 800CE540 001310C0 */  sll        $v0, $s3, 3
/* CF144 800CE544 AE230038 */  sw         $v1, 0x38($s1)
/* CF148 800CE548 8E230044 */  lw         $v1, 0x44($s1)
/* CF14C 800CE54C 00531021 */  addu       $v0, $v0, $s3
/* CF150 800CE550 00621821 */  addu       $v1, $v1, $v0
/* CF154 800CE554 08033959 */  j          .L800CE564
/* CF158 800CE558 AE230044 */   sw        $v1, 0x44($s1)
.L800CE55C:
/* CF15C 800CE55C AE20003C */  sw         $zero, 0x3c($s1)
/* CF160 800CE560 AE250044 */  sw         $a1, 0x44($s1)
.L800CE564:
/* CF164 800CE564 12400014 */  beqz       $s2, .L800CE5B8
/* CF168 800CE568 01001021 */   addu      $v0, $t0, $zero
/* CF16C 800CE56C 12E00004 */  beqz       $s7, .L800CE580
/* CF170 800CE570 AE20003C */   sw        $zero, 0x3c($s1)
/* CF174 800CE574 02D21023 */  subu       $v0, $s6, $s2
/* CF178 800CE578 08033961 */  j          .L800CE584
/* CF17C 800CE57C 00023040 */   sll       $a2, $v0, 1
.L800CE580:
/* CF180 800CE580 00003021 */  addu       $a2, $zero, $zero
.L800CE584:
/* CF184 800CE584 01002821 */  addu       $a1, $t0, $zero
/* CF188 800CE588 25080008 */  addiu      $t0, $t0, 8
/* CF18C 800CE58C 3C0400FF */  lui        $a0, 0xff
/* CF190 800CE590 3484FFFF */  ori        $a0, $a0, 0xffff
/* CF194 800CE594 86A20000 */  lh         $v0, ($s5)
/* CF198 800CE598 00121840 */  sll        $v1, $s2, 1
/* CF19C 800CE59C ACA30004 */  sw         $v1, 4($a1)
/* CF1A0 800CE5A0 3C030200 */  lui        $v1, 0x200
/* CF1A4 800CE5A4 00C21021 */  addu       $v0, $a2, $v0
/* CF1A8 800CE5A8 00441024 */  and        $v0, $v0, $a0
/* CF1AC 800CE5AC 00431025 */  or         $v0, $v0, $v1
/* CF1B0 800CE5B0 ACA20000 */  sw         $v0, ($a1)
.L800CE5B4:
/* CF1B4 800CE5B4 01001021 */  addu       $v0, $t0, $zero
.L800CE5B8:
/* CF1B8 800CE5B8 8FBF0040 */  lw         $ra, 0x40($sp)
/* CF1BC 800CE5BC 8FB7003C */  lw         $s7, 0x3c($sp)
/* CF1C0 800CE5C0 8FB60038 */  lw         $s6, 0x38($sp)
/* CF1C4 800CE5C4 8FB50034 */  lw         $s5, 0x34($sp)
/* CF1C8 800CE5C8 8FB40030 */  lw         $s4, 0x30($sp)
/* CF1CC 800CE5CC 8FB3002C */  lw         $s3, 0x2c($sp)
/* CF1D0 800CE5D0 8FB20028 */  lw         $s2, 0x28($sp)
/* CF1D4 800CE5D4 8FB10024 */  lw         $s1, 0x24($sp)
/* CF1D8 800CE5D8 8FB00020 */  lw         $s0, 0x20($sp)
/* CF1DC 800CE5DC 03E00008 */  jr         $ra
/* CF1E0 800CE5E0 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800CE5E4
/* CF1E4 800CE5E4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CF1E8 800CE5E8 AFB10014 */  sw         $s1, 0x14($sp)
/* CF1EC 800CE5EC 8FB10040 */  lw         $s1, 0x40($sp)
/* CF1F0 800CE5F0 AFB50024 */  sw         $s5, 0x24($sp)
/* CF1F4 800CE5F4 00C0A821 */  addu       $s5, $a2, $zero
/* CF1F8 800CE5F8 AFB40020 */  sw         $s4, 0x20($sp)
/* CF1FC 800CE5FC 0080A021 */  addu       $s4, $a0, $zero
/* CF200 800CE600 AFB60028 */  sw         $s6, 0x28($sp)
/* CF204 800CE604 00A0B021 */  addu       $s6, $a1, $zero
/* CF208 800CE608 AFBF002C */  sw         $ra, 0x2c($sp)
/* CF20C 800CE60C AFB3001C */  sw         $s3, 0x1c($sp)
/* CF210 800CE610 AFB20018 */  sw         $s2, 0x18($sp)
/* CF214 800CE614 AFB00010 */  sw         $s0, 0x10($sp)
/* CF218 800CE618 12A000C7 */  beqz       $s5, .L800CE938
/* CF21C 800CE61C 02209821 */   addu      $s3, $s1, $zero
/* CF220 800CE620 8E840038 */  lw         $a0, 0x38($s4)
/* CF224 800CE624 8E830020 */  lw         $v1, 0x20($s4)
/* CF228 800CE628 02A41021 */  addu       $v0, $s5, $a0
/* CF22C 800CE62C 0062102B */  sltu       $v0, $v1, $v0
/* CF230 800CE630 1040007C */  beqz       $v0, .L800CE824
/* CF234 800CE634 00158040 */   sll       $s0, $s5, 1
/* CF238 800CE638 8E820024 */  lw         $v0, 0x24($s4)
/* CF23C 800CE63C 10400079 */  beqz       $v0, .L800CE824
/* CF240 800CE640 00649023 */   subu      $s2, $v1, $a0
/* CF244 800CE644 1A40001A */  blez       $s2, .L800CE6B0
/* CF248 800CE648 00128040 */   sll       $s0, $s2, 1
/* CF24C 800CE64C 02002821 */  addu       $a1, $s0, $zero
/* CF250 800CE650 24060001 */  addiu      $a2, $zero, 1
/* CF254 800CE654 8E840044 */  lw         $a0, 0x44($s4)
/* CF258 800CE658 8E820030 */  lw         $v0, 0x30($s4)
/* CF25C 800CE65C 0040F809 */  jalr       $v0
/* CF260 800CE660 26310008 */   addiu     $s1, $s1, 8
/* CF264 800CE664 00404021 */  addu       $t0, $v0, $zero
/* CF268 800CE668 31070007 */  andi       $a3, $t0, 7
/* CF26C 800CE66C 02078021 */  addu       $s0, $s0, $a3
/* CF270 800CE670 02202821 */  addu       $a1, $s1, $zero
/* CF274 800CE674 26310008 */  addiu      $s1, $s1, 8
/* CF278 800CE678 32020007 */  andi       $v0, $s0, 7
/* CF27C 800CE67C 2442FFF8 */  addiu      $v0, $v0, -8
/* CF280 800CE680 02021023 */  subu       $v0, $s0, $v0
/* CF284 800CE684 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF288 800CE688 96C40000 */  lhu        $a0, ($s6)
/* CF28C 800CE68C 3C030800 */  lui        $v1, 0x800
/* CF290 800CE690 AE620004 */  sw         $v0, 4($s3)
/* CF294 800CE694 3C020400 */  lui        $v0, 0x400
/* CF298 800CE698 00832025 */  or         $a0, $a0, $v1
/* CF29C 800CE69C 01071823 */  subu       $v1, $t0, $a3
/* CF2A0 800CE6A0 AE640000 */  sw         $a0, ($s3)
/* CF2A4 800CE6A4 ACA20000 */  sw         $v0, ($a1)
/* CF2A8 800CE6A8 080339AD */  j          .L800CE6B4
/* CF2AC 800CE6AC ACA30004 */   sw        $v1, 4($a1)
.L800CE6B0:
/* CF2B0 800CE6B0 00003821 */  addu       $a3, $zero, $zero
.L800CE6B4:
/* CF2B4 800CE6B4 96C20000 */  lhu        $v0, ($s6)
/* CF2B8 800CE6B8 8E850028 */  lw         $a1, 0x28($s4)
/* CF2BC 800CE6BC 8E83001C */  lw         $v1, 0x1c($s4)
/* CF2C0 800CE6C0 00471021 */  addu       $v0, $v0, $a3
/* CF2C4 800CE6C4 00022400 */  sll        $a0, $v0, 0x10
/* CF2C8 800CE6C8 A6C20000 */  sh         $v0, ($s6)
/* CF2CC 800CE6CC 8CA20000 */  lw         $v0, ($a1)
/* CF2D0 800CE6D0 00049C03 */  sra        $s3, $a0, 0x10
/* CF2D4 800CE6D4 AE830038 */  sw         $v1, 0x38($s4)
/* CF2D8 800CE6D8 00031840 */  sll        $v1, $v1, 1
/* CF2DC 800CE6DC 00431021 */  addu       $v0, $v0, $v1
/* CF2E0 800CE6E0 0255182A */  slt        $v1, $s2, $s5
/* CF2E4 800CE6E4 10600046 */  beqz       $v1, .L800CE800
/* CF2E8 800CE6E8 AE820044 */   sw        $v0, 0x44($s4)
/* CF2EC 800CE6EC 00121040 */  sll        $v0, $s2, 1
.L800CE6F0:
/* CF2F0 800CE6F0 02629821 */  addu       $s3, $s3, $v0
/* CF2F4 800CE6F4 8E830024 */  lw         $v1, 0x24($s4)
/* CF2F8 800CE6F8 2402FFFF */  addiu      $v0, $zero, -1
/* CF2FC 800CE6FC 10620004 */  beq        $v1, $v0, .L800CE710
/* CF300 800CE700 02B2A823 */   subu      $s5, $s5, $s2
/* CF304 800CE704 10600002 */  beqz       $v1, .L800CE710
/* CF308 800CE708 2462FFFF */   addiu     $v0, $v1, -1
/* CF30C 800CE70C AE820024 */  sw         $v0, 0x24($s4)
.L800CE710:
/* CF310 800CE710 8E820020 */  lw         $v0, 0x20($s4)
/* CF314 800CE714 8E83001C */  lw         $v1, 0x1c($s4)
/* CF318 800CE718 00439023 */  subu       $s2, $v0, $v1
/* CF31C 800CE71C 02B2202B */  sltu       $a0, $s5, $s2
/* CF320 800CE720 54800001 */  bnel       $a0, $zero, .L800CE728
/* CF324 800CE724 02A09021 */   addu      $s2, $s5, $zero
.L800CE728:
/* CF328 800CE728 00128040 */  sll        $s0, $s2, 1
/* CF32C 800CE72C 02002821 */  addu       $a1, $s0, $zero
/* CF330 800CE730 8E840044 */  lw         $a0, 0x44($s4)
/* CF334 800CE734 8E820030 */  lw         $v0, 0x30($s4)
/* CF338 800CE738 0040F809 */  jalr       $v0
/* CF33C 800CE73C 24060001 */   addiu     $a2, $zero, 1
/* CF340 800CE740 00404021 */  addu       $t0, $v0, $zero
/* CF344 800CE744 31070007 */  andi       $a3, $t0, 7
/* CF348 800CE748 02078021 */  addu       $s0, $s0, $a3
/* CF34C 800CE74C 32630007 */  andi       $v1, $s3, 7
/* CF350 800CE750 10600004 */  beqz       $v1, .L800CE764
/* CF354 800CE754 00124840 */   sll       $t1, $s2, 1
/* CF358 800CE758 24020008 */  addiu      $v0, $zero, 8
/* CF35C 800CE75C 080339DA */  j          .L800CE768
/* CF360 800CE760 00433023 */   subu      $a2, $v0, $v1
.L800CE764:
/* CF364 800CE764 00003021 */  addu       $a2, $zero, $zero
.L800CE768:
/* CF368 800CE768 02202021 */  addu       $a0, $s1, $zero
/* CF36C 800CE76C 26310008 */  addiu      $s1, $s1, 8
/* CF370 800CE770 02202821 */  addu       $a1, $s1, $zero
/* CF374 800CE774 26310008 */  addiu      $s1, $s1, 8
/* CF378 800CE778 02661821 */  addu       $v1, $s3, $a2
/* CF37C 800CE77C 3063FFFF */  andi       $v1, $v1, 0xffff
/* CF380 800CE780 3C020800 */  lui        $v0, 0x800
/* CF384 800CE784 00621825 */  or         $v1, $v1, $v0
/* CF388 800CE788 32020007 */  andi       $v0, $s0, 7
/* CF38C 800CE78C 2442FFF8 */  addiu      $v0, $v0, -8
/* CF390 800CE790 02021023 */  subu       $v0, $s0, $v0
/* CF394 800CE794 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF398 800CE798 AC830000 */  sw         $v1, ($a0)
/* CF39C 800CE79C 3C030400 */  lui        $v1, 0x400
/* CF3A0 800CE7A0 AC820004 */  sw         $v0, 4($a0)
/* CF3A4 800CE7A4 01071023 */  subu       $v0, $t0, $a3
/* CF3A8 800CE7A8 ACA30000 */  sw         $v1, ($a1)
/* CF3AC 800CE7AC 14E00003 */  bnez       $a3, .L800CE7BC
/* CF3B0 800CE7B0 ACA20004 */   sw        $v0, 4($a1)
/* CF3B4 800CE7B4 10C00010 */  beqz       $a2, .L800CE7F8
/* CF3B8 800CE7B8 0255102A */   slt       $v0, $s2, $s5
.L800CE7BC:
/* CF3BC 800CE7BC 02202821 */  addu       $a1, $s1, $zero
/* CF3C0 800CE7C0 26310008 */  addiu      $s1, $s1, 8
/* CF3C4 800CE7C4 3C0400FF */  lui        $a0, 0xff
/* CF3C8 800CE7C8 3484FFFF */  ori        $a0, $a0, 0xffff
/* CF3CC 800CE7CC 02671021 */  addu       $v0, $s3, $a3
/* CF3D0 800CE7D0 00461021 */  addu       $v0, $v0, $a2
/* CF3D4 800CE7D4 00441024 */  and        $v0, $v0, $a0
/* CF3D8 800CE7D8 3C030A00 */  lui        $v1, 0xa00
/* CF3DC 800CE7DC 00431025 */  or         $v0, $v0, $v1
/* CF3E0 800CE7E0 00131C00 */  sll        $v1, $s3, 0x10
/* CF3E4 800CE7E4 ACA20000 */  sw         $v0, ($a1)
/* CF3E8 800CE7E8 3122FFFF */  andi       $v0, $t1, 0xffff
/* CF3EC 800CE7EC 00621825 */  or         $v1, $v1, $v0
/* CF3F0 800CE7F0 ACA30004 */  sw         $v1, 4($a1)
/* CF3F4 800CE7F4 0255102A */  slt        $v0, $s2, $s5
.L800CE7F8:
/* CF3F8 800CE7F8 1440FFBD */  bnez       $v0, .L800CE6F0
/* CF3FC 800CE7FC 00121040 */   sll       $v0, $s2, 1
.L800CE800:
/* CF400 800CE800 02201021 */  addu       $v0, $s1, $zero
/* CF404 800CE804 8E830038 */  lw         $v1, 0x38($s4)
/* CF408 800CE808 8E840044 */  lw         $a0, 0x44($s4)
/* CF40C 800CE80C 00751821 */  addu       $v1, $v1, $s5
/* CF410 800CE810 AE830038 */  sw         $v1, 0x38($s4)
/* CF414 800CE814 00151840 */  sll        $v1, $s5, 1
/* CF418 800CE818 00832021 */  addu       $a0, $a0, $v1
/* CF41C 800CE81C 08033A4F */  j          .L800CE93C
/* CF420 800CE820 AE840044 */   sw        $a0, 0x44($s4)
.L800CE824:
/* CF424 800CE824 8E820028 */  lw         $v0, 0x28($s4)
/* CF428 800CE828 8E860044 */  lw         $a2, 0x44($s4)
/* CF42C 800CE82C 8C430000 */  lw         $v1, ($v0)
/* CF430 800CE830 8C440004 */  lw         $a0, 4($v0)
/* CF434 800CE834 00D02821 */  addu       $a1, $a2, $s0
/* CF438 800CE838 00641821 */  addu       $v1, $v1, $a0
/* CF43C 800CE83C 00A39023 */  subu       $s2, $a1, $v1
/* CF440 800CE840 06410002 */  bgez       $s2, .L800CE84C
/* CF444 800CE844 02009821 */   addu      $s3, $s0, $zero
/* CF448 800CE848 00009021 */  addu       $s2, $zero, $zero
.L800CE84C:
/* CF44C 800CE84C 0272102A */  slt        $v0, $s3, $s2
/* CF450 800CE850 54400001 */  bnel       $v0, $zero, .L800CE858
/* CF454 800CE854 02609021 */   addu      $s2, $s3, $zero
.L800CE858:
/* CF458 800CE858 0253102A */  slt        $v0, $s2, $s3
/* CF45C 800CE85C 50400027 */  beql       $v0, $zero, .L800CE8FC
/* CF460 800CE860 AE850044 */   sw        $a1, 0x44($s4)
/* CF464 800CE864 1AA0001B */  blez       $s5, .L800CE8D4
/* CF468 800CE868 02728023 */   subu      $s0, $s3, $s2
/* CF46C 800CE86C 00C02021 */  addu       $a0, $a2, $zero
/* CF470 800CE870 02002821 */  addu       $a1, $s0, $zero
/* CF474 800CE874 8E820030 */  lw         $v0, 0x30($s4)
/* CF478 800CE878 0040F809 */  jalr       $v0
/* CF47C 800CE87C 24060001 */   addiu     $a2, $zero, 1
/* CF480 800CE880 00404021 */  addu       $t0, $v0, $zero
/* CF484 800CE884 31070007 */  andi       $a3, $t0, 7
/* CF488 800CE888 02078021 */  addu       $s0, $s0, $a3
/* CF48C 800CE88C 02202821 */  addu       $a1, $s1, $zero
/* CF490 800CE890 26310008 */  addiu      $s1, $s1, 8
/* CF494 800CE894 02203021 */  addu       $a2, $s1, $zero
/* CF498 800CE898 26310008 */  addiu      $s1, $s1, 8
/* CF49C 800CE89C 32020007 */  andi       $v0, $s0, 7
/* CF4A0 800CE8A0 2442FFF8 */  addiu      $v0, $v0, -8
/* CF4A4 800CE8A4 02021023 */  subu       $v0, $s0, $v0
/* CF4A8 800CE8A8 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF4AC 800CE8AC 96C40000 */  lhu        $a0, ($s6)
/* CF4B0 800CE8B0 3C030800 */  lui        $v1, 0x800
/* CF4B4 800CE8B4 ACA20004 */  sw         $v0, 4($a1)
/* CF4B8 800CE8B8 3C020400 */  lui        $v0, 0x400
/* CF4BC 800CE8BC 00832025 */  or         $a0, $a0, $v1
/* CF4C0 800CE8C0 01071823 */  subu       $v1, $t0, $a3
/* CF4C4 800CE8C4 ACA40000 */  sw         $a0, ($a1)
/* CF4C8 800CE8C8 ACC20000 */  sw         $v0, ($a2)
/* CF4CC 800CE8CC 08033A36 */  j          .L800CE8D8
/* CF4D0 800CE8D0 ACC30004 */   sw        $v1, 4($a2)
.L800CE8D4:
/* CF4D4 800CE8D4 00003821 */  addu       $a3, $zero, $zero
.L800CE8D8:
/* CF4D8 800CE8D8 96C20000 */  lhu        $v0, ($s6)
/* CF4DC 800CE8DC 8E830038 */  lw         $v1, 0x38($s4)
/* CF4E0 800CE8E0 00471021 */  addu       $v0, $v0, $a3
/* CF4E4 800CE8E4 A6C20000 */  sh         $v0, ($s6)
/* CF4E8 800CE8E8 8E820044 */  lw         $v0, 0x44($s4)
/* CF4EC 800CE8EC 00751821 */  addu       $v1, $v1, $s5
/* CF4F0 800CE8F0 AE830038 */  sw         $v1, 0x38($s4)
/* CF4F4 800CE8F4 00531021 */  addu       $v0, $v0, $s3
/* CF4F8 800CE8F8 AE820044 */  sw         $v0, 0x44($s4)
.L800CE8FC:
/* CF4FC 800CE8FC 1240000E */  beqz       $s2, .L800CE938
/* CF500 800CE900 02721823 */   subu      $v1, $s3, $s2
/* CF504 800CE904 04620001 */  bltzl      $v1, .L800CE90C
/* CF508 800CE908 00001821 */   addu      $v1, $zero, $zero
.L800CE90C:
/* CF50C 800CE90C 02202821 */  addu       $a1, $s1, $zero
/* CF510 800CE910 26310008 */  addiu      $s1, $s1, 8
/* CF514 800CE914 3C0400FF */  lui        $a0, 0xff
/* CF518 800CE918 86C20000 */  lh         $v0, ($s6)
/* CF51C 800CE91C 3484FFFF */  ori        $a0, $a0, 0xffff
/* CF520 800CE920 ACB20004 */  sw         $s2, 4($a1)
/* CF524 800CE924 00621021 */  addu       $v0, $v1, $v0
/* CF528 800CE928 00441024 */  and        $v0, $v0, $a0
/* CF52C 800CE92C 3C030200 */  lui        $v1, 0x200
/* CF530 800CE930 00431025 */  or         $v0, $v0, $v1
/* CF534 800CE934 ACA20000 */  sw         $v0, ($a1)
.L800CE938:
/* CF538 800CE938 02201021 */  addu       $v0, $s1, $zero
.L800CE93C:
/* CF53C 800CE93C 8FBF002C */  lw         $ra, 0x2c($sp)
/* CF540 800CE940 8FB60028 */  lw         $s6, 0x28($sp)
/* CF544 800CE944 8FB50024 */  lw         $s5, 0x24($sp)
/* CF548 800CE948 8FB40020 */  lw         $s4, 0x20($sp)
/* CF54C 800CE94C 8FB3001C */  lw         $s3, 0x1c($sp)
/* CF550 800CE950 8FB20018 */  lw         $s2, 0x18($sp)
/* CF554 800CE954 8FB10014 */  lw         $s1, 0x14($sp)
/* CF558 800CE958 8FB00010 */  lw         $s0, 0x10($sp)
/* CF55C 800CE95C 03E00008 */  jr         $ra
/* CF560 800CE960 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800CE964
/* CF564 800CE964 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CF568 800CE968 AFB10014 */  sw         $s1, 0x14($sp)
/* CF56C 800CE96C 8FB10040 */  lw         $s1, 0x40($sp)
/* CF570 800CE970 AFB3001C */  sw         $s3, 0x1c($sp)
/* CF574 800CE974 00C09821 */  addu       $s3, $a2, $zero
/* CF578 800CE978 AFB50024 */  sw         $s5, 0x24($sp)
/* CF57C 800CE97C 0080A821 */  addu       $s5, $a0, $zero
/* CF580 800CE980 AFB60028 */  sw         $s6, 0x28($sp)
/* CF584 800CE984 00A0B021 */  addu       $s6, $a1, $zero
/* CF588 800CE988 AFBF002C */  sw         $ra, 0x2c($sp)
/* CF58C 800CE98C AFB40020 */  sw         $s4, 0x20($sp)
/* CF590 800CE990 AFB20018 */  sw         $s2, 0x18($sp)
/* CF594 800CE994 AFB00010 */  sw         $s0, 0x10($sp)
/* CF598 800CE998 126000C9 */  beqz       $s3, .L800CECC0
/* CF59C 800CE99C 0220A021 */   addu      $s4, $s1, $zero
/* CF5A0 800CE9A0 8EA30038 */  lw         $v1, 0x38($s5)
/* CF5A4 800CE9A4 8EA50020 */  lw         $a1, 0x20($s5)
/* CF5A8 800CE9A8 02631021 */  addu       $v0, $s3, $v1
/* CF5AC 800CE9AC 00A2102B */  sltu       $v0, $a1, $v0
/* CF5B0 800CE9B0 5040007D */  beql       $v0, $zero, .L800CEBA8
/* CF5B4 800CE9B4 8EA20028 */   lw        $v0, 0x28($s5)
/* CF5B8 800CE9B8 8EA20024 */  lw         $v0, 0x24($s5)
/* CF5BC 800CE9BC 10400079 */  beqz       $v0, .L800CEBA4
/* CF5C0 800CE9C0 00A38023 */   subu      $s0, $a1, $v1
/* CF5C4 800CE9C4 1A00001B */  blez       $s0, .L800CEA34
/* CF5C8 800CE9C8 02009021 */   addu      $s2, $s0, $zero
/* CF5CC 800CE9CC 02002821 */  addu       $a1, $s0, $zero
/* CF5D0 800CE9D0 24060002 */  addiu      $a2, $zero, 2
/* CF5D4 800CE9D4 8EA40044 */  lw         $a0, 0x44($s5)
/* CF5D8 800CE9D8 8EA20030 */  lw         $v0, 0x30($s5)
/* CF5DC 800CE9DC 0040F809 */  jalr       $v0
/* CF5E0 800CE9E0 26310008 */   addiu     $s1, $s1, 8
/* CF5E4 800CE9E4 00404021 */  addu       $t0, $v0, $zero
/* CF5E8 800CE9E8 31070007 */  andi       $a3, $t0, 7
/* CF5EC 800CE9EC 02078021 */  addu       $s0, $s0, $a3
/* CF5F0 800CE9F0 02202821 */  addu       $a1, $s1, $zero
/* CF5F4 800CE9F4 26310008 */  addiu      $s1, $s1, 8
/* CF5F8 800CE9F8 32020007 */  andi       $v0, $s0, 7
/* CF5FC 800CE9FC 2442FFF8 */  addiu      $v0, $v0, -8
/* CF600 800CEA00 02021023 */  subu       $v0, $s0, $v0
/* CF604 800CEA04 00021040 */  sll        $v0, $v0, 1
/* CF608 800CEA08 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF60C 800CEA0C 96C40000 */  lhu        $a0, ($s6)
/* CF610 800CEA10 3C030800 */  lui        $v1, 0x800
/* CF614 800CEA14 AE820004 */  sw         $v0, 4($s4)
/* CF618 800CEA18 3C020400 */  lui        $v0, 0x400
/* CF61C 800CEA1C 00832025 */  or         $a0, $a0, $v1
/* CF620 800CEA20 01071823 */  subu       $v1, $t0, $a3
/* CF624 800CEA24 AE840000 */  sw         $a0, ($s4)
/* CF628 800CEA28 ACA20000 */  sw         $v0, ($a1)
/* CF62C 800CEA2C 08033A8E */  j          .L800CEA38
/* CF630 800CEA30 ACA30004 */   sw        $v1, 4($a1)
.L800CEA34:
/* CF634 800CEA34 00003821 */  addu       $a3, $zero, $zero
.L800CEA38:
/* CF638 800CEA38 96C20000 */  lhu        $v0, ($s6)
/* CF63C 800CEA3C 8EA40028 */  lw         $a0, 0x28($s5)
/* CF640 800CEA40 8EA5001C */  lw         $a1, 0x1c($s5)
/* CF644 800CEA44 00471021 */  addu       $v0, $v0, $a3
/* CF648 800CEA48 00023400 */  sll        $a2, $v0, 0x10
/* CF64C 800CEA4C 8C830000 */  lw         $v1, ($a0)
/* CF650 800CEA50 0006A403 */  sra        $s4, $a2, 0x10
/* CF654 800CEA54 A6C20000 */  sh         $v0, ($s6)
/* CF658 800CEA58 0253102A */  slt        $v0, $s2, $s3
/* CF65C 800CEA5C AEA50038 */  sw         $a1, 0x38($s5)
/* CF660 800CEA60 00651821 */  addu       $v1, $v1, $a1
/* CF664 800CEA64 10400047 */  beqz       $v0, .L800CEB84
/* CF668 800CEA68 AEA30044 */   sw        $v1, 0x44($s5)
/* CF66C 800CEA6C 00121040 */  sll        $v0, $s2, 1
.L800CEA70:
/* CF670 800CEA70 0282A021 */  addu       $s4, $s4, $v0
/* CF674 800CEA74 8EA30024 */  lw         $v1, 0x24($s5)
/* CF678 800CEA78 2402FFFF */  addiu      $v0, $zero, -1
/* CF67C 800CEA7C 10620004 */  beq        $v1, $v0, .L800CEA90
/* CF680 800CEA80 02729823 */   subu      $s3, $s3, $s2
/* CF684 800CEA84 10600002 */  beqz       $v1, .L800CEA90
/* CF688 800CEA88 2462FFFF */   addiu     $v0, $v1, -1
/* CF68C 800CEA8C AEA20024 */  sw         $v0, 0x24($s5)
.L800CEA90:
/* CF690 800CEA90 8EA20020 */  lw         $v0, 0x20($s5)
/* CF694 800CEA94 8EA3001C */  lw         $v1, 0x1c($s5)
/* CF698 800CEA98 00439023 */  subu       $s2, $v0, $v1
/* CF69C 800CEA9C 0272202B */  sltu       $a0, $s3, $s2
/* CF6A0 800CEAA0 54800001 */  bnel       $a0, $zero, .L800CEAA8
/* CF6A4 800CEAA4 02609021 */   addu      $s2, $s3, $zero
.L800CEAA8:
/* CF6A8 800CEAA8 02408021 */  addu       $s0, $s2, $zero
/* CF6AC 800CEAAC 02002821 */  addu       $a1, $s0, $zero
/* CF6B0 800CEAB0 8EA40044 */  lw         $a0, 0x44($s5)
/* CF6B4 800CEAB4 8EA20030 */  lw         $v0, 0x30($s5)
/* CF6B8 800CEAB8 0040F809 */  jalr       $v0
/* CF6BC 800CEABC 24060002 */   addiu     $a2, $zero, 2
/* CF6C0 800CEAC0 00404021 */  addu       $t0, $v0, $zero
/* CF6C4 800CEAC4 31070007 */  andi       $a3, $t0, 7
/* CF6C8 800CEAC8 32830007 */  andi       $v1, $s4, 7
/* CF6CC 800CEACC 10600004 */  beqz       $v1, .L800CEAE0
/* CF6D0 800CEAD0 02078021 */   addu      $s0, $s0, $a3
/* CF6D4 800CEAD4 24020008 */  addiu      $v0, $zero, 8
/* CF6D8 800CEAD8 08033AB9 */  j          .L800CEAE4
/* CF6DC 800CEADC 00433023 */   subu      $a2, $v0, $v1
.L800CEAE0:
/* CF6E0 800CEAE0 00003021 */  addu       $a2, $zero, $zero
.L800CEAE4:
/* CF6E4 800CEAE4 02202021 */  addu       $a0, $s1, $zero
/* CF6E8 800CEAE8 26310008 */  addiu      $s1, $s1, 8
/* CF6EC 800CEAEC 02202821 */  addu       $a1, $s1, $zero
/* CF6F0 800CEAF0 26310008 */  addiu      $s1, $s1, 8
/* CF6F4 800CEAF4 02861821 */  addu       $v1, $s4, $a2
/* CF6F8 800CEAF8 3063FFFF */  andi       $v1, $v1, 0xffff
/* CF6FC 800CEAFC 3C020800 */  lui        $v0, 0x800
/* CF700 800CEB00 00621825 */  or         $v1, $v1, $v0
/* CF704 800CEB04 32020007 */  andi       $v0, $s0, 7
/* CF708 800CEB08 2442FFF8 */  addiu      $v0, $v0, -8
/* CF70C 800CEB0C 02021023 */  subu       $v0, $s0, $v0
/* CF710 800CEB10 00021040 */  sll        $v0, $v0, 1
/* CF714 800CEB14 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF718 800CEB18 AC830000 */  sw         $v1, ($a0)
/* CF71C 800CEB1C 3C030400 */  lui        $v1, 0x400
/* CF720 800CEB20 AC820004 */  sw         $v0, 4($a0)
/* CF724 800CEB24 01071023 */  subu       $v0, $t0, $a3
/* CF728 800CEB28 ACA30000 */  sw         $v1, ($a1)
/* CF72C 800CEB2C 14E00003 */  bnez       $a3, .L800CEB3C
/* CF730 800CEB30 ACA20004 */   sw        $v0, 4($a1)
/* CF734 800CEB34 10C00011 */  beqz       $a2, .L800CEB7C
/* CF738 800CEB38 0253102A */   slt       $v0, $s2, $s3
.L800CEB3C:
/* CF73C 800CEB3C 02202821 */  addu       $a1, $s1, $zero
/* CF740 800CEB40 26310008 */  addiu      $s1, $s1, 8
/* CF744 800CEB44 3C0400FF */  lui        $a0, 0xff
/* CF748 800CEB48 3484FFFF */  ori        $a0, $a0, 0xffff
/* CF74C 800CEB4C 02871021 */  addu       $v0, $s4, $a3
/* CF750 800CEB50 00461021 */  addu       $v0, $v0, $a2
/* CF754 800CEB54 00441024 */  and        $v0, $v0, $a0
/* CF758 800CEB58 3C030A00 */  lui        $v1, 0xa00
/* CF75C 800CEB5C 00431025 */  or         $v0, $v0, $v1
/* CF760 800CEB60 00141C00 */  sll        $v1, $s4, 0x10
/* CF764 800CEB64 ACA20000 */  sw         $v0, ($a1)
/* CF768 800CEB68 00121040 */  sll        $v0, $s2, 1
/* CF76C 800CEB6C 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF770 800CEB70 00621825 */  or         $v1, $v1, $v0
/* CF774 800CEB74 ACA30004 */  sw         $v1, 4($a1)
/* CF778 800CEB78 0253102A */  slt        $v0, $s2, $s3
.L800CEB7C:
/* CF77C 800CEB7C 1440FFBC */  bnez       $v0, .L800CEA70
/* CF780 800CEB80 00121040 */   sll       $v0, $s2, 1
.L800CEB84:
/* CF784 800CEB84 02201021 */  addu       $v0, $s1, $zero
/* CF788 800CEB88 8EA30038 */  lw         $v1, 0x38($s5)
/* CF78C 800CEB8C 8EA40044 */  lw         $a0, 0x44($s5)
/* CF790 800CEB90 00731821 */  addu       $v1, $v1, $s3
/* CF794 800CEB94 00932021 */  addu       $a0, $a0, $s3
/* CF798 800CEB98 AEA30038 */  sw         $v1, 0x38($s5)
/* CF79C 800CEB9C 08033B31 */  j          .L800CECC4
/* CF7A0 800CEBA0 AEA40044 */   sw        $a0, 0x44($s5)
.L800CEBA4:
/* CF7A4 800CEBA4 8EA20028 */  lw         $v0, 0x28($s5)
.L800CEBA8:
/* CF7A8 800CEBA8 8EA60044 */  lw         $a2, 0x44($s5)
/* CF7AC 800CEBAC 8C430000 */  lw         $v1, ($v0)
/* CF7B0 800CEBB0 8C440004 */  lw         $a0, 4($v0)
/* CF7B4 800CEBB4 00D32821 */  addu       $a1, $a2, $s3
/* CF7B8 800CEBB8 00641821 */  addu       $v1, $v1, $a0
/* CF7BC 800CEBBC 00A39023 */  subu       $s2, $a1, $v1
/* CF7C0 800CEBC0 06420001 */  bltzl      $s2, .L800CEBC8
/* CF7C4 800CEBC4 00009021 */   addu      $s2, $zero, $zero
.L800CEBC8:
/* CF7C8 800CEBC8 0272102A */  slt        $v0, $s3, $s2
/* CF7CC 800CEBCC 54400001 */  bnel       $v0, $zero, .L800CEBD4
/* CF7D0 800CEBD0 02609021 */   addu      $s2, $s3, $zero
.L800CEBD4:
/* CF7D4 800CEBD4 0253102A */  slt        $v0, $s2, $s3
/* CF7D8 800CEBD8 50400028 */  beql       $v0, $zero, .L800CEC7C
/* CF7DC 800CEBDC AEA50044 */   sw        $a1, 0x44($s5)
/* CF7E0 800CEBE0 1A60001C */  blez       $s3, .L800CEC54
/* CF7E4 800CEBE4 02728023 */   subu      $s0, $s3, $s2
/* CF7E8 800CEBE8 00C02021 */  addu       $a0, $a2, $zero
/* CF7EC 800CEBEC 02002821 */  addu       $a1, $s0, $zero
/* CF7F0 800CEBF0 8EA20030 */  lw         $v0, 0x30($s5)
/* CF7F4 800CEBF4 0040F809 */  jalr       $v0
/* CF7F8 800CEBF8 24060002 */   addiu     $a2, $zero, 2
/* CF7FC 800CEBFC 00404021 */  addu       $t0, $v0, $zero
/* CF800 800CEC00 31070007 */  andi       $a3, $t0, 7
/* CF804 800CEC04 02078021 */  addu       $s0, $s0, $a3
/* CF808 800CEC08 02202821 */  addu       $a1, $s1, $zero
/* CF80C 800CEC0C 26310008 */  addiu      $s1, $s1, 8
/* CF810 800CEC10 02203021 */  addu       $a2, $s1, $zero
/* CF814 800CEC14 26310008 */  addiu      $s1, $s1, 8
/* CF818 800CEC18 32020007 */  andi       $v0, $s0, 7
/* CF81C 800CEC1C 2442FFF8 */  addiu      $v0, $v0, -8
/* CF820 800CEC20 02021023 */  subu       $v0, $s0, $v0
/* CF824 800CEC24 00021040 */  sll        $v0, $v0, 1
/* CF828 800CEC28 3042FFFF */  andi       $v0, $v0, 0xffff
/* CF82C 800CEC2C 96C40000 */  lhu        $a0, ($s6)
/* CF830 800CEC30 3C030800 */  lui        $v1, 0x800
/* CF834 800CEC34 ACA20004 */  sw         $v0, 4($a1)
/* CF838 800CEC38 3C020400 */  lui        $v0, 0x400
/* CF83C 800CEC3C 00832025 */  or         $a0, $a0, $v1
/* CF840 800CEC40 01071823 */  subu       $v1, $t0, $a3
/* CF844 800CEC44 ACA40000 */  sw         $a0, ($a1)
/* CF848 800CEC48 ACC20000 */  sw         $v0, ($a2)
/* CF84C 800CEC4C 08033B16 */  j          .L800CEC58
/* CF850 800CEC50 ACC30004 */   sw        $v1, 4($a2)
.L800CEC54:
/* CF854 800CEC54 00003821 */  addu       $a3, $zero, $zero
.L800CEC58:
/* CF858 800CEC58 96C20000 */  lhu        $v0, ($s6)
/* CF85C 800CEC5C 8EA30038 */  lw         $v1, 0x38($s5)
/* CF860 800CEC60 00471021 */  addu       $v0, $v0, $a3
/* CF864 800CEC64 A6C20000 */  sh         $v0, ($s6)
/* CF868 800CEC68 8EA20044 */  lw         $v0, 0x44($s5)
/* CF86C 800CEC6C 00731821 */  addu       $v1, $v1, $s3
/* CF870 800CEC70 AEA30038 */  sw         $v1, 0x38($s5)
/* CF874 800CEC74 00531021 */  addu       $v0, $v0, $s3
/* CF878 800CEC78 AEA20044 */  sw         $v0, 0x44($s5)
.L800CEC7C:
/* CF87C 800CEC7C 12400010 */  beqz       $s2, .L800CECC0
/* CF880 800CEC80 00131040 */   sll       $v0, $s3, 1
/* CF884 800CEC84 00121840 */  sll        $v1, $s2, 1
/* CF888 800CEC88 00433023 */  subu       $a2, $v0, $v1
/* CF88C 800CEC8C 04C20001 */  bltzl      $a2, .L800CEC94
/* CF890 800CEC90 00003021 */   addu      $a2, $zero, $zero
.L800CEC94:
/* CF894 800CEC94 02202821 */  addu       $a1, $s1, $zero
/* CF898 800CEC98 26310008 */  addiu      $s1, $s1, 8
/* CF89C 800CEC9C 3C0400FF */  lui        $a0, 0xff
/* CF8A0 800CECA0 86C20000 */  lh         $v0, ($s6)
/* CF8A4 800CECA4 3484FFFF */  ori        $a0, $a0, 0xffff
/* CF8A8 800CECA8 ACA30004 */  sw         $v1, 4($a1)
/* CF8AC 800CECAC 3C030200 */  lui        $v1, 0x200
/* CF8B0 800CECB0 00C21021 */  addu       $v0, $a2, $v0
/* CF8B4 800CECB4 00441024 */  and        $v0, $v0, $a0
/* CF8B8 800CECB8 00431025 */  or         $v0, $v0, $v1
/* CF8BC 800CECBC ACA20000 */  sw         $v0, ($a1)
.L800CECC0:
/* CF8C0 800CECC0 02201021 */  addu       $v0, $s1, $zero
.L800CECC4:
/* CF8C4 800CECC4 8FBF002C */  lw         $ra, 0x2c($sp)
/* CF8C8 800CECC8 8FB60028 */  lw         $s6, 0x28($sp)
/* CF8CC 800CECCC 8FB50024 */  lw         $s5, 0x24($sp)
/* CF8D0 800CECD0 8FB40020 */  lw         $s4, 0x20($sp)
/* CF8D4 800CECD4 8FB3001C */  lw         $s3, 0x1c($sp)
/* CF8D8 800CECD8 8FB20018 */  lw         $s2, 0x18($sp)
/* CF8DC 800CECDC 8FB10014 */  lw         $s1, 0x14($sp)
/* CF8E0 800CECE0 8FB00010 */  lw         $s0, 0x10($sp)
/* CF8E4 800CECE4 03E00008 */  jr         $ra
/* CF8E8 800CECE8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel alLoadParam
/* CF8EC 800CECEC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CF8F0 800CECF0 AFBF0010 */  sw         $ra, 0x10($sp)
/* CF8F4 800CECF4 24020004 */  addiu      $v0, $zero, 4
/* CF8F8 800CECF8 10A20065 */  beq        $a1, $v0, .L800CEE90
/* CF8FC 800CECFC 00803821 */   addu      $a3, $a0, $zero
/* CF900 800CED00 24020005 */  addiu      $v0, $zero, 5
/* CF904 800CED04 14A20076 */  bne        $a1, $v0, .L800CEEE0
/* CF908 800CED08 8FBF0010 */   lw        $ra, 0x10($sp)
/* CF90C 800CED0C ACE60028 */  sw         $a2, 0x28($a3)
/* CF910 800CED10 90C30008 */  lbu        $v1, 8($a2)
/* CF914 800CED14 24020001 */  addiu      $v0, $zero, 1
/* CF918 800CED18 10620035 */  beq        $v1, $v0, .L800CEDF0
/* CF91C 800CED1C 28620002 */   slti      $v0, $v1, 2
/* CF920 800CED20 10400005 */  beqz       $v0, .L800CED38
/* CF924 800CED24 24020002 */   addiu     $v0, $zero, 2
/* CF928 800CED28 50600007 */  beql       $v1, $zero, .L800CED48
/* CF92C 800CED2C 8CC20000 */   lw        $v0, ($a2)
/* CF930 800CED30 08033BB9 */  j          .L800CEEE4
/* CF934 800CED34 24020001 */   addiu     $v0, $zero, 1
.L800CED38:
/* CF938 800CED38 10620040 */  beq        $v1, $v0, .L800CEE3C
/* CF93C 800CED3C 8FBF0010 */   lw        $ra, 0x10($sp)
/* CF940 800CED40 08033BB9 */  j          .L800CEEE4
/* CF944 800CED44 24020001 */   addiu     $v0, $zero, 1
.L800CED48:
/* CF948 800CED48 3C0338E3 */  lui        $v1, 0x38e3
/* CF94C 800CED4C ACE00038 */  sw         $zero, 0x38($a3)
/* CF950 800CED50 ACE20044 */  sw         $v0, 0x44($a3)
/* CF954 800CED54 8CC40004 */  lw         $a0, 4($a2)
/* CF958 800CED58 34638E39 */  ori        $v1, $v1, 0x8e39
/* CF95C 800CED5C 00830018 */  mult       $a0, $v1
/* CF960 800CED60 3C02800D */  lui        $v0, %hi(alAdpcmPull)
/* CF964 800CED64 2442E1D0 */  addiu      $v0, $v0, %lo(alAdpcmPull)
/* CF968 800CED68 ACE20004 */  sw         $v0, 4($a3)
/* CF96C 800CED6C 000427C3 */  sra        $a0, $a0, 0x1f
/* CF970 800CED70 00001810 */  mfhi       $v1
/* CF974 800CED74 00031843 */  sra        $v1, $v1, 1
/* CF978 800CED78 00641823 */  subu       $v1, $v1, $a0
/* CF97C 800CED7C 000310C0 */  sll        $v0, $v1, 3
/* CF980 800CED80 8CC40010 */  lw         $a0, 0x10($a2)
/* CF984 800CED84 00431021 */  addu       $v0, $v0, $v1
/* CF988 800CED88 ACC20004 */  sw         $v0, 4($a2)
/* CF98C 800CED8C 8C830004 */  lw         $v1, 4($a0)
/* CF990 800CED90 8C820000 */  lw         $v0, ($a0)
/* CF994 800CED94 00031840 */  sll        $v1, $v1, 1
/* CF998 800CED98 00430018 */  mult       $v0, $v1
/* CF99C 800CED9C 00001012 */  mflo       $v0
/* CF9A0 800CEDA0 000210C0 */  sll        $v0, $v0, 3
/* CF9A4 800CEDA4 ACE2002C */  sw         $v0, 0x2c($a3)
/* CF9A8 800CEDA8 8CC2000C */  lw         $v0, 0xc($a2)
/* CF9AC 800CEDAC 50400035 */  beql       $v0, $zero, .L800CEE84
/* CF9B0 800CEDB0 ACE00024 */   sw        $zero, 0x24($a3)
/* CF9B4 800CEDB4 8C420000 */  lw         $v0, ($v0)
/* CF9B8 800CEDB8 ACE2001C */  sw         $v0, 0x1c($a3)
/* CF9BC 800CEDBC 8CC3000C */  lw         $v1, 0xc($a2)
/* CF9C0 800CEDC0 8C620004 */  lw         $v0, 4($v1)
/* CF9C4 800CEDC4 ACE20020 */  sw         $v0, 0x20($a3)
/* CF9C8 800CEDC8 8CC3000C */  lw         $v1, 0xc($a2)
/* CF9CC 800CEDCC 8CE50018 */  lw         $a1, 0x18($a3)
/* CF9D0 800CEDD0 8C620008 */  lw         $v0, 8($v1)
/* CF9D4 800CEDD4 ACE20024 */  sw         $v0, 0x24($a3)
/* CF9D8 800CEDD8 8CC4000C */  lw         $a0, 0xc($a2)
/* CF9DC 800CEDDC 24060020 */  addiu      $a2, $zero, 0x20
/* CF9E0 800CEDE0 0C033C58 */  jal        alCopy
/* CF9E4 800CEDE4 2484000C */   addiu     $a0, $a0, 0xc
/* CF9E8 800CEDE8 08033BB8 */  j          .L800CEEE0
/* CF9EC 800CEDEC 8FBF0010 */   lw        $ra, 0x10($sp)
.L800CEDF0:
/* CF9F0 800CEDF0 3C02800D */  lui        $v0, %hi(func_800CE5E4)
/* CF9F4 800CEDF4 8CE30038 */  lw         $v1, 0x38($a3)
/* CF9F8 800CEDF8 2442E5E4 */  addiu      $v0, $v0, %lo(func_800CE5E4)
/* CF9FC 800CEDFC ACE20004 */  sw         $v0, 4($a3)
/* CFA00 800CEE00 8CC20000 */  lw         $v0, ($a2)
/* CFA04 800CEE04 00031840 */  sll        $v1, $v1, 1
/* CFA08 800CEE08 00431021 */  addu       $v0, $v0, $v1
/* CFA0C 800CEE0C ACE20044 */  sw         $v0, 0x44($a3)
/* CFA10 800CEE10 8CC2000C */  lw         $v0, 0xc($a2)
/* CFA14 800CEE14 5040001B */  beql       $v0, $zero, .L800CEE84
/* CFA18 800CEE18 ACE00024 */   sw        $zero, 0x24($a3)
/* CFA1C 800CEE1C 8C420000 */  lw         $v0, ($v0)
/* CFA20 800CEE20 ACE2001C */  sw         $v0, 0x1c($a3)
/* CFA24 800CEE24 8CC3000C */  lw         $v1, 0xc($a2)
/* CFA28 800CEE28 8C620004 */  lw         $v0, 4($v1)
/* CFA2C 800CEE2C ACE20020 */  sw         $v0, 0x20($a3)
/* CFA30 800CEE30 8CC3000C */  lw         $v1, 0xc($a2)
/* CFA34 800CEE34 08033BB6 */  j          .L800CEED8
/* CFA38 800CEE38 8C620008 */   lw        $v0, 8($v1)
.L800CEE3C:
/* CFA3C 800CEE3C 3C02800D */  lui        $v0, %hi(func_800CE964)
/* CFA40 800CEE40 8CC30000 */  lw         $v1, ($a2)
/* CFA44 800CEE44 8CE40038 */  lw         $a0, 0x38($a3)
/* CFA48 800CEE48 2442E964 */  addiu      $v0, $v0, %lo(func_800CE964)
/* CFA4C 800CEE4C ACE20004 */  sw         $v0, 4($a3)
/* CFA50 800CEE50 00641821 */  addu       $v1, $v1, $a0
/* CFA54 800CEE54 ACE30044 */  sw         $v1, 0x44($a3)
/* CFA58 800CEE58 8CC2000C */  lw         $v0, 0xc($a2)
/* CFA5C 800CEE5C 50400009 */  beql       $v0, $zero, .L800CEE84
/* CFA60 800CEE60 ACE00024 */   sw        $zero, 0x24($a3)
/* CFA64 800CEE64 8C420000 */  lw         $v0, ($v0)
/* CFA68 800CEE68 ACE2001C */  sw         $v0, 0x1c($a3)
/* CFA6C 800CEE6C 8CC3000C */  lw         $v1, 0xc($a2)
/* CFA70 800CEE70 8C620004 */  lw         $v0, 4($v1)
/* CFA74 800CEE74 ACE20020 */  sw         $v0, 0x20($a3)
/* CFA78 800CEE78 8CC3000C */  lw         $v1, 0xc($a2)
/* CFA7C 800CEE7C 08033BB6 */  j          .L800CEED8
/* CFA80 800CEE80 8C620008 */   lw        $v0, 8($v1)
.L800CEE84:
/* CFA84 800CEE84 ACE00020 */  sw         $zero, 0x20($a3)
/* CFA88 800CEE88 08033BB7 */  j          .L800CEEDC
/* CFA8C 800CEE8C ACE0001C */   sw        $zero, 0x1c($a3)
.L800CEE90:
/* CFA90 800CEE90 8CE40028 */  lw         $a0, 0x28($a3)
/* CFA94 800CEE94 24050001 */  addiu      $a1, $zero, 1
/* CFA98 800CEE98 ACE0003C */  sw         $zero, 0x3c($a3)
/* CFA9C 800CEE9C 1080000F */  beqz       $a0, .L800CEEDC
/* CFAA0 800CEEA0 ACE50040 */   sw        $a1, 0x40($a3)
/* CFAA4 800CEEA4 8C820000 */  lw         $v0, ($a0)
/* CFAA8 800CEEA8 ACE20044 */  sw         $v0, 0x44($a3)
/* CFAAC 800CEEAC 90830008 */  lbu        $v1, 8($a0)
/* CFAB0 800CEEB0 50600006 */  beql       $v1, $zero, .L800CEECC
/* CFAB4 800CEEB4 8C82000C */   lw        $v0, 0xc($a0)
/* CFAB8 800CEEB8 10650003 */  beq        $v1, $a1, .L800CEEC8
/* CFABC 800CEEBC 24020002 */   addiu     $v0, $zero, 2
/* CFAC0 800CEEC0 14620007 */  bne        $v1, $v0, .L800CEEE0
/* CFAC4 800CEEC4 8FBF0010 */   lw        $ra, 0x10($sp)
.L800CEEC8:
/* CFAC8 800CEEC8 8C82000C */  lw         $v0, 0xc($a0)
.L800CEECC:
/* CFACC 800CEECC 10400004 */  beqz       $v0, .L800CEEE0
/* CFAD0 800CEED0 8FBF0010 */   lw        $ra, 0x10($sp)
/* CFAD4 800CEED4 8C420008 */  lw         $v0, 8($v0)
.L800CEED8:
/* CFAD8 800CEED8 ACE20024 */  sw         $v0, 0x24($a3)
.L800CEEDC:
/* CFADC 800CEEDC 8FBF0010 */  lw         $ra, 0x10($sp)
.L800CEEE0:
/* CFAE0 800CEEE0 24020001 */  addiu      $v0, $zero, 1
.L800CEEE4:
/* CFAE4 800CEEE4 03E00008 */  jr         $ra
/* CFAE8 800CEEE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800CEEEC
/* CFAEC 800CEEEC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CFAF0 800CEEF0 AFB50024 */  sw         $s5, 0x24($sp)
/* CFAF4 800CEEF4 8FB50048 */  lw         $s5, 0x48($sp)
/* CFAF8 800CEEF8 AFB40020 */  sw         $s4, 0x20($sp)
/* CFAFC 800CEEFC 87B40042 */  lh         $s4, 0x42($sp)
/* CFB00 800CEF00 AFB3001C */  sw         $s3, 0x1c($sp)
/* CFB04 800CEF04 87B30046 */  lh         $s3, 0x46($sp)
/* CFB08 800CEF08 AFB00010 */  sw         $s0, 0x10($sp)
/* CFB0C 800CEF0C 00808021 */  addu       $s0, $a0, $zero
/* CFB10 800CEF10 AFB10014 */  sw         $s1, 0x14($sp)
/* CFB14 800CEF14 00E08821 */  addu       $s1, $a3, $zero
/* CFB18 800CEF18 AFB20018 */  sw         $s2, 0x18($sp)
/* CFB1C 800CEF1C 00A09021 */  addu       $s2, $a1, $zero
/* CFB20 800CEF20 AFB60028 */  sw         $s6, 0x28($sp)
/* CFB24 800CEF24 00C0B021 */  addu       $s6, $a2, $zero
/* CFB28 800CEF28 1A20001A */  blez       $s1, .L800CEF94
/* CFB2C 800CEF2C AFBF002C */   sw        $ra, 0x2c($sp)
/* CFB30 800CEF30 8E420030 */  lw         $v0, 0x30($s2)
/* CFB34 800CEF34 8E440044 */  lw         $a0, 0x44($s2)
/* CFB38 800CEF38 8E460034 */  lw         $a2, 0x34($s2)
/* CFB3C 800CEF3C 0040F809 */  jalr       $v0
/* CFB40 800CEF40 02202821 */   addu      $a1, $s1, $zero
/* CFB44 800CEF44 30470007 */  andi       $a3, $v0, 7
/* CFB48 800CEF48 02278821 */  addu       $s1, $s1, $a3
/* CFB4C 800CEF4C 02002821 */  addu       $a1, $s0, $zero
/* CFB50 800CEF50 26100008 */  addiu      $s0, $s0, 8
/* CFB54 800CEF54 02003021 */  addu       $a2, $s0, $zero
/* CFB58 800CEF58 26100008 */  addiu      $s0, $s0, 8
/* CFB5C 800CEF5C 3264FFFF */  andi       $a0, $s3, 0xffff
/* CFB60 800CEF60 3C030800 */  lui        $v1, 0x800
/* CFB64 800CEF64 00832025 */  or         $a0, $a0, $v1
/* CFB68 800CEF68 32230007 */  andi       $v1, $s1, 7
/* CFB6C 800CEF6C 2463FFF8 */  addiu      $v1, $v1, -8
/* CFB70 800CEF70 02231823 */  subu       $v1, $s1, $v1
/* CFB74 800CEF74 3063FFFF */  andi       $v1, $v1, 0xffff
/* CFB78 800CEF78 ACA40000 */  sw         $a0, ($a1)
/* CFB7C 800CEF7C 3C040400 */  lui        $a0, 0x400
/* CFB80 800CEF80 00471023 */  subu       $v0, $v0, $a3
/* CFB84 800CEF84 ACA30004 */  sw         $v1, 4($a1)
/* CFB88 800CEF88 ACC40000 */  sw         $a0, ($a2)
/* CFB8C 800CEF8C 08033BE6 */  j          .L800CEF98
/* CFB90 800CEF90 ACC20004 */   sw        $v0, 4($a2)
.L800CEF94:
/* CFB94 800CEF94 00003821 */  addu       $a3, $zero, $zero
.L800CEF98:
/* CFB98 800CEF98 32A20002 */  andi       $v0, $s5, 2
/* CFB9C 800CEF9C 10400009 */  beqz       $v0, .L800CEFC4
/* CFBA0 800CEFA0 02002821 */   addu      $a1, $s0, $zero
/* CFBA4 800CEFA4 26100008 */  addiu      $s0, $s0, 8
/* CFBA8 800CEFA8 3C041FFF */  lui        $a0, 0x1fff
/* CFBAC 800CEFAC 3C030F00 */  lui        $v1, 0xf00
/* CFBB0 800CEFB0 ACA30000 */  sw         $v1, ($a1)
/* CFBB4 800CEFB4 8E420018 */  lw         $v0, 0x18($s2)
/* CFBB8 800CEFB8 3484FFFF */  ori        $a0, $a0, 0xffff
/* CFBBC 800CEFBC 00441024 */  and        $v0, $v0, $a0
/* CFBC0 800CEFC0 ACA20004 */  sw         $v0, 4($a1)
.L800CEFC4:
/* CFBC4 800CEFC4 02003021 */  addu       $a2, $s0, $zero
/* CFBC8 800CEFC8 26100008 */  addiu      $s0, $s0, 8
/* CFBCC 800CEFCC 3C051FFF */  lui        $a1, 0x1fff
/* CFBD0 800CEFD0 34A5FFFF */  ori        $a1, $a1, 0xffff
/* CFBD4 800CEFD4 02671021 */  addu       $v0, $s3, $a3
/* CFBD8 800CEFD8 3042FFFF */  andi       $v0, $v0, 0xffff
/* CFBDC 800CEFDC 3C030800 */  lui        $v1, 0x800
/* CFBE0 800CEFE0 00431025 */  or         $v0, $v0, $v1
/* CFBE4 800CEFE4 00141C00 */  sll        $v1, $s4, 0x10
/* CFBE8 800CEFE8 ACC20000 */  sw         $v0, ($a2)
/* CFBEC 800CEFEC 00161040 */  sll        $v0, $s6, 1
/* CFBF0 800CEFF0 3042FFFF */  andi       $v0, $v0, 0xffff
/* CFBF4 800CEFF4 00621825 */  or         $v1, $v1, $v0
/* CFBF8 800CEFF8 02002021 */  addu       $a0, $s0, $zero
/* CFBFC 800CEFFC 32A200FF */  andi       $v0, $s5, 0xff
/* CFC00 800CF000 00021400 */  sll        $v0, $v0, 0x10
/* CFC04 800CF004 ACC30004 */  sw         $v1, 4($a2)
/* CFC08 800CF008 3C030100 */  lui        $v1, 0x100
/* CFC0C 800CF00C 00431025 */  or         $v0, $v0, $v1
/* CFC10 800CF010 AC820000 */  sw         $v0, ($a0)
/* CFC14 800CF014 8E430014 */  lw         $v1, 0x14($s2)
/* CFC18 800CF018 8FBF002C */  lw         $ra, 0x2c($sp)
/* CFC1C 800CF01C 8FB60028 */  lw         $s6, 0x28($sp)
/* CFC20 800CF020 8FB50024 */  lw         $s5, 0x24($sp)
/* CFC24 800CF024 8FB40020 */  lw         $s4, 0x20($sp)
/* CFC28 800CF028 8FB3001C */  lw         $s3, 0x1c($sp)
/* CFC2C 800CF02C 8FB10014 */  lw         $s1, 0x14($sp)
/* CFC30 800CF030 8FB00010 */  lw         $s0, 0x10($sp)
/* CFC34 800CF034 00651824 */  and        $v1, $v1, $a1
/* CFC38 800CF038 AC830004 */  sw         $v1, 4($a0)
/* CFC3C 800CF03C AE400040 */  sw         $zero, 0x40($s2)
/* CFC40 800CF040 8FB20018 */  lw         $s2, 0x18($sp)
/* CFC44 800CF044 24820008 */  addiu      $v0, $a0, 8
/* CFC48 800CF048 03E00008 */  jr         $ra
/* CFC4C 800CF04C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel alAuxBusPull
/* CFC50 800CF050 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* CFC54 800CF054 AFB40030 */  sw         $s4, 0x30($sp)
/* CFC58 800CF058 00A0A021 */  addu       $s4, $a1, $zero
/* CFC5C 800CF05C AFB3002C */  sw         $s3, 0x2c($sp)
/* CFC60 800CF060 00C09821 */  addu       $s3, $a2, $zero
/* CFC64 800CF064 AFB50034 */  sw         $s5, 0x34($sp)
/* CFC68 800CF068 00E0A821 */  addu       $s5, $a3, $zero
/* CFC6C 800CF06C 8FA60050 */  lw         $a2, 0x50($sp)
/* CFC70 800CF070 3C030200 */  lui        $v1, 0x200
/* CFC74 800CF074 346306C0 */  ori        $v1, $v1, 0x6c0
/* CFC78 800CF078 3C050200 */  lui        $a1, 0x200
/* CFC7C 800CF07C 34A50800 */  ori        $a1, $a1, 0x800
/* CFC80 800CF080 AFB20028 */  sw         $s2, 0x28($sp)
/* CFC84 800CF084 00809021 */  addu       $s2, $a0, $zero
/* CFC88 800CF088 AFBF0038 */  sw         $ra, 0x38($sp)
/* CFC8C 800CF08C AFB10024 */  sw         $s1, 0x24($sp)
/* CFC90 800CF090 AFB00020 */  sw         $s0, 0x20($sp)
/* CFC94 800CF094 8E44001C */  lw         $a0, 0x1c($s2)
/* CFC98 800CF098 00C01021 */  addu       $v0, $a2, $zero
/* CFC9C 800CF09C 24C60008 */  addiu      $a2, $a2, 8
/* CFCA0 800CF0A0 AC430000 */  sw         $v1, ($v0)
/* CFCA4 800CF0A4 00131840 */  sll        $v1, $s3, 1
/* CFCA8 800CF0A8 AC430004 */  sw         $v1, 4($v0)
/* CFCAC 800CF0AC 00C01021 */  addu       $v0, $a2, $zero
/* CFCB0 800CF0B0 AC450000 */  sw         $a1, ($v0)
/* CFCB4 800CF0B4 AC430004 */  sw         $v1, 4($v0)
/* CFCB8 800CF0B8 8E420014 */  lw         $v0, 0x14($s2)
/* CFCBC 800CF0BC 00008821 */  addu       $s1, $zero, $zero
/* CFCC0 800CF0C0 18400010 */  blez       $v0, .L800CF104
/* CFCC4 800CF0C4 24C60008 */   addiu     $a2, $a2, 8
/* CFCC8 800CF0C8 00808021 */  addu       $s0, $a0, $zero
.L800CF0CC:
/* CFCCC 800CF0CC 8E020000 */  lw         $v0, ($s0)
/* CFCD0 800CF0D0 AFA60010 */  sw         $a2, 0x10($sp)
/* CFCD4 800CF0D4 8E040000 */  lw         $a0, ($s0)
/* CFCD8 800CF0D8 26100004 */  addiu      $s0, $s0, 4
/* CFCDC 800CF0DC 02802821 */  addu       $a1, $s4, $zero
/* CFCE0 800CF0E0 8C420004 */  lw         $v0, 4($v0)
/* CFCE4 800CF0E4 02603021 */  addu       $a2, $s3, $zero
/* CFCE8 800CF0E8 0040F809 */  jalr       $v0
/* CFCEC 800CF0EC 02A03821 */   addu      $a3, $s5, $zero
/* CFCF0 800CF0F0 8E430014 */  lw         $v1, 0x14($s2)
/* CFCF4 800CF0F4 26310001 */  addiu      $s1, $s1, 1
/* CFCF8 800CF0F8 0223182A */  slt        $v1, $s1, $v1
/* CFCFC 800CF0FC 1460FFF3 */  bnez       $v1, .L800CF0CC
/* CFD00 800CF100 00403021 */   addu      $a2, $v0, $zero
.L800CF104:
/* CFD04 800CF104 00C01021 */  addu       $v0, $a2, $zero
/* CFD08 800CF108 8FBF0038 */  lw         $ra, 0x38($sp)
/* CFD0C 800CF10C 8FB50034 */  lw         $s5, 0x34($sp)
/* CFD10 800CF110 8FB40030 */  lw         $s4, 0x30($sp)
/* CFD14 800CF114 8FB3002C */  lw         $s3, 0x2c($sp)
/* CFD18 800CF118 8FB20028 */  lw         $s2, 0x28($sp)
/* CFD1C 800CF11C 8FB10024 */  lw         $s1, 0x24($sp)
/* CFD20 800CF120 8FB00020 */  lw         $s0, 0x20($sp)
/* CFD24 800CF124 03E00008 */  jr         $ra
/* CFD28 800CF128 27BD0040 */   addiu     $sp, $sp, 0x40

glabel alAuxBusParam
/* CFD2C 800CF12C 8C87001C */  lw         $a3, 0x1c($a0)
/* CFD30 800CF130 24020002 */  addiu      $v0, $zero, 2
/* CFD34 800CF134 14A20007 */  bne        $a1, $v0, .L800CF154
/* CFD38 800CF138 00000000 */   nop
/* CFD3C 800CF13C 8C820014 */  lw         $v0, 0x14($a0)
/* CFD40 800CF140 24430001 */  addiu      $v1, $v0, 1
/* CFD44 800CF144 00021080 */  sll        $v0, $v0, 2
/* CFD48 800CF148 00471021 */  addu       $v0, $v0, $a3
/* CFD4C 800CF14C AC830014 */  sw         $v1, 0x14($a0)
/* CFD50 800CF150 AC460000 */  sw         $a2, ($v0)
.L800CF154:
/* CFD54 800CF154 03E00008 */  jr         $ra
/* CFD58 800CF158 00001021 */   addu      $v0, $zero, $zero
/* CFD5C 800CF15C 00000000 */  nop
