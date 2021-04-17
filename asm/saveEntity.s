.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel saveentity_init
/* 1C890 8001BC90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1C894 8001BC94 24040024 */  addiu      $a0, $zero, 0x24
/* 1C898 8001BC98 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1C89C 8001BC9C 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1C8A0 8001BCA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1C8A4 8001BCA4 0C025F9C */  jal        Malloc
/* 1C8A8 8001BCA8 24060051 */   addiu     $a2, $zero, 0x51
/* 1C8AC 8001BCAC 3C03800F */  lui        $v1, %hi(saveentity_pointer)
/* 1C8B0 8001BCB0 00402021 */  addu       $a0, $v0, $zero
/* 1C8B4 8001BCB4 00002821 */  addu       $a1, $zero, $zero
/* 1C8B8 8001BCB8 24060024 */  addiu      $a2, $zero, 0x24
/* 1C8BC 8001BCBC 0C026380 */  jal        Calloc
/* 1C8C0 8001BCC0 AC628F10 */   sw        $v0, %lo(saveentity_pointer)($v1)
/* 1C8C4 8001BCC4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1C8C8 8001BCC8 03E00008 */  jr         $ra
/* 1C8CC 8001BCCC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel saveentity_free
/* 1C8D0 8001BCD0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1C8D4 8001BCD4 AFB10014 */  sw         $s1, 0x14($sp)
/* 1C8D8 8001BCD8 00008821 */  addu       $s1, $zero, $zero
/* 1C8DC 8001BCDC AFB20018 */  sw         $s2, 0x18($sp)
/* 1C8E0 8001BCE0 3C12800F */  lui        $s2, %hi(saveentity_pointer)
/* 1C8E4 8001BCE4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1C8E8 8001BCE8 3C13800E */  lui        $s3, 0x800e
/* 1C8EC 8001BCEC AFBF0020 */  sw         $ra, 0x20($sp)
/* 1C8F0 8001BCF0 AFB00010 */  sw         $s0, 0x10($sp)
/* 1C8F4 8001BCF4 8E428F10 */  lw         $v0, %lo(saveentity_pointer)($s2)
.L8001BCF8:
/* 1C8F8 8001BCF8 00118080 */  sll        $s0, $s1, 2
/* 1C8FC 8001BCFC 02021021 */  addu       $v0, $s0, $v0
/* 1C900 8001BD00 8C440000 */  lw         $a0, ($v0)
/* 1C904 8001BD04 1080000D */  beqz       $a0, .L8001BD3C
/* 1C908 8001BD08 26220001 */   addiu     $v0, $s1, 1
/* 1C90C 8001BD0C 0C01DE3D */  jal        CharSheet_free
/* 1C910 8001BD10 00000000 */   nop
/* 1C914 8001BD14 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1C918 8001BD18 266596E0 */  addiu      $a1, $s3, -0x6920
/* 1C91C 8001BD1C 02021021 */  addu       $v0, $s0, $v0
/* 1C920 8001BD20 8C440000 */  lw         $a0, ($v0)
/* 1C924 8001BD24 0C02600C */  jal        Free
/* 1C928 8001BD28 2406006F */   addiu     $a2, $zero, 0x6f
/* 1C92C 8001BD2C 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1C930 8001BD30 02021021 */  addu       $v0, $s0, $v0
/* 1C934 8001BD34 AC400000 */  sw         $zero, ($v0)
/* 1C938 8001BD38 26220001 */  addiu      $v0, $s1, 1
.L8001BD3C:
/* 1C93C 8001BD3C 305100FF */  andi       $s1, $v0, 0xff
/* 1C940 8001BD40 2E230009 */  sltiu      $v1, $s1, 9
/* 1C944 8001BD44 1460FFEC */  bnez       $v1, .L8001BCF8
/* 1C948 8001BD48 8E428F10 */   lw        $v0, -0x70f0($s2)
/* 1C94C 8001BD4C 266596E0 */  addiu      $a1, $s3, -0x6920
/* 1C950 8001BD50 8E448F10 */  lw         $a0, -0x70f0($s2)
/* 1C954 8001BD54 0C02600C */  jal        Free
/* 1C958 8001BD58 24060074 */   addiu     $a2, $zero, 0x74
/* 1C95C 8001BD5C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1C960 8001BD60 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1C964 8001BD64 AE408F10 */  sw         $zero, -0x70f0($s2)
/* 1C968 8001BD68 8FB20018 */  lw         $s2, 0x18($sp)
/* 1C96C 8001BD6C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1C970 8001BD70 8FB00010 */  lw         $s0, 0x10($sp)
/* 1C974 8001BD74 03E00008 */  jr         $ra
/* 1C978 8001BD78 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8001BD7C
/* 1C97C 8001BD7C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1C980 8001BD80 AFB40020 */  sw         $s4, 0x20($sp)
/* 1C984 8001BD84 0080A021 */  addu       $s4, $a0, $zero
/* 1C988 8001BD88 AFBF0024 */  sw         $ra, 0x24($sp)
/* 1C98C 8001BD8C AFB3001C */  sw         $s3, 0x1c($sp)
/* 1C990 8001BD90 AFB20018 */  sw         $s2, 0x18($sp)
/* 1C994 8001BD94 AFB10014 */  sw         $s1, 0x14($sp)
/* 1C998 8001BD98 0C00718D */  jal        noop
/* 1C99C 8001BD9C AFB00010 */   sw        $s0, 0x10($sp)
/* 1C9A0 8001BDA0 00009821 */  addu       $s3, $zero, $zero
/* 1C9A4 8001BDA4 3C12800F */  lui        $s2, 0x800f
/* 1C9A8 8001BDA8 00131880 */  sll        $v1, $s3, 2
.L8001BDAC:
/* 1C9AC 8001BDAC 02831021 */  addu       $v0, $s4, $v1
/* 1C9B0 8001BDB0 8C500000 */  lw         $s0, ($v0)
/* 1C9B4 8001BDB4 1600000C */  bnez       $s0, .L8001BDE8
/* 1C9B8 8001BDB8 00608821 */   addu      $s1, $v1, $zero
/* 1C9BC 8001BDBC 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1C9C0 8001BDC0 02221021 */  addu       $v0, $s1, $v0
/* 1C9C4 8001BDC4 8C440000 */  lw         $a0, ($v0)
/* 1C9C8 8001BDC8 10800025 */  beqz       $a0, .L8001BE60
/* 1C9CC 8001BDCC 26620001 */   addiu     $v0, $s3, 1
/* 1C9D0 8001BDD0 0C01DE3D */  jal        CharSheet_free
/* 1C9D4 8001BDD4 00000000 */   nop
/* 1C9D8 8001BDD8 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1C9DC 8001BDDC 02221021 */  addu       $v0, $s1, $v0
/* 1C9E0 8001BDE0 08006F97 */  j          .L8001BE5C
/* 1C9E4 8001BDE4 AC400000 */   sw        $zero, ($v0)
.L8001BDE8:
/* 1C9E8 8001BDE8 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1C9EC 8001BDEC 02221021 */  addu       $v0, $s1, $v0
/* 1C9F0 8001BDF0 8C440000 */  lw         $a0, ($v0)
/* 1C9F4 8001BDF4 54800007 */  bnel       $a0, $zero, .L8001BE14
/* 1C9F8 8001BDF8 94830000 */   lhu       $v1, ($a0)
/* 1C9FC 8001BDFC 0C007017 */  jal        func_8001C05C
/* 1CA00 8001BE00 96040000 */   lhu       $a0, ($s0)
/* 1CA04 8001BE04 8E438F10 */  lw         $v1, -0x70f0($s2)
/* 1CA08 8001BE08 02231821 */  addu       $v1, $s1, $v1
/* 1CA0C 8001BE0C 08006F90 */  j          .L8001BE40
/* 1CA10 8001BE10 AC620000 */   sw        $v0, ($v1)
.L8001BE14:
/* 1CA14 8001BE14 96020000 */  lhu        $v0, ($s0)
/* 1CA18 8001BE18 1062000A */  beq        $v1, $v0, .L8001BE44
/* 1CA1C 8001BE1C 8E428F10 */   lw        $v0, -0x70f0($s2)
/* 1CA20 8001BE20 0C01DE3D */  jal        CharSheet_free
/* 1CA24 8001BE24 00000000 */   nop
/* 1CA28 8001BE28 8E428F10 */  lw         $v0, -0x70f0($s2)
/* 1CA2C 8001BE2C 96050000 */  lhu        $a1, ($s0)
/* 1CA30 8001BE30 02221021 */  addu       $v0, $s1, $v0
/* 1CA34 8001BE34 8C440000 */  lw         $a0, ($v0)
/* 1CA38 8001BE38 0C01DD95 */  jal        create_CharSheet
/* 1CA3C 8001BE3C 24060003 */   addiu     $a2, $zero, 3
.L8001BE40:
/* 1CA40 8001BE40 8E428F10 */  lw         $v0, -0x70f0($s2)
.L8001BE44:
/* 1CA44 8001BE44 02221021 */  addu       $v0, $s1, $v0
/* 1CA48 8001BE48 8C450000 */  lw         $a1, ($v0)
/* 1CA4C 8001BE4C 0C007117 */  jal        copyCharSheet
/* 1CA50 8001BE50 02002021 */   addu      $a0, $s0, $zero
/* 1CA54 8001BE54 0C00714B */  jal        caseSwitch_copy_char_2
/* 1CA58 8001BE58 02002021 */   addu      $a0, $s0, $zero
.L8001BE5C:
/* 1CA5C 8001BE5C 26620001 */  addiu      $v0, $s3, 1
.L8001BE60:
/* 1CA60 8001BE60 305300FF */  andi       $s3, $v0, 0xff
/* 1CA64 8001BE64 2E630004 */  sltiu      $v1, $s3, 4
/* 1CA68 8001BE68 5460FFD0 */  bnel       $v1, $zero, .L8001BDAC
/* 1CA6C 8001BE6C 00131880 */   sll       $v1, $s3, 2
/* 1CA70 8001BE70 8FBF0024 */  lw         $ra, 0x24($sp)
/* 1CA74 8001BE74 8FB40020 */  lw         $s4, 0x20($sp)
/* 1CA78 8001BE78 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1CA7C 8001BE7C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1CA80 8001BE80 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CA84 8001BE84 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CA88 8001BE88 03E00008 */  jr         $ra
/* 1CA8C 8001BE8C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8001BE90
/* 1CA90 8001BE90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1CA94 8001BE94 AFB00010 */  sw         $s0, 0x10($sp)
/* 1CA98 8001BE98 AFBF0014 */  sw         $ra, 0x14($sp)
/* 1CA9C 8001BE9C 0C00718D */  jal        noop
/* 1CAA0 8001BEA0 3090FFFF */   andi      $s0, $a0, 0xffff
/* 1CAA4 8001BEA4 3C02800F */  lui        $v0, %hi(saveentity_pointer)
/* 1CAA8 8001BEA8 00108080 */  sll        $s0, $s0, 2
/* 1CAAC 8001BEAC 8C438F10 */  lw         $v1, %lo(saveentity_pointer)($v0)
/* 1CAB0 8001BEB0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1CAB4 8001BEB4 02038021 */  addu       $s0, $s0, $v1
/* 1CAB8 8001BEB8 8E020000 */  lw         $v0, ($s0)
/* 1CABC 8001BEBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CAC0 8001BEC0 03E00008 */  jr         $ra
/* 1CAC4 8001BEC4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001BEC8
/* 1CAC8 8001BEC8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1CACC 8001BECC AFB00010 */  sw         $s0, 0x10($sp)
/* 1CAD0 8001BED0 3090FFFF */  andi       $s0, $a0, 0xffff
/* 1CAD4 8001BED4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1CAD8 8001BED8 0C00718D */  jal        noop
/* 1CADC 8001BEDC AFB10014 */   sw        $s1, 0x14($sp)
/* 1CAE0 8001BEE0 3C11800F */  lui        $s1, %hi(saveentity_pointer)
/* 1CAE4 8001BEE4 8E228F10 */  lw         $v0, %lo(saveentity_pointer)($s1)
/* 1CAE8 8001BEE8 00108080 */  sll        $s0, $s0, 2
/* 1CAEC 8001BEEC 02021021 */  addu       $v0, $s0, $v0
/* 1CAF0 8001BEF0 8C440000 */  lw         $a0, ($v0)
/* 1CAF4 8001BEF4 1080000E */  beqz       $a0, .L8001BF30
/* 1CAF8 8001BEF8 8FBF0018 */   lw        $ra, 0x18($sp)
/* 1CAFC 8001BEFC 0C01DE3D */  jal        CharSheet_free
/* 1CB00 8001BF00 00000000 */   nop
/* 1CB04 8001BF04 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CB08 8001BF08 8E228F10 */  lw         $v0, -0x70f0($s1)
/* 1CB0C 8001BF0C 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CB10 8001BF10 02021021 */  addu       $v0, $s0, $v0
/* 1CB14 8001BF14 8C440000 */  lw         $a0, ($v0)
/* 1CB18 8001BF18 0C02600C */  jal        Free
/* 1CB1C 8001BF1C 240600CD */   addiu     $a2, $zero, 0xcd
/* 1CB20 8001BF20 8E228F10 */  lw         $v0, -0x70f0($s1)
/* 1CB24 8001BF24 02021021 */  addu       $v0, $s0, $v0
/* 1CB28 8001BF28 AC400000 */  sw         $zero, ($v0)
/* 1CB2C 8001BF2C 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001BF30:
/* 1CB30 8001BF30 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CB34 8001BF34 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CB38 8001BF38 03E00008 */  jr         $ra
/* 1CB3C 8001BF3C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001BF40
/* 1CB40 8001BF40 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1CB44 8001BF44 AFB10014 */  sw         $s1, 0x14($sp)
/* 1CB48 8001BF48 00808821 */  addu       $s1, $a0, $zero
/* 1CB4C 8001BF4C AFB00010 */  sw         $s0, 0x10($sp)
/* 1CB50 8001BF50 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1CB54 8001BF54 0C00718D */  jal        noop
/* 1CB58 8001BF58 30B0FFFF */   andi      $s0, $a1, 0xffff
/* 1CB5C 8001BF5C 0C006FB2 */  jal        func_8001BEC8
/* 1CB60 8001BF60 02002021 */   addu      $a0, $s0, $zero
/* 1CB64 8001BF64 3C02800F */  lui        $v0, %hi(saveentity_pointer)
/* 1CB68 8001BF68 00108080 */  sll        $s0, $s0, 2
/* 1CB6C 8001BF6C 8C438F10 */  lw         $v1, %lo(saveentity_pointer)($v0)
/* 1CB70 8001BF70 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1CB74 8001BF74 02038021 */  addu       $s0, $s0, $v1
/* 1CB78 8001BF78 AE110000 */  sw         $s1, ($s0)
/* 1CB7C 8001BF7C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CB80 8001BF80 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CB84 8001BF84 03E00008 */  jr         $ra
/* 1CB88 8001BF88 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001BF8C
/* 1CB8C 8001BF8C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1CB90 8001BF90 AFB10014 */  sw         $s1, 0x14($sp)
/* 1CB94 8001BF94 3091FFFF */  andi       $s1, $a0, 0xffff
/* 1CB98 8001BF98 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1CB9C 8001BF9C AFB20018 */  sw         $s2, 0x18($sp)
/* 1CBA0 8001BFA0 0C00718D */  jal        noop
/* 1CBA4 8001BFA4 AFB00010 */   sw        $s0, 0x10($sp)
/* 1CBA8 8001BFA8 00008021 */  addu       $s0, $zero, $zero
/* 1CBAC 8001BFAC 3C12800F */  lui        $s2, %hi(saveentity_pointer)
/* 1CBB0 8001BFB0 8E438F10 */  lw         $v1, %lo(saveentity_pointer)($s2)
.L8001BFB4:
/* 1CBB4 8001BFB4 00101080 */  sll        $v0, $s0, 2
/* 1CBB8 8001BFB8 00431021 */  addu       $v0, $v0, $v1
/* 1CBBC 8001BFBC 8C420000 */  lw         $v0, ($v0)
/* 1CBC0 8001BFC0 50400007 */  beql       $v0, $zero, .L8001BFE0
/* 1CBC4 8001BFC4 26100001 */   addiu     $s0, $s0, 1
/* 1CBC8 8001BFC8 94420000 */  lhu        $v0, ($v0)
/* 1CBCC 8001BFCC 54510004 */  bnel       $v0, $s1, .L8001BFE0
/* 1CBD0 8001BFD0 26100001 */   addiu     $s0, $s0, 1
/* 1CBD4 8001BFD4 0C006FB2 */  jal        func_8001BEC8
/* 1CBD8 8001BFD8 3204FFFF */   andi      $a0, $s0, 0xffff
/* 1CBDC 8001BFDC 26100001 */  addiu      $s0, $s0, 1
.L8001BFE0:
/* 1CBE0 8001BFE0 2E020009 */  sltiu      $v0, $s0, 9
/* 1CBE4 8001BFE4 1440FFF3 */  bnez       $v0, .L8001BFB4
/* 1CBE8 8001BFE8 8E438F10 */   lw        $v1, -0x70f0($s2)
/* 1CBEC 8001BFEC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1CBF0 8001BFF0 8FB20018 */  lw         $s2, 0x18($sp)
/* 1CBF4 8001BFF4 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CBF8 8001BFF8 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CBFC 8001BFFC 03E00008 */  jr         $ra
/* 1CC00 8001C000 27BD0020 */   addiu     $sp, $sp, 0x20

