struct{
	BaseWidget base;
	BaseWidget* extra;
}WidgetDebugBig;

extern s32 zone_engine_dat;
extern WidgetDebugBig* WidgetDebugBigPointer;
extern ulong func(void) * Debug_menu_funcs[21]; //lotta blank entries

extern void init_big_debug_menu(void);
extern u32 exec_big_debug_command(BaseWidget *);
extern WidgetDebugBig * build_debug_menu(WidgetDebugBig *);
extern void WidgetDebugBig_free(WidgetDebugBig *,u8);
extern void widgetDebugBig_AFunc(WidgetDebugBig *);
extern WidgetDebugBig * widgetDebugBig_BFunc(WidgetDebugBig *);
extern void make_debug_menu_entry(WidgetDebugBig *,s16);
extern void big_debug_func_array(BaseWidget *,BaseWidget *);
extern void debug_gamestatefunnel(void);
extern void debug_clear_inventory(void);
extern void toggle_enemies_hostile(void);
extern void toggle_only_tp_active(void);
extern void bad_ref_obj_hunt(void);
extern void load_credits_instead(void);
extern void debug_accessDB(void);
