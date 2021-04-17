.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8004CC30
/* 4D830 8004CC30 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 4D834 8004CC34 93A30043 */  lbu        $v1, 0x43($sp)
/* 4D838 8004CC38 AFB00018 */  sw         $s0, 0x18($sp)
/* 4D83C 8004CC3C 00008021 */  addu       $s0, $zero, $zero
/* 4D840 8004CC40 AFB20020 */  sw         $s2, 0x20($sp)
/* 4D844 8004CC44 00809021 */  addu       $s2, $a0, $zero
/* 4D848 8004CC48 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4D84C 8004CC4C 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 4D850 8004CC50 AFB30024 */  sw         $s3, 0x24($sp)
/* 4D854 8004CC54 30D3FFFF */  andi       $s3, $a2, 0xffff
/* 4D858 8004CC58 AFB40028 */  sw         $s4, 0x28($sp)
/* 4D85C 8004CC5C 30F4FFFF */  andi       $s4, $a3, 0xffff
/* 4D860 8004CC60 12200013 */  beqz       $s1, .L8004CCB0
/* 4D864 8004CC64 AFBF002C */   sw        $ra, 0x2c($sp)
/* 4D868 8004CC68 10600005 */  beqz       $v1, .L8004CC80
/* 4D86C 8004CC6C 24020001 */   addiu     $v0, $zero, 1
/* 4D870 8004CC70 10620008 */  beq        $v1, $v0, .L8004CC94
/* 4D874 8004CC74 3C02800F */   lui       $v0, 0x800f
/* 4D878 8004CC78 08013329 */  j          .L8004CCA4
/* 4D87C 8004CC7C 00000000 */   nop
.L8004CC80:
/* 4D880 8004CC80 02202021 */  addu       $a0, $s1, $zero
/* 4D884 8004CC84 0C013218 */  jal        GetItemImage
/* 4D888 8004CC88 27A50010 */   addiu     $a1, $sp, 0x10
/* 4D88C 8004CC8C 08013329 */  j          .L8004CCA4
/* 4D890 8004CC90 00000000 */   nop
.L8004CC94:
/* 4D894 8004CC94 8C4413A0 */  lw         $a0, 0x13a0($v0)
/* 4D898 8004CC98 0C01D531 */  jal        getEntityPortait
/* 4D89C 8004CC9C 02202821 */   addu      $a1, $s1, $zero
/* 4D8A0 8004CCA0 AFA20010 */  sw         $v0, 0x10($sp)
.L8004CCA4:
/* 4D8A4 8004CCA4 0C0290E2 */  jal        get_borg_8
/* 4D8A8 8004CCA8 8FA40010 */   lw        $a0, 0x10($sp)
/* 4D8AC 8004CCAC 00408021 */  addu       $s0, $v0, $zero
.L8004CCB0:
/* 4D8B0 8004CCB0 0C026259 */  jal        passToMalloc
/* 4D8B4 8004CCB4 2404007C */   addiu     $a0, $zero, 0x7c
/* 4D8B8 8004CCB8 00402021 */  addu       $a0, $v0, $zero
/* 4D8BC 8004CCBC 0C02E518 */  jal        borg8_widget
/* 4D8C0 8004CCC0 02002821 */   addu      $a1, $s0, $zero
/* 4D8C4 8004CCC4 00408021 */  addu       $s0, $v0, $zero
/* 4D8C8 8004CCC8 A611005E */  sh         $s1, 0x5e($s0)
/* 4D8CC 8004CCCC 02002021 */  addu       $a0, $s0, $zero
/* 4D8D0 8004CCD0 0C02DD42 */  jal        set_widgetHeight
/* 4D8D4 8004CCD4 02602821 */   addu      $a1, $s3, $zero
/* 4D8D8 8004CCD8 02002021 */  addu       $a0, $s0, $zero
/* 4D8DC 8004CCDC 0C02DD46 */  jal        set_widgetWidth
/* 4D8E0 8004CCE0 02802821 */   addu      $a1, $s4, $zero
/* 4D8E4 8004CCE4 12400006 */  beqz       $s2, .L8004CD00
/* 4D8E8 8004CCE8 02002821 */   addu      $a1, $s0, $zero
/* 4D8EC 8004CCEC 8E430078 */  lw         $v1, 0x78($s2)
/* 4D8F0 8004CCF0 84640030 */  lh         $a0, 0x30($v1)
/* 4D8F4 8004CCF4 8C620034 */  lw         $v0, 0x34($v1)
/* 4D8F8 8004CCF8 0040F809 */  jalr       $v0
/* 4D8FC 8004CCFC 02442021 */   addu      $a0, $s2, $a0
.L8004CD00:
/* 4D900 8004CD00 02001021 */  addu       $v0, $s0, $zero
/* 4D904 8004CD04 8FBF002C */  lw         $ra, 0x2c($sp)
/* 4D908 8004CD08 8FB40028 */  lw         $s4, 0x28($sp)
/* 4D90C 8004CD0C 8FB30024 */  lw         $s3, 0x24($sp)
/* 4D910 8004CD10 8FB20020 */  lw         $s2, 0x20($sp)
/* 4D914 8004CD14 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4D918 8004CD18 8FB00018 */  lw         $s0, 0x18($sp)
/* 4D91C 8004CD1C 03E00008 */  jr         $ra
/* 4D920 8004CD20 27BD0030 */   addiu     $sp, $sp, 0x30

glabel make_borg8_widget
/* 4D924 8004CD24 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 4D928 8004CD28 AFB40020 */  sw         $s4, 0x20($sp)
/* 4D92C 8004CD2C 97B40042 */  lhu        $s4, 0x42($sp)
/* 4D930 8004CD30 AFB10014 */  sw         $s1, 0x14($sp)
/* 4D934 8004CD34 00008821 */  addu       $s1, $zero, $zero
/* 4D938 8004CD38 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4D93C 8004CD3C 00809821 */  addu       $s3, $a0, $zero
/* 4D940 8004CD40 AFB50024 */  sw         $s5, 0x24($sp)
/* 4D944 8004CD44 97B50046 */  lhu        $s5, 0x46($sp)
/* 4D948 8004CD48 30A4FFFF */  andi       $a0, $a1, 0xffff
/* 4D94C 8004CD4C AFB00010 */  sw         $s0, 0x10($sp)
/* 4D950 8004CD50 30D0FFFF */  andi       $s0, $a2, 0xffff
/* 4D954 8004CD54 AFB20018 */  sw         $s2, 0x18($sp)
/* 4D958 8004CD58 30F2FFFF */  andi       $s2, $a3, 0xffff
/* 4D95C 8004CD5C 10800004 */  beqz       $a0, .L8004CD70
/* 4D960 8004CD60 AFBF0028 */   sw        $ra, 0x28($sp)
/* 4D964 8004CD64 0C0290E2 */  jal        get_borg_8
/* 4D968 8004CD68 00000000 */   nop
/* 4D96C 8004CD6C 00408821 */  addu       $s1, $v0, $zero
.L8004CD70:
/* 4D970 8004CD70 0C026259 */  jal        passToMalloc
/* 4D974 8004CD74 2404007C */   addiu     $a0, $zero, 0x7c
/* 4D978 8004CD78 00402021 */  addu       $a0, $v0, $zero
/* 4D97C 8004CD7C 0C02E518 */  jal        borg8_widget
/* 4D980 8004CD80 02202821 */   addu      $a1, $s1, $zero
/* 4D984 8004CD84 00408821 */  addu       $s1, $v0, $zero
/* 4D988 8004CD88 16200003 */  bnez       $s1, .L8004CD98
/* 4D98C 8004CD8C 02202021 */   addu      $a0, $s1, $zero
/* 4D990 8004CD90 0801337C */  j          .L8004CDF0
/* 4D994 8004CD94 00001021 */   addu      $v0, $zero, $zero
.L8004CD98:
/* 4D998 8004CD98 02002821 */  addu       $a1, $s0, $zero
/* 4D99C 8004CD9C 0C02DD3F */  jal        set_widget_coords
/* 4D9A0 8004CDA0 02403021 */   addu      $a2, $s2, $zero
/* 4D9A4 8004CDA4 02202021 */  addu       $a0, $s1, $zero
/* 4D9A8 8004CDA8 02902823 */  subu       $a1, $s4, $s0
/* 4D9AC 8004CDAC 24A50001 */  addiu      $a1, $a1, 1
/* 4D9B0 8004CDB0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 4D9B4 8004CDB4 02B28023 */  subu       $s0, $s5, $s2
/* 4D9B8 8004CDB8 26100001 */  addiu      $s0, $s0, 1
/* 4D9BC 8004CDBC 0C02DD42 */  jal        set_widgetHeight
/* 4D9C0 8004CDC0 3210FFFF */   andi      $s0, $s0, 0xffff
/* 4D9C4 8004CDC4 02202021 */  addu       $a0, $s1, $zero
/* 4D9C8 8004CDC8 0C02DD46 */  jal        set_widgetWidth
/* 4D9CC 8004CDCC 02002821 */   addu      $a1, $s0, $zero
/* 4D9D0 8004CDD0 12600006 */  beqz       $s3, .L8004CDEC
/* 4D9D4 8004CDD4 02202821 */   addu      $a1, $s1, $zero
/* 4D9D8 8004CDD8 8E630078 */  lw         $v1, 0x78($s3)
/* 4D9DC 8004CDDC 84640030 */  lh         $a0, 0x30($v1)
/* 4D9E0 8004CDE0 8C620034 */  lw         $v0, 0x34($v1)
/* 4D9E4 8004CDE4 0040F809 */  jalr       $v0
/* 4D9E8 8004CDE8 02642021 */   addu      $a0, $s3, $a0
.L8004CDEC:
/* 4D9EC 8004CDEC 02201021 */  addu       $v0, $s1, $zero
.L8004CDF0:
/* 4D9F0 8004CDF0 8FBF0028 */  lw         $ra, 0x28($sp)
/* 4D9F4 8004CDF4 8FB50024 */  lw         $s5, 0x24($sp)
/* 4D9F8 8004CDF8 8FB40020 */  lw         $s4, 0x20($sp)
/* 4D9FC 8004CDFC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4DA00 8004CE00 8FB20018 */  lw         $s2, 0x18($sp)
/* 4DA04 8004CE04 8FB10014 */  lw         $s1, 0x14($sp)
/* 4DA08 8004CE08 8FB00010 */  lw         $s0, 0x10($sp)
/* 4DA0C 8004CE0C 03E00008 */  jr         $ra
/* 4DA10 8004CE10 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8004CE14
/* 4DA14 8004CE14 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 4DA18 8004CE18 AFB20030 */  sw         $s2, 0x30($sp)
/* 4DA1C 8004CE1C 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 4DA20 8004CE20 02402821 */  addu       $a1, $s2, $zero
/* 4DA24 8004CE24 AFB1002C */  sw         $s1, 0x2c($sp)
/* 4DA28 8004CE28 30D1FFFF */  andi       $s1, $a2, 0xffff
/* 4DA2C 8004CE2C 02203021 */  addu       $a2, $s1, $zero
/* 4DA30 8004CE30 AFB40038 */  sw         $s4, 0x38($sp)
/* 4DA34 8004CE34 30F4FFFF */  andi       $s4, $a3, 0xffff
/* 4DA38 8004CE38 02923823 */  subu       $a3, $s4, $s2
/* 4DA3C 8004CE3C AFB30034 */  sw         $s3, 0x34($sp)
/* 4DA40 8004CE40 97B30052 */  lhu        $s3, 0x52($sp)
/* 4DA44 8004CE44 93A30057 */  lbu        $v1, 0x57($sp)
/* 4DA48 8004CE48 93A8005B */  lbu        $t0, 0x5b($sp)
/* 4DA4C 8004CE4C 93A9005F */  lbu        $t1, 0x5f($sp)
/* 4DA50 8004CE50 93AA0063 */  lbu        $t2, 0x63($sp)
/* 4DA54 8004CE54 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 4DA58 8004CE58 AFBF003C */  sw         $ra, 0x3c($sp)
/* 4DA5C 8004CE5C AFB00028 */  sw         $s0, 0x28($sp)
/* 4DA60 8004CE60 02711023 */  subu       $v0, $s3, $s1
/* 4DA64 8004CE64 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4DA68 8004CE68 AFA20010 */  sw         $v0, 0x10($sp)
/* 4DA6C 8004CE6C AFA30014 */  sw         $v1, 0x14($sp)
/* 4DA70 8004CE70 AFA80018 */  sw         $t0, 0x18($sp)
/* 4DA74 8004CE74 AFA9001C */  sw         $t1, 0x1c($sp)
/* 4DA78 8004CE78 0C02F27C */  jal        func_800BC9F0
/* 4DA7C 8004CE7C AFAA0020 */   sw        $t2, 0x20($sp)
/* 4DA80 8004CE80 00408021 */  addu       $s0, $v0, $zero
/* 4DA84 8004CE84 02002021 */  addu       $a0, $s0, $zero
/* 4DA88 8004CE88 02202821 */  addu       $a1, $s1, $zero
/* 4DA8C 8004CE8C 02403021 */  addu       $a2, $s2, $zero
/* 4DA90 8004CE90 02803821 */  addu       $a3, $s4, $zero
/* 4DA94 8004CE94 0C02DD6A */  jal        some_widget_setter
/* 4DA98 8004CE98 AFB30010 */   sw        $s3, 0x10($sp)
/* 4DA9C 8004CE9C 02001021 */  addu       $v0, $s0, $zero
/* 4DAA0 8004CEA0 8FBF003C */  lw         $ra, 0x3c($sp)
/* 4DAA4 8004CEA4 8FB40038 */  lw         $s4, 0x38($sp)
/* 4DAA8 8004CEA8 8FB30034 */  lw         $s3, 0x34($sp)
/* 4DAAC 8004CEAC 8FB20030 */  lw         $s2, 0x30($sp)
/* 4DAB0 8004CEB0 8FB1002C */  lw         $s1, 0x2c($sp)
/* 4DAB4 8004CEB4 8FB00028 */  lw         $s0, 0x28($sp)
/* 4DAB8 8004CEB8 03E00008 */  jr         $ra
/* 4DABC 8004CEBC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8004CEC0
/* 4DAC0 8004CEC0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4DAC4 8004CEC4 AFB10014 */  sw         $s1, 0x14($sp)
/* 4DAC8 8004CEC8 00808821 */  addu       $s1, $a0, $zero
/* 4DACC 8004CECC AFB00010 */  sw         $s0, 0x10($sp)
/* 4DAD0 8004CED0 00A08021 */  addu       $s0, $a1, $zero
/* 4DAD4 8004CED4 AFB20018 */  sw         $s2, 0x18($sp)
/* 4DAD8 8004CED8 00C09021 */  addu       $s2, $a2, $zero
/* 4DADC 8004CEDC AFBF0020 */  sw         $ra, 0x20($sp)
/* 4DAE0 8004CEE0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4DAE4 8004CEE4 8E230078 */  lw         $v1, 0x78($s1)
/* 4DAE8 8004CEE8 30F3FFFF */  andi       $s3, $a3, 0xffff
/* 4DAEC 8004CEEC 84640010 */  lh         $a0, 0x10($v1)
/* 4DAF0 8004CEF0 8C620014 */  lw         $v0, 0x14($v1)
/* 4DAF4 8004CEF4 0040F809 */  jalr       $v0
/* 4DAF8 8004CEF8 02242021 */   addu      $a0, $s1, $a0
/* 4DAFC 8004CEFC 24030008 */  addiu      $v1, $zero, 8
/* 4DB00 8004CF00 1443001E */  bne        $v0, $v1, .L8004CF7C
/* 4DB04 8004CF04 8FBF0020 */   lw        $ra, 0x20($sp)
/* 4DB08 8004CF08 8E220040 */  lw         $v0, 0x40($s1)
/* 4DB0C 8004CF0C 24030001 */  addiu      $v1, $zero, 1
/* 4DB10 8004CF10 A0430001 */  sb         $v1, 1($v0)
/* 4DB14 8004CF14 92040000 */  lbu        $a0, ($s0)
/* 4DB18 8004CF18 A0440002 */  sb         $a0, 2($v0)
/* 4DB1C 8004CF1C 92030001 */  lbu        $v1, 1($s0)
/* 4DB20 8004CF20 A0430004 */  sb         $v1, 4($v0)
/* 4DB24 8004CF24 92040002 */  lbu        $a0, 2($s0)
/* 4DB28 8004CF28 A0440006 */  sb         $a0, 6($v0)
/* 4DB2C 8004CF2C 92030003 */  lbu        $v1, 3($s0)
/* 4DB30 8004CF30 A0430008 */  sb         $v1, 8($v0)
/* 4DB34 8004CF34 92440000 */  lbu        $a0, ($s2)
/* 4DB38 8004CF38 A0440003 */  sb         $a0, 3($v0)
/* 4DB3C 8004CF3C 92430001 */  lbu        $v1, 1($s2)
/* 4DB40 8004CF40 A0430005 */  sb         $v1, 5($v0)
/* 4DB44 8004CF44 92440002 */  lbu        $a0, 2($s2)
/* 4DB48 8004CF48 A0440007 */  sb         $a0, 7($v0)
/* 4DB4C 8004CF4C 92430003 */  lbu        $v1, 3($s2)
/* 4DB50 8004CF50 A0430009 */  sb         $v1, 9($v0)
/* 4DB54 8004CF54 92040000 */  lbu        $a0, ($s0)
/* 4DB58 8004CF58 A044000C */  sb         $a0, 0xc($v0)
/* 4DB5C 8004CF5C 92030001 */  lbu        $v1, 1($s0)
/* 4DB60 8004CF60 A043000D */  sb         $v1, 0xd($v0)
/* 4DB64 8004CF64 92040002 */  lbu        $a0, 2($s0)
/* 4DB68 8004CF68 A044000E */  sb         $a0, 0xe($v0)
/* 4DB6C 8004CF6C 92030003 */  lbu        $v1, 3($s0)
/* 4DB70 8004CF70 A053000A */  sb         $s3, 0xa($v0)
/* 4DB74 8004CF74 A040000B */  sb         $zero, 0xb($v0)
/* 4DB78 8004CF78 A043000F */  sb         $v1, 0xf($v0)
.L8004CF7C:
/* 4DB7C 8004CF7C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4DB80 8004CF80 8FB20018 */  lw         $s2, 0x18($sp)
/* 4DB84 8004CF84 8FB10014 */  lw         $s1, 0x14($sp)
/* 4DB88 8004CF88 8FB00010 */  lw         $s0, 0x10($sp)
/* 4DB8C 8004CF8C 03E00008 */  jr         $ra
/* 4DB90 8004CF90 27BD0028 */   addiu     $sp, $sp, 0x28

