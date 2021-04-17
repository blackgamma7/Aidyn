.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80037D10
/* 38910 80037D10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 38914 80037D14 AFB00010 */  sw         $s0, 0x10($sp)
/* 38918 80037D18 AFBF0014 */  sw         $ra, 0x14($sp)
/* 3891C 80037D1C 0C02E658 */  jal        widget_menu_build
/* 38920 80037D20 00808021 */   addu      $s0, $a0, $zero
/* 38924 80037D24 02001021 */  addu       $v0, $s0, $zero
/* 38928 80037D28 3C03800E */  lui        $v1, %hi(D_800DBA20)
/* 3892C 80037D2C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 38930 80037D30 2463BA20 */  addiu      $v1, $v1, %lo(D_800DBA20)
/* 38934 80037D34 AE030078 */  sw         $v1, 0x78($s0)
/* 38938 80037D38 AE00007C */  sw         $zero, 0x7c($s0)
/* 3893C 80037D3C AE000080 */  sw         $zero, 0x80($s0)
/* 38940 80037D40 AE000084 */  sw         $zero, 0x84($s0)
/* 38944 80037D44 A2000088 */  sb         $zero, 0x88($s0)
/* 38948 80037D48 8FB00010 */  lw         $s0, 0x10($sp)
/* 3894C 80037D4C 03E00008 */  jr         $ra
/* 38950 80037D50 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80037D54
/* 38954 80037D54 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 38958 80037D58 AFBF002C */  sw         $ra, 0x2c($sp)
/* 3895C 80037D5C AFB00028 */  sw         $s0, 0x28($sp)
/* 38960 80037D60 8C820080 */  lw         $v0, 0x80($a0)
/* 38964 80037D64 00008021 */  addu       $s0, $zero, $zero
/* 38968 80037D68 8C460040 */  lw         $a2, 0x40($v0)
/* 3896C 80037D6C 02003821 */  addu       $a3, $s0, $zero
/* 38970 80037D70 94C20020 */  lhu        $v0, 0x20($a2)
/* 38974 80037D74 0202102B */  sltu       $v0, $s0, $v0
/* 38978 80037D78 10400016 */  beqz       $v0, .L80037DD4
/* 3897C 80037D7C 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 38980 80037D80 8CC20018 */  lw         $v0, 0x18($a2)
/* 38984 80037D84 8C480000 */  lw         $t0, ($v0)
/* 38988 80037D88 9503005E */  lhu        $v1, 0x5e($t0)
/* 3898C 80037D8C 14650004 */  bne        $v1, $a1, .L80037DA0
/* 38990 80037D90 00404821 */   addu      $t1, $v0, $zero
/* 38994 80037D94 01008021 */  addu       $s0, $t0, $zero
/* 38998 80037D98 0800DF75 */  j          .L80037DD4
/* 3899C 80037D9C A4C0001E */   sh        $zero, 0x1e($a2)
.L80037DA0:
/* 389A0 80037DA0 24E30001 */  addiu      $v1, $a3, 1
.L80037DA4:
/* 389A4 80037DA4 94C20020 */  lhu        $v0, 0x20($a2)
/* 389A8 80037DA8 3067FFFF */  andi       $a3, $v1, 0xffff
/* 389AC 80037DAC 00E2102B */  sltu       $v0, $a3, $v0
/* 389B0 80037DB0 10400008 */  beqz       $v0, .L80037DD4
/* 389B4 80037DB4 00071080 */   sll       $v0, $a3, 2
/* 389B8 80037DB8 00491021 */  addu       $v0, $v0, $t1
/* 389BC 80037DBC 8C420000 */  lw         $v0, ($v0)
/* 389C0 80037DC0 9443005E */  lhu        $v1, 0x5e($v0)
/* 389C4 80037DC4 1465FFF7 */  bne        $v1, $a1, .L80037DA4
/* 389C8 80037DC8 24E30001 */   addiu     $v1, $a3, 1
/* 389CC 80037DCC 00408021 */  addu       $s0, $v0, $zero
/* 389D0 80037DD0 A4C7001E */  sh         $a3, 0x1e($a2)
.L80037DD4:
/* 389D4 80037DD4 12000012 */  beqz       $s0, .L80037E20
/* 389D8 80037DD8 24050044 */   addiu     $a1, $zero, 0x44
/* 389DC 80037DDC 2406002A */  addiu      $a2, $zero, 0x2a
/* 389E0 80037DE0 24070022 */  addiu      $a3, $zero, 0x22
/* 389E4 80037DE4 240800FF */  addiu      $t0, $zero, 0xff
/* 389E8 80037DE8 24020097 */  addiu      $v0, $zero, 0x97
/* 389EC 80037DEC 8C840080 */  lw         $a0, 0x80($a0)
/* 389F0 80037DF0 2403008D */  addiu      $v1, $zero, 0x8d
/* 389F4 80037DF4 AFA20014 */  sw         $v0, 0x14($sp)
/* 389F8 80037DF8 240200BF */  addiu      $v0, $zero, 0xbf
/* 389FC 80037DFC AFA2001C */  sw         $v0, 0x1c($sp)
/* 38A00 80037E00 24020014 */  addiu      $v0, $zero, 0x14
/* 38A04 80037E04 AFA80010 */  sw         $t0, 0x10($sp)
/* 38A08 80037E08 AFA30018 */  sw         $v1, 0x18($sp)
/* 38A0C 80037E0C AFA80020 */  sw         $t0, 0x20($sp)
/* 38A10 80037E10 0C02F085 */  jal        set_widgetSubstruct8
/* 38A14 80037E14 AFA20024 */   sw        $v0, 0x24($sp)
/* 38A18 80037E18 0800DF98 */  j          .L80037E60
/* 38A1C 80037E1C 02001021 */   addu      $v0, $s0, $zero
.L80037E20:
/* 38A20 80037E20 24050082 */  addiu      $a1, $zero, 0x82
/* 38A24 80037E24 24060050 */  addiu      $a2, $zero, 0x50
/* 38A28 80037E28 24070050 */  addiu      $a3, $zero, 0x50
/* 38A2C 80037E2C 240800FF */  addiu      $t0, $zero, 0xff
/* 38A30 80037E30 24020082 */  addiu      $v0, $zero, 0x82
/* 38A34 80037E34 8C840080 */  lw         $a0, 0x80($a0)
/* 38A38 80037E38 24030050 */  addiu      $v1, $zero, 0x50
/* 38A3C 80037E3C AFA20014 */  sw         $v0, 0x14($sp)
/* 38A40 80037E40 24020001 */  addiu      $v0, $zero, 1
/* 38A44 80037E44 AFA80010 */  sw         $t0, 0x10($sp)
/* 38A48 80037E48 AFA30018 */  sw         $v1, 0x18($sp)
/* 38A4C 80037E4C AFA3001C */  sw         $v1, 0x1c($sp)
/* 38A50 80037E50 AFA80020 */  sw         $t0, 0x20($sp)
/* 38A54 80037E54 0C02F085 */  jal        set_widgetSubstruct8
/* 38A58 80037E58 AFA20024 */   sw        $v0, 0x24($sp)
/* 38A5C 80037E5C 02001021 */  addu       $v0, $s0, $zero
.L80037E60:
/* 38A60 80037E60 8FBF002C */  lw         $ra, 0x2c($sp)
/* 38A64 80037E64 8FB00028 */  lw         $s0, 0x28($sp)
/* 38A68 80037E68 03E00008 */  jr         $ra
/* 38A6C 80037E6C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80037E70
/* 38A70 80037E70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 38A74 80037E74 AFBF0010 */  sw         $ra, 0x10($sp)
/* 38A78 80037E78 8C850080 */  lw         $a1, 0x80($a0)
/* 38A7C 80037E7C 8CA30078 */  lw         $v1, 0x78($a1)
/* 38A80 80037E80 84640058 */  lh         $a0, 0x58($v1)
/* 38A84 80037E84 8C62005C */  lw         $v0, 0x5c($v1)
/* 38A88 80037E88 0040F809 */  jalr       $v0
/* 38A8C 80037E8C 00A42021 */   addu      $a0, $a1, $a0
/* 38A90 80037E90 8FBF0010 */  lw         $ra, 0x10($sp)
/* 38A94 80037E94 03E00008 */  jr         $ra
/* 38A98 80037E98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80037E9C
/* 38A9C 80037E9C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 38AA0 80037EA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 38AA4 80037EA4 8C850080 */  lw         $a1, 0x80($a0)
/* 38AA8 80037EA8 8CA30078 */  lw         $v1, 0x78($a1)
/* 38AAC 80037EAC 84640060 */  lh         $a0, 0x60($v1)
/* 38AB0 80037EB0 8C620064 */  lw         $v0, 0x64($v1)
/* 38AB4 80037EB4 0040F809 */  jalr       $v0
/* 38AB8 80037EB8 00A42021 */   addu      $a0, $a1, $a0
/* 38ABC 80037EBC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 38AC0 80037EC0 03E00008 */  jr         $ra
/* 38AC4 80037EC4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80037EC8
/* 38AC8 80037EC8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 38ACC 80037ECC AFB20020 */  sw         $s2, 0x20($sp)
/* 38AD0 80037ED0 00809021 */  addu       $s2, $a0, $zero
/* 38AD4 80037ED4 AFBF0024 */  sw         $ra, 0x24($sp)
/* 38AD8 80037ED8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 38ADC 80037EDC AFB00018 */  sw         $s0, 0x18($sp)
/* 38AE0 80037EE0 8E440080 */  lw         $a0, 0x80($s2)
/* 38AE4 80037EE4 86450060 */  lh         $a1, 0x60($s2)
/* 38AE8 80037EE8 0C02DD3F */  jal        set_widget_coords
/* 38AEC 80037EEC 86460062 */   lh        $a2, 0x62($s2)
/* 38AF0 80037EF0 8E430080 */  lw         $v1, 0x80($s2)
/* 38AF4 80037EF4 9242005B */  lbu        $v0, 0x5b($s2)
/* 38AF8 80037EF8 92450058 */  lbu        $a1, 0x58($s2)
/* 38AFC 80037EFC 8C680078 */  lw         $t0, 0x78($v1)
/* 38B00 80037F00 92460059 */  lbu        $a2, 0x59($s2)
/* 38B04 80037F04 85040048 */  lh         $a0, 0x48($t0)
/* 38B08 80037F08 AFA20010 */  sw         $v0, 0x10($sp)
/* 38B0C 80037F0C 9247005A */  lbu        $a3, 0x5a($s2)
/* 38B10 80037F10 8D02004C */  lw         $v0, 0x4c($t0)
/* 38B14 80037F14 0040F809 */  jalr       $v0
/* 38B18 80037F18 00642021 */   addu      $a0, $v1, $a0
/* 38B1C 80037F1C 8E440080 */  lw         $a0, 0x80($s2)
/* 38B20 80037F20 96420064 */  lhu        $v0, 0x64($s2)
/* 38B24 80037F24 8E46007C */  lw         $a2, 0x7c($s2)
/* 38B28 80037F28 A4820064 */  sh         $v0, 0x64($a0)
/* 38B2C 80037F2C 96430068 */  lhu        $v1, 0x68($s2)
/* 38B30 80037F30 A4830068 */  sh         $v1, 0x68($a0)
/* 38B34 80037F34 9642006A */  lhu        $v0, 0x6a($s2)
/* 38B38 80037F38 A482006A */  sh         $v0, 0x6a($a0)
/* 38B3C 80037F3C 96430066 */  lhu        $v1, 0x66($s2)
/* 38B40 80037F40 10C00011 */  beqz       $a2, .L80037F88
/* 38B44 80037F44 A4830066 */   sh        $v1, 0x66($a0)
/* 38B48 80037F48 96420064 */  lhu        $v0, 0x64($s2)
/* 38B4C 80037F4C 8CC50078 */  lw         $a1, 0x78($a2)
/* 38B50 80037F50 2442000A */  addiu      $v0, $v0, 0xa
/* 38B54 80037F54 A4C20064 */  sh         $v0, 0x64($a2)
/* 38B58 80037F58 96430066 */  lhu        $v1, 0x66($s2)
/* 38B5C 80037F5C A4C30066 */  sh         $v1, 0x66($a2)
/* 38B60 80037F60 84A40018 */  lh         $a0, 0x18($a1)
/* 38B64 80037F64 8CA2001C */  lw         $v0, 0x1c($a1)
/* 38B68 80037F68 0040F809 */  jalr       $v0
/* 38B6C 80037F6C 00C42021 */   addu      $a0, $a2, $a0
/* 38B70 80037F70 00021042 */  srl        $v0, $v0, 1
/* 38B74 80037F74 2442FFBA */  addiu      $v0, $v0, -0x46
/* 38B78 80037F78 96430060 */  lhu        $v1, 0x60($s2)
/* 38B7C 80037F7C 8E44007C */  lw         $a0, 0x7c($s2)
/* 38B80 80037F80 00621823 */  subu       $v1, $v1, $v0
/* 38B84 80037F84 A4830060 */  sh         $v1, 0x60($a0)
.L80037F88:
/* 38B88 80037F88 8E420084 */  lw         $v0, 0x84($s2)
/* 38B8C 80037F8C 1040001F */  beqz       $v0, .L8003800C
/* 38B90 80037F90 00000000 */   nop
/* 38B94 80037F94 8C430040 */  lw         $v1, 0x40($v0)
/* 38B98 80037F98 8E420080 */  lw         $v0, 0x80($s2)
/* 38B9C 80037F9C 8C700000 */  lw         $s0, ($v1)
/* 38BA0 80037FA0 84450060 */  lh         $a1, 0x60($v0)
/* 38BA4 80037FA4 84460062 */  lh         $a2, 0x62($v0)
/* 38BA8 80037FA8 8C710004 */  lw         $s1, 4($v1)
/* 38BAC 80037FAC 02002021 */  addu       $a0, $s0, $zero
/* 38BB0 80037FB0 24A5000F */  addiu      $a1, $a1, 0xf
/* 38BB4 80037FB4 0C02DD3F */  jal        set_widget_coords
/* 38BB8 80037FB8 24C6FFF3 */   addiu     $a2, $a2, -0xd
/* 38BBC 80037FBC 96420064 */  lhu        $v0, 0x64($s2)
/* 38BC0 80037FC0 8E430080 */  lw         $v1, 0x80($s2)
/* 38BC4 80037FC4 A6020064 */  sh         $v0, 0x64($s0)
/* 38BC8 80037FC8 96440066 */  lhu        $a0, 0x66($s2)
/* 38BCC 80037FCC A6040066 */  sh         $a0, 0x66($s0)
/* 38BD0 80037FD0 02202021 */  addu       $a0, $s1, $zero
/* 38BD4 80037FD4 94620066 */  lhu        $v0, 0x66($v1)
/* 38BD8 80037FD8 94650064 */  lhu        $a1, 0x64($v1)
/* 38BDC 80037FDC 84660062 */  lh         $a2, 0x62($v1)
/* 38BE0 80037FE0 00451023 */  subu       $v0, $v0, $a1
/* 38BE4 80037FE4 3042FFFF */  andi       $v0, $v0, 0xffff
/* 38BE8 80037FE8 84650060 */  lh         $a1, 0x60($v1)
/* 38BEC 80037FEC 24C6FFF3 */  addiu      $a2, $a2, -0xd
/* 38BF0 80037FF0 00A22821 */  addu       $a1, $a1, $v0
/* 38BF4 80037FF4 0C02DD3F */  jal        set_widget_coords
/* 38BF8 80037FF8 24A5FFF1 */   addiu     $a1, $a1, -0xf
/* 38BFC 80037FFC 96420064 */  lhu        $v0, 0x64($s2)
/* 38C00 80038000 A6220064 */  sh         $v0, 0x64($s1)
/* 38C04 80038004 96430066 */  lhu        $v1, 0x66($s2)
/* 38C08 80038008 A6230066 */  sh         $v1, 0x66($s1)
.L8003800C:
/* 38C0C 8003800C 0C02DE51 */  jal        func_800B7944
/* 38C10 80038010 02402021 */   addu      $a0, $s2, $zero
/* 38C14 80038014 8FBF0024 */  lw         $ra, 0x24($sp)
/* 38C18 80038018 8FB20020 */  lw         $s2, 0x20($sp)
/* 38C1C 8003801C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 38C20 80038020 8FB00018 */  lw         $s0, 0x18($sp)
/* 38C24 80038024 03E00008 */  jr         $ra
/* 38C28 80038028 27BD0028 */   addiu     $sp, $sp, 0x28

