.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel borg8_widget
/* BA060 800B9460 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BA064 800B9464 AFB00010 */  sw         $s0, 0x10($sp)
/* BA068 800B9468 00808021 */  addu       $s0, $a0, $zero
/* BA06C 800B946C AFB10014 */  sw         $s1, 0x14($sp)
/* BA070 800B9470 AFBF0018 */  sw         $ra, 0x18($sp)
/* BA074 800B9474 0C02DCFC */  jal        widget_init
/* BA078 800B9478 00A08821 */   addu      $s1, $a1, $zero
/* BA07C 800B947C 3C03800E */  lui        $v1, %hi(widget_methods_borg8)
/* BA080 800B9480 24634420 */  addiu      $v1, $v1, %lo(widget_methods_borg8)
/* BA084 800B9484 AE030078 */  sw         $v1, 0x78($s0)
/* BA088 800B9488 16200005 */  bnez       $s1, .L800B94A0
/* BA08C 800B948C AE11006C */   sw        $s1, 0x6c($s0)
/* BA090 800B9490 24020020 */  addiu      $v0, $zero, 0x20
/* BA094 800B9494 A6020074 */  sh         $v0, 0x74($s0)
/* BA098 800B9498 0802E52C */  j          .L800B94B0
/* BA09C 800B949C A6020072 */   sh        $v0, 0x72($s0)
.L800B94A0:
/* BA0A0 800B94A0 9622000A */  lhu        $v0, 0xa($s1)
/* BA0A4 800B94A4 A6020074 */  sh         $v0, 0x74($s0)
/* BA0A8 800B94A8 9623000C */  lhu        $v1, 0xc($s1)
/* BA0AC 800B94AC A6030072 */  sh         $v1, 0x72($s0)
.L800B94B0:
/* BA0B0 800B94B0 02001021 */  addu       $v0, $s0, $zero
/* BA0B4 800B94B4 96050074 */  lhu        $a1, 0x74($s0)
/* BA0B8 800B94B8 8FBF0018 */  lw         $ra, 0x18($sp)
/* BA0BC 800B94BC 8FB10014 */  lw         $s1, 0x14($sp)
/* BA0C0 800B94C0 24030001 */  addiu      $v1, $zero, 1
/* BA0C4 800B94C4 A2030070 */  sb         $v1, 0x70($s0)
/* BA0C8 800B94C8 24030140 */  addiu      $v1, $zero, 0x140
/* BA0CC 800B94CC AE000040 */  sw         $zero, 0x40($s0)
/* BA0D0 800B94D0 00651823 */  subu       $v1, $v1, $a1
/* BA0D4 800B94D4 000327C2 */  srl        $a0, $v1, 0x1f
/* BA0D8 800B94D8 00641821 */  addu       $v1, $v1, $a0
/* BA0DC 800B94DC 96050072 */  lhu        $a1, 0x72($s0)
/* BA0E0 800B94E0 00031843 */  sra        $v1, $v1, 1
/* BA0E4 800B94E4 A6030060 */  sh         $v1, 0x60($s0)
/* BA0E8 800B94E8 240300F0 */  addiu      $v1, $zero, 0xf0
/* BA0EC 800B94EC 00651823 */  subu       $v1, $v1, $a1
/* BA0F0 800B94F0 000327C2 */  srl        $a0, $v1, 0x1f
/* BA0F4 800B94F4 00641821 */  addu       $v1, $v1, $a0
/* BA0F8 800B94F8 00031843 */  sra        $v1, $v1, 1
/* BA0FC 800B94FC A6030062 */  sh         $v1, 0x62($s0)
/* BA100 800B9500 8FB00010 */  lw         $s0, 0x10($sp)
/* BA104 800B9504 03E00008 */  jr         $ra
/* BA108 800B9508 27BD0020 */   addiu     $sp, $sp, 0x20

