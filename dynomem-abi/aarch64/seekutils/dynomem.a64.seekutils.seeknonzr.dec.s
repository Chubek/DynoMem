.section seeknonzrdec
Ldynomem_abi_seeknonzrdecnstep:
    /*
        unsigned long dynomem_abi_*_seeknonzrdecNstep(void *addr, unsigned char offset, unsigned int maxn);
        unsigned long dynomem_abi_nnbitstruct_seeknonzrdecNstep(void *addr, unsigned char offset, unsigned int maxn, unsigned char alignbytes);
    */

    .section seeknonzrdec8bit
        /*     unsigned long dynomem_abi_08bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrb BYTEW1, [TMPADDR], #-1
            sub INDEX, INDEX, #1

            tst BYTEW1, BYTEW1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_08bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            sub INDEX, INDEX, #2
            
            tst BYTEW1, BYTEW2
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and BYTEW1, BYTEW1, #1
            eor BYTEW1, BYTEW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW1
            and BYTEW2, BYTEW2, #1
            eor BYTEW2, BYTEW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW2

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            ldp BYTEW3, BYTEW4, [TMPADDR], #-2
            sub INDEX, INDEX, #4

            and TMPBYTEW1, BYTEW1, BYTEW2
            and TMPBYTEW2, BYTEW3, BYTEW4
            tst TMPBYTEW2, TMPBYTEW1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and BYTEW1, BYTEW1, #1
            eor BYTEW1, BYTEW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW1
            and BYTEW2, BYTEW2, #1
            eor BYTEW2, BYTEW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW2
            and BYTEW3, BYTEW3, #1
            eor BYTEW3, BYTEW3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW3
            and BYTEW4, BYTEW4, #1
            eor BYTEW4, BYTEW4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW4

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and BYTEW1, BYTEW1, #1
            eor BYTEW1, BYTEW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW1
            and BYTEW2, BYTEW2, #1
            eor BYTEW2, BYTEW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW2
            and BYTEW3, BYTEW3, #1
            eor BYTEW3, BYTEW3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW3
            and BYTEW4, BYTEW4, #1
            eor BYTEW4, BYTEW4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW4
            and BYTEW5, BYTEW5, #1
            eor BYTEW5, BYTEW5, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW5            
            and BYTEW6, BYTEW6, #1
            eor BYTEW6, BYTEW6, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW6            
            and BYTEW7, BYTEW7, #1
            eor BYTEW7, BYTEW7, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW7            
            and BYTEW8, BYTEW8, #1
            eor BYTEW8, BYTEW8, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, BYTEW8

            ret


    .section seeknonzrdec16bit

        /*     unsigned long dynomem_abi_16bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            mov INDEX, SEEKNONZRDEC_MAXN
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrh HWORDW1, [TMPADDR], #-2
            sub INDEX, INDEX, #1

            tst HWORDW1, HWORDW1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_16bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            ldp HWORDW1, HWORDW2, [TMPADDR], #-4
            sub INDEX, INDEX, #2
            
            tst HWORDW1, HWORDW2
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and HWORDW1, HWORDW1, #1
            eor HWORDW1, HWORDW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW1
            and HWORDW2, HWORDW2, #1
            eor HWORDW2, HWORDW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW2

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            ldp HWORDW1, HWORDW2, [TMPADDR], #-4
            ldp HWORDW3, HWORDW4, [TMPADDR], #-4
            sub INDEX, INDEX, #4

            and TMPHWORDW1, HWORDW1, HWORDW2
            and TMPHWORDW2, HWORDW3, HWORDW4
            tst TMPHWORDW2, TMPHWORDW1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and HWORDW1, HWORDW1, #1
            eor HWORDW1, HWORDW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW1
            and HWORDW2, HWORDW2, #1
            eor HWORDW2, HWORDW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW2
            and HWORDW3, HWORDW3, #1
            eor HWORDW3, HWORDW3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW3
            and HWORDW4, HWORDW4, #1
            eor HWORDW4, HWORDW4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW4

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            b.eq 1b
            b.ne 1f 
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and HWORDW1, HWORDW1, #1
            eor HWORDW1, HWORDW1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW1
            and HWORDW2, HWORDW2, #1
            eor HWORDW2, HWORDW2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW2
            and HWORDW3, HWORDW3, #1
            eor HWORDW3, HWORDW3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW3
            and HWORDW4, HWORDW4, #1
            eor HWORDW4, HWORDW4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW4
            and HWORDW5, HWORDW5, #1
            eor HWORDW5, HWORDW5, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW5            
            and HWORDW6, HWORDW6, #1
            eor HWORDW6, HWORDW6, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW6            
            and HWORDW7, HWORDW7, #1
            eor HWORDW7, HWORDW7, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW7            
            and HWORDW8, HWORDW8, #1
            eor HWORDW8, HWORDW8, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, HWORDW8

            ret


    .section seeknonzrdec32bit

        /*     unsigned long dynomem_abi_32bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_32bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            
            tst WORD1, WORD2
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and WORD1, WORD1, #1
            eor WORD1, WORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD1
            and WORD2, WORD2, #1
            eor WORD2, WORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD2

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and WORD1, WORD1, #1
            eor WORD1, WORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD1
            and WORD2, WORD2, #1
            eor WORD2, WORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD2
            and WORD3, WORD3, #1
            eor WORD3, WORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD3
            and WORD4, WORD4, #1
            eor WORD4, WORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD4

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and WORD1, WORD1, #1
            eor WORD1, WORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD1
            and WORD2, WORD2, #1
            eor WORD2, WORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD2
            and WORD3, WORD3, #1
            eor WORD3, WORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD3
            and WORD4, WORD4, #1
            eor WORD4, WORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD4
            and WORD5, WORD5, #1
            eor WORD5, WORD5, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD5            
            and WORD6, WORD6, #1
            eor WORD6, WORD6, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD6            
            and WORD7, WORD7, #1
            eor WORD7, WORD7, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD7            
            and WORD8, WORD8, #1
            eor WORD8, WORD8, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, WORD8  

            ret


    .section seeknonzrdec64bit

        /*     unsigned long dynomem_abi_64bitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_64bitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2
            and DWORD3, DWORD3, #1
            eor DWORD3, DWORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD3
            and DWORD4, DWORD4, #1
            eor DWORD4, DWORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD4

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn)      */
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2
            and DWORD3, DWORD3, #1
            eor DWORD3, DWORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD3
            and DWORD4, DWORD4, #1
            eor DWORD4, DWORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD4
            and DWORD5, DWORD5, #1
            eor DWORD5, DWORD5, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD5            
            and DWORD6, DWORD6, #1
            eor DWORD6, DWORD6, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD6            
            and DWORD7, DWORD7, #1
            eor DWORD7, DWORD7, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD7            
            and DWORD8, DWORD8, #1
            eor DWORD8, DWORD8, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD8  

            ret

    .section seeknonzrdecnnbit
         /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec1step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seeknonzrdec1step:
            mov TMPADDR, SEEKNONZRDEC_ADDR
            shl SEEKNONZRDEC_ADDR, SEEKNONZRDEC_ADDR, SEEKNONZRDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #1

            tst DWORD1, DWORD1
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec2step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
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
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, 2
            
            tst DWORD1, DWORD2
            b.eq 1b
            b.ne 1f
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec4step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
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
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            sub INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            tst TMPDWORD2, TMPDWORD1
            b.eq 1b
            b.ne 1f    
        1:
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2
            and DWORD3, DWORD3, #1
            eor DWORD3, DWORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD3
            and DWORD4, DWORD4, #1
            eor DWORD4, DWORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD4

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seeknonzrdec8step(void *addr, unsigned char offset, unsigned int maxn, unsigned int nbytes)      */
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
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD5, DWORD6, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
            ldp DWORD7, DWORD8, [TMPADDR, SEEKNONZRDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKNONZRDEC_ALIGNBYTES
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
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_ADDR, TMPADDR

            and DWORD1, DWORD1, #1
            eor DWORD1, DWORD1, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD1
            and DWORD2, DWORD2, #1
            eor DWORD2, DWORD2, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD2
            and DWORD3, DWORD3, #1
            eor DWORD3, DWORD3, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD3
            and DWORD4, DWORD4, #1
            eor DWORD4, DWORD4, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD4
            and DWORD5, DWORD5, #1
            eor DWORD5, DWORD5, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD5            
            and DWORD6, DWORD6, #1
            eor DWORD6, DWORD6, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD6            
            and DWORD7, DWORD7, #1
            eor DWORD7, DWORD7, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD7            
            and DWORD8, DWORD8, #1
            eor DWORD8, DWORD8, #1
            sub SEEKNONZRDEC_RET, SEEKNONZRDEC_RET, DWORD8            

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