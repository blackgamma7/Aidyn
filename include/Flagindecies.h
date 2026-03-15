#pragma once
//definitions of event flags

#define FLAG_Total 5627 //total of (valid) entries in gameStateFunnel
#define FLAG_CountB 1372 // value of gamestatefunnel_rom.flagCountB
#define FLAG_BitCount 5001 // value of gamestatefunnel_rom.bitFlags. total of BIT-type event flags?

#define FLAG_False 0 //return false if flag is 0
#define FLAG_True 1  //return true if flag is 1
#define FLAG_2 2 //only(?) entry in gamestatefunnel_rom->states that's not BIT/INV

#define FLAG_Cinematic0 3
#define FLAG_Cinematic1 569
#define FLAG_Cinematic2 590 //checked during Character Init for Alaron, gives "True Name" flag
#define FLAG_Cinematic3 601 //triggered at end of game, so cinematic cannot be legit replayed.

#define FLAG_MeetOriana 47

#define FLAG_EnteredYorwood 54

//journal flags

#define FLAG_MeetShadow 9
#define FLAG_JournalAmbush 50
#define FLAG_JournalPortal 62
#define FLAG_JournalBeginQuest 68
#define FLAG_JournalTrahernSword1 85
#define FLAG_JournalTrahernSword2 19
#define FLAG_JournalTrahernSword3 87
#define FLAG_JournalGwerniaCamp 58
#define FLAG_JournalOrianaNecro 101
#define FLAG_JournalEnteredErromon 122
#define FLAG_JournalTxominLied 166
#define FLAG_JournalArdraGetAmaranth 218
#define FLAG_JournalFoundAmaranth 222
#define FLAG_JournalMetDryad 223
#define FLAG_JournalArdraVision 239
#define FLAG_JournalNoTrueName 240
#define FLAG_JournalCalledRehtorb 249
#define FLAG_JournalLighthouseKey 285
#define FLAG_JournalCradawghDead 320
#define FLAG_JournalArdraTalk 343
#define FLAG_JournalJoinAsk 362
#define FLAG_JournalLearnedZombies 391
#define FLAG_JournalFoundZombies 392
#define FLAG_JournalKilledTrolls 399
#define FLAG_JournalEnteredBog 414
#define FLAG_JournalEnterTower 438
#define FLAG_JournalSolvedRiddle 480
#define FLAG_JournalSpokeToZaratas 518
#define FLAG_JournalFoundHorn 551
#define FLAG_JournalLodinSword 548

#define FLAG_NewJournalEntry 3617
#define FLAG_JournalFlag 5556 //added to journal flags to trigger "new entry" flag
#define FLAG_CampCheck 4240 //set then unset during camping check.

//Calendar flags

#define FLAG_CalendarMoonA 2299
#define FLAG_CalendarMoonB 2300
#define FLAG_CalendarMoon0 5275
#define FLAG_CalendarMoon1 5726
#define FLAG_CalendarMoon2 5277
#define FLAG_CalendarMoon3 5278
#define FLAG_CalendarToDA 2301
#define FLAG_CalendarToDB 2302
#define FLAG_CalendarToDC 2303
#define FLAG_CalendarToDMorn 5279 
#define FLAG_CalendarToDMid 5280
#define FLAG_CalendarToDPM 5281
#define FLAG_CalendarToDEve 5282
#define FLAG_CalendarToDNight 5283
#define FLAG_CalendarToDNotNight 5284
#define FLAG_CalendarWeekdayA 2304
#define FLAG_CalendarWeekdayB 2305
#define FLAG_CalendarWeekdayC 2306
#define FLAG_CalendarWeekdayD 2307
#define FLAG_CalendarWeekdayE 2308
#define FLAG_CalendarWeekdayF 2309
#define FLAG_CalendarSeasonA 2310
#define FLAG_CalendarSeasonB 2314
#define FLAG_CalendarSeasonC 2312
#define FLAG_CalendarDayA 2313
#define FLAG_CalendarDayB 2314
#define FLAG_CalendarDayC 2315
#define FLAG_CalendarWeekA 2316
#define FLAG_CalendarWeekB 2317
#define FLAG_CalendarWeekC 2318
#define FLAG_WeatherRainA 2319
#define FLAG_WeatherRainB 2320
#define FLAG_WeatherRain0 5285
#define FLAG_WeatherRain1 5286
#define FLAG_TerrainA 2321
#define FLAG_TerrainB 2322
#define FLAG_TerrainC 2323
#define FLAG_TerrainD 2324

