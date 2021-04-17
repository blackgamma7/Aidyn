.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8008A8D0
/* 8B4D0 8008A8D0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8B4D4 8008A8D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 8B4D8 8008A8D8 00808021 */  addu       $s0, $a0, $zero
/* 8B4DC 8008A8DC AFB30024 */  sw         $s3, 0x24($sp)
/* 8B4E0 8008A8E0 00A09821 */  addu       $s3, $a1, $zero
/* 8B4E4 8008A8E4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8B4E8 8008A8E8 00C08821 */  addu       $s1, $a2, $zero
/* 8B4EC 8008A8EC AFB20020 */  sw         $s2, 0x20($sp)
/* 8B4F0 8008A8F0 AFBF0028 */  sw         $ra, 0x28($sp)
/* 8B4F4 8008A8F4 0C02E658 */  jal        widget_menu_build
/* 8B4F8 8008A8F8 00E09021 */   addu      $s2, $a3, $zero
/* 8B4FC 8008A8FC 3C02800E */  lui        $v0, %hi(D_800E1688)
/* 8B500 8008A900 96230000 */  lhu        $v1, ($s1)
/* 8B504 8008A904 96240002 */  lhu        $a0, 2($s1)
/* 8B508 8008A908 96250004 */  lhu        $a1, 4($s1)
/* 8B50C 8008A90C 96260006 */  lhu        $a2, 6($s1)
/* 8B510 8008A910 24421688 */  addiu      $v0, $v0, %lo(D_800E1688)
/* 8B514 8008A914 AE020078 */  sw         $v0, 0x78($s0)
/* 8B518 8008A918 260200AC */  addiu      $v0, $s0, 0xac
/* 8B51C 8008A91C AE00007C */  sw         $zero, 0x7c($s0)
/* 8B520 8008A920 AE000080 */  sw         $zero, 0x80($s0)
/* 8B524 8008A924 AE130084 */  sw         $s3, 0x84($s0)
/* 8B528 8008A928 AE000088 */  sw         $zero, 0x88($s0)
/* 8B52C 8008A92C AE00008C */  sw         $zero, 0x8c($s0)
/* 8B530 8008A930 AE000090 */  sw         $zero, 0x90($s0)
/* 8B534 8008A934 AE000094 */  sw         $zero, 0x94($s0)
/* 8B538 8008A938 AE000098 */  sw         $zero, 0x98($s0)
/* 8B53C 8008A93C AE00009C */  sw         $zero, 0x9c($s0)
/* 8B540 8008A940 AE0000A0 */  sw         $zero, 0xa0($s0)
/* 8B544 8008A944 AE0000A4 */  sw         $zero, 0xa4($s0)
/* 8B548 8008A948 AE0000A8 */  sw         $zero, 0xa8($s0)
/* 8B54C 8008A94C A60300AC */  sh         $v1, 0xac($s0)
/* 8B550 8008A950 A4440002 */  sh         $a0, 2($v0)
/* 8B554 8008A954 A4450004 */  sh         $a1, 4($v0)
/* 8B558 8008A958 A4460006 */  sh         $a2, 6($v0)
/* 8B55C 8008A95C 92430000 */  lbu        $v1, ($s2)
/* 8B560 8008A960 92440001 */  lbu        $a0, 1($s2)
/* 8B564 8008A964 92450002 */  lbu        $a1, 2($s2)
/* 8B568 8008A968 92460003 */  lbu        $a2, 3($s2)
/* 8B56C 8008A96C 260200B4 */  addiu      $v0, $s0, 0xb4
/* 8B570 8008A970 A20300B4 */  sb         $v1, 0xb4($s0)
/* 8B574 8008A974 A0440001 */  sb         $a0, 1($v0)
/* 8B578 8008A978 A0450002 */  sb         $a1, 2($v0)
/* 8B57C 8008A97C A0460003 */  sb         $a2, 3($v0)
/* 8B580 8008A980 960500AC */  lhu        $a1, 0xac($s0)
/* 8B584 8008A984 960600AE */  lhu        $a2, 0xae($s0)
/* 8B588 8008A988 960700B0 */  lhu        $a3, 0xb0($s0)
/* 8B58C 8008A98C 960200B2 */  lhu        $v0, 0xb2($s0)
/* 8B590 8008A990 02002021 */  addu       $a0, $s0, $zero
/* 8B594 8008A994 AE0000B8 */  sw         $zero, 0xb8($s0)
/* 8B598 8008A998 0C00193A */  jal        func_800064E8
/* 8B59C 8008A99C AFA20010 */   sw        $v0, 0x10($sp)
/* 8B5A0 8008A9A0 960500AC */  lhu        $a1, 0xac($s0)
/* 8B5A4 8008A9A4 960600AE */  lhu        $a2, 0xae($s0)
/* 8B5A8 8008A9A8 0C02DD3F */  jal        set_widget_coords
/* 8B5AC 8008A9AC 02002021 */   addu      $a0, $s0, $zero
/* 8B5B0 8008A9B0 02001021 */  addu       $v0, $s0, $zero
/* 8B5B4 8008A9B4 8FBF0028 */  lw         $ra, 0x28($sp)
/* 8B5B8 8008A9B8 8FB30024 */  lw         $s3, 0x24($sp)
/* 8B5BC 8008A9BC 8FB20020 */  lw         $s2, 0x20($sp)
/* 8B5C0 8008A9C0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8B5C4 8008A9C4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8B5C8 8008A9C8 03E00008 */  jr         $ra
/* 8B5CC 8008A9CC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8008A9D0
/* 8B5D0 8008A9D0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8B5D4 8008A9D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 8B5D8 8008A9D8 00808021 */  addu       $s0, $a0, $zero
/* 8B5DC 8008A9DC 3C02800E */  lui        $v0, %hi(D_800E1688)
/* 8B5E0 8008A9E0 24421688 */  addiu      $v0, $v0, %lo(D_800E1688)
/* 8B5E4 8008A9E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 8B5E8 8008A9E8 00A08821 */  addu       $s1, $a1, $zero
/* 8B5EC 8008A9EC AFBF0018 */  sw         $ra, 0x18($sp)
/* 8B5F0 8008A9F0 0C022BE0 */  jal        controllerpaksliders_free
/* 8B5F4 8008A9F4 AE020078 */   sw        $v0, 0x78($s0)
/* 8B5F8 8008A9F8 02002021 */  addu       $a0, $s0, $zero
/* 8B5FC 8008A9FC 0C02E66C */  jal        widget_menu_free
/* 8B600 8008AA00 02202821 */   addu      $a1, $s1, $zero
/* 8B604 8008AA04 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8B608 8008AA08 8FB10014 */  lw         $s1, 0x14($sp)
/* 8B60C 8008AA0C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8B610 8008AA10 03E00008 */  jr         $ra
/* 8B614 8008AA14 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008AA18
/* 8B618 8008AA18 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8B61C 8008AA1C AFB00018 */  sw         $s0, 0x18($sp)
/* 8B620 8008AA20 00808021 */  addu       $s0, $a0, $zero
/* 8B624 8008AA24 00063400 */  sll        $a2, $a2, 0x10
/* 8B628 8008AA28 00063403 */  sra        $a2, $a2, 0x10
/* 8B62C 8008AA2C 00073C00 */  sll        $a3, $a3, 0x10
/* 8B630 8008AA30 87A80032 */  lh         $t0, 0x32($sp)
/* 8B634 8008AA34 00073C03 */  sra        $a3, $a3, 0x10
/* 8B638 8008AA38 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8B63C 8008AA3C 8E020098 */  lw         $v0, 0x98($s0)
/* 8B640 8008AA40 1040000A */  beqz       $v0, .L8008AA6C
/* 8B644 8008AA44 87A90036 */   lh        $t1, 0x36($sp)
/* 8B648 8008AA48 8E020088 */  lw         $v0, 0x88($s0)
/* 8B64C 8008AA4C 8E03008C */  lw         $v1, 0x8c($s0)
/* 8B650 8008AA50 AC43006C */  sw         $v1, 0x6c($v0)
/* 8B654 8008AA54 AFA80010 */  sw         $t0, 0x10($sp)
/* 8B658 8008AA58 0C02E675 */  jal        func_800B99D4
/* 8B65C 8008AA5C AFA90014 */   sw        $t1, 0x14($sp)
/* 8B660 8008AA60 8E030088 */  lw         $v1, 0x88($s0)
/* 8B664 8008AA64 08022A9F */  j          .L8008AA7C
/* 8B668 8008AA68 AC60006C */   sw        $zero, 0x6c($v1)
.L8008AA6C:
/* 8B66C 8008AA6C 02002021 */  addu       $a0, $s0, $zero
/* 8B670 8008AA70 AFA80010 */  sw         $t0, 0x10($sp)
/* 8B674 8008AA74 0C02E675 */  jal        func_800B99D4
/* 8B678 8008AA78 AFA90014 */   sw        $t1, 0x14($sp)
.L8008AA7C:
/* 8B67C 8008AA7C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8B680 8008AA80 8FB00018 */  lw         $s0, 0x18($sp)
/* 8B684 8008AA84 03E00008 */  jr         $ra
/* 8B688 8008AA88 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_drawing_h_arrow
/* 8B68C 8008AA8C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8B690 8008AA90 AFB00010 */  sw         $s0, 0x10($sp)
/* 8B694 8008AA94 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8B698 8008AA98 0C022B25 */  jal        controllerpaksliders_func
/* 8B69C 8008AA9C 00808021 */   addu      $s0, $a0, $zero
/* 8B6A0 8008AAA0 8E020080 */  lw         $v0, 0x80($s0)
/* 8B6A4 8008AAA4 1040000B */  beqz       $v0, .L8008AAD4
/* 8B6A8 8008AAA8 8E02007C */   lw        $v0, 0x7c($s0)
/* 8B6AC 8008AAAC 10400003 */  beqz       $v0, .L8008AABC
/* 8B6B0 8008AAB0 02002021 */   addu      $a0, $s0, $zero
/* 8B6B4 8008AAB4 08022AB0 */  j          .L8008AAC0
/* 8B6B8 8008AAB8 24053756 */   addiu     $a1, $zero, 0x3756
.L8008AABC:
/* 8B6BC 8008AABC 24053757 */  addiu      $a1, $zero, 0x3757
.L8008AAC0:
/* 8B6C0 8008AAC0 24060074 */  addiu      $a2, $zero, 0x74
/* 8B6C4 8008AAC4 0C022C90 */  jal        draw_some_h_arrow
/* 8B6C8 8008AAC8 2407004D */   addiu     $a3, $zero, 0x4d
/* 8B6CC 8008AACC 08022ABC */  j          .L8008AAF0
/* 8B6D0 8008AAD0 8FBF0014 */   lw        $ra, 0x14($sp)
.L8008AAD4:
/* 8B6D4 8008AAD4 10400005 */  beqz       $v0, .L8008AAEC
/* 8B6D8 8008AAD8 02002021 */   addu      $a0, $s0, $zero
/* 8B6DC 8008AADC 24053755 */  addiu      $a1, $zero, 0x3755
/* 8B6E0 8008AAE0 24060074 */  addiu      $a2, $zero, 0x74
/* 8B6E4 8008AAE4 0C022C90 */  jal        draw_some_h_arrow
/* 8B6E8 8008AAE8 2407004D */   addiu     $a3, $zero, 0x4d
.L8008AAEC:
/* 8B6EC 8008AAEC 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008AAF0:
/* 8B6F0 8008AAF0 8FB00010 */  lw         $s0, 0x10($sp)
/* 8B6F4 8008AAF4 03E00008 */  jr         $ra
/* 8B6F8 8008AAF8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel NOOP_8008aafc
/* 8B6FC 8008AAFC 03E00008 */  jr         $ra
/* 8B700 8008AB00 00000000 */   nop

glabel func_drawing_portait
/* 8B704 8008AB04 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 8B708 8008AB08 AFB20060 */  sw         $s2, 0x60($sp)
/* 8B70C 8008AB0C 00809021 */  addu       $s2, $a0, $zero
/* 8B710 8008AB10 AFBF0068 */  sw         $ra, 0x68($sp)
/* 8B714 8008AB14 AFB30064 */  sw         $s3, 0x64($sp)
/* 8B718 8008AB18 AFB1005C */  sw         $s1, 0x5c($sp)
/* 8B71C 8008AB1C AFB00058 */  sw         $s0, 0x58($sp)
/* 8B720 8008AB20 8E420084 */  lw         $v0, 0x84($s2)
/* 8B724 8008AB24 00A09821 */  addu       $s3, $a1, $zero
/* 8B728 8008AB28 8C430004 */  lw         $v1, 4($v0)
/* 8B72C 8008AB2C 00132040 */  sll        $a0, $s3, 1
/* 8B730 8008AB30 00641821 */  addu       $v1, $v1, $a0
/* 8B734 8008AB34 94650004 */  lhu        $a1, 4($v1)
/* 8B738 8008AB38 10A0004E */  beqz       $a1, .L8008AC74
/* 8B73C 8008AB3C 27A80018 */   addiu     $t0, $sp, 0x18
/* 8B740 8008AB40 01008821 */  addu       $s1, $t0, $zero
/* 8B744 8008AB44 27A80020 */  addiu      $t0, $sp, 0x20
/* 8B748 8008AB48 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 8B74C 8008AB4C 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 8B750 8008AB50 96430064 */  lhu        $v1, 0x64($s2)
/* 8B754 8008AB54 96460068 */  lhu        $a2, 0x68($s2)
/* 8B758 8008AB58 24620006 */  addiu      $v0, $v1, 6
/* 8B75C 8008AB5C 24C7006D */  addiu      $a3, $a2, 0x6d
/* 8B760 8008AB60 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8B764 8008AB64 A7A20018 */  sh         $v0, 0x18($sp)
/* 8B768 8008AB68 2462002E */  addiu      $v0, $v1, 0x2e
/* 8B76C 8008AB6C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8B770 8008AB70 24C60095 */  addiu      $a2, $a2, 0x95
/* 8B774 8008AB74 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8B778 8008AB78 A6220004 */  sh         $v0, 4($s1)
/* 8B77C 8008AB7C 2462003D */  addiu      $v0, $v1, 0x3d
/* 8B780 8008AB80 A6270002 */  sh         $a3, 2($s1)
/* 8B784 8008AB84 A6260006 */  sh         $a2, 6($s1)
/* 8B788 8008AB88 A7A20020 */  sh         $v0, 0x20($sp)
/* 8B78C 8008AB8C 24620065 */  addiu      $v0, $v1, 0x65
/* 8B790 8008AB90 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8B794 8008AB94 A5070002 */  sh         $a3, 2($t0)
/* 8B798 8008AB98 A5020004 */  sh         $v0, 4($t0)
/* 8B79C 8008AB9C A5060006 */  sh         $a2, 6($t0)
/* 8B7A0 8008ABA0 27A80028 */  addiu      $t0, $sp, 0x28
/* 8B7A4 8008ABA4 24620074 */  addiu      $v0, $v1, 0x74
/* 8B7A8 8008ABA8 A7A20028 */  sh         $v0, 0x28($sp)
/* 8B7AC 8008ABAC 2462009C */  addiu      $v0, $v1, 0x9c
/* 8B7B0 8008ABB0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8B7B4 8008ABB4 A5070002 */  sh         $a3, 2($t0)
/* 8B7B8 8008ABB8 A5020004 */  sh         $v0, 4($t0)
/* 8B7BC 8008ABBC A5060006 */  sh         $a2, 6($t0)
/* 8B7C0 8008ABC0 27A80030 */  addiu      $t0, $sp, 0x30
/* 8B7C4 8008ABC4 246200AB */  addiu      $v0, $v1, 0xab
/* 8B7C8 8008ABC8 246300D3 */  addiu      $v1, $v1, 0xd3
/* 8B7CC 8008ABCC 3063FFFF */  andi       $v1, $v1, 0xffff
/* 8B7D0 8008ABD0 A7A20030 */  sh         $v0, 0x30($sp)
/* 8B7D4 8008ABD4 A5070002 */  sh         $a3, 2($t0)
/* 8B7D8 8008ABD8 A5030004 */  sh         $v1, 4($t0)
/* 8B7DC 8008ABDC 0C01D531 */  jal        getEntityPortait
/* 8B7E0 8008ABE0 A5060006 */   sh        $a2, 6($t0)
/* 8B7E4 8008ABE4 0C0290E2 */  jal        get_borg_8
/* 8B7E8 8008ABE8 00402021 */   addu      $a0, $v0, $zero
/* 8B7EC 8008ABEC 2404007C */  addiu      $a0, $zero, 0x7c
/* 8B7F0 8008ABF0 0C026259 */  jal        passToMalloc
/* 8B7F4 8008ABF4 00408021 */   addu      $s0, $v0, $zero
/* 8B7F8 8008ABF8 00402021 */  addu       $a0, $v0, $zero
/* 8B7FC 8008ABFC 0C02E518 */  jal        borg8_widget
/* 8B800 8008AC00 02002821 */   addu      $a1, $s0, $zero
/* 8B804 8008AC04 00408021 */  addu       $s0, $v0, $zero
/* 8B808 8008AC08 02002021 */  addu       $a0, $s0, $zero
/* 8B80C 8008AC0C 0C02DD42 */  jal        set_widgetHeight
/* 8B810 8008AC10 24050028 */   addiu     $a1, $zero, 0x28
/* 8B814 8008AC14 02002021 */  addu       $a0, $s0, $zero
/* 8B818 8008AC18 0C02DD46 */  jal        set_widgetWidth
/* 8B81C 8008AC1C 24050028 */   addiu     $a1, $zero, 0x28
/* 8B820 8008AC20 001310C0 */  sll        $v0, $s3, 3
/* 8B824 8008AC24 02228821 */  addu       $s1, $s1, $v0
/* 8B828 8008AC28 96250000 */  lhu        $a1, ($s1)
/* 8B82C 8008AC2C 96260002 */  lhu        $a2, 2($s1)
/* 8B830 8008AC30 96270004 */  lhu        $a3, 4($s1)
/* 8B834 8008AC34 96220006 */  lhu        $v0, 6($s1)
/* 8B838 8008AC38 02002021 */  addu       $a0, $s0, $zero
/* 8B83C 8008AC3C 0C00193A */  jal        func_800064E8
/* 8B840 8008AC40 AFA20010 */   sw        $v0, 0x10($sp)
/* 8B844 8008AC44 96260002 */  lhu        $a2, 2($s1)
/* 8B848 8008AC48 96250000 */  lhu        $a1, ($s1)
/* 8B84C 8008AC4C 0C02DD3F */  jal        set_widget_coords
/* 8B850 8008AC50 02002021 */   addu      $a0, $s0, $zero
/* 8B854 8008AC54 8E430078 */  lw         $v1, 0x78($s2)
/* 8B858 8008AC58 02002821 */  addu       $a1, $s0, $zero
/* 8B85C 8008AC5C 84640030 */  lh         $a0, 0x30($v1)
/* 8B860 8008AC60 8C620034 */  lw         $v0, 0x34($v1)
/* 8B864 8008AC64 0040F809 */  jalr       $v0
/* 8B868 8008AC68 02442021 */   addu      $a0, $s2, $a0
/* 8B86C 8008AC6C 08022B1E */  j          .L8008AC78
/* 8B870 8008AC70 02001021 */   addu      $v0, $s0, $zero
.L8008AC74:
/* 8B874 8008AC74 00001021 */  addu       $v0, $zero, $zero
.L8008AC78:
/* 8B878 8008AC78 8FBF0068 */  lw         $ra, 0x68($sp)
/* 8B87C 8008AC7C 8FB30064 */  lw         $s3, 0x64($sp)
/* 8B880 8008AC80 8FB20060 */  lw         $s2, 0x60($sp)
/* 8B884 8008AC84 8FB1005C */  lw         $s1, 0x5c($sp)
/* 8B888 8008AC88 8FB00058 */  lw         $s0, 0x58($sp)
/* 8B88C 8008AC8C 03E00008 */  jr         $ra
/* 8B890 8008AC90 27BD0070 */   addiu     $sp, $sp, 0x70

