.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_combatflag_42
/* 285E0 800279E0 3C02800F */  lui        $v0, %hi(combat_flag_42)
/* 285E4 800279E4 03E00008 */  jr         $ra
/* 285E8 800279E8 AC449B8C */   sw        $a0, %lo(combat_flag_42)($v0)

glabel some_death_func_A
/* 285EC 800279EC 10800003 */  beqz       $a0, .L800279FC
/* 285F0 800279F0 24020009 */   addiu     $v0, $zero, 9
/* 285F4 800279F4 A4820014 */  sh         $v0, 0x14($a0)
/* 285F8 800279F8 A4820018 */  sh         $v0, 0x18($a0)
.L800279FC:
/* 285FC 800279FC 03E00008 */  jr         $ra
/* 28600 80027A00 00000000 */   nop

glabel gamecombat_actor_func
/* 28604 80027A04 27BDFDE0 */  addiu      $sp, $sp, -0x220
/* 28608 80027A08 AFB00210 */  sw         $s0, 0x210($sp)
/* 2860C 80027A0C 00808021 */  addu       $s0, $a0, $zero
/* 28610 80027A10 30A2FFFF */  andi       $v0, $a1, 0xffff
/* 28614 80027A14 AFB10214 */  sw         $s1, 0x214($sp)
/* 28618 80027A18 30D1FFFF */  andi       $s1, $a2, 0xffff
/* 2861C 80027A1C 10400018 */  beqz       $v0, .L80027A80
/* 28620 80027A20 AFBF0218 */   sw        $ra, 0x218($sp)
/* 28624 80027A24 00002821 */  addu       $a1, $zero, $zero
/* 28628 80027A28 0C024E3A */  jal        combatstatindicator_func
/* 2862C 80027A2C 00403021 */   addu      $a2, $v0, $zero
/* 28630 80027A30 8E020004 */  lw         $v0, 4($s0)
/* 28634 80027A34 10400012 */  beqz       $v0, .L80027A80
/* 28638 80027A38 00000000 */   nop
/* 2863C 80027A3C 8C440008 */  lw         $a0, 8($v0)
/* 28640 80027A40 0C02A1A9 */  jal        HasLocator
/* 28644 80027A44 24050003 */   addiu     $a1, $zero, 3
/* 28648 80027A48 1440000D */  bnez       $v0, .L80027A80
/* 2864C 80027A4C 27A40010 */   addiu     $a0, $sp, 0x10
/* 28650 80027A50 3C05800E */  lui        $a1, %hi(D_800DA230)
/* 28654 80027A54 24A5A230 */  addiu      $a1, $a1, %lo(D_800DA230)
/* 28658 80027A58 8E030004 */  lw         $v1, 4($s0)
/* 2865C 80027A5C 8FA20230 */  lw         $v0, 0x230($sp)
/* 28660 80027A60 8C660008 */  lw         $a2, 8($v1)
/* 28664 80027A64 8C470004 */  lw         $a3, 4($v0)
/* 28668 80027A68 0C0333AC */  jal        sprintf
/* 2866C 80027A6C 24C602AD */   addiu     $a2, $a2, 0x2ad
/* 28670 80027A70 27A40010 */  addiu      $a0, $sp, 0x10
/* 28674 80027A74 3C05800E */  lui        $a1, %hi(D_800DA280)
/* 28678 80027A78 0C025F2D */  jal        manualCrash
/* 2867C 80027A7C 24A5A280 */   addiu     $a1, $a1, %lo(D_800DA280)
.L80027A80:
/* 28680 80027A80 12200004 */  beqz       $s1, .L80027A94
/* 28684 80027A84 02002021 */   addu      $a0, $s0, $zero
/* 28688 80027A88 24050001 */  addiu      $a1, $zero, 1
/* 2868C 80027A8C 0C024E3A */  jal        combatstatindicator_func
/* 28690 80027A90 02203021 */   addu      $a2, $s1, $zero
.L80027A94:
/* 28694 80027A94 8FBF0218 */  lw         $ra, 0x218($sp)
/* 28698 80027A98 8FB10214 */  lw         $s1, 0x214($sp)
/* 2869C 80027A9C 8FB00210 */  lw         $s0, 0x210($sp)
/* 286A0 80027AA0 03E00008 */  jr         $ra
/* 286A4 80027AA4 27BD0220 */   addiu     $sp, $sp, 0x220

glabel func_80027AA8
/* 286A8 80027AA8 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 286AC 80027AAC AFB00058 */  sw         $s0, 0x58($sp)
/* 286B0 80027AB0 3C10800F */  lui        $s0, %hi(AnimationDataPointer)
/* 286B4 80027AB4 8E039B88 */  lw         $v1, %lo(AnimationDataPointer)($s0)
/* 286B8 80027AB8 AFB1005C */  sw         $s1, 0x5c($sp)
/* 286BC 80027ABC AFBF0060 */  sw         $ra, 0x60($sp)
/* 286C0 80027AC0 F7B40068 */  sdc1       $f20, 0x68($sp)
/* 286C4 80027AC4 10600043 */  beqz       $v1, .L80027BD4
/* 286C8 80027AC8 00808821 */   addu      $s1, $a0, $zero
/* 286CC 80027ACC 3C02800F */  lui        $v0, %hi(D_800E9B84)
/* 286D0 80027AD0 4480A000 */  mtc1       $zero, $f20
/* 286D4 80027AD4 8C469B84 */  lw         $a2, %lo(D_800E9B84)($v0)
/* 286D8 80027AD8 4405A000 */  mfc1       $a1, $f20
/* 286DC 80027ADC 4407A000 */  mfc1       $a3, $f20
/* 286E0 80027AE0 0C029D7E */  jal        AniDat_rotate_MatrixA
/* 286E4 80027AE4 00602021 */   addu      $a0, $v1, $zero
/* 286E8 80027AE8 3C02800F */  lui        $v0, %hi(D_800F53F0)
/* 286EC 80027AEC 8C4653F0 */  lw         $a2, %lo(D_800F53F0)($v0)
/* 286F0 80027AF0 244253F0 */  addiu      $v0, $v0, 0x53f0
/* 286F4 80027AF4 4405A000 */  mfc1       $a1, $f20
/* 286F8 80027AF8 8C470004 */  lw         $a3, 4($v0)
/* 286FC 80027AFC C4400008 */  lwc1       $f0, 8($v0)
/* 28700 80027B00 27A40018 */  addiu      $a0, $sp, 0x18
/* 28704 80027B04 0C02F8C4 */  jal        guAlignF
/* 28708 80027B08 E7A00010 */   swc1      $f0, 0x10($sp)
/* 2870C 80027B0C 8E049B88 */  lw         $a0, -0x6478($s0)
/* 28710 80027B10 27A50018 */  addiu      $a1, $sp, 0x18
/* 28714 80027B14 24840088 */  addiu      $a0, $a0, 0x88
/* 28718 80027B18 0C031128 */  jal        guMtxCatF
/* 2871C 80027B1C 00803021 */   addu      $a2, $a0, $zero
/* 28720 80027B20 3C02800F */  lui        $v0, %hi(D_800E9B80)
/* 28724 80027B24 3C03800F */  lui        $v1, %hi(D_800E9B70)
/* 28728 80027B28 C44C9B80 */  lwc1       $f12, %lo(D_800E9B80)($v0)
/* 2872C 80027B2C C4609B70 */  lwc1       $f0, %lo(D_800E9B70)($v1)
/* 28730 80027B30 3C01800E */  lui        $at, %hi(D_800DA298)
/* 28734 80027B34 C422A298 */  lwc1       $f2, %lo(D_800DA298)($at)
/* 28738 80027B38 46006303 */  div.s      $f12, $f12, $f0
/* 2873C 80027B3C 46026302 */  mul.s      $f12, $f12, $f2
/* 28740 80027B40 0C03328C */  jal        __sinf
/* 28744 80027B44 00000000 */   nop
/* 28748 80027B48 3C02800F */  lui        $v0, %hi(D_800E9B78)
/* 2874C 80027B4C C4429B78 */  lwc1       $f2, %lo(D_800E9B78)($v0)
/* 28750 80027B50 46001082 */  mul.s      $f2, $f2, $f0
/* 28754 80027B54 3C02800F */  lui        $v0, %hi(D_800F5400)
/* 28758 80027B58 24435400 */  addiu      $v1, $v0, %lo(D_800F5400)
/* 2875C 80027B5C C4600004 */  lwc1       $f0, 4($v1)
/* 28760 80027B60 8E049B88 */  lw         $a0, -0x6478($s0)
/* 28764 80027B64 46020000 */  add.s      $f0, $f0, $f2
/* 28768 80027B68 8C455400 */  lw         $a1, 0x5400($v0)
/* 2876C 80027B6C 44060000 */  mfc1       $a2, $f0
/* 28770 80027B70 0C029D44 */  jal        anidat_setMaxtrixA_3
/* 28774 80027B74 8C670008 */   lw        $a3, 8($v1)
/* 28778 80027B78 240500FF */  addiu      $a1, $zero, 0xff
/* 2877C 80027B7C 24060001 */  addiu      $a2, $zero, 1
/* 28780 80027B80 8E049B88 */  lw         $a0, -0x6478($s0)
/* 28784 80027B84 0C003D48 */  jal        set_anidat_colors
/* 28788 80027B88 00003821 */   addu      $a3, $zero, $zero
/* 2878C 80027B8C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 28790 80027B90 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 28794 80027B94 8C64002C */  lw         $a0, 0x2c($v1)
/* 28798 80027B98 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 2879C 80027B9C 8C830040 */  lw         $v1, 0x40($a0)
/* 287A0 80027BA0 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 287A4 80027BA4 0C01D6EA */  jal        get_entity_scale
/* 287A8 80027BA8 94650000 */   lhu       $a1, ($v1)
/* 287AC 80027BAC 44050000 */  mfc1       $a1, $f0
/* 287B0 80027BB0 8E049B88 */  lw         $a0, -0x6478($s0)
/* 287B4 80027BB4 00A03021 */  addu       $a2, $a1, $zero
/* 287B8 80027BB8 0C029DDF */  jal        matrix_normalize_scale
/* 287BC 80027BBC 00A03821 */   addu      $a3, $a1, $zero
/* 287C0 80027BC0 8E059B88 */  lw         $a1, -0x6478($s0)
/* 287C4 80027BC4 0C028369 */  jal        func_800A0DA4
/* 287C8 80027BC8 02202021 */   addu      $a0, $s1, $zero
/* 287CC 80027BCC 08009EF7 */  j          .L80027BDC
/* 287D0 80027BD0 8FBF0060 */   lw        $ra, 0x60($sp)
.L80027BD4:
/* 287D4 80027BD4 02201021 */  addu       $v0, $s1, $zero
/* 287D8 80027BD8 8FBF0060 */  lw         $ra, 0x60($sp)
.L80027BDC:
/* 287DC 80027BDC 8FB1005C */  lw         $s1, 0x5c($sp)
/* 287E0 80027BE0 8FB00058 */  lw         $s0, 0x58($sp)
/* 287E4 80027BE4 D7B40068 */  ldc1       $f20, 0x68($sp)
/* 287E8 80027BE8 03E00008 */  jr         $ra
/* 287EC 80027BEC 27BD0070 */   addiu     $sp, $sp, 0x70

glabel func_80027BF0
/* 287F0 80027BF0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 287F4 80027BF4 AFB10014 */  sw         $s1, 0x14($sp)
/* 287F8 80027BF8 00808821 */  addu       $s1, $a0, $zero
/* 287FC 80027BFC AFB20018 */  sw         $s2, 0x18($sp)
/* 28800 80027C00 00C09021 */  addu       $s2, $a2, $zero
/* 28804 80027C04 02402021 */  addu       $a0, $s2, $zero
/* 28808 80027C08 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2880C 80027C0C 30B3FFFF */  andi       $s3, $a1, 0xffff
/* 28810 80027C10 AFBF0020 */  sw         $ra, 0x20($sp)
/* 28814 80027C14 0C01E7B5 */  jal        getSpell
/* 28818 80027C18 AFB00010 */   sw        $s0, 0x10($sp)
/* 2881C 80027C1C 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 28820 80027C20 00408021 */  addu       $s0, $v0, $zero
/* 28824 80027C24 90637C70 */  lbu        $v1, %lo(combat_bytes)($v1)
/* 28828 80027C28 2402000B */  addiu      $v0, $zero, 0xb
/* 2882C 80027C2C 14620015 */  bne        $v1, $v0, .L80027C84
/* 28830 80027C30 2402000A */   addiu     $v0, $zero, 0xa
/* 28834 80027C34 1200002D */  beqz       $s0, .L80027CEC
/* 28838 80027C38 02402021 */   addu      $a0, $s2, $zero
/* 2883C 80027C3C 0C01E89F */  jal        check_spell_wizard
/* 28840 80027C40 02002821 */   addu      $a1, $s0, $zero
/* 28844 80027C44 00409021 */  addu       $s2, $v0, $zero
/* 28848 80027C48 96040000 */  lhu        $a0, ($s0)
/* 2884C 80027C4C 00002821 */  addu       $a1, $zero, $zero
/* 28850 80027C50 0C01D77A */  jal        GetIDIndex
/* 28854 80027C54 00003021 */   addu      $a2, $zero, $zero
/* 28858 80027C58 2403000C */  addiu      $v1, $zero, 0xc
/* 2885C 80027C5C 50430001 */  beql       $v0, $v1, .L80027C64
/* 28860 80027C60 24120001 */   addiu     $s2, $zero, 1
.L80027C64:
/* 28864 80027C64 02202021 */  addu       $a0, $s1, $zero
/* 28868 80027C68 326500FF */  andi       $a1, $s3, 0xff
/* 2886C 80027C6C 02403021 */  addu       $a2, $s2, $zero
/* 28870 80027C70 3C07FF00 */  lui        $a3, 0xff00
/* 28874 80027C74 0C0250E6 */  jal        func_with_spell_range
/* 28878 80027C78 34E700FF */   ori       $a3, $a3, 0xff
/* 2887C 80027C7C 08009F3D */  j          .L80027CF4
/* 28880 80027C80 8FBF0020 */   lw        $ra, 0x20($sp)
.L80027C84:
/* 28884 80027C84 14620010 */  bne        $v1, $v0, .L80027CC8
/* 28888 80027C88 24020012 */   addiu     $v0, $zero, 0x12
/* 2888C 80027C8C 12000017 */  beqz       $s0, .L80027CEC
/* 28890 80027C90 02402021 */   addu      $a0, $s2, $zero
/* 28894 80027C94 0C01E89F */  jal        check_spell_wizard
/* 28898 80027C98 02002821 */   addu      $a1, $s0, $zero
/* 2889C 80027C9C 9206001C */  lbu        $a2, 0x1c($s0)
/* 288A0 80027CA0 00C20018 */  mult       $a2, $v0
/* 288A4 80027CA4 02202021 */  addu       $a0, $s1, $zero
/* 288A8 80027CA8 326500FF */  andi       $a1, $s3, 0xff
/* 288AC 80027CAC 3C07FF00 */  lui        $a3, 0xff00
/* 288B0 80027CB0 34E700FF */  ori        $a3, $a3, 0xff
/* 288B4 80027CB4 00003012 */  mflo       $a2
/* 288B8 80027CB8 0C0250E6 */  jal        func_with_spell_range
/* 288BC 80027CBC 30C600FF */   andi      $a2, $a2, 0xff
/* 288C0 80027CC0 08009F3D */  j          .L80027CF4
/* 288C4 80027CC4 8FBF0020 */   lw        $ra, 0x20($sp)
.L80027CC8:
/* 288C8 80027CC8 14620009 */  bne        $v1, $v0, .L80027CF0
/* 288CC 80027CCC 02201021 */   addu      $v0, $s1, $zero
/* 288D0 80027CD0 02202021 */  addu       $a0, $s1, $zero
/* 288D4 80027CD4 326500FF */  andi       $a1, $s3, 0xff
/* 288D8 80027CD8 24060001 */  addiu      $a2, $zero, 1
/* 288DC 80027CDC 3C0700FF */  lui        $a3, 0xff
/* 288E0 80027CE0 0C0250E6 */  jal        func_with_spell_range
/* 288E4 80027CE4 34E700FF */   ori       $a3, $a3, 0xff
/* 288E8 80027CE8 00408821 */  addu       $s1, $v0, $zero
.L80027CEC:
/* 288EC 80027CEC 02201021 */  addu       $v0, $s1, $zero
.L80027CF0:
/* 288F0 80027CF0 8FBF0020 */  lw         $ra, 0x20($sp)
.L80027CF4:
/* 288F4 80027CF4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 288F8 80027CF8 8FB20018 */  lw         $s2, 0x18($sp)
/* 288FC 80027CFC 8FB10014 */  lw         $s1, 0x14($sp)
/* 28900 80027D00 8FB00010 */  lw         $s0, 0x10($sp)
/* 28904 80027D04 03E00008 */  jr         $ra
/* 28908 80027D08 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80027D0C
/* 2890C 80027D0C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 28910 80027D10 00054400 */  sll        $t0, $a1, 0x10
/* 28914 80027D14 AFB1001C */  sw         $s1, 0x1c($sp)
/* 28918 80027D18 3C11800F */  lui        $s1, %hi(combatPointer)
/* 2891C 80027D1C 00002821 */  addu       $a1, $zero, $zero
/* 28920 80027D20 8E22F760 */  lw         $v0, %lo(combatPointer)($s1)
/* 28924 80027D24 00003021 */  addu       $a2, $zero, $zero
/* 28928 80027D28 AFB20020 */  sw         $s2, 0x20($sp)
/* 2892C 80027D2C 00089403 */  sra        $s2, $t0, 0x10
/* 28930 80027D30 AFBF002C */  sw         $ra, 0x2c($sp)
/* 28934 80027D34 AFB40028 */  sw         $s4, 0x28($sp)
/* 28938 80027D38 AFB30024 */  sw         $s3, 0x24($sp)
/* 2893C 80027D3C AFB00018 */  sw         $s0, 0x18($sp)
/* 28940 80027D40 8C47002C */  lw         $a3, 0x2c($v0)
/* 28944 80027D44 3C10800E */  lui        $s0, 0x800e
/* 28948 80027D48 AFA40030 */  sw         $a0, 0x30($sp)
/* 2894C 80027D4C 90E30020 */  lbu        $v1, 0x20($a3)
/* 28950 80027D50 8CF40040 */  lw         $s4, 0x40($a3)
/* 28954 80027D54 240200F0 */  addiu      $v0, $zero, 0xf0
/* 28958 80027D58 AFA20010 */  sw         $v0, 0x10($sp)
/* 2895C 80027D5C 26027C70 */  addiu      $v0, $s0, 0x7c70
/* 28960 80027D60 24070140 */  addiu      $a3, $zero, 0x140
/* 28964 80027D64 00031880 */  sll        $v1, $v1, 2
/* 28968 80027D68 00431021 */  addu       $v0, $v0, $v1
/* 2896C 80027D6C 0C0023E5 */  jal        some_rsp_func
/* 28970 80027D70 8C530034 */   lw        $s3, 0x34($v0)
/* 28974 80027D74 92037C70 */  lbu        $v1, 0x7c70($s0)
/* 28978 80027D78 2463FFF6 */  addiu      $v1, $v1, -0xa
/* 2897C 80027D7C 2C630002 */  sltiu      $v1, $v1, 2
/* 28980 80027D80 10600006 */  beqz       $v1, .L80027D9C
/* 28984 80027D84 AFA20030 */   sw        $v0, 0x30($sp)
/* 28988 80027D88 24040001 */  addiu      $a0, $zero, 1
/* 2898C 80027D8C 0C024BEC */  jal        combattargetvisuals_func
/* 28990 80027D90 02402821 */   addu      $a1, $s2, $zero
/* 28994 80027D94 08009F6A */  j          .L80027DA8
/* 28998 80027D98 00000000 */   nop
.L80027D9C:
/* 2899C 80027D9C 00002021 */  addu       $a0, $zero, $zero
/* 289A0 80027DA0 0C024BEC */  jal        combattargetvisuals_func
/* 289A4 80027DA4 02402821 */   addu      $a1, $s2, $zero
.L80027DA8:
/* 289A8 80027DA8 0C00B7E9 */  jal        func_8002DFA4
/* 289AC 80027DAC 8FA40030 */   lw        $a0, 0x30($sp)
/* 289B0 80027DB0 27A40030 */  addiu      $a0, $sp, 0x30
/* 289B4 80027DB4 02402821 */  addu       $a1, $s2, $zero
/* 289B8 80027DB8 02603021 */  addu       $a2, $s3, $zero
/* 289BC 80027DBC 0C004795 */  jal        handleZoneEngineFrame
/* 289C0 80027DC0 AFA20030 */   sw        $v0, 0x30($sp)
/* 289C4 80027DC4 0C009EAA */  jal        func_80027AA8
/* 289C8 80027DC8 8FA40030 */   lw        $a0, 0x30($sp)
/* 289CC 80027DCC 00402021 */  addu       $a0, $v0, $zero
/* 289D0 80027DD0 3C02800F */  lui        $v0, %hi(combat_flag_42)
/* 289D4 80027DD4 8C439B8C */  lw         $v1, %lo(combat_flag_42)($v0)
/* 289D8 80027DD8 3250FFFF */  andi       $s0, $s2, 0xffff
/* 289DC 80027DDC 14600004 */  bnez       $v1, .L80027DF0
/* 289E0 80027DE0 AFA40030 */   sw        $a0, 0x30($sp)
/* 289E4 80027DE4 0C023BF2 */  jal        func_8008EFC8
/* 289E8 80027DE8 02002821 */   addu      $a1, $s0, $zero
/* 289EC 80027DEC AFA20030 */  sw         $v0, 0x30($sp)
.L80027DF0:
/* 289F0 80027DF0 8FA40030 */  lw         $a0, 0x30($sp)
/* 289F4 80027DF4 0C0257C7 */  jal        func_80095F1C
/* 289F8 80027DF8 02402821 */   addu      $a1, $s2, $zero
/* 289FC 80027DFC 00402021 */  addu       $a0, $v0, $zero
/* 28A00 80027E00 02402821 */  addu       $a1, $s2, $zero
/* 28A04 80027E04 0C025081 */  jal        ret_a0_80094204
/* 28A08 80027E08 AFA20030 */   sw        $v0, 0x30($sp)
/* 28A0C 80027E0C 00402021 */  addu       $a0, $v0, $zero
/* 28A10 80027E10 02402821 */  addu       $a1, $s2, $zero
/* 28A14 80027E14 0C024D19 */  jal        func_80093464
/* 28A18 80027E18 AFA20030 */   sw        $v0, 0x30($sp)
/* 28A1C 80027E1C 00402021 */  addu       $a0, $v0, $zero
/* 28A20 80027E20 02402821 */  addu       $a1, $s2, $zero
/* 28A24 80027E24 0C024F7C */  jal        combatstatindicator_func_1
/* 28A28 80027E28 AFA20030 */   sw        $v0, 0x30($sp)
/* 28A2C 80027E2C 00402021 */  addu       $a0, $v0, $zero
/* 28A30 80027E30 02002821 */  addu       $a1, $s0, $zero
/* 28A34 80027E34 02803021 */  addu       $a2, $s4, $zero
/* 28A38 80027E38 0C009EFC */  jal        func_80027BF0
/* 28A3C 80027E3C AFA20030 */   sw        $v0, 0x30($sp)
/* 28A40 80027E40 00402021 */  addu       $a0, $v0, $zero
/* 28A44 80027E44 324500FF */  andi       $a1, $s2, 0xff
/* 28A48 80027E48 0C023DB9 */  jal        func_8008F6E4
/* 28A4C 80027E4C AFA20030 */   sw        $v0, 0x30($sp)
/* 28A50 80027E50 00402021 */  addu       $a0, $v0, $zero
/* 28A54 80027E54 02402821 */  addu       $a1, $s2, $zero
/* 28A58 80027E58 0C00B703 */  jal        func_with_debug_queue
/* 28A5C 80027E5C AFA20030 */   sw        $v0, 0x30($sp)
/* 28A60 80027E60 0C00A6BC */  jal        func_80029AF0
/* 28A64 80027E64 AFA20030 */   sw        $v0, 0x30($sp)
/* 28A68 80027E68 8E24F760 */  lw         $a0, -0x8a0($s1)
/* 28A6C 80027E6C 8FA20030 */  lw         $v0, 0x30($sp)
/* 28A70 80027E70 8FBF002C */  lw         $ra, 0x2c($sp)
/* 28A74 80027E74 8FB40028 */  lw         $s4, 0x28($sp)
/* 28A78 80027E78 8FB30024 */  lw         $s3, 0x24($sp)
/* 28A7C 80027E7C 8FB20020 */  lw         $s2, 0x20($sp)
/* 28A80 80027E80 8FB1001C */  lw         $s1, 0x1c($sp)
/* 28A84 80027E84 8C835448 */  lw         $v1, 0x5448($a0)
/* 28A88 80027E88 8FB00018 */  lw         $s0, 0x18($sp)
/* 28A8C 80027E8C 24630001 */  addiu      $v1, $v1, 1
/* 28A90 80027E90 AC835448 */  sw         $v1, 0x5448($a0)
/* 28A94 80027E94 03E00008 */  jr         $ra
/* 28A98 80027E98 27BD0030 */   addiu     $sp, $sp, 0x30

glabel combat_byte_func_0
/* 28A9C 80027E9C 3C03800F */  lui        $v1, %hi(clear_combatstruct_flag)
/* 28AA0 80027EA0 24020001 */  addiu      $v0, $zero, 1
/* 28AA4 80027EA4 AC629B68 */  sw         $v0, %lo(clear_combatstruct_flag)($v1)
/* 28AA8 80027EA8 03E00008 */  jr         $ra
/* 28AAC 80027EAC 00001021 */   addu      $v0, $zero, $zero

glabel func_80027EB0
/* 28AB0 80027EB0 3C02800F */  lui        $v0, %hi(combatPointer)
/* 28AB4 80027EB4 8C44F760 */  lw         $a0, %lo(combatPointer)($v0)
/* 28AB8 80027EB8 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 28ABC 80027EBC 8C8252CC */  lw         $v0, 0x52cc($a0)
/* 28AC0 80027EC0 8C86002C */  lw         $a2, 0x2c($a0)
/* 28AC4 80027EC4 00452821 */  addu       $a1, $v0, $a1
/* 28AC8 80027EC8 10C0000C */  beqz       $a2, .L80027EFC
/* 28ACC 80027ECC AC8552CC */   sw        $a1, 0x52cc($a0)
/* 28AD0 80027ED0 3C03800E */  lui        $v1, %hi(gGlobals)
/* 28AD4 80027ED4 90C20020 */  lbu        $v0, 0x20($a2)
/* 28AD8 80027ED8 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 28ADC 80027EDC 00021080 */  sll        $v0, $v0, 2
/* 28AE0 80027EE0 00621821 */  addu       $v1, $v1, $v0
/* 28AE4 80027EE4 8C6213FC */  lw         $v0, 0x13fc($v1)
/* 28AE8 80027EE8 10400004 */  beqz       $v0, .L80027EFC
/* 28AEC 80027EEC 00000000 */   nop
/* 28AF0 80027EF0 84420018 */  lh         $v0, 0x18($v0)
/* 28AF4 80027EF4 10400003 */  beqz       $v0, .L80027F04
/* 28AF8 80027EF8 2CA2001E */   sltiu     $v0, $a1, 0x1e
.L80027EFC:
/* 28AFC 80027EFC 03E00008 */  jr         $ra
/* 28B00 80027F00 00001021 */   addu      $v0, $zero, $zero
.L80027F04:
/* 28B04 80027F04 14400003 */  bnez       $v0, .L80027F14
/* 28B08 80027F08 24020001 */   addiu     $v0, $zero, 1
/* 28B0C 80027F0C 03E00008 */  jr         $ra
/* 28B10 80027F10 AC8052CC */   sw        $zero, 0x52cc($a0)
.L80027F14:
/* 28B14 80027F14 03E00008 */  jr         $ra
/* 28B18 80027F18 00001021 */   addu      $v0, $zero, $zero