glabel caseSwitch_copy_char
/* 1CC04 8001C004 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1CC08 8001C008 AFB00010 */  sw         $s0, 0x10($sp)
/* 1CC0C 8001C00C AFBF0014 */  sw         $ra, 0x14($sp)
/* 1CC10 8001C010 0C00718D */  jal        noop
/* 1CC14 8001C014 00808021 */   addu      $s0, $a0, $zero
/* 1CC18 8001C018 0C00716F */  jal        party_member_caseSwitch
/* 1CC1C 8001C01C 96040000 */   lhu       $a0, ($s0)
/* 1CC20 8001C020 304300FF */  andi       $v1, $v0, 0xff
/* 1CC24 8001C024 10600009 */  beqz       $v1, .L8001C04C
/* 1CC28 8001C028 3C02800F */   lui       $v0, %hi(saveentity_pointer)
/* 1CC2C 8001C02C 8C448F10 */  lw         $a0, %lo(saveentity_pointer)($v0)
/* 1CC30 8001C030 00031880 */  sll        $v1, $v1, 2
/* 1CC34 8001C034 00641821 */  addu       $v1, $v1, $a0
/* 1CC38 8001C038 8C640000 */  lw         $a0, ($v1)
/* 1CC3C 8001C03C 10800004 */  beqz       $a0, .L8001C050
/* 1CC40 8001C040 8FBF0014 */   lw        $ra, 0x14($sp)
/* 1CC44 8001C044 0C007117 */  jal        copyCharSheet
/* 1CC48 8001C048 02002821 */   addu      $a1, $s0, $zero
.L8001C04C:
/* 1CC4C 8001C04C 8FBF0014 */  lw         $ra, 0x14($sp)
.L8001C050:
/* 1CC50 8001C050 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CC54 8001C054 03E00008 */  jr         $ra
/* 1CC58 8001C058 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8001C05C
/* 1CC5C 8001C05C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1CC60 8001C060 AFB00010 */  sw         $s0, 0x10($sp)
/* 1CC64 8001C064 3090FFFF */  andi       $s0, $a0, 0xffff
/* 1CC68 8001C068 24040048 */  addiu      $a0, $zero, 0x48
/* 1CC6C 8001C06C 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CC70 8001C070 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CC74 8001C074 24060126 */  addiu      $a2, $zero, 0x126
/* 1CC78 8001C078 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1CC7C 8001C07C 0C025F9C */  jal        Malloc
/* 1CC80 8001C080 AFB10014 */   sw        $s1, 0x14($sp)
/* 1CC84 8001C084 00408821 */  addu       $s1, $v0, $zero
/* 1CC88 8001C088 02202021 */  addu       $a0, $s1, $zero
/* 1CC8C 8001C08C 02002821 */  addu       $a1, $s0, $zero
/* 1CC90 8001C090 0C01DD95 */  jal        create_CharSheet
/* 1CC94 8001C094 24060003 */   addiu     $a2, $zero, 3
/* 1CC98 8001C098 02201021 */  addu       $v0, $s1, $zero
/* 1CC9C 8001C09C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 1CCA0 8001C0A0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CCA4 8001C0A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CCA8 8001C0A8 03E00008 */  jr         $ra
/* 1CCAC 8001C0AC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel saveEntity_func_2
/* 1CCB0 8001C0B0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1CCB4 8001C0B4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1CCB8 8001C0B8 00A09821 */  addu       $s3, $a1, $zero
/* 1CCBC 8001C0BC 30C600FF */  andi       $a2, $a2, 0xff
/* 1CCC0 8001C0C0 AFB10014 */  sw         $s1, 0x14($sp)
/* 1CCC4 8001C0C4 00068880 */  sll        $s1, $a2, 2
/* 1CCC8 8001C0C8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 1CCCC 8001C0CC AFB20018 */  sw         $s2, 0x18($sp)
/* 1CCD0 8001C0D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 1CCD4 8001C0D4 8E630020 */  lw         $v1, 0x20($s3)
/* 1CCD8 8001C0D8 8C820020 */  lw         $v0, 0x20($a0)
/* 1CCDC 8001C0DC 02231821 */  addu       $v1, $s1, $v1
/* 1CCE0 8001C0E0 02221021 */  addu       $v0, $s1, $v0
/* 1CCE4 8001C0E4 8C700000 */  lw         $s0, ($v1)
/* 1CCE8 8001C0E8 1200000B */  beqz       $s0, .L8001C118
/* 1CCEC 8001C0EC 8C520000 */   lw        $s2, ($v0)
/* 1CCF0 8001C0F0 0C01DCC4 */  jal        pssto_clear_weapon_effects
/* 1CCF4 8001C0F4 02002021 */   addu      $a0, $s0, $zero
/* 1CCF8 8001C0F8 02002021 */  addu       $a0, $s0, $zero
/* 1CCFC 8001C0FC 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CD00 8001C100 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CD04 8001C104 0C02600C */  jal        Free
/* 1CD08 8001C108 2406013C */   addiu     $a2, $zero, 0x13c
/* 1CD0C 8001C10C 8E620020 */  lw         $v0, 0x20($s3)
/* 1CD10 8001C110 02221021 */  addu       $v0, $s1, $v0
/* 1CD14 8001C114 AC400000 */  sw         $zero, ($v0)
.L8001C118:
/* 1CD18 8001C118 12400018 */  beqz       $s2, .L8001C17C
/* 1CD1C 8001C11C 24040028 */   addiu     $a0, $zero, 0x28
/* 1CD20 8001C120 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CD24 8001C124 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CD28 8001C128 0C025F9C */  jal        Malloc
/* 1CD2C 8001C12C 24060144 */   addiu     $a2, $zero, 0x144
/* 1CD30 8001C130 00408021 */  addu       $s0, $v0, $zero
/* 1CD34 8001C134 02002021 */  addu       $a0, $s0, $zero
/* 1CD38 8001C138 8E620020 */  lw         $v0, 0x20($s3)
/* 1CD3C 8001C13C 96450000 */  lhu        $a1, ($s2)
/* 1CD40 8001C140 02221021 */  addu       $v0, $s1, $v0
/* 1CD44 8001C144 0C01DCA0 */  jal        make_temp_armor_3
/* 1CD48 8001C148 AC500000 */   sw        $s0, ($v0)
/* 1CD4C 8001C14C 8E04000C */  lw         $a0, 0xc($s0)
/* 1CD50 8001C150 50800005 */  beql       $a0, $zero, .L8001C168
/* 1CD54 8001C154 8E040010 */   lw        $a0, 0x10($s0)
/* 1CD58 8001C158 8E42000C */  lw         $v0, 0xc($s2)
/* 1CD5C 8001C15C 90430001 */  lbu        $v1, 1($v0)
/* 1CD60 8001C160 A0830001 */  sb         $v1, 1($a0)
/* 1CD64 8001C164 8E040010 */  lw         $a0, 0x10($s0)
.L8001C168:
/* 1CD68 8001C168 10800005 */  beqz       $a0, .L8001C180
/* 1CD6C 8001C16C 8FBF0020 */   lw        $ra, 0x20($sp)
/* 1CD70 8001C170 8E420010 */  lw         $v0, 0x10($s2)
/* 1CD74 8001C174 90430004 */  lbu        $v1, 4($v0)
/* 1CD78 8001C178 A0830004 */  sb         $v1, 4($a0)
.L8001C17C:
/* 1CD7C 8001C17C 8FBF0020 */  lw         $ra, 0x20($sp)
.L8001C180:
/* 1CD80 8001C180 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1CD84 8001C184 8FB20018 */  lw         $s2, 0x18($sp)
/* 1CD88 8001C188 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CD8C 8001C18C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CD90 8001C190 03E00008 */  jr         $ra
/* 1CD94 8001C194 27BD0028 */   addiu     $sp, $sp, 0x28

