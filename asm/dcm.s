.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel dcm_init
/* 9AD50 8009A150 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9AD54 8009A154 24040400 */  addiu      $a0, $zero, 0x400
/* 9AD58 8009A158 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9AD5C 8009A15C 3C13800E */  lui        $s3, %hi(D_800E2C00)
/* 9AD60 8009A160 AFB20018 */  sw         $s2, 0x18($sp)
/* 9AD64 8009A164 26722C00 */  addiu      $s2, $s3, %lo(D_800E2C00)
/* 9AD68 8009A168 02402821 */  addu       $a1, $s2, $zero
/* 9AD6C 8009A16C 240600A6 */  addiu      $a2, $zero, 0xa6
/* 9AD70 8009A170 AFB10014 */  sw         $s1, 0x14($sp)
/* 9AD74 8009A174 3C11800F */  lui        $s1, %hi(ALplayer_DCM)
/* 9AD78 8009A178 AFB00010 */  sw         $s0, 0x10($sp)
/* 9AD7C 8009A17C 26302D70 */  addiu      $s0, $s1, %lo(ALplayer_DCM)
/* 9AD80 8009A180 3C02800A */  lui        $v0, %hi(DCMVoiceHandler)
/* 9AD84 8009A184 2442A744 */  addiu      $v0, $v0, %lo(DCMVoiceHandler)
/* 9AD88 8009A188 AFBF0024 */  sw         $ra, 0x24($sp)
/* 9AD8C 8009A18C AFB40020 */  sw         $s4, 0x20($sp)
/* 9AD90 8009A190 AE202D70 */  sw         $zero, 0x2d70($s1)
/* 9AD94 8009A194 AE020008 */  sw         $v0, 8($s0)
/* 9AD98 8009A198 0C025F9C */  jal        Malloc
/* 9AD9C 8009A19C AE000004 */   sw        $zero, 4($s0)
/* 9ADA0 8009A1A0 00402021 */  addu       $a0, $v0, $zero
/* 9ADA4 8009A1A4 00002821 */  addu       $a1, $zero, $zero
/* 9ADA8 8009A1A8 24060400 */  addiu      $a2, $zero, 0x400
/* 9ADAC 8009A1AC 0C026380 */  jal        Calloc
/* 9ADB0 8009A1B0 AE020014 */   sw        $v0, 0x14($s0)
/* 9ADB4 8009A1B4 24040020 */  addiu      $a0, $zero, 0x20
/* 9ADB8 8009A1B8 02402821 */  addu       $a1, $s2, $zero
/* 9ADBC 8009A1BC 0C025F9C */  jal        Malloc
/* 9ADC0 8009A1C0 240600AA */   addiu     $a2, $zero, 0xaa
/* 9ADC4 8009A1C4 00009021 */  addu       $s2, $zero, $zero
/* 9ADC8 8009A1C8 0220A021 */  addu       $s4, $s1, $zero
/* 9ADCC 8009A1CC 02008821 */  addu       $s1, $s0, $zero
/* 9ADD0 8009A1D0 AE020018 */  sw         $v0, 0x18($s0)
/* 9ADD4 8009A1D4 24040200 */  addiu      $a0, $zero, 0x200
.L8009A1D8:
/* 9ADD8 8009A1D8 26652C00 */  addiu      $a1, $s3, 0x2c00
/* 9ADDC 8009A1DC 240600B2 */  addiu      $a2, $zero, 0xb2
/* 9ADE0 8009A1E0 8E300014 */  lw         $s0, 0x14($s1)
/* 9ADE4 8009A1E4 00121140 */  sll        $v0, $s2, 5
/* 9ADE8 8009A1E8 0C025F9C */  jal        Malloc
/* 9ADEC 8009A1EC 02028021 */   addu      $s0, $s0, $v0
/* 9ADF0 8009A1F0 00402021 */  addu       $a0, $v0, $zero
/* 9ADF4 8009A1F4 00002821 */  addu       $a1, $zero, $zero
/* 9ADF8 8009A1F8 24060200 */  addiu      $a2, $zero, 0x200
/* 9ADFC 8009A1FC 0C026380 */  jal        Calloc
/* 9AE00 8009A200 AE020000 */   sw        $v0, ($s0)
/* 9AE04 8009A204 A2000018 */  sb         $zero, 0x18($s0)
/* 9AE08 8009A208 8E220018 */  lw         $v0, 0x18($s1)
/* 9AE0C 8009A20C 26430001 */  addiu      $v1, $s2, 1
/* 9AE10 8009A210 00521021 */  addu       $v0, $v0, $s2
/* 9AE14 8009A214 A0520000 */  sb         $s2, ($v0)
/* 9AE18 8009A218 307200FF */  andi       $s2, $v1, 0xff
/* 9AE1C 8009A21C 2E420020 */  sltiu      $v0, $s2, 0x20
/* 9AE20 8009A220 1440FFED */  bnez       $v0, .L8009A1D8
/* 9AE24 8009A224 24040200 */   addiu     $a0, $zero, 0x200
/* 9AE28 8009A228 26842D70 */  addiu      $a0, $s4, 0x2d70
/* 9AE2C 8009A22C 0C026475 */  jal        addDCMPlayer
/* 9AE30 8009A230 A0800020 */   sb        $zero, 0x20($a0)
/* 9AE34 8009A234 8FBF0024 */  lw         $ra, 0x24($sp)
/* 9AE38 8009A238 8FB40020 */  lw         $s4, 0x20($sp)
/* 9AE3C 8009A23C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9AE40 8009A240 8FB20018 */  lw         $s2, 0x18($sp)
/* 9AE44 8009A244 8FB10014 */  lw         $s1, 0x14($sp)
/* 9AE48 8009A248 8FB00010 */  lw         $s0, 0x10($sp)
/* 9AE4C 8009A24C 03E00008 */  jr         $ra
/* 9AE50 8009A250 27BD0028 */   addiu     $sp, $sp, 0x28

glabel DCM_func
/* 9AE54 8009A254 00806821 */  addu       $t5, $a0, $zero
/* 9AE58 8009A258 3C03800F */  lui        $v1, %hi(ALplayer_DCM)
/* 9AE5C 8009A25C 24682D70 */  addiu      $t0, $v1, %lo(ALplayer_DCM)
/* 9AE60 8009A260 30E700FF */  andi       $a3, $a3, 0xff
/* 9AE64 8009A264 00607021 */  addu       $t6, $v1, $zero
/* 9AE68 8009A268 91020020 */  lbu        $v0, 0x20($t0)
/* 9AE6C 8009A26C 93A90013 */  lbu        $t1, 0x13($sp)
/* 9AE70 8009A270 93AA0017 */  lbu        $t2, 0x17($sp)
/* 9AE74 8009A274 2C420020 */  sltiu      $v0, $v0, 0x20
/* 9AE78 8009A278 1040002E */  beqz       $v0, .L8009A334
/* 9AE7C 8009A27C 93AB001F */   lbu       $t3, 0x1f($sp)
/* 9AE80 8009A280 91040020 */  lbu        $a0, 0x20($t0)
/* 9AE84 8009A284 8D020018 */  lw         $v0, 0x18($t0)
/* 9AE88 8009A288 8D03001C */  lw         $v1, 0x1c($t0)
/* 9AE8C 8009A28C 00441021 */  addu       $v0, $v0, $a0
/* 9AE90 8009A290 24840001 */  addiu      $a0, $a0, 1
/* 9AE94 8009A294 904C0000 */  lbu        $t4, ($v0)
/* 9AE98 8009A298 24630001 */  addiu      $v1, $v1, 1
/* 9AE9C 8009A29C AD03001C */  sw         $v1, 0x1c($t0)
/* 9AEA0 8009A2A0 24030013 */  addiu      $v1, $zero, 0x13
/* 9AEA4 8009A2A4 A1040020 */  sb         $a0, 0x20($t0)
/* 9AEA8 8009A2A8 8D040014 */  lw         $a0, 0x14($t0)
/* 9AEAC 8009A2AC 000C1140 */  sll        $v0, $t4, 5
/* 9AEB0 8009A2B0 00824021 */  addu       $t0, $a0, $v0
/* 9AEB4 8009A2B4 A1030019 */  sb         $v1, 0x19($t0)
/* 9AEB8 8009A2B8 A103001A */  sb         $v1, 0x1a($t0)
/* 9AEBC 8009A2BC 8FA20018 */  lw         $v0, 0x18($sp)
/* 9AEC0 8009A2C0 AD00000C */  sw         $zero, 0xc($t0)
/* 9AEC4 8009A2C4 AD000010 */  sw         $zero, 0x10($t0)
/* 9AEC8 8009A2C8 A107001B */  sb         $a3, 0x1b($t0)
/* 9AECC 8009A2CC A109001C */  sb         $t1, 0x1c($t0)
/* 9AED0 8009A2D0 A10A001D */  sb         $t2, 0x1d($t0)
/* 9AED4 8009A2D4 A10B001E */  sb         $t3, 0x1e($t0)
/* 9AED8 8009A2D8 AD020008 */  sw         $v0, 8($t0)
/* 9AEDC 8009A2DC 8CC90000 */  lw         $t1, ($a2)
/* 9AEE0 8009A2E0 00003821 */  addu       $a3, $zero, $zero
/* 9AEE4 8009A2E4 11200009 */  beqz       $t1, .L8009A30C
/* 9AEE8 8009A2E8 AD060004 */   sw        $a2, 4($t0)
.L8009A2EC:
/* 9AEEC 8009A2EC 00072100 */  sll        $a0, $a3, 4
/* 9AEF0 8009A2F0 24E30001 */  addiu      $v1, $a3, 1
/* 9AEF4 8009A2F4 306700FF */  andi       $a3, $v1, 0xff
/* 9AEF8 8009A2F8 8D020000 */  lw         $v0, ($t0)
/* 9AEFC 8009A2FC 00E9182B */  sltu       $v1, $a3, $t1
/* 9AF00 8009A300 00441021 */  addu       $v0, $v0, $a0
/* 9AF04 8009A304 1460FFF9 */  bnez       $v1, .L8009A2EC
/* 9AF08 8009A308 A040000E */   sb        $zero, 0xe($v0)
.L8009A30C:
/* 9AF0C 8009A30C 25C22D70 */  addiu      $v0, $t6, 0x2d70
/* 9AF10 8009A310 8C44001C */  lw         $a0, 0x1c($v0)
/* 9AF14 8009A314 24030002 */  addiu      $v1, $zero, 2
/* 9AF18 8009A318 A1030018 */  sb         $v1, 0x18($t0)
/* 9AF1C 8009A31C AD040014 */  sw         $a0, 0x14($t0)
/* 9AF20 8009A320 A1AC0000 */  sb         $t4, ($t5)
/* 9AF24 8009A324 8D020014 */  lw         $v0, 0x14($t0)
/* 9AF28 8009A328 24030001 */  addiu      $v1, $zero, 1
/* 9AF2C 8009A32C 080268D0 */  j          .L8009A340
/* 9AF30 8009A330 ACA20000 */   sw        $v0, ($a1)
.L8009A334:
/* 9AF34 8009A334 00001821 */  addu       $v1, $zero, $zero
/* 9AF38 8009A338 A1A00000 */  sb         $zero, ($t5)
/* 9AF3C 8009A33C ACA00000 */  sw         $zero, ($a1)
.L8009A340:
/* 9AF40 8009A340 03E00008 */  jr         $ra
/* 9AF44 8009A344 00601021 */   addu      $v0, $v1, $zero