//Stat/Skill flags

#define FLAG_StatIntA 2325
#define FLAG_StatIntB 2326
#define FLAG_StatIntC 2327
#define FLAG_StatIntD 2328
#define FLAG_StatIntE 2329
#define FLAG_StatInt15 5287
#define FLAG_StatInt20 5288
#define FLAG_StatInt25 5289
#define FLAG_StatInt29 5290
#define FLAG_StatWilA 2330
#define FLAG_StatWilB 2331
#define FLAG_StatWilC 2332
#define FLAG_StatWilD 2333
#define FLAG_StatWilE 2334
#define FLAG_StatWil15 5291
#define FLAG_StatWil20 5292
#define FLAG_StatWil25 5293
#define FLAG_StatWil29 5294
#define FLAG_StatEndA 2335
#define FLAG_StatEndB 2336
#define FLAG_StatEndC 2337
#define FLAG_StatEndD 2338
#define FLAG_StatEndE 2339
#define FLAG_StatEnd15 5295
#define FLAG_StatEnd20 5296
#define FLAG_StatEnd25 5297
#define FLAG_StatEnd29 5298
#define FLAG_StatDexA 2340
#define FLAG_StatDexB 2341
#define FLAG_StatDexC 2342
#define FLAG_StatDexD 2343
#define FLAG_StatDexE 2344
#define FLAG_StatDex15 5299
#define FLAG_StatDex20 5300
#define FLAG_StatDex25 5301
#define FLAG_StatDex29 5302
#define FLAG_StatStrA 2345
#define FLAG_StatStrB 2346
#define FLAG_StatStrC 2347
#define FLAG_StatStrD 2348
#define FLAG_StatStrE 2349
#define FLAG_StatStr15 5303
#define FLAG_StatStr20 5304
#define FLAG_StatStr25 5305
#define FLAG_StatStr29 5306

#define FLAG_SkillMechA 2350
#define FLAG_SkillMechB 2351
#define FLAG_SkillMechC 2352
#define FLAG_SkillMechD 2353
#define FLAG_SkillMechE 2354
#define FLAG_SkillMech1 5307
#define FLAG_SkillMech2 5308
#define FLAG_SkillMech3 5309
#define FLAG_SkillMech4 5310
#define FLAG_SkillMech5 5311
#define FLAG_SkillMech6 5312
#define FLAG_SkillMech7 5313
#define FLAG_SkillMech8 5314
#define FLAG_SkillMech9 5315
#define FLAG_SkillMech10 5316

//possible array for Diplomat. Unused(?)

#define FLAG_SkillDiploA 2355
#define FLAG_SkillDiploB 2356
#define FLAG_SkillDiploC 2357
#define FLAG_SkillDiploD 2358
#define FLAG_SkillDiploE 2359
#define FLAG_SkillDiplo1 5317
#define FLAG_SkillDiplo2 5318
#define FLAG_SkillDiplo3 5319
#define FLAG_SkillDiplo4 5320
#define FLAG_SkillDiplo5 5321
#define FLAG_SkillDiplo6 5322
#define FLAG_SkillDiplo7 5323
#define FLAG_SkillDiplo8 5324
#define FLAG_SkillDiplo9 5325
#define FLAG_SkillDiplo10 5326