glabel saveEntity_func
/* 1CD98 8001C198 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1CD9C 8001C19C AFB20018 */  sw         $s2, 0x18($sp)
/* 1CDA0 8001C1A0 00A09021 */  addu       $s2, $a1, $zero
/* 1CDA4 8001C1A4 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1CDA8 8001C1A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 1CDAC 8001C1AC AFB00010 */  sw         $s0, 0x10($sp)
/* 1CDB0 8001C1B0 8E500024 */  lw         $s0, 0x24($s2)
/* 1CDB4 8001C1B4 12000009 */  beqz       $s0, .L8001C1DC
/* 1CDB8 8001C1B8 8C910024 */   lw        $s1, 0x24($a0)
/* 1CDBC 8001C1BC 0C021315 */  jal        passto_clear_weapon_effects
/* 1CDC0 8001C1C0 02002021 */   addu      $a0, $s0, $zero
/* 1CDC4 8001C1C4 02002021 */  addu       $a0, $s0, $zero
/* 1CDC8 8001C1C8 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CDCC 8001C1CC 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CDD0 8001C1D0 0C02600C */  jal        Free
/* 1CDD4 8001C1D4 24060160 */   addiu     $a2, $zero, 0x160
/* 1CDD8 8001C1D8 AE400024 */  sw         $zero, 0x24($s2)
.L8001C1DC:
/* 1CDDC 8001C1DC 12200016 */  beqz       $s1, .L8001C238
/* 1CDE0 8001C1E0 2404002C */   addiu     $a0, $zero, 0x2c
/* 1CDE4 8001C1E4 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CDE8 8001C1E8 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CDEC 8001C1EC 0C025F9C */  jal        Malloc
/* 1CDF0 8001C1F0 24060168 */   addiu     $a2, $zero, 0x168
/* 1CDF4 8001C1F4 00408021 */  addu       $s0, $v0, $zero
/* 1CDF8 8001C1F8 96250000 */  lhu        $a1, ($s1)
/* 1CDFC 8001C1FC 02002021 */  addu       $a0, $s0, $zero
/* 1CE00 8001C200 0C0212EC */  jal        createTempWeapon
/* 1CE04 8001C204 AE500024 */   sw        $s0, 0x24($s2)
/* 1CE08 8001C208 8E04000C */  lw         $a0, 0xc($s0)
/* 1CE0C 8001C20C 50800005 */  beql       $a0, $zero, .L8001C224
/* 1CE10 8001C210 8E040010 */   lw        $a0, 0x10($s0)
/* 1CE14 8001C214 8E22000C */  lw         $v0, 0xc($s1)
/* 1CE18 8001C218 90430001 */  lbu        $v1, 1($v0)
/* 1CE1C 8001C21C A0830001 */  sb         $v1, 1($a0)
/* 1CE20 8001C220 8E040010 */  lw         $a0, 0x10($s0)
.L8001C224:
/* 1CE24 8001C224 10800005 */  beqz       $a0, .L8001C23C
/* 1CE28 8001C228 8FBF001C */   lw        $ra, 0x1c($sp)
/* 1CE2C 8001C22C 8E220010 */  lw         $v0, 0x10($s1)
/* 1CE30 8001C230 90430004 */  lbu        $v1, 4($v0)
/* 1CE34 8001C234 A0830004 */  sb         $v1, 4($a0)
.L8001C238:
/* 1CE38 8001C238 8FBF001C */  lw         $ra, 0x1c($sp)
.L8001C23C:
/* 1CE3C 8001C23C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1CE40 8001C240 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CE44 8001C244 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CE48 8001C248 03E00008 */  jr         $ra
/* 1CE4C 8001C24C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001C250
/* 1CE50 8001C250 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1CE54 8001C254 30C600FF */  andi       $a2, $a2, 0xff
/* 1CE58 8001C258 AFB20018 */  sw         $s2, 0x18($sp)
/* 1CE5C 8001C25C 00069080 */  sll        $s2, $a2, 2
/* 1CE60 8001C260 AFBF0020 */  sw         $ra, 0x20($sp)
/* 1CE64 8001C264 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1CE68 8001C268 AFB10014 */  sw         $s1, 0x14($sp)
/* 1CE6C 8001C26C AFB00010 */  sw         $s0, 0x10($sp)
/* 1CE70 8001C270 8CB10028 */  lw         $s1, 0x28($a1)
/* 1CE74 8001C274 8C850028 */  lw         $a1, 0x28($a0)
/* 1CE78 8001C278 8E230000 */  lw         $v1, ($s1)
/* 1CE7C 8001C27C 8CA20000 */  lw         $v0, ($a1)
/* 1CE80 8001C280 02431821 */  addu       $v1, $s2, $v1
/* 1CE84 8001C284 02421021 */  addu       $v0, $s2, $v0
/* 1CE88 8001C288 8C700000 */  lw         $s0, ($v1)
/* 1CE8C 8001C28C 1200000E */  beqz       $s0, .L8001C2C8
/* 1CE90 8001C290 8C530000 */   lw        $s3, ($v0)
/* 1CE94 8001C294 0C01F4E2 */  jal        clear_weapon_effects
/* 1CE98 8001C298 02002021 */   addu      $a0, $s0, $zero
/* 1CE9C 8001C29C 02002021 */  addu       $a0, $s0, $zero
/* 1CEA0 8001C2A0 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CEA4 8001C2A4 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CEA8 8001C2A8 0C02600C */  jal        Free
/* 1CEAC 8001C2AC 24060185 */   addiu     $a2, $zero, 0x185
/* 1CEB0 8001C2B0 8E220000 */  lw         $v0, ($s1)
/* 1CEB4 8001C2B4 02421021 */  addu       $v0, $s2, $v0
/* 1CEB8 8001C2B8 AC400000 */  sw         $zero, ($v0)
/* 1CEBC 8001C2BC 92230004 */  lbu        $v1, 4($s1)
/* 1CEC0 8001C2C0 2463FFFF */  addiu      $v1, $v1, -1
/* 1CEC4 8001C2C4 A2230004 */  sb         $v1, 4($s1)
.L8001C2C8:
/* 1CEC8 8001C2C8 1260001B */  beqz       $s3, .L8001C338
/* 1CECC 8001C2CC 24040024 */   addiu     $a0, $zero, 0x24
/* 1CED0 8001C2D0 3C05800E */  lui        $a1, %hi(D_800D96E0)
/* 1CED4 8001C2D4 24A596E0 */  addiu      $a1, $a1, %lo(D_800D96E0)
/* 1CED8 8001C2D8 0C025F9C */  jal        Malloc
/* 1CEDC 8001C2DC 24060190 */   addiu     $a2, $zero, 0x190
/* 1CEE0 8001C2E0 00408021 */  addu       $s0, $v0, $zero
/* 1CEE4 8001C2E4 02002021 */  addu       $a0, $s0, $zero
/* 1CEE8 8001C2E8 8E220000 */  lw         $v0, ($s1)
/* 1CEEC 8001C2EC 96650000 */  lhu        $a1, ($s3)
/* 1CEF0 8001C2F0 02421021 */  addu       $v0, $s2, $v0
/* 1CEF4 8001C2F4 0C01F4B8 */  jal        make_temp_item
/* 1CEF8 8001C2F8 AC500000 */   sw        $s0, ($v0)
/* 1CEFC 8001C2FC 8E04000C */  lw         $a0, 0xc($s0)
/* 1CF00 8001C300 50800005 */  beql       $a0, $zero, .L8001C318
/* 1CF04 8001C304 8E040010 */   lw        $a0, 0x10($s0)
/* 1CF08 8001C308 8E62000C */  lw         $v0, 0xc($s3)
/* 1CF0C 8001C30C 90430001 */  lbu        $v1, 1($v0)
/* 1CF10 8001C310 A0830001 */  sb         $v1, 1($a0)
/* 1CF14 8001C314 8E040010 */  lw         $a0, 0x10($s0)
.L8001C318:
/* 1CF18 8001C318 50800005 */  beql       $a0, $zero, .L8001C330
/* 1CF1C 8001C31C 92220004 */   lbu       $v0, 4($s1)
/* 1CF20 8001C320 8E620010 */  lw         $v0, 0x10($s3)
/* 1CF24 8001C324 90430004 */  lbu        $v1, 4($v0)
/* 1CF28 8001C328 A0830004 */  sb         $v1, 4($a0)
/* 1CF2C 8001C32C 92220004 */  lbu        $v0, 4($s1)
.L8001C330:
/* 1CF30 8001C330 24420001 */  addiu      $v0, $v0, 1
/* 1CF34 8001C334 A2220004 */  sb         $v0, 4($s1)
.L8001C338:
/* 1CF38 8001C338 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1CF3C 8001C33C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1CF40 8001C340 8FB20018 */  lw         $s2, 0x18($sp)
/* 1CF44 8001C344 8FB10014 */  lw         $s1, 0x14($sp)
/* 1CF48 8001C348 8FB00010 */  lw         $s0, 0x10($sp)
/* 1CF4C 8001C34C 03E00008 */  jr         $ra
/* 1CF50 8001C350 27BD0028 */   addiu     $sp, $sp, 0x28