glabel controllerpaksliders_func
/* 8B894 8008AC94 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8B898 8008AC98 AFB20028 */  sw         $s2, 0x28($sp)
/* 8B89C 8008AC9C 00809021 */  addu       $s2, $a0, $zero
/* 8B8A0 8008ACA0 AFBF002C */  sw         $ra, 0x2c($sp)
/* 8B8A4 8008ACA4 AFB10024 */  sw         $s1, 0x24($sp)
/* 8B8A8 8008ACA8 AFB00020 */  sw         $s0, 0x20($sp)
/* 8B8AC 8008ACAC 8E420098 */  lw         $v0, 0x98($s2)
/* 8B8B0 8008ACB0 144000AE */  bnez       $v0, .L8008AF6C
/* 8B8B4 8008ACB4 8FBF002C */   lw        $ra, 0x2c($sp)
/* 8B8B8 8008ACB8 24040018 */  addiu      $a0, $zero, 0x18
/* 8B8BC 8008ACBC 3C05800E */  lui        $a1, %hi(D_800E1580)
/* 8B8C0 8008ACC0 24A51580 */  addiu      $a1, $a1, %lo(D_800E1580)
/* 8B8C4 8008ACC4 0C025F9C */  jal        Malloc
/* 8B8C8 8008ACC8 24060083 */   addiu     $a2, $zero, 0x83
/* 8B8CC 8008ACCC 00402021 */  addu       $a0, $v0, $zero
/* 8B8D0 8008ACD0 00002821 */  addu       $a1, $zero, $zero
/* 8B8D4 8008ACD4 24060018 */  addiu      $a2, $zero, 0x18
/* 8B8D8 8008ACD8 0C026380 */  jal        Calloc
/* 8B8DC 8008ACDC AE42008C */   sw        $v0, 0x8c($s2)
/* 8B8E0 8008ACE0 2404007C */  addiu      $a0, $zero, 0x7c
/* 8B8E4 8008ACE4 8E450084 */  lw         $a1, 0x84($s2)
/* 8B8E8 8008ACE8 8E43008C */  lw         $v1, 0x8c($s2)
/* 8B8EC 8008ACEC 8CA60014 */  lw         $a2, 0x14($a1)
/* 8B8F0 8008ACF0 24020040 */  addiu      $v0, $zero, 0x40
/* 8B8F4 8008ACF4 A462000A */  sh         $v0, 0xa($v1)
/* 8B8F8 8008ACF8 24020020 */  addiu      $v0, $zero, 0x20
/* 8B8FC 8008ACFC A462000C */  sh         $v0, 0xc($v1)
/* 8B900 8008AD00 24020002 */  addiu      $v0, $zero, 2
/* 8B904 8008AD04 A4620008 */  sh         $v0, 8($v1)
/* 8B908 8008AD08 0C026259 */  jal        passToMalloc
/* 8B90C 8008AD0C AC660014 */   sw        $a2, 0x14($v1)
/* 8B910 8008AD10 00402021 */  addu       $a0, $v0, $zero
/* 8B914 8008AD14 0C02E518 */  jal        borg8_widget
/* 8B918 8008AD18 00002821 */   addu      $a1, $zero, $zero
/* 8B91C 8008AD1C 00402021 */  addu       $a0, $v0, $zero
/* 8B920 8008AD20 24050068 */  addiu      $a1, $zero, 0x68
/* 8B924 8008AD24 0C02DD42 */  jal        set_widgetHeight
/* 8B928 8008AD28 AE420088 */   sw        $v0, 0x88($s2)
/* 8B92C 8008AD2C 8E440088 */  lw         $a0, 0x88($s2)
/* 8B930 8008AD30 0C02DD46 */  jal        set_widgetWidth
/* 8B934 8008AD34 2405004E */   addiu     $a1, $zero, 0x4e
/* 8B938 8008AD38 96450064 */  lhu        $a1, 0x64($s2)
/* 8B93C 8008AD3C 8E440088 */  lw         $a0, 0x88($s2)
/* 8B940 8008AD40 96460068 */  lhu        $a2, 0x68($s2)
/* 8B944 8008AD44 96470066 */  lhu        $a3, 0x66($s2)
/* 8B948 8008AD48 9642006A */  lhu        $v0, 0x6a($s2)
/* 8B94C 8008AD4C 24A50006 */  addiu      $a1, $a1, 6
/* 8B950 8008AD50 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 8B954 8008AD54 24C6001C */  addiu      $a2, $a2, 0x1c
/* 8B958 8008AD58 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8B95C 8008AD5C 0C00193A */  jal        func_800064E8
/* 8B960 8008AD60 AFA20010 */   sw        $v0, 0x10($sp)
/* 8B964 8008AD64 8E440088 */  lw         $a0, 0x88($s2)
/* 8B968 8008AD68 86450064 */  lh         $a1, 0x64($s2)
/* 8B96C 8008AD6C 86460068 */  lh         $a2, 0x68($s2)
/* 8B970 8008AD70 24A50006 */  addiu      $a1, $a1, 6
/* 8B974 8008AD74 0C02DD3F */  jal        set_widget_coords
/* 8B978 8008AD78 24C6001C */   addiu     $a2, $a2, 0x1c
/* 8B97C 8008AD7C 8E430078 */  lw         $v1, 0x78($s2)
/* 8B980 8008AD80 8E450088 */  lw         $a1, 0x88($s2)
/* 8B984 8008AD84 84640030 */  lh         $a0, 0x30($v1)
/* 8B988 8008AD88 8C620034 */  lw         $v0, 0x34($v1)
/* 8B98C 8008AD8C 0040F809 */  jalr       $v0
/* 8B990 8008AD90 02442021 */   addu      $a0, $s2, $a0
/* 8B994 8008AD94 02402021 */  addu       $a0, $s2, $zero
/* 8B998 8008AD98 24110100 */  addiu      $s1, $zero, 0x100
/* 8B99C 8008AD9C 96460064 */  lhu        $a2, 0x64($s2)
/* 8B9A0 8008ADA0 96470068 */  lhu        $a3, 0x68($s2)
/* 8B9A4 8008ADA4 8E420084 */  lw         $v0, 0x84($s2)
/* 8B9A8 8008ADA8 96430066 */  lhu        $v1, 0x66($s2)
/* 8B9AC 8008ADAC 24C60074 */  addiu      $a2, $a2, 0x74
/* 8B9B0 8008ADB0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8B9B4 8008ADB4 24E70057 */  addiu      $a3, $a3, 0x57
/* 8B9B8 8008ADB8 8C450004 */  lw         $a1, 4($v0)
/* 8B9BC 8008ADBC 9642006A */  lhu        $v0, 0x6a($s2)
/* 8B9C0 8008ADC0 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8B9C4 8008ADC4 AFA30010 */  sw         $v1, 0x10($sp)
/* 8B9C8 8008ADC8 AFB10018 */  sw         $s1, 0x18($sp)
/* 8B9CC 8008ADCC 24A5000C */  addiu      $a1, $a1, 0xc
/* 8B9D0 8008ADD0 0C02F367 */  jal        func_800BCD9C
/* 8B9D4 8008ADD4 AFA20014 */   sw        $v0, 0x14($sp)
/* 8B9D8 8008ADD8 924500B4 */  lbu        $a1, 0xb4($s2)
/* 8B9DC 8008ADDC 924600B5 */  lbu        $a2, 0xb5($s2)
/* 8B9E0 8008ADE0 8C490078 */  lw         $t1, 0x78($v0)
/* 8B9E4 8008ADE4 924700B6 */  lbu        $a3, 0xb6($s2)
/* 8B9E8 8008ADE8 924300B7 */  lbu        $v1, 0xb7($s2)
/* 8B9EC 8008ADEC AE420090 */  sw         $v0, 0x90($s2)
/* 8B9F0 8008ADF0 85240048 */  lh         $a0, 0x48($t1)
/* 8B9F4 8008ADF4 AFA30010 */  sw         $v1, 0x10($sp)
/* 8B9F8 8008ADF8 8D28004C */  lw         $t0, 0x4c($t1)
/* 8B9FC 8008ADFC 0100F809 */  jalr       $t0
/* 8BA00 8008AE00 00442021 */   addu      $a0, $v0, $a0
/* 8BA04 8008AE04 8E420084 */  lw         $v0, 0x84($s2)
/* 8BA08 8008AE08 8C440004 */  lw         $a0, 4($v0)
/* 8BA0C 8008AE0C 3C03026D */  lui        $v1, 0x26d
/* 8BA10 8008AE10 8C870000 */  lw         $a3, ($a0)
/* 8BA14 8008AE14 346360DD */  ori        $v1, $v1, 0x60dd
/* 8BA18 8008AE18 00071182 */  srl        $v0, $a3, 6
/* 8BA1C 8008AE1C 00430019 */  multu      $v0, $v1
/* 8BA20 8008AE20 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 8BA24 8008AE24 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 8BA28 8008AE28 3C0991A2 */  lui        $t1, 0x91a2
/* 8BA2C 8008AE2C 3529B3C5 */  ori        $t1, $t1, 0xb3c5
/* 8BA30 8008AE30 3C058888 */  lui        $a1, 0x8888
/* 8BA34 8008AE34 34A58889 */  ori        $a1, $a1, 0x8889
/* 8BA38 8008AE38 00001010 */  mfhi       $v0
/* 8BA3C 8008AE3C 00021142 */  srl        $v0, $v0, 5
/* 8BA40 8008AE40 3046FFFF */  andi       $a2, $v0, 0xffff
/* 8BA44 8008AE44 00E90019 */  multu      $a3, $t1
/* 8BA48 8008AE48 000240C0 */  sll        $t0, $v0, 3
/* 8BA4C 8008AE4C 01024023 */  subu       $t0, $t0, $v0
/* 8BA50 8008AE50 00084140 */  sll        $t0, $t0, 5
/* 8BA54 8008AE54 01024021 */  addu       $t0, $t0, $v0
/* 8BA58 8008AE58 00001810 */  mfhi       $v1
/* 8BA5C 8008AE5C 00031AC2 */  srl        $v1, $v1, 0xb
/* 8BA60 8008AE60 000310C0 */  sll        $v0, $v1, 3
/* 8BA64 8008AE64 00431023 */  subu       $v0, $v0, $v1
/* 8BA68 8008AE68 00021140 */  sll        $v0, $v0, 5
/* 8BA6C 8008AE6C 00431021 */  addu       $v0, $v0, $v1
/* 8BA70 8008AE70 00021100 */  sll        $v0, $v0, 4
/* 8BA74 8008AE74 00E21023 */  subu       $v0, $a3, $v0
/* 8BA78 8008AE78 00450019 */  multu      $v0, $a1
/* 8BA7C 8008AE7C 02002021 */  addu       $a0, $s0, $zero
/* 8BA80 8008AE80 00081900 */  sll        $v1, $t0, 4
/* 8BA84 8008AE84 00681823 */  subu       $v1, $v1, $t0
/* 8BA88 8008AE88 00031980 */  sll        $v1, $v1, 6
/* 8BA8C 8008AE8C 00001010 */  mfhi       $v0
/* 8BA90 8008AE90 00E33823 */  subu       $a3, $a3, $v1
/* 8BA94 8008AE94 8E03FFD4 */  lw         $v1, -0x2c($s0)
/* 8BA98 8008AE98 00E90019 */  multu      $a3, $t1
/* 8BA9C 8008AE9C 00021142 */  srl        $v0, $v0, 5
/* 8BAA0 8008AEA0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8BAA4 8008AEA4 AFA20010 */  sw         $v0, 0x10($sp)
/* 8BAA8 8008AEA8 8C650784 */  lw         $a1, 0x784($v1)
/* 8BAAC 8008AEAC 00003810 */  mfhi       $a3
/* 8BAB0 8008AEB0 00073AC2 */  srl        $a3, $a3, 0xb
/* 8BAB4 8008AEB4 0C0333AC */  jal        sprintf
/* 8BAB8 8008AEB8 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 8BABC 8008AEBC 02402021 */  addu       $a0, $s2, $zero
/* 8BAC0 8008AEC0 96460064 */  lhu        $a2, 0x64($s2)
/* 8BAC4 8008AEC4 02002821 */  addu       $a1, $s0, $zero
/* 8BAC8 8008AEC8 AFB10018 */  sw         $s1, 0x18($sp)
/* 8BACC 8008AECC 96470068 */  lhu        $a3, 0x68($s2)
/* 8BAD0 8008AED0 96420066 */  lhu        $v0, 0x66($s2)
/* 8BAD4 8008AED4 9643006A */  lhu        $v1, 0x6a($s2)
/* 8BAD8 8008AED8 24C60074 */  addiu      $a2, $a2, 0x74
/* 8BADC 8008AEDC 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8BAE0 8008AEE0 24E70062 */  addiu      $a3, $a3, 0x62
/* 8BAE4 8008AEE4 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8BAE8 8008AEE8 AFA20010 */  sw         $v0, 0x10($sp)
/* 8BAEC 8008AEEC 0C02F367 */  jal        func_800BCD9C
/* 8BAF0 8008AEF0 AFA30014 */   sw        $v1, 0x14($sp)
/* 8BAF4 8008AEF4 924500B4 */  lbu        $a1, 0xb4($s2)
/* 8BAF8 8008AEF8 924600B5 */  lbu        $a2, 0xb5($s2)
/* 8BAFC 8008AEFC 8C490078 */  lw         $t1, 0x78($v0)
/* 8BB00 8008AF00 924700B6 */  lbu        $a3, 0xb6($s2)
/* 8BB04 8008AF04 924300B7 */  lbu        $v1, 0xb7($s2)
/* 8BB08 8008AF08 AE420094 */  sw         $v0, 0x94($s2)
/* 8BB0C 8008AF0C 85240048 */  lh         $a0, 0x48($t1)
/* 8BB10 8008AF10 AFA30010 */  sw         $v1, 0x10($sp)
/* 8BB14 8008AF14 8D28004C */  lw         $t0, 0x4c($t1)
/* 8BB18 8008AF18 0100F809 */  jalr       $t0
/* 8BB1C 8008AF1C 00442021 */   addu      $a0, $v0, $a0
/* 8BB20 8008AF20 02402021 */  addu       $a0, $s2, $zero
/* 8BB24 8008AF24 0C022AC1 */  jal        func_drawing_portait
/* 8BB28 8008AF28 00002821 */   addu      $a1, $zero, $zero
/* 8BB2C 8008AF2C 02402021 */  addu       $a0, $s2, $zero
/* 8BB30 8008AF30 24050001 */  addiu      $a1, $zero, 1
/* 8BB34 8008AF34 0C022AC1 */  jal        func_drawing_portait
/* 8BB38 8008AF38 AE42009C */   sw        $v0, 0x9c($s2)
/* 8BB3C 8008AF3C 02402021 */  addu       $a0, $s2, $zero
/* 8BB40 8008AF40 24050002 */  addiu      $a1, $zero, 2
/* 8BB44 8008AF44 0C022AC1 */  jal        func_drawing_portait
/* 8BB48 8008AF48 AE4200A0 */   sw        $v0, 0xa0($s2)
/* 8BB4C 8008AF4C 02402021 */  addu       $a0, $s2, $zero
/* 8BB50 8008AF50 24050003 */  addiu      $a1, $zero, 3
/* 8BB54 8008AF54 0C022AC1 */  jal        func_drawing_portait
/* 8BB58 8008AF58 AE4200A4 */   sw        $v0, 0xa4($s2)
/* 8BB5C 8008AF5C AE4200A8 */  sw         $v0, 0xa8($s2)
/* 8BB60 8008AF60 24020001 */  addiu      $v0, $zero, 1
/* 8BB64 8008AF64 AE420098 */  sw         $v0, 0x98($s2)
/* 8BB68 8008AF68 8FBF002C */  lw         $ra, 0x2c($sp)
.L8008AF6C:
/* 8BB6C 8008AF6C 8FB20028 */  lw         $s2, 0x28($sp)
/* 8BB70 8008AF70 8FB10024 */  lw         $s1, 0x24($sp)
/* 8BB74 8008AF74 8FB00020 */  lw         $s0, 0x20($sp)
/* 8BB78 8008AF78 03E00008 */  jr         $ra
/* 8BB7C 8008AF7C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel controllerpaksliders_free
/* 8BB80 8008AF80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8BB84 8008AF84 AFB00010 */  sw         $s0, 0x10($sp)
/* 8BB88 8008AF88 00808021 */  addu       $s0, $a0, $zero
/* 8BB8C 8008AF8C AFBF0014 */  sw         $ra, 0x14($sp)
/* 8BB90 8008AF90 8E020098 */  lw         $v0, 0x98($s0)
/* 8BB94 8008AF94 104000A6 */  beqz       $v0, .L8008B230
/* 8BB98 8008AF98 3C05800E */   lui       $a1, %hi(D_800E1580)
/* 8BB9C 8008AF9C 24A51580 */  addiu      $a1, $a1, %lo(D_800E1580)
/* 8BBA0 8008AFA0 8E04008C */  lw         $a0, 0x8c($s0)
/* 8BBA4 8008AFA4 0C02600C */  jal        Free
/* 8BBA8 8008AFA8 240600AE */   addiu     $a2, $zero, 0xae
/* 8BBAC 8008AFAC 8E050088 */  lw         $a1, 0x88($s0)
/* 8BBB0 8008AFB0 8E030078 */  lw         $v1, 0x78($s0)
/* 8BBB4 8008AFB4 AE00008C */  sw         $zero, 0x8c($s0)
/* 8BBB8 8008AFB8 84640038 */  lh         $a0, 0x38($v1)
/* 8BBBC 8008AFBC 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BBC0 8008AFC0 0040F809 */  jalr       $v0
/* 8BBC4 8008AFC4 02042021 */   addu      $a0, $s0, $a0
/* 8BBC8 8008AFC8 8E060088 */  lw         $a2, 0x88($s0)
/* 8BBCC 8008AFCC 10C00006 */  beqz       $a2, .L8008AFE8
/* 8BBD0 8008AFD0 24050003 */   addiu     $a1, $zero, 3
/* 8BBD4 8008AFD4 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BBD8 8008AFD8 84440008 */  lh         $a0, 8($v0)
/* 8BBDC 8008AFDC 8C43000C */  lw         $v1, 0xc($v0)
/* 8BBE0 8008AFE0 0060F809 */  jalr       $v1
/* 8BBE4 8008AFE4 00C42021 */   addu      $a0, $a2, $a0
.L8008AFE8:
/* 8BBE8 8008AFE8 8E050090 */  lw         $a1, 0x90($s0)
/* 8BBEC 8008AFEC 8E030078 */  lw         $v1, 0x78($s0)
/* 8BBF0 8008AFF0 AE000088 */  sw         $zero, 0x88($s0)
/* 8BBF4 8008AFF4 84640038 */  lh         $a0, 0x38($v1)
/* 8BBF8 8008AFF8 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BBFC 8008AFFC 0040F809 */  jalr       $v0
/* 8BC00 8008B000 02042021 */   addu      $a0, $s0, $a0
/* 8BC04 8008B004 8E060090 */  lw         $a2, 0x90($s0)
/* 8BC08 8008B008 10C00006 */  beqz       $a2, .L8008B024
/* 8BC0C 8008B00C 24050003 */   addiu     $a1, $zero, 3
/* 8BC10 8008B010 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BC14 8008B014 84440008 */  lh         $a0, 8($v0)
/* 8BC18 8008B018 8C43000C */  lw         $v1, 0xc($v0)
/* 8BC1C 8008B01C 0060F809 */  jalr       $v1
/* 8BC20 8008B020 00C42021 */   addu      $a0, $a2, $a0
.L8008B024:
/* 8BC24 8008B024 8E050094 */  lw         $a1, 0x94($s0)
/* 8BC28 8008B028 8E030078 */  lw         $v1, 0x78($s0)
/* 8BC2C 8008B02C AE000090 */  sw         $zero, 0x90($s0)
/* 8BC30 8008B030 84640038 */  lh         $a0, 0x38($v1)
/* 8BC34 8008B034 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BC38 8008B038 0040F809 */  jalr       $v0
/* 8BC3C 8008B03C 02042021 */   addu      $a0, $s0, $a0
/* 8BC40 8008B040 8E060094 */  lw         $a2, 0x94($s0)
/* 8BC44 8008B044 10C00006 */  beqz       $a2, .L8008B060
/* 8BC48 8008B048 24050003 */   addiu     $a1, $zero, 3
/* 8BC4C 8008B04C 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BC50 8008B050 84440008 */  lh         $a0, 8($v0)
/* 8BC54 8008B054 8C43000C */  lw         $v1, 0xc($v0)
/* 8BC58 8008B058 0060F809 */  jalr       $v1
/* 8BC5C 8008B05C 00C42021 */   addu      $a0, $a2, $a0
.L8008B060:
/* 8BC60 8008B060 8E05009C */  lw         $a1, 0x9c($s0)
/* 8BC64 8008B064 10A00016 */  beqz       $a1, .L8008B0C0
/* 8BC68 8008B068 AE000094 */   sw        $zero, 0x94($s0)
/* 8BC6C 8008B06C 8E030078 */  lw         $v1, 0x78($s0)
/* 8BC70 8008B070 84640038 */  lh         $a0, 0x38($v1)
/* 8BC74 8008B074 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BC78 8008B078 0040F809 */  jalr       $v0
/* 8BC7C 8008B07C 02042021 */   addu      $a0, $s0, $a0
/* 8BC80 8008B080 3C04800E */  lui        $a0, %hi(queueStructA)
/* 8BC84 8008B084 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 8BC88 8008B088 24060004 */  addiu      $a2, $zero, 4
/* 8BC8C 8008B08C 8E05009C */  lw         $a1, 0x9c($s0)
/* 8BC90 8008B090 00003821 */  addu       $a3, $zero, $zero
/* 8BC94 8008B094 0C035867 */  jal        AllocFreeQueueItem
/* 8BC98 8008B098 24A5006C */   addiu     $a1, $a1, 0x6c
/* 8BC9C 8008B09C 8E06009C */  lw         $a2, 0x9c($s0)
/* 8BCA0 8008B0A0 10C00006 */  beqz       $a2, .L8008B0BC
/* 8BCA4 8008B0A4 24050003 */   addiu     $a1, $zero, 3
/* 8BCA8 8008B0A8 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BCAC 8008B0AC 84440008 */  lh         $a0, 8($v0)
/* 8BCB0 8008B0B0 8C43000C */  lw         $v1, 0xc($v0)
/* 8BCB4 8008B0B4 0060F809 */  jalr       $v1
/* 8BCB8 8008B0B8 00C42021 */   addu      $a0, $a2, $a0
.L8008B0BC:
/* 8BCBC 8008B0BC AE00009C */  sw         $zero, 0x9c($s0)
.L8008B0C0:
/* 8BCC0 8008B0C0 8E0500A0 */  lw         $a1, 0xa0($s0)
/* 8BCC4 8008B0C4 50A00017 */  beql       $a1, $zero, .L8008B124
/* 8BCC8 8008B0C8 8E0500A4 */   lw        $a1, 0xa4($s0)
/* 8BCCC 8008B0CC 8E030078 */  lw         $v1, 0x78($s0)
/* 8BCD0 8008B0D0 84640038 */  lh         $a0, 0x38($v1)
/* 8BCD4 8008B0D4 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BCD8 8008B0D8 0040F809 */  jalr       $v0
/* 8BCDC 8008B0DC 02042021 */   addu      $a0, $s0, $a0
/* 8BCE0 8008B0E0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 8BCE4 8008B0E4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 8BCE8 8008B0E8 24060004 */  addiu      $a2, $zero, 4
/* 8BCEC 8008B0EC 8E0500A0 */  lw         $a1, 0xa0($s0)
/* 8BCF0 8008B0F0 00003821 */  addu       $a3, $zero, $zero
/* 8BCF4 8008B0F4 0C035867 */  jal        AllocFreeQueueItem
/* 8BCF8 8008B0F8 24A5006C */   addiu     $a1, $a1, 0x6c
/* 8BCFC 8008B0FC 8E0600A0 */  lw         $a2, 0xa0($s0)
/* 8BD00 8008B100 10C00006 */  beqz       $a2, .L8008B11C
/* 8BD04 8008B104 24050003 */   addiu     $a1, $zero, 3
/* 8BD08 8008B108 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BD0C 8008B10C 84440008 */  lh         $a0, 8($v0)
/* 8BD10 8008B110 8C43000C */  lw         $v1, 0xc($v0)
/* 8BD14 8008B114 0060F809 */  jalr       $v1
/* 8BD18 8008B118 00C42021 */   addu      $a0, $a2, $a0
.L8008B11C:
/* 8BD1C 8008B11C AE0000A0 */  sw         $zero, 0xa0($s0)
/* 8BD20 8008B120 8E0500A4 */  lw         $a1, 0xa4($s0)
.L8008B124:
/* 8BD24 8008B124 50A00017 */  beql       $a1, $zero, .L8008B184
/* 8BD28 8008B128 8E0500A8 */   lw        $a1, 0xa8($s0)
/* 8BD2C 8008B12C 8E030078 */  lw         $v1, 0x78($s0)
/* 8BD30 8008B130 84640038 */  lh         $a0, 0x38($v1)
/* 8BD34 8008B134 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BD38 8008B138 0040F809 */  jalr       $v0
/* 8BD3C 8008B13C 02042021 */   addu      $a0, $s0, $a0
/* 8BD40 8008B140 3C04800E */  lui        $a0, %hi(queueStructA)
/* 8BD44 8008B144 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 8BD48 8008B148 24060004 */  addiu      $a2, $zero, 4
/* 8BD4C 8008B14C 8E0500A4 */  lw         $a1, 0xa4($s0)
/* 8BD50 8008B150 00003821 */  addu       $a3, $zero, $zero
/* 8BD54 8008B154 0C035867 */  jal        AllocFreeQueueItem
/* 8BD58 8008B158 24A5006C */   addiu     $a1, $a1, 0x6c
/* 8BD5C 8008B15C 8E0600A4 */  lw         $a2, 0xa4($s0)
/* 8BD60 8008B160 10C00006 */  beqz       $a2, .L8008B17C
/* 8BD64 8008B164 24050003 */   addiu     $a1, $zero, 3
/* 8BD68 8008B168 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BD6C 8008B16C 84440008 */  lh         $a0, 8($v0)
/* 8BD70 8008B170 8C43000C */  lw         $v1, 0xc($v0)
/* 8BD74 8008B174 0060F809 */  jalr       $v1
/* 8BD78 8008B178 00C42021 */   addu      $a0, $a2, $a0
.L8008B17C:
/* 8BD7C 8008B17C AE0000A4 */  sw         $zero, 0xa4($s0)
/* 8BD80 8008B180 8E0500A8 */  lw         $a1, 0xa8($s0)
.L8008B184:
/* 8BD84 8008B184 50A00017 */  beql       $a1, $zero, .L8008B1E4
/* 8BD88 8008B188 8E0500B8 */   lw        $a1, 0xb8($s0)
/* 8BD8C 8008B18C 8E030078 */  lw         $v1, 0x78($s0)
/* 8BD90 8008B190 84640038 */  lh         $a0, 0x38($v1)
/* 8BD94 8008B194 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BD98 8008B198 0040F809 */  jalr       $v0
/* 8BD9C 8008B19C 02042021 */   addu      $a0, $s0, $a0
/* 8BDA0 8008B1A0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 8BDA4 8008B1A4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 8BDA8 8008B1A8 24060004 */  addiu      $a2, $zero, 4
/* 8BDAC 8008B1AC 8E0500A8 */  lw         $a1, 0xa8($s0)
/* 8BDB0 8008B1B0 00003821 */  addu       $a3, $zero, $zero
/* 8BDB4 8008B1B4 0C035867 */  jal        AllocFreeQueueItem
/* 8BDB8 8008B1B8 24A5006C */   addiu     $a1, $a1, 0x6c
/* 8BDBC 8008B1BC 8E0600A8 */  lw         $a2, 0xa8($s0)
/* 8BDC0 8008B1C0 10C00006 */  beqz       $a2, .L8008B1DC
/* 8BDC4 8008B1C4 24050003 */   addiu     $a1, $zero, 3
/* 8BDC8 8008B1C8 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BDCC 8008B1CC 84440008 */  lh         $a0, 8($v0)
/* 8BDD0 8008B1D0 8C43000C */  lw         $v1, 0xc($v0)
/* 8BDD4 8008B1D4 0060F809 */  jalr       $v1
/* 8BDD8 8008B1D8 00C42021 */   addu      $a0, $a2, $a0
.L8008B1DC:
/* 8BDDC 8008B1DC AE00009C */  sw         $zero, 0x9c($s0)
/* 8BDE0 8008B1E0 8E0500B8 */  lw         $a1, 0xb8($s0)
.L8008B1E4:
/* 8BDE4 8008B1E4 50A00012 */  beql       $a1, $zero, .L8008B230
/* 8BDE8 8008B1E8 AE000098 */   sw        $zero, 0x98($s0)
/* 8BDEC 8008B1EC 8E030078 */  lw         $v1, 0x78($s0)
/* 8BDF0 8008B1F0 84640038 */  lh         $a0, 0x38($v1)
/* 8BDF4 8008B1F4 8C62003C */  lw         $v0, 0x3c($v1)
/* 8BDF8 8008B1F8 0040F809 */  jalr       $v0
/* 8BDFC 8008B1FC 02042021 */   addu      $a0, $s0, $a0
/* 8BE00 8008B200 0C0133E5 */  jal        free_borg8_widget
/* 8BE04 8008B204 8E0400B8 */   lw        $a0, 0xb8($s0)
/* 8BE08 8008B208 8E0600B8 */  lw         $a2, 0xb8($s0)
/* 8BE0C 8008B20C 10C00006 */  beqz       $a2, .L8008B228
/* 8BE10 8008B210 24050003 */   addiu     $a1, $zero, 3
/* 8BE14 8008B214 8CC20078 */  lw         $v0, 0x78($a2)
/* 8BE18 8008B218 84440008 */  lh         $a0, 8($v0)
/* 8BE1C 8008B21C 8C43000C */  lw         $v1, 0xc($v0)
/* 8BE20 8008B220 0060F809 */  jalr       $v1
/* 8BE24 8008B224 00C42021 */   addu      $a0, $a2, $a0
.L8008B228:
/* 8BE28 8008B228 AE0000B8 */  sw         $zero, 0xb8($s0)
/* 8BE2C 8008B22C AE000098 */  sw         $zero, 0x98($s0)
.L8008B230:
/* 8BE30 8008B230 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8BE34 8008B234 8FB00010 */  lw         $s0, 0x10($sp)
/* 8BE38 8008B238 03E00008 */  jr         $ra
/* 8BE3C 8008B23C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel draw_some_h_arrow
/* 8BE40 8008B240 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8BE44 8008B244 AFB00018 */  sw         $s0, 0x18($sp)
/* 8BE48 8008B248 00808021 */  addu       $s0, $a0, $zero
/* 8BE4C 8008B24C 00A02021 */  addu       $a0, $a1, $zero
/* 8BE50 8008B250 00063400 */  sll        $a2, $a2, 0x10
/* 8BE54 8008B254 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8BE58 8008B258 00068C03 */  sra        $s1, $a2, 0x10
/* 8BE5C 8008B25C 00073C00 */  sll        $a3, $a3, 0x10
/* 8BE60 8008B260 AFBF0024 */  sw         $ra, 0x24($sp)
/* 8BE64 8008B264 AFB20020 */  sw         $s2, 0x20($sp)
/* 8BE68 8008B268 8E0200B8 */  lw         $v0, 0xb8($s0)
/* 8BE6C 8008B26C 1440001E */  bnez       $v0, .L8008B2E8
/* 8BE70 8008B270 00079403 */   sra       $s2, $a3, 0x10
/* 8BE74 8008B274 0C0290E2 */  jal        get_borg_8
/* 8BE78 8008B278 00000000 */   nop
/* 8BE7C 8008B27C 02002021 */  addu       $a0, $s0, $zero
/* 8BE80 8008B280 00402821 */  addu       $a1, $v0, $zero
/* 8BE84 8008B284 96060064 */  lhu        $a2, 0x64($s0)
/* 8BE88 8008B288 96070068 */  lhu        $a3, 0x68($s0)
/* 8BE8C 8008B28C 02263021 */  addu       $a2, $s1, $a2
/* 8BE90 8008B290 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 8BE94 8008B294 02473821 */  addu       $a3, $s2, $a3
/* 8BE98 8008B298 0C02F3E9 */  jal        func_800BCFA4
/* 8BE9C 8008B29C 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 8BEA0 8008B2A0 920500B4 */  lbu        $a1, 0xb4($s0)
/* 8BEA4 8008B2A4 920600B5 */  lbu        $a2, 0xb5($s0)
/* 8BEA8 8008B2A8 8C490078 */  lw         $t1, 0x78($v0)
/* 8BEAC 8008B2AC 920700B6 */  lbu        $a3, 0xb6($s0)
/* 8BEB0 8008B2B0 920300B7 */  lbu        $v1, 0xb7($s0)
/* 8BEB4 8008B2B4 AE0200B8 */  sw         $v0, 0xb8($s0)
/* 8BEB8 8008B2B8 85240048 */  lh         $a0, 0x48($t1)
/* 8BEBC 8008B2BC AFA30010 */  sw         $v1, 0x10($sp)
/* 8BEC0 8008B2C0 8D28004C */  lw         $t0, 0x4c($t1)
/* 8BEC4 8008B2C4 0100F809 */  jalr       $t0
/* 8BEC8 8008B2C8 00442021 */   addu      $a0, $v0, $a0
/* 8BECC 8008B2CC 9602006A */  lhu        $v0, 0x6a($s0)
/* 8BED0 8008B2D0 8E0400B8 */  lw         $a0, 0xb8($s0)
/* 8BED4 8008B2D4 96050064 */  lhu        $a1, 0x64($s0)
/* 8BED8 8008B2D8 96060068 */  lhu        $a2, 0x68($s0)
/* 8BEDC 8008B2DC 96070066 */  lhu        $a3, 0x66($s0)
/* 8BEE0 8008B2E0 0C00193A */  jal        func_800064E8
/* 8BEE4 8008B2E4 AFA20010 */   sw        $v0, 0x10($sp)
.L8008B2E8:
/* 8BEE8 8008B2E8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 8BEEC 8008B2EC 8FB20020 */  lw         $s2, 0x20($sp)
/* 8BEF0 8008B2F0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8BEF4 8008B2F4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8BEF8 8008B2F8 03E00008 */  jr         $ra
/* 8BEFC 8008B2FC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008B300
/* 8BF00 8008B300 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 8BF04 8008B304 AFB40028 */  sw         $s4, 0x28($sp)
/* 8BF08 8008B308 97B4004A */  lhu        $s4, 0x4a($sp)
/* 8BF0C 8008B30C AFB00018 */  sw         $s0, 0x18($sp)
/* 8BF10 8008B310 00808021 */  addu       $s0, $a0, $zero
/* 8BF14 8008B314 AFB5002C */  sw         $s5, 0x2c($sp)
/* 8BF18 8008B318 97B5004E */  lhu        $s5, 0x4e($sp)
/* 8BF1C 8008B31C AFB30024 */  sw         $s3, 0x24($sp)
/* 8BF20 8008B320 00A09821 */  addu       $s3, $a1, $zero
/* 8BF24 8008B324 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8BF28 8008B328 00C08821 */  addu       $s1, $a2, $zero
/* 8BF2C 8008B32C AFB20020 */  sw         $s2, 0x20($sp)
/* 8BF30 8008B330 AFBF0030 */  sw         $ra, 0x30($sp)
/* 8BF34 8008B334 0C02E658 */  jal        widget_menu_build
/* 8BF38 8008B338 00E09021 */   addu      $s2, $a3, $zero
/* 8BF3C 8008B33C 3C02800E */  lui        $v0, %hi(D_800E15A0)
/* 8BF40 8008B340 96230000 */  lhu        $v1, ($s1)
/* 8BF44 8008B344 96240002 */  lhu        $a0, 2($s1)
/* 8BF48 8008B348 96250004 */  lhu        $a1, 4($s1)
/* 8BF4C 8008B34C 96260006 */  lhu        $a2, 6($s1)
/* 8BF50 8008B350 244215A0 */  addiu      $v0, $v0, %lo(D_800E15A0)
/* 8BF54 8008B354 AE020078 */  sw         $v0, 0x78($s0)
/* 8BF58 8008B358 2602008C */  addiu      $v0, $s0, 0x8c
/* 8BF5C 8008B35C AE00007C */  sw         $zero, 0x7c($s0)
/* 8BF60 8008B360 AE000080 */  sw         $zero, 0x80($s0)
/* 8BF64 8008B364 AE000084 */  sw         $zero, 0x84($s0)
/* 8BF68 8008B368 AE130088 */  sw         $s3, 0x88($s0)
/* 8BF6C 8008B36C A603008C */  sh         $v1, 0x8c($s0)
/* 8BF70 8008B370 A4440002 */  sh         $a0, 2($v0)
/* 8BF74 8008B374 A4450004 */  sh         $a1, 4($v0)
/* 8BF78 8008B378 A4460006 */  sh         $a2, 6($v0)
/* 8BF7C 8008B37C 92430000 */  lbu        $v1, ($s2)
/* 8BF80 8008B380 92440001 */  lbu        $a0, 1($s2)
/* 8BF84 8008B384 92450002 */  lbu        $a1, 2($s2)
/* 8BF88 8008B388 92460003 */  lbu        $a2, 3($s2)
/* 8BF8C 8008B38C 26020094 */  addiu      $v0, $s0, 0x94
/* 8BF90 8008B390 A2030094 */  sb         $v1, 0x94($s0)
/* 8BF94 8008B394 A0440001 */  sb         $a0, 1($v0)
/* 8BF98 8008B398 A0450002 */  sb         $a1, 2($v0)
/* 8BF9C 8008B39C A0460003 */  sb         $a2, 3($v0)
/* 8BFA0 8008B3A0 9605008C */  lhu        $a1, 0x8c($s0)
/* 8BFA4 8008B3A4 9606008E */  lhu        $a2, 0x8e($s0)
/* 8BFA8 8008B3A8 96070090 */  lhu        $a3, 0x90($s0)
/* 8BFAC 8008B3AC 96020092 */  lhu        $v0, 0x92($s0)
/* 8BFB0 8008B3B0 02002021 */  addu       $a0, $s0, $zero
/* 8BFB4 8008B3B4 A6140098 */  sh         $s4, 0x98($s0)
/* 8BFB8 8008B3B8 A615009A */  sh         $s5, 0x9a($s0)
/* 8BFBC 8008B3BC AE00009C */  sw         $zero, 0x9c($s0)
/* 8BFC0 8008B3C0 0C00193A */  jal        func_800064E8
/* 8BFC4 8008B3C4 AFA20010 */   sw        $v0, 0x10($sp)
/* 8BFC8 8008B3C8 9605008C */  lhu        $a1, 0x8c($s0)
/* 8BFCC 8008B3CC 9606008E */  lhu        $a2, 0x8e($s0)
/* 8BFD0 8008B3D0 0C02DD3F */  jal        set_widget_coords
/* 8BFD4 8008B3D4 02002021 */   addu      $a0, $s0, $zero
/* 8BFD8 8008B3D8 02001021 */  addu       $v0, $s0, $zero
/* 8BFDC 8008B3DC 8FBF0030 */  lw         $ra, 0x30($sp)
/* 8BFE0 8008B3E0 8FB5002C */  lw         $s5, 0x2c($sp)
/* 8BFE4 8008B3E4 8FB40028 */  lw         $s4, 0x28($sp)
/* 8BFE8 8008B3E8 8FB30024 */  lw         $s3, 0x24($sp)
/* 8BFEC 8008B3EC 8FB20020 */  lw         $s2, 0x20($sp)
/* 8BFF0 8008B3F0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8BFF4 8008B3F4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8BFF8 8008B3F8 03E00008 */  jr         $ra
/* 8BFFC 8008B3FC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8008B400
/* 8C000 8008B400 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8C004 8008B404 AFB00010 */  sw         $s0, 0x10($sp)
/* 8C008 8008B408 00808021 */  addu       $s0, $a0, $zero
/* 8C00C 8008B40C 3C02800E */  lui        $v0, %hi(D_800E15A0)
/* 8C010 8008B410 244215A0 */  addiu      $v0, $v0, %lo(D_800E15A0)
/* 8C014 8008B414 AFB10014 */  sw         $s1, 0x14($sp)
/* 8C018 8008B418 00A08821 */  addu       $s1, $a1, $zero
/* 8C01C 8008B41C AFBF0018 */  sw         $ra, 0x18($sp)
/* 8C020 8008B420 0C022DA7 */  jal        func_8008B69C
/* 8C024 8008B424 AE020078 */   sw        $v0, 0x78($s0)
/* 8C028 8008B428 02002021 */  addu       $a0, $s0, $zero
/* 8C02C 8008B42C 0C02E66C */  jal        widget_menu_free
/* 8C030 8008B430 02202821 */   addu      $a1, $s1, $zero
/* 8C034 8008B434 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8C038 8008B438 8FB10014 */  lw         $s1, 0x14($sp)
/* 8C03C 8008B43C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C040 8008B440 03E00008 */  jr         $ra
/* 8C044 8008B444 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008B448
/* 8C048 8008B448 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C04C 8008B44C AFB00010 */  sw         $s0, 0x10($sp)
/* 8C050 8008B450 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C054 8008B454 0C022D42 */  jal        func_8008B508
/* 8C058 8008B458 00808021 */   addu      $s0, $a0, $zero
/* 8C05C 8008B45C 8E020080 */  lw         $v0, 0x80($s0)
/* 8C060 8008B460 1040000B */  beqz       $v0, .L8008B490
/* 8C064 8008B464 8E02007C */   lw        $v0, 0x7c($s0)
/* 8C068 8008B468 10400005 */  beqz       $v0, .L8008B480
/* 8C06C 8008B46C 02002021 */   addu      $a0, $s0, $zero
/* 8C070 8008B470 0C022DD3 */  jal        func_drawing_arrows
/* 8C074 8008B474 24053756 */   addiu     $a1, $zero, 0x3756
/* 8C078 8008B478 08022D29 */  j          .L8008B4A4
/* 8C07C 8008B47C 8FBF0014 */   lw        $ra, 0x14($sp)
.L8008B480:
/* 8C080 8008B480 0C022DD3 */  jal        func_drawing_arrows
/* 8C084 8008B484 24053757 */   addiu     $a1, $zero, 0x3757
/* 8C088 8008B488 08022D29 */  j          .L8008B4A4
/* 8C08C 8008B48C 8FBF0014 */   lw        $ra, 0x14($sp)
.L8008B490:
/* 8C090 8008B490 10400003 */  beqz       $v0, .L8008B4A0
/* 8C094 8008B494 02002021 */   addu      $a0, $s0, $zero
/* 8C098 8008B498 0C022DD3 */  jal        func_drawing_arrows
/* 8C09C 8008B49C 24053755 */   addiu     $a1, $zero, 0x3755
.L8008B4A0:
/* 8C0A0 8008B4A0 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008B4A4:
/* 8C0A4 8008B4A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C0A8 8008B4A8 03E00008 */  jr         $ra
/* 8C0AC 8008B4AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008B4B0
/* 8C0B0 8008B4B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C0B4 8008B4B4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8C0B8 8008B4B8 8C820080 */  lw         $v0, 0x80($a0)
/* 8C0BC 8008B4BC 1040000B */  beqz       $v0, .L8008B4EC
/* 8C0C0 8008B4C0 8C82007C */   lw        $v0, 0x7c($a0)
/* 8C0C4 8008B4C4 10400005 */  beqz       $v0, .L8008B4DC
/* 8C0C8 8008B4C8 00000000 */   nop
/* 8C0CC 8008B4CC 0C022DD3 */  jal        func_drawing_arrows
/* 8C0D0 8008B4D0 24053756 */   addiu     $a1, $zero, 0x3756
/* 8C0D4 8008B4D4 08022D40 */  j          .L8008B500
/* 8C0D8 8008B4D8 8FBF0010 */   lw        $ra, 0x10($sp)
.L8008B4DC:
/* 8C0DC 8008B4DC 0C022DD3 */  jal        func_drawing_arrows
/* 8C0E0 8008B4E0 24053757 */   addiu     $a1, $zero, 0x3757
/* 8C0E4 8008B4E4 08022D40 */  j          .L8008B500
/* 8C0E8 8008B4E8 8FBF0010 */   lw        $ra, 0x10($sp)
.L8008B4EC:
/* 8C0EC 8008B4EC 10400004 */  beqz       $v0, .L8008B500
/* 8C0F0 8008B4F0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 8C0F4 8008B4F4 0C022DD3 */  jal        func_drawing_arrows
/* 8C0F8 8008B4F8 24053755 */   addiu     $a1, $zero, 0x3755
/* 8C0FC 8008B4FC 8FBF0010 */  lw         $ra, 0x10($sp)
.L8008B500:
/* 8C100 8008B500 03E00008 */  jr         $ra
/* 8C104 8008B504 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008B508
/* 8C108 8008B508 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8C10C 8008B50C AFB10024 */  sw         $s1, 0x24($sp)
/* 8C110 8008B510 00808821 */  addu       $s1, $a0, $zero
/* 8C114 8008B514 AFBF0028 */  sw         $ra, 0x28($sp)
/* 8C118 8008B518 AFB00020 */  sw         $s0, 0x20($sp)
/* 8C11C 8008B51C 8E220084 */  lw         $v0, 0x84($s1)
/* 8C120 8008B520 1440005A */  bnez       $v0, .L8008B68C
/* 8C124 8008B524 8FBF0028 */   lw        $ra, 0x28($sp)
/* 8C128 8008B528 8E240088 */  lw         $a0, 0x88($s1)
/* 8C12C 8008B52C 50800058 */  beql       $a0, $zero, .L8008B690
/* 8C130 8008B530 8FB10024 */   lw        $s1, 0x24($sp)
/* 8C134 8008B534 0C03353E */  jal        strlen
/* 8C138 8008B538 00000000 */   nop
/* 8C13C 8008B53C 02202021 */  addu       $a0, $s1, $zero
/* 8C140 8008B540 00003021 */  addu       $a2, $zero, $zero
/* 8C144 8008B544 00003821 */  addu       $a3, $zero, $zero
/* 8C148 8008B548 24030096 */  addiu      $v1, $zero, 0x96
/* 8C14C 8008B54C 240803E8 */  addiu      $t0, $zero, 0x3e8
/* 8C150 8008B550 24420001 */  addiu      $v0, $v0, 1
/* 8C154 8008B554 8E250088 */  lw         $a1, 0x88($s1)
/* 8C158 8008B558 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8C15C 8008B55C AFA30010 */  sw         $v1, 0x10($sp)
/* 8C160 8008B560 AFA80014 */  sw         $t0, 0x14($sp)
/* 8C164 8008B564 0C02F367 */  jal        func_800BCD9C
/* 8C168 8008B568 AFA20018 */   sw        $v0, 0x18($sp)
/* 8C16C 8008B56C 92250094 */  lbu        $a1, 0x94($s1)
/* 8C170 8008B570 92260095 */  lbu        $a2, 0x95($s1)
/* 8C174 8008B574 8C490078 */  lw         $t1, 0x78($v0)
/* 8C178 8008B578 92270096 */  lbu        $a3, 0x96($s1)
/* 8C17C 8008B57C 92230097 */  lbu        $v1, 0x97($s1)
/* 8C180 8008B580 AE220084 */  sw         $v0, 0x84($s1)
/* 8C184 8008B584 85240048 */  lh         $a0, 0x48($t1)
/* 8C188 8008B588 AFA30010 */  sw         $v1, 0x10($sp)
/* 8C18C 8008B58C 8D28004C */  lw         $t0, 0x4c($t1)
/* 8C190 8008B590 0100F809 */  jalr       $t0
/* 8C194 8008B594 00442021 */   addu      $a0, $v0, $a0
/* 8C198 8008B598 8E250084 */  lw         $a1, 0x84($s1)
/* 8C19C 8008B59C 8CA30078 */  lw         $v1, 0x78($a1)
/* 8C1A0 8008B5A0 84640028 */  lh         $a0, 0x28($v1)
/* 8C1A4 8008B5A4 8C62002C */  lw         $v0, 0x2c($v1)
/* 8C1A8 8008B5A8 0040F809 */  jalr       $v0
/* 8C1AC 8008B5AC 00A42021 */   addu      $a0, $a1, $a0
/* 8C1B0 8008B5B0 8E250084 */  lw         $a1, 0x84($s1)
/* 8C1B4 8008B5B4 8CA30078 */  lw         $v1, 0x78($a1)
/* 8C1B8 8008B5B8 84640020 */  lh         $a0, 0x20($v1)
/* 8C1BC 8008B5BC 8C620024 */  lw         $v0, 0x24($v1)
/* 8C1C0 8008B5C0 0040F809 */  jalr       $v0
/* 8C1C4 8008B5C4 00A42021 */   addu      $a0, $a1, $a0
/* 8C1C8 8008B5C8 24500001 */  addiu      $s0, $v0, 1
/* 8C1CC 8008B5CC 8E230084 */  lw         $v1, 0x84($s1)
/* 8C1D0 8008B5D0 00108043 */  sra        $s0, $s0, 1
/* 8C1D4 8008B5D4 8C650078 */  lw         $a1, 0x78($v1)
/* 8C1D8 8008B5D8 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8C1DC 8008B5DC 84A40018 */  lh         $a0, 0x18($a1)
/* 8C1E0 8008B5E0 8CA2001C */  lw         $v0, 0x1c($a1)
/* 8C1E4 8008B5E4 0040F809 */  jalr       $v0
/* 8C1E8 8008B5E8 00642021 */   addu      $a0, $v1, $a0
/* 8C1EC 8008B5EC 24420001 */  addiu      $v0, $v0, 1
/* 8C1F0 8008B5F0 00021043 */  sra        $v0, $v0, 1
/* 8C1F4 8008B5F4 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8C1F8 8008B5F8 8E280084 */  lw         $t0, 0x84($s1)
/* 8C1FC 8008B5FC 86270066 */  lh         $a3, 0x66($s1)
/* 8C200 8008B600 86230064 */  lh         $v1, 0x64($s1)
/* 8C204 8008B604 96250098 */  lhu        $a1, 0x98($s1)
/* 8C208 8008B608 86260068 */  lh         $a2, 0x68($s1)
/* 8C20C 8008B60C 01002021 */  addu       $a0, $t0, $zero
/* 8C210 8008B610 00E33823 */  subu       $a3, $a3, $v1
/* 8C214 8008B614 24E70001 */  addiu      $a3, $a3, 1
/* 8C218 8008B618 00073843 */  sra        $a3, $a3, 1
/* 8C21C 8008B61C 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 8C220 8008B620 00E23823 */  subu       $a3, $a3, $v0
/* 8C224 8008B624 96230064 */  lhu        $v1, 0x64($s1)
/* 8C228 8008B628 8622006A */  lh         $v0, 0x6a($s1)
/* 8C22C 8008B62C 00671821 */  addu       $v1, $v1, $a3
/* 8C230 8008B630 00A32821 */  addu       $a1, $a1, $v1
/* 8C234 8008B634 00461023 */  subu       $v0, $v0, $a2
/* 8C238 8008B638 24420001 */  addiu      $v0, $v0, 1
/* 8C23C 8008B63C 00021043 */  sra        $v0, $v0, 1
/* 8C240 8008B640 3042FFFF */  andi       $v0, $v0, 0xffff
/* 8C244 8008B644 00501023 */  subu       $v0, $v0, $s0
/* 8C248 8008B648 A5050060 */  sh         $a1, 0x60($t0)
/* 8C24C 8008B64C A5050064 */  sh         $a1, 0x64($t0)
/* 8C250 8008B650 00052C00 */  sll        $a1, $a1, 0x10
/* 8C254 8008B654 96230068 */  lhu        $v1, 0x68($s1)
/* 8C258 8008B658 9626009A */  lhu        $a2, 0x9a($s1)
/* 8C25C 8008B65C 00621821 */  addu       $v1, $v1, $v0
/* 8C260 8008B660 00C33021 */  addu       $a2, $a2, $v1
/* 8C264 8008B664 A5060062 */  sh         $a2, 0x62($t0)
/* 8C268 8008B668 A5060068 */  sh         $a2, 0x68($t0)
/* 8C26C 8008B66C 96220066 */  lhu        $v0, 0x66($s1)
/* 8C270 8008B670 00052C03 */  sra        $a1, $a1, 0x10
/* 8C274 8008B674 00471023 */  subu       $v0, $v0, $a3
/* 8C278 8008B678 00023400 */  sll        $a2, $v0, 0x10
/* 8C27C 8008B67C 00063403 */  sra        $a2, $a2, 0x10
/* 8C280 8008B680 0C02EF52 */  jal        func_800BBD48
/* 8C284 8008B684 A5020066 */   sh        $v0, 0x66($t0)
/* 8C288 8008B688 8FBF0028 */  lw         $ra, 0x28($sp)
.L8008B68C:
/* 8C28C 8008B68C 8FB10024 */  lw         $s1, 0x24($sp)
.L8008B690:
/* 8C290 8008B690 8FB00020 */  lw         $s0, 0x20($sp)
/* 8C294 8008B694 03E00008 */  jr         $ra
/* 8C298 8008B698 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8008B69C
/* 8C29C 8008B69C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C2A0 8008B6A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 8C2A4 8008B6A4 00808021 */  addu       $s0, $a0, $zero
/* 8C2A8 8008B6A8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C2AC 8008B6AC 8E050084 */  lw         $a1, 0x84($s0)
/* 8C2B0 8008B6B0 50A00010 */  beql       $a1, $zero, .L8008B6F4
/* 8C2B4 8008B6B4 8E05009C */   lw        $a1, 0x9c($s0)
/* 8C2B8 8008B6B8 8E030078 */  lw         $v1, 0x78($s0)
/* 8C2BC 8008B6BC 84640038 */  lh         $a0, 0x38($v1)
/* 8C2C0 8008B6C0 8C62003C */  lw         $v0, 0x3c($v1)
/* 8C2C4 8008B6C4 0040F809 */  jalr       $v0
/* 8C2C8 8008B6C8 02042021 */   addu      $a0, $s0, $a0
/* 8C2CC 8008B6CC 8E060084 */  lw         $a2, 0x84($s0)
/* 8C2D0 8008B6D0 10C00006 */  beqz       $a2, .L8008B6EC
/* 8C2D4 8008B6D4 24050003 */   addiu     $a1, $zero, 3
/* 8C2D8 8008B6D8 8CC20078 */  lw         $v0, 0x78($a2)
/* 8C2DC 8008B6DC 84440008 */  lh         $a0, 8($v0)
/* 8C2E0 8008B6E0 8C43000C */  lw         $v1, 0xc($v0)
/* 8C2E4 8008B6E4 0060F809 */  jalr       $v1
/* 8C2E8 8008B6E8 00C42021 */   addu      $a0, $a2, $a0
.L8008B6EC:
/* 8C2EC 8008B6EC AE000084 */  sw         $zero, 0x84($s0)
/* 8C2F0 8008B6F0 8E05009C */  lw         $a1, 0x9c($s0)
.L8008B6F4:
/* 8C2F4 8008B6F4 10A00012 */  beqz       $a1, .L8008B740
/* 8C2F8 8008B6F8 8FBF0014 */   lw        $ra, 0x14($sp)
/* 8C2FC 8008B6FC 8E030078 */  lw         $v1, 0x78($s0)
/* 8C300 8008B700 84640038 */  lh         $a0, 0x38($v1)
/* 8C304 8008B704 8C62003C */  lw         $v0, 0x3c($v1)
/* 8C308 8008B708 0040F809 */  jalr       $v0
/* 8C30C 8008B70C 02042021 */   addu      $a0, $s0, $a0
/* 8C310 8008B710 0C0133E5 */  jal        free_borg8_widget
/* 8C314 8008B714 8E04009C */   lw        $a0, 0x9c($s0)
/* 8C318 8008B718 8E06009C */  lw         $a2, 0x9c($s0)
/* 8C31C 8008B71C 10C00006 */  beqz       $a2, .L8008B738
/* 8C320 8008B720 24050003 */   addiu     $a1, $zero, 3
/* 8C324 8008B724 8CC20078 */  lw         $v0, 0x78($a2)
/* 8C328 8008B728 84440008 */  lh         $a0, 8($v0)
/* 8C32C 8008B72C 8C43000C */  lw         $v1, 0xc($v0)
/* 8C330 8008B730 0060F809 */  jalr       $v1
/* 8C334 8008B734 00C42021 */   addu      $a0, $a2, $a0
.L8008B738:
/* 8C338 8008B738 AE00009C */  sw         $zero, 0x9c($s0)
/* 8C33C 8008B73C 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008B740:
/* 8C340 8008B740 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C344 8008B744 03E00008 */  jr         $ra
/* 8C348 8008B748 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_drawing_arrows
/* 8C34C 8008B74C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8C350 8008B750 AFB20020 */  sw         $s2, 0x20($sp)
/* 8C354 8008B754 00809021 */  addu       $s2, $a0, $zero
/* 8C358 8008B758 AFBF0024 */  sw         $ra, 0x24($sp)
/* 8C35C 8008B75C AFB1001C */  sw         $s1, 0x1c($sp)
/* 8C360 8008B760 AFB00018 */  sw         $s0, 0x18($sp)
/* 8C364 8008B764 8E42009C */  lw         $v0, 0x9c($s2)
/* 8C368 8008B768 1440004B */  bnez       $v0, .L8008B898
/* 8C36C 8008B76C 00A02021 */   addu      $a0, $a1, $zero
/* 8C370 8008B770 0C0290E2 */  jal        get_borg_8
/* 8C374 8008B774 00000000 */   nop
/* 8C378 8008B778 02402021 */  addu       $a0, $s2, $zero
/* 8C37C 8008B77C 00402821 */  addu       $a1, $v0, $zero
/* 8C380 8008B780 00003021 */  addu       $a2, $zero, $zero
/* 8C384 8008B784 0C02F3E9 */  jal        func_800BCFA4
/* 8C388 8008B788 00003821 */   addu      $a3, $zero, $zero
/* 8C38C 8008B78C 92450094 */  lbu        $a1, 0x94($s2)
/* 8C390 8008B790 92460095 */  lbu        $a2, 0x95($s2)
/* 8C394 8008B794 8C490078 */  lw         $t1, 0x78($v0)
/* 8C398 8008B798 92470096 */  lbu        $a3, 0x96($s2)
/* 8C39C 8008B79C 92430097 */  lbu        $v1, 0x97($s2)
/* 8C3A0 8008B7A0 AE42009C */  sw         $v0, 0x9c($s2)
/* 8C3A4 8008B7A4 85240048 */  lh         $a0, 0x48($t1)
/* 8C3A8 8008B7A8 AFA30010 */  sw         $v1, 0x10($sp)
/* 8C3AC 8008B7AC 8D28004C */  lw         $t0, 0x4c($t1)
/* 8C3B0 8008B7B0 0100F809 */  jalr       $t0
/* 8C3B4 8008B7B4 00442021 */   addu      $a0, $v0, $a0
/* 8C3B8 8008B7B8 8E45009C */  lw         $a1, 0x9c($s2)
/* 8C3BC 8008B7BC 8CA30078 */  lw         $v1, 0x78($a1)
/* 8C3C0 8008B7C0 84640018 */  lh         $a0, 0x18($v1)
/* 8C3C4 8008B7C4 8C62001C */  lw         $v0, 0x1c($v1)
/* 8C3C8 8008B7C8 0040F809 */  jalr       $v0
/* 8C3CC 8008B7CC 00A42021 */   addu      $a0, $a1, $a0
/* 8C3D0 8008B7D0 8E430084 */  lw         $v1, 0x84($s2)
/* 8C3D4 8008B7D4 00028842 */  srl        $s1, $v0, 1
/* 8C3D8 8008B7D8 8C650078 */  lw         $a1, 0x78($v1)
/* 8C3DC 8008B7DC 3231FFFF */  andi       $s1, $s1, 0xffff
/* 8C3E0 8008B7E0 84A40018 */  lh         $a0, 0x18($a1)
/* 8C3E4 8008B7E4 8CA2001C */  lw         $v0, 0x1c($a1)
/* 8C3E8 8008B7E8 0040F809 */  jalr       $v0
/* 8C3EC 8008B7EC 00642021 */   addu      $a0, $v1, $a0
/* 8C3F0 8008B7F0 8E43009C */  lw         $v1, 0x9c($s2)
/* 8C3F4 8008B7F4 00028042 */  srl        $s0, $v0, 1
/* 8C3F8 8008B7F8 8C650078 */  lw         $a1, 0x78($v1)
/* 8C3FC 8008B7FC 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8C400 8008B800 84A40020 */  lh         $a0, 0x20($a1)
/* 8C404 8008B804 8CA20024 */  lw         $v0, 0x24($a1)
/* 8C408 8008B808 0040F809 */  jalr       $v0
/* 8C40C 8008B80C 00642021 */   addu      $a0, $v1, $a0
/* 8C410 8008B810 8E430084 */  lw         $v1, 0x84($s2)
/* 8C414 8008B814 8E44009C */  lw         $a0, 0x9c($s2)
/* 8C418 8008B818 84650060 */  lh         $a1, 0x60($v1)
/* 8C41C 8008B81C 84660062 */  lh         $a2, 0x62($v1)
/* 8C420 8008B820 00B02821 */  addu       $a1, $a1, $s0
/* 8C424 8008B824 00B12823 */  subu       $a1, $a1, $s1
/* 8C428 8008B828 00C23023 */  subu       $a2, $a2, $v0
/* 8C42C 8008B82C 0C02DD3F */  jal        set_widget_coords
/* 8C430 8008B830 24C6FFFE */   addiu     $a2, $a2, -2
/* 8C434 8008B834 8E45009C */  lw         $a1, 0x9c($s2)
/* 8C438 8008B838 8CA30078 */  lw         $v1, 0x78($a1)
/* 8C43C 8008B83C 84640018 */  lh         $a0, 0x18($v1)
/* 8C440 8008B840 8C62001C */  lw         $v0, 0x1c($v1)
/* 8C444 8008B844 0040F809 */  jalr       $v0
/* 8C448 8008B848 00A42021 */   addu      $a0, $a1, $a0
/* 8C44C 8008B84C 8E44009C */  lw         $a0, 0x9c($s2)
/* 8C450 8008B850 94900060 */  lhu        $s0, 0x60($a0)
/* 8C454 8008B854 8C850078 */  lw         $a1, 0x78($a0)
/* 8C458 8008B858 02028021 */  addu       $s0, $s0, $v0
/* 8C45C 8008B85C 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8C460 8008B860 84A30020 */  lh         $v1, 0x20($a1)
/* 8C464 8008B864 8CA20024 */  lw         $v0, 0x24($a1)
/* 8C468 8008B868 0040F809 */  jalr       $v0
/* 8C46C 8008B86C 00832021 */   addu      $a0, $a0, $v1
/* 8C470 8008B870 8E48009C */  lw         $t0, 0x9c($s2)
/* 8C474 8008B874 02003821 */  addu       $a3, $s0, $zero
/* 8C478 8008B878 01002021 */  addu       $a0, $t0, $zero
/* 8C47C 8008B87C 95050060 */  lhu        $a1, 0x60($t0)
/* 8C480 8008B880 95030062 */  lhu        $v1, 0x62($t0)
/* 8C484 8008B884 95060062 */  lhu        $a2, 0x62($t0)
/* 8C488 8008B888 00621821 */  addu       $v1, $v1, $v0
/* 8C48C 8008B88C 3063FFFF */  andi       $v1, $v1, 0xffff
/* 8C490 8008B890 0C00193A */  jal        func_800064E8
/* 8C494 8008B894 AFA30010 */   sw        $v1, 0x10($sp)
.L8008B898:
/* 8C498 8008B898 8FBF0024 */  lw         $ra, 0x24($sp)
/* 8C49C 8008B89C 8FB20020 */  lw         $s2, 0x20($sp)
/* 8C4A0 8008B8A0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8C4A4 8008B8A4 8FB00018 */  lw         $s0, 0x18($sp)
/* 8C4A8 8008B8A8 03E00008 */  jr         $ra
/* 8C4AC 8008B8AC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_checking_controller_and_pak
/* 8C4B0 8008B8B0 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 8C4B4 8008B8B4 00002821 */  addu       $a1, $zero, $zero
/* 8C4B8 8008B8B8 00003021 */  addu       $a2, $zero, $zero
/* 8C4BC 8008B8BC 24070140 */  addiu      $a3, $zero, 0x140
/* 8C4C0 8008B8C0 AFB20070 */  sw         $s2, 0x70($sp)
/* 8C4C4 8008B8C4 00809021 */  addu       $s2, $a0, $zero
/* 8C4C8 8008B8C8 AFBF0074 */  sw         $ra, 0x74($sp)
/* 8C4CC 8008B8CC AFB1006C */  sw         $s1, 0x6c($sp)
/* 8C4D0 8008B8D0 AFB00068 */  sw         $s0, 0x68($sp)
/* 8C4D4 8008B8D4 8E510000 */  lw         $s1, ($s2)
/* 8C4D8 8008B8D8 241000F0 */  addiu      $s0, $zero, 0xf0
/* 8C4DC 8008B8DC AFB00010 */  sw         $s0, 0x10($sp)
/* 8C4E0 8008B8E0 0C0023E5 */  jal        some_rsp_func
/* 8C4E4 8008B8E4 02202021 */   addu      $a0, $s1, $zero
/* 8C4E8 8008B8E8 00402021 */  addu       $a0, $v0, $zero
/* 8C4EC 8008B8EC 00002821 */  addu       $a1, $zero, $zero
/* 8C4F0 8008B8F0 00003021 */  addu       $a2, $zero, $zero
/* 8C4F4 8008B8F4 24070140 */  addiu      $a3, $zero, 0x140
/* 8C4F8 8008B8F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 8C4FC 8008B8FC AFA00014 */  sw         $zero, 0x14($sp)
/* 8C500 8008B900 AFA00018 */  sw         $zero, 0x18($sp)
/* 8C504 8008B904 AFA0001C */  sw         $zero, 0x1c($sp)
/* 8C508 8008B908 0C002265 */  jal        some_video_setting_init
/* 8C50C 8008B90C AFA00020 */   sw        $zero, 0x20($sp)
/* 8C510 8008B910 3C03800E */  lui        $v1, %hi(widget_handler_pointer)
/* 8C514 8008B914 3C05800E */  lui        $a1, %hi(controller_error_func)
/* 8C518 8008B918 8C647EAC */  lw         $a0, %lo(widget_handler_pointer)($v1)
/* 8C51C 8008B91C 24A31770 */  addiu      $v1, $a1, %lo(controller_error_func)
/* 8C520 8008B920 8CA61770 */  lw         $a2, 0x1770($a1)
/* 8C524 8008B924 8C670004 */  lw         $a3, 4($v1)
/* 8C528 8008B928 8C650008 */  lw         $a1, 8($v1)
/* 8C52C 8008B92C 8C68000C */  lw         $t0, 0xc($v1)
/* 8C530 8008B930 8C690010 */  lw         $t1, 0x10($v1)
/* 8C534 8008B934 8C6A0014 */  lw         $t2, 0x14($v1)
/* 8C538 8008B938 8C6B0018 */  lw         $t3, 0x18($v1)
/* 8C53C 8008B93C 00408821 */  addu       $s1, $v0, $zero
/* 8C540 8008B940 AFA60028 */  sw         $a2, 0x28($sp)
/* 8C544 8008B944 AFA7002C */  sw         $a3, 0x2c($sp)
/* 8C548 8008B948 AFA50030 */  sw         $a1, 0x30($sp)
/* 8C54C 8008B94C AFA80034 */  sw         $t0, 0x34($sp)
/* 8C550 8008B950 AFA90038 */  sw         $t1, 0x38($sp)
/* 8C554 8008B954 AFAA003C */  sw         $t2, 0x3c($sp)
/* 8C558 8008B958 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8C55C 8008B95C AFAB0040 */   sw        $t3, 0x40($sp)
/* 8C560 8008B960 10400005 */  beqz       $v0, .L8008B978
/* 8C564 8008B964 3C03800F */   lui       $v1, %hi(contCheckSwitch)
/* 8C568 8008B968 0C022FF5 */  jal        func_8008BFD4
/* 8C56C 8008B96C 02202021 */   addu      $a0, $s1, $zero
/* 8C570 8008B970 08022E65 */  j          .L8008B994
/* 8C574 8008B974 00408821 */   addu      $s1, $v0, $zero
.L8008B978:
/* 8C578 8008B978 8C621C90 */  lw         $v0, %lo(contCheckSwitch)($v1)
/* 8C57C 8008B97C 00021080 */  sll        $v0, $v0, 2
/* 8C580 8008B980 03A21821 */  addu       $v1, $sp, $v0
/* 8C584 8008B984 8C620028 */  lw         $v0, 0x28($v1)
/* 8C588 8008B988 0040F809 */  jalr       $v0
/* 8C58C 8008B98C 02202021 */   addu      $a0, $s1, $zero
/* 8C590 8008B990 00408821 */  addu       $s1, $v0, $zero
.L8008B994:
/* 8C594 8008B994 02202021 */  addu       $a0, $s1, $zero
/* 8C598 8008B998 0C00B703 */  jal        func_with_debug_queue
/* 8C59C 8008B99C 24050001 */   addiu     $a1, $zero, 1
/* 8C5A0 8008B9A0 3C03800F */  lui        $v1, %hi(init_controller_data)
/* 8C5A4 8008B9A4 AE420000 */  sw         $v0, ($s2)
/* 8C5A8 8008B9A8 8C621C94 */  lw         $v0, %lo(init_controller_data)($v1)
/* 8C5AC 8008B9AC 8FBF0074 */  lw         $ra, 0x74($sp)
/* 8C5B0 8008B9B0 8FB20070 */  lw         $s2, 0x70($sp)
/* 8C5B4 8008B9B4 8FB1006C */  lw         $s1, 0x6c($sp)
/* 8C5B8 8008B9B8 8FB00068 */  lw         $s0, 0x68($sp)
/* 8C5BC 8008B9BC 03E00008 */  jr         $ra
/* 8C5C0 8008B9C0 27BD0078 */   addiu     $sp, $sp, 0x78

