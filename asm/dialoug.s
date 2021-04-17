.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_dialougprecallback
/* B64C0 800B58C0 3C02800F */  lui        $v0, %hi(d_func_A_pointer)
/* B64C4 800B58C4 03E00008 */  jr         $ra
/* B64C8 800B58C8 AC4436D0 */   sw        $a0, %lo(d_func_A_pointer)($v0)

glabel set_dialoug_func_b
/* B64CC 800B58CC 3C02800F */  lui        $v0, %hi(d_func_B_pointer)
/* B64D0 800B58D0 03E00008 */  jr         $ra
/* B64D4 800B58D4 AC4436D4 */   sw        $a0, %lo(d_func_B_pointer)($v0)

glabel set_dialoug_func_c
/* B64D8 800B58D8 3C02800F */  lui        $v0, %hi(d_func_C_pointer)
/* B64DC 800B58DC 03E00008 */  jr         $ra
/* B64E0 800B58E0 AC4436D8 */   sw        $a0, %lo(d_func_C_pointer)($v0)

glabel check_command_bitmask
/* B64E4 800B58E4 30A500FF */  andi       $a1, $a1, 0xff
/* B64E8 800B58E8 000510C0 */  sll        $v0, $a1, 3
/* B64EC 800B58EC 00451023 */  subu       $v0, $v0, $a1
/* B64F0 800B58F0 8C830000 */  lw         $v1, ($a0)
/* B64F4 800B58F4 000210C0 */  sll        $v0, $v0, 3
/* B64F8 800B58F8 00431021 */  addu       $v0, $v0, $v1
/* B64FC 800B58FC 90420031 */  lbu        $v0, 0x31($v0)
/* B6500 800B5900 30430001 */  andi       $v1, $v0, 1
/* B6504 800B5904 10600003 */  beqz       $v1, .L800B5914
/* B6508 800B5908 30430002 */   andi      $v1, $v0, 2
/* B650C 800B590C 03E00008 */  jr         $ra
/* B6510 800B5910 00001021 */   addu      $v0, $zero, $zero
.L800B5914:
/* B6514 800B5914 54600006 */  bnel       $v1, $zero, .L800B5930
/* B6518 800B5918 24020001 */   addiu     $v0, $zero, 1
/* B651C 800B591C 30430004 */  andi       $v1, $v0, 4
/* B6520 800B5920 14600003 */  bnez       $v1, .L800B5930
/* B6524 800B5924 24020002 */   addiu     $v0, $zero, 2
/* B6528 800B5928 03E00008 */  jr         $ra
/* B652C 800B592C 24020003 */   addiu     $v0, $zero, 3
.L800B5930:
/* B6530 800B5930 03E00008 */  jr         $ra
/* B6534 800B5934 00000000 */   nop

glabel get_borg_13_text
/* B6538 800B5938 30A500FF */  andi       $a1, $a1, 0xff
/* B653C 800B593C 000510C0 */  sll        $v0, $a1, 3
/* B6540 800B5940 00451023 */  subu       $v0, $v0, $a1
/* B6544 800B5944 8C830000 */  lw         $v1, ($a0)
/* B6548 800B5948 000210C0 */  sll        $v0, $v0, 3
/* B654C 800B594C 00431021 */  addu       $v0, $v0, $v1
/* B6550 800B5950 84450020 */  lh         $a1, 0x20($v0)
/* B6554 800B5954 8C820008 */  lw         $v0, 8($a0)
/* B6558 800B5958 03E00008 */  jr         $ra
/* B655C 800B595C 00451021 */   addu      $v0, $v0, $a1

glabel command_bitmask_6
/* B6560 800B5960 30A500FF */  andi       $a1, $a1, 0xff
/* B6564 800B5964 000518C0 */  sll        $v1, $a1, 3
/* B6568 800B5968 00651823 */  subu       $v1, $v1, $a1
/* B656C 800B596C 8C850000 */  lw         $a1, ($a0)
/* B6570 800B5970 000318C0 */  sll        $v1, $v1, 3
/* B6574 800B5974 00652821 */  addu       $a1, $v1, $a1
/* B6578 800B5978 90A20031 */  lbu        $v0, 0x31($a1)
/* B657C 800B597C 34420080 */  ori        $v0, $v0, 0x80
/* B6580 800B5980 A0A20031 */  sb         $v0, 0x31($a1)
/* B6584 800B5984 8C860000 */  lw         $a2, ($a0)
/* B6588 800B5988 00661821 */  addu       $v1, $v1, $a2
/* B658C 800B598C 03E00008 */  jr         $ra
/* B6590 800B5990 90620031 */   lbu       $v0, 0x31($v1)

glabel command_bitmask_7
/* B6594 800B5994 30A500FF */  andi       $a1, $a1, 0xff
/* B6598 800B5998 000518C0 */  sll        $v1, $a1, 3
/* B659C 800B599C 00651823 */  subu       $v1, $v1, $a1
/* B65A0 800B59A0 8C820000 */  lw         $v0, ($a0)
/* B65A4 800B59A4 000318C0 */  sll        $v1, $v1, 3
/* B65A8 800B59A8 00621821 */  addu       $v1, $v1, $v0
/* B65AC 800B59AC 90620031 */  lbu        $v0, 0x31($v1)
/* B65B0 800B59B0 03E00008 */  jr         $ra
/* B65B4 800B59B4 000211C2 */   srl       $v0, $v0, 7

glabel func_800B59B8
/* B65B8 800B59B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B65BC 800B59BC AFB10014 */  sw         $s1, 0x14($sp)
/* B65C0 800B59C0 00808821 */  addu       $s1, $a0, $zero
/* B65C4 800B59C4 AFBF0018 */  sw         $ra, 0x18($sp)
/* B65C8 800B59C8 AFB00010 */  sw         $s0, 0x10($sp)
/* B65CC 800B59CC 92220110 */  lbu        $v0, 0x110($s1)
/* B65D0 800B59D0 241000FF */  addiu      $s0, $zero, 0xff
/* B65D4 800B59D4 14500008 */  bne        $v0, $s0, .L800B59F8
/* B65D8 800B59D8 30C600FF */   andi      $a2, $a2, 0xff
/* B65DC 800B59DC 0C02DA83 */  jal        dialoug_func_c_check
/* B65E0 800B59E0 00000000 */   nop
/* B65E4 800B59E4 92220110 */  lbu        $v0, 0x110($s1)
/* B65E8 800B59E8 10500004 */  beq        $v0, $s0, .L800B59FC
/* B65EC 800B59EC 24020001 */   addiu     $v0, $zero, 1
/* B65F0 800B59F0 0802D683 */  j          .L800B5A0C
/* B65F4 800B59F4 8FBF0018 */   lw        $ra, 0x18($sp)
.L800B59F8:
/* B65F8 800B59F8 A2300110 */  sb         $s0, 0x110($s1)
.L800B59FC:
/* B65FC 800B59FC 92220111 */  lbu        $v0, 0x111($s1)
/* B6600 800B5A00 38420001 */  xori       $v0, $v0, 1
/* B6604 800B5A04 2C420001 */  sltiu      $v0, $v0, 1
/* B6608 800B5A08 8FBF0018 */  lw         $ra, 0x18($sp)
.L800B5A0C:
/* B660C 800B5A0C 8FB10014 */  lw         $s1, 0x14($sp)
/* B6610 800B5A10 8FB00010 */  lw         $s0, 0x10($sp)
/* B6614 800B5A14 03E00008 */  jr         $ra
/* B6618 800B5A18 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B5A1C
/* B661C 800B5A1C 00803821 */  addu       $a3, $a0, $zero
/* B6620 800B5A20 90E20012 */  lbu        $v0, 0x12($a3)
/* B6624 800B5A24 1040000C */  beqz       $v0, .L800B5A58
/* B6628 800B5A28 00002821 */   addu      $a1, $zero, $zero
/* B662C 800B5A2C 00003021 */  addu       $a2, $zero, $zero
.L800B5A30:
/* B6630 800B5A30 8CE20000 */  lw         $v0, ($a3)
/* B6634 800B5A34 00C21021 */  addu       $v0, $a2, $v0
/* B6638 800B5A38 90430031 */  lbu        $v1, 0x31($v0)
/* B663C 800B5A3C 24A50001 */  addiu      $a1, $a1, 1
/* B6640 800B5A40 3063007F */  andi       $v1, $v1, 0x7f
/* B6644 800B5A44 A0430031 */  sb         $v1, 0x31($v0)
/* B6648 800B5A48 90E40012 */  lbu        $a0, 0x12($a3)
/* B664C 800B5A4C 00A4202A */  slt        $a0, $a1, $a0
/* B6650 800B5A50 1480FFF7 */  bnez       $a0, .L800B5A30
/* B6654 800B5A54 24C60038 */   addiu     $a2, $a2, 0x38
.L800B5A58:
/* B6658 800B5A58 03E00008 */  jr         $ra
/* B665C 800B5A5C 00000000 */   nop

