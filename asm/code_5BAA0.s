.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8005AEA0
/* 5BAA0 8005AEA0 24060001 */  addiu      $a2, $zero, 1
/* 5BAA4 8005AEA4 10A00008 */  beqz       $a1, .L8005AEC8
/* 5BAA8 8005AEA8 00001821 */   addu      $v1, $zero, $zero
/* 5BAAC 8005AEAC 00C40018 */  mult       $a2, $a0
.L8005AEB0:
/* 5BAB0 8005AEB0 24630001 */  addiu      $v1, $v1, 1
/* 5BAB4 8005AEB4 0065102B */  sltu       $v0, $v1, $a1
/* 5BAB8 8005AEB8 00003012 */  mflo       $a2
/* 5BABC 8005AEBC 00000000 */  nop
/* 5BAC0 8005AEC0 1440FFFB */  bnez       $v0, .L8005AEB0
/* 5BAC4 8005AEC4 00C40018 */   mult      $a2, $a0
.L8005AEC8:
/* 5BAC8 8005AEC8 03E00008 */  jr         $ra
/* 5BACC 8005AECC 00C01021 */   addu      $v0, $a2, $zero

glabel get_flag_from_text
/* 5BAD0 8005AED0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5BAD4 8005AED4 AFB40020 */  sw         $s4, 0x20($sp)
/* 5BAD8 8005AED8 0080A021 */  addu       $s4, $a0, $zero
/* 5BADC 8005AEDC AFBF0024 */  sw         $ra, 0x24($sp)
/* 5BAE0 8005AEE0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 5BAE4 8005AEE4 AFB20018 */  sw         $s2, 0x18($sp)
/* 5BAE8 8005AEE8 AFB10014 */  sw         $s1, 0x14($sp)
/* 5BAEC 8005AEEC 0C03353E */  jal        strlen
/* 5BAF0 8005AEF0 AFB00010 */   sw        $s0, 0x10($sp)
/* 5BAF4 8005AEF4 00008021 */  addu       $s0, $zero, $zero
/* 5BAF8 8005AEF8 3052FFFF */  andi       $s2, $v0, 0xffff
/* 5BAFC 8005AEFC 12400010 */  beqz       $s2, .L8005AF40
/* 5BB00 8005AF00 00008821 */   addu      $s1, $zero, $zero
/* 5BB04 8005AF04 2653FFFF */  addiu      $s3, $s2, -1
.L8005AF08:
/* 5BB08 8005AF08 2404000A */  addiu      $a0, $zero, 0xa
/* 5BB0C 8005AF0C 0C016BA8 */  jal        func_8005AEA0
/* 5BB10 8005AF10 02002821 */   addu      $a1, $s0, $zero
/* 5BB14 8005AF14 02701823 */  subu       $v1, $s3, $s0
/* 5BB18 8005AF18 02831821 */  addu       $v1, $s4, $v1
/* 5BB1C 8005AF1C 90640000 */  lbu        $a0, ($v1)
/* 5BB20 8005AF20 2484FFD0 */  addiu      $a0, $a0, -0x30
/* 5BB24 8005AF24 00820018 */  mult       $a0, $v0
/* 5BB28 8005AF28 26020001 */  addiu      $v0, $s0, 1
/* 5BB2C 8005AF2C 3050FFFF */  andi       $s0, $v0, 0xffff
/* 5BB30 8005AF30 0212102B */  sltu       $v0, $s0, $s2
/* 5BB34 8005AF34 00002012 */  mflo       $a0
/* 5BB38 8005AF38 1440FFF3 */  bnez       $v0, .L8005AF08
/* 5BB3C 8005AF3C 02248821 */   addu      $s1, $s1, $a0
.L8005AF40:
/* 5BB40 8005AF40 02201021 */  addu       $v0, $s1, $zero
/* 5BB44 8005AF44 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5BB48 8005AF48 8FB40020 */  lw         $s4, 0x20($sp)
/* 5BB4C 8005AF4C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5BB50 8005AF50 8FB20018 */  lw         $s2, 0x18($sp)
/* 5BB54 8005AF54 8FB10014 */  lw         $s1, 0x14($sp)
/* 5BB58 8005AF58 8FB00010 */  lw         $s0, 0x10($sp)
/* 5BB5C 8005AF5C 03E00008 */  jr         $ra
/* 5BB60 8005AF60 27BD0028 */   addiu     $sp, $sp, 0x28

