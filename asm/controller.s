.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_controller_thread
/* 9B960 8009AD60 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9B964 8009AD64 AFB20020 */  sw         $s2, 0x20($sp)
/* 9B968 8009AD68 3C12800F */  lui        $s2, %hi(controller_thread_stack)
/* 9B96C 8009AD6C AFB00018 */  sw         $s0, 0x18($sp)
/* 9B970 8009AD70 26502E88 */  addiu      $s0, $s2, %lo(controller_thread_stack)
/* 9B974 8009AD74 AFBF0028 */  sw         $ra, 0x28($sp)
/* 9B978 8009AD78 AFB30024 */  sw         $s3, 0x24($sp)
/* 9B97C 8009AD7C AFB1001C */  sw         $s1, 0x1c($sp)
/* 9B980 8009AD80 AE040008 */  sw         $a0, 8($s0)
/* 9B984 8009AD84 24040448 */  addiu      $a0, $zero, 0x448
/* 9B988 8009AD88 A205021C */  sb         $a1, 0x21c($s0)
/* 9B98C 8009AD8C 3C05800E */  lui        $a1, %hi(D_800E2C30)
/* 9B990 8009AD90 24A52C30 */  addiu      $a1, $a1, %lo(D_800E2C30)
/* 9B994 8009AD94 30D300FF */  andi       $s3, $a2, 0xff
/* 9B998 8009AD98 240600C8 */  addiu      $a2, $zero, 0xc8
/* 9B99C 8009AD9C 0C025F9C */  jal        Malloc
/* 9B9A0 8009ADA0 30F100FF */   andi      $s1, $a3, 0xff
/* 9B9A4 8009ADA4 26100010 */  addiu      $s0, $s0, 0x10
/* 9B9A8 8009ADA8 02002021 */  addu       $a0, $s0, $zero
/* 9B9AC 8009ADAC 02202821 */  addu       $a1, $s1, $zero
/* 9B9B0 8009ADB0 3C06800A */  lui        $a2, %hi(controller_loop)
/* 9B9B4 8009ADB4 24C6ADF4 */  addiu      $a2, $a2, %lo(controller_loop)
/* 9B9B8 8009ADB8 AE422E88 */  sw         $v0, 0x2e88($s2)
/* 9B9BC 8009ADBC 24420448 */  addiu      $v0, $v0, 0x448
/* 9B9C0 8009ADC0 00003821 */  addu       $a3, $zero, $zero
/* 9B9C4 8009ADC4 AFA20010 */  sw         $v0, 0x10($sp)
/* 9B9C8 8009ADC8 0C02FBB0 */  jal        osCreateThread
/* 9B9CC 8009ADCC AFB30014 */   sw        $s3, 0x14($sp)
/* 9B9D0 8009ADD0 0C0334B8 */  jal        osStartThread
/* 9B9D4 8009ADD4 02002021 */   addu      $a0, $s0, $zero
/* 9B9D8 8009ADD8 8FBF0028 */  lw         $ra, 0x28($sp)
/* 9B9DC 8009ADDC 8FB30024 */  lw         $s3, 0x24($sp)
/* 9B9E0 8009ADE0 8FB20020 */  lw         $s2, 0x20($sp)
/* 9B9E4 8009ADE4 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9B9E8 8009ADE8 8FB00018 */  lw         $s0, 0x18($sp)
/* 9B9EC 8009ADEC 03E00008 */  jr         $ra
/* 9B9F0 8009ADF0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel controller_loop
/* 9B9F4 8009ADF4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9B9F8 8009ADF8 AFBF0030 */  sw         $ra, 0x30($sp)
/* 9B9FC 8009ADFC AFB5002C */  sw         $s5, 0x2c($sp)
/* 9BA00 8009AE00 AFB40028 */  sw         $s4, 0x28($sp)
/* 9BA04 8009AE04 AFB30024 */  sw         $s3, 0x24($sp)
/* 9BA08 8009AE08 AFB20020 */  sw         $s2, 0x20($sp)
/* 9BA0C 8009AE0C AFB1001C */  sw         $s1, 0x1c($sp)
/* 9BA10 8009AE10 0C026BB4 */  jal        init_controller_input_buffer
/* 9BA14 8009AE14 AFB00018 */   sw        $s0, 0x18($sp)
/* 9BA18 8009AE18 27B10010 */  addiu      $s1, $sp, 0x10
/* 9BA1C 8009AE1C 3C158000 */  lui        $s5, 0x8000
/* 9BA20 8009AE20 3C02800F */  lui        $v0, %hi(controller_queue_2)
/* 9BA24 8009AE24 24503058 */  addiu      $s0, $v0, %lo(controller_queue_2)
/* 9BA28 8009AE28 24140001 */  addiu      $s4, $zero, 1
/* 9BA2C 8009AE2C 3C13CCCC */  lui        $s3, 0xcccc
/* 9BA30 8009AE30 3673CCCD */  ori        $s3, $s3, 0xcccd
/* 9BA34 8009AE34 3C12AAAA */  lui        $s2, 0xaaaa
/* 9BA38 8009AE38 3652AAAB */  ori        $s2, $s2, 0xaaab
.L8009AE3C:
/* 9BA3C 8009AE3C 02002021 */  addu       $a0, $s0, $zero
.L8009AE40:
/* 9BA40 8009AE40 02202821 */  addu       $a1, $s1, $zero
/* 9BA44 8009AE44 0C0321E4 */  jal        osRecvMesg
/* 9BA48 8009AE48 24060001 */   addiu     $a2, $zero, 1
/* 9BA4C 8009AE4C 8FA30010 */  lw         $v1, 0x10($sp)
/* 9BA50 8009AE50 84620000 */  lh         $v0, ($v1)
/* 9BA54 8009AE54 1454FFFA */  bne        $v0, $s4, .L8009AE40
/* 9BA58 8009AE58 02002021 */   addu      $a0, $s0, $zero
/* 9BA5C 8009AE5C 0C026C22 */  jal        read_controller_input
/* 9BA60 8009AE60 00000000 */   nop
/* 9BA64 8009AE64 2605FE30 */  addiu      $a1, $s0, -0x1d0
/* 9BA68 8009AE68 8CA20218 */  lw         $v0, 0x218($a1)
/* 9BA6C 8009AE6C 8EA30300 */  lw         $v1, 0x300($s5)
/* 9BA70 8009AE70 24440001 */  addiu      $a0, $v0, 1
/* 9BA74 8009AE74 1460000D */  bnez       $v1, .L8009AEAC
/* 9BA78 8009AE78 ACA40218 */   sw        $a0, 0x218($a1)
/* 9BA7C 8009AE7C 00930019 */  multu      $a0, $s3
/* 9BA80 8009AE80 00001810 */  mfhi       $v1
/* 9BA84 8009AE84 00031882 */  srl        $v1, $v1, 2
/* 9BA88 8009AE88 00031080 */  sll        $v0, $v1, 2
/* 9BA8C 8009AE8C 00431021 */  addu       $v0, $v0, $v1
/* 9BA90 8009AE90 00821023 */  subu       $v0, $a0, $v0
/* 9BA94 8009AE94 1440FFE9 */  bnez       $v0, .L8009AE3C
/* 9BA98 8009AE98 ACA20218 */   sw        $v0, 0x218($a1)
/* 9BA9C 8009AE9C 0C026C22 */  jal        read_controller_input
/* 9BAA0 8009AEA0 00000000 */   nop
/* 9BAA4 8009AEA4 08026B90 */  j          .L8009AE40
/* 9BAA8 8009AEA8 02002021 */   addu      $a0, $s0, $zero
.L8009AEAC:
/* 9BAAC 8009AEAC 00920019 */  multu      $a0, $s2
/* 9BAB0 8009AEB0 00001810 */  mfhi       $v1
/* 9BAB4 8009AEB4 00031882 */  srl        $v1, $v1, 2
/* 9BAB8 8009AEB8 00031040 */  sll        $v0, $v1, 1
/* 9BABC 8009AEBC 00431021 */  addu       $v0, $v0, $v1
/* 9BAC0 8009AEC0 00021040 */  sll        $v0, $v0, 1
/* 9BAC4 8009AEC4 00821023 */  subu       $v0, $a0, $v0
/* 9BAC8 8009AEC8 08026B8F */  j          .L8009AE3C
/* 9BACC 8009AECC ACA20218 */   sw        $v0, 0x218($a1)

glabel init_controller_input_buffer
/* 9BAD0 8009AED0 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 9BAD4 8009AED4 24040020 */  addiu      $a0, $zero, 0x20
/* 9BAD8 8009AED8 AFB20060 */  sw         $s2, 0x60($sp)
/* 9BADC 8009AEDC 3C12800E */  lui        $s2, %hi(D_800E2C30)
/* 9BAE0 8009AEE0 AFB1005C */  sw         $s1, 0x5c($sp)
/* 9BAE4 8009AEE4 26512C30 */  addiu      $s1, $s2, %lo(D_800E2C30)
/* 9BAE8 8009AEE8 02202821 */  addu       $a1, $s1, $zero
/* 9BAEC 8009AEEC AFBF006C */  sw         $ra, 0x6c($sp)
/* 9BAF0 8009AEF0 AFB40068 */  sw         $s4, 0x68($sp)
/* 9BAF4 8009AEF4 AFB30064 */  sw         $s3, 0x64($sp)
/* 9BAF8 8009AEF8 AFB00058 */  sw         $s0, 0x58($sp)
/* 9BAFC 8009AEFC F7B40070 */  sdc1       $f20, 0x70($sp)
/* 9BB00 8009AF00 0C025F9C */  jal        Malloc
/* 9BB04 8009AF04 24060102 */   addiu     $a2, $zero, 0x102
/* 9BB08 8009AF08 3C03800F */  lui        $v1, %hi(controller_thread_stack)
/* 9BB0C 8009AF0C 24732E88 */  addiu      $s3, $v1, %lo(controller_thread_stack)
/* 9BB10 8009AF10 266401D0 */  addiu      $a0, $s3, 0x1d0
/* 9BB14 8009AF14 00402821 */  addu       $a1, $v0, $zero
/* 9BB18 8009AF18 24060008 */  addiu      $a2, $zero, 8
/* 9BB1C 8009AF1C 0C02FBA4 */  jal        osCreateMesgQueue
/* 9BB20 8009AF20 AE620004 */   sw        $v0, 4($s3)
/* 9BB24 8009AF24 267001E8 */  addiu      $s0, $s3, 0x1e8
/* 9BB28 8009AF28 02002021 */  addu       $a0, $s0, $zero
/* 9BB2C 8009AF2C 266501C8 */  addiu      $a1, $s3, 0x1c8
/* 9BB30 8009AF30 0C02FBA4 */  jal        osCreateMesgQueue
/* 9BB34 8009AF34 24060001 */   addiu     $a2, $zero, 1
/* 9BB38 8009AF38 24040005 */  addiu      $a0, $zero, 5
/* 9BB3C 8009AF3C 02002821 */  addu       $a1, $s0, $zero
/* 9BB40 8009AF40 0C033188 */  jal        osSetEventMesg
/* 9BB44 8009AF44 24060001 */   addiu     $a2, $zero, 1
/* 9BB48 8009AF48 26640200 */  addiu      $a0, $s3, 0x200
/* 9BB4C 8009AF4C 266501CC */  addiu      $a1, $s3, 0x1cc
/* 9BB50 8009AF50 0C02FBA4 */  jal        osCreateMesgQueue
/* 9BB54 8009AF54 24060001 */   addiu     $a2, $zero, 1
/* 9BB58 8009AF58 02202821 */  addu       $a1, $s1, $zero
/* 9BB5C 8009AF5C 2406010B */  addiu      $a2, $zero, 0x10b
/* 9BB60 8009AF60 9262021C */  lbu        $v0, 0x21c($s3)
/* 9BB64 8009AF64 00008821 */  addu       $s1, $zero, $zero
/* 9BB68 8009AF68 00022100 */  sll        $a0, $v0, 4
/* 9BB6C 8009AF6C 00822023 */  subu       $a0, $a0, $v0
/* 9BB70 8009AF70 0C025F9C */  jal        Malloc
/* 9BB74 8009AF74 000420C0 */   sll       $a0, $a0, 3
/* 9BB78 8009AF78 0240A021 */  addu       $s4, $s2, $zero
/* 9BB7C 8009AF7C AE62000C */  sw         $v0, 0xc($s3)
/* 9BB80 8009AF80 9262021C */  lbu        $v0, 0x21c($s3)
/* 9BB84 8009AF84 10400021 */  beqz       $v0, .L8009B00C
/* 9BB88 8009AF88 27B20050 */   addiu     $s2, $sp, 0x50
/* 9BB8C 8009AF8C 02608021 */  addu       $s0, $s3, $zero
/* 9BB90 8009AF90 3C01800E */  lui        $at, %hi(D_800E2C48)
/* 9BB94 8009AF94 C4342C48 */  lwc1       $f20, %lo(D_800E2C48)($at)
/* 9BB98 8009AF98 2413007F */  addiu      $s3, $zero, 0x7f
/* 9BB9C 8009AF9C 24041A00 */  addiu      $a0, $zero, 0x1a00
.L8009AFA0:
/* 9BBA0 8009AFA0 26852C30 */  addiu      $a1, $s4, 0x2c30
/* 9BBA4 8009AFA4 0C025F9C */  jal        Malloc
/* 9BBA8 8009AFA8 24060111 */   addiu     $a2, $zero, 0x111
/* 9BBAC 8009AFAC 00112100 */  sll        $a0, $s1, 4
/* 9BBB0 8009AFB0 00912023 */  subu       $a0, $a0, $s1
/* 9BBB4 8009AFB4 8E03000C */  lw         $v1, 0xc($s0)
/* 9BBB8 8009AFB8 000420C0 */  sll        $a0, $a0, 3
/* 9BBBC 8009AFBC 00831821 */  addu       $v1, $a0, $v1
/* 9BBC0 8009AFC0 A0600074 */  sb         $zero, 0x74($v1)
/* 9BBC4 8009AFC4 8E05000C */  lw         $a1, 0xc($s0)
/* 9BBC8 8009AFC8 AC620000 */  sw         $v0, ($v1)
/* 9BBCC 8009AFCC E474006C */  swc1       $f20, 0x6c($v1)
/* 9BBD0 8009AFD0 E4740070 */  swc1       $f20, 0x70($v1)
/* 9BBD4 8009AFD4 00852821 */  addu       $a1, $a0, $a1
/* 9BBD8 8009AFD8 A0B30075 */  sb         $s3, 0x75($a1)
/* 9BBDC 8009AFDC 8E02000C */  lw         $v0, 0xc($s0)
/* 9BBE0 8009AFE0 00821021 */  addu       $v0, $a0, $v0
/* 9BBE4 8009AFE4 A0400076 */  sb         $zero, 0x76($v0)
/* 9BBE8 8009AFE8 8E03000C */  lw         $v1, 0xc($s0)
/* 9BBEC 8009AFEC 00832021 */  addu       $a0, $a0, $v1
/* 9BBF0 8009AFF0 26230001 */  addiu      $v1, $s1, 1
/* 9BBF4 8009AFF4 A0800077 */  sb         $zero, 0x77($a0)
/* 9BBF8 8009AFF8 9202021C */  lbu        $v0, 0x21c($s0)
/* 9BBFC 8009AFFC 307100FF */  andi       $s1, $v1, 0xff
/* 9BC00 8009B000 0222102B */  sltu       $v0, $s1, $v0
/* 9BC04 8009B004 5440FFE6 */  bnel       $v0, $zero, .L8009AFA0
/* 9BC08 8009B008 24041A00 */   addiu     $a0, $zero, 0x1a00
.L8009B00C:
/* 9BC0C 8009B00C 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9BC10 8009B010 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9BC14 8009B014 02002021 */  addu       $a0, $s0, $zero
/* 9BC18 8009B018 00002821 */  addu       $a1, $zero, $zero
/* 9BC1C 8009B01C 0C03313C */  jal        osSendMesg
/* 9BC20 8009B020 24060001 */   addiu     $a2, $zero, 1
/* 9BC24 8009B024 2611FE00 */  addiu      $s1, $s0, -0x200
/* 9BC28 8009B028 0C02FB38 */  jal        osContSetCh
/* 9BC2C 8009B02C 9224021C */   lbu       $a0, 0x21c($s1)
/* 9BC30 8009B030 2604FFE8 */  addiu      $a0, $s0, -0x18
/* 9BC34 8009B034 02402821 */  addu       $a1, $s2, $zero
/* 9BC38 8009B038 0C02FA74 */  jal        osContInit
/* 9BC3C 8009B03C 27A60010 */   addiu     $a2, $sp, 0x10
/* 9BC40 8009B040 02002021 */  addu       $a0, $s0, $zero
/* 9BC44 8009B044 00002821 */  addu       $a1, $zero, $zero
/* 9BC48 8009B048 0C0321E4 */  jal        osRecvMesg
/* 9BC4C 8009B04C 24060001 */   addiu     $a2, $zero, 1
/* 9BC50 8009B050 2605FFC0 */  addiu      $a1, $s0, -0x40
/* 9BC54 8009B054 8E240008 */  lw         $a0, 8($s1)
/* 9BC58 8009B058 0C032EB6 */  jal        osScAddClient
/* 9BC5C 8009B05C 2606FFD0 */   addiu     $a2, $s0, -0x30
/* 9BC60 8009B060 8FBF006C */  lw         $ra, 0x6c($sp)
/* 9BC64 8009B064 8FB40068 */  lw         $s4, 0x68($sp)
/* 9BC68 8009B068 8FB30064 */  lw         $s3, 0x64($sp)
/* 9BC6C 8009B06C 8FB20060 */  lw         $s2, 0x60($sp)
/* 9BC70 8009B070 AE200218 */  sw         $zero, 0x218($s1)
/* 9BC74 8009B074 8FB1005C */  lw         $s1, 0x5c($sp)
/* 9BC78 8009B078 8FB00058 */  lw         $s0, 0x58($sp)
/* 9BC7C 8009B07C D7B40070 */  ldc1       $f20, 0x70($sp)
/* 9BC80 8009B080 03E00008 */  jr         $ra
/* 9BC84 8009B084 27BD0078 */   addiu     $sp, $sp, 0x78