glabel free_borg8_widget_800b950c
/* BA10C 800B950C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BA110 800B9510 AFB00010 */  sw         $s0, 0x10($sp)
/* BA114 800B9514 00808021 */  addu       $s0, $a0, $zero
/* BA118 800B9518 3C02800E */  lui        $v0, %hi(widget_methods_borg8)
/* BA11C 800B951C 24424420 */  addiu      $v0, $v0, %lo(widget_methods_borg8)
/* BA120 800B9520 AFBF0018 */  sw         $ra, 0x18($sp)
/* BA124 800B9524 AFB10014 */  sw         $s1, 0x14($sp)
/* BA128 800B9528 8E04006C */  lw         $a0, 0x6c($s0)
/* BA12C 800B952C 00A08821 */  addu       $s1, $a1, $zero
/* BA130 800B9530 10800004 */  beqz       $a0, .L800B9544
/* BA134 800B9534 AE020078 */   sw        $v0, 0x78($s0)
/* BA138 800B9538 0C0299C0 */  jal        borg8_free
/* BA13C 800B953C 00000000 */   nop
/* BA140 800B9540 AE00006C */  sw         $zero, 0x6c($s0)
.L800B9544:
/* BA144 800B9544 02002021 */  addu       $a0, $s0, $zero
/* BA148 800B9548 0C02DD2B */  jal        free_widget
/* BA14C 800B954C 02202821 */   addu      $a1, $s1, $zero
/* BA150 800B9550 8FBF0018 */  lw         $ra, 0x18($sp)
/* BA154 800B9554 8FB10014 */  lw         $s1, 0x14($sp)
/* BA158 800B9558 8FB00010 */  lw         $s0, 0x10($sp)
/* BA15C 800B955C 03E00008 */  jr         $ra
/* BA160 800B9560 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B9564
/* BA164 800B9564 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* BA168 800B9568 AFB00038 */  sw         $s0, 0x38($sp)
/* BA16C 800B956C 00808021 */  addu       $s0, $a0, $zero
/* BA170 800B9570 00063400 */  sll        $a2, $a2, 0x10
/* BA174 800B9574 AFB1003C */  sw         $s1, 0x3c($sp)
/* BA178 800B9578 00068C03 */  sra        $s1, $a2, 0x10
/* BA17C 800B957C AFB30044 */  sw         $s3, 0x44($sp)
/* BA180 800B9580 87B30062 */  lh         $s3, 0x62($sp)
/* BA184 800B9584 00073C00 */  sll        $a3, $a3, 0x10
/* BA188 800B9588 AFB20040 */  sw         $s2, 0x40($sp)
/* BA18C 800B958C 00079403 */  sra        $s2, $a3, 0x10
/* BA190 800B9590 AFBF004C */  sw         $ra, 0x4c($sp)
/* BA194 800B9594 AFB40048 */  sw         $s4, 0x48($sp)
/* BA198 800B9598 8E02006C */  lw         $v0, 0x6c($s0)
/* BA19C 800B959C 104000DA */  beqz       $v0, .L800B9908
/* BA1A0 800B95A0 87B40066 */   lh        $s4, 0x66($sp)
/* BA1A4 800B95A4 00007021 */  addu       $t6, $zero, $zero
/* BA1A8 800B95A8 00007821 */  addu       $t7, $zero, $zero
/* BA1AC 800B95AC 86060060 */  lh         $a2, 0x60($s0)
/* BA1B0 800B95B0 86070062 */  lh         $a3, 0x62($s0)
/* BA1B4 800B95B4 844C000A */  lh         $t4, 0xa($v0)
/* BA1B8 800B95B8 844D000C */  lh         $t5, 0xc($v0)
/* BA1BC 800B95BC 86040064 */  lh         $a0, 0x64($s0)
/* BA1C0 800B95C0 86080066 */  lh         $t0, 0x66($s0)
/* BA1C4 800B95C4 86090068 */  lh         $t1, 0x68($s0)
/* BA1C8 800B95C8 96020074 */  lhu        $v0, 0x74($s0)
/* BA1CC 800B95CC 860B006A */  lh         $t3, 0x6a($s0)
/* BA1D0 800B95D0 96030072 */  lhu        $v1, 0x72($s0)
/* BA1D4 800B95D4 00461021 */  addu       $v0, $v0, $a2
/* BA1D8 800B95D8 00021400 */  sll        $v0, $v0, 0x10
/* BA1DC 800B95DC 00025403 */  sra        $t2, $v0, 0x10
/* BA1E0 800B95E0 00671821 */  addu       $v1, $v1, $a3
/* BA1E4 800B95E4 00031C00 */  sll        $v1, $v1, 0x10
/* BA1E8 800B95E8 00031C03 */  sra        $v1, $v1, 0x10
/* BA1EC 800B95EC 96020074 */  lhu        $v0, 0x74($s0)
/* BA1F0 800B95F0 448C0000 */  mtc1       $t4, $f0
/* BA1F4 800B95F4 46800020 */  cvt.s.w    $f0, $f0
/* BA1F8 800B95F8 44822000 */  mtc1       $v0, $f4
/* BA1FC 800B95FC 46802120 */  cvt.s.w    $f4, $f4
/* BA200 800B9600 46002103 */  div.s      $f4, $f4, $f0
/* BA204 800B9604 96020072 */  lhu        $v0, 0x72($s0)
/* BA208 800B9608 448D0000 */  mtc1       $t5, $f0
/* BA20C 800B960C 46800020 */  cvt.s.w    $f0, $f0
/* BA210 800B9610 44821000 */  mtc1       $v0, $f2
/* BA214 800B9614 468010A0 */  cvt.s.w    $f2, $f2
/* BA218 800B9618 0091102A */  slt        $v0, $a0, $s1
/* BA21C 800B961C 10400002 */  beqz       $v0, .L800B9628
/* BA220 800B9620 46001203 */   div.s     $f8, $f2, $f0
/* BA224 800B9624 02202021 */  addu       $a0, $s1, $zero
.L800B9628:
/* BA228 800B9628 0268102A */  slt        $v0, $s3, $t0
/* BA22C 800B962C 54400001 */  bnel       $v0, $zero, .L800B9634
/* BA230 800B9630 02604021 */   addu      $t0, $s3, $zero
.L800B9634:
/* BA234 800B9634 0132102A */  slt        $v0, $t1, $s2
/* BA238 800B9638 54400001 */  bnel       $v0, $zero, .L800B9640
/* BA23C 800B963C 02404821 */   addu      $t1, $s2, $zero
.L800B9640:
/* BA240 800B9640 028B102A */  slt        $v0, $s4, $t3
/* BA244 800B9644 54400001 */  bnel       $v0, $zero, .L800B964C
/* BA248 800B9648 02805821 */   addu      $t3, $s4, $zero
.L800B964C:
/* BA24C 800B964C 0144102A */  slt        $v0, $t2, $a0
/* BA250 800B9650 544000AD */  bnel       $v0, $zero, .L800B9908
/* BA254 800B9654 02002021 */   addu      $a0, $s0, $zero
/* BA258 800B9658 0069102A */  slt        $v0, $v1, $t1
/* BA25C 800B965C 544000AA */  bnel       $v0, $zero, .L800B9908
/* BA260 800B9660 02002021 */   addu      $a0, $s0, $zero
/* BA264 800B9664 0106102A */  slt        $v0, $t0, $a2
/* BA268 800B9668 544000A7 */  bnel       $v0, $zero, .L800B9908
/* BA26C 800B966C 02002021 */   addu      $a0, $s0, $zero
/* BA270 800B9670 0167102A */  slt        $v0, $t3, $a3
/* BA274 800B9674 544000A4 */  bnel       $v0, $zero, .L800B9908
/* BA278 800B9678 02002021 */   addu      $a0, $s0, $zero
/* BA27C 800B967C 00C4102A */  slt        $v0, $a2, $a0
/* BA280 800B9680 10400009 */  beqz       $v0, .L800B96A8
/* BA284 800B9684 00861023 */   subu      $v0, $a0, $a2
/* BA288 800B9688 44820000 */  mtc1       $v0, $f0
/* BA28C 800B968C 46800020 */  cvt.s.w    $f0, $f0
/* BA290 800B9690 46040003 */  div.s      $f0, $f0, $f4
/* BA294 800B9694 4600008D */  trunc.w.s  $f2, $f0
/* BA298 800B9698 44021000 */  mfc1       $v0, $f2
/* BA29C 800B969C 00021400 */  sll        $v0, $v0, 0x10
/* BA2A0 800B96A0 00027403 */  sra        $t6, $v0, 0x10
/* BA2A4 800B96A4 00803021 */  addu       $a2, $a0, $zero
.L800B96A8:
/* BA2A8 800B96A8 010A102A */  slt        $v0, $t0, $t2
/* BA2AC 800B96AC 10400009 */  beqz       $v0, .L800B96D4
/* BA2B0 800B96B0 01481023 */   subu      $v0, $t2, $t0
/* BA2B4 800B96B4 44820000 */  mtc1       $v0, $f0
/* BA2B8 800B96B8 46800020 */  cvt.s.w    $f0, $f0
/* BA2BC 800B96BC 46040003 */  div.s      $f0, $f0, $f4
/* BA2C0 800B96C0 4600008D */  trunc.w.s  $f2, $f0
/* BA2C4 800B96C4 44021000 */  mfc1       $v0, $f2
/* BA2C8 800B96C8 01821023 */  subu       $v0, $t4, $v0
/* BA2CC 800B96CC 00021400 */  sll        $v0, $v0, 0x10
/* BA2D0 800B96D0 00026403 */  sra        $t4, $v0, 0x10
.L800B96D4:
/* BA2D4 800B96D4 00E9102A */  slt        $v0, $a3, $t1
/* BA2D8 800B96D8 10400009 */  beqz       $v0, .L800B9700
/* BA2DC 800B96DC 01271023 */   subu      $v0, $t1, $a3
/* BA2E0 800B96E0 44820000 */  mtc1       $v0, $f0
/* BA2E4 800B96E4 46800020 */  cvt.s.w    $f0, $f0
/* BA2E8 800B96E8 46080003 */  div.s      $f0, $f0, $f8
/* BA2EC 800B96EC 4600008D */  trunc.w.s  $f2, $f0
/* BA2F0 800B96F0 44021000 */  mfc1       $v0, $f2
/* BA2F4 800B96F4 00021400 */  sll        $v0, $v0, 0x10
/* BA2F8 800B96F8 00027C03 */  sra        $t7, $v0, 0x10
/* BA2FC 800B96FC 01203821 */  addu       $a3, $t1, $zero
.L800B9700:
/* BA300 800B9700 0163102A */  slt        $v0, $t3, $v1
/* BA304 800B9704 10400009 */  beqz       $v0, .L800B972C
/* BA308 800B9708 006B1023 */   subu      $v0, $v1, $t3
/* BA30C 800B970C 44820000 */  mtc1       $v0, $f0
/* BA310 800B9710 46800020 */  cvt.s.w    $f0, $f0
/* BA314 800B9714 46080003 */  div.s      $f0, $f0, $f8
/* BA318 800B9718 4600008D */  trunc.w.s  $f2, $f0
/* BA31C 800B971C 44021000 */  mfc1       $v0, $f2
/* BA320 800B9720 01A21023 */  subu       $v0, $t5, $v0
/* BA324 800B9724 00021400 */  sll        $v0, $v0, 0x10
/* BA328 800B9728 00026C03 */  sra        $t5, $v0, 0x10
.L800B972C:
/* BA32C 800B972C 01CC102A */  slt        $v0, $t6, $t4
/* BA330 800B9730 10400074 */  beqz       $v0, .L800B9904
/* BA334 800B9734 01ED102A */   slt       $v0, $t7, $t5
/* BA338 800B9738 10400072 */  beqz       $v0, .L800B9904
/* BA33C 800B973C 3C03800F */   lui       $v1, %hi(D_800F36F8)
/* BA340 800B9740 9202005B */  lbu        $v0, 0x5b($s0)
/* BA344 800B9744 C46636F8 */  lwc1       $f6, %lo(D_800F36F8)($v1)
/* BA348 800B9748 44820000 */  mtc1       $v0, $f0
/* BA34C 800B974C 46800020 */  cvt.s.w    $f0, $f0
/* BA350 800B9750 46060002 */  mul.s      $f0, $f0, $f6
/* BA354 800B9754 44801000 */  mtc1       $zero, $f2
/* BA358 800B9758 4600103C */  c.lt.s     $f2, $f0
/* BA35C 800B975C 00000000 */  nop
/* BA360 800B9760 45000068 */  bc1f       .L800B9904
/* BA364 800B9764 00604021 */   addu      $t0, $v1, $zero
/* BA368 800B9768 31C2FFFF */  andi       $v0, $t6, 0xffff
/* BA36C 800B976C 31E3FFFF */  andi       $v1, $t7, 0xffff
/* BA370 800B9770 AFA20010 */  sw         $v0, 0x10($sp)
/* BA374 800B9774 AFA30014 */  sw         $v1, 0x14($sp)
/* BA378 800B9778 92040058 */  lbu        $a0, 0x58($s0)
/* BA37C 800B977C 3C01800E */  lui        $at, %hi(D_800E4410)
/* BA380 800B9780 C4224410 */  lwc1       $f2, %lo(D_800E4410)($at)
/* BA384 800B9784 3182FFFF */  andi       $v0, $t4, 0xffff
/* BA388 800B9788 AFA20018 */  sw         $v0, 0x18($sp)
/* BA38C 800B978C 31A2FFFF */  andi       $v0, $t5, 0xffff
/* BA390 800B9790 E7A40020 */  swc1       $f4, 0x20($sp)
/* BA394 800B9794 44840000 */  mtc1       $a0, $f0
/* BA398 800B9798 46800020 */  cvt.s.w    $f0, $f0
/* BA39C 800B979C 46060002 */  mul.s      $f0, $f0, $f6
/* BA3A0 800B97A0 44862000 */  mtc1       $a2, $f4
/* BA3A4 800B97A4 46802120 */  cvt.s.w    $f4, $f4
/* BA3A8 800B97A8 AFA2001C */  sw         $v0, 0x1c($sp)
/* BA3AC 800B97AC 44873000 */  mtc1       $a3, $f6
/* BA3B0 800B97B0 468031A0 */  cvt.s.w    $f6, $f6
/* BA3B4 800B97B4 4600103E */  c.le.s     $f2, $f0
/* BA3B8 800B97B8 00000000 */  nop
/* BA3BC 800B97BC 45010005 */  bc1t       .L800B97D4
/* BA3C0 800B97C0 E7A80024 */   swc1      $f8, 0x24($sp)
/* BA3C4 800B97C4 4600008D */  trunc.w.s  $f2, $f0
/* BA3C8 800B97C8 44031000 */  mfc1       $v1, $f2
/* BA3CC 800B97CC 0802E5FB */  j          .L800B97EC
/* BA3D0 800B97D0 92020059 */   lbu       $v0, 0x59($s0)
.L800B97D4:
/* BA3D4 800B97D4 46020001 */  sub.s      $f0, $f0, $f2
/* BA3D8 800B97D8 4600008D */  trunc.w.s  $f2, $f0
/* BA3DC 800B97DC 44031000 */  mfc1       $v1, $f2
/* BA3E0 800B97E0 3C028000 */  lui        $v0, 0x8000
/* BA3E4 800B97E4 00621825 */  or         $v1, $v1, $v0
/* BA3E8 800B97E8 92020059 */  lbu        $v0, 0x59($s0)
.L800B97EC:
/* BA3EC 800B97EC C50236F8 */  lwc1       $f2, 0x36f8($t0)
/* BA3F0 800B97F0 44820000 */  mtc1       $v0, $f0
/* BA3F4 800B97F4 46800020 */  cvt.s.w    $f0, $f0
/* BA3F8 800B97F8 46020002 */  mul.s      $f0, $f0, $f2
/* BA3FC 800B97FC 3C01800E */  lui        $at, %hi(D_800E4414)
/* BA400 800B9800 C4224414 */  lwc1       $f2, %lo(D_800E4414)($at)
/* BA404 800B9804 306200FF */  andi       $v0, $v1, 0xff
/* BA408 800B9808 4600103E */  c.le.s     $f2, $f0
/* BA40C 800B980C 00000000 */  nop
/* BA410 800B9810 45010005 */  bc1t       .L800B9828
/* BA414 800B9814 AFA20028 */   sw        $v0, 0x28($sp)
/* BA418 800B9818 4600008D */  trunc.w.s  $f2, $f0
/* BA41C 800B981C 44031000 */  mfc1       $v1, $f2
/* BA420 800B9820 0802E610 */  j          .L800B9840
/* BA424 800B9824 9202005A */   lbu       $v0, 0x5a($s0)
.L800B9828:
/* BA428 800B9828 46020001 */  sub.s      $f0, $f0, $f2
/* BA42C 800B982C 4600008D */  trunc.w.s  $f2, $f0
/* BA430 800B9830 44031000 */  mfc1       $v1, $f2
/* BA434 800B9834 3C028000 */  lui        $v0, 0x8000
/* BA438 800B9838 00621825 */  or         $v1, $v1, $v0
/* BA43C 800B983C 9202005A */  lbu        $v0, 0x5a($s0)
.L800B9840:
/* BA440 800B9840 C50236F8 */  lwc1       $f2, 0x36f8($t0)
/* BA444 800B9844 44820000 */  mtc1       $v0, $f0
/* BA448 800B9848 46800020 */  cvt.s.w    $f0, $f0
/* BA44C 800B984C 46020002 */  mul.s      $f0, $f0, $f2
/* BA450 800B9850 3C01800E */  lui        $at, %hi(D_800E4418)
/* BA454 800B9854 C4224418 */  lwc1       $f2, %lo(D_800E4418)($at)
/* BA458 800B9858 306200FF */  andi       $v0, $v1, 0xff
/* BA45C 800B985C 4600103E */  c.le.s     $f2, $f0
/* BA460 800B9860 00000000 */  nop
/* BA464 800B9864 45010005 */  bc1t       .L800B987C
/* BA468 800B9868 AFA2002C */   sw        $v0, 0x2c($sp)
/* BA46C 800B986C 4600008D */  trunc.w.s  $f2, $f0
/* BA470 800B9870 44031000 */  mfc1       $v1, $f2
/* BA474 800B9874 0802E625 */  j          .L800B9894
/* BA478 800B9878 9202005B */   lbu       $v0, 0x5b($s0)
.L800B987C:
/* BA47C 800B987C 46020001 */  sub.s      $f0, $f0, $f2
/* BA480 800B9880 4600008D */  trunc.w.s  $f2, $f0
/* BA484 800B9884 44031000 */  mfc1       $v1, $f2
/* BA488 800B9888 3C028000 */  lui        $v0, 0x8000
/* BA48C 800B988C 00621825 */  or         $v1, $v1, $v0
/* BA490 800B9890 9202005B */  lbu        $v0, 0x5b($s0)
.L800B9894:
/* BA494 800B9894 C50236F8 */  lwc1       $f2, 0x36f8($t0)
/* BA498 800B9898 44820000 */  mtc1       $v0, $f0
/* BA49C 800B989C 46800020 */  cvt.s.w    $f0, $f0
/* BA4A0 800B98A0 46020002 */  mul.s      $f0, $f0, $f2
/* BA4A4 800B98A4 3C01800E */  lui        $at, %hi(D_800E441C)
/* BA4A8 800B98A8 C422441C */  lwc1       $f2, %lo(D_800E441C)($at)
/* BA4AC 800B98AC 306200FF */  andi       $v0, $v1, 0xff
/* BA4B0 800B98B0 4600103E */  c.le.s     $f2, $f0
/* BA4B4 800B98B4 00000000 */  nop
/* BA4B8 800B98B8 45010005 */  bc1t       .L800B98D0
/* BA4BC 800B98BC AFA20030 */   sw        $v0, 0x30($sp)
/* BA4C0 800B98C0 4600008D */  trunc.w.s  $f2, $f0
/* BA4C4 800B98C4 44031000 */  mfc1       $v1, $f2
/* BA4C8 800B98C8 0802E63A */  j          .L800B98E8
/* BA4CC 800B98CC 00A02021 */   addu      $a0, $a1, $zero
.L800B98D0:
/* BA4D0 800B98D0 46020001 */  sub.s      $f0, $f0, $f2
/* BA4D4 800B98D4 4600008D */  trunc.w.s  $f2, $f0
/* BA4D8 800B98D8 44031000 */  mfc1       $v1, $f2
/* BA4DC 800B98DC 3C028000 */  lui        $v0, 0x8000
/* BA4E0 800B98E0 00621825 */  or         $v1, $v1, $v0
/* BA4E4 800B98E4 00A02021 */  addu       $a0, $a1, $zero
.L800B98E8:
/* BA4E8 800B98E8 8E05006C */  lw         $a1, 0x6c($s0)
/* BA4EC 800B98EC 44062000 */  mfc1       $a2, $f4
/* BA4F0 800B98F0 44073000 */  mfc1       $a3, $f6
/* BA4F4 800B98F4 306200FF */  andi       $v0, $v1, 0xff
/* BA4F8 800B98F8 0C029188 */  jal        N64BorgImageDraw
/* BA4FC 800B98FC AFA20034 */   sw        $v0, 0x34($sp)
/* BA500 800B9900 00402821 */  addu       $a1, $v0, $zero
.L800B9904:
/* BA504 800B9904 02002021 */  addu       $a0, $s0, $zero
.L800B9908:
/* BA508 800B9908 02203021 */  addu       $a2, $s1, $zero
/* BA50C 800B990C 02403821 */  addu       $a3, $s2, $zero
/* BA510 800B9910 AFB30010 */  sw         $s3, 0x10($sp)
/* BA514 800B9914 0C02DE14 */  jal        widget_func_8
/* BA518 800B9918 AFB40014 */   sw        $s4, 0x14($sp)
/* BA51C 800B991C 8FBF004C */  lw         $ra, 0x4c($sp)
/* BA520 800B9920 8FB40048 */  lw         $s4, 0x48($sp)
/* BA524 800B9924 8FB30044 */  lw         $s3, 0x44($sp)
/* BA528 800B9928 8FB20040 */  lw         $s2, 0x40($sp)
/* BA52C 800B992C 8FB1003C */  lw         $s1, 0x3c($sp)
/* BA530 800B9930 8FB00038 */  lw         $s0, 0x38($sp)
/* BA534 800B9934 03E00008 */  jr         $ra
/* BA538 800B9938 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_800B993C
/* BA53C 800B993C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BA540 800B9940 AFBF0010 */  sw         $ra, 0x10($sp)
/* BA544 800B9944 0C02DE51 */  jal        func_800B7944
/* BA548 800B9948 00000000 */   nop
/* BA54C 800B994C 8FBF0010 */  lw         $ra, 0x10($sp)
/* BA550 800B9950 03E00008 */  jr         $ra
/* BA554 800B9954 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret4_800b9958
/* BA558 800B9958 03E00008 */  jr         $ra
/* BA55C 800B995C 24020004 */   addiu     $v0, $zero, 4