glabel build_journal_widget
/* 5BB64 8005AF64 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5BB68 8005AF68 AFB10014 */  sw         $s1, 0x14($sp)
/* 5BB6C 8005AF6C 00808821 */  addu       $s1, $a0, $zero
/* 5BB70 8005AF70 AFB00010 */  sw         $s0, 0x10($sp)
/* 5BB74 8005AF74 00058400 */  sll        $s0, $a1, 0x10
/* 5BB78 8005AF78 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5BB7C 8005AF7C 0C02E658 */  jal        widget_menu_build
/* 5BB80 8005AF80 00108403 */   sra       $s0, $s0, 0x10
/* 5BB84 8005AF84 3C03800E */  lui        $v1, %hi(D_800DEF50)
/* 5BB88 8005AF88 2463EF50 */  addiu      $v1, $v1, %lo(D_800DEF50)
/* 5BB8C 8005AF8C 02202021 */  addu       $a0, $s1, $zero
/* 5BB90 8005AF90 02002821 */  addu       $a1, $s0, $zero
/* 5BB94 8005AF94 0C016BF6 */  jal        journal_widget
/* 5BB98 8005AF98 AE230078 */   sw        $v1, 0x78($s1)
/* 5BB9C 8005AF9C 02201021 */  addu       $v0, $s1, $zero
/* 5BBA0 8005AFA0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5BBA4 8005AFA4 8FB10014 */  lw         $s1, 0x14($sp)
/* 5BBA8 8005AFA8 8FB00010 */  lw         $s0, 0x10($sp)
/* 5BBAC 8005AFAC 03E00008 */  jr         $ra
/* 5BBB0 8005AFB0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005AFB4
/* 5BBB4 8005AFB4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5BBB8 8005AFB8 3C02800E */  lui        $v0, %hi(D_800DEF50)
/* 5BBBC 8005AFBC 2442EF50 */  addiu      $v0, $v0, %lo(D_800DEF50)
/* 5BBC0 8005AFC0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5BBC4 8005AFC4 0C02E66C */  jal        widget_menu_free
/* 5BBC8 8005AFC8 AC820078 */   sw        $v0, 0x78($a0)
/* 5BBCC 8005AFCC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5BBD0 8005AFD0 03E00008 */  jr         $ra
/* 5BBD4 8005AFD4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel journal_widget
/* 5BBD8 8005AFD8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5BBDC 8005AFDC AFB20020 */  sw         $s2, 0x20($sp)
/* 5BBE0 8005AFE0 00809021 */  addu       $s2, $a0, $zero
/* 5BBE4 8005AFE4 2404007C */  addiu      $a0, $zero, 0x7c
/* 5BBE8 8005AFE8 00052C00 */  sll        $a1, $a1, 0x10
/* 5BBEC 8005AFEC AFB30024 */  sw         $s3, 0x24($sp)
/* 5BBF0 8005AFF0 00059C03 */  sra        $s3, $a1, 0x10
/* 5BBF4 8005AFF4 AFBF0028 */  sw         $ra, 0x28($sp)
/* 5BBF8 8005AFF8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5BBFC 8005AFFC AFB00018 */  sw         $s0, 0x18($sp)
/* 5BC00 8005B000 0C026259 */  jal        passToMalloc
/* 5BC04 8005B004 A240005B */   sb        $zero, 0x5b($s2)
/* 5BC08 8005B008 24040182 */  addiu      $a0, $zero, 0x182
/* 5BC0C 8005B00C 0C0290E2 */  jal        get_borg_8
/* 5BC10 8005B010 00408021 */   addu      $s0, $v0, $zero
/* 5BC14 8005B014 02002021 */  addu       $a0, $s0, $zero
/* 5BC18 8005B018 0C02E518 */  jal        borg8_widget
/* 5BC1C 8005B01C 00402821 */   addu      $a1, $v0, $zero
/* 5BC20 8005B020 00402021 */  addu       $a0, $v0, $zero
/* 5BC24 8005B024 00002821 */  addu       $a1, $zero, $zero
/* 5BC28 8005B028 00003021 */  addu       $a2, $zero, $zero
/* 5BC2C 8005B02C 0C02DD3F */  jal        set_widget_coords
/* 5BC30 8005B030 AE42008C */   sw        $v0, 0x8c($s2)
/* 5BC34 8005B034 8E48008C */  lw         $t0, 0x8c($s2)
/* 5BC38 8005B038 240500FF */  addiu      $a1, $zero, 0xff
/* 5BC3C 8005B03C 8D030078 */  lw         $v1, 0x78($t0)
/* 5BC40 8005B040 240600FF */  addiu      $a2, $zero, 0xff
/* 5BC44 8005B044 84640048 */  lh         $a0, 0x48($v1)
/* 5BC48 8005B048 240700FF */  addiu      $a3, $zero, 0xff
/* 5BC4C 8005B04C AFA00010 */  sw         $zero, 0x10($sp)
/* 5BC50 8005B050 8C62004C */  lw         $v0, 0x4c($v1)
/* 5BC54 8005B054 0040F809 */  jalr       $v0
/* 5BC58 8005B058 01042021 */   addu      $a0, $t0, $a0
/* 5BC5C 8005B05C 8E430078 */  lw         $v1, 0x78($s2)
/* 5BC60 8005B060 8E45008C */  lw         $a1, 0x8c($s2)
/* 5BC64 8005B064 84640030 */  lh         $a0, 0x30($v1)
/* 5BC68 8005B068 8C620034 */  lw         $v0, 0x34($v1)
/* 5BC6C 8005B06C 0040F809 */  jalr       $v0
/* 5BC70 8005B070 02442021 */   addu      $a0, $s2, $a0
/* 5BC74 8005B074 02402021 */  addu       $a0, $s2, $zero
/* 5BC78 8005B078 0C016CFB */  jal        Journal_load
/* 5BC7C 8005B07C 02602821 */   addu      $a1, $s3, $zero
/* 5BC80 8005B080 8E42007C */  lw         $v0, 0x7c($s2)
/* 5BC84 8005B084 8C510040 */  lw         $s1, 0x40($v0)
/* 5BC88 8005B088 24030004 */  addiu      $v1, $zero, 4
/* 5BC8C 8005B08C 92240012 */  lbu        $a0, 0x12($s1)
/* 5BC90 8005B090 24020001 */  addiu      $v0, $zero, 1
/* 5BC94 8005B094 14820017 */  bne        $a0, $v0, .L8005B0F4
/* 5BC98 8005B098 A2230013 */   sb        $v1, 0x13($s1)
/* 5BC9C 8005B09C 0C026259 */  jal        passToMalloc
/* 5BCA0 8005B0A0 2404007C */   addiu     $a0, $zero, 0x7c
/* 5BCA4 8005B0A4 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 5BCA8 8005B0A8 8C6688F4 */  lw         $a2, %lo(commonstringsmirror)($v1)
/* 5BCAC 8005B0AC 00402021 */  addu       $a0, $v0, $zero
/* 5BCB0 8005B0B0 8CC507C0 */  lw         $a1, 0x7c0($a2)
/* 5BCB4 8005B0B4 0C02DFC8 */  jal        widgetcliptext_init
/* 5BCB8 8005B0B8 24060190 */   addiu     $a2, $zero, 0x190
/* 5BCBC 8005B0BC 24050062 */  addiu      $a1, $zero, 0x62
/* 5BCC0 8005B0C0 24060046 */  addiu      $a2, $zero, 0x46
/* 5BCC4 8005B0C4 00408021 */  addu       $s0, $v0, $zero
/* 5BCC8 8005B0C8 8E080078 */  lw         $t0, 0x78($s0)
/* 5BCCC 8005B0CC 2407003C */  addiu      $a3, $zero, 0x3c
/* 5BCD0 8005B0D0 85040048 */  lh         $a0, 0x48($t0)
/* 5BCD4 8005B0D4 240200FF */  addiu      $v0, $zero, 0xff
/* 5BCD8 8005B0D8 AFA20010 */  sw         $v0, 0x10($sp)
/* 5BCDC 8005B0DC 8D03004C */  lw         $v1, 0x4c($t0)
/* 5BCE0 8005B0E0 0060F809 */  jalr       $v1
/* 5BCE4 8005B0E4 02042021 */   addu      $a0, $s0, $a0
/* 5BCE8 8005B0E8 8E44007C */  lw         $a0, 0x7c($s2)
/* 5BCEC 8005B0EC 0C02ED01 */  jal        journal_widget_link
/* 5BCF0 8005B0F0 02002821 */   addu      $a1, $s0, $zero
.L8005B0F4:
/* 5BCF4 8005B0F4 0C026259 */  jal        passToMalloc
/* 5BCF8 8005B0F8 2404007C */   addiu     $a0, $zero, 0x7c
/* 5BCFC 8005B0FC 00402021 */  addu       $a0, $v0, $zero
/* 5BD00 8005B100 3C05800E */  lui        $a1, %hi(D_800DEE70)
/* 5BD04 8005B104 24A5EE70 */  addiu      $a1, $a1, %lo(D_800DEE70)
/* 5BD08 8005B108 0C02DFC8 */  jal        widgetcliptext_init
/* 5BD0C 8005B10C 24060190 */   addiu     $a2, $zero, 0x190
/* 5BD10 8005B110 8E44007C */  lw         $a0, 0x7c($s2)
/* 5BD14 8005B114 0C02ED01 */  jal        journal_widget_link
/* 5BD18 8005B118 00402821 */   addu      $a1, $v0, $zero
/* 5BD1C 8005B11C 8E45007C */  lw         $a1, 0x7c($s2)
/* 5BD20 8005B120 8CA30078 */  lw         $v1, 0x78($a1)
/* 5BD24 8005B124 84640028 */  lh         $a0, 0x28($v1)
/* 5BD28 8005B128 8C62002C */  lw         $v0, 0x2c($v1)
/* 5BD2C 8005B12C 0040F809 */  jalr       $v0
/* 5BD30 8005B130 00A42021 */   addu      $a0, $a1, $a0
/* 5BD34 8005B134 2403FFFF */  addiu      $v1, $zero, -1
/* 5BD38 8005B138 16630005 */  bne        $s3, $v1, .L8005B150
/* 5BD3C 8005B13C 24050082 */   addiu     $a1, $zero, 0x82
/* 5BD40 8005B140 92220012 */  lbu        $v0, 0x12($s1)
/* 5BD44 8005B144 2442FFFF */  addiu      $v0, $v0, -1
/* 5BD48 8005B148 08016C62 */  j          .L8005B188
/* 5BD4C 8005B14C A2220011 */   sb        $v0, 0x11($s1)
.L8005B150:
/* 5BD50 8005B150 92220011 */  lbu        $v0, 0x11($s1)
/* 5BD54 8005B154 8E23000C */  lw         $v1, 0xc($s1)
/* 5BD58 8005B158 00021080 */  sll        $v0, $v0, 2
/* 5BD5C 8005B15C 00431021 */  addu       $v0, $v0, $v1
/* 5BD60 8005B160 8C490000 */  lw         $t1, ($v0)
/* 5BD64 8005B164 24060050 */  addiu      $a2, $zero, 0x50
/* 5BD68 8005B168 8D280078 */  lw         $t0, 0x78($t1)
/* 5BD6C 8005B16C 2407008C */  addiu      $a3, $zero, 0x8c
/* 5BD70 8005B170 85040048 */  lh         $a0, 0x48($t0)
/* 5BD74 8005B174 240200FF */  addiu      $v0, $zero, 0xff
/* 5BD78 8005B178 AFA20010 */  sw         $v0, 0x10($sp)
/* 5BD7C 8005B17C 8D03004C */  lw         $v1, 0x4c($t0)
/* 5BD80 8005B180 0060F809 */  jalr       $v1
/* 5BD84 8005B184 01242021 */   addu      $a0, $t1, $a0
.L8005B188:
/* 5BD88 8005B188 92220011 */  lbu        $v0, 0x11($s1)
/* 5BD8C 8005B18C 8E23000C */  lw         $v1, 0xc($s1)
/* 5BD90 8005B190 00021080 */  sll        $v0, $v0, 2
/* 5BD94 8005B194 00431021 */  addu       $v0, $v0, $v1
/* 5BD98 8005B198 8C500000 */  lw         $s0, ($v0)
/* 5BD9C 8005B19C 8E030078 */  lw         $v1, 0x78($s0)
/* 5BDA0 8005B1A0 84640020 */  lh         $a0, 0x20($v1)
/* 5BDA4 8005B1A4 8C620024 */  lw         $v0, 0x24($v1)
/* 5BDA8 8005B1A8 0040F809 */  jalr       $v0
/* 5BDAC 8005B1AC 02042021 */   addu      $a0, $s0, $a0
/* 5BDB0 8005B1B0 86030062 */  lh         $v1, 0x62($s0)
/* 5BDB4 8005B1B4 8E46007C */  lw         $a2, 0x7c($s2)
/* 5BDB8 8005B1B8 00621821 */  addu       $v1, $v1, $v0
/* 5BDBC 8005B1BC 84C50062 */  lh         $a1, 0x62($a2)
/* 5BDC0 8005B1C0 84C2006A */  lh         $v0, 0x6a($a2)
/* 5BDC4 8005B1C4 84C40068 */  lh         $a0, 0x68($a2)
/* 5BDC8 8005B1C8 00651823 */  subu       $v1, $v1, $a1
/* 5BDCC 8005B1CC 00441023 */  subu       $v0, $v0, $a0
/* 5BDD0 8005B1D0 0043102A */  slt        $v0, $v0, $v1
/* 5BDD4 8005B1D4 1040000D */  beqz       $v0, .L8005B20C
/* 5BDD8 8005B1D8 00000000 */   nop
/* 5BDDC 8005B1DC 8CC30078 */  lw         $v1, 0x78($a2)
/* 5BDE0 8005B1E0 84640020 */  lh         $a0, 0x20($v1)
/* 5BDE4 8005B1E4 8C620024 */  lw         $v0, 0x24($v1)
/* 5BDE8 8005B1E8 0040F809 */  jalr       $v0
/* 5BDEC 8005B1EC 00C42021 */   addu      $a0, $a2, $a0
/* 5BDF0 8005B1F0 8E45007C */  lw         $a1, 0x7c($s2)
/* 5BDF4 8005B1F4 94A3006A */  lhu        $v1, 0x6a($a1)
/* 5BDF8 8005B1F8 94A40068 */  lhu        $a0, 0x68($a1)
/* 5BDFC 8005B1FC 00641823 */  subu       $v1, $v1, $a0
/* 5BE00 8005B200 00621823 */  subu       $v1, $v1, $v0
/* 5BE04 8005B204 A6230008 */  sh         $v1, 8($s1)
/* 5BE08 8005B208 A6230004 */  sh         $v1, 4($s1)
.L8005B20C:
/* 5BE0C 8005B20C 0C026259 */  jal        passToMalloc
/* 5BE10 8005B210 2404007C */   addiu     $a0, $zero, 0x7c
/* 5BE14 8005B214 240400D6 */  addiu      $a0, $zero, 0xd6
/* 5BE18 8005B218 0C0290E2 */  jal        get_borg_8
/* 5BE1C 8005B21C 00408021 */   addu      $s0, $v0, $zero
/* 5BE20 8005B220 02002021 */  addu       $a0, $s0, $zero
/* 5BE24 8005B224 0C02E518 */  jal        borg8_widget
/* 5BE28 8005B228 00402821 */   addu      $a1, $v0, $zero
/* 5BE2C 8005B22C 2404007C */  addiu      $a0, $zero, 0x7c
/* 5BE30 8005B230 0C026259 */  jal        passToMalloc
/* 5BE34 8005B234 AE420080 */   sw        $v0, 0x80($s2)
/* 5BE38 8005B238 240400D5 */  addiu      $a0, $zero, 0xd5
/* 5BE3C 8005B23C 0C0290E2 */  jal        get_borg_8
/* 5BE40 8005B240 00408021 */   addu      $s0, $v0, $zero
/* 5BE44 8005B244 02002021 */  addu       $a0, $s0, $zero
/* 5BE48 8005B248 0C02E518 */  jal        borg8_widget
/* 5BE4C 8005B24C 00402821 */   addu      $a1, $v0, $zero
/* 5BE50 8005B250 24040080 */  addiu      $a0, $zero, 0x80
/* 5BE54 8005B254 0C026259 */  jal        passToMalloc
/* 5BE58 8005B258 AE420084 */   sw        $v0, 0x84($s2)
/* 5BE5C 8005B25C 00402021 */  addu       $a0, $v0, $zero
/* 5BE60 8005B260 8E45007C */  lw         $a1, 0x7c($s2)
/* 5BE64 8005B264 8E460080 */  lw         $a2, 0x80($s2)
/* 5BE68 8005B268 8E470084 */  lw         $a3, 0x84($s2)
/* 5BE6C 8005B26C 3402FFFF */  ori        $v0, $zero, 0xffff
/* 5BE70 8005B270 0C02ED4C */  jal        func_800BB530
/* 5BE74 8005B274 AFA20010 */   sw        $v0, 0x10($sp)
/* 5BE78 8005B278 00402021 */  addu       $a0, $v0, $zero
/* 5BE7C 8005B27C 240500F7 */  addiu      $a1, $zero, 0xf7
/* 5BE80 8005B280 2406001E */  addiu      $a2, $zero, 0x1e
/* 5BE84 8005B284 0C02DD3F */  jal        set_widget_coords
/* 5BE88 8005B288 AE420088 */   sw        $v0, 0x88($s2)
/* 5BE8C 8005B28C 24050082 */  addiu      $a1, $zero, 0x82
/* 5BE90 8005B290 8E490088 */  lw         $t1, 0x88($s2)
/* 5BE94 8005B294 24060050 */  addiu      $a2, $zero, 0x50
/* 5BE98 8005B298 8D280078 */  lw         $t0, 0x78($t1)
/* 5BE9C 8005B29C 24070050 */  addiu      $a3, $zero, 0x50
/* 5BEA0 8005B2A0 85040048 */  lh         $a0, 0x48($t0)
/* 5BEA4 8005B2A4 240200FF */  addiu      $v0, $zero, 0xff
/* 5BEA8 8005B2A8 AFA20010 */  sw         $v0, 0x10($sp)
/* 5BEAC 8005B2AC 8D03004C */  lw         $v1, 0x4c($t0)
/* 5BEB0 8005B2B0 0060F809 */  jalr       $v1
/* 5BEB4 8005B2B4 01242021 */   addu      $a0, $t1, $a0
/* 5BEB8 8005B2B8 8E420088 */  lw         $v0, 0x88($s2)
/* 5BEBC 8005B2BC 8C440040 */  lw         $a0, 0x40($v0)
/* 5BEC0 8005B2C0 2403001E */  addiu      $v1, $zero, 0x1e
/* 5BEC4 8005B2C4 A0830008 */  sb         $v1, 8($a0)
/* 5BEC8 8005B2C8 8E460078 */  lw         $a2, 0x78($s2)
/* 5BECC 8005B2CC 8E450088 */  lw         $a1, 0x88($s2)
/* 5BED0 8005B2D0 84C40030 */  lh         $a0, 0x30($a2)
/* 5BED4 8005B2D4 8CC20034 */  lw         $v0, 0x34($a2)
/* 5BED8 8005B2D8 0040F809 */  jalr       $v0
/* 5BEDC 8005B2DC 02442021 */   addu      $a0, $s2, $a0
/* 5BEE0 8005B2E0 00002021 */  addu       $a0, $zero, $zero
/* 5BEE4 8005B2E4 3C028006 */  lui        $v0, %hi(D_8005BCE0)
/* 5BEE8 8005B2E8 2442BCE0 */  addiu      $v0, $v0, %lo(D_8005BCE0)
/* 5BEEC 8005B2EC 3C038006 */  lui        $v1, %hi(D_8005BD40)
/* 5BEF0 8005B2F0 2463BD40 */  addiu      $v1, $v1, %lo(D_8005BD40)
/* 5BEF4 8005B2F4 AE420000 */  sw         $v0, ($s2)
/* 5BEF8 8005B2F8 0C0271BF */  jal        cont_delay
/* 5BEFC 8005B2FC AE430004 */   sw        $v1, 4($s2)
/* 5BF00 8005B300 8FBF0028 */  lw         $ra, 0x28($sp)
/* 5BF04 8005B304 8FB30024 */  lw         $s3, 0x24($sp)
/* 5BF08 8005B308 8FB20020 */  lw         $s2, 0x20($sp)
/* 5BF0C 8005B30C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5BF10 8005B310 8FB00018 */  lw         $s0, 0x18($sp)
/* 5BF14 8005B314 03E00008 */  jr         $ra
/* 5BF18 8005B318 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_with_journal_flag
/* 5BF1C 8005B31C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5BF20 8005B320 AFB00018 */  sw         $s0, 0x18($sp)
/* 5BF24 8005B324 00A08021 */  addu       $s0, $a1, $zero
/* 5BF28 8005B328 AFB20020 */  sw         $s2, 0x20($sp)
/* 5BF2C 8005B32C 00809021 */  addu       $s2, $a0, $zero
/* 5BF30 8005B330 AFBF0024 */  sw         $ra, 0x24($sp)
/* 5BF34 8005B334 AFB1001C */  sw         $s1, 0x1c($sp)
/* 5BF38 8005B338 92030000 */  lbu        $v1, ($s0)
/* 5BF3C 8005B33C 24020020 */  addiu      $v0, $zero, 0x20
/* 5BF40 8005B340 10620006 */  beq        $v1, $v0, .L8005B35C
/* 5BF44 8005B344 02002021 */   addu      $a0, $s0, $zero
/* 5BF48 8005B348 24030020 */  addiu      $v1, $zero, 0x20
/* 5BF4C 8005B34C 26100001 */  addiu      $s0, $s0, 1
.L8005B350:
/* 5BF50 8005B350 92020000 */  lbu        $v0, ($s0)
/* 5BF54 8005B354 5443FFFE */  bnel       $v0, $v1, .L8005B350
/* 5BF58 8005B358 26100001 */   addiu     $s0, $s0, 1
.L8005B35C:
/* 5BF5C 8005B35C A2000000 */  sb         $zero, ($s0)
/* 5BF60 8005B360 0C016BB4 */  jal        get_flag_from_text
/* 5BF64 8005B364 26100001 */   addiu     $s0, $s0, 1
/* 5BF68 8005B368 00408821 */  addu       $s1, $v0, $zero
/* 5BF6C 8005B36C 0C009168 */  jal        get_event_flag
/* 5BF70 8005B370 3224FFFF */   andi      $a0, $s1, 0xffff
/* 5BF74 8005B374 10400017 */  beqz       $v0, .L8005B3D4
/* 5BF78 8005B378 00001021 */   addu      $v0, $zero, $zero
/* 5BF7C 8005B37C 0C026259 */  jal        passToMalloc
/* 5BF80 8005B380 2404007C */   addiu     $a0, $zero, 0x7c
/* 5BF84 8005B384 00402021 */  addu       $a0, $v0, $zero
/* 5BF88 8005B388 02002821 */  addu       $a1, $s0, $zero
/* 5BF8C 8005B38C 0C02DFC8 */  jal        widgetcliptext_init
/* 5BF90 8005B390 24060190 */   addiu     $a2, $zero, 0x190
/* 5BF94 8005B394 24050062 */  addiu      $a1, $zero, 0x62
/* 5BF98 8005B398 00408021 */  addu       $s0, $v0, $zero
/* 5BF9C 8005B39C 24060046 */  addiu      $a2, $zero, 0x46
/* 5BFA0 8005B3A0 8E030078 */  lw         $v1, 0x78($s0)
/* 5BFA4 8005B3A4 240200FF */  addiu      $v0, $zero, 0xff
/* 5BFA8 8005B3A8 A611005E */  sh         $s1, 0x5e($s0)
/* 5BFAC 8005B3AC 84640048 */  lh         $a0, 0x48($v1)
/* 5BFB0 8005B3B0 2407003C */  addiu      $a3, $zero, 0x3c
/* 5BFB4 8005B3B4 AFA20010 */  sw         $v0, 0x10($sp)
/* 5BFB8 8005B3B8 8C62004C */  lw         $v0, 0x4c($v1)
/* 5BFBC 8005B3BC 0040F809 */  jalr       $v0
/* 5BFC0 8005B3C0 02042021 */   addu      $a0, $s0, $a0
/* 5BFC4 8005B3C4 8E44007C */  lw         $a0, 0x7c($s2)
/* 5BFC8 8005B3C8 0C02ED01 */  jal        journal_widget_link
/* 5BFCC 8005B3CC 02002821 */   addu      $a1, $s0, $zero
/* 5BFD0 8005B3D0 24020001 */  addiu      $v0, $zero, 1
.L8005B3D4:
/* 5BFD4 8005B3D4 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5BFD8 8005B3D8 8FB20020 */  lw         $s2, 0x20($sp)
/* 5BFDC 8005B3DC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5BFE0 8005B3E0 8FB00018 */  lw         $s0, 0x18($sp)
/* 5BFE4 8005B3E4 03E00008 */  jr         $ra
/* 5BFE8 8005B3E8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel Journal_load
/* 5BFEC 8005B3EC 27BDDFC0 */  addiu      $sp, $sp, -0x2040
/* 5BFF0 8005B3F0 AFBE2038 */  sw         $fp, 0x2038($sp)
/* 5BFF4 8005B3F4 0080F021 */  addu       $fp, $a0, $zero
/* 5BFF8 8005B3F8 3C02B200 */  lui        $v0, %hi(cinematic_text)
/* 5BFFC 8005B3FC 2442B140 */  addiu      $v0, $v0, %lo(cinematic_text)
/* 5C000 8005B400 3C03B200 */  lui        $v1, %hi(journal_ROM)
/* 5C004 8005B404 AFB42028 */  sw         $s4, 0x2028($sp)
/* 5C008 8005B408 247490B0 */  addiu      $s4, $v1, %lo(journal_ROM)
/* 5C00C 8005B40C AFB1201C */  sw         $s1, 0x201c($sp)
/* 5C010 8005B410 00548823 */  subu       $s1, $v0, $s4
/* 5C014 8005B414 02202021 */  addu       $a0, $s1, $zero
/* 5C018 8005B418 AFB02018 */  sw         $s0, 0x2018($sp)
/* 5C01C 8005B41C 3C10800E */  lui        $s0, %hi(D_800DEE74)
/* 5C020 8005B420 AFB32024 */  sw         $s3, 0x2024($sp)
/* 5C024 8005B424 2613EE74 */  addiu      $s3, $s0, %lo(D_800DEE74)
/* 5C028 8005B428 AFA52044 */  sw         $a1, 0x2044($sp)
/* 5C02C 8005B42C 02602821 */  addu       $a1, $s3, $zero
/* 5C030 8005B430 240600E0 */  addiu      $a2, $zero, 0xe0
/* 5C034 8005B434 AFBF203C */  sw         $ra, 0x203c($sp)
/* 5C038 8005B438 AFB72034 */  sw         $s7, 0x2034($sp)
/* 5C03C 8005B43C AFB62030 */  sw         $s6, 0x2030($sp)
/* 5C040 8005B440 AFB5202C */  sw         $s5, 0x202c($sp)
/* 5C044 8005B444 0C025F9C */  jal        Malloc
/* 5C048 8005B448 AFB22020 */   sw        $s2, 0x2020($sp)
/* 5C04C 8005B44C 00409021 */  addu       $s2, $v0, $zero
/* 5C050 8005B450 56400007 */  bnel       $s2, $zero, .L8005B470
/* 5C054 8005B454 02402021 */   addu      $a0, $s2, $zero
/* 5C058 8005B458 3C04800E */  lui        $a0, %hi(D_800DEE88)
/* 5C05C 8005B45C 2484EE88 */  addiu      $a0, $a0, %lo(D_800DEE88)
/* 5C060 8005B460 3C05800E */  lui        $a1, %hi(D_800DEE98)
/* 5C064 8005B464 0C025F2D */  jal        manualCrash
/* 5C068 8005B468 24A5EE98 */   addiu     $a1, $a1, %lo(D_800DEE98)
/* 5C06C 8005B46C 02402021 */  addu       $a0, $s2, $zero
.L8005B470:
/* 5C070 8005B470 02802821 */  addu       $a1, $s4, $zero
/* 5C074 8005B474 02203021 */  addu       $a2, $s1, $zero
/* 5C078 8005B478 24070001 */  addiu      $a3, $zero, 1
/* 5C07C 8005B47C 240200E9 */  addiu      $v0, $zero, 0xe9
/* 5C080 8005B480 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C084 8005B484 0C027269 */  jal        RomCopy
/* 5C088 8005B488 AFA20014 */   sw        $v0, 0x14($sp)
/* 5C08C 8005B48C 0C026259 */  jal        passToMalloc
/* 5C090 8005B490 2404007C */   addiu     $a0, $zero, 0x7c
/* 5C094 8005B494 00402021 */  addu       $a0, $v0, $zero
/* 5C098 8005B498 0C02EBC5 */  jal        widgetscrolllist_init
/* 5C09C 8005B49C 24050064 */   addiu     $a1, $zero, 0x64
/* 5C0A0 8005B4A0 00402021 */  addu       $a0, $v0, $zero
/* 5C0A4 8005B4A4 24050040 */  addiu      $a1, $zero, 0x40
/* 5C0A8 8005B4A8 2406001E */  addiu      $a2, $zero, 0x1e
/* 5C0AC 8005B4AC 0C02DD3F */  jal        set_widget_coords
/* 5C0B0 8005B4B0 AFC2007C */   sw        $v0, 0x7c($fp)
/* 5C0B4 8005B4B4 0000B021 */  addu       $s6, $zero, $zero
/* 5C0B8 8005B4B8 24020040 */  addiu      $v0, $zero, 0x40
/* 5C0BC 8005B4BC 8FC4007C */  lw         $a0, 0x7c($fp)
/* 5C0C0 8005B4C0 240300F5 */  addiu      $v1, $zero, 0xf5
/* 5C0C4 8005B4C4 A4830066 */  sh         $v1, 0x66($a0)
/* 5C0C8 8005B4C8 8FC30078 */  lw         $v1, 0x78($fp)
/* 5C0CC 8005B4CC 00802821 */  addu       $a1, $a0, $zero
/* 5C0D0 8005B4D0 A4820064 */  sh         $v0, 0x64($a0)
/* 5C0D4 8005B4D4 2402001E */  addiu      $v0, $zero, 0x1e
/* 5C0D8 8005B4D8 A4820068 */  sh         $v0, 0x68($a0)
/* 5C0DC 8005B4DC 240200DC */  addiu      $v0, $zero, 0xdc
/* 5C0E0 8005B4E0 A482006A */  sh         $v0, 0x6a($a0)
/* 5C0E4 8005B4E4 84640030 */  lh         $a0, 0x30($v1)
/* 5C0E8 8005B4E8 8C620034 */  lw         $v0, 0x34($v1)
/* 5C0EC 8005B4EC 0040F809 */  jalr       $v0
/* 5C0F0 8005B4F0 03C42021 */   addu      $a0, $fp, $a0
/* 5C0F4 8005B4F4 0C026259 */  jal        passToMalloc
/* 5C0F8 8005B4F8 2404007C */   addiu     $a0, $zero, 0x7c
/* 5C0FC 8005B4FC 00402021 */  addu       $a0, $v0, $zero
/* 5C100 8005B500 3C05800E */  lui        $a1, %hi(D_800DEE70)
/* 5C104 8005B504 24A5EE70 */  addiu      $a1, $a1, %lo(D_800DEE70)
/* 5C108 8005B508 0C02DFC8 */  jal        widgetcliptext_init
/* 5C10C 8005B50C 24060190 */   addiu     $a2, $zero, 0x190
/* 5C110 8005B510 8FC4007C */  lw         $a0, 0x7c($fp)
/* 5C114 8005B514 0C02ED01 */  jal        journal_widget_link
/* 5C118 8005B518 00402821 */   addu      $a1, $v0, $zero
/* 5C11C 8005B51C 02402821 */  addu       $a1, $s2, $zero
/* 5C120 8005B520 2406002A */  addiu      $a2, $zero, 0x2a
/* 5C124 8005B524 8FC2007C */  lw         $v0, 0x7c($fp)
/* 5C128 8005B528 92430000 */  lbu        $v1, ($s2)
/* 5C12C 8005B52C 1466000D */  bne        $v1, $a2, .L8005B564
/* 5C130 8005B530 8C550040 */   lw        $s5, 0x40($v0)
/* 5C134 8005B534 92420001 */  lbu        $v0, 1($s2)
/* 5C138 8005B538 5446000B */  bnel       $v0, $a2, .L8005B568
/* 5C13C 8005B53C 24A50001 */   addiu     $a1, $a1, 1
/* 5C140 8005B540 92420002 */  lbu        $v0, 2($s2)
/* 5C144 8005B544 54460008 */  bnel       $v0, $a2, .L8005B568
/* 5C148 8005B548 24A50001 */   addiu     $a1, $a1, 1
/* 5C14C 8005B54C 92420003 */  lbu        $v0, 3($s2)
/* 5C150 8005B550 54460005 */  bnel       $v0, $a2, .L8005B568
/* 5C154 8005B554 24A50001 */   addiu     $a1, $a1, 1
/* 5C158 8005B558 92420004 */  lbu        $v0, 4($s2)
/* 5C15C 8005B55C 10460012 */  beq        $v0, $a2, .L8005B5A8
/* 5C160 8005B560 00009821 */   addu      $s3, $zero, $zero
.L8005B564:
/* 5C164 8005B564 24A50001 */  addiu      $a1, $a1, 1
.L8005B568:
/* 5C168 8005B568 90A30000 */  lbu        $v1, ($a1)
/* 5C16C 8005B56C 1466FFFD */  bne        $v1, $a2, .L8005B564
/* 5C170 8005B570 26D60001 */   addiu     $s6, $s6, 1
/* 5C174 8005B574 90A20001 */  lbu        $v0, 1($a1)
/* 5C178 8005B578 5443FFFB */  bnel       $v0, $v1, .L8005B568
/* 5C17C 8005B57C 24A50001 */   addiu     $a1, $a1, 1
/* 5C180 8005B580 90A30002 */  lbu        $v1, 2($a1)
/* 5C184 8005B584 5462FFF8 */  bnel       $v1, $v0, .L8005B568
/* 5C188 8005B588 24A50001 */   addiu     $a1, $a1, 1
/* 5C18C 8005B58C 90A40003 */  lbu        $a0, 3($a1)
/* 5C190 8005B590 5483FFF5 */  bnel       $a0, $v1, .L8005B568
/* 5C194 8005B594 24A50001 */   addiu     $a1, $a1, 1
/* 5C198 8005B598 90A20004 */  lbu        $v0, 4($a1)
/* 5C19C 8005B59C 1444FFF2 */  bne        $v0, $a0, .L8005B568
/* 5C1A0 8005B5A0 24A50001 */   addiu     $a1, $a1, 1
/* 5C1A4 8005B5A4 00009821 */  addu       $s3, $zero, $zero
.L8005B5A8:
/* 5C1A8 8005B5A8 12C0003B */  beqz       $s6, .L8005B698
/* 5C1AC 8005B5AC 00008821 */   addu      $s1, $zero, $zero
/* 5C1B0 8005B5B0 3C02800F */  lui        $v0, %hi(gGlobalsText)
/* 5C1B4 8005B5B4 24578920 */  addiu      $s7, $v0, %lo(gGlobalsText)
.L8005B5B8:
/* 5C1B8 8005B5B8 02514021 */  addu       $t0, $s2, $s1
/* 5C1BC 8005B5BC 26310001 */  addiu      $s1, $s1, 1
/* 5C1C0 8005B5C0 02513821 */  addu       $a3, $s2, $s1
/* 5C1C4 8005B5C4 26310001 */  addiu      $s1, $s1, 1
/* 5C1C8 8005B5C8 27A40018 */  addiu      $a0, $sp, 0x18
/* 5C1CC 8005B5CC 00002821 */  addu       $a1, $zero, $zero
/* 5C1D0 8005B5D0 24062000 */  addiu      $a2, $zero, 0x2000
/* 5C1D4 8005B5D4 91020000 */  lbu        $v0, ($t0)
/* 5C1D8 8005B5D8 90E30000 */  lbu        $v1, ($a3)
/* 5C1DC 8005B5DC 00028200 */  sll        $s0, $v0, 8
/* 5C1E0 8005B5E0 0C026380 */  jal        Calloc
/* 5C1E4 8005B5E4 00708025 */   or        $s0, $v1, $s0
/* 5C1E8 8005B5E8 00003021 */  addu       $a2, $zero, $zero
/* 5C1EC 8005B5EC 1200000B */  beqz       $s0, .L8005B61C
/* 5C1F0 8005B5F0 26740001 */   addiu     $s4, $s3, 1
/* 5C1F4 8005B5F4 27A70018 */  addiu      $a3, $sp, 0x18
.L8005B5F8:
/* 5C1F8 8005B5F8 00E62821 */  addu       $a1, $a3, $a2
/* 5C1FC 8005B5FC 24C20001 */  addiu      $v0, $a2, 1
/* 5C200 8005B600 3046FFFF */  andi       $a2, $v0, 0xffff
/* 5C204 8005B604 02511821 */  addu       $v1, $s2, $s1
/* 5C208 8005B608 26310001 */  addiu      $s1, $s1, 1
/* 5C20C 8005B60C 90640000 */  lbu        $a0, ($v1)
/* 5C210 8005B610 00D0102B */  sltu       $v0, $a2, $s0
/* 5C214 8005B614 1440FFF8 */  bnez       $v0, .L8005B5F8
/* 5C218 8005B618 A0A40000 */   sb        $a0, ($a1)
.L8005B61C:
/* 5C21C 8005B61C 27A40018 */  addiu      $a0, $sp, 0x18
/* 5C220 8005B620 00002821 */  addu       $a1, $zero, $zero
/* 5C224 8005B624 00003021 */  addu       $a2, $zero, $zero
/* 5C228 8005B628 00103C00 */  sll        $a3, $s0, 0x10
/* 5C22C 8005B62C 0C035669 */  jal        decrypt_string
/* 5C230 8005B630 00073C03 */   sra       $a3, $a3, 0x10
/* 5C234 8005B634 03C02021 */  addu       $a0, $fp, $zero
/* 5C238 8005B638 0C016CC7 */  jal        func_with_journal_flag
/* 5C23C 8005B63C 27A50018 */   addiu     $a1, $sp, 0x18
/* 5C240 8005B640 10400012 */  beqz       $v0, .L8005B68C
/* 5C244 8005B644 8FA22044 */   lw        $v0, 0x2044($sp)
/* 5C248 8005B648 2404FFFF */  addiu      $a0, $zero, -1
/* 5C24C 8005B64C 50440010 */  beql       $v0, $a0, .L8005B690
/* 5C250 8005B650 0236102B */   sltu      $v0, $s1, $s6
/* 5C254 8005B654 56620007 */  bnel       $s3, $v0, .L8005B674
/* 5C258 8005B658 02E02021 */   addu      $a0, $s7, $zero
/* 5C25C 8005B65C 92A20012 */  lbu        $v0, 0x12($s5)
/* 5C260 8005B660 3C03800F */  lui        $v1, %hi(newestJournal)
/* 5C264 8005B664 2442FFFF */  addiu      $v0, $v0, -1
/* 5C268 8005B668 A2A20011 */  sb         $v0, 0x11($s5)
/* 5C26C 8005B66C A4649A9C */  sh         $a0, %lo(newestJournal)($v1)
/* 5C270 8005B670 02E02021 */  addu       $a0, $s7, $zero
.L8005B674:
/* 5C274 8005B674 3C02800E */  lui        $v0, %hi(D_800DEEB8)
/* 5C278 8005B678 2445EEB8 */  addiu      $a1, $v0, %lo(D_800DEEB8)
/* 5C27C 8005B67C 0C0333AC */  jal        sprintf
/* 5C280 8005B680 02603021 */   addu      $a2, $s3, $zero
/* 5C284 8005B684 0C00B6B8 */  jal        debug_queue
/* 5C288 8005B688 02E02021 */   addu      $a0, $s7, $zero
.L8005B68C:
/* 5C28C 8005B68C 0236102B */  sltu       $v0, $s1, $s6
.L8005B690:
/* 5C290 8005B690 1440FFC9 */  bnez       $v0, .L8005B5B8
/* 5C294 8005B694 3293FFFF */   andi      $s3, $s4, 0xffff
.L8005B698:
/* 5C298 8005B698 02402021 */  addu       $a0, $s2, $zero
/* 5C29C 8005B69C 3C02800E */  lui        $v0, %hi(D_800DEE74)
/* 5C2A0 8005B6A0 2445EE74 */  addiu      $a1, $v0, %lo(D_800DEE74)
/* 5C2A4 8005B6A4 0C02600C */  jal        Free
/* 5C2A8 8005B6A8 24060132 */   addiu     $a2, $zero, 0x132
/* 5C2AC 8005B6AC 8FBF203C */  lw         $ra, 0x203c($sp)
/* 5C2B0 8005B6B0 8FBE2038 */  lw         $fp, 0x2038($sp)
/* 5C2B4 8005B6B4 8FB72034 */  lw         $s7, 0x2034($sp)
/* 5C2B8 8005B6B8 8FB62030 */  lw         $s6, 0x2030($sp)
/* 5C2BC 8005B6BC 8FB5202C */  lw         $s5, 0x202c($sp)
/* 5C2C0 8005B6C0 8FB42028 */  lw         $s4, 0x2028($sp)
/* 5C2C4 8005B6C4 8FB32024 */  lw         $s3, 0x2024($sp)
/* 5C2C8 8005B6C8 8FB22020 */  lw         $s2, 0x2020($sp)
/* 5C2CC 8005B6CC 8FB1201C */  lw         $s1, 0x201c($sp)
/* 5C2D0 8005B6D0 8FB02018 */  lw         $s0, 0x2018($sp)
/* 5C2D4 8005B6D4 03E00008 */  jr         $ra
/* 5C2D8 8005B6D8 27BD2040 */   addiu     $sp, $sp, 0x2040

