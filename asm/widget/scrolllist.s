.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800BAD40
/* BB940 800BAD40 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BB944 800BAD44 AFB10014 */  sw         $s1, 0x14($sp)
/* BB948 800BAD48 00A08821 */  addu       $s1, $a1, $zero
/* BB94C 800BAD4C AFBF0018 */  sw         $ra, 0x18($sp)
/* BB950 800BAD50 AFB00010 */  sw         $s0, 0x10($sp)
/* BB954 800BAD54 8E300040 */  lw         $s0, 0x40($s1)
/* BB958 800BAD58 86030004 */  lh         $v1, 4($s0)
/* BB95C 800BAD5C 86020008 */  lh         $v0, 8($s0)
/* BB960 800BAD60 1462003C */  bne        $v1, $v0, .L800BAE54
/* BB964 800BAD64 00001021 */   addu      $v0, $zero, $zero
/* BB968 800BAD68 92020012 */  lbu        $v0, 0x12($s0)
/* BB96C 800BAD6C 92030011 */  lbu        $v1, 0x11($s0)
/* BB970 800BAD70 2442FFFF */  addiu      $v0, $v0, -1
/* BB974 800BAD74 0062182A */  slt        $v1, $v1, $v0
/* BB978 800BAD78 10600036 */  beqz       $v1, .L800BAE54
/* BB97C 800BAD7C 00001021 */   addu      $v0, $zero, $zero
/* BB980 800BAD80 92020011 */  lbu        $v0, 0x11($s0)
.L800BAD84:
/* BB984 800BAD84 24420001 */  addiu      $v0, $v0, 1
/* BB988 800BAD88 A2020011 */  sb         $v0, 0x11($s0)
/* BB98C 800BAD8C 304300FF */  andi       $v1, $v0, 0xff
/* BB990 800BAD90 8E02000C */  lw         $v0, 0xc($s0)
/* BB994 800BAD94 00031880 */  sll        $v1, $v1, 2
/* BB998 800BAD98 00621821 */  addu       $v1, $v1, $v0
/* BB99C 800BAD9C 8C660000 */  lw         $a2, ($v1)
/* BB9A0 800BADA0 8CC50078 */  lw         $a1, 0x78($a2)
/* BB9A4 800BADA4 84A40020 */  lh         $a0, 0x20($a1)
/* BB9A8 800BADA8 8CA20024 */  lw         $v0, 0x24($a1)
/* BB9AC 800BADAC 0040F809 */  jalr       $v0
/* BB9B0 800BADB0 00C42021 */   addu      $a0, $a2, $a0
/* BB9B4 800BADB4 92060011 */  lbu        $a2, 0x11($s0)
/* BB9B8 800BADB8 8E04000C */  lw         $a0, 0xc($s0)
/* BB9BC 800BADBC 00061880 */  sll        $v1, $a2, 2
/* BB9C0 800BADC0 00641821 */  addu       $v1, $v1, $a0
/* BB9C4 800BADC4 8C650000 */  lw         $a1, ($v1)
/* BB9C8 800BADC8 94A40062 */  lhu        $a0, 0x62($a1)
/* BB9CC 800BADCC 00822021 */  addu       $a0, $a0, $v0
/* BB9D0 800BADD0 00042400 */  sll        $a0, $a0, 0x10
/* BB9D4 800BADD4 00041C03 */  sra        $v1, $a0, 0x10
/* BB9D8 800BADD8 8622006A */  lh         $v0, 0x6a($s1)
/* BB9DC 800BADDC 0043102A */  slt        $v0, $v0, $v1
/* BB9E0 800BADE0 10400016 */  beqz       $v0, .L800BAE3C
/* BB9E4 800BADE4 9624006A */   lhu       $a0, 0x6a($s1)
/* BB9E8 800BADE8 00642023 */  subu       $a0, $v1, $a0
/* BB9EC 800BADEC 96020008 */  lhu        $v0, 8($s0)
/* BB9F0 800BADF0 8E230078 */  lw         $v1, 0x78($s1)
/* BB9F4 800BADF4 00441023 */  subu       $v0, $v0, $a0
/* BB9F8 800BADF8 A6020008 */  sh         $v0, 8($s0)
/* BB9FC 800BADFC 84640020 */  lh         $a0, 0x20($v1)
/* BBA00 800BAE00 8C620024 */  lw         $v0, 0x24($v1)
/* BBA04 800BAE04 0040F809 */  jalr       $v0
/* BBA08 800BAE08 02242021 */   addu      $a0, $s1, $a0
/* BBA0C 800BAE0C 9623006A */  lhu        $v1, 0x6a($s1)
/* BBA10 800BAE10 96240068 */  lhu        $a0, 0x68($s1)
/* BBA14 800BAE14 00641823 */  subu       $v1, $v1, $a0
/* BBA18 800BAE18 00621823 */  subu       $v1, $v1, $v0
/* BBA1C 800BAE1C 00031C00 */  sll        $v1, $v1, 0x10
/* BBA20 800BAE20 86020008 */  lh         $v0, 8($s0)
/* BBA24 800BAE24 00031C03 */  sra        $v1, $v1, 0x10
/* BBA28 800BAE28 0043102A */  slt        $v0, $v0, $v1
/* BBA2C 800BAE2C 54400008 */  bnel       $v0, $zero, .L800BAE50
/* BBA30 800BAE30 A6030008 */   sh        $v1, 8($s0)
/* BBA34 800BAE34 0802EB95 */  j          .L800BAE54
/* BBA38 800BAE38 00001021 */   addu      $v0, $zero, $zero
.L800BAE3C:
/* BBA3C 800BAE3C 92020012 */  lbu        $v0, 0x12($s0)
/* BBA40 800BAE40 2442FFFF */  addiu      $v0, $v0, -1
/* BBA44 800BAE44 00C2102A */  slt        $v0, $a2, $v0
/* BBA48 800BAE48 5440FFCE */  bnel       $v0, $zero, .L800BAD84
/* BBA4C 800BAE4C 92020011 */   lbu       $v0, 0x11($s0)
.L800BAE50:
/* BBA50 800BAE50 00001021 */  addu       $v0, $zero, $zero
.L800BAE54:
/* BBA54 800BAE54 8FBF0018 */  lw         $ra, 0x18($sp)
/* BBA58 800BAE58 8FB10014 */  lw         $s1, 0x14($sp)
/* BBA5C 800BAE5C 8FB00010 */  lw         $s0, 0x10($sp)
/* BBA60 800BAE60 03E00008 */  jr         $ra
/* BBA64 800BAE64 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BAE68
/* BBA68 800BAE68 8CA60040 */  lw         $a2, 0x40($a1)
/* BBA6C 800BAE6C 84C30004 */  lh         $v1, 4($a2)
/* BBA70 800BAE70 84C20008 */  lh         $v0, 8($a2)
/* BBA74 800BAE74 50620003 */  beql       $v1, $v0, .L800BAE84
/* BBA78 800BAE78 90C20011 */   lbu       $v0, 0x11($a2)
/* BBA7C 800BAE7C 03E00008 */  jr         $ra
/* BBA80 800BAE80 00001021 */   addu      $v0, $zero, $zero
.L800BAE84:
/* BBA84 800BAE84 1040001B */  beqz       $v0, .L800BAEF4
/* BBA88 800BAE88 00001021 */   addu      $v0, $zero, $zero
/* BBA8C 800BAE8C 8CC9000C */  lw         $t1, 0xc($a2)
/* BBA90 800BAE90 90C20011 */  lbu        $v0, 0x11($a2)
.L800BAE94:
/* BBA94 800BAE94 2442FFFF */  addiu      $v0, $v0, -1
/* BBA98 800BAE98 A0C20011 */  sb         $v0, 0x11($a2)
/* BBA9C 800BAE9C 304800FF */  andi       $t0, $v0, 0xff
/* BBAA0 800BAEA0 00081080 */  sll        $v0, $t0, 2
/* BBAA4 800BAEA4 00491021 */  addu       $v0, $v0, $t1
/* BBAA8 800BAEA8 8C440000 */  lw         $a0, ($v0)
/* BBAAC 800BAEAC 84A20068 */  lh         $v0, 0x68($a1)
/* BBAB0 800BAEB0 84830062 */  lh         $v1, 0x62($a0)
/* BBAB4 800BAEB4 94870062 */  lhu        $a3, 0x62($a0)
/* BBAB8 800BAEB8 0062182A */  slt        $v1, $v1, $v0
/* BBABC 800BAEBC 1060000A */  beqz       $v1, .L800BAEE8
/* BBAC0 800BAEC0 94A40068 */   lhu       $a0, 0x68($a1)
/* BBAC4 800BAEC4 94C20008 */  lhu        $v0, 8($a2)
/* BBAC8 800BAEC8 00871823 */  subu       $v1, $a0, $a3
/* BBACC 800BAECC 00431021 */  addu       $v0, $v0, $v1
/* BBAD0 800BAED0 A4C20008 */  sh         $v0, 8($a2)
/* BBAD4 800BAED4 00021400 */  sll        $v0, $v0, 0x10
/* BBAD8 800BAED8 5C400005 */  bgtzl      $v0, .L800BAEF0
/* BBADC 800BAEDC A4C00008 */   sh        $zero, 8($a2)
/* BBAE0 800BAEE0 03E00008 */  jr         $ra
/* BBAE4 800BAEE4 00001021 */   addu      $v0, $zero, $zero
.L800BAEE8:
/* BBAE8 800BAEE8 5500FFEA */  bnel       $t0, $zero, .L800BAE94
/* BBAEC 800BAEEC 90C20011 */   lbu       $v0, 0x11($a2)
.L800BAEF0:
/* BBAF0 800BAEF0 00001021 */  addu       $v0, $zero, $zero
.L800BAEF4:
/* BBAF4 800BAEF4 03E00008 */  jr         $ra
/* BBAF8 800BAEF8 00000000 */   nop

