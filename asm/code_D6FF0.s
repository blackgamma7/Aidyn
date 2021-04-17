.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_unkGuiSubstruct
/* D6FF0 800D63F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D6FF4 800D63F4 AFB00010 */  sw         $s0, 0x10($sp)
/* D6FF8 800D63F8 00808021 */  addu       $s0, $a0, $zero
/* D6FFC 800D63FC 00052080 */  sll        $a0, $a1, 2
/* D7000 800D6400 AFBF0014 */  sw         $ra, 0x14($sp)
/* D7004 800D6404 AE000000 */  sw         $zero, ($s0)
/* D7008 800D6408 AE000008 */  sw         $zero, 8($s0)
/* D700C 800D640C 0C035998 */  jal        passto_passtoMalloc
/* D7010 800D6410 AE05000C */   sw        $a1, 0xc($s0)
/* D7014 800D6414 00402021 */  addu       $a0, $v0, $zero
/* D7018 800D6418 8E06000C */  lw         $a2, 0xc($s0)
/* D701C 800D641C 00002821 */  addu       $a1, $zero, $zero
/* D7020 800D6420 AE020004 */  sw         $v0, 4($s0)
/* D7024 800D6424 0C026380 */  jal        Calloc
/* D7028 800D6428 00063080 */   sll       $a2, $a2, 2
/* D702C 800D642C 02001021 */  addu       $v0, $s0, $zero
/* D7030 800D6430 8FBF0014 */  lw         $ra, 0x14($sp)
/* D7034 800D6434 8FB00010 */  lw         $s0, 0x10($sp)
/* D7038 800D6438 03E00008 */  jr         $ra
/* D703C 800D643C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_clearing_func
/* D7040 800D6440 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D7044 800D6444 AFB10014 */  sw         $s1, 0x14($sp)
/* D7048 800D6448 00808821 */  addu       $s1, $a0, $zero
/* D704C 800D644C AFB00010 */  sw         $s0, 0x10($sp)
/* D7050 800D6450 AFBF0018 */  sw         $ra, 0x18($sp)
/* D7054 800D6454 0C035972 */  jal        func_800D65C8
/* D7058 800D6458 00A08021 */   addu      $s0, $a1, $zero
/* D705C 800D645C 0C026262 */  jal        passToFree
/* D7060 800D6460 8E240004 */   lw        $a0, 4($s1)
/* D7064 800D6464 32100001 */  andi       $s0, $s0, 1
/* D7068 800D6468 12000003 */  beqz       $s0, .L800D6478
/* D706C 800D646C AE200004 */   sw        $zero, 4($s1)
/* D7070 800D6470 0C026262 */  jal        passToFree
/* D7074 800D6474 02202021 */   addu      $a0, $s1, $zero
.L800D6478:
/* D7078 800D6478 8FBF0018 */  lw         $ra, 0x18($sp)
/* D707C 800D647C 8FB10014 */  lw         $s1, 0x14($sp)
/* D7080 800D6480 8FB00010 */  lw         $s0, 0x10($sp)
/* D7084 800D6484 03E00008 */  jr         $ra
/* D7088 800D6488 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800D648C
/* D708C 800D648C 8C82000C */  lw         $v0, 0xc($a0)
/* D7090 800D6490 10400011 */  beqz       $v0, .L800D64D8
/* D7094 800D6494 00003021 */   addu      $a2, $zero, $zero
/* D7098 800D6498 8C820004 */  lw         $v0, 4($a0)
/* D709C 800D649C 8C430000 */  lw         $v1, ($v0)
/* D70A0 800D64A0 14600003 */  bnez       $v1, .L800D64B0
/* D70A4 800D64A4 00403821 */   addu      $a3, $v0, $zero
/* D70A8 800D64A8 08035936 */  j          .L800D64D8
/* D70AC 800D64AC ACE50000 */   sw        $a1, ($a3)
.L800D64B0:
/* D70B0 800D64B0 8C82000C */  lw         $v0, 0xc($a0)
.L800D64B4:
/* D70B4 800D64B4 24C60001 */  addiu      $a2, $a2, 1
/* D70B8 800D64B8 00C2102B */  sltu       $v0, $a2, $v0
/* D70BC 800D64BC 10400006 */  beqz       $v0, .L800D64D8
/* D70C0 800D64C0 00061080 */   sll       $v0, $a2, 2
/* D70C4 800D64C4 00471021 */  addu       $v0, $v0, $a3
/* D70C8 800D64C8 8C430000 */  lw         $v1, ($v0)
/* D70CC 800D64CC 5460FFF9 */  bnel       $v1, $zero, .L800D64B4
/* D70D0 800D64D0 8C82000C */   lw        $v0, 0xc($a0)
/* D70D4 800D64D4 AC450000 */  sw         $a1, ($v0)
.L800D64D8:
/* D70D8 800D64D8 8C820008 */  lw         $v0, 8($a0)
/* D70DC 800D64DC 24420001 */  addiu      $v0, $v0, 1
/* D70E0 800D64E0 03E00008 */  jr         $ra
/* D70E4 800D64E4 AC820008 */   sw        $v0, 8($a0)

