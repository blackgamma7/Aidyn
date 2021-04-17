.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800BA550
/* BB150 800BA550 8CA50040 */  lw         $a1, 0x40($a1)
/* BB154 800BA554 94A2000C */  lhu        $v0, 0xc($a1)
/* BB158 800BA558 54400003 */  bnel       $v0, $zero, .L800BA568
/* BB15C 800BA55C 94A40006 */   lhu       $a0, 6($a1)
/* BB160 800BA560 03E00008 */  jr         $ra
/* BB164 800BA564 00001021 */   addu      $v0, $zero, $zero
.L800BA568:
/* BB168 800BA568 94A3000A */  lhu        $v1, 0xa($a1)
/* BB16C 800BA56C 00831023 */  subu       $v0, $a0, $v1
/* BB170 800BA570 04420003 */  bltzl      $v0, .L800BA580
/* BB174 800BA574 94A6000C */   lhu       $a2, 0xc($a1)
/* BB178 800BA578 0802E96E */  j          .L800BA5B8
/* BB17C 800BA57C A4A20006 */   sh        $v0, 6($a1)
.L800BA580:
/* BB180 800BA580 00831021 */  addu       $v0, $a0, $v1
/* BB184 800BA584 0046102A */  slt        $v0, $v0, $a2
/* BB188 800BA588 1040000B */  beqz       $v0, .L800BA5B8
/* BB18C 800BA58C 00604021 */   addu      $t0, $v1, $zero
/* BB190 800BA590 00603821 */  addu       $a3, $v1, $zero
/* BB194 800BA594 00801821 */  addu       $v1, $a0, $zero
/* BB198 800BA598 00682021 */  addu       $a0, $v1, $t0
.L800BA59C:
/* BB19C 800BA59C 00801821 */  addu       $v1, $a0, $zero
/* BB1A0 800BA5A0 3062FFFF */  andi       $v0, $v1, 0xffff
/* BB1A4 800BA5A4 00471021 */  addu       $v0, $v0, $a3
/* BB1A8 800BA5A8 0046102A */  slt        $v0, $v0, $a2
/* BB1AC 800BA5AC 5440FFFB */  bnel       $v0, $zero, .L800BA59C
/* BB1B0 800BA5B0 00682021 */   addu      $a0, $v1, $t0
/* BB1B4 800BA5B4 A4A40006 */  sh         $a0, 6($a1)
.L800BA5B8:
/* BB1B8 800BA5B8 94A30006 */  lhu        $v1, 6($a1)
/* BB1BC 800BA5BC 8CA20000 */  lw         $v0, ($a1)
/* BB1C0 800BA5C0 00031880 */  sll        $v1, $v1, 2
/* BB1C4 800BA5C4 00621821 */  addu       $v1, $v1, $v0
/* BB1C8 800BA5C8 03E00008 */  jr         $ra
/* BB1CC 800BA5CC 8C620000 */   lw        $v0, ($v1)

glabel func_800BA5D0
/* BB1D0 800BA5D0 8CA50040 */  lw         $a1, 0x40($a1)
/* BB1D4 800BA5D4 94A2000C */  lhu        $v0, 0xc($a1)
/* BB1D8 800BA5D8 54400003 */  bnel       $v0, $zero, .L800BA5E8
/* BB1DC 800BA5DC 94A60006 */   lhu       $a2, 6($a1)
/* BB1E0 800BA5E0 03E00008 */  jr         $ra
/* BB1E4 800BA5E4 00001021 */   addu      $v0, $zero, $zero
.L800BA5E8:
/* BB1E8 800BA5E8 94A3000A */  lhu        $v1, 0xa($a1)
/* BB1EC 800BA5EC 94A2000C */  lhu        $v0, 0xc($a1)
/* BB1F0 800BA5F0 00C32021 */  addu       $a0, $a2, $v1
/* BB1F4 800BA5F4 0082102A */  slt        $v0, $a0, $v0
/* BB1F8 800BA5F8 5440000D */  bnel       $v0, $zero, .L800BA630
/* BB1FC 800BA5FC A4A40006 */   sh        $a0, 6($a1)
/* BB200 800BA600 00C31023 */  subu       $v0, $a2, $v1
/* BB204 800BA604 0440000A */  bltz       $v0, .L800BA630
/* BB208 800BA608 00604021 */   addu      $t0, $v1, $zero
/* BB20C 800BA60C 00603821 */  addu       $a3, $v1, $zero
/* BB210 800BA610 00C01821 */  addu       $v1, $a2, $zero
/* BB214 800BA614 00682023 */  subu       $a0, $v1, $t0
.L800BA618:
/* BB218 800BA618 00801821 */  addu       $v1, $a0, $zero
/* BB21C 800BA61C 3062FFFF */  andi       $v0, $v1, 0xffff
/* BB220 800BA620 00471023 */  subu       $v0, $v0, $a3
/* BB224 800BA624 0443FFFC */  bgezl      $v0, .L800BA618
/* BB228 800BA628 00682023 */   subu      $a0, $v1, $t0
/* BB22C 800BA62C A4A40006 */  sh         $a0, 6($a1)
.L800BA630:
/* BB230 800BA630 94A30006 */  lhu        $v1, 6($a1)
/* BB234 800BA634 8CA20000 */  lw         $v0, ($a1)
/* BB238 800BA638 00031880 */  sll        $v1, $v1, 2
/* BB23C 800BA63C 00621821 */  addu       $v1, $v1, $v0
/* BB240 800BA640 03E00008 */  jr         $ra
/* BB244 800BA644 8C620000 */   lw        $v0, ($v1)