glabel ret0_800baefc
/* BBAFC 800BAEFC 03E00008 */  jr         $ra
/* BBB00 800BAF00 00001021 */   addu      $v0, $zero, $zero

glabel ret0_800BAF04
/* BBB04 800BAF04 03E00008 */  jr         $ra
/* BBB08 800BAF08 00001021 */   addu      $v0, $zero, $zero

glabel ret_a1
/* BBB0C 800BAF0C 03E00008 */  jr         $ra
/* BBB10 800BAF10 00A01021 */   addu      $v0, $a1, $zero

glabel widgetscrolllist_init
/* BBB14 800BAF14 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BBB18 800BAF18 AFB10014 */  sw         $s1, 0x14($sp)
/* BBB1C 800BAF1C 00808821 */  addu       $s1, $a0, $zero
/* BBB20 800BAF20 AFB20018 */  sw         $s2, 0x18($sp)
/* BBB24 800BAF24 30B200FF */  andi       $s2, $a1, 0xff
/* BBB28 800BAF28 AFBF001C */  sw         $ra, 0x1c($sp)
/* BBB2C 800BAF2C 0C02DCFC */  jal        widget_init
/* BBB30 800BAF30 AFB00010 */   sw        $s0, 0x10($sp)
/* BBB34 800BAF34 24040014 */  addiu      $a0, $zero, 0x14
/* BBB38 800BAF38 3C02800E */  lui        $v0, %hi(D_800E47D0)
/* BBB3C 800BAF3C 244247D0 */  addiu      $v0, $v0, %lo(D_800E47D0)
/* BBB40 800BAF40 0C026259 */  jal        passToMalloc
/* BBB44 800BAF44 AE220078 */   sw        $v0, 0x78($s1)
/* BBB48 800BAF48 00408021 */  addu       $s0, $v0, $zero
/* BBB4C 800BAF4C 24020005 */  addiu      $v0, $zero, 5
/* BBB50 800BAF50 24030020 */  addiu      $v1, $zero, 0x20
/* BBB54 800BAF54 A6200060 */  sh         $zero, 0x60($s1)
/* BBB58 800BAF58 A6200062 */  sh         $zero, 0x62($s1)
/* BBB5C 800BAF5C A6200074 */  sh         $zero, 0x74($s1)
/* BBB60 800BAF60 A6200072 */  sh         $zero, 0x72($s1)
/* BBB64 800BAF64 A2020000 */  sb         $v0, ($s0)
/* BBB68 800BAF68 3C02800C */  lui        $v0, %hi(func_800BAE68)
/* BBB6C 800BAF6C 2442AE68 */  addiu      $v0, $v0, %lo(func_800BAE68)
/* BBB70 800BAF70 A2030001 */  sb         $v1, 1($s0)
/* BBB74 800BAF74 3C03800C */  lui        $v1, %hi(func_800BAD40)
/* BBB78 800BAF78 2463AD40 */  addiu      $v1, $v1, %lo(func_800BAD40)
/* BBB7C 800BAF7C AE220008 */  sw         $v0, 8($s1)
/* BBB80 800BAF80 3C02800C */  lui        $v0, %hi(ret_a1)
/* BBB84 800BAF84 2442AF0C */  addiu      $v0, $v0, %lo(ret_a1)
/* BBB88 800BAF88 AE23000C */  sw         $v1, 0xc($s1)
/* BBB8C 800BAF8C 3C03800C */  lui        $v1, %hi(ret0_800baefc)
/* BBB90 800BAF90 2463AEFC */  addiu      $v1, $v1, %lo(ret0_800baefc)
/* BBB94 800BAF94 AE220018 */  sw         $v0, 0x18($s1)
/* BBB98 800BAF98 3C02800C */  lui        $v0, %hi(ret0_800BAF04)
/* BBB9C 800BAF9C 2442AF04 */  addiu      $v0, $v0, %lo(ret0_800BAF04)
/* BBBA0 800BAFA0 A6000004 */  sh         $zero, 4($s0)
/* BBBA4 800BAFA4 A6000008 */  sh         $zero, 8($s0)
/* BBBA8 800BAFA8 AE230010 */  sw         $v1, 0x10($s1)
/* BBBAC 800BAFAC AE220014 */  sw         $v0, 0x14($s1)
/* BBBB0 800BAFB0 AE200000 */  sw         $zero, ($s1)
/* BBBB4 800BAFB4 AE200004 */  sw         $zero, 4($s1)
/* BBBB8 800BAFB8 A2000011 */  sb         $zero, 0x11($s0)
/* BBBBC 800BAFBC A2120010 */  sb         $s2, 0x10($s0)
/* BBBC0 800BAFC0 A2000012 */  sb         $zero, 0x12($s0)
/* BBBC4 800BAFC4 1240000F */  beqz       $s2, .L800BB004
/* BBBC8 800BAFC8 A2000013 */   sb        $zero, 0x13($s0)
/* BBBCC 800BAFCC 00122080 */  sll        $a0, $s2, 2
/* BBBD0 800BAFD0 3C05800E */  lui        $a1, %hi(D_800E47B0)
/* BBBD4 800BAFD4 24A547B0 */  addiu      $a1, $a1, %lo(D_800E47B0)
/* BBBD8 800BAFD8 0C025F9C */  jal        Malloc
/* BBBDC 800BAFDC 24060086 */   addiu     $a2, $zero, 0x86
/* BBBE0 800BAFE0 12400009 */  beqz       $s2, .L800BB008
/* BBBE4 800BAFE4 AE02000C */   sw        $v0, 0xc($s0)
/* BBBE8 800BAFE8 02402021 */  addu       $a0, $s2, $zero
.L800BAFEC:
/* BBBEC 800BAFEC AC400000 */  sw         $zero, ($v0)
/* BBBF0 800BAFF0 2484FFFF */  addiu      $a0, $a0, -1
/* BBBF4 800BAFF4 1480FFFD */  bnez       $a0, .L800BAFEC
/* BBBF8 800BAFF8 24420004 */   addiu     $v0, $v0, 4
/* BBBFC 800BAFFC 0802EC03 */  j          .L800BB00C
/* BBC00 800BB000 02202021 */   addu      $a0, $s1, $zero
.L800BB004:
/* BBC04 800BB004 AE00000C */  sw         $zero, 0xc($s0)
.L800BB008:
/* BBC08 800BB008 02202021 */  addu       $a0, $s1, $zero
.L800BB00C:
/* BBC0C 800BB00C 24050001 */  addiu      $a1, $zero, 1
/* BBC10 800BB010 0C02DEC8 */  jal        set_widgets_byte0x70
/* BBC14 800BB014 AE300040 */   sw        $s0, 0x40($s1)
/* BBC18 800BB018 02201021 */  addu       $v0, $s1, $zero
/* BBC1C 800BB01C 8FBF001C */  lw         $ra, 0x1c($sp)
/* BBC20 800BB020 8FB20018 */  lw         $s2, 0x18($sp)
/* BBC24 800BB024 8FB10014 */  lw         $s1, 0x14($sp)
/* BBC28 800BB028 8FB00010 */  lw         $s0, 0x10($sp)
/* BBC2C 800BB02C 03E00008 */  jr         $ra
/* BBC30 800BB030 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widgetscrolllist_free
/* BBC34 800BB034 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BBC38 800BB038 AFB3001C */  sw         $s3, 0x1c($sp)
/* BBC3C 800BB03C 00809821 */  addu       $s3, $a0, $zero
/* BBC40 800BB040 3C02800E */  lui        $v0, %hi(D_800E47D0)
/* BBC44 800BB044 244247D0 */  addiu      $v0, $v0, %lo(D_800E47D0)
/* BBC48 800BB048 AFBF0024 */  sw         $ra, 0x24($sp)
/* BBC4C 800BB04C AFB40020 */  sw         $s4, 0x20($sp)
/* BBC50 800BB050 AFB20018 */  sw         $s2, 0x18($sp)
/* BBC54 800BB054 AFB10014 */  sw         $s1, 0x14($sp)
/* BBC58 800BB058 AFB00010 */  sw         $s0, 0x10($sp)
/* BBC5C 800BB05C 8E710040 */  lw         $s1, 0x40($s3)
/* BBC60 800BB060 00A0A021 */  addu       $s4, $a1, $zero
/* BBC64 800BB064 12200021 */  beqz       $s1, .L800BB0EC
/* BBC68 800BB068 AE620078 */   sw        $v0, 0x78($s3)
/* BBC6C 800BB06C 92220012 */  lbu        $v0, 0x12($s1)
/* BBC70 800BB070 10400014 */  beqz       $v0, .L800BB0C4
/* BBC74 800BB074 00008021 */   addu      $s0, $zero, $zero
/* BBC78 800BB078 8E22000C */  lw         $v0, 0xc($s1)
.L800BB07C:
/* BBC7C 800BB07C 00109080 */  sll        $s2, $s0, 2
/* BBC80 800BB080 02421021 */  addu       $v0, $s2, $v0
/* BBC84 800BB084 8C460000 */  lw         $a2, ($v0)
/* BBC88 800BB088 10C00009 */  beqz       $a2, .L800BB0B0
/* BBC8C 800BB08C 24050003 */   addiu     $a1, $zero, 3
/* BBC90 800BB090 8CC20078 */  lw         $v0, 0x78($a2)
/* BBC94 800BB094 84440008 */  lh         $a0, 8($v0)
/* BBC98 800BB098 8C43000C */  lw         $v1, 0xc($v0)
/* BBC9C 800BB09C 0060F809 */  jalr       $v1
/* BBCA0 800BB0A0 00C42021 */   addu      $a0, $a2, $a0
/* BBCA4 800BB0A4 8E22000C */  lw         $v0, 0xc($s1)
/* BBCA8 800BB0A8 02421021 */  addu       $v0, $s2, $v0
/* BBCAC 800BB0AC AC400000 */  sw         $zero, ($v0)
.L800BB0B0:
/* BBCB0 800BB0B0 92220012 */  lbu        $v0, 0x12($s1)
/* BBCB4 800BB0B4 26100001 */  addiu      $s0, $s0, 1
/* BBCB8 800BB0B8 0202102A */  slt        $v0, $s0, $v0
/* BBCBC 800BB0BC 5440FFEF */  bnel       $v0, $zero, .L800BB07C
/* BBCC0 800BB0C0 8E22000C */   lw        $v0, 0xc($s1)
.L800BB0C4:
/* BBCC4 800BB0C4 8E24000C */  lw         $a0, 0xc($s1)
/* BBCC8 800BB0C8 10800005 */  beqz       $a0, .L800BB0E0
/* BBCCC 800BB0CC 3C05800E */   lui       $a1, %hi(D_800E47B0)
/* BBCD0 800BB0D0 24A547B0 */  addiu      $a1, $a1, %lo(D_800E47B0)
/* BBCD4 800BB0D4 0C02600C */  jal        Free
/* BBCD8 800BB0D8 240600A9 */   addiu     $a2, $zero, 0xa9
/* BBCDC 800BB0DC AE20000C */  sw         $zero, 0xc($s1)
.L800BB0E0:
/* BBCE0 800BB0E0 0C026262 */  jal        passToFree
/* BBCE4 800BB0E4 02202021 */   addu      $a0, $s1, $zero
/* BBCE8 800BB0E8 AE600040 */  sw         $zero, 0x40($s3)
.L800BB0EC:
/* BBCEC 800BB0EC 02602021 */  addu       $a0, $s3, $zero
/* BBCF0 800BB0F0 0C02DD2B */  jal        free_widget
/* BBCF4 800BB0F4 02802821 */   addu      $a1, $s4, $zero
/* BBCF8 800BB0F8 8FBF0024 */  lw         $ra, 0x24($sp)
/* BBCFC 800BB0FC 8FB40020 */  lw         $s4, 0x20($sp)
/* BBD00 800BB100 8FB3001C */  lw         $s3, 0x1c($sp)
/* BBD04 800BB104 8FB20018 */  lw         $s2, 0x18($sp)
/* BBD08 800BB108 8FB10014 */  lw         $s1, 0x14($sp)
/* BBD0C 800BB10C 8FB00010 */  lw         $s0, 0x10($sp)
/* BBD10 800BB110 03E00008 */  jr         $ra
/* BBD14 800BB114 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BB118
/* BBD18 800BB118 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BBD1C 800BB11C AFB00018 */  sw         $s0, 0x18($sp)
/* BBD20 800BB120 00008021 */  addu       $s0, $zero, $zero
/* BBD24 800BB124 AFB60030 */  sw         $s6, 0x30($sp)
/* BBD28 800BB128 0080B021 */  addu       $s6, $a0, $zero
/* BBD2C 800BB12C 00063400 */  sll        $a2, $a2, 0x10
/* BBD30 800BB130 AFB5002C */  sw         $s5, 0x2c($sp)
/* BBD34 800BB134 0006AC03 */  sra        $s5, $a2, 0x10
/* BBD38 800BB138 00073C00 */  sll        $a3, $a3, 0x10
/* BBD3C 800BB13C AFB40028 */  sw         $s4, 0x28($sp)
/* BBD40 800BB140 0007A403 */  sra        $s4, $a3, 0x10
/* BBD44 800BB144 AFBF0034 */  sw         $ra, 0x34($sp)
/* BBD48 800BB148 AFB30024 */  sw         $s3, 0x24($sp)
/* BBD4C 800BB14C AFB20020 */  sw         $s2, 0x20($sp)
/* BBD50 800BB150 AFB1001C */  sw         $s1, 0x1c($sp)
/* BBD54 800BB154 8ED10040 */  lw         $s1, 0x40($s6)
/* BBD58 800BB158 87B3004A */  lh         $s3, 0x4a($sp)
/* BBD5C 800BB15C 92220012 */  lbu        $v0, 0x12($s1)
/* BBD60 800BB160 10400015 */  beqz       $v0, .L800BB1B8
/* BBD64 800BB164 87B2004E */   lh        $s2, 0x4e($sp)
/* BBD68 800BB168 8E23000C */  lw         $v1, 0xc($s1)
.L800BB16C:
/* BBD6C 800BB16C 00101080 */  sll        $v0, $s0, 2
/* BBD70 800BB170 00431021 */  addu       $v0, $v0, $v1
/* BBD74 800BB174 8C480000 */  lw         $t0, ($v0)
/* BBD78 800BB178 1100000A */  beqz       $t0, .L800BB1A4
/* BBD7C 800BB17C 02A03021 */   addu      $a2, $s5, $zero
/* BBD80 800BB180 8D030078 */  lw         $v1, 0x78($t0)
/* BBD84 800BB184 84640040 */  lh         $a0, 0x40($v1)
/* BBD88 800BB188 02803821 */  addu       $a3, $s4, $zero
/* BBD8C 800BB18C AFB30010 */  sw         $s3, 0x10($sp)
/* BBD90 800BB190 AFB20014 */  sw         $s2, 0x14($sp)
/* BBD94 800BB194 8C620044 */  lw         $v0, 0x44($v1)
/* BBD98 800BB198 0040F809 */  jalr       $v0
/* BBD9C 800BB19C 01042021 */   addu      $a0, $t0, $a0
/* BBDA0 800BB1A0 00402821 */  addu       $a1, $v0, $zero
.L800BB1A4:
/* BBDA4 800BB1A4 92220012 */  lbu        $v0, 0x12($s1)
/* BBDA8 800BB1A8 26100001 */  addiu      $s0, $s0, 1
/* BBDAC 800BB1AC 0202102A */  slt        $v0, $s0, $v0
/* BBDB0 800BB1B0 5440FFEE */  bnel       $v0, $zero, .L800BB16C
/* BBDB4 800BB1B4 8E23000C */   lw        $v1, 0xc($s1)
.L800BB1B8:
/* BBDB8 800BB1B8 02C02021 */  addu       $a0, $s6, $zero
/* BBDBC 800BB1BC 02A03021 */  addu       $a2, $s5, $zero
/* BBDC0 800BB1C0 02803821 */  addu       $a3, $s4, $zero
/* BBDC4 800BB1C4 AFB30010 */  sw         $s3, 0x10($sp)
/* BBDC8 800BB1C8 0C02DE14 */  jal        widget_func_8
/* BBDCC 800BB1CC AFB20014 */   sw        $s2, 0x14($sp)
/* BBDD0 800BB1D0 8FBF0034 */  lw         $ra, 0x34($sp)
/* BBDD4 800BB1D4 8FB60030 */  lw         $s6, 0x30($sp)
/* BBDD8 800BB1D8 8FB5002C */  lw         $s5, 0x2c($sp)
/* BBDDC 800BB1DC 8FB40028 */  lw         $s4, 0x28($sp)
/* BBDE0 800BB1E0 8FB30024 */  lw         $s3, 0x24($sp)
/* BBDE4 800BB1E4 8FB20020 */  lw         $s2, 0x20($sp)
/* BBDE8 800BB1E8 8FB1001C */  lw         $s1, 0x1c($sp)
/* BBDEC 800BB1EC 8FB00018 */  lw         $s0, 0x18($sp)
/* BBDF0 800BB1F0 03E00008 */  jr         $ra
/* BBDF4 800BB1F4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800BB1F8
/* BBDF8 800BB1F8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BBDFC 800BB1FC AFB20018 */  sw         $s2, 0x18($sp)
/* BBE00 800BB200 00809021 */  addu       $s2, $a0, $zero
/* BBE04 800BB204 AFBF0024 */  sw         $ra, 0x24($sp)
/* BBE08 800BB208 AFB40020 */  sw         $s4, 0x20($sp)
/* BBE0C 800BB20C AFB3001C */  sw         $s3, 0x1c($sp)
/* BBE10 800BB210 AFB10014 */  sw         $s1, 0x14($sp)
/* BBE14 800BB214 AFB00010 */  sw         $s0, 0x10($sp)
/* BBE18 800BB218 8E510040 */  lw         $s1, 0x40($s2)
/* BBE1C 800BB21C 8E22000C */  lw         $v0, 0xc($s1)
/* BBE20 800BB220 10400039 */  beqz       $v0, .L800BB308
/* BBE24 800BB224 0000A021 */   addu      $s4, $zero, $zero
/* BBE28 800BB228 92220012 */  lbu        $v0, 0x12($s1)
/* BBE2C 800BB22C 10400036 */  beqz       $v0, .L800BB308
/* BBE30 800BB230 00009821 */   addu      $s3, $zero, $zero
.L800BB234:
/* BBE34 800BB234 8E23000C */  lw         $v1, 0xc($s1)
/* BBE38 800BB238 00131080 */  sll        $v0, $s3, 2
/* BBE3C 800BB23C 00431021 */  addu       $v0, $v0, $v1
/* BBE40 800BB240 8C500000 */  lw         $s0, ($v0)
/* BBE44 800BB244 96430064 */  lhu        $v1, 0x64($s2)
/* BBE48 800BB248 A6030064 */  sh         $v1, 0x64($s0)
/* BBE4C 800BB24C 96420066 */  lhu        $v0, 0x66($s2)
/* BBE50 800BB250 A6020066 */  sh         $v0, 0x66($s0)
/* BBE54 800BB254 96430068 */  lhu        $v1, 0x68($s2)
/* BBE58 800BB258 A6030068 */  sh         $v1, 0x68($s0)
/* BBE5C 800BB25C 9642006A */  lhu        $v0, 0x6a($s2)
/* BBE60 800BB260 8E030078 */  lw         $v1, 0x78($s0)
/* BBE64 800BB264 A602006A */  sh         $v0, 0x6a($s0)
/* BBE68 800BB268 84640010 */  lh         $a0, 0x10($v1)
/* BBE6C 800BB26C 8C620014 */  lw         $v0, 0x14($v1)
/* BBE70 800BB270 0040F809 */  jalr       $v0
/* BBE74 800BB274 02042021 */   addu      $a0, $s0, $a0
/* BBE78 800BB278 24030001 */  addiu      $v1, $zero, 1
/* BBE7C 800BB27C 5043000A */  beql       $v0, $v1, .L800BB2A8
/* BBE80 800BB280 86450064 */   lh        $a1, 0x64($s2)
/* BBE84 800BB284 8E030078 */  lw         $v1, 0x78($s0)
/* BBE88 800BB288 84640010 */  lh         $a0, 0x10($v1)
/* BBE8C 800BB28C 8C620014 */  lw         $v0, 0x14($v1)
/* BBE90 800BB290 0040F809 */  jalr       $v0
/* BBE94 800BB294 02042021 */   addu      $a0, $s0, $a0
/* BBE98 800BB298 24030002 */  addiu      $v1, $zero, 2
/* BBE9C 800BB29C 54430006 */  bnel       $v0, $v1, .L800BB2B8
/* BBEA0 800BB2A0 02002021 */   addu      $a0, $s0, $zero
/* BBEA4 800BB2A4 86450064 */  lh         $a1, 0x64($s2)
.L800BB2A8:
/* BBEA8 800BB2A8 86460066 */  lh         $a2, 0x66($s2)
/* BBEAC 800BB2AC 0C02EF52 */  jal        func_800BBD48
/* BBEB0 800BB2B0 02002021 */   addu      $a0, $s0, $zero
/* BBEB4 800BB2B4 02002021 */  addu       $a0, $s0, $zero
.L800BB2B8:
/* BBEB8 800BB2B8 86450060 */  lh         $a1, 0x60($s2)
/* BBEBC 800BB2BC 86460062 */  lh         $a2, 0x62($s2)
/* BBEC0 800BB2C0 86220004 */  lh         $v0, 4($s1)
/* BBEC4 800BB2C4 00D43021 */  addu       $a2, $a2, $s4
/* BBEC8 800BB2C8 0C02DD3F */  jal        set_widget_coords
/* BBECC 800BB2CC 00C23021 */   addu      $a2, $a2, $v0
/* BBED0 800BB2D0 9242005B */  lbu        $v0, 0x5b($s2)
/* BBED4 800BB2D4 8E030078 */  lw         $v1, 0x78($s0)
/* BBED8 800BB2D8 A202005B */  sb         $v0, 0x5b($s0)
/* BBEDC 800BB2DC 84640020 */  lh         $a0, 0x20($v1)
/* BBEE0 800BB2E0 8C620024 */  lw         $v0, 0x24($v1)
/* BBEE4 800BB2E4 0040F809 */  jalr       $v0
/* BBEE8 800BB2E8 02042021 */   addu      $a0, $s0, $a0
/* BBEEC 800BB2EC 26730001 */  addiu      $s3, $s3, 1
/* BBEF0 800BB2F0 92240013 */  lbu        $a0, 0x13($s1)
/* BBEF4 800BB2F4 92230012 */  lbu        $v1, 0x12($s1)
/* BBEF8 800BB2F8 00441021 */  addu       $v0, $v0, $a0
/* BBEFC 800BB2FC 0263182A */  slt        $v1, $s3, $v1
/* BBF00 800BB300 1460FFCC */  bnez       $v1, .L800BB234
/* BBF04 800BB304 0282A021 */   addu      $s4, $s4, $v0
.L800BB308:
/* BBF08 800BB308 92250013 */  lbu        $a1, 0x13($s1)
/* BBF0C 800BB30C 02402021 */  addu       $a0, $s2, $zero
/* BBF10 800BB310 02852823 */  subu       $a1, $s4, $a1
/* BBF14 800BB314 0C02DD46 */  jal        set_widgetWidth
/* BBF18 800BB318 30A5FFFF */   andi      $a1, $a1, 0xffff
/* BBF1C 800BB31C 86240002 */  lh         $a0, 2($s1)
/* BBF20 800BB320 86230006 */  lh         $v1, 6($s1)
/* BBF24 800BB324 96250002 */  lhu        $a1, 2($s1)
/* BBF28 800BB328 0064102A */  slt        $v0, $v1, $a0
/* BBF2C 800BB32C 10400008 */  beqz       $v0, .L800BB350
/* BBF30 800BB330 96260006 */   lhu       $a2, 6($s1)
/* BBF34 800BB334 92220000 */  lbu        $v0, ($s1)
/* BBF38 800BB338 00A21023 */  subu       $v0, $a1, $v0
/* BBF3C 800BB33C A6220002 */  sh         $v0, 2($s1)
/* BBF40 800BB340 00021400 */  sll        $v0, $v0, 0x10
/* BBF44 800BB344 00021403 */  sra        $v0, $v0, 0x10
/* BBF48 800BB348 0802ECDD */  j          .L800BB374
/* BBF4C 800BB34C 0043102A */   slt       $v0, $v0, $v1
.L800BB350:
/* BBF50 800BB350 0083102A */  slt        $v0, $a0, $v1
/* BBF54 800BB354 5040000A */  beql       $v0, $zero, .L800BB380
/* BBF58 800BB358 86240004 */   lh        $a0, 4($s1)
/* BBF5C 800BB35C 92220000 */  lbu        $v0, ($s1)
/* BBF60 800BB360 00A21021 */  addu       $v0, $a1, $v0
/* BBF64 800BB364 A6220002 */  sh         $v0, 2($s1)
/* BBF68 800BB368 00021400 */  sll        $v0, $v0, 0x10
/* BBF6C 800BB36C 00021403 */  sra        $v0, $v0, 0x10
/* BBF70 800BB370 0062102A */  slt        $v0, $v1, $v0
.L800BB374:
/* BBF74 800BB374 54400001 */  bnel       $v0, $zero, .L800BB37C
/* BBF78 800BB378 A6260002 */   sh        $a2, 2($s1)
.L800BB37C:
/* BBF7C 800BB37C 86240004 */  lh         $a0, 4($s1)
.L800BB380:
/* BBF80 800BB380 86230008 */  lh         $v1, 8($s1)
/* BBF84 800BB384 96250004 */  lhu        $a1, 4($s1)
/* BBF88 800BB388 0064102A */  slt        $v0, $v1, $a0
/* BBF8C 800BB38C 10400008 */  beqz       $v0, .L800BB3B0
/* BBF90 800BB390 96260008 */   lhu       $a2, 8($s1)
/* BBF94 800BB394 92220000 */  lbu        $v0, ($s1)
/* BBF98 800BB398 00A21023 */  subu       $v0, $a1, $v0
/* BBF9C 800BB39C A6220004 */  sh         $v0, 4($s1)
/* BBFA0 800BB3A0 00021400 */  sll        $v0, $v0, 0x10
/* BBFA4 800BB3A4 00021403 */  sra        $v0, $v0, 0x10
/* BBFA8 800BB3A8 0802ECF5 */  j          .L800BB3D4
/* BBFAC 800BB3AC 0043102A */   slt       $v0, $v0, $v1
.L800BB3B0:
/* BBFB0 800BB3B0 0083102A */  slt        $v0, $a0, $v1
/* BBFB4 800BB3B4 10400009 */  beqz       $v0, .L800BB3DC
/* BBFB8 800BB3B8 00000000 */   nop
/* BBFBC 800BB3BC 92220000 */  lbu        $v0, ($s1)
/* BBFC0 800BB3C0 00A21021 */  addu       $v0, $a1, $v0
/* BBFC4 800BB3C4 A6220004 */  sh         $v0, 4($s1)
/* BBFC8 800BB3C8 00021400 */  sll        $v0, $v0, 0x10
/* BBFCC 800BB3CC 00021403 */  sra        $v0, $v0, 0x10
/* BBFD0 800BB3D0 0062102A */  slt        $v0, $v1, $v0
.L800BB3D4:
/* BBFD4 800BB3D4 54400001 */  bnel       $v0, $zero, .L800BB3DC
/* BBFD8 800BB3D8 A6260004 */   sh        $a2, 4($s1)
.L800BB3DC:
/* BBFDC 800BB3DC 0C02DE51 */  jal        func_800B7944
/* BBFE0 800BB3E0 02402021 */   addu      $a0, $s2, $zero
/* BBFE4 800BB3E4 8FBF0024 */  lw         $ra, 0x24($sp)
/* BBFE8 800BB3E8 8FB40020 */  lw         $s4, 0x20($sp)
/* BBFEC 800BB3EC 8FB3001C */  lw         $s3, 0x1c($sp)
/* BBFF0 800BB3F0 8FB20018 */  lw         $s2, 0x18($sp)
/* BBFF4 800BB3F4 8FB10014 */  lw         $s1, 0x14($sp)
/* BBFF8 800BB3F8 8FB00010 */  lw         $s0, 0x10($sp)
/* BBFFC 800BB3FC 03E00008 */  jr         $ra
/* BC000 800BB400 27BD0028 */   addiu     $sp, $sp, 0x28

