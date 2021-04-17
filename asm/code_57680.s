.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel CreateScriptCamera
/* 57680 80056A80 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 57684 80056A84 00041C00 */  sll        $v1, $a0, 0x10
/* 57688 80056A88 3C02800E */  lui        $v0, %hi(ScriptCamera)
/* 5768C 80056A8C AFB3001C */  sw         $s3, 0x1c($sp)
/* 57690 80056A90 24537EB0 */  addiu      $s3, $v0, %lo(ScriptCamera)
/* 57694 80056A94 02602021 */  addu       $a0, $s3, $zero
/* 57698 80056A98 AFB10014 */  sw         $s1, 0x14($sp)
/* 5769C 80056A9C 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 576A0 80056AA0 F7B40028 */  sdc1       $f20, 0x28($sp)
/* 576A4 80056AA4 C7B40040 */  lwc1       $f20, 0x40($sp)
/* 576A8 80056AA8 00032C03 */  sra        $a1, $v1, 0x10
/* 576AC 80056AAC AFB20018 */  sw         $s2, 0x18($sp)
/* 576B0 80056AB0 00C09021 */  addu       $s2, $a2, $zero
/* 576B4 80056AB4 AFB00010 */  sw         $s0, 0x10($sp)
/* 576B8 80056AB8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 576BC 80056ABC 0C006A0E */  jal        AllocScriptCamera
/* 576C0 80056AC0 30F0FFFF */   andi      $s0, $a3, 0xffff
/* 576C4 80056AC4 00402021 */  addu       $a0, $v0, $zero
/* 576C8 80056AC8 9483003A */  lhu        $v1, 0x3a($a0)
/* 576CC 80056ACC 264200A4 */  addiu      $v0, $s2, 0xa4
/* 576D0 80056AD0 AC820008 */  sw         $v0, 8($a0)
/* 576D4 80056AD4 24020002 */  addiu      $v0, $zero, 2
/* 576D8 80056AD8 A4910038 */  sh         $s1, 0x38($a0)
/* 576DC 80056ADC A4820006 */  sh         $v0, 6($a0)
/* 576E0 80056AE0 02038025 */  or         $s0, $s0, $v1
/* 576E4 80056AE4 A490003A */  sh         $s0, 0x3a($a0)
/* 576E8 80056AE8 16200002 */  bnez       $s1, .L80056AF4
/* 576EC 80056AEC E494000C */   swc1      $f20, 0xc($a0)
/* 576F0 80056AF0 A4800038 */  sh         $zero, 0x38($a0)
.L80056AF4:
/* 576F4 80056AF4 2662E9F8 */  addiu      $v0, $s3, -0x1608
/* 576F8 80056AF8 94431622 */  lhu        $v1, 0x1622($v0)
/* 576FC 80056AFC 94441620 */  lhu        $a0, 0x1620($v0)
/* 57700 80056B00 24630001 */  addiu      $v1, $v1, 1
/* 57704 80056B04 24840001 */  addiu      $a0, $a0, 1
/* 57708 80056B08 A4431622 */  sh         $v1, 0x1622($v0)
/* 5770C 80056B0C 16400006 */  bnez       $s2, .L80056B28
/* 57710 80056B10 A4441620 */   sh        $a0, 0x1620($v0)
/* 57714 80056B14 3C04800E */  lui        $a0, %hi(D_800DE7B0)
/* 57718 80056B18 2484E7B0 */  addiu      $a0, $a0, %lo(D_800DE7B0)
/* 5771C 80056B1C 3C05800E */  lui        $a1, %hi(D_800DE7E0)
/* 57720 80056B20 0C025F2D */  jal        manualCrash
/* 57724 80056B24 24A5E7E0 */   addiu     $a1, $a1, %lo(D_800DE7E0)
.L80056B28:
/* 57728 80056B28 0C006744 */  jal        GiveCameraToPlayer
/* 5772C 80056B2C 02402021 */   addu      $a0, $s2, $zero
/* 57730 80056B30 8FBF0020 */  lw         $ra, 0x20($sp)
/* 57734 80056B34 8FB3001C */  lw         $s3, 0x1c($sp)
/* 57738 80056B38 8FB20018 */  lw         $s2, 0x18($sp)
/* 5773C 80056B3C 8FB10014 */  lw         $s1, 0x14($sp)
/* 57740 80056B40 8FB00010 */  lw         $s0, 0x10($sp)
/* 57744 80056B44 D7B40028 */  ldc1       $f20, 0x28($sp)
/* 57748 80056B48 03E00008 */  jr         $ra
/* 5774C 80056B4C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80056B50
/* 57750 80056B50 00003821 */  addu       $a3, $zero, $zero
/* 57754 80056B54 90A20013 */  lbu        $v0, 0x13($a1)
/* 57758 80056B58 1040000E */  beqz       $v0, .L80056B94
/* 5775C 80056B5C 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 57760 80056B60 00404021 */  addu       $t0, $v0, $zero
/* 57764 80056B64 000728C0 */  sll        $a1, $a3, 3
.L80056B68:
/* 57768 80056B68 00851021 */  addu       $v0, $a0, $a1
/* 5776C 80056B6C 94430074 */  lhu        $v1, 0x74($v0)
/* 57770 80056B70 54660004 */  bnel       $v1, $a2, .L80056B84
/* 57774 80056B74 24E20001 */   addiu     $v0, $a3, 1
/* 57778 80056B78 24A20070 */  addiu      $v0, $a1, 0x70
/* 5777C 80056B7C 03E00008 */  jr         $ra
/* 57780 80056B80 00821021 */   addu      $v0, $a0, $v0
.L80056B84:
/* 57784 80056B84 304700FF */  andi       $a3, $v0, 0xff
/* 57788 80056B88 00E8182B */  sltu       $v1, $a3, $t0
/* 5778C 80056B8C 1460FFF6 */  bnez       $v1, .L80056B68
/* 57790 80056B90 000728C0 */   sll       $a1, $a3, 3
.L80056B94:
/* 57794 80056B94 03E00008 */  jr         $ra
/* 57798 80056B98 00001021 */   addu      $v0, $zero, $zero

glabel func_80056B9C
/* 5779C 80056B9C 3084FFFF */  andi       $a0, $a0, 0xffff
/* 577A0 80056BA0 3C02800E */  lui        $v0, %hi(partyPointer)
/* 577A4 80056BA4 8C467EA0 */  lw         $a2, %lo(partyPointer)($v0)
/* 577A8 80056BA8 00002821 */  addu       $a1, $zero, $zero
/* 577AC 80056BAC 00051080 */  sll        $v0, $a1, 2
.L80056BB0:
/* 577B0 80056BB0 00C21021 */  addu       $v0, $a2, $v0
/* 577B4 80056BB4 8C430000 */  lw         $v1, ($v0)
/* 577B8 80056BB8 10600008 */  beqz       $v1, .L80056BDC
/* 577BC 80056BBC 2CA20004 */   sltiu     $v0, $a1, 4
/* 577C0 80056BC0 94620000 */  lhu        $v0, ($v1)
/* 577C4 80056BC4 14440003 */  bne        $v0, $a0, .L80056BD4
/* 577C8 80056BC8 24A20001 */   addiu     $v0, $a1, 1
/* 577CC 80056BCC 03E00008 */  jr         $ra
/* 577D0 80056BD0 00601021 */   addu      $v0, $v1, $zero
.L80056BD4:
/* 577D4 80056BD4 3045FFFF */  andi       $a1, $v0, 0xffff
/* 577D8 80056BD8 2CA20004 */  sltiu      $v0, $a1, 4
.L80056BDC:
/* 577DC 80056BDC 1440FFF4 */  bnez       $v0, .L80056BB0
/* 577E0 80056BE0 00051080 */   sll       $v0, $a1, 2
/* 577E4 80056BE4 03E00008 */  jr         $ra
/* 577E8 80056BE8 00001021 */   addu      $v0, $zero, $zero

glabel func_80056BEC
/* 577EC 80056BEC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 577F0 80056BF0 AFB20018 */  sw         $s2, 0x18($sp)
/* 577F4 80056BF4 00A09021 */  addu       $s2, $a1, $zero
/* 577F8 80056BF8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 577FC 80056BFC AFB3001C */  sw         $s3, 0x1c($sp)
/* 57800 80056C00 AFB10014 */  sw         $s1, 0x14($sp)
/* 57804 80056C04 AFB00010 */  sw         $s0, 0x10($sp)
/* 57808 80056C08 92420013 */  lbu        $v0, 0x13($s2)
/* 5780C 80056C0C 10400010 */  beqz       $v0, .L80056C50
/* 57810 80056C10 00008821 */   addu      $s1, $zero, $zero
/* 57814 80056C14 24930070 */  addiu      $s3, $a0, 0x70
/* 57818 80056C18 001110C0 */  sll        $v0, $s1, 3
.L80056C1C:
/* 5781C 80056C1C 02628021 */  addu       $s0, $s3, $v0
/* 57820 80056C20 8E040000 */  lw         $a0, ($s0)
/* 57824 80056C24 10800005 */  beqz       $a0, .L80056C3C
/* 57828 80056C28 26230001 */   addiu     $v1, $s1, 1
/* 5782C 80056C2C 0C0060EF */  jal        FreePlayer
/* 57830 80056C30 00000000 */   nop
/* 57834 80056C34 AE000000 */  sw         $zero, ($s0)
/* 57838 80056C38 26230001 */  addiu      $v1, $s1, 1
.L80056C3C:
/* 5783C 80056C3C 92420013 */  lbu        $v0, 0x13($s2)
/* 57840 80056C40 3071FFFF */  andi       $s1, $v1, 0xffff
/* 57844 80056C44 0222102B */  sltu       $v0, $s1, $v0
/* 57848 80056C48 1440FFF4 */  bnez       $v0, .L80056C1C
/* 5784C 80056C4C 001110C0 */   sll       $v0, $s1, 3
.L80056C50:
/* 57850 80056C50 92450014 */  lbu        $a1, 0x14($s2)
/* 57854 80056C54 10A00004 */  beqz       $a1, .L80056C68
/* 57858 80056C58 24020003 */   addiu     $v0, $zero, 3
/* 5785C 80056C5C 10A20002 */  beq        $a1, $v0, .L80056C68
/* 57860 80056C60 3C02800E */   lui       $v0, %hi(PlayerCharStruct)
/* 57864 80056C64 AC406950 */  sw         $zero, %lo(PlayerCharStruct)($v0)
.L80056C68:
/* 57868 80056C68 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5786C 80056C6C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 57870 80056C70 8FB20018 */  lw         $s2, 0x18($sp)
/* 57874 80056C74 8FB10014 */  lw         $s1, 0x14($sp)
/* 57878 80056C78 8FB00010 */  lw         $s0, 0x10($sp)
/* 5787C 80056C7C 03E00008 */  jr         $ra
/* 57880 80056C80 27BD0028 */   addiu     $sp, $sp, 0x28