glabel copy_spellbook
/* 1CF54 8001C354 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1CF58 8001C358 AFBF0028 */  sw         $ra, 0x28($sp)
/* 1CF5C 8001C35C AFB50024 */  sw         $s5, 0x24($sp)
/* 1CF60 8001C360 AFB40020 */  sw         $s4, 0x20($sp)
/* 1CF64 8001C364 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1CF68 8001C368 AFB20018 */  sw         $s2, 0x18($sp)
/* 1CF6C 8001C36C AFB10014 */  sw         $s1, 0x14($sp)
/* 1CF70 8001C370 AFB00010 */  sw         $s0, 0x10($sp)
/* 1CF74 8001C374 8C94002C */  lw         $s4, 0x2c($a0)
/* 1CF78 8001C378 1280002F */  beqz       $s4, .L8001C438
/* 1CF7C 8001C37C 00A08021 */   addu      $s0, $a1, $zero
/* 1CF80 8001C380 8E13002C */  lw         $s3, 0x2c($s0)
/* 1CF84 8001C384 12600008 */  beqz       $s3, .L8001C3A8
/* 1CF88 8001C388 3C15800E */   lui       $s5, %hi(D_800D96E0)
/* 1CF8C 8001C38C 0C021122 */  jal        spellbok_free
/* 1CF90 8001C390 02602021 */   addu      $a0, $s3, $zero
/* 1CF94 8001C394 02602021 */  addu       $a0, $s3, $zero
/* 1CF98 8001C398 26A596E0 */  addiu      $a1, $s5, %lo(D_800D96E0)
/* 1CF9C 8001C39C 0C02600C */  jal        Free
/* 1CFA0 8001C3A0 240601B3 */   addiu     $a2, $zero, 0x1b3
/* 1CFA4 8001C3A4 AE00002C */  sw         $zero, 0x2c($s0)
.L8001C3A8:
/* 1CFA8 8001C3A8 24040008 */  addiu      $a0, $zero, 8
/* 1CFAC 8001C3AC 26A596E0 */  addiu      $a1, $s5, -0x6920
/* 1CFB0 8001C3B0 0C025F9C */  jal        Malloc
/* 1CFB4 8001C3B4 240601B8 */   addiu     $a2, $zero, 0x1b8
/* 1CFB8 8001C3B8 00409821 */  addu       $s3, $v0, $zero
/* 1CFBC 8001C3BC AE13002C */  sw         $s3, 0x2c($s0)
/* 1CFC0 8001C3C0 92850004 */  lbu        $a1, 4($s4)
/* 1CFC4 8001C3C4 0C021093 */  jal        malloc_spell
/* 1CFC8 8001C3C8 02602021 */   addu      $a0, $s3, $zero
/* 1CFCC 8001C3CC 92820004 */  lbu        $v0, 4($s4)
/* 1CFD0 8001C3D0 10400017 */  beqz       $v0, .L8001C430
/* 1CFD4 8001C3D4 00008821 */   addu      $s1, $zero, $zero
/* 1CFD8 8001C3D8 8E820000 */  lw         $v0, ($s4)
.L8001C3DC:
/* 1CFDC 8001C3DC 00119080 */  sll        $s2, $s1, 2
/* 1CFE0 8001C3E0 02421021 */  addu       $v0, $s2, $v0
/* 1CFE4 8001C3E4 8C500000 */  lw         $s0, ($v0)
/* 1CFE8 8001C3E8 1200000B */  beqz       $s0, .L8001C418
/* 1CFEC 8001C3EC 26A596E0 */   addiu     $a1, $s5, -0x6920
/* 1CFF0 8001C3F0 24040024 */  addiu      $a0, $zero, 0x24
/* 1CFF4 8001C3F4 0C025F9C */  jal        Malloc
/* 1CFF8 8001C3F8 240601C4 */   addiu     $a2, $zero, 0x1c4
/* 1CFFC 8001C3FC 8E630000 */  lw         $v1, ($s3)
/* 1D000 8001C400 96050000 */  lhu        $a1, ($s0)
/* 1D004 8001C404 02431821 */  addu       $v1, $s2, $v1
/* 1D008 8001C408 AC620000 */  sw         $v0, ($v1)
/* 1D00C 8001C40C 92060014 */  lbu        $a2, 0x14($s0)
/* 1D010 8001C410 0C020F94 */  jal        create_temp_spell
/* 1D014 8001C414 00402021 */   addu      $a0, $v0, $zero
.L8001C418:
/* 1D018 8001C418 26230001 */  addiu      $v1, $s1, 1
/* 1D01C 8001C41C 92820004 */  lbu        $v0, 4($s4)
/* 1D020 8001C420 307100FF */  andi       $s1, $v1, 0xff
/* 1D024 8001C424 0222102B */  sltu       $v0, $s1, $v0
/* 1D028 8001C428 5440FFEC */  bnel       $v0, $zero, .L8001C3DC
/* 1D02C 8001C42C 8E820000 */   lw        $v0, ($s4)
.L8001C430:
/* 1D030 8001C430 92820004 */  lbu        $v0, 4($s4)
/* 1D034 8001C434 A2620004 */  sb         $v0, 4($s3)
.L8001C438:
/* 1D038 8001C438 8FBF0028 */  lw         $ra, 0x28($sp)
/* 1D03C 8001C43C 8FB50024 */  lw         $s5, 0x24($sp)
/* 1D040 8001C440 8FB40020 */  lw         $s4, 0x20($sp)
/* 1D044 8001C444 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1D048 8001C448 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D04C 8001C44C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D050 8001C450 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D054 8001C454 03E00008 */  jr         $ra
/* 1D058 8001C458 27BD0030 */   addiu     $sp, $sp, 0x30

