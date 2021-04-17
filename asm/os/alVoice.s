.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSynStartVoiceParams
/* CE610 800CDA10 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CE614 800CDA14 AFB20018 */  sw         $s2, 0x18($sp)
/* CE618 800CDA18 93B20053 */  lbu        $s2, 0x53($sp)
/* CE61C 800CDA1C AFB3001C */  sw         $s3, 0x1c($sp)
/* CE620 800CDA20 00809821 */  addu       $s3, $a0, $zero
/* CE624 800CDA24 AFB10014 */  sw         $s1, 0x14($sp)
/* CE628 800CDA28 00A08821 */  addu       $s1, $a1, $zero
/* CE62C 800CDA2C AFBF002C */  sw         $ra, 0x2c($sp)
/* CE630 800CDA30 AFB60028 */  sw         $s6, 0x28($sp)
/* CE634 800CDA34 AFB50024 */  sw         $s5, 0x24($sp)
/* CE638 800CDA38 AFB40020 */  sw         $s4, 0x20($sp)
/* CE63C 800CDA3C AFB00010 */  sw         $s0, 0x10($sp)
/* CE640 800CDA40 F7B40030 */  sdc1       $f20, 0x30($sp)
/* CE644 800CDA44 8E220008 */  lw         $v0, 8($s1)
/* CE648 800CDA48 97B5004A */  lhu        $s5, 0x4a($sp)
/* CE64C 800CDA4C 93B4004F */  lbu        $s4, 0x4f($sp)
/* CE650 800CDA50 4487A000 */  mtc1       $a3, $f20
/* CE654 800CDA54 00000000 */  nop
/* CE658 800CDA58 10400022 */  beqz       $v0, .L800CDAE4
/* CE65C 800CDA5C 00C0B021 */   addu      $s6, $a2, $zero
/* CE660 800CDA60 0C033803 */  jal        __allocParam
/* CE664 800CDA64 00000000 */   nop
/* CE668 800CDA68 00408021 */  addu       $s0, $v0, $zero
/* CE66C 800CDA6C 1200001D */  beqz       $s0, .L800CDAE4
/* CE670 800CDA70 324200FF */   andi      $v0, $s2, 0xff
/* CE674 800CDA74 2C420080 */  sltiu      $v0, $v0, 0x80
/* CE678 800CDA78 50400001 */  beql       $v0, $zero, .L800CDA80
/* CE67C 800CDA7C 2412007F */   addiu     $s2, $zero, 0x7f
.L800CDA80:
/* CE680 800CDA80 8E220008 */  lw         $v0, 8($s1)
/* CE684 800CDA84 8E63001C */  lw         $v1, 0x1c($s3)
/* CE688 800CDA88 8C4400D8 */  lw         $a0, 0xd8($v0)
/* CE68C 800CDA8C 2402000D */  addiu      $v0, $zero, 0xd
/* CE690 800CDA90 AE000000 */  sw         $zero, ($s0)
/* CE694 800CDA94 A6020008 */  sh         $v0, 8($s0)
/* CE698 800CDA98 00641821 */  addu       $v1, $v1, $a0
/* CE69C 800CDA9C AE030004 */  sw         $v1, 4($s0)
/* CE6A0 800CDAA0 9622001A */  lhu        $v0, 0x1a($s1)
/* CE6A4 800CDAA4 8FA50054 */  lw         $a1, 0x54($sp)
/* CE6A8 800CDAA8 02602021 */  addu       $a0, $s3, $zero
/* CE6AC 800CDAAC A2140012 */  sb         $s4, 0x12($s0)
/* CE6B0 800CDAB0 A6150010 */  sh         $s5, 0x10($s0)
/* CE6B4 800CDAB4 A2120013 */  sb         $s2, 0x13($s0)
/* CE6B8 800CDAB8 E614000C */  swc1       $f20, 0xc($s0)
/* CE6BC 800CDABC 0C03384B */  jal        _timeToSamples
/* CE6C0 800CDAC0 A602000A */   sh        $v0, 0xa($s0)
/* CE6C4 800CDAC4 AE020014 */  sw         $v0, 0x14($s0)
/* CE6C8 800CDAC8 AE160018 */  sw         $s6, 0x18($s0)
/* CE6CC 800CDACC 8E220008 */  lw         $v0, 8($s1)
/* CE6D0 800CDAD0 8C44000C */  lw         $a0, 0xc($v0)
/* CE6D4 800CDAD4 8C820008 */  lw         $v0, 8($a0)
/* CE6D8 800CDAD8 24050003 */  addiu      $a1, $zero, 3
/* CE6DC 800CDADC 0040F809 */  jalr       $v0
/* CE6E0 800CDAE0 02003021 */   addu      $a2, $s0, $zero
.L800CDAE4:
/* CE6E4 800CDAE4 8FBF002C */  lw         $ra, 0x2c($sp)
/* CE6E8 800CDAE8 8FB60028 */  lw         $s6, 0x28($sp)
/* CE6EC 800CDAEC 8FB50024 */  lw         $s5, 0x24($sp)
/* CE6F0 800CDAF0 8FB40020 */  lw         $s4, 0x20($sp)
/* CE6F4 800CDAF4 8FB3001C */  lw         $s3, 0x1c($sp)
/* CE6F8 800CDAF8 8FB20018 */  lw         $s2, 0x18($sp)
/* CE6FC 800CDAFC 8FB10014 */  lw         $s1, 0x14($sp)
/* CE700 800CDB00 8FB00010 */  lw         $s0, 0x10($sp)
/* CE704 800CDB04 D7B40030 */  ldc1       $f20, 0x30($sp)
/* CE708 800CDB08 03E00008 */  jr         $ra
/* CE70C 800CDB0C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel alSynStopVoice
/* CE710 800CDB10 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CE714 800CDB14 AFB00010 */  sw         $s0, 0x10($sp)
/* CE718 800CDB18 00A08021 */  addu       $s0, $a1, $zero
/* CE71C 800CDB1C AFBF0018 */  sw         $ra, 0x18($sp)
/* CE720 800CDB20 AFB10014 */  sw         $s1, 0x14($sp)
/* CE724 800CDB24 8E020008 */  lw         $v0, 8($s0)
/* CE728 800CDB28 10400013 */  beqz       $v0, .L800CDB78
/* CE72C 800CDB2C 00808821 */   addu      $s1, $a0, $zero
/* CE730 800CDB30 0C033803 */  jal        __allocParam
/* CE734 800CDB34 00000000 */   nop
/* CE738 800CDB38 00403021 */  addu       $a2, $v0, $zero
/* CE73C 800CDB3C 10C0000E */  beqz       $a2, .L800CDB78
/* CE740 800CDB40 00000000 */   nop
/* CE744 800CDB44 8E020008 */  lw         $v0, 8($s0)
/* CE748 800CDB48 8E23001C */  lw         $v1, 0x1c($s1)
/* CE74C 800CDB4C 8C4400D8 */  lw         $a0, 0xd8($v0)
/* CE750 800CDB50 2402000F */  addiu      $v0, $zero, 0xf
/* CE754 800CDB54 A4C20008 */  sh         $v0, 8($a2)
/* CE758 800CDB58 ACC00000 */  sw         $zero, ($a2)
/* CE75C 800CDB5C 00641821 */  addu       $v1, $v1, $a0
/* CE760 800CDB60 ACC30004 */  sw         $v1, 4($a2)
/* CE764 800CDB64 8E020008 */  lw         $v0, 8($s0)
/* CE768 800CDB68 8C44000C */  lw         $a0, 0xc($v0)
/* CE76C 800CDB6C 8C820008 */  lw         $v0, 8($a0)
/* CE770 800CDB70 0040F809 */  jalr       $v0
/* CE774 800CDB74 24050003 */   addiu     $a1, $zero, 3
.L800CDB78:
/* CE778 800CDB78 8FBF0018 */  lw         $ra, 0x18($sp)
/* CE77C 800CDB7C 8FB10014 */  lw         $s1, 0x14($sp)
/* CE780 800CDB80 8FB00010 */  lw         $s0, 0x10($sp)
/* CE784 800CDB84 03E00008 */  jr         $ra
/* CE788 800CDB88 27BD0020 */   addiu     $sp, $sp, 0x20
/* CE78C 800CDB8C 00000000 */  nop
