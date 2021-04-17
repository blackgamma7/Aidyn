.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _VirtualToPhysicalCopy
/* C35A0 800C29A0 10C0001B */  beqz       $a2, .L800C2A10
/* C35A4 800C29A4 00A03821 */   addu      $a3, $a1, $zero
/* C35A8 800C29A8 10850019 */  beq        $a0, $a1, .L800C2A10
/* C35AC 800C29AC 00000000 */   nop
/* C35B0 800C29B0 00A4082A */  slt        $at, $a1, $a0
/* C35B4 800C29B4 14200007 */  bnez       $at, .L800C29D4
/* C35B8 800C29B8 00000000 */   nop
/* C35BC 800C29BC 00861020 */  add        $v0, $a0, $a2
/* C35C0 800C29C0 00A2082A */  slt        $at, $a1, $v0
/* C35C4 800C29C4 10200003 */  beqz       $at, .L800C29D4
/* C35C8 800C29C8 00000000 */   nop
/* C35CC 800C29CC 1000005C */  b          .L800C2B40
/* C35D0 800C29D0 00000000 */   nop
.L800C29D4:
/* C35D4 800C29D4 28C10010 */  slti       $at, $a2, 0x10
/* C35D8 800C29D8 14200005 */  bnez       $at, .L800C29F0
/* C35DC 800C29DC 00000000 */   nop
/* C35E0 800C29E0 30820003 */  andi       $v0, $a0, 3
/* C35E4 800C29E4 30A30003 */  andi       $v1, $a1, 3
/* C35E8 800C29E8 1043000B */  beq        $v0, $v1, .L800C2A18
/* C35EC 800C29EC 00000000 */   nop
.L800C29F0:
/* C35F0 800C29F0 10C00007 */  beqz       $a2, .L800C2A10
/* C35F4 800C29F4 00000000 */   nop
/* C35F8 800C29F8 00861821 */  addu       $v1, $a0, $a2
.L800C29FC:
/* C35FC 800C29FC 80820000 */  lb         $v0, ($a0)
/* C3600 800C2A00 24840001 */  addiu      $a0, $a0, 1
/* C3604 800C2A04 A0A20000 */  sb         $v0, ($a1)
/* C3608 800C2A08 1483FFFC */  bne        $a0, $v1, .L800C29FC
/* C360C 800C2A0C 24A50001 */   addiu     $a1, $a1, 1
.L800C2A10:
/* C3610 800C2A10 03E00008 */  jr         $ra
/* C3614 800C2A14 00E01021 */   addu      $v0, $a3, $zero
.L800C2A18:
/* C3618 800C2A18 1040001A */  beqz       $v0, .L800C2A84
/* C361C 800C2A1C 00000000 */   nop
/* C3620 800C2A20 24010001 */  addiu      $at, $zero, 1
/* C3624 800C2A24 10410010 */  beq        $v0, $at, .L800C2A68
/* C3628 800C2A28 00000000 */   nop
/* C362C 800C2A2C 24010002 */  addiu      $at, $zero, 2
/* C3630 800C2A30 10410007 */  beq        $v0, $at, .L800C2A50
/* C3634 800C2A34 00000000 */   nop
/* C3638 800C2A38 80820000 */  lb         $v0, ($a0)
/* C363C 800C2A3C 24840001 */  addiu      $a0, $a0, 1
/* C3640 800C2A40 A0A20000 */  sb         $v0, ($a1)
/* C3644 800C2A44 24A50001 */  addiu      $a1, $a1, 1
/* C3648 800C2A48 1000000E */  b          .L800C2A84
/* C364C 800C2A4C 24C6FFFF */   addiu     $a2, $a2, -1
.L800C2A50:
/* C3650 800C2A50 84820000 */  lh         $v0, ($a0)
/* C3654 800C2A54 24840002 */  addiu      $a0, $a0, 2
/* C3658 800C2A58 A4A20000 */  sh         $v0, ($a1)
/* C365C 800C2A5C 24A50002 */  addiu      $a1, $a1, 2
/* C3660 800C2A60 10000008 */  b          .L800C2A84
/* C3664 800C2A64 24C6FFFE */   addiu     $a2, $a2, -2
.L800C2A68:
/* C3668 800C2A68 80820000 */  lb         $v0, ($a0)
/* C366C 800C2A6C 84830001 */  lh         $v1, 1($a0)
/* C3670 800C2A70 24840003 */  addiu      $a0, $a0, 3
/* C3674 800C2A74 A0A20000 */  sb         $v0, ($a1)
/* C3678 800C2A78 A4A30001 */  sh         $v1, 1($a1)
/* C367C 800C2A7C 24A50003 */  addiu      $a1, $a1, 3
/* C3680 800C2A80 24C6FFFD */  addiu      $a2, $a2, -3
.L800C2A84:
/* C3684 800C2A84 28C10020 */  slti       $at, $a2, 0x20
/* C3688 800C2A88 14200015 */  bnez       $at, .L800C2AE0
/* C368C 800C2A8C 00000000 */   nop
/* C3690 800C2A90 8C820000 */  lw         $v0, ($a0)
/* C3694 800C2A94 8C830004 */  lw         $v1, 4($a0)
/* C3698 800C2A98 8C880008 */  lw         $t0, 8($a0)
/* C369C 800C2A9C 8C89000C */  lw         $t1, 0xc($a0)
/* C36A0 800C2AA0 8C8A0010 */  lw         $t2, 0x10($a0)
/* C36A4 800C2AA4 8C8B0014 */  lw         $t3, 0x14($a0)
/* C36A8 800C2AA8 8C8C0018 */  lw         $t4, 0x18($a0)
/* C36AC 800C2AAC 8C8D001C */  lw         $t5, 0x1c($a0)
/* C36B0 800C2AB0 24840020 */  addiu      $a0, $a0, 0x20
/* C36B4 800C2AB4 ACA20000 */  sw         $v0, ($a1)
/* C36B8 800C2AB8 ACA30004 */  sw         $v1, 4($a1)
/* C36BC 800C2ABC ACA80008 */  sw         $t0, 8($a1)
/* C36C0 800C2AC0 ACA9000C */  sw         $t1, 0xc($a1)
/* C36C4 800C2AC4 ACAA0010 */  sw         $t2, 0x10($a1)
/* C36C8 800C2AC8 ACAB0014 */  sw         $t3, 0x14($a1)
/* C36CC 800C2ACC ACAC0018 */  sw         $t4, 0x18($a1)
/* C36D0 800C2AD0 ACAD001C */  sw         $t5, 0x1c($a1)
/* C36D4 800C2AD4 24A50020 */  addiu      $a1, $a1, 0x20
/* C36D8 800C2AD8 1000FFEA */  b          .L800C2A84
/* C36DC 800C2ADC 24C6FFE0 */   addiu     $a2, $a2, -0x20
.L800C2AE0:
/* C36E0 800C2AE0 28C10010 */  slti       $at, $a2, 0x10
/* C36E4 800C2AE4 1420000D */  bnez       $at, .L800C2B1C
/* C36E8 800C2AE8 00000000 */   nop
/* C36EC 800C2AEC 8C820000 */  lw         $v0, ($a0)
/* C36F0 800C2AF0 8C830004 */  lw         $v1, 4($a0)
/* C36F4 800C2AF4 8C880008 */  lw         $t0, 8($a0)
/* C36F8 800C2AF8 8C89000C */  lw         $t1, 0xc($a0)
/* C36FC 800C2AFC 24840010 */  addiu      $a0, $a0, 0x10
/* C3700 800C2B00 ACA20000 */  sw         $v0, ($a1)
/* C3704 800C2B04 ACA30004 */  sw         $v1, 4($a1)
/* C3708 800C2B08 ACA80008 */  sw         $t0, 8($a1)
/* C370C 800C2B0C ACA9000C */  sw         $t1, 0xc($a1)
/* C3710 800C2B10 24A50010 */  addiu      $a1, $a1, 0x10
/* C3714 800C2B14 1000FFF2 */  b          .L800C2AE0
/* C3718 800C2B18 24C6FFF0 */   addiu     $a2, $a2, -0x10
.L800C2B1C:
/* C371C 800C2B1C 28C10004 */  slti       $at, $a2, 4
/* C3720 800C2B20 1420FFB3 */  bnez       $at, .L800C29F0
/* C3724 800C2B24 00000000 */   nop
/* C3728 800C2B28 8C820000 */  lw         $v0, ($a0)
/* C372C 800C2B2C 24840004 */  addiu      $a0, $a0, 4
/* C3730 800C2B30 ACA20000 */  sw         $v0, ($a1)
/* C3734 800C2B34 24A50004 */  addiu      $a1, $a1, 4
/* C3738 800C2B38 1000FFF8 */  b          .L800C2B1C
/* C373C 800C2B3C 24C6FFFC */   addiu     $a2, $a2, -4
.L800C2B40:
/* C3740 800C2B40 00862020 */  add        $a0, $a0, $a2
/* C3744 800C2B44 00A62820 */  add        $a1, $a1, $a2
/* C3748 800C2B48 28C10010 */  slti       $at, $a2, 0x10
/* C374C 800C2B4C 14200005 */  bnez       $at, .L800C2B64
/* C3750 800C2B50 00000000 */   nop
/* C3754 800C2B54 30820003 */  andi       $v0, $a0, 3
/* C3758 800C2B58 30A30003 */  andi       $v1, $a1, 3
/* C375C 800C2B5C 1043000D */  beq        $v0, $v1, .L800C2B94
/* C3760 800C2B60 00000000 */   nop
.L800C2B64:
/* C3764 800C2B64 10C0FFAA */  beqz       $a2, .L800C2A10
/* C3768 800C2B68 00000000 */   nop
/* C376C 800C2B6C 2484FFFF */  addiu      $a0, $a0, -1
/* C3770 800C2B70 24A5FFFF */  addiu      $a1, $a1, -1
/* C3774 800C2B74 00861823 */  subu       $v1, $a0, $a2
.L800C2B78:
/* C3778 800C2B78 80820000 */  lb         $v0, ($a0)
/* C377C 800C2B7C 2484FFFF */  addiu      $a0, $a0, -1
/* C3780 800C2B80 A0A20000 */  sb         $v0, ($a1)
/* C3784 800C2B84 1483FFFC */  bne        $a0, $v1, .L800C2B78
/* C3788 800C2B88 24A5FFFF */   addiu     $a1, $a1, -1
/* C378C 800C2B8C 03E00008 */  jr         $ra
/* C3790 800C2B90 00E01021 */   addu      $v0, $a3, $zero
.L800C2B94:
/* C3794 800C2B94 1040001A */  beqz       $v0, .L800C2C00
/* C3798 800C2B98 00000000 */   nop
/* C379C 800C2B9C 24010003 */  addiu      $at, $zero, 3
/* C37A0 800C2BA0 10410010 */  beq        $v0, $at, .L800C2BE4
/* C37A4 800C2BA4 00000000 */   nop
/* C37A8 800C2BA8 24010002 */  addiu      $at, $zero, 2
/* C37AC 800C2BAC 10410007 */  beq        $v0, $at, .L800C2BCC
/* C37B0 800C2BB0 00000000 */   nop
/* C37B4 800C2BB4 8082FFFF */  lb         $v0, -1($a0)
/* C37B8 800C2BB8 2484FFFF */  addiu      $a0, $a0, -1
/* C37BC 800C2BBC A0A2FFFF */  sb         $v0, -1($a1)
/* C37C0 800C2BC0 24A5FFFF */  addiu      $a1, $a1, -1
/* C37C4 800C2BC4 1000000E */  b          .L800C2C00
/* C37C8 800C2BC8 24C6FFFF */   addiu     $a2, $a2, -1
.L800C2BCC:
/* C37CC 800C2BCC 8482FFFE */  lh         $v0, -2($a0)
/* C37D0 800C2BD0 2484FFFE */  addiu      $a0, $a0, -2
/* C37D4 800C2BD4 A4A2FFFE */  sh         $v0, -2($a1)
/* C37D8 800C2BD8 24A5FFFE */  addiu      $a1, $a1, -2
/* C37DC 800C2BDC 10000008 */  b          .L800C2C00
/* C37E0 800C2BE0 24C6FFFE */   addiu     $a2, $a2, -2
.L800C2BE4:
/* C37E4 800C2BE4 8082FFFF */  lb         $v0, -1($a0)
/* C37E8 800C2BE8 8483FFFD */  lh         $v1, -3($a0)
/* C37EC 800C2BEC 2484FFFD */  addiu      $a0, $a0, -3
/* C37F0 800C2BF0 A0A2FFFF */  sb         $v0, -1($a1)
/* C37F4 800C2BF4 A4A3FFFD */  sh         $v1, -3($a1)
/* C37F8 800C2BF8 24A5FFFD */  addiu      $a1, $a1, -3
/* C37FC 800C2BFC 24C6FFFD */  addiu      $a2, $a2, -3
.L800C2C00:
/* C3800 800C2C00 28C10020 */  slti       $at, $a2, 0x20
/* C3804 800C2C04 14200015 */  bnez       $at, .L800C2C5C
/* C3808 800C2C08 00000000 */   nop
/* C380C 800C2C0C 8C82FFFC */  lw         $v0, -4($a0)
/* C3810 800C2C10 8C83FFF8 */  lw         $v1, -8($a0)
/* C3814 800C2C14 8C88FFF4 */  lw         $t0, -0xc($a0)
/* C3818 800C2C18 8C89FFF0 */  lw         $t1, -0x10($a0)
/* C381C 800C2C1C 8C8AFFEC */  lw         $t2, -0x14($a0)
/* C3820 800C2C20 8C8BFFE8 */  lw         $t3, -0x18($a0)
/* C3824 800C2C24 8C8CFFE4 */  lw         $t4, -0x1c($a0)
/* C3828 800C2C28 8C8DFFE0 */  lw         $t5, -0x20($a0)
/* C382C 800C2C2C 2484FFE0 */  addiu      $a0, $a0, -0x20
/* C3830 800C2C30 ACA2FFFC */  sw         $v0, -4($a1)
/* C3834 800C2C34 ACA3FFF8 */  sw         $v1, -8($a1)
/* C3838 800C2C38 ACA8FFF4 */  sw         $t0, -0xc($a1)
/* C383C 800C2C3C ACA9FFF0 */  sw         $t1, -0x10($a1)
/* C3840 800C2C40 ACAAFFEC */  sw         $t2, -0x14($a1)
/* C3844 800C2C44 ACABFFE8 */  sw         $t3, -0x18($a1)
/* C3848 800C2C48 ACACFFE4 */  sw         $t4, -0x1c($a1)
/* C384C 800C2C4C ACADFFE0 */  sw         $t5, -0x20($a1)
/* C3850 800C2C50 24A5FFE0 */  addiu      $a1, $a1, -0x20
/* C3854 800C2C54 1000FFEA */  b          .L800C2C00
/* C3858 800C2C58 24C6FFE0 */   addiu     $a2, $a2, -0x20
.L800C2C5C:
/* C385C 800C2C5C 28C10010 */  slti       $at, $a2, 0x10
/* C3860 800C2C60 1420000D */  bnez       $at, .L800C2C98
/* C3864 800C2C64 00000000 */   nop
/* C3868 800C2C68 8C82FFFC */  lw         $v0, -4($a0)
/* C386C 800C2C6C 8C83FFF8 */  lw         $v1, -8($a0)
/* C3870 800C2C70 8C88FFF4 */  lw         $t0, -0xc($a0)
/* C3874 800C2C74 8C89FFF0 */  lw         $t1, -0x10($a0)
/* C3878 800C2C78 2484FFF0 */  addiu      $a0, $a0, -0x10
/* C387C 800C2C7C ACA2FFFC */  sw         $v0, -4($a1)
/* C3880 800C2C80 ACA3FFF8 */  sw         $v1, -8($a1)
/* C3884 800C2C84 ACA8FFF4 */  sw         $t0, -0xc($a1)
/* C3888 800C2C88 ACA9FFF0 */  sw         $t1, -0x10($a1)
/* C388C 800C2C8C 24A5FFF0 */  addiu      $a1, $a1, -0x10
/* C3890 800C2C90 1000FFF2 */  b          .L800C2C5C
/* C3894 800C2C94 24C6FFF0 */   addiu     $a2, $a2, -0x10
.L800C2C98:
/* C3898 800C2C98 28C10004 */  slti       $at, $a2, 4
/* C389C 800C2C9C 1420FFB1 */  bnez       $at, .L800C2B64
/* C38A0 800C2CA0 00000000 */   nop
/* C38A4 800C2CA4 8C82FFFC */  lw         $v0, -4($a0)
/* C38A8 800C2CA8 2484FFFC */  addiu      $a0, $a0, -4
/* C38AC 800C2CAC ACA2FFFC */  sw         $v0, -4($a1)
/* C38B0 800C2CB0 24A5FFFC */  addiu      $a1, $a1, -4
/* C38B4 800C2CB4 1000FFF8 */  b          .L800C2C98
/* C38B8 800C2CB8 24C6FFFC */   addiu     $a2, $a2, -4
/* C38BC 800C2CBC 00000000 */  nop

