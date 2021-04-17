.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonWriteWordTo
/* CA4A0 800C98A0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CA4A4 800C98A4 AFB00010 */  sw         $s0, 0x10($sp)
/* CA4A8 800C98A8 00808021 */  addu       $s0, $a0, $zero
/* CA4AC 800C98AC AFB10014 */  sw         $s1, 0x14($sp)
/* CA4B0 800C98B0 00A08821 */  addu       $s1, $a1, $zero
/* CA4B4 800C98B4 AFBF0018 */  sw         $ra, 0x18($sp)
/* CA4B8 800C98B8 02002021 */  addu       $a0, $s0, $zero
.L800C98BC:
/* CA4BC 800C98BC 0C033398 */  jal        __osSpRawWriteIo
/* CA4C0 800C98C0 02202821 */   addu      $a1, $s1, $zero
/* CA4C4 800C98C4 1440FFFD */  bnez       $v0, .L800C98BC
/* CA4C8 800C98C8 02002021 */   addu      $a0, $s0, $zero
/* CA4CC 800C98CC 8FBF0018 */  lw         $ra, 0x18($sp)
/* CA4D0 800C98D0 8FB10014 */  lw         $s1, 0x14($sp)
/* CA4D4 800C98D4 8FB00010 */  lw         $s0, 0x10($sp)
/* CA4D8 800C98D8 03E00008 */  jr         $ra
/* CA4DC 800C98DC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonReadWordAt
/* CA4E0 800C98E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CA4E4 800C98E4 3C0300FF */  lui        $v1, 0xff
/* CA4E8 800C98E8 3463FFFF */  ori        $v1, $v1, 0xffff
/* CA4EC 800C98EC 3C02FC00 */  lui        $v0, 0xfc00
/* CA4F0 800C98F0 00821021 */  addu       $v0, $a0, $v0
/* CA4F4 800C98F4 0062182B */  sltu       $v1, $v1, $v0
/* CA4F8 800C98F8 10600003 */  beqz       $v1, .L800C9908
/* CA4FC 800C98FC AFBF0018 */   sw        $ra, 0x18($sp)
/* CA500 800C9900 08032645 */  j          .L800C9914
/* CA504 800C9904 00001021 */   addu      $v0, $zero, $zero
.L800C9908:
/* CA508 800C9908 0C03337C */  jal        __osSpRawReadIo
/* CA50C 800C990C 27A50010 */   addiu     $a1, $sp, 0x10
/* CA510 800C9910 8FA20010 */  lw         $v0, 0x10($sp)
.L800C9914:
/* CA514 800C9914 8FBF0018 */  lw         $ra, 0x18($sp)
/* CA518 800C9918 03E00008 */  jr         $ra
/* CA51C 800C991C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonMemcpy
/* CA520 800C9920 00C01021 */  addu       $v0, $a2, $zero
/* CA524 800C9924 10400008 */  beqz       $v0, .L800C9948
/* CA528 800C9928 24C6FFFF */   addiu     $a2, $a2, -1
.L800C992C:
/* CA52C 800C992C 90A20000 */  lbu        $v0, ($a1)
/* CA530 800C9930 24A50001 */  addiu      $a1, $a1, 1
/* CA534 800C9934 00C01821 */  addu       $v1, $a2, $zero
/* CA538 800C9938 24C6FFFF */  addiu      $a2, $a2, -1
/* CA53C 800C993C A0820000 */  sb         $v0, ($a0)
/* CA540 800C9940 1460FFFA */  bnez       $v1, .L800C992C
/* CA544 800C9944 24840001 */   addiu     $a0, $a0, 1
.L800C9948:
/* CA548 800C9948 03E00008 */  jr         $ra
/* CA54C 800C994C 00000000 */   nop

glabel __rmonCopyWords
/* CA550 800C9950 00C01021 */  addu       $v0, $a2, $zero
/* CA554 800C9954 10400008 */  beqz       $v0, .L800C9978
/* CA558 800C9958 24C6FFFF */   addiu     $a2, $a2, -1
.L800C995C:
/* CA55C 800C995C 8CA20000 */  lw         $v0, ($a1)
/* CA560 800C9960 24A50004 */  addiu      $a1, $a1, 4
/* CA564 800C9964 00C01821 */  addu       $v1, $a2, $zero
/* CA568 800C9968 24C6FFFF */  addiu      $a2, $a2, -1
/* CA56C 800C996C AC820000 */  sw         $v0, ($a0)
/* CA570 800C9970 1460FFFA */  bnez       $v1, .L800C995C
/* CA574 800C9974 24840004 */   addiu     $a0, $a0, 4
.L800C9978:
/* CA578 800C9978 03E00008 */  jr         $ra
/* CA57C 800C997C 00000000 */   nop