glabel load_controller_romstring
/* 8C5C4 8008B9C4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C5C8 8008B9C8 AFB00010 */  sw         $s0, 0x10($sp)
/* 8C5CC 8008B9CC 00808021 */  addu       $s0, $a0, $zero
/* 8C5D0 8008B9D0 3C04B200 */  lui        $a0, %hi(romstring_controller)
/* 8C5D4 8008B9D4 2484C0C0 */  addiu      $a0, $a0, %lo(romstring_controller)
/* 8C5D8 8008B9D8 3C05B200 */  lui        $a1, %hi(combat_romstrings)
/* 8C5DC 8008B9DC 24A5C4D0 */  addiu      $a1, $a1, %lo(combat_romstrings)
/* 8C5E0 8008B9E0 00A42823 */  subu       $a1, $a1, $a0
/* 8C5E4 8008B9E4 3C03800F */  lui        $v1, %hi(init_controller_data)
/* 8C5E8 8008B9E8 24020003 */  addiu      $v0, $zero, 3
/* 8C5EC 8008B9EC 3C06800F */  lui        $a2, %hi(contCheckSwitch)
/* 8C5F0 8008B9F0 AC621C94 */  sw         $v0, %lo(init_controller_data)($v1)
/* 8C5F4 8008B9F4 24020001 */  addiu      $v0, $zero, 1
/* 8C5F8 8008B9F8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C5FC 8008B9FC 0C0232A0 */  jal        func_romStrings
/* 8C600 8008BA00 ACC21C90 */   sw        $v0, %lo(contCheckSwitch)($a2)
/* 8C604 8008BA04 00002021 */  addu       $a0, $zero, $zero
/* 8C608 8008BA08 3C06800F */  lui        $a2, %hi(init_controller_flag)
/* 8C60C 8008BA0C 24C51C9C */  addiu      $a1, $a2, %lo(init_controller_flag)
/* 8C610 8008BA10 3C03800F */  lui        $v1, %hi(controller_romstring)
/* 8C614 8008BA14 AC621C98 */  sw         $v0, %lo(controller_romstring)($v1)
/* 8C618 8008BA18 0C0270AC */  jal        controller_query_2
/* 8C61C 8008BA1C A0C01C9C */   sb        $zero, 0x1c9c($a2)
/* 8C620 8008BA20 3C04800F */  lui        $a0, %hi(debug_queue_800e8908)
/* 8C624 8008BA24 0C00B66C */  jal        n64print_init
/* 8C628 8008BA28 24848908 */   addiu     $a0, $a0, %lo(debug_queue_800e8908)
/* 8C62C 8008BA2C 02001021 */  addu       $v0, $s0, $zero
/* 8C630 8008BA30 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8C634 8008BA34 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C638 8008BA38 03E00008 */  jr         $ra
/* 8C63C 8008BA3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Start_opens_mempak_menu
/* 8C640 8008BA40 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 8C644 8008BA44 AFB10024 */  sw         $s1, 0x24($sp)
/* 8C648 8008BA48 00008821 */  addu       $s1, $zero, $zero
/* 8C64C 8008BA4C 3C02800F */  lui        $v0, 0x800f
/* 8C650 8008BA50 24030002 */  addiu      $v1, $zero, 2
/* 8C654 8008BA54 AFB20028 */  sw         $s2, 0x28($sp)
/* 8C658 8008BA58 00809021 */  addu       $s2, $a0, $zero
/* 8C65C 8008BA5C AFBF0030 */  sw         $ra, 0x30($sp)
/* 8C660 8008BA60 AFB3002C */  sw         $s3, 0x2c($sp)
/* 8C664 8008BA64 AFB00020 */  sw         $s0, 0x20($sp)
/* 8C668 8008BA68 AFA00018 */  sw         $zero, 0x18($sp)
/* 8C66C 8008BA6C AC431C90 */  sw         $v1, 0x1c90($v0)
/* 8C670 8008BA70 00409821 */  addu       $s3, $v0, $zero
/* 8C674 8008BA74 08022EA5 */  j          .L8008BA94
/* 8C678 8008BA78 27B00018 */   addiu     $s0, $sp, 0x18
.L8008BA7C:
/* 8C67C 8008BA7C 8C430008 */  lw         $v1, 8($v0)
/* 8C680 8008BA80 8C44000C */  lw         $a0, 0xc($v0)
/* 8C684 8008BA84 00641825 */  or         $v1, $v1, $a0
/* 8C688 8008BA88 30631000 */  andi       $v1, $v1, 0x1000
/* 8C68C 8008BA8C 54600001 */  bnel       $v1, $zero, .L8008BA94
/* 8C690 8008BA90 24110001 */   addiu     $s1, $zero, 1
.L8008BA94:
/* 8C694 8008BA94 02002021 */  addu       $a0, $s0, $zero
/* 8C698 8008BA98 0C02713D */  jal        get_cont_aidyn
/* 8C69C 8008BA9C 00002821 */   addu      $a1, $zero, $zero
/* 8C6A0 8008BAA0 1440FFF6 */  bnez       $v0, .L8008BA7C
/* 8C6A4 8008BAA4 8FA20018 */   lw        $v0, 0x18($sp)
/* 8C6A8 8008BAA8 1220000D */  beqz       $s1, .L8008BAE0
/* 8C6AC 8008BAAC 24040003 */   addiu     $a0, $zero, 3
/* 8C6B0 8008BAB0 24050002 */  addiu      $a1, $zero, 2
/* 8C6B4 8008BAB4 24060039 */  addiu      $a2, $zero, 0x39
/* 8C6B8 8008BAB8 24070017 */  addiu      $a3, $zero, 0x17
/* 8C6BC 8008BABC 0C0222F2 */  jal        open_mempak_menu
/* 8C6C0 8008BAC0 AFA00010 */   sw        $zero, 0x10($sp)
/* 8C6C4 8008BAC4 02401021 */  addu       $v0, $s2, $zero
/* 8C6C8 8008BAC8 3C03800F */  lui        $v1, %hi(init_controller_data)
/* 8C6CC 8008BACC 24040002 */  addiu      $a0, $zero, 2
/* 8C6D0 8008BAD0 24050005 */  addiu      $a1, $zero, 5
/* 8C6D4 8008BAD4 AC641C94 */  sw         $a0, %lo(init_controller_data)($v1)
/* 8C6D8 8008BAD8 08022EB9 */  j          .L8008BAE4
/* 8C6DC 8008BADC AE651C90 */   sw        $a1, 0x1c90($s3)
.L8008BAE0:
/* 8C6E0 8008BAE0 02401021 */  addu       $v0, $s2, $zero
.L8008BAE4:
/* 8C6E4 8008BAE4 8FBF0030 */  lw         $ra, 0x30($sp)
/* 8C6E8 8008BAE8 8FB3002C */  lw         $s3, 0x2c($sp)
/* 8C6EC 8008BAEC 8FB20028 */  lw         $s2, 0x28($sp)
/* 8C6F0 8008BAF0 8FB10024 */  lw         $s1, 0x24($sp)
/* 8C6F4 8008BAF4 8FB00020 */  lw         $s0, 0x20($sp)
/* 8C6F8 8008BAF8 03E00008 */  jr         $ra
/* 8C6FC 8008BAFC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel check_cont_error
/* 8C700 8008BB00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C704 8008BB04 AFB00010 */  sw         $s0, 0x10($sp)
/* 8C708 8008BB08 00808021 */  addu       $s0, $a0, $zero
/* 8C70C 8008BB0C AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C710 8008BB10 0C026EB7 */  jal        get_psf_err
/* 8C714 8008BB14 00002021 */   addu      $a0, $zero, $zero
/* 8C718 8008BB18 00402021 */  addu       $a0, $v0, $zero
/* 8C71C 8008BB1C 24020006 */  addiu      $v0, $zero, 6
/* 8C720 8008BB20 14820004 */  bne        $a0, $v0, .L8008BB34
/* 8C724 8008BB24 00000000 */   nop
/* 8C728 8008BB28 0C026EB7 */  jal        get_psf_err
/* 8C72C 8008BB2C 00002021 */   addu      $a0, $zero, $zero
/* 8C730 8008BB30 00402021 */  addu       $a0, $v0, $zero
.L8008BB34:
/* 8C734 8008BB34 14800004 */  bnez       $a0, .L8008BB48
/* 8C738 8008BB38 3C03800F */   lui       $v1, %hi(contCheckSwitch)
/* 8C73C 8008BB3C 24020004 */  addiu      $v0, $zero, 4
/* 8C740 8008BB40 08022ED4 */  j          .L8008BB50
/* 8C744 8008BB44 AC621C90 */   sw        $v0, %lo(contCheckSwitch)($v1)
.L8008BB48:
/* 8C748 8008BB48 0C023026 */  jal        run_cont_err_func
/* 8C74C 8008BB4C 00000000 */   nop
.L8008BB50:
/* 8C750 8008BB50 02001021 */  addu       $v0, $s0, $zero
/* 8C754 8008BB54 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8C758 8008BB58 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C75C 8008BB5C 03E00008 */  jr         $ra
/* 8C760 8008BB60 27BD0018 */   addiu     $sp, $sp, 0x18