glabel __osContRamWrite
/* C38C0 800C2CC0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* C38C4 800C2CC4 8FA20058 */  lw         $v0, 0x58($sp)
/* C38C8 800C2CC8 AFB40030 */  sw         $s4, 0x30($sp)
/* C38CC 800C2CCC 0080A021 */  addu       $s4, $a0, $zero
/* C38D0 800C2CD0 AFB3002C */  sw         $s3, 0x2c($sp)
/* C38D4 800C2CD4 00A09821 */  addu       $s3, $a1, $zero
/* C38D8 800C2CD8 AFB50034 */  sw         $s5, 0x34($sp)
/* C38DC 800C2CDC 24150002 */  addiu      $s5, $zero, 2
/* C38E0 800C2CE0 AFB7003C */  sw         $s7, 0x3c($sp)
/* C38E4 800C2CE4 00E0B821 */  addu       $s7, $a3, $zero
/* C38E8 800C2CE8 AFB00020 */  sw         $s0, 0x20($sp)
/* C38EC 800C2CEC 00C08021 */  addu       $s0, $a2, $zero
/* C38F0 800C2CF0 3204FFFF */  andi       $a0, $s0, 0xffff
/* C38F4 800C2CF4 2C830007 */  sltiu      $v1, $a0, 7
/* C38F8 800C2CF8 AFBF0044 */  sw         $ra, 0x44($sp)
/* C38FC 800C2CFC AFBE0040 */  sw         $fp, 0x40($sp)
/* C3900 800C2D00 AFB60038 */  sw         $s6, 0x38($sp)
/* C3904 800C2D04 AFB20028 */  sw         $s2, 0x28($sp)
/* C3908 800C2D08 38420001 */  xori       $v0, $v0, 1
/* C390C 800C2D0C 0002102B */  sltu       $v0, $zero, $v0
/* C3910 800C2D10 00431024 */  and        $v0, $v0, $v1
/* C3914 800C2D14 10400003 */  beqz       $v0, .L800C2D24
/* C3918 800C2D18 AFB10024 */   sw        $s1, 0x24($sp)
/* C391C 800C2D1C 1480005D */  bnez       $a0, .L800C2E94
/* C3920 800C2D20 00001021 */   addu      $v0, $zero, $zero
.L800C2D24:
/* C3924 800C2D24 0C033265 */  jal        __osSiGetAccess
/* C3928 800C2D28 241E0003 */   addiu     $fp, $zero, 3
/* C392C 800C2D2C 3216FFFF */  andi       $s6, $s0, 0xffff
/* C3930 800C2D30 00108140 */  sll        $s0, $s0, 5
/* C3934 800C2D34 AFB00014 */  sw         $s0, 0x14($sp)
.L800C2D38:
/* C3938 800C2D38 3C02800F */  lui        $v0, %hi(__osContLastCmd)
/* C393C 800C2D3C 904257A0 */  lbu        $v0, %lo(__osContLastCmd)($v0)
/* C3940 800C2D40 3C10800F */  lui        $s0, %hi(__osPfsPifRam)
/* C3944 800C2D44 145E0005 */  bne        $v0, $fp, .L800C2D5C
/* C3948 800C2D48 26107C30 */   addiu     $s0, $s0, %lo(__osPfsPifRam)
/* C394C 800C2D4C 3C02800F */  lui        $v0, %hi(contramread_data_0000)
/* C3950 800C2D50 8C423820 */  lw         $v0, %lo(contramread_data_0000)($v0)
/* C3954 800C2D54 5053001A */  beql       $v0, $s3, .L800C2DC0
/* C3958 800C2D58 02708021 */   addu      $s0, $s3, $s0
.L800C2D5C:
/* C395C 800C2D5C 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* C3960 800C2D60 A03E57A0 */  sb         $fp, %lo(__osContLastCmd)($at)
/* C3964 800C2D64 3C01800F */  lui        $at, %hi(contramread_data_0000)
/* C3968 800C2D68 AC333820 */  sw         $s3, %lo(contramread_data_0000)($at)
/* C396C 800C2D6C 1A600006 */  blez       $s3, .L800C2D88
/* C3970 800C2D70 00001821 */   addu      $v1, $zero, $zero
.L800C2D74:
/* C3974 800C2D74 A2000000 */  sb         $zero, ($s0)
/* C3978 800C2D78 24630001 */  addiu      $v1, $v1, 1
/* C397C 800C2D7C 0073102A */  slt        $v0, $v1, $s3
/* C3980 800C2D80 1440FFFC */  bnez       $v0, .L800C2D74
/* C3984 800C2D84 26100001 */   addiu     $s0, $s0, 1
.L800C2D88:
/* C3988 800C2D88 24080001 */  addiu      $t0, $zero, 1
/* C398C 800C2D8C 3C01800F */  lui        $at, %hi(__osPfsPifRam+0x3C)
/* C3990 800C2D90 AC287C6C */  sw         $t0, %lo(__osPfsPifRam+0x3C)($at)
/* C3994 800C2D94 240800FF */  addiu      $t0, $zero, 0xff
/* C3998 800C2D98 24020023 */  addiu      $v0, $zero, 0x23
/* C399C 800C2D9C A2080000 */  sb         $t0, ($s0)
/* C39A0 800C2DA0 24080001 */  addiu      $t0, $zero, 1
/* C39A4 800C2DA4 A2080002 */  sb         $t0, 2($s0)
/* C39A8 800C2DA8 240800FF */  addiu      $t0, $zero, 0xff
/* C39AC 800C2DAC A2020001 */  sb         $v0, 1($s0)
/* C39B0 800C2DB0 240200FE */  addiu      $v0, $zero, 0xfe
/* C39B4 800C2DB4 A21E0003 */  sb         $fp, 3($s0)
/* C39B8 800C2DB8 A2080026 */  sb         $t0, 0x26($s0)
/* C39BC 800C2DBC A2020027 */  sb         $v0, 0x27($s0)
.L800C2DC0:
/* C39C0 800C2DC0 02C02021 */  addu       $a0, $s6, $zero
/* C39C4 800C2DC4 001610C2 */  srl        $v0, $s6, 3
/* C39C8 800C2DC8 0C030BB4 */  jal        __osContAddressCrc
/* C39CC 800C2DCC A2020004 */   sb        $v0, 4($s0)
/* C39D0 800C2DD0 02E02021 */  addu       $a0, $s7, $zero
/* C39D4 800C2DD4 8FA80014 */  lw         $t0, 0x14($sp)
/* C39D8 800C2DD8 26050006 */  addiu      $a1, $s0, 6
/* C39DC 800C2DDC 24060020 */  addiu      $a2, $zero, 0x20
/* C39E0 800C2DE0 00481025 */  or         $v0, $v0, $t0
/* C39E4 800C2DE4 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C39E8 800C2DE8 A2020005 */   sb        $v0, 5($s0)
/* C39EC 800C2DEC 3C05800F */  lui        $a1, %hi(__osPfsPifRam)
/* C39F0 800C2DF0 24A57C30 */  addiu      $a1, $a1, %lo(__osPfsPifRam)
/* C39F4 800C2DF4 0C0332F4 */  jal        __osSiRawStartDma
/* C39F8 800C2DF8 24040001 */   addiu     $a0, $zero, 1
/* C39FC 800C2DFC 0C030BCF */  jal        __osContDataCrc
/* C3A00 800C2E00 02E02021 */   addu      $a0, $s7, $zero
/* C3A04 800C2E04 02802021 */  addu       $a0, $s4, $zero
/* C3A08 800C2E08 00002821 */  addu       $a1, $zero, $zero
/* C3A0C 800C2E0C 24060001 */  addiu      $a2, $zero, 1
/* C3A10 800C2E10 0C0321E4 */  jal        osRecvMesg
/* C3A14 800C2E14 00409021 */   addu      $s2, $v0, $zero
/* C3A18 800C2E18 3C05800F */  lui        $a1, %hi(__osPfsPifRam)
/* C3A1C 800C2E1C 24A57C30 */  addiu      $a1, $a1, %lo(__osPfsPifRam)
/* C3A20 800C2E20 0C0332F4 */  jal        __osSiRawStartDma
/* C3A24 800C2E24 00002021 */   addu      $a0, $zero, $zero
/* C3A28 800C2E28 02802021 */  addu       $a0, $s4, $zero
/* C3A2C 800C2E2C 00002821 */  addu       $a1, $zero, $zero
/* C3A30 800C2E30 0C0321E4 */  jal        osRecvMesg
/* C3A34 800C2E34 24060001 */   addiu     $a2, $zero, 1
/* C3A38 800C2E38 92020002 */  lbu        $v0, 2($s0)
/* C3A3C 800C2E3C 304200C0 */  andi       $v0, $v0, 0xc0
/* C3A40 800C2E40 00028902 */  srl        $s1, $v0, 4
/* C3A44 800C2E44 5620000B */  bnel       $s1, $zero, .L800C2E74
/* C3A48 800C2E48 24110001 */   addiu     $s1, $zero, 1
/* C3A4C 800C2E4C 92030026 */  lbu        $v1, 0x26($s0)
/* C3A50 800C2E50 324200FF */  andi       $v0, $s2, 0xff
/* C3A54 800C2E54 10430007 */  beq        $v0, $v1, .L800C2E74
/* C3A58 800C2E58 02802021 */   addu      $a0, $s4, $zero
/* C3A5C 800C2E5C 0C031878 */  jal        __osPfsGetStatus
/* C3A60 800C2E60 02602821 */   addu      $a1, $s3, $zero
/* C3A64 800C2E64 00408821 */  addu       $s1, $v0, $zero
/* C3A68 800C2E68 16200007 */  bnez       $s1, .L800C2E88
/* C3A6C 800C2E6C 00000000 */   nop
/* C3A70 800C2E70 24110004 */  addiu      $s1, $zero, 4
.L800C2E74:
/* C3A74 800C2E74 24020004 */  addiu      $v0, $zero, 4
/* C3A78 800C2E78 16220003 */  bne        $s1, $v0, .L800C2E88
/* C3A7C 800C2E7C 02A01021 */   addu      $v0, $s5, $zero
/* C3A80 800C2E80 0441FFAD */  bgez       $v0, .L800C2D38
/* C3A84 800C2E84 26B5FFFF */   addiu     $s5, $s5, -1
.L800C2E88:
/* C3A88 800C2E88 0C033280 */  jal        _osSiRelAccess
/* C3A8C 800C2E8C 00000000 */   nop
/* C3A90 800C2E90 02201021 */  addu       $v0, $s1, $zero
.L800C2E94:
/* C3A94 800C2E94 8FBF0044 */  lw         $ra, 0x44($sp)
/* C3A98 800C2E98 8FBE0040 */  lw         $fp, 0x40($sp)
/* C3A9C 800C2E9C 8FB7003C */  lw         $s7, 0x3c($sp)
/* C3AA0 800C2EA0 8FB60038 */  lw         $s6, 0x38($sp)
/* C3AA4 800C2EA4 8FB50034 */  lw         $s5, 0x34($sp)
/* C3AA8 800C2EA8 8FB40030 */  lw         $s4, 0x30($sp)
/* C3AAC 800C2EAC 8FB3002C */  lw         $s3, 0x2c($sp)
/* C3AB0 800C2EB0 8FB20028 */  lw         $s2, 0x28($sp)
/* C3AB4 800C2EB4 8FB10024 */  lw         $s1, 0x24($sp)
/* C3AB8 800C2EB8 8FB00020 */  lw         $s0, 0x20($sp)
/* C3ABC 800C2EBC 03E00008 */  jr         $ra
/* C3AC0 800C2EC0 27BD0048 */   addiu     $sp, $sp, 0x48
/* C3AC4 800C2EC4 00000000 */  nop
/* C3AC8 800C2EC8 00000000 */  nop
/* C3ACC 800C2ECC 00000000 */  nop