glabel make_upDown_arrows
/* 38C2C 8003802C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 38C30 80038030 AFB20020 */  sw         $s2, 0x20($sp)
/* 38C34 80038034 00809021 */  addu       $s2, $a0, $zero
/* 38C38 80038038 AFBF0024 */  sw         $ra, 0x24($sp)
/* 38C3C 8003803C AFB1001C */  sw         $s1, 0x1c($sp)
/* 38C40 80038040 AFB00018 */  sw         $s0, 0x18($sp)
/* 38C44 80038044 8E420080 */  lw         $v0, 0x80($s2)
/* 38C48 80038048 1040002E */  beqz       $v0, .L80038104
/* 38C4C 8003804C 8FBF0024 */   lw        $ra, 0x24($sp)
/* 38C50 80038050 0C026259 */  jal        passToMalloc
/* 38C54 80038054 2404007C */   addiu     $a0, $zero, 0x7c
/* 38C58 80038058 240438D0 */  addiu      $a0, $zero, 0x38d0
/* 38C5C 8003805C 0C0290E2 */  jal        get_borg_8
/* 38C60 80038060 00408021 */   addu      $s0, $v0, $zero
/* 38C64 80038064 02002021 */  addu       $a0, $s0, $zero
/* 38C68 80038068 0C02E518 */  jal        borg8_widget
/* 38C6C 8003806C 00402821 */   addu      $a1, $v0, $zero
/* 38C70 80038070 2404007C */  addiu      $a0, $zero, 0x7c
/* 38C74 80038074 0C026259 */  jal        passToMalloc
/* 38C78 80038078 00408821 */   addu      $s1, $v0, $zero
/* 38C7C 8003807C 240438CF */  addiu      $a0, $zero, 0x38cf
/* 38C80 80038080 0C0290E2 */  jal        get_borg_8
/* 38C84 80038084 00408021 */   addu      $s0, $v0, $zero
/* 38C88 80038088 02002021 */  addu       $a0, $s0, $zero
/* 38C8C 8003808C 0C02E518 */  jal        borg8_widget
/* 38C90 80038090 00402821 */   addu      $a1, $v0, $zero
/* 38C94 80038094 24040080 */  addiu      $a0, $zero, 0x80
/* 38C98 80038098 0C026259 */  jal        passToMalloc
/* 38C9C 8003809C 00408021 */   addu      $s0, $v0, $zero
/* 38CA0 800380A0 00402021 */  addu       $a0, $v0, $zero
/* 38CA4 800380A4 02203021 */  addu       $a2, $s1, $zero
/* 38CA8 800380A8 8E450080 */  lw         $a1, 0x80($s2)
/* 38CAC 800380AC 02003821 */  addu       $a3, $s0, $zero
/* 38CB0 800380B0 0C02ED4C */  jal        func_800BB530
/* 38CB4 800380B4 AFA00010 */   sw        $zero, 0x10($sp)
/* 38CB8 800380B8 240500FF */  addiu      $a1, $zero, 0xff
/* 38CBC 800380BC 240600FF */  addiu      $a2, $zero, 0xff
/* 38CC0 800380C0 8C490078 */  lw         $t1, 0x78($v0)
/* 38CC4 800380C4 240700FF */  addiu      $a3, $zero, 0xff
/* 38CC8 800380C8 AE420084 */  sw         $v0, 0x84($s2)
/* 38CCC 800380CC 85240048 */  lh         $a0, 0x48($t1)
/* 38CD0 800380D0 240300FF */  addiu      $v1, $zero, 0xff
/* 38CD4 800380D4 AFA30010 */  sw         $v1, 0x10($sp)
/* 38CD8 800380D8 8D28004C */  lw         $t0, 0x4c($t1)
/* 38CDC 800380DC 0100F809 */  jalr       $t0
/* 38CE0 800380E0 00442021 */   addu      $a0, $v0, $a0
/* 38CE4 800380E4 8E460080 */  lw         $a2, 0x80($s2)
/* 38CE8 800380E8 8CC30078 */  lw         $v1, 0x78($a2)
/* 38CEC 800380EC 8E450084 */  lw         $a1, 0x84($s2)
/* 38CF0 800380F0 84640030 */  lh         $a0, 0x30($v1)
/* 38CF4 800380F4 8C620034 */  lw         $v0, 0x34($v1)
/* 38CF8 800380F8 0040F809 */  jalr       $v0
/* 38CFC 800380FC 00C42021 */   addu      $a0, $a2, $a0
/* 38D00 80038100 8FBF0024 */  lw         $ra, 0x24($sp)
.L80038104:
/* 38D04 80038104 8FB20020 */  lw         $s2, 0x20($sp)
/* 38D08 80038108 8FB1001C */  lw         $s1, 0x1c($sp)
/* 38D0C 8003810C 8FB00018 */  lw         $s0, 0x18($sp)
/* 38D10 80038110 03E00008 */  jr         $ra
/* 38D14 80038114 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80038118
/* 38D18 80038118 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 38D1C 8003811C AFBF0010 */  sw         $ra, 0x10($sp)
/* 38D20 80038120 0C02E66C */  jal        widget_menu_free
/* 38D24 80038124 00000000 */   nop
/* 38D28 80038128 8FBF0010 */  lw         $ra, 0x10($sp)
/* 38D2C 8003812C 03E00008 */  jr         $ra
/* 38D30 80038130 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret12_80038134
/* 38D34 80038134 03E00008 */  jr         $ra
/* 38D38 80038138 2402000C */   addiu     $v0, $zero, 0xc
/* 38D3C 8003813C 00000000 */  nop