glabel some_music_func
/* 9AF48 8009A348 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9AF4C 8009A34C 308400FF */  andi       $a0, $a0, 0xff
/* 9AF50 8009A350 3C02800F */  lui        $v0, %hi(DCMStructPointer)
/* 9AF54 8009A354 8C432D84 */  lw         $v1, %lo(DCMStructPointer)($v0)
/* 9AF58 8009A358 00042140 */  sll        $a0, $a0, 5
/* 9AF5C 8009A35C AFBF001C */  sw         $ra, 0x1c($sp)
/* 9AF60 8009A360 AFB20018 */  sw         $s2, 0x18($sp)
/* 9AF64 8009A364 AFB10014 */  sw         $s1, 0x14($sp)
/* 9AF68 8009A368 AFB00010 */  sw         $s0, 0x10($sp)
/* 9AF6C 8009A36C 00648821 */  addu       $s1, $v1, $a0
/* 9AF70 8009A370 92240018 */  lbu        $a0, 0x18($s1)
/* 9AF74 8009A374 24020002 */  addiu      $v0, $zero, 2
/* 9AF78 8009A378 1482001C */  bne        $a0, $v0, .L8009A3EC
/* 9AF7C 8009A37C 30C600FF */   andi      $a2, $a2, 0xff
/* 9AF80 8009A380 8E220014 */  lw         $v0, 0x14($s1)
/* 9AF84 8009A384 1445001A */  bne        $v0, $a1, .L8009A3F0
/* 9AF88 8009A388 00001021 */   addu      $v0, $zero, $zero
/* 9AF8C 8009A38C 8E220004 */  lw         $v0, 4($s1)
/* 9AF90 8009A390 A226001B */  sb         $a2, 0x1b($s1)
/* 9AF94 8009A394 8C520000 */  lw         $s2, ($v0)
/* 9AF98 8009A398 12400012 */  beqz       $s2, .L8009A3E4
/* 9AF9C 8009A39C 00008021 */   addu      $s0, $zero, $zero
/* 9AFA0 8009A3A0 8E230000 */  lw         $v1, ($s1)
.L8009A3A4:
/* 9AFA4 8009A3A4 00101100 */  sll        $v0, $s0, 4
/* 9AFA8 8009A3A8 00621821 */  addu       $v1, $v1, $v0
/* 9AFAC 8009A3AC 9066000C */  lbu        $a2, 0xc($v1)
/* 9AFB0 8009A3B0 9222001B */  lbu        $v0, 0x1b($s1)
/* 9AFB4 8009A3B4 00C20018 */  mult       $a2, $v0
/* 9AFB8 8009A3B8 9064000A */  lbu        $a0, 0xa($v1)
/* 9AFBC 8009A3BC 8C650000 */  lw         $a1, ($v1)
/* 9AFC0 8009A3C0 00003012 */  mflo       $a2
/* 9AFC4 8009A3C4 00063103 */  sra        $a2, $a2, 4
/* 9AFC8 8009A3C8 0C026514 */  jal        func_80099450
/* 9AFCC 8009A3CC 30C600FF */   andi      $a2, $a2, 0xff
/* 9AFD0 8009A3D0 26030001 */  addiu      $v1, $s0, 1
/* 9AFD4 8009A3D4 307000FF */  andi       $s0, $v1, 0xff
/* 9AFD8 8009A3D8 0212102B */  sltu       $v0, $s0, $s2
/* 9AFDC 8009A3DC 5440FFF1 */  bnel       $v0, $zero, .L8009A3A4
/* 9AFE0 8009A3E0 8E230000 */   lw        $v1, ($s1)
.L8009A3E4:
/* 9AFE4 8009A3E4 080268FC */  j          .L8009A3F0
/* 9AFE8 8009A3E8 24020001 */   addiu     $v0, $zero, 1
.L8009A3EC:
/* 9AFEC 8009A3EC 00001021 */  addu       $v0, $zero, $zero
.L8009A3F0:
/* 9AFF0 8009A3F0 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9AFF4 8009A3F4 8FB20018 */  lw         $s2, 0x18($sp)
/* 9AFF8 8009A3F8 8FB10014 */  lw         $s1, 0x14($sp)
/* 9AFFC 8009A3FC 8FB00010 */  lw         $s0, 0x10($sp)
/* 9B000 8009A400 03E00008 */  jr         $ra
/* 9B004 8009A404 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009A408
/* 9B008 8009A408 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9B00C 8009A40C 308400FF */  andi       $a0, $a0, 0xff
/* 9B010 8009A410 3C02800F */  lui        $v0, %hi(DCMStructPointer)
/* 9B014 8009A414 8C432D84 */  lw         $v1, %lo(DCMStructPointer)($v0)
/* 9B018 8009A418 00042140 */  sll        $a0, $a0, 5
/* 9B01C 8009A41C AFBF002C */  sw         $ra, 0x2c($sp)
/* 9B020 8009A420 AFB60028 */  sw         $s6, 0x28($sp)
/* 9B024 8009A424 AFB50024 */  sw         $s5, 0x24($sp)
/* 9B028 8009A428 AFB40020 */  sw         $s4, 0x20($sp)
/* 9B02C 8009A42C AFB3001C */  sw         $s3, 0x1c($sp)
/* 9B030 8009A430 AFB20018 */  sw         $s2, 0x18($sp)
/* 9B034 8009A434 AFB10014 */  sw         $s1, 0x14($sp)
/* 9B038 8009A438 AFB00010 */  sw         $s0, 0x10($sp)
/* 9B03C 8009A43C 00648821 */  addu       $s1, $v1, $a0
/* 9B040 8009A440 92240018 */  lbu        $a0, 0x18($s1)
/* 9B044 8009A444 24020002 */  addiu      $v0, $zero, 2
/* 9B048 8009A448 1482002D */  bne        $a0, $v0, .L8009A500
/* 9B04C 8009A44C 30C600FF */   andi      $a2, $a2, 0xff
/* 9B050 8009A450 8E220014 */  lw         $v0, 0x14($s1)
/* 9B054 8009A454 1445002B */  bne        $v0, $a1, .L8009A504
/* 9B058 8009A458 00001021 */   addu      $v0, $zero, $zero
/* 9B05C 8009A45C 00008021 */  addu       $s0, $zero, $zero
/* 9B060 8009A460 24C5FF80 */  addiu      $a1, $a2, -0x80
/* 9B064 8009A464 00051040 */  sll        $v0, $a1, 1
/* 9B068 8009A468 04420001 */  bltzl      $v0, .L8009A470
/* 9B06C 8009A46C 00021023 */   negu      $v0, $v0
.L8009A470:
/* 9B070 8009A470 240300FF */  addiu      $v1, $zero, 0xff
/* 9B074 8009A474 00621823 */  subu       $v1, $v1, $v0
/* 9B078 8009A478 8E240004 */  lw         $a0, 4($s1)
/* 9B07C 8009A47C 00031400 */  sll        $v0, $v1, 0x10
/* 9B080 8009A480 A226001C */  sb         $a2, 0x1c($s1)
/* 9B084 8009A484 8C920000 */  lw         $s2, ($a0)
/* 9B088 8009A488 1240001B */  beqz       $s2, .L8009A4F8
/* 9B08C 8009A48C 0002B403 */   sra       $s6, $v0, 0x10
/* 9B090 8009A490 00A0A821 */  addu       $s5, $a1, $zero
/* 9B094 8009A494 00021443 */  sra        $v0, $v0, 0x11
/* 9B098 8009A498 00C2A021 */  addu       $s4, $a2, $v0
/* 9B09C 8009A49C 00C29823 */  subu       $s3, $a2, $v0
/* 9B0A0 8009A4A0 8E240000 */  lw         $a0, ($s1)
.L8009A4A4:
/* 9B0A4 8009A4A4 00101900 */  sll        $v1, $s0, 4
/* 9B0A8 8009A4A8 00832821 */  addu       $a1, $a0, $v1
/* 9B0AC 8009A4AC 90A2000D */  lbu        $v0, 0xd($a1)
/* 9B0B0 8009A4B0 00560018 */  mult       $v0, $s6
/* 9B0B4 8009A4B4 00001012 */  mflo       $v0
/* 9B0B8 8009A4B8 06A10003 */  bgez       $s5, .L8009A4C8
/* 9B0BC 8009A4BC 00021203 */   sra       $v0, $v0, 8
/* 9B0C0 8009A4C0 08026933 */  j          .L8009A4CC
/* 9B0C4 8009A4C4 02821023 */   subu      $v0, $s4, $v0
.L8009A4C8:
/* 9B0C8 8009A4C8 00531021 */  addu       $v0, $v0, $s3
.L8009A4CC:
/* 9B0CC 8009A4CC 00021400 */  sll        $v0, $v0, 0x10
/* 9B0D0 8009A4D0 00021403 */  sra        $v0, $v0, 0x10
/* 9B0D4 8009A4D4 90A4000A */  lbu        $a0, 0xa($a1)
/* 9B0D8 8009A4D8 8CA50000 */  lw         $a1, ($a1)
/* 9B0DC 8009A4DC 0C026530 */  jal        func_800994C0
/* 9B0E0 8009A4E0 304600FF */   andi      $a2, $v0, 0xff
/* 9B0E4 8009A4E4 26030001 */  addiu      $v1, $s0, 1
/* 9B0E8 8009A4E8 307000FF */  andi       $s0, $v1, 0xff
/* 9B0EC 8009A4EC 0212102B */  sltu       $v0, $s0, $s2
/* 9B0F0 8009A4F0 5440FFEC */  bnel       $v0, $zero, .L8009A4A4
/* 9B0F4 8009A4F4 8E240000 */   lw        $a0, ($s1)
.L8009A4F8:
/* 9B0F8 8009A4F8 08026941 */  j          .L8009A504
/* 9B0FC 8009A4FC 24020001 */   addiu     $v0, $zero, 1
.L8009A500:
/* 9B100 8009A500 00001021 */  addu       $v0, $zero, $zero
.L8009A504:
/* 9B104 8009A504 8FBF002C */  lw         $ra, 0x2c($sp)
/* 9B108 8009A508 8FB60028 */  lw         $s6, 0x28($sp)
/* 9B10C 8009A50C 8FB50024 */  lw         $s5, 0x24($sp)
/* 9B110 8009A510 8FB40020 */  lw         $s4, 0x20($sp)
/* 9B114 8009A514 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9B118 8009A518 8FB20018 */  lw         $s2, 0x18($sp)
/* 9B11C 8009A51C 8FB10014 */  lw         $s1, 0x14($sp)
/* 9B120 8009A520 8FB00010 */  lw         $s0, 0x10($sp)
/* 9B124 8009A524 03E00008 */  jr         $ra
/* 9B128 8009A528 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_8009A52C
/* 9B12C 8009A52C 308400FF */  andi       $a0, $a0, 0xff
/* 9B130 8009A530 3C02800F */  lui        $v0, %hi(DCMStructPointer)
/* 9B134 8009A534 8C432D84 */  lw         $v1, %lo(DCMStructPointer)($v0)
/* 9B138 8009A538 00042140 */  sll        $a0, $a0, 5
/* 9B13C 8009A53C 00641821 */  addu       $v1, $v1, $a0
/* 9B140 8009A540 90640018 */  lbu        $a0, 0x18($v1)
/* 9B144 8009A544 24020002 */  addiu      $v0, $zero, 2
/* 9B148 8009A548 14820007 */  bne        $a0, $v0, .L8009A568
/* 9B14C 8009A54C 00000000 */   nop
/* 9B150 8009A550 8C620014 */  lw         $v0, 0x14($v1)
/* 9B154 8009A554 14450004 */  bne        $v0, $a1, .L8009A568
/* 9B158 8009A558 24020001 */   addiu     $v0, $zero, 1
/* 9B15C 8009A55C AC660008 */  sw         $a2, 8($v1)
/* 9B160 8009A560 03E00008 */  jr         $ra
/* 9B164 8009A564 AC60000C */   sw        $zero, 0xc($v1)
.L8009A568:
/* 9B168 8009A568 03E00008 */  jr         $ra
/* 9B16C 8009A56C 00001021 */   addu      $v0, $zero, $zero

