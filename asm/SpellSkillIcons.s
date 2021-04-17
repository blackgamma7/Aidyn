.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel get_spell_icon
/* 4D640 8004CA40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4D644 8004CA44 00003021 */  addu       $a2, $zero, $zero
/* 4D648 8004CA48 AFB00010 */  sw         $s0, 0x10($sp)
/* 4D64C 8004CA4C 00A08021 */  addu       $s0, $a1, $zero
/* 4D650 8004CA50 3085FFFF */  andi       $a1, $a0, 0xffff
/* 4D654 8004CA54 00051A02 */  srl        $v1, $a1, 8
/* 4D658 8004CA58 24020003 */  addiu      $v0, $zero, 3
/* 4D65C 8004CA5C 14620005 */  bne        $v1, $v0, .L8004CA74
/* 4D660 8004CA60 AFBF0014 */   sw        $ra, 0x14($sp)
/* 4D664 8004CA64 3C02800F */  lui        $v0, %hi(spell_pointer)
/* 4D668 8004CA68 0C01DB38 */  jal        get_spell_icon_id
/* 4D66C 8004CA6C 8C4416A0 */   lw        $a0, %lo(spell_pointer)($v0)
/* 4D670 8004CA70 00403021 */  addu       $a2, $v0, $zero
.L8004CA74:
/* 4D674 8004CA74 3C03800F */  lui        $v1, %hi(iconDictSpellSymbolSize)
/* 4D678 8004CA78 8C62DB60 */  lw         $v0, %lo(iconDictSpellSymbolSize)($v1)
/* 4D67C 8004CA7C 1040000F */  beqz       $v0, .L8004CABC
/* 4D680 8004CA80 00002021 */   addu      $a0, $zero, $zero
/* 4D684 8004CA84 00602821 */  addu       $a1, $v1, $zero
/* 4D688 8004CA88 3C02800F */  lui        $v0, %hi(iconDictSpellSymbol)
/* 4D68C 8004CA8C 2443DB3C */  addiu      $v1, $v0, %lo(iconDictSpellSymbol)
.L8004CA90:
/* 4D690 8004CA90 94620000 */  lhu        $v0, ($v1)
/* 4D694 8004CA94 14C20005 */  bne        $a2, $v0, .L8004CAAC
/* 4D698 8004CA98 8CA2DB60 */   lw        $v0, -0x24a0($a1)
/* 4D69C 8004CA9C 94630002 */  lhu        $v1, 2($v1)
/* 4D6A0 8004CAA0 24020001 */  addiu      $v0, $zero, 1
/* 4D6A4 8004CAA4 080132B0 */  j          .L8004CAC0
/* 4D6A8 8004CAA8 AE030000 */   sw        $v1, ($s0)
.L8004CAAC:
/* 4D6AC 8004CAAC 24840001 */  addiu      $a0, $a0, 1
/* 4D6B0 8004CAB0 0082102B */  sltu       $v0, $a0, $v0
/* 4D6B4 8004CAB4 1440FFF6 */  bnez       $v0, .L8004CA90
/* 4D6B8 8004CAB8 24630004 */   addiu     $v1, $v1, 4
.L8004CABC:
/* 4D6BC 8004CABC 00001021 */  addu       $v0, $zero, $zero
.L8004CAC0:
/* 4D6C0 8004CAC0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4D6C4 8004CAC4 8FB00010 */  lw         $s0, 0x10($sp)
/* 4D6C8 8004CAC8 03E00008 */  jr         $ra
/* 4D6CC 8004CACC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_spell_icons
/* 4D6D0 8004CAD0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4D6D4 8004CAD4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4D6D8 8004CAD8 3090FFFF */  andi       $s0, $a0, 0xffff
/* 4D6DC 8004CADC 02002021 */  addu       $a0, $s0, $zero
/* 4D6E0 8004CAE0 AFB10014 */  sw         $s1, 0x14($sp)
/* 4D6E4 8004CAE4 00A08821 */  addu       $s1, $a1, $zero
/* 4D6E8 8004CAE8 00002821 */  addu       $a1, $zero, $zero
/* 4D6EC 8004CAEC AFB20018 */  sw         $s2, 0x18($sp)
/* 4D6F0 8004CAF0 00C09021 */  addu       $s2, $a2, $zero
/* 4D6F4 8004CAF4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4D6F8 8004CAF8 00E09821 */  addu       $s3, $a3, $zero
/* 4D6FC 8004CAFC AFBF0020 */  sw         $ra, 0x20($sp)
/* 4D700 8004CB00 0C01D77A */  jal        GetIDIndex
/* 4D704 8004CB04 00003021 */   addu      $a2, $zero, $zero
/* 4D708 8004CB08 00403021 */  addu       $a2, $v0, $zero
/* 4D70C 8004CB0C 3C05800F */  lui        $a1, %hi(spell_pointer)
/* 4D710 8004CB10 00061080 */  sll        $v0, $a2, 2
/* 4D714 8004CB14 00461021 */  addu       $v0, $v0, $a2
/* 4D718 8004CB18 00021080 */  sll        $v0, $v0, 2
/* 4D71C 8004CB1C 8CA316A0 */  lw         $v1, %lo(spell_pointer)($a1)
/* 4D720 8004CB20 00461023 */  subu       $v0, $v0, $a2
/* 4D724 8004CB24 8C640010 */  lw         $a0, 0x10($v1)
/* 4D728 8004CB28 00021040 */  sll        $v0, $v0, 1
/* 4D72C 8004CB2C 00441021 */  addu       $v0, $v0, $a0
/* 4D730 8004CB30 90440021 */  lbu        $a0, 0x21($v0)
/* 4D734 8004CB34 24030003 */  addiu      $v1, $zero, 3
/* 4D738 8004CB38 14830003 */  bne        $a0, $v1, .L8004CB48
/* 4D73C 8004CB3C 24020004 */   addiu     $v0, $zero, 4
/* 4D740 8004CB40 080132D5 */  j          .L8004CB54
/* 4D744 8004CB44 240201A4 */   addiu     $v0, $zero, 0x1a4
.L8004CB48:
/* 4D748 8004CB48 14820004 */  bne        $a0, $v0, .L8004CB5C
/* 4D74C 8004CB4C 00061080 */   sll       $v0, $a2, 2
/* 4D750 8004CB50 240201A3 */  addiu      $v0, $zero, 0x1a3
.L8004CB54:
/* 4D754 8004CB54 AE220000 */  sw         $v0, ($s1)
/* 4D758 8004CB58 00061080 */  sll        $v0, $a2, 2
.L8004CB5C:
/* 4D75C 8004CB5C 00461021 */  addu       $v0, $v0, $a2
/* 4D760 8004CB60 00021080 */  sll        $v0, $v0, 2
/* 4D764 8004CB64 8CA316A0 */  lw         $v1, 0x16a0($a1)
/* 4D768 8004CB68 00461023 */  subu       $v0, $v0, $a2
/* 4D76C 8004CB6C 8C640010 */  lw         $a0, 0x10($v1)
/* 4D770 8004CB70 00021040 */  sll        $v0, $v0, 1
/* 4D774 8004CB74 00441021 */  addu       $v0, $v0, $a0
/* 4D778 8004CB78 9044001A */  lbu        $a0, 0x1a($v0)
/* 4D77C 8004CB7C 0C013276 */  jal        get_school_icon
/* 4D780 8004CB80 02402821 */   addu      $a1, $s2, $zero
/* 4D784 8004CB84 10400005 */  beqz       $v0, .L8004CB9C
/* 4D788 8004CB88 02002021 */   addu      $a0, $s0, $zero
/* 4D78C 8004CB8C 0C013290 */  jal        get_spell_icon
/* 4D790 8004CB90 02602821 */   addu      $a1, $s3, $zero
/* 4D794 8004CB94 080132E8 */  j          .L8004CBA0
/* 4D798 8004CB98 0002102B */   sltu      $v0, $zero, $v0
.L8004CB9C:
/* 4D79C 8004CB9C 00001021 */  addu       $v0, $zero, $zero
.L8004CBA0:
/* 4D7A0 8004CBA0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 4D7A4 8004CBA4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4D7A8 8004CBA8 8FB20018 */  lw         $s2, 0x18($sp)
/* 4D7AC 8004CBAC 8FB10014 */  lw         $s1, 0x14($sp)
/* 4D7B0 8004CBB0 8FB00010 */  lw         $s0, 0x10($sp)
/* 4D7B4 8004CBB4 03E00008 */  jr         $ra
/* 4D7B8 8004CBB8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_skill_icon
/* 4D7BC 8004CBBC 00003821 */  addu       $a3, $zero, $zero
/* 4D7C0 8004CBC0 3C03800F */  lui        $v1, %hi(skillIconCount)
/* 4D7C4 8004CBC4 8C62DB0C */  lw         $v0, %lo(skillIconCount)($v1)
/* 4D7C8 8004CBC8 10400014 */  beqz       $v0, .L8004CC1C
/* 4D7CC 8004CBCC 3084FFFF */   andi      $a0, $a0, 0xffff
/* 4D7D0 8004CBD0 3C02800F */  lui        $v0, %hi(skillIconArray)
/* 4D7D4 8004CBD4 2448DADC */  addiu      $t0, $v0, %lo(skillIconArray)
/* 4D7D8 8004CBD8 250A0002 */  addiu      $t2, $t0, 2
/* 4D7DC 8004CBDC 00604821 */  addu       $t1, $v1, $zero
/* 4D7E0 8004CBE0 00073080 */  sll        $a2, $a3, 2
.L8004CBE4:
/* 4D7E4 8004CBE4 00C81021 */  addu       $v0, $a2, $t0
/* 4D7E8 8004CBE8 94430000 */  lhu        $v1, ($v0)
/* 4D7EC 8004CBEC 14830006 */  bne        $a0, $v1, .L8004CC08
/* 4D7F0 8004CBF0 24E30001 */   addiu     $v1, $a3, 1
/* 4D7F4 8004CBF4 00CA1021 */  addu       $v0, $a2, $t2
/* 4D7F8 8004CBF8 94430000 */  lhu        $v1, ($v0)
/* 4D7FC 8004CBFC 24020001 */  addiu      $v0, $zero, 1
/* 4D800 8004CC00 03E00008 */  jr         $ra
/* 4D804 8004CC04 ACA30000 */   sw        $v1, ($a1)
.L8004CC08:
/* 4D808 8004CC08 8D22DB0C */  lw         $v0, -0x24f4($t1)
/* 4D80C 8004CC0C 3067FFFF */  andi       $a3, $v1, 0xffff
/* 4D810 8004CC10 00E2102B */  sltu       $v0, $a3, $v0
/* 4D814 8004CC14 1440FFF3 */  bnez       $v0, .L8004CBE4
/* 4D818 8004CC18 00073080 */   sll       $a2, $a3, 2
.L8004CC1C:
/* 4D81C 8004CC1C 03E00008 */  jr         $ra
/* 4D820 8004CC20 00001021 */   addu      $v0, $zero, $zero
/* 4D824 8004CC24 00000000 */  nop
/* 4D828 8004CC28 00000000 */  nop
/* 4D82C 8004CC2C 00000000 */  nop
