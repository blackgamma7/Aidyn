.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel initGameTrek
/* 26A30 80025E30 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 26A34 80025E34 3C04800F */  lui        $a0, %hi(D_800E9AC0)
/* 26A38 80025E38 24020001 */  addiu      $v0, $zero, 1
/* 26A3C 80025E3C 3C03800E */  lui        $v1, %hi(PlayerCharStruct)
/* 26A40 80025E40 AFB1001C */  sw         $s1, 0x1c($sp)
/* 26A44 80025E44 24716950 */  addiu      $s1, $v1, %lo(PlayerCharStruct)
/* 26A48 80025E48 AC829AC0 */  sw         $v0, %lo(D_800E9AC0)($a0)
/* 26A4C 80025E4C 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 26A50 80025E50 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 26A54 80025E54 AFB20020 */  sw         $s2, 0x20($sp)
/* 26A58 80025E58 26320038 */  addiu      $s2, $s1, 0x38
/* 26A5C 80025E5C AFBF002C */  sw         $ra, 0x2c($sp)
/* 26A60 80025E60 AFB40028 */  sw         $s4, 0x28($sp)
/* 26A64 80025E64 AFB30024 */  sw         $s3, 0x24($sp)
/* 26A68 80025E68 10600005 */  beqz       $v1, .L80025E80
/* 26A6C 80025E6C AFB00018 */   sw        $s0, 0x18($sp)
/* 26A70 80025E70 0C0290A9 */  jal        set_AnimCache
/* 26A74 80025E74 24040003 */   addiu     $a0, $zero, 3
/* 26A78 80025E78 080097A3 */  j          .L80025E8C
/* 26A7C 80025E7C 3C02800E */   lui       $v0, 0x800e
.L80025E80:
/* 26A80 80025E80 0C0290A9 */  jal        set_AnimCache
/* 26A84 80025E84 24040001 */   addiu     $a0, $zero, 1
/* 26A88 80025E88 3C02800E */  lui        $v0, %hi(MinimapStruct)
.L80025E8C:
/* 26A8C 80025E8C 24537DB4 */  addiu      $s3, $v0, %lo(MinimapStruct)
/* 26A90 80025E90 02602021 */  addu       $a0, $s3, $zero
/* 26A94 80025E94 24050001 */  addiu      $a1, $zero, 1
/* 26A98 80025E98 24140001 */  addiu      $s4, $zero, 1
/* 26A9C 80025E9C 0C014C50 */  jal        toggle_show_minimap
/* 26AA0 80025EA0 A634000C */   sh        $s4, 0xc($s1)
/* 26AA4 80025EA4 0C00AA00 */  jal        make_compass
/* 26AA8 80025EA8 00000000 */   nop
/* 26AAC 80025EAC 0C00ABE4 */  jal        sundail_init
/* 26AB0 80025EB0 00000000 */   nop
/* 26AB4 80025EB4 0C00AF84 */  jal        init_portait_highlighter
/* 26AB8 80025EB8 00000000 */   nop
/* 26ABC 80025EBC 26640B6C */  addiu      $a0, $s3, 0xb6c
/* 26AC0 80025EC0 3C05800E */  lui        $a1, %hi(D_800D9FF0)
/* 26AC4 80025EC4 0C0333AC */  jal        sprintf
/* 26AC8 80025EC8 24A59FF0 */   addiu     $a1, $a1, %lo(D_800D9FF0)
/* 26ACC 80025ECC 2664EB44 */  addiu      $a0, $s3, -0x14bc
/* 26AD0 80025ED0 0C004947 */  jal        WanderHead
/* 26AD4 80025ED4 24050027 */   addiu     $a1, $zero, 0x27
/* 26AD8 80025ED8 8625000E */  lh         $a1, 0xe($s1)
/* 26ADC 80025EDC 0C0044AF */  jal        InitZoneEngine
/* 26AE0 80025EE0 00002021 */   addu      $a0, $zero, $zero
/* 26AE4 80025EE4 3C04800F */  lui        $a0, %hi(D_800EE978)
/* 26AE8 80025EE8 8C83E978 */  lw         $v1, %lo(D_800EE978)($a0)
/* 26AEC 80025EEC 24020003 */  addiu      $v0, $zero, 3
/* 26AF0 80025EF0 10600004 */  beqz       $v1, .L80025F04
/* 26AF4 80025EF4 A2220034 */   sb        $v0, 0x34($s1)
/* 26AF8 80025EF8 24020007 */  addiu      $v0, $zero, 7
/* 26AFC 80025EFC A2220034 */  sb         $v0, 0x34($s1)
/* 26B00 80025F00 AC80E978 */  sw         $zero, -0x1688($a0)
.L80025F04:
/* 26B04 80025F04 8E220004 */  lw         $v0, 4($s1)
/* 26B08 80025F08 3C064120 */  lui        $a2, 0x4120
/* 26B0C 80025F0C 8E4702A8 */  lw         $a3, 0x2a8($s2)
/* 26B10 80025F10 C62C0008 */  lwc1       $f12, 8($s1)
/* 26B14 80025F14 C64E02A4 */  lwc1       $f14, 0x2a4($s2)
/* 26B18 80025F18 0C00609A */  jal        AllocPlayer
/* 26B1C 80025F1C AFA20010 */   sw        $v0, 0x10($sp)
/* 26B20 80025F20 AE220000 */  sw         $v0, ($s1)
/* 26B24 80025F24 A054070A */  sb         $s4, 0x70a($v0)
/* 26B28 80025F28 8622000E */  lh         $v0, 0xe($s1)
/* 26B2C 80025F2C 1040001B */  beqz       $v0, .L80025F9C
/* 26B30 80025F30 2670ED08 */   addiu     $s0, $s3, -0x12f8
/* 26B34 80025F34 8E240000 */  lw         $a0, ($s1)
/* 26B38 80025F38 8E420F10 */  lw         $v0, 0xf10($s2)
/* 26B3C 80025F3C AC820020 */  sw         $v0, 0x20($a0)
/* 26B40 80025F40 8E430F14 */  lw         $v1, 0xf14($s2)
/* 26B44 80025F44 AC830024 */  sw         $v1, 0x24($a0)
/* 26B48 80025F48 8E250000 */  lw         $a1, ($s1)
/* 26B4C 80025F4C 8E420F10 */  lw         $v0, 0xf10($s2)
/* 26B50 80025F50 ACA20028 */  sw         $v0, 0x28($a1)
/* 26B54 80025F54 8E430F14 */  lw         $v1, 0xf14($s2)
/* 26B58 80025F58 ACA3002C */  sw         $v1, 0x2c($a1)
/* 26B5C 80025F5C 8E260000 */  lw         $a2, ($s1)
/* 26B60 80025F60 8E420F04 */  lw         $v0, 0xf04($s2)
/* 26B64 80025F64 ACC20068 */  sw         $v0, 0x68($a2)
/* 26B68 80025F68 8E420F08 */  lw         $v0, 0xf08($s2)
/* 26B6C 80025F6C 02002021 */  addu       $a0, $s0, $zero
/* 26B70 80025F70 ACC2006C */  sw         $v0, 0x6c($a2)
/* 26B74 80025F74 8E430F0C */  lw         $v1, 0xf0c($s2)
/* 26B78 80025F78 26450F18 */  addiu      $a1, $s2, 0xf18
/* 26B7C 80025F7C 0C02C058 */  jal        camera_set_position
/* 26B80 80025F80 ACC30070 */   sw        $v1, 0x70($a2)
/* 26B84 80025F84 8E250000 */  lw         $a1, ($s1)
/* 26B88 80025F88 02002021 */  addu       $a0, $s0, $zero
/* 26B8C 80025F8C 0C02C069 */  jal        camera_set_aim
/* 26B90 80025F90 24A50068 */   addiu     $a1, $a1, 0x68
/* 26B94 80025F94 080097FA */  j          .L80025FE8
/* 26B98 80025F98 00000000 */   nop
.L80025F9C:
/* 26B9C 80025F9C 2670EAF4 */  addiu      $s0, $s3, -0x150c
/* 26BA0 80025FA0 8E0500A8 */  lw         $a1, 0xa8($s0)
/* 26BA4 80025FA4 8E0403BC */  lw         $a0, 0x3bc($s0)
/* 26BA8 80025FA8 0C02C058 */  jal        camera_set_position
/* 26BAC 80025FAC 24A50068 */   addiu     $a1, $a1, 0x68
/* 26BB0 80025FB0 00002821 */  addu       $a1, $zero, $zero
/* 26BB4 80025FB4 00003021 */  addu       $a2, $zero, $zero
/* 26BB8 80025FB8 8E240000 */  lw         $a0, ($s1)
/* 26BBC 80025FBC 0C005539 */  jal        func_800154E4
/* 26BC0 80025FC0 00003821 */   addu      $a3, $zero, $zero
/* 26BC4 80025FC4 8E0400A8 */  lw         $a0, 0xa8($s0)
/* 26BC8 80025FC8 2665ED2C */  addiu      $a1, $s3, -0x12d4
/* 26BCC 80025FCC 0C02AD17 */  jal        copyVec3
/* 26BD0 80025FD0 24840068 */   addiu     $a0, $a0, 0x68
/* 26BD4 80025FD4 8E0400A8 */  lw         $a0, 0xa8($s0)
/* 26BD8 80025FD8 2665ED14 */  addiu      $a1, $s3, -0x12ec
/* 26BDC 80025FDC 0C02AD17 */  jal        copyVec3
/* 26BE0 80025FE0 24840068 */   addiu     $a0, $a0, 0x68
/* 26BE4 80025FE4 A6140294 */  sh         $s4, 0x294($s0)
.L80025FE8:
/* 26BE8 80025FE8 0C006744 */  jal        GiveCameraToPlayer
/* 26BEC 80025FEC 8E240000 */   lw        $a0, ($s1)
/* 26BF0 80025FF0 26500F04 */  addiu      $s0, $s2, 0xf04
/* 26BF4 80025FF4 02002821 */  addu       $a1, $s0, $zero
/* 26BF8 80025FF8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 26BFC 80025FFC 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 26C00 80026000 8E240000 */  lw         $a0, ($s1)
/* 26C04 80026004 24130001 */  addiu      $s3, $zero, 1
/* 26C08 80026008 0C0045C9 */  jal        SaveEngineZone
/* 26C0C 8002600C A6530294 */   sh        $s3, 0x294($s2)
/* 26C10 80026010 0C00448E */  jal        mapFloatDat_copy
/* 26C14 80026014 02002021 */   addu      $a0, $s0, $zero
/* 26C18 80026018 3C03800F */  lui        $v1, %hi(gametrek_flag)
/* 26C1C 8002601C 8C629AC4 */  lw         $v0, %lo(gametrek_flag)($v1)
/* 26C20 80026020 AE20002C */  sw         $zero, 0x2c($s1)
/* 26C24 80026024 AE200018 */  sw         $zero, 0x18($s1)
/* 26C28 80026028 AE20001C */  sw         $zero, 0x1c($s1)
/* 26C2C 8002602C AE200020 */  sw         $zero, 0x20($s1)
/* 26C30 80026030 AE200024 */  sw         $zero, 0x24($s1)
/* 26C34 80026034 10400003 */  beqz       $v0, .L80026044
/* 26C38 80026038 AE200028 */   sw        $zero, 0x28($s1)
/* 26C3C 8002603C AE200014 */  sw         $zero, 0x14($s1)
/* 26C40 80026040 AC609AC4 */  sw         $zero, -0x653c($v1)
.L80026044:
/* 26C44 80026044 86220010 */  lh         $v0, 0x10($s1)
/* 26C48 80026048 AE200030 */  sw         $zero, 0x30($s1)
/* 26C4C 8002604C 10400002 */  beqz       $v0, .L80026058
/* 26C50 80026050 A633000E */   sh        $s3, 0xe($s1)
/* 26C54 80026054 AE40203C */  sw         $zero, 0x203c($s2)
.L80026058:
/* 26C58 80026058 3C04800E */  lui        $a0, %hi(D_800DA00C)
/* 26C5C 8002605C 2484A00C */  addiu      $a0, $a0, %lo(D_800DA00C)
/* 26C60 80026060 3C01800E */  lui        $at, %hi(D_800DA028)
/* 26C64 80026064 C420A028 */  lwc1       $f0, %lo(D_800DA028)($at)
/* 26C68 80026068 24020002 */  addiu      $v0, $zero, 2
/* 26C6C 8002606C A6330010 */  sh         $s3, 0x10($s1)
/* 26C70 80026070 A6422048 */  sh         $v0, 0x2048($s2)
/* 26C74 80026074 0C00B6B8 */  jal        debug_queue
/* 26C78 80026078 E6402044 */   swc1      $f0, 0x2044($s2)
/* 26C7C 8002607C 8FBF002C */  lw         $ra, 0x2c($sp)
/* 26C80 80026080 8FB40028 */  lw         $s4, 0x28($sp)
/* 26C84 80026084 8FB30024 */  lw         $s3, 0x24($sp)
/* 26C88 80026088 8FB20020 */  lw         $s2, 0x20($sp)
/* 26C8C 8002608C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 26C90 80026090 8FB00018 */  lw         $s0, 0x18($sp)
/* 26C94 80026094 03E00008 */  jr         $ra
/* 26C98 80026098 27BD0030 */   addiu     $sp, $sp, 0x30

