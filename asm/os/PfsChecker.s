.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsChecker
/* C72C0 800C66C0 27BDFB60 */  addiu      $sp, $sp, -0x4a0
/* C72C4 800C66C4 AFB1047C */  sw         $s1, 0x47c($sp)
/* C72C8 800C66C8 00808821 */  addu       $s1, $a0, $zero
/* C72CC 800C66CC AFBE0498 */  sw         $fp, 0x498($sp)
/* C72D0 800C66D0 0000F021 */  addu       $fp, $zero, $zero
/* C72D4 800C66D4 AFB60490 */  sw         $s6, 0x490($sp)
/* C72D8 800C66D8 241600FE */  addiu      $s6, $zero, 0xfe
/* C72DC 800C66DC AFBF049C */  sw         $ra, 0x49c($sp)
/* C72E0 800C66E0 AFB70494 */  sw         $s7, 0x494($sp)
/* C72E4 800C66E4 AFB5048C */  sw         $s5, 0x48c($sp)
/* C72E8 800C66E8 AFB40488 */  sw         $s4, 0x488($sp)
/* C72EC 800C66EC AFB30484 */  sw         $s3, 0x484($sp)
/* C72F0 800C66F0 AFB20480 */  sw         $s2, 0x480($sp)
/* C72F4 800C66F4 0C031601 */  jal        __osCheckId
/* C72F8 800C66F8 AFB00478 */   sw        $s0, 0x478($sp)
/* C72FC 800C66FC 00408021 */  addu       $s0, $v0, $zero
/* C7300 800C6700 24020002 */  addiu      $v0, $zero, 2
/* C7304 800C6704 16020004 */  bne        $s0, $v0, .L800C6718
/* C7308 800C6708 00000000 */   nop
/* C730C 800C670C 0C03158E */  jal        __osGetId
/* C7310 800C6710 02202021 */   addu      $a0, $s1, $zero
/* C7314 800C6714 00408021 */  addu       $s0, $v0, $zero
.L800C6718:
/* C7318 800C6718 12000003 */  beqz       $s0, .L800C6728
/* C731C 800C671C 02202021 */   addu      $a0, $s1, $zero
.L800C6720:
/* C7320 800C6720 08031ABC */  j          .L800C6AF0
/* C7324 800C6724 02001021 */   addu      $v0, $s0, $zero
.L800C6728:
/* C7328 800C6728 0C031AC8 */  jal        corrupted_init
/* C732C 800C672C 27A50258 */   addiu     $a1, $sp, 0x258
/* C7330 800C6730 00408021 */  addu       $s0, $v0, $zero
/* C7334 800C6734 160000EE */  bnez       $s0, .L800C6AF0
/* C7338 800C6738 00000000 */   nop
/* C733C 800C673C 8E220050 */  lw         $v0, 0x50($s1)
/* C7340 800C6740 0202102A */  slt        $v0, $s0, $v0
/* C7344 800C6744 1040006B */  beqz       $v0, .L800C68F4
/* C7348 800C6748 00009021 */   addu      $s2, $zero, $zero
/* C734C 800C674C 27B70018 */  addiu      $s7, $sp, 0x18
.L800C6750:
/* C7350 800C6750 8E240004 */  lw         $a0, 4($s1)
/* C7354 800C6754 8E26005C */  lw         $a2, 0x5c($s1)
/* C7358 800C6758 8E250008 */  lw         $a1, 8($s1)
/* C735C 800C675C 27A70218 */  addiu      $a3, $sp, 0x218
/* C7360 800C6760 00D23021 */  addu       $a2, $a2, $s2
/* C7364 800C6764 0C0309EC */  jal        __osContRamRead
/* C7368 800C6768 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C736C 800C676C 00408021 */  addu       $s0, $v0, $zero
/* C7370 800C6770 160000DF */  bnez       $s0, .L800C6AF0
/* C7374 800C6774 02001021 */   addu      $v0, $s0, $zero
/* C7378 800C6778 97A2021C */  lhu        $v0, 0x21c($sp)
/* C737C 800C677C 14400006 */  bnez       $v0, .L800C6798
/* C7380 800C6780 00000000 */   nop
/* C7384 800C6784 8FA20218 */  lw         $v0, 0x218($sp)
/* C7388 800C6788 10400055 */  beqz       $v0, .L800C68E0
/* C738C 800C678C 2405FFFF */   addiu     $a1, $zero, -1
/* C7390 800C6790 08031A1C */  j          .L800C6870
/* C7394 800C6794 00000000 */   nop
.L800C6798:
/* C7398 800C6798 8FA20218 */  lw         $v0, 0x218($sp)
/* C739C 800C679C 14400003 */  bnez       $v0, .L800C67AC
/* C73A0 800C67A0 00002821 */   addu      $a1, $zero, $zero
/* C73A4 800C67A4 08031A1C */  j          .L800C6870
/* C73A8 800C67A8 2405FFFF */   addiu     $a1, $zero, -1
.L800C67AC:
/* C73AC 800C67AC 97B4021E */  lhu        $s4, 0x21e($sp)
/* C73B0 800C67B0 0000A821 */  addu       $s5, $zero, $zero
/* C73B4 800C67B4 8E220060 */  lw         $v0, 0x60($s1)
/* C73B8 800C67B8 08031A14 */  j          .L800C6850
/* C73BC 800C67BC 241300FF */   addiu     $s3, $zero, 0xff
.L800C67C0:
/* C73C0 800C67C0 0002182B */  sltu       $v1, $zero, $v0
/* C73C4 800C67C4 2C420080 */  sltiu      $v0, $v0, 0x80
/* C73C8 800C67C8 00621824 */  and        $v1, $v1, $v0
/* C73CC 800C67CC 10600028 */  beqz       $v1, .L800C6870
/* C73D0 800C67D0 00041A02 */   srl       $v1, $a0, 8
/* C73D4 800C67D4 326200FF */  andi       $v0, $s3, 0xff
/* C73D8 800C67D8 306700FF */  andi       $a3, $v1, 0xff
/* C73DC 800C67DC 1047000F */  beq        $v0, $a3, .L800C681C
/* C73E0 800C67E0 32C200FF */   andi      $v0, $s6, 0xff
/* C73E4 800C67E4 10470007 */  beq        $v0, $a3, .L800C6804
/* C73E8 800C67E8 00609821 */   addu      $s3, $v1, $zero
/* C73EC 800C67EC 02202021 */  addu       $a0, $s1, $zero
/* C73F0 800C67F0 27A50118 */  addiu      $a1, $sp, 0x118
/* C73F4 800C67F4 0C03162F */  jal        __osPfsRWInode
/* C73F8 800C67F8 00003021 */   addu      $a2, $zero, $zero
/* C73FC 800C67FC 00408021 */  addu       $s0, $v0, $zero
/* C7400 800C6800 0260B021 */  addu       $s6, $s3, $zero
.L800C6804:
/* C7404 800C6804 0010182B */  sltu       $v1, $zero, $s0
/* C7408 800C6808 3A020003 */  xori       $v0, $s0, 3
/* C740C 800C680C 0002102B */  sltu       $v0, $zero, $v0
/* C7410 800C6810 00621824 */  and        $v1, $v1, $v0
/* C7414 800C6814 146000B6 */  bnez       $v1, .L800C6AF0
/* C7418 800C6818 02001021 */   addu      $v0, $s0, $zero
.L800C681C:
/* C741C 800C681C 02202021 */  addu       $a0, $s1, $zero
/* C7420 800C6820 02802821 */  addu       $a1, $s4, $zero
/* C7424 800C6824 27A60258 */  addiu      $a2, $sp, 0x258
/* C7428 800C6828 0C031B1E */  jal        corrupted
/* C742C 800C682C 00052C00 */   sll       $a1, $a1, 0x10
/* C7430 800C6830 00552823 */  subu       $a1, $v0, $s5
/* C7434 800C6834 14A00014 */  bnez       $a1, .L800C6888
/* C7438 800C6838 328200FF */   andi      $v0, $s4, 0xff
/* C743C 800C683C 00021040 */  sll        $v0, $v0, 1
/* C7440 800C6840 00571021 */  addu       $v0, $v0, $s7
/* C7444 800C6844 94540100 */  lhu        $s4, 0x100($v0)
/* C7448 800C6848 8E220060 */  lw         $v0, 0x60($s1)
/* C744C 800C684C 24150001 */  addiu      $s5, $zero, 1
.L800C6850:
/* C7450 800C6850 3284FFFF */  andi       $a0, $s4, 0xffff
/* C7454 800C6854 0082102A */  slt        $v0, $a0, $v0
/* C7458 800C6858 14400005 */  bnez       $v0, .L800C6870
/* C745C 800C685C 00041202 */   srl       $v0, $a0, 8
/* C7460 800C6860 92230064 */  lbu        $v1, 0x64($s1)
/* C7464 800C6864 0043102B */  sltu       $v0, $v0, $v1
/* C7468 800C6868 1440FFD5 */  bnez       $v0, .L800C67C0
/* C746C 800C686C 328200FF */   andi      $v0, $s4, 0xff
.L800C6870:
/* C7470 800C6870 54A00006 */  bnel       $a1, $zero, .L800C688C
/* C7474 800C6874 27A40218 */   addiu     $a0, $sp, 0x218
/* C7478 800C6878 3283FFFF */  andi       $v1, $s4, 0xffff
/* C747C 800C687C 24020001 */  addiu      $v0, $zero, 1
/* C7480 800C6880 10620017 */  beq        $v1, $v0, .L800C68E0
/* C7484 800C6884 00000000 */   nop
.L800C6888:
/* C7488 800C6888 27A40218 */  addiu      $a0, $sp, 0x218
.L800C688C:
/* C748C 800C688C 0C02F9AC */  jal        _bzero
/* C7490 800C6890 24050020 */   addiu     $a1, $zero, 0x20
/* C7494 800C6894 92220065 */  lbu        $v0, 0x65($s1)
/* C7498 800C6898 10400006 */  beqz       $v0, .L800C68B4
/* C749C 800C689C 02202021 */   addu      $a0, $s1, $zero
/* C74A0 800C68A0 0C031DC8 */  jal        __osPfsSelectBank
/* C74A4 800C68A4 00002821 */   addu      $a1, $zero, $zero
/* C74A8 800C68A8 00408021 */  addu       $s0, $v0, $zero
/* C74AC 800C68AC 16000090 */  bnez       $s0, .L800C6AF0
/* C74B0 800C68B0 02001021 */   addu      $v0, $s0, $zero
.L800C68B4:
/* C74B4 800C68B4 8E26005C */  lw         $a2, 0x5c($s1)
/* C74B8 800C68B8 AFA00010 */  sw         $zero, 0x10($sp)
/* C74BC 800C68BC 8E240004 */  lw         $a0, 4($s1)
/* C74C0 800C68C0 8E250008 */  lw         $a1, 8($s1)
/* C74C4 800C68C4 27A70218 */  addiu      $a3, $sp, 0x218
/* C74C8 800C68C8 00D23021 */  addu       $a2, $a2, $s2
/* C74CC 800C68CC 0C030B30 */  jal        __osContRamWrite
/* C74D0 800C68D0 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C74D4 800C68D4 00408021 */  addu       $s0, $v0, $zero
/* C74D8 800C68D8 1600FF91 */  bnez       $s0, .L800C6720
/* C74DC 800C68DC 27DE0001 */   addiu     $fp, $fp, 1
.L800C68E0:
/* C74E0 800C68E0 8E220050 */  lw         $v0, 0x50($s1)
/* C74E4 800C68E4 26520001 */  addiu      $s2, $s2, 1
/* C74E8 800C68E8 0242102A */  slt        $v0, $s2, $v0
/* C74EC 800C68EC 1440FF98 */  bnez       $v0, .L800C6750
/* C74F0 800C68F0 00000000 */   nop
.L800C68F4:
/* C74F4 800C68F4 8E220050 */  lw         $v0, 0x50($s1)
/* C74F8 800C68F8 1840001D */  blez       $v0, .L800C6970
/* C74FC 800C68FC 00009021 */   addu      $s2, $zero, $zero
/* C7500 800C6900 27B30238 */  addiu      $s3, $sp, 0x238
.L800C6904:
/* C7504 800C6904 8E240004 */  lw         $a0, 4($s1)
/* C7508 800C6908 8E26005C */  lw         $a2, 0x5c($s1)
/* C750C 800C690C 8E250008 */  lw         $a1, 8($s1)
/* C7510 800C6910 27A70218 */  addiu      $a3, $sp, 0x218
/* C7514 800C6914 00D23021 */  addu       $a2, $a2, $s2
/* C7518 800C6918 0C0309EC */  jal        __osContRamRead
/* C751C 800C691C 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C7520 800C6920 00408021 */  addu       $s0, $v0, $zero
/* C7524 800C6924 16000072 */  bnez       $s0, .L800C6AF0
/* C7528 800C6928 02001021 */   addu      $v0, $s0, $zero
/* C752C 800C692C 97A2021C */  lhu        $v0, 0x21c($sp)
/* C7530 800C6930 5040000A */  beql       $v0, $zero, .L800C695C
/* C7534 800C6934 A6600000 */   sh        $zero, ($s3)
/* C7538 800C6938 8FA20218 */  lw         $v0, 0x218($sp)
/* C753C 800C693C 50400007 */  beql       $v0, $zero, .L800C695C
/* C7540 800C6940 A6600000 */   sh        $zero, ($s3)
/* C7544 800C6944 97A3021E */  lhu        $v1, 0x21e($sp)
/* C7548 800C6948 96220062 */  lhu        $v0, 0x62($s1)
/* C754C 800C694C 0062102B */  sltu       $v0, $v1, $v0
/* C7550 800C6950 54400002 */  bnel       $v0, $zero, .L800C695C
/* C7554 800C6954 A6600000 */   sh        $zero, ($s3)
/* C7558 800C6958 A6630000 */  sh         $v1, ($s3)
.L800C695C:
/* C755C 800C695C 8E220050 */  lw         $v0, 0x50($s1)
/* C7560 800C6960 26520001 */  addiu      $s2, $s2, 1
/* C7564 800C6964 0242102A */  slt        $v0, $s2, $v0
/* C7568 800C6968 1440FFE6 */  bnez       $v0, .L800C6904
/* C756C 800C696C 26730002 */   addiu     $s3, $s3, 2
.L800C6970:
/* C7570 800C6970 92220064 */  lbu        $v0, 0x64($s1)
/* C7574 800C6974 10400055 */  beqz       $v0, .L800C6ACC
/* C7578 800C6978 00009821 */   addu      $s3, $zero, $zero
/* C757C 800C697C 27B40018 */  addiu      $s4, $sp, 0x18
/* C7580 800C6980 27B60118 */  addiu      $s6, $sp, 0x118
/* C7584 800C6984 27B50238 */  addiu      $s5, $sp, 0x238
/* C7588 800C6988 02202021 */  addu       $a0, $s1, $zero
.L800C698C:
/* C758C 800C698C 27A50118 */  addiu      $a1, $sp, 0x118
/* C7590 800C6990 00003021 */  addu       $a2, $zero, $zero
/* C7594 800C6994 327200FF */  andi       $s2, $s3, 0xff
/* C7598 800C6998 0C03162F */  jal        __osPfsRWInode
/* C759C 800C699C 02403821 */   addu      $a3, $s2, $zero
/* C75A0 800C69A0 00408021 */  addu       $s0, $v0, $zero
/* C75A4 800C69A4 0010182B */  sltu       $v1, $zero, $s0
/* C75A8 800C69A8 3A020003 */  xori       $v0, $s0, 3
/* C75AC 800C69AC 0002102B */  sltu       $v0, $zero, $v0
/* C75B0 800C69B0 00621824 */  and        $v1, $v1, $v0
/* C75B4 800C69B4 5460004E */  bnel       $v1, $zero, .L800C6AF0
/* C75B8 800C69B8 02001021 */   addu      $v0, $s0, $zero
/* C75BC 800C69BC 16400002 */  bnez       $s2, .L800C69C8
/* C75C0 800C69C0 24050001 */   addiu     $a1, $zero, 1
/* C75C4 800C69C4 8E250060 */  lw         $a1, 0x60($s1)
.L800C69C8:
/* C75C8 800C69C8 18A0000A */  blez       $a1, .L800C69F4
/* C75CC 800C69CC 00009021 */   addu      $s2, $zero, $zero
/* C75D0 800C69D0 02802021 */  addu       $a0, $s4, $zero
/* C75D4 800C69D4 02C01821 */  addu       $v1, $s6, $zero
.L800C69D8:
/* C75D8 800C69D8 94620000 */  lhu        $v0, ($v1)
/* C75DC 800C69DC 24630002 */  addiu      $v1, $v1, 2
/* C75E0 800C69E0 26520001 */  addiu      $s2, $s2, 1
/* C75E4 800C69E4 A4820000 */  sh         $v0, ($a0)
/* C75E8 800C69E8 0245102A */  slt        $v0, $s2, $a1
/* C75EC 800C69EC 1440FFFA */  bnez       $v0, .L800C69D8
/* C75F0 800C69F0 24840002 */   addiu     $a0, $a0, 2
.L800C69F4:
/* C75F4 800C69F4 2A420080 */  slti       $v0, $s2, 0x80
/* C75F8 800C69F8 10400008 */  beqz       $v0, .L800C6A1C
/* C75FC 800C69FC 00121040 */   sll       $v0, $s2, 1
/* C7600 800C6A00 24040003 */  addiu      $a0, $zero, 3
/* C7604 800C6A04 00541821 */  addu       $v1, $v0, $s4
.L800C6A08:
/* C7608 800C6A08 A4640000 */  sh         $a0, ($v1)
/* C760C 800C6A0C 26520001 */  addiu      $s2, $s2, 1
/* C7610 800C6A10 2A420080 */  slti       $v0, $s2, 0x80
/* C7614 800C6A14 1440FFFC */  bnez       $v0, .L800C6A08
/* C7618 800C6A18 24630002 */   addiu     $v1, $v1, 2
.L800C6A1C:
/* C761C 800C6A1C 8E220050 */  lw         $v0, 0x50($s1)
/* C7620 800C6A20 1840001D */  blez       $v0, .L800C6A98
/* C7624 800C6A24 00009021 */   addu      $s2, $zero, $zero
/* C7628 800C6A28 326800FF */  andi       $t0, $s3, 0xff
/* C762C 800C6A2C 00003021 */  addu       $a2, $zero, $zero
/* C7630 800C6A30 02A03821 */  addu       $a3, $s5, $zero
.L800C6A34:
/* C7634 800C6A34 90E20000 */  lbu        $v0, ($a3)
/* C7638 800C6A38 14480011 */  bne        $v0, $t0, .L800C6A80
/* C763C 800C6A3C 02A02821 */   addu      $a1, $s5, $zero
.L800C6A40:
/* C7640 800C6A40 00A62021 */  addu       $a0, $a1, $a2
/* C7644 800C6A44 94830000 */  lhu        $v1, ($a0)
/* C7648 800C6A48 96220062 */  lhu        $v0, 0x62($s1)
/* C764C 800C6A4C 0062182B */  sltu       $v1, $v1, $v0
/* C7650 800C6A50 5460000C */  bnel       $v1, $zero, .L800C6A84
/* C7654 800C6A54 24C60002 */   addiu     $a2, $a2, 2
/* C7658 800C6A58 90820001 */  lbu        $v0, 1($a0)
/* C765C 800C6A5C 00021040 */  sll        $v0, $v0, 1
/* C7660 800C6A60 00541021 */  addu       $v0, $v0, $s4
/* C7664 800C6A64 94430100 */  lhu        $v1, 0x100($v0)
/* C7668 800C6A68 A4430000 */  sh         $v1, ($v0)
/* C766C 800C6A6C 00D41021 */  addu       $v0, $a2, $s4
/* C7670 800C6A70 A4430220 */  sh         $v1, 0x220($v0)
/* C7674 800C6A74 90820000 */  lbu        $v0, ($a0)
/* C7678 800C6A78 1048FFF1 */  beq        $v0, $t0, .L800C6A40
/* C767C 800C6A7C 00000000 */   nop
.L800C6A80:
/* C7680 800C6A80 24C60002 */  addiu      $a2, $a2, 2
.L800C6A84:
/* C7684 800C6A84 8E220050 */  lw         $v0, 0x50($s1)
/* C7688 800C6A88 26520001 */  addiu      $s2, $s2, 1
/* C768C 800C6A8C 0242102A */  slt        $v0, $s2, $v0
/* C7690 800C6A90 1440FFE8 */  bnez       $v0, .L800C6A34
/* C7694 800C6A94 24E70002 */   addiu     $a3, $a3, 2
.L800C6A98:
/* C7698 800C6A98 02202021 */  addu       $a0, $s1, $zero
/* C769C 800C6A9C 27A50018 */  addiu      $a1, $sp, 0x18
/* C76A0 800C6AA0 24060001 */  addiu      $a2, $zero, 1
/* C76A4 800C6AA4 0C03162F */  jal        __osPfsRWInode
/* C76A8 800C6AA8 326700FF */   andi      $a3, $s3, 0xff
/* C76AC 800C6AAC 00408021 */  addu       $s0, $v0, $zero
/* C76B0 800C6AB0 1600FF1B */  bnez       $s0, .L800C6720
/* C76B4 800C6AB4 26730001 */   addiu     $s3, $s3, 1
/* C76B8 800C6AB8 92230064 */  lbu        $v1, 0x64($s1)
/* C76BC 800C6ABC 326200FF */  andi       $v0, $s3, 0xff
/* C76C0 800C6AC0 0043102B */  sltu       $v0, $v0, $v1
/* C76C4 800C6AC4 1440FFB1 */  bnez       $v0, .L800C698C
/* C76C8 800C6AC8 02202021 */   addu      $a0, $s1, $zero
.L800C6ACC:
/* C76CC 800C6ACC 13C00004 */  beqz       $fp, .L800C6AE0
/* C76D0 800C6AD0 2403FFFD */   addiu     $v1, $zero, -3
/* C76D4 800C6AD4 8E220000 */  lw         $v0, ($s1)
/* C76D8 800C6AD8 08031ABA */  j          .L800C6AE8
/* C76DC 800C6ADC 34420002 */   ori       $v0, $v0, 2
.L800C6AE0:
/* C76E0 800C6AE0 8E220000 */  lw         $v0, ($s1)
/* C76E4 800C6AE4 00431024 */  and        $v0, $v0, $v1
.L800C6AE8:
/* C76E8 800C6AE8 AE220000 */  sw         $v0, ($s1)
/* C76EC 800C6AEC 00001021 */  addu       $v0, $zero, $zero
.L800C6AF0:
/* C76F0 800C6AF0 8FBF049C */  lw         $ra, 0x49c($sp)
/* C76F4 800C6AF4 8FBE0498 */  lw         $fp, 0x498($sp)
/* C76F8 800C6AF8 8FB70494 */  lw         $s7, 0x494($sp)
/* C76FC 800C6AFC 8FB60490 */  lw         $s6, 0x490($sp)
/* C7700 800C6B00 8FB5048C */  lw         $s5, 0x48c($sp)
/* C7704 800C6B04 8FB40488 */  lw         $s4, 0x488($sp)
/* C7708 800C6B08 8FB30484 */  lw         $s3, 0x484($sp)
/* C770C 800C6B0C 8FB20480 */  lw         $s2, 0x480($sp)
/* C7710 800C6B10 8FB1047C */  lw         $s1, 0x47c($sp)
/* C7714 800C6B14 8FB00478 */  lw         $s0, 0x478($sp)
/* C7718 800C6B18 03E00008 */  jr         $ra
/* C771C 800C6B1C 27BD04A0 */   addiu     $sp, $sp, 0x4a0