glabel func_80027F1C
/* 28B1C 80027F1C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 28B20 80027F20 AFB60030 */  sw         $s6, 0x30($sp)
/* 28B24 80027F24 0080B021 */  addu       $s6, $a0, $zero
/* 28B28 80027F28 AFB40028 */  sw         $s4, 0x28($sp)
/* 28B2C 80027F2C 30B4FFFF */  andi       $s4, $a1, 0xffff
/* 28B30 80027F30 02802821 */  addu       $a1, $s4, $zero
/* 28B34 80027F34 AFB00018 */  sw         $s0, 0x18($sp)
/* 28B38 80027F38 3C10800F */  lui        $s0, %hi(combatPointer)
/* 28B3C 80027F3C 8E02F760 */  lw         $v0, %lo(combatPointer)($s0)
/* 28B40 80027F40 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 28B44 80027F44 AFB70034 */  sw         $s7, 0x34($sp)
/* 28B48 80027F48 24777C70 */  addiu      $s7, $v1, %lo(combat_bytes)
/* 28B4C 80027F4C AFBF0038 */  sw         $ra, 0x38($sp)
/* 28B50 80027F50 AFB5002C */  sw         $s5, 0x2c($sp)
/* 28B54 80027F54 AFB30024 */  sw         $s3, 0x24($sp)
/* 28B58 80027F58 AFB20020 */  sw         $s2, 0x20($sp)
/* 28B5C 80027F5C AFB1001C */  sw         $s1, 0x1c($sp)
/* 28B60 80027F60 90460014 */  lbu        $a2, 0x14($v0)
/* 28B64 80027F64 8C52002C */  lw         $s2, 0x2c($v0)
/* 28B68 80027F68 00069880 */  sll        $s3, $a2, 2
/* 28B6C 80027F6C 00531821 */  addu       $v1, $v0, $s3
/* 28B70 80027F70 0C009FAC */  jal        func_80027EB0
/* 28B74 80027F74 8C7152D0 */   lw        $s1, 0x52d0($v1)
/* 28B78 80027F78 10400046 */  beqz       $v0, .L80028094
/* 28B7C 80027F7C 0200A821 */   addu      $s5, $s0, $zero
/* 28B80 80027F80 02F31021 */  addu       $v0, $s7, $s3
/* 28B84 80027F84 8C530034 */  lw         $s3, 0x34($v0)
/* 28B88 80027F88 12600048 */  beqz       $s3, .L800280AC
/* 28B8C 80027F8C 24020002 */   addiu     $v0, $zero, 2
/* 28B90 80027F90 9242008A */  lbu        $v0, 0x8a($s2)
/* 28B94 80027F94 10400019 */  beqz       $v0, .L80027FFC
/* 28B98 80027F98 8EA2F760 */   lw        $v0, -0x8a0($s5)
/* 28B9C 80027F9C 90434F08 */  lbu        $v1, 0x4f08($v0)
/* 28BA0 80027FA0 10600016 */  beqz       $v1, .L80027FFC
/* 28BA4 80027FA4 24020002 */   addiu     $v0, $zero, 2
/* 28BA8 80027FA8 92430025 */  lbu        $v1, 0x25($s2)
/* 28BAC 80027FAC 10620005 */  beq        $v1, $v0, .L80027FC4
/* 28BB0 80027FB0 24020004 */   addiu     $v0, $zero, 4
/* 28BB4 80027FB4 10620003 */  beq        $v1, $v0, .L80027FC4
/* 28BB8 80027FB8 24020003 */   addiu     $v0, $zero, 3
/* 28BBC 80027FBC 54620010 */  bnel       $v1, $v0, .L80028000
/* 28BC0 80027FC0 92220029 */   lbu       $v0, 0x29($s1)
.L80027FC4:
/* 28BC4 80027FC4 0C00A6F1 */  jal        gamecombat_weapon_func
/* 28BC8 80027FC8 00000000 */   nop
/* 28BCC 80027FCC 02402021 */  addu       $a0, $s2, $zero
/* 28BD0 80027FD0 24020003 */  addiu      $v0, $zero, 3
/* 28BD4 80027FD4 0C01A060 */  jal        get_combatEnt_x_f
/* 28BD8 80027FD8 A2E20000 */   sb        $v0, ($s7)
/* 28BDC 80027FDC 8EA2F760 */  lw         $v0, -0x8a0($s5)
/* 28BE0 80027FE0 02402021 */  addu       $a0, $s2, $zero
/* 28BE4 80027FE4 0C01A062 */  jal        get_combatEnt_y_f
/* 28BE8 80027FE8 E4400018 */   swc1      $f0, 0x18($v0)
/* 28BEC 80027FEC 8EA3F760 */  lw         $v1, -0x8a0($s5)
/* 28BF0 80027FF0 24020002 */  addiu      $v0, $zero, 2
/* 28BF4 80027FF4 0800A02B */  j          .L800280AC
/* 28BF8 80027FF8 E460001C */   swc1      $f0, 0x1c($v1)
.L80027FFC:
/* 28BFC 80027FFC 92220029 */  lbu        $v0, 0x29($s1)
.L80028000:
/* 28C00 80028000 10400005 */  beqz       $v0, .L80028018
/* 28C04 80028004 02202021 */   addu      $a0, $s1, $zero
/* 28C08 80028008 0C00A036 */  jal        func_keel_over_after_ambush
/* 28C0C 8002800C 02602821 */   addu      $a1, $s3, $zero
/* 28C10 80028010 0800A01B */  j          .L8002806C
/* 28C14 80028014 00000000 */   nop
.L80028018:
/* 28C18 80028018 0C01A07D */  jal        CombatEnt_flag_4
/* 28C1C 8002801C 02402021 */   addu      $a0, $s2, $zero
/* 28C20 80028020 02202021 */  addu       $a0, $s1, $zero
/* 28C24 80028024 0C01A07D */  jal        CombatEnt_flag_4
/* 28C28 80028028 00408021 */   addu      $s0, $v0, $zero
/* 28C2C 8002802C 1602000E */  bne        $s0, $v0, .L80028068
/* 28C30 80028030 24020008 */   addiu     $v0, $zero, 8
/* 28C34 80028034 8E240040 */  lw         $a0, 0x40($s1)
/* 28C38 80028038 2402000A */  addiu      $v0, $zero, 0xa
/* 28C3C 8002803C 0C01DF1D */  jal        isDead
/* 28C40 80028040 A6620014 */   sh        $v0, 0x14($s3)
/* 28C44 80028044 02602021 */  addu       $a0, $s3, $zero
/* 28C48 80028048 00002821 */  addu       $a1, $zero, $zero
/* 28C4C 8002804C 9226002A */  lbu        $a2, 0x2a($s1)
/* 28C50 80028050 8E230040 */  lw         $v1, 0x40($s1)
/* 28C54 80028054 00403821 */  addu       $a3, $v0, $zero
/* 28C58 80028058 0C009E81 */  jal        gamecombat_actor_func
/* 28C5C 8002805C AFA30010 */   sw        $v1, 0x10($sp)
/* 28C60 80028060 0800A01B */  j          .L8002806C
/* 28C64 80028064 00000000 */   nop
.L80028068:
/* 28C68 80028068 A6620014 */  sh         $v0, 0x14($s3)
.L8002806C:
/* 28C6C 8002806C 0C01DF1D */  jal        isDead
/* 28C70 80028070 8E240040 */   lw        $a0, 0x40($s1)
/* 28C74 80028074 10400004 */  beqz       $v0, .L80028088
/* 28C78 80028078 8EA4F760 */   lw        $a0, -0x8a0($s5)
/* 28C7C 8002807C 0C009E7B */  jal        some_death_func_A
/* 28C80 80028080 02602021 */   addu      $a0, $s3, $zero
/* 28C84 80028084 8EA4F760 */  lw         $a0, -0x8a0($s5)
.L80028088:
/* 28C88 80028088 24020004 */  addiu      $v0, $zero, 4
/* 28C8C 8002808C 0C019E24 */  jal        copy_to_textbox_1
/* 28C90 80028090 A2E20000 */   sb        $v0, ($s7)
.L80028094:
/* 28C94 80028094 00142C00 */  sll        $a1, $s4, 0x10
/* 28C98 80028098 8EC40000 */  lw         $a0, ($s6)
/* 28C9C 8002809C 0C009F43 */  jal        func_80027D0C
/* 28CA0 800280A0 00052C03 */   sra       $a1, $a1, 0x10
/* 28CA4 800280A4 AEC20000 */  sw         $v0, ($s6)
/* 28CA8 800280A8 24020002 */  addiu      $v0, $zero, 2
.L800280AC:
/* 28CAC 800280AC 8FBF0038 */  lw         $ra, 0x38($sp)
/* 28CB0 800280B0 8FB70034 */  lw         $s7, 0x34($sp)
/* 28CB4 800280B4 8FB60030 */  lw         $s6, 0x30($sp)
/* 28CB8 800280B8 8FB5002C */  lw         $s5, 0x2c($sp)
/* 28CBC 800280BC 8FB40028 */  lw         $s4, 0x28($sp)
/* 28CC0 800280C0 8FB30024 */  lw         $s3, 0x24($sp)
/* 28CC4 800280C4 8FB20020 */  lw         $s2, 0x20($sp)
/* 28CC8 800280C8 8FB1001C */  lw         $s1, 0x1c($sp)
/* 28CCC 800280CC 8FB00018 */  lw         $s0, 0x18($sp)
/* 28CD0 800280D0 03E00008 */  jr         $ra
/* 28CD4 800280D4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_keel_over_after_ambush
/* 28CD8 800280D8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 28CDC 800280DC AFB00018 */  sw         $s0, 0x18($sp)
/* 28CE0 800280E0 00808021 */  addu       $s0, $a0, $zero
/* 28CE4 800280E4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 28CE8 800280E8 00A08821 */  addu       $s1, $a1, $zero
/* 28CEC 800280EC AFBF0020 */  sw         $ra, 0x20($sp)
/* 28CF0 800280F0 8E040040 */  lw         $a0, 0x40($s0)
/* 28CF4 800280F4 92050029 */  lbu        $a1, 0x29($s0)
/* 28CF8 800280F8 0C01DF6B */  jal        func_checking_cheat_death
/* 28CFC 800280FC 02003021 */   addu      $a2, $s0, $zero
/* 28D00 80028100 24020007 */  addiu      $v0, $zero, 7
/* 28D04 80028104 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 28D08 80028108 24637C70 */  addiu      $v1, $v1, %lo(combat_bytes)
/* 28D0C 8002810C A6220014 */  sh         $v0, 0x14($s1)
/* 28D10 80028110 9464001E */  lhu        $a0, 0x1e($v1)
/* 28D14 80028114 240203D2 */  addiu      $v0, $zero, 0x3d2
/* 28D18 80028118 14820009 */  bne        $a0, $v0, .L80028140
/* 28D1C 8002811C 00000000 */   nop
/* 28D20 80028120 92020020 */  lbu        $v0, 0x20($s0)
/* 28D24 80028124 14400006 */  bnez       $v0, .L80028140
/* 28D28 80028128 00000000 */   nop
/* 28D2C 8002812C 9062007A */  lbu        $v0, 0x7a($v1)
/* 28D30 80028130 14400003 */  bnez       $v0, .L80028140
/* 28D34 80028134 00000000 */   nop
/* 28D38 80028138 0C009E7B */  jal        some_death_func_A
/* 28D3C 8002813C 02202021 */   addu      $a0, $s1, $zero
.L80028140:
/* 28D40 80028140 0C01DF1D */  jal        isDead
/* 28D44 80028144 8E040040 */   lw        $a0, 0x40($s0)
/* 28D48 80028148 02202021 */  addu       $a0, $s1, $zero
/* 28D4C 8002814C 00003021 */  addu       $a2, $zero, $zero
/* 28D50 80028150 92050029 */  lbu        $a1, 0x29($s0)
/* 28D54 80028154 8E030040 */  lw         $v1, 0x40($s0)
/* 28D58 80028158 00403821 */  addu       $a3, $v0, $zero
/* 28D5C 8002815C 0C009E81 */  jal        gamecombat_actor_func
/* 28D60 80028160 AFA30010 */   sw        $v1, 0x10($sp)
/* 28D64 80028164 8FBF0020 */  lw         $ra, 0x20($sp)
/* 28D68 80028168 8FB1001C */  lw         $s1, 0x1c($sp)
/* 28D6C 8002816C A2000029 */  sb         $zero, 0x29($s0)
/* 28D70 80028170 A200002A */  sb         $zero, 0x2a($s0)
/* 28D74 80028174 8FB00018 */  lw         $s0, 0x18($sp)
/* 28D78 80028178 03E00008 */  jr         $ra
/* 28D7C 8002817C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80028180
/* 28D80 80028180 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 28D84 80028184 3C06800F */  lui        $a2, %hi(combatPointer)
/* 28D88 80028188 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 28D8C 8002818C AFB40028 */  sw         $s4, 0x28($sp)
/* 28D90 80028190 24747C70 */  addiu      $s4, $v1, %lo(combat_bytes)
/* 28D94 80028194 8CC4F760 */  lw         $a0, %lo(combatPointer)($a2)
/* 28D98 80028198 24070003 */  addiu      $a3, $zero, 3
/* 28D9C 8002819C AFB5002C */  sw         $s5, 0x2c($sp)
/* 28DA0 800281A0 00C0A821 */  addu       $s5, $a2, $zero
/* 28DA4 800281A4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 28DA8 800281A8 AFB30024 */  sw         $s3, 0x24($sp)
/* 28DAC 800281AC AFB20020 */  sw         $s2, 0x20($sp)
/* 28DB0 800281B0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 28DB4 800281B4 AFB00018 */  sw         $s0, 0x18($sp)
/* 28DB8 800281B8 90820014 */  lbu        $v0, 0x14($a0)
/* 28DBC 800281BC 8C93002C */  lw         $s3, 0x2c($a0)
/* 28DC0 800281C0 00021080 */  sll        $v0, $v0, 2
/* 28DC4 800281C4 00822821 */  addu       $a1, $a0, $v0
/* 28DC8 800281C8 02821021 */  addu       $v0, $s4, $v0
/* 28DCC 800281CC 8CB152D0 */  lw         $s1, 0x52d0($a1)
/* 28DD0 800281D0 92630025 */  lbu        $v1, 0x25($s3)
/* 28DD4 800281D4 14670005 */  bne        $v1, $a3, .L800281EC
/* 28DD8 800281D8 8C520034 */   lw        $s2, 0x34($v0)
/* 28DDC 800281DC 02602021 */  addu       $a0, $s3, $zero
/* 28DE0 800281E0 92660029 */  lbu        $a2, 0x29($s3)
/* 28DE4 800281E4 0C01B930 */  jal        func_8006E4C0
/* 28DE8 800281E8 02202821 */   addu      $a1, $s1, $zero
.L800281EC:
/* 28DEC 800281EC 92220029 */  lbu        $v0, 0x29($s1)
/* 28DF0 800281F0 10400005 */  beqz       $v0, .L80028208
/* 28DF4 800281F4 02202021 */   addu      $a0, $s1, $zero
/* 28DF8 800281F8 0C00A036 */  jal        func_keel_over_after_ambush
/* 28DFC 800281FC 02402821 */   addu      $a1, $s2, $zero
/* 28E00 80028200 0800A097 */  j          .L8002825C
/* 28E04 80028204 00000000 */   nop
.L80028208:
/* 28E08 80028208 0C01A07D */  jal        CombatEnt_flag_4
/* 28E0C 8002820C 02602021 */   addu      $a0, $s3, $zero
/* 28E10 80028210 02202021 */  addu       $a0, $s1, $zero
/* 28E14 80028214 0C01A07D */  jal        CombatEnt_flag_4
/* 28E18 80028218 00408021 */   addu      $s0, $v0, $zero
/* 28E1C 8002821C 1602000E */  bne        $s0, $v0, .L80028258
/* 28E20 80028220 24020008 */   addiu     $v0, $zero, 8
/* 28E24 80028224 8E240040 */  lw         $a0, 0x40($s1)
/* 28E28 80028228 2402000A */  addiu      $v0, $zero, 0xa
/* 28E2C 8002822C 0C01DF1D */  jal        isDead
/* 28E30 80028230 A6420014 */   sh        $v0, 0x14($s2)
/* 28E34 80028234 02402021 */  addu       $a0, $s2, $zero
/* 28E38 80028238 00403821 */  addu       $a3, $v0, $zero
/* 28E3C 8002823C 9226002A */  lbu        $a2, 0x2a($s1)
/* 28E40 80028240 8E220040 */  lw         $v0, 0x40($s1)
/* 28E44 80028244 00002821 */  addu       $a1, $zero, $zero
/* 28E48 80028248 0C009E81 */  jal        gamecombat_actor_func
/* 28E4C 8002824C AFA20010 */   sw        $v0, 0x10($sp)
/* 28E50 80028250 0800A097 */  j          .L8002825C
/* 28E54 80028254 00000000 */   nop
.L80028258:
/* 28E58 80028258 A6420014 */  sh         $v0, 0x14($s2)
.L8002825C:
/* 28E5C 8002825C 0C01DF1D */  jal        isDead
/* 28E60 80028260 8E240040 */   lw        $a0, 0x40($s1)
/* 28E64 80028264 50400004 */  beql       $v0, $zero, .L80028278
/* 28E68 80028268 3C04800E */   lui       $a0, 0x800e
/* 28E6C 8002826C 0C009E7B */  jal        some_death_func_A
/* 28E70 80028270 02402021 */   addu      $a0, $s2, $zero
/* 28E74 80028274 3C04800E */  lui        $a0, %hi(queueStructA)
.L80028278:
/* 28E78 80028278 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 28E7C 8002827C 3C05800F */  lui        $a1, %hi(AnimationDataPointer)
/* 28E80 80028280 24A59B88 */  addiu      $a1, $a1, %lo(AnimationDataPointer)
/* 28E84 80028284 24060001 */  addiu      $a2, $zero, 1
/* 28E88 80028288 0C035867 */  jal        AllocFreeQueueItem
/* 28E8C 8002828C 00003821 */   addu      $a3, $zero, $zero
/* 28E90 80028290 0C01BF2C */  jal        get_weapon_sheild_borg5
/* 28E94 80028294 02602021 */   addu      $a0, $s3, $zero
/* 28E98 80028298 0C019E24 */  jal        copy_to_textbox_1
/* 28E9C 8002829C 8EA4F760 */   lw        $a0, -0x8a0($s5)
/* 28EA0 800282A0 8FBF0030 */  lw         $ra, 0x30($sp)
/* 28EA4 800282A4 8FB5002C */  lw         $s5, 0x2c($sp)
/* 28EA8 800282A8 24020004 */  addiu      $v0, $zero, 4
/* 28EAC 800282AC A2820000 */  sb         $v0, ($s4)
/* 28EB0 800282B0 8FB40028 */  lw         $s4, 0x28($sp)
/* 28EB4 800282B4 8FB30024 */  lw         $s3, 0x24($sp)
/* 28EB8 800282B8 8FB20020 */  lw         $s2, 0x20($sp)
/* 28EBC 800282BC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 28EC0 800282C0 8FB00018 */  lw         $s0, 0x18($sp)
/* 28EC4 800282C4 03E00008 */  jr         $ra
/* 28EC8 800282C8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800282CC
/* 28ECC 800282CC 3C02800F */  lui        $v0, %hi(combatPointer)
/* 28ED0 800282D0 8C46F760 */  lw         $a2, %lo(combatPointer)($v0)
/* 28ED4 800282D4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 28ED8 800282D8 AFB00010 */  sw         $s0, 0x10($sp)
/* 28EDC 800282DC 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 28EE0 800282E0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 28EE4 800282E4 AFB10014 */  sw         $s1, 0x14($sp)
/* 28EE8 800282E8 8CC352CC */  lw         $v1, 0x52cc($a2)
/* 28EEC 800282EC 3C02800F */  lui        $v0, %hi(AnimationDataPointer)
/* 28EF0 800282F0 00702821 */  addu       $a1, $v1, $s0
/* 28EF4 800282F4 8C439B88 */  lw         $v1, %lo(AnimationDataPointer)($v0)
/* 28EF8 800282F8 00808821 */  addu       $s1, $a0, $zero
/* 28EFC 800282FC 14600008 */  bnez       $v1, .L80028320
/* 28F00 80028300 ACC552CC */   sw        $a1, 0x52cc($a2)
/* 28F04 80028304 2CA2001E */  sltiu      $v0, $a1, 0x1e
/* 28F08 80028308 14400037 */  bnez       $v0, .L800283E8
/* 28F0C 8002830C 00102C00 */   sll       $a1, $s0, 0x10
/* 28F10 80028310 0C00A060 */  jal        func_80028180
/* 28F14 80028314 00000000 */   nop
/* 28F18 80028318 0800A0FA */  j          .L800283E8
/* 28F1C 8002831C 00102C00 */   sll       $a1, $s0, 0x10
.L80028320:
/* 28F20 80028320 3C07800F */  lui        $a3, %hi(D_800E9B80)
/* 28F24 80028324 3C02800F */  lui        $v0, %hi(D_800E9B70)
/* 28F28 80028328 C4EE9B80 */  lwc1       $f14, %lo(D_800E9B80)($a3)
/* 28F2C 8002832C C4409B70 */  lwc1       $f0, %lo(D_800E9B70)($v0)
/* 28F30 80028330 4600703C */  c.lt.s     $f14, $f0
/* 28F34 80028334 00000000 */  nop
/* 28F38 80028338 45000025 */  bc1f       .L800283D0
/* 28F3C 8002833C 3C02800F */   lui       $v0, %hi(D_800E9B74)
/* 28F40 80028340 C44C9B74 */  lwc1       $f12, %lo(D_800E9B74)($v0)
/* 28F44 80028344 44905000 */  mtc1       $s0, $f10
/* 28F48 80028348 468052A0 */  cvt.s.w    $f10, $f10
/* 28F4C 8002834C 460A6302 */  mul.s      $f12, $f12, $f10
/* 28F50 80028350 3C02800F */  lui        $v0, %hi(D_800F53F0)
/* 28F54 80028354 C44053F0 */  lwc1       $f0, %lo(D_800F53F0)($v0)
/* 28F58 80028358 460A0002 */  mul.s      $f0, $f0, $f10
/* 28F5C 8002835C 244253F0 */  addiu      $v0, $v0, 0x53f0
/* 28F60 80028360 C4460004 */  lwc1       $f6, 4($v0)
/* 28F64 80028364 460A3182 */  mul.s      $f6, $f6, $f10
/* 28F68 80028368 C4480008 */  lwc1       $f8, 8($v0)
/* 28F6C 8002836C 460A4202 */  mul.s      $f8, $f8, $f10
/* 28F70 80028370 3C03800F */  lui        $v1, %hi(D_800F5400)
/* 28F74 80028374 C4645400 */  lwc1       $f4, %lo(D_800F5400)($v1)
/* 28F78 80028378 24625400 */  addiu      $v0, $v1, 0x5400
/* 28F7C 8002837C 46002100 */  add.s      $f4, $f4, $f0
/* 28F80 80028380 C4420004 */  lwc1       $f2, 4($v0)
/* 28F84 80028384 46061080 */  add.s      $f2, $f2, $f6
/* 28F88 80028388 460C7300 */  add.s      $f12, $f14, $f12
/* 28F8C 8002838C C4400008 */  lwc1       $f0, 8($v0)
/* 28F90 80028390 3C04800F */  lui        $a0, %hi(D_800E9B7C)
/* 28F94 80028394 46080000 */  add.s      $f0, $f0, $f8
/* 28F98 80028398 C4869B7C */  lwc1       $f6, %lo(D_800E9B7C)($a0)
/* 28F9C 8002839C 00102C00 */  sll        $a1, $s0, 0x10
/* 28FA0 800283A0 460A3182 */  mul.s      $f6, $f6, $f10
/* 28FA4 800283A4 E4645400 */  swc1       $f4, 0x5400($v1)
/* 28FA8 800283A8 E4420004 */  swc1       $f2, 4($v0)
/* 28FAC 800283AC E4400008 */  swc1       $f0, 8($v0)
/* 28FB0 800283B0 3C02800F */  lui        $v0, %hi(D_800E9B84)
/* 28FB4 800283B4 C4409B84 */  lwc1       $f0, %lo(D_800E9B84)($v0)
/* 28FB8 800283B8 8E240000 */  lw         $a0, ($s1)
/* 28FBC 800283BC 46060000 */  add.s      $f0, $f0, $f6
/* 28FC0 800283C0 00052C03 */  sra        $a1, $a1, 0x10
/* 28FC4 800283C4 E4EC9B80 */  swc1       $f12, -0x6480($a3)
/* 28FC8 800283C8 0800A0FC */  j          .L800283F0
/* 28FCC 800283CC E4409B84 */   swc1      $f0, -0x647c($v0)
.L800283D0:
/* 28FD0 800283D0 2CA2001E */  sltiu      $v0, $a1, 0x1e
/* 28FD4 800283D4 14400004 */  bnez       $v0, .L800283E8
/* 28FD8 800283D8 00102C00 */   sll       $a1, $s0, 0x10
/* 28FDC 800283DC 0C00A060 */  jal        func_80028180
/* 28FE0 800283E0 ACC052CC */   sw        $zero, 0x52cc($a2)
/* 28FE4 800283E4 00102C00 */  sll        $a1, $s0, 0x10
.L800283E8:
/* 28FE8 800283E8 8E240000 */  lw         $a0, ($s1)
/* 28FEC 800283EC 00052C03 */  sra        $a1, $a1, 0x10
.L800283F0:
/* 28FF0 800283F0 0C009F43 */  jal        func_80027D0C
/* 28FF4 800283F4 00000000 */   nop
/* 28FF8 800283F8 AE220000 */  sw         $v0, ($s1)
/* 28FFC 800283FC 24020002 */  addiu      $v0, $zero, 2
/* 29000 80028400 8FBF0018 */  lw         $ra, 0x18($sp)
/* 29004 80028404 8FB10014 */  lw         $s1, 0x14($sp)
/* 29008 80028408 8FB00010 */  lw         $s0, 0x10($sp)
/* 2900C 8002840C 03E00008 */  jr         $ra
/* 29010 80028410 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_death_func_B
/* 29014 80028414 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29018 80028418 AFB00010 */  sw         $s0, 0x10($sp)
/* 2901C 8002841C 00808021 */  addu       $s0, $a0, $zero
/* 29020 80028420 AFB10014 */  sw         $s1, 0x14($sp)
/* 29024 80028424 00C08821 */  addu       $s1, $a2, $zero
/* 29028 80028428 AFB20018 */  sw         $s2, 0x18($sp)
/* 2902C 8002842C 30B200FF */  andi       $s2, $a1, 0xff
/* 29030 80028430 12000022 */  beqz       $s0, .L800284BC
/* 29034 80028434 AFBF001C */   sw        $ra, 0x1c($sp)
/* 29038 80028438 0C01C077 */  jal        clear_combatEnt_effects
/* 2903C 8002843C 02202021 */   addu      $a0, $s1, $zero
/* 29040 80028440 0C01EADA */  jal        clear_charsheet_potions
/* 29044 80028444 8E240040 */   lw        $a0, 0x40($s1)
/* 29048 80028448 0C025812 */  jal        func_80096048
/* 2904C 8002844C 02002021 */   addu      $a0, $s0, $zero
/* 29050 80028450 0C02508A */  jal        func_80094228
/* 29054 80028454 02002021 */   addu      $a0, $s0, $zero
/* 29058 80028458 0C0061F1 */  jal        playerData_death_flags
/* 2905C 8002845C 02002021 */   addu      $a0, $s0, $zero
/* 29060 80028460 96040756 */  lhu        $a0, 0x756($s0)
/* 29064 80028464 0C023E62 */  jal        pass_to_draw_crossbones
/* 29068 80028468 02402821 */   addu      $a1, $s2, $zero
/* 2906C 8002846C 00002821 */  addu       $a1, $zero, $zero
/* 29070 80028470 3C02800E */  lui        $v0, %hi(gGlobals)
/* 29074 80028474 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 29078 80028478 00121880 */  sll        $v1, $s2, 2
/* 2907C 8002847C 00431021 */  addu       $v0, $v0, $v1
/* 29080 80028480 96040756 */  lhu        $a0, 0x756($s0)
/* 29084 80028484 00003021 */  addu       $a2, $zero, $zero
/* 29088 80028488 0C01D77A */  jal        GetIDIndex
/* 2908C 8002848C AC4013FC */   sw        $zero, 0x13fc($v0)
/* 29090 80028490 00408021 */  addu       $s0, $v0, $zero
/* 29094 80028494 240200AC */  addiu      $v0, $zero, 0xac
/* 29098 80028498 16020004 */  bne        $s0, $v0, .L800284AC
/* 2909C 8002849C 24020099 */   addiu     $v0, $zero, 0x99
/* 290A0 800284A0 0C00A895 */  jal        clear_shadow_index
/* 290A4 800284A4 00000000 */   nop
/* 290A8 800284A8 24020099 */  addiu      $v0, $zero, 0x99
.L800284AC:
/* 290AC 800284AC 16020004 */  bne        $s0, $v0, .L800284C0
/* 290B0 800284B0 8FBF001C */   lw        $ra, 0x1c($sp)
/* 290B4 800284B4 0C00A899 */  jal        clear_alaron_index
/* 290B8 800284B8 00000000 */   nop
.L800284BC:
/* 290BC 800284BC 8FBF001C */  lw         $ra, 0x1c($sp)
.L800284C0:
/* 290C0 800284C0 8FB20018 */  lw         $s2, 0x18($sp)
/* 290C4 800284C4 8FB10014 */  lw         $s1, 0x14($sp)
/* 290C8 800284C8 8FB00010 */  lw         $s0, 0x10($sp)
/* 290CC 800284CC 03E00008 */  jr         $ra
/* 290D0 800284D0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800284D4
/* 290D4 800284D4 3C04800F */  lui        $a0, %hi(combatPointer)
/* 290D8 800284D8 8C86F760 */  lw         $a2, %lo(combatPointer)($a0)
/* 290DC 800284DC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 290E0 800284E0 AFB50024 */  sw         $s5, 0x24($sp)
/* 290E4 800284E4 0080A821 */  addu       $s5, $a0, $zero
/* 290E8 800284E8 AFBF0034 */  sw         $ra, 0x34($sp)
/* 290EC 800284EC AFBE0030 */  sw         $fp, 0x30($sp)
/* 290F0 800284F0 AFB7002C */  sw         $s7, 0x2c($sp)
/* 290F4 800284F4 AFB60028 */  sw         $s6, 0x28($sp)
/* 290F8 800284F8 AFB40020 */  sw         $s4, 0x20($sp)
/* 290FC 800284FC AFB3001C */  sw         $s3, 0x1c($sp)
/* 29100 80028500 AFB20018 */  sw         $s2, 0x18($sp)
/* 29104 80028504 AFB10014 */  sw         $s1, 0x14($sp)
/* 29108 80028508 AFB00010 */  sw         $s0, 0x10($sp)
/* 2910C 8002850C 90C24F08 */  lbu        $v0, 0x4f08($a2)
/* 29110 80028510 90C34FB0 */  lbu        $v1, 0x4fb0($a2)
/* 29114 80028514 90D10014 */  lbu        $s1, 0x14($a2)
/* 29118 80028518 8CD3002C */  lw         $s3, 0x2c($a2)
/* 2911C 8002851C 00431021 */  addu       $v0, $v0, $v1
/* 29120 80028520 305400FF */  andi       $s4, $v0, 0xff
/* 29124 80028524 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 29128 80028528 247E7C70 */  addiu      $fp, $v1, %lo(combat_bytes)
/* 2912C 8002852C 00111080 */  sll        $v0, $s1, 2
/* 29130 80028530 27D70034 */  addiu      $s7, $fp, 0x34
/* 29134 80028534 0057B021 */  addu       $s6, $v0, $s7
/* 29138 80028538 00C21021 */  addu       $v0, $a2, $v0
/* 2913C 8002853C 8ED20000 */  lw         $s2, ($s6)
/* 29140 80028540 12800059 */  beqz       $s4, .L800286A8
/* 29144 80028544 8C5052D0 */   lw        $s0, 0x52d0($v0)
/* 29148 80028548 12400058 */  beqz       $s2, .L800286AC
/* 2914C 8002854C 8FBF0034 */   lw        $ra, 0x34($sp)
/* 29150 80028550 86420018 */  lh         $v0, 0x18($s2)
/* 29154 80028554 54400056 */  bnel       $v0, $zero, .L800286B0
/* 29158 80028558 8FBE0030 */   lw        $fp, 0x30($sp)
/* 2915C 8002855C 8CC252CC */  lw         $v0, 0x52cc($a2)
/* 29160 80028560 2C42003C */  sltiu      $v0, $v0, 0x3c
/* 29164 80028564 54400052 */  bnel       $v0, $zero, .L800286B0
/* 29168 80028568 8FBE0030 */   lw        $fp, 0x30($sp)
/* 2916C 8002856C 2682FFFF */  addiu      $v0, $s4, -1
/* 29170 80028570 305400FF */  andi       $s4, $v0, 0xff
/* 29174 80028574 02402021 */  addu       $a0, $s2, $zero
/* 29178 80028578 24050800 */  addiu      $a1, $zero, 0x800
/* 2917C 8002857C 0C0061CB */  jal        playerdata_NAND_flags
/* 29180 80028580 ACC052CC */   sw        $zero, 0x52cc($a2)
/* 29184 80028584 0C01DF1D */  jal        isDead
/* 29188 80028588 8E040040 */   lw        $a0, 0x40($s0)
/* 2918C 8002858C 10400004 */  beqz       $v0, .L800285A0
/* 29190 80028590 02402021 */   addu      $a0, $s2, $zero
/* 29194 80028594 02202821 */  addu       $a1, $s1, $zero
/* 29198 80028598 0C00A105 */  jal        some_death_func_B
/* 2919C 8002859C 02003021 */   addu      $a2, $s0, $zero
.L800285A0:
/* 291A0 800285A0 92620020 */  lbu        $v0, 0x20($s3)
/* 291A4 800285A4 00021080 */  sll        $v0, $v0, 2
/* 291A8 800285A8 00571021 */  addu       $v0, $v0, $s7
/* 291AC 800285AC 8C520000 */  lw         $s2, ($v0)
/* 291B0 800285B0 1240000A */  beqz       $s2, .L800285DC
/* 291B4 800285B4 02402021 */   addu      $a0, $s2, $zero
/* 291B8 800285B8 0C0061CB */  jal        playerdata_NAND_flags
/* 291BC 800285BC 24050800 */   addiu     $a1, $zero, 0x800
/* 291C0 800285C0 0C006744 */  jal        GiveCameraToPlayer
/* 291C4 800285C4 02402021 */   addu      $a0, $s2, $zero
/* 291C8 800285C8 0800A17D */  j          .L800285F4
/* 291CC 800285CC 8EA4F760 */   lw        $a0, -0x8a0($s5)
.L800285D0:
/* 291D0 800285D0 24020006 */  addiu      $v0, $zero, 6
/* 291D4 800285D4 0800A1AA */  j          .L800286A8
/* 291D8 800285D8 A3C20000 */   sb        $v0, ($fp)
.L800285DC:
/* 291DC 800285DC 8EC40000 */  lw         $a0, ($s6)
/* 291E0 800285E0 50800004 */  beql       $a0, $zero, .L800285F4
/* 291E4 800285E4 8EA4F760 */   lw        $a0, -0x8a0($s5)
/* 291E8 800285E8 0C006744 */  jal        GiveCameraToPlayer
/* 291EC 800285EC 00000000 */   nop
/* 291F0 800285F0 8EA4F760 */  lw         $a0, -0x8a0($s5)
.L800285F4:
/* 291F4 800285F4 02202821 */  addu       $a1, $s1, $zero
/* 291F8 800285F8 0C01C8DF */  jal        clear_arrayB_entry
/* 291FC 800285FC 24844E64 */   addiu     $a0, $a0, 0x4e64
/* 29200 80028600 8EA4F760 */  lw         $a0, -0x8a0($s5)
/* 29204 80028604 02202821 */  addu       $a1, $s1, $zero
/* 29208 80028608 0C01C8DF */  jal        clear_arrayB_entry
/* 2920C 8002860C 24844F0C */   addiu     $a0, $a0, 0x4f0c
/* 29210 80028610 12800025 */  beqz       $s4, .L800286A8
/* 29214 80028614 8EA2F760 */   lw        $v0, -0x8a0($s5)
/* 29218 80028618 90430001 */  lbu        $v1, 1($v0)
/* 2921C 8002861C 10600022 */  beqz       $v1, .L800286A8
/* 29220 80028620 00008821 */   addu      $s1, $zero, $zero
/* 29224 80028624 8EA6F760 */  lw         $a2, -0x8a0($s5)
.L80028628:
/* 29228 80028628 00112080 */  sll        $a0, $s1, 2
/* 2922C 8002862C 00C41021 */  addu       $v0, $a2, $a0
/* 29230 80028630 8C434EAC */  lw         $v1, 0x4eac($v0)
/* 29234 80028634 54600005 */  bnel       $v1, $zero, .L8002864C
/* 29238 80028638 A0D10014 */   sb        $s1, 0x14($a2)
/* 2923C 8002863C 8C434F54 */  lw         $v1, 0x4f54($v0)
/* 29240 80028640 10600014 */  beqz       $v1, .L80028694
/* 29244 80028644 26230001 */   addiu     $v1, $s1, 1
/* 29248 80028648 A0D10014 */  sb         $s1, 0x14($a2)
.L8002864C:
/* 2924C 8002864C 92620020 */  lbu        $v0, 0x20($s3)
/* 29250 80028650 1222FFDF */  beq        $s1, $v0, .L800285D0
/* 29254 80028654 8EA2F760 */   lw        $v0, -0x8a0($s5)
/* 29258 80028658 00441021 */  addu       $v0, $v0, $a0
/* 2925C 8002865C 8C5052D0 */  lw         $s0, 0x52d0($v0)
/* 29260 80028660 0C01A00C */  jal        get_combatEnt_x
/* 29264 80028664 02002021 */   addu      $a0, $s0, $zero
/* 29268 80028668 02002021 */  addu       $a0, $s0, $zero
/* 2926C 8002866C 0C01A021 */  jal        get_combatEnt_y
/* 29270 80028670 00408021 */   addu      $s0, $v0, $zero
/* 29274 80028674 02602021 */  addu       $a0, $s3, $zero
/* 29278 80028678 02002821 */  addu       $a1, $s0, $zero
/* 2927C 8002867C 0C01A2C3 */  jal        func_80068B0C
/* 29280 80028680 00403021 */   addu      $a2, $v0, $zero
/* 29284 80028684 0C01A38E */  jal        func_80068E38
/* 29288 80028688 02602021 */   addu      $a0, $s3, $zero
/* 2928C 8002868C 0800A1AB */  j          .L800286AC
/* 29290 80028690 8FBF0034 */   lw        $ra, 0x34($sp)
.L80028694:
/* 29294 80028694 90C20001 */  lbu        $v0, 1($a2)
/* 29298 80028698 307100FF */  andi       $s1, $v1, 0xff
/* 2929C 8002869C 0222102B */  sltu       $v0, $s1, $v0
/* 292A0 800286A0 1440FFE1 */  bnez       $v0, .L80028628
/* 292A4 800286A4 8EA6F760 */   lw        $a2, -0x8a0($s5)
.L800286A8:
/* 292A8 800286A8 8FBF0034 */  lw         $ra, 0x34($sp)
.L800286AC:
/* 292AC 800286AC 8FBE0030 */  lw         $fp, 0x30($sp)
.L800286B0:
/* 292B0 800286B0 8FB7002C */  lw         $s7, 0x2c($sp)
/* 292B4 800286B4 8FB60028 */  lw         $s6, 0x28($sp)
/* 292B8 800286B8 8FB50024 */  lw         $s5, 0x24($sp)
/* 292BC 800286BC 8FB40020 */  lw         $s4, 0x20($sp)
/* 292C0 800286C0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 292C4 800286C4 8FB20018 */  lw         $s2, 0x18($sp)
/* 292C8 800286C8 8FB10014 */  lw         $s1, 0x14($sp)
/* 292CC 800286CC 8FB00010 */  lw         $s0, 0x10($sp)
/* 292D0 800286D0 03E00008 */  jr         $ra
/* 292D4 800286D4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800286D8
/* 292D8 800286D8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 292DC 800286DC AFB00010 */  sw         $s0, 0x10($sp)
/* 292E0 800286E0 3C10800F */  lui        $s0, %hi(combatPointer)
/* 292E4 800286E4 8E03F760 */  lw         $v1, %lo(combatPointer)($s0)
/* 292E8 800286E8 AFB20018 */  sw         $s2, 0x18($sp)
/* 292EC 800286EC 30B2FFFF */  andi       $s2, $a1, 0xffff
/* 292F0 800286F0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 292F4 800286F4 00809821 */  addu       $s3, $a0, $zero
/* 292F8 800286F8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 292FC 800286FC AFB10014 */  sw         $s1, 0x14($sp)
/* 29300 80028700 8C6252CC */  lw         $v0, 0x52cc($v1)
/* 29304 80028704 8C71002C */  lw         $s1, 0x2c($v1)
/* 29308 80028708 00521021 */  addu       $v0, $v0, $s2
/* 2930C 8002870C 0C00A135 */  jal        func_800284D4
/* 29310 80028710 AC6252CC */   sw        $v0, 0x52cc($v1)
/* 29314 80028714 8E04F760 */  lw         $a0, -0x8a0($s0)
/* 29318 80028718 90824F08 */  lbu        $v0, 0x4f08($a0)
/* 2931C 8002871C 90834FB0 */  lbu        $v1, 0x4fb0($a0)
/* 29320 80028720 00431021 */  addu       $v0, $v0, $v1
/* 29324 80028724 304200FF */  andi       $v0, $v0, 0xff
/* 29328 80028728 14400007 */  bnez       $v0, .L80028748
/* 2932C 8002872C 00122C00 */   sll       $a1, $s2, 0x10
/* 29330 80028730 8C824FB8 */  lw         $v0, 0x4fb8($a0)
/* 29334 80028734 54400005 */  bnel       $v0, $zero, .L8002874C
/* 29338 80028738 8E640000 */   lw        $a0, ($s3)
/* 2933C 8002873C 0C01A92D */  jal        func_8006A4B4
/* 29340 80028740 02202021 */   addu      $a0, $s1, $zero
/* 29344 80028744 00122C00 */  sll        $a1, $s2, 0x10
.L80028748:
/* 29348 80028748 8E640000 */  lw         $a0, ($s3)
.L8002874C:
/* 2934C 8002874C 0C009F43 */  jal        func_80027D0C
/* 29350 80028750 00052C03 */   sra       $a1, $a1, 0x10
/* 29354 80028754 8FBF0020 */  lw         $ra, 0x20($sp)
/* 29358 80028758 AE620000 */  sw         $v0, ($s3)
/* 2935C 8002875C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 29360 80028760 8FB20018 */  lw         $s2, 0x18($sp)
/* 29364 80028764 8FB10014 */  lw         $s1, 0x14($sp)
/* 29368 80028768 8FB00010 */  lw         $s0, 0x10($sp)
/* 2936C 8002876C 24020002 */  addiu      $v0, $zero, 2
/* 29370 80028770 03E00008 */  jr         $ra
/* 29374 80028774 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80028778
/* 29378 80028778 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 2937C 8002877C AFB7002C */  sw         $s7, 0x2c($sp)
/* 29380 80028780 30B7FFFF */  andi       $s7, $a1, 0xffff
/* 29384 80028784 AFB20018 */  sw         $s2, 0x18($sp)
/* 29388 80028788 3C12800F */  lui        $s2, %hi(combatPointer)
/* 2938C 8002878C AFB3001C */  sw         $s3, 0x1c($sp)
/* 29390 80028790 3C13800F */  lui        $s3, %hi(combatVec3B)
/* 29394 80028794 AFB10014 */  sw         $s1, 0x14($sp)
/* 29398 80028798 267153E0 */  addiu      $s1, $s3, %lo(combatVec3B)
/* 2939C 8002879C 8E42F760 */  lw         $v0, %lo(combatPointer)($s2)
/* 293A0 800287A0 02202821 */  addu       $a1, $s1, $zero
/* 293A4 800287A4 AFBF0034 */  sw         $ra, 0x34($sp)
/* 293A8 800287A8 AFBE0030 */  sw         $fp, 0x30($sp)
/* 293AC 800287AC AFB60028 */  sw         $s6, 0x28($sp)
/* 293B0 800287B0 AFB50024 */  sw         $s5, 0x24($sp)
/* 293B4 800287B4 AFB40020 */  sw         $s4, 0x20($sp)
/* 293B8 800287B8 AFB00010 */  sw         $s0, 0x10($sp)
/* 293BC 800287BC 8C55002C */  lw         $s5, 0x2c($v0)
/* 293C0 800287C0 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 293C4 800287C4 92A20020 */  lbu        $v0, 0x20($s5)
/* 293C8 800287C8 24767C70 */  addiu      $s6, $v1, %lo(combat_bytes)
/* 293CC 800287CC 00021080 */  sll        $v0, $v0, 2
/* 293D0 800287D0 02C21021 */  addu       $v0, $s6, $v0
/* 293D4 800287D4 8C540034 */  lw         $s4, 0x34($v0)
/* 293D8 800287D8 0080F021 */  addu       $fp, $a0, $zero
/* 293DC 800287DC 0C02AD17 */  jal        copyVec3
/* 293E0 800287E0 26840068 */   addiu     $a0, $s4, 0x68
/* 293E4 800287E4 02202021 */  addu       $a0, $s1, $zero
/* 293E8 800287E8 3C10800F */  lui        $s0, %hi(combatVec3A)
/* 293EC 800287EC 0C02AB66 */  jal        get_vec3_proximity
/* 293F0 800287F0 260553D0 */   addiu     $a1, $s0, %lo(combatVec3A)
/* 293F4 800287F4 3C01800E */  lui        $at, %hi(D_800DA29C)
/* 293F8 800287F8 C422A29C */  lwc1       $f2, %lo(D_800DA29C)($at)
/* 293FC 800287FC 46020002 */  mul.s      $f0, $f0, $f2
/* 29400 80028800 3C01800E */  lui        $at, %hi(D_800DA2A0)
/* 29404 80028804 C422A2A0 */  lwc1       $f2, %lo(D_800DA2A0)($at)
/* 29408 80028808 4600103E */  c.le.s     $f2, $f0
/* 2940C 8002880C 00000000 */  nop
/* 29410 80028810 45030005 */  bc1tl      .L80028828
/* 29414 80028814 46020001 */   sub.s     $f0, $f0, $f2
/* 29418 80028818 4600008D */  trunc.w.s  $f2, $f0
/* 2941C 8002881C 44031000 */  mfc1       $v1, $f2
/* 29420 80028820 0800A20F */  j          .L8002883C
/* 29424 80028824 306200FF */   andi      $v0, $v1, 0xff
.L80028828:
/* 29428 80028828 4600008D */  trunc.w.s  $f2, $f0
/* 2942C 8002882C 44031000 */  mfc1       $v1, $f2
/* 29430 80028830 3C028000 */  lui        $v0, 0x8000
/* 29434 80028834 00621825 */  or         $v1, $v1, $v0
/* 29438 80028838 306200FF */  andi       $v0, $v1, 0xff
.L8002883C:
/* 2943C 8002883C 2C420003 */  sltiu      $v0, $v0, 3
/* 29440 80028840 14400009 */  bnez       $v0, .L80028868
/* 29444 80028844 8E43F760 */   lw        $v1, -0x8a0($s2)
/* 29448 80028848 8E820004 */  lw         $v0, 4($s4)
/* 2944C 8002884C 3C01800E */  lui        $at, %hi(D_800DA2A4)
/* 29450 80028850 C420A2A4 */  lwc1       $f0, %lo(D_800DA2A4)($at)
/* 29454 80028854 C4420034 */  lwc1       $f2, 0x34($v0)
/* 29458 80028858 4600103C */  c.lt.s     $f2, $f0
/* 2945C 8002885C 00000000 */  nop
/* 29460 80028860 45020005 */  bc1fl      .L80028878
/* 29464 80028864 9682001E */   lhu       $v0, 0x1e($s4)
.L80028868:
/* 29468 80028868 8C624FBC */  lw         $v0, 0x4fbc($v1)
/* 2946C 8002886C 00571023 */  subu       $v0, $v0, $s7
/* 29470 80028870 AC624FBC */  sw         $v0, 0x4fbc($v1)
/* 29474 80028874 9682001E */  lhu        $v0, 0x1e($s4)
.L80028878:
/* 29478 80028878 30420010 */  andi       $v0, $v0, 0x10
/* 2947C 8002887C 1440000F */  bnez       $v0, .L800288BC
/* 29480 80028880 8E42F760 */   lw        $v0, -0x8a0($s2)
/* 29484 80028884 92C30001 */  lbu        $v1, 1($s6)
/* 29488 80028888 24020008 */  addiu      $v0, $zero, 8
/* 2948C 8002888C 14620007 */  bne        $v1, $v0, .L800288AC
/* 29490 80028890 A2C30000 */   sb        $v1, ($s6)
/* 29494 80028894 02A02021 */  addu       $a0, $s5, $zero
/* 29498 80028898 0C01A38E */  jal        func_80068E38
/* 2949C 8002889C A2C30001 */   sb        $v1, 1($s6)
/* 294A0 800288A0 24020006 */  addiu      $v0, $zero, 6
/* 294A4 800288A4 0800A23B */  j          .L800288EC
/* 294A8 800288A8 A2C20000 */   sb        $v0, ($s6)
.L800288AC:
/* 294AC 800288AC 0C01A92D */  jal        func_8006A4B4
/* 294B0 800288B0 02A02021 */   addu      $a0, $s5, $zero
/* 294B4 800288B4 0800A23C */  j          .L800288F0
/* 294B8 800288B8 266453E0 */   addiu     $a0, $s3, 0x53e0
.L800288BC:
/* 294BC 800288BC 8C434FBC */  lw         $v1, 0x4fbc($v0)
/* 294C0 800288C0 1C60000B */  bgtz       $v1, .L800288F0
/* 294C4 800288C4 266453E0 */   addiu     $a0, $s3, 0x53e0
/* 294C8 800288C8 8EA40044 */  lw         $a0, 0x44($s5)
/* 294CC 800288CC 10800005 */  beqz       $a0, .L800288E4
/* 294D0 800288D0 00000000 */   nop
/* 294D4 800288D4 0C01916D */  jal        func_800645B4
/* 294D8 800288D8 00000000 */   nop
/* 294DC 800288DC 0800A23C */  j          .L800288F0
/* 294E0 800288E0 266453E0 */   addiu     $a0, $s3, 0x53e0
.L800288E4:
/* 294E4 800288E4 0C01A92D */  jal        func_8006A4B4
/* 294E8 800288E8 02A02021 */   addu      $a0, $s5, $zero
.L800288EC:
/* 294EC 800288EC 266453E0 */  addiu      $a0, $s3, 0x53e0
.L800288F0:
/* 294F0 800288F0 0C02AD17 */  jal        copyVec3
/* 294F4 800288F4 260553D0 */   addiu     $a1, $s0, 0x53d0
/* 294F8 800288F8 00172C00 */  sll        $a1, $s7, 0x10
/* 294FC 800288FC 8FC40000 */  lw         $a0, ($fp)
/* 29500 80028900 0C009F43 */  jal        func_80027D0C
/* 29504 80028904 00052C03 */   sra       $a1, $a1, 0x10
/* 29508 80028908 8FBF0034 */  lw         $ra, 0x34($sp)
/* 2950C 8002890C AFC20000 */  sw         $v0, ($fp)
/* 29510 80028910 8FBE0030 */  lw         $fp, 0x30($sp)
/* 29514 80028914 8FB7002C */  lw         $s7, 0x2c($sp)
/* 29518 80028918 8FB60028 */  lw         $s6, 0x28($sp)
/* 2951C 8002891C 8FB50024 */  lw         $s5, 0x24($sp)
/* 29520 80028920 8FB40020 */  lw         $s4, 0x20($sp)
/* 29524 80028924 8FB3001C */  lw         $s3, 0x1c($sp)
/* 29528 80028928 8FB20018 */  lw         $s2, 0x18($sp)
/* 2952C 8002892C 8FB10014 */  lw         $s1, 0x14($sp)
/* 29530 80028930 8FB00010 */  lw         $s0, 0x10($sp)
/* 29534 80028934 24020002 */  addiu      $v0, $zero, 2
/* 29538 80028938 03E00008 */  jr         $ra
/* 2953C 8002893C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_80028940
/* 29540 80028940 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 29544 80028944 AFB70034 */  sw         $s7, 0x34($sp)
/* 29548 80028948 0080B821 */  addu       $s7, $a0, $zero
/* 2954C 8002894C AFB5002C */  sw         $s5, 0x2c($sp)
/* 29550 80028950 3C15800F */  lui        $s5, %hi(combatPointer)
/* 29554 80028954 8EA4F760 */  lw         $a0, %lo(combatPointer)($s5)
/* 29558 80028958 AFB60030 */  sw         $s6, 0x30($sp)
/* 2955C 8002895C 30B6FFFF */  andi       $s6, $a1, 0xffff
/* 29560 80028960 AFB40028 */  sw         $s4, 0x28($sp)
/* 29564 80028964 3C14800E */  lui        $s4, 0x800e
/* 29568 80028968 AFBF0038 */  sw         $ra, 0x38($sp)
/* 2956C 8002896C AFB30024 */  sw         $s3, 0x24($sp)
/* 29570 80028970 AFB20020 */  sw         $s2, 0x20($sp)
/* 29574 80028974 AFB1001C */  sw         $s1, 0x1c($sp)
/* 29578 80028978 AFB00018 */  sw         $s0, 0x18($sp)
/* 2957C 8002897C 8C90002C */  lw         $s0, 0x2c($a0)
/* 29580 80028980 26937C70 */  addiu      $s3, $s4, 0x7c70
/* 29584 80028984 1200004E */  beqz       $s0, .L80028AC0
/* 29588 80028988 24020002 */   addiu     $v0, $zero, 2
/* 2958C 8002898C 90820014 */  lbu        $v0, 0x14($a0)
/* 29590 80028990 92030020 */  lbu        $v1, 0x20($s0)
/* 29594 80028994 00028880 */  sll        $s1, $v0, 2
/* 29598 80028998 00911021 */  addu       $v0, $a0, $s1
/* 2959C 8002899C 00031880 */  sll        $v1, $v1, 2
/* 295A0 800289A0 02631821 */  addu       $v1, $s3, $v1
/* 295A4 800289A4 8C630034 */  lw         $v1, 0x34($v1)
/* 295A8 800289A8 14600005 */  bnez       $v1, .L800289C0
/* 295AC 800289AC 8C5252D0 */   lw        $s2, 0x52d0($v0)
/* 295B0 800289B0 0C01A92D */  jal        func_8006A4B4
/* 295B4 800289B4 02002021 */   addu      $a0, $s0, $zero
/* 295B8 800289B8 0800A2B0 */  j          .L80028AC0
/* 295BC 800289BC 24020002 */   addiu     $v0, $zero, 2
.L800289C0:
/* 295C0 800289C0 9462001E */  lhu        $v0, 0x1e($v1)
/* 295C4 800289C4 30420020 */  andi       $v0, $v0, 0x20
/* 295C8 800289C8 14400038 */  bnez       $v0, .L80028AAC
/* 295CC 800289CC 00162C00 */   sll       $a1, $s6, 0x10
/* 295D0 800289D0 0C01A401 */  jal        func_80069004
/* 295D4 800289D4 02002021 */   addu      $a0, $s0, $zero
/* 295D8 800289D8 92620001 */  lbu        $v0, 1($s3)
/* 295DC 800289DC 24030008 */  addiu      $v1, $zero, 8
/* 295E0 800289E0 14430005 */  bne        $v0, $v1, .L800289F8
/* 295E4 800289E4 A2827C70 */   sb        $v0, 0x7c70($s4)
/* 295E8 800289E8 0C01916D */  jal        func_800645B4
/* 295EC 800289EC 8E040044 */   lw        $a0, 0x44($s0)
/* 295F0 800289F0 0800A2AB */  j          .L80028AAC
/* 295F4 800289F4 00162C00 */   sll       $a1, $s6, 0x10
.L800289F8:
/* 295F8 800289F8 8EA4F760 */  lw         $a0, -0x8a0($s5)
/* 295FC 800289FC 00911021 */  addu       $v0, $a0, $s1
/* 29600 80028A00 8C434EAC */  lw         $v1, 0x4eac($v0)
/* 29604 80028A04 1060000A */  beqz       $v1, .L80028A30
/* 29608 80028A08 3C02800E */   lui       $v0, %hi(D_800DA280)
/* 2960C 80028A0C 2442A280 */  addiu      $v0, $v0, %lo(D_800DA280)
/* 29610 80028A10 AFA20010 */  sw         $v0, 0x10($sp)
/* 29614 80028A14 02002021 */  addu       $a0, $s0, $zero
/* 29618 80028A18 02402821 */  addu       $a1, $s2, $zero
/* 2961C 80028A1C 24060001 */  addiu      $a2, $zero, 1
/* 29620 80028A20 0C01BC4E */  jal        some_attack_calc
/* 29624 80028A24 240703FA */   addiu     $a3, $zero, 0x3fa
/* 29628 80028A28 0800A2AB */  j          .L80028AAC
/* 2962C 80028A2C 00162C00 */   sll       $a1, $s6, 0x10
.L80028A30:
/* 29630 80028A30 8E020040 */  lw         $v0, 0x40($s0)
/* 29634 80028A34 8043003C */  lb         $v1, 0x3c($v0)
/* 29638 80028A38 0460000A */  bltz       $v1, .L80028A64
/* 2963C 80028A3C 3C02800E */   lui       $v0, %hi(D_800DA280)
/* 29640 80028A40 2442A280 */  addiu      $v0, $v0, %lo(D_800DA280)
/* 29644 80028A44 AFA20010 */  sw         $v0, 0x10($sp)
/* 29648 80028A48 02002021 */  addu       $a0, $s0, $zero
/* 2964C 80028A4C 02402821 */  addu       $a1, $s2, $zero
/* 29650 80028A50 00003021 */  addu       $a2, $zero, $zero
/* 29654 80028A54 0C01BC4E */  jal        some_attack_calc
/* 29658 80028A58 240703FF */   addiu     $a3, $zero, 0x3ff
/* 2965C 80028A5C 0800A2AB */  j          .L80028AAC
/* 29660 80028A60 00162C00 */   sll       $a1, $s6, 0x10
.L80028A64:
/* 29664 80028A64 8E020044 */  lw         $v0, 0x44($s0)
/* 29668 80028A68 1040000D */  beqz       $v0, .L80028AA0
/* 2966C 80028A6C 00911021 */   addu      $v0, $a0, $s1
/* 29670 80028A70 8C434F54 */  lw         $v1, 0x4f54($v0)
/* 29674 80028A74 1060000A */  beqz       $v1, .L80028AA0
/* 29678 80028A78 3C02800E */   lui       $v0, %hi(D_800DA280)
/* 2967C 80028A7C 2442A280 */  addiu      $v0, $v0, %lo(D_800DA280)
/* 29680 80028A80 AFA20010 */  sw         $v0, 0x10($sp)
/* 29684 80028A84 02002021 */  addu       $a0, $s0, $zero
/* 29688 80028A88 02402821 */  addu       $a1, $s2, $zero
/* 2968C 80028A8C 00003021 */  addu       $a2, $zero, $zero
/* 29690 80028A90 0C01BC4E */  jal        some_attack_calc
/* 29694 80028A94 24070403 */   addiu     $a3, $zero, 0x403
/* 29698 80028A98 0800A2AB */  j          .L80028AAC
/* 2969C 80028A9C 00162C00 */   sll       $a1, $s6, 0x10
.L80028AA0:
/* 296A0 80028AA0 0C01A92D */  jal        func_8006A4B4
/* 296A4 80028AA4 02002021 */   addu      $a0, $s0, $zero
/* 296A8 80028AA8 00162C00 */  sll        $a1, $s6, 0x10
.L80028AAC:
/* 296AC 80028AAC 8EE40000 */  lw         $a0, ($s7)
/* 296B0 80028AB0 0C009F43 */  jal        func_80027D0C
/* 296B4 80028AB4 00052C03 */   sra       $a1, $a1, 0x10
/* 296B8 80028AB8 AEE20000 */  sw         $v0, ($s7)
/* 296BC 80028ABC 24020002 */  addiu      $v0, $zero, 2
.L80028AC0:
/* 296C0 80028AC0 8FBF0038 */  lw         $ra, 0x38($sp)
/* 296C4 80028AC4 8FB70034 */  lw         $s7, 0x34($sp)
/* 296C8 80028AC8 8FB60030 */  lw         $s6, 0x30($sp)
/* 296CC 80028ACC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 296D0 80028AD0 8FB40028 */  lw         $s4, 0x28($sp)
/* 296D4 80028AD4 8FB30024 */  lw         $s3, 0x24($sp)
/* 296D8 80028AD8 8FB20020 */  lw         $s2, 0x20($sp)
/* 296DC 80028ADC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 296E0 80028AE0 8FB00018 */  lw         $s0, 0x18($sp)
/* 296E4 80028AE4 03E00008 */  jr         $ra
/* 296E8 80028AE8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80028AEC
/* 296EC 80028AEC 3C02800F */  lui        $v0, %hi(combatPointer)
/* 296F0 80028AF0 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 296F4 80028AF4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 296F8 80028AF8 AFBF0020 */  sw         $ra, 0x20($sp)
/* 296FC 80028AFC AFB3001C */  sw         $s3, 0x1c($sp)
/* 29700 80028B00 AFB20018 */  sw         $s2, 0x18($sp)
/* 29704 80028B04 AFB10014 */  sw         $s1, 0x14($sp)
/* 29708 80028B08 AFB00010 */  sw         $s0, 0x10($sp)
/* 2970C 80028B0C 8C70002C */  lw         $s0, 0x2c($v1)
/* 29710 80028B10 3C13800E */  lui        $s3, %hi(combat_bytes)
/* 29714 80028B14 92020020 */  lbu        $v0, 0x20($s0)
/* 29718 80028B18 26637C70 */  addiu      $v1, $s3, %lo(combat_bytes)
/* 2971C 80028B1C 00021080 */  sll        $v0, $v0, 2
/* 29720 80028B20 00621821 */  addu       $v1, $v1, $v0
/* 29724 80028B24 8C660034 */  lw         $a2, 0x34($v1)
/* 29728 80028B28 00809021 */  addu       $s2, $a0, $zero
/* 2972C 80028B2C 94C2001E */  lhu        $v0, 0x1e($a2)
/* 29730 80028B30 30420020 */  andi       $v0, $v0, 0x20
/* 29734 80028B34 14400007 */  bnez       $v0, .L80028B54
/* 29738 80028B38 30B1FFFF */   andi      $s1, $a1, 0xffff
/* 2973C 80028B3C 0C01A401 */  jal        func_80069004
/* 29740 80028B40 02002021 */   addu      $a0, $s0, $zero
/* 29744 80028B44 0C01A376 */  jal        func_80068DD8
/* 29748 80028B48 02002021 */   addu      $a0, $s0, $zero
/* 2974C 80028B4C 24020005 */  addiu      $v0, $zero, 5
/* 29750 80028B50 A2627C70 */  sb         $v0, 0x7c70($s3)
.L80028B54:
/* 29754 80028B54 00112C00 */  sll        $a1, $s1, 0x10
/* 29758 80028B58 8E440000 */  lw         $a0, ($s2)
/* 2975C 80028B5C 0C009F43 */  jal        func_80027D0C
/* 29760 80028B60 00052C03 */   sra       $a1, $a1, 0x10
/* 29764 80028B64 8FBF0020 */  lw         $ra, 0x20($sp)
/* 29768 80028B68 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2976C 80028B6C AE420000 */  sw         $v0, ($s2)
/* 29770 80028B70 8FB20018 */  lw         $s2, 0x18($sp)
/* 29774 80028B74 8FB10014 */  lw         $s1, 0x14($sp)
/* 29778 80028B78 8FB00010 */  lw         $s0, 0x10($sp)
/* 2977C 80028B7C 24020002 */  addiu      $v0, $zero, 2
/* 29780 80028B80 03E00008 */  jr         $ra
/* 29784 80028B84 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80028B88
/* 29788 80028B88 3C02800F */  lui        $v0, %hi(combatPointer)
/* 2978C 80028B8C 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 29790 80028B90 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29794 80028B94 AFBF0018 */  sw         $ra, 0x18($sp)
/* 29798 80028B98 AFB10014 */  sw         $s1, 0x14($sp)
/* 2979C 80028B9C AFB00010 */  sw         $s0, 0x10($sp)
/* 297A0 80028BA0 8C66002C */  lw         $a2, 0x2c($v1)
/* 297A4 80028BA4 00808821 */  addu       $s1, $a0, $zero
/* 297A8 80028BA8 8CC40044 */  lw         $a0, 0x44($a2)
/* 297AC 80028BAC 0C019125 */  jal        func_80064494
/* 297B0 80028BB0 30B0FFFF */   andi      $s0, $a1, 0xffff
/* 297B4 80028BB4 00108400 */  sll        $s0, $s0, 0x10
/* 297B8 80028BB8 8E240000 */  lw         $a0, ($s1)
/* 297BC 80028BBC 0C009F43 */  jal        func_80027D0C
/* 297C0 80028BC0 00102C03 */   sra       $a1, $s0, 0x10
/* 297C4 80028BC4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 297C8 80028BC8 AE220000 */  sw         $v0, ($s1)
/* 297CC 80028BCC 8FB10014 */  lw         $s1, 0x14($sp)
/* 297D0 80028BD0 8FB00010 */  lw         $s0, 0x10($sp)
/* 297D4 80028BD4 24020002 */  addiu      $v0, $zero, 2
/* 297D8 80028BD8 03E00008 */  jr         $ra
/* 297DC 80028BDC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combat_byte_func_12
/* 297E0 80028BE0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 297E4 80028BE4 AFB00020 */  sw         $s0, 0x20($sp)
/* 297E8 80028BE8 00808021 */  addu       $s0, $a0, $zero
/* 297EC 80028BEC 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 297F0 80028BF0 AFB20028 */  sw         $s2, 0x28($sp)
/* 297F4 80028BF4 24527C70 */  addiu      $s2, $v0, %lo(combat_bytes)
/* 297F8 80028BF8 AFBF002C */  sw         $ra, 0x2c($sp)
/* 297FC 80028BFC AFB10024 */  sw         $s1, 0x24($sp)
/* 29800 80028C00 96430C80 */  lhu        $v1, 0xc80($s2)
/* 29804 80028C04 1060000B */  beqz       $v1, .L80028C34
/* 29808 80028C08 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 2980C 80028C0C 00052C00 */  sll        $a1, $a1, 0x10
/* 29810 80028C10 00052C03 */  sra        $a1, $a1, 0x10
/* 29814 80028C14 3C03800F */  lui        $v1, %hi(combat_flag_42)
/* 29818 80028C18 8E040000 */  lw         $a0, ($s0)
/* 2981C 80028C1C 24020001 */  addiu      $v0, $zero, 1
/* 29820 80028C20 0C009F43 */  jal        func_80027D0C
/* 29824 80028C24 AC629B8C */   sw        $v0, %lo(combat_flag_42)($v1)
/* 29828 80028C28 AE020000 */  sw         $v0, ($s0)
/* 2982C 80028C2C 0800A342 */  j          .L80028D08
/* 29830 80028C30 24020002 */   addiu     $v0, $zero, 2
.L80028C34:
/* 29834 80028C34 3C04800F */  lui        $a0, %hi(clear_combatstruct_flag)
/* 29838 80028C38 26500004 */  addiu      $s0, $s2, 4
/* 2983C 80028C3C 9203001C */  lbu        $v1, 0x1c($s0)
/* 29840 80028C40 24020001 */  addiu      $v0, $zero, 1
/* 29844 80028C44 10600018 */  beqz       $v1, .L80028CA8
/* 29848 80028C48 AC829B68 */   sw        $v0, %lo(clear_combatstruct_flag)($a0)
/* 2984C 80028C4C 9604001A */  lhu        $a0, 0x1a($s0)
/* 29850 80028C50 0C00918D */  jal        setEventFlag
/* 29854 80028C54 24050001 */   addiu     $a1, $zero, 1
/* 29858 80028C58 9604002A */  lhu        $a0, 0x2a($s0)
/* 2985C 80028C5C 0C00544A */  jal        func_80015128
/* 29860 80028C60 9605002C */   lhu       $a1, 0x2c($s0)
/* 29864 80028C64 10400011 */  beqz       $v0, .L80028CAC
/* 29868 80028C68 3C11800F */   lui       $s1, 0x800f
/* 2986C 80028C6C 0C009168 */  jal        get_event_flag
/* 29870 80028C70 9604001A */   lhu       $a0, 0x1a($s0)
/* 29874 80028C74 1440000D */  bnez       $v0, .L80028CAC
/* 29878 80028C78 3C11800F */   lui       $s1, 0x800f
/* 2987C 80028C7C 24020011 */  addiu      $v0, $zero, 0x11
/* 29880 80028C80 24030005 */  addiu      $v1, $zero, 5
/* 29884 80028C84 AFA20010 */  sw         $v0, 0x10($sp)
/* 29888 80028C88 24020003 */  addiu      $v0, $zero, 3
/* 2988C 80028C8C AFA30014 */  sw         $v1, 0x14($sp)
/* 29890 80028C90 AFA20018 */  sw         $v0, 0x18($sp)
/* 29894 80028C94 9604001E */  lhu        $a0, 0x1e($s0)
/* 29898 80028C98 92050021 */  lbu        $a1, 0x21($s0)
/* 2989C 80028C9C 92060023 */  lbu        $a2, 0x23($s0)
/* 298A0 80028CA0 0C017E54 */  jal        WriteTo_VoxelChart
/* 298A4 80028CA4 92070025 */   lbu       $a3, 0x25($s0)
.L80028CA8:
/* 298A8 80028CA8 3C11800F */  lui        $s1, %hi(combatPointer)
.L80028CAC:
/* 298AC 80028CAC 0C01C294 */  jal        set_boss_flag
/* 298B0 80028CB0 8E24F760 */   lw        $a0, %lo(combatPointer)($s1)
/* 298B4 80028CB4 3C10800E */  lui        $s0, %hi(gGlobals)
/* 298B8 80028CB8 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 298BC 80028CBC 24020002 */  addiu      $v0, $zero, 2
/* 298C0 80028CC0 2403000F */  addiu      $v1, $zero, 0xf
/* 298C4 80028CC4 A6022048 */  sh         $v0, 0x2048($s0)
/* 298C8 80028CC8 3C02800F */  lui        $v0, %hi(D_800E9B6C)
/* 298CC 80028CCC A2430001 */  sb         $v1, 1($s2)
/* 298D0 80028CD0 0C01427B */  jal        passto_getSnapshot
/* 298D4 80028CD4 A4409B6C */   sh        $zero, %lo(D_800E9B6C)($v0)
/* 298D8 80028CD8 8E22F760 */  lw         $v0, -0x8a0($s1)
/* 298DC 80028CDC 8C444FB4 */  lw         $a0, 0x4fb4($v0)
/* 298E0 80028CE0 8C450020 */  lw         $a1, 0x20($v0)
/* 298E4 80028CE4 0C014292 */  jal        build_loot_menu
/* 298E8 80028CE8 3406FFFF */   ori       $a2, $zero, 0xffff
/* 298EC 80028CEC 8E24F760 */  lw         $a0, -0x8a0($s1)
/* 298F0 80028CF0 24020010 */  addiu      $v0, $zero, 0x10
/* 298F4 80028CF4 AC804FB4 */  sw         $zero, 0x4fb4($a0)
/* 298F8 80028CF8 A2420001 */  sb         $v0, 1($s2)
/* 298FC 80028CFC 8C830024 */  lw         $v1, 0x24($a0)
/* 29900 80028D00 24020006 */  addiu      $v0, $zero, 6
/* 29904 80028D04 AE031444 */  sw         $v1, 0x1444($s0)
.L80028D08:
/* 29908 80028D08 8FBF002C */  lw         $ra, 0x2c($sp)
/* 2990C 80028D0C 8FB20028 */  lw         $s2, 0x28($sp)
/* 29910 80028D10 8FB10024 */  lw         $s1, 0x24($sp)
/* 29914 80028D14 8FB00020 */  lw         $s0, 0x20($sp)
/* 29918 80028D18 03E00008 */  jr         $ra
/* 2991C 80028D1C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel Goblin_ambush_check
/* 29920 80028D20 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 29924 80028D24 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 29928 80028D28 24467C70 */  addiu      $a2, $v0, %lo(combat_bytes)
/* 2992C 80028D2C 24C3EC38 */  addiu      $v1, $a2, -0x13c8
/* 29930 80028D30 AFBF0064 */  sw         $ra, 0x64($sp)
/* 29934 80028D34 AFB00060 */  sw         $s0, 0x60($sp)
/* 29938 80028D38 94622048 */  lhu        $v0, 0x2048($v1)
/* 2993C 80028D3C 10400005 */  beqz       $v0, .L80028D54
/* 29940 80028D40 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29944 80028D44 0C00A3FC */  jal        func_80028FF0
/* 29948 80028D48 00000000 */   nop
/* 2994C 80028D4C 0800A37F */  j          .L80028DFC
/* 29950 80028D50 8FBF0064 */   lw        $ra, 0x64($sp)
.L80028D54:
/* 29954 80028D54 90622050 */  lbu        $v0, 0x2050($v1)
/* 29958 80028D58 10400024 */  beqz       $v0, .L80028DEC
/* 2995C 80028D5C 24D00004 */   addiu     $s0, $a2, 4
/* 29960 80028D60 9604001A */  lhu        $a0, 0x1a($s0)
/* 29964 80028D64 0C00918D */  jal        setEventFlag
/* 29968 80028D68 24050001 */   addiu     $a1, $zero, 1
/* 2996C 80028D6C 9202001C */  lbu        $v0, 0x1c($s0)
/* 29970 80028D70 1040000B */  beqz       $v0, .L80028DA0
/* 29974 80028D74 24020011 */   addiu     $v0, $zero, 0x11
/* 29978 80028D78 24030005 */  addiu      $v1, $zero, 5
/* 2997C 80028D7C AFA20010 */  sw         $v0, 0x10($sp)
/* 29980 80028D80 24020003 */  addiu      $v0, $zero, 3
/* 29984 80028D84 AFA30014 */  sw         $v1, 0x14($sp)
/* 29988 80028D88 AFA20018 */  sw         $v0, 0x18($sp)
/* 2998C 80028D8C 9604001E */  lhu        $a0, 0x1e($s0)
/* 29990 80028D90 92050021 */  lbu        $a1, 0x21($s0)
/* 29994 80028D94 92060023 */  lbu        $a2, 0x23($s0)
/* 29998 80028D98 0C017E54 */  jal        WriteTo_VoxelChart
/* 2999C 80028D9C 92070025 */   lbu       $a3, 0x25($s0)
.L80028DA0:
/* 299A0 80028DA0 3C10800F */  lui        $s0, %hi(TerrainPointer)
/* 299A4 80028DA4 8E041BBC */  lw         $a0, %lo(TerrainPointer)($s0)
/* 299A8 80028DA8 0C0213E5 */  jal        get_ingame_calendar
/* 299AC 80028DAC 27A50020 */   addiu     $a1, $sp, 0x20
/* 299B0 80028DB0 27A50020 */  addiu      $a1, $sp, 0x20
/* 299B4 80028DB4 8E041BBC */  lw         $a0, 0x1bbc($s0)
/* 299B8 80028DB8 93A30022 */  lbu        $v1, 0x22($sp)
/* 299BC 80028DBC 24020006 */  addiu      $v0, $zero, 6
/* 299C0 80028DC0 A3A20023 */  sb         $v0, 0x23($sp)
/* 299C4 80028DC4 A3A00024 */  sb         $zero, 0x24($sp)
/* 299C8 80028DC8 A3A00025 */  sb         $zero, 0x25($sp)
/* 299CC 80028DCC 24630001 */  addiu      $v1, $v1, 1
/* 299D0 80028DD0 0C02139E */  jal        set_time_from_calendar
/* 299D4 80028DD4 A3A30022 */   sb        $v1, 0x22($sp)
/* 299D8 80028DD8 24020001 */  addiu      $v0, $zero, 1
/* 299DC 80028DDC 3C04800F */  lui        $a0, %hi(clear_combatstruct_flag)
/* 299E0 80028DE0 24030001 */  addiu      $v1, $zero, 1
/* 299E4 80028DE4 0800A37E */  j          .L80028DF8
/* 299E8 80028DE8 AC839B68 */   sw        $v1, %lo(clear_combatstruct_flag)($a0)
.L80028DEC:
/* 299EC 80028DEC 0C009018 */  jal        Gameover_func
/* 299F0 80028DF0 00000000 */   nop
/* 299F4 80028DF4 24020002 */  addiu      $v0, $zero, 2
.L80028DF8:
/* 299F8 80028DF8 8FBF0064 */  lw         $ra, 0x64($sp)
.L80028DFC:
/* 299FC 80028DFC 8FB00060 */  lw         $s0, 0x60($sp)
/* 29A00 80028E00 03E00008 */  jr         $ra
/* 29A04 80028E04 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_80028E08
/* 29A08 80028E08 3C03800F */  lui        $v1, %hi(D_800E9B6C)
/* 29A0C 80028E0C 94629B6C */  lhu        $v0, %lo(D_800E9B6C)($v1)
/* 29A10 80028E10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29A14 80028E14 AFBF0014 */  sw         $ra, 0x14($sp)
/* 29A18 80028E18 2C420002 */  sltiu      $v0, $v0, 2
/* 29A1C 80028E1C 14400011 */  bnez       $v0, .L80028E64
/* 29A20 80028E20 AFB00010 */   sw        $s0, 0x10($sp)
/* 29A24 80028E24 0C00381F */  jal        FreeZoneEngineMemory
/* 29A28 80028E28 3C10800E */   lui       $s0, %hi(gGlobals)
/* 29A2C 80028E2C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 29A30 80028E30 24020001 */  addiu      $v0, $zero, 1
/* 29A34 80028E34 0C0095D1 */  jal        GetSnapshot_
/* 29A38 80028E38 A20213C9 */   sb        $v0, 0x13c9($s0)
/* 29A3C 80028E3C 3C03800F */  lui        $v1, %hi(combatPointer)
/* 29A40 80028E40 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 29A44 80028E44 9605144C */  lhu        $a1, 0x144c($s0)
/* 29A48 80028E48 8C46002C */  lw         $a2, 0x2c($v0)
/* 29A4C 80028E4C 3C03800F */  lui        $v1, %hi(partypicker)
/* 29A50 80028E50 A60514D2 */  sh         $a1, 0x14d2($s0)
/* 29A54 80028E54 90C40020 */  lbu        $a0, 0x20($a2)
/* 29A58 80028E58 24020003 */  addiu      $v0, $zero, 3
/* 29A5C 80028E5C 0800A39A */  j          .L80028E68
/* 29A60 80028E60 A064D550 */   sb        $a0, %lo(partypicker)($v1)
.L80028E64:
/* 29A64 80028E64 24020002 */  addiu      $v0, $zero, 2
.L80028E68:
/* 29A68 80028E68 8FBF0014 */  lw         $ra, 0x14($sp)
/* 29A6C 80028E6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 29A70 80028E70 03E00008 */  jr         $ra
/* 29A74 80028E74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_byte_func_16
/* 29A78 80028E78 3C03800F */  lui        $v1, %hi(clear_combatstruct_flag)
/* 29A7C 80028E7C 24020001 */  addiu      $v0, $zero, 1
/* 29A80 80028E80 03E00008 */  jr         $ra
/* 29A84 80028E84 AC629B68 */   sw        $v0, %lo(clear_combatstruct_flag)($v1)

