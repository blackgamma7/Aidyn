.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _Printf
/* D3570 800D2970 27BDFF78 */  addiu      $sp, $sp, -0x88
/* D3574 800D2974 AFB40078 */  sw         $s4, 0x78($sp)
/* D3578 800D2978 0080A021 */  addu       $s4, $a0, $zero
/* D357C 800D297C AFB30074 */  sw         $s3, 0x74($sp)
/* D3580 800D2980 00A09821 */  addu       $s3, $a1, $zero
/* D3584 800D2984 00C02821 */  addu       $a1, $a2, $zero
/* D3588 800D2988 AFB5007C */  sw         $s5, 0x7c($sp)
/* D358C 800D298C 3C15800E */  lui        $s5, %hi(xprintf_rodata_0000)
/* D3590 800D2990 26B557C0 */  addiu      $s5, $s5, %lo(xprintf_rodata_0000)
/* D3594 800D2994 AFBF0080 */  sw         $ra, 0x80($sp)
/* D3598 800D2998 AFB20070 */  sw         $s2, 0x70($sp)
/* D359C 800D299C AFB1006C */  sw         $s1, 0x6c($sp)
/* D35A0 800D29A0 AFB00068 */  sw         $s0, 0x68($sp)
/* D35A4 800D29A4 AFA70094 */  sw         $a3, 0x94($sp)
/* D35A8 800D29A8 AFA0003C */  sw         $zero, 0x3c($sp)
.L800D29AC:
/* D35AC 800D29AC 90B10000 */  lbu        $s1, ($a1)
/* D35B0 800D29B0 08034A6F */  j          .L800D29BC
/* D35B4 800D29B4 00A09021 */   addu      $s2, $a1, $zero
.L800D29B8:
/* D35B8 800D29B8 92510000 */  lbu        $s1, ($s2)
.L800D29BC:
/* D35BC 800D29BC 322200FF */  andi       $v0, $s1, 0xff
/* D35C0 800D29C0 0002182B */  sltu       $v1, $zero, $v0
/* D35C4 800D29C4 38420025 */  xori       $v0, $v0, 0x25
/* D35C8 800D29C8 0002102B */  sltu       $v0, $zero, $v0
/* D35CC 800D29CC 00621824 */  and        $v1, $v1, $v0
/* D35D0 800D29D0 5460FFF9 */  bnel       $v1, $zero, .L800D29B8
/* D35D4 800D29D4 26520001 */   addiu     $s2, $s2, 1
/* D35D8 800D29D8 02458023 */  subu       $s0, $s2, $a1
/* D35DC 800D29DC 1A000009 */  blez       $s0, .L800D2A04
/* D35E0 800D29E0 02602021 */   addu      $a0, $s3, $zero
/* D35E4 800D29E4 0280F809 */  jalr       $s4
/* D35E8 800D29E8 02003021 */   addu      $a2, $s0, $zero
/* D35EC 800D29EC 00409821 */  addu       $s3, $v0, $zero
/* D35F0 800D29F0 12600131 */  beqz       $s3, .L800D2EB8
/* D35F4 800D29F4 00000000 */   nop
/* D35F8 800D29F8 8FA2003C */  lw         $v0, 0x3c($sp)
/* D35FC 800D29FC 00501021 */  addu       $v0, $v0, $s0
/* D3600 800D2A00 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2A04:
/* D3604 800D2A04 1220012C */  beqz       $s1, .L800D2EB8
/* D3608 800D2A08 26520001 */   addiu     $s2, $s2, 1
/* D360C 800D2A0C AFA00040 */  sw         $zero, 0x40($sp)
/* D3610 800D2A10 3C10800E */  lui        $s0, %hi(xprintf_rodata_0008)
/* D3614 800D2A14 261057C8 */  addiu      $s0, $s0, %lo(xprintf_rodata_0008)
.L800D2A18:
/* D3618 800D2A18 92450000 */  lbu        $a1, ($s2)
/* D361C 800D2A1C 0C033530 */  jal        strchr
/* D3620 800D2A20 02A02021 */   addu      $a0, $s5, $zero
/* D3624 800D2A24 10400009 */  beqz       $v0, .L800D2A4C
/* D3628 800D2A28 00551023 */   subu      $v0, $v0, $s5
/* D362C 800D2A2C 00021080 */  sll        $v0, $v0, 2
/* D3630 800D2A30 00501021 */  addu       $v0, $v0, $s0
/* D3634 800D2A34 8FA30040 */  lw         $v1, 0x40($sp)
/* D3638 800D2A38 8C420000 */  lw         $v0, ($v0)
/* D363C 800D2A3C 26520001 */  addiu      $s2, $s2, 1
/* D3640 800D2A40 00621825 */  or         $v1, $v1, $v0
/* D3644 800D2A44 08034A86 */  j          .L800D2A18
/* D3648 800D2A48 AFA30040 */   sw        $v1, 0x40($sp)
.L800D2A4C:
/* D364C 800D2A4C 92440000 */  lbu        $a0, ($s2)
/* D3650 800D2A50 2402002A */  addiu      $v0, $zero, 0x2a
/* D3654 800D2A54 308300FF */  andi       $v1, $a0, 0xff
/* D3658 800D2A58 14620011 */  bne        $v1, $v0, .L800D2AA0
/* D365C 800D2A5C 2482FFD0 */   addiu     $v0, $a0, -0x30
/* D3660 800D2A60 8FA20094 */  lw         $v0, 0x94($sp)
/* D3664 800D2A64 2403FFFC */  addiu      $v1, $zero, -4
/* D3668 800D2A68 24420003 */  addiu      $v0, $v0, 3
/* D366C 800D2A6C 00431024 */  and        $v0, $v0, $v1
/* D3670 800D2A70 24430004 */  addiu      $v1, $v0, 4
/* D3674 800D2A74 AFA30094 */  sw         $v1, 0x94($sp)
/* D3678 800D2A78 8C420000 */  lw         $v0, ($v0)
/* D367C 800D2A7C 04410006 */  bgez       $v0, .L800D2A98
/* D3680 800D2A80 AFA20038 */   sw        $v0, 0x38($sp)
/* D3684 800D2A84 8FA30040 */  lw         $v1, 0x40($sp)
/* D3688 800D2A88 00021023 */  negu       $v0, $v0
/* D368C 800D2A8C AFA20038 */  sw         $v0, 0x38($sp)
/* D3690 800D2A90 34630004 */  ori        $v1, $v1, 4
/* D3694 800D2A94 AFA30040 */  sw         $v1, 0x40($sp)
.L800D2A98:
/* D3698 800D2A98 08034ABC */  j          .L800D2AF0
/* D369C 800D2A9C 26520001 */   addiu     $s2, $s2, 1
.L800D2AA0:
/* D36A0 800D2AA0 2C42000A */  sltiu      $v0, $v0, 0xa
/* D36A4 800D2AA4 10400012 */  beqz       $v0, .L800D2AF0
/* D36A8 800D2AA8 AFA00038 */   sw        $zero, 0x38($sp)
.L800D2AAC:
/* D36AC 800D2AAC 8FA40038 */  lw         $a0, 0x38($sp)
/* D36B0 800D2AB0 288203E7 */  slti       $v0, $a0, 0x3e7
/* D36B4 800D2AB4 50400009 */  beql       $v0, $zero, .L800D2ADC
/* D36B8 800D2AB8 26520001 */   addiu     $s2, $s2, 1
/* D36BC 800D2ABC 00041080 */  sll        $v0, $a0, 2
/* D36C0 800D2AC0 92430000 */  lbu        $v1, ($s2)
/* D36C4 800D2AC4 00441021 */  addu       $v0, $v0, $a0
/* D36C8 800D2AC8 00021040 */  sll        $v0, $v0, 1
/* D36CC 800D2ACC 00431021 */  addu       $v0, $v0, $v1
/* D36D0 800D2AD0 2442FFD0 */  addiu      $v0, $v0, -0x30
/* D36D4 800D2AD4 AFA20038 */  sw         $v0, 0x38($sp)
/* D36D8 800D2AD8 26520001 */  addiu      $s2, $s2, 1
.L800D2ADC:
/* D36DC 800D2ADC 92420000 */  lbu        $v0, ($s2)
/* D36E0 800D2AE0 2442FFD0 */  addiu      $v0, $v0, -0x30
/* D36E4 800D2AE4 2C42000A */  sltiu      $v0, $v0, 0xa
/* D36E8 800D2AE8 1440FFF0 */  bnez       $v0, .L800D2AAC
/* D36EC 800D2AEC 00000000 */   nop
.L800D2AF0:
/* D36F0 800D2AF0 92430000 */  lbu        $v1, ($s2)
/* D36F4 800D2AF4 2402002E */  addiu      $v0, $zero, 0x2e
/* D36F8 800D2AF8 10620003 */  beq        $v1, $v0, .L800D2B08
/* D36FC 800D2AFC 2402FFFF */   addiu     $v0, $zero, -1
/* D3700 800D2B00 08034AE6 */  j          .L800D2B98
/* D3704 800D2B04 AFA20034 */   sw        $v0, 0x34($sp)
.L800D2B08:
/* D3708 800D2B08 26520001 */  addiu      $s2, $s2, 1
/* D370C 800D2B0C 92440000 */  lbu        $a0, ($s2)
/* D3710 800D2B10 2402002A */  addiu      $v0, $zero, 0x2a
/* D3714 800D2B14 308300FF */  andi       $v1, $a0, 0xff
/* D3718 800D2B18 1462000B */  bne        $v1, $v0, .L800D2B48
/* D371C 800D2B1C 2482FFD0 */   addiu     $v0, $a0, -0x30
/* D3720 800D2B20 8FA30094 */  lw         $v1, 0x94($sp)
/* D3724 800D2B24 2402FFFC */  addiu      $v0, $zero, -4
/* D3728 800D2B28 24630003 */  addiu      $v1, $v1, 3
/* D372C 800D2B2C 00621824 */  and        $v1, $v1, $v0
/* D3730 800D2B30 24620004 */  addiu      $v0, $v1, 4
/* D3734 800D2B34 AFA20094 */  sw         $v0, 0x94($sp)
/* D3738 800D2B38 8C620000 */  lw         $v0, ($v1)
/* D373C 800D2B3C 26520001 */  addiu      $s2, $s2, 1
/* D3740 800D2B40 08034AE6 */  j          .L800D2B98
/* D3744 800D2B44 AFA20034 */   sw        $v0, 0x34($sp)
.L800D2B48:
/* D3748 800D2B48 2C42000A */  sltiu      $v0, $v0, 0xa
/* D374C 800D2B4C 10400012 */  beqz       $v0, .L800D2B98
/* D3750 800D2B50 AFA00034 */   sw        $zero, 0x34($sp)
.L800D2B54:
/* D3754 800D2B54 8FA40034 */  lw         $a0, 0x34($sp)
/* D3758 800D2B58 288203E7 */  slti       $v0, $a0, 0x3e7
/* D375C 800D2B5C 50400009 */  beql       $v0, $zero, .L800D2B84
/* D3760 800D2B60 26520001 */   addiu     $s2, $s2, 1
/* D3764 800D2B64 00041080 */  sll        $v0, $a0, 2
/* D3768 800D2B68 92430000 */  lbu        $v1, ($s2)
/* D376C 800D2B6C 00441021 */  addu       $v0, $v0, $a0
/* D3770 800D2B70 00021040 */  sll        $v0, $v0, 1
/* D3774 800D2B74 00431021 */  addu       $v0, $v0, $v1
/* D3778 800D2B78 2442FFD0 */  addiu      $v0, $v0, -0x30
/* D377C 800D2B7C AFA20034 */  sw         $v0, 0x34($sp)
/* D3780 800D2B80 26520001 */  addiu      $s2, $s2, 1
.L800D2B84:
/* D3784 800D2B84 92420000 */  lbu        $v0, ($s2)
/* D3788 800D2B88 2442FFD0 */  addiu      $v0, $v0, -0x30
/* D378C 800D2B8C 2C42000A */  sltiu      $v0, $v0, 0xa
/* D3790 800D2B90 1440FFF0 */  bnez       $v0, .L800D2B54
/* D3794 800D2B94 00000000 */   nop
.L800D2B98:
/* D3798 800D2B98 92500000 */  lbu        $s0, ($s2)
/* D379C 800D2B9C 3C04800E */  lui        $a0, %hi(xprintf_rodata_0020)
/* D37A0 800D2BA0 248457E0 */  addiu      $a0, $a0, %lo(xprintf_rodata_0020)
/* D37A4 800D2BA4 0C033530 */  jal        strchr
/* D37A8 800D2BA8 02002821 */   addu      $a1, $s0, $zero
/* D37AC 800D2BAC 10400003 */  beqz       $v0, .L800D2BBC
/* D37B0 800D2BB0 02002821 */   addu      $a1, $s0, $zero
/* D37B4 800D2BB4 08034AF0 */  j          .L800D2BC0
/* D37B8 800D2BB8 26520001 */   addiu     $s2, $s2, 1
.L800D2BBC:
/* D37BC 800D2BBC 00002821 */  addu       $a1, $zero, $zero
.L800D2BC0:
/* D37C0 800D2BC0 A3A50044 */  sb         $a1, 0x44($sp)
/* D37C4 800D2BC4 30A500FF */  andi       $a1, $a1, 0xff
/* D37C8 800D2BC8 2402006C */  addiu      $v0, $zero, 0x6c
/* D37CC 800D2BCC 14A20007 */  bne        $a1, $v0, .L800D2BEC
/* D37D0 800D2BD0 27A40010 */   addiu     $a0, $sp, 0x10
/* D37D4 800D2BD4 92420000 */  lbu        $v0, ($s2)
/* D37D8 800D2BD8 14450004 */  bne        $v0, $a1, .L800D2BEC
/* D37DC 800D2BDC 2402004C */   addiu     $v0, $zero, 0x4c
/* D37E0 800D2BE0 A3A20044 */  sb         $v0, 0x44($sp)
/* D37E4 800D2BE4 26520001 */  addiu      $s2, $s2, 1
/* D37E8 800D2BE8 27A40010 */  addiu      $a0, $sp, 0x10
.L800D2BEC:
/* D37EC 800D2BEC 92460000 */  lbu        $a2, ($s2)
/* D37F0 800D2BF0 27A50094 */  addiu      $a1, $sp, 0x94
/* D37F4 800D2BF4 0C034BB8 */  jal        _Putfld
/* D37F8 800D2BF8 27A70048 */   addiu     $a3, $sp, 0x48
/* D37FC 800D2BFC 8FA3001C */  lw         $v1, 0x1c($sp)
/* D3800 800D2C00 8FA20020 */  lw         $v0, 0x20($sp)
/* D3804 800D2C04 00621821 */  addu       $v1, $v1, $v0
/* D3808 800D2C08 8FA20024 */  lw         $v0, 0x24($sp)
/* D380C 800D2C0C 8FA40028 */  lw         $a0, 0x28($sp)
/* D3810 800D2C10 8FA5002C */  lw         $a1, 0x2c($sp)
/* D3814 800D2C14 00621821 */  addu       $v1, $v1, $v0
/* D3818 800D2C18 00641821 */  addu       $v1, $v1, $a0
/* D381C 800D2C1C 00651821 */  addu       $v1, $v1, $a1
/* D3820 800D2C20 8FA40030 */  lw         $a0, 0x30($sp)
/* D3824 800D2C24 8FA50038 */  lw         $a1, 0x38($sp)
/* D3828 800D2C28 8FA20040 */  lw         $v0, 0x40($sp)
/* D382C 800D2C2C 00641821 */  addu       $v1, $v1, $a0
/* D3830 800D2C30 00A32823 */  subu       $a1, $a1, $v1
/* D3834 800D2C34 30420004 */  andi       $v0, $v0, 4
/* D3838 800D2C38 14400017 */  bnez       $v0, .L800D2C98
/* D383C 800D2C3C AFA50038 */   sw        $a1, 0x38($sp)
/* D3840 800D2C40 18A00015 */  blez       $a1, .L800D2C98
/* D3844 800D2C44 00000000 */   nop
/* D3848 800D2C48 00A08821 */  addu       $s1, $a1, $zero
/* D384C 800D2C4C 2E220021 */  sltiu      $v0, $s1, 0x21
.L800D2C50:
/* D3850 800D2C50 10400002 */  beqz       $v0, .L800D2C5C
/* D3854 800D2C54 24100020 */   addiu     $s0, $zero, 0x20
/* D3858 800D2C58 02208021 */  addu       $s0, $s1, $zero
.L800D2C5C:
/* D385C 800D2C5C 5A00000C */  blezl      $s0, .L800D2C90
/* D3860 800D2C60 02308823 */   subu      $s1, $s1, $s0
/* D3864 800D2C64 02602021 */  addu       $a0, $s3, $zero
/* D3868 800D2C68 3C05800F */  lui        $a1, %hi(xprintf_data_0000)
/* D386C 800D2C6C 24A54FE0 */  addiu      $a1, $a1, %lo(xprintf_data_0000)
/* D3870 800D2C70 0280F809 */  jalr       $s4
/* D3874 800D2C74 02003021 */   addu      $a2, $s0, $zero
/* D3878 800D2C78 00409821 */  addu       $s3, $v0, $zero
/* D387C 800D2C7C 1260008E */  beqz       $s3, .L800D2EB8
/* D3880 800D2C80 02308823 */   subu      $s1, $s1, $s0
/* D3884 800D2C84 8FA2003C */  lw         $v0, 0x3c($sp)
/* D3888 800D2C88 00501021 */  addu       $v0, $v0, $s0
/* D388C 800D2C8C AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2C90:
/* D3890 800D2C90 1E20FFEF */  bgtz       $s1, .L800D2C50
/* D3894 800D2C94 2E220021 */   sltiu     $v0, $s1, 0x21
.L800D2C98:
/* D3898 800D2C98 8FA6001C */  lw         $a2, 0x1c($sp)
/* D389C 800D2C9C 18C0000A */  blez       $a2, .L800D2CC8
/* D38A0 800D2CA0 02602021 */   addu      $a0, $s3, $zero
/* D38A4 800D2CA4 0280F809 */  jalr       $s4
/* D38A8 800D2CA8 27A50048 */   addiu     $a1, $sp, 0x48
/* D38AC 800D2CAC 00409821 */  addu       $s3, $v0, $zero
/* D38B0 800D2CB0 12600081 */  beqz       $s3, .L800D2EB8
/* D38B4 800D2CB4 00000000 */   nop
/* D38B8 800D2CB8 8FA2003C */  lw         $v0, 0x3c($sp)
/* D38BC 800D2CBC 8FA3001C */  lw         $v1, 0x1c($sp)
/* D38C0 800D2CC0 00431021 */  addu       $v0, $v0, $v1
/* D38C4 800D2CC4 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2CC8:
/* D38C8 800D2CC8 8FA20020 */  lw         $v0, 0x20($sp)
/* D38CC 800D2CCC 18400015 */  blez       $v0, .L800D2D24
/* D38D0 800D2CD0 00000000 */   nop
/* D38D4 800D2CD4 00408821 */  addu       $s1, $v0, $zero
/* D38D8 800D2CD8 2E220021 */  sltiu      $v0, $s1, 0x21
.L800D2CDC:
/* D38DC 800D2CDC 10400002 */  beqz       $v0, .L800D2CE8
/* D38E0 800D2CE0 24100020 */   addiu     $s0, $zero, 0x20
/* D38E4 800D2CE4 02208021 */  addu       $s0, $s1, $zero
.L800D2CE8:
/* D38E8 800D2CE8 5A00000C */  blezl      $s0, .L800D2D1C
/* D38EC 800D2CEC 02308823 */   subu      $s1, $s1, $s0
/* D38F0 800D2CF0 02602021 */  addu       $a0, $s3, $zero
/* D38F4 800D2CF4 3C05800F */  lui        $a1, %hi(xprintf_data_0024)
/* D38F8 800D2CF8 24A55004 */  addiu      $a1, $a1, %lo(xprintf_data_0024)
/* D38FC 800D2CFC 0280F809 */  jalr       $s4
/* D3900 800D2D00 02003021 */   addu      $a2, $s0, $zero
/* D3904 800D2D04 00409821 */  addu       $s3, $v0, $zero
/* D3908 800D2D08 1260006B */  beqz       $s3, .L800D2EB8
/* D390C 800D2D0C 02308823 */   subu      $s1, $s1, $s0
/* D3910 800D2D10 8FA2003C */  lw         $v0, 0x3c($sp)
/* D3914 800D2D14 00501021 */  addu       $v0, $v0, $s0
/* D3918 800D2D18 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2D1C:
/* D391C 800D2D1C 1E20FFEF */  bgtz       $s1, .L800D2CDC
/* D3920 800D2D20 2E220021 */   sltiu     $v0, $s1, 0x21
.L800D2D24:
/* D3924 800D2D24 8FA60024 */  lw         $a2, 0x24($sp)
/* D3928 800D2D28 18C0000B */  blez       $a2, .L800D2D58
/* D392C 800D2D2C 00000000 */   nop
/* D3930 800D2D30 8FA50018 */  lw         $a1, 0x18($sp)
/* D3934 800D2D34 0280F809 */  jalr       $s4
/* D3938 800D2D38 02602021 */   addu      $a0, $s3, $zero
/* D393C 800D2D3C 00409821 */  addu       $s3, $v0, $zero
/* D3940 800D2D40 1260005D */  beqz       $s3, .L800D2EB8
/* D3944 800D2D44 00000000 */   nop
/* D3948 800D2D48 8FA2003C */  lw         $v0, 0x3c($sp)
/* D394C 800D2D4C 8FA30024 */  lw         $v1, 0x24($sp)
/* D3950 800D2D50 00431021 */  addu       $v0, $v0, $v1
/* D3954 800D2D54 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2D58:
/* D3958 800D2D58 8FA20028 */  lw         $v0, 0x28($sp)
/* D395C 800D2D5C 18400015 */  blez       $v0, .L800D2DB4
/* D3960 800D2D60 00000000 */   nop
/* D3964 800D2D64 00408821 */  addu       $s1, $v0, $zero
/* D3968 800D2D68 2E220021 */  sltiu      $v0, $s1, 0x21
.L800D2D6C:
/* D396C 800D2D6C 10400002 */  beqz       $v0, .L800D2D78
/* D3970 800D2D70 24100020 */   addiu     $s0, $zero, 0x20
/* D3974 800D2D74 02208021 */  addu       $s0, $s1, $zero
.L800D2D78:
/* D3978 800D2D78 5A00000C */  blezl      $s0, .L800D2DAC
/* D397C 800D2D7C 02308823 */   subu      $s1, $s1, $s0
/* D3980 800D2D80 02602021 */  addu       $a0, $s3, $zero
/* D3984 800D2D84 3C05800F */  lui        $a1, %hi(xprintf_data_0024)
/* D3988 800D2D88 24A55004 */  addiu      $a1, $a1, %lo(xprintf_data_0024)
/* D398C 800D2D8C 0280F809 */  jalr       $s4
/* D3990 800D2D90 02003021 */   addu      $a2, $s0, $zero
/* D3994 800D2D94 00409821 */  addu       $s3, $v0, $zero
/* D3998 800D2D98 12600047 */  beqz       $s3, .L800D2EB8
/* D399C 800D2D9C 02308823 */   subu      $s1, $s1, $s0
/* D39A0 800D2DA0 8FA2003C */  lw         $v0, 0x3c($sp)
/* D39A4 800D2DA4 00501021 */  addu       $v0, $v0, $s0
/* D39A8 800D2DA8 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2DAC:
/* D39AC 800D2DAC 1E20FFEF */  bgtz       $s1, .L800D2D6C
/* D39B0 800D2DB0 2E220021 */   sltiu     $v0, $s1, 0x21
.L800D2DB4:
/* D39B4 800D2DB4 8FA6002C */  lw         $a2, 0x2c($sp)
/* D39B8 800D2DB8 18C0000C */  blez       $a2, .L800D2DEC
/* D39BC 800D2DBC 02602021 */   addu      $a0, $s3, $zero
/* D39C0 800D2DC0 8FA20018 */  lw         $v0, 0x18($sp)
/* D39C4 800D2DC4 8FA50024 */  lw         $a1, 0x24($sp)
/* D39C8 800D2DC8 0280F809 */  jalr       $s4
/* D39CC 800D2DCC 00452821 */   addu      $a1, $v0, $a1
/* D39D0 800D2DD0 00409821 */  addu       $s3, $v0, $zero
/* D39D4 800D2DD4 12600038 */  beqz       $s3, .L800D2EB8
/* D39D8 800D2DD8 00000000 */   nop
/* D39DC 800D2DDC 8FA2003C */  lw         $v0, 0x3c($sp)
/* D39E0 800D2DE0 8FA3002C */  lw         $v1, 0x2c($sp)
/* D39E4 800D2DE4 00431021 */  addu       $v0, $v0, $v1
/* D39E8 800D2DE8 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2DEC:
/* D39EC 800D2DEC 8FA20030 */  lw         $v0, 0x30($sp)
/* D39F0 800D2DF0 18400015 */  blez       $v0, .L800D2E48
/* D39F4 800D2DF4 00000000 */   nop
/* D39F8 800D2DF8 00408821 */  addu       $s1, $v0, $zero
/* D39FC 800D2DFC 2E220021 */  sltiu      $v0, $s1, 0x21
.L800D2E00:
/* D3A00 800D2E00 10400002 */  beqz       $v0, .L800D2E0C
/* D3A04 800D2E04 24100020 */   addiu     $s0, $zero, 0x20
/* D3A08 800D2E08 02208021 */  addu       $s0, $s1, $zero
.L800D2E0C:
/* D3A0C 800D2E0C 5A00000C */  blezl      $s0, .L800D2E40
/* D3A10 800D2E10 02308823 */   subu      $s1, $s1, $s0
/* D3A14 800D2E14 02602021 */  addu       $a0, $s3, $zero
/* D3A18 800D2E18 3C05800F */  lui        $a1, %hi(xprintf_data_0024)
/* D3A1C 800D2E1C 24A55004 */  addiu      $a1, $a1, %lo(xprintf_data_0024)
/* D3A20 800D2E20 0280F809 */  jalr       $s4
/* D3A24 800D2E24 02003021 */   addu      $a2, $s0, $zero
/* D3A28 800D2E28 00409821 */  addu       $s3, $v0, $zero
/* D3A2C 800D2E2C 12600022 */  beqz       $s3, .L800D2EB8
/* D3A30 800D2E30 02308823 */   subu      $s1, $s1, $s0
/* D3A34 800D2E34 8FA2003C */  lw         $v0, 0x3c($sp)
/* D3A38 800D2E38 00501021 */  addu       $v0, $v0, $s0
/* D3A3C 800D2E3C AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2E40:
/* D3A40 800D2E40 1E20FFEF */  bgtz       $s1, .L800D2E00
/* D3A44 800D2E44 2E220021 */   sltiu     $v0, $s1, 0x21
.L800D2E48:
/* D3A48 800D2E48 8FA20040 */  lw         $v0, 0x40($sp)
/* D3A4C 800D2E4C 30420004 */  andi       $v0, $v0, 4
/* D3A50 800D2E50 1040FED6 */  beqz       $v0, .L800D29AC
/* D3A54 800D2E54 26450001 */   addiu     $a1, $s2, 1
/* D3A58 800D2E58 8FA20038 */  lw         $v0, 0x38($sp)
/* D3A5C 800D2E5C 1840FED3 */  blez       $v0, .L800D29AC
/* D3A60 800D2E60 00408821 */   addu      $s1, $v0, $zero
/* D3A64 800D2E64 2E220021 */  sltiu      $v0, $s1, 0x21
.L800D2E68:
/* D3A68 800D2E68 10400002 */  beqz       $v0, .L800D2E74
/* D3A6C 800D2E6C 24100020 */   addiu     $s0, $zero, 0x20
/* D3A70 800D2E70 02208021 */  addu       $s0, $s1, $zero
.L800D2E74:
/* D3A74 800D2E74 5A00000C */  blezl      $s0, .L800D2EA8
/* D3A78 800D2E78 02308823 */   subu      $s1, $s1, $s0
/* D3A7C 800D2E7C 02602021 */  addu       $a0, $s3, $zero
/* D3A80 800D2E80 3C05800F */  lui        $a1, %hi(xprintf_data_0000)
/* D3A84 800D2E84 24A54FE0 */  addiu      $a1, $a1, %lo(xprintf_data_0000)
/* D3A88 800D2E88 0280F809 */  jalr       $s4
/* D3A8C 800D2E8C 02003021 */   addu      $a2, $s0, $zero
/* D3A90 800D2E90 00409821 */  addu       $s3, $v0, $zero
/* D3A94 800D2E94 12600008 */  beqz       $s3, .L800D2EB8
/* D3A98 800D2E98 02308823 */   subu      $s1, $s1, $s0
/* D3A9C 800D2E9C 8FA2003C */  lw         $v0, 0x3c($sp)
/* D3AA0 800D2EA0 00501021 */  addu       $v0, $v0, $s0
/* D3AA4 800D2EA4 AFA2003C */  sw         $v0, 0x3c($sp)
.L800D2EA8:
/* D3AA8 800D2EA8 1E20FFEF */  bgtz       $s1, .L800D2E68
/* D3AAC 800D2EAC 2E220021 */   sltiu     $v0, $s1, 0x21
/* D3AB0 800D2EB0 08034A6B */  j          .L800D29AC
/* D3AB4 800D2EB4 26450001 */   addiu     $a1, $s2, 1
.L800D2EB8:
/* D3AB8 800D2EB8 8FA2003C */  lw         $v0, 0x3c($sp)
/* D3ABC 800D2EBC 8FBF0080 */  lw         $ra, 0x80($sp)
/* D3AC0 800D2EC0 8FB5007C */  lw         $s5, 0x7c($sp)
/* D3AC4 800D2EC4 8FB40078 */  lw         $s4, 0x78($sp)
/* D3AC8 800D2EC8 8FB30074 */  lw         $s3, 0x74($sp)
/* D3ACC 800D2ECC 8FB20070 */  lw         $s2, 0x70($sp)
/* D3AD0 800D2ED0 8FB1006C */  lw         $s1, 0x6c($sp)
/* D3AD4 800D2ED4 8FB00068 */  lw         $s0, 0x68($sp)
/* D3AD8 800D2ED8 03E00008 */  jr         $ra
/* D3ADC 800D2EDC 27BD0088 */   addiu     $sp, $sp, 0x88

