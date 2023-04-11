.section dynomem_main
/*      DynoMem Aarch64 External Linkage File    */

.section dynomem_allocation_utils

    .ifdef Ldynomem_abi_stalloc
        /*   stalloc for freeing up space on user-space stack   */
        .global dynomem_abi_08bitstruct_stalloc 
        .global dynomem_abi_16bitstruct_stalloc
        .global dynomem_abi_32bitstruct_stalloc
        .global dynomem_abi_64bitstruct_stalloc
        .global dynomem_abi_nnbitstruct_stalloc
    .endif

    .ifdef Ldynomem_abi_dyalloc
        /*   dyalloc for dynamically allocating memory   */
        .global dynomem_abi_08bitstruct_dyalloc
        .global dynomem_abi_16bitstruct_dyalloc
        .global dynomem_abi_32bitstruct_dyalloc
        .global dynomem_abi_64bitstruct_dyalloc
        .global dynomem_abi_nnbitstruct_dyalloc
    .endif

    .ifdef Ldynomem_abi_dyrealloc
        /*   dyrealloc for resizing dynamically allocated memory   */
        .global dynomem_abi_08bitstruct_dyrealloc
        .global dynomem_abi_16bitstruct_dyrealloc
        .global dynomem_abi_32bitstruct_dyrealloc
        .global dynomem_abi_64bitstruct_dyrealloc
        .global dynomem_abi_nnbitstruct_dyrealloc
    .endif
    
    .ifdef Ldynomem_abi_dyunalloc
        /*   dyunalloc for freeing up dynamically-allocated memory   */
        .global dynomem_abi_08bitstruct_dyunalloc
        .global dynomem_abi_16bitstruct_dyunalloc
        .global dynomem_abi_32bitstruct_dyunalloc
        .global dynomem_abi_64bitstruct_dyunalloc
        .global dynomem_abi_nnbitstruct_dyunalloc
    .endif

    .ifdef Ldynomem_abi_linkmem
        /*   linkshmem for sharing memory for IPC using POSIX calls   */
        .global dynomem_abi_linkshmem
    .endif

    .ifdef Ldynomem_abi_unlinkmem
        /*   unlinkshmem for unlinking shared memory linked by `linkshmem`   */
        .global dynomem_abi_unlinkshmem
    .endif

.section dynomem_access_utils
    
    .ifdef Ldynomem_abi_getmemat
        /*   getmemat for accessing an item in memory using a memory offset   */
        .global dynomem_abi_08bitstruct_getmemat
        .global dynomem_abi_16bitstruct_getmemat
        .global dynomem_abi_32bitstruct_getmemat
        .global dynomem_abi_64bitstruct_getmemat
        .global dynomem_abi_nnbitstruct_getmemat
    .endif

    .ifdef Ldynomem_abi_setmemat
        /*  setmemat for setting the memory at an specific offset after the address  */
        .global dynomem_abi_08bitstruct_setmemat
        .global dynomem_abi_16bitstruct_setmemat
        .global dynomem_abi_32bitstruct_setmemat
        .global dynomem_abi_64bitstruct_setmemat
        .global dynomem_abi_nnbitstruct_setmemat
    .endif

    .ifdef Ldynomem_abi_setmemval
        /*   setmemval will set memory[addr*offset until addr*offset+len] to VAL */
        .global dynomem_abi_08bitstruct_setmemval
        .global dynomem_abi_16bitstruct_setmemval
        .global dynomem_abi_32bitstruct_setmemval
        .global dynomem_abi_64bitstruct_setmemval
        .global dynomem_abi_nnbitstruct_setmemval
    .endif

    .ifdef Ldynomem_abi_setmemrange
        /*   setmemrange will set memory[addr*offset until addr*offset+len] to [n1, n2) */
        .global dynomem_abi_08bitstruct_setmemrange
        .global dynomem_abi_16bitstruct_setmemrange
        .global dynomem_abi_32bitstruct_setmemrange
        .global dynomem_abi_64bitstruct_setmemrange
        .global dynomem_abi_nnbitstruct_setmemrange
    .endif