glabel check_mempak_freespace
/* 8C764 8008BB64 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8C768 8008BB68 AFB00018 */  sw         $s0, 0x18($sp)
/* 8C76C 8008BB6C 00808021 */  addu       $s0, $a0, $zero
/* 8C770 8008BB70 27A40010 */  addiu      $a0, $sp, 0x10
/* 8C774 8008BB74 00002821 */  addu       $a1, $zero, $zero
/* 8C778 8008BB78 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8C77C 8008BB7C 0C026F1B */  jal        get_contpak_freespace
/* 8C780 8008BB80 A3A00010 */   sb        $zero, 0x10($sp)
/* 8C784 8008BB84 00402021 */  addu       $a0, $v0, $zero
/* 8C788 8008BB88 24020006 */  addiu      $v0, $zero, 6
/* 8C78C 8008BB8C 14820005 */  bne        $a0, $v0, .L8008BBA4
/* 8C790 8008BB90 00000000 */   nop
/* 8C794 8008BB94 27A40010 */  addiu      $a0, $sp, 0x10
/* 8C798 8008BB98 0C026F1B */  jal        get_contpak_freespace
/* 8C79C 8008BB9C 00002821 */   addu      $a1, $zero, $zero
/* 8C7A0 8008BBA0 00402021 */  addu       $a0, $v0, $zero
.L8008BBA4:
/* 8C7A4 8008BBA4 10800005 */  beqz       $a0, .L8008BBBC
/* 8C7A8 8008BBA8 93A20010 */   lbu       $v0, 0x10($sp)
/* 8C7AC 8008BBAC 0C023026 */  jal        run_cont_err_func
/* 8C7B0 8008BBB0 00000000 */   nop
/* 8C7B4 8008BBB4 08022EF9 */  j          .L8008BBE4
/* 8C7B8 8008BBB8 02001021 */   addu      $v0, $s0, $zero
.L8008BBBC:
/* 8C7BC 8008BBBC 2C42001C */  sltiu      $v0, $v0, 0x1c
/* 8C7C0 8008BBC0 10400005 */  beqz       $v0, .L8008BBD8
/* 8C7C4 8008BBC4 00000000 */   nop
/* 8C7C8 8008BBC8 0C023198 */  jal        not_enough_freespace
/* 8C7CC 8008BBCC 00002021 */   addu      $a0, $zero, $zero
/* 8C7D0 8008BBD0 08022EF9 */  j          .L8008BBE4
/* 8C7D4 8008BBD4 02001021 */   addu      $v0, $s0, $zero
.L8008BBD8:
/* 8C7D8 8008BBD8 0C022F62 */  jal        clear_controller_romstring
/* 8C7DC 8008BBDC 00000000 */   nop
/* 8C7E0 8008BBE0 02001021 */  addu       $v0, $s0, $zero
.L8008BBE4:
/* 8C7E4 8008BBE4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8C7E8 8008BBE8 8FB00018 */  lw         $s0, 0x18($sp)
/* 8C7EC 8008BBEC 03E00008 */  jr         $ra
/* 8C7F0 8008BBF0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_controller_filestate
/* 8C7F4 8008BBF4 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 8C7F8 8008BBF8 AFB10054 */  sw         $s1, 0x54($sp)
/* 8C7FC 8008BBFC 00808821 */  addu       $s1, $a0, $zero
/* 8C800 8008BC00 AFB20058 */  sw         $s2, 0x58($sp)
/* 8C804 8008BC04 00009021 */  addu       $s2, $zero, $zero
/* 8C808 8008BC08 AFB00050 */  sw         $s0, 0x50($sp)
/* 8C80C 8008BC0C 00008021 */  addu       $s0, $zero, $zero
/* 8C810 8008BC10 AFBF005C */  sw         $ra, 0x5c($sp)
/* 8C814 8008BC14 27A40010 */  addiu      $a0, $sp, 0x10
.L8008BC18:
/* 8C818 8008BC18 02002821 */  addu       $a1, $s0, $zero
/* 8C81C 8008BC1C 0C026FC9 */  jal        get_file_state
/* 8C820 8008BC20 00003021 */   addu      $a2, $zero, $zero
/* 8C824 8008BC24 00402821 */  addu       $a1, $v0, $zero
/* 8C828 8008BC28 24020006 */  addiu      $v0, $zero, 6
/* 8C82C 8008BC2C 14A20007 */  bne        $a1, $v0, .L8008BC4C
/* 8C830 8008BC30 26020001 */   addiu     $v0, $s0, 1
/* 8C834 8008BC34 27A40010 */  addiu      $a0, $sp, 0x10
/* 8C838 8008BC38 02002821 */  addu       $a1, $s0, $zero
/* 8C83C 8008BC3C 0C026FC9 */  jal        get_file_state
/* 8C840 8008BC40 00003021 */   addu      $a2, $zero, $zero
/* 8C844 8008BC44 00402821 */  addu       $a1, $v0, $zero
/* 8C848 8008BC48 26020001 */  addiu      $v0, $s0, 1
.L8008BC4C:
/* 8C84C 8008BC4C 2CA3000C */  sltiu      $v1, $a1, 0xc
/* 8C850 8008BC50 1060001B */  beqz       $v1, .L8008BCC0
/* 8C854 8008BC54 305000FF */   andi      $s0, $v0, 0xff
/* 8C858 8008BC58 3C02800E */  lui        $v0, %hi(D_800E1790)
/* 8C85C 8008BC5C 24421790 */  addiu      $v0, $v0, %lo(D_800E1790)
/* 8C860 8008BC60 00051880 */  sll        $v1, $a1, 2
/* 8C864 8008BC64 00621821 */  addu       $v1, $v1, $v0
/* 8C868 8008BC68 8C640000 */  lw         $a0, ($v1)
/* 8C86C 8008BC6C 00800008 */  jr         $a0
/* 8C870 8008BC70 00000000 */   nop
/* 8C874 8008BC74 97A30012 */  lhu        $v1, 0x12($sp)
/* 8C878 8008BC78 24023738 */  addiu      $v0, $zero, 0x3738
/* 8C87C 8008BC7C 14620015 */  bne        $v1, $v0, .L8008BCD4
/* 8C880 8008BC80 2E020010 */   sltiu     $v0, $s0, 0x10
/* 8C884 8008BC84 3C024E41 */  lui        $v0, 0x4e41
/* 8C888 8008BC88 8FA30014 */  lw         $v1, 0x14($sp)
/* 8C88C 8008BC8C 34425945 */  ori        $v0, $v0, 0x5945
/* 8C890 8008BC90 14620010 */  bne        $v1, $v0, .L8008BCD4
/* 8C894 8008BC94 2E020010 */   sltiu     $v0, $s0, 0x10
/* 8C898 8008BC98 0C022F62 */  jal        clear_controller_romstring
/* 8C89C 8008BC9C 00000000 */   nop
/* 8C8A0 8008BCA0 08022F40 */  j          .L8008BD00
/* 8C8A4 8008BCA4 02201021 */   addu      $v0, $s1, $zero
/* 8C8A8 8008BCA8 0C023026 */  jal        run_cont_err_func
/* 8C8AC 8008BCAC 00A02021 */   addu      $a0, $a1, $zero
/* 8C8B0 8008BCB0 08022F40 */  j          .L8008BD00
/* 8C8B4 8008BCB4 02201021 */   addu      $v0, $s1, $zero
/* 8C8B8 8008BCB8 08022F34 */  j          .L8008BCD0
/* 8C8BC 8008BCBC 24120001 */   addiu     $s2, $zero, 1
.L8008BCC0:
/* 8C8C0 8008BCC0 0C023026 */  jal        run_cont_err_func
/* 8C8C4 8008BCC4 00A02021 */   addu      $a0, $a1, $zero
/* 8C8C8 8008BCC8 08022F40 */  j          .L8008BD00
/* 8C8CC 8008BCCC 02201021 */   addu      $v0, $s1, $zero
.L8008BCD0:
/* 8C8D0 8008BCD0 2E020010 */  sltiu      $v0, $s0, 0x10
.L8008BCD4:
/* 8C8D4 8008BCD4 1440FFD0 */  bnez       $v0, .L8008BC18
/* 8C8D8 8008BCD8 27A40010 */   addiu     $a0, $sp, 0x10
/* 8C8DC 8008BCDC 16400005 */  bnez       $s2, .L8008BCF4
/* 8C8E0 8008BCE0 3C03800F */   lui       $v1, 0x800f
/* 8C8E4 8008BCE4 0C02318E */  jal        pfs_err_data_full
/* 8C8E8 8008BCE8 00002021 */   addu      $a0, $zero, $zero
/* 8C8EC 8008BCEC 08022F40 */  j          .L8008BD00
/* 8C8F0 8008BCF0 02201021 */   addu      $v0, $s1, $zero
.L8008BCF4:
/* 8C8F4 8008BCF4 24020003 */  addiu      $v0, $zero, 3
/* 8C8F8 8008BCF8 AC621C90 */  sw         $v0, 0x1c90($v1)
/* 8C8FC 8008BCFC 02201021 */  addu       $v0, $s1, $zero
.L8008BD00:
/* 8C900 8008BD00 8FBF005C */  lw         $ra, 0x5c($sp)
/* 8C904 8008BD04 8FB20058 */  lw         $s2, 0x58($sp)
/* 8C908 8008BD08 8FB10054 */  lw         $s1, 0x54($sp)
/* 8C90C 8008BD0C 8FB00050 */  lw         $s0, 0x50($sp)
/* 8C910 8008BD10 03E00008 */  jr         $ra
/* 8C914 8008BD14 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_checking_controller
/* 8C918 8008BD18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C91C 8008BD1C AFB00010 */  sw         $s0, 0x10($sp)
/* 8C920 8008BD20 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C924 8008BD24 0C02238B */  jal        func_80088E2C
/* 8C928 8008BD28 00808021 */   addu      $s0, $a0, $zero
/* 8C92C 8008BD2C 1440000D */  bnez       $v0, .L8008BD64
/* 8C930 8008BD30 3C03800F */   lui       $v1, %hi(init_controller_data)
/* 8C934 8008BD34 24020003 */  addiu      $v0, $zero, 3
/* 8C938 8008BD38 3C04800F */  lui        $a0, %hi(contCheckSwitch)
/* 8C93C 8008BD3C AC621C94 */  sw         $v0, %lo(init_controller_data)($v1)
/* 8C940 8008BD40 24020002 */  addiu      $v0, $zero, 2
/* 8C944 8008BD44 3C05800F */  lui        $a1, %hi(init_controller_flag)
/* 8C948 8008BD48 AC821C90 */  sw         $v0, %lo(contCheckSwitch)($a0)
/* 8C94C 8008BD4C 00002021 */  addu       $a0, $zero, $zero
/* 8C950 8008BD50 A0A01C9C */  sb         $zero, %lo(init_controller_flag)($a1)
/* 8C954 8008BD54 0C0270AC */  jal        controller_query_2
/* 8C958 8008BD58 24A51C9C */   addiu     $a1, $a1, 0x1c9c
/* 8C95C 8008BD5C 08022F5C */  j          .L8008BD70
/* 8C960 8008BD60 02001021 */   addu      $v0, $s0, $zero
.L8008BD64:
/* 8C964 8008BD64 0C022F62 */  jal        clear_controller_romstring
/* 8C968 8008BD68 00000000 */   nop
/* 8C96C 8008BD6C 02001021 */  addu       $v0, $s0, $zero
.L8008BD70:
/* 8C970 8008BD70 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8C974 8008BD74 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C978 8008BD78 03E00008 */  jr         $ra
/* 8C97C 8008BD7C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_8008bd80
/* 8C980 8008BD80 03E00008 */  jr         $ra
/* 8C984 8008BD84 00801021 */   addu      $v0, $a0, $zero

