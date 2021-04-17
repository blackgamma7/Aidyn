.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widgetcliptext_init
/* B8B20 800B7F20 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B8B24 800B7F24 AFB00018 */  sw         $s0, 0x18($sp)
/* B8B28 800B7F28 30D0FFFF */  andi       $s0, $a2, 0xffff
/* B8B2C 800B7F2C AFB20020 */  sw         $s2, 0x20($sp)
/* B8B30 800B7F30 00809021 */  addu       $s2, $a0, $zero
/* B8B34 800B7F34 AFB30024 */  sw         $s3, 0x24($sp)
/* B8B38 800B7F38 00A09821 */  addu       $s3, $a1, $zero
/* B8B3C 800B7F3C AFBF0028 */  sw         $ra, 0x28($sp)
/* B8B40 800B7F40 0C02DCFC */  jal        widget_init
/* B8B44 800B7F44 AFB1001C */   sw        $s1, 0x1c($sp)
/* B8B48 800B7F48 24040014 */  addiu      $a0, $zero, 0x14
/* B8B4C 800B7F4C 3C02800E */  lui        $v0, %hi(widget_methods_cliptext)
/* B8B50 800B7F50 24424120 */  addiu      $v0, $v0, %lo(widget_methods_cliptext)
/* B8B54 800B7F54 0C026259 */  jal        passToMalloc
/* B8B58 800B7F58 AE420078 */   sw        $v0, 0x78($s2)
/* B8B5C 800B7F5C 00408821 */  addu       $s1, $v0, $zero
/* B8B60 800B7F60 3C01800E */  lui        $at, %hi(D_800E40C0)
/* B8B64 800B7F64 C42040C0 */  lwc1       $f0, %lo(D_800E40C0)($at)
/* B8B68 800B7F68 24020140 */  addiu      $v0, $zero, 0x140
/* B8B6C 800B7F6C A6220012 */  sh         $v0, 0x12($s1)
/* B8B70 800B7F70 24020190 */  addiu      $v0, $zero, 0x190
/* B8B74 800B7F74 A6200010 */  sh         $zero, 0x10($s1)
/* B8B78 800B7F78 E6200008 */  swc1       $f0, 8($s1)
/* B8B7C 800B7F7C 16020007 */  bne        $s0, $v0, .L800B7F9C
/* B8B80 800B7F80 E620000C */   swc1      $f0, 0xc($s1)
/* B8B84 800B7F84 12600005 */  beqz       $s3, .L800B7F9C
/* B8B88 800B7F88 24100014 */   addiu     $s0, $zero, 0x14
/* B8B8C 800B7F8C 0C03353E */  jal        strlen
/* B8B90 800B7F90 02602021 */   addu      $a0, $s3, $zero
/* B8B94 800B7F94 24420001 */  addiu      $v0, $v0, 1
/* B8B98 800B7F98 3050FFFF */  andi       $s0, $v0, 0xffff
.L800B7F9C:
/* B8B9C 800B7F9C 2E020002 */  sltiu      $v0, $s0, 2
/* B8BA0 800B7FA0 54400001 */  bnel       $v0, $zero, .L800B7FA8
/* B8BA4 800B7FA4 24100002 */   addiu     $s0, $zero, 2
.L800B7FA8:
/* B8BA8 800B7FA8 02002021 */  addu       $a0, $s0, $zero
/* B8BAC 800B7FAC 3C05800E */  lui        $a1, %hi(D_800E40A0)
/* B8BB0 800B7FB0 24A540A0 */  addiu      $a1, $a1, %lo(D_800E40A0)
/* B8BB4 800B7FB4 0C025F9C */  jal        Malloc
/* B8BB8 800B7FB8 24060032 */   addiu     $a2, $zero, 0x32
/* B8BBC 800B7FBC 12600006 */  beqz       $s3, .L800B7FD8
/* B8BC0 800B7FC0 AE220000 */   sw        $v0, ($s1)
/* B8BC4 800B7FC4 00402021 */  addu       $a0, $v0, $zero
/* B8BC8 800B7FC8 0C0333AC */  jal        sprintf
/* B8BCC 800B7FCC 02602821 */   addu      $a1, $s3, $zero
/* B8BD0 800B7FD0 0802DFFB */  j          .L800B7FEC
/* B8BD4 800B7FD4 02402021 */   addu      $a0, $s2, $zero
.L800B7FD8:
/* B8BD8 800B7FD8 00402021 */  addu       $a0, $v0, $zero
/* B8BDC 800B7FDC 3C05800E */  lui        $a1, %hi(D_800E40BC)
/* B8BE0 800B7FE0 0C0333AC */  jal        sprintf
/* B8BE4 800B7FE4 24A540BC */   addiu     $a1, $a1, %lo(D_800E40BC)
/* B8BE8 800B7FE8 02402021 */  addu       $a0, $s2, $zero
.L800B7FEC:
/* B8BEC 800B7FEC 24050050 */  addiu      $a1, $zero, 0x50
/* B8BF0 800B7FF0 2406001E */  addiu      $a2, $zero, 0x1e
/* B8BF4 800B7FF4 24020001 */  addiu      $v0, $zero, 1
/* B8BF8 800B7FF8 AE510040 */  sw         $s1, 0x40($s2)
/* B8BFC 800B7FFC A2420070 */  sb         $v0, 0x70($s2)
/* B8C00 800B8000 A6400074 */  sh         $zero, 0x74($s2)
/* B8C04 800B8004 0C02DD3F */  jal        set_widget_coords
/* B8C08 800B8008 A6400072 */   sh        $zero, 0x72($s2)
/* B8C0C 800B800C 02402021 */  addu       $a0, $s2, $zero
/* B8C10 800B8010 240500E1 */  addiu      $a1, $zero, 0xe1
/* B8C14 800B8014 240600E1 */  addiu      $a2, $zero, 0xe1
/* B8C18 800B8018 240200FF */  addiu      $v0, $zero, 0xff
/* B8C1C 800B801C 240700E1 */  addiu      $a3, $zero, 0xe1
/* B8C20 800B8020 0C02DD4A */  jal        set_widget_color
/* B8C24 800B8024 AFA20010 */   sw        $v0, 0x10($sp)
/* B8C28 800B8028 02401021 */  addu       $v0, $s2, $zero
/* B8C2C 800B802C 8FBF0028 */  lw         $ra, 0x28($sp)
/* B8C30 800B8030 8FB30024 */  lw         $s3, 0x24($sp)
/* B8C34 800B8034 8FB20020 */  lw         $s2, 0x20($sp)
/* B8C38 800B8038 8FB1001C */  lw         $s1, 0x1c($sp)
/* B8C3C 800B803C 8FB00018 */  lw         $s0, 0x18($sp)
/* B8C40 800B8040 03E00008 */  jr         $ra
/* B8C44 800B8044 27BD0030 */   addiu     $sp, $sp, 0x30