glabel _Putfld
/* D3AE0 800D2EE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D3AE4 800D2EE4 AFB00010 */  sw         $s0, 0x10($sp)
/* D3AE8 800D2EE8 00808021 */  addu       $s0, $a0, $zero
/* D3AEC 800D2EEC 00A04021 */  addu       $t0, $a1, $zero
/* D3AF0 800D2EF0 00E04821 */  addu       $t1, $a3, $zero
/* D3AF4 800D2EF4 30C200FF */  andi       $v0, $a2, 0xff
/* D3AF8 800D2EF8 2443FFDB */  addiu      $v1, $v0, -0x25
/* D3AFC 800D2EFC 2C620054 */  sltiu      $v0, $v1, 0x54
/* D3B00 800D2F00 AFBF0014 */  sw         $ra, 0x14($sp)
/* D3B04 800D2F04 AE000020 */  sw         $zero, 0x20($s0)
/* D3B08 800D2F08 AE00001C */  sw         $zero, 0x1c($s0)
/* D3B0C 800D2F0C AE000018 */  sw         $zero, 0x18($s0)
/* D3B10 800D2F10 AE000014 */  sw         $zero, 0x14($s0)
/* D3B14 800D2F14 AE000010 */  sw         $zero, 0x10($s0)
/* D3B18 800D2F18 10400117 */  beqz       $v0, .L800D3378
/* D3B1C 800D2F1C AE00000C */   sw        $zero, 0xc($s0)
/* D3B20 800D2F20 00031080 */  sll        $v0, $v1, 2
/* D3B24 800D2F24 3C01800E */  lui        $at, %hi(jtbl_800E57E8)
/* D3B28 800D2F28 00220821 */  addu       $at, $at, $v0
/* D3B2C 800D2F2C 8C2257E8 */  lw         $v0, %lo(jtbl_800E57E8)($at)
/* D3B30 800D2F30 00400008 */  jr         $v0
/* D3B34 800D2F34 00000000 */   nop
glabel L800D2F38_D3B38
/* D3B38 800D2F38 8E04000C */  lw         $a0, 0xc($s0)
/* D3B3C 800D2F3C 24820001 */  addiu      $v0, $a0, 1
/* D3B40 800D2F40 AE02000C */  sw         $v0, 0xc($s0)
/* D3B44 800D2F44 8D020000 */  lw         $v0, ($t0)
/* D3B48 800D2F48 2403FFFC */  addiu      $v1, $zero, -4
/* D3B4C 800D2F4C 24420003 */  addiu      $v0, $v0, 3
/* D3B50 800D2F50 00431024 */  and        $v0, $v0, $v1
/* D3B54 800D2F54 24430004 */  addiu      $v1, $v0, 4
/* D3B58 800D2F58 AD030000 */  sw         $v1, ($t0)
/* D3B5C 800D2F5C 8C420000 */  lw         $v0, ($v0)
/* D3B60 800D2F60 01242021 */  addu       $a0, $t1, $a0
/* D3B64 800D2F64 08034CE3 */  j          .L800D338C
/* D3B68 800D2F68 A0820000 */   sb        $v0, ($a0)
glabel L800D2F6C_D3B6C
/* D3B6C 800D2F6C 92030034 */  lbu        $v1, 0x34($s0)
/* D3B70 800D2F70 2402006C */  addiu      $v0, $zero, 0x6c
/* D3B74 800D2F74 1062000B */  beq        $v1, $v0, .L800D2FA4
/* D3B78 800D2F78 2402004C */   addiu     $v0, $zero, 0x4c
/* D3B7C 800D2F7C 14620009 */  bne        $v1, $v0, .L800D2FA4
/* D3B80 800D2F80 2403FFF8 */   addiu     $v1, $zero, -8
/* D3B84 800D2F84 8D020000 */  lw         $v0, ($t0)
/* D3B88 800D2F88 24420007 */  addiu      $v0, $v0, 7
/* D3B8C 800D2F8C 00431024 */  and        $v0, $v0, $v1
/* D3B90 800D2F90 24430008 */  addiu      $v1, $v0, 8
/* D3B94 800D2F94 AD030000 */  sw         $v1, ($t0)
/* D3B98 800D2F98 8C430004 */  lw         $v1, 4($v0)
/* D3B9C 800D2F9C 08034BF2 */  j          .L800D2FC8
/* D3BA0 800D2FA0 8C420000 */   lw        $v0, ($v0)
.L800D2FA4:
/* D3BA4 800D2FA4 8D020000 */  lw         $v0, ($t0)
/* D3BA8 800D2FA8 2403FFFC */  addiu      $v1, $zero, -4
/* D3BAC 800D2FAC 24420003 */  addiu      $v0, $v0, 3
/* D3BB0 800D2FB0 00431024 */  and        $v0, $v0, $v1
/* D3BB4 800D2FB4 24430004 */  addiu      $v1, $v0, 4
/* D3BB8 800D2FB8 AD030000 */  sw         $v1, ($t0)
/* D3BBC 800D2FBC 8C420000 */  lw         $v0, ($v0)
/* D3BC0 800D2FC0 00401821 */  addu       $v1, $v0, $zero
/* D3BC4 800D2FC4 000217C3 */  sra        $v0, $v0, 0x1f
.L800D2FC8:
/* D3BC8 800D2FC8 AE020000 */  sw         $v0, ($s0)
/* D3BCC 800D2FCC AE030004 */  sw         $v1, 4($s0)
/* D3BD0 800D2FD0 92030034 */  lbu        $v1, 0x34($s0)
/* D3BD4 800D2FD4 24020068 */  addiu      $v0, $zero, 0x68
/* D3BD8 800D2FD8 14620008 */  bne        $v1, $v0, .L800D2FFC
/* D3BDC 800D2FDC 00000000 */   nop
/* D3BE0 800D2FE0 8E020000 */  lw         $v0, ($s0)
/* D3BE4 800D2FE4 8E030004 */  lw         $v1, 4($s0)
/* D3BE8 800D2FE8 00031400 */  sll        $v0, $v1, 0x10
/* D3BEC 800D2FEC 00022C03 */  sra        $a1, $v0, 0x10
/* D3BF0 800D2FF0 000227C3 */  sra        $a0, $v0, 0x1f
/* D3BF4 800D2FF4 AE040000 */  sw         $a0, ($s0)
/* D3BF8 800D2FF8 AE050004 */  sw         $a1, 4($s0)
.L800D2FFC:
/* D3BFC 800D2FFC 8E020000 */  lw         $v0, ($s0)
/* D3C00 800D3000 04410007 */  bgez       $v0, .L800D3020
/* D3C04 800D3004 00000000 */   nop
/* D3C08 800D3008 8E02000C */  lw         $v0, 0xc($s0)
/* D3C0C 800D300C 24430001 */  addiu      $v1, $v0, 1
/* D3C10 800D3010 01221021 */  addu       $v0, $t1, $v0
/* D3C14 800D3014 AE03000C */  sw         $v1, 0xc($s0)
/* D3C18 800D3018 08034C19 */  j          .L800D3064
/* D3C1C 800D301C 2403002D */   addiu     $v1, $zero, 0x2d
.L800D3020:
/* D3C20 800D3020 8E030030 */  lw         $v1, 0x30($s0)
/* D3C24 800D3024 30620002 */  andi       $v0, $v1, 2
/* D3C28 800D3028 10400007 */  beqz       $v0, .L800D3048
/* D3C2C 800D302C 30620001 */   andi      $v0, $v1, 1
/* D3C30 800D3030 8E02000C */  lw         $v0, 0xc($s0)
/* D3C34 800D3034 24430001 */  addiu      $v1, $v0, 1
/* D3C38 800D3038 01221021 */  addu       $v0, $t1, $v0
/* D3C3C 800D303C AE03000C */  sw         $v1, 0xc($s0)
/* D3C40 800D3040 08034C19 */  j          .L800D3064
/* D3C44 800D3044 2403002B */   addiu     $v1, $zero, 0x2b
.L800D3048:
/* D3C48 800D3048 10400044 */  beqz       $v0, .L800D315C
/* D3C4C 800D304C 00000000 */   nop
/* D3C50 800D3050 8E02000C */  lw         $v0, 0xc($s0)
/* D3C54 800D3054 24430001 */  addiu      $v1, $v0, 1
/* D3C58 800D3058 01221021 */  addu       $v0, $t1, $v0
/* D3C5C 800D305C AE03000C */  sw         $v1, 0xc($s0)
/* D3C60 800D3060 24030020 */  addiu      $v1, $zero, 0x20
.L800D3064:
/* D3C64 800D3064 08034C57 */  j          .L800D315C
/* D3C68 800D3068 A0430000 */   sb        $v1, ($v0)
glabel L800D306C_D3C6C
/* D3C6C 800D306C 92030034 */  lbu        $v1, 0x34($s0)
/* D3C70 800D3070 2402006C */  addiu      $v0, $zero, 0x6c
/* D3C74 800D3074 1062000B */  beq        $v1, $v0, .L800D30A4
/* D3C78 800D3078 2402004C */   addiu     $v0, $zero, 0x4c
/* D3C7C 800D307C 14620009 */  bne        $v1, $v0, .L800D30A4
/* D3C80 800D3080 2403FFF8 */   addiu     $v1, $zero, -8
/* D3C84 800D3084 8D020000 */  lw         $v0, ($t0)
/* D3C88 800D3088 24420007 */  addiu      $v0, $v0, 7
/* D3C8C 800D308C 00431024 */  and        $v0, $v0, $v1
/* D3C90 800D3090 24430008 */  addiu      $v1, $v0, 8
/* D3C94 800D3094 AD030000 */  sw         $v1, ($t0)
/* D3C98 800D3098 8C430004 */  lw         $v1, 4($v0)
/* D3C9C 800D309C 08034C32 */  j          .L800D30C8
/* D3CA0 800D30A0 8C420000 */   lw        $v0, ($v0)
.L800D30A4:
/* D3CA4 800D30A4 8D020000 */  lw         $v0, ($t0)
/* D3CA8 800D30A8 2403FFFC */  addiu      $v1, $zero, -4
/* D3CAC 800D30AC 24420003 */  addiu      $v0, $v0, 3
/* D3CB0 800D30B0 00431024 */  and        $v0, $v0, $v1
/* D3CB4 800D30B4 24430004 */  addiu      $v1, $v0, 4
/* D3CB8 800D30B8 AD030000 */  sw         $v1, ($t0)
/* D3CBC 800D30BC 8C420000 */  lw         $v0, ($v0)
/* D3CC0 800D30C0 00401821 */  addu       $v1, $v0, $zero
/* D3CC4 800D30C4 000217C3 */  sra        $v0, $v0, 0x1f
.L800D30C8:
/* D3CC8 800D30C8 AE020000 */  sw         $v0, ($s0)
/* D3CCC 800D30CC AE030004 */  sw         $v1, 4($s0)
/* D3CD0 800D30D0 92030034 */  lbu        $v1, 0x34($s0)
/* D3CD4 800D30D4 24020068 */  addiu      $v0, $zero, 0x68
/* D3CD8 800D30D8 14620004 */  bne        $v1, $v0, .L800D30EC
/* D3CDC 800D30DC 00001021 */   addu      $v0, $zero, $zero
/* D3CE0 800D30E0 96030006 */  lhu        $v1, 6($s0)
/* D3CE4 800D30E4 08034C3E */  j          .L800D30F8
/* D3CE8 800D30E8 00000000 */   nop
.L800D30EC:
/* D3CEC 800D30EC 14600004 */  bnez       $v1, .L800D3100
/* D3CF0 800D30F0 00000000 */   nop
/* D3CF4 800D30F4 8E030004 */  lw         $v1, 4($s0)
.L800D30F8:
/* D3CF8 800D30F8 AE020000 */  sw         $v0, ($s0)
/* D3CFC 800D30FC AE030004 */  sw         $v1, 4($s0)
.L800D3100:
/* D3D00 800D3100 8E020030 */  lw         $v0, 0x30($s0)
/* D3D04 800D3104 30420008 */  andi       $v0, $v0, 8
/* D3D08 800D3108 10400014 */  beqz       $v0, .L800D315C
/* D3D0C 800D310C 00000000 */   nop
/* D3D10 800D3110 8E02000C */  lw         $v0, 0xc($s0)
/* D3D14 800D3114 24430001 */  addiu      $v1, $v0, 1
/* D3D18 800D3118 01221021 */  addu       $v0, $t1, $v0
/* D3D1C 800D311C AE03000C */  sw         $v1, 0xc($s0)
/* D3D20 800D3120 24030030 */  addiu      $v1, $zero, 0x30
/* D3D24 800D3124 A0430000 */  sb         $v1, ($v0)
/* D3D28 800D3128 30C200FF */  andi       $v0, $a2, 0xff
/* D3D2C 800D312C 38430078 */  xori       $v1, $v0, 0x78
/* D3D30 800D3130 2C630001 */  sltiu      $v1, $v1, 1
/* D3D34 800D3134 38420058 */  xori       $v0, $v0, 0x58
/* D3D38 800D3138 2C420001 */  sltiu      $v0, $v0, 1
/* D3D3C 800D313C 00621825 */  or         $v1, $v1, $v0
/* D3D40 800D3140 10600006 */  beqz       $v1, .L800D315C
/* D3D44 800D3144 00000000 */   nop
/* D3D48 800D3148 8E02000C */  lw         $v0, 0xc($s0)
/* D3D4C 800D314C 24430001 */  addiu      $v1, $v0, 1
/* D3D50 800D3150 01221021 */  addu       $v0, $t1, $v0
/* D3D54 800D3154 AE03000C */  sw         $v1, 0xc($s0)
/* D3D58 800D3158 A0460000 */  sb         $a2, ($v0)
.L800D315C:
/* D3D5C 800D315C 8E02000C */  lw         $v0, 0xc($s0)
/* D3D60 800D3160 02002021 */  addu       $a0, $s0, $zero
/* D3D64 800D3164 30C500FF */  andi       $a1, $a2, 0xff
/* D3D68 800D3168 01221021 */  addu       $v0, $t1, $v0
/* D3D6C 800D316C 0C035174 */  jal        _Litob
/* D3D70 800D3170 AC820008 */   sw        $v0, 8($a0)
/* D3D74 800D3174 08034CE3 */  j          .L800D338C
/* D3D78 800D3178 00000000 */   nop
glabel L800D317C_D3D7C
/* D3D7C 800D317C 8D020000 */  lw         $v0, ($t0)
/* D3D80 800D3180 2403FFF8 */  addiu      $v1, $zero, -8
/* D3D84 800D3184 24420007 */  addiu      $v0, $v0, 7
/* D3D88 800D3188 00431024 */  and        $v0, $v0, $v1
/* D3D8C 800D318C 24430008 */  addiu      $v1, $v0, 8
/* D3D90 800D3190 AD030000 */  sw         $v1, ($t0)
/* D3D94 800D3194 D4400000 */  ldc1       $f0, ($v0)
/* D3D98 800D3198 F6000000 */  sdc1       $f0, ($s0)
/* D3D9C 800D319C 96020000 */  lhu        $v0, ($s0)
/* D3DA0 800D31A0 30428000 */  andi       $v0, $v0, 0x8000
/* D3DA4 800D31A4 10400007 */  beqz       $v0, .L800D31C4
/* D3DA8 800D31A8 00000000 */   nop
/* D3DAC 800D31AC 8E02000C */  lw         $v0, 0xc($s0)
/* D3DB0 800D31B0 24430001 */  addiu      $v1, $v0, 1
/* D3DB4 800D31B4 01221021 */  addu       $v0, $t1, $v0
/* D3DB8 800D31B8 AE03000C */  sw         $v1, 0xc($s0)
/* D3DBC 800D31BC 08034C82 */  j          .L800D3208
/* D3DC0 800D31C0 2403002D */   addiu     $v1, $zero, 0x2d
.L800D31C4:
/* D3DC4 800D31C4 8E030030 */  lw         $v1, 0x30($s0)
/* D3DC8 800D31C8 30620002 */  andi       $v0, $v1, 2
/* D3DCC 800D31CC 10400007 */  beqz       $v0, .L800D31EC
/* D3DD0 800D31D0 30620001 */   andi      $v0, $v1, 1
/* D3DD4 800D31D4 8E02000C */  lw         $v0, 0xc($s0)
/* D3DD8 800D31D8 24430001 */  addiu      $v1, $v0, 1
/* D3DDC 800D31DC 01221021 */  addu       $v0, $t1, $v0
/* D3DE0 800D31E0 AE03000C */  sw         $v1, 0xc($s0)
/* D3DE4 800D31E4 08034C82 */  j          .L800D3208
/* D3DE8 800D31E8 2403002B */   addiu     $v1, $zero, 0x2b
.L800D31EC:
/* D3DEC 800D31EC 10400007 */  beqz       $v0, .L800D320C
/* D3DF0 800D31F0 00000000 */   nop
/* D3DF4 800D31F4 8E02000C */  lw         $v0, 0xc($s0)
/* D3DF8 800D31F8 24430001 */  addiu      $v1, $v0, 1
/* D3DFC 800D31FC 01221021 */  addu       $v0, $t1, $v0
/* D3E00 800D3200 AE03000C */  sw         $v1, 0xc($s0)
/* D3E04 800D3204 24030020 */  addiu      $v1, $zero, 0x20
.L800D3208:
/* D3E08 800D3208 A0430000 */  sb         $v1, ($v0)
.L800D320C:
/* D3E0C 800D320C 8E02000C */  lw         $v0, 0xc($s0)
/* D3E10 800D3210 02002021 */  addu       $a0, $s0, $zero
/* D3E14 800D3214 30C500FF */  andi       $a1, $a2, 0xff
/* D3E18 800D3218 01221021 */  addu       $v0, $t1, $v0
/* D3E1C 800D321C 0C034CE8 */  jal        _Ldtob
/* D3E20 800D3220 AC820008 */   sw        $v0, 8($a0)
/* D3E24 800D3224 08034CE3 */  j          .L800D338C
/* D3E28 800D3228 00000000 */   nop
glabel L800D322C_D3E2C
/* D3E2C 800D322C 92030034 */  lbu        $v1, 0x34($s0)
/* D3E30 800D3230 24020068 */  addiu      $v0, $zero, 0x68
/* D3E34 800D3234 1462000B */  bne        $v1, $v0, .L800D3264
/* D3E38 800D3238 2402006C */   addiu     $v0, $zero, 0x6c
/* D3E3C 800D323C 8D020000 */  lw         $v0, ($t0)
/* D3E40 800D3240 2403FFFC */  addiu      $v1, $zero, -4
/* D3E44 800D3244 24420003 */  addiu      $v0, $v0, 3
/* D3E48 800D3248 00431024 */  and        $v0, $v0, $v1
/* D3E4C 800D324C 24430004 */  addiu      $v1, $v0, 4
/* D3E50 800D3250 AD030000 */  sw         $v1, ($t0)
/* D3E54 800D3254 8C430000 */  lw         $v1, ($v0)
/* D3E58 800D3258 8E02002C */  lw         $v0, 0x2c($s0)
/* D3E5C 800D325C 08034CE3 */  j          .L800D338C
/* D3E60 800D3260 A4620000 */   sh        $v0, ($v1)
.L800D3264:
/* D3E64 800D3264 1062000F */  beq        $v1, $v0, .L800D32A4
/* D3E68 800D3268 2402004C */   addiu     $v0, $zero, 0x4c
/* D3E6C 800D326C 1462000D */  bne        $v1, $v0, .L800D32A4
/* D3E70 800D3270 2402FFFC */   addiu     $v0, $zero, -4
/* D3E74 800D3274 8D040000 */  lw         $a0, ($t0)
/* D3E78 800D3278 24840003 */  addiu      $a0, $a0, 3
/* D3E7C 800D327C 00822024 */  and        $a0, $a0, $v0
/* D3E80 800D3280 24820004 */  addiu      $v0, $a0, 4
/* D3E84 800D3284 AD020000 */  sw         $v0, ($t0)
/* D3E88 800D3288 8E02002C */  lw         $v0, 0x2c($s0)
/* D3E8C 800D328C 8C840000 */  lw         $a0, ($a0)
/* D3E90 800D3290 00401821 */  addu       $v1, $v0, $zero
/* D3E94 800D3294 00001021 */  addu       $v0, $zero, $zero
/* D3E98 800D3298 AC820000 */  sw         $v0, ($a0)
/* D3E9C 800D329C 08034CE3 */  j          .L800D338C
/* D3EA0 800D32A0 AC830004 */   sw        $v1, 4($a0)
.L800D32A4:
/* D3EA4 800D32A4 8D020000 */  lw         $v0, ($t0)
/* D3EA8 800D32A8 2403FFFC */  addiu      $v1, $zero, -4
/* D3EAC 800D32AC 24420003 */  addiu      $v0, $v0, 3
/* D3EB0 800D32B0 00431024 */  and        $v0, $v0, $v1
/* D3EB4 800D32B4 24430004 */  addiu      $v1, $v0, 4
/* D3EB8 800D32B8 AD030000 */  sw         $v1, ($t0)
/* D3EBC 800D32BC 8C430000 */  lw         $v1, ($v0)
/* D3EC0 800D32C0 8E02002C */  lw         $v0, 0x2c($s0)
/* D3EC4 800D32C4 08034CE3 */  j          .L800D338C
/* D3EC8 800D32C8 AC620000 */   sw        $v0, ($v1)
glabel L800D32CC_D3ECC
/* D3ECC 800D32CC 8D040000 */  lw         $a0, ($t0)
/* D3ED0 800D32D0 2405FFFC */  addiu      $a1, $zero, -4
/* D3ED4 800D32D4 24840003 */  addiu      $a0, $a0, 3
/* D3ED8 800D32D8 00852024 */  and        $a0, $a0, $a1
/* D3EDC 800D32DC 24850004 */  addiu      $a1, $a0, 4
/* D3EE0 800D32E0 AD050000 */  sw         $a1, ($t0)
/* D3EE4 800D32E4 8C870000 */  lw         $a3, ($a0)
/* D3EE8 800D32E8 02002021 */  addu       $a0, $s0, $zero
/* D3EEC 800D32EC 24050078 */  addiu      $a1, $zero, 0x78
/* D3EF0 800D32F0 8C86000C */  lw         $a2, 0xc($a0)
/* D3EF4 800D32F4 00E01821 */  addu       $v1, $a3, $zero
/* D3EF8 800D32F8 000717C3 */  sra        $v0, $a3, 0x1f
/* D3EFC 800D32FC 01263021 */  addu       $a2, $t1, $a2
/* D3F00 800D3300 AC820000 */  sw         $v0, ($a0)
/* D3F04 800D3304 AC830004 */  sw         $v1, 4($a0)
/* D3F08 800D3308 0C035174 */  jal        _Litob
/* D3F0C 800D330C AC860008 */   sw        $a2, 8($a0)
/* D3F10 800D3310 08034CE3 */  j          .L800D338C
/* D3F14 800D3314 00000000 */   nop
glabel L800D3318_D3F18
/* D3F18 800D3318 8D020000 */  lw         $v0, ($t0)
/* D3F1C 800D331C 2403FFFC */  addiu      $v1, $zero, -4
/* D3F20 800D3320 24420003 */  addiu      $v0, $v0, 3
/* D3F24 800D3324 00431024 */  and        $v0, $v0, $v1
/* D3F28 800D3328 24430004 */  addiu      $v1, $v0, 4
/* D3F2C 800D332C AD030000 */  sw         $v1, ($t0)
/* D3F30 800D3330 8C440000 */  lw         $a0, ($v0)
/* D3F34 800D3334 0C03353E */  jal        strlen
/* D3F38 800D3338 AE040008 */   sw        $a0, 8($s0)
/* D3F3C 800D333C 8E030024 */  lw         $v1, 0x24($s0)
/* D3F40 800D3340 04600012 */  bltz       $v1, .L800D338C
/* D3F44 800D3344 AE020014 */   sw        $v0, 0x14($s0)
/* D3F48 800D3348 0062102A */  slt        $v0, $v1, $v0
/* D3F4C 800D334C 5440000F */  bnel       $v0, $zero, .L800D338C
/* D3F50 800D3350 AE030014 */   sw        $v1, 0x14($s0)
/* D3F54 800D3354 08034CE3 */  j          .L800D338C
/* D3F58 800D3358 00000000 */   nop
glabel L800D335C_D3F5C
/* D3F5C 800D335C 8E02000C */  lw         $v0, 0xc($s0)
/* D3F60 800D3360 24430001 */  addiu      $v1, $v0, 1
/* D3F64 800D3364 01221021 */  addu       $v0, $t1, $v0
/* D3F68 800D3368 AE03000C */  sw         $v1, 0xc($s0)
/* D3F6C 800D336C 24030025 */  addiu      $v1, $zero, 0x25
/* D3F70 800D3370 08034CE3 */  j          .L800D338C
/* D3F74 800D3374 A0430000 */   sb        $v1, ($v0)
.L800D3378:
glabel L800D3378_D3F78
/* D3F78 800D3378 8E02000C */  lw         $v0, 0xc($s0)
/* D3F7C 800D337C 24430001 */  addiu      $v1, $v0, 1
/* D3F80 800D3380 01221021 */  addu       $v0, $t1, $v0
/* D3F84 800D3384 AE03000C */  sw         $v1, 0xc($s0)
/* D3F88 800D3388 A0460000 */  sb         $a2, ($v0)
.L800D338C:
/* D3F8C 800D338C 8FBF0014 */  lw         $ra, 0x14($sp)
/* D3F90 800D3390 8FB00010 */  lw         $s0, 0x10($sp)
/* D3F94 800D3394 03E00008 */  jr         $ra
/* D3F98 800D3398 27BD0018 */   addiu     $sp, $sp, 0x18
/* D3F9C 800D339C 00000000 */  nop
