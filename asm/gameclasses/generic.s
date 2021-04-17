.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_charExp
/* 7C7A0 8007BBA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7C7A4 8007BBA4 AFB00010 */  sw         $s0, 0x10($sp)
/* 7C7A8 8007BBA8 00808021 */  addu       $s0, $a0, $zero
/* 7C7AC 8007BBAC 30A4FFFF */  andi       $a0, $a1, 0xffff
/* 7C7B0 8007BBB0 00002821 */  addu       $a1, $zero, $zero
/* 7C7B4 8007BBB4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7C7B8 8007BBB8 0C01D77A */  jal        GetIDIndex
/* 7C7BC 8007BBBC 00003021 */   addu      $a2, $zero, $zero
/* 7C7C0 8007BBC0 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 7C7C4 8007BBC4 8C6513A0 */  lw         $a1, %lo(EntityPointer)($v1)
/* 7C7C8 8007BBC8 00403021 */  addu       $a2, $v0, $zero
/* 7C7CC 8007BBCC 8CA40010 */  lw         $a0, 0x10($a1)
/* 7C7D0 8007BBD0 000611C0 */  sll        $v0, $a2, 7
/* 7C7D4 8007BBD4 00822021 */  addu       $a0, $a0, $v0
/* 7C7D8 8007BBD8 90830019 */  lbu        $v1, 0x19($a0)
/* 7C7DC 8007BBDC A2030000 */  sb         $v1, ($s0)
/* 7C7E0 8007BBE0 9082001E */  lbu        $v0, 0x1e($a0)
/* 7C7E4 8007BBE4 A2020001 */  sb         $v0, 1($s0)
/* 7C7E8 8007BBE8 9083001F */  lbu        $v1, 0x1f($a0)
/* 7C7EC 8007BBEC A2030002 */  sb         $v1, 2($s0)
/* 7C7F0 8007BBF0 9082001D */  lbu        $v0, 0x1d($a0)
/* 7C7F4 8007BBF4 AE000004 */  sw         $zero, 4($s0)
/* 7C7F8 8007BBF8 AE000008 */  sw         $zero, 8($s0)
/* 7C7FC 8007BBFC A2020003 */  sb         $v0, 3($s0)
/* 7C800 8007BC00 90850018 */  lbu        $a1, 0x18($a0)
/* 7C804 8007BC04 A205000C */  sb         $a1, 0xc($s0)
/* 7C808 8007BC08 9083001A */  lbu        $v1, 0x1a($a0)
/* 7C80C 8007BC0C 24020002 */  addiu      $v0, $zero, 2
/* 7C810 8007BC10 14620004 */  bne        $v1, $v0, .L8007BC24
/* 7C814 8007BC14 24020099 */   addiu     $v0, $zero, 0x99
/* 7C818 8007BC18 34A20004 */  ori        $v0, $a1, 4
/* 7C81C 8007BC1C A202000C */  sb         $v0, 0xc($s0)
/* 7C820 8007BC20 24020099 */  addiu      $v0, $zero, 0x99
.L8007BC24:
/* 7C824 8007BC24 14C20008 */  bne        $a2, $v0, .L8007BC48
/* 7C828 8007BC28 8FBF0014 */   lw        $ra, 0x14($sp)
/* 7C82C 8007BC2C 0C009168 */  jal        get_event_flag
/* 7C830 8007BC30 2404024E */   addiu     $a0, $zero, 0x24e
/* 7C834 8007BC34 10400004 */  beqz       $v0, .L8007BC48
/* 7C838 8007BC38 8FBF0014 */   lw        $ra, 0x14($sp)
/* 7C83C 8007BC3C 9202000C */  lbu        $v0, 0xc($s0)
/* 7C840 8007BC40 34420001 */  ori        $v0, $v0, 1
/* 7C844 8007BC44 A202000C */  sb         $v0, 0xc($s0)
.L8007BC48:
/* 7C848 8007BC48 8FB00010 */  lw         $s0, 0x10($sp)
/* 7C84C 8007BC4C 03E00008 */  jr         $ra
/* 7C850 8007BC50 27BD0018 */   addiu     $sp, $sp, 0x18

