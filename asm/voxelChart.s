.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel voxelChart_sub
/* 60490 8005F890 30C600FF */  andi       $a2, $a2, 0xff
/* 60494 8005F894 00061102 */  srl        $v0, $a2, 4
/* 60498 8005F898 2442FFFF */  addiu      $v0, $v0, -1
/* 6049C 8005F89C 90830000 */  lbu        $v1, ($a0)
/* 604A0 8005F8A0 30C60003 */  andi       $a2, $a2, 3
/* 604A4 8005F8A4 00431021 */  addu       $v0, $v0, $v1
/* 604A8 8005F8A8 A0820000 */  sb         $v0, ($a0)
/* 604AC 8005F8AC 90A20000 */  lbu        $v0, ($a1)
/* 604B0 8005F8B0 24C6FFFF */  addiu      $a2, $a2, -1
/* 604B4 8005F8B4 00C23021 */  addu       $a2, $a2, $v0
/* 604B8 8005F8B8 03E00008 */  jr         $ra
/* 604BC 8005F8BC A0A60000 */   sb        $a2, ($a1)

glabel calloc_voxelChart
/* 604C0 8005F8C0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 604C4 8005F8C4 AFB00010 */  sw         $s0, 0x10($sp)
/* 604C8 8005F8C8 00008021 */  addu       $s0, $zero, $zero
/* 604CC 8005F8CC 3C02800F */  lui        $v0, %hi(voxelCharIndecies)
/* 604D0 8005F8D0 AFB40020 */  sw         $s4, 0x20($sp)
/* 604D4 8005F8D4 2454F6C8 */  addiu      $s4, $v0, %lo(voxelCharIndecies)
/* 604D8 8005F8D8 AFB20018 */  sw         $s2, 0x18($sp)
/* 604DC 8005F8DC 3C120001 */  lui        $s2, 1
/* 604E0 8005F8E0 3C02800F */  lui        $v0, %hi(voxelChart)
/* 604E4 8005F8E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 604E8 8005F8E8 2451F5E4 */  addiu      $s1, $v0, %lo(voxelChart)
/* 604EC 8005F8EC AFB3001C */  sw         $s3, 0x1c($sp)
/* 604F0 8005F8F0 3C130001 */  lui        $s3, 1
/* 604F4 8005F8F4 AFBF0024 */  sw         $ra, 0x24($sp)
.L8005F8F8:
/* 604F8 8005F8F8 02202021 */  addu       $a0, $s1, $zero
/* 604FC 8005F8FC 00002821 */  addu       $a1, $zero, $zero
/* 60500 8005F900 0C026380 */  jal        Calloc
/* 60504 8005F904 2406000C */   addiu     $a2, $zero, 0xc
/* 60508 8005F908 02141821 */  addu       $v1, $s0, $s4
/* 6050C 8005F90C A0700000 */  sb         $s0, ($v1)
/* 60510 8005F910 02402021 */  addu       $a0, $s2, $zero
/* 60514 8005F914 02539021 */  addu       $s2, $s2, $s3
/* 60518 8005F918 00048403 */  sra        $s0, $a0, 0x10
/* 6051C 8005F91C 2A020013 */  slti       $v0, $s0, 0x13
/* 60520 8005F920 1440FFF5 */  bnez       $v0, .L8005F8F8
/* 60524 8005F924 2631000C */   addiu     $s1, $s1, 0xc
/* 60528 8005F928 8FBF0024 */  lw         $ra, 0x24($sp)
/* 6052C 8005F92C 8FB40020 */  lw         $s4, 0x20($sp)
/* 60530 8005F930 8FB3001C */  lw         $s3, 0x1c($sp)
/* 60534 8005F934 8FB20018 */  lw         $s2, 0x18($sp)
/* 60538 8005F938 8FB10014 */  lw         $s1, 0x14($sp)
/* 6053C 8005F93C 8FB00010 */  lw         $s0, 0x10($sp)
/* 60540 8005F940 3C02800F */  lui        $v0, %hi(voxelChartIndex)
/* 60544 8005F944 A040F5E0 */  sb         $zero, %lo(voxelChartIndex)($v0)
/* 60548 8005F948 03E00008 */  jr         $ra
/* 6054C 8005F94C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel WriteTo_VoxelChart
/* 60550 8005F950 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 60554 8005F954 AFB30034 */  sw         $s3, 0x34($sp)
/* 60558 8005F958 3C13800F */  lui        $s3, %hi(VoxelChartVar)
/* 6055C 8005F95C AFB20030 */  sw         $s2, 0x30($sp)
/* 60560 8005F960 3092FFFF */  andi       $s2, $a0, 0xffff
/* 60564 8005F964 9662F5E2 */  lhu        $v0, %lo(VoxelChartVar)($s3)
/* 60568 8005F968 8FA4005C */  lw         $a0, 0x5c($sp)
/* 6056C 8005F96C 8FA30060 */  lw         $v1, 0x60($sp)
/* 60570 8005F970 AFB5003C */  sw         $s5, 0x3c($sp)
/* 60574 8005F974 30B500FF */  andi       $s5, $a1, 0xff
/* 60578 8005F978 AFB00028 */  sw         $s0, 0x28($sp)
/* 6057C 8005F97C 3C10800F */  lui        $s0, 0x800f
/* 60580 8005F980 AFBF0044 */  sw         $ra, 0x44($sp)
/* 60584 8005F984 AFB60040 */  sw         $s6, 0x40($sp)
/* 60588 8005F988 AFB40038 */  sw         $s4, 0x38($sp)
/* 6058C 8005F98C AFB1002C */  sw         $s1, 0x2c($sp)
/* 60590 8005F990 A3A60020 */  sb         $a2, 0x20($sp)
/* 60594 8005F994 A3A70021 */  sb         $a3, 0x21($sp)
/* 60598 8005F998 24460001 */  addiu      $a2, $v0, 1
/* 6059C 8005F99C 309600FF */  andi       $s6, $a0, 0xff
/* 605A0 8005F9A0 8FA20058 */  lw         $v0, 0x58($sp)
/* 605A4 8005F9A4 00031E00 */  sll        $v1, $v1, 0x18
/* 605A8 8005F9A8 305100FF */  andi       $s1, $v0, 0xff
/* 605AC 8005F9AC 9202F5E0 */  lbu        $v0, -0xa20($s0)
/* 605B0 8005F9B0 0003A603 */  sra        $s4, $v1, 0x18
/* 605B4 8005F9B4 2C420013 */  sltiu      $v0, $v0, 0x13
/* 605B8 8005F9B8 1440001D */  bnez       $v0, .L8005FA30
/* 605BC 8005F9BC A666F5E2 */   sh        $a2, -0xa1e($s3)
/* 605C0 8005F9C0 30C3FFFF */  andi       $v1, $a2, 0xffff
/* 605C4 8005F9C4 2C620003 */  sltiu      $v0, $v1, 3
/* 605C8 8005F9C8 1040000D */  beqz       $v0, .L8005FA00
/* 605CC 8005F9CC 24020001 */   addiu     $v0, $zero, 1
/* 605D0 8005F9D0 14620004 */  bne        $v1, $v0, .L8005F9E4
/* 605D4 8005F9D4 9663F5E2 */   lhu       $v1, -0xa1e($s3)
/* 605D8 8005F9D8 0C017FB0 */  jal        clear_VoxelChart_entry_Vobject
/* 605DC 8005F9DC 24040005 */   addiu     $a0, $zero, 5
/* 605E0 8005F9E0 9663F5E2 */  lhu        $v1, -0xa1e($s3)
.L8005F9E4:
/* 605E4 8005F9E4 24020002 */  addiu      $v0, $zero, 2
/* 605E8 8005F9E8 14620008 */  bne        $v1, $v0, .L8005FA0C
/* 605EC 8005F9EC 02402021 */   addu      $a0, $s2, $zero
/* 605F0 8005F9F0 0C017FB0 */  jal        clear_VoxelChart_entry_Vobject
/* 605F4 8005F9F4 24040009 */   addiu     $a0, $zero, 9
/* 605F8 8005F9F8 08017E83 */  j          .L8005FA0C
/* 605FC 8005F9FC 02402021 */   addu      $a0, $s2, $zero
.L8005FA00:
/* 60600 8005FA00 0C017E30 */  jal        calloc_voxelChart
/* 60604 8005FA04 00000000 */   nop
/* 60608 8005FA08 02402021 */  addu       $a0, $s2, $zero
.L8005FA0C:
/* 6060C 8005FA0C 93A60020 */  lbu        $a2, 0x20($sp)
/* 60610 8005FA10 93A70021 */  lbu        $a3, 0x21($sp)
/* 60614 8005FA14 02A02821 */  addu       $a1, $s5, $zero
/* 60618 8005FA18 AFB10010 */  sw         $s1, 0x10($sp)
/* 6061C 8005FA1C AFB60014 */  sw         $s6, 0x14($sp)
/* 60620 8005FA20 0C017E54 */  jal        WriteTo_VoxelChart
/* 60624 8005FA24 AFB40018 */   sw        $s4, 0x18($sp)
/* 60628 8005FA28 08017EAB */  j          .L8005FAAC
/* 6062C 8005FA2C 8FBF0044 */   lw        $ra, 0x44($sp)
.L8005FA30:
/* 60630 8005FA30 27A40020 */  addiu      $a0, $sp, 0x20
/* 60634 8005FA34 27A50021 */  addiu      $a1, $sp, 0x21
/* 60638 8005FA38 0C017E24 */  jal        voxelChart_sub
/* 6063C 8005FA3C 02203021 */   addu      $a2, $s1, $zero
/* 60640 8005FA40 3C03800F */  lui        $v1, %hi(voxelCharIndecies)
/* 60644 8005FA44 9204F5E0 */  lbu        $a0, -0xa20($s0)
/* 60648 8005FA48 2463F6C8 */  addiu      $v1, $v1, %lo(voxelCharIndecies)
/* 6064C 8005FA4C A660F5E2 */  sh         $zero, -0xa1e($s3)
/* 60650 8005FA50 308200FF */  andi       $v0, $a0, 0xff
/* 60654 8005FA54 00431021 */  addu       $v0, $v0, $v1
/* 60658 8005FA58 24840001 */  addiu      $a0, $a0, 1
/* 6065C 8005FA5C 90450000 */  lbu        $a1, ($v0)
/* 60660 8005FA60 3C02800F */  lui        $v0, %hi(voxelChart)
/* 60664 8005FA64 2442F5E4 */  addiu      $v0, $v0, %lo(voxelChart)
/* 60668 8005FA68 A204F5E0 */  sb         $a0, -0xa20($s0)
/* 6066C 8005FA6C 24040001 */  addiu      $a0, $zero, 1
/* 60670 8005FA70 00051840 */  sll        $v1, $a1, 1
/* 60674 8005FA74 00651821 */  addu       $v1, $v1, $a1
/* 60678 8005FA78 00031880 */  sll        $v1, $v1, 2
/* 6067C 8005FA7C 00621821 */  addu       $v1, $v1, $v0
/* 60680 8005FA80 A4720000 */  sh         $s2, ($v1)
/* 60684 8005FA84 93A50020 */  lbu        $a1, 0x20($sp)
/* 60688 8005FA88 93A60021 */  lbu        $a2, 0x21($sp)
/* 6068C 8005FA8C 00601021 */  addu       $v0, $v1, $zero
/* 60690 8005FA90 A0640002 */  sb         $a0, 2($v1)
/* 60694 8005FA94 A0740003 */  sb         $s4, 3($v1)
/* 60698 8005FA98 A0750004 */  sb         $s5, 4($v1)
/* 6069C 8005FA9C A0760007 */  sb         $s6, 7($v1)
/* 606A0 8005FAA0 A0650005 */  sb         $a1, 5($v1)
/* 606A4 8005FAA4 A0660006 */  sb         $a2, 6($v1)
/* 606A8 8005FAA8 8FBF0044 */  lw         $ra, 0x44($sp)
.L8005FAAC:
/* 606AC 8005FAAC 8FB60040 */  lw         $s6, 0x40($sp)
/* 606B0 8005FAB0 8FB5003C */  lw         $s5, 0x3c($sp)
/* 606B4 8005FAB4 8FB40038 */  lw         $s4, 0x38($sp)
/* 606B8 8005FAB8 8FB30034 */  lw         $s3, 0x34($sp)
/* 606BC 8005FABC 8FB20030 */  lw         $s2, 0x30($sp)
/* 606C0 8005FAC0 8FB1002C */  lw         $s1, 0x2c($sp)
/* 606C4 8005FAC4 8FB00028 */  lw         $s0, 0x28($sp)
/* 606C8 8005FAC8 03E00008 */  jr         $ra
/* 606CC 8005FACC 27BD0048 */   addiu     $sp, $sp, 0x48