glabel read_controller_input
/* 9BC88 8009B088 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 9BC8C 8009B08C AFB20058 */  sw         $s2, 0x58($sp)
/* 9BC90 8009B090 3C12800F */  lui        $s2, %hi(contMesgQ)
/* 9BC94 8009B094 AFB10054 */  sw         $s1, 0x54($sp)
/* 9BC98 8009B098 26513088 */  addiu      $s1, $s2, %lo(contMesgQ)
/* 9BC9C 8009B09C 02202021 */  addu       $a0, $s1, $zero
/* 9BCA0 8009B0A0 00002821 */  addu       $a1, $zero, $zero
/* 9BCA4 8009B0A4 24060001 */  addiu      $a2, $zero, 1
/* 9BCA8 8009B0A8 AFBF0074 */  sw         $ra, 0x74($sp)
/* 9BCAC 8009B0AC AFBE0070 */  sw         $fp, 0x70($sp)
/* 9BCB0 8009B0B0 AFB7006C */  sw         $s7, 0x6c($sp)
/* 9BCB4 8009B0B4 AFB60068 */  sw         $s6, 0x68($sp)
/* 9BCB8 8009B0B8 AFB50064 */  sw         $s5, 0x64($sp)
/* 9BCBC 8009B0BC AFB40060 */  sw         $s4, 0x60($sp)
/* 9BCC0 8009B0C0 AFB3005C */  sw         $s3, 0x5c($sp)
/* 9BCC4 8009B0C4 0C03313C */  jal        osSendMesg
/* 9BCC8 8009B0C8 AFB00050 */   sw        $s0, 0x50($sp)
/* 9BCCC 8009B0CC 2630FFE8 */  addiu      $s0, $s1, -0x18
/* 9BCD0 8009B0D0 0C02F9FC */  jal        osContStartReadData
/* 9BCD4 8009B0D4 02002021 */   addu      $a0, $s0, $zero
/* 9BCD8 8009B0D8 02002021 */  addu       $a0, $s0, $zero
/* 9BCDC 8009B0DC 00002821 */  addu       $a1, $zero, $zero
/* 9BCE0 8009B0E0 0C0321E4 */  jal        osRecvMesg
/* 9BCE4 8009B0E4 24060001 */   addiu     $a2, $zero, 1
/* 9BCE8 8009B0E8 0C02FA1E */  jal        osContGetReadData
/* 9BCEC 8009B0EC 27A40010 */   addiu     $a0, $sp, 0x10
/* 9BCF0 8009B0F0 2631FE00 */  addiu      $s1, $s1, -0x200
/* 9BCF4 8009B0F4 9222021C */  lbu        $v0, 0x21c($s1)
/* 9BCF8 8009B0F8 1040019B */  beqz       $v0, .L8009B768
/* 9BCFC 8009B0FC 00005021 */   addu      $t2, $zero, $zero
/* 9BD00 8009B100 3C03800F */  lui        $v1, %hi(button_b_hold)
/* 9BD04 8009B104 247E2E64 */  addiu      $fp, $v1, %lo(button_b_hold)
/* 9BD08 8009B108 3C02800F */  lui        $v0, %hi(c_up_hold)
/* 9BD0C 8009B10C 24572E34 */  addiu      $s7, $v0, %lo(c_up_hold)
/* 9BD10 8009B110 3C03800F */  lui        $v1, %hi(C_down_hold)
/* 9BD14 8009B114 24762E3C */  addiu      $s6, $v1, %lo(C_down_hold)
/* 9BD18 8009B118 3C02800F */  lui        $v0, %hi(c_left_hold)
/* 9BD1C 8009B11C 24552E44 */  addiu      $s5, $v0, %lo(c_left_hold)
/* 9BD20 8009B120 3C03800F */  lui        $v1, %hi(c_right_hold)
/* 9BD24 8009B124 24742E4C */  addiu      $s4, $v1, %lo(c_right_hold)
/* 9BD28 8009B128 3C02800F */  lui        $v0, %hi(D_up_hold)
/* 9BD2C 8009B12C 24532DF4 */  addiu      $s3, $v0, %lo(D_up_hold)
/* 9BD30 8009B130 3C03800F */  lui        $v1, %hi(D_down_hold)
/* 9BD34 8009B134 24722DFC */  addiu      $s2, $v1, %lo(D_down_hold)
/* 9BD38 8009B138 3C02800F */  lui        $v0, %hi(D_left_hold)
/* 9BD3C 8009B13C 24512E04 */  addiu      $s1, $v0, %lo(D_left_hold)
/* 9BD40 8009B140 3C03800F */  lui        $v1, %hi(D_right_hold)
/* 9BD44 8009B144 24792E0C */  addiu      $t9, $v1, %lo(D_right_hold)
/* 9BD48 8009B148 3C02800F */  lui        $v0, %hi(Up_hold)
/* 9BD4C 8009B14C 24582E14 */  addiu      $t8, $v0, %lo(Up_hold)
/* 9BD50 8009B150 3C03800F */  lui        $v1, %hi(down_hold)
/* 9BD54 8009B154 24702E1C */  addiu      $s0, $v1, %lo(down_hold)
/* 9BD58 8009B158 3C02800F */  lui        $v0, %hi(left_hold)
/* 9BD5C 8009B15C 244F2E24 */  addiu      $t7, $v0, %lo(left_hold)
/* 9BD60 8009B160 3C03800F */  lui        $v1, %hi(right_hold)
/* 9BD64 8009B164 246E2E2C */  addiu      $t6, $v1, %lo(right_hold)
/* 9BD68 8009B168 3C02800F */  lui        $v0, %hi(Z_hold)
/* 9BD6C 8009B16C 244D2E6C */  addiu      $t5, $v0, %lo(Z_hold)
/* 9BD70 8009B170 3C02800F */  lui        $v0, %hi(L_hold)
/* 9BD74 8009B174 244C2E74 */  addiu      $t4, $v0, %lo(L_hold)
/* 9BD78 8009B178 3C03800F */  lui        $v1, %hi(R_hold)
/* 9BD7C 8009B17C 246B2E7C */  addiu      $t3, $v1, %lo(R_hold)
/* 9BD80 8009B180 3C01800E */  lui        $at, %hi(D_800E2C4C)
/* 9BD84 8009B184 C4282C4C */  lwc1       $f8, %lo(D_800E2C4C)($at)
/* 9BD88 8009B188 3C01800E */  lui        $at, %hi(D_800E2C50)
/* 9BD8C 8009B18C C42A2C50 */  lwc1       $f10, %lo(D_800E2C50)($at)
/* 9BD90 8009B190 3C01800E */  lui        $at, %hi(D_800E2C54)
/* 9BD94 8009B194 C4262C54 */  lwc1       $f6, %lo(D_800E2C54)($at)
/* 9BD98 8009B198 000A1100 */  sll        $v0, $t2, 4
.L8009B19C:
/* 9BD9C 8009B19C 004A1023 */  subu       $v0, $v0, $t2
/* 9BDA0 8009B1A0 3C03800F */  lui        $v1, %hi(controller_thread_stack)
/* 9BDA4 8009B1A4 24632E88 */  addiu      $v1, $v1, %lo(controller_thread_stack)
/* 9BDA8 8009B1A8 8C64000C */  lw         $a0, 0xc($v1)
/* 9BDAC 8009B1AC 000210C0 */  sll        $v0, $v0, 3
/* 9BDB0 8009B1B0 00824821 */  addu       $t1, $a0, $v0
/* 9BDB4 8009B1B4 81230076 */  lb         $v1, 0x76($t1)
/* 9BDB8 8009B1B8 04600163 */  bltz       $v1, .L8009B748
/* 9BDBC 8009B1BC 000A3040 */   sll       $a2, $t2, 1
/* 9BDC0 8009B1C0 91220075 */  lbu        $v0, 0x75($t1)
/* 9BDC4 8009B1C4 8D250000 */  lw         $a1, ($t1)
/* 9BDC8 8009B1C8 24420001 */  addiu      $v0, $v0, 1
/* 9BDCC 8009B1CC 304300FF */  andi       $v1, $v0, 0xff
/* 9BDD0 8009B1D0 3063007F */  andi       $v1, $v1, 0x7f
/* 9BDD4 8009B1D4 A1230075 */  sb         $v1, 0x75($t1)
/* 9BDD8 8009B1D8 306200FF */  andi       $v0, $v1, 0xff
/* 9BDDC 8009B1DC 00022040 */  sll        $a0, $v0, 1
/* 9BDE0 8009B1E0 00822021 */  addu       $a0, $a0, $v0
/* 9BDE4 8009B1E4 00042080 */  sll        $a0, $a0, 2
/* 9BDE8 8009B1E8 00822021 */  addu       $a0, $a0, $v0
/* 9BDEC 8009B1EC 00042080 */  sll        $a0, $a0, 2
/* 9BDF0 8009B1F0 00CA1021 */  addu       $v0, $a2, $t2
/* 9BDF4 8009B1F4 00021040 */  sll        $v0, $v0, 1
/* 9BDF8 8009B1F8 27A30010 */  addiu      $v1, $sp, 0x10
/* 9BDFC 8009B1FC 00623821 */  addu       $a3, $v1, $v0
/* 9BE00 8009B200 90E20004 */  lbu        $v0, 4($a3)
/* 9BE04 8009B204 30420008 */  andi       $v0, $v0, 8
/* 9BE08 8009B208 1440000D */  bnez       $v0, .L8009B240
/* 9BE0C 8009B20C 00A42821 */   addu      $a1, $a1, $a0
/* 9BE10 8009B210 94E80000 */  lhu        $t0, ($a3)
/* 9BE14 8009B214 80E30002 */  lb         $v1, 2($a3)
/* 9BE18 8009B218 80E40003 */  lb         $a0, 3($a3)
/* 9BE1C 8009B21C 24020001 */  addiu      $v0, $zero, 1
/* 9BE20 8009B220 A1220077 */  sb         $v0, 0x77($t1)
/* 9BE24 8009B224 44830000 */  mtc1       $v1, $f0
/* 9BE28 8009B228 46800020 */  cvt.s.w    $f0, $f0
/* 9BE2C 8009B22C 46080103 */  div.s      $f4, $f0, $f8
/* 9BE30 8009B230 44841000 */  mtc1       $a0, $f2
/* 9BE34 8009B234 468010A0 */  cvt.s.w    $f2, $f2
/* 9BE38 8009B238 08026C94 */  j          .L8009B250
/* 9BE3C 8009B23C 46081083 */   div.s     $f2, $f2, $f8
.L8009B240:
/* 9BE40 8009B240 44801000 */  mtc1       $zero, $f2
/* 9BE44 8009B244 00004021 */  addu       $t0, $zero, $zero
/* 9BE48 8009B248 A1200077 */  sb         $zero, 0x77($t1)
/* 9BE4C 8009B24C 46001106 */  mov.s      $f4, $f2
.L8009B250:
/* 9BE50 8009B250 3C01800E */  lui        $at, %hi(D_800E2C58)
/* 9BE54 8009B254 C4202C58 */  lwc1       $f0, %lo(D_800E2C58)($at)
/* 9BE58 8009B258 4604003C */  c.lt.s     $f0, $f4
/* 9BE5C 8009B25C 00000000 */  nop
/* 9BE60 8009B260 45030015 */  bc1tl      .L8009B2B8
/* 9BE64 8009B264 E4A00000 */   swc1      $f0, ($a1)
/* 9BE68 8009B268 3C01800E */  lui        $at, %hi(D_800E2C5C)
/* 9BE6C 8009B26C C4202C5C */  lwc1       $f0, %lo(D_800E2C5C)($at)
/* 9BE70 8009B270 4600203C */  c.lt.s     $f4, $f0
/* 9BE74 8009B274 00000000 */  nop
/* 9BE78 8009B278 45020003 */  bc1fl      .L8009B288
/* 9BE7C 8009B27C C520006C */   lwc1      $f0, 0x6c($t1)
/* 9BE80 8009B280 08026CAC */  j          .L8009B2B0
/* 9BE84 8009B284 E4A00000 */   swc1      $f0, ($a1)
.L8009B288:
/* 9BE88 8009B288 4604003C */  c.lt.s     $f0, $f4
/* 9BE8C 8009B28C 00000000 */  nop
/* 9BE90 8009B290 45030007 */  bc1tl      .L8009B2B0
/* 9BE94 8009B294 E4A40000 */   swc1      $f4, ($a1)
/* 9BE98 8009B298 46000007 */  neg.s      $f0, $f0
/* 9BE9C 8009B29C 4600203C */  c.lt.s     $f4, $f0
/* 9BEA0 8009B2A0 00000000 */  nop
/* 9BEA4 8009B2A4 45020002 */  bc1fl      .L8009B2B0
/* 9BEA8 8009B2A8 ACA00000 */   sw        $zero, ($a1)
/* 9BEAC 8009B2AC E4A40000 */  swc1       $f4, ($a1)
.L8009B2B0:
/* 9BEB0 8009B2B0 3C01800E */  lui        $at, %hi(D_800E2C60)
/* 9BEB4 8009B2B4 C4202C60 */  lwc1       $f0, %lo(D_800E2C60)($at)
.L8009B2B8:
/* 9BEB8 8009B2B8 4602003C */  c.lt.s     $f0, $f2
/* 9BEBC 8009B2BC 00000000 */  nop
/* 9BEC0 8009B2C0 45030013 */  bc1tl      .L8009B310
/* 9BEC4 8009B2C4 E4A00004 */   swc1      $f0, 4($a1)
/* 9BEC8 8009B2C8 3C01800E */  lui        $at, %hi(D_800E2C64)
/* 9BECC 8009B2CC C4202C64 */  lwc1       $f0, %lo(D_800E2C64)($at)
/* 9BED0 8009B2D0 4600103C */  c.lt.s     $f2, $f0
/* 9BED4 8009B2D4 00000000 */  nop
/* 9BED8 8009B2D8 45020003 */  bc1fl      .L8009B2E8
/* 9BEDC 8009B2DC C5200070 */   lwc1      $f0, 0x70($t1)
/* 9BEE0 8009B2E0 08026CC4 */  j          .L8009B310
/* 9BEE4 8009B2E4 E4A00004 */   swc1      $f0, 4($a1)
.L8009B2E8:
/* 9BEE8 8009B2E8 4602003C */  c.lt.s     $f0, $f2
/* 9BEEC 8009B2EC 00000000 */  nop
/* 9BEF0 8009B2F0 45030007 */  bc1tl      .L8009B310
/* 9BEF4 8009B2F4 E4A20004 */   swc1      $f2, 4($a1)
/* 9BEF8 8009B2F8 46000007 */  neg.s      $f0, $f0
/* 9BEFC 8009B2FC 4600103C */  c.lt.s     $f2, $f0
/* 9BF00 8009B300 00000000 */  nop
/* 9BF04 8009B304 45020002 */  bc1fl      .L8009B310
/* 9BF08 8009B308 ACA00004 */   sw        $zero, 4($a1)
/* 9BF0C 8009B30C E4A20004 */  swc1       $f2, 4($a1)
.L8009B310:
/* 9BF10 8009B310 4604503E */  c.le.s     $f10, $f4
/* 9BF14 8009B314 00000000 */  nop
/* 9BF18 8009B318 45000003 */  bc1f       .L8009B328
/* 9BF1C 8009B31C 3C040002 */   lui       $a0, 2
/* 9BF20 8009B320 08026CCF */  j          .L8009B33C
/* 9BF24 8009B324 01044025 */   or        $t0, $t0, $a0
.L8009B328:
/* 9BF28 8009B328 4606203E */  c.le.s     $f4, $f6
/* 9BF2C 8009B32C 00000000 */  nop
/* 9BF30 8009B330 45000002 */  bc1f       .L8009B33C
/* 9BF34 8009B334 3C020001 */   lui       $v0, 1
/* 9BF38 8009B338 01024025 */  or         $t0, $t0, $v0
.L8009B33C:
/* 9BF3C 8009B33C 4602503E */  c.le.s     $f10, $f2
/* 9BF40 8009B340 00000000 */  nop
/* 9BF44 8009B344 45000003 */  bc1f       .L8009B354
/* 9BF48 8009B348 3C030008 */   lui       $v1, 8
/* 9BF4C 8009B34C 08026CDA */  j          .L8009B368
/* 9BF50 8009B350 01034025 */   or        $t0, $t0, $v1
.L8009B354:
/* 9BF54 8009B354 4606103E */  c.le.s     $f2, $f6
/* 9BF58 8009B358 00000000 */  nop
/* 9BF5C 8009B35C 45000002 */  bc1f       .L8009B368
/* 9BF60 8009B360 3C040004 */   lui       $a0, 4
/* 9BF64 8009B364 01044025 */  or         $t0, $t0, $a0
.L8009B368:
/* 9BF68 8009B368 000A2080 */  sll        $a0, $t2, 2
/* 9BF6C 8009B36C 3C02800F */  lui        $v0, %hi(button_mirror)
/* 9BF70 8009B370 24422DE4 */  addiu      $v0, $v0, %lo(button_mirror)
/* 9BF74 8009B374 00821821 */  addu       $v1, $a0, $v0
/* 9BF78 8009B378 8C620000 */  lw         $v0, ($v1)
/* 9BF7C 8009B37C 31031000 */  andi       $v1, $t0, 0x1000
/* 9BF80 8009B380 ACA8000C */  sw         $t0, 0xc($a1)
/* 9BF84 8009B384 01021024 */  and        $v0, $t0, $v0
/* 9BF88 8009B388 00481026 */  xor        $v0, $v0, $t0
/* 9BF8C 8009B38C 10600008 */  beqz       $v1, .L8009B3B0
/* 9BF90 8009B390 ACA20008 */   sw        $v0, 8($a1)
/* 9BF94 8009B394 3C02800F */  lui        $v0, %hi(Start_hold)
/* 9BF98 8009B398 24422E54 */  addiu      $v0, $v0, %lo(Start_hold)
/* 9BF9C 8009B39C 00C21821 */  addu       $v1, $a2, $v0
/* 9BFA0 8009B3A0 94620000 */  lhu        $v0, ($v1)
/* 9BFA4 8009B3A4 24420001 */  addiu      $v0, $v0, 1
/* 9BFA8 8009B3A8 08026CF0 */  j          .L8009B3C0
/* 9BFAC 8009B3AC A4620000 */   sh        $v0, ($v1)
.L8009B3B0:
/* 9BFB0 8009B3B0 3C03800F */  lui        $v1, %hi(Start_hold)
/* 9BFB4 8009B3B4 24632E54 */  addiu      $v1, $v1, %lo(Start_hold)
/* 9BFB8 8009B3B8 00C31021 */  addu       $v0, $a2, $v1
/* 9BFBC 8009B3BC A4400000 */  sh         $zero, ($v0)
.L8009B3C0:
/* 9BFC0 8009B3C0 3C03800F */  lui        $v1, %hi(Start_hold)
/* 9BFC4 8009B3C4 24632E54 */  addiu      $v1, $v1, %lo(Start_hold)
/* 9BFC8 8009B3C8 00C31021 */  addu       $v0, $a2, $v1
/* 9BFCC 8009B3CC 94430000 */  lhu        $v1, ($v0)
/* 9BFD0 8009B3D0 31028000 */  andi       $v0, $t0, 0x8000
/* 9BFD4 8009B3D4 10400008 */  beqz       $v0, .L8009B3F8
/* 9BFD8 8009B3D8 A4A30028 */   sh        $v1, 0x28($a1)
/* 9BFDC 8009B3DC 3C02800F */  lui        $v0, %hi(button_A_hold)
/* 9BFE0 8009B3E0 24422E5C */  addiu      $v0, $v0, %lo(button_A_hold)
/* 9BFE4 8009B3E4 00C21821 */  addu       $v1, $a2, $v0
/* 9BFE8 8009B3E8 94620000 */  lhu        $v0, ($v1)
/* 9BFEC 8009B3EC 24420001 */  addiu      $v0, $v0, 1
/* 9BFF0 8009B3F0 08026D02 */  j          .L8009B408
/* 9BFF4 8009B3F4 A4620000 */   sh        $v0, ($v1)
.L8009B3F8:
/* 9BFF8 8009B3F8 3C03800F */  lui        $v1, %hi(button_A_hold)
/* 9BFFC 8009B3FC 24632E5C */  addiu      $v1, $v1, %lo(button_A_hold)
/* 9C000 8009B400 00C31021 */  addu       $v0, $a2, $v1
/* 9C004 8009B404 A4400000 */  sh         $zero, ($v0)
.L8009B408:
/* 9C008 8009B408 3C03800F */  lui        $v1, %hi(button_A_hold)
/* 9C00C 8009B40C 24632E5C */  addiu      $v1, $v1, %lo(button_A_hold)
/* 9C010 8009B410 00C31021 */  addu       $v0, $a2, $v1
/* 9C014 8009B414 94430000 */  lhu        $v1, ($v0)
/* 9C018 8009B418 31024000 */  andi       $v0, $t0, 0x4000
/* 9C01C 8009B41C 10400006 */  beqz       $v0, .L8009B438
/* 9C020 8009B420 A4A3002A */   sh        $v1, 0x2a($a1)
/* 9C024 8009B424 00DE1821 */  addu       $v1, $a2, $fp
/* 9C028 8009B428 94620000 */  lhu        $v0, ($v1)
/* 9C02C 8009B42C 24420001 */  addiu      $v0, $v0, 1
/* 9C030 8009B430 08026D10 */  j          .L8009B440
/* 9C034 8009B434 A4620000 */   sh        $v0, ($v1)
.L8009B438:
/* 9C038 8009B438 00DE1021 */  addu       $v0, $a2, $fp
/* 9C03C 8009B43C A4400000 */  sh         $zero, ($v0)
.L8009B440:
/* 9C040 8009B440 00DE1021 */  addu       $v0, $a2, $fp
/* 9C044 8009B444 94430000 */  lhu        $v1, ($v0)
/* 9C048 8009B448 31020008 */  andi       $v0, $t0, 8
/* 9C04C 8009B44C 10400006 */  beqz       $v0, .L8009B468
/* 9C050 8009B450 A4A3002C */   sh        $v1, 0x2c($a1)
/* 9C054 8009B454 00D71821 */  addu       $v1, $a2, $s7
/* 9C058 8009B458 94620000 */  lhu        $v0, ($v1)
/* 9C05C 8009B45C 24420001 */  addiu      $v0, $v0, 1
/* 9C060 8009B460 08026D1C */  j          .L8009B470
/* 9C064 8009B464 A4620000 */   sh        $v0, ($v1)
.L8009B468:
/* 9C068 8009B468 00D71021 */  addu       $v0, $a2, $s7
/* 9C06C 8009B46C A4400000 */  sh         $zero, ($v0)
.L8009B470:
/* 9C070 8009B470 00D71021 */  addu       $v0, $a2, $s7
/* 9C074 8009B474 94430000 */  lhu        $v1, ($v0)
/* 9C078 8009B478 31020004 */  andi       $v0, $t0, 4
/* 9C07C 8009B47C 10400006 */  beqz       $v0, .L8009B498
/* 9C080 8009B480 A4A30020 */   sh        $v1, 0x20($a1)
/* 9C084 8009B484 00D61821 */  addu       $v1, $a2, $s6
/* 9C088 8009B488 94620000 */  lhu        $v0, ($v1)
/* 9C08C 8009B48C 24420001 */  addiu      $v0, $v0, 1
/* 9C090 8009B490 08026D28 */  j          .L8009B4A0
/* 9C094 8009B494 A4620000 */   sh        $v0, ($v1)
.L8009B498:
/* 9C098 8009B498 00D61021 */  addu       $v0, $a2, $s6
/* 9C09C 8009B49C A4400000 */  sh         $zero, ($v0)
.L8009B4A0:
/* 9C0A0 8009B4A0 00D61021 */  addu       $v0, $a2, $s6
/* 9C0A4 8009B4A4 94430000 */  lhu        $v1, ($v0)
/* 9C0A8 8009B4A8 31020002 */  andi       $v0, $t0, 2
/* 9C0AC 8009B4AC 10400006 */  beqz       $v0, .L8009B4C8
/* 9C0B0 8009B4B0 A4A30022 */   sh        $v1, 0x22($a1)
/* 9C0B4 8009B4B4 00D51821 */  addu       $v1, $a2, $s5
/* 9C0B8 8009B4B8 94620000 */  lhu        $v0, ($v1)
/* 9C0BC 8009B4BC 24420001 */  addiu      $v0, $v0, 1
/* 9C0C0 8009B4C0 08026D34 */  j          .L8009B4D0
/* 9C0C4 8009B4C4 A4620000 */   sh        $v0, ($v1)
.L8009B4C8:
/* 9C0C8 8009B4C8 00D51021 */  addu       $v0, $a2, $s5
/* 9C0CC 8009B4CC A4400000 */  sh         $zero, ($v0)
.L8009B4D0:
/* 9C0D0 8009B4D0 00D51021 */  addu       $v0, $a2, $s5
/* 9C0D4 8009B4D4 94430000 */  lhu        $v1, ($v0)
/* 9C0D8 8009B4D8 31020001 */  andi       $v0, $t0, 1
/* 9C0DC 8009B4DC 10400006 */  beqz       $v0, .L8009B4F8
/* 9C0E0 8009B4E0 A4A30024 */   sh        $v1, 0x24($a1)
/* 9C0E4 8009B4E4 00D41821 */  addu       $v1, $a2, $s4
/* 9C0E8 8009B4E8 94620000 */  lhu        $v0, ($v1)
/* 9C0EC 8009B4EC 24420001 */  addiu      $v0, $v0, 1
/* 9C0F0 8009B4F0 08026D40 */  j          .L8009B500
/* 9C0F4 8009B4F4 A4620000 */   sh        $v0, ($v1)
.L8009B4F8:
/* 9C0F8 8009B4F8 00D41021 */  addu       $v0, $a2, $s4
/* 9C0FC 8009B4FC A4400000 */  sh         $zero, ($v0)
.L8009B500:
/* 9C100 8009B500 00D41021 */  addu       $v0, $a2, $s4
/* 9C104 8009B504 94430000 */  lhu        $v1, ($v0)
/* 9C108 8009B508 31020800 */  andi       $v0, $t0, 0x800
/* 9C10C 8009B50C 10400006 */  beqz       $v0, .L8009B528
/* 9C110 8009B510 A4A30026 */   sh        $v1, 0x26($a1)
/* 9C114 8009B514 00D31821 */  addu       $v1, $a2, $s3
/* 9C118 8009B518 94620000 */  lhu        $v0, ($v1)
/* 9C11C 8009B51C 24420001 */  addiu      $v0, $v0, 1
/* 9C120 8009B520 08026D4C */  j          .L8009B530
/* 9C124 8009B524 A4620000 */   sh        $v0, ($v1)
.L8009B528:
/* 9C128 8009B528 00D31021 */  addu       $v0, $a2, $s3
/* 9C12C 8009B52C A4400000 */  sh         $zero, ($v0)
.L8009B530:
/* 9C130 8009B530 00D31021 */  addu       $v0, $a2, $s3
/* 9C134 8009B534 94430000 */  lhu        $v1, ($v0)
/* 9C138 8009B538 31020400 */  andi       $v0, $t0, 0x400
/* 9C13C 8009B53C 10400006 */  beqz       $v0, .L8009B558
/* 9C140 8009B540 A4A30010 */   sh        $v1, 0x10($a1)
/* 9C144 8009B544 00D21821 */  addu       $v1, $a2, $s2
/* 9C148 8009B548 94620000 */  lhu        $v0, ($v1)
/* 9C14C 8009B54C 24420001 */  addiu      $v0, $v0, 1
/* 9C150 8009B550 08026D58 */  j          .L8009B560
/* 9C154 8009B554 A4620000 */   sh        $v0, ($v1)
.L8009B558:
/* 9C158 8009B558 00D21021 */  addu       $v0, $a2, $s2
/* 9C15C 8009B55C A4400000 */  sh         $zero, ($v0)
.L8009B560:
/* 9C160 8009B560 00D21021 */  addu       $v0, $a2, $s2
/* 9C164 8009B564 94430000 */  lhu        $v1, ($v0)
/* 9C168 8009B568 31020200 */  andi       $v0, $t0, 0x200
/* 9C16C 8009B56C 10400006 */  beqz       $v0, .L8009B588
/* 9C170 8009B570 A4A30012 */   sh        $v1, 0x12($a1)
/* 9C174 8009B574 00D11821 */  addu       $v1, $a2, $s1
/* 9C178 8009B578 94620000 */  lhu        $v0, ($v1)
/* 9C17C 8009B57C 24420001 */  addiu      $v0, $v0, 1
/* 9C180 8009B580 08026D64 */  j          .L8009B590
/* 9C184 8009B584 A4620000 */   sh        $v0, ($v1)
.L8009B588:
/* 9C188 8009B588 00D11021 */  addu       $v0, $a2, $s1
/* 9C18C 8009B58C A4400000 */  sh         $zero, ($v0)
.L8009B590:
/* 9C190 8009B590 00D11021 */  addu       $v0, $a2, $s1
/* 9C194 8009B594 94430000 */  lhu        $v1, ($v0)
/* 9C198 8009B598 31020100 */  andi       $v0, $t0, 0x100
/* 9C19C 8009B59C 10400006 */  beqz       $v0, .L8009B5B8
/* 9C1A0 8009B5A0 A4A30014 */   sh        $v1, 0x14($a1)
/* 9C1A4 8009B5A4 00D91821 */  addu       $v1, $a2, $t9
/* 9C1A8 8009B5A8 94620000 */  lhu        $v0, ($v1)
/* 9C1AC 8009B5AC 24420001 */  addiu      $v0, $v0, 1
/* 9C1B0 8009B5B0 08026D70 */  j          .L8009B5C0
/* 9C1B4 8009B5B4 A4620000 */   sh        $v0, ($v1)
.L8009B5B8:
/* 9C1B8 8009B5B8 00D91021 */  addu       $v0, $a2, $t9
/* 9C1BC 8009B5BC A4400000 */  sh         $zero, ($v0)
.L8009B5C0:
/* 9C1C0 8009B5C0 00D91021 */  addu       $v0, $a2, $t9
/* 9C1C4 8009B5C4 94430000 */  lhu        $v1, ($v0)
/* 9C1C8 8009B5C8 A4A30016 */  sh         $v1, 0x16($a1)
/* 9C1CC 8009B5CC 3C030008 */  lui        $v1, 8
/* 9C1D0 8009B5D0 01031024 */  and        $v0, $t0, $v1
/* 9C1D4 8009B5D4 10400005 */  beqz       $v0, .L8009B5EC
/* 9C1D8 8009B5D8 00D81821 */   addu      $v1, $a2, $t8
/* 9C1DC 8009B5DC 94620000 */  lhu        $v0, ($v1)
/* 9C1E0 8009B5E0 24420001 */  addiu      $v0, $v0, 1
/* 9C1E4 8009B5E4 08026D7D */  j          .L8009B5F4
/* 9C1E8 8009B5E8 A4620000 */   sh        $v0, ($v1)
.L8009B5EC:
/* 9C1EC 8009B5EC 00D81021 */  addu       $v0, $a2, $t8
/* 9C1F0 8009B5F0 A4400000 */  sh         $zero, ($v0)
.L8009B5F4:
/* 9C1F4 8009B5F4 00D81021 */  addu       $v0, $a2, $t8
/* 9C1F8 8009B5F8 94430000 */  lhu        $v1, ($v0)
/* 9C1FC 8009B5FC A4A30018 */  sh         $v1, 0x18($a1)
/* 9C200 8009B600 3C030004 */  lui        $v1, 4
/* 9C204 8009B604 01031024 */  and        $v0, $t0, $v1
/* 9C208 8009B608 10400005 */  beqz       $v0, .L8009B620
/* 9C20C 8009B60C 00D01821 */   addu      $v1, $a2, $s0
/* 9C210 8009B610 94620000 */  lhu        $v0, ($v1)
/* 9C214 8009B614 24420001 */  addiu      $v0, $v0, 1
/* 9C218 8009B618 08026D8A */  j          .L8009B628
/* 9C21C 8009B61C A4620000 */   sh        $v0, ($v1)
.L8009B620:
/* 9C220 8009B620 00D01021 */  addu       $v0, $a2, $s0
/* 9C224 8009B624 A4400000 */  sh         $zero, ($v0)
.L8009B628:
/* 9C228 8009B628 00D01021 */  addu       $v0, $a2, $s0
/* 9C22C 8009B62C 94430000 */  lhu        $v1, ($v0)
/* 9C230 8009B630 A4A3001A */  sh         $v1, 0x1a($a1)
/* 9C234 8009B634 3C030001 */  lui        $v1, 1
/* 9C238 8009B638 01031024 */  and        $v0, $t0, $v1
/* 9C23C 8009B63C 10400005 */  beqz       $v0, .L8009B654
/* 9C240 8009B640 00CF1821 */   addu      $v1, $a2, $t7
/* 9C244 8009B644 94620000 */  lhu        $v0, ($v1)
/* 9C248 8009B648 24420001 */  addiu      $v0, $v0, 1
/* 9C24C 8009B64C 08026D97 */  j          .L8009B65C
/* 9C250 8009B650 A4620000 */   sh        $v0, ($v1)
.L8009B654:
/* 9C254 8009B654 00CF1021 */  addu       $v0, $a2, $t7
/* 9C258 8009B658 A4400000 */  sh         $zero, ($v0)
.L8009B65C:
/* 9C25C 8009B65C 00CF1021 */  addu       $v0, $a2, $t7
/* 9C260 8009B660 94430000 */  lhu        $v1, ($v0)
/* 9C264 8009B664 A4A3001C */  sh         $v1, 0x1c($a1)
/* 9C268 8009B668 3C030002 */  lui        $v1, 2
/* 9C26C 8009B66C 01031024 */  and        $v0, $t0, $v1
/* 9C270 8009B670 10400005 */  beqz       $v0, .L8009B688
/* 9C274 8009B674 00CE1821 */   addu      $v1, $a2, $t6
/* 9C278 8009B678 94620000 */  lhu        $v0, ($v1)
/* 9C27C 8009B67C 24420001 */  addiu      $v0, $v0, 1
/* 9C280 8009B680 08026DA4 */  j          .L8009B690
/* 9C284 8009B684 A4620000 */   sh        $v0, ($v1)
.L8009B688:
/* 9C288 8009B688 00CE1021 */  addu       $v0, $a2, $t6
/* 9C28C 8009B68C A4400000 */  sh         $zero, ($v0)
.L8009B690:
/* 9C290 8009B690 00CE1021 */  addu       $v0, $a2, $t6
/* 9C294 8009B694 94430000 */  lhu        $v1, ($v0)
/* 9C298 8009B698 31022000 */  andi       $v0, $t0, 0x2000
/* 9C29C 8009B69C 10400006 */  beqz       $v0, .L8009B6B8
/* 9C2A0 8009B6A0 A4A3001E */   sh        $v1, 0x1e($a1)
/* 9C2A4 8009B6A4 00CD1821 */  addu       $v1, $a2, $t5
/* 9C2A8 8009B6A8 94620000 */  lhu        $v0, ($v1)
/* 9C2AC 8009B6AC 24420001 */  addiu      $v0, $v0, 1
/* 9C2B0 8009B6B0 08026DB0 */  j          .L8009B6C0
/* 9C2B4 8009B6B4 A4620000 */   sh        $v0, ($v1)
.L8009B6B8:
/* 9C2B8 8009B6B8 00CD1021 */  addu       $v0, $a2, $t5
/* 9C2BC 8009B6BC A4400000 */  sh         $zero, ($v0)
.L8009B6C0:
/* 9C2C0 8009B6C0 00CD1021 */  addu       $v0, $a2, $t5
/* 9C2C4 8009B6C4 94430000 */  lhu        $v1, ($v0)
/* 9C2C8 8009B6C8 31020020 */  andi       $v0, $t0, 0x20
/* 9C2CC 8009B6CC 10400006 */  beqz       $v0, .L8009B6E8
/* 9C2D0 8009B6D0 A4A3002E */   sh        $v1, 0x2e($a1)
/* 9C2D4 8009B6D4 00CC1821 */  addu       $v1, $a2, $t4
/* 9C2D8 8009B6D8 94620000 */  lhu        $v0, ($v1)
/* 9C2DC 8009B6DC 24420001 */  addiu      $v0, $v0, 1
/* 9C2E0 8009B6E0 08026DBC */  j          .L8009B6F0
/* 9C2E4 8009B6E4 A4620000 */   sh        $v0, ($v1)
.L8009B6E8:
/* 9C2E8 8009B6E8 00CC1021 */  addu       $v0, $a2, $t4
/* 9C2EC 8009B6EC A4400000 */  sh         $zero, ($v0)
.L8009B6F0:
/* 9C2F0 8009B6F0 00CC1021 */  addu       $v0, $a2, $t4
/* 9C2F4 8009B6F4 94430000 */  lhu        $v1, ($v0)
/* 9C2F8 8009B6F8 31020010 */  andi       $v0, $t0, 0x10
/* 9C2FC 8009B6FC 10400006 */  beqz       $v0, .L8009B718
/* 9C300 8009B700 A4A30030 */   sh        $v1, 0x30($a1)
/* 9C304 8009B704 00CB1821 */  addu       $v1, $a2, $t3
/* 9C308 8009B708 94620000 */  lhu        $v0, ($v1)
/* 9C30C 8009B70C 24420001 */  addiu      $v0, $v0, 1
/* 9C310 8009B710 08026DC8 */  j          .L8009B720
/* 9C314 8009B714 A4620000 */   sh        $v0, ($v1)
.L8009B718:
/* 9C318 8009B718 00CB1021 */  addu       $v0, $a2, $t3
/* 9C31C 8009B71C A4400000 */  sh         $zero, ($v0)
.L8009B720:
/* 9C320 8009B720 00CB1021 */  addu       $v0, $a2, $t3
/* 9C324 8009B724 94430000 */  lhu        $v1, ($v0)
/* 9C328 8009B728 A4A30032 */  sh         $v1, 0x32($a1)
/* 9C32C 8009B72C 91220076 */  lbu        $v0, 0x76($t1)
/* 9C330 8009B730 24420001 */  addiu      $v0, $v0, 1
/* 9C334 8009B734 A1220076 */  sb         $v0, 0x76($t1)
/* 9C338 8009B738 3C02800F */  lui        $v0, %hi(button_mirror)
/* 9C33C 8009B73C 24422DE4 */  addiu      $v0, $v0, %lo(button_mirror)
/* 9C340 8009B740 00821821 */  addu       $v1, $a0, $v0
/* 9C344 8009B744 AC680000 */  sw         $t0, ($v1)
.L8009B748:
/* 9C348 8009B748 25430001 */  addiu      $v1, $t2, 1
/* 9C34C 8009B74C 3C04800F */  lui        $a0, %hi(controller_thread_stack)
/* 9C350 8009B750 24842E88 */  addiu      $a0, $a0, %lo(controller_thread_stack)
/* 9C354 8009B754 9082021C */  lbu        $v0, 0x21c($a0)
/* 9C358 8009B758 306A00FF */  andi       $t2, $v1, 0xff
/* 9C35C 8009B75C 0142102B */  sltu       $v0, $t2, $v0
/* 9C360 8009B760 1440FE8E */  bnez       $v0, .L8009B19C
/* 9C364 8009B764 000A1100 */   sll       $v0, $t2, 4
.L8009B768:
/* 9C368 8009B768 3C02800F */  lui        $v0, %hi(contMesgQ)
/* 9C36C 8009B76C 24443088 */  addiu      $a0, $v0, %lo(contMesgQ)
/* 9C370 8009B770 00002821 */  addu       $a1, $zero, $zero
/* 9C374 8009B774 0C0321E4 */  jal        osRecvMesg
/* 9C378 8009B778 24060001 */   addiu     $a2, $zero, 1
/* 9C37C 8009B77C 8FBF0074 */  lw         $ra, 0x74($sp)
/* 9C380 8009B780 8FBE0070 */  lw         $fp, 0x70($sp)
/* 9C384 8009B784 8FB7006C */  lw         $s7, 0x6c($sp)
/* 9C388 8009B788 8FB60068 */  lw         $s6, 0x68($sp)
/* 9C38C 8009B78C 8FB50064 */  lw         $s5, 0x64($sp)
/* 9C390 8009B790 8FB40060 */  lw         $s4, 0x60($sp)
/* 9C394 8009B794 8FB3005C */  lw         $s3, 0x5c($sp)
/* 9C398 8009B798 8FB20058 */  lw         $s2, 0x58($sp)
/* 9C39C 8009B79C 8FB10054 */  lw         $s1, 0x54($sp)
/* 9C3A0 8009B7A0 8FB00050 */  lw         $s0, 0x50($sp)
/* 9C3A4 8009B7A4 03E00008 */  jr         $ra
/* 9C3A8 8009B7A8 27BD0078 */   addiu     $sp, $sp, 0x78