glabel func_800D64E8
/* D70E8 800D64E8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* D70EC 800D64EC AFB00010 */  sw         $s0, 0x10($sp)
/* D70F0 800D64F0 00008021 */  addu       $s0, $zero, $zero
/* D70F4 800D64F4 AFB20018 */  sw         $s2, 0x18($sp)
/* D70F8 800D64F8 00809021 */  addu       $s2, $a0, $zero
/* D70FC 800D64FC AFBF0020 */  sw         $ra, 0x20($sp)
/* D7100 800D6500 AFB3001C */  sw         $s3, 0x1c($sp)
/* D7104 800D6504 AFB10014 */  sw         $s1, 0x14($sp)
/* D7108 800D6508 8E42000C */  lw         $v0, 0xc($s2)
/* D710C 800D650C 10400027 */  beqz       $v0, .L800D65AC
/* D7110 800D6510 00A09821 */   addu      $s3, $a1, $zero
/* D7114 800D6514 8E420004 */  lw         $v0, 4($s2)
.L800D6518:
/* D7118 800D6518 00108880 */  sll        $s1, $s0, 2
/* D711C 800D651C 02221021 */  addu       $v0, $s1, $v0
/* D7120 800D6520 8C460000 */  lw         $a2, ($v0)
/* D7124 800D6524 50C0001D */  beql       $a2, $zero, .L800D659C
/* D7128 800D6528 8E42000C */   lw        $v0, 0xc($s2)
/* D712C 800D652C C4C20000 */  lwc1       $f2, ($a2)
/* D7130 800D6530 C4C00004 */  lwc1       $f0, 4($a2)
/* D7134 800D6534 4602003E */  c.le.s     $f0, $f2
/* D7138 800D6538 00000000 */  nop
/* D713C 800D653C 45010002 */  bc1t       .L800D6548
/* D7140 800D6540 24020001 */   addiu     $v0, $zero, 1
/* D7144 800D6544 00001021 */  addu       $v0, $zero, $zero
.L800D6548:
/* D7148 800D6548 1040000D */  beqz       $v0, .L800D6580
/* D714C 800D654C 24050003 */   addiu     $a1, $zero, 3
/* D7150 800D6550 8CC20008 */  lw         $v0, 8($a2)
/* D7154 800D6554 84440008 */  lh         $a0, 8($v0)
/* D7158 800D6558 8C43000C */  lw         $v1, 0xc($v0)
/* D715C 800D655C 0060F809 */  jalr       $v1
/* D7160 800D6560 00C42021 */   addu      $a0, $a2, $a0
/* D7164 800D6564 8E420004 */  lw         $v0, 4($s2)
/* D7168 800D6568 8E430008 */  lw         $v1, 8($s2)
/* D716C 800D656C 02221021 */  addu       $v0, $s1, $v0
/* D7170 800D6570 2463FFFF */  addiu      $v1, $v1, -1
/* D7174 800D6574 AC400000 */  sw         $zero, ($v0)
/* D7178 800D6578 08035966 */  j          .L800D6598
/* D717C 800D657C AE430008 */   sw        $v1, 8($s2)
.L800D6580:
/* D7180 800D6580 8CC20008 */  lw         $v0, 8($a2)
/* D7184 800D6584 02602821 */  addu       $a1, $s3, $zero
/* D7188 800D6588 84440010 */  lh         $a0, 0x10($v0)
/* D718C 800D658C 8C430014 */  lw         $v1, 0x14($v0)
/* D7190 800D6590 0060F809 */  jalr       $v1
/* D7194 800D6594 00C42021 */   addu      $a0, $a2, $a0
.L800D6598:
/* D7198 800D6598 8E42000C */  lw         $v0, 0xc($s2)
.L800D659C:
/* D719C 800D659C 26100001 */  addiu      $s0, $s0, 1
/* D71A0 800D65A0 0202102B */  sltu       $v0, $s0, $v0
/* D71A4 800D65A4 5440FFDC */  bnel       $v0, $zero, .L800D6518
/* D71A8 800D65A8 8E420004 */   lw        $v0, 4($s2)
.L800D65AC:
/* D71AC 800D65AC 8FBF0020 */  lw         $ra, 0x20($sp)
/* D71B0 800D65B0 8FB3001C */  lw         $s3, 0x1c($sp)
/* D71B4 800D65B4 8FB20018 */  lw         $s2, 0x18($sp)
/* D71B8 800D65B8 8FB10014 */  lw         $s1, 0x14($sp)
/* D71BC 800D65BC 8FB00010 */  lw         $s0, 0x10($sp)
/* D71C0 800D65C0 03E00008 */  jr         $ra
/* D71C4 800D65C4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800D65C8
/* D71C8 800D65C8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D71CC 800D65CC AFB20018 */  sw         $s2, 0x18($sp)
/* D71D0 800D65D0 00809021 */  addu       $s2, $a0, $zero
/* D71D4 800D65D4 AFBF001C */  sw         $ra, 0x1c($sp)
/* D71D8 800D65D8 AFB10014 */  sw         $s1, 0x14($sp)
/* D71DC 800D65DC AFB00010 */  sw         $s0, 0x10($sp)
/* D71E0 800D65E0 8E42000C */  lw         $v0, 0xc($s2)
/* D71E4 800D65E4 10400015 */  beqz       $v0, .L800D663C
/* D71E8 800D65E8 00008021 */   addu      $s0, $zero, $zero
/* D71EC 800D65EC 8E420004 */  lw         $v0, 4($s2)
.L800D65F0:
/* D71F0 800D65F0 00108880 */  sll        $s1, $s0, 2
/* D71F4 800D65F4 02221021 */  addu       $v0, $s1, $v0
/* D71F8 800D65F8 8C430000 */  lw         $v1, ($v0)
/* D71FC 800D65FC 5060000B */  beql       $v1, $zero, .L800D662C
/* D7200 800D6600 8E42000C */   lw        $v0, 0xc($s2)
/* D7204 800D6604 8C620008 */  lw         $v0, 8($v1)
/* D7208 800D6608 84440008 */  lh         $a0, 8($v0)
/* D720C 800D660C 00642021 */  addu       $a0, $v1, $a0
/* D7210 800D6610 8C43000C */  lw         $v1, 0xc($v0)
/* D7214 800D6614 0060F809 */  jalr       $v1
/* D7218 800D6618 24050003 */   addiu     $a1, $zero, 3
/* D721C 800D661C 8E420004 */  lw         $v0, 4($s2)
/* D7220 800D6620 02221021 */  addu       $v0, $s1, $v0
/* D7224 800D6624 AC400000 */  sw         $zero, ($v0)
/* D7228 800D6628 8E42000C */  lw         $v0, 0xc($s2)
.L800D662C:
/* D722C 800D662C 26100001 */  addiu      $s0, $s0, 1
/* D7230 800D6630 0202102B */  sltu       $v0, $s0, $v0
/* D7234 800D6634 5440FFEE */  bnel       $v0, $zero, .L800D65F0
/* D7238 800D6638 8E420004 */   lw        $v0, 4($s2)
.L800D663C:
/* D723C 800D663C 8FBF001C */  lw         $ra, 0x1c($sp)
/* D7240 800D6640 AE400008 */  sw         $zero, 8($s2)
/* D7244 800D6644 8FB20018 */  lw         $s2, 0x18($sp)
/* D7248 800D6648 8FB10014 */  lw         $s1, 0x14($sp)
/* D724C 800D664C 8FB00010 */  lw         $s0, 0x10($sp)
/* D7250 800D6650 03E00008 */  jr         $ra
/* D7254 800D6654 27BD0020 */   addiu     $sp, $sp, 0x20
/* D7258 800D6658 00000000 */  nop
/* D725C 800D665C 00000000 */  nop
