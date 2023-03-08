extern u8 Stringkey[16];
/*{5fh, 35h, 3ah, 2ch, 2ah, 2ch, 5fh, 36h, 2ch, 5fh, 33h, 30h, 2dh, 3bh, 5eh, 7fh}*/
extern u8 decrypt_sub_a(char,char);
extern u8 decrypt_sub_b(char,char);
extern void decrypt_func_a(u8*,char,char);
extern void decrypt_ofunc_2(u8*,s32,STAT_INT);
extern void decrypt_func_b(u8*,u8*,STAT_INT);
extern u8 * Ofunc_decrypt(u8 *,u8,char,s16);
extern char * decrypt_string(char *,u8,u16,s16);