#define FLAG_SkillLoreA 2360
#define FLAG_SkillLoreB 2361
#define FLAG_SkillLoreC 2362
#define FLAG_SkillLoreD 2363
#define FLAG_SkillLoreE 2364
#define FLAG_SkillLore1 5327
#define FLAG_SkillLore2 5328
#define FLAG_SkillLore3 5329
#define FLAG_SkillLore4 5330
#define FLAG_SkillLore5 5331
#define FLAG_SkillLore6 5332
#define FLAG_SkillLore7 5333
#define FLAG_SkillLore8 5334
#define FLAG_SkillLore9 5335
#define FLAG_SkillLore10 5336
#define FLAG_SkillWizA 2365
#define FLAG_SkillWizB 2366
#define FLAG_SkillWizC 2367
#define FLAG_SkillWizD 2368
#define FLAG_SkillWizE 2369
#define FLAG_SkillWiz1 5337
#define FLAG_SkillWiz2 5338
#define FLAG_SkillWiz3 5339
#define FLAG_SkillWiz4 5340
#define FLAG_SkillWiz5 5341
#define FLAG_SkillWiz6 5342
#define FLAG_SkillWiz7 5343
#define FLAG_SkillWiz8 5344
#define FLAG_SkillWiz9 5345
#define FLAG_SkillWiz10 5346

//checked many times throughout objectJumpTables.cpp. return never used
#define FLAG_VoxelCheckUNK 5626

//Boss Death Flags

#define FLAG_KilledKitarak 154
#define FLAG_KilledShamsuk 458
#define FLAG_KilledLugash 533
#define FLAG_KilledPochanargat 3204
#define FLAG_KilledBehrooz 3733
#define FLAG_KilledNasim 3734
#define FLAG_KilledGolnar 3735
#define FLAG_KilledMehrdad 3736
#define FLAG_KilledShatrevar 3737
#define FLAG_KilledKsathra 3738
#define FLAG_KilledAssim 3739

//party join/death/leave flags

#define FLAG_PartyAbrecanJoin 89
#define FLAG_PartyAbrecanDeath 615
#define FLAG_PartyAbrecanLeave 685

#define FLAG_PartyArturoJoin 247
#define FLAG_PartyArturoDeath 614
#define FLAG_PartyArturoLeave 689

#define FLAG_PartyBairdJoin 380
#define FLAG_PartyBairdDeath 623
#define FLAG_PartyBairdLeave 690

#define FLAG_PartyBecanJoin 375
#define FLAG_PartyBecanDeath 618
#define FLAG_PartyBecanLeave 697

#define FLAG_PartyBrennaJoin 92
#define FLAG_PartyBrennaDeath 613
#define FLAG_PartyBrennaLeave 0 //ride or die?

#define FLAG_PartyDonovanJoin 382
#define FLAG_PartyDonovanDeath 620
#define FLAG_PartyDonovanLeave 691

#define FLAG_PartyFarrisJoin 455
#define FLAG_PartyFarrisDeath 450
#define FLAG_PartyFarrisLeave 456

#define FLAG_PartyGodricJoin 90
#define FLAG_PartyGodricDeath 616
#define FLAG_PartyGodricLeave 686

#define FLAG_PartyKeelinJoin 265
#define FLAG_PartyKeelinDeath 619
#define FLAG_PartyKeelinLeave 688

#define FLAG_PartyNiesenJoin 412
#define FLAG_PartyNiesenDeath 448
#define FLAG_PartyNiesenLeave 692

#define FLAG_PartyRhedaJoin 91
#define FLAG_PartyRhedaDeath 617
#define FLAG_PartyRhedaLeave 687

#define FLAG_PartySholehJoin 523
#define FLAG_PartySholehDeath 622
#define FLAG_PartySholehLeave 700

#define FLAG_PartyDougalJoin 574
#define FLAG_PartyDougalDeath 582
#define FLAG_PartyDougalLeave 695

#define FLAG_Gwernia2MembersNoBrenna 5004  //2 out of Godic, Rheda and Abrecan chosen. Triggers ambushes.

