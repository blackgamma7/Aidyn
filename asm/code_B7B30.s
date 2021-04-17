.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel clear_widget_handler
/* B7B30 800B6F30 3C02800F */  lui        $v0, %hi(D_800F36E0)
/* B7B34 800B6F34 3C03800F */  lui        $v1, 0x800f
/* B7B38 800B6F38 AC4536E0 */  sw         $a1, %lo(D_800F36E0)($v0)
/* B7B3C 800B6F3C 24020001 */  addiu      $v0, $zero, 1
/* B7B40 800B6F40 AC800000 */  sw         $zero, ($a0)
/* B7B44 800B6F44 AC800004 */  sw         $zero, 4($a0)
/* B7B48 800B6F48 03E00008 */  jr         $ra
/* B7B4C 800B6F4C AC6536F0 */   sw        $a1, 0x36f0($v1)

glabel func_800B6F50
/* B7B50 800B6F50 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B7B54 800B6F54 AFB00018 */  sw         $s0, 0x18($sp)
/* B7B58 800B6F58 00808021 */  addu       $s0, $a0, $zero
/* B7B5C 800B6F5C AFBF0024 */  sw         $ra, 0x24($sp)
/* B7B60 800B6F60 AFB20020 */  sw         $s2, 0x20($sp)
/* B7B64 800B6F64 AFB1001C */  sw         $s1, 0x1c($sp)
/* B7B68 800B6F68 8E020000 */  lw         $v0, ($s0)
/* B7B6C 800B6F6C 00A09021 */  addu       $s2, $a1, $zero
/* B7B70 800B6F70 1040000F */  beqz       $v0, .L800B6FB0
/* B7B74 800B6F74 AFA20010 */   sw        $v0, 0x10($sp)
/* B7B78 800B6F78 3C11800F */  lui        $s1, 0x800f
.L800B6F7C:
/* B7B7C 800B6F7C 8E020000 */  lw         $v0, ($s0)
/* B7B80 800B6F80 8C42004C */  lw         $v0, 0x4c($v0)
/* B7B84 800B6F84 10400002 */  beqz       $v0, .L800B6F90
/* B7B88 800B6F88 AE020000 */   sw        $v0, ($s0)
/* B7B8C 800B6F8C AC400048 */  sw         $zero, 0x48($v0)
.L800B6F90:
/* B7B90 800B6F90 27A50010 */  addiu      $a1, $sp, 0x10
/* B7B94 800B6F94 24060006 */  addiu      $a2, $zero, 6
/* B7B98 800B6F98 8E2436E4 */  lw         $a0, 0x36e4($s1)
/* B7B9C 800B6F9C 0C035867 */  jal        AllocFreeQueueItem
/* B7BA0 800B6FA0 00003821 */   addu      $a3, $zero, $zero
/* B7BA4 800B6FA4 8E020000 */  lw         $v0, ($s0)
/* B7BA8 800B6FA8 1440FFF4 */  bnez       $v0, .L800B6F7C
/* B7BAC 800B6FAC AFA20010 */   sw        $v0, 0x10($sp)
.L800B6FB0:
/* B7BB0 800B6FB0 32420001 */  andi       $v0, $s2, 1
/* B7BB4 800B6FB4 10400004 */  beqz       $v0, .L800B6FC8
/* B7BB8 800B6FB8 8FBF0024 */   lw        $ra, 0x24($sp)
/* B7BBC 800B6FBC 0C026262 */  jal        passToFree
/* B7BC0 800B6FC0 02002021 */   addu      $a0, $s0, $zero
/* B7BC4 800B6FC4 8FBF0024 */  lw         $ra, 0x24($sp)
.L800B6FC8:
/* B7BC8 800B6FC8 8FB20020 */  lw         $s2, 0x20($sp)
/* B7BCC 800B6FCC 8FB1001C */  lw         $s1, 0x1c($sp)
/* B7BD0 800B6FD0 8FB00018 */  lw         $s0, 0x18($sp)
/* B7BD4 800B6FD4 03E00008 */  jr         $ra
/* B7BD8 800B6FD8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B6FDC
/* B7BDC 800B6FDC 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B7BE0 800B6FE0 AFB30024 */  sw         $s3, 0x24($sp)
/* B7BE4 800B6FE4 00009821 */  addu       $s3, $zero, $zero
/* B7BE8 800B6FE8 AFB40028 */  sw         $s4, 0x28($sp)
/* B7BEC 800B6FEC 0080A021 */  addu       $s4, $a0, $zero
/* B7BF0 800B6FF0 AFB00018 */  sw         $s0, 0x18($sp)
/* B7BF4 800B6FF4 00008021 */  addu       $s0, $zero, $zero
/* B7BF8 800B6FF8 AFBF002C */  sw         $ra, 0x2c($sp)
/* B7BFC 800B6FFC AFB20020 */  sw         $s2, 0x20($sp)
/* B7C00 800B7000 AFB1001C */  sw         $s1, 0x1c($sp)
/* B7C04 800B7004 8E820000 */  lw         $v0, ($s4)
/* B7C08 800B7008 30B200FF */  andi       $s2, $a1, 0xff
/* B7C0C 800B700C 1240004C */  beqz       $s2, .L800B7140
/* B7C10 800B7010 AFA20010 */   sw        $v0, 0x10($sp)
/* B7C14 800B7014 8FA20010 */  lw         $v0, 0x10($sp)
.L800B7018:
/* B7C18 800B7018 10400042 */  beqz       $v0, .L800B7124
/* B7C1C 800B701C 24020006 */   addiu     $v0, $zero, 6
/* B7C20 800B7020 8FA30010 */  lw         $v1, 0x10($sp)
.L800B7024:
/* B7C24 800B7024 00608821 */  addu       $s1, $v1, $zero
/* B7C28 800B7028 00603021 */  addu       $a2, $v1, $zero
/* B7C2C 800B702C 90700070 */  lbu        $s0, 0x70($v1)
/* B7C30 800B7030 2605FFFF */  addiu      $a1, $s0, -1
/* B7C34 800B7034 2CA20006 */  sltiu      $v0, $a1, 6
/* B7C38 800B7038 10400036 */  beqz       $v0, .L800B7114
/* B7C3C 800B703C 8E31004C */   lw        $s1, 0x4c($s1)
/* B7C40 800B7040 3C02800E */  lui        $v0, %hi(D_800E3F70)
/* B7C44 800B7044 24423F70 */  addiu      $v0, $v0, %lo(D_800E3F70)
/* B7C48 800B7048 00051880 */  sll        $v1, $a1, 2
/* B7C4C 800B704C 00621821 */  addu       $v1, $v1, $v0
/* B7C50 800B7050 8C640000 */  lw         $a0, ($v1)
/* B7C54 800B7054 00800008 */  jr         $a0
/* B7C58 800B7058 00000000 */   nop
/* B7C5C 800B705C 0C02DE64 */  jal        func_800B7990
/* B7C60 800B7060 8FA40010 */   lw        $a0, 0x10($sp)
/* B7C64 800B7064 24030002 */  addiu      $v1, $zero, 2
/* B7C68 800B7068 5443002B */  bnel       $v0, $v1, .L800B7118
/* B7C6C 800B706C AFB10010 */   sw        $s1, 0x10($sp)
/* B7C70 800B7070 8FA40010 */  lw         $a0, 0x10($sp)
/* B7C74 800B7074 0C02DEC8 */  jal        set_widgets_byte0x70
/* B7C78 800B7078 24050003 */   addiu     $a1, $zero, 3
/* B7C7C 800B707C 8FA40010 */  lw         $a0, 0x10($sp)
/* B7C80 800B7080 8C830078 */  lw         $v1, 0x78($a0)
/* B7C84 800B7084 84650028 */  lh         $a1, 0x28($v1)
/* B7C88 800B7088 8C62002C */  lw         $v0, 0x2c($v1)
/* B7C8C 800B708C 0040F809 */  jalr       $v0
/* B7C90 800B7090 00852021 */   addu      $a0, $a0, $a1
/* B7C94 800B7094 8FA30010 */  lw         $v1, 0x10($sp)
/* B7C98 800B7098 8C62004C */  lw         $v0, 0x4c($v1)
/* B7C9C 800B709C 90700070 */  lbu        $s0, 0x70($v1)
/* B7CA0 800B70A0 0802DC45 */  j          .L800B7114
/* B7CA4 800B70A4 AFA20010 */   sw        $v0, 0x10($sp)
/* B7CA8 800B70A8 8CC30078 */  lw         $v1, 0x78($a2)
/* B7CAC 800B70AC 84640028 */  lh         $a0, 0x28($v1)
/* B7CB0 800B70B0 8C62002C */  lw         $v0, 0x2c($v1)
/* B7CB4 800B70B4 0040F809 */  jalr       $v0
/* B7CB8 800B70B8 00C42021 */   addu      $a0, $a2, $a0
/* B7CBC 800B70BC 8FA30010 */  lw         $v1, 0x10($sp)
/* B7CC0 800B70C0 8C62004C */  lw         $v0, 0x4c($v1)
/* B7CC4 800B70C4 24100003 */  addiu      $s0, $zero, 3
/* B7CC8 800B70C8 0802DC45 */  j          .L800B7114
/* B7CCC 800B70CC AFA20010 */   sw        $v0, 0x10($sp)
/* B7CD0 800B70D0 0C02DE96 */  jal        func_800B7A58
/* B7CD4 800B70D4 8FA40010 */   lw        $a0, 0x10($sp)
/* B7CD8 800B70D8 24030006 */  addiu      $v1, $zero, 6
/* B7CDC 800B70DC 1443000D */  bne        $v0, $v1, .L800B7114
/* B7CE0 800B70E0 24100005 */   addiu     $s0, $zero, 5
/* B7CE4 800B70E4 02802021 */  addu       $a0, $s4, $zero
/* B7CE8 800B70E8 8FA50010 */  lw         $a1, 0x10($sp)
/* B7CEC 800B70EC 0C02DCB3 */  jal        func_800B72CC
/* B7CF0 800B70F0 24100006 */   addiu     $s0, $zero, 6
/* B7CF4 800B70F4 27A50010 */  addiu      $a1, $sp, 0x10
/* B7CF8 800B70F8 3C02800F */  lui        $v0, %hi(queue_struct_pointer)
/* B7CFC 800B70FC 24060006 */  addiu      $a2, $zero, 6
/* B7D00 800B7100 8C4436E4 */  lw         $a0, %lo(queue_struct_pointer)($v0)
/* B7D04 800B7104 0C035867 */  jal        AllocFreeQueueItem
/* B7D08 800B7108 00003821 */   addu      $a3, $zero, $zero
/* B7D0C 800B710C 0802DC46 */  j          .L800B7118
/* B7D10 800B7110 AFB10010 */   sw        $s1, 0x10($sp)
.L800B7114:
/* B7D14 800B7114 AFB10010 */  sw         $s1, 0x10($sp)
.L800B7118:
/* B7D18 800B7118 1620FFC2 */  bnez       $s1, .L800B7024
/* B7D1C 800B711C 8FA30010 */   lw        $v1, 0x10($sp)
/* B7D20 800B7120 24020006 */  addiu      $v0, $zero, 6
.L800B7124:
/* B7D24 800B7124 12020008 */  beq        $s0, $v0, .L800B7148
/* B7D28 800B7128 8FBF002C */   lw        $ra, 0x2c($sp)
/* B7D2C 800B712C 26620001 */  addiu      $v0, $s3, 1
/* B7D30 800B7130 305300FF */  andi       $s3, $v0, 0xff
/* B7D34 800B7134 0272182B */  sltu       $v1, $s3, $s2
/* B7D38 800B7138 1460FFB7 */  bnez       $v1, .L800B7018
/* B7D3C 800B713C 8FA20010 */   lw        $v0, 0x10($sp)
.L800B7140:
/* B7D40 800B7140 02001021 */  addu       $v0, $s0, $zero
/* B7D44 800B7144 8FBF002C */  lw         $ra, 0x2c($sp)
.L800B7148:
/* B7D48 800B7148 8FB40028 */  lw         $s4, 0x28($sp)
/* B7D4C 800B714C 8FB30024 */  lw         $s3, 0x24($sp)
/* B7D50 800B7150 8FB20020 */  lw         $s2, 0x20($sp)
/* B7D54 800B7154 8FB1001C */  lw         $s1, 0x1c($sp)
/* B7D58 800B7158 8FB00018 */  lw         $s0, 0x18($sp)
/* B7D5C 800B715C 03E00008 */  jr         $ra
/* B7D60 800B7160 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800B7164
/* B7D64 800B7164 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B7D68 800B7168 AFBF0010 */  sw         $ra, 0x10($sp)
/* B7D6C 800B716C 8C840000 */  lw         $a0, ($a0)
/* B7D70 800B7170 10800009 */  beqz       $a0, .L800B7198
/* B7D74 800B7174 00001021 */   addu      $v0, $zero, $zero
.L800B7178:
/* B7D78 800B7178 54850005 */  bnel       $a0, $a1, .L800B7190
/* B7D7C 800B717C 8C84004C */   lw        $a0, 0x4c($a0)
/* B7D80 800B7180 0C02DEC8 */  jal        set_widgets_byte0x70
/* B7D84 800B7184 24050005 */   addiu     $a1, $zero, 5
/* B7D88 800B7188 0802DC66 */  j          .L800B7198
/* B7D8C 800B718C 24020001 */   addiu     $v0, $zero, 1
.L800B7190:
/* B7D90 800B7190 1480FFF9 */  bnez       $a0, .L800B7178
/* B7D94 800B7194 00001021 */   addu      $v0, $zero, $zero
.L800B7198:
/* B7D98 800B7198 8FBF0010 */  lw         $ra, 0x10($sp)
/* B7D9C 800B719C 03E00008 */  jr         $ra
/* B7DA0 800B71A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel run_widget_control_func
/* B7DA4 800B71A4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B7DA8 800B71A8 AFBF0010 */  sw         $ra, 0x10($sp)
/* B7DAC 800B71AC 8C860004 */  lw         $a2, 4($a0)
/* B7DB0 800B71B0 10C0000B */  beqz       $a2, .L800B71E0
/* B7DB4 800B71B4 24020003 */   addiu     $v0, $zero, 3
/* B7DB8 800B71B8 90C30070 */  lbu        $v1, 0x70($a2)
/* B7DBC 800B71BC 14620009 */  bne        $v1, $v0, .L800B71E4
/* B7DC0 800B71C0 00001021 */   addu      $v0, $zero, $zero
/* B7DC4 800B71C4 8CC30078 */  lw         $v1, 0x78($a2)
/* B7DC8 800B71C8 84640050 */  lh         $a0, 0x50($v1)
/* B7DCC 800B71CC 8C620054 */  lw         $v0, 0x54($v1)
/* B7DD0 800B71D0 0040F809 */  jalr       $v0
/* B7DD4 800B71D4 00C42021 */   addu      $a0, $a2, $a0
/* B7DD8 800B71D8 0802DC7A */  j          .L800B71E8
/* B7DDC 800B71DC 8FBF0010 */   lw        $ra, 0x10($sp)
.L800B71E0:
/* B7DE0 800B71E0 00001021 */  addu       $v0, $zero, $zero
.L800B71E4:
/* B7DE4 800B71E4 8FBF0010 */  lw         $ra, 0x10($sp)
.L800B71E8:
/* B7DE8 800B71E8 03E00008 */  jr         $ra
/* B7DEC 800B71EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widgetHandler
/* B7DF0 800B71F0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* B7DF4 800B71F4 AFB20018 */  sw         $s2, 0x18($sp)
/* B7DF8 800B71F8 00809021 */  addu       $s2, $a0, $zero
/* B7DFC 800B71FC AFB10014 */  sw         $s1, 0x14($sp)
/* B7E00 800B7200 00A08821 */  addu       $s1, $a1, $zero
/* B7E04 800B7204 AFBF0024 */  sw         $ra, 0x24($sp)
/* B7E08 800B7208 AFB40020 */  sw         $s4, 0x20($sp)
/* B7E0C 800B720C AFB3001C */  sw         $s3, 0x1c($sp)
/* B7E10 800B7210 AFB00010 */  sw         $s0, 0x10($sp)
/* B7E14 800B7214 12200017 */  beqz       $s1, .L800B7274
/* B7E18 800B7218 24020001 */   addiu     $v0, $zero, 1
/* B7E1C 800B721C 8E420000 */  lw         $v0, ($s2)
/* B7E20 800B7220 54400003 */  bnel       $v0, $zero, .L800B7230
/* B7E24 800B7224 8E500004 */   lw        $s0, 4($s2)
/* B7E28 800B7228 0802DC9B */  j          .L800B726C
/* B7E2C 800B722C AE510000 */   sw        $s1, ($s2)
.L800B7230:
/* B7E30 800B7230 1200000A */  beqz       $s0, .L800B725C
/* B7E34 800B7234 3C14800E */   lui       $s4, %hi(D_800E3F88)
/* B7E38 800B7238 3C13800E */  lui        $s3, %hi(D_800E3FAC)
.L800B723C:
/* B7E3C 800B723C 56110005 */  bnel       $s0, $s1, .L800B7254
/* B7E40 800B7240 8E100048 */   lw        $s0, 0x48($s0)
/* B7E44 800B7244 26843F88 */  addiu      $a0, $s4, %lo(D_800E3F88)
/* B7E48 800B7248 0C025F2D */  jal        manualCrash
/* B7E4C 800B724C 26653FAC */   addiu     $a1, $s3, %lo(D_800E3FAC)
/* B7E50 800B7250 8E100048 */  lw         $s0, 0x48($s0)
.L800B7254:
/* B7E54 800B7254 1600FFF9 */  bnez       $s0, .L800B723C
/* B7E58 800B7258 00000000 */   nop
.L800B725C:
/* B7E5C 800B725C 8E420004 */  lw         $v0, 4($s2)
/* B7E60 800B7260 AC51004C */  sw         $s1, 0x4c($v0)
/* B7E64 800B7264 8E430004 */  lw         $v1, 4($s2)
/* B7E68 800B7268 AE230048 */  sw         $v1, 0x48($s1)
.L800B726C:
/* B7E6C 800B726C AE510004 */  sw         $s1, 4($s2)
/* B7E70 800B7270 24020001 */  addiu      $v0, $zero, 1
.L800B7274:
/* B7E74 800B7274 8FBF0024 */  lw         $ra, 0x24($sp)
/* B7E78 800B7278 8FB40020 */  lw         $s4, 0x20($sp)
/* B7E7C 800B727C 8FB3001C */  lw         $s3, 0x1c($sp)
/* B7E80 800B7280 8FB20018 */  lw         $s2, 0x18($sp)
/* B7E84 800B7284 8FB10014 */  lw         $s1, 0x14($sp)
/* B7E88 800B7288 8FB00010 */  lw         $s0, 0x10($sp)
/* B7E8C 800B728C 03E00008 */  jr         $ra
/* B7E90 800B7290 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800B7294
/* B7E94 800B7294 8C820004 */  lw         $v0, 4($a0)
/* B7E98 800B7298 54400003 */  bnel       $v0, $zero, .L800B72A8
/* B7E9C 800B729C 8C430048 */   lw        $v1, 0x48($v0)
/* B7EA0 800B72A0 03E00008 */  jr         $ra
/* B7EA4 800B72A4 00001021 */   addu      $v0, $zero, $zero
.L800B72A8:
/* B7EA8 800B72A8 10600003 */  beqz       $v1, .L800B72B8
/* B7EAC 800B72AC AC830004 */   sw        $v1, 4($a0)
/* B7EB0 800B72B0 0802DCAF */  j          .L800B72BC
/* B7EB4 800B72B4 AC60004C */   sw        $zero, 0x4c($v1)
.L800B72B8:
/* B7EB8 800B72B8 AC800000 */  sw         $zero, ($a0)
.L800B72BC:
/* B7EBC 800B72BC 03E00008 */  jr         $ra
/* B7EC0 800B72C0 AC400048 */   sw        $zero, 0x48($v0)

