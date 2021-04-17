.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel decompress_LZ01
/* AA8EC 800A9CEC 00C05021 */  addu       $t2, $a2, $zero
/* AA8F0 800A9CF0 00804021 */  addu       $t0, $a0, $zero
/* AA8F4 800A9CF4 ACE00000 */  sw         $zero, ($a3)
/* AA8F8 800A9CF8 91020000 */  lbu        $v0, ($t0)
/* AA8FC 800A9CFC 2C420012 */  sltiu      $v0, $v0, 0x12
/* AA900 800A9D00 1440000E */  bnez       $v0, .L800A9D3C
/* AA904 800A9D04 00852021 */   addu      $a0, $a0, $a1
/* AA908 800A9D08 91030000 */  lbu        $v1, ($t0)
/* AA90C 800A9D0C 2469FFEF */  addiu      $t1, $v1, -0x11
/* AA910 800A9D10 2D220004 */  sltiu      $v0, $t1, 4
/* AA914 800A9D14 1440009E */  bnez       $v0, .L800A9F90
/* AA918 800A9D18 25080001 */   addiu     $t0, $t0, 1
.L800A9D1C:
/* AA91C 800A9D1C 91020000 */  lbu        $v0, ($t0)
/* AA920 800A9D20 25080001 */  addiu      $t0, $t0, 1
/* AA924 800A9D24 2529FFFF */  addiu      $t1, $t1, -1
/* AA928 800A9D28 A1420000 */  sb         $v0, ($t2)
/* AA92C 800A9D2C 1520FFFB */  bnez       $t1, .L800A9D1C
/* AA930 800A9D30 254A0001 */   addiu     $t2, $t2, 1
/* AA934 800A9D34 0802A773 */  j          .L800A9DCC
/* AA938 800A9D38 91090000 */   lbu       $t1, ($t0)
.L800A9D3C:
/* AA93C 800A9D3C 91090000 */  lbu        $t1, ($t0)
.L800A9D40:
/* AA940 800A9D40 2D220010 */  sltiu      $v0, $t1, 0x10
/* AA944 800A9D44 10400031 */  beqz       $v0, .L800A9E0C
/* AA948 800A9D48 25080001 */   addiu     $t0, $t0, 1
/* AA94C 800A9D4C 5520000D */  bnel       $t1, $zero, .L800A9D84
/* AA950 800A9D50 91020000 */   lbu       $v0, ($t0)
/* AA954 800A9D54 91020000 */  lbu        $v0, ($t0)
/* AA958 800A9D58 54400006 */  bnel       $v0, $zero, .L800A9D74
/* AA95C 800A9D5C 91030000 */   lbu       $v1, ($t0)
.L800A9D60:
/* AA960 800A9D60 25080001 */  addiu      $t0, $t0, 1
/* AA964 800A9D64 91020000 */  lbu        $v0, ($t0)
/* AA968 800A9D68 1040FFFD */  beqz       $v0, .L800A9D60
/* AA96C 800A9D6C 252900FF */   addiu     $t1, $t1, 0xff
/* AA970 800A9D70 91030000 */  lbu        $v1, ($t0)
.L800A9D74:
/* AA974 800A9D74 25080001 */  addiu      $t0, $t0, 1
/* AA978 800A9D78 2522000F */  addiu      $v0, $t1, 0xf
/* AA97C 800A9D7C 00434821 */  addu       $t1, $v0, $v1
/* AA980 800A9D80 91020000 */  lbu        $v0, ($t0)
.L800A9D84:
/* AA984 800A9D84 25080001 */  addiu      $t0, $t0, 1
/* AA988 800A9D88 A1420000 */  sb         $v0, ($t2)
/* AA98C 800A9D8C 254A0001 */  addiu      $t2, $t2, 1
/* AA990 800A9D90 91020000 */  lbu        $v0, ($t0)
/* AA994 800A9D94 25080001 */  addiu      $t0, $t0, 1
/* AA998 800A9D98 A1420000 */  sb         $v0, ($t2)
/* AA99C 800A9D9C 254A0001 */  addiu      $t2, $t2, 1
/* AA9A0 800A9DA0 91020000 */  lbu        $v0, ($t0)
/* AA9A4 800A9DA4 25080001 */  addiu      $t0, $t0, 1
/* AA9A8 800A9DA8 A1420000 */  sb         $v0, ($t2)
/* AA9AC 800A9DAC 254A0001 */  addiu      $t2, $t2, 1
.L800A9DB0:
/* AA9B0 800A9DB0 91020000 */  lbu        $v0, ($t0)
/* AA9B4 800A9DB4 25080001 */  addiu      $t0, $t0, 1
/* AA9B8 800A9DB8 2529FFFF */  addiu      $t1, $t1, -1
/* AA9BC 800A9DBC A1420000 */  sb         $v0, ($t2)
/* AA9C0 800A9DC0 1520FFFB */  bnez       $t1, .L800A9DB0
/* AA9C4 800A9DC4 254A0001 */   addiu     $t2, $t2, 1
/* AA9C8 800A9DC8 91090000 */  lbu        $t1, ($t0)
.L800A9DCC:
/* AA9CC 800A9DCC 2D220010 */  sltiu      $v0, $t1, 0x10
/* AA9D0 800A9DD0 1040000E */  beqz       $v0, .L800A9E0C
/* AA9D4 800A9DD4 25080001 */   addiu     $t0, $t0, 1
/* AA9D8 800A9DD8 2545F7FF */  addiu      $a1, $t2, -0x801
/* AA9DC 800A9DDC 00091082 */  srl        $v0, $t1, 2
/* AA9E0 800A9DE0 00A22823 */  subu       $a1, $a1, $v0
/* AA9E4 800A9DE4 91030000 */  lbu        $v1, ($t0)
/* AA9E8 800A9DE8 25080001 */  addiu      $t0, $t0, 1
/* AA9EC 800A9DEC 00031880 */  sll        $v1, $v1, 2
/* AA9F0 800A9DF0 00A32823 */  subu       $a1, $a1, $v1
/* AA9F4 800A9DF4 90A20000 */  lbu        $v0, ($a1)
/* AA9F8 800A9DF8 24A50001 */  addiu      $a1, $a1, 1
/* AA9FC 800A9DFC A1420000 */  sb         $v0, ($t2)
/* AAA00 800A9E00 90A30000 */  lbu        $v1, ($a1)
/* AAA04 800A9E04 0802A7CC */  j          .L800A9F30
/* AAA08 800A9E08 254A0001 */   addiu     $t2, $t2, 1
.L800A9E0C:
/* AAA0C 800A9E0C 2D220040 */  sltiu      $v0, $t1, 0x40
/* AAA10 800A9E10 1440000C */  bnez       $v0, .L800A9E44
/* AAA14 800A9E14 2D220020 */   sltiu     $v0, $t1, 0x20
/* AAA18 800A9E18 2545FFFF */  addiu      $a1, $t2, -1
/* AAA1C 800A9E1C 00091082 */  srl        $v0, $t1, 2
/* AAA20 800A9E20 30420007 */  andi       $v0, $v0, 7
/* AAA24 800A9E24 00A22823 */  subu       $a1, $a1, $v0
/* AAA28 800A9E28 91030000 */  lbu        $v1, ($t0)
/* AAA2C 800A9E2C 25080001 */  addiu      $t0, $t0, 1
/* AAA30 800A9E30 00091142 */  srl        $v0, $t1, 5
/* AAA34 800A9E34 2449FFFF */  addiu      $t1, $v0, -1
/* AAA38 800A9E38 000318C0 */  sll        $v1, $v1, 3
/* AAA3C 800A9E3C 0802A7D2 */  j          .L800A9F48
/* AAA40 800A9E40 00A32823 */   subu      $a1, $a1, $v1
.L800A9E44:
/* AAA44 800A9E44 14400017 */  bnez       $v0, .L800A9EA4
/* AAA48 800A9E48 2D220010 */   sltiu     $v0, $t1, 0x10
/* AAA4C 800A9E4C 3129001F */  andi       $t1, $t1, 0x1f
/* AAA50 800A9E50 1520000C */  bnez       $t1, .L800A9E84
/* AAA54 800A9E54 2545FFFF */   addiu     $a1, $t2, -1
/* AAA58 800A9E58 91020000 */  lbu        $v0, ($t0)
/* AAA5C 800A9E5C 54400006 */  bnel       $v0, $zero, .L800A9E78
/* AAA60 800A9E60 91030000 */   lbu       $v1, ($t0)
.L800A9E64:
/* AAA64 800A9E64 25080001 */  addiu      $t0, $t0, 1
/* AAA68 800A9E68 91020000 */  lbu        $v0, ($t0)
/* AAA6C 800A9E6C 1040FFFD */  beqz       $v0, .L800A9E64
/* AAA70 800A9E70 252900FF */   addiu     $t1, $t1, 0xff
/* AAA74 800A9E74 91030000 */  lbu        $v1, ($t0)
.L800A9E78:
/* AAA78 800A9E78 25080001 */  addiu      $t0, $t0, 1
/* AAA7C 800A9E7C 2522001F */  addiu      $v0, $t1, 0x1f
/* AAA80 800A9E80 00434821 */  addu       $t1, $v0, $v1
.L800A9E84:
/* AAA84 800A9E84 91020000 */  lbu        $v0, ($t0)
/* AAA88 800A9E88 91030001 */  lbu        $v1, 1($t0)
/* AAA8C 800A9E8C 25080002 */  addiu      $t0, $t0, 2
/* AAA90 800A9E90 00021082 */  srl        $v0, $v0, 2
/* AAA94 800A9E94 00031980 */  sll        $v1, $v1, 6
/* AAA98 800A9E98 00431021 */  addu       $v0, $v0, $v1
/* AAA9C 800A9E9C 0802A7D2 */  j          .L800A9F48
/* AAAA0 800A9EA0 00A22823 */   subu      $a1, $a1, $v0
.L800A9EA4:
/* AAAA4 800A9EA4 1440001B */  bnez       $v0, .L800A9F14
/* AAAA8 800A9EA8 2545FFFF */   addiu     $a1, $t2, -1
/* AAAAC 800A9EAC 31220008 */  andi       $v0, $t1, 8
/* AAAB0 800A9EB0 000212C0 */  sll        $v0, $v0, 0xb
/* AAAB4 800A9EB4 31290007 */  andi       $t1, $t1, 7
/* AAAB8 800A9EB8 1520000C */  bnez       $t1, .L800A9EEC
/* AAABC 800A9EBC 01422823 */   subu      $a1, $t2, $v0
/* AAAC0 800A9EC0 91020000 */  lbu        $v0, ($t0)
/* AAAC4 800A9EC4 54400006 */  bnel       $v0, $zero, .L800A9EE0
/* AAAC8 800A9EC8 91030000 */   lbu       $v1, ($t0)
.L800A9ECC:
/* AAACC 800A9ECC 25080001 */  addiu      $t0, $t0, 1
/* AAAD0 800A9ED0 91020000 */  lbu        $v0, ($t0)
/* AAAD4 800A9ED4 1040FFFD */  beqz       $v0, .L800A9ECC
/* AAAD8 800A9ED8 252900FF */   addiu     $t1, $t1, 0xff
/* AAADC 800A9EDC 91030000 */  lbu        $v1, ($t0)
.L800A9EE0:
/* AAAE0 800A9EE0 25080001 */  addiu      $t0, $t0, 1
/* AAAE4 800A9EE4 25220007 */  addiu      $v0, $t1, 7
/* AAAE8 800A9EE8 00434821 */  addu       $t1, $v0, $v1
.L800A9EEC:
/* AAAEC 800A9EEC 91020000 */  lbu        $v0, ($t0)
/* AAAF0 800A9EF0 91030001 */  lbu        $v1, 1($t0)
/* AAAF4 800A9EF4 00021082 */  srl        $v0, $v0, 2
/* AAAF8 800A9EF8 00031980 */  sll        $v1, $v1, 6
/* AAAFC 800A9EFC 00431021 */  addu       $v0, $v0, $v1
/* AAB00 800A9F00 00A22823 */  subu       $a1, $a1, $v0
/* AAB04 800A9F04 10AA002B */  beq        $a1, $t2, .L800A9FB4
/* AAB08 800A9F08 25080002 */   addiu     $t0, $t0, 2
/* AAB0C 800A9F0C 0802A7D2 */  j          .L800A9F48
/* AAB10 800A9F10 24A5C000 */   addiu     $a1, $a1, -0x4000
.L800A9F14:
/* AAB14 800A9F14 00091882 */  srl        $v1, $t1, 2
/* AAB18 800A9F18 91020000 */  lbu        $v0, ($t0)
/* AAB1C 800A9F1C 00A32823 */  subu       $a1, $a1, $v1
/* AAB20 800A9F20 00021080 */  sll        $v0, $v0, 2
/* AAB24 800A9F24 00A22823 */  subu       $a1, $a1, $v0
/* AAB28 800A9F28 90A30000 */  lbu        $v1, ($a1)
/* AAB2C 800A9F2C 25080001 */  addiu      $t0, $t0, 1
.L800A9F30:
/* AAB30 800A9F30 A1430000 */  sb         $v1, ($t2)
/* AAB34 800A9F34 90A20001 */  lbu        $v0, 1($a1)
/* AAB38 800A9F38 254A0001 */  addiu      $t2, $t2, 1
/* AAB3C 800A9F3C A1420000 */  sb         $v0, ($t2)
/* AAB40 800A9F40 0802A7E0 */  j          .L800A9F80
/* AAB44 800A9F44 254A0001 */   addiu     $t2, $t2, 1
.L800A9F48:
/* AAB48 800A9F48 90A20000 */  lbu        $v0, ($a1)
/* AAB4C 800A9F4C 24A50001 */  addiu      $a1, $a1, 1
/* AAB50 800A9F50 A1420000 */  sb         $v0, ($t2)
/* AAB54 800A9F54 254A0001 */  addiu      $t2, $t2, 1
/* AAB58 800A9F58 90A20000 */  lbu        $v0, ($a1)
/* AAB5C 800A9F5C 24A50001 */  addiu      $a1, $a1, 1
/* AAB60 800A9F60 A1420000 */  sb         $v0, ($t2)
/* AAB64 800A9F64 254A0001 */  addiu      $t2, $t2, 1
.L800A9F68:
/* AAB68 800A9F68 90A20000 */  lbu        $v0, ($a1)
/* AAB6C 800A9F6C 24A50001 */  addiu      $a1, $a1, 1
/* AAB70 800A9F70 2529FFFF */  addiu      $t1, $t1, -1
/* AAB74 800A9F74 A1420000 */  sb         $v0, ($t2)
/* AAB78 800A9F78 1520FFFB */  bnez       $t1, .L800A9F68
/* AAB7C 800A9F7C 254A0001 */   addiu     $t2, $t2, 1
.L800A9F80:
/* AAB80 800A9F80 9102FFFE */  lbu        $v0, -2($t0)
/* AAB84 800A9F84 30490003 */  andi       $t1, $v0, 3
/* AAB88 800A9F88 5120FF6D */  beql       $t1, $zero, .L800A9D40
/* AAB8C 800A9F8C 91090000 */   lbu       $t1, ($t0)
.L800A9F90:
/* AAB90 800A9F90 91020000 */  lbu        $v0, ($t0)
/* AAB94 800A9F94 25080001 */  addiu      $t0, $t0, 1
/* AAB98 800A9F98 2529FFFF */  addiu      $t1, $t1, -1
/* AAB9C 800A9F9C A1420000 */  sb         $v0, ($t2)
/* AABA0 800A9FA0 1520FFFB */  bnez       $t1, .L800A9F90
/* AABA4 800A9FA4 254A0001 */   addiu     $t2, $t2, 1
/* AABA8 800A9FA8 91090000 */  lbu        $t1, ($t0)
/* AABAC 800A9FAC 0802A783 */  j          .L800A9E0C
/* AABB0 800A9FB0 25080001 */   addiu     $t0, $t0, 1
.L800A9FB4:
/* AABB4 800A9FB4 01461023 */  subu       $v0, $t2, $a2
/* AABB8 800A9FB8 11040006 */  beq        $t0, $a0, .L800A9FD4
/* AABBC 800A9FBC ACE20000 */   sw        $v0, ($a3)
/* AABC0 800A9FC0 0104102B */  sltu       $v0, $t0, $a0
/* AABC4 800A9FC4 10400004 */  beqz       $v0, .L800A9FD8
/* AABC8 800A9FC8 2403FFFC */   addiu     $v1, $zero, -4
/* AABCC 800A9FCC 0802A7F6 */  j          .L800A9FD8
/* AABD0 800A9FD0 2403FFF8 */   addiu     $v1, $zero, -8
.L800A9FD4:
/* AABD4 800A9FD4 00001821 */  addu       $v1, $zero, $zero
.L800A9FD8:
/* AABD8 800A9FD8 03E00008 */  jr         $ra
/* AABDC 800A9FDC 00601021 */   addu      $v0, $v1, $zero

