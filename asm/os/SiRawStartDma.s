.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSiRawStartDma
/* CD7D0 800CCBD0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD7D4 800CCBD4 3C02A480 */  lui        $v0, 0xa480
/* CD7D8 800CCBD8 34420018 */  ori        $v0, $v0, 0x18
/* CD7DC 800CCBDC AFBF0018 */  sw         $ra, 0x18($sp)
/* CD7E0 800CCBE0 AFB10014 */  sw         $s1, 0x14($sp)
/* CD7E4 800CCBE4 AFB00010 */  sw         $s0, 0x10($sp)
/* CD7E8 800CCBE8 8C420000 */  lw         $v0, ($v0)
/* CD7EC 800CCBEC 00808021 */  addu       $s0, $a0, $zero
/* CD7F0 800CCBF0 30420003 */  andi       $v0, $v0, 3
/* CD7F4 800CCBF4 10400003 */  beqz       $v0, .L800CCC04
/* CD7F8 800CCBF8 00A08821 */   addu      $s1, $a1, $zero
/* CD7FC 800CCBFC 08033318 */  j          .L800CCC60
/* CD800 800CCC00 2402FFFF */   addiu     $v0, $zero, -1
.L800CCC04:
/* CD804 800CCC04 24020001 */  addiu      $v0, $zero, 1
/* CD808 800CCC08 16020003 */  bne        $s0, $v0, .L800CCC18
/* CD80C 800CCC0C 02202021 */   addu      $a0, $s1, $zero
/* CD810 800CCC10 0C034A30 */  jal        osWritebackDCache
/* CD814 800CCC14 24050040 */   addiu     $a1, $zero, 0x40
.L800CCC18:
/* CD818 800CCC18 0C034888 */  jal        osVirtualToPhysical
/* CD81C 800CCC1C 02202021 */   addu      $a0, $s1, $zero
/* CD820 800CCC20 3C03A480 */  lui        $v1, 0xa480
/* CD824 800CCC24 AC620000 */  sw         $v0, ($v1)
/* CD828 800CCC28 56000003 */  bnel       $s0, $zero, .L800CCC38
/* CD82C 800CCC2C 3C03A480 */   lui       $v1, 0xa480
/* CD830 800CCC30 0803330F */  j          .L800CCC3C
/* CD834 800CCC34 34630004 */   ori       $v1, $v1, 4
.L800CCC38:
/* CD838 800CCC38 34630010 */  ori        $v1, $v1, 0x10
.L800CCC3C:
/* CD83C 800CCC3C 3C021FC0 */  lui        $v0, 0x1fc0
/* CD840 800CCC40 344207C0 */  ori        $v0, $v0, 0x7c0
/* CD844 800CCC44 AC620000 */  sw         $v0, ($v1)
/* CD848 800CCC48 16000005 */  bnez       $s0, .L800CCC60
/* CD84C 800CCC4C 00001021 */   addu      $v0, $zero, $zero
/* CD850 800CCC50 02202021 */  addu       $a0, $s1, $zero
/* CD854 800CCC54 0C030DB4 */  jal        osInvalDCache
/* CD858 800CCC58 24050040 */   addiu     $a1, $zero, 0x40
/* CD85C 800CCC5C 00001021 */  addu       $v0, $zero, $zero
.L800CCC60:
/* CD860 800CCC60 8FBF0018 */  lw         $ra, 0x18($sp)
/* CD864 800CCC64 8FB10014 */  lw         $s1, 0x14($sp)
/* CD868 800CCC68 8FB00010 */  lw         $s0, 0x10($sp)
/* CD86C 800CCC6C 03E00008 */  jr         $ra
/* CD870 800CCC70 27BD0020 */   addiu     $sp, $sp, 0x20
/* CD874 800CCC74 00000000 */  nop
/* CD878 800CCC78 00000000 */  nop
/* CD87C 800CCC7C 00000000 */  nop
