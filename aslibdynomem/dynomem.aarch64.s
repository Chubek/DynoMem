.data
    // Pead, Exec, Write SYSCARG_PROT
    .equ PROT_RXW, 7            
    // SYSCARG_Flags for memmap
    .equ MAP_FLAGS, 22
    // Null file descriptor for any block random-access memory device
    .equ FD_RAM, -1
    // SYSCARG_OFFSET for memmap
    .equ OFFSET, 0
    // munmap sys call code
    .equ SYS_munmap, 215
    // memremap sys call code
    .equ SYS_mremap, 216
    // memmap sys call code
    .equ SYS_mmap, 222 
    
    #define SYSCREG x8

    // dynomem_abisubr_byte*_stalloc args
    #define STALLOC_LEN x0
    #define RESULT_STALLOC_ADDR x0

    // dynomem_abisubr_byte*_alloc args
    #define SYSCARG_ADDR x0
    #define SYSCARG_LEN x1
    #define SYSCARG_PROT x2
    #define SYSCARG_FLAGS x3
    #define SYSCARG_FILEDESC x4
    #define SYSCARG_OFFSET x5

    // dynomem_abisubr_byte*_dyrealloc args
    #define SYSCARG_OLDADDR x0
    #define SYSCARG_OLDSIZE x1
    #define SYSCARG_NEWSIZE x2
    #define BYTENUM_REALLOC x3
    #define SYSCARG_FLAGS_REMAP x3
    #define SYSCARG_NEWADDR_REMAP x4

    // dynomem_abisubr_byte*_udynalloc args
    #define SYSCARG_ADDR_UNALLOC x0
    #define SYSCARG_LEN_UNALLOC x1

    // dynomem_abisubr_byte*_cpy args
    #define ADDR_SRC x0
    #define ADDR_DST x1
    #define CPYLEN x2
    #define ADDR_OFFSET_CPY x3
    #define CPY_RESULT x0

    // dynomem_abisubr_byte_cpyset args
    #define ADDR_A1_STCPY x0
    #define ADDR_A2_STCPY x1
    #define CPYLEN_STCPY x3
    #define STCPY_OFFSET x4
    #define RESULT_STCPY x0

    // dynomem_abisubr_byte*_valueset args
    #define ADDR_SETCONST x0
    #define SETCONST_VAL x1
    #define SETCONST_LEN x2
    #define ADDR_OFFSET_SETCONST x3
    #define CONSTSET_RESULT x0

    // dynomem_abisubr_byte*_rangeset args
    #define ADDR_SETRANGE x0
    #define SETRANGE_START_VAL x1
    #define SETRANGE_END_VAL x2
    #define ADDR_OFFSET_SETRANGE x3
    #define RANGESET_RESULT x0

    // dynomem_abisubr_byte*_sumup args
    #define ADDR_SUM x0
    #define SUM_LEN x1
    #define ADDR_OFFSET_SUM x2
    #define SUM_RESULT x0

    // dynomem_abisubr_byte*_dotp args
    #define ADDR_A1_DOTP x0
    #define ADDR_A2_DOTP x1
    #define DOTP_LEN x2
    #define OFFSET_DOTP x3
    #define DOTP_RESULT x0

    // dynomem_abisubr_byte*_matmul args
    #define ADDR_A1_MMUL x0
    #define ADDR_A2_MMUL x1
    #define CHUNK_NUM_MMUL x2
    #define MMUL_LEN x3
    #define OFFSET_MMUL x4
    #define MATMUL_RESULT x0

    /* <---dynomem_abisubr_byte*_arrlen*stp data */
    // address to the beginning of the contiguous memory block
    #define ADDR_ARRLEN x0
    // offset of that address, to be multiplied by number of bytes before adding to the address
    #define OFFSET_ARRLEN x1
    // number of bytes for n-bytes subroutine
    #define NBYTES_LEN x2
    // result, the length of the null-terminated byt/half-word/word/double-word/quad-word array
    #define ARRLEN_RESULT x0    
    // temporary address for holding incremented pointer
    #define TMPADDR_ARRLEN x8
    // grabbed data from memory --- word
    #define ELEM1W w9 // 1stp, 2stp, 4stp, 8stp word
    #define ELEM2W w10 // 2stp, 4stp, 8stp word
    #define ELEM3W w11 // 4stp, 8stp word
    #define ELEM4W w12 // 4stp, 8stp word
    #define ELEM5W w13 // 8stp word
    #define ELEM6W w14 // 8stp word 
    #define ELEM7W w15 // 8stp word 
    #define ELEM8W w16 // 8stp word    
    // grabbed data from memory --- dword
    #define ELEM1X x9 // 1stp, 2stp, 4stp, 8stp dword
    #define ELEM2X x10 // 2stp, 4stp, 8stp dword
    #define ELEM3X x11 // 4stp, 8stp dword
    #define ELEM4X x12 // 4stp, 8stp dword
    #define ELEM5X x13 // 8stp dword
    #define ELEM6X x14 // 8stp dword 
    #define ELEM7X x15 // 8stp dword 
    #define ELEM8X x16 // 8stp dword
    // index holder for 128bit
    #define NBYTES_INDEX x17
    /* dynomem_abisubr_byte*_arrlen*stp data---> */


    // dynomem_abisubr_byte*_compare
    #define ADDR_A1_CMP x0
    #define ADDR_A2_CMP x1
    #define CMP_LEN x2
    #define OFFSET_CMP x3
    #define CMP_RESULT x0

    // dynomem_abisubr_byte*_checkfree
    #define ADDR_CHFREE x0
    #define CHFREE_LEN x1
    #define OFFSET_CHFREE x2
    #define CHFREE_RESULT x0

    // dynomem_abisubr_getlen args
    #define ROUNDUP_P2 x0

    /*      Declarations    */

    /*  <---mmap-io subroutines    */

    /*   stalloc for freeing up space on user-space stack   */
    // subroutines for stalloc
    .global dynomem_abisubr_byte_stalloc 
    .global dynomem_abisubr_hword_stalloc
    .global dynomem_abisubr_word_stalloc
    .global dynomem_abisubr_qword_stalloc
    .global dynomem_abisubr_nbyte_stalloc
    // macros for stalloc
    #define STA_LEN x0
    #define STA_NBYTES x1
    #define STA_RET_ADDR x0

    /*   dyalloc for dynamically allocating memory dynamically   */
    // subroutines for dyalloc   
    .global dynomem_abisubr_byte_dyalloc
    .global dynomem_abisubr_hword_dyalloc
    .global dynomem_abisubr_word_dyalloc
    .global dynomem_abisubr_qword_dyalloc
    .global dynomem_abisubr_nbyte_dyalloc
    // macros for dyalloc
    #define SYSCARG_ADDR x0
    #define SYSCARG_LEN x1
    #define SYSCARG_PROT x2
    #define SYSCARG_FLAGS x3
    #define SYSCARG_FILEDESC x4
    #define SYSCARG_OFFSET x5
    #define DYALLOC_RET x0

    /*   dyalloc for dynamically allocating memory dynamically   */
    // subroutines for dyalloc   
    .global dynomem_abisubr_byte_dyrealloc
    .global dynomem_abisubr_hword_dyrealloc
    .global dynomem_abisubr_word_dyrealloc
    .global dynomem_abisubr_qword_dyrealloc
    .global dynomem_abisubr_nbyte_dyrealloc
    
    .global dynomem_abisubr_byte_udynalloc
    .global dynomem_abisubr_hword_udynalloc
    .global dynomem_abisubr_word_udynalloc
    .global dynomem_abisubr_qword_udynalloc
    .global dynomem_abisubr_nbyte_udynalloc

    /*   linkmem for sharing memory for IPC using POSIX calls   */
    // subroutines for linkmem
    .global dynomem_abisubr_linkmem
     // macros for linkmem
    #define SYSCARG_NAME_LINK x0
    #define SYSCARG_OFLAG x1
    #define SYSCARG_MODE x2
    #define LINKMEM_RET x0


    /*   unlinkmem for unlinking shared memory linked by `linkmem`   */
    // subroutines for unlinkmem
    .global dynomem_abisubr_unlinkmem
    // macros for unlinkmem
    #define SYSCARG_NAME_UNLINK x0
    #define UNLINKMEM_RET x0

    .global dynomem_abisubr_byte_cpy
    .global dynomem_abisubr_hword_cpy
    .global dynomem_abisubr_word_cpy
    .global dynomem_abisubr_qword_cpy
    .global dynomem_abisubr_nbyte_cpy

    .global dynomem_abisubr_byte_cpyset
    .global dynomem_abisubr_hword_cpyset
    .global dynomem_abisubr_word_cpyset
    .global dynomem_abisubr_qword_cpyset
    .global dynomem_abisubr_nbyte_cpyset

    .global dynomem_abisubr_byte_valueset
    .global dynomem_abisubr_hword_valueset
    .global dynomem_abisubr_word_valueset
    .global dynomem_abisubr_qword_valueset
    .global dynomem_abisubr_nbyte_valueset
    
    .global dynomem_abisubr_byte_rangeset
    .global dynomem_abisubr_hword_rangeset
    .global dynomem_abisubr_word_rangeset
    .global dynomem_abisubr_qword_rangeset
    .global dynomem_abisubr_nbyte_rangeset

    .global dynomem_abisubr_byte_sumup1stp
    .global dynomem_abisubr_hword_sumup1stp
    .global dynomem_abisubr_word_sumup1stp
    .global dynomem_abisubr_qword_sumup1stp
    .global dynomem_abisubr_nbyte_sumup1stp

    .global dynomem_abisubr_byte_sumup2stp
    .global dynomem_abisubr_hword_sumup2stp
    .global dynomem_abisubr_word_sumup2stp
    .global dynomem_abisubr_qword_sumup2stp
    .global dynomem_abisubr_nbyte_sumup2stp

    .global dynomem_abisubr_byte_sumup4stp
    .global dynomem_abisubr_hword_sumup4stp
    .global dynomem_abisubr_word_sumup4stp
    .global dynomem_abisubr_qword_sumup4stp
    .global dynomem_abisubr_nbyte_sumup4stp

    .global dynomem_abisubr_byte_sumup8stp
    .global dynomem_abisubr_hword_sumup8stp
    .global dynomem_abisubr_word_sumup8stp
    .global dynomem_abisubr_qword_sumup8stp
    .global dynomem_abisubr_nbyte_sumup8stp

    .global dynomem_abisubr_byte_dotp1stp
    .global dynomem_abisubr_hword_dotp1stp
    .global dynomem_abisubr_word_dotp1stp
    .global dynomem_abisubr_qword_dotp1stp
    .global dynomem_abisubr_nbyte_dotp1stp

    .global dynomem_abisubr_byte_dotp2stp
    .global dynomem_abisubr_hword_dotp2stp
    .global dynomem_abisubr_word_dotp2stp
    .global dynomem_abisubr_qword_dotp2stp
    .global dynomem_abisubr_nbyte_dotp2stp

    .global dynomem_abisubr_byte_dotp4stp
    .global dynomem_abisubr_hword_dotp4stp
    .global dynomem_abisubr_word_dotp4stp
    .global dynomem_abisubr_qword_dotp4stp
    .global dynomem_abisubr_nbyte_dotp4stp

    .global dynomem_abisubr_byte_dotp8stp
    .global dynomem_abisubr_hword_dotp8stp
    .global dynomem_abisubr_word_dotp8stp
    .global dynomem_abisubr_qword_dotp8stp
    .global dynomem_abisubr_nbyte_dotp8stp

    .global dynomem_abisubr_byte_l1norm1stp
    .global dynomem_abisubr_hword_l1norm1stp
    .global dynomem_abisubr_word_l1norm1stp
    .global dynomem_abisubr_qword_l1norm1stp
    .global dynomem_abisubr_nbyte_l1norm1stp

    .global dynomem_abisubr_byte_l1norm2stp
    .global dynomem_abisubr_hword_l1norm2stp
    .global dynomem_abisubr_word_l1norm2stp
    .global dynomem_abisubr_qword_l1norm2stp
    .global dynomem_abisubr_nbyte_l1norm2stp

    .global dynomem_abisubr_byte_l1norm4stp
    .global dynomem_abisubr_hword_l1norm4stp
    .global dynomem_abisubr_word_l1norm4stp
    .global dynomem_abisubr_qword_l1norm4stp
    .global dynomem_abisubr_nbyte_l1norm4stp

    .global dynomem_abisubr_byte_l1norm8stp
    .global dynomem_abisubr_hword_l1norm8stp
    .global dynomem_abisubr_word_l1norm8stp
    .global dynomem_abisubr_qword_l1norm8stp
    .global dynomem_abisubr_nbyte_l1norm8stp

    .global dynomem_abisubr_byte_l3norm1stp
    .global dynomem_abisubr_hword_l3norm1stp
    .global dynomem_abisubr_word_l3norm1stp
    .global dynomem_abisubr_qword_l3norm1stp
    .global dynomem_abisubr_nbyte_l3norm1stp

    .global dynomem_abisubr_byte_l3norm2stp
    .global dynomem_abisubr_hword_l3norm2stp
    .global dynomem_abisubr_word_l3norm2stp
    .global dynomem_abisubr_qword_l3norm2stp
    .global dynomem_abisubr_nbyte_l3norm2stp

    .global dynomem_abisubr_byte_l3norm4stp
    .global dynomem_abisubr_hword_l3norm4stp
    .global dynomem_abisubr_word_l3norm4stp
    .global dynomem_abisubr_qword_l3norm4stp
    .global dynomem_abisubr_nbyte_l3norm4stp

    .global dynomem_abisubr_byte_l3norm8stp
    .global dynomem_abisubr_hword_l3norm8stp
    .global dynomem_abisubr_word_l3norm8stp
    .global dynomem_abisubr_qword_l3norm8stp
    .global dynomem_abisubr_nbyte_l3norm8stp

    .global dynomem_abisubr_byte_matmul
    .global dynomem_abisubr_hword_matmul
    .global dynomem_abisubr_word_matmul
    .global dynomem_abisubr_qword_matmul
    .global dynomem_abisubr_nbyte_matmul

    .global dynomem_abisubr_byte_arrlen1stp
    .global dynomem_abisubr_hword_arrlen1stp
    .global dynomem_abisubr_word_arrlen1stp
    .global dynomem_abisubr_qword_arrlen1stp
    .global dynomem_abisubr_nbyte_arrlen1stp

    .global dynomem_abisubr_byte_arrlen2stp
    .global dynomem_abisubr_hword_arrlen2stp
    .global dynomem_abisubr_word_arrlen2stp
    .global dynomem_abisubr_qword_arrlen2stp
    .global dynomem_abisubr_nbyte_arrlen2stp

    .global dynomem_abisubr_byte_arrlen4stp
    .global dynomem_abisubr_hword_arrlen4stp
    .global dynomem_abisubr_word_arrlen4stp
    .global dynomem_abisubr_qword_arrlen4stp
    .global dynomem_abisubr_nbyte_arrlen4stp

    .global dynomem_abisubr_byte_arrlen8stp
    .global dynomem_abisubr_hword_arrlen8stp
    .global dynomem_abisubr_word_arrlen8stp
    .global dynomem_abisubr_qword_arrlen8stp
    .global dynomem_abisubr_nbyte_arrlen8stp

    .global dynomem_abisubr_byte_compare1stp
    .global dynomem_abisubr_hword_compare1stp
    .global dynomem_abisubr_word_compare1stp
    .global dynomem_abisubr_qword_compare1stp
    .global dynomem_abisubr_nbyte_compare1stp

    .global dynomem_abisubr_byte_compare2stp
    .global dynomem_abisubr_hword_compare2stp
    .global dynomem_abisubr_word_compare2stp
    .global dynomem_abisubr_qword_compare2stp
    .global dynomem_abisubr_nbyte_compare2stp

    .global dynomem_abisubr_byte_compare4stp
    .global dynomem_abisubr_hword_compare4stp
    .global dynomem_abisubr_word_compare4stp
    .global dynomem_abisubr_qword_compare4stp
    .global dynomem_abisubr_nbyte_compare4stp

    .global dynomem_abisubr_byte_compare8stp
    .global dynomem_abisubr_hword_compare8stp
    .global dynomem_abisubr_word_compare8stp
    .global dynomem_abisubr_qword_compare8stp
    .global dynomem_abisubr_nbyte_compare8stp

    .global dynomem_abisubr_byte_checkfree1stp
    .global dynomem_abisubr_hword_checkfree1stp
    .global dynomem_abisubr_word_checkfree1stp
    .global dynomem_abisubr_qword_checkfree1stp
    .global dynomem_abisubr_nbyte_checkfree1stp

    .global dynomem_abisubr_byte_checkfree2stp
    .global dynomem_abisubr_hword_checkfree2stp
    .global dynomem_abisubr_word_checkfree2stp
    .global dynomem_abisubr_qword_checkfree2stp
    .global dynomem_abisubr_nbyte_checkfree2stp

    .global dynomem_abisubr_byte_checkfree4stp
    .global dynomem_abisubr_hword_checkfree4stp
    .global dynomem_abisubr_word_checkfree4stp
    .global dynomem_abisubr_qword_checkfree4stp
    .global dynomem_abisubr_nbyte_checkfree4stp

    .global dynomem_abisubr_byte_checkfree8stp
    .global dynomem_abisubr_hword_checkfree8stp
    .global dynomem_abisubr_word_checkfree8stp
    .global dynomem_abisubr_qword_checkfree8stp
    .global dynomem_abisubr_nbyte_checkfree8stp

    /*  <---utility subroutines  */

    // passed `nbyte` is rounded up to the nearest power of 2.

    /*  getlen calculates the length of an array in bytes */
    // subroutines for getlen
    .global dynomem_abisubr_byte_getlen
    .global dynomem_abisubr_hword_getlen
    .global dynomem_abisubr_word_getlen
    .global dynomem_abisubr_dword_getlen
    .global dynomem_abisubr_nbyte_getlen
    // macros for getlen
    #define GETLEN_NITEMS x0
    #define GETLEN_NBYTES x1
    #define GETLEN_RET    x0

    /*  getalign calculates the padding range base on the alignment. */
    // subroutines for getalign
    .global dynomem_abisubr_byte_getalign
    .global dynomem_abisubr_hword_getalign
    .global dynomem_abisubr_word_getalign
    .global dynomem_abisubr_dword_getalign
    .global dynomem_abisubr_nbyte_getalign
    // macros for getalign
    #define GETALIGN_OFFSET x0
    #define GETALIGN_NBYTES x1
    #define GETALIGN_RET    x0

    /*    utility subroutines--->  */

