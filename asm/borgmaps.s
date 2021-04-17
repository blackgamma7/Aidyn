.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel GetMapTerrain
/* 2D070 8002C470 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2D074 8002C474 00003021 */  addu       $a2, $zero, $zero
/* 2D078 8002C478 00042400 */  sll        $a0, $a0, 0x10
/* 2D07C 8002C47C 00044403 */  sra        $t0, $a0, 0x10
/* 2D080 8002C480 00052C00 */  sll        $a1, $a1, 0x10
/* 2D084 8002C484 00053C03 */  sra        $a3, $a1, 0x10
/* 2D088 8002C488 AFBF0018 */  sw         $ra, 0x18($sp)
/* 2D08C 8002C48C AFB10014 */  sw         $s1, 0x14($sp)
/* 2D090 8002C490 AFB00010 */  sw         $s0, 0x10($sp)
/* 2D094 8002C494 0800B15D */  j          .L8002C574
/* 2D098 8002C498 3C11800F */   lui       $s1, 0x800f
.L8002C49C:
/* 2D09C 8002C49C 00028080 */  sll        $s0, $v0, 2
/* 2D0A0 8002C4A0 02031821 */  addu       $v1, $s0, $v1
/* 2D0A4 8002C4A4 94620000 */  lhu        $v0, ($v1)
/* 2D0A8 8002C4A8 14480031 */  bne        $v0, $t0, .L8002C570
/* 2D0AC 8002C4AC 24C20001 */   addiu     $v0, $a2, 1
/* 2D0B0 8002C4B0 94620002 */  lhu        $v0, 2($v1)
/* 2D0B4 8002C4B4 1447002E */  bne        $v0, $a3, .L8002C570
/* 2D0B8 8002C4B8 24C20001 */   addiu     $v0, $a2, 1
/* 2D0BC 8002C4BC 3C02800F */  lui        $v0, %hi(TerrainPointer)
/* 2D0C0 8002C4C0 8C441BBC */  lw         $a0, %lo(TerrainPointer)($v0)
/* 2D0C4 8002C4C4 0C02135A */  jal        SetTerrain
/* 2D0C8 8002C4C8 9065000B */   lbu       $a1, 0xb($v1)
/* 2D0CC 8002C4CC 3C04800E */  lui        $a0, %hi(weatherDat+0x10)
/* 2D0D0 8002C4D0 24020001 */  addiu      $v0, $zero, 1
/* 2D0D4 8002C4D4 8E23C608 */  lw         $v1, -0x39f8($s1)
/* 2D0D8 8002C4D8 24866C4C */  addiu      $a2, $a0, %lo(weatherDat+0x10)
/* 2D0DC 8002C4DC A4826C4C */  sh         $v0, 0x6c4c($a0)
/* 2D0E0 8002C4E0 24020003 */  addiu      $v0, $zero, 3
/* 2D0E4 8002C4E4 A4C210A8 */  sh         $v0, 0x10a8($a2)
/* 2D0E8 8002C4E8 02031821 */  addu       $v1, $s0, $v1
/* 2D0EC 8002C4EC 9462000A */  lhu        $v0, 0xa($v1)
/* 2D0F0 8002C4F0 2445FFFD */  addiu      $a1, $v0, -3
/* 2D0F4 8002C4F4 2CA30018 */  sltiu      $v1, $a1, 0x18
/* 2D0F8 8002C4F8 1060002E */  beqz       $v1, .L8002C5B4
/* 2D0FC 8002C4FC 3C02800E */   lui       $v0, %hi(D_800DA650)
/* 2D100 8002C500 2442A650 */  addiu      $v0, $v0, %lo(D_800DA650)
/* 2D104 8002C504 00051880 */  sll        $v1, $a1, 2
/* 2D108 8002C508 00621821 */  addu       $v1, $v1, $v0
/* 2D10C 8002C50C 8C640000 */  lw         $a0, ($v1)
/* 2D110 8002C510 00800008 */  jr         $a0
/* 2D114 8002C514 00000000 */   nop
/* 2D118 8002C518 24020003 */  addiu      $v0, $zero, 3
/* 2D11C 8002C51C 0800B16D */  j          .L8002C5B4
/* 2D120 8002C520 A4C20000 */   sh        $v0, ($a2)
/* 2D124 8002C524 24020004 */  addiu      $v0, $zero, 4
/* 2D128 8002C528 0800B16D */  j          .L8002C5B4
/* 2D12C 8002C52C A4C20000 */   sh        $v0, ($a2)
/* 2D130 8002C530 24020005 */  addiu      $v0, $zero, 5
/* 2D134 8002C534 0800B16D */  j          .L8002C5B4
/* 2D138 8002C538 A4C20000 */   sh        $v0, ($a2)
/* 2D13C 8002C53C 24020002 */  addiu      $v0, $zero, 2
/* 2D140 8002C540 0800B16D */  j          .L8002C5B4
/* 2D144 8002C544 A4C20000 */   sh        $v0, ($a2)
/* 2D148 8002C548 0800B157 */  j          .L8002C55C
/* 2D14C 8002C54C 24020008 */   addiu     $v0, $zero, 8
/* 2D150 8002C550 0800B157 */  j          .L8002C55C
/* 2D154 8002C554 24020007 */   addiu     $v0, $zero, 7
/* 2D158 8002C558 24020006 */  addiu      $v0, $zero, 6
.L8002C55C:
/* 2D15C 8002C55C 3C03800E */  lui        $v1, %hi(SkyStruct)
/* 2D160 8002C560 A4C20000 */  sh         $v0, ($a2)
/* 2D164 8002C564 24020004 */  addiu      $v0, $zero, 4
/* 2D168 8002C568 0800B16D */  j          .L8002C5B4
/* 2D16C 8002C56C A4627CF4 */   sh        $v0, %lo(SkyStruct)($v1)
.L8002C570:
/* 2D170 8002C570 3046FFFF */  andi       $a2, $v0, 0xffff
.L8002C574:
/* 2D174 8002C574 00062840 */  sll        $a1, $a2, 1
/* 2D178 8002C578 00A61021 */  addu       $v0, $a1, $a2
/* 2D17C 8002C57C 8E23C608 */  lw         $v1, -0x39f8($s1)
/* 2D180 8002C580 00021080 */  sll        $v0, $v0, 2
/* 2D184 8002C584 00431021 */  addu       $v0, $v0, $v1
/* 2D188 8002C588 94440004 */  lhu        $a0, 4($v0)
/* 2D18C 8002C58C 5480FFC3 */  bnel       $a0, $zero, .L8002C49C
/* 2D190 8002C590 00A61021 */   addu      $v0, $a1, $a2
/* 2D194 8002C594 94420008 */  lhu        $v0, 8($v0)
/* 2D198 8002C598 1440FFC0 */  bnez       $v0, .L8002C49C
/* 2D19C 8002C59C 00A61021 */   addu      $v0, $a1, $a2
/* 2D1A0 8002C5A0 3C04800E */  lui        $a0, %hi(D_800DA630)
/* 2D1A4 8002C5A4 2484A630 */  addiu      $a0, $a0, %lo(D_800DA630)
/* 2D1A8 8002C5A8 3C05800E */  lui        $a1, %hi(D_800DA640)
/* 2D1AC 8002C5AC 0C025F2D */  jal        manualCrash
/* 2D1B0 8002C5B0 24A5A640 */   addiu     $a1, $a1, %lo(D_800DA640)
.L8002C5B4:
/* 2D1B4 8002C5B4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 2D1B8 8002C5B8 8FB10014 */  lw         $s1, 0x14($sp)
/* 2D1BC 8002C5BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 2D1C0 8002C5C0 03E00008 */  jr         $ra
/* 2D1C4 8002C5C4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel clear_map_index_matrix
/* 2D1C8 8002C5C8 00002021 */  addu       $a0, $zero, $zero
/* 2D1CC 8002C5CC 3C02800F */  lui        $v0, %hi(map_index_matrix)
/* 2D1D0 8002C5D0 2448B690 */  addiu      $t0, $v0, %lo(map_index_matrix)
/* 2D1D4 8002C5D4 3C070001 */  lui        $a3, 1
/* 2D1D8 8002C5D8 24860001 */  addiu      $a2, $a0, 1
.L8002C5DC:
/* 2D1DC 8002C5DC 3C050001 */  lui        $a1, 1
/* 2D1E0 8002C5E0 00041840 */  sll        $v1, $a0, 1
/* 2D1E4 8002C5E4 00641821 */  addu       $v1, $v1, $a0
/* 2D1E8 8002C5E8 00031100 */  sll        $v0, $v1, 4
/* 2D1EC 8002C5EC 00431023 */  subu       $v0, $v0, $v1
/* 2D1F0 8002C5F0 00021080 */  sll        $v0, $v0, 2
/* 2D1F4 8002C5F4 00481821 */  addu       $v1, $v0, $t0
.L8002C5F8:
/* 2D1F8 8002C5F8 00A01021 */  addu       $v0, $a1, $zero
/* 2D1FC 8002C5FC 00A72821 */  addu       $a1, $a1, $a3
/* 2D200 8002C600 A4600000 */  sh         $zero, ($v1)
/* 2D204 8002C604 A4600002 */  sh         $zero, 2($v1)
/* 2D208 8002C608 A4600004 */  sh         $zero, 4($v1)
/* 2D20C 8002C60C 00021403 */  sra        $v0, $v0, 0x10
/* 2D210 8002C610 2842001E */  slti       $v0, $v0, 0x1e
/* 2D214 8002C614 1440FFF8 */  bnez       $v0, .L8002C5F8
/* 2D218 8002C618 24630006 */   addiu     $v1, $v1, 6
/* 2D21C 8002C61C 00061400 */  sll        $v0, $a2, 0x10
/* 2D220 8002C620 00022403 */  sra        $a0, $v0, 0x10
/* 2D224 8002C624 28830016 */  slti       $v1, $a0, 0x16
/* 2D228 8002C628 1460FFEC */  bnez       $v1, .L8002C5DC
/* 2D22C 8002C62C 24860001 */   addiu     $a2, $a0, 1
/* 2D230 8002C630 03E00008 */  jr         $ra
/* 2D234 8002C634 00000000 */   nop