glabel dialougPreCallback
/* 57884 80056C84 27BDFE30 */  addiu      $sp, $sp, -0x1d0
/* 57888 80056C88 AFB501B4 */  sw         $s5, 0x1b4($sp)
/* 5788C 80056C8C 0000A821 */  addu       $s5, $zero, $zero
/* 57890 80056C90 AFB301AC */  sw         $s3, 0x1ac($sp)
/* 57894 80056C94 00009821 */  addu       $s3, $zero, $zero
/* 57898 80056C98 AFB001A0 */  sw         $s0, 0x1a0($sp)
/* 5789C 80056C9C 00008021 */  addu       $s0, $zero, $zero
/* 578A0 80056CA0 3C02800E */  lui        $v0, 0x800e
/* 578A4 80056CA4 AFB201A8 */  sw         $s2, 0x1a8($sp)
/* 578A8 80056CA8 30D2FFFF */  andi       $s2, $a2, 0xffff
/* 578AC 80056CAC AFB401B0 */  sw         $s4, 0x1b0($sp)
/* 578B0 80056CB0 30F4FFFF */  andi       $s4, $a3, 0xffff
/* 578B4 80056CB4 AFBF01C4 */  sw         $ra, 0x1c4($sp)
/* 578B8 80056CB8 AFBE01C0 */  sw         $fp, 0x1c0($sp)
/* 578BC 80056CBC AFB701BC */  sw         $s7, 0x1bc($sp)
/* 578C0 80056CC0 AFB601B8 */  sw         $s6, 0x1b8($sp)
/* 578C4 80056CC4 AFB101A4 */  sw         $s1, 0x1a4($sp)
/* 578C8 80056CC8 F7B401C8 */  sdc1       $f20, 0x1c8($sp)
/* 578CC 80056CCC AFA00198 */  sw         $zero, 0x198($sp)
/* 578D0 80056CD0 244AE7F4 */  addiu      $t2, $v0, -0x180c
/* 578D4 80056CD4 89430000 */  lwl        $v1, ($t2)
/* 578D8 80056CD8 99430003 */  lwr        $v1, 3($t2)
/* 578DC 80056CDC 81480004 */  lb         $t0, 4($t2)
/* 578E0 80056CE0 81490005 */  lb         $t1, 5($t2)
/* 578E4 80056CE4 ABA30018 */  swl        $v1, 0x18($sp)
/* 578E8 80056CE8 BBA3001B */  swr        $v1, 0x1b($sp)
/* 578EC 80056CEC A3A8001C */  sb         $t0, 0x1c($sp)
/* 578F0 80056CF0 A3A9001D */  sb         $t1, 0x1d($sp)
/* 578F4 80056CF4 AFA401D0 */  sw         $a0, 0x1d0($sp)
/* 578F8 80056CF8 27A40018 */  addiu      $a0, $sp, 0x18
/* 578FC 80056CFC 240300FF */  addiu      $v1, $zero, 0xff
/* 57900 80056D00 4480A000 */  mtc1       $zero, $f20
/* 57904 80056D04 27BE0058 */  addiu      $fp, $sp, 0x58
/* 57908 80056D08 AFA501D4 */  sw         $a1, 0x1d4($sp)
/* 5790C 80056D0C 8FA501D0 */  lw         $a1, 0x1d0($sp)
/* 57910 80056D10 93A20018 */  lbu        $v0, 0x18($sp)
/* 57914 80056D14 1043000F */  beq        $v0, $v1, .L80056D54
/* 57918 80056D18 94B60108 */   lhu       $s6, 0x108($a1)
/* 5791C 80056D1C 241700FF */  addiu      $s7, $zero, 0xff
/* 57920 80056D20 00808821 */  addu       $s1, $a0, $zero
/* 57924 80056D24 02301021 */  addu       $v0, $s1, $s0
.L80056D28:
/* 57928 80056D28 90430000 */  lbu        $v1, ($v0)
/* 5792C 80056D2C 14720004 */  bne        $v1, $s2, .L80056D40
/* 57930 80056D30 26020001 */   addiu     $v0, $s0, 1
/* 57934 80056D34 0C0062E1 */  jal        func_80018B84
/* 57938 80056D38 00000000 */   nop
/* 5793C 80056D3C 26020001 */  addiu      $v0, $s0, 1
.L80056D40:
/* 57940 80056D40 3050FFFF */  andi       $s0, $v0, 0xffff
/* 57944 80056D44 02301821 */  addu       $v1, $s1, $s0
/* 57948 80056D48 90620000 */  lbu        $v0, ($v1)
/* 5794C 80056D4C 1457FFF6 */  bne        $v0, $s7, .L80056D28
/* 57950 80056D50 02301021 */   addu      $v0, $s1, $s0
.L80056D54:
/* 57954 80056D54 00003821 */  addu       $a3, $zero, $zero
/* 57958 80056D58 00003021 */  addu       $a2, $zero, $zero
/* 5795C 80056D5C 3C02800E */  lui        $v0, %hi(D_800DE7FC)
/* 57960 80056D60 2443E7FC */  addiu      $v1, $v0, %lo(D_800DE7FC)
/* 57964 80056D64 88680000 */  lwl        $t0, ($v1)
/* 57968 80056D68 98680003 */  lwr        $t0, 3($v1)
/* 5796C 80056D6C 80690004 */  lb         $t1, 4($v1)
/* 57970 80056D70 806A0005 */  lb         $t2, 5($v1)
/* 57974 80056D74 ABA80058 */  swl        $t0, 0x58($sp)
/* 57978 80056D78 BBA8005B */  swr        $t0, 0x5b($sp)
/* 5797C 80056D7C A3A9005C */  sb         $t1, 0x5c($sp)
/* 57980 80056D80 A3AA005D */  sb         $t2, 0x5d($sp)
/* 57984 80056D84 240300FF */  addiu      $v1, $zero, 0xff
/* 57988 80056D88 93A20058 */  lbu        $v0, 0x58($sp)
/* 5798C 80056D8C 2644FFFC */  addiu      $a0, $s2, -4
/* 57990 80056D90 1043003C */  beq        $v0, $v1, .L80056E84
/* 57994 80056D94 AFA4019C */   sw        $a0, 0x19c($sp)
/* 57998 80056D98 03C02821 */  addu       $a1, $fp, $zero
/* 5799C 80056D9C 3C11800E */  lui        $s1, 0x800e
/* 579A0 80056DA0 3C17800E */  lui        $s7, 0x800e
/* 579A4 80056DA4 00A68021 */  addu       $s0, $a1, $a2
.L80056DA8:
/* 579A8 80056DA8 92020000 */  lbu        $v0, ($s0)
/* 579AC 80056DAC 1452002F */  bne        $v0, $s2, .L80056E6C
/* 579B0 80056DB0 24C20001 */   addiu     $v0, $a2, 1
/* 579B4 80056DB4 8FA401D0 */  lw         $a0, 0x1d0($sp)
/* 579B8 80056DB8 8FA501D4 */  lw         $a1, 0x1d4($sp)
/* 579BC 80056DBC 0C015AD4 */  jal        func_80056B50
/* 579C0 80056DC0 02803021 */   addu      $a2, $s4, $zero
/* 579C4 80056DC4 0040A821 */  addu       $s5, $v0, $zero
/* 579C8 80056DC8 56A00001 */  bnel       $s5, $zero, .L80056DD0
/* 579CC 80056DCC 8EB30000 */   lw        $s3, ($s5)
.L80056DD0:
/* 579D0 80056DD0 56600005 */  bnel       $s3, $zero, .L80056DE8
/* 579D4 80056DD4 3C05800F */   lui       $a1, 0x800f
/* 579D8 80056DD8 2624E804 */  addiu      $a0, $s1, -0x17fc
/* 579DC 80056DDC 0C025F2D */  jal        manualCrash
/* 579E0 80056DE0 26E5E7E0 */   addiu     $a1, $s7, -0x1820
/* 579E4 80056DE4 3C05800F */  lui        $a1, %hi(EntityPointer)
.L80056DE8:
/* 579E8 80056DE8 8CA413A0 */  lw         $a0, %lo(EntityPointer)($a1)
/* 579EC 80056DEC 0C01D650 */  jal        sub_ent_2float_sum
/* 579F0 80056DF0 96A50004 */   lhu       $a1, 4($s5)
/* 579F4 80056DF4 3C05BE19 */  lui        $a1, 0xbe19
/* 579F8 80056DF8 34A5999A */  ori        $a1, $a1, 0x999a
/* 579FC 80056DFC C6620034 */  lwc1       $f2, 0x34($s3)
/* 57A00 80056E00 8E620020 */  lw         $v0, 0x20($s3)
/* 57A04 80056E04 27A40098 */  addiu      $a0, $sp, 0x98
/* 57A08 80056E08 AFA20098 */  sw         $v0, 0x98($sp)
/* 57A0C 80056E0C 8E630024 */  lw         $v1, 0x24($s3)
/* 57A10 80056E10 46020501 */  sub.s      $f20, $f0, $f2
/* 57A14 80056E14 0C02AD34 */  jal        multiVec2
/* 57A18 80056E18 AFA3009C */   sw        $v1, 0x9c($sp)
/* 57A1C 80056E1C C7A20098 */  lwc1       $f2, 0x98($sp)
/* 57A20 80056E20 C6600068 */  lwc1       $f0, 0x68($s3)
/* 57A24 80056E24 C7A4009C */  lwc1       $f4, 0x9c($sp)
/* 57A28 80056E28 46001080 */  add.s      $f2, $f2, $f0
/* 57A2C 80056E2C C6600070 */  lwc1       $f0, 0x70($s3)
/* 57A30 80056E30 46002100 */  add.s      $f4, $f4, $f0
/* 57A34 80056E34 8E66006C */  lw         $a2, 0x6c($s3)
/* 57A38 80056E38 44051000 */  mfc1       $a1, $f2
/* 57A3C 80056E3C 44072000 */  mfc1       $a3, $f4
/* 57A40 80056E40 0C02AD58 */  jal        setVec3
/* 57A44 80056E44 266400A4 */   addiu     $a0, $s3, 0xa4
/* 57A48 80056E48 92030000 */  lbu        $v1, ($s0)
/* 57A4C 80056E4C 24020005 */  addiu      $v0, $zero, 5
/* 57A50 80056E50 1462000C */  bne        $v1, $v0, .L80056E84
/* 57A54 80056E54 24070001 */   addiu     $a3, $zero, 1
/* 57A58 80056E58 02602021 */  addu       $a0, $s3, $zero
/* 57A5C 80056E5C 0C0061C7 */  jal        playerdata_set_flags
/* 57A60 80056E60 24052000 */   addiu     $a1, $zero, 0x2000
/* 57A64 80056E64 08015BA1 */  j          .L80056E84
/* 57A68 80056E68 24070001 */   addiu     $a3, $zero, 1
.L80056E6C:
/* 57A6C 80056E6C 3046FFFF */  andi       $a2, $v0, 0xffff
/* 57A70 80056E70 00A61821 */  addu       $v1, $a1, $a2
/* 57A74 80056E74 90640000 */  lbu        $a0, ($v1)
/* 57A78 80056E78 240200FF */  addiu      $v0, $zero, 0xff
/* 57A7C 80056E7C 1482FFCA */  bne        $a0, $v0, .L80056DA8
/* 57A80 80056E80 00A68021 */   addu      $s0, $a1, $a2
.L80056E84:
/* 57A84 80056E84 14E0000B */  bnez       $a3, .L80056EB4
/* 57A88 80056E88 8FA401D0 */   lw        $a0, 0x1d0($sp)
/* 57A8C 80056E8C 8FA501D4 */  lw         $a1, 0x1d4($sp)
/* 57A90 80056E90 0C015AD4 */  jal        func_80056B50
/* 57A94 80056E94 9486010A */   lhu       $a2, 0x10a($a0)
/* 57A98 80056E98 0040A821 */  addu       $s5, $v0, $zero
/* 57A9C 80056E9C 56A00001 */  bnel       $s5, $zero, .L80056EA4
/* 57AA0 80056EA0 8EB30000 */   lw        $s3, ($s5)
.L80056EA4:
/* 57AA4 80056EA4 12600003 */  beqz       $s3, .L80056EB4
/* 57AA8 80056EA8 26640068 */   addiu     $a0, $s3, 0x68
/* 57AAC 80056EAC 0C02AD17 */  jal        copyVec3
/* 57AB0 80056EB0 266500A4 */   addiu     $a1, $s3, 0xa4
.L80056EB4:
/* 57AB4 80056EB4 12800005 */  beqz       $s4, .L80056ECC
/* 57AB8 80056EB8 3C02800E */   lui       $v0, %hi(borg_9_dat_pointer)
/* 57ABC 80056EBC 8C446AA8 */  lw         $a0, %lo(borg_9_dat_pointer)($v0)
/* 57AC0 80056EC0 0C003A6B */  jal        get_map_referencepoint
/* 57AC4 80056EC4 02802821 */   addu      $a1, $s4, $zero
/* 57AC8 80056EC8 AFA20198 */  sw         $v0, 0x198($sp)
.L80056ECC:
/* 57ACC 80056ECC 8FA8019C */  lw         $t0, 0x19c($sp)
/* 57AD0 80056ED0 2D02000F */  sltiu      $v0, $t0, 0xf
/* 57AD4 80056ED4 104000A3 */  beqz       $v0, .L80057164
/* 57AD8 80056ED8 3C02800E */   lui       $v0, %hi(D_800DE888)
/* 57ADC 80056EDC 2442E888 */  addiu      $v0, $v0, %lo(D_800DE888)
/* 57AE0 80056EE0 00081880 */  sll        $v1, $t0, 2
/* 57AE4 80056EE4 00621821 */  addu       $v1, $v1, $v0
/* 57AE8 80056EE8 8C640000 */  lw         $a0, ($v1)
/* 57AEC 80056EEC 00800008 */  jr         $a0
/* 57AF0 80056EF0 00000000 */   nop
/* 57AF4 80056EF4 27B200D8 */  addiu      $s2, $sp, 0xd8
/* 57AF8 80056EF8 8E650068 */  lw         $a1, 0x68($s3)
/* 57AFC 80056EFC 8E660070 */  lw         $a2, 0x70($s3)
/* 57B00 80056F00 0C02AD55 */  jal        setVec2
/* 57B04 80056F04 02402021 */   addu      $a0, $s2, $zero
/* 57B08 80056F08 8FA90198 */  lw         $t1, 0x198($sp)
/* 57B0C 80056F0C 27B10118 */  addiu      $s1, $sp, 0x118
/* 57B10 80056F10 8D250000 */  lw         $a1, ($t1)
/* 57B14 80056F14 8D260008 */  lw         $a2, 8($t1)
/* 57B18 80056F18 0C02AD55 */  jal        setVec2
/* 57B1C 80056F1C 02202021 */   addu      $a0, $s1, $zero
/* 57B20 80056F20 27B00158 */  addiu      $s0, $sp, 0x158
/* 57B24 80056F24 02002021 */  addu       $a0, $s0, $zero
/* 57B28 80056F28 02402821 */  addu       $a1, $s2, $zero
/* 57B2C 80056F2C 0C02AB1D */  jal        Vec2_Sub
/* 57B30 80056F30 02203021 */   addu      $a2, $s1, $zero
/* 57B34 80056F34 0C02AB9F */  jal        vec2_normalize
/* 57B38 80056F38 02002021 */   addu      $a0, $s0, $zero
/* 57B3C 80056F3C 8FA50158 */  lw         $a1, 0x158($sp)
/* 57B40 80056F40 8FA6015C */  lw         $a2, 0x15c($sp)
/* 57B44 80056F44 0C0065FC */  jal        playerdata_set_facing
/* 57B48 80056F48 02602021 */   addu      $a0, $s3, $zero
/* 57B4C 80056F4C 08015C5A */  j          .L80057168
/* 57B50 80056F50 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57B54 80056F54 16A00007 */  bnez       $s5, .L80056F74
/* 57B58 80056F58 8FAA0198 */   lw        $t2, 0x198($sp)
/* 57B5C 80056F5C 3C04800E */  lui        $a0, %hi(D_800DE828)
/* 57B60 80056F60 2484E828 */  addiu      $a0, $a0, %lo(D_800DE828)
/* 57B64 80056F64 3C05800E */  lui        $a1, %hi(D_800DE7E0)
/* 57B68 80056F68 0C025F2D */  jal        manualCrash
/* 57B6C 80056F6C 24A5E7E0 */   addiu     $a1, $a1, %lo(D_800DE7E0)
/* 57B70 80056F70 8FAA0198 */  lw         $t2, 0x198($sp)
.L80056F74:
/* 57B74 80056F74 55400007 */  bnel       $t2, $zero, .L80056F94
/* 57B78 80056F78 8EA20000 */   lw        $v0, ($s5)
/* 57B7C 80056F7C 3C04800E */  lui        $a0, %hi(D_800DE830)
/* 57B80 80056F80 2484E830 */  addiu      $a0, $a0, %lo(D_800DE830)
/* 57B84 80056F84 3C05800E */  lui        $a1, %hi(D_800DE7E0)
/* 57B88 80056F88 0C025F2D */  jal        manualCrash
/* 57B8C 80056F8C 24A5E7E0 */   addiu     $a1, $a1, %lo(D_800DE7E0)
/* 57B90 80056F90 8EA20000 */  lw         $v0, ($s5)
.L80056F94:
/* 57B94 80056F94 10400005 */  beqz       $v0, .L80056FAC
/* 57B98 80056F98 3C04800E */   lui       $a0, %hi(D_800DE838)
/* 57B9C 80056F9C 2484E838 */  addiu      $a0, $a0, %lo(D_800DE838)
/* 57BA0 80056FA0 3C05800E */  lui        $a1, %hi(D_800DE84C)
/* 57BA4 80056FA4 0C025F2D */  jal        manualCrash
/* 57BA8 80056FA8 24A5E84C */   addiu     $a1, $a1, %lo(D_800DE84C)
.L80056FAC:
/* 57BAC 80056FAC 3C11800F */  lui        $s1, %hi(EntityPointer)
/* 57BB0 80056FB0 8E2413A0 */  lw         $a0, %lo(EntityPointer)($s1)
/* 57BB4 80056FB4 0C01D56B */  jal        get_ent_borg7
/* 57BB8 80056FB8 96A50004 */   lhu       $a1, 4($s5)
/* 57BBC 80056FBC 8E2413A0 */  lw         $a0, 0x13a0($s1)
/* 57BC0 80056FC0 96A50004 */  lhu        $a1, 4($s5)
/* 57BC4 80056FC4 0C01D6C6 */  jal        get_some_entity_dat
/* 57BC8 80056FC8 3050FFFF */   andi      $s0, $v0, 0xffff
/* 57BCC 80056FCC 8FA20198 */  lw         $v0, 0x198($sp)
/* 57BD0 80056FD0 AFB00010 */  sw         $s0, 0x10($sp)
/* 57BD4 80056FD4 8C460004 */  lw         $a2, 4($v0)
/* 57BD8 80056FD8 8C470008 */  lw         $a3, 8($v0)
/* 57BDC 80056FDC C44E0000 */  lwc1       $f14, ($v0)
/* 57BE0 80056FE0 0C00609A */  jal        AllocPlayer
/* 57BE4 80056FE4 46000306 */   mov.s     $f12, $f0
/* 57BE8 80056FE8 00409821 */  addu       $s3, $v0, $zero
/* 57BEC 80056FEC 02602021 */  addu       $a0, $s3, $zero
/* 57BF0 80056FF0 00002821 */  addu       $a1, $zero, $zero
/* 57BF4 80056FF4 00003021 */  addu       $a2, $zero, $zero
/* 57BF8 80056FF8 00003821 */  addu       $a3, $zero, $zero
/* 57BFC 80056FFC 0C005539 */  jal        func_800154E4
/* 57C00 80057000 AEB30000 */   sw        $s3, ($s5)
/* 57C04 80057004 8E2413A0 */  lw         $a0, 0x13a0($s1)
/* 57C08 80057008 0C01D6EA */  jal        get_entity_scale
/* 57C0C 8005700C 96A50004 */   lhu       $a1, 4($s5)
/* 57C10 80057010 C6620064 */  lwc1       $f2, 0x64($s3)
/* 57C14 80057014 9662001E */  lhu        $v0, 0x1e($s3)
/* 57C18 80057018 46020082 */  mul.s      $f2, $f0, $f2
/* 57C1C 8005701C E6600030 */  swc1       $f0, 0x30($s3)
/* 57C20 80057020 34421400 */  ori        $v0, $v0, 0x1400
/* 57C24 80057024 A662001E */  sh         $v0, 0x1e($s3)
/* 57C28 80057028 08015C59 */  j          .L80057164
/* 57C2C 8005702C E6620034 */   swc1      $f2, 0x34($s3)
/* 57C30 80057030 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57C34 80057034 24040001 */  addiu      $a0, $zero, 1
/* 57C38 80057038 08015C26 */  j          .L80057098
/* 57C3C 8005703C 02802821 */   addu      $a1, $s4, $zero
/* 57C40 80057040 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57C44 80057044 00162400 */  sll        $a0, $s6, 0x10
/* 57C48 80057048 00042403 */  sra        $a0, $a0, 0x10
/* 57C4C 8005704C 08015C38 */  j          .L800570E0
/* 57C50 80057050 02802821 */   addu      $a1, $s4, $zero
/* 57C54 80057054 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57C58 80057058 00162400 */  sll        $a0, $s6, 0x10
/* 57C5C 8005705C 00042403 */  sra        $a0, $a0, 0x10
/* 57C60 80057060 08015C2F */  j          .L800570BC
/* 57C64 80057064 02802821 */   addu      $a1, $s4, $zero
/* 57C68 80057068 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57C6C 8005706C 00162400 */  sll        $a0, $s6, 0x10
/* 57C70 80057070 00042403 */  sra        $a0, $a0, 0x10
/* 57C74 80057074 00002821 */  addu       $a1, $zero, $zero
/* 57C78 80057078 02603021 */  addu       $a2, $s3, $zero
/* 57C7C 8005707C 0C015AA0 */  jal        CreateScriptCamera
/* 57C80 80057080 24072000 */   addiu     $a3, $zero, 0x2000
/* 57C84 80057084 08015C5A */  j          .L80057168
/* 57C88 80057088 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57C8C 8005708C E7B40010 */  swc1       $f20, 0x10($sp)
/* 57C90 80057090 24040001 */  addiu      $a0, $zero, 1
/* 57C94 80057094 00002821 */  addu       $a1, $zero, $zero
.L80057098:
/* 57C98 80057098 02603021 */  addu       $a2, $s3, $zero
/* 57C9C 8005709C 0C015AA0 */  jal        CreateScriptCamera
/* 57CA0 800570A0 24074001 */   addiu     $a3, $zero, 0x4001
/* 57CA4 800570A4 08015C5A */  j          .L80057168
/* 57CA8 800570A8 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57CAC 800570AC E7B40010 */  swc1       $f20, 0x10($sp)
/* 57CB0 800570B0 00162400 */  sll        $a0, $s6, 0x10
/* 57CB4 800570B4 00042403 */  sra        $a0, $a0, 0x10
/* 57CB8 800570B8 00002821 */  addu       $a1, $zero, $zero
.L800570BC:
/* 57CBC 800570BC 02603021 */  addu       $a2, $s3, $zero
/* 57CC0 800570C0 0C015AA0 */  jal        CreateScriptCamera
/* 57CC4 800570C4 24074004 */   addiu     $a3, $zero, 0x4004
/* 57CC8 800570C8 08015C5A */  j          .L80057168
/* 57CCC 800570CC 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57CD0 800570D0 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57CD4 800570D4 00162400 */  sll        $a0, $s6, 0x10
/* 57CD8 800570D8 00042403 */  sra        $a0, $a0, 0x10
/* 57CDC 800570DC 00002821 */  addu       $a1, $zero, $zero
.L800570E0:
/* 57CE0 800570E0 02603021 */  addu       $a2, $s3, $zero
/* 57CE4 800570E4 0C015AA0 */  jal        CreateScriptCamera
/* 57CE8 800570E8 24074002 */   addiu     $a3, $zero, 0x4002
/* 57CEC 800570EC 08015C5A */  j          .L80057168
/* 57CF0 800570F0 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57CF4 800570F4 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57CF8 800570F8 24040001 */  addiu      $a0, $zero, 1
/* 57CFC 800570FC 08015C4D */  j          .L80057134
/* 57D00 80057100 02802821 */   addu      $a1, $s4, $zero
/* 57D04 80057104 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57D08 80057108 00162400 */  sll        $a0, $s6, 0x10
/* 57D0C 8005710C 00042403 */  sra        $a0, $a0, 0x10
/* 57D10 80057110 02802821 */  addu       $a1, $s4, $zero
/* 57D14 80057114 02603021 */  addu       $a2, $s3, $zero
/* 57D18 80057118 0C015AA0 */  jal        CreateScriptCamera
/* 57D1C 8005711C 34078004 */   ori       $a3, $zero, 0x8004
/* 57D20 80057120 08015C5A */  j          .L80057168
/* 57D24 80057124 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57D28 80057128 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57D2C 8005712C 24040001 */  addiu      $a0, $zero, 1
/* 57D30 80057130 00002821 */  addu       $a1, $zero, $zero
.L80057134:
/* 57D34 80057134 02603021 */  addu       $a2, $s3, $zero
/* 57D38 80057138 0C015AA0 */  jal        CreateScriptCamera
/* 57D3C 8005713C 34078001 */   ori       $a3, $zero, 0x8001
/* 57D40 80057140 08015C5A */  j          .L80057168
/* 57D44 80057144 8FBF01C4 */   lw        $ra, 0x1c4($sp)
/* 57D48 80057148 E7B40010 */  swc1       $f20, 0x10($sp)
/* 57D4C 8005714C 00162400 */  sll        $a0, $s6, 0x10
/* 57D50 80057150 00042403 */  sra        $a0, $a0, 0x10
/* 57D54 80057154 00002821 */  addu       $a1, $zero, $zero
/* 57D58 80057158 02603021 */  addu       $a2, $s3, $zero
/* 57D5C 8005715C 0C015AA0 */  jal        CreateScriptCamera
/* 57D60 80057160 34078004 */   ori       $a3, $zero, 0x8004
.L80057164:
/* 57D64 80057164 8FBF01C4 */  lw         $ra, 0x1c4($sp)
.L80057168:
/* 57D68 80057168 8FBE01C0 */  lw         $fp, 0x1c0($sp)
/* 57D6C 8005716C 8FB701BC */  lw         $s7, 0x1bc($sp)
/* 57D70 80057170 8FB601B8 */  lw         $s6, 0x1b8($sp)
/* 57D74 80057174 8FB501B4 */  lw         $s5, 0x1b4($sp)
/* 57D78 80057178 8FB401B0 */  lw         $s4, 0x1b0($sp)
/* 57D7C 8005717C 8FB301AC */  lw         $s3, 0x1ac($sp)
/* 57D80 80057180 8FB201A8 */  lw         $s2, 0x1a8($sp)
/* 57D84 80057184 8FB101A4 */  lw         $s1, 0x1a4($sp)
/* 57D88 80057188 8FB001A0 */  lw         $s0, 0x1a0($sp)
/* 57D8C 8005718C D7B401C8 */  ldc1       $f20, 0x1c8($sp)
/* 57D90 80057190 03E00008 */  jr         $ra
/* 57D94 80057194 27BD01D0 */   addiu     $sp, $sp, 0x1d0