.text


dynomem_abisubr_byte_arrlen2stp: 
    lsl OFFSET_ARRLEN, OFFSET_ARRLEN, #3
    add ADDR_ARRLEN, ADDR_ARRLEN, OFFSET_ARRLEN
    mov TMPADDR_ARRLEN, ADDR_ARRLEN       
1:    
    ldrb ELEM1W, [TMPADDR_ARRLEN], #1
    ldrb ELEM2W, [TMPADDR_ARRLEN], #1
    ands wzr, ELEM2W, ELEM1W
    b.eq 2f
    b.ne 1b
2:
    sub ARR_LEN, TMPADDR_ARRLEN, ADDR_ARRLEN
    orr ELEM2W, ELEM2W, ELEM1W, lsl #8
    and ELEM1W, ELEM1W, ELEM2W
    eor ELEM2W, ELEM2W, ELEM1W
    cmp ELEM2W, #255
    b.cs 3f
    b.mi 4f
3:
    sub ARR_LEN, ARR_LEN, #1
    bl 5f
4:
    sub ARR_LEN, ARR_LEN, #2
    bl 5f
5:             
    ret


dynomem_abisubr_hword_arrlen2stp: 
    lsl OFFSET_ARRLEN, OFFSET_ARRLEN, #4
    add ADDR_ARRLEN, ADDR_ARRLEN, OFFSET_ARRLEN
    mov TMPADDR_ARRLEN, ADDR_ARRLEN      