glabel __rmonReadMem
/* CA580 800C9980 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* CA584 800C9984 AFB1001C */  sw         $s1, 0x1c($sp)
/* CA588 800C9988 00808821 */  addu       $s1, $a0, $zero
/* CA58C 800C998C AFBF0030 */  sw         $ra, 0x30($sp)
/* CA590 800C9990 AFB5002C */  sw         $s5, 0x2c($sp)
/* CA594 800C9994 AFB40028 */  sw         $s4, 0x28($sp)
/* CA598 800C9998 AFB30024 */  sw         $s3, 0x24($sp)
/* CA59C 800C999C AFB20020 */  sw         $s2, 0x20($sp)
/* CA5A0 800C99A0 AFB00018 */  sw         $s0, 0x18($sp)
/* CA5A4 800C99A4 92220004 */  lbu        $v0, 4($s1)
/* CA5A8 800C99A8 3C018010 */  lui        $at, %hi(D_800FA354)
/* CA5AC 800C99AC A022A354 */  sb         $v0, %lo(D_800FA354)($at)
/* CA5B0 800C99B0 8E22000C */  lw         $v0, 0xc($s1)
/* CA5B4 800C99B4 3C018010 */  lui        $at, %hi(D_800FA356)
/* CA5B8 800C99B8 A420A356 */  sh         $zero, %lo(D_800FA356)($at)
/* CA5BC 800C99BC 3C018010 */  lui        $at, %hi(D_800FA35C)
/* CA5C0 800C99C0 AC22A35C */  sw         $v0, %lo(D_800FA35C)($at)
/* CA5C4 800C99C4 8E240010 */  lw         $a0, 0x10($s1)
/* CA5C8 800C99C8 3C158010 */  lui        $s5, %hi(__rmonUtilityBuffer_)
/* CA5CC 800C99CC 26B5A350 */  addiu      $s5, $s5, %lo(__rmonUtilityBuffer_)
/* CA5D0 800C99D0 2410FFFF */  addiu      $s0, $zero, -1
/* CA5D4 800C99D4 1090003D */  beq        $a0, $s0, .L800C9ACC
/* CA5D8 800C99D8 2402FFFB */   addiu     $v0, $zero, -5
/* CA5DC 800C99DC 8E250014 */  lw         $a1, 0x14($s1)
/* CA5E0 800C99E0 2CA20401 */  sltiu      $v0, $a1, 0x401
/* CA5E4 800C99E4 14400003 */  bnez       $v0, .L800C99F4
/* CA5E8 800C99E8 24020001 */   addiu     $v0, $zero, 1
/* CA5EC 800C99EC 080326B3 */  j          .L800C9ACC
/* CA5F0 800C99F0 2402FFF8 */   addiu     $v0, $zero, -8
.L800C99F4:
/* CA5F4 800C99F4 92230009 */  lbu        $v1, 9($s1)
/* CA5F8 800C99F8 14620014 */  bne        $v1, $v0, .L800C9A4C
/* CA5FC 800C99FC 3C060400 */   lui       $a2, 0x400
/* CA600 800C9A00 34C60FFF */  ori        $a2, $a2, 0xfff
/* CA604 800C9A04 00C4102B */  sltu       $v0, $a2, $a0
/* CA608 800C9A08 10400006 */  beqz       $v0, .L800C9A24
/* CA60C 800C9A0C 3C020400 */   lui       $v0, 0x400
/* CA610 800C9A10 34421FFF */  ori        $v0, $v0, 0x1fff
/* CA614 800C9A14 00851821 */  addu       $v1, $a0, $a1
/* CA618 800C9A18 0043102B */  sltu       $v0, $v0, $v1
/* CA61C 800C9A1C 10400011 */  beqz       $v0, .L800C9A64
/* CA620 800C9A20 00000000 */   nop
.L800C9A24:
/* CA624 800C9A24 3C0203FF */  lui        $v0, 0x3ff
/* CA628 800C9A28 3442FFFF */  ori        $v0, $v0, 0xffff
/* CA62C 800C9A2C 0044102B */  sltu       $v0, $v0, $a0
/* CA630 800C9A30 1040000A */  beqz       $v0, .L800C9A5C
/* CA634 800C9A34 00851021 */   addu      $v0, $a0, $a1
/* CA638 800C9A38 00C2102B */  sltu       $v0, $a2, $v0
/* CA63C 800C9A3C 10400009 */  beqz       $v0, .L800C9A64
/* CA640 800C9A40 2402FFFB */   addiu     $v0, $zero, -5
/* CA644 800C9A44 080326B3 */  j          .L800C9ACC
/* CA648 800C9A48 00000000 */   nop
.L800C9A4C:
/* CA64C 800C9A4C 0C034888 */  jal        osVirtualToPhysical
/* CA650 800C9A50 00000000 */   nop
/* CA654 800C9A54 14500003 */  bne        $v0, $s0, .L800C9A64
/* CA658 800C9A58 00000000 */   nop
.L800C9A5C:
/* CA65C 800C9A5C 080326B3 */  j          .L800C9ACC
/* CA660 800C9A60 2402FFFB */   addiu     $v0, $zero, -5
.L800C9A64:
/* CA664 800C9A64 8E220014 */  lw         $v0, 0x14($s1)
/* CA668 800C9A68 8E340010 */  lw         $s4, 0x10($s1)
/* CA66C 800C9A6C 27B20010 */  addiu      $s2, $sp, 0x10
/* CA670 800C9A70 24420010 */  addiu      $v0, $v0, 0x10
/* CA674 800C9A74 AEA20000 */  sw         $v0, ($s5)
/* CA678 800C9A78 8E220014 */  lw         $v0, 0x14($s1)
/* CA67C 800C9A7C 00008021 */  addu       $s0, $zero, $zero
/* CA680 800C9A80 24130004 */  addiu      $s3, $zero, 4
/* CA684 800C9A84 24420010 */  addiu      $v0, $v0, 0x10
/* CA688 800C9A88 AFA20010 */  sw         $v0, 0x10($sp)
/* CA68C 800C9A8C 02502021 */  addu       $a0, $s2, $s0
.L800C9A90:
/* CA690 800C9A90 02702823 */  subu       $a1, $s3, $s0
/* CA694 800C9A94 0C02FF60 */  jal        __osRdbSend
/* CA698 800C9A98 24060008 */   addiu     $a2, $zero, 8
/* CA69C 800C9A9C 02028021 */  addu       $s0, $s0, $v0
/* CA6A0 800C9AA0 2A020004 */  slti       $v0, $s0, 4
/* CA6A4 800C9AA4 5440FFFA */  bnel       $v0, $zero, .L800C9A90
/* CA6A8 800C9AA8 02502021 */   addu      $a0, $s2, $s0
/* CA6AC 800C9AAC 02A02021 */  addu       $a0, $s5, $zero
/* CA6B0 800C9AB0 24050010 */  addiu      $a1, $zero, 0x10
/* CA6B4 800C9AB4 0C032540 */  jal        __rmonSendHeader
/* CA6B8 800C9AB8 24060001 */   addiu     $a2, $zero, 1
/* CA6BC 800C9ABC 8E250014 */  lw         $a1, 0x14($s1)
/* CA6C0 800C9AC0 0C032588 */  jal        __rmonSendData
/* CA6C4 800C9AC4 02802021 */   addu      $a0, $s4, $zero
/* CA6C8 800C9AC8 00001021 */  addu       $v0, $zero, $zero
.L800C9ACC:
/* CA6CC 800C9ACC 8FBF0030 */  lw         $ra, 0x30($sp)
/* CA6D0 800C9AD0 8FB5002C */  lw         $s5, 0x2c($sp)
/* CA6D4 800C9AD4 8FB40028 */  lw         $s4, 0x28($sp)
/* CA6D8 800C9AD8 8FB30024 */  lw         $s3, 0x24($sp)
/* CA6DC 800C9ADC 8FB20020 */  lw         $s2, 0x20($sp)
/* CA6E0 800C9AE0 8FB1001C */  lw         $s1, 0x1c($sp)
/* CA6E4 800C9AE4 8FB00018 */  lw         $s0, 0x18($sp)
/* CA6E8 800C9AE8 03E00008 */  jr         $ra
/* CA6EC 800C9AEC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __rmonWriteMem
/* CA6F0 800C9AF0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* CA6F4 800C9AF4 AFB30034 */  sw         $s3, 0x34($sp)
/* CA6F8 800C9AF8 00809821 */  addu       $s3, $a0, $zero
/* CA6FC 800C9AFC AFBF0040 */  sw         $ra, 0x40($sp)
/* CA700 800C9B00 AFB5003C */  sw         $s5, 0x3c($sp)
/* CA704 800C9B04 AFB40038 */  sw         $s4, 0x38($sp)
/* CA708 800C9B08 AFB20030 */  sw         $s2, 0x30($sp)
/* CA70C 800C9B0C AFB1002C */  sw         $s1, 0x2c($sp)
/* CA710 800C9B10 AFB00028 */  sw         $s0, 0x28($sp)
/* CA714 800C9B14 92620009 */  lbu        $v0, 9($s3)
/* CA718 800C9B18 14400006 */  bnez       $v0, .L800C9B34
/* CA71C 800C9B1C 00000000 */   nop
/* CA720 800C9B20 0C034888 */  jal        osVirtualToPhysical
/* CA724 800C9B24 8E640010 */   lw        $a0, 0x10($s3)
/* CA728 800C9B28 2403FFFF */  addiu      $v1, $zero, -1
/* CA72C 800C9B2C 10430070 */  beq        $v0, $v1, .L800C9CF0
/* CA730 800C9B30 2402FFFB */   addiu     $v0, $zero, -5
.L800C9B34:
/* CA734 800C9B34 8E650014 */  lw         $a1, 0x14($s3)
/* CA738 800C9B38 2CA20401 */  sltiu      $v0, $a1, 0x401
/* CA73C 800C9B3C 14400003 */  bnez       $v0, .L800C9B4C
/* CA740 800C9B40 3C0203FF */   lui       $v0, 0x3ff
/* CA744 800C9B44 0803273C */  j          .L800C9CF0
/* CA748 800C9B48 2402FFF8 */   addiu     $v0, $zero, -8
.L800C9B4C:
/* CA74C 800C9B4C 8E640010 */  lw         $a0, 0x10($s3)
/* CA750 800C9B50 3442FFFF */  ori        $v0, $v0, 0xffff
/* CA754 800C9B54 0044102B */  sltu       $v0, $v0, $a0
/* CA758 800C9B58 1040004F */  beqz       $v0, .L800C9C98
/* CA75C 800C9B5C 3C0204FF */   lui       $v0, 0x4ff
/* CA760 800C9B60 3442FFFF */  ori        $v0, $v0, 0xffff
/* CA764 800C9B64 00851821 */  addu       $v1, $a0, $a1
/* CA768 800C9B68 0043102B */  sltu       $v0, $v0, $v1
/* CA76C 800C9B6C 1440004A */  bnez       $v0, .L800C9C98
/* CA770 800C9B70 30910003 */   andi      $s1, $a0, 3
/* CA774 800C9B74 1220002F */  beqz       $s1, .L800C9C34
/* CA778 800C9B78 24020001 */   addiu     $v0, $zero, 1
/* CA77C 800C9B7C 14A2005C */  bne        $a1, $v0, .L800C9CF0
/* CA780 800C9B80 2402FFFB */   addiu     $v0, $zero, -5
/* CA784 800C9B84 3C0300FF */  lui        $v1, 0xff
/* CA788 800C9B88 3463FFFF */  ori        $v1, $v1, 0xffff
/* CA78C 800C9B8C 2402FFFC */  addiu      $v0, $zero, -4
/* CA790 800C9B90 00822024 */  and        $a0, $a0, $v0
/* CA794 800C9B94 3C02FC00 */  lui        $v0, 0xfc00
/* CA798 800C9B98 00821021 */  addu       $v0, $a0, $v0
/* CA79C 800C9B9C 0062182B */  sltu       $v1, $v1, $v0
/* CA7A0 800C9BA0 14600006 */  bnez       $v1, .L800C9BBC
/* CA7A4 800C9BA4 00008021 */   addu      $s0, $zero, $zero
/* CA7A8 800C9BA8 0C03337C */  jal        __osSpRawReadIo
/* CA7AC 800C9BAC 27A50020 */   addiu     $a1, $sp, 0x20
/* CA7B0 800C9BB0 8FB00020 */  lw         $s0, 0x20($sp)
/* CA7B4 800C9BB4 080326F0 */  j          .L800C9BC0
/* CA7B8 800C9BB8 24020001 */   addiu     $v0, $zero, 1
.L800C9BBC:
/* CA7BC 800C9BBC 24020001 */  addiu      $v0, $zero, 1
.L800C9BC0:
/* CA7C0 800C9BC0 56220007 */  bnel       $s1, $v0, .L800C9BE0
/* CA7C4 800C9BC4 24020002 */   addiu     $v0, $zero, 2
/* CA7C8 800C9BC8 3C03FF00 */  lui        $v1, 0xff00
/* CA7CC 800C9BCC 92620018 */  lbu        $v0, 0x18($s3)
/* CA7D0 800C9BD0 3463FFFF */  ori        $v1, $v1, 0xffff
/* CA7D4 800C9BD4 02031824 */  and        $v1, $s0, $v1
/* CA7D8 800C9BD8 08032702 */  j          .L800C9C08
/* CA7DC 800C9BDC 00021400 */   sll       $v0, $v0, 0x10
.L800C9BE0:
/* CA7E0 800C9BE0 56220007 */  bnel       $s1, $v0, .L800C9C00
/* CA7E4 800C9BE4 2402FF00 */   addiu     $v0, $zero, -0x100
/* CA7E8 800C9BE8 3C03FFFF */  lui        $v1, 0xffff
/* CA7EC 800C9BEC 92620018 */  lbu        $v0, 0x18($s3)
/* CA7F0 800C9BF0 346300FF */  ori        $v1, $v1, 0xff
/* CA7F4 800C9BF4 02031824 */  and        $v1, $s0, $v1
/* CA7F8 800C9BF8 08032702 */  j          .L800C9C08
/* CA7FC 800C9BFC 00021200 */   sll       $v0, $v0, 8
.L800C9C00:
/* CA800 800C9C00 92630018 */  lbu        $v1, 0x18($s3)
/* CA804 800C9C04 02021024 */  and        $v0, $s0, $v0
.L800C9C08:
/* CA808 800C9C08 00438025 */  or         $s0, $v0, $v1
/* CA80C 800C9C0C 8E630010 */  lw         $v1, 0x10($s3)
/* CA810 800C9C10 2402FFFC */  addiu      $v0, $zero, -4
/* CA814 800C9C14 00628824 */  and        $s1, $v1, $v0
/* CA818 800C9C18 02202021 */  addu       $a0, $s1, $zero
.L800C9C1C:
/* CA81C 800C9C1C 0C033398 */  jal        __osSpRawWriteIo
/* CA820 800C9C20 02002821 */   addu      $a1, $s0, $zero
/* CA824 800C9C24 1440FFFD */  bnez       $v0, .L800C9C1C
/* CA828 800C9C28 02202021 */   addu      $a0, $s1, $zero
/* CA82C 800C9C2C 08032732 */  j          .L800C9CC8
/* CA830 800C9C30 00000000 */   nop
.L800C9C34:
/* CA834 800C9C34 00058882 */  srl        $s1, $a1, 2
/* CA838 800C9C38 30A20003 */  andi       $v0, $a1, 3
/* CA83C 800C9C3C 10400003 */  beqz       $v0, .L800C9C4C
/* CA840 800C9C40 26740018 */   addiu     $s4, $s3, 0x18
/* CA844 800C9C44 0803273C */  j          .L800C9CF0
/* CA848 800C9C48 2402FFFB */   addiu     $v0, $zero, -5
.L800C9C4C:
/* CA84C 800C9C4C 2631FFFF */  addiu      $s1, $s1, -1
/* CA850 800C9C50 2402FFFF */  addiu      $v0, $zero, -1
/* CA854 800C9C54 1222001C */  beq        $s1, $v0, .L800C9CC8
/* CA858 800C9C58 2415FFFF */   addiu     $s5, $zero, -1
.L800C9C5C:
/* CA85C 800C9C5C 8E720010 */  lw         $s2, 0x10($s3)
/* CA860 800C9C60 8E900000 */  lw         $s0, ($s4)
/* CA864 800C9C64 26940004 */  addiu      $s4, $s4, 4
/* CA868 800C9C68 02402021 */  addu       $a0, $s2, $zero
.L800C9C6C:
/* CA86C 800C9C6C 0C033398 */  jal        __osSpRawWriteIo
/* CA870 800C9C70 02002821 */   addu      $a1, $s0, $zero
/* CA874 800C9C74 1440FFFD */  bnez       $v0, .L800C9C6C
/* CA878 800C9C78 02402021 */   addu      $a0, $s2, $zero
/* CA87C 800C9C7C 8E620010 */  lw         $v0, 0x10($s3)
/* CA880 800C9C80 2631FFFF */  addiu      $s1, $s1, -1
/* CA884 800C9C84 24420004 */  addiu      $v0, $v0, 4
/* CA888 800C9C88 1635FFF4 */  bne        $s1, $s5, .L800C9C5C
/* CA88C 800C9C8C AE620010 */   sw        $v0, 0x10($s3)
/* CA890 800C9C90 08032732 */  j          .L800C9CC8
/* CA894 800C9C94 00000000 */   nop
.L800C9C98:
/* CA898 800C9C98 8E620014 */  lw         $v0, 0x14($s3)
/* CA89C 800C9C9C 8E660010 */  lw         $a2, 0x10($s3)
/* CA8A0 800C9CA0 26650018 */  addiu      $a1, $s3, 0x18
/* CA8A4 800C9CA4 10400008 */  beqz       $v0, .L800C9CC8
/* CA8A8 800C9CA8 2444FFFF */   addiu     $a0, $v0, -1
.L800C9CAC:
/* CA8AC 800C9CAC 90A20000 */  lbu        $v0, ($a1)
/* CA8B0 800C9CB0 24A50001 */  addiu      $a1, $a1, 1
/* CA8B4 800C9CB4 00801821 */  addu       $v1, $a0, $zero
/* CA8B8 800C9CB8 2484FFFF */  addiu      $a0, $a0, -1
/* CA8BC 800C9CBC A0C20000 */  sb         $v0, ($a2)
/* CA8C0 800C9CC0 1460FFFA */  bnez       $v1, .L800C9CAC
/* CA8C4 800C9CC4 24C60001 */   addiu     $a2, $a2, 1
.L800C9CC8:
/* CA8C8 800C9CC8 92620004 */  lbu        $v0, 4($s3)
/* CA8CC 800C9CCC 27A40010 */  addiu      $a0, $sp, 0x10
/* CA8D0 800C9CD0 A7A00016 */  sh         $zero, 0x16($sp)
/* CA8D4 800C9CD4 A3A20014 */  sb         $v0, 0x14($sp)
/* CA8D8 800C9CD8 8E62000C */  lw         $v0, 0xc($s3)
/* CA8DC 800C9CDC 24050010 */  addiu      $a1, $zero, 0x10
/* CA8E0 800C9CE0 24060001 */  addiu      $a2, $zero, 1
/* CA8E4 800C9CE4 0C03255A */  jal        __rmonSendReply
/* CA8E8 800C9CE8 AFA2001C */   sw        $v0, 0x1c($sp)
/* CA8EC 800C9CEC 00001021 */  addu       $v0, $zero, $zero
.L800C9CF0:
/* CA8F0 800C9CF0 8FBF0040 */  lw         $ra, 0x40($sp)
/* CA8F4 800C9CF4 8FB5003C */  lw         $s5, 0x3c($sp)
/* CA8F8 800C9CF8 8FB40038 */  lw         $s4, 0x38($sp)
/* CA8FC 800C9CFC 8FB30034 */  lw         $s3, 0x34($sp)
/* CA900 800C9D00 8FB20030 */  lw         $s2, 0x30($sp)
/* CA904 800C9D04 8FB1002C */  lw         $s1, 0x2c($sp)
/* CA908 800C9D08 8FB00028 */  lw         $s0, 0x28($sp)
/* CA90C 800C9D0C 03E00008 */  jr         $ra
/* CA910 800C9D10 27BD0048 */   addiu     $sp, $sp, 0x48