glabel pass_to_alaron_boost
/* 29A88 80028E88 3C02800E */  lui        $v0, %hi(shadow_index)
/* 29A8C 80028E8C 80447CE8 */  lb         $a0, %lo(shadow_index)($v0)
/* 29A90 80028E90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29A94 80028E94 AFBF0010 */  sw         $ra, 0x10($sp)
/* 29A98 80028E98 0C01C1EC */  jal        boost_from_shadow_merge
/* 29A9C 80028E9C 00000000 */   nop
/* 29AA0 80028EA0 3C03800F */  lui        $v1, %hi(clear_combatstruct_flag)
/* 29AA4 80028EA4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29AA8 80028EA8 24020001 */  addiu      $v0, $zero, 1
/* 29AAC 80028EAC AC629B68 */  sw         $v0, %lo(clear_combatstruct_flag)($v1)
/* 29AB0 80028EB0 2402000E */  addiu      $v0, $zero, 0xe
/* 29AB4 80028EB4 03E00008 */  jr         $ra
/* 29AB8 80028EB8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80028EBC
/* 29ABC 80028EBC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29AC0 80028EC0 AFB00010 */  sw         $s0, 0x10($sp)
/* 29AC4 80028EC4 00808021 */  addu       $s0, $a0, $zero
/* 29AC8 80028EC8 00052C00 */  sll        $a1, $a1, 0x10
/* 29ACC 80028ECC AFBF0014 */  sw         $ra, 0x14($sp)
/* 29AD0 80028ED0 8E040000 */  lw         $a0, ($s0)
/* 29AD4 80028ED4 0C009F43 */  jal        func_80027D0C
/* 29AD8 80028ED8 00052C03 */   sra       $a1, $a1, 0x10
/* 29ADC 80028EDC 8FBF0014 */  lw         $ra, 0x14($sp)
/* 29AE0 80028EE0 AE020000 */  sw         $v0, ($s0)
/* 29AE4 80028EE4 8FB00010 */  lw         $s0, 0x10($sp)
/* 29AE8 80028EE8 24020002 */  addiu      $v0, $zero, 2
/* 29AEC 80028EEC 03E00008 */  jr         $ra
/* 29AF0 80028EF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_byte_func_19
/* 29AF4 80028EF4 3C02800F */  lui        $v0, %hi(combatPointer)
/* 29AF8 80028EF8 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 29AFC 80028EFC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29B00 80028F00 AFB10014 */  sw         $s1, 0x14($sp)
/* 29B04 80028F04 00808821 */  addu       $s1, $a0, $zero
/* 29B08 80028F08 AFBF0018 */  sw         $ra, 0x18($sp)
/* 29B0C 80028F0C AFB00010 */  sw         $s0, 0x10($sp)
/* 29B10 80028F10 8C64002C */  lw         $a0, 0x2c($v1)
/* 29B14 80028F14 0C01A92D */  jal        func_8006A4B4
/* 29B18 80028F18 30B0FFFF */   andi      $s0, $a1, 0xffff
/* 29B1C 80028F1C 00108400 */  sll        $s0, $s0, 0x10
/* 29B20 80028F20 8E240000 */  lw         $a0, ($s1)
/* 29B24 80028F24 0C009F43 */  jal        func_80027D0C
/* 29B28 80028F28 00102C03 */   sra       $a1, $s0, 0x10
/* 29B2C 80028F2C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 29B30 80028F30 AE220000 */  sw         $v0, ($s1)
/* 29B34 80028F34 8FB10014 */  lw         $s1, 0x14($sp)
/* 29B38 80028F38 8FB00010 */  lw         $s0, 0x10($sp)
/* 29B3C 80028F3C 24020002 */  addiu      $v0, $zero, 2
/* 29B40 80028F40 03E00008 */  jr         $ra
/* 29B44 80028F44 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combat_byte_func_20
/* 29B48 80028F48 3C02800F */  lui        $v0, %hi(clear_combatstruct_flag)
/* 29B4C 80028F4C 24040001 */  addiu      $a0, $zero, 1
/* 29B50 80028F50 3C03800E */  lui        $v1, %hi(some_flag__)
/* 29B54 80028F54 AC449B68 */  sw         $a0, %lo(clear_combatstruct_flag)($v0)
/* 29B58 80028F58 24020001 */  addiu      $v0, $zero, 1
/* 29B5C 80028F5C 03E00008 */  jr         $ra
/* 29B60 80028F60 A4647B96 */   sh        $a0, %lo(some_flag__)($v1)