glabel dialogNode_func_2
/* B6660 800B5A60 27BDFCC8 */  addiu      $sp, $sp, -0x338
/* B6664 800B5A64 AFB20318 */  sw         $s2, 0x318($sp)
/* B6668 800B5A68 30D200FF */  andi       $s2, $a2, 0xff
/* B666C 800B5A6C AFB60328 */  sw         $s6, 0x328($sp)
/* B6670 800B5A70 0080B021 */  addu       $s6, $a0, $zero
/* B6674 800B5A74 AFB3031C */  sw         $s3, 0x31c($sp)
/* B6678 800B5A78 00A09821 */  addu       $s3, $a1, $zero
/* B667C 800B5A7C 02403021 */  addu       $a2, $s2, $zero
/* B6680 800B5A80 AFBF0334 */  sw         $ra, 0x334($sp)
/* B6684 800B5A84 AFBE0330 */  sw         $fp, 0x330($sp)
/* B6688 800B5A88 AFB7032C */  sw         $s7, 0x32c($sp)
/* B668C 800B5A8C AFB50324 */  sw         $s5, 0x324($sp)
/* B6690 800B5A90 AFB40320 */  sw         $s4, 0x320($sp)
/* B6694 800B5A94 AFB10314 */  sw         $s1, 0x314($sp)
/* B6698 800B5A98 0C02D66E */  jal        func_800B59B8
/* B669C 800B5A9C AFB00310 */   sw        $s0, 0x310($sp)
/* B66A0 800B5AA0 14400193 */  bnez       $v0, .L800B60F0
/* B66A4 800B5AA4 00001021 */   addu      $v0, $zero, $zero
/* B66A8 800B5AA8 02602021 */  addu       $a0, $s3, $zero
/* B66AC 800B5AAC 0C02D658 */  jal        command_bitmask_6
/* B66B0 800B5AB0 02402821 */   addu      $a1, $s2, $zero
/* B66B4 800B5AB4 96C3010E */  lhu        $v1, 0x10e($s6)
/* B66B8 800B5AB8 3402FFFF */  ori        $v0, $zero, 0xffff
/* B66BC 800B5ABC 10620043 */  beq        $v1, $v0, .L800B5BCC
/* B66C0 800B5AC0 001218C0 */   sll       $v1, $s2, 3
/* B66C4 800B5AC4 00721823 */  subu       $v1, $v1, $s2
/* B66C8 800B5AC8 8E620000 */  lw         $v0, ($s3)
/* B66CC 800B5ACC 000320C0 */  sll        $a0, $v1, 3
/* B66D0 800B5AD0 00403821 */  addu       $a3, $v0, $zero
/* B66D4 800B5AD4 00821021 */  addu       $v0, $a0, $v0
/* B66D8 800B5AD8 90500028 */  lbu        $s0, 0x28($v0)
/* B66DC 800B5ADC 240300FF */  addiu      $v1, $zero, 0xff
/* B66E0 800B5AE0 1203003A */  beq        $s0, $v1, .L800B5BCC
/* B66E4 800B5AE4 0000A021 */   addu      $s4, $zero, $zero
/* B66E8 800B5AE8 00808821 */  addu       $s1, $a0, $zero
/* B66EC 800B5AEC 241E00FF */  addiu      $fp, $zero, 0xff
/* B66F0 800B5AF0 3417FDE8 */  ori        $s7, $zero, 0xfde8
/* B66F4 800B5AF4 24150002 */  addiu      $s5, $zero, 2
.L800B5AF8:
/* B66F8 800B5AF8 001010C0 */  sll        $v0, $s0, 3
/* B66FC 800B5AFC 00501023 */  subu       $v0, $v0, $s0
/* B6700 800B5B00 000210C0 */  sll        $v0, $v0, 3
/* B6704 800B5B04 00471021 */  addu       $v0, $v0, $a3
/* B6708 800B5B08 94430024 */  lhu        $v1, 0x24($v0)
/* B670C 800B5B0C 96C4010E */  lhu        $a0, 0x10e($s6)
/* B6710 800B5B10 0083182B */  sltu       $v1, $a0, $v1
/* B6714 800B5B14 54600024 */  bnel       $v1, $zero, .L800B5BA8
/* B6718 800B5B18 26940001 */   addiu     $s4, $s4, 1
/* B671C 800B5B1C 94430026 */  lhu        $v1, 0x26($v0)
/* B6720 800B5B20 0064102B */  sltu       $v0, $v1, $a0
/* B6724 800B5B24 10400004 */  beqz       $v0, .L800B5B38
/* B6728 800B5B28 02602021 */   addu      $a0, $s3, $zero
/* B672C 800B5B2C 5477001E */  bnel       $v1, $s7, .L800B5BA8
/* B6730 800B5B30 26940001 */   addiu     $s4, $s4, 1
/* B6734 800B5B34 02602021 */  addu       $a0, $s3, $zero
.L800B5B38:
/* B6738 800B5B38 0C02D665 */  jal        command_bitmask_7
/* B673C 800B5B3C 02002821 */   addu      $a1, $s0, $zero
/* B6740 800B5B40 10400007 */  beqz       $v0, .L800B5B60
/* B6744 800B5B44 02C02021 */   addu      $a0, $s6, $zero
/* B6748 800B5B48 92630014 */  lbu        $v1, 0x14($s3)
/* B674C 800B5B4C 10750004 */  beq        $v1, $s5, .L800B5B60
/* B6750 800B5B50 24020004 */   addiu     $v0, $zero, 4
/* B6754 800B5B54 14620014 */  bne        $v1, $v0, .L800B5BA8
/* B6758 800B5B58 26940001 */   addiu     $s4, $s4, 1
/* B675C 800B5B5C 02C02021 */  addu       $a0, $s6, $zero
.L800B5B60:
/* B6760 800B5B60 02602821 */  addu       $a1, $s3, $zero
/* B6764 800B5B64 02003021 */  addu       $a2, $s0, $zero
/* B6768 800B5B68 3402FFFF */  ori        $v0, $zero, 0xffff
/* B676C 800B5B6C 0C02D9AF */  jal        Dialoug_commands
/* B6770 800B5B70 A6C2010E */   sh        $v0, 0x10e($s6)
/* B6774 800B5B74 02602021 */  addu       $a0, $s3, $zero
/* B6778 800B5B78 0C02D64E */  jal        get_borg_13_text
/* B677C 800B5B7C 02002821 */   addu      $a1, $s0, $zero
/* B6780 800B5B80 00408821 */  addu       $s1, $v0, $zero
/* B6784 800B5B84 92220000 */  lbu        $v0, ($s1)
/* B6788 800B5B88 10400152 */  beqz       $v0, .L800B60D4
/* B678C 800B5B8C 02C02021 */   addu      $a0, $s6, $zero
/* B6790 800B5B90 02602821 */  addu       $a1, $s3, $zero
/* B6794 800B5B94 02003021 */  addu       $a2, $s0, $zero
/* B6798 800B5B98 0C02DAD5 */  jal        func_800B6B54
/* B679C 800B5B9C 02203821 */   addu      $a3, $s1, $zero
.L800B5BA0:
/* B67A0 800B5BA0 0802D83C */  j          .L800B60F0
/* B67A4 800B5BA4 02001021 */   addu      $v0, $s0, $zero
.L800B5BA8:
/* B67A8 800B5BA8 2A820008 */  slti       $v0, $s4, 8
/* B67AC 800B5BAC 10400008 */  beqz       $v0, .L800B5BD0
/* B67B0 800B5BB0 02602021 */   addu      $a0, $s3, $zero
/* B67B4 800B5BB4 8E630000 */  lw         $v1, ($s3)
/* B67B8 800B5BB8 02231021 */  addu       $v0, $s1, $v1
/* B67BC 800B5BBC 00541021 */  addu       $v0, $v0, $s4
/* B67C0 800B5BC0 90500028 */  lbu        $s0, 0x28($v0)
/* B67C4 800B5BC4 161EFFCC */  bne        $s0, $fp, .L800B5AF8
/* B67C8 800B5BC8 00603821 */   addu      $a3, $v1, $zero
.L800B5BCC:
/* B67CC 800B5BCC 02602021 */  addu       $a0, $s3, $zero
.L800B5BD0:
/* B67D0 800B5BD0 0C02D639 */  jal        check_command_bitmask
/* B67D4 800B5BD4 02402821 */   addu      $a1, $s2, $zero
/* B67D8 800B5BD8 00408021 */  addu       $s0, $v0, $zero
/* B67DC 800B5BDC 24020001 */  addiu      $v0, $zero, 1
/* B67E0 800B5BE0 12020112 */  beq        $s0, $v0, .L800B602C
/* B67E4 800B5BE4 2A020002 */   slti      $v0, $s0, 2
/* B67E8 800B5BE8 10400005 */  beqz       $v0, .L800B5C00
/* B67EC 800B5BEC 2A020004 */   slti      $v0, $s0, 4
/* B67F0 800B5BF0 12000007 */  beqz       $s0, .L800B5C10
/* B67F4 800B5BF4 00001021 */   addu      $v0, $zero, $zero
/* B67F8 800B5BF8 0802D83D */  j          .L800B60F4
/* B67FC 800B5BFC 8FBF0334 */   lw        $ra, 0x334($sp)
.L800B5C00:
/* B6800 800B5C00 1040013A */  beqz       $v0, .L800B60EC
/* B6804 800B5C04 27B00210 */   addiu     $s0, $sp, 0x210
/* B6808 800B5C08 0802D82D */  j          .L800B60B4
/* B680C 800B5C0C 02002021 */   addu      $a0, $s0, $zero
.L800B5C10:
/* B6810 800B5C10 001210C0 */  sll        $v0, $s2, 3
/* B6814 800B5C14 00521023 */  subu       $v0, $v0, $s2
/* B6818 800B5C18 8E630000 */  lw         $v1, ($s3)
/* B681C 800B5C1C 000210C0 */  sll        $v0, $v0, 3
/* B6820 800B5C20 00431021 */  addu       $v0, $v0, $v1
/* B6824 800B5C24 90520028 */  lbu        $s2, 0x28($v0)
/* B6828 800B5C28 240300FF */  addiu      $v1, $zero, 0xff
/* B682C 800B5C2C 16430005 */  bne        $s2, $v1, .L800B5C44
/* B6830 800B5C30 02602021 */   addu      $a0, $s3, $zero
/* B6834 800B5C34 92C20116 */  lbu        $v0, 0x116($s6)
/* B6838 800B5C38 54520002 */  bnel       $v0, $s2, .L800B5C44
/* B683C 800B5C3C 00409021 */   addu      $s2, $v0, $zero
/* B6840 800B5C40 02602021 */  addu       $a0, $s3, $zero
.L800B5C44:
/* B6844 800B5C44 0C02D639 */  jal        check_command_bitmask
/* B6848 800B5C48 02402821 */   addu      $a1, $s2, $zero
/* B684C 800B5C4C 00408021 */  addu       $s0, $v0, $zero
/* B6850 800B5C50 24020003 */  addiu      $v0, $zero, 3
/* B6854 800B5C54 16020056 */  bne        $s0, $v0, .L800B5DB0
/* B6858 800B5C58 24020002 */   addiu     $v0, $zero, 2
/* B685C 800B5C5C 02602021 */  addu       $a0, $s3, $zero
/* B6860 800B5C60 02402821 */  addu       $a1, $s2, $zero
/* B6864 800B5C64 0C02D64E */  jal        get_borg_13_text
/* B6868 800B5C68 A2D20116 */   sb        $s2, 0x116($s6)
/* B686C 800B5C6C 00408821 */  addu       $s1, $v0, $zero
/* B6870 800B5C70 92220000 */  lbu        $v0, ($s1)
/* B6874 800B5C74 1440000E */  bnez       $v0, .L800B5CB0
/* B6878 800B5C78 02C02021 */   addu      $a0, $s6, $zero
/* B687C 800B5C7C 27A40010 */  addiu      $a0, $sp, 0x10
/* B6880 800B5C80 3C05800E */  lui        $a1, %hi(D_800E3C70)
/* B6884 800B5C84 24A53C70 */  addiu      $a1, $a1, %lo(D_800E3C70)
/* B6888 800B5C88 0C0333AC */  jal        sprintf
/* B688C 800B5C8C 24060149 */   addiu     $a2, $zero, 0x149
/* B6890 800B5C90 3C04800E */  lui        $a0, %hi(D_800E3C9C)
/* B6894 800B5C94 24843C9C */  addiu      $a0, $a0, %lo(D_800E3C9C)
/* B6898 800B5C98 27A50010 */  addiu      $a1, $sp, 0x10
.L800B5C9C:
/* B689C 800B5C9C 0C025F2D */  jal        manualCrash
/* B68A0 800B5CA0 00000000 */   nop
/* B68A4 800B5CA4 24020001 */  addiu      $v0, $zero, 1
/* B68A8 800B5CA8 0802D83B */  j          .L800B60EC
/* B68AC 800B5CAC A2C20111 */   sb        $v0, 0x111($s6)
.L800B5CB0:
/* B68B0 800B5CB0 02602821 */  addu       $a1, $s3, $zero
/* B68B4 800B5CB4 0C02D9AF */  jal        Dialoug_commands
/* B68B8 800B5CB8 02403021 */   addu      $a2, $s2, $zero
/* B68BC 800B5CBC 02C02021 */  addu       $a0, $s6, $zero
/* B68C0 800B5CC0 02602821 */  addu       $a1, $s3, $zero
/* B68C4 800B5CC4 0C02DA83 */  jal        dialoug_func_c_check
/* B68C8 800B5CC8 02403021 */   addu      $a2, $s2, $zero
/* B68CC 800B5CCC 92D50110 */  lbu        $s5, 0x110($s6)
/* B68D0 800B5CD0 240200FF */  addiu      $v0, $zero, 0xff
/* B68D4 800B5CD4 16A20106 */  bne        $s5, $v0, .L800B60F0
/* B68D8 800B5CD8 00001021 */   addu      $v0, $zero, $zero
/* B68DC 800B5CDC 02C02021 */  addu       $a0, $s6, $zero
/* B68E0 800B5CE0 02602821 */  addu       $a1, $s3, $zero
/* B68E4 800B5CE4 02403021 */  addu       $a2, $s2, $zero
/* B68E8 800B5CE8 0C02DAD5 */  jal        func_800B6B54
/* B68EC 800B5CEC 02203821 */   addu      $a3, $s1, $zero
/* B68F0 800B5CF0 001218C0 */  sll        $v1, $s2, 3
/* B68F4 800B5CF4 00721823 */  subu       $v1, $v1, $s2
/* B68F8 800B5CF8 8E620000 */  lw         $v0, ($s3)
/* B68FC 800B5CFC 000318C0 */  sll        $v1, $v1, 3
/* B6900 800B5D00 00621021 */  addu       $v0, $v1, $v0
/* B6904 800B5D04 90500028 */  lbu        $s0, 0x28($v0)
/* B6908 800B5D08 1215FFA5 */  beq        $s0, $s5, .L800B5BA0
/* B690C 800B5D0C 0000A021 */   addu      $s4, $zero, $zero
/* B6910 800B5D10 241E0002 */  addiu      $fp, $zero, 2
/* B6914 800B5D14 24170004 */  addiu      $s7, $zero, 4
/* B6918 800B5D18 00609021 */  addu       $s2, $v1, $zero
/* B691C 800B5D1C 241500FF */  addiu      $s5, $zero, 0xff
/* B6920 800B5D20 02602021 */  addu       $a0, $s3, $zero
.L800B5D24:
/* B6924 800B5D24 0C02D665 */  jal        command_bitmask_7
/* B6928 800B5D28 02002821 */   addu      $a1, $s0, $zero
/* B692C 800B5D2C 10400007 */  beqz       $v0, .L800B5D4C
/* B6930 800B5D30 02C02021 */   addu      $a0, $s6, $zero
/* B6934 800B5D34 92620014 */  lbu        $v0, 0x14($s3)
/* B6938 800B5D38 505E0005 */  beql       $v0, $fp, .L800B5D50
/* B693C 800B5D3C 02602821 */   addu      $a1, $s3, $zero
/* B6940 800B5D40 54570010 */  bnel       $v0, $s7, .L800B5D84
/* B6944 800B5D44 26940001 */   addiu     $s4, $s4, 1
/* B6948 800B5D48 02C02021 */  addu       $a0, $s6, $zero
.L800B5D4C:
/* B694C 800B5D4C 02602821 */  addu       $a1, $s3, $zero
.L800B5D50:
/* B6950 800B5D50 0C02D9AF */  jal        Dialoug_commands
/* B6954 800B5D54 02003021 */   addu      $a2, $s0, $zero
/* B6958 800B5D58 02602021 */  addu       $a0, $s3, $zero
/* B695C 800B5D5C 0C02D64E */  jal        get_borg_13_text
/* B6960 800B5D60 02002821 */   addu      $a1, $s0, $zero
/* B6964 800B5D64 00408821 */  addu       $s1, $v0, $zero
/* B6968 800B5D68 122000DA */  beqz       $s1, .L800B60D4
/* B696C 800B5D6C 02C02021 */   addu      $a0, $s6, $zero
/* B6970 800B5D70 02602821 */  addu       $a1, $s3, $zero
/* B6974 800B5D74 02003021 */  addu       $a2, $s0, $zero
/* B6978 800B5D78 0C02DAD5 */  jal        func_800B6B54
/* B697C 800B5D7C 02203821 */   addu      $a3, $s1, $zero
/* B6980 800B5D80 26940001 */  addiu      $s4, $s4, 1
.L800B5D84:
/* B6984 800B5D84 2A820008 */  slti       $v0, $s4, 8
/* B6988 800B5D88 104000D9 */  beqz       $v0, .L800B60F0
/* B698C 800B5D8C 02001021 */   addu      $v0, $s0, $zero
/* B6990 800B5D90 8E620000 */  lw         $v0, ($s3)
/* B6994 800B5D94 02421021 */  addu       $v0, $s2, $v0
/* B6998 800B5D98 00541021 */  addu       $v0, $v0, $s4
/* B699C 800B5D9C 90500028 */  lbu        $s0, 0x28($v0)
/* B69A0 800B5DA0 1615FFE0 */  bne        $s0, $s5, .L800B5D24
/* B69A4 800B5DA4 02602021 */   addu      $a0, $s3, $zero
/* B69A8 800B5DA8 0802D83C */  j          .L800B60F0
/* B69AC 800B5DAC 02001021 */   addu      $v0, $s0, $zero
.L800B5DB0:
/* B69B0 800B5DB0 1602008C */  bne        $s0, $v0, .L800B5FE4
/* B69B4 800B5DB4 02C02021 */   addu      $a0, $s6, $zero
/* B69B8 800B5DB8 02602021 */  addu       $a0, $s3, $zero
/* B69BC 800B5DBC 02402821 */  addu       $a1, $s2, $zero
/* B69C0 800B5DC0 0C02D64E */  jal        get_borg_13_text
/* B69C4 800B5DC4 A2D20116 */   sb        $s2, 0x116($s6)
/* B69C8 800B5DC8 00408821 */  addu       $s1, $v0, $zero
/* B69CC 800B5DCC 92220000 */  lbu        $v0, ($s1)
/* B69D0 800B5DD0 1440000B */  bnez       $v0, .L800B5E00
/* B69D4 800B5DD4 02C02021 */   addu      $a0, $s6, $zero
/* B69D8 800B5DD8 27B00110 */  addiu      $s0, $sp, 0x110
/* B69DC 800B5DDC 02002021 */  addu       $a0, $s0, $zero
/* B69E0 800B5DE0 3C05800E */  lui        $a1, %hi(D_800E3CB0)
/* B69E4 800B5DE4 24A53CB0 */  addiu      $a1, $a1, %lo(D_800E3CB0)
/* B69E8 800B5DE8 0C0333AC */  jal        sprintf
/* B69EC 800B5DEC 2406017A */   addiu     $a2, $zero, 0x17a
/* B69F0 800B5DF0 3C04800E */  lui        $a0, %hi(D_800E3C9C)
/* B69F4 800B5DF4 24843C9C */  addiu      $a0, $a0, %lo(D_800E3C9C)
/* B69F8 800B5DF8 0802D727 */  j          .L800B5C9C
/* B69FC 800B5DFC 02002821 */   addu      $a1, $s0, $zero
.L800B5E00:
/* B6A00 800B5E00 02602821 */  addu       $a1, $s3, $zero
/* B6A04 800B5E04 0C02D9AF */  jal        Dialoug_commands
/* B6A08 800B5E08 02403021 */   addu      $a2, $s2, $zero
/* B6A0C 800B5E0C 02C02021 */  addu       $a0, $s6, $zero
/* B6A10 800B5E10 02602821 */  addu       $a1, $s3, $zero
/* B6A14 800B5E14 0C02DA83 */  jal        dialoug_func_c_check
/* B6A18 800B5E18 02403021 */   addu      $a2, $s2, $zero
/* B6A1C 800B5E1C 92D70110 */  lbu        $s7, 0x110($s6)
/* B6A20 800B5E20 240200FF */  addiu      $v0, $zero, 0xff
/* B6A24 800B5E24 16E200B2 */  bne        $s7, $v0, .L800B60F0
/* B6A28 800B5E28 00001021 */   addu      $v0, $zero, $zero
/* B6A2C 800B5E2C 02C02021 */  addu       $a0, $s6, $zero
/* B6A30 800B5E30 02602821 */  addu       $a1, $s3, $zero
/* B6A34 800B5E34 02403021 */  addu       $a2, $s2, $zero
/* B6A38 800B5E38 0C02DAD5 */  jal        func_800B6B54
/* B6A3C 800B5E3C 02203821 */   addu      $a3, $s1, $zero
/* B6A40 800B5E40 02C02021 */  addu       $a0, $s6, $zero
/* B6A44 800B5E44 02602821 */  addu       $a1, $s3, $zero
/* B6A48 800B5E48 0C02D97C */  jal        dialoug_func_b_check
/* B6A4C 800B5E4C 02403021 */   addu      $a2, $s2, $zero
/* B6A50 800B5E50 00003021 */  addu       $a2, $zero, $zero
/* B6A54 800B5E54 0000A021 */  addu       $s4, $zero, $zero
/* B6A58 800B5E58 001220C0 */  sll        $a0, $s2, 3
/* B6A5C 800B5E5C 00921823 */  subu       $v1, $a0, $s2
/* B6A60 800B5E60 8E650000 */  lw         $a1, ($s3)
/* B6A64 800B5E64 000318C0 */  sll        $v1, $v1, 3
/* B6A68 800B5E68 00651821 */  addu       $v1, $v1, $a1
/* B6A6C 800B5E6C 90700028 */  lbu        $s0, 0x28($v1)
/* B6A70 800B5E70 1217001B */  beq        $s0, $s7, .L800B5EE0
/* B6A74 800B5E74 0040A821 */   addu      $s5, $v0, $zero
/* B6A78 800B5E78 00A03821 */  addu       $a3, $a1, $zero
/* B6A7C 800B5E7C 3409FDE8 */  ori        $t1, $zero, 0xfde8
/* B6A80 800B5E80 24650028 */  addiu      $a1, $v1, 0x28
/* B6A84 800B5E84 240800FF */  addiu      $t0, $zero, 0xff
/* B6A88 800B5E88 001010C0 */  sll        $v0, $s0, 3
.L800B5E8C:
/* B6A8C 800B5E8C 00501023 */  subu       $v0, $v0, $s0
/* B6A90 800B5E90 000210C0 */  sll        $v0, $v0, 3
/* B6A94 800B5E94 00471021 */  addu       $v0, $v0, $a3
/* B6A98 800B5E98 94430024 */  lhu        $v1, 0x24($v0)
/* B6A9C 800B5E9C 02A3182A */  slt        $v1, $s5, $v1
/* B6AA0 800B5EA0 54600009 */  bnel       $v1, $zero, .L800B5EC8
/* B6AA4 800B5EA4 26940001 */   addiu     $s4, $s4, 1
/* B6AA8 800B5EA8 94430026 */  lhu        $v1, 0x26($v0)
/* B6AAC 800B5EAC 0075102A */  slt        $v0, $v1, $s5
/* B6AB0 800B5EB0 50400004 */  beql       $v0, $zero, .L800B5EC4
/* B6AB4 800B5EB4 24C60001 */   addiu     $a2, $a2, 1
/* B6AB8 800B5EB8 54690003 */  bnel       $v1, $t1, .L800B5EC8
/* B6ABC 800B5EBC 26940001 */   addiu     $s4, $s4, 1
/* B6AC0 800B5EC0 24C60001 */  addiu      $a2, $a2, 1
.L800B5EC4:
/* B6AC4 800B5EC4 26940001 */  addiu      $s4, $s4, 1
.L800B5EC8:
/* B6AC8 800B5EC8 2A820008 */  slti       $v0, $s4, 8
/* B6ACC 800B5ECC 10400004 */  beqz       $v0, .L800B5EE0
/* B6AD0 800B5ED0 00B41021 */   addu      $v0, $a1, $s4
/* B6AD4 800B5ED4 90500000 */  lbu        $s0, ($v0)
/* B6AD8 800B5ED8 1608FFEC */  bne        $s0, $t0, .L800B5E8C
/* B6ADC 800B5EDC 001010C0 */   sll       $v0, $s0, 3
.L800B5EE0:
/* B6AE0 800B5EE0 28C20002 */  slti       $v0, $a2, 2
/* B6AE4 800B5EE4 5440FF2E */  bnel       $v0, $zero, .L800B5BA0
/* B6AE8 800B5EE8 A6D5010E */   sh        $s5, 0x10e($s6)
/* B6AEC 800B5EEC 00921823 */  subu       $v1, $a0, $s2
/* B6AF0 800B5EF0 8E620000 */  lw         $v0, ($s3)
/* B6AF4 800B5EF4 000320C0 */  sll        $a0, $v1, 3
/* B6AF8 800B5EF8 00403821 */  addu       $a3, $v0, $zero
/* B6AFC 800B5EFC 00821021 */  addu       $v0, $a0, $v0
/* B6B00 800B5F00 90500028 */  lbu        $s0, 0x28($v0)
/* B6B04 800B5F04 240300FF */  addiu      $v1, $zero, 0xff
/* B6B08 800B5F08 1203FF25 */  beq        $s0, $v1, .L800B5BA0
/* B6B0C 800B5F0C 0000A021 */   addu      $s4, $zero, $zero
/* B6B10 800B5F10 241E0004 */  addiu      $fp, $zero, 4
/* B6B14 800B5F14 00809021 */  addu       $s2, $a0, $zero
/* B6B18 800B5F18 241700FF */  addiu      $s7, $zero, 0xff
.L800B5F1C:
/* B6B1C 800B5F1C 001010C0 */  sll        $v0, $s0, 3
/* B6B20 800B5F20 00501023 */  subu       $v0, $v0, $s0
/* B6B24 800B5F24 000210C0 */  sll        $v0, $v0, 3
/* B6B28 800B5F28 00471021 */  addu       $v0, $v0, $a3
/* B6B2C 800B5F2C 94430024 */  lhu        $v1, 0x24($v0)
/* B6B30 800B5F30 02A3182A */  slt        $v1, $s5, $v1
/* B6B34 800B5F34 54600020 */  bnel       $v1, $zero, .L800B5FB8
/* B6B38 800B5F38 26940001 */   addiu     $s4, $s4, 1
/* B6B3C 800B5F3C 94430026 */  lhu        $v1, 0x26($v0)
/* B6B40 800B5F40 0075102A */  slt        $v0, $v1, $s5
/* B6B44 800B5F44 10400003 */  beqz       $v0, .L800B5F54
/* B6B48 800B5F48 3402FDE8 */   ori       $v0, $zero, 0xfde8
/* B6B4C 800B5F4C 5462001A */  bnel       $v1, $v0, .L800B5FB8
/* B6B50 800B5F50 26940001 */   addiu     $s4, $s4, 1
.L800B5F54:
/* B6B54 800B5F54 02602021 */  addu       $a0, $s3, $zero
/* B6B58 800B5F58 0C02D665 */  jal        command_bitmask_7
/* B6B5C 800B5F5C 02002821 */   addu      $a1, $s0, $zero
/* B6B60 800B5F60 10400006 */  beqz       $v0, .L800B5F7C
/* B6B64 800B5F64 24030002 */   addiu     $v1, $zero, 2
/* B6B68 800B5F68 92620014 */  lbu        $v0, 0x14($s3)
/* B6B6C 800B5F6C 10430004 */  beq        $v0, $v1, .L800B5F80
/* B6B70 800B5F70 02C02021 */   addu      $a0, $s6, $zero
/* B6B74 800B5F74 545E0010 */  bnel       $v0, $fp, .L800B5FB8
/* B6B78 800B5F78 26940001 */   addiu     $s4, $s4, 1
.L800B5F7C:
/* B6B7C 800B5F7C 02C02021 */  addu       $a0, $s6, $zero
.L800B5F80:
/* B6B80 800B5F80 02602821 */  addu       $a1, $s3, $zero
/* B6B84 800B5F84 0C02D9AF */  jal        Dialoug_commands
/* B6B88 800B5F88 02003021 */   addu      $a2, $s0, $zero
/* B6B8C 800B5F8C 02602021 */  addu       $a0, $s3, $zero
/* B6B90 800B5F90 0C02D64E */  jal        get_borg_13_text
/* B6B94 800B5F94 02002821 */   addu      $a1, $s0, $zero
/* B6B98 800B5F98 00408821 */  addu       $s1, $v0, $zero
/* B6B9C 800B5F9C 1220004D */  beqz       $s1, .L800B60D4
/* B6BA0 800B5FA0 02C02021 */   addu      $a0, $s6, $zero
/* B6BA4 800B5FA4 02602821 */  addu       $a1, $s3, $zero
/* B6BA8 800B5FA8 02003021 */  addu       $a2, $s0, $zero
/* B6BAC 800B5FAC 0C02DAD5 */  jal        func_800B6B54
/* B6BB0 800B5FB0 02203821 */   addu      $a3, $s1, $zero
/* B6BB4 800B5FB4 26940001 */  addiu      $s4, $s4, 1
.L800B5FB8:
/* B6BB8 800B5FB8 2A820008 */  slti       $v0, $s4, 8
/* B6BBC 800B5FBC 1040004C */  beqz       $v0, .L800B60F0
/* B6BC0 800B5FC0 02001021 */   addu      $v0, $s0, $zero
/* B6BC4 800B5FC4 8E630000 */  lw         $v1, ($s3)
/* B6BC8 800B5FC8 02431021 */  addu       $v0, $s2, $v1
/* B6BCC 800B5FCC 00541021 */  addu       $v0, $v0, $s4
/* B6BD0 800B5FD0 90500028 */  lbu        $s0, 0x28($v0)
/* B6BD4 800B5FD4 1617FFD1 */  bne        $s0, $s7, .L800B5F1C
/* B6BD8 800B5FD8 00603821 */   addu      $a3, $v1, $zero
/* B6BDC 800B5FDC 0802D83C */  j          .L800B60F0
/* B6BE0 800B5FE0 02001021 */   addu      $v0, $s0, $zero
.L800B5FE4:
/* B6BE4 800B5FE4 02602821 */  addu       $a1, $s3, $zero
/* B6BE8 800B5FE8 0C02D9AF */  jal        Dialoug_commands
/* B6BEC 800B5FEC 02403021 */   addu      $a2, $s2, $zero
/* B6BF0 800B5FF0 02602021 */  addu       $a0, $s3, $zero
/* B6BF4 800B5FF4 0C02D64E */  jal        get_borg_13_text
/* B6BF8 800B5FF8 02402821 */   addu      $a1, $s2, $zero
/* B6BFC 800B5FFC 00408821 */  addu       $s1, $v0, $zero
/* B6C00 800B6000 92220000 */  lbu        $v0, ($s1)
/* B6C04 800B6004 14400006 */  bnez       $v0, .L800B6020
/* B6C08 800B6008 02C02021 */   addu      $a0, $s6, $zero
/* B6C0C 800B600C 02602821 */  addu       $a1, $s3, $zero
/* B6C10 800B6010 0C02D698 */  jal        dialogNode_func_2
/* B6C14 800B6014 02403021 */   addu      $a2, $s2, $zero
/* B6C18 800B6018 0802D83D */  j          .L800B60F4
/* B6C1C 800B601C 8FBF0334 */   lw        $ra, 0x334($sp)
.L800B6020:
/* B6C20 800B6020 02602821 */  addu       $a1, $s3, $zero
/* B6C24 800B6024 0802D829 */  j          .L800B60A4
/* B6C28 800B6028 02403021 */   addu      $a2, $s2, $zero
.L800B602C:
/* B6C2C 800B602C 02C02021 */  addu       $a0, $s6, $zero
/* B6C30 800B6030 02602821 */  addu       $a1, $s3, $zero
/* B6C34 800B6034 0C02D97C */  jal        dialoug_func_b_check
/* B6C38 800B6038 02403021 */   addu      $a2, $s2, $zero
/* B6C3C 800B603C 14500007 */  bne        $v0, $s0, .L800B605C
/* B6C40 800B6040 001210C0 */   sll       $v0, $s2, 3
/* B6C44 800B6044 00521023 */  subu       $v0, $v0, $s2
/* B6C48 800B6048 8E630000 */  lw         $v1, ($s3)
/* B6C4C 800B604C 000210C0 */  sll        $v0, $v0, 3
/* B6C50 800B6050 00431021 */  addu       $v0, $v0, $v1
/* B6C54 800B6054 0802D81C */  j          .L800B6070
/* B6C58 800B6058 90500028 */   lbu       $s0, 0x28($v0)
.L800B605C:
/* B6C5C 800B605C 00521023 */  subu       $v0, $v0, $s2
/* B6C60 800B6060 8E630000 */  lw         $v1, ($s3)
/* B6C64 800B6064 000210C0 */  sll        $v0, $v0, 3
/* B6C68 800B6068 00431021 */  addu       $v0, $v0, $v1
/* B6C6C 800B606C 90500029 */  lbu        $s0, 0x29($v0)
.L800B6070:
/* B6C70 800B6070 02C02021 */  addu       $a0, $s6, $zero
/* B6C74 800B6074 02602821 */  addu       $a1, $s3, $zero
/* B6C78 800B6078 0C02D9AF */  jal        Dialoug_commands
/* B6C7C 800B607C 02003021 */   addu      $a2, $s0, $zero
/* B6C80 800B6080 02602021 */  addu       $a0, $s3, $zero
/* B6C84 800B6084 0C02D64E */  jal        get_borg_13_text
/* B6C88 800B6088 02002821 */   addu      $a1, $s0, $zero
/* B6C8C 800B608C 00408821 */  addu       $s1, $v0, $zero
/* B6C90 800B6090 92220000 */  lbu        $v0, ($s1)
/* B6C94 800B6094 1040000F */  beqz       $v0, .L800B60D4
/* B6C98 800B6098 02C02021 */   addu      $a0, $s6, $zero
/* B6C9C 800B609C 02602821 */  addu       $a1, $s3, $zero
/* B6CA0 800B60A0 02003021 */  addu       $a2, $s0, $zero
.L800B60A4:
/* B6CA4 800B60A4 0C02DAD5 */  jal        func_800B6B54
/* B6CA8 800B60A8 02203821 */   addu      $a3, $s1, $zero
/* B6CAC 800B60AC 0802D83C */  j          .L800B60F0
/* B6CB0 800B60B0 02401021 */   addu      $v0, $s2, $zero
.L800B60B4:
/* B6CB4 800B60B4 3C05800E */  lui        $a1, %hi(D_800E3CDC)
/* B6CB8 800B60B8 24A53CDC */  addiu      $a1, $a1, %lo(D_800E3CDC)
/* B6CBC 800B60BC 0C0333AC */  jal        sprintf
/* B6CC0 800B60C0 240601E9 */   addiu     $a2, $zero, 0x1e9
/* B6CC4 800B60C4 3C04800E */  lui        $a0, %hi(D_800E3C9C)
/* B6CC8 800B60C8 24843C9C */  addiu      $a0, $a0, %lo(D_800E3C9C)
/* B6CCC 800B60CC 0802D727 */  j          .L800B5C9C
/* B6CD0 800B60D0 02002821 */   addu      $a1, $s0, $zero
.L800B60D4:
/* B6CD4 800B60D4 02C02021 */  addu       $a0, $s6, $zero
/* B6CD8 800B60D8 02602821 */  addu       $a1, $s3, $zero
/* B6CDC 800B60DC 0C02D698 */  jal        dialogNode_func_2
/* B6CE0 800B60E0 02003021 */   addu      $a2, $s0, $zero
/* B6CE4 800B60E4 0802D83D */  j          .L800B60F4
/* B6CE8 800B60E8 8FBF0334 */   lw        $ra, 0x334($sp)
.L800B60EC:
/* B6CEC 800B60EC 00001021 */  addu       $v0, $zero, $zero
.L800B60F0:
/* B6CF0 800B60F0 8FBF0334 */  lw         $ra, 0x334($sp)
.L800B60F4:
/* B6CF4 800B60F4 8FBE0330 */  lw         $fp, 0x330($sp)
/* B6CF8 800B60F8 8FB7032C */  lw         $s7, 0x32c($sp)
/* B6CFC 800B60FC 8FB60328 */  lw         $s6, 0x328($sp)
/* B6D00 800B6100 8FB50324 */  lw         $s5, 0x324($sp)
/* B6D04 800B6104 8FB40320 */  lw         $s4, 0x320($sp)
/* B6D08 800B6108 8FB3031C */  lw         $s3, 0x31c($sp)
/* B6D0C 800B610C 8FB20318 */  lw         $s2, 0x318($sp)
/* B6D10 800B6110 8FB10314 */  lw         $s1, 0x314($sp)
/* B6D14 800B6114 8FB00310 */  lw         $s0, 0x310($sp)
/* B6D18 800B6118 03E00008 */  jr         $ra
/* B6D1C 800B611C 27BD0338 */   addiu     $sp, $sp, 0x338