glabel __rmonListProcesses
/* CA914 800C9D14 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CA918 800C9D18 24020001 */  addiu      $v0, $zero, 1
/* CA91C 800C9D1C AFBF0028 */  sw         $ra, 0x28($sp)
/* CA920 800C9D20 AFA0001C */  sw         $zero, 0x1c($sp)
/* CA924 800C9D24 A7A20020 */  sh         $v0, 0x20($sp)
/* CA928 800C9D28 90830009 */  lbu        $v1, 9($a0)
/* CA92C 800C9D2C 24020001 */  addiu      $v0, $zero, 1
/* CA930 800C9D30 14620002 */  bne        $v1, $v0, .L800C9D3C
/* CA934 800C9D34 240503EA */   addiu     $a1, $zero, 0x3ea
/* CA938 800C9D38 240503E9 */  addiu      $a1, $zero, 0x3e9
.L800C9D3C:
/* CA93C 800C9D3C AFA50024 */  sw         $a1, 0x24($sp)
/* CA940 800C9D40 90820004 */  lbu        $v0, 4($a0)
/* CA944 800C9D44 27A40010 */  addiu      $a0, $sp, 0x10
/* CA948 800C9D48 24050018 */  addiu      $a1, $zero, 0x18
/* CA94C 800C9D4C 24060001 */  addiu      $a2, $zero, 1
/* CA950 800C9D50 A7A00016 */  sh         $zero, 0x16($sp)
/* CA954 800C9D54 0C03255A */  jal        __rmonSendReply
/* CA958 800C9D58 A3A20014 */   sb        $v0, 0x14($sp)
/* CA95C 800C9D5C 8FBF0028 */  lw         $ra, 0x28($sp)
/* CA960 800C9D60 00001021 */  addu       $v0, $zero, $zero
/* CA964 800C9D64 03E00008 */  jr         $ra
/* CA968 800C9D68 27BD0030 */   addiu     $sp, $sp, 0x30