glabel func_8009A570
/* 9B170 8009A570 308400FF */  andi       $a0, $a0, 0xff
/* 9B174 8009A574 3C02800F */  lui        $v0, %hi(DCMStructPointer)
/* 9B178 8009A578 8C432D84 */  lw         $v1, %lo(DCMStructPointer)($v0)
/* 9B17C 8009A57C 00042140 */  sll        $a0, $a0, 5
/* 9B180 8009A580 00641821 */  addu       $v1, $v1, $a0
/* 9B184 8009A584 8C620014 */  lw         $v0, 0x14($v1)
/* 9B188 8009A588 14A20002 */  bne        $a1, $v0, .L8009A594
/* 9B18C 8009A58C 00002021 */   addu      $a0, $zero, $zero
/* 9B190 8009A590 8C64000C */  lw         $a0, 0xc($v1)
.L8009A594:
/* 9B194 8009A594 03E00008 */  jr         $ra
/* 9B198 8009A598 00801021 */   addu      $v0, $a0, $zero

glabel DCM_search
/* 9B19C 8009A59C 308400FF */  andi       $a0, $a0, 0xff
/* 9B1A0 8009A5A0 3C02800F */  lui        $v0, %hi(DCMStructPointer)
/* 9B1A4 8009A5A4 8C432D84 */  lw         $v1, %lo(DCMStructPointer)($v0)
/* 9B1A8 8009A5A8 00042140 */  sll        $a0, $a0, 5
/* 9B1AC 8009A5AC 00641821 */  addu       $v1, $v1, $a0
/* 9B1B0 8009A5B0 8C620014 */  lw         $v0, 0x14($v1)
/* 9B1B4 8009A5B4 14A20002 */  bne        $a1, $v0, .L8009A5C0
/* 9B1B8 8009A5B8 00002021 */   addu      $a0, $zero, $zero
/* 9B1BC 8009A5BC 90640018 */  lbu        $a0, 0x18($v1)
.L8009A5C0:
/* 9B1C0 8009A5C0 03E00008 */  jr         $ra
/* 9B1C4 8009A5C4 00801021 */   addu      $v0, $a0, $zero