glabel DialogNode_func
/* B6D20 800B6120 27BDFDC8 */  addiu      $sp, $sp, -0x238
/* B6D24 800B6124 AFB50224 */  sw         $s5, 0x224($sp)
/* B6D28 800B6128 0080A821 */  addu       $s5, $a0, $zero
/* B6D2C 800B612C AFB20218 */  sw         $s2, 0x218($sp)
/* B6D30 800B6130 00A09021 */  addu       $s2, $a1, $zero
/* B6D34 800B6134 02402021 */  addu       $a0, $s2, $zero
/* B6D38 800B6138 00002821 */  addu       $a1, $zero, $zero
/* B6D3C 800B613C AFBF0234 */  sw         $ra, 0x234($sp)
/* B6D40 800B6140 AFBE0230 */  sw         $fp, 0x230($sp)
/* B6D44 800B6144 AFB7022C */  sw         $s7, 0x22c($sp)
/* B6D48 800B6148 AFB60228 */  sw         $s6, 0x228($sp)
/* B6D4C 800B614C AFB40220 */  sw         $s4, 0x220($sp)
/* B6D50 800B6150 AFB3021C */  sw         $s3, 0x21c($sp)
/* B6D54 800B6154 AFB10214 */  sw         $s1, 0x214($sp)
/* B6D58 800B6158 AFB00210 */  sw         $s0, 0x210($sp)
/* B6D5C 800B615C 0C02D658 */  jal        command_bitmask_6
/* B6D60 800B6160 A2A00111 */   sb        $zero, 0x111($s5)
/* B6D64 800B6164 02A02021 */  addu       $a0, $s5, $zero
/* B6D68 800B6168 02402821 */  addu       $a1, $s2, $zero
/* B6D6C 800B616C 0C02D9AF */  jal        Dialoug_commands
/* B6D70 800B6170 00003021 */   addu      $a2, $zero, $zero
/* B6D74 800B6174 02402021 */  addu       $a0, $s2, $zero
/* B6D78 800B6178 0C02D639 */  jal        check_command_bitmask
/* B6D7C 800B617C 00002821 */   addu      $a1, $zero, $zero
/* B6D80 800B6180 00408021 */  addu       $s0, $v0, $zero
/* B6D84 800B6184 24020001 */  addiu      $v0, $zero, 1
/* B6D88 800B6188 12020069 */  beq        $s0, $v0, .L800B6330
/* B6D8C 800B618C 2A020002 */   slti      $v0, $s0, 2
/* B6D90 800B6190 10400005 */  beqz       $v0, .L800B61A8
/* B6D94 800B6194 24020002 */   addiu     $v0, $zero, 2
/* B6D98 800B6198 12000009 */  beqz       $s0, .L800B61C0
/* B6D9C 800B619C 00001021 */   addu      $v0, $zero, $zero
/* B6DA0 800B61A0 0802D971 */  j          .L800B65C4
/* B6DA4 800B61A4 8FBF0234 */   lw        $ra, 0x234($sp)
.L800B61A8:
/* B6DA8 800B61A8 1202007B */  beq        $s0, $v0, .L800B6398
/* B6DAC 800B61AC 24020003 */   addiu     $v0, $zero, 3
/* B6DB0 800B61B0 12020015 */  beq        $s0, $v0, .L800B6208
/* B6DB4 800B61B4 00001021 */   addu      $v0, $zero, $zero
/* B6DB8 800B61B8 0802D971 */  j          .L800B65C4
/* B6DBC 800B61BC 8FBF0234 */   lw        $ra, 0x234($sp)
.L800B61C0:
/* B6DC0 800B61C0 02402021 */  addu       $a0, $s2, $zero
/* B6DC4 800B61C4 0C02D64E */  jal        get_borg_13_text
/* B6DC8 800B61C8 00002821 */   addu      $a1, $zero, $zero
/* B6DCC 800B61CC 00408821 */  addu       $s1, $v0, $zero
/* B6DD0 800B61D0 92220000 */  lbu        $v0, ($s1)
/* B6DD4 800B61D4 14400006 */  bnez       $v0, .L800B61F0
/* B6DD8 800B61D8 02A02021 */   addu      $a0, $s5, $zero
/* B6DDC 800B61DC 02402821 */  addu       $a1, $s2, $zero
/* B6DE0 800B61E0 0C02D698 */  jal        dialogNode_func_2
/* B6DE4 800B61E4 00003021 */   addu      $a2, $zero, $zero
/* B6DE8 800B61E8 0802D971 */  j          .L800B65C4
/* B6DEC 800B61EC 8FBF0234 */   lw        $ra, 0x234($sp)
.L800B61F0:
/* B6DF0 800B61F0 02402821 */  addu       $a1, $s2, $zero
/* B6DF4 800B61F4 00003021 */  addu       $a2, $zero, $zero
/* B6DF8 800B61F8 0C02DAD5 */  jal        func_800B6B54
/* B6DFC 800B61FC 02203821 */   addu      $a3, $s1, $zero
/* B6E00 800B6200 0802D970 */  j          .L800B65C0
/* B6E04 800B6204 00001021 */   addu      $v0, $zero, $zero
.L800B6208:
/* B6E08 800B6208 02402021 */  addu       $a0, $s2, $zero
/* B6E0C 800B620C 00002821 */  addu       $a1, $zero, $zero
/* B6E10 800B6210 0C02D64E */  jal        get_borg_13_text
/* B6E14 800B6214 A2A00116 */   sb        $zero, 0x116($s5)
/* B6E18 800B6218 00408821 */  addu       $s1, $v0, $zero
/* B6E1C 800B621C 92220000 */  lbu        $v0, ($s1)
/* B6E20 800B6220 1440000B */  bnez       $v0, .L800B6250
/* B6E24 800B6224 02A02021 */   addu      $a0, $s5, $zero
/* B6E28 800B6228 27A40010 */  addiu      $a0, $sp, 0x10
/* B6E2C 800B622C 3C05800E */  lui        $a1, %hi(D_800E3CB0)
/* B6E30 800B6230 24A53CB0 */  addiu      $a1, $a1, %lo(D_800E3CB0)
/* B6E34 800B6234 0C0333AC */  jal        sprintf
/* B6E38 800B6238 2406022E */   addiu     $a2, $zero, 0x22e
/* B6E3C 800B623C 3C04800E */  lui        $a0, %hi(D_800E3C9C)
/* B6E40 800B6240 24843C9C */  addiu      $a0, $a0, %lo(D_800E3C9C)
/* B6E44 800B6244 0C025F2D */  jal        manualCrash
/* B6E48 800B6248 27A50010 */   addiu     $a1, $sp, 0x10
/* B6E4C 800B624C 02A02021 */  addu       $a0, $s5, $zero
.L800B6250:
/* B6E50 800B6250 02402821 */  addu       $a1, $s2, $zero
/* B6E54 800B6254 0C02DA83 */  jal        dialoug_func_c_check
/* B6E58 800B6258 00003021 */   addu      $a2, $zero, $zero
/* B6E5C 800B625C 92B40110 */  lbu        $s4, 0x110($s5)
/* B6E60 800B6260 240200FF */  addiu      $v0, $zero, 0xff
/* B6E64 800B6264 168200D6 */  bne        $s4, $v0, .L800B65C0
/* B6E68 800B6268 00001021 */   addu      $v0, $zero, $zero
/* B6E6C 800B626C 02A02021 */  addu       $a0, $s5, $zero
/* B6E70 800B6270 02402821 */  addu       $a1, $s2, $zero
/* B6E74 800B6274 00003021 */  addu       $a2, $zero, $zero
/* B6E78 800B6278 0C02DAD5 */  jal        func_800B6B54
/* B6E7C 800B627C 02203821 */   addu      $a3, $s1, $zero
/* B6E80 800B6280 8E430000 */  lw         $v1, ($s2)
/* B6E84 800B6284 90700028 */  lbu        $s0, 0x28($v1)
/* B6E88 800B6288 12140041 */  beq        $s0, $s4, .L800B6390
/* B6E8C 800B628C 00009821 */   addu      $s3, $zero, $zero
/* B6E90 800B6290 241E0002 */  addiu      $fp, $zero, 2
/* B6E94 800B6294 24170004 */  addiu      $s7, $zero, 4
/* B6E98 800B6298 0000B021 */  addu       $s6, $zero, $zero
/* B6E9C 800B629C 241400FF */  addiu      $s4, $zero, 0xff
/* B6EA0 800B62A0 02402021 */  addu       $a0, $s2, $zero
.L800B62A4:
/* B6EA4 800B62A4 0C02D665 */  jal        command_bitmask_7
/* B6EA8 800B62A8 02002821 */   addu      $a1, $s0, $zero
/* B6EAC 800B62AC 10400007 */  beqz       $v0, .L800B62CC
/* B6EB0 800B62B0 02A02021 */   addu      $a0, $s5, $zero
/* B6EB4 800B62B4 92420014 */  lbu        $v0, 0x14($s2)
/* B6EB8 800B62B8 505E0005 */  beql       $v0, $fp, .L800B62D0
/* B6EBC 800B62BC 02402821 */   addu      $a1, $s2, $zero
/* B6EC0 800B62C0 54570010 */  bnel       $v0, $s7, .L800B6304
/* B6EC4 800B62C4 26730001 */   addiu     $s3, $s3, 1
/* B6EC8 800B62C8 02A02021 */  addu       $a0, $s5, $zero
.L800B62CC:
/* B6ECC 800B62CC 02402821 */  addu       $a1, $s2, $zero
.L800B62D0:
/* B6ED0 800B62D0 0C02D9AF */  jal        Dialoug_commands
/* B6ED4 800B62D4 02003021 */   addu      $a2, $s0, $zero
/* B6ED8 800B62D8 02402021 */  addu       $a0, $s2, $zero
/* B6EDC 800B62DC 0C02D64E */  jal        get_borg_13_text
/* B6EE0 800B62E0 02002821 */   addu      $a1, $s0, $zero
/* B6EE4 800B62E4 00408821 */  addu       $s1, $v0, $zero
/* B6EE8 800B62E8 122000AF */  beqz       $s1, .L800B65A8
/* B6EEC 800B62EC 02A02021 */   addu      $a0, $s5, $zero
/* B6EF0 800B62F0 02402821 */  addu       $a1, $s2, $zero
/* B6EF4 800B62F4 02003021 */  addu       $a2, $s0, $zero
/* B6EF8 800B62F8 0C02DAD5 */  jal        func_800B6B54
/* B6EFC 800B62FC 02203821 */   addu      $a3, $s1, $zero
/* B6F00 800B6300 26730001 */  addiu      $s3, $s3, 1
.L800B6304:
/* B6F04 800B6304 2A620008 */  slti       $v0, $s3, 8
/* B6F08 800B6308 104000AD */  beqz       $v0, .L800B65C0
/* B6F0C 800B630C 02001021 */   addu      $v0, $s0, $zero
/* B6F10 800B6310 8E420000 */  lw         $v0, ($s2)
/* B6F14 800B6314 02C21021 */  addu       $v0, $s6, $v0
/* B6F18 800B6318 00531021 */  addu       $v0, $v0, $s3
/* B6F1C 800B631C 90500028 */  lbu        $s0, 0x28($v0)
/* B6F20 800B6320 1614FFE0 */  bne        $s0, $s4, .L800B62A4
/* B6F24 800B6324 02402021 */   addu      $a0, $s2, $zero
/* B6F28 800B6328 0802D970 */  j          .L800B65C0
/* B6F2C 800B632C 02001021 */   addu      $v0, $s0, $zero
.L800B6330:
/* B6F30 800B6330 02A02021 */  addu       $a0, $s5, $zero
/* B6F34 800B6334 02402821 */  addu       $a1, $s2, $zero
/* B6F38 800B6338 0C02D97C */  jal        dialoug_func_b_check
/* B6F3C 800B633C 00003021 */   addu      $a2, $zero, $zero
/* B6F40 800B6340 14500003 */  bne        $v0, $s0, .L800B6350
/* B6F44 800B6344 8E420000 */   lw        $v0, ($s2)
/* B6F48 800B6348 0802D8D5 */  j          .L800B6354
/* B6F4C 800B634C 90500028 */   lbu       $s0, 0x28($v0)
.L800B6350:
/* B6F50 800B6350 90500029 */  lbu        $s0, 0x29($v0)
.L800B6354:
/* B6F54 800B6354 02A02021 */  addu       $a0, $s5, $zero
/* B6F58 800B6358 02402821 */  addu       $a1, $s2, $zero
/* B6F5C 800B635C 0C02D9AF */  jal        Dialoug_commands
/* B6F60 800B6360 02003021 */   addu      $a2, $s0, $zero
/* B6F64 800B6364 02402021 */  addu       $a0, $s2, $zero
/* B6F68 800B6368 0C02D64E */  jal        get_borg_13_text
/* B6F6C 800B636C 02002821 */   addu      $a1, $s0, $zero
/* B6F70 800B6370 00408821 */  addu       $s1, $v0, $zero
/* B6F74 800B6374 92220000 */  lbu        $v0, ($s1)
/* B6F78 800B6378 1040008B */  beqz       $v0, .L800B65A8
/* B6F7C 800B637C 02A02021 */   addu      $a0, $s5, $zero
/* B6F80 800B6380 02402821 */  addu       $a1, $s2, $zero
/* B6F84 800B6384 02003021 */  addu       $a2, $s0, $zero
/* B6F88 800B6388 0C02DAD5 */  jal        func_800B6B54
/* B6F8C 800B638C 02203821 */   addu      $a3, $s1, $zero
.L800B6390:
/* B6F90 800B6390 0802D970 */  j          .L800B65C0
/* B6F94 800B6394 02001021 */   addu      $v0, $s0, $zero
.L800B6398:
/* B6F98 800B6398 02402021 */  addu       $a0, $s2, $zero
/* B6F9C 800B639C 00002821 */  addu       $a1, $zero, $zero
/* B6FA0 800B63A0 0C02D64E */  jal        get_borg_13_text
/* B6FA4 800B63A4 A2A00116 */   sb        $zero, 0x116($s5)
/* B6FA8 800B63A8 00408821 */  addu       $s1, $v0, $zero
/* B6FAC 800B63AC 92220000 */  lbu        $v0, ($s1)
/* B6FB0 800B63B0 1440000C */  bnez       $v0, .L800B63E4
/* B6FB4 800B63B4 02A02021 */   addu      $a0, $s5, $zero
/* B6FB8 800B63B8 27B00110 */  addiu      $s0, $sp, 0x110
/* B6FBC 800B63BC 02002021 */  addu       $a0, $s0, $zero
/* B6FC0 800B63C0 3C05800E */  lui        $a1, %hi(D_800E3CB0)
/* B6FC4 800B63C4 24A53CB0 */  addiu      $a1, $a1, %lo(D_800E3CB0)
/* B6FC8 800B63C8 0C0333AC */  jal        sprintf
/* B6FCC 800B63CC 24060272 */   addiu     $a2, $zero, 0x272
/* B6FD0 800B63D0 3C04800E */  lui        $a0, %hi(D_800E3C9C)
/* B6FD4 800B63D4 24843C9C */  addiu      $a0, $a0, %lo(D_800E3C9C)
/* B6FD8 800B63D8 0C025F2D */  jal        manualCrash
/* B6FDC 800B63DC 02002821 */   addu      $a1, $s0, $zero
/* B6FE0 800B63E0 02A02021 */  addu       $a0, $s5, $zero
.L800B63E4:
/* B6FE4 800B63E4 02402821 */  addu       $a1, $s2, $zero
/* B6FE8 800B63E8 0C02DA83 */  jal        dialoug_func_c_check
/* B6FEC 800B63EC 00003021 */   addu      $a2, $zero, $zero
/* B6FF0 800B63F0 92B60110 */  lbu        $s6, 0x110($s5)
/* B6FF4 800B63F4 240200FF */  addiu      $v0, $zero, 0xff
/* B6FF8 800B63F8 16C20071 */  bne        $s6, $v0, .L800B65C0
/* B6FFC 800B63FC 00001021 */   addu      $v0, $zero, $zero
/* B7000 800B6400 02A02021 */  addu       $a0, $s5, $zero
/* B7004 800B6404 02402821 */  addu       $a1, $s2, $zero
/* B7008 800B6408 00003021 */  addu       $a2, $zero, $zero
/* B700C 800B640C 0C02DAD5 */  jal        func_800B6B54
/* B7010 800B6410 02203821 */   addu      $a3, $s1, $zero
/* B7014 800B6414 02A02021 */  addu       $a0, $s5, $zero
/* B7018 800B6418 02402821 */  addu       $a1, $s2, $zero
/* B701C 800B641C 0C02D97C */  jal        dialoug_func_b_check
/* B7020 800B6420 00003021 */   addu      $a2, $zero, $zero
/* B7024 800B6424 00002821 */  addu       $a1, $zero, $zero
/* B7028 800B6428 8E430000 */  lw         $v1, ($s2)
/* B702C 800B642C 00009821 */  addu       $s3, $zero, $zero
/* B7030 800B6430 90700028 */  lbu        $s0, 0x28($v1)
/* B7034 800B6434 1216001B */  beq        $s0, $s6, .L800B64A4
/* B7038 800B6438 0040A021 */   addu      $s4, $v0, $zero
/* B703C 800B643C 00602021 */  addu       $a0, $v1, $zero
/* B7040 800B6440 3408FDE8 */  ori        $t0, $zero, 0xfde8
/* B7044 800B6444 24860028 */  addiu      $a2, $a0, 0x28
/* B7048 800B6448 240700FF */  addiu      $a3, $zero, 0xff
/* B704C 800B644C 001010C0 */  sll        $v0, $s0, 3
.L800B6450:
/* B7050 800B6450 00501023 */  subu       $v0, $v0, $s0
/* B7054 800B6454 000210C0 */  sll        $v0, $v0, 3
/* B7058 800B6458 00441021 */  addu       $v0, $v0, $a0
/* B705C 800B645C 94430024 */  lhu        $v1, 0x24($v0)
/* B7060 800B6460 0283182A */  slt        $v1, $s4, $v1
/* B7064 800B6464 54600009 */  bnel       $v1, $zero, .L800B648C
/* B7068 800B6468 26730001 */   addiu     $s3, $s3, 1
/* B706C 800B646C 94430026 */  lhu        $v1, 0x26($v0)
/* B7070 800B6470 0074102A */  slt        $v0, $v1, $s4
/* B7074 800B6474 50400004 */  beql       $v0, $zero, .L800B6488
/* B7078 800B6478 24A50001 */   addiu     $a1, $a1, 1
/* B707C 800B647C 54680003 */  bnel       $v1, $t0, .L800B648C
/* B7080 800B6480 26730001 */   addiu     $s3, $s3, 1
/* B7084 800B6484 24A50001 */  addiu      $a1, $a1, 1
.L800B6488:
/* B7088 800B6488 26730001 */  addiu      $s3, $s3, 1
.L800B648C:
/* B708C 800B648C 2A620008 */  slti       $v0, $s3, 8
/* B7090 800B6490 10400004 */  beqz       $v0, .L800B64A4
/* B7094 800B6494 00D31021 */   addu      $v0, $a2, $s3
/* B7098 800B6498 90500000 */  lbu        $s0, ($v0)
/* B709C 800B649C 1607FFEC */  bne        $s0, $a3, .L800B6450
/* B70A0 800B64A0 001010C0 */   sll       $v0, $s0, 3
.L800B64A4:
/* B70A4 800B64A4 28A20002 */  slti       $v0, $a1, 2
/* B70A8 800B64A8 5440FFB9 */  bnel       $v0, $zero, .L800B6390
/* B70AC 800B64AC A6B4010E */   sh        $s4, 0x10e($s5)
/* B70B0 800B64B0 00001821 */  addu       $v1, $zero, $zero
/* B70B4 800B64B4 8E420000 */  lw         $v0, ($s2)
/* B70B8 800B64B8 00032980 */  sll        $a1, $v1, 6
/* B70BC 800B64BC 00402021 */  addu       $a0, $v0, $zero
/* B70C0 800B64C0 00A21021 */  addu       $v0, $a1, $v0
/* B70C4 800B64C4 90500028 */  lbu        $s0, 0x28($v0)
/* B70C8 800B64C8 240300FF */  addiu      $v1, $zero, 0xff
/* B70CC 800B64CC 1203FFB0 */  beq        $s0, $v1, .L800B6390
/* B70D0 800B64D0 00009821 */   addu      $s3, $zero, $zero
/* B70D4 800B64D4 241E0004 */  addiu      $fp, $zero, 4
/* B70D8 800B64D8 241700FF */  addiu      $s7, $zero, 0xff
/* B70DC 800B64DC 00A0B021 */  addu       $s6, $a1, $zero
.L800B64E0:
/* B70E0 800B64E0 001010C0 */  sll        $v0, $s0, 3
/* B70E4 800B64E4 00501023 */  subu       $v0, $v0, $s0
/* B70E8 800B64E8 000210C0 */  sll        $v0, $v0, 3
/* B70EC 800B64EC 00441021 */  addu       $v0, $v0, $a0
/* B70F0 800B64F0 94430024 */  lhu        $v1, 0x24($v0)
/* B70F4 800B64F4 0283182A */  slt        $v1, $s4, $v1
/* B70F8 800B64F8 54600020 */  bnel       $v1, $zero, .L800B657C
/* B70FC 800B64FC 26730001 */   addiu     $s3, $s3, 1
/* B7100 800B6500 94430026 */  lhu        $v1, 0x26($v0)
/* B7104 800B6504 0074102A */  slt        $v0, $v1, $s4
/* B7108 800B6508 10400003 */  beqz       $v0, .L800B6518
/* B710C 800B650C 3402FDE8 */   ori       $v0, $zero, 0xfde8
/* B7110 800B6510 5462001A */  bnel       $v1, $v0, .L800B657C
/* B7114 800B6514 26730001 */   addiu     $s3, $s3, 1
.L800B6518:
/* B7118 800B6518 02402021 */  addu       $a0, $s2, $zero
/* B711C 800B651C 0C02D665 */  jal        command_bitmask_7
/* B7120 800B6520 02002821 */   addu      $a1, $s0, $zero
/* B7124 800B6524 10400006 */  beqz       $v0, .L800B6540
/* B7128 800B6528 24030002 */   addiu     $v1, $zero, 2
/* B712C 800B652C 92420014 */  lbu        $v0, 0x14($s2)
/* B7130 800B6530 10430004 */  beq        $v0, $v1, .L800B6544
/* B7134 800B6534 02A02021 */   addu      $a0, $s5, $zero
/* B7138 800B6538 545E0010 */  bnel       $v0, $fp, .L800B657C
/* B713C 800B653C 26730001 */   addiu     $s3, $s3, 1
.L800B6540:
/* B7140 800B6540 02A02021 */  addu       $a0, $s5, $zero
.L800B6544:
/* B7144 800B6544 02402821 */  addu       $a1, $s2, $zero
/* B7148 800B6548 0C02D9AF */  jal        Dialoug_commands
/* B714C 800B654C 02003021 */   addu      $a2, $s0, $zero
/* B7150 800B6550 02402021 */  addu       $a0, $s2, $zero
/* B7154 800B6554 0C02D64E */  jal        get_borg_13_text
/* B7158 800B6558 02002821 */   addu      $a1, $s0, $zero
/* B715C 800B655C 00408821 */  addu       $s1, $v0, $zero
/* B7160 800B6560 12200011 */  beqz       $s1, .L800B65A8
/* B7164 800B6564 02A02021 */   addu      $a0, $s5, $zero
/* B7168 800B6568 02402821 */  addu       $a1, $s2, $zero
/* B716C 800B656C 02003021 */  addu       $a2, $s0, $zero
/* B7170 800B6570 0C02DAD5 */  jal        func_800B6B54
/* B7174 800B6574 02203821 */   addu      $a3, $s1, $zero
/* B7178 800B6578 26730001 */  addiu      $s3, $s3, 1
.L800B657C:
/* B717C 800B657C 2A620008 */  slti       $v0, $s3, 8
/* B7180 800B6580 1040000F */  beqz       $v0, .L800B65C0
/* B7184 800B6584 02001021 */   addu      $v0, $s0, $zero
/* B7188 800B6588 8E430000 */  lw         $v1, ($s2)
/* B718C 800B658C 02C31021 */  addu       $v0, $s6, $v1
/* B7190 800B6590 00531021 */  addu       $v0, $v0, $s3
/* B7194 800B6594 90500028 */  lbu        $s0, 0x28($v0)
/* B7198 800B6598 1617FFD1 */  bne        $s0, $s7, .L800B64E0
/* B719C 800B659C 00602021 */   addu      $a0, $v1, $zero
/* B71A0 800B65A0 0802D970 */  j          .L800B65C0
/* B71A4 800B65A4 02001021 */   addu      $v0, $s0, $zero
.L800B65A8:
/* B71A8 800B65A8 02A02021 */  addu       $a0, $s5, $zero
/* B71AC 800B65AC 02402821 */  addu       $a1, $s2, $zero
/* B71B0 800B65B0 0C02D698 */  jal        dialogNode_func_2
/* B71B4 800B65B4 02003021 */   addu      $a2, $s0, $zero
/* B71B8 800B65B8 0802D971 */  j          .L800B65C4
/* B71BC 800B65BC 8FBF0234 */   lw        $ra, 0x234($sp)
.L800B65C0:
/* B71C0 800B65C0 8FBF0234 */  lw         $ra, 0x234($sp)
.L800B65C4:
/* B71C4 800B65C4 8FBE0230 */  lw         $fp, 0x230($sp)
/* B71C8 800B65C8 8FB7022C */  lw         $s7, 0x22c($sp)
/* B71CC 800B65CC 8FB60228 */  lw         $s6, 0x228($sp)
/* B71D0 800B65D0 8FB50224 */  lw         $s5, 0x224($sp)
/* B71D4 800B65D4 8FB40220 */  lw         $s4, 0x220($sp)
/* B71D8 800B65D8 8FB3021C */  lw         $s3, 0x21c($sp)
/* B71DC 800B65DC 8FB20218 */  lw         $s2, 0x218($sp)
/* B71E0 800B65E0 8FB10214 */  lw         $s1, 0x214($sp)
/* B71E4 800B65E4 8FB00210 */  lw         $s0, 0x210($sp)
/* B71E8 800B65E8 03E00008 */  jr         $ra
/* B71EC 800B65EC 27BD0238 */   addiu     $sp, $sp, 0x238