glabel journal_widget_link
/* BC004 800BB404 8C860040 */  lw         $a2, 0x40($a0)
/* BC008 800BB408 90C20012 */  lbu        $v0, 0x12($a2)
/* BC00C 800BB40C 90C30010 */  lbu        $v1, 0x10($a2)
/* BC010 800BB410 0043102B */  sltu       $v0, $v0, $v1
/* BC014 800BB414 10400014 */  beqz       $v0, .L800BB468
/* BC018 800BB418 00000000 */   nop
/* BC01C 800BB41C 94820064 */  lhu        $v0, 0x64($a0)
/* BC020 800BB420 A4A20064 */  sh         $v0, 0x64($a1)
/* BC024 800BB424 94830066 */  lhu        $v1, 0x66($a0)
/* BC028 800BB428 A4A30066 */  sh         $v1, 0x66($a1)
/* BC02C 800BB42C 94820068 */  lhu        $v0, 0x68($a0)
/* BC030 800BB430 A4A20068 */  sh         $v0, 0x68($a1)
/* BC034 800BB434 9483006A */  lhu        $v1, 0x6a($a0)
/* BC038 800BB438 A0A0005B */  sb         $zero, 0x5b($a1)
/* BC03C 800BB43C A4A3006A */  sh         $v1, 0x6a($a1)
/* BC040 800BB440 90C20012 */  lbu        $v0, 0x12($a2)
/* BC044 800BB444 8CC3000C */  lw         $v1, 0xc($a2)
/* BC048 800BB448 00021080 */  sll        $v0, $v0, 2
/* BC04C 800BB44C 00431021 */  addu       $v0, $v0, $v1
/* BC050 800BB450 AC450000 */  sw         $a1, ($v0)
/* BC054 800BB454 90C30012 */  lbu        $v1, 0x12($a2)
/* BC058 800BB458 24020001 */  addiu      $v0, $zero, 1
/* BC05C 800BB45C 24630001 */  addiu      $v1, $v1, 1
/* BC060 800BB460 03E00008 */  jr         $ra
/* BC064 800BB464 A0C30012 */   sb        $v1, 0x12($a2)
.L800BB468:
/* BC068 800BB468 03E00008 */  jr         $ra
/* BC06C 800BB46C 00001021 */   addu      $v0, $zero, $zero