.section dynomem_copy_utils

    .ifdef Ldynomem_abi_copymem
        /*  copymem will copy a length of n from source+offset to destination   */
        // copymem makes the assertion that data is already aligned on src.
        .global dynomem_abi_08bitstruct_copymem
        .global dynomem_abi_16bitstruct_copymem
        .global dynomem_abi_32bitstruct_copymem
        .global dynomem_abi_64bitstruct_copymem
        .global dynomem_abi_nnbitstruct_copymem
    .endif

    .ifdef Ldynomem_abi_copymemalign
        /* copymemalign copies length of n from src to dst whilst padding for alignment */
        .global dynomem_abi_08bitstruct_copymemalign
        .global dynomem_abi_16bitstruct_copymemalign
        .global dynomem_abi_32bitstruct_copymemalign
        .global dynomem_abi_64bitstruct_copymemalign
        .global dynomem_abi_nnbitstruct_copymemalign
    .endif

    .ifdef Ldynomem_abi_copymempack
        /* copymempack copies length of n from src to dst whilst packing data to boundy */
        // copymempack subroutines
        .global dynomem_abi_08bitstruct_copymempack
        .global dynomem_abi_16bitstruct_copymempack
        .global dynomem_abi_32bitstruct_copymempack
        .global dynomem_abi_64bitstruct_copymempack
        .global dynomem_abi_nnbitstruct_copymempack
    .endif

.section dynomem_align_utils

    .ifdef Ldynomem_abi_alignmem
        /* alignmem takes an address and pads all non-aligned cells with 0 until the next boundary */
        .global dynomem_abi_08bitstruct_alignmem
        .global dynomem_abi_16bitstruct_alignmem
        .global dynomem_abi_32bitstruct_alignmem
        .global dynomem_abi_64bitstruct_alignmem
        .global dynomem_abi_nnbitstruct_alignmem
    .endif

    .ifdef Ldynomem_abi_packmem
        /* packmem takes an address and packs data, zeroing out the remainder */
        .global dynomem_abi_08bitstruct_packmem
        .global dynomem_abi_16bitstruct_packmem
        .global dynomem_abi_32bitstruct_packmem
        .global dynomem_abi_64bitstruct_packmem
        .global dynomem_abi_nnbitstruct_packmem
    .endif