glabel dialoug_func_b_check
/* B71F0 800B65F0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B71F4 800B65F4 AFB40020 */  sw         $s4, 0x20($sp)
/* B71F8 800B65F8 0080A021 */  addu       $s4, $a0, $zero
/* B71FC 800B65FC AFB10014 */  sw         $s1, 0x14($sp)
/* B7200 800B6600 00A08821 */  addu       $s1, $a1, $zero
/* B7204 800B6604 00002021 */  addu       $a0, $zero, $zero
/* B7208 800B6608 00002821 */  addu       $a1, $zero, $zero
/* B720C 800B660C AFB00010 */  sw         $s0, 0x10($sp)
/* B7210 800B6610 00A08021 */  addu       $s0, $a1, $zero
/* B7214 800B6614 30C600FF */  andi       $a2, $a2, 0xff
/* B7218 800B6618 000610C0 */  sll        $v0, $a2, 3
/* B721C 800B661C 00461023 */  subu       $v0, $v0, $a2
/* B7220 800B6620 AFB20018 */  sw         $s2, 0x18($sp)
/* B7224 800B6624 000290C0 */  sll        $s2, $v0, 3
/* B7228 800B6628 AFB3001C */  sw         $s3, 0x1c($sp)
/* B722C 800B662C 3C13800F */  lui        $s3, 0x800f
/* B7230 800B6630 AFBF0024 */  sw         $ra, 0x24($sp)
/* B7234 800B6634 8E220000 */  lw         $v0, ($s1)
.L800B6638:
/* B7238 800B6638 001018C0 */  sll        $v1, $s0, 3
/* B723C 800B663C 02421021 */  addu       $v0, $s2, $v0
/* B7240 800B6640 00431821 */  addu       $v1, $v0, $v1
/* B7244 800B6644 90660002 */  lbu        $a2, 2($v1)
/* B7248 800B6648 50C0000D */  beql       $a2, $zero, .L800B6680
/* B724C 800B664C 24040001 */   addiu     $a0, $zero, 1
/* B7250 800B6650 04C0000B */  bltz       $a2, .L800B6680
/* B7254 800B6654 28C20020 */   slti      $v0, $a2, 0x20
/* B7258 800B6658 10400009 */  beqz       $v0, .L800B6680
/* B725C 800B665C 28C20017 */   slti      $v0, $a2, 0x17
/* B7260 800B6660 14400007 */  bnez       $v0, .L800B6680
/* B7264 800B6664 8E6236D4 */   lw        $v0, 0x36d4($s3)
/* B7268 800B6668 02802021 */  addu       $a0, $s4, $zero
/* B726C 800B666C 94670000 */  lhu        $a3, ($v1)
/* B7270 800B6670 0040F809 */  jalr       $v0
/* B7274 800B6674 02202821 */   addu      $a1, $s1, $zero
/* B7278 800B6678 00402821 */  addu       $a1, $v0, $zero
/* B727C 800B667C 24040001 */  addiu      $a0, $zero, 1
.L800B6680:
/* B7280 800B6680 14800005 */  bnez       $a0, .L800B6698
/* B7284 800B6684 26020001 */   addiu     $v0, $s0, 1
/* B7288 800B6688 305000FF */  andi       $s0, $v0, 0xff
/* B728C 800B668C 2E030004 */  sltiu      $v1, $s0, 4
/* B7290 800B6690 5460FFE9 */  bnel       $v1, $zero, .L800B6638
/* B7294 800B6694 8E220000 */   lw        $v0, ($s1)
.L800B6698:
/* B7298 800B6698 8FBF0024 */  lw         $ra, 0x24($sp)
/* B729C 800B669C 8FB40020 */  lw         $s4, 0x20($sp)
/* B72A0 800B66A0 8FB3001C */  lw         $s3, 0x1c($sp)
/* B72A4 800B66A4 8FB20018 */  lw         $s2, 0x18($sp)
/* B72A8 800B66A8 8FB10014 */  lw         $s1, 0x14($sp)
/* B72AC 800B66AC 8FB00010 */  lw         $s0, 0x10($sp)
/* B72B0 800B66B0 00A01021 */  addu       $v0, $a1, $zero
/* B72B4 800B66B4 03E00008 */  jr         $ra
/* B72B8 800B66B8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel Dialoug_commands
/* B72BC 800B66BC 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* B72C0 800B66C0 AFBE0138 */  sw         $fp, 0x138($sp)
/* B72C4 800B66C4 0080F021 */  addu       $fp, $a0, $zero
/* B72C8 800B66C8 AFB70134 */  sw         $s7, 0x134($sp)
/* B72CC 800B66CC 00A0B821 */  addu       $s7, $a1, $zero
/* B72D0 800B66D0 AFB30124 */  sw         $s3, 0x124($sp)
/* B72D4 800B66D4 30D300FF */  andi       $s3, $a2, 0xff
/* B72D8 800B66D8 240200FF */  addiu      $v0, $zero, 0xff
/* B72DC 800B66DC AFBF013C */  sw         $ra, 0x13c($sp)
/* B72E0 800B66E0 AFB60130 */  sw         $s6, 0x130($sp)
/* B72E4 800B66E4 AFB5012C */  sw         $s5, 0x12c($sp)
/* B72E8 800B66E8 AFB40128 */  sw         $s4, 0x128($sp)
/* B72EC 800B66EC AFB20120 */  sw         $s2, 0x120($sp)
/* B72F0 800B66F0 AFB1011C */  sw         $s1, 0x11c($sp)
/* B72F4 800B66F4 AFB00118 */  sw         $s0, 0x118($sp)
/* B72F8 800B66F8 126200B8 */  beq        $s3, $v0, .L800B69DC
/* B72FC 800B66FC AFA00110 */   sw        $zero, 0x110($sp)
/* B7300 800B6700 00009021 */  addu       $s2, $zero, $zero
/* B7304 800B6704 001328C0 */  sll        $a1, $s3, 3
/* B7308 800B6708 00B31023 */  subu       $v0, $a1, $s3
/* B730C 800B670C 8EE30000 */  lw         $v1, ($s7)
/* B7310 800B6710 000210C0 */  sll        $v0, $v0, 3
/* B7314 800B6714 00431021 */  addu       $v0, $v0, $v1
/* B7318 800B6718 90440002 */  lbu        $a0, 2($v0)
/* B731C 800B671C 10800014 */  beqz       $a0, .L800B6770
/* B7320 800B6720 00A0A021 */   addu      $s4, $a1, $zero
/* B7324 800B6724 00402021 */  addu       $a0, $v0, $zero
/* B7328 800B6728 24050003 */  addiu      $a1, $zero, 3
/* B732C 800B672C 001210C0 */  sll        $v0, $s2, 3
.L800B6730:
/* B7330 800B6730 00821021 */  addu       $v0, $a0, $v0
/* B7334 800B6734 90430002 */  lbu        $v1, 2($v0)
/* B7338 800B6738 54650004 */  bnel       $v1, $a1, .L800B674C
/* B733C 800B673C 26420001 */   addiu     $v0, $s2, 1
/* B7340 800B6740 94420000 */  lhu        $v0, ($v0)
/* B7344 800B6744 0802D9DB */  j          .L800B676C
/* B7348 800B6748 A7C2010A */   sh        $v0, 0x10a($fp)
.L800B674C:
/* B734C 800B674C 305200FF */  andi       $s2, $v0, 0xff
/* B7350 800B6750 2E430004 */  sltiu      $v1, $s2, 4
/* B7354 800B6754 10600005 */  beqz       $v1, .L800B676C
/* B7358 800B6758 001210C0 */   sll       $v0, $s2, 3
/* B735C 800B675C 00821021 */  addu       $v0, $a0, $v0
/* B7360 800B6760 90430002 */  lbu        $v1, 2($v0)
/* B7364 800B6764 1460FFF2 */  bnez       $v1, .L800B6730
/* B7368 800B6768 001210C0 */   sll       $v0, $s2, 3
.L800B676C:
/* B736C 800B676C 00009021 */  addu       $s2, $zero, $zero
.L800B6770:
/* B7370 800B6770 02931023 */  subu       $v0, $s4, $s3
.L800B6774:
/* B7374 800B6774 000210C0 */  sll        $v0, $v0, 3
/* B7378 800B6778 8EE30000 */  lw         $v1, ($s7)
/* B737C 800B677C 001220C0 */  sll        $a0, $s2, 3
/* B7380 800B6780 00431021 */  addu       $v0, $v0, $v1
/* B7384 800B6784 00441021 */  addu       $v0, $v0, $a0
/* B7388 800B6788 90430002 */  lbu        $v1, 2($v0)
/* B738C 800B678C 2C62003D */  sltiu      $v0, $v1, 0x3d
/* B7390 800B6790 10400052 */  beqz       $v0, .L800B68DC
/* B7394 800B6794 00808821 */   addu      $s1, $a0, $zero
/* B7398 800B6798 3C02800E */  lui        $v0, %hi(D_800E3D30)
/* B739C 800B679C 24423D30 */  addiu      $v0, $v0, %lo(D_800E3D30)
/* B73A0 800B67A0 00031880 */  sll        $v1, $v1, 2
/* B73A4 800B67A4 00621821 */  addu       $v1, $v1, $v0
/* B73A8 800B67A8 8C640000 */  lw         $a0, ($v1)
/* B73AC 800B67AC 00800008 */  jr         $a0
/* B73B0 800B67B0 00000000 */   nop
/* B73B4 800B67B4 24020001 */  addiu      $v0, $zero, 1
/* B73B8 800B67B8 0802DA37 */  j          .L800B68DC
/* B73BC 800B67BC AFA20110 */   sw        $v0, 0x110($sp)
/* B73C0 800B67C0 02931023 */  subu       $v0, $s4, $s3
/* B73C4 800B67C4 000210C0 */  sll        $v0, $v0, 3
/* B73C8 800B67C8 8EE40000 */  lw         $a0, ($s7)
/* B73CC 800B67CC 001218C0 */  sll        $v1, $s2, 3
/* B73D0 800B67D0 00441021 */  addu       $v0, $v0, $a0
/* B73D4 800B67D4 00431021 */  addu       $v0, $v0, $v1
/* B73D8 800B67D8 94440000 */  lhu        $a0, ($v0)
/* B73DC 800B67DC 0802DA37 */  j          .L800B68DC
/* B73E0 800B67E0 A7C40108 */   sh        $a0, 0x108($fp)
/* B73E4 800B67E4 00008021 */  addu       $s0, $zero, $zero
/* B73E8 800B67E8 00002821 */  addu       $a1, $zero, $zero
/* B73EC 800B67EC 27D600F0 */  addiu      $s6, $fp, 0xf0
/* B73F0 800B67F0 02931023 */  subu       $v0, $s4, $s3
/* B73F4 800B67F4 0002A8C0 */  sll        $s5, $v0, 3
.L800B67F8:
/* B73F8 800B67F8 2402000C */  addiu      $v0, $zero, 0xc
/* B73FC 800B67FC 1602000B */  bne        $s0, $v0, .L800B682C
/* B7400 800B6800 00101040 */   sll       $v0, $s0, 1
/* B7404 800B6804 27A40010 */  addiu      $a0, $sp, 0x10
/* B7408 800B6808 3C02800E */  lui        $v0, %hi(D_800E3D00)
/* B740C 800B680C 0C0333AC */  jal        sprintf
/* B7410 800B6810 24453D00 */   addiu     $a1, $v0, %lo(D_800E3D00)
/* B7414 800B6814 3C02800E */  lui        $v0, %hi(D_800E3C9C)
/* B7418 800B6818 24443C9C */  addiu      $a0, $v0, %lo(D_800E3C9C)
/* B741C 800B681C 0C025F2D */  jal        manualCrash
/* B7420 800B6820 27A50010 */   addiu     $a1, $sp, 0x10
/* B7424 800B6824 24050001 */  addiu      $a1, $zero, 1
/* B7428 800B6828 00101040 */  sll        $v0, $s0, 1
.L800B682C:
/* B742C 800B682C 02C22021 */  addu       $a0, $s6, $v0
/* B7430 800B6830 94830000 */  lhu        $v1, ($a0)
/* B7434 800B6834 14600008 */  bnez       $v1, .L800B6858
/* B7438 800B6838 26020001 */   addiu     $v0, $s0, 1
/* B743C 800B683C 8EE20000 */  lw         $v0, ($s7)
/* B7440 800B6840 02A21021 */  addu       $v0, $s5, $v0
/* B7444 800B6844 00511021 */  addu       $v0, $v0, $s1
/* B7448 800B6848 94430000 */  lhu        $v1, ($v0)
/* B744C 800B684C 24050001 */  addiu      $a1, $zero, 1
/* B7450 800B6850 A4830000 */  sh         $v1, ($a0)
/* B7454 800B6854 26020001 */  addiu      $v0, $s0, 1
.L800B6858:
/* B7458 800B6858 10A0FFE7 */  beqz       $a1, .L800B67F8
/* B745C 800B685C 305000FF */   andi      $s0, $v0, 0xff
/* B7460 800B6860 0802DA38 */  j          .L800B68E0
/* B7464 800B6864 8FA20110 */   lw        $v0, 0x110($sp)
/* B7468 800B6868 02931023 */  subu       $v0, $s4, $s3
/* B746C 800B686C 000210C0 */  sll        $v0, $v0, 3
/* B7470 800B6870 8EE40000 */  lw         $a0, ($s7)
/* B7474 800B6874 001218C0 */  sll        $v1, $s2, 3
/* B7478 800B6878 00441021 */  addu       $v0, $v0, $a0
/* B747C 800B687C 00431021 */  addu       $v0, $v0, $v1
/* B7480 800B6880 90440001 */  lbu        $a0, 1($v0)
/* B7484 800B6884 0802DA37 */  j          .L800B68DC
/* B7488 800B6888 A3C40112 */   sb        $a0, 0x112($fp)
/* B748C 800B688C 02931023 */  subu       $v0, $s4, $s3
/* B7490 800B6890 000210C0 */  sll        $v0, $v0, 3
/* B7494 800B6894 8EE40000 */  lw         $a0, ($s7)
/* B7498 800B6898 001218C0 */  sll        $v1, $s2, 3
/* B749C 800B689C 00441021 */  addu       $v0, $v0, $a0
/* B74A0 800B68A0 00431021 */  addu       $v0, $v0, $v1
/* B74A4 800B68A4 90440001 */  lbu        $a0, 1($v0)
/* B74A8 800B68A8 0802DA37 */  j          .L800B68DC
/* B74AC 800B68AC A3C40114 */   sb        $a0, 0x114($fp)
/* B74B0 800B68B0 02931023 */  subu       $v0, $s4, $s3
/* B74B4 800B68B4 000210C0 */  sll        $v0, $v0, 3
/* B74B8 800B68B8 8EE40000 */  lw         $a0, ($s7)
/* B74BC 800B68BC 001218C0 */  sll        $v1, $s2, 3
/* B74C0 800B68C0 00441021 */  addu       $v0, $v0, $a0
/* B74C4 800B68C4 00431021 */  addu       $v0, $v0, $v1
/* B74C8 800B68C8 90440001 */  lbu        $a0, 1($v0)
/* B74CC 800B68CC 0802DA37 */  j          .L800B68DC
/* B74D0 800B68D0 A3C40113 */   sb        $a0, 0x113($fp)
/* B74D4 800B68D4 0C02D687 */  jal        func_800B5A1C
/* B74D8 800B68D8 02E02021 */   addu      $a0, $s7, $zero
.L800B68DC:
/* B74DC 800B68DC 8FA20110 */  lw         $v0, 0x110($sp)
.L800B68E0:
/* B74E0 800B68E0 14400005 */  bnez       $v0, .L800B68F8
/* B74E4 800B68E4 26420001 */   addiu     $v0, $s2, 1
/* B74E8 800B68E8 305200FF */  andi       $s2, $v0, 0xff
/* B74EC 800B68EC 2E430004 */  sltiu      $v1, $s2, 4
/* B74F0 800B68F0 1460FFA0 */  bnez       $v1, .L800B6774
/* B74F4 800B68F4 02931023 */   subu      $v0, $s4, $s3
.L800B68F8:
/* B74F8 800B68F8 AFA00110 */  sw         $zero, 0x110($sp)
/* B74FC 800B68FC 00009021 */  addu       $s2, $zero, $zero
/* B7500 800B6900 02931023 */  subu       $v0, $s4, $s3
.L800B6904:
/* B7504 800B6904 000210C0 */  sll        $v0, $v0, 3
/* B7508 800B6908 001218C0 */  sll        $v1, $s2, 3
/* B750C 800B690C 8EE40000 */  lw         $a0, ($s7)
/* B7510 800B6910 00608821 */  addu       $s1, $v1, $zero
/* B7514 800B6914 00441021 */  addu       $v0, $v0, $a0
/* B7518 800B6918 00431021 */  addu       $v0, $v0, $v1
/* B751C 800B691C 90450002 */  lbu        $a1, 2($v0)
/* B7520 800B6920 2CA20013 */  sltiu      $v0, $a1, 0x13
/* B7524 800B6924 10400026 */  beqz       $v0, .L800B69C0
/* B7528 800B6928 00803021 */   addu      $a2, $a0, $zero
/* B752C 800B692C 3C02800E */  lui        $v0, %hi(D_800E3E28)
/* B7530 800B6930 24423E28 */  addiu      $v0, $v0, %lo(D_800E3E28)
/* B7534 800B6934 00051880 */  sll        $v1, $a1, 2
/* B7538 800B6938 00621821 */  addu       $v1, $v1, $v0
/* B753C 800B693C 8C640000 */  lw         $a0, ($v1)
/* B7540 800B6940 00800008 */  jr         $a0
/* B7544 800B6944 00000000 */   nop
/* B7548 800B6948 24020001 */  addiu      $v0, $zero, 1
/* B754C 800B694C 0802DA70 */  j          .L800B69C0
/* B7550 800B6950 AFA20110 */   sw        $v0, 0x110($sp)
/* B7554 800B6954 03C02021 */  addu       $a0, $fp, $zero
/* B7558 800B6958 02E02821 */  addu       $a1, $s7, $zero
/* B755C 800B695C 02931023 */  subu       $v0, $s4, $s3
/* B7560 800B6960 000210C0 */  sll        $v0, $v0, 3
/* B7564 800B6964 00461021 */  addu       $v0, $v0, $a2
/* B7568 800B6968 00511021 */  addu       $v0, $v0, $s1
/* B756C 800B696C 90460002 */  lbu        $a2, 2($v0)
/* B7570 800B6970 94470000 */  lhu        $a3, ($v0)
/* B7574 800B6974 3C02800F */  lui        $v0, %hi(d_func_A_pointer)
/* B7578 800B6978 97C3010C */  lhu        $v1, 0x10c($fp)
/* B757C 800B697C 8C4836D0 */  lw         $t0, %lo(d_func_A_pointer)($v0)
/* B7580 800B6980 00E33821 */  addu       $a3, $a3, $v1
/* B7584 800B6984 0100F809 */  jalr       $t0
/* B7588 800B6988 30E7FFFF */   andi      $a3, $a3, 0xffff
/* B758C 800B698C 0802DA71 */  j          .L800B69C4
/* B7590 800B6990 8FA20110 */   lw        $v0, 0x110($sp)
/* B7594 800B6994 03C02021 */  addu       $a0, $fp, $zero
/* B7598 800B6998 02931023 */  subu       $v0, $s4, $s3
/* B759C 800B699C 000210C0 */  sll        $v0, $v0, 3
/* B75A0 800B69A0 00461021 */  addu       $v0, $v0, $a2
/* B75A4 800B69A4 00511021 */  addu       $v0, $v0, $s1
/* B75A8 800B69A8 3C03800F */  lui        $v1, %hi(d_func_A_pointer)
/* B75AC 800B69AC 90460002 */  lbu        $a2, 2($v0)
/* B75B0 800B69B0 94470000 */  lhu        $a3, ($v0)
/* B75B4 800B69B4 8C6236D0 */  lw         $v0, %lo(d_func_A_pointer)($v1)
/* B75B8 800B69B8 0040F809 */  jalr       $v0
/* B75BC 800B69BC 02E02821 */   addu      $a1, $s7, $zero
.L800B69C0:
/* B75C0 800B69C0 8FA20110 */  lw         $v0, 0x110($sp)
.L800B69C4:
/* B75C4 800B69C4 14400005 */  bnez       $v0, .L800B69DC
/* B75C8 800B69C8 26420001 */   addiu     $v0, $s2, 1
/* B75CC 800B69CC 305200FF */  andi       $s2, $v0, 0xff
/* B75D0 800B69D0 2E430004 */  sltiu      $v1, $s2, 4
/* B75D4 800B69D4 1460FFCB */  bnez       $v1, .L800B6904
/* B75D8 800B69D8 02931023 */   subu      $v0, $s4, $s3
.L800B69DC:
/* B75DC 800B69DC 8FBF013C */  lw         $ra, 0x13c($sp)
/* B75E0 800B69E0 8FBE0138 */  lw         $fp, 0x138($sp)
/* B75E4 800B69E4 8FB70134 */  lw         $s7, 0x134($sp)
/* B75E8 800B69E8 8FB60130 */  lw         $s6, 0x130($sp)
/* B75EC 800B69EC 8FB5012C */  lw         $s5, 0x12c($sp)
/* B75F0 800B69F0 8FB40128 */  lw         $s4, 0x128($sp)
/* B75F4 800B69F4 8FB30124 */  lw         $s3, 0x124($sp)
/* B75F8 800B69F8 8FB20120 */  lw         $s2, 0x120($sp)
/* B75FC 800B69FC 8FB1011C */  lw         $s1, 0x11c($sp)
/* B7600 800B6A00 8FB00118 */  lw         $s0, 0x118($sp)
/* B7604 800B6A04 03E00008 */  jr         $ra
/* B7608 800B6A08 27BD0140 */   addiu     $sp, $sp, 0x140