glabel ofunc_getContQuerey
/* 9C3AC 8009B7AC 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 9C3B0 8009B7B0 AFB20058 */  sw         $s2, 0x58($sp)
/* 9C3B4 8009B7B4 309200FF */  andi       $s2, $a0, 0xff
/* 9C3B8 8009B7B8 AFB10054 */  sw         $s1, 0x54($sp)
/* 9C3BC 8009B7BC 3C11800F */  lui        $s1, %hi(contMesgQ)
/* 9C3C0 8009B7C0 26313088 */  addiu      $s1, $s1, %lo(contMesgQ)
/* 9C3C4 8009B7C4 02202021 */  addu       $a0, $s1, $zero
/* 9C3C8 8009B7C8 00002821 */  addu       $a1, $zero, $zero
/* 9C3CC 8009B7CC 24060001 */  addiu      $a2, $zero, 1
/* 9C3D0 8009B7D0 AFBF005C */  sw         $ra, 0x5c($sp)
/* 9C3D4 8009B7D4 0C03313C */  jal        osSendMesg
/* 9C3D8 8009B7D8 AFB00050 */   sw        $s0, 0x50($sp)
/* 9C3DC 8009B7DC 2630FFE8 */  addiu      $s0, $s1, -0x18
/* 9C3E0 8009B7E0 0C02F9D4 */  jal        osContStartQuery
/* 9C3E4 8009B7E4 02002021 */   addu      $a0, $s0, $zero
/* 9C3E8 8009B7E8 02002021 */  addu       $a0, $s0, $zero
/* 9C3EC 8009B7EC 00002821 */  addu       $a1, $zero, $zero
/* 9C3F0 8009B7F0 0C0321E4 */  jal        osRecvMesg
/* 9C3F4 8009B7F4 24060001 */   addiu     $a2, $zero, 1
/* 9C3F8 8009B7F8 0C02F9F4 */  jal        osContGetQuery
/* 9C3FC 8009B7FC 27A40010 */   addiu     $a0, $sp, 0x10
/* 9C400 8009B800 02202021 */  addu       $a0, $s1, $zero
/* 9C404 8009B804 00002821 */  addu       $a1, $zero, $zero
/* 9C408 8009B808 00129080 */  sll        $s2, $s2, 2
/* 9C40C 8009B80C 27A20010 */  addiu      $v0, $sp, 0x10
/* 9C410 8009B810 00521021 */  addu       $v0, $v0, $s2
/* 9C414 8009B814 90500003 */  lbu        $s0, 3($v0)
/* 9C418 8009B818 24060001 */  addiu      $a2, $zero, 1
/* 9C41C 8009B81C 32100008 */  andi       $s0, $s0, 8
/* 9C420 8009B820 0C0321E4 */  jal        osRecvMesg
/* 9C424 8009B824 2E100001 */   sltiu     $s0, $s0, 1
/* 9C428 8009B828 02001021 */  addu       $v0, $s0, $zero
/* 9C42C 8009B82C 8FBF005C */  lw         $ra, 0x5c($sp)
/* 9C430 8009B830 8FB20058 */  lw         $s2, 0x58($sp)
/* 9C434 8009B834 8FB10054 */  lw         $s1, 0x54($sp)
/* 9C438 8009B838 8FB00050 */  lw         $s0, 0x50($sp)
/* 9C43C 8009B83C 03E00008 */  jr         $ra
/* 9C440 8009B840 27BD0060 */   addiu     $sp, $sp, 0x60

