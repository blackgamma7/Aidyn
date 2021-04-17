.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osPfsGetStatus
/* C6DE0 800C61E0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* C6DE4 800C61E4 AFB20028 */  sw         $s2, 0x28($sp)
/* C6DE8 800C61E8 00809021 */  addu       $s2, $a0, $zero
/* C6DEC 800C61EC AFB3002C */  sw         $s3, 0x2c($sp)
/* C6DF0 800C61F0 00A09821 */  addu       $s3, $a1, $zero
/* C6DF4 800C61F4 02602021 */  addu       $a0, $s3, $zero
/* C6DF8 800C61F8 240200FA */  addiu      $v0, $zero, 0xfa
/* C6DFC 800C61FC AFBF0030 */  sw         $ra, 0x30($sp)
/* C6E00 800C6200 AFB10024 */  sw         $s1, 0x24($sp)
/* C6E04 800C6204 AFB00020 */  sw         $s0, 0x20($sp)
/* C6E08 800C6208 3C01800F */  lui        $at, %hi(__osPfsInodeCacheBank)
/* C6E0C 800C620C A0223864 */  sb         $v0, %lo(__osPfsInodeCacheBank)($at)
/* C6E10 800C6210 0C0318B4 */  jal        __osPfsRequestOneChannel
/* C6E14 800C6214 00002821 */   addu      $a1, $zero, $zero
/* C6E18 800C6218 24040001 */  addiu      $a0, $zero, 1
/* C6E1C 800C621C 3C11800F */  lui        $s1, %hi(__osPfsPifRam)
/* C6E20 800C6220 26317C30 */  addiu      $s1, $s1, %lo(__osPfsPifRam)
/* C6E24 800C6224 0C0332F4 */  jal        __osSiRawStartDma
/* C6E28 800C6228 02202821 */   addu      $a1, $s1, $zero
/* C6E2C 800C622C 02402021 */  addu       $a0, $s2, $zero
/* C6E30 800C6230 27B00018 */  addiu      $s0, $sp, 0x18
/* C6E34 800C6234 02002821 */  addu       $a1, $s0, $zero
/* C6E38 800C6238 0C0321E4 */  jal        osRecvMesg
/* C6E3C 800C623C 24060001 */   addiu     $a2, $zero, 1
/* C6E40 800C6240 00002021 */  addu       $a0, $zero, $zero
/* C6E44 800C6244 0C0332F4 */  jal        __osSiRawStartDma
/* C6E48 800C6248 02202821 */   addu      $a1, $s1, $zero
/* C6E4C 800C624C 02402021 */  addu       $a0, $s2, $zero
/* C6E50 800C6250 02002821 */  addu       $a1, $s0, $zero
/* C6E54 800C6254 24060001 */  addiu      $a2, $zero, 1
/* C6E58 800C6258 0C0321E4 */  jal        osRecvMesg
/* C6E5C 800C625C 00408021 */   addu      $s0, $v0, $zero
/* C6E60 800C6260 02602021 */  addu       $a0, $s3, $zero
/* C6E64 800C6264 0C0318D9 */  jal        __osPfsGetOneChannelData
/* C6E68 800C6268 27A50010 */   addiu     $a1, $sp, 0x10
/* C6E6C 800C626C 93A30012 */  lbu        $v1, 0x12($sp)
/* C6E70 800C6270 30620001 */  andi       $v0, $v1, 1
/* C6E74 800C6274 10400003 */  beqz       $v0, .L800C6284
/* C6E78 800C6278 30620002 */   andi      $v0, $v1, 2
/* C6E7C 800C627C 1440000D */  bnez       $v0, .L800C62B4
/* C6E80 800C6280 24020002 */   addiu     $v0, $zero, 2
.L800C6284:
/* C6E84 800C6284 97A20012 */  lhu        $v0, 0x12($sp)
/* C6E88 800C6288 24030100 */  addiu      $v1, $zero, 0x100
/* C6E8C 800C628C 304201FF */  andi       $v0, $v0, 0x1ff
/* C6E90 800C6290 10430003 */  beq        $v0, $v1, .L800C62A0
/* C6E94 800C6294 00000000 */   nop
/* C6E98 800C6298 080318AD */  j          .L800C62B4
/* C6E9C 800C629C 24020001 */   addiu     $v0, $zero, 1
.L800C62A0:
/* C6EA0 800C62A0 93A30012 */  lbu        $v1, 0x12($sp)
/* C6EA4 800C62A4 30630004 */  andi       $v1, $v1, 4
/* C6EA8 800C62A8 14600002 */  bnez       $v1, .L800C62B4
/* C6EAC 800C62AC 24020004 */   addiu     $v0, $zero, 4
/* C6EB0 800C62B0 02001021 */  addu       $v0, $s0, $zero
.L800C62B4:
/* C6EB4 800C62B4 8FBF0030 */  lw         $ra, 0x30($sp)
/* C6EB8 800C62B8 8FB3002C */  lw         $s3, 0x2c($sp)
/* C6EBC 800C62BC 8FB20028 */  lw         $s2, 0x28($sp)
/* C6EC0 800C62C0 8FB10024 */  lw         $s1, 0x24($sp)
/* C6EC4 800C62C4 8FB00020 */  lw         $s0, 0x20($sp)
/* C6EC8 800C62C8 03E00008 */  jr         $ra
/* C6ECC 800C62CC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel __osPfsRequestOneChannel
/* C6ED0 800C62D0 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* C6ED4 800C62D4 3C03800F */  lui        $v1, %hi(__osPfsPifRam+0x3C)
/* C6ED8 800C62D8 24637C6C */  addiu      $v1, $v1, %lo(__osPfsPifRam+0x3C)
/* C6EDC 800C62DC 2466FFC4 */  addiu      $a2, $v1, -0x3c
/* C6EE0 800C62E0 00003821 */  addu       $a3, $zero, $zero
/* C6EE4 800C62E4 240200FE */  addiu      $v0, $zero, 0xfe
/* C6EE8 800C62E8 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* C6EEC 800C62EC A02257A0 */  sb         $v0, %lo(__osContLastCmd)($at)
/* C6EF0 800C62F0 24020001 */  addiu      $v0, $zero, 1
/* C6EF4 800C62F4 AC620000 */  sw         $v0, ($v1)
/* C6EF8 800C62F8 24020001 */  addiu      $v0, $zero, 1
/* C6EFC 800C62FC A3A20000 */  sb         $v0, ($sp)
/* C6F00 800C6300 24020003 */  addiu      $v0, $zero, 3
/* C6F04 800C6304 A3A20001 */  sb         $v0, 1($sp)
/* C6F08 800C6308 240200FF */  addiu      $v0, $zero, 0xff
/* C6F0C 800C630C A3A50002 */  sb         $a1, 2($sp)
/* C6F10 800C6310 A3A20003 */  sb         $v0, 3($sp)
/* C6F14 800C6314 A3A20004 */  sb         $v0, 4($sp)
/* C6F18 800C6318 18800006 */  blez       $a0, .L800C6334
/* C6F1C 800C631C A3A20005 */   sb        $v0, 5($sp)
.L800C6320:
/* C6F20 800C6320 A0C00000 */  sb         $zero, ($a2)
/* C6F24 800C6324 24E70001 */  addiu      $a3, $a3, 1
/* C6F28 800C6328 00E4102A */  slt        $v0, $a3, $a0
/* C6F2C 800C632C 1440FFFC */  bnez       $v0, .L800C6320
/* C6F30 800C6330 24C60001 */   addiu     $a2, $a2, 1
.L800C6334:
/* C6F34 800C6334 8BA20000 */  lwl        $v0, ($sp)
/* C6F38 800C6338 9BA20003 */  lwr        $v0, 3($sp)
/* C6F3C 800C633C 83A30004 */  lb         $v1, 4($sp)
/* C6F40 800C6340 83A40005 */  lb         $a0, 5($sp)
/* C6F44 800C6344 A8C20000 */  swl        $v0, ($a2)
/* C6F48 800C6348 B8C20003 */  swr        $v0, 3($a2)
/* C6F4C 800C634C A0C30004 */  sb         $v1, 4($a2)
/* C6F50 800C6350 A0C40005 */  sb         $a0, 5($a2)
/* C6F54 800C6354 240200FE */  addiu      $v0, $zero, 0xfe
/* C6F58 800C6358 A0C20006 */  sb         $v0, 6($a2)
/* C6F5C 800C635C 03E00008 */  jr         $ra
/* C6F60 800C6360 27BD0010 */   addiu     $sp, $sp, 0x10

