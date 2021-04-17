.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_romStrings
/* 8D680 8008CA80 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 8D684 8008CA84 AFB3006C */  sw         $s3, 0x6c($sp)
/* 8D688 8008CA88 00809821 */  addu       $s3, $a0, $zero
/* 8D68C 8008CA8C 27A40018 */  addiu      $a0, $sp, 0x18
/* 8D690 8008CA90 AFB20068 */  sw         $s2, 0x68($sp)
/* 8D694 8008CA94 00A09021 */  addu       $s2, $a1, $zero
/* 8D698 8008CA98 02602821 */  addu       $a1, $s3, $zero
/* 8D69C 8008CA9C 24060008 */  addiu      $a2, $zero, 8
/* 8D6A0 8008CAA0 24070001 */  addiu      $a3, $zero, 1
/* 8D6A4 8008CAA4 AFB00060 */  sw         $s0, 0x60($sp)
/* 8D6A8 8008CAA8 3C10800E */  lui        $s0, %hi(D_800E1800)
/* 8D6AC 8008CAAC 26101800 */  addiu      $s0, $s0, %lo(D_800E1800)
/* 8D6B0 8008CAB0 24020036 */  addiu      $v0, $zero, 0x36
/* 8D6B4 8008CAB4 AFBF0078 */  sw         $ra, 0x78($sp)
/* 8D6B8 8008CAB8 AFB50074 */  sw         $s5, 0x74($sp)
/* 8D6BC 8008CABC AFB40070 */  sw         $s4, 0x70($sp)
/* 8D6C0 8008CAC0 AFB10064 */  sw         $s1, 0x64($sp)
/* 8D6C4 8008CAC4 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D6C8 8008CAC8 0C027269 */  jal        RomCopy
/* 8D6CC 8008CACC AFA20014 */   sw        $v0, 0x14($sp)
/* 8D6D0 8008CAD0 02002821 */  addu       $a1, $s0, $zero
/* 8D6D4 8008CAD4 2406003C */  addiu      $a2, $zero, 0x3c
/* 8D6D8 8008CAD8 97A40018 */  lhu        $a0, 0x18($sp)
/* 8D6DC 8008CADC 0C025F9C */  jal        Malloc
/* 8D6E0 8008CAE0 0000A821 */   addu      $s5, $zero, $zero
/* 8D6E4 8008CAE4 02402021 */  addu       $a0, $s2, $zero
/* 8D6E8 8008CAE8 02002821 */  addu       $a1, $s0, $zero
/* 8D6EC 8008CAEC 2406003F */  addiu      $a2, $zero, 0x3f
/* 8D6F0 8008CAF0 0C025F9C */  jal        Malloc
/* 8D6F4 8008CAF4 00408821 */   addu      $s1, $v0, $zero
/* 8D6F8 8008CAF8 0040A021 */  addu       $s4, $v0, $zero
/* 8D6FC 8008CAFC 02802021 */  addu       $a0, $s4, $zero
/* 8D700 8008CB00 02602821 */  addu       $a1, $s3, $zero
/* 8D704 8008CB04 02403021 */  addu       $a2, $s2, $zero
/* 8D708 8008CB08 24070001 */  addiu      $a3, $zero, 1
/* 8D70C 8008CB0C 24020042 */  addiu      $v0, $zero, 0x42
/* 8D710 8008CB10 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D714 8008CB14 0C027269 */  jal        RomCopy
/* 8D718 8008CB18 AFA20014 */   sw        $v0, 0x14($sp)
/* 8D71C 8008CB1C 26840002 */  addiu      $a0, $s4, 2
/* 8D720 8008CB20 02402821 */  addu       $a1, $s2, $zero
/* 8D724 8008CB24 02203021 */  addu       $a2, $s1, $zero
/* 8D728 8008CB28 27A70058 */  addiu      $a3, $sp, 0x58
/* 8D72C 8008CB2C AFA00058 */  sw         $zero, 0x58($sp)
/* 8D730 8008CB30 0C02A73B */  jal        decompress_LZ01
/* 8D734 8008CB34 AFA00010 */   sw        $zero, 0x10($sp)
/* 8D738 8008CB38 02802021 */  addu       $a0, $s4, $zero
/* 8D73C 8008CB3C 02002821 */  addu       $a1, $s0, $zero
/* 8D740 8008CB40 0C02600C */  jal        Free
/* 8D744 8008CB44 2406004A */   addiu     $a2, $zero, 0x4a
/* 8D748 8008CB48 26340002 */  addiu      $s4, $s1, 2
/* 8D74C 8008CB4C 02002821 */  addu       $a1, $s0, $zero
/* 8D750 8008CB50 96220000 */  lhu        $v0, ($s1)
/* 8D754 8008CB54 24060055 */  addiu      $a2, $zero, 0x55
/* 8D758 8008CB58 00022080 */  sll        $a0, $v0, 2
/* 8D75C 8008CB5C 0C025F9C */  jal        Malloc
/* 8D760 8008CB60 AFA20058 */   sw        $v0, 0x58($sp)
/* 8D764 8008CB64 8FA30058 */  lw         $v1, 0x58($sp)
/* 8D768 8008CB68 10600014 */  beqz       $v1, .L8008CBBC
/* 8D76C 8008CB6C 00409021 */   addu      $s2, $v0, $zero
.L8008CB70:
/* 8D770 8008CB70 26820001 */  addiu      $v0, $s4, 1
/* 8D774 8008CB74 00402021 */  addu       $a0, $v0, $zero
/* 8D778 8008CB78 24050010 */  addiu      $a1, $zero, 0x10
/* 8D77C 8008CB7C 24060103 */  addiu      $a2, $zero, 0x103
/* 8D780 8008CB80 00158080 */  sll        $s0, $s5, 2
/* 8D784 8008CB84 92910000 */  lbu        $s1, ($s4)
/* 8D788 8008CB88 02128021 */  addu       $s0, $s0, $s2
/* 8D78C 8008CB8C AE020000 */  sw         $v0, ($s0)
/* 8D790 8008CB90 0C035669 */  jal        decrypt_string
/* 8D794 8008CB94 02203821 */   addu      $a3, $s1, $zero
/* 8D798 8008CB98 0C015E54 */  jal        some_string_func
/* 8D79C 8008CB9C 8E040000 */   lw        $a0, ($s0)
/* 8D7A0 8008CBA0 26310001 */  addiu      $s1, $s1, 1
/* 8D7A4 8008CBA4 26A30001 */  addiu      $v1, $s5, 1
/* 8D7A8 8008CBA8 8FA20058 */  lw         $v0, 0x58($sp)
/* 8D7AC 8008CBAC 3075FFFF */  andi       $s5, $v1, 0xffff
/* 8D7B0 8008CBB0 02A2102B */  sltu       $v0, $s5, $v0
/* 8D7B4 8008CBB4 1440FFEE */  bnez       $v0, .L8008CB70
/* 8D7B8 8008CBB8 0291A021 */   addu      $s4, $s4, $s1
.L8008CBBC:
/* 8D7BC 8008CBBC 02401021 */  addu       $v0, $s2, $zero
/* 8D7C0 8008CBC0 8FBF0078 */  lw         $ra, 0x78($sp)
/* 8D7C4 8008CBC4 8FB50074 */  lw         $s5, 0x74($sp)
/* 8D7C8 8008CBC8 8FB40070 */  lw         $s4, 0x70($sp)
/* 8D7CC 8008CBCC 8FB3006C */  lw         $s3, 0x6c($sp)
/* 8D7D0 8008CBD0 8FB20068 */  lw         $s2, 0x68($sp)
/* 8D7D4 8008CBD4 8FB10064 */  lw         $s1, 0x64($sp)
/* 8D7D8 8008CBD8 8FB00060 */  lw         $s0, 0x60($sp)
/* 8D7DC 8008CBDC 03E00008 */  jr         $ra
/* 8D7E0 8008CBE0 27BD0080 */   addiu     $sp, $sp, 0x80