glabel combat_byte_func_21
/* 29B64 80028F64 3C03800F */  lui        $v1, %hi(clear_combatstruct_flag)
/* 29B68 80028F68 24020001 */  addiu      $v0, $zero, 1
/* 29B6C 80028F6C AC629B68 */  sw         $v0, %lo(clear_combatstruct_flag)($v1)
/* 29B70 80028F70 03E00008 */  jr         $ra
/* 29B74 80028F74 2402000C */   addiu     $v0, $zero, 0xc

glabel func_80028F78
/* 29B78 80028F78 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29B7C 80028F7C AFB10014 */  sw         $s1, 0x14($sp)
/* 29B80 80028F80 00808821 */  addu       $s1, $a0, $zero
/* 29B84 80028F84 AFB00010 */  sw         $s0, 0x10($sp)
/* 29B88 80028F88 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 29B8C 80028F8C 00102C00 */  sll        $a1, $s0, 0x10
/* 29B90 80028F90 AFBF0018 */  sw         $ra, 0x18($sp)
/* 29B94 80028F94 8E240000 */  lw         $a0, ($s1)
/* 29B98 80028F98 0C009F43 */  jal        func_80027D0C
/* 29B9C 80028F9C 00052C03 */   sra       $a1, $a1, 0x10
/* 29BA0 80028FA0 00402021 */  addu       $a0, $v0, $zero
/* 29BA4 80028FA4 02002821 */  addu       $a1, $s0, $zero
/* 29BA8 80028FA8 0C02456C */  jal        func_800915B0
/* 29BAC 80028FAC AE220000 */   sw        $v0, ($s1)
/* 29BB0 80028FB0 02002021 */  addu       $a0, $s0, $zero
/* 29BB4 80028FB4 0C02454A */  jal        func_80091528
/* 29BB8 80028FB8 AE220000 */   sw        $v0, ($s1)
/* 29BBC 80028FBC 8FBF0018 */  lw         $ra, 0x18($sp)
/* 29BC0 80028FC0 8FB10014 */  lw         $s1, 0x14($sp)
/* 29BC4 80028FC4 8FB00010 */  lw         $s0, 0x10($sp)
/* 29BC8 80028FC8 24020002 */  addiu      $v0, $zero, 2
/* 29BCC 80028FCC 03E00008 */  jr         $ra
/* 29BD0 80028FD0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80028FD4
/* 29BD4 80028FD4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29BD8 80028FD8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 29BDC 80028FDC 0C00A3DE */  jal        func_80028F78
/* 29BE0 80028FE0 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29BE4 80028FE4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29BE8 80028FE8 03E00008 */  jr         $ra
/* 29BEC 80028FEC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80028FF0
/* 29BF0 80028FF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29BF4 80028FF4 AFB00010 */  sw         $s0, 0x10($sp)
/* 29BF8 80028FF8 00808021 */  addu       $s0, $a0, $zero
/* 29BFC 80028FFC 00052C00 */  sll        $a1, $a1, 0x10
/* 29C00 80029000 AFBF0014 */  sw         $ra, 0x14($sp)
/* 29C04 80029004 8E040000 */  lw         $a0, ($s0)
/* 29C08 80029008 0C009F43 */  jal        func_80027D0C
/* 29C0C 8002900C 00052C03 */   sra       $a1, $a1, 0x10
/* 29C10 80029010 8FBF0014 */  lw         $ra, 0x14($sp)
/* 29C14 80029014 AE020000 */  sw         $v0, ($s0)
/* 29C18 80029018 8FB00010 */  lw         $s0, 0x10($sp)
/* 29C1C 8002901C 24020002 */  addiu      $v0, $zero, 2
/* 29C20 80029020 03E00008 */  jr         $ra
/* 29C24 80029024 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80029028
/* 29C28 80029028 3C03800F */  lui        $v1, %hi(D_800E9B90)
/* 29C2C 8002902C 94629B90 */  lhu        $v0, %lo(D_800E9B90)($v1)
/* 29C30 80029030 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29C34 80029034 AFB00010 */  sw         $s0, 0x10($sp)
/* 29C38 80029038 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 29C3C 8002903C AFB10014 */  sw         $s1, 0x14($sp)
/* 29C40 80029040 AFBF0018 */  sw         $ra, 0x18($sp)
/* 29C44 80029044 00501023 */  subu       $v0, $v0, $s0
/* 29C48 80029048 A4629B90 */  sh         $v0, -0x6470($v1)
/* 29C4C 8002904C 00021400 */  sll        $v0, $v0, 0x10
/* 29C50 80029050 1C400005 */  bgtz       $v0, .L80029068
/* 29C54 80029054 00808821 */   addu      $s1, $a0, $zero
/* 29C58 80029058 3C02800F */  lui        $v0, %hi(combatPointer)
/* 29C5C 8002905C 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 29C60 80029060 0C01A92D */  jal        func_8006A4B4
/* 29C64 80029064 8C64002C */   lw        $a0, 0x2c($v1)
.L80029068:
/* 29C68 80029068 02202021 */  addu       $a0, $s1, $zero
/* 29C6C 8002906C 0C00A3FC */  jal        func_80028FF0
/* 29C70 80029070 02002821 */   addu      $a1, $s0, $zero
/* 29C74 80029074 8FBF0018 */  lw         $ra, 0x18($sp)
/* 29C78 80029078 8FB10014 */  lw         $s1, 0x14($sp)
/* 29C7C 8002907C 8FB00010 */  lw         $s0, 0x10($sp)
/* 29C80 80029080 03E00008 */  jr         $ra
/* 29C84 80029084 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80029088
/* 29C88 80029088 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29C8C 8002908C AFBF0010 */  sw         $ra, 0x10($sp)
/* 29C90 80029090 0C00A40A */  jal        func_80029028
/* 29C94 80029094 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29C98 80029098 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29C9C 8002909C 03E00008 */  jr         $ra
/* 29CA0 800290A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800290A4
/* 29CA4 800290A4 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 29CA8 800290A8 90447C70 */  lbu        $a0, %lo(combat_bytes)($v0)
/* 29CAC 800290AC 2403001B */  addiu      $v1, $zero, 0x1b
/* 29CB0 800290B0 A0437C70 */  sb         $v1, 0x7c70($v0)
/* 29CB4 800290B4 24427C70 */  addiu      $v0, $v0, 0x7c70
/* 29CB8 800290B8 03E00008 */  jr         $ra
/* 29CBC 800290BC AC440080 */   sw        $a0, 0x80($v0)