glabel func_8005B6DC
/* 5C2DC 8005B6DC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5C2E0 8005B6E0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5C2E4 8005B6E4 8C830088 */  lw         $v1, 0x88($a0)
/* 5C2E8 8005B6E8 9082005B */  lbu        $v0, 0x5b($a0)
/* 5C2EC 8005B6EC A062005B */  sb         $v0, 0x5b($v1)
/* 5C2F0 8005B6F0 8C85007C */  lw         $a1, 0x7c($a0)
/* 5C2F4 8005B6F4 9082005B */  lbu        $v0, 0x5b($a0)
/* 5C2F8 8005B6F8 A0A2005B */  sb         $v0, 0x5b($a1)
/* 5C2FC 8005B6FC 8C83008C */  lw         $v1, 0x8c($a0)
/* 5C300 8005B700 9082005B */  lbu        $v0, 0x5b($a0)
/* 5C304 8005B704 0C02DE51 */  jal        func_800B7944
/* 5C308 8005B708 A062005B */   sb        $v0, 0x5b($v1)
/* 5C30C 8005B70C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5C310 8005B710 03E00008 */  jr         $ra
/* 5C314 8005B714 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_control_Up_Down
/* 5C318 8005B718 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5C31C 8005B71C AFB00010 */  sw         $s0, 0x10($sp)
/* 5C320 8005B720 00808021 */  addu       $s0, $a0, $zero
/* 5C324 8005B724 AFB10014 */  sw         $s1, 0x14($sp)
/* 5C328 8005B728 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5C32C 8005B72C 0C02DD7A */  jal        widget_control
/* 5C330 8005B730 00A08821 */   addu      $s1, $a1, $zero
/* 5C334 8005B734 14400016 */  bnez       $v0, .L8005B790
/* 5C338 8005B738 8FBF0018 */   lw        $ra, 0x18($sp)
/* 5C33C 8005B73C 3C020008 */  lui        $v0, 8
/* 5C340 8005B740 8E25000C */  lw         $a1, 0xc($s1)
/* 5C344 8005B744 34420800 */  ori        $v0, $v0, 0x800
/* 5C348 8005B748 00A21024 */  and        $v0, $a1, $v0
/* 5C34C 8005B74C 10400005 */  beqz       $v0, .L8005B764
/* 5C350 8005B750 3C020004 */   lui       $v0, 4
/* 5C354 8005B754 8E030078 */  lw         $v1, 0x78($s0)
/* 5C358 8005B758 84640058 */  lh         $a0, 0x58($v1)
/* 5C35C 8005B75C 08016DE1 */  j          .L8005B784
/* 5C360 8005B760 8C62005C */   lw        $v0, 0x5c($v1)
.L8005B764:
/* 5C364 8005B764 34420400 */  ori        $v0, $v0, 0x400
/* 5C368 8005B768 00A21024 */  and        $v0, $a1, $v0
/* 5C36C 8005B76C 54400003 */  bnel       $v0, $zero, .L8005B77C
/* 5C370 8005B770 8E030078 */   lw        $v1, 0x78($s0)
/* 5C374 8005B774 08016DE3 */  j          .L8005B78C
/* 5C378 8005B778 00001021 */   addu      $v0, $zero, $zero
.L8005B77C:
/* 5C37C 8005B77C 84640060 */  lh         $a0, 0x60($v1)
/* 5C380 8005B780 8C620064 */  lw         $v0, 0x64($v1)
.L8005B784:
/* 5C384 8005B784 0040F809 */  jalr       $v0
/* 5C388 8005B788 02042021 */   addu      $a0, $s0, $a0
.L8005B78C:
/* 5C38C 8005B78C 8FBF0018 */  lw         $ra, 0x18($sp)
.L8005B790:
/* 5C390 8005B790 8FB10014 */  lw         $s1, 0x14($sp)
/* 5C394 8005B794 8FB00010 */  lw         $s0, 0x10($sp)
/* 5C398 8005B798 03E00008 */  jr         $ra
/* 5C39C 8005B79C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8005B7A0
/* 5C3A0 8005B7A0 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 5C3A4 8005B7A4 AFB00020 */  sw         $s0, 0x20($sp)
/* 5C3A8 8005B7A8 00808021 */  addu       $s0, $a0, $zero
/* 5C3AC 8005B7AC 00063400 */  sll        $a2, $a2, 0x10
/* 5C3B0 8005B7B0 AFB10024 */  sw         $s1, 0x24($sp)
/* 5C3B4 8005B7B4 00068C03 */  sra        $s1, $a2, 0x10
/* 5C3B8 8005B7B8 02203021 */  addu       $a2, $s1, $zero
/* 5C3BC 8005B7BC AFB3002C */  sw         $s3, 0x2c($sp)
/* 5C3C0 8005B7C0 87B30062 */  lh         $s3, 0x62($sp)
/* 5C3C4 8005B7C4 00073C00 */  sll        $a3, $a3, 0x10
/* 5C3C8 8005B7C8 AFB20028 */  sw         $s2, 0x28($sp)
/* 5C3CC 8005B7CC 00079403 */  sra        $s2, $a3, 0x10
/* 5C3D0 8005B7D0 AFB40030 */  sw         $s4, 0x30($sp)
/* 5C3D4 8005B7D4 87B40066 */  lh         $s4, 0x66($sp)
/* 5C3D8 8005B7D8 02403821 */  addu       $a3, $s2, $zero
/* 5C3DC 8005B7DC AFBF0044 */  sw         $ra, 0x44($sp)
/* 5C3E0 8005B7E0 AFBE0040 */  sw         $fp, 0x40($sp)
/* 5C3E4 8005B7E4 AFB7003C */  sw         $s7, 0x3c($sp)
/* 5C3E8 8005B7E8 AFB60038 */  sw         $s6, 0x38($sp)
/* 5C3EC 8005B7EC AFB50034 */  sw         $s5, 0x34($sp)
/* 5C3F0 8005B7F0 F7B40048 */  sdc1       $f20, 0x48($sp)
/* 5C3F4 8005B7F4 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C3F8 8005B7F8 0C02DE14 */  jal        widget_func_8
/* 5C3FC 8005B7FC AFB40014 */   sw        $s4, 0x14($sp)
/* 5C400 8005B800 00402821 */  addu       $a1, $v0, $zero
/* 5C404 8005B804 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C408 8005B808 3C01800E */  lui        $at, %hi(D_800DEED0)
/* 5C40C 8005B80C D422EED0 */  ldc1       $f2, %lo(D_800DEED0)($at)
/* 5C410 8005B810 9095005B */  lbu        $s5, 0x5b($a0)
/* 5C414 8005B814 849E0064 */  lh         $fp, 0x64($a0)
/* 5C418 8005B818 2402003E */  addiu      $v0, $zero, 0x3e
/* 5C41C 8005B81C A4820064 */  sh         $v0, 0x64($a0)
/* 5C420 8005B820 84820066 */  lh         $v0, 0x66($a0)
/* 5C424 8005B824 44950000 */  mtc1       $s5, $f0
/* 5C428 8005B828 46800021 */  cvt.d.w    $f0, $f0
/* 5C42C 8005B82C 46220002 */  mul.d      $f0, $f0, $f2
/* 5C430 8005B830 3C01800E */  lui        $at, %hi(D_800DEED8)
/* 5C434 8005B834 D422EED8 */  ldc1       $f2, %lo(D_800DEED8)($at)
/* 5C438 8005B838 AFA20018 */  sw         $v0, 0x18($sp)
/* 5C43C 8005B83C 84970068 */  lh         $s7, 0x68($a0)
/* 5C440 8005B840 8496006A */  lh         $s6, 0x6a($a0)
/* 5C444 8005B844 240200F5 */  addiu      $v0, $zero, 0xf5
/* 5C448 8005B848 4620103E */  c.le.d     $f2, $f0
/* 5C44C 8005B84C 00000000 */  nop
/* 5C450 8005B850 45010005 */  bc1t       .L8005B868
/* 5C454 8005B854 A4820066 */   sh        $v0, 0x66($a0)
/* 5C458 8005B858 4620008D */  trunc.w.d  $f2, $f0
/* 5C45C 8005B85C 44031000 */  mfc1       $v1, $f2
/* 5C460 8005B860 08016E20 */  j          .L8005B880
/* 5C464 8005B864 A083005B */   sb        $v1, 0x5b($a0)
.L8005B868:
/* 5C468 8005B868 46220001 */  sub.d      $f0, $f0, $f2
/* 5C46C 8005B86C 4620008D */  trunc.w.d  $f2, $f0
/* 5C470 8005B870 44031000 */  mfc1       $v1, $f2
/* 5C474 8005B874 3C028000 */  lui        $v0, 0x8000
/* 5C478 8005B878 00621825 */  or         $v1, $v1, $v0
/* 5C47C 8005B87C A083005B */  sb         $v1, 0x5b($a0)
.L8005B880:
/* 5C480 8005B880 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C484 8005B884 02203021 */  addu       $a2, $s1, $zero
/* 5C488 8005B888 8C830078 */  lw         $v1, 0x78($a0)
/* 5C48C 8005B88C 24020025 */  addiu      $v0, $zero, 0x25
/* 5C490 8005B890 A4820068 */  sh         $v0, 0x68($a0)
/* 5C494 8005B894 24020028 */  addiu      $v0, $zero, 0x28
/* 5C498 8005B898 A482006A */  sh         $v0, 0x6a($a0)
/* 5C49C 8005B89C 84680040 */  lh         $t0, 0x40($v1)
/* 5C4A0 8005B8A0 02403821 */  addu       $a3, $s2, $zero
/* 5C4A4 8005B8A4 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C4A8 8005B8A8 AFB40014 */  sw         $s4, 0x14($sp)
/* 5C4AC 8005B8AC 8C620044 */  lw         $v0, 0x44($v1)
/* 5C4B0 8005B8B0 0040F809 */  jalr       $v0
/* 5C4B4 8005B8B4 00882021 */   addu      $a0, $a0, $t0
/* 5C4B8 8005B8B8 3C01800E */  lui        $at, %hi(D_800DEEE0)
/* 5C4BC 8005B8BC D420EEE0 */  ldc1       $f0, %lo(D_800DEEE0)($at)
/* 5C4C0 8005B8C0 44951000 */  mtc1       $s5, $f2
/* 5C4C4 8005B8C4 468010A1 */  cvt.d.w    $f2, $f2
/* 5C4C8 8005B8C8 46201002 */  mul.d      $f0, $f2, $f0
/* 5C4CC 8005B8CC 00402821 */  addu       $a1, $v0, $zero
/* 5C4D0 8005B8D0 46201506 */  mov.d      $f20, $f2
/* 5C4D4 8005B8D4 3C01800E */  lui        $at, %hi(D_800DEEE8)
/* 5C4D8 8005B8D8 D424EEE8 */  ldc1       $f4, %lo(D_800DEEE8)($at)
/* 5C4DC 8005B8DC 4620203E */  c.le.d     $f4, $f0
/* 5C4E0 8005B8E0 00000000 */  nop
/* 5C4E4 8005B8E4 45010005 */  bc1t       .L8005B8FC
/* 5C4E8 8005B8E8 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C4EC 8005B8EC 4620008D */  trunc.w.d  $f2, $f0
/* 5C4F0 8005B8F0 44031000 */  mfc1       $v1, $f2
/* 5C4F4 8005B8F4 08016E45 */  j          .L8005B914
/* 5C4F8 8005B8F8 A083005B */   sb        $v1, 0x5b($a0)
.L8005B8FC:
/* 5C4FC 8005B8FC 46240001 */  sub.d      $f0, $f0, $f4
/* 5C500 8005B900 4620008D */  trunc.w.d  $f2, $f0
/* 5C504 8005B904 44031000 */  mfc1       $v1, $f2
/* 5C508 8005B908 3C028000 */  lui        $v0, 0x8000
/* 5C50C 8005B90C 00621825 */  or         $v1, $v1, $v0
/* 5C510 8005B910 A083005B */  sb         $v1, 0x5b($a0)
.L8005B914:
/* 5C514 8005B914 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C518 8005B918 02203021 */  addu       $a2, $s1, $zero
/* 5C51C 8005B91C 8C830078 */  lw         $v1, 0x78($a0)
/* 5C520 8005B920 24020023 */  addiu      $v0, $zero, 0x23
/* 5C524 8005B924 A4820068 */  sh         $v0, 0x68($a0)
/* 5C528 8005B928 24020025 */  addiu      $v0, $zero, 0x25
/* 5C52C 8005B92C A482006A */  sh         $v0, 0x6a($a0)
/* 5C530 8005B930 84680040 */  lh         $t0, 0x40($v1)
/* 5C534 8005B934 02403821 */  addu       $a3, $s2, $zero
/* 5C538 8005B938 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C53C 8005B93C AFB40014 */  sw         $s4, 0x14($sp)
/* 5C540 8005B940 8C620044 */  lw         $v0, 0x44($v1)
/* 5C544 8005B944 0040F809 */  jalr       $v0
/* 5C548 8005B948 00882021 */   addu      $a0, $a0, $t0
/* 5C54C 8005B94C 3C01800E */  lui        $at, %hi(D_800DEEF0)
/* 5C550 8005B950 D420EEF0 */  ldc1       $f0, %lo(D_800DEEF0)($at)
/* 5C554 8005B954 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C558 8005B958 00402821 */  addu       $a1, $v0, $zero
/* 5C55C 8005B95C 3C01800E */  lui        $at, %hi(D_800DEEF8)
/* 5C560 8005B960 D422EEF8 */  ldc1       $f2, %lo(D_800DEEF8)($at)
/* 5C564 8005B964 4620103E */  c.le.d     $f2, $f0
/* 5C568 8005B968 00000000 */  nop
/* 5C56C 8005B96C 45010005 */  bc1t       .L8005B984
/* 5C570 8005B970 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C574 8005B974 4620008D */  trunc.w.d  $f2, $f0
/* 5C578 8005B978 44031000 */  mfc1       $v1, $f2
/* 5C57C 8005B97C 08016E67 */  j          .L8005B99C
/* 5C580 8005B980 A083005B */   sb        $v1, 0x5b($a0)
.L8005B984:
/* 5C584 8005B984 46220001 */  sub.d      $f0, $f0, $f2
/* 5C588 8005B988 4620008D */  trunc.w.d  $f2, $f0
/* 5C58C 8005B98C 44031000 */  mfc1       $v1, $f2
/* 5C590 8005B990 3C028000 */  lui        $v0, 0x8000
/* 5C594 8005B994 00621825 */  or         $v1, $v1, $v0
/* 5C598 8005B998 A083005B */  sb         $v1, 0x5b($a0)
.L8005B99C:
/* 5C59C 8005B99C 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C5A0 8005B9A0 02203021 */  addu       $a2, $s1, $zero
/* 5C5A4 8005B9A4 8C830078 */  lw         $v1, 0x78($a0)
/* 5C5A8 8005B9A8 24020021 */  addiu      $v0, $zero, 0x21
/* 5C5AC 8005B9AC A4820068 */  sh         $v0, 0x68($a0)
/* 5C5B0 8005B9B0 24020023 */  addiu      $v0, $zero, 0x23
/* 5C5B4 8005B9B4 A482006A */  sh         $v0, 0x6a($a0)
/* 5C5B8 8005B9B8 84680040 */  lh         $t0, 0x40($v1)
/* 5C5BC 8005B9BC 02403821 */  addu       $a3, $s2, $zero
/* 5C5C0 8005B9C0 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C5C4 8005B9C4 AFB40014 */  sw         $s4, 0x14($sp)
/* 5C5C8 8005B9C8 8C620044 */  lw         $v0, 0x44($v1)
/* 5C5CC 8005B9CC 0040F809 */  jalr       $v0
/* 5C5D0 8005B9D0 00882021 */   addu      $a0, $a0, $t0
/* 5C5D4 8005B9D4 3C01800E */  lui        $at, %hi(D_800DEF00)
/* 5C5D8 8005B9D8 D420EF00 */  ldc1       $f0, %lo(D_800DEF00)($at)
/* 5C5DC 8005B9DC 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C5E0 8005B9E0 00402821 */  addu       $a1, $v0, $zero
/* 5C5E4 8005B9E4 3C01800E */  lui        $at, %hi(D_800DEF08)
/* 5C5E8 8005B9E8 D422EF08 */  ldc1       $f2, %lo(D_800DEF08)($at)
/* 5C5EC 8005B9EC 4620103E */  c.le.d     $f2, $f0
/* 5C5F0 8005B9F0 00000000 */  nop
/* 5C5F4 8005B9F4 45010005 */  bc1t       .L8005BA0C
/* 5C5F8 8005B9F8 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C5FC 8005B9FC 4620008D */  trunc.w.d  $f2, $f0
/* 5C600 8005BA00 44031000 */  mfc1       $v1, $f2
/* 5C604 8005BA04 08016E89 */  j          .L8005BA24
/* 5C608 8005BA08 A083005B */   sb        $v1, 0x5b($a0)
.L8005BA0C:
/* 5C60C 8005BA0C 46220001 */  sub.d      $f0, $f0, $f2
/* 5C610 8005BA10 4620008D */  trunc.w.d  $f2, $f0
/* 5C614 8005BA14 44031000 */  mfc1       $v1, $f2
/* 5C618 8005BA18 3C028000 */  lui        $v0, 0x8000
/* 5C61C 8005BA1C 00621825 */  or         $v1, $v1, $v0
/* 5C620 8005BA20 A083005B */  sb         $v1, 0x5b($a0)
.L8005BA24:
/* 5C624 8005BA24 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C628 8005BA28 02203021 */  addu       $a2, $s1, $zero
/* 5C62C 8005BA2C 8C830078 */  lw         $v1, 0x78($a0)
/* 5C630 8005BA30 2402001C */  addiu      $v0, $zero, 0x1c
/* 5C634 8005BA34 A4820068 */  sh         $v0, 0x68($a0)
/* 5C638 8005BA38 24020021 */  addiu      $v0, $zero, 0x21
/* 5C63C 8005BA3C A482006A */  sh         $v0, 0x6a($a0)
/* 5C640 8005BA40 84680040 */  lh         $t0, 0x40($v1)
/* 5C644 8005BA44 02403821 */  addu       $a3, $s2, $zero
/* 5C648 8005BA48 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C64C 8005BA4C AFB40014 */  sw         $s4, 0x14($sp)
/* 5C650 8005BA50 8C620044 */  lw         $v0, 0x44($v1)
/* 5C654 8005BA54 0040F809 */  jalr       $v0
/* 5C658 8005BA58 00882021 */   addu      $a0, $a0, $t0
/* 5C65C 8005BA5C 3C01800E */  lui        $at, %hi(D_800DEF10)
/* 5C660 8005BA60 D420EF10 */  ldc1       $f0, %lo(D_800DEF10)($at)
/* 5C664 8005BA64 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C668 8005BA68 00402821 */  addu       $a1, $v0, $zero
/* 5C66C 8005BA6C 3C01800E */  lui        $at, %hi(D_800DEF18)
/* 5C670 8005BA70 D422EF18 */  ldc1       $f2, %lo(D_800DEF18)($at)
/* 5C674 8005BA74 4620103E */  c.le.d     $f2, $f0
/* 5C678 8005BA78 00000000 */  nop
/* 5C67C 8005BA7C 45010005 */  bc1t       .L8005BA94
/* 5C680 8005BA80 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C684 8005BA84 4620008D */  trunc.w.d  $f2, $f0
/* 5C688 8005BA88 44031000 */  mfc1       $v1, $f2
/* 5C68C 8005BA8C 08016EAB */  j          .L8005BAAC
/* 5C690 8005BA90 A083005B */   sb        $v1, 0x5b($a0)
.L8005BA94:
/* 5C694 8005BA94 46220001 */  sub.d      $f0, $f0, $f2
/* 5C698 8005BA98 4620008D */  trunc.w.d  $f2, $f0
/* 5C69C 8005BA9C 44031000 */  mfc1       $v1, $f2
/* 5C6A0 8005BAA0 3C028000 */  lui        $v0, 0x8000
/* 5C6A4 8005BAA4 00621825 */  or         $v1, $v1, $v0
/* 5C6A8 8005BAA8 A083005B */  sb         $v1, 0x5b($a0)
.L8005BAAC:
/* 5C6AC 8005BAAC 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C6B0 8005BAB0 02203021 */  addu       $a2, $s1, $zero
/* 5C6B4 8005BAB4 8C830078 */  lw         $v1, 0x78($a0)
/* 5C6B8 8005BAB8 240200D2 */  addiu      $v0, $zero, 0xd2
/* 5C6BC 8005BABC A4820068 */  sh         $v0, 0x68($a0)
/* 5C6C0 8005BAC0 240200D5 */  addiu      $v0, $zero, 0xd5
/* 5C6C4 8005BAC4 A482006A */  sh         $v0, 0x6a($a0)
/* 5C6C8 8005BAC8 84680040 */  lh         $t0, 0x40($v1)
/* 5C6CC 8005BACC 02403821 */  addu       $a3, $s2, $zero
/* 5C6D0 8005BAD0 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C6D4 8005BAD4 AFB40014 */  sw         $s4, 0x14($sp)
/* 5C6D8 8005BAD8 8C620044 */  lw         $v0, 0x44($v1)
/* 5C6DC 8005BADC 0040F809 */  jalr       $v0
/* 5C6E0 8005BAE0 00882021 */   addu      $a0, $a0, $t0
/* 5C6E4 8005BAE4 3C01800E */  lui        $at, %hi(D_800DEF20)
/* 5C6E8 8005BAE8 D420EF20 */  ldc1       $f0, %lo(D_800DEF20)($at)
/* 5C6EC 8005BAEC 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C6F0 8005BAF0 00402821 */  addu       $a1, $v0, $zero
/* 5C6F4 8005BAF4 3C01800E */  lui        $at, %hi(D_800DEF28)
/* 5C6F8 8005BAF8 D422EF28 */  ldc1       $f2, %lo(D_800DEF28)($at)
/* 5C6FC 8005BAFC 4620103E */  c.le.d     $f2, $f0
/* 5C700 8005BB00 00000000 */  nop
/* 5C704 8005BB04 45010005 */  bc1t       .L8005BB1C
/* 5C708 8005BB08 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C70C 8005BB0C 4620008D */  trunc.w.d  $f2, $f0
/* 5C710 8005BB10 44031000 */  mfc1       $v1, $f2
/* 5C714 8005BB14 08016ECD */  j          .L8005BB34
/* 5C718 8005BB18 A083005B */   sb        $v1, 0x5b($a0)
.L8005BB1C:
/* 5C71C 8005BB1C 46220001 */  sub.d      $f0, $f0, $f2
/* 5C720 8005BB20 4620008D */  trunc.w.d  $f2, $f0
/* 5C724 8005BB24 44031000 */  mfc1       $v1, $f2
/* 5C728 8005BB28 3C028000 */  lui        $v0, 0x8000
/* 5C72C 8005BB2C 00621825 */  or         $v1, $v1, $v0
/* 5C730 8005BB30 A083005B */  sb         $v1, 0x5b($a0)
.L8005BB34:
/* 5C734 8005BB34 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C738 8005BB38 02203021 */  addu       $a2, $s1, $zero
/* 5C73C 8005BB3C 8C830078 */  lw         $v1, 0x78($a0)
/* 5C740 8005BB40 240200D5 */  addiu      $v0, $zero, 0xd5
/* 5C744 8005BB44 A4820068 */  sh         $v0, 0x68($a0)
/* 5C748 8005BB48 240200D7 */  addiu      $v0, $zero, 0xd7
/* 5C74C 8005BB4C A482006A */  sh         $v0, 0x6a($a0)
/* 5C750 8005BB50 84680040 */  lh         $t0, 0x40($v1)
/* 5C754 8005BB54 02403821 */  addu       $a3, $s2, $zero
/* 5C758 8005BB58 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C75C 8005BB5C AFB40014 */  sw         $s4, 0x14($sp)
/* 5C760 8005BB60 8C620044 */  lw         $v0, 0x44($v1)
/* 5C764 8005BB64 0040F809 */  jalr       $v0
/* 5C768 8005BB68 00882021 */   addu      $a0, $a0, $t0
/* 5C76C 8005BB6C 3C01800E */  lui        $at, %hi(D_800DEF30)
/* 5C770 8005BB70 D420EF30 */  ldc1       $f0, %lo(D_800DEF30)($at)
/* 5C774 8005BB74 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C778 8005BB78 00402821 */  addu       $a1, $v0, $zero
/* 5C77C 8005BB7C 3C01800E */  lui        $at, %hi(D_800DEF38)
/* 5C780 8005BB80 D422EF38 */  ldc1       $f2, %lo(D_800DEF38)($at)
/* 5C784 8005BB84 4620103E */  c.le.d     $f2, $f0
/* 5C788 8005BB88 00000000 */  nop
/* 5C78C 8005BB8C 45010005 */  bc1t       .L8005BBA4
/* 5C790 8005BB90 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C794 8005BB94 4620008D */  trunc.w.d  $f2, $f0
/* 5C798 8005BB98 44031000 */  mfc1       $v1, $f2
/* 5C79C 8005BB9C 08016EEF */  j          .L8005BBBC
/* 5C7A0 8005BBA0 A083005B */   sb        $v1, 0x5b($a0)
.L8005BBA4:
/* 5C7A4 8005BBA4 46220001 */  sub.d      $f0, $f0, $f2
/* 5C7A8 8005BBA8 4620008D */  trunc.w.d  $f2, $f0
/* 5C7AC 8005BBAC 44031000 */  mfc1       $v1, $f2
/* 5C7B0 8005BBB0 3C028000 */  lui        $v0, 0x8000
/* 5C7B4 8005BBB4 00621825 */  or         $v1, $v1, $v0
/* 5C7B8 8005BBB8 A083005B */  sb         $v1, 0x5b($a0)
.L8005BBBC:
/* 5C7BC 8005BBBC 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C7C0 8005BBC0 02203021 */  addu       $a2, $s1, $zero
/* 5C7C4 8005BBC4 8C830078 */  lw         $v1, 0x78($a0)
/* 5C7C8 8005BBC8 240200D7 */  addiu      $v0, $zero, 0xd7
/* 5C7CC 8005BBCC A4820068 */  sh         $v0, 0x68($a0)
/* 5C7D0 8005BBD0 240200D9 */  addiu      $v0, $zero, 0xd9
/* 5C7D4 8005BBD4 A482006A */  sh         $v0, 0x6a($a0)
/* 5C7D8 8005BBD8 84680040 */  lh         $t0, 0x40($v1)
/* 5C7DC 8005BBDC 02403821 */  addu       $a3, $s2, $zero
/* 5C7E0 8005BBE0 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C7E4 8005BBE4 AFB40014 */  sw         $s4, 0x14($sp)
/* 5C7E8 8005BBE8 8C620044 */  lw         $v0, 0x44($v1)
/* 5C7EC 8005BBEC 0040F809 */  jalr       $v0
/* 5C7F0 8005BBF0 00882021 */   addu      $a0, $a0, $t0
/* 5C7F4 8005BBF4 3C01800E */  lui        $at, %hi(D_800DEF40)
/* 5C7F8 8005BBF8 D420EF40 */  ldc1       $f0, %lo(D_800DEF40)($at)
/* 5C7FC 8005BBFC 4620A002 */  mul.d      $f0, $f20, $f0
/* 5C800 8005BC00 00402821 */  addu       $a1, $v0, $zero
/* 5C804 8005BC04 3C01800E */  lui        $at, %hi(D_800DEF48)
/* 5C808 8005BC08 D422EF48 */  ldc1       $f2, %lo(D_800DEF48)($at)
/* 5C80C 8005BC0C 4620103E */  c.le.d     $f2, $f0
/* 5C810 8005BC10 00000000 */  nop
/* 5C814 8005BC14 45010005 */  bc1t       .L8005BC2C
/* 5C818 8005BC18 8E04008C */   lw        $a0, 0x8c($s0)
/* 5C81C 8005BC1C 4620008D */  trunc.w.d  $f2, $f0
/* 5C820 8005BC20 44031000 */  mfc1       $v1, $f2
/* 5C824 8005BC24 08016F11 */  j          .L8005BC44
/* 5C828 8005BC28 A083005B */   sb        $v1, 0x5b($a0)
.L8005BC2C:
/* 5C82C 8005BC2C 46220001 */  sub.d      $f0, $f0, $f2
/* 5C830 8005BC30 4620008D */  trunc.w.d  $f2, $f0
/* 5C834 8005BC34 44031000 */  mfc1       $v1, $f2
/* 5C838 8005BC38 3C028000 */  lui        $v0, 0x8000
/* 5C83C 8005BC3C 00621825 */  or         $v1, $v1, $v0
/* 5C840 8005BC40 A083005B */  sb         $v1, 0x5b($a0)
.L8005BC44:
/* 5C844 8005BC44 8E04008C */  lw         $a0, 0x8c($s0)
/* 5C848 8005BC48 02203021 */  addu       $a2, $s1, $zero
/* 5C84C 8005BC4C 8C830078 */  lw         $v1, 0x78($a0)
/* 5C850 8005BC50 240200D9 */  addiu      $v0, $zero, 0xd9
/* 5C854 8005BC54 A4820068 */  sh         $v0, 0x68($a0)
/* 5C858 8005BC58 240200DC */  addiu      $v0, $zero, 0xdc
/* 5C85C 8005BC5C A482006A */  sh         $v0, 0x6a($a0)
/* 5C860 8005BC60 84680040 */  lh         $t0, 0x40($v1)
/* 5C864 8005BC64 02403821 */  addu       $a3, $s2, $zero
/* 5C868 8005BC68 AFB30010 */  sw         $s3, 0x10($sp)
/* 5C86C 8005BC6C AFB40014 */  sw         $s4, 0x14($sp)
/* 5C870 8005BC70 8C620044 */  lw         $v0, 0x44($v1)
/* 5C874 8005BC74 0040F809 */  jalr       $v0
/* 5C878 8005BC78 00882021 */   addu      $a0, $a0, $t0
/* 5C87C 8005BC7C 8E03008C */  lw         $v1, 0x8c($s0)
/* 5C880 8005BC80 8FBF0044 */  lw         $ra, 0x44($sp)
/* 5C884 8005BC84 8FB40030 */  lw         $s4, 0x30($sp)
/* 5C888 8005BC88 8FB3002C */  lw         $s3, 0x2c($sp)
/* 5C88C 8005BC8C 8FB20028 */  lw         $s2, 0x28($sp)
/* 5C890 8005BC90 8FB10024 */  lw         $s1, 0x24($sp)
/* 5C894 8005BC94 8FB00020 */  lw         $s0, 0x20($sp)
/* 5C898 8005BC98 D7B40048 */  ldc1       $f20, 0x48($sp)
/* 5C89C 8005BC9C A47E0064 */  sh         $fp, 0x64($v1)
/* 5C8A0 8005BCA0 8FA40018 */  lw         $a0, 0x18($sp)
/* 5C8A4 8005BCA4 8FBE0040 */  lw         $fp, 0x40($sp)
/* 5C8A8 8005BCA8 A4770068 */  sh         $s7, 0x68($v1)
/* 5C8AC 8005BCAC 8FB7003C */  lw         $s7, 0x3c($sp)
/* 5C8B0 8005BCB0 A476006A */  sh         $s6, 0x6a($v1)
/* 5C8B4 8005BCB4 8FB60038 */  lw         $s6, 0x38($sp)
/* 5C8B8 8005BCB8 A075005B */  sb         $s5, 0x5b($v1)
/* 5C8BC 8005BCBC 8FB50034 */  lw         $s5, 0x34($sp)
/* 5C8C0 8005BCC0 A4640066 */  sh         $a0, 0x66($v1)
/* 5C8C4 8005BCC4 03E00008 */  jr         $ra
/* 5C8C8 8005BCC8 27BD0050 */   addiu     $sp, $sp, 0x50

glabel ret12_8005bccc
/* 5C8CC 8005BCCC 03E00008 */  jr         $ra
/* 5C8D0 8005BCD0 2402000C */   addiu     $v0, $zero, 0xc
/* 5C8D4 8005BCD4 00000000 */  nop
/* 5C8D8 8005BCD8 00000000 */  nop
/* 5C8DC 8005BCDC 00000000 */  nop
