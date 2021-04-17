.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_camera_playerdata_focus
/* 975B0 800969B0 3C02800F */  lui        $v0, %hi(camera_PlayerData_A)
/* 975B4 800969B4 3C03800F */  lui        $v1, %hi(camera_PlayerData_B)
/* 975B8 800969B8 AC441DD0 */  sw         $a0, %lo(camera_PlayerData_A)($v0)
/* 975BC 800969BC 3C04800F */  lui        $a0, %hi(camera_PlayerData_flag)
/* 975C0 800969C0 24020001 */  addiu      $v0, $zero, 1
/* 975C4 800969C4 AC651DD4 */  sw         $a1, %lo(camera_PlayerData_B)($v1)
/* 975C8 800969C8 03E00008 */  jr         $ra
/* 975CC 800969CC A4821DD8 */   sh        $v0, %lo(camera_PlayerData_flag)($a0)

glabel clear_camera_playerdata_focus
/* 975D0 800969D0 3C02800F */  lui        $v0, %hi(camera_PlayerData_B)
/* 975D4 800969D4 3C03800F */  lui        $v1, %hi(camera_PlayerData_A)
/* 975D8 800969D8 AC401DD4 */  sw         $zero, %lo(camera_PlayerData_B)($v0)
/* 975DC 800969DC 3C02800F */  lui        $v0, %hi(camera_PlayerData_flag)
/* 975E0 800969E0 AC601DD0 */  sw         $zero, %lo(camera_PlayerData_A)($v1)
/* 975E4 800969E4 03E00008 */  jr         $ra
/* 975E8 800969E8 A4401DD8 */   sh        $zero, %lo(camera_PlayerData_flag)($v0)

glabel camera_collision_far
/* 975EC 800969EC 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 975F0 800969F0 AFB00050 */  sw         $s0, 0x50($sp)
/* 975F4 800969F4 00808021 */  addu       $s0, $a0, $zero
/* 975F8 800969F8 27A40010 */  addiu      $a0, $sp, 0x10
/* 975FC 800969FC AFBF0054 */  sw         $ra, 0x54($sp)
/* 97600 80096A00 C6000004 */  lwc1       $f0, 4($s0)
/* 97604 80096A04 3C01800E */  lui        $at, %hi(D_800E2850)
/* 97608 80096A08 D4222850 */  ldc1       $f2, %lo(D_800E2850)($at)
/* 9760C 80096A0C 46000021 */  cvt.d.s    $f0, $f0
/* 97610 80096A10 46220000 */  add.d      $f0, $f0, $f2
/* 97614 80096A14 00A03021 */  addu       $a2, $a1, $zero
/* 97618 80096A18 02002821 */  addu       $a1, $s0, $zero
/* 9761C 80096A1C 46200020 */  cvt.s.d    $f0, $f0
/* 97620 80096A20 0C02AB26 */  jal        Vec3A_BsubC
/* 97624 80096A24 E6000004 */   swc1      $f0, 4($s0)
/* 97628 80096A28 0C02ABBB */  jal        vec3_normalize
/* 9762C 80096A2C 27A40010 */   addiu     $a0, $sp, 0x10
/* 97630 80096A30 3C054080 */  lui        $a1, 0x4080
/* 97634 80096A34 0C02AD3C */  jal        multiVec3
/* 97638 80096A38 27A40010 */   addiu     $a0, $sp, 0x10
/* 9763C 80096A3C 02002021 */  addu       $a0, $s0, $zero
/* 97640 80096A40 00802821 */  addu       $a1, $a0, $zero
/* 97644 80096A44 0C02AB4D */  jal        vec3_sum
/* 97648 80096A48 27A60010 */   addiu     $a2, $sp, 0x10
/* 9764C 80096A4C 8FBF0054 */  lw         $ra, 0x54($sp)
/* 97650 80096A50 8FB00050 */  lw         $s0, 0x50($sp)
/* 97654 80096A54 03E00008 */  jr         $ra
/* 97658 80096A58 27BD0058 */   addiu     $sp, $sp, 0x58

glabel combat_camera_func
/* 9765C 80096A5C 27BDFF10 */  addiu      $sp, $sp, -0xf0
/* 97660 80096A60 AFB100E4 */  sw         $s1, 0xe4($sp)
/* 97664 80096A64 00808821 */  addu       $s1, $a0, $zero
/* 97668 80096A68 AFBF00E8 */  sw         $ra, 0xe8($sp)
/* 9766C 80096A6C AFB000E0 */  sw         $s0, 0xe0($sp)
/* 97670 80096A70 8E240000 */  lw         $a0, ($s1)
/* 97674 80096A74 8E220004 */  lw         $v0, 4($s1)
/* 97678 80096A78 3C01800E */  lui        $at, %hi(D_800E2858)
/* 9767C 80096A7C C4242858 */  lwc1       $f4, %lo(D_800E2858)($at)
/* 97680 80096A80 AFA40060 */  sw         $a0, 0x60($sp)
/* 97684 80096A84 AFA20064 */  sw         $v0, 0x64($sp)
/* 97688 80096A88 AFA200A4 */  sw         $v0, 0xa4($sp)
/* 9768C 80096A8C 8E230008 */  lw         $v1, 8($s1)
/* 97690 80096A90 C7A20064 */  lwc1       $f2, 0x64($sp)
/* 97694 80096A94 AFA400A0 */  sw         $a0, 0xa0($sp)
/* 97698 80096A98 00A02021 */  addu       $a0, $a1, $zero
/* 9769C 80096A9C 46041080 */  add.s      $f2, $f2, $f4
/* 976A0 80096AA0 C7A000A4 */  lwc1       $f0, 0xa4($sp)
/* 976A4 80096AA4 3C02800F */  lui        $v0, %hi(combatCameraFlag2)
/* 976A8 80096AA8 46040001 */  sub.s      $f0, $f0, $f4
/* 976AC 80096AAC AFA30068 */  sw         $v1, 0x68($sp)
/* 976B0 80096AB0 AFA300A8 */  sw         $v1, 0xa8($sp)
/* 976B4 80096AB4 94431DDC */  lhu        $v1, %lo(combatCameraFlag2)($v0)
/* 976B8 80096AB8 00408021 */  addu       $s0, $v0, $zero
/* 976BC 80096ABC E7A20064 */  swc1       $f2, 0x64($sp)
/* 976C0 80096AC0 10600003 */  beqz       $v1, .L80096AD0
/* 976C4 80096AC4 E7A000A4 */   swc1      $f0, 0xa4($sp)
/* 976C8 80096AC8 2462FFFF */  addiu      $v0, $v1, -1
/* 976CC 80096ACC A6021DDC */  sh         $v0, 0x1ddc($s0)
.L80096AD0:
/* 976D0 80096AD0 27A20020 */  addiu      $v0, $sp, 0x20
/* 976D4 80096AD4 AFA20010 */  sw         $v0, 0x10($sp)
/* 976D8 80096AD8 24020001 */  addiu      $v0, $zero, 1
/* 976DC 80096ADC 27A50060 */  addiu      $a1, $sp, 0x60
/* 976E0 80096AE0 3C073F00 */  lui        $a3, 0x3f00
/* 976E4 80096AE4 27A600A0 */  addiu      $a2, $sp, 0xa0
/* 976E8 80096AE8 AFA00014 */  sw         $zero, 0x14($sp)
/* 976EC 80096AEC 0C02B7DE */  jal        func_800ADF78
/* 976F0 80096AF0 AFA20018 */   sw        $v0, 0x18($sp)
/* 976F4 80096AF4 3043FFFF */  andi       $v1, $v0, 0xffff
/* 976F8 80096AF8 5460000B */  bnel       $v1, $zero, .L80096B28
/* 976FC 80096AFC C6200004 */   lwc1      $f0, 4($s1)
/* 97700 80096B00 96021DDC */  lhu        $v0, 0x1ddc($s0)
/* 97704 80096B04 1040001C */  beqz       $v0, .L80096B78
/* 97708 80096B08 8FBF00E8 */   lw        $ra, 0xe8($sp)
/* 9770C 80096B0C 54600006 */  bnel       $v1, $zero, .L80096B28
/* 97710 80096B10 C6200004 */   lwc1      $f0, 4($s1)
/* 97714 80096B14 10400003 */  beqz       $v0, .L80096B24
/* 97718 80096B18 3C02800F */   lui       $v0, %hi(D_800F1DE0)
/* 9771C 80096B1C C4401DE0 */  lwc1       $f0, %lo(D_800F1DE0)($v0)
/* 97720 80096B20 E7A00024 */  swc1       $f0, 0x24($sp)
.L80096B24:
/* 97724 80096B24 C6200004 */  lwc1       $f0, 4($s1)
.L80096B28:
/* 97728 80096B28 C7A20024 */  lwc1       $f2, 0x24($sp)
/* 9772C 80096B2C 46020001 */  sub.s      $f0, $f0, $f2
/* 97730 80096B30 3C01800E */  lui        $at, %hi(D_800E285C)
/* 97734 80096B34 C424285C */  lwc1       $f4, %lo(D_800E285C)($at)
/* 97738 80096B38 4604003C */  c.lt.s     $f0, $f4
/* 9773C 80096B3C 00000000 */  nop
/* 97740 80096B40 45000004 */  bc1f       .L80096B54
/* 97744 80096B44 00000000 */   nop
/* 97748 80096B48 46041000 */  add.s      $f0, $f2, $f4
/* 9774C 80096B4C E6200004 */  swc1       $f0, 4($s1)
/* 97750 80096B50 E620001C */  swc1       $f0, 0x1c($s1)
.L80096B54:
/* 97754 80096B54 10600006 */  beqz       $v1, .L80096B70
/* 97758 80096B58 C7A00024 */   lwc1      $f0, 0x24($sp)
/* 9775C 80096B5C 2402000A */  addiu      $v0, $zero, 0xa
/* 97760 80096B60 A6021DDC */  sh         $v0, 0x1ddc($s0)
/* 97764 80096B64 3C02800F */  lui        $v0, %hi(D_800F1DE0)
/* 97768 80096B68 08025ADD */  j          .L80096B74
/* 9776C 80096B6C E4401DE0 */   swc1      $f0, %lo(D_800F1DE0)($v0)
.L80096B70:
/* 97770 80096B70 A6001DDC */  sh         $zero, 0x1ddc($s0)
.L80096B74:
/* 97774 80096B74 8FBF00E8 */  lw         $ra, 0xe8($sp)
.L80096B78:
/* 97778 80096B78 8FB100E4 */  lw         $s1, 0xe4($sp)
/* 9777C 80096B7C 8FB000E0 */  lw         $s0, 0xe0($sp)
/* 97780 80096B80 03E00008 */  jr         $ra
/* 97784 80096B84 27BD00F0 */   addiu     $sp, $sp, 0xf0