glabel dialoug_func_b
/* 57D98 80057198 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 57D9C 8005719C 00804021 */  addu       $t0, $a0, $zero
/* 57DA0 800571A0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 57DA4 800571A4 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 57DA8 800571A8 3C02800E */  lui        $v0, %hi(partyPointer)
/* 57DAC 800571AC 24C3FFE9 */  addiu      $v1, $a2, -0x17
/* 57DB0 800571B0 8C457EA0 */  lw         $a1, %lo(partyPointer)($v0)
/* 57DB4 800571B4 2C620009 */  sltiu      $v0, $v1, 9
/* 57DB8 800571B8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 57DBC 800571BC 10400008 */  beqz       $v0, .L800571E0
/* 57DC0 800571C0 AFB00010 */   sw        $s0, 0x10($sp)
/* 57DC4 800571C4 3C02800E */  lui        $v0, %hi(D_800DE8C8)
/* 57DC8 800571C8 2442E8C8 */  addiu      $v0, $v0, %lo(D_800DE8C8)
/* 57DCC 800571CC 00031880 */  sll        $v1, $v1, 2
/* 57DD0 800571D0 00621821 */  addu       $v1, $v1, $v0
/* 57DD4 800571D4 8C640000 */  lw         $a0, ($v1)
/* 57DD8 800571D8 00800008 */  jr         $a0
/* 57DDC 800571DC 00000000 */   nop
.L800571E0:
/* 57DE0 800571E0 08015CA7 */  j          .L8005729C
/* 57DE4 800571E4 00001021 */   addu      $v0, $zero, $zero
/* 57DE8 800571E8 00A02021 */  addu       $a0, $a1, $zero
/* 57DEC 800571EC 0C01F8B4 */  jal        IsCharacterInParty
/* 57DF0 800571F0 00E02821 */   addu      $a1, $a3, $zero
/* 57DF4 800571F4 08015CA6 */  j          .L80057298
/* 57DF8 800571F8 00408021 */   addu      $s0, $v0, $zero
/* 57DFC 800571FC 0C009168 */  jal        get_event_flag
/* 57E00 80057200 00E02021 */   addu      $a0, $a3, $zero
/* 57E04 80057204 08015CA6 */  j          .L80057298
/* 57E08 80057208 00408021 */   addu      $s0, $v0, $zero
/* 57E0C 8005720C 0C016078 */  jal        some_skill_check
/* 57E10 80057210 30E400FF */   andi      $a0, $a3, 0xff
/* 57E14 80057214 00408021 */  addu       $s0, $v0, $zero
/* 57E18 80057218 0C009168 */  jal        get_event_flag
/* 57E1C 8005721C 24040E85 */   addiu     $a0, $zero, 0xe85
/* 57E20 80057220 1040001D */  beqz       $v0, .L80057298
/* 57E24 80057224 00002021 */   addu      $a0, $zero, $zero
/* 57E28 80057228 0C002CF7 */  jal        rand_range
/* 57E2C 8005722C 24050015 */   addiu     $a1, $zero, 0x15
/* 57E30 80057230 08015CA6 */  j          .L80057298
/* 57E34 80057234 3050FFFF */   andi      $s0, $v0, 0xffff
/* 57E38 80057238 00A02021 */  addu       $a0, $a1, $zero
/* 57E3C 8005723C 0C020C0B */  jal        hasItem
/* 57E40 80057240 00E02821 */   addu      $a1, $a3, $zero
/* 57E44 80057244 08015CA6 */  j          .L80057298
/* 57E48 80057248 00408021 */   addu      $s0, $v0, $zero
/* 57E4C 8005724C 00A02021 */  addu       $a0, $a1, $zero
/* 57E50 80057250 0C020902 */  jal        get_best_stat
/* 57E54 80057254 30E500FF */   andi      $a1, $a3, 0xff
/* 57E58 80057258 08015CA6 */  j          .L80057298
/* 57E5C 8005725C 00408021 */   addu      $s0, $v0, $zero
/* 57E60 80057260 00A02021 */  addu       $a0, $a1, $zero
/* 57E64 80057264 0C02092F */  jal        get_worst_stat
/* 57E68 80057268 30E500FF */   andi      $a1, $a3, 0xff
/* 57E6C 8005726C 08015CA6 */  j          .L80057298
/* 57E70 80057270 00408021 */   addu      $s0, $v0, $zero
/* 57E74 80057274 00A02021 */  addu       $a0, $a1, $zero
/* 57E78 80057278 9505010A */  lhu        $a1, 0x10a($t0)
/* 57E7C 8005727C 0C02095C */  jal        get_this_char_stat
/* 57E80 80057280 30E600FF */   andi      $a2, $a3, 0xff
/* 57E84 80057284 08015CA6 */  j          .L80057298
/* 57E88 80057288 00408021 */   addu      $s0, $v0, $zero
/* 57E8C 8005728C 08015CA6 */  j          .L80057298
/* 57E90 80057290 90B00024 */   lbu       $s0, 0x24($a1)
/* 57E94 80057294 94B00016 */  lhu        $s0, 0x16($a1)
.L80057298:
/* 57E98 80057298 02001021 */  addu       $v0, $s0, $zero
.L8005729C:
/* 57E9C 8005729C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 57EA0 800572A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 57EA4 800572A4 03E00008 */  jr         $ra
/* 57EA8 800572A8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dialougemode_0x90_funcs3
/* 57EAC 800572AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 57EB0 800572B0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 57EB4 800572B4 0C0160FF */  jal        set_dialougemode_0x90
/* 57EB8 800572B8 00000000 */   nop
/* 57EBC 800572BC 0C015F64 */  jal        run_dialougemode_funcs3
/* 57EC0 800572C0 00000000 */   nop
/* 57EC4 800572C4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 57EC8 800572C8 03E00008 */  jr         $ra
/* 57ECC 800572CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dialouge_func_C
/* 57ED0 800572D0 27BDFB70 */  addiu      $sp, $sp, -0x490
/* 57ED4 800572D4 AFB5047C */  sw         $s5, 0x47c($sp)
/* 57ED8 800572D8 0000A821 */  addu       $s5, $zero, $zero
/* 57EDC 800572DC AFB30474 */  sw         $s3, 0x474($sp)
/* 57EE0 800572E0 00009821 */  addu       $s3, $zero, $zero
/* 57EE4 800572E4 AFB40478 */  sw         $s4, 0x478($sp)
/* 57EE8 800572E8 0080A021 */  addu       $s4, $a0, $zero
/* 57EEC 800572EC AFB20470 */  sw         $s2, 0x470($sp)
/* 57EF0 800572F0 00A09021 */  addu       $s2, $a1, $zero
/* 57EF4 800572F4 AFB60480 */  sw         $s6, 0x480($sp)
/* 57EF8 800572F8 30D6FFFF */  andi       $s6, $a2, 0xffff
/* 57EFC 800572FC AFBF0484 */  sw         $ra, 0x484($sp)
/* 57F00 80057300 AFB1046C */  sw         $s1, 0x46c($sp)
/* 57F04 80057304 AFB00468 */  sw         $s0, 0x468($sp)
/* 57F08 80057308 F7B40488 */  sdc1       $f20, 0x488($sp)
/* 57F0C 8005730C 9686010A */  lhu        $a2, 0x10a($s4)
/* 57F10 80057310 0C015AD4 */  jal        func_80056B50
/* 57F14 80057314 30F1FFFF */   andi      $s1, $a3, 0xffff
/* 57F18 80057318 54400001 */  bnel       $v0, $zero, .L80057320
/* 57F1C 8005731C 8C550000 */   lw        $s5, ($v0)
.L80057320:
/* 57F20 80057320 12200006 */  beqz       $s1, .L8005733C
/* 57F24 80057324 3C10800E */   lui       $s0, %hi(gGlobals)
/* 57F28 80057328 260268A8 */  addiu      $v0, $s0, %lo(gGlobals)
/* 57F2C 8005732C 8C440200 */  lw         $a0, 0x200($v0)
/* 57F30 80057330 0C003A6B */  jal        get_map_referencepoint
/* 57F34 80057334 02202821 */   addu      $a1, $s1, $zero
/* 57F38 80057338 00409821 */  addu       $s3, $v0, $zero
.L8005733C:
/* 57F3C 8005733C 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 57F40 80057340 8C4715F8 */  lw         $a3, 0x15f8($v0)
/* 57F44 80057344 26C3FFE0 */  addiu      $v1, $s6, -0x20
/* 57F48 80057348 2C62001B */  sltiu      $v0, $v1, 0x1b
/* 57F4C 8005734C 10400121 */  beqz       $v0, .L800577D4
/* 57F50 80057350 3C02800E */   lui       $v0, %hi(D_800DEAA0)
/* 57F54 80057354 2442EAA0 */  addiu      $v0, $v0, %lo(D_800DEAA0)
/* 57F58 80057358 00031880 */  sll        $v1, $v1, 2
/* 57F5C 8005735C 00621821 */  addu       $v1, $v1, $v0
/* 57F60 80057360 8C640000 */  lw         $a0, ($v1)
/* 57F64 80057364 00800008 */  jr         $a0
/* 57F68 80057368 00000000 */   nop
/* 57F6C 8005736C 0C01D88F */  jal        func_8007623C
/* 57F70 80057370 02202021 */   addu      $a0, $s1, $zero
/* 57F74 80057374 00403021 */  addu       $a2, $v0, $zero
/* 57F78 80057378 2402FFFF */  addiu      $v0, $zero, -1
/* 57F7C 8005737C 10C20116 */  beq        $a2, $v0, .L800577D8
/* 57F80 80057380 8FBF0484 */   lw        $ra, 0x484($sp)
/* 57F84 80057384 02A02021 */  addu       $a0, $s5, $zero
/* 57F88 80057388 0C006224 */  jal        AttachItemToPlayer
/* 57F8C 8005738C 00002821 */   addu      $a1, $zero, $zero
/* 57F90 80057390 08015DF6 */  j          .L800577D8
/* 57F94 80057394 8FBF0484 */   lw        $ra, 0x484($sp)
/* 57F98 80057398 02A02021 */  addu       $a0, $s5, $zero
/* 57F9C 8005739C 0C006251 */  jal        FreeAttachmentFromPlayer
/* 57FA0 800573A0 00002821 */   addu      $a1, $zero, $zero
/* 57FA4 800573A4 08015DF6 */  j          .L800577D8
/* 57FA8 800573A8 8FBF0484 */   lw        $ra, 0x484($sp)
/* 57FAC 800573AC 00E02021 */  addu       $a0, $a3, $zero
/* 57FB0 800573B0 0C020801 */  jal        some_camp_func
/* 57FB4 800573B4 00002821 */   addu      $a1, $zero, $zero
/* 57FB8 800573B8 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 57FBC 800573BC 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 57FC0 800573C0 24030001 */  addiu      $v1, $zero, 1
/* 57FC4 800573C4 AC8300B0 */  sw         $v1, 0xb0($a0)
/* 57FC8 800573C8 92420014 */  lbu        $v0, 0x14($s2)
/* 57FCC 800573CC 14400096 */  bnez       $v0, .L80057628
/* 57FD0 800573D0 24040001 */   addiu     $a0, $zero, 1
/* 57FD4 800573D4 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 57FD8 800573D8 3C01800E */  lui        $at, %hi(D_800DEB0C)
/* 57FDC 800573DC C420EB0C */  lwc1       $f0, %lo(D_800DEB0C)($at)
/* 57FE0 800573E0 24030002 */  addiu      $v1, $zero, 2
/* 57FE4 800573E4 A4432048 */  sh         $v1, 0x2048($v0)
/* 57FE8 800573E8 AC40203C */  sw         $zero, 0x203c($v0)
/* 57FEC 800573EC 08015D8A */  j          .L80057628
/* 57FF0 800573F0 E4402044 */   swc1      $f0, 0x2044($v0)
/* 57FF4 800573F4 02202021 */  addu       $a0, $s1, $zero
/* 57FF8 800573F8 0C00918D */  jal        setEventFlag
/* 57FFC 800573FC 24050001 */   addiu     $a1, $zero, 1
/* 58000 80057400 08015DF6 */  j          .L800577D8
/* 58004 80057404 8FBF0484 */   lw        $ra, 0x484($sp)
/* 58008 80057408 02202021 */  addu       $a0, $s1, $zero
/* 5800C 8005740C 0C00918D */  jal        setEventFlag
/* 58010 80057410 00002821 */   addu      $a1, $zero, $zero
/* 58014 80057414 08015DF6 */  j          .L800577D8
/* 58018 80057418 8FBF0484 */   lw        $ra, 0x484($sp)
/* 5801C 8005741C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 58020 80057420 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 58024 80057424 2405072D */  addiu      $a1, $zero, 0x72d
/* 58028 80057428 8CE20014 */  lw         $v0, 0x14($a3)
/* 5802C 8005742C 2403012C */  addiu      $v1, $zero, 0x12c
/* 58030 80057430 00511021 */  addu       $v0, $v0, $s1
/* 58034 80057434 08015D76 */  j          .L800575D8
/* 58038 80057438 ACE20014 */   sw        $v0, 0x14($a3)
/* 5803C 8005743C 8CE30014 */  lw         $v1, 0x14($a3)
/* 58040 80057440 0071102B */  sltu       $v0, $v1, $s1
/* 58044 80057444 144000E4 */  bnez       $v0, .L800577D8
/* 58048 80057448 8FBF0484 */   lw        $ra, 0x484($sp)
/* 5804C 8005744C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 58050 80057450 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 58054 80057454 2405072E */  addiu      $a1, $zero, 0x72e
/* 58058 80057458 00711023 */  subu       $v0, $v1, $s1
/* 5805C 8005745C 2403012C */  addiu      $v1, $zero, 0x12c
/* 58060 80057460 08015D76 */  j          .L800575D8
/* 58064 80057464 ACE20014 */   sw        $v0, 0x14($a3)
/* 58068 80057468 261068A8 */  addiu      $s0, $s0, 0x68a8
/* 5806C 8005746C 8E0415F8 */  lw         $a0, 0x15f8($s0)
/* 58070 80057470 0C01F823 */  jal        get_charsheet
/* 58074 80057474 9685010A */   lhu       $a1, 0x10a($s4)
/* 58078 80057478 00409021 */  addu       $s2, $v0, $zero
/* 5807C 8005747C 56400009 */  bnel       $s2, $zero, .L800574A4
/* 58080 80057480 260412F8 */   addiu     $a0, $s0, 0x12f8
/* 58084 80057484 27A40020 */  addiu      $a0, $sp, 0x20
/* 58088 80057488 3C05800E */  lui        $a1, %hi(D_800DE8EC)
/* 5808C 8005748C 24A5E8EC */  addiu      $a1, $a1, %lo(D_800DE8EC)
/* 58090 80057490 9686010A */  lhu        $a2, 0x10a($s4)
/* 58094 80057494 0C0333AC */  jal        sprintf
/* 58098 80057498 24070445 */   addiu     $a3, $zero, 0x445
/* 5809C 8005749C 08015DDD */  j          .L80057774
/* 580A0 800574A0 27A40020 */   addiu     $a0, $sp, 0x20
.L800574A4:
/* 580A4 800574A4 240505E7 */  addiu      $a1, $zero, 0x5e7
/* 580A8 800574A8 00003021 */  addu       $a2, $zero, $zero
/* 580AC 800574AC 8E072054 */  lw         $a3, 0x2054($s0)
/* 580B0 800574B0 2402012C */  addiu      $v0, $zero, 0x12c
/* 580B4 800574B4 AFA20010 */  sw         $v0, 0x10($sp)
/* 580B8 800574B8 0C0156F4 */  jal        play_SFX
/* 580BC 800574BC AFA00014 */   sw        $zero, 0x14($sp)
/* 580C0 800574C0 02402021 */  addu       $a0, $s2, $zero
/* 580C4 800574C4 0C01EA4F */  jal        giveExp
/* 580C8 800574C8 02202821 */   addu      $a1, $s1, $zero
/* 580CC 800574CC 08015DF6 */  j          .L800577D8
/* 580D0 800574D0 8FBF0484 */   lw        $ra, 0x484($sp)
/* 580D4 800574D4 8CE70010 */  lw         $a3, 0x10($a3)
/* 580D8 800574D8 02202821 */  addu       $a1, $s1, $zero
/* 580DC 800574DC 8CE30000 */  lw         $v1, ($a3)
/* 580E0 800574E0 24060001 */  addiu      $a2, $zero, 1
/* 580E4 800574E4 84640030 */  lh         $a0, 0x30($v1)
/* 580E8 800574E8 8C620034 */  lw         $v0, 0x34($v1)
/* 580EC 800574EC 0040F809 */  jalr       $v0
/* 580F0 800574F0 00E42021 */   addu      $a0, $a3, $a0
/* 580F4 800574F4 08015DF6 */  j          .L800577D8
/* 580F8 800574F8 8FBF0484 */   lw        $ra, 0x484($sp)
/* 580FC 800574FC 00E02021 */  addu       $a0, $a3, $zero
/* 58100 80057500 0C020BCD */  jal        dialoug_look_for_item
/* 58104 80057504 02202821 */   addu      $a1, $s1, $zero
/* 58108 80057508 144000B3 */  bnez       $v0, .L800577D8
/* 5810C 8005750C 8FBF0484 */   lw        $ra, 0x484($sp)
/* 58110 80057510 27A40120 */  addiu      $a0, $sp, 0x120
/* 58114 80057514 0C01EF1C */  jal        temp_item_check
/* 58118 80057518 02202821 */   addu      $a1, $s1, $zero
/* 5811C 8005751C 27B00160 */  addiu      $s0, $sp, 0x160
/* 58120 80057520 02002021 */  addu       $a0, $s0, $zero
/* 58124 80057524 3C05800E */  lui        $a1, %hi(D_800DE938)
/* 58128 80057528 9646000C */  lhu        $a2, 0xc($s2)
/* 5812C 8005752C 8FA70124 */  lw         $a3, 0x124($sp)
/* 58130 80057530 0C0333AC */  jal        sprintf
/* 58134 80057534 24A5E938 */   addiu     $a1, $a1, %lo(D_800DE938)
/* 58138 80057538 08015DDD */  j          .L80057774
/* 5813C 8005753C 02002021 */   addu      $a0, $s0, $zero
/* 58140 80057540 0C01615E */  jal        add_char_to_party
/* 58144 80057544 02202021 */   addu      $a0, $s1, $zero
/* 58148 80057548 144000A3 */  bnez       $v0, .L800577D8
/* 5814C 8005754C 8FBF0484 */   lw        $ra, 0x484($sp)
/* 58150 80057550 27B00260 */  addiu      $s0, $sp, 0x260
/* 58154 80057554 02002021 */  addu       $a0, $s0, $zero
/* 58158 80057558 3C05800E */  lui        $a1, %hi(D_800DE9D0)
/* 5815C 8005755C 24A5E9D0 */  addiu      $a1, $a1, %lo(D_800DE9D0)
/* 58160 80057560 02203021 */  addu       $a2, $s1, $zero
/* 58164 80057564 08015D9A */  j          .L80057668
/* 58168 80057568 24070494 */   addiu     $a3, $zero, 0x494
/* 5816C 8005756C 00E02021 */  addu       $a0, $a3, $zero
/* 58170 80057570 0C01F86D */  jal        remove_alive_char_from_party
/* 58174 80057574 02202821 */   addu      $a1, $s1, $zero
/* 58178 80057578 08015DF6 */  j          .L800577D8
/* 5817C 8005757C 8FBF0484 */   lw        $ra, 0x484($sp)
/* 58180 80057580 260368A8 */  addiu      $v1, $s0, 0x68a8
/* 58184 80057584 3C01800E */  lui        $at, %hi(D_800DEB10)
/* 58188 80057588 C420EB10 */  lwc1       $f0, %lo(D_800DEB10)($at)
/* 5818C 8005758C 3C01800E */  lui        $at, %hi(D_800DEB14)
/* 58190 80057590 C422EB14 */  lwc1       $f2, %lo(D_800DEB14)($at)
/* 58194 80057594 24020003 */  addiu      $v0, $zero, 3
/* 58198 80057598 A4622048 */  sh         $v0, 0x2048($v1)
/* 5819C 8005759C E4602044 */  swc1       $f0, 0x2044($v1)
/* 581A0 800575A0 08015DF5 */  j          .L800577D4
/* 581A4 800575A4 E4622040 */   swc1      $f2, 0x2040($v1)
/* 581A8 800575A8 0C016174 */  jal        func_800585D0
/* 581AC 800575AC 02202021 */   addu      $a0, $s1, $zero
/* 581B0 800575B0 08015DF6 */  j          .L800577D8
/* 581B4 800575B4 8FBF0484 */   lw        $ra, 0x484($sp)
/* 581B8 800575B8 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 581BC 800575BC 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 581C0 800575C0 3C03800F */  lui        $v1, %hi(D_800EE8C0)
/* 581C4 800575C4 2463E8C0 */  addiu      $v1, $v1, %lo(D_800EE8C0)
/* 581C8 800575C8 00111080 */  sll        $v0, $s1, 2
/* 581CC 800575CC 00431021 */  addu       $v0, $v0, $v1
/* 581D0 800575D0 8C450000 */  lw         $a1, ($v0)
/* 581D4 800575D4 2403012C */  addiu      $v1, $zero, 0x12c
.L800575D8:
/* 581D8 800575D8 AFA30010 */  sw         $v1, 0x10($sp)
/* 581DC 800575DC AFA00014 */  sw         $zero, 0x14($sp)
/* 581E0 800575E0 8C870D5C */  lw         $a3, 0xd5c($a0)
/* 581E4 800575E4 0C0156F4 */  jal        play_SFX
/* 581E8 800575E8 00003021 */   addu      $a2, $zero, $zero
/* 581EC 800575EC 08015DF6 */  j          .L800577D8
/* 581F0 800575F0 8FBF0484 */   lw        $ra, 0x484($sp)
/* 581F4 800575F4 0C016211 */  jal        shop_func
/* 581F8 800575F8 00000000 */   nop
/* 581FC 800575FC 08015D8A */  j          .L80057628
/* 58200 80057600 24040007 */   addiu     $a0, $zero, 7
/* 58204 80057604 0C016103 */  jal        encounterDat_func
/* 58208 80057608 00000000 */   nop
/* 5820C 8005760C 08015D8A */  j          .L80057628
/* 58210 80057610 24040002 */   addiu     $a0, $zero, 2
/* 58214 80057614 0C0161AA */  jal        init_skill_trainer
/* 58218 80057618 00000000 */   nop
/* 5821C 8005761C 08015D8A */  j          .L80057628
/* 58220 80057620 24040005 */   addiu     $a0, $zero, 5
/* 58224 80057624 24040001 */  addiu      $a0, $zero, 1
.L80057628:
/* 58228 80057628 02802821 */  addu       $a1, $s4, $zero
/* 5822C 8005762C 0C015CAB */  jal        dialougemode_0x90_funcs3
/* 58230 80057630 02403021 */   addu      $a2, $s2, $zero
/* 58234 80057634 08015DF6 */  j          .L800577D8
/* 58238 80057638 8FBF0484 */   lw        $ra, 0x484($sp)
/* 5823C 8005763C 0C029CEA */  jal        get_borg13
/* 58240 80057640 02202021 */   addu      $a0, $s1, $zero
/* 58244 80057644 00408021 */  addu       $s0, $v0, $zero
/* 58248 80057648 1600000F */  bnez       $s0, .L80057688
/* 5824C 8005764C 00002021 */   addu      $a0, $zero, $zero
/* 58250 80057650 27B00360 */  addiu      $s0, $sp, 0x360
/* 58254 80057654 02002021 */  addu       $a0, $s0, $zero
/* 58258 80057658 3C05800E */  lui        $a1, %hi(D_800DEA24)
/* 5825C 8005765C 24A5EA24 */  addiu      $a1, $a1, %lo(D_800DEA24)
/* 58260 80057660 02203021 */  addu       $a2, $s1, $zero
/* 58264 80057664 24070529 */  addiu      $a3, $zero, 0x529
.L80057668:
/* 58268 80057668 0C0333AC */  jal        sprintf
/* 5826C 8005766C 00000000 */   nop
/* 58270 80057670 3C04800E */  lui        $a0, %hi(D_800DE7E0)
/* 58274 80057674 2484E7E0 */  addiu      $a0, $a0, %lo(D_800DE7E0)
/* 58278 80057678 0C025F2D */  jal        manualCrash
/* 5827C 8005767C 02002821 */   addu      $a1, $s0, $zero
/* 58280 80057680 08015DF6 */  j          .L800577D8
/* 58284 80057684 8FBF0484 */   lw        $ra, 0x484($sp)
.L80057688:
/* 58288 80057688 0C002CF7 */  jal        rand_range
/* 5828C 8005768C 24050064 */   addiu     $a1, $zero, 0x64
/* 58290 80057690 44821000 */  mtc1       $v0, $f2
/* 58294 80057694 468010A1 */  cvt.d.w    $f2, $f2
/* 58298 80057698 04430005 */  bgezl      $v0, .L800576B0
/* 5829C 8005769C 462010A0 */   cvt.s.d   $f2, $f2
/* 582A0 800576A0 3C01800E */  lui        $at, %hi(D_800DEB18)
/* 582A4 800576A4 D420EB18 */  ldc1       $f0, %lo(D_800DEB18)($at)
/* 582A8 800576A8 46201080 */  add.d      $f2, $f2, $f0
/* 582AC 800576AC 462010A0 */  cvt.s.d    $f2, $f2
.L800576B0:
/* 582B0 800576B0 3C13800F */  lui        $s3, %hi(dialougemode_pointer)
/* 582B4 800576B4 24027FFF */  addiu      $v0, $zero, 0x7fff
/* 582B8 800576B8 8E67E960 */  lw         $a3, %lo(dialougemode_pointer)($s3)
/* 582BC 800576BC 3C01800E */  lui        $at, %hi(D_800DEB20)
/* 582C0 800576C0 C420EB20 */  lwc1       $f0, %lo(D_800DEB20)($at)
/* 582C4 800576C4 94E3007C */  lhu        $v1, 0x7c($a3)
/* 582C8 800576C8 1062001B */  beq        $v1, $v0, .L80057738
/* 582CC 800576CC 46001503 */   div.s     $f20, $f2, $f0
/* 582D0 800576D0 00602021 */  addu       $a0, $v1, $zero
/* 582D4 800576D4 24120011 */  addiu      $s2, $zero, 0x11
/* 582D8 800576D8 90E50097 */  lbu        $a1, 0x97($a3)
/* 582DC 800576DC 90E60099 */  lbu        $a2, 0x99($a3)
/* 582E0 800576E0 90E7009B */  lbu        $a3, 0x9b($a3)
/* 582E4 800576E4 24110009 */  addiu      $s1, $zero, 9
/* 582E8 800576E8 AFB20010 */  sw         $s2, 0x10($sp)
/* 582EC 800576EC 0C017F2E */  jal        some_ref_obj_lookup_func
/* 582F0 800576F0 AFB10014 */   sw        $s1, 0x14($sp)
/* 582F4 800576F4 00401821 */  addu       $v1, $v0, $zero
/* 582F8 800576F8 10600004 */  beqz       $v1, .L8005770C
/* 582FC 800576FC 2402000A */   addiu     $v0, $zero, 0xa
/* 58300 80057700 C4740008 */  lwc1       $f20, 8($v1)
/* 58304 80057704 08015DCE */  j          .L80057738
/* 58308 80057708 A0620003 */   sb        $v0, 3($v1)
.L8005770C:
/* 5830C 8005770C 8E62E960 */  lw         $v0, -0x16a0($s3)
/* 58310 80057710 9444007C */  lhu        $a0, 0x7c($v0)
/* 58314 80057714 90450097 */  lbu        $a1, 0x97($v0)
/* 58318 80057718 90460099 */  lbu        $a2, 0x99($v0)
/* 5831C 8005771C 9047009B */  lbu        $a3, 0x9b($v0)
/* 58320 80057720 2402000A */  addiu      $v0, $zero, 0xa
/* 58324 80057724 AFB20010 */  sw         $s2, 0x10($sp)
/* 58328 80057728 AFB10014 */  sw         $s1, 0x14($sp)
/* 5832C 8005772C 0C017EB4 */  jal        passto_WriteTo_VoxelChart
/* 58330 80057730 AFA20018 */   sw        $v0, 0x18($sp)
/* 58334 80057734 E4540008 */  swc1       $f20, 8($v0)
.L80057738:
/* 58338 80057738 8E050010 */  lw         $a1, 0x10($s0)
/* 5833C 8005773C 4406A000 */  mfc1       $a2, $f20
/* 58340 80057740 0C02DB93 */  jal        func_800B6E4C
/* 58344 80057744 02802021 */   addu      $a0, $s4, $zero
/* 58348 80057748 3C04800E */  lui        $a0, %hi(queueStructA)
/* 5834C 8005774C 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 58350 80057750 27A50460 */  addiu      $a1, $sp, 0x460
/* 58354 80057754 24060005 */  addiu      $a2, $zero, 5
/* 58358 80057758 00003821 */  addu       $a3, $zero, $zero
/* 5835C 8005775C 0C035867 */  jal        AllocFreeQueueItem
/* 58360 80057760 AFB00460 */   sw        $s0, 0x460($sp)
/* 58364 80057764 08015DF6 */  j          .L800577D8
/* 58368 80057768 8FBF0484 */   lw        $ra, 0x484($sp)
/* 5836C 8005776C 3C04800E */  lui        $a0, %hi(D_800DEA54)
/* 58370 80057770 2484EA54 */  addiu      $a0, $a0, %lo(D_800DEA54)
.L80057774:
/* 58374 80057774 3C05800E */  lui        $a1, %hi(D_800DE7E0)
/* 58378 80057778 0C025F2D */  jal        manualCrash
/* 5837C 8005777C 24A5E7E0 */   addiu     $a1, $a1, %lo(D_800DE7E0)
/* 58380 80057780 08015DF6 */  j          .L800577D8
/* 58384 80057784 8FBF0484 */   lw        $ra, 0x484($sp)
/* 58388 80057788 24020001 */  addiu      $v0, $zero, 1
/* 5838C 8005778C 08015DE6 */  j          .L80057798
/* 58390 80057790 AFA20010 */   sw        $v0, 0x10($sp)
/* 58394 80057794 AFA00010 */  sw         $zero, 0x10($sp)
.L80057798:
/* 58398 80057798 8E650000 */  lw         $a1, ($s3)
/* 5839C 8005779C 8E660008 */  lw         $a2, 8($s3)
/* 583A0 800577A0 3C073F80 */  lui        $a3, 0x3f80
/* 583A4 800577A4 0C00657E */  jal        enemy_proximity_check
/* 583A8 800577A8 02A02021 */   addu      $a0, $s5, $zero
/* 583AC 800577AC 0C0160DC */  jal        func_80058370
/* 583B0 800577B0 00000000 */   nop
/* 583B4 800577B4 08015DF6 */  j          .L800577D8
/* 583B8 800577B8 8FBF0484 */   lw        $ra, 0x484($sp)
/* 583BC 800577BC 0C0162AA */  jal        set_some_borg13_flag
/* 583C0 800577C0 00000000 */   nop
/* 583C4 800577C4 08015DF6 */  j          .L800577D8
/* 583C8 800577C8 8FBF0484 */   lw        $ra, 0x484($sp)
/* 583CC 800577CC 0C0160F4 */  jal        func_800583D0
/* 583D0 800577D0 02202021 */   addu      $a0, $s1, $zero
.L800577D4:
/* 583D4 800577D4 8FBF0484 */  lw         $ra, 0x484($sp)
.L800577D8:
/* 583D8 800577D8 8FB60480 */  lw         $s6, 0x480($sp)
/* 583DC 800577DC 8FB5047C */  lw         $s5, 0x47c($sp)
/* 583E0 800577E0 8FB40478 */  lw         $s4, 0x478($sp)
/* 583E4 800577E4 8FB30474 */  lw         $s3, 0x474($sp)
/* 583E8 800577E8 8FB20470 */  lw         $s2, 0x470($sp)
/* 583EC 800577EC 8FB1046C */  lw         $s1, 0x46c($sp)
/* 583F0 800577F0 8FB00468 */  lw         $s0, 0x468($sp)
/* 583F4 800577F4 D7B40488 */  ldc1       $f20, 0x488($sp)
/* 583F8 800577F8 03E00008 */  jr         $ra
/* 583FC 800577FC 27BD0490 */   addiu     $sp, $sp, 0x490

