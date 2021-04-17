.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_80076E40
/* 77A40 80076E40 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 77A44 80076E44 AFB30024 */  sw         $s3, 0x24($sp)
/* 77A48 80076E48 00809821 */  addu       $s3, $a0, $zero
/* 77A4C 80076E4C AFB1001C */  sw         $s1, 0x1c($sp)
/* 77A50 80076E50 3C11B1FE */  lui        $s1, %hi(weapondb)
/* 77A54 80076E54 26248CC0 */  addiu      $a0, $s1, %lo(weapondb)
/* 77A58 80076E58 02602821 */  addu       $a1, $s3, $zero
/* 77A5C 80076E5C AFB00018 */  sw         $s0, 0x18($sp)
/* 77A60 80076E60 27B00010 */  addiu      $s0, $sp, 0x10
/* 77A64 80076E64 02003021 */  addu       $a2, $s0, $zero
/* 77A68 80076E68 AFBF0038 */  sw         $ra, 0x38($sp)
/* 77A6C 80076E6C AFB70034 */  sw         $s7, 0x34($sp)
/* 77A70 80076E70 AFB60030 */  sw         $s6, 0x30($sp)
/* 77A74 80076E74 AFB5002C */  sw         $s5, 0x2c($sp)
/* 77A78 80076E78 AFB40028 */  sw         $s4, 0x28($sp)
/* 77A7C 80076E7C AFB20020 */  sw         $s2, 0x20($sp)
/* 77A80 80076E80 0C01D30C */  jal        load_db_array_size
/* 77A84 80076E84 AFA00010 */   sw        $zero, 0x10($sp)
/* 77A88 80076E88 3C05800E */  lui        $a1, %hi(D_800E02D0)
/* 77A8C 80076E8C 24A502D0 */  addiu      $a1, $a1, %lo(D_800E02D0)
/* 77A90 80076E90 24060034 */  addiu      $a2, $zero, 0x34
/* 77A94 80076E94 0000A021 */  addu       $s4, $zero, $zero
/* 77A98 80076E98 00009021 */  addu       $s2, $zero, $zero
/* 77A9C 80076E9C 0220B821 */  addu       $s7, $s1, $zero
/* 77AA0 80076EA0 92620000 */  lbu        $v0, ($s3)
/* 77AA4 80076EA4 0200B021 */  addu       $s6, $s0, $zero
/* 77AA8 80076EA8 00022040 */  sll        $a0, $v0, 1
/* 77AAC 80076EAC 00822021 */  addu       $a0, $a0, $v0
/* 77AB0 80076EB0 00042080 */  sll        $a0, $a0, 2
/* 77AB4 80076EB4 00822021 */  addu       $a0, $a0, $v0
/* 77AB8 80076EB8 0C025F9C */  jal        Malloc
/* 77ABC 80076EBC 00042080 */   sll       $a0, $a0, 2
/* 77AC0 80076EC0 2675000C */  addiu      $s5, $s3, 0xc
/* 77AC4 80076EC4 26710001 */  addiu      $s1, $s3, 1
/* 77AC8 80076EC8 AE620018 */  sw         $v0, 0x18($s3)
.L80076ECC:
/* 77ACC 80076ECC 26E48CC0 */  addiu      $a0, $s7, -0x7340
/* 77AD0 80076ED0 26500001 */  addiu      $s0, $s2, 1
/* 77AD4 80076ED4 02702821 */  addu       $a1, $s3, $s0
/* 77AD8 80076ED8 0C01D30C */  jal        load_db_array_size
/* 77ADC 80076EDC 02C03021 */   addu      $a2, $s6, $zero
/* 77AE0 80076EE0 02B21021 */  addu       $v0, $s5, $s2
/* 77AE4 80076EE4 02322821 */  addu       $a1, $s1, $s2
/* 77AE8 80076EE8 321200FF */  andi       $s2, $s0, 0xff
/* 77AEC 80076EEC A0540000 */  sb         $s4, ($v0)
/* 77AF0 80076EF0 90A30000 */  lbu        $v1, ($a1)
/* 77AF4 80076EF4 90A40000 */  lbu        $a0, ($a1)
/* 77AF8 80076EF8 02831821 */  addu       $v1, $s4, $v1
/* 77AFC 80076EFC 307400FF */  andi       $s4, $v1, 0xff
/* 77B00 80076F00 00041040 */  sll        $v0, $a0, 1
/* 77B04 80076F04 00441021 */  addu       $v0, $v0, $a0
/* 77B08 80076F08 8FA30010 */  lw         $v1, 0x10($sp)
/* 77B0C 80076F0C 00021100 */  sll        $v0, $v0, 4
/* 77B10 80076F10 00621821 */  addu       $v1, $v1, $v0
/* 77B14 80076F14 2E42000B */  sltiu      $v0, $s2, 0xb
/* 77B18 80076F18 1440FFEC */  bnez       $v0, .L80076ECC
/* 77B1C 80076F1C AFA30010 */   sw        $v1, 0x10($sp)
/* 77B20 80076F20 8FBF0038 */  lw         $ra, 0x38($sp)
/* 77B24 80076F24 8FB70034 */  lw         $s7, 0x34($sp)
/* 77B28 80076F28 8FB60030 */  lw         $s6, 0x30($sp)
/* 77B2C 80076F2C 8FB5002C */  lw         $s5, 0x2c($sp)
/* 77B30 80076F30 8FB40028 */  lw         $s4, 0x28($sp)
/* 77B34 80076F34 8FB30024 */  lw         $s3, 0x24($sp)
/* 77B38 80076F38 8FB20020 */  lw         $s2, 0x20($sp)
/* 77B3C 80076F3C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 77B40 80076F40 8FB00018 */  lw         $s0, 0x18($sp)
/* 77B44 80076F44 03E00008 */  jr         $ra
/* 77B48 80076F48 27BD0040 */   addiu     $sp, $sp, 0x40

