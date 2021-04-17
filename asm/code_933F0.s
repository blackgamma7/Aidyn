.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800927F0
/* 933F0 800927F0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 933F4 800927F4 AFB30024 */  sw         $s3, 0x24($sp)
/* 933F8 800927F8 00809821 */  addu       $s3, $a0, $zero
/* 933FC 800927FC AFB1001C */  sw         $s1, 0x1c($sp)
/* 93400 80092800 8FB10040 */  lw         $s1, 0x40($sp)
/* 93404 80092804 240400B4 */  addiu      $a0, $zero, 0xb4
/* 93408 80092808 AFB40028 */  sw         $s4, 0x28($sp)
/* 9340C 8009280C 00A0A021 */  addu       $s4, $a1, $zero
/* 93410 80092810 AFB20020 */  sw         $s2, 0x20($sp)
/* 93414 80092814 00C09021 */  addu       $s2, $a2, $zero
/* 93418 80092818 AFB00018 */  sw         $s0, 0x18($sp)
/* 9341C 8009281C AFBF002C */  sw         $ra, 0x2c($sp)
/* 93420 80092820 0C026259 */  jal        passToMalloc
/* 93424 80092824 00E08021 */   addu      $s0, $a3, $zero
/* 93428 80092828 00402021 */  addu       $a0, $v0, $zero
/* 9342C 8009282C 02602821 */  addu       $a1, $s3, $zero
/* 93430 80092830 02403021 */  addu       $a2, $s2, $zero
/* 93434 80092834 02803821 */  addu       $a3, $s4, $zero
/* 93438 80092838 AFB00010 */  sw         $s0, 0x10($sp)
/* 9343C 8009283C 0C024A4D */  jal        func_80092934
/* 93440 80092840 AFB10014 */   sw        $s1, 0x14($sp)
/* 93444 80092844 8FBF002C */  lw         $ra, 0x2c($sp)
/* 93448 80092848 8FB40028 */  lw         $s4, 0x28($sp)
/* 9344C 8009284C 8FB30024 */  lw         $s3, 0x24($sp)
/* 93450 80092850 8FB20020 */  lw         $s2, 0x20($sp)
/* 93454 80092854 8FB1001C */  lw         $s1, 0x1c($sp)
/* 93458 80092858 8FB00018 */  lw         $s0, 0x18($sp)
/* 9345C 8009285C 03E00008 */  jr         $ra
/* 93460 80092860 27BD0030 */   addiu     $sp, $sp, 0x30

glabel init_combatItemValues
/* 93464 80092864 00001821 */  addu       $v1, $zero, $zero
/* 93468 80092868 3C02800F */  lui        $v0, %hi(CombatItemValues)
/* 9346C 8009286C 24451D10 */  addiu      $a1, $v0, %lo(CombatItemValues)
/* 93470 80092870 2404FFFF */  addiu      $a0, $zero, -1
/* 93474 80092874 00651021 */  addu       $v0, $v1, $a1
.L80092878:
/* 93478 80092878 A0440000 */  sb         $a0, ($v0)
/* 9347C 8009287C 24630001 */  addiu      $v1, $v1, 1
/* 93480 80092880 2C620004 */  sltiu      $v0, $v1, 4
/* 93484 80092884 1440FFFC */  bnez       $v0, .L80092878
/* 93488 80092888 00651021 */   addu      $v0, $v1, $a1
/* 9348C 8009288C 03E00008 */  jr         $ra
/* 93490 80092890 00000000 */   nop