glabel free_borg8_widget
/* 4DB94 8004CF94 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4DB98 8004CF98 00802821 */  addu       $a1, $a0, $zero
/* 4DB9C 8004CF9C 10A00009 */  beqz       $a1, .L8004CFC4
/* 4DBA0 8004CFA0 AFBF0010 */   sw        $ra, 0x10($sp)
/* 4DBA4 8004CFA4 8CA2006C */  lw         $v0, 0x6c($a1)
/* 4DBA8 8004CFA8 10400006 */  beqz       $v0, .L8004CFC4
/* 4DBAC 8004CFAC 3C04800E */   lui       $a0, %hi(queueStructA)
/* 4DBB0 8004CFB0 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 4DBB4 8004CFB4 24A5006C */  addiu      $a1, $a1, 0x6c
/* 4DBB8 8004CFB8 24060004 */  addiu      $a2, $zero, 4
/* 4DBBC 8004CFBC 0C035867 */  jal        AllocFreeQueueItem
/* 4DBC0 8004CFC0 00003821 */   addu      $a3, $zero, $zero
.L8004CFC4:
/* 4DBC4 8004CFC4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4DBC8 8004CFC8 03E00008 */  jr         $ra
/* 4DBCC 8004CFCC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004CFD0
/* 4DBD0 8004CFD0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4DBD4 8004CFD4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4DBD8 8004CFD8 00808021 */  addu       $s0, $a0, $zero
/* 4DBDC 8004CFDC 1200000B */  beqz       $s0, .L8004D00C
/* 4DBE0 8004CFE0 AFBF0014 */   sw        $ra, 0x14($sp)
/* 4DBE4 8004CFE4 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 4DBE8 8004CFE8 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 4DBEC 8004CFEC 0C02DCB3 */  jal        func_800B72CC
/* 4DBF0 8004CFF0 02002821 */   addu      $a1, $s0, $zero
/* 4DBF4 8004CFF4 8E030078 */  lw         $v1, 0x78($s0)
/* 4DBF8 8004CFF8 24050003 */  addiu      $a1, $zero, 3
/* 4DBFC 8004CFFC 84640008 */  lh         $a0, 8($v1)
/* 4DC00 8004D000 8C62000C */  lw         $v0, 0xc($v1)
/* 4DC04 8004D004 0040F809 */  jalr       $v0
/* 4DC08 8004D008 02042021 */   addu      $a0, $s0, $a0
.L8004D00C:
/* 4DC0C 8004D00C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4DC10 8004D010 8FB00010 */  lw         $s0, 0x10($sp)
/* 4DC14 8004D014 03E00008 */  jr         $ra
/* 4DC18 8004D018 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004D01C
/* 4DC1C 8004D01C 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 4DC20 8004D020 AFB1003C */  sw         $s1, 0x3c($sp)
/* 4DC24 8004D024 8FB10070 */  lw         $s1, 0x70($sp)
/* 4DC28 8004D028 AFB30044 */  sw         $s3, 0x44($sp)
/* 4DC2C 8004D02C 8FB30074 */  lw         $s3, 0x74($sp)
/* 4DC30 8004D030 AFB20040 */  sw         $s2, 0x40($sp)
/* 4DC34 8004D034 8FB20078 */  lw         $s2, 0x78($sp)
/* 4DC38 8004D038 AFB5004C */  sw         $s5, 0x4c($sp)
/* 4DC3C 8004D03C 8FB5007C */  lw         $s5, 0x7c($sp)
/* 4DC40 8004D040 AFB00038 */  sw         $s0, 0x38($sp)
/* 4DC44 8004D044 00808021 */  addu       $s0, $a0, $zero
/* 4DC48 8004D048 AFBE0058 */  sw         $fp, 0x58($sp)
/* 4DC4C 8004D04C 8FBE0080 */  lw         $fp, 0x80($sp)
/* 4DC50 8004D050 AFB60050 */  sw         $s6, 0x50($sp)
/* 4DC54 8004D054 00C0B021 */  addu       $s6, $a2, $zero
/* 4DC58 8004D058 AFB40048 */  sw         $s4, 0x48($sp)
/* 4DC5C 8004D05C 00E0A021 */  addu       $s4, $a3, $zero
/* 4DC60 8004D060 AFB70054 */  sw         $s7, 0x54($sp)
/* 4DC64 8004D064 AFBF005C */  sw         $ra, 0x5c($sp)
/* 4DC68 8004D068 0C02E658 */  jal        widget_menu_build
/* 4DC6C 8004D06C 30B7FFFF */   andi      $s7, $a1, 0xffff
/* 4DC70 8004D070 02002021 */  addu       $a0, $s0, $zero
/* 4DC74 8004D074 02802821 */  addu       $a1, $s4, $zero
/* 4DC78 8004D078 00003021 */  addu       $a2, $zero, $zero
/* 4DC7C 8004D07C 3C02800E */  lui        $v0, %hi(D_800DD960)
/* 4DC80 8004D080 2442D960 */  addiu      $v0, $v0, %lo(D_800DD960)
/* 4DC84 8004D084 3C07800F */  lui        $a3, %hi(freeWidgetFunc)
/* 4DC88 8004D088 AE020078 */  sw         $v0, 0x78($s0)
/* 4DC8C 8004D08C 3C028005 */  lui        $v0, %hi(func_8004CFD0)
/* 4DC90 8004D090 2442CFD0 */  addiu      $v0, $v0, %lo(func_8004CFD0)
/* 4DC94 8004D094 8CE8D500 */  lw         $t0, %lo(freeWidgetFunc)($a3)
/* 4DC98 8004D098 3C03800F */  lui        $v1, %hi(D_800EDB70)
/* 4DC9C 8004D09C ACE2D500 */  sw         $v0, -0x2b00($a3)
/* 4DCA0 8004D0A0 0C01362D */  jal        func_8004D8B4
/* 4DCA4 8004D0A4 AC68DB70 */   sw        $t0, %lo(D_800EDB70)($v1)
/* 4DCA8 8004D0A8 02002021 */  addu       $a0, $s0, $zero
/* 4DCAC 8004D0AC 96260000 */  lhu        $a2, ($s1)
/* 4DCB0 8004D0B0 96270002 */  lhu        $a3, 2($s1)
/* 4DCB4 8004D0B4 96220004 */  lhu        $v0, 4($s1)
/* 4DCB8 8004D0B8 96230006 */  lhu        $v1, 6($s1)
/* 4DCBC 8004D0BC 92480000 */  lbu        $t0, ($s2)
/* 4DCC0 8004D0C0 92490001 */  lbu        $t1, 1($s2)
/* 4DCC4 8004D0C4 924A0002 */  lbu        $t2, 2($s2)
/* 4DCC8 8004D0C8 924B0003 */  lbu        $t3, 3($s2)
/* 4DCCC 8004D0CC 02C02821 */  addu       $a1, $s6, $zero
/* 4DCD0 8004D0D0 AFA20010 */  sw         $v0, 0x10($sp)
/* 4DCD4 8004D0D4 AFA30014 */  sw         $v1, 0x14($sp)
/* 4DCD8 8004D0D8 AFA80018 */  sw         $t0, 0x18($sp)
/* 4DCDC 8004D0DC AFA9001C */  sw         $t1, 0x1c($sp)
/* 4DCE0 8004D0E0 AFAA0020 */  sw         $t2, 0x20($sp)
/* 4DCE4 8004D0E4 0C02F325 */  jal        func_800BCC94
/* 4DCE8 8004D0E8 AFAB0024 */   sw        $t3, 0x24($sp)
/* 4DCEC 8004D0EC 02002021 */  addu       $a0, $s0, $zero
/* 4DCF0 8004D0F0 966D0000 */  lhu        $t5, ($s3)
/* 4DCF4 8004D0F4 02E02821 */  addu       $a1, $s7, $zero
/* 4DCF8 8004D0F8 AE0200A4 */  sw         $v0, 0xa4($s0)
/* 4DCFC 8004D0FC AFA00030 */  sw         $zero, 0x30($sp)
/* 4DD00 8004D100 96670002 */  lhu        $a3, 2($s3)
/* 4DD04 8004D104 96630004 */  lhu        $v1, 4($s3)
/* 4DD08 8004D108 96680006 */  lhu        $t0, 6($s3)
/* 4DD0C 8004D10C 92A90000 */  lbu        $t1, ($s5)
/* 4DD10 8004D110 92AA0001 */  lbu        $t2, 1($s5)
/* 4DD14 8004D114 92AB0002 */  lbu        $t3, 2($s5)
/* 4DD18 8004D118 92AC0003 */  lbu        $t4, 3($s5)
/* 4DD1C 8004D11C 01A03021 */  addu       $a2, $t5, $zero
/* 4DD20 8004D120 00E01021 */  addu       $v0, $a3, $zero
/* 4DD24 8004D124 AFAD0010 */  sw         $t5, 0x10($sp)
/* 4DD28 8004D128 AFA20014 */  sw         $v0, 0x14($sp)
/* 4DD2C 8004D12C AFA30018 */  sw         $v1, 0x18($sp)
/* 4DD30 8004D130 AFA8001C */  sw         $t0, 0x1c($sp)
/* 4DD34 8004D134 AFA90020 */  sw         $t1, 0x20($sp)
/* 4DD38 8004D138 AFAA0024 */  sw         $t2, 0x24($sp)
/* 4DD3C 8004D13C AFAB0028 */  sw         $t3, 0x28($sp)
/* 4DD40 8004D140 0C02F435 */  jal        widgetscrollmenu_init_2
/* 4DD44 8004D144 AFAC002C */   sw        $t4, 0x2c($sp)
/* 4DD48 8004D148 8FBF005C */  lw         $ra, 0x5c($sp)
/* 4DD4C 8004D14C AE02007C */  sw         $v0, 0x7c($s0)
/* 4DD50 8004D150 02001021 */  addu       $v0, $s0, $zero
/* 4DD54 8004D154 AE1E00AC */  sw         $fp, 0xac($s0)
/* 4DD58 8004D158 8FBE0058 */  lw         $fp, 0x58($sp)
/* 4DD5C 8004D15C 8FB70054 */  lw         $s7, 0x54($sp)
/* 4DD60 8004D160 8FB60050 */  lw         $s6, 0x50($sp)
/* 4DD64 8004D164 8FB5004C */  lw         $s5, 0x4c($sp)
/* 4DD68 8004D168 8FB40048 */  lw         $s4, 0x48($sp)
/* 4DD6C 8004D16C 8FB30044 */  lw         $s3, 0x44($sp)
/* 4DD70 8004D170 8FB20040 */  lw         $s2, 0x40($sp)
/* 4DD74 8004D174 8FB1003C */  lw         $s1, 0x3c($sp)
/* 4DD78 8004D178 8FB00038 */  lw         $s0, 0x38($sp)
/* 4DD7C 8004D17C 03E00008 */  jr         $ra
/* 4DD80 8004D180 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8004D184
/* 4DD84 8004D184 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 4DD88 8004D188 AFB30084 */  sw         $s3, 0x84($sp)
/* 4DD8C 8004D18C 8FB300B0 */  lw         $s3, 0xb0($sp)
/* 4DD90 8004D190 AFB40088 */  sw         $s4, 0x88($sp)
/* 4DD94 8004D194 8FB400B4 */  lw         $s4, 0xb4($sp)
/* 4DD98 8004D198 AFB70094 */  sw         $s7, 0x94($sp)
/* 4DD9C 8004D19C 97B700BE */  lhu        $s7, 0xbe($sp)
/* 4DDA0 8004D1A0 AFB20080 */  sw         $s2, 0x80($sp)
/* 4DDA4 8004D1A4 00809021 */  addu       $s2, $a0, $zero
/* 4DDA8 8004D1A8 AFB5008C */  sw         $s5, 0x8c($sp)
/* 4DDAC 8004D1AC 97B500C2 */  lhu        $s5, 0xc2($sp)
/* 4DDB0 8004D1B0 AFBE0098 */  sw         $fp, 0x98($sp)
/* 4DDB4 8004D1B4 30BEFFFF */  andi       $fp, $a1, 0xffff
/* 4DDB8 8004D1B8 AFB1007C */  sw         $s1, 0x7c($sp)
/* 4DDBC 8004D1BC 30F1FFFF */  andi       $s1, $a3, 0xffff
/* 4DDC0 8004D1C0 AFBF009C */  sw         $ra, 0x9c($sp)
/* 4DDC4 8004D1C4 AFB60090 */  sw         $s6, 0x90($sp)
/* 4DDC8 8004D1C8 AFB00078 */  sw         $s0, 0x78($sp)
/* 4DDCC 8004D1CC 0C02E658 */  jal        widget_menu_build
/* 4DDD0 8004D1D0 AFA600A8 */   sw        $a2, 0xa8($sp)
/* 4DDD4 8004D1D4 02402021 */  addu       $a0, $s2, $zero
/* 4DDD8 8004D1D8 27A90038 */  addiu      $t1, $sp, 0x38
/* 4DDDC 8004D1DC 01202821 */  addu       $a1, $t1, $zero
/* 4DDE0 8004D1E0 00003021 */  addu       $a2, $zero, $zero
/* 4DDE4 8004D1E4 3C02800E */  lui        $v0, %hi(D_800DD960)
/* 4DDE8 8004D1E8 2442D960 */  addiu      $v0, $v0, %lo(D_800DD960)
/* 4DDEC 8004D1EC 3C07800F */  lui        $a3, 0x800f
/* 4DDF0 8004D1F0 AE420078 */  sw         $v0, 0x78($s2)
/* 4DDF4 8004D1F4 3C028005 */  lui        $v0, %hi(func_8004CFD0)
/* 4DDF8 8004D1F8 2442CFD0 */  addiu      $v0, $v0, %lo(func_8004CFD0)
/* 4DDFC 8004D1FC 3C03800F */  lui        $v1, 0x800f
/* 4DE00 8004D200 00118842 */  srl        $s1, $s1, 1
/* 4DE04 8004D204 241000A0 */  addiu      $s0, $zero, 0xa0
/* 4DE08 8004D208 02118023 */  subu       $s0, $s0, $s1
/* 4DE0C 8004D20C 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4DE10 8004D210 263100A0 */  addiu      $s1, $s1, 0xa0
/* 4DE14 8004D214 8CE8D500 */  lw         $t0, -0x2b00($a3)
/* 4DE18 8004D218 241600F0 */  addiu      $s6, $zero, 0xf0
/* 4DE1C 8004D21C ACE2D500 */  sw         $v0, -0x2b00($a3)
/* 4DE20 8004D220 02151023 */  subu       $v0, $s0, $s5
/* 4DE24 8004D224 A7A20038 */  sh         $v0, 0x38($sp)
/* 4DE28 8004D228 02351021 */  addu       $v0, $s1, $s5
/* 4DE2C 8004D22C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4DE30 8004D230 AC68DB70 */  sw         $t0, -0x2490($v1)
/* 4DE34 8004D234 A5200002 */  sh         $zero, 2($t1)
/* 4DE38 8004D238 A5220004 */  sh         $v0, 4($t1)
/* 4DE3C 8004D23C 0C01362D */  jal        func_8004D8B4
/* 4DE40 8004D240 A5360006 */   sh        $s6, 6($t1)
/* 4DE44 8004D244 8FA500A8 */  lw         $a1, 0xa8($sp)
/* 4DE48 8004D248 97A7003A */  lhu        $a3, 0x3a($sp)
/* 4DE4C 8004D24C 97A3003E */  lhu        $v1, 0x3e($sp)
/* 4DE50 8004D250 02402021 */  addu       $a0, $s2, $zero
/* 4DE54 8004D254 A7B00038 */  sh         $s0, 0x38($sp)
/* 4DE58 8004D258 3206FFFF */  andi       $a2, $s0, 0xffff
/* 4DE5C 8004D25C A7B1003C */  sh         $s1, 0x3c($sp)
/* 4DE60 8004D260 92680000 */  lbu        $t0, ($s3)
/* 4DE64 8004D264 92690001 */  lbu        $t1, 1($s3)
/* 4DE68 8004D268 926A0002 */  lbu        $t2, 2($s3)
/* 4DE6C 8004D26C 926B0003 */  lbu        $t3, 3($s3)
/* 4DE70 8004D270 3222FFFF */  andi       $v0, $s1, 0xffff
/* 4DE74 8004D274 AFA20010 */  sw         $v0, 0x10($sp)
/* 4DE78 8004D278 AFA30014 */  sw         $v1, 0x14($sp)
/* 4DE7C 8004D27C AFA80018 */  sw         $t0, 0x18($sp)
/* 4DE80 8004D280 AFA9001C */  sw         $t1, 0x1c($sp)
/* 4DE84 8004D284 AFAA0020 */  sw         $t2, 0x20($sp)
/* 4DE88 8004D288 0C02F325 */  jal        func_800BCC94
/* 4DE8C 8004D28C AFAB0024 */   sw        $t3, 0x24($sp)
/* 4DE90 8004D290 02402021 */  addu       $a0, $s2, $zero
/* 4DE94 8004D294 03C02821 */  addu       $a1, $fp, $zero
/* 4DE98 8004D298 2610FFFF */  addiu      $s0, $s0, -1
/* 4DE9C 8004D29C 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4DEA0 8004D2A0 02003021 */  addu       $a2, $s0, $zero
/* 4DEA4 8004D2A4 00003821 */  addu       $a3, $zero, $zero
/* 4DEA8 8004D2A8 26310001 */  addiu      $s1, $s1, 1
/* 4DEAC 8004D2AC AE4200A4 */  sw         $v0, 0xa4($s2)
/* 4DEB0 8004D2B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4DEB4 8004D2B4 AFA00014 */  sw         $zero, 0x14($sp)
/* 4DEB8 8004D2B8 92820000 */  lbu        $v0, ($s4)
/* 4DEBC 8004D2BC 92830001 */  lbu        $v1, 1($s4)
/* 4DEC0 8004D2C0 92880002 */  lbu        $t0, 2($s4)
/* 4DEC4 8004D2C4 92890003 */  lbu        $t1, 3($s4)
/* 4DEC8 8004D2C8 3231FFFF */  andi       $s1, $s1, 0xffff
/* 4DECC 8004D2CC AFB10018 */  sw         $s1, 0x18($sp)
/* 4DED0 8004D2D0 AFB6001C */  sw         $s6, 0x1c($sp)
/* 4DED4 8004D2D4 AFA00030 */  sw         $zero, 0x30($sp)
/* 4DED8 8004D2D8 AFA20020 */  sw         $v0, 0x20($sp)
/* 4DEDC 8004D2DC AFA30024 */  sw         $v1, 0x24($sp)
/* 4DEE0 8004D2E0 AFA80028 */  sw         $t0, 0x28($sp)
/* 4DEE4 8004D2E4 0C02F435 */  jal        widgetscrollmenu_init_2
/* 4DEE8 8004D2E8 AFA9002C */   sw        $t1, 0x2c($sp)
/* 4DEEC 8004D2EC AE42007C */  sw         $v0, 0x7c($s2)
/* 4DEF0 8004D2F0 A65700A8 */  sh         $s7, 0xa8($s2)
/* 4DEF4 8004D2F4 A65500AA */  sh         $s5, 0xaa($s2)
/* 4DEF8 8004D2F8 8FA300B8 */  lw         $v1, 0xb8($sp)
/* 4DEFC 8004D2FC 8FBF009C */  lw         $ra, 0x9c($sp)
/* 4DF00 8004D300 8FBE0098 */  lw         $fp, 0x98($sp)
/* 4DF04 8004D304 8FB70094 */  lw         $s7, 0x94($sp)
/* 4DF08 8004D308 8FB60090 */  lw         $s6, 0x90($sp)
/* 4DF0C 8004D30C 8FB5008C */  lw         $s5, 0x8c($sp)
/* 4DF10 8004D310 8FB40088 */  lw         $s4, 0x88($sp)
/* 4DF14 8004D314 8FB30084 */  lw         $s3, 0x84($sp)
/* 4DF18 8004D318 8FB1007C */  lw         $s1, 0x7c($sp)
/* 4DF1C 8004D31C 8FB00078 */  lw         $s0, 0x78($sp)
/* 4DF20 8004D320 02401021 */  addu       $v0, $s2, $zero
/* 4DF24 8004D324 AE4300AC */  sw         $v1, 0xac($s2)
/* 4DF28 8004D328 8FB20080 */  lw         $s2, 0x80($sp)
/* 4DF2C 8004D32C 03E00008 */  jr         $ra
/* 4DF30 8004D330 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_8004D334
/* 4DF34 8004D334 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 4DF38 8004D338 AFB70094 */  sw         $s7, 0x94($sp)
/* 4DF3C 8004D33C 8FB700B0 */  lw         $s7, 0xb0($sp)
/* 4DF40 8004D340 AFB20080 */  sw         $s2, 0x80($sp)
/* 4DF44 8004D344 00809021 */  addu       $s2, $a0, $zero
/* 4DF48 8004D348 AFB5008C */  sw         $s5, 0x8c($sp)
/* 4DF4C 8004D34C 97B500B6 */  lhu        $s5, 0xb6($sp)
/* 4DF50 8004D350 AFB30084 */  sw         $s3, 0x84($sp)
/* 4DF54 8004D354 00E09821 */  addu       $s3, $a3, $zero
/* 4DF58 8004D358 AFB60090 */  sw         $s6, 0x90($sp)
/* 4DF5C 8004D35C 30B6FFFF */  andi       $s6, $a1, 0xffff
/* 4DF60 8004D360 AFB1007C */  sw         $s1, 0x7c($sp)
/* 4DF64 8004D364 30D1FFFF */  andi       $s1, $a2, 0xffff
/* 4DF68 8004D368 AFBF0098 */  sw         $ra, 0x98($sp)
/* 4DF6C 8004D36C AFB40088 */  sw         $s4, 0x88($sp)
/* 4DF70 8004D370 0C02E658 */  jal        widget_menu_build
/* 4DF74 8004D374 AFB00078 */   sw        $s0, 0x78($sp)
/* 4DF78 8004D378 02402021 */  addu       $a0, $s2, $zero
/* 4DF7C 8004D37C 27A90038 */  addiu      $t1, $sp, 0x38
/* 4DF80 8004D380 01202821 */  addu       $a1, $t1, $zero
/* 4DF84 8004D384 00003021 */  addu       $a2, $zero, $zero
/* 4DF88 8004D388 3C02800E */  lui        $v0, %hi(D_800DD960)
/* 4DF8C 8004D38C 2442D960 */  addiu      $v0, $v0, %lo(D_800DD960)
/* 4DF90 8004D390 3C07800F */  lui        $a3, 0x800f
/* 4DF94 8004D394 AE420078 */  sw         $v0, 0x78($s2)
/* 4DF98 8004D398 3C028005 */  lui        $v0, %hi(func_8004CFD0)
/* 4DF9C 8004D39C 2442CFD0 */  addiu      $v0, $v0, %lo(func_8004CFD0)
/* 4DFA0 8004D3A0 3C03800F */  lui        $v1, 0x800f
/* 4DFA4 8004D3A4 00118842 */  srl        $s1, $s1, 1
/* 4DFA8 8004D3A8 241000A0 */  addiu      $s0, $zero, 0xa0
/* 4DFAC 8004D3AC 02118023 */  subu       $s0, $s0, $s1
/* 4DFB0 8004D3B0 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4DFB4 8004D3B4 263100A0 */  addiu      $s1, $s1, 0xa0
/* 4DFB8 8004D3B8 8CE8D500 */  lw         $t0, -0x2b00($a3)
/* 4DFBC 8004D3BC 241400F0 */  addiu      $s4, $zero, 0xf0
/* 4DFC0 8004D3C0 ACE2D500 */  sw         $v0, -0x2b00($a3)
/* 4DFC4 8004D3C4 02151023 */  subu       $v0, $s0, $s5
/* 4DFC8 8004D3C8 A7A20038 */  sh         $v0, 0x38($sp)
/* 4DFCC 8004D3CC 02351021 */  addu       $v0, $s1, $s5
/* 4DFD0 8004D3D0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4DFD4 8004D3D4 AC68DB70 */  sw         $t0, -0x2490($v1)
/* 4DFD8 8004D3D8 A5200002 */  sh         $zero, 2($t1)
/* 4DFDC 8004D3DC A5220004 */  sh         $v0, 4($t1)
/* 4DFE0 8004D3E0 0C01362D */  jal        func_8004D8B4
/* 4DFE4 8004D3E4 A5340006 */   sh        $s4, 6($t1)
/* 4DFE8 8004D3E8 02402021 */  addu       $a0, $s2, $zero
/* 4DFEC 8004D3EC 02C02821 */  addu       $a1, $s6, $zero
/* 4DFF0 8004D3F0 2610FFFF */  addiu      $s0, $s0, -1
/* 4DFF4 8004D3F4 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4DFF8 8004D3F8 02003021 */  addu       $a2, $s0, $zero
/* 4DFFC 8004D3FC 26310001 */  addiu      $s1, $s1, 1
/* 4E000 8004D400 AE4000A4 */  sw         $zero, 0xa4($s2)
/* 4E004 8004D404 AFB00010 */  sw         $s0, 0x10($sp)
/* 4E008 8004D408 AFA00014 */  sw         $zero, 0x14($sp)
/* 4E00C 8004D40C 92620000 */  lbu        $v0, ($s3)
/* 4E010 8004D410 92630001 */  lbu        $v1, 1($s3)
/* 4E014 8004D414 92670002 */  lbu        $a3, 2($s3)
/* 4E018 8004D418 92680003 */  lbu        $t0, 3($s3)
/* 4E01C 8004D41C 3231FFFF */  andi       $s1, $s1, 0xffff
/* 4E020 8004D420 AFB10018 */  sw         $s1, 0x18($sp)
/* 4E024 8004D424 AFB4001C */  sw         $s4, 0x1c($sp)
/* 4E028 8004D428 AFA00030 */  sw         $zero, 0x30($sp)
/* 4E02C 8004D42C AFA70028 */  sw         $a3, 0x28($sp)
/* 4E030 8004D430 00003821 */  addu       $a3, $zero, $zero
/* 4E034 8004D434 AFA20020 */  sw         $v0, 0x20($sp)
/* 4E038 8004D438 AFA30024 */  sw         $v1, 0x24($sp)
/* 4E03C 8004D43C 0C02F435 */  jal        widgetscrollmenu_init_2
/* 4E040 8004D440 AFA8002C */   sw        $t0, 0x2c($sp)
/* 4E044 8004D444 8FBF0098 */  lw         $ra, 0x98($sp)
/* 4E048 8004D448 AE5700AC */  sw         $s7, 0xac($s2)
/* 4E04C 8004D44C 8FB70094 */  lw         $s7, 0x94($sp)
/* 4E050 8004D450 8FB60090 */  lw         $s6, 0x90($sp)
/* 4E054 8004D454 A65500AA */  sh         $s5, 0xaa($s2)
/* 4E058 8004D458 8FB5008C */  lw         $s5, 0x8c($sp)
/* 4E05C 8004D45C 8FB40088 */  lw         $s4, 0x88($sp)
/* 4E060 8004D460 8FB30084 */  lw         $s3, 0x84($sp)
/* 4E064 8004D464 AE42007C */  sw         $v0, 0x7c($s2)
/* 4E068 8004D468 02401021 */  addu       $v0, $s2, $zero
/* 4E06C 8004D46C A64000A8 */  sh         $zero, 0xa8($s2)
/* 4E070 8004D470 8FB20080 */  lw         $s2, 0x80($sp)
/* 4E074 8004D474 8FB1007C */  lw         $s1, 0x7c($sp)
/* 4E078 8004D478 8FB00078 */  lw         $s0, 0x78($sp)
/* 4E07C 8004D47C 03E00008 */  jr         $ra
/* 4E080 8004D480 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_8004D484
/* 4E084 8004D484 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 4E088 8004D488 AFB70074 */  sw         $s7, 0x74($sp)
/* 4E08C 8004D48C 8FB70090 */  lw         $s7, 0x90($sp)
/* 4E090 8004D490 AFB20060 */  sw         $s2, 0x60($sp)
/* 4E094 8004D494 00809021 */  addu       $s2, $a0, $zero
/* 4E098 8004D498 AFB30064 */  sw         $s3, 0x64($sp)
/* 4E09C 8004D49C 97B30096 */  lhu        $s3, 0x96($sp)
/* 4E0A0 8004D4A0 AFB60070 */  sw         $s6, 0x70($sp)
/* 4E0A4 8004D4A4 30B6FFFF */  andi       $s6, $a1, 0xffff
/* 4E0A8 8004D4A8 AFB40068 */  sw         $s4, 0x68($sp)
/* 4E0AC 8004D4AC 30D4FFFF */  andi       $s4, $a2, 0xffff
/* 4E0B0 8004D4B0 AFB5006C */  sw         $s5, 0x6c($sp)
/* 4E0B4 8004D4B4 30F5FFFF */  andi       $s5, $a3, 0xffff
/* 4E0B8 8004D4B8 AFBF0078 */  sw         $ra, 0x78($sp)
/* 4E0BC 8004D4BC AFB1005C */  sw         $s1, 0x5c($sp)
/* 4E0C0 8004D4C0 0C02E658 */  jal        widget_menu_build
/* 4E0C4 8004D4C4 AFB00058 */   sw        $s0, 0x58($sp)
/* 4E0C8 8004D4C8 02402021 */  addu       $a0, $s2, $zero
/* 4E0CC 8004D4CC 27A90018 */  addiu      $t1, $sp, 0x18
/* 4E0D0 8004D4D0 01202821 */  addu       $a1, $t1, $zero
/* 4E0D4 8004D4D4 00003021 */  addu       $a2, $zero, $zero
/* 4E0D8 8004D4D8 3C02800E */  lui        $v0, %hi(D_800DD960)
/* 4E0DC 8004D4DC 2442D960 */  addiu      $v0, $v0, %lo(D_800DD960)
/* 4E0E0 8004D4E0 3C07800F */  lui        $a3, 0x800f
/* 4E0E4 8004D4E4 AE420078 */  sw         $v0, 0x78($s2)
/* 4E0E8 8004D4E8 3C028005 */  lui        $v0, %hi(func_8004CFD0)
/* 4E0EC 8004D4EC 2442CFD0 */  addiu      $v0, $v0, %lo(func_8004CFD0)
/* 4E0F0 8004D4F0 3C03800F */  lui        $v1, 0x800f
/* 4E0F4 8004D4F4 26910001 */  addiu      $s1, $s4, 1
/* 4E0F8 8004D4F8 00118842 */  srl        $s1, $s1, 1
/* 4E0FC 8004D4FC 241000A0 */  addiu      $s0, $zero, 0xa0
/* 4E100 8004D500 02118023 */  subu       $s0, $s0, $s1
/* 4E104 8004D504 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4E108 8004D508 263100A0 */  addiu      $s1, $s1, 0xa0
/* 4E10C 8004D50C 8CE8D500 */  lw         $t0, -0x2b00($a3)
/* 4E110 8004D510 3231FFFF */  andi       $s1, $s1, 0xffff
/* 4E114 8004D514 ACE2D500 */  sw         $v0, -0x2b00($a3)
/* 4E118 8004D518 02131023 */  subu       $v0, $s0, $s3
/* 4E11C 8004D51C A7A20018 */  sh         $v0, 0x18($sp)
/* 4E120 8004D520 02331021 */  addu       $v0, $s1, $s3
/* 4E124 8004D524 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E128 8004D528 AC68DB70 */  sw         $t0, -0x2490($v1)
/* 4E12C 8004D52C 240300F0 */  addiu      $v1, $zero, 0xf0
/* 4E130 8004D530 A5200002 */  sh         $zero, 2($t1)
/* 4E134 8004D534 A5220004 */  sh         $v0, 4($t1)
/* 4E138 8004D538 0C01362D */  jal        func_8004D8B4
/* 4E13C 8004D53C A5230006 */   sh        $v1, 6($t1)
/* 4E140 8004D540 2404007C */  addiu      $a0, $zero, 0x7c
/* 4E144 8004D544 0C026259 */  jal        passToMalloc
/* 4E148 8004D548 AE4000A4 */   sw        $zero, 0xa4($s2)
/* 4E14C 8004D54C 00402021 */  addu       $a0, $v0, $zero
/* 4E150 8004D550 0C00BB0E */  jal        func_8002EC38
/* 4E154 8004D554 32C500FF */   andi      $a1, $s6, 0xff
/* 4E158 8004D558 00402021 */  addu       $a0, $v0, $zero
/* 4E15C 8004D55C 02A02821 */  addu       $a1, $s5, $zero
/* 4E160 8004D560 0C02DD46 */  jal        set_widgetWidth
/* 4E164 8004D564 AE42007C */   sw        $v0, 0x7c($s2)
/* 4E168 8004D568 8E44007C */  lw         $a0, 0x7c($s2)
/* 4E16C 8004D56C 0C02DD42 */  jal        set_widgetHeight
/* 4E170 8004D570 02802821 */   addu      $a1, $s4, $zero
/* 4E174 8004D574 2610FFFF */  addiu      $s0, $s0, -1
/* 4E178 8004D578 02002821 */  addu       $a1, $s0, $zero
/* 4E17C 8004D57C 8E44007C */  lw         $a0, 0x7c($s2)
/* 4E180 8004D580 0C02DD3F */  jal        set_widget_coords
/* 4E184 8004D584 00003021 */   addu      $a2, $zero, $zero
/* 4E188 8004D588 3205FFFF */  andi       $a1, $s0, 0xffff
/* 4E18C 8004D58C 00003021 */  addu       $a2, $zero, $zero
/* 4E190 8004D590 26310001 */  addiu      $s1, $s1, 1
/* 4E194 8004D594 8E44007C */  lw         $a0, 0x7c($s2)
/* 4E198 8004D598 3227FFFF */  andi       $a3, $s1, 0xffff
/* 4E19C 8004D59C 0C00193A */  jal        func_800064E8
/* 4E1A0 8004D5A0 AFB50010 */   sw        $s5, 0x10($sp)
/* 4E1A4 8004D5A4 8E45007C */  lw         $a1, 0x7c($s2)
/* 4E1A8 8004D5A8 0C02DEDC */  jal        link_widgets
/* 4E1AC 8004D5AC 02402021 */   addu      $a0, $s2, $zero
/* 4E1B0 8004D5B0 8FBF0078 */  lw         $ra, 0x78($sp)
/* 4E1B4 8004D5B4 AE5700AC */  sw         $s7, 0xac($s2)
/* 4E1B8 8004D5B8 8FB70074 */  lw         $s7, 0x74($sp)
/* 4E1BC 8004D5BC 8FB60070 */  lw         $s6, 0x70($sp)
/* 4E1C0 8004D5C0 8FB5006C */  lw         $s5, 0x6c($sp)
/* 4E1C4 8004D5C4 8FB40068 */  lw         $s4, 0x68($sp)
/* 4E1C8 8004D5C8 A65300AA */  sh         $s3, 0xaa($s2)
/* 4E1CC 8004D5CC 8FB30064 */  lw         $s3, 0x64($sp)
/* 4E1D0 8004D5D0 02401021 */  addu       $v0, $s2, $zero
/* 4E1D4 8004D5D4 A64000A8 */  sh         $zero, 0xa8($s2)
/* 4E1D8 8004D5D8 8FB20060 */  lw         $s2, 0x60($sp)
/* 4E1DC 8004D5DC 8FB1005C */  lw         $s1, 0x5c($sp)
/* 4E1E0 8004D5E0 8FB00058 */  lw         $s0, 0x58($sp)
/* 4E1E4 8004D5E4 03E00008 */  jr         $ra
/* 4E1E8 8004D5E8 27BD0080 */   addiu     $sp, $sp, 0x80