glabel find_PC_name_space
/* 58400 80057800 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58404 80057804 AFB00010 */  sw         $s0, 0x10($sp)
/* 58408 80057808 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5840C 8005780C 0C03353E */  jal        strlen
/* 58410 80057810 00808021 */   addu      $s0, $a0, $zero
/* 58414 80057814 00401821 */  addu       $v1, $v0, $zero
/* 58418 80057818 28620014 */  slti       $v0, $v1, 0x14
/* 5841C 8005781C 14400019 */  bnez       $v0, .L80057884
/* 58420 80057820 00001021 */   addu      $v0, $zero, $zero
/* 58424 80057824 02031021 */  addu       $v0, $s0, $v1
/* 58428 80057828 2446FFEC */  addiu      $a2, $v0, -0x14
/* 5842C 8005782C 12060015 */  beq        $s0, $a2, .L80057884
/* 58430 80057830 00001021 */   addu      $v0, $zero, $zero
/* 58434 80057834 24070023 */  addiu      $a3, $zero, 0x23
/* 58438 80057838 92030000 */  lbu        $v1, ($s0)
.L8005783C:
/* 5843C 8005783C 5467000E */  bnel       $v1, $a3, .L80057878
/* 58440 80057840 26100001 */   addiu     $s0, $s0, 1
/* 58444 80057844 92020013 */  lbu        $v0, 0x13($s0)
/* 58448 80057848 14430008 */  bne        $v0, $v1, .L8005786C
/* 5844C 8005784C 24040013 */   addiu     $a0, $zero, 0x13
/* 58450 80057850 24050023 */  addiu      $a1, $zero, 0x23
/* 58454 80057854 2484FFFF */  addiu      $a0, $a0, -1
.L80057858:
/* 58458 80057858 18800004 */  blez       $a0, .L8005786C
/* 5845C 8005785C 02041021 */   addu      $v0, $s0, $a0
/* 58460 80057860 90430000 */  lbu        $v1, ($v0)
/* 58464 80057864 5065FFFC */  beql       $v1, $a1, .L80057858
/* 58468 80057868 2484FFFF */   addiu     $a0, $a0, -1
.L8005786C:
/* 5846C 8005786C 10800005 */  beqz       $a0, .L80057884
/* 58470 80057870 02001021 */   addu      $v0, $s0, $zero
/* 58474 80057874 26100001 */  addiu      $s0, $s0, 1
.L80057878:
/* 58478 80057878 5606FFF0 */  bnel       $s0, $a2, .L8005783C
/* 5847C 8005787C 92030000 */   lbu       $v1, ($s0)
/* 58480 80057880 00001021 */  addu       $v0, $zero, $zero
.L80057884:
/* 58484 80057884 8FBF0014 */  lw         $ra, 0x14($sp)
/* 58488 80057888 8FB00010 */  lw         $s0, 0x10($sp)
/* 5848C 8005788C 03E00008 */  jr         $ra
/* 58490 80057890 27BD0018 */   addiu     $sp, $sp, 0x18

