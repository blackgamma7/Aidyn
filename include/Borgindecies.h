//a list of id'd indicies used internally for the "n64Borg" art assets
//Borg8: UI images

#define BORG8_CompassNorth 0X18
#define BORG8_CompassRing 0X1B
#define BORG8_MainFont 0x1D
//0x1e - 0xa1 are minimap sections.
#define BORG8_longDownArrow 0xd5
#define BORG8_Spacer 0xd7
#define BORG8_PauseMenuA 0xd8
#define BORG8_PauseMenuB 0xd9
#define BORG8_PauseMenuC 0xda
//0x106-0x181 are most the character portaits.
#define BORG8_EXPPakYes 0x3758
#define BORG8_EXPPakNo 0x3759
#define BORG8_ErrorRegion 0x37c3


//borg11: Sound samples

#define BORG11_PrecussionHitA 0x5A0
#define BORG11_PrecussionRhythmA 0x5A1
#define BORG11_PrecussionHitB 0x5A2
#define BORG11_DramaticStingA 0x5A3
#define BORG11_StringA 0x5A4
#define BORG11_TambouineA 0x5A6
#define BORG11_StringB 0x5A7
#define BORG11_HornA 0x5A8
#define BORG11_TriumphantChordA 0x5A9
#define BORG11_HornB 0x5AA
#define BORG11_PrecussionHitC 0x5AC
#define BORG11_PrecussionHitD 0x5AD
#define BORG11_PrecussionHitE 0x5AE
#define BORG11_PrecussionHitF 0x5AF
#define BORG11_PrecussionHitF 0x5B0
#define BORG11_DramaticStingB 0x5B1

#define BORG11_CymbalCrash 0x5B6

#define BORG11_DramaticStingC 0x5BB
#define BORG11_PrecussionRhythmB 0x61F
#define BORG11_ChoirA 0x625
#define BORG11_TriumphantChordB 0x631
#define BORG11_EchoSound 0x726

//borg12: Music/SFX
//battle tracks if using ExpPak

#define BORG12_Battle_Exp1 0x5a5
#define BORG12_Battle_Exp2 0x5aB
#define BORG12_Battle_Exp3 0x5b4
#define BORG12_Battle_Exp4 0x5b9
#define BORG12_Battle_Exp5 0x5C3
//Otherwise

#define BORG12_Battle_NoExp1 0x38de
#define BORG12_Battle_NoExp2 0x38df
#define BORG12_Battle_NoExp3 0x3b8
#define BORG12_Battle_NoExp4 0x3bd

//Cinematic music

#define BORG12_Cinematic0_1 0x601
#define BORG12_Cinematic0_2 0x608
#define BORG12_Cinematic0_3 0x60b
#define BORG12_Cinematic0_4 0x60c
#define BORG12_Cinematic0_5 0x60e
#define BORG12_Cinematic0_6 0x610
#define BORG12_Cinematic0_7 0x612
#define BORG12_Cinematic0_8 0x613
#define BORG12_Cinematic0_9 0x615
#define BORG12_Cinematic0_10 0x616
#define BORG12_Cinematic0_11 0x617
#define BORG12_Cinematic0_12 0x619
#define BORG12_Cinematic0_13 0x61a

#define BORG12_Cinematic1_1 0x61d
#define BORG12_Cinematic1_2 0x61e
#define BORG12_Cinematic1_3 0x621
#define BORG12_Cinematic1_4 0x622

#define BORG12_Cinematic2_1 0x5da
#define BORG12_Cinematic2_2 0x5db
#define BORG12_Cinematic2_3 0x5dc

#define BORG12_Cinematic3_1 0x5ed
#define BORG12_Cinematic3_2 0x5ee
#define BORG12_Cinematic3_3 0x5ef
#define BORG12_Cinematic3_4 0x5f0
#define BORG12_Cinematic3_5 0x5f1
#define BORG12_Cinematic3_6 0x5f2

#define BORG12_05ea_Exp 0x5ea
#define BORG12_05eb_NoExp 0x5eb
#define BORG12_Ehud 0x5df
#define BORG12_GwenCastle 0x5fd
#define BORG12_Ugairt 0x61b
#define BORG12_629 0x789
#define BORG12_789 0x789
#define BORG12_ErromonCaves 0x790
#define BORG12_Intro_NoExp 0x5d9 //aka Credits
#define BORG12_Intro_Exp 0x632


//SFX here

#define BORG12_ChimeScale 0x5e7
#define BORG12_CheatCorrect 0x718
#define BORG12_CheatUnused 0x720
#define BORG12_CheatFail 0x721
#define BORG12_CoinJingle 0x72d


//Borg5: Model data?
#define BORG5_ErromonMapChunk   0xef9
#define BORG5_CoronationScene1  0x1fe2
#define BORG5_CoronationScene2  0x2080
#define BORG5_CoronationScene3  0x21bf
#define BORG5_N64Logo           0x25a8


//Borg7: actor data
#define BORG7_ship              0xdc3
#define BORG7_Alaron            0x25f9
#define BORG7_Keelin            0x2b29
#define BORG7_Chicken           0x2ef2
#define BORG7_pocho             0x32b0
#define BORG7_Zombie            0x3489

//borg6: Animation data?
//used for the titlescreen flycam
#define BORG6_Flycam1           0x21dc
#define BORG6_Flycam2           0x21de
#define BORG6_Flycam3           0x21e2
#define BORG6_Flycam4           0x21e4
#define BORG6_Flycam5           0x21e6
#define BORG6_Flycam6           0x21e8

//cinematics

#define BORG6_Cinematic0_1      0x2219
#define BORG6_Cinematic0_2      0x226c
#define BORG6_Cinematic0_3      0x2292
#define BORG6_Cinematic0_4      0x2299
#define BORG6_Cinematic0_5      0x22a0
#define BORG6_Cinematic0_6      0x22d6
#define BORG6_Cinematic0_7      0x22ed
#define BORG6_Cinematic0_8      0x22fb
#define BORG6_Cinematic0_9      0x231c
#define BORG6_Cinematic0_10     0x2353
#define BORG6_Cinematic0_11     0x235c
#define BORG6_Cinematic0_12     0x2391
#define BORG6_Cinematic0_13     0x23bb

#define BORG6_Cinematic1_1      0x23f7
#define BORG6_Cinematic1_2      0x2413
#define BORG6_Cinematic1_3      0x238b
#define BORG6_Cinematic1_4      0x24ca

#define BORG6_Cinematic2_1      0x24ee
#define BORG6_Cinematic2_2      0x2569
#define BORG6_Cinematic2_3      0x25a2

#define BORG6_Cinematic3_1      0x1f36
#define BORG6_Cinematic3_2      0x1fe3
#define BORG6_Cinematic3_3      0x2081
#define BORG6_Cinematic3_4      0x2098
#define BORG6_Cinematic3_5      0x21c0
#define BORG6_Cinematic3_6      0x21d8

//Borg13: Dialouge
#define BORG13_GoblinAmbush     0x365
#define BORG13_AlaronDies1      0x512
#define BORG13_AlaronDies2      0x513
#define BORG13_AlaronDies3      0x514

#define BORG13_HelpMenu         0x54b

#define BORG13_CampSafe 0x185b