glabel controller_status_check
/* 9C444 8009B844 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 9C448 8009B848 AFB10054 */  sw         $s1, 0x54($sp)
/* 9C44C 8009B84C 309100FF */  andi       $s1, $a0, 0xff
/* 9C450 8009B850 3C02800F */  lui        $v0, %hi(contMesgQ)
/* 9C454 8009B854 AFB20058 */  sw         $s2, 0x58($sp)
/* 9C458 8009B858 24523088 */  addiu      $s2, $v0, %lo(contMesgQ)
/* 9C45C 8009B85C 02402021 */  addu       $a0, $s2, $zero
/* 9C460 8009B860 00002821 */  addu       $a1, $zero, $zero
/* 9C464 8009B864 24060001 */  addiu      $a2, $zero, 1
/* 9C468 8009B868 AFBF005C */  sw         $ra, 0x5c($sp)
/* 9C46C 8009B86C 0C03313C */  jal        osSendMesg
/* 9C470 8009B870 AFB00050 */   sw        $s0, 0x50($sp)
/* 9C474 8009B874 2650FFE8 */  addiu      $s0, $s2, -0x18
/* 9C478 8009B878 0C02F9D4 */  jal        osContStartQuery
/* 9C47C 8009B87C 02002021 */   addu      $a0, $s0, $zero
/* 9C480 8009B880 02002021 */  addu       $a0, $s0, $zero
/* 9C484 8009B884 00002821 */  addu       $a1, $zero, $zero
/* 9C488 8009B888 0C0321E4 */  jal        osRecvMesg
/* 9C48C 8009B88C 24060001 */   addiu     $a2, $zero, 1
/* 9C490 8009B890 0C02F9F4 */  jal        osContGetQuery
/* 9C494 8009B894 27A40010 */   addiu     $a0, $sp, 0x10
/* 9C498 8009B898 00118880 */  sll        $s1, $s1, 2
/* 9C49C 8009B89C 27A30010 */  addiu      $v1, $sp, 0x10
/* 9C4A0 8009B8A0 00712021 */  addu       $a0, $v1, $s1
/* 9C4A4 8009B8A4 90820003 */  lbu        $v0, 3($a0)
/* 9C4A8 8009B8A8 30430008 */  andi       $v1, $v0, 8
/* 9C4AC 8009B8AC 30420004 */  andi       $v0, $v0, 4
/* 9C4B0 8009B8B0 10400002 */  beqz       $v0, .L8009B8BC
/* 9C4B4 8009B8B4 2C700001 */   sltiu     $s0, $v1, 1
/* 9C4B8 8009B8B8 00008021 */  addu       $s0, $zero, $zero
.L8009B8BC:
/* 9C4BC 8009B8BC 94820000 */  lhu        $v0, ($a0)
/* 9C4C0 8009B8C0 24030005 */  addiu      $v1, $zero, 5
/* 9C4C4 8009B8C4 30421F07 */  andi       $v0, $v0, 0x1f07
/* 9C4C8 8009B8C8 54430001 */  bnel       $v0, $v1, .L8009B8D0
/* 9C4CC 8009B8CC 00008021 */   addu      $s0, $zero, $zero
.L8009B8D0:
/* 9C4D0 8009B8D0 02402021 */  addu       $a0, $s2, $zero
/* 9C4D4 8009B8D4 00002821 */  addu       $a1, $zero, $zero
/* 9C4D8 8009B8D8 0C0321E4 */  jal        osRecvMesg
/* 9C4DC 8009B8DC 24060001 */   addiu     $a2, $zero, 1
/* 9C4E0 8009B8E0 02001021 */  addu       $v0, $s0, $zero
/* 9C4E4 8009B8E4 8FBF005C */  lw         $ra, 0x5c($sp)
/* 9C4E8 8009B8E8 8FB20058 */  lw         $s2, 0x58($sp)
/* 9C4EC 8009B8EC 8FB10054 */  lw         $s1, 0x54($sp)
/* 9C4F0 8009B8F0 8FB00050 */  lw         $s0, 0x50($sp)
/* 9C4F4 8009B8F4 03E00008 */  jr         $ra
/* 9C4F8 8009B8F8 27BD0060 */   addiu     $sp, $sp, 0x60

glabel func_8009B8FC
/* 9C4FC 8009B8FC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9C500 8009B900 AFB10014 */  sw         $s1, 0x14($sp)
/* 9C504 8009B904 309100FF */  andi       $s1, $a0, 0xff
/* 9C508 8009B908 AFB00010 */  sw         $s0, 0x10($sp)
/* 9C50C 8009B90C 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9C510 8009B910 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9C514 8009B914 02002021 */  addu       $a0, $s0, $zero
/* 9C518 8009B918 00002821 */  addu       $a1, $zero, $zero
/* 9C51C 8009B91C AFBF0018 */  sw         $ra, 0x18($sp)
/* 9C520 8009B920 0C03313C */  jal        osSendMesg
/* 9C524 8009B924 24060001 */   addiu     $a2, $zero, 1
/* 9C528 8009B928 02002021 */  addu       $a0, $s0, $zero
/* 9C52C 8009B92C 00002821 */  addu       $a1, $zero, $zero
/* 9C530 8009B930 24060001 */  addiu      $a2, $zero, 1
/* 9C534 8009B934 00111100 */  sll        $v0, $s1, 4
/* 9C538 8009B938 00511023 */  subu       $v0, $v0, $s1
/* 9C53C 8009B93C 8E03FE0C */  lw         $v1, -0x1f4($s0)
/* 9C540 8009B940 000210C0 */  sll        $v0, $v0, 3
/* 9C544 8009B944 00431021 */  addu       $v0, $v0, $v1
/* 9C548 8009B948 0C0321E4 */  jal        osRecvMesg
/* 9C54C 8009B94C 90500077 */   lbu       $s0, 0x77($v0)
/* 9C550 8009B950 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9C554 8009B954 8FB10014 */  lw         $s1, 0x14($sp)
/* 9C558 8009B958 02001021 */  addu       $v0, $s0, $zero
/* 9C55C 8009B95C 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C560 8009B960 03E00008 */  jr         $ra
/* 9C564 8009B964 27BD0020 */   addiu     $sp, $sp, 0x20

