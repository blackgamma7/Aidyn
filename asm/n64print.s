.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ofunc_8002d8c0
/* 2E4C0 8002D8C0 3C03800F */  lui        $v1, %hi(show_debug_queue)
/* 2E4C4 8002D8C4 30A50001 */  andi       $a1, $a1, 1
/* 2E4C8 8002D8C8 9464C624 */  lhu        $a0, %lo(show_debug_queue)($v1)
/* 2E4CC 8002D8CC 3C02800F */  lui        $v0, %hi(ofunc_value)
/* 2E4D0 8002D8D0 A465C624 */  sh         $a1, -0x39dc($v1)
/* 2E4D4 8002D8D4 03E00008 */  jr         $ra
/* 2E4D8 8002D8D8 A444C626 */   sh        $a0, %lo(ofunc_value)($v0)

glabel func_8002D8DC
/* 2E4DC 8002D8DC 3C02800F */  lui        $v0, %hi(ofunc_value)
/* 2E4E0 8002D8E0 9444C626 */  lhu        $a0, %lo(ofunc_value)($v0)
/* 2E4E4 8002D8E4 3C03800F */  lui        $v1, %hi(show_debug_queue)
/* 2E4E8 8002D8E8 03E00008 */  jr         $ra
/* 2E4EC 8002D8EC A464C624 */   sh        $a0, %lo(show_debug_queue)($v1)

glabel toggle_show_debug_queue
/* 2E4F0 8002D8F0 8CA20008 */  lw         $v0, 8($a1)
/* 2E4F4 8002D8F4 30420020 */  andi       $v0, $v0, 0x20
/* 2E4F8 8002D8F8 5040000F */  beql       $v0, $zero, .L8002D938
/* 2E4FC 8002D8FC 8CA2000C */   lw        $v0, 0xc($a1)
/* 2E500 8002D900 C4820010 */  lwc1       $f2, 0x10($a0)
/* 2E504 8002D904 44800000 */  mtc1       $zero, $f0
/* 2E508 8002D908 4600103E */  c.le.s     $f2, $f0
/* 2E50C 8002D90C 00000000 */  nop
/* 2E510 8002D910 45000005 */  bc1f       .L8002D928
/* 2E514 8002D914 00000000 */   nop
/* 2E518 8002D918 3C01800E */  lui        $at, %hi(D_800DAA00)
/* 2E51C 8002D91C C420AA00 */  lwc1       $f0, %lo(D_800DAA00)($at)
/* 2E520 8002D920 0800B64D */  j          .L8002D934
/* 2E524 8002D924 E4800010 */   swc1      $f0, 0x10($a0)
.L8002D928:
/* 2E528 8002D928 3C01800E */  lui        $at, %hi(D_800DAA04)
/* 2E52C 8002D92C C420AA04 */  lwc1       $f0, %lo(D_800DAA04)($at)
/* 2E530 8002D930 E4800010 */  swc1       $f0, 0x10($a0)
.L8002D934:
/* 2E534 8002D934 8CA2000C */  lw         $v0, 0xc($a1)
.L8002D938:
/* 2E538 8002D938 30420010 */  andi       $v0, $v0, 0x10
/* 2E53C 8002D93C 1040000B */  beqz       $v0, .L8002D96C
/* 2E540 8002D940 00000000 */   nop
/* 2E544 8002D944 8CA60008 */  lw         $a2, 8($a1)
/* 2E548 8002D948 30C21000 */  andi       $v0, $a2, 0x1000
/* 2E54C 8002D94C 10400007 */  beqz       $v0, .L8002D96C
/* 2E550 8002D950 3C02800F */   lui       $v0, %hi(show_debug_queue)
/* 2E554 8002D954 2403EFFF */  addiu      $v1, $zero, -0x1001
/* 2E558 8002D958 9444C624 */  lhu        $a0, %lo(show_debug_queue)($v0)
/* 2E55C 8002D95C 00C31824 */  and        $v1, $a2, $v1
/* 2E560 8002D960 ACA30008 */  sw         $v1, 8($a1)
/* 2E564 8002D964 38840001 */  xori       $a0, $a0, 1
/* 2E568 8002D968 A444C624 */  sh         $a0, -0x39dc($v0)
.L8002D96C:
/* 2E56C 8002D96C 03E00008 */  jr         $ra
/* 2E570 8002D970 00000000 */   nop