glabel clear_controller_romstring
/* 8C988 8008BD88 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8C98C 8008BD8C AFB00010 */  sw         $s0, 0x10($sp)
/* 8C990 8008BD90 3C10800F */  lui        $s0, %hi(controller_romstring)
/* 8C994 8008BD94 8E041C98 */  lw         $a0, %lo(controller_romstring)($s0)
/* 8C998 8008BD98 3C02800F */  lui        $v0, %hi(init_controller_data)
/* 8C99C 8008BD9C AC401C94 */  sw         $zero, %lo(init_controller_data)($v0)
/* 8C9A0 8008BDA0 3C02800F */  lui        $v0, %hi(contCheckSwitch)
/* 8C9A4 8008BDA4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8C9A8 8008BDA8 0C0232F9 */  jal        free_romstring
/* 8C9AC 8008BDAC AC401C90 */   sw        $zero, %lo(contCheckSwitch)($v0)
/* 8C9B0 8008BDB0 0C00B684 */  jal        n64print_free
/* 8C9B4 8008BDB4 AE001C98 */   sw        $zero, 0x1c98($s0)
/* 8C9B8 8008BDB8 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8C9BC 8008BDBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 8C9C0 8008BDC0 03E00008 */  jr         $ra
/* 8C9C4 8008BDC4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008BDC8
/* 8C9C8 8008BDC8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8C9CC 8008BDCC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 8C9D0 8008BDD0 AFB10014 */  sw         $s1, 0x14($sp)
/* 8C9D4 8008BDD4 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 8C9D8 8008BDD8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8C9DC 8008BDDC 08022F84 */  j          .L8008BE10
/* 8C9E0 8008BDE0 AFB00010 */   sw        $s0, 0x10($sp)
.L8008BDE4:
/* 8C9E4 8008BDE4 84640080 */  lh         $a0, 0x80($v1)
/* 8C9E8 8008BDE8 8C620084 */  lw         $v0, 0x84($v1)
/* 8C9EC 8008BDEC 0040F809 */  jalr       $v0
/* 8C9F0 8008BDF0 02042021 */   addu      $a0, $s0, $a0
/* 8C9F4 8008BDF4 12000006 */  beqz       $s0, .L8008BE10
/* 8C9F8 8008BDF8 24050003 */   addiu     $a1, $zero, 3
/* 8C9FC 8008BDFC 8E020078 */  lw         $v0, 0x78($s0)
/* 8CA00 8008BE00 84440008 */  lh         $a0, 8($v0)
/* 8CA04 8008BE04 8C43000C */  lw         $v1, 0xc($v0)
/* 8CA08 8008BE08 0060F809 */  jalr       $v1
/* 8CA0C 8008BE0C 02042021 */   addu      $a0, $s0, $a0
.L8008BE10:
/* 8CA10 8008BE10 0C02DCA5 */  jal        func_800B7294
/* 8CA14 8008BE14 8E241604 */   lw        $a0, 0x1604($s1)
/* 8CA18 8008BE18 00408021 */  addu       $s0, $v0, $zero
/* 8CA1C 8008BE1C 5600FFF1 */  bnel       $s0, $zero, .L8008BDE4
/* 8CA20 8008BE20 8E030078 */   lw        $v1, 0x78($s0)
/* 8CA24 8008BE24 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8CA28 8008BE28 8FB10014 */  lw         $s1, 0x14($sp)
/* 8CA2C 8008BE2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CA30 8008BE30 03E00008 */  jr         $ra
/* 8CA34 8008BE34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_contCheckSwitch_to_6
/* 8CA38 8008BE38 3C03800F */  lui        $v1, %hi(contCheckSwitch)
/* 8CA3C 8008BE3C 24020006 */  addiu      $v0, $zero, 6
/* 8CA40 8008BE40 03E00008 */  jr         $ra
/* 8CA44 8008BE44 AC621C90 */   sw        $v0, %lo(contCheckSwitch)($v1)