glabel widgethandler_get_widgetB
/* B7EC4 800B72C4 03E00008 */  jr         $ra
/* B7EC8 800B72C8 8C820004 */   lw        $v0, 4($a0)

glabel func_800B72CC
/* B7ECC 800B72CC 8C860000 */  lw         $a2, ($a0)
/* B7ED0 800B72D0 10C00017 */  beqz       $a2, .L800B7330
/* B7ED4 800B72D4 00000000 */   nop
.L800B72D8:
/* B7ED8 800B72D8 54C50013 */  bnel       $a2, $a1, .L800B7328
/* B7EDC 800B72DC 8CC6004C */   lw        $a2, 0x4c($a2)
/* B7EE0 800B72E0 8CC30048 */  lw         $v1, 0x48($a2)
/* B7EE4 800B72E4 50600004 */  beql       $v1, $zero, .L800B72F8
/* B7EE8 800B72E8 8C820000 */   lw        $v0, ($a0)
/* B7EEC 800B72EC 8CC2004C */  lw         $v0, 0x4c($a2)
/* B7EF0 800B72F0 0802DCC0 */  j          .L800B7300
/* B7EF4 800B72F4 AC62004C */   sw        $v0, 0x4c($v1)
.L800B72F8:
/* B7EF8 800B72F8 8C43004C */  lw         $v1, 0x4c($v0)
/* B7EFC 800B72FC AC830000 */  sw         $v1, ($a0)
.L800B7300:
/* B7F00 800B7300 8CC3004C */  lw         $v1, 0x4c($a2)
/* B7F04 800B7304 50600004 */  beql       $v1, $zero, .L800B7318
/* B7F08 800B7308 8C820004 */   lw        $v0, 4($a0)
/* B7F0C 800B730C 8CC20048 */  lw         $v0, 0x48($a2)
/* B7F10 800B7310 0802DCC8 */  j          .L800B7320
/* B7F14 800B7314 AC620048 */   sw        $v0, 0x48($v1)
.L800B7318:
/* B7F18 800B7318 8C430048 */  lw         $v1, 0x48($v0)
/* B7F1C 800B731C AC830004 */  sw         $v1, 4($a0)
.L800B7320:
/* B7F20 800B7320 03E00008 */  jr         $ra
/* B7F24 800B7324 24020001 */   addiu     $v0, $zero, 1
.L800B7328:
/* B7F28 800B7328 14C0FFEB */  bnez       $a2, .L800B72D8
/* B7F2C 800B732C 00000000 */   nop
.L800B7330:
/* B7F30 800B7330 03E00008 */  jr         $ra
/* B7F34 800B7334 00001021 */   addu      $v0, $zero, $zero