glabel calc_camera_playerdata_focus
/* 97788 80096B88 3C02800F */  lui        $v0, %hi(camera_PlayerData_A)
/* 9778C 80096B8C 8C481DD0 */  lw         $t0, %lo(camera_PlayerData_A)($v0)
/* 97790 80096B90 27BDFE50 */  addiu      $sp, $sp, -0x1b0
/* 97794 80096B94 F7B401A8 */  sdc1       $f20, 0x1a8($sp)
/* 97798 80096B98 4485A000 */  mtc1       $a1, $f20
/* 9779C 80096B9C AFBF01A0 */  sw         $ra, 0x1a0($sp)
/* 977A0 80096BA0 AFB3019C */  sw         $s3, 0x19c($sp)
/* 977A4 80096BA4 AFB20198 */  sw         $s2, 0x198($sp)
/* 977A8 80096BA8 AFB10194 */  sw         $s1, 0x194($sp)
/* 977AC 80096BAC AFB00190 */  sw         $s0, 0x190($sp)
/* 977B0 80096BB0 8D030068 */  lw         $v1, 0x68($t0)
/* 977B4 80096BB4 AFA30010 */  sw         $v1, 0x10($sp)
/* 977B8 80096BB8 3C03800F */  lui        $v1, %hi(camera_PlayerData_B)
/* 977BC 80096BBC 8D02006C */  lw         $v0, 0x6c($t0)
/* 977C0 80096BC0 8C671DD4 */  lw         $a3, %lo(camera_PlayerData_B)($v1)
/* 977C4 80096BC4 AFA20014 */  sw         $v0, 0x14($sp)
/* 977C8 80096BC8 8D060070 */  lw         $a2, 0x70($t0)
/* 977CC 80096BCC 3C09800F */  lui        $t1, %hi(camera_PlayerData_flag)
/* 977D0 80096BD0 AFA60018 */  sw         $a2, 0x18($sp)
/* 977D4 80096BD4 8CE20068 */  lw         $v0, 0x68($a3)
/* 977D8 80096BD8 95261DD8 */  lhu        $a2, %lo(camera_PlayerData_flag)($t1)
/* 977DC 80096BDC AFA20050 */  sw         $v0, 0x50($sp)
/* 977E0 80096BE0 8CE3006C */  lw         $v1, 0x6c($a3)
/* 977E4 80096BE4 AFA30054 */  sw         $v1, 0x54($sp)
/* 977E8 80096BE8 8CE20070 */  lw         $v0, 0x70($a3)
/* 977EC 80096BEC AFA20058 */  sw         $v0, 0x58($sp)
/* 977F0 80096BF0 24020001 */  addiu      $v0, $zero, 1
/* 977F4 80096BF4 14C20082 */  bne        $a2, $v0, .L80096E00
/* 977F8 80096BF8 00809821 */   addu      $s3, $a0, $zero
/* 977FC 80096BFC 85040000 */  lh         $a0, ($t0)
/* 97800 80096C00 84E30000 */  lh         $v1, ($a3)
/* 97804 80096C04 24C20001 */  addiu      $v0, $a2, 1
/* 97808 80096C08 14830006 */  bne        $a0, $v1, .L80096C24
/* 9780C 80096C0C A5221DD8 */   sh        $v0, 0x1dd8($t1)
/* 97810 80096C10 C7A00010 */  lwc1       $f0, 0x10($sp)
/* 97814 80096C14 3C01800E */  lui        $at, %hi(D_800E2860)
/* 97818 80096C18 C4222860 */  lwc1       $f2, %lo(D_800E2860)($at)
/* 9781C 80096C1C 46020001 */  sub.s      $f0, $f0, $f2
/* 97820 80096C20 E7A00010 */  swc1       $f0, 0x10($sp)
.L80096C24:
/* 97824 80096C24 27A40010 */  addiu      $a0, $sp, 0x10
/* 97828 80096C28 27B20050 */  addiu      $s2, $sp, 0x50
/* 9782C 80096C2C 0C02AB66 */  jal        get_vec3_proximity
/* 97830 80096C30 02402821 */   addu      $a1, $s2, $zero
/* 97834 80096C34 3C01800E */  lui        $at, %hi(D_800E2864)
/* 97838 80096C38 C4222864 */  lwc1       $f2, %lo(D_800E2864)($at)
/* 9783C 80096C3C 4600103C */  c.lt.s     $f2, $f0
/* 97840 80096C40 00000000 */  nop
/* 97844 80096C44 45000006 */  bc1f       .L80096C60
/* 97848 80096C48 27B00090 */   addiu     $s0, $sp, 0x90
/* 9784C 80096C4C 27A40010 */  addiu      $a0, $sp, 0x10
/* 97850 80096C50 0C025A7B */  jal        camera_collision_far
/* 97854 80096C54 02402821 */   addu      $a1, $s2, $zero
/* 97858 80096C58 08025B68 */  j          .L80096DA0
/* 9785C 80096C5C 27A40010 */   addiu     $a0, $sp, 0x10
.L80096C60:
/* 97860 80096C60 02002021 */  addu       $a0, $s0, $zero
/* 97864 80096C64 27A50010 */  addiu      $a1, $sp, 0x10
/* 97868 80096C68 0C02AB26 */  jal        Vec3A_BsubC
/* 9786C 80096C6C 02403021 */   addu      $a2, $s2, $zero
/* 97870 80096C70 0C02ABBB */  jal        vec3_normalize
/* 97874 80096C74 02002021 */   addu      $a0, $s0, $zero
/* 97878 80096C78 3C01800E */  lui        $at, %hi(D_800E2868)
/* 9787C 80096C7C C4222868 */  lwc1       $f2, %lo(D_800E2868)($at)
/* 97880 80096C80 46020002 */  mul.s      $f0, $f0, $f2
/* 97884 80096C84 27B100D0 */  addiu      $s1, $sp, 0xd0
/* 97888 80096C88 8FA20090 */  lw         $v0, 0x90($sp)
/* 9788C 80096C8C 8FA30094 */  lw         $v1, 0x94($sp)
/* 97890 80096C90 8FA60098 */  lw         $a2, 0x98($sp)
/* 97894 80096C94 44050000 */  mfc1       $a1, $f0
/* 97898 80096C98 02202021 */  addu       $a0, $s1, $zero
/* 9789C 80096C9C AFA200D0 */  sw         $v0, 0xd0($sp)
/* 978A0 80096CA0 AFA300D4 */  sw         $v1, 0xd4($sp)
/* 978A4 80096CA4 0C02AD3C */  jal        multiVec3
/* 978A8 80096CA8 AFA600D8 */   sw        $a2, 0xd8($sp)
/* 978AC 80096CAC C7A000D4 */  lwc1       $f0, 0xd4($sp)
/* 978B0 80096CB0 02402021 */  addu       $a0, $s2, $zero
/* 978B4 80096CB4 46140000 */  add.s      $f0, $f0, $f20
/* 978B8 80096CB8 00802821 */  addu       $a1, $a0, $zero
/* 978BC 80096CBC 02203021 */  addu       $a2, $s1, $zero
/* 978C0 80096CC0 0C02AB4D */  jal        vec3_sum
/* 978C4 80096CC4 E7A000D4 */   swc1      $f0, 0xd4($sp)
/* 978C8 80096CC8 3C0540C0 */  lui        $a1, 0x40c0
/* 978CC 80096CCC 0C02AD3C */  jal        multiVec3
/* 978D0 80096CD0 02002021 */   addu      $a0, $s0, $zero
/* 978D4 80096CD4 C7A20050 */  lwc1       $f2, 0x50($sp)
/* 978D8 80096CD8 C7A00098 */  lwc1       $f0, 0x98($sp)
/* 978DC 80096CDC C7A40054 */  lwc1       $f4, 0x54($sp)
/* 978E0 80096CE0 46001080 */  add.s      $f2, $f2, $f0
/* 978E4 80096CE4 3C01800E */  lui        $at, %hi(D_800E286C)
/* 978E8 80096CE8 C434286C */  lwc1       $f20, %lo(D_800E286C)($at)
/* 978EC 80096CEC 46142100 */  add.s      $f4, $f4, $f20
/* 978F0 80096CF0 C7A00090 */  lwc1       $f0, 0x90($sp)
/* 978F4 80096CF4 44051000 */  mfc1       $a1, $f2
/* 978F8 80096CF8 C7A20058 */  lwc1       $f2, 0x58($sp)
/* 978FC 80096CFC 46001081 */  sub.s      $f2, $f2, $f0
/* 97900 80096D00 27B10110 */  addiu      $s1, $sp, 0x110
/* 97904 80096D04 44062000 */  mfc1       $a2, $f4
/* 97908 80096D08 44071000 */  mfc1       $a3, $f2
/* 9790C 80096D0C 0C02AD58 */  jal        setVec3
/* 97910 80096D10 02202021 */   addu      $a0, $s1, $zero
/* 97914 80096D14 C7A40050 */  lwc1       $f4, 0x50($sp)
/* 97918 80096D18 C7A00098 */  lwc1       $f0, 0x98($sp)
/* 9791C 80096D1C 46002101 */  sub.s      $f4, $f4, $f0
/* 97920 80096D20 C7A20054 */  lwc1       $f2, 0x54($sp)
/* 97924 80096D24 46141080 */  add.s      $f2, $f2, $f20
/* 97928 80096D28 C7A00090 */  lwc1       $f0, 0x90($sp)
/* 9792C 80096D2C 44052000 */  mfc1       $a1, $f4
/* 97930 80096D30 C7A40058 */  lwc1       $f4, 0x58($sp)
/* 97934 80096D34 46002100 */  add.s      $f4, $f4, $f0
/* 97938 80096D38 27B00150 */  addiu      $s0, $sp, 0x150
/* 9793C 80096D3C 44061000 */  mfc1       $a2, $f2
/* 97940 80096D40 44072000 */  mfc1       $a3, $f4
/* 97944 80096D44 0C02AD58 */  jal        setVec3
/* 97948 80096D48 02002021 */   addu      $a0, $s0, $zero
/* 9794C 80096D4C 02602021 */  addu       $a0, $s3, $zero
/* 97950 80096D50 0C02AB66 */  jal        get_vec3_proximity
/* 97954 80096D54 02202821 */   addu      $a1, $s1, $zero
/* 97958 80096D58 02602021 */  addu       $a0, $s3, $zero
/* 9795C 80096D5C 02002821 */  addu       $a1, $s0, $zero
/* 97960 80096D60 0C02AB66 */  jal        get_vec3_proximity
/* 97964 80096D64 46000506 */   mov.s     $f20, $f0
/* 97968 80096D68 4600A03C */  c.lt.s     $f20, $f0
/* 9796C 80096D6C 00000000 */  nop
/* 97970 80096D70 45000004 */  bc1f       .L80096D84
/* 97974 80096D74 8FA20110 */   lw        $v0, 0x110($sp)
/* 97978 80096D78 8FA30114 */  lw         $v1, 0x114($sp)
/* 9797C 80096D7C 08025B64 */  j          .L80096D90
/* 97980 80096D80 8FA40118 */   lw        $a0, 0x118($sp)
.L80096D84:
/* 97984 80096D84 8FA20150 */  lw         $v0, 0x150($sp)
/* 97988 80096D88 8FA30154 */  lw         $v1, 0x154($sp)
/* 9798C 80096D8C 8FA40158 */  lw         $a0, 0x158($sp)
.L80096D90:
/* 97990 80096D90 AFA20010 */  sw         $v0, 0x10($sp)
/* 97994 80096D94 AFA30014 */  sw         $v1, 0x14($sp)
/* 97998 80096D98 AFA40018 */  sw         $a0, 0x18($sp)
/* 9799C 80096D9C 27A40010 */  addiu      $a0, $sp, 0x10
.L80096DA0:
/* 979A0 80096DA0 0C02AB66 */  jal        get_vec3_proximity
/* 979A4 80096DA4 02602821 */   addu      $a1, $s3, $zero
/* 979A8 80096DA8 3C01800E */  lui        $at, %hi(D_800E2870)
/* 979AC 80096DAC C4222870 */  lwc1       $f2, %lo(D_800E2870)($at)
/* 979B0 80096DB0 4600103C */  c.lt.s     $f2, $f0
/* 979B4 80096DB4 00000000 */  nop
/* 979B8 80096DB8 45000006 */  bc1f       .L80096DD4
/* 979BC 80096DBC 8FA20010 */   lw        $v0, 0x10($sp)
/* 979C0 80096DC0 02602021 */  addu       $a0, $s3, $zero
/* 979C4 80096DC4 0C02C058 */  jal        camera_set_position
/* 979C8 80096DC8 27A50010 */   addiu     $a1, $sp, 0x10
/* 979CC 80096DCC 08025B7B */  j          .L80096DEC
/* 979D0 80096DD0 8FA20050 */   lw        $v0, 0x50($sp)
.L80096DD4:
/* 979D4 80096DD4 8FA30014 */  lw         $v1, 0x14($sp)
/* 979D8 80096DD8 8FA40018 */  lw         $a0, 0x18($sp)
/* 979DC 80096DDC AE620018 */  sw         $v0, 0x18($s3)
/* 979E0 80096DE0 AE63001C */  sw         $v1, 0x1c($s3)
/* 979E4 80096DE4 AE640020 */  sw         $a0, 0x20($s3)
/* 979E8 80096DE8 8FA20050 */  lw         $v0, 0x50($sp)
.L80096DEC:
/* 979EC 80096DEC 8FA30054 */  lw         $v1, 0x54($sp)
/* 979F0 80096DF0 8FA40058 */  lw         $a0, 0x58($sp)
/* 979F4 80096DF4 AE620024 */  sw         $v0, 0x24($s3)
/* 979F8 80096DF8 AE630028 */  sw         $v1, 0x28($s3)
/* 979FC 80096DFC AE64002C */  sw         $a0, 0x2c($s3)
.L80096E00:
/* 97A00 80096E00 3C02800E */  lui        $v0, %hi(borg_9_dat_pointer)
/* 97A04 80096E04 8C456AA8 */  lw         $a1, %lo(borg_9_dat_pointer)($v0)
/* 97A08 80096E08 0C025A97 */  jal        combat_camera_func
/* 97A0C 80096E0C 02602021 */   addu      $a0, $s3, $zero
/* 97A10 80096E10 02602021 */  addu       $a0, $s3, $zero
/* 97A14 80096E14 3C064100 */  lui        $a2, 0x4100
/* 97A18 80096E18 0C02C0DE */  jal        camera_lerp
/* 97A1C 80096E1C 26650018 */   addiu     $a1, $s3, 0x18
/* 97A20 80096E20 2664000C */  addiu      $a0, $s3, 0xc
/* 97A24 80096E24 3C064080 */  lui        $a2, 0x4080
/* 97A28 80096E28 0C02C0DE */  jal        camera_lerp
/* 97A2C 80096E2C 26650024 */   addiu     $a1, $s3, 0x24
/* 97A30 80096E30 0C02C0C6 */  jal        camera_orient
/* 97A34 80096E34 02602021 */   addu      $a0, $s3, $zero
/* 97A38 80096E38 8FBF01A0 */  lw         $ra, 0x1a0($sp)
/* 97A3C 80096E3C 8FB3019C */  lw         $s3, 0x19c($sp)
/* 97A40 80096E40 8FB20198 */  lw         $s2, 0x198($sp)
/* 97A44 80096E44 8FB10194 */  lw         $s1, 0x194($sp)
/* 97A48 80096E48 8FB00190 */  lw         $s0, 0x190($sp)
/* 97A4C 80096E4C D7B401A8 */  ldc1       $f20, 0x1a8($sp)
/* 97A50 80096E50 03E00008 */  jr         $ra
/* 97A54 80096E54 27BD01B0 */   addiu     $sp, $sp, 0x1b0