glabel dcm_remove_func
/* 9B1C8 8009A5C8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9B1CC 8009A5CC 308700FF */  andi       $a3, $a0, 0xff
/* 9B1D0 8009A5D0 3C02800F */  lui        $v0, %hi(ALplayer_DCM)
/* 9B1D4 8009A5D4 24462D70 */  addiu      $a2, $v0, %lo(ALplayer_DCM)
/* 9B1D8 8009A5D8 AFBF001C */  sw         $ra, 0x1c($sp)
/* 9B1DC 8009A5DC AFB20018 */  sw         $s2, 0x18($sp)
/* 9B1E0 8009A5E0 AFB10014 */  sw         $s1, 0x14($sp)
/* 9B1E4 8009A5E4 AFB00010 */  sw         $s0, 0x10($sp)
/* 9B1E8 8009A5E8 8CC30014 */  lw         $v1, 0x14($a2)
/* 9B1EC 8009A5EC 00071140 */  sll        $v0, $a3, 5
/* 9B1F0 8009A5F0 00629021 */  addu       $s2, $v1, $v0
/* 9B1F4 8009A5F4 92440018 */  lbu        $a0, 0x18($s2)
/* 9B1F8 8009A5F8 24020002 */  addiu      $v0, $zero, 2
/* 9B1FC 8009A5FC 1482001C */  bne        $a0, $v0, .L8009A670
/* 9B200 8009A600 00001021 */   addu      $v0, $zero, $zero
/* 9B204 8009A604 8E420014 */  lw         $v0, 0x14($s2)
/* 9B208 8009A608 14450019 */  bne        $v0, $a1, .L8009A670
/* 9B20C 8009A60C 00001021 */   addu      $v0, $zero, $zero
/* 9B210 8009A610 90C20020 */  lbu        $v0, 0x20($a2)
/* 9B214 8009A614 2442FFFF */  addiu      $v0, $v0, -1
/* 9B218 8009A618 A0C20020 */  sb         $v0, 0x20($a2)
/* 9B21C 8009A61C 304300FF */  andi       $v1, $v0, 0xff
/* 9B220 8009A620 8CC20018 */  lw         $v0, 0x18($a2)
/* 9B224 8009A624 00431021 */  addu       $v0, $v0, $v1
/* 9B228 8009A628 A0470000 */  sb         $a3, ($v0)
/* 9B22C 8009A62C 8E430004 */  lw         $v1, 4($s2)
/* 9B230 8009A630 A2400018 */  sb         $zero, 0x18($s2)
/* 9B234 8009A634 8C710000 */  lw         $s1, ($v1)
/* 9B238 8009A638 1220000C */  beqz       $s1, .L8009A66C
/* 9B23C 8009A63C 00008021 */   addu      $s0, $zero, $zero
/* 9B240 8009A640 8E430000 */  lw         $v1, ($s2)
.L8009A644:
/* 9B244 8009A644 00101100 */  sll        $v0, $s0, 4
/* 9B248 8009A648 00621821 */  addu       $v1, $v1, $v0
/* 9B24C 8009A64C 9064000A */  lbu        $a0, 0xa($v1)
/* 9B250 8009A650 0C02654C */  jal        func_80099530
/* 9B254 8009A654 8C650000 */   lw        $a1, ($v1)
/* 9B258 8009A658 26030001 */  addiu      $v1, $s0, 1
/* 9B25C 8009A65C 307000FF */  andi       $s0, $v1, 0xff
/* 9B260 8009A660 0211102B */  sltu       $v0, $s0, $s1
/* 9B264 8009A664 5440FFF7 */  bnel       $v0, $zero, .L8009A644
/* 9B268 8009A668 8E430000 */   lw        $v1, ($s2)
.L8009A66C:
/* 9B26C 8009A66C 24020001 */  addiu      $v0, $zero, 1
.L8009A670:
/* 9B270 8009A670 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9B274 8009A674 8FB20018 */  lw         $s2, 0x18($sp)
/* 9B278 8009A678 8FB10014 */  lw         $s1, 0x14($sp)
/* 9B27C 8009A67C 8FB00010 */  lw         $s0, 0x10($sp)
/* 9B280 8009A680 03E00008 */  jr         $ra
/* 9B284 8009A684 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009A688
/* 9B288 8009A688 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9B28C 8009A68C 00002821 */  addu       $a1, $zero, $zero
/* 9B290 8009A690 3C02800F */  lui        $v0, %hi(ALplayer_DCM)
/* 9B294 8009A694 AFB50024 */  sw         $s5, 0x24($sp)
/* 9B298 8009A698 24552D70 */  addiu      $s5, $v0, %lo(ALplayer_DCM)
/* 9B29C 8009A69C AFB40020 */  sw         $s4, 0x20($sp)
/* 9B2A0 8009A6A0 24140002 */  addiu      $s4, $zero, 2
/* 9B2A4 8009A6A4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 9B2A8 8009A6A8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9B2AC 8009A6AC AFB20018 */  sw         $s2, 0x18($sp)
/* 9B2B0 8009A6B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 9B2B4 8009A6B4 AFB00010 */  sw         $s0, 0x10($sp)
/* 9B2B8 8009A6B8 8EA20014 */  lw         $v0, 0x14($s5)
.L8009A6BC:
/* 9B2BC 8009A6BC 00051940 */  sll        $v1, $a1, 5
/* 9B2C0 8009A6C0 00438821 */  addu       $s1, $v0, $v1
/* 9B2C4 8009A6C4 92240018 */  lbu        $a0, 0x18($s1)
/* 9B2C8 8009A6C8 14940011 */  bne        $a0, $s4, .L8009A710
/* 9B2CC 8009A6CC 24B30001 */   addiu     $s3, $a1, 1
/* 9B2D0 8009A6D0 8E220004 */  lw         $v0, 4($s1)
/* 9B2D4 8009A6D4 A2200018 */  sb         $zero, 0x18($s1)
/* 9B2D8 8009A6D8 8C520000 */  lw         $s2, ($v0)
/* 9B2DC 8009A6DC 1240000C */  beqz       $s2, .L8009A710
/* 9B2E0 8009A6E0 00008021 */   addu      $s0, $zero, $zero
/* 9B2E4 8009A6E4 8E230000 */  lw         $v1, ($s1)
.L8009A6E8:
/* 9B2E8 8009A6E8 00101100 */  sll        $v0, $s0, 4
/* 9B2EC 8009A6EC 00621821 */  addu       $v1, $v1, $v0
/* 9B2F0 8009A6F0 9064000A */  lbu        $a0, 0xa($v1)
/* 9B2F4 8009A6F4 0C02654C */  jal        func_80099530
/* 9B2F8 8009A6F8 8C650000 */   lw        $a1, ($v1)
/* 9B2FC 8009A6FC 26030001 */  addiu      $v1, $s0, 1
/* 9B300 8009A700 307000FF */  andi       $s0, $v1, 0xff
/* 9B304 8009A704 0212102B */  sltu       $v0, $s0, $s2
/* 9B308 8009A708 5440FFF7 */  bnel       $v0, $zero, .L8009A6E8
/* 9B30C 8009A70C 8E230000 */   lw        $v1, ($s1)
.L8009A710:
/* 9B310 8009A710 326500FF */  andi       $a1, $s3, 0xff
/* 9B314 8009A714 2CA20020 */  sltiu      $v0, $a1, 0x20
/* 9B318 8009A718 5440FFE8 */  bnel       $v0, $zero, .L8009A6BC
/* 9B31C 8009A71C 8EA20014 */   lw        $v0, 0x14($s5)
/* 9B320 8009A720 8FBF0028 */  lw         $ra, 0x28($sp)
/* 9B324 8009A724 8FB50024 */  lw         $s5, 0x24($sp)
/* 9B328 8009A728 8FB40020 */  lw         $s4, 0x20($sp)
/* 9B32C 8009A72C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9B330 8009A730 8FB20018 */  lw         $s2, 0x18($sp)
/* 9B334 8009A734 8FB10014 */  lw         $s1, 0x14($sp)
/* 9B338 8009A738 8FB00010 */  lw         $s0, 0x10($sp)
/* 9B33C 8009A73C 03E00008 */  jr         $ra
/* 9B340 8009A740 27BD0030 */   addiu     $sp, $sp, 0x30

