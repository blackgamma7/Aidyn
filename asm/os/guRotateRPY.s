.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guRotateRPYF
/* CC190 800CB590 3C01800F */  lui        $at, %hi(dtor_800f39b0)
/* CC194 800CB594 C42039B0 */  lwc1       $f0, %lo(dtor_800f39b0)($at)
/* CC198 800CB598 44854000 */  mtc1       $a1, $f8
/* CC19C 800CB59C 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* CC1A0 800CB5A0 F7B40028 */  sdc1       $f20, 0x28($sp)
/* CC1A4 800CB5A4 46004502 */  mul.s      $f20, $f8, $f0
/* CC1A8 800CB5A8 44864000 */  mtc1       $a2, $f8
/* CC1AC 800CB5AC AFB00018 */  sw         $s0, 0x18($sp)
/* CC1B0 800CB5B0 F7B60030 */  sdc1       $f22, 0x30($sp)
/* CC1B4 800CB5B4 46004582 */  mul.s      $f22, $f8, $f0
/* CC1B8 800CB5B8 44874000 */  mtc1       $a3, $f8
/* CC1BC 800CB5BC 00808021 */  addu       $s0, $a0, $zero
/* CC1C0 800CB5C0 AFBF0020 */  sw         $ra, 0x20($sp)
/* CC1C4 800CB5C4 AFB1001C */  sw         $s1, 0x1c($sp)
/* CC1C8 800CB5C8 F7BE0050 */  sdc1       $f30, 0x50($sp)
/* CC1CC 800CB5CC F7BC0048 */  sdc1       $f28, 0x48($sp)
/* CC1D0 800CB5D0 F7BA0040 */  sdc1       $f26, 0x40($sp)
/* CC1D4 800CB5D4 F7B80038 */  sdc1       $f24, 0x38($sp)
/* CC1D8 800CB5D8 46004602 */  mul.s      $f24, $f8, $f0
/* CC1DC 800CB5DC 0C03328C */  jal        __sinf
/* CC1E0 800CB5E0 4600A306 */   mov.s     $f12, $f20
/* CC1E4 800CB5E4 44110000 */  mfc1       $s1, $f0
/* CC1E8 800CB5E8 00000000 */  nop
/* CC1EC 800CB5EC 0C02FB50 */  jal        __cosf
/* CC1F0 800CB5F0 4600A306 */   mov.s     $f12, $f20
/* CC1F4 800CB5F4 46000786 */  mov.s      $f30, $f0
/* CC1F8 800CB5F8 0C03328C */  jal        __sinf
/* CC1FC 800CB5FC 4600B306 */   mov.s     $f12, $f22
/* CC200 800CB600 4600B306 */  mov.s      $f12, $f22
/* CC204 800CB604 0C02FB50 */  jal        __cosf
/* CC208 800CB608 46000706 */   mov.s     $f28, $f0
/* CC20C 800CB60C 46000686 */  mov.s      $f26, $f0
/* CC210 800CB610 0C03328C */  jal        __sinf
/* CC214 800CB614 4600C306 */   mov.s     $f12, $f24
/* CC218 800CB618 4600C306 */  mov.s      $f12, $f24
/* CC21C 800CB61C 0C02FB50 */  jal        __cosf
/* CC220 800CB620 46000506 */   mov.s     $f20, $f0
/* CC224 800CB624 46000586 */  mov.s      $f22, $f0
/* CC228 800CB628 0C0311DC */  jal        guMtxIdentF
/* CC22C 800CB62C 02002021 */   addu      $a0, $s0, $zero
/* CC230 800CB630 00000000 */  nop
/* CC234 800CB634 4616D402 */  mul.s      $f16, $f26, $f22
/* CC238 800CB638 00000000 */  nop
/* CC23C 800CB63C 4614D482 */  mul.s      $f18, $f26, $f20
/* CC240 800CB640 00000000 */  nop
/* CC244 800CB644 4616F282 */  mul.s      $f10, $f30, $f22
/* CC248 800CB648 00000000 */  nop
/* CC24C 800CB64C 461CF002 */  mul.s      $f0, $f30, $f28
/* CC250 800CB650 44914000 */  mtc1       $s1, $f8
/* CC254 800CB654 00000000 */  nop
/* CC258 800CB658 461C4082 */  mul.s      $f2, $f8, $f28
/* CC25C 800CB65C 00000000 */  nop
/* CC260 800CB660 4614F202 */  mul.s      $f8, $f30, $f20
/* CC264 800CB664 00000000 */  nop
/* CC268 800CB668 461AF782 */  mul.s      $f30, $f30, $f26
/* CC26C 800CB66C 00000000 */  nop
/* CC270 800CB670 46160102 */  mul.s      $f4, $f0, $f22
/* CC274 800CB674 00000000 */  nop
/* CC278 800CB678 46161182 */  mul.s      $f6, $f2, $f22
/* CC27C 800CB67C 00000000 */  nop
/* CC280 800CB680 46141082 */  mul.s      $f2, $f2, $f20
/* CC284 800CB684 E7A80014 */  swc1       $f8, 0x14($sp)
/* CC288 800CB688 44914000 */  mtc1       $s1, $f8
/* CC28C 800CB68C 00000000 */  nop
/* CC290 800CB690 461A4382 */  mul.s      $f14, $f8, $f26
/* CC294 800CB694 00000000 */  nop
/* CC298 800CB698 46144302 */  mul.s      $f12, $f8, $f20
/* CC29C 800CB69C C7A80014 */  lwc1       $f8, 0x14($sp)
/* CC2A0 800CB6A0 46083181 */  sub.s      $f6, $f6, $f8
/* CC2A4 800CB6A4 44914000 */  mtc1       $s1, $f8
/* CC2A8 800CB6A8 00000000 */  nop
/* CC2AC 800CB6AC 46164202 */  mul.s      $f8, $f8, $f22
/* CC2B0 800CB6B0 4600E707 */  neg.s      $f28, $f28
/* CC2B4 800CB6B4 46140002 */  mul.s      $f0, $f0, $f20
/* CC2B8 800CB6B8 460A1080 */  add.s      $f2, $f2, $f10
/* CC2BC 800CB6BC E61C0008 */  swc1       $f28, 8($s0)
/* CC2C0 800CB6C0 E6100000 */  swc1       $f16, ($s0)
/* CC2C4 800CB6C4 44114000 */  mfc1       $s1, $f8
/* CC2C8 800CB6C8 460C2100 */  add.s      $f4, $f4, $f12
/* CC2CC 800CB6CC E6120004 */  swc1       $f18, 4($s0)
/* CC2D0 800CB6D0 E61E0028 */  swc1       $f30, 0x28($s0)
/* CC2D4 800CB6D4 E60E0018 */  swc1       $f14, 0x18($s0)
/* CC2D8 800CB6D8 46080001 */  sub.s      $f0, $f0, $f8
/* CC2DC 800CB6DC E6060010 */  swc1       $f6, 0x10($s0)
/* CC2E0 800CB6E0 E6020014 */  swc1       $f2, 0x14($s0)
/* CC2E4 800CB6E4 E6040020 */  swc1       $f4, 0x20($s0)
/* CC2E8 800CB6E8 E6000024 */  swc1       $f0, 0x24($s0)
/* CC2EC 800CB6EC 8FBF0020 */  lw         $ra, 0x20($sp)
/* CC2F0 800CB6F0 8FB1001C */  lw         $s1, 0x1c($sp)
/* CC2F4 800CB6F4 8FB00018 */  lw         $s0, 0x18($sp)
/* CC2F8 800CB6F8 D7BE0050 */  ldc1       $f30, 0x50($sp)
/* CC2FC 800CB6FC D7BC0048 */  ldc1       $f28, 0x48($sp)
/* CC300 800CB700 D7BA0040 */  ldc1       $f26, 0x40($sp)
/* CC304 800CB704 D7B80038 */  ldc1       $f24, 0x38($sp)
/* CC308 800CB708 D7B60030 */  ldc1       $f22, 0x30($sp)
/* CC30C 800CB70C D7B40028 */  ldc1       $f20, 0x28($sp)
/* CC310 800CB710 03E00008 */  jr         $ra
/* CC314 800CB714 27BD0058 */   addiu     $sp, $sp, 0x58

