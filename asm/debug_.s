.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_big_debug_menu
/* 3490 80002890 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3494 80002894 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3498 80002898 0C026259 */  jal        passToMalloc
/* 349C 8000289C 24040080 */   addiu     $a0, $zero, 0x80
/* 34A0 800028A0 0C000A4A */  jal        build_debug_menu
/* 34A4 800028A4 00402021 */   addu      $a0, $v0, $zero
/* 34A8 800028A8 3C03800E */  lui        $v1, %hi(WidgetDebugBigPointer)
/* 34AC 800028AC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 34B0 800028B0 3C04800E */  lui        $a0, %hi(zone_engine_dat)
/* 34B4 800028B4 AC6260B4 */  sw         $v0, %lo(WidgetDebugBigPointer)($v1)
/* 34B8 800028B8 24020001 */  addiu      $v0, $zero, 1
/* 34BC 800028BC AC8260B0 */  sw         $v0, %lo(zone_engine_dat)($a0)
/* 34C0 800028C0 03E00008 */  jr         $ra
/* 34C4 800028C4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel exec_big_debug_command
/* 34C8 800028C8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 34CC 800028CC 00802821 */  addu       $a1, $a0, $zero
/* 34D0 800028D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 34D4 800028D4 3C10800E */  lui        $s0, %hi(WidgetDebugBigPointer)
/* 34D8 800028D8 3C02800E */  lui        $v0, %hi(zone_engine_dat)
/* 34DC 800028DC 8E0460B4 */  lw         $a0, %lo(WidgetDebugBigPointer)($s0)
/* 34E0 800028E0 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 34E4 800028E4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 34E8 800028E8 AC4060B0 */  sw         $zero, %lo(zone_engine_dat)($v0)
/* 34EC 800028EC 0C000AE4 */  jal        big_debug_func_array
/* 34F0 800028F0 AC60D500 */   sw        $zero, %lo(freeWidgetFunc)($v1)
/* 34F4 800028F4 8E0660B4 */  lw         $a2, 0x60b4($s0)
/* 34F8 800028F8 10C00006 */  beqz       $a2, .L80002914
/* 34FC 800028FC 24050003 */   addiu     $a1, $zero, 3
/* 3500 80002900 8CC20078 */  lw         $v0, 0x78($a2)
/* 3504 80002904 84440008 */  lh         $a0, 8($v0)
/* 3508 80002908 8C43000C */  lw         $v1, 0xc($v0)
/* 350C 8000290C 0060F809 */  jalr       $v1
/* 3510 80002910 00C42021 */   addu      $a0, $a2, $a0
.L80002914:
/* 3514 80002914 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3518 80002918 AE0060B4 */  sw         $zero, 0x60b4($s0)
/* 351C 8000291C 8FB00010 */  lw         $s0, 0x10($sp)
/* 3520 80002920 03E00008 */  jr         $ra
/* 3524 80002924 27BD0018 */   addiu     $sp, $sp, 0x18

glabel build_debug_menu
/* 3528 80002928 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 352C 8000292C AFB1003C */  sw         $s1, 0x3c($sp)
/* 3530 80002930 00808821 */  addu       $s1, $a0, $zero
/* 3534 80002934 AFBF0040 */  sw         $ra, 0x40($sp)
/* 3538 80002938 0C02E658 */  jal        widget_menu_build
/* 353C 8000293C AFB00038 */   sw        $s0, 0x38($sp)
/* 3540 80002940 02202021 */  addu       $a0, $s1, $zero
/* 3544 80002944 24050028 */  addiu      $a1, $zero, 0x28
/* 3548 80002948 2406000A */  addiu      $a2, $zero, 0xa
/* 354C 8000294C 240700FA */  addiu      $a3, $zero, 0xfa
/* 3550 80002950 3C02800D */  lui        $v0, %hi(widget_methods_bigDebug)
/* 3554 80002954 24426F80 */  addiu      $v0, $v0, %lo(widget_methods_bigDebug)
/* 3558 80002958 240300C8 */  addiu      $v1, $zero, 0xc8
/* 355C 8000295C 241000FF */  addiu      $s0, $zero, 0xff
/* 3560 80002960 AE220078 */  sw         $v0, 0x78($s1)
/* 3564 80002964 AFA30010 */  sw         $v1, 0x10($sp)
/* 3568 80002968 AFA00014 */  sw         $zero, 0x14($sp)
/* 356C 8000296C AFA00018 */  sw         $zero, 0x18($sp)
/* 3570 80002970 AFA0001C */  sw         $zero, 0x1c($sp)
/* 3574 80002974 0C02F27C */  jal        func_800BC9F0
/* 3578 80002978 AFB00020 */   sw        $s0, 0x20($sp)
/* 357C 8000297C 00402021 */  addu       $a0, $v0, $zero
/* 3580 80002980 24050015 */  addiu      $a1, $zero, 0x15
/* 3584 80002984 24060032 */  addiu      $a2, $zero, 0x32
/* 3588 80002988 24070014 */  addiu      $a3, $zero, 0x14
/* 358C 8000298C 24020032 */  addiu      $v0, $zero, 0x32
/* 3590 80002990 24030014 */  addiu      $v1, $zero, 0x14
/* 3594 80002994 AFA20010 */  sw         $v0, 0x10($sp)
/* 3598 80002998 2402012C */  addiu      $v0, $zero, 0x12c
/* 359C 8000299C AFA30014 */  sw         $v1, 0x14($sp)
/* 35A0 800029A0 240300DC */  addiu      $v1, $zero, 0xdc
/* 35A4 800029A4 AFA20018 */  sw         $v0, 0x18($sp)
/* 35A8 800029A8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 35AC 800029AC AFA3001C */  sw         $v1, 0x1c($sp)
/* 35B0 800029B0 AFA20020 */  sw         $v0, 0x20($sp)
/* 35B4 800029B4 AFA20024 */  sw         $v0, 0x24($sp)
/* 35B8 800029B8 AFA20028 */  sw         $v0, 0x28($sp)
/* 35BC 800029BC AFB0002C */  sw         $s0, 0x2c($sp)
/* 35C0 800029C0 0C02F435 */  jal        widgetscrollmenu_init_2
/* 35C4 800029C4 AFA00030 */   sw        $zero, 0x30($sp)
/* 35C8 800029C8 00008021 */  addu       $s0, $zero, $zero
/* 35CC 800029CC AE22007C */  sw         $v0, 0x7c($s1)
/* 35D0 800029D0 02202021 */  addu       $a0, $s1, $zero
.L800029D4:
/* 35D4 800029D4 0C000AC1 */  jal        make_debug_menu_entry
/* 35D8 800029D8 02002821 */   addu      $a1, $s0, $zero
/* 35DC 800029DC 26020001 */  addiu      $v0, $s0, 1
/* 35E0 800029E0 3050FFFF */  andi       $s0, $v0, 0xffff
/* 35E4 800029E4 2E030015 */  sltiu      $v1, $s0, 0x15
/* 35E8 800029E8 1460FFFA */  bnez       $v1, .L800029D4
/* 35EC 800029EC 02202021 */   addu      $a0, $s1, $zero
/* 35F0 800029F0 02202821 */  addu       $a1, $s1, $zero
/* 35F4 800029F4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 35F8 800029F8 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 35FC 800029FC 3C038000 */  lui        $v1, %hi(exec_big_debug_command)
/* 3600 80002A00 246328C8 */  addiu      $v1, $v1, %lo(exec_big_debug_command)
/* 3604 80002A04 8C441604 */  lw         $a0, 0x1604($v0)
/* 3608 80002A08 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 360C 80002A0C 0C02DC7C */  jal        widgetHandler
/* 3610 80002A10 AC43D500 */   sw        $v1, %lo(freeWidgetFunc)($v0)
/* 3614 80002A14 02201021 */  addu       $v0, $s1, $zero
/* 3618 80002A18 8FBF0040 */  lw         $ra, 0x40($sp)
/* 361C 80002A1C 8FB1003C */  lw         $s1, 0x3c($sp)
/* 3620 80002A20 8FB00038 */  lw         $s0, 0x38($sp)
/* 3624 80002A24 03E00008 */  jr         $ra
/* 3628 80002A28 27BD0048 */   addiu     $sp, $sp, 0x48