glabel dialoug_func_c_check
/* B760C 800B6A0C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B7610 800B6A10 AFB3001C */  sw         $s3, 0x1c($sp)
/* B7614 800B6A14 00009821 */  addu       $s3, $zero, $zero
/* B7618 800B6A18 00004821 */  addu       $t1, $zero, $zero
/* B761C 800B6A1C AFB20018 */  sw         $s2, 0x18($sp)
/* B7620 800B6A20 00809021 */  addu       $s2, $a0, $zero
/* B7624 800B6A24 AFB10014 */  sw         $s1, 0x14($sp)
/* B7628 800B6A28 00A08821 */  addu       $s1, $a1, $zero
/* B762C 800B6A2C AFB00010 */  sw         $s0, 0x10($sp)
/* B7630 800B6A30 30D000FF */  andi       $s0, $a2, 0xff
/* B7634 800B6A34 240200FF */  addiu      $v0, $zero, 0xff
/* B7638 800B6A38 1202003F */  beq        $s0, $v0, .L800B6B38
/* B763C 800B6A3C AFBF0020 */   sw        $ra, 0x20($sp)
/* B7640 800B6A40 001028C0 */  sll        $a1, $s0, 3
.L800B6A44:
/* B7644 800B6A44 00B01023 */  subu       $v0, $a1, $s0
/* B7648 800B6A48 000210C0 */  sll        $v0, $v0, 3
/* B764C 800B6A4C 001320C0 */  sll        $a0, $s3, 3
/* B7650 800B6A50 8E230000 */  lw         $v1, ($s1)
/* B7654 800B6A54 00A03821 */  addu       $a3, $a1, $zero
/* B7658 800B6A58 00431021 */  addu       $v0, $v0, $v1
/* B765C 800B6A5C 00441021 */  addu       $v0, $v0, $a0
/* B7660 800B6A60 90460002 */  lbu        $a2, 2($v0)
/* B7664 800B6A64 2CC3003B */  sltiu      $v1, $a2, 0x3b
/* B7668 800B6A68 1060002D */  beqz       $v1, .L800B6B20
/* B766C 800B6A6C 00804021 */   addu      $t0, $a0, $zero
/* B7670 800B6A70 3C02800E */  lui        $v0, %hi(D_800E3E78)
/* B7674 800B6A74 24423E78 */  addiu      $v0, $v0, %lo(D_800E3E78)
/* B7678 800B6A78 00061880 */  sll        $v1, $a2, 2
/* B767C 800B6A7C 00621821 */  addu       $v1, $v1, $v0
/* B7680 800B6A80 8C640000 */  lw         $a0, ($v1)
/* B7684 800B6A84 00800008 */  jr         $a0
/* B7688 800B6A88 00000000 */   nop
/* B768C 800B6A8C 02402021 */  addu       $a0, $s2, $zero
/* B7690 800B6A90 02202821 */  addu       $a1, $s1, $zero
/* B7694 800B6A94 00F01023 */  subu       $v0, $a3, $s0
/* B7698 800B6A98 A2500110 */  sb         $s0, 0x110($s2)
/* B769C 800B6A9C 8E230000 */  lw         $v1, ($s1)
/* B76A0 800B6AA0 000210C0 */  sll        $v0, $v0, 3
/* B76A4 800B6AA4 00431021 */  addu       $v0, $v0, $v1
/* B76A8 800B6AA8 00481021 */  addu       $v0, $v0, $t0
/* B76AC 800B6AAC 90460002 */  lbu        $a2, 2($v0)
/* B76B0 800B6AB0 94470000 */  lhu        $a3, ($v0)
/* B76B4 800B6AB4 3C02800F */  lui        $v0, %hi(d_func_C_pointer)
/* B76B8 800B6AB8 9643010C */  lhu        $v1, 0x10c($s2)
/* B76BC 800B6ABC 8C4836D8 */  lw         $t0, %lo(d_func_C_pointer)($v0)
/* B76C0 800B6AC0 00E33821 */  addu       $a3, $a3, $v1
/* B76C4 800B6AC4 0100F809 */  jalr       $t0
/* B76C8 800B6AC8 30E7FFFF */   andi      $a3, $a3, 0xffff
/* B76CC 800B6ACC 0802DAC8 */  j          .L800B6B20
/* B76D0 800B6AD0 24090001 */   addiu     $t1, $zero, 1
/* B76D4 800B6AD4 02402021 */  addu       $a0, $s2, $zero
/* B76D8 800B6AD8 00F01023 */  subu       $v0, $a3, $s0
/* B76DC 800B6ADC 0802DABD */  j          .L800B6AF4
/* B76E0 800B6AE0 A2500110 */   sb        $s0, 0x110($s2)
/* B76E4 800B6AE4 24020001 */  addiu      $v0, $zero, 1
/* B76E8 800B6AE8 A2420111 */  sb         $v0, 0x111($s2)
/* B76EC 800B6AEC 02402021 */  addu       $a0, $s2, $zero
/* B76F0 800B6AF0 00F01023 */  subu       $v0, $a3, $s0
.L800B6AF4:
/* B76F4 800B6AF4 8E230000 */  lw         $v1, ($s1)
/* B76F8 800B6AF8 000210C0 */  sll        $v0, $v0, 3
/* B76FC 800B6AFC 00431021 */  addu       $v0, $v0, $v1
/* B7700 800B6B00 00481021 */  addu       $v0, $v0, $t0
/* B7704 800B6B04 3C03800F */  lui        $v1, %hi(d_func_C_pointer)
/* B7708 800B6B08 90460002 */  lbu        $a2, 2($v0)
/* B770C 800B6B0C 94470000 */  lhu        $a3, ($v0)
/* B7710 800B6B10 8C6236D8 */  lw         $v0, %lo(d_func_C_pointer)($v1)
/* B7714 800B6B14 0040F809 */  jalr       $v0
/* B7718 800B6B18 02202821 */   addu      $a1, $s1, $zero
/* B771C 800B6B1C 24090001 */  addiu      $t1, $zero, 1
.L800B6B20:
/* B7720 800B6B20 15200005 */  bnez       $t1, .L800B6B38
/* B7724 800B6B24 26620001 */   addiu     $v0, $s3, 1
/* B7728 800B6B28 305300FF */  andi       $s3, $v0, 0xff
/* B772C 800B6B2C 2E630004 */  sltiu      $v1, $s3, 4
/* B7730 800B6B30 5460FFC4 */  bnel       $v1, $zero, .L800B6A44
/* B7734 800B6B34 001028C0 */   sll       $a1, $s0, 3
.L800B6B38:
/* B7738 800B6B38 8FBF0020 */  lw         $ra, 0x20($sp)
/* B773C 800B6B3C 8FB3001C */  lw         $s3, 0x1c($sp)
/* B7740 800B6B40 8FB20018 */  lw         $s2, 0x18($sp)
/* B7744 800B6B44 8FB10014 */  lw         $s1, 0x14($sp)
/* B7748 800B6B48 8FB00010 */  lw         $s0, 0x10($sp)
/* B774C 800B6B4C 03E00008 */  jr         $ra
/* B7750 800B6B50 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B6B54
/* B7754 800B6B54 30C600FF */  andi       $a2, $a2, 0xff
/* B7758 800B6B58 00004021 */  addu       $t0, $zero, $zero
/* B775C 800B6B5C 240300FF */  addiu      $v1, $zero, 0xff
/* B7760 800B6B60 00802821 */  addu       $a1, $a0, $zero
.L800B6B64:
/* B7764 800B6B64 90A2000C */  lbu        $v0, 0xc($a1)
/* B7768 800B6B68 54430007 */  bnel       $v0, $v1, .L800B6B88
/* B776C 800B6B6C 25080001 */   addiu     $t0, $t0, 1
/* B7770 800B6B70 A0A6000C */  sb         $a2, 0xc($a1)
/* B7774 800B6B74 9483010A */  lhu        $v1, 0x10a($a0)
/* B7778 800B6B78 01001021 */  addu       $v0, $t0, $zero
/* B777C 800B6B7C ACA70008 */  sw         $a3, 8($a1)
/* B7780 800B6B80 03E00008 */  jr         $ra
/* B7784 800B6B84 A4A30004 */   sh        $v1, 4($a1)
.L800B6B88:
/* B7788 800B6B88 29020009 */  slti       $v0, $t0, 9
/* B778C 800B6B8C 1440FFF5 */  bnez       $v0, .L800B6B64
/* B7790 800B6B90 24A5000C */   addiu     $a1, $a1, 0xc
/* B7794 800B6B94 03E00008 */  jr         $ra
/* B7798 800B6B98 2402FFFF */   addiu     $v0, $zero, -1

