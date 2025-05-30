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

//journal flags

#define FLAG_MeetShadow 9
#define FLAG_JournalAmbush 50
#define FLAG_JournalPortal 62
#define FLAG_JournalBeginQuest 68
#define FLAG_JournalTrahernSword1 85
#define FLAG_JournalTrahernSword2 19
#define FLAG_JournalTrahernSword3 87
#define FLAG_JournalGwenCamp 58
#define FLAG_JournalOrianaNecro 101
#define FLAG_JournalEnteredErromon 122
#define FLAG_JournalMetBecan 375
#define FLAG_NewJournalEntry 3617
#define FLAG_JournalFlag 5556 //added to journal flags to trigger "new entry" flag

//Calendar flags

#define FLAG_CalendarMoonA 2299
#define FLAG_CalendarMoonB 2300
#define FLAG_CalendarToDA 2301
#define FLAG_CalendarToDB 2302
#define FLAG_CalendarToDC 2303
#define FLAG_CalendarWeekdayA 2304
#define FLAG_CalendarWeekdayB 2305
#define FLAG_CalendarWeekdayC 2306
#define FLAG_CalendarWeekdayD 2307
#define FLAG_CalendarWeekdayE 2308
#define FLAG_CalendarWeekdayF 2309
#define FLAG_CalendarMonthA 2310
#define FLAG_CalendarMonthB 2314
#define FLAG_CalendarMonthC 2312
#define FLAG_CalendarDayA 2313
#define FLAG_CalendarDayB 2314
#define FLAG_CalendarDayC 2315
#define FLAG_CalendarWeekA 2316
#define FLAG_CalendarWeekB 2317
#define FLAG_CalendarWeekC 2318
#define FLAG_WeatherRainA 2319
#define FLAG_WeatherRainB 2320
#define FLAG_TerrainA 2321
#define FLAG_TerrainB 2322
#define FLAG_TerrainC 2323
#define FLAG_TerrainD 2324

//checked many times throughout objectJumpTables.cpp. return never used
#define FLAG_VoxelCheckUNK 5626

//Boss Death Flags

#define FLAG_KilledKitarak 154
#define FLAG_KilledShamsuk 458
#define FLAG_KilledLugash 533
#define FLAG_KilledEhud 3204
#define FLAG_KilledBehrooz 3733
#define FLAG_KilledNasim 3734
#define FLAG_KilledGolnar 3735
#define FLAG_KilledMehrdad 3736
#define FLAG_KilledShatrevar 3737
#define FLAG_KilledKsathra 3738
#define FLAG_KilledAssim 3739

#define FLAG_JournalMetSholeh 523

#define FLAG_ShadowMerge 566
#define FLAG_JournalMetDougal 574
#define FLAG_JournalKilledDougal 582

#define FLAG_GoblinAmbush 978 //ID of goblin poisoner group at start of game.
#define FLAG_LugashFight 5250

//event flags for entering areas or collecting their map.
#define FLAG_Map1 788 //Gwernia, set at start
#define FLAG_Map2 789 //part of Erromon Region, item found in barn in Gwernia
#define FLAG_Map4 790 //Erromon
#define FLAG_Map5 791 //Talewok
#define FLAG_Map6 792 //West of Talewok
#define FLAG_Map7 793 //Port Saiid
#define FLAG_Map8 794 //Choas Isle
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


#define FLAG_LighthouseLit 5017


//cheat code flags

#define FLAG_Slashing 3673 //Hockey stick Cheat
#define FLAG_SlashingGet 3674 //Hockey stick Cheat, prevents multiple gets
#define FLAG_Darkside 3675 //Lightreaver Cheat
#define FLAG_DarksideGet 3676 //Lightreaver Cheat, prevents multiple gets
#define FLAG_Cheater 3693 //!cheater flag, prevents multiple gets
#define FLAG_Bingo 3694 //!bingo flag, prevents multiple gets