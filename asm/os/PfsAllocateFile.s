.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsAllocateFile
/* C5940 800C4D40 27BDFD68 */  addiu      $sp, $sp, -0x298
/* C5944 800C4D44 AFB00270 */  sw         $s0, 0x270($sp)
/* C5948 800C4D48 8FB002AC */  lw         $s0, 0x2ac($sp)
/* C594C 800C4D4C A7A50256 */  sh         $a1, 0x256($sp)
/* C5950 800C4D50 97A50256 */  lhu        $a1, 0x256($sp)
/* C5954 800C4D54 AFB20278 */  sw         $s2, 0x278($sp)
/* C5958 800C4D58 00809021 */  addu       $s2, $a0, $zero
/* C595C 800C4D5C AFB60288 */  sw         $s6, 0x288($sp)
/* C5960 800C4D60 0000B021 */  addu       $s6, $zero, $zero
/* C5964 800C4D64 AFB7028C */  sw         $s7, 0x28c($sp)
/* C5968 800C4D68 0000B821 */  addu       $s7, $zero, $zero
/* C596C 800C4D6C AFB50284 */  sw         $s5, 0x284($sp)
/* C5970 800C4D70 0000A821 */  addu       $s5, $zero, $zero
/* C5974 800C4D74 AFA6025C */  sw         $a2, 0x25c($sp)
/* C5978 800C4D78 2CC30001 */  sltiu      $v1, $a2, 1
/* C597C 800C4D7C AFBF0294 */  sw         $ra, 0x294($sp)
/* C5980 800C4D80 AFBE0290 */  sw         $fp, 0x290($sp)
/* C5984 800C4D84 AFB40280 */  sw         $s4, 0x280($sp)
/* C5988 800C4D88 AFB3027C */  sw         $s3, 0x27c($sp)
/* C598C 800C4D8C AFB10274 */  sw         $s1, 0x274($sp)
/* C5990 800C4D90 2CA20001 */  sltiu      $v0, $a1, 1
/* C5994 800C4D94 00431025 */  or         $v0, $v0, $v1
/* C5998 800C4D98 14400020 */  bnez       $v0, .L800C4E1C
/* C599C 800C4D9C AFA70264 */   sw        $a3, 0x264($sp)
/* C59A0 800C4DA0 260600FF */  addiu      $a2, $s0, 0xff
/* C59A4 800C4DA4 04C20001 */  bltzl      $a2, .L800C4DAC
/* C59A8 800C4DA8 260601FE */   addiu     $a2, $s0, 0x1fe
.L800C4DAC:
/* C59AC 800C4DAC 00069A03 */  sra        $s3, $a2, 8
/* C59B0 800C4DB0 8FA802A8 */  lw         $t0, 0x2a8($sp)
/* C59B4 800C4DB4 8FA6025C */  lw         $a2, 0x25c($sp)
/* C59B8 800C4DB8 8FA70264 */  lw         $a3, 0x264($sp)
/* C59BC 800C4DBC AFA80010 */  sw         $t0, 0x10($sp)
/* C59C0 800C4DC0 8FA802B0 */  lw         $t0, 0x2b0($sp)
/* C59C4 800C4DC4 02402021 */  addu       $a0, $s2, $zero
/* C59C8 800C4DC8 0C031D58 */  jal        osPfsFindFile
/* C59CC 800C4DCC AFA80014 */   sw        $t0, 0x14($sp)
/* C59D0 800C4DD0 00401821 */  addu       $v1, $v0, $zero
/* C59D4 800C4DD4 10600003 */  beqz       $v1, .L800C4DE4
/* C59D8 800C4DD8 24020005 */   addiu     $v0, $zero, 5
/* C59DC 800C4DDC 1462008F */  bne        $v1, $v0, .L800C501C
/* C59E0 800C4DE0 00601021 */   addu      $v0, $v1, $zero
.L800C4DE4:
/* C59E4 800C4DE4 8FA802B0 */  lw         $t0, 0x2b0($sp)
/* C59E8 800C4DE8 8D030000 */  lw         $v1, ($t0)
/* C59EC 800C4DEC 2402FFFF */  addiu      $v0, $zero, -1
/* C59F0 800C4DF0 1462008A */  bne        $v1, $v0, .L800C501C
/* C59F4 800C4DF4 24020009 */   addiu     $v0, $zero, 9
/* C59F8 800C4DF8 02402021 */  addu       $a0, $s2, $zero
/* C59FC 800C4DFC 0C031834 */  jal        osPfsFreeBlocks
/* C5A00 800C4E00 27A50240 */   addiu     $a1, $sp, 0x240
/* C5A04 800C4E04 8FA20240 */  lw         $v0, 0x240($sp)
/* C5A08 800C4E08 0050102A */  slt        $v0, $v0, $s0
/* C5A0C 800C4E0C 14400083 */  bnez       $v0, .L800C501C
/* C5A10 800C4E10 24020007 */   addiu     $v0, $zero, 7
/* C5A14 800C4E14 16600003 */  bnez       $s3, .L800C4E24
/* C5A18 800C4E18 02402021 */   addu      $a0, $s2, $zero
.L800C4E1C:
/* C5A1C 800C4E1C 08031407 */  j          .L800C501C
/* C5A20 800C4E20 24020005 */   addiu     $v0, $zero, 5
.L800C4E24:
/* C5A24 800C4E24 00002821 */  addu       $a1, $zero, $zero
/* C5A28 800C4E28 8FA802B0 */  lw         $t0, 0x2b0($sp)
/* C5A2C 800C4E2C 00003021 */  addu       $a2, $zero, $zero
/* C5A30 800C4E30 00003821 */  addu       $a3, $zero, $zero
/* C5A34 800C4E34 AFA00010 */  sw         $zero, 0x10($sp)
/* C5A38 800C4E38 0C031D58 */  jal        osPfsFindFile
/* C5A3C 800C4E3C AFA80014 */   sw        $t0, 0x14($sp)
/* C5A40 800C4E40 00401821 */  addu       $v1, $v0, $zero
/* C5A44 800C4E44 10600003 */  beqz       $v1, .L800C4E54
/* C5A48 800C4E48 24020005 */   addiu     $v0, $zero, 5
/* C5A4C 800C4E4C 14620073 */  bne        $v1, $v0, .L800C501C
/* C5A50 800C4E50 00601021 */   addu      $v0, $v1, $zero
.L800C4E54:
/* C5A54 800C4E54 8FA802B0 */  lw         $t0, 0x2b0($sp)
/* C5A58 800C4E58 8D030000 */  lw         $v1, ($t0)
/* C5A5C 800C4E5C 2402FFFF */  addiu      $v0, $zero, -1
/* C5A60 800C4E60 1062006E */  beq        $v1, $v0, .L800C501C
/* C5A64 800C4E64 24020008 */   addiu     $v0, $zero, 8
/* C5A68 800C4E68 92420064 */  lbu        $v0, 0x64($s2)
/* C5A6C 800C4E6C 1040004A */  beqz       $v0, .L800C4F98
/* C5A70 800C4E70 00008821 */   addu      $s1, $zero, $zero
/* C5A74 800C4E74 27B40120 */  addiu      $s4, $sp, 0x120
/* C5A78 800C4E78 02402021 */  addu       $a0, $s2, $zero
.L800C4E7C:
/* C5A7C 800C4E7C 27A50020 */  addiu      $a1, $sp, 0x20
/* C5A80 800C4E80 00003021 */  addu       $a2, $zero, $zero
/* C5A84 800C4E84 323000FF */  andi       $s0, $s1, 0xff
/* C5A88 800C4E88 0C03162F */  jal        __osPfsRWInode
/* C5A8C 800C4E8C 02003821 */   addu      $a3, $s0, $zero
/* C5A90 800C4E90 00401821 */  addu       $v1, $v0, $zero
/* C5A94 800C4E94 14600048 */  bnez       $v1, .L800C4FB8
/* C5A98 800C4E98 02402021 */   addu      $a0, $s2, $zero
/* C5A9C 800C4E9C 27A50020 */  addiu      $a1, $sp, 0x20
/* C5AA0 800C4EA0 02603021 */  addu       $a2, $s3, $zero
/* C5AA4 800C4EA4 27A70244 */  addiu      $a3, $sp, 0x244
/* C5AA8 800C4EA8 27A20248 */  addiu      $v0, $sp, 0x248
/* C5AAC 800C4EAC AFA20014 */  sw         $v0, 0x14($sp)
/* C5AB0 800C4EB0 27A2024C */  addiu      $v0, $sp, 0x24c
/* C5AB4 800C4EB4 AFB00010 */  sw         $s0, 0x10($sp)
/* C5AB8 800C4EB8 0C031413 */  jal        __osPfsDeclearPage
/* C5ABC 800C4EBC AFA20018 */   sw        $v0, 0x18($sp)
/* C5AC0 800C4EC0 00401821 */  addu       $v1, $v0, $zero
/* C5AC4 800C4EC4 1460003C */  bnez       $v1, .L800C4FB8
/* C5AC8 800C4EC8 2402FFFF */   addiu     $v0, $zero, -1
/* C5ACC 800C4ECC 8FA30244 */  lw         $v1, 0x244($sp)
/* C5AD0 800C4ED0 1062002B */  beq        $v1, $v0, .L800C4F80
/* C5AD4 800C4ED4 00000000 */   nop
/* C5AD8 800C4ED8 12A0000F */  beqz       $s5, .L800C4F18
/* C5ADC 800C4EDC 02402021 */   addu      $a0, $s2, $zero
/* C5AE0 800C4EE0 02802821 */  addu       $a1, $s4, $zero
/* C5AE4 800C4EE4 00161040 */  sll        $v0, $s6, 1
/* C5AE8 800C4EE8 02821021 */  addu       $v0, $s4, $v0
/* C5AEC 800C4EEC A0510000 */  sb         $s1, ($v0)
/* C5AF0 800C4EF0 8FA30244 */  lw         $v1, 0x244($sp)
/* C5AF4 800C4EF4 24060001 */  addiu      $a2, $zero, 1
/* C5AF8 800C4EF8 32E700FF */  andi       $a3, $s7, 0xff
/* C5AFC 800C4EFC 0C03162F */  jal        __osPfsRWInode
/* C5B00 800C4F00 A0430001 */   sb        $v1, 1($v0)
/* C5B04 800C4F04 00401821 */  addu       $v1, $v0, $zero
/* C5B08 800C4F08 10600006 */  beqz       $v1, .L800C4F24
/* C5B0C 800C4F0C 00000000 */   nop
/* C5B10 800C4F10 08031407 */  j          .L800C501C
/* C5B14 800C4F14 00000000 */   nop
.L800C4F18:
/* C5B18 800C4F18 306300FF */  andi       $v1, $v1, 0xff
/* C5B1C 800C4F1C 00111200 */  sll        $v0, $s1, 8
/* C5B20 800C4F20 0043F025 */  or         $fp, $v0, $v1
.L800C4F24:
/* C5B24 800C4F24 8FA20248 */  lw         $v0, 0x248($sp)
/* C5B28 800C4F28 0053102A */  slt        $v0, $v0, $s3
/* C5B2C 800C4F2C 1440000C */  bnez       $v0, .L800C4F60
/* C5B30 800C4F30 27A40020 */   addiu     $a0, $sp, 0x20
/* C5B34 800C4F34 00009821 */  addu       $s3, $zero, $zero
/* C5B38 800C4F38 02402021 */  addu       $a0, $s2, $zero
/* C5B3C 800C4F3C 27A50020 */  addiu      $a1, $sp, 0x20
/* C5B40 800C4F40 24060001 */  addiu      $a2, $zero, 1
/* C5B44 800C4F44 0C03162F */  jal        __osPfsRWInode
/* C5B48 800C4F48 322700FF */   andi      $a3, $s1, 0xff
/* C5B4C 800C4F4C 00401821 */  addu       $v1, $v0, $zero
/* C5B50 800C4F50 10600011 */  beqz       $v1, .L800C4F98
/* C5B54 800C4F54 00000000 */   nop
/* C5B58 800C4F58 08031407 */  j          .L800C501C
/* C5B5C 800C4F5C 00000000 */   nop
.L800C4F60:
/* C5B60 800C4F60 27A50120 */  addiu      $a1, $sp, 0x120
/* C5B64 800C4F64 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C5B68 800C4F68 24060100 */   addiu     $a2, $zero, 0x100
/* C5B6C 800C4F6C 8FB6024C */  lw         $s6, 0x24c($sp)
/* C5B70 800C4F70 8FA20248 */  lw         $v0, 0x248($sp)
/* C5B74 800C4F74 0220B821 */  addu       $s7, $s1, $zero
/* C5B78 800C4F78 26B50001 */  addiu      $s5, $s5, 1
/* C5B7C 800C4F7C 02629823 */  subu       $s3, $s3, $v0
.L800C4F80:
/* C5B80 800C4F80 92430064 */  lbu        $v1, 0x64($s2)
/* C5B84 800C4F84 26310001 */  addiu      $s1, $s1, 1
/* C5B88 800C4F88 322200FF */  andi       $v0, $s1, 0xff
/* C5B8C 800C4F8C 0043102B */  sltu       $v0, $v0, $v1
/* C5B90 800C4F90 1440FFBA */  bnez       $v0, .L800C4E7C
/* C5B94 800C4F94 02402021 */   addu      $a0, $s2, $zero
.L800C4F98:
/* C5B98 800C4F98 1E600020 */  bgtz       $s3, .L800C501C
/* C5B9C 800C4F9C 24020003 */   addiu     $v0, $zero, 3
/* C5BA0 800C4FA0 8FA30244 */  lw         $v1, 0x244($sp)
/* C5BA4 800C4FA4 2402FFFF */  addiu      $v0, $zero, -1
/* C5BA8 800C4FA8 14620005 */  bne        $v1, $v0, .L800C4FC0
/* C5BAC 800C4FAC 27A50230 */   addiu     $a1, $sp, 0x230
/* C5BB0 800C4FB0 08031407 */  j          .L800C501C
/* C5BB4 800C4FB4 24020003 */   addiu     $v0, $zero, 3
.L800C4FB8:
/* C5BB8 800C4FB8 08031407 */  j          .L800C501C
/* C5BBC 800C4FBC 00601021 */   addu      $v0, $v1, $zero
.L800C4FC0:
/* C5BC0 800C4FC0 97A80256 */  lhu        $t0, 0x256($sp)
/* C5BC4 800C4FC4 8FA40264 */  lw         $a0, 0x264($sp)
/* C5BC8 800C4FC8 A7A80224 */  sh         $t0, 0x224($sp)
/* C5BCC 800C4FCC 8FA8025C */  lw         $t0, 0x25c($sp)
/* C5BD0 800C4FD0 24060010 */  addiu      $a2, $zero, 0x10
/* C5BD4 800C4FD4 A7BE0226 */  sh         $fp, 0x226($sp)
/* C5BD8 800C4FD8 A7A0022A */  sh         $zero, 0x22a($sp)
/* C5BDC 800C4FDC 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C5BE0 800C4FE0 AFA80220 */   sw        $t0, 0x220($sp)
/* C5BE4 800C4FE4 8FA402A8 */  lw         $a0, 0x2a8($sp)
/* C5BE8 800C4FE8 27A5022C */  addiu      $a1, $sp, 0x22c
/* C5BEC 800C4FEC 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C5BF0 800C4FF0 24060004 */   addiu     $a2, $zero, 4
/* C5BF4 800C4FF4 8FA802B0 */  lw         $t0, 0x2b0($sp)
/* C5BF8 800C4FF8 8E46005C */  lw         $a2, 0x5c($s2)
/* C5BFC 800C4FFC 8D020000 */  lw         $v0, ($t0)
/* C5C00 800C5000 27A70220 */  addiu      $a3, $sp, 0x220
/* C5C04 800C5004 AFA00010 */  sw         $zero, 0x10($sp)
/* C5C08 800C5008 8E440004 */  lw         $a0, 4($s2)
/* C5C0C 800C500C 8E450008 */  lw         $a1, 8($s2)
/* C5C10 800C5010 00C23021 */  addu       $a2, $a2, $v0
/* C5C14 800C5014 0C030B30 */  jal        __osContRamWrite
/* C5C18 800C5018 30C6FFFF */   andi      $a2, $a2, 0xffff
.L800C501C:
/* C5C1C 800C501C 8FBF0294 */  lw         $ra, 0x294($sp)
/* C5C20 800C5020 8FBE0290 */  lw         $fp, 0x290($sp)
/* C5C24 800C5024 8FB7028C */  lw         $s7, 0x28c($sp)
/* C5C28 800C5028 8FB60288 */  lw         $s6, 0x288($sp)
/* C5C2C 800C502C 8FB50284 */  lw         $s5, 0x284($sp)
/* C5C30 800C5030 8FB40280 */  lw         $s4, 0x280($sp)
/* C5C34 800C5034 8FB3027C */  lw         $s3, 0x27c($sp)
/* C5C38 800C5038 8FB20278 */  lw         $s2, 0x278($sp)
/* C5C3C 800C503C 8FB10274 */  lw         $s1, 0x274($sp)
/* C5C40 800C5040 8FB00270 */  lw         $s0, 0x270($sp)
/* C5C44 800C5044 03E00008 */  jr         $ra
/* C5C48 800C5048 27BD0298 */   addiu     $sp, $sp, 0x298

