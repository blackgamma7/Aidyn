.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel set_camera_voxel_pointer
/* 1A850 80019C50 3C02800F */  lui        $v0, %hi(cameraVoxelPointer)
/* 1A854 80019C54 3C03800F */  lui        $v1, %hi(cameraVec3Ptr)
/* 1A858 80019C58 AC658EF4 */  sw         $a1, %lo(cameraVec3Ptr)($v1)
/* 1A85C 80019C5C 3C03800F */  lui        $v1, %hi(camera_dat)
/* 1A860 80019C60 AC448EF0 */  sw         $a0, %lo(cameraVoxelPointer)($v0)
/* 1A864 80019C64 2402003C */  addiu      $v0, $zero, 0x3c
/* 1A868 80019C68 14800002 */  bnez       $a0, .L80019C74
/* 1A86C 80019C6C A4628EF8 */   sh        $v0, %lo(camera_dat)($v1)
/* 1A870 80019C70 A4608EF8 */  sh         $zero, -0x7108($v1)
.L80019C74:
/* 1A874 80019C74 03E00008 */  jr         $ra
/* 1A878 80019C78 00000000 */   nop

glabel clear_camera_voxel_pointer
/* 1A87C 80019C7C 3C02800F */  lui        $v0, %hi(cameraVoxelPointer)
/* 1A880 80019C80 3C03800F */  lui        $v1, %hi(cameraVec3Ptr)
/* 1A884 80019C84 AC408EF0 */  sw         $zero, %lo(cameraVoxelPointer)($v0)
/* 1A888 80019C88 3C02800F */  lui        $v0, %hi(camera_dat)
/* 1A88C 80019C8C AC608EF4 */  sw         $zero, %lo(cameraVec3Ptr)($v1)
/* 1A890 80019C90 03E00008 */  jr         $ra
/* 1A894 80019C94 A4408EF8 */   sh        $zero, %lo(camera_dat)($v0)

glabel passto_camera_init
/* 1A898 80019C98 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1A89C 80019C9C AFBF0010 */  sw         $ra, 0x10($sp)
/* 1A8A0 80019CA0 0C02C07A */  jal        camera_init
/* 1A8A4 80019CA4 30E7FFFF */   andi      $a3, $a3, 0xffff
/* 1A8A8 80019CA8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 1A8AC 80019CAC 3C02800E */  lui        $v0, %hi(someArrayTally)
/* 1A8B0 80019CB0 A4406C18 */  sh         $zero, %lo(someArrayTally)($v0)
/* 1A8B4 80019CB4 03E00008 */  jr         $ra
/* 1A8B8 80019CB8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel clear_some_playerHandler_field
/* 1A8BC 80019CBC 3C03800E */  lui        $v1, %hi(player_handler+0x8)
/* 1A8C0 80019CC0 2402FFFF */  addiu      $v0, $zero, -1
/* 1A8C4 80019CC4 03E00008 */  jr         $ra
/* 1A8C8 80019CC8 A4626C68 */   sh        $v0, %lo(player_handler+0x8)($v1)

glabel func_80019CCC
/* 1A8CC 80019CCC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1A8D0 80019CD0 3C03800E */  lui        $v1, 0x800e
/* 1A8D4 80019CD4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 1A8D8 80019CD8 AFB00010 */  sw         $s0, 0x10($sp)
/* 1A8DC 80019CDC 9482001E */  lhu        $v0, 0x1e($a0)
/* 1A8E0 80019CE0 30420001 */  andi       $v0, $v0, 1
/* 1A8E4 80019CE4 10400006 */  beqz       $v0, .L80019D00
/* 1A8E8 80019CE8 24706C60 */   addiu     $s0, $v1, 0x6c60
/* 1A8EC 80019CEC 0C0061CB */  jal        playerdata_NAND_flags
/* 1A8F0 80019CF0 24050001 */   addiu     $a1, $zero, 1
/* 1A8F4 80019CF4 2402FFFF */  addiu      $v0, $zero, -1
/* 1A8F8 80019CF8 0C00672F */  jal        clear_some_playerHandler_field
/* 1A8FC 80019CFC A6020008 */   sh        $v0, 8($s0)
.L80019D00:
/* 1A900 80019D00 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1A904 80019D04 8FB00010 */  lw         $s0, 0x10($sp)
/* 1A908 80019D08 03E00008 */  jr         $ra
/* 1A90C 80019D0C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel GiveCameraToPlayer
/* 1A910 80019D10 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1A914 80019D14 AFB20018 */  sw         $s2, 0x18($sp)
/* 1A918 80019D18 00809021 */  addu       $s2, $a0, $zero
/* 1A91C 80019D1C 3C02800E */  lui        $v0, %hi(player_handler)
/* 1A920 80019D20 AFB10014 */  sw         $s1, 0x14($sp)
/* 1A924 80019D24 24516C60 */  addiu      $s1, $v0, %lo(player_handler)
/* 1A928 80019D28 AFB00010 */  sw         $s0, 0x10($sp)
/* 1A92C 80019D2C 2630FE5C */  addiu      $s0, $s1, -0x1a4
/* 1A930 80019D30 16400006 */  bnez       $s2, .L80019D4C
/* 1A934 80019D34 AFBF001C */   sw        $ra, 0x1c($sp)
/* 1A938 80019D38 3C04800E */  lui        $a0, %hi(D_800D9500)
/* 1A93C 80019D3C 24849500 */  addiu      $a0, $a0, %lo(D_800D9500)
/* 1A940 80019D40 3C05800E */  lui        $a1, %hi(D_800D9514)
/* 1A944 80019D44 0C025F2D */  jal        manualCrash
/* 1A948 80019D48 24A59514 */   addiu     $a1, $a1, %lo(D_800D9514)
.L80019D4C:
/* 1A94C 80019D4C 86230008 */  lh         $v1, 8($s1)
/* 1A950 80019D50 2402FFFF */  addiu      $v0, $zero, -1
/* 1A954 80019D54 10620006 */  beq        $v1, $v0, .L80019D70
/* 1A958 80019D58 00032100 */   sll       $a0, $v1, 4
/* 1A95C 80019D5C 00832023 */  subu       $a0, $a0, $v1
/* 1A960 80019D60 8E22000C */  lw         $v0, 0xc($s1)
/* 1A964 80019D64 000421C0 */  sll        $a0, $a0, 7
/* 1A968 80019D68 0C006733 */  jal        func_80019CCC
/* 1A96C 80019D6C 00442021 */   addu      $a0, $v0, $a0
.L80019D70:
/* 1A970 80019D70 0C0034CE */  jal        GetCollisionZone
/* 1A974 80019D74 9244070D */   lbu       $a0, 0x70d($s2)
/* 1A978 80019D78 02402021 */  addu       $a0, $s2, $zero
/* 1A97C 80019D7C C600004C */  lwc1       $f0, 0x4c($s0)
/* 1A980 80019D80 24050001 */  addiu      $a1, $zero, 1
/* 1A984 80019D84 AE020088 */  sw         $v0, 0x88($s0)
/* 1A988 80019D88 AE000058 */  sw         $zero, 0x58($s0)
/* 1A98C 80019D8C 0C0061C7 */  jal        playerdata_set_flags
/* 1A990 80019D90 E6000048 */   swc1      $f0, 0x48($s0)
/* 1A994 80019D94 96420000 */  lhu        $v0, ($s2)
/* 1A998 80019D98 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1A99C 80019D9C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1A9A0 80019DA0 8FB00010 */  lw         $s0, 0x10($sp)
/* 1A9A4 80019DA4 A6220008 */  sh         $v0, 8($s1)
/* 1A9A8 80019DA8 8FB10014 */  lw         $s1, 0x14($sp)
/* 1A9AC 80019DAC 03E00008 */  jr         $ra
/* 1A9B0 80019DB0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel camera_add_vec3
/* 1A9B4 80019DB4 C4800090 */  lwc1       $f0, 0x90($a0)
/* 1A9B8 80019DB8 C4A20000 */  lwc1       $f2, ($a1)
/* 1A9BC 80019DBC 46020000 */  add.s      $f0, $f0, $f2
/* 1A9C0 80019DC0 C4820094 */  lwc1       $f2, 0x94($a0)
/* 1A9C4 80019DC4 E4800090 */  swc1       $f0, 0x90($a0)
/* 1A9C8 80019DC8 C4A00004 */  lwc1       $f0, 4($a1)
/* 1A9CC 80019DCC 46001080 */  add.s      $f2, $f2, $f0
/* 1A9D0 80019DD0 C4800098 */  lwc1       $f0, 0x98($a0)
/* 1A9D4 80019DD4 E4820094 */  swc1       $f2, 0x94($a0)
/* 1A9D8 80019DD8 C4A20008 */  lwc1       $f2, 8($a1)
/* 1A9DC 80019DDC 46020000 */  add.s      $f0, $f0, $f2
/* 1A9E0 80019DE0 C4820000 */  lwc1       $f2, ($a0)
/* 1A9E4 80019DE4 E4800098 */  swc1       $f0, 0x98($a0)
/* 1A9E8 80019DE8 C4A00000 */  lwc1       $f0, ($a1)
/* 1A9EC 80019DEC 46001080 */  add.s      $f2, $f2, $f0
/* 1A9F0 80019DF0 C4800004 */  lwc1       $f0, 4($a0)
/* 1A9F4 80019DF4 E4820000 */  swc1       $f2, ($a0)
/* 1A9F8 80019DF8 C4A20004 */  lwc1       $f2, 4($a1)
/* 1A9FC 80019DFC 46020000 */  add.s      $f0, $f0, $f2
/* 1AA00 80019E00 C4820008 */  lwc1       $f2, 8($a0)
/* 1AA04 80019E04 E4800004 */  swc1       $f0, 4($a0)
/* 1AA08 80019E08 C4A00008 */  lwc1       $f0, 8($a1)
/* 1AA0C 80019E0C 46001080 */  add.s      $f2, $f2, $f0
/* 1AA10 80019E10 C480000C */  lwc1       $f0, 0xc($a0)
/* 1AA14 80019E14 E4820008 */  swc1       $f2, 8($a0)
/* 1AA18 80019E18 C4A20000 */  lwc1       $f2, ($a1)
/* 1AA1C 80019E1C 46020000 */  add.s      $f0, $f0, $f2
/* 1AA20 80019E20 C4820010 */  lwc1       $f2, 0x10($a0)
/* 1AA24 80019E24 E480000C */  swc1       $f0, 0xc($a0)
/* 1AA28 80019E28 C4A00004 */  lwc1       $f0, 4($a1)
/* 1AA2C 80019E2C 46001080 */  add.s      $f2, $f2, $f0
/* 1AA30 80019E30 C4800014 */  lwc1       $f0, 0x14($a0)
/* 1AA34 80019E34 E4820010 */  swc1       $f2, 0x10($a0)
/* 1AA38 80019E38 C4A20008 */  lwc1       $f2, 8($a1)
/* 1AA3C 80019E3C 46020000 */  add.s      $f0, $f0, $f2
/* 1AA40 80019E40 C4820018 */  lwc1       $f2, 0x18($a0)
/* 1AA44 80019E44 E4800014 */  swc1       $f0, 0x14($a0)
/* 1AA48 80019E48 C4A00000 */  lwc1       $f0, ($a1)
/* 1AA4C 80019E4C 46001080 */  add.s      $f2, $f2, $f0
/* 1AA50 80019E50 C480001C */  lwc1       $f0, 0x1c($a0)
/* 1AA54 80019E54 E4820018 */  swc1       $f2, 0x18($a0)
/* 1AA58 80019E58 C4A20004 */  lwc1       $f2, 4($a1)
/* 1AA5C 80019E5C 46020000 */  add.s      $f0, $f0, $f2
/* 1AA60 80019E60 C4820020 */  lwc1       $f2, 0x20($a0)
/* 1AA64 80019E64 E480001C */  swc1       $f0, 0x1c($a0)
/* 1AA68 80019E68 C4A00008 */  lwc1       $f0, 8($a1)
/* 1AA6C 80019E6C 46001080 */  add.s      $f2, $f2, $f0
/* 1AA70 80019E70 E4820020 */  swc1       $f2, 0x20($a0)
/* 1AA74 80019E74 C4800024 */  lwc1       $f0, 0x24($a0)
/* 1AA78 80019E78 C4A20000 */  lwc1       $f2, ($a1)
/* 1AA7C 80019E7C 46020000 */  add.s      $f0, $f0, $f2
/* 1AA80 80019E80 C4820028 */  lwc1       $f2, 0x28($a0)
/* 1AA84 80019E84 E4800024 */  swc1       $f0, 0x24($a0)
/* 1AA88 80019E88 C4A00004 */  lwc1       $f0, 4($a1)
/* 1AA8C 80019E8C 46001080 */  add.s      $f2, $f2, $f0
/* 1AA90 80019E90 C480002C */  lwc1       $f0, 0x2c($a0)
/* 1AA94 80019E94 E4820028 */  swc1       $f2, 0x28($a0)
/* 1AA98 80019E98 C4A20008 */  lwc1       $f2, 8($a1)
/* 1AA9C 80019E9C 46020000 */  add.s      $f0, $f0, $f2
/* 1AAA0 80019EA0 C4820070 */  lwc1       $f2, 0x70($a0)
/* 1AAA4 80019EA4 E480002C */  swc1       $f0, 0x2c($a0)
/* 1AAA8 80019EA8 C4A00000 */  lwc1       $f0, ($a1)
/* 1AAAC 80019EAC 46001080 */  add.s      $f2, $f2, $f0
/* 1AAB0 80019EB0 C4800074 */  lwc1       $f0, 0x74($a0)
/* 1AAB4 80019EB4 E4820070 */  swc1       $f2, 0x70($a0)
/* 1AAB8 80019EB8 C4A20004 */  lwc1       $f2, 4($a1)
/* 1AABC 80019EBC 46020000 */  add.s      $f0, $f0, $f2
/* 1AAC0 80019EC0 C4820078 */  lwc1       $f2, 0x78($a0)
/* 1AAC4 80019EC4 E4800074 */  swc1       $f0, 0x74($a0)
/* 1AAC8 80019EC8 C4A00008 */  lwc1       $f0, 8($a1)
/* 1AACC 80019ECC 46001080 */  add.s      $f2, $f2, $f0
/* 1AAD0 80019ED0 03E00008 */  jr         $ra
/* 1AAD4 80019ED4 E4820078 */   swc1      $f2, 0x78($a0)

