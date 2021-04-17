.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ret0_800a6b50
/* A7750 800A6B50 03E00008 */  jr         $ra
/* A7754 800A6B54 00001021 */   addu      $v0, $zero, $zero

glabel set_pointer_offset
/* A7758 800A6B58 03E00008 */  jr         $ra
/* A775C 800A6B5C 00851021 */   addu      $v0, $a0, $a1

glabel borg9_func_a
/* A7760 800A6B60 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* A7764 800A6B64 AFB00010 */  sw         $s0, 0x10($sp)
/* A7768 800A6B68 00808021 */  addu       $s0, $a0, $zero
/* A776C 800A6B6C AFB10014 */  sw         $s1, 0x14($sp)
/* A7770 800A6B70 26110008 */  addiu      $s1, $s0, 8
/* A7774 800A6B74 02202021 */  addu       $a0, $s1, $zero
/* A7778 800A6B78 AFBF0028 */  sw         $ra, 0x28($sp)
/* A777C 800A6B7C AFB50024 */  sw         $s5, 0x24($sp)
/* A7780 800A6B80 AFB40020 */  sw         $s4, 0x20($sp)
/* A7784 800A6B84 AFB3001C */  sw         $s3, 0x1c($sp)
/* A7788 800A6B88 AFB20018 */  sw         $s2, 0x18($sp)
/* A778C 800A6B8C 8E050034 */  lw         $a1, 0x34($s0)
/* A7790 800A6B90 0C029AD6 */  jal        set_pointer_offset
/* A7794 800A6B94 00009821 */   addu      $s3, $zero, $zero
/* A7798 800A6B98 8E050038 */  lw         $a1, 0x38($s0)
/* A779C 800A6B9C 02202021 */  addu       $a0, $s1, $zero
/* A77A0 800A6BA0 0C029AD6 */  jal        set_pointer_offset
/* A77A4 800A6BA4 AE22002C */   sw        $v0, 0x2c($s1)
/* A77A8 800A6BA8 8E05003C */  lw         $a1, 0x3c($s0)
/* A77AC 800A6BAC 02202021 */  addu       $a0, $s1, $zero
/* A77B0 800A6BB0 0C029AD6 */  jal        set_pointer_offset
/* A77B4 800A6BB4 AE220030 */   sw        $v0, 0x30($s1)
/* A77B8 800A6BB8 8E050044 */  lw         $a1, 0x44($s0)
/* A77BC 800A6BBC 02202021 */  addu       $a0, $s1, $zero
/* A77C0 800A6BC0 0C029AD6 */  jal        set_pointer_offset
/* A77C4 800A6BC4 AE220034 */   sw        $v0, 0x34($s1)
/* A77C8 800A6BC8 8E050040 */  lw         $a1, 0x40($s0)
/* A77CC 800A6BCC 02202021 */  addu       $a0, $s1, $zero
/* A77D0 800A6BD0 0C029AD6 */  jal        set_pointer_offset
/* A77D4 800A6BD4 AE22003C */   sw        $v0, 0x3c($s1)
/* A77D8 800A6BD8 8E050048 */  lw         $a1, 0x48($s0)
/* A77DC 800A6BDC 02202021 */  addu       $a0, $s1, $zero
/* A77E0 800A6BE0 0C029AD6 */  jal        set_pointer_offset
/* A77E4 800A6BE4 AE220038 */   sw        $v0, 0x38($s1)
/* A77E8 800A6BE8 8E05004C */  lw         $a1, 0x4c($s0)
/* A77EC 800A6BEC 02202021 */  addu       $a0, $s1, $zero
/* A77F0 800A6BF0 0C029AD6 */  jal        set_pointer_offset
/* A77F4 800A6BF4 AE220040 */   sw        $v0, 0x40($s1)
/* A77F8 800A6BF8 8E050050 */  lw         $a1, 0x50($s0)
/* A77FC 800A6BFC 02202021 */  addu       $a0, $s1, $zero
/* A7800 800A6C00 0C029AD6 */  jal        set_pointer_offset
/* A7804 800A6C04 AE220044 */   sw        $v0, 0x44($s1)
/* A7808 800A6C08 AE220048 */  sw         $v0, 0x48($s1)
/* A780C 800A6C0C 96220024 */  lhu        $v0, 0x24($s1)
/* A7810 800A6C10 10400016 */  beqz       $v0, .L800A6C6C
/* A7814 800A6C14 8E350038 */   lw        $s5, 0x38($s1)
/* A7818 800A6C18 00009021 */  addu       $s2, $zero, $zero
.L800A6C1C:
/* A781C 800A6C1C 26740001 */  addiu      $s4, $s3, 1
/* A7820 800A6C20 8E23003C */  lw         $v1, 0x3c($s1)
/* A7824 800A6C24 00131140 */  sll        $v0, $s3, 5
/* A7828 800A6C28 00629821 */  addu       $s3, $v1, $v0
/* A782C 800A6C2C 00128080 */  sll        $s0, $s2, 2
.L800A6C30:
/* A7830 800A6C30 02708021 */  addu       $s0, $s3, $s0
/* A7834 800A6C34 8E040000 */  lw         $a0, ($s0)
/* A7838 800A6C38 0C029AD6 */  jal        set_pointer_offset
/* A783C 800A6C3C 02A02821 */   addu      $a1, $s5, $zero
/* A7840 800A6C40 26430001 */  addiu      $v1, $s2, 1
/* A7844 800A6C44 3072FFFF */  andi       $s2, $v1, 0xffff
/* A7848 800A6C48 AE020000 */  sw         $v0, ($s0)
/* A784C 800A6C4C 2E420003 */  sltiu      $v0, $s2, 3
/* A7850 800A6C50 5440FFF7 */  bnel       $v0, $zero, .L800A6C30
/* A7854 800A6C54 00128080 */   sll       $s0, $s2, 2
/* A7858 800A6C58 96220024 */  lhu        $v0, 0x24($s1)
/* A785C 800A6C5C 3293FFFF */  andi       $s3, $s4, 0xffff
/* A7860 800A6C60 0262102B */  sltu       $v0, $s3, $v0
/* A7864 800A6C64 1440FFED */  bnez       $v0, .L800A6C1C
/* A7868 800A6C68 00009021 */   addu      $s2, $zero, $zero
.L800A6C6C:
/* A786C 800A6C6C 00009821 */  addu       $s3, $zero, $zero
/* A7870 800A6C70 8E35002C */  lw         $s5, 0x2c($s1)
/* A7874 800A6C74 8E340030 */  lw         $s4, 0x30($s1)
/* A7878 800A6C78 9622002A */  lhu        $v0, 0x2a($s1)
/* A787C 800A6C7C 10400017 */  beqz       $v0, .L800A6CDC
/* A7880 800A6C80 8E320034 */   lw        $s2, 0x34($s1)
.L800A6C84:
/* A7884 800A6C84 00131080 */  sll        $v0, $s3, 2
/* A7888 800A6C88 00531021 */  addu       $v0, $v0, $s3
/* A788C 800A6C8C 8E300048 */  lw         $s0, 0x48($s1)
/* A7890 800A6C90 00021080 */  sll        $v0, $v0, 2
/* A7894 800A6C94 02028021 */  addu       $s0, $s0, $v0
/* A7898 800A6C98 8E040000 */  lw         $a0, ($s0)
/* A789C 800A6C9C 0C029AD6 */  jal        set_pointer_offset
/* A78A0 800A6CA0 02A02821 */   addu      $a1, $s5, $zero
/* A78A4 800A6CA4 8E040004 */  lw         $a0, 4($s0)
/* A78A8 800A6CA8 02802821 */  addu       $a1, $s4, $zero
/* A78AC 800A6CAC 0C029AD6 */  jal        set_pointer_offset
/* A78B0 800A6CB0 AE020000 */   sw        $v0, ($s0)
/* A78B4 800A6CB4 8E040008 */  lw         $a0, 8($s0)
/* A78B8 800A6CB8 02402821 */  addu       $a1, $s2, $zero
/* A78BC 800A6CBC 0C029AD6 */  jal        set_pointer_offset
/* A78C0 800A6CC0 AE020004 */   sw        $v0, 4($s0)
/* A78C4 800A6CC4 26640001 */  addiu      $a0, $s3, 1
/* A78C8 800A6CC8 9623002A */  lhu        $v1, 0x2a($s1)
/* A78CC 800A6CCC 3093FFFF */  andi       $s3, $a0, 0xffff
/* A78D0 800A6CD0 0263182B */  sltu       $v1, $s3, $v1
/* A78D4 800A6CD4 1460FFEB */  bnez       $v1, .L800A6C84
/* A78D8 800A6CD8 AE020008 */   sw        $v0, 8($s0)
.L800A6CDC:
/* A78DC 800A6CDC 8FBF0028 */  lw         $ra, 0x28($sp)
/* A78E0 800A6CE0 8FB50024 */  lw         $s5, 0x24($sp)
/* A78E4 800A6CE4 8FB40020 */  lw         $s4, 0x20($sp)
/* A78E8 800A6CE8 8FB3001C */  lw         $s3, 0x1c($sp)
/* A78EC 800A6CEC 8FB20018 */  lw         $s2, 0x18($sp)
/* A78F0 800A6CF0 8FB10014 */  lw         $s1, 0x14($sp)
/* A78F4 800A6CF4 8FB00010 */  lw         $s0, 0x10($sp)
/* A78F8 800A6CF8 03E00008 */  jr         $ra
/* A78FC 800A6CFC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel n64BorgCollisionZone_func
/* A7900 800A6D00 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A7904 800A6D04 AFB00010 */  sw         $s0, 0x10($sp)
/* A7908 800A6D08 00808021 */  addu       $s0, $a0, $zero
/* A790C 800A6D0C AFBF0018 */  sw         $ra, 0x18($sp)
/* A7910 800A6D10 0C02608C */  jal        get_memUsed
/* A7914 800A6D14 AFB10014 */   sw        $s1, 0x14($sp)
/* A7918 800A6D18 00408821 */  addu       $s1, $v0, $zero
/* A791C 800A6D1C 8E040000 */  lw         $a0, ($s0)
/* A7920 800A6D20 2402FFFF */  addiu      $v0, $zero, -1
/* A7924 800A6D24 14820007 */  bne        $a0, $v0, .L800A6D44
/* A7928 800A6D28 3C05800E */   lui       $a1, %hi(D_800E3390)
/* A792C 800A6D2C 02002021 */  addu       $a0, $s0, $zero
/* A7930 800A6D30 24A53390 */  addiu      $a1, $a1, %lo(D_800E3390)
/* A7934 800A6D34 0C02600C */  jal        Free
/* A7938 800A6D38 240600F0 */   addiu     $a2, $zero, 0xf0
/* A793C 800A6D3C 08029B53 */  j          .L800A6D4C
/* A7940 800A6D40 00000000 */   nop
.L800A6D44:
/* A7944 800A6D44 0C028B7F */  jal        dec_borg_count
/* A7948 800A6D48 00000000 */   nop
.L800A6D4C:
/* A794C 800A6D4C 0C02608C */  jal        get_memUsed
/* A7950 800A6D50 00000000 */   nop
/* A7954 800A6D54 3C06800F */  lui        $a2, %hi(borg_mem)
/* A7958 800A6D58 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A795C 800A6D5C 02221023 */  subu       $v0, $s1, $v0
/* A7960 800A6D60 3C05800F */  lui        $a1, %hi(borg_count)
/* A7964 800A6D64 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A7968 800A6D68 8CC30024 */  lw         $v1, 0x24($a2)
/* A796C 800A6D6C 8CA40024 */  lw         $a0, 0x24($a1)
/* A7970 800A6D70 8FBF0018 */  lw         $ra, 0x18($sp)
/* A7974 800A6D74 8FB10014 */  lw         $s1, 0x14($sp)
/* A7978 800A6D78 8FB00010 */  lw         $s0, 0x10($sp)
/* A797C 800A6D7C 00621823 */  subu       $v1, $v1, $v0
/* A7980 800A6D80 2484FFFF */  addiu      $a0, $a0, -1
/* A7984 800A6D84 ACC30024 */  sw         $v1, 0x24($a2)
/* A7988 800A6D88 ACA40024 */  sw         $a0, 0x24($a1)
/* A798C 800A6D8C 03E00008 */  jr         $ra
/* A7990 800A6D90 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_borg_9
/* A7994 800A6D94 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A7998 800A6D98 AFB00010 */  sw         $s0, 0x10($sp)
/* A799C 800A6D9C AFBF0014 */  sw         $ra, 0x14($sp)
/* A79A0 800A6DA0 0C028918 */  jal        setBorgFlag
/* A79A4 800A6DA4 00808021 */   addu      $s0, $a0, $zero
/* A79A8 800A6DA8 0C028A22 */  jal        getBorgItem
/* A79AC 800A6DAC 02002021 */   addu      $a0, $s0, $zero
/* A79B0 800A6DB0 8FBF0014 */  lw         $ra, 0x14($sp)
/* A79B4 800A6DB4 8FB00010 */  lw         $s0, 0x10($sp)
/* A79B8 800A6DB8 03E00008 */  jr         $ra
/* A79BC 800A6DBC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel remove_borg_9
/* A79C0 800A6DC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A79C4 800A6DC4 AFBF0010 */  sw         $ra, 0x10($sp)
/* A79C8 800A6DC8 0C029B40 */  jal        n64BorgCollisionZone_func
/* A79CC 800A6DCC 00000000 */   nop
/* A79D0 800A6DD0 8FBF0010 */  lw         $ra, 0x10($sp)
/* A79D4 800A6DD4 03E00008 */  jr         $ra
/* A79D8 800A6DD8 27BD0018 */   addiu     $sp, $sp, 0x18
/* A79DC 800A6DDC 00000000 */  nop
