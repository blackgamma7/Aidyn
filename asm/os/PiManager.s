.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPiGetCmdQueue
/* C8580 800C7980 3C03800F */  lui        $v1, %hi(__osPiDevMgr)
/* C8584 800C7984 8C633870 */  lw         $v1, %lo(__osPiDevMgr)($v1)
/* C8588 800C7988 10600003 */  beqz       $v1, .L800C7998
/* C858C 800C798C 00001021 */   addu      $v0, $zero, $zero
/* C8590 800C7990 3C02800F */  lui        $v0, %hi(player_bss_003C)
/* C8594 800C7994 8C423878 */  lw         $v0, %lo(player_bss_003C)($v0)
.L800C7998:
/* C8598 800C7998 03E00008 */  jr         $ra
/* C859C 800C799C 00000000 */   nop

glabel osCreatePiManager
/* C85A0 800C79A0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* C85A4 800C79A4 AFB20020 */  sw         $s2, 0x20($sp)
/* C85A8 800C79A8 00809021 */  addu       $s2, $a0, $zero
/* C85AC 800C79AC AFB40028 */  sw         $s4, 0x28($sp)
/* C85B0 800C79B0 00A0A021 */  addu       $s4, $a1, $zero
/* C85B4 800C79B4 AFB5002C */  sw         $s5, 0x2c($sp)
/* C85B8 800C79B8 3C15800F */  lui        $s5, %hi(__osPiDevMgr)
/* C85BC 800C79BC 26B53870 */  addiu      $s5, $s5, %lo(__osPiDevMgr)
/* C85C0 800C79C0 AFBF0030 */  sw         $ra, 0x30($sp)
/* C85C4 800C79C4 AFB30024 */  sw         $s3, 0x24($sp)
/* C85C8 800C79C8 AFB1001C */  sw         $s1, 0x1c($sp)
/* C85CC 800C79CC AFB00018 */  sw         $s0, 0x18($sp)
/* C85D0 800C79D0 8EA20000 */  lw         $v0, ($s5)
/* C85D4 800C79D4 00C02821 */  addu       $a1, $a2, $zero
/* C85D8 800C79D8 1440005B */  bnez       $v0, .L800C7B48
/* C85DC 800C79DC 00E03021 */   addu      $a2, $a3, $zero
/* C85E0 800C79E0 0C02FBA4 */  jal        osCreateMesgQueue
/* C85E4 800C79E4 02802021 */   addu      $a0, $s4, $zero
/* C85E8 800C79E8 3C118010 */  lui        $s1, %hi(piEventQueue)
/* C85EC 800C79EC 26319410 */  addiu      $s1, $s1, %lo(piEventQueue)
/* C85F0 800C79F0 02202021 */  addu       $a0, $s1, $zero
/* C85F4 800C79F4 3C058010 */  lui        $a1, %hi(piEventBuf)
/* C85F8 800C79F8 24A59428 */  addiu      $a1, $a1, %lo(piEventBuf)
/* C85FC 800C79FC 0C02FBA4 */  jal        osCreateMesgQueue
/* C8600 800C7A00 24060001 */   addiu     $a2, $zero, 1
/* C8604 800C7A04 3C02800F */  lui        $v0, %hi(__osPiAccessQueueEnabled)
/* C8608 800C7A08 8C4238A0 */  lw         $v0, %lo(__osPiAccessQueueEnabled)($v0)
/* C860C 800C7A0C 54400004 */  bnel       $v0, $zero, .L800C7A20
/* C8610 800C7A10 24040008 */   addiu     $a0, $zero, 8
/* C8614 800C7A14 0C032140 */  jal        __osPiCreateAccessQueue
/* C8618 800C7A18 00000000 */   nop
/* C861C 800C7A1C 24040008 */  addiu      $a0, $zero, 8
.L800C7A20:
/* C8620 800C7A20 02202821 */  addu       $a1, $s1, $zero
/* C8624 800C7A24 3C062222 */  lui        $a2, 0x2222
/* C8628 800C7A28 0C033188 */  jal        osSetEventMesg
/* C862C 800C7A2C 34C62222 */   ori       $a2, $a2, 0x2222
/* C8630 800C7A30 2413FFFF */  addiu      $s3, $zero, -1
/* C8634 800C7A34 0C032138 */  jal        osGetThreadPri
/* C8638 800C7A38 00002021 */   addu      $a0, $zero, $zero
/* C863C 800C7A3C 00401821 */  addu       $v1, $v0, $zero
/* C8640 800C7A40 0072102A */  slt        $v0, $v1, $s2
/* C8644 800C7A44 10400005 */  beqz       $v0, .L800C7A5C
/* C8648 800C7A48 00000000 */   nop
/* C864C 800C7A4C 00609821 */  addu       $s3, $v1, $zero
/* C8650 800C7A50 00002021 */  addu       $a0, $zero, $zero
/* C8654 800C7A54 0C0331F4 */  jal        osSetThreadPri
/* C8658 800C7A58 02402821 */   addu      $a1, $s2, $zero
.L800C7A5C:
/* C865C 800C7A5C 0C030D90 */  jal        __osDisableInt
/* C8660 800C7A60 00000000 */   nop
/* C8664 800C7A64 3C10800F */  lui        $s0, %hi(piThread)
/* C8668 800C7A68 26107C70 */  addiu      $s0, $s0, %lo(piThread)
/* C866C 800C7A6C 02002021 */  addu       $a0, $s0, $zero
/* C8670 800C7A70 00002821 */  addu       $a1, $zero, $zero
/* C8674 800C7A74 3C06800C */  lui        $a2, %hi(__osDevMgrMain)
/* C8678 800C7A78 24C67C50 */  addiu      $a2, $a2, %lo(__osDevMgrMain)
/* C867C 800C7A7C 02A03821 */  addu       $a3, $s5, $zero
/* C8680 800C7A80 24030001 */  addiu      $v1, $zero, 1
/* C8684 800C7A84 ACE30000 */  sw         $v1, ($a3)
/* C8688 800C7A88 3C038010 */  lui        $v1, %hi(__osPiAccessQueue)
/* C868C 800C7A8C 24639530 */  addiu      $v1, $v1, %lo(__osPiAccessQueue)
/* C8690 800C7A90 3C01800F */  lui        $at, %hi(__osPiDevMgr+0x10)
/* C8694 800C7A94 AC233880 */  sw         $v1, %lo(__osPiDevMgr+0x10)($at)
/* C8698 800C7A98 3C03800D */  lui        $v1, %hi(osPiRawStartDma)
/* C869C 800C7A9C 246385F0 */  addiu      $v1, $v1, %lo(osPiRawStartDma)
/* C86A0 800C7AA0 3C01800F */  lui        $at, %hi(__osPiDevMgr+0x14)
/* C86A4 800C7AA4 AC233884 */  sw         $v1, %lo(__osPiDevMgr+0x14)($at)
/* C86A8 800C7AA8 3C03800D */  lui        $v1, %hi(osEPiRawStartDma)
/* C86AC 800C7AAC 24638010 */  addiu      $v1, $v1, %lo(osEPiRawStartDma)
/* C86B0 800C7AB0 3C01800F */  lui        $at, %hi(__osPiDevMgr+0x18)
/* C86B4 800C7AB4 AC233888 */  sw         $v1, %lo(__osPiDevMgr+0x18)($at)
/* C86B8 800C7AB8 3C038010 */  lui        $v1, %hi(ramromThread)
/* C86BC 800C7ABC 24638E20 */  addiu      $v1, $v1, %lo(ramromThread)
/* C86C0 800C7AC0 3C01800F */  lui        $at, %hi(__osPiDevMgr+0xC)
/* C86C4 800C7AC4 AC31387C */  sw         $s1, %lo(__osPiDevMgr+0xC)($at)
/* C86C8 800C7AC8 00408821 */  addu       $s1, $v0, $zero
/* C86CC 800C7ACC 3C01800F */  lui        $at, %hi(__osPiDevMgr+0x4)
/* C86D0 800C7AD0 AC303874 */  sw         $s0, %lo(__osPiDevMgr+0x4)($at)
/* C86D4 800C7AD4 3C01800F */  lui        $at, %hi(player_bss_003C)
/* C86D8 800C7AD8 AC343878 */  sw         $s4, %lo(player_bss_003C)($at)
/* C86DC 800C7ADC AFA30010 */  sw         $v1, 0x10($sp)
/* C86E0 800C7AE0 0C02FBB0 */  jal        osCreateThread
/* C86E4 800C7AE4 AFB20014 */   sw        $s2, 0x14($sp)
/* C86E8 800C7AE8 0C0334B8 */  jal        osStartThread
/* C86EC 800C7AEC 02002021 */   addu      $a0, $s0, $zero
/* C86F0 800C7AF0 3C108010 */  lui        $s0, %hi(ramromThread)
/* C86F4 800C7AF4 26108E20 */  addiu      $s0, $s0, %lo(ramromThread)
/* C86F8 800C7AF8 02002021 */  addu       $a0, $s0, $zero
/* C86FC 800C7AFC 00002821 */  addu       $a1, $zero, $zero
/* C8700 800C7B00 3C06800C */  lui        $a2, %hi(ramromMain)
/* C8704 800C7B04 24C67B6C */  addiu      $a2, $a2, %lo(ramromMain)
/* C8708 800C7B08 00003821 */  addu       $a3, $zero, $zero
/* C870C 800C7B0C 3C028010 */  lui        $v0, %hi(pimgr_bss_1760)
/* C8710 800C7B10 244293D0 */  addiu      $v0, $v0, %lo(pimgr_bss_1760)
/* C8714 800C7B14 AFA20010 */  sw         $v0, 0x10($sp)
/* C8718 800C7B18 2642FFFF */  addiu      $v0, $s2, -1
/* C871C 800C7B1C 0C02FBB0 */  jal        osCreateThread
/* C8720 800C7B20 AFA20014 */   sw        $v0, 0x14($sp)
/* C8724 800C7B24 0C0334B8 */  jal        osStartThread
/* C8728 800C7B28 02002021 */   addu      $a0, $s0, $zero
/* C872C 800C7B2C 0C030DAC */  jal        __osRestoreInt
/* C8730 800C7B30 02202021 */   addu      $a0, $s1, $zero
/* C8734 800C7B34 2402FFFF */  addiu      $v0, $zero, -1
/* C8738 800C7B38 12620003 */  beq        $s3, $v0, .L800C7B48
/* C873C 800C7B3C 00002021 */   addu      $a0, $zero, $zero
/* C8740 800C7B40 0C0331F4 */  jal        osSetThreadPri
/* C8744 800C7B44 02602821 */   addu      $a1, $s3, $zero
.L800C7B48:
/* C8748 800C7B48 8FBF0030 */  lw         $ra, 0x30($sp)
/* C874C 800C7B4C 8FB5002C */  lw         $s5, 0x2c($sp)
/* C8750 800C7B50 8FB40028 */  lw         $s4, 0x28($sp)
/* C8754 800C7B54 8FB30024 */  lw         $s3, 0x24($sp)
/* C8758 800C7B58 8FB20020 */  lw         $s2, 0x20($sp)
/* C875C 800C7B5C 8FB1001C */  lw         $s1, 0x1c($sp)
/* C8760 800C7B60 8FB00018 */  lw         $s0, 0x18($sp)
/* C8764 800C7B64 03E00008 */  jr         $ra
/* C8768 800C7B68 27BD0038 */   addiu     $sp, $sp, 0x38