glabel func_80019ED8
/* 1AAD8 80019ED8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 1AADC 80019EDC 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 1AAE0 80019EE0 94430370 */  lhu        $v1, 0x370($v0)
/* 1AAE4 80019EE4 24650001 */  addiu      $a1, $v1, 1
/* 1AAE8 80019EE8 00031C00 */  sll        $v1, $v1, 0x10
/* 1AAEC 80019EEC 00031B83 */  sra        $v1, $v1, 0xe
/* 1AAF0 80019EF0 A4450370 */  sh         $a1, 0x370($v0)
/* 1AAF4 80019EF4 00431021 */  addu       $v0, $v0, $v1
/* 1AAF8 80019EF8 03E00008 */  jr         $ra
/* 1AAFC 80019EFC AC440330 */   sw        $a0, 0x330($v0)

glabel func_80019F00
/* 1AB00 80019F00 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1AB04 80019F04 AFB10014 */  sw         $s1, 0x14($sp)
/* 1AB08 80019F08 00808821 */  addu       $s1, $a0, $zero
/* 1AB0C 80019F0C AFB20018 */  sw         $s2, 0x18($sp)
/* 1AB10 80019F10 00C09021 */  addu       $s2, $a2, $zero
/* 1AB14 80019F14 AFB00010 */  sw         $s0, 0x10($sp)
/* 1AB18 80019F18 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 1AB1C 80019F1C 32024000 */  andi       $v0, $s0, 0x4000
/* 1AB20 80019F20 10400004 */  beqz       $v0, .L80019F34
/* 1AB24 80019F24 AFBF001C */   sw        $ra, 0x1c($sp)
/* 1AB28 80019F28 2624000C */  addiu      $a0, $s1, 0xc
/* 1AB2C 80019F2C 0C02AD17 */  jal        copyVec3
/* 1AB30 80019F30 02402821 */   addu      $a1, $s2, $zero
.L80019F34:
/* 1AB34 80019F34 32028000 */  andi       $v0, $s0, 0x8000
/* 1AB38 80019F38 10400003 */  beqz       $v0, .L80019F48
/* 1AB3C 80019F3C 02202021 */   addu      $a0, $s1, $zero
/* 1AB40 80019F40 0C02AD17 */  jal        copyVec3
/* 1AB44 80019F44 02402821 */   addu      $a1, $s2, $zero
.L80019F48:
/* 1AB48 80019F48 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1AB4C 80019F4C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1AB50 80019F50 8FB10014 */  lw         $s1, 0x14($sp)
/* 1AB54 80019F54 8FB00010 */  lw         $s0, 0x10($sp)
/* 1AB58 80019F58 03E00008 */  jr         $ra
/* 1AB5C 80019F5C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel copy_to_aim_or_pos
/* 1AB60 80019F60 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1AB64 80019F64 AFB20018 */  sw         $s2, 0x18($sp)
/* 1AB68 80019F68 00809021 */  addu       $s2, $a0, $zero
/* 1AB6C 80019F6C AFB10014 */  sw         $s1, 0x14($sp)
/* 1AB70 80019F70 00C08821 */  addu       $s1, $a2, $zero
/* 1AB74 80019F74 AFB00010 */  sw         $s0, 0x10($sp)
/* 1AB78 80019F78 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 1AB7C 80019F7C 32024000 */  andi       $v0, $s0, 0x4000
/* 1AB80 80019F80 10400004 */  beqz       $v0, .L80019F94
/* 1AB84 80019F84 AFBF001C */   sw        $ra, 0x1c($sp)
/* 1AB88 80019F88 02202021 */  addu       $a0, $s1, $zero
/* 1AB8C 80019F8C 0C02AD17 */  jal        copyVec3
/* 1AB90 80019F90 2645000C */   addiu     $a1, $s2, 0xc
.L80019F94:
/* 1AB94 80019F94 32028000 */  andi       $v0, $s0, 0x8000
/* 1AB98 80019F98 10400003 */  beqz       $v0, .L80019FA8
/* 1AB9C 80019F9C 02202021 */   addu      $a0, $s1, $zero
/* 1ABA0 80019FA0 0C02AD17 */  jal        copyVec3
/* 1ABA4 80019FA4 02402821 */   addu      $a1, $s2, $zero
.L80019FA8:
/* 1ABA8 80019FA8 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1ABAC 80019FAC 8FB20018 */  lw         $s2, 0x18($sp)
/* 1ABB0 80019FB0 8FB10014 */  lw         $s1, 0x14($sp)
/* 1ABB4 80019FB4 8FB00010 */  lw         $s0, 0x10($sp)
/* 1ABB8 80019FB8 03E00008 */  jr         $ra
/* 1ABBC 80019FBC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel processVoxelCamera
/* 1ABC0 80019FC0 27BDFEF0 */  addiu      $sp, $sp, -0x110
/* 1ABC4 80019FC4 AFB600F0 */  sw         $s6, 0xf0($sp)
/* 1ABC8 80019FC8 0000B021 */  addu       $s6, $zero, $zero
/* 1ABCC 80019FCC AFB700F4 */  sw         $s7, 0xf4($sp)
/* 1ABD0 80019FD0 0000B821 */  addu       $s7, $zero, $zero
/* 1ABD4 80019FD4 AFB500EC */  sw         $s5, 0xec($sp)
/* 1ABD8 80019FD8 0080A821 */  addu       $s5, $a0, $zero
/* 1ABDC 80019FDC AFB000D8 */  sw         $s0, 0xd8($sp)
/* 1ABE0 80019FE0 00A08021 */  addu       $s0, $a1, $zero
/* 1ABE4 80019FE4 AFB300E4 */  sw         $s3, 0xe4($sp)
/* 1ABE8 80019FE8 00C09821 */  addu       $s3, $a2, $zero
/* 1ABEC 80019FEC AFB100DC */  sw         $s1, 0xdc($sp)
/* 1ABF0 80019FF0 24030008 */  addiu      $v1, $zero, 8
/* 1ABF4 80019FF4 AFBF00FC */  sw         $ra, 0xfc($sp)
/* 1ABF8 80019FF8 AFBE00F8 */  sw         $fp, 0xf8($sp)
/* 1ABFC 80019FFC AFB400E8 */  sw         $s4, 0xe8($sp)
/* 1AC00 8001A000 AFB200E0 */  sw         $s2, 0xe0($sp)
/* 1AC04 8001A004 F7B60108 */  sdc1       $f22, 0x108($sp)
/* 1AC08 8001A008 F7B40100 */  sdc1       $f20, 0x100($sp)
/* 1AC0C 8001A00C 96020016 */  lhu        $v0, 0x16($s0)
/* 1AC10 8001A010 4487B000 */  mtc1       $a3, $f22
/* 1AC14 8001A014 14430199 */  bne        $v0, $v1, .L8001A67C
/* 1AC18 8001A018 26110028 */   addiu     $s1, $s0, 0x28
/* 1AC1C 8001A01C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 1AC20 8001A020 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 1AC24 8001A024 8E030010 */  lw         $v1, 0x10($s0)
/* 1AC28 8001A028 8E440008 */  lw         $a0, 8($s2)
/* 1AC2C 8001A02C 0064182B */  sltu       $v1, $v1, $a0
/* 1AC30 8001A030 10600192 */  beqz       $v1, .L8001A67C
/* 1AC34 8001A034 0040F021 */   addu      $fp, $v0, $zero
/* 1AC38 8001A038 96020014 */  lhu        $v0, 0x14($s0)
/* 1AC3C 8001A03C 30428000 */  andi       $v0, $v0, 0x8000
/* 1AC40 8001A040 1040018F */  beqz       $v0, .L8001A680
/* 1AC44 8001A044 8FBF00FC */   lw        $ra, 0xfc($sp)
/* 1AC48 8001A048 0C02AB66 */  jal        get_vec3_proximity
/* 1AC4C 8001A04C 02A02021 */   addu      $a0, $s5, $zero
/* 1AC50 8001A050 C602000C */  lwc1       $f2, 0xc($s0)
/* 1AC54 8001A054 4600103C */  c.lt.s     $f2, $f0
/* 1AC58 8001A058 00000000 */  nop
/* 1AC5C 8001A05C 45010188 */  bc1t       .L8001A680
/* 1AC60 8001A060 8FBF00FC */   lw        $ra, 0xfc($sp)
/* 1AC64 8001A064 92430040 */  lbu        $v1, 0x40($s2)
/* 1AC68 8001A068 2402000C */  addiu      $v0, $zero, 0xc
/* 1AC6C 8001A06C 14620008 */  bne        $v1, $v0, .L8001A090
/* 1AC70 8001A070 96220002 */   lhu       $v0, 2($s1)
/* 1AC74 8001A074 3042001F */  andi       $v0, $v0, 0x1f
/* 1AC78 8001A078 50400005 */  beql       $v0, $zero, .L8001A090
/* 1AC7C 8001A07C 96220002 */   lhu       $v0, 2($s1)
/* 1AC80 8001A080 96421620 */  lhu        $v0, 0x1620($s2)
/* 1AC84 8001A084 24420001 */  addiu      $v0, $v0, 1
/* 1AC88 8001A088 A6421620 */  sh         $v0, 0x1620($s2)
/* 1AC8C 8001A08C 96220002 */  lhu        $v0, 2($s1)
.L8001A090:
/* 1AC90 8001A090 3042C000 */  andi       $v0, $v0, 0xc000
/* 1AC94 8001A094 10400144 */  beqz       $v0, .L8001A5A8
/* 1AC98 8001A098 02602021 */   addu      $a0, $s3, $zero
/* 1AC9C 8001A09C 0C02C4D5 */  jal        set_camera_mode
/* 1ACA0 8001A0A0 24050002 */   addiu     $a1, $zero, 2
/* 1ACA4 8001A0A4 96220002 */  lhu        $v0, 2($s1)
/* 1ACA8 8001A0A8 3042001F */  andi       $v0, $v0, 0x1f
/* 1ACAC 8001A0AC 1440000D */  bnez       $v0, .L8001A0E4
/* 1ACB0 8001A0B0 27D068A8 */   addiu     $s0, $fp, 0x68a8
/* 1ACB4 8001A0B4 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 1ACB8 8001A0B8 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 1ACBC 8001A0BC 02002021 */  addu       $a0, $s0, $zero
/* 1ACC0 8001A0C0 96260002 */  lhu        $a2, 2($s1)
/* 1ACC4 8001A0C4 3C05800E */  lui        $a1, %hi(D_800D952C)
/* 1ACC8 8001A0C8 0C0333AC */  jal        sprintf
/* 1ACCC 8001A0CC 24A5952C */   addiu     $a1, $a1, %lo(D_800D952C)
/* 1ACD0 8001A0D0 3C04800E */  lui        $a0, %hi(D_800D954C)
/* 1ACD4 8001A0D4 2484954C */  addiu      $a0, $a0, %lo(D_800D954C)
/* 1ACD8 8001A0D8 0C025F2D */  jal        manualCrash
/* 1ACDC 8001A0DC 02002821 */   addu      $a1, $s0, $zero
/* 1ACE0 8001A0E0 27D068A8 */  addiu      $s0, $fp, 0x68a8
.L8001A0E4:
/* 1ACE4 8001A0E4 26320014 */  addiu      $s2, $s1, 0x14
/* 1ACE8 8001A0E8 8E230004 */  lw         $v1, 4($s1)
/* 1ACEC 8001A0EC 8E020008 */  lw         $v0, 8($s0)
/* 1ACF0 8001A0F0 0062182B */  sltu       $v1, $v1, $v0
/* 1ACF4 8001A0F4 1060005B */  beqz       $v1, .L8001A264
/* 1ACF8 8001A0F8 26340020 */   addiu     $s4, $s1, 0x20
/* 1ACFC 8001A0FC 02602021 */  addu       $a0, $s3, $zero
/* 1AD00 8001A100 96250002 */  lhu        $a1, 2($s1)
/* 1AD04 8001A104 0C0067C0 */  jal        func_80019F00
/* 1AD08 8001A108 27A60018 */   addiu     $a2, $sp, 0x18
/* 1AD0C 8001A10C 27A40018 */  addiu      $a0, $sp, 0x18
/* 1AD10 8001A110 0C02AD17 */  jal        copyVec3
/* 1AD14 8001A114 02402821 */   addu      $a1, $s2, $zero
/* 1AD18 8001A118 96220000 */  lhu        $v0, ($s1)
/* 1AD1C 8001A11C 10400009 */  beqz       $v0, .L8001A144
/* 1AD20 8001A120 02A02021 */   addu      $a0, $s5, $zero
/* 1AD24 8001A124 8E040200 */  lw         $a0, 0x200($s0)
/* 1AD28 8001A128 0C003A50 */  jal        FindReferncePoint
/* 1AD2C 8001A12C 00402821 */   addu      $a1, $v0, $zero
/* 1AD30 8001A130 00402021 */  addu       $a0, $v0, $zero
/* 1AD34 8001A134 0C02AD17 */  jal        copyVec3
/* 1AD38 8001A138 02802821 */   addu      $a1, $s4, $zero
/* 1AD3C 8001A13C 0800686C */  j          .L8001A1B0
/* 1AD40 8001A140 96220002 */   lhu       $v0, 2($s1)
.L8001A144:
/* 1AD44 8001A144 0C02AD17 */  jal        copyVec3
/* 1AD48 8001A148 02802821 */   addu      $a1, $s4, $zero
/* 1AD4C 8001A14C 8E0200A8 */  lw         $v0, 0xa8($s0)
/* 1AD50 8001A150 10400004 */  beqz       $v0, .L8001A164
/* 1AD54 8001A154 C6200024 */   lwc1      $f0, 0x24($s1)
/* 1AD58 8001A158 C4420034 */  lwc1       $f2, 0x34($v0)
/* 1AD5C 8001A15C 0800685E */  j          .L8001A178
/* 1AD60 8001A160 46020001 */   sub.s     $f0, $f0, $f2
.L8001A164:
/* 1AD64 8001A164 3C01800E */  lui        $at, %hi(D_800D9560)
/* 1AD68 8001A168 D4229560 */  ldc1       $f2, %lo(D_800D9560)($at)
/* 1AD6C 8001A16C 46000021 */  cvt.d.s    $f0, $f0
/* 1AD70 8001A170 46220001 */  sub.d      $f0, $f0, $f2
/* 1AD74 8001A174 46200020 */  cvt.s.d    $f0, $f0
.L8001A178:
/* 1AD78 8001A178 0C016778 */  jal        isDialougeMode
/* 1AD7C 8001A17C E6200024 */   swc1      $f0, 0x24($s1)
/* 1AD80 8001A180 10400007 */  beqz       $v0, .L8001A1A0
/* 1AD84 8001A184 C6200024 */   lwc1      $f0, 0x24($s1)
/* 1AD88 8001A188 3C01800E */  lui        $at, %hi(D_800D9568)
/* 1AD8C 8001A18C D4229568 */  ldc1       $f2, %lo(D_800D9568)($at)
/* 1AD90 8001A190 46000021 */  cvt.d.s    $f0, $f0
/* 1AD94 8001A194 46220000 */  add.d      $f0, $f0, $f2
/* 1AD98 8001A198 0800686A */  j          .L8001A1A8
/* 1AD9C 8001A19C 46200020 */   cvt.s.d   $f0, $f0
.L8001A1A0:
/* 1ADA0 8001A1A0 C662006C */  lwc1       $f2, 0x6c($s3)
/* 1ADA4 8001A1A4 46020000 */  add.s      $f0, $f0, $f2
.L8001A1A8:
/* 1ADA8 8001A1A8 E6200024 */  swc1       $f0, 0x24($s1)
/* 1ADAC 8001A1AC 96220002 */  lhu        $v0, 2($s1)
.L8001A1B0:
/* 1ADB0 8001A1B0 30422000 */  andi       $v0, $v0, 0x2000
/* 1ADB4 8001A1B4 1040000E */  beqz       $v0, .L8001A1F0
/* 1ADB8 8001A1B8 AE20002C */   sw        $zero, 0x2c($s1)
/* 1ADBC 8001A1BC 02602021 */  addu       $a0, $s3, $zero
/* 1ADC0 8001A1C0 8EA20004 */  lw         $v0, 4($s5)
/* 1ADC4 8001A1C4 27A50098 */  addiu      $a1, $sp, 0x98
/* 1ADC8 8001A1C8 AFA2009C */  sw         $v0, 0x9c($sp)
/* 1ADCC 8001A1CC 8EA30000 */  lw         $v1, ($s5)
/* 1ADD0 8001A1D0 C7A0009C */  lwc1       $f0, 0x9c($sp)
/* 1ADD4 8001A1D4 C662006C */  lwc1       $f2, 0x6c($s3)
/* 1ADD8 8001A1D8 8EA20008 */  lw         $v0, 8($s5)
/* 1ADDC 8001A1DC 46020000 */  add.s      $f0, $f0, $f2
/* 1ADE0 8001A1E0 AFA30098 */  sw         $v1, 0x98($sp)
/* 1ADE4 8001A1E4 AFA200A0 */  sw         $v0, 0xa0($sp)
/* 1ADE8 8001A1E8 0C02C069 */  jal        camera_set_aim
/* 1ADEC 8001A1EC E7A0009C */   swc1      $f0, 0x9c($sp)
.L8001A1F0:
/* 1ADF0 8001A1F0 96220002 */  lhu        $v0, 2($s1)
/* 1ADF4 8001A1F4 30420001 */  andi       $v0, $v0, 1
/* 1ADF8 8001A1F8 10400007 */  beqz       $v0, .L8001A218
/* 1ADFC 8001A1FC 02802021 */   addu      $a0, $s4, $zero
/* 1AE00 8001A200 0C02AD17 */  jal        copyVec3
/* 1AE04 8001A204 02402821 */   addu      $a1, $s2, $zero
/* 1AE08 8001A208 02602021 */  addu       $a0, $s3, $zero
/* 1AE0C 8001A20C 96250002 */  lhu        $a1, 2($s1)
/* 1AE10 8001A210 0C0067D8 */  jal        copy_to_aim_or_pos
/* 1AE14 8001A214 02803021 */   addu      $a2, $s4, $zero
.L8001A218:
/* 1AE18 8001A218 96220002 */  lhu        $v0, 2($s1)
/* 1AE1C 8001A21C 30420002 */  andi       $v0, $v0, 2
/* 1AE20 8001A220 10400010 */  beqz       $v0, .L8001A264
/* 1AE24 8001A224 27A40018 */   addiu     $a0, $sp, 0x18
/* 1AE28 8001A228 02802821 */  addu       $a1, $s4, $zero
/* 1AE2C 8001A22C 0C02AB26 */  jal        Vec3A_BsubC
/* 1AE30 8001A230 02403021 */   addu      $a2, $s2, $zero
/* 1AE34 8001A234 0C02ABBB */  jal        vec3_normalize
/* 1AE38 8001A238 27A40018 */   addiu     $a0, $sp, 0x18
/* 1AE3C 8001A23C C6220010 */  lwc1       $f2, 0x10($s1)
/* 1AE40 8001A240 46020003 */  div.s      $f0, $f0, $f2
/* 1AE44 8001A244 44050000 */  mfc1       $a1, $f0
/* 1AE48 8001A248 0C02AD3C */  jal        multiVec3
/* 1AE4C 8001A24C 27A40018 */   addiu     $a0, $sp, 0x18
/* 1AE50 8001A250 27A40018 */  addiu      $a0, $sp, 0x18
/* 1AE54 8001A254 0C02AD17 */  jal        copyVec3
/* 1AE58 8001A258 02402821 */   addu      $a1, $s2, $zero
/* 1AE5C 8001A25C C6200010 */  lwc1       $f0, 0x10($s1)
/* 1AE60 8001A260 E620002C */  swc1       $f0, 0x2c($s1)
.L8001A264:
/* 1AE64 8001A264 02402021 */  addu       $a0, $s2, $zero
/* 1AE68 8001A268 0C02AB66 */  jal        get_vec3_proximity
/* 1AE6C 8001A26C 02802821 */   addu      $a1, $s4, $zero
/* 1AE70 8001A270 3C01800E */  lui        $at, %hi(D_800D9570)
/* 1AE74 8001A274 D4229570 */  ldc1       $f2, %lo(D_800D9570)($at)
/* 1AE78 8001A278 46000021 */  cvt.d.s    $f0, $f0
/* 1AE7C 8001A27C 4620103C */  c.lt.d     $f2, $f0
/* 1AE80 8001A280 00000000 */  nop
/* 1AE84 8001A284 45030001 */  bc1tl      .L8001A28C
/* 1AE88 8001A288 24160001 */   addiu     $s6, $zero, 1
.L8001A28C:
/* 1AE8C 8001A28C 96230002 */  lhu        $v1, 2($s1)
/* 1AE90 8001A290 3062001F */  andi       $v0, $v1, 0x1f
/* 1AE94 8001A294 50400001 */  beql       $v0, $zero, .L8001A29C
/* 1AE98 8001A298 0000B021 */   addu      $s6, $zero, $zero
.L8001A29C:
/* 1AE9C 8001A29C 30620002 */  andi       $v0, $v1, 2
/* 1AEA0 8001A2A0 50400020 */  beql       $v0, $zero, .L8001A324
/* 1AEA4 8001A2A4 96220002 */   lhu       $v0, 2($s1)
/* 1AEA8 8001A2A8 C622002C */  lwc1       $f2, 0x2c($s1)
/* 1AEAC 8001A2AC 44800000 */  mtc1       $zero, $f0
/* 1AEB0 8001A2B0 4602003C */  c.lt.s     $f0, $f2
/* 1AEB4 8001A2B4 00000000 */  nop
/* 1AEB8 8001A2B8 45000017 */  bc1f       .L8001A318
/* 1AEBC 8001A2BC 02602021 */   addu      $a0, $s3, $zero
/* 1AEC0 8001A2C0 46161001 */  sub.s      $f0, $f2, $f22
/* 1AEC4 8001A2C4 96250002 */  lhu        $a1, 2($s1)
/* 1AEC8 8001A2C8 27A60018 */  addiu      $a2, $sp, 0x18
/* 1AECC 8001A2CC 0C0067C0 */  jal        func_80019F00
/* 1AED0 8001A2D0 E620002C */   swc1      $f0, 0x2c($s1)
/* 1AED4 8001A2D4 02402021 */  addu       $a0, $s2, $zero
/* 1AED8 8001A2D8 27B00058 */  addiu      $s0, $sp, 0x58
/* 1AEDC 8001A2DC 0C02AD17 */  jal        copyVec3
/* 1AEE0 8001A2E0 02002821 */   addu      $a1, $s0, $zero
/* 1AEE4 8001A2E4 4405B000 */  mfc1       $a1, $f22
/* 1AEE8 8001A2E8 0C02AD3C */  jal        multiVec3
/* 1AEEC 8001A2EC 02002021 */   addu      $a0, $s0, $zero
/* 1AEF0 8001A2F0 27A40018 */  addiu      $a0, $sp, 0x18
/* 1AEF4 8001A2F4 00802821 */  addu       $a1, $a0, $zero
/* 1AEF8 8001A2F8 0C02AB4D */  jal        vec3_sum
/* 1AEFC 8001A2FC 02003021 */   addu      $a2, $s0, $zero
/* 1AF00 8001A300 02602021 */  addu       $a0, $s3, $zero
/* 1AF04 8001A304 96250002 */  lhu        $a1, 2($s1)
/* 1AF08 8001A308 0C0067D8 */  jal        copy_to_aim_or_pos
/* 1AF0C 8001A30C 27A60018 */   addiu     $a2, $sp, 0x18
/* 1AF10 8001A310 080068C9 */  j          .L8001A324
/* 1AF14 8001A314 96220002 */   lhu       $v0, 2($s1)
.L8001A318:
/* 1AF18 8001A318 56C00001 */  bnel       $s6, $zero, .L8001A320
/* 1AF1C 8001A31C 24170001 */   addiu     $s7, $zero, 1
.L8001A320:
/* 1AF20 8001A320 96220002 */  lhu        $v0, 2($s1)
.L8001A324:
/* 1AF24 8001A324 30420004 */  andi       $v0, $v0, 4
/* 1AF28 8001A328 50400033 */  beql       $v0, $zero, .L8001A3F8
/* 1AF2C 8001A32C 96220002 */   lhu       $v0, 2($s1)
/* 1AF30 8001A330 C624002C */  lwc1       $f4, 0x2c($s1)
/* 1AF34 8001A334 3C01800E */  lui        $at, %hi(D_800D9578)
/* 1AF38 8001A338 C4229578 */  lwc1       $f2, %lo(D_800D9578)($at)
/* 1AF3C 8001A33C 4602203C */  c.lt.s     $f4, $f2
/* 1AF40 8001A340 00000000 */  nop
/* 1AF44 8001A344 45000029 */  bc1f       .L8001A3EC
/* 1AF48 8001A348 00000000 */   nop
/* 1AF4C 8001A34C C6200010 */  lwc1       $f0, 0x10($s1)
/* 1AF50 8001A350 46001003 */  div.s      $f0, $f2, $f0
/* 1AF54 8001A354 46160002 */  mul.s      $f0, $f0, $f22
/* 1AF58 8001A358 46002000 */  add.s      $f0, $f4, $f0
/* 1AF5C 8001A35C 4600103C */  c.lt.s     $f2, $f0
/* 1AF60 8001A360 00000000 */  nop
/* 1AF64 8001A364 45000002 */  bc1f       .L8001A370
/* 1AF68 8001A368 E620002C */   swc1      $f0, 0x2c($s1)
/* 1AF6C 8001A36C E622002C */  swc1       $f2, 0x2c($s1)
.L8001A370:
/* 1AF70 8001A370 27A40018 */  addiu      $a0, $sp, 0x18
/* 1AF74 8001A374 02802821 */  addu       $a1, $s4, $zero
/* 1AF78 8001A378 0C02AB26 */  jal        Vec3A_BsubC
/* 1AF7C 8001A37C 02403021 */   addu      $a2, $s2, $zero
/* 1AF80 8001A380 0C02ABBB */  jal        vec3_normalize
/* 1AF84 8001A384 27A40018 */   addiu     $a0, $sp, 0x18
/* 1AF88 8001A388 C62C002C */  lwc1       $f12, 0x2c($s1)
/* 1AF8C 8001A38C 0C02FB50 */  jal        __cosf
/* 1AF90 8001A390 46000506 */   mov.s     $f20, $f0
/* 1AF94 8001A394 3C01800E */  lui        $at, %hi(D_800D957C)
/* 1AF98 8001A398 C422957C */  lwc1       $f2, %lo(D_800D957C)($at)
/* 1AF9C 8001A39C 46020001 */  sub.s      $f0, $f0, $f2
/* 1AFA0 8001A3A0 3C01800E */  lui        $at, %hi(D_800D9580)
/* 1AFA4 8001A3A4 C4249580 */  lwc1       $f4, %lo(D_800D9580)($at)
/* 1AFA8 8001A3A8 46040002 */  mul.s      $f0, $f0, $f4
/* 1AFAC 8001A3AC 00000000 */  nop
/* 1AFB0 8001A3B0 4600A502 */  mul.s      $f20, $f20, $f0
/* 1AFB4 8001A3B4 4600A507 */  neg.s      $f20, $f20
/* 1AFB8 8001A3B8 4405A000 */  mfc1       $a1, $f20
/* 1AFBC 8001A3BC 0C02AD3C */  jal        multiVec3
/* 1AFC0 8001A3C0 27A40018 */   addiu     $a0, $sp, 0x18
/* 1AFC4 8001A3C4 27A40018 */  addiu      $a0, $sp, 0x18
/* 1AFC8 8001A3C8 00802821 */  addu       $a1, $a0, $zero
/* 1AFCC 8001A3CC 0C02AB4D */  jal        vec3_sum
/* 1AFD0 8001A3D0 02403021 */   addu      $a2, $s2, $zero
/* 1AFD4 8001A3D4 02602021 */  addu       $a0, $s3, $zero
/* 1AFD8 8001A3D8 96250002 */  lhu        $a1, 2($s1)
/* 1AFDC 8001A3DC 0C0067D8 */  jal        copy_to_aim_or_pos
/* 1AFE0 8001A3E0 27A60018 */   addiu     $a2, $sp, 0x18
/* 1AFE4 8001A3E4 080068FE */  j          .L8001A3F8
/* 1AFE8 8001A3E8 96220002 */   lhu       $v0, 2($s1)
.L8001A3EC:
/* 1AFEC 8001A3EC 56C00001 */  bnel       $s6, $zero, .L8001A3F4
/* 1AFF0 8001A3F0 24170001 */   addiu     $s7, $zero, 1
.L8001A3F4:
/* 1AFF4 8001A3F4 96220002 */  lhu        $v0, 2($s1)
.L8001A3F8:
/* 1AFF8 8001A3F8 30420008 */  andi       $v0, $v0, 8
/* 1AFFC 8001A3FC 50400035 */  beql       $v0, $zero, .L8001A4D4
/* 1B000 8001A400 96220002 */   lhu       $v0, 2($s1)
/* 1B004 8001A404 C620002C */  lwc1       $f0, 0x2c($s1)
/* 1B008 8001A408 3C01800E */  lui        $at, %hi(D_800D9588)
/* 1B00C 8001A40C D4269588 */  ldc1       $f6, %lo(D_800D9588)($at)
/* 1B010 8001A410 46000121 */  cvt.d.s    $f4, $f0
/* 1B014 8001A414 4626203C */  c.lt.d     $f4, $f6
/* 1B018 8001A418 00000000 */  nop
/* 1B01C 8001A41C 4500002A */  bc1f       .L8001A4C8
/* 1B020 8001A420 00000000 */   nop
/* 1B024 8001A424 C6200010 */  lwc1       $f0, 0x10($s1)
/* 1B028 8001A428 4600B0A1 */  cvt.d.s    $f2, $f22
/* 1B02C 8001A42C 46000021 */  cvt.d.s    $f0, $f0
/* 1B030 8001A430 46203003 */  div.d      $f0, $f6, $f0
/* 1B034 8001A434 46220002 */  mul.d      $f0, $f0, $f2
/* 1B038 8001A438 46202000 */  add.d      $f0, $f4, $f0
/* 1B03C 8001A43C 46200020 */  cvt.s.d    $f0, $f0
/* 1B040 8001A440 460000A1 */  cvt.d.s    $f2, $f0
/* 1B044 8001A444 4622303C */  c.lt.d     $f6, $f2
/* 1B048 8001A448 00000000 */  nop
/* 1B04C 8001A44C 45000004 */  bc1f       .L8001A460
/* 1B050 8001A450 E620002C */   swc1      $f0, 0x2c($s1)
/* 1B054 8001A454 3C01800E */  lui        $at, %hi(D_800D9590)
/* 1B058 8001A458 C4209590 */  lwc1       $f0, %lo(D_800D9590)($at)
/* 1B05C 8001A45C E620002C */  swc1       $f0, 0x2c($s1)
.L8001A460:
/* 1B060 8001A460 27A40018 */  addiu      $a0, $sp, 0x18
/* 1B064 8001A464 02802821 */  addu       $a1, $s4, $zero
/* 1B068 8001A468 0C02AB26 */  jal        Vec3A_BsubC
/* 1B06C 8001A46C 02403021 */   addu      $a2, $s2, $zero
/* 1B070 8001A470 0C02ABBB */  jal        vec3_normalize
/* 1B074 8001A474 27A40018 */   addiu     $a0, $sp, 0x18
/* 1B078 8001A478 C62C002C */  lwc1       $f12, 0x2c($s1)
/* 1B07C 8001A47C 0C02FB50 */  jal        __cosf
/* 1B080 8001A480 46000506 */   mov.s     $f20, $f0
/* 1B084 8001A484 3C01800E */  lui        $at, %hi(D_800D9594)
/* 1B088 8001A488 C4229594 */  lwc1       $f2, %lo(D_800D9594)($at)
/* 1B08C 8001A48C 46001081 */  sub.s      $f2, $f2, $f0
/* 1B090 8001A490 4602A502 */  mul.s      $f20, $f20, $f2
/* 1B094 8001A494 4405A000 */  mfc1       $a1, $f20
/* 1B098 8001A498 0C02AD3C */  jal        multiVec3
/* 1B09C 8001A49C 27A40018 */   addiu     $a0, $sp, 0x18
/* 1B0A0 8001A4A0 27A40018 */  addiu      $a0, $sp, 0x18
/* 1B0A4 8001A4A4 00802821 */  addu       $a1, $a0, $zero
/* 1B0A8 8001A4A8 0C02AB4D */  jal        vec3_sum
/* 1B0AC 8001A4AC 02403021 */   addu      $a2, $s2, $zero
/* 1B0B0 8001A4B0 02602021 */  addu       $a0, $s3, $zero
/* 1B0B4 8001A4B4 96250002 */  lhu        $a1, 2($s1)
/* 1B0B8 8001A4B8 0C0067D8 */  jal        copy_to_aim_or_pos
/* 1B0BC 8001A4BC 27A60018 */   addiu     $a2, $sp, 0x18
/* 1B0C0 8001A4C0 08006935 */  j          .L8001A4D4
/* 1B0C4 8001A4C4 96220002 */   lhu       $v0, 2($s1)
.L8001A4C8:
/* 1B0C8 8001A4C8 56C00001 */  bnel       $s6, $zero, .L8001A4D0
/* 1B0CC 8001A4CC 24170001 */   addiu     $s7, $zero, 1
.L8001A4D0:
/* 1B0D0 8001A4D0 96220002 */  lhu        $v0, 2($s1)
.L8001A4D4:
/* 1B0D4 8001A4D4 30420010 */  andi       $v0, $v0, 0x10
/* 1B0D8 8001A4D8 10400031 */  beqz       $v0, .L8001A5A0
/* 1B0DC 8001A4DC 00000000 */   nop
/* 1B0E0 8001A4E0 C620002C */  lwc1       $f0, 0x2c($s1)
/* 1B0E4 8001A4E4 3C01800E */  lui        $at, %hi(D_800D9598)
/* 1B0E8 8001A4E8 D4269598 */  ldc1       $f6, %lo(D_800D9598)($at)
/* 1B0EC 8001A4EC 46000121 */  cvt.d.s    $f4, $f0
/* 1B0F0 8001A4F0 4626203C */  c.lt.d     $f4, $f6
/* 1B0F4 8001A4F4 00000000 */  nop
/* 1B0F8 8001A4F8 45000027 */  bc1f       .L8001A598
/* 1B0FC 8001A4FC 00000000 */   nop
/* 1B100 8001A500 C6200010 */  lwc1       $f0, 0x10($s1)
/* 1B104 8001A504 4600B0A1 */  cvt.d.s    $f2, $f22
/* 1B108 8001A508 46000021 */  cvt.d.s    $f0, $f0
/* 1B10C 8001A50C 46203003 */  div.d      $f0, $f6, $f0
/* 1B110 8001A510 46220002 */  mul.d      $f0, $f0, $f2
/* 1B114 8001A514 46202000 */  add.d      $f0, $f4, $f0
/* 1B118 8001A518 46200020 */  cvt.s.d    $f0, $f0
/* 1B11C 8001A51C 460000A1 */  cvt.d.s    $f2, $f0
/* 1B120 8001A520 4622303C */  c.lt.d     $f6, $f2
/* 1B124 8001A524 00000000 */  nop
/* 1B128 8001A528 45000004 */  bc1f       .L8001A53C
/* 1B12C 8001A52C E620002C */   swc1      $f0, 0x2c($s1)
/* 1B130 8001A530 3C01800E */  lui        $at, %hi(D_800D95A0)
/* 1B134 8001A534 C42095A0 */  lwc1       $f0, %lo(D_800D95A0)($at)
/* 1B138 8001A538 E620002C */  swc1       $f0, 0x2c($s1)
.L8001A53C:
/* 1B13C 8001A53C 27A40018 */  addiu      $a0, $sp, 0x18
/* 1B140 8001A540 02802821 */  addu       $a1, $s4, $zero
/* 1B144 8001A544 0C02AB26 */  jal        Vec3A_BsubC
/* 1B148 8001A548 02403021 */   addu      $a2, $s2, $zero
/* 1B14C 8001A54C 0C02ABBB */  jal        vec3_normalize
/* 1B150 8001A550 27A40018 */   addiu     $a0, $sp, 0x18
/* 1B154 8001A554 C62C002C */  lwc1       $f12, 0x2c($s1)
/* 1B158 8001A558 0C03328C */  jal        __sinf
/* 1B15C 8001A55C 46000506 */   mov.s     $f20, $f0
/* 1B160 8001A560 4600A502 */  mul.s      $f20, $f20, $f0
/* 1B164 8001A564 4405A000 */  mfc1       $a1, $f20
/* 1B168 8001A568 0C02AD3C */  jal        multiVec3
/* 1B16C 8001A56C 27A40018 */   addiu     $a0, $sp, 0x18
/* 1B170 8001A570 27A40018 */  addiu      $a0, $sp, 0x18
/* 1B174 8001A574 00802821 */  addu       $a1, $a0, $zero
/* 1B178 8001A578 0C02AB4D */  jal        vec3_sum
/* 1B17C 8001A57C 02403021 */   addu      $a2, $s2, $zero
/* 1B180 8001A580 02602021 */  addu       $a0, $s3, $zero
/* 1B184 8001A584 96250002 */  lhu        $a1, 2($s1)
/* 1B188 8001A588 0C0067D8 */  jal        copy_to_aim_or_pos
/* 1B18C 8001A58C 27A60018 */   addiu     $a2, $sp, 0x18
/* 1B190 8001A590 08006968 */  j          .L8001A5A0
/* 1B194 8001A594 00000000 */   nop
.L8001A598:
/* 1B198 8001A598 56C00001 */  bnel       $s6, $zero, .L8001A5A0
/* 1B19C 8001A59C 24170001 */   addiu     $s7, $zero, 1
.L8001A5A0:
/* 1B1A0 8001A5A0 56E00001 */  bnel       $s7, $zero, .L8001A5A8
/* 1B1A4 8001A5A4 AE200004 */   sw        $zero, 4($s1)
.L8001A5A8:
/* 1B1A8 8001A5A8 96220002 */  lhu        $v0, 2($s1)
/* 1B1AC 8001A5AC 30422000 */  andi       $v0, $v0, 0x2000
/* 1B1B0 8001A5B0 10400013 */  beqz       $v0, .L8001A600
/* 1B1B4 8001A5B4 02A02021 */   addu      $a0, $s5, $zero
/* 1B1B8 8001A5B8 26700024 */  addiu      $s0, $s3, 0x24
/* 1B1BC 8001A5BC 0C02AD17 */  jal        copyVec3
/* 1B1C0 8001A5C0 02002821 */   addu      $a1, $s0, $zero
/* 1B1C4 8001A5C4 2664000C */  addiu      $a0, $s3, 0xc
/* 1B1C8 8001A5C8 C6600028 */  lwc1       $f0, 0x28($s3)
/* 1B1CC 8001A5CC C662006C */  lwc1       $f2, 0x6c($s3)
/* 1B1D0 8001A5D0 3C0641C0 */  lui        $a2, 0x41c0
/* 1B1D4 8001A5D4 3C01800E */  lui        $at, %hi(D_800D95A4)
/* 1B1D8 8001A5D8 C42495A4 */  lwc1       $f4, %lo(D_800D95A4)($at)
/* 1B1DC 8001A5DC 46020000 */  add.s      $f0, $f0, $f2
/* 1B1E0 8001A5E0 02002821 */  addu       $a1, $s0, $zero
/* 1B1E4 8001A5E4 E7A40010 */  swc1       $f4, 0x10($sp)
/* 1B1E8 8001A5E8 E6600028 */  swc1       $f0, 0x28($s3)
/* 1B1EC 8001A5EC 4600B00D */  trunc.w.s  $f0, $f22
/* 1B1F0 8001A5F0 44070000 */  mfc1       $a3, $f0
/* 1B1F4 8001A5F4 00073C00 */  sll        $a3, $a3, 0x10
/* 1B1F8 8001A5F8 0C02C0F2 */  jal        adust_camera_aim
/* 1B1FC 8001A5FC 00073C03 */   sra       $a3, $a3, 0x10
.L8001A600:
/* 1B200 8001A600 96220002 */  lhu        $v0, 2($s1)
/* 1B204 8001A604 30420100 */  andi       $v0, $v0, 0x100
/* 1B208 8001A608 5040000B */  beql       $v0, $zero, .L8001A638
/* 1B20C 8001A60C 96220002 */   lhu       $v0, 2($s1)
/* 1B210 8001A610 C620000C */  lwc1       $f0, 0xc($s1)
/* 1B214 8001A614 C6620064 */  lwc1       $f2, 0x64($s3)
/* 1B218 8001A618 4602003C */  c.lt.s     $f0, $f2
/* 1B21C 8001A61C 00000000 */  nop
/* 1B220 8001A620 45000002 */  bc1f       .L8001A62C
/* 1B224 8001A624 E660005C */   swc1      $f0, 0x5c($s3)
/* 1B228 8001A628 E662005C */  swc1       $f2, 0x5c($s3)
.L8001A62C:
/* 1B22C 8001A62C 2402001E */  addiu      $v0, $zero, 0x1e
/* 1B230 8001A630 A6620068 */  sh         $v0, 0x68($s3)
/* 1B234 8001A634 96220002 */  lhu        $v0, 2($s1)
.L8001A638:
/* 1B238 8001A638 30420200 */  andi       $v0, $v0, 0x200
/* 1B23C 8001A63C 10400005 */  beqz       $v0, .L8001A654
/* 1B240 8001A640 02602021 */   addu      $a0, $s3, $zero
/* 1B244 8001A644 C6200008 */  lwc1       $f0, 8($s1)
/* 1B248 8001A648 02A02821 */  addu       $a1, $s5, $zero
/* 1B24C 8001A64C 0C02C131 */  jal        func_800B04C4
/* 1B250 8001A650 E6600048 */   swc1      $f0, 0x48($s3)
.L8001A654:
/* 1B254 8001A654 96220002 */  lhu        $v0, 2($s1)
/* 1B258 8001A658 3042C000 */  andi       $v0, $v0, 0xc000
/* 1B25C 8001A65C 10400004 */  beqz       $v0, .L8001A670
/* 1B260 8001A660 27C368A8 */   addiu     $v1, $fp, 0x68a8
/* 1B264 8001A664 0C02C0C6 */  jal        camera_orient
/* 1B268 8001A668 02602021 */   addu      $a0, $s3, $zero
/* 1B26C 8001A66C 27C368A8 */  addiu      $v1, $fp, 0x68a8
.L8001A670:
/* 1B270 8001A670 8C620008 */  lw         $v0, 8($v1)
/* 1B274 8001A674 24420002 */  addiu      $v0, $v0, 2
/* 1B278 8001A678 AE220004 */  sw         $v0, 4($s1)
.L8001A67C:
/* 1B27C 8001A67C 8FBF00FC */  lw         $ra, 0xfc($sp)
.L8001A680:
/* 1B280 8001A680 8FBE00F8 */  lw         $fp, 0xf8($sp)
/* 1B284 8001A684 8FB700F4 */  lw         $s7, 0xf4($sp)
/* 1B288 8001A688 8FB600F0 */  lw         $s6, 0xf0($sp)
/* 1B28C 8001A68C 8FB500EC */  lw         $s5, 0xec($sp)
/* 1B290 8001A690 8FB400E8 */  lw         $s4, 0xe8($sp)
/* 1B294 8001A694 8FB300E4 */  lw         $s3, 0xe4($sp)
/* 1B298 8001A698 8FB200E0 */  lw         $s2, 0xe0($sp)
/* 1B29C 8001A69C 8FB100DC */  lw         $s1, 0xdc($sp)
/* 1B2A0 8001A6A0 8FB000D8 */  lw         $s0, 0xd8($sp)
/* 1B2A4 8001A6A4 D7B60108 */  ldc1       $f22, 0x108($sp)
/* 1B2A8 8001A6A8 D7B40100 */  ldc1       $f20, 0x100($sp)
/* 1B2AC 8001A6AC 03E00008 */  jr         $ra
/* 1B2B0 8001A6B0 27BD0110 */   addiu     $sp, $sp, 0x110

