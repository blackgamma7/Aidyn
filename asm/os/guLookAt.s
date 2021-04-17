.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guLookAtReflectF
/* C46C0 800C3AC0 27BDFF98 */  addiu      $sp, $sp, -0x68
/* C46C4 800C3AC4 F7BC0058 */  sdc1       $f28, 0x58($sp)
/* C46C8 800C3AC8 C7BC0088 */  lwc1       $f28, 0x88($sp)
/* C46CC 800C3ACC F7BE0060 */  sdc1       $f30, 0x60($sp)
/* C46D0 800C3AD0 C7BE008C */  lwc1       $f30, 0x8c($sp)
/* C46D4 800C3AD4 F7BA0050 */  sdc1       $f26, 0x50($sp)
/* C46D8 800C3AD8 C7BA0090 */  lwc1       $f26, 0x90($sp)
/* C46DC 800C3ADC F7B40038 */  sdc1       $f20, 0x38($sp)
/* C46E0 800C3AE0 C7B4007C */  lwc1       $f20, 0x7c($sp)
/* C46E4 800C3AE4 F7B60040 */  sdc1       $f22, 0x40($sp)
/* C46E8 800C3AE8 C7B60080 */  lwc1       $f22, 0x80($sp)
/* C46EC 800C3AEC F7B80048 */  sdc1       $f24, 0x48($sp)
/* C46F0 800C3AF0 C7B80084 */  lwc1       $f24, 0x84($sp)
/* C46F4 800C3AF4 AFB10014 */  sw         $s1, 0x14($sp)
/* C46F8 800C3AF8 00808821 */  addu       $s1, $a0, $zero
/* C46FC 800C3AFC AFB00010 */  sw         $s0, 0x10($sp)
/* C4700 800C3B00 00A08021 */  addu       $s0, $a1, $zero
/* C4704 800C3B04 AFB50024 */  sw         $s5, 0x24($sp)
/* C4708 800C3B08 00C0A821 */  addu       $s5, $a2, $zero
/* C470C 800C3B0C AFBE0030 */  sw         $fp, 0x30($sp)
/* C4710 800C3B10 00E0F021 */  addu       $fp, $a3, $zero
/* C4714 800C3B14 AFBF0034 */  sw         $ra, 0x34($sp)
/* C4718 800C3B18 AFB7002C */  sw         $s7, 0x2c($sp)
/* C471C 800C3B1C AFB60028 */  sw         $s6, 0x28($sp)
/* C4720 800C3B20 AFB40020 */  sw         $s4, 0x20($sp)
/* C4724 800C3B24 AFB3001C */  sw         $s3, 0x1c($sp)
/* C4728 800C3B28 0C0311DC */  jal        guMtxIdentF
/* C472C 800C3B2C AFB20018 */   sw        $s2, 0x18($sp)
/* C4730 800C3B30 44957000 */  mtc1       $s5, $f14
/* C4734 800C3B34 00000000 */  nop
/* C4738 800C3B38 460EA381 */  sub.s      $f14, $f20, $f14
/* C473C 800C3B3C 44147000 */  mfc1       $s4, $f14
/* C4740 800C3B40 00000000 */  nop
/* C4744 800C3B44 44948000 */  mtc1       $s4, $f16
/* C4748 800C3B48 00000000 */  nop
/* C474C 800C3B4C 46107002 */  mul.s      $f0, $f14, $f16
/* C4750 800C3B50 449E7000 */  mtc1       $fp, $f14
/* C4754 800C3B54 00000000 */  nop
/* C4758 800C3B58 460EB381 */  sub.s      $f14, $f22, $f14
/* C475C 800C3B5C 44137000 */  mfc1       $s3, $f14
/* C4760 800C3B60 00000000 */  nop
/* C4764 800C3B64 44938000 */  mtc1       $s3, $f16
/* C4768 800C3B68 00000000 */  nop
/* C476C 800C3B6C 46107102 */  mul.s      $f4, $f14, $f16
/* C4770 800C3B70 C7AE0078 */  lwc1       $f14, 0x78($sp)
/* C4774 800C3B74 460EC381 */  sub.s      $f14, $f24, $f14
/* C4778 800C3B78 44127000 */  mfc1       $s2, $f14
/* C477C 800C3B7C 00000000 */  nop
/* C4780 800C3B80 44928000 */  mtc1       $s2, $f16
/* C4784 800C3B84 00000000 */  nop
/* C4788 800C3B88 46107082 */  mul.s      $f2, $f14, $f16
/* C478C 800C3B8C 46040000 */  add.s      $f0, $f0, $f4
/* C4790 800C3B90 46020300 */  add.s      $f12, $f0, $f2
/* C4794 800C3B94 46006084 */  sqrt.s     $f2, $f12
/* C4798 800C3B98 46021032 */  c.eq.s     $f2, $f2
/* C479C 800C3B9C 00000000 */  nop
/* C47A0 800C3BA0 45010004 */  bc1t       .L800C3BB4
/* C47A4 800C3BA4 00000000 */   nop
/* C47A8 800C3BA8 0C0334B4 */  jal        _sqrtf
/* C47AC 800C3BAC 00000000 */   nop
/* C47B0 800C3BB0 46000086 */  mov.s      $f2, $f0
.L800C3BB4:
/* C47B4 800C3BB4 3C01800E */  lui        $at, %hi(lookatref_rodata_0000)
/* C47B8 800C3BB8 D4205400 */  ldc1       $f0, %lo(lookatref_rodata_0000)($at)
/* C47BC 800C3BBC 460010A1 */  cvt.d.s    $f2, $f2
/* C47C0 800C3BC0 46220003 */  div.d      $f0, $f0, $f2
/* C47C4 800C3BC4 44928000 */  mtc1       $s2, $f16
/* C47C8 800C3BC8 462000A0 */  cvt.s.d    $f2, $f0
/* C47CC 800C3BCC 46028402 */  mul.s      $f16, $f16, $f2
/* C47D0 800C3BD0 44947000 */  mtc1       $s4, $f14
/* C47D4 800C3BD4 00000000 */  nop
/* C47D8 800C3BD8 46027382 */  mul.s      $f14, $f14, $f2
/* C47DC 800C3BDC 00000000 */  nop
/* C47E0 800C3BE0 4610F102 */  mul.s      $f4, $f30, $f16
/* C47E4 800C3BE4 44147000 */  mfc1       $s4, $f14
/* C47E8 800C3BE8 44937000 */  mtc1       $s3, $f14
/* C47EC 800C3BEC 00000000 */  nop
/* C47F0 800C3BF0 46027382 */  mul.s      $f14, $f14, $f2
/* C47F4 800C3BF4 44128000 */  mfc1       $s2, $f16
/* C47F8 800C3BF8 44948000 */  mtc1       $s4, $f16
/* C47FC 800C3BFC 00000000 */  nop
/* C4800 800C3C00 4610D202 */  mul.s      $f8, $f26, $f16
/* C4804 800C3C04 00000000 */  nop
/* C4808 800C3C08 460ED002 */  mul.s      $f0, $f26, $f14
/* C480C 800C3C0C 44137000 */  mfc1       $s3, $f14
/* C4810 800C3C10 44927000 */  mtc1       $s2, $f14
/* C4814 800C3C14 00000000 */  nop
/* C4818 800C3C18 460EE082 */  mul.s      $f2, $f28, $f14
/* C481C 800C3C1C 44938000 */  mtc1       $s3, $f16
/* C4820 800C3C20 00000000 */  nop
/* C4824 800C3C24 4610E282 */  mul.s      $f10, $f28, $f16
/* C4828 800C3C28 44947000 */  mtc1       $s4, $f14
/* C482C 800C3C2C 00000000 */  nop
/* C4830 800C3C30 460EF182 */  mul.s      $f6, $f30, $f14
/* C4834 800C3C34 46002501 */  sub.s      $f20, $f4, $f0
/* C4838 800C3C38 4614A002 */  mul.s      $f0, $f20, $f20
/* C483C 800C3C3C 46024581 */  sub.s      $f22, $f8, $f2
/* C4840 800C3C40 4616B102 */  mul.s      $f4, $f22, $f22
/* C4844 800C3C44 46065601 */  sub.s      $f24, $f10, $f6
/* C4848 800C3C48 4618C082 */  mul.s      $f2, $f24, $f24
/* C484C 800C3C4C 46040000 */  add.s      $f0, $f0, $f4
/* C4850 800C3C50 46020300 */  add.s      $f12, $f0, $f2
/* C4854 800C3C54 46006004 */  sqrt.s     $f0, $f12
/* C4858 800C3C58 46000032 */  c.eq.s     $f0, $f0
/* C485C 800C3C5C 00000000 */  nop
/* C4860 800C3C60 45010003 */  bc1t       .L800C3C70
/* C4864 800C3C64 00000000 */   nop
/* C4868 800C3C68 0C0334B4 */  jal        _sqrtf
/* C486C 800C3C6C 00000000 */   nop
.L800C3C70:
/* C4870 800C3C70 3C01800E */  lui        $at, %hi(D_800E5408)
/* C4874 800C3C74 8C365408 */  lw         $s6, %lo(D_800E5408)($at)
/* C4878 800C3C78 8C37540C */  lw         $s7, 0x540c($at)
/* C487C 800C3C7C 44978000 */  mtc1       $s7, $f16
/* C4880 800C3C80 44968800 */  mtc1       $s6, $f17
/* C4884 800C3C84 46000021 */  cvt.d.s    $f0, $f0
/* C4888 800C3C88 46208003 */  div.d      $f0, $f16, $f0
/* C488C 800C3C8C 462000A0 */  cvt.s.d    $f2, $f0
/* C4890 800C3C90 4602A502 */  mul.s      $f20, $f20, $f2
/* C4894 800C3C94 00000000 */  nop
/* C4898 800C3C98 4602C602 */  mul.s      $f24, $f24, $f2
/* C489C 800C3C9C 00000000 */  nop
/* C48A0 800C3CA0 4602B582 */  mul.s      $f22, $f22, $f2
/* C48A4 800C3CA4 44937000 */  mtc1       $s3, $f14
/* C48A8 800C3CA8 00000000 */  nop
/* C48AC 800C3CAC 46187102 */  mul.s      $f4, $f14, $f24
/* C48B0 800C3CB0 44928000 */  mtc1       $s2, $f16
/* C48B4 800C3CB4 00000000 */  nop
/* C48B8 800C3CB8 46168002 */  mul.s      $f0, $f16, $f22
/* C48BC 800C3CBC 00000000 */  nop
/* C48C0 800C3CC0 46148202 */  mul.s      $f8, $f16, $f20
/* C48C4 800C3CC4 44947000 */  mtc1       $s4, $f14
/* C48C8 800C3CC8 00000000 */  nop
/* C48CC 800C3CCC 46187082 */  mul.s      $f2, $f14, $f24
/* C48D0 800C3CD0 00000000 */  nop
/* C48D4 800C3CD4 46167282 */  mul.s      $f10, $f14, $f22
/* C48D8 800C3CD8 44938000 */  mtc1       $s3, $f16
/* C48DC 800C3CDC 00000000 */  nop
/* C48E0 800C3CE0 46148182 */  mul.s      $f6, $f16, $f20
/* C48E4 800C3CE4 46002701 */  sub.s      $f28, $f4, $f0
/* C48E8 800C3CE8 461CE002 */  mul.s      $f0, $f28, $f28
/* C48EC 800C3CEC 46024781 */  sub.s      $f30, $f8, $f2
/* C48F0 800C3CF0 461EF102 */  mul.s      $f4, $f30, $f30
/* C48F4 800C3CF4 46065681 */  sub.s      $f26, $f10, $f6
/* C48F8 800C3CF8 461AD082 */  mul.s      $f2, $f26, $f26
/* C48FC 800C3CFC 46040000 */  add.s      $f0, $f0, $f4
/* C4900 800C3D00 46020300 */  add.s      $f12, $f0, $f2
/* C4904 800C3D04 46006004 */  sqrt.s     $f0, $f12
/* C4908 800C3D08 46000032 */  c.eq.s     $f0, $f0
/* C490C 800C3D0C 00000000 */  nop
/* C4910 800C3D10 45010003 */  bc1t       .L800C3D20
/* C4914 800C3D14 00000000 */   nop
/* C4918 800C3D18 0C0334B4 */  jal        _sqrtf
/* C491C 800C3D1C 00000000 */   nop
.L800C3D20:
/* C4920 800C3D20 44977000 */  mtc1       $s7, $f14
/* C4924 800C3D24 44967800 */  mtc1       $s6, $f15
/* C4928 800C3D28 46000021 */  cvt.d.s    $f0, $f0
/* C492C 800C3D2C 46207003 */  div.d      $f0, $f14, $f0
/* C4930 800C3D30 462000A0 */  cvt.s.d    $f2, $f0
/* C4934 800C3D34 4602E702 */  mul.s      $f28, $f28, $f2
/* C4938 800C3D38 3C014300 */  lui        $at, 0x4300
/* C493C 800C3D3C 44810000 */  mtc1       $at, $f0
/* C4940 800C3D40 00000000 */  nop
/* C4944 800C3D44 4600A102 */  mul.s      $f4, $f20, $f0
/* C4948 800C3D48 00000000 */  nop
/* C494C 800C3D4C 4602F782 */  mul.s      $f30, $f30, $f2
/* C4950 800C3D50 3C0142FE */  lui        $at, 0x42fe
/* C4954 800C3D54 44810000 */  mtc1       $at, $f0
/* C4958 800C3D58 00000000 */  nop
/* C495C 800C3D5C 4600203C */  c.lt.s     $f4, $f0
/* C4960 800C3D60 00000000 */  nop
/* C4964 800C3D64 00000000 */  nop
/* C4968 800C3D68 45000005 */  bc1f       .L800C3D80
/* C496C 800C3D6C 4602D682 */   mul.s     $f26, $f26, $f2
/* C4970 800C3D70 4600200D */  trunc.w.s  $f0, $f4
/* C4974 800C3D74 44020000 */  mfc1       $v0, $f0
/* C4978 800C3D78 08030F61 */  j          .L800C3D84
/* C497C 800C3D7C 00000000 */   nop
.L800C3D80:
/* C4980 800C3D80 2402007F */  addiu      $v0, $zero, 0x7f
.L800C3D84:
/* C4984 800C3D84 3C014300 */  lui        $at, 0x4300
/* C4988 800C3D88 44810000 */  mtc1       $at, $f0
/* C498C 800C3D8C 00000000 */  nop
/* C4990 800C3D90 4600B082 */  mul.s      $f2, $f22, $f0
/* C4994 800C3D94 3C0142FE */  lui        $at, 0x42fe
/* C4998 800C3D98 44810000 */  mtc1       $at, $f0
/* C499C 800C3D9C 00000000 */  nop
/* C49A0 800C3DA0 4600103C */  c.lt.s     $f2, $f0
/* C49A4 800C3DA4 00000000 */  nop
/* C49A8 800C3DA8 00000000 */  nop
/* C49AC 800C3DAC 45000005 */  bc1f       .L800C3DC4
/* C49B0 800C3DB0 A2020008 */   sb        $v0, 8($s0)
/* C49B4 800C3DB4 4600100D */  trunc.w.s  $f0, $f2
/* C49B8 800C3DB8 44020000 */  mfc1       $v0, $f0
/* C49BC 800C3DBC 08030F72 */  j          .L800C3DC8
/* C49C0 800C3DC0 00000000 */   nop
.L800C3DC4:
/* C49C4 800C3DC4 2402007F */  addiu      $v0, $zero, 0x7f
.L800C3DC8:
/* C49C8 800C3DC8 3C014300 */  lui        $at, 0x4300
/* C49CC 800C3DCC 44810000 */  mtc1       $at, $f0
/* C49D0 800C3DD0 00000000 */  nop
/* C49D4 800C3DD4 4600C082 */  mul.s      $f2, $f24, $f0
/* C49D8 800C3DD8 3C0142FE */  lui        $at, 0x42fe
/* C49DC 800C3DDC 44810000 */  mtc1       $at, $f0
/* C49E0 800C3DE0 00000000 */  nop
/* C49E4 800C3DE4 4600103C */  c.lt.s     $f2, $f0
/* C49E8 800C3DE8 00000000 */  nop
/* C49EC 800C3DEC 00000000 */  nop
/* C49F0 800C3DF0 45000005 */  bc1f       .L800C3E08
/* C49F4 800C3DF4 A2020009 */   sb        $v0, 9($s0)
/* C49F8 800C3DF8 4600100D */  trunc.w.s  $f0, $f2
/* C49FC 800C3DFC 44020000 */  mfc1       $v0, $f0
/* C4A00 800C3E00 08030F83 */  j          .L800C3E0C
/* C4A04 800C3E04 00000000 */   nop
.L800C3E08:
/* C4A08 800C3E08 2402007F */  addiu      $v0, $zero, 0x7f
.L800C3E0C:
/* C4A0C 800C3E0C 3C014300 */  lui        $at, 0x4300
/* C4A10 800C3E10 44810000 */  mtc1       $at, $f0
/* C4A14 800C3E14 00000000 */  nop
/* C4A18 800C3E18 4600E082 */  mul.s      $f2, $f28, $f0
/* C4A1C 800C3E1C 3C0142FE */  lui        $at, 0x42fe
/* C4A20 800C3E20 44810000 */  mtc1       $at, $f0
/* C4A24 800C3E24 00000000 */  nop
/* C4A28 800C3E28 4600103C */  c.lt.s     $f2, $f0
/* C4A2C 800C3E2C 00000000 */  nop
/* C4A30 800C3E30 00000000 */  nop
/* C4A34 800C3E34 45000005 */  bc1f       .L800C3E4C
/* C4A38 800C3E38 A202000A */   sb        $v0, 0xa($s0)
/* C4A3C 800C3E3C 4600100D */  trunc.w.s  $f0, $f2
/* C4A40 800C3E40 44020000 */  mfc1       $v0, $f0
/* C4A44 800C3E44 08030F94 */  j          .L800C3E50
/* C4A48 800C3E48 00000000 */   nop
.L800C3E4C:
/* C4A4C 800C3E4C 2402007F */  addiu      $v0, $zero, 0x7f
.L800C3E50:
/* C4A50 800C3E50 3C014300 */  lui        $at, 0x4300
/* C4A54 800C3E54 44810000 */  mtc1       $at, $f0
/* C4A58 800C3E58 00000000 */  nop
/* C4A5C 800C3E5C 4600F082 */  mul.s      $f2, $f30, $f0
/* C4A60 800C3E60 3C0142FE */  lui        $at, 0x42fe
/* C4A64 800C3E64 44810000 */  mtc1       $at, $f0
/* C4A68 800C3E68 00000000 */  nop
/* C4A6C 800C3E6C 4600103C */  c.lt.s     $f2, $f0
/* C4A70 800C3E70 00000000 */  nop
/* C4A74 800C3E74 00000000 */  nop
/* C4A78 800C3E78 45000005 */  bc1f       .L800C3E90
/* C4A7C 800C3E7C A2020018 */   sb        $v0, 0x18($s0)
/* C4A80 800C3E80 4600100D */  trunc.w.s  $f0, $f2
/* C4A84 800C3E84 44020000 */  mfc1       $v0, $f0
/* C4A88 800C3E88 08030FA5 */  j          .L800C3E94
/* C4A8C 800C3E8C 00000000 */   nop
.L800C3E90:
/* C4A90 800C3E90 2402007F */  addiu      $v0, $zero, 0x7f
.L800C3E94:
/* C4A94 800C3E94 3C014300 */  lui        $at, 0x4300
/* C4A98 800C3E98 44810000 */  mtc1       $at, $f0
/* C4A9C 800C3E9C 00000000 */  nop
/* C4AA0 800C3EA0 4600D082 */  mul.s      $f2, $f26, $f0
/* C4AA4 800C3EA4 3C0142FE */  lui        $at, 0x42fe
/* C4AA8 800C3EA8 44810000 */  mtc1       $at, $f0
/* C4AAC 800C3EAC 00000000 */  nop
/* C4AB0 800C3EB0 4600103C */  c.lt.s     $f2, $f0
/* C4AB4 800C3EB4 00000000 */  nop
/* C4AB8 800C3EB8 00000000 */  nop
/* C4ABC 800C3EBC 45000006 */  bc1f       .L800C3ED8
/* C4AC0 800C3EC0 A2020019 */   sb        $v0, 0x19($s0)
/* C4AC4 800C3EC4 4600100D */  trunc.w.s  $f0, $f2
/* C4AC8 800C3EC8 44020000 */  mfc1       $v0, $f0
/* C4ACC 800C3ECC 00000000 */  nop
/* C4AD0 800C3ED0 08030FB8 */  j          .L800C3EE0
/* C4AD4 800C3ED4 A202001A */   sb        $v0, 0x1a($s0)
.L800C3ED8:
/* C4AD8 800C3ED8 2402007F */  addiu      $v0, $zero, 0x7f
/* C4ADC 800C3EDC A202001A */  sb         $v0, 0x1a($s0)
.L800C3EE0:
/* C4AE0 800C3EE0 44958000 */  mtc1       $s5, $f16
/* C4AE4 800C3EE4 00000000 */  nop
/* C4AE8 800C3EE8 46148102 */  mul.s      $f4, $f16, $f20
/* C4AEC 800C3EEC 449E7000 */  mtc1       $fp, $f14
/* C4AF0 800C3EF0 00000000 */  nop
/* C4AF4 800C3EF4 46167182 */  mul.s      $f6, $f14, $f22
/* C4AF8 800C3EF8 44957000 */  mtc1       $s5, $f14
/* C4AFC 800C3EFC 00000000 */  nop
/* C4B00 800C3F00 461C7082 */  mul.s      $f2, $f14, $f28
/* C4B04 800C3F04 C7B00078 */  lwc1       $f16, 0x78($sp)
/* C4B08 800C3F08 46188202 */  mul.s      $f8, $f16, $f24
/* C4B0C 800C3F0C 449E8000 */  mtc1       $fp, $f16
/* C4B10 800C3F10 A2000000 */  sb         $zero, ($s0)
/* C4B14 800C3F14 A2000001 */  sb         $zero, 1($s0)
/* C4B18 800C3F18 A2000002 */  sb         $zero, 2($s0)
/* C4B1C 800C3F1C A2000003 */  sb         $zero, 3($s0)
/* C4B20 800C3F20 A2000004 */  sb         $zero, 4($s0)
/* C4B24 800C3F24 461E8282 */  mul.s      $f10, $f16, $f30
/* C4B28 800C3F28 A2000005 */  sb         $zero, 5($s0)
/* C4B2C 800C3F2C A2000006 */  sb         $zero, 6($s0)
/* C4B30 800C3F30 A2000007 */  sb         $zero, 7($s0)
/* C4B34 800C3F34 C7AE0078 */  lwc1       $f14, 0x78($sp)
/* C4B38 800C3F38 461A7302 */  mul.s      $f12, $f14, $f26
/* C4B3C 800C3F3C 44958000 */  mtc1       $s5, $f16
/* C4B40 800C3F40 44947000 */  mtc1       $s4, $f14
/* C4B44 800C3F44 24020080 */  addiu      $v0, $zero, 0x80
/* C4B48 800C3F48 A2000010 */  sb         $zero, 0x10($s0)
/* C4B4C 800C3F4C A2020011 */  sb         $v0, 0x11($s0)
/* C4B50 800C3F50 A2000012 */  sb         $zero, 0x12($s0)
/* C4B54 800C3F54 A2000013 */  sb         $zero, 0x13($s0)
/* C4B58 800C3F58 A2000014 */  sb         $zero, 0x14($s0)
/* C4B5C 800C3F5C A2020015 */  sb         $v0, 0x15($s0)
/* C4B60 800C3F60 A2000016 */  sb         $zero, 0x16($s0)
/* C4B64 800C3F64 A2000017 */  sb         $zero, 0x17($s0)
/* C4B68 800C3F68 E6340000 */  swc1       $f20, ($s1)
/* C4B6C 800C3F6C 460E8002 */  mul.s      $f0, $f16, $f14
/* C4B70 800C3F70 46062100 */  add.s      $f4, $f4, $f6
/* C4B74 800C3F74 E6360010 */  swc1       $f22, 0x10($s1)
/* C4B78 800C3F78 449E8000 */  mtc1       $fp, $f16
/* C4B7C 800C3F7C 44937000 */  mtc1       $s3, $f14
/* C4B80 800C3F80 46082100 */  add.s      $f4, $f4, $f8
/* C4B84 800C3F84 E6380020 */  swc1       $f24, 0x20($s1)
/* C4B88 800C3F88 E63C0004 */  swc1       $f28, 4($s1)
/* C4B8C 800C3F8C 460E8202 */  mul.s      $f8, $f16, $f14
/* C4B90 800C3F90 460A1080 */  add.s      $f2, $f2, $f10
/* C4B94 800C3F94 3C013F80 */  lui        $at, 0x3f80
/* C4B98 800C3F98 44815000 */  mtc1       $at, $f10
/* C4B9C 800C3F9C C7B00078 */  lwc1       $f16, 0x78($sp)
/* C4BA0 800C3FA0 44927000 */  mtc1       $s2, $f14
/* C4BA4 800C3FA4 460C1080 */  add.s      $f2, $f2, $f12
/* C4BA8 800C3FA8 460E8182 */  mul.s      $f6, $f16, $f14
/* C4BAC 800C3FAC E63E0014 */  swc1       $f30, 0x14($s1)
/* C4BB0 800C3FB0 E63A0024 */  swc1       $f26, 0x24($s1)
/* C4BB4 800C3FB4 46080000 */  add.s      $f0, $f0, $f8
/* C4BB8 800C3FB8 AE340008 */  sw         $s4, 8($s1)
/* C4BBC 800C3FBC AE330018 */  sw         $s3, 0x18($s1)
/* C4BC0 800C3FC0 AE320028 */  sw         $s2, 0x28($s1)
/* C4BC4 800C3FC4 46060000 */  add.s      $f0, $f0, $f6
/* C4BC8 800C3FC8 AE20000C */  sw         $zero, 0xc($s1)
/* C4BCC 800C3FCC AE20001C */  sw         $zero, 0x1c($s1)
/* C4BD0 800C3FD0 AE20002C */  sw         $zero, 0x2c($s1)
/* C4BD4 800C3FD4 46002107 */  neg.s      $f4, $f4
/* C4BD8 800C3FD8 E62A003C */  swc1       $f10, 0x3c($s1)
/* C4BDC 800C3FDC 46001087 */  neg.s      $f2, $f2
/* C4BE0 800C3FE0 E6240030 */  swc1       $f4, 0x30($s1)
/* C4BE4 800C3FE4 46000007 */  neg.s      $f0, $f0
/* C4BE8 800C3FE8 E6220034 */  swc1       $f2, 0x34($s1)
/* C4BEC 800C3FEC E6200038 */  swc1       $f0, 0x38($s1)
/* C4BF0 800C3FF0 8FBF0034 */  lw         $ra, 0x34($sp)
/* C4BF4 800C3FF4 8FBE0030 */  lw         $fp, 0x30($sp)
/* C4BF8 800C3FF8 8FB7002C */  lw         $s7, 0x2c($sp)
/* C4BFC 800C3FFC 8FB60028 */  lw         $s6, 0x28($sp)
/* C4C00 800C4000 8FB50024 */  lw         $s5, 0x24($sp)
/* C4C04 800C4004 8FB40020 */  lw         $s4, 0x20($sp)
/* C4C08 800C4008 8FB3001C */  lw         $s3, 0x1c($sp)
/* C4C0C 800C400C 8FB20018 */  lw         $s2, 0x18($sp)
/* C4C10 800C4010 8FB10014 */  lw         $s1, 0x14($sp)
/* C4C14 800C4014 8FB00010 */  lw         $s0, 0x10($sp)
/* C4C18 800C4018 D7BE0060 */  ldc1       $f30, 0x60($sp)
/* C4C1C 800C401C D7BC0058 */  ldc1       $f28, 0x58($sp)
/* C4C20 800C4020 D7BA0050 */  ldc1       $f26, 0x50($sp)
/* C4C24 800C4024 D7B80048 */  ldc1       $f24, 0x48($sp)
/* C4C28 800C4028 D7B60040 */  ldc1       $f22, 0x40($sp)
/* C4C2C 800C402C D7B40038 */  ldc1       $f20, 0x38($sp)
/* C4C30 800C4030 03E00008 */  jr         $ra
/* C4C34 800C4034 27BD0068 */   addiu     $sp, $sp, 0x68