.section dynomem_accumulative_utils

    .ifdef Ldynomem_abi_sumupnstep
        /* sumupNstep will sumup [addr*offset, addr*offset+len) stepping by N */
        // sumupNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_sumup1step
        .global dynomem_abi_16bitstruct_sumup1step
        .global dynomem_abi_32bitstruct_sumup1step
        .global dynomem_abi_64bitstruct_sumup1step
        .global dynomem_abi_nnbitstruct_sumup1step
        // sumupNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_sumup2step
        .global dynomem_abi_16bitstruct_sumup2step
        .global dynomem_abi_32bitstruct_sumup2step
        .global dynomem_abi_64bitstruct_sumup2step
        .global dynomem_abi_nnbitstruct_sumup2step
        // sumupNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_sumup4step
        .global dynomem_abi_16bitstruct_sumup4step
        .global dynomem_abi_32bitstruct_sumup4step
        .global dynomem_abi_64bitstruct_sumup4step
        .global dynomem_abi_nnbitstruct_sumup4step
        // sumupNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_sumup8step
        .global dynomem_abi_16bitstruct_sumup8step
        .global dynomem_abi_32bitstruct_sumup8step
        .global dynomem_abi_64bitstruct_sumup8step
        .global dynomem_abi_nnbitstruct_sumup8step
    .endif

    .ifdef Ldynomem_abi_subupnstep
        /* subupNstep will subtract [addr*offset, addr*offset+len) stepping by N */
        // subupNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_subup1step
        .global dynomem_abi_16bitstruct_subup1step
        .global dynomem_abi_32bitstruct_subup1step
        .global dynomem_abi_64bitstruct_subup1step
        .global dynomem_abi_nnbitstruct_subup1step
        // subupNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_subup2step
        .global dynomem_abi_16bitstruct_subup2step
        .global dynomem_abi_32bitstruct_subup2step
        .global dynomem_abi_64bitstruct_subup2step
        .global dynomem_abi_nnbitstruct_subup2step
        // subupNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_subup4step
        .global dynomem_abi_16bitstruct_subup4step
        .global dynomem_abi_32bitstruct_subup4step
        .global dynomem_abi_64bitstruct_subup4step
        .global dynomem_abi_nnbitstruct_subup4step
        // subupNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_subup8step
        .global dynomem_abi_16bitstruct_subup8step
        .global dynomem_abi_32bitstruct_subup8step
        .global dynomem_abi_64bitstruct_subup8step
        .global dynomem_abi_nnbitstruct_subup8step
    .endif

    .ifdef Ldynomem_abi_multupnstep
        /* multupNstep will inner-product [addr*offset, addr*offset+len) stepping by N */
        // multupNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_multup1step
        .global dynomem_abi_16bitstruct_multup1step
        .global dynomem_abi_32bitstruct_multup1step
        .global dynomem_abi_64bitstruct_multup1step
        .global dynomem_abi_nnbitstruct_multup1step
        // multupNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_multup2step
        .global dynomem_abi_16bitstruct_multup2step
        .global dynomem_abi_32bitstruct_multup2step
        .global dynomem_abi_64bitstruct_multup2step
        .global dynomem_abi_nnbitstruct_multup2step
        // multupNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_multup4step
        .global dynomem_abi_16bitstruct_multup4step
        .global dynomem_abi_32bitstruct_multup4step
        .global dynomem_abi_64bitstruct_multup4step
        .global dynomem_abi_nnbitstruct_multup4step
        // multupNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_multup8step
        .global dynomem_abi_16bitstruct_multup8step
        .global dynomem_abi_32bitstruct_multup8step
        .global dynomem_abi_64bitstruct_multup8step
        .global dynomem_abi_nnbitstruct_multup8step
    .endif

    .ifdef Ldynomem_abi_divupnstep
        /* divupNstep will divide [addr*offset, addr*offset+len) stepping by N */
        // divupNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_divup1step
        .global dynomem_abi_16bitstruct_divup1step
        .global dynomem_abi_32bitstruct_divup1step
        .global dynomem_abi_64bitstruct_divup1step
        .global dynomem_abi_nnbitstruct_divup1step
        // divupNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_divup2step
        .global dynomem_abi_16bitstruct_divup2step
        .global dynomem_abi_32bitstruct_divup2step
        .global dynomem_abi_64bitstruct_divup2step
        .global dynomem_abi_nnbitstruct_divup2step
        // divupNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_divup4step
        .global dynomem_abi_16bitstruct_divup4step
        .global dynomem_abi_32bitstruct_divup4step
        .global dynomem_abi_64bitstruct_divup4step
        .global dynomem_abi_nnbitstruct_divup4step
        // divupNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_divup8step
        .global dynomem_abi_16bitstruct_divup8step
        .global dynomem_abi_32bitstruct_divup8step
        .global dynomem_abi_64bitstruct_divup8step
        .global dynomem_abi_nnbitstruct_divup8step
    .endif