glabel WidgetDebugBig_free
/* 362C 80002A2C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 3630 80002A30 AFB00010 */  sw         $s0, 0x10($sp)
/* 3634 80002A34 00808021 */  addu       $s0, $a0, $zero
/* 3638 80002A38 AFB10014 */  sw         $s1, 0x14($sp)
/* 363C 80002A3C 00A08821 */  addu       $s1, $a1, $zero
/* 3640 80002A40 02002821 */  addu       $a1, $s0, $zero
/* 3644 80002A44 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 3648 80002A48 3C02800D */  lui        $v0, %hi(widget_methods_bigDebug)
/* 364C 80002A4C 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 3650 80002A50 24426F80 */  addiu      $v0, $v0, %lo(widget_methods_bigDebug)
/* 3654 80002A54 AFBF0018 */  sw         $ra, 0x18($sp)
/* 3658 80002A58 0C02DCB3 */  jal        func_800B72CC
/* 365C 80002A5C AE020078 */   sw        $v0, 0x78($s0)
/* 3660 80002A60 02002021 */  addu       $a0, $s0, $zero
/* 3664 80002A64 0C02E66C */  jal        widget_menu_free
/* 3668 80002A68 02202821 */   addu      $a1, $s1, $zero
/* 366C 80002A6C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 3670 80002A70 8FB10014 */  lw         $s1, 0x14($sp)
/* 3674 80002A74 8FB00010 */  lw         $s0, 0x10($sp)
/* 3678 80002A78 03E00008 */  jr         $ra
/* 367C 80002A7C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widgetDebugBig_AFunc
/* 3680 80002A80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3684 80002A84 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3688 80002A88 0C02F031 */  jal        func_800BC0C4
/* 368C 80002A8C 8C84007C */   lw        $a0, 0x7c($a0)
/* 3690 80002A90 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3694 80002A94 03E00008 */  jr         $ra
/* 3698 80002A98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widgetDebugBig_BFunc
/* 369C 80002A9C 03E00008 */  jr         $ra
/* 36A0 80002AA0 00801021 */   addu      $v0, $a0, $zero

glabel func_80002AA4
/* 36A4 80002AA4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 36A8 80002AA8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 36AC 80002AAC 8C85007C */  lw         $a1, 0x7c($a0)
/* 36B0 80002AB0 8CA30078 */  lw         $v1, 0x78($a1)
/* 36B4 80002AB4 84640058 */  lh         $a0, 0x58($v1)
/* 36B8 80002AB8 8C62005C */  lw         $v0, 0x5c($v1)
/* 36BC 80002ABC 0040F809 */  jalr       $v0
/* 36C0 80002AC0 00A42021 */   addu      $a0, $a1, $a0
/* 36C4 80002AC4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 36C8 80002AC8 00001021 */  addu       $v0, $zero, $zero
/* 36CC 80002ACC 03E00008 */  jr         $ra
/* 36D0 80002AD0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80002AD4
/* 36D4 80002AD4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 36D8 80002AD8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 36DC 80002ADC 8C85007C */  lw         $a1, 0x7c($a0)
/* 36E0 80002AE0 8CA30078 */  lw         $v1, 0x78($a1)
/* 36E4 80002AE4 84640060 */  lh         $a0, 0x60($v1)
/* 36E8 80002AE8 8C620064 */  lw         $v0, 0x64($v1)
/* 36EC 80002AEC 0040F809 */  jalr       $v0
/* 36F0 80002AF0 00A42021 */   addu      $a0, $a1, $a0
/* 36F4 80002AF4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 36F8 80002AF8 00001021 */  addu       $v0, $zero, $zero
/* 36FC 80002AFC 03E00008 */  jr         $ra
/* 3700 80002B00 27BD0018 */   addiu     $sp, $sp, 0x18

glabel make_debug_menu_entry
/* 3704 80002B04 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 3708 80002B08 AFB3001C */  sw         $s3, 0x1c($sp)
/* 370C 80002B0C 00809821 */  addu       $s3, $a0, $zero
/* 3710 80002B10 2404007C */  addiu      $a0, $zero, 0x7c
/* 3714 80002B14 AFB20018 */  sw         $s2, 0x18($sp)
/* 3718 80002B18 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 371C 80002B1C 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 3720 80002B20 8C6588F4 */  lw         $a1, %lo(commonstringsmirror)($v1)
/* 3724 80002B24 00121080 */  sll        $v0, $s2, 2
/* 3728 80002B28 AFBF0020 */  sw         $ra, 0x20($sp)
/* 372C 80002B2C AFB10014 */  sw         $s1, 0x14($sp)
/* 3730 80002B30 AFB00010 */  sw         $s0, 0x10($sp)
/* 3734 80002B34 00451021 */  addu       $v0, $v0, $a1
/* 3738 80002B38 0C026259 */  jal        passToMalloc
/* 373C 80002B3C 8C51033C */   lw        $s1, 0x33c($v0)
/* 3740 80002B40 00408021 */  addu       $s0, $v0, $zero
/* 3744 80002B44 0C03353E */  jal        strlen
/* 3748 80002B48 02202021 */   addu      $a0, $s1, $zero
/* 374C 80002B4C 02002021 */  addu       $a0, $s0, $zero
/* 3750 80002B50 02202821 */  addu       $a1, $s1, $zero
/* 3754 80002B54 24420001 */  addiu      $v0, $v0, 1
/* 3758 80002B58 0C02E3A0 */  jal        widgettext_func_2
/* 375C 80002B5C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3760 80002B60 00408021 */  addu       $s0, $v0, $zero
/* 3764 80002B64 8E64007C */  lw         $a0, 0x7c($s3)
/* 3768 80002B68 0C02E885 */  jal        link_widget_text
/* 376C 80002B6C 02002821 */   addu      $a1, $s0, $zero
/* 3770 80002B70 8FBF0020 */  lw         $ra, 0x20($sp)
/* 3774 80002B74 8FB3001C */  lw         $s3, 0x1c($sp)
/* 3778 80002B78 A612005E */  sh         $s2, 0x5e($s0)
/* 377C 80002B7C 8FB20018 */  lw         $s2, 0x18($sp)
/* 3780 80002B80 8FB10014 */  lw         $s1, 0x14($sp)
/* 3784 80002B84 8FB00010 */  lw         $s0, 0x10($sp)
/* 3788 80002B88 03E00008 */  jr         $ra
/* 378C 80002B8C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel big_debug_func_array
/* 3790 80002B90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3794 80002B94 10A4000B */  beq        $a1, $a0, .L80002BC4
/* 3798 80002B98 AFBF0010 */   sw        $ra, 0x10($sp)
/* 379C 80002B9C 3C03800E */  lui        $v1, %hi(debug_menu_funcs)
/* 37A0 80002BA0 94A2005E */  lhu        $v0, 0x5e($a1)
/* 37A4 80002BA4 246360B8 */  addiu      $v1, $v1, %lo(debug_menu_funcs)
/* 37A8 80002BA8 00021080 */  sll        $v0, $v0, 2
/* 37AC 80002BAC 00431021 */  addu       $v0, $v0, $v1
/* 37B0 80002BB0 8C420000 */  lw         $v0, ($v0)
/* 37B4 80002BB4 10400004 */  beqz       $v0, .L80002BC8
/* 37B8 80002BB8 8FBF0010 */   lw        $ra, 0x10($sp)
/* 37BC 80002BBC 0040F809 */  jalr       $v0
/* 37C0 80002BC0 00000000 */   nop
.L80002BC4:
/* 37C4 80002BC4 8FBF0010 */  lw         $ra, 0x10($sp)
.L80002BC8:
/* 37C8 80002BC8 03E00008 */  jr         $ra
/* 37CC 80002BCC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_gamestatefunnel
/* 37D0 80002BD0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 37D4 80002BD4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 37D8 80002BD8 0C001470 */  jal        debug_gamestatefunnel_sub
/* 37DC 80002BDC 00000000 */   nop
/* 37E0 80002BE0 10400003 */  beqz       $v0, .L80002BF0
/* 37E4 80002BE4 3C03800E */   lui       $v1, %hi(camping_var)
/* 37E8 80002BE8 24020009 */  addiu      $v0, $zero, 9
/* 37EC 80002BEC A0626984 */  sb         $v0, %lo(camping_var)($v1)
.L80002BF0:
/* 37F0 80002BF0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 37F4 80002BF4 03E00008 */  jr         $ra
/* 37F8 80002BF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_clear_inventory
/* 37FC 80002BFC 3C02800E */  lui        $v0, %hi(partyPointer)
/* 3800 80002C00 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 3804 80002C04 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3808 80002C08 AFBF0010 */  sw         $ra, 0x10($sp)
/* 380C 80002C0C 0C01F980 */  jal        clear_inventory_8007e600
/* 3810 80002C10 00000000 */   nop
/* 3814 80002C14 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3818 80002C18 03E00008 */  jr         $ra
/* 381C 80002C1C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel toggle_enemies_hostile
/* 3820 80002C20 3C03800F */  lui        $v1, %hi(enemyHostileFlag)
/* 3824 80002C24 94628E10 */  lhu        $v0, %lo(enemyHostileFlag)($v1)
/* 3828 80002C28 38420001 */  xori       $v0, $v0, 1
/* 382C 80002C2C 03E00008 */  jr         $ra
/* 3830 80002C30 A4628E10 */   sh        $v0, -0x71f0($v1)

