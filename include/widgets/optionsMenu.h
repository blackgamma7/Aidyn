#include "widgets/Utilities.h"


struct WidgetOptionsSubstruct {
    WidgetScrollMenu *ScrollMenu;
    BaseWidget *theatreMenu;
    class WidgetOptionsConfig *optionsConfig;
    BaseWidget *unkc;
    BaseWidget *unk10;
    BaseWidget *unk14;
    u8 selected;
};

class WidgetOptionsMenu: public WidgetMenu{
    public:
    u8 alpha0;
    u8 alpha1;
    u16 unk7e;
    WidgetOptionsMenu();
    ~WidgetOptionsMenu();
    u32 InitMenu(u8);
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    u8 Tick();
    void MakeScrollList();
    void InitConfigMenu();
    void InitTheatreMenu();
    void ContPakLoad();
    void ContPakSave();
    u32 GetNumber();
};
BaseWidget* WidgetOptions_Left(BaseWidget*,BaseWidget*);
BaseWidget* WidgetOptions_Right(BaseWidget*,BaseWidget*);
BaseWidget* WidgetOptions_Up(BaseWidget*,BaseWidget*);
BaseWidget* WidgetOptions_Down(BaseWidget*,BaseWidget*);
BaseWidget* WidgetOptions_BButton(BaseWidget*,BaseWidget*);
BaseWidget* PauseMenuSelectCallback(BaseWidget*,BaseWidget*);
BaseWidget* WidgetOptions_StartButton(BaseWidget*,BaseWidget*);



struct OptionsConfigSubstruct{
BaseWidget* AudioTitle;
BaseWidget* GraphicsTitle;
BaseWidget* GameTitle;
BaseWidget* optionTitles[4];
BaseWidget* TitleImage;
u32 unk20;
BaseWidget* unk24;
Color32 col0;
Color32 col1;
u32 unk30;
};

class WidgetOptionsConfig : public WidgetMenu{
  public:
  BaseWidget* unk7c;
  BaseWidget* unk80;
  WidgetOptionsConfig(u8);
  ~WidgetOptionsConfig();
  void InitMenu(u8);
  Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
  u8 Tick();
  u32 GetNumber();
};

void selectResMode(u8);
void FUN_800499b8(BaseWidget*);
void Options_RenameMenu(BaseWidget*);
BaseWidget* options_func_Left(BaseWidget*,BaseWidget*);
BaseWidget* options_func_Right(BaseWidget*,BaseWidget*);
BaseWidget* options_func_Up(BaseWidget*,BaseWidget*);
BaseWidget* options_func_Down(BaseWidget*,BaseWidget*);
BaseWidget* options_func_BButton(BaseWidget*,BaseWidget*);
BaseWidget* options_func_AButton(BaseWidget*,BaseWidget*);
BaseWidget* options_func_StartButton(BaseWidget*,BaseWidget*);

