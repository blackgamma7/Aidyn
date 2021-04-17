extern byte Stringkey[16];
/*{5fh, 35h, 3ah, 2ch, 2ah, 2ch, 5fh, 36h, 2ch, 5fh, 33h, 30h, 2dh, 3bh, 5eh, 7fh}*/
extern byte decrypt_sub_a(char,char);
extern byte decrypt_sub_b(char,char);
extern void decrypt_func_a(byte*,char,char);
extern void decrypt_ofunc_2(byte*,int,int);
extern void decrypt_func_b(byte*,byte*,int);
extern byte * Ofunc_decrypt(byte *,byte,char,short);
extern char * decrypt_string(char *,byte,ushort,short);