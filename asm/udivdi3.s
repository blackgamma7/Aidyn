.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel udivdi3
/* BE760 800BDB60 00E04821 */  addu       $t1, $a3, $zero
/* BE764 800BDB64 00C04021 */  addu       $t0, $a2, $zero
/* BE768 800BDB68 150000E8 */  bnez       $t0, .L800BDF0C
/* BE76C 800BDB6C 00A05821 */   addu      $t3, $a1, $zero
/* BE770 800BDB70 0089102B */  sltu       $v0, $a0, $t1
/* BE774 800BDB74 10400051 */  beqz       $v0, .L800BDCBC
/* BE778 800BDB78 3402FFFF */   ori       $v0, $zero, 0xffff
/* BE77C 800BDB7C 0049102B */  sltu       $v0, $v0, $t1
/* BE780 800BDB80 14400005 */  bnez       $v0, .L800BDB98
/* BE784 800BDB84 00E01821 */   addu      $v1, $a3, $zero
/* BE788 800BDB88 2D220100 */  sltiu      $v0, $t1, 0x100
/* BE78C 800BDB8C 38420001 */  xori       $v0, $v0, 1
/* BE790 800BDB90 0802F6EC */  j          .L800BDBB0
/* BE794 800BDB94 000240C0 */   sll       $t0, $v0, 3
.L800BDB98:
/* BE798 800BDB98 3C0200FF */  lui        $v0, 0xff
/* BE79C 800BDB9C 3442FFFF */  ori        $v0, $v0, 0xffff
/* BE7A0 800BDBA0 0049102B */  sltu       $v0, $v0, $t1
/* BE7A4 800BDBA4 14400002 */  bnez       $v0, .L800BDBB0
/* BE7A8 800BDBA8 24080018 */   addiu     $t0, $zero, 0x18
/* BE7AC 800BDBAC 24080010 */  addiu      $t0, $zero, 0x10
.L800BDBB0:
/* BE7B0 800BDBB0 3C02800E */  lui        $v0, %hi(udvid3Array)
/* BE7B4 800BDBB4 24424A90 */  addiu      $v0, $v0, %lo(udvid3Array)
/* BE7B8 800BDBB8 01031806 */  srlv       $v1, $v1, $t0
/* BE7BC 800BDBBC 00621821 */  addu       $v1, $v1, $v0
/* BE7C0 800BDBC0 90620000 */  lbu        $v0, ($v1)
/* BE7C4 800BDBC4 24050020 */  addiu      $a1, $zero, 0x20
/* BE7C8 800BDBC8 00481021 */  addu       $v0, $v0, $t0
/* BE7CC 800BDBCC 00A23023 */  subu       $a2, $a1, $v0
/* BE7D0 800BDBD0 10C00006 */  beqz       $a2, .L800BDBEC
/* BE7D4 800BDBD4 00C41804 */   sllv      $v1, $a0, $a2
/* BE7D8 800BDBD8 00C94804 */  sllv       $t1, $t1, $a2
/* BE7DC 800BDBDC 00A61023 */  subu       $v0, $a1, $a2
/* BE7E0 800BDBE0 004B1006 */  srlv       $v0, $t3, $v0
/* BE7E4 800BDBE4 00622025 */  or         $a0, $v1, $v0
/* BE7E8 800BDBE8 00CB5804 */  sllv       $t3, $t3, $a2
.L800BDBEC:
/* BE7EC 800BDBEC 00093402 */  srl        $a2, $t1, 0x10
/* BE7F0 800BDBF0 0086001B */  divu       $zero, $a0, $a2
/* BE7F4 800BDBF4 14C00002 */  bnez       $a2, .L800BDC00
/* BE7F8 800BDBF8 00000000 */   nop
/* BE7FC 800BDBFC 0007000D */  break      7
.L800BDC00:
/* BE800 800BDC00 00003812 */   mflo      $a3
/* BE804 800BDC04 00001810 */  mfhi       $v1
/* BE808 800BDC08 3128FFFF */  andi       $t0, $t1, 0xffff
/* BE80C 800BDC0C 00000000 */  nop
/* BE810 800BDC10 00E80018 */  mult       $a3, $t0
/* BE814 800BDC14 000B1402 */  srl        $v0, $t3, 0x10
/* BE818 800BDC18 00031C00 */  sll        $v1, $v1, 0x10
/* BE81C 800BDC1C 00621825 */  or         $v1, $v1, $v0
/* BE820 800BDC20 00002812 */  mflo       $a1
/* BE824 800BDC24 0065102B */  sltu       $v0, $v1, $a1
/* BE828 800BDC28 5040000B */  beql       $v0, $zero, .L800BDC58
/* BE82C 800BDC2C 00651823 */   subu      $v1, $v1, $a1
/* BE830 800BDC30 00691821 */  addu       $v1, $v1, $t1
/* BE834 800BDC34 0069102B */  sltu       $v0, $v1, $t1
/* BE838 800BDC38 14400006 */  bnez       $v0, .L800BDC54
/* BE83C 800BDC3C 24E7FFFF */   addiu     $a3, $a3, -1
/* BE840 800BDC40 0065102B */  sltu       $v0, $v1, $a1
/* BE844 800BDC44 50400004 */  beql       $v0, $zero, .L800BDC58
/* BE848 800BDC48 00651823 */   subu      $v1, $v1, $a1
/* BE84C 800BDC4C 24E7FFFF */  addiu      $a3, $a3, -1
/* BE850 800BDC50 00691821 */  addu       $v1, $v1, $t1
.L800BDC54:
/* BE854 800BDC54 00651823 */  subu       $v1, $v1, $a1
.L800BDC58:
/* BE858 800BDC58 0066001B */  divu       $zero, $v1, $a2
/* BE85C 800BDC5C 14C00002 */  bnez       $a2, .L800BDC68
/* BE860 800BDC60 00000000 */   nop
/* BE864 800BDC64 0007000D */  break      7
.L800BDC68:
/* BE868 800BDC68 00002012 */   mflo      $a0
/* BE86C 800BDC6C 00001810 */  mfhi       $v1
/* BE870 800BDC70 00000000 */  nop
/* BE874 800BDC74 00000000 */  nop
/* BE878 800BDC78 00880018 */  mult       $a0, $t0
/* BE87C 800BDC7C 3162FFFF */  andi       $v0, $t3, 0xffff
/* BE880 800BDC80 00031C00 */  sll        $v1, $v1, 0x10
/* BE884 800BDC84 00621825 */  or         $v1, $v1, $v0
/* BE888 800BDC88 00002812 */  mflo       $a1
/* BE88C 800BDC8C 0065102B */  sltu       $v0, $v1, $a1
/* BE890 800BDC90 10400007 */  beqz       $v0, .L800BDCB0
/* BE894 800BDC94 00691821 */   addu      $v1, $v1, $t1
/* BE898 800BDC98 0069102B */  sltu       $v0, $v1, $t1
/* BE89C 800BDC9C 14400004 */  bnez       $v0, .L800BDCB0
/* BE8A0 800BDCA0 2484FFFF */   addiu     $a0, $a0, -1
/* BE8A4 800BDCA4 0065102B */  sltu       $v0, $v1, $a1
/* BE8A8 800BDCA8 54400001 */  bnel       $v0, $zero, .L800BDCB0
/* BE8AC 800BDCAC 2484FFFF */   addiu     $a0, $a0, -1
.L800BDCB0:
/* BE8B0 800BDCB0 00071400 */  sll        $v0, $a3, 0x10
/* BE8B4 800BDCB4 0802F833 */  j          .L800BE0CC
/* BE8B8 800BDCB8 00443025 */   or        $a2, $v0, $a0
.L800BDCBC:
/* BE8BC 800BDCBC 15200009 */  bnez       $t1, .L800BDCE4
/* BE8C0 800BDCC0 0049102B */   sltu      $v0, $v0, $t1
/* BE8C4 800BDCC4 24020001 */  addiu      $v0, $zero, 1
/* BE8C8 800BDCC8 0048001B */  divu       $zero, $v0, $t0
/* BE8CC 800BDCCC 15000002 */  bnez       $t0, .L800BDCD8
/* BE8D0 800BDCD0 00000000 */   nop
/* BE8D4 800BDCD4 0007000D */  break      7
.L800BDCD8:
/* BE8D8 800BDCD8 00004812 */   mflo      $t1
/* BE8DC 800BDCDC 3402FFFF */  ori        $v0, $zero, 0xffff
/* BE8E0 800BDCE0 0049102B */  sltu       $v0, $v0, $t1
.L800BDCE4:
/* BE8E4 800BDCE4 14400005 */  bnez       $v0, .L800BDCFC
/* BE8E8 800BDCE8 01201821 */   addu      $v1, $t1, $zero
/* BE8EC 800BDCEC 2D220100 */  sltiu      $v0, $t1, 0x100
/* BE8F0 800BDCF0 38420001 */  xori       $v0, $v0, 1
/* BE8F4 800BDCF4 0802F745 */  j          .L800BDD14
/* BE8F8 800BDCF8 000230C0 */   sll       $a2, $v0, 3
.L800BDCFC:
/* BE8FC 800BDCFC 3C0200FF */  lui        $v0, 0xff
/* BE900 800BDD00 3442FFFF */  ori        $v0, $v0, 0xffff
/* BE904 800BDD04 0049102B */  sltu       $v0, $v0, $t1
/* BE908 800BDD08 14400002 */  bnez       $v0, .L800BDD14
/* BE90C 800BDD0C 24060018 */   addiu     $a2, $zero, 0x18
/* BE910 800BDD10 24060010 */  addiu      $a2, $zero, 0x10
.L800BDD14:
/* BE914 800BDD14 3C02800E */  lui        $v0, %hi(udvid3Array)
/* BE918 800BDD18 24424A90 */  addiu      $v0, $v0, %lo(udvid3Array)
/* BE91C 800BDD1C 00C31806 */  srlv       $v1, $v1, $a2
/* BE920 800BDD20 00621821 */  addu       $v1, $v1, $v0
/* BE924 800BDD24 90620000 */  lbu        $v0, ($v1)
/* BE928 800BDD28 24030020 */  addiu      $v1, $zero, 0x20
/* BE92C 800BDD2C 00461021 */  addu       $v0, $v0, $a2
/* BE930 800BDD30 00623023 */  subu       $a2, $v1, $v0
/* BE934 800BDD34 14C00004 */  bnez       $a2, .L800BDD48
/* BE938 800BDD38 00662823 */   subu      $a1, $v1, $a2
/* BE93C 800BDD3C 00892023 */  subu       $a0, $a0, $t1
/* BE940 800BDD40 0802F78F */  j          .L800BDE3C
/* BE944 800BDD44 240A0001 */   addiu     $t2, $zero, 1
.L800BDD48:
/* BE948 800BDD48 00C94804 */  sllv       $t1, $t1, $a2
/* BE94C 800BDD4C 00A43806 */  srlv       $a3, $a0, $a1
/* BE950 800BDD50 00C41804 */  sllv       $v1, $a0, $a2
/* BE954 800BDD54 00AB1006 */  srlv       $v0, $t3, $a1
/* BE958 800BDD58 00622025 */  or         $a0, $v1, $v0
/* BE95C 800BDD5C 00CB5804 */  sllv       $t3, $t3, $a2
/* BE960 800BDD60 00093402 */  srl        $a2, $t1, 0x10
/* BE964 800BDD64 00E6001B */  divu       $zero, $a3, $a2
/* BE968 800BDD68 14C00002 */  bnez       $a2, .L800BDD74
/* BE96C 800BDD6C 00000000 */   nop
/* BE970 800BDD70 0007000D */  break      7
.L800BDD74:
/* BE974 800BDD74 00004012 */   mflo      $t0
/* BE978 800BDD78 00001810 */  mfhi       $v1
/* BE97C 800BDD7C 3125FFFF */  andi       $a1, $t1, 0xffff
/* BE980 800BDD80 00000000 */  nop
/* BE984 800BDD84 01050018 */  mult       $t0, $a1
/* BE988 800BDD88 00041402 */  srl        $v0, $a0, 0x10
/* BE98C 800BDD8C 00031C00 */  sll        $v1, $v1, 0x10
/* BE990 800BDD90 00621825 */  or         $v1, $v1, $v0
/* BE994 800BDD94 00003812 */  mflo       $a3
/* BE998 800BDD98 0067102B */  sltu       $v0, $v1, $a3
/* BE99C 800BDD9C 5040000B */  beql       $v0, $zero, .L800BDDCC
/* BE9A0 800BDDA0 00671823 */   subu      $v1, $v1, $a3
/* BE9A4 800BDDA4 00691821 */  addu       $v1, $v1, $t1
/* BE9A8 800BDDA8 0069102B */  sltu       $v0, $v1, $t1
/* BE9AC 800BDDAC 14400006 */  bnez       $v0, .L800BDDC8
/* BE9B0 800BDDB0 2508FFFF */   addiu     $t0, $t0, -1
/* BE9B4 800BDDB4 0067102B */  sltu       $v0, $v1, $a3
/* BE9B8 800BDDB8 50400004 */  beql       $v0, $zero, .L800BDDCC
/* BE9BC 800BDDBC 00671823 */   subu      $v1, $v1, $a3
/* BE9C0 800BDDC0 2508FFFF */  addiu      $t0, $t0, -1
/* BE9C4 800BDDC4 00691821 */  addu       $v1, $v1, $t1
.L800BDDC8:
/* BE9C8 800BDDC8 00671823 */  subu       $v1, $v1, $a3
.L800BDDCC:
/* BE9CC 800BDDCC 0066001B */  divu       $zero, $v1, $a2
/* BE9D0 800BDDD0 14C00002 */  bnez       $a2, .L800BDDDC
/* BE9D4 800BDDD4 00000000 */   nop
/* BE9D8 800BDDD8 0007000D */  break      7
.L800BDDDC:
/* BE9DC 800BDDDC 00003012 */   mflo      $a2
/* BE9E0 800BDDE0 00001810 */  mfhi       $v1
/* BE9E4 800BDDE4 00000000 */  nop
/* BE9E8 800BDDE8 00000000 */  nop
/* BE9EC 800BDDEC 00C50018 */  mult       $a2, $a1
/* BE9F0 800BDDF0 3082FFFF */  andi       $v0, $a0, 0xffff
/* BE9F4 800BDDF4 00031C00 */  sll        $v1, $v1, 0x10
/* BE9F8 800BDDF8 00621825 */  or         $v1, $v1, $v0
/* BE9FC 800BDDFC 00003812 */  mflo       $a3
/* BEA00 800BDE00 0067102B */  sltu       $v0, $v1, $a3
/* BEA04 800BDE04 1040000B */  beqz       $v0, .L800BDE34
/* BEA08 800BDE08 00081400 */   sll       $v0, $t0, 0x10
/* BEA0C 800BDE0C 00691821 */  addu       $v1, $v1, $t1
/* BEA10 800BDE10 0069102B */  sltu       $v0, $v1, $t1
/* BEA14 800BDE14 14400006 */  bnez       $v0, .L800BDE30
/* BEA18 800BDE18 24C6FFFF */   addiu     $a2, $a2, -1
/* BEA1C 800BDE1C 0067102B */  sltu       $v0, $v1, $a3
/* BEA20 800BDE20 10400004 */  beqz       $v0, .L800BDE34
/* BEA24 800BDE24 00081400 */   sll       $v0, $t0, 0x10
/* BEA28 800BDE28 24C6FFFF */  addiu      $a2, $a2, -1
/* BEA2C 800BDE2C 00691821 */  addu       $v1, $v1, $t1
.L800BDE30:
/* BEA30 800BDE30 00081400 */  sll        $v0, $t0, 0x10
.L800BDE34:
/* BEA34 800BDE34 00465025 */  or         $t2, $v0, $a2
/* BEA38 800BDE38 00672023 */  subu       $a0, $v1, $a3
.L800BDE3C:
/* BEA3C 800BDE3C 00093402 */  srl        $a2, $t1, 0x10
/* BEA40 800BDE40 0086001B */  divu       $zero, $a0, $a2
/* BEA44 800BDE44 14C00002 */  bnez       $a2, .L800BDE50
/* BEA48 800BDE48 00000000 */   nop
/* BEA4C 800BDE4C 0007000D */  break      7
.L800BDE50:
/* BEA50 800BDE50 00003812 */   mflo      $a3
/* BEA54 800BDE54 00001810 */  mfhi       $v1
/* BEA58 800BDE58 3128FFFF */  andi       $t0, $t1, 0xffff
/* BEA5C 800BDE5C 00000000 */  nop
/* BEA60 800BDE60 00E80018 */  mult       $a3, $t0
/* BEA64 800BDE64 000B1402 */  srl        $v0, $t3, 0x10
/* BEA68 800BDE68 00031C00 */  sll        $v1, $v1, 0x10
/* BEA6C 800BDE6C 00621825 */  or         $v1, $v1, $v0
/* BEA70 800BDE70 00002812 */  mflo       $a1
/* BEA74 800BDE74 0065102B */  sltu       $v0, $v1, $a1
/* BEA78 800BDE78 5040000B */  beql       $v0, $zero, .L800BDEA8
/* BEA7C 800BDE7C 00651823 */   subu      $v1, $v1, $a1
/* BEA80 800BDE80 00691821 */  addu       $v1, $v1, $t1
/* BEA84 800BDE84 0069102B */  sltu       $v0, $v1, $t1
/* BEA88 800BDE88 14400006 */  bnez       $v0, .L800BDEA4
/* BEA8C 800BDE8C 24E7FFFF */   addiu     $a3, $a3, -1
/* BEA90 800BDE90 0065102B */  sltu       $v0, $v1, $a1
/* BEA94 800BDE94 50400004 */  beql       $v0, $zero, .L800BDEA8
/* BEA98 800BDE98 00651823 */   subu      $v1, $v1, $a1
/* BEA9C 800BDE9C 24E7FFFF */  addiu      $a3, $a3, -1
/* BEAA0 800BDEA0 00691821 */  addu       $v1, $v1, $t1
.L800BDEA4:
/* BEAA4 800BDEA4 00651823 */  subu       $v1, $v1, $a1
.L800BDEA8:
/* BEAA8 800BDEA8 0066001B */  divu       $zero, $v1, $a2
/* BEAAC 800BDEAC 14C00002 */  bnez       $a2, .L800BDEB8
/* BEAB0 800BDEB0 00000000 */   nop
/* BEAB4 800BDEB4 0007000D */  break      7
.L800BDEB8:
/* BEAB8 800BDEB8 00002012 */   mflo      $a0
/* BEABC 800BDEBC 00001810 */  mfhi       $v1
/* BEAC0 800BDEC0 00000000 */  nop
/* BEAC4 800BDEC4 00000000 */  nop
/* BEAC8 800BDEC8 00880018 */  mult       $a0, $t0
/* BEACC 800BDECC 3162FFFF */  andi       $v0, $t3, 0xffff
/* BEAD0 800BDED0 00031C00 */  sll        $v1, $v1, 0x10
/* BEAD4 800BDED4 00621825 */  or         $v1, $v1, $v0
/* BEAD8 800BDED8 00002812 */  mflo       $a1
/* BEADC 800BDEDC 0065102B */  sltu       $v0, $v1, $a1
/* BEAE0 800BDEE0 10400007 */  beqz       $v0, .L800BDF00
/* BEAE4 800BDEE4 00691821 */   addu      $v1, $v1, $t1
/* BEAE8 800BDEE8 0069102B */  sltu       $v0, $v1, $t1
/* BEAEC 800BDEEC 14400004 */  bnez       $v0, .L800BDF00
/* BEAF0 800BDEF0 2484FFFF */   addiu     $a0, $a0, -1
/* BEAF4 800BDEF4 0065102B */  sltu       $v0, $v1, $a1
/* BEAF8 800BDEF8 54400001 */  bnel       $v0, $zero, .L800BDF00
/* BEAFC 800BDEFC 2484FFFF */   addiu     $a0, $a0, -1
.L800BDF00:
/* BEB00 800BDF00 00071400 */  sll        $v0, $a3, 0x10
/* BEB04 800BDF04 0802F834 */  j          .L800BE0D0
/* BEB08 800BDF08 00443025 */   or        $a2, $v0, $a0
.L800BDF0C:
/* BEB0C 800BDF0C 0088102B */  sltu       $v0, $a0, $t0
/* BEB10 800BDF10 10400003 */  beqz       $v0, .L800BDF20
/* BEB14 800BDF14 3402FFFF */   ori       $v0, $zero, 0xffff
/* BEB18 800BDF18 0802F833 */  j          .L800BE0CC
/* BEB1C 800BDF1C 00003021 */   addu      $a2, $zero, $zero
.L800BDF20:
/* BEB20 800BDF20 0048102B */  sltu       $v0, $v0, $t0
/* BEB24 800BDF24 14400005 */  bnez       $v0, .L800BDF3C
/* BEB28 800BDF28 01001821 */   addu      $v1, $t0, $zero
/* BEB2C 800BDF2C 2D020100 */  sltiu      $v0, $t0, 0x100
/* BEB30 800BDF30 38420001 */  xori       $v0, $v0, 1
/* BEB34 800BDF34 0802F7D5 */  j          .L800BDF54
/* BEB38 800BDF38 000230C0 */   sll       $a2, $v0, 3
.L800BDF3C:
/* BEB3C 800BDF3C 3C0200FF */  lui        $v0, 0xff
/* BEB40 800BDF40 3442FFFF */  ori        $v0, $v0, 0xffff
/* BEB44 800BDF44 0048102B */  sltu       $v0, $v0, $t0
/* BEB48 800BDF48 14400002 */  bnez       $v0, .L800BDF54
/* BEB4C 800BDF4C 24060018 */   addiu     $a2, $zero, 0x18
/* BEB50 800BDF50 24060010 */  addiu      $a2, $zero, 0x10
.L800BDF54:
/* BEB54 800BDF54 3C02800E */  lui        $v0, %hi(udvid3Array)
/* BEB58 800BDF58 24424A90 */  addiu      $v0, $v0, %lo(udvid3Array)
/* BEB5C 800BDF5C 00C31806 */  srlv       $v1, $v1, $a2
/* BEB60 800BDF60 00621821 */  addu       $v1, $v1, $v0
/* BEB64 800BDF64 90620000 */  lbu        $v0, ($v1)
/* BEB68 800BDF68 24030020 */  addiu      $v1, $zero, 0x20
/* BEB6C 800BDF6C 00461021 */  addu       $v0, $v0, $a2
/* BEB70 800BDF70 00623023 */  subu       $a2, $v1, $v0
/* BEB74 800BDF74 14C00009 */  bnez       $a2, .L800BDF9C
/* BEB78 800BDF78 00662823 */   subu      $a1, $v1, $a2
/* BEB7C 800BDF7C 0104102B */  sltu       $v0, $t0, $a0
/* BEB80 800BDF80 14400052 */  bnez       $v0, .L800BE0CC
/* BEB84 800BDF84 24060001 */   addiu     $a2, $zero, 1
/* BEB88 800BDF88 0169102B */  sltu       $v0, $t3, $t1
/* BEB8C 800BDF8C 1440004F */  bnez       $v0, .L800BE0CC
/* BEB90 800BDF90 00003021 */   addu      $a2, $zero, $zero
/* BEB94 800BDF94 0802F833 */  j          .L800BE0CC
/* BEB98 800BDF98 24060001 */   addiu     $a2, $zero, 1
.L800BDF9C:
/* BEB9C 800BDF9C 00C81804 */  sllv       $v1, $t0, $a2
/* BEBA0 800BDFA0 00A91006 */  srlv       $v0, $t1, $a1
/* BEBA4 800BDFA4 00624025 */  or         $t0, $v1, $v0
/* BEBA8 800BDFA8 00C94804 */  sllv       $t1, $t1, $a2
/* BEBAC 800BDFAC 00A43806 */  srlv       $a3, $a0, $a1
/* BEBB0 800BDFB0 00C41804 */  sllv       $v1, $a0, $a2
/* BEBB4 800BDFB4 00AB1006 */  srlv       $v0, $t3, $a1
/* BEBB8 800BDFB8 00622025 */  or         $a0, $v1, $v0
/* BEBBC 800BDFBC 00CB5804 */  sllv       $t3, $t3, $a2
/* BEBC0 800BDFC0 00083402 */  srl        $a2, $t0, 0x10
/* BEBC4 800BDFC4 00E6001B */  divu       $zero, $a3, $a2
/* BEBC8 800BDFC8 14C00002 */  bnez       $a2, .L800BDFD4
/* BEBCC 800BDFCC 00000000 */   nop
/* BEBD0 800BDFD0 0007000D */  break      7
.L800BDFD4:
/* BEBD4 800BDFD4 00005012 */   mflo      $t2
/* BEBD8 800BDFD8 00001810 */  mfhi       $v1
/* BEBDC 800BDFDC 3105FFFF */  andi       $a1, $t0, 0xffff
/* BEBE0 800BDFE0 00000000 */  nop
/* BEBE4 800BDFE4 01450018 */  mult       $t2, $a1
/* BEBE8 800BDFE8 00041402 */  srl        $v0, $a0, 0x10
/* BEBEC 800BDFEC 00031C00 */  sll        $v1, $v1, 0x10
/* BEBF0 800BDFF0 00621825 */  or         $v1, $v1, $v0
/* BEBF4 800BDFF4 00003812 */  mflo       $a3
/* BEBF8 800BDFF8 0067102B */  sltu       $v0, $v1, $a3
/* BEBFC 800BDFFC 5040000B */  beql       $v0, $zero, .L800BE02C
/* BEC00 800BE000 00671823 */   subu      $v1, $v1, $a3
/* BEC04 800BE004 00681821 */  addu       $v1, $v1, $t0
/* BEC08 800BE008 0068102B */  sltu       $v0, $v1, $t0
/* BEC0C 800BE00C 14400006 */  bnez       $v0, .L800BE028
/* BEC10 800BE010 254AFFFF */   addiu     $t2, $t2, -1
/* BEC14 800BE014 0067102B */  sltu       $v0, $v1, $a3
/* BEC18 800BE018 50400004 */  beql       $v0, $zero, .L800BE02C
/* BEC1C 800BE01C 00671823 */   subu      $v1, $v1, $a3
/* BEC20 800BE020 254AFFFF */  addiu      $t2, $t2, -1
/* BEC24 800BE024 00681821 */  addu       $v1, $v1, $t0
.L800BE028:
/* BEC28 800BE028 00671823 */  subu       $v1, $v1, $a3
.L800BE02C:
/* BEC2C 800BE02C 0066001B */  divu       $zero, $v1, $a2
/* BEC30 800BE030 14C00002 */  bnez       $a2, .L800BE03C
/* BEC34 800BE034 00000000 */   nop
/* BEC38 800BE038 0007000D */  break      7
.L800BE03C:
/* BEC3C 800BE03C 00003012 */   mflo      $a2
/* BEC40 800BE040 00001810 */  mfhi       $v1
/* BEC44 800BE044 00000000 */  nop
/* BEC48 800BE048 00000000 */  nop
/* BEC4C 800BE04C 00C50018 */  mult       $a2, $a1
/* BEC50 800BE050 3082FFFF */  andi       $v0, $a0, 0xffff
/* BEC54 800BE054 00031C00 */  sll        $v1, $v1, 0x10
/* BEC58 800BE058 00621825 */  or         $v1, $v1, $v0
/* BEC5C 800BE05C 00003812 */  mflo       $a3
/* BEC60 800BE060 0067102B */  sltu       $v0, $v1, $a3
/* BEC64 800BE064 1040000B */  beqz       $v0, .L800BE094
/* BEC68 800BE068 000A1400 */   sll       $v0, $t2, 0x10
/* BEC6C 800BE06C 00681821 */  addu       $v1, $v1, $t0
/* BEC70 800BE070 0068102B */  sltu       $v0, $v1, $t0
/* BEC74 800BE074 14400006 */  bnez       $v0, .L800BE090
/* BEC78 800BE078 24C6FFFF */   addiu     $a2, $a2, -1
/* BEC7C 800BE07C 0067102B */  sltu       $v0, $v1, $a3
/* BEC80 800BE080 10400004 */  beqz       $v0, .L800BE094
/* BEC84 800BE084 000A1400 */   sll       $v0, $t2, 0x10
/* BEC88 800BE088 24C6FFFF */  addiu      $a2, $a2, -1
/* BEC8C 800BE08C 00681821 */  addu       $v1, $v1, $t0
.L800BE090:
/* BEC90 800BE090 000A1400 */  sll        $v0, $t2, 0x10
.L800BE094:
/* BEC94 800BE094 00463025 */  or         $a2, $v0, $a2
/* BEC98 800BE098 00672023 */  subu       $a0, $v1, $a3
/* BEC9C 800BE09C 00C90019 */  multu      $a2, $t1
/* BECA0 800BE0A0 00001810 */  mfhi       $v1
/* BECA4 800BE0A4 0083102B */  sltu       $v0, $a0, $v1
/* BECA8 800BE0A8 00004012 */  mflo       $t0
/* BECAC 800BE0AC 54400007 */  bnel       $v0, $zero, .L800BE0CC
/* BECB0 800BE0B0 24C6FFFF */   addiu     $a2, $a2, -1
/* BECB4 800BE0B4 14640006 */  bne        $v1, $a0, .L800BE0D0
/* BECB8 800BE0B8 00005021 */   addu      $t2, $zero, $zero
/* BECBC 800BE0BC 0168102B */  sltu       $v0, $t3, $t0
/* BECC0 800BE0C0 10400004 */  beqz       $v0, .L800BE0D4
/* BECC4 800BE0C4 00C06821 */   addu      $t5, $a2, $zero
/* BECC8 800BE0C8 24C6FFFF */  addiu      $a2, $a2, -1
.L800BE0CC:
/* BECCC 800BE0CC 00005021 */  addu       $t2, $zero, $zero
.L800BE0D0:
/* BECD0 800BE0D0 00C06821 */  addu       $t5, $a2, $zero
.L800BE0D4:
/* BECD4 800BE0D4 01406021 */  addu       $t4, $t2, $zero
/* BECD8 800BE0D8 01801021 */  addu       $v0, $t4, $zero
/* BECDC 800BE0DC 03E00008 */  jr         $ra
/* BECE0 800BE0E0 01A01821 */   addu      $v1, $t5, $zero
/* BECE4 800BE0E4 00000000 */  nop
/* BECE8 800BE0E8 00000000 */  nop
/* BECEC 800BE0EC 00000000 */  nop
