.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel stat_train_widget
/* 42420 80041820 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 42424 80041824 AFB1001C */  sw         $s1, 0x1c($sp)
/* 42428 80041828 00808821 */  addu       $s1, $a0, $zero
/* 4242C 8004182C 24050012 */  addiu      $a1, $zero, 0x12
/* 42430 80041830 AFBF0024 */  sw         $ra, 0x24($sp)
/* 42434 80041834 AFB20020 */  sw         $s2, 0x20($sp)
/* 42438 80041838 0C00DF44 */  jal        func_80037D10
/* 4243C 8004183C AFB00018 */   sw        $s0, 0x18($sp)
/* 42440 80041840 3C03800E */  lui        $v1, %hi(D_800DCAC8)
/* 42444 80041844 2463CAC8 */  addiu      $v1, $v1, %lo(D_800DCAC8)
/* 42448 80041848 3C02800F */  lui        $v0, %hi(partypicker)
/* 4244C 8004184C AE230078 */  sw         $v1, 0x78($s1)
/* 42450 80041850 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 42454 80041854 2404007C */  addiu      $a0, $zero, 0x7c
/* 42458 80041858 0C026259 */  jal        passToMalloc
/* 4245C 8004185C A2230088 */   sb        $v1, 0x88($s1)
/* 42460 80041860 240400EE */  addiu      $a0, $zero, 0xee
/* 42464 80041864 0C0290E2 */  jal        get_borg_8
/* 42468 80041868 00408021 */   addu      $s0, $v0, $zero
/* 4246C 8004186C 02002021 */  addu       $a0, $s0, $zero
/* 42470 80041870 0C02E518 */  jal        borg8_widget
/* 42474 80041874 00402821 */   addu      $a1, $v0, $zero
/* 42478 80041878 00402021 */  addu       $a0, $v0, $zero
/* 4247C 8004187C 2405009E */  addiu      $a1, $zero, 0x9e
/* 42480 80041880 24060051 */  addiu      $a2, $zero, 0x51
/* 42484 80041884 0C02DD3F */  jal        set_widget_coords
/* 42488 80041888 AE22007C */   sw        $v0, 0x7c($s1)
/* 4248C 8004188C 8E25007C */  lw         $a1, 0x7c($s1)
/* 42490 80041890 0C02DEDC */  jal        link_widgets
/* 42494 80041894 02202021 */   addu      $a0, $s1, $zero
/* 42498 80041898 02202021 */  addu       $a0, $s1, $zero
/* 4249C 8004189C 24050082 */  addiu      $a1, $zero, 0x82
/* 424A0 800418A0 24060050 */  addiu      $a2, $zero, 0x50
/* 424A4 800418A4 240200FF */  addiu      $v0, $zero, 0xff
/* 424A8 800418A8 24070050 */  addiu      $a3, $zero, 0x50
/* 424AC 800418AC 0C02DD4A */  jal        set_widget_color
/* 424B0 800418B0 AFA20010 */   sw        $v0, 0x10($sp)
/* 424B4 800418B4 2404007C */  addiu      $a0, $zero, 0x7c
/* 424B8 800418B8 0C026259 */  jal        passToMalloc
/* 424BC 800418BC AE200080 */   sw        $zero, 0x80($s1)
/* 424C0 800418C0 3C12800E */  lui        $s2, %hi(gGlobals)
/* 424C4 800418C4 265268A8 */  addiu      $s2, $s2, %lo(gGlobals)
/* 424C8 800418C8 8E43204C */  lw         $v1, 0x204c($s2)
/* 424CC 800418CC 00402021 */  addu       $a0, $v0, $zero
/* 424D0 800418D0 8C6507E8 */  lw         $a1, 0x7e8($v1)
/* 424D4 800418D4 0C02DFC8 */  jal        widgetcliptext_init
/* 424D8 800418D8 24060190 */   addiu     $a2, $zero, 0x190
/* 424DC 800418DC 02202021 */  addu       $a0, $s1, $zero
/* 424E0 800418E0 00402821 */  addu       $a1, $v0, $zero
/* 424E4 800418E4 0C02DEDC */  jal        link_widgets
/* 424E8 800418E8 AE22008C */   sw        $v0, 0x8c($s1)
/* 424EC 800418EC 00002821 */  addu       $a1, $zero, $zero
/* 424F0 800418F0 8E24008C */  lw         $a0, 0x8c($s1)
/* 424F4 800418F4 0C02EF52 */  jal        func_800BBD48
/* 424F8 800418F8 24060280 */   addiu     $a2, $zero, 0x280
/* 424FC 800418FC 0C026259 */  jal        passToMalloc
/* 42500 80041900 2404007C */   addiu     $a0, $zero, 0x7c
/* 42504 80041904 00402021 */  addu       $a0, $v0, $zero
/* 42508 80041908 3C10800E */  lui        $s0, %hi(D_800DCAA0)
/* 4250C 8004190C 2610CAA0 */  addiu      $s0, $s0, %lo(D_800DCAA0)
/* 42510 80041910 02002821 */  addu       $a1, $s0, $zero
/* 42514 80041914 0C02DFC8 */  jal        widgetcliptext_init
/* 42518 80041918 24060190 */   addiu     $a2, $zero, 0x190
/* 4251C 8004191C 02202021 */  addu       $a0, $s1, $zero
/* 42520 80041920 00402821 */  addu       $a1, $v0, $zero
/* 42524 80041924 0C02DEDC */  jal        link_widgets
/* 42528 80041928 AE220090 */   sw        $v0, 0x90($s1)
/* 4252C 8004192C 0C026259 */  jal        passToMalloc
/* 42530 80041930 2404007C */   addiu     $a0, $zero, 0x7c
/* 42534 80041934 8E43204C */  lw         $v1, 0x204c($s2)
/* 42538 80041938 00402021 */  addu       $a0, $v0, $zero
/* 4253C 8004193C 8C6507EC */  lw         $a1, 0x7ec($v1)
/* 42540 80041940 0C02DFC8 */  jal        widgetcliptext_init
/* 42544 80041944 24060190 */   addiu     $a2, $zero, 0x190
/* 42548 80041948 02202021 */  addu       $a0, $s1, $zero
/* 4254C 8004194C 00402821 */  addu       $a1, $v0, $zero
/* 42550 80041950 0C02DEDC */  jal        link_widgets
/* 42554 80041954 AE220094 */   sw        $v0, 0x94($s1)
/* 42558 80041958 00002821 */  addu       $a1, $zero, $zero
/* 4255C 8004195C 8E240094 */  lw         $a0, 0x94($s1)
/* 42560 80041960 0C02EF52 */  jal        func_800BBD48
/* 42564 80041964 24060280 */   addiu     $a2, $zero, 0x280
/* 42568 80041968 0C026259 */  jal        passToMalloc
/* 4256C 8004196C 2404007C */   addiu     $a0, $zero, 0x7c
/* 42570 80041970 00402021 */  addu       $a0, $v0, $zero
/* 42574 80041974 02002821 */  addu       $a1, $s0, $zero
/* 42578 80041978 0C02DFC8 */  jal        widgetcliptext_init
/* 4257C 8004197C 24060190 */   addiu     $a2, $zero, 0x190
/* 42580 80041980 02202021 */  addu       $a0, $s1, $zero
/* 42584 80041984 00402821 */  addu       $a1, $v0, $zero
/* 42588 80041988 0C02DEDC */  jal        link_widgets
/* 4258C 8004198C AE220098 */   sw        $v0, 0x98($s1)
/* 42590 80041990 0C026259 */  jal        passToMalloc
/* 42594 80041994 2404007C */   addiu     $a0, $zero, 0x7c
/* 42598 80041998 8E43204C */  lw         $v1, 0x204c($s2)
/* 4259C 8004199C 00402021 */  addu       $a0, $v0, $zero
/* 425A0 800419A0 8C6507F0 */  lw         $a1, 0x7f0($v1)
/* 425A4 800419A4 0C02DFC8 */  jal        widgetcliptext_init
/* 425A8 800419A8 24060190 */   addiu     $a2, $zero, 0x190
/* 425AC 800419AC 02202021 */  addu       $a0, $s1, $zero
/* 425B0 800419B0 00402821 */  addu       $a1, $v0, $zero
/* 425B4 800419B4 0C02DEDC */  jal        link_widgets
/* 425B8 800419B8 AE2200A0 */   sw        $v0, 0xa0($s1)
/* 425BC 800419BC 00002821 */  addu       $a1, $zero, $zero
/* 425C0 800419C0 8E2400A0 */  lw         $a0, 0xa0($s1)
/* 425C4 800419C4 0C02EF52 */  jal        func_800BBD48
/* 425C8 800419C8 24060280 */   addiu     $a2, $zero, 0x280
/* 425CC 800419CC 0C026259 */  jal        passToMalloc
/* 425D0 800419D0 2404007C */   addiu     $a0, $zero, 0x7c
/* 425D4 800419D4 00402021 */  addu       $a0, $v0, $zero
/* 425D8 800419D8 3C05800E */  lui        $a1, %hi(D_800DCAB0)
/* 425DC 800419DC 24A5CAB0 */  addiu      $a1, $a1, %lo(D_800DCAB0)
/* 425E0 800419E0 0C02DFC8 */  jal        widgetcliptext_init
/* 425E4 800419E4 24060190 */   addiu     $a2, $zero, 0x190
/* 425E8 800419E8 02202021 */  addu       $a0, $s1, $zero
/* 425EC 800419EC 00402821 */  addu       $a1, $v0, $zero
/* 425F0 800419F0 0C02DEDC */  jal        link_widgets
/* 425F4 800419F4 AE22009C */   sw        $v0, 0x9c($s1)
/* 425F8 800419F8 0C010690 */  jal        some_exp_showing_func
/* 425FC 800419FC 02202021 */   addu      $a0, $s1, $zero
/* 42600 80041A00 02201021 */  addu       $v0, $s1, $zero
/* 42604 80041A04 8FBF0024 */  lw         $ra, 0x24($sp)
/* 42608 80041A08 8FB20020 */  lw         $s2, 0x20($sp)
/* 4260C 80041A0C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 42610 80041A10 8FB00018 */  lw         $s0, 0x18($sp)
/* 42614 80041A14 03E00008 */  jr         $ra
/* 42618 80041A18 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80041A1C
/* 4261C 80041A1C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 42620 80041A20 3C02800E */  lui        $v0, %hi(D_800DCAC8)
/* 42624 80041A24 2442CAC8 */  addiu      $v0, $v0, %lo(D_800DCAC8)
/* 42628 80041A28 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4262C 80041A2C 0C02E66C */  jal        widget_menu_free
/* 42630 80041A30 AC820078 */   sw        $v0, 0x78($a0)
/* 42634 80041A34 8FBF0010 */  lw         $ra, 0x10($sp)
/* 42638 80041A38 03E00008 */  jr         $ra
/* 4263C 80041A3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_exp_showing_func
/* 42640 80041A40 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 42644 80041A44 AFB60040 */  sw         $s6, 0x40($sp)
/* 42648 80041A48 0000B021 */  addu       $s6, $zero, $zero
/* 4264C 80041A4C 3C02800F */  lui        $v0, %hi(partypicker)
/* 42650 80041A50 AFB30034 */  sw         $s3, 0x34($sp)
/* 42654 80041A54 00809821 */  addu       $s3, $a0, $zero
/* 42658 80041A58 9043D550 */  lbu        $v1, %lo(partypicker)($v0)
/* 4265C 80041A5C 3C04800E */  lui        $a0, %hi(gGlobals)
/* 42660 80041A60 AFB5003C */  sw         $s5, 0x3c($sp)
/* 42664 80041A64 249568A8 */  addiu      $s5, $a0, %lo(gGlobals)
/* 42668 80041A68 AFBE0048 */  sw         $fp, 0x48($sp)
/* 4266C 80041A6C 0080F021 */  addu       $fp, $a0, $zero
/* 42670 80041A70 AFBF004C */  sw         $ra, 0x4c($sp)
/* 42674 80041A74 AFB70044 */  sw         $s7, 0x44($sp)
/* 42678 80041A78 AFB40038 */  sw         $s4, 0x38($sp)
/* 4267C 80041A7C AFB20030 */  sw         $s2, 0x30($sp)
/* 42680 80041A80 AFB1002C */  sw         $s1, 0x2c($sp)
/* 42684 80041A84 AFB00028 */  sw         $s0, 0x28($sp)
/* 42688 80041A88 A2630088 */  sb         $v1, 0x88($s3)
/* 4268C 80041A8C 306200FF */  andi       $v0, $v1, 0xff
/* 42690 80041A90 8EA315F8 */  lw         $v1, 0x15f8($s5)
/* 42694 80041A94 00021080 */  sll        $v0, $v0, 2
/* 42698 80041A98 00621821 */  addu       $v1, $v1, $v0
/* 4269C 80041A9C 8C740000 */  lw         $s4, ($v1)
/* 426A0 80041AA0 8E620080 */  lw         $v0, 0x80($s3)
/* 426A4 80041AA4 1040001A */  beqz       $v0, .L80041B10
/* 426A8 80041AA8 8E970018 */   lw        $s7, 0x18($s4)
/* 426AC 80041AAC 00402821 */  addu       $a1, $v0, $zero
/* 426B0 80041AB0 8E630078 */  lw         $v1, 0x78($s3)
/* 426B4 80041AB4 8C520040 */  lw         $s2, 0x40($v0)
/* 426B8 80041AB8 84640038 */  lh         $a0, 0x38($v1)
/* 426BC 80041ABC 9656001E */  lhu        $s6, 0x1e($s2)
/* 426C0 80041AC0 86510010 */  lh         $s1, 0x10($s2)
/* 426C4 80041AC4 8C62003C */  lw         $v0, 0x3c($v1)
/* 426C8 80041AC8 86500012 */  lh         $s0, 0x12($s2)
/* 426CC 80041ACC 0040F809 */  jalr       $v0
/* 426D0 80041AD0 02642021 */   addu      $a0, $s3, $a0
/* 426D4 80041AD4 26A41624 */  addiu      $a0, $s5, 0x1624
/* 426D8 80041AD8 26650080 */  addiu      $a1, $s3, 0x80
/* 426DC 80041ADC 24060006 */  addiu      $a2, $zero, 6
/* 426E0 80041AE0 0C035867 */  jal        AllocFreeQueueItem
/* 426E4 80041AE4 00003821 */   addu      $a3, $zero, $zero
/* 426E8 80041AE8 0C026259 */  jal        passToMalloc
/* 426EC 80041AEC 2404007C */   addiu     $a0, $zero, 0x7c
/* 426F0 80041AF0 00402021 */  addu       $a0, $v0, $zero
/* 426F4 80041AF4 0C00BE10 */  jal        widgetfastscrollmenu_func
/* 426F8 80041AF8 24050007 */   addiu     $a1, $zero, 7
/* 426FC 80041AFC 8C520040 */  lw         $s2, 0x40($v0)
/* 42700 80041B00 AE620080 */  sw         $v0, 0x80($s3)
/* 42704 80041B04 A6510010 */  sh         $s1, 0x10($s2)
/* 42708 80041B08 080106CB */  j          .L80041B2C
/* 4270C 80041B0C A6500012 */   sh        $s0, 0x12($s2)
.L80041B10:
/* 42710 80041B10 0C026259 */  jal        passToMalloc
/* 42714 80041B14 2404007C */   addiu     $a0, $zero, 0x7c
/* 42718 80041B18 00402021 */  addu       $a0, $v0, $zero
/* 4271C 80041B1C 0C00BE10 */  jal        widgetfastscrollmenu_func
/* 42720 80041B20 24050007 */   addiu     $a1, $zero, 7
/* 42724 80041B24 8C520040 */  lw         $s2, 0x40($v0)
/* 42728 80041B28 AE620080 */  sw         $v0, 0x80($s3)
.L80041B2C:
/* 4272C 80041B2C 24050044 */  addiu      $a1, $zero, 0x44
/* 42730 80041B30 2406002A */  addiu      $a2, $zero, 0x2a
/* 42734 80041B34 24070022 */  addiu      $a3, $zero, 0x22
/* 42738 80041B38 00008021 */  addu       $s0, $zero, $zero
/* 4273C 80041B3C 24110006 */  addiu      $s1, $zero, 6
/* 42740 80041B40 240800FF */  addiu      $t0, $zero, 0xff
/* 42744 80041B44 24020097 */  addiu      $v0, $zero, 0x97
/* 42748 80041B48 8E640080 */  lw         $a0, 0x80($s3)
/* 4274C 80041B4C 2403008D */  addiu      $v1, $zero, 0x8d
/* 42750 80041B50 AFA20014 */  sw         $v0, 0x14($sp)
/* 42754 80041B54 240200BF */  addiu      $v0, $zero, 0xbf
/* 42758 80041B58 AFA2001C */  sw         $v0, 0x1c($sp)
/* 4275C 80041B5C 24020014 */  addiu      $v0, $zero, 0x14
/* 42760 80041B60 AFA80010 */  sw         $t0, 0x10($sp)
/* 42764 80041B64 AFA30018 */  sw         $v1, 0x18($sp)
/* 42768 80041B68 AFA80020 */  sw         $t0, 0x20($sp)
/* 4276C 80041B6C 0C00C0A0 */  jal        func_80030280
/* 42770 80041B70 AFA20024 */   sw        $v0, 0x24($sp)
/* 42774 80041B74 8E630078 */  lw         $v1, 0x78($s3)
/* 42778 80041B78 8E650080 */  lw         $a1, 0x80($s3)
/* 4277C 80041B7C 84640030 */  lh         $a0, 0x30($v1)
/* 42780 80041B80 8C620034 */  lw         $v0, 0x34($v1)
/* 42784 80041B84 0040F809 */  jalr       $v0
/* 42788 80041B88 02642021 */   addu      $a0, $s3, $a0
.L80041B8C:
/* 4278C 80041B8C 5211000B */  beql       $s0, $s1, .L80041BBC
/* 42790 80041B90 26100001 */   addiu     $s0, $s0, 1
/* 42794 80041B94 0C026259 */  jal        passToMalloc
/* 42798 80041B98 24040094 */   addiu     $a0, $zero, 0x94
/* 4279C 80041B9C 00402021 */  addu       $a0, $v0, $zero
/* 427A0 80041BA0 02E02821 */  addu       $a1, $s7, $zero
/* 427A4 80041BA4 0C0104E4 */  jal        SMStatItem
/* 427A8 80041BA8 3206FFFF */   andi      $a2, $s0, 0xffff
/* 427AC 80041BAC 8E640080 */  lw         $a0, 0x80($s3)
/* 427B0 80041BB0 0C00C040 */  jal        func_80030100
/* 427B4 80041BB4 00402821 */   addu      $a1, $v0, $zero
/* 427B8 80041BB8 26100001 */  addiu      $s0, $s0, 1
.L80041BBC:
/* 427BC 80041BBC 2A020007 */  slti       $v0, $s0, 7
/* 427C0 80041BC0 1440FFF2 */  bnez       $v0, .L80041B8C
/* 427C4 80041BC4 00000000 */   nop
/* 427C8 80041BC8 96420020 */  lhu        $v0, 0x20($s2)
/* 427CC 80041BCC 10400036 */  beqz       $v0, .L80041CA8
/* 427D0 80041BD0 8FBF004C */   lw        $ra, 0x4c($sp)
/* 427D4 80041BD4 12C00005 */  beqz       $s6, .L80041BEC
/* 427D8 80041BD8 2442FFFF */   addiu     $v0, $v0, -1
/* 427DC 80041BDC 0056182A */  slt        $v1, $v0, $s6
/* 427E0 80041BE0 50600002 */  beql       $v1, $zero, .L80041BEC
/* 427E4 80041BE4 A656001E */   sh        $s6, 0x1e($s2)
/* 427E8 80041BE8 A642001E */  sh         $v0, 0x1e($s2)
.L80041BEC:
/* 427EC 80041BEC 0C02EEBC */  jal        func_800BBAF0
/* 427F0 80041BF0 8E640090 */   lw        $a0, 0x90($s3)
/* 427F4 80041BF4 00402021 */  addu       $a0, $v0, $zero
/* 427F8 80041BF8 3C02800E */  lui        $v0, %hi(D_800DCAC0)
/* 427FC 80041BFC 8E830014 */  lw         $v1, 0x14($s4)
/* 42800 80041C00 2451CAC0 */  addiu      $s1, $v0, %lo(D_800DCAC0)
/* 42804 80041C04 8C660008 */  lw         $a2, 8($v1)
/* 42808 80041C08 0C0333AC */  jal        sprintf
/* 4280C 80041C0C 02202821 */   addu      $a1, $s1, $zero
/* 42810 80041C10 0C02EEBC */  jal        func_800BBAF0
/* 42814 80041C14 8E640098 */   lw        $a0, 0x98($s3)
/* 42818 80041C18 8E830014 */  lw         $v1, 0x14($s4)
/* 4281C 80041C1C 00402021 */  addu       $a0, $v0, $zero
/* 42820 80041C20 8C660004 */  lw         $a2, 4($v1)
/* 42824 80041C24 0C0333AC */  jal        sprintf
/* 42828 80041C28 02202821 */   addu      $a1, $s1, $zero
/* 4282C 80041C2C 0C01EAFF */  jal        get_EXP_TNL
/* 42830 80041C30 02802021 */   addu      $a0, $s4, $zero
/* 42834 80041C34 00408021 */  addu       $s0, $v0, $zero
/* 42838 80041C38 2402FFFF */  addiu      $v0, $zero, -1
/* 4283C 80041C3C 1602000A */  bne        $s0, $v0, .L80041C68
/* 42840 80041C40 00000000 */   nop
/* 42844 80041C44 0C02EEBC */  jal        func_800BBAF0
/* 42848 80041C48 8E64009C */   lw        $a0, 0x9c($s3)
/* 4284C 80041C4C 27C368A8 */  addiu      $v1, $fp, 0x68a8
/* 42850 80041C50 8C64204C */  lw         $a0, 0x204c($v1)
/* 42854 80041C54 8C8507F4 */  lw         $a1, 0x7f4($a0)
/* 42858 80041C58 0C0333AC */  jal        sprintf
/* 4285C 80041C5C 00402021 */   addu      $a0, $v0, $zero
/* 42860 80041C60 08010723 */  j          .L80041C8C
/* 42864 80041C64 8E630078 */   lw        $v1, 0x78($s3)
.L80041C68:
/* 42868 80041C68 0C02EEBC */  jal        func_800BBAF0
/* 4286C 80041C6C 8E64009C */   lw        $a0, 0x9c($s3)
/* 42870 80041C70 8E830014 */  lw         $v1, 0x14($s4)
/* 42874 80041C74 00402021 */  addu       $a0, $v0, $zero
/* 42878 80041C78 8C660004 */  lw         $a2, 4($v1)
/* 4287C 80041C7C 02202821 */  addu       $a1, $s1, $zero
/* 42880 80041C80 0C0333AC */  jal        sprintf
/* 42884 80041C84 02063023 */   subu      $a2, $s0, $a2
/* 42888 80041C88 8E630078 */  lw         $v1, 0x78($s3)
.L80041C8C:
/* 4288C 80041C8C 84640028 */  lh         $a0, 0x28($v1)
/* 42890 80041C90 8C62002C */  lw         $v0, 0x2c($v1)
/* 42894 80041C94 0040F809 */  jalr       $v0
/* 42898 80041C98 02642021 */   addu      $a0, $s3, $a0
/* 4289C 80041C9C 0C00BFCC */  jal        func_8002FF30
/* 428A0 80041CA0 8E640080 */   lw        $a0, 0x80($s3)
/* 428A4 80041CA4 8FBF004C */  lw         $ra, 0x4c($sp)
.L80041CA8:
/* 428A8 80041CA8 8FBE0048 */  lw         $fp, 0x48($sp)
/* 428AC 80041CAC 8FB70044 */  lw         $s7, 0x44($sp)
/* 428B0 80041CB0 8FB60040 */  lw         $s6, 0x40($sp)
/* 428B4 80041CB4 8FB5003C */  lw         $s5, 0x3c($sp)
/* 428B8 80041CB8 8FB40038 */  lw         $s4, 0x38($sp)
/* 428BC 80041CBC 8FB30034 */  lw         $s3, 0x34($sp)
/* 428C0 80041CC0 8FB20030 */  lw         $s2, 0x30($sp)
/* 428C4 80041CC4 8FB1002C */  lw         $s1, 0x2c($sp)
/* 428C8 80041CC8 8FB00028 */  lw         $s0, 0x28($sp)
/* 428CC 80041CCC 03E00008 */  jr         $ra
/* 428D0 80041CD0 27BD0050 */   addiu     $sp, $sp, 0x50

