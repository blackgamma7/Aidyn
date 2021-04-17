.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonSendFault
/* C9510 800C8910 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C9514 800C8914 AFB00018 */  sw         $s0, 0x18($sp)
/* C9518 800C8918 00008021 */  addu       $s0, $zero, $zero
/* C951C 800C891C AFB1001C */  sw         $s1, 0x1c($sp)
/* C9520 800C8920 00808821 */  addu       $s1, $a0, $zero
/* C9524 800C8924 AFB20020 */  sw         $s2, 0x20($sp)
/* C9528 800C8928 241201B0 */  addiu      $s2, $zero, 0x1b0
/* C952C 800C892C AFBF0024 */  sw         $ra, 0x24($sp)
/* C9530 800C8930 AFA00010 */  sw         $zero, 0x10($sp)
/* C9534 800C8934 02302021 */  addu       $a0, $s1, $s0
.L800C8938:
/* C9538 800C8938 02502823 */  subu       $a1, $s2, $s0
/* C953C 800C893C 0C02FF60 */  jal        __osRdbSend
/* C9540 800C8940 24060002 */   addiu     $a2, $zero, 2
/* C9544 800C8944 02028021 */  addu       $s0, $s0, $v0
/* C9548 800C8948 2E0201B0 */  sltiu      $v0, $s0, 0x1b0
/* C954C 800C894C 1440FFFA */  bnez       $v0, .L800C8938
/* C9550 800C8950 02302021 */   addu      $a0, $s1, $s0
/* C9554 800C8954 8FBF0024 */  lw         $ra, 0x24($sp)
/* C9558 800C8958 8FB20020 */  lw         $s2, 0x20($sp)
/* C955C 800C895C 8FB1001C */  lw         $s1, 0x1c($sp)
/* C9560 800C8960 8FB00018 */  lw         $s0, 0x18($sp)
/* C9564 800C8964 03E00008 */  jr         $ra
/* C9568 800C8968 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __rmonIOflush
/* C956C 800C896C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C9570 800C8970 AFB00018 */  sw         $s0, 0x18($sp)
/* C9574 800C8974 00008021 */  addu       $s0, $zero, $zero
/* C9578 800C8978 AFBF001C */  sw         $ra, 0x1c($sp)
/* C957C 800C897C 27A40010 */  addiu      $a0, $sp, 0x10
.L800C8980:
/* C9580 800C8980 24050001 */  addiu      $a1, $zero, 1
/* C9584 800C8984 0C02FF60 */  jal        __osRdbSend
/* C9588 800C8988 2406000A */   addiu     $a2, $zero, 0xa
/* C958C 800C898C 02028021 */  addu       $s0, $s0, $v0
/* C9590 800C8990 1A00FFFB */  blez       $s0, .L800C8980
/* C9594 800C8994 27A40010 */   addiu     $a0, $sp, 0x10
/* C9598 800C8998 8FBF001C */  lw         $ra, 0x1c($sp)
/* C959C 800C899C 8FB00018 */  lw         $s0, 0x18($sp)
/* C95A0 800C89A0 03E00008 */  jr         $ra
/* C95A4 800C89A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonIOputw
/* C95A8 800C89A8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C95AC 800C89AC AFB00010 */  sw         $s0, 0x10($sp)
/* C95B0 800C89B0 00008021 */  addu       $s0, $zero, $zero
/* C95B4 800C89B4 AFB10014 */  sw         $s1, 0x14($sp)
/* C95B8 800C89B8 27B10020 */  addiu      $s1, $sp, 0x20
/* C95BC 800C89BC AFB20018 */  sw         $s2, 0x18($sp)
/* C95C0 800C89C0 24120004 */  addiu      $s2, $zero, 4
/* C95C4 800C89C4 AFBF001C */  sw         $ra, 0x1c($sp)
/* C95C8 800C89C8 AFA40020 */  sw         $a0, 0x20($sp)
/* C95CC 800C89CC 02302021 */  addu       $a0, $s1, $s0
.L800C89D0:
/* C95D0 800C89D0 02502823 */  subu       $a1, $s2, $s0
/* C95D4 800C89D4 0C02FF60 */  jal        __osRdbSend
/* C95D8 800C89D8 24060008 */   addiu     $a2, $zero, 8
/* C95DC 800C89DC 02028021 */  addu       $s0, $s0, $v0
/* C95E0 800C89E0 2A020004 */  slti       $v0, $s0, 4
/* C95E4 800C89E4 1440FFFA */  bnez       $v0, .L800C89D0
/* C95E8 800C89E8 02302021 */   addu      $a0, $s1, $s0
/* C95EC 800C89EC 8FBF001C */  lw         $ra, 0x1c($sp)
/* C95F0 800C89F0 8FB20018 */  lw         $s2, 0x18($sp)
/* C95F4 800C89F4 8FB10014 */  lw         $s1, 0x14($sp)
/* C95F8 800C89F8 8FB00010 */  lw         $s0, 0x10($sp)
/* C95FC 800C89FC 03E00008 */  jr         $ra
/* C9600 800C8A00 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonIOhandler
/* C9604 800C8A04 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C9608 800C8A08 AFB00018 */  sw         $s0, 0x18($sp)
/* C960C 800C8A0C 3C108010 */  lui        $s0, %hi(rmonsio_bss_0000)
/* C9610 800C8A10 26109580 */  addiu      $s0, $s0, %lo(rmonsio_bss_0000)
/* C9614 800C8A14 02002021 */  addu       $a0, $s0, $zero
/* C9618 800C8A18 3C058010 */  lui        $a1, %hi(rmonsio_bss_0018)
/* C961C 800C8A1C 24A59598 */  addiu      $a1, $a1, %lo(rmonsio_bss_0018)
/* C9620 800C8A20 24060001 */  addiu      $a2, $zero, 1
/* C9624 800C8A24 AFBF0020 */  sw         $ra, 0x20($sp)
/* C9628 800C8A28 0C02FBA4 */  jal        osCreateMesgQueue
/* C962C 800C8A2C AFB1001C */   sw        $s1, 0x1c($sp)
/* C9630 800C8A30 24040014 */  addiu      $a0, $zero, 0x14
/* C9634 800C8A34 02002821 */  addu       $a1, $s0, $zero
/* C9638 800C8A38 0C033188 */  jal        osSetEventMesg
/* C963C 800C8A3C 00003021 */   addu      $a2, $zero, $zero
/* C9640 800C8A40 3C028010 */  lui        $v0, %hi(rmonRdbReadBuf)
/* C9644 800C8A44 244295A8 */  addiu      $v0, $v0, %lo(rmonRdbReadBuf)
/* C9648 800C8A48 00408821 */  addu       $s1, $v0, $zero
/* C964C 800C8A4C 3C018010 */  lui        $at, %hi(__osRdb_DbgRead_Buf)
/* C9650 800C8A50 AC2295A0 */  sw         $v0, %lo(__osRdb_DbgRead_Buf)($at)
.L800C8A54:
/* C9654 800C8A54 3C048010 */  lui        $a0, %hi(rmonsio_bss_0000)
/* C9658 800C8A58 24849580 */  addiu      $a0, $a0, %lo(rmonsio_bss_0000)
/* C965C 800C8A5C 00002821 */  addu       $a1, $zero, $zero
/* C9660 800C8A60 0C0321E4 */  jal        osRecvMesg
/* C9664 800C8A64 24060001 */   addiu     $a2, $zero, 1
/* C9668 800C8A68 0C0322B0 */  jal        __rmonExecute
/* C966C 800C8A6C 02202021 */   addu      $a0, $s1, $zero
/* C9670 800C8A70 3C018010 */  lui        $at, %hi(__osRdb_DbgRead_Buf)
/* C9674 800C8A74 AC3195A0 */  sw         $s1, %lo(__osRdb_DbgRead_Buf)($at)
/* C9678 800C8A78 00008021 */  addu       $s0, $zero, $zero
/* C967C 800C8A7C 27A40010 */  addiu      $a0, $sp, 0x10
.L800C8A80:
/* C9680 800C8A80 24050001 */  addiu      $a1, $zero, 1
/* C9684 800C8A84 0C02FF60 */  jal        __osRdbSend
/* C9688 800C8A88 2406000B */   addiu     $a2, $zero, 0xb
/* C968C 800C8A8C 02028021 */  addu       $s0, $s0, $v0
/* C9690 800C8A90 5A00FFFB */  blezl      $s0, .L800C8A80
/* C9694 800C8A94 27A40010 */   addiu     $a0, $sp, 0x10
/* C9698 800C8A98 08032295 */  j          .L800C8A54
/* C969C 800C8A9C 00000000 */   nop
/* C96A0 800C8AA0 8FBF0020 */  lw         $ra, 0x20($sp)
/* C96A4 800C8AA4 8FB1001C */  lw         $s1, 0x1c($sp)
/* C96A8 800C8AA8 8FB00018 */  lw         $s0, 0x18($sp)
/* C96AC 800C8AAC 03E00008 */  jr         $ra
/* C96B0 800C8AB0 27BD0028 */   addiu     $sp, $sp, 0x28
/* C96B4 800C8AB4 00000000 */  nop
/* C96B8 800C8AB8 00000000 */  nop
/* C96BC 800C8ABC 00000000 */  nop