glabel toggle_only_tp_active
/* 3834 80002C34 3C03800F */  lui        $v1, %hi(only_TP_active)
/* 3838 80002C38 8C628F08 */  lw         $v0, %lo(only_TP_active)($v1)
/* 383C 80002C3C 38420001 */  xori       $v0, $v0, 1
/* 3840 80002C40 03E00008 */  jr         $ra
/* 3844 80002C44 AC628F08 */   sw        $v0, -0x70f8($v1)

glabel bad_ref_obj_hunt
/* 3848 80002C48 3C03800F */  lui        $v1, %hi(voxel_index)
/* 384C 80002C4C 94628DB2 */  lhu        $v0, %lo(voxel_index)($v1)
/* 3850 80002C50 2C420001 */  sltiu      $v0, $v0, 1
/* 3854 80002C54 03E00008 */  jr         $ra
/* 3858 80002C58 A4628DB2 */   sh        $v0, -0x724e($v1)

glabel load_credits_instead
/* 385C 80002C5C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3860 80002C60 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3864 80002C64 0C026259 */  jal        passToMalloc
/* 3868 80002C68 240400A0 */   addiu     $a0, $zero, 0xa0
/* 386C 80002C6C 0C00CD94 */  jal        credits
/* 3870 80002C70 00402021 */   addu      $a0, $v0, $zero
/* 3874 80002C74 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 3878 80002C78 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 387C 80002C7C 0C02DC7C */  jal        widgetHandler
/* 3880 80002C80 00402821 */   addu      $a1, $v0, $zero
/* 3884 80002C84 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3888 80002C88 03E00008 */  jr         $ra
/* 388C 80002C8C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_accessDB
/* 3890 80002C90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3894 80002C94 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3898 80002C98 0C026259 */  jal        passToMalloc
/* 389C 80002C9C 24040084 */   addiu     $a0, $zero, 0x84
/* 38A0 80002CA0 0C000B6B */  jal        access_database
/* 38A4 80002CA4 00402021 */   addu      $a0, $v0, $zero
/* 38A8 80002CA8 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 38AC 80002CAC 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 38B0 80002CB0 0C02DC7C */  jal        widgetHandler
/* 38B4 80002CB4 00402821 */   addu      $a1, $v0, $zero
/* 38B8 80002CB8 3C04800F */  lui        $a0, %hi(freeWidgetFunc)
/* 38BC 80002CBC 3C028000 */  lui        $v0, %hi(func_80002CE0)
/* 38C0 80002CC0 24422CE0 */  addiu      $v0, $v0, %lo(func_80002CE0)
/* 38C4 80002CC4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 38C8 80002CC8 3C03800E */  lui        $v1, %hi(zone_engine_dat)
/* 38CC 80002CCC AC82D500 */  sw         $v0, %lo(freeWidgetFunc)($a0)
/* 38D0 80002CD0 24020001 */  addiu      $v0, $zero, 1
/* 38D4 80002CD4 AC6260B0 */  sw         $v0, %lo(zone_engine_dat)($v1)
/* 38D8 80002CD8 03E00008 */  jr         $ra
/* 38DC 80002CDC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80002CE0
/* 38E0 80002CE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 38E4 80002CE4 AFB00010 */  sw         $s0, 0x10($sp)
/* 38E8 80002CE8 00808021 */  addu       $s0, $a0, $zero
/* 38EC 80002CEC 02002821 */  addu       $a1, $s0, $zero
/* 38F0 80002CF0 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 38F4 80002CF4 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 38F8 80002CF8 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 38FC 80002CFC 3C02800E */  lui        $v0, %hi(zone_engine_dat)
/* 3900 80002D00 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3904 80002D04 AC60D500 */  sw         $zero, %lo(freeWidgetFunc)($v1)
/* 3908 80002D08 0C02DCB3 */  jal        func_800B72CC
/* 390C 80002D0C AC4060B0 */   sw        $zero, %lo(zone_engine_dat)($v0)
/* 3910 80002D10 12000006 */  beqz       $s0, .L80002D2C
/* 3914 80002D14 24050003 */   addiu     $a1, $zero, 3
/* 3918 80002D18 8E020078 */  lw         $v0, 0x78($s0)
/* 391C 80002D1C 84440008 */  lh         $a0, 8($v0)
/* 3920 80002D20 8C43000C */  lw         $v1, 0xc($v0)
/* 3924 80002D24 0060F809 */  jalr       $v1
/* 3928 80002D28 02042021 */   addu      $a0, $s0, $a0
.L80002D2C:
/* 392C 80002D2C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 3930 80002D30 8FB00010 */  lw         $s0, 0x10($sp)
/* 3934 80002D34 03E00008 */  jr         $ra
/* 3938 80002D38 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80002D3C
/* 393C 80002D3C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3940 80002D40 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3944 80002D44 8C85007C */  lw         $a1, 0x7c($a0)
/* 3948 80002D48 10A00007 */  beqz       $a1, .L80002D68
/* 394C 80002D4C 8FBF0010 */   lw        $ra, 0x10($sp)
/* 3950 80002D50 8CA30078 */  lw         $v1, 0x78($a1)
/* 3954 80002D54 84640058 */  lh         $a0, 0x58($v1)
/* 3958 80002D58 8C62005C */  lw         $v0, 0x5c($v1)
/* 395C 80002D5C 0040F809 */  jalr       $v0
/* 3960 80002D60 00A42021 */   addu      $a0, $a1, $a0
/* 3964 80002D64 8FBF0010 */  lw         $ra, 0x10($sp)
.L80002D68:
/* 3968 80002D68 00001021 */  addu       $v0, $zero, $zero
/* 396C 80002D6C 03E00008 */  jr         $ra
/* 3970 80002D70 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80002D74
/* 3974 80002D74 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3978 80002D78 AFBF0010 */  sw         $ra, 0x10($sp)
/* 397C 80002D7C 8C85007C */  lw         $a1, 0x7c($a0)
/* 3980 80002D80 10A00007 */  beqz       $a1, .L80002DA0
/* 3984 80002D84 8FBF0010 */   lw        $ra, 0x10($sp)
/* 3988 80002D88 8CA30078 */  lw         $v1, 0x78($a1)
/* 398C 80002D8C 84640060 */  lh         $a0, 0x60($v1)
/* 3990 80002D90 8C620064 */  lw         $v0, 0x64($v1)
/* 3994 80002D94 0040F809 */  jalr       $v0
/* 3998 80002D98 00A42021 */   addu      $a0, $a1, $a0
/* 399C 80002D9C 8FBF0010 */  lw         $ra, 0x10($sp)
.L80002DA0:
/* 39A0 80002DA0 00001021 */  addu       $v0, $zero, $zero
/* 39A4 80002DA4 03E00008 */  jr         $ra
/* 39A8 80002DA8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel access_database
/* 39AC 80002DAC 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 39B0 80002DB0 AFB1007C */  sw         $s1, 0x7c($sp)
/* 39B4 80002DB4 00808821 */  addu       $s1, $a0, $zero
/* 39B8 80002DB8 AFBF0084 */  sw         $ra, 0x84($sp)
/* 39BC 80002DBC AFB20080 */  sw         $s2, 0x80($sp)
/* 39C0 80002DC0 0C02E658 */  jal        widget_menu_build
/* 39C4 80002DC4 AFB00078 */   sw        $s0, 0x78($sp)
/* 39C8 80002DC8 02202021 */  addu       $a0, $s1, $zero
/* 39CC 80002DCC 00002821 */  addu       $a1, $zero, $zero
/* 39D0 80002DD0 00003021 */  addu       $a2, $zero, $zero
/* 39D4 80002DD4 24070140 */  addiu      $a3, $zero, 0x140
/* 39D8 80002DD8 00008021 */  addu       $s0, $zero, $zero
/* 39DC 80002DDC 3C02800D */  lui        $v0, %hi(list_db_funcs)
/* 39E0 80002DE0 24427190 */  addiu      $v0, $v0, %lo(list_db_funcs)
/* 39E4 80002DE4 240300F0 */  addiu      $v1, $zero, 0xf0
/* 39E8 80002DE8 AE220078 */  sw         $v0, 0x78($s1)
/* 39EC 80002DEC AFA30010 */  sw         $v1, 0x10($sp)
/* 39F0 80002DF0 3C03800D */  lui        $v1, %hi(D_800D7078)
/* 39F4 80002DF4 24627078 */  addiu      $v0, $v1, %lo(D_800D7078)
/* 39F8 80002DF8 8C687078 */  lw         $t0, 0x7078($v1)
/* 39FC 80002DFC 8C490004 */  lw         $t1, 4($v0)
/* 3A00 80002E00 8C4A0008 */  lw         $t2, 8($v0)
/* 3A04 80002E04 8C4B000C */  lw         $t3, 0xc($v0)
/* 3A08 80002E08 8C4C0010 */  lw         $t4, 0x10($v0)
/* 3A0C 80002E0C 240300C8 */  addiu      $v1, $zero, 0xc8
/* 3A10 80002E10 AFA00014 */  sw         $zero, 0x14($sp)
/* 3A14 80002E14 AFA00018 */  sw         $zero, 0x18($sp)
/* 3A18 80002E18 AFA0001C */  sw         $zero, 0x1c($sp)
/* 3A1C 80002E1C AFA30020 */  sw         $v1, 0x20($sp)
/* 3A20 80002E20 AFA80038 */  sw         $t0, 0x38($sp)
/* 3A24 80002E24 AFA9003C */  sw         $t1, 0x3c($sp)
/* 3A28 80002E28 AFAA0040 */  sw         $t2, 0x40($sp)
/* 3A2C 80002E2C AFAB0044 */  sw         $t3, 0x44($sp)
/* 3A30 80002E30 0C013385 */  jal        func_8004CE14
/* 3A34 80002E34 AFAC0048 */   sw        $t4, 0x48($sp)
/* 3A38 80002E38 02202021 */  addu       $a0, $s1, $zero
/* 3A3C 80002E3C 24050005 */  addiu      $a1, $zero, 5
/* 3A40 80002E40 24060014 */  addiu      $a2, $zero, 0x14
/* 3A44 80002E44 24070014 */  addiu      $a3, $zero, 0x14
/* 3A48 80002E48 24030014 */  addiu      $v1, $zero, 0x14
/* 3A4C 80002E4C 2402012C */  addiu      $v0, $zero, 0x12c
/* 3A50 80002E50 AFA30010 */  sw         $v1, 0x10($sp)
/* 3A54 80002E54 AFA30014 */  sw         $v1, 0x14($sp)
/* 3A58 80002E58 240300DC */  addiu      $v1, $zero, 0xdc
/* 3A5C 80002E5C AFA20018 */  sw         $v0, 0x18($sp)
/* 3A60 80002E60 240200E1 */  addiu      $v0, $zero, 0xe1
/* 3A64 80002E64 AFA3001C */  sw         $v1, 0x1c($sp)
/* 3A68 80002E68 240300FF */  addiu      $v1, $zero, 0xff
/* 3A6C 80002E6C AFA20020 */  sw         $v0, 0x20($sp)
/* 3A70 80002E70 AFA20024 */  sw         $v0, 0x24($sp)
/* 3A74 80002E74 AFA20028 */  sw         $v0, 0x28($sp)
/* 3A78 80002E78 AFA3002C */  sw         $v1, 0x2c($sp)
/* 3A7C 80002E7C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 3A80 80002E80 AFA00030 */   sw        $zero, 0x30($sp)
/* 3A84 80002E84 27B20038 */  addiu      $s2, $sp, 0x38
/* 3A88 80002E88 AE22007C */  sw         $v0, 0x7c($s1)
.L80002E8C:
/* 3A8C 80002E8C 0C026259 */  jal        passToMalloc
/* 3A90 80002E90 2404007C */   addiu     $a0, $zero, 0x7c
/* 3A94 80002E94 00402021 */  addu       $a0, $v0, $zero
/* 3A98 80002E98 00101080 */  sll        $v0, $s0, 2
/* 3A9C 80002E9C 02421021 */  addu       $v0, $s2, $v0
/* 3AA0 80002EA0 8C450000 */  lw         $a1, ($v0)
/* 3AA4 80002EA4 0C02E3A0 */  jal        widgettext_func_2
/* 3AA8 80002EA8 24060190 */   addiu     $a2, $zero, 0x190
/* 3AAC 80002EAC 8E24007C */  lw         $a0, 0x7c($s1)
/* 3AB0 80002EB0 00402821 */  addu       $a1, $v0, $zero
/* 3AB4 80002EB4 0C02E885 */  jal        link_widget_text
/* 3AB8 80002EB8 A450005E */   sh        $s0, 0x5e($v0)
/* 3ABC 80002EBC 26030001 */  addiu      $v1, $s0, 1
/* 3AC0 80002EC0 3070FFFF */  andi       $s0, $v1, 0xffff
/* 3AC4 80002EC4 2E020005 */  sltiu      $v0, $s0, 5
/* 3AC8 80002EC8 1440FFF0 */  bnez       $v0, .L80002E8C
/* 3ACC 80002ECC 02201021 */   addu      $v0, $s1, $zero
/* 3AD0 80002ED0 8FBF0084 */  lw         $ra, 0x84($sp)
/* 3AD4 80002ED4 8FB20080 */  lw         $s2, 0x80($sp)
/* 3AD8 80002ED8 8FB1007C */  lw         $s1, 0x7c($sp)
/* 3ADC 80002EDC 8FB00078 */  lw         $s0, 0x78($sp)
/* 3AE0 80002EE0 03E00008 */  jr         $ra
/* 3AE4 80002EE4 27BD0088 */   addiu     $sp, $sp, 0x88