glabel corrupted_init
/* C7720 800C6B20 27BDFED0 */  addiu      $sp, $sp, -0x130
/* C7724 800C6B24 AFB20118 */  sw         $s2, 0x118($sp)
/* C7728 800C6B28 00809021 */  addu       $s2, $a0, $zero
/* C772C 800C6B2C AFB40120 */  sw         $s4, 0x120($sp)
/* C7730 800C6B30 00A0A021 */  addu       $s4, $a1, $zero
/* C7734 800C6B34 240500FF */  addiu      $a1, $zero, 0xff
/* C7738 800C6B38 268200FF */  addiu      $v0, $s4, 0xff
/* C773C 800C6B3C AFBF012C */  sw         $ra, 0x12c($sp)
/* C7740 800C6B40 AFB60128 */  sw         $s6, 0x128($sp)
/* C7744 800C6B44 AFB50124 */  sw         $s5, 0x124($sp)
/* C7748 800C6B48 AFB3011C */  sw         $s3, 0x11c($sp)
/* C774C 800C6B4C AFB10114 */  sw         $s1, 0x114($sp)
/* C7750 800C6B50 AFB00110 */  sw         $s0, 0x110($sp)
.L800C6B54:
/* C7754 800C6B54 A0400101 */  sb         $zero, 0x101($v0)
/* C7758 800C6B58 24A5FFFF */  addiu      $a1, $a1, -1
/* C775C 800C6B5C 04A1FFFD */  bgez       $a1, .L800C6B54
/* C7760 800C6B60 2442FFFF */   addiu     $v0, $v0, -1
/* C7764 800C6B64 240200FF */  addiu      $v0, $zero, 0xff
/* C7768 800C6B68 A2820100 */  sb         $v0, 0x100($s4)
/* C776C 800C6B6C 92420064 */  lbu        $v0, 0x64($s2)
/* C7770 800C6B70 10400036 */  beqz       $v0, .L800C6C4C
/* C7774 800C6B74 00009821 */   addu      $s3, $zero, $zero
/* C7778 800C6B78 27B50010 */  addiu      $s5, $sp, 0x10
/* C777C 800C6B7C 24160001 */  addiu      $s6, $zero, 1
/* C7780 800C6B80 327000FF */  andi       $s0, $s3, 0xff
.L800C6B84:
/* C7784 800C6B84 16000002 */  bnez       $s0, .L800C6B90
/* C7788 800C6B88 24110001 */   addiu     $s1, $zero, 1
/* C778C 800C6B8C 8E510060 */  lw         $s1, 0x60($s2)
.L800C6B90:
/* C7790 800C6B90 02402021 */  addu       $a0, $s2, $zero
/* C7794 800C6B94 27A50010 */  addiu      $a1, $sp, 0x10
/* C7798 800C6B98 00003021 */  addu       $a2, $zero, $zero
/* C779C 800C6B9C 0C03162F */  jal        __osPfsRWInode
/* C77A0 800C6BA0 02003821 */   addu      $a3, $s0, $zero
/* C77A4 800C6BA4 00402021 */  addu       $a0, $v0, $zero
/* C77A8 800C6BA8 0004182B */  sltu       $v1, $zero, $a0
/* C77AC 800C6BAC 38820003 */  xori       $v0, $a0, 3
/* C77B0 800C6BB0 0002102B */  sltu       $v0, $zero, $v0
/* C77B4 800C6BB4 00621824 */  and        $v1, $v1, $v0
/* C77B8 800C6BB8 14600025 */  bnez       $v1, .L800C6C50
/* C77BC 800C6BBC 00801021 */   addu      $v0, $a0, $zero
/* C77C0 800C6BC0 02202821 */  addu       $a1, $s1, $zero
/* C77C4 800C6BC4 28A20080 */  slti       $v0, $a1, 0x80
/* C77C8 800C6BC8 1040001A */  beqz       $v0, .L800C6C34
/* C77CC 800C6BCC 32020007 */   andi      $v0, $s0, 7
/* C77D0 800C6BD0 02003821 */  addu       $a3, $s0, $zero
/* C77D4 800C6BD4 00564004 */  sllv       $t0, $s6, $v0
/* C77D8 800C6BD8 00051040 */  sll        $v0, $a1, 1
/* C77DC 800C6BDC 00553021 */  addu       $a2, $v0, $s5
.L800C6BE0:
/* C77E0 800C6BE0 94C40000 */  lhu        $a0, ($a2)
/* C77E4 800C6BE4 8E420060 */  lw         $v0, 0x60($s2)
/* C77E8 800C6BE8 3083FFFF */  andi       $v1, $a0, 0xffff
/* C77EC 800C6BEC 0062102A */  slt        $v0, $v1, $v0
/* C77F0 800C6BF0 1440000D */  bnez       $v0, .L800C6C28
/* C77F4 800C6BF4 24A50001 */   addiu     $a1, $a1, 1
/* C77F8 800C6BF8 00031A02 */  srl        $v1, $v1, 8
/* C77FC 800C6BFC 1067000A */  beq        $v1, $a3, .L800C6C28
/* C7800 800C6C00 00000000 */   nop
/* C7804 800C6C04 3082007F */  andi       $v0, $a0, 0x7f
/* C7808 800C6C08 00021082 */  srl        $v0, $v0, 2
/* C780C 800C6C0C 30630007 */  andi       $v1, $v1, 7
/* C7810 800C6C10 00031940 */  sll        $v1, $v1, 5
/* C7814 800C6C14 00431021 */  addu       $v0, $v0, $v1
/* C7818 800C6C18 02821021 */  addu       $v0, $s4, $v0
/* C781C 800C6C1C 90430101 */  lbu        $v1, 0x101($v0)
/* C7820 800C6C20 00681825 */  or         $v1, $v1, $t0
/* C7824 800C6C24 A0430101 */  sb         $v1, 0x101($v0)
.L800C6C28:
/* C7828 800C6C28 28A20080 */  slti       $v0, $a1, 0x80
/* C782C 800C6C2C 1440FFEC */  bnez       $v0, .L800C6BE0
/* C7830 800C6C30 24C60002 */   addiu     $a2, $a2, 2
.L800C6C34:
/* C7834 800C6C34 92430064 */  lbu        $v1, 0x64($s2)
/* C7838 800C6C38 26730001 */  addiu      $s3, $s3, 1
/* C783C 800C6C3C 326200FF */  andi       $v0, $s3, 0xff
/* C7840 800C6C40 0043102B */  sltu       $v0, $v0, $v1
/* C7844 800C6C44 1440FFCF */  bnez       $v0, .L800C6B84
/* C7848 800C6C48 327000FF */   andi      $s0, $s3, 0xff
.L800C6C4C:
/* C784C 800C6C4C 00001021 */  addu       $v0, $zero, $zero
.L800C6C50:
/* C7850 800C6C50 8FBF012C */  lw         $ra, 0x12c($sp)
/* C7854 800C6C54 8FB60128 */  lw         $s6, 0x128($sp)
/* C7858 800C6C58 8FB50124 */  lw         $s5, 0x124($sp)
/* C785C 800C6C5C 8FB40120 */  lw         $s4, 0x120($sp)
/* C7860 800C6C60 8FB3011C */  lw         $s3, 0x11c($sp)
/* C7864 800C6C64 8FB20118 */  lw         $s2, 0x118($sp)
/* C7868 800C6C68 8FB10114 */  lw         $s1, 0x114($sp)
/* C786C 800C6C6C 8FB00110 */  lw         $s0, 0x110($sp)
/* C7870 800C6C70 03E00008 */  jr         $ra
/* C7874 800C6C74 27BD0130 */   addiu     $sp, $sp, 0x130