.section dynomem_pairwise_utils

    .ifdef Ldynomem_abi_addpair
        /*  addpair takes two addresses and spends it until it reaches given length, adding values pair-wise and stores in first address */
        .global dynomem_abi_08bitstruct_addpair
        .global dynomem_abi_16bitstruct_addpair
        .global dynomem_abi_32bitstruct_addpair
        .global dynomem_abi_64bitstruct_addpair
        .global dynomem_abi_nnbitstruct_addpair
    .endif

    .ifdef Ldynomem_abi_subpair
        /*  subpair takes two addresses and spends it until it reaches given length, subtracting values pair-wise and stores in first address */
        .global dynomem_abi_08bitstruct_subpair
        .global dynomem_abi_16bitstruct_subpair
        .global dynomem_abi_32bitstruct_subpair
        .global dynomem_abi_64bitstruct_subpair
        .global dynomem_abi_nnbitstruct_subpair
    .endif

    .ifdef Ldynomem_abi_mulpair
        /*  mulpair takes two addresses and spends it until it reaches given length, multiplying values pair-wise and stores in first address */
        .global dynomem_abi_08bitstruct_mulpair
        .global dynomem_abi_16bitstruct_mulpair
        .global dynomem_abi_32bitstruct_mulpair
        .global dynomem_abi_64bitstruct_mulpair
        .global dynomem_abi_nnbitstruct_mulpair
    .endif

    .ifdef Ldynomem_abi_divpair
        /*  divpair takes two addresses and spends it until it reaches given length, divides values pair-wise and stores in first address */
        .global dynomem_abi_08bitstruct_divpair
        .global dynomem_abi_16bitstruct_divpair
        .global dynomem_abi_32bitstruct_divpair
        .global dynomem_abi_64bitstruct_divpair
        .global dynomem_abi_predivtlen_divpair
    .endif

    .ifdef Ldynomem_abi_andpair
        /* andpair takes two addresses and for length n does a bitwise and to the first addr */
        .global dynomem_abi_08bitstruct_andpair
        .global dynomem_abi_16bitstruct_andpair
        .global dynomem_abi_32bitstruct_andpair
        .global dynomem_abi_64bitstruct_andpair
        .global dynomem_abi_nnbitstruct_andpair
    .endif

    .ifdef Ldynomem_abi_orpair
        /* orpair takes two addresses and for length n does a bitwise or to the first addr */
        .global dynomem_abi_08bitstruct_orpair
        .global dynomem_abi_16bitstruct_orpair
        .global dynomem_abi_32bitstruct_orpair
        .global dynomem_abi_64bitstruct_orpair
        .global dynomem_abi_nnbitstruct_orpair
    .endif

    .ifdef Ldynomem_abi_xorpair
        /* xorpair takes two addresses and for length n does a bitwise xor to the first addr */
        .global dynomem_abi_08bitstruct_xorpair
        .global dynomem_abi_16bitstruct_xorpair
        .global dynomem_abi_32bitstruct_xorpair
        .global dynomem_abi_64bitstruct_xorpair
        .global dynomem_abi_nnbitstruct_xorpair
    .endif


.section dynomem_bitwise_utils

    .ifdef Ldynomem_abi_revbits
        /*  revbits takes an address and reverses each block according to integer size and writes the results to addr */
        // revbits subroutines
        .global dynomem_abi_08bitstruct_revbits
        .global dynomem_abi_16bitstruct_revbits
        .global dynomem_abi_32bitstruct_revbits
        .global dynomem_abi_64bitstruct_revbits
        .global dynomem_abi_nnbitstruct_revbits
    .endif

    .ifdef Ldynomem_abi_notbits
        /* notbits takes an address and for length n does a bitwise not to the addr*/
        // notbits subroutines
        .global dynomem_abi_08bitstruct_notbits
        .global dynomem_abi_16bitstruct_notbits
        .global dynomem_abi_32bitstruct_notbits
        .global dynomem_abi_64bitstruct_notbits
        .global dynomem_abi_nnbitstruct_notbits
    .endif

    .ifdef Ldynomem_abi_shiftlbits
        /* shiftlbits takes an address and for length n does a bitwise not to the addr*/
        // shiftlbits subroutines
        .global dynomem_abi_08bitstruct_shiftlbits
        .global dynomem_abi_16bitstruct_shiftlbits
        .global dynomem_abi_32bitstruct_shiftlbits
        .global dynomem_abi_64bitstruct_shiftlbits
        .global dynomem_abi_nnbitstruct_shiftlbits
    .endif

    .ifdef Ldynomem_abi_shiftrbits
        /* shiftrbits takes an address and for length n does a bitwise not to the addr*/
        // shiftrbits subroutines
        .global dynomem_abi_08bitstruct_shiftrbits
        .global dynomem_abi_16bitstruct_shiftrbits
        .global dynomem_abi_32bitstruct_shiftrbits
        .global dynomem_abi_64bitstruct_shiftrbits
        .global dynomem_abi_nnbitstruct_shiftrbits
    .endif