glabel __rmonLoadProgram
/* CA96C 800C9D6C 03E00008 */  jr         $ra
/* CA970 800C9D70 2402FFFF */   addiu     $v0, $zero, -1

glabel __rmonGetExeName
/* CA974 800C9D74 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CA978 800C9D78 AFBF0010 */  sw         $ra, 0x10($sp)
/* CA97C 800C9D7C 90820004 */  lbu        $v0, 4($a0)
/* CA980 800C9D80 3C018010 */  lui        $at, %hi(D_800FA356)
/* CA984 800C9D84 A420A356 */  sh         $zero, %lo(D_800FA356)($at)
/* CA988 800C9D88 3C018010 */  lui        $at, %hi(D_800FA354)
/* CA98C 800C9D8C A022A354 */  sb         $v0, %lo(D_800FA354)($at)
/* CA990 800C9D90 8C82000C */  lw         $v0, 0xc($a0)
/* CA994 800C9D94 3C018010 */  lui        $at, %hi(D_800FA35C)
/* CA998 800C9D98 AC22A35C */  sw         $v0, %lo(D_800FA35C)($at)
/* CA99C 800C9D9C 90830009 */  lbu        $v1, 9($a0)
/* CA9A0 800C9DA0 3C048010 */  lui        $a0, %hi(__rmonUtilityBuffer_)
/* CA9A4 800C9DA4 2484A350 */  addiu      $a0, $a0, %lo(__rmonUtilityBuffer_)
/* CA9A8 800C9DA8 24020001 */  addiu      $v0, $zero, 1
/* CA9AC 800C9DAC 1462000E */  bne        $v1, $v0, .L800C9DE8
/* CA9B0 800C9DB0 24850011 */   addiu     $a1, $a0, 0x11
/* CA9B4 800C9DB4 3C03800E */  lui        $v1, %hi(rmonmem_rodata_0000)
/* CA9B8 800C9DB8 246354D0 */  addiu      $v1, $v1, %lo(rmonmem_rodata_0000)
/* CA9BC 800C9DBC 90620000 */  lbu        $v0, ($v1)
/* CA9C0 800C9DC0 24630001 */  addiu      $v1, $v1, 1
/* CA9C4 800C9DC4 10400013 */  beqz       $v0, .L800C9E14
/* CA9C8 800C9DC8 A0820010 */   sb        $v0, 0x10($a0)
.L800C9DCC:
/* CA9CC 800C9DCC 90620000 */  lbu        $v0, ($v1)
/* CA9D0 800C9DD0 24630001 */  addiu      $v1, $v1, 1
/* CA9D4 800C9DD4 A0A20000 */  sb         $v0, ($a1)
/* CA9D8 800C9DD8 1440FFFC */  bnez       $v0, .L800C9DCC
/* CA9DC 800C9DDC 24A50001 */   addiu     $a1, $a1, 1
/* CA9E0 800C9DE0 08032786 */  j          .L800C9E18
/* CA9E4 800C9DE4 24050018 */   addiu     $a1, $zero, 0x18
.L800C9DE8:
/* CA9E8 800C9DE8 3C03800E */  lui        $v1, %hi(rmonmem_rodata_0008)
/* CA9EC 800C9DEC 246354D8 */  addiu      $v1, $v1, %lo(rmonmem_rodata_0008)
/* CA9F0 800C9DF0 90620000 */  lbu        $v0, ($v1)
/* CA9F4 800C9DF4 24630001 */  addiu      $v1, $v1, 1
/* CA9F8 800C9DF8 10400006 */  beqz       $v0, .L800C9E14
/* CA9FC 800C9DFC A0820010 */   sb        $v0, 0x10($a0)
.L800C9E00:
/* CAA00 800C9E00 90620000 */  lbu        $v0, ($v1)
/* CAA04 800C9E04 24630001 */  addiu      $v1, $v1, 1
/* CAA08 800C9E08 A0A20000 */  sb         $v0, ($a1)
/* CAA0C 800C9E0C 1440FFFC */  bnez       $v0, .L800C9E00
/* CAA10 800C9E10 24A50001 */   addiu     $a1, $a1, 1
.L800C9E14:
/* CAA14 800C9E14 24050018 */  addiu      $a1, $zero, 0x18
.L800C9E18:
/* CAA18 800C9E18 0C03255A */  jal        __rmonSendReply
/* CAA1C 800C9E1C 24060001 */   addiu     $a2, $zero, 1
/* CAA20 800C9E20 8FBF0010 */  lw         $ra, 0x10($sp)
/* CAA24 800C9E24 00001021 */  addu       $v0, $zero, $zero
/* CAA28 800C9E28 03E00008 */  jr         $ra
/* CAA2C 800C9E2C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __rmonGetRegionCount
/* CAA30 800C9E30 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* CAA34 800C9E34 AFBF0028 */  sw         $ra, 0x28($sp)
/* CAA38 800C9E38 90820004 */  lbu        $v0, 4($a0)
/* CAA3C 800C9E3C A7A00016 */  sh         $zero, 0x16($sp)
/* CAA40 800C9E40 A3A20014 */  sb         $v0, 0x14($sp)
/* CAA44 800C9E44 8C82000C */  lw         $v0, 0xc($a0)
/* CAA48 800C9E48 AFA2001C */  sw         $v0, 0x1c($sp)
/* CAA4C 800C9E4C 90830009 */  lbu        $v1, 9($a0)
/* CAA50 800C9E50 24020001 */  addiu      $v0, $zero, 1
/* CAA54 800C9E54 14620002 */  bne        $v1, $v0, .L800C9E60
/* CAA58 800C9E58 24040005 */   addiu     $a0, $zero, 5
/* CAA5C 800C9E5C 24040002 */  addiu      $a0, $zero, 2
.L800C9E60:
/* CAA60 800C9E60 AFA40020 */  sw         $a0, 0x20($sp)
/* CAA64 800C9E64 27A40010 */  addiu      $a0, $sp, 0x10
/* CAA68 800C9E68 24050014 */  addiu      $a1, $zero, 0x14
/* CAA6C 800C9E6C 0C03255A */  jal        __rmonSendReply
/* CAA70 800C9E70 24060001 */   addiu     $a2, $zero, 1
/* CAA74 800C9E74 8FBF0028 */  lw         $ra, 0x28($sp)
/* CAA78 800C9E78 00001021 */  addu       $v0, $zero, $zero
/* CAA7C 800C9E7C 03E00008 */  jr         $ra
/* CAA80 800C9E80 27BD0030 */   addiu     $sp, $sp, 0x30