glabel debug_queue_func_
/* 2E574 8002D974 2406000A */  addiu      $a2, $zero, 0xa
/* 2E578 8002D978 3C040001 */  lui        $a0, 1
/* 2E57C 8002D97C 3C02800F */  lui        $v0, %hi(debugQueuePointer)
/* 2E580 8002D980 8C43C620 */  lw         $v1, %lo(debugQueuePointer)($v0)
/* 2E584 8002D984 3C050001 */  lui        $a1, 1
/* 2E588 8002D988 8C630000 */  lw         $v1, ($v1)
.L8002D98C:
/* 2E58C 8002D98C A0660000 */  sb         $a2, ($v1)
/* 2E590 8002D990 24630001 */  addiu      $v1, $v1, 1
/* 2E594 8002D994 00801021 */  addu       $v0, $a0, $zero
/* 2E598 8002D998 00021403 */  sra        $v0, $v0, 0x10
/* 2E59C 8002D99C 2842000A */  slti       $v0, $v0, 0xa
/* 2E5A0 8002D9A0 1440FFFA */  bnez       $v0, .L8002D98C
/* 2E5A4 8002D9A4 00852021 */   addu      $a0, $a0, $a1
/* 2E5A8 8002D9A8 03E00008 */  jr         $ra
/* 2E5AC 8002D9AC A0600000 */   sb        $zero, ($v1)

