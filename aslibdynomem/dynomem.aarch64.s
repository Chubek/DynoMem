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
    
    SYSCALLREG .req  x8

    /*      Declarations    */

    /*  <---memory [shared|stack|dynamic] (un/re)allocaion subroutines    */

    /*   stalloc for freeing up space on user-space stack   */
    // subroutines for stalloc
    .global dynomem_abi_8bitalign_stalloc 
    .global dynomem_abi_16bitalign_stalloc
    .global dynomem_abi_32bitalign_stalloc
    .global dynomem_abi_64bitalign_stalloc
    .global dynomem_abi_premultlen_stalloc
    // aliases for stalloc
    STALLOC_LEN .req x0
    STALLOC_RET .req x0

    /*   dyalloc for dynamically allocating memory   */
    // subroutines for dyalloc   
    .global dynomem_abi_8bitalign_dyalloc
    .global dynomem_abi_16bitalign_dyalloc
    .global dynomem_abi_32bitalign_dyalloc
    .global dynomem_abi_64bitalign_dyalloc
    .global dynomem_abi_premultlen_dyalloc
    // aliases for dyalloc
    SYSCARG_ADDR .req x0
    SYSCARG_LEN .req x1
    SYSCARG_PROT .req x2
    SYSCARG_FLAGS .req x3
    SYSCARG_FILEDESC .req x4
    SYSCARG_OFFSET .req x5
    DYALLOC_RET .req x0

    /*   dyrealloc for resizing dynamically allocated memory   */
    // subroutines for dyrealloc   
    .global dynomem_abi_8bitalign_dyrealloc
    .global dynomem_abi_16bitalign_dyrealloc
    .global dynomem_abi_32bitalign_dyrealloc
    .global dynomem_abi_64bitalign_dyrealloc
    .global dynomem_abi_premultlen_dyrealloc
    // aliases for dyrealloc
    SYSCARG_OLDADDR .req x0
    SYSCARG_OLDSIZE .req x1
    SYSCARG_NEWSIZE .req x2
    SYSCARG_FLAGS_REMAP .req x3
    SYSCARG_NEWADDR_REMAP .req x4
    DYREALLOC_RET .req x0
    
    /*   dyunalloc for freeing up dynamically-allocated memory   */
    // subroutines for dyunalloc 
    .global dynomem_abi_8bitalign_dyunalloc
    .global dynomem_abi_16bitalign_dyunalloc
    .global dynomem_abi_32bitalign_dyunalloc
    .global dynomem_abi_64bitalign_dyunalloc
    .global dynomem_abi_premultlen_dyunalloc
    // aliases for dyunalloc
    SYSCARG_ADDR_UNALLOC .req x0
    SYSCARG_LEN_UNALLOC .req x1
    DYUNALLOC_RET .req x0

    /*   linkshmem for sharing memory for IPC using POSIX calls   */
    // subroutines for linkshmem
    .global dynomem_abi_linkshmem
     // aliases for linkshmem
    SYSCARG_NAME_LINK .req x0
    SYSCARG_OFLAG .req x1
    SYSCARG_MODE .req x2
    LINKMEM_RET .req x0

    /*   unlinkshmem for unlinking shared memory linked by `linkshmem`   */
    // subroutines for unlinkshmem
    .global dynomem_abi_unlinkshmem
    // aliases for unlinkshmem
    SYSCARG_NAME_UNLINK .req x0
    UNLINKMEM_RET .req x0

    /*  <   memory [shared|stack|dynamic] (un/re)allocaion subroutines--->    */

    /*  <---Memory access subroutines   */

    /*   getmemat for accessing an item in memory using a memory offset   */
    // subroutines for getmemat
    .global dynomem_abi_8bitalign_getmemat
    .global dynomem_abi_16bitalign_getmemat
    .global dynomem_abi_32bitalign_getmemat
    .global dynomem_abi_64bitalign_getmemat
    .global dynomem_abi_premultlen_getmemat
    // aliases for getmemat
    GETMEMAT_ADDR .req x0
    GETMEMAT_OFFSET .req x1
    GETMEMAT_RETX .req x0
    GETMEMAT_RETW .req w0

    /*  setmemat for setting the memory at an specific offset after the address  */
    // subroutines for setmemat
    .global dynomem_abi_8bitalign_setmemat
    .global dynomem_abi_16bitalign_setmemat
    .global dynomem_abi_32bitalign_setmemat
    .global dynomem_abi_64bitalign_setmemat
    .global dynomem_abi_premultlen_setmemat
    // aliases for setmemat
    SETMEMAT_ADDR .req x0
    SETMEMAT_OFFSET .req x1
    SETMEMAT_SETVALX .req x2
    SETMEMAT_SETVALW .req w2
    SETMEMAT_RET .req x0

    /*   setmemval will set memory[addr+offset until addr+offset+len] to VAL */
    // subroutines for setmemval
    .global dynomem_abi_8bitalign_setmemval
    .global dynomem_abi_16bitalign_setmemval
    .global dynomem_abi_32bitalign_setmemval
    .global dynomem_abi_64bitalign_setmemval
    .global dynomem_abi_premultlen_setmemval
    // aliases for setmemval
    SETMEMVAL_ADDR .req x0
    SETMEMVAL_OFFSET .req x1
    SETMEMVAL_LEN .req x2
    SETMEMVAL_SETVALX .req x3
    SETMEMVAL_SETVALW .req w3
    SETMEMVAL_RET .req x0

    /*   setmemrange will set memory[addr+offset until addr+offset+len] to [n1, n2) */
    // subroutines for setmemrange
    .global dynomem_abi_8bitalign_setmemrange
    .global dynomem_abi_16bitalign_setmemrange
    .global dynomem_abi_32bitalign_setmemrange
    .global dynomem_abi_64bitalign_setmemrange
    .global dynomem_abi_premultlen_setmemrange
    // aliases for setmemrange
    SETMEMRANGE_ADDR .req x0
    SETMEMRANGE_OFFSET .req x1
    SETMEMRANGE_LEN .req x2
    SETMEMRANGE_SETRANGE1X .req x3
    SETMEMRANGE_SETRANGE1W .req w3
    SETMEMRANGE_SETRANGE2X .req x4
    SETMEMRANGE_SETRANGE2W .req w4
    SETMEMRANGE_RET .req x0

    /*  Memory access subroutines--->   */

    /*  <---Memory copy/alignment subroutines   */

    /*  copymem will copy a length of n from source+offset to destination   */
    // copymem makes the assertion that data is already aligned on src.
    // copymem subroutines
    .global dynomem_abi_8bitalign_copymem
    .global dynomem_abi_16bitalign_copymem
    .global dynomem_abi_32bitalign_copymem
    .global dynomem_abi_64bitalign_copymem
    .global dynomem_abi_premultlen_copymem
    // aliases for copymem
    COPYMEM_DST_ADDR .req x0
    COPYMEM_SRC_ADDR .req x1
    COPYMEM_SRC_OFFSET .req x2
    COPYMEM_COPY_LEN .req x3
    COPYMEM_RET  .req x0

    /* copymemalign copies length of n from src to dst whilst padding for alignment */
    // copymemalign subroutines
    .global dynomem_abi_8bitalign_copymemalign
    .global dynomem_abi_16bitalign_copymemalign
    .global dynomem_abi_32bitalign_copymemalign
    .global dynomem_abi_64bitalign_copymemalign
    .global dynomem_abi_premultlen_copymemalign
    // aliases for copymemalign
    COPYMEMALIGN_DST_ADDR .req x0
    COPYMEMALIGN_SRC_ADDR .req x1
    COPYMEMALIGN_SRC_OFFSET .req x2
    COPYMEMALIGN_COPY_LEN .req x3
    // alignment is only used for `premultlen`
    COPYMEMALIGN_ALIGNMENT .req x4
    COPYMEMALIGN_RET  .req x0

    /* alignmem takes an address and pads all non-aligned cells with 0 */
    // alignmem subroutines
    .global dynomem_abi_8bitalign_alignmem
    .global dynomem_abi_16bitalign_alignmem
    .global dynomem_abi_32bitalign_alignmem
    .global dynomem_abi_64bitalign_alignmem
    .global dynomem_abi_premultlen_alignmem
    // aliases for alignmem
    ALIGNMEM_ADDR .req x0
    ALIGNMEM_OFFSET .req x1
    ALIGNMEM_LEN .req x2
    // alignment is only used for `premultlen`
    ALIGNMEM_ALIGNMENT .req x3
    ALIGNMEM_RET  .req x0

    /*  Memory copy/alignment subroutines--->   */

    /*  <---Data accumulation subroutines  */

    /* sumupNstep will sumup [addr+offset, addr+offset+len) stepping by N */
    // sumupNstep subroutines --- 1 at a time
    .global dynomem_abi_8bitalign_sumup1step
    .global dynomem_abi_16bitalign_sumup1step
    .global dynomem_abi_32bitalign_sumup1step
    .global dynomem_abi_64bitalign_sumup1step
    .global dynomem_abi_premultlen_sumup1step
    // sumupNstep subroutines --- 2 at a time
    .global dynomem_abi_8bitalign_sumup2step
    .global dynomem_abi_16bitalign_sumup2step
    .global dynomem_abi_32bitalign_sumup2step
    .global dynomem_abi_64bitalign_sumup2step
    .global dynomem_abi_premultlen_sumup2step
    // sumupNstep subroutines --- 4 at a time
    .global dynomem_abi_8bitalign_sumup4step
    .global dynomem_abi_16bitalign_sumup4step
    .global dynomem_abi_32bitalign_sumup4step
    .global dynomem_abi_64bitalign_sumup4step
    .global dynomem_abi_premultlen_sumup4step
    // sumupNstep subroutines --- 8 at a time
    .global dynomem_abi_8bitalign_sumup8step
    .global dynomem_abi_16bitalign_sumup8step
    .global dynomem_abi_32bitalign_sumup8step
    .global dynomem_abi_64bitalign_sumup8step
    .global dynomem_abi_premultlen_sumup8step
    // aliases for sumupNstep
    SUMUPNSTEP_ADDR .req x0
    SUMUPNSTEP_OFFSET .req x1
    SUMUPNSTEP_LEN .req x3
    SUMUPNSTEP_RET .req x0

    /* dotpNstep will inner-product [addr+offset, addr+offset+len) stepping by N */
    // dotpNstep subroutines --- 1 at a time
    .global dynomem_abi_8bitalign_dotp1step
    .global dynomem_abi_16bitalign_dotp1step
    .global dynomem_abi_32bitalign_dotp1step
    .global dynomem_abi_64bitalign_dotp1step
    .global dynomem_abi_premultlen_dotp1step
    // dotpNstep subroutines --- 2 at a time
    .global dynomem_abi_8bitalign_dotp2step
    .global dynomem_abi_16bitalign_dotp2step
    .global dynomem_abi_32bitalign_dotp2step
    .global dynomem_abi_64bitalign_dotp2step
    .global dynomem_abi_premultlen_dotp2step
    // dotpNstep subroutines --- 4 at a time
    .global dynomem_abi_8bitalign_dotp4step
    .global dynomem_abi_16bitalign_dotp4step
    .global dynomem_abi_32bitalign_dotp4step
    .global dynomem_abi_64bitalign_dotp4step
    .global dynomem_abi_premultlen_dotp4step
    // dotpNstep subroutines --- 8 at a time
    .global dynomem_abi_8bitalign_dotp8step
    .global dynomem_abi_16bitalign_dotp8step
    .global dynomem_abi_32bitalign_dotp8step
    .global dynomem_abi_64bitalign_dotp8step
    .global dynomem_abi_premultlen_dotp8step

    /* l1normNstep will manhattan-distance two block ranges, stepping by N */
    // l1normNstep subroutines --- 1 at a time
    .global dynomem_abi_8bitalign_l1norm1step
    .global dynomem_abi_16bitalign_l1norm1step
    .global dynomem_abi_32bitalign_l1norm1step
    .global dynomem_abi_64bitalign_l1norm1step
    .global dynomem_abi_premultlen_l1norm1step
    // l1normNstep subroutines --- 2 at a time
    .global dynomem_abi_8bitalign_l1norm2step
    .global dynomem_abi_16bitalign_l1norm2step
    .global dynomem_abi_32bitalign_l1norm2step
    .global dynomem_abi_64bitalign_l1norm2step
    .global dynomem_abi_premultlen_l1norm2step
    // l1normNstep subroutines --- 4 at a time
    .global dynomem_abi_8bitalign_l1norm4step
    .global dynomem_abi_16bitalign_l1norm4step
    .global dynomem_abi_32bitalign_l1norm4step
    .global dynomem_abi_64bitalign_l1norm4step
    .global dynomem_abi_premultlen_l1norm4step
    // l1normNstep subroutines --- 8 at a time
    .global dynomem_abi_8bitalign_l1norm8step
    .global dynomem_abi_16bitalign_l1norm8step
    .global dynomem_abi_32bitalign_l1norm8step
    .global dynomem_abi_64bitalign_l1norm8step
    .global dynomem_abi_premultlen_l1norm8step
    // aliases for l1normNstep
     

    /* l2normNstep will euclidean-distance two block ranges, stepping by N */
    // l2normNstep subroutines --- 1 at a time
    .global dynomem_abi_8bitalign_l2norm1step
    .global dynomem_abi_16bitalign_l2norm1step
    .global dynomem_abi_32bitalign_l2norm1step
    .global dynomem_abi_64bitalign_l2norm1step
    .global dynomem_abi_premultlen_l2norm1step
    // l2normNstep subroutines --- 2 at a time
    .global dynomem_abi_8bitalign_l2norm2step
    .global dynomem_abi_16bitalign_l2norm2step
    .global dynomem_abi_32bitalign_l2norm2step
    .global dynomem_abi_64bitalign_l2norm2step
    .global dynomem_abi_premultlen_l2norm2step
    // l2normNstep subroutines --- 4 at a time
    .global dynomem_abi_8bitalign_l2norm4step
    .global dynomem_abi_16bitalign_l2norm4step
    .global dynomem_abi_32bitalign_l2norm4step
    .global dynomem_abi_64bitalign_l2norm4step
    .global dynomem_abi_premultlen_l2norm4step
    // l2normNstep subroutines --- 8 at a time
    .global dynomem_abi_8bitalign_l2norm8step
    .global dynomem_abi_16bitalign_l2norm8step
    .global dynomem_abi_32bitalign_l2norm8step
    .global dynomem_abi_64bitalign_l2norm8step
    .global dynomem_abi_premultlen_l2norm8step

    .global dynomem_abi_8bitalign_matmul
    .global dynomem_abi_16bitalign_matmul
    .global dynomem_abi_32bitalign_matmul
    .global dynomem_abi_64bitalign_matmul
    .global dynomem_abi_premultlen_matmul

    /*  Data accumulation subroutines--->  */


    .global dynomem_abi_8bitalign_arrlen1step
    .global dynomem_abi_16bitalign_arrlen1step
    .global dynomem_abi_32bitalign_arrlen1step
    .global dynomem_abi_64bitalign_arrlen1step
    .global dynomem_abi_premultlen_arrlen1step

    .global dynomem_abi_8bitalign_arrlen2step
    .global dynomem_abi_16bitalign_arrlen2step
    .global dynomem_abi_32bitalign_arrlen2step
    .global dynomem_abi_64bitalign_arrlen2step
    .global dynomem_abi_premultlen_arrlen2step

    .global dynomem_abi_8bitalign_arrlen4step
    .global dynomem_abi_16bitalign_arrlen4step
    .global dynomem_abi_32bitalign_arrlen4step
    .global dynomem_abi_64bitalign_arrlen4step
    .global dynomem_abi_premultlen_arrlen4step

    .global dynomem_abi_8bitalign_arrlen8step
    .global dynomem_abi_16bitalign_arrlen8step
    .global dynomem_abi_32bitalign_arrlen8step
    .global dynomem_abi_64bitalign_arrlen8step
    .global dynomem_abi_premultlen_arrlen8step

    .global dynomem_abi_8bitalign_compare1step
    .global dynomem_abi_16bitalign_compare1step
    .global dynomem_abi_32bitalign_compare1step
    .global dynomem_abi_64bitalign_compare1step
    .global dynomem_abi_premultlen_compare1step

    .global dynomem_abi_8bitalign_compare2step
    .global dynomem_abi_16bitalign_compare2step
    .global dynomem_abi_32bitalign_compare2step
    .global dynomem_abi_64bitalign_compare2step
    .global dynomem_abi_premultlen_compare2step

    .global dynomem_abi_8bitalign_compare4step
    .global dynomem_abi_16bitalign_compare4step
    .global dynomem_abi_32bitalign_compare4step
    .global dynomem_abi_64bitalign_compare4step
    .global dynomem_abi_premultlen_compare4step

    .global dynomem_abi_8bitalign_compare8step
    .global dynomem_abi_16bitalign_compare8step
    .global dynomem_abi_32bitalign_compare8step
    .global dynomem_abi_64bitalign_compare8step
    .global dynomem_abi_premultlen_compare8step

    .global dynomem_abi_8bitalign_checkfree1step
    .global dynomem_abi_16bitalign_checkfree1step
    .global dynomem_abi_32bitalign_checkfree1step
    .global dynomem_abi_64bitalign_checkfree1step
    .global dynomem_abi_premultlen_checkfree1step

    .global dynomem_abi_8bitalign_checkfree2step
    .global dynomem_abi_16bitalign_checkfree2step
    .global dynomem_abi_32bitalign_checkfree2step
    .global dynomem_abi_64bitalign_checkfree2step
    .global dynomem_abi_premultlen_checkfree2step

    .global dynomem_abi_8bitalign_checkfree4step
    .global dynomem_abi_16bitalign_checkfree4step
    .global dynomem_abi_32bitalign_checkfree4step
    .global dynomem_abi_64bitalign_checkfree4step
    .global dynomem_abi_premultlen_checkfree4step

    .global dynomem_abi_8bitalign_checkfree8step
    .global dynomem_abi_16bitalign_checkfree8step
    .global dynomem_abi_32bitalign_checkfree8step
    .global dynomem_abi_64bitalign_checkfree8step
    .global dynomem_abi_premultlen_checkfree8step

    /*  <---utility subroutines  */

    // passed `nbyte` is rounded up to the nearest power of 2.

    /*  getlen calculates the length of an array in bytes */
    // subroutines for getlen
    .global dynomem_abi_8bitalign_getlen
    .global dynomem_abi_16bitalign_getlen
    .global dynomem_abi_32bitalign_getlen
    .global dynomem_abi_dwordalign_getlen
    .global dynomem_abi_premultlen_getlen
    // aliases for getlen
    .req GETLEN_NITEMS x0
    .req GETLEN_NBYTES x1
    .req GETLEN_RET    x0

    /*  getalign calculates the padding range base on the alignment. */
    // subroutines for getalign
    .global dynomem_abi_8bitalign_getalign
    .global dynomem_abi_16bitalign_getalign
    .global dynomem_abi_32bitalign_getalign
    .global dynomem_abi_dwordalign_getalign
    .global dynomem_abi_premultlen_getalign
    // aliases for getalign
    .req GETALIGN_OFFSET x0
    .req GETALIGN_NBYTES x1
    .req GETALIGN_RET    x0

    /*    utility subroutines--->  */