glabel func_800B6B9C
/* B779C 800B6B9C 240300FF */  addiu      $v1, $zero, 0xff
/* B77A0 800B6BA0 24020008 */  addiu      $v0, $zero, 8
.L800B6BA4:
/* B77A4 800B6BA4 A083000C */  sb         $v1, 0xc($a0)
/* B77A8 800B6BA8 AC800008 */  sw         $zero, 8($a0)
/* B77AC 800B6BAC A4800004 */  sh         $zero, 4($a0)
/* B77B0 800B6BB0 2442FFFF */  addiu      $v0, $v0, -1
/* B77B4 800B6BB4 0441FFFB */  bgez       $v0, .L800B6BA4
/* B77B8 800B6BB8 2484000C */   addiu     $a0, $a0, 0xc
/* B77BC 800B6BBC 03E00008 */  jr         $ra
/* B77C0 800B6BC0 00000000 */   nop

glabel get_dialouge_actors
/* B77C4 800B6BC4 90A20013 */  lbu        $v0, 0x13($a1)
/* B77C8 800B6BC8 1040000D */  beqz       $v0, .L800B6C00
/* B77CC 800B6BCC 00004021 */   addu      $t0, $zero, $zero
/* B77D0 800B6BD0 24870070 */  addiu      $a3, $a0, 0x70
/* B77D4 800B6BD4 8CA60004 */  lw         $a2, 4($a1)
.L800B6BD8:
/* B77D8 800B6BD8 94C20004 */  lhu        $v0, 4($a2)
/* B77DC 800B6BDC 8CC30000 */  lw         $v1, ($a2)
/* B77E0 800B6BE0 24C60008 */  addiu      $a2, $a2, 8
/* B77E4 800B6BE4 25080001 */  addiu      $t0, $t0, 1
/* B77E8 800B6BE8 A4E20004 */  sh         $v0, 4($a3)
/* B77EC 800B6BEC ACE30000 */  sw         $v1, ($a3)
/* B77F0 800B6BF0 90A20013 */  lbu        $v0, 0x13($a1)
/* B77F4 800B6BF4 0102102A */  slt        $v0, $t0, $v0
/* B77F8 800B6BF8 1440FFF7 */  bnez       $v0, .L800B6BD8
/* B77FC 800B6BFC 24E70008 */   addiu     $a3, $a3, 8
.L800B6C00:
/* B7800 800B6C00 90A80013 */  lbu        $t0, 0x13($a1)
/* B7804 800B6C04 29020010 */  slti       $v0, $t0, 0x10
/* B7808 800B6C08 10400009 */  beqz       $v0, .L800B6C30
/* B780C 800B6C0C 000810C0 */   sll       $v0, $t0, 3
/* B7810 800B6C10 24420070 */  addiu      $v0, $v0, 0x70
/* B7814 800B6C14 00442021 */  addu       $a0, $v0, $a0
.L800B6C18:
/* B7818 800B6C18 A4800004 */  sh         $zero, 4($a0)
/* B781C 800B6C1C AC800000 */  sw         $zero, ($a0)
/* B7820 800B6C20 25080001 */  addiu      $t0, $t0, 1
/* B7824 800B6C24 29020010 */  slti       $v0, $t0, 0x10
/* B7828 800B6C28 1440FFFB */  bnez       $v0, .L800B6C18
/* B782C 800B6C2C 24840008 */   addiu     $a0, $a0, 8
.L800B6C30:
/* B7830 800B6C30 03E00008 */  jr         $ra
/* B7834 800B6C34 00000000 */   nop