glabel ramromMain
/* C876C 800C7B6C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C8770 800C7B70 AFB1001C */  sw         $s1, 0x1c($sp)
/* C8774 800C7B74 3C118010 */  lui        $s1, %hi(pimgr_bss_1760)
/* C8778 800C7B78 263193D0 */  addiu      $s1, $s1, %lo(pimgr_bss_1760)
/* C877C 800C7B7C 02202021 */  addu       $a0, $s1, $zero
/* C8780 800C7B80 3C058010 */  lui        $a1, %hi(pimgr_bss_1778)
/* C8784 800C7B84 24A593E8 */  addiu      $a1, $a1, %lo(pimgr_bss_1778)
/* C8788 800C7B88 24060001 */  addiu      $a2, $zero, 1
/* C878C 800C7B8C AFBF0020 */  sw         $ra, 0x20($sp)
/* C8790 800C7B90 0C02FBA4 */  jal        osCreateMesgQueue
/* C8794 800C7B94 AFB00018 */   sw        $s0, 0x18($sp)
/* C8798 800C7B98 3C108010 */  lui        $s0, %hi(pimgr_bss_1780)
/* C879C 800C7B9C 261093F0 */  addiu      $s0, $s0, %lo(pimgr_bss_1780)
/* C87A0 800C7BA0 02002021 */  addu       $a0, $s0, $zero
/* C87A4 800C7BA4 3C058010 */  lui        $a1, %hi(pimgr_bss_1798)
/* C87A8 800C7BA8 24A59408 */  addiu      $a1, $a1, %lo(pimgr_bss_1798)
/* C87AC 800C7BAC 0C02FBA4 */  jal        osCreateMesgQueue
/* C87B0 800C7BB0 24060001 */   addiu     $a2, $zero, 1
/* C87B4 800C7BB4 24040012 */  addiu      $a0, $zero, 0x12
/* C87B8 800C7BB8 02202821 */  addu       $a1, $s1, $zero
/* C87BC 800C7BBC 0C033188 */  jal        osSetEventMesg
/* C87C0 800C7BC0 00003021 */   addu      $a2, $zero, $zero
/* C87C4 800C7BC4 24040013 */  addiu      $a0, $zero, 0x13
/* C87C8 800C7BC8 02002821 */  addu       $a1, $s0, $zero
/* C87CC 800C7BCC 0C033188 */  jal        osSetEventMesg
/* C87D0 800C7BD0 00003021 */   addu      $a2, $zero, $zero
.L800C7BD4:
/* C87D4 800C7BD4 3C048010 */  lui        $a0, %hi(pimgr_bss_1760)
/* C87D8 800C7BD8 248493D0 */  addiu      $a0, $a0, %lo(pimgr_bss_1760)
/* C87DC 800C7BDC 00002821 */  addu       $a1, $zero, $zero
/* C87E0 800C7BE0 0C0321E4 */  jal        osRecvMesg
/* C87E4 800C7BE4 24060001 */   addiu     $a2, $zero, 1
/* C87E8 800C7BE8 0C032155 */  jal        __osPiGetAccess
/* C87EC 800C7BEC 00008021 */   addu      $s0, $zero, $zero
/* C87F0 800C7BF0 27A40010 */  addiu      $a0, $sp, 0x10
.L800C7BF4:
/* C87F4 800C7BF4 24050001 */  addiu      $a1, $zero, 1
/* C87F8 800C7BF8 0C02FF60 */  jal        __osRdbSend
/* C87FC 800C7BFC 24060009 */   addiu     $a2, $zero, 9
/* C8800 800C7C00 02028021 */  addu       $s0, $s0, $v0
/* C8804 800C7C04 1200FFFB */  beqz       $s0, .L800C7BF4
/* C8808 800C7C08 27A40010 */   addiu     $a0, $sp, 0x10
/* C880C 800C7C0C 3C048010 */  lui        $a0, %hi(pimgr_bss_1780)
/* C8810 800C7C10 248493F0 */  addiu      $a0, $a0, %lo(pimgr_bss_1780)
/* C8814 800C7C14 00002821 */  addu       $a1, $zero, $zero
/* C8818 800C7C18 0C0321E4 */  jal        osRecvMesg
/* C881C 800C7C1C 24060001 */   addiu     $a2, $zero, 1
/* C8820 800C7C20 0C032170 */  jal        __osSiRelAccess
/* C8824 800C7C24 00000000 */   nop
/* C8828 800C7C28 08031EF5 */  j          .L800C7BD4
/* C882C 800C7C2C 00000000 */   nop
/* C8830 800C7C30 8FBF0020 */  lw         $ra, 0x20($sp)
/* C8834 800C7C34 8FB1001C */  lw         $s1, 0x1c($sp)
/* C8838 800C7C38 8FB00018 */  lw         $s0, 0x18($sp)
/* C883C 800C7C3C 03E00008 */  jr         $ra
/* C8840 800C7C40 27BD0028 */   addiu     $sp, $sp, 0x28
/* C8844 800C7C44 00000000 */  nop
/* C8848 800C7C48 00000000 */  nop
/* C884C 800C7C4C 00000000 */  nop