glabel initControllerPak
/* 9C568 8009B968 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9C56C 8009B96C AFB10014 */  sw         $s1, 0x14($sp)
/* 9C570 8009B970 309100FF */  andi       $s1, $a0, 0xff
/* 9C574 8009B974 AFB00010 */  sw         $s0, 0x10($sp)
/* 9C578 8009B978 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9C57C 8009B97C 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9C580 8009B980 02002021 */  addu       $a0, $s0, $zero
/* 9C584 8009B984 00002821 */  addu       $a1, $zero, $zero
/* 9C588 8009B988 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9C58C 8009B98C 0C03313C */  jal        osSendMesg
/* 9C590 8009B990 24060001 */   addiu     $a2, $zero, 1
/* 9C594 8009B994 2604FFE8 */  addiu      $a0, $s0, -0x18
/* 9C598 8009B998 02203021 */  addu       $a2, $s1, $zero
/* 9C59C 8009B99C 00111100 */  sll        $v0, $s1, 4
/* 9C5A0 8009B9A0 00511023 */  subu       $v0, $v0, $s1
/* 9C5A4 8009B9A4 8E05FE0C */  lw         $a1, -0x1f4($s0)
/* 9C5A8 8009B9A8 000210C0 */  sll        $v0, $v0, 3
/* 9C5AC 8009B9AC 00A22821 */  addu       $a1, $a1, $v0
/* 9C5B0 8009B9B0 0C0318FC */  jal        osPfsInitPak
/* 9C5B4 8009B9B4 24A50004 */   addiu     $a1, $a1, 4
/* 9C5B8 8009B9B8 02002021 */  addu       $a0, $s0, $zero
/* 9C5BC 8009B9BC 00002821 */  addu       $a1, $zero, $zero
/* 9C5C0 8009B9C0 24060001 */  addiu      $a2, $zero, 1
/* 9C5C4 8009B9C4 0C0321E4 */  jal        osRecvMesg
/* 9C5C8 8009B9C8 00408021 */   addu      $s0, $v0, $zero
/* 9C5CC 8009B9CC 320200FF */  andi       $v0, $s0, 0xff
/* 9C5D0 8009B9D0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9C5D4 8009B9D4 8FB10014 */  lw         $s1, 0x14($sp)
/* 9C5D8 8009B9D8 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C5DC 8009B9DC 03E00008 */  jr         $ra
/* 9C5E0 8009B9E0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel testRumblePack
/* 9C5E4 8009B9E4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9C5E8 8009B9E8 AFB10014 */  sw         $s1, 0x14($sp)
/* 9C5EC 8009B9EC 309100FF */  andi       $s1, $a0, 0xff
/* 9C5F0 8009B9F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9C5F4 8009B9F4 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9C5F8 8009B9F8 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9C5FC 8009B9FC 02002021 */  addu       $a0, $s0, $zero
/* 9C600 8009BA00 00002821 */  addu       $a1, $zero, $zero
/* 9C604 8009BA04 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9C608 8009BA08 0C03313C */  jal        osSendMesg
/* 9C60C 8009BA0C 24060001 */   addiu     $a2, $zero, 1
/* 9C610 8009BA10 2604FFE8 */  addiu      $a0, $s0, -0x18
/* 9C614 8009BA14 02203021 */  addu       $a2, $s1, $zero
/* 9C618 8009BA18 00111100 */  sll        $v0, $s1, 4
/* 9C61C 8009BA1C 00511023 */  subu       $v0, $v0, $s1
/* 9C620 8009BA20 8E05FE0C */  lw         $a1, -0x1f4($s0)
/* 9C624 8009BA24 000210C0 */  sll        $v0, $v0, 3
/* 9C628 8009BA28 00A22821 */  addu       $a1, $a1, $v0
/* 9C62C 8009BA2C 0C031095 */  jal        osMotorInit
/* 9C630 8009BA30 24A50004 */   addiu     $a1, $a1, 4
/* 9C634 8009BA34 02002021 */  addu       $a0, $s0, $zero
/* 9C638 8009BA38 00002821 */  addu       $a1, $zero, $zero
/* 9C63C 8009BA3C 24060001 */  addiu      $a2, $zero, 1
/* 9C640 8009BA40 0C0321E4 */  jal        osRecvMesg
/* 9C644 8009BA44 00408021 */   addu      $s0, $v0, $zero
/* 9C648 8009BA48 320200FF */  andi       $v0, $s0, 0xff
/* 9C64C 8009BA4C 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9C650 8009BA50 8FB10014 */  lw         $s1, 0x14($sp)
/* 9C654 8009BA54 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C658 8009BA58 03E00008 */  jr         $ra
/* 9C65C 8009BA5C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel testTransferPak
/* 9C660 8009BA60 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9C664 8009BA64 AFB10014 */  sw         $s1, 0x14($sp)
/* 9C668 8009BA68 309100FF */  andi       $s1, $a0, 0xff
/* 9C66C 8009BA6C AFB00010 */  sw         $s0, 0x10($sp)
/* 9C670 8009BA70 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9C674 8009BA74 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9C678 8009BA78 02002021 */  addu       $a0, $s0, $zero
/* 9C67C 8009BA7C 00002821 */  addu       $a1, $zero, $zero
/* 9C680 8009BA80 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9C684 8009BA84 0C03313C */  jal        osSendMesg
/* 9C688 8009BA88 24060001 */   addiu     $a2, $zero, 1
/* 9C68C 8009BA8C 2604FFE8 */  addiu      $a0, $s0, -0x18
/* 9C690 8009BA90 02203021 */  addu       $a2, $s1, $zero
/* 9C694 8009BA94 00111100 */  sll        $v0, $s1, 4
/* 9C698 8009BA98 00511023 */  subu       $v0, $v0, $s1
/* 9C69C 8009BA9C 8E05FE0C */  lw         $a1, -0x1f4($s0)
/* 9C6A0 8009BAA0 000210C0 */  sll        $v0, $v0, 3
/* 9C6A4 8009BAA4 00A22821 */  addu       $a1, $a1, $v0
/* 9C6A8 8009BAA8 0C03096C */  jal        osGbpakInit
/* 9C6AC 8009BAAC 24A50004 */   addiu     $a1, $a1, 4
/* 9C6B0 8009BAB0 02002021 */  addu       $a0, $s0, $zero
/* 9C6B4 8009BAB4 00002821 */  addu       $a1, $zero, $zero
/* 9C6B8 8009BAB8 24060001 */  addiu      $a2, $zero, 1
/* 9C6BC 8009BABC 0C0321E4 */  jal        osRecvMesg
/* 9C6C0 8009BAC0 00408021 */   addu      $s0, $v0, $zero
/* 9C6C4 8009BAC4 320200FF */  andi       $v0, $s0, 0xff
/* 9C6C8 8009BAC8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9C6CC 8009BACC 8FB10014 */  lw         $s1, 0x14($sp)
/* 9C6D0 8009BAD0 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C6D4 8009BAD4 03E00008 */  jr         $ra
/* 9C6D8 8009BAD8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_psf_err
/* 9C6DC 8009BADC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9C6E0 8009BAE0 AFB00010 */  sw         $s0, 0x10($sp)
/* 9C6E4 8009BAE4 309000FF */  andi       $s0, $a0, 0xff
/* 9C6E8 8009BAE8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 9C6EC 8009BAEC 0C026E5A */  jal        initControllerPak
/* 9C6F0 8009BAF0 02002021 */   addu      $a0, $s0, $zero
/* 9C6F4 8009BAF4 00401821 */  addu       $v1, $v0, $zero
/* 9C6F8 8009BAF8 2402000B */  addiu      $v0, $zero, 0xb
/* 9C6FC 8009BAFC 14620010 */  bne        $v1, $v0, .L8009BB40
/* 9C700 8009BB00 306200FF */   andi      $v0, $v1, 0xff
/* 9C704 8009BB04 0C026E79 */  jal        testRumblePack
/* 9C708 8009BB08 02002021 */   addu      $a0, $s0, $zero
/* 9C70C 8009BB0C 10400009 */  beqz       $v0, .L8009BB34
/* 9C710 8009BB10 00000000 */   nop
/* 9C714 8009BB14 0C026E98 */  jal        testTransferPak
/* 9C718 8009BB18 02002021 */   addu      $a0, $s0, $zero
/* 9C71C 8009BB1C 10400005 */  beqz       $v0, .L8009BB34
/* 9C720 8009BB20 00000000 */   nop
/* 9C724 8009BB24 0C026E5A */  jal        initControllerPak
/* 9C728 8009BB28 02002021 */   addu      $a0, $s0, $zero
/* 9C72C 8009BB2C 08026ED0 */  j          .L8009BB40
/* 9C730 8009BB30 2402000A */   addiu     $v0, $zero, 0xa
.L8009BB34:
/* 9C734 8009BB34 0C026E5A */  jal        initControllerPak
/* 9C738 8009BB38 02002021 */   addu      $a0, $s0, $zero
/* 9C73C 8009BB3C 2402000B */  addiu      $v0, $zero, 0xb
.L8009BB40:
/* 9C740 8009BB40 8FBF0014 */  lw         $ra, 0x14($sp)
/* 9C744 8009BB44 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C748 8009BB48 03E00008 */  jr         $ra
/* 9C74C 8009BB4C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel repaircontrollerpakid
/* 9C750 8009BB50 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9C754 8009BB54 AFB10014 */  sw         $s1, 0x14($sp)
/* 9C758 8009BB58 309100FF */  andi       $s1, $a0, 0xff
/* 9C75C 8009BB5C AFB00010 */  sw         $s0, 0x10($sp)
/* 9C760 8009BB60 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9C764 8009BB64 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9C768 8009BB68 02002021 */  addu       $a0, $s0, $zero
/* 9C76C 8009BB6C 00002821 */  addu       $a1, $zero, $zero
/* 9C770 8009BB70 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9C774 8009BB74 0C03313C */  jal        osSendMesg
/* 9C778 8009BB78 24060001 */   addiu     $a2, $zero, 1
/* 9C77C 8009BB7C 00111900 */  sll        $v1, $s1, 4
/* 9C780 8009BB80 00711823 */  subu       $v1, $v1, $s1
/* 9C784 8009BB84 8E04FE0C */  lw         $a0, -0x1f4($s0)
/* 9C788 8009BB88 000318C0 */  sll        $v1, $v1, 3
/* 9C78C 8009BB8C 00832021 */  addu       $a0, $a0, $v1
/* 9C790 8009BB90 0C031D40 */  jal        osPfsRepairId
/* 9C794 8009BB94 24840004 */   addiu     $a0, $a0, 4
/* 9C798 8009BB98 02002021 */  addu       $a0, $s0, $zero
/* 9C79C 8009BB9C 00002821 */  addu       $a1, $zero, $zero
/* 9C7A0 8009BBA0 24060001 */  addiu      $a2, $zero, 1
/* 9C7A4 8009BBA4 0C0321E4 */  jal        osRecvMesg
/* 9C7A8 8009BBA8 00408021 */   addu      $s0, $v0, $zero
/* 9C7AC 8009BBAC 320200FF */  andi       $v0, $s0, 0xff
/* 9C7B0 8009BBB0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9C7B4 8009BBB4 8FB10014 */  lw         $s1, 0x14($sp)
/* 9C7B8 8009BBB8 8FB00010 */  lw         $s0, 0x10($sp)
/* 9C7BC 8009BBBC 03E00008 */  jr         $ra
/* 9C7C0 8009BBC0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8009BBC4
/* 9C7C4 8009BBC4 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9C7C8 8009BBC8 AFB40028 */  sw         $s4, 0x28($sp)
/* 9C7CC 8009BBCC 0080A021 */  addu       $s4, $a0, $zero
/* 9C7D0 8009BBD0 AFB20020 */  sw         $s2, 0x20($sp)
/* 9C7D4 8009BBD4 3C12800F */  lui        $s2, %hi(contMesgQ)
/* 9C7D8 8009BBD8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 9C7DC 8009BBDC 26513088 */  addiu      $s1, $s2, %lo(contMesgQ)
/* 9C7E0 8009BBE0 02202021 */  addu       $a0, $s1, $zero
/* 9C7E4 8009BBE4 AFB00018 */  sw         $s0, 0x18($sp)
/* 9C7E8 8009BBE8 30B000FF */  andi       $s0, $a1, 0xff
/* 9C7EC 8009BBEC 00002821 */  addu       $a1, $zero, $zero
/* 9C7F0 8009BBF0 24060001 */  addiu      $a2, $zero, 1
/* 9C7F4 8009BBF4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 9C7F8 8009BBF8 0C03313C */  jal        osSendMesg
/* 9C7FC 8009BBFC AFB30024 */   sw        $s3, 0x24($sp)
/* 9C800 8009BC00 27B30010 */  addiu      $s3, $sp, 0x10
/* 9C804 8009BC04 02602821 */  addu       $a1, $s3, $zero
/* 9C808 8009BC08 00101100 */  sll        $v0, $s0, 4
/* 9C80C 8009BC0C 00501023 */  subu       $v0, $v0, $s0
/* 9C810 8009BC10 8E24FE0C */  lw         $a0, -0x1f4($s1)
/* 9C814 8009BC14 000210C0 */  sll        $v0, $v0, 3
/* 9C818 8009BC18 00822021 */  addu       $a0, $a0, $v0
/* 9C81C 8009BC1C 0C031834 */  jal        osPfsFreeBlocks
/* 9C820 8009BC20 24840004 */   addiu     $a0, $a0, 4
/* 9C824 8009BC24 00408021 */  addu       $s0, $v0, $zero
/* 9C828 8009BC28 56000003 */  bnel       $s0, $zero, .L8009BC38
/* 9C82C 8009BC2C A6800000 */   sh        $zero, ($s4)
/* 9C830 8009BC30 96620002 */  lhu        $v0, 2($s3)
/* 9C834 8009BC34 A6820000 */  sh         $v0, ($s4)
.L8009BC38:
/* 9C838 8009BC38 26443088 */  addiu      $a0, $s2, 0x3088
/* 9C83C 8009BC3C 00002821 */  addu       $a1, $zero, $zero
/* 9C840 8009BC40 0C0321E4 */  jal        osRecvMesg
/* 9C844 8009BC44 24060001 */   addiu     $a2, $zero, 1
/* 9C848 8009BC48 320200FF */  andi       $v0, $s0, 0xff
/* 9C84C 8009BC4C 8FBF002C */  lw         $ra, 0x2c($sp)
/* 9C850 8009BC50 8FB40028 */  lw         $s4, 0x28($sp)
/* 9C854 8009BC54 8FB30024 */  lw         $s3, 0x24($sp)
/* 9C858 8009BC58 8FB20020 */  lw         $s2, 0x20($sp)
/* 9C85C 8009BC5C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9C860 8009BC60 8FB00018 */  lw         $s0, 0x18($sp)
/* 9C864 8009BC64 03E00008 */  jr         $ra
/* 9C868 8009BC68 27BD0030 */   addiu     $sp, $sp, 0x30

glabel get_contpak_freespace
/* 9C86C 8009BC6C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9C870 8009BC70 AFB30024 */  sw         $s3, 0x24($sp)
/* 9C874 8009BC74 00809821 */  addu       $s3, $a0, $zero
/* 9C878 8009BC78 AFB20020 */  sw         $s2, 0x20($sp)
/* 9C87C 8009BC7C 3C12800F */  lui        $s2, %hi(contMesgQ)
/* 9C880 8009BC80 AFB1001C */  sw         $s1, 0x1c($sp)
/* 9C884 8009BC84 26513088 */  addiu      $s1, $s2, %lo(contMesgQ)
/* 9C888 8009BC88 02202021 */  addu       $a0, $s1, $zero
/* 9C88C 8009BC8C AFB00018 */  sw         $s0, 0x18($sp)
/* 9C890 8009BC90 30B000FF */  andi       $s0, $a1, 0xff
/* 9C894 8009BC94 00002821 */  addu       $a1, $zero, $zero
/* 9C898 8009BC98 AFBF0028 */  sw         $ra, 0x28($sp)
/* 9C89C 8009BC9C 0C03313C */  jal        osSendMesg
/* 9C8A0 8009BCA0 24060001 */   addiu     $a2, $zero, 1
/* 9C8A4 8009BCA4 27A50010 */  addiu      $a1, $sp, 0x10
/* 9C8A8 8009BCA8 00101100 */  sll        $v0, $s0, 4
/* 9C8AC 8009BCAC 00501023 */  subu       $v0, $v0, $s0
/* 9C8B0 8009BCB0 8E24FE0C */  lw         $a0, -0x1f4($s1)
/* 9C8B4 8009BCB4 000210C0 */  sll        $v0, $v0, 3
/* 9C8B8 8009BCB8 00822021 */  addu       $a0, $a0, $v0
/* 9C8BC 8009BCBC 0C031834 */  jal        osPfsFreeBlocks
/* 9C8C0 8009BCC0 24840004 */   addiu     $a0, $a0, 4
/* 9C8C4 8009BCC4 00408021 */  addu       $s0, $v0, $zero
/* 9C8C8 8009BCC8 56000004 */  bnel       $s0, $zero, .L8009BCDC
/* 9C8CC 8009BCCC A2600000 */   sb        $zero, ($s3)
/* 9C8D0 8009BCD0 8FA20010 */  lw         $v0, 0x10($sp)
/* 9C8D4 8009BCD4 00021203 */  sra        $v0, $v0, 8
/* 9C8D8 8009BCD8 A2620000 */  sb         $v0, ($s3)
.L8009BCDC:
/* 9C8DC 8009BCDC 26443088 */  addiu      $a0, $s2, 0x3088
/* 9C8E0 8009BCE0 00002821 */  addu       $a1, $zero, $zero
/* 9C8E4 8009BCE4 0C0321E4 */  jal        osRecvMesg
/* 9C8E8 8009BCE8 24060001 */   addiu     $a2, $zero, 1
/* 9C8EC 8009BCEC 320200FF */  andi       $v0, $s0, 0xff
/* 9C8F0 8009BCF0 8FBF0028 */  lw         $ra, 0x28($sp)
/* 9C8F4 8009BCF4 8FB30024 */  lw         $s3, 0x24($sp)
/* 9C8F8 8009BCF8 8FB20020 */  lw         $s2, 0x20($sp)
/* 9C8FC 8009BCFC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9C900 8009BD00 8FB00018 */  lw         $s0, 0x18($sp)
/* 9C904 8009BD04 03E00008 */  jr         $ra
/* 9C908 8009BD08 27BD0030 */   addiu     $sp, $sp, 0x30

glabel create_new_save_file
/* 9C90C 8009BD0C 27BDFF30 */  addiu      $sp, $sp, -0xd0
/* 9C910 8009BD10 AFBE00C8 */  sw         $fp, 0xc8($sp)
/* 9C914 8009BD14 0080F021 */  addu       $fp, $a0, $zero
/* 9C918 8009BD18 AFB700C4 */  sw         $s7, 0xc4($sp)
/* 9C91C 8009BD1C 3C17800F */  lui        $s7, %hi(contMesgQ)
/* 9C920 8009BD20 AFB200B0 */  sw         $s2, 0xb0($sp)
/* 9C924 8009BD24 26F23088 */  addiu      $s2, $s7, %lo(contMesgQ)
/* 9C928 8009BD28 AFB500BC */  sw         $s5, 0xbc($sp)
/* 9C92C 8009BD2C 8FB500E0 */  lw         $s5, 0xe0($sp)
/* 9C930 8009BD30 02402021 */  addu       $a0, $s2, $zero
/* 9C934 8009BD34 AFB000A8 */  sw         $s0, 0xa8($sp)
/* 9C938 8009BD38 00A08021 */  addu       $s0, $a1, $zero
/* 9C93C 8009BD3C AFB600C0 */  sw         $s6, 0xc0($sp)
/* 9C940 8009BD40 97B600E6 */  lhu        $s6, 0xe6($sp)
/* 9C944 8009BD44 00002821 */  addu       $a1, $zero, $zero
/* 9C948 8009BD48 AFB300B4 */  sw         $s3, 0xb4($sp)
/* 9C94C 8009BD4C 00C09821 */  addu       $s3, $a2, $zero
/* 9C950 8009BD50 AFB100AC */  sw         $s1, 0xac($sp)
/* 9C954 8009BD54 93B100EB */  lbu        $s1, 0xeb($sp)
/* 9C958 8009BD58 24060001 */  addiu      $a2, $zero, 1
/* 9C95C 8009BD5C AFB400B8 */  sw         $s4, 0xb8($sp)
/* 9C960 8009BD60 AFBF00CC */  sw         $ra, 0xcc($sp)
/* 9C964 8009BD64 0C03313C */  jal        osSendMesg
/* 9C968 8009BD68 30F4FFFF */   andi      $s4, $a3, 0xffff
/* 9C96C 8009BD6C 27A40020 */  addiu      $a0, $sp, 0x20
/* 9C970 8009BD70 02002821 */  addu       $a1, $s0, $zero
/* 9C974 8009BD74 24060010 */  addiu      $a2, $zero, 0x10
/* 9C978 8009BD78 8E50FE0C */  lw         $s0, -0x1f4($s2)
/* 9C97C 8009BD7C 00111100 */  sll        $v0, $s1, 4
/* 9C980 8009BD80 00511023 */  subu       $v0, $v0, $s1
/* 9C984 8009BD84 000210C0 */  sll        $v0, $v0, 3
/* 9C988 8009BD88 0C027188 */  jal        make_pfs_string
/* 9C98C 8009BD8C 02028021 */   addu      $s0, $s0, $v0
/* 9C990 8009BD90 27B10060 */  addiu      $s1, $sp, 0x60
/* 9C994 8009BD94 02202021 */  addu       $a0, $s1, $zero
/* 9C998 8009BD98 02602821 */  addu       $a1, $s3, $zero
/* 9C99C 8009BD9C 0C027188 */  jal        make_pfs_string
/* 9C9A0 8009BDA0 24060004 */   addiu     $a2, $zero, 4
/* 9C9A4 8009BDA4 26040004 */  addiu      $a0, $s0, 4
/* 9C9A8 8009BDA8 02802821 */  addu       $a1, $s4, $zero
/* 9C9AC 8009BDAC 02A03021 */  addu       $a2, $s5, $zero
/* 9C9B0 8009BDB0 27B000A0 */  addiu      $s0, $sp, 0xa0
/* 9C9B4 8009BDB4 27A70020 */  addiu      $a3, $sp, 0x20
/* 9C9B8 8009BDB8 AFB10010 */  sw         $s1, 0x10($sp)
/* 9C9BC 8009BDBC AFB60014 */  sw         $s6, 0x14($sp)
/* 9C9C0 8009BDC0 0C031350 */  jal        osPfsAllocateFile
/* 9C9C4 8009BDC4 AFB00018 */   sw        $s0, 0x18($sp)
/* 9C9C8 8009BDC8 00408821 */  addu       $s1, $v0, $zero
/* 9C9CC 8009BDCC 56200003 */  bnel       $s1, $zero, .L8009BDDC
/* 9C9D0 8009BDD0 A3C00000 */   sb        $zero, ($fp)
/* 9C9D4 8009BDD4 92020003 */  lbu        $v0, 3($s0)
/* 9C9D8 8009BDD8 A3C20000 */  sb         $v0, ($fp)
.L8009BDDC:
/* 9C9DC 8009BDDC 26E43088 */  addiu      $a0, $s7, 0x3088
/* 9C9E0 8009BDE0 00002821 */  addu       $a1, $zero, $zero
/* 9C9E4 8009BDE4 0C0321E4 */  jal        osRecvMesg
/* 9C9E8 8009BDE8 24060001 */   addiu     $a2, $zero, 1
/* 9C9EC 8009BDEC 322200FF */  andi       $v0, $s1, 0xff
/* 9C9F0 8009BDF0 8FBF00CC */  lw         $ra, 0xcc($sp)
/* 9C9F4 8009BDF4 8FBE00C8 */  lw         $fp, 0xc8($sp)
/* 9C9F8 8009BDF8 8FB700C4 */  lw         $s7, 0xc4($sp)
/* 9C9FC 8009BDFC 8FB600C0 */  lw         $s6, 0xc0($sp)
/* 9CA00 8009BE00 8FB500BC */  lw         $s5, 0xbc($sp)
/* 9CA04 8009BE04 8FB400B8 */  lw         $s4, 0xb8($sp)
/* 9CA08 8009BE08 8FB300B4 */  lw         $s3, 0xb4($sp)
/* 9CA0C 8009BE0C 8FB200B0 */  lw         $s2, 0xb0($sp)
/* 9CA10 8009BE10 8FB100AC */  lw         $s1, 0xac($sp)
/* 9CA14 8009BE14 8FB000A8 */  lw         $s0, 0xa8($sp)
/* 9CA18 8009BE18 03E00008 */  jr         $ra
/* 9CA1C 8009BE1C 27BD00D0 */   addiu     $sp, $sp, 0xd0