glabel func_8008BE48
/* 8CA48 8008BE48 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 8CA4C 8008BE4C 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 8CA50 8008BE50 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8CA54 8008BE54 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8CA58 8008BE58 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8CA5C 8008BE5C AFB20018 */  sw         $s2, 0x18($sp)
/* 8CA60 8008BE60 AFB10014 */  sw         $s1, 0x14($sp)
/* 8CA64 8008BE64 0C02DCB1 */  jal        widgethandler_get_widgetB
/* 8CA68 8008BE68 AFB00010 */   sw        $s0, 0x10($sp)
/* 8CA6C 8008BE6C 10400052 */  beqz       $v0, .L8008BFB8
/* 8CA70 8008BE70 3C02800F */   lui       $v0, %hi(contCheckSwitch)
/* 8CA74 8008BE74 8C441C90 */  lw         $a0, %lo(contCheckSwitch)($v0)
/* 8CA78 8008BE78 24030006 */  addiu      $v1, $zero, 6
/* 8CA7C 8008BE7C 1483000F */  bne        $a0, $v1, .L8008BEBC
/* 8CA80 8008BE80 00409821 */   addu      $s3, $v0, $zero
/* 8CA84 8008BE84 0C026E11 */  jal        controller_status_check
/* 8CA88 8008BE88 00002021 */   addu      $a0, $zero, $zero
/* 8CA8C 8008BE8C 1040004A */  beqz       $v0, .L8008BFB8
/* 8CA90 8008BE90 00002021 */   addu      $a0, $zero, $zero
/* 8CA94 8008BE94 3C03800F */  lui        $v1, %hi(init_controller_flag)
/* 8CA98 8008BE98 24651C9C */  addiu      $a1, $v1, %lo(init_controller_flag)
/* 8CA9C 8008BE9C 24020002 */  addiu      $v0, $zero, 2
/* 8CAA0 8008BEA0 AE621C90 */  sw         $v0, 0x1c90($s3)
/* 8CAA4 8008BEA4 0C0270AC */  jal        controller_query_2
/* 8CAA8 8008BEA8 A0601C9C */   sb        $zero, 0x1c9c($v1)
/* 8CAAC 8008BEAC 0C022F72 */  jal        func_8008BDC8
/* 8CAB0 8008BEB0 00000000 */   nop
/* 8CAB4 8008BEB4 08022FEF */  j          .L8008BFBC
/* 8CAB8 8008BEB8 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008BEBC:
/* 8CABC 8008BEBC 00002021 */  addu       $a0, $zero, $zero
/* 8CAC0 8008BEC0 3C10800F */  lui        $s0, %hi(init_controller_flag)
/* 8CAC4 8008BEC4 26121C9C */  addiu      $s2, $s0, %lo(init_controller_flag)
/* 8CAC8 8008BEC8 02402821 */  addu       $a1, $s2, $zero
/* 8CACC 8008BECC 0C0270AC */  jal        controller_query_2
/* 8CAD0 8008BED0 92111C9C */   lbu       $s1, 0x1c9c($s0)
/* 8CAD4 8008BED4 1440000A */  bnez       $v0, .L8008BF00
/* 8CAD8 8008BED8 92031C9C */   lbu       $v1, 0x1c9c($s0)
/* 8CADC 8008BEDC 00002021 */  addu       $a0, $zero, $zero
/* 8CAE0 8008BEE0 0C0270AC */  jal        controller_query_2
/* 8CAE4 8008BEE4 02402821 */   addu      $a1, $s2, $zero
/* 8CAE8 8008BEE8 14400005 */  bnez       $v0, .L8008BF00
/* 8CAEC 8008BEEC 92031C9C */   lbu       $v1, 0x1c9c($s0)
/* 8CAF0 8008BEF0 0C022F8E */  jal        set_contCheckSwitch_to_6
/* 8CAF4 8008BEF4 00000000 */   nop
/* 8CAF8 8008BEF8 08022FEF */  j          .L8008BFBC
/* 8CAFC 8008BEFC 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008BF00:
/* 8CB00 8008BF00 24020001 */  addiu      $v0, $zero, 1
/* 8CB04 8008BF04 14620003 */  bne        $v1, $v0, .L8008BF14
/* 8CB08 8008BF08 00000000 */   nop
/* 8CB0C 8008BF0C 1223002B */  beq        $s1, $v1, .L8008BFBC
/* 8CB10 8008BF10 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008BF14:
/* 8CB14 8008BF14 10710028 */  beq        $v1, $s1, .L8008BFB8
/* 8CB18 8008BF18 24020003 */   addiu     $v0, $zero, 3
/* 8CB1C 8008BF1C 1462001B */  bne        $v1, $v0, .L8008BF8C
/* 8CB20 8008BF20 92101C9C */   lbu       $s0, 0x1c9c($s0)
/* 8CB24 8008BF24 24020002 */  addiu      $v0, $zero, 2
/* 8CB28 8008BF28 16220019 */  bne        $s1, $v0, .L8008BF90
/* 8CB2C 8008BF2C 00000000 */   nop
/* 8CB30 8008BF30 0C026EB7 */  jal        get_psf_err
/* 8CB34 8008BF34 00002021 */   addu      $a0, $zero, $zero
/* 8CB38 8008BF38 00408021 */  addu       $s0, $v0, $zero
/* 8CB3C 8008BF3C 24020006 */  addiu      $v0, $zero, 6
/* 8CB40 8008BF40 16020004 */  bne        $s0, $v0, .L8008BF54
/* 8CB44 8008BF44 00000000 */   nop
/* 8CB48 8008BF48 0C026EB7 */  jal        get_psf_err
/* 8CB4C 8008BF4C 00002021 */   addu      $a0, $zero, $zero
/* 8CB50 8008BF50 00408021 */  addu       $s0, $v0, $zero
.L8008BF54:
/* 8CB54 8008BF54 0C022F72 */  jal        func_8008BDC8
/* 8CB58 8008BF58 00000000 */   nop
/* 8CB5C 8008BF5C 12110003 */  beq        $s0, $s1, .L8008BF6C
/* 8CB60 8008BF60 00000000 */   nop
/* 8CB64 8008BF64 16000005 */  bnez       $s0, .L8008BF7C
/* 8CB68 8008BF68 00000000 */   nop
.L8008BF6C:
/* 8CB6C 8008BF6C 0C023026 */  jal        run_cont_err_func
/* 8CB70 8008BF70 24040002 */   addiu     $a0, $zero, 2
/* 8CB74 8008BF74 08022FEF */  j          .L8008BFBC
/* 8CB78 8008BF78 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008BF7C:
/* 8CB7C 8008BF7C 0C023026 */  jal        run_cont_err_func
/* 8CB80 8008BF80 02002021 */   addu      $a0, $s0, $zero
/* 8CB84 8008BF84 08022FEF */  j          .L8008BFBC
/* 8CB88 8008BF88 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008BF8C:
/* 8CB8C 8008BF8C 24020002 */  addiu      $v0, $zero, 2
.L8008BF90:
/* 8CB90 8008BF90 1602000A */  bne        $s0, $v0, .L8008BFBC
/* 8CB94 8008BF94 8FBF0020 */   lw        $ra, 0x20($sp)
/* 8CB98 8008BF98 24020001 */  addiu      $v0, $zero, 1
/* 8CB9C 8008BF9C 12220003 */  beq        $s1, $v0, .L8008BFAC
/* 8CBA0 8008BFA0 00000000 */   nop
/* 8CBA4 8008BFA4 52300006 */  beql       $s1, $s0, .L8008BFC0
/* 8CBA8 8008BFA8 8FB3001C */   lw        $s3, 0x1c($sp)
.L8008BFAC:
/* 8CBAC 8008BFAC 0C022F72 */  jal        func_8008BDC8
/* 8CBB0 8008BFB0 00000000 */   nop
/* 8CBB4 8008BFB4 AE701C90 */  sw         $s0, 0x1c90($s3)
.L8008BFB8:
/* 8CBB8 8008BFB8 8FBF0020 */  lw         $ra, 0x20($sp)
.L8008BFBC:
/* 8CBBC 8008BFBC 8FB3001C */  lw         $s3, 0x1c($sp)
.L8008BFC0:
/* 8CBC0 8008BFC0 8FB20018 */  lw         $s2, 0x18($sp)
/* 8CBC4 8008BFC4 8FB10014 */  lw         $s1, 0x14($sp)
/* 8CBC8 8008BFC8 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CBCC 8008BFCC 03E00008 */  jr         $ra
/* 8CBD0 8008BFD0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008BFD4
/* 8CBD4 8008BFD4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8CBD8 8008BFD8 AFB00018 */  sw         $s0, 0x18($sp)
/* 8CBDC 8008BFDC 00008021 */  addu       $s0, $zero, $zero
/* 8CBE0 8008BFE0 AFB30024 */  sw         $s3, 0x24($sp)
/* 8CBE4 8008BFE4 00809821 */  addu       $s3, $a0, $zero
/* 8CBE8 8008BFE8 AFBF0028 */  sw         $ra, 0x28($sp)
/* 8CBEC 8008BFEC AFB20020 */  sw         $s2, 0x20($sp)
/* 8CBF0 8008BFF0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8CBF4 8008BFF4 0C022F92 */  jal        func_8008BE48
/* 8CBF8 8008BFF8 AFA00010 */   sw        $zero, 0x10($sp)
/* 8CBFC 8008BFFC 3C12800E */  lui        $s2, 0x800e
/* 8CC00 8008C000 0802300F */  j          .L8008C03C
/* 8CC04 8008C004 27B10010 */   addiu     $s1, $sp, 0x10
.L8008C008:
/* 8CC08 8008C008 8C441604 */  lw         $a0, 0x1604($v0)
/* 8CC0C 8008C00C 0C02DC69 */  jal        run_widget_control_func
/* 8CC10 8008C010 8FA50010 */   lw        $a1, 0x10($sp)
/* 8CC14 8008C014 26030001 */  addiu      $v1, $s0, 1
/* 8CC18 8008C018 00402021 */  addu       $a0, $v0, $zero
/* 8CC1C 8008C01C 10800007 */  beqz       $a0, .L8008C03C
/* 8CC20 8008C020 307000FF */   andi      $s0, $v1, 0xff
/* 8CC24 8008C024 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 8CC28 8008C028 8C42D500 */  lw         $v0, %lo(freeWidgetFunc)($v0)
/* 8CC2C 8008C02C 50400004 */  beql       $v0, $zero, .L8008C040
/* 8CC30 8008C030 02202021 */   addu      $a0, $s1, $zero
/* 8CC34 8008C034 0040F809 */  jalr       $v0
/* 8CC38 8008C038 00000000 */   nop
.L8008C03C:
/* 8CC3C 8008C03C 02202021 */  addu       $a0, $s1, $zero
.L8008C040:
/* 8CC40 8008C040 0C02713D */  jal        get_cont_aidyn
/* 8CC44 8008C044 00002821 */   addu      $a1, $zero, $zero
/* 8CC48 8008C048 1440FFEF */  bnez       $v0, .L8008C008
/* 8CC4C 8008C04C 264268A8 */   addiu     $v0, $s2, 0x68a8
/* 8CC50 8008C050 52000001 */  beql       $s0, $zero, .L8008C058
/* 8CC54 8008C054 24100001 */   addiu     $s0, $zero, 1
.L8008C058:
/* 8CC58 8008C058 2E020007 */  sltiu      $v0, $s0, 7
/* 8CC5C 8008C05C 50400001 */  beql       $v0, $zero, .L8008C064
/* 8CC60 8008C060 24100006 */   addiu     $s0, $zero, 6
.L8008C064:
/* 8CC64 8008C064 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 8CC68 8008C068 44900000 */  mtc1       $s0, $f0
/* 8CC6C 8008C06C 46800020 */  cvt.s.w    $f0, $f0
/* 8CC70 8008C070 02602021 */  addu       $a0, $s3, $zero
/* 8CC74 8008C074 0C015E9C */  jal        func_80057A70
/* 8CC78 8008C078 E440000C */   swc1      $f0, 0xc($v0)
/* 8CC7C 8008C07C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 8CC80 8008C080 8FB30024 */  lw         $s3, 0x24($sp)
/* 8CC84 8008C084 8FB20020 */  lw         $s2, 0x20($sp)
/* 8CC88 8008C088 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8CC8C 8008C08C 8FB00018 */  lw         $s0, 0x18($sp)
/* 8CC90 8008C090 03E00008 */  jr         $ra
/* 8CC94 8008C094 27BD0030 */   addiu     $sp, $sp, 0x30

glabel run_cont_err_func
/* 8CC98 8008C098 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 8CC9C 8008C09C 308400FF */  andi       $a0, $a0, 0xff
/* 8CCA0 8008C0A0 3C02800F */  lui        $v0, %hi(contCheckSwitch)
/* 8CCA4 8008C0A4 24030002 */  addiu      $v1, $zero, 2
/* 8CCA8 8008C0A8 AC431C90 */  sw         $v1, %lo(contCheckSwitch)($v0)
/* 8CCAC 8008C0AC 27A30010 */  addiu      $v1, $sp, 0x10
/* 8CCB0 8008C0B0 3C02800E */  lui        $v0, %hi(cont_err_funcs)
/* 8CCB4 8008C0B4 244217C0 */  addiu      $v0, $v0, %lo(cont_err_funcs)
/* 8CCB8 8008C0B8 24450030 */  addiu      $a1, $v0, 0x30
/* 8CCBC 8008C0BC 00603021 */  addu       $a2, $v1, $zero
/* 8CCC0 8008C0C0 AFBF0050 */  sw         $ra, 0x50($sp)
.L8008C0C4:
/* 8CCC4 8008C0C4 8C470000 */  lw         $a3, ($v0)
/* 8CCC8 8008C0C8 8C480004 */  lw         $t0, 4($v0)
/* 8CCCC 8008C0CC 8C490008 */  lw         $t1, 8($v0)
/* 8CCD0 8008C0D0 8C4A000C */  lw         $t2, 0xc($v0)
/* 8CCD4 8008C0D4 AC670000 */  sw         $a3, ($v1)
/* 8CCD8 8008C0D8 AC680004 */  sw         $t0, 4($v1)
/* 8CCDC 8008C0DC AC690008 */  sw         $t1, 8($v1)
/* 8CCE0 8008C0E0 AC6A000C */  sw         $t2, 0xc($v1)
/* 8CCE4 8008C0E4 24420010 */  addiu      $v0, $v0, 0x10
/* 8CCE8 8008C0E8 1445FFF6 */  bne        $v0, $a1, .L8008C0C4
/* 8CCEC 8008C0EC 24630010 */   addiu     $v1, $v1, 0x10
/* 8CCF0 8008C0F0 8C450000 */  lw         $a1, ($v0)
/* 8CCF4 8008C0F4 8C470004 */  lw         $a3, 4($v0)
/* 8CCF8 8008C0F8 AC650000 */  sw         $a1, ($v1)
/* 8CCFC 8008C0FC 1080000C */  beqz       $a0, .L8008C130
/* 8CD00 8008C100 AC670004 */   sw        $a3, 4($v1)
/* 8CD04 8008C104 2C82000E */  sltiu      $v0, $a0, 0xe
/* 8CD08 8008C108 14400005 */  bnez       $v0, .L8008C120
/* 8CD0C 8008C10C 00041080 */   sll       $v0, $a0, 2
/* 8CD10 8008C110 0C0230F4 */  jal        psf_err_contrfail
/* 8CD14 8008C114 00000000 */   nop
/* 8CD18 8008C118 0802304D */  j          .L8008C134
/* 8CD1C 8008C11C 8FBF0050 */   lw        $ra, 0x50($sp)
.L8008C120:
/* 8CD20 8008C120 00C21021 */  addu       $v0, $a2, $v0
/* 8CD24 8008C124 8C430000 */  lw         $v1, ($v0)
/* 8CD28 8008C128 0060F809 */  jalr       $v1
/* 8CD2C 8008C12C 00000000 */   nop
.L8008C130:
/* 8CD30 8008C130 8FBF0050 */  lw         $ra, 0x50($sp)
.L8008C134:
/* 8CD34 8008C134 03E00008 */  jr         $ra
/* 8CD38 8008C138 27BD0058 */   addiu     $sp, $sp, 0x58