glabel func_8004D5EC
/* 4E1EC 8004D5EC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4E1F0 8004D5F0 AFB10014 */  sw         $s1, 0x14($sp)
/* 4E1F4 8004D5F4 00808821 */  addu       $s1, $a0, $zero
/* 4E1F8 8004D5F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4E1FC 8004D5FC 3C10800E */  lui        $s0, %hi(queueStructA)
/* 4E200 8004D600 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 4E204 8004D604 02002021 */  addu       $a0, $s0, $zero
/* 4E208 8004D608 24060004 */  addiu      $a2, $zero, 4
/* 4E20C 8004D60C 00003821 */  addu       $a3, $zero, $zero
/* 4E210 8004D610 3C02800E */  lui        $v0, %hi(D_800DD960)
/* 4E214 8004D614 3C08800F */  lui        $t0, %hi(D_800EDB70)
/* 4E218 8004D618 8D09DB70 */  lw         $t1, %lo(D_800EDB70)($t0)
/* 4E21C 8004D61C 2442D960 */  addiu      $v0, $v0, %lo(D_800DD960)
/* 4E220 8004D620 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4E224 8004D624 AFB20018 */  sw         $s2, 0x18($sp)
/* 4E228 8004D628 8E230084 */  lw         $v1, 0x84($s1)
/* 4E22C 8004D62C 00A09021 */  addu       $s2, $a1, $zero
/* 4E230 8004D630 AE220078 */  sw         $v0, 0x78($s1)
/* 4E234 8004D634 3C02800F */  lui        $v0, %hi(freeWidgetFunc)
/* 4E238 8004D638 AD00DB70 */  sw         $zero, -0x2490($t0)
/* 4E23C 8004D63C 2465006C */  addiu      $a1, $v1, 0x6c
/* 4E240 8004D640 0C035867 */  jal        AllocFreeQueueItem
/* 4E244 8004D644 AC49D500 */   sw        $t1, %lo(freeWidgetFunc)($v0)
/* 4E248 8004D648 02002021 */  addu       $a0, $s0, $zero
/* 4E24C 8004D64C 24060004 */  addiu      $a2, $zero, 4
/* 4E250 8004D650 8E250088 */  lw         $a1, 0x88($s1)
/* 4E254 8004D654 00003821 */  addu       $a3, $zero, $zero
/* 4E258 8004D658 0C035867 */  jal        AllocFreeQueueItem
/* 4E25C 8004D65C 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E260 8004D660 02002021 */  addu       $a0, $s0, $zero
/* 4E264 8004D664 24060004 */  addiu      $a2, $zero, 4
/* 4E268 8004D668 8E25008C */  lw         $a1, 0x8c($s1)
/* 4E26C 8004D66C 00003821 */  addu       $a3, $zero, $zero
/* 4E270 8004D670 0C035867 */  jal        AllocFreeQueueItem
/* 4E274 8004D674 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E278 8004D678 02002021 */  addu       $a0, $s0, $zero
/* 4E27C 8004D67C 24060004 */  addiu      $a2, $zero, 4
/* 4E280 8004D680 8E250090 */  lw         $a1, 0x90($s1)
/* 4E284 8004D684 00003821 */  addu       $a3, $zero, $zero
/* 4E288 8004D688 0C035867 */  jal        AllocFreeQueueItem
/* 4E28C 8004D68C 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E290 8004D690 02002021 */  addu       $a0, $s0, $zero
/* 4E294 8004D694 24060004 */  addiu      $a2, $zero, 4
/* 4E298 8004D698 8E250094 */  lw         $a1, 0x94($s1)
/* 4E29C 8004D69C 00003821 */  addu       $a3, $zero, $zero
/* 4E2A0 8004D6A0 0C035867 */  jal        AllocFreeQueueItem
/* 4E2A4 8004D6A4 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E2A8 8004D6A8 02002021 */  addu       $a0, $s0, $zero
/* 4E2AC 8004D6AC 24060004 */  addiu      $a2, $zero, 4
/* 4E2B0 8004D6B0 8E250098 */  lw         $a1, 0x98($s1)
/* 4E2B4 8004D6B4 00003821 */  addu       $a3, $zero, $zero
/* 4E2B8 8004D6B8 0C035867 */  jal        AllocFreeQueueItem
/* 4E2BC 8004D6BC 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E2C0 8004D6C0 02002021 */  addu       $a0, $s0, $zero
/* 4E2C4 8004D6C4 24060004 */  addiu      $a2, $zero, 4
/* 4E2C8 8004D6C8 8E25009C */  lw         $a1, 0x9c($s1)
/* 4E2CC 8004D6CC 00003821 */  addu       $a3, $zero, $zero
/* 4E2D0 8004D6D0 0C035867 */  jal        AllocFreeQueueItem
/* 4E2D4 8004D6D4 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E2D8 8004D6D8 02002021 */  addu       $a0, $s0, $zero
/* 4E2DC 8004D6DC 24060004 */  addiu      $a2, $zero, 4
/* 4E2E0 8004D6E0 8E2500A0 */  lw         $a1, 0xa0($s1)
/* 4E2E4 8004D6E4 00003821 */  addu       $a3, $zero, $zero
/* 4E2E8 8004D6E8 0C035867 */  jal        AllocFreeQueueItem
/* 4E2EC 8004D6EC 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E2F0 8004D6F0 02002021 */  addu       $a0, $s0, $zero
/* 4E2F4 8004D6F4 24060004 */  addiu      $a2, $zero, 4
/* 4E2F8 8004D6F8 8E250080 */  lw         $a1, 0x80($s1)
/* 4E2FC 8004D6FC 00003821 */  addu       $a3, $zero, $zero
/* 4E300 8004D700 0C035867 */  jal        AllocFreeQueueItem
/* 4E304 8004D704 24A5006C */   addiu     $a1, $a1, 0x6c
/* 4E308 8004D708 9223005C */  lbu        $v1, 0x5c($s1)
/* 4E30C 8004D70C 240200FF */  addiu      $v0, $zero, 0xff
/* 4E310 8004D710 1462000C */  bne        $v1, $v0, .L8004D744
/* 4E314 8004D714 02202021 */   addu      $a0, $s1, $zero
/* 4E318 8004D718 0C02F031 */  jal        func_800BC0C4
/* 4E31C 8004D71C 8E24007C */   lw        $a0, 0x7c($s1)
/* 4E320 8004D720 00402821 */  addu       $a1, $v0, $zero
/* 4E324 8004D724 50A00007 */  beql       $a1, $zero, .L8004D744
/* 4E328 8004D728 02202021 */   addu      $a0, $s1, $zero
/* 4E32C 8004D72C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4E330 8004D730 84640078 */  lh         $a0, 0x78($v1)
/* 4E334 8004D734 8C62007C */  lw         $v0, 0x7c($v1)
/* 4E338 8004D738 0040F809 */  jalr       $v0
/* 4E33C 8004D73C 00A42021 */   addu      $a0, $a1, $a0
/* 4E340 8004D740 02202021 */  addu       $a0, $s1, $zero
.L8004D744:
/* 4E344 8004D744 0C02E66C */  jal        widget_menu_free
/* 4E348 8004D748 02402821 */   addu      $a1, $s2, $zero
/* 4E34C 8004D74C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4E350 8004D750 8FB20018 */  lw         $s2, 0x18($sp)
/* 4E354 8004D754 8FB10014 */  lw         $s1, 0x14($sp)
/* 4E358 8004D758 8FB00010 */  lw         $s0, 0x10($sp)
/* 4E35C 8004D75C 03E00008 */  jr         $ra
/* 4E360 8004D760 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004D764
/* 4E364 8004D764 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 4E368 8004D768 AFB60030 */  sw         $s6, 0x30($sp)
/* 4E36C 8004D76C 0080B021 */  addu       $s6, $a0, $zero
/* 4E370 8004D770 AFB30024 */  sw         $s3, 0x24($sp)
/* 4E374 8004D774 00A09821 */  addu       $s3, $a1, $zero
/* 4E378 8004D778 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4E37C 8004D77C 00068C00 */  sll        $s1, $a2, 0x10
/* 4E380 8004D780 AFB40028 */  sw         $s4, 0x28($sp)
/* 4E384 8004D784 87B4004A */  lh         $s4, 0x4a($sp)
/* 4E388 8004D788 00118C03 */  sra        $s1, $s1, 0x10
/* 4E38C 8004D78C AFB00018 */  sw         $s0, 0x18($sp)
/* 4E390 8004D790 00078400 */  sll        $s0, $a3, 0x10
/* 4E394 8004D794 AFB5002C */  sw         $s5, 0x2c($sp)
/* 4E398 8004D798 87B5004E */  lh         $s5, 0x4e($sp)
/* 4E39C 8004D79C 00108403 */  sra        $s0, $s0, 0x10
/* 4E3A0 8004D7A0 AFBF0034 */  sw         $ra, 0x34($sp)
/* 4E3A4 8004D7A4 0C0025B4 */  jal        get_hres
/* 4E3A8 8004D7A8 AFB20020 */   sw        $s2, 0x20($sp)
/* 4E3AC 8004D7AC 0C0025B7 */  jal        get_vres
/* 4E3B0 8004D7B0 00409021 */   addu      $s2, $v0, $zero
/* 4E3B4 8004D7B4 02602021 */  addu       $a0, $s3, $zero
/* 4E3B8 8004D7B8 24050006 */  addiu      $a1, $zero, 6
/* 4E3BC 8004D7BC 02403021 */  addu       $a2, $s2, $zero
/* 4E3C0 8004D7C0 0C0290ED */  jal        rsp_func
/* 4E3C4 8004D7C4 00403821 */   addu      $a3, $v0, $zero
/* 4E3C8 8004D7C8 02C02021 */  addu       $a0, $s6, $zero
/* 4E3CC 8004D7CC 00402821 */  addu       $a1, $v0, $zero
/* 4E3D0 8004D7D0 02203021 */  addu       $a2, $s1, $zero
/* 4E3D4 8004D7D4 02003821 */  addu       $a3, $s0, $zero
/* 4E3D8 8004D7D8 AFB40010 */  sw         $s4, 0x10($sp)
/* 4E3DC 8004D7DC 0C02E675 */  jal        func_800B99D4
/* 4E3E0 8004D7E0 AFB50014 */   sw        $s5, 0x14($sp)
/* 4E3E4 8004D7E4 8FBF0034 */  lw         $ra, 0x34($sp)
/* 4E3E8 8004D7E8 8FB60030 */  lw         $s6, 0x30($sp)
/* 4E3EC 8004D7EC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 4E3F0 8004D7F0 8FB40028 */  lw         $s4, 0x28($sp)
/* 4E3F4 8004D7F4 8FB30024 */  lw         $s3, 0x24($sp)
/* 4E3F8 8004D7F8 8FB20020 */  lw         $s2, 0x20($sp)
/* 4E3FC 8004D7FC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4E400 8004D800 8FB00018 */  lw         $s0, 0x18($sp)
/* 4E404 8004D804 03E00008 */  jr         $ra
/* 4E408 8004D808 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8004D80C
/* 4E40C 8004D80C 00801021 */  addu       $v0, $a0, $zero
/* 4E410 8004D810 240300FF */  addiu      $v1, $zero, 0xff
/* 4E414 8004D814 03E00008 */  jr         $ra
/* 4E418 8004D818 A043005C */   sb        $v1, 0x5c($v0)