glabel func_8009BE20
/* 9CA20 8009BE20 27BDFF38 */  addiu      $sp, $sp, -0xc8
/* 9CA24 8009BE24 AFB700BC */  sw         $s7, 0xbc($sp)
/* 9CA28 8009BE28 0080B821 */  addu       $s7, $a0, $zero
/* 9CA2C 8009BE2C AFB600B8 */  sw         $s6, 0xb8($sp)
/* 9CA30 8009BE30 3C16800F */  lui        $s6, %hi(contMesgQ)
/* 9CA34 8009BE34 AFB200A8 */  sw         $s2, 0xa8($sp)
/* 9CA38 8009BE38 26D23088 */  addiu      $s2, $s6, %lo(contMesgQ)
/* 9CA3C 8009BE3C 02402021 */  addu       $a0, $s2, $zero
/* 9CA40 8009BE40 AFB000A0 */  sw         $s0, 0xa0($sp)
/* 9CA44 8009BE44 00A08021 */  addu       $s0, $a1, $zero
/* 9CA48 8009BE48 AFB500B4 */  sw         $s5, 0xb4($sp)
/* 9CA4C 8009BE4C 8FB500D8 */  lw         $s5, 0xd8($sp)
/* 9CA50 8009BE50 00002821 */  addu       $a1, $zero, $zero
/* 9CA54 8009BE54 AFB300AC */  sw         $s3, 0xac($sp)
/* 9CA58 8009BE58 00C09821 */  addu       $s3, $a2, $zero
/* 9CA5C 8009BE5C AFB100A4 */  sw         $s1, 0xa4($sp)
/* 9CA60 8009BE60 93B100DF */  lbu        $s1, 0xdf($sp)
/* 9CA64 8009BE64 24060001 */  addiu      $a2, $zero, 1
/* 9CA68 8009BE68 AFB400B0 */  sw         $s4, 0xb0($sp)
/* 9CA6C 8009BE6C AFBF00C0 */  sw         $ra, 0xc0($sp)
/* 9CA70 8009BE70 0C03313C */  jal        osSendMesg
/* 9CA74 8009BE74 30F4FFFF */   andi      $s4, $a3, 0xffff
/* 9CA78 8009BE78 27A40018 */  addiu      $a0, $sp, 0x18
/* 9CA7C 8009BE7C 02002821 */  addu       $a1, $s0, $zero
/* 9CA80 8009BE80 24060010 */  addiu      $a2, $zero, 0x10
/* 9CA84 8009BE84 8E50FE0C */  lw         $s0, -0x1f4($s2)
/* 9CA88 8009BE88 00111100 */  sll        $v0, $s1, 4
/* 9CA8C 8009BE8C 00511023 */  subu       $v0, $v0, $s1
/* 9CA90 8009BE90 000210C0 */  sll        $v0, $v0, 3
/* 9CA94 8009BE94 0C027188 */  jal        make_pfs_string
/* 9CA98 8009BE98 02028021 */   addu      $s0, $s0, $v0
/* 9CA9C 8009BE9C 27B10058 */  addiu      $s1, $sp, 0x58
/* 9CAA0 8009BEA0 02202021 */  addu       $a0, $s1, $zero
/* 9CAA4 8009BEA4 02602821 */  addu       $a1, $s3, $zero
/* 9CAA8 8009BEA8 0C027188 */  jal        make_pfs_string
/* 9CAAC 8009BEAC 24060004 */   addiu     $a2, $zero, 4
/* 9CAB0 8009BEB0 26040004 */  addiu      $a0, $s0, 4
/* 9CAB4 8009BEB4 02802821 */  addu       $a1, $s4, $zero
/* 9CAB8 8009BEB8 02A03021 */  addu       $a2, $s5, $zero
/* 9CABC 8009BEBC 27B00098 */  addiu      $s0, $sp, 0x98
/* 9CAC0 8009BEC0 27A70018 */  addiu      $a3, $sp, 0x18
/* 9CAC4 8009BEC4 AFB10010 */  sw         $s1, 0x10($sp)
/* 9CAC8 8009BEC8 0C031D58 */  jal        osPfsFindFile
/* 9CACC 8009BECC AFB00014 */   sw        $s0, 0x14($sp)
/* 9CAD0 8009BED0 00408821 */  addu       $s1, $v0, $zero
/* 9CAD4 8009BED4 56200003 */  bnel       $s1, $zero, .L8009BEE4
/* 9CAD8 8009BED8 A2E00000 */   sb        $zero, ($s7)
/* 9CADC 8009BEDC 92020003 */  lbu        $v0, 3($s0)
/* 9CAE0 8009BEE0 A2E20000 */  sb         $v0, ($s7)
.L8009BEE4:
/* 9CAE4 8009BEE4 26C43088 */  addiu      $a0, $s6, 0x3088
/* 9CAE8 8009BEE8 00002821 */  addu       $a1, $zero, $zero
/* 9CAEC 8009BEEC 0C0321E4 */  jal        osRecvMesg
/* 9CAF0 8009BEF0 24060001 */   addiu     $a2, $zero, 1
/* 9CAF4 8009BEF4 322200FF */  andi       $v0, $s1, 0xff
/* 9CAF8 8009BEF8 8FBF00C0 */  lw         $ra, 0xc0($sp)
/* 9CAFC 8009BEFC 8FB700BC */  lw         $s7, 0xbc($sp)
/* 9CB00 8009BF00 8FB600B8 */  lw         $s6, 0xb8($sp)
/* 9CB04 8009BF04 8FB500B4 */  lw         $s5, 0xb4($sp)
/* 9CB08 8009BF08 8FB400B0 */  lw         $s4, 0xb0($sp)
/* 9CB0C 8009BF0C 8FB300AC */  lw         $s3, 0xac($sp)
/* 9CB10 8009BF10 8FB200A8 */  lw         $s2, 0xa8($sp)
/* 9CB14 8009BF14 8FB100A4 */  lw         $s1, 0xa4($sp)
/* 9CB18 8009BF18 8FB000A0 */  lw         $s0, 0xa0($sp)
/* 9CB1C 8009BF1C 03E00008 */  jr         $ra
/* 9CB20 8009BF20 27BD00C8 */   addiu     $sp, $sp, 0xc8

glabel get_file_state
/* 9CB24 8009BF24 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 9CB28 8009BF28 AFB40060 */  sw         $s4, 0x60($sp)
/* 9CB2C 8009BF2C 0080A021 */  addu       $s4, $a0, $zero
/* 9CB30 8009BF30 AFB3005C */  sw         $s3, 0x5c($sp)
/* 9CB34 8009BF34 3C13800F */  lui        $s3, %hi(contMesgQ)
/* 9CB38 8009BF38 AFB20058 */  sw         $s2, 0x58($sp)
/* 9CB3C 8009BF3C 26723088 */  addiu      $s2, $s3, %lo(contMesgQ)
/* 9CB40 8009BF40 02402021 */  addu       $a0, $s2, $zero
/* 9CB44 8009BF44 AFB10054 */  sw         $s1, 0x54($sp)
/* 9CB48 8009BF48 30B100FF */  andi       $s1, $a1, 0xff
/* 9CB4C 8009BF4C 00002821 */  addu       $a1, $zero, $zero
/* 9CB50 8009BF50 AFB00050 */  sw         $s0, 0x50($sp)
/* 9CB54 8009BF54 30D000FF */  andi       $s0, $a2, 0xff
/* 9CB58 8009BF58 AFBF0064 */  sw         $ra, 0x64($sp)
/* 9CB5C 8009BF5C 0C03313C */  jal        osSendMesg
/* 9CB60 8009BF60 24060001 */   addiu     $a2, $zero, 1
/* 9CB64 8009BF64 02202821 */  addu       $a1, $s1, $zero
/* 9CB68 8009BF68 27A60010 */  addiu      $a2, $sp, 0x10
/* 9CB6C 8009BF6C 00101100 */  sll        $v0, $s0, 4
/* 9CB70 8009BF70 00501023 */  subu       $v0, $v0, $s0
/* 9CB74 8009BF74 8E44FE0C */  lw         $a0, -0x1f4($s2)
/* 9CB78 8009BF78 000210C0 */  sll        $v0, $v0, 3
/* 9CB7C 8009BF7C 00822021 */  addu       $a0, $a0, $v0
/* 9CB80 8009BF80 0C0317CC */  jal        osPfsFileState
/* 9CB84 8009BF84 24840004 */   addiu     $a0, $a0, 4
/* 9CB88 8009BF88 00408021 */  addu       $s0, $v0, $zero
/* 9CB8C 8009BF8C 16000011 */  bnez       $s0, .L8009BFD4
/* 9CB90 8009BF90 02802021 */   addu      $a0, $s4, $zero
/* 9CB94 8009BF94 26840008 */  addiu      $a0, $s4, 8
/* 9CB98 8009BF98 27A5001E */  addiu      $a1, $sp, 0x1e
/* 9CB9C 8009BF9C 0C027172 */  jal        translate_pfs_string
/* 9CBA0 8009BFA0 24060010 */   addiu     $a2, $zero, 0x10
/* 9CBA4 8009BFA4 26840019 */  addiu      $a0, $s4, 0x19
/* 9CBA8 8009BFA8 27A5001A */  addiu      $a1, $sp, 0x1a
/* 9CBAC 8009BFAC 0C027172 */  jal        translate_pfs_string
/* 9CBB0 8009BFB0 24060004 */   addiu     $a2, $zero, 4
/* 9CBB4 8009BFB4 97A20018 */  lhu        $v0, 0x18($sp)
/* 9CBB8 8009BFB8 8FA30014 */  lw         $v1, 0x14($sp)
/* 9CBBC 8009BFBC 97A40012 */  lhu        $a0, 0x12($sp)
/* 9CBC0 8009BFC0 A280001A */  sb         $zero, 0x1a($s4)
/* 9CBC4 8009BFC4 A6820002 */  sh         $v0, 2($s4)
/* 9CBC8 8009BFC8 AE830004 */  sw         $v1, 4($s4)
/* 9CBCC 8009BFCC 08026FF8 */  j          .L8009BFE0
/* 9CBD0 8009BFD0 A6840000 */   sh        $a0, ($s4)
.L8009BFD4:
/* 9CBD4 8009BFD4 00002821 */  addu       $a1, $zero, $zero
/* 9CBD8 8009BFD8 0C026380 */  jal        Calloc
/* 9CBDC 8009BFDC 24060020 */   addiu     $a2, $zero, 0x20
.L8009BFE0:
/* 9CBE0 8009BFE0 26643088 */  addiu      $a0, $s3, 0x3088
/* 9CBE4 8009BFE4 00002821 */  addu       $a1, $zero, $zero
/* 9CBE8 8009BFE8 0C0321E4 */  jal        osRecvMesg
/* 9CBEC 8009BFEC 24060001 */   addiu     $a2, $zero, 1
/* 9CBF0 8009BFF0 320200FF */  andi       $v0, $s0, 0xff
/* 9CBF4 8009BFF4 8FBF0064 */  lw         $ra, 0x64($sp)
/* 9CBF8 8009BFF8 8FB40060 */  lw         $s4, 0x60($sp)
/* 9CBFC 8009BFFC 8FB3005C */  lw         $s3, 0x5c($sp)
/* 9CC00 8009C000 8FB20058 */  lw         $s2, 0x58($sp)
/* 9CC04 8009C004 8FB10054 */  lw         $s1, 0x54($sp)
/* 9CC08 8009C008 8FB00050 */  lw         $s0, 0x50($sp)
/* 9CC0C 8009C00C 03E00008 */  jr         $ra
/* 9CC10 8009C010 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_8009C014
/* 9CC14 8009C014 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9CC18 8009C018 AFB40028 */  sw         $s4, 0x28($sp)
/* 9CC1C 8009C01C 0080A021 */  addu       $s4, $a0, $zero
/* 9CC20 8009C020 AFB00018 */  sw         $s0, 0x18($sp)
/* 9CC24 8009C024 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9CC28 8009C028 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9CC2C 8009C02C 02002021 */  addu       $a0, $s0, $zero
/* 9CC30 8009C030 AFB30024 */  sw         $s3, 0x24($sp)
/* 9CC34 8009C034 30B300FF */  andi       $s3, $a1, 0xff
/* 9CC38 8009C038 00002821 */  addu       $a1, $zero, $zero
/* 9CC3C 8009C03C AFB5002C */  sw         $s5, 0x2c($sp)
/* 9CC40 8009C040 30D5FFFF */  andi       $s5, $a2, 0xffff
/* 9CC44 8009C044 AFB1001C */  sw         $s1, 0x1c($sp)
/* 9CC48 8009C048 93B1004B */  lbu        $s1, 0x4b($sp)
/* 9CC4C 8009C04C 24060001 */  addiu      $a2, $zero, 1
/* 9CC50 8009C050 AFB20020 */  sw         $s2, 0x20($sp)
/* 9CC54 8009C054 AFBF0030 */  sw         $ra, 0x30($sp)
/* 9CC58 8009C058 0C03313C */  jal        osSendMesg
/* 9CC5C 8009C05C 30F2FFFF */   andi      $s2, $a3, 0xffff
/* 9CC60 8009C060 02602821 */  addu       $a1, $s3, $zero
/* 9CC64 8009C064 24060001 */  addiu      $a2, $zero, 1
/* 9CC68 8009C068 02A03821 */  addu       $a3, $s5, $zero
/* 9CC6C 8009C06C AFB20010 */  sw         $s2, 0x10($sp)
/* 9CC70 8009C070 AFB40014 */  sw         $s4, 0x14($sp)
/* 9CC74 8009C074 8E04FE0C */  lw         $a0, -0x1f4($s0)
/* 9CC78 8009C078 00111100 */  sll        $v0, $s1, 4
/* 9CC7C 8009C07C 00511023 */  subu       $v0, $v0, $s1
/* 9CC80 8009C080 000210C0 */  sll        $v0, $v0, 3
/* 9CC84 8009C084 00822021 */  addu       $a0, $a0, $v0
/* 9CC88 8009C088 0C031C30 */  jal        osPfsReadWriteFile
/* 9CC8C 8009C08C 24840004 */   addiu     $a0, $a0, 4
/* 9CC90 8009C090 02002021 */  addu       $a0, $s0, $zero
/* 9CC94 8009C094 00002821 */  addu       $a1, $zero, $zero
/* 9CC98 8009C098 24060001 */  addiu      $a2, $zero, 1
/* 9CC9C 8009C09C 0C0321E4 */  jal        osRecvMesg
/* 9CCA0 8009C0A0 00408021 */   addu      $s0, $v0, $zero
/* 9CCA4 8009C0A4 320200FF */  andi       $v0, $s0, 0xff
/* 9CCA8 8009C0A8 8FBF0030 */  lw         $ra, 0x30($sp)
/* 9CCAC 8009C0AC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 9CCB0 8009C0B0 8FB40028 */  lw         $s4, 0x28($sp)
/* 9CCB4 8009C0B4 8FB30024 */  lw         $s3, 0x24($sp)
/* 9CCB8 8009C0B8 8FB20020 */  lw         $s2, 0x20($sp)
/* 9CCBC 8009C0BC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9CCC0 8009C0C0 8FB00018 */  lw         $s0, 0x18($sp)
/* 9CCC4 8009C0C4 03E00008 */  jr         $ra
/* 9CCC8 8009C0C8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel read_write_ContPak
/* 9CCCC 8009C0CC 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 9CCD0 8009C0D0 AFB40028 */  sw         $s4, 0x28($sp)
/* 9CCD4 8009C0D4 0080A021 */  addu       $s4, $a0, $zero
/* 9CCD8 8009C0D8 AFB00018 */  sw         $s0, 0x18($sp)
/* 9CCDC 8009C0DC 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9CCE0 8009C0E0 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9CCE4 8009C0E4 02002021 */  addu       $a0, $s0, $zero
/* 9CCE8 8009C0E8 AFB30024 */  sw         $s3, 0x24($sp)
/* 9CCEC 8009C0EC 30B300FF */  andi       $s3, $a1, 0xff
/* 9CCF0 8009C0F0 00002821 */  addu       $a1, $zero, $zero
/* 9CCF4 8009C0F4 AFB5002C */  sw         $s5, 0x2c($sp)
/* 9CCF8 8009C0F8 30D5FFFF */  andi       $s5, $a2, 0xffff
/* 9CCFC 8009C0FC AFB1001C */  sw         $s1, 0x1c($sp)
/* 9CD00 8009C100 93B1004B */  lbu        $s1, 0x4b($sp)
/* 9CD04 8009C104 24060001 */  addiu      $a2, $zero, 1
/* 9CD08 8009C108 AFB20020 */  sw         $s2, 0x20($sp)
/* 9CD0C 8009C10C AFBF0030 */  sw         $ra, 0x30($sp)
/* 9CD10 8009C110 0C03313C */  jal        osSendMesg
/* 9CD14 8009C114 30F2FFFF */   andi      $s2, $a3, 0xffff
/* 9CD18 8009C118 02602821 */  addu       $a1, $s3, $zero
/* 9CD1C 8009C11C 00003021 */  addu       $a2, $zero, $zero
/* 9CD20 8009C120 02A03821 */  addu       $a3, $s5, $zero
/* 9CD24 8009C124 AFB20010 */  sw         $s2, 0x10($sp)
/* 9CD28 8009C128 AFB40014 */  sw         $s4, 0x14($sp)
/* 9CD2C 8009C12C 8E04FE0C */  lw         $a0, -0x1f4($s0)
/* 9CD30 8009C130 00111100 */  sll        $v0, $s1, 4
/* 9CD34 8009C134 00511023 */  subu       $v0, $v0, $s1
/* 9CD38 8009C138 000210C0 */  sll        $v0, $v0, 3
/* 9CD3C 8009C13C 00822021 */  addu       $a0, $a0, $v0
/* 9CD40 8009C140 0C031C30 */  jal        osPfsReadWriteFile
/* 9CD44 8009C144 24840004 */   addiu     $a0, $a0, 4
/* 9CD48 8009C148 02002021 */  addu       $a0, $s0, $zero
/* 9CD4C 8009C14C 00002821 */  addu       $a1, $zero, $zero
/* 9CD50 8009C150 24060001 */  addiu      $a2, $zero, 1
/* 9CD54 8009C154 0C0321E4 */  jal        osRecvMesg
/* 9CD58 8009C158 00408021 */   addu      $s0, $v0, $zero
/* 9CD5C 8009C15C 320200FF */  andi       $v0, $s0, 0xff
/* 9CD60 8009C160 8FBF0030 */  lw         $ra, 0x30($sp)
/* 9CD64 8009C164 8FB5002C */  lw         $s5, 0x2c($sp)
/* 9CD68 8009C168 8FB40028 */  lw         $s4, 0x28($sp)
/* 9CD6C 8009C16C 8FB30024 */  lw         $s3, 0x24($sp)
/* 9CD70 8009C170 8FB20020 */  lw         $s2, 0x20($sp)
/* 9CD74 8009C174 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9CD78 8009C178 8FB00018 */  lw         $s0, 0x18($sp)
/* 9CD7C 8009C17C 03E00008 */  jr         $ra
/* 9CD80 8009C180 27BD0038 */   addiu     $sp, $sp, 0x38