glabel DCMVoiceHandler
/* 9B344 8009A744 27BDFF68 */  addiu      $sp, $sp, -0x98
/* 9B348 8009A748 3C03800E */  lui        $v1, %hi(D_800E2C10)
/* 9B34C 8009A74C 8C642C10 */  lw         $a0, %lo(D_800E2C10)($v1)
/* 9B350 8009A750 24622C10 */  addiu      $v0, $v1, 0x2c10
/* 9B354 8009A754 AFBF0094 */  sw         $ra, 0x94($sp)
/* 9B358 8009A758 AFBE0090 */  sw         $fp, 0x90($sp)
/* 9B35C 8009A75C AFB7008C */  sw         $s7, 0x8c($sp)
/* 9B360 8009A760 AFB60088 */  sw         $s6, 0x88($sp)
/* 9B364 8009A764 AFB50084 */  sw         $s5, 0x84($sp)
/* 9B368 8009A768 AFB40080 */  sw         $s4, 0x80($sp)
/* 9B36C 8009A76C AFB3007C */  sw         $s3, 0x7c($sp)
/* 9B370 8009A770 AFB20078 */  sw         $s2, 0x78($sp)
/* 9B374 8009A774 AFB10074 */  sw         $s1, 0x74($sp)
/* 9B378 8009A778 AFB00070 */  sw         $s0, 0x70($sp)
/* 9B37C 8009A77C 8C450004 */  lw         $a1, 4($v0)
/* 9B380 8009A780 8C430008 */  lw         $v1, 8($v0)
/* 9B384 8009A784 8C46000C */  lw         $a2, 0xc($v0)
/* 9B388 8009A788 0000B021 */  addu       $s6, $zero, $zero
/* 9B38C 8009A78C AFA40030 */  sw         $a0, 0x30($sp)
/* 9B390 8009A790 AFA50034 */  sw         $a1, 0x34($sp)
/* 9B394 8009A794 AFA30038 */  sw         $v1, 0x38($sp)
/* 9B398 8009A798 AFA6003C */  sw         $a2, 0x3c($sp)
/* 9B39C 8009A79C 3C03800F */  lui        $v1, %hi(ALplayer_DCM)
.L8009A7A0:
/* 9B3A0 8009A7A0 24622D70 */  addiu      $v0, $v1, %lo(ALplayer_DCM)
/* 9B3A4 8009A7A4 8C440014 */  lw         $a0, 0x14($v0)
/* 9B3A8 8009A7A8 00161940 */  sll        $v1, $s6, 5
/* 9B3AC 8009A7AC 00838021 */  addu       $s0, $a0, $v1
/* 9B3B0 8009A7B0 92050018 */  lbu        $a1, 0x18($s0)
/* 9B3B4 8009A7B4 24020002 */  addiu      $v0, $zero, 2
/* 9B3B8 8009A7B8 14A20144 */  bne        $a1, $v0, .L8009ACCC
/* 9B3BC 8009A7BC 26D70001 */   addiu     $s7, $s6, 1
/* 9B3C0 8009A7C0 8E030008 */  lw         $v1, 8($s0)
/* 9B3C4 8009A7C4 0462000A */  bltzl      $v1, .L8009A7F0
/* 9B3C8 8009A7C8 9203001A */   lbu       $v1, 0x1a($s0)
/* 9B3CC 8009A7CC 8E02000C */  lw         $v0, 0xc($s0)
/* 9B3D0 8009A7D0 0043102A */  slt        $v0, $v0, $v1
/* 9B3D4 8009A7D4 54400006 */  bnel       $v0, $zero, .L8009A7F0
/* 9B3D8 8009A7D8 9203001A */   lbu       $v1, 0x1a($s0)
/* 9B3DC 8009A7DC 8E050014 */  lw         $a1, 0x14($s0)
/* 9B3E0 8009A7E0 0C026972 */  jal        dcm_remove_func
/* 9B3E4 8009A7E4 02C02021 */   addu      $a0, $s6, $zero
/* 9B3E8 8009A7E8 08026B31 */  j          .L8009ACC4
/* 9B3EC 8009A7EC 8E02000C */   lw        $v0, 0xc($s0)
.L8009A7F0:
/* 9B3F0 8009A7F0 92020019 */  lbu        $v0, 0x19($s0)
/* 9B3F4 8009A7F4 0062102B */  sltu       $v0, $v1, $v0
/* 9B3F8 8009A7F8 1440012F */  bnez       $v0, .L8009ACB8
/* 9B3FC 8009A7FC 24620001 */   addiu     $v0, $v1, 1
/* 9B400 8009A800 8E130004 */  lw         $s3, 4($s0)
/* 9B404 8009A804 0000A021 */  addu       $s4, $zero, $zero
/* 9B408 8009A808 927E0003 */  lbu        $fp, 3($s3)
/* 9B40C 8009A80C 13C0010A */  beqz       $fp, .L8009AC38
/* 9B410 8009A810 26D70001 */   addiu     $s7, $s6, 1
/* 9B414 8009A814 8E030000 */  lw         $v1, ($s0)
.L8009A818:
/* 9B418 8009A818 00141100 */  sll        $v0, $s4, 4
/* 9B41C 8009A81C 00628821 */  addu       $s1, $v1, $v0
/* 9B420 8009A820 9222000E */  lbu        $v0, 0xe($s1)
/* 9B424 8009A824 10400003 */  beqz       $v0, .L8009A834
/* 9B428 8009A828 2442FFFF */   addiu     $v0, $v0, -1
/* 9B42C 8009A82C 08026B09 */  j          .L8009AC24
/* 9B430 8009A830 A222000E */   sb        $v0, 0xe($s1)
.L8009A834:
/* 9B434 8009A834 8E620014 */  lw         $v0, 0x14($s3)
/* 9B438 8009A838 8E040010 */  lw         $a0, 0x10($s0)
/* 9B43C 8009A83C 0C026B44 */  jal        func_8009AD10
/* 9B440 8009A840 00442021 */   addu      $a0, $v0, $a0
/* 9B444 8009A844 00409021 */  addu       $s2, $v0, $zero
/* 9B448 8009A848 8E030010 */  lw         $v1, 0x10($s0)
/* 9B44C 8009A84C 32420080 */  andi       $v0, $s2, 0x80
/* 9B450 8009A850 24630001 */  addiu      $v1, $v1, 1
/* 9B454 8009A854 10400005 */  beqz       $v0, .L8009A86C
/* 9B458 8009A858 AE030010 */   sw        $v1, 0x10($s0)
/* 9B45C 8009A85C 3242007F */  andi       $v0, $s2, 0x7f
/* 9B460 8009A860 24420001 */  addiu      $v0, $v0, 1
/* 9B464 8009A864 08026B09 */  j          .L8009AC24
/* 9B468 8009A868 A222000E */   sb        $v0, 0xe($s1)
.L8009A86C:
/* 9B46C 8009A86C 32420040 */  andi       $v0, $s2, 0x40
/* 9B470 8009A870 10400018 */  beqz       $v0, .L8009A8D4
/* 9B474 8009A874 32550002 */   andi      $s5, $s2, 2
/* 9B478 8009A878 8E640014 */  lw         $a0, 0x14($s3)
/* 9B47C 8009A87C 0C026B46 */  jal        func_8009AD18
/* 9B480 8009A880 00832021 */   addu      $a0, $a0, $v1
/* 9B484 8009A884 30433FFF */  andi       $v1, $v0, 0x3fff
/* 9B488 8009A888 3042FFFF */  andi       $v0, $v0, 0xffff
/* 9B48C 8009A88C 00021382 */  srl        $v0, $v0, 0xe
/* 9B490 8009A890 00022880 */  sll        $a1, $v0, 2
/* 9B494 8009A894 A6230008 */  sh         $v1, 8($s1)
/* 9B498 8009A898 27A30030 */  addiu      $v1, $sp, 0x30
/* 9B49C 8009A89C 8E040010 */  lw         $a0, 0x10($s0)
/* 9B4A0 8009A8A0 00651821 */  addu       $v1, $v1, $a1
/* 9B4A4 8009A8A4 24840002 */  addiu      $a0, $a0, 2
/* 9B4A8 8009A8A8 AE040010 */  sw         $a0, 0x10($s0)
/* 9B4AC 8009A8AC 96240008 */  lhu        $a0, 8($s1)
/* 9B4B0 8009A8B0 94650002 */  lhu        $a1, 2($v1)
/* 9B4B4 8009A8B4 00442004 */  sllv       $a0, $a0, $v0
/* 9B4B8 8009A8B8 00A42821 */  addu       $a1, $a1, $a0
/* 9B4BC 8009A8BC 16A00005 */  bnez       $s5, .L8009A8D4
/* 9B4C0 8009A8C0 A6250008 */   sh        $a1, 8($s1)
/* 9B4C4 8009A8C4 9224000A */  lbu        $a0, 0xa($s1)
/* 9B4C8 8009A8C8 8E250000 */  lw         $a1, ($s1)
/* 9B4CC 8009A8CC 0C0264FA */  jal        func_800993E8
/* 9B4D0 8009A8D0 96260008 */   lhu       $a2, 8($s1)
.L8009A8D4:
/* 9B4D4 8009A8D4 32420020 */  andi       $v0, $s2, 0x20
/* 9B4D8 8009A8D8 10400029 */  beqz       $v0, .L8009A980
/* 9B4DC 8009A8DC 32420010 */   andi      $v0, $s2, 0x10
/* 9B4E0 8009A8E0 8E620014 */  lw         $v0, 0x14($s3)
/* 9B4E4 8009A8E4 8E040010 */  lw         $a0, 0x10($s0)
/* 9B4E8 8009A8E8 0C026B44 */  jal        func_8009AD10
/* 9B4EC 8009A8EC 00442021 */   addu      $a0, $v0, $a0
/* 9B4F0 8009A8F0 A222000C */  sb         $v0, 0xc($s1)
/* 9B4F4 8009A8F4 8E020010 */  lw         $v0, 0x10($s0)
/* 9B4F8 8009A8F8 24420001 */  addiu      $v0, $v0, 1
/* 9B4FC 8009A8FC AE020010 */  sw         $v0, 0x10($s0)
/* 9B500 8009A900 9223000C */  lbu        $v1, 0xc($s1)
/* 9B504 8009A904 44836000 */  mtc1       $v1, $f12
/* 9B508 8009A908 46806320 */  cvt.s.w    $f12, $f12
/* 9B50C 8009A90C 0C0334B4 */  jal        _sqrtf
/* 9B510 8009A910 00000000 */   nop
/* 9B514 8009A914 3C01800E */  lui        $at, %hi(D_800E2C20)
/* 9B518 8009A918 C4222C20 */  lwc1       $f2, %lo(D_800E2C20)($at)
/* 9B51C 8009A91C 4600103E */  c.le.s     $f2, $f0
/* 9B520 8009A920 00000000 */  nop
/* 9B524 8009A924 45030005 */  bc1tl      .L8009A93C
/* 9B528 8009A928 46020001 */   sub.s     $f0, $f0, $f2
/* 9B52C 8009A92C 4600008D */  trunc.w.s  $f2, $f0
/* 9B530 8009A930 44031000 */  mfc1       $v1, $f2
/* 9B534 8009A934 08026A54 */  j          .L8009A950
/* 9B538 8009A938 A223000C */   sb        $v1, 0xc($s1)
.L8009A93C:
/* 9B53C 8009A93C 4600008D */  trunc.w.s  $f2, $f0
/* 9B540 8009A940 44031000 */  mfc1       $v1, $f2
/* 9B544 8009A944 3C028000 */  lui        $v0, 0x8000
/* 9B548 8009A948 00621825 */  or         $v1, $v1, $v0
/* 9B54C 8009A94C A223000C */  sb         $v1, 0xc($s1)
.L8009A950:
/* 9B550 8009A950 306200FF */  andi       $v0, $v1, 0xff
/* 9B554 8009A954 9203001B */  lbu        $v1, 0x1b($s0)
/* 9B558 8009A958 00430018 */  mult       $v0, $v1
/* 9B55C 8009A95C 00001012 */  mflo       $v0
/* 9B560 8009A960 00021103 */  sra        $v0, $v0, 4
/* 9B564 8009A964 16A00005 */  bnez       $s5, .L8009A97C
/* 9B568 8009A968 304900FF */   andi      $t1, $v0, 0xff
/* 9B56C 8009A96C 9224000A */  lbu        $a0, 0xa($s1)
/* 9B570 8009A970 8E250000 */  lw         $a1, ($s1)
/* 9B574 8009A974 0C026514 */  jal        func_80099450
/* 9B578 8009A978 01203021 */   addu      $a2, $t1, $zero
.L8009A97C:
/* 9B57C 8009A97C 32420010 */  andi       $v0, $s2, 0x10
.L8009A980:
/* 9B580 8009A980 10400026 */  beqz       $v0, .L8009AA1C
/* 9B584 8009A984 32420008 */   andi      $v0, $s2, 8
/* 9B588 8009A988 8E620014 */  lw         $v0, 0x14($s3)
/* 9B58C 8009A98C 8E040010 */  lw         $a0, 0x10($s0)
/* 9B590 8009A990 0C026B44 */  jal        func_8009AD10
/* 9B594 8009A994 00442021 */   addu      $a0, $v0, $a0
/* 9B598 8009A998 A222000D */  sb         $v0, 0xd($s1)
/* 9B59C 8009A99C 8E020010 */  lw         $v0, 0x10($s0)
/* 9B5A0 8009A9A0 9208001C */  lbu        $t0, 0x1c($s0)
/* 9B5A4 8009A9A4 24420001 */  addiu      $v0, $v0, 1
/* 9B5A8 8009A9A8 2504FF80 */  addiu      $a0, $t0, -0x80
/* 9B5AC 8009A9AC 00041840 */  sll        $v1, $a0, 1
/* 9B5B0 8009A9B0 04620001 */  bltzl      $v1, .L8009A9B8
/* 9B5B4 8009A9B4 00031823 */   negu      $v1, $v1
.L8009A9B8:
/* 9B5B8 8009A9B8 AE020010 */  sw         $v0, 0x10($s0)
/* 9B5BC 8009A9BC 240200FF */  addiu      $v0, $zero, 0xff
/* 9B5C0 8009A9C0 00431023 */  subu       $v0, $v0, $v1
/* 9B5C4 8009A9C4 00021C00 */  sll        $v1, $v0, 0x10
/* 9B5C8 8009A9C8 9227000D */  lbu        $a3, 0xd($s1)
/* 9B5CC 8009A9CC 00031403 */  sra        $v0, $v1, 0x10
/* 9B5D0 8009A9D0 00E20018 */  mult       $a3, $v0
/* 9B5D4 8009A9D4 00001012 */  mflo       $v0
/* 9B5D8 8009A9D8 04810005 */  bgez       $a0, .L8009A9F0
/* 9B5DC 8009A9DC 00023A03 */   sra       $a3, $v0, 8
/* 9B5E0 8009A9E0 00031443 */  sra        $v0, $v1, 0x11
/* 9B5E4 8009A9E4 01021021 */  addu       $v0, $t0, $v0
/* 9B5E8 8009A9E8 08026A7F */  j          .L8009A9FC
/* 9B5EC 8009A9EC 00471023 */   subu      $v0, $v0, $a3
.L8009A9F0:
/* 9B5F0 8009A9F0 00031443 */  sra        $v0, $v1, 0x11
/* 9B5F4 8009A9F4 01021023 */  subu       $v0, $t0, $v0
/* 9B5F8 8009A9F8 00E21021 */  addu       $v0, $a3, $v0
.L8009A9FC:
/* 9B5FC 8009A9FC 00021400 */  sll        $v0, $v0, 0x10
/* 9B600 8009AA00 16A00005 */  bnez       $s5, .L8009AA18
/* 9B604 8009AA04 00023C03 */   sra       $a3, $v0, 0x10
/* 9B608 8009AA08 9224000A */  lbu        $a0, 0xa($s1)
/* 9B60C 8009AA0C 8E250000 */  lw         $a1, ($s1)
/* 9B610 8009AA10 0C026530 */  jal        func_800994C0
/* 9B614 8009AA14 30E600FF */   andi      $a2, $a3, 0xff
.L8009AA18:
/* 9B618 8009AA18 32420008 */  andi       $v0, $s2, 8
.L8009AA1C:
/* 9B61C 8009AA1C 1040000A */  beqz       $v0, .L8009AA48
/* 9B620 8009AA20 32420004 */   andi      $v0, $s2, 4
/* 9B624 8009AA24 8E620014 */  lw         $v0, 0x14($s3)
/* 9B628 8009AA28 8E040010 */  lw         $a0, 0x10($s0)
/* 9B62C 8009AA2C 0C026B44 */  jal        func_8009AD10
/* 9B630 8009AA30 00442021 */   addu      $a0, $v0, $a0
/* 9B634 8009AA34 A222000B */  sb         $v0, 0xb($s1)
/* 9B638 8009AA38 8E020010 */  lw         $v0, 0x10($s0)
/* 9B63C 8009AA3C 24420001 */  addiu      $v0, $v0, 1
/* 9B640 8009AA40 AE020010 */  sw         $v0, 0x10($s0)
/* 9B644 8009AA44 32420004 */  andi       $v0, $s2, 4
.L8009AA48:
/* 9B648 8009AA48 5040000C */  beql       $v0, $zero, .L8009AA7C
/* 9B64C 8009AA4C AE200004 */   sw        $zero, 4($s1)
/* 9B650 8009AA50 8E620014 */  lw         $v0, 0x14($s3)
/* 9B654 8009AA54 8E040010 */  lw         $a0, 0x10($s0)
/* 9B658 8009AA58 0C026B44 */  jal        func_8009AD10
/* 9B65C 8009AA5C 00442021 */   addu      $a0, $v0, $a0
/* 9B660 8009AA60 AE220004 */  sw         $v0, 4($s1)
/* 9B664 8009AA64 8E020010 */  lw         $v0, 0x10($s0)
/* 9B668 8009AA68 24420001 */  addiu      $v0, $v0, 1
/* 9B66C 8009AA6C AE020010 */  sw         $v0, 0x10($s0)
/* 9B670 8009AA70 8E230004 */  lw         $v1, 4($s1)
/* 9B674 8009AA74 00031A00 */  sll        $v1, $v1, 8
/* 9B678 8009AA78 AE230004 */  sw         $v1, 4($s1)
.L8009AA7C:
/* 9B67C 8009AA7C 32420001 */  andi       $v0, $s2, 1
/* 9B680 8009AA80 1040002F */  beqz       $v0, .L8009AB40
/* 9B684 8009AA84 0015A82B */   sltu      $s5, $zero, $s5
/* 9B688 8009AA88 8E620014 */  lw         $v0, 0x14($s3)
/* 9B68C 8009AA8C 8E040010 */  lw         $a0, 0x10($s0)
/* 9B690 8009AA90 0C026B44 */  jal        func_8009AD10
/* 9B694 8009AA94 00442021 */   addu      $a0, $v0, $a0
/* 9B698 8009AA98 00409021 */  addu       $s2, $v0, $zero
/* 9B69C 8009AA9C 8E030010 */  lw         $v1, 0x10($s0)
/* 9B6A0 8009AAA0 32420080 */  andi       $v0, $s2, 0x80
/* 9B6A4 8009AAA4 24630001 */  addiu      $v1, $v1, 1
/* 9B6A8 8009AAA8 10400004 */  beqz       $v0, .L8009AABC
/* 9B6AC 8009AAAC AE030010 */   sw        $v1, 0x10($s0)
/* 9B6B0 8009AAB0 9224000A */  lbu        $a0, 0xa($s1)
/* 9B6B4 8009AAB4 0C02654C */  jal        func_80099530
/* 9B6B8 8009AAB8 8E250000 */   lw        $a1, ($s1)
.L8009AABC:
/* 9B6BC 8009AABC 32420040 */  andi       $v0, $s2, 0x40
/* 9B6C0 8009AAC0 1040001A */  beqz       $v0, .L8009AB2C
/* 9B6C4 8009AAC4 32420020 */   andi      $v0, $s2, 0x20
/* 9B6C8 8009AAC8 8E620014 */  lw         $v0, 0x14($s3)
/* 9B6CC 8009AACC 8E040010 */  lw         $a0, 0x10($s0)
/* 9B6D0 8009AAD0 0C026B44 */  jal        func_8009AD10
/* 9B6D4 8009AAD4 00442021 */   addu      $a0, $v0, $a0
/* 9B6D8 8009AAD8 8E030010 */  lw         $v1, 0x10($s0)
/* 9B6DC 8009AADC A2020019 */  sb         $v0, 0x19($s0)
/* 9B6E0 8009AAE0 304200FF */  andi       $v0, $v0, 0xff
/* 9B6E4 8009AAE4 24630001 */  addiu      $v1, $v1, 1
/* 9B6E8 8009AAE8 1040000F */  beqz       $v0, .L8009AB28
/* 9B6EC 8009AAEC AE030010 */   sw        $v1, 0x10($s0)
/* 9B6F0 8009AAF0 3C020001 */  lui        $v0, 1
/* 9B6F4 8009AAF4 92040019 */  lbu        $a0, 0x19($s0)
/* 9B6F8 8009AAF8 3442E848 */  ori        $v0, $v0, 0xe848
/* 9B6FC 8009AAFC 00041840 */  sll        $v1, $a0, 1
/* 9B700 8009AB00 00641821 */  addu       $v1, $v1, $a0
/* 9B704 8009AB04 000318C0 */  sll        $v1, $v1, 3
/* 9B708 8009AB08 00641821 */  addu       $v1, $v1, $a0
/* 9B70C 8009AB0C 00031840 */  sll        $v1, $v1, 1
/* 9B710 8009AB10 0043001A */  div        $zero, $v0, $v1
/* 9B714 8009AB14 00001012 */  mflo       $v0
/* 9B718 8009AB18 50600001 */  beql       $v1, $zero, .L8009AB20
/* 9B71C 8009AB1C 000001CD */   break     0, 7
.L8009AB20:
/* 9B720 8009AB20 2442FFFF */   addiu     $v0, $v0, -1
/* 9B724 8009AB24 A2020019 */  sb         $v0, 0x19($s0)
.L8009AB28:
/* 9B728 8009AB28 32420020 */  andi       $v0, $s2, 0x20
.L8009AB2C:
/* 9B72C 8009AB2C 10400005 */  beqz       $v0, .L8009AB44
/* 9B730 8009AB30 24020001 */   addiu     $v0, $zero, 1
/* 9B734 8009AB34 8E020010 */  lw         $v0, 0x10($s0)
/* 9B738 8009AB38 24420001 */  addiu      $v0, $v0, 1
/* 9B73C 8009AB3C AE020010 */  sw         $v0, 0x10($s0)
.L8009AB40:
/* 9B740 8009AB40 24020001 */  addiu      $v0, $zero, 1
.L8009AB44:
/* 9B744 8009AB44 16A20038 */  bne        $s5, $v0, .L8009AC28
/* 9B748 8009AB48 26820001 */   addiu     $v0, $s4, 1
/* 9B74C 8009AB4C 9224000A */  lbu        $a0, 0xa($s1)
/* 9B750 8009AB50 0C02654C */  jal        func_80099530
/* 9B754 8009AB54 8E250000 */   lw        $a1, ($s1)
/* 9B758 8009AB58 240200FF */  addiu      $v0, $zero, 0xff
/* 9B75C 8009AB5C 9208001C */  lbu        $t0, 0x1c($s0)
/* 9B760 8009AB60 9227000D */  lbu        $a3, 0xd($s1)
/* 9B764 8009AB64 9223000C */  lbu        $v1, 0xc($s1)
/* 9B768 8009AB68 9205001B */  lbu        $a1, 0x1b($s0)
/* 9B76C 8009AB6C 2506FF80 */  addiu      $a2, $t0, -0x80
/* 9B770 8009AB70 00650018 */  mult       $v1, $a1
/* 9B774 8009AB74 00062040 */  sll        $a0, $a2, 1
/* 9B778 8009AB78 04820001 */  bltzl      $a0, .L8009AB80
/* 9B77C 8009AB7C 00042023 */   negu      $a0, $a0
.L8009AB80:
/* 9B780 8009AB80 00441023 */  subu       $v0, $v0, $a0
/* 9B784 8009AB84 00022C00 */  sll        $a1, $v0, 0x10
/* 9B788 8009AB88 00001812 */  mflo       $v1
/* 9B78C 8009AB8C 00051403 */  sra        $v0, $a1, 0x10
/* 9B790 8009AB90 00031903 */  sra        $v1, $v1, 4
/* 9B794 8009AB94 00E20018 */  mult       $a3, $v0
/* 9B798 8009AB98 306900FF */  andi       $t1, $v1, 0xff
/* 9B79C 8009AB9C 9222000B */  lbu        $v0, 0xb($s1)
/* 9B7A0 8009ABA0 8E630010 */  lw         $v1, 0x10($s3)
/* 9B7A4 8009ABA4 00021100 */  sll        $v0, $v0, 4
/* 9B7A8 8009ABA8 00002012 */  mflo       $a0
/* 9B7AC 8009ABAC 00043A03 */  sra        $a3, $a0, 8
/* 9B7B0 8009ABB0 04C10005 */  bgez       $a2, .L8009ABC8
/* 9B7B4 8009ABB4 00622021 */   addu      $a0, $v1, $v0
/* 9B7B8 8009ABB8 00051443 */  sra        $v0, $a1, 0x11
/* 9B7BC 8009ABBC 01021021 */  addu       $v0, $t0, $v0
/* 9B7C0 8009ABC0 08026AF5 */  j          .L8009ABD4
/* 9B7C4 8009ABC4 00471023 */   subu      $v0, $v0, $a3
.L8009ABC8:
/* 9B7C8 8009ABC8 00051443 */  sra        $v0, $a1, 0x11
/* 9B7CC 8009ABCC 01021023 */  subu       $v0, $t0, $v0
/* 9B7D0 8009ABD0 00E21021 */  addu       $v0, $a3, $v0
.L8009ABD4:
/* 9B7D4 8009ABD4 00021400 */  sll        $v0, $v0, 0x10
/* 9B7D8 8009ABD8 00023C03 */  sra        $a3, $v0, 0x10
/* 9B7DC 8009ABDC 8C820004 */  lw         $v0, 4($a0)
/* 9B7E0 8009ABE0 AFA20010 */  sw         $v0, 0x10($sp)
/* 9B7E4 8009ABE4 8C830008 */  lw         $v1, 8($a0)
/* 9B7E8 8009ABE8 AFA30014 */  sw         $v1, 0x14($sp)
/* 9B7EC 8009ABEC 8082000F */  lb         $v0, 0xf($a0)
/* 9B7F0 8009ABF0 AFA20018 */  sw         $v0, 0x18($sp)
/* 9B7F4 8009ABF4 96230008 */  lhu        $v1, 8($s1)
/* 9B7F8 8009ABF8 30E200FF */  andi       $v0, $a3, 0xff
/* 9B7FC 8009ABFC AFA90020 */  sw         $t1, 0x20($sp)
/* 9B800 8009AC00 AFA20024 */  sw         $v0, 0x24($sp)
/* 9B804 8009AC04 AFA3001C */  sw         $v1, 0x1c($sp)
/* 9B808 8009AC08 9202001E */  lbu        $v0, 0x1e($s0)
/* 9B80C 8009AC0C 02202821 */  addu       $a1, $s1, $zero
/* 9B810 8009AC10 AFA20028 */  sw         $v0, 0x28($sp)
/* 9B814 8009AC14 8C860000 */  lw         $a2, ($a0)
/* 9B818 8009AC18 8CA70004 */  lw         $a3, 4($a1)
/* 9B81C 8009AC1C 0C02647E */  jal        voice_aidyn_setter
/* 9B820 8009AC20 2624000A */   addiu     $a0, $s1, 0xa
.L8009AC24:
/* 9B824 8009AC24 26820001 */  addiu      $v0, $s4, 1
.L8009AC28:
/* 9B828 8009AC28 305400FF */  andi       $s4, $v0, 0xff
/* 9B82C 8009AC2C 029E182B */  sltu       $v1, $s4, $fp
/* 9B830 8009AC30 5460FEF9 */  bnel       $v1, $zero, .L8009A818
/* 9B834 8009AC34 8E030000 */   lw        $v1, ($s0)
.L8009AC38:
/* 9B838 8009AC38 8E020010 */  lw         $v0, 0x10($s0)
/* 9B83C 8009AC3C 8E630008 */  lw         $v1, 8($s3)
/* 9B840 8009AC40 0043102B */  sltu       $v0, $v0, $v1
/* 9B844 8009AC44 5440001E */  bnel       $v0, $zero, .L8009ACC0
/* 9B848 8009AC48 A200001A */   sb        $zero, 0x1a($s0)
/* 9B84C 8009AC4C 9202001D */  lbu        $v0, 0x1d($s0)
/* 9B850 8009AC50 50400015 */  beql       $v0, $zero, .L8009ACA8
/* 9B854 8009AC54 8E050014 */   lw        $a1, 0x14($s0)
/* 9B858 8009AC58 8E62000C */  lw         $v0, 0xc($s3)
/* 9B85C 8009AC5C AE020010 */  sw         $v0, 0x10($s0)
/* 9B860 8009AC60 8E630000 */  lw         $v1, ($s3)
/* 9B864 8009AC64 10600012 */  beqz       $v1, .L8009ACB0
/* 9B868 8009AC68 0000A021 */   addu      $s4, $zero, $zero
/* 9B86C 8009AC6C 8E030000 */  lw         $v1, ($s0)
.L8009AC70:
/* 9B870 8009AC70 00141100 */  sll        $v0, $s4, 4
/* 9B874 8009AC74 00628821 */  addu       $s1, $v1, $v0
/* 9B878 8009AC78 9224000A */  lbu        $a0, 0xa($s1)
/* 9B87C 8009AC7C 0C02654C */  jal        func_80099530
/* 9B880 8009AC80 8E250000 */   lw        $a1, ($s1)
/* 9B884 8009AC84 26830001 */  addiu      $v1, $s4, 1
/* 9B888 8009AC88 A220000E */  sb         $zero, 0xe($s1)
/* 9B88C 8009AC8C 8E620000 */  lw         $v0, ($s3)
/* 9B890 8009AC90 307400FF */  andi       $s4, $v1, 0xff
/* 9B894 8009AC94 0282102B */  sltu       $v0, $s4, $v0
/* 9B898 8009AC98 5440FFF5 */  bnel       $v0, $zero, .L8009AC70
/* 9B89C 8009AC9C 8E030000 */   lw        $v1, ($s0)
/* 9B8A0 8009ACA0 08026B30 */  j          .L8009ACC0
/* 9B8A4 8009ACA4 A200001A */   sb        $zero, 0x1a($s0)
.L8009ACA8:
/* 9B8A8 8009ACA8 0C026972 */  jal        dcm_remove_func
/* 9B8AC 8009ACAC 02C02021 */   addu      $a0, $s6, $zero
.L8009ACB0:
/* 9B8B0 8009ACB0 08026B30 */  j          .L8009ACC0
/* 9B8B4 8009ACB4 A200001A */   sb        $zero, 0x1a($s0)
.L8009ACB8:
/* 9B8B8 8009ACB8 A202001A */  sb         $v0, 0x1a($s0)
/* 9B8BC 8009ACBC 26D70001 */  addiu      $s7, $s6, 1
.L8009ACC0:
/* 9B8C0 8009ACC0 8E02000C */  lw         $v0, 0xc($s0)
.L8009ACC4:
/* 9B8C4 8009ACC4 24420001 */  addiu      $v0, $v0, 1
/* 9B8C8 8009ACC8 AE02000C */  sw         $v0, 0xc($s0)
.L8009ACCC:
/* 9B8CC 8009ACCC 32F600FF */  andi       $s6, $s7, 0xff
/* 9B8D0 8009ACD0 2EC20020 */  sltiu      $v0, $s6, 0x20
/* 9B8D4 8009ACD4 5440FEB2 */  bnel       $v0, $zero, .L8009A7A0
/* 9B8D8 8009ACD8 3C03800F */   lui       $v1, 0x800f
/* 9B8DC 8009ACDC 8FBF0094 */  lw         $ra, 0x94($sp)
/* 9B8E0 8009ACE0 8FBE0090 */  lw         $fp, 0x90($sp)
/* 9B8E4 8009ACE4 8FB7008C */  lw         $s7, 0x8c($sp)
/* 9B8E8 8009ACE8 8FB60088 */  lw         $s6, 0x88($sp)
/* 9B8EC 8009ACEC 8FB50084 */  lw         $s5, 0x84($sp)
/* 9B8F0 8009ACF0 8FB40080 */  lw         $s4, 0x80($sp)
/* 9B8F4 8009ACF4 8FB3007C */  lw         $s3, 0x7c($sp)
/* 9B8F8 8009ACF8 8FB20078 */  lw         $s2, 0x78($sp)
/* 9B8FC 8009ACFC 8FB10074 */  lw         $s1, 0x74($sp)
/* 9B900 8009AD00 8FB00070 */  lw         $s0, 0x70($sp)
/* 9B904 8009AD04 240203E8 */  addiu      $v0, $zero, 0x3e8
/* 9B908 8009AD08 03E00008 */  jr         $ra
/* 9B90C 8009AD0C 27BD0098 */   addiu     $sp, $sp, 0x98