glabel n64print_init
/* 2E5B0 8002D9B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2E5B4 8002D9B4 AFB00010 */  sw         $s0, 0x10($sp)
/* 2E5B8 8002D9B8 3C10800F */  lui        $s0, %hi(debugQueuePointer)
/* 2E5BC 8002D9BC 3C05800E */  lui        $a1, %hi(D_800DAA08)
/* 2E5C0 8002D9C0 AE04C620 */  sw         $a0, %lo(debugQueuePointer)($s0)
/* 2E5C4 8002D9C4 24040172 */  addiu      $a0, $zero, 0x172
/* 2E5C8 8002D9C8 24A5AA08 */  addiu      $a1, $a1, %lo(D_800DAA08)
/* 2E5CC 8002D9CC AFBF0014 */  sw         $ra, 0x14($sp)
/* 2E5D0 8002D9D0 0C025F9C */  jal        Malloc
/* 2E5D4 8002D9D4 2406008D */   addiu     $a2, $zero, 0x8d
/* 2E5D8 8002D9D8 8E03C620 */  lw         $v1, -0x39e0($s0)
/* 2E5DC 8002D9DC 3C01800E */  lui        $at, %hi(D_800DAA1C)
/* 2E5E0 8002D9E0 C420AA1C */  lwc1       $f0, %lo(D_800DAA1C)($at)
/* 2E5E4 8002D9E4 AC620000 */  sw         $v0, ($v1)
/* 2E5E8 8002D9E8 E460000C */  swc1       $f0, 0xc($v1)
/* 2E5EC 8002D9EC E4600008 */  swc1       $f0, 8($v1)
/* 2E5F0 8002D9F0 E4600004 */  swc1       $f0, 4($v1)
/* 2E5F4 8002D9F4 AC600010 */  sw         $zero, 0x10($v1)
/* 2E5F8 8002D9F8 0C00B65D */  jal        debug_queue_func_
/* 2E5FC 8002D9FC A4600014 */   sh        $zero, 0x14($v1)
/* 2E600 8002DA00 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2E604 8002DA04 8FB00010 */  lw         $s0, 0x10($sp)
/* 2E608 8002DA08 03E00008 */  jr         $ra
/* 2E60C 8002DA0C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel n64print_free
/* 2E610 8002DA10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2E614 8002DA14 AFB00010 */  sw         $s0, 0x10($sp)
/* 2E618 8002DA18 3C10800F */  lui        $s0, %hi(debugQueuePointer)
/* 2E61C 8002DA1C 8E04C620 */  lw         $a0, %lo(debugQueuePointer)($s0)
/* 2E620 8002DA20 10800009 */  beqz       $a0, .L8002DA48
/* 2E624 8002DA24 AFBF0014 */   sw        $ra, 0x14($sp)
/* 2E628 8002DA28 3C05800E */  lui        $a1, %hi(D_800DAA08)
/* 2E62C 8002DA2C 24A5AA08 */  addiu      $a1, $a1, %lo(D_800DAA08)
/* 2E630 8002DA30 8C840000 */  lw         $a0, ($a0)
/* 2E634 8002DA34 0C02600C */  jal        Free
/* 2E638 8002DA38 240600A0 */   addiu     $a2, $zero, 0xa0
/* 2E63C 8002DA3C 8E02C620 */  lw         $v0, -0x39e0($s0)
/* 2E640 8002DA40 AE00C620 */  sw         $zero, -0x39e0($s0)
/* 2E644 8002DA44 AC400000 */  sw         $zero, ($v0)
.L8002DA48:
/* 2E648 8002DA48 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2E64C 8002DA4C 8FB00010 */  lw         $s0, 0x10($sp)
/* 2E650 8002DA50 03E00008 */  jr         $ra
/* 2E654 8002DA54 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_queue_sub
/* 2E658 8002DA58 00063400 */  sll        $a2, $a2, 0x10
/* 2E65C 8002DA5C 00063403 */  sra        $a2, $a2, 0x10
/* 2E660 8002DA60 00003821 */  addu       $a3, $zero, $zero
/* 2E664 8002DA64 1CC00003 */  bgtz       $a2, .L8002DA74
/* 2E668 8002DA68 30A500FF */   andi      $a1, $a1, 0xff
/* 2E66C 8002DA6C 03E00008 */  jr         $ra
/* 2E670 8002DA70 00801021 */   addu      $v0, $a0, $zero
.L8002DA74:
/* 2E674 8002DA74 00871021 */  addu       $v0, $a0, $a3
/* 2E678 8002DA78 90430000 */  lbu        $v1, ($v0)
/* 2E67C 8002DA7C 1060000D */  beqz       $v1, .L8002DAB4
/* 2E680 8002DA80 00000000 */   nop
/* 2E684 8002DA84 14650008 */  bne        $v1, $a1, .L8002DAA8
/* 2E688 8002DA88 24E20001 */   addiu     $v0, $a3, 1
/* 2E68C 8002DA8C 24C2FFFF */  addiu      $v0, $a2, -1
/* 2E690 8002DA90 00021400 */  sll        $v0, $v0, 0x10
/* 2E694 8002DA94 00023403 */  sra        $a2, $v0, 0x10
/* 2E698 8002DA98 1CC00003 */  bgtz       $a2, .L8002DAA8
/* 2E69C 8002DA9C 24E20001 */   addiu     $v0, $a3, 1
/* 2E6A0 8002DAA0 03E00008 */  jr         $ra
/* 2E6A4 8002DAA4 00821021 */   addu      $v0, $a0, $v0
.L8002DAA8:
/* 2E6A8 8002DAA8 00021400 */  sll        $v0, $v0, 0x10
/* 2E6AC 8002DAAC 0800B69D */  j          .L8002DA74
/* 2E6B0 8002DAB0 00023C03 */   sra       $a3, $v0, 0x10
.L8002DAB4:
/* 2E6B4 8002DAB4 03E00008 */  jr         $ra
/* 2E6B8 8002DAB8 00000000 */   nop