glabel ret0_80041cd4
/* 428D4 80041CD4 03E00008 */  jr         $ra
/* 428D8 80041CD8 00001021 */   addu      $v0, $zero, $zero

glabel func_80041CDC
/* 428DC 80041CDC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 428E0 80041CE0 00063400 */  sll        $a2, $a2, 0x10
/* 428E4 80041CE4 00073C00 */  sll        $a3, $a3, 0x10
/* 428E8 80041CE8 00063403 */  sra        $a2, $a2, 0x10
/* 428EC 80041CEC 87A20032 */  lh         $v0, 0x32($sp)
/* 428F0 80041CF0 87A30036 */  lh         $v1, 0x36($sp)
/* 428F4 80041CF4 00073C03 */  sra        $a3, $a3, 0x10
/* 428F8 80041CF8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 428FC 80041CFC AFA20010 */  sw         $v0, 0x10($sp)
/* 42900 80041D00 0C02DE14 */  jal        widget_func_8
/* 42904 80041D04 AFA30014 */   sw        $v1, 0x14($sp)
/* 42908 80041D08 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4290C 80041D0C 03E00008 */  jr         $ra
/* 42910 80041D10 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80041D14
/* 42914 80041D14 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 42918 80041D18 AFB00018 */  sw         $s0, 0x18($sp)
/* 4291C 80041D1C AFBF001C */  sw         $ra, 0x1c($sp)
/* 42920 80041D20 0C00DFB2 */  jal        func_80037EC8
/* 42924 80041D24 00808021 */   addu      $s0, $a0, $zero
/* 42928 80041D28 8E090090 */  lw         $t1, 0x90($s0)
/* 4292C 80041D2C 9202005B */  lbu        $v0, 0x5b($s0)
/* 42930 80041D30 92050058 */  lbu        $a1, 0x58($s0)
/* 42934 80041D34 92060059 */  lbu        $a2, 0x59($s0)
/* 42938 80041D38 8D280078 */  lw         $t0, 0x78($t1)
/* 4293C 80041D3C 9207005A */  lbu        $a3, 0x5a($s0)
/* 42940 80041D40 85040048 */  lh         $a0, 0x48($t0)
/* 42944 80041D44 AFA20010 */  sw         $v0, 0x10($sp)
/* 42948 80041D48 8D03004C */  lw         $v1, 0x4c($t0)
/* 4294C 80041D4C 0060F809 */  jalr       $v1
/* 42950 80041D50 01242021 */   addu      $a0, $t1, $a0
/* 42954 80041D54 8E09008C */  lw         $t1, 0x8c($s0)
/* 42958 80041D58 9202005B */  lbu        $v0, 0x5b($s0)
/* 4295C 80041D5C 92050058 */  lbu        $a1, 0x58($s0)
/* 42960 80041D60 92060059 */  lbu        $a2, 0x59($s0)
/* 42964 80041D64 8D280078 */  lw         $t0, 0x78($t1)
/* 42968 80041D68 9207005A */  lbu        $a3, 0x5a($s0)
/* 4296C 80041D6C 85040048 */  lh         $a0, 0x48($t0)
/* 42970 80041D70 AFA20010 */  sw         $v0, 0x10($sp)
/* 42974 80041D74 8D03004C */  lw         $v1, 0x4c($t0)
/* 42978 80041D78 0060F809 */  jalr       $v1
/* 4297C 80041D7C 01242021 */   addu      $a0, $t1, $a0
/* 42980 80041D80 8E090098 */  lw         $t1, 0x98($s0)
/* 42984 80041D84 9202005B */  lbu        $v0, 0x5b($s0)
/* 42988 80041D88 92050058 */  lbu        $a1, 0x58($s0)
/* 4298C 80041D8C 92060059 */  lbu        $a2, 0x59($s0)
/* 42990 80041D90 8D280078 */  lw         $t0, 0x78($t1)
/* 42994 80041D94 9207005A */  lbu        $a3, 0x5a($s0)
/* 42998 80041D98 85040048 */  lh         $a0, 0x48($t0)
/* 4299C 80041D9C AFA20010 */  sw         $v0, 0x10($sp)
/* 429A0 80041DA0 8D03004C */  lw         $v1, 0x4c($t0)
/* 429A4 80041DA4 0060F809 */  jalr       $v1
/* 429A8 80041DA8 01242021 */   addu      $a0, $t1, $a0
/* 429AC 80041DAC 8E090094 */  lw         $t1, 0x94($s0)
/* 429B0 80041DB0 9202005B */  lbu        $v0, 0x5b($s0)
/* 429B4 80041DB4 92050058 */  lbu        $a1, 0x58($s0)
/* 429B8 80041DB8 92060059 */  lbu        $a2, 0x59($s0)
/* 429BC 80041DBC 8D280078 */  lw         $t0, 0x78($t1)
/* 429C0 80041DC0 9207005A */  lbu        $a3, 0x5a($s0)
/* 429C4 80041DC4 85040048 */  lh         $a0, 0x48($t0)
/* 429C8 80041DC8 AFA20010 */  sw         $v0, 0x10($sp)
/* 429CC 80041DCC 8D03004C */  lw         $v1, 0x4c($t0)
/* 429D0 80041DD0 0060F809 */  jalr       $v1
/* 429D4 80041DD4 01242021 */   addu      $a0, $t1, $a0
/* 429D8 80041DD8 8E09009C */  lw         $t1, 0x9c($s0)
/* 429DC 80041DDC 9202005B */  lbu        $v0, 0x5b($s0)
/* 429E0 80041DE0 92050058 */  lbu        $a1, 0x58($s0)
/* 429E4 80041DE4 92060059 */  lbu        $a2, 0x59($s0)
/* 429E8 80041DE8 8D280078 */  lw         $t0, 0x78($t1)
/* 429EC 80041DEC 9207005A */  lbu        $a3, 0x5a($s0)
/* 429F0 80041DF0 85040048 */  lh         $a0, 0x48($t0)
/* 429F4 80041DF4 AFA20010 */  sw         $v0, 0x10($sp)
/* 429F8 80041DF8 8D03004C */  lw         $v1, 0x4c($t0)
/* 429FC 80041DFC 0060F809 */  jalr       $v1
/* 42A00 80041E00 01242021 */   addu      $a0, $t1, $a0
/* 42A04 80041E04 8E0900A0 */  lw         $t1, 0xa0($s0)
/* 42A08 80041E08 9202005B */  lbu        $v0, 0x5b($s0)
/* 42A0C 80041E0C 92050058 */  lbu        $a1, 0x58($s0)
/* 42A10 80041E10 92060059 */  lbu        $a2, 0x59($s0)
/* 42A14 80041E14 8D280078 */  lw         $t0, 0x78($t1)
/* 42A18 80041E18 9207005A */  lbu        $a3, 0x5a($s0)
/* 42A1C 80041E1C 85040048 */  lh         $a0, 0x48($t0)
/* 42A20 80041E20 AFA20010 */  sw         $v0, 0x10($sp)
/* 42A24 80041E24 8D03004C */  lw         $v1, 0x4c($t0)
/* 42A28 80041E28 0060F809 */  jalr       $v1
/* 42A2C 80041E2C 01242021 */   addu      $a0, $t1, $a0
/* 42A30 80041E30 8E050080 */  lw         $a1, 0x80($s0)
/* 42A34 80041E34 8CA30078 */  lw         $v1, 0x78($a1)
/* 42A38 80041E38 84640020 */  lh         $a0, 0x20($v1)
/* 42A3C 80041E3C 8C620024 */  lw         $v0, 0x24($v1)
/* 42A40 80041E40 0040F809 */  jalr       $v0
/* 42A44 80041E44 00A42021 */   addu      $a0, $a1, $a0
/* 42A48 80041E48 8E04008C */  lw         $a0, 0x8c($s0)
/* 42A4C 80041E4C 86060062 */  lh         $a2, 0x62($s0)
/* 42A50 80041E50 86050060 */  lh         $a1, 0x60($s0)
/* 42A54 80041E54 00C23021 */  addu       $a2, $a2, $v0
/* 42A58 80041E58 0C02DD3F */  jal        set_widget_coords
/* 42A5C 80041E5C 24C60004 */   addiu     $a2, $a2, 4
/* 42A60 80041E60 8E05008C */  lw         $a1, 0x8c($s0)
/* 42A64 80041E64 8CA30078 */  lw         $v1, 0x78($a1)
/* 42A68 80041E68 84640018 */  lh         $a0, 0x18($v1)
/* 42A6C 80041E6C 8C62001C */  lw         $v0, 0x1c($v1)
/* 42A70 80041E70 0040F809 */  jalr       $v0
/* 42A74 80041E74 00A42021 */   addu      $a0, $a1, $a0
/* 42A78 80041E78 8E040090 */  lw         $a0, 0x90($s0)
/* 42A7C 80041E7C 86050060 */  lh         $a1, 0x60($s0)
/* 42A80 80041E80 8E03008C */  lw         $v1, 0x8c($s0)
/* 42A84 80041E84 00A22821 */  addu       $a1, $a1, $v0
/* 42A88 80041E88 84660062 */  lh         $a2, 0x62($v1)
/* 42A8C 80041E8C 0C02DD3F */  jal        set_widget_coords
/* 42A90 80041E90 24A50004 */   addiu     $a1, $a1, 4
/* 42A94 80041E94 8E050090 */  lw         $a1, 0x90($s0)
/* 42A98 80041E98 8CA30078 */  lw         $v1, 0x78($a1)
/* 42A9C 80041E9C 84640020 */  lh         $a0, 0x20($v1)
/* 42AA0 80041EA0 8C620024 */  lw         $v0, 0x24($v1)
/* 42AA4 80041EA4 0040F809 */  jalr       $v0
/* 42AA8 80041EA8 00A42021 */   addu      $a0, $a1, $a0
/* 42AAC 80041EAC 8E030090 */  lw         $v1, 0x90($s0)
/* 42AB0 80041EB0 8E040094 */  lw         $a0, 0x94($s0)
/* 42AB4 80041EB4 84660062 */  lh         $a2, 0x62($v1)
/* 42AB8 80041EB8 86050060 */  lh         $a1, 0x60($s0)
/* 42ABC 80041EBC 0C02DD3F */  jal        set_widget_coords
/* 42AC0 80041EC0 00C23021 */   addu      $a2, $a2, $v0
/* 42AC4 80041EC4 8E040098 */  lw         $a0, 0x98($s0)
/* 42AC8 80041EC8 8E020090 */  lw         $v0, 0x90($s0)
/* 42ACC 80041ECC 8E030094 */  lw         $v1, 0x94($s0)
/* 42AD0 80041ED0 84450060 */  lh         $a1, 0x60($v0)
/* 42AD4 80041ED4 0C02DD3F */  jal        set_widget_coords
/* 42AD8 80041ED8 84660062 */   lh        $a2, 0x62($v1)
/* 42ADC 80041EDC 8E050098 */  lw         $a1, 0x98($s0)
/* 42AE0 80041EE0 8CA30078 */  lw         $v1, 0x78($a1)
/* 42AE4 80041EE4 84640020 */  lh         $a0, 0x20($v1)
/* 42AE8 80041EE8 8C620024 */  lw         $v0, 0x24($v1)
/* 42AEC 80041EEC 0040F809 */  jalr       $v0
/* 42AF0 80041EF0 00A42021 */   addu      $a0, $a1, $a0
/* 42AF4 80041EF4 8E030098 */  lw         $v1, 0x98($s0)
/* 42AF8 80041EF8 8E0400A0 */  lw         $a0, 0xa0($s0)
/* 42AFC 80041EFC 84660062 */  lh         $a2, 0x62($v1)
/* 42B00 80041F00 86050060 */  lh         $a1, 0x60($s0)
/* 42B04 80041F04 0C02DD3F */  jal        set_widget_coords
/* 42B08 80041F08 00C23021 */   addu      $a2, $a2, $v0
/* 42B0C 80041F0C 8E04009C */  lw         $a0, 0x9c($s0)
/* 42B10 80041F10 8E020090 */  lw         $v0, 0x90($s0)
/* 42B14 80041F14 8E0300A0 */  lw         $v1, 0xa0($s0)
/* 42B18 80041F18 84450060 */  lh         $a1, 0x60($v0)
/* 42B1C 80041F1C 0C02DD3F */  jal        set_widget_coords
/* 42B20 80041F20 84660062 */   lh        $a2, 0x62($v1)
/* 42B24 80041F24 9602006A */  lhu        $v0, 0x6a($s0)
/* 42B28 80041F28 8E040090 */  lw         $a0, 0x90($s0)
/* 42B2C 80041F2C 96050064 */  lhu        $a1, 0x64($s0)
/* 42B30 80041F30 96060068 */  lhu        $a2, 0x68($s0)
/* 42B34 80041F34 96070066 */  lhu        $a3, 0x66($s0)
/* 42B38 80041F38 0C02F144 */  jal        widget_set_size
/* 42B3C 80041F3C AFA20010 */   sw        $v0, 0x10($sp)
/* 42B40 80041F40 9602006A */  lhu        $v0, 0x6a($s0)
/* 42B44 80041F44 8E04008C */  lw         $a0, 0x8c($s0)
/* 42B48 80041F48 96050064 */  lhu        $a1, 0x64($s0)
/* 42B4C 80041F4C 96060068 */  lhu        $a2, 0x68($s0)
/* 42B50 80041F50 96070066 */  lhu        $a3, 0x66($s0)
/* 42B54 80041F54 0C02F144 */  jal        widget_set_size
/* 42B58 80041F58 AFA20010 */   sw        $v0, 0x10($sp)
/* 42B5C 80041F5C 9602006A */  lhu        $v0, 0x6a($s0)
/* 42B60 80041F60 8E040098 */  lw         $a0, 0x98($s0)
/* 42B64 80041F64 96050064 */  lhu        $a1, 0x64($s0)
/* 42B68 80041F68 96060068 */  lhu        $a2, 0x68($s0)
/* 42B6C 80041F6C 96070066 */  lhu        $a3, 0x66($s0)
/* 42B70 80041F70 0C02F144 */  jal        widget_set_size
/* 42B74 80041F74 AFA20010 */   sw        $v0, 0x10($sp)
/* 42B78 80041F78 9602006A */  lhu        $v0, 0x6a($s0)
/* 42B7C 80041F7C 8E040094 */  lw         $a0, 0x94($s0)
/* 42B80 80041F80 96050064 */  lhu        $a1, 0x64($s0)
/* 42B84 80041F84 96060068 */  lhu        $a2, 0x68($s0)
/* 42B88 80041F88 96070066 */  lhu        $a3, 0x66($s0)
/* 42B8C 80041F8C 0C02F144 */  jal        widget_set_size
/* 42B90 80041F90 AFA20010 */   sw        $v0, 0x10($sp)
/* 42B94 80041F94 9602006A */  lhu        $v0, 0x6a($s0)
/* 42B98 80041F98 8E04009C */  lw         $a0, 0x9c($s0)
/* 42B9C 80041F9C 96050064 */  lhu        $a1, 0x64($s0)
/* 42BA0 80041FA0 96060068 */  lhu        $a2, 0x68($s0)
/* 42BA4 80041FA4 96070066 */  lhu        $a3, 0x66($s0)
/* 42BA8 80041FA8 0C02F144 */  jal        widget_set_size
/* 42BAC 80041FAC AFA20010 */   sw        $v0, 0x10($sp)
/* 42BB0 80041FB0 9602006A */  lhu        $v0, 0x6a($s0)
/* 42BB4 80041FB4 8E0400A0 */  lw         $a0, 0xa0($s0)
/* 42BB8 80041FB8 96050064 */  lhu        $a1, 0x64($s0)
/* 42BBC 80041FBC 96060068 */  lhu        $a2, 0x68($s0)
/* 42BC0 80041FC0 96070066 */  lhu        $a3, 0x66($s0)
/* 42BC4 80041FC4 0C02F144 */  jal        widget_set_size
/* 42BC8 80041FC8 AFA20010 */   sw        $v0, 0x10($sp)
/* 42BCC 80041FCC 0C02DE51 */  jal        func_800B7944
/* 42BD0 80041FD0 02002021 */   addu      $a0, $s0, $zero
/* 42BD4 80041FD4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 42BD8 80041FD8 8FB00018 */  lw         $s0, 0x18($sp)
/* 42BDC 80041FDC 03E00008 */  jr         $ra
/* 42BE0 80041FE0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80041FE4
/* 42BE4 80041FE4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 42BE8 80041FE8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 42BEC 80041FEC 8C850080 */  lw         $a1, 0x80($a0)
/* 42BF0 80041FF0 8CA30078 */  lw         $v1, 0x78($a1)
/* 42BF4 80041FF4 84640078 */  lh         $a0, 0x78($v1)
/* 42BF8 80041FF8 8C62007C */  lw         $v0, 0x7c($v1)
/* 42BFC 80041FFC 0040F809 */  jalr       $v0
/* 42C00 80042000 00A42021 */   addu      $a0, $a1, $a0
/* 42C04 80042004 8FBF0010 */  lw         $ra, 0x10($sp)
/* 42C08 80042008 03E00008 */  jr         $ra
/* 42C0C 8004200C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80042010
/* 42C10 80042010 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 42C14 80042014 AFB10014 */  sw         $s1, 0x14($sp)
/* 42C18 80042018 00808821 */  addu       $s1, $a0, $zero
/* 42C1C 8004201C AFBF001C */  sw         $ra, 0x1c($sp)
/* 42C20 80042020 AFB20018 */  sw         $s2, 0x18($sp)
/* 42C24 80042024 AFB00010 */  sw         $s0, 0x10($sp)
/* 42C28 80042028 8E250080 */  lw         $a1, 0x80($s1)
/* 42C2C 8004202C 8CA30078 */  lw         $v1, 0x78($a1)
/* 42C30 80042030 84640078 */  lh         $a0, 0x78($v1)
/* 42C34 80042034 8C62007C */  lw         $v0, 0x7c($v1)
/* 42C38 80042038 0040F809 */  jalr       $v0
/* 42C3C 8004203C 00A42021 */   addu      $a0, $a1, $a0
/* 42C40 80042040 00403021 */  addu       $a2, $v0, $zero
/* 42C44 80042044 10C00012 */  beqz       $a2, .L80042090
/* 42C48 80042048 24040080 */   addiu     $a0, $zero, 0x80
/* 42C4C 8004204C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 42C50 80042050 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 42C54 80042054 92220088 */  lbu        $v0, 0x88($s1)
/* 42C58 80042058 8E0315F8 */  lw         $v1, 0x15f8($s0)
/* 42C5C 8004205C 00021080 */  sll        $v0, $v0, 2
/* 42C60 80042060 00621821 */  addu       $v1, $v1, $v0
/* 42C64 80042064 8C650000 */  lw         $a1, ($v1)
/* 42C68 80042068 90D2005C */  lbu        $s2, 0x5c($a2)
/* 42C6C 8004206C 0C026259 */  jal        passToMalloc
/* 42C70 80042070 8CB10018 */   lw        $s1, 0x18($a1)
/* 42C74 80042074 00402021 */  addu       $a0, $v0, $zero
/* 42C78 80042078 02403021 */  addu       $a2, $s2, $zero
/* 42C7C 8004207C 0C00EABA */  jal        itemdetail_stats
/* 42C80 80042080 02202821 */   addu      $a1, $s1, $zero
/* 42C84 80042084 8E041604 */  lw         $a0, 0x1604($s0)
/* 42C88 80042088 0C02DC7C */  jal        widgetHandler
/* 42C8C 8004208C 00402821 */   addu      $a1, $v0, $zero
.L80042090:
/* 42C90 80042090 00001021 */  addu       $v0, $zero, $zero
/* 42C94 80042094 8FBF001C */  lw         $ra, 0x1c($sp)
/* 42C98 80042098 8FB20018 */  lw         $s2, 0x18($sp)
/* 42C9C 8004209C 8FB10014 */  lw         $s1, 0x14($sp)
/* 42CA0 800420A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 42CA4 800420A4 03E00008 */  jr         $ra
/* 42CA8 800420A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret0_800420AC
/* 42CAC 800420AC 03E00008 */  jr         $ra
/* 42CB0 800420B0 00001021 */   addu      $v0, $zero, $zero