.section dynomem_seek_utils_incremental

    .ifdef Ldynomem_abi_seekzrincnnstep
        /* seekzrincNstep will keep increasing the address*offset until n as aligned until reaches aligned 0 */
        // seekzrincNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekzrinc1step
        .global dynomem_abi_16bitstruct_seekzrinc1step
        .global dynomem_abi_32bitstruct_seekzrinc1step
        .global dynomem_abi_64bitstruct_seekzrinc1step
        .global dynomem_abi_nnbitstruct_seekzrinc1step
        // seekzrincNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekzrinc2step
        .global dynomem_abi_16bitstruct_seekzrinc2step
        .global dynomem_abi_32bitstruct_seekzrinc2step
        .global dynomem_abi_64bitstruct_seekzrinc2step
        .global dynomem_abi_nnbitstruct_seekzrinc2step
        // seekzrincNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekzrinc4step
        .global dynomem_abi_16bitstruct_seekzrinc4step
        .global dynomem_abi_32bitstruct_seekzrinc4step
        .global dynomem_abi_64bitstruct_seekzrinc4step
        .global dynomem_abi_nnbitstruct_seekzrinc4step
        // seekzrincNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekzrinc8step
        .global dynomem_abi_16bitstruct_seekzrinc8step
        .global dynomem_abi_32bitstruct_seekzrinc8step
        .global dynomem_abi_64bitstruct_seekzrinc8step
        .global dynomem_abi_nnbitstruct_seekzrinc8step
    .endif

     .ifdef Ldynomem_abi_seekvalincnstep
        /* seekvalincNstep will keep increasing the address*offset until n as aligned until reaches aligned VAL */
        // seekvalincNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekvalinc1step
        .global dynomem_abi_16bitstruct_seekvalinc1step
        .global dynomem_abi_32bitstruct_seekvalinc1step
        .global dynomem_abi_64bitstruct_seekvalinc1step
        .global dynomem_abi_nnbitstruct_seekvalinc1step
        // seekvalincNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekvalinc2step
        .global dynomem_abi_16bitstruct_seekvalinc2step
        .global dynomem_abi_32bitstruct_seekvalinc2step
        .global dynomem_abi_64bitstruct_seekvalinc2step
        .global dynomem_abi_nnbitstruct_seekvalinc2step
        // seekvalincNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekvalinc4step
        .global dynomem_abi_16bitstruct_seekvalinc4step
        .global dynomem_abi_32bitstruct_seekvalinc4step
        .global dynomem_abi_64bitstruct_seekvalinc4step
        .global dynomem_abi_nnbitstruct_seekvalinc4step
        // seekvalincNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekvalinc8step
        .global dynomem_abi_16bitstruct_seekvalinc8step
        .global dynomem_abi_32bitstruct_seekvalinc8step
        .global dynomem_abi_64bitstruct_seekvalinc8step
        .global dynomem_abi_nnbitstruct_seekvalinc8step
    .endif

    .ifdef Ldynomem_abi_seekcmpincnstep
        /*  seekcmpincNstep will keep increasing the addr1*offset and addr2*offset until n, compares until give NZCV is set */
        // seekcmpincNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekcmpinc1step
        .global dynomem_abi_16bitstruct_seekcmpinc1step
        .global dynomem_abi_32bitstruct_seekcmpinc1step
        .global dynomem_abi_64bitstruct_seekcmpinc1step
        .global dynomem_abi_nnbitstruct_seekcmpinc1step
        // seekcmpincNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekcmpinc2step
        .global dynomem_abi_16bitstruct_seekcmpinc2step
        .global dynomem_abi_32bitstruct_seekcmpinc2step
        .global dynomem_abi_64bitstruct_seekcmpinc2step
        .global dynomem_abi_nnbitstruct_seekcmpinc2step
        // seekcmpincNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekcmpinc4step
        .global dynomem_abi_16bitstruct_seekcmpinc4step
        .global dynomem_abi_32bitstruct_seekcmpinc4step
        .global dynomem_abi_64bitstruct_seekcmpinc4step
        .global dynomem_abi_nnbitstruct_seekcmpinc4step
        // seekcmpincNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekcmpinc8step
        .global dynomem_abi_16bitstruct_seekcmpinc8step
        .global dynomem_abi_32bitstruct_seekcmpinc8step
        .global dynomem_abi_64bitstruct_seekcmpinc8step
        .global dynomem_abi_nnbitstruct_seekcmpinc8step
    .endif

    .ifdef Ldynomem_abi_seelknonzrincnstep
        /* seelknonzrincincNstep is the inverse of seekzrNste. It will keep increassing zeroed out blocks until a non-null is reached */
        // seelknonzrincincNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc1step
        .global dynomem_abi_16bitstruct_seelknonzrinc1step
        .global dynomem_abi_32bitstruct_seelknonzrinc1step
        .global dynomem_abi_64bitstruct_seelknonzrinc1step
        .global dynomem_abi_nnbitstruct_seelknonzrinc1step
        // seelknonzrincincNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc2step
        .global dynomem_abi_16bitstruct_seelknonzrinc2step
        .global dynomem_abi_32bitstruct_seelknonzrinc2step
        .global dynomem_abi_64bitstruct_seelknonzrinc2step
        .global dynomem_abi_nnbitstruct_seelknonzrinc2step
        // seelknonzrincincNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc4step
        .global dynomem_abi_16bitstruct_seelknonzrinc4step
        .global dynomem_abi_32bitstruct_seelknonzrinc4step
        .global dynomem_abi_64bitstruct_seelknonzrinc4step
        .global dynomem_abi_nnbitstruct_seelknonzrinc4step
        // seelknonzrincincNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc8step
        .global dynomem_abi_16bitstruct_seelknonzrinc8step
        .global dynomem_abi_32bitstruct_seelknonzrinc8step
        .global dynomem_abi_64bitstruct_seelknonzrinc8step
        .global dynomem_abi_nnbitstruct_seelknonzrinc8step
    .endif