1:    
    ldrh ELEM1W, [TMPADDR_ARRLEN], #1
    ldrh ELEM2W, [TMPADDR_ARRLEN], #1
    ands wzr, ELEM2W, ELEM1W
    b.eq 2f
    b.ne 1b
2:
    sub ARR_LEN, TMPADDR_ARRLEN, ADDR_ARRLEN
    orr ELEM2W, ELEM2W, ELEM1W, lsl #16
    and ELEM1W, ELEM1W, ELEM2W
    eor ELEM2W, ELEM2W, ELEM1W
    cmp ELEM2W, #65535
    b.cs 3f
    b.mi 4f
3:
    sub ARR_LEN, ARR_LEN, #1
    bl 5f
4:
    sub ARR_LEN, ARR_LEN, #2
    bl 5f
5:             
    ret

dynomem_abisubr_word_arrlen2stp: 
    lsl OFFSET_ARRLEN, OFFSET_ARRLEN, #5
    add ADDR_ARRLEN, ADDR_ARRLEN, OFFSET_ARRLEN
    mov TMPADDR_ARRLEN, ADDR_ARRLEN       
1:    
    ldrw ELEM1X, [TMPADDR_ARRLEN], #1
    ldrw ELEM2X, [TMPADDR_ARRLEN], #1
    ands wzr, ELEM2X, ELEM1X
    b.eq 2f
    b.ne 1b
