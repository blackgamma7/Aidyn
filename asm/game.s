.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel init_DBs
/* 24230 80023630 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 24234 80023634 AFB40060 */  sw         $s4, 0x60($sp)
/* 24238 80023638 3C14800F */  lui        $s4, %hi(debug_queue_800e8908)
/* 2423C 8002363C 26948908 */  addiu      $s4, $s4, %lo(debug_queue_800e8908)
/* 24240 80023640 02802021 */  addu       $a0, $s4, $zero
/* 24244 80023644 AFBF0074 */  sw         $ra, 0x74($sp)
/* 24248 80023648 AFBE0070 */  sw         $fp, 0x70($sp)
/* 2424C 8002364C AFB7006C */  sw         $s7, 0x6c($sp)
/* 24250 80023650 AFB60068 */  sw         $s6, 0x68($sp)
/* 24254 80023654 AFB50064 */  sw         $s5, 0x64($sp)
/* 24258 80023658 AFB3005C */  sw         $s3, 0x5c($sp)
/* 2425C 8002365C AFB20058 */  sw         $s2, 0x58($sp)
/* 24260 80023660 AFB10054 */  sw         $s1, 0x54($sp)
/* 24264 80023664 0C00B66C */  jal        n64print_init
/* 24268 80023668 AFB00050 */   sw        $s0, 0x50($sp)
/* 2426C 8002366C 0C015662 */  jal        init_sfx_struct
/* 24270 80023670 2684F298 */   addiu     $a0, $s4, -0xd68
/* 24274 80023674 24040014 */  addiu      $a0, $zero, 0x14
/* 24278 80023678 3C12800E */  lui        $s2, %hi(D_800D9E00)
/* 2427C 8002367C 26529E00 */  addiu      $s2, $s2, %lo(D_800D9E00)
/* 24280 80023680 02402821 */  addu       $a1, $s2, $zero
/* 24284 80023684 0C025F9C */  jal        Malloc
/* 24288 80023688 2406007A */   addiu     $a2, $zero, 0x7a
/* 2428C 8002368C 2404001C */  addiu      $a0, $zero, 0x1c
/* 24290 80023690 02402821 */  addu       $a1, $s2, $zero
/* 24294 80023694 2406007B */  addiu      $a2, $zero, 0x7b
/* 24298 80023698 3C10800F */  lui        $s0, %hi(spell_pointer)
/* 2429C 8002369C 0C025F9C */  jal        Malloc
/* 242A0 800236A0 AE0216A0 */   sw        $v0, %lo(spell_pointer)($s0)
/* 242A4 800236A4 2404001C */  addiu      $a0, $zero, 0x1c
/* 242A8 800236A8 02402821 */  addu       $a1, $s2, $zero
/* 242AC 800236AC 2406007C */  addiu      $a2, $zero, 0x7c
/* 242B0 800236B0 3C1E800F */  lui        $fp, %hi(weapon_pointer)
/* 242B4 800236B4 0C025F9C */  jal        Malloc
/* 242B8 800236B8 AFC216F0 */   sw        $v0, %lo(weapon_pointer)($fp)
/* 242BC 800236BC 24040014 */  addiu      $a0, $zero, 0x14
/* 242C0 800236C0 02402821 */  addu       $a1, $s2, $zero
/* 242C4 800236C4 2406007D */  addiu      $a2, $zero, 0x7d
/* 242C8 800236C8 3C17800F */  lui        $s7, %hi(item_pointer)
/* 242CC 800236CC 0C025F9C */  jal        Malloc
/* 242D0 800236D0 AEE214F0 */   sw        $v0, %lo(item_pointer)($s7)
/* 242D4 800236D4 24040008 */  addiu      $a0, $zero, 8
/* 242D8 800236D8 02402821 */  addu       $a1, $s2, $zero
/* 242DC 800236DC 2406007E */  addiu      $a2, $zero, 0x7e
/* 242E0 800236E0 3C16800F */  lui        $s6, %hi(EntityPointer)
/* 242E4 800236E4 0C025F9C */  jal        Malloc
/* 242E8 800236E8 AEC213A0 */   sw        $v0, %lo(EntityPointer)($s6)
/* 242EC 800236EC 24040008 */  addiu      $a0, $zero, 8
/* 242F0 800236F0 02402821 */  addu       $a1, $s2, $zero
/* 242F4 800236F4 2406007F */  addiu      $a2, $zero, 0x7f
/* 242F8 800236F8 3C15800F */  lui        $s5, %hi(armour_pointer)
/* 242FC 800236FC 0C025F9C */  jal        Malloc
/* 24300 80023700 AEA2F7B0 */   sw        $v0, %lo(armour_pointer)($s5)
/* 24304 80023704 24040008 */  addiu      $a0, $zero, 8
/* 24308 80023708 02402821 */  addu       $a1, $s2, $zero
/* 2430C 8002370C 24060080 */  addiu      $a2, $zero, 0x80
/* 24310 80023710 3C13800F */  lui        $s3, %hi(loot_pointer)
/* 24314 80023714 0C025F9C */  jal        Malloc
/* 24318 80023718 AE62F810 */   sw        $v0, %lo(loot_pointer)($s3)
/* 2431C 8002371C 24040008 */  addiu      $a0, $zero, 8
/* 24320 80023720 02402821 */  addu       $a1, $s2, $zero
/* 24324 80023724 24060081 */  addiu      $a2, $zero, 0x81
/* 24328 80023728 3C11800F */  lui        $s1, %hi(shop_pointer)
/* 2432C 8002372C 0C025F9C */  jal        Malloc
/* 24330 80023730 AE221690 */   sw        $v0, %lo(shop_pointer)($s1)
/* 24334 80023734 8E0416A0 */  lw         $a0, 0x16a0($s0)
/* 24338 80023738 3C10800F */  lui        $s0, %hi(DialougEntityPointer)
/* 2433C 8002373C 0C01DAE2 */  jal        build_spelldb
/* 24340 80023740 AE02F860 */   sw        $v0, %lo(DialougEntityPointer)($s0)
/* 24344 80023744 0C01DC49 */  jal        build_weapondb
/* 24348 80023748 8FC416F0 */   lw        $a0, 0x16f0($fp)
/* 2434C 8002374C 0C01D959 */  jal        build_itemdb
/* 24350 80023750 8EE414F0 */   lw        $a0, 0x14f0($s7)
/* 24354 80023754 0C01D4DF */  jal        build_entitydb
/* 24358 80023758 8EC413A0 */   lw        $a0, 0x13a0($s6)
/* 2435C 8002375C 0C01D118 */  jal        build_armordb
/* 24360 80023760 8EA4F7B0 */   lw        $a0, -0x850($s5)
/* 24364 80023764 0C01D2D5 */  jal        build_chestdb
/* 24368 80023768 8E64F810 */   lw        $a0, -0x7f0($s3)
/* 2436C 8002376C 0C01DA24 */  jal        build_shopDB
/* 24370 80023770 8E241690 */   lw        $a0, 0x1690($s1)
/* 24374 80023774 0C01D36E */  jal        build_dailougentitydb
/* 24378 80023778 8E04F860 */   lw        $a0, -0x7a0($s0)
/* 2437C 8002377C 0C009136 */  jal        load_gamestateFunnel
/* 24380 80023780 2691DFA0 */   addiu     $s1, $s4, -0x2060
/* 24384 80023784 24040028 */  addiu      $a0, $zero, 0x28
/* 24388 80023788 02402821 */  addu       $a1, $s2, $zero
/* 2438C 8002378C 0C025F9C */  jal        Malloc
/* 24390 80023790 24060090 */   addiu     $a2, $zero, 0x90
/* 24394 80023794 00408021 */  addu       $s0, $v0, $zero
/* 24398 80023798 02002021 */  addu       $a0, $s0, $zero
/* 2439C 8002379C 0C01F6C4 */  jal        init_party
/* 243A0 800237A0 AE3015F8 */   sw        $s0, 0x15f8($s1)
/* 243A4 800237A4 0C006F24 */  jal        saveentity_init
/* 243A8 800237A8 00000000 */   nop
/* 243AC 800237AC 3C02800F */  lui        $v0, %hi(entityList+0x99)
/* 243B0 800237B0 90451449 */  lbu        $a1, %lo(entityList+0x99)($v0)
/* 243B4 800237B4 02002021 */  addu       $a0, $s0, $zero
/* 243B8 800237B8 0C01F7BD */  jal        add_to_party
/* 243BC 800237BC 34A50200 */   ori       $a1, $a1, 0x200
/* 243C0 800237C0 24040038 */  addiu      $a0, $zero, 0x38
/* 243C4 800237C4 02402821 */  addu       $a1, $s2, $zero
/* 243C8 800237C8 2406009C */  addiu      $a2, $zero, 0x9c
/* 243CC 800237CC 24020001 */  addiu      $v0, $zero, 1
/* 243D0 800237D0 0C025F9C */  jal        Malloc
/* 243D4 800237D4 AE020014 */   sw        $v0, 0x14($s0)
/* 243D8 800237D8 00402021 */  addu       $a0, $v0, $zero
/* 243DC 800237DC 3C10800F */  lui        $s0, %hi(TerrainPointer)
/* 243E0 800237E0 0C021338 */  jal        TerrainStruct_init
/* 243E4 800237E4 AE021BBC */   sw        $v0, %lo(TerrainPointer)($s0)
/* 243E8 800237E8 27A50010 */  addiu      $a1, $sp, 0x10
/* 243EC 800237EC 24020006 */  addiu      $v0, $zero, 6
/* 243F0 800237F0 8E041BBC */  lw         $a0, 0x1bbc($s0)
/* 243F4 800237F4 24030002 */  addiu      $v1, $zero, 2
/* 243F8 800237F8 A3A20011 */  sb         $v0, 0x11($sp)
/* 243FC 800237FC 2402000C */  addiu      $v0, $zero, 0xc
/* 24400 80023800 A3A00010 */  sb         $zero, 0x10($sp)
/* 24404 80023804 A3A30012 */  sb         $v1, 0x12($sp)
/* 24408 80023808 A3A20013 */  sb         $v0, 0x13($sp)
/* 2440C 8002380C A3A00014 */  sb         $zero, 0x14($sp)
/* 24410 80023810 0C02139E */  jal        set_time_from_calendar
/* 24414 80023814 A3A00015 */   sb        $zero, 0x15($sp)
/* 24418 80023818 0C0144ED */  jal        minimap_struct_init
/* 2441C 8002381C 2684F4AC */   addiu     $a0, $s4, -0xb54
/* 24420 80023820 240200FF */  addiu      $v0, $zero, 0xff
/* 24424 80023824 AE2014D4 */  sw         $zero, 0x14d4($s1)
/* 24428 80023828 A22214D8 */  sb         $v0, 0x14d8($s1)
/* 2442C 8002382C A22214D9 */  sb         $v0, 0x14d9($s1)
/* 24430 80023830 A22214DA */  sb         $v0, 0x14da($s1)
/* 24434 80023834 A22214DB */  sb         $v0, 0x14db($s1)
/* 24438 80023838 A22014D0 */  sb         $zero, 0x14d0($s1)
/* 2443C 8002383C AE2014FC */  sw         $zero, 0x14fc($s1)
/* 24440 80023840 A22014D1 */  sb         $zero, 0x14d1($s1)
/* 24444 80023844 AE2014EC */  sw         $zero, 0x14ec($s1)
/* 24448 80023848 AE2014E4 */  sw         $zero, 0x14e4($s1)
/* 2444C 8002384C AE2014E8 */  sw         $zero, 0x14e8($s1)
/* 24450 80023850 0C00B784 */  jal        lensflare_init
/* 24454 80023854 AE2014E0 */   sw        $zero, 0x14e0($s1)
/* 24458 80023858 0C00C0FC */  jal        skyobjects_func
/* 2445C 8002385C 00000000 */   nop
/* 24460 80023860 0C00B8E0 */  jal        clouds_func
/* 24464 80023864 00000000 */   nop
/* 24468 80023868 0C017E30 */  jal        calloc_voxelChart
/* 2446C 8002386C 00000000 */   nop
/* 24470 80023870 0C020CAC */  jal        load_potion_romstring
/* 24474 80023874 00000000 */   nop
/* 24478 80023878 8FBF0074 */  lw         $ra, 0x74($sp)
/* 2447C 8002387C 8FBE0070 */  lw         $fp, 0x70($sp)
/* 24480 80023880 8FB7006C */  lw         $s7, 0x6c($sp)
/* 24484 80023884 8FB60068 */  lw         $s6, 0x68($sp)
/* 24488 80023888 8FB50064 */  lw         $s5, 0x64($sp)
/* 2448C 8002388C 8FB40060 */  lw         $s4, 0x60($sp)
/* 24490 80023890 8FB3005C */  lw         $s3, 0x5c($sp)
/* 24494 80023894 8FB20058 */  lw         $s2, 0x58($sp)
/* 24498 80023898 8FB10054 */  lw         $s1, 0x54($sp)
/* 2449C 8002389C 8FB00050 */  lw         $s0, 0x50($sp)
/* 244A0 800238A0 03E00008 */  jr         $ra
/* 244A4 800238A4 27BD0078 */   addiu     $sp, $sp, 0x78