glabel func_800BA648
/* BB248 800BA648 8CA40040 */  lw         $a0, 0x40($a1)
/* BB24C 800BA64C 9482000C */  lhu        $v0, 0xc($a0)
/* BB250 800BA650 54400003 */  bnel       $v0, $zero, .L800BA660
/* BB254 800BA654 94850006 */   lhu       $a1, 6($a0)
/* BB258 800BA658 03E00008 */  jr         $ra
/* BB25C 800BA65C 00001021 */   addu      $v0, $zero, $zero
.L800BA660:
/* BB260 800BA660 9483000A */  lhu        $v1, 0xa($a0)
/* BB264 800BA664 00A3001B */  divu       $zero, $a1, $v1
/* BB268 800BA668 00001010 */  mfhi       $v0
/* BB26C 800BA66C 50600001 */  beql       $v1, $zero, .L800BA674
/* BB270 800BA670 000001CD */   break     0, 7
.L800BA674:
/* BB274 800BA674 1440000A */   bnez      $v0, .L800BA6A0
/* BB278 800BA678 24A2FFFF */   addiu     $v0, $a1, -1
/* BB27C 800BA67C 00A31021 */  addu       $v0, $a1, $v1
/* BB280 800BA680 9486000C */  lhu        $a2, 0xc($a0)
/* BB284 800BA684 2442FFFF */  addiu      $v0, $v0, -1
/* BB288 800BA688 0046102A */  slt        $v0, $v0, $a2
/* BB28C 800BA68C 50400004 */  beql       $v0, $zero, .L800BA6A0
/* BB290 800BA690 24C2FFFF */   addiu     $v0, $a2, -1
/* BB294 800BA694 3402FFFF */  ori        $v0, $zero, 0xffff
/* BB298 800BA698 00A21021 */  addu       $v0, $a1, $v0
/* BB29C 800BA69C 00621021 */  addu       $v0, $v1, $v0
.L800BA6A0:
/* BB2A0 800BA6A0 A4820006 */  sh         $v0, 6($a0)
/* BB2A4 800BA6A4 94830006 */  lhu        $v1, 6($a0)
/* BB2A8 800BA6A8 8C820000 */  lw         $v0, ($a0)
/* BB2AC 800BA6AC 00031880 */  sll        $v1, $v1, 2
/* BB2B0 800BA6B0 00621821 */  addu       $v1, $v1, $v0
/* BB2B4 800BA6B4 03E00008 */  jr         $ra
/* BB2B8 800BA6B8 8C620000 */   lw        $v0, ($v1)

glabel func_800BA6BC
/* BB2BC 800BA6BC 8CA50040 */  lw         $a1, 0x40($a1)
/* BB2C0 800BA6C0 94A2000C */  lhu        $v0, 0xc($a1)
/* BB2C4 800BA6C4 54400003 */  bnel       $v0, $zero, .L800BA6D4
/* BB2C8 800BA6C8 94A60006 */   lhu       $a2, 6($a1)
/* BB2CC 800BA6CC 03E00008 */  jr         $ra
/* BB2D0 800BA6D0 00001021 */   addu      $v0, $zero, $zero
.L800BA6D4:
/* BB2D4 800BA6D4 2442FFFF */  addiu      $v0, $v0, -1
/* BB2D8 800BA6D8 00C2102A */  slt        $v0, $a2, $v0
/* BB2DC 800BA6DC 1040000B */  beqz       $v0, .L800BA70C
/* BB2E0 800BA6E0 24C30001 */   addiu     $v1, $a2, 1
/* BB2E4 800BA6E4 94A4000A */  lhu        $a0, 0xa($a1)
/* BB2E8 800BA6E8 0064001A */  div        $zero, $v1, $a0
/* BB2EC 800BA6EC 00001010 */  mfhi       $v0
/* BB2F0 800BA6F0 50800001 */  beql       $a0, $zero, .L800BA6F8
/* BB2F4 800BA6F4 000001CD */   break     0, 7
.L800BA6F8:
/* BB2F8 800BA6F8 5440000B */   bnel      $v0, $zero, .L800BA728
/* BB2FC 800BA6FC A4A30006 */   sh        $v1, 6($a1)
/* BB300 800BA700 00641023 */  subu       $v0, $v1, $a0
/* BB304 800BA704 0802E9CA */  j          .L800BA728
/* BB308 800BA708 A4A20006 */   sh        $v0, 6($a1)
.L800BA70C:
/* BB30C 800BA70C 94A2000A */  lhu        $v0, 0xa($a1)
/* BB310 800BA710 00C2001B */  divu       $zero, $a2, $v0
/* BB314 800BA714 00001810 */  mfhi       $v1
/* BB318 800BA718 50400001 */  beql       $v0, $zero, .L800BA720
/* BB31C 800BA71C 000001CD */   break     0, 7
.L800BA720:
/* BB320 800BA720 00C31823 */   subu      $v1, $a2, $v1
/* BB324 800BA724 A4A30006 */  sh         $v1, 6($a1)
.L800BA728:
/* BB328 800BA728 94A30006 */  lhu        $v1, 6($a1)
/* BB32C 800BA72C 8CA20000 */  lw         $v0, ($a1)
/* BB330 800BA730 00031880 */  sll        $v1, $v1, 2
/* BB334 800BA734 00621821 */  addu       $v1, $v1, $v0
/* BB338 800BA738 03E00008 */  jr         $ra
/* BB33C 800BA73C 8C620000 */   lw        $v0, ($v1)