glabel func_80092894
/* 93494 80092894 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 93498 80092898 AFB10014 */  sw         $s1, 0x14($sp)
/* 9349C 8009289C 3C11800F */  lui        $s1, %hi(combatPointer)
/* 934A0 800928A0 8E22F760 */  lw         $v0, %lo(combatPointer)($s1)
/* 934A4 800928A4 00A01821 */  addu       $v1, $a1, $zero
/* 934A8 800928A8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 934AC 800928AC AFB00010 */  sw         $s0, 0x10($sp)
/* 934B0 800928B0 9465005E */  lhu        $a1, 0x5e($v1)
/* 934B4 800928B4 8C50002C */  lw         $s0, 0x2c($v0)
/* 934B8 800928B8 9066005C */  lbu        $a2, 0x5c($v1)
/* 934BC 800928BC 0C01BE36 */  jal        func_8006F8D8
/* 934C0 800928C0 02002021 */   addu      $a0, $s0, $zero
/* 934C4 800928C4 02002821 */  addu       $a1, $s0, $zero
/* 934C8 800928C8 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 934CC 800928CC 8E24F760 */  lw         $a0, -0x8a0($s1)
/* 934D0 800928D0 24020009 */  addiu      $v0, $zero, 9
/* 934D4 800928D4 A0627C70 */  sb         $v0, %lo(combat_bytes)($v1)
/* 934D8 800928D8 0C01C9CB */  jal        func_8007272C
/* 934DC 800928DC 24844E64 */   addiu     $a0, $a0, 0x4e64
/* 934E0 800928E0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 934E4 800928E4 8FB10014 */  lw         $s1, 0x14($sp)
/* 934E8 800928E8 8FB00010 */  lw         $s0, 0x10($sp)
/* 934EC 800928EC 00001021 */  addu       $v0, $zero, $zero
/* 934F0 800928F0 03E00008 */  jr         $ra
/* 934F4 800928F4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800928F8
/* 934F8 800928F8 3C02800F */  lui        $v0, %hi(combatPointer)
/* 934FC 800928FC 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 93500 80092900 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 93504 80092904 AFBF0010 */  sw         $ra, 0x10($sp)
/* 93508 80092908 8C64002C */  lw         $a0, 0x2c($v1)
/* 9350C 8009290C 90A2005F */  lbu        $v0, 0x5f($a1)
/* 93510 80092910 8C860040 */  lw         $a2, 0x40($a0)
/* 93514 80092914 A0C2003D */  sb         $v0, 0x3d($a2)
/* 93518 80092918 90A3005C */  lbu        $v1, 0x5c($a1)
/* 9351C 8009291C 0C02355B */  jal        func_8008D56C
/* 93520 80092920 A0C3003E */   sb        $v1, 0x3e($a2)
/* 93524 80092924 8FBF0010 */  lw         $ra, 0x10($sp)
/* 93528 80092928 00001021 */  addu       $v0, $zero, $zero
/* 9352C 8009292C 03E00008 */  jr         $ra
/* 93530 80092930 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80092934
/* 93534 80092934 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 93538 80092938 3C03800E */  lui        $v1, %hi(ExpPakFlag)
/* 9353C 8009293C 946266C4 */  lhu        $v0, %lo(ExpPakFlag)($v1)
/* 93540 80092940 24080037 */  addiu      $t0, $zero, 0x37
/* 93544 80092944 AFB50074 */  sw         $s5, 0x74($sp)
/* 93548 80092948 0080A821 */  addu       $s5, $a0, $zero
/* 9354C 8009294C AFBF0084 */  sw         $ra, 0x84($sp)
/* 93550 80092950 AFBE0080 */  sw         $fp, 0x80($sp)
/* 93554 80092954 AFB7007C */  sw         $s7, 0x7c($sp)
/* 93558 80092958 AFB60078 */  sw         $s6, 0x78($sp)
/* 9355C 8009295C AFB40070 */  sw         $s4, 0x70($sp)
/* 93560 80092960 AFB3006C */  sw         $s3, 0x6c($sp)
/* 93564 80092964 AFB20068 */  sw         $s2, 0x68($sp)
/* 93568 80092968 AFB10064 */  sw         $s1, 0x64($sp)
/* 9356C 8009296C AFB00060 */  sw         $s0, 0x60($sp)
/* 93570 80092970 AFA5008C */  sw         $a1, 0x8c($sp)
/* 93574 80092974 AFA60090 */  sw         $a2, 0x90($sp)
/* 93578 80092978 10400002 */  beqz       $v0, .L80092984
/* 9357C 8009297C AFA70094 */   sw        $a3, 0x94($sp)
/* 93580 80092980 2408005F */  addiu      $t0, $zero, 0x5f
.L80092984:
/* 93584 80092984 02A02021 */  addu       $a0, $s5, $zero
/* 93588 80092988 24050020 */  addiu      $a1, $zero, 0x20
/* 9358C 8009298C 24060078 */  addiu      $a2, $zero, 0x78
/* 93590 80092990 01003821 */  addu       $a3, $t0, $zero
/* 93594 80092994 AFA00010 */  sw         $zero, 0x10($sp)
/* 93598 80092998 0C013521 */  jal        func_8004D484
/* 9359C 8009299C AFA00014 */   sw        $zero, 0x14($sp)
/* 935A0 800929A0 24140078 */  addiu      $s4, $zero, 0x78
/* 935A4 800929A4 00008821 */  addu       $s1, $zero, $zero
/* 935A8 800929A8 240435E5 */  addiu      $a0, $zero, 0x35e5
/* 935AC 800929AC 27A60020 */  addiu      $a2, $sp, 0x20
/* 935B0 800929B0 3C1E8009 */  lui        $fp, 0x8009
/* 935B4 800929B4 3C02800F */  lui        $v0, %hi(combatPointer)
/* 935B8 800929B8 241735E5 */  addiu      $s7, $zero, 0x35e5
/* 935BC 800929BC 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 935C0 800929C0 3C02800E */  lui        $v0, %hi(D_800E1F70)
/* 935C4 800929C4 8C65002C */  lw         $a1, 0x2c($v1)
/* 935C8 800929C8 24421F70 */  addiu      $v0, $v0, %lo(D_800E1F70)
/* 935CC 800929CC AEA20078 */  sw         $v0, 0x78($s5)
/* 935D0 800929D0 8CB60040 */  lw         $s6, 0x40($a1)
/* 935D4 800929D4 240200C8 */  addiu      $v0, $zero, 0xc8
/* 935D8 800929D8 A3A00020 */  sb         $zero, 0x20($sp)
/* 935DC 800929DC A0C20001 */  sb         $v0, 1($a2)
/* 935E0 800929E0 240200E1 */  addiu      $v0, $zero, 0xe1
/* 935E4 800929E4 A0C00002 */  sb         $zero, 2($a2)
/* 935E8 800929E8 0C0290E2 */  jal        get_borg_8
/* 935EC 800929EC A0C20003 */   sb        $v0, 3($a2)
/* 935F0 800929F0 00402021 */  addu       $a0, $v0, $zero
/* 935F4 800929F4 0C0299C0 */  jal        borg8_free
/* 935F8 800929F8 9453000A */   lhu       $s3, 0xa($v0)
/* 935FC 800929FC 8FB2009C */  lw         $s2, 0x9c($sp)
.L80092A00:
/* 93600 80092A00 8E470000 */  lw         $a3, ($s2)
/* 93604 80092A04 2402FFFF */  addiu      $v0, $zero, -1
/* 93608 80092A08 10E20016 */  beq        $a3, $v0, .L80092A64
/* 9360C 80092A0C 00111880 */   sll       $v1, $s1, 2
/* 93610 80092A10 27C52894 */  addiu      $a1, $fp, 0x2894
/* 93614 80092A14 26261000 */  addiu      $a2, $s1, 0x1000
/* 93618 80092A18 3C04800F */  lui        $a0, %hi(potion_names)
/* 9361C 80092A1C 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 93620 80092A20 8C821B30 */  lw         $v0, %lo(potion_names)($a0)
/* 93624 80092A24 27A40020 */  addiu      $a0, $sp, 0x20
/* 93628 80092A28 AFA40010 */  sw         $a0, 0x10($sp)
/* 9362C 80092A2C AFB70014 */  sw         $s7, 0x14($sp)
/* 93630 80092A30 AFB30018 */  sw         $s3, 0x18($sp)
/* 93634 80092A34 00621021 */  addu       $v0, $v1, $v0
/* 93638 80092A38 8C440000 */  lw         $a0, ($v0)
/* 9363C 80092A3C 0C0247A5 */  jal        char_func_icon
/* 93640 80092A40 30E700FF */   andi      $a3, $a3, 0xff
/* 93644 80092A44 00408021 */  addu       $s0, $v0, $zero
/* 93648 80092A48 02002021 */  addu       $a0, $s0, $zero
/* 9364C 80092A4C 0C0247FF */  jal        func_80091FFC
/* 93650 80092A50 02802821 */   addu      $a1, $s4, $zero
/* 93654 80092A54 0040A021 */  addu       $s4, $v0, $zero
/* 93658 80092A58 02A02021 */  addu       $a0, $s5, $zero
/* 9365C 80092A5C 0C013626 */  jal        func_8004D898
/* 93660 80092A60 02002821 */   addu      $a1, $s0, $zero
.L80092A64:
/* 93664 80092A64 26310001 */  addiu      $s1, $s1, 1
/* 93668 80092A68 2E220011 */  sltiu      $v0, $s1, 0x11
/* 9366C 80092A6C 1440FFE4 */  bnez       $v0, .L80092A00
/* 93670 80092A70 26520004 */   addiu     $s2, $s2, 4
/* 93674 80092A74 8FA2008C */  lw         $v0, 0x8c($sp)
/* 93678 80092A78 1040000A */  beqz       $v0, .L80092AA4
/* 9367C 80092A7C 02A02021 */   addu      $a0, $s5, $zero
/* 93680 80092A80 3C068009 */  lui        $a2, %hi(func_800928F8)
/* 93684 80092A84 24C628F8 */  addiu      $a2, $a2, %lo(func_800928F8)
/* 93688 80092A88 AFA00010 */  sw         $zero, 0x10($sp)
/* 9368C 80092A8C AFB40014 */  sw         $s4, 0x14($sp)
/* 93690 80092A90 AFB30018 */  sw         $s3, 0x18($sp)
/* 93694 80092A94 8EC50024 */  lw         $a1, 0x24($s6)
/* 93698 80092A98 0C024B7E */  jal        func_80092DF8
/* 9369C 80092A9C 24070004 */   addiu     $a3, $zero, 4
/* 936A0 80092AA0 0040A021 */  addu       $s4, $v0, $zero
.L80092AA4:
/* 936A4 80092AA4 8FA30090 */  lw         $v1, 0x90($sp)
/* 936A8 80092AA8 1060000B */  beqz       $v1, .L80092AD8
/* 936AC 80092AAC 02A02021 */   addu      $a0, $s5, $zero
/* 936B0 80092AB0 3C068009 */  lui        $a2, %hi(func_800928F8)
/* 936B4 80092AB4 8EC20020 */  lw         $v0, 0x20($s6)
/* 936B8 80092AB8 24C628F8 */  addiu      $a2, $a2, %lo(func_800928F8)
/* 936BC 80092ABC AFA00010 */  sw         $zero, 0x10($sp)
/* 936C0 80092AC0 AFB40014 */  sw         $s4, 0x14($sp)
/* 936C4 80092AC4 AFB30018 */  sw         $s3, 0x18($sp)
/* 936C8 80092AC8 8C450004 */  lw         $a1, 4($v0)
/* 936CC 80092ACC 0C024B7E */  jal        func_80092DF8
/* 936D0 80092AD0 24070003 */   addiu     $a3, $zero, 3
/* 936D4 80092AD4 0040A021 */  addu       $s4, $v0, $zero
.L80092AD8:
/* 936D8 80092AD8 8FA40094 */  lw         $a0, 0x94($sp)
/* 936DC 80092ADC 1080000B */  beqz       $a0, .L80092B0C
/* 936E0 80092AE0 02A02021 */   addu      $a0, $s5, $zero
/* 936E4 80092AE4 3C068009 */  lui        $a2, %hi(func_800928F8)
/* 936E8 80092AE8 8EC20020 */  lw         $v0, 0x20($s6)
/* 936EC 80092AEC 24C628F8 */  addiu      $a2, $a2, %lo(func_800928F8)
/* 936F0 80092AF0 AFA00010 */  sw         $zero, 0x10($sp)
/* 936F4 80092AF4 AFB40014 */  sw         $s4, 0x14($sp)
/* 936F8 80092AF8 AFB30018 */  sw         $s3, 0x18($sp)
/* 936FC 80092AFC 8C450000 */  lw         $a1, ($v0)
/* 93700 80092B00 0C024B7E */  jal        func_80092DF8
/* 93704 80092B04 24070002 */   addiu     $a3, $zero, 2
/* 93708 80092B08 0040A021 */  addu       $s4, $v0, $zero
.L80092B0C:
/* 9370C 80092B0C 00008821 */  addu       $s1, $zero, $zero
/* 93710 80092B10 3C108009 */  lui        $s0, 0x8009
/* 93714 80092B14 8FA30098 */  lw         $v1, 0x98($sp)
.L80092B18:
/* 93718 80092B18 00711021 */  addu       $v0, $v1, $s1
/* 9371C 80092B1C 90430000 */  lbu        $v1, ($v0)
/* 93720 80092B20 1060000E */  beqz       $v1, .L80092B5C
/* 93724 80092B24 02A02021 */   addu      $a0, $s5, $zero
/* 93728 80092B28 8EC30028 */  lw         $v1, 0x28($s6)
/* 9372C 80092B2C 260628F8 */  addiu      $a2, $s0, 0x28f8
/* 93730 80092B30 8C650000 */  lw         $a1, ($v1)
/* 93734 80092B34 322200FF */  andi       $v0, $s1, 0xff
/* 93738 80092B38 AFA20010 */  sw         $v0, 0x10($sp)
/* 9373C 80092B3C 00111080 */  sll        $v0, $s1, 2
/* 93740 80092B40 AFB40014 */  sw         $s4, 0x14($sp)
/* 93744 80092B44 AFB30018 */  sw         $s3, 0x18($sp)
/* 93748 80092B48 00451021 */  addu       $v0, $v0, $a1
/* 9374C 80092B4C 8C450000 */  lw         $a1, ($v0)
/* 93750 80092B50 0C024B7E */  jal        func_80092DF8
/* 93754 80092B54 24070005 */   addiu     $a3, $zero, 5
/* 93758 80092B58 0040A021 */  addu       $s4, $v0, $zero
.L80092B5C:
/* 9375C 80092B5C 26310001 */  addiu      $s1, $s1, 1
/* 93760 80092B60 2E22000C */  sltiu      $v0, $s1, 0xc
/* 93764 80092B64 1440FFEC */  bnez       $v0, .L80092B18
/* 93768 80092B68 8FA30098 */   lw        $v1, 0x98($sp)
/* 9376C 80092B6C 8EA4007C */  lw         $a0, 0x7c($s5)
/* 93770 80092B70 0C02EFF2 */  jal        func_800BBFC8
/* 93774 80092B74 24050003 */   addiu     $a1, $zero, 3
/* 93778 80092B78 0C013786 */  jal        func_8004DE18
/* 9377C 80092B7C 02A02021 */   addu      $a0, $s5, $zero
/* 93780 80092B80 0C024819 */  jal        find_char_in_party
/* 93784 80092B84 02C02021 */   addu      $a0, $s6, $zero
/* 93788 80092B88 2404007C */  addiu      $a0, $zero, 0x7c
/* 9378C 80092B8C 0C026259 */  jal        passToMalloc
/* 93790 80092B90 00409021 */   addu      $s2, $v0, $zero
/* 93794 80092B94 240438D0 */  addiu      $a0, $zero, 0x38d0
/* 93798 80092B98 0C0290E2 */  jal        get_borg_8
/* 9379C 80092B9C 00408021 */   addu      $s0, $v0, $zero
/* 937A0 80092BA0 02002021 */  addu       $a0, $s0, $zero
/* 937A4 80092BA4 0C02E518 */  jal        borg8_widget
/* 937A8 80092BA8 00402821 */   addu      $a1, $v0, $zero
/* 937AC 80092BAC 2404007C */  addiu      $a0, $zero, 0x7c
/* 937B0 80092BB0 0C026259 */  jal        passToMalloc
/* 937B4 80092BB4 00408821 */   addu      $s1, $v0, $zero
/* 937B8 80092BB8 240438CF */  addiu      $a0, $zero, 0x38cf
/* 937BC 80092BBC 0C0290E2 */  jal        get_borg_8
/* 937C0 80092BC0 00408021 */   addu      $s0, $v0, $zero
/* 937C4 80092BC4 02002021 */  addu       $a0, $s0, $zero
/* 937C8 80092BC8 0C02E518 */  jal        borg8_widget
/* 937CC 80092BCC 00402821 */   addu      $a1, $v0, $zero
/* 937D0 80092BD0 8E230078 */  lw         $v1, 0x78($s1)
/* 937D4 80092BD4 00408021 */  addu       $s0, $v0, $zero
/* 937D8 80092BD8 84640020 */  lh         $a0, 0x20($v1)
/* 937DC 80092BDC 8C650024 */  lw         $a1, 0x24($v1)
/* 937E0 80092BE0 00A0F809 */  jalr       $a1
/* 937E4 80092BE4 02242021 */   addu      $a0, $s1, $a0
/* 937E8 80092BE8 8EA3007C */  lw         $v1, 0x7c($s5)
/* 937EC 80092BEC 02202021 */  addu       $a0, $s1, $zero
/* 937F0 80092BF0 84650060 */  lh         $a1, 0x60($v1)
/* 937F4 80092BF4 84660062 */  lh         $a2, 0x62($v1)
/* 937F8 80092BF8 24A5FFF8 */  addiu      $a1, $a1, -8
/* 937FC 80092BFC 00C23023 */  subu       $a2, $a2, $v0
/* 93800 80092C00 0C02DD3F */  jal        set_widget_coords
/* 93804 80092C04 24C6FFFE */   addiu     $a2, $a2, -2
/* 93808 80092C08 8EA2007C */  lw         $v0, 0x7c($s5)
/* 9380C 80092C0C 02002021 */  addu       $a0, $s0, $zero
/* 93810 80092C10 84450060 */  lh         $a1, 0x60($v0)
/* 93814 80092C14 8446006A */  lh         $a2, 0x6a($v0)
/* 93818 80092C18 24A5FFF8 */  addiu      $a1, $a1, -8
/* 9381C 80092C1C 0C02DD3F */  jal        set_widget_coords
/* 93820 80092C20 24C60002 */   addiu     $a2, $a2, 2
/* 93824 80092C24 0C026259 */  jal        passToMalloc
/* 93828 80092C28 24040080 */   addiu     $a0, $zero, 0x80
/* 9382C 80092C2C 00402021 */  addu       $a0, $v0, $zero
/* 93830 80092C30 02203021 */  addu       $a2, $s1, $zero
/* 93834 80092C34 8EA5007C */  lw         $a1, 0x7c($s5)
/* 93838 80092C38 02003821 */  addu       $a3, $s0, $zero
/* 9383C 80092C3C 0C02ED4C */  jal        func_800BB530
/* 93840 80092C40 AFA00010 */   sw        $zero, 0x10($sp)
/* 93844 80092C44 240500FF */  addiu      $a1, $zero, 0xff
/* 93848 80092C48 240600FF */  addiu      $a2, $zero, 0xff
/* 9384C 80092C4C 8C490078 */  lw         $t1, 0x78($v0)
/* 93850 80092C50 240700FF */  addiu      $a3, $zero, 0xff
/* 93854 80092C54 AEA200B0 */  sw         $v0, 0xb0($s5)
/* 93858 80092C58 85240048 */  lh         $a0, 0x48($t1)
/* 9385C 80092C5C 240300FF */  addiu      $v1, $zero, 0xff
/* 93860 80092C60 AFA30010 */  sw         $v1, 0x10($sp)
/* 93864 80092C64 8D28004C */  lw         $t0, 0x4c($t1)
/* 93868 80092C68 0100F809 */  jalr       $t0
/* 9386C 80092C6C 00442021 */   addu      $a0, $v0, $a0
/* 93870 80092C70 8EA6007C */  lw         $a2, 0x7c($s5)
/* 93874 80092C74 8CC30078 */  lw         $v1, 0x78($a2)
/* 93878 80092C78 8EA500B0 */  lw         $a1, 0xb0($s5)
/* 9387C 80092C7C 84640030 */  lh         $a0, 0x30($v1)
/* 93880 80092C80 8C620034 */  lw         $v0, 0x34($v1)
/* 93884 80092C84 0040F809 */  jalr       $v0
/* 93888 80092C88 00C42021 */   addu      $a0, $a2, $a0
/* 9388C 80092C8C 3C03800F */  lui        $v1, %hi(CombatItemValues)
/* 93890 80092C90 24631D10 */  addiu      $v1, $v1, %lo(CombatItemValues)
/* 93894 80092C94 02439021 */  addu       $s2, $s2, $v1
/* 93898 80092C98 82440000 */  lb         $a0, ($s2)
/* 9389C 80092C9C 2402FFFF */  addiu      $v0, $zero, -1
/* 938A0 80092CA0 10820013 */  beq        $a0, $v0, .L80092CF0
/* 938A4 80092CA4 02A01021 */   addu      $v0, $s5, $zero
/* 938A8 80092CA8 8EA5007C */  lw         $a1, 0x7c($s5)
/* 938AC 80092CAC 8CB00040 */  lw         $s0, 0x40($a1)
/* 938B0 80092CB0 96030020 */  lhu        $v1, 0x20($s0)
/* 938B4 80092CB4 2463FFFF */  addiu      $v1, $v1, -1
/* 938B8 80092CB8 0064102A */  slt        $v0, $v1, $a0
/* 938BC 80092CBC 54400001 */  bnel       $v0, $zero, .L80092CC4
/* 938C0 80092CC0 00602021 */   addu      $a0, $v1, $zero
.L80092CC4:
/* 938C4 80092CC4 00041600 */  sll        $v0, $a0, 0x18
/* 938C8 80092CC8 8CA30078 */  lw         $v1, 0x78($a1)
/* 938CC 80092CCC 00022603 */  sra        $a0, $v0, 0x18
/* 938D0 80092CD0 A604001E */  sh         $a0, 0x1e($s0)
/* 938D4 80092CD4 84640028 */  lh         $a0, 0x28($v1)
/* 938D8 80092CD8 8C62002C */  lw         $v0, 0x2c($v1)
/* 938DC 80092CDC 0040F809 */  jalr       $v0
/* 938E0 80092CE0 00A42021 */   addu      $a0, $a1, $a0
/* 938E4 80092CE4 96030016 */  lhu        $v1, 0x16($s0)
/* 938E8 80092CE8 A6030012 */  sh         $v1, 0x12($s0)
/* 938EC 80092CEC 02A01021 */  addu       $v0, $s5, $zero
.L80092CF0:
/* 938F0 80092CF0 8FBF0084 */  lw         $ra, 0x84($sp)
/* 938F4 80092CF4 8FBE0080 */  lw         $fp, 0x80($sp)
/* 938F8 80092CF8 8FB7007C */  lw         $s7, 0x7c($sp)
/* 938FC 80092CFC 8FB60078 */  lw         $s6, 0x78($sp)
/* 93900 80092D00 8FB50074 */  lw         $s5, 0x74($sp)
/* 93904 80092D04 8FB40070 */  lw         $s4, 0x70($sp)
/* 93908 80092D08 8FB3006C */  lw         $s3, 0x6c($sp)
/* 9390C 80092D0C 8FB20068 */  lw         $s2, 0x68($sp)
/* 93910 80092D10 8FB10064 */  lw         $s1, 0x64($sp)
/* 93914 80092D14 8FB00060 */  lw         $s0, 0x60($sp)
/* 93918 80092D18 03E00008 */  jr         $ra
/* 9391C 80092D1C 27BD0088 */   addiu     $sp, $sp, 0x88

