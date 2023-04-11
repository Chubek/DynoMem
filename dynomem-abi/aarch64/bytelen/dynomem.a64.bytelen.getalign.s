.section getalign
/*
    unsigned long dynomem_abi_*_getalign(unsigned long offset, unsigned long nbytes);
*/
Ldynomem_abi_getalign:
    dynomem_abi_08bitstruct_getalign:
        mov GETALIGN_NBYTES, #1

        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        add GETALIGN_NBYTES, GETALIGN_OFFSET
        mvn GETALIGN_RET, GETALIGN_NBYTES
        ands GETALIGN_RET, GETALIGN_NBYTES        

    dynomem_abi_16bitstruct_getalign:
        mov GETALIGN_NBYTES, #2

        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        add GETALIGN_NBYTES, GETALIGN_OFFSET
        mvn GETALIGN_RET, GETALIGN_NBYTES
        ands GETALIGN_RET, GETALIGN_NBYTES 

    dynomem_abi_32bitstruct_getalign:
        mov GETALIGN_NBYTES, #4

        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        add GETALIGN_NBYTES, GETALIGN_OFFSET
        mvn GETALIGN_RET, GETALIGN_NBYTES
        ands GETALIGN_RET, GETALIGN_NBYTES 

    dynomem_abi_64bitstruct_getalign:
        mov GETALIGN_NBYTES, #8

        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        add GETALIGN_NBYTES, GETALIGN_OFFSET
        mvn GETALIGN_RET, GETALIGN_NBYTES
        ands GETALIGN_RET, GETALIGN_NBYTES 

    dynomem_abi_nnbitstruct_getalign:
        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #1
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #2
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #4
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #8
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #16
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #32
        orr GETALIGN_NBYTES, GETALIGN_NBYTES, GETALIGN_NBYTES, shr #64
        add GETALIGN_NBYTES, GETALIGN_NBYTES, #1

        sub GETALIGN_NBYTES, GETALIGN_NBYTES, #1
        add GETALIGN_NBYTES, GETALIGN_OFFSET
        mvn GETALIGN_RET, GETALIGN_NBYTES
        ands GETALIGN_RET, GETALIGN_NBYTES


.section getalign_aliases
.ifdef Ldynomem_abi_getalign
    GETALIGN_OFFSET .req x0
    GETALIGN_NBYTES .req x1
    GETALIGN_RET  .req  x0
.endif