glabel func_80096E58
/* 97A58 80096E58 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 97A5C 80096E5C AFB10014 */  sw         $s1, 0x14($sp)
/* 97A60 80096E60 00008821 */  addu       $s1, $zero, $zero
/* 97A64 80096E64 AFB20018 */  sw         $s2, 0x18($sp)
/* 97A68 80096E68 00009021 */  addu       $s2, $zero, $zero
/* 97A6C 80096E6C AFB40020 */  sw         $s4, 0x20($sp)
/* 97A70 80096E70 0080A021 */  addu       $s4, $a0, $zero
/* 97A74 80096E74 AFB50024 */  sw         $s5, 0x24($sp)
/* 97A78 80096E78 00A0A821 */  addu       $s5, $a1, $zero
/* 97A7C 80096E7C AFB3001C */  sw         $s3, 0x1c($sp)
/* 97A80 80096E80 AFBF0028 */  sw         $ra, 0x28($sp)
/* 97A84 80096E84 AFB00010 */  sw         $s0, 0x10($sp)
/* 97A88 80096E88 F7B40030 */  sdc1       $f20, 0x30($sp)
/* 97A8C 80096E8C 86820000 */  lh         $v0, ($s4)
/* 97A90 80096E90 3C01800E */  lui        $at, %hi(D_800E2874)
/* 97A94 80096E94 C4342874 */  lwc1       $f20, %lo(D_800E2874)($at)
/* 97A98 80096E98 18400021 */  blez       $v0, .L80096F20
/* 97A9C 80096E9C 00C09821 */   addu      $s3, $a2, $zero
/* 97AA0 80096EA0 00111100 */  sll        $v0, $s1, 4
.L80096EA4:
/* 97AA4 80096EA4 00511023 */  subu       $v0, $v0, $s1
/* 97AA8 80096EA8 8E84000C */  lw         $a0, 0xc($s4)
/* 97AAC 80096EAC 000211C0 */  sll        $v0, $v0, 7
/* 97AB0 80096EB0 00828021 */  addu       $s0, $a0, $v0
/* 97AB4 80096EB4 86030002 */  lh         $v1, 2($s0)
/* 97AB8 80096EB8 10600014 */  beqz       $v1, .L80096F0C
/* 97ABC 80096EBC 26230001 */   addiu     $v1, $s1, 1
/* 97AC0 80096EC0 9202070A */  lbu        $v0, 0x70a($s0)
/* 97AC4 80096EC4 54400012 */  bnel       $v0, $zero, .L80096F10
/* 97AC8 80096EC8 86820000 */   lh        $v0, ($s4)
/* 97ACC 80096ECC 26A40068 */  addiu      $a0, $s5, 0x68
/* 97AD0 80096ED0 0C02AB66 */  jal        get_vec3_proximity
/* 97AD4 80096ED4 26050068 */   addiu     $a1, $s0, 0x68
/* 97AD8 80096ED8 4600A03E */  c.le.s     $f20, $f0
/* 97ADC 80096EDC 00000000 */  nop
/* 97AE0 80096EE0 4501000A */  bc1t       .L80096F0C
/* 97AE4 80096EE4 26230001 */   addiu     $v1, $s1, 1
/* 97AE8 80096EE8 8E020068 */  lw         $v0, 0x68($s0)
/* 97AEC 80096EEC AE620000 */  sw         $v0, ($s3)
/* 97AF0 80096EF0 8E03006C */  lw         $v1, 0x6c($s0)
/* 97AF4 80096EF4 24120001 */  addiu      $s2, $zero, 1
/* 97AF8 80096EF8 AE630004 */  sw         $v1, 4($s3)
/* 97AFC 80096EFC 8E020070 */  lw         $v0, 0x70($s0)
/* 97B00 80096F00 46000506 */  mov.s      $f20, $f0
/* 97B04 80096F04 AE620008 */  sw         $v0, 8($s3)
/* 97B08 80096F08 26230001 */  addiu      $v1, $s1, 1
.L80096F0C:
/* 97B0C 80096F0C 86820000 */  lh         $v0, ($s4)
.L80096F10:
/* 97B10 80096F10 3071FFFF */  andi       $s1, $v1, 0xffff
/* 97B14 80096F14 0222102A */  slt        $v0, $s1, $v0
/* 97B18 80096F18 1440FFE2 */  bnez       $v0, .L80096EA4
/* 97B1C 80096F1C 00111100 */   sll       $v0, $s1, 4
.L80096F20:
/* 97B20 80096F20 02401021 */  addu       $v0, $s2, $zero
/* 97B24 80096F24 8FBF0028 */  lw         $ra, 0x28($sp)
/* 97B28 80096F28 8FB50024 */  lw         $s5, 0x24($sp)
/* 97B2C 80096F2C 8FB40020 */  lw         $s4, 0x20($sp)
/* 97B30 80096F30 8FB3001C */  lw         $s3, 0x1c($sp)
/* 97B34 80096F34 8FB20018 */  lw         $s2, 0x18($sp)
/* 97B38 80096F38 8FB10014 */  lw         $s1, 0x14($sp)
/* 97B3C 80096F3C 8FB00010 */  lw         $s0, 0x10($sp)
/* 97B40 80096F40 D7B40030 */  ldc1       $f20, 0x30($sp)
/* 97B44 80096F44 03E00008 */  jr         $ra
/* 97B48 80096F48 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80096F4C
/* 97B4C 80096F4C 27BDFF18 */  addiu      $sp, $sp, -0xe8
/* 97B50 80096F50 AFB300DC */  sw         $s3, 0xdc($sp)
/* 97B54 80096F54 97B300FA */  lhu        $s3, 0xfa($sp)
/* 97B58 80096F58 00804021 */  addu       $t0, $a0, $zero
/* 97B5C 80096F5C AFB100D4 */  sw         $s1, 0xd4($sp)
/* 97B60 80096F60 00A08821 */  addu       $s1, $a1, $zero
/* 97B64 80096F64 AFB000D0 */  sw         $s0, 0xd0($sp)
/* 97B68 80096F68 00C08021 */  addu       $s0, $a2, $zero
/* 97B6C 80096F6C AFB200D8 */  sw         $s2, 0xd8($sp)
/* 97B70 80096F70 00E09021 */  addu       $s2, $a3, $zero
/* 97B74 80096F74 1260000A */  beqz       $s3, .L80096FA0
/* 97B78 80096F78 AFBF00E0 */   sw        $ra, 0xe0($sp)
/* 97B7C 80096F7C 02402021 */  addu       $a0, $s2, $zero
/* 97B80 80096F80 85020008 */  lh         $v0, 8($t0)
/* 97B84 80096F84 8D05000C */  lw         $a1, 0xc($t0)
/* 97B88 80096F88 00021900 */  sll        $v1, $v0, 4
/* 97B8C 80096F8C 00621823 */  subu       $v1, $v1, $v0
/* 97B90 80096F90 000319C0 */  sll        $v1, $v1, 7
/* 97B94 80096F94 00A32821 */  addu       $a1, $a1, $v1
/* 97B98 80096F98 0C02C069 */  jal        camera_set_aim
/* 97B9C 80096F9C 24A50068 */   addiu     $a1, $a1, 0x68
.L80096FA0:
/* 97BA0 80096FA0 27A40010 */  addiu      $a0, $sp, 0x10
/* 97BA4 80096FA4 26250068 */  addiu      $a1, $s1, 0x68
/* 97BA8 80096FA8 0C02AB26 */  jal        Vec3A_BsubC
/* 97BAC 80096FAC 02003021 */   addu      $a2, $s0, $zero
/* 97BB0 80096FB0 27B00050 */  addiu      $s0, $sp, 0x50
/* 97BB4 80096FB4 8FA50010 */  lw         $a1, 0x10($sp)
/* 97BB8 80096FB8 8FA60018 */  lw         $a2, 0x18($sp)
/* 97BBC 80096FBC 0C02AD55 */  jal        setVec2
/* 97BC0 80096FC0 02002021 */   addu      $a0, $s0, $zero
/* 97BC4 80096FC4 0C02AB9F */  jal        vec2_normalize
/* 97BC8 80096FC8 02002021 */   addu      $a0, $s0, $zero
/* 97BCC 80096FCC C7A80050 */  lwc1       $f8, 0x50($sp)
/* 97BD0 80096FD0 3C01800E */  lui        $at, %hi(D_800E2878)
/* 97BD4 80096FD4 C4242878 */  lwc1       $f4, %lo(D_800E2878)($at)
/* 97BD8 80096FD8 46044202 */  mul.s      $f8, $f8, $f4
/* 97BDC 80096FDC 8E22006C */  lw         $v0, 0x6c($s1)
/* 97BE0 80096FE0 C7A60054 */  lwc1       $f6, 0x54($sp)
/* 97BE4 80096FE4 3C01800E */  lui        $at, %hi(D_800E2880)
/* 97BE8 80096FE8 D4222880 */  ldc1       $f2, %lo(D_800E2880)($at)
/* 97BEC 80096FEC 46043182 */  mul.s      $f6, $f6, $f4
/* 97BF0 80096FF0 AFA20094 */  sw         $v0, 0x94($sp)
/* 97BF4 80096FF4 C7A00094 */  lwc1       $f0, 0x94($sp)
/* 97BF8 80096FF8 8E220068 */  lw         $v0, 0x68($s1)
/* 97BFC 80096FFC 46000021 */  cvt.d.s    $f0, $f0
/* 97C00 80097000 46220000 */  add.d      $f0, $f0, $f2
/* 97C04 80097004 AFA20090 */  sw         $v0, 0x90($sp)
/* 97C08 80097008 8E220070 */  lw         $v0, 0x70($s1)
/* 97C0C 8009700C C7A40090 */  lwc1       $f4, 0x90($sp)
/* 97C10 80097010 AFA20098 */  sw         $v0, 0x98($sp)
/* 97C14 80097014 46082100 */  add.s      $f4, $f4, $f8
/* 97C18 80097018 C7A20098 */  lwc1       $f2, 0x98($sp)
/* 97C1C 8009701C 46200020 */  cvt.s.d    $f0, $f0
/* 97C20 80097020 46061080 */  add.s      $f2, $f2, $f6
/* 97C24 80097024 E7A00094 */  swc1       $f0, 0x94($sp)
/* 97C28 80097028 E7A40090 */  swc1       $f4, 0x90($sp)
/* 97C2C 8009702C 12600006 */  beqz       $s3, .L80097048
/* 97C30 80097030 E7A20098 */   swc1      $f2, 0x98($sp)
/* 97C34 80097034 02402021 */  addu       $a0, $s2, $zero
/* 97C38 80097038 0C02C058 */  jal        camera_set_position
/* 97C3C 8009703C 27A50090 */   addiu     $a1, $sp, 0x90
/* 97C40 80097040 08025C19 */  j          .L80097064
/* 97C44 80097044 8FBF00E0 */   lw        $ra, 0xe0($sp)
.L80097048:
/* 97C48 80097048 8FA20090 */  lw         $v0, 0x90($sp)
/* 97C4C 8009704C 8FA30094 */  lw         $v1, 0x94($sp)
/* 97C50 80097050 8FA40098 */  lw         $a0, 0x98($sp)
/* 97C54 80097054 AE420018 */  sw         $v0, 0x18($s2)
/* 97C58 80097058 AE43001C */  sw         $v1, 0x1c($s2)
/* 97C5C 8009705C AE440020 */  sw         $a0, 0x20($s2)
/* 97C60 80097060 8FBF00E0 */  lw         $ra, 0xe0($sp)
.L80097064:
/* 97C64 80097064 8FB300DC */  lw         $s3, 0xdc($sp)
/* 97C68 80097068 8FB200D8 */  lw         $s2, 0xd8($sp)
/* 97C6C 8009706C 8FB100D4 */  lw         $s1, 0xd4($sp)
/* 97C70 80097070 8FB000D0 */  lw         $s0, 0xd0($sp)
/* 97C74 80097074 03E00008 */  jr         $ra
/* 97C78 80097078 27BD00E8 */   addiu     $sp, $sp, 0xe8