2:
    sub ARR_LEN, TMPADDR_ARRLEN, ADDR_ARRLEN
    orr ELEM2X, ELEM2X, ELEM1X, lsl #32
    and ELEM1X, ELEM1X, ELEM2X
    eor ELEM2X, ELEM2X, ELEM1X
    cmp ELEM2X, #4294967295
    b.cs 3f
    b.mi 4f
3:
    sub ARR_LEN, ARR_LEN, #1
    bl 5f
4:
    sub ARR_LEN, ARR_LEN, #2
    bl 5f
5:             
    ret

dynomem_abisubr_qword_arrlen2stp: 
    lsl OFFSET_ARRLEN, OFFSET_ARRLEN, #6
    add ADDR_ARRLEN, ADDR_ARRLEN, OFFSET_ARRLEN
    mov TMPADDR_ARRLEN, ADDR_ARRLEN       
1:    
    ldr ELEM1X, [TMPADDR_ARRLEN], #1
    ldr ELEM2X, [TMPADDR_ARRLEN], #1
    ands wzr, ELEM2X, ELEM1X
    b.eq 2f
    b.ne 1b
2:
    sub ARR_LEN, TMPADDR_ARRLEN, ADDR_ARRLEN
    orr ELEM2X, ELEM2X, ELEM1X, lsl #48
    and ELEM1X, ELEM1X, ELEM2X
    eor ELEM2X, ELEM2X, ELEM1X
    cmp ELEM2X, #281474976710655
    b.cs 3f
    b.mi 4f
