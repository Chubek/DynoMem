.section seeknonzrdec
Ldynomem_abi_seeknonzrdecnstep:
    /*
        void *dynomem_abi_*_seeknonzrdecNstep(void *addr, unsigned char offset, unsigned int maxn);
        void *dynomem_abi_nnbitstruct_seeknonzrdecNstep(void *addr, unsigned char offset, unsigned int maxn, unsigned char alignbytes);
    */

    .section seeknonzrdec8bit
        /*     void *dynomem_abi_08bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrb BYTE1, [TMPADDR], #-1
            sub INDEX, INDEX, #1

            tst BYTE1, BYTE1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret

        /*     void *dynomem_abi_08bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seeknonzrdec2step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTE1, BYTE2, [TMPADDR], #-2
            sub INDEX, INDEX, #2
            
            tst BYTE1, BYTE1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_08bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seeknonzrdec4step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTE1, BYTE2, [TMPADDR], #-2
            ldp BYTE3, BYTE4, [TMPADDR], #-2
            sub INDEX, INDEX, #4

            and TMPBYTE1, BYTE1, BYTE2
            and TMPBYTE2, BYTE3, BYTE4
            tst TMPBYTE2, TMPBYTE1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_08bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seeknonzrdec8step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTE1, BYTE2, [TMPADDR], #-2
            ldp BYTE3, BYTE4, [TMPADDR], #-2
            ldp BYTE5, BYTE6, [TMPADDR], #-2
            ldp BYTE7, BYTE8, [TMPADDR], #-2
            sub INDEX, INDEX, #8

            and TMPBYTE1, BYTE1, BYTE2
            and TMPBYTE2, BYTE3, BYTE4
            and TMPBYTE1, TMPBYTE1, BYTE5
            and TMPBYTE1, TMPBYTE1, BYTE6
            and TMPBYTE2, TMPBYTE2, BYTE7
            and TMPBYTE2, TMPBYTE2, BYTE8

            tst TMPBYTE2, TMPBYTE1
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret


    .section seeknonzrdec16bit

        /*     void *dynomem_abi_16bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrh HWORD1, [TMPADDR], #-2
            sub INDEX, INDEX, #1

            tst HWORD1, HWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     void *dynomem_abi_16bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seeknonzrdec2step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORD1, HWORD2, [TMPADDR], #-4
            sub INDEX, INDEX, #2
            
            tst HWORD1, HWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_16bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seeknonzrdec4step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORD1, HWORD2, [TMPADDR], #-4
            ldp HWORD3, HWORD4, [TMPADDR], #-4
            sub INDEX, INDEX, #4

            and TMPHWORD1, HWORD1, HWORD2
            and TMPHWORD2, HWORD3, HWORD4
            tst TMPHWORD2, TMPHWORD1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_16bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seeknonzrdec8step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORD1, HWORD2, [TMPADDR], #-4
            ldp HWORD3, HWORD4, [TMPADDR], #-4
            ldp HWORD5, HWORD6, [TMPADDR], #-4
            ldp HWORD7, HWORD8, [TMPADDR], #-4
            sub INDEX, INDEX, #8

            and TMPHWORD1, HWORD1, HWORD2
            and TMPHWORD2, HWORD3, HWORD4
            and TMPHWORD1, TMPHWORD1, HWORD5
            and TMPHWORD1, TMPHWORD1, HWORD6
            and TMPHWORD2, TMPHWORD2, HWORD7
            and TMPHWORD2, TMPHWORD2, HWORD8

            tst TMPHWORD2, TMPHWORD1
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret


    .section seeknonzrdec32bit

        /*     void *dynomem_abi_32bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrw WORD1, [TMPADDR], #-4
            sub INDEX, INDEX, #1

            tst WORD1, WORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     void *dynomem_abi_32bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seeknonzrdec2step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #-8
            sub INDEX, INDEX, #-8
            
            tst WORD1, WORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_32bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seeknonzrdec4step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #-8
            ldp WORD3, WORD4, [TMPADDR], #-8
            sub INDEX, INDEX, #4

            and TMPWORD1, WORD1, WORD2
            and TMPWORD2, WORD3, WORD4
            tst TMPWORD2, TMPWORD1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_32bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seeknonzrdec8step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #-8
            ldp WORD3, WORD4, [TMPADDR], #-8
            ldp WORD5, WORD6, [TMPADDR], #-8
            ldp WORD7, WORD8, [TMPADDR], #-8
            sub INDEX, INDEX, #8

            and TMPWORD1, WORD1, WORD2
            and TMPWORD2, WORD3, WORD4
            and TMPWORD1, TMPWORD1, WORD5
            and TMPWORD1, TMPWORD1, WORD6
            and TMPWORD2, TMPWORD2, WORD7
            and TMPWORD2, TMPWORD2, WORD8

            tst TMPWORD2, TMPWORD1
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret


    .section seeknonzrdec64bit

        /*     void *dynomem_abi_64bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR], #-8
            sub INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     void *dynomem_abi_64bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seeknonzrdec2step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #-16
            sub INDEX, INDEX, #-16
            
            tst DWORD1, DWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR

            ret

        /*     void *dynomem_abi_64bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seeknonzrdec4step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #-16
            ldp DWORD3, DWORD4, [TMPADDR], #-16
            sub INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret

        /*     void *dynomem_abi_64bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seeknonzrdec8step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #-16
            ldp DWORD3, DWORD4, [TMPADDR], #-16
            ldp DWORD5, DWORD6, [TMPADDR], #-16
            ldp DWORD7, DWORD8, [TMPADDR], #-16
            sub INDEX, INDEX, #8

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            and TMPDWORD1, TMPDWORD1, DWORD5
            and TMPDWORD1, TMPDWORD1, DWORD6
            and TMPDWORD2, TMPDWORD2, DWORD7
            and TMPDWORD2, TMPDWORD2, DWORD8

            tst TMPDWORD2, TMPDWORD1
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret

    .section seeknonzrdecnnbit
         /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec1step(unsigned long addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_nnbitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR], #-8
            sub INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec2step(unsigned long addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_nnbitstruct_seeknonzrdec2step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            and SPARE, INDEX, #1
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
            shl SEEKNONZRDEC_ALIGNBYTES, SEEKNONZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #-16
            
            tst DWORD1, DWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec4step(unsigned long addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_nnbitstruct_seeknonzrdec4step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            and SPARE, INDEX, #3
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
            shl SEEKNONZRDEC_ALIGNBYTES, SEEKNONZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec8step(unsigned long addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_nnbitstruct_seeknonzrdec8step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            and SPARE, SEEKNONZRDEC_ALIGNBYTES, #7
            shl SEEKNONZRDEC_ALIGNBYTES, SEEKNONZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD5, DWORD6, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD7, DWORD8, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            add TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #8

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            and TMPDWORD1, TMPDWORD1, DWORD5
            and TMPDWORD1, TMPDWORD1, DWORD6
            and TMPDWORD2, TMPDWORD2, DWORD7
            and TMPDWORD2, TMPDWORD2, DWORD8

            tst TMPDWORD2, TMPDWORD1
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNZRDEC_RET, SEEKNZRDEC_ADDR, TMPADDR
            ret


    .section 


.section seeknonzrdec_aliases
.ifdef Ldynomem_abi_seeknonzrdecnstep:
    SEEKNONZRDEC_ADDR .req x0
    SEEKNONZRDEC_OFFSET .req x1
    SEEKNONZRDEC_MAXN .req x1
    SEEKNONZRDEC_ALIGNBYTES .req x2
    SEEKNONZRDEC_RET .req x0
.endif