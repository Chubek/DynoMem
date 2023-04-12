.section seekzrdec
Ldynomem_abi_seekzrdecnstep:
    /*
        unsigned long dynomem_abi_*_seekzrdecNstep(void *addr, unsigned char offset, unsigned int maxn);
        unsigned long dynomem_abi_nnbitstruct_seekzrdecNstep(void *addr, unsigned char offset, unsigned int maxn, unsigned char alignbytes);
    */

    .section seekzrdec8bit
        /*     unsigned long dynomem_abi_08bitstruct_seekzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrdec1step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrb BYTEW1, [TMPADDR], #-1
            sub INDEX, INDEX, #1

            tst BYTEW1, BYTEW1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrdec2step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            sub INDEX, INDEX, #2
            
            tst BYTEW1, BYTEW2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrdec4step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            ldp BYTEW3, BYTEW4, [TMPADDR], #-2
            sub INDEX, INDEX, #4

            and TMPBYTEW1, BYTEW1, BYTEW2
            and TMPBYTEW2, BYTEW3, BYTEW4
            tst TMPBYTEW2, TMPBYTEW1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekzrdec8step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            ldp BYTEW3, BYTEW4, [TMPADDR], #-2
            ldp BYTEW5, BYTEW6, [TMPADDR], #-2
            ldp BYTEW7, BYTEW8, [TMPADDR], #-2
            sub INDEX, INDEX, #8

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
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz BYTEW1, BYTEW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX4, lsr #6
            clz BYTEW5, BYTEW5
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX5, lsr #6
            clz BYTEW6, BYTEW6
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX6, lsr #6
            clz BYTEW7, BYTEW7
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX7, lsr #6
            clz BYTEW8, BYTEW8
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, BYTEX8, lsr #6

            ret


    .section seekzrdec16bit

        /*     unsigned long dynomem_abi_16bitstruct_seekzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrdec1step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrh HWORDW1, [TMPADDR], #-2
            sub INDEX, INDEX, #1

            tst HWORDW1, HWORDW1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrdec2step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #-4
            sub INDEX, INDEX, #2
            
            tst HWORDW1, HWORDW2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrdec4step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #-4
            ldp HWORDW3, HWORDW4, [TMPADDR], #-4
            sub INDEX, INDEX, #4

            and TMPHWORDW1, HWORDW1, HWORDW2
            and TMPHWORDW2, HWORDW3, HWORDW4
            tst TMPHWORDW2, TMPHWORDW1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekzrdec8step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #-4
            ldp HWORDW3, HWORDW4, [TMPADDR], #-4
            ldp HWORDW5, HWORDW6, [TMPADDR], #-4
            ldp HWORDW7, HWORDW8, [TMPADDR], #-4
            sub INDEX, INDEX, #8

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
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz HWORDW1, HWORDW1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX4, lsr #6
            clz HWORDW5, HWORDW5
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX5, lsr #6
            clz HWORDW6, HWORDW6
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX6, lsr #6
            clz HWORDW7, HWORDW7
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX7, lsr #6
            clz HWORDW8, HWORDW8
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, HWORDX8, lsr #6

            ret


    .section seekzrdec32bit

        /*     unsigned long dynomem_abi_32bitstruct_seekzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrdec1step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrw WORD1, [TMPADDR], #-4
            sub INDEX, INDEX, #1

            tst WORD1, WORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrdec2step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #-8
            sub INDEX, INDEX, #-8
            
            tst WORD1, WORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrdec4step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
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
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekzrdec8step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
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
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD4, lsr #6
            clz WORD5, WORD5
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD5, lsr #6
            clz WORD6, WORD6
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD6, lsr #6
            clz WORD7, WORD7
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD7, lsr #6
            clz WORD8, WORD8
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, WORD8  , lsr #6

            ret


    .section seekzrdec64bit

        /*     unsigned long dynomem_abi_64bitstruct_seekzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrdec1step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR], #-8
            sub INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrdec2step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #-16
            sub INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrdec4step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
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
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekzrdec8step:
            mov TMPADDR, SEEKZRDEC_ADDR
            mov INDEX, SEEKZRDEC_MAXN
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
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD8  , lsr #6

            ret

    .section seekzrdecnnbit
         /*     unsigned long dynomem_abi_nnbitstruct_seekzrdec1step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrdec1step:
            mov TMPADDR, SEEKZRDEC_ADDR
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrdec2step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrdec2step:
            mov TMPADDR, SEEKZRDEC_ADDR
            and SPARE, INDEX, #1
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
            shl SEEKZRDEC_ALIGNBYTES, SEEKZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            sub INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrdec4step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrdec4step:
            mov TMPADDR, SEEKZRDEC_ADDR
            and SPARE, INDEX, #3
            shl SEEKZRDEC_ADDR, SEEKZRDEC_ADDR, SEEKZRDEC_OFFSET
            shl SEEKZRDEC_ALIGNBYTES, SEEKZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekzrdec8step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekzrdec8step:
            mov TMPADDR, SEEKZRDEC_ADDR
            and SPARE, SEEKZRDEC_ALIGNBYTES, #7
            shl SEEKZRDEC_ALIGNBYTES, SEEKZRDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            ldp DWORD5, DWORD6, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            ldp DWORD7, DWORD8, [TMPADDR, SEEKZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #8

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
            sub SEEKZRDEC_RET, SEEKZRDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKZRDEC_RET, SEEKZRDEC_RET, DWORD8, lsr #6

            ret


    .section 


.section seekzrdec_aliases
.ifdef Ldynomem_abi_seekzrdecnstep:
    SEEKZRDEC_ADDR .req x0
    SEEKZRDEC_OFFSET .req x1
    SEEKZRDEC_MAXN .req x1
    SEEKZRDEC_ALIGNBYTES .req x2
    SEEKZRDEC_RET .req x0
.endif