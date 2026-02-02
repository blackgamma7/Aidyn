#include "borg/borgHead.h"


enum B13_Commands{
    B13Com_SetEnt=3, //set dialougmode_substruct->EntId to (val)
    B13Com_CameraCutTo, //instantly move camera to reference point
    B13Com_CutToPOV,//instantly move camera to actor
    B13Com_CameraOn, //point camera to reference point
    B13Com_CameraOnPOV, //point camera to actor
    B13Com_CameraAngleTo, //move camera to focus on reference point
    B13Com_CameraAngleToPOV, //point camera to actor
    B13Com_CameraPanTo, //move camera to focus on reference point
    B13Com_CameraPanToPOV, //point camera to actor
    B13Com_CameraSineTo, //move camera to focus on reference point
    B13Com_CameraSineToPOV, //point camera to actor
    B13Com_CameraTrackOn,
    B13Com_15,
    B13Com_LoadMonster,
    B13Com_SetActorFacing, //actor moves to face ref obj
    B13Com_CreateActor, //creates actor
    B13Com_19,
    B13Com_SetCollideByte,
    B13Com_SetBattlefield,
    B13Com_setAniByte,
    B13Com_CheckMemberInParty, //is member (val) in party?
    B13Com_CheckEventFlag,  //is event flag (val) set?
    B13Com_CheckPartySkill, //get highest level of (val). if flag 3717 is set then it's randRange(0,21)
    B13Com_CheckForItem, //if the party has (val)
    B13Com_CheckBestStat,//get highest stat of (val) in party
    B13Com_CheckWorstStat,//get lowest stat of (val) in party
    B13Com_CheckMemberStat, //get dialougmode_substruct->Entid stat of (val)
    B13Com_CheckPartySize, //get size of current party
    B13Com_CheckPartyGoldU16, //get 16-bit value of party's Gold
    B13Com_SetFlag, //set Event flag (val)
    B13Com_UnsetFlag, //unset Event flag (val)
    B13Com_EndDialoug, //end dialouge
    B13Com_Fade35, //fade out
    B13Com_AddGold, //add ((u16)val) gold to party
    B13Com_TakeGold, //remove ((u16)val) gold from party
    B13Com_AddItem, //add item of ID (val) to party
    B13Com_TakeItem, //remove item of ID (val) to party. Crash if you don't have it.
    B13Com_ActorWalk, //dialougmode_substruct->Entid walks to ref obj (val)
    B13Com_ActorRun,//dialougmode_substruct->Entid runs to ref obj (val)
    B13Com_ApplyStimulus,
    B13Com_PlaySFX, //plays sfx dialoug_SFX[val]
    B13Com_Shop, // start the shopping menu
    B13Com_Battle, //start combat
    B13Com_Train, // start the training menu
    B13Com_AddMember, //add member if ItemID (val)
    B13Com_RemoveMember, //remove member if ItemID (val) without killing them
    B13Com_Unimplemented49, //unimplemented, triggers crash
    B13Com_RandDialog, //display a random dialoug from borg13(val)
    B13Com_ShowItem, //attach a model of itemID(val) on dialougmode_substruct->Entid
    B13Com_HideItem,//remove item model from dialougmode_substruct->Entid
    B13Com_53,
    B13Com_CampHeal,//fully heal party, lapse 8 hours
    B13Com_55,
    B13Com_AddExp,//add (val*1.5) exp points to dialougmode_substruct->Entid
    B13Com_57, //set some timer?
    B13Com_58,
    B13Com_59,
    B13Com_60,
};

struct Borg13Op{
    u16 val;
    u8 com; //uses B13_Commands
    u8 unk2; //align?
    u32 unk4; //unused?
};

struct borg13command {
    Borg13Op ops[4];
    s16 text_marker;
    u8 field32_0x22;
    u8 field33_0x23;
    u16 a;
    u16 b;
    u8 index;
    u8 c[8];
    u8 bitmask;
    u8 field46_0x32;
    u8 field47_0x33;
    u32 unk34;
};

struct Borg13Data {
    borg13command *commands_pointer;
    u16 (*actors)[4];
    char *text;
    u16 ID;
    u16 flag;
    u16 baseTextSize;
    u8 CmdCount;
    u8 ActorCount;
    u8 start_func;
    u8 libraryType;
    u8 pad[2];
};

struct Borg13Header{
    borgHeader head;
    u32* unk8;
    u32 unkc;
    Borg13Data* dat;
};

//n64borg/Dialog.cpp

u8 borg13_func_b(Borg13Header *,Borg13Data *);
void borg13_func_a(Borg13Data *);
void borg13_free(Borg13Header *);
Borg13Header * loadBorg13(u32);
void passto_borg13_free(Borg13Header *);