3:
    sub ARR_LEN, ARR_LEN, #1
    bl 5f
4:
    sub ARR_LEN, ARR_LEN, #2
    bl 5f
5:             
    ret

dynomem_abisubr_nbyte_arrlen2stp: 
    lsl OFFSET_ARRLEN, OFFSET_ARRLEN, NUM_BYTES
    add ADDR_ARRLEN, ADDR_ARRLEN, OFFSET_ARRLEN
    mov TMPADDR_ARRLEN, ADDR_ARRLEN       
6:
    mov NBYTES_INDEX, NUM_BYTES
1:
    ldr ELEM1X, [TMPADDR_ARRLEN], #1
    ldr ELEM2X, [TMPADDR_ARRLEN], #1
    ands wzr, ELEM2X, ELEM1X
    b.eq 3f
    b.ne 2b
2:
    sub NBYTES_INDEX, NBYTES_INDEX, #1
    cmp NBYTES_INDEX, #0
    b.eq 6b
    b.ne 1b
3:
    sub ARR_LEN, TMPADDR_ARRLEN, ADDR_ARRLEN
    orr ELEM2X, ELEM2X, ELEM1X, lsl #48
    and ELEM1X, ELEM1X, ELEM2X
    eor ELEM2X, ELEM2X, ELEM1X
    cmp ELEM2X, #281474976710655
    b.cs 4f
    b.mi 5f