glabel list_db_data
/* 3AE8 80002EE8 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 3AEC 80002EEC AFB7003C */  sw         $s7, 0x3c($sp)
/* 3AF0 80002EF0 0080B821 */  addu       $s7, $a0, $zero
/* 3AF4 80002EF4 3C02800D */  lui        $v0, %hi(list_db_funcs)
/* 3AF8 80002EF8 24427190 */  addiu      $v0, $v0, %lo(list_db_funcs)
/* 3AFC 80002EFC AFBF0044 */  sw         $ra, 0x44($sp)
/* 3B00 80002F00 AFBE0040 */  sw         $fp, 0x40($sp)
/* 3B04 80002F04 AFB60038 */  sw         $s6, 0x38($sp)
/* 3B08 80002F08 AFB50034 */  sw         $s5, 0x34($sp)
/* 3B0C 80002F0C AFB40030 */  sw         $s4, 0x30($sp)
/* 3B10 80002F10 AFB3002C */  sw         $s3, 0x2c($sp)
/* 3B14 80002F14 AFB20028 */  sw         $s2, 0x28($sp)
/* 3B18 80002F18 AFB10024 */  sw         $s1, 0x24($sp)
/* 3B1C 80002F1C AFB00020 */  sw         $s0, 0x20($sp)
/* 3B20 80002F20 8EE30080 */  lw         $v1, 0x80($s7)
/* 3B24 80002F24 00A0F021 */  addu       $fp, $a1, $zero
/* 3B28 80002F28 1060011A */  beqz       $v1, .L80003394
/* 3B2C 80002F2C AEE20078 */   sw        $v0, 0x78($s7)
/* 3B30 80002F30 8EE5007C */  lw         $a1, 0x7c($s7)
/* 3B34 80002F34 8CA30078 */  lw         $v1, 0x78($a1)
/* 3B38 80002F38 84640078 */  lh         $a0, 0x78($v1)
/* 3B3C 80002F3C 8C62007C */  lw         $v0, 0x7c($v1)
/* 3B40 80002F40 0040F809 */  jalr       $v0
/* 3B44 80002F44 00A42021 */   addu      $a0, $a1, $a0
/* 3B48 80002F48 10400113 */  beqz       $v0, .L80003398
/* 3B4C 80002F4C 02E02021 */   addu      $a0, $s7, $zero
/* 3B50 80002F50 9443005E */  lhu        $v1, 0x5e($v0)
/* 3B54 80002F54 2C620005 */  sltiu      $v0, $v1, 5
/* 3B58 80002F58 10400102 */  beqz       $v0, .L80003364
/* 3B5C 80002F5C 00009821 */   addu      $s3, $zero, $zero
/* 3B60 80002F60 3C02800D */  lui        $v0, %hi(D_800D70A8)
/* 3B64 80002F64 244270A8 */  addiu      $v0, $v0, %lo(D_800D70A8)
/* 3B68 80002F68 00031880 */  sll        $v1, $v1, 2
/* 3B6C 80002F6C 00621821 */  addu       $v1, $v1, $v0
/* 3B70 80002F70 8C640000 */  lw         $a0, ($v1)
/* 3B74 80002F74 00800008 */  jr         $a0
/* 3B78 80002F78 00000000 */   nop
/* 3B7C 80002F7C 0C026259 */  jal        passToMalloc
/* 3B80 80002F80 24040080 */   addiu     $a0, $zero, 0x80
/* 3B84 80002F84 00402021 */  addu       $a0, $v0, $zero
/* 3B88 80002F88 3C10800F */  lui        $s0, %hi(armour_pointer)
/* 3B8C 80002F8C 8E02F7B0 */  lw         $v0, %lo(armour_pointer)($s0)
/* 3B90 80002F90 0C000CFB */  jal        list_db_widget_make
/* 3B94 80002F94 90450000 */   lbu       $a1, ($v0)
/* 3B98 80002F98 8E03F7B0 */  lw         $v1, -0x850($s0)
/* 3B9C 80002F9C 00008821 */  addu       $s1, $zero, $zero
/* 3BA0 80002FA0 90640000 */  lbu        $a0, ($v1)
/* 3BA4 80002FA4 108000EF */  beqz       $a0, .L80003364
/* 3BA8 80002FA8 00409821 */   addu      $s3, $v0, $zero
/* 3BAC 80002FAC 0200A021 */  addu       $s4, $s0, $zero
/* 3BB0 80002FB0 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3BB4 80002FB4 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3BB8 80002FB8 3C16800D */  lui        $s6, %hi(D_800D708C)
/* 3BBC 80002FBC 3C02800F */  lui        $v0, %hi(ArmorList)
/* 3BC0 80002FC0 2455F7C0 */  addiu      $s5, $v0, %lo(ArmorList)
/* 3BC4 80002FC4 02402021 */  addu       $a0, $s2, $zero
.L80002FC8:
/* 3BC8 80002FC8 26C5708C */  addiu      $a1, $s6, %lo(D_800D708C)
/* 3BCC 80002FCC 00111040 */  sll        $v0, $s1, 1
/* 3BD0 80002FD0 00511021 */  addu       $v0, $v0, $s1
/* 3BD4 80002FD4 00021080 */  sll        $v0, $v0, 2
/* 3BD8 80002FD8 00511021 */  addu       $v0, $v0, $s1
/* 3BDC 80002FDC 8E83F7B0 */  lw         $v1, -0x850($s4)
/* 3BE0 80002FE0 00021080 */  sll        $v0, $v0, 2
/* 3BE4 80002FE4 8C670004 */  lw         $a3, 4($v1)
/* 3BE8 80002FE8 02351821 */  addu       $v1, $s1, $s5
/* 3BEC 80002FEC 00E23821 */  addu       $a3, $a3, $v0
/* 3BF0 80002FF0 94F00000 */  lhu        $s0, ($a3)
/* 3BF4 80002FF4 90620000 */  lbu        $v0, ($v1)
/* 3BF8 80002FF8 24E70002 */  addiu      $a3, $a3, 2
/* 3BFC 80002FFC AFB10010 */  sw         $s1, 0x10($sp)
/* 3C00 80003000 24420500 */  addiu      $v0, $v0, 0x500
/* 3C04 80003004 02003021 */  addu       $a2, $s0, $zero
/* 3C08 80003008 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3C0C 8000300C 00101202 */  srl        $v0, $s0, 8
/* 3C10 80003010 320300FF */  andi       $v1, $s0, 0xff
/* 3C14 80003014 AFA20014 */  sw         $v0, 0x14($sp)
/* 3C18 80003018 0C0333AC */  jal        sprintf
/* 3C1C 8000301C AFA30018 */   sw        $v1, 0x18($sp)
/* 3C20 80003020 02602021 */  addu       $a0, $s3, $zero
/* 3C24 80003024 02402821 */  addu       $a1, $s2, $zero
/* 3C28 80003028 0C000D45 */  jal        func_80003514
/* 3C2C 8000302C 02003021 */   addu      $a2, $s0, $zero
/* 3C30 80003030 8E83F7B0 */  lw         $v1, -0x850($s4)
/* 3C34 80003034 26240001 */  addiu      $a0, $s1, 1
/* 3C38 80003038 90620000 */  lbu        $v0, ($v1)
/* 3C3C 8000303C 3091FFFF */  andi       $s1, $a0, 0xffff
/* 3C40 80003040 0222102B */  sltu       $v0, $s1, $v0
/* 3C44 80003044 1440FFE0 */  bnez       $v0, .L80002FC8
/* 3C48 80003048 02402021 */   addu      $a0, $s2, $zero
/* 3C4C 8000304C 08000CDA */  j          .L80003368
/* 3C50 80003050 3C03800E */   lui       $v1, 0x800e
/* 3C54 80003054 0C026259 */  jal        passToMalloc
/* 3C58 80003058 24040080 */   addiu     $a0, $zero, 0x80
/* 3C5C 8000305C 00402021 */  addu       $a0, $v0, $zero
/* 3C60 80003060 3C10800F */  lui        $s0, %hi(armour_pointer)
/* 3C64 80003064 8E02F7B0 */  lw         $v0, %lo(armour_pointer)($s0)
/* 3C68 80003068 0C000CFB */  jal        list_db_widget_make
/* 3C6C 8000306C 90450001 */   lbu       $a1, 1($v0)
/* 3C70 80003070 8E04F7B0 */  lw         $a0, -0x850($s0)
/* 3C74 80003074 90910000 */  lbu        $s1, ($a0)
/* 3C78 80003078 90830002 */  lbu        $v1, 2($a0)
/* 3C7C 8000307C 0223182B */  sltu       $v1, $s1, $v1
/* 3C80 80003080 106000B8 */  beqz       $v1, .L80003364
/* 3C84 80003084 00409821 */   addu      $s3, $v0, $zero
/* 3C88 80003088 0200A021 */  addu       $s4, $s0, $zero
/* 3C8C 8000308C 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3C90 80003090 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3C94 80003094 3C16800D */  lui        $s6, %hi(D_800D708C)
/* 3C98 80003098 3C02800F */  lui        $v0, %hi(ArmorList)
/* 3C9C 8000309C 2455F7C0 */  addiu      $s5, $v0, %lo(ArmorList)
/* 3CA0 800030A0 02402021 */  addu       $a0, $s2, $zero
.L800030A4:
/* 3CA4 800030A4 26C5708C */  addiu      $a1, $s6, %lo(D_800D708C)
/* 3CA8 800030A8 00111040 */  sll        $v0, $s1, 1
/* 3CAC 800030AC 00511021 */  addu       $v0, $v0, $s1
/* 3CB0 800030B0 00021080 */  sll        $v0, $v0, 2
/* 3CB4 800030B4 00511021 */  addu       $v0, $v0, $s1
/* 3CB8 800030B8 8E83F7B0 */  lw         $v1, -0x850($s4)
/* 3CBC 800030BC 00021080 */  sll        $v0, $v0, 2
/* 3CC0 800030C0 8C670004 */  lw         $a3, 4($v1)
/* 3CC4 800030C4 02351821 */  addu       $v1, $s1, $s5
/* 3CC8 800030C8 00E23821 */  addu       $a3, $a3, $v0
/* 3CCC 800030CC 94F00000 */  lhu        $s0, ($a3)
/* 3CD0 800030D0 90620000 */  lbu        $v0, ($v1)
/* 3CD4 800030D4 24E70002 */  addiu      $a3, $a3, 2
/* 3CD8 800030D8 AFB10010 */  sw         $s1, 0x10($sp)
/* 3CDC 800030DC 24420600 */  addiu      $v0, $v0, 0x600
/* 3CE0 800030E0 02003021 */  addu       $a2, $s0, $zero
/* 3CE4 800030E4 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3CE8 800030E8 00101202 */  srl        $v0, $s0, 8
/* 3CEC 800030EC 320300FF */  andi       $v1, $s0, 0xff
/* 3CF0 800030F0 AFA20014 */  sw         $v0, 0x14($sp)
/* 3CF4 800030F4 0C0333AC */  jal        sprintf
/* 3CF8 800030F8 AFA30018 */   sw        $v1, 0x18($sp)
/* 3CFC 800030FC 02602021 */  addu       $a0, $s3, $zero
/* 3D00 80003100 02402821 */  addu       $a1, $s2, $zero
/* 3D04 80003104 0C000D45 */  jal        func_80003514
/* 3D08 80003108 02003021 */   addu      $a2, $s0, $zero
/* 3D0C 8000310C 8E83F7B0 */  lw         $v1, -0x850($s4)
/* 3D10 80003110 26240001 */  addiu      $a0, $s1, 1
/* 3D14 80003114 90620002 */  lbu        $v0, 2($v1)
/* 3D18 80003118 3091FFFF */  andi       $s1, $a0, 0xffff
/* 3D1C 8000311C 0222102B */  sltu       $v0, $s1, $v0
/* 3D20 80003120 1440FFE0 */  bnez       $v0, .L800030A4
/* 3D24 80003124 02402021 */   addu      $a0, $s2, $zero
/* 3D28 80003128 08000CDA */  j          .L80003368
/* 3D2C 8000312C 3C03800E */   lui       $v1, 0x800e
/* 3D30 80003130 0C026259 */  jal        passToMalloc
/* 3D34 80003134 24040080 */   addiu     $a0, $zero, 0x80
/* 3D38 80003138 00402021 */  addu       $a0, $v0, $zero
/* 3D3C 8000313C 3C10800F */  lui        $s0, %hi(item_pointer)
/* 3D40 80003140 8E0214F0 */  lw         $v0, %lo(item_pointer)($s0)
/* 3D44 80003144 0C000CFB */  jal        list_db_widget_make
/* 3D48 80003148 90450000 */   lbu       $a1, ($v0)
/* 3D4C 8000314C 8E0314F0 */  lw         $v1, 0x14f0($s0)
/* 3D50 80003150 00008821 */  addu       $s1, $zero, $zero
/* 3D54 80003154 90640000 */  lbu        $a0, ($v1)
/* 3D58 80003158 10800082 */  beqz       $a0, .L80003364
/* 3D5C 8000315C 00409821 */   addu      $s3, $v0, $zero
/* 3D60 80003160 0200A021 */  addu       $s4, $s0, $zero
/* 3D64 80003164 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3D68 80003168 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3D6C 8000316C 3C16800D */  lui        $s6, %hi(D_800D708C)
/* 3D70 80003170 3C02800F */  lui        $v0, %hi(itemID_array)
/* 3D74 80003174 24551500 */  addiu      $s5, $v0, %lo(itemID_array)
/* 3D78 80003178 02402021 */  addu       $a0, $s2, $zero
.L8000317C:
/* 3D7C 8000317C 26C5708C */  addiu      $a1, $s6, %lo(D_800D708C)
/* 3D80 80003180 00113040 */  sll        $a2, $s1, 1
/* 3D84 80003184 00D11021 */  addu       $v0, $a2, $s1
/* 3D88 80003188 8E8314F0 */  lw         $v1, 0x14f0($s4)
/* 3D8C 8000318C 00021100 */  sll        $v0, $v0, 4
/* 3D90 80003190 8C670018 */  lw         $a3, 0x18($v1)
/* 3D94 80003194 00D53021 */  addu       $a2, $a2, $s5
/* 3D98 80003198 00E23821 */  addu       $a3, $a3, $v0
/* 3D9C 8000319C 94F00000 */  lhu        $s0, ($a3)
/* 3DA0 800031A0 94C20000 */  lhu        $v0, ($a2)
/* 3DA4 800031A4 24E70002 */  addiu      $a3, $a3, 2
/* 3DA8 800031A8 AFB10010 */  sw         $s1, 0x10($sp)
/* 3DAC 800031AC 02003021 */  addu       $a2, $s0, $zero
/* 3DB0 800031B0 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3DB4 800031B4 00101202 */  srl        $v0, $s0, 8
/* 3DB8 800031B8 320300FF */  andi       $v1, $s0, 0xff
/* 3DBC 800031BC AFA20014 */  sw         $v0, 0x14($sp)
/* 3DC0 800031C0 0C0333AC */  jal        sprintf
/* 3DC4 800031C4 AFA30018 */   sw        $v1, 0x18($sp)
/* 3DC8 800031C8 02602021 */  addu       $a0, $s3, $zero
/* 3DCC 800031CC 02402821 */  addu       $a1, $s2, $zero
/* 3DD0 800031D0 0C000D45 */  jal        func_80003514
/* 3DD4 800031D4 02003021 */   addu      $a2, $s0, $zero
/* 3DD8 800031D8 8E8314F0 */  lw         $v1, 0x14f0($s4)
/* 3DDC 800031DC 26240001 */  addiu      $a0, $s1, 1
/* 3DE0 800031E0 90620000 */  lbu        $v0, ($v1)
/* 3DE4 800031E4 3091FFFF */  andi       $s1, $a0, 0xffff
/* 3DE8 800031E8 0222102B */  sltu       $v0, $s1, $v0
/* 3DEC 800031EC 1440FFE3 */  bnez       $v0, .L8000317C
/* 3DF0 800031F0 02402021 */   addu      $a0, $s2, $zero
/* 3DF4 800031F4 08000CDA */  j          .L80003368
/* 3DF8 800031F8 3C03800E */   lui       $v1, 0x800e
/* 3DFC 800031FC 0C026259 */  jal        passToMalloc
/* 3E00 80003200 24040080 */   addiu     $a0, $zero, 0x80
/* 3E04 80003204 00402021 */  addu       $a0, $v0, $zero
/* 3E08 80003208 3C10800F */  lui        $s0, %hi(weapon_pointer)
/* 3E0C 8000320C 8E0216F0 */  lw         $v0, %lo(weapon_pointer)($s0)
/* 3E10 80003210 0C000CFB */  jal        list_db_widget_make
/* 3E14 80003214 90450000 */   lbu       $a1, ($v0)
/* 3E18 80003218 8E0316F0 */  lw         $v1, 0x16f0($s0)
/* 3E1C 8000321C 00008821 */  addu       $s1, $zero, $zero
/* 3E20 80003220 90640000 */  lbu        $a0, ($v1)
/* 3E24 80003224 1080004F */  beqz       $a0, .L80003364
/* 3E28 80003228 00409821 */   addu      $s3, $v0, $zero
/* 3E2C 8000322C 0200A021 */  addu       $s4, $s0, $zero
/* 3E30 80003230 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3E34 80003234 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3E38 80003238 3C16800D */  lui        $s6, %hi(D_800D708C)
/* 3E3C 8000323C 3C02800F */  lui        $v0, %hi(weaponList)
/* 3E40 80003240 24551700 */  addiu      $s5, $v0, %lo(weaponList)
/* 3E44 80003244 02402021 */  addu       $a0, $s2, $zero
.L80003248:
/* 3E48 80003248 26C5708C */  addiu      $a1, $s6, %lo(D_800D708C)
/* 3E4C 8000324C 00111040 */  sll        $v0, $s1, 1
/* 3E50 80003250 00511021 */  addu       $v0, $v0, $s1
/* 3E54 80003254 00021080 */  sll        $v0, $v0, 2
/* 3E58 80003258 00511021 */  addu       $v0, $v0, $s1
/* 3E5C 8000325C 8E8316F0 */  lw         $v1, 0x16f0($s4)
/* 3E60 80003260 00021080 */  sll        $v0, $v0, 2
/* 3E64 80003264 8C670018 */  lw         $a3, 0x18($v1)
/* 3E68 80003268 02351821 */  addu       $v1, $s1, $s5
/* 3E6C 8000326C 00E23821 */  addu       $a3, $a3, $v0
/* 3E70 80003270 94F00000 */  lhu        $s0, ($a3)
/* 3E74 80003274 90620000 */  lbu        $v0, ($v1)
/* 3E78 80003278 24E70002 */  addiu      $a3, $a3, 2
/* 3E7C 8000327C AFB10010 */  sw         $s1, 0x10($sp)
/* 3E80 80003280 24420700 */  addiu      $v0, $v0, 0x700
/* 3E84 80003284 02003021 */  addu       $a2, $s0, $zero
/* 3E88 80003288 AFA2001C */  sw         $v0, 0x1c($sp)
/* 3E8C 8000328C 00101202 */  srl        $v0, $s0, 8
/* 3E90 80003290 320300FF */  andi       $v1, $s0, 0xff
/* 3E94 80003294 AFA20014 */  sw         $v0, 0x14($sp)
/* 3E98 80003298 0C0333AC */  jal        sprintf
/* 3E9C 8000329C AFA30018 */   sw        $v1, 0x18($sp)
/* 3EA0 800032A0 02602021 */  addu       $a0, $s3, $zero
/* 3EA4 800032A4 02402821 */  addu       $a1, $s2, $zero
/* 3EA8 800032A8 0C000D45 */  jal        func_80003514
/* 3EAC 800032AC 02003021 */   addu      $a2, $s0, $zero
/* 3EB0 800032B0 8E8316F0 */  lw         $v1, 0x16f0($s4)
/* 3EB4 800032B4 26240001 */  addiu      $a0, $s1, 1
/* 3EB8 800032B8 90620000 */  lbu        $v0, ($v1)
/* 3EBC 800032BC 3091FFFF */  andi       $s1, $a0, 0xffff
/* 3EC0 800032C0 0222102B */  sltu       $v0, $s1, $v0
/* 3EC4 800032C4 1440FFE0 */  bnez       $v0, .L80003248
/* 3EC8 800032C8 02402021 */   addu      $a0, $s2, $zero
/* 3ECC 800032CC 08000CDA */  j          .L80003368
/* 3ED0 800032D0 3C03800E */   lui       $v1, 0x800e
/* 3ED4 800032D4 0C026259 */  jal        passToMalloc
/* 3ED8 800032D8 24040080 */   addiu     $a0, $zero, 0x80
/* 3EDC 800032DC 00402021 */  addu       $a0, $v0, $zero
/* 3EE0 800032E0 0C000CFB */  jal        list_db_widget_make
/* 3EE4 800032E4 24050011 */   addiu     $a1, $zero, 0x11
/* 3EE8 800032E8 00409821 */  addu       $s3, $v0, $zero
/* 3EEC 800032EC 00008821 */  addu       $s1, $zero, $zero
/* 3EF0 800032F0 3C15800D */  lui        $s5, %hi(D_800D708C)
/* 3EF4 800032F4 3C14800F */  lui        $s4, 0x800f
/* 3EF8 800032F8 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 3EFC 800032FC 24528920 */  addiu      $s2, $v0, %lo(gGlobalsText)
/* 3F00 80003300 02402021 */  addu       $a0, $s2, $zero
.L80003304:
/* 3F04 80003304 26A5708C */  addiu      $a1, $s5, %lo(D_800D708C)
/* 3F08 80003308 26261000 */  addiu      $a2, $s1, 0x1000
/* 3F0C 8000330C 30D0FFFF */  andi       $s0, $a2, 0xffff
/* 3F10 80003310 320300FF */  andi       $v1, $s0, 0xff
/* 3F14 80003314 AFA30018 */  sw         $v1, 0x18($sp)
/* 3F18 80003318 8E831B30 */  lw         $v1, 0x1b30($s4)
/* 3F1C 8000331C 00101202 */  srl        $v0, $s0, 8
/* 3F20 80003320 AFA20014 */  sw         $v0, 0x14($sp)
/* 3F24 80003324 00111080 */  sll        $v0, $s1, 2
/* 3F28 80003328 AFB10010 */  sw         $s1, 0x10($sp)
/* 3F2C 8000332C AFA6001C */  sw         $a2, 0x1c($sp)
/* 3F30 80003330 00431021 */  addu       $v0, $v0, $v1
/* 3F34 80003334 8C470000 */  lw         $a3, ($v0)
/* 3F38 80003338 0C0333AC */  jal        sprintf
/* 3F3C 8000333C 02003021 */   addu      $a2, $s0, $zero
/* 3F40 80003340 02602021 */  addu       $a0, $s3, $zero
/* 3F44 80003344 02402821 */  addu       $a1, $s2, $zero
/* 3F48 80003348 0C000D45 */  jal        func_80003514
/* 3F4C 8000334C 02003021 */   addu      $a2, $s0, $zero
/* 3F50 80003350 26220001 */  addiu      $v0, $s1, 1
/* 3F54 80003354 3051FFFF */  andi       $s1, $v0, 0xffff
/* 3F58 80003358 2E230011 */  sltiu      $v1, $s1, 0x11
/* 3F5C 8000335C 1460FFE9 */  bnez       $v1, .L80003304
/* 3F60 80003360 02402021 */   addu      $a0, $s2, $zero
.L80003364:
/* 3F64 80003364 3C03800E */  lui        $v1, %hi(gGlobals)
.L80003368:
/* 3F68 80003368 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 3F6C 8000336C 8C441604 */  lw         $a0, 0x1604($v0)
/* 3F70 80003370 0C02DC7C */  jal        widgetHandler
/* 3F74 80003374 02602821 */   addu      $a1, $s3, $zero
/* 3F78 80003378 3C028000 */  lui        $v0, %hi(func_80002CE0)
/* 3F7C 8000337C 24432CE0 */  addiu      $v1, $v0, %lo(func_80002CE0)
/* 3F80 80003380 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 3F84 80003384 AC43D500 */  sw         $v1, %lo(freeWidgetFunc)($v0)
/* 3F88 80003388 24020001 */  addiu      $v0, $zero, 1
/* 3F8C 8000338C 3C03800E */  lui        $v1, %hi(zone_engine_dat)
/* 3F90 80003390 AC6260B0 */  sw         $v0, %lo(zone_engine_dat)($v1)
.L80003394:
/* 3F94 80003394 02E02021 */  addu       $a0, $s7, $zero
.L80003398:
/* 3F98 80003398 0C02E66C */  jal        widget_menu_free
/* 3F9C 8000339C 03C02821 */   addu      $a1, $fp, $zero
/* 3FA0 800033A0 8FBF0044 */  lw         $ra, 0x44($sp)
/* 3FA4 800033A4 8FBE0040 */  lw         $fp, 0x40($sp)
/* 3FA8 800033A8 8FB7003C */  lw         $s7, 0x3c($sp)
/* 3FAC 800033AC 8FB60038 */  lw         $s6, 0x38($sp)
/* 3FB0 800033B0 8FB50034 */  lw         $s5, 0x34($sp)
/* 3FB4 800033B4 8FB40030 */  lw         $s4, 0x30($sp)
/* 3FB8 800033B8 8FB3002C */  lw         $s3, 0x2c($sp)
/* 3FBC 800033BC 8FB20028 */  lw         $s2, 0x28($sp)
/* 3FC0 800033C0 8FB10024 */  lw         $s1, 0x24($sp)
/* 3FC4 800033C4 8FB00020 */  lw         $s0, 0x20($sp)
/* 3FC8 800033C8 03E00008 */  jr         $ra
/* 3FCC 800033CC 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_800033D0
/* 3FD0 800033D0 00801021 */  addu       $v0, $a0, $zero
/* 3FD4 800033D4 24030001 */  addiu      $v1, $zero, 1
/* 3FD8 800033D8 03E00008 */  jr         $ra
/* 3FDC 800033DC AC430080 */   sw        $v1, 0x80($v0)

