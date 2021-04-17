//standard string functions, posted for posterity.


char * strcpy(char *c1,char *c2){
  char *Y;
  char x;
  
  x = *c2;
  Y = c1;
  while (x != '\0') {
    c2++;
    *Y = x;
    x = *c2;
    Y++;
  }
  *Y = '\0';
  return c1;
}

char * strncpy(char *c1,char *c2,int i){
  char cx;
  char *cy;
  char *cz;
  int j;
  int k;
  
  j = 0;
  cx = *c2;
  cy = c1;
  if (cx != '\0') {
    cz = c2 + 1;
    if (i < 1) {
      return c1;
    }
    while( true ) {
      *cy = cx;
      cy++;
      cx = *cz;
      j++;
      if ((cx == '\0') || (i <= j)) break;
      cz++;
    }
  }
  k = i - j;
  if (j < i) {
    do {
      *cy = '\0';
      k--;
      cy++;
    } while (k != 0);
  }
  return c1;
}

//some of these are unused and I can't discen from code what they do.

char * Ofunc_80098a34(char *c1,char *c2){
  char x;
  char *y;
  
  if (*c1 == '\0') {
    x = *c2;
    y = c1;
  }
  else {
    y = c1 + 1;
    while (*y != '\0') {
      y++;
    }
    x = *c2;
  }
  if (x == '\0') {
    *y = '\0';
  }
  else {
    do {
      c2++;
      *y = x;
      x = *c2;
      y++;
    } while (x != '\0');
    *y = '\0';
  }
  return c1;
}

char * Ofunc_80098a80(char *c1,char *c2,int i){
  char x;
  char *y;
  int j;
  int k;
  
  if (*c1 == '\0') {
    x = *c2;
    y = c1;
  }
  else {
    y = c1 + 1;
    while (*y != '\0') {
      y++;
    }
    x = *c2;
  }
  j = 0;
  if (x != '\0') {
    c2++;
    if (i < 1) {
      return c1;
    }
    while( true ) {
      *y = x;
      y++;
      x = *c2;
      j++;
      if ((x == '\0') || (i <= j)) break;
      c2++;
    }
  }
  k = i - j;
  if (j < i) {
    do {
      *y = '\0';
      k--;
      y++;
    } while (k != 0);
  }
  return c1;
}

int strcmp(char *A,char *B){
  int y;
  byte z;
  byte x;
  
  y = 0;
  if (*A == '\0') {
loop:
    z = *B;
    if (z != 0) {
      return -1;
    }
    if (*A == 0) goto lab3;
  }
  else {
    z = *B;
    if (z != 0) {
      z = *B;
      while( true ) {
        B++;
        x = *A;
        A++;
        y =x - z;
        if (*A == 0) break;
        z = *B;
        if ((z == 0) || (y != 0)) goto lab2;
        z = *B;
      }
      goto loop;
    }
lab2:
    if (*A == 0) goto loop;
  }
  if (z == 0) {
    return 1;
  }
lab3:
  if (0 < y) {
    return 1;
  }
  if (y < 0) {
    return -1;
  }
  return y;
}

int strncmp(byte *c1,byte *c2,int i){
  byte j;
  int k;
  byte x;
  int y;
  
  k = 0;
  y = 0;
  if (*c1 == 0) {
lab1:
    x = *c2;
    if (x != 0) {
      return -1;
    }
    if (*c1 == 0) goto lab4;
  }
  else {
    x = *c2;
    if (x == 0) {
lab2:
      j = *c1;
    }
    else {
      if (0 < i) {
        x = *c2;
        while( true ) {
          c2++;
          j = *c1;
          c1++;
          y++;
          k = (uint)j - (uint)x;
          if (*c1 == 0) break;
          x = *c2;
          if (x == 0) goto lab2;
          if (i <= y) {
            j = *c1;
            goto lab3;
          }
          if (k != 0) goto lab2;
          x = *c2;
        }
        goto lab1;
      }
      j = *c1;
    }
lab3:
    if (j == 0) goto lab1;
  }
  if (x == 0) {
    return 1;
  }
lab4:
  if (0 < k) {
    return 1;
  }
  if (k < 0) {
    return -1;
  }
  return k;
}

int Ofunc_80098c4c(byte *c1,byte *c2){
  byte y;
  uint z;
  int i;
  byte x;
  
  x = *c1;
  i = 0;
  if (x == 0) {
LAB_80098cd4:
    y = *c2;
    if (y != 0) {
      return -1;
    }
    if (*c1 == 0) goto LAB_80098cf4;
  }
  else {
    y = *c2;
    if (y != 0) {
      do {
        y = x + 0x20;
        if (0x19 < x - 0x41) {
          y = *c1;
        }
        c1 = c1 + 1;
        if (*c2 - 0x41 < 0x1a) {
          z = *c2 + 0x20 & 0xff;
        }
        else {
          z = (uint)*c2;
        }
        c2 = c2 + 1;
        x = *c1;
        i = y - z;
        if (x == 0) goto LAB_80098cd4;
        y = *c2;
      } while ((y != 0) && (i == 0));
    }
    if (*c1 == 0) goto LAB_80098cd4;
  }
  if (y == 0) {
    return 1;
  }
LAB_80098cf4:
  if (0 < i) {
    return 1;
  }
  if (i < 0) {
    return -1;
  }
  return i;
}

