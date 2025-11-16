#include "globals.h"
#include "debug.h"

#ifdef DEBUGVER
void debug_add_party_member(void) {new WidgetDebugParty;}

void FUN_8005eae4(BaseWidget *w) {
  if(w)w->~BaseWidget();
  freeWidgetFunc = NULL;
}

void WidgetDebugParty::AddEntName(u16 index) {
  WidgetText* entry = WTextSafe(gEntityDB->entities[index].Name);
  entry->varU16 = gEntityDB->entities[index].ID;
  this->scroll->Append(entry);
}

WidgetDebugParty::WidgetDebugParty():WidgetMenu() {
  this->scroll = Utilities::AddScrollMenu
                  (Utilities::DebugBackground(this,0x28,10,200,200,0,0,0,0xff),
                     (u16)gEntityDB->total,0x32,0x14,0x32,0x14,300,0xdc,0xe1,0xe1,0xe1,
                      0xe1,0);
  for(u32 i=0x97;i<0xa5;i++){AddEntName((u16)i);}
  WHANDLE->AddWidget(this);
  freeWidgetFunc = FUN_8005eae4;
}

WidgetDebugParty::~WidgetDebugParty(){
    WHANDLE->FreeWidget(this);
    WidgetMenu::~WidgetMenu();
}

BaseWidget* WidgetDebugParty::UpFunc(){
    this->scroll->UpFunc();
    return NULL;
}

BaseWidget* WidgetDebugParty::DownFunc(){
    this->scroll->DownFunc();
    return NULL;
}

BaseWidget* WidgetDebugParty::AFunc(){
    PARTY->AddMember(Utilities::GetHighlightedEntry(this->scroll)->varU16);
    return this;
}

BaseWidget* WidgetDebugParty::BFunc(){return this;}
#endif