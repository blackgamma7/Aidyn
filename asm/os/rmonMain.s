.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonSendHeader
/* CA100 800C9500 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CA104 800C9504 AFB1001C */  sw         $s1, 0x1c($sp)
/* CA108 800C9508 00A08821 */  addu       $s1, $a1, $zero
/* CA10C 800C950C AFB00018 */  sw         $s0, 0x18($sp)
/* CA110 800C9510 00008021 */  addu       $s0, $zero, $zero
/* CA114 800C9514 AFB20020 */  sw         $s2, 0x20($sp)
/* CA118 800C9518 00809021 */  addu       $s2, $a0, $zero
/* CA11C 800C951C 24020002 */  addiu      $v0, $zero, 2
/* CA120 800C9520 AFBF0024 */  sw         $ra, 0x24($sp)
/* CA124 800C9524 A2420008 */  sb         $v0, 8($s2)
/* CA128 800C9528 12200009 */  beqz       $s1, .L800C9550
/* CA12C 800C952C A2460005 */   sb        $a2, 5($s2)
/* CA130 800C9530 02502021 */  addu       $a0, $s2, $s0
.L800C9534:
/* CA134 800C9534 02302823 */  subu       $a1, $s1, $s0
/* CA138 800C9538 0C02FF60 */  jal        __osRdbSend
/* CA13C 800C953C 24060008 */   addiu     $a2, $zero, 8
/* CA140 800C9540 02028021 */  addu       $s0, $s0, $v0
/* CA144 800C9544 0211102B */  sltu       $v0, $s0, $s1
/* CA148 800C9548 1440FFFA */  bnez       $v0, .L800C9534
/* CA14C 800C954C 02502021 */   addu      $a0, $s2, $s0
.L800C9550:
/* CA150 800C9550 8FBF0024 */  lw         $ra, 0x24($sp)
/* CA154 800C9554 8FB20020 */  lw         $s2, 0x20($sp)
/* CA158 800C9558 8FB1001C */  lw         $s1, 0x1c($sp)
/* CA15C 800C955C 8FB00018 */  lw         $s0, 0x18($sp)
/* CA160 800C9560 03E00008 */  jr         $ra
/* CA164 800C9564 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __rmonSendReply
/* CA168 800C9568 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CA16C 800C956C AFB20020 */  sw         $s2, 0x20($sp)
/* CA170 800C9570 00809021 */  addu       $s2, $a0, $zero
/* CA174 800C9574 AFB40028 */  sw         $s4, 0x28($sp)
/* CA178 800C9578 00C0A021 */  addu       $s4, $a2, $zero
/* CA17C 800C957C AFB00018 */  sw         $s0, 0x18($sp)
/* CA180 800C9580 00008021 */  addu       $s0, $zero, $zero
/* CA184 800C9584 AFB1001C */  sw         $s1, 0x1c($sp)
/* CA188 800C9588 27B10034 */  addiu      $s1, $sp, 0x34
/* CA18C 800C958C AFB30024 */  sw         $s3, 0x24($sp)
/* CA190 800C9590 24130004 */  addiu      $s3, $zero, 4
/* CA194 800C9594 AFBF002C */  sw         $ra, 0x2c($sp)
/* CA198 800C9598 AFA50034 */  sw         $a1, 0x34($sp)
/* CA19C 800C959C AE450000 */  sw         $a1, ($s2)
/* CA1A0 800C95A0 02302021 */  addu       $a0, $s1, $s0
.L800C95A4:
/* CA1A4 800C95A4 02702823 */  subu       $a1, $s3, $s0
/* CA1A8 800C95A8 0C02FF60 */  jal        __osRdbSend
/* CA1AC 800C95AC 24060008 */   addiu     $a2, $zero, 8
/* CA1B0 800C95B0 02028021 */  addu       $s0, $s0, $v0
/* CA1B4 800C95B4 2A020004 */  slti       $v0, $s0, 4
/* CA1B8 800C95B8 1440FFFA */  bnez       $v0, .L800C95A4
/* CA1BC 800C95BC 02302021 */   addu      $a0, $s1, $s0
/* CA1C0 800C95C0 8FB10034 */  lw         $s1, 0x34($sp)
/* CA1C4 800C95C4 00008021 */  addu       $s0, $zero, $zero
/* CA1C8 800C95C8 24020002 */  addiu      $v0, $zero, 2
/* CA1CC 800C95CC A2420008 */  sb         $v0, 8($s2)
/* CA1D0 800C95D0 12200009 */  beqz       $s1, .L800C95F8
/* CA1D4 800C95D4 A2540005 */   sb        $s4, 5($s2)
/* CA1D8 800C95D8 02502021 */  addu       $a0, $s2, $s0
.L800C95DC:
/* CA1DC 800C95DC 02302823 */  subu       $a1, $s1, $s0
/* CA1E0 800C95E0 0C02FF60 */  jal        __osRdbSend
/* CA1E4 800C95E4 24060008 */   addiu     $a2, $zero, 8
/* CA1E8 800C95E8 02028021 */  addu       $s0, $s0, $v0
/* CA1EC 800C95EC 0211102B */  sltu       $v0, $s0, $s1
/* CA1F0 800C95F0 1440FFFA */  bnez       $v0, .L800C95DC
/* CA1F4 800C95F4 02502021 */   addu      $a0, $s2, $s0
.L800C95F8:
/* CA1F8 800C95F8 0C03225B */  jal        __rmonIOflush
/* CA1FC 800C95FC 00000000 */   nop
/* CA200 800C9600 8FBF002C */  lw         $ra, 0x2c($sp)
/* CA204 800C9604 8FB40028 */  lw         $s4, 0x28($sp)
/* CA208 800C9608 8FB30024 */  lw         $s3, 0x24($sp)
/* CA20C 800C960C 8FB20020 */  lw         $s2, 0x20($sp)
/* CA210 800C9610 8FB1001C */  lw         $s1, 0x1c($sp)
/* CA214 800C9614 8FB00018 */  lw         $s0, 0x18($sp)
/* CA218 800C9618 03E00008 */  jr         $ra
/* CA21C 800C961C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel __rmonSendData
/* CA220 800C9620 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CA224 800C9624 AFB00018 */  sw         $s0, 0x18($sp)
/* CA228 800C9628 00808021 */  addu       $s0, $a0, $zero
/* CA22C 800C962C 24A50003 */  addiu      $a1, $a1, 3
/* CA230 800C9630 AFB1001C */  sw         $s1, 0x1c($sp)
/* CA234 800C9634 00058882 */  srl        $s1, $a1, 2
/* CA238 800C9638 32020003 */  andi       $v0, $s0, 3
/* CA23C 800C963C AFBF002C */  sw         $ra, 0x2c($sp)
/* CA240 800C9640 AFB40028 */  sw         $s4, 0x28($sp)
/* CA244 800C9644 AFB30024 */  sw         $s3, 0x24($sp)
/* CA248 800C9648 14400019 */  bnez       $v0, .L800C96B0
/* CA24C 800C964C AFB20020 */   sw        $s2, 0x20($sp)
/* CA250 800C9650 2631FFFF */  addiu      $s1, $s1, -1
/* CA254 800C9654 2402FFFF */  addiu      $v0, $zero, -1
/* CA258 800C9658 12220023 */  beq        $s1, $v0, .L800C96E8
/* CA25C 800C965C 3C14FC00 */   lui       $s4, 0xfc00
/* CA260 800C9660 3C1200FF */  lui        $s2, 0xff
/* CA264 800C9664 3652FFFF */  ori        $s2, $s2, 0xffff
/* CA268 800C9668 2413FFFF */  addiu      $s3, $zero, -1
/* CA26C 800C966C 02141021 */  addu       $v0, $s0, $s4
.L800C9670:
/* CA270 800C9670 0242102B */  sltu       $v0, $s2, $v0
/* CA274 800C9674 14400006 */  bnez       $v0, .L800C9690
/* CA278 800C9678 02002021 */   addu      $a0, $s0, $zero
/* CA27C 800C967C 0C03337C */  jal        __osSpRawReadIo
/* CA280 800C9680 27A50010 */   addiu     $a1, $sp, 0x10
/* CA284 800C9684 8FA40010 */  lw         $a0, 0x10($sp)
/* CA288 800C9688 080325A5 */  j          .L800C9694
/* CA28C 800C968C 00000000 */   nop
.L800C9690:
/* CA290 800C9690 8E040000 */  lw         $a0, ($s0)
.L800C9694:
/* CA294 800C9694 0C03226A */  jal        __rmonIOputw
/* CA298 800C9698 26100004 */   addiu     $s0, $s0, 4
/* CA29C 800C969C 2631FFFF */  addiu      $s1, $s1, -1
/* CA2A0 800C96A0 1633FFF3 */  bne        $s1, $s3, .L800C9670
/* CA2A4 800C96A4 02141021 */   addu      $v0, $s0, $s4
/* CA2A8 800C96A8 080325BA */  j          .L800C96E8
/* CA2AC 800C96AC 00000000 */   nop
.L800C96B0:
/* CA2B0 800C96B0 2631FFFF */  addiu      $s1, $s1, -1
/* CA2B4 800C96B4 2402FFFF */  addiu      $v0, $zero, -1
/* CA2B8 800C96B8 1222000B */  beq        $s1, $v0, .L800C96E8
/* CA2BC 800C96BC 27A40014 */   addiu     $a0, $sp, 0x14
/* CA2C0 800C96C0 2412FFFF */  addiu      $s2, $zero, -1
.L800C96C4:
/* CA2C4 800C96C4 02002821 */  addu       $a1, $s0, $zero
/* CA2C8 800C96C8 0C032648 */  jal        __rmonMemcpy
/* CA2CC 800C96CC 24060004 */   addiu     $a2, $zero, 4
/* CA2D0 800C96D0 8FA40014 */  lw         $a0, 0x14($sp)
/* CA2D4 800C96D4 26100004 */  addiu      $s0, $s0, 4
/* CA2D8 800C96D8 0C03226A */  jal        __rmonIOputw
/* CA2DC 800C96DC 2631FFFF */   addiu     $s1, $s1, -1
/* CA2E0 800C96E0 1632FFF8 */  bne        $s1, $s2, .L800C96C4
/* CA2E4 800C96E4 27A40014 */   addiu     $a0, $sp, 0x14
.L800C96E8:
/* CA2E8 800C96E8 0C03225B */  jal        __rmonIOflush
/* CA2EC 800C96EC 00000000 */   nop
/* CA2F0 800C96F0 8FBF002C */  lw         $ra, 0x2c($sp)
/* CA2F4 800C96F4 8FB40028 */  lw         $s4, 0x28($sp)
/* CA2F8 800C96F8 8FB30024 */  lw         $s3, 0x24($sp)
/* CA2FC 800C96FC 8FB20020 */  lw         $s2, 0x20($sp)
/* CA300 800C9700 8FB1001C */  lw         $s1, 0x1c($sp)
/* CA304 800C9704 8FB00018 */  lw         $s0, 0x18($sp)
/* CA308 800C9708 03E00008 */  jr         $ra
/* CA30C 800C970C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel rmonMain
/* CA310 800C9710 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CA314 800C9714 AFBF0024 */  sw         $ra, 0x24($sp)
/* CA318 800C9718 AFB20020 */  sw         $s2, 0x20($sp)
/* CA31C 800C971C AFB1001C */  sw         $s1, 0x1c($sp)
/* CA320 800C9720 AFB00018 */  sw         $s0, 0x18($sp)
/* CA324 800C9724 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA328 800C9728 AC209ED0 */  sw         $zero, %lo(rmon_SomethingToDo_)($at)
/* CA32C 800C972C 3C018010 */  lui        $at, %hi(rmon_somethingToDo)
/* CA330 800C9730 A020A341 */  sb         $zero, %lo(rmon_somethingToDo)($at)
/* CA334 800C9734 3C018010 */  lui        $at, %hi(rmon_cmdinptr)
/* CA338 800C9738 A020A340 */  sb         $zero, %lo(rmon_cmdinptr)($at)
/* CA33C 800C973C 0C032813 */  jal        __rmonInit
/* CA340 800C9740 2412FFFD */   addiu     $s2, $zero, -3
/* CA344 800C9744 2411FFFB */  addiu      $s1, $zero, -5
/* CA348 800C9748 2410FFF7 */  addiu      $s0, $zero, -9
/* CA34C 800C974C 24020001 */  addiu      $v0, $zero, 1
/* CA350 800C9750 3C01800F */  lui        $at, %hi(__rmonActive)
/* CA354 800C9754 AC2239A0 */  sw         $v0, %lo(__rmonActive)($at)
/* CA358 800C9758 3C028010 */  lui        $v0, %hi(rmonmain_bss_0010)
/* CA35C 800C975C 24429EE0 */  addiu      $v0, $v0, %lo(rmonmain_bss_0010)
/* CA360 800C9760 3C018010 */  lui        $at, %hi(rmonmain_bss_0474)
/* CA364 800C9764 AC20A344 */  sw         $zero, %lo(rmonmain_bss_0474)($at)
/* CA368 800C9768 3C018010 */  lui        $at, %hi(rmonmain_bss_0478)
/* CA36C 800C976C AC22A348 */  sw         $v0, %lo(rmonmain_bss_0478)($at)
.L800C9770:
/* CA370 800C9770 3C048010 */  lui        $a0, %hi(__rmonMQ)
/* CA374 800C9774 2484E660 */  addiu      $a0, $a0, %lo(__rmonMQ)
/* CA378 800C9778 27A50010 */  addiu      $a1, $sp, 0x10
/* CA37C 800C977C 0C0321E4 */  jal        osRecvMesg
/* CA380 800C9780 24060001 */   addiu     $a2, $zero, 1
/* CA384 800C9784 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA388 800C9788 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA38C 800C978C 8FA30010 */  lw         $v1, 0x10($sp)
/* CA390 800C9790 00431025 */  or         $v0, $v0, $v1
/* CA394 800C9794 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA398 800C9798 AC229ED0 */  sw         $v0, %lo(rmon_SomethingToDo_)($at)
/* CA39C 800C979C 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA3A0 800C97A0 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA3A4 800C97A4 30420002 */  andi       $v0, $v0, 2
/* CA3A8 800C97A8 10400007 */  beqz       $v0, .L800C97C8
/* CA3AC 800C97AC 00000000 */   nop
/* CA3B0 800C97B0 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA3B4 800C97B4 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA3B8 800C97B8 00521024 */  and        $v0, $v0, $s2
/* CA3BC 800C97BC 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA3C0 800C97C0 0C032455 */  jal        __rmonHitBreak
/* CA3C4 800C97C4 AC229ED0 */   sw        $v0, %lo(rmon_SomethingToDo_)($at)
.L800C97C8:
/* CA3C8 800C97C8 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA3CC 800C97CC 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA3D0 800C97D0 30420004 */  andi       $v0, $v0, 4
/* CA3D4 800C97D4 10400007 */  beqz       $v0, .L800C97F4
/* CA3D8 800C97D8 00000000 */   nop
/* CA3DC 800C97DC 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA3E0 800C97E0 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA3E4 800C97E4 00511024 */  and        $v0, $v0, $s1
/* CA3E8 800C97E8 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA3EC 800C97EC 0C03248C */  jal        __rmonHitSpBreak
/* CA3F0 800C97F0 AC229ED0 */   sw        $v0, %lo(rmon_SomethingToDo_)($at)
.L800C97F4:
/* CA3F4 800C97F4 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA3F8 800C97F8 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA3FC 800C97FC 30420008 */  andi       $v0, $v0, 8
/* CA400 800C9800 10400007 */  beqz       $v0, .L800C9820
/* CA404 800C9804 00000000 */   nop
/* CA408 800C9808 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA40C 800C980C 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA410 800C9810 00501024 */  and        $v0, $v0, $s0
/* CA414 800C9814 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA418 800C9818 0C0324AF */  jal        __rmonHitCpuFault
/* CA41C 800C981C AC229ED0 */   sw        $v0, %lo(rmon_SomethingToDo_)($at)
.L800C9820:
/* CA420 800C9820 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA424 800C9824 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA428 800C9828 30420010 */  andi       $v0, $v0, 0x10
/* CA42C 800C982C 10400008 */  beqz       $v0, .L800C9850
/* CA430 800C9830 00000000 */   nop
/* CA434 800C9834 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA438 800C9838 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA43C 800C983C 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA440 800C9840 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA444 800C9844 304200EF */  andi       $v0, $v0, 0xef
/* CA448 800C9848 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA44C 800C984C AC229ED0 */  sw         $v0, %lo(rmon_SomethingToDo_)($at)
.L800C9850:
/* CA450 800C9850 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA454 800C9854 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA458 800C9858 30420020 */  andi       $v0, $v0, 0x20
/* CA45C 800C985C 1040FFC4 */  beqz       $v0, .L800C9770
/* CA460 800C9860 00000000 */   nop
/* CA464 800C9864 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA468 800C9868 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA46C 800C986C 3C028010 */  lui        $v0, %hi(rmon_SomethingToDo_)
/* CA470 800C9870 8C429ED0 */  lw         $v0, %lo(rmon_SomethingToDo_)($v0)
/* CA474 800C9874 304200DF */  andi       $v0, $v0, 0xdf
/* CA478 800C9878 3C018010 */  lui        $at, %hi(rmon_SomethingToDo_)
/* CA47C 800C987C 080325DC */  j          .L800C9770
/* CA480 800C9880 AC229ED0 */   sw        $v0, %lo(rmon_SomethingToDo_)($at)
/* CA484 800C9884 8FBF0024 */  lw         $ra, 0x24($sp)
/* CA488 800C9888 8FB20020 */  lw         $s2, 0x20($sp)
/* CA48C 800C988C 8FB1001C */  lw         $s1, 0x1c($sp)
/* CA490 800C9890 8FB00018 */  lw         $s0, 0x18($sp)
/* CA494 800C9894 03E00008 */  jr         $ra
/* CA498 800C9898 27BD0028 */   addiu     $sp, $sp, 0x28
/* CA49C 800C989C 00000000 */  nop