glabel GetCharAspect
/* 7C854 8007BC54 9083000C */  lbu        $v1, 0xc($a0)
/* 7C858 8007BC58 30630004 */  andi       $v1, $v1, 4
/* 7C85C 8007BC5C 14600002 */  bnez       $v1, .L8007BC68
/* 7C860 8007BC60 24020002 */   addiu     $v0, $zero, 2
/* 7C864 8007BC64 24020001 */  addiu      $v0, $zero, 1
.L8007BC68:
/* 7C868 8007BC68 03E00008 */  jr         $ra
/* 7C86C 8007BC6C 00000000 */   nop

glabel temp_item_check
/* 7C870 8007BC70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7C874 8007BC74 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7C878 8007BC78 00051A02 */  srl        $v1, $a1, 8
/* 7C87C 8007BC7C 24020005 */  addiu      $v0, $zero, 5
/* 7C880 8007BC80 10620004 */  beq        $v1, $v0, .L8007BC94
/* 7C884 8007BC84 AFBF0010 */   sw        $ra, 0x10($sp)
/* 7C888 8007BC88 24020006 */  addiu      $v0, $zero, 6
/* 7C88C 8007BC8C 14620005 */  bne        $v1, $v0, .L8007BCA4
/* 7C890 8007BC90 24020007 */   addiu     $v0, $zero, 7
.L8007BC94:
/* 7C894 8007BC94 0C01EF50 */  jal        make_temp_armor
/* 7C898 8007BC98 00000000 */   nop
/* 7C89C 8007BC9C 0801EF38 */  j          .L8007BCE0
/* 7C8A0 8007BCA0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8007BCA4:
/* 7C8A4 8007BCA4 14620005 */  bne        $v1, $v0, .L8007BCBC
/* 7C8A8 8007BCA8 24020010 */   addiu     $v0, $zero, 0x10
/* 7C8AC 8007BCAC 0C01EF8E */  jal        make_temp_weapon
/* 7C8B0 8007BCB0 00000000 */   nop
/* 7C8B4 8007BCB4 0801EF38 */  j          .L8007BCE0
/* 7C8B8 8007BCB8 8FBF0010 */   lw        $ra, 0x10($sp)
.L8007BCBC:
/* 7C8BC 8007BCBC 14620005 */  bne        $v1, $v0, .L8007BCD4
/* 7C8C0 8007BCC0 00000000 */   nop
/* 7C8C4 8007BCC4 0C01EFCC */  jal        make_temp_potion
/* 7C8C8 8007BCC8 00000000 */   nop
/* 7C8CC 8007BCCC 0801EF38 */  j          .L8007BCE0
/* 7C8D0 8007BCD0 8FBF0010 */   lw        $ra, 0x10($sp)
.L8007BCD4:
/* 7C8D4 8007BCD4 0C01EFEB */  jal        make_temp_gear
/* 7C8D8 8007BCD8 00000000 */   nop
/* 7C8DC 8007BCDC 8FBF0010 */  lw         $ra, 0x10($sp)
.L8007BCE0:
/* 7C8E0 8007BCE0 03E00008 */  jr         $ra
/* 7C8E4 8007BCE4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel clear_temp_Stat_spell
/* 7C8E8 8007BCE8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7C8EC 8007BCEC AFB00010 */  sw         $s0, 0x10($sp)
/* 7C8F0 8007BCF0 00808021 */  addu       $s0, $a0, $zero
/* 7C8F4 8007BCF4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7C8F8 8007BCF8 8E04000C */  lw         $a0, 0xc($s0)
/* 7C8FC 8007BCFC 10800005 */  beqz       $a0, .L8007BD14
/* 7C900 8007BD00 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7C904 8007BD04 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7C908 8007BD08 0C02600C */  jal        Free
/* 7C90C 8007BD0C 2406006E */   addiu     $a2, $zero, 0x6e
/* 7C910 8007BD10 AE00000C */  sw         $zero, 0xc($s0)
.L8007BD14:
/* 7C914 8007BD14 8E040010 */  lw         $a0, 0x10($s0)
/* 7C918 8007BD18 10800005 */  beqz       $a0, .L8007BD30
/* 7C91C 8007BD1C 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7C920 8007BD20 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7C924 8007BD24 0C02600C */  jal        Free
/* 7C928 8007BD28 24060074 */   addiu     $a2, $zero, 0x74
/* 7C92C 8007BD2C AE000010 */  sw         $zero, 0x10($s0)
.L8007BD30:
/* 7C930 8007BD30 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7C934 8007BD34 8FB00010 */  lw         $s0, 0x10($sp)
/* 7C938 8007BD38 03E00008 */  jr         $ra
/* 7C93C 8007BD3C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel make_temp_armor
/* 7C940 8007BD40 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7C944 8007BD44 AFB10014 */  sw         $s1, 0x14($sp)
/* 7C948 8007BD48 00808821 */  addu       $s1, $a0, $zero
/* 7C94C 8007BD4C AFB00010 */  sw         $s0, 0x10($sp)
/* 7C950 8007BD50 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7C954 8007BD54 00002821 */  addu       $a1, $zero, $zero
/* 7C958 8007BD58 24060014 */  addiu      $a2, $zero, 0x14
/* 7C95C 8007BD5C AFBF001C */  sw         $ra, 0x1c($sp)
/* 7C960 8007BD60 0C026380 */  jal        Calloc
/* 7C964 8007BD64 AFB20018 */   sw        $s2, 0x18($sp)
/* 7C968 8007BD68 02002021 */  addu       $a0, $s0, $zero
/* 7C96C 8007BD6C 00002821 */  addu       $a1, $zero, $zero
/* 7C970 8007BD70 0C01D77A */  jal        GetIDIndex
/* 7C974 8007BD74 00003021 */   addu      $a2, $zero, $zero
/* 7C978 8007BD78 3C03800F */  lui        $v1, %hi(armour_pointer)
/* 7C97C 8007BD7C 8C65F7B0 */  lw         $a1, %lo(armour_pointer)($v1)
/* 7C980 8007BD80 00021840 */  sll        $v1, $v0, 1
/* 7C984 8007BD84 00621821 */  addu       $v1, $v1, $v0
/* 7C988 8007BD88 00031880 */  sll        $v1, $v1, 2
/* 7C98C 8007BD8C 00621821 */  addu       $v1, $v1, $v0
/* 7C990 8007BD90 8CA40004 */  lw         $a0, 4($a1)
/* 7C994 8007BD94 00031880 */  sll        $v1, $v1, 2
/* 7C998 8007BD98 A6300000 */  sh         $s0, ($s1)
/* 7C99C 8007BD9C 00838021 */  addu       $s0, $a0, $v1
/* 7C9A0 8007BDA0 26020002 */  addiu      $v0, $s0, 2
/* 7C9A4 8007BDA4 AE220004 */  sw         $v0, 4($s1)
/* 7C9A8 8007BDA8 92030023 */  lbu        $v1, 0x23($s0)
/* 7C9AC 8007BDAC A2230008 */  sb         $v1, 8($s1)
/* 7C9B0 8007BDB0 96020020 */  lhu        $v0, 0x20($s0)
/* 7C9B4 8007BDB4 A622000A */  sh         $v0, 0xa($s1)
/* 7C9B8 8007BDB8 82030024 */  lb         $v1, 0x24($s0)
/* 7C9BC 8007BDBC 2412FFFF */  addiu      $s2, $zero, -1
/* 7C9C0 8007BDC0 1072000A */  beq        $v1, $s2, .L8007BDEC
/* 7C9C4 8007BDC4 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7C9C8 8007BDC8 24040002 */  addiu      $a0, $zero, 2
/* 7C9CC 8007BDCC 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7C9D0 8007BDD0 0C025F9C */  jal        Malloc
/* 7C9D4 8007BDD4 24060090 */   addiu     $a2, $zero, 0x90
/* 7C9D8 8007BDD8 AE22000C */  sw         $v0, 0xc($s1)
/* 7C9DC 8007BDDC 92050024 */  lbu        $a1, 0x24($s0)
/* 7C9E0 8007BDE0 82060025 */  lb         $a2, 0x25($s0)
/* 7C9E4 8007BDE4 0C021154 */  jal        make_2byte_array
/* 7C9E8 8007BDE8 00402021 */   addu      $a0, $v0, $zero
.L8007BDEC:
/* 7C9EC 8007BDEC 82020028 */  lb         $v0, 0x28($s0)
/* 7C9F0 8007BDF0 1052000B */  beq        $v0, $s2, .L8007BE20
/* 7C9F4 8007BDF4 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7C9F8 8007BDF8 24040008 */  addiu      $a0, $zero, 8
/* 7C9FC 8007BDFC 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7CA00 8007BE00 0C025F9C */  jal        Malloc
/* 7CA04 8007BE04 24060096 */   addiu     $a2, $zero, 0x96
/* 7CA08 8007BE08 AE220010 */  sw         $v0, 0x10($s1)
/* 7CA0C 8007BE0C 92050028 */  lbu        $a1, 0x28($s0)
/* 7CA10 8007BE10 92060029 */  lbu        $a2, 0x29($s0)
/* 7CA14 8007BE14 9207002A */  lbu        $a3, 0x2a($s0)
/* 7CA18 8007BE18 0C021060 */  jal        malloc_equip_spell
/* 7CA1C 8007BE1C 00402021 */   addu      $a0, $v0, $zero
.L8007BE20:
/* 7CA20 8007BE20 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7CA24 8007BE24 8FB20018 */  lw         $s2, 0x18($sp)
/* 7CA28 8007BE28 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CA2C 8007BE2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CA30 8007BE30 03E00008 */  jr         $ra
/* 7CA34 8007BE34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel make_temp_weapon
/* 7CA38 8007BE38 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7CA3C 8007BE3C AFB10014 */  sw         $s1, 0x14($sp)
/* 7CA40 8007BE40 00808821 */  addu       $s1, $a0, $zero
/* 7CA44 8007BE44 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CA48 8007BE48 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7CA4C 8007BE4C 00002821 */  addu       $a1, $zero, $zero
/* 7CA50 8007BE50 24060014 */  addiu      $a2, $zero, 0x14
/* 7CA54 8007BE54 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7CA58 8007BE58 0C026380 */  jal        Calloc
/* 7CA5C 8007BE5C AFB20018 */   sw        $s2, 0x18($sp)
/* 7CA60 8007BE60 02002021 */  addu       $a0, $s0, $zero
/* 7CA64 8007BE64 00002821 */  addu       $a1, $zero, $zero
/* 7CA68 8007BE68 0C01D77A */  jal        GetIDIndex
/* 7CA6C 8007BE6C 00003021 */   addu      $a2, $zero, $zero
/* 7CA70 8007BE70 3C03800F */  lui        $v1, %hi(weapon_pointer)
/* 7CA74 8007BE74 8C6516F0 */  lw         $a1, %lo(weapon_pointer)($v1)
/* 7CA78 8007BE78 00021840 */  sll        $v1, $v0, 1
/* 7CA7C 8007BE7C 00621821 */  addu       $v1, $v1, $v0
/* 7CA80 8007BE80 00031880 */  sll        $v1, $v1, 2
/* 7CA84 8007BE84 00621821 */  addu       $v1, $v1, $v0
/* 7CA88 8007BE88 8CA40018 */  lw         $a0, 0x18($a1)
/* 7CA8C 8007BE8C 00031880 */  sll        $v1, $v1, 2
/* 7CA90 8007BE90 A6300000 */  sh         $s0, ($s1)
/* 7CA94 8007BE94 00838021 */  addu       $s0, $a0, $v1
/* 7CA98 8007BE98 26020002 */  addiu      $v0, $s0, 2
/* 7CA9C 8007BE9C AE220004 */  sw         $v0, 4($s1)
/* 7CAA0 8007BEA0 92030023 */  lbu        $v1, 0x23($s0)
/* 7CAA4 8007BEA4 A2230008 */  sb         $v1, 8($s1)
/* 7CAA8 8007BEA8 9602001C */  lhu        $v0, 0x1c($s0)
/* 7CAAC 8007BEAC A622000A */  sh         $v0, 0xa($s1)
/* 7CAB0 8007BEB0 82030024 */  lb         $v1, 0x24($s0)
/* 7CAB4 8007BEB4 2412FFFF */  addiu      $s2, $zero, -1
/* 7CAB8 8007BEB8 1072000A */  beq        $v1, $s2, .L8007BEE4
/* 7CABC 8007BEBC 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7CAC0 8007BEC0 24040002 */  addiu      $a0, $zero, 2
/* 7CAC4 8007BEC4 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7CAC8 8007BEC8 0C025F9C */  jal        Malloc
/* 7CACC 8007BECC 240600B2 */   addiu     $a2, $zero, 0xb2
/* 7CAD0 8007BED0 AE22000C */  sw         $v0, 0xc($s1)
/* 7CAD4 8007BED4 92050024 */  lbu        $a1, 0x24($s0)
/* 7CAD8 8007BED8 82060025 */  lb         $a2, 0x25($s0)
/* 7CADC 8007BEDC 0C021154 */  jal        make_2byte_array
/* 7CAE0 8007BEE0 00402021 */   addu      $a0, $v0, $zero
.L8007BEE4:
/* 7CAE4 8007BEE4 82020028 */  lb         $v0, 0x28($s0)
/* 7CAE8 8007BEE8 1052000B */  beq        $v0, $s2, .L8007BF18
/* 7CAEC 8007BEEC 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7CAF0 8007BEF0 24040008 */  addiu      $a0, $zero, 8
/* 7CAF4 8007BEF4 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7CAF8 8007BEF8 0C025F9C */  jal        Malloc
/* 7CAFC 8007BEFC 240600B8 */   addiu     $a2, $zero, 0xb8
/* 7CB00 8007BF00 AE220010 */  sw         $v0, 0x10($s1)
/* 7CB04 8007BF04 92050028 */  lbu        $a1, 0x28($s0)
/* 7CB08 8007BF08 92060029 */  lbu        $a2, 0x29($s0)
/* 7CB0C 8007BF0C 9207001E */  lbu        $a3, 0x1e($s0)
/* 7CB10 8007BF10 0C021060 */  jal        malloc_equip_spell
/* 7CB14 8007BF14 00402021 */   addu      $a0, $v0, $zero
.L8007BF18:
/* 7CB18 8007BF18 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7CB1C 8007BF1C 8FB20018 */  lw         $s2, 0x18($sp)
/* 7CB20 8007BF20 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CB24 8007BF24 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CB28 8007BF28 03E00008 */  jr         $ra
/* 7CB2C 8007BF2C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel make_temp_potion
/* 7CB30 8007BF30 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7CB34 8007BF34 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CB38 8007BF38 00808021 */  addu       $s0, $a0, $zero
/* 7CB3C 8007BF3C AFB10014 */  sw         $s1, 0x14($sp)
/* 7CB40 8007BF40 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 7CB44 8007BF44 00002821 */  addu       $a1, $zero, $zero
/* 7CB48 8007BF48 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7CB4C 8007BF4C 0C026380 */  jal        Calloc
/* 7CB50 8007BF50 24060014 */   addiu     $a2, $zero, 0x14
/* 7CB54 8007BF54 02202021 */  addu       $a0, $s1, $zero
/* 7CB58 8007BF58 00002821 */  addu       $a1, $zero, $zero
/* 7CB5C 8007BF5C 0C01D77A */  jal        GetIDIndex
/* 7CB60 8007BF60 00003021 */   addu      $a2, $zero, $zero
/* 7CB64 8007BF64 3C03800F */  lui        $v1, %hi(potion_names)
/* 7CB68 8007BF68 00022080 */  sll        $a0, $v0, 2
/* 7CB6C 8007BF6C 8C651B30 */  lw         $a1, %lo(potion_names)($v1)
/* 7CB70 8007BF70 3C03800F */  lui        $v1, %hi(potion_prices)
/* 7CB74 8007BF74 24631820 */  addiu      $v1, $v1, %lo(potion_prices)
/* 7CB78 8007BF78 00021040 */  sll        $v0, $v0, 1
/* 7CB7C 8007BF7C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7CB80 8007BF80 00431021 */  addu       $v0, $v0, $v1
/* 7CB84 8007BF84 A6110000 */  sh         $s1, ($s0)
/* 7CB88 8007BF88 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CB8C 8007BF8C 00852021 */  addu       $a0, $a0, $a1
/* 7CB90 8007BF90 94450000 */  lhu        $a1, ($v0)
/* 7CB94 8007BF94 8C820000 */  lw         $v0, ($a0)
/* 7CB98 8007BF98 A605000A */  sh         $a1, 0xa($s0)
/* 7CB9C 8007BF9C AE020004 */  sw         $v0, 4($s0)
/* 7CBA0 8007BFA0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CBA4 8007BFA4 03E00008 */  jr         $ra
/* 7CBA8 8007BFA8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel make_temp_gear
/* 7CBAC 8007BFAC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7CBB0 8007BFB0 AFB10014 */  sw         $s1, 0x14($sp)
/* 7CBB4 8007BFB4 00808821 */  addu       $s1, $a0, $zero
/* 7CBB8 8007BFB8 AFB00010 */  sw         $s0, 0x10($sp)
/* 7CBBC 8007BFBC 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7CBC0 8007BFC0 00002821 */  addu       $a1, $zero, $zero
/* 7CBC4 8007BFC4 24060014 */  addiu      $a2, $zero, 0x14
/* 7CBC8 8007BFC8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7CBCC 8007BFCC 0C026380 */  jal        Calloc
/* 7CBD0 8007BFD0 AFB20018 */   sw        $s2, 0x18($sp)
/* 7CBD4 8007BFD4 0C01D7C6 */  jal        search_item_array
/* 7CBD8 8007BFD8 02002021 */   addu      $a0, $s0, $zero
/* 7CBDC 8007BFDC 3C03800F */  lui        $v1, %hi(item_pointer)
/* 7CBE0 8007BFE0 8C6514F0 */  lw         $a1, %lo(item_pointer)($v1)
/* 7CBE4 8007BFE4 00021840 */  sll        $v1, $v0, 1
/* 7CBE8 8007BFE8 00621821 */  addu       $v1, $v1, $v0
/* 7CBEC 8007BFEC 8CA40018 */  lw         $a0, 0x18($a1)
/* 7CBF0 8007BFF0 00031900 */  sll        $v1, $v1, 4
/* 7CBF4 8007BFF4 A6300000 */  sh         $s0, ($s1)
/* 7CBF8 8007BFF8 00838021 */  addu       $s0, $a0, $v1
/* 7CBFC 8007BFFC 26020002 */  addiu      $v0, $s0, 2
/* 7CC00 8007C000 AE220004 */  sw         $v0, 4($s1)
/* 7CC04 8007C004 92030020 */  lbu        $v1, 0x20($s0)
/* 7CC08 8007C008 A2230008 */  sb         $v1, 8($s1)
/* 7CC0C 8007C00C 9602001E */  lhu        $v0, 0x1e($s0)
/* 7CC10 8007C010 A622000A */  sh         $v0, 0xa($s1)
/* 7CC14 8007C014 82030021 */  lb         $v1, 0x21($s0)
/* 7CC18 8007C018 2412FFFF */  addiu      $s2, $zero, -1
/* 7CC1C 8007C01C 1072000A */  beq        $v1, $s2, .L8007C048
/* 7CC20 8007C020 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7CC24 8007C024 24040002 */  addiu      $a0, $zero, 2
/* 7CC28 8007C028 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7CC2C 8007C02C 0C025F9C */  jal        Malloc
/* 7CC30 8007C030 240600E8 */   addiu     $a2, $zero, 0xe8
/* 7CC34 8007C034 AE22000C */  sw         $v0, 0xc($s1)
/* 7CC38 8007C038 92050021 */  lbu        $a1, 0x21($s0)
/* 7CC3C 8007C03C 82060022 */  lb         $a2, 0x22($s0)
/* 7CC40 8007C040 0C021154 */  jal        make_2byte_array
/* 7CC44 8007C044 00402021 */   addu      $a0, $v0, $zero
.L8007C048:
/* 7CC48 8007C048 82020025 */  lb         $v0, 0x25($s0)
/* 7CC4C 8007C04C 1052000B */  beq        $v0, $s2, .L8007C07C
/* 7CC50 8007C050 3C05800E */   lui       $a1, %hi(D_800E08C0)
/* 7CC54 8007C054 24040008 */  addiu      $a0, $zero, 8
/* 7CC58 8007C058 24A508C0 */  addiu      $a1, $a1, %lo(D_800E08C0)
/* 7CC5C 8007C05C 0C025F9C */  jal        Malloc
/* 7CC60 8007C060 240600EE */   addiu     $a2, $zero, 0xee
/* 7CC64 8007C064 AE220010 */  sw         $v0, 0x10($s1)
/* 7CC68 8007C068 92050025 */  lbu        $a1, 0x25($s0)
/* 7CC6C 8007C06C 92060026 */  lbu        $a2, 0x26($s0)
/* 7CC70 8007C070 92070027 */  lbu        $a3, 0x27($s0)
/* 7CC74 8007C074 0C021060 */  jal        malloc_equip_spell
/* 7CC78 8007C078 00402021 */   addu      $a0, $v0, $zero
.L8007C07C:
/* 7CC7C 8007C07C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7CC80 8007C080 8FB20018 */  lw         $s2, 0x18($sp)
/* 7CC84 8007C084 8FB10014 */  lw         $s1, 0x14($sp)
/* 7CC88 8007C088 8FB00010 */  lw         $s0, 0x10($sp)
/* 7CC8C 8007C08C 03E00008 */  jr         $ra
/* 7CC90 8007C090 27BD0020 */   addiu     $sp, $sp, 0x20