glabel copyCharSheet
/* 1D05C 8001C45C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1D060 8001C460 AFB20018 */  sw         $s2, 0x18($sp)
/* 1D064 8001C464 00809021 */  addu       $s2, $a0, $zero
/* 1D068 8001C468 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D06C 8001C46C 00A08821 */  addu       $s1, $a1, $zero
/* 1D070 8001C470 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1D074 8001C474 AFB00010 */  sw         $s0, 0x10($sp)
/* 1D078 8001C478 8E460014 */  lw         $a2, 0x14($s2)
/* 1D07C 8001C47C 8E270014 */  lw         $a3, 0x14($s1)
/* 1D080 8001C480 8E240018 */  lw         $a0, 0x18($s1)
/* 1D084 8001C484 8E450018 */  lw         $a1, 0x18($s2)
/* 1D088 8001C488 8CC20004 */  lw         $v0, 4($a2)
/* 1D08C 8001C48C ACE20004 */  sw         $v0, 4($a3)
/* 1D090 8001C490 8CC30008 */  lw         $v1, 8($a2)
/* 1D094 8001C494 0C02120D */  jal        copyCharStats
/* 1D098 8001C498 ACE30008 */   sw        $v1, 8($a3)
/* 1D09C 8001C49C 8E24001C */  lw         $a0, 0x1c($s1)
/* 1D0A0 8001C4A0 8E45001C */  lw         $a1, 0x1c($s2)
/* 1D0A4 8001C4A4 0C020DF1 */  jal        func_800837C4
/* 1D0A8 8001C4A8 00008021 */   addu      $s0, $zero, $zero
/* 1D0AC 8001C4AC 02402021 */  addu       $a0, $s2, $zero
.L8001C4B0:
/* 1D0B0 8001C4B0 02202821 */  addu       $a1, $s1, $zero
/* 1D0B4 8001C4B4 0C00702C */  jal        saveEntity_func_2
/* 1D0B8 8001C4B8 02003021 */   addu      $a2, $s0, $zero
/* 1D0BC 8001C4BC 26020001 */  addiu      $v0, $s0, 1
/* 1D0C0 8001C4C0 305000FF */  andi       $s0, $v0, 0xff
/* 1D0C4 8001C4C4 2E030002 */  sltiu      $v1, $s0, 2
/* 1D0C8 8001C4C8 1460FFF9 */  bnez       $v1, .L8001C4B0
/* 1D0CC 8001C4CC 02402021 */   addu      $a0, $s2, $zero
/* 1D0D0 8001C4D0 0C007066 */  jal        saveEntity_func
/* 1D0D4 8001C4D4 02202821 */   addu      $a1, $s1, $zero
/* 1D0D8 8001C4D8 00008021 */  addu       $s0, $zero, $zero
/* 1D0DC 8001C4DC 02402021 */  addu       $a0, $s2, $zero
.L8001C4E0:
/* 1D0E0 8001C4E0 02202821 */  addu       $a1, $s1, $zero
/* 1D0E4 8001C4E4 0C007094 */  jal        func_8001C250
/* 1D0E8 8001C4E8 02003021 */   addu      $a2, $s0, $zero
/* 1D0EC 8001C4EC 26020001 */  addiu      $v0, $s0, 1
/* 1D0F0 8001C4F0 305000FF */  andi       $s0, $v0, 0xff
/* 1D0F4 8001C4F4 2E03000C */  sltiu      $v1, $s0, 0xc
/* 1D0F8 8001C4F8 1460FFF9 */  bnez       $v1, .L8001C4E0
/* 1D0FC 8001C4FC 02402021 */   addu      $a0, $s2, $zero
/* 1D100 8001C500 0C0070D5 */  jal        copy_spellbook
/* 1D104 8001C504 02202821 */   addu      $a1, $s1, $zero
/* 1D108 8001C508 8E240004 */  lw         $a0, 4($s1)
/* 1D10C 8001C50C 0C02626C */  jal        copy_string
/* 1D110 8001C510 8E450004 */   lw        $a1, 4($s2)
/* 1D114 8001C514 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1D118 8001C518 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D11C 8001C51C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D120 8001C520 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D124 8001C524 03E00008 */  jr         $ra
/* 1D128 8001C528 27BD0020 */   addiu     $sp, $sp, 0x20

