#ifndef _SHOWCASE_DYNOMEM_C
#define _SHOWCASE_DYNOMEM_C

#ifndef _INC_STDIO
#define _INC_STDIO
#include <stdio.h>
#endif

#ifndef _INC_DYNOMEM
#define _INC_DYNOMEM
#include "dynomem.h"
#endif


#ifdef STLEN
int main(int argc, char **argv) {
    usize len = 0;

    for (int i = 1; i < argc; i++) {
        len = dynostlen(argv[i]);
        printf("Length: %lu\n", len);
    }

    return 0;
}
#endif


#endif