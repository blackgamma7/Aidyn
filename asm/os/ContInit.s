.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osContInit
/* BF5D0 800BE9D0 3C02800F */  lui        $v0, %hi(__osContinitialized)
/* BF5D4 800BE9D4 8C423730 */  lw         $v0, %lo(__osContinitialized)($v0)
/* BF5D8 800BE9D8 27BDFF80 */  addiu      $sp, $sp, -0x80
/* BF5DC 800BE9DC AFB40070 */  sw         $s4, 0x70($sp)
/* BF5E0 800BE9E0 0080A021 */  addu       $s4, $a0, $zero
/* BF5E4 800BE9E4 AFB50074 */  sw         $s5, 0x74($sp)
/* BF5E8 800BE9E8 00A0A821 */  addu       $s5, $a1, $zero
/* BF5EC 800BE9EC AFB60078 */  sw         $s6, 0x78($sp)
/* BF5F0 800BE9F0 00C0B021 */  addu       $s6, $a2, $zero
/* BF5F4 800BE9F4 AFBF007C */  sw         $ra, 0x7c($sp)
/* BF5F8 800BE9F8 AFB3006C */  sw         $s3, 0x6c($sp)
/* BF5FC 800BE9FC AFB20068 */  sw         $s2, 0x68($sp)
/* BF600 800BEA00 AFB10064 */  sw         $s1, 0x64($sp)
/* BF604 800BEA04 10400003 */  beqz       $v0, .L800BEA14
/* BF608 800BEA08 AFB00060 */   sw        $s0, 0x60($sp)
/* BF60C 800BEA0C 0802FAD1 */  j          .L800BEB44
/* BF610 800BEA10 00001021 */   addu      $v0, $zero, $zero
.L800BEA14:
/* BF614 800BEA14 24020001 */  addiu      $v0, $zero, 1
/* BF618 800BEA18 3C01800F */  lui        $at, %hi(__osContinitialized)
/* BF61C 800BEA1C 0C030C1C */  jal        osGetTime
/* BF620 800BEA20 AC223730 */   sw        $v0, %lo(__osContinitialized)($at)
/* BF624 800BEA24 00409021 */  addu       $s2, $v0, $zero
/* BF628 800BEA28 00609821 */  addu       $s3, $v1, $zero
/* BF62C 800BEA2C 56400022 */  bnel       $s2, $zero, .L800BEAB8
/* BF630 800BEA30 24020004 */   addiu     $v0, $zero, 4
/* BF634 800BEA34 16400007 */  bnez       $s2, .L800BEA54
/* BF638 800BEA38 27B10040 */   addiu     $s1, $sp, 0x40
/* BF63C 800BEA3C 3C020165 */  lui        $v0, 0x165
/* BF640 800BEA40 3442A0BB */  ori        $v0, $v0, 0xa0bb
/* BF644 800BEA44 0053102B */  sltu       $v0, $v0, $s3
/* BF648 800BEA48 1440001B */  bnez       $v0, .L800BEAB8
/* BF64C 800BEA4C 24020004 */   addiu     $v0, $zero, 4
/* BF650 800BEA50 27B10040 */  addiu      $s1, $sp, 0x40
.L800BEA54:
/* BF654 800BEA54 02202021 */  addu       $a0, $s1, $zero
/* BF658 800BEA58 27B00058 */  addiu      $s0, $sp, 0x58
/* BF65C 800BEA5C 02002821 */  addu       $a1, $s0, $zero
/* BF660 800BEA60 0C02FBA4 */  jal        osCreateMesgQueue
/* BF664 800BEA64 24060001 */   addiu     $a2, $zero, 1
/* BF668 800BEA68 00004021 */  addu       $t0, $zero, $zero
/* BF66C 800BEA6C 00004821 */  addu       $t1, $zero, $zero
/* BF670 800BEA70 27A40020 */  addiu      $a0, $sp, 0x20
/* BF674 800BEA74 24060000 */  addiu      $a2, $zero, 0
/* BF678 800BEA78 3C070165 */  lui        $a3, 0x165
/* BF67C 800BEA7C 34E7A0BC */  ori        $a3, $a3, 0xa0bc
/* BF680 800BEA80 00F3102B */  sltu       $v0, $a3, $s3
/* BF684 800BEA84 00F33823 */  subu       $a3, $a3, $s3
/* BF688 800BEA88 00D23023 */  subu       $a2, $a2, $s2
/* BF68C 800BEA8C 00C23023 */  subu       $a2, $a2, $v0
/* BF690 800BEA90 AFA80010 */  sw         $t0, 0x10($sp)
/* BF694 800BEA94 AFA90014 */  sw         $t1, 0x14($sp)
/* BF698 800BEA98 AFB10018 */  sw         $s1, 0x18($sp)
/* BF69C 800BEA9C 0C033228 */  jal        osSetTimer
/* BF6A0 800BEAA0 AFB0001C */   sw        $s0, 0x1c($sp)
/* BF6A4 800BEAA4 02202021 */  addu       $a0, $s1, $zero
/* BF6A8 800BEAA8 02002821 */  addu       $a1, $s0, $zero
/* BF6AC 800BEAAC 0C0321E4 */  jal        osRecvMesg
/* BF6B0 800BEAB0 24060001 */   addiu     $a2, $zero, 1
/* BF6B4 800BEAB4 24020004 */  addiu      $v0, $zero, 4
.L800BEAB8:
/* BF6B8 800BEAB8 3C01800F */  lui        $at, %hi(__osMaxControllers)
/* BF6BC 800BEABC A022575C */  sb         $v0, %lo(__osMaxControllers)($at)
/* BF6C0 800BEAC0 0C02FB08 */  jal        __osPackRequestData
/* BF6C4 800BEAC4 00002021 */   addu      $a0, $zero, $zero
/* BF6C8 800BEAC8 24040001 */  addiu      $a0, $zero, 1
/* BF6CC 800BEACC 3C11800F */  lui        $s1, %hi(__osContPifRam)
/* BF6D0 800BEAD0 26315760 */  addiu      $s1, $s1, %lo(__osContPifRam)
/* BF6D4 800BEAD4 0C0332F4 */  jal        __osSiRawStartDma
/* BF6D8 800BEAD8 02202821 */   addu      $a1, $s1, $zero
/* BF6DC 800BEADC 02802021 */  addu       $a0, $s4, $zero
/* BF6E0 800BEAE0 27B00058 */  addiu      $s0, $sp, 0x58
/* BF6E4 800BEAE4 02002821 */  addu       $a1, $s0, $zero
/* BF6E8 800BEAE8 0C0321E4 */  jal        osRecvMesg
/* BF6EC 800BEAEC 24060001 */   addiu     $a2, $zero, 1
/* BF6F0 800BEAF0 00002021 */  addu       $a0, $zero, $zero
/* BF6F4 800BEAF4 0C0332F4 */  jal        __osSiRawStartDma
/* BF6F8 800BEAF8 02202821 */   addu      $a1, $s1, $zero
/* BF6FC 800BEAFC 02802021 */  addu       $a0, $s4, $zero
/* BF700 800BEB00 02002821 */  addu       $a1, $s0, $zero
/* BF704 800BEB04 24060001 */  addiu      $a2, $zero, 1
/* BF708 800BEB08 0C0321E4 */  jal        osRecvMesg
/* BF70C 800BEB0C 00408021 */   addu      $s0, $v0, $zero
/* BF710 800BEB10 02A02021 */  addu       $a0, $s5, $zero
/* BF714 800BEB14 0C02FADB */  jal        __osContGetInitData
/* BF718 800BEB18 02C02821 */   addu      $a1, $s6, $zero
/* BF71C 800BEB1C 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* BF720 800BEB20 0C033250 */  jal        __osSiCreateAccessQueue
/* BF724 800BEB24 A02057A0 */   sb        $zero, %lo(__osContLastCmd)($at)
/* BF728 800BEB28 3C04800F */  lui        $a0, %hi(__osEepromTimerQ)
/* BF72C 800BEB2C 24845740 */  addiu      $a0, $a0, %lo(__osEepromTimerQ)
/* BF730 800BEB30 3C05800F */  lui        $a1, %hi(__osEepromTimerMsg)
/* BF734 800BEB34 24A55758 */  addiu      $a1, $a1, %lo(__osEepromTimerMsg)
/* BF738 800BEB38 0C02FBA4 */  jal        osCreateMesgQueue
/* BF73C 800BEB3C 24060001 */   addiu     $a2, $zero, 1
/* BF740 800BEB40 02001021 */  addu       $v0, $s0, $zero
.L800BEB44:
/* BF744 800BEB44 8FBF007C */  lw         $ra, 0x7c($sp)
/* BF748 800BEB48 8FB60078 */  lw         $s6, 0x78($sp)
/* BF74C 800BEB4C 8FB50074 */  lw         $s5, 0x74($sp)
/* BF750 800BEB50 8FB40070 */  lw         $s4, 0x70($sp)
/* BF754 800BEB54 8FB3006C */  lw         $s3, 0x6c($sp)
/* BF758 800BEB58 8FB20068 */  lw         $s2, 0x68($sp)
/* BF75C 800BEB5C 8FB10064 */  lw         $s1, 0x64($sp)
/* BF760 800BEB60 8FB00060 */  lw         $s0, 0x60($sp)
/* BF764 800BEB64 03E00008 */  jr         $ra
/* BF768 800BEB68 27BD0080 */   addiu     $sp, $sp, 0x80