glabel func_8004D81C
/* 4E41C 8004D81C 8C8200AC */  lw         $v0, 0xac($a0)
/* 4E420 8004D820 10400003 */  beqz       $v0, .L8004D830
/* 4E424 8004D824 00801021 */   addu      $v0, $a0, $zero
/* 4E428 8004D828 03E00008 */  jr         $ra
/* 4E42C 8004D82C A080005C */   sb        $zero, 0x5c($a0)
.L8004D830:
/* 4E430 8004D830 03E00008 */  jr         $ra
/* 4E434 8004D834 00001021 */   addu      $v0, $zero, $zero

glabel func_8004D838
/* 4E438 8004D838 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E43C 8004D83C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E440 8004D840 8C85007C */  lw         $a1, 0x7c($a0)
/* 4E444 8004D844 8CA30078 */  lw         $v1, 0x78($a1)
/* 4E448 8004D848 84640058 */  lh         $a0, 0x58($v1)
/* 4E44C 8004D84C 8C62005C */  lw         $v0, 0x5c($v1)
/* 4E450 8004D850 0040F809 */  jalr       $v0
/* 4E454 8004D854 00A42021 */   addu      $a0, $a1, $a0
/* 4E458 8004D858 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E45C 8004D85C 00001021 */  addu       $v0, $zero, $zero
/* 4E460 8004D860 03E00008 */  jr         $ra
/* 4E464 8004D864 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004D868
/* 4E468 8004D868 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E46C 8004D86C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E470 8004D870 8C85007C */  lw         $a1, 0x7c($a0)
/* 4E474 8004D874 8CA30078 */  lw         $v1, 0x78($a1)
/* 4E478 8004D878 84640060 */  lh         $a0, 0x60($v1)
/* 4E47C 8004D87C 8C620064 */  lw         $v0, 0x64($v1)
/* 4E480 8004D880 0040F809 */  jalr       $v0
/* 4E484 8004D884 00A42021 */   addu      $a0, $a1, $a0
/* 4E488 8004D888 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E48C 8004D88C 00001021 */  addu       $v0, $zero, $zero
/* 4E490 8004D890 03E00008 */  jr         $ra
/* 4E494 8004D894 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004D898
/* 4E498 8004D898 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4E49C 8004D89C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4E4A0 8004D8A0 0C02E885 */  jal        link_widget_text
/* 4E4A4 8004D8A4 8C84007C */   lw        $a0, 0x7c($a0)
/* 4E4A8 8004D8A8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4E4AC 8004D8AC 03E00008 */  jr         $ra
/* 4E4B0 8004D8B0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004D8B4
/* 4E4B4 8004D8B4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 4E4B8 8004D8B8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4E4BC 8004D8BC 00808821 */  addu       $s1, $a0, $zero
/* 4E4C0 8004D8C0 240401C4 */  addiu      $a0, $zero, 0x1c4
/* 4E4C4 8004D8C4 AFB00018 */  sw         $s0, 0x18($sp)
/* 4E4C8 8004D8C8 00A08021 */  addu       $s0, $a1, $zero
/* 4E4CC 8004D8CC AFB30024 */  sw         $s3, 0x24($sp)
/* 4E4D0 8004D8D0 0006982B */  sltu       $s3, $zero, $a2
/* 4E4D4 8004D8D4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 4E4D8 8004D8D8 0C0290E2 */  jal        get_borg_8
/* 4E4DC 8004D8DC AFB20020 */   sw        $s2, 0x20($sp)
/* 4E4E0 8004D8E0 00402821 */  addu       $a1, $v0, $zero
/* 4E4E4 8004D8E4 96060000 */  lhu        $a2, ($s0)
/* 4E4E8 8004D8E8 96070002 */  lhu        $a3, 2($s0)
/* 4E4EC 8004D8EC 96020004 */  lhu        $v0, 4($s0)
/* 4E4F0 8004D8F0 96030006 */  lhu        $v1, 6($s0)
/* 4E4F4 8004D8F4 02202021 */  addu       $a0, $s1, $zero
/* 4E4F8 8004D8F8 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E4FC 8004D8FC 0C02F40F */  jal        func_800BD03C
/* 4E500 8004D900 AFA30014 */   sw        $v1, 0x14($sp)
/* 4E504 8004D904 240401C3 */  addiu      $a0, $zero, 0x1c3
/* 4E508 8004D908 0C0290E2 */  jal        get_borg_8
/* 4E50C 8004D90C AE220080 */   sw        $v0, 0x80($s1)
/* 4E510 8004D910 00404021 */  addu       $t0, $v0, $zero
/* 4E514 8004D914 02202021 */  addu       $a0, $s1, $zero
/* 4E518 8004D918 01002821 */  addu       $a1, $t0, $zero
/* 4E51C 8004D91C 96060000 */  lhu        $a2, ($s0)
/* 4E520 8004D920 96070002 */  lhu        $a3, 2($s0)
/* 4E524 8004D924 9502000C */  lhu        $v0, 0xc($t0)
/* 4E528 8004D928 96030004 */  lhu        $v1, 4($s0)
/* 4E52C 8004D92C 00E23823 */  subu       $a3, $a3, $v0
/* 4E530 8004D930 96020002 */  lhu        $v0, 2($s0)
/* 4E534 8004D934 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 4E538 8004D938 AFA30010 */  sw         $v1, 0x10($sp)
/* 4E53C 8004D93C 0C02F40F */  jal        func_800BD03C
/* 4E540 8004D940 AFA20014 */   sw        $v0, 0x14($sp)
/* 4E544 8004D944 240401C2 */  addiu      $a0, $zero, 0x1c2
/* 4E548 8004D948 0C0290E2 */  jal        get_borg_8
/* 4E54C 8004D94C AE220088 */   sw        $v0, 0x88($s1)
/* 4E550 8004D950 00404021 */  addu       $t0, $v0, $zero
/* 4E554 8004D954 02202021 */  addu       $a0, $s1, $zero
/* 4E558 8004D958 96060000 */  lhu        $a2, ($s0)
/* 4E55C 8004D95C 96020004 */  lhu        $v0, 4($s0)
/* 4E560 8004D960 01002821 */  addu       $a1, $t0, $zero
/* 4E564 8004D964 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E568 8004D968 96020006 */  lhu        $v0, 6($s0)
/* 4E56C 8004D96C 9503000C */  lhu        $v1, 0xc($t0)
/* 4E570 8004D970 96070006 */  lhu        $a3, 6($s0)
/* 4E574 8004D974 00431021 */  addu       $v0, $v0, $v1
/* 4E578 8004D978 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E57C 8004D97C 0C02F40F */  jal        func_800BD03C
/* 4E580 8004D980 AFA20014 */   sw        $v0, 0x14($sp)
/* 4E584 8004D984 240401C0 */  addiu      $a0, $zero, 0x1c0
/* 4E588 8004D988 0C0290E2 */  jal        get_borg_8
/* 4E58C 8004D98C AE220090 */   sw        $v0, 0x90($s1)
/* 4E590 8004D990 00404021 */  addu       $t0, $v0, $zero
/* 4E594 8004D994 02202021 */  addu       $a0, $s1, $zero
/* 4E598 8004D998 01002821 */  addu       $a1, $t0, $zero
/* 4E59C 8004D99C 96020000 */  lhu        $v0, ($s0)
/* 4E5A0 8004D9A0 9506000A */  lhu        $a2, 0xa($t0)
/* 4E5A4 8004D9A4 96070002 */  lhu        $a3, 2($s0)
/* 4E5A8 8004D9A8 96030006 */  lhu        $v1, 6($s0)
/* 4E5AC 8004D9AC 00463023 */  subu       $a2, $v0, $a2
/* 4E5B0 8004D9B0 24C6FFFF */  addiu      $a2, $a2, -1
/* 4E5B4 8004D9B4 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 4E5B8 8004D9B8 2442FFFF */  addiu      $v0, $v0, -1
/* 4E5BC 8004D9BC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E5C0 8004D9C0 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E5C4 8004D9C4 0C02F40F */  jal        func_800BD03C
/* 4E5C8 8004D9C8 AFA30014 */   sw        $v1, 0x14($sp)
/* 4E5CC 8004D9CC 240401C1 */  addiu      $a0, $zero, 0x1c1
/* 4E5D0 8004D9D0 0C0290E2 */  jal        get_borg_8
/* 4E5D4 8004D9D4 AE220084 */   sw        $v0, 0x84($s1)
/* 4E5D8 8004D9D8 00404021 */  addu       $t0, $v0, $zero
/* 4E5DC 8004D9DC 02202021 */  addu       $a0, $s1, $zero
/* 4E5E0 8004D9E0 01002821 */  addu       $a1, $t0, $zero
/* 4E5E4 8004D9E4 26720001 */  addiu      $s2, $s3, 1
/* 4E5E8 8004D9E8 96020004 */  lhu        $v0, 4($s0)
/* 4E5EC 8004D9EC 96070002 */  lhu        $a3, 2($s0)
/* 4E5F0 8004D9F0 9503000A */  lhu        $v1, 0xa($t0)
/* 4E5F4 8004D9F4 00523021 */  addu       $a2, $v0, $s2
/* 4E5F8 8004D9F8 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 4E5FC 8004D9FC 00431021 */  addu       $v0, $v0, $v1
/* 4E600 8004DA00 24420001 */  addiu      $v0, $v0, 1
/* 4E604 8004DA04 00531021 */  addu       $v0, $v0, $s3
/* 4E608 8004DA08 96030006 */  lhu        $v1, 6($s0)
/* 4E60C 8004DA0C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E610 8004DA10 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E614 8004DA14 0C02F40F */  jal        func_800BD03C
/* 4E618 8004DA18 AFA30014 */   sw        $v1, 0x14($sp)
/* 4E61C 8004DA1C 240401BC */  addiu      $a0, $zero, 0x1bc
/* 4E620 8004DA20 0C0290E2 */  jal        get_borg_8
/* 4E624 8004DA24 AE22008C */   sw        $v0, 0x8c($s1)
/* 4E628 8004DA28 00404021 */  addu       $t0, $v0, $zero
/* 4E62C 8004DA2C 96020000 */  lhu        $v0, ($s0)
/* 4E630 8004DA30 9503000A */  lhu        $v1, 0xa($t0)
/* 4E634 8004DA34 02202021 */  addu       $a0, $s1, $zero
/* 4E638 8004DA38 00431023 */  subu       $v0, $v0, $v1
/* 4E63C 8004DA3C 2442FFFF */  addiu      $v0, $v0, -1
/* 4E640 8004DA40 A6220060 */  sh         $v0, 0x60($s1)
/* 4E644 8004DA44 96030002 */  lhu        $v1, 2($s0)
/* 4E648 8004DA48 9502000C */  lhu        $v0, 0xc($t0)
/* 4E64C 8004DA4C 01002821 */  addu       $a1, $t0, $zero
/* 4E650 8004DA50 00621823 */  subu       $v1, $v1, $v0
/* 4E654 8004DA54 A6230062 */  sh         $v1, 0x62($s1)
/* 4E658 8004DA58 96020000 */  lhu        $v0, ($s0)
/* 4E65C 8004DA5C 9506000A */  lhu        $a2, 0xa($t0)
/* 4E660 8004DA60 96070002 */  lhu        $a3, 2($s0)
/* 4E664 8004DA64 9503000C */  lhu        $v1, 0xc($t0)
/* 4E668 8004DA68 00463023 */  subu       $a2, $v0, $a2
/* 4E66C 8004DA6C 24C6FFFF */  addiu      $a2, $a2, -1
/* 4E670 8004DA70 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 4E674 8004DA74 00E33823 */  subu       $a3, $a3, $v1
/* 4E678 8004DA78 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 4E67C 8004DA7C 2442FFFF */  addiu      $v0, $v0, -1
/* 4E680 8004DA80 96030002 */  lhu        $v1, 2($s0)
/* 4E684 8004DA84 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E688 8004DA88 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E68C 8004DA8C 0C02F40F */  jal        func_800BD03C
/* 4E690 8004DA90 AFA30014 */   sw        $v1, 0x14($sp)
/* 4E694 8004DA94 240401BD */  addiu      $a0, $zero, 0x1bd
/* 4E698 8004DA98 0C0290E2 */  jal        get_borg_8
/* 4E69C 8004DA9C AE220094 */   sw        $v0, 0x94($s1)
/* 4E6A0 8004DAA0 00404021 */  addu       $t0, $v0, $zero
/* 4E6A4 8004DAA4 02202021 */  addu       $a0, $s1, $zero
/* 4E6A8 8004DAA8 01002821 */  addu       $a1, $t0, $zero
/* 4E6AC 8004DAAC 96020004 */  lhu        $v0, 4($s0)
/* 4E6B0 8004DAB0 96070002 */  lhu        $a3, 2($s0)
/* 4E6B4 8004DAB4 9503000C */  lhu        $v1, 0xc($t0)
/* 4E6B8 8004DAB8 9508000A */  lhu        $t0, 0xa($t0)
/* 4E6BC 8004DABC 00523021 */  addu       $a2, $v0, $s2
/* 4E6C0 8004DAC0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 4E6C4 8004DAC4 00E33823 */  subu       $a3, $a3, $v1
/* 4E6C8 8004DAC8 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 4E6CC 8004DACC 00481021 */  addu       $v0, $v0, $t0
/* 4E6D0 8004DAD0 24420001 */  addiu      $v0, $v0, 1
/* 4E6D4 8004DAD4 00531021 */  addu       $v0, $v0, $s3
/* 4E6D8 8004DAD8 96030002 */  lhu        $v1, 2($s0)
/* 4E6DC 8004DADC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E6E0 8004DAE0 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E6E4 8004DAE4 0C02F40F */  jal        func_800BD03C
/* 4E6E8 8004DAE8 AFA30014 */   sw        $v1, 0x14($sp)
/* 4E6EC 8004DAEC 240401BE */  addiu      $a0, $zero, 0x1be
/* 4E6F0 8004DAF0 0C0290E2 */  jal        get_borg_8
/* 4E6F4 8004DAF4 AE220098 */   sw        $v0, 0x98($s1)
/* 4E6F8 8004DAF8 00404021 */  addu       $t0, $v0, $zero
/* 4E6FC 8004DAFC 02202021 */  addu       $a0, $s1, $zero
/* 4E700 8004DB00 01002821 */  addu       $a1, $t0, $zero
/* 4E704 8004DB04 96020004 */  lhu        $v0, 4($s0)
/* 4E708 8004DB08 9503000A */  lhu        $v1, 0xa($t0)
/* 4E70C 8004DB0C 00529021 */  addu       $s2, $v0, $s2
/* 4E710 8004DB10 3246FFFF */  andi       $a2, $s2, 0xffff
/* 4E714 8004DB14 00431021 */  addu       $v0, $v0, $v1
/* 4E718 8004DB18 24420001 */  addiu      $v0, $v0, 1
/* 4E71C 8004DB1C 00531021 */  addu       $v0, $v0, $s3
/* 4E720 8004DB20 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E724 8004DB24 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E728 8004DB28 96020006 */  lhu        $v0, 6($s0)
/* 4E72C 8004DB2C 9503000C */  lhu        $v1, 0xc($t0)
/* 4E730 8004DB30 96070006 */  lhu        $a3, 6($s0)
/* 4E734 8004DB34 00431021 */  addu       $v0, $v0, $v1
/* 4E738 8004DB38 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E73C 8004DB3C 0C02F40F */  jal        func_800BD03C
/* 4E740 8004DB40 AFA20014 */   sw        $v0, 0x14($sp)
/* 4E744 8004DB44 240401BF */  addiu      $a0, $zero, 0x1bf
/* 4E748 8004DB48 0C0290E2 */  jal        get_borg_8
/* 4E74C 8004DB4C AE22009C */   sw        $v0, 0x9c($s1)
/* 4E750 8004DB50 00404021 */  addu       $t0, $v0, $zero
/* 4E754 8004DB54 02202021 */  addu       $a0, $s1, $zero
/* 4E758 8004DB58 96020000 */  lhu        $v0, ($s0)
/* 4E75C 8004DB5C 9506000A */  lhu        $a2, 0xa($t0)
/* 4E760 8004DB60 01002821 */  addu       $a1, $t0, $zero
/* 4E764 8004DB64 00463023 */  subu       $a2, $v0, $a2
/* 4E768 8004DB68 24C6FFFF */  addiu      $a2, $a2, -1
/* 4E76C 8004DB6C 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 4E770 8004DB70 2442FFFF */  addiu      $v0, $v0, -1
/* 4E774 8004DB74 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E778 8004DB78 AFA20010 */  sw         $v0, 0x10($sp)
/* 4E77C 8004DB7C 96020006 */  lhu        $v0, 6($s0)
/* 4E780 8004DB80 9503000C */  lhu        $v1, 0xc($t0)
/* 4E784 8004DB84 96070006 */  lhu        $a3, 6($s0)
/* 4E788 8004DB88 00431021 */  addu       $v0, $v0, $v1
/* 4E78C 8004DB8C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4E790 8004DB90 0C02F40F */  jal        func_800BD03C
/* 4E794 8004DB94 AFA20014 */   sw        $v0, 0x14($sp)
/* 4E798 8004DB98 02202021 */  addu       $a0, $s1, $zero
/* 4E79C 8004DB9C 00002821 */  addu       $a1, $zero, $zero
/* 4E7A0 8004DBA0 00003021 */  addu       $a2, $zero, $zero
/* 4E7A4 8004DBA4 00003821 */  addu       $a3, $zero, $zero
/* 4E7A8 8004DBA8 AE2200A0 */  sw         $v0, 0xa0($s1)
/* 4E7AC 8004DBAC 240200FF */  addiu      $v0, $zero, 0xff
/* 4E7B0 8004DBB0 0C02F1B7 */  jal        Widget_set_color
/* 4E7B4 8004DBB4 AFA20010 */   sw        $v0, 0x10($sp)
/* 4E7B8 8004DBB8 00002821 */  addu       $a1, $zero, $zero
/* 4E7BC 8004DBBC 00003021 */  addu       $a2, $zero, $zero
/* 4E7C0 8004DBC0 24070140 */  addiu      $a3, $zero, 0x140
/* 4E7C4 8004DBC4 8E240084 */  lw         $a0, 0x84($s1)
/* 4E7C8 8004DBC8 241000F0 */  addiu      $s0, $zero, 0xf0
/* 4E7CC 8004DBCC 0C00193A */  jal        func_800064E8
/* 4E7D0 8004DBD0 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E7D4 8004DBD4 00002821 */  addu       $a1, $zero, $zero
/* 4E7D8 8004DBD8 00003021 */  addu       $a2, $zero, $zero
/* 4E7DC 8004DBDC 8E240088 */  lw         $a0, 0x88($s1)
/* 4E7E0 8004DBE0 24070140 */  addiu      $a3, $zero, 0x140
/* 4E7E4 8004DBE4 0C00193A */  jal        func_800064E8
/* 4E7E8 8004DBE8 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E7EC 8004DBEC 00002821 */  addu       $a1, $zero, $zero
/* 4E7F0 8004DBF0 00003021 */  addu       $a2, $zero, $zero
/* 4E7F4 8004DBF4 8E24008C */  lw         $a0, 0x8c($s1)
/* 4E7F8 8004DBF8 24070140 */  addiu      $a3, $zero, 0x140
/* 4E7FC 8004DBFC 0C00193A */  jal        func_800064E8
/* 4E800 8004DC00 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E804 8004DC04 00002821 */  addu       $a1, $zero, $zero
/* 4E808 8004DC08 00003021 */  addu       $a2, $zero, $zero
/* 4E80C 8004DC0C 8E240090 */  lw         $a0, 0x90($s1)
/* 4E810 8004DC10 24070140 */  addiu      $a3, $zero, 0x140
/* 4E814 8004DC14 0C00193A */  jal        func_800064E8
/* 4E818 8004DC18 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E81C 8004DC1C 00002821 */  addu       $a1, $zero, $zero
/* 4E820 8004DC20 00003021 */  addu       $a2, $zero, $zero
/* 4E824 8004DC24 8E240094 */  lw         $a0, 0x94($s1)
/* 4E828 8004DC28 24070140 */  addiu      $a3, $zero, 0x140
/* 4E82C 8004DC2C 0C00193A */  jal        func_800064E8
/* 4E830 8004DC30 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E834 8004DC34 00002821 */  addu       $a1, $zero, $zero
/* 4E838 8004DC38 00003021 */  addu       $a2, $zero, $zero
/* 4E83C 8004DC3C 8E240098 */  lw         $a0, 0x98($s1)
/* 4E840 8004DC40 24070140 */  addiu      $a3, $zero, 0x140
/* 4E844 8004DC44 0C00193A */  jal        func_800064E8
/* 4E848 8004DC48 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E84C 8004DC4C 00002821 */  addu       $a1, $zero, $zero
/* 4E850 8004DC50 00003021 */  addu       $a2, $zero, $zero
/* 4E854 8004DC54 8E24009C */  lw         $a0, 0x9c($s1)
/* 4E858 8004DC58 24070140 */  addiu      $a3, $zero, 0x140
/* 4E85C 8004DC5C 0C00193A */  jal        func_800064E8
/* 4E860 8004DC60 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E864 8004DC64 00002821 */  addu       $a1, $zero, $zero
/* 4E868 8004DC68 00003021 */  addu       $a2, $zero, $zero
/* 4E86C 8004DC6C 8E2400A0 */  lw         $a0, 0xa0($s1)
/* 4E870 8004DC70 24070140 */  addiu      $a3, $zero, 0x140
/* 4E874 8004DC74 0C00193A */  jal        func_800064E8
/* 4E878 8004DC78 AFB00010 */   sw        $s0, 0x10($sp)
/* 4E87C 8004DC7C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 4E880 8004DC80 8FB30024 */  lw         $s3, 0x24($sp)
/* 4E884 8004DC84 8FB20020 */  lw         $s2, 0x20($sp)
/* 4E888 8004DC88 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4E88C 8004DC8C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4E890 8004DC90 03E00008 */  jr         $ra
/* 4E894 8004DC94 27BD0030 */   addiu     $sp, $sp, 0x30