glabel widget_menu_build
/* BA560 800B9960 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BA564 800B9964 AFB00010 */  sw         $s0, 0x10($sp)
/* BA568 800B9968 AFBF0014 */  sw         $ra, 0x14($sp)
/* BA56C 800B996C 0C02DCFC */  jal        widget_init
/* BA570 800B9970 00808021 */   addu      $s0, $a0, $zero
/* BA574 800B9974 02001021 */  addu       $v0, $s0, $zero
/* BA578 800B9978 3C03800E */  lui        $v1, %hi(widget_methods_menu)
/* BA57C 800B997C 8FBF0014 */  lw         $ra, 0x14($sp)
/* BA580 800B9980 246344F0 */  addiu      $v1, $v1, %lo(widget_methods_menu)
/* BA584 800B9984 AE030078 */  sw         $v1, 0x78($s0)
/* BA588 800B9988 24030001 */  addiu      $v1, $zero, 1
/* BA58C 800B998C A6000060 */  sh         $zero, 0x60($s0)
/* BA590 800B9990 A6000062 */  sh         $zero, 0x62($s0)
/* BA594 800B9994 A6000074 */  sh         $zero, 0x74($s0)
/* BA598 800B9998 A6000072 */  sh         $zero, 0x72($s0)
/* BA59C 800B999C AE000040 */  sw         $zero, 0x40($s0)
/* BA5A0 800B99A0 A2030070 */  sb         $v1, 0x70($s0)
/* BA5A4 800B99A4 8FB00010 */  lw         $s0, 0x10($sp)
/* BA5A8 800B99A8 03E00008 */  jr         $ra
/* BA5AC 800B99AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_menu_free
/* BA5B0 800B99B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BA5B4 800B99B4 3C02800E */  lui        $v0, %hi(widget_methods_menu)
/* BA5B8 800B99B8 244244F0 */  addiu      $v0, $v0, %lo(widget_methods_menu)
/* BA5BC 800B99BC AFBF0010 */  sw         $ra, 0x10($sp)
/* BA5C0 800B99C0 0C02DD2B */  jal        free_widget
/* BA5C4 800B99C4 AC820078 */   sw        $v0, 0x78($a0)
/* BA5C8 800B99C8 8FBF0010 */  lw         $ra, 0x10($sp)
/* BA5CC 800B99CC 03E00008 */  jr         $ra
/* BA5D0 800B99D0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B99D4
/* BA5D4 800B99D4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BA5D8 800B99D8 00063400 */  sll        $a2, $a2, 0x10
/* BA5DC 800B99DC 00073C00 */  sll        $a3, $a3, 0x10
/* BA5E0 800B99E0 00063403 */  sra        $a2, $a2, 0x10
/* BA5E4 800B99E4 87A20032 */  lh         $v0, 0x32($sp)
/* BA5E8 800B99E8 87A30036 */  lh         $v1, 0x36($sp)
/* BA5EC 800B99EC 00073C03 */  sra        $a3, $a3, 0x10
/* BA5F0 800B99F0 AFBF0018 */  sw         $ra, 0x18($sp)
/* BA5F4 800B99F4 AFA20010 */  sw         $v0, 0x10($sp)
/* BA5F8 800B99F8 0C02DE14 */  jal        widget_func_8
/* BA5FC 800B99FC AFA30014 */   sw        $v1, 0x14($sp)
/* BA600 800B9A00 8FBF0018 */  lw         $ra, 0x18($sp)
/* BA604 800B9A04 03E00008 */  jr         $ra
/* BA608 800B9A08 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B9A0C
/* BA60C 800B9A0C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BA610 800B9A10 AFBF0010 */  sw         $ra, 0x10($sp)
/* BA614 800B9A14 0C02DE51 */  jal        func_800B7944
/* BA618 800B9A18 00000000 */   nop
/* BA61C 800B9A1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* BA620 800B9A20 03E00008 */  jr         $ra
/* BA624 800B9A24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret3
/* BA628 800B9A28 03E00008 */  jr         $ra
/* BA62C 800B9A2C 24020003 */   addiu     $v0, $zero, 3

