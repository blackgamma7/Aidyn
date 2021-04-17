.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_party
/* 7E710 8007DB10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7E714 8007DB14 AFB00010 */  sw         $s0, 0x10($sp)
/* 7E718 8007DB18 00808021 */  addu       $s0, $a0, $zero
/* 7E71C 8007DB1C 00002821 */  addu       $a1, $zero, $zero
/* 7E720 8007DB20 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7E724 8007DB24 0C026380 */  jal        Calloc
/* 7E728 8007DB28 24060028 */   addiu     $a2, $zero, 0x28
/* 7E72C 8007DB2C 0C026259 */  jal        passToMalloc
/* 7E730 8007DB30 240417A8 */   addiu     $a0, $zero, 0x17a8
/* 7E734 8007DB34 0C01F1B4 */  jal        init_inventory
/* 7E738 8007DB38 00402021 */   addu      $a0, $v0, $zero
/* 7E73C 8007DB3C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7E740 8007DB40 AE020010 */  sw         $v0, 0x10($s0)
/* 7E744 8007DB44 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E748 8007DB48 03E00008 */  jr         $ra
/* 7E74C 8007DB4C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Party_free
/* 7E750 8007DB50 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7E754 8007DB54 AFB20018 */  sw         $s2, 0x18($sp)
/* 7E758 8007DB58 00809021 */  addu       $s2, $a0, $zero
/* 7E75C 8007DB5C AFBF0020 */  sw         $ra, 0x20($sp)
/* 7E760 8007DB60 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7E764 8007DB64 AFB10014 */  sw         $s1, 0x14($sp)
/* 7E768 8007DB68 AFB00010 */  sw         $s0, 0x10($sp)
/* 7E76C 8007DB6C 8E460010 */  lw         $a2, 0x10($s2)
/* 7E770 8007DB70 10C00007 */  beqz       $a2, .L8007DB90
/* 7E774 8007DB74 24050003 */   addiu     $a1, $zero, 3
/* 7E778 8007DB78 8CC20000 */  lw         $v0, ($a2)
/* 7E77C 8007DB7C 84440008 */  lh         $a0, 8($v0)
/* 7E780 8007DB80 8C43000C */  lw         $v1, 0xc($v0)
/* 7E784 8007DB84 0060F809 */  jalr       $v1
/* 7E788 8007DB88 00C42021 */   addu      $a0, $a2, $a0
/* 7E78C 8007DB8C AE400010 */  sw         $zero, 0x10($s2)
.L8007DB90:
/* 7E790 8007DB90 00008821 */  addu       $s1, $zero, $zero
/* 7E794 8007DB94 3C13800E */  lui        $s3, 0x800e
/* 7E798 8007DB98 00111080 */  sll        $v0, $s1, 2
.L8007DB9C:
/* 7E79C 8007DB9C 02428021 */  addu       $s0, $s2, $v0
/* 7E7A0 8007DBA0 8E040000 */  lw         $a0, ($s0)
/* 7E7A4 8007DBA4 10800009 */  beqz       $a0, .L8007DBCC
/* 7E7A8 8007DBA8 26220001 */   addiu     $v0, $s1, 1
/* 7E7AC 8007DBAC 0C01DE3D */  jal        CharSheet_free
/* 7E7B0 8007DBB0 00000000 */   nop
/* 7E7B4 8007DBB4 26650B20 */  addiu      $a1, $s3, 0xb20
/* 7E7B8 8007DBB8 8E040000 */  lw         $a0, ($s0)
/* 7E7BC 8007DBBC 0C02600C */  jal        Free
/* 7E7C0 8007DBC0 240600E8 */   addiu     $a2, $zero, 0xe8
/* 7E7C4 8007DBC4 AE000000 */  sw         $zero, ($s0)
/* 7E7C8 8007DBC8 26220001 */  addiu      $v0, $s1, 1
.L8007DBCC:
/* 7E7CC 8007DBCC 3051FFFF */  andi       $s1, $v0, 0xffff
/* 7E7D0 8007DBD0 2E230004 */  sltiu      $v1, $s1, 4
/* 7E7D4 8007DBD4 5460FFF1 */  bnel       $v1, $zero, .L8007DB9C
/* 7E7D8 8007DBD8 00111080 */   sll       $v0, $s1, 2
/* 7E7DC 8007DBDC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7E7E0 8007DBE0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7E7E4 8007DBE4 8FB20018 */  lw         $s2, 0x18($sp)
/* 7E7E8 8007DBE8 8FB10014 */  lw         $s1, 0x14($sp)
/* 7E7EC 8007DBEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 7E7F0 8007DBF0 03E00008 */  jr         $ra
/* 7E7F4 8007DBF4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_party_event_flag
/* 7E7F8 8007DBF8 27BDFF20 */  addiu      $sp, $sp, -0xe0
/* 7E7FC 8007DBFC 30A4FFFF */  andi       $a0, $a1, 0xffff
/* 7E800 8007DC00 00002821 */  addu       $a1, $zero, $zero
/* 7E804 8007DC04 AFB000D0 */  sw         $s0, 0xd0($sp)
/* 7E808 8007DC08 00C08021 */  addu       $s0, $a2, $zero
/* 7E80C 8007DC0C AFB100D4 */  sw         $s1, 0xd4($sp)
/* 7E810 8007DC10 00E08821 */  addu       $s1, $a3, $zero
/* 7E814 8007DC14 AFBF00D8 */  sw         $ra, 0xd8($sp)
/* 7E818 8007DC18 0C01D77A */  jal        GetIDIndex
/* 7E81C 8007DC1C 00003021 */   addu      $a2, $zero, $zero
/* 7E820 8007DC20 12000045 */  beqz       $s0, .L8007DD38
/* 7E824 8007DC24 00403821 */   addu      $a3, $v0, $zero
/* 7E828 8007DC28 27A40010 */  addiu      $a0, $sp, 0x10
/* 7E82C 8007DC2C 3C02800E */  lui        $v0, %hi(D_800E0B3C)
/* 7E830 8007DC30 24420B3C */  addiu      $v0, $v0, %lo(D_800E0B3C)
/* 7E834 8007DC34 30430003 */  andi       $v1, $v0, 3
/* 7E838 8007DC38 10600017 */  beqz       $v1, .L8007DC98
/* 7E83C 8007DC3C 00804021 */   addu      $t0, $a0, $zero
/* 7E840 8007DC40 24430050 */  addiu      $v1, $v0, 0x50
.L8007DC44:
/* 7E844 8007DC44 88450000 */  lwl        $a1, ($v0)
/* 7E848 8007DC48 98450003 */  lwr        $a1, 3($v0)
/* 7E84C 8007DC4C 88460004 */  lwl        $a2, 4($v0)
/* 7E850 8007DC50 98460007 */  lwr        $a2, 7($v0)
/* 7E854 8007DC54 88490008 */  lwl        $t1, 8($v0)
/* 7E858 8007DC58 9849000B */  lwr        $t1, 0xb($v0)
/* 7E85C 8007DC5C 884A000C */  lwl        $t2, 0xc($v0)
/* 7E860 8007DC60 984A000F */  lwr        $t2, 0xf($v0)
/* 7E864 8007DC64 A8850000 */  swl        $a1, ($a0)
/* 7E868 8007DC68 B8850003 */  swr        $a1, 3($a0)
/* 7E86C 8007DC6C A8860004 */  swl        $a2, 4($a0)
/* 7E870 8007DC70 B8860007 */  swr        $a2, 7($a0)
/* 7E874 8007DC74 A8890008 */  swl        $t1, 8($a0)
/* 7E878 8007DC78 B889000B */  swr        $t1, 0xb($a0)
/* 7E87C 8007DC7C A88A000C */  swl        $t2, 0xc($a0)
/* 7E880 8007DC80 B88A000F */  swr        $t2, 0xf($a0)
/* 7E884 8007DC84 24420010 */  addiu      $v0, $v0, 0x10
/* 7E888 8007DC88 1443FFEE */  bne        $v0, $v1, .L8007DC44
/* 7E88C 8007DC8C 24840010 */   addiu     $a0, $a0, 0x10
/* 7E890 8007DC90 0801F733 */  j          .L8007DCCC
/* 7E894 8007DC94 00002821 */   addu      $a1, $zero, $zero
.L8007DC98:
/* 7E898 8007DC98 24430050 */  addiu      $v1, $v0, 0x50
.L8007DC9C:
/* 7E89C 8007DC9C 8C450000 */  lw         $a1, ($v0)
/* 7E8A0 8007DCA0 8C460004 */  lw         $a2, 4($v0)
/* 7E8A4 8007DCA4 8C490008 */  lw         $t1, 8($v0)
/* 7E8A8 8007DCA8 8C4A000C */  lw         $t2, 0xc($v0)
/* 7E8AC 8007DCAC AC850000 */  sw         $a1, ($a0)
/* 7E8B0 8007DCB0 AC860004 */  sw         $a2, 4($a0)
/* 7E8B4 8007DCB4 AC890008 */  sw         $t1, 8($a0)
/* 7E8B8 8007DCB8 AC8A000C */  sw         $t2, 0xc($a0)
/* 7E8BC 8007DCBC 24420010 */  addiu      $v0, $v0, 0x10
/* 7E8C0 8007DCC0 1443FFF6 */  bne        $v0, $v1, .L8007DC9C
/* 7E8C4 8007DCC4 24840010 */   addiu     $a0, $a0, 0x10
/* 7E8C8 8007DCC8 00002821 */  addu       $a1, $zero, $zero
.L8007DCCC:
/* 7E8CC 8007DCCC 88430000 */  lwl        $v1, ($v0)
/* 7E8D0 8007DCD0 98430003 */  lwr        $v1, 3($v0)
/* 7E8D4 8007DCD4 A8830000 */  swl        $v1, ($a0)
/* 7E8D8 8007DCD8 B8830003 */  swr        $v1, 3($a0)
/* 7E8DC 8007DCDC 97A30010 */  lhu        $v1, 0x10($sp)
/* 7E8E0 8007DCE0 3402FFFF */  ori        $v0, $zero, 0xffff
/* 7E8E4 8007DCE4 10620060 */  beq        $v1, $v0, .L8007DE68
/* 7E8E8 8007DCE8 30E6FFFF */   andi      $a2, $a3, 0xffff
/* 7E8EC 8007DCEC 3407FFFF */  ori        $a3, $zero, 0xffff
/* 7E8F0 8007DCF0 01002021 */  addu       $a0, $t0, $zero
/* 7E8F4 8007DCF4 00051040 */  sll        $v0, $a1, 1
.L8007DCF8:
/* 7E8F8 8007DCF8 00451021 */  addu       $v0, $v0, $a1
/* 7E8FC 8007DCFC 00028040 */  sll        $s0, $v0, 1
/* 7E900 8007DD00 00901821 */  addu       $v1, $a0, $s0
/* 7E904 8007DD04 94620000 */  lhu        $v0, ($v1)
/* 7E908 8007DD08 10460027 */  beq        $v0, $a2, .L8007DDA8
/* 7E90C 8007DD0C 24A20001 */   addiu     $v0, $a1, 1
/* 7E910 8007DD10 3045FFFF */  andi       $a1, $v0, 0xffff
/* 7E914 8007DD14 00051840 */  sll        $v1, $a1, 1
/* 7E918 8007DD18 00651821 */  addu       $v1, $v1, $a1
/* 7E91C 8007DD1C 00031840 */  sll        $v1, $v1, 1
/* 7E920 8007DD20 00831821 */  addu       $v1, $a0, $v1
/* 7E924 8007DD24 94620000 */  lhu        $v0, ($v1)
/* 7E928 8007DD28 1447FFF3 */  bne        $v0, $a3, .L8007DCF8
/* 7E92C 8007DD2C 00051040 */   sll       $v0, $a1, 1
/* 7E930 8007DD30 0801F79B */  j          .L8007DE6C
/* 7E934 8007DD34 8FBF00D8 */   lw        $ra, 0xd8($sp)
.L8007DD38:
/* 7E938 8007DD38 27A40090 */  addiu      $a0, $sp, 0x90
/* 7E93C 8007DD3C 3C02800E */  lui        $v0, %hi(D_800E0B90)
/* 7E940 8007DD40 24420B90 */  addiu      $v0, $v0, %lo(D_800E0B90)
/* 7E944 8007DD44 30430003 */  andi       $v1, $v0, 3
/* 7E948 8007DD48 10600021 */  beqz       $v1, .L8007DDD0
/* 7E94C 8007DD4C 00802821 */   addu      $a1, $a0, $zero
/* 7E950 8007DD50 24430030 */  addiu      $v1, $v0, 0x30
.L8007DD54:
/* 7E954 8007DD54 88460000 */  lwl        $a2, ($v0)
/* 7E958 8007DD58 98460003 */  lwr        $a2, 3($v0)
/* 7E95C 8007DD5C 88480004 */  lwl        $t0, 4($v0)
/* 7E960 8007DD60 98480007 */  lwr        $t0, 7($v0)
/* 7E964 8007DD64 88490008 */  lwl        $t1, 8($v0)
/* 7E968 8007DD68 9849000B */  lwr        $t1, 0xb($v0)
/* 7E96C 8007DD6C 884A000C */  lwl        $t2, 0xc($v0)
/* 7E970 8007DD70 984A000F */  lwr        $t2, 0xf($v0)
/* 7E974 8007DD74 A8860000 */  swl        $a2, ($a0)
/* 7E978 8007DD78 B8860003 */  swr        $a2, 3($a0)
/* 7E97C 8007DD7C A8880004 */  swl        $t0, 4($a0)
/* 7E980 8007DD80 B8880007 */  swr        $t0, 7($a0)
/* 7E984 8007DD84 A8890008 */  swl        $t1, 8($a0)
/* 7E988 8007DD88 B889000B */  swr        $t1, 0xb($a0)
/* 7E98C 8007DD8C A88A000C */  swl        $t2, 0xc($a0)
/* 7E990 8007DD90 B88A000F */  swr        $t2, 0xf($a0)
/* 7E994 8007DD94 24420010 */  addiu      $v0, $v0, 0x10
/* 7E998 8007DD98 1443FFEE */  bne        $v0, $v1, .L8007DD54
/* 7E99C 8007DD9C 24840010 */   addiu     $a0, $a0, 0x10
/* 7E9A0 8007DDA0 0801F780 */  j          .L8007DE00
/* 7E9A4 8007DDA4 00000000 */   nop
.L8007DDA8:
/* 7E9A8 8007DDA8 03B01021 */  addu       $v0, $sp, $s0
/* 7E9AC 8007DDAC 94440012 */  lhu        $a0, 0x12($v0)
/* 7E9B0 8007DDB0 0C00918D */  jal        setEventFlag
/* 7E9B4 8007DDB4 02202821 */   addu      $a1, $s1, $zero
/* 7E9B8 8007DDB8 03B01021 */  addu       $v0, $sp, $s0
/* 7E9BC 8007DDBC 94440014 */  lhu        $a0, 0x14($v0)
/* 7E9C0 8007DDC0 0C00918D */  jal        setEventFlag
/* 7E9C4 8007DDC4 3A250001 */   xori      $a1, $s1, 1
/* 7E9C8 8007DDC8 0801F79B */  j          .L8007DE6C
/* 7E9CC 8007DDCC 8FBF00D8 */   lw        $ra, 0xd8($sp)
.L8007DDD0:
/* 7E9D0 8007DDD0 24430030 */  addiu      $v1, $v0, 0x30
.L8007DDD4:
/* 7E9D4 8007DDD4 8C460000 */  lw         $a2, ($v0)
/* 7E9D8 8007DDD8 8C480004 */  lw         $t0, 4($v0)
/* 7E9DC 8007DDDC 8C490008 */  lw         $t1, 8($v0)
/* 7E9E0 8007DDE0 8C4A000C */  lw         $t2, 0xc($v0)
/* 7E9E4 8007DDE4 AC860000 */  sw         $a2, ($a0)
/* 7E9E8 8007DDE8 AC880004 */  sw         $t0, 4($a0)
/* 7E9EC 8007DDEC AC890008 */  sw         $t1, 8($a0)
/* 7E9F0 8007DDF0 AC8A000C */  sw         $t2, 0xc($a0)
/* 7E9F4 8007DDF4 24420010 */  addiu      $v0, $v0, 0x10
/* 7E9F8 8007DDF8 1443FFF6 */  bne        $v0, $v1, .L8007DDD4
/* 7E9FC 8007DDFC 24840010 */   addiu     $a0, $a0, 0x10
.L8007DE00:
/* 7EA00 8007DE00 88430000 */  lwl        $v1, ($v0)
/* 7EA04 8007DE04 98430003 */  lwr        $v1, 3($v0)
/* 7EA08 8007DE08 88460004 */  lwl        $a2, 4($v0)
/* 7EA0C 8007DE0C 98460007 */  lwr        $a2, 7($v0)
/* 7EA10 8007DE10 A8830000 */  swl        $v1, ($a0)
/* 7EA14 8007DE14 B8830003 */  swr        $v1, 3($a0)
/* 7EA18 8007DE18 A8860004 */  swl        $a2, 4($a0)
/* 7EA1C 8007DE1C B8860007 */  swr        $a2, 7($a0)
/* 7EA20 8007DE20 00001821 */  addu       $v1, $zero, $zero
/* 7EA24 8007DE24 3406FFFF */  ori        $a2, $zero, 0xffff
/* 7EA28 8007DE28 0801F78D */  j          .L8007DE34
/* 7EA2C 8007DE2C 30E4FFFF */   andi      $a0, $a3, 0xffff
.L8007DE30:
/* 7EA30 8007DE30 3043FFFF */  andi       $v1, $v0, 0xffff
.L8007DE34:
/* 7EA34 8007DE34 00031040 */  sll        $v0, $v1, 1
/* 7EA38 8007DE38 00A21021 */  addu       $v0, $a1, $v0
/* 7EA3C 8007DE3C 94420000 */  lhu        $v0, ($v0)
/* 7EA40 8007DE40 1046000A */  beq        $v0, $a2, .L8007DE6C
/* 7EA44 8007DE44 8FBF00D8 */   lw        $ra, 0xd8($sp)
/* 7EA48 8007DE48 1482FFF9 */  bne        $a0, $v0, .L8007DE30
/* 7EA4C 8007DE4C 24620002 */   addiu     $v0, $v1, 2
/* 7EA50 8007DE50 24620001 */  addiu      $v0, $v1, 1
/* 7EA54 8007DE54 00021040 */  sll        $v0, $v0, 1
/* 7EA58 8007DE58 00A21021 */  addu       $v0, $a1, $v0
/* 7EA5C 8007DE5C 94440000 */  lhu        $a0, ($v0)
/* 7EA60 8007DE60 0C00918D */  jal        setEventFlag
/* 7EA64 8007DE64 02202821 */   addu      $a1, $s1, $zero
.L8007DE68:
/* 7EA68 8007DE68 8FBF00D8 */  lw         $ra, 0xd8($sp)
.L8007DE6C:
/* 7EA6C 8007DE6C 8FB100D4 */  lw         $s1, 0xd4($sp)
/* 7EA70 8007DE70 8FB000D0 */  lw         $s0, 0xd0($sp)
/* 7EA74 8007DE74 03E00008 */  jr         $ra
/* 7EA78 8007DE78 27BD00E0 */   addiu     $sp, $sp, 0xe0

glabel register_party_deaths
/* 7EA7C 8007DE7C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7EA80 8007DE80 AFB20018 */  sw         $s2, 0x18($sp)
/* 7EA84 8007DE84 00809021 */  addu       $s2, $a0, $zero
/* 7EA88 8007DE88 AFB10014 */  sw         $s1, 0x14($sp)
/* 7EA8C 8007DE8C 00008821 */  addu       $s1, $zero, $zero
/* 7EA90 8007DE90 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7EA94 8007DE94 AFB00010 */  sw         $s0, 0x10($sp)
/* 7EA98 8007DE98 00111080 */  sll        $v0, $s1, 2
.L8007DE9C:
/* 7EA9C 8007DE9C 02421021 */  addu       $v0, $s2, $v0
/* 7EAA0 8007DEA0 8C500000 */  lw         $s0, ($v0)
/* 7EAA4 8007DEA4 12000009 */  beqz       $s0, .L8007DECC
/* 7EAA8 8007DEA8 26220001 */   addiu     $v0, $s1, 1
/* 7EAAC 8007DEAC 0C01DF1D */  jal        isDead
/* 7EAB0 8007DEB0 02002021 */   addu      $a0, $s0, $zero
/* 7EAB4 8007DEB4 02402021 */  addu       $a0, $s2, $zero
/* 7EAB8 8007DEB8 96050000 */  lhu        $a1, ($s0)
/* 7EABC 8007DEBC 00003021 */  addu       $a2, $zero, $zero
/* 7EAC0 8007DEC0 0C01F6FE */  jal        check_party_event_flag
/* 7EAC4 8007DEC4 00403821 */   addu      $a3, $v0, $zero
/* 7EAC8 8007DEC8 26220001 */  addiu      $v0, $s1, 1
.L8007DECC:
/* 7EACC 8007DECC 305100FF */  andi       $s1, $v0, 0xff
/* 7EAD0 8007DED0 2E230004 */  sltiu      $v1, $s1, 4
/* 7EAD4 8007DED4 5460FFF1 */  bnel       $v1, $zero, .L8007DE9C
/* 7EAD8 8007DED8 00111080 */   sll       $v0, $s1, 2
/* 7EADC 8007DEDC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7EAE0 8007DEE0 8FB20018 */  lw         $s2, 0x18($sp)
/* 7EAE4 8007DEE4 8FB10014 */  lw         $s1, 0x14($sp)
/* 7EAE8 8007DEE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EAEC 8007DEEC 03E00008 */  jr         $ra
/* 7EAF0 8007DEF0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel add_to_party
/* 7EAF4 8007DEF4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7EAF8 8007DEF8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7EAFC 8007DEFC 00808821 */  addu       $s1, $a0, $zero
/* 7EB00 8007DF00 AFB20018 */  sw         $s2, 0x18($sp)
/* 7EB04 8007DF04 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7EB08 8007DF08 AFB00010 */  sw         $s0, 0x10($sp)
/* 7EB0C 8007DF0C 92230024 */  lbu        $v1, 0x24($s1)
/* 7EB10 8007DF10 24020004 */  addiu      $v0, $zero, 4
/* 7EB14 8007DF14 14620003 */  bne        $v1, $v0, .L8007DF24
/* 7EB18 8007DF18 30B2FFFF */   andi      $s2, $a1, 0xffff
/* 7EB1C 8007DF1C 0801F7EC */  j          .L8007DFB0
/* 7EB20 8007DF20 00001021 */   addu      $v0, $zero, $zero
.L8007DF24:
/* 7EB24 8007DF24 8E220000 */  lw         $v0, ($s1)
/* 7EB28 8007DF28 1040000A */  beqz       $v0, .L8007DF54
/* 7EB2C 8007DF2C 00008021 */   addu      $s0, $zero, $zero
/* 7EB30 8007DF30 26020001 */  addiu      $v0, $s0, 1
.L8007DF34:
/* 7EB34 8007DF34 305000FF */  andi       $s0, $v0, 0xff
/* 7EB38 8007DF38 2E030004 */  sltiu      $v1, $s0, 4
/* 7EB3C 8007DF3C 10600005 */  beqz       $v1, .L8007DF54
/* 7EB40 8007DF40 00101080 */   sll       $v0, $s0, 2
/* 7EB44 8007DF44 02221021 */  addu       $v0, $s1, $v0
/* 7EB48 8007DF48 8C430000 */  lw         $v1, ($v0)
/* 7EB4C 8007DF4C 1460FFF9 */  bnez       $v1, .L8007DF34
/* 7EB50 8007DF50 26020001 */   addiu     $v0, $s0, 1
.L8007DF54:
/* 7EB54 8007DF54 24040048 */  addiu      $a0, $zero, 0x48
/* 7EB58 8007DF58 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7EB5C 8007DF5C 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7EB60 8007DF60 0C025F9C */  jal        Malloc
/* 7EB64 8007DF64 24060157 */   addiu     $a2, $zero, 0x157
/* 7EB68 8007DF68 00402021 */  addu       $a0, $v0, $zero
/* 7EB6C 8007DF6C 02402821 */  addu       $a1, $s2, $zero
/* 7EB70 8007DF70 00003021 */  addu       $a2, $zero, $zero
/* 7EB74 8007DF74 00108080 */  sll        $s0, $s0, 2
/* 7EB78 8007DF78 02308021 */  addu       $s0, $s1, $s0
/* 7EB7C 8007DF7C 0C01DD95 */  jal        create_CharSheet
/* 7EB80 8007DF80 AE020000 */   sw        $v0, ($s0)
/* 7EB84 8007DF84 02202021 */  addu       $a0, $s1, $zero
/* 7EB88 8007DF88 02402821 */  addu       $a1, $s2, $zero
/* 7EB8C 8007DF8C 24060001 */  addiu      $a2, $zero, 1
/* 7EB90 8007DF90 92220024 */  lbu        $v0, 0x24($s1)
/* 7EB94 8007DF94 24070001 */  addiu      $a3, $zero, 1
/* 7EB98 8007DF98 24420001 */  addiu      $v0, $v0, 1
/* 7EB9C 8007DF9C 0C01F6FE */  jal        check_party_event_flag
/* 7EBA0 8007DFA0 A2220024 */   sb        $v0, 0x24($s1)
/* 7EBA4 8007DFA4 0C007001 */  jal        caseSwitch_copy_char
/* 7EBA8 8007DFA8 8E040000 */   lw        $a0, ($s0)
/* 7EBAC 8007DFAC 24020001 */  addiu      $v0, $zero, 1
.L8007DFB0:
/* 7EBB0 8007DFB0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7EBB4 8007DFB4 8FB20018 */  lw         $s2, 0x18($sp)
/* 7EBB8 8007DFB8 8FB10014 */  lw         $s1, 0x14($sp)
/* 7EBBC 8007DFBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EBC0 8007DFC0 03E00008 */  jr         $ra
/* 7EBC4 8007DFC4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007DFC8
/* 7EBC8 8007DFC8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7EBCC 8007DFCC 30A500FF */  andi       $a1, $a1, 0xff
/* 7EBD0 8007DFD0 00052880 */  sll        $a1, $a1, 2
/* 7EBD4 8007DFD4 00852021 */  addu       $a0, $a0, $a1
/* 7EBD8 8007DFD8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7EBDC 8007DFDC AFB00010 */  sw         $s0, 0x10($sp)
/* 7EBE0 8007DFE0 8C900000 */  lw         $s0, ($a0)
/* 7EBE4 8007DFE4 00002821 */  addu       $a1, $zero, $zero
/* 7EBE8 8007DFE8 96040000 */  lhu        $a0, ($s0)
/* 7EBEC 8007DFEC 0C01D77A */  jal        GetIDIndex
/* 7EBF0 8007DFF0 00003021 */   addu      $a2, $zero, $zero
/* 7EBF4 8007DFF4 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 7EBF8 8007DFF8 000211C0 */  sll        $v0, $v0, 7
/* 7EBFC 8007DFFC 8C6413A0 */  lw         $a0, %lo(EntityPointer)($v1)
/* 7EC00 8007E000 8E050020 */  lw         $a1, 0x20($s0)
/* 7EC04 8007E004 8C830010 */  lw         $v1, 0x10($a0)
/* 7EC08 8007E008 8CA60000 */  lw         $a2, ($a1)
/* 7EC0C 8007E00C 14C00005 */  bnez       $a2, .L8007E024
/* 7EC10 8007E010 00622021 */   addu      $a0, $v1, $v0
/* 7EC14 8007E014 8483005E */  lh         $v1, 0x5e($a0)
/* 7EC18 8007E018 2402FFFF */  addiu      $v0, $zero, -1
/* 7EC1C 8007E01C 14620017 */  bne        $v1, $v0, .L8007E07C
/* 7EC20 8007E020 00001021 */   addu      $v0, $zero, $zero
.L8007E024:
/* 7EC24 8007E024 8E020020 */  lw         $v0, 0x20($s0)
/* 7EC28 8007E028 8C430004 */  lw         $v1, 4($v0)
/* 7EC2C 8007E02C 54600007 */  bnel       $v1, $zero, .L8007E04C
/* 7EC30 8007E030 8E020024 */   lw        $v0, 0x24($s0)
/* 7EC34 8007E034 84830060 */  lh         $v1, 0x60($a0)
/* 7EC38 8007E038 2402FFFF */  addiu      $v0, $zero, -1
/* 7EC3C 8007E03C 50620003 */  beql       $v1, $v0, .L8007E04C
/* 7EC40 8007E040 8E020024 */   lw        $v0, 0x24($s0)
/* 7EC44 8007E044 0801F81F */  j          .L8007E07C
/* 7EC48 8007E048 00001021 */   addu      $v0, $zero, $zero
.L8007E04C:
/* 7EC4C 8007E04C 1440000B */  bnez       $v0, .L8007E07C
/* 7EC50 8007E050 24020001 */   addiu     $v0, $zero, 1
/* 7EC54 8007E054 84830040 */  lh         $v1, 0x40($a0)
/* 7EC58 8007E058 2402FFFF */  addiu      $v0, $zero, -1
/* 7EC5C 8007E05C 14620007 */  bne        $v1, $v0, .L8007E07C
/* 7EC60 8007E060 00001021 */   addu      $v0, $zero, $zero
/* 7EC64 8007E064 84850042 */  lh         $a1, 0x42($a0)
/* 7EC68 8007E068 14A30005 */  bne        $a1, $v1, .L8007E080
/* 7EC6C 8007E06C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 7EC70 8007E070 84830044 */  lh         $v1, 0x44($a0)
/* 7EC74 8007E074 50650002 */  beql       $v1, $a1, .L8007E080
/* 7EC78 8007E078 24020001 */   addiu     $v0, $zero, 1
.L8007E07C:
/* 7EC7C 8007E07C 8FBF0014 */  lw         $ra, 0x14($sp)
.L8007E080:
/* 7EC80 8007E080 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EC84 8007E084 03E00008 */  jr         $ra
/* 7EC88 8007E088 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_charsheet
/* 7EC8C 8007E08C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7EC90 8007E090 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7EC94 8007E094 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7EC98 8007E098 0C01F82B */  jal        get_party_charsheet
/* 7EC9C 8007E09C 27A60010 */   addiu     $a2, $sp, 0x10
/* 7ECA0 8007E0A0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7ECA4 8007E0A4 03E00008 */  jr         $ra
/* 7ECA8 8007E0A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_party_charsheet
/* 7ECAC 8007E0AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7ECB0 8007E0B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 7ECB4 8007E0B4 00808821 */  addu       $s1, $a0, $zero
/* 7ECB8 8007E0B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 7ECBC 8007E0BC 00C08021 */  addu       $s0, $a2, $zero
/* 7ECC0 8007E0C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7ECC4 8007E0C4 0C01F85B */  jal        find_ent_in_Party
/* 7ECC8 8007E0C8 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 7ECCC 8007E0CC A2020000 */  sb         $v0, ($s0)
/* 7ECD0 8007E0D0 304200FF */  andi       $v0, $v0, 0xff
/* 7ECD4 8007E0D4 240300FF */  addiu      $v1, $zero, 0xff
/* 7ECD8 8007E0D8 54430003 */  bnel       $v0, $v1, .L8007E0E8
/* 7ECDC 8007E0DC 92030000 */   lbu       $v1, ($s0)
/* 7ECE0 8007E0E0 0801F83D */  j          .L8007E0F4
/* 7ECE4 8007E0E4 00001021 */   addu      $v0, $zero, $zero
.L8007E0E8:
/* 7ECE8 8007E0E8 00031880 */  sll        $v1, $v1, 2
/* 7ECEC 8007E0EC 02231821 */  addu       $v1, $s1, $v1
/* 7ECF0 8007E0F0 8C620000 */  lw         $v0, ($v1)
.L8007E0F4:
/* 7ECF4 8007E0F4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7ECF8 8007E0F8 8FB10014 */  lw         $s1, 0x14($sp)
/* 7ECFC 8007E0FC 8FB00010 */  lw         $s0, 0x10($sp)
/* 7ED00 8007E100 03E00008 */  jr         $ra
/* 7ED04 8007E104 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007E108
/* 7ED08 8007E108 00002821 */  addu       $a1, $zero, $zero
/* 7ED0C 8007E10C 00051080 */  sll        $v0, $a1, 2
.L8007E110:
/* 7ED10 8007E110 00823021 */  addu       $a2, $a0, $v0
/* 7ED14 8007E114 8CC30000 */  lw         $v1, ($a2)
/* 7ED18 8007E118 1460000E */  bnez       $v1, .L8007E154
/* 7ED1C 8007E11C 24A70001 */   addiu     $a3, $a1, 1
/* 7ED20 8007E120 2CA20003 */  sltiu      $v0, $a1, 3
/* 7ED24 8007E124 10400009 */  beqz       $v0, .L8007E14C
/* 7ED28 8007E128 00051080 */   sll       $v0, $a1, 2
/* 7ED2C 8007E12C 00C01821 */  addu       $v1, $a2, $zero
.L8007E130:
/* 7ED30 8007E130 8C620004 */  lw         $v0, 4($v1)
/* 7ED34 8007E134 24A50001 */  addiu      $a1, $a1, 1
/* 7ED38 8007E138 AC620000 */  sw         $v0, ($v1)
/* 7ED3C 8007E13C 2CA20003 */  sltiu      $v0, $a1, 3
/* 7ED40 8007E140 1440FFFB */  bnez       $v0, .L8007E130
/* 7ED44 8007E144 24630004 */   addiu     $v1, $v1, 4
/* 7ED48 8007E148 00051080 */  sll        $v0, $a1, 2
.L8007E14C:
/* 7ED4C 8007E14C 00821021 */  addu       $v0, $a0, $v0
/* 7ED50 8007E150 AC400000 */  sw         $zero, ($v0)
.L8007E154:
/* 7ED54 8007E154 00E02821 */  addu       $a1, $a3, $zero
/* 7ED58 8007E158 2CA20003 */  sltiu      $v0, $a1, 3
/* 7ED5C 8007E15C 1440FFEC */  bnez       $v0, .L8007E110
/* 7ED60 8007E160 00051080 */   sll       $v0, $a1, 2
/* 7ED64 8007E164 03E00008 */  jr         $ra
/* 7ED68 8007E168 00000000 */   nop

glabel find_ent_in_Party
/* 7ED6C 8007E16C 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7ED70 8007E170 00003021 */  addu       $a2, $zero, $zero
/* 7ED74 8007E174 00061080 */  sll        $v0, $a2, 2
.L8007E178:
/* 7ED78 8007E178 00821021 */  addu       $v0, $a0, $v0
/* 7ED7C 8007E17C 8C420000 */  lw         $v0, ($v0)
/* 7ED80 8007E180 50400006 */  beql       $v0, $zero, .L8007E19C
/* 7ED84 8007E184 24C20001 */   addiu     $v0, $a2, 1
/* 7ED88 8007E188 94420000 */  lhu        $v0, ($v0)
/* 7ED8C 8007E18C 14450003 */  bne        $v0, $a1, .L8007E19C
/* 7ED90 8007E190 24C20001 */   addiu     $v0, $a2, 1
/* 7ED94 8007E194 03E00008 */  jr         $ra
/* 7ED98 8007E198 00C01021 */   addu      $v0, $a2, $zero
.L8007E19C:
/* 7ED9C 8007E19C 304600FF */  andi       $a2, $v0, 0xff
/* 7EDA0 8007E1A0 2CC30004 */  sltiu      $v1, $a2, 4
/* 7EDA4 8007E1A4 1460FFF4 */  bnez       $v1, .L8007E178
/* 7EDA8 8007E1A8 00061080 */   sll       $v0, $a2, 2
/* 7EDAC 8007E1AC 03E00008 */  jr         $ra
/* 7EDB0 8007E1B0 240200FF */   addiu     $v0, $zero, 0xff

glabel remove_alive_char_from_party
/* 7EDB4 8007E1B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7EDB8 8007E1B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 7EDBC 8007E1BC 00808021 */  addu       $s0, $a0, $zero
/* 7EDC0 8007E1C0 AFBF0014 */  sw         $ra, 0x14($sp)
/* 7EDC4 8007E1C4 0C01F85B */  jal        find_ent_in_Party
/* 7EDC8 8007E1C8 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 7EDCC 8007E1CC 00402821 */  addu       $a1, $v0, $zero
/* 7EDD0 8007E1D0 240200FF */  addiu      $v0, $zero, 0xff
/* 7EDD4 8007E1D4 10A20005 */  beq        $a1, $v0, .L8007E1EC
/* 7EDD8 8007E1D8 00001021 */   addu      $v0, $zero, $zero
/* 7EDDC 8007E1DC 0C01F87F */  jal        remove_alive_member
/* 7EDE0 8007E1E0 02002021 */   addu      $a0, $s0, $zero
/* 7EDE4 8007E1E4 0801F87C */  j          .L8007E1F0
/* 7EDE8 8007E1E8 8FBF0014 */   lw        $ra, 0x14($sp)
.L8007E1EC:
/* 7EDEC 8007E1EC 8FBF0014 */  lw         $ra, 0x14($sp)
.L8007E1F0:
/* 7EDF0 8007E1F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EDF4 8007E1F4 03E00008 */  jr         $ra
/* 7EDF8 8007E1F8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel remove_alive_member
/* 7EDFC 8007E1FC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7EE00 8007E200 AFB10014 */  sw         $s1, 0x14($sp)
/* 7EE04 8007E204 00808821 */  addu       $s1, $a0, $zero
/* 7EE08 8007E208 AFB00010 */  sw         $s0, 0x10($sp)
/* 7EE0C 8007E20C 30B000FF */  andi       $s0, $a1, 0xff
/* 7EE10 8007E210 02002821 */  addu       $a1, $s0, $zero
/* 7EE14 8007E214 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7EE18 8007E218 0C01F905 */  jal        strip_party_member
/* 7EE1C 8007E21C 24060001 */   addiu     $a2, $zero, 1
/* 7EE20 8007E220 0C006F5F */  jal        func_8001BD7C
/* 7EE24 8007E224 02202021 */   addu      $a0, $s1, $zero
/* 7EE28 8007E228 00101080 */  sll        $v0, $s0, 2
/* 7EE2C 8007E22C 02221021 */  addu       $v0, $s1, $v0
/* 7EE30 8007E230 8C420000 */  lw         $v0, ($v0)
/* 7EE34 8007E234 1040000D */  beqz       $v0, .L8007E26C
/* 7EE38 8007E238 02202021 */   addu      $a0, $s1, $zero
/* 7EE3C 8007E23C 94450000 */  lhu        $a1, ($v0)
/* 7EE40 8007E240 24060001 */  addiu      $a2, $zero, 1
/* 7EE44 8007E244 0C01F6FE */  jal        check_party_event_flag
/* 7EE48 8007E248 00003821 */   addu      $a3, $zero, $zero
/* 7EE4C 8007E24C 02202021 */  addu       $a0, $s1, $zero
/* 7EE50 8007E250 02002821 */  addu       $a1, $s0, $zero
/* 7EE54 8007E254 0C01F92C */  jal        remove_party_member
/* 7EE58 8007E258 00003021 */   addu      $a2, $zero, $zero
/* 7EE5C 8007E25C 0C01F8EA */  jal        scooch_member_over
/* 7EE60 8007E260 02202021 */   addu      $a0, $s1, $zero
/* 7EE64 8007E264 0801F89C */  j          .L8007E270
/* 7EE68 8007E268 24020001 */   addiu     $v0, $zero, 1
.L8007E26C:
/* 7EE6C 8007E26C 00001021 */  addu       $v0, $zero, $zero
.L8007E270:
/* 7EE70 8007E270 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7EE74 8007E274 8FB10014 */  lw         $s1, 0x14($sp)
/* 7EE78 8007E278 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EE7C 8007E27C 03E00008 */  jr         $ra
/* 7EE80 8007E280 27BD0020 */   addiu     $sp, $sp, 0x20

glabel Ofunc_removeEntireParty
/* 7EE84 8007E284 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7EE88 8007E288 AFB10014 */  sw         $s1, 0x14($sp)
/* 7EE8C 8007E28C 00808821 */  addu       $s1, $a0, $zero
/* 7EE90 8007E290 AFB00010 */  sw         $s0, 0x10($sp)
/* 7EE94 8007E294 00008021 */  addu       $s0, $zero, $zero
/* 7EE98 8007E298 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7EE9C 8007E29C 02202021 */  addu       $a0, $s1, $zero
.L8007E2A0:
/* 7EEA0 8007E2A0 320500FF */  andi       $a1, $s0, 0xff
/* 7EEA4 8007E2A4 0C01F92C */  jal        remove_party_member
/* 7EEA8 8007E2A8 00003021 */   addu      $a2, $zero, $zero
/* 7EEAC 8007E2AC 26100001 */  addiu      $s0, $s0, 1
/* 7EEB0 8007E2B0 2E020004 */  sltiu      $v0, $s0, 4
/* 7EEB4 8007E2B4 1440FFFA */  bnez       $v0, .L8007E2A0
/* 7EEB8 8007E2B8 02202021 */   addu      $a0, $s1, $zero
/* 7EEBC 8007E2BC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7EEC0 8007E2C0 8FB10014 */  lw         $s1, 0x14($sp)
/* 7EEC4 8007E2C4 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EEC8 8007E2C8 03E00008 */  jr         $ra
/* 7EECC 8007E2CC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel IsCharacterInParty
/* 7EED0 8007E2D0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 7EED4 8007E2D4 00003021 */  addu       $a2, $zero, $zero
/* 7EED8 8007E2D8 00061080 */  sll        $v0, $a2, 2
.L8007E2DC:
/* 7EEDC 8007E2DC 00821021 */  addu       $v0, $a0, $v0
/* 7EEE0 8007E2E0 8C420000 */  lw         $v0, ($v0)
/* 7EEE4 8007E2E4 50400006 */  beql       $v0, $zero, .L8007E300
/* 7EEE8 8007E2E8 24C20001 */   addiu     $v0, $a2, 1
/* 7EEEC 8007E2EC 94420000 */  lhu        $v0, ($v0)
/* 7EEF0 8007E2F0 14450003 */  bne        $v0, $a1, .L8007E300
/* 7EEF4 8007E2F4 24C20001 */   addiu     $v0, $a2, 1
/* 7EEF8 8007E2F8 03E00008 */  jr         $ra
/* 7EEFC 8007E2FC 24020001 */   addiu     $v0, $zero, 1
.L8007E300:
/* 7EF00 8007E300 3046FFFF */  andi       $a2, $v0, 0xffff
/* 7EF04 8007E304 2CC30004 */  sltiu      $v1, $a2, 4
/* 7EF08 8007E308 1460FFF4 */  bnez       $v1, .L8007E2DC
/* 7EF0C 8007E30C 00061080 */   sll       $v0, $a2, 2
/* 7EF10 8007E310 03E00008 */  jr         $ra
/* 7EF14 8007E314 00001021 */   addu      $v0, $zero, $zero

glabel BringOutYourDead
/* 7EF18 8007E318 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7EF1C 8007E31C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7EF20 8007E320 00809821 */  addu       $s3, $a0, $zero
/* 7EF24 8007E324 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7EF28 8007E328 AFB20018 */  sw         $s2, 0x18($sp)
/* 7EF2C 8007E32C AFB10014 */  sw         $s1, 0x14($sp)
/* 7EF30 8007E330 0C01F79F */  jal        register_party_deaths
/* 7EF34 8007E334 AFB00010 */   sw        $s0, 0x10($sp)
/* 7EF38 8007E338 00009021 */  addu       $s2, $zero, $zero
/* 7EF3C 8007E33C 02608821 */  addu       $s1, $s3, $zero
.L8007E340:
/* 7EF40 8007E340 8E300000 */  lw         $s0, ($s1)
/* 7EF44 8007E344 5200000C */  beql       $s0, $zero, .L8007E378
/* 7EF48 8007E348 26520001 */   addiu     $s2, $s2, 1
/* 7EF4C 8007E34C 0C01DF1D */  jal        isDead
/* 7EF50 8007E350 02002021 */   addu      $a0, $s0, $zero
/* 7EF54 8007E354 50400008 */  beql       $v0, $zero, .L8007E378
/* 7EF58 8007E358 26520001 */   addiu     $s2, $s2, 1
/* 7EF5C 8007E35C 0C006FE3 */  jal        func_8001BF8C
/* 7EF60 8007E360 96040000 */   lhu       $a0, ($s0)
/* 7EF64 8007E364 02602021 */  addu       $a0, $s3, $zero
/* 7EF68 8007E368 324500FF */  andi       $a1, $s2, 0xff
/* 7EF6C 8007E36C 0C01F92C */  jal        remove_party_member
/* 7EF70 8007E370 24060001 */   addiu     $a2, $zero, 1
/* 7EF74 8007E374 26520001 */  addiu      $s2, $s2, 1
.L8007E378:
/* 7EF78 8007E378 2E420004 */  sltiu      $v0, $s2, 4
/* 7EF7C 8007E37C 1440FFF0 */  bnez       $v0, .L8007E340
/* 7EF80 8007E380 26310004 */   addiu     $s1, $s1, 4
/* 7EF84 8007E384 0C01F8EA */  jal        scooch_member_over
/* 7EF88 8007E388 02602021 */   addu      $a0, $s3, $zero
/* 7EF8C 8007E38C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7EF90 8007E390 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7EF94 8007E394 8FB20018 */  lw         $s2, 0x18($sp)
/* 7EF98 8007E398 8FB10014 */  lw         $s1, 0x14($sp)
/* 7EF9C 8007E39C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7EFA0 8007E3A0 03E00008 */  jr         $ra
/* 7EFA4 8007E3A4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel scooch_member_over
/* 7EFA8 8007E3A8 00002821 */  addu       $a1, $zero, $zero
/* 7EFAC 8007E3AC 00051080 */  sll        $v0, $a1, 2
.L8007E3B0:
/* 7EFB0 8007E3B0 00824021 */  addu       $t0, $a0, $v0
/* 7EFB4 8007E3B4 8D030000 */  lw         $v1, ($t0)
/* 7EFB8 8007E3B8 14600010 */  bnez       $v1, .L8007E3FC
/* 7EFBC 8007E3BC 24A70001 */   addiu     $a3, $a1, 1
/* 7EFC0 8007E3C0 2CE20004 */  sltiu      $v0, $a3, 4
/* 7EFC4 8007E3C4 1040000D */  beqz       $v0, .L8007E3FC
/* 7EFC8 8007E3C8 00E03021 */   addu      $a2, $a3, $zero
/* 7EFCC 8007E3CC 00071080 */  sll        $v0, $a3, 2
/* 7EFD0 8007E3D0 00442821 */  addu       $a1, $v0, $a0
/* 7EFD4 8007E3D4 01001821 */  addu       $v1, $t0, $zero
.L8007E3D8:
/* 7EFD8 8007E3D8 8CA20000 */  lw         $v0, ($a1)
/* 7EFDC 8007E3DC 10400004 */  beqz       $v0, .L8007E3F0
/* 7EFE0 8007E3E0 24C60001 */   addiu     $a2, $a2, 1
/* 7EFE4 8007E3E4 AC620000 */  sw         $v0, ($v1)
/* 7EFE8 8007E3E8 24630004 */  addiu      $v1, $v1, 4
/* 7EFEC 8007E3EC ACA00000 */  sw         $zero, ($a1)
.L8007E3F0:
/* 7EFF0 8007E3F0 2CC20004 */  sltiu      $v0, $a2, 4
/* 7EFF4 8007E3F4 1440FFF8 */  bnez       $v0, .L8007E3D8
/* 7EFF8 8007E3F8 24A50004 */   addiu     $a1, $a1, 4
.L8007E3FC:
/* 7EFFC 8007E3FC 00E02821 */  addu       $a1, $a3, $zero
/* 7F000 8007E400 2CA20004 */  sltiu      $v0, $a1, 4
/* 7F004 8007E404 1440FFEA */  bnez       $v0, .L8007E3B0
/* 7F008 8007E408 00051080 */   sll       $v0, $a1, 2
/* 7F00C 8007E40C 03E00008 */  jr         $ra
/* 7F010 8007E410 00000000 */   nop

glabel strip_party_member
/* 7F014 8007E414 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7F018 8007E418 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F01C 8007E41C 00809021 */  addu       $s2, $a0, $zero
/* 7F020 8007E420 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F024 8007E424 30B100FF */  andi       $s1, $a1, 0xff
/* 7F028 8007E428 00111080 */  sll        $v0, $s1, 2
/* 7F02C 8007E42C 02421021 */  addu       $v0, $s2, $v0
/* 7F030 8007E430 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7F034 8007E434 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F038 8007E438 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F03C 8007E43C 8C430000 */  lw         $v1, ($v0)
/* 7F040 8007E440 10600014 */  beqz       $v1, .L8007E494
/* 7F044 8007E444 00C09821 */   addu      $s3, $a2, $zero
/* 7F048 8007E448 00008021 */  addu       $s0, $zero, $zero
/* 7F04C 8007E44C 02402021 */  addu       $a0, $s2, $zero
.L8007E450:
/* 7F050 8007E450 02202821 */  addu       $a1, $s1, $zero
/* 7F054 8007E454 0C01FE6E */  jal        func_8007F9B8
/* 7F058 8007E458 320600FF */   andi      $a2, $s0, 0xff
/* 7F05C 8007E45C 26100001 */  addiu      $s0, $s0, 1
/* 7F060 8007E460 2E02000C */  sltiu      $v0, $s0, 0xc
/* 7F064 8007E464 1440FFFA */  bnez       $v0, .L8007E450
/* 7F068 8007E468 02402021 */   addu      $a0, $s2, $zero
/* 7F06C 8007E46C 1260000A */  beqz       $s3, .L8007E498
/* 7F070 8007E470 8FBF0020 */   lw        $ra, 0x20($sp)
/* 7F074 8007E474 0C01FE04 */  jal        MoveWeaponsToInventory
/* 7F078 8007E478 02202821 */   addu      $a1, $s1, $zero
/* 7F07C 8007E47C 02402021 */  addu       $a0, $s2, $zero
/* 7F080 8007E480 0C01FD5C */  jal        remove_armor_from_character
/* 7F084 8007E484 02202821 */   addu      $a1, $s1, $zero
/* 7F088 8007E488 02402021 */  addu       $a0, $s2, $zero
/* 7F08C 8007E48C 0C01FDB0 */  jal        removeArmorIntoInventory
/* 7F090 8007E490 02202821 */   addu      $a1, $s1, $zero
.L8007E494:
/* 7F094 8007E494 8FBF0020 */  lw         $ra, 0x20($sp)
.L8007E498:
/* 7F098 8007E498 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7F09C 8007E49C 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F0A0 8007E4A0 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F0A4 8007E4A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F0A8 8007E4A8 03E00008 */  jr         $ra
/* 7F0AC 8007E4AC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel remove_party_member
/* 7F0B0 8007E4B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7F0B4 8007E4B4 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F0B8 8007E4B8 00808821 */  addu       $s1, $a0, $zero
/* 7F0BC 8007E4BC 30A500FF */  andi       $a1, $a1, 0xff
/* 7F0C0 8007E4C0 00051080 */  sll        $v0, $a1, 2
/* 7F0C4 8007E4C4 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F0C8 8007E4C8 02229021 */  addu       $s2, $s1, $v0
/* 7F0CC 8007E4CC AFBF001C */  sw         $ra, 0x1c($sp)
/* 7F0D0 8007E4D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F0D4 8007E4D4 8E500000 */  lw         $s0, ($s2)
/* 7F0D8 8007E4D8 1200000F */  beqz       $s0, .L8007E518
/* 7F0DC 8007E4DC 8FBF001C */   lw        $ra, 0x1c($sp)
/* 7F0E0 8007E4E0 0C01F905 */  jal        strip_party_member
/* 7F0E4 8007E4E4 00000000 */   nop
/* 7F0E8 8007E4E8 0C01DE3D */  jal        CharSheet_free
/* 7F0EC 8007E4EC 02002021 */   addu      $a0, $s0, $zero
/* 7F0F0 8007E4F0 02002021 */  addu       $a0, $s0, $zero
/* 7F0F4 8007E4F4 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F0F8 8007E4F8 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F0FC 8007E4FC 0C02600C */  jal        Free
/* 7F100 8007E500 2406026D */   addiu     $a2, $zero, 0x26d
/* 7F104 8007E504 AE400000 */  sw         $zero, ($s2)
/* 7F108 8007E508 92220024 */  lbu        $v0, 0x24($s1)
/* 7F10C 8007E50C 2442FFFF */  addiu      $v0, $v0, -1
/* 7F110 8007E510 A2220024 */  sb         $v0, 0x24($s1)
/* 7F114 8007E514 8FBF001C */  lw         $ra, 0x1c($sp)
.L8007E518:
/* 7F118 8007E518 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F11C 8007E51C 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F120 8007E520 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F124 8007E524 03E00008 */  jr         $ra
/* 7F128 8007E528 27BD0020 */   addiu     $sp, $sp, 0x20

glabel characterInParty
/* 7F12C 8007E52C 14A00005 */  bnez       $a1, .L8007E544
/* 7F130 8007E530 00001821 */   addu      $v1, $zero, $zero
/* 7F134 8007E534 03E00008 */  jr         $ra
/* 7F138 8007E538 00001021 */   addu      $v0, $zero, $zero
.L8007E53C:
/* 7F13C 8007E53C 03E00008 */  jr         $ra
/* 7F140 8007E540 24020001 */   addiu     $v0, $zero, 1
.L8007E544:
/* 7F144 8007E544 8C820000 */  lw         $v0, ($a0)
/* 7F148 8007E548 10A2FFFC */  beq        $a1, $v0, .L8007E53C
/* 7F14C 8007E54C 24630001 */   addiu     $v1, $v1, 1
/* 7F150 8007E550 2C620004 */  sltiu      $v0, $v1, 4
/* 7F154 8007E554 1440FFFB */  bnez       $v0, .L8007E544
/* 7F158 8007E558 24840004 */   addiu     $a0, $a0, 4
/* 7F15C 8007E55C 03E00008 */  jr         $ra
/* 7F160 8007E560 24020001 */   addiu     $v0, $zero, 1

glabel get_party_avg_lv
/* 7F164 8007E564 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7F168 8007E568 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F16C 8007E56C 00809021 */  addu       $s2, $a0, $zero
/* 7F170 8007E570 AFBF001C */  sw         $ra, 0x1c($sp)
/* 7F174 8007E574 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F178 8007E578 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F17C 8007E57C 92420024 */  lbu        $v0, 0x24($s2)
/* 7F180 8007E580 14400003 */  bnez       $v0, .L8007E590
/* 7F184 8007E584 00008821 */   addu      $s1, $zero, $zero
/* 7F188 8007E588 0801F97A */  j          .L8007E5E8
/* 7F18C 8007E58C 00001021 */   addu      $v0, $zero, $zero
.L8007E590:
/* 7F190 8007E590 00008021 */  addu       $s0, $zero, $zero
/* 7F194 8007E594 00101080 */  sll        $v0, $s0, 2
.L8007E598:
/* 7F198 8007E598 02421021 */  addu       $v0, $s2, $v0
/* 7F19C 8007E59C 8C420000 */  lw         $v0, ($v0)
/* 7F1A0 8007E5A0 50400007 */  beql       $v0, $zero, .L8007E5C0
/* 7F1A4 8007E5A4 26020001 */   addiu     $v0, $s0, 1
/* 7F1A8 8007E5A8 8C440018 */  lw         $a0, 0x18($v0)
/* 7F1AC 8007E5AC 0C02128F */  jal        getModdedStat
/* 7F1B0 8007E5B0 24050006 */   addiu     $a1, $zero, 6
/* 7F1B4 8007E5B4 02221021 */  addu       $v0, $s1, $v0
/* 7F1B8 8007E5B8 305100FF */  andi       $s1, $v0, 0xff
/* 7F1BC 8007E5BC 26020001 */  addiu      $v0, $s0, 1
.L8007E5C0:
/* 7F1C0 8007E5C0 305000FF */  andi       $s0, $v0, 0xff
/* 7F1C4 8007E5C4 2E030004 */  sltiu      $v1, $s0, 4
/* 7F1C8 8007E5C8 1460FFF3 */  bnez       $v1, .L8007E598
/* 7F1CC 8007E5CC 00101080 */   sll       $v0, $s0, 2
/* 7F1D0 8007E5D0 92430024 */  lbu        $v1, 0x24($s2)
/* 7F1D4 8007E5D4 0223001B */  divu       $zero, $s1, $v1
/* 7F1D8 8007E5D8 00001012 */  mflo       $v0
/* 7F1DC 8007E5DC 50600001 */  beql       $v1, $zero, .L8007E5E4
/* 7F1E0 8007E5E0 000001CD */   break     0, 7
.L8007E5E4:
/* 7F1E4 8007E5E4 304200FF */   andi      $v0, $v0, 0xff
.L8007E5E8:
/* 7F1E8 8007E5E8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 7F1EC 8007E5EC 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F1F0 8007E5F0 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F1F4 8007E5F4 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F1F8 8007E5F8 03E00008 */  jr         $ra
/* 7F1FC 8007E5FC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_inventory_8007e600
/* 7F200 8007E600 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7F204 8007E604 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F208 8007E608 00808021 */  addu       $s0, $a0, $zero
/* 7F20C 8007E60C AFBF0014 */  sw         $ra, 0x14($sp)
/* 7F210 8007E610 8E050010 */  lw         $a1, 0x10($s0)
/* 7F214 8007E614 8CA20000 */  lw         $v0, ($a1)
/* 7F218 8007E618 84440018 */  lh         $a0, 0x18($v0)
/* 7F21C 8007E61C 8C43001C */  lw         $v1, 0x1c($v0)
/* 7F220 8007E620 0060F809 */  jalr       $v1
/* 7F224 8007E624 00A42021 */   addu      $a0, $a1, $a0
/* 7F228 8007E628 8E050010 */  lw         $a1, 0x10($s0)
/* 7F22C 8007E62C 8CA20000 */  lw         $v0, ($a1)
/* 7F230 8007E630 84440010 */  lh         $a0, 0x10($v0)
/* 7F234 8007E634 8C430014 */  lw         $v1, 0x14($v0)
/* 7F238 8007E638 0060F809 */  jalr       $v1
/* 7F23C 8007E63C 00A42021 */   addu      $a0, $a1, $a0
/* 7F240 8007E640 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7F244 8007E644 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F248 8007E648 03E00008 */  jr         $ra
/* 7F24C 8007E64C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel create_2ByteArray
/* 7F250 8007E650 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 7F254 8007E654 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F258 8007E658 00808021 */  addu       $s0, $a0, $zero
/* 7F25C 8007E65C 1200000C */  beqz       $s0, .L8007E690
/* 7F260 8007E660 AFBF0014 */   sw        $ra, 0x14($sp)
/* 7F264 8007E664 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F268 8007E668 24040002 */  addiu      $a0, $zero, 2
/* 7F26C 8007E66C 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F270 8007E670 0C025F9C */  jal        Malloc
/* 7F274 8007E674 240602B9 */   addiu     $a2, $zero, 0x2b9
/* 7F278 8007E678 92040000 */  lbu        $a0, ($s0)
/* 7F27C 8007E67C 00401821 */  addu       $v1, $v0, $zero
/* 7F280 8007E680 A0640000 */  sb         $a0, ($v1)
/* 7F284 8007E684 92050001 */  lbu        $a1, 1($s0)
/* 7F288 8007E688 0801F9A5 */  j          .L8007E694
/* 7F28C 8007E68C A0650001 */   sb        $a1, 1($v1)
.L8007E690:
/* 7F290 8007E690 00001021 */  addu       $v0, $zero, $zero
.L8007E694:
/* 7F294 8007E694 8FBF0014 */  lw         $ra, 0x14($sp)
/* 7F298 8007E698 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F29C 8007E69C 03E00008 */  jr         $ra
/* 7F2A0 8007E6A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8007E6A4
/* 7F2A4 8007E6A4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7F2A8 8007E6A8 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F2AC 8007E6AC 00808821 */  addu       $s1, $a0, $zero
/* 7F2B0 8007E6B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F2B4 8007E6B4 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 7F2B8 8007E6B8 02002821 */  addu       $a1, $s0, $zero
/* 7F2BC 8007E6BC AFBF0020 */  sw         $ra, 0x20($sp)
/* 7F2C0 8007E6C0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F2C4 8007E6C4 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F2C8 8007E6C8 8E220010 */  lw         $v0, 0x10($s1)
/* 7F2CC 8007E6CC 00C09021 */  addu       $s2, $a2, $zero
/* 7F2D0 8007E6D0 8C430000 */  lw         $v1, ($v0)
/* 7F2D4 8007E6D4 24060001 */  addiu      $a2, $zero, 1
/* 7F2D8 8007E6D8 84640030 */  lh         $a0, 0x30($v1)
/* 7F2DC 8007E6DC 00073E00 */  sll        $a3, $a3, 0x18
/* 7F2E0 8007E6E0 00442021 */  addu       $a0, $v0, $a0
/* 7F2E4 8007E6E4 8C620034 */  lw         $v0, 0x34($v1)
/* 7F2E8 8007E6E8 0040F809 */  jalr       $v0
/* 7F2EC 8007E6EC 00079E03 */   sra       $s3, $a3, 0x18
/* 7F2F0 8007E6F0 8E260010 */  lw         $a2, 0x10($s1)
/* 7F2F4 8007E6F4 8CC30000 */  lw         $v1, ($a2)
/* 7F2F8 8007E6F8 02002821 */  addu       $a1, $s0, $zero
/* 7F2FC 8007E6FC 84640050 */  lh         $a0, 0x50($v1)
/* 7F300 8007E700 8C620054 */  lw         $v0, 0x54($v1)
/* 7F304 8007E704 0040F809 */  jalr       $v0
/* 7F308 8007E708 00C42021 */   addu      $a0, $a2, $a0
/* 7F30C 8007E70C 00402821 */  addu       $a1, $v0, $zero
/* 7F310 8007E710 2402FFFF */  addiu      $v0, $zero, -1
/* 7F314 8007E714 54A20009 */  bnel       $a1, $v0, .L8007E73C
/* 7F318 8007E718 8E260010 */   lw        $a2, 0x10($s1)
/* 7F31C 8007E71C 12400017 */  beqz       $s2, .L8007E77C
/* 7F320 8007E720 02402021 */   addu      $a0, $s2, $zero
/* 7F324 8007E724 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F328 8007E728 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F32C 8007E72C 0C02600C */  jal        Free
/* 7F330 8007E730 240602D3 */   addiu     $a2, $zero, 0x2d3
/* 7F334 8007E734 0801F9E0 */  j          .L8007E780
/* 7F338 8007E738 8FBF0020 */   lw        $ra, 0x20($sp)
.L8007E73C:
/* 7F33C 8007E73C 8CC30000 */  lw         $v1, ($a2)
/* 7F340 8007E740 84640058 */  lh         $a0, 0x58($v1)
/* 7F344 8007E744 8C62005C */  lw         $v0, 0x5c($v1)
/* 7F348 8007E748 0040F809 */  jalr       $v0
/* 7F34C 8007E74C 00C42021 */   addu      $a0, $a2, $a0
/* 7F350 8007E750 00408021 */  addu       $s0, $v0, $zero
/* 7F354 8007E754 8E04000C */  lw         $a0, 0xc($s0)
/* 7F358 8007E758 10800004 */  beqz       $a0, .L8007E76C
/* 7F35C 8007E75C 3C05800E */   lui       $a1, %hi(D_800E0B20)
/* 7F360 8007E760 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F364 8007E764 0C02600C */  jal        Free
/* 7F368 8007E768 240602DE */   addiu     $a2, $zero, 0x2de
.L8007E76C:
/* 7F36C 8007E76C 8E020010 */  lw         $v0, 0x10($s0)
/* 7F370 8007E770 10400002 */  beqz       $v0, .L8007E77C
/* 7F374 8007E774 AE12000C */   sw        $s2, 0xc($s0)
/* 7F378 8007E778 A0530004 */  sb         $s3, 4($v0)
.L8007E77C:
/* 7F37C 8007E77C 8FBF0020 */  lw         $ra, 0x20($sp)
.L8007E780:
/* 7F380 8007E780 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7F384 8007E784 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F388 8007E788 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F38C 8007E78C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F390 8007E790 03E00008 */  jr         $ra
/* 7F394 8007E794 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8007E798
/* 7F398 8007E798 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 7F39C 8007E79C 00002021 */  addu       $a0, $zero, $zero
/* 7F3A0 8007E7A0 3C02800E */  lui        $v0, %hi(D_800E0BC8)
/* 7F3A4 8007E7A4 24480BC8 */  addiu      $t0, $v0, %lo(D_800E0BC8)
/* 7F3A8 8007E7A8 89030000 */  lwl        $v1, ($t0)
/* 7F3AC 8007E7AC 99030003 */  lwr        $v1, 3($t0)
/* 7F3B0 8007E7B0 89060004 */  lwl        $a2, 4($t0)
/* 7F3B4 8007E7B4 99060007 */  lwr        $a2, 7($t0)
/* 7F3B8 8007E7B8 81070008 */  lb         $a3, 8($t0)
/* 7F3BC 8007E7BC ABA30000 */  swl        $v1, ($sp)
/* 7F3C0 8007E7C0 BBA30003 */  swr        $v1, 3($sp)
/* 7F3C4 8007E7C4 ABA60004 */  swl        $a2, 4($sp)
/* 7F3C8 8007E7C8 BBA60007 */  swr        $a2, 7($sp)
/* 7F3CC 8007E7CC A3A70008 */  sb         $a3, 8($sp)
/* 7F3D0 8007E7D0 93A30000 */  lbu        $v1, ($sp)
/* 7F3D4 8007E7D4 240200FF */  addiu      $v0, $zero, 0xff
/* 7F3D8 8007E7D8 1062000E */  beq        $v1, $v0, .L8007E814
/* 7F3DC 8007E7DC 30A500FF */   andi      $a1, $a1, 0xff
/* 7F3E0 8007E7E0 240600FF */  addiu      $a2, $zero, 0xff
/* 7F3E4 8007E7E4 03A41021 */  addu       $v0, $sp, $a0
.L8007E7E8:
/* 7F3E8 8007E7E8 90430000 */  lbu        $v1, ($v0)
/* 7F3EC 8007E7EC 14650004 */  bne        $v1, $a1, .L8007E800
/* 7F3F0 8007E7F0 24820002 */   addiu     $v0, $a0, 2
/* 7F3F4 8007E7F4 009D1821 */  addu       $v1, $a0, $sp
/* 7F3F8 8007E7F8 0801FA06 */  j          .L8007E818
/* 7F3FC 8007E7FC 90620001 */   lbu       $v0, 1($v1)
.L8007E800:
/* 7F400 8007E800 3044FFFF */  andi       $a0, $v0, 0xffff
/* 7F404 8007E804 03A41821 */  addu       $v1, $sp, $a0
/* 7F408 8007E808 90620000 */  lbu        $v0, ($v1)
/* 7F40C 8007E80C 1446FFF6 */  bne        $v0, $a2, .L8007E7E8
/* 7F410 8007E810 03A41021 */   addu      $v0, $sp, $a0
.L8007E814:
/* 7F414 8007E814 24020001 */  addiu      $v0, $zero, 1
.L8007E818:
/* 7F418 8007E818 03E00008 */  jr         $ra
/* 7F41C 8007E81C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_checking_niesen_
/* 7F420 8007E820 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7F424 8007E824 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F428 8007E828 00808821 */  addu       $s1, $a0, $zero
/* 7F42C 8007E82C AFB40020 */  sw         $s4, 0x20($sp)
/* 7F430 8007E830 00A0A021 */  addu       $s4, $a1, $zero
/* 7F434 8007E834 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F438 8007E838 30F0FFFF */  andi       $s0, $a3, 0xffff
/* 7F43C 8007E83C 02002821 */  addu       $a1, $s0, $zero
/* 7F440 8007E840 AFBF0024 */  sw         $ra, 0x24($sp)
/* 7F444 8007E844 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F448 8007E848 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F44C 8007E84C 8E240010 */  lw         $a0, 0x10($s1)
/* 7F450 8007E850 0C01F070 */  jal        has_item_func
/* 7F454 8007E854 30D300FF */   andi      $s3, $a2, 0xff
/* 7F458 8007E858 1040001A */  beqz       $v0, .L8007E8C4
/* 7F45C 8007E85C 02002821 */   addu      $a1, $s0, $zero
/* 7F460 8007E860 8E260010 */  lw         $a2, 0x10($s1)
/* 7F464 8007E864 8CC30000 */  lw         $v1, ($a2)
/* 7F468 8007E868 84640050 */  lh         $a0, 0x50($v1)
/* 7F46C 8007E86C 8C620054 */  lw         $v0, 0x54($v1)
/* 7F470 8007E870 0040F809 */  jalr       $v0
/* 7F474 8007E874 00C42021 */   addu      $a0, $a2, $a0
/* 7F478 8007E878 02002021 */  addu       $a0, $s0, $zero
/* 7F47C 8007E87C 00002821 */  addu       $a1, $zero, $zero
/* 7F480 8007E880 00003021 */  addu       $a2, $zero, $zero
/* 7F484 8007E884 0C01D77A */  jal        GetIDIndex
/* 7F488 8007E888 305200FF */   andi      $s2, $v0, 0xff
/* 7F48C 8007E88C 3C04800F */  lui        $a0, %hi(combatPointer)
/* 7F490 8007E890 8C83F760 */  lw         $v1, %lo(combatPointer)($a0)
/* 7F494 8007E894 00132880 */  sll        $a1, $s3, 2
/* 7F498 8007E898 00651821 */  addu       $v1, $v1, $a1
/* 7F49C 8007E89C 8C6552D0 */  lw         $a1, 0x52d0($v1)
/* 7F4A0 8007E8A0 00408821 */  addu       $s1, $v0, $zero
/* 7F4A4 8007E8A4 10A00012 */  beqz       $a1, .L8007E8F0
/* 7F4A8 8007E8A8 24020001 */   addiu     $v0, $zero, 1
/* 7F4AC 8007E8AC 3C02800F */  lui        $v0, %hi(entityList+0xA2)
/* 7F4B0 8007E8B0 90431452 */  lbu        $v1, %lo(entityList+0xA2)($v0)
/* 7F4B4 8007E8B4 96840000 */  lhu        $a0, ($s4)
/* 7F4B8 8007E8B8 24630200 */  addiu      $v1, $v1, 0x200
/* 7F4BC 8007E8BC 14830003 */  bne        $a0, $v1, .L8007E8CC
/* 7F4C0 8007E8C0 00A02021 */   addu      $a0, $a1, $zero
.L8007E8C4:
/* 7F4C4 8007E8C4 0801FA3C */  j          .L8007E8F0
/* 7F4C8 8007E8C8 24020001 */   addiu     $v0, $zero, 1
.L8007E8CC:
/* 7F4CC 8007E8CC 02002821 */  addu       $a1, $s0, $zero
/* 7F4D0 8007E8D0 0C01BE36 */  jal        func_8006F8D8
/* 7F4D4 8007E8D4 02403021 */   addu      $a2, $s2, $zero
/* 7F4D8 8007E8D8 2E220004 */  sltiu      $v0, $s1, 4
/* 7F4DC 8007E8DC 10400003 */  beqz       $v0, .L8007E8EC
/* 7F4E0 8007E8E0 3C03800E */   lui       $v1, %hi(some_combat_byte)
/* 7F4E4 8007E8E4 24020013 */  addiu      $v0, $zero, 0x13
/* 7F4E8 8007E8E8 A0627C71 */  sb         $v0, %lo(some_combat_byte)($v1)
.L8007E8EC:
/* 7F4EC 8007E8EC 00001021 */  addu       $v0, $zero, $zero
.L8007E8F0:
/* 7F4F0 8007E8F0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 7F4F4 8007E8F4 8FB40020 */  lw         $s4, 0x20($sp)
/* 7F4F8 8007E8F8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7F4FC 8007E8FC 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F500 8007E900 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F504 8007E904 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F508 8007E908 03E00008 */  jr         $ra
/* 7F50C 8007E90C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_equip_error
/* 7F510 8007E910 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 7F514 8007E914 AFB20060 */  sw         $s2, 0x60($sp)
/* 7F518 8007E918 00809021 */  addu       $s2, $a0, $zero
/* 7F51C 8007E91C AFB40068 */  sw         $s4, 0x68($sp)
/* 7F520 8007E920 00E0A021 */  addu       $s4, $a3, $zero
/* 7F524 8007E924 AFB30064 */  sw         $s3, 0x64($sp)
/* 7F528 8007E928 30B300FF */  andi       $s3, $a1, 0xff
/* 7F52C 8007E92C 00131080 */  sll        $v0, $s3, 2
/* 7F530 8007E930 02421021 */  addu       $v0, $s2, $v0
/* 7F534 8007E934 AFBF006C */  sw         $ra, 0x6c($sp)
/* 7F538 8007E938 AFB1005C */  sw         $s1, 0x5c($sp)
/* 7F53C 8007E93C AFB00058 */  sw         $s0, 0x58($sp)
/* 7F540 8007E940 8C510000 */  lw         $s1, ($v0)
/* 7F544 8007E944 12200038 */  beqz       $s1, .L8007EA28
/* 7F548 8007E948 30C500FF */   andi      $a1, $a2, 0xff
/* 7F54C 8007E94C 8E460010 */  lw         $a2, 0x10($s2)
/* 7F550 8007E950 8CC30000 */  lw         $v1, ($a2)
/* 7F554 8007E954 84640058 */  lh         $a0, 0x58($v1)
/* 7F558 8007E958 8C62005C */  lw         $v0, 0x5c($v1)
/* 7F55C 8007E95C 0040F809 */  jalr       $v0
/* 7F560 8007E960 00C42021 */   addu      $a0, $a2, $a0
/* 7F564 8007E964 00408021 */  addu       $s0, $v0, $zero
/* 7F568 8007E968 12000030 */  beqz       $s0, .L8007EA2C
/* 7F56C 8007E96C 24020001 */   addiu     $v0, $zero, 1
/* 7F570 8007E970 92020008 */  lbu        $v0, 8($s0)
/* 7F574 8007E974 10400014 */  beqz       $v0, .L8007E9C8
/* 7F578 8007E978 3C05800F */   lui       $a1, 0x800f
/* 7F57C 8007E97C 0C01EF15 */  jal        GetCharAspect
/* 7F580 8007E980 8E240014 */   lw        $a0, 0x14($s1)
/* 7F584 8007E984 92030008 */  lbu        $v1, 8($s0)
/* 7F588 8007E988 1062000E */  beq        $v1, $v0, .L8007E9C4
/* 7F58C 8007E98C 24020002 */   addiu     $v0, $zero, 2
/* 7F590 8007E990 0801FA8C */  j          .L8007EA30
/* 7F594 8007E994 8FBF006C */   lw        $ra, 0x6c($sp)
.L8007E998:
/* 7F598 8007E998 02602821 */  addu       $a1, $s3, $zero
/* 7F59C 8007E99C 02003021 */  addu       $a2, $s0, $zero
/* 7F5A0 8007E9A0 8C430004 */  lw         $v1, 4($v0)
/* 7F5A4 8007E9A4 8C420008 */  lw         $v0, 8($v0)
/* 7F5A8 8007E9A8 02203821 */  addu       $a3, $s1, $zero
/* 7F5AC 8007E9AC AFB40010 */  sw         $s4, 0x10($sp)
/* 7F5B0 8007E9B0 AFA30018 */  sw         $v1, 0x18($sp)
/* 7F5B4 8007E9B4 0040F809 */  jalr       $v0
/* 7F5B8 8007E9B8 AFA2001C */   sw        $v0, 0x1c($sp)
/* 7F5BC 8007E9BC 0801FA8C */  j          .L8007EA30
/* 7F5C0 8007E9C0 8FBF006C */   lw        $ra, 0x6c($sp)
.L8007E9C4:
/* 7F5C4 8007E9C4 3C05800F */  lui        $a1, %hi(itemtype_funcs)
.L8007E9C8:
/* 7F5C8 8007E9C8 96020000 */  lhu        $v0, ($s0)
/* 7F5CC 8007E9CC 90A31A18 */  lbu        $v1, %lo(itemtype_funcs)($a1)
/* 7F5D0 8007E9D0 00023202 */  srl        $a2, $v0, 8
/* 7F5D4 8007E9D4 240200FF */  addiu      $v0, $zero, 0xff
/* 7F5D8 8007E9D8 10620013 */  beq        $v1, $v0, .L8007EA28
/* 7F5DC 8007E9DC 00002021 */   addu      $a0, $zero, $zero
/* 7F5E0 8007E9E0 24A51A18 */  addiu      $a1, $a1, 0x1a18
/* 7F5E4 8007E9E4 240700FF */  addiu      $a3, $zero, 0xff
/* 7F5E8 8007E9E8 00041040 */  sll        $v0, $a0, 1
.L8007E9EC:
/* 7F5EC 8007E9EC 00441021 */  addu       $v0, $v0, $a0
/* 7F5F0 8007E9F0 00021080 */  sll        $v0, $v0, 2
/* 7F5F4 8007E9F4 00451021 */  addu       $v0, $v0, $a1
/* 7F5F8 8007E9F8 90430000 */  lbu        $v1, ($v0)
/* 7F5FC 8007E9FC 5066FFE6 */  beql       $v1, $a2, .L8007E998
/* 7F600 8007EA00 02402021 */   addu      $a0, $s2, $zero
/* 7F604 8007EA04 24820001 */  addiu      $v0, $a0, 1
/* 7F608 8007EA08 3044FFFF */  andi       $a0, $v0, 0xffff
/* 7F60C 8007EA0C 00041840 */  sll        $v1, $a0, 1
/* 7F610 8007EA10 00641821 */  addu       $v1, $v1, $a0
/* 7F614 8007EA14 00031880 */  sll        $v1, $v1, 2
/* 7F618 8007EA18 00651821 */  addu       $v1, $v1, $a1
/* 7F61C 8007EA1C 90620000 */  lbu        $v0, ($v1)
/* 7F620 8007EA20 1447FFF2 */  bne        $v0, $a3, .L8007E9EC
/* 7F624 8007EA24 00041040 */   sll       $v0, $a0, 1
.L8007EA28:
/* 7F628 8007EA28 24020001 */  addiu      $v0, $zero, 1
.L8007EA2C:
/* 7F62C 8007EA2C 8FBF006C */  lw         $ra, 0x6c($sp)
.L8007EA30:
/* 7F630 8007EA30 8FB40068 */  lw         $s4, 0x68($sp)
/* 7F634 8007EA34 8FB30064 */  lw         $s3, 0x64($sp)
/* 7F638 8007EA38 8FB20060 */  lw         $s2, 0x60($sp)
/* 7F63C 8007EA3C 8FB1005C */  lw         $s1, 0x5c($sp)
/* 7F640 8007EA40 8FB00058 */  lw         $s0, 0x58($sp)
/* 7F644 8007EA44 03E00008 */  jr         $ra
/* 7F648 8007EA48 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_8007EA4C
/* 7F64C 8007EA4C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 7F650 8007EA50 AFB50024 */  sw         $s5, 0x24($sp)
/* 7F654 8007EA54 0080A821 */  addu       $s5, $a0, $zero
/* 7F658 8007EA58 AFB40020 */  sw         $s4, 0x20($sp)
/* 7F65C 8007EA5C 00E0A021 */  addu       $s4, $a3, $zero
/* 7F660 8007EA60 02802021 */  addu       $a0, $s4, $zero
/* 7F664 8007EA64 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F668 8007EA68 00C08821 */  addu       $s1, $a2, $zero
/* 7F66C 8007EA6C AFB60028 */  sw         $s6, 0x28($sp)
/* 7F670 8007EA70 30B600FF */  andi       $s6, $a1, 0xff
/* 7F674 8007EA74 AFBF0030 */  sw         $ra, 0x30($sp)
/* 7F678 8007EA78 AFB7002C */  sw         $s7, 0x2c($sp)
/* 7F67C 8007EA7C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F680 8007EA80 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F684 8007EA84 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F688 8007EA88 96320000 */  lhu        $s2, ($s1)
/* 7F68C 8007EA8C 8FB70048 */  lw         $s7, 0x48($sp)
/* 7F690 8007EA90 0C01E05F */  jal        ret0
/* 7F694 8007EA94 02402821 */   addu      $a1, $s2, $zero
/* 7F698 8007EA98 00408021 */  addu       $s0, $v0, $zero
/* 7F69C 8007EA9C 16000037 */  bnez       $s0, .L8007EB7C
/* 7F6A0 8007EAA0 8FBF0030 */   lw        $ra, 0x30($sp)
/* 7F6A4 8007EAA4 0C01F994 */  jal        create_2ByteArray
/* 7F6A8 8007EAA8 8E24000C */   lw        $a0, 0xc($s1)
/* 7F6AC 8007EAAC 8E250010 */  lw         $a1, 0x10($s1)
/* 7F6B0 8007EAB0 00408821 */  addu       $s1, $v0, $zero
/* 7F6B4 8007EAB4 10A00002 */  beqz       $a1, .L8007EAC0
/* 7F6B8 8007EAB8 2413FFFF */   addiu     $s3, $zero, -1
/* 7F6BC 8007EABC 80B30004 */  lb         $s3, 4($a1)
.L8007EAC0:
/* 7F6C0 8007EAC0 8EA70010 */  lw         $a3, 0x10($s5)
/* 7F6C4 8007EAC4 02402821 */  addu       $a1, $s2, $zero
/* 7F6C8 8007EAC8 8CE30000 */  lw         $v1, ($a3)
/* 7F6CC 8007EACC 24060001 */  addiu      $a2, $zero, 1
/* 7F6D0 8007EAD0 84640038 */  lh         $a0, 0x38($v1)
/* 7F6D4 8007EAD4 8C62003C */  lw         $v0, 0x3c($v1)
/* 7F6D8 8007EAD8 0040F809 */  jalr       $v0
/* 7F6DC 8007EADC 00E42021 */   addu      $a0, $a3, $a0
/* 7F6E0 8007EAE0 14400009 */  bnez       $v0, .L8007EB08
/* 7F6E4 8007EAE4 00000000 */   nop
/* 7F6E8 8007EAE8 12200005 */  beqz       $s1, .L8007EB00
/* 7F6EC 8007EAEC 02202021 */   addu      $a0, $s1, $zero
/* 7F6F0 8007EAF0 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F6F4 8007EAF4 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F6F8 8007EAF8 0C02600C */  jal        Free
/* 7F6FC 8007EAFC 24060377 */   addiu     $a2, $zero, 0x377
.L8007EB00:
/* 7F700 8007EB00 0801FADE */  j          .L8007EB78
/* 7F704 8007EB04 24020001 */   addiu     $v0, $zero, 1
.L8007EB08:
/* 7F708 8007EB08 12E00007 */  beqz       $s7, .L8007EB28
/* 7F70C 8007EB0C 02A02021 */   addu      $a0, $s5, $zero
/* 7F710 8007EB10 8E820020 */  lw         $v0, 0x20($s4)
/* 7F714 8007EB14 8C420000 */  lw         $v0, ($v0)
/* 7F718 8007EB18 10400003 */  beqz       $v0, .L8007EB28
/* 7F71C 8007EB1C 00000000 */   nop
/* 7F720 8007EB20 94420000 */  lhu        $v0, ($v0)
/* 7F724 8007EB24 A6E20000 */  sh         $v0, ($s7)
.L8007EB28:
/* 7F728 8007EB28 0C01FD5C */  jal        remove_armor_from_character
/* 7F72C 8007EB2C 02C02821 */   addu      $a1, $s6, $zero
/* 7F730 8007EB30 00408021 */  addu       $s0, $v0, $zero
/* 7F734 8007EB34 1600000B */  bnez       $s0, .L8007EB64
/* 7F738 8007EB38 02A02021 */   addu      $a0, $s5, $zero
/* 7F73C 8007EB3C 02802021 */  addu       $a0, $s4, $zero
/* 7F740 8007EB40 02402821 */  addu       $a1, $s2, $zero
/* 7F744 8007EB44 0C01E0C2 */  jal        Equip_Armor
/* 7F748 8007EB48 02203021 */   addu      $a2, $s1, $zero
/* 7F74C 8007EB4C 8E820020 */  lw         $v0, 0x20($s4)
/* 7F750 8007EB50 8C440000 */  lw         $a0, ($v0)
/* 7F754 8007EB54 0C01F065 */  jal        func_8007C194
/* 7F758 8007EB58 02602821 */   addu      $a1, $s3, $zero
/* 7F75C 8007EB5C 0801FADE */  j          .L8007EB78
/* 7F760 8007EB60 00001021 */   addu      $v0, $zero, $zero
.L8007EB64:
/* 7F764 8007EB64 02402821 */  addu       $a1, $s2, $zero
/* 7F768 8007EB68 02203021 */  addu       $a2, $s1, $zero
/* 7F76C 8007EB6C 0C01F9A9 */  jal        func_8007E6A4
/* 7F770 8007EB70 02603821 */   addu      $a3, $s3, $zero
/* 7F774 8007EB74 02001021 */  addu       $v0, $s0, $zero
.L8007EB78:
/* 7F778 8007EB78 8FBF0030 */  lw         $ra, 0x30($sp)
.L8007EB7C:
/* 7F77C 8007EB7C 8FB7002C */  lw         $s7, 0x2c($sp)
/* 7F780 8007EB80 8FB60028 */  lw         $s6, 0x28($sp)
/* 7F784 8007EB84 8FB50024 */  lw         $s5, 0x24($sp)
/* 7F788 8007EB88 8FB40020 */  lw         $s4, 0x20($sp)
/* 7F78C 8007EB8C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7F790 8007EB90 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F794 8007EB94 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F798 8007EB98 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F79C 8007EB9C 03E00008 */  jr         $ra
/* 7F7A0 8007EBA0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8007EBA4
/* 7F7A4 8007EBA4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 7F7A8 8007EBA8 AFB50024 */  sw         $s5, 0x24($sp)
/* 7F7AC 8007EBAC 0080A821 */  addu       $s5, $a0, $zero
/* 7F7B0 8007EBB0 AFB40020 */  sw         $s4, 0x20($sp)
/* 7F7B4 8007EBB4 00E0A021 */  addu       $s4, $a3, $zero
/* 7F7B8 8007EBB8 02802021 */  addu       $a0, $s4, $zero
/* 7F7BC 8007EBBC AFB10014 */  sw         $s1, 0x14($sp)
/* 7F7C0 8007EBC0 00C08821 */  addu       $s1, $a2, $zero
/* 7F7C4 8007EBC4 AFB60028 */  sw         $s6, 0x28($sp)
/* 7F7C8 8007EBC8 30B600FF */  andi       $s6, $a1, 0xff
/* 7F7CC 8007EBCC AFBF0030 */  sw         $ra, 0x30($sp)
/* 7F7D0 8007EBD0 AFB7002C */  sw         $s7, 0x2c($sp)
/* 7F7D4 8007EBD4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F7D8 8007EBD8 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F7DC 8007EBDC AFB00010 */  sw         $s0, 0x10($sp)
/* 7F7E0 8007EBE0 96320000 */  lhu        $s2, ($s1)
/* 7F7E4 8007EBE4 8FB70048 */  lw         $s7, 0x48($sp)
/* 7F7E8 8007EBE8 0C01E061 */  jal        NoSheildSkill
/* 7F7EC 8007EBEC 02402821 */   addu      $a1, $s2, $zero
/* 7F7F0 8007EBF0 00408021 */  addu       $s0, $v0, $zero
/* 7F7F4 8007EBF4 16000037 */  bnez       $s0, .L8007ECD4
/* 7F7F8 8007EBF8 8FBF0030 */   lw        $ra, 0x30($sp)
/* 7F7FC 8007EBFC 0C01F994 */  jal        create_2ByteArray
/* 7F800 8007EC00 8E24000C */   lw        $a0, 0xc($s1)
/* 7F804 8007EC04 8E250010 */  lw         $a1, 0x10($s1)
/* 7F808 8007EC08 00408821 */  addu       $s1, $v0, $zero
/* 7F80C 8007EC0C 10A00002 */  beqz       $a1, .L8007EC18
/* 7F810 8007EC10 2413FFFF */   addiu     $s3, $zero, -1
/* 7F814 8007EC14 80B30004 */  lb         $s3, 4($a1)
.L8007EC18:
/* 7F818 8007EC18 8EA70010 */  lw         $a3, 0x10($s5)
/* 7F81C 8007EC1C 02402821 */  addu       $a1, $s2, $zero
/* 7F820 8007EC20 8CE30000 */  lw         $v1, ($a3)
/* 7F824 8007EC24 24060001 */  addiu      $a2, $zero, 1
/* 7F828 8007EC28 84640038 */  lh         $a0, 0x38($v1)
/* 7F82C 8007EC2C 8C62003C */  lw         $v0, 0x3c($v1)
/* 7F830 8007EC30 0040F809 */  jalr       $v0
/* 7F834 8007EC34 00E42021 */   addu      $a0, $a3, $a0
/* 7F838 8007EC38 14400009 */  bnez       $v0, .L8007EC60
/* 7F83C 8007EC3C 00000000 */   nop
/* 7F840 8007EC40 12200005 */  beqz       $s1, .L8007EC58
/* 7F844 8007EC44 02202021 */   addu      $a0, $s1, $zero
/* 7F848 8007EC48 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F84C 8007EC4C 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F850 8007EC50 0C02600C */  jal        Free
/* 7F854 8007EC54 240603B2 */   addiu     $a2, $zero, 0x3b2
.L8007EC58:
/* 7F858 8007EC58 0801FB34 */  j          .L8007ECD0
/* 7F85C 8007EC5C 24020001 */   addiu     $v0, $zero, 1
.L8007EC60:
/* 7F860 8007EC60 12E00007 */  beqz       $s7, .L8007EC80
/* 7F864 8007EC64 02A02021 */   addu      $a0, $s5, $zero
/* 7F868 8007EC68 8E820020 */  lw         $v0, 0x20($s4)
/* 7F86C 8007EC6C 8C420004 */  lw         $v0, 4($v0)
/* 7F870 8007EC70 10400003 */  beqz       $v0, .L8007EC80
/* 7F874 8007EC74 00000000 */   nop
/* 7F878 8007EC78 94420000 */  lhu        $v0, ($v0)
/* 7F87C 8007EC7C A6E20000 */  sh         $v0, ($s7)
.L8007EC80:
/* 7F880 8007EC80 0C01FDB0 */  jal        removeArmorIntoInventory
/* 7F884 8007EC84 02C02821 */   addu      $a1, $s6, $zero
/* 7F888 8007EC88 00408021 */  addu       $s0, $v0, $zero
/* 7F88C 8007EC8C 1600000B */  bnez       $s0, .L8007ECBC
/* 7F890 8007EC90 02A02021 */   addu      $a0, $s5, $zero
/* 7F894 8007EC94 02802021 */  addu       $a0, $s4, $zero
/* 7F898 8007EC98 02402821 */  addu       $a1, $s2, $zero
/* 7F89C 8007EC9C 0C01E0CA */  jal        EquipSheild
/* 7F8A0 8007ECA0 02203021 */   addu      $a2, $s1, $zero
/* 7F8A4 8007ECA4 8E830020 */  lw         $v1, 0x20($s4)
/* 7F8A8 8007ECA8 8C640004 */  lw         $a0, 4($v1)
/* 7F8AC 8007ECAC 0C01F065 */  jal        func_8007C194
/* 7F8B0 8007ECB0 02602821 */   addu      $a1, $s3, $zero
/* 7F8B4 8007ECB4 0801FB34 */  j          .L8007ECD0
/* 7F8B8 8007ECB8 00001021 */   addu      $v0, $zero, $zero
.L8007ECBC:
/* 7F8BC 8007ECBC 02402821 */  addu       $a1, $s2, $zero
/* 7F8C0 8007ECC0 02203021 */  addu       $a2, $s1, $zero
/* 7F8C4 8007ECC4 0C01F9A9 */  jal        func_8007E6A4
/* 7F8C8 8007ECC8 02603821 */   addu      $a3, $s3, $zero
/* 7F8CC 8007ECCC 02001021 */  addu       $v0, $s0, $zero
.L8007ECD0:
/* 7F8D0 8007ECD0 8FBF0030 */  lw         $ra, 0x30($sp)
.L8007ECD4:
/* 7F8D4 8007ECD4 8FB7002C */  lw         $s7, 0x2c($sp)
/* 7F8D8 8007ECD8 8FB60028 */  lw         $s6, 0x28($sp)
/* 7F8DC 8007ECDC 8FB50024 */  lw         $s5, 0x24($sp)
/* 7F8E0 8007ECE0 8FB40020 */  lw         $s4, 0x20($sp)
/* 7F8E4 8007ECE4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7F8E8 8007ECE8 8FB20018 */  lw         $s2, 0x18($sp)
/* 7F8EC 8007ECEC 8FB10014 */  lw         $s1, 0x14($sp)
/* 7F8F0 8007ECF0 8FB00010 */  lw         $s0, 0x10($sp)
/* 7F8F4 8007ECF4 03E00008 */  jr         $ra
/* 7F8F8 8007ECF8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8007ECFC
/* 7F8FC 8007ECFC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 7F900 8007ED00 AFB40020 */  sw         $s4, 0x20($sp)
/* 7F904 8007ED04 0080A021 */  addu       $s4, $a0, $zero
/* 7F908 8007ED08 AFB50024 */  sw         $s5, 0x24($sp)
/* 7F90C 8007ED0C 00E0A821 */  addu       $s5, $a3, $zero
/* 7F910 8007ED10 02A02021 */  addu       $a0, $s5, $zero
/* 7F914 8007ED14 AFB10014 */  sw         $s1, 0x14($sp)
/* 7F918 8007ED18 00C08821 */  addu       $s1, $a2, $zero
/* 7F91C 8007ED1C AFB60028 */  sw         $s6, 0x28($sp)
/* 7F920 8007ED20 30B600FF */  andi       $s6, $a1, 0xff
/* 7F924 8007ED24 AFBF0030 */  sw         $ra, 0x30($sp)
/* 7F928 8007ED28 AFB7002C */  sw         $s7, 0x2c($sp)
/* 7F92C 8007ED2C AFB3001C */  sw         $s3, 0x1c($sp)
/* 7F930 8007ED30 AFB20018 */  sw         $s2, 0x18($sp)
/* 7F934 8007ED34 AFB00010 */  sw         $s0, 0x10($sp)
/* 7F938 8007ED38 96320000 */  lhu        $s2, ($s1)
/* 7F93C 8007ED3C 8FB70048 */  lw         $s7, 0x48($sp)
/* 7F940 8007ED40 0C01E069 */  jal        canEquipWeapon
/* 7F944 8007ED44 02402821 */   addu      $a1, $s2, $zero
/* 7F948 8007ED48 00408021 */  addu       $s0, $v0, $zero
/* 7F94C 8007ED4C 12000005 */  beqz       $s0, .L8007ED64
/* 7F950 8007ED50 02802021 */   addu      $a0, $s4, $zero
/* 7F954 8007ED54 0C01F9E6 */  jal        func_8007E798
/* 7F958 8007ED58 02002821 */   addu      $a1, $s0, $zero
/* 7F95C 8007ED5C 0801FB98 */  j          .L8007EE60
/* 7F960 8007ED60 8FBF0030 */   lw        $ra, 0x30($sp)
.L8007ED64:
/* 7F964 8007ED64 0C01F994 */  jal        create_2ByteArray
/* 7F968 8007ED68 8E24000C */   lw        $a0, 0xc($s1)
/* 7F96C 8007ED6C 8E250010 */  lw         $a1, 0x10($s1)
/* 7F970 8007ED70 00408821 */  addu       $s1, $v0, $zero
/* 7F974 8007ED74 10A00002 */  beqz       $a1, .L8007ED80
/* 7F978 8007ED78 2413FFFF */   addiu     $s3, $zero, -1
/* 7F97C 8007ED7C 80B30004 */  lb         $s3, 4($a1)
.L8007ED80:
/* 7F980 8007ED80 8E870010 */  lw         $a3, 0x10($s4)
/* 7F984 8007ED84 02402821 */  addu       $a1, $s2, $zero
/* 7F988 8007ED88 8CE30000 */  lw         $v1, ($a3)
/* 7F98C 8007ED8C 24060001 */  addiu      $a2, $zero, 1
/* 7F990 8007ED90 84640038 */  lh         $a0, 0x38($v1)
/* 7F994 8007ED94 8C62003C */  lw         $v0, 0x3c($v1)
/* 7F998 8007ED98 0040F809 */  jalr       $v0
/* 7F99C 8007ED9C 00E42021 */   addu      $a0, $a3, $a0
/* 7F9A0 8007EDA0 14400009 */  bnez       $v0, .L8007EDC8
/* 7F9A4 8007EDA4 00000000 */   nop
/* 7F9A8 8007EDA8 12200005 */  beqz       $s1, .L8007EDC0
/* 7F9AC 8007EDAC 02202021 */   addu      $a0, $s1, $zero
/* 7F9B0 8007EDB0 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7F9B4 8007EDB4 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7F9B8 8007EDB8 0C02600C */  jal        Free
/* 7F9BC 8007EDBC 240603ED */   addiu     $a2, $zero, 0x3ed
.L8007EDC0:
/* 7F9C0 8007EDC0 0801FB97 */  j          .L8007EE5C
/* 7F9C4 8007EDC4 24020001 */   addiu     $v0, $zero, 1
.L8007EDC8:
/* 7F9C8 8007EDC8 12E00006 */  beqz       $s7, .L8007EDE4
/* 7F9CC 8007EDCC 02802021 */   addu      $a0, $s4, $zero
/* 7F9D0 8007EDD0 8EA20024 */  lw         $v0, 0x24($s5)
/* 7F9D4 8007EDD4 10400003 */  beqz       $v0, .L8007EDE4
/* 7F9D8 8007EDD8 00000000 */   nop
/* 7F9DC 8007EDDC 94420000 */  lhu        $v0, ($v0)
/* 7F9E0 8007EDE0 A6E20000 */  sh         $v0, ($s7)
.L8007EDE4:
/* 7F9E4 8007EDE4 0C01FE04 */  jal        MoveWeaponsToInventory
/* 7F9E8 8007EDE8 02C02821 */   addu      $a1, $s6, $zero
/* 7F9EC 8007EDEC 00408021 */  addu       $s0, $v0, $zero
/* 7F9F0 8007EDF0 12000007 */  beqz       $s0, .L8007EE10
/* 7F9F4 8007EDF4 02802021 */   addu      $a0, $s4, $zero
/* 7F9F8 8007EDF8 02402821 */  addu       $a1, $s2, $zero
/* 7F9FC 8007EDFC 02203021 */  addu       $a2, $s1, $zero
/* 7FA00 8007EE00 0C01F9A9 */  jal        func_8007E6A4
/* 7FA04 8007EE04 02603821 */   addu      $a3, $s3, $zero
/* 7FA08 8007EE08 0801FB97 */  j          .L8007EE5C
/* 7FA0C 8007EE0C 02001021 */   addu      $v0, $s0, $zero
.L8007EE10:
/* 7FA10 8007EE10 02A02021 */  addu       $a0, $s5, $zero
/* 7FA14 8007EE14 02402821 */  addu       $a1, $s2, $zero
/* 7FA18 8007EE18 0C01E0E2 */  jal        EquipWeapon
/* 7FA1C 8007EE1C 02203021 */   addu      $a2, $s1, $zero
/* 7FA20 8007EE20 8EA40024 */  lw         $a0, 0x24($s5)
/* 7FA24 8007EE24 0C01F065 */  jal        func_8007C194
/* 7FA28 8007EE28 02602821 */   addu      $a1, $s3, $zero
/* 7FA2C 8007EE2C 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 7FA30 8007EE30 90447C70 */  lbu        $a0, %lo(combat_bytes)($v0)
/* 7FA34 8007EE34 2403000E */  addiu      $v1, $zero, 0xe
/* 7FA38 8007EE38 14830008 */  bne        $a0, $v1, .L8007EE5C
/* 7FA3C 8007EE3C 00001021 */   addu      $v0, $zero, $zero
/* 7FA40 8007EE40 3C02800F */  lui        $v0, %hi(combatPointer)
/* 7FA44 8007EE44 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 7FA48 8007EE48 00162080 */  sll        $a0, $s6, 2
/* 7FA4C 8007EE4C 00641821 */  addu       $v1, $v1, $a0
/* 7FA50 8007EE50 0C01A89D */  jal        func_8006A274
/* 7FA54 8007EE54 8C6452D0 */   lw        $a0, 0x52d0($v1)
/* 7FA58 8007EE58 00001021 */  addu       $v0, $zero, $zero
.L8007EE5C:
/* 7FA5C 8007EE5C 8FBF0030 */  lw         $ra, 0x30($sp)
.L8007EE60:
/* 7FA60 8007EE60 8FB7002C */  lw         $s7, 0x2c($sp)
/* 7FA64 8007EE64 8FB60028 */  lw         $s6, 0x28($sp)
/* 7FA68 8007EE68 8FB50024 */  lw         $s5, 0x24($sp)
/* 7FA6C 8007EE6C 8FB40020 */  lw         $s4, 0x20($sp)
/* 7FA70 8007EE70 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7FA74 8007EE74 8FB20018 */  lw         $s2, 0x18($sp)
/* 7FA78 8007EE78 8FB10014 */  lw         $s1, 0x14($sp)
/* 7FA7C 8007EE7C 8FB00010 */  lw         $s0, 0x10($sp)
/* 7FA80 8007EE80 03E00008 */  jr         $ra
/* 7FA84 8007EE84 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8007EE88
/* 7FA88 8007EE88 3C02800F */  lui        $v0, %hi(D_800E9AC0)
/* 7FA8C 8007EE8C 8C439AC0 */  lw         $v1, %lo(D_800E9AC0)($v0)
/* 7FA90 8007EE90 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 7FA94 8007EE94 AFB20020 */  sw         $s2, 0x20($sp)
/* 7FA98 8007EE98 00809021 */  addu       $s2, $a0, $zero
/* 7FA9C 8007EE9C AFB00018 */  sw         $s0, 0x18($sp)
/* 7FAA0 8007EEA0 00C08021 */  addu       $s0, $a2, $zero
/* 7FAA4 8007EEA4 AFB30024 */  sw         $s3, 0x24($sp)
/* 7FAA8 8007EEA8 00E09821 */  addu       $s3, $a3, $zero
/* 7FAAC 8007EEAC AFB1001C */  sw         $s1, 0x1c($sp)
/* 7FAB0 8007EEB0 30B100FF */  andi       $s1, $a1, 0xff
/* 7FAB4 8007EEB4 10600005 */  beqz       $v1, .L8007EECC
/* 7FAB8 8007EEB8 AFBF0028 */   sw        $ra, 0x28($sp)
/* 7FABC 8007EEBC 0C01FC61 */  jal        use_scroll
/* 7FAC0 8007EEC0 02202821 */   addu      $a1, $s1, $zero
/* 7FAC4 8007EEC4 0801FBCC */  j          .L8007EF30
/* 7FAC8 8007EEC8 8FBF0028 */   lw        $ra, 0x28($sp)
.L8007EECC:
/* 7FACC 8007EECC 0C01D7C6 */  jal        search_item_array
/* 7FAD0 8007EED0 96040000 */   lhu       $a0, ($s0)
/* 7FAD4 8007EED4 3C04800F */  lui        $a0, %hi(item_pointer)
/* 7FAD8 8007EED8 00021840 */  sll        $v1, $v0, 1
/* 7FADC 8007EEDC 8C8514F0 */  lw         $a1, %lo(item_pointer)($a0)
/* 7FAE0 8007EEE0 00621821 */  addu       $v1, $v1, $v0
/* 7FAE4 8007EEE4 8CA20018 */  lw         $v0, 0x18($a1)
/* 7FAE8 8007EEE8 00031900 */  sll        $v1, $v1, 4
/* 7FAEC 8007EEEC 00431021 */  addu       $v0, $v0, $v1
/* 7FAF0 8007EEF0 80440025 */  lb         $a0, 0x25($v0)
/* 7FAF4 8007EEF4 2403FFFF */  addiu      $v1, $zero, -1
/* 7FAF8 8007EEF8 1083000B */  beq        $a0, $v1, .L8007EF28
/* 7FAFC 8007EEFC 02402021 */   addu      $a0, $s2, $zero
/* 7FB00 8007EF00 02202821 */  addu       $a1, $s1, $zero
/* 7FB04 8007EF04 02003021 */  addu       $a2, $s0, $zero
/* 7FB08 8007EF08 02603821 */  addu       $a3, $s3, $zero
/* 7FB0C 8007EF0C 8FA30040 */  lw         $v1, 0x40($sp)
/* 7FB10 8007EF10 24020003 */  addiu      $v0, $zero, 3
/* 7FB14 8007EF14 AFA20010 */  sw         $v0, 0x10($sp)
/* 7FB18 8007EF18 0C020C29 */  jal        func_800830A4
/* 7FB1C 8007EF1C AFA30014 */   sw        $v1, 0x14($sp)
/* 7FB20 8007EF20 0801FBCC */  j          .L8007EF30
/* 7FB24 8007EF24 8FBF0028 */   lw        $ra, 0x28($sp)
.L8007EF28:
/* 7FB28 8007EF28 24020001 */  addiu      $v0, $zero, 1
/* 7FB2C 8007EF2C 8FBF0028 */  lw         $ra, 0x28($sp)
.L8007EF30:
/* 7FB30 8007EF30 8FB30024 */  lw         $s3, 0x24($sp)
/* 7FB34 8007EF34 8FB20020 */  lw         $s2, 0x20($sp)
/* 7FB38 8007EF38 8FB1001C */  lw         $s1, 0x1c($sp)
/* 7FB3C 8007EF3C 8FB00018 */  lw         $s0, 0x18($sp)
/* 7FB40 8007EF40 03E00008 */  jr         $ra
/* 7FB44 8007EF44 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_with_ring
/* 7FB48 8007EF48 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 7FB4C 8007EF4C 24020002 */  addiu      $v0, $zero, 2
/* 7FB50 8007EF50 8FA30030 */  lw         $v1, 0x30($sp)
/* 7FB54 8007EF54 30A500FF */  andi       $a1, $a1, 0xff
/* 7FB58 8007EF58 AFBF0018 */  sw         $ra, 0x18($sp)
/* 7FB5C 8007EF5C AFA20010 */  sw         $v0, 0x10($sp)
/* 7FB60 8007EF60 0C020C29 */  jal        func_800830A4
/* 7FB64 8007EF64 AFA30014 */   sw        $v1, 0x14($sp)
/* 7FB68 8007EF68 8FBF0018 */  lw         $ra, 0x18($sp)
/* 7FB6C 8007EF6C 03E00008 */  jr         $ra
/* 7FB70 8007EF70 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8007EF74
/* 7FB74 8007EF74 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 7FB78 8007EF78 AFB40028 */  sw         $s4, 0x28($sp)
/* 7FB7C 8007EF7C 0080A021 */  addu       $s4, $a0, $zero
/* 7FB80 8007EF80 AFB60030 */  sw         $s6, 0x30($sp)
/* 7FB84 8007EF84 00E0B021 */  addu       $s6, $a3, $zero
/* 7FB88 8007EF88 02C02021 */  addu       $a0, $s6, $zero
/* 7FB8C 8007EF8C AFB1001C */  sw         $s1, 0x1c($sp)
/* 7FB90 8007EF90 00C08821 */  addu       $s1, $a2, $zero
/* 7FB94 8007EF94 AFB70034 */  sw         $s7, 0x34($sp)
/* 7FB98 8007EF98 30B700FF */  andi       $s7, $a1, 0xff
/* 7FB9C 8007EF9C AFBF0038 */  sw         $ra, 0x38($sp)
/* 7FBA0 8007EFA0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 7FBA4 8007EFA4 AFB30024 */  sw         $s3, 0x24($sp)
/* 7FBA8 8007EFA8 AFB20020 */  sw         $s2, 0x20($sp)
/* 7FBAC 8007EFAC AFB00018 */  sw         $s0, 0x18($sp)
/* 7FBB0 8007EFB0 96320000 */  lhu        $s2, ($s1)
/* 7FBB4 8007EFB4 8FB50050 */  lw         $s5, 0x50($sp)
/* 7FBB8 8007EFB8 0C01E09C */  jal        something_with_gear_INT
/* 7FBBC 8007EFBC 02402821 */   addu      $a1, $s2, $zero
/* 7FBC0 8007EFC0 02802021 */  addu       $a0, $s4, $zero
/* 7FBC4 8007EFC4 0C01F9E6 */  jal        func_8007E798
/* 7FBC8 8007EFC8 00402821 */   addu      $a1, $v0, $zero
/* 7FBCC 8007EFCC 00408021 */  addu       $s0, $v0, $zero
/* 7FBD0 8007EFD0 16000044 */  bnez       $s0, .L8007F0E4
/* 7FBD4 8007EFD4 8FBF0038 */   lw        $ra, 0x38($sp)
/* 7FBD8 8007EFD8 0C01F994 */  jal        create_2ByteArray
/* 7FBDC 8007EFDC 8E24000C */   lw        $a0, 0xc($s1)
/* 7FBE0 8007EFE0 8E260010 */  lw         $a2, 0x10($s1)
/* 7FBE4 8007EFE4 00408821 */  addu       $s1, $v0, $zero
/* 7FBE8 8007EFE8 10C00002 */  beqz       $a2, .L8007EFF4
/* 7FBEC 8007EFEC 2413FFFF */   addiu     $s3, $zero, -1
/* 7FBF0 8007EFF0 80D30004 */  lb         $s3, 4($a2)
.L8007EFF4:
/* 7FBF4 8007EFF4 8E870010 */  lw         $a3, 0x10($s4)
/* 7FBF8 8007EFF8 02402821 */  addu       $a1, $s2, $zero
/* 7FBFC 8007EFFC 8CE30000 */  lw         $v1, ($a3)
/* 7FC00 8007F000 24060001 */  addiu      $a2, $zero, 1
/* 7FC04 8007F004 84640038 */  lh         $a0, 0x38($v1)
/* 7FC08 8007F008 8C62003C */  lw         $v0, 0x3c($v1)
/* 7FC0C 8007F00C 0040F809 */  jalr       $v0
/* 7FC10 8007F010 00E42021 */   addu      $a0, $a3, $a0
/* 7FC14 8007F014 54400009 */  bnel       $v0, $zero, .L8007F03C
/* 7FC18 8007F018 8EC40028 */   lw        $a0, 0x28($s6)
/* 7FC1C 8007F01C 12200005 */  beqz       $s1, .L8007F034
/* 7FC20 8007F020 02202021 */   addu      $a0, $s1, $zero
/* 7FC24 8007F024 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 7FC28 8007F028 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 7FC2C 8007F02C 0C02600C */  jal        Free
/* 7FC30 8007F030 24060457 */   addiu     $a2, $zero, 0x457
.L8007F034:
/* 7FC34 8007F034 0801FC38 */  j          .L8007F0E0
/* 7FC38 8007F038 24020001 */   addiu     $v0, $zero, 1
.L8007F03C:
/* 7FC3C 8007F03C 00003021 */  addu       $a2, $zero, $zero
/* 7FC40 8007F040 90820004 */  lbu        $v0, 4($a0)
/* 7FC44 8007F044 1040001F */  beqz       $v0, .L8007F0C4
/* 7FC48 8007F048 00121A02 */   srl       $v1, $s2, 8
/* 7FC4C 8007F04C 3065FFFF */  andi       $a1, $v1, 0xffff
/* 7FC50 8007F050 8C830000 */  lw         $v1, ($a0)
.L8007F054:
/* 7FC54 8007F054 00061080 */  sll        $v0, $a2, 2
/* 7FC58 8007F058 00431021 */  addu       $v0, $v0, $v1
/* 7FC5C 8007F05C 8C420000 */  lw         $v0, ($v0)
/* 7FC60 8007F060 50400014 */  beql       $v0, $zero, .L8007F0B4
/* 7FC64 8007F064 90820004 */   lbu       $v0, 4($a0)
/* 7FC68 8007F068 94430000 */  lhu        $v1, ($v0)
/* 7FC6C 8007F06C 00031202 */  srl        $v0, $v1, 8
/* 7FC70 8007F070 54450010 */  bnel       $v0, $a1, .L8007F0B4
/* 7FC74 8007F074 90820004 */   lbu       $v0, 4($a0)
/* 7FC78 8007F078 56A00001 */  bnel       $s5, $zero, .L8007F080
/* 7FC7C 8007F07C A6A30000 */   sh        $v1, ($s5)
.L8007F080:
/* 7FC80 8007F080 02802021 */  addu       $a0, $s4, $zero
/* 7FC84 8007F084 02E02821 */  addu       $a1, $s7, $zero
/* 7FC88 8007F088 0C01FE6E */  jal        func_8007F9B8
/* 7FC8C 8007F08C 30C600FF */   andi      $a2, $a2, 0xff
/* 7FC90 8007F090 00408021 */  addu       $s0, $v0, $zero
/* 7FC94 8007F094 1200000B */  beqz       $s0, .L8007F0C4
/* 7FC98 8007F098 02802021 */   addu      $a0, $s4, $zero
/* 7FC9C 8007F09C 02402821 */  addu       $a1, $s2, $zero
/* 7FCA0 8007F0A0 02203021 */  addu       $a2, $s1, $zero
/* 7FCA4 8007F0A4 0C01F9A9 */  jal        func_8007E6A4
/* 7FCA8 8007F0A8 02603821 */   addu      $a3, $s3, $zero
/* 7FCAC 8007F0AC 0801FC38 */  j          .L8007F0E0
/* 7FCB0 8007F0B0 02001021 */   addu      $v0, $s0, $zero
.L8007F0B4:
/* 7FCB4 8007F0B4 24C60001 */  addiu      $a2, $a2, 1
/* 7FCB8 8007F0B8 00C2102B */  sltu       $v0, $a2, $v0
/* 7FCBC 8007F0BC 5440FFE5 */  bnel       $v0, $zero, .L8007F054
/* 7FCC0 8007F0C0 8C830000 */   lw        $v1, ($a0)
.L8007F0C4:
/* 7FCC4 8007F0C4 AFB30010 */  sw         $s3, 0x10($sp)
/* 7FCC8 8007F0C8 02802021 */  addu       $a0, $s4, $zero
/* 7FCCC 8007F0CC 02C02821 */  addu       $a1, $s6, $zero
/* 7FCD0 8007F0D0 02403021 */  addu       $a2, $s2, $zero
/* 7FCD4 8007F0D4 0C01FC43 */  jal        func_8007F10C
/* 7FCD8 8007F0D8 02203821 */   addu      $a3, $s1, $zero
/* 7FCDC 8007F0DC 00001021 */  addu       $v0, $zero, $zero
.L8007F0E0:
/* 7FCE0 8007F0E0 8FBF0038 */  lw         $ra, 0x38($sp)
.L8007F0E4:
/* 7FCE4 8007F0E4 8FB70034 */  lw         $s7, 0x34($sp)
/* 7FCE8 8007F0E8 8FB60030 */  lw         $s6, 0x30($sp)
/* 7FCEC 8007F0EC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 7FCF0 8007F0F0 8FB40028 */  lw         $s4, 0x28($sp)
/* 7FCF4 8007F0F4 8FB30024 */  lw         $s3, 0x24($sp)
/* 7FCF8 8007F0F8 8FB20020 */  lw         $s2, 0x20($sp)
/* 7FCFC 8007F0FC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 7FD00 8007F100 8FB00018 */  lw         $s0, 0x18($sp)
/* 7FD04 8007F104 03E00008 */  jr         $ra
/* 7FD08 8007F108 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8007F10C
/* 7FD0C 8007F10C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 7FD10 8007F110 AFB20018 */  sw         $s2, 0x18($sp)
/* 7FD14 8007F114 00A09021 */  addu       $s2, $a1, $zero
/* 7FD18 8007F118 02402021 */  addu       $a0, $s2, $zero
/* 7FD1C 8007F11C AFB10014 */  sw         $s1, 0x14($sp)
/* 7FD20 8007F120 30D1FFFF */  andi       $s1, $a2, 0xffff
/* 7FD24 8007F124 02202821 */  addu       $a1, $s1, $zero
/* 7FD28 8007F128 AFB3001C */  sw         $s3, 0x1c($sp)
/* 7FD2C 8007F12C 83B3003B */  lb         $s3, 0x3b($sp)
/* 7FD30 8007F130 00E03021 */  addu       $a2, $a3, $zero
/* 7FD34 8007F134 AFBF0020 */  sw         $ra, 0x20($sp)
/* 7FD38 8007F138 0C01E103 */  jal        func_8007840C
/* 7FD3C 8007F13C AFB00010 */   sw        $s0, 0x10($sp)
/* 7FD40 8007F140 8E500028 */  lw         $s0, 0x28($s2)
/* 7FD44 8007F144 02202821 */  addu       $a1, $s1, $zero
/* 7FD48 8007F148 0C01F6AA */  jal        func_8007DAA8
/* 7FD4C 8007F14C 02002021 */   addu      $a0, $s0, $zero
/* 7FD50 8007F150 8E030000 */  lw         $v1, ($s0)
/* 7FD54 8007F154 00021080 */  sll        $v0, $v0, 2
/* 7FD58 8007F158 00431021 */  addu       $v0, $v0, $v1
/* 7FD5C 8007F15C 8C440000 */  lw         $a0, ($v0)
/* 7FD60 8007F160 0C01F065 */  jal        func_8007C194
/* 7FD64 8007F164 02602821 */   addu      $a1, $s3, $zero
/* 7FD68 8007F168 8FBF0020 */  lw         $ra, 0x20($sp)
/* 7FD6C 8007F16C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 7FD70 8007F170 8FB20018 */  lw         $s2, 0x18($sp)
/* 7FD74 8007F174 8FB10014 */  lw         $s1, 0x14($sp)
/* 7FD78 8007F178 8FB00010 */  lw         $s0, 0x10($sp)
/* 7FD7C 8007F17C 03E00008 */  jr         $ra
/* 7FD80 8007F180 27BD0028 */   addiu     $sp, $sp, 0x28

glabel use_scroll
/* 7FD84 8007F184 27BDFCC0 */  addiu      $sp, $sp, -0x340
/* 7FD88 8007F188 AFB60338 */  sw         $s6, 0x338($sp)
/* 7FD8C 8007F18C 0080B021 */  addu       $s6, $a0, $zero
/* 7FD90 8007F190 AFB3032C */  sw         $s3, 0x32c($sp)
/* 7FD94 8007F194 00E09821 */  addu       $s3, $a3, $zero
/* 7FD98 8007F198 2405000B */  addiu      $a1, $zero, 0xb
/* 7FD9C 8007F19C AFBF033C */  sw         $ra, 0x33c($sp)
/* 7FDA0 8007F1A0 AFB50334 */  sw         $s5, 0x334($sp)
/* 7FDA4 8007F1A4 AFB40330 */  sw         $s4, 0x330($sp)
/* 7FDA8 8007F1A8 AFB20328 */  sw         $s2, 0x328($sp)
/* 7FDAC 8007F1AC AFB10324 */  sw         $s1, 0x324($sp)
/* 7FDB0 8007F1B0 AFB00320 */  sw         $s0, 0x320($sp)
/* 7FDB4 8007F1B4 8E64001C */  lw         $a0, 0x1c($s3)
/* 7FDB8 8007F1B8 0C020F4B */  jal        capskillBaseMax
/* 7FDBC 8007F1BC 00C08021 */   addu      $s0, $a2, $zero
/* 7FDC0 8007F1C0 0040A021 */  addu       $s4, $v0, $zero
/* 7FDC4 8007F1C4 06830017 */  bgezl      $s4, .L8007F224
/* 7FDC8 8007F1C8 96150000 */   lhu       $s5, ($s0)
/* 7FDCC 8007F1CC 24050096 */  addiu      $a1, $zero, 0x96
/* 7FDD0 8007F1D0 27A40018 */  addiu      $a0, $sp, 0x18
/* 7FDD4 8007F1D4 00803021 */  addu       $a2, $a0, $zero
/* 7FDD8 8007F1D8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 7FDDC 8007F1DC 240300FF */  addiu      $v1, $zero, 0xff
/* 7FDE0 8007F1E0 A3A20018 */  sb         $v0, 0x18($sp)
/* 7FDE4 8007F1E4 A0820001 */  sb         $v0, 1($a0)
/* 7FDE8 8007F1E8 A0820002 */  sb         $v0, 2($a0)
/* 7FDEC 8007F1EC 24020032 */  addiu      $v0, $zero, 0x32
/* 7FDF0 8007F1F0 A0830003 */  sb         $v1, 3($a0)
/* 7FDF4 8007F1F4 A3A20058 */  sb         $v0, 0x58($sp)
/* 7FDF8 8007F1F8 A3A20059 */  sb         $v0, 0x59($sp)
/* 7FDFC 8007F1FC A3A2005A */  sb         $v0, 0x5a($sp)
/* 7FE00 8007F200 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 7FE04 8007F204 8C4788F4 */  lw         $a3, %lo(commonstringsmirror)($v0)
/* 7FE08 8007F208 24030096 */  addiu      $v1, $zero, 0x96
/* 7FE0C 8007F20C A3A3005B */  sb         $v1, 0x5b($sp)
/* 7FE10 8007F210 24030001 */  addiu      $v1, $zero, 1
/* 7FE14 8007F214 AFA30010 */  sw         $v1, 0x10($sp)
/* 7FE18 8007F218 8CE406E4 */  lw         $a0, 0x6e4($a3)
/* 7FE1C 8007F21C 0801FD0C */  j          .L8007F430
/* 7FE20 8007F220 27A70058 */   addiu     $a3, $sp, 0x58
.L8007F224:
/* 7FE24 8007F224 0C01D7C6 */  jal        search_item_array
/* 7FE28 8007F228 02A02021 */   addu      $a0, $s5, $zero
/* 7FE2C 8007F22C 3C04800F */  lui        $a0, %hi(item_pointer)
/* 7FE30 8007F230 00021840 */  sll        $v1, $v0, 1
/* 7FE34 8007F234 8C8514F0 */  lw         $a1, %lo(item_pointer)($a0)
/* 7FE38 8007F238 00621821 */  addu       $v1, $v1, $v0
/* 7FE3C 8007F23C 8CA20018 */  lw         $v0, 0x18($a1)
/* 7FE40 8007F240 00031900 */  sll        $v1, $v1, 4
/* 7FE44 8007F244 00438021 */  addu       $s0, $v0, $v1
/* 7FE48 8007F248 82030025 */  lb         $v1, 0x25($s0)
/* 7FE4C 8007F24C 2402FFFF */  addiu      $v0, $zero, -1
/* 7FE50 8007F250 14620015 */  bne        $v1, $v0, .L8007F2A8
/* 7FE54 8007F254 3C02800F */   lui       $v0, 0x800f
/* 7FE58 8007F258 3C04800E */  lui        $a0, %hi(D_800E0BD4)
/* 7FE5C 8007F25C 24840BD4 */  addiu      $a0, $a0, %lo(D_800E0BD4)
/* 7FE60 8007F260 24050096 */  addiu      $a1, $zero, 0x96
/* 7FE64 8007F264 27A60098 */  addiu      $a2, $sp, 0x98
/* 7FE68 8007F268 27A700D8 */  addiu      $a3, $sp, 0xd8
/* 7FE6C 8007F26C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 7FE70 8007F270 240300FF */  addiu      $v1, $zero, 0xff
/* 7FE74 8007F274 A3A20098 */  sb         $v0, 0x98($sp)
/* 7FE78 8007F278 A3A20099 */  sb         $v0, 0x99($sp)
/* 7FE7C 8007F27C A3A2009A */  sb         $v0, 0x9a($sp)
/* 7FE80 8007F280 24020032 */  addiu      $v0, $zero, 0x32
/* 7FE84 8007F284 A3A3009B */  sb         $v1, 0x9b($sp)
/* 7FE88 8007F288 24030096 */  addiu      $v1, $zero, 0x96
/* 7FE8C 8007F28C A3A200D8 */  sb         $v0, 0xd8($sp)
/* 7FE90 8007F290 A3A200D9 */  sb         $v0, 0xd9($sp)
/* 7FE94 8007F294 A3A200DA */  sb         $v0, 0xda($sp)
/* 7FE98 8007F298 24020001 */  addiu      $v0, $zero, 1
/* 7FE9C 8007F29C A3A300DB */  sb         $v1, 0xdb($sp)
/* 7FEA0 8007F2A0 0801FD0C */  j          .L8007F430
/* 7FEA4 8007F2A4 AFA20010 */   sw        $v0, 0x10($sp)
.L8007F2A8:
/* 7FEA8 8007F2A8 244216B0 */  addiu      $v0, $v0, 0x16b0
/* 7FEAC 8007F2AC 00621021 */  addu       $v0, $v1, $v0
/* 7FEB0 8007F2B0 8E64002C */  lw         $a0, 0x2c($s3)
/* 7FEB4 8007F2B4 90430000 */  lbu        $v1, ($v0)
/* 7FEB8 8007F2B8 27A60118 */  addiu      $a2, $sp, 0x118
/* 7FEBC 8007F2BC A3A00118 */  sb         $zero, 0x118($sp)
/* 7FEC0 8007F2C0 34720300 */  ori        $s2, $v1, 0x300
/* 7FEC4 8007F2C4 0C021108 */  jal        knows_spell
/* 7FEC8 8007F2C8 02402821 */   addu      $a1, $s2, $zero
/* 7FECC 8007F2CC 1040001B */  beqz       $v0, .L8007F33C
/* 7FED0 8007F2D0 3C05800F */   lui       $a1, 0x800f
/* 7FED4 8007F2D4 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 7FED8 8007F2D8 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 7FEDC 8007F2DC 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 7FEE0 8007F2E0 8E660004 */  lw         $a2, 4($s3)
/* 7FEE4 8007F2E4 8C4506E8 */  lw         $a1, 0x6e8($v0)
/* 7FEE8 8007F2E8 0C0333AC */  jal        sprintf
/* 7FEEC 8007F2EC 02002021 */   addu      $a0, $s0, $zero
/* 7FEF0 8007F2F0 02002021 */  addu       $a0, $s0, $zero
/* 7FEF4 8007F2F4 24050096 */  addiu      $a1, $zero, 0x96
/* 7FEF8 8007F2F8 27A60120 */  addiu      $a2, $sp, 0x120
/* 7FEFC 8007F2FC 27A70160 */  addiu      $a3, $sp, 0x160
/* 7FF00 8007F300 240200E1 */  addiu      $v0, $zero, 0xe1
/* 7FF04 8007F304 240300FF */  addiu      $v1, $zero, 0xff
/* 7FF08 8007F308 A3A20120 */  sb         $v0, 0x120($sp)
/* 7FF0C 8007F30C A3A20121 */  sb         $v0, 0x121($sp)
/* 7FF10 8007F310 A3A20122 */  sb         $v0, 0x122($sp)
/* 7FF14 8007F314 24020032 */  addiu      $v0, $zero, 0x32
/* 7FF18 8007F318 A3A30123 */  sb         $v1, 0x123($sp)
/* 7FF1C 8007F31C 24030096 */  addiu      $v1, $zero, 0x96
/* 7FF20 8007F320 A3A20160 */  sb         $v0, 0x160($sp)
/* 7FF24 8007F324 A3A20161 */  sb         $v0, 0x161($sp)
/* 7FF28 8007F328 A3A20162 */  sb         $v0, 0x162($sp)
/* 7FF2C 8007F32C 24020001 */  addiu      $v0, $zero, 1
/* 7FF30 8007F330 A3A30163 */  sb         $v1, 0x163($sp)
/* 7FF34 8007F334 0801FD0C */  j          .L8007F430
/* 7FF38 8007F338 AFA20010 */   sw        $v0, 0x10($sp)
.L8007F33C:
/* 7FF3C 8007F33C 82030025 */  lb         $v1, 0x25($s0)
/* 7FF40 8007F340 8CA416A0 */  lw         $a0, 0x16a0($a1)
/* 7FF44 8007F344 00031080 */  sll        $v0, $v1, 2
/* 7FF48 8007F348 00431021 */  addu       $v0, $v0, $v1
/* 7FF4C 8007F34C 00021080 */  sll        $v0, $v0, 2
/* 7FF50 8007F350 00431023 */  subu       $v0, $v0, $v1
/* 7FF54 8007F354 8C850010 */  lw         $a1, 0x10($a0)
/* 7FF58 8007F358 00021040 */  sll        $v0, $v0, 1
/* 7FF5C 8007F35C 00A28821 */  addu       $s1, $a1, $v0
/* 7FF60 8007F360 92230020 */  lbu        $v1, 0x20($s1)
/* 7FF64 8007F364 0283182A */  slt        $v1, $s4, $v1
/* 7FF68 8007F368 10600015 */  beqz       $v1, .L8007F3C0
/* 7FF6C 8007F36C 24050096 */   addiu     $a1, $zero, 0x96
/* 7FF70 8007F370 27A601A0 */  addiu      $a2, $sp, 0x1a0
/* 7FF74 8007F374 240200E1 */  addiu      $v0, $zero, 0xe1
/* 7FF78 8007F378 A3A201A0 */  sb         $v0, 0x1a0($sp)
/* 7FF7C 8007F37C A3A201A1 */  sb         $v0, 0x1a1($sp)
/* 7FF80 8007F380 A3A201A2 */  sb         $v0, 0x1a2($sp)
/* 7FF84 8007F384 24020032 */  addiu      $v0, $zero, 0x32
/* 7FF88 8007F388 A3A201E0 */  sb         $v0, 0x1e0($sp)
/* 7FF8C 8007F38C A3A201E1 */  sb         $v0, 0x1e1($sp)
/* 7FF90 8007F390 A3A201E2 */  sb         $v0, 0x1e2($sp)
/* 7FF94 8007F394 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 7FF98 8007F398 8C4788F4 */  lw         $a3, %lo(commonstringsmirror)($v0)
/* 7FF9C 8007F39C 240300FF */  addiu      $v1, $zero, 0xff
/* 7FFA0 8007F3A0 A3A301A3 */  sb         $v1, 0x1a3($sp)
/* 7FFA4 8007F3A4 24030096 */  addiu      $v1, $zero, 0x96
/* 7FFA8 8007F3A8 A3A301E3 */  sb         $v1, 0x1e3($sp)
/* 7FFAC 8007F3AC 24030001 */  addiu      $v1, $zero, 1
/* 7FFB0 8007F3B0 AFA30010 */  sw         $v1, 0x10($sp)
/* 7FFB4 8007F3B4 8CE406EC */  lw         $a0, 0x6ec($a3)
/* 7FFB8 8007F3B8 0801FD0C */  j          .L8007F430
/* 7FFBC 8007F3BC 27A701E0 */   addiu     $a3, $sp, 0x1e0
.L8007F3C0:
/* 7FFC0 8007F3C0 8E620014 */  lw         $v0, 0x14($s3)
/* 7FFC4 8007F3C4 90440001 */  lbu        $a0, 1($v0)
/* 7FFC8 8007F3C8 1080001D */  beqz       $a0, .L8007F440
/* 7FFCC 8007F3CC 24020004 */   addiu     $v0, $zero, 4
/* 7FFD0 8007F3D0 9223001A */  lbu        $v1, 0x1a($s1)
/* 7FFD4 8007F3D4 1062001B */  beq        $v1, $v0, .L8007F444
/* 7FFD8 8007F3D8 02402821 */   addu      $a1, $s2, $zero
/* 7FFDC 8007F3DC 10830018 */  beq        $a0, $v1, .L8007F440
/* 7FFE0 8007F3E0 24050096 */   addiu     $a1, $zero, 0x96
/* 7FFE4 8007F3E4 27A60220 */  addiu      $a2, $sp, 0x220
/* 7FFE8 8007F3E8 240200E1 */  addiu      $v0, $zero, 0xe1
/* 7FFEC 8007F3EC A3A20220 */  sb         $v0, 0x220($sp)
/* 7FFF0 8007F3F0 A3A20221 */  sb         $v0, 0x221($sp)
/* 7FFF4 8007F3F4 A3A20222 */  sb         $v0, 0x222($sp)
/* 7FFF8 8007F3F8 24020032 */  addiu      $v0, $zero, 0x32
/* 7FFFC 8007F3FC A3A20260 */  sb         $v0, 0x260($sp)
/* 80000 8007F400 A3A20261 */  sb         $v0, 0x261($sp)
/* 80004 8007F404 A3A20262 */  sb         $v0, 0x262($sp)
/* 80008 8007F408 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 8000C 8007F40C 8C4788F4 */  lw         $a3, %lo(commonstringsmirror)($v0)
/* 80010 8007F410 240300FF */  addiu      $v1, $zero, 0xff
/* 80014 8007F414 A3A30223 */  sb         $v1, 0x223($sp)
/* 80018 8007F418 24030096 */  addiu      $v1, $zero, 0x96
/* 8001C 8007F41C A3A30263 */  sb         $v1, 0x263($sp)
/* 80020 8007F420 24030001 */  addiu      $v1, $zero, 1
/* 80024 8007F424 AFA30010 */  sw         $v1, 0x10($sp)
/* 80028 8007F428 8CE406F0 */  lw         $a0, 0x6f0($a3)
/* 8002C 8007F42C 27A70260 */  addiu      $a3, $sp, 0x260
.L8007F430:
/* 80030 8007F430 0C0131E1 */  jal        some_textbox_func
/* 80034 8007F434 00000000 */   nop
/* 80038 8007F438 0801FD38 */  j          .L8007F4E0
/* 8003C 8007F43C 24020001 */   addiu     $v0, $zero, 1
.L8007F440:
/* 80040 8007F440 02402821 */  addu       $a1, $s2, $zero
.L8007F444:
/* 80044 8007F444 8E64002C */  lw         $a0, 0x2c($s3)
/* 80048 8007F448 0C0210AC */  jal        learn_spell
/* 8004C 8007F44C 24060001 */   addiu     $a2, $zero, 1
/* 80050 8007F450 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 80054 8007F454 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 80058 8007F458 02002021 */  addu       $a0, $s0, $zero
/* 8005C 8007F45C 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 80060 8007F460 8E660004 */  lw         $a2, 4($s3)
/* 80064 8007F464 8C4506F4 */  lw         $a1, 0x6f4($v0)
/* 80068 8007F468 0C0333AC */  jal        sprintf
/* 8006C 8007F46C 26270002 */   addiu     $a3, $s1, 2
/* 80070 8007F470 02002021 */  addu       $a0, $s0, $zero
/* 80074 8007F474 24050096 */  addiu      $a1, $zero, 0x96
/* 80078 8007F478 27A602A0 */  addiu      $a2, $sp, 0x2a0
/* 8007C 8007F47C 27A702E0 */  addiu      $a3, $sp, 0x2e0
/* 80080 8007F480 240200E1 */  addiu      $v0, $zero, 0xe1
/* 80084 8007F484 240300FF */  addiu      $v1, $zero, 0xff
/* 80088 8007F488 A3A202A0 */  sb         $v0, 0x2a0($sp)
/* 8008C 8007F48C A3A202A1 */  sb         $v0, 0x2a1($sp)
/* 80090 8007F490 A3A202A2 */  sb         $v0, 0x2a2($sp)
/* 80094 8007F494 24020032 */  addiu      $v0, $zero, 0x32
/* 80098 8007F498 A3A302A3 */  sb         $v1, 0x2a3($sp)
/* 8009C 8007F49C 24030096 */  addiu      $v1, $zero, 0x96
/* 800A0 8007F4A0 A3A202E0 */  sb         $v0, 0x2e0($sp)
/* 800A4 8007F4A4 A3A202E1 */  sb         $v0, 0x2e1($sp)
/* 800A8 8007F4A8 A3A202E2 */  sb         $v0, 0x2e2($sp)
/* 800AC 8007F4AC 24020001 */  addiu      $v0, $zero, 1
/* 800B0 8007F4B0 A3A302E3 */  sb         $v1, 0x2e3($sp)
/* 800B4 8007F4B4 0C0131E1 */  jal        some_textbox_func
/* 800B8 8007F4B8 AFA20010 */   sw        $v0, 0x10($sp)
/* 800BC 8007F4BC 8EC70010 */  lw         $a3, 0x10($s6)
/* 800C0 8007F4C0 02A02821 */  addu       $a1, $s5, $zero
/* 800C4 8007F4C4 8CE30000 */  lw         $v1, ($a3)
/* 800C8 8007F4C8 24060001 */  addiu      $a2, $zero, 1
/* 800CC 8007F4CC 84640038 */  lh         $a0, 0x38($v1)
/* 800D0 8007F4D0 8C62003C */  lw         $v0, 0x3c($v1)
/* 800D4 8007F4D4 0040F809 */  jalr       $v0
/* 800D8 8007F4D8 00E42021 */   addu      $a0, $a3, $a0
/* 800DC 8007F4DC 00001021 */  addu       $v0, $zero, $zero
.L8007F4E0:
/* 800E0 8007F4E0 8FBF033C */  lw         $ra, 0x33c($sp)
/* 800E4 8007F4E4 8FB60338 */  lw         $s6, 0x338($sp)
/* 800E8 8007F4E8 8FB50334 */  lw         $s5, 0x334($sp)
/* 800EC 8007F4EC 8FB40330 */  lw         $s4, 0x330($sp)
/* 800F0 8007F4F0 8FB3032C */  lw         $s3, 0x32c($sp)
/* 800F4 8007F4F4 8FB20328 */  lw         $s2, 0x328($sp)
/* 800F8 8007F4F8 8FB10324 */  lw         $s1, 0x324($sp)
/* 800FC 8007F4FC 8FB00320 */  lw         $s0, 0x320($sp)
/* 80100 8007F500 03E00008 */  jr         $ra
/* 80104 8007F504 27BD0340 */   addiu     $sp, $sp, 0x340

glabel func_8007F508
/* 80108 8007F508 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8010C 8007F50C AFB00010 */  sw         $s0, 0x10($sp)
/* 80110 8007F510 00808021 */  addu       $s0, $a0, $zero
/* 80114 8007F514 AFB20018 */  sw         $s2, 0x18($sp)
/* 80118 8007F518 00A09021 */  addu       $s2, $a1, $zero
/* 8011C 8007F51C 00063600 */  sll        $a2, $a2, 0x18
/* 80120 8007F520 AFBF001C */  sw         $ra, 0x1c($sp)
/* 80124 8007F524 AFB10014 */  sw         $s1, 0x14($sp)
/* 80128 8007F528 8E04000C */  lw         $a0, 0xc($s0)
/* 8012C 8007F52C 10800005 */  beqz       $a0, .L8007F544
/* 80130 8007F530 00068E03 */   sra       $s1, $a2, 0x18
/* 80134 8007F534 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 80138 8007F538 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 8013C 8007F53C 0C02600C */  jal        Free
/* 80140 8007F540 24060552 */   addiu     $a2, $zero, 0x552
.L8007F544:
/* 80144 8007F544 2402FFFF */  addiu      $v0, $zero, -1
/* 80148 8007F548 12220003 */  beq        $s1, $v0, .L8007F558
/* 8014C 8007F54C AE12000C */   sw        $s2, 0xc($s0)
/* 80150 8007F550 8E020010 */  lw         $v0, 0x10($s0)
/* 80154 8007F554 A0510004 */  sb         $s1, 4($v0)
.L8007F558:
/* 80158 8007F558 8FBF001C */  lw         $ra, 0x1c($sp)
/* 8015C 8007F55C 8FB20018 */  lw         $s2, 0x18($sp)
/* 80160 8007F560 8FB10014 */  lw         $s1, 0x14($sp)
/* 80164 8007F564 8FB00010 */  lw         $s0, 0x10($sp)
/* 80168 8007F568 03E00008 */  jr         $ra
/* 8016C 8007F56C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel remove_armor_from_character
/* 80170 8007F570 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 80174 8007F574 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80178 8007F578 00809821 */  addu       $s3, $a0, $zero
/* 8017C 8007F57C 30A500FF */  andi       $a1, $a1, 0xff
/* 80180 8007F580 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 80184 8007F584 90447C70 */  lbu        $a0, %lo(combat_bytes)($v0)
/* 80188 8007F588 2403000E */  addiu      $v1, $zero, 0xe
/* 8018C 8007F58C AFBF0024 */  sw         $ra, 0x24($sp)
/* 80190 8007F590 AFB40020 */  sw         $s4, 0x20($sp)
/* 80194 8007F594 AFB20018 */  sw         $s2, 0x18($sp)
/* 80198 8007F598 AFB10014 */  sw         $s1, 0x14($sp)
/* 8019C 8007F59C AFB00010 */  sw         $s0, 0x10($sp)
/* 801A0 8007F5A0 1083003F */  beq        $a0, $v1, .L8007F6A0
/* 801A4 8007F5A4 24020003 */   addiu     $v0, $zero, 3
/* 801A8 8007F5A8 00051080 */  sll        $v0, $a1, 2
/* 801AC 8007F5AC 02621021 */  addu       $v0, $s3, $v0
/* 801B0 8007F5B0 8C520000 */  lw         $s2, ($v0)
/* 801B4 8007F5B4 1240003A */  beqz       $s2, .L8007F6A0
/* 801B8 8007F5B8 24020001 */   addiu     $v0, $zero, 1
/* 801BC 8007F5BC 8E420020 */  lw         $v0, 0x20($s2)
/* 801C0 8007F5C0 8C500000 */  lw         $s0, ($v0)
/* 801C4 8007F5C4 12000036 */  beqz       $s0, .L8007F6A0
/* 801C8 8007F5C8 00001021 */   addu      $v0, $zero, $zero
/* 801CC 8007F5CC 0C01F994 */  jal        create_2ByteArray
/* 801D0 8007F5D0 8E04000C */   lw        $a0, 0xc($s0)
/* 801D4 8007F5D4 8E060010 */  lw         $a2, 0x10($s0)
/* 801D8 8007F5D8 00408821 */  addu       $s1, $v0, $zero
/* 801DC 8007F5DC 10C00002 */  beqz       $a2, .L8007F5E8
/* 801E0 8007F5E0 2414FFFF */   addiu     $s4, $zero, -1
/* 801E4 8007F5E4 80D40004 */  lb         $s4, 4($a2)
.L8007F5E8:
/* 801E8 8007F5E8 8E670010 */  lw         $a3, 0x10($s3)
/* 801EC 8007F5EC 24060001 */  addiu      $a2, $zero, 1
/* 801F0 8007F5F0 8CE30000 */  lw         $v1, ($a3)
/* 801F4 8007F5F4 96050000 */  lhu        $a1, ($s0)
/* 801F8 8007F5F8 84640030 */  lh         $a0, 0x30($v1)
/* 801FC 8007F5FC 8C620034 */  lw         $v0, 0x34($v1)
/* 80200 8007F600 0040F809 */  jalr       $v0
/* 80204 8007F604 00E42021 */   addu      $a0, $a3, $a0
/* 80208 8007F608 54400007 */  bnel       $v0, $zero, .L8007F628
/* 8020C 8007F60C 8E660010 */   lw        $a2, 0x10($s3)
/* 80210 8007F610 1220001B */  beqz       $s1, .L8007F680
/* 80214 8007F614 02202021 */   addu      $a0, $s1, $zero
/* 80218 8007F618 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 8021C 8007F61C 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 80220 8007F620 0801FD9E */  j          .L8007F678
/* 80224 8007F624 24060572 */   addiu     $a2, $zero, 0x572
.L8007F628:
/* 80228 8007F628 8CC30000 */  lw         $v1, ($a2)
/* 8022C 8007F62C 96050000 */  lhu        $a1, ($s0)
/* 80230 8007F630 84640050 */  lh         $a0, 0x50($v1)
/* 80234 8007F634 8C620054 */  lw         $v0, 0x54($v1)
/* 80238 8007F638 0040F809 */  jalr       $v0
/* 8023C 8007F63C 00C42021 */   addu      $a0, $a2, $a0
/* 80240 8007F640 8E660010 */  lw         $a2, 0x10($s3)
/* 80244 8007F644 8CC30000 */  lw         $v1, ($a2)
/* 80248 8007F648 00402821 */  addu       $a1, $v0, $zero
/* 8024C 8007F64C 84640058 */  lh         $a0, 0x58($v1)
/* 80250 8007F650 8C62005C */  lw         $v0, 0x5c($v1)
/* 80254 8007F654 0040F809 */  jalr       $v0
/* 80258 8007F658 00C42021 */   addu      $a0, $a2, $a0
/* 8025C 8007F65C 5440000A */  bnel       $v0, $zero, .L8007F688
/* 80260 8007F660 00402021 */   addu      $a0, $v0, $zero
/* 80264 8007F664 12200006 */  beqz       $s1, .L8007F680
/* 80268 8007F668 02202021 */   addu      $a0, $s1, $zero
/* 8026C 8007F66C 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 80270 8007F670 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 80274 8007F674 2406057D */  addiu      $a2, $zero, 0x57d
.L8007F678:
/* 80278 8007F678 0C02600C */  jal        Free
/* 8027C 8007F67C 00000000 */   nop
.L8007F680:
/* 80280 8007F680 0801FDA8 */  j          .L8007F6A0
/* 80284 8007F684 24020001 */   addiu     $v0, $zero, 1
.L8007F688:
/* 80288 8007F688 02202821 */  addu       $a1, $s1, $zero
/* 8028C 8007F68C 0C01FD42 */  jal        func_8007F508
/* 80290 8007F690 02803021 */   addu      $a2, $s4, $zero
/* 80294 8007F694 0C01E1A5 */  jal        remove_chestArmor
/* 80298 8007F698 02402021 */   addu      $a0, $s2, $zero
/* 8029C 8007F69C 00001021 */  addu       $v0, $zero, $zero
.L8007F6A0:
/* 802A0 8007F6A0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 802A4 8007F6A4 8FB40020 */  lw         $s4, 0x20($sp)
/* 802A8 8007F6A8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 802AC 8007F6AC 8FB20018 */  lw         $s2, 0x18($sp)
/* 802B0 8007F6B0 8FB10014 */  lw         $s1, 0x14($sp)
/* 802B4 8007F6B4 8FB00010 */  lw         $s0, 0x10($sp)
/* 802B8 8007F6B8 03E00008 */  jr         $ra
/* 802BC 8007F6BC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel removeArmorIntoInventory
/* 802C0 8007F6C0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 802C4 8007F6C4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 802C8 8007F6C8 00809821 */  addu       $s3, $a0, $zero
/* 802CC 8007F6CC 30A500FF */  andi       $a1, $a1, 0xff
/* 802D0 8007F6D0 00052880 */  sll        $a1, $a1, 2
/* 802D4 8007F6D4 02652821 */  addu       $a1, $s3, $a1
/* 802D8 8007F6D8 AFBF0024 */  sw         $ra, 0x24($sp)
/* 802DC 8007F6DC AFB40020 */  sw         $s4, 0x20($sp)
/* 802E0 8007F6E0 AFB20018 */  sw         $s2, 0x18($sp)
/* 802E4 8007F6E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 802E8 8007F6E8 AFB00010 */  sw         $s0, 0x10($sp)
/* 802EC 8007F6EC 8CB20000 */  lw         $s2, ($a1)
/* 802F0 8007F6F0 1240003F */  beqz       $s2, .L8007F7F0
/* 802F4 8007F6F4 24020001 */   addiu     $v0, $zero, 1
/* 802F8 8007F6F8 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 802FC 8007F6FC 90447C70 */  lbu        $a0, %lo(combat_bytes)($v0)
/* 80300 8007F700 2403000E */  addiu      $v1, $zero, 0xe
/* 80304 8007F704 1083003A */  beq        $a0, $v1, .L8007F7F0
/* 80308 8007F708 24020003 */   addiu     $v0, $zero, 3
/* 8030C 8007F70C 8E420020 */  lw         $v0, 0x20($s2)
/* 80310 8007F710 8C500004 */  lw         $s0, 4($v0)
/* 80314 8007F714 12000036 */  beqz       $s0, .L8007F7F0
/* 80318 8007F718 00001021 */   addu      $v0, $zero, $zero
/* 8031C 8007F71C 0C01F994 */  jal        create_2ByteArray
/* 80320 8007F720 8E04000C */   lw        $a0, 0xc($s0)
/* 80324 8007F724 8E060010 */  lw         $a2, 0x10($s0)
/* 80328 8007F728 00408821 */  addu       $s1, $v0, $zero
/* 8032C 8007F72C 10C00002 */  beqz       $a2, .L8007F738
/* 80330 8007F730 2414FFFF */   addiu     $s4, $zero, -1
/* 80334 8007F734 80D40004 */  lb         $s4, 4($a2)
.L8007F738:
/* 80338 8007F738 8E670010 */  lw         $a3, 0x10($s3)
/* 8033C 8007F73C 24060001 */  addiu      $a2, $zero, 1
/* 80340 8007F740 8CE30000 */  lw         $v1, ($a3)
/* 80344 8007F744 96050000 */  lhu        $a1, ($s0)
/* 80348 8007F748 84640030 */  lh         $a0, 0x30($v1)
/* 8034C 8007F74C 8C620034 */  lw         $v0, 0x34($v1)
/* 80350 8007F750 0040F809 */  jalr       $v0
/* 80354 8007F754 00E42021 */   addu      $a0, $a3, $a0
/* 80358 8007F758 54400007 */  bnel       $v0, $zero, .L8007F778
/* 8035C 8007F75C 8E660010 */   lw        $a2, 0x10($s3)
/* 80360 8007F760 1220001B */  beqz       $s1, .L8007F7D0
/* 80364 8007F764 02202021 */   addu      $a0, $s1, $zero
/* 80368 8007F768 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 8036C 8007F76C 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 80370 8007F770 0801FDF2 */  j          .L8007F7C8
/* 80374 8007F774 240605A4 */   addiu     $a2, $zero, 0x5a4
.L8007F778:
/* 80378 8007F778 8CC30000 */  lw         $v1, ($a2)
/* 8037C 8007F77C 96050000 */  lhu        $a1, ($s0)
/* 80380 8007F780 84640050 */  lh         $a0, 0x50($v1)
/* 80384 8007F784 8C620054 */  lw         $v0, 0x54($v1)
/* 80388 8007F788 0040F809 */  jalr       $v0
/* 8038C 8007F78C 00C42021 */   addu      $a0, $a2, $a0
/* 80390 8007F790 8E660010 */  lw         $a2, 0x10($s3)
/* 80394 8007F794 8CC30000 */  lw         $v1, ($a2)
/* 80398 8007F798 00402821 */  addu       $a1, $v0, $zero
/* 8039C 8007F79C 84640058 */  lh         $a0, 0x58($v1)
/* 803A0 8007F7A0 8C62005C */  lw         $v0, 0x5c($v1)
/* 803A4 8007F7A4 0040F809 */  jalr       $v0
/* 803A8 8007F7A8 00C42021 */   addu      $a0, $a2, $a0
/* 803AC 8007F7AC 5440000A */  bnel       $v0, $zero, .L8007F7D8
/* 803B0 8007F7B0 00402021 */   addu      $a0, $v0, $zero
/* 803B4 8007F7B4 12200006 */  beqz       $s1, .L8007F7D0
/* 803B8 8007F7B8 02202021 */   addu      $a0, $s1, $zero
/* 803BC 8007F7BC 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 803C0 8007F7C0 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 803C4 8007F7C4 240605AF */  addiu      $a2, $zero, 0x5af
.L8007F7C8:
/* 803C8 8007F7C8 0C02600C */  jal        Free
/* 803CC 8007F7CC 00000000 */   nop
.L8007F7D0:
/* 803D0 8007F7D0 0801FDFC */  j          .L8007F7F0
/* 803D4 8007F7D4 24020001 */   addiu     $v0, $zero, 1
.L8007F7D8:
/* 803D8 8007F7D8 02202821 */  addu       $a1, $s1, $zero
/* 803DC 8007F7DC 0C01FD42 */  jal        func_8007F508
/* 803E0 8007F7E0 02803021 */   addu      $a2, $s4, $zero
/* 803E4 8007F7E4 0C01E1AC */  jal        remove_sheild
/* 803E8 8007F7E8 02402021 */   addu      $a0, $s2, $zero
/* 803EC 8007F7EC 00001021 */  addu       $v0, $zero, $zero
.L8007F7F0:
/* 803F0 8007F7F0 8FBF0024 */  lw         $ra, 0x24($sp)
/* 803F4 8007F7F4 8FB40020 */  lw         $s4, 0x20($sp)
/* 803F8 8007F7F8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 803FC 8007F7FC 8FB20018 */  lw         $s2, 0x18($sp)
/* 80400 8007F800 8FB10014 */  lw         $s1, 0x14($sp)
/* 80404 8007F804 8FB00010 */  lw         $s0, 0x10($sp)
/* 80408 8007F808 03E00008 */  jr         $ra
/* 8040C 8007F80C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel MoveWeaponsToInventory
/* 80410 8007F810 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 80414 8007F814 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80418 8007F818 00809821 */  addu       $s3, $a0, $zero
/* 8041C 8007F81C AFB50024 */  sw         $s5, 0x24($sp)
/* 80420 8007F820 30B500FF */  andi       $s5, $a1, 0xff
/* 80424 8007F824 00151080 */  sll        $v0, $s5, 2
/* 80428 8007F828 02621021 */  addu       $v0, $s3, $v0
/* 8042C 8007F82C AFBF0028 */  sw         $ra, 0x28($sp)
/* 80430 8007F830 AFB40020 */  sw         $s4, 0x20($sp)
/* 80434 8007F834 AFB20018 */  sw         $s2, 0x18($sp)
/* 80438 8007F838 AFB10014 */  sw         $s1, 0x14($sp)
/* 8043C 8007F83C AFB00010 */  sw         $s0, 0x10($sp)
/* 80440 8007F840 8C520000 */  lw         $s2, ($v0)
/* 80444 8007F844 56400003 */  bnel       $s2, $zero, .L8007F854
/* 80448 8007F848 8E500024 */   lw        $s0, 0x24($s2)
.L8007F84C:
/* 8044C 8007F84C 0801FE65 */  j          .L8007F994
/* 80450 8007F850 24020001 */   addiu     $v0, $zero, 1
.L8007F854:
/* 80454 8007F854 1200004F */  beqz       $s0, .L8007F994
/* 80458 8007F858 00001021 */   addu      $v0, $zero, $zero
/* 8045C 8007F85C 3C02800F */  lui        $v0, %hi(weaponList+0x42)
/* 80460 8007F860 90431742 */  lbu        $v1, %lo(weaponList+0x42)($v0)
/* 80464 8007F864 96040000 */  lhu        $a0, ($s0)
/* 80468 8007F868 24630700 */  addiu      $v1, $v1, 0x700
/* 8046C 8007F86C 10640049 */  beq        $v1, $a0, .L8007F994
/* 80470 8007F870 00001021 */   addu      $v0, $zero, $zero
/* 80474 8007F874 0C01F994 */  jal        create_2ByteArray
/* 80478 8007F878 8E04000C */   lw        $a0, 0xc($s0)
/* 8047C 8007F87C 8E060010 */  lw         $a2, 0x10($s0)
/* 80480 8007F880 00408821 */  addu       $s1, $v0, $zero
/* 80484 8007F884 10C00002 */  beqz       $a2, .L8007F890
/* 80488 8007F888 2414FFFF */   addiu     $s4, $zero, -1
/* 8048C 8007F88C 80D40004 */  lb         $s4, 4($a2)
.L8007F890:
/* 80490 8007F890 8E670010 */  lw         $a3, 0x10($s3)
/* 80494 8007F894 24060001 */  addiu      $a2, $zero, 1
/* 80498 8007F898 8CE30000 */  lw         $v1, ($a3)
/* 8049C 8007F89C 96050000 */  lhu        $a1, ($s0)
/* 804A0 8007F8A0 84640030 */  lh         $a0, 0x30($v1)
/* 804A4 8007F8A4 8C620034 */  lw         $v0, 0x34($v1)
/* 804A8 8007F8A8 0040F809 */  jalr       $v0
/* 804AC 8007F8AC 00E42021 */   addu      $a0, $a3, $a0
/* 804B0 8007F8B0 54400009 */  bnel       $v0, $zero, .L8007F8D8
/* 804B4 8007F8B4 8E660010 */   lw        $a2, 0x10($s3)
/* 804B8 8007F8B8 1220FFE4 */  beqz       $s1, .L8007F84C
/* 804BC 8007F8BC 02202021 */   addu      $a0, $s1, $zero
/* 804C0 8007F8C0 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 804C4 8007F8C4 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 804C8 8007F8C8 0C02600C */  jal        Free
/* 804CC 8007F8CC 240605DD */   addiu     $a2, $zero, 0x5dd
/* 804D0 8007F8D0 0801FE65 */  j          .L8007F994
/* 804D4 8007F8D4 24020001 */   addiu     $v0, $zero, 1
.L8007F8D8:
/* 804D8 8007F8D8 8CC30000 */  lw         $v1, ($a2)
/* 804DC 8007F8DC 96050000 */  lhu        $a1, ($s0)
/* 804E0 8007F8E0 84640050 */  lh         $a0, 0x50($v1)
/* 804E4 8007F8E4 8C620054 */  lw         $v0, 0x54($v1)
/* 804E8 8007F8E8 0040F809 */  jalr       $v0
/* 804EC 8007F8EC 00C42021 */   addu      $a0, $a2, $a0
/* 804F0 8007F8F0 8E660010 */  lw         $a2, 0x10($s3)
/* 804F4 8007F8F4 8CC30000 */  lw         $v1, ($a2)
/* 804F8 8007F8F8 00402821 */  addu       $a1, $v0, $zero
/* 804FC 8007F8FC 84640058 */  lh         $a0, 0x58($v1)
/* 80500 8007F900 8C62005C */  lw         $v0, 0x5c($v1)
/* 80504 8007F904 0040F809 */  jalr       $v0
/* 80508 8007F908 00C42021 */   addu      $a0, $a2, $a0
/* 8050C 8007F90C 54400009 */  bnel       $v0, $zero, .L8007F934
/* 80510 8007F910 00402021 */   addu      $a0, $v0, $zero
/* 80514 8007F914 1220FFCD */  beqz       $s1, .L8007F84C
/* 80518 8007F918 02202021 */   addu      $a0, $s1, $zero
/* 8051C 8007F91C 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 80520 8007F920 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 80524 8007F924 0C02600C */  jal        Free
/* 80528 8007F928 240605E9 */   addiu     $a2, $zero, 0x5e9
/* 8052C 8007F92C 0801FE65 */  j          .L8007F994
/* 80530 8007F930 24020001 */   addiu     $v0, $zero, 1
.L8007F934:
/* 80534 8007F934 02202821 */  addu       $a1, $s1, $zero
/* 80538 8007F938 0C01FD42 */  jal        func_8007F508
/* 8053C 8007F93C 02803021 */   addu      $a2, $s4, $zero
/* 80540 8007F940 0C01E1E4 */  jal        unequp_weapons
/* 80544 8007F944 02402021 */   addu      $a0, $s2, $zero
/* 80548 8007F948 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 8054C 8007F94C 90447C70 */  lbu        $a0, %lo(combat_bytes)($v0)
/* 80550 8007F950 2403000E */  addiu      $v1, $zero, 0xe
/* 80554 8007F954 1483000F */  bne        $a0, $v1, .L8007F994
/* 80558 8007F958 00001021 */   addu      $v0, $zero, $zero
/* 8055C 8007F95C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 80560 8007F960 8C42F760 */  lw         $v0, %lo(combatPointer)($v0)
/* 80564 8007F964 1040000A */  beqz       $v0, .L8007F990
/* 80568 8007F968 244352D0 */   addiu     $v1, $v0, 0x52d0
/* 8056C 8007F96C 10600009 */  beqz       $v1, .L8007F994
/* 80570 8007F970 00001021 */   addu      $v0, $zero, $zero
/* 80574 8007F974 00151080 */  sll        $v0, $s5, 2
/* 80578 8007F978 00621021 */  addu       $v0, $v1, $v0
/* 8057C 8007F97C 8C440000 */  lw         $a0, ($v0)
/* 80580 8007F980 10800004 */  beqz       $a0, .L8007F994
/* 80584 8007F984 00001021 */   addu      $v0, $zero, $zero
/* 80588 8007F988 0C01BF2C */  jal        get_weapon_sheild_borg5
/* 8058C 8007F98C A0800025 */   sb        $zero, 0x25($a0)
.L8007F990:
/* 80590 8007F990 00001021 */  addu       $v0, $zero, $zero
.L8007F994:
/* 80594 8007F994 8FBF0028 */  lw         $ra, 0x28($sp)
/* 80598 8007F998 8FB50024 */  lw         $s5, 0x24($sp)
/* 8059C 8007F99C 8FB40020 */  lw         $s4, 0x20($sp)
/* 805A0 8007F9A0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 805A4 8007F9A4 8FB20018 */  lw         $s2, 0x18($sp)
/* 805A8 8007F9A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 805AC 8007F9AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 805B0 8007F9B0 03E00008 */  jr         $ra
/* 805B4 8007F9B4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8007F9B8
/* 805B8 8007F9B8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 805BC 8007F9BC AFB40020 */  sw         $s4, 0x20($sp)
/* 805C0 8007F9C0 0080A021 */  addu       $s4, $a0, $zero
/* 805C4 8007F9C4 30A500FF */  andi       $a1, $a1, 0xff
/* 805C8 8007F9C8 00052880 */  sll        $a1, $a1, 2
/* 805CC 8007F9CC 02852821 */  addu       $a1, $s4, $a1
/* 805D0 8007F9D0 AFBF0028 */  sw         $ra, 0x28($sp)
/* 805D4 8007F9D4 AFB50024 */  sw         $s5, 0x24($sp)
/* 805D8 8007F9D8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 805DC 8007F9DC AFB20018 */  sw         $s2, 0x18($sp)
/* 805E0 8007F9E0 AFB10014 */  sw         $s1, 0x14($sp)
/* 805E4 8007F9E4 AFB00010 */  sw         $s0, 0x10($sp)
/* 805E8 8007F9E8 8CB30000 */  lw         $s3, ($a1)
/* 805EC 8007F9EC 30D200FF */  andi       $s2, $a2, 0xff
/* 805F0 8007F9F0 1260003A */  beqz       $s3, .L8007FADC
/* 805F4 8007F9F4 24020001 */   addiu     $v0, $zero, 1
/* 805F8 8007F9F8 2E42000C */  sltiu      $v0, $s2, 0xc
/* 805FC 8007F9FC 10400037 */  beqz       $v0, .L8007FADC
/* 80600 8007FA00 24020001 */   addiu     $v0, $zero, 1
/* 80604 8007FA04 8E630028 */  lw         $v1, 0x28($s3)
/* 80608 8007FA08 1060001D */  beqz       $v1, .L8007FA80
/* 8060C 8007FA0C 00121080 */   sll       $v0, $s2, 2
/* 80610 8007FA10 8C630000 */  lw         $v1, ($v1)
/* 80614 8007FA14 00431021 */  addu       $v0, $v0, $v1
/* 80618 8007FA18 8C500000 */  lw         $s0, ($v0)
/* 8061C 8007FA1C 1200002F */  beqz       $s0, .L8007FADC
/* 80620 8007FA20 24020001 */   addiu     $v0, $zero, 1
/* 80624 8007FA24 0C01F994 */  jal        create_2ByteArray
/* 80628 8007FA28 8E04000C */   lw        $a0, 0xc($s0)
/* 8062C 8007FA2C 8E060010 */  lw         $a2, 0x10($s0)
/* 80630 8007FA30 00408821 */  addu       $s1, $v0, $zero
/* 80634 8007FA34 10C00002 */  beqz       $a2, .L8007FA40
/* 80638 8007FA38 2415FFFF */   addiu     $s5, $zero, -1
/* 8063C 8007FA3C 80D50004 */  lb         $s5, 4($a2)
.L8007FA40:
/* 80640 8007FA40 8E870010 */  lw         $a3, 0x10($s4)
/* 80644 8007FA44 24060001 */  addiu      $a2, $zero, 1
/* 80648 8007FA48 8CE30000 */  lw         $v1, ($a3)
/* 8064C 8007FA4C 96050000 */  lhu        $a1, ($s0)
/* 80650 8007FA50 84640030 */  lh         $a0, 0x30($v1)
/* 80654 8007FA54 8C620034 */  lw         $v0, 0x34($v1)
/* 80658 8007FA58 0040F809 */  jalr       $v0
/* 8065C 8007FA5C 00E42021 */   addu      $a0, $a3, $a0
/* 80660 8007FA60 54400009 */  bnel       $v0, $zero, .L8007FA88
/* 80664 8007FA64 8E860010 */   lw        $a2, 0x10($s4)
/* 80668 8007FA68 12200005 */  beqz       $s1, .L8007FA80
/* 8066C 8007FA6C 02202021 */   addu      $a0, $s1, $zero
/* 80670 8007FA70 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 80674 8007FA74 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 80678 8007FA78 0C02600C */  jal        Free
/* 8067C 8007FA7C 24060625 */   addiu     $a2, $zero, 0x625
.L8007FA80:
/* 80680 8007FA80 0801FEB7 */  j          .L8007FADC
/* 80684 8007FA84 24020001 */   addiu     $v0, $zero, 1
.L8007FA88:
/* 80688 8007FA88 8CC30000 */  lw         $v1, ($a2)
/* 8068C 8007FA8C 96050000 */  lhu        $a1, ($s0)
/* 80690 8007FA90 84640050 */  lh         $a0, 0x50($v1)
/* 80694 8007FA94 8C620054 */  lw         $v0, 0x54($v1)
/* 80698 8007FA98 0040F809 */  jalr       $v0
/* 8069C 8007FA9C 00C42021 */   addu      $a0, $a2, $a0
/* 806A0 8007FAA0 8E860010 */  lw         $a2, 0x10($s4)
/* 806A4 8007FAA4 8CC30000 */  lw         $v1, ($a2)
/* 806A8 8007FAA8 00402821 */  addu       $a1, $v0, $zero
/* 806AC 8007FAAC 84640058 */  lh         $a0, 0x58($v1)
/* 806B0 8007FAB0 8C62005C */  lw         $v0, 0x5c($v1)
/* 806B4 8007FAB4 0040F809 */  jalr       $v0
/* 806B8 8007FAB8 00C42021 */   addu      $a0, $a2, $a0
/* 806BC 8007FABC 00402021 */  addu       $a0, $v0, $zero
/* 806C0 8007FAC0 02202821 */  addu       $a1, $s1, $zero
/* 806C4 8007FAC4 0C01FD42 */  jal        func_8007F508
/* 806C8 8007FAC8 02A03021 */   addu      $a2, $s5, $zero
/* 806CC 8007FACC 02602021 */  addu       $a0, $s3, $zero
/* 806D0 8007FAD0 0C01E1F9 */  jal        func_800787E4
/* 806D4 8007FAD4 02402821 */   addu      $a1, $s2, $zero
/* 806D8 8007FAD8 00001021 */  addu       $v0, $zero, $zero
.L8007FADC:
/* 806DC 8007FADC 8FBF0028 */  lw         $ra, 0x28($sp)
/* 806E0 8007FAE0 8FB50024 */  lw         $s5, 0x24($sp)
/* 806E4 8007FAE4 8FB40020 */  lw         $s4, 0x20($sp)
/* 806E8 8007FAE8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 806EC 8007FAEC 8FB20018 */  lw         $s2, 0x18($sp)
/* 806F0 8007FAF0 8FB10014 */  lw         $s1, 0x14($sp)
/* 806F4 8007FAF4 8FB00010 */  lw         $s0, 0x10($sp)
/* 806F8 8007FAF8 03E00008 */  jr         $ra
/* 806FC 8007FAFC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel Check_diplomat_int
/* 80700 8007FB00 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 80704 8007FB04 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80708 8007FB08 00009821 */  addu       $s3, $zero, $zero
/* 8070C 8007FB0C AFB40020 */  sw         $s4, 0x20($sp)
/* 80710 8007FB10 0000A021 */  addu       $s4, $zero, $zero
/* 80714 8007FB14 AFB20018 */  sw         $s2, 0x18($sp)
/* 80718 8007FB18 00009021 */  addu       $s2, $zero, $zero
/* 8071C 8007FB1C AFB10014 */  sw         $s1, 0x14($sp)
/* 80720 8007FB20 00808821 */  addu       $s1, $a0, $zero
/* 80724 8007FB24 AFBF0024 */  sw         $ra, 0x24($sp)
/* 80728 8007FB28 AFB00010 */  sw         $s0, 0x10($sp)
.L8007FB2C:
/* 8072C 8007FB2C 8E300000 */  lw         $s0, ($s1)
/* 80730 8007FB30 52000012 */  beql       $s0, $zero, .L8007FB7C
/* 80734 8007FB34 26520001 */   addiu     $s2, $s2, 1
/* 80738 8007FB38 0C01DF1D */  jal        isDead
/* 8073C 8007FB3C 02002021 */   addu      $a0, $s0, $zero
/* 80740 8007FB40 5440000E */  bnel       $v0, $zero, .L8007FB7C
/* 80744 8007FB44 26520001 */   addiu     $s2, $s2, 1
/* 80748 8007FB48 8E040018 */  lw         $a0, 0x18($s0)
/* 8074C 8007FB4C 0C02128F */  jal        getModdedStat
/* 80750 8007FB50 00002821 */   addu      $a1, $zero, $zero
/* 80754 8007FB54 304300FF */  andi       $v1, $v0, 0xff
/* 80758 8007FB58 0263102B */  sltu       $v0, $s3, $v1
/* 8075C 8007FB5C 54400001 */  bnel       $v0, $zero, .L8007FB64
/* 80760 8007FB60 00609821 */   addu      $s3, $v1, $zero
.L8007FB64:
/* 80764 8007FB64 8E04001C */  lw         $a0, 0x1c($s0)
/* 80768 8007FB68 0C020F67 */  jal        getModdedSkill
/* 8076C 8007FB6C 24050001 */   addiu     $a1, $zero, 1
/* 80770 8007FB70 02821021 */  addu       $v0, $s4, $v0
/* 80774 8007FB74 305400FF */  andi       $s4, $v0, 0xff
/* 80778 8007FB78 26520001 */  addiu      $s2, $s2, 1
.L8007FB7C:
/* 8077C 8007FB7C 2E420004 */  sltiu      $v0, $s2, 4
/* 80780 8007FB80 1440FFEA */  bnez       $v0, .L8007FB2C
/* 80784 8007FB84 26310004 */   addiu     $s1, $s1, 4
/* 80788 8007FB88 24040001 */  addiu      $a0, $zero, 1
/* 8078C 8007FB8C 24050064 */  addiu      $a1, $zero, 0x64
/* 80790 8007FB90 00131040 */  sll        $v0, $s3, 1
/* 80794 8007FB94 00531021 */  addu       $v0, $v0, $s3
/* 80798 8007FB98 00141880 */  sll        $v1, $s4, 2
/* 8079C 8007FB9C 00741821 */  addu       $v1, $v1, $s4
/* 807A0 8007FBA0 00031840 */  sll        $v1, $v1, 1
/* 807A4 8007FBA4 00431021 */  addu       $v0, $v0, $v1
/* 807A8 8007FBA8 24420032 */  addiu      $v0, $v0, 0x32
/* 807AC 8007FBAC 0C002D03 */  jal        RollD
/* 807B0 8007FBB0 3050FFFF */   andi      $s0, $v0, 0xffff
/* 807B4 8007FBB4 00401821 */  addu       $v1, $v0, $zero
/* 807B8 8007FBB8 0070102B */  sltu       $v0, $v1, $s0
/* 807BC 8007FBBC 10400006 */  beqz       $v0, .L8007FBD8
/* 807C0 8007FBC0 02032023 */   subu      $a0, $s0, $v1
/* 807C4 8007FBC4 00042400 */  sll        $a0, $a0, 0x10
/* 807C8 8007FBC8 0C002D20 */  jal        some_skillcheck_calc
/* 807CC 8007FBCC 00042403 */   sra       $a0, $a0, 0x10
/* 807D0 8007FBD0 0801FEF8 */  j          .L8007FBE0
/* 807D4 8007FBD4 8FBF0024 */   lw        $ra, 0x24($sp)
.L8007FBD8:
/* 807D8 8007FBD8 00001021 */  addu       $v0, $zero, $zero
/* 807DC 8007FBDC 8FBF0024 */  lw         $ra, 0x24($sp)
.L8007FBE0:
/* 807E0 8007FBE0 8FB40020 */  lw         $s4, 0x20($sp)
/* 807E4 8007FBE4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 807E8 8007FBE8 8FB20018 */  lw         $s2, 0x18($sp)
/* 807EC 8007FBEC 8FB10014 */  lw         $s1, 0x14($sp)
/* 807F0 8007FBF0 8FB00010 */  lw         $s0, 0x10($sp)
/* 807F4 8007FBF4 03E00008 */  jr         $ra
/* 807F8 8007FBF8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_loremaster_INT_
/* 807FC 8007FBFC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 80800 8007FC00 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80804 8007FC04 00009821 */  addu       $s3, $zero, $zero
/* 80808 8007FC08 AFB40020 */  sw         $s4, 0x20($sp)
/* 8080C 8007FC0C 0000A021 */  addu       $s4, $zero, $zero
/* 80810 8007FC10 AFB20018 */  sw         $s2, 0x18($sp)
/* 80814 8007FC14 00009021 */  addu       $s2, $zero, $zero
/* 80818 8007FC18 AFB10014 */  sw         $s1, 0x14($sp)
/* 8081C 8007FC1C 00808821 */  addu       $s1, $a0, $zero
/* 80820 8007FC20 AFBF0024 */  sw         $ra, 0x24($sp)
/* 80824 8007FC24 AFB00010 */  sw         $s0, 0x10($sp)
.L8007FC28:
/* 80828 8007FC28 8E300000 */  lw         $s0, ($s1)
/* 8082C 8007FC2C 52000012 */  beql       $s0, $zero, .L8007FC78
/* 80830 8007FC30 26520001 */   addiu     $s2, $s2, 1
/* 80834 8007FC34 0C01DF1D */  jal        isDead
/* 80838 8007FC38 02002021 */   addu      $a0, $s0, $zero
/* 8083C 8007FC3C 5440000E */  bnel       $v0, $zero, .L8007FC78
/* 80840 8007FC40 26520001 */   addiu     $s2, $s2, 1
/* 80844 8007FC44 8E040018 */  lw         $a0, 0x18($s0)
/* 80848 8007FC48 0C02128F */  jal        getModdedStat
/* 8084C 8007FC4C 00002821 */   addu      $a1, $zero, $zero
/* 80850 8007FC50 304300FF */  andi       $v1, $v0, 0xff
/* 80854 8007FC54 0263102B */  sltu       $v0, $s3, $v1
/* 80858 8007FC58 54400001 */  bnel       $v0, $zero, .L8007FC60
/* 8085C 8007FC5C 00609821 */   addu      $s3, $v1, $zero
.L8007FC60:
/* 80860 8007FC60 8E04001C */  lw         $a0, 0x1c($s0)
/* 80864 8007FC64 0C020F67 */  jal        getModdedSkill
/* 80868 8007FC68 24050003 */   addiu     $a1, $zero, 3
/* 8086C 8007FC6C 02821021 */  addu       $v0, $s4, $v0
/* 80870 8007FC70 305400FF */  andi       $s4, $v0, 0xff
/* 80874 8007FC74 26520001 */  addiu      $s2, $s2, 1
.L8007FC78:
/* 80878 8007FC78 2E420004 */  sltiu      $v0, $s2, 4
/* 8087C 8007FC7C 1440FFEA */  bnez       $v0, .L8007FC28
/* 80880 8007FC80 26310004 */   addiu     $s1, $s1, 4
/* 80884 8007FC84 24040001 */  addiu      $a0, $zero, 1
/* 80888 8007FC88 24050064 */  addiu      $a1, $zero, 0x64
/* 8088C 8007FC8C 00131040 */  sll        $v0, $s3, 1
/* 80890 8007FC90 00531021 */  addu       $v0, $v0, $s3
/* 80894 8007FC94 00141840 */  sll        $v1, $s4, 1
/* 80898 8007FC98 00741821 */  addu       $v1, $v1, $s4
/* 8089C 8007FC9C 00031840 */  sll        $v1, $v1, 1
/* 808A0 8007FCA0 00431021 */  addu       $v0, $v0, $v1
/* 808A4 8007FCA4 0C002D03 */  jal        RollD
/* 808A8 8007FCA8 3050FFFF */   andi      $s0, $v0, 0xffff
/* 808AC 8007FCAC 00401821 */  addu       $v1, $v0, $zero
/* 808B0 8007FCB0 0070102B */  sltu       $v0, $v1, $s0
/* 808B4 8007FCB4 10400006 */  beqz       $v0, .L8007FCD0
/* 808B8 8007FCB8 02032023 */   subu      $a0, $s0, $v1
/* 808BC 8007FCBC 00042400 */  sll        $a0, $a0, 0x10
/* 808C0 8007FCC0 0C002D20 */  jal        some_skillcheck_calc
/* 808C4 8007FCC4 00042403 */   sra       $a0, $a0, 0x10
/* 808C8 8007FCC8 0801FF36 */  j          .L8007FCD8
/* 808CC 8007FCCC 8FBF0024 */   lw        $ra, 0x24($sp)
.L8007FCD0:
/* 808D0 8007FCD0 00001021 */  addu       $v0, $zero, $zero
/* 808D4 8007FCD4 8FBF0024 */  lw         $ra, 0x24($sp)
.L8007FCD8:
/* 808D8 8007FCD8 8FB40020 */  lw         $s4, 0x20($sp)
/* 808DC 8007FCDC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 808E0 8007FCE0 8FB20018 */  lw         $s2, 0x18($sp)
/* 808E4 8007FCE4 8FB10014 */  lw         $s1, 0x14($sp)
/* 808E8 8007FCE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 808EC 8007FCEC 03E00008 */  jr         $ra
/* 808F0 8007FCF0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel loremaster_INT_skillcheck
/* 808F4 8007FCF4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 808F8 8007FCF8 AFB00010 */  sw         $s0, 0x10($sp)
/* 808FC 8007FCFC 00808021 */  addu       $s0, $a0, $zero
/* 80900 8007FD00 AFBF0014 */  sw         $ra, 0x14($sp)
/* 80904 8007FD04 0C020724 */  jal        GetMostSkilledMember
/* 80908 8007FD08 24050003 */   addiu     $a1, $zero, 3
/* 8090C 8007FD0C 00401821 */  addu       $v1, $v0, $zero
/* 80910 8007FD10 240200FF */  addiu      $v0, $zero, 0xff
/* 80914 8007FD14 10620018 */  beq        $v1, $v0, .L8007FD78
/* 80918 8007FD18 00031080 */   sll       $v0, $v1, 2
/* 8091C 8007FD1C 02021021 */  addu       $v0, $s0, $v0
/* 80920 8007FD20 8C500000 */  lw         $s0, ($v0)
/* 80924 8007FD24 12000019 */  beqz       $s0, .L8007FD8C
/* 80928 8007FD28 00001021 */   addu      $v0, $zero, $zero
/* 8092C 8007FD2C 8E04001C */  lw         $a0, 0x1c($s0)
/* 80930 8007FD30 0C020F67 */  jal        getModdedSkill
/* 80934 8007FD34 24050003 */   addiu     $a1, $zero, 3
/* 80938 8007FD38 00002821 */  addu       $a1, $zero, $zero
/* 8093C 8007FD3C 8E040018 */  lw         $a0, 0x18($s0)
/* 80940 8007FD40 0C02128F */  jal        getModdedStat
/* 80944 8007FD44 305000FF */   andi      $s0, $v0, 0xff
/* 80948 8007FD48 24040001 */  addiu      $a0, $zero, 1
/* 8094C 8007FD4C 24050064 */  addiu      $a1, $zero, 0x64
/* 80950 8007FD50 00101840 */  sll        $v1, $s0, 1
/* 80954 8007FD54 00701821 */  addu       $v1, $v1, $s0
/* 80958 8007FD58 00621821 */  addu       $v1, $v1, $v0
/* 8095C 8007FD5C 00031840 */  sll        $v1, $v1, 1
/* 80960 8007FD60 0C002D03 */  jal        RollD
/* 80964 8007FD64 3070FFFF */   andi      $s0, $v1, 0xffff
/* 80968 8007FD68 00401821 */  addu       $v1, $v0, $zero
/* 8096C 8007FD6C 0070102B */  sltu       $v0, $v1, $s0
/* 80970 8007FD70 14400003 */  bnez       $v0, .L8007FD80
/* 80974 8007FD74 02032023 */   subu      $a0, $s0, $v1
.L8007FD78:
/* 80978 8007FD78 0801FF63 */  j          .L8007FD8C
/* 8097C 8007FD7C 00001021 */   addu      $v0, $zero, $zero
.L8007FD80:
/* 80980 8007FD80 00042400 */  sll        $a0, $a0, 0x10
/* 80984 8007FD84 0C002D20 */  jal        some_skillcheck_calc
/* 80988 8007FD88 00042403 */   sra       $a0, $a0, 0x10
.L8007FD8C:
/* 8098C 8007FD8C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 80990 8007FD90 8FB00010 */  lw         $s0, 0x10($sp)
/* 80994 8007FD94 03E00008 */  jr         $ra
/* 80998 8007FD98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel getMechanic_Int_Dex
/* 8099C 8007FD9C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 809A0 8007FDA0 30A500FF */  andi       $a1, $a1, 0xff
/* 809A4 8007FDA4 00052880 */  sll        $a1, $a1, 2
/* 809A8 8007FDA8 00852021 */  addu       $a0, $a0, $a1
/* 809AC 8007FDAC AFBF0020 */  sw         $ra, 0x20($sp)
/* 809B0 8007FDB0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 809B4 8007FDB4 AFB20018 */  sw         $s2, 0x18($sp)
/* 809B8 8007FDB8 AFB10014 */  sw         $s1, 0x14($sp)
/* 809BC 8007FDBC AFB00010 */  sw         $s0, 0x10($sp)
/* 809C0 8007FDC0 8C920000 */  lw         $s2, ($a0)
/* 809C4 8007FDC4 1240002E */  beqz       $s2, .L8007FE80
/* 809C8 8007FDC8 00001021 */   addu      $v0, $zero, $zero
/* 809CC 8007FDCC 8E44001C */  lw         $a0, 0x1c($s2)
/* 809D0 8007FDD0 0C020F67 */  jal        getModdedSkill
/* 809D4 8007FDD4 24050004 */   addiu     $a1, $zero, 4
/* 809D8 8007FDD8 00002821 */  addu       $a1, $zero, $zero
/* 809DC 8007FDDC 8E440018 */  lw         $a0, 0x18($s2)
/* 809E0 8007FDE0 0C02128F */  jal        getModdedStat
/* 809E4 8007FDE4 00409821 */   addu      $s3, $v0, $zero
/* 809E8 8007FDE8 24050002 */  addiu      $a1, $zero, 2
/* 809EC 8007FDEC 8E440018 */  lw         $a0, 0x18($s2)
/* 809F0 8007FDF0 0C02128F */  jal        getModdedStat
/* 809F4 8007FDF4 00408021 */   addu      $s0, $v0, $zero
/* 809F8 8007FDF8 02028021 */  addu       $s0, $s0, $v0
/* 809FC 8007FDFC 00131080 */  sll        $v0, $s3, 2
/* 80A00 8007FE00 00531021 */  addu       $v0, $v0, $s3
/* 80A04 8007FE04 00501021 */  addu       $v0, $v0, $s0
/* 80A08 8007FE08 00021040 */  sll        $v0, $v0, 1
/* 80A0C 8007FE0C 3051FFFF */  andi       $s1, $v0, 0xffff
/* 80A10 8007FE10 24040001 */  addiu      $a0, $zero, 1
/* 80A14 8007FE14 0C002D03 */  jal        RollD
/* 80A18 8007FE18 24050064 */   addiu     $a1, $zero, 0x64
/* 80A1C 8007FE1C 00408021 */  addu       $s0, $v0, $zero
/* 80A20 8007FE20 0211102B */  sltu       $v0, $s0, $s1
/* 80A24 8007FE24 10400015 */  beqz       $v0, .L8007FE7C
/* 80A28 8007FE28 02302023 */   subu      $a0, $s1, $s0
/* 80A2C 8007FE2C 00042400 */  sll        $a0, $a0, 0x10
/* 80A30 8007FE30 0C002D20 */  jal        some_skillcheck_calc
/* 80A34 8007FE34 00042403 */   sra       $a0, $a0, 0x10
/* 80A38 8007FE38 00408821 */  addu       $s1, $v0, $zero
/* 80A3C 8007FE3C 24020005 */  addiu      $v0, $zero, 5
/* 80A40 8007FE40 00531023 */  subu       $v0, $v0, $s3
/* 80A44 8007FE44 58400001 */  blezl      $v0, .L8007FE4C
/* 80A48 8007FE48 24020001 */   addiu     $v0, $zero, 1
.L8007FE4C:
/* 80A4C 8007FE4C 3050FFFF */  andi       $s0, $v0, 0xffff
/* 80A50 8007FE50 8E440018 */  lw         $a0, 0x18($s2)
/* 80A54 8007FE54 0C02128F */  jal        getModdedStat
/* 80A58 8007FE58 24050005 */   addiu     $a1, $zero, 5
/* 80A5C 8007FE5C 0050102A */  slt        $v0, $v0, $s0
/* 80A60 8007FE60 14400007 */  bnez       $v0, .L8007FE80
/* 80A64 8007FE64 00001021 */   addu      $v0, $zero, $zero
/* 80A68 8007FE68 02402021 */  addu       $a0, $s2, $zero
/* 80A6C 8007FE6C 0C01DF28 */  jal        damage_func
/* 80A70 8007FE70 02002821 */   addu      $a1, $s0, $zero
/* 80A74 8007FE74 0801FFA0 */  j          .L8007FE80
/* 80A78 8007FE78 322200FF */   andi      $v0, $s1, 0xff
.L8007FE7C:
/* 80A7C 8007FE7C 00001021 */  addu       $v0, $zero, $zero
.L8007FE80:
/* 80A80 8007FE80 8FBF0020 */  lw         $ra, 0x20($sp)
/* 80A84 8007FE84 8FB3001C */  lw         $s3, 0x1c($sp)
/* 80A88 8007FE88 8FB20018 */  lw         $s2, 0x18($sp)
/* 80A8C 8007FE8C 8FB10014 */  lw         $s1, 0x14($sp)
/* 80A90 8007FE90 8FB00010 */  lw         $s0, 0x10($sp)
/* 80A94 8007FE94 03E00008 */  jr         $ra
/* 80A98 8007FE98 27BD0028 */   addiu     $sp, $sp, 0x28

glabel mechanic_int_dex_skillcheck
/* 80A9C 8007FE9C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 80AA0 8007FEA0 30A500FF */  andi       $a1, $a1, 0xff
/* 80AA4 8007FEA4 00052880 */  sll        $a1, $a1, 2
/* 80AA8 8007FEA8 00852021 */  addu       $a0, $a0, $a1
/* 80AAC 8007FEAC AFBF0020 */  sw         $ra, 0x20($sp)
/* 80AB0 8007FEB0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80AB4 8007FEB4 AFB20018 */  sw         $s2, 0x18($sp)
/* 80AB8 8007FEB8 AFB10014 */  sw         $s1, 0x14($sp)
/* 80ABC 8007FEBC AFB00010 */  sw         $s0, 0x10($sp)
/* 80AC0 8007FEC0 8C910000 */  lw         $s1, ($a0)
/* 80AC4 8007FEC4 1220002C */  beqz       $s1, .L8007FF78
/* 80AC8 8007FEC8 00001021 */   addu      $v0, $zero, $zero
/* 80ACC 8007FECC 8E24001C */  lw         $a0, 0x1c($s1)
/* 80AD0 8007FED0 0C020F67 */  jal        getModdedSkill
/* 80AD4 8007FED4 24050004 */   addiu     $a1, $zero, 4
/* 80AD8 8007FED8 00002821 */  addu       $a1, $zero, $zero
/* 80ADC 8007FEDC 8E240018 */  lw         $a0, 0x18($s1)
/* 80AE0 8007FEE0 0C02128F */  jal        getModdedStat
/* 80AE4 8007FEE4 00409021 */   addu      $s2, $v0, $zero
/* 80AE8 8007FEE8 24050002 */  addiu      $a1, $zero, 2
/* 80AEC 8007FEEC 8E240018 */  lw         $a0, 0x18($s1)
/* 80AF0 8007FEF0 0C02128F */  jal        getModdedStat
/* 80AF4 8007FEF4 00408021 */   addu      $s0, $v0, $zero
/* 80AF8 8007FEF8 24040001 */  addiu      $a0, $zero, 1
/* 80AFC 8007FEFC 24050064 */  addiu      $a1, $zero, 0x64
/* 80B00 8007FF00 02028021 */  addu       $s0, $s0, $v0
/* 80B04 8007FF04 00121080 */  sll        $v0, $s2, 2
/* 80B08 8007FF08 00521021 */  addu       $v0, $v0, $s2
/* 80B0C 8007FF0C 00501021 */  addu       $v0, $v0, $s0
/* 80B10 8007FF10 00021040 */  sll        $v0, $v0, 1
/* 80B14 8007FF14 0C002D03 */  jal        RollD
/* 80B18 8007FF18 3050FFFF */   andi      $s0, $v0, 0xffff
/* 80B1C 8007FF1C 00402021 */  addu       $a0, $v0, $zero
/* 80B20 8007FF20 0090102B */  sltu       $v0, $a0, $s0
/* 80B24 8007FF24 10400013 */  beqz       $v0, .L8007FF74
/* 80B28 8007FF28 02042023 */   subu      $a0, $s0, $a0
/* 80B2C 8007FF2C 00042400 */  sll        $a0, $a0, 0x10
/* 80B30 8007FF30 0C002D20 */  jal        some_skillcheck_calc
/* 80B34 8007FF34 00042403 */   sra       $a0, $a0, 0x10
/* 80B38 8007FF38 8E240018 */  lw         $a0, 0x18($s1)
/* 80B3C 8007FF3C 24050005 */  addiu      $a1, $zero, 5
/* 80B40 8007FF40 00409821 */  addu       $s3, $v0, $zero
/* 80B44 8007FF44 2402000F */  addiu      $v0, $zero, 0xf
/* 80B48 8007FF48 00521023 */  subu       $v0, $v0, $s2
/* 80B4C 8007FF4C 0C02128F */  jal        getModdedStat
/* 80B50 8007FF50 3050FFFF */   andi      $s0, $v0, 0xffff
/* 80B54 8007FF54 0050102A */  slt        $v0, $v0, $s0
/* 80B58 8007FF58 14400007 */  bnez       $v0, .L8007FF78
/* 80B5C 8007FF5C 00001021 */   addu      $v0, $zero, $zero
/* 80B60 8007FF60 02202021 */  addu       $a0, $s1, $zero
/* 80B64 8007FF64 0C01DF28 */  jal        damage_func
/* 80B68 8007FF68 02002821 */   addu      $a1, $s0, $zero
/* 80B6C 8007FF6C 0801FFDE */  j          .L8007FF78
/* 80B70 8007FF70 326200FF */   andi      $v0, $s3, 0xff
.L8007FF74:
/* 80B74 8007FF74 00001021 */  addu       $v0, $zero, $zero
.L8007FF78:
/* 80B78 8007FF78 8FBF0020 */  lw         $ra, 0x20($sp)
/* 80B7C 8007FF7C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 80B80 8007FF80 8FB20018 */  lw         $s2, 0x18($sp)
/* 80B84 8007FF84 8FB10014 */  lw         $s1, 0x14($sp)
/* 80B88 8007FF88 8FB00010 */  lw         $s0, 0x10($sp)
/* 80B8C 8007FF8C 03E00008 */  jr         $ra
/* 80B90 8007FF90 27BD0028 */   addiu     $sp, $sp, 0x28

glabel merchant_skill_check
/* 80B94 8007FF94 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 80B98 8007FF98 AFB50024 */  sw         $s5, 0x24($sp)
/* 80B9C 8007FF9C 0080A821 */  addu       $s5, $a0, $zero
/* 80BA0 8007FFA0 AFB40020 */  sw         $s4, 0x20($sp)
/* 80BA4 8007FFA4 30D400FF */  andi       $s4, $a2, 0xff
/* 80BA8 8007FFA8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80BAC 8007FFAC 24130004 */  addiu      $s3, $zero, 4
/* 80BB0 8007FFB0 AFB20018 */  sw         $s2, 0x18($sp)
/* 80BB4 8007FFB4 00009021 */  addu       $s2, $zero, $zero
/* 80BB8 8007FFB8 AFB10014 */  sw         $s1, 0x14($sp)
/* 80BBC 8007FFBC 02408821 */  addu       $s1, $s2, $zero
/* 80BC0 8007FFC0 AFBF0028 */  sw         $ra, 0x28($sp)
/* 80BC4 8007FFC4 AFB00010 */  sw         $s0, 0x10($sp)
/* 80BC8 8007FFC8 00111080 */  sll        $v0, $s1, 2
.L8007FFCC:
/* 80BCC 8007FFCC 02A21021 */  addu       $v0, $s5, $v0
/* 80BD0 8007FFD0 8C500000 */  lw         $s0, ($v0)
/* 80BD4 8007FFD4 12000010 */  beqz       $s0, .L80080018
/* 80BD8 8007FFD8 26220001 */   addiu     $v0, $s1, 1
/* 80BDC 8007FFDC 0C01DF1D */  jal        isDead
/* 80BE0 8007FFE0 02002021 */   addu      $a0, $s0, $zero
/* 80BE4 8007FFE4 1440000C */  bnez       $v0, .L80080018
/* 80BE8 8007FFE8 26220001 */   addiu     $v0, $s1, 1
/* 80BEC 8007FFEC 8E04001C */  lw         $a0, 0x1c($s0)
/* 80BF0 8007FFF0 0C020F67 */  jal        getModdedSkill
/* 80BF4 8007FFF4 24050005 */   addiu     $a1, $zero, 5
/* 80BF8 8007FFF8 00401821 */  addu       $v1, $v0, $zero
/* 80BFC 8007FFFC 10600005 */  beqz       $v1, .L80080014
/* 80C00 80080000 0072102A */   slt       $v0, $v1, $s2
/* 80C04 80080004 14400004 */  bnez       $v0, .L80080018
/* 80C08 80080008 26220001 */   addiu     $v0, $s1, 1
/* 80C0C 8008000C 00609021 */  addu       $s2, $v1, $zero
/* 80C10 80080010 02209821 */  addu       $s3, $s1, $zero
.L80080014:
/* 80C14 80080014 26220001 */  addiu      $v0, $s1, 1
.L80080018:
/* 80C18 80080018 305100FF */  andi       $s1, $v0, 0xff
/* 80C1C 8008001C 2E230004 */  sltiu      $v1, $s1, 4
/* 80C20 80080020 1460FFEA */  bnez       $v1, .L8007FFCC
/* 80C24 80080024 00111080 */   sll       $v0, $s1, 2
/* 80C28 80080028 24020004 */  addiu      $v0, $zero, 4
/* 80C2C 8008002C 12620016 */  beq        $s3, $v0, .L80080088
/* 80C30 80080030 00131080 */   sll       $v0, $s3, 2
/* 80C34 80080034 02A21021 */  addu       $v0, $s5, $v0
/* 80C38 80080038 24050005 */  addiu      $a1, $zero, 5
/* 80C3C 8008003C 8C510000 */  lw         $s1, ($v0)
/* 80C40 80080040 2402000F */  addiu      $v0, $zero, 0xf
/* 80C44 80080044 00521023 */  subu       $v0, $v0, $s2
/* 80C48 80080048 00021400 */  sll        $v0, $v0, 0x10
/* 80C4C 8008004C 8E240018 */  lw         $a0, 0x18($s1)
/* 80C50 80080050 0C02128F */  jal        getModdedStat
/* 80C54 80080054 00028403 */   sra       $s0, $v0, 0x10
/* 80C58 80080058 0050102A */  slt        $v0, $v0, $s0
/* 80C5C 8008005C 1440000A */  bnez       $v0, .L80080088
/* 80C60 80080060 02202021 */   addu      $a0, $s1, $zero
/* 80C64 80080064 0C01DF28 */  jal        damage_func
/* 80C68 80080068 3205FFFF */   andi      $a1, $s0, 0xffff
/* 80C6C 8008006C 02921023 */  subu       $v0, $s4, $s2
/* 80C70 80080070 3C01800E */  lui        $at, %hi(D_800E0C2C)
/* 80C74 80080074 C4220C2C */  lwc1       $f2, %lo(D_800E0C2C)($at)
/* 80C78 80080078 44820000 */  mtc1       $v0, $f0
/* 80C7C 8008007C 46800020 */  cvt.s.w    $f0, $f0
/* 80C80 80080080 08020026 */  j          .L80080098
/* 80C84 80080084 00000000 */   nop
.L80080088:
/* 80C88 80080088 3C01800E */  lui        $at, %hi(D_800E0C30)
/* 80C8C 8008008C C4220C30 */  lwc1       $f2, %lo(D_800E0C30)($at)
/* 80C90 80080090 44940000 */  mtc1       $s4, $f0
/* 80C94 80080094 46800020 */  cvt.s.w    $f0, $f0
.L80080098:
/* 80C98 80080098 46020002 */  mul.s      $f0, $f0, $f2
/* 80C9C 8008009C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 80CA0 800800A0 8FB50024 */  lw         $s5, 0x24($sp)
/* 80CA4 800800A4 8FB40020 */  lw         $s4, 0x20($sp)
/* 80CA8 800800A8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 80CAC 800800AC 8FB20018 */  lw         $s2, 0x18($sp)
/* 80CB0 800800B0 8FB10014 */  lw         $s1, 0x14($sp)
/* 80CB4 800800B4 8FB00010 */  lw         $s0, 0x10($sp)
/* 80CB8 800800B8 03E00008 */  jr         $ra
/* 80CBC 800800BC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel some_ranger_stam_func
/* 80CC0 800800C0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 80CC4 800800C4 AFB60028 */  sw         $s6, 0x28($sp)
/* 80CC8 800800C8 0080B021 */  addu       $s6, $a0, $zero
/* 80CCC 800800CC AFB50024 */  sw         $s5, 0x24($sp)
/* 80CD0 800800D0 24150004 */  addiu      $s5, $zero, 4
/* 80CD4 800800D4 AFB40020 */  sw         $s4, 0x20($sp)
/* 80CD8 800800D8 0000A021 */  addu       $s4, $zero, $zero
/* 80CDC 800800DC AFB3001C */  sw         $s3, 0x1c($sp)
/* 80CE0 800800E0 00009821 */  addu       $s3, $zero, $zero
/* 80CE4 800800E4 AFB7002C */  sw         $s7, 0x2c($sp)
/* 80CE8 800800E8 24170005 */  addiu      $s7, $zero, 5
/* 80CEC 800800EC AFBF0030 */  sw         $ra, 0x30($sp)
/* 80CF0 800800F0 AFB20018 */  sw         $s2, 0x18($sp)
/* 80CF4 800800F4 AFB10014 */  sw         $s1, 0x14($sp)
/* 80CF8 800800F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 80CFC 800800FC 00131080 */  sll        $v0, $s3, 2
.L80080100:
/* 80D00 80080100 02C29021 */  addu       $s2, $s6, $v0
/* 80D04 80080104 8E420000 */  lw         $v0, ($s2)
/* 80D08 80080108 50400015 */  beql       $v0, $zero, .L80080160
/* 80D0C 8008010C 26620001 */   addiu     $v0, $s3, 1
/* 80D10 80080110 8C44001C */  lw         $a0, 0x1c($v0)
/* 80D14 80080114 0C020F67 */  jal        getModdedSkill
/* 80D18 80080118 24050006 */   addiu     $a1, $zero, 6
/* 80D1C 8008011C 305000FF */  andi       $s0, $v0, 0xff
/* 80D20 80080120 02F01023 */  subu       $v0, $s7, $s0
/* 80D24 80080124 58400001 */  blezl      $v0, .L8008012C
/* 80D28 80080128 24020001 */   addiu     $v0, $zero, 1
.L8008012C:
/* 80D2C 8008012C 305100FF */  andi       $s1, $v0, 0xff
/* 80D30 80080130 0290102B */  sltu       $v0, $s4, $s0
/* 80D34 80080134 1040000A */  beqz       $v0, .L80080160
/* 80D38 80080138 26620001 */   addiu     $v0, $s3, 1
/* 80D3C 8008013C 8E420000 */  lw         $v0, ($s2)
/* 80D40 80080140 8C440018 */  lw         $a0, 0x18($v0)
/* 80D44 80080144 0C02128F */  jal        getModdedStat
/* 80D48 80080148 24050005 */   addiu     $a1, $zero, 5
/* 80D4C 8008014C 0051102A */  slt        $v0, $v0, $s1
/* 80D50 80080150 14400003 */  bnez       $v0, .L80080160
/* 80D54 80080154 26620001 */   addiu     $v0, $s3, 1
/* 80D58 80080158 0200A021 */  addu       $s4, $s0, $zero
/* 80D5C 8008015C 0260A821 */  addu       $s5, $s3, $zero
.L80080160:
/* 80D60 80080160 305300FF */  andi       $s3, $v0, 0xff
/* 80D64 80080164 2E630004 */  sltiu      $v1, $s3, 4
/* 80D68 80080168 1460FFE5 */  bnez       $v1, .L80080100
/* 80D6C 8008016C 00131080 */   sll       $v0, $s3, 2
/* 80D70 80080170 1280002C */  beqz       $s4, .L80080224
/* 80D74 80080174 24020002 */   addiu     $v0, $zero, 2
/* 80D78 80080178 24020004 */  addiu      $v0, $zero, 4
/* 80D7C 8008017C 12A20028 */  beq        $s5, $v0, .L80080220
/* 80D80 80080180 00151080 */   sll       $v0, $s5, 2
/* 80D84 80080184 02C21021 */  addu       $v0, $s6, $v0
/* 80D88 80080188 8C520000 */  lw         $s2, ($v0)
/* 80D8C 8008018C 8E440018 */  lw         $a0, 0x18($s2)
/* 80D90 80080190 0C02128F */  jal        getModdedStat
/* 80D94 80080194 00002821 */   addu      $a1, $zero, $zero
/* 80D98 80080198 00021840 */  sll        $v1, $v0, 1
/* 80D9C 8008019C 00621821 */  addu       $v1, $v1, $v0
/* 80DA0 800801A0 00141080 */  sll        $v0, $s4, 2
/* 80DA4 800801A4 00541021 */  addu       $v0, $v0, $s4
/* 80DA8 800801A8 00021040 */  sll        $v0, $v0, 1
/* 80DAC 800801AC 00621821 */  addu       $v1, $v1, $v0
/* 80DB0 800801B0 3071FFFF */  andi       $s1, $v1, 0xffff
/* 80DB4 800801B4 24040001 */  addiu      $a0, $zero, 1
/* 80DB8 800801B8 0C002D03 */  jal        RollD
/* 80DBC 800801BC 24050064 */   addiu     $a1, $zero, 0x64
/* 80DC0 800801C0 00408021 */  addu       $s0, $v0, $zero
/* 80DC4 800801C4 0211102B */  sltu       $v0, $s0, $s1
/* 80DC8 800801C8 10400015 */  beqz       $v0, .L80080220
/* 80DCC 800801CC 02302023 */   subu      $a0, $s1, $s0
/* 80DD0 800801D0 00042400 */  sll        $a0, $a0, 0x10
/* 80DD4 800801D4 0C002D20 */  jal        some_skillcheck_calc
/* 80DD8 800801D8 00042403 */   sra       $a0, $a0, 0x10
/* 80DDC 800801DC 00408821 */  addu       $s1, $v0, $zero
/* 80DE0 800801E0 24020005 */  addiu      $v0, $zero, 5
/* 80DE4 800801E4 00541023 */  subu       $v0, $v0, $s4
/* 80DE8 800801E8 58400001 */  blezl      $v0, .L800801F0
/* 80DEC 800801EC 24020001 */   addiu     $v0, $zero, 1
.L800801F0:
/* 80DF0 800801F0 3050FFFF */  andi       $s0, $v0, 0xffff
/* 80DF4 800801F4 8E440018 */  lw         $a0, 0x18($s2)
/* 80DF8 800801F8 0C02128F */  jal        getModdedStat
/* 80DFC 800801FC 24050005 */   addiu     $a1, $zero, 5
/* 80E00 80080200 0050102A */  slt        $v0, $v0, $s0
/* 80E04 80080204 14400007 */  bnez       $v0, .L80080224
/* 80E08 80080208 00001021 */   addu      $v0, $zero, $zero
/* 80E0C 8008020C 02402021 */  addu       $a0, $s2, $zero
/* 80E10 80080210 0C01DF28 */  jal        damage_func
/* 80E14 80080214 02002821 */   addu      $a1, $s0, $zero
/* 80E18 80080218 08020089 */  j          .L80080224
/* 80E1C 8008021C 322200FF */   andi      $v0, $s1, 0xff
.L80080220:
/* 80E20 80080220 00001021 */  addu       $v0, $zero, $zero
.L80080224:
/* 80E24 80080224 8FBF0030 */  lw         $ra, 0x30($sp)
/* 80E28 80080228 8FB7002C */  lw         $s7, 0x2c($sp)
/* 80E2C 8008022C 8FB60028 */  lw         $s6, 0x28($sp)
/* 80E30 80080230 8FB50024 */  lw         $s5, 0x24($sp)
/* 80E34 80080234 8FB40020 */  lw         $s4, 0x20($sp)
/* 80E38 80080238 8FB3001C */  lw         $s3, 0x1c($sp)
/* 80E3C 8008023C 8FB20018 */  lw         $s2, 0x18($sp)
/* 80E40 80080240 8FB10014 */  lw         $s1, 0x14($sp)
/* 80E44 80080244 8FB00010 */  lw         $s0, 0x10($sp)
/* 80E48 80080248 03E00008 */  jr         $ra
/* 80E4C 8008024C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel Ofunc_Ranger_int_check
/* 80E50 80080250 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 80E54 80080254 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80E58 80080258 00809821 */  addu       $s3, $a0, $zero
/* 80E5C 8008025C AFB20018 */  sw         $s2, 0x18($sp)
/* 80E60 80080260 24120004 */  addiu      $s2, $zero, 4
/* 80E64 80080264 AFB10014 */  sw         $s1, 0x14($sp)
/* 80E68 80080268 00008821 */  addu       $s1, $zero, $zero
/* 80E6C 8008026C AFB00010 */  sw         $s0, 0x10($sp)
/* 80E70 80080270 00008021 */  addu       $s0, $zero, $zero
/* 80E74 80080274 AFBF0020 */  sw         $ra, 0x20($sp)
/* 80E78 80080278 00101080 */  sll        $v0, $s0, 2
.L8008027C:
/* 80E7C 8008027C 02621021 */  addu       $v0, $s3, $v0
/* 80E80 80080280 8C420000 */  lw         $v0, ($v0)
/* 80E84 80080284 5040000A */  beql       $v0, $zero, .L800802B0
/* 80E88 80080288 26020001 */   addiu     $v0, $s0, 1
/* 80E8C 8008028C 8C44001C */  lw         $a0, 0x1c($v0)
/* 80E90 80080290 0C020F67 */  jal        getModdedSkill
/* 80E94 80080294 24050006 */   addiu     $a1, $zero, 6
/* 80E98 80080298 304300FF */  andi       $v1, $v0, 0xff
/* 80E9C 8008029C 0223102B */  sltu       $v0, $s1, $v1
/* 80EA0 800802A0 10400003 */  beqz       $v0, .L800802B0
/* 80EA4 800802A4 26020001 */   addiu     $v0, $s0, 1
/* 80EA8 800802A8 00608821 */  addu       $s1, $v1, $zero
/* 80EAC 800802AC 02009021 */  addu       $s2, $s0, $zero
.L800802B0:
/* 80EB0 800802B0 305000FF */  andi       $s0, $v0, 0xff
/* 80EB4 800802B4 2E030004 */  sltiu      $v1, $s0, 4
/* 80EB8 800802B8 1460FFF0 */  bnez       $v1, .L8008027C
/* 80EBC 800802BC 00101080 */   sll       $v0, $s0, 2
/* 80EC0 800802C0 1220001F */  beqz       $s1, .L80080340
/* 80EC4 800802C4 00001021 */   addu      $v0, $zero, $zero
/* 80EC8 800802C8 24020004 */  addiu      $v0, $zero, 4
/* 80ECC 800802CC 16420003 */  bne        $s2, $v0, .L800802DC
/* 80ED0 800802D0 00121080 */   sll       $v0, $s2, 2
.L800802D4:
/* 80ED4 800802D4 080200D0 */  j          .L80080340
/* 80ED8 800802D8 00001021 */   addu      $v0, $zero, $zero
.L800802DC:
/* 80EDC 800802DC 02621021 */  addu       $v0, $s3, $v0
/* 80EE0 800802E0 8C420000 */  lw         $v0, ($v0)
/* 80EE4 800802E4 50400016 */  beql       $v0, $zero, .L80080340
/* 80EE8 800802E8 00001021 */   addu      $v0, $zero, $zero
/* 80EEC 800802EC 8C440018 */  lw         $a0, 0x18($v0)
/* 80EF0 800802F0 0C02128F */  jal        getModdedStat
/* 80EF4 800802F4 00002821 */   addu      $a1, $zero, $zero
/* 80EF8 800802F8 24040001 */  addiu      $a0, $zero, 1
/* 80EFC 800802FC 24050064 */  addiu      $a1, $zero, 0x64
/* 80F00 80080300 00021840 */  sll        $v1, $v0, 1
/* 80F04 80080304 00621821 */  addu       $v1, $v1, $v0
/* 80F08 80080308 00111080 */  sll        $v0, $s1, 2
/* 80F0C 8008030C 00511021 */  addu       $v0, $v0, $s1
/* 80F10 80080310 00021040 */  sll        $v0, $v0, 1
/* 80F14 80080314 00621821 */  addu       $v1, $v1, $v0
/* 80F18 80080318 0C002D03 */  jal        RollD
/* 80F1C 8008031C 3070FFFF */   andi      $s0, $v1, 0xffff
/* 80F20 80080320 00401821 */  addu       $v1, $v0, $zero
/* 80F24 80080324 0070102B */  sltu       $v0, $v1, $s0
/* 80F28 80080328 1040FFEA */  beqz       $v0, .L800802D4
/* 80F2C 8008032C 02032023 */   subu      $a0, $s0, $v1
/* 80F30 80080330 00042400 */  sll        $a0, $a0, 0x10
/* 80F34 80080334 0C002D20 */  jal        some_skillcheck_calc
/* 80F38 80080338 00042403 */   sra       $a0, $a0, 0x10
/* 80F3C 8008033C 304200FF */  andi       $v0, $v0, 0xff
.L80080340:
/* 80F40 80080340 8FBF0020 */  lw         $ra, 0x20($sp)
/* 80F44 80080344 8FB3001C */  lw         $s3, 0x1c($sp)
/* 80F48 80080348 8FB20018 */  lw         $s2, 0x18($sp)
/* 80F4C 8008034C 8FB10014 */  lw         $s1, 0x14($sp)
/* 80F50 80080350 8FB00010 */  lw         $s0, 0x10($sp)
/* 80F54 80080354 03E00008 */  jr         $ra
/* 80F58 80080358 27BD0028 */   addiu     $sp, $sp, 0x28

glabel ofunc_ranger_stam_int
/* 80F5C 8008035C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 80F60 80080360 AFB60028 */  sw         $s6, 0x28($sp)
/* 80F64 80080364 0080B021 */  addu       $s6, $a0, $zero
/* 80F68 80080368 AFB50024 */  sw         $s5, 0x24($sp)
/* 80F6C 8008036C 24150004 */  addiu      $s5, $zero, 4
/* 80F70 80080370 AFB40020 */  sw         $s4, 0x20($sp)
/* 80F74 80080374 0000A021 */  addu       $s4, $zero, $zero
/* 80F78 80080378 AFB3001C */  sw         $s3, 0x1c($sp)
/* 80F7C 8008037C 00009821 */  addu       $s3, $zero, $zero
/* 80F80 80080380 AFB7002C */  sw         $s7, 0x2c($sp)
/* 80F84 80080384 24170005 */  addiu      $s7, $zero, 5
/* 80F88 80080388 AFBF0030 */  sw         $ra, 0x30($sp)
/* 80F8C 8008038C AFB20018 */  sw         $s2, 0x18($sp)
/* 80F90 80080390 AFB10014 */  sw         $s1, 0x14($sp)
/* 80F94 80080394 AFB00010 */  sw         $s0, 0x10($sp)
/* 80F98 80080398 00131080 */  sll        $v0, $s3, 2
.L8008039C:
/* 80F9C 8008039C 02C29021 */  addu       $s2, $s6, $v0
/* 80FA0 800803A0 8E420000 */  lw         $v0, ($s2)
/* 80FA4 800803A4 50400015 */  beql       $v0, $zero, .L800803FC
/* 80FA8 800803A8 26620001 */   addiu     $v0, $s3, 1
/* 80FAC 800803AC 8C44001C */  lw         $a0, 0x1c($v0)
/* 80FB0 800803B0 0C020F67 */  jal        getModdedSkill
/* 80FB4 800803B4 24050006 */   addiu     $a1, $zero, 6
/* 80FB8 800803B8 305000FF */  andi       $s0, $v0, 0xff
/* 80FBC 800803BC 02F01023 */  subu       $v0, $s7, $s0
/* 80FC0 800803C0 58400001 */  blezl      $v0, .L800803C8
/* 80FC4 800803C4 24020001 */   addiu     $v0, $zero, 1
.L800803C8:
/* 80FC8 800803C8 305100FF */  andi       $s1, $v0, 0xff
/* 80FCC 800803CC 0290102B */  sltu       $v0, $s4, $s0
/* 80FD0 800803D0 1040000A */  beqz       $v0, .L800803FC
/* 80FD4 800803D4 26620001 */   addiu     $v0, $s3, 1
/* 80FD8 800803D8 8E420000 */  lw         $v0, ($s2)
/* 80FDC 800803DC 8C440018 */  lw         $a0, 0x18($v0)
/* 80FE0 800803E0 0C02128F */  jal        getModdedStat
/* 80FE4 800803E4 24050005 */   addiu     $a1, $zero, 5
/* 80FE8 800803E8 0051102A */  slt        $v0, $v0, $s1
/* 80FEC 800803EC 14400003 */  bnez       $v0, .L800803FC
/* 80FF0 800803F0 26620001 */   addiu     $v0, $s3, 1
/* 80FF4 800803F4 0200A021 */  addu       $s4, $s0, $zero
/* 80FF8 800803F8 0260A821 */  addu       $s5, $s3, $zero
.L800803FC:
/* 80FFC 800803FC 305300FF */  andi       $s3, $v0, 0xff
/* 81000 80080400 2E630004 */  sltiu      $v1, $s3, 4
/* 81004 80080404 1460FFE5 */  bnez       $v1, .L8008039C
/* 81008 80080408 00131080 */   sll       $v0, $s3, 2
/* 8100C 8008040C 1280001F */  beqz       $s4, .L8008048C
/* 81010 80080410 00001021 */   addu      $v0, $zero, $zero
/* 81014 80080414 24020004 */  addiu      $v0, $zero, 4
/* 81018 80080418 16A20003 */  bne        $s5, $v0, .L80080428
/* 8101C 8008041C 00151080 */   sll       $v0, $s5, 2
.L80080420:
/* 81020 80080420 08020123 */  j          .L8008048C
/* 81024 80080424 00001021 */   addu      $v0, $zero, $zero
.L80080428:
/* 81028 80080428 02C21021 */  addu       $v0, $s6, $v0
/* 8102C 8008042C 8C420000 */  lw         $v0, ($v0)
/* 81030 80080430 50400016 */  beql       $v0, $zero, .L8008048C
/* 81034 80080434 00001021 */   addu      $v0, $zero, $zero
/* 81038 80080438 8C440018 */  lw         $a0, 0x18($v0)
/* 8103C 8008043C 0C02128F */  jal        getModdedStat
/* 81040 80080440 00002821 */   addu      $a1, $zero, $zero
/* 81044 80080444 24040001 */  addiu      $a0, $zero, 1
/* 81048 80080448 24050064 */  addiu      $a1, $zero, 0x64
/* 8104C 8008044C 00021840 */  sll        $v1, $v0, 1
/* 81050 80080450 00621821 */  addu       $v1, $v1, $v0
/* 81054 80080454 00141080 */  sll        $v0, $s4, 2
/* 81058 80080458 00541021 */  addu       $v0, $v0, $s4
/* 8105C 8008045C 00021040 */  sll        $v0, $v0, 1
/* 81060 80080460 00621821 */  addu       $v1, $v1, $v0
/* 81064 80080464 0C002D03 */  jal        RollD
/* 81068 80080468 3070FFFF */   andi      $s0, $v1, 0xffff
/* 8106C 8008046C 00401821 */  addu       $v1, $v0, $zero
/* 81070 80080470 0070102B */  sltu       $v0, $v1, $s0
/* 81074 80080474 1040FFEA */  beqz       $v0, .L80080420
/* 81078 80080478 02032023 */   subu      $a0, $s0, $v1
/* 8107C 8008047C 00042400 */  sll        $a0, $a0, 0x10
/* 81080 80080480 0C002D20 */  jal        some_skillcheck_calc
/* 81084 80080484 00042403 */   sra       $a0, $a0, 0x10
/* 81088 80080488 304200FF */  andi       $v0, $v0, 0xff
.L8008048C:
/* 8108C 8008048C 8FBF0030 */  lw         $ra, 0x30($sp)
/* 81090 80080490 8FB7002C */  lw         $s7, 0x2c($sp)
/* 81094 80080494 8FB60028 */  lw         $s6, 0x28($sp)
/* 81098 80080498 8FB50024 */  lw         $s5, 0x24($sp)
/* 8109C 8008049C 8FB40020 */  lw         $s4, 0x20($sp)
/* 810A0 800804A0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 810A4 800804A4 8FB20018 */  lw         $s2, 0x18($sp)
/* 810A8 800804A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 810AC 800804AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 810B0 800804B0 03E00008 */  jr         $ra
/* 810B4 800804B4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel get_int_ranger_stam
/* 810B8 800804B8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 810BC 800804BC 30A500FF */  andi       $a1, $a1, 0xff
/* 810C0 800804C0 00052880 */  sll        $a1, $a1, 2
/* 810C4 800804C4 00852021 */  addu       $a0, $a0, $a1
/* 810C8 800804C8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 810CC 800804CC AFB10014 */  sw         $s1, 0x14($sp)
/* 810D0 800804D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 810D4 800804D4 8C900000 */  lw         $s0, ($a0)
/* 810D8 800804D8 12000021 */  beqz       $s0, .L80080560
/* 810DC 800804DC 00001021 */   addu      $v0, $zero, $zero
/* 810E0 800804E0 8E040018 */  lw         $a0, 0x18($s0)
/* 810E4 800804E4 0C02128F */  jal        getModdedStat
/* 810E8 800804E8 00002821 */   addu      $a1, $zero, $zero
/* 810EC 800804EC 24050006 */  addiu      $a1, $zero, 6
/* 810F0 800804F0 8E04001C */  lw         $a0, 0x1c($s0)
/* 810F4 800804F4 0C020F67 */  jal        getModdedSkill
/* 810F8 800804F8 00408821 */   addu      $s1, $v0, $zero
/* 810FC 800804FC 24050005 */  addiu      $a1, $zero, 5
/* 81100 80080500 8E040018 */  lw         $a0, 0x18($s0)
/* 81104 80080504 0C02128F */  jal        getModdedStat
/* 81108 80080508 00408021 */   addu      $s0, $v0, $zero
/* 8110C 8008050C 24040001 */  addiu      $a0, $zero, 1
/* 81110 80080510 24050064 */  addiu      $a1, $zero, 0x64
/* 81114 80080514 00113040 */  sll        $a2, $s1, 1
/* 81118 80080518 00D13021 */  addu       $a2, $a2, $s1
/* 8111C 8008051C 00101880 */  sll        $v1, $s0, 2
/* 81120 80080520 00701821 */  addu       $v1, $v1, $s0
/* 81124 80080524 00031840 */  sll        $v1, $v1, 1
/* 81128 80080528 00C33021 */  addu       $a2, $a2, $v1
/* 8112C 8008052C 00C23021 */  addu       $a2, $a2, $v0
/* 81130 80080530 0C002D03 */  jal        RollD
/* 81134 80080534 30D0FFFF */   andi      $s0, $a2, 0xffff
/* 81138 80080538 00402021 */  addu       $a0, $v0, $zero
/* 8113C 8008053C 0090102B */  sltu       $v0, $a0, $s0
/* 81140 80080540 54400003 */  bnel       $v0, $zero, .L80080550
/* 81144 80080544 02042023 */   subu      $a0, $s0, $a0
/* 81148 80080548 08020158 */  j          .L80080560
/* 8114C 8008054C 00001021 */   addu      $v0, $zero, $zero
.L80080550:
/* 81150 80080550 00042400 */  sll        $a0, $a0, 0x10
/* 81154 80080554 0C002D20 */  jal        some_skillcheck_calc
/* 81158 80080558 00042403 */   sra       $a0, $a0, 0x10
/* 8115C 8008055C 304200FF */  andi       $v0, $v0, 0xff
.L80080560:
/* 81160 80080560 8FBF0018 */  lw         $ra, 0x18($sp)
/* 81164 80080564 8FB10014 */  lw         $s1, 0x14($sp)
/* 81168 80080568 8FB00010 */  lw         $s0, 0x10($sp)
/* 8116C 8008056C 03E00008 */  jr         $ra
/* 81170 80080570 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80080574
/* 81174 80080574 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 81178 80080578 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8117C 8008057C 00809821 */  addu       $s3, $a0, $zero
/* 81180 80080580 AFB20018 */  sw         $s2, 0x18($sp)
/* 81184 80080584 00009021 */  addu       $s2, $zero, $zero
/* 81188 80080588 AFB10014 */  sw         $s1, 0x14($sp)
/* 8118C 8008058C 00008821 */  addu       $s1, $zero, $zero
/* 81190 80080590 AFBF0020 */  sw         $ra, 0x20($sp)
/* 81194 80080594 AFB00010 */  sw         $s0, 0x10($sp)
/* 81198 80080598 00111080 */  sll        $v0, $s1, 2
.L8008059C:
/* 8119C 8008059C 02628021 */  addu       $s0, $s3, $v0
/* 811A0 800805A0 8E020000 */  lw         $v0, ($s0)
/* 811A4 800805A4 50400013 */  beql       $v0, $zero, .L800805F4
/* 811A8 800805A8 26220001 */   addiu     $v0, $s1, 1
/* 811AC 800805AC 8C440018 */  lw         $a0, 0x18($v0)
/* 811B0 800805B0 0C02128F */  jal        getModdedStat
/* 811B4 800805B4 00002821 */   addu      $a1, $zero, $zero
/* 811B8 800805B8 8E030000 */  lw         $v1, ($s0)
/* 811BC 800805BC 24050004 */  addiu      $a1, $zero, 4
/* 811C0 800805C0 8C64001C */  lw         $a0, 0x1c($v1)
/* 811C4 800805C4 0C020F67 */  jal        getModdedSkill
/* 811C8 800805C8 00408021 */   addu      $s0, $v0, $zero
/* 811CC 800805CC 00108040 */  sll        $s0, $s0, 1
/* 811D0 800805D0 00021880 */  sll        $v1, $v0, 2
/* 811D4 800805D4 00621821 */  addu       $v1, $v1, $v0
/* 811D8 800805D8 02038021 */  addu       $s0, $s0, $v1
/* 811DC 800805DC 00108400 */  sll        $s0, $s0, 0x10
/* 811E0 800805E0 00108403 */  sra        $s0, $s0, 0x10
/* 811E4 800805E4 0250102A */  slt        $v0, $s2, $s0
/* 811E8 800805E8 54400001 */  bnel       $v0, $zero, .L800805F0
/* 811EC 800805EC 02009021 */   addu      $s2, $s0, $zero
.L800805F0:
/* 811F0 800805F0 26220001 */  addiu      $v0, $s1, 1
.L800805F4:
/* 811F4 800805F4 305100FF */  andi       $s1, $v0, 0xff
/* 811F8 800805F8 2E230004 */  sltiu      $v1, $s1, 4
/* 811FC 800805FC 1460FFE7 */  bnez       $v1, .L8008059C
/* 81200 80080600 00111080 */   sll       $v0, $s1, 2
/* 81204 80080604 24040001 */  addiu      $a0, $zero, 1
/* 81208 80080608 0C002D03 */  jal        RollD
/* 8120C 8008060C 24050064 */   addiu     $a1, $zero, 0x64
/* 81210 80080610 00402021 */  addu       $a0, $v0, $zero
/* 81214 80080614 0092102A */  slt        $v0, $a0, $s2
/* 81218 80080618 54400003 */  bnel       $v0, $zero, .L80080628
/* 8121C 8008061C 02442023 */   subu      $a0, $s2, $a0
/* 81220 80080620 0802018E */  j          .L80080638
/* 81224 80080624 00001021 */   addu      $v0, $zero, $zero
.L80080628:
/* 81228 80080628 00042400 */  sll        $a0, $a0, 0x10
/* 8122C 8008062C 0C002D20 */  jal        some_skillcheck_calc
/* 81230 80080630 00042403 */   sra       $a0, $a0, 0x10
/* 81234 80080634 304200FF */  andi       $v0, $v0, 0xff
.L80080638:
/* 81238 80080638 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8123C 8008063C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 81240 80080640 8FB20018 */  lw         $s2, 0x18($sp)
/* 81244 80080644 8FB10014 */  lw         $s1, 0x14($sp)
/* 81248 80080648 8FB00010 */  lw         $s0, 0x10($sp)
/* 8124C 8008064C 03E00008 */  jr         $ra
/* 81250 80080650 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80080654
/* 81254 80080654 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 81258 80080658 30A500FF */  andi       $a1, $a1, 0xff
/* 8125C 8008065C 00052880 */  sll        $a1, $a1, 2
/* 81260 80080660 00852021 */  addu       $a0, $a0, $a1
/* 81264 80080664 AFBF0020 */  sw         $ra, 0x20($sp)
/* 81268 80080668 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8126C 8008066C AFB20018 */  sw         $s2, 0x18($sp)
/* 81270 80080670 AFB10014 */  sw         $s1, 0x14($sp)
/* 81274 80080674 AFB00010 */  sw         $s0, 0x10($sp)
/* 81278 80080678 8C930000 */  lw         $s3, ($a0)
/* 8127C 8008067C 1260002A */  beqz       $s3, .L80080728
/* 81280 80080680 00001021 */   addu      $v0, $zero, $zero
/* 81284 80080684 8E64001C */  lw         $a0, 0x1c($s3)
/* 81288 80080688 0C020F67 */  jal        getModdedSkill
/* 8128C 8008068C 24050004 */   addiu     $a1, $zero, 4
/* 81290 80080690 00002821 */  addu       $a1, $zero, $zero
/* 81294 80080694 8E640018 */  lw         $a0, 0x18($s3)
/* 81298 80080698 0C02128F */  jal        getModdedStat
/* 8129C 8008069C 00409021 */   addu      $s2, $v0, $zero
/* 812A0 800806A0 00021080 */  sll        $v0, $v0, 2
/* 812A4 800806A4 00121880 */  sll        $v1, $s2, 2
/* 812A8 800806A8 00721821 */  addu       $v1, $v1, $s2
/* 812AC 800806AC 00031840 */  sll        $v1, $v1, 1
/* 812B0 800806B0 00431021 */  addu       $v0, $v0, $v1
/* 812B4 800806B4 3051FFFF */  andi       $s1, $v0, 0xffff
/* 812B8 800806B8 24040001 */  addiu      $a0, $zero, 1
/* 812BC 800806BC 0C002D03 */  jal        RollD
/* 812C0 800806C0 24050064 */   addiu     $a1, $zero, 0x64
/* 812C4 800806C4 00408021 */  addu       $s0, $v0, $zero
/* 812C8 800806C8 0211102B */  sltu       $v0, $s0, $s1
/* 812CC 800806CC 10400015 */  beqz       $v0, .L80080724
/* 812D0 800806D0 02302023 */   subu      $a0, $s1, $s0
/* 812D4 800806D4 00042400 */  sll        $a0, $a0, 0x10
/* 812D8 800806D8 0C002D20 */  jal        some_skillcheck_calc
/* 812DC 800806DC 00042403 */   sra       $a0, $a0, 0x10
/* 812E0 800806E0 00408821 */  addu       $s1, $v0, $zero
/* 812E4 800806E4 2402000A */  addiu      $v0, $zero, 0xa
/* 812E8 800806E8 00521023 */  subu       $v0, $v0, $s2
/* 812EC 800806EC 58400001 */  blezl      $v0, .L800806F4
/* 812F0 800806F0 24020001 */   addiu     $v0, $zero, 1
.L800806F4:
/* 812F4 800806F4 3050FFFF */  andi       $s0, $v0, 0xffff
/* 812F8 800806F8 8E640018 */  lw         $a0, 0x18($s3)
/* 812FC 800806FC 0C02128F */  jal        getModdedStat
/* 81300 80080700 24050005 */   addiu     $a1, $zero, 5
/* 81304 80080704 0050102A */  slt        $v0, $v0, $s0
/* 81308 80080708 14400007 */  bnez       $v0, .L80080728
/* 8130C 8008070C 00001021 */   addu      $v0, $zero, $zero
/* 81310 80080710 02602021 */  addu       $a0, $s3, $zero
/* 81314 80080714 0C01DF28 */  jal        damage_func
/* 81318 80080718 02002821 */   addu      $a1, $s0, $zero
/* 8131C 8008071C 080201CA */  j          .L80080728
/* 81320 80080720 322200FF */   andi      $v0, $s1, 0xff
.L80080724:
/* 81324 80080724 00001021 */  addu       $v0, $zero, $zero
.L80080728:
/* 81328 80080728 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8132C 8008072C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 81330 80080730 8FB20018 */  lw         $s2, 0x18($sp)
/* 81334 80080734 8FB10014 */  lw         $s1, 0x14($sp)
/* 81338 80080738 8FB00010 */  lw         $s0, 0x10($sp)
/* 8133C 8008073C 03E00008 */  jr         $ra
/* 81340 80080740 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_mechanic_int_stam
/* 81344 80080744 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 81348 80080748 30A500FF */  andi       $a1, $a1, 0xff
/* 8134C 8008074C 00052880 */  sll        $a1, $a1, 2
/* 81350 80080750 00852021 */  addu       $a0, $a0, $a1
/* 81354 80080754 AFBF0020 */  sw         $ra, 0x20($sp)
/* 81358 80080758 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8135C 8008075C AFB20018 */  sw         $s2, 0x18($sp)
/* 81360 80080760 AFB10014 */  sw         $s1, 0x14($sp)
/* 81364 80080764 AFB00010 */  sw         $s0, 0x10($sp)
/* 81368 80080768 8C930000 */  lw         $s3, ($a0)
/* 8136C 8008076C 1260002A */  beqz       $s3, .L80080818
/* 81370 80080770 00001021 */   addu      $v0, $zero, $zero
/* 81374 80080774 8E64001C */  lw         $a0, 0x1c($s3)
/* 81378 80080778 0C020F67 */  jal        getModdedSkill
/* 8137C 8008077C 24050004 */   addiu     $a1, $zero, 4
/* 81380 80080780 00002821 */  addu       $a1, $zero, $zero
/* 81384 80080784 8E640018 */  lw         $a0, 0x18($s3)
/* 81388 80080788 0C02128F */  jal        getModdedStat
/* 8138C 8008078C 00409021 */   addu      $s2, $v0, $zero
/* 81390 80080790 00021080 */  sll        $v0, $v0, 2
/* 81394 80080794 00121880 */  sll        $v1, $s2, 2
/* 81398 80080798 00721821 */  addu       $v1, $v1, $s2
/* 8139C 8008079C 00031840 */  sll        $v1, $v1, 1
/* 813A0 800807A0 00431021 */  addu       $v0, $v0, $v1
/* 813A4 800807A4 3051FFFF */  andi       $s1, $v0, 0xffff
/* 813A8 800807A8 24040001 */  addiu      $a0, $zero, 1
/* 813AC 800807AC 0C002D03 */  jal        RollD
/* 813B0 800807B0 24050064 */   addiu     $a1, $zero, 0x64
/* 813B4 800807B4 00408021 */  addu       $s0, $v0, $zero
/* 813B8 800807B8 0211102B */  sltu       $v0, $s0, $s1
/* 813BC 800807BC 10400015 */  beqz       $v0, .L80080814
/* 813C0 800807C0 02302023 */   subu      $a0, $s1, $s0
/* 813C4 800807C4 00042400 */  sll        $a0, $a0, 0x10
/* 813C8 800807C8 0C002D20 */  jal        some_skillcheck_calc
/* 813CC 800807CC 00042403 */   sra       $a0, $a0, 0x10
/* 813D0 800807D0 00408821 */  addu       $s1, $v0, $zero
/* 813D4 800807D4 2402000A */  addiu      $v0, $zero, 0xa
/* 813D8 800807D8 00521023 */  subu       $v0, $v0, $s2
/* 813DC 800807DC 58400001 */  blezl      $v0, .L800807E4
/* 813E0 800807E0 24020001 */   addiu     $v0, $zero, 1
.L800807E4:
/* 813E4 800807E4 3050FFFF */  andi       $s0, $v0, 0xffff
/* 813E8 800807E8 8E640018 */  lw         $a0, 0x18($s3)
/* 813EC 800807EC 0C02128F */  jal        getModdedStat
/* 813F0 800807F0 24050005 */   addiu     $a1, $zero, 5
/* 813F4 800807F4 0050102A */  slt        $v0, $v0, $s0
/* 813F8 800807F8 14400007 */  bnez       $v0, .L80080818
/* 813FC 800807FC 00001021 */   addu      $v0, $zero, $zero
/* 81400 80080800 02602021 */  addu       $a0, $s3, $zero
/* 81404 80080804 0C01DF28 */  jal        damage_func
/* 81408 80080808 02002821 */   addu      $a1, $s0, $zero
/* 8140C 8008080C 08020206 */  j          .L80080818
/* 81410 80080810 322200FF */   andi      $v0, $s1, 0xff
.L80080814:
/* 81414 80080814 00001021 */  addu       $v0, $zero, $zero
.L80080818:
/* 81418 80080818 8FBF0020 */  lw         $ra, 0x20($sp)
/* 8141C 8008081C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 81420 80080820 8FB20018 */  lw         $s2, 0x18($sp)
/* 81424 80080824 8FB10014 */  lw         $s1, 0x14($sp)
/* 81428 80080828 8FB00010 */  lw         $s0, 0x10($sp)
/* 8142C 8008082C 03E00008 */  jr         $ra
/* 81430 80080830 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_int_theif
/* 81434 80080834 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 81438 80080838 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8143C 8008083C 00809821 */  addu       $s3, $a0, $zero
/* 81440 80080840 AFB20018 */  sw         $s2, 0x18($sp)
/* 81444 80080844 00009021 */  addu       $s2, $zero, $zero
/* 81448 80080848 AFB10014 */  sw         $s1, 0x14($sp)
/* 8144C 8008084C 00008821 */  addu       $s1, $zero, $zero
/* 81450 80080850 AFBF0020 */  sw         $ra, 0x20($sp)
/* 81454 80080854 AFB00010 */  sw         $s0, 0x10($sp)
/* 81458 80080858 00118080 */  sll        $s0, $s1, 2
.L8008085C:
/* 8145C 8008085C 02708021 */  addu       $s0, $s3, $s0
/* 81460 80080860 8E020000 */  lw         $v0, ($s0)
/* 81464 80080864 8C440018 */  lw         $a0, 0x18($v0)
/* 81468 80080868 0C02128F */  jal        getModdedStat
/* 8146C 8008086C 00002821 */   addu      $a1, $zero, $zero
/* 81470 80080870 8E030000 */  lw         $v1, ($s0)
/* 81474 80080874 24050008 */  addiu      $a1, $zero, 8
/* 81478 80080878 8C64001C */  lw         $a0, 0x1c($v1)
/* 8147C 8008087C 0C020F67 */  jal        getModdedSkill
/* 81480 80080880 00408021 */   addu      $s0, $v0, $zero
/* 81484 80080884 00102040 */  sll        $a0, $s0, 1
/* 81488 80080888 00902021 */  addu       $a0, $a0, $s0
/* 8148C 8008088C 00021880 */  sll        $v1, $v0, 2
/* 81490 80080890 00621821 */  addu       $v1, $v1, $v0
/* 81494 80080894 00031840 */  sll        $v1, $v1, 1
/* 81498 80080898 00832021 */  addu       $a0, $a0, $v1
/* 8149C 8008089C 00042400 */  sll        $a0, $a0, 0x10
/* 814A0 800808A0 00042403 */  sra        $a0, $a0, 0x10
/* 814A4 800808A4 0244102A */  slt        $v0, $s2, $a0
/* 814A8 800808A8 54400001 */  bnel       $v0, $zero, .L800808B0
/* 814AC 800808AC 00809021 */   addu      $s2, $a0, $zero
.L800808B0:
/* 814B0 800808B0 26220001 */  addiu      $v0, $s1, 1
/* 814B4 800808B4 305100FF */  andi       $s1, $v0, 0xff
/* 814B8 800808B8 2E230004 */  sltiu      $v1, $s1, 4
/* 814BC 800808BC 1460FFE7 */  bnez       $v1, .L8008085C
/* 814C0 800808C0 00118080 */   sll       $s0, $s1, 2
/* 814C4 800808C4 24040001 */  addiu      $a0, $zero, 1
/* 814C8 800808C8 0C002D03 */  jal        RollD
/* 814CC 800808CC 24050064 */   addiu     $a1, $zero, 0x64
/* 814D0 800808D0 00402021 */  addu       $a0, $v0, $zero
/* 814D4 800808D4 0092102A */  slt        $v0, $a0, $s2
/* 814D8 800808D8 54400003 */  bnel       $v0, $zero, .L800808E8
/* 814DC 800808DC 02442023 */   subu      $a0, $s2, $a0
/* 814E0 800808E0 0802023E */  j          .L800808F8
/* 814E4 800808E4 00001021 */   addu      $v0, $zero, $zero
.L800808E8:
/* 814E8 800808E8 00042400 */  sll        $a0, $a0, 0x10
/* 814EC 800808EC 0C002D20 */  jal        some_skillcheck_calc
/* 814F0 800808F0 00042403 */   sra       $a0, $a0, 0x10
/* 814F4 800808F4 304200FF */  andi       $v0, $v0, 0xff
.L800808F8:
/* 814F8 800808F8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 814FC 800808FC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 81500 80080900 8FB20018 */  lw         $s2, 0x18($sp)
/* 81504 80080904 8FB10014 */  lw         $s1, 0x14($sp)
/* 81508 80080908 8FB00010 */  lw         $s0, 0x10($sp)
/* 8150C 8008090C 03E00008 */  jr         $ra
/* 81510 80080910 27BD0028 */   addiu     $sp, $sp, 0x28

glabel skillcheck_troubador
/* 81514 80080914 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 81518 80080918 AFB20018 */  sw         $s2, 0x18($sp)
/* 8151C 8008091C 24120004 */  addiu      $s2, $zero, 4
/* 81520 80080920 AFB3001C */  sw         $s3, 0x1c($sp)
/* 81524 80080924 00009821 */  addu       $s3, $zero, $zero
/* 81528 80080928 AFB10014 */  sw         $s1, 0x14($sp)
/* 8152C 8008092C 00008821 */  addu       $s1, $zero, $zero
/* 81530 80080930 AFB40020 */  sw         $s4, 0x20($sp)
/* 81534 80080934 0080A021 */  addu       $s4, $a0, $zero
/* 81538 80080938 AFB00010 */  sw         $s0, 0x10($sp)
/* 8153C 8008093C 02808021 */  addu       $s0, $s4, $zero
/* 81540 80080940 AFBF0024 */  sw         $ra, 0x24($sp)
.L80080944:
/* 81544 80080944 8E020000 */  lw         $v0, ($s0)
/* 81548 80080948 5040000B */  beql       $v0, $zero, .L80080978
/* 8154C 8008094C 26310001 */   addiu     $s1, $s1, 1
/* 81550 80080950 8C44001C */  lw         $a0, 0x1c($v0)
/* 81554 80080954 0C020F67 */  jal        getModdedSkill
/* 81558 80080958 24050009 */   addiu     $a1, $zero, 9
/* 8155C 8008095C 304300FF */  andi       $v1, $v0, 0xff
/* 81560 80080960 0073102A */  slt        $v0, $v1, $s3
/* 81564 80080964 54400004 */  bnel       $v0, $zero, .L80080978
/* 81568 80080968 26310001 */   addiu     $s1, $s1, 1
/* 8156C 8008096C 00609821 */  addu       $s3, $v1, $zero
/* 81570 80080970 323200FF */  andi       $s2, $s1, 0xff
/* 81574 80080974 26310001 */  addiu      $s1, $s1, 1
.L80080978:
/* 81578 80080978 2E220004 */  sltiu      $v0, $s1, 4
/* 8157C 8008097C 1440FFF1 */  bnez       $v0, .L80080944
/* 81580 80080980 26100004 */   addiu     $s0, $s0, 4
/* 81584 80080984 24020004 */  addiu      $v0, $zero, 4
/* 81588 80080988 1242001C */  beq        $s2, $v0, .L800809FC
/* 8158C 8008098C 00001021 */   addu      $v0, $zero, $zero
/* 81590 80080990 1260001B */  beqz       $s3, .L80080A00
/* 81594 80080994 8FBF0024 */   lw        $ra, 0x24($sp)
/* 81598 80080998 00121080 */  sll        $v0, $s2, 2
/* 8159C 8008099C 02821021 */  addu       $v0, $s4, $v0
/* 815A0 800809A0 8C420000 */  lw         $v0, ($v0)
/* 815A4 800809A4 50400016 */  beql       $v0, $zero, .L80080A00
/* 815A8 800809A8 00001021 */   addu      $v0, $zero, $zero
/* 815AC 800809AC 8C440018 */  lw         $a0, 0x18($v0)
/* 815B0 800809B0 0C02128F */  jal        getModdedStat
/* 815B4 800809B4 24050002 */   addiu     $a1, $zero, 2
/* 815B8 800809B8 24040001 */  addiu      $a0, $zero, 1
/* 815BC 800809BC 24050064 */  addiu      $a1, $zero, 0x64
/* 815C0 800809C0 00021840 */  sll        $v1, $v0, 1
/* 815C4 800809C4 00621821 */  addu       $v1, $v1, $v0
/* 815C8 800809C8 02631821 */  addu       $v1, $s3, $v1
/* 815CC 800809CC 0C002D03 */  jal        RollD
/* 815D0 800809D0 3070FFFF */   andi      $s0, $v1, 0xffff
/* 815D4 800809D4 00401821 */  addu       $v1, $v0, $zero
/* 815D8 800809D8 0070102B */  sltu       $v0, $v1, $s0
/* 815DC 800809DC 10400006 */  beqz       $v0, .L800809F8
/* 815E0 800809E0 02032023 */   subu      $a0, $s0, $v1
/* 815E4 800809E4 00042400 */  sll        $a0, $a0, 0x10
/* 815E8 800809E8 0C002D20 */  jal        some_skillcheck_calc
/* 815EC 800809EC 00042403 */   sra       $a0, $a0, 0x10
/* 815F0 800809F0 0802027F */  j          .L800809FC
/* 815F4 800809F4 304200FF */   andi      $v0, $v0, 0xff
.L800809F8:
/* 815F8 800809F8 00001021 */  addu       $v0, $zero, $zero
.L800809FC:
/* 815FC 800809FC 8FBF0024 */  lw         $ra, 0x24($sp)
.L80080A00:
/* 81600 80080A00 8FB40020 */  lw         $s4, 0x20($sp)
/* 81604 80080A04 8FB3001C */  lw         $s3, 0x1c($sp)
/* 81608 80080A08 8FB20018 */  lw         $s2, 0x18($sp)
/* 8160C 80080A0C 8FB10014 */  lw         $s1, 0x14($sp)
/* 81610 80080A10 8FB00010 */  lw         $s0, 0x10($sp)
/* 81614 80080A14 03E00008 */  jr         $ra
/* 81618 80080A18 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_warrior_int_stam
/* 8161C 80080A1C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 81620 80080A20 30A500FF */  andi       $a1, $a1, 0xff
/* 81624 80080A24 00052880 */  sll        $a1, $a1, 2
/* 81628 80080A28 00852021 */  addu       $a0, $a0, $a1
/* 8162C 80080A2C AFBF0018 */  sw         $ra, 0x18($sp)
/* 81630 80080A30 AFB10014 */  sw         $s1, 0x14($sp)
/* 81634 80080A34 AFB00010 */  sw         $s0, 0x10($sp)
/* 81638 80080A38 8C910000 */  lw         $s1, ($a0)
/* 8163C 80080A3C 1220001E */  beqz       $s1, .L80080AB8
/* 81640 80080A40 00001021 */   addu      $v0, $zero, $zero
/* 81644 80080A44 8E240018 */  lw         $a0, 0x18($s1)
/* 81648 80080A48 0C02128F */  jal        getModdedStat
/* 8164C 80080A4C 00002821 */   addu      $a1, $zero, $zero
/* 81650 80080A50 2405000A */  addiu      $a1, $zero, 0xa
/* 81654 80080A54 8E24001C */  lw         $a0, 0x1c($s1)
/* 81658 80080A58 0C020F67 */  jal        getModdedSkill
/* 8165C 80080A5C 00408021 */   addu      $s0, $v0, $zero
/* 81660 80080A60 24050005 */  addiu      $a1, $zero, 5
/* 81664 80080A64 8E240018 */  lw         $a0, 0x18($s1)
/* 81668 80080A68 0C02128F */  jal        getModdedStat
/* 8166C 80080A6C 00408821 */   addu      $s1, $v0, $zero
/* 81670 80080A70 24040001 */  addiu      $a0, $zero, 1
/* 81674 80080A74 24050064 */  addiu      $a1, $zero, 0x64
/* 81678 80080A78 001118C0 */  sll        $v1, $s1, 3
/* 8167C 80080A7C 00711823 */  subu       $v1, $v1, $s1
/* 81680 80080A80 02038021 */  addu       $s0, $s0, $v1
/* 81684 80080A84 02028021 */  addu       $s0, $s0, $v0
/* 81688 80080A88 0C002D03 */  jal        RollD
/* 8168C 80080A8C 3210FFFF */   andi      $s0, $s0, 0xffff
/* 81690 80080A90 00402021 */  addu       $a0, $v0, $zero
/* 81694 80080A94 0090102B */  sltu       $v0, $a0, $s0
/* 81698 80080A98 54400003 */  bnel       $v0, $zero, .L80080AA8
/* 8169C 80080A9C 02042023 */   subu      $a0, $s0, $a0
/* 816A0 80080AA0 080202AE */  j          .L80080AB8
/* 816A4 80080AA4 00001021 */   addu      $v0, $zero, $zero
.L80080AA8:
/* 816A8 80080AA8 00042400 */  sll        $a0, $a0, 0x10
/* 816AC 80080AAC 0C002D20 */  jal        some_skillcheck_calc
/* 816B0 80080AB0 00042403 */   sra       $a0, $a0, 0x10
/* 816B4 80080AB4 304200FF */  andi       $v0, $v0, 0xff
.L80080AB8:
/* 816B8 80080AB8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 816BC 80080ABC 8FB10014 */  lw         $s1, 0x14($sp)
/* 816C0 80080AC0 8FB00010 */  lw         $s0, 0x10($sp)
/* 816C4 80080AC4 03E00008 */  jr         $ra
/* 816C8 80080AC8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80080ACC
/* 816CC 80080ACC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 816D0 80080AD0 AFB00010 */  sw         $s0, 0x10($sp)
/* 816D4 80080AD4 00A08021 */  addu       $s0, $a1, $zero
/* 816D8 80080AD8 3C02800E */  lui        $v0, %hi(widget_handler_pointer)
/* 816DC 80080ADC 8C447EAC */  lw         $a0, %lo(widget_handler_pointer)($v0)
/* 816E0 80080AE0 3C03800F */  lui        $v1, %hi(D_800ED504)
/* 816E4 80080AE4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 816E8 80080AE8 0C02DCB3 */  jal        func_800B72CC
/* 816EC 80080AEC AC60D504 */   sw        $zero, %lo(D_800ED504)($v1)
/* 816F0 80080AF0 12000006 */  beqz       $s0, .L80080B0C
/* 816F4 80080AF4 24050003 */   addiu     $a1, $zero, 3
/* 816F8 80080AF8 8E020078 */  lw         $v0, 0x78($s0)
/* 816FC 80080AFC 84440008 */  lh         $a0, 8($v0)
/* 81700 80080B00 8C43000C */  lw         $v1, 0xc($v0)
/* 81704 80080B04 0060F809 */  jalr       $v1
/* 81708 80080B08 02042021 */   addu      $a0, $s0, $a0
.L80080B0C:
/* 8170C 80080B0C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 81710 80080B10 8FB00010 */  lw         $s0, 0x10($sp)
/* 81714 80080B14 00001021 */  addu       $v0, $zero, $zero
/* 81718 80080B18 03E00008 */  jr         $ra
/* 8171C 80080B1C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80080B20
/* 81720 80080B20 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 81724 80080B24 00802821 */  addu       $a1, $a0, $zero
/* 81728 80080B28 3C02800E */  lui        $v0, %hi(screenFadeMode_switch)
/* 8172C 80080B2C 904468E8 */  lbu        $a0, %lo(screenFadeMode_switch)($v0)
/* 81730 80080B30 24030002 */  addiu      $v1, $zero, 2
/* 81734 80080B34 14830009 */  bne        $a0, $v1, .L80080B5C
/* 81738 80080B38 AFBF0098 */   sw        $ra, 0x98($sp)
/* 8173C 80080B3C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 81740 80080B40 8C44F760 */  lw         $a0, %lo(combatPointer)($v0)
/* 81744 80080B44 10800022 */  beqz       $a0, .L80080BD0
/* 81748 80080B48 8FBF0098 */   lw        $ra, 0x98($sp)
/* 8174C 80080B4C 0C019DE8 */  jal        copy_string_to_combat_textbox
/* 81750 80080B50 00003021 */   addu      $a2, $zero, $zero
/* 81754 80080B54 080202F4 */  j          .L80080BD0
/* 81758 80080B58 8FBF0098 */   lw        $ra, 0x98($sp)
.L80080B5C:
/* 8175C 80080B5C 00A02021 */  addu       $a0, $a1, $zero
/* 81760 80080B60 24050096 */  addiu      $a1, $zero, 0x96
/* 81764 80080B64 27A70018 */  addiu      $a3, $sp, 0x18
/* 81768 80080B68 00E03021 */  addu       $a2, $a3, $zero
/* 8176C 80080B6C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 81770 80080B70 240300FF */  addiu      $v1, $zero, 0xff
/* 81774 80080B74 A3A20018 */  sb         $v0, 0x18($sp)
/* 81778 80080B78 A0E20001 */  sb         $v0, 1($a3)
/* 8177C 80080B7C A0E20002 */  sb         $v0, 2($a3)
/* 81780 80080B80 24020032 */  addiu      $v0, $zero, 0x32
/* 81784 80080B84 A0E30003 */  sb         $v1, 3($a3)
/* 81788 80080B88 24030096 */  addiu      $v1, $zero, 0x96
/* 8178C 80080B8C A3A20058 */  sb         $v0, 0x58($sp)
/* 81790 80080B90 A3A20059 */  sb         $v0, 0x59($sp)
/* 81794 80080B94 A3A2005A */  sb         $v0, 0x5a($sp)
/* 81798 80080B98 24020001 */  addiu      $v0, $zero, 1
/* 8179C 80080B9C 27A70058 */  addiu      $a3, $sp, 0x58
/* 817A0 80080BA0 A3A3005B */  sb         $v1, 0x5b($sp)
/* 817A4 80080BA4 0C0131E1 */  jal        some_textbox_func
/* 817A8 80080BA8 AFA20010 */   sw        $v0, 0x10($sp)
/* 817AC 80080BAC 3C038008 */  lui        $v1, %hi(func_80080ACC)
/* 817B0 80080BB0 24630ACC */  addiu      $v1, $v1, %lo(func_80080ACC)
/* 817B4 80080BB4 AC430018 */  sw         $v1, 0x18($v0)
/* 817B8 80080BB8 AC43001C */  sw         $v1, 0x1c($v0)
/* 817BC 80080BBC 3C03800F */  lui        $v1, %hi(D_800ED504)
/* 817C0 80080BC0 AC400034 */  sw         $zero, 0x34($v0)
/* 817C4 80080BC4 AC400030 */  sw         $zero, 0x30($v0)
/* 817C8 80080BC8 AC62D504 */  sw         $v0, %lo(D_800ED504)($v1)
/* 817CC 80080BCC 8FBF0098 */  lw         $ra, 0x98($sp)
.L80080BD0:
/* 817D0 80080BD0 03E00008 */  jr         $ra
/* 817D4 80080BD4 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel healing_func
/* 817D8 80080BD8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 817DC 80080BDC 30A500FF */  andi       $a1, $a1, 0xff
/* 817E0 80080BE0 30C600FF */  andi       $a2, $a2, 0xff
/* 817E4 80080BE4 00052880 */  sll        $a1, $a1, 2
/* 817E8 80080BE8 00852821 */  addu       $a1, $a0, $a1
/* 817EC 80080BEC 00063080 */  sll        $a2, $a2, 2
/* 817F0 80080BF0 00862021 */  addu       $a0, $a0, $a2
/* 817F4 80080BF4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 817F8 80080BF8 AFB30024 */  sw         $s3, 0x24($sp)
/* 817FC 80080BFC AFB20020 */  sw         $s2, 0x20($sp)
/* 81800 80080C00 AFB1001C */  sw         $s1, 0x1c($sp)
/* 81804 80080C04 AFB00018 */  sw         $s0, 0x18($sp)
/* 81808 80080C08 8CB20000 */  lw         $s2, ($a1)
/* 8180C 80080C0C 12400003 */  beqz       $s2, .L80080C1C
/* 81810 80080C10 8C910000 */   lw        $s1, ($a0)
/* 81814 80080C14 16200005 */  bnez       $s1, .L80080C2C
/* 81818 80080C18 00000000 */   nop
.L80080C1C:
/* 8181C 80080C1C 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 81820 80080C20 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 81824 80080C24 0802034E */  j          .L80080D38
/* 81828 80080C28 8C6206D0 */   lw        $v0, 0x6d0($v1)
.L80080C2C:
/* 8182C 80080C2C 0C01DED7 */  jal        getHPCurrent
/* 81830 80080C30 02202021 */   addu      $a0, $s1, $zero
/* 81834 80080C34 02202021 */  addu       $a0, $s1, $zero
/* 81838 80080C38 0C01DEBD */  jal        getHPMax
/* 8183C 80080C3C 00409821 */   addu      $s3, $v0, $zero
/* 81840 80080C40 3042FFFF */  andi       $v0, $v0, 0xffff
/* 81844 80080C44 16620007 */  bne        $s3, $v0, .L80080C64
/* 81848 80080C48 3C02800E */   lui       $v0, 0x800e
/* 8184C 80080C4C 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 81850 80080C50 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 81854 80080C54 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81858 80080C58 8E260004 */  lw         $a2, 4($s1)
/* 8185C 80080C5C 0802034B */  j          .L80080D2C
/* 81860 80080C60 8C4506DC */   lw        $a1, 0x6dc($v0)
.L80080C64:
/* 81864 80080C64 244468A8 */  addiu      $a0, $v0, 0x68a8
/* 81868 80080C68 90830040 */  lbu        $v1, 0x40($a0)
/* 8186C 80080C6C 24020002 */  addiu      $v0, $zero, 2
/* 81870 80080C70 54620008 */  bnel       $v1, $v0, .L80080C94
/* 81874 80080C74 8E44001C */   lw        $a0, 0x1c($s2)
/* 81878 80080C78 90831440 */  lbu        $v1, 0x1440($a0)
/* 8187C 80080C7C 240200FF */  addiu      $v0, $zero, 0xff
/* 81880 80080C80 50620004 */  beql       $v1, $v0, .L80080C94
/* 81884 80080C84 8E44001C */   lw        $a0, 0x1c($s2)
/* 81888 80080C88 8C83204C */  lw         $v1, 0x204c($a0)
/* 8188C 80080C8C 0802034E */  j          .L80080D38
/* 81890 80080C90 8C6206D4 */   lw        $v0, 0x6d4($v1)
.L80080C94:
/* 81894 80080C94 0C020F67 */  jal        getModdedSkill
/* 81898 80080C98 24050002 */   addiu     $a1, $zero, 2
/* 8189C 80080C9C 24050005 */  addiu      $a1, $zero, 5
/* 818A0 80080CA0 8E440018 */  lw         $a0, 0x18($s2)
/* 818A4 80080CA4 0C02128F */  jal        getModdedStat
/* 818A8 80080CA8 00408021 */   addu      $s0, $v0, $zero
/* 818AC 80080CAC 28420003 */  slti       $v0, $v0, 3
/* 818B0 80080CB0 5440001A */  bnel       $v0, $zero, .L80080D1C
/* 818B4 80080CB4 3C10800F */   lui       $s0, 0x800f
/* 818B8 80080CB8 02402021 */  addu       $a0, $s2, $zero
/* 818BC 80080CBC 0C01DF28 */  jal        damage_func
/* 818C0 80080CC0 24050003 */   addiu     $a1, $zero, 3
/* 818C4 80080CC4 02202021 */  addu       $a0, $s1, $zero
/* 818C8 80080CC8 00102840 */  sll        $a1, $s0, 1
/* 818CC 80080CCC 24A50005 */  addiu      $a1, $a1, 5
/* 818D0 80080CD0 0C01DFC1 */  jal        addHP
/* 818D4 80080CD4 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 818D8 80080CD8 0C01DED7 */  jal        getHPCurrent
/* 818DC 80080CDC 02202021 */   addu      $a0, $s1, $zero
/* 818E0 80080CE0 00531023 */  subu       $v0, $v0, $s3
/* 818E4 80080CE4 00021400 */  sll        $v0, $v0, 0x10
/* 818E8 80080CE8 00021403 */  sra        $v0, $v0, 0x10
/* 818EC 80080CEC 1840000B */  blez       $v0, .L80080D1C
/* 818F0 80080CF0 3C10800F */   lui       $s0, %hi(gGlobalsText)
/* 818F4 80080CF4 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 818F8 80080CF8 AFA20010 */  sw         $v0, 0x10($sp)
/* 818FC 80080CFC 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81900 80080D00 8E460004 */  lw         $a2, 4($s2)
/* 81904 80080D04 8E270004 */  lw         $a3, 4($s1)
/* 81908 80080D08 8C4506E0 */  lw         $a1, 0x6e0($v0)
/* 8190C 80080D0C 0C0333AC */  jal        sprintf
/* 81910 80080D10 02002021 */   addu      $a0, $s0, $zero
/* 81914 80080D14 0802034E */  j          .L80080D38
/* 81918 80080D18 02001021 */   addu      $v0, $s0, $zero
.L80080D1C:
/* 8191C 80080D1C 26108920 */  addiu      $s0, $s0, -0x76e0
/* 81920 80080D20 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81924 80080D24 8E460004 */  lw         $a2, 4($s2)
/* 81928 80080D28 8C4506D8 */  lw         $a1, 0x6d8($v0)
.L80080D2C:
/* 8192C 80080D2C 0C0333AC */  jal        sprintf
/* 81930 80080D30 02002021 */   addu      $a0, $s0, $zero
/* 81934 80080D34 02001021 */  addu       $v0, $s0, $zero
.L80080D38:
/* 81938 80080D38 8FBF0028 */  lw         $ra, 0x28($sp)
/* 8193C 80080D3C 8FB30024 */  lw         $s3, 0x24($sp)
/* 81940 80080D40 8FB20020 */  lw         $s2, 0x20($sp)
/* 81944 80080D44 8FB1001C */  lw         $s1, 0x1c($sp)
/* 81948 80080D48 8FB00018 */  lw         $s0, 0x18($sp)
/* 8194C 80080D4C 03E00008 */  jr         $ra
/* 81950 80080D50 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80080D54
/* 81954 80080D54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 81958 80080D58 30A500FF */  andi       $a1, $a1, 0xff
/* 8195C 80080D5C AFBF0010 */  sw         $ra, 0x10($sp)
/* 81960 80080D60 0C0202F6 */  jal        healing_func
/* 81964 80080D64 30C600FF */   andi      $a2, $a2, 0xff
/* 81968 80080D68 0C0202C8 */  jal        func_80080B20
/* 8196C 80080D6C 00402021 */   addu      $a0, $v0, $zero
/* 81970 80080D70 8FBF0010 */  lw         $ra, 0x10($sp)
/* 81974 80080D74 03E00008 */  jr         $ra
/* 81978 80080D78 27BD0018 */   addiu     $sp, $sp, 0x18

glabel herb_func
/* 8197C 80080D7C 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 81980 80080D80 8C437D74 */  lw         $v1, %lo(bigAssMenu)($v0)
/* 81984 80080D84 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 81988 80080D88 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8198C 80080D8C AFB00010 */  sw         $s0, 0x10($sp)
/* 81990 80080D90 8C640040 */  lw         $a0, 0x40($v1)
/* 81994 80080D94 24060001 */  addiu      $a2, $zero, 1
/* 81998 80080D98 8C820004 */  lw         $v0, 4($a0)
/* 8199C 80080D9C 240700FF */  addiu      $a3, $zero, 0xff
/* 819A0 80080DA0 8C430088 */  lw         $v1, 0x88($v0)
/* 819A4 80080DA4 3C02800F */  lui        $v0, %hi(itemID_array+0x3E)
/* 819A8 80080DA8 8C700094 */  lw         $s0, 0x94($v1)
/* 819AC 80080DAC 9445153E */  lhu        $a1, %lo(itemID_array+0x3E)($v0)
/* 819B0 80080DB0 0C00F419 */  jal        func_8003D064
/* 819B4 80080DB4 02002021 */   addu      $a0, $s0, $zero
/* 819B8 80080DB8 0C00F590 */  jal        func_8003D640
/* 819BC 80080DBC 02002021 */   addu      $a0, $s0, $zero
/* 819C0 80080DC0 8E030078 */  lw         $v1, 0x78($s0)
/* 819C4 80080DC4 84640028 */  lh         $a0, 0x28($v1)
/* 819C8 80080DC8 8C62002C */  lw         $v0, 0x2c($v1)
/* 819CC 80080DCC 0040F809 */  jalr       $v0
/* 819D0 80080DD0 02042021 */   addu      $a0, $s0, $a0
/* 819D4 80080DD4 0C00BFCC */  jal        func_8002FF30
/* 819D8 80080DD8 8E040080 */   lw        $a0, 0x80($s0)
/* 819DC 80080DDC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 819E0 80080DE0 8FB00010 */  lw         $s0, 0x10($sp)
/* 819E4 80080DE4 03E00008 */  jr         $ra
/* 819E8 80080DE8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel party_healing_func
/* 819EC 80080DEC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 819F0 80080DF0 AFB40028 */  sw         $s4, 0x28($sp)
/* 819F4 80080DF4 0080A021 */  addu       $s4, $a0, $zero
/* 819F8 80080DF8 30A500FF */  andi       $a1, $a1, 0xff
/* 819FC 80080DFC 00052880 */  sll        $a1, $a1, 2
/* 81A00 80080E00 02852821 */  addu       $a1, $s4, $a1
/* 81A04 80080E04 AFBF0034 */  sw         $ra, 0x34($sp)
/* 81A08 80080E08 AFB60030 */  sw         $s6, 0x30($sp)
/* 81A0C 80080E0C AFB5002C */  sw         $s5, 0x2c($sp)
/* 81A10 80080E10 AFB30024 */  sw         $s3, 0x24($sp)
/* 81A14 80080E14 AFB20020 */  sw         $s2, 0x20($sp)
/* 81A18 80080E18 AFB1001C */  sw         $s1, 0x1c($sp)
/* 81A1C 80080E1C AFB00018 */  sw         $s0, 0x18($sp)
/* 81A20 80080E20 8CB10000 */  lw         $s1, ($a1)
/* 81A24 80080E24 12200006 */  beqz       $s1, .L80080E40
/* 81A28 80080E28 30C200FF */   andi      $v0, $a2, 0xff
/* 81A2C 80080E2C 00021080 */  sll        $v0, $v0, 2
/* 81A30 80080E30 02821021 */  addu       $v0, $s4, $v0
/* 81A34 80080E34 8C520000 */  lw         $s2, ($v0)
/* 81A38 80080E38 56400005 */  bnel       $s2, $zero, .L80080E50
/* 81A3C 80080E3C 8E24001C */   lw        $a0, 0x1c($s1)
.L80080E40:
/* 81A40 80080E40 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 81A44 80080E44 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 81A48 80080E48 08020408 */  j          .L80081020
/* 81A4C 80080E4C 8C6206D0 */   lw        $v0, 0x6d0($v1)
.L80080E50:
/* 81A50 80080E50 0C020F67 */  jal        getModdedSkill
/* 81A54 80080E54 24050002 */   addiu     $a1, $zero, 2
/* 81A58 80080E58 00408021 */  addu       $s0, $v0, $zero
/* 81A5C 80080E5C 24020005 */  addiu      $v0, $zero, 5
/* 81A60 80080E60 00501023 */  subu       $v0, $v0, $s0
/* 81A64 80080E64 58400001 */  blezl      $v0, .L80080E6C
/* 81A68 80080E68 24020001 */   addiu     $v0, $zero, 1
.L80080E6C:
/* 81A6C 80080E6C 00021400 */  sll        $v0, $v0, 0x10
/* 81A70 80080E70 00029C03 */  sra        $s3, $v0, 0x10
/* 81A74 80080E74 0C01DED7 */  jal        getHPCurrent
/* 81A78 80080E78 02402021 */   addu      $a0, $s2, $zero
/* 81A7C 80080E7C 0040A821 */  addu       $s5, $v0, $zero
/* 81A80 80080E80 0C01DEBD */  jal        getHPMax
/* 81A84 80080E84 02402021 */   addu      $a0, $s2, $zero
/* 81A88 80080E88 16A2000A */  bne        $s5, $v0, .L80080EB4
/* 81A8C 80080E8C 24060001 */   addiu     $a2, $zero, 1
/* 81A90 80080E90 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 81A94 80080E94 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 81A98 80080E98 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81A9C 80080E9C 8E460004 */  lw         $a2, 4($s2)
/* 81AA0 80080EA0 8C4506DC */  lw         $a1, 0x6dc($v0)
.L80080EA4:
/* 81AA4 80080EA4 0C0333AC */  jal        sprintf
/* 81AA8 80080EA8 02002021 */   addu      $a0, $s0, $zero
/* 81AAC 80080EAC 08020406 */  j          .L80081018
/* 81AB0 80080EB0 00000000 */   nop
.L80080EB4:
/* 81AB4 80080EB4 8E870010 */  lw         $a3, 0x10($s4)
/* 81AB8 80080EB8 3C02800F */  lui        $v0, %hi(itemID_array+0x3E)
/* 81ABC 80080EBC 8CE30000 */  lw         $v1, ($a3)
/* 81AC0 80080EC0 9445153E */  lhu        $a1, %lo(itemID_array+0x3E)($v0)
/* 81AC4 80080EC4 84640038 */  lh         $a0, 0x38($v1)
/* 81AC8 80080EC8 8C62003C */  lw         $v0, 0x3c($v1)
/* 81ACC 80080ECC 0040F809 */  jalr       $v0
/* 81AD0 80080ED0 00E42021 */   addu      $a0, $a3, $a0
/* 81AD4 80080ED4 1040000C */  beqz       $v0, .L80080F08
/* 81AD8 80080ED8 3C02800F */   lui       $v0, %hi(combatPointer)
/* 81ADC 80080EDC 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 81AE0 80080EE0 54600004 */  bnel       $v1, $zero, .L80080EF4
/* 81AE4 80080EE4 8E240018 */   lw        $a0, 0x18($s1)
/* 81AE8 80080EE8 0C02035F */  jal        herb_func
/* 81AEC 80080EEC 00000000 */   nop
/* 81AF0 80080EF0 8E240018 */  lw         $a0, 0x18($s1)
.L80080EF4:
/* 81AF4 80080EF4 0C02128F */  jal        getModdedStat
/* 81AF8 80080EF8 24050005 */   addiu     $a1, $zero, 5
/* 81AFC 80080EFC 0053102A */  slt        $v0, $v0, $s3
/* 81B00 80080F00 10400007 */  beqz       $v0, .L80080F20
/* 81B04 80080F04 3C02800E */   lui       $v0, 0x800e
.L80080F08:
/* 81B08 80080F08 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 81B0C 80080F0C 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 81B10 80080F10 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81B14 80080F14 8E260004 */  lw         $a2, 4($s1)
/* 81B18 80080F18 080203A9 */  j          .L80080EA4
/* 81B1C 80080F1C 8C4506D8 */   lw        $a1, 0x6d8($v0)
.L80080F20:
/* 81B20 80080F20 244468A8 */  addiu      $a0, $v0, 0x68a8
/* 81B24 80080F24 90830040 */  lbu        $v1, 0x40($a0)
/* 81B28 80080F28 24020002 */  addiu      $v0, $zero, 2
/* 81B2C 80080F2C 54620008 */  bnel       $v1, $v0, .L80080F50
/* 81B30 80080F30 02202021 */   addu      $a0, $s1, $zero
/* 81B34 80080F34 90831440 */  lbu        $v1, 0x1440($a0)
/* 81B38 80080F38 240200FF */  addiu      $v0, $zero, 0xff
/* 81B3C 80080F3C 50620004 */  beql       $v1, $v0, .L80080F50
/* 81B40 80080F40 02202021 */   addu      $a0, $s1, $zero
/* 81B44 80080F44 8C83204C */  lw         $v1, 0x204c($a0)
/* 81B48 80080F48 08020408 */  j          .L80081020
/* 81B4C 80080F4C 8C6206D4 */   lw        $v0, 0x6d4($v1)
.L80080F50:
/* 81B50 80080F50 0C01DF28 */  jal        damage_func
/* 81B54 80080F54 3265FFFF */   andi      $a1, $s3, 0xffff
/* 81B58 80080F58 8E240018 */  lw         $a0, 0x18($s1)
/* 81B5C 80080F5C 0C02128F */  jal        getModdedStat
/* 81B60 80080F60 00002821 */   addu      $a1, $zero, $zero
/* 81B64 80080F64 00021080 */  sll        $v0, $v0, 2
/* 81B68 80080F68 00101840 */  sll        $v1, $s0, 1
/* 81B6C 80080F6C 00701821 */  addu       $v1, $v1, $s0
/* 81B70 80080F70 00031880 */  sll        $v1, $v1, 2
/* 81B74 80080F74 00701823 */  subu       $v1, $v1, $s0
/* 81B78 80080F78 00431021 */  addu       $v0, $v0, $v1
/* 81B7C 80080F7C 00021400 */  sll        $v0, $v0, 0x10
/* 81B80 80080F80 00029C03 */  sra        $s3, $v0, 0x10
/* 81B84 80080F84 24040001 */  addiu      $a0, $zero, 1
/* 81B88 80080F88 0C002D03 */  jal        RollD
/* 81B8C 80080F8C 24050064 */   addiu     $a1, $zero, 0x64
/* 81B90 80080F90 3C03800F */  lui        $v1, %hi(gGlobalsText)
/* 81B94 80080F94 24748920 */  addiu      $s4, $v1, %lo(gGlobalsText)
/* 81B98 80080F98 02802021 */  addu       $a0, $s4, $zero
/* 81B9C 80080F9C 2696DF88 */  addiu      $s6, $s4, -0x2078
/* 81BA0 80080FA0 8EC3204C */  lw         $v1, 0x204c($s6)
/* 81BA4 80080FA4 8E260004 */  lw         $a2, 4($s1)
/* 81BA8 80080FA8 8C6506D8 */  lw         $a1, 0x6d8($v1)
/* 81BAC 80080FAC 0C0333AC */  jal        sprintf
/* 81BB0 80080FB0 00408021 */   addu      $s0, $v0, $zero
/* 81BB4 80080FB4 0213182A */  slt        $v1, $s0, $s3
/* 81BB8 80080FB8 10600017 */  beqz       $v1, .L80081018
/* 81BBC 80080FBC 00000000 */   nop
/* 81BC0 80080FC0 02702023 */  subu       $a0, $s3, $s0
/* 81BC4 80080FC4 00042400 */  sll        $a0, $a0, 0x10
/* 81BC8 80080FC8 0C002D20 */  jal        some_skillcheck_calc
/* 81BCC 80080FCC 00042403 */   sra       $a0, $a0, 0x10
/* 81BD0 80080FD0 02402021 */  addu       $a0, $s2, $zero
/* 81BD4 80080FD4 00021480 */  sll        $v0, $v0, 0x12
/* 81BD8 80080FD8 0C01DFC1 */  jal        addHP
/* 81BDC 80080FDC 00022C02 */   srl       $a1, $v0, 0x10
/* 81BE0 80080FE0 0C01DED7 */  jal        getHPCurrent
/* 81BE4 80080FE4 02402021 */   addu      $a0, $s2, $zero
/* 81BE8 80080FE8 00551023 */  subu       $v0, $v0, $s5
/* 81BEC 80080FEC 00021400 */  sll        $v0, $v0, 0x10
/* 81BF0 80080FF0 0002AC03 */  sra        $s5, $v0, 0x10
/* 81BF4 80080FF4 12A00008 */  beqz       $s5, .L80081018
/* 81BF8 80080FF8 00000000 */   nop
/* 81BFC 80080FFC AFB50010 */  sw         $s5, 0x10($sp)
/* 81C00 80081000 8EC2204C */  lw         $v0, 0x204c($s6)
/* 81C04 80081004 8E260004 */  lw         $a2, 4($s1)
/* 81C08 80081008 8E470004 */  lw         $a3, 4($s2)
/* 81C0C 8008100C 8C4506E0 */  lw         $a1, 0x6e0($v0)
/* 81C10 80081010 0C0333AC */  jal        sprintf
/* 81C14 80081014 02802021 */   addu      $a0, $s4, $zero
.L80081018:
/* 81C18 80081018 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 81C1C 8008101C 24428920 */  addiu      $v0, $v0, %lo(gGlobalsText)
.L80081020:
/* 81C20 80081020 8FBF0034 */  lw         $ra, 0x34($sp)
/* 81C24 80081024 8FB60030 */  lw         $s6, 0x30($sp)
/* 81C28 80081028 8FB5002C */  lw         $s5, 0x2c($sp)
/* 81C2C 8008102C 8FB40028 */  lw         $s4, 0x28($sp)
/* 81C30 80081030 8FB30024 */  lw         $s3, 0x24($sp)
/* 81C34 80081034 8FB20020 */  lw         $s2, 0x20($sp)
/* 81C38 80081038 8FB1001C */  lw         $s1, 0x1c($sp)
/* 81C3C 8008103C 8FB00018 */  lw         $s0, 0x18($sp)
/* 81C40 80081040 03E00008 */  jr         $ra
/* 81C44 80081044 27BD0038 */   addiu     $sp, $sp, 0x38

glabel pass_to_party_healing_func
/* 81C48 80081048 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 81C4C 8008104C 30A500FF */  andi       $a1, $a1, 0xff
/* 81C50 80081050 AFBF0010 */  sw         $ra, 0x10($sp)
/* 81C54 80081054 0C02037B */  jal        party_healing_func
/* 81C58 80081058 30C600FF */   andi      $a2, $a2, 0xff
/* 81C5C 8008105C 0C0202C8 */  jal        func_80080B20
/* 81C60 80081060 00402021 */   addu      $a0, $v0, $zero
/* 81C64 80081064 8FBF0010 */  lw         $ra, 0x10($sp)
/* 81C68 80081068 03E00008 */  jr         $ra
/* 81C6C 8008106C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_healing_func
/* 81C70 80081070 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 81C74 80081074 AFB5002C */  sw         $s5, 0x2c($sp)
/* 81C78 80081078 0080A821 */  addu       $s5, $a0, $zero
/* 81C7C 8008107C 30A500FF */  andi       $a1, $a1, 0xff
/* 81C80 80081080 30C200FF */  andi       $v0, $a2, 0xff
/* 81C84 80081084 00052880 */  sll        $a1, $a1, 2
/* 81C88 80081088 02A52821 */  addu       $a1, $s5, $a1
/* 81C8C 8008108C AFBF0034 */  sw         $ra, 0x34($sp)
/* 81C90 80081090 AFB60030 */  sw         $s6, 0x30($sp)
/* 81C94 80081094 AFB40028 */  sw         $s4, 0x28($sp)
/* 81C98 80081098 AFB30024 */  sw         $s3, 0x24($sp)
/* 81C9C 8008109C AFB20020 */  sw         $s2, 0x20($sp)
/* 81CA0 800810A0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 81CA4 800810A4 AFB00018 */  sw         $s0, 0x18($sp)
/* 81CA8 800810A8 8CB20000 */  lw         $s2, ($a1)
/* 81CAC 800810AC 12400006 */  beqz       $s2, .L800810C8
/* 81CB0 800810B0 30F400FF */   andi      $s4, $a3, 0xff
/* 81CB4 800810B4 00021080 */  sll        $v0, $v0, 2
/* 81CB8 800810B8 02A21021 */  addu       $v0, $s5, $v0
/* 81CBC 800810BC 8C530000 */  lw         $s3, ($v0)
/* 81CC0 800810C0 56600005 */  bnel       $s3, $zero, .L800810D8
/* 81CC4 800810C4 8E640018 */   lw        $a0, 0x18($s3)
.L800810C8:
/* 81CC8 800810C8 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 81CCC 800810CC 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 81CD0 800810D0 080204B4 */  j          .L800812D0
/* 81CD4 800810D4 8C6206D0 */   lw        $v0, 0x6d0($v1)
.L800810D8:
/* 81CD8 800810D8 0C0212E4 */  jal        someStatCheck
/* 81CDC 800810DC 02802821 */   addu      $a1, $s4, $zero
/* 81CE0 800810E0 5440000F */  bnel       $v0, $zero, .L80081120
/* 81CE4 800810E4 8E44001C */   lw        $a0, 0x1c($s2)
/* 81CE8 800810E8 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 81CEC 800810EC 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 81CF0 800810F0 3C03800F */  lui        $v1, %hi(Stat_labels)
/* 81CF4 800810F4 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81CF8 800810F8 8E660004 */  lw         $a2, 4($s3)
/* 81CFC 800810FC 8C641B60 */  lw         $a0, %lo(Stat_labels)($v1)
/* 81D00 80081100 8C450758 */  lw         $a1, 0x758($v0)
/* 81D04 80081104 00141080 */  sll        $v0, $s4, 2
/* 81D08 80081108 00441021 */  addu       $v0, $v0, $a0
/* 81D0C 8008110C 8C470000 */  lw         $a3, ($v0)
/* 81D10 80081110 0C0333AC */  jal        sprintf
/* 81D14 80081114 02002021 */   addu      $a0, $s0, $zero
/* 81D18 80081118 080204B2 */  j          .L800812C8
/* 81D1C 8008111C 00000000 */   nop
.L80081120:
/* 81D20 80081120 0C020F67 */  jal        getModdedSkill
/* 81D24 80081124 24050002 */   addiu     $a1, $zero, 2
/* 81D28 80081128 00408021 */  addu       $s0, $v0, $zero
/* 81D2C 8008112C 2402000F */  addiu      $v0, $zero, 0xf
/* 81D30 80081130 00501023 */  subu       $v0, $v0, $s0
/* 81D34 80081134 04420001 */  bltzl      $v0, .L8008113C
/* 81D38 80081138 00001021 */   addu      $v0, $zero, $zero
.L8008113C:
/* 81D3C 8008113C 00021400 */  sll        $v0, $v0, 0x10
/* 81D40 80081140 00028C03 */  sra        $s1, $v0, 0x10
/* 81D44 80081144 24060001 */  addiu      $a2, $zero, 1
/* 81D48 80081148 8EA70010 */  lw         $a3, 0x10($s5)
/* 81D4C 8008114C 3C02800F */  lui        $v0, %hi(itemID_array+0x3E)
/* 81D50 80081150 8CE30000 */  lw         $v1, ($a3)
/* 81D54 80081154 9445153E */  lhu        $a1, %lo(itemID_array+0x3E)($v0)
/* 81D58 80081158 84640038 */  lh         $a0, 0x38($v1)
/* 81D5C 8008115C 8C62003C */  lw         $v0, 0x3c($v1)
/* 81D60 80081160 0040F809 */  jalr       $v0
/* 81D64 80081164 00E42021 */   addu      $a0, $a3, $a0
/* 81D68 80081168 5040000A */  beql       $v0, $zero, .L80081194
/* 81D6C 8008116C 3C10800F */   lui       $s0, 0x800f
/* 81D70 80081170 0C02035F */  jal        herb_func
/* 81D74 80081174 00000000 */   nop
/* 81D78 80081178 8E440018 */  lw         $a0, 0x18($s2)
/* 81D7C 8008117C 0C02128F */  jal        getModdedStat
/* 81D80 80081180 24050005 */   addiu     $a1, $zero, 5
/* 81D84 80081184 0051102A */  slt        $v0, $v0, $s1
/* 81D88 80081188 1040000A */  beqz       $v0, .L800811B4
/* 81D8C 8008118C 02402021 */   addu      $a0, $s2, $zero
/* 81D90 80081190 3C10800F */  lui        $s0, %hi(gGlobalsText)
.L80081194:
/* 81D94 80081194 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 81D98 80081198 8E02FFD4 */  lw         $v0, -0x2c($s0)
/* 81D9C 8008119C 8E460004 */  lw         $a2, 4($s2)
/* 81DA0 800811A0 8C4506D8 */  lw         $a1, 0x6d8($v0)
/* 81DA4 800811A4 0C0333AC */  jal        sprintf
/* 81DA8 800811A8 02002021 */   addu      $a0, $s0, $zero
/* 81DAC 800811AC 080204B2 */  j          .L800812C8
/* 81DB0 800811B0 00000000 */   nop
.L800811B4:
/* 81DB4 800811B4 0C01DF28 */  jal        damage_func
/* 81DB8 800811B8 3225FFFF */   andi      $a1, $s1, 0xffff
/* 81DBC 800811BC 8E440018 */  lw         $a0, 0x18($s2)
/* 81DC0 800811C0 0C02128F */  jal        getModdedStat
/* 81DC4 800811C4 00002821 */   addu      $a1, $zero, $zero
/* 81DC8 800811C8 00021040 */  sll        $v0, $v0, 1
/* 81DCC 800811CC 00101880 */  sll        $v1, $s0, 2
/* 81DD0 800811D0 00701821 */  addu       $v1, $v1, $s0
/* 81DD4 800811D4 00431021 */  addu       $v0, $v0, $v1
/* 81DD8 800811D8 00021400 */  sll        $v0, $v0, 0x10
/* 81DDC 800811DC 00028C03 */  sra        $s1, $v0, 0x10
/* 81DE0 800811E0 24040001 */  addiu      $a0, $zero, 1
/* 81DE4 800811E4 0C002D03 */  jal        RollD
/* 81DE8 800811E8 24050064 */   addiu     $a1, $zero, 0x64
/* 81DEC 800811EC 3C03800F */  lui        $v1, %hi(gGlobalsText)
/* 81DF0 800811F0 24758920 */  addiu      $s5, $v1, %lo(gGlobalsText)
/* 81DF4 800811F4 02A02021 */  addu       $a0, $s5, $zero
/* 81DF8 800811F8 26B6DF88 */  addiu      $s6, $s5, -0x2078
/* 81DFC 800811FC 8EC3204C */  lw         $v1, 0x204c($s6)
/* 81E00 80081200 8E460004 */  lw         $a2, 4($s2)
/* 81E04 80081204 8C6506D8 */  lw         $a1, 0x6d8($v1)
/* 81E08 80081208 0C0333AC */  jal        sprintf
/* 81E0C 8008120C 00408021 */   addu      $s0, $v0, $zero
/* 81E10 80081210 0211182A */  slt        $v1, $s0, $s1
/* 81E14 80081214 1060002C */  beqz       $v1, .L800812C8
/* 81E18 80081218 00000000 */   nop
/* 81E1C 8008121C 02302023 */  subu       $a0, $s1, $s0
/* 81E20 80081220 00042400 */  sll        $a0, $a0, 0x10
/* 81E24 80081224 0C002D20 */  jal        some_skillcheck_calc
/* 81E28 80081228 00042403 */   sra       $a0, $a0, 0x10
/* 81E2C 8008122C 00021440 */  sll        $v0, $v0, 0x11
/* 81E30 80081230 00028C03 */  sra        $s1, $v0, 0x10
/* 81E34 80081234 8E640018 */  lw         $a0, 0x18($s3)
/* 81E38 80081238 0C02128F */  jal        getModdedStat
/* 81E3C 8008123C 02802821 */   addu      $a1, $s4, $zero
/* 81E40 80081240 00408021 */  addu       $s0, $v0, $zero
/* 81E44 80081244 8E640018 */  lw         $a0, 0x18($s3)
/* 81E48 80081248 0C021284 */  jal        getBaseStat
/* 81E4C 8008124C 02802821 */   addu      $a1, $s4, $zero
/* 81E50 80081250 02111821 */  addu       $v1, $s0, $s1
/* 81E54 80081254 0043102A */  slt        $v0, $v0, $v1
/* 81E58 80081258 50400008 */  beql       $v0, $zero, .L8008127C
/* 81E5C 8008125C 02802821 */   addu      $a1, $s4, $zero
/* 81E60 80081260 8E640018 */  lw         $a0, 0x18($s3)
/* 81E64 80081264 0C021284 */  jal        getBaseStat
/* 81E68 80081268 02802821 */   addu      $a1, $s4, $zero
/* 81E6C 8008126C 00501023 */  subu       $v0, $v0, $s0
/* 81E70 80081270 00021400 */  sll        $v0, $v0, 0x10
/* 81E74 80081274 00028C03 */  sra        $s1, $v0, 0x10
/* 81E78 80081278 02802821 */  addu       $a1, $s4, $zero
.L8008127C:
/* 81E7C 8008127C 8E640018 */  lw         $a0, 0x18($s3)
/* 81E80 80081280 0C02123F */  jal        addModdedStat
/* 81E84 80081284 02203021 */   addu      $a2, $s1, $zero
/* 81E88 80081288 8E640018 */  lw         $a0, 0x18($s3)
/* 81E8C 8008128C 0C02128F */  jal        getModdedStat
/* 81E90 80081290 02802821 */   addu      $a1, $s4, $zero
/* 81E94 80081294 00508023 */  subu       $s0, $v0, $s0
/* 81E98 80081298 1A00000B */  blez       $s0, .L800812C8
/* 81E9C 8008129C 3C03800F */   lui       $v1, %hi(Stat_labels)
/* 81EA0 800812A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 81EA4 800812A4 8EC2204C */  lw         $v0, 0x204c($s6)
/* 81EA8 800812A8 8E660004 */  lw         $a2, 4($s3)
/* 81EAC 800812AC 8C641B60 */  lw         $a0, %lo(Stat_labels)($v1)
/* 81EB0 800812B0 8C4506F8 */  lw         $a1, 0x6f8($v0)
/* 81EB4 800812B4 00141080 */  sll        $v0, $s4, 2
/* 81EB8 800812B8 00441021 */  addu       $v0, $v0, $a0
/* 81EBC 800812BC 8C470000 */  lw         $a3, ($v0)
/* 81EC0 800812C0 0C0333AC */  jal        sprintf
/* 81EC4 800812C4 02A02021 */   addu      $a0, $s5, $zero
.L800812C8:
/* 81EC8 800812C8 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 81ECC 800812CC 24428920 */  addiu      $v0, $v0, %lo(gGlobalsText)
.L800812D0:
/* 81ED0 800812D0 8FBF0034 */  lw         $ra, 0x34($sp)
/* 81ED4 800812D4 8FB60030 */  lw         $s6, 0x30($sp)
/* 81ED8 800812D8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 81EDC 800812DC 8FB40028 */  lw         $s4, 0x28($sp)
/* 81EE0 800812E0 8FB30024 */  lw         $s3, 0x24($sp)
/* 81EE4 800812E4 8FB20020 */  lw         $s2, 0x20($sp)
/* 81EE8 800812E8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 81EEC 800812EC 8FB00018 */  lw         $s0, 0x18($sp)
/* 81EF0 800812F0 03E00008 */  jr         $ra
/* 81EF4 800812F4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel potion_recipie_func_
/* 81EF8 800812F8 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 81EFC 800812FC 8C437D74 */  lw         $v1, %lo(bigAssMenu)($v0)
/* 81F00 80081300 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 81F04 80081304 AFB40028 */  sw         $s4, 0x28($sp)
/* 81F08 80081308 0080A021 */  addu       $s4, $a0, $zero
/* 81F0C 8008130C AFBF0034 */  sw         $ra, 0x34($sp)
/* 81F10 80081310 AFB60030 */  sw         $s6, 0x30($sp)
/* 81F14 80081314 AFB5002C */  sw         $s5, 0x2c($sp)
/* 81F18 80081318 AFB30024 */  sw         $s3, 0x24($sp)
/* 81F1C 8008131C AFB20020 */  sw         $s2, 0x20($sp)
/* 81F20 80081320 AFB1001C */  sw         $s1, 0x1c($sp)
/* 81F24 80081324 AFB00018 */  sw         $s0, 0x18($sp)
/* 81F28 80081328 8C620040 */  lw         $v0, 0x40($v1)
/* 81F2C 8008132C 30D600FF */  andi       $s6, $a2, 0xff
/* 81F30 80081330 8C430004 */  lw         $v1, 4($v0)
/* 81F34 80081334 02C02021 */  addu       $a0, $s6, $zero
/* 81F38 80081338 8C620088 */  lw         $v0, 0x88($v1)
/* 81F3C 8008133C 30B000FF */  andi       $s0, $a1, 0xff
/* 81F40 80081340 0C000EED */  jal        get_potion_recipie
/* 81F44 80081344 8C520094 */   lw        $s2, 0x94($v0)
/* 81F48 80081348 00408821 */  addu       $s1, $v0, $zero
/* 81F4C 8008134C 12200079 */  beqz       $s1, .L80081534
/* 81F50 80081350 02402021 */   addu      $a0, $s2, $zero
/* 81F54 80081354 240700FF */  addiu      $a3, $zero, 0xff
/* 81F58 80081358 3C02800F */  lui        $v0, %hi(itemID_array)
/* 81F5C 8008135C 24531500 */  addiu      $s3, $v0, %lo(itemID_array)
/* 81F60 80081360 00101080 */  sll        $v0, $s0, 2
/* 81F64 80081364 02821021 */  addu       $v0, $s4, $v0
/* 81F68 80081368 9665003C */  lhu        $a1, 0x3c($s3)
/* 81F6C 8008136C 92260001 */  lbu        $a2, 1($s1)
/* 81F70 80081370 0C00F419 */  jal        func_8003D064
/* 81F74 80081374 8C550000 */   lw        $s5, ($v0)
/* 81F78 80081378 02402021 */  addu       $a0, $s2, $zero
/* 81F7C 8008137C 9665003E */  lhu        $a1, 0x3e($s3)
/* 81F80 80081380 92260002 */  lbu        $a2, 2($s1)
/* 81F84 80081384 0C00F419 */  jal        func_8003D064
/* 81F88 80081388 240700FF */   addiu     $a3, $zero, 0xff
/* 81F8C 8008138C 02402021 */  addu       $a0, $s2, $zero
/* 81F90 80081390 96650040 */  lhu        $a1, 0x40($s3)
/* 81F94 80081394 92260003 */  lbu        $a2, 3($s1)
/* 81F98 80081398 0C00F419 */  jal        func_8003D064
/* 81F9C 8008139C 240700FF */   addiu     $a3, $zero, 0xff
/* 81FA0 800813A0 92230001 */  lbu        $v1, 1($s1)
/* 81FA4 800813A4 5060000C */  beql       $v1, $zero, .L800813D8
/* 81FA8 800813A8 92220002 */   lbu       $v0, 2($s1)
/* 81FAC 800813AC 8E870010 */  lw         $a3, 0x10($s4)
/* 81FB0 800813B0 9665003C */  lhu        $a1, 0x3c($s3)
/* 81FB4 800813B4 8CE30000 */  lw         $v1, ($a3)
/* 81FB8 800813B8 92260001 */  lbu        $a2, 1($s1)
/* 81FBC 800813BC 84640038 */  lh         $a0, 0x38($v1)
/* 81FC0 800813C0 8C62003C */  lw         $v0, 0x3c($v1)
/* 81FC4 800813C4 0040F809 */  jalr       $v0
/* 81FC8 800813C8 00E42021 */   addu      $a0, $a3, $a0
/* 81FCC 800813CC 1040005A */  beqz       $v0, .L80081538
/* 81FD0 800813D0 00001021 */   addu      $v0, $zero, $zero
/* 81FD4 800813D4 92220002 */  lbu        $v0, 2($s1)
.L800813D8:
/* 81FD8 800813D8 1040000A */  beqz       $v0, .L80081404
/* 81FDC 800813DC 00403021 */   addu      $a2, $v0, $zero
/* 81FE0 800813E0 8E870010 */  lw         $a3, 0x10($s4)
/* 81FE4 800813E4 8CE30000 */  lw         $v1, ($a3)
/* 81FE8 800813E8 9665003E */  lhu        $a1, 0x3e($s3)
/* 81FEC 800813EC 84640038 */  lh         $a0, 0x38($v1)
/* 81FF0 800813F0 8C62003C */  lw         $v0, 0x3c($v1)
/* 81FF4 800813F4 0040F809 */  jalr       $v0
/* 81FF8 800813F8 00E42021 */   addu      $a0, $a3, $a0
/* 81FFC 800813FC 1040004E */  beqz       $v0, .L80081538
/* 82000 80081400 00001021 */   addu      $v0, $zero, $zero
.L80081404:
/* 82004 80081404 92220003 */  lbu        $v0, 3($s1)
/* 82008 80081408 1040000A */  beqz       $v0, .L80081434
/* 8200C 8008140C 00403021 */   addu      $a2, $v0, $zero
/* 82010 80081410 8E870010 */  lw         $a3, 0x10($s4)
/* 82014 80081414 8CE30000 */  lw         $v1, ($a3)
/* 82018 80081418 96650040 */  lhu        $a1, 0x40($s3)
/* 8201C 8008141C 84640038 */  lh         $a0, 0x38($v1)
/* 82020 80081420 8C62003C */  lw         $v0, 0x3c($v1)
/* 82024 80081424 0040F809 */  jalr       $v0
/* 82028 80081428 00E42021 */   addu      $a0, $a3, $a0
/* 8202C 8008142C 10400042 */  beqz       $v0, .L80081538
/* 82030 80081430 00001021 */   addu      $v0, $zero, $zero
.L80081434:
/* 82034 80081434 8EA4001C */  lw         $a0, 0x1c($s5)
/* 82038 80081438 0C020F67 */  jal        getModdedSkill
/* 8203C 8008143C 00002821 */   addu      $a1, $zero, $zero
/* 82040 80081440 92230004 */  lbu        $v1, 4($s1)
/* 82044 80081444 00408021 */  addu       $s0, $v0, $zero
/* 82048 80081448 0203182A */  slt        $v1, $s0, $v1
/* 8204C 8008144C 1460003A */  bnez       $v1, .L80081538
/* 82050 80081450 00001021 */   addu      $v0, $zero, $zero
/* 82054 80081454 8EA40018 */  lw         $a0, 0x18($s5)
/* 82058 80081458 0C02128F */  jal        getModdedStat
/* 8205C 8008145C 00002821 */   addu      $a1, $zero, $zero
/* 82060 80081460 24040001 */  addiu      $a0, $zero, 1
/* 82064 80081464 24050064 */  addiu      $a1, $zero, 0x64
/* 82068 80081468 00021840 */  sll        $v1, $v0, 1
/* 8206C 8008146C 00621821 */  addu       $v1, $v1, $v0
/* 82070 80081470 00101040 */  sll        $v0, $s0, 1
/* 82074 80081474 00501021 */  addu       $v0, $v0, $s0
/* 82078 80081478 00021040 */  sll        $v0, $v0, 1
/* 8207C 8008147C 00621821 */  addu       $v1, $v1, $v0
/* 82080 80081480 0C002D03 */  jal        RollD
/* 82084 80081484 3070FFFF */   andi      $s0, $v1, 0xffff
/* 82088 80081488 00401821 */  addu       $v1, $v0, $zero
/* 8208C 8008148C 0070102B */  sltu       $v0, $v1, $s0
/* 82090 80081490 10400028 */  beqz       $v0, .L80081534
/* 82094 80081494 02032023 */   subu      $a0, $s0, $v1
/* 82098 80081498 00042400 */  sll        $a0, $a0, 0x10
/* 8209C 8008149C 0C002D20 */  jal        some_skillcheck_calc
/* 820A0 800814A0 00042403 */   sra       $a0, $a0, 0x10
/* 820A4 800814A4 92230006 */  lbu        $v1, 6($s1)
/* 820A8 800814A8 0043102B */  sltu       $v0, $v0, $v1
/* 820AC 800814AC 14400022 */  bnez       $v0, .L80081538
/* 820B0 800814B0 00001021 */   addu      $v0, $zero, $zero
/* 820B4 800814B4 36D01000 */  ori        $s0, $s6, 0x1000
/* 820B8 800814B8 8E870010 */  lw         $a3, 0x10($s4)
/* 820BC 800814BC 02002821 */  addu       $a1, $s0, $zero
/* 820C0 800814C0 8CE30000 */  lw         $v1, ($a3)
/* 820C4 800814C4 24060001 */  addiu      $a2, $zero, 1
/* 820C8 800814C8 84640030 */  lh         $a0, 0x30($v1)
/* 820CC 800814CC 8C620034 */  lw         $v0, 0x34($v1)
/* 820D0 800814D0 0040F809 */  jalr       $v0
/* 820D4 800814D4 00E42021 */   addu      $a0, $a3, $a0
/* 820D8 800814D8 00408821 */  addu       $s1, $v0, $zero
/* 820DC 800814DC 12200013 */  beqz       $s1, .L8008152C
/* 820E0 800814E0 02402021 */   addu      $a0, $s2, $zero
/* 820E4 800814E4 02002821 */  addu       $a1, $s0, $zero
/* 820E8 800814E8 24060001 */  addiu      $a2, $zero, 1
/* 820EC 800814EC 240700FF */  addiu      $a3, $zero, 0xff
/* 820F0 800814F0 3C02800E */  lui        $v0, %hi(D_800E0B20)
/* 820F4 800814F4 24420B20 */  addiu      $v0, $v0, %lo(D_800E0B20)
/* 820F8 800814F8 24030ACB */  addiu      $v1, $zero, 0xacb
/* 820FC 800814FC AFA20010 */  sw         $v0, 0x10($sp)
/* 82100 80081500 0C00F4DE */  jal        SMI_AddItem
/* 82104 80081504 AFA30014 */   sw        $v1, 0x14($sp)
/* 82108 80081508 0C00F590 */  jal        func_8003D640
/* 8210C 8008150C 02402021 */   addu      $a0, $s2, $zero
/* 82110 80081510 8E430078 */  lw         $v1, 0x78($s2)
/* 82114 80081514 84640028 */  lh         $a0, 0x28($v1)
/* 82118 80081518 8C62002C */  lw         $v0, 0x2c($v1)
/* 8211C 8008151C 0040F809 */  jalr       $v0
/* 82120 80081520 02442021 */   addu      $a0, $s2, $a0
/* 82124 80081524 0C00BFCC */  jal        func_8002FF30
/* 82128 80081528 8E440080 */   lw        $a0, 0x80($s2)
.L8008152C:
/* 8212C 8008152C 0802054E */  j          .L80081538
/* 82130 80081530 02201021 */   addu      $v0, $s1, $zero
.L80081534:
/* 82134 80081534 00001021 */  addu       $v0, $zero, $zero
.L80081538:
/* 82138 80081538 8FBF0034 */  lw         $ra, 0x34($sp)
/* 8213C 8008153C 8FB60030 */  lw         $s6, 0x30($sp)
/* 82140 80081540 8FB5002C */  lw         $s5, 0x2c($sp)
/* 82144 80081544 8FB40028 */  lw         $s4, 0x28($sp)
/* 82148 80081548 8FB30024 */  lw         $s3, 0x24($sp)
/* 8214C 8008154C 8FB20020 */  lw         $s2, 0x20($sp)
/* 82150 80081550 8FB1001C */  lw         $s1, 0x1c($sp)
/* 82154 80081554 8FB00018 */  lw         $s0, 0x18($sp)
/* 82158 80081558 03E00008 */  jr         $ra
/* 8215C 8008155C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel lockpicking_func
/* 82160 80081560 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 82164 80081564 AFB10014 */  sw         $s1, 0x14($sp)
/* 82168 80081568 00808821 */  addu       $s1, $a0, $zero
/* 8216C 8008156C AFB00010 */  sw         $s0, 0x10($sp)
/* 82170 80081570 30B000FF */  andi       $s0, $a1, 0xff
/* 82174 80081574 24050008 */  addiu      $a1, $zero, 8
/* 82178 80081578 AFB20018 */  sw         $s2, 0x18($sp)
/* 8217C 8008157C AFBF001C */  sw         $ra, 0x1c($sp)
/* 82180 80081580 0C020724 */  jal        GetMostSkilledMember
/* 82184 80081584 00C09021 */   addu      $s2, $a2, $zero
/* 82188 80081588 00401821 */  addu       $v1, $v0, $zero
/* 8218C 8008158C 240200FF */  addiu      $v0, $zero, 0xff
/* 82190 80081590 14620008 */  bne        $v1, $v0, .L800815B4
/* 82194 80081594 00031080 */   sll       $v0, $v1, 2
/* 82198 80081598 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 8219C 8008159C 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 821A0 800815A0 8C6506FC */  lw         $a1, 0x6fc($v1)
/* 821A4 800815A4 0C02626C */  jal        copy_string
/* 821A8 800815A8 02402021 */   addu      $a0, $s2, $zero
/* 821AC 800815AC 080205C1 */  j          .L80081704
/* 821B0 800815B0 00001021 */   addu      $v0, $zero, $zero
.L800815B4:
/* 821B4 800815B4 02221021 */  addu       $v0, $s1, $v0
/* 821B8 800815B8 2E03000A */  sltiu      $v1, $s0, 0xa
/* 821BC 800815BC 1460000A */  bnez       $v1, .L800815E8
/* 821C0 800815C0 8C510000 */   lw        $s1, ($v0)
/* 821C4 800815C4 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 821C8 800815C8 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 821CC 800815CC 8E270004 */  lw         $a3, 4($s1)
/* 821D0 800815D0 8C65070C */  lw         $a1, 0x70c($v1)
/* 821D4 800815D4 8C660700 */  lw         $a2, 0x700($v1)
/* 821D8 800815D8 0C0333AC */  jal        sprintf
/* 821DC 800815DC 02402021 */   addu      $a0, $s2, $zero
/* 821E0 800815E0 080205C1 */  j          .L80081704
/* 821E4 800815E4 00001021 */   addu      $v0, $zero, $zero
.L800815E8:
/* 821E8 800815E8 8E24001C */  lw         $a0, 0x1c($s1)
/* 821EC 800815EC 0C020F67 */  jal        getModdedSkill
/* 821F0 800815F0 24050008 */   addiu     $a1, $zero, 8
/* 821F4 800815F4 2842000A */  slti       $v0, $v0, 0xa
/* 821F8 800815F8 10400005 */  beqz       $v0, .L80081610
/* 821FC 800815FC 2403000A */   addiu     $v1, $zero, 0xa
/* 82200 80081600 8E24001C */  lw         $a0, 0x1c($s1)
/* 82204 80081604 0C020F67 */  jal        getModdedSkill
/* 82208 80081608 24050008 */   addiu     $a1, $zero, 8
/* 8220C 8008160C 00401821 */  addu       $v1, $v0, $zero
.L80081610:
/* 82210 80081610 2462FFFF */  addiu      $v0, $v1, -1
/* 82214 80081614 0050102A */  slt        $v0, $v0, $s0
/* 82218 80081618 1040001E */  beqz       $v0, .L80081694
/* 8221C 8008161C 02031023 */   subu      $v0, $s0, $v1
/* 82220 80081620 00021600 */  sll        $v0, $v0, 0x18
/* 82224 80081624 00021603 */  sra        $v0, $v0, 0x18
/* 82228 80081628 28430003 */  slti       $v1, $v0, 3
/* 8222C 8008162C 10600007 */  beqz       $v1, .L8008164C
/* 82230 80081630 28420006 */   slti      $v0, $v0, 6
/* 82234 80081634 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 82238 80081638 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 8223C 8008163C 8E270004 */  lw         $a3, 4($s1)
/* 82240 80081640 8C65070C */  lw         $a1, 0x70c($v1)
/* 82244 80081644 08020599 */  j          .L80081664
/* 82248 80081648 8C660704 */   lw        $a2, 0x704($v1)
.L8008164C:
/* 8224C 8008164C 10400009 */  beqz       $v0, .L80081674
/* 82250 80081650 3C02800F */   lui       $v0, %hi(commonstringsmirror)
/* 82254 80081654 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 82258 80081658 8E270004 */  lw         $a3, 4($s1)
/* 8225C 8008165C 8C65070C */  lw         $a1, 0x70c($v1)
/* 82260 80081660 8C660708 */  lw         $a2, 0x708($v1)
.L80081664:
/* 82264 80081664 0C0333AC */  jal        sprintf
/* 82268 80081668 02402021 */   addu      $a0, $s2, $zero
/* 8226C 8008166C 080205C1 */  j          .L80081704
/* 82270 80081670 00001021 */   addu      $v0, $zero, $zero
.L80081674:
/* 82274 80081674 8C4388F4 */  lw         $v1, -0x770c($v0)
/* 82278 80081678 8E270004 */  lw         $a3, 4($s1)
/* 8227C 8008167C 8C65070C */  lw         $a1, 0x70c($v1)
/* 82280 80081680 8C660700 */  lw         $a2, 0x700($v1)
/* 82284 80081684 0C0333AC */  jal        sprintf
/* 82288 80081688 02402021 */   addu      $a0, $s2, $zero
/* 8228C 8008168C 080205C1 */  j          .L80081704
/* 82290 80081690 00001021 */   addu      $v0, $zero, $zero
.L80081694:
/* 82294 80081694 2402000A */  addiu      $v0, $zero, 0xa
/* 82298 80081698 00438023 */  subu       $s0, $v0, $v1
/* 8229C 8008169C 5A000001 */  blezl      $s0, .L800816A4
/* 822A0 800816A0 24100001 */   addiu     $s0, $zero, 1
.L800816A4:
/* 822A4 800816A4 8E240018 */  lw         $a0, 0x18($s1)
/* 822A8 800816A8 0C02128F */  jal        getModdedStat
/* 822AC 800816AC 24050005 */   addiu     $a1, $zero, 5
/* 822B0 800816B0 0050102A */  slt        $v0, $v0, $s0
/* 822B4 800816B4 5440000D */  bnel       $v0, $zero, .L800816EC
/* 822B8 800816B8 3C02800F */   lui       $v0, 0x800f
/* 822BC 800816BC 24050005 */  addiu      $a1, $zero, 5
/* 822C0 800816C0 8E240018 */  lw         $a0, 0x18($s1)
/* 822C4 800816C4 0C02123F */  jal        addModdedStat
/* 822C8 800816C8 00103023 */   negu      $a2, $s0
/* 822CC 800816CC 3C02800F */  lui        $v0, %hi(commonstringsmirror)
/* 822D0 800816D0 8C4388F4 */  lw         $v1, %lo(commonstringsmirror)($v0)
/* 822D4 800816D4 8E260004 */  lw         $a2, 4($s1)
/* 822D8 800816D8 8C650714 */  lw         $a1, 0x714($v1)
/* 822DC 800816DC 0C0333AC */  jal        sprintf
/* 822E0 800816E0 02402021 */   addu      $a0, $s2, $zero
/* 822E4 800816E4 080205C1 */  j          .L80081704
/* 822E8 800816E8 24020001 */   addiu     $v0, $zero, 1
.L800816EC:
/* 822EC 800816EC 8C4388F4 */  lw         $v1, -0x770c($v0)
/* 822F0 800816F0 8E260004 */  lw         $a2, 4($s1)
/* 822F4 800816F4 8C650710 */  lw         $a1, 0x710($v1)
/* 822F8 800816F8 0C0333AC */  jal        sprintf
/* 822FC 800816FC 02402021 */   addu      $a0, $s2, $zero
/* 82300 80081700 00001021 */  addu       $v0, $zero, $zero
.L80081704:
/* 82304 80081704 8FBF001C */  lw         $ra, 0x1c($sp)
/* 82308 80081708 8FB20018 */  lw         $s2, 0x18($sp)
/* 8230C 8008170C 8FB10014 */  lw         $s1, 0x14($sp)
/* 82310 80081710 8FB00010 */  lw         $s0, 0x10($sp)
/* 82314 80081714 03E00008 */  jr         $ra
/* 82318 80081718 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ofunc_mechanic_skill
/* 8231C 8008171C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 82320 80081720 30A500FF */  andi       $a1, $a1, 0xff
/* 82324 80081724 00052880 */  sll        $a1, $a1, 2
/* 82328 80081728 00852021 */  addu       $a0, $a0, $a1
/* 8232C 8008172C AFBF0020 */  sw         $ra, 0x20($sp)
/* 82330 80081730 AFB3001C */  sw         $s3, 0x1c($sp)
/* 82334 80081734 AFB20018 */  sw         $s2, 0x18($sp)
/* 82338 80081738 AFB10014 */  sw         $s1, 0x14($sp)
/* 8233C 8008173C AFB00010 */  sw         $s0, 0x10($sp)
/* 82340 80081740 8C920000 */  lw         $s2, ($a0)
/* 82344 80081744 8E44001C */  lw         $a0, 0x1c($s2)
/* 82348 80081748 0C020F67 */  jal        getModdedSkill
/* 8234C 8008174C 24050004 */   addiu     $a1, $zero, 4
/* 82350 80081750 24050004 */  addiu      $a1, $zero, 4
/* 82354 80081754 8E440018 */  lw         $a0, 0x18($s2)
/* 82358 80081758 0C02128F */  jal        getModdedStat
/* 8235C 8008175C 00408821 */   addu      $s1, $v0, $zero
/* 82360 80081760 24050002 */  addiu      $a1, $zero, 2
/* 82364 80081764 8E440018 */  lw         $a0, 0x18($s2)
/* 82368 80081768 0C02128F */  jal        getModdedStat
/* 8236C 8008176C 00408021 */   addu      $s0, $v0, $zero
/* 82370 80081770 02028021 */  addu       $s0, $s0, $v0
/* 82374 80081774 00108040 */  sll        $s0, $s0, 1
/* 82378 80081778 2610000A */  addiu      $s0, $s0, 0xa
/* 8237C 8008177C 00119840 */  sll        $s3, $s1, 1
/* 82380 80081780 02718821 */  addu       $s1, $s3, $s1
/* 82384 80081784 00118840 */  sll        $s1, $s1, 1
/* 82388 80081788 02118021 */  addu       $s0, $s0, $s1
/* 8238C 8008178C 3211FFFF */  andi       $s1, $s0, 0xffff
/* 82390 80081790 24040001 */  addiu      $a0, $zero, 1
/* 82394 80081794 0C002D03 */  jal        RollD
/* 82398 80081798 24050064 */   addiu     $a1, $zero, 0x64
/* 8239C 8008179C 00408021 */  addu       $s0, $v0, $zero
/* 823A0 800817A0 0211102B */  sltu       $v0, $s0, $s1
/* 823A4 800817A4 10400015 */  beqz       $v0, .L800817FC
/* 823A8 800817A8 02302023 */   subu      $a0, $s1, $s0
/* 823AC 800817AC 00042400 */  sll        $a0, $a0, 0x10
/* 823B0 800817B0 0C002D20 */  jal        some_skillcheck_calc
/* 823B4 800817B4 00042403 */   sra       $a0, $a0, 0x10
/* 823B8 800817B8 00408821 */  addu       $s1, $v0, $zero
/* 823BC 800817BC 24020019 */  addiu      $v0, $zero, 0x19
/* 823C0 800817C0 00531023 */  subu       $v0, $v0, $s3
/* 823C4 800817C4 58400001 */  blezl      $v0, .L800817CC
/* 823C8 800817C8 24020001 */   addiu     $v0, $zero, 1
.L800817CC:
/* 823CC 800817CC 3050FFFF */  andi       $s0, $v0, 0xffff
/* 823D0 800817D0 8E440018 */  lw         $a0, 0x18($s2)
/* 823D4 800817D4 0C02128F */  jal        getModdedStat
/* 823D8 800817D8 24050005 */   addiu     $a1, $zero, 5
/* 823DC 800817DC 0050102A */  slt        $v0, $v0, $s0
/* 823E0 800817E0 14400007 */  bnez       $v0, .L80081800
/* 823E4 800817E4 00001021 */   addu      $v0, $zero, $zero
/* 823E8 800817E8 02402021 */  addu       $a0, $s2, $zero
/* 823EC 800817EC 0C01DF28 */  jal        damage_func
/* 823F0 800817F0 02002821 */   addu      $a1, $s0, $zero
/* 823F4 800817F4 08020600 */  j          .L80081800
/* 823F8 800817F8 322200FF */   andi      $v0, $s1, 0xff
.L800817FC:
/* 823FC 800817FC 00001021 */  addu       $v0, $zero, $zero
.L80081800:
/* 82400 80081800 8FBF0020 */  lw         $ra, 0x20($sp)
/* 82404 80081804 8FB3001C */  lw         $s3, 0x1c($sp)
/* 82408 80081808 8FB20018 */  lw         $s2, 0x18($sp)
/* 8240C 8008180C 8FB10014 */  lw         $s1, 0x14($sp)
/* 82410 80081810 8FB00010 */  lw         $s0, 0x10($sp)
/* 82414 80081814 03E00008 */  jr         $ra
/* 82418 80081818 27BD0028 */   addiu     $sp, $sp, 0x28

glabel ranger_int_float
/* 8241C 8008181C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 82420 80081820 AFB00010 */  sw         $s0, 0x10($sp)
/* 82424 80081824 00808021 */  addu       $s0, $a0, $zero
/* 82428 80081828 AFBF0014 */  sw         $ra, 0x14($sp)
/* 8242C 8008182C F7B40018 */  sdc1       $f20, 0x18($sp)
/* 82430 80081830 0C020724 */  jal        GetMostSkilledMember
/* 82434 80081834 24050006 */   addiu     $a1, $zero, 6
/* 82438 80081838 00401821 */  addu       $v1, $v0, $zero
/* 8243C 8008183C 240200FF */  addiu      $v0, $zero, 0xff
/* 82440 80081840 10620005 */  beq        $v1, $v0, .L80081858
/* 82444 80081844 00031080 */   sll       $v0, $v1, 2
/* 82448 80081848 02021021 */  addu       $v0, $s0, $v0
/* 8244C 8008184C 8C500000 */  lw         $s0, ($v0)
/* 82450 80081850 56000004 */  bnel       $s0, $zero, .L80081864
/* 82454 80081854 8E040018 */   lw        $a0, 0x18($s0)
.L80081858:
/* 82458 80081858 44800000 */  mtc1       $zero, $f0
/* 8245C 8008185C 0802063A */  j          .L800818E8
/* 82460 80081860 8FBF0014 */   lw        $ra, 0x14($sp)
.L80081864:
/* 82464 80081864 0C02128F */  jal        getModdedStat
/* 82468 80081868 00002821 */   addu      $a1, $zero, $zero
/* 8246C 8008186C 24050006 */  addiu      $a1, $zero, 6
/* 82470 80081870 8E04001C */  lw         $a0, 0x1c($s0)
/* 82474 80081874 0C020F67 */  jal        getModdedSkill
/* 82478 80081878 00408021 */   addu      $s0, $v0, $zero
/* 8247C 8008187C 000218C0 */  sll        $v1, $v0, 3
/* 82480 80081880 00621823 */  subu       $v1, $v1, $v0
/* 82484 80081884 02038021 */  addu       $s0, $s0, $v1
/* 82488 80081888 4490A000 */  mtc1       $s0, $f20
/* 8248C 8008188C 4680A520 */  cvt.s.w    $f20, $f20
/* 82490 80081890 24040001 */  addiu      $a0, $zero, 1
/* 82494 80081894 0C002D03 */  jal        RollD
/* 82498 80081898 24050064 */   addiu     $a1, $zero, 0x64
/* 8249C 8008189C 3C01800E */  lui        $at, %hi(D_800E0C34)
/* 824A0 800818A0 C4220C34 */  lwc1       $f2, %lo(D_800E0C34)($at)
/* 824A4 800818A4 44820000 */  mtc1       $v0, $f0
/* 824A8 800818A8 46800020 */  cvt.s.w    $f0, $f0
/* 824AC 800818AC 46020003 */  div.s      $f0, $f0, $f2
/* 824B0 800818B0 4600A502 */  mul.s      $f20, $f20, $f0
/* 824B4 800818B4 3C01800E */  lui        $at, %hi(D_800E0C38)
/* 824B8 800818B8 C4200C38 */  lwc1       $f0, %lo(D_800E0C38)($at)
/* 824BC 800818BC 4614003C */  c.lt.s     $f0, $f20
/* 824C0 800818C0 00000000 */  nop
/* 824C4 800818C4 45010008 */  bc1t       .L800818E8
/* 824C8 800818C8 8FBF0014 */   lw        $ra, 0x14($sp)
/* 824CC 800818CC 44801000 */  mtc1       $zero, $f2
/* 824D0 800818D0 4602A03C */  c.lt.s     $f20, $f2
/* 824D4 800818D4 00000000 */  nop
/* 824D8 800818D8 45010003 */  bc1t       .L800818E8
/* 824DC 800818DC 46001006 */   mov.s     $f0, $f2
/* 824E0 800818E0 4600A006 */  mov.s      $f0, $f20
/* 824E4 800818E4 8FBF0014 */  lw         $ra, 0x14($sp)
.L800818E8:
/* 824E8 800818E8 8FB00010 */  lw         $s0, 0x10($sp)
/* 824EC 800818EC D7B40018 */  ldc1       $f20, 0x18($sp)
/* 824F0 800818F0 03E00008 */  jr         $ra
/* 824F4 800818F4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_mechanic_check
/* 824F8 800818F8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 824FC 800818FC AFB10014 */  sw         $s1, 0x14($sp)
/* 82500 80081900 00808821 */  addu       $s1, $a0, $zero
/* 82504 80081904 AFB00010 */  sw         $s0, 0x10($sp)
/* 82508 80081908 30B000FF */  andi       $s0, $a1, 0xff
/* 8250C 8008190C 24050004 */  addiu      $a1, $zero, 4
/* 82510 80081910 AFBF0018 */  sw         $ra, 0x18($sp)
/* 82514 80081914 0C0206E7 */  jal        mechanic_check
/* 82518 80081918 2406000A */   addiu     $a2, $zero, 0xa
/* 8251C 8008191C 00402821 */  addu       $a1, $v0, $zero
/* 82520 80081920 240200FF */  addiu      $v0, $zero, 0xff
/* 82524 80081924 10A2000C */  beq        $a1, $v0, .L80081958
/* 82528 80081928 00001021 */   addu      $v0, $zero, $zero
/* 8252C 8008192C 0C0201D1 */  jal        check_mechanic_int_stam
/* 82530 80081930 02202021 */   addu      $a0, $s1, $zero
/* 82534 80081934 16000003 */  bnez       $s0, .L80081944
/* 82538 80081938 00000000 */   nop
/* 8253C 8008193C 08020656 */  j          .L80081958
/* 82540 80081940 24020001 */   addiu     $v0, $zero, 1
.L80081944:
/* 82544 80081944 10400003 */  beqz       $v0, .L80081954
/* 82548 80081948 0050102B */   sltu      $v0, $v0, $s0
/* 8254C 8008194C 08020656 */  j          .L80081958
/* 82550 80081950 38420001 */   xori      $v0, $v0, 1
.L80081954:
/* 82554 80081954 00001021 */  addu       $v0, $zero, $zero
.L80081958:
/* 82558 80081958 8FBF0018 */  lw         $ra, 0x18($sp)
/* 8255C 8008195C 8FB10014 */  lw         $s1, 0x14($sp)
/* 82560 80081960 8FB00010 */  lw         $s0, 0x10($sp)
/* 82564 80081964 03E00008 */  jr         $ra
/* 82568 80081968 27BD0020 */   addiu     $sp, $sp, 0x20

glabel Ofunc_Ranger_float
/* 8256C 8008196C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 82570 80081970 AFBF0010 */  sw         $ra, 0x10($sp)
/* 82574 80081974 0C0200D7 */  jal        ofunc_ranger_stam_int
/* 82578 80081978 00000000 */   nop
/* 8257C 8008197C 44820000 */  mtc1       $v0, $f0
/* 82580 80081980 46800020 */  cvt.s.w    $f0, $f0
/* 82584 80081984 3C01800E */  lui        $at, %hi(D_800E0C3C)
/* 82588 80081988 C4220C3C */  lwc1       $f2, %lo(D_800E0C3C)($at)
/* 8258C 8008198C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 82590 80081990 46020003 */  div.s      $f0, $f0, $f2
/* 82594 80081994 03E00008 */  jr         $ra
/* 82598 80081998 27BD0018 */   addiu     $sp, $sp, 0x18

glabel theif_over_B
/* 8259C 8008199C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 825A0 800819A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 825A4 800819A4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 825A8 800819A8 0C02020D */  jal        check_int_theif
/* 825AC 800819AC 30B000FF */   andi      $s0, $a1, 0xff
/* 825B0 800819B0 0050102B */  sltu       $v0, $v0, $s0
/* 825B4 800819B4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 825B8 800819B8 8FB00010 */  lw         $s0, 0x10($sp)
/* 825BC 800819BC 38420001 */  xori       $v0, $v0, 1
/* 825C0 800819C0 03E00008 */  jr         $ra
/* 825C4 800819C4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel appraise_price
/* 825C8 800819C8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 825CC 800819CC AFB50024 */  sw         $s5, 0x24($sp)
/* 825D0 800819D0 00A0A821 */  addu       $s5, $a1, $zero
/* 825D4 800819D4 AFB40020 */  sw         $s4, 0x20($sp)
/* 825D8 800819D8 30D4FFFF */  andi       $s4, $a2, 0xffff
/* 825DC 800819DC AFB20018 */  sw         $s2, 0x18($sp)
/* 825E0 800819E0 00009021 */  addu       $s2, $zero, $zero
/* 825E4 800819E4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 825E8 800819E8 00009821 */  addu       $s3, $zero, $zero
/* 825EC 800819EC AFB10014 */  sw         $s1, 0x14($sp)
/* 825F0 800819F0 00808821 */  addu       $s1, $a0, $zero
/* 825F4 800819F4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 825F8 800819F8 AFB00010 */  sw         $s0, 0x10($sp)
/* 825FC 800819FC F7B40030 */  sdc1       $f20, 0x30($sp)
.L80081A00:
/* 82600 80081A00 8E300000 */  lw         $s0, ($s1)
/* 82604 80081A04 52000011 */  beql       $s0, $zero, .L80081A4C
/* 82608 80081A08 26730001 */   addiu     $s3, $s3, 1
/* 8260C 80081A0C 8E040018 */  lw         $a0, 0x18($s0)
/* 82610 80081A10 0C02128F */  jal        getModdedStat
/* 82614 80081A14 00002821 */   addu      $a1, $zero, $zero
/* 82618 80081A18 24050005 */  addiu      $a1, $zero, 5
/* 8261C 80081A1C 8E04001C */  lw         $a0, 0x1c($s0)
/* 82620 80081A20 0C020F67 */  jal        getModdedSkill
/* 82624 80081A24 00408021 */   addu      $s0, $v0, $zero
/* 82628 80081A28 00021840 */  sll        $v1, $v0, 1
/* 8262C 80081A2C 00621821 */  addu       $v1, $v1, $v0
/* 82630 80081A30 00031840 */  sll        $v1, $v1, 1
/* 82634 80081A34 02038021 */  addu       $s0, $s0, $v1
/* 82638 80081A38 3210FFFF */  andi       $s0, $s0, 0xffff
/* 8263C 80081A3C 0212102B */  sltu       $v0, $s0, $s2
/* 82640 80081A40 50400001 */  beql       $v0, $zero, .L80081A48
/* 82644 80081A44 02009021 */   addu      $s2, $s0, $zero
.L80081A48:
/* 82648 80081A48 26730001 */  addiu      $s3, $s3, 1
.L80081A4C:
/* 8264C 80081A4C 2E620004 */  sltiu      $v0, $s3, 4
/* 82650 80081A50 1440FFEB */  bnez       $v0, .L80081A00
/* 82654 80081A54 26310004 */   addiu     $s1, $s1, 4
/* 82658 80081A58 02520018 */  mult       $s2, $s2
/* 8265C 80081A5C 00001012 */  mflo       $v0
/* 82660 80081A60 3C01800E */  lui        $at, %hi(D_800E0C40)
/* 82664 80081A64 C4200C40 */  lwc1       $f0, %lo(D_800E0C40)($at)
/* 82668 80081A68 44821000 */  mtc1       $v0, $f2
/* 8266C 80081A6C 468010A0 */  cvt.s.w    $f2, $f2
/* 82670 80081A70 46001082 */  mul.s      $f2, $f2, $f0
/* 82674 80081A74 3C01800E */  lui        $at, %hi(D_800E0C44)
/* 82678 80081A78 C4240C44 */  lwc1       $f4, %lo(D_800E0C44)($at)
/* 8267C 80081A7C 44920000 */  mtc1       $s2, $f0
/* 82680 80081A80 46800020 */  cvt.s.w    $f0, $f0
/* 82684 80081A84 46040002 */  mul.s      $f0, $f0, $f4
/* 82688 80081A88 46001080 */  add.s      $f2, $f2, $f0
/* 8268C 80081A8C 3C01800E */  lui        $at, %hi(D_800E0C48)
/* 82690 80081A90 C4240C48 */  lwc1       $f4, %lo(D_800E0C48)($at)
/* 82694 80081A94 46041080 */  add.s      $f2, $f2, $f4
/* 82698 80081A98 3C01800E */  lui        $at, %hi(D_800E0C4C)
/* 8269C 80081A9C C4200C4C */  lwc1       $f0, %lo(D_800E0C4C)($at)
/* 826A0 80081AA0 44802000 */  mtc1       $zero, $f4
/* 826A4 80081AA4 46001503 */  div.s      $f20, $f2, $f0
/* 826A8 80081AA8 4604A03C */  c.lt.s     $f20, $f4
/* 826AC 80081AAC 00000000 */  nop
/* 826B0 80081AB0 45000003 */  bc1f       .L80081AC0
/* 826B4 80081AB4 00000000 */   nop
/* 826B8 80081AB8 080206B6 */  j          .L80081AD8
/* 826BC 80081ABC 46002506 */   mov.s     $f20, $f4
.L80081AC0:
/* 826C0 80081AC0 3C01800E */  lui        $at, %hi(D_800E0C50)
/* 826C4 80081AC4 C4200C50 */  lwc1       $f0, %lo(D_800E0C50)($at)
/* 826C8 80081AC8 4614003C */  c.lt.s     $f0, $f20
/* 826CC 80081ACC 00000000 */  nop
/* 826D0 80081AD0 45030001 */  bc1tl      .L80081AD8
/* 826D4 80081AD4 46000506 */   mov.s     $f20, $f0
.L80081AD8:
/* 826D8 80081AD8 0C01F025 */  jal        GetItemPrice
/* 826DC 80081ADC 02A02021 */   addu      $a0, $s5, $zero
/* 826E0 80081AE0 44820000 */  mtc1       $v0, $f0
/* 826E4 80081AE4 46800020 */  cvt.s.w    $f0, $f0
/* 826E8 80081AE8 46140002 */  mul.s      $f0, $f0, $f20
/* 826EC 80081AEC 3C01800E */  lui        $at, %hi(D_800E0C54)
/* 826F0 80081AF0 C4220C54 */  lwc1       $f2, %lo(D_800E0C54)($at)
/* 826F4 80081AF4 46020002 */  mul.s      $f0, $f0, $f2
/* 826F8 80081AF8 44942000 */  mtc1       $s4, $f4
/* 826FC 80081AFC 46802120 */  cvt.s.w    $f4, $f4
/* 82700 80081B00 44801000 */  mtc1       $zero, $f2
/* 82704 80081B04 46040183 */  div.s      $f6, $f0, $f4
/* 82708 80081B08 4606103C */  c.lt.s     $f2, $f6
/* 8270C 80081B0C 00000000 */  nop
/* 82710 80081B10 45000008 */  bc1f       .L80081B34
/* 82714 80081B14 460030A1 */   cvt.d.s   $f2, $f6
/* 82718 80081B18 3C01800E */  lui        $at, %hi(D_800E0C58)
/* 8271C 80081B1C D4200C58 */  ldc1       $f0, %lo(D_800E0C58)($at)
/* 82720 80081B20 46201080 */  add.d      $f2, $f2, $f0
/* 82724 80081B24 4620100D */  trunc.w.d  $f0, $f2
/* 82728 80081B28 44020000 */  mfc1       $v0, $f0
/* 8272C 80081B2C 080206D4 */  j          .L80081B50
/* 82730 80081B30 304200FF */   andi      $v0, $v0, 0xff
.L80081B34:
/* 82734 80081B34 3C01800E */  lui        $at, %hi(D_800E0C60)
/* 82738 80081B38 D4200C60 */  ldc1       $f0, %lo(D_800E0C60)($at)
/* 8273C 80081B3C 46220001 */  sub.d      $f0, $f0, $f2
/* 82740 80081B40 4620008D */  trunc.w.d  $f2, $f0
/* 82744 80081B44 44021000 */  mfc1       $v0, $f2
/* 82748 80081B48 00021023 */  negu       $v0, $v0
/* 8274C 80081B4C 304200FF */  andi       $v0, $v0, 0xff
.L80081B50:
/* 82750 80081B50 00401821 */  addu       $v1, $v0, $zero
/* 82754 80081B54 2C620007 */  sltiu      $v0, $v1, 7
/* 82758 80081B58 50400001 */  beql       $v0, $zero, .L80081B60
/* 8275C 80081B5C 24030006 */   addiu     $v1, $zero, 6
.L80081B60:
/* 82760 80081B60 3C02800F */  lui        $v0, %hi(price_strings)
/* 82764 80081B64 00031880 */  sll        $v1, $v1, 2
/* 82768 80081B68 8C441AB4 */  lw         $a0, %lo(price_strings)($v0)
/* 8276C 80081B6C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 82770 80081B70 8FB50024 */  lw         $s5, 0x24($sp)
/* 82774 80081B74 8FB40020 */  lw         $s4, 0x20($sp)
/* 82778 80081B78 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8277C 80081B7C 8FB20018 */  lw         $s2, 0x18($sp)
/* 82780 80081B80 8FB10014 */  lw         $s1, 0x14($sp)
/* 82784 80081B84 8FB00010 */  lw         $s0, 0x10($sp)
/* 82788 80081B88 D7B40030 */  ldc1       $f20, 0x30($sp)
/* 8278C 80081B8C 00641821 */  addu       $v1, $v1, $a0
/* 82790 80081B90 8C620000 */  lw         $v0, ($v1)
/* 82794 80081B94 03E00008 */  jr         $ra
/* 82798 80081B98 27BD0038 */   addiu     $sp, $sp, 0x38

glabel mechanic_check
/* 8279C 80081B9C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 827A0 80081BA0 AFBE0030 */  sw         $fp, 0x30($sp)
/* 827A4 80081BA4 0080F021 */  addu       $fp, $a0, $zero
/* 827A8 80081BA8 AFB7002C */  sw         $s7, 0x2c($sp)
/* 827AC 80081BAC 30B700FF */  andi       $s7, $a1, 0xff
/* 827B0 80081BB0 AFB60028 */  sw         $s6, 0x28($sp)
/* 827B4 80081BB4 30D600FF */  andi       $s6, $a2, 0xff
/* 827B8 80081BB8 AFB50024 */  sw         $s5, 0x24($sp)
/* 827BC 80081BBC 241500FF */  addiu      $s5, $zero, 0xff
/* 827C0 80081BC0 AFB40020 */  sw         $s4, 0x20($sp)
/* 827C4 80081BC4 0000A021 */  addu       $s4, $zero, $zero
/* 827C8 80081BC8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 827CC 80081BCC 00009821 */  addu       $s3, $zero, $zero
/* 827D0 80081BD0 AFBF0034 */  sw         $ra, 0x34($sp)
/* 827D4 80081BD4 AFB20018 */  sw         $s2, 0x18($sp)
/* 827D8 80081BD8 AFB10014 */  sw         $s1, 0x14($sp)
/* 827DC 80081BDC AFB00010 */  sw         $s0, 0x10($sp)
/* 827E0 80081BE0 00131080 */  sll        $v0, $s3, 2
.L80081BE4:
/* 827E4 80081BE4 03C29021 */  addu       $s2, $fp, $v0
/* 827E8 80081BE8 8E420000 */  lw         $v0, ($s2)
/* 827EC 80081BEC 50400015 */  beql       $v0, $zero, .L80081C44
/* 827F0 80081BF0 26620001 */   addiu     $v0, $s3, 1
/* 827F4 80081BF4 8C44001C */  lw         $a0, 0x1c($v0)
/* 827F8 80081BF8 0C020F67 */  jal        getModdedSkill
/* 827FC 80081BFC 02E02821 */   addu      $a1, $s7, $zero
/* 82800 80081C00 305000FF */  andi       $s0, $v0, 0xff
/* 82804 80081C04 02D01023 */  subu       $v0, $s6, $s0
/* 82808 80081C08 58400001 */  blezl      $v0, .L80081C10
/* 8280C 80081C0C 24020001 */   addiu     $v0, $zero, 1
.L80081C10:
/* 82810 80081C10 305100FF */  andi       $s1, $v0, 0xff
/* 82814 80081C14 0290102B */  sltu       $v0, $s4, $s0
/* 82818 80081C18 1040000A */  beqz       $v0, .L80081C44
/* 8281C 80081C1C 26620001 */   addiu     $v0, $s3, 1
/* 82820 80081C20 8E420000 */  lw         $v0, ($s2)
/* 82824 80081C24 8C440018 */  lw         $a0, 0x18($v0)
/* 82828 80081C28 0C02128F */  jal        getModdedStat
/* 8282C 80081C2C 24050005 */   addiu     $a1, $zero, 5
/* 82830 80081C30 0051102A */  slt        $v0, $v0, $s1
/* 82834 80081C34 14400003 */  bnez       $v0, .L80081C44
/* 82838 80081C38 26620001 */   addiu     $v0, $s3, 1
/* 8283C 80081C3C 0200A021 */  addu       $s4, $s0, $zero
/* 82840 80081C40 0260A821 */  addu       $s5, $s3, $zero
.L80081C44:
/* 82844 80081C44 305300FF */  andi       $s3, $v0, 0xff
/* 82848 80081C48 2E630004 */  sltiu      $v1, $s3, 4
/* 8284C 80081C4C 1460FFE5 */  bnez       $v1, .L80081BE4
/* 82850 80081C50 00131080 */   sll       $v0, $s3, 2
/* 82854 80081C54 12800002 */  beqz       $s4, .L80081C60
/* 82858 80081C58 240200FF */   addiu     $v0, $zero, 0xff
/* 8285C 80081C5C 02A01021 */  addu       $v0, $s5, $zero
.L80081C60:
/* 82860 80081C60 8FBF0034 */  lw         $ra, 0x34($sp)
/* 82864 80081C64 8FBE0030 */  lw         $fp, 0x30($sp)
/* 82868 80081C68 8FB7002C */  lw         $s7, 0x2c($sp)
/* 8286C 80081C6C 8FB60028 */  lw         $s6, 0x28($sp)
/* 82870 80081C70 8FB50024 */  lw         $s5, 0x24($sp)
/* 82874 80081C74 8FB40020 */  lw         $s4, 0x20($sp)
/* 82878 80081C78 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8287C 80081C7C 8FB20018 */  lw         $s2, 0x18($sp)
/* 82880 80081C80 8FB10014 */  lw         $s1, 0x14($sp)
/* 82884 80081C84 8FB00010 */  lw         $s0, 0x10($sp)
/* 82888 80081C88 03E00008 */  jr         $ra
/* 8288C 80081C8C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel GetMostSkilledMember
/* 82890 80081C90 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 82894 80081C94 AFB40020 */  sw         $s4, 0x20($sp)
/* 82898 80081C98 0080A021 */  addu       $s4, $a0, $zero
/* 8289C 80081C9C AFB3001C */  sw         $s3, 0x1c($sp)
/* 828A0 80081CA0 30B300FF */  andi       $s3, $a1, 0xff
/* 828A4 80081CA4 AFB20018 */  sw         $s2, 0x18($sp)
/* 828A8 80081CA8 241200FF */  addiu      $s2, $zero, 0xff
/* 828AC 80081CAC AFB10014 */  sw         $s1, 0x14($sp)
/* 828B0 80081CB0 00008821 */  addu       $s1, $zero, $zero
/* 828B4 80081CB4 AFB00010 */  sw         $s0, 0x10($sp)
/* 828B8 80081CB8 00008021 */  addu       $s0, $zero, $zero
/* 828BC 80081CBC AFBF0024 */  sw         $ra, 0x24($sp)
/* 828C0 80081CC0 00101080 */  sll        $v0, $s0, 2
.L80081CC4:
/* 828C4 80081CC4 02821021 */  addu       $v0, $s4, $v0
/* 828C8 80081CC8 8C420000 */  lw         $v0, ($v0)
/* 828CC 80081CCC 5040000A */  beql       $v0, $zero, .L80081CF8
/* 828D0 80081CD0 26020001 */   addiu     $v0, $s0, 1
/* 828D4 80081CD4 8C44001C */  lw         $a0, 0x1c($v0)
/* 828D8 80081CD8 0C020F67 */  jal        getModdedSkill
/* 828DC 80081CDC 02602821 */   addu      $a1, $s3, $zero
/* 828E0 80081CE0 304300FF */  andi       $v1, $v0, 0xff
/* 828E4 80081CE4 0071102B */  sltu       $v0, $v1, $s1
/* 828E8 80081CE8 14400003 */  bnez       $v0, .L80081CF8
/* 828EC 80081CEC 26020001 */   addiu     $v0, $s0, 1
/* 828F0 80081CF0 00608821 */  addu       $s1, $v1, $zero
/* 828F4 80081CF4 02009021 */  addu       $s2, $s0, $zero
.L80081CF8:
/* 828F8 80081CF8 305000FF */  andi       $s0, $v0, 0xff
/* 828FC 80081CFC 2E030004 */  sltiu      $v1, $s0, 4
/* 82900 80081D00 1460FFF0 */  bnez       $v1, .L80081CC4
/* 82904 80081D04 00101080 */   sll       $v0, $s0, 2
/* 82908 80081D08 02401021 */  addu       $v0, $s2, $zero
/* 8290C 80081D0C 8FBF0024 */  lw         $ra, 0x24($sp)
/* 82910 80081D10 8FB40020 */  lw         $s4, 0x20($sp)
/* 82914 80081D14 8FB3001C */  lw         $s3, 0x1c($sp)
/* 82918 80081D18 8FB20018 */  lw         $s2, 0x18($sp)
/* 8291C 80081D1C 8FB10014 */  lw         $s1, 0x14($sp)
/* 82920 80081D20 8FB00010 */  lw         $s0, 0x10($sp)
/* 82924 80081D24 03E00008 */  jr         $ra
/* 82928 80081D28 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_ranger_camping_bool
/* 8292C 80081D2C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 82930 80081D30 AFB10014 */  sw         $s1, 0x14($sp)
/* 82934 80081D34 00808821 */  addu       $s1, $a0, $zero
/* 82938 80081D38 2404138C */  addiu      $a0, $zero, 0x138c
/* 8293C 80081D3C AFBF0018 */  sw         $ra, 0x18($sp)
/* 82940 80081D40 0C009168 */  jal        get_event_flag
/* 82944 80081D44 AFB00010 */   sw        $s0, 0x10($sp)
/* 82948 80081D48 14400003 */  bnez       $v0, .L80081D58
/* 8294C 80081D4C 00008021 */   addu      $s0, $zero, $zero
/* 82950 80081D50 08020790 */  j          .L80081E40
/* 82954 80081D54 00001021 */   addu      $v0, $zero, $zero
.L80081D58:
/* 82958 80081D58 02202021 */  addu       $a0, $s1, $zero
/* 8295C 80081D5C 0C020724 */  jal        GetMostSkilledMember
/* 82960 80081D60 24050006 */   addiu     $a1, $zero, 6
/* 82964 80081D64 00401821 */  addu       $v1, $v0, $zero
/* 82968 80081D68 240200FF */  addiu      $v0, $zero, 0xff
/* 8296C 80081D6C 1062000A */  beq        $v1, $v0, .L80081D98
/* 82970 80081D70 00031080 */   sll       $v0, $v1, 2
/* 82974 80081D74 02221021 */  addu       $v0, $s1, $v0
/* 82978 80081D78 8C420000 */  lw         $v0, ($v0)
/* 8297C 80081D7C 10400007 */  beqz       $v0, .L80081D9C
/* 82980 80081D80 02001821 */   addu      $v1, $s0, $zero
/* 82984 80081D84 8C44001C */  lw         $a0, 0x1c($v0)
/* 82988 80081D88 0C020F67 */  jal        getModdedSkill
/* 8298C 80081D8C 24050006 */   addiu     $a1, $zero, 6
/* 82990 80081D90 5C400001 */  bgtzl      $v0, .L80081D98
/* 82994 80081D94 305000FF */   andi      $s0, $v0, 0xff
.L80081D98:
/* 82998 80081D98 02001821 */  addu       $v1, $s0, $zero
.L80081D9C:
/* 8299C 80081D9C 2C62000B */  sltiu      $v0, $v1, 0xb
/* 829A0 80081DA0 50400001 */  beql       $v0, $zero, .L80081DA8
/* 829A4 80081DA4 2403000A */   addiu     $v1, $zero, 0xa
.L80081DA8:
/* 829A8 80081DA8 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 829AC 80081DAC 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* 829B0 80081DB0 0C021380 */  jal        getTerrain
/* 829B4 80081DB4 307000FF */   andi      $s0, $v1, 0xff
/* 829B8 80081DB8 44902000 */  mtc1       $s0, $f4
/* 829BC 80081DBC 46802120 */  cvt.s.w    $f4, $f4
/* 829C0 80081DC0 3C01800E */  lui        $at, %hi(D_800E0C68)
/* 829C4 80081DC4 C4220C68 */  lwc1       $f2, %lo(D_800E0C68)($at)
/* 829C8 80081DC8 3C03800F */  lui        $v1, %hi(camp_float_array)
/* 829CC 80081DCC 46041081 */  sub.s      $f2, $f2, $f4
/* 829D0 80081DD0 3C01800E */  lui        $at, %hi(D_800E0C6C)
/* 829D4 80081DD4 C4200C6C */  lwc1       $f0, %lo(D_800E0C6C)($at)
/* 829D8 80081DD8 24631AB8 */  addiu      $v1, $v1, %lo(camp_float_array)
/* 829DC 80081DDC 46001082 */  mul.s      $f2, $f2, $f0
/* 829E0 80081DE0 00021080 */  sll        $v0, $v0, 2
/* 829E4 80081DE4 00431021 */  addu       $v0, $v0, $v1
/* 829E8 80081DE8 C4400000 */  lwc1       $f0, ($v0)
/* 829EC 80081DEC 46001002 */  mul.s      $f0, $f2, $f0
/* 829F0 80081DF0 3C01800E */  lui        $at, %hi(D_800E0C70)
/* 829F4 80081DF4 C4220C70 */  lwc1       $f2, %lo(D_800E0C70)($at)
/* 829F8 80081DF8 4600103E */  c.le.s     $f2, $f0
/* 829FC 80081DFC 00000000 */  nop
/* 82A00 80081E00 45030005 */  bc1tl      .L80081E18
/* 82A04 80081E04 46020001 */   sub.s     $f0, $f0, $f2
/* 82A08 80081E08 4600008D */  trunc.w.s  $f2, $f0
/* 82A0C 80081E0C 44101000 */  mfc1       $s0, $f2
/* 82A10 80081E10 0802078B */  j          .L80081E2C
/* 82A14 80081E14 24040001 */   addiu     $a0, $zero, 1
.L80081E18:
/* 82A18 80081E18 4600008D */  trunc.w.s  $f2, $f0
/* 82A1C 80081E1C 44101000 */  mfc1       $s0, $f2
/* 82A20 80081E20 3C028000 */  lui        $v0, 0x8000
/* 82A24 80081E24 02028025 */  or         $s0, $s0, $v0
/* 82A28 80081E28 24040001 */  addiu      $a0, $zero, 1
.L80081E2C:
/* 82A2C 80081E2C 24050064 */  addiu      $a1, $zero, 0x64
/* 82A30 80081E30 0C002D03 */  jal        RollD
/* 82A34 80081E34 3210FFFF */   andi      $s0, $s0, 0xffff
/* 82A38 80081E38 0202802B */  sltu       $s0, $s0, $v0
/* 82A3C 80081E3C 3A020001 */  xori       $v0, $s0, 1
.L80081E40:
/* 82A40 80081E40 8FBF0018 */  lw         $ra, 0x18($sp)
/* 82A44 80081E44 8FB10014 */  lw         $s1, 0x14($sp)
/* 82A48 80081E48 8FB00010 */  lw         $s0, 0x10($sp)
/* 82A4C 80081E4C 03E00008 */  jr         $ra
/* 82A50 80081E50 27BD0020 */   addiu     $sp, $sp, 0x20

glabel passto_load_camp_ambush
/* 82A54 80081E54 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 82A58 80081E58 AFBF0010 */  sw         $ra, 0x10($sp)
/* 82A5C 80081E5C 0C003142 */  jal        load_camp_ambush
/* 82A60 80081E60 00000000 */   nop
/* 82A64 80081E64 8FBF0010 */  lw         $ra, 0x10($sp)
/* 82A68 80081E68 03E00008 */  jr         $ra
/* 82A6C 80081E6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_equip_stamMod
/* 82A70 80081E70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 82A74 80081E74 AFB00010 */  sw         $s0, 0x10($sp)
/* 82A78 80081E78 00008021 */  addu       $s0, $zero, $zero
/* 82A7C 80081E7C 3085FFFF */  andi       $a1, $a0, 0xffff
/* 82A80 80081E80 00051202 */  srl        $v0, $a1, 8
/* 82A84 80081E84 2444FFFF */  addiu      $a0, $v0, -1
/* 82A88 80081E88 2C830013 */  sltiu      $v1, $a0, 0x13
/* 82A8C 80081E8C 10600034 */  beqz       $v1, .L80081F60
/* 82A90 80081E90 AFBF0014 */   sw        $ra, 0x14($sp)
/* 82A94 80081E94 3C02800E */  lui        $v0, %hi(D_800E0C78)
/* 82A98 80081E98 24420C78 */  addiu      $v0, $v0, %lo(D_800E0C78)
/* 82A9C 80081E9C 00041880 */  sll        $v1, $a0, 2
/* 82AA0 80081EA0 00621821 */  addu       $v1, $v1, $v0
/* 82AA4 80081EA4 8C640000 */  lw         $a0, ($v1)
/* 82AA8 80081EA8 00800008 */  jr         $a0
/* 82AAC 80081EAC 00000000 */   nop
/* 82AB0 80081EB0 00A02021 */  addu       $a0, $a1, $zero
/* 82AB4 80081EB4 00002821 */  addu       $a1, $zero, $zero
/* 82AB8 80081EB8 0C01D77A */  jal        GetIDIndex
/* 82ABC 80081EBC 00003021 */   addu      $a2, $zero, $zero
/* 82AC0 80081EC0 3C05800F */  lui        $a1, %hi(armour_pointer)
/* 82AC4 80081EC4 00021840 */  sll        $v1, $v0, 1
/* 82AC8 80081EC8 00621821 */  addu       $v1, $v1, $v0
/* 82ACC 80081ECC 00031880 */  sll        $v1, $v1, 2
/* 82AD0 80081ED0 8CA4F7B0 */  lw         $a0, %lo(armour_pointer)($a1)
/* 82AD4 80081ED4 00621821 */  addu       $v1, $v1, $v0
/* 82AD8 80081ED8 080207C3 */  j          .L80081F0C
/* 82ADC 80081EDC 8C820004 */   lw        $v0, 4($a0)
/* 82AE0 80081EE0 00A02021 */  addu       $a0, $a1, $zero
/* 82AE4 80081EE4 00002821 */  addu       $a1, $zero, $zero
/* 82AE8 80081EE8 0C01D77A */  jal        GetIDIndex
/* 82AEC 80081EEC 00003021 */   addu      $a2, $zero, $zero
/* 82AF0 80081EF0 3C05800F */  lui        $a1, %hi(weapon_pointer)
/* 82AF4 80081EF4 00021840 */  sll        $v1, $v0, 1
/* 82AF8 80081EF8 00621821 */  addu       $v1, $v1, $v0
/* 82AFC 80081EFC 00031880 */  sll        $v1, $v1, 2
/* 82B00 80081F00 8CA416F0 */  lw         $a0, %lo(weapon_pointer)($a1)
/* 82B04 80081F04 00621821 */  addu       $v1, $v1, $v0
/* 82B08 80081F08 8C820018 */  lw         $v0, 0x18($a0)
.L80081F0C:
/* 82B0C 80081F0C 00031880 */  sll        $v1, $v1, 2
/* 82B10 80081F10 00431821 */  addu       $v1, $v0, $v1
/* 82B14 80081F14 80640024 */  lb         $a0, 0x24($v1)
/* 82B18 80081F18 24020005 */  addiu      $v0, $zero, 5
/* 82B1C 80081F1C 50820010 */  beql       $a0, $v0, .L80081F60
/* 82B20 80081F20 90700025 */   lbu       $s0, 0x25($v1)
/* 82B24 80081F24 080207D9 */  j          .L80081F64
/* 82B28 80081F28 02001021 */   addu      $v0, $s0, $zero
/* 82B2C 80081F2C 0C01D7C6 */  jal        search_item_array
/* 82B30 80081F30 00A02021 */   addu      $a0, $a1, $zero
/* 82B34 80081F34 3C04800F */  lui        $a0, %hi(item_pointer)
/* 82B38 80081F38 00021840 */  sll        $v1, $v0, 1
/* 82B3C 80081F3C 8C8514F0 */  lw         $a1, %lo(item_pointer)($a0)
/* 82B40 80081F40 00621821 */  addu       $v1, $v1, $v0
/* 82B44 80081F44 8CA20018 */  lw         $v0, 0x18($a1)
/* 82B48 80081F48 00031900 */  sll        $v1, $v1, 4
/* 82B4C 80081F4C 00431821 */  addu       $v1, $v0, $v1
/* 82B50 80081F50 80640021 */  lb         $a0, 0x21($v1)
/* 82B54 80081F54 24020005 */  addiu      $v0, $zero, 5
/* 82B58 80081F58 50820001 */  beql       $a0, $v0, .L80081F60
/* 82B5C 80081F5C 90700022 */   lbu       $s0, 0x22($v1)
.L80081F60:
/* 82B60 80081F60 02001021 */  addu       $v0, $s0, $zero
.L80081F64:
/* 82B64 80081F64 8FBF0014 */  lw         $ra, 0x14($sp)
/* 82B68 80081F68 8FB00010 */  lw         $s0, 0x10($sp)
/* 82B6C 80081F6C 03E00008 */  jr         $ra
/* 82B70 80081F70 27BD0018 */   addiu     $sp, $sp, 0x18

glabel multi_equip_StamMod
/* 82B74 80081F74 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 82B78 80081F78 F7B40018 */  sdc1       $f20, 0x18($sp)
/* 82B7C 80081F7C 4485A000 */  mtc1       $a1, $f20
/* 82B80 80081F80 AFBF0014 */  sw         $ra, 0x14($sp)
/* 82B84 80081F84 1080001A */  beqz       $a0, .L80081FF0
/* 82B88 80081F88 AFB00010 */   sw        $s0, 0x10($sp)
/* 82B8C 80081F8C 8C90000C */  lw         $s0, 0xc($a0)
/* 82B90 80081F90 12000017 */  beqz       $s0, .L80081FF0
/* 82B94 80081F94 24020005 */   addiu     $v0, $zero, 5
/* 82B98 80081F98 92030000 */  lbu        $v1, ($s0)
/* 82B9C 80081F9C 14620015 */  bne        $v1, $v0, .L80081FF4
/* 82BA0 80081FA0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82BA4 80081FA4 0C02079C */  jal        get_equip_stamMod
/* 82BA8 80081FA8 94840000 */   lhu       $a0, ($a0)
/* 82BAC 80081FAC 00402021 */  addu       $a0, $v0, $zero
/* 82BB0 80081FB0 44840000 */  mtc1       $a0, $f0
/* 82BB4 80081FB4 46800020 */  cvt.s.w    $f0, $f0
/* 82BB8 80081FB8 46140002 */  mul.s      $f0, $f0, $f20
/* 82BBC 80081FBC 4600008D */  trunc.w.s  $f2, $f0
/* 82BC0 80081FC0 44021000 */  mfc1       $v0, $f2
/* 82BC4 80081FC4 00021600 */  sll        $v0, $v0, 0x18
/* 82BC8 80081FC8 00022E03 */  sra        $a1, $v0, 0x18
/* 82BCC 80081FCC 82030001 */  lb         $v1, 1($s0)
/* 82BD0 80081FD0 00651821 */  addu       $v1, $v1, $a1
/* 82BD4 80081FD4 0083182A */  slt        $v1, $a0, $v1
/* 82BD8 80081FD8 14600004 */  bnez       $v1, .L80081FEC
/* 82BDC 80081FDC 92020001 */   lbu       $v0, 1($s0)
/* 82BE0 80081FE0 00A21021 */  addu       $v0, $a1, $v0
/* 82BE4 80081FE4 080207FC */  j          .L80081FF0
/* 82BE8 80081FE8 A2020001 */   sb        $v0, 1($s0)
.L80081FEC:
/* 82BEC 80081FEC A2040001 */  sb         $a0, 1($s0)
.L80081FF0:
/* 82BF0 80081FF0 8FBF0014 */  lw         $ra, 0x14($sp)
.L80081FF4:
/* 82BF4 80081FF4 8FB00010 */  lw         $s0, 0x10($sp)
/* 82BF8 80081FF8 D7B40018 */  ldc1       $f20, 0x18($sp)
/* 82BFC 80081FFC 03E00008 */  jr         $ra
/* 82C00 80082000 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_camp_func
/* 82C04 80082004 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 82C08 80082008 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 82C0C 8008200C 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 82C10 80082010 AFB40060 */  sw         $s4, 0x60($sp)
/* 82C14 80082014 0080A021 */  addu       $s4, $a0, $zero
/* 82C18 80082018 AFBF0064 */  sw         $ra, 0x64($sp)
/* 82C1C 8008201C AFB3005C */  sw         $s3, 0x5c($sp)
/* 82C20 80082020 AFB20058 */  sw         $s2, 0x58($sp)
/* 82C24 80082024 AFB10054 */  sw         $s1, 0x54($sp)
/* 82C28 80082028 AFB00050 */  sw         $s0, 0x50($sp)
/* 82C2C 8008202C F7B40068 */  sdc1       $f20, 0x68($sp)
/* 82C30 80082030 94620000 */  lhu        $v0, ($v1)
/* 82C34 80082034 2C420002 */  sltiu      $v0, $v0, 2
/* 82C38 80082038 1440000A */  bnez       $v0, .L80082064
/* 82C3C 8008203C 00A03021 */   addu      $a2, $a1, $zero
/* 82C40 80082040 3C02001A */  lui        $v0, 0x1a
/* 82C44 80082044 94630000 */  lhu        $v1, ($v1)
/* 82C48 80082048 34425E00 */  ori        $v0, $v0, 0x5e00
/* 82C4C 8008204C 0043001A */  div        $zero, $v0, $v1
/* 82C50 80082050 00001012 */  mflo       $v0
/* 82C54 80082054 50600001 */  beql       $v1, $zero, .L8008205C
/* 82C58 80082058 000001CD */   break     0, 7
.L8008205C:
/* 82C5C 8008205C 0802081B */   j         .L8008206C
/* 82C60 80082060 00409821 */   addu      $s3, $v0, $zero
.L80082064:
/* 82C64 80082064 3C13001A */  lui        $s3, 0x1a
/* 82C68 80082068 36735E00 */  ori        $s3, $s3, 0x5e00
.L8008206C:
/* 82C6C 8008206C 00009021 */  addu       $s2, $zero, $zero
/* 82C70 80082070 3C02800E */  lui        $v0, %hi(D_800E0CC4)
/* 82C74 80082074 24430CC4 */  addiu      $v1, $v0, %lo(D_800E0CC4)
/* 82C78 80082078 02808821 */  addu       $s1, $s4, $zero
/* 82C7C 8008207C 8C440CC4 */  lw         $a0, 0xcc4($v0)
/* 82C80 80082080 00061080 */  sll        $v0, $a2, 2
/* 82C84 80082084 8C650004 */  lw         $a1, 4($v1)
/* 82C88 80082088 03A21821 */  addu       $v1, $sp, $v0
/* 82C8C 8008208C AFA40010 */  sw         $a0, 0x10($sp)
/* 82C90 80082090 AFA50014 */  sw         $a1, 0x14($sp)
/* 82C94 80082094 C4740010 */  lwc1       $f20, 0x10($v1)
.L80082098:
/* 82C98 80082098 8E300000 */  lw         $s0, ($s1)
/* 82C9C 8008209C 5200000A */  beql       $s0, $zero, .L800820C8
/* 82CA0 800820A0 26520001 */   addiu     $s2, $s2, 1
/* 82CA4 800820A4 0C01DF1D */  jal        isDead
/* 82CA8 800820A8 02002021 */   addu      $a0, $s0, $zero
/* 82CAC 800820AC 54400006 */  bnel       $v0, $zero, .L800820C8
/* 82CB0 800820B0 26520001 */   addiu     $s2, $s2, 1
/* 82CB4 800820B4 02002021 */  addu       $a0, $s0, $zero
/* 82CB8 800820B8 4405A000 */  mfc1       $a1, $f20
/* 82CBC 800820BC 0C01E94E */  jal        camp_healing
/* 82CC0 800820C0 02603021 */   addu      $a2, $s3, $zero
/* 82CC4 800820C4 26520001 */  addiu      $s2, $s2, 1
.L800820C8:
/* 82CC8 800820C8 2E420004 */  sltiu      $v0, $s2, 4
/* 82CCC 800820CC 1440FFF2 */  bnez       $v0, .L80082098
/* 82CD0 800820D0 26310004 */   addiu     $s1, $s1, 4
/* 82CD4 800820D4 8E850010 */  lw         $a1, 0x10($s4)
/* 82CD8 800820D8 8CA30000 */  lw         $v1, ($a1)
/* 82CDC 800820DC 00009021 */  addu       $s2, $zero, $zero
/* 82CE0 800820E0 84640048 */  lh         $a0, 0x48($v1)
/* 82CE4 800820E4 8C62004C */  lw         $v0, 0x4c($v1)
/* 82CE8 800820E8 0040F809 */  jalr       $v0
/* 82CEC 800820EC 00A42021 */   addu      $a0, $a1, $a0
/* 82CF0 800820F0 00408021 */  addu       $s0, $v0, $zero
/* 82CF4 800820F4 52000010 */  beql       $s0, $zero, .L80082138
/* 82CF8 800820F8 02802021 */   addu      $a0, $s4, $zero
/* 82CFC 800820FC 8E860010 */  lw         $a2, 0x10($s4)
.L80082100:
/* 82D00 80082100 02402821 */  addu       $a1, $s2, $zero
/* 82D04 80082104 8CC30000 */  lw         $v1, ($a2)
/* 82D08 80082108 26520001 */  addiu      $s2, $s2, 1
/* 82D0C 8008210C 84640058 */  lh         $a0, 0x58($v1)
/* 82D10 80082110 8C62005C */  lw         $v0, 0x5c($v1)
/* 82D14 80082114 0040F809 */  jalr       $v0
/* 82D18 80082118 00C42021 */   addu      $a0, $a2, $a0
/* 82D1C 8008211C 4405A000 */  mfc1       $a1, $f20
/* 82D20 80082120 0C0207DD */  jal        multi_equip_StamMod
/* 82D24 80082124 00402021 */   addu      $a0, $v0, $zero
/* 82D28 80082128 0250102B */  sltu       $v0, $s2, $s0
/* 82D2C 8008212C 5440FFF4 */  bnel       $v0, $zero, .L80082100
/* 82D30 80082130 8E860010 */   lw        $a2, 0x10($s4)
/* 82D34 80082134 02802021 */  addu       $a0, $s4, $zero
.L80082138:
/* 82D38 80082138 24050001 */  addiu      $a1, $zero, 1
/* 82D3C 8008213C 0C02086F */  jal        noop_800821bc
/* 82D40 80082140 02603021 */   addu      $a2, $s3, $zero
/* 82D44 80082144 3C02800E */  lui        $v0, 0x800e
/* 82D48 80082148 8FBF0064 */  lw         $ra, 0x64($sp)
/* 82D4C 8008214C 8FB40060 */  lw         $s4, 0x60($sp)
/* 82D50 80082150 8FB3005C */  lw         $s3, 0x5c($sp)
/* 82D54 80082154 8FB20058 */  lw         $s2, 0x58($sp)
/* 82D58 80082158 8FB10054 */  lw         $s1, 0x54($sp)
/* 82D5C 8008215C 8FB00050 */  lw         $s0, 0x50($sp)
/* 82D60 80082160 D7B40068 */  ldc1       $f20, 0x68($sp)
/* 82D64 80082164 244268A8 */  addiu      $v0, $v0, 0x68a8
/* 82D68 80082168 A04013CA */  sb         $zero, 0x13ca($v0)
/* 82D6C 8008216C 03E00008 */  jr         $ra
/* 82D70 80082170 27BD0070 */   addiu     $sp, $sp, 0x70

glabel check_for_camp_ambush
/* 82D74 80082174 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 82D78 80082178 AFB00010 */  sw         $s0, 0x10($sp)
/* 82D7C 8008217C AFBF0014 */  sw         $ra, 0x14($sp)
/* 82D80 80082180 0C02074B */  jal        get_ranger_camping_bool
/* 82D84 80082184 00808021 */   addu      $s0, $a0, $zero
/* 82D88 80082188 14400005 */  bnez       $v0, .L800821A0
/* 82D8C 8008218C 02002021 */   addu      $a0, $s0, $zero
/* 82D90 80082190 0C020801 */  jal        some_camp_func
/* 82D94 80082194 24050001 */   addiu     $a1, $zero, 1
/* 82D98 80082198 0802086B */  j          .L800821AC
/* 82D9C 8008219C 00001021 */   addu      $v0, $zero, $zero
.L800821A0:
/* 82DA0 800821A0 0C020795 */  jal        passto_load_camp_ambush
/* 82DA4 800821A4 02002021 */   addu      $a0, $s0, $zero
/* 82DA8 800821A8 24020001 */  addiu      $v0, $zero, 1
.L800821AC:
/* 82DAC 800821AC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 82DB0 800821B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 82DB4 800821B4 03E00008 */  jr         $ra
/* 82DB8 800821B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel noop_800821bc
/* 82DBC 800821BC 03E00008 */  jr         $ra
/* 82DC0 800821C0 00000000 */   nop

glabel tick_party_movement_vals
/* 82DC4 800821C4 00804021 */  addu       $t0, $a0, $zero
/* 82DC8 800821C8 3C04800F */  lui        $a0, %hi(TerrainPointer)
/* 82DCC 800821CC 8C821BBC */  lw         $v0, %lo(TerrainPointer)($a0)
/* 82DD0 800821D0 94440000 */  lhu        $a0, ($v0)
/* 82DD4 800821D4 00A40018 */  mult       $a1, $a0
/* 82DD8 800821D8 3C06800E */  lui        $a2, %hi(PlayerCharStruct)
/* 82DDC 800821DC 8CC36950 */  lw         $v1, %lo(PlayerCharStruct)($a2)
/* 82DE0 800821E0 24070003 */  addiu      $a3, $zero, 3
/* 82DE4 800821E4 84630014 */  lh         $v1, 0x14($v1)
/* 82DE8 800821E8 00002012 */  mflo       $a0
/* 82DEC 800821EC 1067002C */  beq        $v1, $a3, .L800822A0
/* 82DF0 800821F0 28620004 */   slti      $v0, $v1, 4
/* 82DF4 800821F4 10400005 */  beqz       $v0, .L8008220C
/* 82DF8 800821F8 24020002 */   addiu     $v0, $zero, 2
/* 82DFC 800821FC 10620017 */  beq        $v1, $v0, .L8008225C
/* 82E00 80082200 3C02026D */   lui       $v0, 0x26d
/* 82E04 80082204 03E00008 */  jr         $ra
/* 82E08 80082208 00000000 */   nop
.L8008220C:
/* 82E0C 8008220C 24020019 */  addiu      $v0, $zero, 0x19
/* 82E10 80082210 14620033 */  bne        $v1, $v0, .L800822E0
/* 82E14 80082214 00000000 */   nop
/* 82E18 80082218 8D050018 */  lw         $a1, 0x18($t0)
/* 82E1C 8008221C 3C02E904 */  lui        $v0, 0xe904
/* 82E20 80082220 344252D5 */  ori        $v0, $v0, 0x52d5
/* 82E24 80082224 00A42821 */  addu       $a1, $a1, $a0
/* 82E28 80082228 00A20019 */  multu      $a1, $v0
/* 82E2C 8008222C 00001010 */  mfhi       $v0
/* 82E30 80082230 000213C2 */  srl        $v0, $v0, 0xf
/* 82E34 80082234 00021880 */  sll        $v1, $v0, 2
/* 82E38 80082238 00621821 */  addu       $v1, $v1, $v0
/* 82E3C 8008223C 00032100 */  sll        $a0, $v1, 4
/* 82E40 80082240 00832023 */  subu       $a0, $a0, $v1
/* 82E44 80082244 00041100 */  sll        $v0, $a0, 4
/* 82E48 80082248 00441023 */  subu       $v0, $v0, $a0
/* 82E4C 8008224C 00021140 */  sll        $v0, $v0, 5
/* 82E50 80082250 00A22823 */  subu       $a1, $a1, $v0
/* 82E54 80082254 03E00008 */  jr         $ra
/* 82E58 80082258 AD050018 */   sw        $a1, 0x18($t0)
.L8008225C:
/* 82E5C 8008225C 8D05001C */  lw         $a1, 0x1c($t0)
/* 82E60 80082260 344260DD */  ori        $v0, $v0, 0x60dd
/* 82E64 80082264 00A42821 */  addu       $a1, $a1, $a0
/* 82E68 80082268 00051942 */  srl        $v1, $a1, 5
/* 82E6C 8008226C 00620019 */  multu      $v1, $v0
/* 82E70 80082270 00001810 */  mfhi       $v1
/* 82E74 80082274 00031942 */  srl        $v1, $v1, 5
/* 82E78 80082278 000310C0 */  sll        $v0, $v1, 3
/* 82E7C 8008227C 00431023 */  subu       $v0, $v0, $v1
/* 82E80 80082280 00021140 */  sll        $v0, $v0, 5
/* 82E84 80082284 00431021 */  addu       $v0, $v0, $v1
/* 82E88 80082288 00022100 */  sll        $a0, $v0, 4
/* 82E8C 8008228C 00822023 */  subu       $a0, $a0, $v0
/* 82E90 80082290 00042140 */  sll        $a0, $a0, 5
/* 82E94 80082294 00A42823 */  subu       $a1, $a1, $a0
/* 82E98 80082298 03E00008 */  jr         $ra
/* 82E9C 8008229C AD05001C */   sw        $a1, 0x1c($t0)
.L800822A0:
/* 82EA0 800822A0 8D050020 */  lw         $a1, 0x20($t0)
/* 82EA4 800822A4 3C02E904 */  lui        $v0, 0xe904
/* 82EA8 800822A8 344252D5 */  ori        $v0, $v0, 0x52d5
/* 82EAC 800822AC 00A42821 */  addu       $a1, $a1, $a0
/* 82EB0 800822B0 00A20019 */  multu      $a1, $v0
/* 82EB4 800822B4 00001010 */  mfhi       $v0
/* 82EB8 800822B8 00021382 */  srl        $v0, $v0, 0xe
/* 82EBC 800822BC 00021880 */  sll        $v1, $v0, 2
/* 82EC0 800822C0 00621821 */  addu       $v1, $v1, $v0
/* 82EC4 800822C4 00032100 */  sll        $a0, $v1, 4
/* 82EC8 800822C8 00832023 */  subu       $a0, $a0, $v1
/* 82ECC 800822CC 00041100 */  sll        $v0, $a0, 4
/* 82ED0 800822D0 00441023 */  subu       $v0, $v0, $a0
/* 82ED4 800822D4 00021100 */  sll        $v0, $v0, 4
/* 82ED8 800822D8 00A22823 */  subu       $a1, $a1, $v0
/* 82EDC 800822DC AD050020 */  sw         $a1, 0x20($t0)
.L800822E0:
/* 82EE0 800822E0 03E00008 */  jr         $ra
/* 82EE4 800822E4 00000000 */   nop

glabel check_party_skill
/* 82EE8 800822E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 82EEC 800822EC AFB00010 */  sw         $s0, 0x10($sp)
/* 82EF0 800822F0 00808021 */  addu       $s0, $a0, $zero
/* 82EF4 800822F4 30A300FF */  andi       $v1, $a1, 0xff
/* 82EF8 800822F8 2C62000C */  sltiu      $v0, $v1, 0xc
/* 82EFC 800822FC 1040003D */  beqz       $v0, .L800823F4
/* 82F00 80082300 AFBF0014 */   sw        $ra, 0x14($sp)
/* 82F04 80082304 3C02800E */  lui        $v0, %hi(D_800E0CD0)
/* 82F08 80082308 24420CD0 */  addiu      $v0, $v0, %lo(D_800E0CD0)
/* 82F0C 8008230C 00031880 */  sll        $v1, $v1, 2
/* 82F10 80082310 00621821 */  addu       $v1, $v1, $v0
/* 82F14 80082314 8C640000 */  lw         $a0, ($v1)
/* 82F18 80082318 00800008 */  jr         $a0
/* 82F1C 8008231C 00000000 */   nop
/* 82F20 80082320 0C020976 */  jal        check_Alchemist_int
/* 82F24 80082324 02002021 */   addu      $a0, $s0, $zero
/* 82F28 80082328 080208FF */  j          .L800823FC
/* 82F2C 8008232C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F30 80082330 0C01FEC0 */  jal        Check_diplomat_int
/* 82F34 80082334 02002021 */   addu      $a0, $s0, $zero
/* 82F38 80082338 2C420003 */  sltiu      $v0, $v0, 3
/* 82F3C 8008233C 1440002E */  bnez       $v0, .L800823F8
/* 82F40 80082340 24020002 */   addiu     $v0, $zero, 2
/* 82F44 80082344 0C01FEC0 */  jal        Check_diplomat_int
/* 82F48 80082348 02002021 */   addu      $a0, $s0, $zero
/* 82F4C 8008234C 080208FF */  j          .L800823FC
/* 82F50 80082350 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F54 80082354 0C0209A0 */  jal        check_healer_int
/* 82F58 80082358 02002021 */   addu      $a0, $s0, $zero
/* 82F5C 8008235C 080208FF */  j          .L800823FC
/* 82F60 80082360 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F64 80082364 0C01FEFF */  jal        check_loremaster_INT_
/* 82F68 80082368 02002021 */   addu      $a0, $s0, $zero
/* 82F6C 8008236C 080208FF */  j          .L800823FC
/* 82F70 80082370 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F74 80082374 0C0209CA */  jal        check_mechanic_dex_int
/* 82F78 80082378 02002021 */   addu      $a0, $s0, $zero
/* 82F7C 8008237C 080208FF */  j          .L800823FC
/* 82F80 80082380 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F84 80082384 0C0209F9 */  jal        check_Merchant_INT
/* 82F88 80082388 02002021 */   addu      $a0, $s0, $zero
/* 82F8C 8008238C 080208FF */  j          .L800823FC
/* 82F90 80082390 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82F94 80082394 0C020A3A */  jal        check_ranger
/* 82F98 80082398 02002021 */   addu      $a0, $s0, $zero
/* 82F9C 8008239C 080208FF */  j          .L800823FC
/* 82FA0 800823A0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82FA4 800823A4 0C020A5A */  jal        ret0_80082968
/* 82FA8 800823A8 02002021 */   addu      $a0, $s0, $zero
/* 82FAC 800823AC 080208FF */  j          .L800823FC
/* 82FB0 800823B0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82FB4 800823B4 0C020A5C */  jal        check_theif_Int
/* 82FB8 800823B8 02002021 */   addu      $a0, $s0, $zero
/* 82FBC 800823BC 080208FF */  j          .L800823FC
/* 82FC0 800823C0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82FC4 800823C4 0C020245 */  jal        skillcheck_troubador
/* 82FC8 800823C8 02002021 */   addu      $a0, $s0, $zero
/* 82FCC 800823CC 080208FF */  j          .L800823FC
/* 82FD0 800823D0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82FD4 800823D4 0C020A85 */  jal        check_warrior_int_stam_
/* 82FD8 800823D8 02002021 */   addu      $a0, $s0, $zero
/* 82FDC 800823DC 080208FF */  j          .L800823FC
/* 82FE0 800823E0 8FBF0014 */   lw        $ra, 0x14($sp)
/* 82FE4 800823E4 0C020AB3 */  jal        check_Wizard_int
/* 82FE8 800823E8 02002021 */   addu      $a0, $s0, $zero
/* 82FEC 800823EC 080208FF */  j          .L800823FC
/* 82FF0 800823F0 8FBF0014 */   lw        $ra, 0x14($sp)
.L800823F4:
/* 82FF4 800823F4 00001021 */  addu       $v0, $zero, $zero
.L800823F8:
/* 82FF8 800823F8 8FBF0014 */  lw         $ra, 0x14($sp)
.L800823FC:
/* 82FFC 800823FC 8FB00010 */  lw         $s0, 0x10($sp)
/* 83000 80082400 03E00008 */  jr         $ra
/* 83004 80082404 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_best_stat
/* 83008 80082408 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 8300C 8008240C AFB40020 */  sw         $s4, 0x20($sp)
/* 83010 80082410 0080A021 */  addu       $s4, $a0, $zero
/* 83014 80082414 AFB3001C */  sw         $s3, 0x1c($sp)
/* 83018 80082418 30B300FF */  andi       $s3, $a1, 0xff
/* 8301C 8008241C AFBF0024 */  sw         $ra, 0x24($sp)
/* 83020 80082420 AFB20018 */  sw         $s2, 0x18($sp)
/* 83024 80082424 AFB10014 */  sw         $s1, 0x14($sp)
/* 83028 80082428 AFB00010 */  sw         $s0, 0x10($sp)
/* 8302C 8008242C 8E820000 */  lw         $v0, ($s4)
/* 83030 80082430 02602821 */  addu       $a1, $s3, $zero
/* 83034 80082434 8C440018 */  lw         $a0, 0x18($v0)
/* 83038 80082438 0C02128F */  jal        getModdedStat
/* 8303C 8008243C 24120001 */   addiu     $s2, $zero, 1
/* 83040 80082440 305100FF */  andi       $s1, $v0, 0xff
/* 83044 80082444 00121080 */  sll        $v0, $s2, 2
.L80082448:
/* 83048 80082448 02828021 */  addu       $s0, $s4, $v0
/* 8304C 8008244C 8E020000 */  lw         $v0, ($s0)
/* 83050 80082450 5040000D */  beql       $v0, $zero, .L80082488
/* 83054 80082454 26420001 */   addiu     $v0, $s2, 1
/* 83058 80082458 8C440018 */  lw         $a0, 0x18($v0)
/* 8305C 8008245C 0C02128F */  jal        getModdedStat
/* 83060 80082460 02602821 */   addu      $a1, $s3, $zero
/* 83064 80082464 0222102A */  slt        $v0, $s1, $v0
/* 83068 80082468 10400007 */  beqz       $v0, .L80082488
/* 8306C 8008246C 26420001 */   addiu     $v0, $s2, 1
/* 83070 80082470 8E020000 */  lw         $v0, ($s0)
/* 83074 80082474 8C440018 */  lw         $a0, 0x18($v0)
/* 83078 80082478 0C02128F */  jal        getModdedStat
/* 8307C 8008247C 02602821 */   addu      $a1, $s3, $zero
/* 83080 80082480 305100FF */  andi       $s1, $v0, 0xff
/* 83084 80082484 26420001 */  addiu      $v0, $s2, 1
.L80082488:
/* 83088 80082488 305200FF */  andi       $s2, $v0, 0xff
/* 8308C 8008248C 2E430004 */  sltiu      $v1, $s2, 4
/* 83090 80082490 1460FFED */  bnez       $v1, .L80082448
/* 83094 80082494 00121080 */   sll       $v0, $s2, 2
/* 83098 80082498 02201021 */  addu       $v0, $s1, $zero
/* 8309C 8008249C 8FBF0024 */  lw         $ra, 0x24($sp)
/* 830A0 800824A0 8FB40020 */  lw         $s4, 0x20($sp)
/* 830A4 800824A4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 830A8 800824A8 8FB20018 */  lw         $s2, 0x18($sp)
/* 830AC 800824AC 8FB10014 */  lw         $s1, 0x14($sp)
/* 830B0 800824B0 8FB00010 */  lw         $s0, 0x10($sp)
/* 830B4 800824B4 03E00008 */  jr         $ra
/* 830B8 800824B8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_worst_stat
/* 830BC 800824BC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 830C0 800824C0 AFB40020 */  sw         $s4, 0x20($sp)
/* 830C4 800824C4 0080A021 */  addu       $s4, $a0, $zero
/* 830C8 800824C8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 830CC 800824CC 30B300FF */  andi       $s3, $a1, 0xff
/* 830D0 800824D0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 830D4 800824D4 AFB20018 */  sw         $s2, 0x18($sp)
/* 830D8 800824D8 AFB10014 */  sw         $s1, 0x14($sp)
/* 830DC 800824DC AFB00010 */  sw         $s0, 0x10($sp)
/* 830E0 800824E0 8E820000 */  lw         $v0, ($s4)
/* 830E4 800824E4 02602821 */  addu       $a1, $s3, $zero
/* 830E8 800824E8 8C440018 */  lw         $a0, 0x18($v0)
/* 830EC 800824EC 0C02128F */  jal        getModdedStat
/* 830F0 800824F0 24120001 */   addiu     $s2, $zero, 1
/* 830F4 800824F4 305100FF */  andi       $s1, $v0, 0xff
/* 830F8 800824F8 00121080 */  sll        $v0, $s2, 2
.L800824FC:
/* 830FC 800824FC 02828021 */  addu       $s0, $s4, $v0
/* 83100 80082500 8E020000 */  lw         $v0, ($s0)
/* 83104 80082504 5040000D */  beql       $v0, $zero, .L8008253C
/* 83108 80082508 26420001 */   addiu     $v0, $s2, 1
/* 8310C 8008250C 8C440018 */  lw         $a0, 0x18($v0)
/* 83110 80082510 0C02128F */  jal        getModdedStat
/* 83114 80082514 02602821 */   addu      $a1, $s3, $zero
/* 83118 80082518 0051102A */  slt        $v0, $v0, $s1
/* 8311C 8008251C 10400007 */  beqz       $v0, .L8008253C
/* 83120 80082520 26420001 */   addiu     $v0, $s2, 1
/* 83124 80082524 8E020000 */  lw         $v0, ($s0)
/* 83128 80082528 8C440018 */  lw         $a0, 0x18($v0)
/* 8312C 8008252C 0C02128F */  jal        getModdedStat
/* 83130 80082530 02602821 */   addu      $a1, $s3, $zero
/* 83134 80082534 305100FF */  andi       $s1, $v0, 0xff
/* 83138 80082538 26420001 */  addiu      $v0, $s2, 1
.L8008253C:
/* 8313C 8008253C 305200FF */  andi       $s2, $v0, 0xff
/* 83140 80082540 2E430004 */  sltiu      $v1, $s2, 4
/* 83144 80082544 1460FFED */  bnez       $v1, .L800824FC
/* 83148 80082548 00121080 */   sll       $v0, $s2, 2
/* 8314C 8008254C 02201021 */  addu       $v0, $s1, $zero
/* 83150 80082550 8FBF0024 */  lw         $ra, 0x24($sp)
/* 83154 80082554 8FB40020 */  lw         $s4, 0x20($sp)
/* 83158 80082558 8FB3001C */  lw         $s3, 0x1c($sp)
/* 8315C 8008255C 8FB20018 */  lw         $s2, 0x18($sp)
/* 83160 80082560 8FB10014 */  lw         $s1, 0x14($sp)
/* 83164 80082564 8FB00010 */  lw         $s0, 0x10($sp)
/* 83168 80082568 03E00008 */  jr         $ra
/* 8316C 8008256C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel get_this_char_stat
/* 83170 80082570 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83174 80082574 AFBF0010 */  sw         $ra, 0x10($sp)
/* 83178 80082578 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 8317C 8008257C 30C600FF */  andi       $a2, $a2, 0xff
/* 83180 80082580 00003821 */  addu       $a3, $zero, $zero
/* 83184 80082584 00071080 */  sll        $v0, $a3, 2
.L80082588:
/* 83188 80082588 00821021 */  addu       $v0, $a0, $v0
/* 8318C 8008258C 8C430000 */  lw         $v1, ($v0)
/* 83190 80082590 10600009 */  beqz       $v1, .L800825B8
/* 83194 80082594 24E20001 */   addiu     $v0, $a3, 1
/* 83198 80082598 94620000 */  lhu        $v0, ($v1)
/* 8319C 8008259C 54450006 */  bnel       $v0, $a1, .L800825B8
/* 831A0 800825A0 24E20001 */   addiu     $v0, $a3, 1
/* 831A4 800825A4 8C640018 */  lw         $a0, 0x18($v1)
/* 831A8 800825A8 0C02128F */  jal        getModdedStat
/* 831AC 800825AC 00C02821 */   addu      $a1, $a2, $zero
/* 831B0 800825B0 08020973 */  j          .L800825CC
/* 831B4 800825B4 304200FF */   andi      $v0, $v0, 0xff
.L800825B8:
/* 831B8 800825B8 304700FF */  andi       $a3, $v0, 0xff
/* 831BC 800825BC 2CE30004 */  sltiu      $v1, $a3, 4
/* 831C0 800825C0 1460FFF1 */  bnez       $v1, .L80082588
/* 831C4 800825C4 00071080 */   sll       $v0, $a3, 2
/* 831C8 800825C8 00001021 */  addu       $v0, $zero, $zero
.L800825CC:
/* 831CC 800825CC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 831D0 800825D0 03E00008 */  jr         $ra
/* 831D4 800825D4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel check_Alchemist_int
/* 831D8 800825D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 831DC 800825DC AFB00010 */  sw         $s0, 0x10($sp)
/* 831E0 800825E0 00808021 */  addu       $s0, $a0, $zero
/* 831E4 800825E4 00002821 */  addu       $a1, $zero, $zero
/* 831E8 800825E8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 831EC 800825EC 0C020724 */  jal        GetMostSkilledMember
/* 831F0 800825F0 AFB10014 */   sw        $s1, 0x14($sp)
/* 831F4 800825F4 00401821 */  addu       $v1, $v0, $zero
/* 831F8 800825F8 240200FF */  addiu      $v0, $zero, 0xff
/* 831FC 800825FC 1062001A */  beq        $v1, $v0, .L80082668
/* 83200 80082600 00031080 */   sll       $v0, $v1, 2
/* 83204 80082604 02021021 */  addu       $v0, $s0, $v0
/* 83208 80082608 8C500000 */  lw         $s0, ($v0)
/* 8320C 8008260C 8E040018 */  lw         $a0, 0x18($s0)
/* 83210 80082610 0C02128F */  jal        getModdedStat
/* 83214 80082614 00002821 */   addu      $a1, $zero, $zero
/* 83218 80082618 00002821 */  addu       $a1, $zero, $zero
/* 8321C 8008261C 8E04001C */  lw         $a0, 0x1c($s0)
/* 83220 80082620 0C020F67 */  jal        getModdedSkill
/* 83224 80082624 00408821 */   addu      $s1, $v0, $zero
/* 83228 80082628 24040001 */  addiu      $a0, $zero, 1
/* 8322C 8008262C 24050064 */  addiu      $a1, $zero, 0x64
/* 83230 80082630 00118040 */  sll        $s0, $s1, 1
/* 83234 80082634 02118021 */  addu       $s0, $s0, $s1
/* 83238 80082638 00021840 */  sll        $v1, $v0, 1
/* 8323C 8008263C 00621821 */  addu       $v1, $v1, $v0
/* 83240 80082640 00031840 */  sll        $v1, $v1, 1
/* 83244 80082644 02038021 */  addu       $s0, $s0, $v1
/* 83248 80082648 0C002D03 */  jal        RollD
/* 8324C 8008264C 3210FFFF */   andi      $s0, $s0, 0xffff
/* 83250 80082650 00501023 */  subu       $v0, $v0, $s0
/* 83254 80082654 00021400 */  sll        $v0, $v0, 0x10
/* 83258 80082658 0C002D20 */  jal        some_skillcheck_calc
/* 8325C 8008265C 00022403 */   sra       $a0, $v0, 0x10
/* 83260 80082660 0802099C */  j          .L80082670
/* 83264 80082664 8FBF0018 */   lw        $ra, 0x18($sp)
.L80082668:
/* 83268 80082668 00001021 */  addu       $v0, $zero, $zero
/* 8326C 8008266C 8FBF0018 */  lw         $ra, 0x18($sp)
.L80082670:
/* 83270 80082670 8FB10014 */  lw         $s1, 0x14($sp)
/* 83274 80082674 8FB00010 */  lw         $s0, 0x10($sp)
/* 83278 80082678 03E00008 */  jr         $ra
/* 8327C 8008267C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_healer_int
/* 83280 80082680 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 83284 80082684 AFB00010 */  sw         $s0, 0x10($sp)
/* 83288 80082688 00808021 */  addu       $s0, $a0, $zero
/* 8328C 8008268C 24050002 */  addiu      $a1, $zero, 2
/* 83290 80082690 AFBF0018 */  sw         $ra, 0x18($sp)
/* 83294 80082694 0C020724 */  jal        GetMostSkilledMember
/* 83298 80082698 AFB10014 */   sw        $s1, 0x14($sp)
/* 8329C 8008269C 00401821 */  addu       $v1, $v0, $zero
/* 832A0 800826A0 240200FF */  addiu      $v0, $zero, 0xff
/* 832A4 800826A4 1062001A */  beq        $v1, $v0, .L80082710
/* 832A8 800826A8 00031080 */   sll       $v0, $v1, 2
/* 832AC 800826AC 02021021 */  addu       $v0, $s0, $v0
/* 832B0 800826B0 8C500000 */  lw         $s0, ($v0)
/* 832B4 800826B4 8E040018 */  lw         $a0, 0x18($s0)
/* 832B8 800826B8 0C02128F */  jal        getModdedStat
/* 832BC 800826BC 00002821 */   addu      $a1, $zero, $zero
/* 832C0 800826C0 24050002 */  addiu      $a1, $zero, 2
/* 832C4 800826C4 8E04001C */  lw         $a0, 0x1c($s0)
/* 832C8 800826C8 0C020F67 */  jal        getModdedSkill
/* 832CC 800826CC 00408821 */   addu      $s1, $v0, $zero
/* 832D0 800826D0 24040001 */  addiu      $a0, $zero, 1
/* 832D4 800826D4 24050064 */  addiu      $a1, $zero, 0x64
/* 832D8 800826D8 00118040 */  sll        $s0, $s1, 1
/* 832DC 800826DC 02118021 */  addu       $s0, $s0, $s1
/* 832E0 800826E0 00021880 */  sll        $v1, $v0, 2
/* 832E4 800826E4 00621821 */  addu       $v1, $v1, $v0
/* 832E8 800826E8 00031840 */  sll        $v1, $v1, 1
/* 832EC 800826EC 02038021 */  addu       $s0, $s0, $v1
/* 832F0 800826F0 0C002D03 */  jal        RollD
/* 832F4 800826F4 3210FFFF */   andi      $s0, $s0, 0xffff
/* 832F8 800826F8 00501023 */  subu       $v0, $v0, $s0
/* 832FC 800826FC 00021400 */  sll        $v0, $v0, 0x10
/* 83300 80082700 0C002D20 */  jal        some_skillcheck_calc
/* 83304 80082704 00022403 */   sra       $a0, $v0, 0x10
/* 83308 80082708 080209C6 */  j          .L80082718
/* 8330C 8008270C 8FBF0018 */   lw        $ra, 0x18($sp)
.L80082710:
/* 83310 80082710 00001021 */  addu       $v0, $zero, $zero
/* 83314 80082714 8FBF0018 */  lw         $ra, 0x18($sp)
.L80082718:
/* 83318 80082718 8FB10014 */  lw         $s1, 0x14($sp)
/* 8331C 8008271C 8FB00010 */  lw         $s0, 0x10($sp)
/* 83320 80082720 03E00008 */  jr         $ra
/* 83324 80082724 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_mechanic_dex_int
/* 83328 80082728 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 8332C 8008272C AFB00010 */  sw         $s0, 0x10($sp)
/* 83330 80082730 00808021 */  addu       $s0, $a0, $zero
/* 83334 80082734 24050004 */  addiu      $a1, $zero, 4
/* 83338 80082738 AFBF001C */  sw         $ra, 0x1c($sp)
/* 8333C 8008273C AFB20018 */  sw         $s2, 0x18($sp)
/* 83340 80082740 0C020724 */  jal        GetMostSkilledMember
/* 83344 80082744 AFB10014 */   sw        $s1, 0x14($sp)
/* 83348 80082748 00401821 */  addu       $v1, $v0, $zero
/* 8334C 8008274C 240200FF */  addiu      $v0, $zero, 0xff
/* 83350 80082750 1062001D */  beq        $v1, $v0, .L800827C8
/* 83354 80082754 00031080 */   sll       $v0, $v1, 2
/* 83358 80082758 02021021 */  addu       $v0, $s0, $v0
/* 8335C 8008275C 8C500000 */  lw         $s0, ($v0)
/* 83360 80082760 8E040018 */  lw         $a0, 0x18($s0)
/* 83364 80082764 0C02128F */  jal        getModdedStat
/* 83368 80082768 00002821 */   addu      $a1, $zero, $zero
/* 8336C 8008276C 24050002 */  addiu      $a1, $zero, 2
/* 83370 80082770 8E040018 */  lw         $a0, 0x18($s0)
/* 83374 80082774 0C02128F */  jal        getModdedStat
/* 83378 80082778 00408821 */   addu      $s1, $v0, $zero
/* 8337C 8008277C 24050004 */  addiu      $a1, $zero, 4
/* 83380 80082780 8E04001C */  lw         $a0, 0x1c($s0)
/* 83384 80082784 0C020F67 */  jal        getModdedSkill
/* 83388 80082788 00409021 */   addu      $s2, $v0, $zero
/* 8338C 8008278C 24040001 */  addiu      $a0, $zero, 1
/* 83390 80082790 24050064 */  addiu      $a1, $zero, 0x64
/* 83394 80082794 02328821 */  addu       $s1, $s1, $s2
/* 83398 80082798 00028080 */  sll        $s0, $v0, 2
/* 8339C 8008279C 02028021 */  addu       $s0, $s0, $v0
/* 833A0 800827A0 02118021 */  addu       $s0, $s0, $s1
/* 833A4 800827A4 00108040 */  sll        $s0, $s0, 1
/* 833A8 800827A8 0C002D03 */  jal        RollD
/* 833AC 800827AC 3210FFFF */   andi      $s0, $s0, 0xffff
/* 833B0 800827B0 00501023 */  subu       $v0, $v0, $s0
/* 833B4 800827B4 00021400 */  sll        $v0, $v0, 0x10
/* 833B8 800827B8 0C002D20 */  jal        some_skillcheck_calc
/* 833BC 800827BC 00022403 */   sra       $a0, $v0, 0x10
/* 833C0 800827C0 080209F4 */  j          .L800827D0
/* 833C4 800827C4 8FBF001C */   lw        $ra, 0x1c($sp)
.L800827C8:
/* 833C8 800827C8 00001021 */  addu       $v0, $zero, $zero
/* 833CC 800827CC 8FBF001C */  lw         $ra, 0x1c($sp)
.L800827D0:
/* 833D0 800827D0 8FB20018 */  lw         $s2, 0x18($sp)
/* 833D4 800827D4 8FB10014 */  lw         $s1, 0x14($sp)
/* 833D8 800827D8 8FB00010 */  lw         $s0, 0x10($sp)
/* 833DC 800827DC 03E00008 */  jr         $ra
/* 833E0 800827E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_Merchant_INT
/* 833E4 800827E4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 833E8 800827E8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 833EC 800827EC 00809821 */  addu       $s3, $a0, $zero
/* 833F0 800827F0 AFB20018 */  sw         $s2, 0x18($sp)
/* 833F4 800827F4 00009021 */  addu       $s2, $zero, $zero
/* 833F8 800827F8 AFB10014 */  sw         $s1, 0x14($sp)
/* 833FC 800827FC 00008821 */  addu       $s1, $zero, $zero
/* 83400 80082800 AFBF0020 */  sw         $ra, 0x20($sp)
/* 83404 80082804 AFB00010 */  sw         $s0, 0x10($sp)
/* 83408 80082808 00111080 */  sll        $v0, $s1, 2
.L8008280C:
/* 8340C 8008280C 02628021 */  addu       $s0, $s3, $v0
/* 83410 80082810 8E020000 */  lw         $v0, ($s0)
/* 83414 80082814 5040000D */  beql       $v0, $zero, .L8008284C
/* 83418 80082818 26220001 */   addiu     $v0, $s1, 1
/* 8341C 8008281C 8C440018 */  lw         $a0, 0x18($v0)
/* 83420 80082820 0C02128F */  jal        getModdedStat
/* 83424 80082824 00002821 */   addu      $a1, $zero, $zero
/* 83428 80082828 0242102A */  slt        $v0, $s2, $v0
/* 8342C 8008282C 10400007 */  beqz       $v0, .L8008284C
/* 83430 80082830 26220001 */   addiu     $v0, $s1, 1
/* 83434 80082834 8E020000 */  lw         $v0, ($s0)
/* 83438 80082838 8C440018 */  lw         $a0, 0x18($v0)
/* 8343C 8008283C 0C02128F */  jal        getModdedStat
/* 83440 80082840 00002821 */   addu      $a1, $zero, $zero
/* 83444 80082844 305200FF */  andi       $s2, $v0, 0xff
/* 83448 80082848 26220001 */  addiu      $v0, $s1, 1
.L8008284C:
/* 8344C 8008284C 305100FF */  andi       $s1, $v0, 0xff
/* 83450 80082850 2E230004 */  sltiu      $v1, $s1, 4
/* 83454 80082854 1460FFED */  bnez       $v1, .L8008280C
/* 83458 80082858 00111080 */   sll       $v0, $s1, 2
/* 8345C 8008285C 02602021 */  addu       $a0, $s3, $zero
/* 83460 80082860 0C020724 */  jal        GetMostSkilledMember
/* 83464 80082864 24050005 */   addiu     $a1, $zero, 5
/* 83468 80082868 00401821 */  addu       $v1, $v0, $zero
/* 8346C 8008286C 240200FF */  addiu      $v0, $zero, 0xff
/* 83470 80082870 10620008 */  beq        $v1, $v0, .L80082894
/* 83474 80082874 00003021 */   addu      $a2, $zero, $zero
/* 83478 80082878 00031080 */  sll        $v0, $v1, 2
/* 8347C 8008287C 02621021 */  addu       $v0, $s3, $v0
/* 83480 80082880 8C430000 */  lw         $v1, ($v0)
/* 83484 80082884 8C64001C */  lw         $a0, 0x1c($v1)
/* 83488 80082888 0C020F67 */  jal        getModdedSkill
/* 8348C 8008288C 24050005 */   addiu     $a1, $zero, 5
/* 83490 80082890 304600FF */  andi       $a2, $v0, 0xff
.L80082894:
/* 83494 80082894 24040001 */  addiu      $a0, $zero, 1
/* 83498 80082898 24050064 */  addiu      $a1, $zero, 0x64
/* 8349C 8008289C 00128040 */  sll        $s0, $s2, 1
/* 834A0 800828A0 02128021 */  addu       $s0, $s0, $s2
/* 834A4 800828A4 00061080 */  sll        $v0, $a2, 2
/* 834A8 800828A8 00461021 */  addu       $v0, $v0, $a2
/* 834AC 800828AC 00021040 */  sll        $v0, $v0, 1
/* 834B0 800828B0 02028021 */  addu       $s0, $s0, $v0
/* 834B4 800828B4 0C002D03 */  jal        RollD
/* 834B8 800828B8 3210FFFF */   andi      $s0, $s0, 0xffff
/* 834BC 800828BC 00501023 */  subu       $v0, $v0, $s0
/* 834C0 800828C0 00021400 */  sll        $v0, $v0, 0x10
/* 834C4 800828C4 0C002D20 */  jal        some_skillcheck_calc
/* 834C8 800828C8 00022403 */   sra       $a0, $v0, 0x10
/* 834CC 800828CC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 834D0 800828D0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 834D4 800828D4 8FB20018 */  lw         $s2, 0x18($sp)
/* 834D8 800828D8 8FB10014 */  lw         $s1, 0x14($sp)
/* 834DC 800828DC 8FB00010 */  lw         $s0, 0x10($sp)
/* 834E0 800828E0 03E00008 */  jr         $ra
/* 834E4 800828E4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel check_ranger
/* 834E8 800828E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 834EC 800828EC AFB00010 */  sw         $s0, 0x10($sp)
/* 834F0 800828F0 00808021 */  addu       $s0, $a0, $zero
/* 834F4 800828F4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 834F8 800828F8 0C020724 */  jal        GetMostSkilledMember
/* 834FC 800828FC 24050006 */   addiu     $a1, $zero, 6
/* 83500 80082900 00401821 */  addu       $v1, $v0, $zero
/* 83504 80082904 240200FF */  addiu      $v0, $zero, 0xff
/* 83508 80082908 10620008 */  beq        $v1, $v0, .L8008292C
/* 8350C 8008290C 00003021 */   addu      $a2, $zero, $zero
/* 83510 80082910 00031080 */  sll        $v0, $v1, 2
/* 83514 80082914 02021021 */  addu       $v0, $s0, $v0
/* 83518 80082918 8C430000 */  lw         $v1, ($v0)
/* 8351C 8008291C 8C64001C */  lw         $a0, 0x1c($v1)
/* 83520 80082920 0C020F67 */  jal        getModdedSkill
/* 83524 80082924 24050006 */   addiu     $a1, $zero, 6
/* 83528 80082928 304600FF */  andi       $a2, $v0, 0xff
.L8008292C:
/* 8352C 8008292C 24040001 */  addiu      $a0, $zero, 1
/* 83530 80082930 24050064 */  addiu      $a1, $zero, 0x64
/* 83534 80082934 00068080 */  sll        $s0, $a2, 2
/* 83538 80082938 02068021 */  addu       $s0, $s0, $a2
/* 8353C 8008293C 00108040 */  sll        $s0, $s0, 1
/* 83540 80082940 0C002D03 */  jal        RollD
/* 83544 80082944 26100050 */   addiu     $s0, $s0, 0x50
/* 83548 80082948 00501023 */  subu       $v0, $v0, $s0
/* 8354C 8008294C 00021400 */  sll        $v0, $v0, 0x10
/* 83550 80082950 0C002D20 */  jal        some_skillcheck_calc
/* 83554 80082954 00022403 */   sra       $a0, $v0, 0x10
/* 83558 80082958 8FBF0014 */  lw         $ra, 0x14($sp)
/* 8355C 8008295C 8FB00010 */  lw         $s0, 0x10($sp)
/* 83560 80082960 03E00008 */  jr         $ra
/* 83564 80082964 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ret0_80082968
/* 83568 80082968 03E00008 */  jr         $ra
/* 8356C 8008296C 00001021 */   addu      $v0, $zero, $zero

glabel check_theif_Int
/* 83570 80082970 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 83574 80082974 AFB00010 */  sw         $s0, 0x10($sp)
/* 83578 80082978 00808021 */  addu       $s0, $a0, $zero
/* 8357C 8008297C 24050008 */  addiu      $a1, $zero, 8
/* 83580 80082980 AFBF0018 */  sw         $ra, 0x18($sp)
/* 83584 80082984 0C020724 */  jal        GetMostSkilledMember
/* 83588 80082988 AFB10014 */   sw        $s1, 0x14($sp)
/* 8358C 8008298C 00401821 */  addu       $v1, $v0, $zero
/* 83590 80082990 240200FF */  addiu      $v0, $zero, 0xff
/* 83594 80082994 10620019 */  beq        $v1, $v0, .L800829FC
/* 83598 80082998 00031080 */   sll       $v0, $v1, 2
/* 8359C 8008299C 02021021 */  addu       $v0, $s0, $v0
/* 835A0 800829A0 8C510000 */  lw         $s1, ($v0)
/* 835A4 800829A4 8E240018 */  lw         $a0, 0x18($s1)
/* 835A8 800829A8 0C02128F */  jal        getModdedStat
/* 835AC 800829AC 00002821 */   addu      $a1, $zero, $zero
/* 835B0 800829B0 24050008 */  addiu      $a1, $zero, 8
/* 835B4 800829B4 8E24001C */  lw         $a0, 0x1c($s1)
/* 835B8 800829B8 0C020F67 */  jal        getModdedSkill
/* 835BC 800829BC 00408021 */   addu      $s0, $v0, $zero
/* 835C0 800829C0 24040001 */  addiu      $a0, $zero, 1
/* 835C4 800829C4 24050064 */  addiu      $a1, $zero, 0x64
/* 835C8 800829C8 00108080 */  sll        $s0, $s0, 2
/* 835CC 800829CC 00021880 */  sll        $v1, $v0, 2
/* 835D0 800829D0 00621821 */  addu       $v1, $v1, $v0
/* 835D4 800829D4 00031840 */  sll        $v1, $v1, 1
/* 835D8 800829D8 02038021 */  addu       $s0, $s0, $v1
/* 835DC 800829DC 0C002D03 */  jal        RollD
/* 835E0 800829E0 3210FFFF */   andi      $s0, $s0, 0xffff
/* 835E4 800829E4 00501023 */  subu       $v0, $v0, $s0
/* 835E8 800829E8 00021400 */  sll        $v0, $v0, 0x10
/* 835EC 800829EC 0C002D20 */  jal        some_skillcheck_calc
/* 835F0 800829F0 00022403 */   sra       $a0, $v0, 0x10
/* 835F4 800829F4 08020A81 */  j          .L80082A04
/* 835F8 800829F8 8FBF0018 */   lw        $ra, 0x18($sp)
.L800829FC:
/* 835FC 800829FC 00001021 */  addu       $v0, $zero, $zero
/* 83600 80082A00 8FBF0018 */  lw         $ra, 0x18($sp)
.L80082A04:
/* 83604 80082A04 8FB10014 */  lw         $s1, 0x14($sp)
/* 83608 80082A08 8FB00010 */  lw         $s0, 0x10($sp)
/* 8360C 80082A0C 03E00008 */  jr         $ra
/* 83610 80082A10 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_warrior_int_stam_
/* 83614 80082A14 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 83618 80082A18 AFB00010 */  sw         $s0, 0x10($sp)
/* 8361C 80082A1C 00808021 */  addu       $s0, $a0, $zero
/* 83620 80082A20 2405000A */  addiu      $a1, $zero, 0xa
/* 83624 80082A24 AFBF001C */  sw         $ra, 0x1c($sp)
/* 83628 80082A28 AFB20018 */  sw         $s2, 0x18($sp)
/* 8362C 80082A2C 0C020724 */  jal        GetMostSkilledMember
/* 83630 80082A30 AFB10014 */   sw        $s1, 0x14($sp)
/* 83634 80082A34 00401821 */  addu       $v1, $v0, $zero
/* 83638 80082A38 240200FF */  addiu      $v0, $zero, 0xff
/* 8363C 80082A3C 1062001C */  beq        $v1, $v0, .L80082AB0
/* 83640 80082A40 00031080 */   sll       $v0, $v1, 2
/* 83644 80082A44 02021021 */  addu       $v0, $s0, $v0
/* 83648 80082A48 8C510000 */  lw         $s1, ($v0)
/* 8364C 80082A4C 8E240018 */  lw         $a0, 0x18($s1)
/* 83650 80082A50 0C02128F */  jal        getModdedStat
/* 83654 80082A54 00002821 */   addu      $a1, $zero, $zero
/* 83658 80082A58 2405000A */  addiu      $a1, $zero, 0xa
/* 8365C 80082A5C 8E24001C */  lw         $a0, 0x1c($s1)
/* 83660 80082A60 0C020F67 */  jal        getModdedSkill
/* 83664 80082A64 00408021 */   addu      $s0, $v0, $zero
/* 83668 80082A68 24050005 */  addiu      $a1, $zero, 5
/* 8366C 80082A6C 8E240018 */  lw         $a0, 0x18($s1)
/* 83670 80082A70 0C02128F */  jal        getModdedStat
/* 83674 80082A74 00409021 */   addu      $s2, $v0, $zero
/* 83678 80082A78 24040001 */  addiu      $a0, $zero, 1
/* 8367C 80082A7C 24050064 */  addiu      $a1, $zero, 0x64
/* 83680 80082A80 001218C0 */  sll        $v1, $s2, 3
/* 83684 80082A84 00721823 */  subu       $v1, $v1, $s2
/* 83688 80082A88 02038021 */  addu       $s0, $s0, $v1
/* 8368C 80082A8C 02028021 */  addu       $s0, $s0, $v0
/* 83690 80082A90 0C002D03 */  jal        RollD
/* 83694 80082A94 3210FFFF */   andi      $s0, $s0, 0xffff
/* 83698 80082A98 00501023 */  subu       $v0, $v0, $s0
/* 8369C 80082A9C 00021400 */  sll        $v0, $v0, 0x10
/* 836A0 80082AA0 0C002D20 */  jal        some_skillcheck_calc
/* 836A4 80082AA4 00022403 */   sra       $a0, $v0, 0x10
/* 836A8 80082AA8 08020AAE */  j          .L80082AB8
/* 836AC 80082AAC 8FBF001C */   lw        $ra, 0x1c($sp)
.L80082AB0:
/* 836B0 80082AB0 00001021 */  addu       $v0, $zero, $zero
/* 836B4 80082AB4 8FBF001C */  lw         $ra, 0x1c($sp)
.L80082AB8:
/* 836B8 80082AB8 8FB20018 */  lw         $s2, 0x18($sp)
/* 836BC 80082ABC 8FB10014 */  lw         $s1, 0x14($sp)
/* 836C0 80082AC0 8FB00010 */  lw         $s0, 0x10($sp)
/* 836C4 80082AC4 03E00008 */  jr         $ra
/* 836C8 80082AC8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel check_Wizard_int
/* 836CC 80082ACC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 836D0 80082AD0 AFB00010 */  sw         $s0, 0x10($sp)
/* 836D4 80082AD4 00808021 */  addu       $s0, $a0, $zero
/* 836D8 80082AD8 2405000B */  addiu      $a1, $zero, 0xb
/* 836DC 80082ADC AFBF0018 */  sw         $ra, 0x18($sp)
/* 836E0 80082AE0 0C020724 */  jal        GetMostSkilledMember
/* 836E4 80082AE4 AFB10014 */   sw        $s1, 0x14($sp)
/* 836E8 80082AE8 00401821 */  addu       $v1, $v0, $zero
/* 836EC 80082AEC 240200FF */  addiu      $v0, $zero, 0xff
/* 836F0 80082AF0 10620018 */  beq        $v1, $v0, .L80082B54
/* 836F4 80082AF4 00031080 */   sll       $v0, $v1, 2
/* 836F8 80082AF8 02021021 */  addu       $v0, $s0, $v0
/* 836FC 80082AFC 8C500000 */  lw         $s0, ($v0)
/* 83700 80082B00 8E040018 */  lw         $a0, 0x18($s0)
/* 83704 80082B04 0C02128F */  jal        getModdedStat
/* 83708 80082B08 00002821 */   addu      $a1, $zero, $zero
/* 8370C 80082B0C 2405000B */  addiu      $a1, $zero, 0xb
/* 83710 80082B10 8E04001C */  lw         $a0, 0x1c($s0)
/* 83714 80082B14 0C020F67 */  jal        getModdedSkill
/* 83718 80082B18 00408821 */   addu      $s1, $v0, $zero
/* 8371C 80082B1C 24040001 */  addiu      $a0, $zero, 1
/* 83720 80082B20 24050064 */  addiu      $a1, $zero, 0x64
/* 83724 80082B24 00028080 */  sll        $s0, $v0, 2
/* 83728 80082B28 02028021 */  addu       $s0, $s0, $v0
/* 8372C 80082B2C 02118021 */  addu       $s0, $s0, $s1
/* 83730 80082B30 00108040 */  sll        $s0, $s0, 1
/* 83734 80082B34 0C002D03 */  jal        RollD
/* 83738 80082B38 3210FFFF */   andi      $s0, $s0, 0xffff
/* 8373C 80082B3C 00501023 */  subu       $v0, $v0, $s0
/* 83740 80082B40 00021400 */  sll        $v0, $v0, 0x10
/* 83744 80082B44 0C002D20 */  jal        some_skillcheck_calc
/* 83748 80082B48 00022403 */   sra       $a0, $v0, 0x10
/* 8374C 80082B4C 08020AD7 */  j          .L80082B5C
/* 83750 80082B50 8FBF0018 */   lw        $ra, 0x18($sp)
.L80082B54:
/* 83754 80082B54 00001021 */  addu       $v0, $zero, $zero
/* 83758 80082B58 8FBF0018 */  lw         $ra, 0x18($sp)
.L80082B5C:
/* 8375C 80082B5C 8FB10014 */  lw         $s1, 0x14($sp)
/* 83760 80082B60 8FB00010 */  lw         $s0, 0x10($sp)
/* 83764 80082B64 03E00008 */  jr         $ra
/* 83768 80082B68 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_ranger_or_warrior
/* 8376C 80082B6C 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 83770 80082B70 AFB20058 */  sw         $s2, 0x58($sp)
/* 83774 80082B74 00009021 */  addu       $s2, $zero, $zero
/* 83778 80082B78 AFB00050 */  sw         $s0, 0x50($sp)
/* 8377C 80082B7C 00808021 */  addu       $s0, $a0, $zero
/* 83780 80082B80 AFB3005C */  sw         $s3, 0x5c($sp)
/* 83784 80082B84 30B300FF */  andi       $s3, $a1, 0xff
/* 83788 80082B88 24050006 */  addiu      $a1, $zero, 6
/* 8378C 80082B8C AFBF0060 */  sw         $ra, 0x60($sp)
/* 83790 80082B90 0C020724 */  jal        GetMostSkilledMember
/* 83794 80082B94 AFB10054 */   sw        $s1, 0x54($sp)
/* 83798 80082B98 00402821 */  addu       $a1, $v0, $zero
/* 8379C 80082B9C 240200FF */  addiu      $v0, $zero, 0xff
/* 837A0 80082BA0 14A2000F */  bne        $a1, $v0, .L80082BE0
/* 837A4 80082BA4 00A08821 */   addu      $s1, $a1, $zero
/* 837A8 80082BA8 02002021 */  addu       $a0, $s0, $zero
/* 837AC 80082BAC 0C020724 */  jal        GetMostSkilledMember
/* 837B0 80082BB0 2405000A */   addiu     $a1, $zero, 0xa
/* 837B4 80082BB4 00402821 */  addu       $a1, $v0, $zero
/* 837B8 80082BB8 50B10005 */  beql       $a1, $s1, .L80082BD0
/* 837BC 80082BBC 8E020000 */   lw        $v0, ($s0)
/* 837C0 80082BC0 0C020287 */  jal        check_warrior_int_stam
/* 837C4 80082BC4 02002021 */   addu      $a0, $s0, $zero
/* 837C8 80082BC8 08020AFC */  j          .L80082BF0
/* 837CC 80082BCC 00409021 */   addu      $s2, $v0, $zero
.L80082BD0:
/* 837D0 80082BD0 10400007 */  beqz       $v0, .L80082BF0
/* 837D4 80082BD4 02002021 */   addu      $a0, $s0, $zero
/* 837D8 80082BD8 08020AF9 */  j          .L80082BE4
/* 837DC 80082BDC 00002821 */   addu      $a1, $zero, $zero
.L80082BE0:
/* 837E0 80082BE0 02002021 */  addu       $a0, $s0, $zero
.L80082BE4:
/* 837E4 80082BE4 0C02012E */  jal        get_int_ranger_stam
/* 837E8 80082BE8 00000000 */   nop
/* 837EC 80082BEC 00409021 */  addu       $s2, $v0, $zero
.L80082BF0:
/* 837F0 80082BF0 00002021 */  addu       $a0, $zero, $zero
/* 837F4 80082BF4 0C002CF7 */  jal        rand_range
/* 837F8 80082BF8 2405000A */   addiu     $a1, $zero, 0xa
/* 837FC 80082BFC 3C01800E */  lui        $at, %hi(D_800E0D10)
/* 83800 80082C00 C4220D10 */  lwc1       $f2, %lo(D_800E0D10)($at)
/* 83804 80082C04 30420001 */  andi       $v0, $v0, 1
/* 83808 80082C08 10400003 */  beqz       $v0, .L80082C18
/* 8380C 80082C0C 3C03800E */   lui       $v1, %hi(D_800E0D00)
/* 83810 80082C10 3C01800E */  lui        $at, %hi(D_800E0D14)
/* 83814 80082C14 C4220D14 */  lwc1       $f2, %lo(D_800E0D14)($at)
.L80082C18:
/* 83818 80082C18 24620D00 */  addiu      $v0, $v1, %lo(D_800E0D00)
/* 8381C 80082C1C 02403821 */  addu       $a3, $s2, $zero
/* 83820 80082C20 8C640D00 */  lw         $a0, 0xd00($v1)
/* 83824 80082C24 8C450004 */  lw         $a1, 4($v0)
/* 83828 80082C28 8C430008 */  lw         $v1, 8($v0)
/* 8382C 80082C2C 8C46000C */  lw         $a2, 0xc($v0)
/* 83830 80082C30 2CE20004 */  sltiu      $v0, $a3, 4
/* 83834 80082C34 AFA40010 */  sw         $a0, 0x10($sp)
/* 83838 80082C38 AFA50014 */  sw         $a1, 0x14($sp)
/* 8383C 80082C3C AFA30018 */  sw         $v1, 0x18($sp)
/* 83840 80082C40 14400002 */  bnez       $v0, .L80082C4C
/* 83844 80082C44 AFA6001C */   sw        $a2, 0x1c($sp)
/* 83848 80082C48 24070003 */  addiu      $a3, $zero, 3
.L80082C4C:
/* 8384C 80082C4C 00071080 */  sll        $v0, $a3, 2
/* 83850 80082C50 03A21821 */  addu       $v1, $sp, $v0
/* 83854 80082C54 C4600010 */  lwc1       $f0, 0x10($v1)
/* 83858 80082C58 46001002 */  mul.s      $f0, $f2, $f0
/* 8385C 80082C5C 44931000 */  mtc1       $s3, $f2
/* 83860 80082C60 468010A0 */  cvt.s.w    $f2, $f2
/* 83864 80082C64 46020002 */  mul.s      $f0, $f0, $f2
/* 83868 80082C68 3C01800E */  lui        $at, %hi(D_800E0D18)
/* 8386C 80082C6C C4220D18 */  lwc1       $f2, %lo(D_800E0D18)($at)
/* 83870 80082C70 4600103E */  c.le.s     $f2, $f0
/* 83874 80082C74 00000000 */  nop
/* 83878 80082C78 45030005 */  bc1tl      .L80082C90
/* 8387C 80082C7C 46020001 */   sub.s     $f0, $f0, $f2
/* 83880 80082C80 4600008D */  trunc.w.s  $f2, $f0
/* 83884 80082C84 44031000 */  mfc1       $v1, $f2
/* 83888 80082C88 08020B29 */  j          .L80082CA4
/* 8388C 80082C8C 02631821 */   addu      $v1, $s3, $v1
.L80082C90:
/* 83890 80082C90 4600008D */  trunc.w.s  $f2, $f0
/* 83894 80082C94 44031000 */  mfc1       $v1, $f2
/* 83898 80082C98 3C028000 */  lui        $v0, 0x8000
/* 8389C 80082C9C 00621825 */  or         $v1, $v1, $v0
/* 838A0 80082CA0 02631821 */  addu       $v1, $s3, $v1
.L80082CA4:
/* 838A4 80082CA4 306200FF */  andi       $v0, $v1, 0xff
/* 838A8 80082CA8 50400001 */  beql       $v0, $zero, .L80082CB0
/* 838AC 80082CAC 24030001 */   addiu     $v1, $zero, 1
.L80082CB0:
/* 838B0 80082CB0 306200FF */  andi       $v0, $v1, 0xff
/* 838B4 80082CB4 2C42000D */  sltiu      $v0, $v0, 0xd
/* 838B8 80082CB8 50400001 */  beql       $v0, $zero, .L80082CC0
/* 838BC 80082CBC 2403000C */   addiu     $v1, $zero, 0xc
.L80082CC0:
/* 838C0 80082CC0 8FBF0060 */  lw         $ra, 0x60($sp)
/* 838C4 80082CC4 8FB3005C */  lw         $s3, 0x5c($sp)
/* 838C8 80082CC8 8FB20058 */  lw         $s2, 0x58($sp)
/* 838CC 80082CCC 8FB10054 */  lw         $s1, 0x54($sp)
/* 838D0 80082CD0 8FB00050 */  lw         $s0, 0x50($sp)
/* 838D4 80082CD4 306200FF */  andi       $v0, $v1, 0xff
/* 838D8 80082CD8 03E00008 */  jr         $ra
/* 838DC 80082CDC 27BD0068 */   addiu     $sp, $sp, 0x68

glabel AmorCraft_attempt
/* 838E0 80082CE0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 838E4 80082CE4 AFB20020 */  sw         $s2, 0x20($sp)
/* 838E8 80082CE8 00809021 */  addu       $s2, $a0, $zero
/* 838EC 80082CEC 3C02800E */  lui        $v0, %hi(bigAssMenu)
/* 838F0 80082CF0 8C437D74 */  lw         $v1, %lo(bigAssMenu)($v0)
/* 838F4 80082CF4 30A500FF */  andi       $a1, $a1, 0xff
/* 838F8 80082CF8 AFBF0034 */  sw         $ra, 0x34($sp)
/* 838FC 80082CFC AFB60030 */  sw         $s6, 0x30($sp)
/* 83900 80082D00 AFB5002C */  sw         $s5, 0x2c($sp)
/* 83904 80082D04 AFB40028 */  sw         $s4, 0x28($sp)
/* 83908 80082D08 AFB30024 */  sw         $s3, 0x24($sp)
/* 8390C 80082D0C AFB1001C */  sw         $s1, 0x1c($sp)
/* 83910 80082D10 AFB00018 */  sw         $s0, 0x18($sp)
/* 83914 80082D14 8C620040 */  lw         $v0, 0x40($v1)
/* 83918 80082D18 30D5FFFF */  andi       $s5, $a2, 0xffff
/* 8391C 80082D1C 8C430004 */  lw         $v1, 4($v0)
/* 83920 80082D20 30F0FFFF */  andi       $s0, $a3, 0xffff
/* 83924 80082D24 8C620088 */  lw         $v0, 0x88($v1)
/* 83928 80082D28 93B4004B */  lbu        $s4, 0x4b($sp)
/* 8392C 80082D2C 0C01FF67 */  jal        getMechanic_Int_Dex
/* 83930 80082D30 8C510094 */   lw        $s1, 0x94($v0)
/* 83934 80082D34 8E430010 */  lw         $v1, 0x10($s2)
/* 83938 80082D38 02002821 */  addu       $a1, $s0, $zero
/* 8393C 80082D3C 8C670000 */  lw         $a3, ($v1)
/* 83940 80082D40 00409821 */  addu       $s3, $v0, $zero
/* 83944 80082D44 84E40050 */  lh         $a0, 0x50($a3)
/* 83948 80082D48 8CE60054 */  lw         $a2, 0x54($a3)
/* 8394C 80082D4C 00C0F809 */  jalr       $a2
/* 83950 80082D50 00642021 */   addu      $a0, $v1, $a0
/* 83954 80082D54 2403FFFF */  addiu      $v1, $zero, -1
/* 83958 80082D58 14430003 */  bne        $v0, $v1, .L80082D68
/* 8395C 80082D5C 02002821 */   addu      $a1, $s0, $zero
/* 83960 80082D60 08020B86 */  j          .L80082E18
/* 83964 80082D64 00001021 */   addu      $v0, $zero, $zero
.L80082D68:
/* 83968 80082D68 8E470010 */  lw         $a3, 0x10($s2)
/* 8396C 80082D6C 24060001 */  addiu      $a2, $zero, 1
/* 83970 80082D70 8CE30000 */  lw         $v1, ($a3)
/* 83974 80082D74 0000B021 */  addu       $s6, $zero, $zero
/* 83978 80082D78 84640038 */  lh         $a0, 0x38($v1)
/* 8397C 80082D7C 8C62003C */  lw         $v0, 0x3c($v1)
/* 83980 80082D80 0040F809 */  jalr       $v0
/* 83984 80082D84 00E42021 */   addu      $a0, $a3, $a0
/* 83988 80082D88 02202021 */  addu       $a0, $s1, $zero
/* 8398C 80082D8C 02002821 */  addu       $a1, $s0, $zero
/* 83990 80082D90 24060001 */  addiu      $a2, $zero, 1
/* 83994 80082D94 0C00F419 */  jal        func_8003D064
/* 83998 80082D98 240700FF */   addiu     $a3, $zero, 0xff
/* 8399C 80082D9C 0274182B */  sltu       $v1, $s3, $s4
/* 839A0 80082DA0 14600013 */  bnez       $v1, .L80082DF0
/* 839A4 80082DA4 02A02821 */   addu      $a1, $s5, $zero
/* 839A8 80082DA8 8E470010 */  lw         $a3, 0x10($s2)
/* 839AC 80082DAC 24060001 */  addiu      $a2, $zero, 1
/* 839B0 80082DB0 8CE30000 */  lw         $v1, ($a3)
/* 839B4 80082DB4 24160001 */  addiu      $s6, $zero, 1
/* 839B8 80082DB8 84640030 */  lh         $a0, 0x30($v1)
/* 839BC 80082DBC 8C620034 */  lw         $v0, 0x34($v1)
/* 839C0 80082DC0 0040F809 */  jalr       $v0
/* 839C4 80082DC4 00E42021 */   addu      $a0, $a3, $a0
/* 839C8 80082DC8 02202021 */  addu       $a0, $s1, $zero
/* 839CC 80082DCC 02A02821 */  addu       $a1, $s5, $zero
/* 839D0 80082DD0 24060001 */  addiu      $a2, $zero, 1
/* 839D4 80082DD4 240700FF */  addiu      $a3, $zero, 0xff
/* 839D8 80082DD8 3C02800E */  lui        $v0, %hi(D_800E0B20)
/* 839DC 80082DDC 24420B20 */  addiu      $v0, $v0, %lo(D_800E0B20)
/* 839E0 80082DE0 24031136 */  addiu      $v1, $zero, 0x1136
/* 839E4 80082DE4 AFA20010 */  sw         $v0, 0x10($sp)
/* 839E8 80082DE8 0C00F4DE */  jal        SMI_AddItem
/* 839EC 80082DEC AFA30014 */   sw        $v1, 0x14($sp)
.L80082DF0:
/* 839F0 80082DF0 0C00F590 */  jal        func_8003D640
/* 839F4 80082DF4 02202021 */   addu      $a0, $s1, $zero
/* 839F8 80082DF8 8E230078 */  lw         $v1, 0x78($s1)
/* 839FC 80082DFC 84640028 */  lh         $a0, 0x28($v1)
/* 83A00 80082E00 8C62002C */  lw         $v0, 0x2c($v1)
/* 83A04 80082E04 0040F809 */  jalr       $v0
/* 83A08 80082E08 02242021 */   addu      $a0, $s1, $a0
/* 83A0C 80082E0C 0C00BFCC */  jal        func_8002FF30
/* 83A10 80082E10 8E240080 */   lw        $a0, 0x80($s1)
/* 83A14 80082E14 02C01021 */  addu       $v0, $s6, $zero
.L80082E18:
/* 83A18 80082E18 8FBF0034 */  lw         $ra, 0x34($sp)
/* 83A1C 80082E1C 8FB60030 */  lw         $s6, 0x30($sp)
/* 83A20 80082E20 8FB5002C */  lw         $s5, 0x2c($sp)
/* 83A24 80082E24 8FB40028 */  lw         $s4, 0x28($sp)
/* 83A28 80082E28 8FB30024 */  lw         $s3, 0x24($sp)
/* 83A2C 80082E2C 8FB20020 */  lw         $s2, 0x20($sp)
/* 83A30 80082E30 8FB1001C */  lw         $s1, 0x1c($sp)
/* 83A34 80082E34 8FB00018 */  lw         $s0, 0x18($sp)
/* 83A38 80082E38 03E00008 */  jr         $ra
/* 83A3C 80082E3C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80082E40
/* 83A40 80082E40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83A44 80082E44 00052880 */  sll        $a1, $a1, 2
/* 83A48 80082E48 00852021 */  addu       $a0, $a0, $a1
/* 83A4C 80082E4C AFBF0010 */  sw         $ra, 0x10($sp)
/* 83A50 80082E50 8C840000 */  lw         $a0, ($a0)
/* 83A54 80082E54 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 83A58 80082E58 10800033 */  beqz       $a0, .L80082F28
/* 83A5C 80082E5C 00001021 */   addu      $v0, $zero, $zero
/* 83A60 80082E60 8C820024 */  lw         $v0, 0x24($a0)
/* 83A64 80082E64 50400008 */  beql       $v0, $zero, .L80082E88
/* 83A68 80082E68 8C820020 */   lw        $v0, 0x20($a0)
/* 83A6C 80082E6C 94420000 */  lhu        $v0, ($v0)
/* 83A70 80082E70 54460005 */  bnel       $v0, $a2, .L80082E88
/* 83A74 80082E74 8C820020 */   lw        $v0, 0x20($a0)
/* 83A78 80082E78 0C01E1E4 */  jal        unequp_weapons
/* 83A7C 80082E7C 00000000 */   nop
/* 83A80 80082E80 08020BCA */  j          .L80082F28
/* 83A84 80082E84 24020001 */   addiu     $v0, $zero, 1
.L80082E88:
/* 83A88 80082E88 8C430000 */  lw         $v1, ($v0)
/* 83A8C 80082E8C 10600008 */  beqz       $v1, .L80082EB0
/* 83A90 80082E90 00402821 */   addu      $a1, $v0, $zero
/* 83A94 80082E94 94620000 */  lhu        $v0, ($v1)
/* 83A98 80082E98 54460006 */  bnel       $v0, $a2, .L80082EB4
/* 83A9C 80082E9C 8CA20004 */   lw        $v0, 4($a1)
/* 83AA0 80082EA0 0C01E1A5 */  jal        remove_chestArmor
/* 83AA4 80082EA4 00000000 */   nop
/* 83AA8 80082EA8 08020BCA */  j          .L80082F28
/* 83AAC 80082EAC 24020001 */   addiu     $v0, $zero, 1
.L80082EB0:
/* 83AB0 80082EB0 8CA20004 */  lw         $v0, 4($a1)
.L80082EB4:
/* 83AB4 80082EB4 5040000C */  beql       $v0, $zero, .L80082EE8
/* 83AB8 80082EB8 8C830028 */   lw        $v1, 0x28($a0)
/* 83ABC 80082EBC 94420000 */  lhu        $v0, ($v0)
/* 83AC0 80082EC0 54460009 */  bnel       $v0, $a2, .L80082EE8
/* 83AC4 80082EC4 8C830028 */   lw        $v1, 0x28($a0)
/* 83AC8 80082EC8 0C01E1AC */  jal        remove_sheild
/* 83ACC 80082ECC 00000000 */   nop
/* 83AD0 80082ED0 08020BCA */  j          .L80082F28
/* 83AD4 80082ED4 24020001 */   addiu     $v0, $zero, 1
.L80082ED8:
/* 83AD8 80082ED8 0C01E1F9 */  jal        func_800787E4
/* 83ADC 80082EDC 30A500FF */   andi      $a1, $a1, 0xff
/* 83AE0 80082EE0 08020BCA */  j          .L80082F28
/* 83AE4 80082EE4 24020001 */   addiu     $v0, $zero, 1
.L80082EE8:
/* 83AE8 80082EE8 90620004 */  lbu        $v0, 4($v1)
/* 83AEC 80082EEC 1040000D */  beqz       $v0, .L80082F24
/* 83AF0 80082EF0 00002821 */   addu      $a1, $zero, $zero
/* 83AF4 80082EF4 00403821 */  addu       $a3, $v0, $zero
/* 83AF8 80082EF8 8C630000 */  lw         $v1, ($v1)
.L80082EFC:
/* 83AFC 80082EFC 8C620000 */  lw         $v0, ($v1)
/* 83B00 80082F00 50400005 */  beql       $v0, $zero, .L80082F18
/* 83B04 80082F04 24A50001 */   addiu     $a1, $a1, 1
/* 83B08 80082F08 94420000 */  lhu        $v0, ($v0)
/* 83B0C 80082F0C 1046FFF2 */  beq        $v0, $a2, .L80082ED8
/* 83B10 80082F10 00000000 */   nop
/* 83B14 80082F14 24A50001 */  addiu      $a1, $a1, 1
.L80082F18:
/* 83B18 80082F18 00A7102B */  sltu       $v0, $a1, $a3
/* 83B1C 80082F1C 1440FFF7 */  bnez       $v0, .L80082EFC
/* 83B20 80082F20 24630004 */   addiu     $v1, $v1, 4
.L80082F24:
/* 83B24 80082F24 00001021 */  addu       $v0, $zero, $zero
.L80082F28:
/* 83B28 80082F28 8FBF0010 */  lw         $ra, 0x10($sp)
/* 83B2C 80082F2C 03E00008 */  jr         $ra
/* 83B30 80082F30 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dialoug_look_for_item
/* 83B34 80082F34 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 83B38 80082F38 AFB20018 */  sw         $s2, 0x18($sp)
/* 83B3C 80082F3C 00809021 */  addu       $s2, $a0, $zero
/* 83B40 80082F40 AFB10014 */  sw         $s1, 0x14($sp)
/* 83B44 80082F44 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 83B48 80082F48 AFBF001C */  sw         $ra, 0x1c($sp)
/* 83B4C 80082F4C AFB00010 */  sw         $s0, 0x10($sp)
/* 83B50 80082F50 8E440010 */  lw         $a0, 0x10($s2)
/* 83B54 80082F54 0C01F070 */  jal        has_item_func
/* 83B58 80082F58 02202821 */   addu      $a1, $s1, $zero
/* 83B5C 80082F5C 1040000A */  beqz       $v0, .L80082F88
/* 83B60 80082F60 02202821 */   addu      $a1, $s1, $zero
/* 83B64 80082F64 8E470010 */  lw         $a3, 0x10($s2)
/* 83B68 80082F68 8CE30000 */  lw         $v1, ($a3)
/* 83B6C 80082F6C 24060001 */  addiu      $a2, $zero, 1
/* 83B70 80082F70 84640038 */  lh         $a0, 0x38($v1)
/* 83B74 80082F74 8C62003C */  lw         $v0, 0x3c($v1)
/* 83B78 80082F78 0040F809 */  jalr       $v0
/* 83B7C 80082F7C 00E42021 */   addu      $a0, $a3, $a0
.L80082F80:
/* 83B80 80082F80 08020BED */  j          .L80082FB4
/* 83B84 80082F84 24020001 */   addiu     $v0, $zero, 1
.L80082F88:
/* 83B88 80082F88 00008021 */  addu       $s0, $zero, $zero
/* 83B8C 80082F8C 02402021 */  addu       $a0, $s2, $zero
.L80082F90:
/* 83B90 80082F90 02002821 */  addu       $a1, $s0, $zero
/* 83B94 80082F94 0C020B90 */  jal        func_80082E40
/* 83B98 80082F98 02203021 */   addu      $a2, $s1, $zero
/* 83B9C 80082F9C 1440FFF8 */  bnez       $v0, .L80082F80
/* 83BA0 80082FA0 26100001 */   addiu     $s0, $s0, 1
/* 83BA4 80082FA4 2E020004 */  sltiu      $v0, $s0, 4
/* 83BA8 80082FA8 1440FFF9 */  bnez       $v0, .L80082F90
/* 83BAC 80082FAC 02402021 */   addu      $a0, $s2, $zero
/* 83BB0 80082FB0 00001021 */  addu       $v0, $zero, $zero
.L80082FB4:
/* 83BB4 80082FB4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 83BB8 80082FB8 8FB20018 */  lw         $s2, 0x18($sp)
/* 83BBC 80082FBC 8FB10014 */  lw         $s1, 0x14($sp)
/* 83BC0 80082FC0 8FB00010 */  lw         $s0, 0x10($sp)
/* 83BC4 80082FC4 03E00008 */  jr         $ra
/* 83BC8 80082FC8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80082FCC
/* 83BCC 80082FCC 00801021 */  addu       $v0, $a0, $zero
/* 83BD0 80082FD0 10400005 */  beqz       $v0, .L80082FE8
/* 83BD4 80082FD4 30A4FFFF */   andi      $a0, $a1, 0xffff
/* 83BD8 80082FD8 94420000 */  lhu        $v0, ($v0)
/* 83BDC 80082FDC 00441026 */  xor        $v0, $v0, $a0
/* 83BE0 80082FE0 03E00008 */  jr         $ra
/* 83BE4 80082FE4 2C420001 */   sltiu     $v0, $v0, 1
.L80082FE8:
/* 83BE8 80082FE8 03E00008 */  jr         $ra
/* 83BEC 80082FEC 00001021 */   addu      $v0, $zero, $zero

glabel hasItem_eqquipped
/* 83BF0 80082FF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 83BF4 80082FF4 00052880 */  sll        $a1, $a1, 2
/* 83BF8 80082FF8 00852021 */  addu       $a0, $a0, $a1
/* 83BFC 80082FFC AFBF0010 */  sw         $ra, 0x10($sp)
/* 83C00 80083000 8C840000 */  lw         $a0, ($a0)
/* 83C04 80083004 10800005 */  beqz       $a0, .L8008301C
/* 83C08 80083008 30C5FFFF */   andi      $a1, $a2, 0xffff
/* 83C0C 8008300C 0C01ED0F */  jal        Has_Item_equipped_character
/* 83C10 80083010 00000000 */   nop
/* 83C14 80083014 08020C08 */  j          .L80083020
/* 83C18 80083018 0002102B */   sltu      $v0, $zero, $v0
.L8008301C:
/* 83C1C 8008301C 00001021 */  addu       $v0, $zero, $zero
.L80083020:
/* 83C20 80083020 8FBF0010 */  lw         $ra, 0x10($sp)
/* 83C24 80083024 03E00008 */  jr         $ra
/* 83C28 80083028 27BD0018 */   addiu     $sp, $sp, 0x18

glabel hasItem
/* 83C2C 8008302C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 83C30 80083030 AFB20018 */  sw         $s2, 0x18($sp)
/* 83C34 80083034 00809021 */  addu       $s2, $a0, $zero
/* 83C38 80083038 AFB10014 */  sw         $s1, 0x14($sp)
/* 83C3C 8008303C 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 83C40 80083040 AFBF001C */  sw         $ra, 0x1c($sp)
/* 83C44 80083044 AFB00010 */  sw         $s0, 0x10($sp)
/* 83C48 80083048 8E440010 */  lw         $a0, 0x10($s2)
/* 83C4C 8008304C 0C01F070 */  jal        has_item_func
/* 83C50 80083050 02202821 */   addu      $a1, $s1, $zero
/* 83C54 80083054 10400003 */  beqz       $v0, .L80083064
/* 83C58 80083058 00008021 */   addu      $s0, $zero, $zero
.L8008305C:
/* 83C5C 8008305C 08020C23 */  j          .L8008308C
/* 83C60 80083060 24020001 */   addiu     $v0, $zero, 1
.L80083064:
/* 83C64 80083064 02402021 */  addu       $a0, $s2, $zero
.L80083068:
/* 83C68 80083068 02002821 */  addu       $a1, $s0, $zero
/* 83C6C 8008306C 0C020BFC */  jal        hasItem_eqquipped
/* 83C70 80083070 02203021 */   addu      $a2, $s1, $zero
/* 83C74 80083074 1440FFF9 */  bnez       $v0, .L8008305C
/* 83C78 80083078 26100001 */   addiu     $s0, $s0, 1
/* 83C7C 8008307C 2E020004 */  sltiu      $v0, $s0, 4
/* 83C80 80083080 1440FFF9 */  bnez       $v0, .L80083068
/* 83C84 80083084 02402021 */   addu      $a0, $s2, $zero
/* 83C88 80083088 00001021 */  addu       $v0, $zero, $zero
.L8008308C:
/* 83C8C 8008308C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 83C90 80083090 8FB20018 */  lw         $s2, 0x18($sp)
/* 83C94 80083094 8FB10014 */  lw         $s1, 0x14($sp)
/* 83C98 80083098 8FB00010 */  lw         $s0, 0x10($sp)
/* 83C9C 8008309C 03E00008 */  jr         $ra
/* 83CA0 800830A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800830A4
/* 83CA4 800830A4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 83CA8 800830A8 AFB40028 */  sw         $s4, 0x28($sp)
/* 83CAC 800830AC 0080A021 */  addu       $s4, $a0, $zero
/* 83CB0 800830B0 AFB00018 */  sw         $s0, 0x18($sp)
/* 83CB4 800830B4 00C08021 */  addu       $s0, $a2, $zero
/* 83CB8 800830B8 AFB30024 */  sw         $s3, 0x24($sp)
/* 83CBC 800830BC 00E09821 */  addu       $s3, $a3, $zero
/* 83CC0 800830C0 02602021 */  addu       $a0, $s3, $zero
/* 83CC4 800830C4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 83CC8 800830C8 AFB20020 */  sw         $s2, 0x20($sp)
/* 83CCC 800830CC AFB1001C */  sw         $s1, 0x1c($sp)
/* 83CD0 800830D0 96120000 */  lhu        $s2, ($s0)
/* 83CD4 800830D4 93B10043 */  lbu        $s1, 0x43($sp)
/* 83CD8 800830D8 0C01E09C */  jal        something_with_gear_INT
/* 83CDC 800830DC 02402821 */   addu      $a1, $s2, $zero
/* 83CE0 800830E0 02802021 */  addu       $a0, $s4, $zero
/* 83CE4 800830E4 0C01F9E6 */  jal        func_8007E798
/* 83CE8 800830E8 00402821 */   addu      $a1, $v0, $zero
/* 83CEC 800830EC 1440003A */  bnez       $v0, .L800831D8
/* 83CF0 800830F0 8FBF002C */   lw        $ra, 0x2c($sp)
/* 83CF4 800830F4 00003021 */  addu       $a2, $zero, $zero
/* 83CF8 800830F8 8E650028 */  lw         $a1, 0x28($s3)
/* 83CFC 800830FC 00002021 */  addu       $a0, $zero, $zero
/* 83D00 80083100 90A30004 */  lbu        $v1, 4($a1)
/* 83D04 80083104 1060000F */  beqz       $v1, .L80083144
/* 83D08 80083108 00121202 */   srl       $v0, $s2, 8
/* 83D0C 8008310C 3048FFFF */  andi       $t0, $v0, 0xffff
/* 83D10 80083110 00603821 */  addu       $a3, $v1, $zero
/* 83D14 80083114 8CA30000 */  lw         $v1, ($a1)
.L80083118:
/* 83D18 80083118 8C620000 */  lw         $v0, ($v1)
/* 83D1C 8008311C 50400006 */  beql       $v0, $zero, .L80083138
/* 83D20 80083120 24C60001 */   addiu     $a2, $a2, 1
/* 83D24 80083124 94420000 */  lhu        $v0, ($v0)
/* 83D28 80083128 00021202 */  srl        $v0, $v0, 8
/* 83D2C 8008312C 50480001 */  beql       $v0, $t0, .L80083134
/* 83D30 80083130 24840001 */   addiu     $a0, $a0, 1
.L80083134:
/* 83D34 80083134 24C60001 */  addiu      $a2, $a2, 1
.L80083138:
/* 83D38 80083138 00C7102B */  sltu       $v0, $a2, $a3
/* 83D3C 8008313C 1440FFF6 */  bnez       $v0, .L80083118
/* 83D40 80083140 24630004 */   addiu     $v1, $v1, 4
.L80083144:
/* 83D44 80083144 0091102B */  sltu       $v0, $a0, $s1
/* 83D48 80083148 14400003 */  bnez       $v0, .L80083158
/* 83D4C 8008314C 00000000 */   nop
.L80083150:
/* 83D50 80083150 08020C75 */  j          .L800831D4
/* 83D54 80083154 24020001 */   addiu     $v0, $zero, 1
.L80083158:
/* 83D58 80083158 0C01F994 */  jal        create_2ByteArray
/* 83D5C 8008315C 8E04000C */   lw        $a0, 0xc($s0)
/* 83D60 80083160 8E060010 */  lw         $a2, 0x10($s0)
/* 83D64 80083164 00408021 */  addu       $s0, $v0, $zero
/* 83D68 80083168 10C00002 */  beqz       $a2, .L80083174
/* 83D6C 8008316C 2411FFFF */   addiu     $s1, $zero, -1
/* 83D70 80083170 80D10004 */  lb         $s1, 4($a2)
.L80083174:
/* 83D74 80083174 8E870010 */  lw         $a3, 0x10($s4)
/* 83D78 80083178 02402821 */  addu       $a1, $s2, $zero
/* 83D7C 8008317C 8CE30000 */  lw         $v1, ($a3)
/* 83D80 80083180 24060001 */  addiu      $a2, $zero, 1
/* 83D84 80083184 84640038 */  lh         $a0, 0x38($v1)
/* 83D88 80083188 8C62003C */  lw         $v0, 0x3c($v1)
/* 83D8C 8008318C 0040F809 */  jalr       $v0
/* 83D90 80083190 00E42021 */   addu      $a0, $a3, $a0
/* 83D94 80083194 54400009 */  bnel       $v0, $zero, .L800831BC
/* 83D98 80083198 AFB10010 */   sw        $s1, 0x10($sp)
/* 83D9C 8008319C 1200FFEC */  beqz       $s0, .L80083150
/* 83DA0 800831A0 02002021 */   addu      $a0, $s0, $zero
/* 83DA4 800831A4 3C05800E */  lui        $a1, %hi(D_800E0B20)
/* 83DA8 800831A8 24A50B20 */  addiu      $a1, $a1, %lo(D_800E0B20)
/* 83DAC 800831AC 0C02600C */  jal        Free
/* 83DB0 800831B0 240615A4 */   addiu     $a2, $zero, 0x15a4
/* 83DB4 800831B4 08020C75 */  j          .L800831D4
/* 83DB8 800831B8 24020001 */   addiu     $v0, $zero, 1
.L800831BC:
/* 83DBC 800831BC 02802021 */  addu       $a0, $s4, $zero
/* 83DC0 800831C0 02602821 */  addu       $a1, $s3, $zero
/* 83DC4 800831C4 02403021 */  addu       $a2, $s2, $zero
/* 83DC8 800831C8 0C01FC43 */  jal        func_8007F10C
/* 83DCC 800831CC 02003821 */   addu      $a3, $s0, $zero
/* 83DD0 800831D0 00001021 */  addu       $v0, $zero, $zero
.L800831D4:
/* 83DD4 800831D4 8FBF002C */  lw         $ra, 0x2c($sp)
.L800831D8:
/* 83DD8 800831D8 8FB40028 */  lw         $s4, 0x28($sp)
/* 83DDC 800831DC 8FB30024 */  lw         $s3, 0x24($sp)
/* 83DE0 800831E0 8FB20020 */  lw         $s2, 0x20($sp)
/* 83DE4 800831E4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 83DE8 800831E8 8FB00018 */  lw         $s0, 0x18($sp)
/* 83DEC 800831EC 03E00008 */  jr         $ra
/* 83DF0 800831F0 27BD0030 */   addiu     $sp, $sp, 0x30
/* 83DF4 800831F4 00000000 */  nop
/* 83DF8 800831F8 00000000 */  nop
/* 83DFC 800831FC 00000000 */  nop