glabel free_widgetcliptext
/* B8C48 800B8048 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B8C4C 800B804C AFB10014 */  sw         $s1, 0x14($sp)
/* B8C50 800B8050 00808821 */  addu       $s1, $a0, $zero
/* B8C54 800B8054 3C02800E */  lui        $v0, %hi(widget_methods_cliptext)
/* B8C58 800B8058 24424120 */  addiu      $v0, $v0, %lo(widget_methods_cliptext)
/* B8C5C 800B805C AFBF001C */  sw         $ra, 0x1c($sp)
/* B8C60 800B8060 AFB20018 */  sw         $s2, 0x18($sp)
/* B8C64 800B8064 AFB00010 */  sw         $s0, 0x10($sp)
/* B8C68 800B8068 8E300040 */  lw         $s0, 0x40($s1)
/* B8C6C 800B806C 00A09021 */  addu       $s2, $a1, $zero
/* B8C70 800B8070 1200000A */  beqz       $s0, .L800B809C
/* B8C74 800B8074 AE220078 */   sw        $v0, 0x78($s1)
/* B8C78 800B8078 8E040000 */  lw         $a0, ($s0)
/* B8C7C 800B807C 10800004 */  beqz       $a0, .L800B8090
/* B8C80 800B8080 3C05800E */   lui       $a1, %hi(D_800E40A0)
/* B8C84 800B8084 24A540A0 */  addiu      $a1, $a1, %lo(D_800E40A0)
/* B8C88 800B8088 0C02600C */  jal        Free
/* B8C8C 800B808C 24060053 */   addiu     $a2, $zero, 0x53
.L800B8090:
/* B8C90 800B8090 0C026262 */  jal        passToFree
/* B8C94 800B8094 02002021 */   addu      $a0, $s0, $zero
/* B8C98 800B8098 AE200040 */  sw         $zero, 0x40($s1)
.L800B809C:
/* B8C9C 800B809C 02202021 */  addu       $a0, $s1, $zero
/* B8CA0 800B80A0 0C02DD2B */  jal        free_widget
/* B8CA4 800B80A4 02402821 */   addu      $a1, $s2, $zero
/* B8CA8 800B80A8 8FBF001C */  lw         $ra, 0x1c($sp)
/* B8CAC 800B80AC 8FB20018 */  lw         $s2, 0x18($sp)
/* B8CB0 800B80B0 8FB10014 */  lw         $s1, 0x14($sp)
/* B8CB4 800B80B4 8FB00010 */  lw         $s0, 0x10($sp)
/* B8CB8 800B80B8 03E00008 */  jr         $ra
/* B8CBC 800B80BC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel widgetcliptext_func
/* B8CC0 800B80C0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* B8CC4 800B80C4 AFB00038 */  sw         $s0, 0x38($sp)
/* B8CC8 800B80C8 00808021 */  addu       $s0, $a0, $zero
/* B8CCC 800B80CC 00063400 */  sll        $a2, $a2, 0x10
/* B8CD0 800B80D0 AFB1003C */  sw         $s1, 0x3c($sp)
/* B8CD4 800B80D4 00068C03 */  sra        $s1, $a2, 0x10
/* B8CD8 800B80D8 00073C00 */  sll        $a3, $a3, 0x10
/* B8CDC 800B80DC AFBF004C */  sw         $ra, 0x4c($sp)
/* B8CE0 800B80E0 AFB40048 */  sw         $s4, 0x48($sp)
/* B8CE4 800B80E4 AFB30044 */  sw         $s3, 0x44($sp)
/* B8CE8 800B80E8 AFB20040 */  sw         $s2, 0x40($sp)
/* B8CEC 800B80EC 86080064 */  lh         $t0, 0x64($s0)
/* B8CF0 800B80F0 860A0066 */  lh         $t2, 0x66($s0)
/* B8CF4 800B80F4 860D0068 */  lh         $t5, 0x68($s0)
/* B8CF8 800B80F8 8609006A */  lh         $t1, 0x6a($s0)
/* B8CFC 800B80FC 87B30062 */  lh         $s3, 0x62($sp)
/* B8D00 800B8100 87B40066 */  lh         $s4, 0x66($sp)
/* B8D04 800B8104 00079403 */  sra        $s2, $a3, 0x10
/* B8D08 800B8108 0111102A */  slt        $v0, $t0, $s1
/* B8D0C 800B810C 10400002 */  beqz       $v0, .L800B8118
/* B8D10 800B8110 AFA50054 */   sw        $a1, 0x54($sp)
/* B8D14 800B8114 02204021 */  addu       $t0, $s1, $zero
.L800B8118:
/* B8D18 800B8118 026A102A */  slt        $v0, $s3, $t2
/* B8D1C 800B811C 54400001 */  bnel       $v0, $zero, .L800B8124
/* B8D20 800B8120 02605021 */   addu      $t2, $s3, $zero
.L800B8124:
/* B8D24 800B8124 01B2102A */  slt        $v0, $t5, $s2
/* B8D28 800B8128 54400001 */  bnel       $v0, $zero, .L800B8130
/* B8D2C 800B812C 02406821 */   addu      $t5, $s2, $zero
.L800B8130:
/* B8D30 800B8130 0289102A */  slt        $v0, $s4, $t1
/* B8D34 800B8134 54400001 */  bnel       $v0, $zero, .L800B813C
/* B8D38 800B8138 02804821 */   addu      $t1, $s4, $zero
.L800B813C:
/* B8D3C 800B813C 00002821 */  addu       $a1, $zero, $zero
/* B8D40 800B8140 86020060 */  lh         $v0, 0x60($s0)
/* B8D44 800B8144 0142102A */  slt        $v0, $t2, $v0
/* B8D48 800B8148 14400009 */  bnez       $v0, .L800B8170
/* B8D4C 800B814C 8E060040 */   lw        $a2, 0x40($s0)
/* B8D50 800B8150 84C20012 */  lh         $v0, 0x12($a2)
/* B8D54 800B8154 0048102A */  slt        $v0, $v0, $t0
/* B8D58 800B8158 14400006 */  bnez       $v0, .L800B8174
/* B8D5C 800B815C 02002021 */   addu      $a0, $s0, $zero
/* B8D60 800B8160 86020062 */  lh         $v0, 0x62($s0)
/* B8D64 800B8164 0122102A */  slt        $v0, $t1, $v0
/* B8D68 800B8168 1040000A */  beqz       $v0, .L800B8194
/* B8D6C 800B816C 3C03800F */   lui       $v1, 0x800f
.L800B8170:
/* B8D70 800B8170 02002021 */  addu       $a0, $s0, $zero
.L800B8174:
/* B8D74 800B8174 02203021 */  addu       $a2, $s1, $zero
/* B8D78 800B8178 8FA50054 */  lw         $a1, 0x54($sp)
/* B8D7C 800B817C 02403821 */  addu       $a3, $s2, $zero
/* B8D80 800B8180 AFB30010 */  sw         $s3, 0x10($sp)
/* B8D84 800B8184 0C02DE14 */  jal        widget_func_8
/* B8D88 800B8188 AFB40014 */   sw        $s4, 0x14($sp)
/* B8D8C 800B818C 0802E0E5 */  j          .L800B8394
/* B8D90 800B8190 8FBF004C */   lw        $ra, 0x4c($sp)
.L800B8194:
/* B8D94 800B8194 92020058 */  lbu        $v0, 0x58($s0)
/* B8D98 800B8198 C46236F8 */  lwc1       $f2, 0x36f8($v1)
/* B8D9C 800B819C 44820000 */  mtc1       $v0, $f0
/* B8DA0 800B81A0 46800020 */  cvt.s.w    $f0, $f0
/* B8DA4 800B81A4 46020002 */  mul.s      $f0, $f0, $f2
/* B8DA8 800B81A8 3C01800E */  lui        $at, %hi(D_800E40C4)
/* B8DAC 800B81AC C42240C4 */  lwc1       $f2, %lo(D_800E40C4)($at)
/* B8DB0 800B81B0 4600103E */  c.le.s     $f2, $f0
/* B8DB4 800B81B4 00000000 */  nop
/* B8DB8 800B81B8 45010005 */  bc1t       .L800B81D0
/* B8DBC 800B81BC 00605821 */   addu      $t3, $v1, $zero
/* B8DC0 800B81C0 4600008D */  trunc.w.s  $f2, $f0
/* B8DC4 800B81C4 44031000 */  mfc1       $v1, $f2
/* B8DC8 800B81C8 0802E07A */  j          .L800B81E8
/* B8DCC 800B81CC 92020059 */   lbu       $v0, 0x59($s0)
.L800B81D0:
/* B8DD0 800B81D0 46020001 */  sub.s      $f0, $f0, $f2
/* B8DD4 800B81D4 4600008D */  trunc.w.s  $f2, $f0
/* B8DD8 800B81D8 44031000 */  mfc1       $v1, $f2
/* B8DDC 800B81DC 3C028000 */  lui        $v0, 0x8000
/* B8DE0 800B81E0 00621825 */  or         $v1, $v1, $v0
/* B8DE4 800B81E4 92020059 */  lbu        $v0, 0x59($s0)
.L800B81E8:
/* B8DE8 800B81E8 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B8DEC 800B81EC 44820000 */  mtc1       $v0, $f0
/* B8DF0 800B81F0 46800020 */  cvt.s.w    $f0, $f0
/* B8DF4 800B81F4 46020002 */  mul.s      $f0, $f0, $f2
/* B8DF8 800B81F8 3C01800E */  lui        $at, %hi(D_800E40C8)
/* B8DFC 800B81FC C42240C8 */  lwc1       $f2, %lo(D_800E40C8)($at)
/* B8E00 800B8200 4600103E */  c.le.s     $f2, $f0
/* B8E04 800B8204 00000000 */  nop
/* B8E08 800B8208 45010005 */  bc1t       .L800B8220
/* B8E0C 800B820C 306E00FF */   andi      $t6, $v1, 0xff
/* B8E10 800B8210 4600008D */  trunc.w.s  $f2, $f0
/* B8E14 800B8214 44031000 */  mfc1       $v1, $f2
/* B8E18 800B8218 0802E08E */  j          .L800B8238
/* B8E1C 800B821C 9202005A */   lbu       $v0, 0x5a($s0)
.L800B8220:
/* B8E20 800B8220 46020001 */  sub.s      $f0, $f0, $f2
/* B8E24 800B8224 4600008D */  trunc.w.s  $f2, $f0
/* B8E28 800B8228 44031000 */  mfc1       $v1, $f2
/* B8E2C 800B822C 3C028000 */  lui        $v0, 0x8000
/* B8E30 800B8230 00621825 */  or         $v1, $v1, $v0
/* B8E34 800B8234 9202005A */  lbu        $v0, 0x5a($s0)
.L800B8238:
/* B8E38 800B8238 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B8E3C 800B823C 44820000 */  mtc1       $v0, $f0
/* B8E40 800B8240 46800020 */  cvt.s.w    $f0, $f0
/* B8E44 800B8244 46020002 */  mul.s      $f0, $f0, $f2
/* B8E48 800B8248 3C01800E */  lui        $at, %hi(D_800E40CC)
/* B8E4C 800B824C C42240CC */  lwc1       $f2, %lo(D_800E40CC)($at)
/* B8E50 800B8250 4600103E */  c.le.s     $f2, $f0
/* B8E54 800B8254 00000000 */  nop
/* B8E58 800B8258 45010005 */  bc1t       .L800B8270
/* B8E5C 800B825C 306C00FF */   andi      $t4, $v1, 0xff
/* B8E60 800B8260 4600008D */  trunc.w.s  $f2, $f0
/* B8E64 800B8264 44031000 */  mfc1       $v1, $f2
/* B8E68 800B8268 0802E0A2 */  j          .L800B8288
/* B8E6C 800B826C 9202005B */   lbu       $v0, 0x5b($s0)
.L800B8270:
/* B8E70 800B8270 46020001 */  sub.s      $f0, $f0, $f2
/* B8E74 800B8274 4600008D */  trunc.w.s  $f2, $f0
/* B8E78 800B8278 44031000 */  mfc1       $v1, $f2
/* B8E7C 800B827C 3C028000 */  lui        $v0, 0x8000
/* B8E80 800B8280 00621825 */  or         $v1, $v1, $v0
/* B8E84 800B8284 9202005B */  lbu        $v0, 0x5b($s0)
.L800B8288:
/* B8E88 800B8288 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B8E8C 800B828C 44820000 */  mtc1       $v0, $f0
/* B8E90 800B8290 46800020 */  cvt.s.w    $f0, $f0
/* B8E94 800B8294 46020002 */  mul.s      $f0, $f0, $f2
/* B8E98 800B8298 3C01800E */  lui        $at, %hi(D_800E40D0)
/* B8E9C 800B829C C42240D0 */  lwc1       $f2, %lo(D_800E40D0)($at)
/* B8EA0 800B82A0 4600103E */  c.le.s     $f2, $f0
/* B8EA4 800B82A4 00000000 */  nop
/* B8EA8 800B82A8 45010005 */  bc1t       .L800B82C0
/* B8EAC 800B82AC 306400FF */   andi      $a0, $v1, 0xff
/* B8EB0 800B82B0 4600008D */  trunc.w.s  $f2, $f0
/* B8EB4 800B82B4 44031000 */  mfc1       $v1, $f2
/* B8EB8 800B82B8 0802E0B6 */  j          .L800B82D8
/* B8EBC 800B82BC 3C07800F */   lui       $a3, 0x800f
.L800B82C0:
/* B8EC0 800B82C0 46020001 */  sub.s      $f0, $f0, $f2
/* B8EC4 800B82C4 4600008D */  trunc.w.s  $f2, $f0
/* B8EC8 800B82C8 44031000 */  mfc1       $v1, $f2
/* B8ECC 800B82CC 3C028000 */  lui        $v0, %hi(D_8000001C)
/* B8ED0 800B82D0 00621825 */  or         $v1, $v1, $v0
/* B8ED4 800B82D4 3C07800F */  lui        $a3, %hi(font_pointer)
.L800B82D8:
/* B8ED8 800B82D8 8CE236F0 */  lw         $v0, %lo(font_pointer)($a3)
/* B8EDC 800B82DC A04E001C */  sb         $t6, %lo(D_8000001C)($v0)
/* B8EE0 800B82E0 A04C001D */  sb         $t4, 0x1d($v0)
/* B8EE4 800B82E4 A044001E */  sb         $a0, 0x1e($v0)
/* B8EE8 800B82E8 A043001F */  sb         $v1, 0x1f($v0)
/* B8EEC 800B82EC 9203005B */  lbu        $v1, 0x5b($s0)
/* B8EF0 800B82F0 C56236F8 */  lwc1       $f2, 0x36f8($t3)
/* B8EF4 800B82F4 44830000 */  mtc1       $v1, $f0
/* B8EF8 800B82F8 46800020 */  cvt.s.w    $f0, $f0
/* B8EFC 800B82FC 46020002 */  mul.s      $f0, $f0, $f2
/* B8F00 800B8300 44802000 */  mtc1       $zero, $f4
/* B8F04 800B8304 4600203C */  c.lt.s     $f4, $f0
/* B8F08 800B8308 00000000 */  nop
/* B8F0C 800B830C 45000014 */  bc1f       .L800B8360
/* B8F10 800B8310 8CE436F0 */   lw        $a0, 0x36f0($a3)
/* B8F14 800B8314 86020062 */  lh         $v0, 0x62($s0)
/* B8F18 800B8318 AFA20010 */  sw         $v0, 0x10($sp)
/* B8F1C 800B831C 84C30010 */  lh         $v1, 0x10($a2)
/* B8F20 800B8320 AFA30014 */  sw         $v1, 0x14($sp)
/* B8F24 800B8324 84C20012 */  lh         $v0, 0x12($a2)
/* B8F28 800B8328 AFA8001C */  sw         $t0, 0x1c($sp)
/* B8F2C 800B832C AFAD0020 */  sw         $t5, 0x20($sp)
/* B8F30 800B8330 AFAA0024 */  sw         $t2, 0x24($sp)
/* B8F34 800B8334 AFA90028 */  sw         $t1, 0x28($sp)
/* B8F38 800B8338 AFA20018 */  sw         $v0, 0x18($sp)
/* B8F3C 800B833C C4C00008 */  lwc1       $f0, 8($a2)
/* B8F40 800B8340 E7A0002C */  swc1       $f0, 0x2c($sp)
/* B8F44 800B8344 C4C2000C */  lwc1       $f2, 0xc($a2)
/* B8F48 800B8348 E7A20030 */  swc1       $f2, 0x30($sp)
/* B8F4C 800B834C 86070060 */  lh         $a3, 0x60($s0)
/* B8F50 800B8350 8CC60000 */  lw         $a2, ($a2)
/* B8F54 800B8354 0C02D212 */  jal        display_text_func_A
/* B8F58 800B8358 27A50054 */   addiu     $a1, $sp, 0x54
/* B8F5C 800B835C 00402821 */  addu       $a1, $v0, $zero
.L800B8360:
/* B8F60 800B8360 02002021 */  addu       $a0, $s0, $zero
/* B8F64 800B8364 0C02DD46 */  jal        set_widgetWidth
/* B8F68 800B8368 30A5FFFF */   andi      $a1, $a1, 0xffff
/* B8F6C 800B836C 02002021 */  addu       $a0, $s0, $zero
/* B8F70 800B8370 02203021 */  addu       $a2, $s1, $zero
/* B8F74 800B8374 8FA50054 */  lw         $a1, 0x54($sp)
/* B8F78 800B8378 02403821 */  addu       $a3, $s2, $zero
/* B8F7C 800B837C AFB30010 */  sw         $s3, 0x10($sp)
/* B8F80 800B8380 0C02DE14 */  jal        widget_func_8
/* B8F84 800B8384 AFB40014 */   sw        $s4, 0x14($sp)
/* B8F88 800B8388 00401821 */  addu       $v1, $v0, $zero
/* B8F8C 800B838C AFA30054 */  sw         $v1, 0x54($sp)
/* B8F90 800B8390 8FBF004C */  lw         $ra, 0x4c($sp)
.L800B8394:
/* B8F94 800B8394 8FB40048 */  lw         $s4, 0x48($sp)
/* B8F98 800B8398 8FB30044 */  lw         $s3, 0x44($sp)
/* B8F9C 800B839C 8FB20040 */  lw         $s2, 0x40($sp)
/* B8FA0 800B83A0 8FB1003C */  lw         $s1, 0x3c($sp)
/* B8FA4 800B83A4 8FB00038 */  lw         $s0, 0x38($sp)
/* B8FA8 800B83A8 03E00008 */  jr         $ra
/* B8FAC 800B83AC 27BD0050 */   addiu     $sp, $sp, 0x50