glabel ofunc_sub_8004dc98
/* 4E898 8004DC98 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4E89C 8004DC9C AFB10014 */  sw         $s1, 0x14($sp)
/* 4E8A0 8004DCA0 00808821 */  addu       $s1, $a0, $zero
/* 4E8A4 8004DCA4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4E8A8 8004DCA8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4E8AC 8004DCAC 8E230078 */  lw         $v1, 0x78($s1)
/* 4E8B0 8004DCB0 00058400 */  sll        $s0, $a1, 0x10
/* 4E8B4 8004DCB4 84640018 */  lh         $a0, 0x18($v1)
/* 4E8B8 8004DCB8 8C62001C */  lw         $v0, 0x1c($v1)
/* 4E8BC 8004DCBC 0040F809 */  jalr       $v0
/* 4E8C0 8004DCC0 02242021 */   addu      $a0, $s1, $a0
/* 4E8C4 8004DCC4 02202021 */  addu       $a0, $s1, $zero
/* 4E8C8 8004DCC8 00101C03 */  sra        $v1, $s0, 0x10
/* 4E8CC 8004DCCC 00431021 */  addu       $v0, $v0, $v1
/* 4E8D0 8004DCD0 0C02DD42 */  jal        set_widgetHeight
/* 4E8D4 8004DCD4 3045FFFF */   andi      $a1, $v0, 0xffff
/* 4E8D8 8004DCD8 00108443 */  sra        $s0, $s0, 0x11
/* 4E8DC 8004DCDC 96220064 */  lhu        $v0, 0x64($s1)
/* 4E8E0 8004DCE0 96230060 */  lhu        $v1, 0x60($s1)
/* 4E8E4 8004DCE4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4E8E8 8004DCE8 00501023 */  subu       $v0, $v0, $s0
/* 4E8EC 8004DCEC A6220064 */  sh         $v0, 0x64($s1)
/* 4E8F0 8004DCF0 96220066 */  lhu        $v0, 0x66($s1)
/* 4E8F4 8004DCF4 00701823 */  subu       $v1, $v1, $s0
/* 4E8F8 8004DCF8 A6230060 */  sh         $v1, 0x60($s1)
/* 4E8FC 8004DCFC 02028021 */  addu       $s0, $s0, $v0
/* 4E900 8004DD00 A6300066 */  sh         $s0, 0x66($s1)
/* 4E904 8004DD04 8FB10014 */  lw         $s1, 0x14($sp)
/* 4E908 8004DD08 8FB00010 */  lw         $s0, 0x10($sp)
/* 4E90C 8004DD0C 03E00008 */  jr         $ra
/* 4E910 8004DD10 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004DD14
/* 4E914 8004DD14 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4E918 8004DD18 AFB10014 */  sw         $s1, 0x14($sp)
/* 4E91C 8004DD1C 00808821 */  addu       $s1, $a0, $zero
/* 4E920 8004DD20 AFB20018 */  sw         $s2, 0x18($sp)
/* 4E924 8004DD24 00059400 */  sll        $s2, $a1, 0x10
/* 4E928 8004DD28 AFB00010 */  sw         $s0, 0x10($sp)
/* 4E92C 8004DD2C 00128403 */  sra        $s0, $s2, 0x10
/* 4E930 8004DD30 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4E934 8004DD34 8E24007C */  lw         $a0, 0x7c($s1)
/* 4E938 8004DD38 0C013726 */  jal        ofunc_sub_8004dc98
/* 4E93C 8004DD3C 02002821 */   addu      $a1, $s0, $zero
/* 4E940 8004DD40 8E240088 */  lw         $a0, 0x88($s1)
/* 4E944 8004DD44 0C013726 */  jal        ofunc_sub_8004dc98
/* 4E948 8004DD48 02002821 */   addu      $a1, $s0, $zero
/* 4E94C 8004DD4C 8E240090 */  lw         $a0, 0x90($s1)
/* 4E950 8004DD50 0C013726 */  jal        ofunc_sub_8004dc98
/* 4E954 8004DD54 02002821 */   addu      $a1, $s0, $zero
/* 4E958 8004DD58 8E240080 */  lw         $a0, 0x80($s1)
/* 4E95C 8004DD5C 0C013726 */  jal        ofunc_sub_8004dc98
/* 4E960 8004DD60 02002821 */   addu      $a1, $s0, $zero
/* 4E964 8004DD64 00129443 */  sra        $s2, $s2, 0x11
/* 4E968 8004DD68 00128023 */  negu       $s0, $s2
/* 4E96C 8004DD6C 02002821 */  addu       $a1, $s0, $zero
/* 4E970 8004DD70 8E240084 */  lw         $a0, 0x84($s1)
/* 4E974 8004DD74 0C02F22A */  jal        widget_move
/* 4E978 8004DD78 00003021 */   addu      $a2, $zero, $zero
/* 4E97C 8004DD7C 02002821 */  addu       $a1, $s0, $zero
/* 4E980 8004DD80 8E240094 */  lw         $a0, 0x94($s1)
/* 4E984 8004DD84 0C02F22A */  jal        widget_move
/* 4E988 8004DD88 00003021 */   addu      $a2, $zero, $zero
/* 4E98C 8004DD8C 02002821 */  addu       $a1, $s0, $zero
/* 4E990 8004DD90 8E2400A0 */  lw         $a0, 0xa0($s1)
/* 4E994 8004DD94 0C02F22A */  jal        widget_move
/* 4E998 8004DD98 00003021 */   addu      $a2, $zero, $zero
/* 4E99C 8004DD9C 02402821 */  addu       $a1, $s2, $zero
/* 4E9A0 8004DDA0 8E24008C */  lw         $a0, 0x8c($s1)
/* 4E9A4 8004DDA4 0C02F22A */  jal        widget_move
/* 4E9A8 8004DDA8 00003021 */   addu      $a2, $zero, $zero
/* 4E9AC 8004DDAC 02402821 */  addu       $a1, $s2, $zero
/* 4E9B0 8004DDB0 8E240098 */  lw         $a0, 0x98($s1)
/* 4E9B4 8004DDB4 0C02F22A */  jal        widget_move
/* 4E9B8 8004DDB8 00003021 */   addu      $a2, $zero, $zero
/* 4E9BC 8004DDBC 02402821 */  addu       $a1, $s2, $zero
/* 4E9C0 8004DDC0 8E24009C */  lw         $a0, 0x9c($s1)
/* 4E9C4 8004DDC4 0C02F22A */  jal        widget_move
/* 4E9C8 8004DDC8 00003021 */   addu      $a2, $zero, $zero
/* 4E9CC 8004DDCC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4E9D0 8004DDD0 8FB20018 */  lw         $s2, 0x18($sp)
/* 4E9D4 8004DDD4 8FB10014 */  lw         $s1, 0x14($sp)
/* 4E9D8 8004DDD8 8FB00010 */  lw         $s0, 0x10($sp)
/* 4E9DC 8004DDDC 03E00008 */  jr         $ra
/* 4E9E0 8004DDE0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004DDE4
/* 4E9E4 8004DDE4 8C82007C */  lw         $v0, 0x7c($a0)
/* 4E9E8 8004DDE8 8C430040 */  lw         $v1, 0x40($v0)
/* 4E9EC 8004DDEC 10600008 */  beqz       $v1, .L8004DE10
/* 4E9F0 8004DDF0 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 4E9F4 8004DDF4 94640020 */  lhu        $a0, 0x20($v1)
/* 4E9F8 8004DDF8 00A4102B */  sltu       $v0, $a1, $a0
/* 4E9FC 8004DDFC 54400004 */  bnel       $v0, $zero, .L8004DE10
/* 4EA00 8004DE00 A465001E */   sh        $a1, 0x1e($v1)
/* 4EA04 8004DE04 2482FFFF */  addiu      $v0, $a0, -1
/* 4EA08 8004DE08 3045FFFF */  andi       $a1, $v0, 0xffff
/* 4EA0C 8004DE0C A465001E */  sh         $a1, 0x1e($v1)
.L8004DE10:
/* 4EA10 8004DE10 03E00008 */  jr         $ra
/* 4EA14 8004DE14 00000000 */   nop