glabel caseSwitch_copy_char_2
/* 1D12C 8001C52C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1D130 8001C530 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1D134 8001C534 00809821 */  addu       $s3, $a0, $zero
/* 1D138 8001C538 AFBF0020 */  sw         $ra, 0x20($sp)
/* 1D13C 8001C53C AFB20018 */  sw         $s2, 0x18($sp)
/* 1D140 8001C540 AFB10014 */  sw         $s1, 0x14($sp)
/* 1D144 8001C544 AFB00010 */  sw         $s0, 0x10($sp)
/* 1D148 8001C548 96720000 */  lhu        $s2, ($s3)
/* 1D14C 8001C54C 0C00716F */  jal        party_member_caseSwitch
/* 1D150 8001C550 02402021 */   addu      $a0, $s2, $zero
/* 1D154 8001C554 304300FF */  andi       $v1, $v0, 0xff
/* 1D158 8001C558 10600011 */  beqz       $v1, .L8001C5A0
/* 1D15C 8001C55C 3C11800F */   lui       $s1, %hi(saveentity_pointer)
/* 1D160 8001C560 8E228F10 */  lw         $v0, %lo(saveentity_pointer)($s1)
/* 1D164 8001C564 00038080 */  sll        $s0, $v1, 2
/* 1D168 8001C568 02021021 */  addu       $v0, $s0, $v0
/* 1D16C 8001C56C 8C430000 */  lw         $v1, ($v0)
/* 1D170 8001C570 14600007 */  bnez       $v1, .L8001C590
/* 1D174 8001C574 8E228F10 */   lw        $v0, -0x70f0($s1)
/* 1D178 8001C578 0C007017 */  jal        func_8001C05C
/* 1D17C 8001C57C 02402021 */   addu      $a0, $s2, $zero
/* 1D180 8001C580 8E238F10 */  lw         $v1, -0x70f0($s1)
/* 1D184 8001C584 02031821 */  addu       $v1, $s0, $v1
/* 1D188 8001C588 AC620000 */  sw         $v0, ($v1)
/* 1D18C 8001C58C 8E228F10 */  lw         $v0, -0x70f0($s1)
.L8001C590:
/* 1D190 8001C590 02021021 */  addu       $v0, $s0, $v0
/* 1D194 8001C594 8C450000 */  lw         $a1, ($v0)
/* 1D198 8001C598 0C007117 */  jal        copyCharSheet
/* 1D19C 8001C59C 02602021 */   addu      $a0, $s3, $zero
.L8001C5A0:
/* 1D1A0 8001C5A0 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1D1A4 8001C5A4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1D1A8 8001C5A8 8FB20018 */  lw         $s2, 0x18($sp)
/* 1D1AC 8001C5AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 1D1B0 8001C5B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 1D1B4 8001C5B4 03E00008 */  jr         $ra
/* 1D1B8 8001C5B8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel party_member_caseSwitch
/* 1D1BC 8001C5BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1D1C0 8001C5C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 1D1C4 8001C5C4 3084FFFF */  andi       $a0, $a0, 0xffff
/* 1D1C8 8001C5C8 00002821 */  addu       $a1, $zero, $zero
/* 1D1CC 8001C5CC 0C01D77A */  jal        GetIDIndex
/* 1D1D0 8001C5D0 00003021 */   addu      $a2, $zero, $zero
/* 1D1D4 8001C5D4 2443FF68 */  addiu      $v1, $v0, -0x98
/* 1D1D8 8001C5D8 2C62000A */  sltiu      $v0, $v1, 0xa
/* 1D1DC 8001C5DC 10400011 */  beqz       $v0, .L8001C624
/* 1D1E0 8001C5E0 3C02800E */   lui       $v0, %hi(D_800D96F8)
/* 1D1E4 8001C5E4 244296F8 */  addiu      $v0, $v0, %lo(D_800D96F8)
/* 1D1E8 8001C5E8 00031880 */  sll        $v1, $v1, 2
/* 1D1EC 8001C5EC 00621821 */  addu       $v1, $v1, $v0
/* 1D1F0 8001C5F0 8C640000 */  lw         $a0, ($v1)
/* 1D1F4 8001C5F4 00800008 */  jr         $a0
/* 1D1F8 8001C5F8 00000000 */   nop
/* 1D1FC 8001C5FC 0800718A */  j          .L8001C628
/* 1D200 8001C600 24020004 */   addiu     $v0, $zero, 4
/* 1D204 8001C604 0800718A */  j          .L8001C628
/* 1D208 8001C608 24020005 */   addiu     $v0, $zero, 5
/* 1D20C 8001C60C 0800718A */  j          .L8001C628
/* 1D210 8001C610 24020006 */   addiu     $v0, $zero, 6
/* 1D214 8001C614 0800718A */  j          .L8001C628
/* 1D218 8001C618 24020007 */   addiu     $v0, $zero, 7
/* 1D21C 8001C61C 0800718A */  j          .L8001C628
/* 1D220 8001C620 24020008 */   addiu     $v0, $zero, 8
.L8001C624:
/* 1D224 8001C624 00001021 */  addu       $v0, $zero, $zero
.L8001C628:
/* 1D228 8001C628 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1D22C 8001C62C 03E00008 */  jr         $ra
/* 1D230 8001C630 27BD0018 */   addiu     $sp, $sp, 0x18

glabel noop
/* 1D234 8001C634 03E00008 */  jr         $ra
/* 1D238 8001C638 00000000 */   nop
/* 1D23C 8001C63C 00000000 */  nop