glabel func_800033E0
/* 3FE0 800033E0 00801021 */  addu       $v0, $a0, $zero
/* 3FE4 800033E4 03E00008 */  jr         $ra
/* 3FE8 800033E8 AC400080 */   sw        $zero, 0x80($v0)

glabel list_db_widget_make
/* 3FEC 800033EC 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 3FF0 800033F0 AFB00038 */  sw         $s0, 0x38($sp)
/* 3FF4 800033F4 00808021 */  addu       $s0, $a0, $zero
/* 3FF8 800033F8 AFB1003C */  sw         $s1, 0x3c($sp)
/* 3FFC 800033FC AFBF0040 */  sw         $ra, 0x40($sp)
/* 4000 80003400 0C02E658 */  jal        widget_menu_build
/* 4004 80003404 30B1FFFF */   andi      $s1, $a1, 0xffff
/* 4008 80003408 02002021 */  addu       $a0, $s0, $zero
/* 400C 8000340C 00002821 */  addu       $a1, $zero, $zero
/* 4010 80003410 00003021 */  addu       $a2, $zero, $zero
/* 4014 80003414 24070140 */  addiu      $a3, $zero, 0x140
/* 4018 80003418 3C02800D */  lui        $v0, %hi(D_800D70C0)
/* 401C 8000341C 244270C0 */  addiu      $v0, $v0, %lo(D_800D70C0)
/* 4020 80003420 240300F0 */  addiu      $v1, $zero, 0xf0
/* 4024 80003424 AE020078 */  sw         $v0, 0x78($s0)
/* 4028 80003428 240200C8 */  addiu      $v0, $zero, 0xc8
/* 402C 8000342C AFA30010 */  sw         $v1, 0x10($sp)
/* 4030 80003430 AFA00014 */  sw         $zero, 0x14($sp)
/* 4034 80003434 AFA00018 */  sw         $zero, 0x18($sp)
/* 4038 80003438 AFA0001C */  sw         $zero, 0x1c($sp)
/* 403C 8000343C 0C013385 */  jal        func_8004CE14
/* 4040 80003440 AFA20020 */   sw        $v0, 0x20($sp)
/* 4044 80003444 02002021 */  addu       $a0, $s0, $zero
/* 4048 80003448 02202821 */  addu       $a1, $s1, $zero
/* 404C 8000344C 24060014 */  addiu      $a2, $zero, 0x14
/* 4050 80003450 24070014 */  addiu      $a3, $zero, 0x14
/* 4054 80003454 24030014 */  addiu      $v1, $zero, 0x14
/* 4058 80003458 2402012C */  addiu      $v0, $zero, 0x12c
/* 405C 8000345C AFA30010 */  sw         $v1, 0x10($sp)
/* 4060 80003460 AFA30014 */  sw         $v1, 0x14($sp)
/* 4064 80003464 240300DC */  addiu      $v1, $zero, 0xdc
/* 4068 80003468 AFA20018 */  sw         $v0, 0x18($sp)
/* 406C 8000346C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 4070 80003470 AFA3001C */  sw         $v1, 0x1c($sp)
/* 4074 80003474 240300FF */  addiu      $v1, $zero, 0xff
/* 4078 80003478 AFA20020 */  sw         $v0, 0x20($sp)
/* 407C 8000347C AFA20024 */  sw         $v0, 0x24($sp)
/* 4080 80003480 AFA20028 */  sw         $v0, 0x28($sp)
/* 4084 80003484 AFA3002C */  sw         $v1, 0x2c($sp)
/* 4088 80003488 0C02F435 */  jal        widgetscrollmenu_init_2
/* 408C 8000348C AFA00030 */   sw        $zero, 0x30($sp)
/* 4090 80003490 AE02007C */  sw         $v0, 0x7c($s0)
/* 4094 80003494 02001021 */  addu       $v0, $s0, $zero
/* 4098 80003498 8FBF0040 */  lw         $ra, 0x40($sp)
/* 409C 8000349C 8FB1003C */  lw         $s1, 0x3c($sp)
/* 40A0 800034A0 8FB00038 */  lw         $s0, 0x38($sp)
/* 40A4 800034A4 03E00008 */  jr         $ra
/* 40A8 800034A8 27BD0048 */   addiu     $sp, $sp, 0x48