glabel func_8004DE18
/* 4EA18 8004DE18 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4EA1C 8004DE1C AFB20018 */  sw         $s2, 0x18($sp)
/* 4EA20 8004DE20 00809021 */  addu       $s2, $a0, $zero
/* 4EA24 8004DE24 AFBF0020 */  sw         $ra, 0x20($sp)
/* 4EA28 8004DE28 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4EA2C 8004DE2C AFB10014 */  sw         $s1, 0x14($sp)
/* 4EA30 8004DE30 AFB00010 */  sw         $s0, 0x10($sp)
/* 4EA34 8004DE34 8E4500A4 */  lw         $a1, 0xa4($s2)
/* 4EA38 8004DE38 50A00007 */  beql       $a1, $zero, .L8004DE58
/* 4EA3C 8004DE3C 8E45007C */   lw        $a1, 0x7c($s2)
/* 4EA40 8004DE40 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EA44 8004DE44 84640028 */  lh         $a0, 0x28($v1)
/* 4EA48 8004DE48 8C62002C */  lw         $v0, 0x2c($v1)
/* 4EA4C 8004DE4C 0040F809 */  jalr       $v0
/* 4EA50 8004DE50 00A42021 */   addu      $a0, $a1, $a0
/* 4EA54 8004DE54 8E45007C */  lw         $a1, 0x7c($s2)
.L8004DE58:
/* 4EA58 8004DE58 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EA5C 8004DE5C 84640028 */  lh         $a0, 0x28($v1)
/* 4EA60 8004DE60 8C62002C */  lw         $v0, 0x2c($v1)
/* 4EA64 8004DE64 0040F809 */  jalr       $v0
/* 4EA68 8004DE68 00A42021 */   addu      $a0, $a1, $a0
/* 4EA6C 8004DE6C 8E4500A4 */  lw         $a1, 0xa4($s2)
/* 4EA70 8004DE70 10A00007 */  beqz       $a1, .L8004DE90
/* 4EA74 8004DE74 00008021 */   addu      $s0, $zero, $zero
/* 4EA78 8004DE78 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EA7C 8004DE7C 84640020 */  lh         $a0, 0x20($v1)
/* 4EA80 8004DE80 8C620024 */  lw         $v0, 0x24($v1)
/* 4EA84 8004DE84 0040F809 */  jalr       $v0
/* 4EA88 8004DE88 00A42021 */   addu      $a0, $a1, $a0
/* 4EA8C 8004DE8C 00408021 */  addu       $s0, $v0, $zero
.L8004DE90:
/* 4EA90 8004DE90 8E45007C */  lw         $a1, 0x7c($s2)
/* 4EA94 8004DE94 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EA98 8004DE98 84640020 */  lh         $a0, 0x20($v1)
/* 4EA9C 8004DE9C 8C620024 */  lw         $v0, 0x24($v1)
/* 4EAA0 8004DEA0 0040F809 */  jalr       $v0
/* 4EAA4 8004DEA4 00A42021 */   addu      $a0, $a1, $a0
/* 4EAA8 8004DEA8 8E44007C */  lw         $a0, 0x7c($s2)
/* 4EAAC 8004DEAC 8483006A */  lh         $v1, 0x6a($a0)
/* 4EAB0 8004DEB0 00403021 */  addu       $a2, $v0, $zero
/* 4EAB4 8004DEB4 0066182A */  slt        $v1, $v1, $a2
/* 4EAB8 8004DEB8 54600001 */  bnel       $v1, $zero, .L8004DEC0
/* 4EABC 8004DEBC 9486006A */   lhu       $a2, 0x6a($a0)
.L8004DEC0:
/* 4EAC0 8004DEC0 964200A8 */  lhu        $v0, 0xa8($s2)
/* 4EAC4 8004DEC4 964400AA */  lhu        $a0, 0xaa($s2)
/* 4EAC8 8004DEC8 8E4500A4 */  lw         $a1, 0xa4($s2)
/* 4EACC 8004DECC 02021021 */  addu       $v0, $s0, $v0
/* 4EAD0 8004DED0 00C21021 */  addu       $v0, $a2, $v0
/* 4EAD4 8004DED4 00041840 */  sll        $v1, $a0, 1
/* 4EAD8 8004DED8 00431021 */  addu       $v0, $v0, $v1
/* 4EADC 8004DEDC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4EAE0 8004DEE0 00021042 */  srl        $v0, $v0, 1
/* 4EAE4 8004DEE4 24030078 */  addiu      $v1, $zero, 0x78
/* 4EAE8 8004DEE8 00621823 */  subu       $v1, $v1, $v0
/* 4EAEC 8004DEEC 3063FFFF */  andi       $v1, $v1, 0xffff
/* 4EAF0 8004DEF0 00642023 */  subu       $a0, $v1, $a0
/* 4EAF4 8004DEF4 10A00005 */  beqz       $a1, .L8004DF0C
/* 4EAF8 8004DEF8 3093FFFF */   andi      $s3, $a0, 0xffff
/* 4EAFC 8004DEFC 00701021 */  addu       $v0, $v1, $s0
/* 4EB00 8004DF00 A4A2006A */  sh         $v0, 0x6a($a1)
/* 4EB04 8004DF04 A4A30062 */  sh         $v1, 0x62($a1)
/* 4EB08 8004DF08 A4A30068 */  sh         $v1, 0x68($a1)
.L8004DF0C:
/* 4EB0C 8004DF0C 8E44007C */  lw         $a0, 0x7c($s2)
/* 4EB10 8004DF10 8E4200A4 */  lw         $v0, 0xa4($s2)
/* 4EB14 8004DF14 A4830062 */  sh         $v1, 0x62($a0)
/* 4EB18 8004DF18 10400006 */  beqz       $v0, .L8004DF34
/* 4EB1C 8004DF1C A4830068 */   sh        $v1, 0x68($a0)
/* 4EB20 8004DF20 9442006A */  lhu        $v0, 0x6a($v0)
/* 4EB24 8004DF24 964300A8 */  lhu        $v1, 0xa8($s2)
/* 4EB28 8004DF28 00431021 */  addu       $v0, $v0, $v1
/* 4EB2C 8004DF2C A4820062 */  sh         $v0, 0x62($a0)
/* 4EB30 8004DF30 A4820068 */  sh         $v0, 0x68($a0)
.L8004DF34:
/* 4EB34 8004DF34 8E42007C */  lw         $v0, 0x7c($s2)
/* 4EB38 8004DF38 94510068 */  lhu        $s1, 0x68($v0)
/* 4EB3C 8004DF3C 8E430080 */  lw         $v1, 0x80($s2)
/* 4EB40 8004DF40 00D18821 */  addu       $s1, $a2, $s1
/* 4EB44 8004DF44 A451006A */  sh         $s1, 0x6a($v0)
/* 4EB48 8004DF48 964200AA */  lhu        $v0, 0xaa($s2)
/* 4EB4C 8004DF4C 00602021 */  addu       $a0, $v1, $zero
/* 4EB50 8004DF50 A4730062 */  sh         $s3, 0x62($v1)
/* 4EB54 8004DF54 02228821 */  addu       $s1, $s1, $v0
/* 4EB58 8004DF58 3231FFFF */  andi       $s1, $s1, 0xffff
/* 4EB5C 8004DF5C 02338023 */  subu       $s0, $s1, $s3
/* 4EB60 8004DF60 3210FFFF */  andi       $s0, $s0, 0xffff
/* 4EB64 8004DF64 0C02DD46 */  jal        set_widgetWidth
/* 4EB68 8004DF68 02002821 */   addu      $a1, $s0, $zero
/* 4EB6C 8004DF6C 8E420084 */  lw         $v0, 0x84($s2)
/* 4EB70 8004DF70 02002821 */  addu       $a1, $s0, $zero
/* 4EB74 8004DF74 00402021 */  addu       $a0, $v0, $zero
/* 4EB78 8004DF78 0C02DD46 */  jal        set_widgetWidth
/* 4EB7C 8004DF7C A4530062 */   sh        $s3, 0x62($v0)
/* 4EB80 8004DF80 8E450088 */  lw         $a1, 0x88($s2)
/* 4EB84 8004DF84 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EB88 8004DF88 84640020 */  lh         $a0, 0x20($v1)
/* 4EB8C 8004DF8C 8C620024 */  lw         $v0, 0x24($v1)
/* 4EB90 8004DF90 0040F809 */  jalr       $v0
/* 4EB94 8004DF94 00A42021 */   addu      $a0, $a1, $a0
/* 4EB98 8004DF98 02002821 */  addu       $a1, $s0, $zero
/* 4EB9C 8004DF9C 02621023 */  subu       $v0, $s3, $v0
/* 4EBA0 8004DFA0 8E46008C */  lw         $a2, 0x8c($s2)
/* 4EBA4 8004DFA4 8E430088 */  lw         $v1, 0x88($s2)
/* 4EBA8 8004DFA8 00C02021 */  addu       $a0, $a2, $zero
/* 4EBAC 8004DFAC A4620062 */  sh         $v0, 0x62($v1)
/* 4EBB0 8004DFB0 0C02DD46 */  jal        set_widgetWidth
/* 4EBB4 8004DFB4 A4D30062 */   sh        $s3, 0x62($a2)
/* 4EBB8 8004DFB8 8E450094 */  lw         $a1, 0x94($s2)
/* 4EBBC 8004DFBC 8E420090 */  lw         $v0, 0x90($s2)
/* 4EBC0 8004DFC0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EBC4 8004DFC4 A4510062 */  sh         $s1, 0x62($v0)
/* 4EBC8 8004DFC8 84640020 */  lh         $a0, 0x20($v1)
/* 4EBCC 8004DFCC 8C620024 */  lw         $v0, 0x24($v1)
/* 4EBD0 8004DFD0 0040F809 */  jalr       $v0
/* 4EBD4 8004DFD4 00A42021 */   addu      $a0, $a1, $a0
/* 4EBD8 8004DFD8 8E450098 */  lw         $a1, 0x98($s2)
/* 4EBDC 8004DFDC 8E440094 */  lw         $a0, 0x94($s2)
/* 4EBE0 8004DFE0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4EBE4 8004DFE4 02621023 */  subu       $v0, $s3, $v0
/* 4EBE8 8004DFE8 A4820062 */  sh         $v0, 0x62($a0)
/* 4EBEC 8004DFEC 84640020 */  lh         $a0, 0x20($v1)
/* 4EBF0 8004DFF0 8C620024 */  lw         $v0, 0x24($v1)
/* 4EBF4 8004DFF4 0040F809 */  jalr       $v0
/* 4EBF8 8004DFF8 00A42021 */   addu      $a0, $a1, $a0
/* 4EBFC 8004DFFC 8E440098 */  lw         $a0, 0x98($s2)
/* 4EC00 8004E000 8E45009C */  lw         $a1, 0x9c($s2)
/* 4EC04 8004E004 8E4600A0 */  lw         $a2, 0xa0($s2)
/* 4EC08 8004E008 8E430078 */  lw         $v1, 0x78($s2)
/* 4EC0C 8004E00C 02621023 */  subu       $v0, $s3, $v0
/* 4EC10 8004E010 A4820062 */  sh         $v0, 0x62($a0)
/* 4EC14 8004E014 A4B10062 */  sh         $s1, 0x62($a1)
/* 4EC18 8004E018 A4D10062 */  sh         $s1, 0x62($a2)
/* 4EC1C 8004E01C 84640028 */  lh         $a0, 0x28($v1)
/* 4EC20 8004E020 8C62002C */  lw         $v0, 0x2c($v1)
/* 4EC24 8004E024 0040F809 */  jalr       $v0
/* 4EC28 8004E028 02442021 */   addu      $a0, $s2, $a0
/* 4EC2C 8004E02C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 4EC30 8004E030 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4EC34 8004E034 8FB20018 */  lw         $s2, 0x18($sp)
/* 4EC38 8004E038 8FB10014 */  lw         $s1, 0x14($sp)
/* 4EC3C 8004E03C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4EC40 8004E040 03E00008 */  jr         $ra
/* 4EC44 8004E044 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004E048
/* 4EC48 8004E048 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4EC4C 8004E04C AFB00010 */  sw         $s0, 0x10($sp)
/* 4EC50 8004E050 00808021 */  addu       $s0, $a0, $zero
/* 4EC54 8004E054 00052C00 */  sll        $a1, $a1, 0x10
/* 4EC58 8004E058 00052C03 */  sra        $a1, $a1, 0x10
/* 4EC5C 8004E05C 00063400 */  sll        $a2, $a2, 0x10
/* 4EC60 8004E060 00063403 */  sra        $a2, $a2, 0x10
/* 4EC64 8004E064 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4EC68 8004E068 96020060 */  lhu        $v0, 0x60($s0)
/* 4EC6C 8004E06C 96030062 */  lhu        $v1, 0x62($s0)
/* 4EC70 8004E070 00A22823 */  subu       $a1, $a1, $v0
/* 4EC74 8004E074 00052C00 */  sll        $a1, $a1, 0x10
/* 4EC78 8004E078 00C33023 */  subu       $a2, $a2, $v1
/* 4EC7C 8004E07C 00063400 */  sll        $a2, $a2, 0x10
/* 4EC80 8004E080 00052C03 */  sra        $a1, $a1, 0x10
/* 4EC84 8004E084 0C02F22A */  jal        widget_move
/* 4EC88 8004E088 00063403 */   sra       $a2, $a2, 0x10
/* 4EC8C 8004E08C 8E030078 */  lw         $v1, 0x78($s0)
/* 4EC90 8004E090 84640028 */  lh         $a0, 0x28($v1)
/* 4EC94 8004E094 8C62002C */  lw         $v0, 0x2c($v1)
/* 4EC98 8004E098 0040F809 */  jalr       $v0
/* 4EC9C 8004E09C 02042021 */   addu      $a0, $s0, $a0
/* 4ECA0 8004E0A0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4ECA4 8004E0A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 4ECA8 8004E0A8 03E00008 */  jr         $ra
/* 4ECAC 8004E0AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004E0B0
/* 4ECB0 8004E0B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4ECB4 8004E0B4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4ECB8 8004E0B8 8C860080 */  lw         $a2, 0x80($a0)
/* 4ECBC 8004E0BC 00A01021 */  addu       $v0, $a1, $zero
/* 4ECC0 8004E0C0 8CC80078 */  lw         $t0, 0x78($a2)
/* 4ECC4 8004E0C4 90430003 */  lbu        $v1, 3($v0)
/* 4ECC8 8004E0C8 85040048 */  lh         $a0, 0x48($t0)
/* 4ECCC 8004E0CC AFA30010 */  sw         $v1, 0x10($sp)
/* 4ECD0 8004E0D0 90450000 */  lbu        $a1, ($v0)
/* 4ECD4 8004E0D4 90470002 */  lbu        $a3, 2($v0)
/* 4ECD8 8004E0D8 8D03004C */  lw         $v1, 0x4c($t0)
/* 4ECDC 8004E0DC 00C42021 */  addu       $a0, $a2, $a0
/* 4ECE0 8004E0E0 0060F809 */  jalr       $v1
/* 4ECE4 8004E0E4 90460001 */   lbu       $a2, 1($v0)
/* 4ECE8 8004E0E8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4ECEC 8004E0EC 03E00008 */  jr         $ra
/* 4ECF0 8004E0F0 27BD0020 */   addiu     $sp, $sp, 0x20
/* 4ECF4 8004E0F4 00000000 */  nop
/* 4ECF8 8004E0F8 00000000 */  nop
/* 4ECFC 8004E0FC 00000000 */  nop