glabel func_800B6C38
/* B7838 800B6C38 2407000B */  addiu      $a3, $zero, 0xb
/* B783C 800B6C3C 24850106 */  addiu      $a1, $a0, 0x106
/* B7840 800B6C40 2402003C */  addiu      $v0, $zero, 0x3c
/* B7844 800B6C44 240300FF */  addiu      $v1, $zero, 0xff
/* B7848 800B6C48 A4820108 */  sh         $v0, 0x108($a0)
/* B784C 800B6C4C 3402FFFF */  ori        $v0, $zero, 0xffff
/* B7850 800B6C50 A486010C */  sh         $a2, 0x10c($a0)
/* B7854 800B6C54 A0830110 */  sb         $v1, 0x110($a0)
/* B7858 800B6C58 A0830116 */  sb         $v1, 0x116($a0)
/* B785C 800B6C5C A480010A */  sh         $zero, 0x10a($a0)
/* B7860 800B6C60 A0800111 */  sb         $zero, 0x111($a0)
/* B7864 800B6C64 A0800115 */  sb         $zero, 0x115($a0)
/* B7868 800B6C68 A0800114 */  sb         $zero, 0x114($a0)
/* B786C 800B6C6C A0800112 */  sb         $zero, 0x112($a0)
/* B7870 800B6C70 A0800113 */  sb         $zero, 0x113($a0)
/* B7874 800B6C74 A482010E */  sh         $v0, 0x10e($a0)
.L800B6C78:
/* B7878 800B6C78 A4A00000 */  sh         $zero, ($a1)
/* B787C 800B6C7C 24E7FFFF */  addiu      $a3, $a3, -1
/* B7880 800B6C80 04E1FFFD */  bgez       $a3, .L800B6C78
/* B7884 800B6C84 24A5FFFE */   addiu     $a1, $a1, -2
/* B7888 800B6C88 240300FF */  addiu      $v1, $zero, 0xff
/* B788C 800B6C8C 24820008 */  addiu      $v0, $a0, 8
/* B7890 800B6C90 24070008 */  addiu      $a3, $zero, 8
.L800B6C94:
/* B7894 800B6C94 A083000C */  sb         $v1, 0xc($a0)
/* B7898 800B6C98 AC400000 */  sw         $zero, ($v0)
/* B789C 800B6C9C 2442000C */  addiu      $v0, $v0, 0xc
/* B78A0 800B6CA0 A4800004 */  sh         $zero, 4($a0)
/* B78A4 800B6CA4 24E7FFFF */  addiu      $a3, $a3, -1
/* B78A8 800B6CA8 04E1FFFA */  bgez       $a3, .L800B6C94
/* B78AC 800B6CAC 2484000C */   addiu     $a0, $a0, 0xc
/* B78B0 800B6CB0 03E00008 */  jr         $ra
/* B78B4 800B6CB4 00000000 */   nop