glabel func_800B7338
/* B7F38 800B7338 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* B7F3C 800B733C 00063400 */  sll        $a2, $a2, 0x10
/* B7F40 800B7340 AFB40028 */  sw         $s4, 0x28($sp)
/* B7F44 800B7344 0006A403 */  sra        $s4, $a2, 0x10
/* B7F48 800B7348 00073C00 */  sll        $a3, $a3, 0x10
/* B7F4C 800B734C AFB30024 */  sw         $s3, 0x24($sp)
/* B7F50 800B7350 00079C03 */  sra        $s3, $a3, 0x10
/* B7F54 800B7354 AFBF0030 */  sw         $ra, 0x30($sp)
/* B7F58 800B7358 AFB5002C */  sw         $s5, 0x2c($sp)
/* B7F5C 800B735C AFB20020 */  sw         $s2, 0x20($sp)
/* B7F60 800B7360 AFB1001C */  sw         $s1, 0x1c($sp)
/* B7F64 800B7364 AFB00018 */  sw         $s0, 0x18($sp)
/* B7F68 800B7368 8C900000 */  lw         $s0, ($a0)
/* B7F6C 800B736C 87B2004A */  lh         $s2, 0x4a($sp)
/* B7F70 800B7370 12000014 */  beqz       $s0, .L800B73C4
/* B7F74 800B7374 87B1004E */   lh        $s1, 0x4e($sp)
/* B7F78 800B7378 92030070 */  lbu        $v1, 0x70($s0)
/* B7F7C 800B737C 24020006 */  addiu      $v0, $zero, 6
/* B7F80 800B7380 10620010 */  beq        $v1, $v0, .L800B73C4
/* B7F84 800B7384 24150006 */   addiu     $s5, $zero, 6
/* B7F88 800B7388 8E030078 */  lw         $v1, 0x78($s0)
.L800B738C:
/* B7F8C 800B738C 02803021 */  addu       $a2, $s4, $zero
/* B7F90 800B7390 84640040 */  lh         $a0, 0x40($v1)
/* B7F94 800B7394 02603821 */  addu       $a3, $s3, $zero
/* B7F98 800B7398 AFB20010 */  sw         $s2, 0x10($sp)
/* B7F9C 800B739C AFB10014 */  sw         $s1, 0x14($sp)
/* B7FA0 800B73A0 8C620044 */  lw         $v0, 0x44($v1)
/* B7FA4 800B73A4 0040F809 */  jalr       $v0
/* B7FA8 800B73A8 02042021 */   addu      $a0, $s0, $a0
/* B7FAC 800B73AC 8E10004C */  lw         $s0, 0x4c($s0)
/* B7FB0 800B73B0 12000004 */  beqz       $s0, .L800B73C4
/* B7FB4 800B73B4 00402821 */   addu      $a1, $v0, $zero
/* B7FB8 800B73B8 92020070 */  lbu        $v0, 0x70($s0)
/* B7FBC 800B73BC 5455FFF3 */  bnel       $v0, $s5, .L800B738C
/* B7FC0 800B73C0 8E030078 */   lw        $v1, 0x78($s0)
.L800B73C4:
/* B7FC4 800B73C4 8FBF0030 */  lw         $ra, 0x30($sp)
/* B7FC8 800B73C8 8FB5002C */  lw         $s5, 0x2c($sp)
/* B7FCC 800B73CC 8FB40028 */  lw         $s4, 0x28($sp)
/* B7FD0 800B73D0 8FB30024 */  lw         $s3, 0x24($sp)
/* B7FD4 800B73D4 8FB20020 */  lw         $s2, 0x20($sp)
/* B7FD8 800B73D8 8FB1001C */  lw         $s1, 0x1c($sp)
/* B7FDC 800B73DC 8FB00018 */  lw         $s0, 0x18($sp)
/* B7FE0 800B73E0 00A01021 */  addu       $v0, $a1, $zero
/* B7FE4 800B73E4 03E00008 */  jr         $ra
/* B7FE8 800B73E8 27BD0038 */   addiu     $sp, $sp, 0x38
/* B7FEC 800B73EC 00000000 */  nop