glabel func_800290C0
/* 29CC0 800290C0 3C03800F */  lui        $v1, %hi(D_800E9B6C)
/* 29CC4 800290C4 94629B6C */  lhu        $v0, %lo(D_800E9B6C)($v1)
/* 29CC8 800290C8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29CCC 800290CC 2C420002 */  sltiu      $v0, $v0, 2
/* 29CD0 800290D0 10400003 */  beqz       $v0, .L800290E0
/* 29CD4 800290D4 AFBF0010 */   sw        $ra, 0x10($sp)
/* 29CD8 800290D8 0800A447 */  j          .L8002911C
/* 29CDC 800290DC 24020002 */   addiu     $v0, $zero, 2
.L800290E0:
/* 29CE0 800290E0 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 29CE4 800290E4 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 29CE8 800290E8 14600003 */  bnez       $v1, .L800290F8
/* 29CEC 800290EC 00000000 */   nop
/* 29CF0 800290F0 0C00381F */  jal        FreeZoneEngineMemory
/* 29CF4 800290F4 00000000 */   nop
.L800290F8:
/* 29CF8 800290F8 0C0095D1 */  jal        GetSnapshot_
/* 29CFC 800290FC 00000000 */   nop
/* 29D00 80029100 24020003 */  addiu      $v0, $zero, 3
/* 29D04 80029104 3C03800E */  lui        $v1, %hi(gGlobals)
/* 29D08 80029108 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 29D0C 8002910C 9465144C */  lhu        $a1, 0x144c($v1)
/* 29D10 80029110 24040001 */  addiu      $a0, $zero, 1
/* 29D14 80029114 AC6414FC */  sw         $a0, 0x14fc($v1)
/* 29D18 80029118 A46514D2 */  sh         $a1, 0x14d2($v1)
.L8002911C:
/* 29D1C 8002911C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29D20 80029120 03E00008 */  jr         $ra
/* 29D24 80029124 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80029128
/* 29D28 80029128 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29D2C 8002912C 3C03800F */  lui        $v1, %hi(D_800E9B6C)
/* 29D30 80029130 94629B6C */  lhu        $v0, %lo(D_800E9B6C)($v1)
/* 29D34 80029134 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 29D38 80029138 2C420078 */  sltiu      $v0, $v0, 0x78
/* 29D3C 8002913C 14400005 */  bnez       $v0, .L80029154
/* 29D40 80029140 AFBF0010 */   sw        $ra, 0x10($sp)
/* 29D44 80029144 0C00A9E8 */  jal        combat_byte_0xd
/* 29D48 80029148 00000000 */   nop
/* 29D4C 8002914C 0800A457 */  j          .L8002915C
/* 29D50 80029150 24020002 */   addiu     $v0, $zero, 2
.L80029154:
/* 29D54 80029154 0C00A3FC */  jal        func_80028FF0
/* 29D58 80029158 00000000 */   nop
.L8002915C:
/* 29D5C 8002915C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29D60 80029160 03E00008 */  jr         $ra
/* 29D64 80029164 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80029168
/* 29D68 80029168 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29D6C 8002916C AFBF0010 */  sw         $ra, 0x10($sp)
/* 29D70 80029170 0C00A3FC */  jal        func_80028FF0
/* 29D74 80029174 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29D78 80029178 3C04800F */  lui        $a0, %hi(combatPointer)
/* 29D7C 8002917C 8C84F760 */  lw         $a0, %lo(combatPointer)($a0)
/* 29D80 80029180 8C8352C8 */  lw         $v1, 0x52c8($a0)
/* 29D84 80029184 24630001 */  addiu      $v1, $v1, 1
/* 29D88 80029188 AC8352C8 */  sw         $v1, 0x52c8($a0)
/* 29D8C 8002918C 2C63003C */  sltiu      $v1, $v1, 0x3c
/* 29D90 80029190 14600008 */  bnez       $v1, .L800291B4
/* 29D94 80029194 8FBF0010 */   lw        $ra, 0x10($sp)
/* 29D98 80029198 3C03800E */  lui        $v1, %hi(gGlobals)
/* 29D9C 8002919C 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 29DA0 800291A0 AC8052C8 */  sw         $zero, 0x52c8($a0)
/* 29DA4 800291A4 24040001 */  addiu      $a0, $zero, 1
/* 29DA8 800291A8 2405001E */  addiu      $a1, $zero, 0x1e
/* 29DAC 800291AC A4642048 */  sh         $a0, 0x2048($v1)
/* 29DB0 800291B0 A06513C8 */  sb         $a1, 0x13c8($v1)
.L800291B4:
/* 29DB4 800291B4 03E00008 */  jr         $ra
/* 29DB8 800291B8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_byte_func_30
/* 29DBC 800291BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29DC0 800291C0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 29DC4 800291C4 244668A8 */  addiu      $a2, $v0, %lo(gGlobals)
/* 29DC8 800291C8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 29DCC 800291CC 94C32048 */  lhu        $v1, 0x2048($a2)
/* 29DD0 800291D0 14600008 */  bnez       $v1, .L800291F4
/* 29DD4 800291D4 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29DD8 800291D8 24020001 */  addiu      $v0, $zero, 1
/* 29DDC 800291DC 3C03800F */  lui        $v1, %hi(clear_combatstruct_flag)
/* 29DE0 800291E0 24040001 */  addiu      $a0, $zero, 1
/* 29DE4 800291E4 24050002 */  addiu      $a1, $zero, 2
/* 29DE8 800291E8 AC649B68 */  sw         $a0, %lo(clear_combatstruct_flag)($v1)
/* 29DEC 800291EC 0800A47F */  j          .L800291FC
/* 29DF0 800291F0 A4C52048 */   sh        $a1, 0x2048($a2)
.L800291F4:
/* 29DF4 800291F4 0C00A3FC */  jal        func_80028FF0
/* 29DF8 800291F8 00000000 */   nop
.L800291FC:
/* 29DFC 800291FC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 29E00 80029200 03E00008 */  jr         $ra
/* 29E04 80029204 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_byte_func_31
/* 29E08 80029208 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 29E0C 8002920C AFBF0050 */  sw         $ra, 0x50($sp)
/* 29E10 80029210 0C00A3FC */  jal        func_80028FF0
/* 29E14 80029214 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 29E18 80029218 3C03800E */  lui        $v1, %hi(gGlobals)
/* 29E1C 8002921C 246968A8 */  addiu      $t1, $v1, %lo(gGlobals)
/* 29E20 80029220 95242048 */  lhu        $a0, 0x2048($t1)
/* 29E24 80029224 14800012 */  bnez       $a0, .L80029270
/* 29E28 80029228 00404021 */   addu      $t0, $v0, $zero
/* 29E2C 8002922C 3C02800E */  lui        $v0, %hi(One)
/* 29E30 80029230 2443A2A8 */  addiu      $v1, $v0, %lo(One)
/* 29E34 80029234 3C04800F */  lui        $a0, %hi(combatPointer)
/* 29E38 80029238 8C45A2A8 */  lw         $a1, -0x5d58($v0)
/* 29E3C 8002923C 8C660004 */  lw         $a2, 4($v1)
/* 29E40 80029240 8C87F760 */  lw         $a3, %lo(combatPointer)($a0)
/* 29E44 80029244 AFA50010 */  sw         $a1, 0x10($sp)
/* 29E48 80029248 AFA60014 */  sw         $a2, 0x14($sp)
/* 29E4C 8002924C 8CE2002C */  lw         $v0, 0x2c($a3)
/* 29E50 80029250 8C430044 */  lw         $v1, 0x44($v0)
/* 29E54 80029254 27A20010 */  addiu      $v0, $sp, 0x10
/* 29E58 80029258 0003182B */  sltu       $v1, $zero, $v1
/* 29E5C 8002925C 00031880 */  sll        $v1, $v1, 2
/* 29E60 80029260 00431021 */  addu       $v0, $v0, $v1
/* 29E64 80029264 90440003 */  lbu        $a0, 3($v0)
/* 29E68 80029268 01001021 */  addu       $v0, $t0, $zero
/* 29E6C 8002926C A12413C8 */  sb         $a0, 0x13c8($t1)
.L80029270:
/* 29E70 80029270 8FBF0050 */  lw         $ra, 0x50($sp)
/* 29E74 80029274 03E00008 */  jr         $ra
/* 29E78 80029278 27BD0058 */   addiu     $sp, $sp, 0x58

glabel fleeing_reinforcements_func
/* 29E7C 8002927C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 29E80 80029280 8C44F760 */  lw         $a0, %lo(combatPointer)($v0)
/* 29E84 80029284 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 29E88 80029288 AFBF0014 */  sw         $ra, 0x14($sp)
/* 29E8C 8002928C AFB00010 */  sw         $s0, 0x10($sp)
/* 29E90 80029290 8C83543C */  lw         $v1, 0x543c($a0)
/* 29E94 80029294 00408021 */  addu       $s0, $v0, $zero
/* 29E98 80029298 10600022 */  beqz       $v1, .L80029324
/* 29E9C 8002929C 00001021 */   addu      $v0, $zero, $zero
/* 29EA0 800292A0 8C824FC0 */  lw         $v0, 0x4fc0($a0)
/* 29EA4 800292A4 0C024460 */  jal        combat_widget_print_func
/* 29EA8 800292A8 8C4400EC */   lw        $a0, 0xec($v0)
/* 29EAC 800292AC 3C02800E */  lui        $v0, %hi(delay_float)
/* 29EB0 800292B0 C44068B4 */  lwc1       $f0, %lo(delay_float)($v0)
/* 29EB4 800292B4 3C01800E */  lui        $at, %hi(D_800DA2B0)
/* 29EB8 800292B8 C422A2B0 */  lwc1       $f2, %lo(D_800DA2B0)($at)
/* 29EBC 800292BC 4600103E */  c.le.s     $f2, $f0
/* 29EC0 800292C0 00000000 */  nop
/* 29EC4 800292C4 45010005 */  bc1t       .L800292DC
/* 29EC8 800292C8 8E04F760 */   lw        $a0, -0x8a0($s0)
/* 29ECC 800292CC 4600008D */  trunc.w.s  $f2, $f0
/* 29ED0 800292D0 44031000 */  mfc1       $v1, $f2
/* 29ED4 800292D4 0800A4BD */  j          .L800292F4
/* 29ED8 800292D8 8C8252C8 */   lw        $v0, 0x52c8($a0)
.L800292DC:
/* 29EDC 800292DC 46020001 */  sub.s      $f0, $f0, $f2
/* 29EE0 800292E0 4600008D */  trunc.w.s  $f2, $f0
/* 29EE4 800292E4 44031000 */  mfc1       $v1, $f2
/* 29EE8 800292E8 3C028000 */  lui        $v0, 0x8000
/* 29EEC 800292EC 00621825 */  or         $v1, $v1, $v0
/* 29EF0 800292F0 8C8252C8 */  lw         $v0, 0x52c8($a0)
.L800292F4:
/* 29EF4 800292F4 8E05F760 */  lw         $a1, -0x8a0($s0)
/* 29EF8 800292F8 00431021 */  addu       $v0, $v0, $v1
/* 29EFC 800292FC AC8252C8 */  sw         $v0, 0x52c8($a0)
/* 29F00 80029300 8CA352C8 */  lw         $v1, 0x52c8($a1)
/* 29F04 80029304 2C63003C */  sltiu      $v1, $v1, 0x3c
/* 29F08 80029308 14600006 */  bnez       $v1, .L80029324
/* 29F0C 8002930C 24020001 */   addiu     $v0, $zero, 1
/* 29F10 80029310 00A02021 */  addu       $a0, $a1, $zero
/* 29F14 80029314 ACA052C8 */  sw         $zero, 0x52c8($a1)
/* 29F18 80029318 0C019E1D */  jal        passto_combat_widget_print_func
/* 29F1C 8002931C ACA0543C */   sw        $zero, 0x543c($a1)
/* 29F20 80029320 24020001 */  addiu      $v0, $zero, 1
.L80029324:
/* 29F24 80029324 8FBF0014 */  lw         $ra, 0x14($sp)
/* 29F28 80029328 8FB00010 */  lw         $s0, 0x10($sp)
/* 29F2C 8002932C 03E00008 */  jr         $ra
/* 29F30 80029330 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ScreenFadeMode_2
/* 29F34 80029334 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 29F38 80029338 AFB10014 */  sw         $s1, 0x14($sp)
/* 29F3C 8002933C 00808821 */  addu       $s1, $a0, $zero
/* 29F40 80029340 AFB00010 */  sw         $s0, 0x10($sp)
/* 29F44 80029344 3C10800E */  lui        $s0, %hi(combat_bytes)
/* 29F48 80029348 AFB20018 */  sw         $s2, 0x18($sp)
/* 29F4C 8002934C AFBF001C */  sw         $ra, 0x1c($sp)
/* 29F50 80029350 0C00A52B */  jal        init_combat_struct
/* 29F54 80029354 26127C70 */   addiu     $s2, $s0, %lo(combat_bytes)
/* 29F58 80029358 0C003278 */  jal        func_8000C9E0
/* 29F5C 8002935C 00000000 */   nop
/* 29F60 80029360 1440002C */  bnez       $v0, .L80029414
/* 29F64 80029364 24020002 */   addiu     $v0, $zero, 2
/* 29F68 80029368 92037C70 */  lbu        $v1, 0x7c70($s0)
/* 29F6C 8002936C 2462FFF2 */  addiu      $v0, $v1, -0xe
/* 29F70 80029370 2C420002 */  sltiu      $v0, $v0, 2
/* 29F74 80029374 5440000C */  bnel       $v0, $zero, .L800293A8
/* 29F78 80029378 3C03800F */   lui       $v1, 0x800f
/* 29F7C 8002937C 306300FF */  andi       $v1, $v1, 0xff
/* 29F80 80029380 2402000C */  addiu      $v0, $zero, 0xc
/* 29F84 80029384 10620007 */  beq        $v1, $v0, .L800293A4
/* 29F88 80029388 2402001B */   addiu     $v0, $zero, 0x1b
/* 29F8C 8002938C 10620005 */  beq        $v1, $v0, .L800293A4
/* 29F90 80029390 2402001C */   addiu     $v0, $zero, 0x1c
/* 29F94 80029394 10620003 */  beq        $v1, $v0, .L800293A4
/* 29F98 80029398 3C02800F */   lui       $v0, %hi(D_800E9B6C)
/* 29F9C 8002939C 0800A4ED */  j          .L800293B4
/* 29FA0 800293A0 A4409B6C */   sh        $zero, %lo(D_800E9B6C)($v0)
.L800293A4:
/* 29FA4 800293A4 3C03800F */  lui        $v1, %hi(D_800E9B6C)
.L800293A8:
/* 29FA8 800293A8 94629B6C */  lhu        $v0, %lo(D_800E9B6C)($v1)
/* 29FAC 800293AC 24420001 */  addiu      $v0, $v0, 1
/* 29FB0 800293B0 A4629B6C */  sh         $v0, -0x6494($v1)
.L800293B4:
/* 29FB4 800293B4 0C023468 */  jal        combat_controls
/* 29FB8 800293B8 00000000 */   nop
/* 29FBC 800293BC 00408021 */  addu       $s0, $v0, $zero
/* 29FC0 800293C0 3C02800E */  lui        $v0, %hi(delay_float)
/* 29FC4 800293C4 44900000 */  mtc1       $s0, $f0
/* 29FC8 800293C8 46800020 */  cvt.s.w    $f0, $f0
/* 29FCC 800293CC 0C00A49F */  jal        fleeing_reinforcements_func
/* 29FD0 800293D0 E44068B4 */   swc1      $f0, %lo(delay_float)($v0)
/* 29FD4 800293D4 1440000D */  bnez       $v0, .L8002940C
/* 29FD8 800293D8 02202021 */   addu      $a0, $s1, $zero
/* 29FDC 800293DC 3C02800F */  lui        $v0, %hi(combat_byte_funcs)
/* 29FE0 800293E0 92430000 */  lbu        $v1, ($s2)
/* 29FE4 800293E4 24429B94 */  addiu      $v0, $v0, %lo(combat_byte_funcs)
/* 29FE8 800293E8 00031880 */  sll        $v1, $v1, 2
/* 29FEC 800293EC 00621821 */  addu       $v1, $v1, $v0
/* 29FF0 800293F0 8C620000 */  lw         $v0, ($v1)
/* 29FF4 800293F4 0040F809 */  jalr       $v0
/* 29FF8 800293F8 3205FFFF */   andi      $a1, $s0, 0xffff
/* 29FFC 800293FC 0C00A5FC */  jal        clear_combat_func
/* 2A000 80029400 00408021 */   addu      $s0, $v0, $zero
/* 2A004 80029404 0800A505 */  j          .L80029414
/* 2A008 80029408 02001021 */   addu      $v0, $s0, $zero
.L8002940C:
/* 2A00C 8002940C 0C00A3FC */  jal        func_80028FF0
/* 2A010 80029410 3205FFFF */   andi      $a1, $s0, 0xffff
.L80029414:
/* 2A014 80029414 8FBF001C */  lw         $ra, 0x1c($sp)
/* 2A018 80029418 8FB20018 */  lw         $s2, 0x18($sp)
/* 2A01C 8002941C 8FB10014 */  lw         $s1, 0x14($sp)
/* 2A020 80029420 8FB00010 */  lw         $s0, 0x10($sp)
/* 2A024 80029424 03E00008 */  jr         $ra
/* 2A028 80029428 27BD0020 */   addiu     $sp, $sp, 0x20

