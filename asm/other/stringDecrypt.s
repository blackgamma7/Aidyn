.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel decrypt_sub_a
/* D61E0 800D55E0 00051202 */  srl        $v0, $a1, 8
/* D61E4 800D55E4 308400FF */  andi       $a0, $a0, 0xff
/* D61E8 800D55E8 304200FF */  andi       $v0, $v0, 0xff
/* D61EC 800D55EC 00441021 */  addu       $v0, $v0, $a0
/* D61F0 800D55F0 304200FF */  andi       $v0, $v0, 0xff
/* D61F4 800D55F4 03E00008 */  jr         $ra
/* D61F8 800D55F8 38420080 */   xori      $v0, $v0, 0x80

glabel decrypt_sub_b
/* D61FC 800D55FC 308400FF */  andi       $a0, $a0, 0xff
/* D6200 800D5600 30A200FF */  andi       $v0, $a1, 0xff
/* D6204 800D5604 00441023 */  subu       $v0, $v0, $a0
/* D6208 800D5608 304200FF */  andi       $v0, $v0, 0xff
/* D620C 800D560C 03E00008 */  jr         $ra
/* D6210 800D5610 38420002 */   xori      $v0, $v0, 2

glabel decrypt_func_a
/* D6214 800D5614 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D6218 800D5618 AFB20018 */  sw         $s2, 0x18($sp)
/* D621C 800D561C 00809021 */  addu       $s2, $a0, $zero
/* D6220 800D5620 AFB10014 */  sw         $s1, 0x14($sp)
/* D6224 800D5624 30B100FF */  andi       $s1, $a1, 0xff
/* D6228 800D5628 02202021 */  addu       $a0, $s1, $zero
/* D622C 800D562C AFB00010 */  sw         $s0, 0x10($sp)
/* D6230 800D5630 30D0FFFF */  andi       $s0, $a2, 0xffff
/* D6234 800D5634 AFBF001C */  sw         $ra, 0x1c($sp)
/* D6238 800D5638 0C035578 */  jal        decrypt_sub_a
/* D623C 800D563C 02002821 */   addu      $a1, $s0, $zero
/* D6240 800D5640 02202021 */  addu       $a0, $s1, $zero
/* D6244 800D5644 02002821 */  addu       $a1, $s0, $zero
/* D6248 800D5648 0C03557F */  jal        decrypt_sub_b
/* D624C 800D564C 00408021 */   addu      $s0, $v0, $zero
/* D6250 800D5650 00402021 */  addu       $a0, $v0, $zero
/* D6254 800D5654 00001821 */  addu       $v1, $zero, $zero
/* D6258 800D5658 24070001 */  addiu      $a3, $zero, 1
/* D625C 800D565C 3C050001 */  lui        $a1, 1
/* D6260 800D5660 3C060001 */  lui        $a2, 1
.L800D5664:
/* D6264 800D5664 000317C2 */  srl        $v0, $v1, 0x1f
/* D6268 800D5668 00621021 */  addu       $v0, $v1, $v0
/* D626C 800D566C 00021043 */  sra        $v0, $v0, 1
/* D6270 800D5670 00021040 */  sll        $v0, $v0, 1
/* D6274 800D5674 00621023 */  subu       $v0, $v1, $v0
/* D6278 800D5678 00021400 */  sll        $v0, $v0, 0x10
/* D627C 800D567C 00021403 */  sra        $v0, $v0, 0x10
/* D6280 800D5680 50400005 */  beql       $v0, $zero, .L800D5698
/* D6284 800D5684 92420000 */   lbu       $v0, ($s2)
/* D6288 800D5688 10470006 */  beq        $v0, $a3, .L800D56A4
/* D628C 800D568C 00A01821 */   addu      $v1, $a1, $zero
/* D6290 800D5690 080355AF */  j          .L800D56BC
/* D6294 800D5694 00A62821 */   addu      $a1, $a1, $a2
.L800D5698:
/* D6298 800D5698 02021021 */  addu       $v0, $s0, $v0
/* D629C 800D569C 080355AC */  j          .L800D56B0
/* D62A0 800D56A0 00821026 */   xor       $v0, $a0, $v0
.L800D56A4:
/* D62A4 800D56A4 92420000 */  lbu        $v0, ($s2)
/* D62A8 800D56A8 00441023 */  subu       $v0, $v0, $a0
/* D62AC 800D56AC 02021026 */  xor        $v0, $s0, $v0
.L800D56B0:
/* D62B0 800D56B0 A2420000 */  sb         $v0, ($s2)
/* D62B4 800D56B4 00A01821 */  addu       $v1, $a1, $zero
/* D62B8 800D56B8 00A62821 */  addu       $a1, $a1, $a2
.L800D56BC:
/* D62BC 800D56BC 00031C03 */  sra        $v1, $v1, 0x10
/* D62C0 800D56C0 28620010 */  slti       $v0, $v1, 0x10
/* D62C4 800D56C4 1440FFE7 */  bnez       $v0, .L800D5664
/* D62C8 800D56C8 26520001 */   addiu     $s2, $s2, 1
/* D62CC 800D56CC 8FBF001C */  lw         $ra, 0x1c($sp)
/* D62D0 800D56D0 8FB20018 */  lw         $s2, 0x18($sp)
/* D62D4 800D56D4 8FB10014 */  lw         $s1, 0x14($sp)
/* D62D8 800D56D8 8FB00010 */  lw         $s0, 0x10($sp)
/* D62DC 800D56DC 03E00008 */  jr         $ra
/* D62E0 800D56E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel decrypt_ofunc_2
/* D62E4 800D56E4 00805021 */  addu       $t2, $a0, $zero
/* D62E8 800D56E8 00004821 */  addu       $t1, $zero, $zero
/* D62EC 800D56EC 00063400 */  sll        $a2, $a2, 0x10
/* D62F0 800D56F0 3C02FFFF */  lui        $v0, 0xffff
/* D62F4 800D56F4 00C23021 */  addu       $a2, $a2, $v0
/* D62F8 800D56F8 00063403 */  sra        $a2, $a2, 0x10
/* D62FC 800D56FC 2402FFFF */  addiu      $v0, $zero, -1
/* D6300 800D5700 10C20036 */  beq        $a2, $v0, .L800D57DC
/* D6304 800D5704 00A06021 */   addu      $t4, $a1, $zero
/* D6308 800D5708 240EFFFF */  addiu      $t6, $zero, -1
/* D630C 800D570C 00061C00 */  sll        $v1, $a2, 0x10
/* D6310 800D5710 3C02FFFF */  lui        $v0, 0xffff
/* D6314 800D5714 00625821 */  addu       $t3, $v1, $v0
/* D6318 800D5718 3C0DFFFF */  lui        $t5, 0xffff
.L800D571C:
/* D631C 800D571C 05210002 */  bgez       $t1, .L800D5728
/* D6320 800D5720 01201021 */   addu      $v0, $t1, $zero
/* D6324 800D5724 2522000F */  addiu      $v0, $t1, 0xf
.L800D5728:
/* D6328 800D5728 00021103 */  sra        $v0, $v0, 4
/* D632C 800D572C 00021100 */  sll        $v0, $v0, 4
/* D6330 800D5730 01221023 */  subu       $v0, $t1, $v0
/* D6334 800D5734 00021400 */  sll        $v0, $v0, 0x10
/* D6338 800D5738 00021403 */  sra        $v0, $v0, 0x10
/* D633C 800D573C 01821021 */  addu       $v0, $t4, $v0
/* D6340 800D5740 25280001 */  addiu      $t0, $t1, 1
/* D6344 800D5744 91440000 */  lbu        $a0, ($t2)
/* D6348 800D5748 90430000 */  lbu        $v1, ($v0)
/* D634C 800D574C 01001021 */  addu       $v0, $t0, $zero
/* D6350 800D5750 00831821 */  addu       $v1, $a0, $v1
/* D6354 800D5754 05010002 */  bgez       $t0, .L800D5760
/* D6358 800D5758 A1430000 */   sb        $v1, ($t2)
/* D635C 800D575C 25220010 */  addiu      $v0, $t1, 0x10
.L800D5760:
/* D6360 800D5760 00021103 */  sra        $v0, $v0, 4
/* D6364 800D5764 00021100 */  sll        $v0, $v0, 4
/* D6368 800D5768 01021023 */  subu       $v0, $t0, $v0
/* D636C 800D576C 01823821 */  addu       $a3, $t4, $v0
/* D6370 800D5770 25250002 */  addiu      $a1, $t1, 2
/* D6374 800D5774 90E20000 */  lbu        $v0, ($a3)
/* D6378 800D5778 00A02021 */  addu       $a0, $a1, $zero
/* D637C 800D577C 00621023 */  subu       $v0, $v1, $v0
/* D6380 800D5780 04A10002 */  bgez       $a1, .L800D578C
/* D6384 800D5784 A1420000 */   sb        $v0, ($t2)
/* D6388 800D5788 25240011 */  addiu      $a0, $t1, 0x11
.L800D578C:
/* D638C 800D578C 00042103 */  sra        $a0, $a0, 4
/* D6390 800D5790 00042100 */  sll        $a0, $a0, 4
/* D6394 800D5794 00A42023 */  subu       $a0, $a1, $a0
/* D6398 800D5798 01842021 */  addu       $a0, $t4, $a0
/* D639C 800D579C 01602821 */  addu       $a1, $t3, $zero
/* D63A0 800D57A0 016D5821 */  addu       $t3, $t3, $t5
/* D63A4 800D57A4 90830000 */  lbu        $v1, ($a0)
/* D63A8 800D57A8 00053403 */  sra        $a2, $a1, 0x10
/* D63AC 800D57AC 00431826 */  xor        $v1, $v0, $v1
/* D63B0 800D57B0 A1430000 */  sb         $v1, ($t2)
/* D63B4 800D57B4 90E20000 */  lbu        $v0, ($a3)
/* D63B8 800D57B8 254A0001 */  addiu      $t2, $t2, 1
/* D63BC 800D57BC 00431026 */  xor        $v0, $v0, $v1
/* D63C0 800D57C0 A0E20000 */  sb         $v0, ($a3)
/* D63C4 800D57C4 90830000 */  lbu        $v1, ($a0)
/* D63C8 800D57C8 00081400 */  sll        $v0, $t0, 0x10
/* D63CC 800D57CC 00691826 */  xor        $v1, $v1, $t1
/* D63D0 800D57D0 00024C03 */  sra        $t1, $v0, 0x10
/* D63D4 800D57D4 14CEFFD1 */  bne        $a2, $t6, .L800D571C
/* D63D8 800D57D8 A0830000 */   sb        $v1, ($a0)
.L800D57DC:
/* D63DC 800D57DC 03E00008 */  jr         $ra
/* D63E0 800D57E0 00000000 */   nop