glabel func_800BB470
/* BC070 800BB470 8C870040 */  lw         $a3, 0x40($a0)
/* BC074 800BB474 90E30012 */  lbu        $v1, 0x12($a3)
/* BC078 800BB478 10600011 */  beqz       $v1, .L800BB4C0
/* BC07C 800BB47C 00003021 */   addu      $a2, $zero, $zero
/* BC080 800BB480 8CE8000C */  lw         $t0, 0xc($a3)
/* BC084 800BB484 8D020000 */  lw         $v0, ($t0)
/* BC088 800BB488 1045000A */  beq        $v0, $a1, .L800BB4B4
/* BC08C 800BB48C 00602021 */   addu      $a0, $v1, $zero
/* BC090 800BB490 00804821 */  addu       $t1, $a0, $zero
/* BC094 800BB494 01001821 */  addu       $v1, $t0, $zero
/* BC098 800BB498 24C60001 */  addiu      $a2, $a2, 1
.L800BB49C:
/* BC09C 800BB49C 00C9102A */  slt        $v0, $a2, $t1
/* BC0A0 800BB4A0 10400007 */  beqz       $v0, .L800BB4C0
/* BC0A4 800BB4A4 24630004 */   addiu     $v1, $v1, 4
/* BC0A8 800BB4A8 8C620000 */  lw         $v0, ($v1)
/* BC0AC 800BB4AC 5445FFFB */  bnel       $v0, $a1, .L800BB49C
/* BC0B0 800BB4B0 24C60001 */   addiu     $a2, $a2, 1
.L800BB4B4:
/* BC0B4 800BB4B4 00C4102A */  slt        $v0, $a2, $a0
/* BC0B8 800BB4B8 14400003 */  bnez       $v0, .L800BB4C8
/* BC0BC 800BB4BC 2482FFFF */   addiu     $v0, $a0, -1
.L800BB4C0:
/* BC0C0 800BB4C0 03E00008 */  jr         $ra
/* BC0C4 800BB4C4 00001021 */   addu      $v0, $zero, $zero
.L800BB4C8:
/* BC0C8 800BB4C8 00C2102A */  slt        $v0, $a2, $v0
/* BC0CC 800BB4CC 1040000B */  beqz       $v0, .L800BB4FC
/* BC0D0 800BB4D0 00061080 */   sll       $v0, $a2, 2
/* BC0D4 800BB4D4 8CE3000C */  lw         $v1, 0xc($a3)
/* BC0D8 800BB4D8 00432021 */  addu       $a0, $v0, $v1
.L800BB4DC:
/* BC0DC 800BB4DC 8C830004 */  lw         $v1, 4($a0)
/* BC0E0 800BB4E0 24C60001 */  addiu      $a2, $a2, 1
/* BC0E4 800BB4E4 AC830000 */  sw         $v1, ($a0)
/* BC0E8 800BB4E8 90E20012 */  lbu        $v0, 0x12($a3)
/* BC0EC 800BB4EC 2442FFFF */  addiu      $v0, $v0, -1
/* BC0F0 800BB4F0 00C2102A */  slt        $v0, $a2, $v0
/* BC0F4 800BB4F4 1440FFF9 */  bnez       $v0, .L800BB4DC
/* BC0F8 800BB4F8 24840004 */   addiu     $a0, $a0, 4
.L800BB4FC:
/* BC0FC 800BB4FC 8CE2000C */  lw         $v0, 0xc($a3)
/* BC100 800BB500 00061880 */  sll        $v1, $a2, 2
/* BC104 800BB504 00621821 */  addu       $v1, $v1, $v0
/* BC108 800BB508 AC600000 */  sw         $zero, ($v1)
/* BC10C 800BB50C 90E40012 */  lbu        $a0, 0x12($a3)
/* BC110 800BB510 24020001 */  addiu      $v0, $zero, 1
/* BC114 800BB514 2484FFFF */  addiu      $a0, $a0, -1
/* BC118 800BB518 03E00008 */  jr         $ra
/* BC11C 800BB51C A0E40012 */   sb        $a0, 0x12($a3)

glabel ret11_800bb520
/* BC120 800BB520 03E00008 */  jr         $ra
/* BC124 800BB524 2402000B */   addiu     $v0, $zero, 0xb
/* BC128 800BB528 00000000 */  nop
/* BC12C 800BB52C 00000000 */  nop
