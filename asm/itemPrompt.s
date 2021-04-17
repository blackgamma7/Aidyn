.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel first_item_spell_prompt
/* 3CFE0 8003C3E0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 3CFE4 8003C3E4 AFB40028 */  sw         $s4, 0x28($sp)
/* 3CFE8 8003C3E8 93B40053 */  lbu        $s4, 0x53($sp)
/* 3CFEC 8003C3EC AFB60030 */  sw         $s6, 0x30($sp)
/* 3CFF0 8003C3F0 93B60057 */  lbu        $s6, 0x57($sp)
/* 3CFF4 8003C3F4 AFB70034 */  sw         $s7, 0x34($sp)
/* 3CFF8 8003C3F8 93B7005B */  lbu        $s7, 0x5b($sp)
/* 3CFFC 8003C3FC AFB20020 */  sw         $s2, 0x20($sp)
/* 3D000 8003C400 00809021 */  addu       $s2, $a0, $zero
/* 3D004 8003C404 AFB5002C */  sw         $s5, 0x2c($sp)
/* 3D008 8003C408 93B5005F */  lbu        $s5, 0x5f($sp)
/* 3D00C 8003C40C AFB30024 */  sw         $s3, 0x24($sp)
/* 3D010 8003C410 00A09821 */  addu       $s3, $a1, $zero
/* 3D014 8003C414 AFB1001C */  sw         $s1, 0x1c($sp)
/* 3D018 8003C418 00C08821 */  addu       $s1, $a2, $zero
/* 3D01C 8003C41C AFBE0038 */  sw         $fp, 0x38($sp)
/* 3D020 8003C420 00E0F021 */  addu       $fp, $a3, $zero
/* 3D024 8003C424 AFBF003C */  sw         $ra, 0x3c($sp)
/* 3D028 8003C428 0C02E658 */  jal        widget_menu_build
/* 3D02C 8003C42C AFB00018 */   sw        $s0, 0x18($sp)
/* 3D030 8003C430 02402021 */  addu       $a0, $s2, $zero
/* 3D034 8003C434 3C02800E */  lui        $v0, %hi(widget_methods_firstSpell)
/* 3D038 8003C438 2442C100 */  addiu      $v0, $v0, %lo(widget_methods_firstSpell)
/* 3D03C 8003C43C 0C00EB79 */  jal        widget_left_side_of_pause_menu
/* 3D040 8003C440 AE420078 */   sw        $v0, 0x78($s2)
/* 3D044 8003C444 0C026259 */  jal        passToMalloc
/* 3D048 8003C448 2404007C */   addiu     $a0, $zero, 0x7c
/* 3D04C 8003C44C 02602021 */  addu       $a0, $s3, $zero
/* 3D050 8003C450 0C03353E */  jal        strlen
/* 3D054 8003C454 00408021 */   addu      $s0, $v0, $zero
/* 3D058 8003C458 02002021 */  addu       $a0, $s0, $zero
/* 3D05C 8003C45C 02602821 */  addu       $a1, $s3, $zero
/* 3D060 8003C460 24420001 */  addiu      $v0, $v0, 1
/* 3D064 8003C464 0C02DFC8 */  jal        widgetcliptext_init
/* 3D068 8003C468 3046FFFF */   andi      $a2, $v0, 0xffff
/* 3D06C 8003C46C 00408021 */  addu       $s0, $v0, $zero
/* 3D070 8003C470 8E030078 */  lw         $v1, 0x78($s0)
/* 3D074 8003C474 02802821 */  addu       $a1, $s4, $zero
/* 3D078 8003C478 02C03021 */  addu       $a2, $s6, $zero
/* 3D07C 8003C47C 84640048 */  lh         $a0, 0x48($v1)
/* 3D080 8003C480 02E03821 */  addu       $a3, $s7, $zero
/* 3D084 8003C484 AFB50010 */  sw         $s5, 0x10($sp)
/* 3D088 8003C488 8C62004C */  lw         $v0, 0x4c($v1)
/* 3D08C 8003C48C 0040F809 */  jalr       $v0
/* 3D090 8003C490 02042021 */   addu      $a0, $s0, $a0
/* 3D094 8003C494 02002021 */  addu       $a0, $s0, $zero
/* 3D098 8003C498 02202821 */  addu       $a1, $s1, $zero
/* 3D09C 8003C49C 0C02DD3F */  jal        set_widget_coords
/* 3D0A0 8003C4A0 03C03021 */   addu      $a2, $fp, $zero
/* 3D0A4 8003C4A4 02002021 */  addu       $a0, $s0, $zero
/* 3D0A8 8003C4A8 00118C00 */  sll        $s1, $s1, 0x10
/* 3D0AC 8003C4AC 00112C03 */  sra        $a1, $s1, 0x10
/* 3D0B0 8003C4B0 0C02EF52 */  jal        func_800BBD48
/* 3D0B4 8003C4B4 24060095 */   addiu     $a2, $zero, 0x95
/* 3D0B8 8003C4B8 02402021 */  addu       $a0, $s2, $zero
/* 3D0BC 8003C4BC 0C02DEDC */  jal        link_widgets
/* 3D0C0 8003C4C0 02002821 */   addu      $a1, $s0, $zero
/* 3D0C4 8003C4C4 02401021 */  addu       $v0, $s2, $zero
/* 3D0C8 8003C4C8 8FBF003C */  lw         $ra, 0x3c($sp)
/* 3D0CC 8003C4CC 8FBE0038 */  lw         $fp, 0x38($sp)
/* 3D0D0 8003C4D0 8FB70034 */  lw         $s7, 0x34($sp)
/* 3D0D4 8003C4D4 8FB60030 */  lw         $s6, 0x30($sp)
/* 3D0D8 8003C4D8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 3D0DC 8003C4DC 8FB40028 */  lw         $s4, 0x28($sp)
/* 3D0E0 8003C4E0 8FB30024 */  lw         $s3, 0x24($sp)
/* 3D0E4 8003C4E4 8FB20020 */  lw         $s2, 0x20($sp)
/* 3D0E8 8003C4E8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 3D0EC 8003C4EC 8FB00018 */  lw         $s0, 0x18($sp)
/* 3D0F0 8003C4F0 03E00008 */  jr         $ra
/* 3D0F4 8003C4F4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8003C4F8
/* 3D0F8 8003C4F8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D0FC 8003C4FC AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D100 8003C500 0C00F153 */  jal        func_8003C54C
/* 3D104 8003C504 00000000 */   nop
/* 3D108 8003C508 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D10C 8003C50C 03E00008 */  jr         $ra
/* 3D110 8003C510 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C514
/* 3D114 8003C514 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D118 8003C518 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D11C 8003C51C 0C00F153 */  jal        func_8003C54C
/* 3D120 8003C520 00000000 */   nop
/* 3D124 8003C524 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D128 8003C528 03E00008 */  jr         $ra
/* 3D12C 8003C52C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C530
/* 3D130 8003C530 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D134 8003C534 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D138 8003C538 0C00F153 */  jal        func_8003C54C
/* 3D13C 8003C53C 00000000 */   nop
/* 3D140 8003C540 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D144 8003C544 03E00008 */  jr         $ra
/* 3D148 8003C548 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C54C
/* 3D14C 8003C54C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D150 8003C550 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D154 8003C554 0C02DEC8 */  jal        set_widgets_byte0x70
/* 3D158 8003C558 24050005 */   addiu     $a1, $zero, 5
/* 3D15C 8003C55C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D160 8003C560 00001021 */  addu       $v0, $zero, $zero
/* 3D164 8003C564 03E00008 */  jr         $ra
/* 3D168 8003C568 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8003C56C
/* 3D16C 8003C56C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 3D170 8003C570 AFBF0010 */  sw         $ra, 0x10($sp)
/* 3D174 8003C574 0C02E66C */  jal        widget_menu_free
/* 3D178 8003C578 00000000 */   nop
/* 3D17C 8003C57C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 3D180 8003C580 03E00008 */  jr         $ra
/* 3D184 8003C584 27BD0018 */   addiu     $sp, $sp, 0x18
/* 3D188 8003C588 00000000 */  nop
/* 3D18C 8003C58C 00000000 */  nop