glabel guLookAtReflect
/* C4C38 800C4038 27BDFF88 */  addiu      $sp, $sp, -0x78
/* C4C3C 800C403C C7A00088 */  lwc1       $f0, 0x88($sp)
/* C4C40 800C4040 C7A2008C */  lwc1       $f2, 0x8c($sp)
/* C4C44 800C4044 C7A40090 */  lwc1       $f4, 0x90($sp)
/* C4C48 800C4048 C7A60094 */  lwc1       $f6, 0x94($sp)
/* C4C4C 800C404C C7A80098 */  lwc1       $f8, 0x98($sp)
/* C4C50 800C4050 C7AA009C */  lwc1       $f10, 0x9c($sp)
/* C4C54 800C4054 C7AC00A0 */  lwc1       $f12, 0xa0($sp)
/* C4C58 800C4058 AFB00070 */  sw         $s0, 0x70($sp)
/* C4C5C 800C405C 00808021 */  addu       $s0, $a0, $zero
/* C4C60 800C4060 27A40030 */  addiu      $a0, $sp, 0x30
/* C4C64 800C4064 AFBF0074 */  sw         $ra, 0x74($sp)
/* C4C68 800C4068 E7A00010 */  swc1       $f0, 0x10($sp)
/* C4C6C 800C406C E7A20014 */  swc1       $f2, 0x14($sp)
/* C4C70 800C4070 E7A40018 */  swc1       $f4, 0x18($sp)
/* C4C74 800C4074 E7A6001C */  swc1       $f6, 0x1c($sp)
/* C4C78 800C4078 E7A80020 */  swc1       $f8, 0x20($sp)
/* C4C7C 800C407C E7AA0024 */  swc1       $f10, 0x24($sp)
/* C4C80 800C4080 0C030EB0 */  jal        guLookAtReflectF
/* C4C84 800C4084 E7AC0028 */   swc1      $f12, 0x28($sp)
/* C4C88 800C4088 27A40030 */  addiu      $a0, $sp, 0x30
/* C4C8C 800C408C 0C03118C */  jal        guMtxF2L
/* C4C90 800C4090 02002821 */   addu      $a1, $s0, $zero
/* C4C94 800C4094 8FBF0074 */  lw         $ra, 0x74($sp)
/* C4C98 800C4098 8FB00070 */  lw         $s0, 0x70($sp)
/* C4C9C 800C409C 03E00008 */  jr         $ra
/* C4CA0 800C40A0 27BD0078 */   addiu     $sp, $sp, 0x78
/* C4CA4 800C40A4 00000000 */  nop
/* C4CA8 800C40A8 00000000 */  nop
/* C4CAC 800C40AC 00000000 */  nop