glabel func_800B6CB8
/* B78B8 800B6CB8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B78BC 800B6CBC AFB00010 */  sw         $s0, 0x10($sp)
/* B78C0 800B6CC0 00808021 */  addu       $s0, $a0, $zero
/* B78C4 800B6CC4 AFB10014 */  sw         $s1, 0x14($sp)
/* B78C8 800B6CC8 00A08821 */  addu       $s1, $a1, $zero
/* B78CC 800B6CCC AFB20018 */  sw         $s2, 0x18($sp)
/* B78D0 800B6CD0 AFBF001C */  sw         $ra, 0x1c($sp)
/* B78D4 800B6CD4 0C02DAE7 */  jal        func_800B6B9C
/* B78D8 800B6CD8 30D200FF */   andi      $s2, $a2, 0xff
/* B78DC 800B6CDC 92020115 */  lbu        $v0, 0x115($s0)
/* B78E0 800B6CE0 10400006 */  beqz       $v0, .L800B6CFC
/* B78E4 800B6CE4 02002021 */   addu      $a0, $s0, $zero
/* B78E8 800B6CE8 02202821 */  addu       $a1, $s1, $zero
/* B78EC 800B6CEC 0C02D698 */  jal        dialogNode_func_2
/* B78F0 800B6CF0 02403021 */   addu      $a2, $s2, $zero
/* B78F4 800B6CF4 0802DB47 */  j          .L800B6D1C
/* B78F8 800B6CF8 8FBF001C */   lw        $ra, 0x1c($sp)
.L800B6CFC:
/* B78FC 800B6CFC 0C02DAF1 */  jal        get_dialouge_actors
/* B7900 800B6D00 02202821 */   addu      $a1, $s1, $zero
/* B7904 800B6D04 02002021 */  addu       $a0, $s0, $zero
/* B7908 800B6D08 0C02D848 */  jal        DialogNode_func
/* B790C 800B6D0C 02202821 */   addu      $a1, $s1, $zero
/* B7910 800B6D10 24030001 */  addiu      $v1, $zero, 1
/* B7914 800B6D14 A2030115 */  sb         $v1, 0x115($s0)
/* B7918 800B6D18 8FBF001C */  lw         $ra, 0x1c($sp)
.L800B6D1C:
/* B791C 800B6D1C 8FB20018 */  lw         $s2, 0x18($sp)
/* B7920 800B6D20 8FB10014 */  lw         $s1, 0x14($sp)
/* B7924 800B6D24 8FB00010 */  lw         $s0, 0x10($sp)
/* B7928 800B6D28 03E00008 */  jr         $ra
/* B792C 800B6D2C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B6D30
/* B7930 800B6D30 03E00008 */  jr         $ra
/* B7934 800B6D34 00000000 */   nop

glabel func_800B6D38
/* B7938 800B6D38 00001821 */  addu       $v1, $zero, $zero
/* B793C 800B6D3C 90820012 */  lbu        $v0, 0x12($a0)
/* B7940 800B6D40 1040001C */  beqz       $v0, .L800B6DB4
/* B7944 800B6D44 00004821 */   addu      $t1, $zero, $zero
/* B7948 800B6D48 8C8B0000 */  lw         $t3, ($a0)
/* B794C 800B6D4C 246A0001 */  addiu      $t2, $v1, 1
.L800B6D50:
/* B7950 800B6D50 000310C0 */  sll        $v0, $v1, 3
/* B7954 800B6D54 00431023 */  subu       $v0, $v0, $v1
/* B7958 800B6D58 000210C0 */  sll        $v0, $v0, 3
/* B795C 800B6D5C 004B3821 */  addu       $a3, $v0, $t3
/* B7960 800B6D60 00091840 */  sll        $v1, $t1, 1
/* B7964 800B6D64 00651821 */  addu       $v1, $v1, $a1
/* B7968 800B6D68 24080003 */  addiu      $t0, $zero, 3
.L800B6D6C:
/* B796C 800B6D6C 90E60002 */  lbu        $a2, 2($a3)
/* B7970 800B6D70 28C20033 */  slti       $v0, $a2, 0x33
/* B7974 800B6D74 10400007 */  beqz       $v0, .L800B6D94
/* B7978 800B6D78 28C20031 */   slti      $v0, $a2, 0x31
/* B797C 800B6D7C 54400006 */  bnel       $v0, $zero, .L800B6D98
/* B7980 800B6D80 2508FFFF */   addiu     $t0, $t0, -1
/* B7984 800B6D84 94E20000 */  lhu        $v0, ($a3)
/* B7988 800B6D88 25290001 */  addiu      $t1, $t1, 1
/* B798C 800B6D8C A4620000 */  sh         $v0, ($v1)
/* B7990 800B6D90 24630002 */  addiu      $v1, $v1, 2
.L800B6D94:
/* B7994 800B6D94 2508FFFF */  addiu      $t0, $t0, -1
.L800B6D98:
/* B7998 800B6D98 0501FFF4 */  bgez       $t0, .L800B6D6C
/* B799C 800B6D9C 24E70008 */   addiu     $a3, $a3, 8
/* B79A0 800B6DA0 90820012 */  lbu        $v0, 0x12($a0)
/* B79A4 800B6DA4 01401821 */  addu       $v1, $t2, $zero
/* B79A8 800B6DA8 0062102A */  slt        $v0, $v1, $v0
/* B79AC 800B6DAC 1440FFE8 */  bnez       $v0, .L800B6D50
/* B79B0 800B6DB0 246A0001 */   addiu     $t2, $v1, 1
.L800B6DB4:
/* B79B4 800B6DB4 03E00008 */  jr         $ra
/* B79B8 800B6DB8 01201021 */   addu      $v0, $t1, $zero

glabel func_800B6DBC
/* B79BC 800B6DBC 00006021 */  addu       $t4, $zero, $zero
/* B79C0 800B6DC0 90820012 */  lbu        $v0, 0x12($a0)
/* B79C4 800B6DC4 1040001F */  beqz       $v0, .L800B6E44
/* B79C8 800B6DC8 00004821 */   addu      $t1, $zero, $zero
/* B79CC 800B6DCC 8C8D0000 */  lw         $t5, ($a0)
/* B79D0 800B6DD0 00005821 */  addu       $t3, $zero, $zero
.L800B6DD4:
/* B79D4 800B6DD4 00005021 */  addu       $t2, $zero, $zero
/* B79D8 800B6DD8 000B10C0 */  sll        $v0, $t3, 3
/* B79DC 800B6DDC 004D4021 */  addu       $t0, $v0, $t5
/* B79E0 800B6DE0 00091840 */  sll        $v1, $t1, 1
/* B79E4 800B6DE4 00651821 */  addu       $v1, $v1, $a1
.L800B6DE8:
/* B79E8 800B6DE8 91070002 */  lbu        $a3, 2($t0)
/* B79EC 800B6DEC 28E20033 */  slti       $v0, $a3, 0x33
/* B79F0 800B6DF0 1040000B */  beqz       $v0, .L800B6E20
/* B79F4 800B6DF4 28E20031 */   slti      $v0, $a3, 0x31
/* B79F8 800B6DF8 5440000A */  bnel       $v0, $zero, .L800B6E24
/* B79FC 800B6DFC 254A0001 */   addiu     $t2, $t2, 1
/* B7A00 800B6E00 00C9102A */  slt        $v0, $a2, $t1
/* B7A04 800B6E04 50400003 */  beql       $v0, $zero, .L800B6E14
/* B7A08 800B6E08 94620000 */   lhu       $v0, ($v1)
/* B7A0C 800B6E0C 03E00008 */  jr         $ra
/* B7A10 800B6E10 01201021 */   addu      $v0, $t1, $zero
.L800B6E14:
/* B7A14 800B6E14 24630002 */  addiu      $v1, $v1, 2
/* B7A18 800B6E18 25290001 */  addiu      $t1, $t1, 1
/* B7A1C 800B6E1C A5020000 */  sh         $v0, ($t0)
.L800B6E20:
/* B7A20 800B6E20 254A0001 */  addiu      $t2, $t2, 1
.L800B6E24:
/* B7A24 800B6E24 29420004 */  slti       $v0, $t2, 4
/* B7A28 800B6E28 1440FFEF */  bnez       $v0, .L800B6DE8
/* B7A2C 800B6E2C 25080008 */   addiu     $t0, $t0, 8
/* B7A30 800B6E30 90820012 */  lbu        $v0, 0x12($a0)
/* B7A34 800B6E34 258C0001 */  addiu      $t4, $t4, 1
/* B7A38 800B6E38 0182102A */  slt        $v0, $t4, $v0
/* B7A3C 800B6E3C 1440FFE5 */  bnez       $v0, .L800B6DD4
/* B7A40 800B6E40 256B0007 */   addiu     $t3, $t3, 7
.L800B6E44:
/* B7A44 800B6E44 03E00008 */  jr         $ra
/* B7A48 800B6E48 01201021 */   addu      $v0, $t1, $zero

glabel func_800B6E4C
/* B7A4C 800B6E4C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B7A50 800B6E50 F7B60028 */  sdc1       $f22, 0x28($sp)
/* B7A54 800B6E54 4486B000 */  mtc1       $a2, $f22
/* B7A58 800B6E58 44800000 */  mtc1       $zero, $f0
/* B7A5C 800B6E5C AFB10014 */  sw         $s1, 0x14($sp)
/* B7A60 800B6E60 00808821 */  addu       $s1, $a0, $zero
/* B7A64 800B6E64 AFB00010 */  sw         $s0, 0x10($sp)
/* B7A68 800B6E68 AFBF0018 */  sw         $ra, 0x18($sp)
/* B7A6C 800B6E6C F7B40020 */  sdc1       $f20, 0x20($sp)
/* B7A70 800B6E70 4600B03C */  c.lt.s     $f22, $f0
/* B7A74 800B6E74 00000000 */  nop
/* B7A78 800B6E78 4501000A */  bc1t       .L800B6EA4
/* B7A7C 800B6E7C 00A08021 */   addu      $s0, $a1, $zero
/* B7A80 800B6E80 3C01800E */  lui        $at, %hi(D_800E3F64)
/* B7A84 800B6E84 C4343F64 */  lwc1       $f20, %lo(D_800E3F64)($at)
/* B7A88 800B6E88 4616A03C */  c.lt.s     $f20, $f22
/* B7A8C 800B6E8C 00000000 */  nop
/* B7A90 800B6E90 4501001D */  bc1t       .L800B6F08
/* B7A94 800B6E94 00001021 */   addu      $v0, $zero, $zero
/* B7A98 800B6E98 92020012 */  lbu        $v0, 0x12($s0)
/* B7A9C 800B6E9C 14400003 */  bnez       $v0, .L800B6EAC
/* B7AA0 800B6EA0 00000000 */   nop
.L800B6EA4:
/* B7AA4 800B6EA4 0802DBC2 */  j          .L800B6F08
/* B7AA8 800B6EA8 00001021 */   addu      $v0, $zero, $zero
.L800B6EAC:
/* B7AAC 800B6EAC 0C02DAE7 */  jal        func_800B6B9C
/* B7AB0 800B6EB0 02202021 */   addu      $a0, $s1, $zero
/* B7AB4 800B6EB4 4614B032 */  c.eq.s     $f22, $f20
/* B7AB8 800B6EB8 00000000 */  nop
/* B7ABC 800B6EBC 45000003 */  bc1f       .L800B6ECC
/* B7AC0 800B6EC0 92020012 */   lbu       $v0, 0x12($s0)
/* B7AC4 800B6EC4 0802DBB9 */  j          .L800B6EE4
/* B7AC8 800B6EC8 2442FFFF */   addiu     $v0, $v0, -1
.L800B6ECC:
/* B7ACC 800B6ECC 44820000 */  mtc1       $v0, $f0
/* B7AD0 800B6ED0 46800020 */  cvt.s.w    $f0, $f0
/* B7AD4 800B6ED4 4600A003 */  div.s      $f0, $f20, $f0
/* B7AD8 800B6ED8 4600B003 */  div.s      $f0, $f22, $f0
/* B7ADC 800B6EDC 4600008D */  trunc.w.s  $f2, $f0
/* B7AE0 800B6EE0 44021000 */  mfc1       $v0, $f2
.L800B6EE4:
/* B7AE4 800B6EE4 02002021 */  addu       $a0, $s0, $zero
/* B7AE8 800B6EE8 0C02D64E */  jal        get_borg_13_text
/* B7AEC 800B6EEC 304500FF */   andi      $a1, $v0, 0xff
/* B7AF0 800B6EF0 02202021 */  addu       $a0, $s1, $zero
/* B7AF4 800B6EF4 02002821 */  addu       $a1, $s0, $zero
/* B7AF8 800B6EF8 90860110 */  lbu        $a2, 0x110($a0)
/* B7AFC 800B6EFC 0C02DAD5 */  jal        func_800B6B54
/* B7B00 800B6F00 00403821 */   addu      $a3, $v0, $zero
/* B7B04 800B6F04 24020001 */  addiu      $v0, $zero, 1
.L800B6F08:
/* B7B08 800B6F08 8FBF0018 */  lw         $ra, 0x18($sp)
/* B7B0C 800B6F0C 8FB10014 */  lw         $s1, 0x14($sp)
/* B7B10 800B6F10 8FB00010 */  lw         $s0, 0x10($sp)
/* B7B14 800B6F14 D7B60028 */  ldc1       $f22, 0x28($sp)
/* B7B18 800B6F18 D7B40020 */  ldc1       $f20, 0x20($sp)
/* B7B1C 800B6F1C 03E00008 */  jr         $ra
/* B7B20 800B6F20 27BD0030 */   addiu     $sp, $sp, 0x30
/* B7B24 800B6F24 00000000 */  nop
/* B7B28 800B6F28 00000000 */  nop
/* B7B2C 800B6F2C 00000000 */  nop