glabel continue_without_saving_
/* 8CD3C 8008C13C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8CD40 8008C140 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8CD44 8008C144 0C022F62 */  jal        clear_controller_romstring
/* 8CD48 8008C148 00000000 */   nop
/* 8CD4C 8008C14C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8CD50 8008C150 00001021 */  addu       $v0, $zero, $zero
/* 8CD54 8008C154 03E00008 */  jr         $ra
/* 8CD58 8008C158 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008C15C
/* 8CD5C 8008C15C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8CD60 8008C160 AFB00018 */  sw         $s0, 0x18($sp)
/* 8CD64 8008C164 3C10800F */  lui        $s0, 0x800f
/* 8CD68 8008C168 24040003 */  addiu      $a0, $zero, 3
/* 8CD6C 8008C16C 24050002 */  addiu      $a1, $zero, 2
/* 8CD70 8008C170 24060039 */  addiu      $a2, $zero, 0x39
/* 8CD74 8008C174 24070017 */  addiu      $a3, $zero, 0x17
/* 8CD78 8008C178 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8CD7C 8008C17C AE001C90 */  sw         $zero, 0x1c90($s0)
/* 8CD80 8008C180 0C0222F2 */  jal        open_mempak_menu
/* 8CD84 8008C184 AFA00010 */   sw        $zero, 0x10($sp)
/* 8CD88 8008C188 3C04800F */  lui        $a0, 0x800f
/* 8CD8C 8008C18C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8CD90 8008C190 24030005 */  addiu      $v1, $zero, 5
/* 8CD94 8008C194 AE031C90 */  sw         $v1, 0x1c90($s0)
/* 8CD98 8008C198 8FB00018 */  lw         $s0, 0x18($sp)
/* 8CD9C 8008C19C 24020002 */  addiu      $v0, $zero, 2
/* 8CDA0 8008C1A0 AC821C94 */  sw         $v0, 0x1c94($a0)
/* 8CDA4 8008C1A4 00001021 */  addu       $v0, $zero, $zero
/* 8CDA8 8008C1A8 03E00008 */  jr         $ra
/* 8CDAC 8008C1AC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008C1B0
/* 8CDB0 8008C1B0 ACA00018 */  sw         $zero, 0x18($a1)
/* 8CDB4 8008C1B4 03E00008 */  jr         $ra
/* 8CDB8 8008C1B8 00001021 */   addu      $v0, $zero, $zero

glabel ret0_8008c1bc
/* 8CDBC 8008C1BC 03E00008 */  jr         $ra
/* 8CDC0 8008C1C0 00001021 */   addu      $v0, $zero, $zero

glabel func_8008C1C4
/* 8CDC4 8008C1C4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8CDC8 8008C1C8 00002021 */  addu       $a0, $zero, $zero
/* 8CDCC 8008C1CC AFB00010 */  sw         $s0, 0x10($sp)
/* 8CDD0 8008C1D0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8CDD4 8008C1D4 0C026ED4 */  jal        repaircontrollerpakid
/* 8CDD8 8008C1D8 00A08021 */   addu      $s0, $a1, $zero
/* 8CDDC 8008C1DC 14400005 */  bnez       $v0, .L8008C1F4
/* 8CDE0 8008C1E0 00000000 */   nop
/* 8CDE4 8008C1E4 0C026EB7 */  jal        get_psf_err
/* 8CDE8 8008C1E8 00002021 */   addu      $a0, $zero, $zero
/* 8CDEC 8008C1EC 10400005 */  beqz       $v0, .L8008C204
/* 8CDF0 8008C1F0 00000000 */   nop
.L8008C1F4:
/* 8CDF4 8008C1F4 0C023203 */  jal        func_8008C80C
/* 8CDF8 8008C1F8 9204005F */   lbu       $a0, 0x5f($s0)
/* 8CDFC 8008C1FC 08023084 */  j          .L8008C210
/* 8CE00 8008C200 8FBF0014 */   lw        $ra, 0x14($sp)
.L8008C204:
/* 8CE04 8008C204 0C0231E3 */  jal        func_8008C78C
/* 8CE08 8008C208 9204005F */   lbu       $a0, 0x5f($s0)
/* 8CE0C 8008C20C 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008C210:
/* 8CE10 8008C210 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CE14 8008C214 00001021 */  addu       $v0, $zero, $zero
/* 8CE18 8008C218 03E00008 */  jr         $ra
/* 8CE1C 8008C21C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008C220
/* 8CE20 8008C220 03E00008 */  jr         $ra
/* 8CE24 8008C224 00001021 */   addu      $v0, $zero, $zero

glabel func_8008C228
/* 8CE28 8008C228 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8CE2C 8008C22C 24040080 */  addiu      $a0, $zero, 0x80
/* 8CE30 8008C230 AFB00010 */  sw         $s0, 0x10($sp)
/* 8CE34 8008C234 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8CE38 8008C238 0C026259 */  jal        passToMalloc
/* 8CE3C 8008C23C 00A08021 */   addu      $s0, $a1, $zero
/* 8CE40 8008C240 00402021 */  addu       $a0, $v0, $zero
/* 8CE44 8008C244 2405003C */  addiu      $a1, $zero, 0x3c
/* 8CE48 8008C248 3C068009 */  lui        $a2, %hi(func_8008C1C4)
/* 8CE4C 8008C24C 0C00C0C0 */  jal        func_80030300
/* 8CE50 8008C250 24C6C1C4 */   addiu     $a2, $a2, %lo(func_8008C1C4)
/* 8CE54 8008C254 00402821 */  addu       $a1, $v0, $zero
/* 8CE58 8008C258 3C06800E */  lui        $a2, %hi(widget_handler_pointer)
/* 8CE5C 8008C25C 3C038009 */  lui        $v1, %hi(D_8008C1B0)
/* 8CE60 8008C260 8CC47EAC */  lw         $a0, %lo(widget_handler_pointer)($a2)
/* 8CE64 8008C264 9606005E */  lhu        $a2, 0x5e($s0)
/* 8CE68 8008C268 2463C1B0 */  addiu      $v1, $v1, %lo(D_8008C1B0)
/* 8CE6C 8008C26C AC43001C */  sw         $v1, 0x1c($v0)
/* 8CE70 8008C270 0C02DC7C */  jal        widgetHandler
/* 8CE74 8008C274 A446005E */   sh        $a2, 0x5e($v0)
/* 8CE78 8008C278 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8CE7C 8008C27C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CE80 8008C280 00001021 */  addu       $v0, $zero, $zero
/* 8CE84 8008C284 03E00008 */  jr         $ra
/* 8CE88 8008C288 27BD0018 */   addiu     $sp, $sp, 0x18

glabel pfs_err_new_pak
/* 8CE8C 8008C28C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8CE90 8008C290 AFB20018 */  sw         $s2, 0x18($sp)
/* 8CE94 8008C294 309200FF */  andi       $s2, $a0, 0xff
/* 8CE98 8008C298 00002021 */  addu       $a0, $zero, $zero
/* 8CE9C 8008C29C AFBF001C */  sw         $ra, 0x1c($sp)
/* 8CEA0 8008C2A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 8CEA4 8008C2A4 0C026EB7 */  jal        get_psf_err
/* 8CEA8 8008C2A8 AFB00010 */   sw        $s0, 0x10($sp)
/* 8CEAC 8008C2AC 00402021 */  addu       $a0, $v0, $zero
/* 8CEB0 8008C2B0 24020006 */  addiu      $v0, $zero, 6
/* 8CEB4 8008C2B4 14820004 */  bne        $a0, $v0, .L8008C2C8
/* 8CEB8 8008C2B8 00000000 */   nop
/* 8CEBC 8008C2BC 0C026EB7 */  jal        get_psf_err
/* 8CEC0 8008C2C0 00002021 */   addu      $a0, $zero, $zero
/* 8CEC4 8008C2C4 00402021 */  addu       $a0, $v0, $zero
.L8008C2C8:
/* 8CEC8 8008C2C8 10800005 */  beqz       $a0, .L8008C2E0
/* 8CECC 8008C2CC 3C10800F */   lui       $s0, %hi(controller_romstring)
/* 8CED0 8008C2D0 0C023026 */  jal        run_cont_err_func
/* 8CED4 8008C2D4 00000000 */   nop
/* 8CED8 8008C2D8 080230CC */  j          .L8008C330
/* 8CEDC 8008C2DC 8FBF001C */   lw        $ra, 0x1c($sp)
.L8008C2E0:
/* 8CEE0 8008C2E0 8E021C98 */  lw         $v0, %lo(controller_romstring)($s0)
/* 8CEE4 8008C2E4 8C450028 */  lw         $a1, 0x28($v0)
/* 8CEE8 8008C2E8 0C02229E */  jal        func_80088A78
/* 8CEEC 8008C2EC 24040001 */   addiu     $a0, $zero, 1
/* 8CEF0 8008C2F0 3C058009 */  lui        $a1, %hi(ret0_8008c1bc)
/* 8CEF4 8008C2F4 24A5C1BC */  addiu      $a1, $a1, %lo(ret0_8008c1bc)
/* 8CEF8 8008C2F8 8E031C98 */  lw         $v1, 0x1c98($s0)
/* 8CEFC 8008C2FC 00408021 */  addu       $s0, $v0, $zero
/* 8CF00 8008C300 8C64002C */  lw         $a0, 0x2c($v1)
/* 8CF04 8008C304 0C02227C */  jal        text_func
/* 8CF08 8008C308 24060080 */   addiu     $a2, $zero, 0x80
/* 8CF0C 8008C30C 02002021 */  addu       $a0, $s0, $zero
/* 8CF10 8008C310 00408821 */  addu       $s1, $v0, $zero
/* 8CF14 8008C314 0C013626 */  jal        func_8004D898
/* 8CF18 8008C318 02202821 */   addu      $a1, $s1, $zero
/* 8CF1C 8008C31C 02002021 */  addu       $a0, $s0, $zero
/* 8CF20 8008C320 0C013786 */  jal        func_8004DE18
/* 8CF24 8008C324 A632005E */   sh        $s2, 0x5e($s1)
/* 8CF28 8008C328 A612005E */  sh         $s2, 0x5e($s0)
/* 8CF2C 8008C32C 8FBF001C */  lw         $ra, 0x1c($sp)
.L8008C330:
/* 8CF30 8008C330 8FB20018 */  lw         $s2, 0x18($sp)
/* 8CF34 8008C334 8FB10014 */  lw         $s1, 0x14($sp)
/* 8CF38 8008C338 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CF3C 8008C33C 03E00008 */  jr         $ra
/* 8CF40 8008C340 27BD0020 */   addiu     $sp, $sp, 0x20

glabel pfs_err_Nopak
/* 8CF44 8008C344 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8CF48 8008C348 AFB00010 */  sw         $s0, 0x10($sp)
/* 8CF4C 8008C34C 3C10800F */  lui        $s0, %hi(controller_romstring)
/* 8CF50 8008C350 8E021C98 */  lw         $v0, %lo(controller_romstring)($s0)
/* 8CF54 8008C354 AFB20018 */  sw         $s2, 0x18($sp)
/* 8CF58 8008C358 309200FF */  andi       $s2, $a0, 0xff
/* 8CF5C 8008C35C AFBF001C */  sw         $ra, 0x1c($sp)
/* 8CF60 8008C360 AFB10014 */  sw         $s1, 0x14($sp)
/* 8CF64 8008C364 8C450018 */  lw         $a1, 0x18($v0)
/* 8CF68 8008C368 0C02229E */  jal        func_80088A78
/* 8CF6C 8008C36C 24040001 */   addiu     $a0, $zero, 1
/* 8CF70 8008C370 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8CF74 8008C374 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8CF78 8008C378 8E031C98 */  lw         $v1, 0x1c98($s0)
/* 8CF7C 8008C37C 00408021 */  addu       $s0, $v0, $zero
/* 8CF80 8008C380 8C64001C */  lw         $a0, 0x1c($v1)
/* 8CF84 8008C384 0C02227C */  jal        text_func
/* 8CF88 8008C388 24060080 */   addiu     $a2, $zero, 0x80
/* 8CF8C 8008C38C 02002021 */  addu       $a0, $s0, $zero
/* 8CF90 8008C390 00408821 */  addu       $s1, $v0, $zero
/* 8CF94 8008C394 0C013626 */  jal        func_8004D898
/* 8CF98 8008C398 02202821 */   addu      $a1, $s1, $zero
/* 8CF9C 8008C39C 02002021 */  addu       $a0, $s0, $zero
/* 8CFA0 8008C3A0 0C013786 */  jal        func_8004DE18
/* 8CFA4 8008C3A4 A632005E */   sh        $s2, 0x5e($s1)
/* 8CFA8 8008C3A8 02002021 */  addu       $a0, $s0, $zero
/* 8CFAC 8008C3AC 24050001 */  addiu      $a1, $zero, 1
/* 8CFB0 8008C3B0 0C013779 */  jal        func_8004DDE4
/* 8CFB4 8008C3B4 A612005E */   sh        $s2, 0x5e($s0)
/* 8CFB8 8008C3B8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8CFBC 8008C3BC 8FB20018 */  lw         $s2, 0x18($sp)
/* 8CFC0 8008C3C0 8FB10014 */  lw         $s1, 0x14($sp)
/* 8CFC4 8008C3C4 8FB00010 */  lw         $s0, 0x10($sp)
/* 8CFC8 8008C3C8 03E00008 */  jr         $ra
/* 8CFCC 8008C3CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel psf_err_contrfail
/* 8CFD0 8008C3D0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8CFD4 8008C3D4 AFB10014 */  sw         $s1, 0x14($sp)
/* 8CFD8 8008C3D8 3C11800F */  lui        $s1, %hi(controller_romstring)
/* 8CFDC 8008C3DC 8E221C98 */  lw         $v0, %lo(controller_romstring)($s1)
/* 8CFE0 8008C3E0 AFB20018 */  sw         $s2, 0x18($sp)
/* 8CFE4 8008C3E4 309200FF */  andi       $s2, $a0, 0xff
/* 8CFE8 8008C3E8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8CFEC 8008C3EC AFB3001C */  sw         $s3, 0x1c($sp)
/* 8CFF0 8008C3F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 8CFF4 8008C3F4 8C45000C */  lw         $a1, 0xc($v0)
/* 8CFF8 8008C3F8 0C02229E */  jal        func_80088A78
/* 8CFFC 8008C3FC 24040002 */   addiu     $a0, $zero, 2
/* 8D000 8008C400 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8D004 8008C404 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8D008 8008C408 8E231C98 */  lw         $v1, 0x1c98($s1)
/* 8D00C 8008C40C 24060080 */  addiu      $a2, $zero, 0x80
/* 8D010 8008C410 8C640000 */  lw         $a0, ($v1)
/* 8D014 8008C414 0C02227C */  jal        text_func
/* 8D018 8008C418 00408021 */   addu      $s0, $v0, $zero
/* 8D01C 8008C41C 00409821 */  addu       $s3, $v0, $zero
/* 8D020 8008C420 02002021 */  addu       $a0, $s0, $zero
/* 8D024 8008C424 0C013626 */  jal        func_8004D898
/* 8D028 8008C428 02602821 */   addu      $a1, $s3, $zero
/* 8D02C 8008C42C 3C058009 */  lui        $a1, %hi(ret0_8008c1bc)
/* 8D030 8008C430 8E221C98 */  lw         $v0, 0x1c98($s1)
/* 8D034 8008C434 24A5C1BC */  addiu      $a1, $a1, %lo(ret0_8008c1bc)
/* 8D038 8008C438 8C440010 */  lw         $a0, 0x10($v0)
/* 8D03C 8008C43C 24060080 */  addiu      $a2, $zero, 0x80
/* 8D040 8008C440 0C02227C */  jal        text_func
/* 8D044 8008C444 A672005E */   sh        $s2, 0x5e($s3)
/* 8D048 8008C448 00409821 */  addu       $s3, $v0, $zero
/* 8D04C 8008C44C 02002021 */  addu       $a0, $s0, $zero
/* 8D050 8008C450 0C013626 */  jal        func_8004D898
/* 8D054 8008C454 02602821 */   addu      $a1, $s3, $zero
/* 8D058 8008C458 02002021 */  addu       $a0, $s0, $zero
/* 8D05C 8008C45C 0C013786 */  jal        func_8004DE18
/* 8D060 8008C460 A672005E */   sh        $s2, 0x5e($s3)
/* 8D064 8008C464 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8D068 8008C468 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8D06C 8008C46C A612005E */  sh         $s2, 0x5e($s0)
/* 8D070 8008C470 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D074 8008C474 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D078 8008C478 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D07C 8008C47C 03E00008 */  jr         $ra
/* 8D080 8008C480 27BD0028 */   addiu     $sp, $sp, 0x28

glabel pfs_err_err_device
/* 8D084 8008C484 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8D088 8008C488 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D08C 8008C48C 3C10800F */  lui        $s0, %hi(controller_romstring)
/* 8D090 8008C490 8E021C98 */  lw         $v0, %lo(controller_romstring)($s0)
/* 8D094 8008C494 AFB20018 */  sw         $s2, 0x18($sp)
/* 8D098 8008C498 309200FF */  andi       $s2, $a0, 0xff
/* 8D09C 8008C49C AFBF001C */  sw         $ra, 0x1c($sp)
/* 8D0A0 8008C4A0 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D0A4 8008C4A4 8C45004C */  lw         $a1, 0x4c($v0)
/* 8D0A8 8008C4A8 0C02229E */  jal        func_80088A78
/* 8D0AC 8008C4AC 24040001 */   addiu     $a0, $zero, 1
/* 8D0B0 8008C4B0 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8D0B4 8008C4B4 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8D0B8 8008C4B8 8E031C98 */  lw         $v1, 0x1c98($s0)
/* 8D0BC 8008C4BC 00408021 */  addu       $s0, $v0, $zero
/* 8D0C0 8008C4C0 8C64001C */  lw         $a0, 0x1c($v1)
/* 8D0C4 8008C4C4 0C02227C */  jal        text_func
/* 8D0C8 8008C4C8 24060080 */   addiu     $a2, $zero, 0x80
/* 8D0CC 8008C4CC 02002021 */  addu       $a0, $s0, $zero
/* 8D0D0 8008C4D0 00408821 */  addu       $s1, $v0, $zero
/* 8D0D4 8008C4D4 0C013626 */  jal        func_8004D898
/* 8D0D8 8008C4D8 02202821 */   addu      $a1, $s1, $zero
/* 8D0DC 8008C4DC 02002021 */  addu       $a0, $s0, $zero
/* 8D0E0 8008C4E0 0C013786 */  jal        func_8004DE18
/* 8D0E4 8008C4E4 A632005E */   sh        $s2, 0x5e($s1)
/* 8D0E8 8008C4E8 02002021 */  addu       $a0, $s0, $zero
/* 8D0EC 8008C4EC 24050001 */  addiu      $a1, $zero, 1
/* 8D0F0 8008C4F0 0C013779 */  jal        func_8004DDE4
/* 8D0F4 8008C4F4 A612005E */   sh        $s2, 0x5e($s0)
/* 8D0F8 8008C4F8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8D0FC 8008C4FC 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D100 8008C500 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D104 8008C504 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D108 8008C508 03E00008 */  jr         $ra
/* 8D10C 8008C50C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel pfs_err_id_fatal
/* 8D110 8008C510 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D114 8008C514 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D118 8008C518 309000FF */  andi       $s0, $a0, 0xff
/* 8D11C 8008C51C AFBF0014 */  sw         $ra, 0x14($sp)
/* 8D120 8008C520 0C0270E2 */  jal        query_controller
/* 8D124 8008C524 00002021 */   addu      $a0, $zero, $zero
/* 8D128 8008C528 10400005 */  beqz       $v0, .L8008C540
/* 8D12C 8008C52C 00000000 */   nop
/* 8D130 8008C530 0C0231D9 */  jal        psf_err_inconsistent
/* 8D134 8008C534 02002021 */   addu      $a0, $s0, $zero
/* 8D138 8008C538 08023153 */  j          .L8008C54C
/* 8D13C 8008C53C 8FBF0014 */   lw        $ra, 0x14($sp)
.L8008C540:
/* 8D140 8008C540 0C0231CF */  jal        func_8008C73C
/* 8D144 8008C544 02002021 */   addu      $a0, $s0, $zero
/* 8D148 8008C548 8FBF0014 */  lw         $ra, 0x14($sp)
.L8008C54C:
/* 8D14C 8008C54C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D150 8008C550 03E00008 */  jr         $ra
/* 8D154 8008C554 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008C558
/* 8D158 8008C558 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8D15C 8008C55C 00801021 */  addu       $v0, $a0, $zero
/* 8D160 8008C560 24040003 */  addiu      $a0, $zero, 3
/* 8D164 8008C564 AFB20018 */  sw         $s2, 0x18($sp)
/* 8D168 8008C568 30B200FF */  andi       $s2, $a1, 0xff
/* 8D16C 8008C56C 00402821 */  addu       $a1, $v0, $zero
/* 8D170 8008C570 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8D174 8008C574 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8D178 8008C578 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D17C 8008C57C 0C02229E */  jal        func_80088A78
/* 8D180 8008C580 AFB00010 */   sw        $s0, 0x10($sp)
/* 8D184 8008C584 3C058009 */  lui        $a1, %hi(ret0_8008c1bc)
/* 8D188 8008C588 24A5C1BC */  addiu      $a1, $a1, %lo(ret0_8008c1bc)
/* 8D18C 8008C58C 3C11800F */  lui        $s1, %hi(controller_romstring)
/* 8D190 8008C590 8E231C98 */  lw         $v1, %lo(controller_romstring)($s1)
/* 8D194 8008C594 24060080 */  addiu      $a2, $zero, 0x80
/* 8D198 8008C598 8C640010 */  lw         $a0, 0x10($v1)
/* 8D19C 8008C59C 0C02227C */  jal        text_func
/* 8D1A0 8008C5A0 00408021 */   addu      $s0, $v0, $zero
/* 8D1A4 8008C5A4 00409821 */  addu       $s3, $v0, $zero
/* 8D1A8 8008C5A8 02002021 */  addu       $a0, $s0, $zero
/* 8D1AC 8008C5AC 0C013626 */  jal        func_8004D898
/* 8D1B0 8008C5B0 02602821 */   addu      $a1, $s3, $zero
/* 8D1B4 8008C5B4 3C058009 */  lui        $a1, %hi(func_8008C15C)
/* 8D1B8 8008C5B8 8E221C98 */  lw         $v0, 0x1c98($s1)
/* 8D1BC 8008C5BC 24A5C15C */  addiu      $a1, $a1, %lo(func_8008C15C)
/* 8D1C0 8008C5C0 8C440024 */  lw         $a0, 0x24($v0)
/* 8D1C4 8008C5C4 24060080 */  addiu      $a2, $zero, 0x80
/* 8D1C8 8008C5C8 0C02227C */  jal        text_func
/* 8D1CC 8008C5CC A672005E */   sh        $s2, 0x5e($s3)
/* 8D1D0 8008C5D0 00409821 */  addu       $s3, $v0, $zero
/* 8D1D4 8008C5D4 02002021 */  addu       $a0, $s0, $zero
/* 8D1D8 8008C5D8 0C013626 */  jal        func_8004D898
/* 8D1DC 8008C5DC 02602821 */   addu      $a1, $s3, $zero
/* 8D1E0 8008C5E0 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8D1E4 8008C5E4 8E221C98 */  lw         $v0, 0x1c98($s1)
/* 8D1E8 8008C5E8 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8D1EC 8008C5EC 8C440000 */  lw         $a0, ($v0)
/* 8D1F0 8008C5F0 24060080 */  addiu      $a2, $zero, 0x80
/* 8D1F4 8008C5F4 0C02227C */  jal        text_func
/* 8D1F8 8008C5F8 A672005E */   sh        $s2, 0x5e($s3)
/* 8D1FC 8008C5FC 00409821 */  addu       $s3, $v0, $zero
/* 8D200 8008C600 02002021 */  addu       $a0, $s0, $zero
/* 8D204 8008C604 0C013626 */  jal        func_8004D898
/* 8D208 8008C608 02602821 */   addu      $a1, $s3, $zero
/* 8D20C 8008C60C 02002021 */  addu       $a0, $s0, $zero
/* 8D210 8008C610 0C013786 */  jal        func_8004DE18
/* 8D214 8008C614 A672005E */   sh        $s2, 0x5e($s3)
/* 8D218 8008C618 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8D21C 8008C61C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8D220 8008C620 A612005E */  sh         $s2, 0x5e($s0)
/* 8D224 8008C624 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D228 8008C628 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D22C 8008C62C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D230 8008C630 03E00008 */  jr         $ra
/* 8D234 8008C634 27BD0028 */   addiu     $sp, $sp, 0x28

