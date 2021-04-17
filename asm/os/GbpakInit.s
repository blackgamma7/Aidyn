.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGbpakInit
/* C31B0 800C25B0 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* C31B4 800C25B4 AFB3004C */  sw         $s3, 0x4c($sp)
/* C31B8 800C25B8 00809821 */  addu       $s3, $a0, $zero
/* C31BC 800C25BC AFB20048 */  sw         $s2, 0x48($sp)
/* C31C0 800C25C0 00A09021 */  addu       $s2, $a1, $zero
/* C31C4 800C25C4 AFB40050 */  sw         $s4, 0x50($sp)
/* C31C8 800C25C8 00C0A021 */  addu       $s4, $a2, $zero
/* C31CC 800C25CC 240400FE */  addiu      $a0, $zero, 0xfe
/* C31D0 800C25D0 2402001F */  addiu      $v0, $zero, 0x1f
/* C31D4 800C25D4 27A3003F */  addiu      $v1, $sp, 0x3f
/* C31D8 800C25D8 AFBF0054 */  sw         $ra, 0x54($sp)
/* C31DC 800C25DC AFB10044 */  sw         $s1, 0x44($sp)
/* C31E0 800C25E0 AFB00040 */  sw         $s0, 0x40($sp)
/* C31E4 800C25E4 AE400000 */  sw         $zero, ($s2)
.L800C25E8:
/* C31E8 800C25E8 A0640000 */  sb         $a0, ($v1)
/* C31EC 800C25EC 2442FFFF */  addiu      $v0, $v0, -1
/* C31F0 800C25F0 0441FFFD */  bgez       $v0, .L800C25E8
/* C31F4 800C25F4 2463FFFF */   addiu     $v1, $v1, -1
/* C31F8 800C25F8 AFA00010 */  sw         $zero, 0x10($sp)
/* C31FC 800C25FC 02602021 */  addu       $a0, $s3, $zero
/* C3200 800C2600 02802821 */  addu       $a1, $s4, $zero
/* C3204 800C2604 24060400 */  addiu      $a2, $zero, 0x400
/* C3208 800C2608 0C030B30 */  jal        __osContRamWrite
/* C320C 800C260C 27A70020 */   addiu     $a3, $sp, 0x20
/* C3210 800C2610 24100002 */  addiu      $s0, $zero, 2
/* C3214 800C2614 14500006 */  bne        $v0, $s0, .L800C2630
/* C3218 800C2618 02602021 */   addu      $a0, $s3, $zero
/* C321C 800C261C AFA00010 */  sw         $zero, 0x10($sp)
/* C3220 800C2620 02802821 */  addu       $a1, $s4, $zero
/* C3224 800C2624 24060400 */  addiu      $a2, $zero, 0x400
/* C3228 800C2628 0C030B30 */  jal        __osContRamWrite
/* C322C 800C262C 27A70020 */   addiu     $a3, $sp, 0x20
.L800C2630:
/* C3230 800C2630 14400054 */  bnez       $v0, .L800C2784
/* C3234 800C2634 02602021 */   addu      $a0, $s3, $zero
/* C3238 800C2638 02802821 */  addu       $a1, $s4, $zero
/* C323C 800C263C 24060400 */  addiu      $a2, $zero, 0x400
/* C3240 800C2640 0C0309EC */  jal        __osContRamRead
/* C3244 800C2644 27A70020 */   addiu     $a3, $sp, 0x20
/* C3248 800C2648 50500001 */  beql       $v0, $s0, .L800C2650
/* C324C 800C264C 24020004 */   addiu     $v0, $zero, 4
.L800C2650:
/* C3250 800C2650 1440004C */  bnez       $v0, .L800C2784
/* C3254 800C2654 00000000 */   nop
/* C3258 800C2658 93A3003F */  lbu        $v1, 0x3f($sp)
/* C325C 800C265C 240200FE */  addiu      $v0, $zero, 0xfe
/* C3260 800C2660 1062001E */  beq        $v1, $v0, .L800C26DC
/* C3264 800C2664 24040084 */   addiu     $a0, $zero, 0x84
/* C3268 800C2668 2402001F */  addiu      $v0, $zero, 0x1f
/* C326C 800C266C 27A3003F */  addiu      $v1, $sp, 0x3f
.L800C2670:
/* C3270 800C2670 A0640000 */  sb         $a0, ($v1)
/* C3274 800C2674 2442FFFF */  addiu      $v0, $v0, -1
/* C3278 800C2678 0441FFFD */  bgez       $v0, .L800C2670
/* C327C 800C267C 2463FFFF */   addiu     $v1, $v1, -1
/* C3280 800C2680 AFA00010 */  sw         $zero, 0x10($sp)
/* C3284 800C2684 02602021 */  addu       $a0, $s3, $zero
/* C3288 800C2688 02802821 */  addu       $a1, $s4, $zero
/* C328C 800C268C 24060400 */  addiu      $a2, $zero, 0x400
/* C3290 800C2690 0C030B30 */  jal        __osContRamWrite
/* C3294 800C2694 27A70020 */   addiu     $a3, $sp, 0x20
/* C3298 800C2698 24100002 */  addiu      $s0, $zero, 2
/* C329C 800C269C 50500001 */  beql       $v0, $s0, .L800C26A4
/* C32A0 800C26A0 24020004 */   addiu     $v0, $zero, 4
.L800C26A4:
/* C32A4 800C26A4 14400037 */  bnez       $v0, .L800C2784
/* C32A8 800C26A8 02602021 */   addu      $a0, $s3, $zero
/* C32AC 800C26AC 02802821 */  addu       $a1, $s4, $zero
/* C32B0 800C26B0 24060400 */  addiu      $a2, $zero, 0x400
/* C32B4 800C26B4 0C0309EC */  jal        __osContRamRead
/* C32B8 800C26B8 27A70020 */   addiu     $a3, $sp, 0x20
/* C32BC 800C26BC 50500001 */  beql       $v0, $s0, .L800C26C4
/* C32C0 800C26C0 24020004 */   addiu     $v0, $zero, 4
.L800C26C4:
/* C32C4 800C26C4 1440002F */  bnez       $v0, .L800C2784
/* C32C8 800C26C8 00000000 */   nop
/* C32CC 800C26CC 93A3003F */  lbu        $v1, 0x3f($sp)
/* C32D0 800C26D0 24020084 */  addiu      $v0, $zero, 0x84
/* C32D4 800C26D4 10620003 */  beq        $v1, $v0, .L800C26E4
/* C32D8 800C26D8 02602021 */   addu      $a0, $s3, $zero
.L800C26DC:
/* C32DC 800C26DC 080309E1 */  j          .L800C2784
/* C32E0 800C26E0 2402000B */   addiu     $v0, $zero, 0xb
.L800C26E4:
/* C32E4 800C26E4 0C031878 */  jal        __osPfsGetStatus
/* C32E8 800C26E8 02802821 */   addu      $a1, $s4, $zero
/* C32EC 800C26EC 14400025 */  bnez       $v0, .L800C2784
/* C32F0 800C26F0 00000000 */   nop
/* C32F4 800C26F4 3C10800F */  lui        $s0, %hi(__osGbpakTimerQ)
/* C32F8 800C26F8 26107828 */  addiu      $s0, $s0, %lo(__osGbpakTimerQ)
/* C32FC 800C26FC 02002021 */  addu       $a0, $s0, $zero
/* C3300 800C2700 3C11800F */  lui        $s1, %hi(__osGbpakTimerMsg)
/* C3304 800C2704 26317800 */  addiu      $s1, $s1, %lo(__osGbpakTimerMsg)
/* C3308 800C2708 02202821 */  addu       $a1, $s1, $zero
/* C330C 800C270C 0C02FBA4 */  jal        osCreateMesgQueue
/* C3310 800C2710 24060001 */   addiu     $a2, $zero, 1
/* C3314 800C2714 00004021 */  addu       $t0, $zero, $zero
/* C3318 800C2718 00004821 */  addu       $t1, $zero, $zero
/* C331C 800C271C 3C04800F */  lui        $a0, %hi(__osGbpakTimer)
/* C3320 800C2720 24847808 */  addiu      $a0, $a0, %lo(__osGbpakTimer)
/* C3324 800C2724 24060000 */  addiu      $a2, $zero, 0
/* C3328 800C2728 3C070089 */  lui        $a3, 0x89
/* C332C 800C272C 34E75440 */  ori        $a3, $a3, 0x5440
/* C3330 800C2730 AFA80010 */  sw         $t0, 0x10($sp)
/* C3334 800C2734 AFA90014 */  sw         $t1, 0x14($sp)
/* C3338 800C2738 AFB00018 */  sw         $s0, 0x18($sp)
/* C333C 800C273C 0C033228 */  jal        osSetTimer
/* C3340 800C2740 AFB1001C */   sw        $s1, 0x1c($sp)
/* C3344 800C2744 02002021 */  addu       $a0, $s0, $zero
/* C3348 800C2748 00002821 */  addu       $a1, $zero, $zero
/* C334C 800C274C 0C0321E4 */  jal        osRecvMesg
/* C3350 800C2750 24060001 */   addiu     $a2, $zero, 1
/* C3354 800C2754 00001021 */  addu       $v0, $zero, $zero
/* C3358 800C2758 24030010 */  addiu      $v1, $zero, 0x10
/* C335C 800C275C AE430000 */  sw         $v1, ($s2)
/* C3360 800C2760 24030084 */  addiu      $v1, $zero, 0x84
/* C3364 800C2764 A2430065 */  sb         $v1, 0x65($s2)
/* C3368 800C2768 240300FF */  addiu      $v1, $zero, 0xff
/* C336C 800C276C A2430064 */  sb         $v1, 0x64($s2)
/* C3370 800C2770 240300FF */  addiu      $v1, $zero, 0xff
/* C3374 800C2774 AE530004 */  sw         $s3, 4($s2)
/* C3378 800C2778 AE540008 */  sw         $s4, 8($s2)
/* C337C 800C277C AE43004C */  sw         $v1, 0x4c($s2)
/* C3380 800C2780 AE430050 */  sw         $v1, 0x50($s2)
.L800C2784:
/* C3384 800C2784 8FBF0054 */  lw         $ra, 0x54($sp)
/* C3388 800C2788 8FB40050 */  lw         $s4, 0x50($sp)
/* C338C 800C278C 8FB3004C */  lw         $s3, 0x4c($sp)
/* C3390 800C2790 8FB20048 */  lw         $s2, 0x48($sp)
/* C3394 800C2794 8FB10044 */  lw         $s1, 0x44($sp)
/* C3398 800C2798 8FB00040 */  lw         $s0, 0x40($sp)
/* C339C 800C279C 03E00008 */  jr         $ra
/* C33A0 800C27A0 27BD0058 */   addiu     $sp, $sp, 0x58
/* C33A4 800C27A4 00000000 */  nop
/* C33A8 800C27A8 00000000 */  nop
/* C33AC 800C27AC 00000000 */  nop