glabel load_weaponDB
/* 77B4C 80076F4C 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 77B50 80076F50 AFBF0064 */  sw         $ra, 0x64($sp)
/* 77B54 80076F54 AFB20060 */  sw         $s2, 0x60($sp)
/* 77B58 80076F58 AFB1005C */  sw         $s1, 0x5c($sp)
/* 77B5C 80076F5C AFB00058 */  sw         $s0, 0x58($sp)
/* 77B60 80076F60 8C880018 */  lw         $t0, 0x18($a0)
/* 77B64 80076F64 27A40018 */  addiu      $a0, $sp, 0x18
/* 77B68 80076F68 00C09021 */  addu       $s2, $a2, $zero
/* 77B6C 80076F6C 24060030 */  addiu      $a2, $zero, 0x30
/* 77B70 80076F70 3C02800E */  lui        $v0, %hi(D_800E02D0)
/* 77B74 80076F74 244202D0 */  addiu      $v0, $v0, %lo(D_800E02D0)
/* 77B78 80076F78 2403004E */  addiu      $v1, $zero, 0x4e
/* 77B7C 80076F7C 30A700FF */  andi       $a3, $a1, 0xff
/* 77B80 80076F80 3C05B1FE */  lui        $a1, %hi(weapondb)
/* 77B84 80076F84 24A58CC0 */  addiu      $a1, $a1, %lo(weapondb)
/* 77B88 80076F88 AFA20010 */  sw         $v0, 0x10($sp)
/* 77B8C 80076F8C 00071040 */  sll        $v0, $a3, 1
/* 77B90 80076F90 00471021 */  addu       $v0, $v0, $a3
/* 77B94 80076F94 00021080 */  sll        $v0, $v0, 2
/* 77B98 80076F98 00471021 */  addu       $v0, $v0, $a3
/* 77B9C 80076F9C 00021080 */  sll        $v0, $v0, 2
/* 77BA0 80076FA0 AFA30014 */  sw         $v1, 0x14($sp)
/* 77BA4 80076FA4 8E510000 */  lw         $s1, ($s2)
/* 77BA8 80076FA8 24070001 */  addiu      $a3, $zero, 1
/* 77BAC 80076FAC 02252821 */  addu       $a1, $s1, $a1
/* 77BB0 80076FB0 0C027269 */  jal        RomCopy
/* 77BB4 80076FB4 01028021 */   addu      $s0, $t0, $v0
/* 77BB8 80076FB8 26040002 */  addiu      $a0, $s0, 2
/* 77BBC 80076FBC 27A50018 */  addiu      $a1, $sp, 0x18
/* 77BC0 80076FC0 0C033547 */  jal        memcpy
/* 77BC4 80076FC4 24060015 */   addiu     $a2, $zero, 0x15
/* 77BC8 80076FC8 A2000017 */  sb         $zero, 0x17($s0)
/* 77BCC 80076FCC 93A2002E */  lbu        $v0, 0x2e($sp)
/* 77BD0 80076FD0 93A3002D */  lbu        $v1, 0x2d($sp)
/* 77BD4 80076FD4 00021200 */  sll        $v0, $v0, 8
/* 77BD8 80076FD8 00621821 */  addu       $v1, $v1, $v0
/* 77BDC 80076FDC A6030000 */  sh         $v1, ($s0)
/* 77BE0 80076FE0 93A2002F */  lbu        $v0, 0x2f($sp)
/* 77BE4 80076FE4 A2020018 */  sb         $v0, 0x18($s0)
/* 77BE8 80076FE8 93A30030 */  lbu        $v1, 0x30($sp)
/* 77BEC 80076FEC A2030019 */  sb         $v1, 0x19($s0)
/* 77BF0 80076FF0 93A20031 */  lbu        $v0, 0x31($sp)
/* 77BF4 80076FF4 A202001A */  sb         $v0, 0x1a($s0)
/* 77BF8 80076FF8 93A30032 */  lbu        $v1, 0x32($sp)
/* 77BFC 80076FFC A203001B */  sb         $v1, 0x1b($s0)
/* 77C00 80077000 93A20034 */  lbu        $v0, 0x34($sp)
/* 77C04 80077004 93A30033 */  lbu        $v1, 0x33($sp)
/* 77C08 80077008 00021200 */  sll        $v0, $v0, 8
/* 77C0C 8007700C 00621821 */  addu       $v1, $v1, $v0
/* 77C10 80077010 A603001C */  sh         $v1, 0x1c($s0)
/* 77C14 80077014 93A20035 */  lbu        $v0, 0x35($sp)
/* 77C18 80077018 3C045555 */  lui        $a0, 0x5555
/* 77C1C 8007701C A202001E */  sb         $v0, 0x1e($s0)
/* 77C20 80077020 93A30036 */  lbu        $v1, 0x36($sp)
/* 77C24 80077024 34845556 */  ori        $a0, $a0, 0x5556
/* 77C28 80077028 A203001F */  sb         $v1, 0x1f($s0)
/* 77C2C 8007702C 306500FF */  andi       $a1, $v1, 0xff
/* 77C30 80077030 00051080 */  sll        $v0, $a1, 2
/* 77C34 80077034 00451021 */  addu       $v0, $v0, $a1
/* 77C38 80077038 00440018 */  mult       $v0, $a0
/* 77C3C 8007703C 000217C3 */  sra        $v0, $v0, 0x1f
/* 77C40 80077040 00002010 */  mfhi       $a0
/* 77C44 80077044 00822023 */  subu       $a0, $a0, $v0
/* 77C48 80077048 28830100 */  slti       $v1, $a0, 0x100
/* 77C4C 8007704C 50600001 */  beql       $v1, $zero, .L80077054
/* 77C50 80077050 240400FF */   addiu     $a0, $zero, 0xff
.L80077054:
/* 77C54 80077054 A204001F */  sb         $a0, 0x1f($s0)
/* 77C58 80077058 93A20037 */  lbu        $v0, 0x37($sp)
/* 77C5C 8007705C A2020020 */  sb         $v0, 0x20($s0)
/* 77C60 80077060 93A30038 */  lbu        $v1, 0x38($sp)
/* 77C64 80077064 A2030021 */  sb         $v1, 0x21($s0)
/* 77C68 80077068 93A20039 */  lbu        $v0, 0x39($sp)
/* 77C6C 8007706C A2020022 */  sb         $v0, 0x22($s0)
/* 77C70 80077070 93A3003A */  lbu        $v1, 0x3a($sp)
/* 77C74 80077074 A2030023 */  sb         $v1, 0x23($s0)
/* 77C78 80077078 93A2003B */  lbu        $v0, 0x3b($sp)
/* 77C7C 8007707C A2020024 */  sb         $v0, 0x24($s0)
/* 77C80 80077080 93A3003C */  lbu        $v1, 0x3c($sp)
/* 77C84 80077084 A2030025 */  sb         $v1, 0x25($s0)
/* 77C88 80077088 93A2003D */  lbu        $v0, 0x3d($sp)
/* 77C8C 8007708C A2020026 */  sb         $v0, 0x26($s0)
/* 77C90 80077090 93A3003E */  lbu        $v1, 0x3e($sp)
/* 77C94 80077094 A2030027 */  sb         $v1, 0x27($s0)
/* 77C98 80077098 93A40040 */  lbu        $a0, 0x40($sp)
/* 77C9C 8007709C 93A2003F */  lbu        $v0, 0x3f($sp)
/* 77CA0 800770A0 00042200 */  sll        $a0, $a0, 8
/* 77CA4 800770A4 0C01D072 */  jal        get_equpiment_spell
/* 77CA8 800770A8 00442025 */   or        $a0, $v0, $a0
/* 77CAC 800770AC A2020028 */  sb         $v0, 0x28($s0)
/* 77CB0 800770B0 93A20041 */  lbu        $v0, 0x41($sp)
/* 77CB4 800770B4 A2020029 */  sb         $v0, 0x29($s0)
/* 77CB8 800770B8 93A30042 */  lbu        $v1, 0x42($sp)
/* 77CBC 800770BC A203002A */  sb         $v1, 0x2a($s0)
/* 77CC0 800770C0 93A40044 */  lbu        $a0, 0x44($sp)
/* 77CC4 800770C4 93A20043 */  lbu        $v0, 0x43($sp)
/* 77CC8 800770C8 00042200 */  sll        $a0, $a0, 8
/* 77CCC 800770CC 0C01D072 */  jal        get_equpiment_spell
/* 77CD0 800770D0 00442025 */   or        $a0, $v0, $a0
/* 77CD4 800770D4 A202002B */  sb         $v0, 0x2b($s0)
/* 77CD8 800770D8 93A20045 */  lbu        $v0, 0x45($sp)
/* 77CDC 800770DC 3C01800E */  lui        $at, %hi(D_800E02E8)
/* 77CE0 800770E0 C42202E8 */  lwc1       $f2, %lo(D_800E02E8)($at)
/* 77CE4 800770E4 A202002C */  sb         $v0, 0x2c($s0)
/* 77CE8 800770E8 93A30046 */  lbu        $v1, 0x46($sp)
/* 77CEC 800770EC A203002D */  sb         $v1, 0x2d($s0)
/* 77CF0 800770F0 93A20047 */  lbu        $v0, 0x47($sp)
/* 77CF4 800770F4 8FBF0064 */  lw         $ra, 0x64($sp)
/* 77CF8 800770F8 44820000 */  mtc1       $v0, $f0
/* 77CFC 800770FC 46800020 */  cvt.s.w    $f0, $f0
/* 77D00 80077100 26220030 */  addiu      $v0, $s1, 0x30
/* 77D04 80077104 46020002 */  mul.s      $f0, $f0, $f2
/* 77D08 80077108 AE420000 */  sw         $v0, ($s2)
/* 77D0C 8007710C 8FB20060 */  lw         $s2, 0x60($sp)
/* 77D10 80077110 8FB1005C */  lw         $s1, 0x5c($sp)
/* 77D14 80077114 E6000030 */  swc1       $f0, 0x30($s0)
/* 77D18 80077118 8FB00058 */  lw         $s0, 0x58($sp)
/* 77D1C 8007711C 03E00008 */  jr         $ra
/* 77D20 80077120 27BD0068 */   addiu     $sp, $sp, 0x68

