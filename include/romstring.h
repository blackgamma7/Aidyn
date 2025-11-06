#include "romcopy.h"
#include "stringDecrypt.h"

namespace RomString{
char** Load(void *romAddr,size_t size);
void Free(char**);
}