glabel __rmonGetRegions
/* CAA84 800C9E84 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CAA88 800C9E88 AFBF0010 */  sw         $ra, 0x10($sp)
/* CAA8C 800C9E8C 90820009 */  lbu        $v0, 9($a0)
/* CAA90 800C9E90 3C088010 */  lui        $t0, %hi(__rmonUtilityBuffer_)
/* CAA94 800C9E94 2508A350 */  addiu      $t0, $t0, %lo(__rmonUtilityBuffer_)
/* CAA98 800C9E98 38420001 */  xori       $v0, $v0, 1
/* CAA9C 800C9E9C 0002102B */  sltu       $v0, $zero, $v0
/* CAAA0 800C9EA0 00021023 */  negu       $v0, $v0
/* CAAA4 800C9EA4 30420006 */  andi       $v0, $v0, 6
/* CAAA8 800C9EA8 34420002 */  ori        $v0, $v0, 2
/* CAAAC 800C9EAC 00021900 */  sll        $v1, $v0, 4
/* CAAB0 800C9EB0 24670024 */  addiu      $a3, $v1, 0x24
/* CAAB4 800C9EB4 AD070000 */  sw         $a3, ($t0)
/* CAAB8 800C9EB8 90830004 */  lbu        $v1, 4($a0)
/* CAABC 800C9EBC 3C050400 */  lui        $a1, 0x400
/* CAAC0 800C9EC0 34A51000 */  ori        $a1, $a1, 0x1000
/* CAAC4 800C9EC4 3C018010 */  lui        $at, %hi(D_800FA356)
/* CAAC8 800C9EC8 A420A356 */  sh         $zero, %lo(D_800FA356)($at)
/* CAACC 800C9ECC 3C018010 */  lui        $at, %hi(D_800FA354)
/* CAAD0 800C9ED0 A023A354 */  sb         $v1, %lo(D_800FA354)($at)
/* CAAD4 800C9ED4 8C86000C */  lw         $a2, 0xc($a0)
/* CAAD8 800C9ED8 24041000 */  addiu      $a0, $zero, 0x1000
/* CAADC 800C9EDC 24030007 */  addiu      $v1, $zero, 7
/* CAAE0 800C9EE0 3C018010 */  lui        $at, %hi(D_800FA37C)
/* CAAE4 800C9EE4 A423A37C */  sh         $v1, %lo(D_800FA37C)($at)
/* CAAE8 800C9EE8 3C030400 */  lui        $v1, 0x400
/* CAAEC 800C9EEC 3C018010 */  lui        $at, %hi(D_800FA374)
/* CAAF0 800C9EF0 AC25A374 */  sw         $a1, %lo(D_800FA374)($at)
/* CAAF4 800C9EF4 3C018010 */  lui        $at, %hi(D_800FA380)
/* CAAF8 800C9EF8 AC25A380 */  sw         $a1, %lo(D_800FA380)($at)
/* CAAFC 800C9EFC 24050003 */  addiu      $a1, $zero, 3
/* CAB00 800C9F00 3C018010 */  lui        $at, %hi(__rmonUtilityBuffer_1)
/* CAB04 800C9F04 AC22A360 */  sw         $v0, %lo(__rmonUtilityBuffer_1)($at)
/* CAB08 800C9F08 28420003 */  slti       $v0, $v0, 3
/* CAB0C 800C9F0C 3C018010 */  lui        $at, %hi(D_800FA378)
/* CAB10 800C9F10 AC24A378 */  sw         $a0, %lo(D_800FA378)($at)
/* CAB14 800C9F14 3C018010 */  lui        $at, %hi(D_800FA364)
/* CAB18 800C9F18 AC23A364 */  sw         $v1, %lo(D_800FA364)($at)
/* CAB1C 800C9F1C 3C018010 */  lui        $at, %hi(D_800FA368)
/* CAB20 800C9F20 AC24A368 */  sw         $a0, %lo(D_800FA368)($at)
/* CAB24 800C9F24 3C018010 */  lui        $at, %hi(D_800FA36C)
/* CAB28 800C9F28 A425A36C */  sh         $a1, %lo(D_800FA36C)($at)
/* CAB2C 800C9F2C 3C018010 */  lui        $at, %hi(D_800FA370)
/* CAB30 800C9F30 AC23A370 */  sw         $v1, %lo(D_800FA370)($at)
/* CAB34 800C9F34 3C018010 */  lui        $at, %hi(D_800FA35C)
/* CAB38 800C9F38 AC26A35C */  sw         $a2, %lo(D_800FA35C)($at)
/* CAB3C 800C9F3C 1440002C */  bnez       $v0, .L800C9FF0
/* CAB40 800C9F40 01002021 */   addu      $a0, $t0, $zero
/* CAB44 800C9F44 34632000 */  ori        $v1, $v1, 0x2000
/* CAB48 800C9F48 3C048820 */  lui        $a0, 0x8820
/* CAB4C 800C9F4C 34846130 */  ori        $a0, $a0, 0x6130
/* CAB50 800C9F50 3C028820 */  lui        $v0, 0x8820
/* CAB54 800C9F54 3C018010 */  lui        $at, %hi(D_800FA384)
/* CAB58 800C9F58 AC22A384 */  sw         $v0, %lo(D_800FA384)($at)
/* CAB5C 800C9F5C 24026130 */  addiu      $v0, $zero, 0x6130
/* CAB60 800C9F60 3C018010 */  lui        $at, %hi(D_800FA388)
/* CAB64 800C9F64 AC22A388 */  sw         $v0, %lo(D_800FA388)($at)
/* CAB68 800C9F68 24020005 */  addiu      $v0, $zero, 5
/* CAB6C 800C9F6C 3C018010 */  lui        $at, %hi(D_800FA38C)
/* CAB70 800C9F70 A422A38C */  sh         $v0, %lo(D_800FA38C)($at)
/* CAB74 800C9F74 24020004 */  addiu      $v0, $zero, 4
/* CAB78 800C9F78 3C018010 */  lui        $at, %hi(D_800FA394)
/* CAB7C 800C9F7C AC22A394 */  sw         $v0, %lo(D_800FA394)($at)
/* CAB80 800C9F80 3C020020 */  lui        $v0, 0x20
/* CAB84 800C9F84 3C018010 */  lui        $at, %hi(D_800FA398)
/* CAB88 800C9F88 AC22A398 */  sw         $v0, %lo(D_800FA398)($at)
/* CAB8C 800C9F8C 3C020080 */  lui        $v0, 0x80
/* CAB90 800C9F90 3C018010 */  lui        $at, %hi(D_800FA3A8)
/* CAB94 800C9F94 AC22A3A8 */  sw         $v0, %lo(D_800FA3A8)($at)
/* CAB98 800C9F98 34029000 */  ori        $v0, $zero, 0x9000
/* CAB9C 800C9F9C 3C018010 */  lui        $at, %hi(D_800FA390)
/* CABA0 800C9FA0 AC20A390 */  sw         $zero, %lo(D_800FA390)($at)
/* CABA4 800C9FA4 3C018010 */  lui        $at, %hi(D_800FA39C)
/* CABA8 800C9FA8 A425A39C */  sh         $a1, %lo(D_800FA39C)($at)
/* CABAC 800C9FAC 3C018010 */  lui        $at, %hi(D_800FA3A0)
/* CABB0 800C9FB0 AC20A3A0 */  sw         $zero, %lo(D_800FA3A0)($at)
/* CABB4 800C9FB4 3C018010 */  lui        $at, %hi(D_800FA3A4)
/* CABB8 800C9FB8 AC23A3A4 */  sw         $v1, %lo(D_800FA3A4)($at)
/* CABBC 800C9FBC 3C018010 */  lui        $at, %hi(D_800FA3AC)
/* CABC0 800C9FC0 A425A3AC */  sh         $a1, %lo(D_800FA3AC)($at)
/* CABC4 800C9FC4 3C018010 */  lui        $at, %hi(D_800FA3B0)
/* CABC8 800C9FC8 AC20A3B0 */  sw         $zero, %lo(D_800FA3B0)($at)
/* CABCC 800C9FCC 3C018010 */  lui        $at, %hi(D_800FA3B4)
/* CABD0 800C9FD0 AC24A3B4 */  sw         $a0, %lo(D_800FA3B4)($at)
/* CABD4 800C9FD4 3C018010 */  lui        $at, %hi(D_800FA3B8)
/* CABD8 800C9FD8 AC22A3B8 */  sw         $v0, %lo(D_800FA3B8)($at)
/* CABDC 800C9FDC 3C018010 */  lui        $at, %hi(D_800FA3BC)
/* CABE0 800C9FE0 A425A3BC */  sh         $a1, %lo(D_800FA3BC)($at)
/* CABE4 800C9FE4 3C018010 */  lui        $at, %hi(__rmonUtilityBuffer)
/* CABE8 800C9FE8 AC20A3C0 */  sw         $zero, %lo(__rmonUtilityBuffer)($at)
/* CABEC 800C9FEC 01002021 */  addu       $a0, $t0, $zero
.L800C9FF0:
/* CABF0 800C9FF0 00E02821 */  addu       $a1, $a3, $zero
/* CABF4 800C9FF4 0C03255A */  jal        __rmonSendReply
/* CABF8 800C9FF8 24060001 */   addiu     $a2, $zero, 1
/* CABFC 800C9FFC 8FBF0010 */  lw         $ra, 0x10($sp)
/* CAC00 800CA000 00001021 */  addu       $v0, $zero, $zero
/* CAC04 800CA004 03E00008 */  jr         $ra
/* CAC08 800CA008 27BD0018 */   addiu     $sp, $sp, 0x18
/* CAC0C 800CA00C 00000000 */  nop
