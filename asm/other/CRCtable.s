.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel CRCTable_addEntry
/* D67E0 800D5BE0 00042600 */  sll        $a0, $a0, 0x18
/* D67E4 800D5BE4 00002821 */  addu       $a1, $zero, $zero
/* D67E8 800D5BE8 3C068000 */  lui        $a2, 0x8000
/* D67EC 800D5BEC 3C0304C1 */  lui        $v1, 0x4c1
/* D67F0 800D5BF0 34631DB7 */  ori        $v1, $v1, 0x1db7
/* D67F4 800D5BF4 00861024 */  and        $v0, $a0, $a2
.L800D5BF8:
/* D67F8 800D5BF8 10400003 */  beqz       $v0, .L800D5C08
/* D67FC 800D5BFC 00041040 */   sll       $v0, $a0, 1
/* D6800 800D5C00 08035703 */  j          .L800D5C0C
/* D6804 800D5C04 00432026 */   xor       $a0, $v0, $v1
.L800D5C08:
/* D6808 800D5C08 00042040 */  sll        $a0, $a0, 1
.L800D5C0C:
/* D680C 800D5C0C 24A50001 */  addiu      $a1, $a1, 1
/* D6810 800D5C10 2CA20008 */  sltiu      $v0, $a1, 8
/* D6814 800D5C14 1440FFF8 */  bnez       $v0, .L800D5BF8
/* D6818 800D5C18 00861024 */   and       $v0, $a0, $a2
/* D681C 800D5C1C 03E00008 */  jr         $ra
/* D6820 800D5C20 00801021 */   addu      $v0, $a0, $zero

glabel CRCTable_init
/* D6824 800D5C24 3C02800F */  lui        $v0, %hi(crc_table)
/* D6828 800D5C28 8C4350E0 */  lw         $v1, %lo(crc_table)($v0)
/* D682C 800D5C2C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D6830 800D5C30 AFB10014 */  sw         $s1, 0x14($sp)
/* D6834 800D5C34 00408821 */  addu       $s1, $v0, $zero
/* D6838 800D5C38 AFBF0018 */  sw         $ra, 0x18($sp)
/* D683C 800D5C3C 14600019 */  bnez       $v1, .L800D5CA4
/* D6840 800D5C40 AFB00010 */   sw        $s0, 0x10($sp)
/* D6844 800D5C44 24040400 */  addiu      $a0, $zero, 0x400
/* D6848 800D5C48 3C05800E */  lui        $a1, %hi(D_800E4F30)
/* D684C 800D5C4C 24A54F30 */  addiu      $a1, $a1, %lo(D_800E4F30)
/* D6850 800D5C50 0C025F9C */  jal        Malloc
/* D6854 800D5C54 2406004F */   addiu     $a2, $zero, 0x4f
/* D6858 800D5C58 AE2250E0 */  sw         $v0, 0x50e0($s1)
/* D685C 800D5C5C 00008021 */  addu       $s0, $zero, $zero
.L800D5C60:
/* D6860 800D5C60 0C0356F8 */  jal        CRCTable_addEntry
/* D6864 800D5C64 02002021 */   addu      $a0, $s0, $zero
/* D6868 800D5C68 00101880 */  sll        $v1, $s0, 2
/* D686C 800D5C6C 26040001 */  addiu      $a0, $s0, 1
/* D6870 800D5C70 8E2550E0 */  lw         $a1, 0x50e0($s1)
/* D6874 800D5C74 309000FF */  andi       $s0, $a0, 0xff
/* D6878 800D5C78 00651821 */  addu       $v1, $v1, $a1
/* D687C 800D5C7C AC620000 */  sw         $v0, ($v1)
/* D6880 800D5C80 2E0200FF */  sltiu      $v0, $s0, 0xff
/* D6884 800D5C84 1440FFF6 */  bnez       $v0, .L800D5C60
/* D6888 800D5C88 00000000 */   nop
/* D688C 800D5C8C 0C0356F8 */  jal        CRCTable_addEntry
/* D6890 800D5C90 240400FF */   addiu     $a0, $zero, 0xff
/* D6894 800D5C94 8E2450E0 */  lw         $a0, 0x50e0($s1)
/* D6898 800D5C98 00101880 */  sll        $v1, $s0, 2
/* D689C 800D5C9C 00641821 */  addu       $v1, $v1, $a0
/* D68A0 800D5CA0 AC620000 */  sw         $v0, ($v1)
.L800D5CA4:
/* D68A4 800D5CA4 8FBF0018 */  lw         $ra, 0x18($sp)
/* D68A8 800D5CA8 8FB10014 */  lw         $s1, 0x14($sp)
/* D68AC 800D5CAC 8FB00010 */  lw         $s0, 0x10($sp)
/* D68B0 800D5CB0 03E00008 */  jr         $ra
/* D68B4 800D5CB4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel CRCTable_free
/* D68B8 800D5CB8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D68BC 800D5CBC AFB00010 */  sw         $s0, 0x10($sp)
/* D68C0 800D5CC0 3C10800F */  lui        $s0, %hi(crc_table)
/* D68C4 800D5CC4 8E0450E0 */  lw         $a0, %lo(crc_table)($s0)
/* D68C8 800D5CC8 10800006 */  beqz       $a0, .L800D5CE4
/* D68CC 800D5CCC AFBF0014 */   sw        $ra, 0x14($sp)
/* D68D0 800D5CD0 3C05800E */  lui        $a1, %hi(D_800E4F30)
/* D68D4 800D5CD4 24A54F30 */  addiu      $a1, $a1, %lo(D_800E4F30)
/* D68D8 800D5CD8 0C02600C */  jal        Free
/* D68DC 800D5CDC 24060063 */   addiu     $a2, $zero, 0x63
/* D68E0 800D5CE0 AE0050E0 */  sw         $zero, 0x50e0($s0)
.L800D5CE4:
/* D68E4 800D5CE4 8FBF0014 */  lw         $ra, 0x14($sp)
/* D68E8 800D5CE8 8FB00010 */  lw         $s0, 0x10($sp)
/* D68EC 800D5CEC 03E00008 */  jr         $ra
/* D68F0 800D5CF0 27BD0018 */   addiu     $sp, $sp, 0x18
/* D68F4 800D5CF4 00000000 */  nop
/* D68F8 800D5CF8 00000000 */  nop
/* D68FC 800D5CFC 00000000 */  nop