glabel func_800CB718
/* CC318 800CB718 3C01800F */  lui        $at, %hi(dtor_800f39b0)
/* CC31C 800CB71C C42039B0 */  lwc1       $f0, %lo(dtor_800f39b0)($at)
/* CC320 800CB720 44854000 */  mtc1       $a1, $f8
/* CC324 800CB724 27BDFF68 */  addiu      $sp, $sp, -0x98
/* CC328 800CB728 F7B40068 */  sdc1       $f20, 0x68($sp)
/* CC32C 800CB72C 46004502 */  mul.s      $f20, $f8, $f0
/* CC330 800CB730 44864000 */  mtc1       $a2, $f8
/* CC334 800CB734 F7B60070 */  sdc1       $f22, 0x70($sp)
/* CC338 800CB738 46004582 */  mul.s      $f22, $f8, $f0
/* CC33C 800CB73C AFB1005C */  sw         $s1, 0x5c($sp)
/* CC340 800CB740 44874000 */  mtc1       $a3, $f8
/* CC344 800CB744 00808821 */  addu       $s1, $a0, $zero
/* CC348 800CB748 AFBF0060 */  sw         $ra, 0x60($sp)
/* CC34C 800CB74C 46004202 */  mul.s      $f8, $f8, $f0
/* CC350 800CB750 AFB00058 */  sw         $s0, 0x58($sp)
/* CC354 800CB754 F7BE0090 */  sdc1       $f30, 0x90($sp)
/* CC358 800CB758 F7BC0088 */  sdc1       $f28, 0x88($sp)
/* CC35C 800CB75C F7BA0080 */  sdc1       $f26, 0x80($sp)
/* CC360 800CB760 F7B80078 */  sdc1       $f24, 0x78($sp)
/* CC364 800CB764 44104000 */  mfc1       $s0, $f8
/* CC368 800CB768 00000000 */  nop
/* CC36C 800CB76C 0C03328C */  jal        __sinf
/* CC370 800CB770 4600A306 */   mov.s     $f12, $f20
/* CC374 800CB774 4600A306 */  mov.s      $f12, $f20
/* CC378 800CB778 0C02FB50 */  jal        __cosf
/* CC37C 800CB77C 46000786 */   mov.s     $f30, $f0
/* CC380 800CB780 4600B306 */  mov.s      $f12, $f22
/* CC384 800CB784 0C03328C */  jal        __sinf
/* CC388 800CB788 46000706 */   mov.s     $f28, $f0
/* CC38C 800CB78C 4600B306 */  mov.s      $f12, $f22
/* CC390 800CB790 0C02FB50 */  jal        __cosf
/* CC394 800CB794 46000686 */   mov.s     $f26, $f0
/* CC398 800CB798 44906000 */  mtc1       $s0, $f12
/* CC39C 800CB79C 00000000 */  nop
/* CC3A0 800CB7A0 0C03328C */  jal        __sinf
/* CC3A4 800CB7A4 46000606 */   mov.s     $f24, $f0
/* CC3A8 800CB7A8 44906000 */  mtc1       $s0, $f12
/* CC3AC 800CB7AC 00000000 */  nop
/* CC3B0 800CB7B0 0C02FB50 */  jal        __cosf
/* CC3B4 800CB7B4 46000506 */   mov.s     $f20, $f0
/* CC3B8 800CB7B8 27B00010 */  addiu      $s0, $sp, 0x10
/* CC3BC 800CB7BC 02002021 */  addu       $a0, $s0, $zero
/* CC3C0 800CB7C0 0C0311DC */  jal        guMtxIdentF
/* CC3C4 800CB7C4 46000586 */   mov.s     $f22, $f0
/* CC3C8 800CB7C8 00000000 */  nop
/* CC3CC 800CB7CC 4616C402 */  mul.s      $f16, $f24, $f22
/* CC3D0 800CB7D0 00000000 */  nop
/* CC3D4 800CB7D4 461AF082 */  mul.s      $f2, $f30, $f26
/* CC3D8 800CB7D8 00000000 */  nop
/* CC3DC 800CB7DC 4614C482 */  mul.s      $f18, $f24, $f20
/* CC3E0 800CB7E0 00000000 */  nop
/* CC3E4 800CB7E4 4614E202 */  mul.s      $f8, $f28, $f20
/* CC3E8 800CB7E8 00000000 */  nop
/* CC3EC 800CB7EC 4616E282 */  mul.s      $f10, $f28, $f22
/* CC3F0 800CB7F0 00000000 */  nop
/* CC3F4 800CB7F4 461AE002 */  mul.s      $f0, $f28, $f26
/* CC3F8 800CB7F8 00000000 */  nop
/* CC3FC 800CB7FC 4618F382 */  mul.s      $f14, $f30, $f24
/* CC400 800CB800 00000000 */  nop
/* CC404 800CB804 4614F302 */  mul.s      $f12, $f30, $f20
/* CC408 800CB808 00000000 */  nop
/* CC40C 800CB80C 4618E702 */  mul.s      $f28, $f28, $f24
/* CC410 800CB810 00000000 */  nop
/* CC414 800CB814 4616F782 */  mul.s      $f30, $f30, $f22
/* CC418 800CB818 00000000 */  nop
/* CC41C 800CB81C 46161182 */  mul.s      $f6, $f2, $f22
/* CC420 800CB820 00000000 */  nop
/* CC424 800CB824 46141082 */  mul.s      $f2, $f2, $f20
/* CC428 800CB828 00000000 */  nop
/* CC42C 800CB82C 46160102 */  mul.s      $f4, $f0, $f22
/* CC430 800CB830 46083181 */  sub.s      $f6, $f6, $f8
/* CC434 800CB834 02002021 */  addu       $a0, $s0, $zero
/* CC438 800CB838 4600D687 */  neg.s      $f26, $f26
/* CC43C 800CB83C 02202821 */  addu       $a1, $s1, $zero
/* CC440 800CB840 460A1080 */  add.s      $f2, $f2, $f10
/* CC444 800CB844 46140002 */  mul.s      $f0, $f0, $f20
/* CC448 800CB848 E7BA0018 */  swc1       $f26, 0x18($sp)
/* CC44C 800CB84C E7B00010 */  swc1       $f16, 0x10($sp)
/* CC450 800CB850 460C2100 */  add.s      $f4, $f4, $f12
/* CC454 800CB854 E7B20014 */  swc1       $f18, 0x14($sp)
/* CC458 800CB858 E7AE0028 */  swc1       $f14, 0x28($sp)
/* CC45C 800CB85C E7BC0038 */  swc1       $f28, 0x38($sp)
/* CC460 800CB860 461E0001 */  sub.s      $f0, $f0, $f30
/* CC464 800CB864 E7A60020 */  swc1       $f6, 0x20($sp)
/* CC468 800CB868 E7A20024 */  swc1       $f2, 0x24($sp)
/* CC46C 800CB86C E7A40030 */  swc1       $f4, 0x30($sp)
/* CC470 800CB870 0C03118C */  jal        guMtxF2L
/* CC474 800CB874 E7A00034 */   swc1      $f0, 0x34($sp)
/* CC478 800CB878 8FBF0060 */  lw         $ra, 0x60($sp)
/* CC47C 800CB87C 8FB1005C */  lw         $s1, 0x5c($sp)
/* CC480 800CB880 8FB00058 */  lw         $s0, 0x58($sp)
/* CC484 800CB884 D7BE0090 */  ldc1       $f30, 0x90($sp)
/* CC488 800CB888 D7BC0088 */  ldc1       $f28, 0x88($sp)
/* CC48C 800CB88C D7BA0080 */  ldc1       $f26, 0x80($sp)
/* CC490 800CB890 D7B80078 */  ldc1       $f24, 0x78($sp)
/* CC494 800CB894 D7B60070 */  ldc1       $f22, 0x70($sp)
/* CC498 800CB898 D7B40068 */  ldc1       $f20, 0x68($sp)
/* CC49C 800CB89C 03E00008 */  jr         $ra
/* CC4A0 800CB8A0 27BD0098 */   addiu     $sp, $sp, 0x98
/* CC4A4 800CB8A4 00000000 */  nop
/* CC4A8 800CB8A8 00000000 */  nop
/* CC4AC 800CB8AC 00000000 */  nop