glabel clear_DBs
/* 244A8 800238A8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 244AC 800238AC AFBF0020 */  sw         $ra, 0x20($sp)
/* 244B0 800238B0 AFB3001C */  sw         $s3, 0x1c($sp)
/* 244B4 800238B4 AFB20018 */  sw         $s2, 0x18($sp)
/* 244B8 800238B8 AFB10014 */  sw         $s1, 0x14($sp)
/* 244BC 800238BC 0C00B684 */  jal        n64print_free
/* 244C0 800238C0 AFB00010 */   sw        $s0, 0x10($sp)
/* 244C4 800238C4 3C13800E */  lui        $s3, %hi(SFXStruct)
/* 244C8 800238C8 26737BA0 */  addiu      $s3, $s3, %lo(SFXStruct)
/* 244CC 800238CC 0C01589E */  jal        sfx_struct_free
/* 244D0 800238D0 02602021 */   addu      $a0, $s3, $zero
/* 244D4 800238D4 3C10800F */  lui        $s0, %hi(DialougEntityPointer)
/* 244D8 800238D8 0C01D399 */  jal        dialougEnt_free
/* 244DC 800238DC 8E04F860 */   lw        $a0, %lo(DialougEntityPointer)($s0)
/* 244E0 800238E0 3C11800E */  lui        $s1, %hi(D_800D9E00)
/* 244E4 800238E4 26319E00 */  addiu      $s1, $s1, %lo(D_800D9E00)
/* 244E8 800238E8 02202821 */  addu       $a1, $s1, $zero
/* 244EC 800238EC 8E04F860 */  lw         $a0, -0x7a0($s0)
/* 244F0 800238F0 0C02600C */  jal        Free
/* 244F4 800238F4 240600E3 */   addiu     $a2, $zero, 0xe3
/* 244F8 800238F8 3C10800F */  lui        $s0, %hi(shop_pointer)
/* 244FC 800238FC 0C01DA4F */  jal        Shopdb_free
/* 24500 80023900 8E041690 */   lw        $a0, %lo(shop_pointer)($s0)
/* 24504 80023904 02202821 */  addu       $a1, $s1, $zero
/* 24508 80023908 8E041690 */  lw         $a0, 0x1690($s0)
/* 2450C 8002390C 0C02600C */  jal        Free
/* 24510 80023910 240600E5 */   addiu     $a2, $zero, 0xe5
/* 24514 80023914 3C10800F */  lui        $s0, %hi(loot_pointer)
/* 24518 80023918 0C01D300 */  jal        Chestdb_free
/* 2451C 8002391C 8E04F810 */   lw        $a0, %lo(loot_pointer)($s0)
/* 24520 80023920 02202821 */  addu       $a1, $s1, $zero
/* 24524 80023924 8E04F810 */  lw         $a0, -0x7f0($s0)
/* 24528 80023928 0C02600C */  jal        Free
/* 2452C 8002392C 240600E7 */   addiu     $a2, $zero, 0xe7
/* 24530 80023930 3C10800F */  lui        $s0, %hi(armour_pointer)
/* 24534 80023934 0C01D160 */  jal        Armordb_free
/* 24538 80023938 8E04F7B0 */   lw        $a0, %lo(armour_pointer)($s0)
/* 2453C 8002393C 02202821 */  addu       $a1, $s1, $zero
/* 24540 80023940 8E04F7B0 */  lw         $a0, -0x850($s0)
/* 24544 80023944 0C02600C */  jal        Free
/* 24548 80023948 240600E9 */   addiu     $a2, $zero, 0xe9
/* 2454C 8002394C 3C10800F */  lui        $s0, %hi(EntityPointer)
/* 24550 80023950 0C01D527 */  jal        entitydb_free
/* 24554 80023954 8E0413A0 */   lw        $a0, %lo(EntityPointer)($s0)
/* 24558 80023958 02202821 */  addu       $a1, $s1, $zero
/* 2455C 8002395C 8E0413A0 */  lw         $a0, 0x13a0($s0)
/* 24560 80023960 0C02600C */  jal        Free
/* 24564 80023964 240600EB */   addiu     $a2, $zero, 0xeb
/* 24568 80023968 3C10800F */  lui        $s0, %hi(item_pointer)
/* 2456C 8002396C 0C01D9A3 */  jal        clear_item_pointer
/* 24570 80023970 8E0414F0 */   lw        $a0, %lo(item_pointer)($s0)
/* 24574 80023974 02202821 */  addu       $a1, $s1, $zero
/* 24578 80023978 8E0414F0 */  lw         $a0, 0x14f0($s0)
/* 2457C 8002397C 0C02600C */  jal        Free
/* 24580 80023980 240600ED */   addiu     $a2, $zero, 0xed
/* 24584 80023984 3C10800F */  lui        $s0, %hi(weapon_pointer)
/* 24588 80023988 0C01DC95 */  jal        weaponDB_clear
/* 2458C 8002398C 8E0416F0 */   lw        $a0, %lo(weapon_pointer)($s0)
/* 24590 80023990 02202821 */  addu       $a1, $s1, $zero
/* 24594 80023994 8E0416F0 */  lw         $a0, 0x16f0($s0)
/* 24598 80023998 0C02600C */  jal        Free
/* 2459C 8002399C 240600EF */   addiu     $a2, $zero, 0xef
/* 245A0 800239A0 3C10800F */  lui        $s0, %hi(spell_pointer)
/* 245A4 800239A4 0C01DB2E */  jal        spelldb_free
/* 245A8 800239A8 8E0416A0 */   lw        $a0, %lo(spell_pointer)($s0)
/* 245AC 800239AC 02202821 */  addu       $a1, $s1, $zero
/* 245B0 800239B0 8E0416A0 */  lw         $a0, 0x16a0($s0)
/* 245B4 800239B4 0C02600C */  jal        Free
/* 245B8 800239B8 240600F1 */   addiu     $a2, $zero, 0xf1
/* 245BC 800239BC 2670ED08 */  addiu      $s0, $s3, -0x12f8
/* 245C0 800239C0 0C01F6D4 */  jal        Party_free
/* 245C4 800239C4 8E0415F8 */   lw        $a0, 0x15f8($s0)
/* 245C8 800239C8 02202821 */  addu       $a1, $s1, $zero
/* 245CC 800239CC 8E0415F8 */  lw         $a0, 0x15f8($s0)
/* 245D0 800239D0 0C02600C */  jal        Free
/* 245D4 800239D4 240600F5 */   addiu     $a2, $zero, 0xf5
/* 245D8 800239D8 02202821 */  addu       $a1, $s1, $zero
/* 245DC 800239DC 3C12800F */  lui        $s2, %hi(TerrainPointer)
/* 245E0 800239E0 8E441BBC */  lw         $a0, %lo(TerrainPointer)($s2)
/* 245E4 800239E4 240600F9 */  addiu      $a2, $zero, 0xf9
/* 245E8 800239E8 0C02600C */  jal        Free
/* 245EC 800239EC AE0015F8 */   sw        $zero, 0x15f8($s0)
/* 245F0 800239F0 0C00B7C4 */  jal        lensflare_free
/* 245F4 800239F4 AE401BBC */   sw        $zero, 0x1bbc($s2)
/* 245F8 800239F8 0C00B963 */  jal        clouds_free
/* 245FC 800239FC 00000000 */   nop
/* 24600 80023A00 0C00C1AD */  jal        skyobjects_free
/* 24604 80023A04 00000000 */   nop
/* 24608 80023A08 0C009159 */  jal        clear_gamestatefunnel
/* 2460C 80023A0C 00000000 */   nop
/* 24610 80023A10 0C006F34 */  jal        saveentity_free
/* 24614 80023A14 00000000 */   nop
/* 24618 80023A18 0C01450E */  jal        passto_minimap_struct_free
/* 2461C 80023A1C 26640214 */   addiu     $a0, $s3, 0x214
/* 24620 80023A20 0C020CBB */  jal        clear_potion_romstrings
/* 24624 80023A24 00000000 */   nop
/* 24628 80023A28 8FBF0020 */  lw         $ra, 0x20($sp)
/* 2462C 80023A2C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 24630 80023A30 8FB20018 */  lw         $s2, 0x18($sp)
/* 24634 80023A34 8FB10014 */  lw         $s1, 0x14($sp)
/* 24638 80023A38 8FB00010 */  lw         $s0, 0x10($sp)
/* 2463C 80023A3C 03E00008 */  jr         $ra
/* 24640 80023A40 27BD0028 */   addiu     $sp, $sp, 0x28