glabel combat_start_turn_
/* 2A02C 8002942C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2A030 80029430 AFB20018 */  sw         $s2, 0x18($sp)
/* 2A034 80029434 3C12800F */  lui        $s2, %hi(combatPointer)
/* 2A038 80029438 AFB00010 */  sw         $s0, 0x10($sp)
/* 2A03C 8002943C 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 2A040 80029440 8E42F760 */  lw         $v0, %lo(combatPointer)($s2)
/* 2A044 80029444 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 2A048 80029448 AFBF001C */  sw         $ra, 0x1c($sp)
/* 2A04C 8002944C AFB10014 */  sw         $s1, 0x14($sp)
/* 2A050 80029450 8C51002C */  lw         $s1, 0x2c($v0)
/* 2A054 80029454 8C434FC0 */  lw         $v1, 0x4fc0($v0)
/* 2A058 80029458 8E240040 */  lw         $a0, 0x40($s1)
/* 2A05C 8002945C 8C650000 */  lw         $a1, ($v1)
/* 2A060 80029460 8C860004 */  lw         $a2, 4($a0)
/* 2A064 80029464 0C0333AC */  jal        sprintf
/* 2A068 80029468 02002021 */   addu      $a0, $s0, $zero
/* 2A06C 8002946C 02002821 */  addu       $a1, $s0, $zero
/* 2A070 80029470 8E44F760 */  lw         $a0, -0x8a0($s2)
/* 2A074 80029474 0C019DE8 */  jal        copy_string_to_combat_textbox
/* 2A078 80029478 00003021 */   addu      $a2, $zero, $zero
/* 2A07C 8002947C 0C01A10F */  jal        set_combat_movement
/* 2A080 80029480 02202021 */   addu      $a0, $s1, $zero
/* 2A084 80029484 0C023B32 */  jal        combat_markers_func
/* 2A088 80029488 02202021 */   addu      $a0, $s1, $zero
/* 2A08C 8002948C 0C01BD12 */  jal        func_8006F448
/* 2A090 80029490 02202021 */   addu      $a0, $s1, $zero
/* 2A094 80029494 8FBF001C */  lw         $ra, 0x1c($sp)
/* 2A098 80029498 8FB20018 */  lw         $s2, 0x18($sp)
/* 2A09C 8002949C 8FB10014 */  lw         $s1, 0x14($sp)
/* 2A0A0 800294A0 8FB00010 */  lw         $s0, 0x10($sp)
/* 2A0A4 800294A4 03E00008 */  jr         $ra
/* 2A0A8 800294A8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel init_combat_struct
/* 2A0AC 800294AC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 2A0B0 800294B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 2A0B4 800294B4 3C10800F */  lui        $s0, %hi(load_combatstruct_flag)
/* 2A0B8 800294B8 8E029B64 */  lw         $v0, %lo(load_combatstruct_flag)($s0)
/* 2A0BC 800294BC AFBF002C */  sw         $ra, 0x2c($sp)
/* 2A0C0 800294C0 AFB60028 */  sw         $s6, 0x28($sp)
/* 2A0C4 800294C4 AFB50024 */  sw         $s5, 0x24($sp)
/* 2A0C8 800294C8 AFB40020 */  sw         $s4, 0x20($sp)
/* 2A0CC 800294CC AFB3001C */  sw         $s3, 0x1c($sp)
/* 2A0D0 800294D0 AFB20018 */  sw         $s2, 0x18($sp)
/* 2A0D4 800294D4 AFB10014 */  sw         $s1, 0x14($sp)
/* 2A0D8 800294D8 F7B40030 */  sdc1       $f20, 0x30($sp)
/* 2A0DC 800294DC 104000B9 */  beqz       $v0, .L800297C4
/* 2A0E0 800294E0 3C02800F */   lui       $v0, %hi(some_combat_flag_)
/* 2A0E4 800294E4 24160001 */  addiu      $s6, $zero, 1
/* 2A0E8 800294E8 0C00B5E6 */  jal        memmaker_func_A
/* 2A0EC 800294EC AC569B60 */   sw        $s6, %lo(some_combat_flag_)($v0)
/* 2A0F0 800294F0 0C00B60A */  jal        memmaker_func_B
/* 2A0F4 800294F4 00000000 */   nop
/* 2A0F8 800294F8 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2A0FC 800294FC 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2A100 80029500 14600004 */  bnez       $v1, .L80029514
/* 2A104 80029504 3C04800F */   lui       $a0, 0x800f
/* 2A108 80029508 0C0290A9 */  jal        set_AnimCache
/* 2A10C 8002950C 24040001 */   addiu     $a0, $zero, 1
/* 2A110 80029510 3C04800F */  lui        $a0, %hi(combatVec3A)
.L80029514:
/* 2A114 80029514 4480A000 */  mtc1       $zero, $f20
/* 2A118 80029518 248453D0 */  addiu      $a0, $a0, %lo(combatVec3A)
/* 2A11C 8002951C 4405A000 */  mfc1       $a1, $f20
/* 2A120 80029520 4406A000 */  mfc1       $a2, $f20
/* 2A124 80029524 4407A000 */  mfc1       $a3, $f20
/* 2A128 80029528 3C02800F */  lui        $v0, %hi(combat_flag_42)
/* 2A12C 8002952C AC409B8C */  sw         $zero, %lo(combat_flag_42)($v0)
/* 2A130 80029530 0C02AD58 */  jal        setVec3
/* 2A134 80029534 AE009B64 */   sw        $zero, -0x649c($s0)
/* 2A138 80029538 3C04800F */  lui        $a0, %hi(combatVec3B)
/* 2A13C 8002953C 4405A000 */  mfc1       $a1, $f20
/* 2A140 80029540 248453E0 */  addiu      $a0, $a0, %lo(combatVec3B)
/* 2A144 80029544 00A03021 */  addu       $a2, $a1, $zero
/* 2A148 80029548 0C02AD58 */  jal        setVec3
/* 2A14C 8002954C 00A03821 */   addu      $a3, $a1, $zero
/* 2A150 80029550 0C00A80F */  jal        clear_alaron_shadow_indices
/* 2A154 80029554 3C10800F */   lui       $s0, 0x800f
/* 2A158 80029558 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 2A15C 8002955C 24537C70 */  addiu      $s3, $v0, %lo(combat_bytes)
/* 2A160 80029560 26750034 */  addiu      $s5, $s3, 0x34
/* 2A164 80029564 02A02021 */  addu       $a0, $s5, $zero
/* 2A168 80029568 00002821 */  addu       $a1, $zero, $zero
/* 2A16C 8002956C 0C026380 */  jal        Calloc
/* 2A170 80029570 24060038 */   addiu     $a2, $zero, 0x38
/* 2A174 80029574 2404544C */  addiu      $a0, $zero, 0x544c
/* 2A178 80029578 3C05800E */  lui        $a1, %hi(D_800DA280)
/* 2A17C 8002957C 24A5A280 */  addiu      $a1, $a1, %lo(D_800DA280)
/* 2A180 80029580 0C025F9C */  jal        Malloc
/* 2A184 80029584 240606D1 */   addiu     $a2, $zero, 0x6d1
/* 2A188 80029588 00402021 */  addu       $a0, $v0, $zero
/* 2A18C 8002958C 0C0194B4 */  jal        calloc_combat_struct
/* 2A190 80029590 AE02F760 */   sw        $v0, -0x8a0($s0)
/* 2A194 80029594 2674ED18 */  addiu      $s4, $s3, -0x12e8
/* 2A198 80029598 26710004 */  addiu      $s1, $s3, 4
/* 2A19C 8002959C 92620002 */  lbu        $v0, 2($s3)
/* 2A1A0 800295A0 14400013 */  bnez       $v0, .L800295F0
/* 2A1A4 800295A4 02009021 */   addu      $s2, $s0, $zero
/* 2A1A8 800295A8 0C00A7D0 */  jal        random_enemy_generator
/* 2A1AC 800295AC 00000000 */   nop
/* 2A1B0 800295B0 00002021 */  addu       $a0, $zero, $zero
/* 2A1B4 800295B4 2405001B */  addiu      $a1, $zero, 0x1b
/* 2A1B8 800295B8 2402080C */  addiu      $v0, $zero, 0x80c
/* 2A1BC 800295BC A6220018 */  sh         $v0, 0x18($s1)
/* 2A1C0 800295C0 0C002CF7 */  jal        rand_range
/* 2A1C4 800295C4 A620001A */   sh        $zero, 0x1a($s1)
/* 2A1C8 800295C8 00002021 */  addu       $a0, $zero, $zero
/* 2A1CC 800295CC 24050002 */  addiu      $a1, $zero, 2
/* 2A1D0 800295D0 0C002CF7 */  jal        rand_range
/* 2A1D4 800295D4 A2220027 */   sb        $v0, 0x27($s1)
/* 2A1D8 800295D8 00002021 */  addu       $a0, $zero, $zero
/* 2A1DC 800295DC 24050003 */  addiu      $a1, $zero, 3
/* 2A1E0 800295E0 0C002CF7 */  jal        rand_range
/* 2A1E4 800295E4 A2220026 */   sb        $v0, 0x26($s1)
/* 2A1E8 800295E8 A2220028 */  sb         $v0, 0x28($s1)
/* 2A1EC 800295EC A2360029 */  sb         $s6, 0x29($s1)
.L800295F0:
/* 2A1F0 800295F0 00008021 */  addu       $s0, $zero, $zero
/* 2A1F4 800295F4 02A02021 */  addu       $a0, $s5, $zero
/* 2A1F8 800295F8 00101080 */  sll        $v0, $s0, 2
.L800295FC:
/* 2A1FC 800295FC 00821021 */  addu       $v0, $a0, $v0
/* 2A200 80029600 AC400000 */  sw         $zero, ($v0)
/* 2A204 80029604 26030001 */  addiu      $v1, $s0, 1
/* 2A208 80029608 307000FF */  andi       $s0, $v1, 0xff
/* 2A20C 8002960C 2E02000E */  sltiu      $v0, $s0, 0xe
/* 2A210 80029610 1440FFFA */  bnez       $v0, .L800295FC
/* 2A214 80029614 00101080 */   sll       $v0, $s0, 2
/* 2A218 80029618 24040001 */  addiu      $a0, $zero, 1
/* 2A21C 8002961C 00002821 */  addu       $a1, $zero, $zero
/* 2A220 80029620 92230027 */  lbu        $v1, 0x27($s1)
/* 2A224 80029624 24020010 */  addiu      $v0, $zero, 0x10
/* 2A228 80029628 A68202AC */  sh         $v0, 0x2ac($s4)
/* 2A22C 8002962C A68002B0 */  sh         $zero, 0x2b0($s4)
/* 2A230 80029630 0C0044AF */  jal        InitZoneEngine
/* 2A234 80029634 A68302AE */   sh        $v1, 0x2ae($s4)
/* 2A238 80029638 0C0089E4 */  jal        func_80022790
/* 2A23C 8002963C 00008021 */   addu      $s0, $zero, $zero
/* 2A240 80029640 8E44F760 */  lw         $a0, -0x8a0($s2)
/* 2A244 80029644 0C0198BE */  jal        some_combat_init
/* 2A248 80029648 02202821 */   addu      $a1, $s1, $zero
/* 2A24C 8002964C 0C023CC0 */  jal        combat_gui_init
/* 2A250 80029650 00000000 */   nop
/* 2A254 80029654 8E42F760 */  lw         $v0, -0x8a0($s2)
/* 2A258 80029658 90430001 */  lbu        $v1, 1($v0)
/* 2A25C 8002965C 1060000B */  beqz       $v1, .L8002968C
/* 2A260 80029660 02408821 */   addu      $s1, $s2, $zero
/* 2A264 80029664 8E24F760 */  lw         $a0, -0x8a0($s1)
.L80029668:
/* 2A268 80029668 0C019584 */  jal        combatEnt_setup
/* 2A26C 8002966C 02002821 */   addu      $a1, $s0, $zero
/* 2A270 80029670 8E22F760 */  lw         $v0, -0x8a0($s1)
/* 2A274 80029674 26040001 */  addiu      $a0, $s0, 1
/* 2A278 80029678 90430001 */  lbu        $v1, 1($v0)
/* 2A27C 8002967C 309000FF */  andi       $s0, $a0, 0xff
/* 2A280 80029680 0203182B */  sltu       $v1, $s0, $v1
/* 2A284 80029684 5460FFF8 */  bnel       $v1, $zero, .L80029668
/* 2A288 80029688 8E24F760 */   lw        $a0, -0x8a0($s1)
.L8002968C:
/* 2A28C 8002968C 0C019DD0 */  jal        func_80067740
/* 2A290 80029690 8E44F760 */   lw        $a0, -0x8a0($s2)
/* 2A294 80029694 8E42F760 */  lw         $v0, -0x8a0($s2)
/* 2A298 80029698 8C43002C */  lw         $v1, 0x2c($v0)
/* 2A29C 8002969C 8C444FC0 */  lw         $a0, 0x4fc0($v0)
/* 2A2A0 800296A0 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 2A2A4 800296A4 24518920 */  addiu      $s1, $v0, %lo(gGlobalsText)
/* 2A2A8 800296A8 8C670040 */  lw         $a3, 0x40($v1)
/* 2A2AC 800296AC 8C850000 */  lw         $a1, ($a0)
/* 2A2B0 800296B0 8CE60004 */  lw         $a2, 4($a3)
/* 2A2B4 800296B4 0C0333AC */  jal        sprintf
/* 2A2B8 800296B8 02202021 */   addu      $a0, $s1, $zero
/* 2A2BC 800296BC 02202821 */  addu       $a1, $s1, $zero
/* 2A2C0 800296C0 8E44F760 */  lw         $a0, -0x8a0($s2)
/* 2A2C4 800296C4 0C019DE8 */  jal        copy_string_to_combat_textbox
/* 2A2C8 800296C8 00003021 */   addu      $a2, $zero, $zero
/* 2A2CC 800296CC 8E42F760 */  lw         $v0, -0x8a0($s2)
/* 2A2D0 800296D0 8C43002C */  lw         $v1, 0x2c($v0)
/* 2A2D4 800296D4 90700020 */  lbu        $s0, 0x20($v1)
/* 2A2D8 800296D8 00101080 */  sll        $v0, $s0, 2
/* 2A2DC 800296DC 02A28021 */  addu       $s0, $s5, $v0
/* 2A2E0 800296E0 8E050000 */  lw         $a1, ($s0)
/* 2A2E4 800296E4 10A00006 */  beqz       $a1, .L80029700
/* 2A2E8 800296E8 00000000 */   nop
/* 2A2EC 800296EC 8E8402DC */  lw         $a0, 0x2dc($s4)
/* 2A2F0 800296F0 0C02C058 */  jal        camera_set_position
/* 2A2F4 800296F4 24A50068 */   addiu     $a1, $a1, 0x68
/* 2A2F8 800296F8 0C006744 */  jal        GiveCameraToPlayer
/* 2A2FC 800296FC 8E040000 */   lw        $a0, ($s0)
.L80029700:
/* 2A300 80029700 0C025A74 */  jal        clear_camera_playerdata_focus
/* 2A304 80029704 00000000 */   nop
/* 2A308 80029708 0C024BC0 */  jal        combattargetvisuals_init
/* 2A30C 8002970C 00000000 */   nop
/* 2A310 80029710 0C024C94 */  jal        combatattackvisuals_init
/* 2A314 80029714 00000000 */   nop
/* 2A318 80029718 0C024DF0 */  jal        combatstatindicator_init
/* 2A31C 8002971C 00000000 */   nop
/* 2A320 80029720 0C025078 */  jal        NOOP_800941E0
/* 2A324 80029724 00000000 */   nop
/* 2A328 80029728 0C025148 */  jal        combatspellvisuals_init
/* 2A32C 8002972C 00000000 */   nop
/* 2A330 80029730 0C023B0A */  jal        combatmarkers_init
/* 2A334 80029734 00000000 */   nop
/* 2A338 80029738 2403001F */  addiu      $v1, $zero, 0x1f
/* 2A33C 8002973C 2624DF88 */  addiu      $a0, $s1, -0x2078
/* 2A340 80029740 3C01800E */  lui        $at, %hi(D_800DA2B4)
/* 2A344 80029744 C420A2B4 */  lwc1       $f0, %lo(D_800DA2B4)($at)
/* 2A348 80029748 24050002 */  addiu      $a1, $zero, 2
/* 2A34C 8002974C A2630000 */  sb         $v1, ($s3)
/* 2A350 80029750 A4852048 */  sh         $a1, 0x2048($a0)
/* 2A354 80029754 A0802050 */  sb         $zero, 0x2050($a0)
/* 2A358 80029758 9663001E */  lhu        $v1, 0x1e($s3)
/* 2A35C 8002975C 240203D2 */  addiu      $v0, $zero, 0x3d2
/* 2A360 80029760 AC80203C */  sw         $zero, 0x203c($a0)
/* 2A364 80029764 A260007A */  sb         $zero, 0x7a($s3)
/* 2A368 80029768 1462000F */  bne        $v1, $v0, .L800297A8
/* 2A36C 8002976C E4802044 */   swc1      $f0, 0x2044($a0)
/* 2A370 80029770 8C8315F8 */  lw         $v1, 0x15f8($a0)
/* 2A374 80029774 24020001 */  addiu      $v0, $zero, 1
/* 2A378 80029778 A0822050 */  sb         $v0, 0x2050($a0)
/* 2A37C 8002977C A265007A */  sb         $a1, 0x7a($s3)
/* 2A380 80029780 8C710000 */  lw         $s1, ($v1)
/* 2A384 80029784 0C01DEBD */  jal        getHPMax
/* 2A388 80029788 02202021 */   addu      $a0, $s1, $zero
/* 2A38C 8002978C 02202021 */  addu       $a0, $s1, $zero
/* 2A390 80029790 0C01DED7 */  jal        getHPCurrent
/* 2A394 80029794 00408021 */   addu      $s0, $v0, $zero
/* 2A398 80029798 02202021 */  addu       $a0, $s1, $zero
/* 2A39C 8002979C 02028023 */  subu       $s0, $s0, $v0
/* 2A3A0 800297A0 0C01DFC1 */  jal        addHP
/* 2A3A4 800297A4 3205FFFF */   andi      $a1, $s0, 0xffff
.L800297A8:
/* 2A3A8 800297A8 0C0250C3 */  jal        set_CombatCurrentEnt_y
/* 2A3AC 800297AC 00000000 */   nop
/* 2A3B0 800297B0 0C00A50B */  jal        combat_start_turn_
/* 2A3B4 800297B4 00000000 */   nop
/* 2A3B8 800297B8 0C0244F8 */  jal        init_combatSkill_itemValues
/* 2A3BC 800297BC 00000000 */   nop
/* 2A3C0 800297C0 AE600080 */  sw         $zero, 0x80($s3)
.L800297C4:
/* 2A3C4 800297C4 8FBF002C */  lw         $ra, 0x2c($sp)
/* 2A3C8 800297C8 8FB60028 */  lw         $s6, 0x28($sp)
/* 2A3CC 800297CC 8FB50024 */  lw         $s5, 0x24($sp)
/* 2A3D0 800297D0 8FB40020 */  lw         $s4, 0x20($sp)
/* 2A3D4 800297D4 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2A3D8 800297D8 8FB20018 */  lw         $s2, 0x18($sp)
/* 2A3DC 800297DC 8FB10014 */  lw         $s1, 0x14($sp)
/* 2A3E0 800297E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 2A3E4 800297E4 D7B40030 */  ldc1       $f20, 0x30($sp)
/* 2A3E8 800297E8 03E00008 */  jr         $ra
/* 2A3EC 800297EC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel clear_combat_func
/* 2A3F0 800297F0 3C05800F */  lui        $a1, %hi(clear_combatstruct_flag)
/* 2A3F4 800297F4 8CA29B68 */  lw         $v0, %lo(clear_combatstruct_flag)($a1)
/* 2A3F8 800297F8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 2A3FC 800297FC AFBF002C */  sw         $ra, 0x2c($sp)
/* 2A400 80029800 AFB60028 */  sw         $s6, 0x28($sp)
/* 2A404 80029804 AFB50024 */  sw         $s5, 0x24($sp)
/* 2A408 80029808 AFB40020 */  sw         $s4, 0x20($sp)
/* 2A40C 8002980C AFB3001C */  sw         $s3, 0x1c($sp)
/* 2A410 80029810 AFB20018 */  sw         $s2, 0x18($sp)
/* 2A414 80029814 AFB10014 */  sw         $s1, 0x14($sp)
/* 2A418 80029818 104000AB */  beqz       $v0, .L80029AC8
/* 2A41C 8002981C AFB00010 */   sw        $s0, 0x10($sp)
/* 2A420 80029820 00002021 */  addu       $a0, $zero, $zero
/* 2A424 80029824 3C03800F */  lui        $v1, %hi(load_combatstruct_flag)
/* 2A428 80029828 24020001 */  addiu      $v0, $zero, 1
/* 2A42C 8002982C AC629B64 */  sw         $v0, %lo(load_combatstruct_flag)($v1)
/* 2A430 80029830 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2A434 80029834 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 2A438 80029838 263513C8 */  addiu      $s5, $s1, 0x13c8
/* 2A43C 8002983C ACA09B68 */  sw         $zero, -0x6498($a1)
/* 2A440 80029840 A2A00020 */  sb         $zero, 0x20($s5)
/* 2A444 80029844 A2A00002 */  sb         $zero, 2($s5)
/* 2A448 80029848 0C006358 */  jal        setCombatCameraMode
/* 2A44C 8002984C 8E3415F8 */   lw        $s4, 0x15f8($s1)
/* 2A450 80029850 0C024501 */  jal        NOOP_80091404
/* 2A454 80029854 00000000 */   nop
/* 2A458 80029858 96A3001E */  lhu        $v1, 0x1e($s5)
/* 2A45C 8002985C 240203D2 */  addiu      $v0, $zero, 0x3d2
/* 2A460 80029860 14620033 */  bne        $v1, $v0, .L80029930
/* 2A464 80029864 24050004 */   addiu     $a1, $zero, 4
/* 2A468 80029868 8E820000 */  lw         $v0, ($s4)
/* 2A46C 8002986C 8C500018 */  lw         $s0, 0x18($v0)
/* 2A470 80029870 0C021284 */  jal        getBaseStat
/* 2A474 80029874 02002021 */   addu      $a0, $s0, $zero
/* 2A478 80029878 02002021 */  addu       $a0, $s0, $zero
/* 2A47C 8002987C 24050004 */  addiu      $a1, $zero, 4
/* 2A480 80029880 0C02123F */  jal        addModdedStat
/* 2A484 80029884 00403021 */   addu      $a2, $v0, $zero
/* 2A488 80029888 2404002F */  addiu      $a0, $zero, 0x2f
/* 2A48C 8002988C 0C00918D */  jal        setEventFlag
/* 2A490 80029890 24050001 */   addiu     $a1, $zero, 1
/* 2A494 80029894 26300FE4 */  addiu      $s0, $s1, 0xfe4
/* 2A498 80029898 02002021 */  addu       $a0, $s0, $zero
/* 2A49C 8002989C 24020006 */  addiu      $v0, $zero, 6
/* 2A4A0 800298A0 A6020024 */  sh         $v0, 0x24($s0)
/* 2A4A4 800298A4 24020005 */  addiu      $v0, $zero, 5
/* 2A4A8 800298A8 3C0540BC */  lui        $a1, 0x40bc
/* 2A4AC 800298AC 34A5CCCD */  ori        $a1, $a1, 0xcccd
/* 2A4B0 800298B0 3C063F00 */  lui        $a2, 0x3f00
/* 2A4B4 800298B4 3C074040 */  lui        $a3, 0x4040
/* 2A4B8 800298B8 24030003 */  addiu      $v1, $zero, 3
/* 2A4BC 800298BC A6000026 */  sh         $zero, 0x26($s0)
/* 2A4C0 800298C0 A6000028 */  sh         $zero, 0x28($s0)
/* 2A4C4 800298C4 A6020020 */  sh         $v0, 0x20($s0)
/* 2A4C8 800298C8 0C02AD58 */  jal        setVec3
/* 2A4CC 800298CC A6030022 */   sh        $v1, 0x22($s0)
/* 2A4D0 800298D0 26240FF0 */  addiu      $a0, $s1, 0xff0
/* 2A4D4 800298D4 3C053F80 */  lui        $a1, 0x3f80
/* 2A4D8 800298D8 0C02AD55 */  jal        setVec2
/* 2A4DC 800298DC 00003021 */   addu      $a2, $zero, $zero
/* 2A4E0 800298E0 02002021 */  addu       $a0, $s0, $zero
/* 2A4E4 800298E4 0C02AD17 */  jal        copyVec3
/* 2A4E8 800298E8 26250FF8 */   addiu     $a1, $s1, 0xff8
/* 2A4EC 800298EC 3C02800F */  lui        $v0, %hi(entityList+0x99)
/* 2A4F0 800298F0 90451449 */  lbu        $a1, %lo(entityList+0x99)($v0)
/* 2A4F4 800298F4 02802021 */  addu       $a0, $s4, $zero
/* 2A4F8 800298F8 0C01F823 */  jal        get_charsheet
/* 2A4FC 800298FC 34A50200 */   ori       $a1, $a1, 0x200
/* 2A500 80029900 00408821 */  addu       $s1, $v0, $zero
/* 2A504 80029904 1220000A */  beqz       $s1, .L80029930
/* 2A508 80029908 00000000 */   nop
/* 2A50C 8002990C 0C01DEBD */  jal        getHPMax
/* 2A510 80029910 02202021 */   addu      $a0, $s1, $zero
/* 2A514 80029914 02202021 */  addu       $a0, $s1, $zero
/* 2A518 80029918 0C01DED7 */  jal        getHPCurrent
/* 2A51C 8002991C 00408021 */   addu      $s0, $v0, $zero
/* 2A520 80029920 02202021 */  addu       $a0, $s1, $zero
/* 2A524 80029924 02028023 */  subu       $s0, $s0, $v0
/* 2A528 80029928 0C01DFC1 */  jal        addHP
/* 2A52C 8002992C 3205FFFF */   andi      $a1, $s0, 0xffff
.L80029930:
/* 2A530 80029930 0C002CD0 */  jal        set_memUsedMirror
/* 2A534 80029934 00009021 */   addu      $s2, $zero, $zero
/* 2A538 80029938 3C04800F */  lui        $a0, %hi(combatPointer)
/* 2A53C 8002993C 00809821 */  addu       $s3, $a0, $zero
/* 2A540 80029940 8C82F760 */  lw         $v0, %lo(combatPointer)($a0)
/* 2A544 80029944 26B50034 */  addiu      $s5, $s5, 0x34
/* 2A548 80029948 90430001 */  lbu        $v1, 1($v0)
/* 2A54C 8002994C 1060001E */  beqz       $v1, .L800299C8
/* 2A550 80029950 3C16800F */   lui       $s6, 0x800f
.L80029954:
/* 2A554 80029954 8C82F760 */  lw         $v0, -0x8a0($a0)
/* 2A558 80029958 00121880 */  sll        $v1, $s2, 2
/* 2A55C 8002995C 00431021 */  addu       $v0, $v0, $v1
/* 2A560 80029960 8C5152D0 */  lw         $s1, 0x52d0($v0)
/* 2A564 80029964 12200012 */  beqz       $s1, .L800299B0
/* 2A568 80029968 26420001 */   addiu     $v0, $s2, 1
/* 2A56C 8002996C 8E300040 */  lw         $s0, 0x40($s1)
/* 2A570 80029970 12000010 */  beqz       $s0, .L800299B4
/* 2A574 80029974 8E64F760 */   lw        $a0, -0x8a0($s3)
/* 2A578 80029978 02802021 */  addu       $a0, $s4, $zero
/* 2A57C 8002997C 0C01F94B */  jal        characterInParty
/* 2A580 80029980 02002821 */   addu      $a1, $s0, $zero
/* 2A584 80029984 10400005 */  beqz       $v0, .L8002999C
/* 2A588 80029988 00000000 */   nop
/* 2A58C 8002998C 0C01EB11 */  jal        func_8007AC44
/* 2A590 80029990 02002021 */   addu      $a0, $s0, $zero
/* 2A594 80029994 0800A66C */  j          .L800299B0
/* 2A598 80029998 26420001 */   addiu     $v0, $s2, 1
.L8002999C:
/* 2A59C 8002999C 0C01C077 */  jal        clear_combatEnt_effects
/* 2A5A0 800299A0 02202021 */   addu      $a0, $s1, $zero
/* 2A5A4 800299A4 0C01EADA */  jal        clear_charsheet_potions
/* 2A5A8 800299A8 02002021 */   addu      $a0, $s0, $zero
/* 2A5AC 800299AC 26420001 */  addiu      $v0, $s2, 1
.L800299B0:
/* 2A5B0 800299B0 8E64F760 */  lw         $a0, -0x8a0($s3)
.L800299B4:
/* 2A5B4 800299B4 305200FF */  andi       $s2, $v0, 0xff
/* 2A5B8 800299B8 90830001 */  lbu        $v1, 1($a0)
/* 2A5BC 800299BC 0243182B */  sltu       $v1, $s2, $v1
/* 2A5C0 800299C0 1460FFE4 */  bnez       $v1, .L80029954
/* 2A5C4 800299C4 02602021 */   addu      $a0, $s3, $zero
.L800299C8:
/* 2A5C8 800299C8 0C024C7A */  jal        combattargetvisuals_free_
/* 2A5CC 800299CC 00009021 */   addu      $s2, $zero, $zero
/* 2A5D0 800299D0 0C024DA0 */  jal        combatattackvisuals_free
/* 2A5D4 800299D4 00000000 */   nop
/* 2A5D8 800299D8 0C025025 */  jal        combatstatindicator_free
/* 2A5DC 800299DC 00000000 */   nop
/* 2A5E0 800299E0 0C025091 */  jal        NOOP_80094244
/* 2A5E4 800299E4 00000000 */   nop
/* 2A5E8 800299E8 0C02582B */  jal        combatspellvisuals_free
/* 2A5EC 800299EC 00000000 */   nop
/* 2A5F0 800299F0 0C023C53 */  jal        combatmarkers_free
/* 2A5F4 800299F4 00000000 */   nop
/* 2A5F8 800299F8 0C023D74 */  jal        combatgui_free
/* 2A5FC 800299FC 00000000 */   nop
/* 2A600 80029A00 00121080 */  sll        $v0, $s2, 2
.L80029A04:
/* 2A604 80029A04 02A28021 */  addu       $s0, $s5, $v0
/* 2A608 80029A08 8E040000 */  lw         $a0, ($s0)
/* 2A60C 80029A0C 10800005 */  beqz       $a0, .L80029A24
/* 2A610 80029A10 26420001 */   addiu     $v0, $s2, 1
/* 2A614 80029A14 0C0060EF */  jal        FreePlayer
/* 2A618 80029A18 00000000 */   nop
/* 2A61C 80029A1C AE000000 */  sw         $zero, ($s0)
/* 2A620 80029A20 26420001 */  addiu      $v0, $s2, 1
.L80029A24:
/* 2A624 80029A24 305200FF */  andi       $s2, $v0, 0xff
/* 2A628 80029A28 2E43000E */  sltiu      $v1, $s2, 0xe
/* 2A62C 80029A2C 1460FFF5 */  bnez       $v1, .L80029A04
/* 2A630 80029A30 00121080 */   sll       $v0, $s2, 2
/* 2A634 80029A34 0C019D6C */  jal        func_800675B0
/* 2A638 80029A38 8E64F760 */   lw        $a0, -0x8a0($s3)
/* 2A63C 80029A3C 3C05800E */  lui        $a1, %hi(D_800DA280)
/* 2A640 80029A40 24A5A280 */  addiu      $a1, $a1, %lo(D_800DA280)
/* 2A644 80029A44 8E64F760 */  lw         $a0, -0x8a0($s3)
/* 2A648 80029A48 0C02600C */  jal        Free
/* 2A64C 80029A4C 240607B0 */   addiu     $a2, $zero, 0x7b0
/* 2A650 80029A50 00002021 */  addu       $a0, $zero, $zero
/* 2A654 80029A54 0C004687 */  jal        FreeZoneEngine
/* 2A658 80029A58 AE60F760 */   sw        $zero, -0x8a0($s3)
/* 2A65C 80029A5C 3C02800E */  lui        $v0, %hi(SFXStruct)
/* 2A660 80029A60 24507BA0 */  addiu      $s0, $v0, %lo(SFXStruct)
/* 2A664 80029A64 02002021 */  addu       $a0, $s0, $zero
/* 2A668 80029A68 24050001 */  addiu      $a1, $zero, 1
/* 2A66C 80029A6C 24030001 */  addiu      $v1, $zero, 1
/* 2A670 80029A70 3C02800F */  lui        $v0, %hi(D_800E9C14)
/* 2A674 80029A74 0C015871 */  jal        func_800561C4
/* 2A678 80029A78 A4439C14 */   sh        $v1, %lo(D_800E9C14)($v0)
/* 2A67C 80029A7C 8EC29B88 */  lw         $v0, -0x6478($s6)
/* 2A680 80029A80 10400005 */  beqz       $v0, .L80029A98
/* 2A684 80029A84 26C59B88 */   addiu     $a1, $s6, -0x6478
/* 2A688 80029A88 2604032C */  addiu      $a0, $s0, 0x32c
/* 2A68C 80029A8C 24060001 */  addiu      $a2, $zero, 1
/* 2A690 80029A90 0C035867 */  jal        AllocFreeQueueItem
/* 2A694 80029A94 00003821 */   addu      $a3, $zero, $zero
.L80029A98:
/* 2A698 80029A98 0C0250D8 */  jal        func_80094360
/* 2A69C 80029A9C 00000000 */   nop
/* 2A6A0 80029AA0 02802021 */  addu       $a0, $s4, $zero
/* 2A6A4 80029AA4 3C02800F */  lui        $v0, %hi(some_combat_flag_)
/* 2A6A8 80029AA8 0C01F8C6 */  jal        BringOutYourDead
/* 2A6AC 80029AAC AC409B60 */   sw        $zero, %lo(some_combat_flag_)($v0)
/* 2A6B0 80029AB0 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 2A6B4 80029AB4 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 2A6B8 80029AB8 14600004 */  bnez       $v1, .L80029ACC
/* 2A6BC 80029ABC 8FBF002C */   lw        $ra, 0x2c($sp)
/* 2A6C0 80029AC0 0C0290A9 */  jal        set_AnimCache
/* 2A6C4 80029AC4 24040003 */   addiu     $a0, $zero, 3
.L80029AC8:
/* 2A6C8 80029AC8 8FBF002C */  lw         $ra, 0x2c($sp)
.L80029ACC:
/* 2A6CC 80029ACC 8FB60028 */  lw         $s6, 0x28($sp)
/* 2A6D0 80029AD0 8FB50024 */  lw         $s5, 0x24($sp)
/* 2A6D4 80029AD4 8FB40020 */  lw         $s4, 0x20($sp)
/* 2A6D8 80029AD8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2A6DC 80029ADC 8FB20018 */  lw         $s2, 0x18($sp)
/* 2A6E0 80029AE0 8FB10014 */  lw         $s1, 0x14($sp)
/* 2A6E4 80029AE4 8FB00010 */  lw         $s0, 0x10($sp)
/* 2A6E8 80029AE8 03E00008 */  jr         $ra
/* 2A6EC 80029AEC 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80029AF0
/* 2A6F0 80029AF0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2A6F4 80029AF4 00003021 */  addu       $a2, $zero, $zero
/* 2A6F8 80029AF8 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 2A6FC 80029AFC 24487C70 */  addiu      $t0, $v0, %lo(combat_bytes)
/* 2A700 80029B00 3C03800F */  lui        $v1, %hi(combatPointer)
/* 2A704 80029B04 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 2A708 80029B08 00603821 */  addu       $a3, $v1, $zero
/* 2A70C 80029B0C AFBF0014 */  sw         $ra, 0x14($sp)
/* 2A710 80029B10 AFB00010 */  sw         $s0, 0x10($sp)
/* 2A714 80029B14 90440001 */  lbu        $a0, 1($v0)
/* 2A718 80029B18 10800018 */  beqz       $a0, .L80029B7C
/* 2A71C 80029B1C 3C10800F */   lui       $s0, 0x800f
/* 2A720 80029B20 00061080 */  sll        $v0, $a2, 2
.L80029B24:
/* 2A724 80029B24 01021021 */  addu       $v0, $t0, $v0
/* 2A728 80029B28 8C450034 */  lw         $a1, 0x34($v0)
/* 2A72C 80029B2C 10A0000D */  beqz       $a1, .L80029B64
/* 2A730 80029B30 8CE2F760 */   lw        $v0, -0x8a0($a3)
/* 2A734 80029B34 84A30014 */  lh         $v1, 0x14($a1)
/* 2A738 80029B38 2C62001A */  sltiu      $v0, $v1, 0x1a
/* 2A73C 80029B3C 10400007 */  beqz       $v0, .L80029B5C
/* 2A740 80029B40 3C02800E */   lui       $v0, %hi(D_800DA2B8)
/* 2A744 80029B44 2442A2B8 */  addiu      $v0, $v0, %lo(D_800DA2B8)
/* 2A748 80029B48 00031880 */  sll        $v1, $v1, 2
/* 2A74C 80029B4C 00621821 */  addu       $v1, $v1, $v0
/* 2A750 80029B50 8C640000 */  lw         $a0, ($v1)
/* 2A754 80029B54 00800008 */  jr         $a0
/* 2A758 80029B58 00000000 */   nop
.L80029B5C:
/* 2A75C 80029B5C A4A00014 */  sh         $zero, 0x14($a1)
/* 2A760 80029B60 8CE2F760 */  lw         $v0, -0x8a0($a3)
.L80029B64:
/* 2A764 80029B64 24C40001 */  addiu      $a0, $a2, 1
/* 2A768 80029B68 90430001 */  lbu        $v1, 1($v0)
/* 2A76C 80029B6C 3086FFFF */  andi       $a2, $a0, 0xffff
/* 2A770 80029B70 00C3182B */  sltu       $v1, $a2, $v1
/* 2A774 80029B74 1460FFEB */  bnez       $v1, .L80029B24
/* 2A778 80029B78 00061080 */   sll       $v0, $a2, 2
.L80029B7C:
/* 2A77C 80029B7C 0C021380 */  jal        getTerrain
/* 2A780 80029B80 8E041BBC */   lw        $a0, 0x1bbc($s0)
/* 2A784 80029B84 8E041BBC */  lw         $a0, 0x1bbc($s0)
/* 2A788 80029B88 0C02135A */  jal        SetTerrain
/* 2A78C 80029B8C 00402821 */   addu      $a1, $v0, $zero
/* 2A790 80029B90 0C00A815 */  jal        alaron_shadow_merge_attempt
/* 2A794 80029B94 00000000 */   nop
/* 2A798 80029B98 8FBF0014 */  lw         $ra, 0x14($sp)
/* 2A79C 80029B9C 8FB00010 */  lw         $s0, 0x10($sp)
/* 2A7A0 80029BA0 03E00008 */  jr         $ra
/* 2A7A4 80029BA4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80029BA8
/* 2A7A8 80029BA8 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 2A7AC 80029BAC 24020018 */  addiu      $v0, $zero, 0x18
/* 2A7B0 80029BB0 3C04800F */  lui        $a0, %hi(D_800E9B90)
/* 2A7B4 80029BB4 A0627C70 */  sb         $v0, %lo(combat_bytes)($v1)
/* 2A7B8 80029BB8 24020078 */  addiu      $v0, $zero, 0x78
/* 2A7BC 80029BBC 03E00008 */  jr         $ra
/* 2A7C0 80029BC0 A4829B90 */   sh        $v0, %lo(D_800E9B90)($a0)