glabel InitScriptCameras
/* 1B2B4 8001A6B4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 1B2B8 8001A6B8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1B2BC 8001A6BC 00809821 */  addu       $s3, $a0, $zero
/* 1B2C0 8001A6C0 AFBF0028 */  sw         $ra, 0x28($sp)
/* 1B2C4 8001A6C4 AFB50024 */  sw         $s5, 0x24($sp)
/* 1B2C8 8001A6C8 AFB40020 */  sw         $s4, 0x20($sp)
/* 1B2CC 8001A6CC AFB20018 */  sw         $s2, 0x18($sp)
/* 1B2D0 8001A6D0 AFB10014 */  sw         $s1, 0x14($sp)
/* 1B2D4 8001A6D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 1B2D8 8001A6D8 96620016 */  lhu        $v0, 0x16($s3)
/* 1B2DC 8001A6DC 10400005 */  beqz       $v0, .L8001A6F4
/* 1B2E0 8001A6E0 3C05800E */   lui       $a1, %hi(D_800D95BC)
/* 1B2E4 8001A6E4 3C04800E */  lui        $a0, %hi(D_800D95A8)
/* 1B2E8 8001A6E8 248495A8 */  addiu      $a0, $a0, %lo(D_800D95A8)
/* 1B2EC 8001A6EC 0C025F2D */  jal        manualCrash
/* 1B2F0 8001A6F0 24A595BC */   addiu     $a1, $a1, %lo(D_800D95BC)
.L8001A6F4:
/* 1B2F4 8001A6F4 240403E0 */  addiu      $a0, $zero, 0x3e0
/* 1B2F8 8001A6F8 3C05800E */  lui        $a1, %hi(D_800D95D4)
/* 1B2FC 8001A6FC 24A595D4 */  addiu      $a1, $a1, %lo(D_800D95D4)
/* 1B300 8001A700 24060237 */  addiu      $a2, $zero, 0x237
/* 1B304 8001A704 24020001 */  addiu      $v0, $zero, 1
/* 1B308 8001A708 0C025F9C */  jal        Malloc
/* 1B30C 8001A70C A6620016 */   sh        $v0, 0x16($s3)
/* 1B310 8001A710 00009021 */  addu       $s2, $zero, $zero
/* 1B314 8001A714 3C140001 */  lui        $s4, 1
/* 1B318 8001A718 26710004 */  addiu      $s1, $s3, 4
/* 1B31C 8001A71C 00008021 */  addu       $s0, $zero, $zero
/* 1B320 8001A720 3C150001 */  lui        $s5, 1
/* 1B324 8001A724 AE620000 */  sw         $v0, ($s3)
/* 1B328 8001A728 A6600014 */  sh         $zero, 0x14($s3)
.L8001A72C:
/* 1B32C 8001A72C 00002821 */  addu       $a1, $zero, $zero
/* 1B330 8001A730 8E640000 */  lw         $a0, ($s3)
/* 1B334 8001A734 2406007C */  addiu      $a2, $zero, 0x7c
/* 1B338 8001A738 0C026380 */  jal        Calloc
/* 1B33C 8001A73C 00902021 */   addu      $a0, $a0, $s0
/* 1B340 8001A740 02801821 */  addu       $v1, $s4, $zero
/* 1B344 8001A744 8E620000 */  lw         $v0, ($s3)
/* 1B348 8001A748 0295A021 */  addu       $s4, $s4, $s5
/* 1B34C 8001A74C A6320000 */  sh         $s2, ($s1)
/* 1B350 8001A750 26310002 */  addiu      $s1, $s1, 2
/* 1B354 8001A754 02021021 */  addu       $v0, $s0, $v0
/* 1B358 8001A758 A4520002 */  sh         $s2, 2($v0)
/* 1B35C 8001A75C 00039403 */  sra        $s2, $v1, 0x10
/* 1B360 8001A760 2A420008 */  slti       $v0, $s2, 8
/* 1B364 8001A764 1440FFF1 */  bnez       $v0, .L8001A72C
/* 1B368 8001A768 2610007C */   addiu     $s0, $s0, 0x7c
/* 1B36C 8001A76C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 1B370 8001A770 8FB50024 */  lw         $s5, 0x24($sp)
/* 1B374 8001A774 8FB40020 */  lw         $s4, 0x20($sp)
/* 1B378 8001A778 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1B37C 8001A77C 8FB20018 */  lw         $s2, 0x18($sp)
/* 1B380 8001A780 8FB10014 */  lw         $s1, 0x14($sp)
/* 1B384 8001A784 8FB00010 */  lw         $s0, 0x10($sp)
/* 1B388 8001A788 03E00008 */  jr         $ra
/* 1B38C 8001A78C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel freeScriptCameras
/* 1B390 8001A790 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1B394 8001A794 AFB20018 */  sw         $s2, 0x18($sp)
/* 1B398 8001A798 00809021 */  addu       $s2, $a0, $zero
/* 1B39C 8001A79C AFBF0020 */  sw         $ra, 0x20($sp)
/* 1B3A0 8001A7A0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 1B3A4 8001A7A4 AFB10014 */  sw         $s1, 0x14($sp)
/* 1B3A8 8001A7A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 1B3AC 8001A7AC 96420016 */  lhu        $v0, 0x16($s2)
/* 1B3B0 8001A7B0 14400007 */  bnez       $v0, .L8001A7D0
/* 1B3B4 8001A7B4 3C110001 */   lui       $s1, 1
/* 1B3B8 8001A7B8 3C04800E */  lui        $a0, %hi(D_800D95EC)
/* 1B3BC 8001A7BC 248495EC */  addiu      $a0, $a0, %lo(D_800D95EC)
/* 1B3C0 8001A7C0 3C05800E */  lui        $a1, %hi(D_800D9600)
/* 1B3C4 8001A7C4 0C025F2D */  jal        manualCrash
/* 1B3C8 8001A7C8 24A59600 */   addiu     $a1, $a1, %lo(D_800D9600)
/* 1B3CC 8001A7CC 3C110001 */  lui        $s1, 1
.L8001A7D0:
/* 1B3D0 8001A7D0 00008021 */  addu       $s0, $zero, $zero
/* 1B3D4 8001A7D4 3C130001 */  lui        $s3, 1
.L8001A7D8:
/* 1B3D8 8001A7D8 8E450000 */  lw         $a1, ($s2)
/* 1B3DC 8001A7DC 02402021 */  addu       $a0, $s2, $zero
/* 1B3E0 8001A7E0 0C006A43 */  jal        func_8001A90C
/* 1B3E4 8001A7E4 00B02821 */   addu      $a1, $a1, $s0
/* 1B3E8 8001A7E8 02201021 */  addu       $v0, $s1, $zero
/* 1B3EC 8001A7EC 02338821 */  addu       $s1, $s1, $s3
/* 1B3F0 8001A7F0 00021403 */  sra        $v0, $v0, 0x10
/* 1B3F4 8001A7F4 28420008 */  slti       $v0, $v0, 8
/* 1B3F8 8001A7F8 1440FFF7 */  bnez       $v0, .L8001A7D8
/* 1B3FC 8001A7FC 2610007C */   addiu     $s0, $s0, 0x7c
/* 1B400 8001A800 3C05800E */  lui        $a1, %hi(D_800D95D4)
/* 1B404 8001A804 24A595D4 */  addiu      $a1, $a1, %lo(D_800D95D4)
/* 1B408 8001A808 8E440000 */  lw         $a0, ($s2)
/* 1B40C 8001A80C 24060259 */  addiu      $a2, $zero, 0x259
/* 1B410 8001A810 0C02600C */  jal        Free
/* 1B414 8001A814 A6400016 */   sh        $zero, 0x16($s2)
/* 1B418 8001A818 8FBF0020 */  lw         $ra, 0x20($sp)
/* 1B41C 8001A81C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 1B420 8001A820 AE400000 */  sw         $zero, ($s2)
/* 1B424 8001A824 8FB20018 */  lw         $s2, 0x18($sp)
/* 1B428 8001A828 8FB10014 */  lw         $s1, 0x14($sp)
/* 1B42C 8001A82C 8FB00010 */  lw         $s0, 0x10($sp)
/* 1B430 8001A830 03E00008 */  jr         $ra
/* 1B434 8001A834 27BD0028 */   addiu     $sp, $sp, 0x28