glabel GetItemPrice
/* 7CC94 8007C094 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7CC98 8007C098 AFBF0010 */  sw         $ra, 0x10($sp)
/* 7CC9C 8007C09C 94830000 */  lhu        $v1, ($a0)
/* 7CCA0 8007C0A0 00031A02 */  srl        $v1, $v1, 8
/* 7CCA4 8007C0A4 2462FFFB */  addiu      $v0, $v1, -5
/* 7CCA8 8007C0A8 2C420002 */  sltiu      $v0, $v0, 2
/* 7CCAC 8007C0AC 1040000F */  beqz       $v0, .L8007C0EC
/* 7CCB0 8007C0B0 00002821 */   addu      $a1, $zero, $zero
/* 7CCB4 8007C0B4 94840000 */  lhu        $a0, ($a0)
/* 7CCB8 8007C0B8 0C01D77A */  jal        GetIDIndex
/* 7CCBC 8007C0BC 00003021 */   addu      $a2, $zero, $zero
/* 7CCC0 8007C0C0 3C04800F */  lui        $a0, %hi(armour_pointer)
/* 7CCC4 8007C0C4 00021840 */  sll        $v1, $v0, 1
/* 7CCC8 8007C0C8 00621821 */  addu       $v1, $v1, $v0
/* 7CCCC 8007C0CC 00031880 */  sll        $v1, $v1, 2
/* 7CCD0 8007C0D0 8C85F7B0 */  lw         $a1, %lo(armour_pointer)($a0)
/* 7CCD4 8007C0D4 00621821 */  addu       $v1, $v1, $v0
/* 7CCD8 8007C0D8 8CA40004 */  lw         $a0, 4($a1)
/* 7CCDC 8007C0DC 00031880 */  sll        $v1, $v1, 2
/* 7CCE0 8007C0E0 00832021 */  addu       $a0, $a0, $v1
/* 7CCE4 8007C0E4 0801F062 */  j          .L8007C188
/* 7CCE8 8007C0E8 94820020 */   lhu       $v0, 0x20($a0)
.L8007C0EC:
/* 7CCEC 8007C0EC 24020007 */  addiu      $v0, $zero, 7
/* 7CCF0 8007C0F0 54620010 */  bnel       $v1, $v0, .L8007C134
/* 7CCF4 8007C0F4 24020010 */   addiu     $v0, $zero, 0x10
/* 7CCF8 8007C0F8 00002821 */  addu       $a1, $zero, $zero
/* 7CCFC 8007C0FC 94840000 */  lhu        $a0, ($a0)
/* 7CD00 8007C100 0C01D77A */  jal        GetIDIndex
/* 7CD04 8007C104 00003021 */   addu      $a2, $zero, $zero
/* 7CD08 8007C108 3C04800F */  lui        $a0, %hi(weapon_pointer)
/* 7CD0C 8007C10C 00021840 */  sll        $v1, $v0, 1
/* 7CD10 8007C110 00621821 */  addu       $v1, $v1, $v0
/* 7CD14 8007C114 00031880 */  sll        $v1, $v1, 2
/* 7CD18 8007C118 8C8516F0 */  lw         $a1, %lo(weapon_pointer)($a0)
/* 7CD1C 8007C11C 00621821 */  addu       $v1, $v1, $v0
/* 7CD20 8007C120 8CA40018 */  lw         $a0, 0x18($a1)
/* 7CD24 8007C124 00031880 */  sll        $v1, $v1, 2
/* 7CD28 8007C128 00832021 */  addu       $a0, $a0, $v1
/* 7CD2C 8007C12C 0801F062 */  j          .L8007C188
/* 7CD30 8007C130 9482001C */   lhu       $v0, 0x1c($a0)
.L8007C134:
/* 7CD34 8007C134 1062000C */  beq        $v1, $v0, .L8007C168
/* 7CD38 8007C138 00002821 */   addu      $a1, $zero, $zero
/* 7CD3C 8007C13C 0C01D7C6 */  jal        search_item_array
/* 7CD40 8007C140 94840000 */   lhu       $a0, ($a0)
/* 7CD44 8007C144 3C03800F */  lui        $v1, %hi(item_pointer)
/* 7CD48 8007C148 00022040 */  sll        $a0, $v0, 1
/* 7CD4C 8007C14C 8C6514F0 */  lw         $a1, %lo(item_pointer)($v1)
/* 7CD50 8007C150 00822021 */  addu       $a0, $a0, $v0
/* 7CD54 8007C154 8CA30018 */  lw         $v1, 0x18($a1)
/* 7CD58 8007C158 00042100 */  sll        $a0, $a0, 4
/* 7CD5C 8007C15C 00641821 */  addu       $v1, $v1, $a0
/* 7CD60 8007C160 0801F062 */  j          .L8007C188
/* 7CD64 8007C164 9462001E */   lhu       $v0, 0x1e($v1)
.L8007C168:
/* 7CD68 8007C168 94840000 */  lhu        $a0, ($a0)
/* 7CD6C 8007C16C 0C01D77A */  jal        GetIDIndex
/* 7CD70 8007C170 00003021 */   addu      $a2, $zero, $zero
/* 7CD74 8007C174 3C03800F */  lui        $v1, %hi(potion_prices)
/* 7CD78 8007C178 24631820 */  addiu      $v1, $v1, %lo(potion_prices)
/* 7CD7C 8007C17C 00021040 */  sll        $v0, $v0, 1
/* 7CD80 8007C180 00431021 */  addu       $v0, $v0, $v1
/* 7CD84 8007C184 94420000 */  lhu        $v0, ($v0)
.L8007C188:
/* 7CD88 8007C188 8FBF0010 */  lw         $ra, 0x10($sp)
/* 7CD8C 8007C18C 03E00008 */  jr         $ra
/* 7CD90 8007C190 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007C194
/* 7CD94 8007C194 00052E00 */  sll        $a1, $a1, 0x18
/* 7CD98 8007C198 00052E03 */  sra        $a1, $a1, 0x18
/* 7CD9C 8007C19C 2402FFFF */  addiu      $v0, $zero, -1
/* 7CDA0 8007C1A0 10A20004 */  beq        $a1, $v0, .L8007C1B4
/* 7CDA4 8007C1A4 00000000 */   nop
/* 7CDA8 8007C1A8 8C840010 */  lw         $a0, 0x10($a0)
/* 7CDAC 8007C1AC 54800001 */  bnel       $a0, $zero, .L8007C1B4
/* 7CDB0 8007C1B0 A0850004 */   sb        $a1, 4($a0)
.L8007C1B4:
/* 7CDB4 8007C1B4 03E00008 */  jr         $ra
/* 7CDB8 8007C1B8 00000000 */   nop
/* 7CDBC 8007C1BC 00000000 */  nop
