.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_ranger_float
/* 1C590 8001B990 3C02800E */  lui        $v0, %hi(partyPointer)
/* 1C594 8001B994 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 1C598 8001B998 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1C59C 8001B99C AFBF0010 */  sw         $ra, 0x10($sp)
/* 1C5A0 8001B9A0 0C020607 */  jal        ranger_int_float
/* 1C5A4 8001B9A4 00000000 */   nop
/* 1C5A8 8001B9A8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1C5AC 8001B9AC 3C02800F */  lui        $v0, %hi(RangerIngredientFloat)
/* 1C5B0 8001B9B0 E4408F00 */  swc1       $f0, %lo(RangerIngredientFloat)($v0)
/* 1C5B4 8001B9B4 03E00008 */  jr         $ra
/* 1C5B8 8001B9B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001B9BC
/* 1C5BC 8001B9BC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1C5C0 8001B9C0 AFB10014 */  sw         $s1, 0x14($sp)
/* 1C5C4 8001B9C4 00808821 */  addu       $s1, $a0, $zero
/* 1C5C8 8001B9C8 24040001 */  addiu      $a0, $zero, 1
/* 1C5CC 8001B9CC AFB20018 */  sw         $s2, 0x18($sp)
/* 1C5D0 8001B9D0 00A09021 */  addu       $s2, $a1, $zero
/* 1C5D4 8001B9D4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1C5D8 8001B9D8 0C00CC45 */  jal        gamestate_cheat_check1
/* 1C5DC 8001B9DC AFB00010 */   sw        $s0, 0x10($sp)
/* 1C5E0 8001B9E0 50400005 */  beql       $v0, $zero, .L8001B9F8
/* 1C5E4 8001B9E4 96220014 */   lhu       $v0, 0x14($s1)
/* 1C5E8 8001B9E8 0C00CC50 */  jal        gamestate_cheat_check2
/* 1C5EC 8001B9EC 24040001 */   addiu     $a0, $zero, 1
/* 1C5F0 8001B9F0 08006E91 */  j          .L8001BA44
/* 1C5F4 8001B9F4 8FBF001C */   lw        $ra, 0x1c($sp)
.L8001B9F8:
/* 1C5F8 8001B9F8 96240020 */  lhu        $a0, 0x20($s1)
/* 1C5FC 8001B9FC 000211C2 */  srl        $v0, $v0, 7
/* 1C600 8001BA00 1080000A */  beqz       $a0, .L8001BA2C
/* 1C604 8001BA04 30500001 */   andi      $s0, $v0, 1
/* 1C608 8001BA08 24020001 */  addiu      $v0, $zero, 1
/* 1C60C 8001BA0C 14820003 */  bne        $a0, $v0, .L8001BA1C
/* 1C610 8001BA10 00000000 */   nop
/* 1C614 8001BA14 08006E8B */  j          .L8001BA2C
/* 1C618 8001BA18 2E100001 */   sltiu     $s0, $s0, 1
.L8001BA1C:
/* 1C61C 8001BA1C 0C009168 */  jal        get_event_flag
/* 1C620 8001BA20 00000000 */   nop
/* 1C624 8001BA24 00501026 */  xor        $v0, $v0, $s0
/* 1C628 8001BA28 3050FFFF */  andi       $s0, $v0, 0xffff
.L8001BA2C:
/* 1C62C 8001BA2C 02202021 */  addu       $a0, $s1, $zero
/* 1C630 8001BA30 0C004E5C */  jal        run_voxelFuncs2
/* 1C634 8001BA34 02402821 */   addu      $a1, $s2, $zero
/* 1C638 8001BA38 00501024 */  and        $v0, $v0, $s0
/* 1C63C 8001BA3C 304200FF */  andi       $v0, $v0, 0xff
/* 1C640 8001BA40 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001BA44:
/* 1C644 8001BA44 8FB20018 */  lw         $s2, 0x18($sp)
/* 1C648 8001BA48 8FB10014 */  lw         $s1, 0x14($sp)
/* 1C64C 8001BA4C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1C650 8001BA50 03E00008 */  jr         $ra
/* 1C654 8001BA54 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_refObj_flag
/* 1C658 8001BA58 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1C65C 8001BA5C AFBF0010 */  sw         $ra, 0x10($sp)
/* 1C660 8001BA60 94850014 */  lhu        $a1, 0x14($a0)
/* 1C664 8001BA64 9484001E */  lhu        $a0, 0x1e($a0)
/* 1C668 8001BA68 00052A42 */  srl        $a1, $a1, 9
/* 1C66C 8001BA6C 30A50001 */  andi       $a1, $a1, 1
/* 1C670 8001BA70 0C00918D */  jal        setEventFlag
/* 1C674 8001BA74 38A50001 */   xori      $a1, $a1, 1
/* 1C678 8001BA78 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1C67C 8001BA7C 03E00008 */  jr         $ra
/* 1C680 8001BA80 27BD0018 */   addiu     $sp, $sp, 0x18

