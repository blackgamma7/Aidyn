.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80074CA0
/* 758A0 80074CA0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 758A4 80074CA4 AFB00018 */  sw         $s0, 0x18($sp)
/* 758A8 80074CA8 00808021 */  addu       $s0, $a0, $zero
/* 758AC 80074CAC 3C04B1FE */  lui        $a0, %hi(dialouge_entity)
/* 758B0 80074CB0 24843CE0 */  addiu      $a0, $a0, %lo(dialouge_entity)
/* 758B4 80074CB4 02002821 */  addu       $a1, $s0, $zero
/* 758B8 80074CB8 27A60010 */  addiu      $a2, $sp, 0x10
/* 758BC 80074CBC AFBF001C */  sw         $ra, 0x1c($sp)
/* 758C0 80074CC0 0C01D30C */  jal        load_db_array_size
/* 758C4 80074CC4 AFA00010 */   sw        $zero, 0x10($sp)
/* 758C8 80074CC8 3C05800E */  lui        $a1, %hi(D_800DFE30)
/* 758CC 80074CCC 24A5FE30 */  addiu      $a1, $a1, %lo(D_800DFE30)
/* 758D0 80074CD0 92020000 */  lbu        $v0, ($s0)
/* 758D4 80074CD4 2406002E */  addiu      $a2, $zero, 0x2e
/* 758D8 80074CD8 00022040 */  sll        $a0, $v0, 1
/* 758DC 80074CDC 00822021 */  addu       $a0, $a0, $v0
/* 758E0 80074CE0 00042080 */  sll        $a0, $a0, 2
/* 758E4 80074CE4 00822021 */  addu       $a0, $a0, $v0
/* 758E8 80074CE8 0C025F9C */  jal        Malloc
/* 758EC 80074CEC 00042040 */   sll       $a0, $a0, 1
/* 758F0 80074CF0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 758F4 80074CF4 AE020004 */  sw         $v0, 4($s0)
/* 758F8 80074CF8 8FB00018 */  lw         $s0, 0x18($sp)
/* 758FC 80074CFC 03E00008 */  jr         $ra
/* 75900 80074D00 27BD0020 */   addiu     $sp, $sp, 0x20

glabel load_dialougEnt
/* 75904 80074D04 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 75908 80074D08 AFBF0064 */  sw         $ra, 0x64($sp)
/* 7590C 80074D0C AFB20060 */  sw         $s2, 0x60($sp)
/* 75910 80074D10 AFB1005C */  sw         $s1, 0x5c($sp)
/* 75914 80074D14 AFB00058 */  sw         $s0, 0x58($sp)
/* 75918 80074D18 8C910004 */  lw         $s1, 4($a0)
/* 7591C 80074D1C 27A40018 */  addiu      $a0, $sp, 0x18
/* 75920 80074D20 00C09021 */  addu       $s2, $a2, $zero
/* 75924 80074D24 24060018 */  addiu      $a2, $zero, 0x18
/* 75928 80074D28 3C02800E */  lui        $v0, %hi(D_800DFE30)
/* 7592C 80074D2C 2442FE30 */  addiu      $v0, $v0, %lo(D_800DFE30)
/* 75930 80074D30 2403003F */  addiu      $v1, $zero, 0x3f
/* 75934 80074D34 30A700FF */  andi       $a3, $a1, 0xff
/* 75938 80074D38 3C05B1FE */  lui        $a1, %hi(dialouge_entity)
/* 7593C 80074D3C 24A53CE0 */  addiu      $a1, $a1, %lo(dialouge_entity)
/* 75940 80074D40 AFA20010 */  sw         $v0, 0x10($sp)
/* 75944 80074D44 00071040 */  sll        $v0, $a3, 1
/* 75948 80074D48 00471021 */  addu       $v0, $v0, $a3
/* 7594C 80074D4C 00021080 */  sll        $v0, $v0, 2
/* 75950 80074D50 00471021 */  addu       $v0, $v0, $a3
/* 75954 80074D54 00021040 */  sll        $v0, $v0, 1
/* 75958 80074D58 AFA30014 */  sw         $v1, 0x14($sp)
/* 7595C 80074D5C 8E500000 */  lw         $s0, ($s2)
/* 75960 80074D60 24070001 */  addiu      $a3, $zero, 1
/* 75964 80074D64 02052821 */  addu       $a1, $s0, $a1
/* 75968 80074D68 0C027269 */  jal        RomCopy
/* 7596C 80074D6C 02228821 */   addu      $s1, $s1, $v0
/* 75970 80074D70 26240002 */  addiu      $a0, $s1, 2
/* 75974 80074D74 27A50018 */  addiu      $a1, $sp, 0x18
/* 75978 80074D78 0C033547 */  jal        memcpy
/* 7597C 80074D7C 24060016 */   addiu     $a2, $zero, 0x16
/* 75980 80074D80 26100018 */  addiu      $s0, $s0, 0x18
/* 75984 80074D84 A2200018 */  sb         $zero, 0x18($s1)
/* 75988 80074D88 AE500000 */  sw         $s0, ($s2)
/* 7598C 80074D8C 93A2002F */  lbu        $v0, 0x2f($sp)
/* 75990 80074D90 93A3002E */  lbu        $v1, 0x2e($sp)
/* 75994 80074D94 8FBF0064 */  lw         $ra, 0x64($sp)
/* 75998 80074D98 8FB20060 */  lw         $s2, 0x60($sp)
/* 7599C 80074D9C 8FB00058 */  lw         $s0, 0x58($sp)
/* 759A0 80074DA0 00021200 */  sll        $v0, $v0, 8
/* 759A4 80074DA4 00621821 */  addu       $v1, $v1, $v0
/* 759A8 80074DA8 A6230000 */  sh         $v1, ($s1)
/* 759AC 80074DAC 8FB1005C */  lw         $s1, 0x5c($sp)
/* 759B0 80074DB0 03E00008 */  jr         $ra
/* 759B4 80074DB4 27BD0068 */   addiu     $sp, $sp, 0x68