glabel func_800A9FE0
/* AABE0 800A9FE0 00C05021 */  addu       $t2, $a2, $zero
/* AABE4 800A9FE4 00804021 */  addu       $t0, $a0, $zero
/* AABE8 800A9FE8 8CE30000 */  lw         $v1, ($a3)
/* AABEC 800A9FEC 00852021 */  addu       $a0, $a0, $a1
/* AABF0 800A9FF0 ACE00000 */  sw         $zero, ($a3)
/* AABF4 800A9FF4 91020000 */  lbu        $v0, ($t0)
/* AABF8 800A9FF8 2C420012 */  sltiu      $v0, $v0, 0x12
/* AABFC 800A9FFC 144000C5 */  bnez       $v0, .L800AA314
/* AAC00 800AA000 00C35821 */   addu      $t3, $a2, $v1
/* AAC04 800AA004 91030000 */  lbu        $v1, ($t0)
/* AAC08 800AA008 2469FFEF */  addiu      $t1, $v1, -0x11
/* AAC0C 800AA00C 2D220004 */  sltiu      $v0, $t1, 4
/* AAC10 800AA010 144000B5 */  bnez       $v0, .L800AA2E8
/* AAC14 800AA014 25080001 */   addiu     $t0, $t0, 1
.L800AA018:
/* AAC18 800AA018 91020000 */  lbu        $v0, ($t0)
/* AAC1C 800AA01C 25080001 */  addiu      $t0, $t0, 1
/* AAC20 800AA020 2529FFFF */  addiu      $t1, $t1, -1
/* AAC24 800AA024 A1420000 */  sb         $v0, ($t2)
/* AAC28 800AA028 1520FFFB */  bnez       $t1, .L800AA018
/* AAC2C 800AA02C 254A0001 */   addiu     $t2, $t2, 1
/* AAC30 800AA030 0802A832 */  j          .L800AA0C8
/* AAC34 800AA034 91090000 */   lbu       $t1, ($t0)
.L800AA038:
/* AAC38 800AA038 2D220010 */  sltiu      $v0, $t1, 0x10
/* AAC3C 800AA03C 1040003D */  beqz       $v0, .L800AA134
/* AAC40 800AA040 25080001 */   addiu     $t0, $t0, 1
/* AAC44 800AA044 5520000E */  bnel       $t1, $zero, .L800AA080
/* AAC48 800AA048 91020000 */   lbu       $v0, ($t0)
/* AAC4C 800AA04C 0802A816 */  j          .L800AA058
/* AAC50 800AA050 00000000 */   nop
.L800AA054:
/* AAC54 800AA054 25080001 */  addiu      $t0, $t0, 1
.L800AA058:
/* AAC58 800AA058 108800C0 */  beq        $a0, $t0, .L800AA35C
/* AAC5C 800AA05C 01461023 */   subu      $v0, $t2, $a2
/* AAC60 800AA060 91020000 */  lbu        $v0, ($t0)
/* AAC64 800AA064 5040FFFB */  beql       $v0, $zero, .L800AA054
/* AAC68 800AA068 252900FF */   addiu     $t1, $t1, 0xff
/* AAC6C 800AA06C 91030000 */  lbu        $v1, ($t0)
/* AAC70 800AA070 25080001 */  addiu      $t0, $t0, 1
/* AAC74 800AA074 2522000F */  addiu      $v0, $t1, 0xf
/* AAC78 800AA078 00434821 */  addu       $t1, $v0, $v1
/* AAC7C 800AA07C 91020000 */  lbu        $v0, ($t0)
.L800AA080:
/* AAC80 800AA080 25080001 */  addiu      $t0, $t0, 1
/* AAC84 800AA084 A1420000 */  sb         $v0, ($t2)
/* AAC88 800AA088 254A0001 */  addiu      $t2, $t2, 1
/* AAC8C 800AA08C 91020000 */  lbu        $v0, ($t0)
/* AAC90 800AA090 25080001 */  addiu      $t0, $t0, 1
/* AAC94 800AA094 A1420000 */  sb         $v0, ($t2)
/* AAC98 800AA098 254A0001 */  addiu      $t2, $t2, 1
/* AAC9C 800AA09C 91020000 */  lbu        $v0, ($t0)
/* AACA0 800AA0A0 25080001 */  addiu      $t0, $t0, 1
/* AACA4 800AA0A4 A1420000 */  sb         $v0, ($t2)
/* AACA8 800AA0A8 254A0001 */  addiu      $t2, $t2, 1
.L800AA0AC:
/* AACAC 800AA0AC 91020000 */  lbu        $v0, ($t0)
/* AACB0 800AA0B0 25080001 */  addiu      $t0, $t0, 1
/* AACB4 800AA0B4 2529FFFF */  addiu      $t1, $t1, -1
/* AACB8 800AA0B8 A1420000 */  sb         $v0, ($t2)
/* AACBC 800AA0BC 1520FFFB */  bnez       $t1, .L800AA0AC
/* AACC0 800AA0C0 254A0001 */   addiu     $t2, $t2, 1
/* AACC4 800AA0C4 91090000 */  lbu        $t1, ($t0)
.L800AA0C8:
/* AACC8 800AA0C8 2D220010 */  sltiu      $v0, $t1, 0x10
/* AACCC 800AA0CC 10400019 */  beqz       $v0, .L800AA134
/* AACD0 800AA0D0 25080001 */   addiu     $t0, $t0, 1
/* AACD4 800AA0D4 2545F7FF */  addiu      $a1, $t2, -0x801
/* AACD8 800AA0D8 00091082 */  srl        $v0, $t1, 2
/* AACDC 800AA0DC 00A22823 */  subu       $a1, $a1, $v0
/* AACE0 800AA0E0 91030000 */  lbu        $v1, ($t0)
/* AACE4 800AA0E4 00031880 */  sll        $v1, $v1, 2
/* AACE8 800AA0E8 00A32823 */  subu       $a1, $a1, $v1
/* AACEC 800AA0EC 00A6102B */  sltu       $v0, $a1, $a2
/* AACF0 800AA0F0 144000A0 */  bnez       $v0, .L800AA374
/* AACF4 800AA0F4 25080001 */   addiu     $t0, $t0, 1
/* AACF8 800AA0F8 016A1023 */  subu       $v0, $t3, $t2
/* AACFC 800AA0FC 2C420003 */  sltiu      $v0, $v0, 3
/* AAD00 800AA100 14400099 */  bnez       $v0, .L800AA368
/* AAD04 800AA104 01461023 */   subu      $v0, $t2, $a2
/* AAD08 800AA108 90A20000 */  lbu        $v0, ($a1)
/* AAD0C 800AA10C 24A50001 */  addiu      $a1, $a1, 1
/* AAD10 800AA110 A1420000 */  sb         $v0, ($t2)
/* AAD14 800AA114 90A30000 */  lbu        $v1, ($a1)
/* AAD18 800AA118 254A0001 */  addiu      $t2, $t2, 1
/* AAD1C 800AA11C A1430000 */  sb         $v1, ($t2)
/* AAD20 800AA120 90A20001 */  lbu        $v0, 1($a1)
/* AAD24 800AA124 254A0001 */  addiu      $t2, $t2, 1
/* AAD28 800AA128 A1420000 */  sb         $v0, ($t2)
/* AAD2C 800AA12C 0802A8B6 */  j          .L800AA2D8
/* AAD30 800AA130 254A0001 */   addiu     $t2, $t2, 1
.L800AA134:
/* AAD34 800AA134 2D220040 */  sltiu      $v0, $t1, 0x40
.L800AA138:
/* AAD38 800AA138 1440000C */  bnez       $v0, .L800AA16C
/* AAD3C 800AA13C 2D220020 */   sltiu     $v0, $t1, 0x20
/* AAD40 800AA140 2545FFFF */  addiu      $a1, $t2, -1
/* AAD44 800AA144 00091082 */  srl        $v0, $t1, 2
/* AAD48 800AA148 30420007 */  andi       $v0, $v0, 7
/* AAD4C 800AA14C 00A22823 */  subu       $a1, $a1, $v0
/* AAD50 800AA150 91030000 */  lbu        $v1, ($t0)
/* AAD54 800AA154 25080001 */  addiu      $t0, $t0, 1
/* AAD58 800AA158 00091142 */  srl        $v0, $t1, 5
/* AAD5C 800AA15C 2449FFFF */  addiu      $t1, $v0, -1
/* AAD60 800AA160 000318C0 */  sll        $v1, $v1, 3
/* AAD64 800AA164 0802A8A5 */  j          .L800AA294
/* AAD68 800AA168 00A32823 */   subu      $a1, $a1, $v1
.L800AA16C:
/* AAD6C 800AA16C 54400019 */  bnel       $v0, $zero, .L800AA1D4
/* AAD70 800AA170 2D220010 */   sltiu     $v0, $t1, 0x10
/* AAD74 800AA174 3129001F */  andi       $t1, $t1, 0x1f
/* AAD78 800AA178 1520000E */  bnez       $t1, .L800AA1B4
/* AAD7C 800AA17C 2545FFFF */   addiu     $a1, $t2, -1
/* AAD80 800AA180 0802A863 */  j          .L800AA18C
/* AAD84 800AA184 00000000 */   nop
.L800AA188:
/* AAD88 800AA188 25080001 */  addiu      $t0, $t0, 1
.L800AA18C:
/* AAD8C 800AA18C 10880073 */  beq        $a0, $t0, .L800AA35C
/* AAD90 800AA190 01461023 */   subu      $v0, $t2, $a2
/* AAD94 800AA194 91020000 */  lbu        $v0, ($t0)
/* AAD98 800AA198 5040FFFB */  beql       $v0, $zero, .L800AA188
/* AAD9C 800AA19C 252900FF */   addiu     $t1, $t1, 0xff
/* AADA0 800AA1A0 91030000 */  lbu        $v1, ($t0)
/* AADA4 800AA1A4 25080001 */  addiu      $t0, $t0, 1
/* AADA8 800AA1A8 2522001F */  addiu      $v0, $t1, 0x1f
/* AADAC 800AA1AC 00434821 */  addu       $t1, $v0, $v1
/* AADB0 800AA1B0 2545FFFF */  addiu      $a1, $t2, -1
.L800AA1B4:
/* AADB4 800AA1B4 91020000 */  lbu        $v0, ($t0)
/* AADB8 800AA1B8 91030001 */  lbu        $v1, 1($t0)
/* AADBC 800AA1BC 25080002 */  addiu      $t0, $t0, 2
/* AADC0 800AA1C0 00021082 */  srl        $v0, $v0, 2
/* AADC4 800AA1C4 00031980 */  sll        $v1, $v1, 6
/* AADC8 800AA1C8 00431021 */  addu       $v0, $v0, $v1
/* AADCC 800AA1CC 0802A8A5 */  j          .L800AA294
/* AADD0 800AA1D0 00A22823 */   subu      $a1, $a1, $v0
.L800AA1D4:
/* AADD4 800AA1D4 1440001C */  bnez       $v0, .L800AA248
/* AADD8 800AA1D8 2545FFFF */   addiu     $a1, $t2, -1
/* AADDC 800AA1DC 31220008 */  andi       $v0, $t1, 8
/* AADE0 800AA1E0 000212C0 */  sll        $v0, $v0, 0xb
/* AADE4 800AA1E4 31290007 */  andi       $t1, $t1, 7
/* AADE8 800AA1E8 1520000D */  bnez       $t1, .L800AA220
/* AADEC 800AA1EC 01422823 */   subu      $a1, $t2, $v0
/* AADF0 800AA1F0 0802A87F */  j          .L800AA1FC
/* AADF4 800AA1F4 00000000 */   nop
.L800AA1F8:
/* AADF8 800AA1F8 25080001 */  addiu      $t0, $t0, 1
.L800AA1FC:
/* AADFC 800AA1FC 10880057 */  beq        $a0, $t0, .L800AA35C
/* AAE00 800AA200 01461023 */   subu      $v0, $t2, $a2
/* AAE04 800AA204 91020000 */  lbu        $v0, ($t0)
/* AAE08 800AA208 5040FFFB */  beql       $v0, $zero, .L800AA1F8
/* AAE0C 800AA20C 252900FF */   addiu     $t1, $t1, 0xff
/* AAE10 800AA210 91030000 */  lbu        $v1, ($t0)
/* AAE14 800AA214 25080001 */  addiu      $t0, $t0, 1
/* AAE18 800AA218 25220007 */  addiu      $v0, $t1, 7
/* AAE1C 800AA21C 00434821 */  addu       $t1, $v0, $v1
.L800AA220:
/* AAE20 800AA220 91020000 */  lbu        $v0, ($t0)
/* AAE24 800AA224 91030001 */  lbu        $v1, 1($t0)
/* AAE28 800AA228 00021082 */  srl        $v0, $v0, 2
/* AAE2C 800AA22C 00031980 */  sll        $v1, $v1, 6
/* AAE30 800AA230 00431021 */  addu       $v0, $v0, $v1
/* AAE34 800AA234 00A22823 */  subu       $a1, $a1, $v0
/* AAE38 800AA238 10AA003D */  beq        $a1, $t2, .L800AA330
/* AAE3C 800AA23C 25080002 */   addiu     $t0, $t0, 2
/* AAE40 800AA240 0802A8A5 */  j          .L800AA294
/* AAE44 800AA244 24A5C000 */   addiu     $a1, $a1, -0x4000
.L800AA248:
/* AAE48 800AA248 00091082 */  srl        $v0, $t1, 2
/* AAE4C 800AA24C 00A22823 */  subu       $a1, $a1, $v0
/* AAE50 800AA250 91030000 */  lbu        $v1, ($t0)
/* AAE54 800AA254 00031880 */  sll        $v1, $v1, 2
/* AAE58 800AA258 00A32823 */  subu       $a1, $a1, $v1
/* AAE5C 800AA25C 00A6102B */  sltu       $v0, $a1, $a2
/* AAE60 800AA260 14400044 */  bnez       $v0, .L800AA374
/* AAE64 800AA264 25080001 */   addiu     $t0, $t0, 1
/* AAE68 800AA268 016A1023 */  subu       $v0, $t3, $t2
/* AAE6C 800AA26C 2C420002 */  sltiu      $v0, $v0, 2
/* AAE70 800AA270 1440003D */  bnez       $v0, .L800AA368
/* AAE74 800AA274 01461023 */   subu      $v0, $t2, $a2
/* AAE78 800AA278 90A20000 */  lbu        $v0, ($a1)
/* AAE7C 800AA27C A1420000 */  sb         $v0, ($t2)
/* AAE80 800AA280 90A30001 */  lbu        $v1, 1($a1)
/* AAE84 800AA284 254A0001 */  addiu      $t2, $t2, 1
/* AAE88 800AA288 A1430000 */  sb         $v1, ($t2)
/* AAE8C 800AA28C 0802A8B6 */  j          .L800AA2D8
/* AAE90 800AA290 254A0001 */   addiu     $t2, $t2, 1
.L800AA294:
/* AAE94 800AA294 00A6102B */  sltu       $v0, $a1, $a2
/* AAE98 800AA298 14400037 */  bnez       $v0, .L800AA378
/* AAE9C 800AA29C 01461023 */   subu      $v0, $t2, $a2
/* AAEA0 800AA2A0 90A20000 */  lbu        $v0, ($a1)
/* AAEA4 800AA2A4 24A50001 */  addiu      $a1, $a1, 1
/* AAEA8 800AA2A8 A1420000 */  sb         $v0, ($t2)
/* AAEAC 800AA2AC 254A0001 */  addiu      $t2, $t2, 1
/* AAEB0 800AA2B0 90A20000 */  lbu        $v0, ($a1)
/* AAEB4 800AA2B4 24A50001 */  addiu      $a1, $a1, 1
/* AAEB8 800AA2B8 A1420000 */  sb         $v0, ($t2)
/* AAEBC 800AA2BC 254A0001 */  addiu      $t2, $t2, 1
.L800AA2C0:
/* AAEC0 800AA2C0 90A20000 */  lbu        $v0, ($a1)
/* AAEC4 800AA2C4 24A50001 */  addiu      $a1, $a1, 1
/* AAEC8 800AA2C8 2529FFFF */  addiu      $t1, $t1, -1
/* AAECC 800AA2CC A1420000 */  sb         $v0, ($t2)
/* AAED0 800AA2D0 1520FFFB */  bnez       $t1, .L800AA2C0
/* AAED4 800AA2D4 254A0001 */   addiu     $t2, $t2, 1
.L800AA2D8:
/* AAED8 800AA2D8 9102FFFE */  lbu        $v0, -2($t0)
/* AAEDC 800AA2DC 30490003 */  andi       $t1, $v0, 3
/* AAEE0 800AA2E0 1120000D */  beqz       $t1, .L800AA318
/* AAEE4 800AA2E4 0104102B */   sltu      $v0, $t0, $a0
.L800AA2E8:
/* AAEE8 800AA2E8 91020000 */  lbu        $v0, ($t0)
/* AAEEC 800AA2EC 25080001 */  addiu      $t0, $t0, 1
/* AAEF0 800AA2F0 2529FFFF */  addiu      $t1, $t1, -1
/* AAEF4 800AA2F4 A1420000 */  sb         $v0, ($t2)
/* AAEF8 800AA2F8 1520FFFB */  bnez       $t1, .L800AA2E8
/* AAEFC 800AA2FC 254A0001 */   addiu     $t2, $t2, 1
/* AAF00 800AA300 91090000 */  lbu        $t1, ($t0)
/* AAF04 800AA304 25080001 */  addiu      $t0, $t0, 1
/* AAF08 800AA308 0104102B */  sltu       $v0, $t0, $a0
/* AAF0C 800AA30C 1440FF8A */  bnez       $v0, .L800AA138
/* AAF10 800AA310 2D220040 */   sltiu     $v0, $t1, 0x40
.L800AA314:
/* AAF14 800AA314 0104102B */  sltu       $v0, $t0, $a0
.L800AA318:
/* AAF18 800AA318 5440FF47 */  bnel       $v0, $zero, .L800AA038
/* AAF1C 800AA31C 91090000 */   lbu       $t1, ($t0)
/* AAF20 800AA320 01461023 */  subu       $v0, $t2, $a2
/* AAF24 800AA324 ACE20000 */  sw         $v0, ($a3)
/* AAF28 800AA328 03E00008 */  jr         $ra
/* AAF2C 800AA32C 2402FFF9 */   addiu     $v0, $zero, -7
.L800AA330:
/* AAF30 800AA330 01461023 */  subu       $v0, $t2, $a2
/* AAF34 800AA334 11040006 */  beq        $t0, $a0, .L800AA350
/* AAF38 800AA338 ACE20000 */   sw        $v0, ($a3)
/* AAF3C 800AA33C 0104102B */  sltu       $v0, $t0, $a0
/* AAF40 800AA340 10400004 */  beqz       $v0, .L800AA354
/* AAF44 800AA344 2403FFFC */   addiu     $v1, $zero, -4
/* AAF48 800AA348 0802A8D5 */  j          .L800AA354
/* AAF4C 800AA34C 2403FFF8 */   addiu     $v1, $zero, -8
.L800AA350:
/* AAF50 800AA350 00001821 */  addu       $v1, $zero, $zero
.L800AA354:
/* AAF54 800AA354 03E00008 */  jr         $ra
/* AAF58 800AA358 00601021 */   addu      $v0, $v1, $zero
.L800AA35C:
/* AAF5C 800AA35C ACE20000 */  sw         $v0, ($a3)
/* AAF60 800AA360 03E00008 */  jr         $ra
/* AAF64 800AA364 2402FFFC */   addiu     $v0, $zero, -4
.L800AA368:
/* AAF68 800AA368 ACE20000 */  sw         $v0, ($a3)
/* AAF6C 800AA36C 03E00008 */  jr         $ra
/* AAF70 800AA370 2402FFFB */   addiu     $v0, $zero, -5
.L800AA374:
/* AAF74 800AA374 01461023 */  subu       $v0, $t2, $a2
.L800AA378:
/* AAF78 800AA378 ACE20000 */  sw         $v0, ($a3)
/* AAF7C 800AA37C 03E00008 */  jr         $ra
/* AAF80 800AA380 2402FFFA */   addiu     $v0, $zero, -6
/* AAF84 800AA384 00000000 */  nop
/* AAF88 800AA388 00000000 */  nop
/* AAF8C 800AA38C 00000000 */  nop