glabel render_ref_objs
/* 1C684 8001BA84 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 1C688 8001BA88 AFB30024 */  sw         $s3, 0x24($sp)
/* 1C68C 8001BA8C 00809821 */  addu       $s3, $a0, $zero
/* 1C690 8001BA90 AFB60030 */  sw         $s6, 0x30($sp)
/* 1C694 8001BA94 30B600FF */  andi       $s6, $a1, 0xff
/* 1C698 8001BA98 AFBF0034 */  sw         $ra, 0x34($sp)
/* 1C69C 8001BA9C AFB5002C */  sw         $s5, 0x2c($sp)
/* 1C6A0 8001BAA0 AFB40028 */  sw         $s4, 0x28($sp)
/* 1C6A4 8001BAA4 AFB20020 */  sw         $s2, 0x20($sp)
/* 1C6A8 8001BAA8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 1C6AC 8001BAAC 0C006E64 */  jal        set_ranger_float
/* 1C6B0 8001BAB0 AFB00018 */   sw        $s0, 0x18($sp)
/* 1C6B4 8001BAB4 00009021 */  addu       $s2, $zero, $zero
/* 1C6B8 8001BAB8 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 1C6BC 8001BABC 96630028 */  lhu        $v1, 0x28($s3)
/* 1C6C0 8001BAC0 1060004E */  beqz       $v1, .L8001BBFC
/* 1C6C4 8001BAC4 24546988 */   addiu     $s4, $v0, %lo(zoneDatMatrix)
/* 1C6C8 8001BAC8 3C15800E */  lui        $s5, 0x800e
/* 1C6CC 8001BACC 24040001 */  addiu      $a0, $zero, 1
.L8001BAD0:
/* 1C6D0 8001BAD0 001210C0 */  sll        $v0, $s2, 3
/* 1C6D4 8001BAD4 00521023 */  subu       $v0, $v0, $s2
/* 1C6D8 8001BAD8 00021080 */  sll        $v0, $v0, 2
/* 1C6DC 8001BADC 00521023 */  subu       $v0, $v0, $s2
/* 1C6E0 8001BAE0 8E630044 */  lw         $v1, 0x44($s3)
/* 1C6E4 8001BAE4 00021080 */  sll        $v0, $v0, 2
/* 1C6E8 8001BAE8 0C00CC45 */  jal        gamestate_cheat_check1
/* 1C6EC 8001BAEC 00628821 */   addu      $s1, $v1, $v0
/* 1C6F0 8001BAF0 10400012 */  beqz       $v0, .L8001BB3C
/* 1C6F4 8001BAF4 3C02800F */   lui       $v0, 0x800f
/* 1C6F8 8001BAF8 0C00CC50 */  jal        gamestate_cheat_check2
/* 1C6FC 8001BAFC 24040001 */   addiu     $a0, $zero, 1
/* 1C700 8001BB00 96A366C4 */  lhu        $v1, 0x66c4($s5)
/* 1C704 8001BB04 14600004 */  bnez       $v1, .L8001BB18
/* 1C708 8001BB08 0002802B */   sltu      $s0, $zero, $v0
/* 1C70C 8001BB0C 96220014 */  lhu        $v0, 0x14($s1)
/* 1C710 8001BB10 08006EC8 */  j          .L8001BB20
/* 1C714 8001BB14 30420040 */   andi      $v0, $v0, 0x40
.L8001BB18:
/* 1C718 8001BB18 96220014 */  lhu        $v0, 0x14($s1)
/* 1C71C 8001BB1C 30420020 */  andi       $v0, $v0, 0x20
.L8001BB20:
/* 1C720 8001BB20 54400001 */  bnel       $v0, $zero, .L8001BB28
/* 1C724 8001BB24 00008021 */   addu      $s0, $zero, $zero
.L8001BB28:
/* 1C728 8001BB28 02202021 */  addu       $a0, $s1, $zero
/* 1C72C 8001BB2C 0C006F1B */  jal        set_voxel_visibility
/* 1C730 8001BB30 02002821 */   addu      $a1, $s0, $zero
/* 1C734 8001BB34 08006EFA */  j          .L8001BBE8
/* 1C738 8001BB38 26430001 */   addiu     $v1, $s2, 1
.L8001BB3C:
/* 1C73C 8001BB3C 8C438F08 */  lw         $v1, -0x70f8($v0)
/* 1C740 8001BB40 1060000C */  beqz       $v1, .L8001BB74
/* 1C744 8001BB44 24020007 */   addiu     $v0, $zero, 7
/* 1C748 8001BB48 96230016 */  lhu        $v1, 0x16($s1)
/* 1C74C 8001BB4C 14620005 */  bne        $v1, $v0, .L8001BB64
/* 1C750 8001BB50 02202021 */   addu      $a0, $s1, $zero
/* 1C754 8001BB54 0C006F1B */  jal        set_voxel_visibility
/* 1C758 8001BB58 24050001 */   addiu     $a1, $zero, 1
/* 1C75C 8001BB5C 08006EFA */  j          .L8001BBE8
/* 1C760 8001BB60 26430001 */   addiu     $v1, $s2, 1
.L8001BB64:
/* 1C764 8001BB64 0C006F1B */  jal        set_voxel_visibility
/* 1C768 8001BB68 00002821 */   addu      $a1, $zero, $zero
/* 1C76C 8001BB6C 08006EFA */  j          .L8001BBE8
/* 1C770 8001BB70 26430001 */   addiu     $v1, $s2, 1
.L8001BB74:
/* 1C774 8001BB74 02202021 */  addu       $a0, $s1, $zero
/* 1C778 8001BB78 0C004E5C */  jal        run_voxelFuncs2
/* 1C77C 8001BB7C 02602821 */   addu      $a1, $s3, $zero
/* 1C780 8001BB80 96A366C4 */  lhu        $v1, 0x66c4($s5)
/* 1C784 8001BB84 14600004 */  bnez       $v1, .L8001BB98
/* 1C788 8001BB88 0002802B */   sltu      $s0, $zero, $v0
/* 1C78C 8001BB8C 96220014 */  lhu        $v0, 0x14($s1)
/* 1C790 8001BB90 08006EE8 */  j          .L8001BBA0
/* 1C794 8001BB94 30420040 */   andi      $v0, $v0, 0x40
.L8001BB98:
/* 1C798 8001BB98 96220014 */  lhu        $v0, 0x14($s1)
/* 1C79C 8001BB9C 30420020 */  andi       $v0, $v0, 0x20
.L8001BBA0:
/* 1C7A0 8001BBA0 54400001 */  bnel       $v0, $zero, .L8001BBA8
/* 1C7A4 8001BBA4 00008021 */   addu      $s0, $zero, $zero
.L8001BBA8:
/* 1C7A8 8001BBA8 96220016 */  lhu        $v0, 0x16($s1)
/* 1C7AC 8001BBAC 1440000B */  bnez       $v0, .L8001BBDC
/* 1C7B0 8001BBB0 02202021 */   addu      $a0, $s1, $zero
/* 1C7B4 8001BBB4 928502AD */  lbu        $a1, 0x2ad($s4)
/* 1C7B8 8001BBB8 AFB60010 */  sw         $s6, 0x10($sp)
/* 1C7BC 8001BBBC AFA00014 */  sw         $zero, 0x14($sp)
/* 1C7C0 8001BBC0 92860293 */  lbu        $a2, 0x293($s4)
/* 1C7C4 8001BBC4 92870295 */  lbu        $a3, 0x295($s4)
/* 1C7C8 8001BBC8 0C017F2E */  jal        some_ref_obj_lookup_func
/* 1C7CC 8001BBCC 02402021 */   addu      $a0, $s2, $zero
/* 1C7D0 8001BBD0 54400001 */  bnel       $v0, $zero, .L8001BBD8
/* 1C7D4 8001BBD4 00008021 */   addu      $s0, $zero, $zero
.L8001BBD8:
/* 1C7D8 8001BBD8 02202021 */  addu       $a0, $s1, $zero
.L8001BBDC:
/* 1C7DC 8001BBDC 0C006F1B */  jal        set_voxel_visibility
/* 1C7E0 8001BBE0 02002821 */   addu      $a1, $s0, $zero
/* 1C7E4 8001BBE4 26430001 */  addiu      $v1, $s2, 1
.L8001BBE8:
/* 1C7E8 8001BBE8 96620028 */  lhu        $v0, 0x28($s3)
/* 1C7EC 8001BBEC 3072FFFF */  andi       $s2, $v1, 0xffff
/* 1C7F0 8001BBF0 0242102B */  sltu       $v0, $s2, $v0
/* 1C7F4 8001BBF4 1440FFB6 */  bnez       $v0, .L8001BAD0
/* 1C7F8 8001BBF8 24040001 */   addiu     $a0, $zero, 1
.L8001BBFC:
/* 1C7FC 8001BBFC 96620028 */  lhu        $v0, 0x28($s3)
/* 1C800 8001BC00 10400010 */  beqz       $v0, .L8001BC44
/* 1C804 8001BC04 00009021 */   addu      $s2, $zero, $zero
/* 1C808 8001BC08 02602821 */  addu       $a1, $s3, $zero
.L8001BC0C:
/* 1C80C 8001BC0C 001220C0 */  sll        $a0, $s2, 3
/* 1C810 8001BC10 00922023 */  subu       $a0, $a0, $s2
/* 1C814 8001BC14 00042080 */  sll        $a0, $a0, 2
/* 1C818 8001BC18 00922023 */  subu       $a0, $a0, $s2
/* 1C81C 8001BC1C 8E620044 */  lw         $v0, 0x44($s3)
/* 1C820 8001BC20 00042080 */  sll        $a0, $a0, 2
/* 1C824 8001BC24 0C005390 */  jal        render_container
/* 1C828 8001BC28 00442021 */   addu      $a0, $v0, $a0
/* 1C82C 8001BC2C 26430001 */  addiu      $v1, $s2, 1
/* 1C830 8001BC30 96620028 */  lhu        $v0, 0x28($s3)
/* 1C834 8001BC34 3072FFFF */  andi       $s2, $v1, 0xffff
/* 1C838 8001BC38 0242102B */  sltu       $v0, $s2, $v0
/* 1C83C 8001BC3C 1440FFF3 */  bnez       $v0, .L8001BC0C
/* 1C840 8001BC40 02602821 */   addu      $a1, $s3, $zero
.L8001BC44:
/* 1C844 8001BC44 8FBF0034 */  lw         $ra, 0x34($sp)
/* 1C848 8001BC48 8FB60030 */  lw         $s6, 0x30($sp)
/* 1C84C 8001BC4C 8FB5002C */  lw         $s5, 0x2c($sp)
/* 1C850 8001BC50 8FB40028 */  lw         $s4, 0x28($sp)
/* 1C854 8001BC54 8FB30024 */  lw         $s3, 0x24($sp)
/* 1C858 8001BC58 8FB20020 */  lw         $s2, 0x20($sp)
/* 1C85C 8001BC5C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 1C860 8001BC60 8FB00018 */  lw         $s0, 0x18($sp)
/* 1C864 8001BC64 03E00008 */  jr         $ra
/* 1C868 8001BC68 27BD0038 */   addiu     $sp, $sp, 0x38

glabel set_voxel_visibility
/* 1C86C 8001BC6C 14A00004 */  bnez       $a1, .L8001BC80
/* 1C870 8001BC70 94820014 */   lhu       $v0, 0x14($a0)
/* 1C874 8001BC74 30427FFF */  andi       $v0, $v0, 0x7fff
/* 1C878 8001BC78 03E00008 */  jr         $ra
/* 1C87C 8001BC7C A4820014 */   sh        $v0, 0x14($a0)
.L8001BC80:
/* 1C880 8001BC80 34428000 */  ori        $v0, $v0, 0x8000
/* 1C884 8001BC84 03E00008 */  jr         $ra
/* 1C888 8001BC88 A4820014 */   sh        $v0, 0x14($a0)
/* 1C88C 8001BC8C 00000000 */  nop