glabel build_weapondb
/* 77D24 80077124 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 77D28 80077128 AFB40028 */  sw         $s4, 0x28($sp)
/* 77D2C 8007712C 0080A021 */  addu       $s4, $a0, $zero
/* 77D30 80077130 AFB1001C */  sw         $s1, 0x1c($sp)
/* 77D34 80077134 3C11B1FE */  lui        $s1, %hi(weapondb)
/* 77D38 80077138 26248CC0 */  addiu      $a0, $s1, %lo(weapondb)
/* 77D3C 8007713C 02802821 */  addu       $a1, $s4, $zero
/* 77D40 80077140 AFB00018 */  sw         $s0, 0x18($sp)
/* 77D44 80077144 27B00010 */  addiu      $s0, $sp, 0x10
/* 77D48 80077148 02003021 */  addu       $a2, $s0, $zero
/* 77D4C 8007714C AFBF003C */  sw         $ra, 0x3c($sp)
/* 77D50 80077150 AFBE0038 */  sw         $fp, 0x38($sp)
/* 77D54 80077154 AFB70034 */  sw         $s7, 0x34($sp)
/* 77D58 80077158 AFB60030 */  sw         $s6, 0x30($sp)
/* 77D5C 8007715C AFB5002C */  sw         $s5, 0x2c($sp)
/* 77D60 80077160 AFB30024 */  sw         $s3, 0x24($sp)
/* 77D64 80077164 AFB20020 */  sw         $s2, 0x20($sp)
/* 77D68 80077168 0C01D30C */  jal        load_db_array_size
/* 77D6C 8007716C AFA00010 */   sw        $zero, 0x10($sp)
/* 77D70 80077170 3C05800E */  lui        $a1, %hi(D_800E02D0)
/* 77D74 80077174 24A502D0 */  addiu      $a1, $a1, %lo(D_800E02D0)
/* 77D78 80077178 2406017A */  addiu      $a2, $zero, 0x17a
/* 77D7C 8007717C 00009821 */  addu       $s3, $zero, $zero
/* 77D80 80077180 00009021 */  addu       $s2, $zero, $zero
/* 77D84 80077184 0220F021 */  addu       $fp, $s1, $zero
/* 77D88 80077188 92820000 */  lbu        $v0, ($s4)
/* 77D8C 8007718C 0200A821 */  addu       $s5, $s0, $zero
/* 77D90 80077190 00022040 */  sll        $a0, $v0, 1
/* 77D94 80077194 00822021 */  addu       $a0, $a0, $v0
/* 77D98 80077198 00042080 */  sll        $a0, $a0, 2
/* 77D9C 8007719C 00822021 */  addu       $a0, $a0, $v0
/* 77DA0 800771A0 0C025F9C */  jal        Malloc
/* 77DA4 800771A4 00042080 */   sll       $a0, $a0, 2
/* 77DA8 800771A8 2697000C */  addiu      $s7, $s4, 0xc
/* 77DAC 800771AC 26960001 */  addiu      $s6, $s4, 1
/* 77DB0 800771B0 AE820018 */  sw         $v0, 0x18($s4)
/* 77DB4 800771B4 27C48CC0 */  addiu      $a0, $fp, -0x7340
.L800771B8:
/* 77DB8 800771B8 26500001 */  addiu      $s0, $s2, 1
/* 77DBC 800771BC 02902821 */  addu       $a1, $s4, $s0
/* 77DC0 800771C0 0C01D30C */  jal        load_db_array_size
/* 77DC4 800771C4 02A03021 */   addu      $a2, $s5, $zero
/* 77DC8 800771C8 00008821 */  addu       $s1, $zero, $zero
/* 77DCC 800771CC 02F21021 */  addu       $v0, $s7, $s2
/* 77DD0 800771D0 02D21821 */  addu       $v1, $s6, $s2
/* 77DD4 800771D4 A0530000 */  sb         $s3, ($v0)
/* 77DD8 800771D8 90620000 */  lbu        $v0, ($v1)
/* 77DDC 800771DC 1040000D */  beqz       $v0, .L80077214
/* 77DE0 800771E0 02009021 */   addu      $s2, $s0, $zero
/* 77DE4 800771E4 00608021 */  addu       $s0, $v1, $zero
.L800771E8:
/* 77DE8 800771E8 02802021 */  addu       $a0, $s4, $zero
/* 77DEC 800771EC 02602821 */  addu       $a1, $s3, $zero
/* 77DF0 800771F0 0C01DBD3 */  jal        load_weaponDB
/* 77DF4 800771F4 02A03021 */   addu      $a2, $s5, $zero
/* 77DF8 800771F8 26220001 */  addiu      $v0, $s1, 1
/* 77DFC 800771FC 305100FF */  andi       $s1, $v0, 0xff
/* 77E00 80077200 26630001 */  addiu      $v1, $s3, 1
/* 77E04 80077204 92020000 */  lbu        $v0, ($s0)
/* 77E08 80077208 0222102B */  sltu       $v0, $s1, $v0
/* 77E0C 8007720C 1440FFF6 */  bnez       $v0, .L800771E8
/* 77E10 80077210 307300FF */   andi      $s3, $v1, 0xff
.L80077214:
/* 77E14 80077214 325200FF */  andi       $s2, $s2, 0xff
/* 77E18 80077218 2E42000B */  sltiu      $v0, $s2, 0xb
/* 77E1C 8007721C 1440FFE6 */  bnez       $v0, .L800771B8
/* 77E20 80077220 27C48CC0 */   addiu     $a0, $fp, -0x7340
/* 77E24 80077224 8FBF003C */  lw         $ra, 0x3c($sp)
/* 77E28 80077228 8FBE0038 */  lw         $fp, 0x38($sp)
/* 77E2C 8007722C 8FB70034 */  lw         $s7, 0x34($sp)
/* 77E30 80077230 8FB60030 */  lw         $s6, 0x30($sp)
/* 77E34 80077234 8FB5002C */  lw         $s5, 0x2c($sp)
/* 77E38 80077238 8FB40028 */  lw         $s4, 0x28($sp)
/* 77E3C 8007723C 8FB30024 */  lw         $s3, 0x24($sp)
/* 77E40 80077240 8FB20020 */  lw         $s2, 0x20($sp)
/* 77E44 80077244 8FB1001C */  lw         $s1, 0x1c($sp)
/* 77E48 80077248 8FB00018 */  lw         $s0, 0x18($sp)
/* 77E4C 8007724C 03E00008 */  jr         $ra
/* 77E50 80077250 27BD0040 */   addiu     $sp, $sp, 0x40

glabel weaponDB_clear
/* 77E54 80077254 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 77E58 80077258 3C05800E */  lui        $a1, %hi(D_800E02D0)
/* 77E5C 8007725C 24A502D0 */  addiu      $a1, $a1, %lo(D_800E02D0)
/* 77E60 80077260 AFBF0010 */  sw         $ra, 0x10($sp)
/* 77E64 80077264 8C840018 */  lw         $a0, 0x18($a0)
/* 77E68 80077268 0C02600C */  jal        Free
/* 77E6C 8007726C 24060193 */   addiu     $a2, $zero, 0x193
/* 77E70 80077270 8FBF0010 */  lw         $ra, 0x10($sp)
/* 77E74 80077274 03E00008 */  jr         $ra
/* 77E78 80077278 27BD0018 */   addiu     $sp, $sp, 0x18
/* 77E7C 8007727C 00000000 */  nop