glabel erase_game_file
/* 9CD84 8009C184 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 9CD88 8009C188 AFB1005C */  sw         $s1, 0x5c($sp)
/* 9CD8C 8009C18C 309100FF */  andi       $s1, $a0, 0xff
/* 9CD90 8009C190 3C02800F */  lui        $v0, %hi(contMesgQ)
/* 9CD94 8009C194 AFB20060 */  sw         $s2, 0x60($sp)
/* 9CD98 8009C198 24523088 */  addiu      $s2, $v0, %lo(contMesgQ)
/* 9CD9C 8009C19C 02402021 */  addu       $a0, $s2, $zero
/* 9CDA0 8009C1A0 AFB00058 */  sw         $s0, 0x58($sp)
/* 9CDA4 8009C1A4 30B000FF */  andi       $s0, $a1, 0xff
/* 9CDA8 8009C1A8 00002821 */  addu       $a1, $zero, $zero
/* 9CDAC 8009C1AC AFBF0064 */  sw         $ra, 0x64($sp)
/* 9CDB0 8009C1B0 0C03313C */  jal        osSendMesg
/* 9CDB4 8009C1B4 24060001 */   addiu     $a2, $zero, 1
/* 9CDB8 8009C1B8 02202821 */  addu       $a1, $s1, $zero
/* 9CDBC 8009C1BC 27A60018 */  addiu      $a2, $sp, 0x18
/* 9CDC0 8009C1C0 00101100 */  sll        $v0, $s0, 4
/* 9CDC4 8009C1C4 00501023 */  subu       $v0, $v0, $s0
/* 9CDC8 8009C1C8 8E43FE0C */  lw         $v1, -0x1f4($s2)
/* 9CDCC 8009C1CC 000210C0 */  sll        $v0, $v0, 3
/* 9CDD0 8009C1D0 00621821 */  addu       $v1, $v1, $v0
/* 9CDD4 8009C1D4 24710004 */  addiu      $s1, $v1, 4
/* 9CDD8 8009C1D8 0C0317CC */  jal        osPfsFileState
/* 9CDDC 8009C1DC 02202021 */   addu      $a0, $s1, $zero
/* 9CDE0 8009C1E0 00408021 */  addu       $s0, $v0, $zero
/* 9CDE4 8009C1E4 1600000A */  bnez       $s0, .L8009C210
/* 9CDE8 8009C1E8 02402021 */   addu      $a0, $s2, $zero
/* 9CDEC 8009C1EC 02202021 */  addu       $a0, $s1, $zero
/* 9CDF0 8009C1F0 27A20022 */  addiu      $v0, $sp, 0x22
/* 9CDF4 8009C1F4 8FA6001C */  lw         $a2, 0x1c($sp)
/* 9CDF8 8009C1F8 97A50020 */  lhu        $a1, 0x20($sp)
/* 9CDFC 8009C1FC 27A70026 */  addiu      $a3, $sp, 0x26
/* 9CE00 8009C200 0C031744 */  jal        osPfsDeleteFile
/* 9CE04 8009C204 AFA20010 */   sw        $v0, 0x10($sp)
/* 9CE08 8009C208 00408021 */  addu       $s0, $v0, $zero
/* 9CE0C 8009C20C 02402021 */  addu       $a0, $s2, $zero
.L8009C210:
/* 9CE10 8009C210 00002821 */  addu       $a1, $zero, $zero
/* 9CE14 8009C214 0C0321E4 */  jal        osRecvMesg
/* 9CE18 8009C218 24060001 */   addiu     $a2, $zero, 1
/* 9CE1C 8009C21C 320200FF */  andi       $v0, $s0, 0xff
/* 9CE20 8009C220 8FBF0064 */  lw         $ra, 0x64($sp)
/* 9CE24 8009C224 8FB20060 */  lw         $s2, 0x60($sp)
/* 9CE28 8009C228 8FB1005C */  lw         $s1, 0x5c($sp)
/* 9CE2C 8009C22C 8FB00058 */  lw         $s0, 0x58($sp)
/* 9CE30 8009C230 03E00008 */  jr         $ra
/* 9CE34 8009C234 27BD0068 */   addiu     $sp, $sp, 0x68

glabel Ofunc_find_ControllerPak
/* 9CE38 8009C238 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9CE3C 8009C23C AFB1001C */  sw         $s1, 0x1c($sp)
/* 9CE40 8009C240 309100FF */  andi       $s1, $a0, 0xff
/* 9CE44 8009C244 AFB00018 */  sw         $s0, 0x18($sp)
/* 9CE48 8009C248 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9CE4C 8009C24C 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9CE50 8009C250 02002021 */  addu       $a0, $s0, $zero
/* 9CE54 8009C254 00002821 */  addu       $a1, $zero, $zero
/* 9CE58 8009C258 24060001 */  addiu      $a2, $zero, 1
/* 9CE5C 8009C25C AFBF0020 */  sw         $ra, 0x20($sp)
/* 9CE60 8009C260 0C03313C */  jal        osSendMesg
/* 9CE64 8009C264 A3A00010 */   sb        $zero, 0x10($sp)
/* 9CE68 8009C268 2604FFE8 */  addiu      $a0, $s0, -0x18
/* 9CE6C 8009C26C 0C031B78 */  jal        osPfsIsPlug
/* 9CE70 8009C270 27A50010 */   addiu     $a1, $sp, 0x10
/* 9CE74 8009C274 02002021 */  addu       $a0, $s0, $zero
/* 9CE78 8009C278 00002821 */  addu       $a1, $zero, $zero
/* 9CE7C 8009C27C 24060001 */  addiu      $a2, $zero, 1
/* 9CE80 8009C280 0C0321E4 */  jal        osRecvMesg
/* 9CE84 8009C284 00408021 */   addu      $s0, $v0, $zero
/* 9CE88 8009C288 56000004 */  bnel       $s0, $zero, .L8009C29C
/* 9CE8C 8009C28C 00001021 */   addu      $v0, $zero, $zero
/* 9CE90 8009C290 93A20010 */  lbu        $v0, 0x10($sp)
/* 9CE94 8009C294 02221007 */  srav       $v0, $v0, $s1
/* 9CE98 8009C298 30420001 */  andi       $v0, $v0, 1
.L8009C29C:
/* 9CE9C 8009C29C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 9CEA0 8009C2A0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9CEA4 8009C2A4 8FB00018 */  lw         $s0, 0x18($sp)
/* 9CEA8 8009C2A8 03E00008 */  jr         $ra
/* 9CEAC 8009C2AC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel controller_query_2
/* 9CEB0 8009C2B0 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 9CEB4 8009C2B4 AFB10054 */  sw         $s1, 0x54($sp)
/* 9CEB8 8009C2B8 309100FF */  andi       $s1, $a0, 0xff
/* 9CEBC 8009C2BC 3C02800F */  lui        $v0, %hi(contMesgQ)
/* 9CEC0 8009C2C0 AFB20058 */  sw         $s2, 0x58($sp)
/* 9CEC4 8009C2C4 24523088 */  addiu      $s2, $v0, %lo(contMesgQ)
/* 9CEC8 8009C2C8 02402021 */  addu       $a0, $s2, $zero
/* 9CECC 8009C2CC AFB3005C */  sw         $s3, 0x5c($sp)
/* 9CED0 8009C2D0 00A09821 */  addu       $s3, $a1, $zero
/* 9CED4 8009C2D4 00002821 */  addu       $a1, $zero, $zero
/* 9CED8 8009C2D8 24060001 */  addiu      $a2, $zero, 1
/* 9CEDC 8009C2DC AFBF0060 */  sw         $ra, 0x60($sp)
/* 9CEE0 8009C2E0 0C03313C */  jal        osSendMesg
/* 9CEE4 8009C2E4 AFB00050 */   sw        $s0, 0x50($sp)
/* 9CEE8 8009C2E8 2650FFE8 */  addiu      $s0, $s2, -0x18
/* 9CEEC 8009C2EC 0C02F9D4 */  jal        osContStartQuery
/* 9CEF0 8009C2F0 02002021 */   addu      $a0, $s0, $zero
/* 9CEF4 8009C2F4 02002021 */  addu       $a0, $s0, $zero
/* 9CEF8 8009C2F8 00002821 */  addu       $a1, $zero, $zero
/* 9CEFC 8009C2FC 0C0321E4 */  jal        osRecvMesg
/* 9CF00 8009C300 24060001 */   addiu     $a2, $zero, 1
/* 9CF04 8009C304 0C02F9F4 */  jal        osContGetQuery
/* 9CF08 8009C308 27A40010 */   addiu     $a0, $sp, 0x10
/* 9CF0C 8009C30C 00118880 */  sll        $s1, $s1, 2
/* 9CF10 8009C310 27A30010 */  addiu      $v1, $sp, 0x10
/* 9CF14 8009C314 00718821 */  addu       $s1, $v1, $s1
/* 9CF18 8009C318 92220003 */  lbu        $v0, 3($s1)
/* 9CF1C 8009C31C 30430008 */  andi       $v1, $v0, 8
/* 9CF20 8009C320 30420004 */  andi       $v0, $v0, 4
/* 9CF24 8009C324 10400002 */  beqz       $v0, .L8009C330
/* 9CF28 8009C328 2C700001 */   sltiu     $s0, $v1, 1
/* 9CF2C 8009C32C 00008021 */  addu       $s0, $zero, $zero
.L8009C330:
/* 9CF30 8009C330 96220000 */  lhu        $v0, ($s1)
/* 9CF34 8009C334 24030005 */  addiu      $v1, $zero, 5
/* 9CF38 8009C338 30421F07 */  andi       $v0, $v0, 0x1f07
/* 9CF3C 8009C33C 54430001 */  bnel       $v0, $v1, .L8009C344
/* 9CF40 8009C340 00008021 */   addu      $s0, $zero, $zero
.L8009C344:
/* 9CF44 8009C344 02402021 */  addu       $a0, $s2, $zero
/* 9CF48 8009C348 00002821 */  addu       $a1, $zero, $zero
/* 9CF4C 8009C34C 0C0321E4 */  jal        osRecvMesg
/* 9CF50 8009C350 24060001 */   addiu     $a2, $zero, 1
/* 9CF54 8009C354 12600004 */  beqz       $s3, .L8009C368
/* 9CF58 8009C358 02001021 */   addu      $v0, $s0, $zero
/* 9CF5C 8009C35C 92230002 */  lbu        $v1, 2($s1)
/* 9CF60 8009C360 080270DB */  j          .L8009C36C
/* 9CF64 8009C364 A2630000 */   sb        $v1, ($s3)
.L8009C368:
/* 9CF68 8009C368 00001021 */  addu       $v0, $zero, $zero
.L8009C36C:
/* 9CF6C 8009C36C 8FBF0060 */  lw         $ra, 0x60($sp)
/* 9CF70 8009C370 8FB3005C */  lw         $s3, 0x5c($sp)
/* 9CF74 8009C374 8FB20058 */  lw         $s2, 0x58($sp)
/* 9CF78 8009C378 8FB10054 */  lw         $s1, 0x54($sp)
/* 9CF7C 8009C37C 8FB00050 */  lw         $s0, 0x50($sp)
/* 9CF80 8009C380 03E00008 */  jr         $ra
/* 9CF84 8009C384 27BD0068 */   addiu     $sp, $sp, 0x68

glabel query_controller
/* 9CF88 8009C388 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 9CF8C 8009C38C AFB20058 */  sw         $s2, 0x58($sp)
/* 9CF90 8009C390 309200FF */  andi       $s2, $a0, 0xff
/* 9CF94 8009C394 3C02800F */  lui        $v0, %hi(contMesgQ)
/* 9CF98 8009C398 AFB3005C */  sw         $s3, 0x5c($sp)
/* 9CF9C 8009C39C 24533088 */  addiu      $s3, $v0, %lo(contMesgQ)
/* 9CFA0 8009C3A0 02602021 */  addu       $a0, $s3, $zero
/* 9CFA4 8009C3A4 00002821 */  addu       $a1, $zero, $zero
/* 9CFA8 8009C3A8 24060001 */  addiu      $a2, $zero, 1
/* 9CFAC 8009C3AC AFBF0060 */  sw         $ra, 0x60($sp)
/* 9CFB0 8009C3B0 AFB10054 */  sw         $s1, 0x54($sp)
/* 9CFB4 8009C3B4 0C03313C */  jal        osSendMesg
/* 9CFB8 8009C3B8 AFB00050 */   sw        $s0, 0x50($sp)
/* 9CFBC 8009C3BC 2670FFE8 */  addiu      $s0, $s3, -0x18
/* 9CFC0 8009C3C0 0C02F9D4 */  jal        osContStartQuery
/* 9CFC4 8009C3C4 02002021 */   addu      $a0, $s0, $zero
/* 9CFC8 8009C3C8 02002021 */  addu       $a0, $s0, $zero
/* 9CFCC 8009C3CC 00002821 */  addu       $a1, $zero, $zero
/* 9CFD0 8009C3D0 0C0321E4 */  jal        osRecvMesg
/* 9CFD4 8009C3D4 24060001 */   addiu     $a2, $zero, 1
/* 9CFD8 8009C3D8 0C02F9F4 */  jal        osContGetQuery
/* 9CFDC 8009C3DC 27A40010 */   addiu     $a0, $sp, 0x10
/* 9CFE0 8009C3E0 00122080 */  sll        $a0, $s2, 2
/* 9CFE4 8009C3E4 27A30010 */  addiu      $v1, $sp, 0x10
/* 9CFE8 8009C3E8 00642021 */  addu       $a0, $v1, $a0
/* 9CFEC 8009C3EC 90820003 */  lbu        $v0, 3($a0)
/* 9CFF0 8009C3F0 30430008 */  andi       $v1, $v0, 8
/* 9CFF4 8009C3F4 30420004 */  andi       $v0, $v0, 4
/* 9CFF8 8009C3F8 10400002 */  beqz       $v0, .L8009C404
/* 9CFFC 8009C3FC 2C710001 */   sltiu     $s1, $v1, 1
/* 9D000 8009C400 00008821 */  addu       $s1, $zero, $zero
.L8009C404:
/* 9D004 8009C404 94820000 */  lhu        $v0, ($a0)
/* 9D008 8009C408 24030005 */  addiu      $v1, $zero, 5
/* 9D00C 8009C40C 30421F07 */  andi       $v0, $v0, 0x1f07
/* 9D010 8009C410 54430001 */  bnel       $v0, $v1, .L8009C418
/* 9D014 8009C414 00008821 */   addu      $s1, $zero, $zero
.L8009C418:
/* 9D018 8009C418 02602021 */  addu       $a0, $s3, $zero
/* 9D01C 8009C41C 00002821 */  addu       $a1, $zero, $zero
/* 9D020 8009C420 00121100 */  sll        $v0, $s2, 4
/* 9D024 8009C424 00521023 */  subu       $v0, $v0, $s2
/* 9D028 8009C428 8E63FE0C */  lw         $v1, -0x1f4($s3)
/* 9D02C 8009C42C 000210C0 */  sll        $v0, $v0, 3
/* 9D030 8009C430 00621821 */  addu       $v1, $v1, $v0
/* 9D034 8009C434 8C670004 */  lw         $a3, 4($v1)
/* 9D038 8009C438 24060001 */  addiu      $a2, $zero, 1
/* 9D03C 8009C43C 30E70004 */  andi       $a3, $a3, 4
/* 9D040 8009C440 0C0321E4 */  jal        osRecvMesg
/* 9D044 8009C444 0007802B */   sltu      $s0, $zero, $a3
/* 9D048 8009C448 12200002 */  beqz       $s1, .L8009C454
/* 9D04C 8009C44C 00001021 */   addu      $v0, $zero, $zero
/* 9D050 8009C450 02001021 */  addu       $v0, $s0, $zero
.L8009C454:
/* 9D054 8009C454 8FBF0060 */  lw         $ra, 0x60($sp)
/* 9D058 8009C458 8FB3005C */  lw         $s3, 0x5c($sp)
/* 9D05C 8009C45C 8FB20058 */  lw         $s2, 0x58($sp)
/* 9D060 8009C460 8FB10054 */  lw         $s1, 0x54($sp)
/* 9D064 8009C464 8FB00050 */  lw         $s0, 0x50($sp)
/* 9D068 8009C468 03E00008 */  jr         $ra
/* 9D06C 8009C46C 27BD0068 */   addiu     $sp, $sp, 0x68