glabel AllocScriptCamera
/* 1B438 8001A838 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1B43C 8001A83C 00052C00 */  sll        $a1, $a1, 0x10
/* 1B440 8001A840 AFB20018 */  sw         $s2, 0x18($sp)
/* 1B444 8001A844 00059403 */  sra        $s2, $a1, 0x10
/* 1B448 8001A848 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1B44C 8001A84C AFB10014 */  sw         $s1, 0x14($sp)
/* 1B450 8001A850 AFB00010 */  sw         $s0, 0x10($sp)
/* 1B454 8001A854 94820014 */  lhu        $v0, 0x14($a0)
/* 1B458 8001A858 8C850000 */  lw         $a1, ($a0)
/* 1B45C 8001A85C 24460001 */  addiu      $a2, $v0, 1
/* 1B460 8001A860 3042FFFF */  andi       $v0, $v0, 0xffff
/* 1B464 8001A864 00021040 */  sll        $v0, $v0, 1
/* 1B468 8001A868 00821021 */  addu       $v0, $a0, $v0
/* 1B46C 8001A86C A4860014 */  sh         $a2, 0x14($a0)
/* 1B470 8001A870 30C6FFFF */  andi       $a2, $a2, 0xffff
/* 1B474 8001A874 94430004 */  lhu        $v1, 4($v0)
/* 1B478 8001A878 2CC60008 */  sltiu      $a2, $a2, 8
/* 1B47C 8001A87C 00031140 */  sll        $v0, $v1, 5
/* 1B480 8001A880 00431023 */  subu       $v0, $v0, $v1
/* 1B484 8001A884 00021080 */  sll        $v0, $v0, 2
/* 1B488 8001A888 14C00006 */  bnez       $a2, .L8001A8A4
/* 1B48C 8001A88C 00A28821 */   addu      $s1, $a1, $v0
/* 1B490 8001A890 3C04800E */  lui        $a0, %hi(D_800D9618)
/* 1B494 8001A894 24849618 */  addiu      $a0, $a0, %lo(D_800D9618)
/* 1B498 8001A898 3C05800E */  lui        $a1, %hi(D_800D962C)
/* 1B49C 8001A89C 0C025F2D */  jal        manualCrash
/* 1B4A0 8001A8A0 24A5962C */   addiu     $a1, $a1, %lo(D_800D962C)
.L8001A8A4:
/* 1B4A4 8001A8A4 02202021 */  addu       $a0, $s1, $zero
/* 1B4A8 8001A8A8 00002821 */  addu       $a1, $zero, $zero
/* 1B4AC 8001A8AC 2406007C */  addiu      $a2, $zero, 0x7c
/* 1B4B0 8001A8B0 0C026380 */  jal        Calloc
/* 1B4B4 8001A8B4 96300002 */   lhu       $s0, 2($s1)
/* 1B4B8 8001A8B8 02201021 */  addu       $v0, $s1, $zero
/* 1B4BC 8001A8BC 3C01800E */  lui        $at, %hi(D_800D9640)
/* 1B4C0 8001A8C0 C4229640 */  lwc1       $f2, %lo(D_800D9640)($at)
/* 1B4C4 8001A8C4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1B4C8 8001A8C8 44920000 */  mtc1       $s2, $f0
/* 1B4CC 8001A8CC 46800020 */  cvt.s.w    $f0, $f0
/* 1B4D0 8001A8D0 A6320004 */  sh         $s2, 4($s1)
/* 1B4D4 8001A8D4 8FB20018 */  lw         $s2, 0x18($sp)
/* 1B4D8 8001A8D8 24030001 */  addiu      $v1, $zero, 1
/* 1B4DC 8001A8DC A6230000 */  sh         $v1, ($s1)
/* 1B4E0 8001A8E0 24030008 */  addiu      $v1, $zero, 8
/* 1B4E4 8001A8E4 A6230026 */  sh         $v1, 0x26($s1)
/* 1B4E8 8001A8E8 34038000 */  ori        $v1, $zero, 0x8000
/* 1B4EC 8001A8EC E6200048 */  swc1       $f0, 0x48($s1)
/* 1B4F0 8001A8F0 A6230024 */  sh         $v1, 0x24($s1)
/* 1B4F4 8001A8F4 A6300002 */  sh         $s0, 2($s1)
/* 1B4F8 8001A8F8 E622001C */  swc1       $f2, 0x1c($s1)
/* 1B4FC 8001A8FC 8FB10014 */  lw         $s1, 0x14($sp)
/* 1B500 8001A900 8FB00010 */  lw         $s0, 0x10($sp)
/* 1B504 8001A904 03E00008 */  jr         $ra
/* 1B508 8001A908 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8001A90C
/* 1B50C 8001A90C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1B510 8001A910 AFB00010 */  sw         $s0, 0x10($sp)
/* 1B514 8001A914 00A08021 */  addu       $s0, $a1, $zero
/* 1B518 8001A918 AFBF0018 */  sw         $ra, 0x18($sp)
/* 1B51C 8001A91C AFB10014 */  sw         $s1, 0x14($sp)
/* 1B520 8001A920 96020000 */  lhu        $v0, ($s0)
/* 1B524 8001A924 10400018 */  beqz       $v0, .L8001A988
/* 1B528 8001A928 00808821 */   addu      $s1, $a0, $zero
/* 1B52C 8001A92C 96020006 */  lhu        $v0, 6($s0)
/* 1B530 8001A930 30420001 */  andi       $v0, $v0, 1
/* 1B534 8001A934 50400004 */  beql       $v0, $zero, .L8001A948
/* 1B538 8001A938 96220014 */   lhu       $v0, 0x14($s1)
/* 1B53C 8001A93C 0C00672F */  jal        clear_some_playerHandler_field
/* 1B540 8001A940 00000000 */   nop
/* 1B544 8001A944 96220014 */  lhu        $v0, 0x14($s1)
.L8001A948:
/* 1B548 8001A948 2442FFFF */  addiu      $v0, $v0, -1
/* 1B54C 8001A94C A6220014 */  sh         $v0, 0x14($s1)
/* 1B550 8001A950 3042FFFF */  andi       $v0, $v0, 0xffff
/* 1B554 8001A954 00021040 */  sll        $v0, $v0, 1
/* 1B558 8001A958 96040002 */  lhu        $a0, 2($s0)
/* 1B55C 8001A95C 02221021 */  addu       $v0, $s1, $v0
/* 1B560 8001A960 A4440004 */  sh         $a0, 4($v0)
/* 1B564 8001A964 96030006 */  lhu        $v1, 6($s0)
/* 1B568 8001A968 30630002 */  andi       $v1, $v1, 2
/* 1B56C 8001A96C 10600006 */  beqz       $v1, .L8001A988
/* 1B570 8001A970 A6000000 */   sh        $zero, ($s0)
/* 1B574 8001A974 96220014 */  lhu        $v0, 0x14($s1)
/* 1B578 8001A978 14400004 */  bnez       $v0, .L8001A98C
/* 1B57C 8001A97C 8FBF0018 */   lw        $ra, 0x18($sp)
/* 1B580 8001A980 0C00672F */  jal        clear_some_playerHandler_field
/* 1B584 8001A984 00000000 */   nop
.L8001A988:
/* 1B588 8001A988 8FBF0018 */  lw         $ra, 0x18($sp)
.L8001A98C:
/* 1B58C 8001A98C 8FB10014 */  lw         $s1, 0x14($sp)
/* 1B590 8001A990 8FB00010 */  lw         $s0, 0x10($sp)
/* 1B594 8001A994 03E00008 */  jr         $ra
/* 1B598 8001A998 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ProcessScriptCamera
/* 1B59C 8001A99C 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 1B5A0 8001A9A0 AFB10054 */  sw         $s1, 0x54($sp)
/* 1B5A4 8001A9A4 00808821 */  addu       $s1, $a0, $zero
/* 1B5A8 8001A9A8 AFB00050 */  sw         $s0, 0x50($sp)
/* 1B5AC 8001A9AC 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 1B5B0 8001A9B0 26048920 */  addiu      $a0, $s0, %lo(gGlobalsText)
/* 1B5B4 8001A9B4 F7B40078 */  sdc1       $f20, 0x78($sp)
/* 1B5B8 8001A9B8 4485A000 */  mtc1       $a1, $f20
/* 1B5BC 8001A9BC 3C02800E */  lui        $v0, 0x800e
/* 1B5C0 8001A9C0 AFBF0074 */  sw         $ra, 0x74($sp)
/* 1B5C4 8001A9C4 AFBE0070 */  sw         $fp, 0x70($sp)
/* 1B5C8 8001A9C8 AFB7006C */  sw         $s7, 0x6c($sp)
/* 1B5CC 8001A9CC AFB60068 */  sw         $s6, 0x68($sp)
/* 1B5D0 8001A9D0 AFB50064 */  sw         $s5, 0x64($sp)
/* 1B5D4 8001A9D4 AFB40060 */  sw         $s4, 0x60($sp)
/* 1B5D8 8001A9D8 AFB3005C */  sw         $s3, 0x5c($sp)
/* 1B5DC 8001A9DC AFB20058 */  sw         $s2, 0x58($sp)
/* 1B5E0 8001A9E0 96230018 */  lhu        $v1, 0x18($s1)
/* 1B5E4 8001A9E4 24459644 */  addiu      $a1, $v0, -0x69bc
/* 1B5E8 8001A9E8 A6200018 */  sh         $zero, 0x18($s1)
/* 1B5EC 8001A9EC 0C0333AC */  jal        sprintf
/* 1B5F0 8001A9F0 A623001A */   sh        $v1, 0x1a($s1)
/* 1B5F4 8001A9F4 96230016 */  lhu        $v1, 0x16($s1)
/* 1B5F8 8001A9F8 1060004F */  beqz       $v1, .L8001AB38
/* 1B5FC 8001A9FC 3C15800F */   lui       $s5, 0x800f
/* 1B600 8001AA00 241E000C */  addiu      $fp, $zero, 0xc
/* 1B604 8001AA04 4600A00D */  trunc.w.s  $f0, $f20
/* 1B608 8001AA08 44160000 */  mfc1       $s6, $f0
/* 1B60C 8001AA0C 3C140001 */  lui        $s4, 1
/* 1B610 8001AA10 00009821 */  addu       $s3, $zero, $zero
/* 1B614 8001AA14 3C170001 */  lui        $s7, 1
.L8001AA18:
/* 1B618 8001AA18 8E220000 */  lw         $v0, ($s1)
/* 1B61C 8001AA1C 00538021 */  addu       $s0, $v0, $s3
/* 1B620 8001AA20 96030000 */  lhu        $v1, ($s0)
/* 1B624 8001AA24 10600021 */  beqz       $v1, .L8001AAAC
/* 1B628 8001AA28 3C04800E */   lui       $a0, %hi(gGlobals)
/* 1B62C 8001AA2C 249268A8 */  addiu      $s2, $a0, %lo(gGlobals)
/* 1B630 8001AA30 92420040 */  lbu        $v0, 0x40($s2)
/* 1B634 8001AA34 545E0005 */  bnel       $v0, $fp, .L8001AA4C
/* 1B638 8001AA38 8E040008 */   lw        $a0, 8($s0)
/* 1B63C 8001AA3C 96220018 */  lhu        $v0, 0x18($s1)
/* 1B640 8001AA40 24420001 */  addiu      $v0, $v0, 1
/* 1B644 8001AA44 A6220018 */  sh         $v0, 0x18($s1)
/* 1B648 8001AA48 8E040008 */  lw         $a0, 8($s0)
.L8001AA4C:
/* 1B64C 8001AA4C 1080000B */  beqz       $a0, .L8001AA7C
/* 1B650 8001AA50 26050010 */   addiu     $a1, $s0, 0x10
/* 1B654 8001AA54 C4820004 */  lwc1       $f2, 4($a0)
/* 1B658 8001AA58 C600000C */  lwc1       $f0, 0xc($s0)
/* 1B65C 8001AA5C 46001080 */  add.s      $f2, $f2, $f0
/* 1B660 8001AA60 8C850000 */  lw         $a1, ($a0)
/* 1B664 8001AA64 8C870008 */  lw         $a3, 8($a0)
/* 1B668 8001AA68 44061000 */  mfc1       $a2, $f2
/* 1B66C 8001AA6C 0C02AD58 */  jal        setVec3
/* 1B670 8001AA70 27A40010 */   addiu     $a0, $sp, 0x10
/* 1B674 8001AA74 27A40010 */  addiu      $a0, $sp, 0x10
/* 1B678 8001AA78 26050010 */  addiu      $a1, $s0, 0x10
.L8001AA7C:
/* 1B67C 8001AA7C 4407A000 */  mfc1       $a3, $f20
/* 1B680 8001AA80 0C0067F0 */  jal        processVoxelCamera
/* 1B684 8001AA84 26460214 */   addiu     $a2, $s2, 0x214
/* 1B688 8001AA88 96020004 */  lhu        $v0, 4($s0)
/* 1B68C 8001AA8C 00561023 */  subu       $v0, $v0, $s6
/* 1B690 8001AA90 A6020004 */  sh         $v0, 4($s0)
/* 1B694 8001AA94 00021400 */  sll        $v0, $v0, 0x10
/* 1B698 8001AA98 1C400005 */  bgtz       $v0, .L8001AAB0
/* 1B69C 8001AA9C 02801021 */   addu      $v0, $s4, $zero
/* 1B6A0 8001AAA0 02202021 */  addu       $a0, $s1, $zero
/* 1B6A4 8001AAA4 0C006A43 */  jal        func_8001A90C
/* 1B6A8 8001AAA8 02002821 */   addu      $a1, $s0, $zero
.L8001AAAC:
/* 1B6AC 8001AAAC 02801021 */  addu       $v0, $s4, $zero
.L8001AAB0:
/* 1B6B0 8001AAB0 0297A021 */  addu       $s4, $s4, $s7
/* 1B6B4 8001AAB4 00021403 */  sra        $v0, $v0, 0x10
/* 1B6B8 8001AAB8 28420008 */  slti       $v0, $v0, 8
/* 1B6BC 8001AABC 1440FFD6 */  bnez       $v0, .L8001AA18
/* 1B6C0 8001AAC0 2673007C */   addiu     $s3, $s3, 0x7c
/* 1B6C4 8001AAC4 3C02800F */  lui        $v0, %hi(some_toggle)
/* 1B6C8 8001AAC8 84449AA4 */  lh         $a0, %lo(some_toggle)($v0)
/* 1B6CC 8001AACC 2403FFFF */  addiu      $v1, $zero, -1
/* 1B6D0 8001AAD0 54830001 */  bnel       $a0, $v1, .L8001AAD8
/* 1B6D4 8001AAD4 A6A08EF8 */   sh        $zero, -0x7108($s5)
.L8001AAD8:
/* 1B6D8 8001AAD8 86A28EF8 */  lh         $v0, -0x7108($s5)
/* 1B6DC 8001AADC 10400011 */  beqz       $v0, .L8001AB24
/* 1B6E0 8001AAE0 96A38EF8 */   lhu       $v1, -0x7108($s5)
/* 1B6E4 8001AAE4 4600A00D */  trunc.w.s  $f0, $f20
/* 1B6E8 8001AAE8 44020000 */  mfc1       $v0, $f0
/* 1B6EC 8001AAEC 00621023 */  subu       $v0, $v1, $v0
/* 1B6F0 8001AAF0 A6A28EF8 */  sh         $v0, -0x7108($s5)
/* 1B6F4 8001AAF4 00021400 */  sll        $v0, $v0, 0x10
/* 1B6F8 8001AAF8 04420001 */  bltzl      $v0, .L8001AB00
/* 1B6FC 8001AAFC A6A08EF8 */   sh        $zero, -0x7108($s5)
.L8001AB00:
/* 1B700 8001AB00 3C02800F */  lui        $v0, %hi(cameraVoxelPointer)
/* 1B704 8001AB04 8C458EF0 */  lw         $a1, %lo(cameraVoxelPointer)($v0)
/* 1B708 8001AB08 10A00006 */  beqz       $a1, .L8001AB24
/* 1B70C 8001AB0C 3C02800F */   lui       $v0, %hi(cameraVec3Ptr)
/* 1B710 8001AB10 3C06800E */  lui        $a2, %hi(Camera)
/* 1B714 8001AB14 8C448EF4 */  lw         $a0, %lo(cameraVec3Ptr)($v0)
/* 1B718 8001AB18 4407A000 */  mfc1       $a3, $f20
/* 1B71C 8001AB1C 0C0067F0 */  jal        processVoxelCamera
/* 1B720 8001AB20 24C66ABC */   addiu     $a2, $a2, %lo(Camera)
.L8001AB24:
/* 1B724 8001AB24 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 1B728 8001AB28 24448920 */  addiu      $a0, $v0, %lo(gGlobalsText)
/* 1B72C 8001AB2C 3C05800E */  lui        $a1, %hi(D_800D965C)
/* 1B730 8001AB30 0C0333AC */  jal        sprintf
/* 1B734 8001AB34 24A5965C */   addiu     $a1, $a1, %lo(D_800D965C)
.L8001AB38:
/* 1B738 8001AB38 8FBF0074 */  lw         $ra, 0x74($sp)
/* 1B73C 8001AB3C 8FBE0070 */  lw         $fp, 0x70($sp)
/* 1B740 8001AB40 8FB7006C */  lw         $s7, 0x6c($sp)
/* 1B744 8001AB44 8FB60068 */  lw         $s6, 0x68($sp)
/* 1B748 8001AB48 8FB50064 */  lw         $s5, 0x64($sp)
/* 1B74C 8001AB4C 8FB40060 */  lw         $s4, 0x60($sp)
/* 1B750 8001AB50 8FB3005C */  lw         $s3, 0x5c($sp)
/* 1B754 8001AB54 8FB20058 */  lw         $s2, 0x58($sp)
/* 1B758 8001AB58 8FB10054 */  lw         $s1, 0x54($sp)
/* 1B75C 8001AB5C 8FB00050 */  lw         $s0, 0x50($sp)
/* 1B760 8001AB60 D7B40078 */  ldc1       $f20, 0x78($sp)
/* 1B764 8001AB64 03E00008 */  jr         $ra
/* 1B768 8001AB68 27BD0080 */   addiu     $sp, $sp, 0x80
/* 1B76C 8001AB6C 00000000 */  nop