glabel passto_WriteTo_VoxelChart
/* 606D0 8005FAD0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 606D4 8005FAD4 3084FFFF */  andi       $a0, $a0, 0xffff
/* 606D8 8005FAD8 30A500FF */  andi       $a1, $a1, 0xff
/* 606DC 8005FADC 30C600FF */  andi       $a2, $a2, 0xff
/* 606E0 8005FAE0 93A2003B */  lbu        $v0, 0x3b($sp)
/* 606E4 8005FAE4 93A3003F */  lbu        $v1, 0x3f($sp)
/* 606E8 8005FAE8 83A80043 */  lb         $t0, 0x43($sp)
/* 606EC 8005FAEC 30E700FF */  andi       $a3, $a3, 0xff
/* 606F0 8005FAF0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 606F4 8005FAF4 AFA20010 */  sw         $v0, 0x10($sp)
/* 606F8 8005FAF8 AFA30014 */  sw         $v1, 0x14($sp)
/* 606FC 8005FAFC 0C017E54 */  jal        WriteTo_VoxelChart
/* 60700 8005FB00 AFA80018 */   sw        $t0, 0x18($sp)
/* 60704 8005FB04 8FBF0020 */  lw         $ra, 0x20($sp)
/* 60708 8005FB08 03E00008 */  jr         $ra
/* 6070C 8005FB0C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel calloc_voxelChart_entries
/* 60710 8005FB10 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 60714 8005FB14 AFB20018 */  sw         $s2, 0x18($sp)
/* 60718 8005FB18 00009021 */  addu       $s2, $zero, $zero
/* 6071C 8005FB1C 3C02800F */  lui        $v0, %hi(voxelCharIndecies)
/* 60720 8005FB20 AFB50024 */  sw         $s5, 0x24($sp)
/* 60724 8005FB24 2455F6C8 */  addiu      $s5, $v0, %lo(voxelCharIndecies)
/* 60728 8005FB28 AFB3001C */  sw         $s3, 0x1c($sp)
/* 6072C 8005FB2C 3C13800F */  lui        $s3, 0x800f
/* 60730 8005FB30 AFB10014 */  sw         $s1, 0x14($sp)
/* 60734 8005FB34 3C110001 */  lui        $s1, 1
/* 60738 8005FB38 3C02800F */  lui        $v0, %hi(voxelChart)
/* 6073C 8005FB3C AFB00010 */  sw         $s0, 0x10($sp)
/* 60740 8005FB40 2450F5E4 */  addiu      $s0, $v0, %lo(voxelChart)
/* 60744 8005FB44 AFB40020 */  sw         $s4, 0x20($sp)
/* 60748 8005FB48 3C140001 */  lui        $s4, 1
/* 6074C 8005FB4C AFBF0028 */  sw         $ra, 0x28($sp)
.L8005FB50:
/* 60750 8005FB50 92020002 */  lbu        $v0, 2($s0)
/* 60754 8005FB54 10400012 */  beqz       $v0, .L8005FBA0
/* 60758 8005FB58 02201821 */   addu      $v1, $s1, $zero
/* 6075C 8005FB5C 92020003 */  lbu        $v0, 3($s0)
/* 60760 8005FB60 2442FFFF */  addiu      $v0, $v0, -1
/* 60764 8005FB64 A2020003 */  sb         $v0, 3($s0)
/* 60768 8005FB68 00021600 */  sll        $v0, $v0, 0x18
/* 6076C 8005FB6C 5C40000D */  bgtzl      $v0, .L8005FBA4
/* 60770 8005FB70 02348821 */   addu      $s1, $s1, $s4
/* 60774 8005FB74 02002021 */  addu       $a0, $s0, $zero
/* 60778 8005FB78 00002821 */  addu       $a1, $zero, $zero
/* 6077C 8005FB7C 0C026380 */  jal        Calloc
/* 60780 8005FB80 2406000C */   addiu     $a2, $zero, 0xc
/* 60784 8005FB84 9263F5E0 */  lbu        $v1, -0xa20($s3)
/* 60788 8005FB88 2463FFFF */  addiu      $v1, $v1, -1
/* 6078C 8005FB8C A263F5E0 */  sb         $v1, -0xa20($s3)
/* 60790 8005FB90 306300FF */  andi       $v1, $v1, 0xff
/* 60794 8005FB94 00751821 */  addu       $v1, $v1, $s5
/* 60798 8005FB98 A0720000 */  sb         $s2, ($v1)
/* 6079C 8005FB9C 02201821 */  addu       $v1, $s1, $zero
.L8005FBA0:
/* 607A0 8005FBA0 02348821 */  addu       $s1, $s1, $s4
.L8005FBA4:
/* 607A4 8005FBA4 00039403 */  sra        $s2, $v1, 0x10
/* 607A8 8005FBA8 2A420013 */  slti       $v0, $s2, 0x13
/* 607AC 8005FBAC 1440FFE8 */  bnez       $v0, .L8005FB50
/* 607B0 8005FBB0 2610000C */   addiu     $s0, $s0, 0xc
/* 607B4 8005FBB4 8FBF0028 */  lw         $ra, 0x28($sp)
/* 607B8 8005FBB8 8FB50024 */  lw         $s5, 0x24($sp)
/* 607BC 8005FBBC 8FB40020 */  lw         $s4, 0x20($sp)
/* 607C0 8005FBC0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 607C4 8005FBC4 8FB20018 */  lw         $s2, 0x18($sp)
/* 607C8 8005FBC8 8FB10014 */  lw         $s1, 0x14($sp)
/* 607CC 8005FBCC 8FB00010 */  lw         $s0, 0x10($sp)
/* 607D0 8005FBD0 03E00008 */  jr         $ra
/* 607D4 8005FBD4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel some_monsterparty_checker
/* 607D8 8005FBD8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 607DC 8005FBDC AFB20020 */  sw         $s2, 0x20($sp)
/* 607E0 8005FBE0 3092FFFF */  andi       $s2, $a0, 0xffff
/* 607E4 8005FBE4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 607E8 8005FBE8 30B100FF */  andi       $s1, $a1, 0xff
/* 607EC 8005FBEC 8FA2003C */  lw         $v0, 0x3c($sp)
/* 607F0 8005FBF0 27A40010 */  addiu      $a0, $sp, 0x10
/* 607F4 8005FBF4 A3A60010 */  sb         $a2, 0x10($sp)
/* 607F8 8005FBF8 8FA60038 */  lw         $a2, 0x38($sp)
/* 607FC 8005FBFC 27A50011 */  addiu      $a1, $sp, 0x11
/* 60800 8005FC00 AFBF0024 */  sw         $ra, 0x24($sp)
/* 60804 8005FC04 AFB00018 */  sw         $s0, 0x18($sp)
/* 60808 8005FC08 A3A70011 */  sb         $a3, 0x11($sp)
/* 6080C 8005FC0C 305000FF */  andi       $s0, $v0, 0xff
/* 60810 8005FC10 0C017E24 */  jal        voxelChart_sub
/* 60814 8005FC14 30C600FF */   andi      $a2, $a2, 0xff
/* 60818 8005FC18 00002821 */  addu       $a1, $zero, $zero
/* 6081C 8005FC1C 3C02800F */  lui        $v0, %hi(voxelChart)
/* 60820 8005FC20 2448F5E4 */  addiu      $t0, $v0, %lo(voxelChart)
/* 60824 8005FC24 93A70010 */  lbu        $a3, 0x10($sp)
/* 60828 8005FC28 93A60011 */  lbu        $a2, 0x11($sp)
/* 6082C 8005FC2C 00051040 */  sll        $v0, $a1, 1
.L8005FC30:
/* 60830 8005FC30 00451021 */  addu       $v0, $v0, $a1
/* 60834 8005FC34 00021080 */  sll        $v0, $v0, 2
/* 60838 8005FC38 00482021 */  addu       $a0, $v0, $t0
/* 6083C 8005FC3C 90830002 */  lbu        $v1, 2($a0)
/* 60840 8005FC40 10600012 */  beqz       $v1, .L8005FC8C
/* 60844 8005FC44 24A20001 */   addiu     $v0, $a1, 1
/* 60848 8005FC48 94820000 */  lhu        $v0, ($a0)
/* 6084C 8005FC4C 1452000F */  bne        $v0, $s2, .L8005FC8C
/* 60850 8005FC50 24A20001 */   addiu     $v0, $a1, 1
/* 60854 8005FC54 90820004 */  lbu        $v0, 4($a0)
/* 60858 8005FC58 1451000C */  bne        $v0, $s1, .L8005FC8C
/* 6085C 8005FC5C 24A20001 */   addiu     $v0, $a1, 1
/* 60860 8005FC60 90820005 */  lbu        $v0, 5($a0)
/* 60864 8005FC64 14470009 */  bne        $v0, $a3, .L8005FC8C
/* 60868 8005FC68 24A20001 */   addiu     $v0, $a1, 1
/* 6086C 8005FC6C 90820006 */  lbu        $v0, 6($a0)
/* 60870 8005FC70 14460006 */  bne        $v0, $a2, .L8005FC8C
/* 60874 8005FC74 24A20001 */   addiu     $v0, $a1, 1
/* 60878 8005FC78 90820007 */  lbu        $v0, 7($a0)
/* 6087C 8005FC7C 14500003 */  bne        $v0, $s0, .L8005FC8C
/* 60880 8005FC80 24A20001 */   addiu     $v0, $a1, 1
/* 60884 8005FC84 08017F28 */  j          .L8005FCA0
/* 60888 8005FC88 24020001 */   addiu     $v0, $zero, 1
.L8005FC8C:
/* 6088C 8005FC8C 3045FFFF */  andi       $a1, $v0, 0xffff
/* 60890 8005FC90 2CA30013 */  sltiu      $v1, $a1, 0x13
/* 60894 8005FC94 1460FFE6 */  bnez       $v1, .L8005FC30
/* 60898 8005FC98 00051040 */   sll       $v0, $a1, 1
/* 6089C 8005FC9C 00001021 */  addu       $v0, $zero, $zero
.L8005FCA0:
/* 608A0 8005FCA0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 608A4 8005FCA4 8FB20020 */  lw         $s2, 0x20($sp)
/* 608A8 8005FCA8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 608AC 8005FCAC 8FB00018 */  lw         $s0, 0x18($sp)
/* 608B0 8005FCB0 03E00008 */  jr         $ra
/* 608B4 8005FCB4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_ref_obj_lookup_func
/* 608B8 8005FCB8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 608BC 8005FCBC AFB20020 */  sw         $s2, 0x20($sp)
/* 608C0 8005FCC0 3092FFFF */  andi       $s2, $a0, 0xffff
/* 608C4 8005FCC4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 608C8 8005FCC8 30B100FF */  andi       $s1, $a1, 0xff
/* 608CC 8005FCCC 8FA2003C */  lw         $v0, 0x3c($sp)
/* 608D0 8005FCD0 27A40010 */  addiu      $a0, $sp, 0x10
/* 608D4 8005FCD4 A3A60010 */  sb         $a2, 0x10($sp)
/* 608D8 8005FCD8 8FA60038 */  lw         $a2, 0x38($sp)
/* 608DC 8005FCDC 27A50011 */  addiu      $a1, $sp, 0x11
/* 608E0 8005FCE0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 608E4 8005FCE4 AFB00018 */  sw         $s0, 0x18($sp)
/* 608E8 8005FCE8 A3A70011 */  sb         $a3, 0x11($sp)
/* 608EC 8005FCEC 305000FF */  andi       $s0, $v0, 0xff
/* 608F0 8005FCF0 0C017E24 */  jal        voxelChart_sub
/* 608F4 8005FCF4 30C600FF */   andi      $a2, $a2, 0xff
/* 608F8 8005FCF8 00002821 */  addu       $a1, $zero, $zero
/* 608FC 8005FCFC 3C02800F */  lui        $v0, %hi(voxelChart)
/* 60900 8005FD00 2448F5E4 */  addiu      $t0, $v0, %lo(voxelChart)
/* 60904 8005FD04 93A70010 */  lbu        $a3, 0x10($sp)
/* 60908 8005FD08 93A60011 */  lbu        $a2, 0x11($sp)
/* 6090C 8005FD0C 00051040 */  sll        $v0, $a1, 1
.L8005FD10:
/* 60910 8005FD10 00451021 */  addu       $v0, $v0, $a1
/* 60914 8005FD14 00021080 */  sll        $v0, $v0, 2
/* 60918 8005FD18 00482021 */  addu       $a0, $v0, $t0
/* 6091C 8005FD1C 90830002 */  lbu        $v1, 2($a0)
/* 60920 8005FD20 10600012 */  beqz       $v1, .L8005FD6C
/* 60924 8005FD24 24A20001 */   addiu     $v0, $a1, 1
/* 60928 8005FD28 94820000 */  lhu        $v0, ($a0)
/* 6092C 8005FD2C 1452000F */  bne        $v0, $s2, .L8005FD6C
/* 60930 8005FD30 24A20001 */   addiu     $v0, $a1, 1
/* 60934 8005FD34 90820004 */  lbu        $v0, 4($a0)
/* 60938 8005FD38 1451000C */  bne        $v0, $s1, .L8005FD6C
/* 6093C 8005FD3C 24A20001 */   addiu     $v0, $a1, 1
/* 60940 8005FD40 90820005 */  lbu        $v0, 5($a0)
/* 60944 8005FD44 14470009 */  bne        $v0, $a3, .L8005FD6C
/* 60948 8005FD48 24A20001 */   addiu     $v0, $a1, 1
/* 6094C 8005FD4C 90820006 */  lbu        $v0, 6($a0)
/* 60950 8005FD50 14460006 */  bne        $v0, $a2, .L8005FD6C
/* 60954 8005FD54 24A20001 */   addiu     $v0, $a1, 1
/* 60958 8005FD58 90820007 */  lbu        $v0, 7($a0)
/* 6095C 8005FD5C 14500003 */  bne        $v0, $s0, .L8005FD6C
/* 60960 8005FD60 24A20001 */   addiu     $v0, $a1, 1
/* 60964 8005FD64 08017F60 */  j          .L8005FD80
/* 60968 8005FD68 00801021 */   addu      $v0, $a0, $zero
.L8005FD6C:
/* 6096C 8005FD6C 3045FFFF */  andi       $a1, $v0, 0xffff
/* 60970 8005FD70 2CA30013 */  sltiu      $v1, $a1, 0x13
/* 60974 8005FD74 1460FFE6 */  bnez       $v1, .L8005FD10
/* 60978 8005FD78 00051040 */   sll       $v0, $a1, 1
/* 6097C 8005FD7C 00001021 */  addu       $v0, $zero, $zero
.L8005FD80:
/* 60980 8005FD80 8FBF0024 */  lw         $ra, 0x24($sp)
/* 60984 8005FD84 8FB20020 */  lw         $s2, 0x20($sp)
/* 60988 8005FD88 8FB1001C */  lw         $s1, 0x1c($sp)
/* 6098C 8005FD8C 8FB00018 */  lw         $s0, 0x18($sp)
/* 60990 8005FD90 03E00008 */  jr         $ra
/* 60994 8005FD94 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8005FD98
/* 60998 8005FD98 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 6099C 8005FD9C AFB40028 */  sw         $s4, 0x28($sp)
/* 609A0 8005FDA0 3094FFFF */  andi       $s4, $a0, 0xffff
/* 609A4 8005FDA4 27A40010 */  addiu      $a0, $sp, 0x10
/* 609A8 8005FDA8 AFB30024 */  sw         $s3, 0x24($sp)
/* 609AC 8005FDAC 30B300FF */  andi       $s3, $a1, 0xff
/* 609B0 8005FDB0 A3A60010 */  sb         $a2, 0x10($sp)
/* 609B4 8005FDB4 8FA60048 */  lw         $a2, 0x48($sp)
/* 609B8 8005FDB8 8FA2004C */  lw         $v0, 0x4c($sp)
/* 609BC 8005FDBC 27A50011 */  addiu      $a1, $sp, 0x11
/* 609C0 8005FDC0 AFB00018 */  sw         $s0, 0x18($sp)
/* 609C4 8005FDC4 00008021 */  addu       $s0, $zero, $zero
/* 609C8 8005FDC8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 609CC 8005FDCC 3C11800F */  lui        $s1, 0x800f
/* 609D0 8005FDD0 AFBF0030 */  sw         $ra, 0x30($sp)
/* 609D4 8005FDD4 AFB5002C */  sw         $s5, 0x2c($sp)
/* 609D8 8005FDD8 AFB20020 */  sw         $s2, 0x20($sp)
/* 609DC 8005FDDC A3A70011 */  sb         $a3, 0x11($sp)
/* 609E0 8005FDE0 30C600FF */  andi       $a2, $a2, 0xff
/* 609E4 8005FDE4 0C017E24 */  jal        voxelChart_sub
/* 609E8 8005FDE8 305200FF */   andi      $s2, $v0, 0xff
/* 609EC 8005FDEC 3C02800F */  lui        $v0, %hi(voxelChart)
/* 609F0 8005FDF0 2445F5E4 */  addiu      $a1, $v0, %lo(voxelChart)
/* 609F4 8005FDF4 3C03800F */  lui        $v1, %hi(voxelCharIndecies)
/* 609F8 8005FDF8 2475F6C8 */  addiu      $s5, $v1, %lo(voxelCharIndecies)
/* 609FC 8005FDFC 00101040 */  sll        $v0, $s0, 1
.L8005FE00:
/* 60A00 8005FE00 00501021 */  addu       $v0, $v0, $s0
/* 60A04 8005FE04 00021080 */  sll        $v0, $v0, 2
/* 60A08 8005FE08 00452021 */  addu       $a0, $v0, $a1
/* 60A0C 8005FE0C 90830002 */  lbu        $v1, 2($a0)
/* 60A10 8005FE10 1060001D */  beqz       $v1, .L8005FE88
/* 60A14 8005FE14 26020001 */   addiu     $v0, $s0, 1
/* 60A18 8005FE18 94820000 */  lhu        $v0, ($a0)
/* 60A1C 8005FE1C 1454001A */  bne        $v0, $s4, .L8005FE88
/* 60A20 8005FE20 26020001 */   addiu     $v0, $s0, 1
/* 60A24 8005FE24 90820004 */  lbu        $v0, 4($a0)
/* 60A28 8005FE28 14530017 */  bne        $v0, $s3, .L8005FE88
/* 60A2C 8005FE2C 26020001 */   addiu     $v0, $s0, 1
/* 60A30 8005FE30 90830005 */  lbu        $v1, 5($a0)
/* 60A34 8005FE34 93A20010 */  lbu        $v0, 0x10($sp)
/* 60A38 8005FE38 14620013 */  bne        $v1, $v0, .L8005FE88
/* 60A3C 8005FE3C 26020001 */   addiu     $v0, $s0, 1
/* 60A40 8005FE40 90830006 */  lbu        $v1, 6($a0)
/* 60A44 8005FE44 93A20011 */  lbu        $v0, 0x11($sp)
/* 60A48 8005FE48 1462000F */  bne        $v1, $v0, .L8005FE88
/* 60A4C 8005FE4C 26020001 */   addiu     $v0, $s0, 1
/* 60A50 8005FE50 90820007 */  lbu        $v0, 7($a0)
/* 60A54 8005FE54 1452000C */  bne        $v0, $s2, .L8005FE88
/* 60A58 8005FE58 26020001 */   addiu     $v0, $s0, 1
/* 60A5C 8005FE5C 00002821 */  addu       $a1, $zero, $zero
/* 60A60 8005FE60 0C026380 */  jal        Calloc
/* 60A64 8005FE64 2406000C */   addiu     $a2, $zero, 0xc
/* 60A68 8005FE68 9223F5E0 */  lbu        $v1, -0xa20($s1)
/* 60A6C 8005FE6C 24020001 */  addiu      $v0, $zero, 1
/* 60A70 8005FE70 2463FFFF */  addiu      $v1, $v1, -1
/* 60A74 8005FE74 A223F5E0 */  sb         $v1, -0xa20($s1)
/* 60A78 8005FE78 306300FF */  andi       $v1, $v1, 0xff
/* 60A7C 8005FE7C 00751821 */  addu       $v1, $v1, $s5
/* 60A80 8005FE80 08017FA7 */  j          .L8005FE9C
/* 60A84 8005FE84 A0700000 */   sb        $s0, ($v1)
.L8005FE88:
/* 60A88 8005FE88 3050FFFF */  andi       $s0, $v0, 0xffff
/* 60A8C 8005FE8C 2E030013 */  sltiu      $v1, $s0, 0x13
/* 60A90 8005FE90 1460FFDB */  bnez       $v1, .L8005FE00
/* 60A94 8005FE94 00101040 */   sll       $v0, $s0, 1
/* 60A98 8005FE98 00001021 */  addu       $v0, $zero, $zero
.L8005FE9C:
/* 60A9C 8005FE9C 8FBF0030 */  lw         $ra, 0x30($sp)
/* 60AA0 8005FEA0 8FB5002C */  lw         $s5, 0x2c($sp)
/* 60AA4 8005FEA4 8FB40028 */  lw         $s4, 0x28($sp)
/* 60AA8 8005FEA8 8FB30024 */  lw         $s3, 0x24($sp)
/* 60AAC 8005FEAC 8FB20020 */  lw         $s2, 0x20($sp)
/* 60AB0 8005FEB0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 60AB4 8005FEB4 8FB00018 */  lw         $s0, 0x18($sp)
/* 60AB8 8005FEB8 03E00008 */  jr         $ra
/* 60ABC 8005FEBC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel clear_VoxelChart_entry_Vobject
/* 60AC0 8005FEC0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 60AC4 8005FEC4 AFB40020 */  sw         $s4, 0x20($sp)
/* 60AC8 8005FEC8 309400FF */  andi       $s4, $a0, 0xff
/* 60ACC 8005FECC AFB20018 */  sw         $s2, 0x18($sp)
/* 60AD0 8005FED0 00009021 */  addu       $s2, $zero, $zero
/* 60AD4 8005FED4 3C02800F */  lui        $v0, %hi(voxelCharIndecies)
/* 60AD8 8005FED8 AFB60028 */  sw         $s6, 0x28($sp)
/* 60ADC 8005FEDC 2456F6C8 */  addiu      $s6, $v0, %lo(voxelCharIndecies)
/* 60AE0 8005FEE0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 60AE4 8005FEE4 3C13800F */  lui        $s3, 0x800f
/* 60AE8 8005FEE8 AFB10014 */  sw         $s1, 0x14($sp)
/* 60AEC 8005FEEC 3C110001 */  lui        $s1, 1
/* 60AF0 8005FEF0 3C02800F */  lui        $v0, %hi(voxelChart)
/* 60AF4 8005FEF4 AFB00010 */  sw         $s0, 0x10($sp)
/* 60AF8 8005FEF8 2450F5E4 */  addiu      $s0, $v0, %lo(voxelChart)
/* 60AFC 8005FEFC AFB50024 */  sw         $s5, 0x24($sp)
/* 60B00 8005FF00 3C150001 */  lui        $s5, 1
/* 60B04 8005FF04 AFBF002C */  sw         $ra, 0x2c($sp)
.L8005FF08:
/* 60B08 8005FF08 92020002 */  lbu        $v0, 2($s0)
/* 60B0C 8005FF0C 1040000F */  beqz       $v0, .L8005FF4C
/* 60B10 8005FF10 02201821 */   addu      $v1, $s1, $zero
/* 60B14 8005FF14 92020007 */  lbu        $v0, 7($s0)
/* 60B18 8005FF18 5454000D */  bnel       $v0, $s4, .L8005FF50
/* 60B1C 8005FF1C 02358821 */   addu      $s1, $s1, $s5
/* 60B20 8005FF20 02002021 */  addu       $a0, $s0, $zero
/* 60B24 8005FF24 00002821 */  addu       $a1, $zero, $zero
/* 60B28 8005FF28 0C026380 */  jal        Calloc
/* 60B2C 8005FF2C 2406000C */   addiu     $a2, $zero, 0xc
/* 60B30 8005FF30 9263F5E0 */  lbu        $v1, -0xa20($s3)
/* 60B34 8005FF34 2463FFFF */  addiu      $v1, $v1, -1
/* 60B38 8005FF38 A263F5E0 */  sb         $v1, -0xa20($s3)
/* 60B3C 8005FF3C 306300FF */  andi       $v1, $v1, 0xff
/* 60B40 8005FF40 00761821 */  addu       $v1, $v1, $s6
/* 60B44 8005FF44 A0720000 */  sb         $s2, ($v1)
/* 60B48 8005FF48 02201821 */  addu       $v1, $s1, $zero
.L8005FF4C:
/* 60B4C 8005FF4C 02358821 */  addu       $s1, $s1, $s5
.L8005FF50:
/* 60B50 8005FF50 00039403 */  sra        $s2, $v1, 0x10
/* 60B54 8005FF54 2A420013 */  slti       $v0, $s2, 0x13
/* 60B58 8005FF58 1440FFEB */  bnez       $v0, .L8005FF08
/* 60B5C 8005FF5C 2610000C */   addiu     $s0, $s0, 0xc
/* 60B60 8005FF60 8FBF002C */  lw         $ra, 0x2c($sp)
/* 60B64 8005FF64 8FB60028 */  lw         $s6, 0x28($sp)
/* 60B68 8005FF68 8FB50024 */  lw         $s5, 0x24($sp)
/* 60B6C 8005FF6C 8FB40020 */  lw         $s4, 0x20($sp)
/* 60B70 8005FF70 8FB3001C */  lw         $s3, 0x1c($sp)
/* 60B74 8005FF74 8FB20018 */  lw         $s2, 0x18($sp)
/* 60B78 8005FF78 8FB10014 */  lw         $s1, 0x14($sp)
/* 60B7C 8005FF7C 8FB00010 */  lw         $s0, 0x10($sp)
/* 60B80 8005FF80 03E00008 */  jr         $ra
/* 60B84 8005FF84 27BD0030 */   addiu     $sp, $sp, 0x30
/* 60B88 8005FF88 00000000 */  nop
/* 60B8C 8005FF8C 00000000 */  nop