glabel decrypt_func_b
/* D63E4 800D57E4 00805821 */  addu       $t3, $a0, $zero
/* D63E8 800D57E8 00063400 */  sll        $a2, $a2, 0x10
/* D63EC 800D57EC 3C02FFFF */  lui        $v0, 0xffff
/* D63F0 800D57F0 00C23021 */  addu       $a2, $a2, $v0
/* D63F4 800D57F4 00062403 */  sra        $a0, $a2, 0x10
/* D63F8 800D57F8 2402FFFF */  addiu      $v0, $zero, -1
/* D63FC 800D57FC 10820036 */  beq        $a0, $v0, .L800D58D8
/* D6400 800D5800 00005021 */   addu      $t2, $zero, $zero
/* D6404 800D5804 240FFFFF */  addiu      $t7, $zero, -1
/* D6408 800D5808 00041C00 */  sll        $v1, $a0, 0x10
/* D640C 800D580C 3C02FFFF */  lui        $v0, 0xffff
/* D6410 800D5810 00623021 */  addu       $a2, $v1, $v0
/* D6414 800D5814 3C0EFFFF */  lui        $t6, 0xffff
.L800D5818:
/* D6418 800D5818 25430002 */  addiu      $v1, $t2, 2
/* D641C 800D581C 00601021 */  addu       $v0, $v1, $zero
/* D6420 800D5820 04610002 */  bgez       $v1, .L800D582C
/* D6424 800D5824 916D0000 */   lbu       $t5, ($t3)
/* D6428 800D5828 25420011 */  addiu      $v0, $t2, 0x11
.L800D582C:
/* D642C 800D582C 00021103 */  sra        $v0, $v0, 4
/* D6430 800D5830 00021100 */  sll        $v0, $v0, 4
/* D6434 800D5834 00621023 */  subu       $v0, $v1, $v0
/* D6438 800D5838 00A26021 */  addu       $t4, $a1, $v0
/* D643C 800D583C 25490001 */  addiu      $t1, $t2, 1
/* D6440 800D5840 91820000 */  lbu        $v0, ($t4)
/* D6444 800D5844 01201821 */  addu       $v1, $t1, $zero
/* D6448 800D5848 01A22026 */  xor        $a0, $t5, $v0
/* D644C 800D584C 05210002 */  bgez       $t1, .L800D5858
/* D6450 800D5850 A1640000 */   sb        $a0, ($t3)
/* D6454 800D5854 25430010 */  addiu      $v1, $t2, 0x10
.L800D5858:
/* D6458 800D5858 00031103 */  sra        $v0, $v1, 4
/* D645C 800D585C 00021100 */  sll        $v0, $v0, 4
/* D6460 800D5860 01221023 */  subu       $v0, $t1, $v0
/* D6464 800D5864 00A23821 */  addu       $a3, $a1, $v0
/* D6468 800D5868 90E30000 */  lbu        $v1, ($a3)
/* D646C 800D586C 01401021 */  addu       $v0, $t2, $zero
/* D6470 800D5870 00834021 */  addu       $t0, $a0, $v1
/* D6474 800D5874 05410002 */  bgez       $t2, .L800D5880
/* D6478 800D5878 A1680000 */   sb        $t0, ($t3)
/* D647C 800D587C 2542000F */  addiu      $v0, $t2, 0xf
.L800D5880:
/* D6480 800D5880 00021103 */  sra        $v0, $v0, 4
/* D6484 800D5884 00021100 */  sll        $v0, $v0, 4
/* D6488 800D5888 01421023 */  subu       $v0, $t2, $v0
/* D648C 800D588C 00021400 */  sll        $v0, $v0, 0x10
/* D6490 800D5890 00021403 */  sra        $v0, $v0, 0x10
/* D6494 800D5894 00A21021 */  addu       $v0, $a1, $v0
/* D6498 800D5898 00C02021 */  addu       $a0, $a2, $zero
/* D649C 800D589C 00CE3021 */  addu       $a2, $a2, $t6
/* D64A0 800D58A0 90430000 */  lbu        $v1, ($v0)
/* D64A4 800D58A4 00042403 */  sra        $a0, $a0, 0x10
/* D64A8 800D58A8 01031823 */  subu       $v1, $t0, $v1
/* D64AC 800D58AC A1630000 */  sb         $v1, ($t3)
/* D64B0 800D58B0 90E20000 */  lbu        $v0, ($a3)
/* D64B4 800D58B4 256B0001 */  addiu      $t3, $t3, 1
/* D64B8 800D58B8 01A21026 */  xor        $v0, $t5, $v0
/* D64BC 800D58BC A0E20000 */  sb         $v0, ($a3)
/* D64C0 800D58C0 91830000 */  lbu        $v1, ($t4)
/* D64C4 800D58C4 00091400 */  sll        $v0, $t1, 0x10
/* D64C8 800D58C8 006A1826 */  xor        $v1, $v1, $t2
/* D64CC 800D58CC 00025403 */  sra        $t2, $v0, 0x10
/* D64D0 800D58D0 148FFFD1 */  bne        $a0, $t7, .L800D5818
/* D64D4 800D58D4 A1830000 */   sb        $v1, ($t4)
.L800D58D8:
/* D64D8 800D58D8 03E00008 */  jr         $ra
/* D64DC 800D58DC 00000000 */   nop