4:
    sub ARR_LEN, ARR_LEN, #1
    bl 6f
5:
    sub ARR_LEN, ARR_LEN, #2
    bl 6f
6:             
    ret

// extern void *dynoalloc(usize size, usize nbyteum)
dynoalloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_ALLOC
    mov TO_SIZE, LEN
    bl dynosizer
    mov TMP_SYSCARG_LEN, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov SYSCARG_LEN, TMP_SYSCARG_LEN

    mov SYSCREG, SYS_mmap        
    mov SYSCARG_ADDR, xzr             
    mov SYSCARG_PROT, SYSCARG_PROT_RXW        
    mov SYSCARG_FLAGS, MAP_SYSCARG_FLAGS       
    mov SYSCARG_FILEDESC, FD_RAM         
    mov SYSCARG_OFFSET, #0              
    svc #0                  
    
    ldr lr, [sp], #8
    ret

// extern void *dynorealloc(void *ptr, usize old_size, usize new_size, usize nbyteum)
dynorealloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_REALLOC
    mov TO_SIZE, OLD_SIZE
    bl dynosizer
    mov TMP_SYSCARG_OLDSIZE, MULT_LEN
    mov TO_SIZE, NEW_SIZE
    bl dynosizer
    mov TMP_SYSCARG_NEWSIZE, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov OLD_SIZE, TMP_SYSCARG_OLDSIZE
    mov NEW_SIZE, TMP_SYSCARG_NEWSIZE
    
    mov SYSCREG, SYS_mremap      
    mov SYSCARG_FLAGS, #0              
    mov SYSCARG_NEWADDR_REMAP, xzr             
    svc #0                  
    
    ldr lr, [sp], #8
    ret