glabel processCombatCamera
/* 97C7C 8009707C 27BDFD88 */  addiu      $sp, $sp, -0x278
/* 97C80 80097080 AFB20248 */  sw         $s2, 0x248($sp)
/* 97C84 80097084 00809021 */  addu       $s2, $a0, $zero
/* 97C88 80097088 AFBF0260 */  sw         $ra, 0x260($sp)
/* 97C8C 8009708C AFB7025C */  sw         $s7, 0x25c($sp)
/* 97C90 80097090 AFB60258 */  sw         $s6, 0x258($sp)
/* 97C94 80097094 AFB50254 */  sw         $s5, 0x254($sp)
/* 97C98 80097098 AFB40250 */  sw         $s4, 0x250($sp)
/* 97C9C 8009709C AFB3024C */  sw         $s3, 0x24c($sp)
/* 97CA0 800970A0 AFB10244 */  sw         $s1, 0x244($sp)
/* 97CA4 800970A4 AFB00240 */  sw         $s0, 0x240($sp)
/* 97CA8 800970A8 F7B60270 */  sdc1       $f22, 0x270($sp)
/* 97CAC 800970AC F7B40268 */  sdc1       $f20, 0x268($sp)
/* 97CB0 800970B0 8E540004 */  lw         $s4, 4($s2)
/* 97CB4 800970B4 24050004 */  addiu      $a1, $zero, 4
/* 97CB8 800970B8 0C02C4D5 */  jal        set_camera_mode
/* 97CBC 800970BC 02802021 */   addu      $a0, $s4, $zero
/* 97CC0 800970C0 3C11800F */  lui        $s1, %hi(some_combat_flag)
/* 97CC4 800970C4 96221DDA */  lhu        $v0, %lo(some_combat_flag)($s1)
/* 97CC8 800970C8 10400022 */  beqz       $v0, .L80097154
/* 97CCC 800970CC 3C02800F */   lui       $v0, %hi(combatPointer)
/* 97CD0 800970D0 8C44F760 */  lw         $a0, %lo(combatPointer)($v0)
/* 97CD4 800970D4 3C03800E */  lui        $v1, %hi(gGlobals)
/* 97CD8 800970D8 8C82002C */  lw         $v0, 0x2c($a0)
/* 97CDC 800970DC 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 97CE0 800970E0 90420020 */  lbu        $v0, 0x20($v0)
/* 97CE4 800970E4 246513FC */  addiu      $a1, $v1, 0x13fc
/* 97CE8 800970E8 00021080 */  sll        $v0, $v0, 2
/* 97CEC 800970EC 00451021 */  addu       $v0, $v0, $a1
/* 97CF0 800970F0 8C500000 */  lw         $s0, ($v0)
/* 97CF4 800970F4 9203070A */  lbu        $v1, 0x70a($s0)
/* 97CF8 800970F8 54600007 */  bnel       $v1, $zero, .L80097118
/* 97CFC 800970FC 02402021 */   addu      $a0, $s2, $zero
/* 97D00 80097100 8C8252D0 */  lw         $v0, 0x52d0($a0)
/* 97D04 80097104 90420020 */  lbu        $v0, 0x20($v0)
/* 97D08 80097108 00021080 */  sll        $v0, $v0, 2
/* 97D0C 8009710C 00451021 */  addu       $v0, $v0, $a1
/* 97D10 80097110 8C500000 */  lw         $s0, ($v0)
/* 97D14 80097114 02402021 */  addu       $a0, $s2, $zero
.L80097118:
/* 97D18 80097118 02002821 */  addu       $a1, $s0, $zero
/* 97D1C 8009711C 0C025B96 */  jal        func_80096E58
/* 97D20 80097120 27A60040 */   addiu     $a2, $sp, 0x40
/* 97D24 80097124 10400007 */  beqz       $v0, .L80097144
/* 97D28 80097128 24020001 */   addiu     $v0, $zero, 1
/* 97D2C 8009712C AFA20010 */  sw         $v0, 0x10($sp)
/* 97D30 80097130 02402021 */  addu       $a0, $s2, $zero
/* 97D34 80097134 02002821 */  addu       $a1, $s0, $zero
/* 97D38 80097138 27A60040 */  addiu      $a2, $sp, 0x40
/* 97D3C 8009713C 0C025BD3 */  jal        func_80096F4C
/* 97D40 80097140 02803821 */   addu      $a3, $s4, $zero
.L80097144:
/* 97D44 80097144 3C03800F */  lui        $v1, %hi(D_800F1DE4)
/* 97D48 80097148 2402FFFF */  addiu      $v0, $zero, -1
/* 97D4C 8009714C A6201DDA */  sh         $zero, 0x1dda($s1)
/* 97D50 80097150 A4621DE4 */  sh         $v0, %lo(D_800F1DE4)($v1)
.L80097154:
/* 97D54 80097154 3C02800F */  lui        $v0, %hi(camera_PlayerData_flag)
/* 97D58 80097158 94431DD8 */  lhu        $v1, %lo(camera_PlayerData_flag)($v0)
/* 97D5C 8009715C 10600011 */  beqz       $v1, .L800971A4
/* 97D60 80097160 3C03800F */   lui       $v1, %hi(EntityPointer)
/* 97D64 80097164 86450008 */  lh         $a1, 8($s2)
/* 97D68 80097168 8C6413A0 */  lw         $a0, %lo(EntityPointer)($v1)
/* 97D6C 8009716C 8E50000C */  lw         $s0, 0xc($s2)
/* 97D70 80097170 00051100 */  sll        $v0, $a1, 4
/* 97D74 80097174 00451023 */  subu       $v0, $v0, $a1
/* 97D78 80097178 000211C0 */  sll        $v0, $v0, 7
/* 97D7C 8009717C 02028021 */  addu       $s0, $s0, $v0
/* 97D80 80097180 0C01D650 */  jal        sub_ent_2float_sum
/* 97D84 80097184 96050756 */   lhu       $a1, 0x756($s0)
/* 97D88 80097188 C6020034 */  lwc1       $f2, 0x34($s0)
/* 97D8C 8009718C 46020001 */  sub.s      $f0, $f0, $f2
/* 97D90 80097190 44050000 */  mfc1       $a1, $f0
/* 97D94 80097194 0C025AE2 */  jal        calc_camera_playerdata_focus
/* 97D98 80097198 02802021 */   addu      $a0, $s4, $zero
/* 97D9C 8009719C 08025D2D */  j          .L800974B4
/* 97DA0 800971A0 8FBF0260 */   lw        $ra, 0x260($sp)
.L800971A4:
/* 97DA4 800971A4 86420008 */  lh         $v0, 8($s2)
/* 97DA8 800971A8 2407FFFF */  addiu      $a3, $zero, -1
/* 97DAC 800971AC 104700C0 */  beq        $v0, $a3, .L800974B0
/* 97DB0 800971B0 3C06800F */   lui       $a2, %hi(combatPointer)
/* 97DB4 800971B4 00009821 */  addu       $s3, $zero, $zero
/* 97DB8 800971B8 8CC2F760 */  lw         $v0, %lo(combatPointer)($a2)
/* 97DBC 800971BC 3C05800E */  lui        $a1, %hi(gGlobals)
/* 97DC0 800971C0 8C44002C */  lw         $a0, 0x2c($v0)
/* 97DC4 800971C4 24A368A8 */  addiu      $v1, $a1, %lo(gGlobals)
/* 97DC8 800971C8 90820020 */  lbu        $v0, 0x20($a0)
/* 97DCC 800971CC 00C0A821 */  addu       $s5, $a2, $zero
/* 97DD0 800971D0 00021080 */  sll        $v0, $v0, 2
/* 97DD4 800971D4 00621821 */  addu       $v1, $v1, $v0
/* 97DD8 800971D8 8C7113FC */  lw         $s1, 0x13fc($v1)
/* 97DDC 800971DC 12200019 */  beqz       $s1, .L80097244
/* 97DE0 800971E0 00A0B821 */   addu      $s7, $a1, $zero
/* 97DE4 800971E4 9222070A */  lbu        $v0, 0x70a($s1)
/* 97DE8 800971E8 10400016 */  beqz       $v0, .L80097244
/* 97DEC 800971EC 2C530001 */   sltiu     $s3, $v0, 1
/* 97DF0 800971F0 3C05800F */  lui        $a1, %hi(D_800F1DE4)
/* 97DF4 800971F4 84A31DE4 */  lh         $v1, %lo(D_800F1DE4)($a1)
/* 97DF8 800971F8 10670005 */  beq        $v1, $a3, .L80097210
/* 97DFC 800971FC 96240000 */   lhu       $a0, ($s1)
/* 97E00 80097200 00041400 */  sll        $v0, $a0, 0x10
/* 97E04 80097204 00021403 */  sra        $v0, $v0, 0x10
/* 97E08 80097208 1062000E */  beq        $v1, $v0, .L80097244
/* 97E0C 8009720C 00000000 */   nop
.L80097210:
/* 97E10 80097210 A4A41DE4 */  sh         $a0, 0x1de4($a1)
/* 97E14 80097214 02402021 */  addu       $a0, $s2, $zero
/* 97E18 80097218 02202821 */  addu       $a1, $s1, $zero
/* 97E1C 8009721C 27B00080 */  addiu      $s0, $sp, 0x80
/* 97E20 80097220 0C025B96 */  jal        func_80096E58
/* 97E24 80097224 02003021 */   addu      $a2, $s0, $zero
/* 97E28 80097228 10400006 */  beqz       $v0, .L80097244
/* 97E2C 8009722C 02402021 */   addu      $a0, $s2, $zero
/* 97E30 80097230 AFA00010 */  sw         $zero, 0x10($sp)
/* 97E34 80097234 02202821 */  addu       $a1, $s1, $zero
/* 97E38 80097238 02003021 */  addu       $a2, $s0, $zero
/* 97E3C 8009723C 0C025BD3 */  jal        func_80096F4C
/* 97E40 80097240 02803821 */   addu      $a3, $s4, $zero
.L80097244:
/* 97E44 80097244 3C01800E */  lui        $at, %hi(D_800E2888)
/* 97E48 80097248 C4362888 */  lwc1       $f22, %lo(D_800E2888)($at)
/* 97E4C 8009724C 86430008 */  lh         $v1, 8($s2)
/* 97E50 80097250 3C01800E */  lui        $at, %hi(D_800E288C)
/* 97E54 80097254 C434288C */  lwc1       $f20, %lo(D_800E288C)($at)
/* 97E58 80097258 8E44000C */  lw         $a0, 0xc($s2)
/* 97E5C 8009725C 00031100 */  sll        $v0, $v1, 4
/* 97E60 80097260 00431023 */  subu       $v0, $v0, $v1
/* 97E64 80097264 000211C0 */  sll        $v0, $v0, 7
/* 97E68 80097268 00441021 */  addu       $v0, $v0, $a0
/* 97E6C 8009726C 8C430068 */  lw         $v1, 0x68($v0)
/* 97E70 80097270 24420068 */  addiu      $v0, $v0, 0x68
/* 97E74 80097274 AFA300C0 */  sw         $v1, 0xc0($sp)
/* 97E78 80097278 8C430004 */  lw         $v1, 4($v0)
/* 97E7C 8009727C AFA300C4 */  sw         $v1, 0xc4($sp)
/* 97E80 80097280 8C440008 */  lw         $a0, 8($v0)
/* 97E84 80097284 AFA400C8 */  sw         $a0, 0xc8($sp)
/* 97E88 80097288 8E820018 */  lw         $v0, 0x18($s4)
/* 97E8C 8009728C AFA20100 */  sw         $v0, 0x100($sp)
/* 97E90 80097290 8E83001C */  lw         $v1, 0x1c($s4)
/* 97E94 80097294 AFA30104 */  sw         $v1, 0x104($sp)
/* 97E98 80097298 8E840020 */  lw         $a0, 0x20($s4)
/* 97E9C 8009729C 26E268A8 */  addiu      $v0, $s7, 0x68a8
/* 97EA0 800972A0 AFA40108 */  sw         $a0, 0x108($sp)
/* 97EA4 800972A4 904413C8 */  lbu        $a0, 0x13c8($v0)
/* 97EA8 800972A8 24030012 */  addiu      $v1, $zero, 0x12
/* 97EAC 800972AC 10830004 */  beq        $a0, $v1, .L800972C0
/* 97EB0 800972B0 24160001 */   addiu     $s6, $zero, 1
/* 97EB4 800972B4 2402000B */  addiu      $v0, $zero, 0xb
/* 97EB8 800972B8 1482000C */  bne        $a0, $v0, .L800972EC
/* 97EBC 800972BC 24020009 */   addiu     $v0, $zero, 9
.L800972C0:
/* 97EC0 800972C0 3C01800E */  lui        $at, %hi(D_800E2890)
/* 97EC4 800972C4 C4362890 */  lwc1       $f22, %lo(D_800E2890)($at)
/* 97EC8 800972C8 8EA2F760 */  lw         $v0, -0x8a0($s5)
/* 97ECC 800972CC 3C01800E */  lui        $at, %hi(D_800E2894)
/* 97ED0 800972D0 C4342894 */  lwc1       $f20, %lo(D_800E2894)($at)
/* 97ED4 800972D4 C4400018 */  lwc1       $f0, 0x18($v0)
/* 97ED8 800972D8 E7A000C0 */  swc1       $f0, 0xc0($sp)
/* 97EDC 800972DC C442001C */  lwc1       $f2, 0x1c($v0)
/* 97EE0 800972E0 00009821 */  addu       $s3, $zero, $zero
/* 97EE4 800972E4 E7A200C8 */  swc1       $f2, 0xc8($sp)
/* 97EE8 800972E8 24020009 */  addiu      $v0, $zero, 9
.L800972EC:
/* 97EEC 800972EC 14820014 */  bne        $a0, $v0, .L80097340
/* 97EF0 800972F0 27B000C0 */   addiu     $s0, $sp, 0xc0
/* 97EF4 800972F4 02002021 */  addu       $a0, $s0, $zero
/* 97EF8 800972F8 0C02AB66 */  jal        get_vec3_proximity
/* 97EFC 800972FC 26250068 */   addiu     $a1, $s1, 0x68
/* 97F00 80097300 3C01800E */  lui        $at, %hi(D_800E2898)
/* 97F04 80097304 C4222898 */  lwc1       $f2, %lo(D_800E2898)($at)
/* 97F08 80097308 4600103C */  c.lt.s     $f2, $f0
/* 97F0C 8009730C 00000000 */  nop
/* 97F10 80097310 4500000B */  bc1f       .L80097340
/* 97F14 80097314 02002821 */   addu      $a1, $s0, $zero
/* 97F18 80097318 0000B021 */  addu       $s6, $zero, $zero
/* 97F1C 8009731C 8E220068 */  lw         $v0, 0x68($s1)
/* 97F20 80097320 00009821 */  addu       $s3, $zero, $zero
/* 97F24 80097324 AE820018 */  sw         $v0, 0x18($s4)
/* 97F28 80097328 8E23006C */  lw         $v1, 0x6c($s1)
/* 97F2C 8009732C 26840018 */  addiu      $a0, $s4, 0x18
/* 97F30 80097330 AE83001C */  sw         $v1, 0x1c($s4)
/* 97F34 80097334 8E220070 */  lw         $v0, 0x70($s1)
/* 97F38 80097338 0C025A7B */  jal        camera_collision_far
/* 97F3C 8009733C AE820020 */   sw        $v0, 0x20($s4)
.L80097340:
/* 97F40 80097340 02802021 */  addu       $a0, $s4, $zero
/* 97F44 80097344 02002821 */  addu       $a1, $s0, $zero
/* 97F48 80097348 26F568A8 */  addiu      $s5, $s7, 0x68a8
/* 97F4C 8009734C 86430008 */  lh         $v1, 8($s2)
/* 97F50 80097350 8E46000C */  lw         $a2, 0xc($s2)
/* 97F54 80097354 C6A2000C */  lwc1       $f2, 0xc($s5)
/* 97F58 80097358 3C01800E */  lui        $at, %hi(D_800E289C)
/* 97F5C 8009735C C42A289C */  lwc1       $f10, %lo(D_800E289C)($at)
/* 97F60 80097360 3C01800E */  lui        $at, %hi(D_800E28A0)
/* 97F64 80097364 C42428A0 */  lwc1       $f4, %lo(D_800E28A0)($at)
/* 97F68 80097368 3C01800E */  lui        $at, %hi(D_800E28A4)
/* 97F6C 8009736C C42628A4 */  lwc1       $f6, %lo(D_800E28A4)($at)
/* 97F70 80097370 3C01800E */  lui        $at, %hi(D_800E28A8)
/* 97F74 80097374 C42828A8 */  lwc1       $f8, %lo(D_800E28A8)($at)
/* 97F78 80097378 00031100 */  sll        $v0, $v1, 4
/* 97F7C 8009737C 00431023 */  subu       $v0, $v0, $v1
/* 97F80 80097380 000211C0 */  sll        $v0, $v0, 7
/* 97F84 80097384 00461021 */  addu       $v0, $v0, $a2
/* 97F88 80097388 C4400020 */  lwc1       $f0, 0x20($v0)
/* 97F8C 8009738C 27A60140 */  addiu      $a2, $sp, 0x140
/* 97F90 80097390 AFA00144 */  sw         $zero, 0x144($sp)
/* 97F94 80097394 E7A00140 */  swc1       $f0, 0x140($sp)
/* 97F98 80097398 4600100D */  trunc.w.s  $f0, $f2
/* 97F9C 8009739C 44070000 */  mfc1       $a3, $f0
/* 97FA0 800973A0 00073C00 */  sll        $a3, $a3, 0x10
/* 97FA4 800973A4 C44C0024 */  lwc1       $f12, 0x24($v0)
/* 97FA8 800973A8 3C01800E */  lui        $at, %hi(D_800E28AC)
/* 97FAC 800973AC C42028AC */  lwc1       $f0, %lo(D_800E28AC)($at)
/* 97FB0 800973B0 3C01800E */  lui        $at, %hi(D_800E28B0)
/* 97FB4 800973B4 C42228B0 */  lwc1       $f2, %lo(D_800E28B0)($at)
/* 97FB8 800973B8 00073C03 */  sra        $a3, $a3, 0x10
/* 97FBC 800973BC E7B60010 */  swc1       $f22, 0x10($sp)
/* 97FC0 800973C0 E7B40014 */  swc1       $f20, 0x14($sp)
/* 97FC4 800973C4 E7AA0018 */  swc1       $f10, 0x18($sp)
/* 97FC8 800973C8 E7A40028 */  swc1       $f4, 0x28($sp)
/* 97FCC 800973CC E7A6002C */  swc1       $f6, 0x2c($sp)
/* 97FD0 800973D0 E7A80030 */  swc1       $f8, 0x30($sp)
/* 97FD4 800973D4 E7AA0034 */  swc1       $f10, 0x34($sp)
/* 97FD8 800973D8 AFA00038 */  sw         $zero, 0x38($sp)
/* 97FDC 800973DC AFB6003C */  sw         $s6, 0x3c($sp)
/* 97FE0 800973E0 E7A0001C */  swc1       $f0, 0x1c($sp)
/* 97FE4 800973E4 E7A20020 */  swc1       $f2, 0x20($sp)
/* 97FE8 800973E8 E7A00024 */  swc1       $f0, 0x24($sp)
/* 97FEC 800973EC 0C02C1B2 */  jal        ProcessGameCamera_mode1
/* 97FF0 800973F0 E7AC0148 */   swc1      $f12, 0x148($sp)
/* 97FF4 800973F4 8EA50200 */  lw         $a1, 0x200($s5)
/* 97FF8 800973F8 0C025A97 */  jal        combat_camera_func
/* 97FFC 800973FC 02802021 */   addu      $a0, $s4, $zero
/* 98000 80097400 1260002B */  beqz       $s3, .L800974B0
/* 98004 80097404 27B301C0 */   addiu     $s3, $sp, 0x1c0
/* 98008 80097408 8E85000C */  lw         $a1, 0xc($s4)
/* 9800C 8009740C 8E860014 */  lw         $a2, 0x14($s4)
/* 98010 80097410 0C02AD55 */  jal        setVec2
/* 98014 80097414 02602021 */   addu      $a0, $s3, $zero
/* 98018 80097418 27B20200 */  addiu      $s2, $sp, 0x200
/* 9801C 8009741C 8FA50100 */  lw         $a1, 0x100($sp)
/* 98020 80097420 8FA60108 */  lw         $a2, 0x108($sp)
/* 98024 80097424 0C02AD55 */  jal        setVec2
/* 98028 80097428 02402021 */   addu      $a0, $s2, $zero
/* 9802C 8009742C 27B00180 */  addiu      $s0, $sp, 0x180
/* 98030 80097430 02002021 */  addu       $a0, $s0, $zero
/* 98034 80097434 02402821 */  addu       $a1, $s2, $zero
/* 98038 80097438 0C02AB1D */  jal        Vec2_Sub
/* 9803C 8009743C 02603021 */   addu      $a2, $s3, $zero
/* 98040 80097440 0C02AB9F */  jal        vec2_normalize
/* 98044 80097444 02002021 */   addu      $a0, $s0, $zero
/* 98048 80097448 3C01800E */  lui        $at, %hi(D_800E28B4)
/* 9804C 8009744C C42228B4 */  lwc1       $f2, %lo(D_800E28B4)($at)
/* 98050 80097450 4602003C */  c.lt.s     $f0, $f2
/* 98054 80097454 00000000 */  nop
/* 98058 80097458 4500000D */  bc1f       .L80097490
/* 9805C 8009745C 27B10100 */   addiu     $s1, $sp, 0x100
/* 98060 80097460 44051000 */  mfc1       $a1, $f2
/* 98064 80097464 0C02AD34 */  jal        multiVec2
/* 98068 80097468 02002021 */   addu      $a0, $s0, $zero
/* 9806C 8009746C 02402021 */  addu       $a0, $s2, $zero
/* 98070 80097470 02602821 */  addu       $a1, $s3, $zero
/* 98074 80097474 0C02AB44 */  jal        vec2_sum
/* 98078 80097478 02003021 */   addu      $a2, $s0, $zero
/* 9807C 8009747C 8FA50200 */  lw         $a1, 0x200($sp)
/* 98080 80097480 8FA60104 */  lw         $a2, 0x104($sp)
/* 98084 80097484 8FA70204 */  lw         $a3, 0x204($sp)
/* 98088 80097488 0C02AD58 */  jal        setVec3
/* 9808C 8009748C 02202021 */   addu      $a0, $s1, $zero
.L80097490:
/* 98090 80097490 02802021 */  addu       $a0, $s4, $zero
/* 98094 80097494 0C02C058 */  jal        camera_set_position
/* 98098 80097498 02202821 */   addu      $a1, $s1, $zero
/* 9809C 8009749C 8EA50200 */  lw         $a1, 0x200($s5)
/* 980A0 800974A0 0C025A97 */  jal        combat_camera_func
/* 980A4 800974A4 02802021 */   addu      $a0, $s4, $zero
/* 980A8 800974A8 0C02C0C6 */  jal        camera_orient
/* 980AC 800974AC 02802021 */   addu      $a0, $s4, $zero
.L800974B0:
/* 980B0 800974B0 8FBF0260 */  lw         $ra, 0x260($sp)
.L800974B4:
/* 980B4 800974B4 8FB7025C */  lw         $s7, 0x25c($sp)
/* 980B8 800974B8 8FB60258 */  lw         $s6, 0x258($sp)
/* 980BC 800974BC 8FB50254 */  lw         $s5, 0x254($sp)
/* 980C0 800974C0 8FB40250 */  lw         $s4, 0x250($sp)
/* 980C4 800974C4 8FB3024C */  lw         $s3, 0x24c($sp)
/* 980C8 800974C8 8FB20248 */  lw         $s2, 0x248($sp)
/* 980CC 800974CC 8FB10244 */  lw         $s1, 0x244($sp)
/* 980D0 800974D0 8FB00240 */  lw         $s0, 0x240($sp)
/* 980D4 800974D4 D7B60270 */  ldc1       $f22, 0x270($sp)
/* 980D8 800974D8 D7B40268 */  ldc1       $f20, 0x268($sp)
/* 980DC 800974DC 03E00008 */  jr         $ra
/* 980E0 800974E0 27BD0278 */   addiu     $sp, $sp, 0x278
/* 980E4 800974E4 00000000 */  nop
/* 980E8 800974E8 00000000 */  nop
/* 980EC 800974EC 00000000 */  nop