#define FLAG_ShadowMerge 566


#define FLAG_LearnedFirstSpell 3611
#define FLAG_GotFirstPotion 3612

#define FLAG_GoblinAmbush 978 //ID of goblin poisoner group at start of game.
#define FLAG_LugashFight 5250

#define FLAG_ErromonKitarakDead 5435

//event flags for entering areas or collecting their map.
#define FLAG_Map1 788 //Gwernia, set at start
#define FLAG_Map2 789 //part of Erromon Region, item found in barn in Gwernia
#define FLAG_Map4 790 //Erromon
#define FLAG_Map5 791 //Talewok
#define FLAG_Map6 792 //West of Talewok
#define FLAG_Map7 793 //Port Saiid
#define FLAG_Map8 794 //Chaos Isle
#define FLAG_Map9 795 //Namer's Isle
#define FLAG_Map10 796 //Terminor Region
#define FLAG_Map11 797 //East of Terminor
#define FLAG_Map12 798 //Darkling Hills
#define FLAG_Map13 799 //Eastern Beach (BUG: Triggered by Cradawgh's body instead. Map 13 does not.)
#define FLAG_Map14 800 //Desert North of Ugarit
#define FLAG_Map15 801 //Barrow
#define FLAG_Map16 802 //Ugarit
#define FLAG_MapGoblin 803 //East of Ugarit
#define FLAG_Map17 804 //Hellhound Cave
#define FLAG_Map18 805 //Between Hellhound Cave and Barrow

//Key Item collection flags

#define FLAG_HasTxominLetter 3403
#define FLAG_HasAmaranth 3404
#define FLAG_HasOrianaLetter 3405
#define FLAG_HasMap1 3406
#define FLAG_HasMap2 3407
#define FLAG_HasMap4 3408
#define FLAG_HasMap5 3409
#define FLAG_HasMap6 3410
#define FLAG_HasMap7 3411
#define FLAG_HasMap8 3412
#define FLAG_HasMap9 3413
#define FLAG_HasMap10 3414
#define FLAG_HasMap11 3415
#define FLAG_HasMap12 3416
#define FLAG_HasCradawghBody 3417
#define FLAG_HasMap13 3418
#define FLAG_HasMap14 3419
#define FLAG_HasMap15 3420
#define FLAG_HasMap16 3421
#define FLAG_HasMapGoblin 3422
#define FLAG_HasMap17 3423
#define FLAG_HasMap18 3424
#define FLAG_HasBowdenKey 3425
#define FLAG_HasBlackKey 3426
#define FLAG_HasSkullKey 3427
#define FLAG_HasBloodKey 3428
#define FLAG_HasBoneKey 3429
#define FLAG_HasLighthouseKey 3430
#define FLAG_HasLodinKey 3431
#define FLAG_HasDragonKey 3432
#define FLAG_HasRabisatAsp 405

#define FLAG_ChasIsleSwitch0 3269
#define FLAG_ChasIsleSwitch1 3270

#define FLAG_5011 5011 //Camping, flag 158 set, flag 156 unset (got Banner?)
#define FLAG_GotLighthouseKey 5016
#define FLAG_LighthouseLit2 286
#define FLAG_LighthouseLit 5017
#define FLAG_5019 5019 //Rheda in Party, spoke to Ardra
#define FLAG_5020 5020 //Keelin in Party, spoke to Ardra
#define FLAG_5021 5021 //Becan in Party, spoke to Ardra

#define FLAG_5024 5024 //Rheda in Party, not dead or left
#define FLAG_5025 5025 //Godric in Party, not dead or left

#define FLAG_5028 5028 //Found Amaranth before another flag set (#238)
#define FLAG_5034 5034 //first Cinematic flag not set