glabel free_romstring
/* 8D7E4 8008CBE4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8D7E8 8008CBE8 AFB00010 */  sw         $s0, 0x10($sp)
/* 8D7EC 8008CBEC 3C10800E */  lui        $s0, %hi(D_800E1800)
/* 8D7F0 8008CBF0 26101800 */  addiu      $s0, $s0, %lo(D_800E1800)
/* 8D7F4 8008CBF4 02002821 */  addu       $a1, $s0, $zero
/* 8D7F8 8008CBF8 AFB10014 */  sw         $s1, 0x14($sp)
/* 8D7FC 8008CBFC 00808821 */  addu       $s1, $a0, $zero
/* 8D800 8008CC00 AFBF0018 */  sw         $ra, 0x18($sp)
/* 8D804 8008CC04 8E240000 */  lw         $a0, ($s1)
/* 8D808 8008CC08 24060079 */  addiu      $a2, $zero, 0x79
/* 8D80C 8008CC0C 0C02600C */  jal        Free
/* 8D810 8008CC10 2484FFFD */   addiu     $a0, $a0, -3
/* 8D814 8008CC14 02202021 */  addu       $a0, $s1, $zero
/* 8D818 8008CC18 02002821 */  addu       $a1, $s0, $zero
/* 8D81C 8008CC1C 0C02600C */  jal        Free
/* 8D820 8008CC20 2406007A */   addiu     $a2, $zero, 0x7a
/* 8D824 8008CC24 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8D828 8008CC28 8FB10014 */  lw         $s1, 0x14($sp)
/* 8D82C 8008CC2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 8D830 8008CC30 03E00008 */  jr         $ra
/* 8D834 8008CC34 27BD0020 */   addiu     $sp, $sp, 0x20
/* 8D838 8008CC38 00000000 */  nop
/* 8D83C 8008CC3C 00000000 */  nop