glabel fill_in_player_name
/* 58494 80057894 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 58498 80057898 AFB00010 */  sw         $s0, 0x10($sp)
/* 5849C 8005789C 00808021 */  addu       $s0, $a0, $zero
/* 584A0 800578A0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 584A4 800578A4 AFB40020 */  sw         $s4, 0x20($sp)
/* 584A8 800578A8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 584AC 800578AC AFB20018 */  sw         $s2, 0x18($sp)
/* 584B0 800578B0 1200001F */  beqz       $s0, .L80057930
/* 584B4 800578B4 AFB10014 */   sw        $s1, 0x14($sp)
/* 584B8 800578B8 0C03353E */  jal        strlen
/* 584BC 800578BC 00000000 */   nop
/* 584C0 800578C0 1040001C */  beqz       $v0, .L80057934
/* 584C4 800578C4 8FBF0024 */   lw        $ra, 0x24($sp)
/* 584C8 800578C8 08015E47 */  j          .L8005791C
/* 584CC 800578CC 00000000 */   nop
.L800578D0:
/* 584D0 800578D0 3C14800E */  lui        $s4, 0x800e
/* 584D4 800578D4 08015E3E */  j          .L800578F8
/* 584D8 800578D8 26130014 */   addiu     $s3, $s0, 0x14
.L800578DC:
/* 584DC 800578DC 8C430000 */  lw         $v1, ($v0)
/* 584E0 800578E0 8C640004 */  lw         $a0, 4($v1)
/* 584E4 800578E4 02112821 */  addu       $a1, $s0, $s1
/* 584E8 800578E8 00912021 */  addu       $a0, $a0, $s1
/* 584EC 800578EC 90820000 */  lbu        $v0, ($a0)
/* 584F0 800578F0 26310001 */  addiu      $s1, $s1, 1
/* 584F4 800578F4 A0A20000 */  sb         $v0, ($a1)
.L800578F8:
/* 584F8 800578F8 269268A8 */  addiu      $s2, $s4, 0x68a8
/* 584FC 800578FC 8E4215F8 */  lw         $v0, 0x15f8($s2)
/* 58500 80057900 8C430000 */  lw         $v1, ($v0)
/* 58504 80057904 0C03353E */  jal        strlen
/* 58508 80057908 8C640004 */   lw        $a0, 4($v1)
/* 5850C 8005790C 0222102A */  slt        $v0, $s1, $v0
/* 58510 80057910 5440FFF2 */  bnel       $v0, $zero, .L800578DC
/* 58514 80057914 8E4215F8 */   lw        $v0, 0x15f8($s2)
/* 58518 80057918 02608021 */  addu       $s0, $s3, $zero
.L8005791C:
/* 5851C 8005791C 0C015E00 */  jal        find_PC_name_space
/* 58520 80057920 02002021 */   addu      $a0, $s0, $zero
/* 58524 80057924 00408021 */  addu       $s0, $v0, $zero
/* 58528 80057928 1600FFE9 */  bnez       $s0, .L800578D0
/* 5852C 8005792C 00008821 */   addu      $s1, $zero, $zero
.L80057930:
/* 58530 80057930 8FBF0024 */  lw         $ra, 0x24($sp)
.L80057934:
/* 58534 80057934 8FB40020 */  lw         $s4, 0x20($sp)
/* 58538 80057938 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5853C 8005793C 8FB20018 */  lw         $s2, 0x18($sp)
/* 58540 80057940 8FB10014 */  lw         $s1, 0x14($sp)
/* 58544 80057944 8FB00010 */  lw         $s0, 0x10($sp)
/* 58548 80057948 03E00008 */  jr         $ra
/* 5854C 8005794C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_string_func
/* 58550 80057950 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58554 80057954 AFB00010 */  sw         $s0, 0x10($sp)
/* 58558 80057958 00808021 */  addu       $s0, $a0, $zero
/* 5855C 8005795C 1200003E */  beqz       $s0, .L80057A58
/* 58560 80057960 AFBF0014 */   sw        $ra, 0x14($sp)
/* 58564 80057964 0C03353E */  jal        strlen
/* 58568 80057968 00000000 */   nop
/* 5856C 8005796C 1040003B */  beqz       $v0, .L80057A5C
/* 58570 80057970 8FBF0014 */   lw        $ra, 0x14($sp)
/* 58574 80057974 92020000 */  lbu        $v0, ($s0)
/* 58578 80057978 50400039 */  beql       $v0, $zero, .L80057A60
/* 5857C 8005797C 8FB00010 */   lw        $s0, 0x10($sp)
/* 58580 80057980 2407005C */  addiu      $a3, $zero, 0x5c
/* 58584 80057984 240A0078 */  addiu      $t2, $zero, 0x78
/* 58588 80057988 24060023 */  addiu      $a2, $zero, 0x23
/* 5858C 8005798C 2409006E */  addiu      $t1, $zero, 0x6e
/* 58590 80057990 2408000A */  addiu      $t0, $zero, 0xa
.L80057994:
/* 58594 80057994 5447002D */  bnel       $v0, $a3, .L80057A4C
/* 58598 80057998 26100001 */   addiu     $s0, $s0, 1
/* 5859C 8005799C 92020001 */  lbu        $v0, 1($s0)
/* 585A0 800579A0 304300FF */  andi       $v1, $v0, 0xff
/* 585A4 800579A4 1060001E */  beqz       $v1, .L80057A20
/* 585A8 800579A8 00402021 */   addu      $a0, $v0, $zero
/* 585AC 800579AC 546A001D */  bnel       $v1, $t2, .L80057A24
/* 585B0 800579B0 92020000 */   lbu       $v0, ($s0)
/* 585B4 800579B4 92020002 */  lbu        $v0, 2($s0)
/* 585B8 800579B8 5040001A */  beql       $v0, $zero, .L80057A24
/* 585BC 800579BC 92020000 */   lbu       $v0, ($s0)
/* 585C0 800579C0 92020003 */  lbu        $v0, 3($s0)
/* 585C4 800579C4 10400016 */  beqz       $v0, .L80057A20
/* 585C8 800579C8 00402821 */   addu      $a1, $v0, $zero
/* 585CC 800579CC 92040002 */  lbu        $a0, 2($s0)
/* 585D0 800579D0 2C820042 */  sltiu      $v0, $a0, 0x42
/* 585D4 800579D4 14400002 */  bnez       $v0, .L800579E0
/* 585D8 800579D8 2482FFD0 */   addiu     $v0, $a0, -0x30
/* 585DC 800579DC 2482FFC9 */  addiu      $v0, $a0, -0x37
.L800579E0:
/* 585E0 800579E0 304400FF */  andi       $a0, $v0, 0xff
/* 585E4 800579E4 00041100 */  sll        $v0, $a0, 4
/* 585E8 800579E8 2CA30042 */  sltiu      $v1, $a1, 0x42
/* 585EC 800579EC 14600003 */  bnez       $v1, .L800579FC
/* 585F0 800579F0 304400FF */   andi      $a0, $v0, 0xff
/* 585F4 800579F4 08015E80 */  j          .L80057A00
/* 585F8 800579F8 24A2FFC9 */   addiu     $v0, $a1, -0x37
.L800579FC:
/* 585FC 800579FC 24A2FFD0 */  addiu      $v0, $a1, -0x30
.L80057A00:
/* 58600 80057A00 304500FF */  andi       $a1, $v0, 0xff
/* 58604 80057A04 00851021 */  addu       $v0, $a0, $a1
/* 58608 80057A08 A2020000 */  sb         $v0, ($s0)
/* 5860C 80057A0C A2060001 */  sb         $a2, 1($s0)
/* 58610 80057A10 A2060002 */  sb         $a2, 2($s0)
/* 58614 80057A14 A2060003 */  sb         $a2, 3($s0)
/* 58618 80057A18 08015E93 */  j          .L80057A4C
/* 5861C 80057A1C 26100004 */   addiu     $s0, $s0, 4
.L80057A20:
/* 58620 80057A20 92020000 */  lbu        $v0, ($s0)
.L80057A24:
/* 58624 80057A24 54470009 */  bnel       $v0, $a3, .L80057A4C
/* 58628 80057A28 26100001 */   addiu     $s0, $s0, 1
/* 5862C 80057A2C 308200FF */  andi       $v0, $a0, 0xff
/* 58630 80057A30 50400006 */  beql       $v0, $zero, .L80057A4C
/* 58634 80057A34 26100001 */   addiu     $s0, $s0, 1
/* 58638 80057A38 54490004 */  bnel       $v0, $t1, .L80057A4C
/* 5863C 80057A3C 26100001 */   addiu     $s0, $s0, 1
/* 58640 80057A40 A2080000 */  sb         $t0, ($s0)
/* 58644 80057A44 A2060001 */  sb         $a2, 1($s0)
/* 58648 80057A48 26100002 */  addiu      $s0, $s0, 2
.L80057A4C:
/* 5864C 80057A4C 92020000 */  lbu        $v0, ($s0)
/* 58650 80057A50 1440FFD0 */  bnez       $v0, .L80057994
/* 58654 80057A54 00000000 */   nop
.L80057A58:
/* 58658 80057A58 8FBF0014 */  lw         $ra, 0x14($sp)
.L80057A5C:
/* 5865C 80057A5C 8FB00010 */  lw         $s0, 0x10($sp)
.L80057A60:
/* 58660 80057A60 03E00008 */  jr         $ra
/* 58664 80057A64 27BD0018 */   addiu     $sp, $sp, 0x18
/* 58668 80057A68 00000000 */  nop
/* 5866C 80057A6C 00000000 */  nop
