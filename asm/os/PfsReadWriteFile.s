.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsReadWriteFile
/* C7CC0 800C70C0 27BDFEA0 */  addiu      $sp, $sp, -0x160
/* C7CC4 800C70C4 AFB60158 */  sw         $s6, 0x158($sp)
/* C7CC8 800C70C8 8FB60170 */  lw         $s6, 0x170($sp)
/* C7CCC 800C70CC AFB00140 */  sw         $s0, 0x140($sp)
/* C7CD0 800C70D0 00808021 */  addu       $s0, $a0, $zero
/* C7CD4 800C70D4 AFB50154 */  sw         $s5, 0x154($sp)
/* C7CD8 800C70D8 00A0A821 */  addu       $s5, $a1, $zero
/* C7CDC 800C70DC AFB10144 */  sw         $s1, 0x144($sp)
/* C7CE0 800C70E0 00E08821 */  addu       $s1, $a3, $zero
/* C7CE4 800C70E4 AFBF015C */  sw         $ra, 0x15c($sp)
/* C7CE8 800C70E8 AFB40150 */  sw         $s4, 0x150($sp)
/* C7CEC 800C70EC AFB3014C */  sw         $s3, 0x14c($sp)
/* C7CF0 800C70F0 AFB20148 */  sw         $s2, 0x148($sp)
/* C7CF4 800C70F4 8E020050 */  lw         $v0, 0x50($s0)
/* C7CF8 800C70F8 00151FC2 */  srl        $v1, $s5, 0x1f
/* C7CFC 800C70FC 02A2102A */  slt        $v0, $s5, $v0
/* C7D00 800C7100 38420001 */  xori       $v0, $v0, 1
/* C7D04 800C7104 00431025 */  or         $v0, $v0, $v1
/* C7D08 800C7108 1440003F */  bnez       $v0, .L800C7208
/* C7D0C 800C710C 00C0A021 */   addu      $s4, $a2, $zero
/* C7D10 800C7110 1AC0003D */  blez       $s6, .L800C7208
/* C7D14 800C7114 32C2001F */   andi      $v0, $s6, 0x1f
/* C7D18 800C7118 544000EF */  bnel       $v0, $zero, .L800C74D8
/* C7D1C 800C711C 24020005 */   addiu     $v0, $zero, 5
/* C7D20 800C7120 06200039 */  bltz       $s1, .L800C7208
/* C7D24 800C7124 3222001F */   andi      $v0, $s1, 0x1f
/* C7D28 800C7128 144000EB */  bnez       $v0, .L800C74D8
/* C7D2C 800C712C 24020005 */   addiu     $v0, $zero, 5
/* C7D30 800C7130 8E020000 */  lw         $v0, ($s0)
/* C7D34 800C7134 30420001 */  andi       $v0, $v0, 1
/* C7D38 800C7138 104000E7 */  beqz       $v0, .L800C74D8
/* C7D3C 800C713C 24020005 */   addiu     $v0, $zero, 5
/* C7D40 800C7140 0C031601 */  jal        __osCheckId
/* C7D44 800C7144 02002021 */   addu      $a0, $s0, $zero
/* C7D48 800C7148 24030002 */  addiu      $v1, $zero, 2
/* C7D4C 800C714C 104300E2 */  beq        $v0, $v1, .L800C74D8
/* C7D50 800C7150 24020002 */   addiu     $v0, $zero, 2
/* C7D54 800C7154 92020065 */  lbu        $v0, 0x65($s0)
/* C7D58 800C7158 10400006 */  beqz       $v0, .L800C7174
/* C7D5C 800C715C 02002021 */   addu      $a0, $s0, $zero
/* C7D60 800C7160 0C031DC8 */  jal        __osPfsSelectBank
/* C7D64 800C7164 00002821 */   addu      $a1, $zero, $zero
/* C7D68 800C7168 00401821 */  addu       $v1, $v0, $zero
/* C7D6C 800C716C 146000DA */  bnez       $v1, .L800C74D8
/* C7D70 800C7170 00000000 */   nop
.L800C7174:
/* C7D74 800C7174 8E040004 */  lw         $a0, 4($s0)
/* C7D78 800C7178 8E06005C */  lw         $a2, 0x5c($s0)
/* C7D7C 800C717C 8E050008 */  lw         $a1, 8($s0)
/* C7D80 800C7180 27A70018 */  addiu      $a3, $sp, 0x18
/* C7D84 800C7184 00D53021 */  addu       $a2, $a2, $s5
/* C7D88 800C7188 0C0309EC */  jal        __osContRamRead
/* C7D8C 800C718C 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C7D90 800C7190 00401821 */  addu       $v1, $v0, $zero
/* C7D94 800C7194 146000D0 */  bnez       $v1, .L800C74D8
/* C7D98 800C7198 00000000 */   nop
/* C7D9C 800C719C 97A2001C */  lhu        $v0, 0x1c($sp)
/* C7DA0 800C71A0 104000CD */  beqz       $v0, .L800C74D8
/* C7DA4 800C71A4 24020005 */   addiu     $v0, $zero, 5
/* C7DA8 800C71A8 8FA20018 */  lw         $v0, 0x18($sp)
/* C7DAC 800C71AC 104000CA */  beqz       $v0, .L800C74D8
/* C7DB0 800C71B0 24020005 */   addiu     $v0, $zero, 5
/* C7DB4 800C71B4 97A2001E */  lhu        $v0, 0x1e($sp)
/* C7DB8 800C71B8 8E030060 */  lw         $v1, 0x60($s0)
/* C7DBC 800C71BC 0043102A */  slt        $v0, $v0, $v1
/* C7DC0 800C71C0 1440000D */  bnez       $v0, .L800C71F8
/* C7DC4 800C71C4 00000000 */   nop
/* C7DC8 800C71C8 93A2001E */  lbu        $v0, 0x1e($sp)
/* C7DCC 800C71CC 92030064 */  lbu        $v1, 0x64($s0)
/* C7DD0 800C71D0 0043102B */  sltu       $v0, $v0, $v1
/* C7DD4 800C71D4 10400008 */  beqz       $v0, .L800C71F8
/* C7DD8 800C71D8 00000000 */   nop
/* C7DDC 800C71DC 93A2001F */  lbu        $v0, 0x1f($sp)
/* C7DE0 800C71E0 2C430001 */  sltiu      $v1, $v0, 1
/* C7DE4 800C71E4 2C420080 */  sltiu      $v0, $v0, 0x80
/* C7DE8 800C71E8 38420001 */  xori       $v0, $v0, 1
/* C7DEC 800C71EC 00621825 */  or         $v1, $v1, $v0
/* C7DF0 800C71F0 50600007 */  beql       $v1, $zero, .L800C7210
/* C7DF4 800C71F4 328200FF */   andi      $v0, $s4, 0xff
.L800C71F8:
/* C7DF8 800C71F8 97A4001E */  lhu        $a0, 0x1e($sp)
/* C7DFC 800C71FC 24030001 */  addiu      $v1, $zero, 1
/* C7E00 800C7200 148300B5 */  bne        $a0, $v1, .L800C74D8
/* C7E04 800C7204 24020003 */   addiu     $v0, $zero, 3
.L800C7208:
/* C7E08 800C7208 08031D36 */  j          .L800C74D8
/* C7E0C 800C720C 24020005 */   addiu     $v0, $zero, 5
.L800C7210:
/* C7E10 800C7210 14400007 */  bnez       $v0, .L800C7230
/* C7E14 800C7214 240200FF */   addiu     $v0, $zero, 0xff
/* C7E18 800C7218 93A20020 */  lbu        $v0, 0x20($sp)
/* C7E1C 800C721C 30420002 */  andi       $v0, $v0, 2
/* C7E20 800C7220 14400003 */  bnez       $v0, .L800C7230
/* C7E24 800C7224 240200FF */   addiu     $v0, $zero, 0xff
/* C7E28 800C7228 08031D36 */  j          .L800C74D8
/* C7E2C 800C722C 24020006 */   addiu     $v0, $zero, 6
.L800C7230:
/* C7E30 800C7230 02203821 */  addu       $a3, $s1, $zero
/* C7E34 800C7234 04E10002 */  bgez       $a3, .L800C7240
/* C7E38 800C7238 A3A20138 */   sb        $v0, 0x138($sp)
/* C7E3C 800C723C 24E7001F */  addiu      $a3, $a3, 0x1f
.L800C7240:
/* C7E40 800C7240 97A2001E */  lhu        $v0, 0x1e($sp)
/* C7E44 800C7244 00078943 */  sra        $s1, $a3, 5
/* C7E48 800C7248 A7A2013A */  sh         $v0, 0x13a($sp)
/* C7E4C 800C724C 2A220008 */  slti       $v0, $s1, 8
/* C7E50 800C7250 1440002C */  bnez       $v0, .L800C7304
/* C7E54 800C7254 02C01021 */   addu      $v0, $s6, $zero
/* C7E58 800C7258 27B20038 */  addiu      $s2, $sp, 0x38
/* C7E5C 800C725C 24130001 */  addiu      $s3, $zero, 1
.L800C7260:
/* C7E60 800C7260 93A3013A */  lbu        $v1, 0x13a($sp)
/* C7E64 800C7264 93A20138 */  lbu        $v0, 0x138($sp)
/* C7E68 800C7268 306700FF */  andi       $a3, $v1, 0xff
/* C7E6C 800C726C 10E20007 */  beq        $a3, $v0, .L800C728C
/* C7E70 800C7270 02002021 */   addu      $a0, $s0, $zero
/* C7E74 800C7274 A3A30138 */  sb         $v1, 0x138($sp)
/* C7E78 800C7278 02402821 */  addu       $a1, $s2, $zero
/* C7E7C 800C727C 0C03162F */  jal        __osPfsRWInode
/* C7E80 800C7280 00003021 */   addu      $a2, $zero, $zero
/* C7E84 800C7284 1440001A */  bnez       $v0, .L800C72F0
/* C7E88 800C7288 00401821 */   addu      $v1, $v0, $zero
.L800C728C:
/* C7E8C 800C728C 93A2013B */  lbu        $v0, 0x13b($sp)
/* C7E90 800C7290 00021040 */  sll        $v0, $v0, 1
/* C7E94 800C7294 00521021 */  addu       $v0, $v0, $s2
/* C7E98 800C7298 94430000 */  lhu        $v1, ($v0)
/* C7E9C 800C729C A7A3013A */  sh         $v1, 0x13a($sp)
/* C7EA0 800C72A0 8E020060 */  lw         $v0, 0x60($s0)
/* C7EA4 800C72A4 0062182A */  slt        $v1, $v1, $v0
/* C7EA8 800C72A8 1460000D */  bnez       $v1, .L800C72E0
/* C7EAC 800C72AC 00000000 */   nop
/* C7EB0 800C72B0 93A2013A */  lbu        $v0, 0x13a($sp)
/* C7EB4 800C72B4 92030064 */  lbu        $v1, 0x64($s0)
/* C7EB8 800C72B8 0043102B */  sltu       $v0, $v0, $v1
/* C7EBC 800C72BC 10400008 */  beqz       $v0, .L800C72E0
/* C7EC0 800C72C0 00000000 */   nop
/* C7EC4 800C72C4 93A2013B */  lbu        $v0, 0x13b($sp)
/* C7EC8 800C72C8 2C430001 */  sltiu      $v1, $v0, 1
/* C7ECC 800C72CC 2C420080 */  sltiu      $v0, $v0, 0x80
/* C7ED0 800C72D0 38420001 */  xori       $v0, $v0, 1
/* C7ED4 800C72D4 00621825 */  or         $v1, $v1, $v0
/* C7ED8 800C72D8 50600005 */  beql       $v1, $zero, .L800C72F0
/* C7EDC 800C72DC 00001821 */   addu      $v1, $zero, $zero
.L800C72E0:
/* C7EE0 800C72E0 97A2013A */  lhu        $v0, 0x13a($sp)
/* C7EE4 800C72E4 14530002 */  bne        $v0, $s3, .L800C72F0
/* C7EE8 800C72E8 24030003 */   addiu     $v1, $zero, 3
/* C7EEC 800C72EC 24030005 */  addiu      $v1, $zero, 5
.L800C72F0:
/* C7EF0 800C72F0 14600074 */  bnez       $v1, .L800C74C4
/* C7EF4 800C72F4 2631FFF8 */   addiu     $s1, $s1, -8
/* C7EF8 800C72F8 2A220008 */  slti       $v0, $s1, 8
/* C7EFC 800C72FC 1040FFD8 */  beqz       $v0, .L800C7260
/* C7F00 800C7300 02C01021 */   addu      $v0, $s6, $zero
.L800C7304:
/* C7F04 800C7304 04420001 */  bltzl      $v0, .L800C730C
/* C7F08 800C7308 2442001F */   addiu     $v0, $v0, 0x1f
.L800C730C:
/* C7F0C 800C730C 00029943 */  sra        $s3, $v0, 5
/* C7F10 800C7310 8FB20174 */  lw         $s2, 0x174($sp)
/* C7F14 800C7314 5A60004E */  blezl      $s3, .L800C7450
/* C7F18 800C7318 328300FF */   andi      $v1, $s4, 0xff
/* C7F1C 800C731C 24160001 */  addiu      $s6, $zero, 1
.L800C7320:
/* C7F20 800C7320 24020008 */  addiu      $v0, $zero, 8
/* C7F24 800C7324 16220028 */  bne        $s1, $v0, .L800C73C8
/* C7F28 800C7328 00000000 */   nop
/* C7F2C 800C732C 93A3013A */  lbu        $v1, 0x13a($sp)
/* C7F30 800C7330 93A20138 */  lbu        $v0, 0x138($sp)
/* C7F34 800C7334 306700FF */  andi       $a3, $v1, 0xff
/* C7F38 800C7338 10E20008 */  beq        $a3, $v0, .L800C735C
/* C7F3C 800C733C 27B10038 */   addiu     $s1, $sp, 0x38
/* C7F40 800C7340 A3A30138 */  sb         $v1, 0x138($sp)
/* C7F44 800C7344 02002021 */  addu       $a0, $s0, $zero
/* C7F48 800C7348 02202821 */  addu       $a1, $s1, $zero
/* C7F4C 800C734C 0C03162F */  jal        __osPfsRWInode
/* C7F50 800C7350 00003021 */   addu      $a2, $zero, $zero
/* C7F54 800C7354 1440001A */  bnez       $v0, .L800C73C0
/* C7F58 800C7358 00401821 */   addu      $v1, $v0, $zero
.L800C735C:
/* C7F5C 800C735C 93A2013B */  lbu        $v0, 0x13b($sp)
/* C7F60 800C7360 00021040 */  sll        $v0, $v0, 1
/* C7F64 800C7364 00511021 */  addu       $v0, $v0, $s1
/* C7F68 800C7368 94430000 */  lhu        $v1, ($v0)
/* C7F6C 800C736C A7A3013A */  sh         $v1, 0x13a($sp)
/* C7F70 800C7370 8E020060 */  lw         $v0, 0x60($s0)
/* C7F74 800C7374 0062182A */  slt        $v1, $v1, $v0
/* C7F78 800C7378 1460000D */  bnez       $v1, .L800C73B0
/* C7F7C 800C737C 00000000 */   nop
/* C7F80 800C7380 93A2013A */  lbu        $v0, 0x13a($sp)
/* C7F84 800C7384 92030064 */  lbu        $v1, 0x64($s0)
/* C7F88 800C7388 0043102B */  sltu       $v0, $v0, $v1
/* C7F8C 800C738C 10400008 */  beqz       $v0, .L800C73B0
/* C7F90 800C7390 00000000 */   nop
/* C7F94 800C7394 93A2013B */  lbu        $v0, 0x13b($sp)
/* C7F98 800C7398 2C430001 */  sltiu      $v1, $v0, 1
/* C7F9C 800C739C 2C420080 */  sltiu      $v0, $v0, 0x80
/* C7FA0 800C73A0 38420001 */  xori       $v0, $v0, 1
/* C7FA4 800C73A4 00621825 */  or         $v1, $v1, $v0
/* C7FA8 800C73A8 50600005 */  beql       $v1, $zero, .L800C73C0
/* C7FAC 800C73AC 00001821 */   addu      $v1, $zero, $zero
.L800C73B0:
/* C7FB0 800C73B0 97A2013A */  lhu        $v0, 0x13a($sp)
/* C7FB4 800C73B4 14560002 */  bne        $v0, $s6, .L800C73C0
/* C7FB8 800C73B8 24030003 */   addiu     $v1, $zero, 3
/* C7FBC 800C73BC 24030005 */  addiu      $v1, $zero, 5
.L800C73C0:
/* C7FC0 800C73C0 14600040 */  bnez       $v1, .L800C74C4
/* C7FC4 800C73C4 00008821 */   addu      $s1, $zero, $zero
.L800C73C8:
/* C7FC8 800C73C8 92020065 */  lbu        $v0, 0x65($s0)
/* C7FCC 800C73CC 93A5013A */  lbu        $a1, 0x13a($sp)
/* C7FD0 800C73D0 10450006 */  beq        $v0, $a1, .L800C73EC
/* C7FD4 800C73D4 00000000 */   nop
/* C7FD8 800C73D8 0C031DC8 */  jal        __osPfsSelectBank
/* C7FDC 800C73DC 02002021 */   addu      $a0, $s0, $zero
/* C7FE0 800C73E0 00401821 */  addu       $v1, $v0, $zero
/* C7FE4 800C73E4 1460003C */  bnez       $v1, .L800C74D8
/* C7FE8 800C73E8 00601021 */   addu      $v0, $v1, $zero
.L800C73EC:
/* C7FEC 800C73EC 93A2013B */  lbu        $v0, 0x13b($sp)
/* C7FF0 800C73F0 000210C0 */  sll        $v0, $v0, 3
/* C7FF4 800C73F4 00513021 */  addu       $a2, $v0, $s1
/* C7FF8 800C73F8 328200FF */  andi       $v0, $s4, 0xff
/* C7FFC 800C73FC 54400008 */  bnel       $v0, $zero, .L800C7420
/* C8000 800C7400 AFA00010 */   sw        $zero, 0x10($sp)
/* C8004 800C7404 8E040004 */  lw         $a0, 4($s0)
/* C8008 800C7408 8E050008 */  lw         $a1, 8($s0)
/* C800C 800C740C 30C6FFFF */  andi       $a2, $a2, 0xffff
/* C8010 800C7410 0C0309EC */  jal        __osContRamRead
/* C8014 800C7414 02403821 */   addu      $a3, $s2, $zero
/* C8018 800C7418 08031D0E */  j          .L800C7438
/* C801C 800C741C 00401821 */   addu      $v1, $v0, $zero
.L800C7420:
/* C8020 800C7420 8E040004 */  lw         $a0, 4($s0)
/* C8024 800C7424 8E050008 */  lw         $a1, 8($s0)
/* C8028 800C7428 30C6FFFF */  andi       $a2, $a2, 0xffff
/* C802C 800C742C 0C030B30 */  jal        __osContRamWrite
/* C8030 800C7430 02403821 */   addu      $a3, $s2, $zero
/* C8034 800C7434 00401821 */  addu       $v1, $v0, $zero
.L800C7438:
/* C8038 800C7438 14600022 */  bnez       $v1, .L800C74C4
/* C803C 800C743C 26520020 */   addiu     $s2, $s2, 0x20
/* C8040 800C7440 2673FFFF */  addiu      $s3, $s3, -1
/* C8044 800C7444 1E60FFB6 */  bgtz       $s3, .L800C7320
/* C8048 800C7448 26310001 */   addiu     $s1, $s1, 1
/* C804C 800C744C 328300FF */  andi       $v1, $s4, 0xff
.L800C7450:
/* C8050 800C7450 24020001 */  addiu      $v0, $zero, 1
/* C8054 800C7454 1462001D */  bne        $v1, $v0, .L800C74CC
/* C8058 800C7458 00000000 */   nop
/* C805C 800C745C 93A30020 */  lbu        $v1, 0x20($sp)
/* C8060 800C7460 30620002 */  andi       $v0, $v1, 2
/* C8064 800C7464 14400019 */  bnez       $v0, .L800C74CC
/* C8068 800C7468 34620002 */   ori       $v0, $v1, 2
/* C806C 800C746C A3A20020 */  sb         $v0, 0x20($sp)
/* C8070 800C7470 92020065 */  lbu        $v0, 0x65($s0)
/* C8074 800C7474 10400006 */  beqz       $v0, .L800C7490
/* C8078 800C7478 02002021 */   addu      $a0, $s0, $zero
/* C807C 800C747C 0C031DC8 */  jal        __osPfsSelectBank
/* C8080 800C7480 00002821 */   addu      $a1, $zero, $zero
/* C8084 800C7484 00401821 */  addu       $v1, $v0, $zero
/* C8088 800C7488 14600013 */  bnez       $v1, .L800C74D8
/* C808C 800C748C 00000000 */   nop
.L800C7490:
/* C8090 800C7490 8E06005C */  lw         $a2, 0x5c($s0)
/* C8094 800C7494 AFA00010 */  sw         $zero, 0x10($sp)
/* C8098 800C7498 8E040004 */  lw         $a0, 4($s0)
/* C809C 800C749C 8E050008 */  lw         $a1, 8($s0)
/* C80A0 800C74A0 27A70018 */  addiu      $a3, $sp, 0x18
/* C80A4 800C74A4 00D53021 */  addu       $a2, $a2, $s5
/* C80A8 800C74A8 0C030B30 */  jal        __osContRamWrite
/* C80AC 800C74AC 30C6FFFF */   andi      $a2, $a2, 0xffff
/* C80B0 800C74B0 00401821 */  addu       $v1, $v0, $zero
/* C80B4 800C74B4 10600005 */  beqz       $v1, .L800C74CC
/* C80B8 800C74B8 00000000 */   nop
/* C80BC 800C74BC 08031D36 */  j          .L800C74D8
/* C80C0 800C74C0 00000000 */   nop
.L800C74C4:
/* C80C4 800C74C4 08031D36 */  j          .L800C74D8
/* C80C8 800C74C8 00601021 */   addu      $v0, $v1, $zero
.L800C74CC:
/* C80CC 800C74CC 8E040004 */  lw         $a0, 4($s0)
/* C80D0 800C74D0 0C031878 */  jal        __osPfsGetStatus
/* C80D4 800C74D4 8E050008 */   lw        $a1, 8($s0)
.L800C74D8:
/* C80D8 800C74D8 8FBF015C */  lw         $ra, 0x15c($sp)
/* C80DC 800C74DC 8FB60158 */  lw         $s6, 0x158($sp)
/* C80E0 800C74E0 8FB50154 */  lw         $s5, 0x154($sp)
/* C80E4 800C74E4 8FB40150 */  lw         $s4, 0x150($sp)
/* C80E8 800C74E8 8FB3014C */  lw         $s3, 0x14c($sp)
/* C80EC 800C74EC 8FB20148 */  lw         $s2, 0x148($sp)
/* C80F0 800C74F0 8FB10144 */  lw         $s1, 0x144($sp)
/* C80F4 800C74F4 8FB00140 */  lw         $s0, 0x140($sp)
/* C80F8 800C74F8 03E00008 */  jr         $ra
/* C80FC 800C74FC 27BD0160 */   addiu     $sp, $sp, 0x160