glabel gamecombat_weapon_func
/* 2A7C4 80029BC4 3C04800F */  lui        $a0, %hi(combatPointer)
/* 2A7C8 80029BC8 8C82F760 */  lw         $v0, %lo(combatPointer)($a0)
/* 2A7CC 80029BCC 27BDFE70 */  addiu      $sp, $sp, -0x190
/* 2A7D0 80029BD0 AFBF0180 */  sw         $ra, 0x180($sp)
/* 2A7D4 80029BD4 AFB5017C */  sw         $s5, 0x17c($sp)
/* 2A7D8 80029BD8 AFB40178 */  sw         $s4, 0x178($sp)
/* 2A7DC 80029BDC AFB30174 */  sw         $s3, 0x174($sp)
/* 2A7E0 80029BE0 AFB20170 */  sw         $s2, 0x170($sp)
/* 2A7E4 80029BE4 AFB1016C */  sw         $s1, 0x16c($sp)
/* 2A7E8 80029BE8 AFB00168 */  sw         $s0, 0x168($sp)
/* 2A7EC 80029BEC F7B40188 */  sdc1       $f20, 0x188($sp)
/* 2A7F0 80029BF0 8C52002C */  lw         $s2, 0x2c($v0)
/* 2A7F4 80029BF4 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 2A7F8 80029BF8 92420020 */  lbu        $v0, 0x20($s2)
/* 2A7FC 80029BFC 24737C70 */  addiu      $s3, $v1, %lo(combat_bytes)
/* 2A800 80029C00 00021080 */  sll        $v0, $v0, 2
/* 2A804 80029C04 02621021 */  addu       $v0, $s3, $v0
/* 2A808 80029C08 8C500034 */  lw         $s0, 0x34($v0)
/* 2A80C 80029C0C 8E020004 */  lw         $v0, 4($s0)
/* 2A810 80029C10 10400016 */  beqz       $v0, .L80029C6C
/* 2A814 80029C14 0080A021 */   addu      $s4, $a0, $zero
/* 2A818 80029C18 8C440008 */  lw         $a0, 8($v0)
/* 2A81C 80029C1C 0C02A1A9 */  jal        HasLocator
/* 2A820 80029C20 92450088 */   lbu       $a1, 0x88($s2)
/* 2A824 80029C24 14400011 */  bnez       $v0, .L80029C6C
/* 2A828 80029C28 27A40018 */   addiu     $a0, $sp, 0x18
/* 2A82C 80029C2C 3C05800E */  lui        $a1, 0x800e
/* 2A830 80029C30 8E030004 */  lw         $v1, 4($s0)
/* 2A834 80029C34 8E480040 */  lw         $t0, 0x40($s2)
/* 2A838 80029C38 8C620008 */  lw         $v0, 8($v1)
/* 2A83C 80029C3C 92470088 */  lbu        $a3, 0x88($s2)
/* 2A840 80029C40 244202AD */  addiu      $v0, $v0, 0x2ad
/* 2A844 80029C44 AFA20010 */  sw         $v0, 0x10($sp)
/* 2A848 80029C48 8D060004 */  lw         $a2, 4($t0)
/* 2A84C 80029C4C 0C0333AC */  jal        sprintf
/* 2A850 80029C50 24A5A320 */   addiu     $a1, $a1, -0x5ce0
/* 2A854 80029C54 27A40018 */  addiu      $a0, $sp, 0x18
/* 2A858 80029C58 3C05800E */  lui        $a1, %hi(D_800DA280)
/* 2A85C 80029C5C 0C025F2D */  jal        manualCrash
/* 2A860 80029C60 24A5A280 */   addiu     $a1, $a1, %lo(D_800DA280)
/* 2A864 80029C64 0800A7C7 */  j          .L80029F1C
/* 2A868 80029C68 8FBF0180 */   lw        $ra, 0x180($sp)
.L80029C6C:
/* 2A86C 80029C6C 0C01BFAE */  jal        func_8006FEB8
/* 2A870 80029C70 02402021 */   addu      $a0, $s2, $zero
/* 2A874 80029C74 3C11800F */  lui        $s1, %hi(AnimationDataPointer)
/* 2A878 80029C78 104000A7 */  beqz       $v0, .L80029F18
/* 2A87C 80029C7C AE229B88 */   sw        $v0, %lo(AnimationDataPointer)($s1)
/* 2A880 80029C80 0C029FFD */  jal        func_800A7FF4
/* 2A884 80029C84 00402021 */   addu      $a0, $v0, $zero
/* 2A888 80029C88 0C029FD9 */  jal        func_800A7F64
/* 2A88C 80029C8C 8E249B88 */   lw        $a0, -0x6478($s1)
/* 2A890 80029C90 0C02A050 */  jal        func_800A8140
/* 2A894 80029C94 8E249B88 */   lw        $a0, -0x6478($s1)
/* 2A898 80029C98 02002021 */  addu       $a0, $s0, $zero
/* 2A89C 80029C9C 0C006251 */  jal        FreeAttachmentFromPlayer
/* 2A8A0 80029CA0 00002821 */   addu      $a1, $zero, $zero
/* 2A8A4 80029CA4 3C02800F */  lui        $v0, %hi(D_800F5400)
/* 2A8A8 80029CA8 24555400 */  addiu      $s5, $v0, %lo(D_800F5400)
/* 2A8AC 80029CAC 8E030004 */  lw         $v1, 4($s0)
/* 2A8B0 80029CB0 92460088 */  lbu        $a2, 0x88($s2)
/* 2A8B4 80029CB4 8C640008 */  lw         $a0, 8($v1)
/* 2A8B8 80029CB8 0C02A22F */  jal        SCeneGetLocatorPos
/* 2A8BC 80029CBC 02A02821 */   addu      $a1, $s5, $zero
/* 2A8C0 80029CC0 8E83F760 */  lw         $v1, -0x8a0($s4)
/* 2A8C4 80029CC4 90620014 */  lbu        $v0, 0x14($v1)
/* 2A8C8 80029CC8 00028880 */  sll        $s1, $v0, 2
/* 2A8CC 80029CCC 02711821 */  addu       $v1, $s3, $s1
/* 2A8D0 80029CD0 8C700034 */  lw         $s0, 0x34($v1)
/* 2A8D4 80029CD4 12000090 */  beqz       $s0, .L80029F18
/* 2A8D8 80029CD8 26040068 */   addiu     $a0, $s0, 0x68
/* 2A8DC 80029CDC 27B30118 */  addiu      $s3, $sp, 0x118
/* 2A8E0 80029CE0 0C02AD17 */  jal        copyVec3
/* 2A8E4 80029CE4 02602821 */   addu      $a1, $s3, $zero
/* 2A8E8 80029CE8 24040003 */  addiu      $a0, $zero, 3
/* 2A8EC 80029CEC 8E82F760 */  lw         $v0, -0x8a0($s4)
/* 2A8F0 80029CF0 92430025 */  lbu        $v1, 0x25($s2)
/* 2A8F4 80029CF4 00511021 */  addu       $v0, $v0, $s1
/* 2A8F8 80029CF8 1064000E */  beq        $v1, $a0, .L80029D34
/* 2A8FC 80029CFC 8C4552D0 */   lw        $a1, 0x52d0($v0)
/* 2A900 80029D00 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 2A904 80029D04 8CA30040 */  lw         $v1, 0x40($a1)
/* 2A908 80029D08 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 2A90C 80029D0C 0C01D60B */  jal        get_entity_2float_sum
/* 2A910 80029D10 94650000 */   lhu       $a1, ($v1)
/* 2A914 80029D14 3C01800E */  lui        $at, %hi(D_800DA364)
/* 2A918 80029D18 C422A364 */  lwc1       $f2, %lo(D_800DA364)($at)
/* 2A91C 80029D1C 46020002 */  mul.s      $f0, $f0, $f2
/* 2A920 80029D20 C6040064 */  lwc1       $f4, 0x64($s0)
/* 2A924 80029D24 46040001 */  sub.s      $f0, $f0, $f4
/* 2A928 80029D28 C7A2011C */  lwc1       $f2, 0x11c($sp)
/* 2A92C 80029D2C 46001080 */  add.s      $f2, $f2, $f0
/* 2A930 80029D30 E7A2011C */  swc1       $f2, 0x11c($sp)
.L80029D34:
/* 2A934 80029D34 02402021 */  addu       $a0, $s2, $zero
/* 2A938 80029D38 27A50158 */  addiu      $a1, $sp, 0x158
/* 2A93C 80029D3C 27A6015C */  addiu      $a2, $sp, 0x15c
/* 2A940 80029D40 3C01800E */  lui        $at, %hi(D_800DA368)
/* 2A944 80029D44 C434A368 */  lwc1       $f20, %lo(D_800DA368)($at)
/* 2A948 80029D48 3C01800E */  lui        $at, %hi(D_800DA36C)
/* 2A94C 80029D4C C420A36C */  lwc1       $f0, %lo(D_800DA36C)($at)
/* 2A950 80029D50 27A70160 */  addiu      $a3, $sp, 0x160
/* 2A954 80029D54 AFA00160 */  sw         $zero, 0x160($sp)
/* 2A958 80029D58 E7B40158 */  swc1       $f20, 0x158($sp)
/* 2A95C 80029D5C 0C01BFE4 */  jal        func_8006FF90
/* 2A960 80029D60 E7A0015C */   swc1      $f0, 0x15c($sp)
/* 2A964 80029D64 3C11800F */  lui        $s1, %hi(D_800F53F0)
/* 2A968 80029D68 263053F0 */  addiu      $s0, $s1, %lo(D_800F53F0)
/* 2A96C 80029D6C 02002021 */  addu       $a0, $s0, $zero
/* 2A970 80029D70 02602821 */  addu       $a1, $s3, $zero
/* 2A974 80029D74 0C02AB26 */  jal        Vec3A_BsubC
/* 2A978 80029D78 02A03021 */   addu      $a2, $s5, $zero
/* 2A97C 80029D7C 0C02ABBB */  jal        vec3_normalize
/* 2A980 80029D80 02002021 */   addu      $a0, $s0, $zero
/* 2A984 80029D84 3C02800F */  lui        $v0, 0x800f
/* 2A988 80029D88 3C01800E */  lui        $at, %hi(D_800DA370)
/* 2A98C 80029D8C C422A370 */  lwc1       $f2, %lo(D_800DA370)($at)
/* 2A990 80029D90 00402821 */  addu       $a1, $v0, $zero
/* 2A994 80029D94 4600103C */  c.lt.s     $f2, $f0
/* 2A998 80029D98 00000000 */  nop
/* 2A99C 80029D9C 45000005 */  bc1f       .L80029DB4
/* 2A9A0 80029DA0 E4409B70 */   swc1      $f0, -0x6490($v0)
/* 2A9A4 80029DA4 3C01800E */  lui        $at, %hi(D_800DA374)
/* 2A9A8 80029DA8 C422A374 */  lwc1       $f2, %lo(D_800DA374)($at)
/* 2A9AC 80029DAC 0800A773 */  j          .L80029DCC
/* 2A9B0 80029DB0 3C02800F */   lui       $v0, 0x800f
.L80029DB4:
/* 2A9B4 80029DB4 46020003 */  div.s      $f0, $f0, $f2
/* 2A9B8 80029DB8 46140002 */  mul.s      $f0, $f0, $f20
/* 2A9BC 80029DBC 3C01800E */  lui        $at, %hi(D_800DA378)
/* 2A9C0 80029DC0 C422A378 */  lwc1       $f2, %lo(D_800DA378)($at)
/* 2A9C4 80029DC4 46020080 */  add.s      $f2, $f0, $f2
/* 2A9C8 80029DC8 3C02800F */  lui        $v0, %hi(D_800E9B74)
.L80029DCC:
/* 2A9CC 80029DCC C7A00158 */  lwc1       $f0, 0x158($sp)
/* 2A9D0 80029DD0 24439B74 */  addiu      $v1, $v0, %lo(D_800E9B74)
/* 2A9D4 80029DD4 46020080 */  add.s      $f2, $f0, $f2
/* 2A9D8 80029DD8 3C01800E */  lui        $at, %hi(D_800DA37C)
/* 2A9DC 80029DDC C424A37C */  lwc1       $f4, %lo(D_800DA37C)($at)
/* 2A9E0 80029DE0 4602203C */  c.lt.s     $f4, $f2
/* 2A9E4 80029DE4 00000000 */  nop
/* 2A9E8 80029DE8 45010008 */  bc1t       .L80029E0C
/* 2A9EC 80029DEC 00403021 */   addu      $a2, $v0, $zero
/* 2A9F0 80029DF0 3C01800E */  lui        $at, %hi(D_800DA380)
/* 2A9F4 80029DF4 C420A380 */  lwc1       $f0, %lo(D_800DA380)($at)
/* 2A9F8 80029DF8 4600103C */  c.lt.s     $f2, $f0
/* 2A9FC 80029DFC 00000000 */  nop
/* 2AA00 80029E00 4503000B */  bc1tl      .L80029E30
/* 2AA04 80029E04 C4A29B70 */   lwc1      $f2, -0x6490($a1)
/* 2AA08 80029E08 4602203C */  c.lt.s     $f4, $f2
.L80029E0C:
/* 2AA0C 80029E0C 3C01800E */  lui        $at, %hi(D_800DA384)
/* 2AA10 80029E10 C420A384 */  lwc1       $f0, %lo(D_800DA384)($at)
/* 2AA14 80029E14 45030008 */  bc1tl      .L80029E38
/* 2AA18 80029E18 C4A29B70 */   lwc1      $f2, -0x6490($a1)
/* 2AA1C 80029E1C 3C01800E */  lui        $at, %hi(D_800DA388)
/* 2AA20 80029E20 C420A388 */  lwc1       $f0, %lo(D_800DA388)($at)
/* 2AA24 80029E24 46001002 */  mul.s      $f0, $f2, $f0
/* 2AA28 80029E28 0800A78E */  j          .L80029E38
/* 2AA2C 80029E2C C4A29B70 */   lwc1      $f2, -0x6490($a1)
.L80029E30:
/* 2AA30 80029E30 3C01800E */  lui        $at, %hi(D_800DA38C)
/* 2AA34 80029E34 C420A38C */  lwc1       $f0, %lo(D_800DA38C)($at)
.L80029E38:
/* 2AA38 80029E38 3C01800E */  lui        $at, %hi(D_800DA390)
/* 2AA3C 80029E3C C424A390 */  lwc1       $f4, %lo(D_800DA390)($at)
/* 2AA40 80029E40 4602203C */  c.lt.s     $f4, $f2
/* 2AA44 80029E44 00000000 */  nop
/* 2AA48 80029E48 45000005 */  bc1f       .L80029E60
/* 2AA4C 80029E4C E4600000 */   swc1      $f0, ($v1)
/* 2AA50 80029E50 3C01800E */  lui        $at, %hi(D_800DA394)
/* 2AA54 80029E54 C422A394 */  lwc1       $f2, %lo(D_800DA394)($at)
/* 2AA58 80029E58 0800A7A0 */  j          .L80029E80
/* 2AA5C 80029E5C C7A00158 */   lwc1      $f0, 0x158($sp)
.L80029E60:
/* 2AA60 80029E60 3C01800E */  lui        $at, %hi(D_800DA398)
/* 2AA64 80029E64 C420A398 */  lwc1       $f0, %lo(D_800DA398)($at)
/* 2AA68 80029E68 46041083 */  div.s      $f2, $f2, $f4
/* 2AA6C 80029E6C 46001082 */  mul.s      $f2, $f2, $f0
/* 2AA70 80029E70 3C01800E */  lui        $at, %hi(D_800DA39C)
/* 2AA74 80029E74 C424A39C */  lwc1       $f4, %lo(D_800DA39C)($at)
/* 2AA78 80029E78 46041080 */  add.s      $f2, $f2, $f4
/* 2AA7C 80029E7C C7A00158 */  lwc1       $f0, 0x158($sp)
.L80029E80:
/* 2AA80 80029E80 3C01800E */  lui        $at, %hi(D_800DA3A0)
/* 2AA84 80029E84 C424A3A0 */  lwc1       $f4, %lo(D_800DA3A0)($at)
/* 2AA88 80029E88 46002001 */  sub.s      $f0, $f4, $f0
/* 2AA8C 80029E8C 46020080 */  add.s      $f2, $f0, $f2
/* 2AA90 80029E90 3C02800F */  lui        $v0, %hi(D_800E9B78)
/* 2AA94 80029E94 4602203C */  c.lt.s     $f4, $f2
/* 2AA98 80029E98 00000000 */  nop
/* 2AA9C 80029E9C 45010008 */  bc1t       .L80029EC0
/* 2AAA0 80029EA0 24429B78 */   addiu     $v0, $v0, %lo(D_800E9B78)
/* 2AAA4 80029EA4 3C01800E */  lui        $at, %hi(D_800DA3A4)
/* 2AAA8 80029EA8 C420A3A4 */  lwc1       $f0, %lo(D_800DA3A4)($at)
/* 2AAAC 80029EAC 4600103C */  c.lt.s     $f2, $f0
/* 2AAB0 80029EB0 00000000 */  nop
/* 2AAB4 80029EB4 4501000B */  bc1t       .L80029EE4
/* 2AAB8 80029EB8 8CC59B74 */   lw        $a1, -0x648c($a2)
/* 2AABC 80029EBC 4602203C */  c.lt.s     $f4, $f2
.L80029EC0:
/* 2AAC0 80029EC0 3C01800E */  lui        $at, %hi(D_800DA3A8)
/* 2AAC4 80029EC4 C420A3A8 */  lwc1       $f0, %lo(D_800DA3A8)($at)
/* 2AAC8 80029EC8 45010008 */  bc1t       .L80029EEC
/* 2AACC 80029ECC 8CC59B74 */   lw        $a1, -0x648c($a2)
/* 2AAD0 80029ED0 3C01800E */  lui        $at, %hi(D_800DA3AC)
/* 2AAD4 80029ED4 C420A3AC */  lwc1       $f0, %lo(D_800DA3AC)($at)
/* 2AAD8 80029ED8 46001002 */  mul.s      $f0, $f2, $f0
/* 2AADC 80029EDC 0800A7BC */  j          .L80029EF0
/* 2AAE0 80029EE0 262453F0 */   addiu     $a0, $s1, 0x53f0
.L80029EE4:
/* 2AAE4 80029EE4 3C01800E */  lui        $at, %hi(D_800DA3B0)
/* 2AAE8 80029EE8 C420A3B0 */  lwc1       $f0, %lo(D_800DA3B0)($at)
.L80029EEC:
/* 2AAEC 80029EEC 262453F0 */  addiu      $a0, $s1, 0x53f0
.L80029EF0:
/* 2AAF0 80029EF0 E4400000 */  swc1       $f0, ($v0)
/* 2AAF4 80029EF4 C7A0015C */  lwc1       $f0, 0x15c($sp)
/* 2AAF8 80029EF8 C7A20160 */  lwc1       $f2, 0x160($sp)
/* 2AAFC 80029EFC 3C02800F */  lui        $v0, %hi(D_800E9B80)
/* 2AB00 80029F00 AC409B80 */  sw         $zero, %lo(D_800E9B80)($v0)
/* 2AB04 80029F04 3C02800F */  lui        $v0, %hi(D_800E9B7C)
/* 2AB08 80029F08 E4409B7C */  swc1       $f0, %lo(D_800E9B7C)($v0)
/* 2AB0C 80029F0C 3C02800F */  lui        $v0, %hi(D_800E9B84)
/* 2AB10 80029F10 0C02AD3C */  jal        multiVec3
/* 2AB14 80029F14 E4429B84 */   swc1      $f2, %lo(D_800E9B84)($v0)
.L80029F18:
/* 2AB18 80029F18 8FBF0180 */  lw         $ra, 0x180($sp)
.L80029F1C:
/* 2AB1C 80029F1C 8FB5017C */  lw         $s5, 0x17c($sp)
/* 2AB20 80029F20 8FB40178 */  lw         $s4, 0x178($sp)
/* 2AB24 80029F24 8FB30174 */  lw         $s3, 0x174($sp)
/* 2AB28 80029F28 8FB20170 */  lw         $s2, 0x170($sp)
/* 2AB2C 80029F2C 8FB1016C */  lw         $s1, 0x16c($sp)
/* 2AB30 80029F30 8FB00168 */  lw         $s0, 0x168($sp)
/* 2AB34 80029F34 D7B40188 */  ldc1       $f20, 0x188($sp)
/* 2AB38 80029F38 03E00008 */  jr         $ra
/* 2AB3C 80029F3C 27BD0190 */   addiu     $sp, $sp, 0x190

glabel random_enemy_generator
/* 2AB40 80029F40 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 2AB44 80029F44 24040001 */  addiu      $a0, $zero, 1
/* 2AB48 80029F48 2405000C */  addiu      $a1, $zero, 0xc
/* 2AB4C 80029F4C 3C02800E */  lui        $v0, %hi(encounter_dat)
/* 2AB50 80029F50 AFB60028 */  sw         $s6, 0x28($sp)
/* 2AB54 80029F54 24567C74 */  addiu      $s6, $v0, %lo(encounter_dat)
/* 2AB58 80029F58 AFBF002C */  sw         $ra, 0x2c($sp)
/* 2AB5C 80029F5C AFB50024 */  sw         $s5, 0x24($sp)
/* 2AB60 80029F60 AFB40020 */  sw         $s4, 0x20($sp)
/* 2AB64 80029F64 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2AB68 80029F68 AFB20018 */  sw         $s2, 0x18($sp)
/* 2AB6C 80029F6C AFB10014 */  sw         $s1, 0x14($sp)
/* 2AB70 80029F70 0C002CF7 */  jal        rand_range
/* 2AB74 80029F74 AFB00010 */   sw        $s0, 0x10($sp)
/* 2AB78 80029F78 3054FFFF */  andi       $s4, $v0, 0xffff
/* 2AB7C 80029F7C 12800022 */  beqz       $s4, .L8002A008
/* 2AB80 80029F80 00001821 */   addu      $v1, $zero, $zero
/* 2AB84 80029F84 3C15800F */  lui        $s5, %hi(EntityPointer)
/* 2AB88 80029F88 00008821 */  addu       $s1, $zero, $zero
.L80029F8C:
/* 2AB8C 80029F8C 24730001 */  addiu      $s3, $v1, 1
/* 2AB90 80029F90 00031040 */  sll        $v0, $v1, 1
/* 2AB94 80029F94 02C29021 */  addu       $s2, $s6, $v0
/* 2AB98 80029F98 8EA213A0 */  lw         $v0, %lo(EntityPointer)($s5)
.L80029F9C:
/* 2AB9C 80029F9C 90450000 */  lbu        $a1, ($v0)
/* 2ABA0 80029FA0 00002021 */  addu       $a0, $zero, $zero
/* 2ABA4 80029FA4 0C002CF7 */  jal        rand_range
/* 2ABA8 80029FA8 24A5FFFF */   addiu     $a1, $a1, -1
/* 2ABAC 80029FAC 8EA313A0 */  lw         $v1, 0x13a0($s5)
/* 2ABB0 80029FB0 8C640010 */  lw         $a0, 0x10($v1)
/* 2ABB4 80029FB4 000211C0 */  sll        $v0, $v0, 7
/* 2ABB8 80029FB8 00441021 */  addu       $v0, $v0, $a0
/* 2ABBC 80029FBC 94500000 */  lhu        $s0, ($v0)
/* 2ABC0 80029FC0 0C019490 */  jal        EntityCannotFight
/* 2ABC4 80029FC4 02002021 */   addu      $a0, $s0, $zero
/* 2ABC8 80029FC8 14400003 */  bnez       $v0, .L80029FD8
/* 2ABCC 80029FCC 00000000 */   nop
/* 2ABD0 80029FD0 24110001 */  addiu      $s1, $zero, 1
/* 2ABD4 80029FD4 A6500000 */  sh         $s0, ($s2)
.L80029FD8:
/* 2ABD8 80029FD8 1220FFF0 */  beqz       $s1, .L80029F9C
/* 2ABDC 80029FDC 8EA213A0 */   lw        $v0, 0x13a0($s5)
/* 2ABE0 80029FE0 3263FFFF */  andi       $v1, $s3, 0xffff
/* 2ABE4 80029FE4 0074102B */  sltu       $v0, $v1, $s4
/* 2ABE8 80029FE8 1440FFE8 */  bnez       $v0, .L80029F8C
/* 2ABEC 80029FEC 00008821 */   addu      $s1, $zero, $zero
/* 2ABF0 80029FF0 0800A803 */  j          .L8002A00C
/* 2ABF4 80029FF4 2C62000C */   sltiu     $v0, $v1, 0xc
.L80029FF8:
/* 2ABF8 80029FF8 02C21021 */  addu       $v0, $s6, $v0
/* 2ABFC 80029FFC A4400000 */  sh         $zero, ($v0)
/* 2AC00 8002A000 24630001 */  addiu      $v1, $v1, 1
/* 2AC04 8002A004 3063FFFF */  andi       $v1, $v1, 0xffff
.L8002A008:
/* 2AC08 8002A008 2C62000C */  sltiu      $v0, $v1, 0xc
.L8002A00C:
/* 2AC0C 8002A00C 5440FFFA */  bnel       $v0, $zero, .L80029FF8
/* 2AC10 8002A010 00031040 */   sll       $v0, $v1, 1
/* 2AC14 8002A014 8FBF002C */  lw         $ra, 0x2c($sp)
/* 2AC18 8002A018 8FB60028 */  lw         $s6, 0x28($sp)
/* 2AC1C 8002A01C 8FB50024 */  lw         $s5, 0x24($sp)
/* 2AC20 8002A020 8FB40020 */  lw         $s4, 0x20($sp)
/* 2AC24 8002A024 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2AC28 8002A028 8FB20018 */  lw         $s2, 0x18($sp)
/* 2AC2C 8002A02C 8FB10014 */  lw         $s1, 0x14($sp)
/* 2AC30 8002A030 8FB00010 */  lw         $s0, 0x10($sp)
/* 2AC34 8002A034 03E00008 */  jr         $ra
/* 2AC38 8002A038 27BD0030 */   addiu     $sp, $sp, 0x30

glabel clear_alaron_shadow_indices
/* 2AC3C 8002A03C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2AC40 8002A040 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 2AC44 8002A044 240300FF */  addiu      $v1, $zero, 0xff
/* 2AC48 8002A048 A0431440 */  sb         $v1, 0x1440($v0)
/* 2AC4C 8002A04C 03E00008 */  jr         $ra
/* 2AC50 8002A050 A0431441 */   sb        $v1, 0x1441($v0)

glabel alaron_shadow_merge_attempt
/* 2AC54 8002A054 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2AC58 8002A058 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2AC5C 8002A05C 244668A8 */  addiu      $a2, $v0, %lo(gGlobals)
/* 2AC60 8002A060 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2AC64 8002A064 F7B40018 */  sdc1       $f20, 0x18($sp)
/* 2AC68 8002A068 90C313C8 */  lbu        $v1, 0x13c8($a2)
/* 2AC6C 8002A06C 24020011 */  addiu      $v0, $zero, 0x11
/* 2AC70 8002A070 10620034 */  beq        $v1, $v0, .L8002A144
/* 2AC74 8002A074 2402001D */   addiu     $v0, $zero, 0x1d
/* 2AC78 8002A078 10620032 */  beq        $v1, $v0, .L8002A144
/* 2AC7C 8002A07C 2402001E */   addiu     $v0, $zero, 0x1e
/* 2AC80 8002A080 10620030 */  beq        $v1, $v0, .L8002A144
/* 2AC84 8002A084 240300FF */   addiu     $v1, $zero, 0xff
/* 2AC88 8002A088 90C21440 */  lbu        $v0, 0x1440($a2)
/* 2AC8C 8002A08C 1043002D */  beq        $v0, $v1, .L8002A144
/* 2AC90 8002A090 90C51441 */   lbu       $a1, 0x1441($a2)
/* 2AC94 8002A094 10A3002B */  beq        $a1, $v1, .L8002A144
/* 2AC98 8002A098 3C03800F */   lui       $v1, %hi(combatPointer)
/* 2AC9C 8002A09C 00021080 */  sll        $v0, $v0, 2
/* 2ACA0 8002A0A0 8C64F760 */  lw         $a0, %lo(combatPointer)($v1)
/* 2ACA4 8002A0A4 00052880 */  sll        $a1, $a1, 2
/* 2ACA8 8002A0A8 248452D0 */  addiu      $a0, $a0, 0x52d0
/* 2ACAC 8002A0AC 00821021 */  addu       $v0, $a0, $v0
/* 2ACB0 8002A0B0 8C430000 */  lw         $v1, ($v0)
/* 2ACB4 8002A0B4 00852021 */  addu       $a0, $a0, $a1
/* 2ACB8 8002A0B8 90620020 */  lbu        $v0, 0x20($v1)
/* 2ACBC 8002A0BC 24C513FC */  addiu      $a1, $a2, 0x13fc
/* 2ACC0 8002A0C0 00021080 */  sll        $v0, $v0, 2
/* 2ACC4 8002A0C4 00451021 */  addu       $v0, $v0, $a1
/* 2ACC8 8002A0C8 8C430000 */  lw         $v1, ($v0)
/* 2ACCC 8002A0CC 1060001D */  beqz       $v1, .L8002A144
/* 2ACD0 8002A0D0 8C840000 */   lw        $a0, ($a0)
/* 2ACD4 8002A0D4 90820020 */  lbu        $v0, 0x20($a0)
/* 2ACD8 8002A0D8 00021080 */  sll        $v0, $v0, 2
/* 2ACDC 8002A0DC 00451021 */  addu       $v0, $v0, $a1
/* 2ACE0 8002A0E0 8C420000 */  lw         $v0, ($v0)
/* 2ACE4 8002A0E4 10400017 */  beqz       $v0, .L8002A144
/* 2ACE8 8002A0E8 24640068 */   addiu     $a0, $v1, 0x68
/* 2ACEC 8002A0EC C4740034 */  lwc1       $f20, 0x34($v1)
/* 2ACF0 8002A0F0 C4400034 */  lwc1       $f0, 0x34($v0)
/* 2ACF4 8002A0F4 4600A500 */  add.s      $f20, $f20, $f0
/* 2ACF8 8002A0F8 3C01800E */  lui        $at, %hi(D_800DA3B4)
/* 2ACFC 8002A0FC C422A3B4 */  lwc1       $f2, %lo(D_800DA3B4)($at)
/* 2AD00 8002A100 4602A500 */  add.s      $f20, $f20, $f2
/* 2AD04 8002A104 0C02AB66 */  jal        get_vec3_proximity
/* 2AD08 8002A108 24450068 */   addiu     $a1, $v0, 0x68
/* 2AD0C 8002A10C 4600A03C */  c.lt.s     $f20, $f0
/* 2AD10 8002A110 00000000 */  nop
/* 2AD14 8002A114 4501000C */  bc1t       .L8002A148
/* 2AD18 8002A118 8FBF0010 */   lw        $ra, 0x10($sp)
/* 2AD1C 8002A11C 0C00A89D */  jal        HasHornOfKynon
/* 2AD20 8002A120 00000000 */   nop
/* 2AD24 8002A124 10400005 */  beqz       $v0, .L8002A13C
/* 2AD28 8002A128 00000000 */   nop
/* 2AD2C 8002A12C 0C00A855 */  jal        shadow_merge_cinematic
/* 2AD30 8002A130 00000000 */   nop
/* 2AD34 8002A134 0800A852 */  j          .L8002A148
/* 2AD38 8002A138 8FBF0010 */   lw        $ra, 0x10($sp)
.L8002A13C:
/* 2AD3C 8002A13C 0C00A861 */  jal        merge_no_horn
/* 2AD40 8002A140 00000000 */   nop
.L8002A144:
/* 2AD44 8002A144 8FBF0010 */  lw         $ra, 0x10($sp)
.L8002A148:
/* 2AD48 8002A148 D7B40018 */  ldc1       $f20, 0x18($sp)
/* 2AD4C 8002A14C 03E00008 */  jr         $ra
/* 2AD50 8002A150 27BD0020 */   addiu     $sp, $sp, 0x20

glabel shadow_merge_cinematic
/* 2AD54 8002A154 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2AD58 8002A158 3C03800E */  lui        $v1, 0x800e
/* 2AD5C 8002A15C 24020011 */  addiu      $v0, $zero, 0x11
/* 2AD60 8002A160 24040001 */  addiu      $a0, $zero, 1
/* 2AD64 8002A164 24050004 */  addiu      $a1, $zero, 4
/* 2AD68 8002A168 24060001 */  addiu      $a2, $zero, 1
/* 2AD6C 8002A16C AFBF0010 */  sw         $ra, 0x10($sp)
/* 2AD70 8002A170 0C0171AC */  jal        load_cinematic
/* 2AD74 8002A174 A0627C70 */   sb        $v0, 0x7c70($v1)
/* 2AD78 8002A178 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2AD7C 8002A17C 03E00008 */  jr         $ra
/* 2AD80 8002A180 27BD0018 */   addiu     $sp, $sp, 0x18

glabel merge_no_horn
/* 2AD84 8002A184 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 2AD88 8002A188 AFBF0018 */  sw         $ra, 0x18($sp)
/* 2AD8C 8002A18C AFB10014 */  sw         $s1, 0x14($sp)
/* 2AD90 8002A190 0C00A89D */  jal        HasHornOfKynon
/* 2AD94 8002A194 AFB00010 */   sw        $s0, 0x10($sp)
/* 2AD98 8002A198 10400005 */  beqz       $v0, .L8002A1B0
/* 2AD9C 8002A19C 3C02800E */   lui       $v0, %hi(gGlobals)
/* 2ADA0 8002A1A0 0C00A855 */  jal        shadow_merge_cinematic
/* 2ADA4 8002A1A4 00000000 */   nop
/* 2ADA8 8002A1A8 0800A88B */  j          .L8002A22C
/* 2ADAC 8002A1AC 8FBF0018 */   lw        $ra, 0x18($sp)
.L8002A1B0:
/* 2ADB0 8002A1B0 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 2ADB4 8002A1B4 3C10800F */  lui        $s0, %hi(combatPointer)
/* 2ADB8 8002A1B8 8E04F760 */  lw         $a0, %lo(combatPointer)($s0)
/* 2ADBC 8002A1BC 2402001D */  addiu      $v0, $zero, 0x1d
/* 2ADC0 8002A1C0 A22213C8 */  sb         $v0, 0x13c8($s1)
/* 2ADC4 8002A1C4 8C834FC0 */  lw         $v1, 0x4fc0($a0)
/* 2ADC8 8002A1C8 8C6500F0 */  lw         $a1, 0xf0($v1)
/* 2ADCC 8002A1CC 0C019DE8 */  jal        copy_string_to_combat_textbox
/* 2ADD0 8002A1D0 00003021 */   addu      $a2, $zero, $zero
/* 2ADD4 8002A1D4 8E03F760 */  lw         $v1, -0x8a0($s0)
/* 2ADD8 8002A1D8 90620001 */  lbu        $v0, 1($v1)
/* 2ADDC 8002A1DC 10400012 */  beqz       $v0, .L8002A228
/* 2ADE0 8002A1E0 00002021 */   addu      $a0, $zero, $zero
/* 2ADE4 8002A1E4 262613FC */  addiu      $a2, $s1, 0x13fc
/* 2ADE8 8002A1E8 00602821 */  addu       $a1, $v1, $zero
/* 2ADEC 8002A1EC 24A352D0 */  addiu      $v1, $a1, 0x52d0
.L8002A1F0:
/* 2ADF0 8002A1F0 8C620000 */  lw         $v0, ($v1)
/* 2ADF4 8002A1F4 50400008 */  beql       $v0, $zero, .L8002A218
/* 2ADF8 8002A1F8 90A20001 */   lbu       $v0, 1($a1)
/* 2ADFC 8002A1FC 90420020 */  lbu        $v0, 0x20($v0)
/* 2AE00 8002A200 00021080 */  sll        $v0, $v0, 2
/* 2AE04 8002A204 00461021 */  addu       $v0, $v0, $a2
/* 2AE08 8002A208 8C420000 */  lw         $v0, ($v0)
/* 2AE0C 8002A20C 54400001 */  bnel       $v0, $zero, .L8002A214
/* 2AE10 8002A210 A4400014 */   sh        $zero, 0x14($v0)
.L8002A214:
/* 2AE14 8002A214 90A20001 */  lbu        $v0, 1($a1)
.L8002A218:
/* 2AE18 8002A218 24840001 */  addiu      $a0, $a0, 1
/* 2AE1C 8002A21C 0082102B */  sltu       $v0, $a0, $v0
/* 2AE20 8002A220 1440FFF3 */  bnez       $v0, .L8002A1F0
/* 2AE24 8002A224 24630004 */   addiu     $v1, $v1, 4
.L8002A228:
/* 2AE28 8002A228 8FBF0018 */  lw         $ra, 0x18($sp)
.L8002A22C:
/* 2AE2C 8002A22C 8FB10014 */  lw         $s1, 0x14($sp)
/* 2AE30 8002A230 8FB00010 */  lw         $s0, 0x10($sp)
/* 2AE34 8002A234 03E00008 */  jr         $ra
/* 2AE38 8002A238 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_shadow_index
/* 2AE3C 8002A23C 3C02800E */  lui        $v0, %hi(shadow_index)
/* 2AE40 8002A240 03E00008 */  jr         $ra
/* 2AE44 8002A244 A0447CE8 */   sb        $a0, %lo(shadow_index)($v0)

glabel set_alaron_index
/* 2AE48 8002A248 3C02800E */  lui        $v0, %hi(alaron_index)
/* 2AE4C 8002A24C 03E00008 */  jr         $ra
/* 2AE50 8002A250 A0447CE9 */   sb        $a0, %lo(alaron_index)($v0)