.section dynomem_seek_utils_decremental

    .ifdef Ldynomem_abi_seekzrdecnstep
        /* seekzrdecNstep will keep decreasing the address*offset until n as aligned until reaches aligned 0 */
        // seekzrdecNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekzrdec1step
        .global dynomem_abi_16bitstruct_seekzrdec1step
        .global dynomem_abi_32bitstruct_seekzrdec1step
        .global dynomem_abi_64bitstruct_seekzrdec1step
        .global dynomem_abi_nnbitstruct_seekzrdec1step
        // seekzrdecNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekzrdec2step
        .global dynomem_abi_16bitstruct_seekzrdec2step
        .global dynomem_abi_32bitstruct_seekzrdec2step
        .global dynomem_abi_64bitstruct_seekzrdec2step
        .global dynomem_abi_nnbitstruct_seekzrdec2step
        // seekzrdecNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekzrdec4step
        .global dynomem_abi_16bitstruct_seekzrdec4step
        .global dynomem_abi_32bitstruct_seekzrdec4step
        .global dynomem_abi_64bitstruct_seekzrdec4step
        .global dynomem_abi_nnbitstruct_seekzrdec4step
        // seekzrdecNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekzrdec8step
        .global dynomem_abi_16bitstruct_seekzrdec8step
        .global dynomem_abi_32bitstruct_seekzrdec8step
        .global dynomem_abi_64bitstruct_seekzrdec8step
        .global dynomem_abi_nnbitstruct_seekzrdec8step
    .endif

    .ifdef Ldynomem_abi_seekvaldecnstep
        /* seekvaldecNstep will keep decreasing the address*offset until n as aligned until reaches aligned VAL */
        // seekvaldecNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekvaldec1step
        .global dynomem_abi_16bitstruct_seekvaldec1step
        .global dynomem_abi_32bitstruct_seekvaldec1step
        .global dynomem_abi_64bitstruct_seekvaldec1step
        .global dynomem_abi_nnbitstruct_seekvaldec1step
        // seekvaldecNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekvaldec2step
        .global dynomem_abi_16bitstruct_seekvaldec2step
        .global dynomem_abi_32bitstruct_seekvaldec2step
        .global dynomem_abi_64bitstruct_seekvaldec2step
        .global dynomem_abi_nnbitstruct_seekvaldec2step
        // seekvaldecNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekvaldec4step
        .global dynomem_abi_16bitstruct_seekvaldec4step
        .global dynomem_abi_32bitstruct_seekvaldec4step
        .global dynomem_abi_64bitstruct_seekvaldec4step
        .global dynomem_abi_nnbitstruct_seekvaldec4step
        // seekvaldecNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekvaldec8step
        .global dynomem_abi_16bitstruct_seekvaldec8step
        .global dynomem_abi_32bitstruct_seekvaldec8step
        .global dynomem_abi_64bitstruct_seekvaldec8step
        .global dynomem_abi_nnbitstruct_seekvaldec8step
    .endif
        
    .ifdef Ldynomem_abi_seekcmpdecnstep
        /*  seekcmpdecNstep will keep decreasing the addr1*offset and addr2*offset until n, compares until give NZCV is set */
        // seekcmpdecNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seekcmpdec1step
        .global dynomem_abi_16bitstruct_seekcmpdec1step
        .global dynomem_abi_32bitstruct_seekcmpdec1step
        .global dynomem_abi_64bitstruct_seekcmpdec1step
        .global dynomem_abi_nnbitstruct_seekcmpdec1step
        // seekcmpdecNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seekcmpdec2step
        .global dynomem_abi_16bitstruct_seekcmpdec2step
        .global dynomem_abi_32bitstruct_seekcmpdec2step
        .global dynomem_abi_64bitstruct_seekcmpdec2step
        .global dynomem_abi_nnbitstruct_seekcmpdec2step
        // seekcmpdecNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seekcmpdec4step
        .global dynomem_abi_16bitstruct_seekcmpdec4step
        .global dynomem_abi_32bitstruct_seekcmpdec4step
        .global dynomem_abi_64bitstruct_seekcmpdec4step
        .global dynomem_abi_nnbitstruct_seekcmpdec4step
        // seekcmpdecNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seekcmpdec8step
        .global dynomem_abi_16bitstruct_seekcmpdec8step
        .global dynomem_abi_32bitstruct_seekcmpdec8step
        .global dynomem_abi_64bitstruct_seekcmpdec8step
        .global dynomem_abi_nnbitstruct_seekcmpdec8step
    .endif

    .ifdef Ldynomem_abi_seelknonzrincnstep
        /* seelknonzrincdecNstep is the inverse of seekzrNste. It will keep decreassing zeroed out blocks until a non-null is reached */
        // seelknonzrincdecNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc1step
        .global dynomem_abi_16bitstruct_seelknonzrinc1step
        .global dynomem_abi_32bitstruct_seelknonzrinc1step
        .global dynomem_abi_64bitstruct_seelknonzrinc1step
        .global dynomem_abi_nnbitstruct_seelknonzrinc1step
        // seelknonzrincdecNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc2step
        .global dynomem_abi_16bitstruct_seelknonzrinc2step
        .global dynomem_abi_32bitstruct_seelknonzrinc2step
        .global dynomem_abi_64bitstruct_seelknonzrinc2step
        .global dynomem_abi_nnbitstruct_seelknonzrinc2step
        // seelknonzrincdecNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc4step
        .global dynomem_abi_16bitstruct_seelknonzrinc4step
        .global dynomem_abi_32bitstruct_seelknonzrinc4step
        .global dynomem_abi_64bitstruct_seelknonzrinc4step
        .global dynomem_abi_nnbitstruct_seelknonzrinc4step
        // seelknonzrincdecNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seelknonzrinc8step
        .global dynomem_abi_16bitstruct_seelknonzrinc8step
        .global dynomem_abi_32bitstruct_seelknonzrinc8step
        .global dynomem_abi_64bitstruct_seelknonzrinc8step
        .global dynomem_abi_nnbitstruct_seelknonzrinc8step
    .endif

    .ifdef Ldynomem_abi_seelknonzrdecnstep
        /* seelknonzrdecdecNstep is the inverse of seekzrNste. It will keep decreassing zeroed out blocks until a non-null is reached */
        // seelknonzrdecdecNstep subroutines --- 1 at a time
        .global dynomem_abi_08bitstruct_seelknonzrdec1step
        .global dynomem_abi_16bitstruct_seelknonzrdec1step
        .global dynomem_abi_32bitstruct_seelknonzrdec1step
        .global dynomem_abi_64bitstruct_seelknonzrdec1step
        .global dynomem_abi_nnbitstruct_seelknonzrdec1step
        // seelknonzrdecdecNstep subroutines --- 2 at a time
        .global dynomem_abi_08bitstruct_seelknonzrdec2step
        .global dynomem_abi_16bitstruct_seelknonzrdec2step
        .global dynomem_abi_32bitstruct_seelknonzrdec2step
        .global dynomem_abi_64bitstruct_seelknonzrdec2step
        .global dynomem_abi_nnbitstruct_seelknonzrdec2step
        // seelknonzrdecdecNstep subroutines --- 4 at a time
        .global dynomem_abi_08bitstruct_seelknonzrdec4step
        .global dynomem_abi_16bitstruct_seelknonzrdec4step
        .global dynomem_abi_32bitstruct_seelknonzrdec4step
        .global dynomem_abi_64bitstruct_seelknonzrdec4step
        .global dynomem_abi_nnbitstruct_seelknonzrdec4step
        // seelknonzrdecdecNstep subroutines --- 8 at a time
        .global dynomem_abi_08bitstruct_seelknonzrdec8step
        .global dynomem_abi_16bitstruct_seelknonzrdec8step
        .global dynomem_abi_32bitstruct_seelknonzrdec8step
        .global dynomem_abi_64bitstruct_seelknonzrdec8step
        .global dynomem_abi_nnbitstruct_seelknonzrdec8step
    .endif