glabel corrupted
/* C7878 800C6C78 00052C03 */  sra        $a1, $a1, 0x10
/* C787C 800C6C7C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* C7880 800C6C80 AFB40028 */  sw         $s4, 0x28($sp)
/* C7884 800C6C84 0080A021 */  addu       $s4, $a0, $zero
/* C7888 800C6C88 AFB1001C */  sw         $s1, 0x1c($sp)
/* C788C 800C6C8C 00C08821 */  addu       $s1, $a2, $zero
/* C7890 800C6C90 AFB20020 */  sw         $s2, 0x20($sp)
/* C7894 800C6C94 00009021 */  addu       $s2, $zero, $zero
/* C7898 800C6C98 AFB00018 */  sw         $s0, 0x18($sp)
/* C789C 800C6C9C 00008021 */  addu       $s0, $zero, $zero
/* C78A0 800C6CA0 30A300FF */  andi       $v1, $a1, 0xff
/* C78A4 800C6CA4 00031882 */  srl        $v1, $v1, 2
/* C78A8 800C6CA8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* C78AC 800C6CAC 00053202 */  srl        $a2, $a1, 8
/* C78B0 800C6CB0 30C20007 */  andi       $v0, $a2, 7
/* C78B4 800C6CB4 AFBF0038 */  sw         $ra, 0x38($sp)
/* C78B8 800C6CB8 AFB70034 */  sw         $s7, 0x34($sp)
/* C78BC 800C6CBC AFB60030 */  sw         $s6, 0x30($sp)
/* C78C0 800C6CC0 AFB5002C */  sw         $s5, 0x2c($sp)
/* C78C4 800C6CC4 AFB30024 */  sw         $s3, 0x24($sp)
/* C78C8 800C6CC8 92840064 */  lbu        $a0, 0x64($s4)
/* C78CC 800C6CCC 00021140 */  sll        $v0, $v0, 5
/* C78D0 800C6CD0 10800037 */  beqz       $a0, .L800C6DB0
/* C78D4 800C6CD4 0062B821 */   addu      $s7, $v1, $v0
/* C78D8 800C6CD8 00A0A821 */  addu       $s5, $a1, $zero
/* C78DC 800C6CDC 00C0B021 */  addu       $s6, $a2, $zero
/* C78E0 800C6CE0 324700FF */  andi       $a3, $s2, 0xff
.L800C6CE4:
/* C78E4 800C6CE4 14E00002 */  bnez       $a3, .L800C6CF0
/* C78E8 800C6CE8 24130001 */   addiu     $s3, $zero, 1
/* C78EC 800C6CEC 8E930060 */  lw         $s3, 0x60($s4)
.L800C6CF0:
/* C78F0 800C6CF0 10F60007 */  beq        $a3, $s6, .L800C6D10
/* C78F4 800C6CF4 02371021 */   addu      $v0, $s1, $s7
/* C78F8 800C6CF8 90420101 */  lbu        $v0, 0x101($v0)
/* C78FC 800C6CFC 30E30007 */  andi       $v1, $a3, 7
/* C7900 800C6D00 00621007 */  srav       $v0, $v0, $v1
/* C7904 800C6D04 30420001 */  andi       $v0, $v0, 1
/* C7908 800C6D08 10400023 */  beqz       $v0, .L800C6D98
/* C790C 800C6D0C 00000000 */   nop
.L800C6D10:
/* C7910 800C6D10 92220100 */  lbu        $v0, 0x100($s1)
/* C7914 800C6D14 10E2000C */  beq        $a3, $v0, .L800C6D48
/* C7918 800C6D18 02802021 */   addu      $a0, $s4, $zero
/* C791C 800C6D1C 02202821 */  addu       $a1, $s1, $zero
/* C7920 800C6D20 0C03162F */  jal        __osPfsRWInode
/* C7924 800C6D24 00003021 */   addu      $a2, $zero, $zero
/* C7928 800C6D28 00402021 */  addu       $a0, $v0, $zero
/* C792C 800C6D2C 0004182B */  sltu       $v1, $zero, $a0
/* C7930 800C6D30 38820003 */  xori       $v0, $a0, 3
/* C7934 800C6D34 0002102B */  sltu       $v0, $zero, $v0
/* C7938 800C6D38 00621824 */  and        $v1, $v1, $v0
/* C793C 800C6D3C 1460001D */  bnez       $v1, .L800C6DB4
/* C7940 800C6D40 00801021 */   addu      $v0, $a0, $zero
/* C7944 800C6D44 A2320100 */  sb         $s2, 0x100($s1)
.L800C6D48:
/* C7948 800C6D48 02602821 */  addu       $a1, $s3, $zero
/* C794C 800C6D4C 2A020002 */  slti       $v0, $s0, 2
/* C7950 800C6D50 28A30080 */  slti       $v1, $a1, 0x80
/* C7954 800C6D54 00431024 */  and        $v0, $v0, $v1
/* C7958 800C6D58 1040000C */  beqz       $v0, .L800C6D8C
/* C795C 800C6D5C 00051040 */   sll       $v0, $a1, 1
/* C7960 800C6D60 00512021 */  addu       $a0, $v0, $s1
.L800C6D64:
/* C7964 800C6D64 94820000 */  lhu        $v0, ($a0)
/* C7968 800C6D68 24A50001 */  addiu      $a1, $a1, 1
/* C796C 800C6D6C 28A30080 */  slti       $v1, $a1, 0x80
/* C7970 800C6D70 00551026 */  xor        $v0, $v0, $s5
/* C7974 800C6D74 2C420001 */  sltiu      $v0, $v0, 1
/* C7978 800C6D78 02028021 */  addu       $s0, $s0, $v0
/* C797C 800C6D7C 2A020002 */  slti       $v0, $s0, 2
/* C7980 800C6D80 00431024 */  and        $v0, $v0, $v1
/* C7984 800C6D84 1440FFF7 */  bnez       $v0, .L800C6D64
/* C7988 800C6D88 24840002 */   addiu     $a0, $a0, 2
.L800C6D8C:
/* C798C 800C6D8C 2A020002 */  slti       $v0, $s0, 2
/* C7990 800C6D90 10400008 */  beqz       $v0, .L800C6DB4
/* C7994 800C6D94 24020002 */   addiu     $v0, $zero, 2
.L800C6D98:
/* C7998 800C6D98 92830064 */  lbu        $v1, 0x64($s4)
/* C799C 800C6D9C 26520001 */  addiu      $s2, $s2, 1
/* C79A0 800C6DA0 324200FF */  andi       $v0, $s2, 0xff
/* C79A4 800C6DA4 0043102B */  sltu       $v0, $v0, $v1
/* C79A8 800C6DA8 1440FFCE */  bnez       $v0, .L800C6CE4
/* C79AC 800C6DAC 324700FF */   andi      $a3, $s2, 0xff
.L800C6DB0:
/* C79B0 800C6DB0 02001021 */  addu       $v0, $s0, $zero
.L800C6DB4:
/* C79B4 800C6DB4 8FBF0038 */  lw         $ra, 0x38($sp)
/* C79B8 800C6DB8 8FB70034 */  lw         $s7, 0x34($sp)
/* C79BC 800C6DBC 8FB60030 */  lw         $s6, 0x30($sp)
/* C79C0 800C6DC0 8FB5002C */  lw         $s5, 0x2c($sp)
/* C79C4 800C6DC4 8FB40028 */  lw         $s4, 0x28($sp)
/* C79C8 800C6DC8 8FB30024 */  lw         $s3, 0x24($sp)
/* C79CC 800C6DCC 8FB20020 */  lw         $s2, 0x20($sp)
/* C79D0 800C6DD0 8FB1001C */  lw         $s1, 0x1c($sp)
/* C79D4 800C6DD4 8FB00018 */  lw         $s0, 0x18($sp)
/* C79D8 800C6DD8 03E00008 */  jr         $ra
/* C79DC 800C6DDC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel osPfsIsPlug
/* C79E0 800C6DE0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* C79E4 800C6DE4 AFB20040 */  sw         $s2, 0x40($sp)
/* C79E8 800C6DE8 00809021 */  addu       $s2, $a0, $zero
/* C79EC 800C6DEC AFB70054 */  sw         $s7, 0x54($sp)
/* C79F0 800C6DF0 00A0B821 */  addu       $s7, $a1, $zero
/* C79F4 800C6DF4 AFB30044 */  sw         $s3, 0x44($sp)
/* C79F8 800C6DF8 00009821 */  addu       $s3, $zero, $zero
/* C79FC 800C6DFC AFB00038 */  sw         $s0, 0x38($sp)
/* C7A00 800C6E00 24100003 */  addiu      $s0, $zero, 3
/* C7A04 800C6E04 AFBF0058 */  sw         $ra, 0x58($sp)
/* C7A08 800C6E08 AFB60050 */  sw         $s6, 0x50($sp)
/* C7A0C 800C6E0C AFB5004C */  sw         $s5, 0x4c($sp)
/* C7A10 800C6E10 AFB40048 */  sw         $s4, 0x48($sp)
/* C7A14 800C6E14 0C033265 */  jal        __osSiGetAccess
/* C7A18 800C6E18 AFB1003C */   sw        $s1, 0x3c($sp)
/* C7A1C 800C6E1C 3C14800F */  lui        $s4, %hi(__osPfsPifRam)
/* C7A20 800C6E20 26947C30 */  addiu      $s4, $s4, %lo(__osPfsPifRam)
/* C7A24 800C6E24 27B10020 */  addiu      $s1, $sp, 0x20
/* C7A28 800C6E28 27B50010 */  addiu      $s5, $sp, 0x10
.L800C6E2C:
/* C7A2C 800C6E2C 0C031BD7 */  jal        __osPfsRequestData
/* C7A30 800C6E30 00002021 */   addu      $a0, $zero, $zero
/* C7A34 800C6E34 24040001 */  addiu      $a0, $zero, 1
/* C7A38 800C6E38 0C0332F4 */  jal        __osSiRawStartDma
/* C7A3C 800C6E3C 02802821 */   addu      $a1, $s4, $zero
/* C7A40 800C6E40 02402021 */  addu       $a0, $s2, $zero
/* C7A44 800C6E44 02202821 */  addu       $a1, $s1, $zero
/* C7A48 800C6E48 0C0321E4 */  jal        osRecvMesg
/* C7A4C 800C6E4C 24060001 */   addiu     $a2, $zero, 1
/* C7A50 800C6E50 00002021 */  addu       $a0, $zero, $zero
/* C7A54 800C6E54 0C0332F4 */  jal        __osSiRawStartDma
/* C7A58 800C6E58 02802821 */   addu      $a1, $s4, $zero
/* C7A5C 800C6E5C 02402021 */  addu       $a0, $s2, $zero
/* C7A60 800C6E60 02202821 */  addu       $a1, $s1, $zero
/* C7A64 800C6E64 24060001 */  addiu      $a2, $zero, 1
/* C7A68 800C6E68 0C0321E4 */  jal        osRecvMesg
/* C7A6C 800C6E6C 0040B021 */   addu      $s6, $v0, $zero
/* C7A70 800C6E70 27A40024 */  addiu      $a0, $sp, 0x24
/* C7A74 800C6E74 0C031C00 */  jal        __osPfsGetInitData
/* C7A78 800C6E78 27A50010 */   addiu     $a1, $sp, 0x10
/* C7A7C 800C6E7C 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* C7A80 800C6E80 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* C7A84 800C6E84 1840000C */  blez       $v0, .L800C6EB8
/* C7A88 800C6E88 00002021 */   addu      $a0, $zero, $zero
/* C7A8C 800C6E8C 00402821 */  addu       $a1, $v0, $zero
/* C7A90 800C6E90 02A01821 */  addu       $v1, $s5, $zero
.L800C6E94:
/* C7A94 800C6E94 90620002 */  lbu        $v0, 2($v1)
/* C7A98 800C6E98 30420004 */  andi       $v0, $v0, 4
/* C7A9C 800C6E9C 54400003 */  bnel       $v0, $zero, .L800C6EAC
/* C7AA0 800C6EA0 24840001 */   addiu     $a0, $a0, 1
/* C7AA4 800C6EA4 08031BAE */  j          .L800C6EB8
/* C7AA8 800C6EA8 2610FFFF */   addiu     $s0, $s0, -1
.L800C6EAC:
/* C7AAC 800C6EAC 0085102A */  slt        $v0, $a0, $a1
/* C7AB0 800C6EB0 1440FFF8 */  bnez       $v0, .L800C6E94
/* C7AB4 800C6EB4 24630004 */   addiu     $v1, $v1, 4
.L800C6EB8:
/* C7AB8 800C6EB8 3C03800F */  lui        $v1, %hi(__osMaxControllers)
/* C7ABC 800C6EBC 9063575C */  lbu        $v1, %lo(__osMaxControllers)($v1)
/* C7AC0 800C6EC0 00831026 */  xor        $v0, $a0, $v1
/* C7AC4 800C6EC4 0002102B */  sltu       $v0, $zero, $v0
/* C7AC8 800C6EC8 00021023 */  negu       $v0, $v0
/* C7ACC 800C6ECC 02028024 */  and        $s0, $s0, $v0
/* C7AD0 800C6ED0 1E00FFD6 */  bgtz       $s0, .L800C6E2C
/* C7AD4 800C6ED4 00000000 */   nop
/* C7AD8 800C6ED8 10600011 */  beqz       $v1, .L800C6F20
/* C7ADC 800C6EDC 00002021 */   addu      $a0, $zero, $zero
/* C7AE0 800C6EE0 24060001 */  addiu      $a2, $zero, 1
/* C7AE4 800C6EE4 00602821 */  addu       $a1, $v1, $zero
/* C7AE8 800C6EE8 27A30010 */  addiu      $v1, $sp, 0x10
.L800C6EEC:
/* C7AEC 800C6EEC 90620003 */  lbu        $v0, 3($v1)
/* C7AF0 800C6EF0 54400008 */  bnel       $v0, $zero, .L800C6F14
/* C7AF4 800C6EF4 24840001 */   addiu     $a0, $a0, 1
/* C7AF8 800C6EF8 90620002 */  lbu        $v0, 2($v1)
/* C7AFC 800C6EFC 30420001 */  andi       $v0, $v0, 1
/* C7B00 800C6F00 50400004 */  beql       $v0, $zero, .L800C6F14
/* C7B04 800C6F04 24840001 */   addiu     $a0, $a0, 1
/* C7B08 800C6F08 00861004 */  sllv       $v0, $a2, $a0
/* C7B0C 800C6F0C 02629825 */  or         $s3, $s3, $v0
/* C7B10 800C6F10 24840001 */  addiu      $a0, $a0, 1
.L800C6F14:
/* C7B14 800C6F14 0085102A */  slt        $v0, $a0, $a1
/* C7B18 800C6F18 1440FFF4 */  bnez       $v0, .L800C6EEC
/* C7B1C 800C6F1C 24630004 */   addiu     $v1, $v1, 4
.L800C6F20:
/* C7B20 800C6F20 0C033280 */  jal        _osSiRelAccess
/* C7B24 800C6F24 00000000 */   nop
/* C7B28 800C6F28 A2F30000 */  sb         $s3, ($s7)
/* C7B2C 800C6F2C 02C01021 */  addu       $v0, $s6, $zero
/* C7B30 800C6F30 8FBF0058 */  lw         $ra, 0x58($sp)
/* C7B34 800C6F34 8FB70054 */  lw         $s7, 0x54($sp)
/* C7B38 800C6F38 8FB60050 */  lw         $s6, 0x50($sp)
/* C7B3C 800C6F3C 8FB5004C */  lw         $s5, 0x4c($sp)
/* C7B40 800C6F40 8FB40048 */  lw         $s4, 0x48($sp)
/* C7B44 800C6F44 8FB30044 */  lw         $s3, 0x44($sp)
/* C7B48 800C6F48 8FB20040 */  lw         $s2, 0x40($sp)
/* C7B4C 800C6F4C 8FB1003C */  lw         $s1, 0x3c($sp)
/* C7B50 800C6F50 8FB00038 */  lw         $s0, 0x38($sp)
/* C7B54 800C6F54 03E00008 */  jr         $ra
/* C7B58 800C6F58 27BD0060 */   addiu     $sp, $sp, 0x60