glabel osPfsRepairId
/* C8100 800C7500 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C8104 800C7504 AFB00010 */  sw         $s0, 0x10($sp)
/* C8108 800C7508 00808021 */  addu       $s0, $a0, $zero
/* C810C 800C750C AFBF0014 */  sw         $ra, 0x14($sp)
/* C8110 800C7510 8E020000 */  lw         $v0, ($s0)
/* C8114 800C7514 30420005 */  andi       $v0, $v0, 5
/* C8118 800C7518 5040000A */  beql       $v0, $zero, .L800C7544
/* C811C 800C751C 24040005 */   addiu     $a0, $zero, 5
/* C8120 800C7520 0C03158E */  jal        __osGetId
/* C8124 800C7524 00000000 */   nop
/* C8128 800C7528 00402021 */  addu       $a0, $v0, $zero
/* C812C 800C752C 14800006 */  bnez       $a0, .L800C7548
/* C8130 800C7530 00801021 */   addu      $v0, $a0, $zero
/* C8134 800C7534 8E020000 */  lw         $v0, ($s0)
/* C8138 800C7538 2403FFFB */  addiu      $v1, $zero, -5
/* C813C 800C753C 00431024 */  and        $v0, $v0, $v1
/* C8140 800C7540 AE020000 */  sw         $v0, ($s0)
.L800C7544:
/* C8144 800C7544 00801021 */  addu       $v0, $a0, $zero
.L800C7548:
/* C8148 800C7548 8FBF0014 */  lw         $ra, 0x14($sp)
/* C814C 800C754C 8FB00010 */  lw         $s0, 0x10($sp)
/* C8150 800C7550 03E00008 */  jr         $ra
/* C8154 800C7554 27BD0018 */   addiu     $sp, $sp, 0x18
/* C8158 800C7558 00000000 */  nop
/* C815C 800C755C 00000000 */  nop