glabel build_dailougentitydb
/* 759B8 80074DB8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 759BC 80074DBC AFB20020 */  sw         $s2, 0x20($sp)
/* 759C0 80074DC0 00809021 */  addu       $s2, $a0, $zero
/* 759C4 80074DC4 3C04B1FE */  lui        $a0, %hi(dialouge_entity)
/* 759C8 80074DC8 24843CE0 */  addiu      $a0, $a0, %lo(dialouge_entity)
/* 759CC 80074DCC 02402821 */  addu       $a1, $s2, $zero
/* 759D0 80074DD0 AFB00018 */  sw         $s0, 0x18($sp)
/* 759D4 80074DD4 27B00010 */  addiu      $s0, $sp, 0x10
/* 759D8 80074DD8 02003021 */  addu       $a2, $s0, $zero
/* 759DC 80074DDC AFBF0024 */  sw         $ra, 0x24($sp)
/* 759E0 80074DE0 AFB1001C */  sw         $s1, 0x1c($sp)
/* 759E4 80074DE4 0C01D30C */  jal        load_db_array_size
/* 759E8 80074DE8 AFA00010 */   sw        $zero, 0x10($sp)
/* 759EC 80074DEC 3C05800E */  lui        $a1, %hi(D_800DFE30)
/* 759F0 80074DF0 24A5FE30 */  addiu      $a1, $a1, %lo(D_800DFE30)
/* 759F4 80074DF4 92420000 */  lbu        $v0, ($s2)
/* 759F8 80074DF8 2406008F */  addiu      $a2, $zero, 0x8f
/* 759FC 80074DFC 00022040 */  sll        $a0, $v0, 1
/* 75A00 80074E00 00822021 */  addu       $a0, $a0, $v0
/* 75A04 80074E04 00042080 */  sll        $a0, $a0, 2
/* 75A08 80074E08 00822021 */  addu       $a0, $a0, $v0
/* 75A0C 80074E0C 0C025F9C */  jal        Malloc
/* 75A10 80074E10 00042040 */   sll       $a0, $a0, 1
/* 75A14 80074E14 AE420004 */  sw         $v0, 4($s2)
/* 75A18 80074E18 92420000 */  lbu        $v0, ($s2)
/* 75A1C 80074E1C 1040000B */  beqz       $v0, .L80074E4C
/* 75A20 80074E20 00008821 */   addu      $s1, $zero, $zero
/* 75A24 80074E24 02402021 */  addu       $a0, $s2, $zero
.L80074E28:
/* 75A28 80074E28 02202821 */  addu       $a1, $s1, $zero
/* 75A2C 80074E2C 0C01D341 */  jal        load_dialougEnt
/* 75A30 80074E30 02003021 */   addu      $a2, $s0, $zero
/* 75A34 80074E34 26230001 */  addiu      $v1, $s1, 1
/* 75A38 80074E38 92420000 */  lbu        $v0, ($s2)
/* 75A3C 80074E3C 307100FF */  andi       $s1, $v1, 0xff
/* 75A40 80074E40 0222102B */  sltu       $v0, $s1, $v0
/* 75A44 80074E44 1440FFF8 */  bnez       $v0, .L80074E28
/* 75A48 80074E48 02402021 */   addu      $a0, $s2, $zero
.L80074E4C:
/* 75A4C 80074E4C 8FBF0024 */  lw         $ra, 0x24($sp)
/* 75A50 80074E50 8FB20020 */  lw         $s2, 0x20($sp)
/* 75A54 80074E54 8FB1001C */  lw         $s1, 0x1c($sp)
/* 75A58 80074E58 8FB00018 */  lw         $s0, 0x18($sp)
/* 75A5C 80074E5C 03E00008 */  jr         $ra
/* 75A60 80074E60 27BD0028 */   addiu     $sp, $sp, 0x28

glabel dialougEnt_free
/* 75A64 80074E64 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 75A68 80074E68 3C05800E */  lui        $a1, %hi(D_800DFE30)
/* 75A6C 80074E6C 24A5FE30 */  addiu      $a1, $a1, %lo(D_800DFE30)
/* 75A70 80074E70 AFBF0010 */  sw         $ra, 0x10($sp)
/* 75A74 80074E74 8C840004 */  lw         $a0, 4($a0)
/* 75A78 80074E78 0C02600C */  jal        Free
/* 75A7C 80074E7C 2406009F */   addiu     $a2, $zero, 0x9f
/* 75A80 80074E80 8FBF0010 */  lw         $ra, 0x10($sp)
/* 75A84 80074E84 03E00008 */  jr         $ra
/* 75A88 80074E88 27BD0018 */   addiu     $sp, $sp, 0x18
/* 75A8C 80074E8C 00000000 */  nop
