.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSynAddPlayer
/* CE150 800CD550 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CE154 800CD554 AFB10014 */  sw         $s1, 0x14($sp)
/* CE158 800CD558 00808821 */  addu       $s1, $a0, $zero
/* CE15C 800CD55C AFB00010 */  sw         $s0, 0x10($sp)
/* CE160 800CD560 00A08021 */  addu       $s0, $a1, $zero
/* CE164 800CD564 AFBF0018 */  sw         $ra, 0x18($sp)
/* CE168 800CD568 0C0331C8 */  jal        osSetIntMask
/* CE16C 800CD56C 24040001 */   addiu     $a0, $zero, 1
/* CE170 800CD570 8E230020 */  lw         $v1, 0x20($s1)
/* CE174 800CD574 AE030010 */  sw         $v1, 0x10($s0)
/* CE178 800CD578 8E230000 */  lw         $v1, ($s1)
/* CE17C 800CD57C 00402021 */  addu       $a0, $v0, $zero
/* CE180 800CD580 AE030000 */  sw         $v1, ($s0)
/* CE184 800CD584 0C0331C8 */  jal        osSetIntMask
/* CE188 800CD588 AE300000 */   sw        $s0, ($s1)
/* CE18C 800CD58C 8FBF0018 */  lw         $ra, 0x18($sp)
/* CE190 800CD590 8FB10014 */  lw         $s1, 0x14($sp)
/* CE194 800CD594 8FB00010 */  lw         $s0, 0x10($sp)
/* CE198 800CD598 03E00008 */  jr         $ra
/* CE19C 800CD59C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel alSynAllocVoice
/* CE1A0 800CD5A0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CE1A4 800CD5A4 AFBF0024 */  sw         $ra, 0x24($sp)
/* CE1A8 800CD5A8 AFB20020 */  sw         $s2, 0x20($sp)
/* CE1AC 800CD5AC AFB1001C */  sw         $s1, 0x1c($sp)
/* CE1B0 800CD5B0 AFB00018 */  sw         $s0, 0x18($sp)
/* CE1B4 800CD5B4 94C20000 */  lhu        $v0, ($a2)
/* CE1B8 800CD5B8 00A08021 */  addu       $s0, $a1, $zero
/* CE1BC 800CD5BC AFA00010 */  sw         $zero, 0x10($sp)
/* CE1C0 800CD5C0 A6020016 */  sh         $v0, 0x16($s0)
/* CE1C4 800CD5C4 90C20004 */  lbu        $v0, 4($a2)
/* CE1C8 800CD5C8 AE00000C */  sw         $zero, 0xc($s0)
/* CE1CC 800CD5CC A602001A */  sh         $v0, 0x1a($s0)
/* CE1D0 800CD5D0 94C20002 */  lhu        $v0, 2($a2)
/* CE1D4 800CD5D4 00809021 */  addu       $s2, $a0, $zero
/* CE1D8 800CD5D8 A6000014 */  sh         $zero, 0x14($s0)
/* CE1DC 800CD5DC AE000008 */  sw         $zero, 8($s0)
/* CE1E0 800CD5E0 A6020018 */  sh         $v0, 0x18($s0)
/* CE1E4 800CD5E4 84C60000 */  lh         $a2, ($a2)
/* CE1E8 800CD5E8 0C0335B2 */  jal        _allocatePVoice
/* CE1EC 800CD5EC 27A50010 */   addiu     $a1, $sp, 0x10
/* CE1F0 800CD5F0 8FA40010 */  lw         $a0, 0x10($sp)
/* CE1F4 800CD5F4 1080002C */  beqz       $a0, .L800CD6A8
/* CE1F8 800CD5F8 00000000 */   nop
/* CE1FC 800CD5FC 8C91000C */  lw         $s1, 0xc($a0)
/* CE200 800CD600 10400025 */  beqz       $v0, .L800CD698
/* CE204 800CD604 24020200 */   addiu     $v0, $zero, 0x200
/* CE208 800CD608 8C830008 */  lw         $v1, 8($a0)
/* CE20C 800CD60C AC8200D8 */  sw         $v0, 0xd8($a0)
/* CE210 800CD610 0C033803 */  jal        __allocParam
/* CE214 800CD614 AC600008 */   sw        $zero, 8($v1)
/* CE218 800CD618 8E43001C */  lw         $v1, 0x1c($s2)
/* CE21C 800CD61C 8FA40010 */  lw         $a0, 0x10($sp)
/* CE220 800CD620 00403021 */  addu       $a2, $v0, $zero
/* CE224 800CD624 2402000B */  addiu      $v0, $zero, 0xb
/* CE228 800CD628 A4C20008 */  sh         $v0, 8($a2)
/* CE22C 800CD62C ACC0000C */  sw         $zero, 0xc($a2)
/* CE230 800CD630 ACC30004 */  sw         $v1, 4($a2)
/* CE234 800CD634 8C8200D8 */  lw         $v0, 0xd8($a0)
/* CE238 800CD638 2442FFC0 */  addiu      $v0, $v0, -0x40
/* CE23C 800CD63C ACC20010 */  sw         $v0, 0x10($a2)
/* CE240 800CD640 8E220008 */  lw         $v0, 8($s1)
/* CE244 800CD644 24050003 */  addiu      $a1, $zero, 3
/* CE248 800CD648 0040F809 */  jalr       $v0
/* CE24C 800CD64C 02202021 */   addu      $a0, $s1, $zero
/* CE250 800CD650 0C033803 */  jal        __allocParam
/* CE254 800CD654 00000000 */   nop
/* CE258 800CD658 00403021 */  addu       $a2, $v0, $zero
/* CE25C 800CD65C 10C0000F */  beqz       $a2, .L800CD69C
/* CE260 800CD660 02202021 */   addu      $a0, $s1, $zero
/* CE264 800CD664 8FA20010 */  lw         $v0, 0x10($sp)
/* CE268 800CD668 8E43001C */  lw         $v1, 0x1c($s2)
/* CE26C 800CD66C 8C4500D8 */  lw         $a1, 0xd8($v0)
/* CE270 800CD670 2402000F */  addiu      $v0, $zero, 0xf
/* CE274 800CD674 A4C20008 */  sh         $v0, 8($a2)
/* CE278 800CD678 ACC00000 */  sw         $zero, ($a2)
/* CE27C 800CD67C 00651821 */  addu       $v1, $v1, $a1
/* CE280 800CD680 ACC30004 */  sw         $v1, 4($a2)
/* CE284 800CD684 8C820008 */  lw         $v0, 8($a0)
/* CE288 800CD688 0040F809 */  jalr       $v0
/* CE28C 800CD68C 24050003 */   addiu     $a1, $zero, 3
/* CE290 800CD690 080335A7 */  j          .L800CD69C
/* CE294 800CD694 00000000 */   nop
.L800CD698:
/* CE298 800CD698 AC8000D8 */  sw         $zero, 0xd8($a0)
.L800CD69C:
/* CE29C 800CD69C 8FA20010 */  lw         $v0, 0x10($sp)
/* CE2A0 800CD6A0 AC500008 */  sw         $s0, 8($v0)
/* CE2A4 800CD6A4 AE020008 */  sw         $v0, 8($s0)
.L800CD6A8:
/* CE2A8 800CD6A8 8FA20010 */  lw         $v0, 0x10($sp)
/* CE2AC 800CD6AC 0002102B */  sltu       $v0, $zero, $v0
/* CE2B0 800CD6B0 8FBF0024 */  lw         $ra, 0x24($sp)
/* CE2B4 800CD6B4 8FB20020 */  lw         $s2, 0x20($sp)
/* CE2B8 800CD6B8 8FB1001C */  lw         $s1, 0x1c($sp)
/* CE2BC 800CD6BC 8FB00018 */  lw         $s0, 0x18($sp)
/* CE2C0 800CD6C0 03E00008 */  jr         $ra
/* CE2C4 800CD6C4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel _allocatePVoice
/* CE2C8 800CD6C8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CE2CC 800CD6CC AFB10014 */  sw         $s1, 0x14($sp)
/* CE2D0 800CD6D0 00808821 */  addu       $s1, $a0, $zero
/* CE2D4 800CD6D4 AFBF001C */  sw         $ra, 0x1c($sp)
/* CE2D8 800CD6D8 AFB20018 */  sw         $s2, 0x18($sp)
/* CE2DC 800CD6DC AFB00010 */  sw         $s0, 0x10($sp)
/* CE2E0 800CD6E0 8E300014 */  lw         $s0, 0x14($s1)
/* CE2E4 800CD6E4 16000004 */  bnez       $s0, .L800CD6F8
/* CE2E8 800CD6E8 00009021 */   addu      $s2, $zero, $zero
/* CE2EC 800CD6EC 8E300004 */  lw         $s0, 4($s1)
/* CE2F0 800CD6F0 12000009 */  beqz       $s0, .L800CD718
/* CE2F4 800CD6F4 00000000 */   nop
.L800CD6F8:
/* CE2F8 800CD6F8 ACB00000 */  sw         $s0, ($a1)
/* CE2FC 800CD6FC 0C03336F */  jal        alUnlink
/* CE300 800CD700 02002021 */   addu      $a0, $s0, $zero
/* CE304 800CD704 02002021 */  addu       $a0, $s0, $zero
/* CE308 800CD708 0C033367 */  jal        alLink
/* CE30C 800CD70C 2625000C */   addiu     $a1, $s1, 0xc
/* CE310 800CD710 080335DA */  j          .L800CD768
/* CE314 800CD714 02401021 */   addu      $v0, $s2, $zero
.L800CD718:
/* CE318 800CD718 8E30000C */  lw         $s0, 0xc($s1)
/* CE31C 800CD71C 12000012 */  beqz       $s0, .L800CD768
/* CE320 800CD720 02401021 */   addu      $v0, $s2, $zero
.L800CD724:
/* CE324 800CD724 8E020008 */  lw         $v0, 8($s0)
/* CE328 800CD728 84430016 */  lh         $v1, 0x16($v0)
/* CE32C 800CD72C 00061400 */  sll        $v0, $a2, 0x10
/* CE330 800CD730 00021403 */  sra        $v0, $v0, 0x10
/* CE334 800CD734 0043102A */  slt        $v0, $v0, $v1
/* CE338 800CD738 14400008 */  bnez       $v0, .L800CD75C
/* CE33C 800CD73C 00000000 */   nop
/* CE340 800CD740 8E0200D8 */  lw         $v0, 0xd8($s0)
/* CE344 800CD744 14400005 */  bnez       $v0, .L800CD75C
/* CE348 800CD748 00000000 */   nop
/* CE34C 800CD74C ACB00000 */  sw         $s0, ($a1)
/* CE350 800CD750 8E020008 */  lw         $v0, 8($s0)
/* CE354 800CD754 24120001 */  addiu      $s2, $zero, 1
/* CE358 800CD758 94460016 */  lhu        $a2, 0x16($v0)
.L800CD75C:
/* CE35C 800CD75C 8E100000 */  lw         $s0, ($s0)
/* CE360 800CD760 1600FFF0 */  bnez       $s0, .L800CD724
/* CE364 800CD764 02401021 */   addu      $v0, $s2, $zero
.L800CD768:
/* CE368 800CD768 8FBF001C */  lw         $ra, 0x1c($sp)
/* CE36C 800CD76C 8FB20018 */  lw         $s2, 0x18($sp)
/* CE370 800CD770 8FB10014 */  lw         $s1, 0x14($sp)
/* CE374 800CD774 8FB00010 */  lw         $s0, 0x10($sp)
/* CE378 800CD778 03E00008 */  jr         $ra
/* CE37C 800CD77C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel alSynDelete
/* CE380 800CD780 03E00008 */  jr         $ra
/* CE384 800CD784 AC800000 */   sw        $zero, ($a0)
/* CE388 800CD788 00000000 */  nop
/* CE38C 800CD78C 00000000 */  nop