int Ofunc_80098d18(byte *c1,byte *c2,int i){
  byte x;
  uint y;
  byte z;
  int a;
  int b;
  
  a = 0;
  z = *c1;
  b = 0;
  if (z == 0) {
LAB_80098dbc:
    x = *c2;
    if (x != 0) {
      return -1;
    }
    if (*c1 == 0) goto LAB_80098ddc;
  }
  else {
    x = *c2;
    if (x == 0) {
LAB_80098db0:
      z = *c1;
    }
    else {
      if (0 < i) {
        do {
          x = z + 0x20;
          if (0x19 < z - 0x41) {
            x = *c1;
          }
          c1 = c1 + 1;
          if (*c2 - 0x41 < 0x1a) {
            y = *c2 + 0x20 & 0xff;
          }
          else {
            y = (uint)*c2;
          }
          c2 = c2 + 1;
          a = x - y;
          z = *c1;
          b = b + 1;
          if (z == 0) goto LAB_80098dbc;
          x = *c2;
          if (x == 0) break;
          if (i <= b) {
            z = *c1;
            goto LAB_80098db4;
          }
        } while (a == 0);
        goto LAB_80098db0;
      }
      z = *c1;
    }
LAB_80098db4:
    if (z == 0) goto LAB_80098dbc;
  }
  if (x == 0) {
    return 1;
  }
LAB_80098ddc:
  if (0 < a) {
    return 1;
  }
  if (a < 0) {
    return -1;
  }
  return a;
}

void * memset(void *x,byte m,uint i){
  byte *z;
  int k;
  int j;
  
  j = i - (i & 7);
  k = 0;
  z = (byte *)x;
  if (0 < j) {
    do {
      *z = m;
      z[1] = m;
      z[2] = m;
      z[3] = m;
      z[4] = m;
      z[5] = m;
      z[6] = m;
      z[7] = m;
      k+=8;
      z+=8;
    } while (k < j);
  }
  j = i - k;
  if (k < (int)i) {
    do {
      *z = m;
      j--;
      z++;
    } while (j != 0);
  }
  return x;
}

byte * Ofunc_80098e84(byte *c1,byte *c2,uint i){
  byte *c_1;
  byte *c_2;
  byte *c_3;
  int j;
  int k;
  byte x;
  
  if ((int)c2 < (int)c1) {
    j = i - 1;
    c_1 = c1 + j;
    c_2 = c2 + j;
    while ((int)(i - (i & 7)) <= j) {
      x = *c_2;
      c_2 = c_2 + -1;
      j = j + -1;
      *c_1 = x;
      c_1 = c_1 + -1;
    }
    while (-1 < j) {
      j = j + -8;
      *c_1 = *c_2;
      c_1[-1] = c_2[-1];
      c_1[-2] = c_2[-2];
      c_1[-3] = c_2[-3];
      c_1[-4] = c_2[-4];
      c_1[-5] = c_2[-5];
      c_3 = c_2 + -7;
      c_1[-6] = c_2[-6];
      c_2 = c_2 + -8;
      c_1[-7] = *c_3;
      c_1 = c_1 + -8;
    }
  }
  else {
    k = i - (i & 7);
    j = 0;
    c_1 = c1;
    if (0 < k) {
      do {
        j = j + 8;
        *c_1 = *c2;
        c_1[1] = c2[1];
        c_1[2] = c2[2];
        c_1[3] = c2[3];
        c_1[4] = c2[4];
        c_1[5] = c2[5];
        c_2 = c2 + 7;
        c_1[6] = c2[6];
        c2 = c2 + 8;
        c_1[7] = *c_2;
        c_1 = c_1 + 8;
      } while (j < k);
    }
    k = i - j;
    if (j < (int)i) {
      do {
        x = *c2;
        c2 = c2 + 1;
        k = k + -1;
        *c_1 = x;
        c_1 = c_1 + 1;
      } while (k != 0);
      return c1;
    }
  }
  return c1;
}

int Ofunc_80099030(byte *c1,byte *c2,int i){
  int j=0;
  int k=0;
  byte x;
  byte y;
  
  if (0 < i) {
    x = *c2;
    while( true ) {
      c2++;
      y = *c1;
      c1++;
      k++;
      j = (uint)y - (uint)x;
      if ((i <= k) || (j != 0)) break;
      x = *c2;
    }
  }
  if (j < 1) {
    if (j < 0) {
      j = -1;
    }
  }
  else {
    j = 1;
  }
  return j;
}

byte * uppercase(byte *x){
  byte *j;
  byte i;
  
  if (*x != 0) {
    i = *x;
    j = x;
    while( true ) {
      if (i - 0x61 < 0x1a) {*j = i - 0x20;}
      j++;
      if (*j == 0) break;
      i = *j;
    }
  }
  return x;
}

byte * lowercase(byte *x){
  byte *j;
  byte i;
  
  if (*x != 0) {
    i = *x;
    j = x;
    while( true ) {
      if (i - 0x61 < 0x1a) {*j = i + 0x20;}
      j++;
      if (*j == 0) break;
      i = *j;
    }
  }
  return x;
}