glabel debug_add_item
/* 40AC 800034AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 40B0 800034B0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 40B4 800034B4 8C85007C */  lw         $a1, 0x7c($a0)
/* 40B8 800034B8 8CA30078 */  lw         $v1, 0x78($a1)
/* 40BC 800034BC 84640078 */  lh         $a0, 0x78($v1)
/* 40C0 800034C0 8C62007C */  lw         $v0, 0x7c($v1)
/* 40C4 800034C4 0040F809 */  jalr       $v0
/* 40C8 800034C8 00A42021 */   addu      $a0, $a1, $a0
/* 40CC 800034CC 00403821 */  addu       $a3, $v0, $zero
/* 40D0 800034D0 10E0000A */  beqz       $a3, .L800034FC
/* 40D4 800034D4 3C02800E */   lui       $v0, %hi(partyPointer)
/* 40D8 800034D8 8C437EA0 */  lw         $v1, %lo(partyPointer)($v0)
/* 40DC 800034DC 8C650010 */  lw         $a1, 0x10($v1)
/* 40E0 800034E0 8CA60000 */  lw         $a2, ($a1)
/* 40E4 800034E4 84C40030 */  lh         $a0, 0x30($a2)
/* 40E8 800034E8 8CC20034 */  lw         $v0, 0x34($a2)
/* 40EC 800034EC 00A42021 */  addu       $a0, $a1, $a0
/* 40F0 800034F0 94E5005E */  lhu        $a1, 0x5e($a3)
/* 40F4 800034F4 0040F809 */  jalr       $v0
/* 40F8 800034F8 24060001 */   addiu     $a2, $zero, 1
.L800034FC:
/* 40FC 800034FC 00001021 */  addu       $v0, $zero, $zero
/* 4100 80003500 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4104 80003504 03E00008 */  jr         $ra
/* 4108 80003508 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8000350C
/* 410C 8000350C 03E00008 */  jr         $ra
/* 4110 80003510 00801021 */   addu      $v0, $a0, $zero

