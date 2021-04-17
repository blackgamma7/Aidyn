.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel CalculateCheckSum32
/* D6670 800D5A70 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D6674 800D5A74 AFB00010 */  sw         $s0, 0x10($sp)
/* D6678 800D5A78 00A08021 */  addu       $s0, $a1, $zero
/* D667C 800D5A7C AFB10014 */  sw         $s1, 0x14($sp)
/* D6680 800D5A80 00008821 */  addu       $s1, $zero, $zero
/* D6684 800D5A84 AFB20018 */  sw         $s2, 0x18($sp)
/* D6688 800D5A88 00809021 */  addu       $s2, $a0, $zero
/* D668C 800D5A8C AFBF0020 */  sw         $ra, 0x20($sp)
/* D6690 800D5A90 16400006 */  bnez       $s2, .L800D5AAC
/* D6694 800D5A94 AFB3001C */   sw        $s3, 0x1c($sp)
/* D6698 800D5A98 3C04800E */  lui        $a0, %hi(D_800E4ED0)
/* D669C 800D5A9C 24844ED0 */  addiu      $a0, $a0, %lo(D_800E4ED0)
/* D66A0 800D5AA0 3C05800E */  lui        $a1, %hi(D_800E4F04)
/* D66A4 800D5AA4 0C025F2D */  jal        manualCrash
/* D66A8 800D5AA8 24A54F04 */   addiu     $a1, $a1, %lo(D_800E4F04)
.L800D5AAC:
/* D66AC 800D5AAC 3C13800F */  lui        $s3, %hi(crc_table)
/* D66B0 800D5AB0 8E6250E0 */  lw         $v0, %lo(crc_table)($s3)
/* D66B4 800D5AB4 54400007 */  bnel       $v0, $zero, .L800D5AD4
/* D66B8 800D5AB8 00108082 */   srl       $s0, $s0, 2
/* D66BC 800D5ABC 3C04800E */  lui        $a0, %hi(D_800E4F0C)
/* D66C0 800D5AC0 24844F0C */  addiu      $a0, $a0, %lo(D_800E4F0C)
/* D66C4 800D5AC4 3C05800E */  lui        $a1, %hi(D_800E4F04)
/* D66C8 800D5AC8 0C025F2D */  jal        manualCrash
/* D66CC 800D5ACC 24A54F04 */   addiu     $a1, $a1, %lo(D_800E4F04)
/* D66D0 800D5AD0 00108082 */  srl        $s0, $s0, 2
.L800D5AD4:
/* D66D4 800D5AD4 2610FFFF */  addiu      $s0, $s0, -1
/* D66D8 800D5AD8 2402FFFF */  addiu      $v0, $zero, -1
/* D66DC 800D5ADC 12020019 */  beq        $s0, $v0, .L800D5B44
/* D66E0 800D5AE0 02201021 */   addu      $v0, $s1, $zero
/* D66E4 800D5AE4 3C09FF00 */  lui        $t1, 0xff00
/* D66E8 800D5AE8 8E6850E0 */  lw         $t0, 0x50e0($s3)
/* D66EC 800D5AEC 240AFFFF */  addiu      $t2, $zero, -1
/* D66F0 800D5AF0 8E460000 */  lw         $a2, ($s2)
.L800D5AF4:
/* D66F4 800D5AF4 26520004 */  addiu      $s2, $s2, 4
/* D66F8 800D5AF8 00003821 */  addu       $a3, $zero, $zero
/* D66FC 800D5AFC 2605FFFF */  addiu      $a1, $s0, -1
.L800D5B00:
/* D6700 800D5B00 00C92024 */  and        $a0, $a2, $t1
/* D6704 800D5B04 00063200 */  sll        $a2, $a2, 8
/* D6708 800D5B08 00042602 */  srl        $a0, $a0, 0x18
/* D670C 800D5B0C 00111602 */  srl        $v0, $s1, 0x18
/* D6710 800D5B10 00111A00 */  sll        $v1, $s1, 8
/* D6714 800D5B14 00648825 */  or         $s1, $v1, $a0
/* D6718 800D5B18 00021080 */  sll        $v0, $v0, 2
/* D671C 800D5B1C 00481021 */  addu       $v0, $v0, $t0
/* D6720 800D5B20 8C430000 */  lw         $v1, ($v0)
/* D6724 800D5B24 24E70001 */  addiu      $a3, $a3, 1
/* D6728 800D5B28 2CE20004 */  sltiu      $v0, $a3, 4
/* D672C 800D5B2C 1440FFF4 */  bnez       $v0, .L800D5B00
/* D6730 800D5B30 02238826 */   xor       $s1, $s1, $v1
/* D6734 800D5B34 00A08021 */  addu       $s0, $a1, $zero
/* D6738 800D5B38 560AFFEE */  bnel       $s0, $t2, .L800D5AF4
/* D673C 800D5B3C 8E460000 */   lw        $a2, ($s2)
/* D6740 800D5B40 02201021 */  addu       $v0, $s1, $zero
.L800D5B44:
/* D6744 800D5B44 8FBF0020 */  lw         $ra, 0x20($sp)
/* D6748 800D5B48 8FB3001C */  lw         $s3, 0x1c($sp)
/* D674C 800D5B4C 8FB20018 */  lw         $s2, 0x18($sp)
/* D6750 800D5B50 8FB10014 */  lw         $s1, 0x14($sp)
/* D6754 800D5B54 8FB00010 */  lw         $s0, 0x10($sp)
/* D6758 800D5B58 03E00008 */  jr         $ra
/* D675C 800D5B5C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800D5B60
/* D6760 800D5B60 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D6764 800D5B64 00051082 */  srl        $v0, $a1, 2
/* D6768 800D5B68 00021080 */  sll        $v0, $v0, 2
/* D676C 800D5B6C 2442FFFC */  addiu      $v0, $v0, -4
/* D6770 800D5B70 00821021 */  addu       $v0, $a0, $v0
/* D6774 800D5B74 AFBF0010 */  sw         $ra, 0x10($sp)
/* D6778 800D5B78 8C430000 */  lw         $v1, ($v0)
/* D677C 800D5B7C 2463FFF8 */  addiu      $v1, $v1, -8
/* D6780 800D5B80 0C03569C */  jal        CalculateCheckSum32
/* D6784 800D5B84 AC430000 */   sw        $v1, ($v0)
/* D6788 800D5B88 8FBF0010 */  lw         $ra, 0x10($sp)
/* D678C 800D5B8C 2C420001 */  sltiu      $v0, $v0, 1
/* D6790 800D5B90 03E00008 */  jr         $ra
/* D6794 800D5B94 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800D5B98
/* D6798 800D5B98 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D679C 800D5B9C AFB00010 */  sw         $s0, 0x10($sp)
/* D67A0 800D5BA0 00058082 */  srl        $s0, $a1, 2
/* D67A4 800D5BA4 00108080 */  sll        $s0, $s0, 2
/* D67A8 800D5BA8 2610FFFC */  addiu      $s0, $s0, -4
/* D67AC 800D5BAC 00908021 */  addu       $s0, $a0, $s0
/* D67B0 800D5BB0 AFBF0014 */  sw         $ra, 0x14($sp)
/* D67B4 800D5BB4 0C03569C */  jal        CalculateCheckSum32
/* D67B8 800D5BB8 AE000000 */   sw        $zero, ($s0)
/* D67BC 800D5BBC 8FBF0014 */  lw         $ra, 0x14($sp)
/* D67C0 800D5BC0 24420008 */  addiu      $v0, $v0, 8
/* D67C4 800D5BC4 AE020000 */  sw         $v0, ($s0)
/* D67C8 800D5BC8 8FB00010 */  lw         $s0, 0x10($sp)
/* D67CC 800D5BCC 03E00008 */  jr         $ra
/* D67D0 800D5BD0 27BD0018 */   addiu     $sp, $sp, 0x18
/* D67D4 800D5BD4 00000000 */  nop
/* D67D8 800D5BD8 00000000 */  nop
/* D67DC 800D5BDC 00000000 */  nop