glabel Ofunc_Passto_debug_queue
/* 2E6BC 8002DABC 90820000 */  lbu        $v0, ($a0)
/* 2E6C0 8002DAC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2E6C4 8002DAC4 10400003 */  beqz       $v0, .L8002DAD4
/* 2E6C8 8002DAC8 AFBF0010 */   sw        $ra, 0x10($sp)
/* 2E6CC 8002DACC 0C00B6B8 */  jal        debug_queue
/* 2E6D0 8002DAD0 00000000 */   nop
.L8002DAD4:
/* 2E6D4 8002DAD4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2E6D8 8002DAD8 03E00008 */  jr         $ra
/* 2E6DC 8002DADC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel debug_queue
/* 2E6E0 8002DAE0 27BDFE60 */  addiu      $sp, $sp, -0x1a0
/* 2E6E4 8002DAE4 AFBF0198 */  sw         $ra, 0x198($sp)
/* 2E6E8 8002DAE8 AFB10194 */  sw         $s1, 0x194($sp)
/* 2E6EC 8002DAEC AFB00190 */  sw         $s0, 0x190($sp)
/* 2E6F0 8002DAF0 90820000 */  lbu        $v0, ($a0)
/* 2E6F4 8002DAF4 10400040 */  beqz       $v0, .L8002DBF8
/* 2E6F8 8002DAF8 3C02800F */   lui       $v0, %hi(debugQueuePointer)
/* 2E6FC 8002DAFC 8C43C620 */  lw         $v1, %lo(debugQueuePointer)($v0)
/* 2E700 8002DB00 1060003D */  beqz       $v1, .L8002DBF8
/* 2E704 8002DB04 00408821 */   addu      $s1, $v0, $zero
/* 2E708 8002DB08 84650014 */  lh         $a1, 0x14($v1)
/* 2E70C 8002DB0C 3C01800E */  lui        $at, %hi(D_800DAA28)
/* 2E710 8002DB10 C420AA28 */  lwc1       $f0, %lo(D_800DAA28)($at)
/* 2E714 8002DB14 00003821 */  addu       $a3, $zero, $zero
/* 2E718 8002DB18 E4600010 */  swc1       $f0, 0x10($v1)
/* 2E71C 8002DB1C 90820000 */  lbu        $v0, ($a0)
/* 2E720 8002DB20 27B00011 */  addiu      $s0, $sp, 0x11
/* 2E724 8002DB24 10400019 */  beqz       $v0, .L8002DB8C
/* 2E728 8002DB28 A3A20010 */   sb        $v0, 0x10($sp)
/* 2E72C 8002DB2C 2406000A */  addiu      $a2, $zero, 0xa
.L8002DB30:
/* 2E730 8002DB30 24A20001 */  addiu      $v0, $a1, 1
/* 2E734 8002DB34 00021400 */  sll        $v0, $v0, 0x10
/* 2E738 8002DB38 90830000 */  lbu        $v1, ($a0)
/* 2E73C 8002DB3C 14660005 */  bne        $v1, $a2, .L8002DB54
/* 2E740 8002DB40 00022C03 */   sra       $a1, $v0, 0x10
/* 2E744 8002DB44 24E20001 */  addiu      $v0, $a3, 1
/* 2E748 8002DB48 00021400 */  sll        $v0, $v0, 0x10
/* 2E74C 8002DB4C 00023C03 */  sra        $a3, $v0, 0x10
/* 2E750 8002DB50 00002821 */  addu       $a1, $zero, $zero
.L8002DB54:
/* 2E754 8002DB54 28A20024 */  slti       $v0, $a1, 0x24
/* 2E758 8002DB58 14400007 */  bnez       $v0, .L8002DB78
/* 2E75C 8002DB5C 24840001 */   addiu     $a0, $a0, 1
/* 2E760 8002DB60 A2060000 */  sb         $a2, ($s0)
/* 2E764 8002DB64 26100001 */  addiu      $s0, $s0, 1
/* 2E768 8002DB68 24E20001 */  addiu      $v0, $a3, 1
/* 2E76C 8002DB6C 00021400 */  sll        $v0, $v0, 0x10
/* 2E770 8002DB70 00023C03 */  sra        $a3, $v0, 0x10
/* 2E774 8002DB74 00002821 */  addu       $a1, $zero, $zero
.L8002DB78:
/* 2E778 8002DB78 90820000 */  lbu        $v0, ($a0)
/* 2E77C 8002DB7C A2020000 */  sb         $v0, ($s0)
/* 2E780 8002DB80 90830000 */  lbu        $v1, ($a0)
/* 2E784 8002DB84 1460FFEA */  bnez       $v1, .L8002DB30
/* 2E788 8002DB88 26100001 */   addiu     $s0, $s0, 1
.L8002DB8C:
/* 2E78C 8002DB8C 8E24C620 */  lw         $a0, -0x39e0($s1)
/* 2E790 8002DB90 28E2000A */  slti       $v0, $a3, 0xa
/* 2E794 8002DB94 1440000C */  bnez       $v0, .L8002DBC8
/* 2E798 8002DB98 A4850014 */   sh        $a1, 0x14($a0)
/* 2E79C 8002DB9C 27A40010 */  addiu      $a0, $sp, 0x10
/* 2E7A0 8002DBA0 2405000A */  addiu      $a1, $zero, 0xa
/* 2E7A4 8002DBA4 2406000A */  addiu      $a2, $zero, 0xa
/* 2E7A8 8002DBA8 00C73023 */  subu       $a2, $a2, $a3
/* 2E7AC 8002DBAC 00063400 */  sll        $a2, $a2, 0x10
/* 2E7B0 8002DBB0 0C00B696 */  jal        debug_queue_sub
/* 2E7B4 8002DBB4 00063403 */   sra       $a2, $a2, 0x10
/* 2E7B8 8002DBB8 8E23C620 */  lw         $v1, -0x39e0($s1)
/* 2E7BC 8002DBBC 00408021 */  addu       $s0, $v0, $zero
/* 2E7C0 8002DBC0 0800B6F8 */  j          .L8002DBE0
/* 2E7C4 8002DBC4 8C660000 */   lw        $a2, ($v1)
.L8002DBC8:
/* 2E7C8 8002DBC8 27B00010 */  addiu      $s0, $sp, 0x10
/* 2E7CC 8002DBCC 8C840000 */  lw         $a0, ($a0)
/* 2E7D0 8002DBD0 2405000A */  addiu      $a1, $zero, 0xa
/* 2E7D4 8002DBD4 0C00B696 */  jal        debug_queue_sub
/* 2E7D8 8002DBD8 00E03021 */   addu      $a2, $a3, $zero
/* 2E7DC 8002DBDC 00403021 */  addu       $a2, $v0, $zero
.L8002DBE0:
/* 2E7E0 8002DBE0 3C05800E */  lui        $a1, %hi(D_800DAA20)
/* 2E7E4 8002DBE4 8E22C620 */  lw         $v0, -0x39e0($s1)
/* 2E7E8 8002DBE8 24A5AA20 */  addiu      $a1, $a1, %lo(D_800DAA20)
/* 2E7EC 8002DBEC 8C440000 */  lw         $a0, ($v0)
/* 2E7F0 8002DBF0 0C0333AC */  jal        sprintf
/* 2E7F4 8002DBF4 02003821 */   addu      $a3, $s0, $zero
.L8002DBF8:
/* 2E7F8 8002DBF8 8FBF0198 */  lw         $ra, 0x198($sp)
/* 2E7FC 8002DBFC 8FB10194 */  lw         $s1, 0x194($sp)
/* 2E800 8002DC00 8FB00190 */  lw         $s0, 0x190($sp)
/* 2E804 8002DC04 03E00008 */  jr         $ra
/* 2E808 8002DC08 27BD01A0 */   addiu     $sp, $sp, 0x1a0