glabel __osPfsDeclearPage
/* C5C4C 800C504C 24020001 */  addiu      $v0, $zero, 1
/* C5C50 800C5050 8FAA0014 */  lw         $t2, 0x14($sp)
/* C5C54 800C5054 93AB0013 */  lbu        $t3, 0x13($sp)
/* C5C58 800C5058 8FAE0018 */  lw         $t6, 0x18($sp)
/* C5C5C 800C505C 15600002 */  bnez       $t3, .L800C5068
/* C5C60 800C5060 00007821 */   addu      $t7, $zero, $zero
/* C5C64 800C5064 8C820060 */  lw         $v0, 0x60($a0)
.L800C5068:
/* C5C68 800C5068 00402021 */  addu       $a0, $v0, $zero
/* C5C6C 800C506C 28820080 */  slti       $v0, $a0, 0x80
/* C5C70 800C5070 1040000A */  beqz       $v0, .L800C509C
/* C5C74 800C5074 00041040 */   sll       $v0, $a0, 1
/* C5C78 800C5078 24080003 */  addiu      $t0, $zero, 3
/* C5C7C 800C507C 00451821 */  addu       $v1, $v0, $a1
.L800C5080:
/* C5C80 800C5080 94620000 */  lhu        $v0, ($v1)
/* C5C84 800C5084 10480006 */  beq        $v0, $t0, .L800C50A0
/* C5C88 800C5088 24020080 */   addiu     $v0, $zero, 0x80
/* C5C8C 800C508C 24840001 */  addiu      $a0, $a0, 1
/* C5C90 800C5090 28820080 */  slti       $v0, $a0, 0x80
/* C5C94 800C5094 1440FFFA */  bnez       $v0, .L800C5080
/* C5C98 800C5098 24630002 */   addiu     $v1, $v1, 2
.L800C509C:
/* C5C9C 800C509C 24020080 */  addiu      $v0, $zero, 0x80
.L800C50A0:
/* C5CA0 800C50A0 14820004 */  bne        $a0, $v0, .L800C50B4
/* C5CA4 800C50A4 24030001 */   addiu     $v1, $zero, 1
/* C5CA8 800C50A8 2402FFFF */  addiu      $v0, $zero, -1
/* C5CAC 800C50AC 08031457 */  j          .L800C515C
/* C5CB0 800C50B0 ACE20000 */   sw        $v0, ($a3)
.L800C50B4:
/* C5CB4 800C50B4 AD430000 */  sw         $v1, ($t2)
/* C5CB8 800C50B8 00804021 */  addu       $t0, $a0, $zero
/* C5CBC 800C50BC 25040001 */  addiu      $a0, $t0, 1
/* C5CC0 800C50C0 0066182A */  slt        $v1, $v1, $a2
/* C5CC4 800C50C4 28820080 */  slti       $v0, $a0, 0x80
/* C5CC8 800C50C8 00621824 */  and        $v1, $v1, $v0
/* C5CCC 800C50CC 10600015 */  beqz       $v1, .L800C5124
/* C5CD0 800C50D0 01006821 */   addu      $t5, $t0, $zero
/* C5CD4 800C50D4 240C0003 */  addiu      $t4, $zero, 3
/* C5CD8 800C50D8 00041040 */  sll        $v0, $a0, 1
/* C5CDC 800C50DC 00454821 */  addu       $t1, $v0, $a1
.L800C50E0:
/* C5CE0 800C50E0 95220000 */  lhu        $v0, ($t1)
/* C5CE4 800C50E4 144C0008 */  bne        $v0, $t4, .L800C5108
/* C5CE8 800C50E8 00081040 */   sll       $v0, $t0, 1
/* C5CEC 800C50EC 00A21021 */  addu       $v0, $a1, $v0
/* C5CF0 800C50F0 A04B0000 */  sb         $t3, ($v0)
/* C5CF4 800C50F4 A0440001 */  sb         $a0, 1($v0)
/* C5CF8 800C50F8 8D420000 */  lw         $v0, ($t2)
/* C5CFC 800C50FC 00804021 */  addu       $t0, $a0, $zero
/* C5D00 800C5100 24420001 */  addiu      $v0, $v0, 1
/* C5D04 800C5104 AD420000 */  sw         $v0, ($t2)
.L800C5108:
/* C5D08 800C5108 8D430000 */  lw         $v1, ($t2)
/* C5D0C 800C510C 24840001 */  addiu      $a0, $a0, 1
/* C5D10 800C5110 28820080 */  slti       $v0, $a0, 0x80
/* C5D14 800C5114 0066182A */  slt        $v1, $v1, $a2
/* C5D18 800C5118 00621824 */  and        $v1, $v1, $v0
/* C5D1C 800C511C 1460FFF0 */  bnez       $v1, .L800C50E0
/* C5D20 800C5120 25290002 */   addiu     $t1, $t1, 2
.L800C5124:
/* C5D24 800C5124 24020080 */  addiu      $v0, $zero, 0x80
/* C5D28 800C5128 14820007 */  bne        $a0, $v0, .L800C5148
/* C5D2C 800C512C ACED0000 */   sw        $t5, ($a3)
/* C5D30 800C5130 8D420000 */  lw         $v0, ($t2)
/* C5D34 800C5134 0046102A */  slt        $v0, $v0, $a2
/* C5D38 800C5138 50400004 */  beql       $v0, $zero, .L800C514C
/* C5D3C 800C513C 00081040 */   sll       $v0, $t0, 1
/* C5D40 800C5140 08031457 */  j          .L800C515C
/* C5D44 800C5144 ADC80000 */   sw        $t0, ($t6)
.L800C5148:
/* C5D48 800C5148 00081040 */  sll        $v0, $t0, 1
.L800C514C:
/* C5D4C 800C514C 00A21021 */  addu       $v0, $a1, $v0
/* C5D50 800C5150 24030001 */  addiu      $v1, $zero, 1
/* C5D54 800C5154 A4430000 */  sh         $v1, ($v0)
/* C5D58 800C5158 ADC00000 */  sw         $zero, ($t6)
.L800C515C:
/* C5D5C 800C515C 03E00008 */  jr         $ra
/* C5D60 800C5160 01E01021 */   addu      $v0, $t7, $zero
/* C5D64 800C5164 00000000 */  nop
/* C5D68 800C5168 00000000 */  nop
/* C5D6C 800C516C 00000000 */  nop