glabel some_init_func
/* 24644 80023A44 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 24648 80023A48 AFB00010 */  sw         $s0, 0x10($sp)
/* 2464C 80023A4C 3C10800E */  lui        $s0, %hi(PlayerCharStruct)
/* 24650 80023A50 26106950 */  addiu      $s0, $s0, %lo(PlayerCharStruct)
/* 24654 80023A54 02002021 */  addu       $a0, $s0, $zero
/* 24658 80023A58 00002821 */  addu       $a1, $zero, $zero
/* 2465C 80023A5C AFBF0014 */  sw         $ra, 0x14($sp)
/* 24660 80023A60 0C026380 */  jal        Calloc
/* 24664 80023A64 24060038 */   addiu     $a2, $zero, 0x38
/* 24668 80023A68 26040038 */  addiu      $a0, $s0, 0x38
/* 2466C 80023A6C 00002821 */  addu       $a1, $zero, $zero
/* 24670 80023A70 0C026380 */  jal        Calloc
/* 24674 80023A74 24061218 */   addiu     $a2, $zero, 0x1218
/* 24678 80023A78 0C008D8C */  jal        init_DBs
/* 2467C 80023A7C 2610FF58 */   addiu     $s0, $s0, -0xa8
/* 24680 80023A80 3C048005 */  lui        $a0, %hi(dialougPreCallback)
/* 24684 80023A84 24846C84 */  addiu      $a0, $a0, %lo(dialougPreCallback)
/* 24688 80023A88 2402000F */  addiu      $v0, $zero, 0xf
/* 2468C 80023A8C A2020040 */  sb         $v0, 0x40($s0)
/* 24690 80023A90 24020002 */  addiu      $v0, $zero, 2
/* 24694 80023A94 A20013CA */  sb         $zero, 0x13ca($s0)
/* 24698 80023A98 A6022048 */  sh         $v0, 0x2048($s0)
/* 2469C 80023A9C AE002044 */  sw         $zero, 0x2044($s0)
/* 246A0 80023AA0 AE00203C */  sw         $zero, 0x203c($s0)
/* 246A4 80023AA4 0C02D630 */  jal        set_dialougprecallback
/* 246A8 80023AA8 AE002040 */   sw        $zero, 0x2040($s0)
/* 246AC 80023AAC 3C048005 */  lui        $a0, %hi(dialoug_func_b)
/* 246B0 80023AB0 0C02D633 */  jal        set_dialoug_func_b
/* 246B4 80023AB4 24847198 */   addiu     $a0, $a0, %lo(dialoug_func_b)
/* 246B8 80023AB8 3C048005 */  lui        $a0, %hi(dialouge_func_C)
/* 246BC 80023ABC 0C02D636 */  jal        set_dialoug_func_c
/* 246C0 80023AC0 248472D0 */   addiu     $a0, $a0, %lo(dialouge_func_C)
/* 246C4 80023AC4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 246C8 80023AC8 8FB00010 */  lw         $s0, 0x10($sp)
/* 246CC 80023ACC 03E00008 */  jr         $ra
/* 246D0 80023AD0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel passto_clear_dbs
/* 246D4 80023AD4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 246D8 80023AD8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 246DC 80023ADC 0C008E2A */  jal        clear_DBs
/* 246E0 80023AE0 00000000 */   nop
/* 246E4 80023AE4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 246E8 80023AE8 03E00008 */  jr         $ra
/* 246EC 80023AEC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel game_ScreenFadeMode
/* 246F0 80023AF0 3C02800F */  lui        $v0, %hi(initdb_flag)
/* 246F4 80023AF4 90439930 */  lbu        $v1, %lo(initdb_flag)($v0)
/* 246F8 80023AF8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 246FC 80023AFC AFB20018 */  sw         $s2, 0x18($sp)
/* 24700 80023B00 00809021 */  addu       $s2, $a0, $zero
/* 24704 80023B04 AFB50024 */  sw         $s5, 0x24($sp)
/* 24708 80023B08 0040A821 */  addu       $s5, $v0, $zero
/* 2470C 80023B0C AFBF0028 */  sw         $ra, 0x28($sp)
/* 24710 80023B10 AFB40020 */  sw         $s4, 0x20($sp)
/* 24714 80023B14 AFB3001C */  sw         $s3, 0x1c($sp)
/* 24718 80023B18 AFB10014 */  sw         $s1, 0x14($sp)
/* 2471C 80023B1C 10600004 */  beqz       $v1, .L80023B30
/* 24720 80023B20 AFB00010 */   sw        $s0, 0x10($sp)
/* 24724 80023B24 0C008E91 */  jal        some_init_func
/* 24728 80023B28 00000000 */   nop
/* 2472C 80023B2C A2A09930 */  sb         $zero, -0x66d0($s5)
.L80023B30:
/* 24730 80023B30 3C02800E */  lui        $v0, %hi(gGlobals)
/* 24734 80023B34 244468A8 */  addiu      $a0, $v0, %lo(gGlobals)
/* 24738 80023B38 24140001 */  addiu      $s4, $zero, 1
/* 2473C 80023B3C C480000C */  lwc1       $f0, 0xc($a0)
/* 24740 80023B40 3C01800E */  lui        $at, %hi(D_800D9E3C)
/* 24744 80023B44 C4269E3C */  lwc1       $f6, %lo(D_800D9E3C)($at)
/* 24748 80023B48 4606003C */  c.lt.s     $f0, $f6
/* 2474C 80023B4C 00000000 */  nop
/* 24750 80023B50 45000002 */  bc1f       .L80023B5C
/* 24754 80023B54 00409821 */   addu      $s3, $v0, $zero
/* 24758 80023B58 E486000C */  swc1       $f6, 0xc($a0)
.L80023B5C:
/* 2475C 80023B5C 94832048 */  lhu        $v1, 0x2048($a0)
/* 24760 80023B60 24020002 */  addiu      $v0, $zero, 2
/* 24764 80023B64 1062000B */  beq        $v1, $v0, .L80023B94
/* 24768 80023B68 28620003 */   slti      $v0, $v1, 3
/* 2476C 80023B6C 10400005 */  beqz       $v0, .L80023B84
/* 24770 80023B70 24020003 */   addiu     $v0, $zero, 3
/* 24774 80023B74 1074000F */  beq        $v1, $s4, .L80023BB4
/* 24778 80023B78 267168A8 */   addiu     $s1, $s3, 0x68a8
/* 2477C 80023B7C 08008F17 */  j          .L80023C5C
/* 24780 80023B80 96222048 */   lhu       $v0, 0x2048($s1)
.L80023B84:
/* 24784 80023B84 10620021 */  beq        $v1, $v0, .L80023C0C
/* 24788 80023B88 267168A8 */   addiu     $s1, $s3, 0x68a8
/* 2478C 80023B8C 08008F17 */  j          .L80023C5C
/* 24790 80023B90 96222048 */   lhu       $v0, 0x2048($s1)
.L80023B94:
/* 24794 80023B94 C4802044 */  lwc1       $f0, 0x2044($a0)
/* 24798 80023B98 C484000C */  lwc1       $f4, 0xc($a0)
/* 2479C 80023B9C 46040002 */  mul.s      $f0, $f0, $f4
/* 247A0 80023BA0 C482203C */  lwc1       $f2, 0x203c($a0)
/* 247A4 80023BA4 46001080 */  add.s      $f2, $f2, $f0
/* 247A8 80023BA8 4602303E */  c.le.s     $f6, $f2
/* 247AC 80023BAC 08008F11 */  j          .L80023C44
/* 247B0 80023BB0 E482203C */   swc1      $f2, 0x203c($a0)
.L80023BB4:
/* 247B4 80023BB4 C4802044 */  lwc1       $f0, 0x2044($a0)
/* 247B8 80023BB8 C484000C */  lwc1       $f4, 0xc($a0)
/* 247BC 80023BBC 46040002 */  mul.s      $f0, $f0, $f4
/* 247C0 80023BC0 C482203C */  lwc1       $f2, 0x203c($a0)
/* 247C4 80023BC4 46001081 */  sub.s      $f2, $f2, $f0
/* 247C8 80023BC8 44800000 */  mtc1       $zero, $f0
/* 247CC 80023BCC 4600103E */  c.le.s     $f2, $f0
/* 247D0 80023BD0 00000000 */  nop
/* 247D4 80023BD4 4500002D */  bc1f       .L80023C8C
/* 247D8 80023BD8 E482203C */   swc1      $f2, 0x203c($a0)
/* 247DC 80023BDC 3C03800F */  lui        $v1, %hi(D_800E9932)
/* 247E0 80023BE0 90629932 */  lbu        $v0, %lo(D_800E9932)($v1)
/* 247E4 80023BE4 E480203C */  swc1       $f0, 0x203c($a0)
/* 247E8 80023BE8 24420001 */  addiu      $v0, $v0, 1
/* 247EC 80023BEC A0629932 */  sb         $v0, -0x66ce($v1)
/* 247F0 80023BF0 304200FF */  andi       $v0, $v0, 0xff
/* 247F4 80023BF4 2C420003 */  sltiu      $v0, $v0, 3
/* 247F8 80023BF8 54400025 */  bnel       $v0, $zero, .L80023C90
/* 247FC 80023BFC 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24800 80023C00 A0609932 */  sb         $zero, -0x66ce($v1)
/* 24804 80023C04 08008F23 */  j          .L80023C8C
/* 24808 80023C08 A4802048 */   sh        $zero, 0x2048($a0)
.L80023C0C:
/* 2480C 80023C0C C4802044 */  lwc1       $f0, 0x2044($a0)
/* 24810 80023C10 C482000C */  lwc1       $f2, 0xc($a0)
/* 24814 80023C14 46020002 */  mul.s      $f0, $f0, $f2
/* 24818 80023C18 C4842040 */  lwc1       $f4, 0x2040($a0)
/* 2481C 80023C1C 46002100 */  add.s      $f4, $f4, $f0
/* 24820 80023C20 44801000 */  mtc1       $zero, $f2
/* 24824 80023C24 46002006 */  mov.s      $f0, $f4
/* 24828 80023C28 4600103C */  c.lt.s     $f2, $f0
/* 2482C 80023C2C 00000000 */  nop
/* 24830 80023C30 45010002 */  bc1t       .L80023C3C
/* 24834 80023C34 E4842040 */   swc1      $f4, 0x2040($a0)
/* 24838 80023C38 46000007 */  neg.s      $f0, $f0
.L80023C3C:
/* 2483C 80023C3C E480203C */  swc1       $f0, 0x203c($a0)
/* 24840 80023C40 4600303E */  c.le.s     $f6, $f0
.L80023C44:
/* 24844 80023C44 00000000 */  nop
/* 24848 80023C48 45000011 */  bc1f       .L80023C90
/* 2484C 80023C4C 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24850 80023C50 E486203C */  swc1       $f6, 0x203c($a0)
/* 24854 80023C54 08008F24 */  j          .L80023C90
/* 24858 80023C58 A4802048 */   sh        $zero, 0x2048($a0)
.L80023C5C:
/* 2485C 80023C5C 1040000B */  beqz       $v0, .L80023C8C
/* 24860 80023C60 00403021 */   addu      $a2, $v0, $zero
/* 24864 80023C64 26302078 */  addiu      $s0, $s1, 0x2078
/* 24868 80023C68 02002021 */  addu       $a0, $s0, $zero
/* 2486C 80023C6C 3C05800E */  lui        $a1, %hi(D_800D9E10)
/* 24870 80023C70 0C0333AC */  jal        sprintf
/* 24874 80023C74 24A59E10 */   addiu     $a1, $a1, %lo(D_800D9E10)
/* 24878 80023C78 3C04800E */  lui        $a0, %hi(D_800D9E30)
/* 2487C 80023C7C 24849E30 */  addiu      $a0, $a0, %lo(D_800D9E30)
/* 24880 80023C80 0C025F2D */  jal        manualCrash
/* 24884 80023C84 02002821 */   addu      $a1, $s0, $zero
/* 24888 80023C88 A6202048 */  sh         $zero, 0x2048($s1)
.L80023C8C:
/* 2488C 80023C8C 266368A8 */  addiu      $v1, $s3, 0x68a8
.L80023C90:
/* 24890 80023C90 C460203C */  lwc1       $f0, 0x203c($v1)
/* 24894 80023C94 90640040 */  lbu        $a0, 0x40($v1)
/* 24898 80023C98 3C02800F */  lui        $v0, %hi(D_800F36F8)
/* 2489C 80023C9C E44036F8 */  swc1       $f0, %lo(D_800F36F8)($v0)
/* 248A0 80023CA0 E4600764 */  swc1       $f0, 0x764($v1)
/* 248A4 80023CA4 2483FFFF */  addiu      $v1, $a0, -1
/* 248A8 80023CA8 2C620013 */  sltiu      $v0, $v1, 0x13
/* 248AC 80023CAC 10400039 */  beqz       $v0, .L80023D94
/* 248B0 80023CB0 3C02800E */   lui       $v0, %hi(D_800D9E40)
/* 248B4 80023CB4 24429E40 */  addiu      $v0, $v0, %lo(D_800D9E40)
/* 248B8 80023CB8 00031880 */  sll        $v1, $v1, 2
/* 248BC 80023CBC 00621821 */  addu       $v1, $v1, $v0
/* 248C0 80023CC0 8C640000 */  lw         $a0, ($v1)
/* 248C4 80023CC4 00800008 */  jr         $a0
/* 248C8 80023CC8 00000000 */   nop
/* 248CC 80023CCC 0C00934A */  jal        screenFadeMode_1_9
/* 248D0 80023CD0 02402021 */   addu      $a0, $s2, $zero
/* 248D4 80023CD4 08008F64 */  j          .L80023D90
/* 248D8 80023CD8 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 248DC 80023CDC 0C00A4CD */  jal        ScreenFadeMode_2
/* 248E0 80023CE0 02402021 */   addu      $a0, $s2, $zero
/* 248E4 80023CE4 08008F64 */  j          .L80023D90
/* 248E8 80023CE8 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 248EC 80023CEC 0C014065 */  jal        ScreenFadeMode_3
/* 248F0 80023CF0 02402021 */   addu      $a0, $s2, $zero
/* 248F4 80023CF4 08008F64 */  j          .L80023D90
/* 248F8 80023CF8 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 248FC 80023CFC 0C014065 */  jal        ScreenFadeMode_3
/* 24900 80023D00 02402021 */   addu      $a0, $s2, $zero
/* 24904 80023D04 266468A8 */  addiu      $a0, $s3, 0x68a8
/* 24908 80023D08 304300FF */  andi       $v1, $v0, 0xff
/* 2490C 80023D0C 24050002 */  addiu      $a1, $zero, 2
/* 24910 80023D10 10650020 */  beq        $v1, $a1, .L80023D94
/* 24914 80023D14 A0820040 */   sb        $v0, 0x40($a0)
/* 24918 80023D18 24020001 */  addiu      $v0, $zero, 1
/* 2491C 80023D1C 1462001E */  bne        $v1, $v0, .L80023D98
/* 24920 80023D20 3C02800F */   lui       $v0, 0x800f
/* 24924 80023D24 24020010 */  addiu      $v0, $zero, 0x10
/* 24928 80023D28 A0850040 */  sb         $a1, 0x40($a0)
/* 2492C 80023D2C 08008F65 */  j          .L80023D94
/* 24930 80023D30 A08213C8 */   sb        $v0, 0x13c8($a0)
/* 24934 80023D34 0C001475 */  jal        ScreenFademode_10
/* 24938 80023D38 02402021 */   addu      $a0, $s2, $zero
/* 2493C 80023D3C 08008F64 */  j          .L80023D90
/* 24940 80023D40 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24944 80023D44 0C015FE9 */  jal        ScreenFadeMode_12
/* 24948 80023D48 02402021 */   addu      $a0, $s2, $zero
/* 2494C 80023D4C 08008F64 */  j          .L80023D90
/* 24950 80023D50 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24954 80023D54 0C0171D9 */  jal        some_cinematic_func
/* 24958 80023D58 02402021 */   addu      $a0, $s2, $zero
/* 2495C 80023D5C 08008F64 */  j          .L80023D90
/* 24960 80023D60 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24964 80023D64 0C017804 */  jal        gameStart
/* 24968 80023D68 02402021 */   addu      $a0, $s2, $zero
/* 2496C 80023D6C 08008F64 */  j          .L80023D90
/* 24970 80023D70 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24974 80023D74 0C0222FF */  jal        ScreenFadeMode_17
/* 24978 80023D78 02402021 */   addu      $a0, $s2, $zero
/* 2497C 80023D7C 08008F64 */  j          .L80023D90
/* 24980 80023D80 266368A8 */   addiu     $v1, $s3, 0x68a8
/* 24984 80023D84 0C008F94 */  jal        func_loading_credits
/* 24988 80023D88 02402021 */   addu      $a0, $s2, $zero
/* 2498C 80023D8C 266368A8 */  addiu      $v1, $s3, 0x68a8
.L80023D90:
/* 24990 80023D90 A0620040 */  sb         $v0, 0x40($v1)
.L80023D94:
/* 24994 80023D94 3C02800F */  lui        $v0, %hi(TerrainPointer)
.L80023D98:
/* 24998 80023D98 8C431BBC */  lw         $v1, %lo(TerrainPointer)($v0)
/* 2499C 80023D9C 10600013 */  beqz       $v1, .L80023DEC
/* 249A0 80023DA0 24441BBC */   addiu     $a0, $v0, 0x1bbc
/* 249A4 80023DA4 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 249A8 80023DA8 C440000C */  lwc1       $f0, 0xc($v0)
/* 249AC 80023DAC 3C01800E */  lui        $at, %hi(D_800D9E8C)
/* 249B0 80023DB0 C4229E8C */  lwc1       $f2, %lo(D_800D9E8C)($at)
/* 249B4 80023DB4 4600103E */  c.le.s     $f2, $f0
/* 249B8 80023DB8 00000000 */  nop
/* 249BC 80023DBC 45030005 */  bc1tl      .L80023DD4
/* 249C0 80023DC0 46020001 */   sub.s     $f0, $f0, $f2
/* 249C4 80023DC4 4600008D */  trunc.w.s  $f2, $f0
/* 249C8 80023DC8 44051000 */  mfc1       $a1, $f2
/* 249CC 80023DCC 08008F79 */  j          .L80023DE4
/* 249D0 80023DD0 00000000 */   nop
.L80023DD4:
/* 249D4 80023DD4 4600008D */  trunc.w.s  $f2, $f0
/* 249D8 80023DD8 44051000 */  mfc1       $a1, $f2
/* 249DC 80023DDC 3C028000 */  lui        $v0, %hi(D_80000040)
/* 249E0 80023DE0 00A22825 */  or         $a1, $a1, $v0
.L80023DE4:
/* 249E4 80023DE4 0C0215C2 */  jal        add_playTime
/* 249E8 80023DE8 8C840000 */   lw        $a0, ($a0)
.L80023DEC:
/* 249EC 80023DEC 266268A8 */  addiu      $v0, $s3, 0x68a8
/* 249F0 80023DF0 90430040 */  lbu        $v1, %lo(D_80000040)($v0)
/* 249F4 80023DF4 14600004 */  bnez       $v1, .L80023E08
/* 249F8 80023DF8 3C10800F */   lui       $s0, %hi(cleardb_flag)
/* 249FC 80023DFC 24020001 */  addiu      $v0, $zero, 1
/* 24A00 80023E00 A2029931 */  sb         $v0, %lo(cleardb_flag)($s0)
/* 24A04 80023E04 0000A021 */  addu       $s4, $zero, $zero
.L80023E08:
/* 24A08 80023E08 92029931 */  lbu        $v0, -0x66cf($s0)
/* 24A0C 80023E0C 10400007 */  beqz       $v0, .L80023E2C
/* 24A10 80023E10 02801021 */   addu      $v0, $s4, $zero
/* 24A14 80023E14 0C008EB5 */  jal        passto_clear_dbs
/* 24A18 80023E18 00000000 */   nop
/* 24A1C 80023E1C 24020001 */  addiu      $v0, $zero, 1
/* 24A20 80023E20 A2A29930 */  sb         $v0, -0x66d0($s5)
/* 24A24 80023E24 A2009931 */  sb         $zero, -0x66cf($s0)
/* 24A28 80023E28 02801021 */  addu       $v0, $s4, $zero
.L80023E2C:
/* 24A2C 80023E2C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 24A30 80023E30 8FB50024 */  lw         $s5, 0x24($sp)
/* 24A34 80023E34 8FB40020 */  lw         $s4, 0x20($sp)
/* 24A38 80023E38 8FB3001C */  lw         $s3, 0x1c($sp)
/* 24A3C 80023E3C 8FB20018 */  lw         $s2, 0x18($sp)
/* 24A40 80023E40 8FB10014 */  lw         $s1, 0x14($sp)
/* 24A44 80023E44 8FB00010 */  lw         $s0, 0x10($sp)
/* 24A48 80023E48 03E00008 */  jr         $ra
/* 24A4C 80023E4C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_loading_credits
/* 24A50 80023E50 3C02800F */  lui        $v0, %hi(D_800E9933)
/* 24A54 80023E54 90439933 */  lbu        $v1, %lo(D_800E9933)($v0)
/* 24A58 80023E58 27BDFFB0 */  addiu      $sp, $sp, -0x50
/* 24A5C 80023E5C AFB40040 */  sw         $s4, 0x40($sp)
/* 24A60 80023E60 24140013 */  addiu      $s4, $zero, 0x13
/* 24A64 80023E64 AFB3003C */  sw         $s3, 0x3c($sp)
/* 24A68 80023E68 00809821 */  addu       $s3, $a0, $zero
/* 24A6C 80023E6C AFB60048 */  sw         $s6, 0x48($sp)
/* 24A70 80023E70 0040B021 */  addu       $s6, $v0, $zero
/* 24A74 80023E74 AFBF004C */  sw         $ra, 0x4c($sp)
/* 24A78 80023E78 AFB50044 */  sw         $s5, 0x44($sp)
/* 24A7C 80023E7C AFB20038 */  sw         $s2, 0x38($sp)
/* 24A80 80023E80 AFB10034 */  sw         $s1, 0x34($sp)
/* 24A84 80023E84 1060001F */  beqz       $v1, .L80023F04
/* 24A88 80023E88 AFB00030 */   sw        $s0, 0x30($sp)
/* 24A8C 80023E8C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 24A90 80023E90 244368A8 */  addiu      $v1, $v0, %lo(gGlobals)
/* 24A94 80023E94 C460203C */  lwc1       $f0, 0x203c($v1)
/* 24A98 80023E98 44801000 */  mtc1       $zero, $f2
/* 24A9C 80023E9C 44801800 */  mtc1       $zero, $f3
/* 24AA0 80023EA0 46000021 */  cvt.d.s    $f0, $f0
/* 24AA4 80023EA4 4620103C */  c.lt.d     $f2, $f0
/* 24AA8 80023EA8 00000000 */  nop
/* 24AAC 80023EAC 45000008 */  bc1f       .L80023ED0
/* 24AB0 80023EB0 00409021 */   addu      $s2, $v0, $zero
/* 24AB4 80023EB4 94622048 */  lhu        $v0, 0x2048($v1)
/* 24AB8 80023EB8 14400006 */  bnez       $v0, .L80023ED4
/* 24ABC 80023EBC 240400A0 */   addiu     $a0, $zero, 0xa0
/* 24AC0 80023EC0 24020001 */  addiu      $v0, $zero, 1
/* 24AC4 80023EC4 A4622048 */  sh         $v0, 0x2048($v1)
/* 24AC8 80023EC8 0800900E */  j          .L80024038
/* 24ACC 80023ECC 24020013 */   addiu     $v0, $zero, 0x13
.L80023ED0:
/* 24AD0 80023ED0 240400A0 */  addiu      $a0, $zero, 0xa0
.L80023ED4:
/* 24AD4 80023ED4 265068A8 */  addiu      $s0, $s2, 0x68a8
/* 24AD8 80023ED8 24020002 */  addiu      $v0, $zero, 2
/* 24ADC 80023EDC 0C026259 */  jal        passToMalloc
/* 24AE0 80023EE0 A6022048 */   sh        $v0, 0x2048($s0)
/* 24AE4 80023EE4 0C00CD94 */  jal        credits
/* 24AE8 80023EE8 00402021 */   addu      $a0, $v0, $zero
/* 24AEC 80023EEC 00402821 */  addu       $a1, $v0, $zero
/* 24AF0 80023EF0 8E041604 */  lw         $a0, 0x1604($s0)
/* 24AF4 80023EF4 3C03800F */  lui        $v1, %hi(credits_var)
/* 24AF8 80023EF8 0C02DC7C */  jal        widgetHandler
/* 24AFC 80023EFC AC629934 */   sw        $v0, %lo(credits_var)($v1)
/* 24B00 80023F00 A2C09933 */  sb         $zero, -0x66cd($s6)
.L80023F04:
/* 24B04 80023F04 3C02800F */  lui        $v0, %hi(credits_var)
/* 24B08 80023F08 8C439934 */  lw         $v1, %lo(credits_var)($v0)
/* 24B0C 80023F0C 14600003 */  bnez       $v1, .L80023F1C
/* 24B10 80023F10 0040A821 */   addu      $s5, $v0, $zero
/* 24B14 80023F14 0800900E */  j          .L80024038
/* 24B18 80023F18 24020013 */   addiu     $v0, $zero, 0x13
.L80023F1C:
/* 24B1C 80023F1C 00008021 */  addu       $s0, $zero, $zero
/* 24B20 80023F20 3C12800E */  lui        $s2, 0x800e
/* 24B24 80023F24 08008FCF */  j          .L80023F3C
/* 24B28 80023F28 27B10028 */   addiu     $s1, $sp, 0x28
.L80023F2C:
/* 24B2C 80023F2C 8C441604 */  lw         $a0, 0x1604($v0)
/* 24B30 80023F30 8FA50028 */  lw         $a1, 0x28($sp)
/* 24B34 80023F34 0C02DC69 */  jal        run_widget_control_func
/* 24B38 80023F38 26100001 */   addiu     $s0, $s0, 1
.L80023F3C:
/* 24B3C 80023F3C 02202021 */  addu       $a0, $s1, $zero
/* 24B40 80023F40 0C02713D */  jal        get_cont_aidyn
/* 24B44 80023F44 00002821 */   addu      $a1, $zero, $zero
/* 24B48 80023F48 1440FFF8 */  bnez       $v0, .L80023F2C
/* 24B4C 80023F4C 264268A8 */   addiu     $v0, $s2, 0x68a8
/* 24B50 80023F50 52000001 */  beql       $s0, $zero, .L80023F58
/* 24B54 80023F54 24100001 */   addiu     $s0, $zero, 1
.L80023F58:
/* 24B58 80023F58 2E020007 */  sltiu      $v0, $s0, 7
/* 24B5C 80023F5C 50400001 */  beql       $v0, $zero, .L80023F64
/* 24B60 80023F60 24100006 */   addiu     $s0, $zero, 6
.L80023F64:
/* 24B64 80023F64 44901000 */  mtc1       $s0, $f2
/* 24B68 80023F68 468010A1 */  cvt.d.w    $f2, $f2
/* 24B6C 80023F6C 06010004 */  bgez       $s0, .L80023F80
/* 24B70 80023F70 265168A8 */   addiu     $s1, $s2, 0x68a8
/* 24B74 80023F74 3C01800E */  lui        $at, %hi(D_800D9E90)
/* 24B78 80023F78 D4209E90 */  ldc1       $f0, %lo(D_800D9E90)($at)
/* 24B7C 80023F7C 46201080 */  add.d      $f2, $f2, $f0
.L80023F80:
/* 24B80 80023F80 00002821 */  addu       $a1, $zero, $zero
/* 24B84 80023F84 00003021 */  addu       $a2, $zero, $zero
/* 24B88 80023F88 24070140 */  addiu      $a3, $zero, 0x140
/* 24B8C 80023F8C 46201020 */  cvt.s.d    $f0, $f2
/* 24B90 80023F90 8E640000 */  lw         $a0, ($s3)
/* 24B94 80023F94 241000F0 */  addiu      $s0, $zero, 0xf0
/* 24B98 80023F98 E620000C */  swc1       $f0, 0xc($s1)
/* 24B9C 80023F9C AFB00010 */  sw         $s0, 0x10($sp)
/* 24BA0 80023FA0 AFA00014 */  sw         $zero, 0x14($sp)
/* 24BA4 80023FA4 AFA00018 */  sw         $zero, 0x18($sp)
/* 24BA8 80023FA8 AFA0001C */  sw         $zero, 0x1c($sp)
/* 24BAC 80023FAC 0C0299E5 */  jal        gsFadeInOut
/* 24BB0 80023FB0 AFA00020 */   sw        $zero, 0x20($sp)
/* 24BB4 80023FB4 00402021 */  addu       $a0, $v0, $zero
/* 24BB8 80023FB8 00002821 */  addu       $a1, $zero, $zero
/* 24BBC 80023FBC 00003021 */  addu       $a2, $zero, $zero
/* 24BC0 80023FC0 24070140 */  addiu      $a3, $zero, 0x140
/* 24BC4 80023FC4 AE620000 */  sw         $v0, ($s3)
/* 24BC8 80023FC8 0C0023E5 */  jal        some_rsp_func
/* 24BCC 80023FCC AFB00010 */   sw        $s0, 0x10($sp)
/* 24BD0 80023FD0 00402021 */  addu       $a0, $v0, $zero
/* 24BD4 80023FD4 0C015E9C */  jal        func_80057A70
/* 24BD8 80023FD8 AE620000 */   sw        $v0, ($s3)
/* 24BDC 80023FDC AE620000 */  sw         $v0, ($s3)
/* 24BE0 80023FE0 8EA49934 */  lw         $a0, -0x66cc($s5)
/* 24BE4 80023FE4 9083007C */  lbu        $v1, 0x7c($a0)
/* 24BE8 80023FE8 24020004 */  addiu      $v0, $zero, 4
/* 24BEC 80023FEC 14620012 */  bne        $v1, $v0, .L80024038
/* 24BF0 80023FF0 02801021 */   addu      $v0, $s4, $zero
/* 24BF4 80023FF4 0C02DEC8 */  jal        set_widgets_byte0x70
/* 24BF8 80023FF8 24050005 */   addiu     $a1, $zero, 5
/* 24BFC 80023FFC 24020001 */  addiu      $v0, $zero, 1
/* 24C00 80024000 A2C29933 */  sb         $v0, -0x66cd($s6)
/* 24C04 80024004 923014F8 */  lbu        $s0, 0x14f8($s1)
/* 24C08 80024008 24020001 */  addiu      $v0, $zero, 1
/* 24C0C 8002400C 12020007 */  beq        $s0, $v0, .L8002402C
/* 24C10 80024010 2A020002 */   slti      $v0, $s0, 2
/* 24C14 80024014 10400006 */  beqz       $v0, .L80024030
/* 24C18 80024018 0000A021 */   addu      $s4, $zero, $zero
/* 24C1C 8002401C 56000005 */  bnel       $s0, $zero, .L80024034
/* 24C20 80024020 AEA09934 */   sw        $zero, -0x66cc($s5)
/* 24C24 80024024 0800900C */  j          .L80024030
/* 24C28 80024028 2414000F */   addiu     $s4, $zero, 0xf
.L8002402C:
/* 24C2C 8002402C 24140009 */  addiu      $s4, $zero, 9
.L80024030:
/* 24C30 80024030 AEA09934 */  sw         $zero, -0x66cc($s5)
.L80024034:
/* 24C34 80024034 02801021 */  addu       $v0, $s4, $zero
.L80024038:
/* 24C38 80024038 8FBF004C */  lw         $ra, 0x4c($sp)
/* 24C3C 8002403C 8FB60048 */  lw         $s6, 0x48($sp)
/* 24C40 80024040 8FB50044 */  lw         $s5, 0x44($sp)
/* 24C44 80024044 8FB40040 */  lw         $s4, 0x40($sp)
/* 24C48 80024048 8FB3003C */  lw         $s3, 0x3c($sp)
/* 24C4C 8002404C 8FB20038 */  lw         $s2, 0x38($sp)
/* 24C50 80024050 8FB10034 */  lw         $s1, 0x34($sp)
/* 24C54 80024054 8FB00030 */  lw         $s0, 0x30($sp)
/* 24C58 80024058 03E00008 */  jr         $ra
/* 24C5C 8002405C 27BD0050 */   addiu     $sp, $sp, 0x50