glabel func_80092D20
/* 93920 80092D20 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 93924 80092D24 AFB00010 */  sw         $s0, 0x10($sp)
/* 93928 80092D28 00808021 */  addu       $s0, $a0, $zero
/* 9392C 80092D2C 3C02800E */  lui        $v0, %hi(D_800E1F70)
/* 93930 80092D30 24421F70 */  addiu      $v0, $v0, %lo(D_800E1F70)
/* 93934 80092D34 AFBF0018 */  sw         $ra, 0x18($sp)
/* 93938 80092D38 AFB10014 */  sw         $s1, 0x14($sp)
/* 9393C 80092D3C 8E04007C */  lw         $a0, 0x7c($s0)
/* 93940 80092D40 00A08821 */  addu       $s1, $a1, $zero
/* 93944 80092D44 0C02F031 */  jal        func_800BC0C4
/* 93948 80092D48 AE020078 */   sw        $v0, 0x78($s0)
/* 9394C 80092D4C 8C430078 */  lw         $v1, 0x78($v0)
/* 93950 80092D50 84640078 */  lh         $a0, 0x78($v1)
/* 93954 80092D54 8C65007C */  lw         $a1, 0x7c($v1)
/* 93958 80092D58 00A0F809 */  jalr       $a1
/* 9395C 80092D5C 00442021 */   addu      $a0, $v0, $a0
/* 93960 80092D60 3C03800F */  lui        $v1, %hi(combatPointer)
/* 93964 80092D64 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 93968 80092D68 8C45002C */  lw         $a1, 0x2c($v0)
/* 9396C 80092D6C 0C024819 */  jal        find_char_in_party
/* 93970 80092D70 8CA40040 */   lw        $a0, 0x40($a1)
/* 93974 80092D74 8E04007C */  lw         $a0, 0x7c($s0)
/* 93978 80092D78 3C03800F */  lui        $v1, %hi(CombatItemValues)
/* 9397C 80092D7C 8C850040 */  lw         $a1, 0x40($a0)
/* 93980 80092D80 24631D10 */  addiu      $v1, $v1, %lo(CombatItemValues)
/* 93984 80092D84 90A4001F */  lbu        $a0, 0x1f($a1)
/* 93988 80092D88 00431021 */  addu       $v0, $v0, $v1
/* 9398C 80092D8C A0440000 */  sb         $a0, ($v0)
/* 93990 80092D90 8E06007C */  lw         $a2, 0x7c($s0)
/* 93994 80092D94 A200005C */  sb         $zero, 0x5c($s0)
/* 93998 80092D98 8CC30078 */  lw         $v1, 0x78($a2)
/* 9399C 80092D9C 8E0500B0 */  lw         $a1, 0xb0($s0)
/* 939A0 80092DA0 84640038 */  lh         $a0, 0x38($v1)
/* 939A4 80092DA4 8C62003C */  lw         $v0, 0x3c($v1)
/* 939A8 80092DA8 0040F809 */  jalr       $v0
/* 939AC 80092DAC 00C42021 */   addu      $a0, $a2, $a0
/* 939B0 80092DB0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 939B4 80092DB4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 939B8 80092DB8 260500B0 */  addiu      $a1, $s0, 0xb0
/* 939BC 80092DBC 24060006 */  addiu      $a2, $zero, 6
/* 939C0 80092DC0 0C035867 */  jal        AllocFreeQueueItem
/* 939C4 80092DC4 00003821 */   addu      $a3, $zero, $zero
/* 939C8 80092DC8 02002021 */  addu       $a0, $s0, $zero
/* 939CC 80092DCC 0C01357B */  jal        func_8004D5EC
/* 939D0 80092DD0 02202821 */   addu      $a1, $s1, $zero
/* 939D4 80092DD4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 939D8 80092DD8 8FB10014 */  lw         $s1, 0x14($sp)
/* 939DC 80092DDC 8FB00010 */  lw         $s0, 0x10($sp)
/* 939E0 80092DE0 03E00008 */  jr         $ra
/* 939E4 80092DE4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret0_80092de8
/* 939E8 80092DE8 03E00008 */  jr         $ra
/* 939EC 80092DEC 00001021 */   addu      $v0, $zero, $zero