glabel __osPfsRequestData
/* C7B5C 800C6F5C 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* C7B60 800C6F60 3C05800F */  lui        $a1, %hi(__osMaxControllers)
/* C7B64 800C6F64 90A5575C */  lbu        $a1, %lo(__osMaxControllers)($a1)
/* C7B68 800C6F68 3C07800F */  lui        $a3, %hi(__osPfsPifRam)
/* C7B6C 800C6F6C 24E77C30 */  addiu      $a3, $a3, %lo(__osPfsPifRam)
/* C7B70 800C6F70 00003021 */  addu       $a2, $zero, $zero
/* C7B74 800C6F74 24020001 */  addiu      $v0, $zero, 1
/* C7B78 800C6F78 240300FF */  addiu      $v1, $zero, 0xff
/* C7B7C 800C6F7C 3C01800F */  lui        $at, %hi(__osPfsPifRam+0x3C)
/* C7B80 800C6F80 AC227C6C */  sw         $v0, %lo(__osPfsPifRam+0x3C)($at)
/* C7B84 800C6F84 24020001 */  addiu      $v0, $zero, 1
/* C7B88 800C6F88 A3A20001 */  sb         $v0, 1($sp)
/* C7B8C 800C6F8C 24020003 */  addiu      $v0, $zero, 3
/* C7B90 800C6F90 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* C7B94 800C6F94 A02457A0 */  sb         $a0, %lo(__osContLastCmd)($at)
/* C7B98 800C6F98 A3A30000 */  sb         $v1, ($sp)
/* C7B9C 800C6F9C A3A20002 */  sb         $v0, 2($sp)
/* C7BA0 800C6FA0 A3A40003 */  sb         $a0, 3($sp)
/* C7BA4 800C6FA4 A3A30004 */  sb         $v1, 4($sp)
/* C7BA8 800C6FA8 A3A30005 */  sb         $v1, 5($sp)
/* C7BAC 800C6FAC A3A30006 */  sb         $v1, 6($sp)
/* C7BB0 800C6FB0 18A0000F */  blez       $a1, .L800C6FF0
/* C7BB4 800C6FB4 A3A30007 */   sb        $v1, 7($sp)
.L800C6FB8:
/* C7BB8 800C6FB8 8BA20000 */  lwl        $v0, ($sp)
/* C7BBC 800C6FBC 9BA20003 */  lwr        $v0, 3($sp)
/* C7BC0 800C6FC0 8BA30004 */  lwl        $v1, 4($sp)
/* C7BC4 800C6FC4 9BA30007 */  lwr        $v1, 7($sp)
/* C7BC8 800C6FC8 A8E20000 */  swl        $v0, ($a3)
/* C7BCC 800C6FCC B8E20003 */  swr        $v0, 3($a3)
/* C7BD0 800C6FD0 A8E30004 */  swl        $v1, 4($a3)
/* C7BD4 800C6FD4 B8E30007 */  swr        $v1, 7($a3)
/* C7BD8 800C6FD8 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* C7BDC 800C6FDC 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* C7BE0 800C6FE0 24C60001 */  addiu      $a2, $a2, 1
/* C7BE4 800C6FE4 00C2102A */  slt        $v0, $a2, $v0
/* C7BE8 800C6FE8 1440FFF3 */  bnez       $v0, .L800C6FB8
/* C7BEC 800C6FEC 24E70008 */   addiu     $a3, $a3, 8
.L800C6FF0:
/* C7BF0 800C6FF0 240200FE */  addiu      $v0, $zero, 0xfe
/* C7BF4 800C6FF4 A0E20000 */  sb         $v0, ($a3)
/* C7BF8 800C6FF8 03E00008 */  jr         $ra
/* C7BFC 800C6FFC 27BD0010 */   addiu     $sp, $sp, 0x10