glabel Ofunc_decrypt
/* D64E0 800D58E0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* D64E4 800D58E4 AFB10054 */  sw         $s1, 0x54($sp)
/* D64E8 800D58E8 00808821 */  addu       $s1, $a0, $zero
/* D64EC 800D58EC 30A500FF */  andi       $a1, $a1, 0xff
/* D64F0 800D58F0 30C6FFFF */  andi       $a2, $a2, 0xffff
/* D64F4 800D58F4 00073C00 */  sll        $a3, $a3, 0x10
/* D64F8 800D58F8 AFB00050 */  sw         $s0, 0x50($sp)
/* D64FC 800D58FC 00078403 */  sra        $s0, $a3, 0x10
/* D6500 800D5900 3C02800E */  lui        $v0, %hi(stringKey)
/* D6504 800D5904 AFBF0058 */  sw         $ra, 0x58($sp)
/* D6508 800D5908 24484EC0 */  addiu      $t0, $v0, %lo(stringKey)
/* D650C 800D590C 89030000 */  lwl        $v1, ($t0)
/* D6510 800D5910 99030003 */  lwr        $v1, 3($t0)
/* D6514 800D5914 89040004 */  lwl        $a0, 4($t0)
/* D6518 800D5918 99040007 */  lwr        $a0, 7($t0)
/* D651C 800D591C 89070008 */  lwl        $a3, 8($t0)
/* D6520 800D5920 9907000B */  lwr        $a3, 0xb($t0)
/* D6524 800D5924 ABA30010 */  swl        $v1, 0x10($sp)
/* D6528 800D5928 BBA30013 */  swr        $v1, 0x13($sp)
/* D652C 800D592C ABA40014 */  swl        $a0, 0x14($sp)
/* D6530 800D5930 BBA40017 */  swr        $a0, 0x17($sp)
/* D6534 800D5934 ABA70018 */  swl        $a3, 0x18($sp)
/* D6538 800D5938 BBA7001B */  swr        $a3, 0x1b($sp)
/* D653C 800D593C 8903000C */  lwl        $v1, 0xc($t0)
/* D6540 800D5940 9903000F */  lwr        $v1, 0xf($t0)
/* D6544 800D5944 ABA3001C */  swl        $v1, 0x1c($sp)
/* D6548 800D5948 BBA3001F */  swr        $v1, 0x1f($sp)
/* D654C 800D594C 00003821 */  addu       $a3, $zero, $zero
/* D6550 800D5950 27A80010 */  addiu      $t0, $sp, 0x10
.L800D5954:
/* D6554 800D5954 01072021 */  addu       $a0, $t0, $a3
/* D6558 800D5958 24E30001 */  addiu      $v1, $a3, 1
/* D655C 800D595C 306700FF */  andi       $a3, $v1, 0xff
/* D6560 800D5960 90820000 */  lbu        $v0, ($a0)
/* D6564 800D5964 2CE30010 */  sltiu      $v1, $a3, 0x10
/* D6568 800D5968 3842007F */  xori       $v0, $v0, 0x7f
/* D656C 800D596C 1460FFF9 */  bnez       $v1, .L800D5954
/* D6570 800D5970 A0820000 */   sb        $v0, ($a0)
/* D6574 800D5974 0C035585 */  jal        decrypt_func_a
/* D6578 800D5978 27A40010 */   addiu     $a0, $sp, 0x10
/* D657C 800D597C 02202021 */  addu       $a0, $s1, $zero
/* D6580 800D5980 27A50010 */  addiu      $a1, $sp, 0x10
/* D6584 800D5984 0C0355B9 */  jal        decrypt_ofunc_2
/* D6588 800D5988 02003021 */   addu      $a2, $s0, $zero
/* D658C 800D598C 02201021 */  addu       $v0, $s1, $zero
/* D6590 800D5990 8FBF0058 */  lw         $ra, 0x58($sp)
/* D6594 800D5994 8FB10054 */  lw         $s1, 0x54($sp)
/* D6598 800D5998 8FB00050 */  lw         $s0, 0x50($sp)
/* D659C 800D599C 03E00008 */  jr         $ra
/* D65A0 800D59A0 27BD0060 */   addiu     $sp, $sp, 0x60

