#include "typedefs.h"

struct ArmorCraftRecipie {
    u16 item; //Item Ram index
    u8 armor; //Armor ram index
    u8 stam; //Hp used
    u8 Mechanic; //Mechanic skill needed
    u8 pad; //alignment?
};

ArmorCraftRecipie ArmorRecipies[5]={
    {33,28,7,5,0}, //hellhound armor
    {34,27,3,2,0}, //Darkenbat Armor
    {35,29,1,1,0}, //Beast Hide Armor
    {36,30,5,4,0}, //Scorpion Scale Armor
    {36,56,4,3,0}  //Scorpion Scale Shield
};