glabel func_with_debug_queue
/* 2E80C 8002DC0C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 2E810 8002DC10 00052C00 */  sll        $a1, $a1, 0x10
/* 2E814 8002DC14 3C02800E */  lui        $v0, %hi(debug_flag)
/* 2E818 8002DC18 944368A0 */  lhu        $v1, %lo(debug_flag)($v0)
/* 2E81C 8002DC1C 00052C03 */  sra        $a1, $a1, 0x10
/* 2E820 8002DC20 10600018 */  beqz       $v1, .L8002DC84
/* 2E824 8002DC24 AFBF0020 */   sw        $ra, 0x20($sp)
/* 2E828 8002DC28 3C02800F */  lui        $v0, %hi(show_debug_queue)
/* 2E82C 8002DC2C 9443C624 */  lhu        $v1, %lo(show_debug_queue)($v0)
/* 2E830 8002DC30 10600014 */  beqz       $v1, .L8002DC84
/* 2E834 8002DC34 3C02800F */   lui       $v0, %hi(debugQueuePointer)
/* 2E838 8002DC38 8C46C620 */  lw         $a2, %lo(debugQueuePointer)($v0)
/* 2E83C 8002DC3C 10C00011 */  beqz       $a2, .L8002DC84
/* 2E840 8002DC40 00404821 */   addu      $t1, $v0, $zero
/* 2E844 8002DC44 44850000 */  mtc1       $a1, $f0
/* 2E848 8002DC48 46800020 */  cvt.s.w    $f0, $f0
/* 2E84C 8002DC4C 3C01800E */  lui        $at, %hi(D_800DAA30)
/* 2E850 8002DC50 D424AA30 */  ldc1       $f4, %lo(D_800DAA30)($at)
/* 2E854 8002DC54 46000021 */  cvt.d.s    $f0, $f0
/* 2E858 8002DC58 46240002 */  mul.d      $f0, $f0, $f4
/* 2E85C 8002DC5C C4C20010 */  lwc1       $f2, 0x10($a2)
/* 2E860 8002DC60 460010A1 */  cvt.d.s    $f2, $f2
/* 2E864 8002DC64 46201081 */  sub.d      $f2, $f2, $f0
/* 2E868 8002DC68 44800000 */  mtc1       $zero, $f0
/* 2E86C 8002DC6C 462010A0 */  cvt.s.d    $f2, $f2
/* 2E870 8002DC70 4600103E */  c.le.s     $f2, $f0
/* 2E874 8002DC74 00000000 */  nop
/* 2E878 8002DC78 45000004 */  bc1f       .L8002DC8C
/* 2E87C 8002DC7C E4C20010 */   swc1      $f2, 0x10($a2)
/* 2E880 8002DC80 E4C00010 */  swc1       $f0, 0x10($a2)
.L8002DC84:
/* 2E884 8002DC84 0800B77E */  j          .L8002DDF8
/* 2E888 8002DC88 00801021 */   addu      $v0, $a0, $zero
.L8002DC8C:
/* 2E88C 8002DC8C C4C20004 */  lwc1       $f2, 4($a2)
/* 2E890 8002DC90 3C01800E */  lui        $at, %hi(D_800DAA38)
/* 2E894 8002DC94 C420AA38 */  lwc1       $f0, %lo(D_800DAA38)($at)
/* 2E898 8002DC98 46001002 */  mul.s      $f0, $f2, $f0
/* 2E89C 8002DC9C 3C01800E */  lui        $at, %hi(D_800DAA3C)
/* 2E8A0 8002DCA0 C422AA3C */  lwc1       $f2, %lo(D_800DAA3C)($at)
/* 2E8A4 8002DCA4 4600103E */  c.le.s     $f2, $f0
/* 2E8A8 8002DCA8 00000000 */  nop
/* 2E8AC 8002DCAC 45030005 */  bc1tl      .L8002DCC4
/* 2E8B0 8002DCB0 46020001 */   sub.s     $f0, $f0, $f2
/* 2E8B4 8002DCB4 4600008D */  trunc.w.s  $f2, $f0
/* 2E8B8 8002DCB8 44031000 */  mfc1       $v1, $f2
/* 2E8BC 8002DCBC 0800B736 */  j          .L8002DCD8
/* 2E8C0 8002DCC0 C4C20008 */   lwc1      $f2, 8($a2)
.L8002DCC4:
/* 2E8C4 8002DCC4 4600008D */  trunc.w.s  $f2, $f0
/* 2E8C8 8002DCC8 44031000 */  mfc1       $v1, $f2
/* 2E8CC 8002DCCC 3C028000 */  lui        $v0, 0x8000
/* 2E8D0 8002DCD0 00621825 */  or         $v1, $v1, $v0
/* 2E8D4 8002DCD4 C4C20008 */  lwc1       $f2, 8($a2)
.L8002DCD8:
/* 2E8D8 8002DCD8 3C01800E */  lui        $at, %hi(D_800DAA40)
/* 2E8DC 8002DCDC C420AA40 */  lwc1       $f0, %lo(D_800DAA40)($at)
/* 2E8E0 8002DCE0 46001002 */  mul.s      $f0, $f2, $f0
/* 2E8E4 8002DCE4 3C01800E */  lui        $at, %hi(D_800DAA44)
/* 2E8E8 8002DCE8 C422AA44 */  lwc1       $f2, %lo(D_800DAA44)($at)
/* 2E8EC 8002DCEC 4600103E */  c.le.s     $f2, $f0
/* 2E8F0 8002DCF0 00000000 */  nop
/* 2E8F4 8002DCF4 45010005 */  bc1t       .L8002DD0C
/* 2E8F8 8002DCF8 306800FF */   andi      $t0, $v1, 0xff
/* 2E8FC 8002DCFC 4600008D */  trunc.w.s  $f2, $f0
/* 2E900 8002DD00 44031000 */  mfc1       $v1, $f2
/* 2E904 8002DD04 0800B749 */  j          .L8002DD24
/* 2E908 8002DD08 C4C2000C */   lwc1      $f2, 0xc($a2)
.L8002DD0C:
/* 2E90C 8002DD0C 46020001 */  sub.s      $f0, $f0, $f2
/* 2E910 8002DD10 4600008D */  trunc.w.s  $f2, $f0
/* 2E914 8002DD14 44031000 */  mfc1       $v1, $f2
/* 2E918 8002DD18 3C028000 */  lui        $v0, 0x8000
/* 2E91C 8002DD1C 00621825 */  or         $v1, $v1, $v0
/* 2E920 8002DD20 C4C2000C */  lwc1       $f2, 0xc($a2)
.L8002DD24:
/* 2E924 8002DD24 3C01800E */  lui        $at, %hi(D_800DAA48)
/* 2E928 8002DD28 C420AA48 */  lwc1       $f0, %lo(D_800DAA48)($at)
/* 2E92C 8002DD2C 46001002 */  mul.s      $f0, $f2, $f0
/* 2E930 8002DD30 3C01800E */  lui        $at, %hi(D_800DAA4C)
/* 2E934 8002DD34 C422AA4C */  lwc1       $f2, %lo(D_800DAA4C)($at)
/* 2E938 8002DD38 4600103E */  c.le.s     $f2, $f0
/* 2E93C 8002DD3C 00000000 */  nop
/* 2E940 8002DD40 45010005 */  bc1t       .L8002DD58
/* 2E944 8002DD44 306700FF */   andi      $a3, $v1, 0xff
/* 2E948 8002DD48 4600008D */  trunc.w.s  $f2, $f0
/* 2E94C 8002DD4C 44031000 */  mfc1       $v1, $f2
/* 2E950 8002DD50 0800B75C */  j          .L8002DD70
/* 2E954 8002DD54 C4C20010 */   lwc1      $f2, 0x10($a2)
.L8002DD58:
/* 2E958 8002DD58 46020001 */  sub.s      $f0, $f0, $f2
/* 2E95C 8002DD5C 4600008D */  trunc.w.s  $f2, $f0
/* 2E960 8002DD60 44031000 */  mfc1       $v1, $f2
/* 2E964 8002DD64 3C028000 */  lui        $v0, 0x8000
/* 2E968 8002DD68 00621825 */  or         $v1, $v1, $v0
/* 2E96C 8002DD6C C4C20010 */  lwc1       $f2, 0x10($a2)
.L8002DD70:
/* 2E970 8002DD70 3C01800E */  lui        $at, %hi(D_800DAA50)
/* 2E974 8002DD74 C420AA50 */  lwc1       $f0, %lo(D_800DAA50)($at)
/* 2E978 8002DD78 46001002 */  mul.s      $f0, $f2, $f0
/* 2E97C 8002DD7C 3C01800E */  lui        $at, %hi(D_800DAA54)
/* 2E980 8002DD80 C424AA54 */  lwc1       $f4, %lo(D_800DAA54)($at)
/* 2E984 8002DD84 4600203E */  c.le.s     $f4, $f0
/* 2E988 8002DD88 00000000 */  nop
/* 2E98C 8002DD8C 45010005 */  bc1t       .L8002DDA4
/* 2E990 8002DD90 306500FF */   andi      $a1, $v1, 0xff
/* 2E994 8002DD94 4600010D */  trunc.w.s  $f4, $f0
/* 2E998 8002DD98 44032000 */  mfc1       $v1, $f4
/* 2E99C 8002DD9C 0800B76E */  j          .L8002DDB8
/* 2E9A0 8002DDA0 00000000 */   nop
.L8002DDA4:
/* 2E9A4 8002DDA4 46040001 */  sub.s      $f0, $f0, $f4
/* 2E9A8 8002DDA8 4600010D */  trunc.w.s  $f4, $f0
/* 2E9AC 8002DDAC 44032000 */  mfc1       $v1, $f4
/* 2E9B0 8002DDB0 3C028000 */  lui        $v0, 0x8000
/* 2E9B4 8002DDB4 00621825 */  or         $v1, $v1, $v0
.L8002DDB8:
/* 2E9B8 8002DDB8 3C01800E */  lui        $at, %hi(D_800DAA58)
/* 2E9BC 8002DDBC C420AA58 */  lwc1       $f0, %lo(D_800DAA58)($at)
/* 2E9C0 8002DDC0 4602003C */  c.lt.s     $f0, $f2
/* 2E9C4 8002DDC4 00000000 */  nop
/* 2E9C8 8002DDC8 45000002 */  bc1f       .L8002DDD4
/* 2E9CC 8002DDCC 306200FF */   andi      $v0, $v1, 0xff
/* 2E9D0 8002DDD0 240200FF */  addiu      $v0, $zero, 0xff
.L8002DDD4:
/* 2E9D4 8002DDD4 AFA2001C */  sw         $v0, 0x1c($sp)
/* 2E9D8 8002DDD8 8D22C620 */  lw         $v0, -0x39e0($t1)
/* 2E9DC 8002DDDC 24060012 */  addiu      $a2, $zero, 0x12
/* 2E9E0 8002DDE0 AFA80010 */  sw         $t0, 0x10($sp)
/* 2E9E4 8002DDE4 AFA70014 */  sw         $a3, 0x14($sp)
/* 2E9E8 8002DDE8 AFA50018 */  sw         $a1, 0x18($sp)
/* 2E9EC 8002DDEC 8C450000 */  lw         $a1, ($v0)
/* 2E9F0 8002DDF0 0C0028C5 */  jal        some_debug_print
/* 2E9F4 8002DDF4 24070032 */   addiu     $a3, $zero, 0x32
.L8002DDF8:
/* 2E9F8 8002DDF8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 2E9FC 8002DDFC 03E00008 */  jr         $ra
/* 2EA00 8002DE00 27BD0028 */   addiu     $sp, $sp, 0x28
/* 2EA04 8002DE04 00000000 */  nop
/* 2EA08 8002DE08 00000000 */  nop
/* 2EA0C 8002DE0C 00000000 */  nop