glabel func_800B83B0
/* B8FB0 800B83B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B8FB4 800B83B4 AFB10014 */  sw         $s1, 0x14($sp)
/* B8FB8 800B83B8 00808821 */  addu       $s1, $a0, $zero
/* B8FBC 800B83BC 3C02800F */  lui        $v0, %hi(font_pointer)
/* B8FC0 800B83C0 AFBF0018 */  sw         $ra, 0x18($sp)
/* B8FC4 800B83C4 AFB00010 */  sw         $s0, 0x10($sp)
/* B8FC8 800B83C8 8E300040 */  lw         $s0, 0x40($s1)
/* B8FCC 800B83CC 8C4436F0 */  lw         $a0, %lo(font_pointer)($v0)
/* B8FD0 800B83D0 8E050000 */  lw         $a1, ($s0)
/* B8FD4 800B83D4 0C02D44A */  jal        func_800B5128
/* B8FD8 800B83D8 8E060008 */   lw        $a2, 8($s0)
/* B8FDC 800B83DC 86050012 */  lh         $a1, 0x12($s0)
/* B8FE0 800B83E0 86040010 */  lh         $a0, 0x10($s0)
/* B8FE4 800B83E4 00401821 */  addu       $v1, $v0, $zero
/* B8FE8 800B83E8 00A4102A */  slt        $v0, $a1, $a0
/* B8FEC 800B83EC 10400003 */  beqz       $v0, .L800B83FC
/* B8FF0 800B83F0 00001021 */   addu      $v0, $zero, $zero
/* B8FF4 800B83F4 0802E105 */  j          .L800B8414
/* B8FF8 800B83F8 A6200074 */   sh        $zero, 0x74($s1)
.L800B83FC:
/* B8FFC 800B83FC 00A42023 */  subu       $a0, $a1, $a0
/* B9000 800B8400 0083102B */  sltu       $v0, $a0, $v1
/* B9004 800B8404 54400001 */  bnel       $v0, $zero, .L800B840C
/* B9008 800B8408 00801821 */   addu      $v1, $a0, $zero
.L800B840C:
/* B900C 800B840C A6230074 */  sh         $v1, 0x74($s1)
/* B9010 800B8410 3062FFFF */  andi       $v0, $v1, 0xffff
.L800B8414:
/* B9014 800B8414 8FBF0018 */  lw         $ra, 0x18($sp)
/* B9018 800B8418 8FB10014 */  lw         $s1, 0x14($sp)
/* B901C 800B841C 8FB00010 */  lw         $s0, 0x10($sp)
/* B9020 800B8420 03E00008 */  jr         $ra
/* B9024 800B8424 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B8428
/* B9028 800B8428 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B902C 800B842C AFB00018 */  sw         $s0, 0x18($sp)
/* B9030 800B8430 00808021 */  addu       $s0, $a0, $zero
/* B9034 800B8434 3C03800F */  lui        $v1, %hi(font_pointer)
/* B9038 800B8438 AFBF001C */  sw         $ra, 0x1c($sp)
/* B903C 800B843C 8E020040 */  lw         $v0, 0x40($s0)
/* B9040 800B8440 8C6436F0 */  lw         $a0, %lo(font_pointer)($v1)
/* B9044 800B8444 C4420008 */  lwc1       $f2, 8($v0)
/* B9048 800B8448 84460010 */  lh         $a2, 0x10($v0)
/* B904C 800B844C 84470012 */  lh         $a3, 0x12($v0)
/* B9050 800B8450 E7A20010 */  swc1       $f2, 0x10($sp)
/* B9054 800B8454 C440000C */  lwc1       $f0, 0xc($v0)
/* B9058 800B8458 E7A00014 */  swc1       $f0, 0x14($sp)
/* B905C 800B845C 0C02D4AD */  jal        func_800B52B4
/* B9060 800B8460 8C450000 */   lw        $a1, ($v0)
/* B9064 800B8464 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9068 800B8468 A6020072 */  sh         $v0, 0x72($s0)
/* B906C 800B846C 8FB00018 */  lw         $s0, 0x18($sp)
/* B9070 800B8470 3042FFFF */  andi       $v0, $v0, 0xffff
/* B9074 800B8474 03E00008 */  jr         $ra
/* B9078 800B8478 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B847C
/* B907C 800B847C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B9080 800B8480 AFBF0010 */  sw         $ra, 0x10($sp)
/* B9084 800B8484 0C02DE51 */  jal        func_800B7944
/* B9088 800B8488 00000000 */   nop
/* B908C 800B848C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B9090 800B8490 03E00008 */  jr         $ra
/* B9094 800B8494 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ofunc_WidgetClipText_SetText
/* B9098 800B8498 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B909C 800B849C AFB20018 */  sw         $s2, 0x18($sp)
/* B90A0 800B84A0 00A09021 */  addu       $s2, $a1, $zero
/* B90A4 800B84A4 AFBF001C */  sw         $ra, 0x1c($sp)
/* B90A8 800B84A8 AFB10014 */  sw         $s1, 0x14($sp)
/* B90AC 800B84AC AFB00010 */  sw         $s0, 0x10($sp)
/* B90B0 800B84B0 8C910040 */  lw         $s1, 0x40($a0)
/* B90B4 800B84B4 02402021 */  addu       $a0, $s2, $zero
/* B90B8 800B84B8 0C03353E */  jal        strlen
/* B90BC 800B84BC 00C08021 */   addu      $s0, $a2, $zero
/* B90C0 800B84C0 96230004 */  lhu        $v1, 4($s1)
/* B90C4 800B84C4 24420001 */  addiu      $v0, $v0, 1
/* B90C8 800B84C8 0062182A */  slt        $v1, $v1, $v0
/* B90CC 800B84CC 14600006 */  bnez       $v1, .L800B84E8
/* B90D0 800B84D0 00000000 */   nop
/* B90D4 800B84D4 8E240000 */  lw         $a0, ($s1)
/* B90D8 800B84D8 0C0333AC */  jal        sprintf
/* B90DC 800B84DC 02402821 */   addu      $a1, $s2, $zero
/* B90E0 800B84E0 0802E155 */  j          .L800B8554
/* B90E4 800B84E4 24020001 */   addiu     $v0, $zero, 1
.L800B84E8:
/* B90E8 800B84E8 16000008 */  bnez       $s0, .L800B850C
/* B90EC 800B84EC 3C10800E */   lui       $s0, 0x800e
/* B90F0 800B84F0 3C04800E */  lui        $a0, %hi(D_800E40D4)
/* B90F4 800B84F4 248440D4 */  addiu      $a0, $a0, %lo(D_800E40D4)
/* B90F8 800B84F8 3C05800E */  lui        $a1, %hi(D_800E40F0)
/* B90FC 800B84FC 0C025F2D */  jal        manualCrash
/* B9100 800B8500 24A540F0 */   addiu     $a1, $a1, %lo(D_800E40F0)
/* B9104 800B8504 0802E155 */  j          .L800B8554
/* B9108 800B8508 00001021 */   addu      $v0, $zero, $zero
.L800B850C:
/* B910C 800B850C 261040A0 */  addiu      $s0, $s0, 0x40a0
/* B9110 800B8510 02002821 */  addu       $a1, $s0, $zero
/* B9114 800B8514 8E240000 */  lw         $a0, ($s1)
/* B9118 800B8518 0C02600C */  jal        Free
/* B911C 800B851C 240600C3 */   addiu     $a2, $zero, 0xc3
/* B9120 800B8520 0C03353E */  jal        strlen
/* B9124 800B8524 02402021 */   addu      $a0, $s2, $zero
/* B9128 800B8528 02002821 */  addu       $a1, $s0, $zero
/* B912C 800B852C 24420001 */  addiu      $v0, $v0, 1
/* B9130 800B8530 A6220004 */  sh         $v0, 4($s1)
/* B9134 800B8534 3044FFFF */  andi       $a0, $v0, 0xffff
/* B9138 800B8538 0C025F9C */  jal        Malloc
/* B913C 800B853C 240600C6 */   addiu     $a2, $zero, 0xc6
/* B9140 800B8540 00402021 */  addu       $a0, $v0, $zero
/* B9144 800B8544 02402821 */  addu       $a1, $s2, $zero
/* B9148 800B8548 0C02626C */  jal        copy_string
/* B914C 800B854C AE220000 */   sw        $v0, ($s1)
/* B9150 800B8550 24020001 */  addiu      $v0, $zero, 1
.L800B8554:
/* B9154 800B8554 8FBF001C */  lw         $ra, 0x1c($sp)
/* B9158 800B8558 8FB20018 */  lw         $s2, 0x18($sp)
/* B915C 800B855C 8FB10014 */  lw         $s1, 0x14($sp)
/* B9160 800B8560 8FB00010 */  lw         $s0, 0x10($sp)
/* B9164 800B8564 03E00008 */  jr         $ra
/* B9168 800B8568 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B856C
/* B916C 800B856C 03E00008 */  jr         $ra
/* B9170 800B8570 24020001 */   addiu     $v0, $zero, 1
/* B9174 800B8574 00000000 */  nop
/* B9178 800B8578 00000000 */  nop
/* B917C 800B857C 00000000 */  nop
