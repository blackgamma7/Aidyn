.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osDpSetNextBuffer
/* CD030 800CC430 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD034 800CC434 AFB00010 */  sw         $s0, 0x10($sp)
/* CD038 800CC438 00808021 */  addu       $s0, $a0, $zero
/* CD03C 800CC43C AFB30018 */  sw         $s3, 0x18($sp)
/* CD040 800CC440 AFB20014 */  sw         $s2, 0x14($sp)
/* CD044 800CC444 00C09021 */  addu       $s2, $a2, $zero
/* CD048 800CC448 AFBF001C */  sw         $ra, 0x1c($sp)
/* CD04C 800CC44C 0C033134 */  jal        osDCPDevicebusy
/* CD050 800CC450 00E09821 */   addu      $s3, $a3, $zero
/* CD054 800CC454 14400016 */  bnez       $v0, .L800CC4B0
/* CD058 800CC458 2402FFFF */   addiu     $v0, $zero, -1
/* CD05C 800CC45C 3C03A410 */  lui        $v1, 0xa410
/* CD060 800CC460 3463000C */  ori        $v1, $v1, 0xc
/* CD064 800CC464 24020001 */  addiu      $v0, $zero, 1
/* CD068 800CC468 AC620000 */  sw         $v0, ($v1)
/* CD06C 800CC46C 3C03A410 */  lui        $v1, 0xa410
/* CD070 800CC470 3463000C */  ori        $v1, $v1, 0xc
.L800CC474:
/* CD074 800CC474 8C620000 */  lw         $v0, ($v1)
/* CD078 800CC478 30420001 */  andi       $v0, $v0, 1
/* CD07C 800CC47C 1440FFFD */  bnez       $v0, .L800CC474
/* CD080 800CC480 00000000 */   nop
/* CD084 800CC484 0C034888 */  jal        osVirtualToPhysical
/* CD088 800CC488 02002021 */   addu      $a0, $s0, $zero
/* CD08C 800CC48C 02002021 */  addu       $a0, $s0, $zero
/* CD090 800CC490 3C03A410 */  lui        $v1, 0xa410
/* CD094 800CC494 0C034888 */  jal        osVirtualToPhysical
/* CD098 800CC498 AC620000 */   sw        $v0, ($v1)
/* CD09C 800CC49C 3C04A410 */  lui        $a0, 0xa410
/* CD0A0 800CC4A0 34840004 */  ori        $a0, $a0, 4
/* CD0A4 800CC4A4 02621821 */  addu       $v1, $s3, $v0
/* CD0A8 800CC4A8 00001021 */  addu       $v0, $zero, $zero
/* CD0AC 800CC4AC AC830000 */  sw         $v1, ($a0)
.L800CC4B0:
/* CD0B0 800CC4B0 8FBF001C */  lw         $ra, 0x1c($sp)
/* CD0B4 800CC4B4 8FB30018 */  lw         $s3, 0x18($sp)
/* CD0B8 800CC4B8 8FB20014 */  lw         $s2, 0x14($sp)
/* CD0BC 800CC4BC 8FB00010 */  lw         $s0, 0x10($sp)
/* CD0C0 800CC4C0 03E00008 */  jr         $ra
/* CD0C4 800CC4C4 27BD0020 */   addiu     $sp, $sp, 0x20
/* CD0C8 800CC4C8 00000000 */  nop
/* CD0CC 800CC4CC 00000000 */  nop