glabel write_map_index_matrix
/* 2D238 8002C638 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2D23C 8002C63C AFB00010 */  sw         $s0, 0x10($sp)
/* 2D240 8002C640 00808021 */  addu       $s0, $a0, $zero
/* 2D244 8002C644 3C02800F */  lui        $v0, %hi(MapDataList_pointer)
/* 2D248 8002C648 AFBF0014 */  sw         $ra, 0x14($sp)
/* 2D24C 8002C64C 0C00B172 */  jal        clear_map_index_matrix
/* 2D250 8002C650 AC50C608 */   sw        $s0, %lo(MapDataList_pointer)($v0)
/* 2D254 8002C654 3C02800F */  lui        $v0, %hi(map_index_matrix)
/* 2D258 8002C658 2447B690 */  addiu      $a3, $v0, %lo(map_index_matrix)
/* 2D25C 8002C65C 24E90002 */  addiu      $t1, $a3, 2
/* 2D260 8002C660 24E80004 */  addiu      $t0, $a3, 4
.L8002C664:
/* 2D264 8002C664 96020000 */  lhu        $v0, ($s0)
/* 2D268 8002C668 14400003 */  bnez       $v0, .L8002C678
/* 2D26C 8002C66C 96020002 */   lhu       $v0, 2($s0)
/* 2D270 8002C670 1040002C */  beqz       $v0, .L8002C724
/* 2D274 8002C674 8FBF0014 */   lw        $ra, 0x14($sp)
.L8002C678:
/* 2D278 8002C678 96050000 */  lhu        $a1, ($s0)
/* 2D27C 8002C67C 00022040 */  sll        $a0, $v0, 1
/* 2D280 8002C680 00822021 */  addu       $a0, $a0, $v0
/* 2D284 8002C684 00042040 */  sll        $a0, $a0, 1
/* 2D288 8002C688 00051840 */  sll        $v1, $a1, 1
/* 2D28C 8002C68C 00651821 */  addu       $v1, $v1, $a1
/* 2D290 8002C690 00031100 */  sll        $v0, $v1, 4
/* 2D294 8002C694 00431023 */  subu       $v0, $v0, $v1
/* 2D298 8002C698 00021080 */  sll        $v0, $v0, 2
/* 2D29C 8002C69C 00822021 */  addu       $a0, $a0, $v0
/* 2D2A0 8002C6A0 96030004 */  lhu        $v1, 4($s0)
/* 2D2A4 8002C6A4 00872021 */  addu       $a0, $a0, $a3
/* 2D2A8 8002C6A8 A4830000 */  sh         $v1, ($a0)
/* 2D2AC 8002C6AC 96020002 */  lhu        $v0, 2($s0)
/* 2D2B0 8002C6B0 96050000 */  lhu        $a1, ($s0)
/* 2D2B4 8002C6B4 00022040 */  sll        $a0, $v0, 1
/* 2D2B8 8002C6B8 00822021 */  addu       $a0, $a0, $v0
/* 2D2BC 8002C6BC 00042040 */  sll        $a0, $a0, 1
/* 2D2C0 8002C6C0 00051840 */  sll        $v1, $a1, 1
/* 2D2C4 8002C6C4 00651821 */  addu       $v1, $v1, $a1
/* 2D2C8 8002C6C8 00031100 */  sll        $v0, $v1, 4
/* 2D2CC 8002C6CC 00431023 */  subu       $v0, $v0, $v1
/* 2D2D0 8002C6D0 00021080 */  sll        $v0, $v0, 2
/* 2D2D4 8002C6D4 00822021 */  addu       $a0, $a0, $v0
/* 2D2D8 8002C6D8 96030008 */  lhu        $v1, 8($s0)
/* 2D2DC 8002C6DC 00892021 */  addu       $a0, $a0, $t1
/* 2D2E0 8002C6E0 A4830000 */  sh         $v1, ($a0)
/* 2D2E4 8002C6E4 96020002 */  lhu        $v0, 2($s0)
/* 2D2E8 8002C6E8 96050000 */  lhu        $a1, ($s0)
/* 2D2EC 8002C6EC 96060006 */  lhu        $a2, 6($s0)
/* 2D2F0 8002C6F0 2610000C */  addiu      $s0, $s0, 0xc
/* 2D2F4 8002C6F4 00022040 */  sll        $a0, $v0, 1
/* 2D2F8 8002C6F8 00822021 */  addu       $a0, $a0, $v0
/* 2D2FC 8002C6FC 00042040 */  sll        $a0, $a0, 1
/* 2D300 8002C700 00051840 */  sll        $v1, $a1, 1
/* 2D304 8002C704 00651821 */  addu       $v1, $v1, $a1
/* 2D308 8002C708 00031100 */  sll        $v0, $v1, 4
/* 2D30C 8002C70C 00431023 */  subu       $v0, $v0, $v1
/* 2D310 8002C710 00021080 */  sll        $v0, $v0, 2
/* 2D314 8002C714 00822021 */  addu       $a0, $a0, $v0
/* 2D318 8002C718 00882021 */  addu       $a0, $a0, $t0
/* 2D31C 8002C71C 0800B199 */  j          .L8002C664
/* 2D320 8002C720 A4860000 */   sh        $a2, ($a0)
.L8002C724:
/* 2D324 8002C724 8FB00010 */  lw         $s0, 0x10($sp)
/* 2D328 8002C728 03E00008 */  jr         $ra
/* 2D32C 8002C72C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel GetMapData
/* 2D330 8002C730 27BDFEC0 */  addiu      $sp, $sp, -0x140
/* 2D334 8002C734 AFB30124 */  sw         $s3, 0x124($sp)
/* 2D338 8002C738 30B3FFFF */  andi       $s3, $a1, 0xffff
/* 2D33C 8002C73C AFB20120 */  sw         $s2, 0x120($sp)
/* 2D340 8002C740 30D2FFFF */  andi       $s2, $a2, 0xffff
/* 2D344 8002C744 00003021 */  addu       $a2, $zero, $zero
/* 2D348 8002C748 AFBE0138 */  sw         $fp, 0x138($sp)
/* 2D34C 8002C74C 3C1E800E */  lui        $fp, 0x800e
/* 2D350 8002C750 AFB70134 */  sw         $s7, 0x134($sp)
/* 2D354 8002C754 3C17800E */  lui        $s7, 0x800e
/* 2D358 8002C758 AFB40128 */  sw         $s4, 0x128($sp)
/* 2D35C 8002C75C 3C140001 */  lui        $s4, 1
/* 2D360 8002C760 30E7FFFF */  andi       $a3, $a3, 0xffff
/* 2D364 8002C764 AFB5012C */  sw         $s5, 0x12c($sp)
/* 2D368 8002C768 97B50152 */  lhu        $s5, 0x152($sp)
/* 2D36C 8002C76C 00073840 */  sll        $a3, $a3, 1
/* 2D370 8002C770 AFB1011C */  sw         $s1, 0x11c($sp)
/* 2D374 8002C774 00878821 */  addu       $s1, $a0, $a3
/* 2D378 8002C778 AFB00118 */  sw         $s0, 0x118($sp)
/* 2D37C 8002C77C 00808021 */  addu       $s0, $a0, $zero
/* 2D380 8002C780 AFB60130 */  sw         $s6, 0x130($sp)
/* 2D384 8002C784 3C160001 */  lui        $s6, 1
/* 2D388 8002C788 AFBF013C */  sw         $ra, 0x13c($sp)
.L8002C78C:
/* 2D38C 8002C78C 96020000 */  lhu        $v0, ($s0)
/* 2D390 8002C790 1440000E */  bnez       $v0, .L8002C7CC
/* 2D394 8002C794 00000000 */   nop
/* 2D398 8002C798 96020002 */  lhu        $v0, 2($s0)
/* 2D39C 8002C79C 5440000B */  bnel       $v0, $zero, .L8002C7CC
/* 2D3A0 8002C7A0 96020000 */   lhu       $v0, ($s0)
/* 2D3A4 8002C7A4 27A40018 */  addiu      $a0, $sp, 0x18
/* 2D3A8 8002C7A8 27C5A6B0 */  addiu      $a1, $fp, -0x5950
/* 2D3AC 8002C7AC 02A03821 */  addu       $a3, $s5, $zero
/* 2D3B0 8002C7B0 AFB30010 */  sw         $s3, 0x10($sp)
/* 2D3B4 8002C7B4 0C0333AC */  jal        sprintf
/* 2D3B8 8002C7B8 AFB20014 */   sw        $s2, 0x14($sp)
/* 2D3BC 8002C7BC 27A40018 */  addiu      $a0, $sp, 0x18
/* 2D3C0 8002C7C0 0C025F2D */  jal        manualCrash
/* 2D3C4 8002C7C4 26E5A6F0 */   addiu     $a1, $s7, -0x5910
/* 2D3C8 8002C7C8 96020000 */  lhu        $v0, ($s0)
.L8002C7CC:
/* 2D3CC 8002C7CC 14530006 */  bne        $v0, $s3, .L8002C7E8
/* 2D3D0 8002C7D0 00141403 */   sra       $v0, $s4, 0x10
/* 2D3D4 8002C7D4 96020002 */  lhu        $v0, 2($s0)
/* 2D3D8 8002C7D8 14520003 */  bne        $v0, $s2, .L8002C7E8
/* 2D3DC 8002C7DC 00141403 */   sra       $v0, $s4, 0x10
/* 2D3E0 8002C7E0 0800B1FF */  j          .L8002C7FC
/* 2D3E4 8002C7E4 96220000 */   lhu       $v0, ($s1)
.L8002C7E8:
/* 2D3E8 8002C7E8 0296A021 */  addu       $s4, $s4, $s6
/* 2D3EC 8002C7EC 2631000C */  addiu      $s1, $s1, 0xc
/* 2D3F0 8002C7F0 2610000C */  addiu      $s0, $s0, 0xc
/* 2D3F4 8002C7F4 0800B1E3 */  j          .L8002C78C
/* 2D3F8 8002C7F8 00403021 */   addu      $a2, $v0, $zero
.L8002C7FC:
/* 2D3FC 8002C7FC 8FBF013C */  lw         $ra, 0x13c($sp)
/* 2D400 8002C800 8FBE0138 */  lw         $fp, 0x138($sp)
/* 2D404 8002C804 8FB70134 */  lw         $s7, 0x134($sp)
/* 2D408 8002C808 8FB60130 */  lw         $s6, 0x130($sp)
/* 2D40C 8002C80C 8FB5012C */  lw         $s5, 0x12c($sp)
/* 2D410 8002C810 8FB40128 */  lw         $s4, 0x128($sp)
/* 2D414 8002C814 8FB30124 */  lw         $s3, 0x124($sp)
/* 2D418 8002C818 8FB20120 */  lw         $s2, 0x120($sp)
/* 2D41C 8002C81C 8FB1011C */  lw         $s1, 0x11c($sp)
/* 2D420 8002C820 8FB00118 */  lw         $s0, 0x118($sp)
/* 2D424 8002C824 03E00008 */  jr         $ra
/* 2D428 8002C828 27BD0140 */   addiu     $sp, $sp, 0x140

glabel borgmaps_func_2
/* 2D42C 8002C82C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2D430 8002C830 AFBF0018 */  sw         $ra, 0x18($sp)
/* 2D434 8002C834 00042400 */  sll        $a0, $a0, 0x10
/* 2D438 8002C838 00043C03 */  sra        $a3, $a0, 0x10
/* 2D43C 8002C83C 00052C00 */  sll        $a1, $a1, 0x10
/* 2D440 8002C840 00052C03 */  sra        $a1, $a1, 0x10
/* 2D444 8002C844 00063400 */  sll        $a2, $a2, 0x10
/* 2D448 8002C848 2CE20011 */  sltiu      $v0, $a3, 0x11
/* 2D44C 8002C84C 10400062 */  beqz       $v0, .L8002C9D8
/* 2D450 8002C850 00063403 */   sra       $a2, $a2, 0x10
/* 2D454 8002C854 3C02800E */  lui        $v0, %hi(D_800DA728)
/* 2D458 8002C858 2442A728 */  addiu      $v0, $v0, %lo(D_800DA728)
/* 2D45C 8002C85C 00071880 */  sll        $v1, $a3, 2
/* 2D460 8002C860 00621821 */  addu       $v1, $v1, $v0
/* 2D464 8002C864 8C640000 */  lw         $a0, ($v1)
/* 2D468 8002C868 00800008 */  jr         $a0
/* 2D46C 8002C86C 00000000 */   nop
/* 2D470 8002C870 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D474 8002C874 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D478 8002C878 3C04800F */  lui        $a0, %hi(map_data_list_overworld)
/* 2D47C 8002C87C 0800B270 */  j          .L8002C9C0
/* 2D480 8002C880 24849C50 */   addiu     $a0, $a0, %lo(map_data_list_overworld)
/* 2D484 8002C884 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D488 8002C888 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D48C 8002C88C 3C04800F */  lui        $a0, %hi(mapDataList_1)
/* 2D490 8002C890 0800B270 */  j          .L8002C9C0
/* 2D494 8002C894 2484A46C */   addiu     $a0, $a0, %lo(mapDataList_1)
/* 2D498 8002C898 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D49C 8002C89C AFA20010 */  sw         $v0, 0x10($sp)
/* 2D4A0 8002C8A0 3C04800F */  lui        $a0, %hi(D_800EA55C)
/* 2D4A4 8002C8A4 0800B270 */  j          .L8002C9C0
/* 2D4A8 8002C8A8 2484A55C */   addiu     $a0, $a0, %lo(D_800EA55C)
/* 2D4AC 8002C8AC 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D4B0 8002C8B0 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D4B4 8002C8B4 3C04800F */  lui        $a0, %hi(mapDataList_3)
/* 2D4B8 8002C8B8 0800B270 */  j          .L8002C9C0
/* 2D4BC 8002C8BC 2484A664 */   addiu     $a0, $a0, %lo(mapDataList_3)
/* 2D4C0 8002C8C0 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D4C4 8002C8C4 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D4C8 8002C8C8 3C04800F */  lui        $a0, %hi(map_data_list_gwen)
/* 2D4CC 8002C8CC 0800B270 */  j          .L8002C9C0
/* 2D4D0 8002C8D0 2484A6A0 */   addiu     $a0, $a0, %lo(map_data_list_gwen)
/* 2D4D4 8002C8D4 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D4D8 8002C8D8 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D4DC 8002C8DC 3C04800F */  lui        $a0, %hi(mapDataList_5)
/* 2D4E0 8002C8E0 0800B270 */  j          .L8002C9C0
/* 2D4E4 8002C8E4 2484A8A4 */   addiu     $a0, $a0, %lo(mapDataList_5)
/* 2D4E8 8002C8E8 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D4EC 8002C8EC AFA20010 */  sw         $v0, 0x10($sp)
/* 2D4F0 8002C8F0 3C04800F */  lui        $a0, %hi(D_800EA934)
/* 2D4F4 8002C8F4 0800B270 */  j          .L8002C9C0
/* 2D4F8 8002C8F8 2484A934 */   addiu     $a0, $a0, %lo(D_800EA934)
/* 2D4FC 8002C8FC 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D500 8002C900 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D504 8002C904 3C04800F */  lui        $a0, %hi(D_800EAA6C)
/* 2D508 8002C908 0800B270 */  j          .L8002C9C0
/* 2D50C 8002C90C 2484AA6C */   addiu     $a0, $a0, %lo(D_800EAA6C)
/* 2D510 8002C910 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D514 8002C914 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D518 8002C918 3C04800F */  lui        $a0, %hi(D_800EABC8)
/* 2D51C 8002C91C 0800B270 */  j          .L8002C9C0
/* 2D520 8002C920 2484ABC8 */   addiu     $a0, $a0, %lo(D_800EABC8)
/* 2D524 8002C924 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D528 8002C928 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D52C 8002C92C 3C04800F */  lui        $a0, %hi(D_800EAD6C)
/* 2D530 8002C930 0800B270 */  j          .L8002C9C0
/* 2D534 8002C934 2484AD6C */   addiu     $a0, $a0, %lo(D_800EAD6C)
/* 2D538 8002C938 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D53C 8002C93C AFA20010 */  sw         $v0, 0x10($sp)
/* 2D540 8002C940 3C04800F */  lui        $a0, %hi(D_800EAE38)
/* 2D544 8002C944 0800B270 */  j          .L8002C9C0
/* 2D548 8002C948 2484AE38 */   addiu     $a0, $a0, %lo(D_800EAE38)
/* 2D54C 8002C94C 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D550 8002C950 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D554 8002C954 3C04800F */  lui        $a0, %hi(mapDataList_mageSchool)
/* 2D558 8002C958 0800B270 */  j          .L8002C9C0
/* 2D55C 8002C95C 2484AE80 */   addiu     $a0, $a0, %lo(mapDataList_mageSchool)
/* 2D560 8002C960 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D564 8002C964 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D568 8002C968 3C04800F */  lui        $a0, %hi(mapDataList_ehud)
/* 2D56C 8002C96C 0800B270 */  j          .L8002C9C0
/* 2D570 8002C970 2484AFC4 */   addiu     $a0, $a0, %lo(mapDataList_ehud)
/* 2D574 8002C974 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D578 8002C978 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D57C 8002C97C 3C04800F */  lui        $a0, %hi(D_800EB2C4)
/* 2D580 8002C980 0800B270 */  j          .L8002C9C0
/* 2D584 8002C984 2484B2C4 */   addiu     $a0, $a0, %lo(D_800EB2C4)
/* 2D588 8002C988 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D58C 8002C98C AFA20010 */  sw         $v0, 0x10($sp)
/* 2D590 8002C990 3C04800F */  lui        $a0, %hi(D_800EB480)
/* 2D594 8002C994 0800B270 */  j          .L8002C9C0
/* 2D598 8002C998 2484B480 */   addiu     $a0, $a0, %lo(D_800EB480)
/* 2D59C 8002C99C 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D5A0 8002C9A0 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D5A4 8002C9A4 3C04800F */  lui        $a0, %hi(D_800EB4E0)
/* 2D5A8 8002C9A8 0800B270 */  j          .L8002C9C0
/* 2D5AC 8002C9AC 2484B4E0 */   addiu     $a0, $a0, %lo(D_800EB4E0)
/* 2D5B0 8002C9B0 30E2FFFF */  andi       $v0, $a3, 0xffff
/* 2D5B4 8002C9B4 AFA20010 */  sw         $v0, 0x10($sp)
/* 2D5B8 8002C9B8 3C04800F */  lui        $a0, %hi(D_800EB534)
/* 2D5BC 8002C9BC 2484B534 */  addiu      $a0, $a0, %lo(D_800EB534)
.L8002C9C0:
/* 2D5C0 8002C9C0 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 2D5C4 8002C9C4 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 2D5C8 8002C9C8 0C00B1CC */  jal        GetMapData
/* 2D5CC 8002C9CC 24070004 */   addiu     $a3, $zero, 4
/* 2D5D0 8002C9D0 0800B27D */  j          .L8002C9F4
/* 2D5D4 8002C9D4 8FBF0018 */   lw        $ra, 0x18($sp)
.L8002C9D8:
/* 2D5D8 8002C9D8 3C04800E */  lui        $a0, %hi(D_800DA704)
/* 2D5DC 8002C9DC 2484A704 */  addiu      $a0, $a0, %lo(D_800DA704)
/* 2D5E0 8002C9E0 3C05800E */  lui        $a1, %hi(D_800DA714)
/* 2D5E4 8002C9E4 0C025F2D */  jal        manualCrash
/* 2D5E8 8002C9E8 24A5A714 */   addiu     $a1, $a1, %lo(D_800DA714)
/* 2D5EC 8002C9EC 00001021 */  addu       $v0, $zero, $zero
/* 2D5F0 8002C9F0 8FBF0018 */  lw         $ra, 0x18($sp)
.L8002C9F4:
/* 2D5F4 8002C9F4 03E00008 */  jr         $ra
/* 2D5F8 8002C9F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_BGM_track
/* 2D5FC 8002C9FC 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 2D600 8002CA00 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 2D604 8002CA04 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2D608 8002CA08 244968A8 */  addiu      $t1, $v0, %lo(gGlobals)
/* 2D60C 8002CA0C 9523101E */  lhu        $v1, 0x101e($t1)
/* 2D610 8002CA10 24020002 */  addiu      $v0, $zero, 2
/* 2D614 8002CA14 1062000F */  beq        $v1, $v0, .L8002CA54
/* 2D618 8002CA18 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 2D61C 8002CA1C 94830000 */  lhu        $v1, ($a0)
/* 2D620 8002CA20 1060000C */  beqz       $v1, .L8002CA54
/* 2D624 8002CA24 24840002 */   addiu     $a0, $a0, 2
/* 2D628 8002CA28 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2D62C 8002CA2C 944866C4 */  lhu        $t0, %lo(ExpPakFlag)($v0)
/* 2D630 8002CA30 01201021 */  addu       $v0, $t1, $zero
.L8002CA34:
/* 2D634 8002CA34 54650005 */  bnel       $v1, $a1, .L8002CA4C
/* 2D638 8002CA38 94830000 */   lhu       $v1, ($a0)
/* 2D63C 8002CA3C 51000002 */  beql       $t0, $zero, .L8002CA48
/* 2D640 8002CA40 A447101A */   sh        $a3, 0x101a($v0)
/* 2D644 8002CA44 A446101A */  sh         $a2, 0x101a($v0)
.L8002CA48:
/* 2D648 8002CA48 94830000 */  lhu        $v1, ($a0)
.L8002CA4C:
/* 2D64C 8002CA4C 1460FFF9 */  bnez       $v1, .L8002CA34
/* 2D650 8002CA50 24840002 */   addiu     $a0, $a0, 2
.L8002CA54:
/* 2D654 8002CA54 03E00008 */  jr         $ra
/* 2D658 8002CA58 00000000 */   nop