// extern void dynounalloc(void *SYSCARG_addr, usize size, usize nbyteum)
dynounalloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_UNALLOC
    mov TO_SIZE, SYSCARG_LEN_UNALLOC
    bl dynosizer
    mov TMP_LENUNALLOC, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov SYSCARG_LEN_UNALLOC, TMP_LENUNALLOC

    mov SYSCREG, SYS_munmap       
    svc #0

    ldr lr, [sp], #8
    ret

// extern void dynomemcpy(void *dst, void *src, usize cpynum)
dynowordcpy:
    shl CPYLEN, CPYLEN, #16    
1:
    ldr TMP_VALUE, [ADDR_SRC, CPYLENBYTES]
    str TMP_VALUE, [ADDR_DST, CPYLENBYTES]
    subs CPYLEN, CPYLEN, #1
    b.mi 2f
    b.pl 1b
2:
    ret

// extern void dynostrcpy(void *dst, void *src, usize charnum)
dynomem_abisubr_bytec_py:
1:
    ldrb TMP_BYTE, [ADDR_STR_SRC, STRLEN]
    strb TMP_BYTE, [ADDR_STR_DST, STRLEN]
    subs STRLEN, STRLEN, #1
    b.mi 2f
    b.pl 1b
2:
    ret


// extern usize dynomem_abisubr_getlen(usize num)
dynomem_abisubr_getlen:
    sub ROUNDUP_P2, ROUNDUP_P2, #1
    shr ROUNDUP_P2, ROUNDUP_P2, #4
    shr ROUNDUP_P2, ROUNDUP_P2, #8
    shr ROUNDUP_P2, ROUNDUP_P2, #16
    shr ROUNDUP_P2, ROUNDUP_P2, #32
    shr ROUNDUP_P2, ROUNDUP_P2, #64
    add ROUNDUP_P2, ROUNDUP_P2, #1

    ret