glabel decrypt_string
/* D65A4 800D59A4 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* D65A8 800D59A8 AFB10054 */  sw         $s1, 0x54($sp)
/* D65AC 800D59AC 00808821 */  addu       $s1, $a0, $zero
/* D65B0 800D59B0 30A500FF */  andi       $a1, $a1, 0xff
/* D65B4 800D59B4 30C6FFFF */  andi       $a2, $a2, 0xffff
/* D65B8 800D59B8 00073C00 */  sll        $a3, $a3, 0x10
/* D65BC 800D59BC AFB00050 */  sw         $s0, 0x50($sp)
/* D65C0 800D59C0 00078403 */  sra        $s0, $a3, 0x10
/* D65C4 800D59C4 3C02800E */  lui        $v0, %hi(stringKey)
/* D65C8 800D59C8 AFBF0058 */  sw         $ra, 0x58($sp)
/* D65CC 800D59CC 24484EC0 */  addiu      $t0, $v0, %lo(stringKey)
/* D65D0 800D59D0 89030000 */  lwl        $v1, ($t0)
/* D65D4 800D59D4 99030003 */  lwr        $v1, 3($t0)
/* D65D8 800D59D8 89040004 */  lwl        $a0, 4($t0)
/* D65DC 800D59DC 99040007 */  lwr        $a0, 7($t0)
/* D65E0 800D59E0 89070008 */  lwl        $a3, 8($t0)
/* D65E4 800D59E4 9907000B */  lwr        $a3, 0xb($t0)
/* D65E8 800D59E8 ABA30010 */  swl        $v1, 0x10($sp)
/* D65EC 800D59EC BBA30013 */  swr        $v1, 0x13($sp)
/* D65F0 800D59F0 ABA40014 */  swl        $a0, 0x14($sp)
/* D65F4 800D59F4 BBA40017 */  swr        $a0, 0x17($sp)
/* D65F8 800D59F8 ABA70018 */  swl        $a3, 0x18($sp)
/* D65FC 800D59FC BBA7001B */  swr        $a3, 0x1b($sp)
/* D6600 800D5A00 8903000C */  lwl        $v1, 0xc($t0)
/* D6604 800D5A04 9903000F */  lwr        $v1, 0xf($t0)
/* D6608 800D5A08 ABA3001C */  swl        $v1, 0x1c($sp)
/* D660C 800D5A0C BBA3001F */  swr        $v1, 0x1f($sp)
/* D6610 800D5A10 00003821 */  addu       $a3, $zero, $zero
/* D6614 800D5A14 27A80010 */  addiu      $t0, $sp, 0x10
.L800D5A18:
/* D6618 800D5A18 01072021 */  addu       $a0, $t0, $a3
/* D661C 800D5A1C 24E30001 */  addiu      $v1, $a3, 1
/* D6620 800D5A20 306700FF */  andi       $a3, $v1, 0xff
/* D6624 800D5A24 90820000 */  lbu        $v0, ($a0)
/* D6628 800D5A28 2CE30010 */  sltiu      $v1, $a3, 0x10
/* D662C 800D5A2C 3842007F */  xori       $v0, $v0, 0x7f
/* D6630 800D5A30 1460FFF9 */  bnez       $v1, .L800D5A18
/* D6634 800D5A34 A0820000 */   sb        $v0, ($a0)
/* D6638 800D5A38 0C035585 */  jal        decrypt_func_a
/* D663C 800D5A3C 27A40010 */   addiu     $a0, $sp, 0x10
/* D6640 800D5A40 02202021 */  addu       $a0, $s1, $zero
/* D6644 800D5A44 27A50010 */  addiu      $a1, $sp, 0x10
/* D6648 800D5A48 0C0355F9 */  jal        decrypt_func_b
/* D664C 800D5A4C 02003021 */   addu      $a2, $s0, $zero
/* D6650 800D5A50 02201021 */  addu       $v0, $s1, $zero
/* D6654 800D5A54 8FBF0058 */  lw         $ra, 0x58($sp)
/* D6658 800D5A58 8FB10054 */  lw         $s1, 0x54($sp)
/* D665C 800D5A5C 8FB00050 */  lw         $s0, 0x50($sp)
/* D6660 800D5A60 03E00008 */  jr         $ra
/* D6664 800D5A64 27BD0060 */   addiu     $sp, $sp, 0x60
/* D6668 800D5A68 00000000 */  nop
/* D666C 800D5A6C 00000000 */  nop