glabel __osContGetInitData
/* BF76C 800BEB6C 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* BF770 800BEB70 00805821 */  addu       $t3, $a0, $zero
/* BF774 800BEB74 00A04821 */  addu       $t1, $a1, $zero
/* BF778 800BEB78 00005021 */  addu       $t2, $zero, $zero
/* BF77C 800BEB7C 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF780 800BEB80 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF784 800BEB84 3C08800F */  lui        $t0, %hi(__osContPifRam)
/* BF788 800BEB88 25085760 */  addiu      $t0, $t0, %lo(__osContPifRam)
/* BF78C 800BEB8C 18400021 */  blez       $v0, .L800BEC14
/* BF790 800BEB90 00003821 */   addu      $a3, $zero, $zero
/* BF794 800BEB94 240C0001 */  addiu      $t4, $zero, 1
/* BF798 800BEB98 24A60002 */  addiu      $a2, $a1, 2
.L800BEB9C:
/* BF79C 800BEB9C 89020000 */  lwl        $v0, ($t0)
/* BF7A0 800BEBA0 99020003 */  lwr        $v0, 3($t0)
/* BF7A4 800BEBA4 89030004 */  lwl        $v1, 4($t0)
/* BF7A8 800BEBA8 99030007 */  lwr        $v1, 7($t0)
/* BF7AC 800BEBAC ABA20000 */  swl        $v0, ($sp)
/* BF7B0 800BEBB0 BBA20003 */  swr        $v0, 3($sp)
/* BF7B4 800BEBB4 ABA30004 */  swl        $v1, 4($sp)
/* BF7B8 800BEBB8 BBA30007 */  swr        $v1, 7($sp)
/* BF7BC 800BEBBC 93A20002 */  lbu        $v0, 2($sp)
/* BF7C0 800BEBC0 304200C0 */  andi       $v0, $v0, 0xc0
/* BF7C4 800BEBC4 00021102 */  srl        $v0, $v0, 4
/* BF7C8 800BEBC8 1440000A */  bnez       $v0, .L800BEBF4
/* BF7CC 800BEBCC A0C20001 */   sb        $v0, 1($a2)
/* BF7D0 800BEBD0 93A20005 */  lbu        $v0, 5($sp)
/* BF7D4 800BEBD4 93A30004 */  lbu        $v1, 4($sp)
/* BF7D8 800BEBD8 00021200 */  sll        $v0, $v0, 8
/* BF7DC 800BEBDC 00621825 */  or         $v1, $v1, $v0
/* BF7E0 800BEBE0 A5230000 */  sh         $v1, ($t1)
/* BF7E4 800BEBE4 93A30006 */  lbu        $v1, 6($sp)
/* BF7E8 800BEBE8 00EC1004 */  sllv       $v0, $t4, $a3
/* BF7EC 800BEBEC 01425025 */  or         $t2, $t2, $v0
/* BF7F0 800BEBF0 A0C30000 */  sb         $v1, ($a2)
.L800BEBF4:
/* BF7F4 800BEBF4 24E70001 */  addiu      $a3, $a3, 1
/* BF7F8 800BEBF8 25080008 */  addiu      $t0, $t0, 8
/* BF7FC 800BEBFC 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF800 800BEC00 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF804 800BEC04 24C60004 */  addiu      $a2, $a2, 4
/* BF808 800BEC08 00E2102A */  slt        $v0, $a3, $v0
/* BF80C 800BEC0C 1440FFE3 */  bnez       $v0, .L800BEB9C
/* BF810 800BEC10 25290004 */   addiu     $t1, $t1, 4
.L800BEC14:
/* BF814 800BEC14 A16A0000 */  sb         $t2, ($t3)
/* BF818 800BEC18 03E00008 */  jr         $ra
/* BF81C 800BEC1C 27BD0010 */   addiu     $sp, $sp, 0x10

