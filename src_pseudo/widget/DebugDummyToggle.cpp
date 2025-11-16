#include "widgets/DebugDummyToggle.h"
#include "widgets/Utilities.h"

#include "globals.h"

#ifdef DEBUGVER
void debug_placebo_toggle(void) {
  PTR_800e61e4 = new WidgetDebugDummyToggle();
  WHANDLE->AddWidget(PTR_800e61e4);
  freeWidgetFunc = change_some_debug_settings;
}


void change_some_debug_settings(BaseWidget *w) {
  if (w == PTR_800e61e4) {
    freeWidgetFunc = NULL;
    WHANDLE->FreeWidget(w);
    if (PTR_800e61e4)
      PTR_800e61e4->~WidgetDebugDummyToggle();
    PTR_800e61e4 = NULL;
  }
  else {
    unused_bitfeild = unused_bitfeild ^ 1 << (w->varU16 & 0x1f);
  }
}

extern BaseWidget *FUN_8004ce14(BaseWidget *,short,short,short,u16,u8 r,u8 g,u8 b,u8 a);
extern char** debug_switch_labels;
WidgetDebugDummyToggle::WidgetDebugDummyToggle():WidgetMenu(){
    FUN_8004ce14(this,FULL_SCREENSPACE,0,0,0,200);
    scrollMenu = Utilities::AddScrollMenu(this,0xd,0x14,0x14,0x14,0x14,SCREEN_WIDTH,SCREEN_HEIGHT,0xe1,0xe1,0xe1,0xff,0);
    for(u8 i=0;i<13;i++) {
      Gsprintf("%s - %s",debug_switch_labels[i],
                  On_or_off_strings[(unused_bitfeild & 1 << (i & 0x1f)) == 0]);
      WidgetText* entry = new WidgetText(gGlobals.text,30);
      entry->varU16 = i;
      scrollMenu->Append(entry);
    }
}
WidgetDebugDummyToggle::~WidgetDebugDummyToggle(){WidgetMenu::~WidgetMenu();}

BaseWidget * WidgetDebugDummyToggle::AFunc(){
    return Utilities::GetHighlightedEntry(scrollMenu);
}

BaseWidget * WidgetDebugDummyToggle::BFunc(){
    return this;
}
BaseWidget * WidgetDebugDummyToggle::UpFunc(){
    scrollMenu->UpFunc();
    return NULL;
}
BaseWidget * WidgetDebugDummyToggle::DownFunc(){
    scrollMenu->DownFunc();
    return NULL;
}

u8 WidgetDebugDummyToggle::Tick(){
  WSMSub *sub = (WSMSub*)scrollMenu->substruct;
  for (u8 i=0;i<13;i++) {
    sprintf(Utilities::GetWidgetText(sub->items[i]),"%s - %s",debug_switch_labels[i],
                On_or_off_strings[(unused_bitfeild & 1 << (i & 0x1f)) == 0]);}
  return WidgetMenu::Tick();
}
#endif