#define FLAG_5039 5039 //Not yet met Oriana
#define FLAG_5040 5040 //Not yet met Oriana
#define FLAG_5041 5041 //met Oriana
#define FLAG_NotPoisonedYet 5043 //not yet poisoned
#define FLAG_5056 5056 //Camping between being told to kill KItarak and doing it
#define FLAG_5071 5071 //doesn't know no True Name, had Crystal Vision.

#define FLAG_5079 5079 //Brenna and Keelin in Party, spoke to Amann, not on Chaos Isle
#define FLAG_NotYetJoinAsk 5112 //not yet asked to join
#define FLAG_5122 5122 //Baird and Donovan in party
#define FLAG_5128 5128 //Entered Bog with Rheda and Godric
#define FLAG_5129 5129 //Entered Bog with Becan and Abrecan
#define FLAG_5130 5130 //Entered Bog with Brenna
#define FLAG_5132 5132 //Entered Bog with Keelin, not reached tower
#define FLAG_5150 5150 //Godric & Becan in party, camping, killed shamsuk
#define FLAG_5151 5151 //Abrecan in party, camping, killed shamsuk
#define FLAG_5153 5153 //Brenna in party, killed shamsuk
#define FLAG_5154 5154 //Arturo in party, camping, killed shamsuk
#define FLAG_5155 5155 //Baird in party, camping, killed shamsuk
#define FLAG_5156 5156 //Becan in party, killed shamsuk
#define FLAG_5163 5163 //Baird in party, camping, flag 487 set
#define FLAG_5166 5166 //Not met Zaratas
#define FLAG_5168 5168 //met Zaratas, no horn
#define FLAG_5191 5191 //Dougal in party, camping, flag 575 unset
#define FLAG_5237 5237 //Spoke to Zaratas, Diplomat >=6 (via unused flag)
#define FLAG_5242 5242 //Cradawgh Dead. Yes, that's it.
#define FLAG_5267 5267 //Flag 71 unset
#define FLAG_5440 5440 //knows no True Name, Shadow called him "rehtorb", not merged
#define FLAG_5363 5363 //Oriana not visited by Necromancer
#define FLAG_5498 5498 //Both switches for skull gate in Chaos Isle Tower set


//LOG/MSK flags with no value or list - always true

#define FLAG_5038 5038 //always true(?) no other associated flags
#define FLAG_5072 5072 //always true(?) no other associated flags
#define FLAG_5075 5075 //always true(?) no other associated flags
#define FLAG_5076 5076 //always true(?) no other associated flags
#define FLAG_5081 5081 //always true(?) no other associated flags
#define FLAG_5089 5089 //always true(?) no other associated flags
#define FLAG_5097 5097 //always true(?) no other associated flags
#define FLAG_5098 5098 //always true(?) no other associated flags
#define FLAG_5105 5105 //always true(?) no other associated flags
#define FLAG_5115 5115 //always true(?) no other associated flags
#define FLAG_5116 5116 //always true(?) no other associated flags
#define FLAG_5117 5117 //always true(?) no other associated flags
#define FLAG_5118 5118 //always true(?) no other associated flags
#define FLAG_5119 5119 //always true(?) no other associated flags
#define FLAG_5120 5120 //always true(?) no other associated flags
#define FLAG_5167 5167 //always true(?) no other associated flags
#define FLAG_5173 5173 //always true(?) no other associated flags
#define FLAG_5348 5348 //always true(?) no other associated flags
#define FLAG_5350 5350 //always true(?) no other associated flags


#define FLAG_5254 5254 //always true(?) LOG/AND val 0


//cheat code flags

#define FLAG_Slashing 3673 //Hockey stick Cheat
#define FLAG_SlashingGet 3674 //Hockey stick Cheat, prevents multiple gets
#define FLAG_Darkside 3675 //Lightreaver Cheat
#define FLAG_DarksideGet 3676 //Lightreaver Cheat, prevents multiple gets
#define FLAG_Cheater 3693 //!cheater flag, prevents multiple gets
#define FLAG_Bingo 3694 //!bingo flag, prevents multiple gets