glabel __osPackRequestData
/* BF820 800BEC20 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* BF824 800BEC24 00802821 */  addu       $a1, $a0, $zero
/* BF828 800BEC28 2406000E */  addiu      $a2, $zero, 0xe
/* BF82C 800BEC2C 3C02800F */  lui        $v0, %hi(__osContPifRam+0x38)
/* BF830 800BEC30 24425798 */  addiu      $v0, $v0, %lo(__osContPifRam+0x38)
.L800BEC34:
/* BF834 800BEC34 AC400000 */  sw         $zero, ($v0)
/* BF838 800BEC38 24C6FFFF */  addiu      $a2, $a2, -1
/* BF83C 800BEC3C 04C1FFFD */  bgez       $a2, .L800BEC34
/* BF840 800BEC40 2442FFFC */   addiu     $v0, $v0, -4
/* BF844 800BEC44 3C03800F */  lui        $v1, %hi(__osContPifRam+0x3C)
/* BF848 800BEC48 2463579C */  addiu      $v1, $v1, %lo(__osContPifRam+0x3C)
/* BF84C 800BEC4C 2467FFC4 */  addiu      $a3, $v1, -0x3c
/* BF850 800BEC50 3C04800F */  lui        $a0, %hi(__osMaxControllers)
/* BF854 800BEC54 9084575C */  lbu        $a0, %lo(__osMaxControllers)($a0)
/* BF858 800BEC58 00003021 */  addu       $a2, $zero, $zero
/* BF85C 800BEC5C 24020001 */  addiu      $v0, $zero, 1
/* BF860 800BEC60 AC620000 */  sw         $v0, ($v1)
/* BF864 800BEC64 240300FF */  addiu      $v1, $zero, 0xff
/* BF868 800BEC68 24020001 */  addiu      $v0, $zero, 1
/* BF86C 800BEC6C A3A20001 */  sb         $v0, 1($sp)
/* BF870 800BEC70 24020003 */  addiu      $v0, $zero, 3
/* BF874 800BEC74 A3A30000 */  sb         $v1, ($sp)
/* BF878 800BEC78 A3A20002 */  sb         $v0, 2($sp)
/* BF87C 800BEC7C A3A50003 */  sb         $a1, 3($sp)
/* BF880 800BEC80 A3A30004 */  sb         $v1, 4($sp)
/* BF884 800BEC84 A3A30005 */  sb         $v1, 5($sp)
/* BF888 800BEC88 A3A30006 */  sb         $v1, 6($sp)
/* BF88C 800BEC8C 1880000F */  blez       $a0, .L800BECCC
/* BF890 800BEC90 A3A30007 */   sb        $v1, 7($sp)
.L800BEC94:
/* BF894 800BEC94 8BA20000 */  lwl        $v0, ($sp)
/* BF898 800BEC98 9BA20003 */  lwr        $v0, 3($sp)
/* BF89C 800BEC9C 8BA30004 */  lwl        $v1, 4($sp)
/* BF8A0 800BECA0 9BA30007 */  lwr        $v1, 7($sp)
/* BF8A4 800BECA4 A8E20000 */  swl        $v0, ($a3)
/* BF8A8 800BECA8 B8E20003 */  swr        $v0, 3($a3)
/* BF8AC 800BECAC A8E30004 */  swl        $v1, 4($a3)
/* BF8B0 800BECB0 B8E30007 */  swr        $v1, 7($a3)
/* BF8B4 800BECB4 3C02800F */  lui        $v0, %hi(__osMaxControllers)
/* BF8B8 800BECB8 9042575C */  lbu        $v0, %lo(__osMaxControllers)($v0)
/* BF8BC 800BECBC 24C60001 */  addiu      $a2, $a2, 1
/* BF8C0 800BECC0 00C2102A */  slt        $v0, $a2, $v0
/* BF8C4 800BECC4 1440FFF3 */  bnez       $v0, .L800BEC94
/* BF8C8 800BECC8 24E70008 */   addiu     $a3, $a3, 8
.L800BECCC:
/* BF8CC 800BECCC 240200FE */  addiu      $v0, $zero, 0xfe
/* BF8D0 800BECD0 A0E20000 */  sb         $v0, ($a3)
/* BF8D4 800BECD4 03E00008 */  jr         $ra
/* BF8D8 800BECD8 27BD0010 */   addiu     $sp, $sp, 0x10
/* BF8DC 800BECDC 00000000 */  nop