glabel show_stat_train_price
/* 42CB4 800420B4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 42CB8 800420B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 42CBC 800420BC 00808021 */  addu       $s0, $a0, $zero
/* 42CC0 800420C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 42CC4 800420C4 AFB10014 */  sw         $s1, 0x14($sp)
/* 42CC8 800420C8 8E050080 */  lw         $a1, 0x80($s0)
/* 42CCC 800420CC 8CA30078 */  lw         $v1, 0x78($a1)
/* 42CD0 800420D0 84640078 */  lh         $a0, 0x78($v1)
/* 42CD4 800420D4 8C62007C */  lw         $v0, 0x7c($v1)
/* 42CD8 800420D8 0040F809 */  jalr       $v0
/* 42CDC 800420DC 00A42021 */   addu      $a0, $a1, $a0
/* 42CE0 800420E0 00402821 */  addu       $a1, $v0, $zero
/* 42CE4 800420E4 14A00003 */  bnez       $a1, .L800420F4
/* 42CE8 800420E8 3C04800E */   lui       $a0, %hi(partyPointer)
/* 42CEC 800420EC 0801084E */  j          .L80042138
/* 42CF0 800420F0 00001021 */   addu      $v0, $zero, $zero
.L800420F4:
/* 42CF4 800420F4 92020088 */  lbu        $v0, 0x88($s0)
/* 42CF8 800420F8 8C837EA0 */  lw         $v1, %lo(partyPointer)($a0)
/* 42CFC 800420FC 00021080 */  sll        $v0, $v0, 2
/* 42D00 80042100 00621821 */  addu       $v1, $v1, $v0
/* 42D04 80042104 8C640000 */  lw         $a0, ($v1)
/* 42D08 80042108 90B1005C */  lbu        $s1, 0x5c($a1)
/* 42D0C 8004210C 8C900018 */  lw         $s0, 0x18($a0)
/* 42D10 80042110 02202821 */  addu       $a1, $s1, $zero
/* 42D14 80042114 0C0212B9 */  jal        isStatCapped
/* 42D18 80042118 02002021 */   addu      $a0, $s0, $zero
/* 42D1C 8004211C 14400006 */  bnez       $v0, .L80042138
/* 42D20 80042120 2402FFFF */   addiu     $v0, $zero, -1
/* 42D24 80042124 02002021 */  addu       $a0, $s0, $zero
/* 42D28 80042128 0C02129A */  jal        get_stat_trainPrice
/* 42D2C 8004212C 02202821 */   addu      $a1, $s1, $zero
/* 42D30 80042130 0801084F */  j          .L8004213C
/* 42D34 80042134 8FBF0018 */   lw        $ra, 0x18($sp)
.L80042138:
/* 42D38 80042138 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004213C:
/* 42D3C 8004213C 8FB10014 */  lw         $s1, 0x14($sp)
/* 42D40 80042140 8FB00010 */  lw         $s0, 0x10($sp)
/* 42D44 80042144 03E00008 */  jr         $ra
/* 42D48 80042148 27BD0020 */   addiu     $sp, $sp, 0x20