glabel clear_HUD_elements
/* 26C9C 8002609C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 26CA0 800260A0 AFB00010 */  sw         $s0, 0x10($sp)
/* 26CA4 800260A4 3090FFFF */  andi       $s0, $a0, 0xffff
/* 26CA8 800260A8 3C02800F */  lui        $v0, %hi(queueStructB)
/* 26CAC 800260AC AFB10014 */  sw         $s1, 0x14($sp)
/* 26CB0 800260B0 245186D0 */  addiu      $s1, $v0, %lo(queueStructB)
/* 26CB4 800260B4 02202021 */  addu       $a0, $s1, $zero
/* 26CB8 800260B8 24050001 */  addiu      $a1, $zero, 1
/* 26CBC 800260BC AFBF001C */  sw         $ra, 0x1c($sp)
/* 26CC0 800260C0 0C0357E6 */  jal        Process_queue_B
/* 26CC4 800260C4 AFB20018 */   sw        $s2, 0x18($sp)
/* 26CC8 800260C8 8E24E280 */  lw         $a0, -0x1d80($s1)
/* 26CCC 800260CC 0C0045C9 */  jal        SaveEngineZone
/* 26CD0 800260D0 2625F1BC */   addiu     $a1, $s1, -0xe44
/* 26CD4 800260D4 0C00ABB2 */  jal        compass_free
/* 26CD8 800260D8 2632E1D8 */   addiu     $s2, $s1, -0x1e28
/* 26CDC 800260DC 0C00AF2B */  jal        sundail_free
/* 26CE0 800260E0 00000000 */   nop
/* 26CE4 800260E4 0C00B10D */  jal        portait_border_free
/* 26CE8 800260E8 00000000 */   nop
/* 26CEC 800260EC 0C0060EF */  jal        FreePlayer
/* 26CF0 800260F0 8E24E280 */   lw        $a0, -0x1d80($s1)
/* 26CF4 800260F4 924200DC */  lbu        $v0, 0xdc($s2)
/* 26CF8 800260F8 AE20E280 */  sw         $zero, -0x1d80($s1)
/* 26CFC 800260FC 3842000B */  xori       $v0, $v0, 0xb
/* 26D00 80026100 12000002 */  beqz       $s0, .L8002610C
/* 26D04 80026104 2C440001 */   sltiu     $a0, $v0, 1
/* 26D08 80026108 00002021 */  addu       $a0, $zero, $zero
.L8002610C:
/* 26D0C 8002610C 0C004687 */  jal        FreeZoneEngine
/* 26D10 80026110 2630E228 */   addiu     $s0, $s1, -0x1dd8
/* 26D14 80026114 2624F4D0 */  addiu      $a0, $s1, -0xb30
/* 26D18 80026118 0C015871 */  jal        func_800561C4
/* 26D1C 8002611C 24050001 */   addiu     $a1, $zero, 1
/* 26D20 80026120 0C004AB0 */  jal        func_80012AC0
/* 26D24 80026124 02002021 */   addu      $a0, $s0, $zero
/* 26D28 80026128 0C00497B */  jal        wander_free
/* 26D2C 8002612C 02002021 */   addu      $a0, $s0, $zero
/* 26D30 80026130 24040002 */  addiu      $a0, $zero, 2
/* 26D34 80026134 00002821 */  addu       $a1, $zero, $zero
/* 26D38 80026138 0C00897E */  jal        SetBackgroundType
/* 26D3C 8002613C 00003021 */   addu      $a2, $zero, $zero
/* 26D40 80026140 8FBF001C */  lw         $ra, 0x1c($sp)
/* 26D44 80026144 AE4000A8 */  sw         $zero, 0xa8($s2)
/* 26D48 80026148 8FB20018 */  lw         $s2, 0x18($sp)
/* 26D4C 8002614C 8FB10014 */  lw         $s1, 0x14($sp)
/* 26D50 80026150 8FB00010 */  lw         $s0, 0x10($sp)
/* 26D54 80026154 3C02800F */  lui        $v0, %hi(D_800E9AC0)
/* 26D58 80026158 AC409AC0 */  sw         $zero, %lo(D_800E9AC0)($v0)
/* 26D5C 8002615C 03E00008 */  jr         $ra
/* 26D60 80026160 27BD0020 */   addiu     $sp, $sp, 0x20
/* 26D64 80026164 00000000 */  nop
/* 26D68 80026168 00000000 */  nop
/* 26D6C 8002616C 00000000 */  nop