glabel __osPfsGetInitData
/* C7C00 800C7000 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* C7C04 800C7004 00805821 */  addu       $t3, $a0, $zero
/* C7C08 800C7008 00A04821 */  addu       $t1, $a1, $zero
/* C7C0C 800C700C 00005021 */  addu       $t2, $zero, $zero
/* C7C10 800C7010 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* C7C14 800C7014 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* C7C18 800C7018 3C08800F */  lui        $t0, %hi(__osPfsPifRam)
/* C7C1C 800C701C 25087C30 */  addiu      $t0, $t0, %lo(__osPfsPifRam)
/* C7C20 800C7020 18400021 */  blez       $v0, .L800C70A8
/* C7C24 800C7024 00003821 */   addu      $a3, $zero, $zero
/* C7C28 800C7028 240C0001 */  addiu      $t4, $zero, 1
/* C7C2C 800C702C 24A60002 */  addiu      $a2, $a1, 2
.L800C7030:
/* C7C30 800C7030 89020000 */  lwl        $v0, ($t0)
/* C7C34 800C7034 99020003 */  lwr        $v0, 3($t0)
/* C7C38 800C7038 89030004 */  lwl        $v1, 4($t0)
/* C7C3C 800C703C 99030007 */  lwr        $v1, 7($t0)
/* C7C40 800C7040 ABA20000 */  swl        $v0, ($sp)
/* C7C44 800C7044 BBA20003 */  swr        $v0, 3($sp)
/* C7C48 800C7048 ABA30004 */  swl        $v1, 4($sp)
/* C7C4C 800C704C BBA30007 */  swr        $v1, 7($sp)
/* C7C50 800C7050 93A20002 */  lbu        $v0, 2($sp)
/* C7C54 800C7054 304200C0 */  andi       $v0, $v0, 0xc0
/* C7C58 800C7058 00021102 */  srl        $v0, $v0, 4
/* C7C5C 800C705C 1440000A */  bnez       $v0, .L800C7088
/* C7C60 800C7060 A0C20001 */   sb        $v0, 1($a2)
/* C7C64 800C7064 93A20005 */  lbu        $v0, 5($sp)
/* C7C68 800C7068 93A30004 */  lbu        $v1, 4($sp)
/* C7C6C 800C706C 00021200 */  sll        $v0, $v0, 8
/* C7C70 800C7070 00621825 */  or         $v1, $v1, $v0
/* C7C74 800C7074 A5230000 */  sh         $v1, ($t1)
/* C7C78 800C7078 93A30006 */  lbu        $v1, 6($sp)
/* C7C7C 800C707C 00EC1004 */  sllv       $v0, $t4, $a3
/* C7C80 800C7080 01425025 */  or         $t2, $t2, $v0
/* C7C84 800C7084 A0C30000 */  sb         $v1, ($a2)
.L800C7088:
/* C7C88 800C7088 24E70001 */  addiu      $a3, $a3, 1
/* C7C8C 800C708C 25080008 */  addiu      $t0, $t0, 8
/* C7C90 800C7090 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* C7C94 800C7094 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* C7C98 800C7098 24C60004 */  addiu      $a2, $a2, 4
/* C7C9C 800C709C 00E2102A */  slt        $v0, $a3, $v0
/* C7CA0 800C70A0 1440FFE3 */  bnez       $v0, .L800C7030
/* C7CA4 800C70A4 25290004 */   addiu     $t1, $t1, 4
.L800C70A8:
/* C7CA8 800C70A8 A16A0000 */  sb         $t2, ($t3)
/* C7CAC 800C70AC 03E00008 */  jr         $ra
/* C7CB0 800C70B0 27BD0010 */   addiu     $sp, $sp, 0x10
/* C7CB4 800C70B4 00000000 */  nop
/* C7CB8 800C70B8 00000000 */  nop
/* C7CBC 800C70BC 00000000 */  nop