glabel widgetscrollmenu_init
/* BA630 800B9A30 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BA634 800B9A34 AFB10014 */  sw         $s1, 0x14($sp)
/* BA638 800B9A38 00808821 */  addu       $s1, $a0, $zero
/* BA63C 800B9A3C AFB20018 */  sw         $s2, 0x18($sp)
/* BA640 800B9A40 30B2FFFF */  andi       $s2, $a1, 0xffff
/* BA644 800B9A44 AFBF001C */  sw         $ra, 0x1c($sp)
/* BA648 800B9A48 0C02DCFC */  jal        widget_init
/* BA64C 800B9A4C AFB00010 */   sw        $s0, 0x10($sp)
/* BA650 800B9A50 24040024 */  addiu      $a0, $zero, 0x24
/* BA654 800B9A54 3C02800E */  lui        $v0, %hi(widget_methods_scrollmenu)
/* BA658 800B9A58 244245E8 */  addiu      $v0, $v0, %lo(widget_methods_scrollmenu)
/* BA65C 800B9A5C 0C026259 */  jal        passToMalloc
/* BA660 800B9A60 AE220078 */   sw        $v0, 0x78($s1)
/* BA664 800B9A64 00408021 */  addu       $s0, $v0, $zero
/* BA668 800B9A68 24030001 */  addiu      $v1, $zero, 1
/* BA66C 800B9A6C 2402000A */  addiu      $v0, $zero, 0xa
/* BA670 800B9A70 A6200060 */  sh         $zero, 0x60($s1)
/* BA674 800B9A74 A6200062 */  sh         $zero, 0x62($s1)
/* BA678 800B9A78 A6200074 */  sh         $zero, 0x74($s1)
/* BA67C 800B9A7C A6200072 */  sh         $zero, 0x72($s1)
/* BA680 800B9A80 A2020000 */  sb         $v0, ($s0)
/* BA684 800B9A84 24020064 */  addiu      $v0, $zero, 0x64
/* BA688 800B9A88 A2030023 */  sb         $v1, 0x23($s0)
/* BA68C 800B9A8C A2030001 */  sb         $v1, 1($s0)
/* BA690 800B9A90 240300FF */  addiu      $v1, $zero, 0xff
/* BA694 800B9A94 A2020002 */  sb         $v0, 2($s0)
/* BA698 800B9A98 A2020004 */  sb         $v0, 4($s0)
/* BA69C 800B9A9C A2020006 */  sb         $v0, 6($s0)
/* BA6A0 800B9AA0 A2020008 */  sb         $v0, 8($s0)
/* BA6A4 800B9AA4 24020014 */  addiu      $v0, $zero, 0x14
/* BA6A8 800B9AA8 A202000A */  sb         $v0, 0xa($s0)
/* BA6AC 800B9AAC 240200E1 */  addiu      $v0, $zero, 0xe1
/* BA6B0 800B9AB0 A202000C */  sb         $v0, 0xc($s0)
/* BA6B4 800B9AB4 A202000D */  sb         $v0, 0xd($s0)
/* BA6B8 800B9AB8 A202000E */  sb         $v0, 0xe($s0)
/* BA6BC 800B9ABC A202000F */  sb         $v0, 0xf($s0)
/* BA6C0 800B9AC0 240200F0 */  addiu      $v0, $zero, 0xf0
/* BA6C4 800B9AC4 A2030003 */  sb         $v1, 3($s0)
/* BA6C8 800B9AC8 A2030005 */  sb         $v1, 5($s0)
/* BA6CC 800B9ACC A2030007 */  sb         $v1, 7($s0)
/* BA6D0 800B9AD0 A2030009 */  sb         $v1, 9($s0)
/* BA6D4 800B9AD4 24030140 */  addiu      $v1, $zero, 0x140
/* BA6D8 800B9AD8 A6000012 */  sh         $zero, 0x12($s0)
/* BA6DC 800B9ADC A6000016 */  sh         $zero, 0x16($s0)
/* BA6E0 800B9AE0 A200000B */  sb         $zero, 0xb($s0)
/* BA6E4 800B9AE4 A622006A */  sh         $v0, 0x6a($s1)
/* BA6E8 800B9AE8 3C02800C */  lui        $v0, %hi(widgetscrollmenu_upfunc)
/* BA6EC 800B9AEC 2442A370 */  addiu      $v0, $v0, %lo(widgetscrollmenu_upfunc)
/* BA6F0 800B9AF0 A6230066 */  sh         $v1, 0x66($s1)
/* BA6F4 800B9AF4 3C03800C */  lui        $v1, %hi(widgetscrollmenu_DownFunc)
/* BA6F8 800B9AF8 2463A438 */  addiu      $v1, $v1, %lo(widgetscrollmenu_DownFunc)
/* BA6FC 800B9AFC AE220008 */  sw         $v0, 8($s1)
/* BA700 800B9B00 3C02800C */  lui        $v0, %hi(widgetScrollMenu_Afunc)
/* BA704 800B9B04 2442A51C */  addiu      $v0, $v0, %lo(widgetScrollMenu_Afunc)
/* BA708 800B9B08 AE23000C */  sw         $v1, 0xc($s1)
/* BA70C 800B9B0C 3C03800C */  lui        $v1, %hi(ret0_800ba50c)
/* BA710 800B9B10 2463A50C */  addiu      $v1, $v1, %lo(ret0_800ba50c)
/* BA714 800B9B14 AE220018 */  sw         $v0, 0x18($s1)
/* BA718 800B9B18 3C02800C */  lui        $v0, %hi(ret0_800BA514)
/* BA71C 800B9B1C 2442A514 */  addiu      $v0, $v0, %lo(ret0_800BA514)
/* BA720 800B9B20 A6200068 */  sh         $zero, 0x68($s1)
/* BA724 800B9B24 A6200064 */  sh         $zero, 0x64($s1)
/* BA728 800B9B28 AE230010 */  sw         $v1, 0x10($s1)
/* BA72C 800B9B2C AE220014 */  sw         $v0, 0x14($s1)
/* BA730 800B9B30 AE200000 */  sw         $zero, ($s1)
/* BA734 800B9B34 AE200004 */  sw         $zero, 4($s1)
/* BA738 800B9B38 A600001E */  sh         $zero, 0x1e($s0)
/* BA73C 800B9B3C A612001C */  sh         $s2, 0x1c($s0)
/* BA740 800B9B40 A6000020 */  sh         $zero, 0x20($s0)
/* BA744 800B9B44 1240000F */  beqz       $s2, .L800B9B84
/* BA748 800B9B48 A2000022 */   sb        $zero, 0x22($s0)
/* BA74C 800B9B4C 00122080 */  sll        $a0, $s2, 2
/* BA750 800B9B50 3C05800E */  lui        $a1, %hi(D_800E45C0)
/* BA754 800B9B54 24A545C0 */  addiu      $a1, $a1, %lo(D_800E45C0)
/* BA758 800B9B58 0C025F9C */  jal        Malloc
/* BA75C 800B9B5C 24060059 */   addiu     $a2, $zero, 0x59
/* BA760 800B9B60 12400009 */  beqz       $s2, .L800B9B88
/* BA764 800B9B64 AE020018 */   sw        $v0, 0x18($s0)
/* BA768 800B9B68 02402021 */  addu       $a0, $s2, $zero
.L800B9B6C:
/* BA76C 800B9B6C AC400000 */  sw         $zero, ($v0)
/* BA770 800B9B70 2484FFFF */  addiu      $a0, $a0, -1
/* BA774 800B9B74 1480FFFD */  bnez       $a0, .L800B9B6C
/* BA778 800B9B78 24420004 */   addiu     $v0, $v0, 4
/* BA77C 800B9B7C 0802E6E3 */  j          .L800B9B8C
/* BA780 800B9B80 02202021 */   addu      $a0, $s1, $zero
.L800B9B84:
/* BA784 800B9B84 AE000018 */  sw         $zero, 0x18($s0)
.L800B9B88:
/* BA788 800B9B88 02202021 */  addu       $a0, $s1, $zero
.L800B9B8C:
/* BA78C 800B9B8C 24050001 */  addiu      $a1, $zero, 1
/* BA790 800B9B90 0C02DEC8 */  jal        set_widgets_byte0x70
/* BA794 800B9B94 AE300040 */   sw        $s0, 0x40($s1)
/* BA798 800B9B98 02201021 */  addu       $v0, $s1, $zero
/* BA79C 800B9B9C 8FBF001C */  lw         $ra, 0x1c($sp)
/* BA7A0 800B9BA0 8FB20018 */  lw         $s2, 0x18($sp)
/* BA7A4 800B9BA4 8FB10014 */  lw         $s1, 0x14($sp)
/* BA7A8 800B9BA8 8FB00010 */  lw         $s0, 0x10($sp)
/* BA7AC 800B9BAC 03E00008 */  jr         $ra
/* BA7B0 800B9BB0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widgetscrollmenu_free
/* BA7B4 800B9BB4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BA7B8 800B9BB8 AFB3001C */  sw         $s3, 0x1c($sp)
/* BA7BC 800B9BBC 00809821 */  addu       $s3, $a0, $zero
/* BA7C0 800B9BC0 3C02800E */  lui        $v0, %hi(widget_methods_scrollmenu)
/* BA7C4 800B9BC4 244245E8 */  addiu      $v0, $v0, %lo(widget_methods_scrollmenu)
/* BA7C8 800B9BC8 AFBF0024 */  sw         $ra, 0x24($sp)
/* BA7CC 800B9BCC AFB40020 */  sw         $s4, 0x20($sp)
/* BA7D0 800B9BD0 AFB20018 */  sw         $s2, 0x18($sp)
/* BA7D4 800B9BD4 AFB10014 */  sw         $s1, 0x14($sp)
/* BA7D8 800B9BD8 AFB00010 */  sw         $s0, 0x10($sp)
/* BA7DC 800B9BDC 8E710040 */  lw         $s1, 0x40($s3)
/* BA7E0 800B9BE0 00A0A021 */  addu       $s4, $a1, $zero
/* BA7E4 800B9BE4 12200021 */  beqz       $s1, .L800B9C6C
/* BA7E8 800B9BE8 AE620078 */   sw        $v0, 0x78($s3)
/* BA7EC 800B9BEC 96220020 */  lhu        $v0, 0x20($s1)
/* BA7F0 800B9BF0 10400014 */  beqz       $v0, .L800B9C44
/* BA7F4 800B9BF4 00008021 */   addu      $s0, $zero, $zero
/* BA7F8 800B9BF8 8E220018 */  lw         $v0, 0x18($s1)
.L800B9BFC:
/* BA7FC 800B9BFC 00109080 */  sll        $s2, $s0, 2
/* BA800 800B9C00 02421021 */  addu       $v0, $s2, $v0
/* BA804 800B9C04 8C460000 */  lw         $a2, ($v0)
/* BA808 800B9C08 10C00009 */  beqz       $a2, .L800B9C30
/* BA80C 800B9C0C 24050003 */   addiu     $a1, $zero, 3
/* BA810 800B9C10 8CC20078 */  lw         $v0, 0x78($a2)
/* BA814 800B9C14 84440008 */  lh         $a0, 8($v0)
/* BA818 800B9C18 8C43000C */  lw         $v1, 0xc($v0)
/* BA81C 800B9C1C 0060F809 */  jalr       $v1
/* BA820 800B9C20 00C42021 */   addu      $a0, $a2, $a0
/* BA824 800B9C24 8E220018 */  lw         $v0, 0x18($s1)
/* BA828 800B9C28 02421021 */  addu       $v0, $s2, $v0
/* BA82C 800B9C2C AC400000 */  sw         $zero, ($v0)
.L800B9C30:
/* BA830 800B9C30 96220020 */  lhu        $v0, 0x20($s1)
/* BA834 800B9C34 26100001 */  addiu      $s0, $s0, 1
/* BA838 800B9C38 0202102A */  slt        $v0, $s0, $v0
/* BA83C 800B9C3C 5440FFEF */  bnel       $v0, $zero, .L800B9BFC
/* BA840 800B9C40 8E220018 */   lw        $v0, 0x18($s1)
.L800B9C44:
/* BA844 800B9C44 8E240018 */  lw         $a0, 0x18($s1)
/* BA848 800B9C48 10800005 */  beqz       $a0, .L800B9C60
/* BA84C 800B9C4C 3C05800E */   lui       $a1, %hi(D_800E45C0)
/* BA850 800B9C50 24A545C0 */  addiu      $a1, $a1, %lo(D_800E45C0)
/* BA854 800B9C54 0C02600C */  jal        Free
/* BA858 800B9C58 2406007C */   addiu     $a2, $zero, 0x7c
/* BA85C 800B9C5C AE200018 */  sw         $zero, 0x18($s1)
.L800B9C60:
/* BA860 800B9C60 0C026262 */  jal        passToFree
/* BA864 800B9C64 02202021 */   addu      $a0, $s1, $zero
/* BA868 800B9C68 AE600040 */  sw         $zero, 0x40($s3)
.L800B9C6C:
/* BA86C 800B9C6C 02602021 */  addu       $a0, $s3, $zero
/* BA870 800B9C70 0C02DD2B */  jal        free_widget
/* BA874 800B9C74 02802821 */   addu      $a1, $s4, $zero
/* BA878 800B9C78 8FBF0024 */  lw         $ra, 0x24($sp)
/* BA87C 800B9C7C 8FB40020 */  lw         $s4, 0x20($sp)
/* BA880 800B9C80 8FB3001C */  lw         $s3, 0x1c($sp)
/* BA884 800B9C84 8FB20018 */  lw         $s2, 0x18($sp)
/* BA888 800B9C88 8FB10014 */  lw         $s1, 0x14($sp)
/* BA88C 800B9C8C 8FB00010 */  lw         $s0, 0x10($sp)
/* BA890 800B9C90 03E00008 */  jr         $ra
/* BA894 800B9C94 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B9C98
/* BA898 800B9C98 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BA89C 800B9C9C AFB00018 */  sw         $s0, 0x18($sp)
/* BA8A0 800B9CA0 00008021 */  addu       $s0, $zero, $zero
/* BA8A4 800B9CA4 AFB60030 */  sw         $s6, 0x30($sp)
/* BA8A8 800B9CA8 0080B021 */  addu       $s6, $a0, $zero
/* BA8AC 800B9CAC 00063400 */  sll        $a2, $a2, 0x10
/* BA8B0 800B9CB0 AFB5002C */  sw         $s5, 0x2c($sp)
/* BA8B4 800B9CB4 0006AC03 */  sra        $s5, $a2, 0x10
/* BA8B8 800B9CB8 00073C00 */  sll        $a3, $a3, 0x10
/* BA8BC 800B9CBC AFB40028 */  sw         $s4, 0x28($sp)
/* BA8C0 800B9CC0 0007A403 */  sra        $s4, $a3, 0x10
/* BA8C4 800B9CC4 AFBF0034 */  sw         $ra, 0x34($sp)
/* BA8C8 800B9CC8 AFB30024 */  sw         $s3, 0x24($sp)
/* BA8CC 800B9CCC AFB20020 */  sw         $s2, 0x20($sp)
/* BA8D0 800B9CD0 AFB1001C */  sw         $s1, 0x1c($sp)
/* BA8D4 800B9CD4 8ED10040 */  lw         $s1, 0x40($s6)
/* BA8D8 800B9CD8 87B3004A */  lh         $s3, 0x4a($sp)
/* BA8DC 800B9CDC 96220020 */  lhu        $v0, 0x20($s1)
/* BA8E0 800B9CE0 10400015 */  beqz       $v0, .L800B9D38
/* BA8E4 800B9CE4 87B2004E */   lh        $s2, 0x4e($sp)
/* BA8E8 800B9CE8 8E230018 */  lw         $v1, 0x18($s1)
.L800B9CEC:
/* BA8EC 800B9CEC 00101080 */  sll        $v0, $s0, 2
/* BA8F0 800B9CF0 00431021 */  addu       $v0, $v0, $v1
/* BA8F4 800B9CF4 8C480000 */  lw         $t0, ($v0)
/* BA8F8 800B9CF8 1100000A */  beqz       $t0, .L800B9D24
/* BA8FC 800B9CFC 02A03021 */   addu      $a2, $s5, $zero
/* BA900 800B9D00 8D030078 */  lw         $v1, 0x78($t0)
/* BA904 800B9D04 84640040 */  lh         $a0, 0x40($v1)
/* BA908 800B9D08 02803821 */  addu       $a3, $s4, $zero
/* BA90C 800B9D0C AFB30010 */  sw         $s3, 0x10($sp)
/* BA910 800B9D10 AFB20014 */  sw         $s2, 0x14($sp)
/* BA914 800B9D14 8C620044 */  lw         $v0, 0x44($v1)
/* BA918 800B9D18 0040F809 */  jalr       $v0
/* BA91C 800B9D1C 01042021 */   addu      $a0, $t0, $a0
/* BA920 800B9D20 00402821 */  addu       $a1, $v0, $zero
.L800B9D24:
/* BA924 800B9D24 96220020 */  lhu        $v0, 0x20($s1)
/* BA928 800B9D28 26100001 */  addiu      $s0, $s0, 1
/* BA92C 800B9D2C 0202102A */  slt        $v0, $s0, $v0
/* BA930 800B9D30 5440FFEE */  bnel       $v0, $zero, .L800B9CEC
/* BA934 800B9D34 8E230018 */   lw        $v1, 0x18($s1)
.L800B9D38:
/* BA938 800B9D38 02C02021 */  addu       $a0, $s6, $zero
/* BA93C 800B9D3C 02A03021 */  addu       $a2, $s5, $zero
/* BA940 800B9D40 02803821 */  addu       $a3, $s4, $zero
/* BA944 800B9D44 AFB30010 */  sw         $s3, 0x10($sp)
/* BA948 800B9D48 0C02DE14 */  jal        widget_func_8
/* BA94C 800B9D4C AFB20014 */   sw        $s2, 0x14($sp)
/* BA950 800B9D50 8FBF0034 */  lw         $ra, 0x34($sp)
/* BA954 800B9D54 8FB60030 */  lw         $s6, 0x30($sp)
/* BA958 800B9D58 8FB5002C */  lw         $s5, 0x2c($sp)
/* BA95C 800B9D5C 8FB40028 */  lw         $s4, 0x28($sp)
/* BA960 800B9D60 8FB30024 */  lw         $s3, 0x24($sp)
/* BA964 800B9D64 8FB20020 */  lw         $s2, 0x20($sp)
/* BA968 800B9D68 8FB1001C */  lw         $s1, 0x1c($sp)
/* BA96C 800B9D6C 8FB00018 */  lw         $s0, 0x18($sp)
/* BA970 800B9D70 03E00008 */  jr         $ra
/* BA974 800B9D74 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800B9D78
/* BA978 800B9D78 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BA97C 800B9D7C AFB20020 */  sw         $s2, 0x20($sp)
/* BA980 800B9D80 00809021 */  addu       $s2, $a0, $zero
/* BA984 800B9D84 AFBF0030 */  sw         $ra, 0x30($sp)
/* BA988 800B9D88 AFB5002C */  sw         $s5, 0x2c($sp)
/* BA98C 800B9D8C AFB40028 */  sw         $s4, 0x28($sp)
/* BA990 800B9D90 AFB30024 */  sw         $s3, 0x24($sp)
/* BA994 800B9D94 AFB1001C */  sw         $s1, 0x1c($sp)
/* BA998 800B9D98 AFB00018 */  sw         $s0, 0x18($sp)
/* BA99C 800B9D9C 8E510040 */  lw         $s1, 0x40($s2)
/* BA9A0 800B9DA0 8E220018 */  lw         $v0, 0x18($s1)
/* BA9A4 800B9DA4 1040010B */  beqz       $v0, .L800BA1D4
/* BA9A8 800B9DA8 0000A021 */   addu      $s4, $zero, $zero
/* BA9AC 800B9DAC 9222000B */  lbu        $v0, 0xb($s1)
/* BA9B0 800B9DB0 92240001 */  lbu        $a0, 1($s1)
/* BA9B4 800B9DB4 00441021 */  addu       $v0, $v0, $a0
/* BA9B8 800B9DB8 A222000B */  sb         $v0, 0xb($s1)
/* BA9BC 800B9DBC 304200FF */  andi       $v0, $v0, 0xff
/* BA9C0 800B9DC0 10400008 */  beqz       $v0, .L800B9DE4
/* BA9C4 800B9DC4 00041023 */   negu      $v0, $a0
/* BA9C8 800B9DC8 9222000A */  lbu        $v0, 0xa($s1)
/* BA9CC 800B9DCC 9223000B */  lbu        $v1, 0xb($s1)
/* BA9D0 800B9DD0 2442FFFF */  addiu      $v0, $v0, -1
/* BA9D4 800B9DD4 0062182A */  slt        $v1, $v1, $v0
/* BA9D8 800B9DD8 54600004 */  bnel       $v1, $zero, .L800B9DEC
/* BA9DC 800B9DDC 92230003 */   lbu       $v1, 3($s1)
/* BA9E0 800B9DE0 00041023 */  negu       $v0, $a0
.L800B9DE4:
/* BA9E4 800B9DE4 A2220001 */  sb         $v0, 1($s1)
/* BA9E8 800B9DE8 92230003 */  lbu        $v1, 3($s1)
.L800B9DEC:
/* BA9EC 800B9DEC 92220002 */  lbu        $v0, 2($s1)
/* BA9F0 800B9DF0 9226000A */  lbu        $a2, 0xa($s1)
/* BA9F4 800B9DF4 00621823 */  subu       $v1, $v1, $v0
/* BA9F8 800B9DF8 0066001A */  div        $zero, $v1, $a2
/* BA9FC 800B9DFC 922A0002 */  lbu        $t2, 2($s1)
/* BAA00 800B9E00 00001812 */  mflo       $v1
/* BAA04 800B9E04 50C00001 */  beql       $a2, $zero, .L800B9E0C
/* BAA08 800B9E08 000001CD */   break     0, 7
.L800B9E0C:
/* BAA0C 800B9E0C 92250005 */   lbu       $a1, 5($s1)
/* BAA10 800B9E10 92220004 */  lbu        $v0, 4($s1)
/* BAA14 800B9E14 00A22823 */  subu       $a1, $a1, $v0
/* BAA18 800B9E18 00A6001A */  div        $zero, $a1, $a2
/* BAA1C 800B9E1C 00002812 */  mflo       $a1
/* BAA20 800B9E20 9227000B */  lbu        $a3, 0xb($s1)
/* BAA24 800B9E24 00000000 */  nop
/* BAA28 800B9E28 00670018 */  mult       $v1, $a3
/* BAA2C 800B9E2C 92290004 */  lbu        $t1, 4($s1)
/* BAA30 800B9E30 00001812 */  mflo       $v1
/* BAA34 800B9E34 01435021 */  addu       $t2, $t2, $v1
/* BAA38 800B9E38 50C00001 */  beql       $a2, $zero, .L800B9E40
/* BAA3C 800B9E3C 000001CD */   break     0, 7
.L800B9E40:
/* BAA40 800B9E40 92240007 */   lbu       $a0, 7($s1)
/* BAA44 800B9E44 92220006 */  lbu        $v0, 6($s1)
/* BAA48 800B9E48 00822023 */  subu       $a0, $a0, $v0
/* BAA4C 800B9E4C 0086001A */  div        $zero, $a0, $a2
/* BAA50 800B9E50 00002012 */  mflo       $a0
/* BAA54 800B9E54 00000000 */  nop
/* BAA58 800B9E58 00000000 */  nop
/* BAA5C 800B9E5C 00A70018 */  mult       $a1, $a3
/* BAA60 800B9E60 92280006 */  lbu        $t0, 6($s1)
/* BAA64 800B9E64 00002812 */  mflo       $a1
/* BAA68 800B9E68 01254821 */  addu       $t1, $t1, $a1
/* BAA6C 800B9E6C 50C00001 */  beql       $a2, $zero, .L800B9E74
/* BAA70 800B9E70 000001CD */   break     0, 7
.L800B9E74:
/* BAA74 800B9E74 92220009 */   lbu       $v0, 9($s1)
/* BAA78 800B9E78 92230008 */  lbu        $v1, 8($s1)
/* BAA7C 800B9E7C 00431023 */  subu       $v0, $v0, $v1
/* BAA80 800B9E80 0046001A */  div        $zero, $v0, $a2
/* BAA84 800B9E84 00001012 */  mflo       $v0
/* BAA88 800B9E88 00000000 */  nop
/* BAA8C 800B9E8C 00000000 */  nop
/* BAA90 800B9E90 00870018 */  mult       $a0, $a3
/* BAA94 800B9E94 92230008 */  lbu        $v1, 8($s1)
/* BAA98 800B9E98 00002012 */  mflo       $a0
/* BAA9C 800B9E9C 01044021 */  addu       $t0, $t0, $a0
/* BAAA0 800B9EA0 50C00001 */  beql       $a2, $zero, .L800B9EA8
/* BAAA4 800B9EA4 000001CD */   break     0, 7
.L800B9EA8:
/* BAAA8 800B9EA8 00470018 */   mult      $v0, $a3
/* BAAAC 800B9EAC 3C01800E */  lui        $at, %hi(D_800E45DC)
/* BAAB0 800B9EB0 C42445DC */  lwc1       $f4, %lo(D_800E45DC)($at)
/* BAAB4 800B9EB4 00001012 */  mflo       $v0
/* BAAB8 800B9EB8 00621821 */  addu       $v1, $v1, $v0
/* BAABC 800B9EBC 00031C00 */  sll        $v1, $v1, 0x10
/* BAAC0 800B9EC0 00031C03 */  sra        $v1, $v1, 0x10
/* BAAC4 800B9EC4 9242005B */  lbu        $v0, 0x5b($s2)
/* BAAC8 800B9EC8 44831000 */  mtc1       $v1, $f2
/* BAACC 800B9ECC 468010A0 */  cvt.s.w    $f2, $f2
/* BAAD0 800B9ED0 44820000 */  mtc1       $v0, $f0
/* BAAD4 800B9ED4 46800020 */  cvt.s.w    $f0, $f0
/* BAAD8 800B9ED8 46040003 */  div.s      $f0, $f0, $f4
/* BAADC 800B9EDC 46001002 */  mul.s      $f0, $f2, $f0
/* BAAE0 800B9EE0 3C01800E */  lui        $at, %hi(D_800E45E0)
/* BAAE4 800B9EE4 C42245E0 */  lwc1       $f2, %lo(D_800E45E0)($at)
/* BAAE8 800B9EE8 A22A000C */  sb         $t2, 0xc($s1)
/* BAAEC 800B9EEC A229000D */  sb         $t1, 0xd($s1)
/* BAAF0 800B9EF0 4600103E */  c.le.s     $f2, $f0
/* BAAF4 800B9EF4 00000000 */  nop
/* BAAF8 800B9EF8 45010005 */  bc1t       .L800B9F10
/* BAAFC 800B9EFC A228000E */   sb        $t0, 0xe($s1)
/* BAB00 800B9F00 4600008D */  trunc.w.s  $f2, $f0
/* BAB04 800B9F04 44031000 */  mfc1       $v1, $f2
/* BAB08 800B9F08 0802E7CA */  j          .L800B9F28
/* BAB0C 800B9F0C 96220020 */   lhu       $v0, 0x20($s1)
.L800B9F10:
/* BAB10 800B9F10 46020001 */  sub.s      $f0, $f0, $f2
/* BAB14 800B9F14 4600008D */  trunc.w.s  $f2, $f0
/* BAB18 800B9F18 44031000 */  mfc1       $v1, $f2
/* BAB1C 800B9F1C 3C028000 */  lui        $v0, 0x8000
/* BAB20 800B9F20 00621825 */  or         $v1, $v1, $v0
/* BAB24 800B9F24 96220020 */  lhu        $v0, 0x20($s1)
.L800B9F28:
/* BAB28 800B9F28 00009821 */  addu       $s3, $zero, $zero
/* BAB2C 800B9F2C 104000A9 */  beqz       $v0, .L800BA1D4
/* BAB30 800B9F30 A223000F */   sb        $v1, 0xf($s1)
/* BAB34 800B9F34 24150002 */  addiu      $s5, $zero, 2
/* BAB38 800B9F38 8E230018 */  lw         $v1, 0x18($s1)
.L800B9F3C:
/* BAB3C 800B9F3C 00131080 */  sll        $v0, $s3, 2
/* BAB40 800B9F40 00431021 */  addu       $v0, $v0, $v1
/* BAB44 800B9F44 8C500000 */  lw         $s0, ($v0)
/* BAB48 800B9F48 96430064 */  lhu        $v1, 0x64($s2)
/* BAB4C 800B9F4C A6030064 */  sh         $v1, 0x64($s0)
/* BAB50 800B9F50 96420066 */  lhu        $v0, 0x66($s2)
/* BAB54 800B9F54 A6020066 */  sh         $v0, 0x66($s0)
/* BAB58 800B9F58 96430068 */  lhu        $v1, 0x68($s2)
/* BAB5C 800B9F5C A6030068 */  sh         $v1, 0x68($s0)
/* BAB60 800B9F60 9642006A */  lhu        $v0, 0x6a($s2)
/* BAB64 800B9F64 A602006A */  sh         $v0, 0x6a($s0)
/* BAB68 800B9F68 92230023 */  lbu        $v1, 0x23($s1)
/* BAB6C 800B9F6C 30620001 */  andi       $v0, $v1, 1
/* BAB70 800B9F70 10400004 */  beqz       $v0, .L800B9F84
/* BAB74 800B9F74 02002021 */   addu      $a0, $s0, $zero
/* BAB78 800B9F78 86450060 */  lh         $a1, 0x60($s2)
/* BAB7C 800B9F7C 0802E7EC */  j          .L800B9FB0
/* BAB80 800B9F80 86460062 */   lh        $a2, 0x62($s2)
.L800B9F84:
/* BAB84 800B9F84 30620002 */  andi       $v0, $v1, 2
/* BAB88 800B9F88 1040000F */  beqz       $v0, .L800B9FC8
/* BAB8C 800B9F8C 8E030078 */   lw        $v1, 0x78($s0)
/* BAB90 800B9F90 84640018 */  lh         $a0, 0x18($v1)
/* BAB94 800B9F94 8C62001C */  lw         $v0, 0x1c($v1)
/* BAB98 800B9F98 0040F809 */  jalr       $v0
/* BAB9C 800B9F9C 02042021 */   addu      $a0, $s0, $a0
/* BABA0 800B9FA0 02002021 */  addu       $a0, $s0, $zero
/* BABA4 800B9FA4 86450060 */  lh         $a1, 0x60($s2)
/* BABA8 800B9FA8 86460062 */  lh         $a2, 0x62($s2)
/* BABAC 800B9FAC 00A22823 */  subu       $a1, $a1, $v0
.L800B9FB0:
/* BABB0 800B9FB0 86220012 */  lh         $v0, 0x12($s1)
/* BABB4 800B9FB4 00D43021 */  addu       $a2, $a2, $s4
/* BABB8 800B9FB8 0C02DD3F */  jal        set_widget_coords
/* BABBC 800B9FBC 00C23021 */   addu      $a2, $a2, $v0
/* BABC0 800B9FC0 0802E801 */  j          .L800BA004
/* BABC4 800B9FC4 8E030078 */   lw        $v1, 0x78($s0)
.L800B9FC8:
/* BABC8 800B9FC8 84640018 */  lh         $a0, 0x18($v1)
/* BABCC 800B9FCC 8C62001C */  lw         $v0, 0x1c($v1)
/* BABD0 800B9FD0 0040F809 */  jalr       $v0
/* BABD4 800B9FD4 02042021 */   addu      $a0, $s0, $a0
/* BABD8 800B9FD8 02002021 */  addu       $a0, $s0, $zero
/* BABDC 800B9FDC 00021042 */  srl        $v0, $v0, 1
/* BABE0 800B9FE0 3042FFFF */  andi       $v0, $v0, 0xffff
/* BABE4 800B9FE4 86450060 */  lh         $a1, 0x60($s2)
/* BABE8 800B9FE8 86460062 */  lh         $a2, 0x62($s2)
/* BABEC 800B9FEC 00A22823 */  subu       $a1, $a1, $v0
/* BABF0 800B9FF0 86220012 */  lh         $v0, 0x12($s1)
/* BABF4 800B9FF4 00D43021 */  addu       $a2, $a2, $s4
/* BABF8 800B9FF8 0C02DD3F */  jal        set_widget_coords
/* BABFC 800B9FFC 00C23021 */   addu      $a2, $a2, $v0
/* BAC00 800BA000 8E030078 */  lw         $v1, 0x78($s0)
.L800BA004:
/* BAC04 800BA004 84640010 */  lh         $a0, 0x10($v1)
/* BAC08 800BA008 8C620014 */  lw         $v0, 0x14($v1)
/* BAC0C 800BA00C 0040F809 */  jalr       $v0
/* BAC10 800BA010 02042021 */   addu      $a0, $s0, $a0
/* BAC14 800BA014 24030001 */  addiu      $v1, $zero, 1
/* BAC18 800BA018 50430009 */  beql       $v0, $v1, .L800BA040
/* BAC1C 800BA01C 86450064 */   lh        $a1, 0x64($s2)
/* BAC20 800BA020 8E030078 */  lw         $v1, 0x78($s0)
/* BAC24 800BA024 84640010 */  lh         $a0, 0x10($v1)
/* BAC28 800BA028 8C620014 */  lw         $v0, 0x14($v1)
/* BAC2C 800BA02C 0040F809 */  jalr       $v0
/* BAC30 800BA030 02042021 */   addu      $a0, $s0, $a0
/* BAC34 800BA034 54550006 */  bnel       $v0, $s5, .L800BA050
/* BAC38 800BA038 8E030078 */   lw        $v1, 0x78($s0)
/* BAC3C 800BA03C 86450064 */  lh         $a1, 0x64($s2)
.L800BA040:
/* BAC40 800BA040 86460066 */  lh         $a2, 0x66($s2)
/* BAC44 800BA044 0C02EF52 */  jal        func_800BBD48
/* BAC48 800BA048 02002021 */   addu      $a0, $s0, $zero
/* BAC4C 800BA04C 8E030078 */  lw         $v1, 0x78($s0)
.L800BA050:
/* BAC50 800BA050 84640020 */  lh         $a0, 0x20($v1)
/* BAC54 800BA054 8C620024 */  lw         $v0, 0x24($v1)
/* BAC58 800BA058 0040F809 */  jalr       $v0
/* BAC5C 800BA05C 02042021 */   addu      $a0, $s0, $a0
/* BAC60 800BA060 00402021 */  addu       $a0, $v0, $zero
/* BAC64 800BA064 92230022 */  lbu        $v1, 0x22($s1)
/* BAC68 800BA068 9622001E */  lhu        $v0, 0x1e($s1)
/* BAC6C 800BA06C 00831821 */  addu       $v1, $a0, $v1
/* BAC70 800BA070 1662003A */  bne        $s3, $v0, .L800BA15C
/* BAC74 800BA074 0283A021 */   addu      $s4, $s4, $v1
/* BAC78 800BA078 92220023 */  lbu        $v0, 0x23($s1)
/* BAC7C 800BA07C 30420008 */  andi       $v0, $v0, 8
/* BAC80 800BA080 1040000B */  beqz       $v0, .L800BA0B0
/* BAC84 800BA084 86050062 */   lh        $a1, 0x62($s0)
/* BAC88 800BA088 000417C2 */  srl        $v0, $a0, 0x1f
/* BAC8C 800BA08C 00821021 */  addu       $v0, $a0, $v0
/* BAC90 800BA090 00021043 */  sra        $v0, $v0, 1
/* BAC94 800BA094 00A21021 */  addu       $v0, $a1, $v0
/* BAC98 800BA098 96430062 */  lhu        $v1, 0x62($s2)
/* BAC9C 800BA09C 96240012 */  lhu        $a0, 0x12($s1)
/* BACA0 800BA0A0 00621823 */  subu       $v1, $v1, $v0
/* BACA4 800BA0A4 00832021 */  addu       $a0, $a0, $v1
/* BACA8 800BA0A8 0802E83D */  j          .L800BA0F4
/* BACAC 800BA0AC A6240012 */   sh        $a0, 0x12($s1)
.L800BA0B0:
/* BACB0 800BA0B0 00A41821 */  addu       $v1, $a1, $a0
/* BACB4 800BA0B4 8642006A */  lh         $v0, 0x6a($s2)
/* BACB8 800BA0B8 0043102A */  slt        $v0, $v0, $v1
/* BACBC 800BA0BC 10400005 */  beqz       $v0, .L800BA0D4
/* BACC0 800BA0C0 9644006A */   lhu       $a0, 0x6a($s2)
/* BACC4 800BA0C4 96220012 */  lhu        $v0, 0x12($s1)
/* BACC8 800BA0C8 00641823 */  subu       $v1, $v1, $a0
/* BACCC 800BA0CC 00431023 */  subu       $v0, $v0, $v1
/* BACD0 800BA0D0 A6220012 */  sh         $v0, 0x12($s1)
.L800BA0D4:
/* BACD4 800BA0D4 86420068 */  lh         $v0, 0x68($s2)
/* BACD8 800BA0D8 00A2102A */  slt        $v0, $a1, $v0
/* BACDC 800BA0DC 10400005 */  beqz       $v0, .L800BA0F4
/* BACE0 800BA0E0 96430068 */   lhu       $v1, 0x68($s2)
/* BACE4 800BA0E4 96220012 */  lhu        $v0, 0x12($s1)
/* BACE8 800BA0E8 00651823 */  subu       $v1, $v1, $a1
/* BACEC 800BA0EC 00431021 */  addu       $v0, $v0, $v1
/* BACF0 800BA0F0 A6220012 */  sh         $v0, 0x12($s1)
.L800BA0F4:
/* BACF4 800BA0F4 8E030078 */  lw         $v1, 0x78($s0)
/* BACF8 800BA0F8 9222000F */  lbu        $v0, 0xf($s1)
/* BACFC 800BA0FC 9225000C */  lbu        $a1, 0xc($s1)
/* BAD00 800BA100 9226000D */  lbu        $a2, 0xd($s1)
/* BAD04 800BA104 9227000E */  lbu        $a3, 0xe($s1)
/* BAD08 800BA108 84640048 */  lh         $a0, 0x48($v1)
/* BAD0C 800BA10C AFA20010 */  sw         $v0, 0x10($sp)
/* BAD10 800BA110 8C68004C */  lw         $t0, 0x4c($v1)
/* BAD14 800BA114 0100F809 */  jalr       $t0
/* BAD18 800BA118 02042021 */   addu      $a0, $s0, $a0
/* BAD1C 800BA11C 8E030078 */  lw         $v1, 0x78($s0)
/* BAD20 800BA120 84640010 */  lh         $a0, 0x10($v1)
/* BAD24 800BA124 8C620014 */  lw         $v0, 0x14($v1)
/* BAD28 800BA128 0040F809 */  jalr       $v0
/* BAD2C 800BA12C 02042021 */   addu      $a0, $s0, $a0
/* BAD30 800BA130 54550004 */  bnel       $v0, $s5, .L800BA144
/* BAD34 800BA134 8E030078 */   lw        $v1, 0x78($s0)
/* BAD38 800BA138 8E020040 */  lw         $v0, 0x40($s0)
/* BAD3C 800BA13C AC40001C */  sw         $zero, 0x1c($v0)
/* BAD40 800BA140 8E030078 */  lw         $v1, 0x78($s0)
.L800BA144:
/* BAD44 800BA144 84640028 */  lh         $a0, 0x28($v1)
/* BAD48 800BA148 8C62002C */  lw         $v0, 0x2c($v1)
/* BAD4C 800BA14C 0040F809 */  jalr       $v0
/* BAD50 800BA150 02042021 */   addu      $a0, $s0, $a0
/* BAD54 800BA154 0802E871 */  j          .L800BA1C4
/* BAD58 800BA158 96220020 */   lhu       $v0, 0x20($s1)
.L800BA15C:
/* BAD5C 800BA15C 8E030078 */  lw         $v1, 0x78($s0)
/* BAD60 800BA160 9242005B */  lbu        $v0, 0x5b($s2)
/* BAD64 800BA164 92450058 */  lbu        $a1, 0x58($s2)
/* BAD68 800BA168 92460059 */  lbu        $a2, 0x59($s2)
/* BAD6C 800BA16C 9247005A */  lbu        $a3, 0x5a($s2)
/* BAD70 800BA170 84640048 */  lh         $a0, 0x48($v1)
/* BAD74 800BA174 AFA20010 */  sw         $v0, 0x10($sp)
/* BAD78 800BA178 8C68004C */  lw         $t0, 0x4c($v1)
/* BAD7C 800BA17C 0100F809 */  jalr       $t0
/* BAD80 800BA180 02042021 */   addu      $a0, $s0, $a0
/* BAD84 800BA184 8E030078 */  lw         $v1, 0x78($s0)
/* BAD88 800BA188 84640010 */  lh         $a0, 0x10($v1)
/* BAD8C 800BA18C 8C620014 */  lw         $v0, 0x14($v1)
/* BAD90 800BA190 0040F809 */  jalr       $v0
/* BAD94 800BA194 02042021 */   addu      $a0, $s0, $a0
/* BAD98 800BA198 54550005 */  bnel       $v0, $s5, .L800BA1B0
/* BAD9C 800BA19C 8E030078 */   lw        $v1, 0x78($s0)
/* BADA0 800BA1A0 8E030040 */  lw         $v1, 0x40($s0)
/* BADA4 800BA1A4 24020001 */  addiu      $v0, $zero, 1
/* BADA8 800BA1A8 AC62001C */  sw         $v0, 0x1c($v1)
/* BADAC 800BA1AC 8E030078 */  lw         $v1, 0x78($s0)
.L800BA1B0:
/* BADB0 800BA1B0 84640028 */  lh         $a0, 0x28($v1)
/* BADB4 800BA1B4 8C62002C */  lw         $v0, 0x2c($v1)
/* BADB8 800BA1B8 0040F809 */  jalr       $v0
/* BADBC 800BA1BC 02042021 */   addu      $a0, $s0, $a0
/* BADC0 800BA1C0 96220020 */  lhu        $v0, 0x20($s1)
.L800BA1C4:
/* BADC4 800BA1C4 26730001 */  addiu      $s3, $s3, 1
/* BADC8 800BA1C8 0262102A */  slt        $v0, $s3, $v0
/* BADCC 800BA1CC 5440FF5B */  bnel       $v0, $zero, .L800B9F3C
/* BADD0 800BA1D0 8E230018 */   lw        $v1, 0x18($s1)
.L800BA1D4:
/* BADD4 800BA1D4 92250022 */  lbu        $a1, 0x22($s1)
/* BADD8 800BA1D8 02402021 */  addu       $a0, $s2, $zero
/* BADDC 800BA1DC 02852823 */  subu       $a1, $s4, $a1
/* BADE0 800BA1E0 0C02DD46 */  jal        set_widgetWidth
/* BADE4 800BA1E4 30A5FFFF */   andi      $a1, $a1, 0xffff
/* BADE8 800BA1E8 0C02DE51 */  jal        func_800B7944
/* BADEC 800BA1EC 02402021 */   addu      $a0, $s2, $zero
/* BADF0 800BA1F0 8FBF0030 */  lw         $ra, 0x30($sp)
/* BADF4 800BA1F4 8FB5002C */  lw         $s5, 0x2c($sp)
/* BADF8 800BA1F8 8FB40028 */  lw         $s4, 0x28($sp)
/* BADFC 800BA1FC 8FB30024 */  lw         $s3, 0x24($sp)
/* BAE00 800BA200 8FB20020 */  lw         $s2, 0x20($sp)
/* BAE04 800BA204 8FB1001C */  lw         $s1, 0x1c($sp)
/* BAE08 800BA208 8FB00018 */  lw         $s0, 0x18($sp)
/* BAE0C 800BA20C 03E00008 */  jr         $ra
/* BAE10 800BA210 27BD0038 */   addiu     $sp, $sp, 0x38

