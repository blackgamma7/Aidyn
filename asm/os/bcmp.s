.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel _bcmp
/* C6800 800C5C00 00851026 */  xor        $v0, $a0, $a1
/* C6804 800C5C04 28C10010 */  slti       $at, $a2, 0x10
/* C6808 800C5C08 14200034 */  bnez       $at, .L800C5CDC
/* C680C 800C5C0C 00000000 */   nop
/* C6810 800C5C10 30420003 */  andi       $v0, $v0, 3
/* C6814 800C5C14 14400018 */  bnez       $v0, .L800C5C78
/* C6818 800C5C18 0004C023 */   negu      $t8, $a0
/* C681C 800C5C1C 33180003 */  andi       $t8, $t8, 3
/* C6820 800C5C20 13000007 */  beqz       $t8, .L800C5C40
/* C6824 800C5C24 00D83023 */   subu      $a2, $a2, $t8
/* C6828 800C5C28 00601021 */  addu       $v0, $v1, $zero
/* C682C 800C5C2C 88820000 */  lwl        $v0, ($a0)
/* C6830 800C5C30 88A30000 */  lwl        $v1, ($a1)
/* C6834 800C5C34 00982021 */  addu       $a0, $a0, $t8
/* C6838 800C5C38 14430033 */  bne        $v0, $v1, .L800C5D08
/* C683C 800C5C3C 00B82821 */   addu      $a1, $a1, $t8
.L800C5C40:
/* C6840 800C5C40 2401FFFC */  addiu      $at, $zero, -4
/* C6844 800C5C44 00C13824 */  and        $a3, $a2, $at
/* C6848 800C5C48 10E00024 */  beqz       $a3, .L800C5CDC
/* C684C 800C5C4C 00C73023 */   subu      $a2, $a2, $a3
/* C6850 800C5C50 00E43821 */  addu       $a3, $a3, $a0
.L800C5C54:
/* C6854 800C5C54 8C820000 */  lw         $v0, ($a0)
/* C6858 800C5C58 8CA30000 */  lw         $v1, ($a1)
/* C685C 800C5C5C 24840004 */  addiu      $a0, $a0, 4
/* C6860 800C5C60 14430029 */  bne        $v0, $v1, .L800C5D08
/* C6864 800C5C64 24A50004 */   addiu     $a1, $a1, 4
/* C6868 800C5C68 1487FFFA */  bne        $a0, $a3, .L800C5C54
/* C686C 800C5C6C 00000000 */   nop
/* C6870 800C5C70 1000001A */  b          .L800C5CDC
/* C6874 800C5C74 00000000 */   nop
.L800C5C78:
/* C6878 800C5C78 00053823 */  negu       $a3, $a1
/* C687C 800C5C7C 30E70003 */  andi       $a3, $a3, 3
/* C6880 800C5C80 10E00009 */  beqz       $a3, .L800C5CA8
/* C6884 800C5C84 00C73023 */   subu      $a2, $a2, $a3
/* C6888 800C5C88 00E43821 */  addu       $a3, $a3, $a0
.L800C5C8C:
/* C688C 800C5C8C 90820000 */  lbu        $v0, ($a0)
/* C6890 800C5C90 90A30000 */  lbu        $v1, ($a1)
/* C6894 800C5C94 24840001 */  addiu      $a0, $a0, 1
/* C6898 800C5C98 1443001B */  bne        $v0, $v1, .L800C5D08
/* C689C 800C5C9C 24A50001 */   addiu     $a1, $a1, 1
/* C68A0 800C5CA0 1487FFFA */  bne        $a0, $a3, .L800C5C8C
/* C68A4 800C5CA4 00000000 */   nop
.L800C5CA8:
/* C68A8 800C5CA8 2401FFFC */  addiu      $at, $zero, -4
/* C68AC 800C5CAC 00C13824 */  and        $a3, $a2, $at
/* C68B0 800C5CB0 10E0000A */  beqz       $a3, .L800C5CDC
/* C68B4 800C5CB4 00C73023 */   subu      $a2, $a2, $a3
/* C68B8 800C5CB8 00E43821 */  addu       $a3, $a3, $a0
.L800C5CBC:
/* C68BC 800C5CBC 88820000 */  lwl        $v0, ($a0)
/* C68C0 800C5CC0 98820003 */  lwr        $v0, 3($a0)
/* C68C4 800C5CC4 8CA30000 */  lw         $v1, ($a1)
/* C68C8 800C5CC8 24840004 */  addiu      $a0, $a0, 4
/* C68CC 800C5CCC 1443000E */  bne        $v0, $v1, .L800C5D08
/* C68D0 800C5CD0 24A50004 */   addiu     $a1, $a1, 4
/* C68D4 800C5CD4 1487FFF9 */  bne        $a0, $a3, .L800C5CBC
/* C68D8 800C5CD8 00000000 */   nop
.L800C5CDC:
/* C68DC 800C5CDC 18C00008 */  blez       $a2, .L800C5D00
/* C68E0 800C5CE0 00C43821 */   addu      $a3, $a2, $a0
.L800C5CE4:
/* C68E4 800C5CE4 90820000 */  lbu        $v0, ($a0)
/* C68E8 800C5CE8 90A30000 */  lbu        $v1, ($a1)
/* C68EC 800C5CEC 24840001 */  addiu      $a0, $a0, 1
/* C68F0 800C5CF0 14430005 */  bne        $v0, $v1, .L800C5D08
/* C68F4 800C5CF4 24A50001 */   addiu     $a1, $a1, 1
/* C68F8 800C5CF8 1487FFFA */  bne        $a0, $a3, .L800C5CE4
/* C68FC 800C5CFC 00000000 */   nop
.L800C5D00:
/* C6900 800C5D00 03E00008 */  jr         $ra
/* C6904 800C5D04 00001021 */   addu      $v0, $zero, $zero
.L800C5D08:
/* C6908 800C5D08 03E00008 */  jr         $ra
/* C690C 800C5D0C 24020001 */   addiu     $v0, $zero, 1