glabel func_8009C470
/* 9D070 8009C470 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 9D074 8009C474 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D078 8009C478 3C10800F */  lui        $s0, %hi(contMesgQ)
/* 9D07C 8009C47C 26103088 */  addiu      $s0, $s0, %lo(contMesgQ)
/* 9D080 8009C480 02002021 */  addu       $a0, $s0, $zero
/* 9D084 8009C484 00002821 */  addu       $a1, $zero, $zero
/* 9D088 8009C488 AFB10014 */  sw         $s1, 0x14($sp)
/* 9D08C 8009C48C 30D100FF */  andi       $s1, $a2, 0xff
/* 9D090 8009C490 24060001 */  addiu      $a2, $zero, 1
/* 9D094 8009C494 F7B40020 */  sdc1       $f20, 0x20($sp)
/* 9D098 8009C498 46006506 */  mov.s      $f20, $f12
/* 9D09C 8009C49C F7B60028 */  sdc1       $f22, 0x28($sp)
/* 9D0A0 8009C4A0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 9D0A4 8009C4A4 0C03313C */  jal        osSendMesg
/* 9D0A8 8009C4A8 46007586 */   mov.s     $f22, $f14
/* 9D0AC 8009C4AC 02002021 */  addu       $a0, $s0, $zero
/* 9D0B0 8009C4B0 00002821 */  addu       $a1, $zero, $zero
/* 9D0B4 8009C4B4 24060001 */  addiu      $a2, $zero, 1
/* 9D0B8 8009C4B8 00111100 */  sll        $v0, $s1, 4
/* 9D0BC 8009C4BC 00511023 */  subu       $v0, $v0, $s1
/* 9D0C0 8009C4C0 8E03FE0C */  lw         $v1, -0x1f4($s0)
/* 9D0C4 8009C4C4 000210C0 */  sll        $v0, $v0, 3
/* 9D0C8 8009C4C8 00431021 */  addu       $v0, $v0, $v1
/* 9D0CC 8009C4CC E454006C */  swc1       $f20, 0x6c($v0)
/* 9D0D0 8009C4D0 0C0321E4 */  jal        osRecvMesg
/* 9D0D4 8009C4D4 E4560070 */   swc1      $f22, 0x70($v0)
/* 9D0D8 8009C4D8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 9D0DC 8009C4DC 8FB10014 */  lw         $s1, 0x14($sp)
/* 9D0E0 8009C4E0 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D0E4 8009C4E4 D7B60028 */  ldc1       $f22, 0x28($sp)
/* 9D0E8 8009C4E8 D7B40020 */  ldc1       $f20, 0x20($sp)
/* 9D0EC 8009C4EC 03E00008 */  jr         $ra
/* 9D0F0 8009C4F0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel get_cont_aidyn
/* 9D0F4 8009C4F4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9D0F8 8009C4F8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9D0FC 8009C4FC 00809821 */  addu       $s3, $a0, $zero
/* 9D100 8009C500 AFB20018 */  sw         $s2, 0x18($sp)
/* 9D104 8009C504 3C12800F */  lui        $s2, %hi(contMesgQ)
/* 9D108 8009C508 AFB10014 */  sw         $s1, 0x14($sp)
/* 9D10C 8009C50C 26513088 */  addiu      $s1, $s2, %lo(contMesgQ)
/* 9D110 8009C510 02202021 */  addu       $a0, $s1, $zero
/* 9D114 8009C514 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D118 8009C518 30B000FF */  andi       $s0, $a1, 0xff
/* 9D11C 8009C51C 00002821 */  addu       $a1, $zero, $zero
/* 9D120 8009C520 AFBF0020 */  sw         $ra, 0x20($sp)
/* 9D124 8009C524 0C03313C */  jal        osSendMesg
/* 9D128 8009C528 24060001 */   addiu     $a2, $zero, 1
/* 9D12C 8009C52C 00101900 */  sll        $v1, $s0, 4
/* 9D130 8009C530 00701823 */  subu       $v1, $v1, $s0
/* 9D134 8009C534 8E22FE0C */  lw         $v0, -0x1f4($s1)
/* 9D138 8009C538 000318C0 */  sll        $v1, $v1, 3
/* 9D13C 8009C53C 00432821 */  addu       $a1, $v0, $v1
/* 9D140 8009C540 90A40076 */  lbu        $a0, 0x76($a1)
/* 9D144 8009C544 10800013 */  beqz       $a0, .L8009C594
/* 9D148 8009C548 24100001 */   addiu     $s0, $zero, 1
/* 9D14C 8009C54C 90A40074 */  lbu        $a0, 0x74($a1)
/* 9D150 8009C550 8CA30000 */  lw         $v1, ($a1)
/* 9D154 8009C554 00041040 */  sll        $v0, $a0, 1
/* 9D158 8009C558 00441021 */  addu       $v0, $v0, $a0
/* 9D15C 8009C55C 00021080 */  sll        $v0, $v0, 2
/* 9D160 8009C560 00441021 */  addu       $v0, $v0, $a0
/* 9D164 8009C564 00021080 */  sll        $v0, $v0, 2
/* 9D168 8009C568 00621821 */  addu       $v1, $v1, $v0
/* 9D16C 8009C56C AE630000 */  sw         $v1, ($s3)
/* 9D170 8009C570 90A20074 */  lbu        $v0, 0x74($a1)
/* 9D174 8009C574 90A30076 */  lbu        $v1, 0x76($a1)
/* 9D178 8009C578 24420001 */  addiu      $v0, $v0, 1
/* 9D17C 8009C57C 304200FF */  andi       $v0, $v0, 0xff
/* 9D180 8009C580 2463FFFF */  addiu      $v1, $v1, -1
/* 9D184 8009C584 3042007F */  andi       $v0, $v0, 0x7f
/* 9D188 8009C588 A0A30076 */  sb         $v1, 0x76($a1)
/* 9D18C 8009C58C 08027166 */  j          .L8009C598
/* 9D190 8009C590 A0A20074 */   sb        $v0, 0x74($a1)
.L8009C594:
/* 9D194 8009C594 00008021 */  addu       $s0, $zero, $zero
.L8009C598:
/* 9D198 8009C598 26443088 */  addiu      $a0, $s2, 0x3088
/* 9D19C 8009C59C 00002821 */  addu       $a1, $zero, $zero
/* 9D1A0 8009C5A0 0C0321E4 */  jal        osRecvMesg
/* 9D1A4 8009C5A4 24060001 */   addiu     $a2, $zero, 1
/* 9D1A8 8009C5A8 02001021 */  addu       $v0, $s0, $zero
/* 9D1AC 8009C5AC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 9D1B0 8009C5B0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 9D1B4 8009C5B4 8FB20018 */  lw         $s2, 0x18($sp)
/* 9D1B8 8009C5B8 8FB10014 */  lw         $s1, 0x14($sp)
/* 9D1BC 8009C5BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D1C0 8009C5C0 03E00008 */  jr         $ra
/* 9D1C4 8009C5C4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel translate_pfs_string
/* 9D1C8 8009C5C8 00804821 */  addu       $t1, $a0, $zero
/* 9D1CC 8009C5CC 30C400FF */  andi       $a0, $a2, 0xff
/* 9D1D0 8009C5D0 10800010 */  beqz       $a0, .L8009C614
/* 9D1D4 8009C5D4 00003821 */   addu      $a3, $zero, $zero
/* 9D1D8 8009C5D8 3C02800F */  lui        $v0, %hi(pfs_charset)
/* 9D1DC 8009C5DC 24462DA0 */  addiu      $a2, $v0, %lo(pfs_charset)
/* 9D1E0 8009C5E0 00A71021 */  addu       $v0, $a1, $a3
.L8009C5E4:
/* 9D1E4 8009C5E4 90430000 */  lbu        $v1, ($v0)
/* 9D1E8 8009C5E8 2C620042 */  sltiu      $v0, $v1, 0x42
/* 9D1EC 8009C5EC 10400003 */  beqz       $v0, .L8009C5FC
/* 9D1F0 8009C5F0 2408002A */   addiu     $t0, $zero, 0x2a
/* 9D1F4 8009C5F4 00661021 */  addu       $v0, $v1, $a2
/* 9D1F8 8009C5F8 90480000 */  lbu        $t0, ($v0)
.L8009C5FC:
/* 9D1FC 8009C5FC 01271021 */  addu       $v0, $t1, $a3
/* 9D200 8009C600 A0480000 */  sb         $t0, ($v0)
/* 9D204 8009C604 24E70001 */  addiu      $a3, $a3, 1
/* 9D208 8009C608 00E4102B */  sltu       $v0, $a3, $a0
/* 9D20C 8009C60C 1440FFF5 */  bnez       $v0, .L8009C5E4
/* 9D210 8009C610 00A71021 */   addu      $v0, $a1, $a3
.L8009C614:
/* 9D214 8009C614 01241021 */  addu       $v0, $t1, $a0
/* 9D218 8009C618 03E00008 */  jr         $ra
/* 9D21C 8009C61C A0400000 */   sb        $zero, ($v0)

glabel make_pfs_string
/* 9D220 8009C620 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 9D224 8009C624 AFB10014 */  sw         $s1, 0x14($sp)
/* 9D228 8009C628 00808821 */  addu       $s1, $a0, $zero
/* 9D22C 8009C62C AFB20018 */  sw         $s2, 0x18($sp)
/* 9D230 8009C630 00A09021 */  addu       $s2, $a1, $zero
/* 9D234 8009C634 AFB00010 */  sw         $s0, 0x10($sp)
/* 9D238 8009C638 30D000FF */  andi       $s0, $a2, 0xff
/* 9D23C 8009C63C AFBF001C */  sw         $ra, 0x1c($sp)
/* 9D240 8009C640 0C03353E */  jal        strlen
/* 9D244 8009C644 02402021 */   addu      $a0, $s2, $zero
/* 9D248 8009C648 00001821 */  addu       $v1, $zero, $zero
/* 9D24C 8009C64C 00002021 */  addu       $a0, $zero, $zero
/* 9D250 8009C650 12000024 */  beqz       $s0, .L8009C6E4
/* 9D254 8009C654 304C00FF */   andi      $t4, $v0, 0xff
/* 9D258 8009C658 240E000F */  addiu      $t6, $zero, 0xf
/* 9D25C 8009C65C 3C0D800F */  lui        $t5, 0x800f
/* 9D260 8009C660 006C102B */  sltu       $v0, $v1, $t4
.L8009C664:
/* 9D264 8009C664 10400018 */  beqz       $v0, .L8009C6C8
/* 9D268 8009C668 00003821 */   addu      $a3, $zero, $zero
/* 9D26C 8009C66C 00002821 */  addu       $a1, $zero, $zero
/* 9D270 8009C670 02441021 */  addu       $v0, $s2, $a0
/* 9D274 8009C674 90480000 */  lbu        $t0, ($v0)
/* 9D278 8009C678 246A0001 */  addiu      $t2, $v1, 1
/* 9D27C 8009C67C 24890001 */  addiu      $t1, $a0, 1
/* 9D280 8009C680 25AB2DA0 */  addiu      $t3, $t5, 0x2da0
/* 9D284 8009C684 02243021 */  addu       $a2, $s1, $a0
/* 9D288 8009C688 00AB1021 */  addu       $v0, $a1, $t3
.L8009C68C:
/* 9D28C 8009C68C 90430000 */  lbu        $v1, ($v0)
/* 9D290 8009C690 14680004 */  bne        $v1, $t0, .L8009C6A4
/* 9D294 8009C694 24A20001 */   addiu     $v0, $a1, 1
/* 9D298 8009C698 A0C50000 */  sb         $a1, ($a2)
/* 9D29C 8009C69C 080271AA */  j          .L8009C6A8
/* 9D2A0 8009C6A0 24070001 */   addiu     $a3, $zero, 1
.L8009C6A4:
/* 9D2A4 8009C6A4 304500FF */  andi       $a1, $v0, 0xff
.L8009C6A8:
/* 9D2A8 8009C6A8 14E00005 */  bnez       $a3, .L8009C6C0
/* 9D2AC 8009C6AC 2CA20042 */   sltiu     $v0, $a1, 0x42
/* 9D2B0 8009C6B0 1440FFF6 */  bnez       $v0, .L8009C68C
/* 9D2B4 8009C6B4 00AB1021 */   addu      $v0, $a1, $t3
/* 9D2B8 8009C6B8 02241021 */  addu       $v0, $s1, $a0
/* 9D2BC 8009C6BC A04E0000 */  sb         $t6, ($v0)
.L8009C6C0:
/* 9D2C0 8009C6C0 080271B5 */  j          .L8009C6D4
/* 9D2C4 8009C6C4 314300FF */   andi      $v1, $t2, 0xff
.L8009C6C8:
/* 9D2C8 8009C6C8 02241021 */  addu       $v0, $s1, $a0
/* 9D2CC 8009C6CC A0400000 */  sb         $zero, ($v0)
/* 9D2D0 8009C6D0 24890001 */  addiu      $t1, $a0, 1
.L8009C6D4:
/* 9D2D4 8009C6D4 312400FF */  andi       $a0, $t1, 0xff
/* 9D2D8 8009C6D8 0090102B */  sltu       $v0, $a0, $s0
/* 9D2DC 8009C6DC 1440FFE1 */  bnez       $v0, .L8009C664
/* 9D2E0 8009C6E0 006C102B */   sltu      $v0, $v1, $t4
.L8009C6E4:
/* 9D2E4 8009C6E4 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9D2E8 8009C6E8 8FB20018 */  lw         $s2, 0x18($sp)
/* 9D2EC 8009C6EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 9D2F0 8009C6F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 9D2F4 8009C6F4 03E00008 */  jr         $ra
/* 9D2F8 8009C6F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel cont_delay
/* 9D2FC 8009C6FC 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9D300 8009C700 AFB1001C */  sw         $s1, 0x1c($sp)
/* 9D304 8009C704 00008821 */  addu       $s1, $zero, $zero
/* 9D308 8009C708 AFB20020 */  sw         $s2, 0x20($sp)
/* 9D30C 8009C70C 309200FF */  andi       $s2, $a0, 0xff
/* 9D310 8009C710 AFBF0024 */  sw         $ra, 0x24($sp)
/* 9D314 8009C714 AFB00018 */  sw         $s0, 0x18($sp)
/* 9D318 8009C718 AFA00010 */  sw         $zero, 0x10($sp)
/* 9D31C 8009C71C 080271CA */  j          .L8009C728
/* 9D320 8009C720 27B00010 */   addiu     $s0, $sp, 0x10
.L8009C724:
/* 9D324 8009C724 3051FFFF */  andi       $s1, $v0, 0xffff
.L8009C728:
/* 9D328 8009C728 02002021 */  addu       $a0, $s0, $zero
/* 9D32C 8009C72C 0C02713D */  jal        get_cont_aidyn
/* 9D330 8009C730 02402821 */   addu      $a1, $s2, $zero
/* 9D334 8009C734 1440FFFB */  bnez       $v0, .L8009C724
/* 9D338 8009C738 26220001 */   addiu     $v0, $s1, 1
/* 9D33C 8009C73C 02201021 */  addu       $v0, $s1, $zero
/* 9D340 8009C740 8FBF0024 */  lw         $ra, 0x24($sp)
/* 9D344 8009C744 8FB20020 */  lw         $s2, 0x20($sp)
/* 9D348 8009C748 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9D34C 8009C74C 8FB00018 */  lw         $s0, 0x18($sp)
/* 9D350 8009C750 03E00008 */  jr         $ra
/* 9D354 8009C754 27BD0028 */   addiu     $sp, $sp, 0x28
/* 9D358 8009C758 00000000 */  nop
/* 9D35C 8009C75C 00000000 */  nop