glabel link_widget_text
/* BAE14 800BA214 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BAE18 800BA218 00803021 */  addu       $a2, $a0, $zero
/* BAE1C 800BA21C AFBF0018 */  sw         $ra, 0x18($sp)
/* BAE20 800BA220 AFB10014 */  sw         $s1, 0x14($sp)
/* BAE24 800BA224 AFB00010 */  sw         $s0, 0x10($sp)
/* BAE28 800BA228 94C30064 */  lhu        $v1, 0x64($a2)
/* BAE2C 800BA22C 8CD10040 */  lw         $s1, 0x40($a2)
/* BAE30 800BA230 00A08021 */  addu       $s0, $a1, $zero
/* BAE34 800BA234 A6030064 */  sh         $v1, 0x64($s0)
/* BAE38 800BA238 94C20066 */  lhu        $v0, 0x66($a2)
/* BAE3C 800BA23C A6020066 */  sh         $v0, 0x66($s0)
/* BAE40 800BA240 94C30068 */  lhu        $v1, 0x68($a2)
/* BAE44 800BA244 A6030068 */  sh         $v1, 0x68($s0)
/* BAE48 800BA248 94C2006A */  lhu        $v0, 0x6a($a2)
/* BAE4C 800BA24C 8E030078 */  lw         $v1, 0x78($s0)
/* BAE50 800BA250 A602006A */  sh         $v0, 0x6a($s0)
/* BAE54 800BA254 84640028 */  lh         $a0, 0x28($v1)
/* BAE58 800BA258 8C62002C */  lw         $v0, 0x2c($v1)
/* BAE5C 800BA25C 0040F809 */  jalr       $v0
/* BAE60 800BA260 02042021 */   addu      $a0, $s0, $a0
/* BAE64 800BA264 96230020 */  lhu        $v1, 0x20($s1)
/* BAE68 800BA268 8E250018 */  lw         $a1, 0x18($s1)
/* BAE6C 800BA26C 96240020 */  lhu        $a0, 0x20($s1)
/* BAE70 800BA270 8FBF0018 */  lw         $ra, 0x18($sp)
/* BAE74 800BA274 00031880 */  sll        $v1, $v1, 2
/* BAE78 800BA278 24840001 */  addiu      $a0, $a0, 1
/* BAE7C 800BA27C A6240020 */  sh         $a0, 0x20($s1)
/* BAE80 800BA280 8FB10014 */  lw         $s1, 0x14($sp)
/* BAE84 800BA284 00651821 */  addu       $v1, $v1, $a1
/* BAE88 800BA288 AC700000 */  sw         $s0, ($v1)
/* BAE8C 800BA28C 8FB00010 */  lw         $s0, 0x10($sp)
/* BAE90 800BA290 24020001 */  addiu      $v0, $zero, 1
/* BAE94 800BA294 03E00008 */  jr         $ra
/* BAE98 800BA298 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BA29C
/* BAE9C 800BA29C 8C870040 */  lw         $a3, 0x40($a0)
/* BAEA0 800BA2A0 94E30020 */  lhu        $v1, 0x20($a3)
/* BAEA4 800BA2A4 10600011 */  beqz       $v1, .L800BA2EC
/* BAEA8 800BA2A8 00003021 */   addu      $a2, $zero, $zero
/* BAEAC 800BA2AC 8CE80018 */  lw         $t0, 0x18($a3)
/* BAEB0 800BA2B0 8D020000 */  lw         $v0, ($t0)
/* BAEB4 800BA2B4 1045000A */  beq        $v0, $a1, .L800BA2E0
/* BAEB8 800BA2B8 00602021 */   addu      $a0, $v1, $zero
/* BAEBC 800BA2BC 00804821 */  addu       $t1, $a0, $zero
/* BAEC0 800BA2C0 01001821 */  addu       $v1, $t0, $zero
/* BAEC4 800BA2C4 24C60001 */  addiu      $a2, $a2, 1
.L800BA2C8:
/* BAEC8 800BA2C8 00C9102A */  slt        $v0, $a2, $t1
/* BAECC 800BA2CC 10400007 */  beqz       $v0, .L800BA2EC
/* BAED0 800BA2D0 24630004 */   addiu     $v1, $v1, 4
/* BAED4 800BA2D4 8C620000 */  lw         $v0, ($v1)
/* BAED8 800BA2D8 5445FFFB */  bnel       $v0, $a1, .L800BA2C8
/* BAEDC 800BA2DC 24C60001 */   addiu     $a2, $a2, 1
.L800BA2E0:
/* BAEE0 800BA2E0 00C4102A */  slt        $v0, $a2, $a0
/* BAEE4 800BA2E4 14400003 */  bnez       $v0, .L800BA2F4
/* BAEE8 800BA2E8 2482FFFF */   addiu     $v0, $a0, -1
.L800BA2EC:
/* BAEEC 800BA2EC 03E00008 */  jr         $ra
/* BAEF0 800BA2F0 00001021 */   addu      $v0, $zero, $zero
.L800BA2F4:
/* BAEF4 800BA2F4 00C2102A */  slt        $v0, $a2, $v0
/* BAEF8 800BA2F8 1040000C */  beqz       $v0, .L800BA32C
/* BAEFC 800BA2FC 00061080 */   sll       $v0, $a2, 2
/* BAF00 800BA300 8CE30018 */  lw         $v1, 0x18($a3)
/* BAF04 800BA304 94E40020 */  lhu        $a0, 0x20($a3)
/* BAF08 800BA308 00431821 */  addu       $v1, $v0, $v1
/* BAF0C 800BA30C 2484FFFF */  addiu      $a0, $a0, -1
/* BAF10 800BA310 00863023 */  subu       $a2, $a0, $a2
.L800BA314:
/* BAF14 800BA314 8C620004 */  lw         $v0, 4($v1)
/* BAF18 800BA318 24C6FFFF */  addiu      $a2, $a2, -1
/* BAF1C 800BA31C AC620000 */  sw         $v0, ($v1)
/* BAF20 800BA320 14C0FFFC */  bnez       $a2, .L800BA314
/* BAF24 800BA324 24630004 */   addiu     $v1, $v1, 4
/* BAF28 800BA328 00803021 */  addu       $a2, $a0, $zero
.L800BA32C:
/* BAF2C 800BA32C 24020001 */  addiu      $v0, $zero, 1
/* BAF30 800BA330 00061880 */  sll        $v1, $a2, 2
/* BAF34 800BA334 8CE50018 */  lw         $a1, 0x18($a3)
/* BAF38 800BA338 94E40020 */  lhu        $a0, 0x20($a3)
/* BAF3C 800BA33C 00651821 */  addu       $v1, $v1, $a1
/* BAF40 800BA340 2484FFFF */  addiu      $a0, $a0, -1
/* BAF44 800BA344 AC600000 */  sw         $zero, ($v1)
/* BAF48 800BA348 03E00008 */  jr         $ra
/* BAF4C 800BA34C A4E40020 */   sh        $a0, 0x20($a3)

glabel func_800BA350
/* BAF50 800BA350 8C820040 */  lw         $v0, 0x40($a0)
/* BAF54 800BA354 03E00008 */  jr         $ra
/* BAF58 800BA358 A0450023 */   sb        $a1, 0x23($v0)

glabel ret0_800ba35c
/* BAF5C 800BA35C 03E00008 */  jr         $ra
/* BAF60 800BA360 24020008 */   addiu     $v0, $zero, 8
/* BAF64 800BA364 00000000 */  nop
/* BAF68 800BA368 00000000 */  nop
/* BAF6C 800BA36C 00000000 */  nop