glabel func_8009AD10
/* 9B910 8009AD10 03E00008 */  jr         $ra
/* 9B914 8009AD14 90820000 */   lbu       $v0, ($a0)

glabel func_8009AD18
/* 9B918 8009AD18 90820001 */  lbu        $v0, 1($a0)
/* 9B91C 8009AD1C 90830000 */  lbu        $v1, ($a0)
/* 9B920 8009AD20 00021200 */  sll        $v0, $v0, 8
/* 9B924 8009AD24 03E00008 */  jr         $ra
/* 9B928 8009AD28 00621025 */   or        $v0, $v1, $v0

glabel func_8009AD2C
/* 9B92C 8009AD2C 90820001 */  lbu        $v0, 1($a0)
/* 9B930 8009AD30 90850000 */  lbu        $a1, ($a0)
/* 9B934 8009AD34 90830002 */  lbu        $v1, 2($a0)
/* 9B938 8009AD38 00021200 */  sll        $v0, $v0, 8
/* 9B93C 8009AD3C 00A22825 */  or         $a1, $a1, $v0
/* 9B940 8009AD40 00031C00 */  sll        $v1, $v1, 0x10
/* 9B944 8009AD44 90820003 */  lbu        $v0, 3($a0)
/* 9B948 8009AD48 00A32825 */  or         $a1, $a1, $v1
/* 9B94C 8009AD4C 00021600 */  sll        $v0, $v0, 0x18
/* 9B950 8009AD50 03E00008 */  jr         $ra
/* 9B954 8009AD54 00A21025 */   or        $v0, $a1, $v0
/* 9B958 8009AD58 00000000 */  nop
/* 9B95C 8009AD5C 00000000 */  nop