glabel __osPfsGetOneChannelData
/* C6F64 800C6364 27BDFFF0 */  addiu      $sp, $sp, -0x10
/* C6F68 800C6368 00A03821 */  addu       $a3, $a1, $zero
/* C6F6C 800C636C 3C06800F */  lui        $a2, %hi(__osPfsPifRam)
/* C6F70 800C6370 24C67C30 */  addiu      $a2, $a2, %lo(__osPfsPifRam)
/* C6F74 800C6374 18800005 */  blez       $a0, .L800C638C
/* C6F78 800C6378 00001821 */   addu      $v1, $zero, $zero
.L800C637C:
/* C6F7C 800C637C 24630001 */  addiu      $v1, $v1, 1
/* C6F80 800C6380 0064102A */  slt        $v0, $v1, $a0
/* C6F84 800C6384 1440FFFD */  bnez       $v0, .L800C637C
/* C6F88 800C6388 24C60001 */   addiu     $a2, $a2, 1
.L800C638C:
/* C6F8C 800C638C 88C20000 */  lwl        $v0, ($a2)
/* C6F90 800C6390 98C20003 */  lwr        $v0, 3($a2)
/* C6F94 800C6394 80C30004 */  lb         $v1, 4($a2)
/* C6F98 800C6398 80C40005 */  lb         $a0, 5($a2)
/* C6F9C 800C639C ABA20000 */  swl        $v0, ($sp)
/* C6FA0 800C63A0 BBA20003 */  swr        $v0, 3($sp)
/* C6FA4 800C63A4 A3A30004 */  sb         $v1, 4($sp)
/* C6FA8 800C63A8 A3A40005 */  sb         $a0, 5($sp)
/* C6FAC 800C63AC 93A20001 */  lbu        $v0, 1($sp)
/* C6FB0 800C63B0 304200C0 */  andi       $v0, $v0, 0xc0
/* C6FB4 800C63B4 00021102 */  srl        $v0, $v0, 4
/* C6FB8 800C63B8 14400008 */  bnez       $v0, .L800C63DC
/* C6FBC 800C63BC A0E20003 */   sb        $v0, 3($a3)
/* C6FC0 800C63C0 93A20004 */  lbu        $v0, 4($sp)
/* C6FC4 800C63C4 93A30003 */  lbu        $v1, 3($sp)
/* C6FC8 800C63C8 00021200 */  sll        $v0, $v0, 8
/* C6FCC 800C63CC 00621825 */  or         $v1, $v1, $v0
/* C6FD0 800C63D0 A4E30000 */  sh         $v1, ($a3)
/* C6FD4 800C63D4 93A20005 */  lbu        $v0, 5($sp)
/* C6FD8 800C63D8 A0E20002 */  sb         $v0, 2($a3)
.L800C63DC:
/* C6FDC 800C63DC 03E00008 */  jr         $ra
/* C6FE0 800C63E0 27BD0010 */   addiu     $sp, $sp, 0x10
/* C6FE4 800C63E4 00000000 */  nop
/* C6FE8 800C63E8 00000000 */  nop
/* C6FEC 800C63EC 00000000 */  nop