.text


dynomem_abi_8bitalign_arrlen2step: 
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


dynomem_abi_16bitalign_arrlen2step: 
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

dynomem_abi_32bitalign_arrlen2step: 
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

dynomem_abi_64bitalign_arrlen2step: 
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

dynomem_abi_premultlen_arrlen2step: 
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

    mov SYSCALLREG, SYS_mmap        
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
    
    mov SYSCALLREG, SYS_mremap      
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

    mov SYSCALLREG, SYS_munmap       
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
dynomem_abi_bytec_py:
1:
    ldrb TMP_BYTE, [ADDR_STR_SRC, STRLEN]
    strb TMP_BYTE, [ADDR_STR_DST, STRLEN]
    subs STRLEN, STRLEN, #1
    b.mi 2f
    b.pl 1b
2:
    ret


// extern usize dynomem_abi_getlen(usize num)
dynomem_abi_getlen:
    sub ROUNDUP_P2, ROUNDUP_P2, #1
    shr ROUNDUP_P2, ROUNDUP_P2, #4
    shr ROUNDUP_P2, ROUNDUP_P2, #8
    shr ROUNDUP_P2, ROUNDUP_P2, #16
    shr ROUNDUP_P2, ROUNDUP_P2, #32
    shr ROUNDUP_P2, ROUNDUP_P2, #64
    add ROUNDUP_P2, ROUNDUP_P2, #1

    ret