glabel ret0_80092DF0
/* 939F0 80092DF0 03E00008 */  jr         $ra
/* 939F4 80092DF4 00001021 */   addu      $v0, $zero, $zero

glabel func_80092DF8
/* 939F8 80092DF8 27BDFF78 */  addiu      $sp, $sp, -0x88
/* 939FC 80092DFC AFB1006C */  sw         $s1, 0x6c($sp)
/* 93A00 80092E00 97B1009E */  lhu        $s1, 0x9e($sp)
/* 93A04 80092E04 AFB40078 */  sw         $s4, 0x78($sp)
/* 93A08 80092E08 93B4009B */  lbu        $s4, 0x9b($sp)
/* 93A0C 80092E0C AFB20070 */  sw         $s2, 0x70($sp)
/* 93A10 80092E10 97B200A2 */  lhu        $s2, 0xa2($sp)
/* 93A14 80092E14 AFB60080 */  sw         $s6, 0x80($sp)
/* 93A18 80092E18 0080B021 */  addu       $s6, $a0, $zero
/* 93A1C 80092E1C AFB5007C */  sw         $s5, 0x7c($sp)
/* 93A20 80092E20 00C0A821 */  addu       $s5, $a2, $zero
/* 93A24 80092E24 AFB30074 */  sw         $s3, 0x74($sp)
/* 93A28 80092E28 30F3FFFF */  andi       $s3, $a3, 0xffff
/* 93A2C 80092E2C AFBF0084 */  sw         $ra, 0x84($sp)
/* 93A30 80092E30 10A00026 */  beqz       $a1, .L80092ECC
/* 93A34 80092E34 AFB00068 */   sw        $s0, 0x68($sp)
/* 93A38 80092E38 8CA30010 */  lw         $v1, 0x10($a1)
/* 93A3C 80092E3C 10600024 */  beqz       $v1, .L80092ED0
/* 93A40 80092E40 02201021 */   addu      $v0, $s1, $zero
/* 93A44 80092E44 90620004 */  lbu        $v0, 4($v1)
/* 93A48 80092E48 10400021 */  beqz       $v0, .L80092ED0
/* 93A4C 80092E4C 02201021 */   addu      $v0, $s1, $zero
/* 93A50 80092E50 8C700000 */  lw         $s0, ($v1)
/* 93A54 80092E54 1200001F */  beqz       $s0, .L80092ED4
/* 93A58 80092E58 8FBF0084 */   lw        $ra, 0x84($sp)
/* 93A5C 80092E5C 94A40000 */  lhu        $a0, ($a1)
/* 93A60 80092E60 27A50060 */  addiu      $a1, $sp, 0x60
/* 93A64 80092E64 0C013218 */  jal        GetItemImage
/* 93A68 80092E68 AFA00060 */   sw        $zero, 0x60($sp)
/* 93A6C 80092E6C 240400C8 */  addiu      $a0, $zero, 0xc8
/* 93A70 80092E70 27A30020 */  addiu      $v1, $sp, 0x20
/* 93A74 80092E74 240200E1 */  addiu      $v0, $zero, 0xe1
/* 93A78 80092E78 02A02821 */  addu       $a1, $s5, $zero
/* 93A7C 80092E7C A3A40020 */  sb         $a0, 0x20($sp)
/* 93A80 80092E80 A0640001 */  sb         $a0, 1($v1)
/* 93A84 80092E84 A0600002 */  sb         $zero, 2($v1)
/* 93A88 80092E88 A0620003 */  sb         $v0, 3($v1)
/* 93A8C 80092E8C 8FA40060 */  lw         $a0, 0x60($sp)
/* 93A90 80092E90 02603021 */  addu       $a2, $s3, $zero
/* 93A94 80092E94 AFA30010 */  sw         $v1, 0x10($sp)
/* 93A98 80092E98 AFB20018 */  sw         $s2, 0x18($sp)
/* 93A9C 80092E9C AFA40014 */  sw         $a0, 0x14($sp)
/* 93AA0 80092EA0 8E040004 */  lw         $a0, 4($s0)
/* 93AA4 80092EA4 0C0247A5 */  jal        char_func_icon
/* 93AA8 80092EA8 02803821 */   addu      $a3, $s4, $zero
/* 93AAC 80092EAC 00408021 */  addu       $s0, $v0, $zero
/* 93AB0 80092EB0 02002021 */  addu       $a0, $s0, $zero
/* 93AB4 80092EB4 0C0247FF */  jal        func_80091FFC
/* 93AB8 80092EB8 02202821 */   addu      $a1, $s1, $zero
/* 93ABC 80092EBC 00408821 */  addu       $s1, $v0, $zero
/* 93AC0 80092EC0 02C02021 */  addu       $a0, $s6, $zero
/* 93AC4 80092EC4 0C013626 */  jal        func_8004D898
/* 93AC8 80092EC8 02002821 */   addu      $a1, $s0, $zero
.L80092ECC:
/* 93ACC 80092ECC 02201021 */  addu       $v0, $s1, $zero
.L80092ED0:
/* 93AD0 80092ED0 8FBF0084 */  lw         $ra, 0x84($sp)
.L80092ED4:
/* 93AD4 80092ED4 8FB60080 */  lw         $s6, 0x80($sp)
/* 93AD8 80092ED8 8FB5007C */  lw         $s5, 0x7c($sp)
/* 93ADC 80092EDC 8FB40078 */  lw         $s4, 0x78($sp)
/* 93AE0 80092EE0 8FB30074 */  lw         $s3, 0x74($sp)
/* 93AE4 80092EE4 8FB20070 */  lw         $s2, 0x70($sp)
/* 93AE8 80092EE8 8FB1006C */  lw         $s1, 0x6c($sp)
/* 93AEC 80092EEC 8FB00068 */  lw         $s0, 0x68($sp)
/* 93AF0 80092EF0 03E00008 */  jr         $ra
/* 93AF4 80092EF4 27BD0088 */   addiu     $sp, $sp, 0x88
/* 93AF8 80092EF8 00000000 */  nop
/* 93AFC 80092EFC 00000000 */  nop