glabel clear_shadow_index
/* 2AE54 8002A254 3C03800E */  lui        $v1, %hi(shadow_index)
/* 2AE58 8002A258 240200FF */  addiu      $v0, $zero, 0xff
/* 2AE5C 8002A25C 03E00008 */  jr         $ra
/* 2AE60 8002A260 A0627CE8 */   sb        $v0, %lo(shadow_index)($v1)

glabel clear_alaron_index
/* 2AE64 8002A264 3C03800E */  lui        $v1, %hi(alaron_index)
/* 2AE68 8002A268 240200FF */  addiu      $v0, $zero, 0xff
/* 2AE6C 8002A26C 03E00008 */  jr         $ra
/* 2AE70 8002A270 A0627CE9 */   sb        $v0, %lo(alaron_index)($v1)

glabel HasHornOfKynon
/* 2AE74 8002A274 3C02800E */  lui        $v0, %hi(partyPointer)
/* 2AE78 8002A278 3C03800F */  lui        $v1, %hi(itemID_array+0xB2)
/* 2AE7C 8002A27C 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 2AE80 8002A280 946515B2 */  lhu        $a1, %lo(itemID_array+0xB2)($v1)
/* 2AE84 8002A284 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2AE88 8002A288 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2AE8C 8002A28C 0C020C0B */  jal        hasItem
/* 2AE90 8002A290 00000000 */   nop
/* 2AE94 8002A294 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2AE98 8002A298 03E00008 */  jr         $ra
/* 2AE9C 8002A29C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8002A2A0
/* 2AEA0 8002A2A0 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 2AEA4 8002A2A4 3C02800E */  lui        $v0, %hi(shadow_index)
/* 2AEA8 8002A2A8 AFB30024 */  sw         $s3, 0x24($sp)
/* 2AEAC 8002A2AC 90537CE8 */  lbu        $s3, %lo(shadow_index)($v0)
/* 2AEB0 8002A2B0 240300FF */  addiu      $v1, $zero, 0xff
/* 2AEB4 8002A2B4 AFBF0038 */  sw         $ra, 0x38($sp)
/* 2AEB8 8002A2B8 AFB70034 */  sw         $s7, 0x34($sp)
/* 2AEBC 8002A2BC AFB60030 */  sw         $s6, 0x30($sp)
/* 2AEC0 8002A2C0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 2AEC4 8002A2C4 AFB40028 */  sw         $s4, 0x28($sp)
/* 2AEC8 8002A2C8 AFB20020 */  sw         $s2, 0x20($sp)
/* 2AECC 8002A2CC AFB1001C */  sw         $s1, 0x1c($sp)
/* 2AED0 8002A2D0 AFB00018 */  sw         $s0, 0x18($sp)
/* 2AED4 8002A2D4 F7B40040 */  sdc1       $f20, 0x40($sp)
/* 2AED8 8002A2D8 12630082 */  beq        $s3, $v1, .L8002A4E4
/* 2AEDC 8002A2DC 00001021 */   addu      $v0, $zero, $zero
/* 2AEE0 8002A2E0 0C00A89D */  jal        HasHornOfKynon
/* 2AEE4 8002A2E4 3C16800F */   lui       $s6, %hi(combatPointer)
/* 2AEE8 8002A2E8 1440000C */  bnez       $v0, .L8002A31C
/* 2AEEC 8002A2EC 02C02821 */   addu      $a1, $s6, $zero
/* 2AEF0 8002A2F0 8EC4F760 */  lw         $a0, %lo(combatPointer)($s6)
/* 2AEF4 8002A2F4 8C8352C8 */  lw         $v1, 0x52c8($a0)
/* 2AEF8 8002A2F8 2C620004 */  sltiu      $v0, $v1, 4
/* 2AEFC 8002A2FC 14400005 */  bnez       $v0, .L8002A314
/* 2AF00 8002A300 24620001 */   addiu     $v0, $v1, 1
.L8002A304:
/* 2AF04 8002A304 0C00A861 */  jal        merge_no_horn
/* 2AF08 8002A308 00000000 */   nop
/* 2AF0C 8002A30C 0800A939 */  j          .L8002A4E4
/* 2AF10 8002A310 24020001 */   addiu     $v0, $zero, 1
.L8002A314:
/* 2AF14 8002A314 AC8252C8 */  sw         $v0, 0x52c8($a0)
/* 2AF18 8002A318 02C02821 */  addu       $a1, $s6, $zero
.L8002A31C:
/* 2AF1C 8002A31C 00009021 */  addu       $s2, $zero, $zero
/* 2AF20 8002A320 8CA2F760 */  lw         $v0, -0x8a0($a1)
/* 2AF24 8002A324 00131880 */  sll        $v1, $s3, 2
/* 2AF28 8002A328 00431821 */  addu       $v1, $v0, $v1
/* 2AF2C 8002A32C 90440001 */  lbu        $a0, 1($v0)
/* 2AF30 8002A330 1080006B */  beqz       $a0, .L8002A4E0
/* 2AF34 8002A334 8C7552D0 */   lw        $s5, 0x52d0($v1)
/* 2AF38 8002A338 3C148000 */  lui        $s4, 0x8000
/* 2AF3C 8002A33C 3C02800E */  lui        $v0, %hi(combat_PlayerData)
/* 2AF40 8002A340 24577CA4 */  addiu      $s7, $v0, %lo(combat_PlayerData)
.L8002A344:
/* 2AF44 8002A344 1253005E */  beq        $s2, $s3, .L8002A4C0
/* 2AF48 8002A348 8CA2F760 */   lw        $v0, -0x8a0($a1)
/* 2AF4C 8002A34C 00121880 */  sll        $v1, $s2, 2
/* 2AF50 8002A350 00431021 */  addu       $v0, $v0, $v1
/* 2AF54 8002A354 8C5052D0 */  lw         $s0, 0x52d0($v0)
/* 2AF58 8002A358 1200005A */  beqz       $s0, .L8002A4C4
/* 2AF5C 8002A35C 02C02821 */   addu      $a1, $s6, $zero
/* 2AF60 8002A360 0C01A085 */  jal        CombatEnt_flag_6
/* 2AF64 8002A364 02002021 */   addu      $a0, $s0, $zero
/* 2AF68 8002A368 14400056 */  bnez       $v0, .L8002A4C4
/* 2AF6C 8002A36C 02C02821 */   addu      $a1, $s6, $zero
/* 2AF70 8002A370 8E110040 */  lw         $s1, 0x40($s0)
/* 2AF74 8002A374 12200054 */  beqz       $s1, .L8002A4C8
/* 2AF78 8002A378 8CA2F760 */   lw        $v0, -0x8a0($a1)
/* 2AF7C 8002A37C 0C01DF1D */  jal        isDead
/* 2AF80 8002A380 02202021 */   addu      $a0, $s1, $zero
/* 2AF84 8002A384 1440004F */  bnez       $v0, .L8002A4C4
/* 2AF88 8002A388 02C02821 */   addu      $a1, $s6, $zero
/* 2AF8C 8002A38C 00002821 */  addu       $a1, $zero, $zero
/* 2AF90 8002A390 96240000 */  lhu        $a0, ($s1)
/* 2AF94 8002A394 0C01D77A */  jal        GetIDIndex
/* 2AF98 8002A398 00003021 */   addu      $a2, $zero, $zero
/* 2AF9C 8002A39C 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 2AFA0 8002A3A0 8C6413A0 */  lw         $a0, %lo(EntityPointer)($v1)
/* 2AFA4 8002A3A4 8C850010 */  lw         $a1, 0x10($a0)
/* 2AFA8 8002A3A8 000211C0 */  sll        $v0, $v0, 7
/* 2AFAC 8002A3AC 00451021 */  addu       $v0, $v0, $a1
/* 2AFB0 8002A3B0 90430017 */  lbu        $v1, 0x17($v0)
/* 2AFB4 8002A3B4 24020005 */  addiu      $v0, $zero, 5
/* 2AFB8 8002A3B8 10620041 */  beq        $v1, $v0, .L8002A4C0
/* 2AFBC 8002A3BC 02A02021 */   addu      $a0, $s5, $zero
/* 2AFC0 8002A3C0 0C01A53F */  jal        get_combatEnt_proximity
/* 2AFC4 8002A3C4 02002821 */   addu      $a1, $s0, $zero
/* 2AFC8 8002A3C8 3C01800E */  lui        $at, %hi(D_800DA3B8)
/* 2AFCC 8002A3CC C422A3B8 */  lwc1       $f2, %lo(D_800DA3B8)($at)
/* 2AFD0 8002A3D0 46000506 */  mov.s      $f20, $f0
/* 2AFD4 8002A3D4 4614103E */  c.le.s     $f2, $f20
/* 2AFD8 8002A3D8 00000000 */  nop
/* 2AFDC 8002A3DC 45010039 */  bc1t       .L8002A4C4
/* 2AFE0 8002A3E0 02C02821 */   addu      $a1, $s6, $zero
/* 2AFE4 8002A3E4 0C00A89D */  jal        HasHornOfKynon
/* 2AFE8 8002A3E8 46141501 */   sub.s     $f20, $f2, $f20
/* 2AFEC 8002A3EC 14400002 */  bnez       $v0, .L8002A3F8
/* 2AFF0 8002A3F0 00000000 */   nop
/* 2AFF4 8002A3F4 4614A502 */  mul.s      $f20, $f20, $f20
.L8002A3F8:
/* 2AFF8 8002A3F8 0C01DED7 */  jal        getHPCurrent
/* 2AFFC 8002A3FC 02202021 */   addu      $a0, $s1, $zero
/* 2B000 8002A400 44820000 */  mtc1       $v0, $f0
/* 2B004 8002A404 46800020 */  cvt.s.w    $f0, $f0
/* 2B008 8002A408 4614003E */  c.le.s     $f0, $f20
/* 2B00C 8002A40C 00000000 */  nop
/* 2B010 8002A410 4501FFBC */  bc1t       .L8002A304
/* 2B014 8002A414 00000000 */   nop
/* 2B018 8002A418 3C01800E */  lui        $at, %hi(D_800DA3BC)
/* 2B01C 8002A41C C420A3BC */  lwc1       $f0, %lo(D_800DA3BC)($at)
/* 2B020 8002A420 4614003E */  c.le.s     $f0, $f20
/* 2B024 8002A424 00000000 */  nop
/* 2B028 8002A428 45030005 */  bc1tl      .L8002A440
/* 2B02C 8002A42C 4600A001 */   sub.s     $f0, $f20, $f0
/* 2B030 8002A430 4600A00D */  trunc.w.s  $f0, $f20
/* 2B034 8002A434 44050000 */  mfc1       $a1, $f0
/* 2B038 8002A438 0800A914 */  j          .L8002A450
/* 2B03C 8002A43C 02202021 */   addu      $a0, $s1, $zero
.L8002A440:
/* 2B040 8002A440 4600008D */  trunc.w.s  $f2, $f0
/* 2B044 8002A444 44051000 */  mfc1       $a1, $f2
/* 2B048 8002A448 00B42825 */  or         $a1, $a1, $s4
/* 2B04C 8002A44C 02202021 */  addu       $a0, $s1, $zero
.L8002A450:
/* 2B050 8002A450 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 2B054 8002A454 0C01DF6B */  jal        func_checking_cheat_death
/* 2B058 8002A458 02003021 */   addu      $a2, $s0, $zero
/* 2B05C 8002A45C 92020020 */  lbu        $v0, 0x20($s0)
/* 2B060 8002A460 00021080 */  sll        $v0, $v0, 2
/* 2B064 8002A464 00571021 */  addu       $v0, $v0, $s7
/* 2B068 8002A468 8C440000 */  lw         $a0, ($v0)
/* 2B06C 8002A46C 10800015 */  beqz       $a0, .L8002A4C4
/* 2B070 8002A470 02C02821 */   addu      $a1, $s6, $zero
/* 2B074 8002A474 3C01800E */  lui        $at, %hi(D_800DA3C0)
/* 2B078 8002A478 C420A3C0 */  lwc1       $f0, %lo(D_800DA3C0)($at)
/* 2B07C 8002A47C 4614003E */  c.le.s     $f0, $f20
/* 2B080 8002A480 00000000 */  nop
/* 2B084 8002A484 45030005 */  bc1tl      .L8002A49C
/* 2B088 8002A488 4600A001 */   sub.s     $f0, $f20, $f0
/* 2B08C 8002A48C 4600A00D */  trunc.w.s  $f0, $f20
/* 2B090 8002A490 44050000 */  mfc1       $a1, $f0
/* 2B094 8002A494 0800A92B */  j          .L8002A4AC
/* 2B098 8002A498 30A5FFFF */   andi      $a1, $a1, 0xffff
.L8002A49C:
/* 2B09C 8002A49C 4600008D */  trunc.w.s  $f2, $f0
/* 2B0A0 8002A4A0 44051000 */  mfc1       $a1, $f2
/* 2B0A4 8002A4A4 00B42825 */  or         $a1, $a1, $s4
/* 2B0A8 8002A4A8 30A5FFFF */  andi       $a1, $a1, 0xffff
.L8002A4AC:
/* 2B0AC 8002A4AC 00003021 */  addu       $a2, $zero, $zero
/* 2B0B0 8002A4B0 8E020040 */  lw         $v0, 0x40($s0)
/* 2B0B4 8002A4B4 00003821 */  addu       $a3, $zero, $zero
/* 2B0B8 8002A4B8 0C009E81 */  jal        gamecombat_actor_func
/* 2B0BC 8002A4BC AFA20010 */   sw        $v0, 0x10($sp)
.L8002A4C0:
/* 2B0C0 8002A4C0 02C02821 */  addu       $a1, $s6, $zero
.L8002A4C4:
/* 2B0C4 8002A4C4 8CA2F760 */  lw         $v0, -0x8a0($a1)
.L8002A4C8:
/* 2B0C8 8002A4C8 26440001 */  addiu      $a0, $s2, 1
/* 2B0CC 8002A4CC 90430001 */  lbu        $v1, 1($v0)
/* 2B0D0 8002A4D0 309200FF */  andi       $s2, $a0, 0xff
/* 2B0D4 8002A4D4 0243182B */  sltu       $v1, $s2, $v1
/* 2B0D8 8002A4D8 1460FF9A */  bnez       $v1, .L8002A344
/* 2B0DC 8002A4DC 00000000 */   nop
.L8002A4E0:
/* 2B0E0 8002A4E0 00001021 */  addu       $v0, $zero, $zero
.L8002A4E4:
/* 2B0E4 8002A4E4 8FBF0038 */  lw         $ra, 0x38($sp)
/* 2B0E8 8002A4E8 8FB70034 */  lw         $s7, 0x34($sp)
/* 2B0EC 8002A4EC 8FB60030 */  lw         $s6, 0x30($sp)
/* 2B0F0 8002A4F0 8FB5002C */  lw         $s5, 0x2c($sp)
/* 2B0F4 8002A4F4 8FB40028 */  lw         $s4, 0x28($sp)
/* 2B0F8 8002A4F8 8FB30024 */  lw         $s3, 0x24($sp)
/* 2B0FC 8002A4FC 8FB20020 */  lw         $s2, 0x20($sp)
/* 2B100 8002A500 8FB1001C */  lw         $s1, 0x1c($sp)
/* 2B104 8002A504 8FB00018 */  lw         $s0, 0x18($sp)
/* 2B108 8002A508 D7B40040 */  ldc1       $f20, 0x40($sp)
/* 2B10C 8002A50C 03E00008 */  jr         $ra
/* 2B110 8002A510 27BD0048 */   addiu     $sp, $sp, 0x48

glabel combatEnt_proximity_
/* 2B114 8002A514 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 2B118 8002A518 AFB00010 */  sw         $s0, 0x10($sp)
/* 2B11C 8002A51C 00808021 */  addu       $s0, $a0, $zero
/* 2B120 8002A520 F7B80030 */  sdc1       $f24, 0x30($sp)
/* 2B124 8002A524 4486C000 */  mtc1       $a2, $f24
/* 2B128 8002A528 AFB10014 */  sw         $s1, 0x14($sp)
/* 2B12C 8002A52C AFBF0018 */  sw         $ra, 0x18($sp)
/* 2B130 8002A530 F7B60028 */  sdc1       $f22, 0x28($sp)
/* 2B134 8002A534 F7B40020 */  sdc1       $f20, 0x20($sp)
/* 2B138 8002A538 0C01A060 */  jal        get_combatEnt_x_f
/* 2B13C 8002A53C 00A08821 */   addu      $s1, $a1, $zero
/* 2B140 8002A540 02202021 */  addu       $a0, $s1, $zero
/* 2B144 8002A544 0C01A060 */  jal        get_combatEnt_x_f
/* 2B148 8002A548 46000506 */   mov.s     $f20, $f0
/* 2B14C 8002A54C 4600A501 */  sub.s      $f20, $f20, $f0
/* 2B150 8002A550 44800000 */  mtc1       $zero, $f0
/* 2B154 8002A554 4600A03C */  c.lt.s     $f20, $f0
/* 2B158 8002A558 00000000 */  nop
/* 2B15C 8002A55C 45000009 */  bc1f       .L8002A584
/* 2B160 8002A560 00000000 */   nop
/* 2B164 8002A564 0C01A060 */  jal        get_combatEnt_x_f
/* 2B168 8002A568 02002021 */   addu      $a0, $s0, $zero
/* 2B16C 8002A56C 02202021 */  addu       $a0, $s1, $zero
/* 2B170 8002A570 0C01A060 */  jal        get_combatEnt_x_f
/* 2B174 8002A574 46000506 */   mov.s     $f20, $f0
/* 2B178 8002A578 4600A501 */  sub.s      $f20, $f20, $f0
/* 2B17C 8002A57C 0800A967 */  j          .L8002A59C
/* 2B180 8002A580 4600A587 */   neg.s     $f22, $f20
.L8002A584:
/* 2B184 8002A584 0C01A060 */  jal        get_combatEnt_x_f
/* 2B188 8002A588 02002021 */   addu      $a0, $s0, $zero
/* 2B18C 8002A58C 02202021 */  addu       $a0, $s1, $zero
/* 2B190 8002A590 0C01A060 */  jal        get_combatEnt_x_f
/* 2B194 8002A594 46000506 */   mov.s     $f20, $f0
/* 2B198 8002A598 4600A581 */  sub.s      $f22, $f20, $f0
.L8002A59C:
/* 2B19C 8002A59C 4616C03C */  c.lt.s     $f24, $f22
/* 2B1A0 8002A5A0 00000000 */  nop
/* 2B1A4 8002A5A4 45010029 */  bc1t       .L8002A64C
/* 2B1A8 8002A5A8 00001021 */   addu      $v0, $zero, $zero
/* 2B1AC 8002A5AC 0C01A062 */  jal        get_combatEnt_y_f
/* 2B1B0 8002A5B0 02002021 */   addu      $a0, $s0, $zero
/* 2B1B4 8002A5B4 02202021 */  addu       $a0, $s1, $zero
/* 2B1B8 8002A5B8 0C01A062 */  jal        get_combatEnt_y_f
/* 2B1BC 8002A5BC 46000506 */   mov.s     $f20, $f0
/* 2B1C0 8002A5C0 4600A501 */  sub.s      $f20, $f20, $f0
/* 2B1C4 8002A5C4 44800000 */  mtc1       $zero, $f0
/* 2B1C8 8002A5C8 4600A03C */  c.lt.s     $f20, $f0
/* 2B1CC 8002A5CC 00000000 */  nop
/* 2B1D0 8002A5D0 45000009 */  bc1f       .L8002A5F8
/* 2B1D4 8002A5D4 00000000 */   nop
/* 2B1D8 8002A5D8 0C01A062 */  jal        get_combatEnt_y_f
/* 2B1DC 8002A5DC 02002021 */   addu      $a0, $s0, $zero
/* 2B1E0 8002A5E0 02202021 */  addu       $a0, $s1, $zero
/* 2B1E4 8002A5E4 0C01A062 */  jal        get_combatEnt_y_f
/* 2B1E8 8002A5E8 46000506 */   mov.s     $f20, $f0
/* 2B1EC 8002A5EC 4600A501 */  sub.s      $f20, $f20, $f0
/* 2B1F0 8002A5F0 0800A984 */  j          .L8002A610
/* 2B1F4 8002A5F4 4600A087 */   neg.s     $f2, $f20
.L8002A5F8:
/* 2B1F8 8002A5F8 0C01A062 */  jal        get_combatEnt_y_f
/* 2B1FC 8002A5FC 02002021 */   addu      $a0, $s0, $zero
/* 2B200 8002A600 02202021 */  addu       $a0, $s1, $zero
/* 2B204 8002A604 0C01A062 */  jal        get_combatEnt_y_f
/* 2B208 8002A608 46000506 */   mov.s     $f20, $f0
/* 2B20C 8002A60C 4600A081 */  sub.s      $f2, $f20, $f0
.L8002A610:
/* 2B210 8002A610 4602C03C */  c.lt.s     $f24, $f2
/* 2B214 8002A614 00000000 */  nop
/* 2B218 8002A618 4501000C */  bc1t       .L8002A64C
/* 2B21C 8002A61C 00001021 */   addu      $v0, $zero, $zero
/* 2B220 8002A620 4616B002 */  mul.s      $f0, $f22, $f22
/* 2B224 8002A624 00000000 */  nop
/* 2B228 8002A628 46021082 */  mul.s      $f2, $f2, $f2
/* 2B22C 8002A62C 00000000 */  nop
/* 2B230 8002A630 4618C602 */  mul.s      $f24, $f24, $f24
/* 2B234 8002A634 46020000 */  add.s      $f0, $f0, $f2
/* 2B238 8002A638 4618003C */  c.lt.s     $f0, $f24
/* 2B23C 8002A63C 00000000 */  nop
/* 2B240 8002A640 45010002 */  bc1t       .L8002A64C
/* 2B244 8002A644 24020001 */   addiu     $v0, $zero, 1
/* 2B248 8002A648 00001021 */  addu       $v0, $zero, $zero
.L8002A64C:
/* 2B24C 8002A64C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 2B250 8002A650 8FB10014 */  lw         $s1, 0x14($sp)
/* 2B254 8002A654 8FB00010 */  lw         $s0, 0x10($sp)
/* 2B258 8002A658 D7B80030 */  ldc1       $f24, 0x30($sp)
/* 2B25C 8002A65C D7B60028 */  ldc1       $f22, 0x28($sp)
/* 2B260 8002A660 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 2B264 8002A664 03E00008 */  jr         $ra
/* 2B268 8002A668 27BD0038 */   addiu     $sp, $sp, 0x38

glabel shadow_promity_
/* 2B26C 8002A66C 3C02800F */  lui        $v0, %hi(combatPointer)
/* 2B270 8002A670 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 2B274 8002A674 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 2B278 8002A678 AFB00010 */  sw         $s0, 0x10($sp)
/* 2B27C 8002A67C 00008021 */  addu       $s0, $zero, $zero
/* 2B280 8002A680 AFB3001C */  sw         $s3, 0x1c($sp)
/* 2B284 8002A684 00809821 */  addu       $s3, $a0, $zero
/* 2B288 8002A688 AFB40020 */  sw         $s4, 0x20($sp)
/* 2B28C 8002A68C 0040A021 */  addu       $s4, $v0, $zero
/* 2B290 8002A690 AFBF0024 */  sw         $ra, 0x24($sp)
/* 2B294 8002A694 AFB20018 */  sw         $s2, 0x18($sp)
/* 2B298 8002A698 AFB10014 */  sw         $s1, 0x14($sp)
/* 2B29C 8002A69C 90710001 */  lbu        $s1, 1($v1)
/* 2B2A0 8002A6A0 1220000F */  beqz       $s1, .L8002A6E0
/* 2B2A4 8002A6A4 92720020 */   lbu       $s2, 0x20($s3)
.L8002A6A8:
/* 2B2A8 8002A6A8 12120009 */  beq        $s0, $s2, .L8002A6D0
/* 2B2AC 8002A6AC 00101880 */   sll       $v1, $s0, 2
/* 2B2B0 8002A6B0 8E82F760 */  lw         $v0, -0x8a0($s4)
/* 2B2B4 8002A6B4 3C064120 */  lui        $a2, 0x4120
/* 2B2B8 8002A6B8 00431021 */  addu       $v0, $v0, $v1
/* 2B2BC 8002A6BC 8C4552D0 */  lw         $a1, 0x52d0($v0)
/* 2B2C0 8002A6C0 0C00A945 */  jal        combatEnt_proximity_
/* 2B2C4 8002A6C4 02602021 */   addu      $a0, $s3, $zero
/* 2B2C8 8002A6C8 14400006 */  bnez       $v0, .L8002A6E4
/* 2B2CC 8002A6CC 24020001 */   addiu     $v0, $zero, 1
.L8002A6D0:
/* 2B2D0 8002A6D0 26100001 */  addiu      $s0, $s0, 1
/* 2B2D4 8002A6D4 0211102B */  sltu       $v0, $s0, $s1
/* 2B2D8 8002A6D8 1440FFF3 */  bnez       $v0, .L8002A6A8
/* 2B2DC 8002A6DC 00000000 */   nop
.L8002A6E0:
/* 2B2E0 8002A6E0 00001021 */  addu       $v0, $zero, $zero
.L8002A6E4:
/* 2B2E4 8002A6E4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 2B2E8 8002A6E8 8FB40020 */  lw         $s4, 0x20($sp)
/* 2B2EC 8002A6EC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 2B2F0 8002A6F0 8FB20018 */  lw         $s2, 0x18($sp)
/* 2B2F4 8002A6F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 2B2F8 8002A6F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 2B2FC 8002A6FC 03E00008 */  jr         $ra
/* 2B300 8002A700 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_shadow_func
/* 2B304 8002A704 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2B308 8002A708 00803021 */  addu       $a2, $a0, $zero
/* 2B30C 8002A70C 3C02800E */  lui        $v0, %hi(shadow_index)
/* 2B310 8002A710 90447CE8 */  lbu        $a0, %lo(shadow_index)($v0)
/* 2B314 8002A714 240300FF */  addiu      $v1, $zero, 0xff
/* 2B318 8002A718 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2B31C 8002A71C 1083000F */  beq        $a0, $v1, .L8002A75C
/* 2B320 8002A720 00001021 */   addu      $v0, $zero, $zero
/* 2B324 8002A724 3C02800F */  lui        $v0, %hi(combatPointer)
/* 2B328 8002A728 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 2B32C 8002A72C 00042080 */  sll        $a0, $a0, 2
/* 2B330 8002A730 00641821 */  addu       $v1, $v1, $a0
/* 2B334 8002A734 8C6552D0 */  lw         $a1, 0x52d0($v1)
/* 2B338 8002A738 10A60006 */  beq        $a1, $a2, .L8002A754
/* 2B33C 8002A73C 00C02021 */   addu      $a0, $a2, $zero
/* 2B340 8002A740 3C064120 */  lui        $a2, 0x4120
/* 2B344 8002A744 0C00A945 */  jal        combatEnt_proximity_
/* 2B348 8002A748 00000000 */   nop
/* 2B34C 8002A74C 0800A9D8 */  j          .L8002A760
/* 2B350 8002A750 8FBF0010 */   lw        $ra, 0x10($sp)
.L8002A754:
/* 2B354 8002A754 0C00A99B */  jal        shadow_promity_
/* 2B358 8002A758 00C02021 */   addu      $a0, $a2, $zero
.L8002A75C:
/* 2B35C 8002A75C 8FBF0010 */  lw         $ra, 0x10($sp)
.L8002A760:
/* 2B360 8002A760 03E00008 */  jr         $ra
/* 2B364 8002A764 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_func_if_alaron_dead
/* 2B368 8002A768 3C02800F */  lui        $v0, %hi(goblinAmbushFlag)
/* 2B36C 8002A76C 904388F8 */  lbu        $v1, %lo(goblinAmbushFlag)($v0)
/* 2B370 8002A770 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2B374 8002A774 10600005 */  beqz       $v1, .L8002A78C
/* 2B378 8002A778 AFBF0010 */   sw        $ra, 0x10($sp)
/* 2B37C 8002A77C 0C00A9F9 */  jal        set_combat_byte_to_0x1c
/* 2B380 8002A780 00000000 */   nop
/* 2B384 8002A784 0800A9E6 */  j          .L8002A798
/* 2B388 8002A788 8FBF0010 */   lw        $ra, 0x10($sp)
.L8002A78C:
/* 2B38C 8002A78C 0C00A9E8 */  jal        combat_byte_0xd
/* 2B390 8002A790 00000000 */   nop
/* 2B394 8002A794 8FBF0010 */  lw         $ra, 0x10($sp)
.L8002A798:
/* 2B398 8002A798 03E00008 */  jr         $ra
/* 2B39C 8002A79C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel combat_byte_0xd
/* 2B3A0 8002A7A0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 2B3A4 8002A7A4 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 2B3A8 8002A7A8 2403000D */  addiu      $v1, $zero, 0xd
/* 2B3AC 8002A7AC 24040001 */  addiu      $a0, $zero, 1
/* 2B3B0 8002A7B0 A04313C8 */  sb         $v1, 0x13c8($v0)
/* 2B3B4 8002A7B4 03E00008 */  jr         $ra
/* 2B3B8 8002A7B8 A4442048 */   sh        $a0, 0x2048($v0)

glabel combat_byte_0x1a
/* 2B3BC 8002A7BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 2B3C0 8002A7C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 2B3C4 8002A7C4 0C00A6EA */  jal        func_80029BA8
/* 2B3C8 8002A7C8 00000000 */   nop
/* 2B3CC 8002A7CC 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 2B3D0 8002A7D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 2B3D4 8002A7D4 2402001A */  addiu      $v0, $zero, 0x1a
/* 2B3D8 8002A7D8 A0627C70 */  sb         $v0, %lo(combat_bytes)($v1)
/* 2B3DC 8002A7DC 03E00008 */  jr         $ra
/* 2B3E0 8002A7E0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_combat_byte_to_0x1c
/* 2B3E4 8002A7E4 3C03800E */  lui        $v1, %hi(combat_bytes)
/* 2B3E8 8002A7E8 2402001C */  addiu      $v0, $zero, 0x1c
/* 2B3EC 8002A7EC 03E00008 */  jr         $ra
/* 2B3F0 8002A7F0 A0627C70 */   sb        $v0, %lo(combat_bytes)($v1)
/* 2B3F4 8002A7F4 00000000 */  nop
/* 2B3F8 8002A7F8 00000000 */  nop
/* 2B3FC 8002A7FC 00000000 */  nop