glabel func_80003514
/* 4114 80003514 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4118 80003518 AFB10014 */  sw         $s1, 0x14($sp)
/* 411C 8000351C 00808821 */  addu       $s1, $a0, $zero
/* 4120 80003520 2404007C */  addiu      $a0, $zero, 0x7c
/* 4124 80003524 AFB00010 */  sw         $s0, 0x10($sp)
/* 4128 80003528 00A08021 */  addu       $s0, $a1, $zero
/* 412C 8000352C AFB20018 */  sw         $s2, 0x18($sp)
/* 4130 80003530 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4134 80003534 0C026259 */  jal        passToMalloc
/* 4138 80003538 30D2FFFF */   andi      $s2, $a2, 0xffff
/* 413C 8000353C 00402021 */  addu       $a0, $v0, $zero
/* 4140 80003540 02002821 */  addu       $a1, $s0, $zero
/* 4144 80003544 0C02E3A0 */  jal        widgettext_func_2
/* 4148 80003548 2406003C */   addiu     $a2, $zero, 0x3c
/* 414C 8000354C 8E24007C */  lw         $a0, 0x7c($s1)
/* 4150 80003550 00402821 */  addu       $a1, $v0, $zero
/* 4154 80003554 0C02E885 */  jal        link_widget_text
/* 4158 80003558 A452005E */   sh        $s2, 0x5e($v0)
/* 415C 8000355C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4160 80003560 8FB20018 */  lw         $s2, 0x18($sp)
/* 4164 80003564 8FB10014 */  lw         $s1, 0x14($sp)
/* 4168 80003568 8FB00010 */  lw         $s0, 0x10($sp)
/* 416C 8000356C 03E00008 */  jr         $ra
/* 4170 80003570 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80003574
/* 4174 80003574 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4178 80003578 AFBF0010 */  sw         $ra, 0x10($sp)
/* 417C 8000357C 0C02E66C */  jal        widget_menu_free
/* 4180 80003580 00000000 */   nop
/* 4184 80003584 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4188 80003588 03E00008 */  jr         $ra
/* 418C 8000358C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80003590
/* 4190 80003590 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4194 80003594 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4198 80003598 0C02E66C */  jal        widget_menu_free
/* 419C 8000359C 00000000 */   nop
/* 41A0 800035A0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 41A4 800035A4 03E00008 */  jr         $ra
/* 41A8 800035A8 27BD0018 */   addiu     $sp, $sp, 0x18
/* 41AC 800035AC 00000000 */  nop