glabel train_stat
/* 42D4C 8004214C 27BDFEC8 */  addiu      $sp, $sp, -0x138
/* 42D50 80042150 AFB5012C */  sw         $s5, 0x12c($sp)
/* 42D54 80042154 0080A821 */  addu       $s5, $a0, $zero
/* 42D58 80042158 3C02800E */  lui        $v0, %hi(gGlobals)
/* 42D5C 8004215C AFB40128 */  sw         $s4, 0x128($sp)
/* 42D60 80042160 245468A8 */  addiu      $s4, $v0, %lo(gGlobals)
/* 42D64 80042164 AFBF0130 */  sw         $ra, 0x130($sp)
/* 42D68 80042168 AFB30124 */  sw         $s3, 0x124($sp)
/* 42D6C 8004216C AFB20120 */  sw         $s2, 0x120($sp)
/* 42D70 80042170 AFB1011C */  sw         $s1, 0x11c($sp)
/* 42D74 80042174 AFB00118 */  sw         $s0, 0x118($sp)
/* 42D78 80042178 92A30088 */  lbu        $v1, 0x88($s5)
/* 42D7C 8004217C 8E8215F8 */  lw         $v0, 0x15f8($s4)
/* 42D80 80042180 00031880 */  sll        $v1, $v1, 2
/* 42D84 80042184 00431021 */  addu       $v0, $v0, $v1
/* 42D88 80042188 8C520000 */  lw         $s2, ($v0)
/* 42D8C 8004218C 30D100FF */  andi       $s1, $a2, 0xff
/* 42D90 80042190 8E500018 */  lw         $s0, 0x18($s2)
/* 42D94 80042194 02202821 */  addu       $a1, $s1, $zero
/* 42D98 80042198 0C0212C4 */  jal        get_base_stat_
/* 42D9C 8004219C 02002021 */   addu      $a0, $s0, $zero
/* 42DA0 800421A0 02002021 */  addu       $a0, $s0, $zero
/* 42DA4 800421A4 02202821 */  addu       $a1, $s1, $zero
/* 42DA8 800421A8 0C0212B9 */  jal        isStatCapped
/* 42DAC 800421AC 305300FF */   andi      $s3, $v0, 0xff
/* 42DB0 800421B0 10400017 */  beqz       $v0, .L80042210
/* 42DB4 800421B4 27A40018 */   addiu     $a0, $sp, 0x18
/* 42DB8 800421B8 24050096 */  addiu      $a1, $zero, 0x96
/* 42DBC 800421BC 00803021 */  addu       $a2, $a0, $zero
/* 42DC0 800421C0 240200E1 */  addiu      $v0, $zero, 0xe1
/* 42DC4 800421C4 240300FF */  addiu      $v1, $zero, 0xff
/* 42DC8 800421C8 A3A20018 */  sb         $v0, 0x18($sp)
/* 42DCC 800421CC A0820001 */  sb         $v0, 1($a0)
/* 42DD0 800421D0 A0820002 */  sb         $v0, 2($a0)
/* 42DD4 800421D4 24020032 */  addiu      $v0, $zero, 0x32
/* 42DD8 800421D8 A0830003 */  sb         $v1, 3($a0)
/* 42DDC 800421DC 24030096 */  addiu      $v1, $zero, 0x96
/* 42DE0 800421E0 A3A20058 */  sb         $v0, 0x58($sp)
/* 42DE4 800421E4 A3A20059 */  sb         $v0, 0x59($sp)
/* 42DE8 800421E8 A3A2005A */  sb         $v0, 0x5a($sp)
/* 42DEC 800421EC A3A3005B */  sb         $v1, 0x5b($sp)
/* 42DF0 800421F0 8E87204C */  lw         $a3, 0x204c($s4)
/* 42DF4 800421F4 24020001 */  addiu      $v0, $zero, 1
/* 42DF8 800421F8 AFA20010 */  sw         $v0, 0x10($sp)
/* 42DFC 800421FC 8CE407F8 */  lw         $a0, 0x7f8($a3)
/* 42E00 80042200 0C0131E1 */  jal        some_textbox_func
/* 42E04 80042204 27A70058 */   addiu     $a3, $sp, 0x58
/* 42E08 80042208 080108B6 */  j          .L800422D8
/* 42E0C 8004220C 8FBF0130 */   lw        $ra, 0x130($sp)
.L80042210:
/* 42E10 80042210 02002021 */  addu       $a0, $s0, $zero
/* 42E14 80042214 02202821 */  addu       $a1, $s1, $zero
/* 42E18 80042218 0C021226 */  jal        addBaseStat
/* 42E1C 8004221C 24060001 */   addiu     $a2, $zero, 1
/* 42E20 80042220 02002021 */  addu       $a0, $s0, $zero
/* 42E24 80042224 0C0212C4 */  jal        get_base_stat_
/* 42E28 80042228 02202821 */   addu      $a1, $s1, $zero
/* 42E2C 8004222C 14530017 */  bne        $v0, $s3, .L8004228C
/* 42E30 80042230 3C05800F */   lui       $a1, 0x800f
/* 42E34 80042234 24050096 */  addiu      $a1, $zero, 0x96
/* 42E38 80042238 27A60098 */  addiu      $a2, $sp, 0x98
/* 42E3C 8004223C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 42E40 80042240 240300FF */  addiu      $v1, $zero, 0xff
/* 42E44 80042244 A3A20098 */  sb         $v0, 0x98($sp)
/* 42E48 80042248 A3A20099 */  sb         $v0, 0x99($sp)
/* 42E4C 8004224C A3A2009A */  sb         $v0, 0x9a($sp)
/* 42E50 80042250 24020032 */  addiu      $v0, $zero, 0x32
/* 42E54 80042254 A3A3009B */  sb         $v1, 0x9b($sp)
/* 42E58 80042258 24030096 */  addiu      $v1, $zero, 0x96
/* 42E5C 8004225C A3A200D8 */  sb         $v0, 0xd8($sp)
/* 42E60 80042260 A3A200D9 */  sb         $v0, 0xd9($sp)
/* 42E64 80042264 A3A200DA */  sb         $v0, 0xda($sp)
/* 42E68 80042268 A3A300DB */  sb         $v1, 0xdb($sp)
/* 42E6C 8004226C 8E87204C */  lw         $a3, 0x204c($s4)
/* 42E70 80042270 24020001 */  addiu      $v0, $zero, 1
/* 42E74 80042274 AFA20010 */  sw         $v0, 0x10($sp)
/* 42E78 80042278 8CE407F8 */  lw         $a0, 0x7f8($a3)
/* 42E7C 8004227C 0C0131E1 */  jal        some_textbox_func
/* 42E80 80042280 27A700D8 */   addiu     $a3, $sp, 0xd8
/* 42E84 80042284 080108B6 */  j          .L800422D8
/* 42E88 80042288 8FBF0130 */   lw        $ra, 0x130($sp)
.L8004228C:
/* 42E8C 8004228C 8E460014 */  lw         $a2, 0x14($s2)
/* 42E90 80042290 8E8314CC */  lw         $v1, 0x14cc($s4)
/* 42E94 80042294 8CA4D5B0 */  lw         $a0, -0x2a50($a1)
/* 42E98 80042298 8C700040 */  lw         $s0, 0x40($v1)
/* 42E9C 8004229C 8CC20008 */  lw         $v0, 8($a2)
/* 42EA0 800422A0 8E030004 */  lw         $v1, 4($s0)
/* 42EA4 800422A4 00441023 */  subu       $v0, $v0, $a0
/* 42EA8 800422A8 ACC20008 */  sw         $v0, 8($a2)
/* 42EAC 800422AC 92A50088 */  lbu        $a1, 0x88($s5)
/* 42EB0 800422B0 0C00E2F7 */  jal        func_80038BDC
/* 42EB4 800422B4 8C640088 */   lw        $a0, 0x88($v1)
/* 42EB8 800422B8 8E020004 */  lw         $v0, 4($s0)
/* 42EBC 800422BC 0C00E388 */  jal        show_EXP_costs
/* 42EC0 800422C0 8C440088 */   lw        $a0, 0x88($v0)
/* 42EC4 800422C4 8E020004 */  lw         $v0, 4($s0)
/* 42EC8 800422C8 8C440080 */  lw         $a0, 0x80($v0)
/* 42ECC 800422CC 0C010DA7 */  jal        func_8004369C
/* 42ED0 800422D0 02402821 */   addu      $a1, $s2, $zero
/* 42ED4 800422D4 8FBF0130 */  lw         $ra, 0x130($sp)
.L800422D8:
/* 42ED8 800422D8 8FB5012C */  lw         $s5, 0x12c($sp)
/* 42EDC 800422DC 8FB40128 */  lw         $s4, 0x128($sp)
/* 42EE0 800422E0 8FB30124 */  lw         $s3, 0x124($sp)
/* 42EE4 800422E4 8FB20120 */  lw         $s2, 0x120($sp)
/* 42EE8 800422E8 8FB1011C */  lw         $s1, 0x11c($sp)
/* 42EEC 800422EC 8FB00118 */  lw         $s0, 0x118($sp)
/* 42EF0 800422F0 03E00008 */  jr         $ra
/* 42EF4 800422F4 27BD0138 */   addiu     $sp, $sp, 0x138

