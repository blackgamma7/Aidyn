#include "widgets/WidgetChoiceDia.h"
#include "combat/substructB.h"
#include "PlayerData.h"

//Combat/control.cpp

u8 combat_controls();
void FUN_8008d2cc();
void cancel_combat_action();
bool LZBStart_to_cancel_Turn(controller_aidyn *cont);
bool combat_control_press_start(controller_aidyn *cont);
bool FUN_8008d4d0(controller_aidyn *cont);
void FUN_8008d530();
void FUN_8008d56c();
void FUN_8008d5f8();
void FUN_8008d718();
void FUN_8008d824();
void combat_control_case_9(controller_aidyn *cont);
void FUN_8008d9d4(CombatSubstructB *param_1,CombatEntity *param_2);
void FUN_8008dac0(u32 button,CombatSubstructB *param_2,CombatEntity* param_3);
void combat_control_case_0xa(controller_aidyn *cont);
bool adjust_camera_joystick(controller_aidyn *cont,vec2f *param_2);
bool FUN_8008dcfc(controller_aidyn *cont,u16 param_2);
void combat_control_case_0xb(controller_aidyn *cont,s8 param_2);
void FUN_8008e0c4(CombatSubstructB *param_1);
void combat_control_case_0x12(controller_aidyn *cont,u8 param_2);
void movement_checking_shadow(CombatEntity *param_1,playerData *param_2);
bool combat_control_case_1(controller_aidyn *cont);
void combat_control_case_5(controller_aidyn *cont);
void combat_control_case_6(controller_aidyn *cont,u8 x);
bool RZBA_end_combat(controller_aidyn *cont);
void combat_control_case_0x19(controller_aidyn *cont);
bool combat_controls_caseSwitch(controller_aidyn *cont,u8 param_2);

//Combat/CVertMenus.cpp

void init_combatSkill_itemValues();
void NOOP_80091404();
bool can_Combat_C_vert(controller_aidyn *cont);
void combat_control_case_0x16(controller_aidyn *cont);
void combat_control_case_0x17(controller_aidyn *cont);
Gfx * Combat_RenderCVertMenu(Gfx *G,u16 delta);
bool combat_C_Up_Down(controller_aidyn *cont);
void Combat_menu_C_Up();
void combat_menu_C_down();
void Combat_CloseCVertMenu();
bool hasUsablePotions(s32 *param_1);
bool gear_has_spell(s32 *wep,s32 *armor,s32 *shield,u8 *gear);
bool can_perform_or_heal(s32 *troub,s32 *hands,s32 *herb);
u8 can_use_spell(u8 *param_1);
bool equip_has_spell(ItemInstance *param_1);
bool FUN_80091dfc(WidgetHandler *handle,BaseWidget *wTarget);