glabel func_800BA740
/* BB340 800BA740 8CA20040 */  lw         $v0, 0x40($a1)
/* BB344 800BA744 94430006 */  lhu        $v1, 6($v0)
/* BB348 800BA748 8C440000 */  lw         $a0, ($v0)
/* BB34C 800BA74C 00031880 */  sll        $v1, $v1, 2
/* BB350 800BA750 00641821 */  addu       $v1, $v1, $a0
/* BB354 800BA754 03E00008 */  jr         $ra
/* BB358 800BA758 8C620000 */   lw        $v0, ($v1)

glabel widgetarraymenu_func
/* BB35C 800BA75C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BB360 800BA760 AFB10014 */  sw         $s1, 0x14($sp)
/* BB364 800BA764 00808821 */  addu       $s1, $a0, $zero
/* BB368 800BA768 AFB20018 */  sw         $s2, 0x18($sp)
/* BB36C 800BA76C 30B2FFFF */  andi       $s2, $a1, 0xffff
/* BB370 800BA770 AFBF001C */  sw         $ra, 0x1c($sp)
/* BB374 800BA774 0C02DCFC */  jal        widget_init
/* BB378 800BA778 AFB00010 */   sw        $s0, 0x10($sp)
/* BB37C 800BA77C 24040014 */  addiu      $a0, $zero, 0x14
/* BB380 800BA780 3C02800E */  lui        $v0, %hi(D_800E46E0)
/* BB384 800BA784 244246E0 */  addiu      $v0, $v0, %lo(D_800E46E0)
/* BB388 800BA788 0C026259 */  jal        passToMalloc
/* BB38C 800BA78C AE220078 */   sw        $v0, 0x78($s1)
/* BB390 800BA790 00408021 */  addu       $s0, $v0, $zero
/* BB394 800BA794 24020002 */  addiu      $v0, $zero, 2
/* BB398 800BA798 A602000A */  sh         $v0, 0xa($s0)
/* BB39C 800BA79C 24020005 */  addiu      $v0, $zero, 5
/* BB3A0 800BA7A0 A6020008 */  sh         $v0, 8($s0)
/* BB3A4 800BA7A4 3C02800C */  lui        $v0, %hi(func_800BA550)
/* BB3A8 800BA7A8 2442A550 */  addiu      $v0, $v0, %lo(func_800BA550)
/* BB3AC 800BA7AC 3C03800C */  lui        $v1, %hi(func_800BA5D0)
/* BB3B0 800BA7B0 2463A5D0 */  addiu      $v1, $v1, %lo(func_800BA5D0)
/* BB3B4 800BA7B4 AE220008 */  sw         $v0, 8($s1)
/* BB3B8 800BA7B8 3C02800C */  lui        $v0, %hi(func_800BA648)
/* BB3BC 800BA7BC 2442A648 */  addiu      $v0, $v0, %lo(func_800BA648)
/* BB3C0 800BA7C0 AE23000C */  sw         $v1, 0xc($s1)
/* BB3C4 800BA7C4 3C03800C */  lui        $v1, %hi(func_800BA6BC)
/* BB3C8 800BA7C8 2463A6BC */  addiu      $v1, $v1, %lo(func_800BA6BC)
/* BB3CC 800BA7CC AE220010 */  sw         $v0, 0x10($s1)
/* BB3D0 800BA7D0 3C02800C */  lui        $v0, %hi(func_800BA740)
/* BB3D4 800BA7D4 2442A740 */  addiu      $v0, $v0, %lo(func_800BA740)
/* BB3D8 800BA7D8 A600000C */  sh         $zero, 0xc($s0)
/* BB3DC 800BA7DC A6120004 */  sh         $s2, 4($s0)
/* BB3E0 800BA7E0 A6000006 */  sh         $zero, 6($s0)
/* BB3E4 800BA7E4 A6000010 */  sh         $zero, 0x10($s0)
/* BB3E8 800BA7E8 A6200060 */  sh         $zero, 0x60($s1)
/* BB3EC 800BA7EC A6200062 */  sh         $zero, 0x62($s1)
/* BB3F0 800BA7F0 A6200074 */  sh         $zero, 0x74($s1)
/* BB3F4 800BA7F4 A6200072 */  sh         $zero, 0x72($s1)
/* BB3F8 800BA7F8 AE230014 */  sw         $v1, 0x14($s1)
/* BB3FC 800BA7FC 1240000F */  beqz       $s2, .L800BA83C
/* BB400 800BA800 AE220018 */   sw        $v0, 0x18($s1)
/* BB404 800BA804 00122080 */  sll        $a0, $s2, 2
/* BB408 800BA808 3C05800E */  lui        $a1, %hi(D_800E46C0)
/* BB40C 800BA80C 24A546C0 */  addiu      $a1, $a1, %lo(D_800E46C0)
/* BB410 800BA810 0C025F9C */  jal        Malloc
/* BB414 800BA814 240600B3 */   addiu     $a2, $zero, 0xb3
/* BB418 800BA818 12400009 */  beqz       $s2, .L800BA840
/* BB41C 800BA81C AE020000 */   sw        $v0, ($s0)
/* BB420 800BA820 02402021 */  addu       $a0, $s2, $zero
.L800BA824:
/* BB424 800BA824 AC400000 */  sw         $zero, ($v0)
/* BB428 800BA828 2484FFFF */  addiu      $a0, $a0, -1
/* BB42C 800BA82C 1480FFFD */  bnez       $a0, .L800BA824
/* BB430 800BA830 24420004 */   addiu     $v0, $v0, 4
/* BB434 800BA834 0802EA11 */  j          .L800BA844
/* BB438 800BA838 02201021 */   addu      $v0, $s1, $zero
.L800BA83C:
/* BB43C 800BA83C AE000000 */  sw         $zero, ($s0)
.L800BA840:
/* BB440 800BA840 02201021 */  addu       $v0, $s1, $zero
.L800BA844:
/* BB444 800BA844 8FBF001C */  lw         $ra, 0x1c($sp)
/* BB448 800BA848 8FB20018 */  lw         $s2, 0x18($sp)
/* BB44C 800BA84C 24030001 */  addiu      $v1, $zero, 1
/* BB450 800BA850 AE300040 */  sw         $s0, 0x40($s1)
/* BB454 800BA854 A2230070 */  sb         $v1, 0x70($s1)
/* BB458 800BA858 8FB10014 */  lw         $s1, 0x14($sp)
/* BB45C 800BA85C 8FB00010 */  lw         $s0, 0x10($sp)
/* BB460 800BA860 03E00008 */  jr         $ra
/* BB464 800BA864 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BA868
/* BB468 800BA868 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BB46C 800BA86C AFB3001C */  sw         $s3, 0x1c($sp)
/* BB470 800BA870 00809821 */  addu       $s3, $a0, $zero
/* BB474 800BA874 3C02800E */  lui        $v0, %hi(D_800E46E0)
/* BB478 800BA878 244246E0 */  addiu      $v0, $v0, %lo(D_800E46E0)
/* BB47C 800BA87C AFBF0024 */  sw         $ra, 0x24($sp)
/* BB480 800BA880 AFB40020 */  sw         $s4, 0x20($sp)
/* BB484 800BA884 AFB20018 */  sw         $s2, 0x18($sp)
/* BB488 800BA888 AFB10014 */  sw         $s1, 0x14($sp)
/* BB48C 800BA88C AFB00010 */  sw         $s0, 0x10($sp)
/* BB490 800BA890 8E710040 */  lw         $s1, 0x40($s3)
/* BB494 800BA894 00A0A021 */  addu       $s4, $a1, $zero
/* BB498 800BA898 1220001F */  beqz       $s1, .L800BA918
/* BB49C 800BA89C AE620078 */   sw        $v0, 0x78($s3)
/* BB4A0 800BA8A0 96220004 */  lhu        $v0, 4($s1)
/* BB4A4 800BA8A4 10400014 */  beqz       $v0, .L800BA8F8
/* BB4A8 800BA8A8 00008021 */   addu      $s0, $zero, $zero
/* BB4AC 800BA8AC 8E220000 */  lw         $v0, ($s1)
.L800BA8B0:
/* BB4B0 800BA8B0 00109080 */  sll        $s2, $s0, 2
/* BB4B4 800BA8B4 02421021 */  addu       $v0, $s2, $v0
/* BB4B8 800BA8B8 8C460000 */  lw         $a2, ($v0)
/* BB4BC 800BA8BC 10C00009 */  beqz       $a2, .L800BA8E4
/* BB4C0 800BA8C0 24050003 */   addiu     $a1, $zero, 3
/* BB4C4 800BA8C4 8CC20078 */  lw         $v0, 0x78($a2)
/* BB4C8 800BA8C8 84440008 */  lh         $a0, 8($v0)
/* BB4CC 800BA8CC 8C43000C */  lw         $v1, 0xc($v0)
/* BB4D0 800BA8D0 0060F809 */  jalr       $v1
/* BB4D4 800BA8D4 00C42021 */   addu      $a0, $a2, $a0
/* BB4D8 800BA8D8 8E220000 */  lw         $v0, ($s1)
/* BB4DC 800BA8DC 02421021 */  addu       $v0, $s2, $v0
/* BB4E0 800BA8E0 AC400000 */  sw         $zero, ($v0)
.L800BA8E4:
/* BB4E4 800BA8E4 96220004 */  lhu        $v0, 4($s1)
/* BB4E8 800BA8E8 26100001 */  addiu      $s0, $s0, 1
/* BB4EC 800BA8EC 0202102A */  slt        $v0, $s0, $v0
/* BB4F0 800BA8F0 5440FFEF */  bnel       $v0, $zero, .L800BA8B0
/* BB4F4 800BA8F4 8E220000 */   lw        $v0, ($s1)
.L800BA8F8:
/* BB4F8 800BA8F8 3C05800E */  lui        $a1, %hi(D_800E46C0)
/* BB4FC 800BA8FC 24A546C0 */  addiu      $a1, $a1, %lo(D_800E46C0)
/* BB500 800BA900 8E240000 */  lw         $a0, ($s1)
/* BB504 800BA904 0C02600C */  jal        Free
/* BB508 800BA908 240600D4 */   addiu     $a2, $zero, 0xd4
/* BB50C 800BA90C 0C026262 */  jal        passToFree
/* BB510 800BA910 02202021 */   addu      $a0, $s1, $zero
/* BB514 800BA914 AE600040 */  sw         $zero, 0x40($s3)
.L800BA918:
/* BB518 800BA918 02602021 */  addu       $a0, $s3, $zero
/* BB51C 800BA91C 0C02DD2B */  jal        free_widget
/* BB520 800BA920 02802821 */   addu      $a1, $s4, $zero
/* BB524 800BA924 8FBF0024 */  lw         $ra, 0x24($sp)
/* BB528 800BA928 8FB40020 */  lw         $s4, 0x20($sp)
/* BB52C 800BA92C 8FB3001C */  lw         $s3, 0x1c($sp)
/* BB530 800BA930 8FB20018 */  lw         $s2, 0x18($sp)
/* BB534 800BA934 8FB10014 */  lw         $s1, 0x14($sp)
/* BB538 800BA938 8FB00010 */  lw         $s0, 0x10($sp)
/* BB53C 800BA93C 03E00008 */  jr         $ra
/* BB540 800BA940 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BA944
/* BB544 800BA944 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BB548 800BA948 AFB00018 */  sw         $s0, 0x18($sp)
/* BB54C 800BA94C 00008021 */  addu       $s0, $zero, $zero
/* BB550 800BA950 AFB60030 */  sw         $s6, 0x30($sp)
/* BB554 800BA954 0080B021 */  addu       $s6, $a0, $zero
/* BB558 800BA958 00063400 */  sll        $a2, $a2, 0x10
/* BB55C 800BA95C AFB5002C */  sw         $s5, 0x2c($sp)
/* BB560 800BA960 0006AC03 */  sra        $s5, $a2, 0x10
/* BB564 800BA964 00073C00 */  sll        $a3, $a3, 0x10
/* BB568 800BA968 AFB40028 */  sw         $s4, 0x28($sp)
/* BB56C 800BA96C 0007A403 */  sra        $s4, $a3, 0x10
/* BB570 800BA970 AFBF0034 */  sw         $ra, 0x34($sp)
/* BB574 800BA974 AFB30024 */  sw         $s3, 0x24($sp)
/* BB578 800BA978 AFB20020 */  sw         $s2, 0x20($sp)
/* BB57C 800BA97C AFB1001C */  sw         $s1, 0x1c($sp)
/* BB580 800BA980 8ED10040 */  lw         $s1, 0x40($s6)
/* BB584 800BA984 87B3004A */  lh         $s3, 0x4a($sp)
/* BB588 800BA988 9622000C */  lhu        $v0, 0xc($s1)
/* BB58C 800BA98C 10400015 */  beqz       $v0, .L800BA9E4
/* BB590 800BA990 87B2004E */   lh        $s2, 0x4e($sp)
/* BB594 800BA994 8E230000 */  lw         $v1, ($s1)
.L800BA998:
/* BB598 800BA998 00101080 */  sll        $v0, $s0, 2
/* BB59C 800BA99C 00431021 */  addu       $v0, $v0, $v1
/* BB5A0 800BA9A0 8C480000 */  lw         $t0, ($v0)
/* BB5A4 800BA9A4 1100000A */  beqz       $t0, .L800BA9D0
/* BB5A8 800BA9A8 02A03021 */   addu      $a2, $s5, $zero
/* BB5AC 800BA9AC 8D030078 */  lw         $v1, 0x78($t0)
/* BB5B0 800BA9B0 84640040 */  lh         $a0, 0x40($v1)
/* BB5B4 800BA9B4 02803821 */  addu       $a3, $s4, $zero
/* BB5B8 800BA9B8 AFB30010 */  sw         $s3, 0x10($sp)
/* BB5BC 800BA9BC AFB20014 */  sw         $s2, 0x14($sp)
/* BB5C0 800BA9C0 8C620044 */  lw         $v0, 0x44($v1)
/* BB5C4 800BA9C4 0040F809 */  jalr       $v0
/* BB5C8 800BA9C8 01042021 */   addu      $a0, $t0, $a0
/* BB5CC 800BA9CC 00402821 */  addu       $a1, $v0, $zero
.L800BA9D0:
/* BB5D0 800BA9D0 9622000C */  lhu        $v0, 0xc($s1)
/* BB5D4 800BA9D4 26100001 */  addiu      $s0, $s0, 1
/* BB5D8 800BA9D8 0202102A */  slt        $v0, $s0, $v0
/* BB5DC 800BA9DC 5440FFEE */  bnel       $v0, $zero, .L800BA998
/* BB5E0 800BA9E0 8E230000 */   lw        $v1, ($s1)
.L800BA9E4:
/* BB5E4 800BA9E4 02C02021 */  addu       $a0, $s6, $zero
/* BB5E8 800BA9E8 02A03021 */  addu       $a2, $s5, $zero
/* BB5EC 800BA9EC 02803821 */  addu       $a3, $s4, $zero
/* BB5F0 800BA9F0 AFB30010 */  sw         $s3, 0x10($sp)
/* BB5F4 800BA9F4 0C02DE14 */  jal        widget_func_8
/* BB5F8 800BA9F8 AFB20014 */   sw        $s2, 0x14($sp)
/* BB5FC 800BA9FC 8FBF0034 */  lw         $ra, 0x34($sp)
/* BB600 800BAA00 8FB60030 */  lw         $s6, 0x30($sp)
/* BB604 800BAA04 8FB5002C */  lw         $s5, 0x2c($sp)
/* BB608 800BAA08 8FB40028 */  lw         $s4, 0x28($sp)
/* BB60C 800BAA0C 8FB30024 */  lw         $s3, 0x24($sp)
/* BB610 800BAA10 8FB20020 */  lw         $s2, 0x20($sp)
/* BB614 800BAA14 8FB1001C */  lw         $s1, 0x1c($sp)
/* BB618 800BAA18 8FB00018 */  lw         $s0, 0x18($sp)
/* BB61C 800BAA1C 03E00008 */  jr         $ra
/* BB620 800BAA20 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800BAA24
/* BB624 800BAA24 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BB628 800BAA28 AFB1001C */  sw         $s1, 0x1c($sp)
/* BB62C 800BAA2C 00808821 */  addu       $s1, $a0, $zero
/* BB630 800BAA30 AFBF0034 */  sw         $ra, 0x34($sp)
/* BB634 800BAA34 AFB60030 */  sw         $s6, 0x30($sp)
/* BB638 800BAA38 AFB5002C */  sw         $s5, 0x2c($sp)
/* BB63C 800BAA3C AFB40028 */  sw         $s4, 0x28($sp)
/* BB640 800BAA40 AFB30024 */  sw         $s3, 0x24($sp)
/* BB644 800BAA44 AFB20020 */  sw         $s2, 0x20($sp)
/* BB648 800BAA48 AFB00018 */  sw         $s0, 0x18($sp)
/* BB64C 800BAA4C 8E340040 */  lw         $s4, 0x40($s1)
/* BB650 800BAA50 86220066 */  lh         $v0, 0x66($s1)
/* BB654 800BAA54 86230064 */  lh         $v1, 0x64($s1)
/* BB658 800BAA58 9693000A */  lhu        $s3, 0xa($s4)
/* BB65C 800BAA5C 00431023 */  subu       $v0, $v0, $v1
/* BB660 800BAA60 0053001A */  div        $zero, $v0, $s3
/* BB664 800BAA64 00001012 */  mflo       $v0
/* BB668 800BAA68 52600001 */  beql       $s3, $zero, .L800BAA70
/* BB66C 800BAA6C 000001CD */   break     0, 7
.L800BAA70:
/* BB670 800BAA70 8E850000 */   lw        $a1, ($s4)
/* BB674 800BAA74 10A0004F */  beqz       $a1, .L800BABB4
/* BB678 800BAA78 0040B021 */   addu      $s6, $v0, $zero
/* BB67C 800BAA7C 8CA50000 */  lw         $a1, ($a1)
/* BB680 800BAA80 8CA30078 */  lw         $v1, 0x78($a1)
/* BB684 800BAA84 00009021 */  addu       $s2, $zero, $zero
/* BB688 800BAA88 84640020 */  lh         $a0, 0x20($v1)
/* BB68C 800BAA8C 8C620024 */  lw         $v0, 0x24($v1)
/* BB690 800BAA90 0040F809 */  jalr       $v0
/* BB694 800BAA94 00A42021 */   addu      $a0, $a1, $a0
/* BB698 800BAA98 96830008 */  lhu        $v1, 8($s4)
/* BB69C 800BAA9C 9684000C */  lhu        $a0, 0xc($s4)
/* BB6A0 800BAAA0 10800044 */  beqz       $a0, .L800BABB4
/* BB6A4 800BAAA4 0062A821 */   addu      $s5, $v1, $v0
/* BB6A8 800BAAA8 8E830000 */  lw         $v1, ($s4)
.L800BAAAC:
/* BB6AC 800BAAAC 00121080 */  sll        $v0, $s2, 2
/* BB6B0 800BAAB0 00431021 */  addu       $v0, $v0, $v1
/* BB6B4 800BAAB4 8C500000 */  lw         $s0, ($v0)
/* BB6B8 800BAAB8 96230064 */  lhu        $v1, 0x64($s1)
/* BB6BC 800BAABC A6030064 */  sh         $v1, 0x64($s0)
/* BB6C0 800BAAC0 96220066 */  lhu        $v0, 0x66($s1)
/* BB6C4 800BAAC4 A6020066 */  sh         $v0, 0x66($s0)
/* BB6C8 800BAAC8 96230068 */  lhu        $v1, 0x68($s1)
/* BB6CC 800BAACC A6030068 */  sh         $v1, 0x68($s0)
/* BB6D0 800BAAD0 9622006A */  lhu        $v0, 0x6a($s1)
/* BB6D4 800BAAD4 8E030078 */  lw         $v1, 0x78($s0)
/* BB6D8 800BAAD8 A602006A */  sh         $v0, 0x6a($s0)
/* BB6DC 800BAADC 9222005B */  lbu        $v0, 0x5b($s1)
/* BB6E0 800BAAE0 84640048 */  lh         $a0, 0x48($v1)
/* BB6E4 800BAAE4 92250058 */  lbu        $a1, 0x58($s1)
/* BB6E8 800BAAE8 92260059 */  lbu        $a2, 0x59($s1)
/* BB6EC 800BAAEC AFA20010 */  sw         $v0, 0x10($sp)
/* BB6F0 800BAAF0 9227005A */  lbu        $a3, 0x5a($s1)
/* BB6F4 800BAAF4 8C62004C */  lw         $v0, 0x4c($v1)
/* BB6F8 800BAAF8 0040F809 */  jalr       $v0
/* BB6FC 800BAAFC 02042021 */   addu      $a0, $s0, $a0
/* BB700 800BAB00 8E030078 */  lw         $v1, 0x78($s0)
/* BB704 800BAB04 84640010 */  lh         $a0, 0x10($v1)
/* BB708 800BAB08 8C620014 */  lw         $v0, 0x14($v1)
/* BB70C 800BAB0C 0040F809 */  jalr       $v0
/* BB710 800BAB10 02042021 */   addu      $a0, $s0, $a0
/* BB714 800BAB14 24030001 */  addiu      $v1, $zero, 1
/* BB718 800BAB18 5043000B */  beql       $v0, $v1, .L800BAB48
/* BB71C 800BAB1C 86250064 */   lh        $a1, 0x64($s1)
/* BB720 800BAB20 8E030078 */  lw         $v1, 0x78($s0)
/* BB724 800BAB24 84640010 */  lh         $a0, 0x10($v1)
/* BB728 800BAB28 8C620014 */  lw         $v0, 0x14($v1)
/* BB72C 800BAB2C 0040F809 */  jalr       $v0
/* BB730 800BAB30 02042021 */   addu      $a0, $s0, $a0
/* BB734 800BAB34 24030002 */  addiu      $v1, $zero, 2
/* BB738 800BAB38 0253001A */  div        $zero, $s2, $s3
/* BB73C 800BAB3C 54430006 */  bnel       $v0, $v1, .L800BAB58
/* BB740 800BAB40 00000000 */   nop
/* BB744 800BAB44 86250064 */  lh         $a1, 0x64($s1)
.L800BAB48:
/* BB748 800BAB48 86260066 */  lh         $a2, 0x66($s1)
/* BB74C 800BAB4C 0C02EF52 */  jal        func_800BBD48
/* BB750 800BAB50 02002021 */   addu      $a0, $s0, $zero
/* BB754 800BAB54 0253001A */  div        $zero, $s2, $s3
.L800BAB58:
/* BB758 800BAB58 00001812 */  mflo       $v1
/* BB75C 800BAB5C 86270060 */  lh         $a3, 0x60($s1)
/* BB760 800BAB60 00001010 */  mfhi       $v0
/* BB764 800BAB64 52600001 */  beql       $s3, $zero, .L800BAB6C
/* BB768 800BAB68 000001CD */   break     0, 7
.L800BAB6C:
/* BB76C 800BAB6C 00560018 */   mult      $v0, $s6
/* BB770 800BAB70 86260062 */  lh         $a2, 0x62($s1)
/* BB774 800BAB74 86820010 */  lh         $v0, 0x10($s4)
/* BB778 800BAB78 00002812 */  mflo       $a1
/* BB77C 800BAB7C 00C23021 */  addu       $a2, $a2, $v0
/* BB780 800BAB80 52600001 */  beql       $s3, $zero, .L800BAB88
/* BB784 800BAB84 000001CD */   break     0, 7
.L800BAB88:
/* BB788 800BAB88 00750018 */   mult      $v1, $s5
/* BB78C 800BAB8C 02002021 */  addu       $a0, $s0, $zero
/* BB790 800BAB90 00E52821 */  addu       $a1, $a3, $a1
/* BB794 800BAB94 00001812 */  mflo       $v1
/* BB798 800BAB98 0C02DD3F */  jal        set_widget_coords
/* BB79C 800BAB9C 00C33021 */   addu      $a2, $a2, $v1
/* BB7A0 800BABA0 9682000C */  lhu        $v0, 0xc($s4)
/* BB7A4 800BABA4 26520001 */  addiu      $s2, $s2, 1
/* BB7A8 800BABA8 0242102A */  slt        $v0, $s2, $v0
/* BB7AC 800BABAC 5440FFBF */  bnel       $v0, $zero, .L800BAAAC
/* BB7B0 800BABB0 8E830000 */   lw        $v1, ($s4)
.L800BABB4:
/* BB7B4 800BABB4 0C02DE51 */  jal        func_800B7944
/* BB7B8 800BABB8 02202021 */   addu      $a0, $s1, $zero
/* BB7BC 800BABBC 8FBF0034 */  lw         $ra, 0x34($sp)
/* BB7C0 800BABC0 8FB60030 */  lw         $s6, 0x30($sp)
/* BB7C4 800BABC4 8FB5002C */  lw         $s5, 0x2c($sp)
/* BB7C8 800BABC8 8FB40028 */  lw         $s4, 0x28($sp)
/* BB7CC 800BABCC 8FB30024 */  lw         $s3, 0x24($sp)
/* BB7D0 800BABD0 8FB20020 */  lw         $s2, 0x20($sp)
/* BB7D4 800BABD4 8FB1001C */  lw         $s1, 0x1c($sp)
/* BB7D8 800BABD8 8FB00018 */  lw         $s0, 0x18($sp)
/* BB7DC 800BABDC 03E00008 */  jr         $ra
/* BB7E0 800BABE0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800BABE4
/* BB7E4 800BABE4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BB7E8 800BABE8 AFBF0018 */  sw         $ra, 0x18($sp)
/* BB7EC 800BABEC AFB10014 */  sw         $s1, 0x14($sp)
/* BB7F0 800BABF0 AFB00010 */  sw         $s0, 0x10($sp)
/* BB7F4 800BABF4 8C910040 */  lw         $s1, 0x40($a0)
/* BB7F8 800BABF8 9622000C */  lhu        $v0, 0xc($s1)
/* BB7FC 800BABFC 96230004 */  lhu        $v1, 4($s1)
/* BB800 800BAC00 0043102B */  sltu       $v0, $v0, $v1
/* BB804 800BAC04 10400018 */  beqz       $v0, .L800BAC68
/* BB808 800BAC08 00A08021 */   addu      $s0, $a1, $zero
/* BB80C 800BAC0C 94820064 */  lhu        $v0, 0x64($a0)
/* BB810 800BAC10 8E050078 */  lw         $a1, 0x78($s0)
/* BB814 800BAC14 A6020064 */  sh         $v0, 0x64($s0)
/* BB818 800BAC18 94830066 */  lhu        $v1, 0x66($a0)
/* BB81C 800BAC1C A6030066 */  sh         $v1, 0x66($s0)
/* BB820 800BAC20 94820068 */  lhu        $v0, 0x68($a0)
/* BB824 800BAC24 A6020068 */  sh         $v0, 0x68($s0)
/* BB828 800BAC28 9483006A */  lhu        $v1, 0x6a($a0)
/* BB82C 800BAC2C A603006A */  sh         $v1, 0x6a($s0)
/* BB830 800BAC30 84A40028 */  lh         $a0, 0x28($a1)
/* BB834 800BAC34 8CA2002C */  lw         $v0, 0x2c($a1)
/* BB838 800BAC38 0040F809 */  jalr       $v0
/* BB83C 800BAC3C 02042021 */   addu      $a0, $s0, $a0
/* BB840 800BAC40 24020001 */  addiu      $v0, $zero, 1
/* BB844 800BAC44 9623000C */  lhu        $v1, 0xc($s1)
/* BB848 800BAC48 8E250000 */  lw         $a1, ($s1)
/* BB84C 800BAC4C 9624000C */  lhu        $a0, 0xc($s1)
/* BB850 800BAC50 00031880 */  sll        $v1, $v1, 2
/* BB854 800BAC54 00651821 */  addu       $v1, $v1, $a1
/* BB858 800BAC58 24840001 */  addiu      $a0, $a0, 1
/* BB85C 800BAC5C AC700000 */  sw         $s0, ($v1)
/* BB860 800BAC60 0802EB1B */  j          .L800BAC6C
/* BB864 800BAC64 A624000C */   sh        $a0, 0xc($s1)
.L800BAC68:
/* BB868 800BAC68 00001021 */  addu       $v0, $zero, $zero
.L800BAC6C:
/* BB86C 800BAC6C 8FBF0018 */  lw         $ra, 0x18($sp)
/* BB870 800BAC70 8FB10014 */  lw         $s1, 0x14($sp)
/* BB874 800BAC74 8FB00010 */  lw         $s0, 0x10($sp)
/* BB878 800BAC78 03E00008 */  jr         $ra
/* BB87C 800BAC7C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BAC80
/* BB880 800BAC80 8C870040 */  lw         $a3, 0x40($a0)
/* BB884 800BAC84 94E3000C */  lhu        $v1, 0xc($a3)
/* BB888 800BAC88 10600011 */  beqz       $v1, .L800BACD0
/* BB88C 800BAC8C 00003021 */   addu      $a2, $zero, $zero
/* BB890 800BAC90 8CE80000 */  lw         $t0, ($a3)
/* BB894 800BAC94 8D020000 */  lw         $v0, ($t0)
/* BB898 800BAC98 1045000A */  beq        $v0, $a1, .L800BACC4
/* BB89C 800BAC9C 00602021 */   addu      $a0, $v1, $zero
/* BB8A0 800BACA0 00804821 */  addu       $t1, $a0, $zero
/* BB8A4 800BACA4 01001821 */  addu       $v1, $t0, $zero
/* BB8A8 800BACA8 24C60001 */  addiu      $a2, $a2, 1
.L800BACAC:
/* BB8AC 800BACAC 00C9102A */  slt        $v0, $a2, $t1
/* BB8B0 800BACB0 10400007 */  beqz       $v0, .L800BACD0
/* BB8B4 800BACB4 24630004 */   addiu     $v1, $v1, 4
/* BB8B8 800BACB8 8C620000 */  lw         $v0, ($v1)
/* BB8BC 800BACBC 5445FFFB */  bnel       $v0, $a1, .L800BACAC
/* BB8C0 800BACC0 24C60001 */   addiu     $a2, $a2, 1
.L800BACC4:
/* BB8C4 800BACC4 00C4102A */  slt        $v0, $a2, $a0
/* BB8C8 800BACC8 14400003 */  bnez       $v0, .L800BACD8
/* BB8CC 800BACCC 2482FFFF */   addiu     $v0, $a0, -1
.L800BACD0:
/* BB8D0 800BACD0 03E00008 */  jr         $ra
/* BB8D4 800BACD4 00001021 */   addu      $v0, $zero, $zero
.L800BACD8:
/* BB8D8 800BACD8 00C2102A */  slt        $v0, $a2, $v0
/* BB8DC 800BACDC 1040000C */  beqz       $v0, .L800BAD10
/* BB8E0 800BACE0 00061080 */   sll       $v0, $a2, 2
/* BB8E4 800BACE4 8CE30000 */  lw         $v1, ($a3)
/* BB8E8 800BACE8 94E4000C */  lhu        $a0, 0xc($a3)
/* BB8EC 800BACEC 00431821 */  addu       $v1, $v0, $v1
/* BB8F0 800BACF0 2484FFFF */  addiu      $a0, $a0, -1
/* BB8F4 800BACF4 00863023 */  subu       $a2, $a0, $a2
.L800BACF8:
/* BB8F8 800BACF8 8C620004 */  lw         $v0, 4($v1)
/* BB8FC 800BACFC 24C6FFFF */  addiu      $a2, $a2, -1
/* BB900 800BAD00 AC620000 */  sw         $v0, ($v1)
/* BB904 800BAD04 14C0FFFC */  bnez       $a2, .L800BACF8
/* BB908 800BAD08 24630004 */   addiu     $v1, $v1, 4
/* BB90C 800BAD0C 00803021 */  addu       $a2, $a0, $zero
.L800BAD10:
/* BB910 800BAD10 24020001 */  addiu      $v0, $zero, 1
/* BB914 800BAD14 00061880 */  sll        $v1, $a2, 2
/* BB918 800BAD18 8CE50000 */  lw         $a1, ($a3)
/* BB91C 800BAD1C 94E4000C */  lhu        $a0, 0xc($a3)
/* BB920 800BAD20 00651821 */  addu       $v1, $v1, $a1
/* BB924 800BAD24 2484FFFF */  addiu      $a0, $a0, -1
/* BB928 800BAD28 AC600000 */  sw         $zero, ($v1)
/* BB92C 800BAD2C 03E00008 */  jr         $ra
/* BB930 800BAD30 A4E4000C */   sh        $a0, 0xc($a3)

glabel ret9
/* BB934 800BAD34 03E00008 */  jr         $ra
/* BB938 800BAD38 24020009 */   addiu     $v0, $zero, 9
/* BB93C 800BAD3C 00000000 */  nop
