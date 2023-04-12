.section seekzrinc
Ldynomem_abi_seekzrincnstep:
    /*
        unsigned long dynomem_abi_*_seekzrincNstep(void *addr, unsigned char offset, unsigned int maxn);
        unsigned long dynomem_abi_nnbitstruct_seekzrincNstep(void *addr, unsigned char offset, unsigned int maxn, unsigned char alignbytes);
    */

    .section seekzrinc8bit
        /*     unsigned long dynomem_abi_08bitstruct_seekzrinc1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrinc1step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.eq 1f
            b.ne 2f
        2:
            ldrb BYTEW1, [TMPADDR], #1
            add INDEX, INDEX, #1

            tst BYTEW1, BYTEW1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR
            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrinc2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrinc2step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #2
            add INDEX, INDEX, #2
            
            tst BYTEW1, BYTEW2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrinc4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrinc4step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #2
            ldp BYTEW3, BYTEW4, [TMPADDR], #2
            add INDEX, INDEX, #4

            and TMPBYTEW1, BYTEW1, BYTEW2
            and TMPBYTEW2, BYTEW3, BYTEW4
            tst TMPBYTEW2, TMPBYTEW1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrinc8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrinc8step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #2
            ldp BYTEW3, BYTEW4, [TMPADDR], #2
            ldp BYTEW5, BYTEW6, [TMPADDR], #2
            ldp BYTEW7, BYTEW8, [TMPADDR], #2
            add INDEX, INDEX, #8

            and TMPBYTEW1, BYTEW1, BYTEW2
            and TMPBYTEW2, BYTEW3, BYTEW4
            and TMPBYTEW1, TMPBYTEW1, BYTEW5
            and TMPBYTEW1, TMPBYTEW1, BYTEW6
            and TMPBYTEW2, TMPBYTEW2, BYTEW7
            and TMPBYTEW2, TMPBYTEW2, BYTEW8

            tst TMPBYTEW2, TMPBYTEW1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX4, lsr #6
            clz BYTEW5, BYTEW5
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX5, lsr #6
            clz BYTEW6, BYTEW6
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX6, lsr #6
            clz BYTEW7, BYTEW7
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX7, lsr #6
            clz BYTEW8, BYTEW8
            sub SEEKZRINC_RET, SEEKZRINC_RET, BYTEX8, lsr #6

            ret


    .section seekzrinc16bit

        /*     unsigned long dynomem_abi_16bitstruct_seekzrinc1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrinc1step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.eq 1f
            b.ne 2f
        2:
            ldrh HWORDW1, [TMPADDR], #2
            add INDEX, INDEX, #1

            tst HWORDW1, HWORDW1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, SEEKZRINC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrinc2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrinc2step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #4
            add INDEX, INDEX, #2
            
            tst HWORDW1, HWORDW2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrinc4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrinc4step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #4
            ldp HWORDW3, HWORDW4, [TMPADDR], #4
            add INDEX, INDEX, #4

            and TMPHWORDW1, HWORDW1, HWORDW2
            and TMPHWORDW2, HWORDW3, HWORDW4
            tst TMPHWORDW2, TMPHWORDW1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrinc8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrinc8step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #4
            ldp HWORDW3, HWORDW4, [TMPADDR], #4
            ldp HWORDW5, HWORDW6, [TMPADDR], #4
            ldp HWORDW7, HWORDW8, [TMPADDR], #4
            add INDEX, INDEX, #8

            and TMPHWORDW1, HWORDW1, HWORDW2
            and TMPHWORDW2, HWORDW3, HWORDW4
            and TMPHWORDW1, TMPHWORDW1, HWORDW5
            and TMPHWORDW1, TMPHWORDW1, HWORDW6
            and TMPHWORDW2, TMPHWORDW2, HWORDW7
            and TMPHWORDW2, TMPHWORDW2, HWORDW8

            tst TMPHWORDW2, TMPHWORDW1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX4, lsr #6
            clz HWORDW5, HWORDW5
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX5, lsr #6
            clz HWORDW6, HWORDW6
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX6, lsr #6
            clz HWORDW7, HWORDW7
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX7, lsr #6
            clz HWORDW8, HWORDW8
            sub SEEKZRINC_RET, SEEKZRINC_RET, HWORDX8, lsr #6

            ret


    .section seekzrinc32bit

        /*     unsigned long dynomem_abi_32bitstruct_seekzrinc1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrinc1step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.eq 1f
            b.ne 2f
        2:
            ldrw WORD1, [TMPADDR], #4
            add INDEX, INDEX, #1

            tst WORD1, WORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, SEEKZRINC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrinc2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrinc2step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #8
            add INDEX, INDEX, #8
            
            tst WORD1, WORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz WORD1, WORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrinc4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrinc4step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #8
            ldp WORD3, WORD4, [TMPADDR], #8
            add INDEX, INDEX, #4

            and TMPWORD1, WORD1, WORD2
            and TMPWORD2, WORD3, WORD4
            tst TMPWORD2, TMPWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz WORD1, WORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrinc8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrinc8step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #8
            ldp WORD3, WORD4, [TMPADDR], #8
            ldp WORD5, WORD6, [TMPADDR], #8
            ldp WORD7, WORD8, [TMPADDR], #8
            add INDEX, INDEX, #8

            and TMPWORD1, WORD1, WORD2
            and TMPWORD2, WORD3, WORD4
            and TMPWORD1, TMPWORD1, WORD5
            and TMPWORD1, TMPWORD1, WORD6
            and TMPWORD2, TMPWORD2, WORD7
            and TMPWORD2, TMPWORD2, WORD8

            tst TMPWORD2, TMPWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz WORD1, WORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD4, lsr #6
            clz WORD5, WORD5
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD5, lsr #6
            clz WORD6, WORD6
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD6, lsr #6
            clz WORD7, WORD7
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD7, lsr #6
            clz WORD8, WORD8
            sub SEEKZRINC_RET, SEEKZRINC_RET, WORD8  , lsr #6

            ret


    .section seekzrinc64bit

        /*     unsigned long dynomem_abi_64bitstruct_seekzrinc1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrinc1step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR], #8
            add INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, SEEKZRINC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrinc2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrinc2step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #16
            add INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrinc4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrinc4step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #16
            ldp DWORD3, DWORD4, [TMPADDR], #16
            add INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrinc8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrinc8step:
            mov TMPADDR, SEEKZRINC_ADDR
            mov INDEX, SEEKZRINC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #16
            ldp DWORD3, DWORD4, [TMPADDR], #16
            ldp DWORD5, DWORD6, [TMPADDR], #16
            ldp DWORD7, DWORD8, [TMPADDR], #16
            add INDEX, INDEX, #8

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            and TMPDWORD1, TMPDWORD1, DWORD5
            and TMPDWORD1, TMPDWORD1, DWORD6
            and TMPDWORD2, TMPDWORD2, DWORD7
            and TMPDWORD2, TMPDWORD2, DWORD8

            tst TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD8  , lsr #6

            ret

    .section seekzrincnnbit
         /*     unsigned long dynomem_abi_nnbitstruct_seekzrinc1step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrinc1step:
            mov TMPADDR, SEEKZRINC_ADDR
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            add INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, SEEKZRINC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrinc2step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrinc2step:
            mov TMPADDR, SEEKZRINC_ADDR
            and SPARE, INDEX, #1
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
            shl SEEKZRINC_ALIGNBYTES, SEEKZRINC_ALIGNBYTES, #1
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            add INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrinc4step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrinc4step:
            mov TMPADDR, SEEKZRINC_ADDR
            and SPARE, INDEX, #3
            shl SEEKZRINC_ADDR, SEEKZRINC_ADDR, SEEKZRINC_OFFSET
            shl SEEKZRINC_ALIGNBYTES, SEEKZRINC_ALIGNBYTES, #1
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            add INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrinc8step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrinc8step:
            mov TMPADDR, SEEKZRINC_ADDR
            and SPARE, SEEKZRINC_ALIGNBYTES, #7
            shl SEEKZRINC_ALIGNBYTES, SEEKZRINC_ALIGNBYTES, #1
        1:    
            cmp INDEX, SEEKZRINC_MAXN
            b.ge 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            ldp DWORD5, DWORD6, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            ldp DWORD7, DWORD8, [TMPADDR, SEEKZRINC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRINC_ALIGNBYTES
            add INDEX, INDEX, #8

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            and TMPDWORD1, TMPDWORD1, DWORD5
            and TMPDWORD1, TMPDWORD1, DWORD6
            and TMPDWORD2, TMPDWORD2, DWORD7
            and TMPDWORD2, TMPDWORD2, DWORD8

            tst TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRINC_RET, TMPADDR, SEEKZRINC_ADDR

            clz DWORD1, DWORD1
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKZRINC_RET, SEEKZRINC_RET, DWORD8, lsr #6

            ret


    .section 


.section seekzrinc_aliases
.ifdef Ldynomem_abi_seekzrincnstep:
    SEEKZRINC_ADDR .req x0
    SEEKZRINC_OFFSET .req x1
    SEEKZRINC_MAXN .req x1
    SEEKZRINC_ALIGNBYTES .req x2
    SEEKZRINC_RET .req x0
.endif