glabel borgmaps_func
/* 2D65C 8002CA5C 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* 2D660 8002CA60 AFB500AC */  sw         $s5, 0xac($sp)
/* 2D664 8002CA64 0000A821 */  addu       $s5, $zero, $zero
/* 2D668 8002CA68 AFB400A8 */  sw         $s4, 0xa8($sp)
/* 2D66C 8002CA6C 0000A021 */  addu       $s4, $zero, $zero
/* 2D670 8002CA70 AFB300A4 */  sw         $s3, 0xa4($sp)
/* 2D674 8002CA74 00009821 */  addu       $s3, $zero, $zero
/* 2D678 8002CA78 AFB1009C */  sw         $s1, 0x9c($sp)
/* 2D67C 8002CA7C 00008821 */  addu       $s1, $zero, $zero
/* 2D680 8002CA80 AFB700B4 */  sw         $s7, 0xb4($sp)
/* 2D684 8002CA84 00E0B821 */  addu       $s7, $a3, $zero
/* 2D688 8002CA88 00042400 */  sll        $a0, $a0, 0x10
/* 2D68C 8002CA8C AFB00098 */  sw         $s0, 0x98($sp)
/* 2D690 8002CA90 00048403 */  sra        $s0, $a0, 0x10
/* 2D694 8002CA94 00052C00 */  sll        $a1, $a1, 0x10
/* 2D698 8002CA98 AFB200A0 */  sw         $s2, 0xa0($sp)
/* 2D69C 8002CA9C 00059403 */  sra        $s2, $a1, 0x10
/* 2D6A0 8002CAA0 F7B400C0 */  sdc1       $f20, 0xc0($sp)
/* 2D6A4 8002CAA4 4480A000 */  mtc1       $zero, $f20
/* 2D6A8 8002CAA8 3C02800E */  lui        $v0, %hi(zoneDatMatrix)
/* 2D6AC 8002CAAC AFB600B0 */  sw         $s6, 0xb0($sp)
/* 2D6B0 8002CAB0 24566988 */  addiu      $s6, $v0, %lo(zoneDatMatrix)
/* 2D6B4 8002CAB4 AFBF00BC */  sw         $ra, 0xbc($sp)
/* 2D6B8 8002CAB8 AFBE00B8 */  sw         $fp, 0xb8($sp)
/* 2D6BC 8002CABC F7B600C8 */  sdc1       $f22, 0xc8($sp)
/* 2D6C0 8002CAC0 AFA00090 */  sw         $zero, 0x90($sp)
/* 2D6C4 8002CAC4 16E00008 */  bnez       $s7, .L8002CAE8
/* 2D6C8 8002CAC8 4600A586 */   mov.s     $f22, $f20
/* 2D6CC 8002CACC 3C01800E */  lui        $at, %hi(D_800DA818)
/* 2D6D0 8002CAD0 C420A818 */  lwc1       $f0, %lo(D_800DA818)($at)
/* 2D6D4 8002CAD4 2402FFFF */  addiu      $v0, $zero, -1
/* 2D6D8 8002CAD8 A6C20F3A */  sh         $v0, 0xf3a($s6)
/* 2D6DC 8002CADC A6D002AC */  sh         $s0, 0x2ac($s6)
/* 2D6E0 8002CAE0 E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2D6E4 8002CAE4 E6C0029C */  swc1       $f0, 0x29c($s6)
.L8002CAE8:
/* 2D6E8 8002CAE8 26C41F98 */  addiu      $a0, $s6, 0x1f98
/* 2D6EC 8002CAEC 3C05800E */  lui        $a1, %hi(D_800DA76C)
/* 2D6F0 8002CAF0 24A5A76C */  addiu      $a1, $a1, %lo(D_800DA76C)
/* 2D6F4 8002CAF4 02003021 */  addu       $a2, $s0, $zero
/* 2D6F8 8002CAF8 0C0333AC */  jal        sprintf
/* 2D6FC 8002CAFC 02403821 */   addu      $a3, $s2, $zero
/* 2D700 8002CB00 2E030011 */  sltiu      $v1, $s0, 0x11
/* 2D704 8002CB04 106002BE */  beqz       $v1, .L8002D600
/* 2D708 8002CB08 3C02800E */   lui       $v0, %hi(D_800DA820)
/* 2D70C 8002CB0C 2442A820 */  addiu      $v0, $v0, %lo(D_800DA820)
/* 2D710 8002CB10 00101880 */  sll        $v1, $s0, 2
/* 2D714 8002CB14 00621821 */  addu       $v1, $v1, $v0
/* 2D718 8002CB18 8C640000 */  lw         $a0, ($v1)
/* 2D71C 8002CB1C 00800008 */  jr         $a0
/* 2D720 8002CB20 00000000 */   nop
/* 2D724 8002CB24 3C02800F */  lui        $v0, %hi(map_data_list_overworld)
/* 2D728 8002CB28 16E00007 */  bnez       $s7, .L8002CB48
/* 2D72C 8002CB2C 24559C50 */   addiu     $s5, $v0, %lo(map_data_list_overworld)
/* 2D730 8002CB30 0C00B18E */  jal        write_map_index_matrix
/* 2D734 8002CB34 02A02021 */   addu      $a0, $s5, $zero
/* 2D738 8002CB38 3C01800E */  lui        $at, %hi(D_800DA864)
/* 2D73C 8002CB3C C420A864 */  lwc1       $f0, %lo(D_800DA864)($at)
/* 2D740 8002CB40 E6C0029C */  swc1       $f0, 0x29c($s6)
/* 2D744 8002CB44 E6C002A0 */  swc1       $f0, 0x2a0($s6)
.L8002CB48:
/* 2D748 8002CB48 26420001 */  addiu      $v0, $s2, 1
/* 2D74C 8002CB4C 00021400 */  sll        $v0, $v0, 0x10
/* 2D750 8002CB50 00022C03 */  sra        $a1, $v0, 0x10
/* 2D754 8002CB54 2CA3001F */  sltiu      $v1, $a1, 0x1f
/* 2D758 8002CB58 106000C5 */  beqz       $v1, .L8002CE70
/* 2D75C 8002CB5C 24110001 */   addiu     $s1, $zero, 1
/* 2D760 8002CB60 3C02800E */  lui        $v0, %hi(D_800DA868)
/* 2D764 8002CB64 2442A868 */  addiu      $v0, $v0, %lo(D_800DA868)
/* 2D768 8002CB68 00051880 */  sll        $v1, $a1, 2
/* 2D76C 8002CB6C 00621821 */  addu       $v1, $v1, $v0
/* 2D770 8002CB70 8C640000 */  lw         $a0, ($v1)
/* 2D774 8002CB74 00800008 */  jr         $a0
/* 2D778 8002CB78 00000000 */   nop
/* 2D77C 8002CB7C 0800B39C */  j          .L8002CE70
/* 2D780 8002CB80 00008821 */   addu      $s1, $zero, $zero
/* 2D784 8002CB84 24140009 */  addiu      $s4, $zero, 9
/* 2D788 8002CB88 3C01800E */  lui        $at, %hi(D_800DA8E4)
/* 2D78C 8002CB8C C436A8E4 */  lwc1       $f22, %lo(D_800DA8E4)($at)
/* 2D790 8002CB90 3C01800E */  lui        $at, %hi(D_800DA8E8)
/* 2D794 8002CB94 C434A8E8 */  lwc1       $f20, %lo(D_800DA8E8)($at)
/* 2D798 8002CB98 0800B39C */  j          .L8002CE70
/* 2D79C 8002CB9C 24130008 */   addiu     $s3, $zero, 8
/* 2D7A0 8002CBA0 24140001 */  addiu      $s4, $zero, 1
/* 2D7A4 8002CBA4 3C01800E */  lui        $at, %hi(D_800DA8EC)
/* 2D7A8 8002CBA8 C436A8EC */  lwc1       $f22, %lo(D_800DA8EC)($at)
/* 2D7AC 8002CBAC 3C01800E */  lui        $at, %hi(D_800DA8F0)
/* 2D7B0 8002CBB0 C434A8F0 */  lwc1       $f20, %lo(D_800DA8F0)($at)
/* 2D7B4 8002CBB4 0800B39C */  j          .L8002CE70
/* 2D7B8 8002CBB8 24130004 */   addiu     $s3, $zero, 4
/* 2D7BC 8002CBBC 24140001 */  addiu      $s4, $zero, 1
/* 2D7C0 8002CBC0 3C01800E */  lui        $at, %hi(D_800DA8F4)
/* 2D7C4 8002CBC4 C436A8F4 */  lwc1       $f22, %lo(D_800DA8F4)($at)
/* 2D7C8 8002CBC8 3C01800E */  lui        $at, %hi(D_800DA8F8)
/* 2D7CC 8002CBCC C434A8F8 */  lwc1       $f20, %lo(D_800DA8F8)($at)
/* 2D7D0 8002CBD0 0800B39C */  j          .L8002CE70
/* 2D7D4 8002CBD4 2413000F */   addiu     $s3, $zero, 0xf
/* 2D7D8 8002CBD8 24140008 */  addiu      $s4, $zero, 8
/* 2D7DC 8002CBDC 3C01800E */  lui        $at, %hi(D_800DA8FC)
/* 2D7E0 8002CBE0 C434A8FC */  lwc1       $f20, %lo(D_800DA8FC)($at)
/* 2D7E4 8002CBE4 2413000D */  addiu      $s3, $zero, 0xd
/* 2D7E8 8002CBE8 0800B39C */  j          .L8002CE70
/* 2D7EC 8002CBEC 4600A586 */   mov.s     $f22, $f20
/* 2D7F0 8002CBF0 24140009 */  addiu      $s4, $zero, 9
/* 2D7F4 8002CBF4 3C01800E */  lui        $at, %hi(D_800DA900)
/* 2D7F8 8002CBF8 C434A900 */  lwc1       $f20, %lo(D_800DA900)($at)
/* 2D7FC 8002CBFC 24130009 */  addiu      $s3, $zero, 9
/* 2D800 8002CC00 0800B39C */  j          .L8002CE70
/* 2D804 8002CC04 4600A586 */   mov.s     $f22, $f20
/* 2D808 8002CC08 24140010 */  addiu      $s4, $zero, 0x10
/* 2D80C 8002CC0C 3C01800E */  lui        $at, %hi(D_800DA904)
/* 2D810 8002CC10 C434A904 */  lwc1       $f20, %lo(D_800DA904)($at)
/* 2D814 8002CC14 2413001A */  addiu      $s3, $zero, 0x1a
/* 2D818 8002CC18 0800B39C */  j          .L8002CE70
/* 2D81C 8002CC1C 4600A586 */   mov.s     $f22, $f20
/* 2D820 8002CC20 24140006 */  addiu      $s4, $zero, 6
/* 2D824 8002CC24 3C01800E */  lui        $at, %hi(D_800DA908)
/* 2D828 8002CC28 C436A908 */  lwc1       $f22, %lo(D_800DA908)($at)
/* 2D82C 8002CC2C 0800B39A */  j          .L8002CE68
/* 2D830 8002CC30 24130017 */   addiu     $s3, $zero, 0x17
/* 2D834 8002CC34 0800B310 */  j          .L8002CC40
/* 2D838 8002CC38 24140001 */   addiu     $s4, $zero, 1
/* 2D83C 8002CC3C 24140002 */  addiu      $s4, $zero, 2
.L8002CC40:
/* 2D840 8002CC40 3C01800E */  lui        $at, %hi(D_800DA90C)
/* 2D844 8002CC44 C434A90C */  lwc1       $f20, %lo(D_800DA90C)($at)
/* 2D848 8002CC48 24130016 */  addiu      $s3, $zero, 0x16
/* 2D84C 8002CC4C 0800B39C */  j          .L8002CE70
/* 2D850 8002CC50 4600A586 */   mov.s     $f22, $f20
/* 2D854 8002CC54 24140011 */  addiu      $s4, $zero, 0x11
/* 2D858 8002CC58 3C01800E */  lui        $at, %hi(D_800DA910)
/* 2D85C 8002CC5C C436A910 */  lwc1       $f22, %lo(D_800DA910)($at)
/* 2D860 8002CC60 3C01800E */  lui        $at, %hi(D_800DA914)
/* 2D864 8002CC64 C434A914 */  lwc1       $f20, %lo(D_800DA914)($at)
/* 2D868 8002CC68 0800B39C */  j          .L8002CE70
/* 2D86C 8002CC6C 24130015 */   addiu     $s3, $zero, 0x15
/* 2D870 8002CC70 24140003 */  addiu      $s4, $zero, 3
/* 2D874 8002CC74 3C01800E */  lui        $at, %hi(D_800DA918)
/* 2D878 8002CC78 C436A918 */  lwc1       $f22, %lo(D_800DA918)($at)
/* 2D87C 8002CC7C 3C01800E */  lui        $at, %hi(D_800DA91C)
/* 2D880 8002CC80 C434A91C */  lwc1       $f20, %lo(D_800DA91C)($at)
/* 2D884 8002CC84 0800B39C */  j          .L8002CE70
/* 2D888 8002CC88 24130008 */   addiu     $s3, $zero, 8
/* 2D88C 8002CC8C 24140003 */  addiu      $s4, $zero, 3
/* 2D890 8002CC90 3C01800E */  lui        $at, %hi(D_800DA920)
/* 2D894 8002CC94 C434A920 */  lwc1       $f20, %lo(D_800DA920)($at)
/* 2D898 8002CC98 2413000F */  addiu      $s3, $zero, 0xf
/* 2D89C 8002CC9C 0800B39C */  j          .L8002CE70
/* 2D8A0 8002CCA0 4600A586 */   mov.s     $f22, $f20
/* 2D8A4 8002CCA4 24140009 */  addiu      $s4, $zero, 9
/* 2D8A8 8002CCA8 3C01800E */  lui        $at, %hi(D_800DA924)
/* 2D8AC 8002CCAC C434A924 */  lwc1       $f20, %lo(D_800DA924)($at)
/* 2D8B0 8002CCB0 24130012 */  addiu      $s3, $zero, 0x12
/* 2D8B4 8002CCB4 0800B39C */  j          .L8002CE70
/* 2D8B8 8002CCB8 4600A586 */   mov.s     $f22, $f20
/* 2D8BC 8002CCBC 0800B37D */  j          .L8002CDF4
/* 2D8C0 8002CCC0 24140011 */   addiu     $s4, $zero, 0x11
/* 2D8C4 8002CCC4 2414000D */  addiu      $s4, $zero, 0xd
/* 2D8C8 8002CCC8 3C01800E */  lui        $at, %hi(D_800DA928)
/* 2D8CC 8002CCCC C434A928 */  lwc1       $f20, %lo(D_800DA928)($at)
/* 2D8D0 8002CCD0 24130008 */  addiu      $s3, $zero, 8
/* 2D8D4 8002CCD4 0800B39C */  j          .L8002CE70
/* 2D8D8 8002CCD8 4600A586 */   mov.s     $f22, $f20
/* 2D8DC 8002CCDC 2414000D */  addiu      $s4, $zero, 0xd
/* 2D8E0 8002CCE0 3C01800E */  lui        $at, %hi(D_800DA92C)
/* 2D8E4 8002CCE4 C436A92C */  lwc1       $f22, %lo(D_800DA92C)($at)
/* 2D8E8 8002CCE8 3C01800E */  lui        $at, %hi(D_800DA930)
/* 2D8EC 8002CCEC C434A930 */  lwc1       $f20, %lo(D_800DA930)($at)
/* 2D8F0 8002CCF0 0800B39C */  j          .L8002CE70
/* 2D8F4 8002CCF4 24130014 */   addiu     $s3, $zero, 0x14
/* 2D8F8 8002CCF8 24140013 */  addiu      $s4, $zero, 0x13
/* 2D8FC 8002CCFC 3C01800E */  lui        $at, %hi(D_800DA934)
/* 2D900 8002CD00 C436A934 */  lwc1       $f22, %lo(D_800DA934)($at)
/* 2D904 8002CD04 3C01800E */  lui        $at, %hi(D_800DA938)
/* 2D908 8002CD08 C434A938 */  lwc1       $f20, %lo(D_800DA938)($at)
/* 2D90C 8002CD0C 0800B39C */  j          .L8002CE70
/* 2D910 8002CD10 2413001A */   addiu     $s3, $zero, 0x1a
/* 2D914 8002CD14 2414000D */  addiu      $s4, $zero, 0xd
/* 2D918 8002CD18 3C01800E */  lui        $at, %hi(D_800DA93C)
/* 2D91C 8002CD1C C436A93C */  lwc1       $f22, %lo(D_800DA93C)($at)
/* 2D920 8002CD20 3C01800E */  lui        $at, %hi(D_800DA940)
/* 2D924 8002CD24 C434A940 */  lwc1       $f20, %lo(D_800DA940)($at)
/* 2D928 8002CD28 0800B39C */  j          .L8002CE70
/* 2D92C 8002CD2C 24130006 */   addiu     $s3, $zero, 6
/* 2D930 8002CD30 24140014 */  addiu      $s4, $zero, 0x14
/* 2D934 8002CD34 3C01800E */  lui        $at, %hi(D_800DA944)
/* 2D938 8002CD38 C434A944 */  lwc1       $f20, %lo(D_800DA944)($at)
/* 2D93C 8002CD3C 2413001C */  addiu      $s3, $zero, 0x1c
/* 2D940 8002CD40 0800B39C */  j          .L8002CE70
/* 2D944 8002CD44 4600A586 */   mov.s     $f22, $f20
/* 2D948 8002CD48 24140005 */  addiu      $s4, $zero, 5
/* 2D94C 8002CD4C 3C01800E */  lui        $at, %hi(D_800DA948)
/* 2D950 8002CD50 C436A948 */  lwc1       $f22, %lo(D_800DA948)($at)
/* 2D954 8002CD54 3C01800E */  lui        $at, %hi(D_800DA94C)
/* 2D958 8002CD58 C434A94C */  lwc1       $f20, %lo(D_800DA94C)($at)
/* 2D95C 8002CD5C 0800B39C */  j          .L8002CE70
/* 2D960 8002CD60 2413000E */   addiu     $s3, $zero, 0xe
/* 2D964 8002CD64 24140007 */  addiu      $s4, $zero, 7
/* 2D968 8002CD68 3C01800E */  lui        $at, %hi(D_800DA950)
/* 2D96C 8002CD6C C436A950 */  lwc1       $f22, %lo(D_800DA950)($at)
/* 2D970 8002CD70 3C01800E */  lui        $at, %hi(D_800DA954)
/* 2D974 8002CD74 C434A954 */  lwc1       $f20, %lo(D_800DA954)($at)
/* 2D978 8002CD78 0800B39C */  j          .L8002CE70
/* 2D97C 8002CD7C 2413000C */   addiu     $s3, $zero, 0xc
/* 2D980 8002CD80 24140003 */  addiu      $s4, $zero, 3
/* 2D984 8002CD84 3C01800E */  lui        $at, %hi(D_800DA958)
/* 2D988 8002CD88 C436A958 */  lwc1       $f22, %lo(D_800DA958)($at)
/* 2D98C 8002CD8C 3C01800E */  lui        $at, %hi(D_800DA95C)
/* 2D990 8002CD90 C434A95C */  lwc1       $f20, %lo(D_800DA95C)($at)
/* 2D994 8002CD94 0800B39C */  j          .L8002CE70
/* 2D998 8002CD98 24130009 */   addiu     $s3, $zero, 9
/* 2D99C 8002CD9C 24140010 */  addiu      $s4, $zero, 0x10
/* 2D9A0 8002CDA0 3C01800E */  lui        $at, %hi(D_800DA960)
/* 2D9A4 8002CDA4 C436A960 */  lwc1       $f22, %lo(D_800DA960)($at)
/* 2D9A8 8002CDA8 3C01800E */  lui        $at, %hi(D_800DA964)
/* 2D9AC 8002CDAC C434A964 */  lwc1       $f20, %lo(D_800DA964)($at)
/* 2D9B0 8002CDB0 0800B39C */  j          .L8002CE70
/* 2D9B4 8002CDB4 2413001B */   addiu     $s3, $zero, 0x1b
/* 2D9B8 8002CDB8 24140010 */  addiu      $s4, $zero, 0x10
/* 2D9BC 8002CDBC 3C01800E */  lui        $at, %hi(D_800DA968)
/* 2D9C0 8002CDC0 C436A968 */  lwc1       $f22, %lo(D_800DA968)($at)
/* 2D9C4 8002CDC4 3C01800E */  lui        $at, %hi(D_800DA96C)
/* 2D9C8 8002CDC8 C434A96C */  lwc1       $f20, %lo(D_800DA96C)($at)
/* 2D9CC 8002CDCC 0800B39C */  j          .L8002CE70
/* 2D9D0 8002CDD0 24130011 */   addiu     $s3, $zero, 0x11
/* 2D9D4 8002CDD4 2414000F */  addiu      $s4, $zero, 0xf
/* 2D9D8 8002CDD8 3C01800E */  lui        $at, %hi(D_800DA970)
/* 2D9DC 8002CDDC C436A970 */  lwc1       $f22, %lo(D_800DA970)($at)
/* 2D9E0 8002CDE0 3C01800E */  lui        $at, %hi(D_800DA974)
/* 2D9E4 8002CDE4 C434A974 */  lwc1       $f20, %lo(D_800DA974)($at)
/* 2D9E8 8002CDE8 0800B39C */  j          .L8002CE70
/* 2D9EC 8002CDEC 24130019 */   addiu     $s3, $zero, 0x19
/* 2D9F0 8002CDF0 24140013 */  addiu      $s4, $zero, 0x13
.L8002CDF4:
/* 2D9F4 8002CDF4 3C01800E */  lui        $at, %hi(D_800DA978)
/* 2D9F8 8002CDF8 C434A978 */  lwc1       $f20, %lo(D_800DA978)($at)
/* 2D9FC 8002CDFC 24130010 */  addiu      $s3, $zero, 0x10
/* 2DA00 8002CE00 0800B39C */  j          .L8002CE70
/* 2DA04 8002CE04 4600A586 */   mov.s     $f22, $f20
/* 2DA08 8002CE08 24140012 */  addiu      $s4, $zero, 0x12
/* 2DA0C 8002CE0C 3C01800E */  lui        $at, %hi(D_800DA97C)
/* 2DA10 8002CE10 C436A97C */  lwc1       $f22, %lo(D_800DA97C)($at)
/* 2DA14 8002CE14 3C01800E */  lui        $at, %hi(D_800DA980)
/* 2DA18 8002CE18 C434A980 */  lwc1       $f20, %lo(D_800DA980)($at)
/* 2DA1C 8002CE1C 0800B39C */  j          .L8002CE70
/* 2DA20 8002CE20 24130015 */   addiu     $s3, $zero, 0x15
/* 2DA24 8002CE24 2414000C */  addiu      $s4, $zero, 0xc
/* 2DA28 8002CE28 3C01800E */  lui        $at, %hi(D_800DA984)
/* 2DA2C 8002CE2C C436A984 */  lwc1       $f22, %lo(D_800DA984)($at)
/* 2DA30 8002CE30 3C01800E */  lui        $at, %hi(D_800DA988)
/* 2DA34 8002CE34 C434A988 */  lwc1       $f20, %lo(D_800DA988)($at)
/* 2DA38 8002CE38 0800B39C */  j          .L8002CE70
/* 2DA3C 8002CE3C 24130010 */   addiu     $s3, $zero, 0x10
/* 2DA40 8002CE40 2414000E */  addiu      $s4, $zero, 0xe
/* 2DA44 8002CE44 3C01800E */  lui        $at, %hi(D_800DA98C)
/* 2DA48 8002CE48 C434A98C */  lwc1       $f20, %lo(D_800DA98C)($at)
/* 2DA4C 8002CE4C 2413001B */  addiu      $s3, $zero, 0x1b
/* 2DA50 8002CE50 0800B39C */  j          .L8002CE70
/* 2DA54 8002CE54 4600A586 */   mov.s     $f22, $f20
/* 2DA58 8002CE58 24140006 */  addiu      $s4, $zero, 6
/* 2DA5C 8002CE5C 24130008 */  addiu      $s3, $zero, 8
/* 2DA60 8002CE60 3C01800E */  lui        $at, %hi(D_800DA990)
/* 2DA64 8002CE64 C436A990 */  lwc1       $f22, %lo(D_800DA990)($at)
.L8002CE68:
/* 2DA68 8002CE68 3C01800E */  lui        $at, %hi(D_800DA994)
/* 2DA6C 8002CE6C C434A994 */  lwc1       $f20, %lo(D_800DA994)($at)
.L8002CE70:
/* 2DA70 8002CE70 3C02800E */  lui        $v0, %hi(D_800DA784)
/* 2DA74 8002CE74 2446A784 */  addiu      $a2, $v0, %lo(D_800DA784)
/* 2DA78 8002CE78 88C30000 */  lwl        $v1, ($a2)
/* 2DA7C 8002CE7C 98C30003 */  lwr        $v1, 3($a2)
/* 2DA80 8002CE80 88C40004 */  lwl        $a0, 4($a2)
/* 2DA84 8002CE84 98C40007 */  lwr        $a0, 7($a2)
/* 2DA88 8002CE88 88C50008 */  lwl        $a1, 8($a2)
/* 2DA8C 8002CE8C 98C5000B */  lwr        $a1, 0xb($a2)
/* 2DA90 8002CE90 ABA30010 */  swl        $v1, 0x10($sp)
/* 2DA94 8002CE94 BBA30013 */  swr        $v1, 0x13($sp)
/* 2DA98 8002CE98 ABA40014 */  swl        $a0, 0x14($sp)
/* 2DA9C 8002CE9C BBA40017 */  swr        $a0, 0x17($sp)
/* 2DAA0 8002CEA0 ABA50018 */  swl        $a1, 0x18($sp)
/* 2DAA4 8002CEA4 BBA5001B */  swr        $a1, 0x1b($sp)
/* 2DAA8 8002CEA8 88C3000C */  lwl        $v1, 0xc($a2)
/* 2DAAC 8002CEAC 98C3000F */  lwr        $v1, 0xf($a2)
/* 2DAB0 8002CEB0 88C40010 */  lwl        $a0, 0x10($a2)
/* 2DAB4 8002CEB4 98C40013 */  lwr        $a0, 0x13($a2)
/* 2DAB8 8002CEB8 88C50014 */  lwl        $a1, 0x14($a2)
/* 2DABC 8002CEBC 98C50017 */  lwr        $a1, 0x17($a2)
/* 2DAC0 8002CEC0 ABA3001C */  swl        $v1, 0x1c($sp)
/* 2DAC4 8002CEC4 BBA3001F */  swr        $v1, 0x1f($sp)
/* 2DAC8 8002CEC8 ABA40020 */  swl        $a0, 0x20($sp)
/* 2DACC 8002CECC BBA40023 */  swr        $a0, 0x23($sp)
/* 2DAD0 8002CED0 ABA50024 */  swl        $a1, 0x24($sp)
/* 2DAD4 8002CED4 BBA50027 */  swr        $a1, 0x27($sp)
/* 2DAD8 8002CED8 88C30018 */  lwl        $v1, 0x18($a2)
/* 2DADC 8002CEDC 98C3001B */  lwr        $v1, 0x1b($a2)
/* 2DAE0 8002CEE0 ABA30028 */  swl        $v1, 0x28($sp)
/* 2DAE4 8002CEE4 BBA3002B */  swr        $v1, 0x2b($sp)
/* 2DAE8 8002CEE8 27A80050 */  addiu      $t0, $sp, 0x50
/* 2DAEC 8002CEEC 3C02800E */  lui        $v0, %hi(D_800DA7A0)
/* 2DAF0 8002CEF0 2449A7A0 */  addiu      $t1, $v0, %lo(D_800DA7A0)
/* 2DAF4 8002CEF4 31230003 */  andi       $v1, $t1, 3
/* 2DAF8 8002CEF8 10600018 */  beqz       $v1, .L8002CF5C
/* 2DAFC 8002CEFC 01009021 */   addu      $s2, $t0, $zero
/* 2DB00 8002CF00 25220020 */  addiu      $v0, $t1, 0x20
/* 2DB04 8002CF04 3C10800F */  lui        $s0, 0x800f
.L8002CF08:
/* 2DB08 8002CF08 89270000 */  lwl        $a3, ($t1)
/* 2DB0C 8002CF0C 99270003 */  lwr        $a3, 3($t1)
/* 2DB10 8002CF10 892A0004 */  lwl        $t2, 4($t1)
/* 2DB14 8002CF14 992A0007 */  lwr        $t2, 7($t1)
/* 2DB18 8002CF18 892B0008 */  lwl        $t3, 8($t1)
/* 2DB1C 8002CF1C 992B000B */  lwr        $t3, 0xb($t1)
/* 2DB20 8002CF20 8923000C */  lwl        $v1, 0xc($t1)
/* 2DB24 8002CF24 9923000F */  lwr        $v1, 0xf($t1)
/* 2DB28 8002CF28 A9070000 */  swl        $a3, ($t0)
/* 2DB2C 8002CF2C B9070003 */  swr        $a3, 3($t0)
/* 2DB30 8002CF30 A90A0004 */  swl        $t2, 4($t0)
/* 2DB34 8002CF34 B90A0007 */  swr        $t2, 7($t0)
/* 2DB38 8002CF38 A90B0008 */  swl        $t3, 8($t0)
/* 2DB3C 8002CF3C B90B000B */  swr        $t3, 0xb($t0)
/* 2DB40 8002CF40 A903000C */  swl        $v1, 0xc($t0)
/* 2DB44 8002CF44 B903000F */  swr        $v1, 0xf($t0)
/* 2DB48 8002CF48 25290010 */  addiu      $t1, $t1, 0x10
/* 2DB4C 8002CF4C 1522FFEE */  bne        $t1, $v0, .L8002CF08
/* 2DB50 8002CF50 25080010 */   addiu     $t0, $t0, 0x10
/* 2DB54 8002CF54 0800B3E5 */  j          .L8002CF94
/* 2DB58 8002CF58 27A40010 */   addiu     $a0, $sp, 0x10
.L8002CF5C:
/* 2DB5C 8002CF5C 25220020 */  addiu      $v0, $t1, 0x20
/* 2DB60 8002CF60 3C10800F */  lui        $s0, 0x800f
.L8002CF64:
/* 2DB64 8002CF64 8D240000 */  lw         $a0, ($t1)
/* 2DB68 8002CF68 8D250004 */  lw         $a1, 4($t1)
/* 2DB6C 8002CF6C 8D260008 */  lw         $a2, 8($t1)
/* 2DB70 8002CF70 8D27000C */  lw         $a3, 0xc($t1)
/* 2DB74 8002CF74 AD040000 */  sw         $a0, ($t0)
/* 2DB78 8002CF78 AD050004 */  sw         $a1, 4($t0)
/* 2DB7C 8002CF7C AD060008 */  sw         $a2, 8($t0)
/* 2DB80 8002CF80 AD07000C */  sw         $a3, 0xc($t0)
/* 2DB84 8002CF84 25290010 */  addiu      $t1, $t1, 0x10
/* 2DB88 8002CF88 1522FFF6 */  bne        $t1, $v0, .L8002CF64
/* 2DB8C 8002CF8C 25080010 */   addiu     $t0, $t0, 0x10
/* 2DB90 8002CF90 27A40010 */  addiu      $a0, $sp, 0x10
.L8002CF94:
/* 2DB94 8002CF94 2406062C */  addiu      $a2, $zero, 0x62c
/* 2DB98 8002CF98 2610B690 */  addiu      $s0, $s0, -0x4970
/* 2DB9C 8002CF9C 86C20294 */  lh         $v0, 0x294($s6)
/* 2DBA0 8002CFA0 86C50292 */  lh         $a1, 0x292($s6)
/* 2DBA4 8002CFA4 00023840 */  sll        $a3, $v0, 1
/* 2DBA8 8002CFA8 00E23821 */  addu       $a3, $a3, $v0
/* 2DBAC 8002CFAC 00073840 */  sll        $a3, $a3, 1
/* 2DBB0 8002CFB0 00051840 */  sll        $v1, $a1, 1
/* 2DBB4 8002CFB4 00651821 */  addu       $v1, $v1, $a1
/* 2DBB8 8002CFB8 00031100 */  sll        $v0, $v1, 4
/* 2DBBC 8002CFBC 00431023 */  subu       $v0, $v0, $v1
/* 2DBC0 8002CFC0 00021080 */  sll        $v0, $v0, 2
/* 2DBC4 8002CFC4 00E23821 */  addu       $a3, $a3, $v0
/* 2DBC8 8002CFC8 00F03821 */  addu       $a3, $a3, $s0
/* 2DBCC 8002CFCC 94E50000 */  lhu        $a1, ($a3)
/* 2DBD0 8002CFD0 2407062D */  addiu      $a3, $zero, 0x62d
/* 2DBD4 8002CFD4 892A0000 */  lwl        $t2, ($t1)
/* 2DBD8 8002CFD8 992A0003 */  lwr        $t2, 3($t1)
/* 2DBDC 8002CFDC 892B0004 */  lwl        $t3, 4($t1)
/* 2DBE0 8002CFE0 992B0007 */  lwr        $t3, 7($t1)
/* 2DBE4 8002CFE4 89220008 */  lwl        $v0, 8($t1)
/* 2DBE8 8002CFE8 9922000B */  lwr        $v0, 0xb($t1)
/* 2DBEC 8002CFEC 8523000C */  lh         $v1, 0xc($t1)
/* 2DBF0 8002CFF0 A90A0000 */  swl        $t2, ($t0)
/* 2DBF4 8002CFF4 B90A0003 */  swr        $t2, 3($t0)
/* 2DBF8 8002CFF8 A90B0004 */  swl        $t3, 4($t0)
/* 2DBFC 8002CFFC B90B0007 */  swr        $t3, 7($t0)
/* 2DC00 8002D000 A9020008 */  swl        $v0, 8($t0)
/* 2DC04 8002D004 B902000B */  swr        $v0, 0xb($t0)
/* 2DC08 8002D008 0C00B27F */  jal        set_BGM_track
/* 2DC0C 8002D00C A503000C */   sh        $v1, 0xc($t0)
/* 2DC10 8002D010 02402021 */  addu       $a0, $s2, $zero
/* 2DC14 8002D014 240605EA */  addiu      $a2, $zero, 0x5ea
/* 2DC18 8002D018 86C20294 */  lh         $v0, 0x294($s6)
/* 2DC1C 8002D01C 86C50292 */  lh         $a1, 0x292($s6)
/* 2DC20 8002D020 00023840 */  sll        $a3, $v0, 1
/* 2DC24 8002D024 00E23821 */  addu       $a3, $a3, $v0
/* 2DC28 8002D028 00073840 */  sll        $a3, $a3, 1
/* 2DC2C 8002D02C 00051840 */  sll        $v1, $a1, 1
/* 2DC30 8002D030 00651821 */  addu       $v1, $v1, $a1
/* 2DC34 8002D034 00031100 */  sll        $v0, $v1, 4
/* 2DC38 8002D038 00431023 */  subu       $v0, $v0, $v1
/* 2DC3C 8002D03C 00021080 */  sll        $v0, $v0, 2
/* 2DC40 8002D040 00E23821 */  addu       $a3, $a3, $v0
/* 2DC44 8002D044 00F03821 */  addu       $a3, $a3, $s0
/* 2DC48 8002D048 94E50000 */  lhu        $a1, ($a3)
/* 2DC4C 8002D04C 0C00B27F */  jal        set_BGM_track
/* 2DC50 8002D050 240705EB */   addiu     $a3, $zero, 0x5eb
/* 2DC54 8002D054 0800B580 */  j          .L8002D600
/* 2DC58 8002D058 00000000 */   nop
/* 2DC5C 8002D05C 3C02800F */  lui        $v0, %hi(mapDataList_1)
/* 2DC60 8002D060 0800B538 */  j          .L8002D4E0
/* 2DC64 8002D064 2455A46C */   addiu     $s5, $v0, %lo(mapDataList_1)
/* 2DC68 8002D068 3C02800F */  lui        $v0, %hi(D_800EA55C)
/* 2DC6C 8002D06C 0800B538 */  j          .L8002D4E0
/* 2DC70 8002D070 2455A55C */   addiu     $s5, $v0, %lo(D_800EA55C)
/* 2DC74 8002D074 3C02800F */  lui        $v0, %hi(mapDataList_3)
/* 2DC78 8002D078 0800B538 */  j          .L8002D4E0
/* 2DC7C 8002D07C 2455A664 */   addiu     $s5, $v0, %lo(mapDataList_3)
/* 2DC80 8002D080 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2DC84 8002D084 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 2DC88 8002D088 240305FD */  addiu      $v1, $zero, 0x5fd
/* 2DC8C 8002D08C A603101A */  sh         $v1, 0x101a($s0)
/* 2DC90 8002D090 3C02800F */  lui        $v0, %hi(map_data_list_gwen)
/* 2DC94 8002D094 16E00171 */  bnez       $s7, .L8002D65C
/* 2DC98 8002D098 2455A6A0 */   addiu     $s5, $v0, %lo(map_data_list_gwen)
/* 2DC9C 8002D09C 0C00B18E */  jal        write_map_index_matrix
/* 2DCA0 8002D0A0 02A02021 */   addu      $a0, $s5, $zero
/* 2DCA4 8002D0A4 2604150C */  addiu      $a0, $s0, 0x150c
/* 2DCA8 8002D0A8 3C05800F */  lui        $a1, %hi(minimaps_gwen)
/* 2DCAC 8002D0AC 0C014516 */  jal        load_minimapDat
/* 2DCB0 8002D0B0 24A5DC40 */   addiu     $a1, $a1, %lo(minimaps_gwen)
/* 2DCB4 8002D0B4 24040001 */  addiu      $a0, $zero, 1
/* 2DCB8 8002D0B8 0800B580 */  j          .L8002D600
/* 2DCBC 8002D0BC AFA40090 */   sw        $a0, 0x90($sp)
/* 2DCC0 8002D0C0 3C02800F */  lui        $v0, %hi(mapDataList_5)
/* 2DCC4 8002D0C4 0800B538 */  j          .L8002D4E0
/* 2DCC8 8002D0C8 2455A8A4 */   addiu     $s5, $v0, %lo(mapDataList_5)
/* 2DCCC 8002D0CC 16E0000E */  bnez       $s7, .L8002D108
/* 2DCD0 8002D0D0 3C10800F */   lui       $s0, %hi(D_800EA934)
/* 2DCD4 8002D0D4 2604A934 */  addiu      $a0, $s0, %lo(D_800EA934)
/* 2DCD8 8002D0D8 3C01800E */  lui        $at, %hi(D_800DA998)
/* 2DCDC 8002D0DC C420A998 */  lwc1       $f0, %lo(D_800DA998)($at)
/* 2DCE0 8002D0E0 24050001 */  addiu      $a1, $zero, 1
/* 2DCE4 8002D0E4 AFA50090 */  sw         $a1, 0x90($sp)
/* 2DCE8 8002D0E8 E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2DCEC 8002D0EC 0C00B18E */  jal        write_map_index_matrix
/* 2DCF0 8002D0F0 E6C0029C */   swc1      $f0, 0x29c($s6)
/* 2DCF4 8002D0F4 3C04800E */  lui        $a0, %hi(MinimapStruct)
/* 2DCF8 8002D0F8 24847DB4 */  addiu      $a0, $a0, %lo(MinimapStruct)
/* 2DCFC 8002D0FC 3C05800F */  lui        $a1, %hi(D_800EE508)
/* 2DD00 8002D100 0C014516 */  jal        load_minimapDat
/* 2DD04 8002D104 24A5E508 */   addiu     $a1, $a1, %lo(D_800EE508)
.L8002D108:
/* 2DD08 8002D108 24110001 */  addiu      $s1, $zero, 1
/* 2DD0C 8002D10C 1240000B */  beqz       $s2, .L8002D13C
/* 2DD10 8002D110 2615A934 */   addiu     $s5, $s0, -0x56cc
/* 2DD14 8002D114 1E400005 */  bgtz       $s2, .L8002D12C
/* 2DD18 8002D118 2402FFFF */   addiu     $v0, $zero, -1
/* 2DD1C 8002D11C 52420138 */  beql       $s2, $v0, .L8002D600
/* 2DD20 8002D120 00008821 */   addu      $s1, $zero, $zero
/* 2DD24 8002D124 0800B580 */  j          .L8002D600
/* 2DD28 8002D128 00000000 */   nop
.L8002D12C:
/* 2DD2C 8002D12C 5251000A */  beql       $s2, $s1, .L8002D158
/* 2DD30 8002D130 24140001 */   addiu     $s4, $zero, 1
/* 2DD34 8002D134 0800B580 */  j          .L8002D600
/* 2DD38 8002D138 00000000 */   nop
.L8002D13C:
/* 2DD3C 8002D13C 24140005 */  addiu      $s4, $zero, 5
/* 2DD40 8002D140 3C01800E */  lui        $at, %hi(D_800DA99C)
/* 2DD44 8002D144 C436A99C */  lwc1       $f22, %lo(D_800DA99C)($at)
/* 2DD48 8002D148 3C01800E */  lui        $at, %hi(D_800DA9A0)
/* 2DD4C 8002D14C C434A9A0 */  lwc1       $f20, %lo(D_800DA9A0)($at)
/* 2DD50 8002D150 0800B580 */  j          .L8002D600
/* 2DD54 8002D154 24130003 */   addiu     $s3, $zero, 3
.L8002D158:
/* 2DD58 8002D158 3C01800E */  lui        $at, %hi(D_800DA9A4)
/* 2DD5C 8002D15C C434A9A4 */  lwc1       $f20, %lo(D_800DA9A4)($at)
/* 2DD60 8002D160 0800B57F */  j          .L8002D5FC
/* 2DD64 8002D164 24130001 */   addiu     $s3, $zero, 1
/* 2DD68 8002D168 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2DD6C 8002D16C 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 2DD70 8002D170 24030790 */  addiu      $v1, $zero, 0x790
/* 2DD74 8002D174 A603101A */  sh         $v1, 0x101a($s0)
/* 2DD78 8002D178 3C02800F */  lui        $v0, %hi(D_800EAA6C)
/* 2DD7C 8002D17C 16E0000D */  bnez       $s7, .L8002D1B4
/* 2DD80 8002D180 2455AA6C */   addiu     $s5, $v0, %lo(D_800EAA6C)
/* 2DD84 8002D184 02A02021 */  addu       $a0, $s5, $zero
/* 2DD88 8002D188 3C01800E */  lui        $at, %hi(D_800DA9A8)
/* 2DD8C 8002D18C C420A9A8 */  lwc1       $f0, %lo(D_800DA9A8)($at)
/* 2DD90 8002D190 24060001 */  addiu      $a2, $zero, 1
/* 2DD94 8002D194 AFA60090 */  sw         $a2, 0x90($sp)
/* 2DD98 8002D198 E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2DD9C 8002D19C 0C00B18E */  jal        write_map_index_matrix
/* 2DDA0 8002D1A0 E6C0029C */   swc1      $f0, 0x29c($s6)
/* 2DDA4 8002D1A4 2604150C */  addiu      $a0, $s0, 0x150c
/* 2DDA8 8002D1A8 3C05800F */  lui        $a1, %hi(D_800EDF7C)
/* 2DDAC 8002D1AC 0C014516 */  jal        load_minimapDat
/* 2DDB0 8002D1B0 24A5DF7C */   addiu     $a1, $a1, %lo(D_800EDF7C)
.L8002D1B4:
/* 2DDB4 8002D1B4 2402FFFF */  addiu      $v0, $zero, -1
/* 2DDB8 8002D1B8 124200AA */  beq        $s2, $v0, .L8002D464
/* 2DDBC 8002D1BC 24110001 */   addiu     $s1, $zero, 1
/* 2DDC0 8002D1C0 1640010F */  bnez       $s2, .L8002D600
/* 2DDC4 8002D1C4 00000000 */   nop
/* 2DDC8 8002D1C8 24140001 */  addiu      $s4, $zero, 1
/* 2DDCC 8002D1CC 3C01800E */  lui        $at, %hi(D_800DA9AC)
/* 2DDD0 8002D1D0 C436A9AC */  lwc1       $f22, %lo(D_800DA9AC)($at)
/* 2DDD4 8002D1D4 3C01800E */  lui        $at, %hi(D_800DA9B0)
/* 2DDD8 8002D1D8 C434A9B0 */  lwc1       $f20, %lo(D_800DA9B0)($at)
/* 2DDDC 8002D1DC 0800B580 */  j          .L8002D600
/* 2DDE0 8002D1E0 2413000F */   addiu     $s3, $zero, 0xf
/* 2DDE4 8002D1E4 3C02800F */  lui        $v0, %hi(D_800EABC8)
/* 2DDE8 8002D1E8 16E0011C */  bnez       $s7, .L8002D65C
/* 2DDEC 8002D1EC 2455ABC8 */   addiu     $s5, $v0, %lo(D_800EABC8)
/* 2DDF0 8002D1F0 3C01800E */  lui        $at, %hi(D_800DA9B4)
/* 2DDF4 8002D1F4 C420A9B4 */  lwc1       $f0, %lo(D_800DA9B4)($at)
/* 2DDF8 8002D1F8 02A02021 */  addu       $a0, $s5, $zero
/* 2DDFC 8002D1FC E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2DE00 8002D200 0C00B18E */  jal        write_map_index_matrix
/* 2DE04 8002D204 E6C0029C */   swc1      $f0, 0x29c($s6)
/* 2DE08 8002D208 0800B580 */  j          .L8002D600
/* 2DE0C 8002D20C 00000000 */   nop
/* 2DE10 8002D210 3C02800F */  lui        $v0, %hi(D_800EAD6C)
/* 2DE14 8002D214 16E0000E */  bnez       $s7, .L8002D250
/* 2DE18 8002D218 2455AD6C */   addiu     $s5, $v0, %lo(D_800EAD6C)
/* 2DE1C 8002D21C 02A02021 */  addu       $a0, $s5, $zero
/* 2DE20 8002D220 3C01800E */  lui        $at, %hi(D_800DA9B8)
/* 2DE24 8002D224 C420A9B8 */  lwc1       $f0, %lo(D_800DA9B8)($at)
/* 2DE28 8002D228 24070001 */  addiu      $a3, $zero, 1
/* 2DE2C 8002D22C AFA70090 */  sw         $a3, 0x90($sp)
/* 2DE30 8002D230 E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2DE34 8002D234 0C00B18E */  jal        write_map_index_matrix
/* 2DE38 8002D238 E6C0029C */   swc1      $f0, 0x29c($s6)
/* 2DE3C 8002D23C 3C04800E */  lui        $a0, %hi(MinimapStruct)
/* 2DE40 8002D240 24847DB4 */  addiu      $a0, $a0, %lo(MinimapStruct)
/* 2DE44 8002D244 3C05800F */  lui        $a1, %hi(minimap_sec_Barrows)
/* 2DE48 8002D248 0C014516 */  jal        load_minimapDat
/* 2DE4C 8002D24C 24A5E5A4 */   addiu     $a1, $a1, %lo(minimap_sec_Barrows)
.L8002D250:
/* 2DE50 8002D250 2402FFFF */  addiu      $v0, $zero, -1
/* 2DE54 8002D254 12420083 */  beq        $s2, $v0, .L8002D464
/* 2DE58 8002D258 24110001 */   addiu     $s1, $zero, 1
/* 2DE5C 8002D25C 564000E8 */  bnel       $s2, $zero, .L8002D600
/* 2DE60 8002D260 00008821 */   addu      $s1, $zero, $zero
/* 2DE64 8002D264 24140004 */  addiu      $s4, $zero, 4
/* 2DE68 8002D268 3C01800E */  lui        $at, %hi(D_800DA9BC)
/* 2DE6C 8002D26C C434A9BC */  lwc1       $f20, %lo(D_800DA9BC)($at)
/* 2DE70 8002D270 0800B57F */  j          .L8002D5FC
/* 2DE74 8002D274 24130001 */   addiu     $s3, $zero, 1
/* 2DE78 8002D278 3C02800F */  lui        $v0, %hi(D_800EAE38)
/* 2DE7C 8002D27C 16E000F7 */  bnez       $s7, .L8002D65C
/* 2DE80 8002D280 2455AE38 */   addiu     $s5, $v0, %lo(D_800EAE38)
/* 2DE84 8002D284 0C00B18E */  jal        write_map_index_matrix
/* 2DE88 8002D288 02A02021 */   addu      $a0, $s5, $zero
/* 2DE8C 8002D28C 3C04800E */  lui        $a0, %hi(MinimapStruct)
/* 2DE90 8002D290 24847DB4 */  addiu      $a0, $a0, %lo(MinimapStruct)
/* 2DE94 8002D294 3C05800F */  lui        $a1, %hi(D_800EE55C)
/* 2DE98 8002D298 0C014516 */  jal        load_minimapDat
/* 2DE9C 8002D29C 24A5E55C */   addiu     $a1, $a1, %lo(D_800EE55C)
/* 2DEA0 8002D2A0 24080001 */  addiu      $t0, $zero, 1
/* 2DEA4 8002D2A4 0800B580 */  j          .L8002D600
/* 2DEA8 8002D2A8 AFA80090 */   sw        $t0, 0x90($sp)
/* 2DEAC 8002D2AC 3C02800F */  lui        $v0, %hi(mapDataList_mageSchool)
/* 2DEB0 8002D2B0 16E0000A */  bnez       $s7, .L8002D2DC
/* 2DEB4 8002D2B4 2455AE80 */   addiu     $s5, $v0, %lo(mapDataList_mageSchool)
/* 2DEB8 8002D2B8 0C00B18E */  jal        write_map_index_matrix
/* 2DEBC 8002D2BC 02A02021 */   addu      $a0, $s5, $zero
/* 2DEC0 8002D2C0 3C04800E */  lui        $a0, %hi(MinimapStruct)
/* 2DEC4 8002D2C4 24847DB4 */  addiu      $a0, $a0, %lo(MinimapStruct)
/* 2DEC8 8002D2C8 3C05800F */  lui        $a1, %hi(minimap_sec_mageschool)
/* 2DECC 8002D2CC 0C014516 */  jal        load_minimapDat
/* 2DED0 8002D2D0 24A5E46C */   addiu     $a1, $a1, %lo(minimap_sec_mageschool)
/* 2DED4 8002D2D4 24090001 */  addiu      $t1, $zero, 1
/* 2DED8 8002D2D8 AFA90090 */  sw         $t1, 0x90($sp)
.L8002D2DC:
/* 2DEDC 8002D2DC 2402FFFF */  addiu      $v0, $zero, -1
/* 2DEE0 8002D2E0 12420005 */  beq        $s2, $v0, .L8002D2F8
/* 2DEE4 8002D2E4 24110001 */   addiu     $s1, $zero, 1
/* 2DEE8 8002D2E8 12400005 */  beqz       $s2, .L8002D300
/* 2DEEC 8002D2EC 27A40010 */   addiu     $a0, $sp, 0x10
/* 2DEF0 8002D2F0 0800B4C8 */  j          .L8002D320
/* 2DEF4 8002D2F4 2406061C */   addiu     $a2, $zero, 0x61c
.L8002D2F8:
/* 2DEF8 8002D2F8 0800B4C6 */  j          .L8002D318
/* 2DEFC 8002D2FC 00008821 */   addu      $s1, $zero, $zero
.L8002D300:
/* 2DF00 8002D300 24140001 */  addiu      $s4, $zero, 1
/* 2DF04 8002D304 24130001 */  addiu      $s3, $zero, 1
/* 2DF08 8002D308 3C01800E */  lui        $at, %hi(D_800DA9C0)
/* 2DF0C 8002D30C C436A9C0 */  lwc1       $f22, %lo(D_800DA9C0)($at)
/* 2DF10 8002D310 3C01800E */  lui        $at, %hi(D_800DA9C4)
/* 2DF14 8002D314 C434A9C4 */  lwc1       $f20, %lo(D_800DA9C4)($at)
.L8002D318:
/* 2DF18 8002D318 27A40010 */  addiu      $a0, $sp, 0x10
/* 2DF1C 8002D31C 2406061C */  addiu      $a2, $zero, 0x61c
.L8002D320:
/* 2DF20 8002D320 3C09800F */  lui        $t1, %hi(map_index_matrix)
/* 2DF24 8002D324 2529B690 */  addiu      $t1, $t1, %lo(map_index_matrix)
/* 2DF28 8002D328 86C20294 */  lh         $v0, 0x294($s6)
/* 2DF2C 8002D32C 86C50292 */  lh         $a1, 0x292($s6)
/* 2DF30 8002D330 00024040 */  sll        $t0, $v0, 1
/* 2DF34 8002D334 01024021 */  addu       $t0, $t0, $v0
/* 2DF38 8002D338 00084040 */  sll        $t0, $t0, 1
/* 2DF3C 8002D33C 00051840 */  sll        $v1, $a1, 1
/* 2DF40 8002D340 00651821 */  addu       $v1, $v1, $a1
/* 2DF44 8002D344 00031100 */  sll        $v0, $v1, 4
/* 2DF48 8002D348 00431023 */  subu       $v0, $v0, $v1
/* 2DF4C 8002D34C 00021080 */  sll        $v0, $v0, 2
/* 2DF50 8002D350 01024021 */  addu       $t0, $t0, $v0
/* 2DF54 8002D354 01094021 */  addu       $t0, $t0, $t1
/* 2DF58 8002D358 95050000 */  lhu        $a1, ($t0)
/* 2DF5C 8002D35C 3C02800E */  lui        $v0, %hi(D_800DA7D0)
/* 2DF60 8002D360 2448A7D0 */  addiu      $t0, $v0, %lo(D_800DA7D0)
/* 2DF64 8002D364 890A0000 */  lwl        $t2, ($t0)
/* 2DF68 8002D368 990A0003 */  lwr        $t2, 3($t0)
/* 2DF6C 8002D36C 890B0004 */  lwl        $t3, 4($t0)
/* 2DF70 8002D370 990B0007 */  lwr        $t3, 7($t0)
/* 2DF74 8002D374 89030008 */  lwl        $v1, 8($t0)
/* 2DF78 8002D378 9903000B */  lwr        $v1, 0xb($t0)
/* 2DF7C 8002D37C ABAA0010 */  swl        $t2, 0x10($sp)
/* 2DF80 8002D380 BBAA0013 */  swr        $t2, 0x13($sp)
/* 2DF84 8002D384 ABAB0014 */  swl        $t3, 0x14($sp)
/* 2DF88 8002D388 BBAB0017 */  swr        $t3, 0x17($sp)
/* 2DF8C 8002D38C ABA30018 */  swl        $v1, 0x18($sp)
/* 2DF90 8002D390 BBA3001B */  swr        $v1, 0x1b($sp)
/* 2DF94 8002D394 890A000C */  lwl        $t2, 0xc($t0)
/* 2DF98 8002D398 990A000F */  lwr        $t2, 0xf($t0)
/* 2DF9C 8002D39C ABAA001C */  swl        $t2, 0x1c($sp)
/* 2DFA0 8002D3A0 BBAA001F */  swr        $t2, 0x1f($sp)
/* 2DFA4 8002D3A4 0C00B27F */  jal        set_BGM_track
/* 2DFA8 8002D3A8 2407061C */   addiu     $a3, $zero, 0x61c
/* 2DFAC 8002D3AC 0800B580 */  j          .L8002D600
/* 2DFB0 8002D3B0 00000000 */   nop
/* 2DFB4 8002D3B4 3C02800F */  lui        $v0, %hi(mapDataList_ehud)
/* 2DFB8 8002D3B8 2455AFC4 */  addiu      $s5, $v0, %lo(mapDataList_ehud)
/* 2DFBC 8002D3BC 3C03800E */  lui        $v1, %hi(gGlobals)
/* 2DFC0 8002D3C0 247068A8 */  addiu      $s0, $v1, %lo(gGlobals)
/* 2DFC4 8002D3C4 3C01800E */  lui        $at, %hi(D_800DA9C8)
/* 2DFC8 8002D3C8 C420A9C8 */  lwc1       $f0, %lo(D_800DA9C8)($at)
/* 2DFCC 8002D3CC 240205DF */  addiu      $v0, $zero, 0x5df
/* 2DFD0 8002D3D0 A602101A */  sh         $v0, 0x101a($s0)
/* 2DFD4 8002D3D4 E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2DFD8 8002D3D8 16E00009 */  bnez       $s7, .L8002D400
/* 2DFDC 8002D3DC E6C0029C */   swc1      $f0, 0x29c($s6)
/* 2DFE0 8002D3E0 0C00B18E */  jal        write_map_index_matrix
/* 2DFE4 8002D3E4 02A02021 */   addu      $a0, $s5, $zero
/* 2DFE8 8002D3E8 2604150C */  addiu      $a0, $s0, 0x150c
/* 2DFEC 8002D3EC 3C05800F */  lui        $a1, %hi(MinimapSec_ehud)
/* 2DFF0 8002D3F0 0C014516 */  jal        load_minimapDat
/* 2DFF4 8002D3F4 24A5E034 */   addiu     $a1, $a1, %lo(MinimapSec_ehud)
/* 2DFF8 8002D3F8 24090001 */  addiu      $t1, $zero, 1
/* 2DFFC 8002D3FC AFA90090 */  sw         $t1, 0x90($sp)
.L8002D400:
/* 2E000 8002D400 2402FFFF */  addiu      $v0, $zero, -1
/* 2E004 8002D404 12420017 */  beq        $s2, $v0, .L8002D464
/* 2E008 8002D408 24110001 */   addiu     $s1, $zero, 1
/* 2E00C 8002D40C 1640007C */  bnez       $s2, .L8002D600
/* 2E010 8002D410 00000000 */   nop
/* 2E014 8002D414 24140011 */  addiu      $s4, $zero, 0x11
/* 2E018 8002D418 3C01800E */  lui        $at, %hi(D_800DA9CC)
/* 2E01C 8002D41C C434A9CC */  lwc1       $f20, %lo(D_800DA9CC)($at)
/* 2E020 8002D420 0800B57F */  j          .L8002D5FC
/* 2E024 8002D424 24130001 */   addiu     $s3, $zero, 1
/* 2E028 8002D428 3C02800F */  lui        $v0, %hi(D_800EB2C4)
/* 2E02C 8002D42C 2455B2C4 */  addiu      $s5, $v0, %lo(D_800EB2C4)
/* 2E030 8002D430 3C03800E */  lui        $v1, %hi(BGM_track)
/* 2E034 8002D434 2402061B */  addiu      $v0, $zero, 0x61b
/* 2E038 8002D438 16E00003 */  bnez       $s7, .L8002D448
/* 2E03C 8002D43C A46278C2 */   sh        $v0, %lo(BGM_track)($v1)
/* 2E040 8002D440 0C00B18E */  jal        write_map_index_matrix
/* 2E044 8002D444 02A02021 */   addu      $a0, $s5, $zero
.L8002D448:
/* 2E048 8002D448 2402FFFF */  addiu      $v0, $zero, -1
/* 2E04C 8002D44C 12420005 */  beq        $s2, $v0, .L8002D464
/* 2E050 8002D450 24110001 */   addiu     $s1, $zero, 1
/* 2E054 8002D454 52400005 */  beql       $s2, $zero, .L8002D46C
/* 2E058 8002D458 2414000D */   addiu     $s4, $zero, 0xd
/* 2E05C 8002D45C 0800B580 */  j          .L8002D600
/* 2E060 8002D460 00000000 */   nop
.L8002D464:
/* 2E064 8002D464 0800B580 */  j          .L8002D600
/* 2E068 8002D468 00008821 */   addu      $s1, $zero, $zero
.L8002D46C:
/* 2E06C 8002D46C 3C01800E */  lui        $at, %hi(D_800DA9D0)
/* 2E070 8002D470 C436A9D0 */  lwc1       $f22, %lo(D_800DA9D0)($at)
/* 2E074 8002D474 3C01800E */  lui        $at, %hi(D_800DA9D4)
/* 2E078 8002D478 C434A9D4 */  lwc1       $f20, %lo(D_800DA9D4)($at)
/* 2E07C 8002D47C 0800B580 */  j          .L8002D600
/* 2E080 8002D480 24130005 */   addiu     $s3, $zero, 5
/* 2E084 8002D484 3C02800F */  lui        $v0, %hi(D_800EB480)
/* 2E088 8002D488 16E00074 */  bnez       $s7, .L8002D65C
/* 2E08C 8002D48C 2455B480 */   addiu     $s5, $v0, %lo(D_800EB480)
/* 2E090 8002D490 0C00B18E */  jal        write_map_index_matrix
/* 2E094 8002D494 02A02021 */   addu      $a0, $s5, $zero
/* 2E098 8002D498 3C04800E */  lui        $a0, %hi(MinimapStruct)
/* 2E09C 8002D49C 24847DB4 */  addiu      $a0, $a0, %lo(MinimapStruct)
/* 2E0A0 8002D4A0 3C05800F */  lui        $a1, %hi(D_800EDF0C)
/* 2E0A4 8002D4A4 0C014516 */  jal        load_minimapDat
/* 2E0A8 8002D4A8 24A5DF0C */   addiu     $a1, $a1, %lo(D_800EDF0C)
/* 2E0AC 8002D4AC 240A0001 */  addiu      $t2, $zero, 1
/* 2E0B0 8002D4B0 0800B580 */  j          .L8002D600
/* 2E0B4 8002D4B4 AFAA0090 */   sw        $t2, 0x90($sp)
/* 2E0B8 8002D4B8 96C20294 */  lhu        $v0, 0x294($s6)
/* 2E0BC 8002D4BC 30420002 */  andi       $v0, $v0, 2
/* 2E0C0 8002D4C0 10400003 */  beqz       $v0, .L8002D4D0
/* 2E0C4 8002D4C4 3C03800E */   lui       $v1, %hi(BGM_track)
/* 2E0C8 8002D4C8 0800B535 */  j          .L8002D4D4
/* 2E0CC 8002D4CC 240205D5 */   addiu     $v0, $zero, 0x5d5
.L8002D4D0:
/* 2E0D0 8002D4D0 240205D7 */  addiu      $v0, $zero, 0x5d7
.L8002D4D4:
/* 2E0D4 8002D4D4 A46278C2 */  sh         $v0, %lo(BGM_track)($v1)
/* 2E0D8 8002D4D8 3C02800F */  lui        $v0, %hi(D_800EB4E0)
/* 2E0DC 8002D4DC 2455B4E0 */  addiu      $s5, $v0, %lo(D_800EB4E0)
.L8002D4E0:
/* 2E0E0 8002D4E0 16E0005E */  bnez       $s7, .L8002D65C
/* 2E0E4 8002D4E4 00000000 */   nop
/* 2E0E8 8002D4E8 0C00B18E */  jal        write_map_index_matrix
/* 2E0EC 8002D4EC 02A02021 */   addu      $a0, $s5, $zero
/* 2E0F0 8002D4F0 0800B580 */  j          .L8002D600
/* 2E0F4 8002D4F4 00000000 */   nop
/* 2E0F8 8002D4F8 3C02800F */  lui        $v0, %hi(D_800EB534)
/* 2E0FC 8002D4FC 2455B534 */  addiu      $s5, $v0, %lo(D_800EB534)
/* 2E100 8002D500 16E00031 */  bnez       $s7, .L8002D5C8
/* 2E104 8002D504 0040F021 */   addu      $fp, $v0, $zero
/* 2E108 8002D508 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2E10C 8002D50C 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2E110 8002D510 10600012 */  beqz       $v1, .L8002D55C
/* 2E114 8002D514 24050005 */   addiu     $a1, $zero, 5
/* 2E118 8002D518 3C11800E */  lui        $s1, %hi(gGlobals)
/* 2E11C 8002D51C 263168A8 */  addiu      $s1, $s1, %lo(gGlobals)
/* 2E120 8002D520 02202021 */  addu       $a0, $s1, $zero
/* 2E124 8002D524 3C02800E */  lui        $v0, %hi(battle_bgm_exp)
/* 2E128 8002D528 2447A7E0 */  addiu      $a3, $v0, %lo(battle_bgm_exp)
/* 2E12C 8002D52C 88EB0000 */  lwl        $t3, ($a3)
/* 2E130 8002D530 98EB0003 */  lwr        $t3, 3($a3)
/* 2E134 8002D534 88E30004 */  lwl        $v1, 4($a3)
/* 2E138 8002D538 98E30007 */  lwr        $v1, 7($a3)
/* 2E13C 8002D53C 84E60008 */  lh         $a2, 8($a3)
/* 2E140 8002D540 ABAB0010 */  swl        $t3, 0x10($sp)
/* 2E144 8002D544 BBAB0013 */  swr        $t3, 0x13($sp)
/* 2E148 8002D548 ABA30014 */  swl        $v1, 0x14($sp)
/* 2E14C 8002D54C BBA30017 */  swr        $v1, 0x17($sp)
/* 2E150 8002D550 A7A60018 */  sh         $a2, 0x18($sp)
/* 2E154 8002D554 0800B566 */  j          .L8002D598
/* 2E158 8002D558 27B00010 */   addiu     $s0, $sp, 0x10
.L8002D55C:
/* 2E15C 8002D55C 3C11800E */  lui        $s1, %hi(gGlobals)
/* 2E160 8002D560 263168A8 */  addiu      $s1, $s1, %lo(gGlobals)
/* 2E164 8002D564 02202021 */  addu       $a0, $s1, $zero
/* 2E168 8002D568 24050004 */  addiu      $a1, $zero, 4
/* 2E16C 8002D56C 3C02800E */  lui        $v0, %hi(battle_bgm_no_exp)
/* 2E170 8002D570 27B00010 */  addiu      $s0, $sp, 0x10
/* 2E174 8002D574 244BA7EC */  addiu      $t3, $v0, %lo(battle_bgm_no_exp)
/* 2E178 8002D578 89680000 */  lwl        $t0, ($t3)
/* 2E17C 8002D57C 99680003 */  lwr        $t0, 3($t3)
/* 2E180 8002D580 89690004 */  lwl        $t1, 4($t3)
/* 2E184 8002D584 99690007 */  lwr        $t1, 7($t3)
/* 2E188 8002D588 ABA80010 */  swl        $t0, 0x10($sp)
/* 2E18C 8002D58C BBA80013 */  swr        $t0, 0x13($sp)
/* 2E190 8002D590 ABA90014 */  swl        $t1, 0x14($sp)
/* 2E194 8002D594 BBA90017 */  swr        $t1, 0x17($sp)
.L8002D598:
/* 2E198 8002D598 0C027338 */  jal        rand_0_to_B
/* 2E19C 8002D59C 00000000 */   nop
/* 2E1A0 8002D5A0 00021040 */  sll        $v0, $v0, 1
/* 2E1A4 8002D5A4 02028021 */  addu       $s0, $s0, $v0
/* 2E1A8 8002D5A8 96020000 */  lhu        $v0, ($s0)
/* 2E1AC 8002D5AC A622101A */  sh         $v0, 0x101a($s1)
/* 2E1B0 8002D5B0 3C01800E */  lui        $at, %hi(D_800DA9D8)
/* 2E1B4 8002D5B4 C420A9D8 */  lwc1       $f0, %lo(D_800DA9D8)($at)
/* 2E1B8 8002D5B8 27C4B534 */  addiu      $a0, $fp, -0x4acc
/* 2E1BC 8002D5BC E6C002A0 */  swc1       $f0, 0x2a0($s6)
/* 2E1C0 8002D5C0 0C00B18E */  jal        write_map_index_matrix
/* 2E1C4 8002D5C4 E6C0029C */   swc1      $f0, 0x29c($s6)
.L8002D5C8:
/* 2E1C8 8002D5C8 2402FFFF */  addiu      $v0, $zero, -1
/* 2E1CC 8002D5CC 1242000C */  beq        $s2, $v0, .L8002D600
/* 2E1D0 8002D5D0 24110001 */   addiu     $s1, $zero, 1
/* 2E1D4 8002D5D4 27C2B534 */  addiu      $v0, $fp, -0x4acc
/* 2E1D8 8002D5D8 00121840 */  sll        $v1, $s2, 1
/* 2E1DC 8002D5DC 00721821 */  addu       $v1, $v1, $s2
/* 2E1E0 8002D5E0 00031880 */  sll        $v1, $v1, 2
/* 2E1E4 8002D5E4 00622021 */  addu       $a0, $v1, $v0
/* 2E1E8 8002D5E8 00431021 */  addu       $v0, $v0, $v1
/* 2E1EC 8002D5EC 94940000 */  lhu        $s4, ($a0)
/* 2E1F0 8002D5F0 3C01800E */  lui        $at, %hi(D_800DA9DC)
/* 2E1F4 8002D5F4 C434A9DC */  lwc1       $f20, %lo(D_800DA9DC)($at)
/* 2E1F8 8002D5F8 94530002 */  lhu        $s3, 2($v0)
.L8002D5FC:
/* 2E1FC 8002D5FC 4600A586 */  mov.s      $f22, $f20
.L8002D600:
/* 2E200 8002D600 16E00016 */  bnez       $s7, .L8002D65C
/* 2E204 8002D604 00000000 */   nop
/* 2E208 8002D608 12200006 */  beqz       $s1, .L8002D624
/* 2E20C 8002D60C 8FA20090 */   lw        $v0, 0x90($sp)
/* 2E210 8002D610 A6D40292 */  sh         $s4, 0x292($s6)
/* 2E214 8002D614 A6D30294 */  sh         $s3, 0x294($s6)
/* 2E218 8002D618 E6D602A4 */  swc1       $f22, 0x2a4($s6)
/* 2E21C 8002D61C E6D402A8 */  swc1       $f20, 0x2a8($s6)
/* 2E220 8002D620 8FA20090 */  lw         $v0, 0x90($sp)
.L8002D624:
/* 2E224 8002D624 54400009 */  bnel       $v0, $zero, .L8002D64C
/* 2E228 8002D628 96C20292 */   lhu       $v0, 0x292($s6)
/* 2E22C 8002D62C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2E230 8002D630 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 2E234 8002D634 8C43150C */  lw         $v1, 0x150c($v0)
/* 2E238 8002D638 50600004 */  beql       $v1, $zero, .L8002D64C
/* 2E23C 8002D63C 96C20292 */   lhu       $v0, 0x292($s6)
/* 2E240 8002D640 0C0145FC */  jal        minimap_struct_free
/* 2E244 8002D644 2444150C */   addiu     $a0, $v0, 0x150c
/* 2E248 8002D648 96C20292 */  lhu        $v0, 0x292($s6)
.L8002D64C:
/* 2E24C 8002D64C 96C30294 */  lhu        $v1, 0x294($s6)
/* 2E250 8002D650 A6C20296 */  sh         $v0, 0x296($s6)
/* 2E254 8002D654 0800B5B5 */  j          .L8002D6D4
/* 2E258 8002D658 A6C30298 */   sh        $v1, 0x298($s6)
.L8002D65C:
/* 2E25C 8002D65C 16200003 */  bnez       $s1, .L8002D66C
/* 2E260 8002D660 00002821 */   addu      $a1, $zero, $zero
/* 2E264 8002D664 96D40292 */  lhu        $s4, 0x292($s6)
/* 2E268 8002D668 96D30294 */  lhu        $s3, 0x294($s6)
.L8002D66C:
/* 2E26C 8002D66C 8EA20000 */  lw         $v0, ($s5)
/* 2E270 8002D670 94430000 */  lhu        $v1, ($v0)
/* 2E274 8002D674 10600013 */  beqz       $v1, .L8002D6C4
/* 2E278 8002D678 3C04800E */   lui       $a0, 0x800e
/* 2E27C 8002D67C 00A01021 */  addu       $v0, $a1, $zero
.L8002D680:
/* 2E280 8002D680 00021880 */  sll        $v1, $v0, 2
/* 2E284 8002D684 00751821 */  addu       $v1, $v1, $s5
/* 2E288 8002D688 8C640000 */  lw         $a0, ($v1)
/* 2E28C 8002D68C 24420001 */  addiu      $v0, $v0, 1
/* 2E290 8002D690 94830000 */  lhu        $v1, ($a0)
/* 2E294 8002D694 14740004 */  bne        $v1, $s4, .L8002D6A8
/* 2E298 8002D698 3045FFFF */   andi      $a1, $v0, 0xffff
/* 2E29C 8002D69C 94820002 */  lhu        $v0, 2($a0)
/* 2E2A0 8002D6A0 5053000D */  beql       $v0, $s3, .L8002D6D8
/* 2E2A4 8002D6A4 94820008 */   lhu       $v0, 8($a0)
.L8002D6A8:
/* 2E2A8 8002D6A8 00051080 */  sll        $v0, $a1, 2
/* 2E2AC 8002D6AC 00551021 */  addu       $v0, $v0, $s5
/* 2E2B0 8002D6B0 8C430000 */  lw         $v1, ($v0)
/* 2E2B4 8002D6B4 94640000 */  lhu        $a0, ($v1)
/* 2E2B8 8002D6B8 1480FFF1 */  bnez       $a0, .L8002D680
/* 2E2BC 8002D6BC 00A01021 */   addu      $v0, $a1, $zero
/* 2E2C0 8002D6C0 3C04800E */  lui        $a0, %hi(D_800DA704)
.L8002D6C4:
/* 2E2C4 8002D6C4 2484A704 */  addiu      $a0, $a0, %lo(D_800DA704)
/* 2E2C8 8002D6C8 3C05800E */  lui        $a1, %hi(D_800DA7F4)
/* 2E2CC 8002D6CC 0C025F2D */  jal        manualCrash
/* 2E2D0 8002D6D0 24A5A7F4 */   addiu     $a1, $a1, %lo(D_800DA7F4)
.L8002D6D4:
/* 2E2D4 8002D6D4 00001021 */  addu       $v0, $zero, $zero
.L8002D6D8:
/* 2E2D8 8002D6D8 8FBF00BC */  lw         $ra, 0xbc($sp)
/* 2E2DC 8002D6DC 8FBE00B8 */  lw         $fp, 0xb8($sp)
/* 2E2E0 8002D6E0 8FB700B4 */  lw         $s7, 0xb4($sp)
/* 2E2E4 8002D6E4 8FB600B0 */  lw         $s6, 0xb0($sp)
/* 2E2E8 8002D6E8 8FB500AC */  lw         $s5, 0xac($sp)
/* 2E2EC 8002D6EC 8FB400A8 */  lw         $s4, 0xa8($sp)
/* 2E2F0 8002D6F0 8FB300A4 */  lw         $s3, 0xa4($sp)
/* 2E2F4 8002D6F4 8FB200A0 */  lw         $s2, 0xa0($sp)
/* 2E2F8 8002D6F8 8FB1009C */  lw         $s1, 0x9c($sp)
/* 2E2FC 8002D6FC 8FB00098 */  lw         $s0, 0x98($sp)
/* 2E300 8002D700 D7B600C8 */  ldc1       $f22, 0xc8($sp)
/* 2E304 8002D704 D7B400C0 */  ldc1       $f20, 0xc0($sp)
/* 2E308 8002D708 03E00008 */  jr         $ra
/* 2E30C 8002D70C 27BD00D0 */   addiu     $sp, $sp, 0xd0
