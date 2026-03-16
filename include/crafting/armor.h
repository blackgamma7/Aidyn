#include "widgets/WidgetCrafting.h"
#include "armordb.h"

struct ArmorCraftRecipie {
    u16 item; //Item Ram index
    u8 armor; //Armor ram index
    u8 stam; //Hp used
    u8 Mechanic; //Mechanic skill needed
    u8 pad; //alignment?
};

ArmorCraftRecipie ArmorRecipies[5]={
    {ItemInd_HideHellhound,ArmorInd_Hellhound,     7,5,0},
    {ItemInd_HideDarkenbat,ArmorInd_Darkenbat,     3,2,0},
    {ItemInd_HideBeast,    ArmorInd_BeastHide,     1,1,0},
    {ItemInd_HideChitlin,  ArmorInd_Scorpion,      5,4,0},
    {ItemInd_HideChitlin,  ArmorInd_ShieldScorpion,4,3,0}
};



void makeArmorMenu(u32 param_1);
bool CanMakeArmor(u32 param_1);