glabel confirm_stat_train
/* 42EF8 800422F8 27BDFE38 */  addiu      $sp, $sp, -0x1c8
/* 42EFC 800422FC AFB401B8 */  sw         $s4, 0x1b8($sp)
/* 42F00 80042300 0080A021 */  addu       $s4, $a0, $zero
/* 42F04 80042304 AFBF01C0 */  sw         $ra, 0x1c0($sp)
/* 42F08 80042308 AFB501BC */  sw         $s5, 0x1bc($sp)
/* 42F0C 8004230C AFB301B4 */  sw         $s3, 0x1b4($sp)
/* 42F10 80042310 AFB201B0 */  sw         $s2, 0x1b0($sp)
/* 42F14 80042314 AFB101AC */  sw         $s1, 0x1ac($sp)
/* 42F18 80042318 AFB001A8 */  sw         $s0, 0x1a8($sp)
/* 42F1C 8004231C 8E820080 */  lw         $v0, 0x80($s4)
/* 42F20 80042320 8C450078 */  lw         $a1, 0x78($v0)
/* 42F24 80042324 3C03800E */  lui        $v1, %hi(gGlobals)
/* 42F28 80042328 84A40078 */  lh         $a0, 0x78($a1)
/* 42F2C 8004232C 247368A8 */  addiu      $s3, $v1, %lo(gGlobals)
/* 42F30 80042330 00442021 */  addu       $a0, $v0, $a0
/* 42F34 80042334 92820088 */  lbu        $v0, 0x88($s4)
/* 42F38 80042338 8E6315F8 */  lw         $v1, 0x15f8($s3)
/* 42F3C 8004233C 00021080 */  sll        $v0, $v0, 2
/* 42F40 80042340 00621821 */  addu       $v1, $v1, $v0
/* 42F44 80042344 8CA2007C */  lw         $v0, 0x7c($a1)
/* 42F48 80042348 0040F809 */  jalr       $v0
/* 42F4C 8004234C 8C720000 */   lw        $s2, ($v1)
/* 42F50 80042350 10400084 */  beqz       $v0, .L80042564
/* 42F54 80042354 8FBF01C0 */   lw        $ra, 0x1c0($sp)
/* 42F58 80042358 8E510018 */  lw         $s1, 0x18($s2)
/* 42F5C 8004235C 9055005C */  lbu        $s5, 0x5c($v0)
/* 42F60 80042360 02202021 */  addu       $a0, $s1, $zero
/* 42F64 80042364 32B000FF */  andi       $s0, $s5, 0xff
/* 42F68 80042368 0C02129A */  jal        get_stat_trainPrice
/* 42F6C 8004236C 02002821 */   addu      $a1, $s0, $zero
/* 42F70 80042370 02202021 */  addu       $a0, $s1, $zero
/* 42F74 80042374 02002821 */  addu       $a1, $s0, $zero
/* 42F78 80042378 3C10800F */  lui        $s0, %hi(stat_EXP_price)
/* 42F7C 8004237C 0C0212B9 */  jal        isStatCapped
/* 42F80 80042380 AE02D5B0 */   sw        $v0, %lo(stat_EXP_price)($s0)
/* 42F84 80042384 10400017 */  beqz       $v0, .L800423E4
/* 42F88 80042388 24050096 */   addiu     $a1, $zero, 0x96
/* 42F8C 8004238C 27A40028 */  addiu      $a0, $sp, 0x28
/* 42F90 80042390 00803021 */  addu       $a2, $a0, $zero
/* 42F94 80042394 240200E1 */  addiu      $v0, $zero, 0xe1
/* 42F98 80042398 240300FF */  addiu      $v1, $zero, 0xff
/* 42F9C 8004239C A3A20028 */  sb         $v0, 0x28($sp)
/* 42FA0 800423A0 A0820001 */  sb         $v0, 1($a0)
/* 42FA4 800423A4 A0820002 */  sb         $v0, 2($a0)
/* 42FA8 800423A8 24020032 */  addiu      $v0, $zero, 0x32
/* 42FAC 800423AC A0830003 */  sb         $v1, 3($a0)
/* 42FB0 800423B0 24030096 */  addiu      $v1, $zero, 0x96
/* 42FB4 800423B4 A3A20068 */  sb         $v0, 0x68($sp)
/* 42FB8 800423B8 A3A20069 */  sb         $v0, 0x69($sp)
/* 42FBC 800423BC A3A2006A */  sb         $v0, 0x6a($sp)
/* 42FC0 800423C0 A3A3006B */  sb         $v1, 0x6b($sp)
/* 42FC4 800423C4 8E67204C */  lw         $a3, 0x204c($s3)
/* 42FC8 800423C8 24020001 */  addiu      $v0, $zero, 1
/* 42FCC 800423CC AFA20010 */  sw         $v0, 0x10($sp)
/* 42FD0 800423D0 8CE407F8 */  lw         $a0, 0x7f8($a3)
/* 42FD4 800423D4 0C0131E1 */  jal        some_textbox_func
/* 42FD8 800423D8 27A70068 */   addiu     $a3, $sp, 0x68
/* 42FDC 800423DC 08010959 */  j          .L80042564
/* 42FE0 800423E0 8FBF01C0 */   lw        $ra, 0x1c0($sp)
.L800423E4:
/* 42FE4 800423E4 8E430014 */  lw         $v1, 0x14($s2)
/* 42FE8 800423E8 8E07D5B0 */  lw         $a3, -0x2a50($s0)
/* 42FEC 800423EC 8C620008 */  lw         $v0, 8($v1)
/* 42FF0 800423F0 0047102B */  sltu       $v0, $v0, $a3
/* 42FF4 800423F4 1040001B */  beqz       $v0, .L80042464
/* 42FF8 800423F8 26702078 */   addiu     $s0, $s3, 0x2078
/* 42FFC 800423FC 8E62204C */  lw         $v0, 0x204c($s3)
/* 43000 80042400 02002021 */  addu       $a0, $s0, $zero
/* 43004 80042404 8C4507FC */  lw         $a1, 0x7fc($v0)
/* 43008 80042408 0C0333AC */  jal        sprintf
/* 4300C 8004240C 00E03021 */   addu      $a2, $a3, $zero
/* 43010 80042410 02002021 */  addu       $a0, $s0, $zero
/* 43014 80042414 24050096 */  addiu      $a1, $zero, 0x96
/* 43018 80042418 27A600A8 */  addiu      $a2, $sp, 0xa8
/* 4301C 8004241C 27A700E8 */  addiu      $a3, $sp, 0xe8
/* 43020 80042420 240200E1 */  addiu      $v0, $zero, 0xe1
/* 43024 80042424 240300FF */  addiu      $v1, $zero, 0xff
/* 43028 80042428 A3A200A8 */  sb         $v0, 0xa8($sp)
/* 4302C 8004242C A3A200A9 */  sb         $v0, 0xa9($sp)
/* 43030 80042430 A3A200AA */  sb         $v0, 0xaa($sp)
/* 43034 80042434 24020032 */  addiu      $v0, $zero, 0x32
/* 43038 80042438 A3A300AB */  sb         $v1, 0xab($sp)
/* 4303C 8004243C 24030096 */  addiu      $v1, $zero, 0x96
/* 43040 80042440 A3A200E8 */  sb         $v0, 0xe8($sp)
/* 43044 80042444 A3A200E9 */  sb         $v0, 0xe9($sp)
/* 43048 80042448 A3A200EA */  sb         $v0, 0xea($sp)
/* 4304C 8004244C 24020001 */  addiu      $v0, $zero, 1
/* 43050 80042450 A3A300EB */  sb         $v1, 0xeb($sp)
/* 43054 80042454 0C0131E1 */  jal        some_textbox_func
/* 43058 80042458 AFA20010 */   sw        $v0, 0x10($sp)
/* 4305C 8004245C 08010959 */  j          .L80042564
/* 43060 80042460 8FBF01C0 */   lw        $ra, 0x1c0($sp)
.L80042464:
/* 43064 80042464 02002021 */  addu       $a0, $s0, $zero
/* 43068 80042468 240500FF */  addiu      $a1, $zero, 0xff
/* 4306C 8004246C 240200C8 */  addiu      $v0, $zero, 0xc8
/* 43070 80042470 240300B4 */  addiu      $v1, $zero, 0xb4
/* 43074 80042474 A3A50128 */  sb         $a1, 0x128($sp)
/* 43078 80042478 A3A50129 */  sb         $a1, 0x129($sp)
/* 4307C 8004247C A3A5012A */  sb         $a1, 0x12a($sp)
/* 43080 80042480 A3A5012B */  sb         $a1, 0x12b($sp)
/* 43084 80042484 A3A20168 */  sb         $v0, 0x168($sp)
/* 43088 80042488 A3A30169 */  sb         $v1, 0x169($sp)
/* 4308C 8004248C 8E66204C */  lw         $a2, 0x204c($s3)
/* 43090 80042490 24020064 */  addiu      $v0, $zero, 0x64
/* 43094 80042494 A3A2016A */  sb         $v0, 0x16a($sp)
/* 43098 80042498 A3A5016B */  sb         $a1, 0x16b($sp)
/* 4309C 8004249C 8CC50800 */  lw         $a1, 0x800($a2)
/* 430A0 800424A0 0C0333AC */  jal        sprintf
/* 430A4 800424A4 00E03021 */   addu      $a2, $a3, $zero
/* 430A8 800424A8 0C026259 */  jal        passToMalloc
/* 430AC 800424AC 240400B0 */   addiu     $a0, $zero, 0xb0
/* 430B0 800424B0 00402021 */  addu       $a0, $v0, $zero
/* 430B4 800424B4 24050002 */  addiu      $a1, $zero, 2
/* 430B8 800424B8 02003021 */  addu       $a2, $s0, $zero
/* 430BC 800424BC 24070096 */  addiu      $a3, $zero, 0x96
/* 430C0 800424C0 27A20128 */  addiu      $v0, $sp, 0x128
/* 430C4 800424C4 27A30168 */  addiu      $v1, $sp, 0x168
/* 430C8 800424C8 AFA20010 */  sw         $v0, 0x10($sp)
/* 430CC 800424CC AFA30014 */  sw         $v1, 0x14($sp)
/* 430D0 800424D0 AFA00018 */  sw         $zero, 0x18($sp)
/* 430D4 800424D4 AFA0001C */  sw         $zero, 0x1c($sp)
/* 430D8 800424D8 0C013461 */  jal        func_8004D184
/* 430DC 800424DC AFA00020 */   sw        $zero, 0x20($sp)
/* 430E0 800424E0 2404007C */  addiu      $a0, $zero, 0x7c
/* 430E4 800424E4 0C026259 */  jal        passToMalloc
/* 430E8 800424E8 00408021 */   addu      $s0, $v0, $zero
/* 430EC 800424EC 8E63204C */  lw         $v1, 0x204c($s3)
/* 430F0 800424F0 00402021 */  addu       $a0, $v0, $zero
/* 430F4 800424F4 8C65007C */  lw         $a1, 0x7c($v1)
/* 430F8 800424F8 0C02DFC8 */  jal        widgetcliptext_init
/* 430FC 800424FC 24060190 */   addiu     $a2, $zero, 0x190
/* 43100 80042500 02002021 */  addu       $a0, $s0, $zero
/* 43104 80042504 3C038004 */  lui        $v1, %hi(func_8003F4A0)
/* 43108 80042508 2463F4A0 */  addiu      $v1, $v1, %lo(func_8003F4A0)
/* 4310C 8004250C AC430018 */  sw         $v1, 0x18($v0)
/* 43110 80042510 A055005C */  sb         $s5, 0x5c($v0)
/* 43114 80042514 92830088 */  lbu        $v1, 0x88($s4)
/* 43118 80042518 00402821 */  addu       $a1, $v0, $zero
/* 4311C 8004251C 0C013626 */  jal        func_8004D898
/* 43120 80042520 A443005E */   sh        $v1, 0x5e($v0)
/* 43124 80042524 0C026259 */  jal        passToMalloc
/* 43128 80042528 2404007C */   addiu     $a0, $zero, 0x7c
/* 4312C 8004252C 8E63204C */  lw         $v1, 0x204c($s3)
/* 43130 80042530 00402021 */  addu       $a0, $v0, $zero
/* 43134 80042534 8C650080 */  lw         $a1, 0x80($v1)
/* 43138 80042538 0C02DFC8 */  jal        widgetcliptext_init
/* 4313C 8004253C 24060190 */   addiu     $a2, $zero, 0x190
/* 43140 80042540 02002021 */  addu       $a0, $s0, $zero
/* 43144 80042544 0C013626 */  jal        func_8004D898
/* 43148 80042548 00402821 */   addu      $a1, $v0, $zero
/* 4314C 8004254C 0C013786 */  jal        func_8004DE18
/* 43150 80042550 02002021 */   addu      $a0, $s0, $zero
/* 43154 80042554 8E641604 */  lw         $a0, 0x1604($s3)
/* 43158 80042558 0C02DC7C */  jal        widgetHandler
/* 4315C 8004255C 02002821 */   addu      $a1, $s0, $zero
/* 43160 80042560 8FBF01C0 */  lw         $ra, 0x1c0($sp)
.L80042564:
/* 43164 80042564 8FB501BC */  lw         $s5, 0x1bc($sp)
/* 43168 80042568 8FB401B8 */  lw         $s4, 0x1b8($sp)
/* 4316C 8004256C 8FB301B4 */  lw         $s3, 0x1b4($sp)
/* 43170 80042570 8FB201B0 */  lw         $s2, 0x1b0($sp)
/* 43174 80042574 8FB101AC */  lw         $s1, 0x1ac($sp)
/* 43178 80042578 8FB001A8 */  lw         $s0, 0x1a8($sp)
/* 4317C 8004257C 03E00008 */  jr         $ra
/* 43180 80042580 27BD01C8 */   addiu     $sp, $sp, 0x1c8

glabel ret12_80042584
/* 43184 80042584 03E00008 */  jr         $ra
/* 43188 80042588 2402000C */   addiu     $v0, $zero, 0xc
/* 4318C 8004258C 00000000 */  nop
