.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __rmonSetFault
/* CAC10 800CA010 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CAC14 800CA014 AFBF0020 */  sw         $ra, 0x20($sp)
/* CAC18 800CA018 90820004 */  lbu        $v0, 4($a0)
/* CAC1C 800CA01C 24050010 */  addiu      $a1, $zero, 0x10
/* CAC20 800CA020 A7A00016 */  sh         $zero, 0x16($sp)
/* CAC24 800CA024 A3A20014 */  sb         $v0, 0x14($sp)
/* CAC28 800CA028 8C82000C */  lw         $v0, 0xc($a0)
/* CAC2C 800CA02C 24060001 */  addiu      $a2, $zero, 1
/* CAC30 800CA030 27A40010 */  addiu      $a0, $sp, 0x10
/* CAC34 800CA034 0C03255A */  jal        __rmonSendReply
/* CAC38 800CA038 AFA2001C */   sw        $v0, 0x1c($sp)
/* CAC3C 800CA03C 8FBF0020 */  lw         $ra, 0x20($sp)
/* CAC40 800CA040 00001021 */  addu       $v0, $zero, $zero
/* CAC44 800CA044 03E00008 */  jr         $ra
/* CAC48 800CA048 27BD0028 */   addiu     $sp, $sp, 0x28

glabel __rmonInit
/* CAC4C 800CA04C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CAC50 800CA050 AFB00018 */  sw         $s0, 0x18($sp)
/* CAC54 800CA054 3C108010 */  lui        $s0, %hi(__rmonMQ)
/* CAC58 800CA058 2610E660 */  addiu      $s0, $s0, %lo(__rmonMQ)
/* CAC5C 800CA05C 02002021 */  addu       $a0, $s0, $zero
/* CAC60 800CA060 3C058010 */  lui        $a1, %hi(rmonmisc_bss_01B0)
/* CAC64 800CA064 24A5A600 */  addiu      $a1, $a1, %lo(rmonmisc_bss_01B0)
/* CAC68 800CA068 AFBF001C */  sw         $ra, 0x1c($sp)
/* CAC6C 800CA06C 0C02FBA4 */  jal        osCreateMesgQueue
/* CAC70 800CA070 24060008 */   addiu     $a2, $zero, 8
/* CAC74 800CA074 2404000A */  addiu      $a0, $zero, 0xa
/* CAC78 800CA078 02002821 */  addu       $a1, $s0, $zero
/* CAC7C 800CA07C 0C033188 */  jal        osSetEventMesg
/* CAC80 800CA080 24060002 */   addiu     $a2, $zero, 2
/* CAC84 800CA084 2404000B */  addiu      $a0, $zero, 0xb
/* CAC88 800CA088 02002821 */  addu       $a1, $s0, $zero
/* CAC8C 800CA08C 0C033188 */  jal        osSetEventMesg
/* CAC90 800CA090 24060004 */   addiu     $a2, $zero, 4
/* CAC94 800CA094 2404000C */  addiu      $a0, $zero, 0xc
/* CAC98 800CA098 02002821 */  addu       $a1, $s0, $zero
/* CAC9C 800CA09C 0C033188 */  jal        osSetEventMesg
/* CACA0 800CA0A0 24060008 */   addiu     $a2, $zero, 8
/* CACA4 800CA0A4 2404000D */  addiu      $a0, $zero, 0xd
/* CACA8 800CA0A8 02002821 */  addu       $a1, $s0, $zero
/* CACAC 800CA0AC 0C033188 */  jal        osSetEventMesg
/* CACB0 800CA0B0 00003021 */   addu      $a2, $zero, $zero
/* CACB4 800CA0B4 3C108010 */  lui        $s0, %hi(rmonThread)
/* CACB8 800CA0B8 2610A450 */  addiu      $s0, $s0, %lo(rmonThread)
/* CACBC 800CA0BC 02002021 */  addu       $a0, $s0, $zero
/* CACC0 800CA0C0 00002821 */  addu       $a1, $zero, $zero
/* CACC4 800CA0C4 3C06800D */  lui        $a2, %hi(__rmonIOhandler)
/* CACC8 800CA0C8 24C68A04 */  addiu      $a2, $a2, %lo(__rmonIOhandler)
/* CACCC 800CA0CC 00003821 */  addu       $a3, $zero, $zero
/* CACD0 800CA0D0 3C028010 */  lui        $v0, %hi(rmonmisc_bss_41D0)
/* CACD4 800CA0D4 2442E620 */  addiu      $v0, $v0, %lo(rmonmisc_bss_41D0)
/* CACD8 800CA0D8 AFA20010 */  sw         $v0, 0x10($sp)
/* CACDC 800CA0DC 240200FF */  addiu      $v0, $zero, 0xff
/* CACE0 800CA0E0 0C02FBB0 */  jal        osCreateThread
/* CACE4 800CA0E4 AFA20014 */   sw        $v0, 0x14($sp)
/* CACE8 800CA0E8 24040096 */  addiu      $a0, $zero, 0x96
/* CACEC 800CA0EC 3C058010 */  lui        $a1, %hi(rmonmisc_bss_41F0)
/* CACF0 800CA0F0 24A5E640 */  addiu      $a1, $a1, %lo(rmonmisc_bss_41F0)
/* CACF4 800CA0F4 3C068010 */  lui        $a2, %hi(rmonmisc_bss_41D0)
/* CACF8 800CA0F8 24C6E620 */  addiu      $a2, $a2, %lo(rmonmisc_bss_41D0)
/* CACFC 800CA0FC 0C031E68 */  jal        osCreatePiManager
/* CAD00 800CA100 24070008 */   addiu     $a3, $zero, 8
/* CAD04 800CA104 0C0334B8 */  jal        osStartThread
/* CAD08 800CA108 02002021 */   addu      $a0, $s0, $zero
/* CAD0C 800CA10C 8FBF001C */  lw         $ra, 0x1c($sp)
/* CAD10 800CA110 8FB00018 */  lw         $s0, 0x18($sp)
/* CAD14 800CA114 03E00008 */  jr         $ra
/* CAD18 800CA118 27BD0020 */   addiu     $sp, $sp, 0x20

glabel __rmonPanic
.L800CA11C:
/* CAD1C 800CA11C 08032847 */  j          .L800CA11C
/* CAD20 800CA120 00000000 */   nop

glabel __rmonSetComm
/* CAD24 800CA124 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CAD28 800CA128 AFBF0020 */  sw         $ra, 0x20($sp)
/* CAD2C 800CA12C 90820004 */  lbu        $v0, 4($a0)
/* CAD30 800CA130 27A40010 */  addiu      $a0, $sp, 0x10
/* CAD34 800CA134 24050010 */  addiu      $a1, $zero, 0x10
/* CAD38 800CA138 24060001 */  addiu      $a2, $zero, 1
/* CAD3C 800CA13C AFA0001C */  sw         $zero, 0x1c($sp)
/* CAD40 800CA140 A7A00016 */  sh         $zero, 0x16($sp)
/* CAD44 800CA144 0C03255A */  jal        __rmonSendReply
/* CAD48 800CA148 A3A20014 */   sb        $v0, 0x14($sp)
/* CAD4C 800CA14C 8FBF0020 */  lw         $ra, 0x20($sp)
/* CAD50 800CA150 00001021 */  addu       $v0, $zero, $zero
/* CAD54 800CA154 03E00008 */  jr         $ra
/* CAD58 800CA158 27BD0028 */   addiu     $sp, $sp, 0x28
/* CAD5C 800CA15C 00000000 */  nop
