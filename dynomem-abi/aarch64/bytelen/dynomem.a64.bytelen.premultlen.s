.section premultlen
/*  
    unsigned long dynomem_abi_*_premultlen(unsigned long nitems, unsigned long nbytes)''
*/
Ldynomem_abi_premultlen:
    dynomem_abi_08bitstruct_premultlen:
        lsl PREMULTLEN_RET, PREMULTLEN_NITEMS, #3

    dynomem_abi_16bitstruct_premultlen:
        lsl PREMULTLEN_RET, PREMULTLEN_NITEMS, #4

    dynomem_abi_32bitstruct_premultlen:
        lsl PREMULTLEN_RET, PREMULTLEN_NITEMS, #5

        dynomem_abi_64bitstruct_premultlen:
        lsl PREMULTLEN_RET, PREMULTLEN_NITEMS, #6

    dynomem_abi_nnbitstruct_premultlen:
        sub PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, #1
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #1
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #2
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #4
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #8
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #16
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #32
        orr PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, shr #64
        add PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, #1

        clz PREMULTLEN_NBYTES, PREMULTLEN_NBYTES
        add PREMULTLEN_NBYTES, PREMULTLEN_NBYTES, #2

        lsl PREMULTLEN_RET, PREMULTLEN_NITEMS, PREMULTLEN_NBYTES


.section premultlen_aliases
.ifdef Ldynomem_abi_premultlen
    PREMULTLEN_NITEMS .req x0
    PREMULTLEN_NBYTES .req x1
    PREMULTLEN_RET  .req  x0
.endif