.section dynomem_bytelen_utils

    .ifdef Ldynomem_abi_premultlen
        /*  premultlen calculates the length of an array in bytes */
        .global dynomem_abi_08bitstruct_premultlen
        .global dynomem_abi_16bitstruct_premultlen
        .global dynomem_abi_32bitstruct_premultlen
        .global dynomem_abi_64bitstruct_premultlen
        .global dynomem_abi_nnbitstruct_premultlen
    .endif

    .ifdef Ldynomem_abi_getalign
        /*  getalign calculates the padding range base on the alignment. */
        .global dynomem_abi_08bitstruct_getalign
        .global dynomem_abi_16bitstruct_getalign
        .global dynomem_abi_32bitstruct_getalign
        .global dynomem_abi_64bitstruct_getalign
        .global dynomem_abi_nnbitstruct_getalign
    .endif

.text


dynomem_abi_08bitstruct_seekzrinc2step: 
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


dynomem_abi_16bitstruct_seekzrinc2step: 
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

dynomem_abi_32bitstruct_seekzrinc2step: 
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

dynomem_abi_64bitstruct_seekzrinc2step: 
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

dynomem_abi_nnbitstruct_seekzrinc2step: 
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


// extern usize dynomem_abi_premultlen(usize num)
dynomem_abi_premultlen:
    sub ROUNDUP_P2, ROUNDUP_P2, #1
    shr ROUNDUP_P2, ROUNDUP_P2, #4
    shr ROUNDUP_P2, ROUNDUP_P2, #8
    shr ROUNDUP_P2, ROUNDUP_P2, #16
    shr ROUNDUP_P2, ROUNDUP_P2, #32
    shr ROUNDUP_P2, ROUNDUP_P2, #64
    add ROUNDUP_P2, ROUNDUP_P2, #1

    ret