glabel pfs_err_data_full
/* 8D238 8008C638 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D23C 8008C63C 3C02800F */  lui        $v0, %hi(controller_romstring)
/* 8D240 8008C640 8C431C98 */  lw         $v1, %lo(controller_romstring)($v0)
/* 8D244 8008C644 308500FF */  andi       $a1, $a0, 0xff
/* 8D248 8008C648 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D24C 8008C64C 0C023156 */  jal        func_8008C558
/* 8D250 8008C650 8C640004 */   lw        $a0, 4($v1)
/* 8D254 8008C654 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D258 8008C658 03E00008 */  jr         $ra
/* 8D25C 8008C65C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel not_enough_freespace
/* 8D260 8008C660 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D264 8008C664 3C02800F */  lui        $v0, %hi(controller_romstring)
/* 8D268 8008C668 8C431C98 */  lw         $v1, %lo(controller_romstring)($v0)
/* 8D26C 8008C66C 308500FF */  andi       $a1, $a0, 0xff
/* 8D270 8008C670 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D274 8008C674 0C023156 */  jal        func_8008C558
/* 8D278 8008C678 8C640008 */   lw        $a0, 8($v1)
/* 8D27C 8008C67C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D280 8008C680 03E00008 */  jr         $ra
/* 8D284 8008C684 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008C688
/* 8D288 8008C688 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8D28C 8008C68C 00801021 */  addu       $v0, $a0, $zero
/* 8D290 8008C690 24040002 */  addiu      $a0, $zero, 2
/* 8D294 8008C694 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D298 8008C698 30B100FF */  andi       $s1, $a1, 0xff
/* 8D29C 8008C69C 00402821 */  addu       $a1, $v0, $zero
/* 8D2A0 8008C6A0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8D2A4 8008C6A4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8D2A8 8008C6A8 AFB20018 */  sw         $s2, 0x18($sp)
/* 8D2AC 8008C6AC 0C02229E */  jal        func_80088A78
/* 8D2B0 8008C6B0 AFB00010 */   sw        $s0, 0x10($sp)
/* 8D2B4 8008C6B4 3C058009 */  lui        $a1, %hi(func_8008C1C4)
/* 8D2B8 8008C6B8 24A5C1C4 */  addiu      $a1, $a1, %lo(func_8008C1C4)
/* 8D2BC 8008C6BC 3C12800F */  lui        $s2, %hi(controller_romstring)
/* 8D2C0 8008C6C0 8E431C98 */  lw         $v1, %lo(controller_romstring)($s2)
/* 8D2C4 8008C6C4 24060080 */  addiu      $a2, $zero, 0x80
/* 8D2C8 8008C6C8 8C64003C */  lw         $a0, 0x3c($v1)
/* 8D2CC 8008C6CC 0C02227C */  jal        text_func
/* 8D2D0 8008C6D0 00408021 */   addu      $s0, $v0, $zero
/* 8D2D4 8008C6D4 00409821 */  addu       $s3, $v0, $zero
/* 8D2D8 8008C6D8 02002021 */  addu       $a0, $s0, $zero
/* 8D2DC 8008C6DC 0C013626 */  jal        func_8004D898
/* 8D2E0 8008C6E0 02602821 */   addu      $a1, $s3, $zero
/* 8D2E4 8008C6E4 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8D2E8 8008C6E8 8E421C98 */  lw         $v0, 0x1c98($s2)
/* 8D2EC 8008C6EC 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8D2F0 8008C6F0 8C440000 */  lw         $a0, ($v0)
/* 8D2F4 8008C6F4 24060080 */  addiu      $a2, $zero, 0x80
/* 8D2F8 8008C6F8 0C02227C */  jal        text_func
/* 8D2FC 8008C6FC A671005E */   sh        $s1, 0x5e($s3)
/* 8D300 8008C700 00409821 */  addu       $s3, $v0, $zero
/* 8D304 8008C704 02002021 */  addu       $a0, $s0, $zero
/* 8D308 8008C708 0C013626 */  jal        func_8004D898
/* 8D30C 8008C70C 02602821 */   addu      $a1, $s3, $zero
/* 8D310 8008C710 02002021 */  addu       $a0, $s0, $zero
/* 8D314 8008C714 0C013786 */  jal        func_8004DE18
/* 8D318 8008C718 A671005E */   sh        $s1, 0x5e($s3)
/* 8D31C 8008C71C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8D320 8008C720 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8D324 8008C724 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D328 8008C728 A611005E */  sh         $s1, 0x5e($s0)
/* 8D32C 8008C72C 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D330 8008C730 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D334 8008C734 03E00008 */  jr         $ra
/* 8D338 8008C738 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008C73C
/* 8D33C 8008C73C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D340 8008C740 3C02800F */  lui        $v0, %hi(controller_romstring)
/* 8D344 8008C744 8C431C98 */  lw         $v1, %lo(controller_romstring)($v0)
/* 8D348 8008C748 308500FF */  andi       $a1, $a0, 0xff
/* 8D34C 8008C74C AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D350 8008C750 0C0231A2 */  jal        func_8008C688
/* 8D354 8008C754 8C640034 */   lw        $a0, 0x34($v1)
/* 8D358 8008C758 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D35C 8008C75C 03E00008 */  jr         $ra
/* 8D360 8008C760 27BD0018 */   addiu     $sp, $sp, 0x18

glabel psf_err_inconsistent
/* 8D364 8008C764 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D368 8008C768 3C02800F */  lui        $v0, %hi(controller_romstring)
/* 8D36C 8008C76C 8C431C98 */  lw         $v1, %lo(controller_romstring)($v0)
/* 8D370 8008C770 308500FF */  andi       $a1, $a0, 0xff
/* 8D374 8008C774 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D378 8008C778 0C0231A2 */  jal        func_8008C688
/* 8D37C 8008C77C 8C640030 */   lw        $a0, 0x30($v1)
/* 8D380 8008C780 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D384 8008C784 03E00008 */  jr         $ra
/* 8D388 8008C788 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008C78C
/* 8D38C 8008C78C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8D390 8008C790 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D394 8008C794 3C10800F */  lui        $s0, %hi(controller_romstring)
/* 8D398 8008C798 8E021C98 */  lw         $v0, %lo(controller_romstring)($s0)
/* 8D39C 8008C79C AFB20018 */  sw         $s2, 0x18($sp)
/* 8D3A0 8008C7A0 309200FF */  andi       $s2, $a0, 0xff
/* 8D3A4 8008C7A4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8D3A8 8008C7A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D3AC 8008C7AC 8C450040 */  lw         $a1, 0x40($v0)
/* 8D3B0 8008C7B0 0C02229E */  jal        func_80088A78
/* 8D3B4 8008C7B4 24040001 */   addiu     $a0, $zero, 1
/* 8D3B8 8008C7B8 3C058009 */  lui        $a1, %hi(ret0_8008c1bc)
/* 8D3BC 8008C7BC 24A5C1BC */  addiu      $a1, $a1, %lo(ret0_8008c1bc)
/* 8D3C0 8008C7C0 8E031C98 */  lw         $v1, 0x1c98($s0)
/* 8D3C4 8008C7C4 00408021 */  addu       $s0, $v0, $zero
/* 8D3C8 8008C7C8 8C64002C */  lw         $a0, 0x2c($v1)
/* 8D3CC 8008C7CC 0C02227C */  jal        text_func
/* 8D3D0 8008C7D0 24060080 */   addiu     $a2, $zero, 0x80
/* 8D3D4 8008C7D4 02002021 */  addu       $a0, $s0, $zero
/* 8D3D8 8008C7D8 00408821 */  addu       $s1, $v0, $zero
/* 8D3DC 8008C7DC 0C013626 */  jal        func_8004D898
/* 8D3E0 8008C7E0 02202821 */   addu      $a1, $s1, $zero
/* 8D3E4 8008C7E4 02002021 */  addu       $a0, $s0, $zero
/* 8D3E8 8008C7E8 0C013786 */  jal        func_8004DE18
/* 8D3EC 8008C7EC A632005E */   sh        $s2, 0x5e($s1)
/* 8D3F0 8008C7F0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8D3F4 8008C7F4 A612005E */  sh         $s2, 0x5e($s0)
/* 8D3F8 8008C7F8 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D3FC 8008C7FC 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D400 8008C800 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D404 8008C804 03E00008 */  jr         $ra
/* 8D408 8008C808 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008C80C
/* 8D40C 8008C80C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8D410 8008C810 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D414 8008C814 3C11800F */  lui        $s1, %hi(controller_romstring)
/* 8D418 8008C818 8E221C98 */  lw         $v0, %lo(controller_romstring)($s1)
/* 8D41C 8008C81C AFB20018 */  sw         $s2, 0x18($sp)
/* 8D420 8008C820 309200FF */  andi       $s2, $a0, 0xff
/* 8D424 8008C824 AFBF0020 */  sw         $ra, 0x20($sp)
/* 8D428 8008C828 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8D42C 8008C82C AFB00010 */  sw         $s0, 0x10($sp)
/* 8D430 8008C830 8C450044 */  lw         $a1, 0x44($v0)
/* 8D434 8008C834 0C02229E */  jal        func_80088A78
/* 8D438 8008C838 24040002 */   addiu     $a0, $zero, 2
/* 8D43C 8008C83C 3C058009 */  lui        $a1, %hi(func_8008C228)
/* 8D440 8008C840 24A5C228 */  addiu      $a1, $a1, %lo(func_8008C228)
/* 8D444 8008C844 8E231C98 */  lw         $v1, 0x1c98($s1)
/* 8D448 8008C848 24060080 */  addiu      $a2, $zero, 0x80
/* 8D44C 8008C84C 8C640010 */  lw         $a0, 0x10($v1)
/* 8D450 8008C850 0C02227C */  jal        text_func
/* 8D454 8008C854 00408021 */   addu      $s0, $v0, $zero
/* 8D458 8008C858 00409821 */  addu       $s3, $v0, $zero
/* 8D45C 8008C85C 02002021 */  addu       $a0, $s0, $zero
/* 8D460 8008C860 0C013626 */  jal        func_8004D898
/* 8D464 8008C864 02602821 */   addu      $a1, $s3, $zero
/* 8D468 8008C868 3C058009 */  lui        $a1, %hi(continue_without_saving_)
/* 8D46C 8008C86C 8E221C98 */  lw         $v0, 0x1c98($s1)
/* 8D470 8008C870 24A5C13C */  addiu      $a1, $a1, %lo(continue_without_saving_)
/* 8D474 8008C874 8C440000 */  lw         $a0, ($v0)
/* 8D478 8008C878 24060080 */  addiu      $a2, $zero, 0x80
/* 8D47C 8008C87C 0C02227C */  jal        text_func
/* 8D480 8008C880 A672005E */   sh        $s2, 0x5e($s3)
/* 8D484 8008C884 00409821 */  addu       $s3, $v0, $zero
/* 8D488 8008C888 02002021 */  addu       $a0, $s0, $zero
/* 8D48C 8008C88C 0C013626 */  jal        func_8004D898
/* 8D490 8008C890 02602821 */   addu      $a1, $s3, $zero
/* 8D494 8008C894 02002021 */  addu       $a0, $s0, $zero
/* 8D498 8008C898 0C013786 */  jal        func_8004DE18
/* 8D49C 8008C89C A672005E */   sh        $s2, 0x5e($s3)
/* 8D4A0 8008C8A0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8D4A4 8008C8A4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8D4A8 8008C8A8 A612005E */  sh         $s2, 0x5e($s0)
/* 8D4AC 8008C8AC 8FB20018 */  lw         $s2, 0x18($sp)
/* 8D4B0 8008C8B0 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D4B4 8008C8B4 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D4B8 8008C8B8 03E00008 */  jr         $ra
/* 8D4BC 8008C8BC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel appstate_4
/* 8D4C0 8008C8C0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 8D4C4 8008C8C4 AFB20020 */  sw         $s2, 0x20($sp)
/* 8D4C8 8008C8C8 00809021 */  addu       $s2, $a0, $zero
/* 8D4CC 8008C8CC AFBF0028 */  sw         $ra, 0x28($sp)
/* 8D4D0 8008C8D0 AFB30024 */  sw         $s3, 0x24($sp)
/* 8D4D4 8008C8D4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 8D4D8 8008C8D8 AFB00018 */  sw         $s0, 0x18($sp)
/* 8D4DC 8008C8DC 8E440000 */  lw         $a0, ($s2)
/* 8D4E0 8008C8E0 0C0087C0 */  jal        RenderSky
/* 8D4E4 8008C8E4 24050001 */   addiu     $a1, $zero, 1
/* 8D4E8 8008C8E8 00402021 */  addu       $a0, $v0, $zero
/* 8D4EC 8008C8EC 00002821 */  addu       $a1, $zero, $zero
/* 8D4F0 8008C8F0 00003021 */  addu       $a2, $zero, $zero
/* 8D4F4 8008C8F4 24070140 */  addiu      $a3, $zero, 0x140
/* 8D4F8 8008C8F8 241100F0 */  addiu      $s1, $zero, 0xf0
/* 8D4FC 8008C8FC 0C0023E5 */  jal        some_rsp_func
/* 8D500 8008C900 AFB10010 */   sw        $s1, 0x10($sp)
/* 8D504 8008C904 0C02326F */  jal        ret_a0_8008C9BC
/* 8D508 8008C908 00402021 */   addu      $a0, $v0, $zero
/* 8D50C 8008C90C 0C0025B4 */  jal        get_hres
/* 8D510 8008C910 00409821 */   addu      $s3, $v0, $zero
/* 8D514 8008C914 0C0025B7 */  jal        get_vres
/* 8D518 8008C918 00408021 */   addu      $s0, $v0, $zero
/* 8D51C 8008C91C 02602021 */  addu       $a0, $s3, $zero
/* 8D520 8008C920 24050006 */  addiu      $a1, $zero, 6
/* 8D524 8008C924 02003021 */  addu       $a2, $s0, $zero
/* 8D528 8008C928 0C0290ED */  jal        rsp_func
/* 8D52C 8008C92C 00403821 */   addu      $a3, $v0, $zero
/* 8D530 8008C930 00409821 */  addu       $s3, $v0, $zero
/* 8D534 8008C934 3C10800E */  lui        $s0, %hi(gGlobals)
/* 8D538 8008C938 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 8D53C 8008C93C 8E041604 */  lw         $a0, 0x1604($s0)
/* 8D540 8008C940 0C02DBF7 */  jal        func_800B6FDC
/* 8D544 8008C944 24050001 */   addiu     $a1, $zero, 1
/* 8D548 8008C948 02602821 */  addu       $a1, $s3, $zero
/* 8D54C 8008C94C 00003021 */  addu       $a2, $zero, $zero
/* 8D550 8008C950 00003821 */  addu       $a3, $zero, $zero
/* 8D554 8008C954 8E041604 */  lw         $a0, 0x1604($s0)
/* 8D558 8008C958 24020140 */  addiu      $v0, $zero, 0x140
/* 8D55C 8008C95C AFA20010 */  sw         $v0, 0x10($sp)
/* 8D560 8008C960 0C02DCCE */  jal        func_800B7338
/* 8D564 8008C964 AFB10014 */   sw        $s1, 0x14($sp)
/* 8D568 8008C968 8FBF0028 */  lw         $ra, 0x28($sp)
/* 8D56C 8008C96C 8FB30024 */  lw         $s3, 0x24($sp)
/* 8D570 8008C970 AE420000 */  sw         $v0, ($s2)
/* 8D574 8008C974 8FB20020 */  lw         $s2, 0x20($sp)
/* 8D578 8008C978 8FB1001C */  lw         $s1, 0x1c($sp)
/* 8D57C 8008C97C 8FB00018 */  lw         $s0, 0x18($sp)
/* 8D580 8008C980 24020004 */  addiu      $v0, $zero, 4
/* 8D584 8008C984 03E00008 */  jr         $ra
/* 8D588 8008C988 27BD0030 */   addiu     $sp, $sp, 0x30

glabel check_for_controller
/* 8D58C 8008C98C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 8D590 8008C990 AFBF0010 */  sw         $ra, 0x10($sp)
/* 8D594 8008C994 0C026E11 */  jal        controller_status_check
/* 8D598 8008C998 00002021 */   addu      $a0, $zero, $zero
/* 8D59C 8008C99C 14400004 */  bnez       $v0, .L8008C9B0
/* 8D5A0 8008C9A0 24020001 */   addiu     $v0, $zero, 1
/* 8D5A4 8008C9A4 0C023271 */  jal        no_controller_warning
/* 8D5A8 8008C9A8 00000000 */   nop
/* 8D5AC 8008C9AC 00001021 */  addu       $v0, $zero, $zero
.L8008C9B0:
/* 8D5B0 8008C9B0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 8D5B4 8008C9B4 03E00008 */  jr         $ra
/* 8D5B8 8008C9B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret_a0_8008C9BC
/* 8D5BC 8008C9BC 03E00008 */  jr         $ra
/* 8D5C0 8008C9C0 00801021 */   addu      $v0, $a0, $zero

glabel no_controller_warning
/* 8D5C4 8008C9C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8D5C8 8008C9C8 2404007C */  addiu      $a0, $zero, 0x7c
/* 8D5CC 8008C9CC AFBF0018 */  sw         $ra, 0x18($sp)
/* 8D5D0 8008C9D0 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D5D4 8008C9D4 0C026259 */  jal        passToMalloc
/* 8D5D8 8008C9D8 AFB00010 */   sw        $s0, 0x10($sp)
/* 8D5DC 8008C9DC 240400FB */  addiu      $a0, $zero, 0xfb
/* 8D5E0 8008C9E0 0C0290E2 */  jal        get_borg_8
/* 8D5E4 8008C9E4 00408021 */   addu      $s0, $v0, $zero
/* 8D5E8 8008C9E8 02002021 */  addu       $a0, $s0, $zero
/* 8D5EC 8008C9EC 0C02E518 */  jal        borg8_widget
/* 8D5F0 8008C9F0 00402821 */   addu      $a1, $v0, $zero
/* 8D5F4 8008C9F4 00408821 */  addu       $s1, $v0, $zero
/* 8D5F8 8008C9F8 8E230078 */  lw         $v1, 0x78($s1)
/* 8D5FC 8008C9FC 84640018 */  lh         $a0, 0x18($v1)
/* 8D600 8008CA00 8C62001C */  lw         $v0, 0x1c($v1)
/* 8D604 8008CA04 0040F809 */  jalr       $v0
/* 8D608 8008CA08 02242021 */   addu      $a0, $s1, $a0
/* 8D60C 8008CA0C 00021042 */  srl        $v0, $v0, 1
/* 8D610 8008CA10 241000A0 */  addiu      $s0, $zero, 0xa0
/* 8D614 8008CA14 02028023 */  subu       $s0, $s0, $v0
/* 8D618 8008CA18 00108400 */  sll        $s0, $s0, 0x10
/* 8D61C 8008CA1C 8E230078 */  lw         $v1, 0x78($s1)
/* 8D620 8008CA20 00108403 */  sra        $s0, $s0, 0x10
/* 8D624 8008CA24 84640020 */  lh         $a0, 0x20($v1)
/* 8D628 8008CA28 8C620024 */  lw         $v0, 0x24($v1)
/* 8D62C 8008CA2C 0040F809 */  jalr       $v0
/* 8D630 8008CA30 02242021 */   addu      $a0, $s1, $a0
/* 8D634 8008CA34 02202021 */  addu       $a0, $s1, $zero
/* 8D638 8008CA38 02002821 */  addu       $a1, $s0, $zero
/* 8D63C 8008CA3C 00021042 */  srl        $v0, $v0, 1
/* 8D640 8008CA40 24060078 */  addiu      $a2, $zero, 0x78
/* 8D644 8008CA44 00C23023 */  subu       $a2, $a2, $v0
/* 8D648 8008CA48 00063400 */  sll        $a2, $a2, 0x10
/* 8D64C 8008CA4C 0C02DD3F */  jal        set_widget_coords
/* 8D650 8008CA50 00063403 */   sra       $a2, $a2, 0x10
/* 8D654 8008CA54 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 8D658 8008CA58 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 8D65C 8008CA5C 0C02DC7C */  jal        widgetHandler
/* 8D660 8008CA60 02202821 */   addu      $a1, $s1, $zero
/* 8D664 8008CA64 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8D668 8008CA68 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D66C 8008CA6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D670 8008CA70 03E00008 */  jr         $ra
/* 8D674 8008CA74 27BD0020 */   addiu     $sp, $sp, 0x20
/* 8D678 8008CA78 00000000 */  nop
/* 8D67C 8008CA7C 00000000 */  nop
