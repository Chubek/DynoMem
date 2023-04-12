.section seekvaldec
Ldynomem_abi_seekvaldecnstep:
    /*
        unsigned long dynomem_abi_*_seekvaldecNstep(void *addr, unsigned char offset, unsigned int maxn);
        unsigned long dynomem_abi_nnbitstruct_seekvaldecNstep(void *addr, unsigned char offset, unsigned int maxn, void val, unsigned char alignbytes);
    */

    .section seekvaldec8bit
        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec1step(void *addr, unsigned char offset, unsigned char val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec1step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrb BYTEW1, [TMPADDR], #-1
            sub INDEX, INDEX, #1

            cmp BYTEW1, SEEKVALDEC_VALW
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec2step(void *addr, unsigned char offset, unsigned char val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec2step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE

            strb SEEKVALDEC_VALW, [sp, #-1]
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            orr SEEKVALDEC_VALW, SEEKVALDEC_VALW, SEEKVALDEC_VALW, lsl #8
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            sub INDEX, INDEX, #2
            
            orr TMPBYTEW1, BYTEW1, BYTEW2, lsl #8
            cmp TMPBYTEW1, SEEKVALDEC_VAL
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            ldrb SEEKVALDEC_VALW, [sp], #1
            sub BYTEW1, BYTEW1, SEEKVALDEC_VALW
            sub BYTEW2, BYTEW2, SEEKVALDEC_VALW

            clz BYTEW1, BYTEW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec4step(void *addr, unsigned char offset, unsigned char val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec4step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE                    
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET

            strb SEEKVALDEC_VALW, [sp, #-1]
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            orr SEEKVALDEC_VALW, SEEKVALDEC_VALW, SEEKVALDEC_VALW, lsl #8
            orr SEEKVALDEC_VALW, SEEKVALDEC_VALW, SEEKVALDEC_VALW, lsl #8
            orr SEEKVALDEC_VALW, SEEKVALDEC_VALW, SEEKVALDEC_VALW, lsl #8
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp BYTEW1, BYTEW2, [TMPADDR], #-2
            ldp BYTEW3, BYTEW4, [TMPADDR], #-2
            sub INDEX, INDEX, #4

            orr TMPBYTEW1, BYTEW1, BYTEW2, lsl #8
            orr TMPBYTEW2, BYTEW3, BYTEW4, lsl #8
            orr TMPBYTEW2, TMPBYTEW2, TMPBYTEW1, lsl #16
            cmp TMPBYTEW2, SEEKVALDEC_VALW
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            ldrb SEEKVALDEC_VALW, [sp], #1
            sub BYTEW1, BYTEW1, SEEKVALDEC_VALW
            sub BYTEW2, BYTEW2, SEEKVALDEC_VALW
            sub BYTEW3, BYTEW3, SEEKVALDEC_VALW
            sub BYTEW4, BYTEW4, SEEKVALDEC_VALW

            clz BYTEW1, BYTEW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec8step(void *addr, unsigned char offset, unsigned char val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec8step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #7
            add INDEX, INDEX, SPARE

            strb SEEKVALDEC_VALX, [sp, #-1]
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
            orr SEEKVALDEC_VALX, SEEKVALDEC_VALX, SEEKVALDEC_VALX, lsl #8
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

            and TMPBYTEX1, BYTEX1, BYTEX2
            and TMPBYTEX2, BYTEX3, BYTEX4
            and TMPBYTEX1, TMPBYTEX1, BYTEX5
            and TMPBYTEX1, TMPBYTEX1, BYTEX6
            and TMPBYTEX2, TMPBYTEX2, BYTEX7
            and TMPBYTEX2, TMPBYTEX2, BYTEX8

            cmp TMPBYTEX2, TMPBYTEX1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            ldrb SEEKVALDEC_VALW, [sp], #1
            sub BYTEW1, BYTEW1, SEEKVALDEC_VALW
            sub BYTEW2, BYTEW2, SEEKVALDEC_VALW
            sub BYTEW3, BYTEW3, SEEKVALDEC_VALW
            sub BYTEW4, BYTEW4, SEEKVALDEC_VALW
            sub BYTEW5, BYTEW5, SEEKVALDEC_VALW
            sub BYTEW6, BYTEW6, SEEKVALDEC_VALW
            sub BYTEW7, BYTEW7, SEEKVALDEC_VALW
            sub BYTEW8, BYTEW8, SEEKVALDEC_VALW

            clz BYTEW1, BYTEW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX1, lsr #6
            clz BYTEW2, BYTEW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX2, lsr #6
            clz BYTEW3, BYTEW3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX3, lsr #6
            clz BYTEW4, BYTEW4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX4, lsr #6
            clz BYTEW5, BYTEW5
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX5, lsr #6
            clz BYTEW6, BYTEW6
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX6, lsr #6
            clz BYTEW7, BYTEW7
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX7, lsr #6
            clz BYTEW8, BYTEW8
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, BYTEX8, lsr #6

            ret


    .section seekvaldec16bit

        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec1step(void *addr, unsigned char offset, unsigned short val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec1step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrb HWORDW1, [TMPADDR], #-1
            sub INDEX, INDEX, #1

            cmp HWORDW1, SEEKVALDEC_VALW
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR
            ret

        /*     unsigned long dynomem_abi_08bitstruct_seekvaldec2step(void *addr, unsigned char offset, unsigned short val, unsigned int maxn)      */
        dynomem_abi_08bitstruct_seekvaldec2step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE

            strh SEEKVALDEC_VALW, [sp, #-1]
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            orr SEEKVALDEC_VALW, SEEKVALDEC_VALW, SEEKVALDEC_VALW, lsl #16
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp HWORDW1, HWORDW2, [TMPADDR], #-2
            sub INDEX, INDEX, #2
            
            orr TMPHWORDW1, HWORDW1, HWORDW2, lsl #16
            cmp TMPHWORDW1, SEEKVALDEC_VAL
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            ldrh SEEKVALDEC_VALW, [sp], #1
            sub HWORDW1, HWORDW1, SEEKVALDEC_VALW
            sub HWORDW2, HWORDW2, SEEKVALDEC_VALW

            clz HWORDW1, HWORDW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX2, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekvaldec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekvaldec4step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
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
            cmp TMPHWORDW2, TMPHWORDW1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz HWORDW1, HWORDW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX4, lsr #6

            ret

        /*     unsigned long dynomem_abi_16bitstruct_seekvaldec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_16bitstruct_seekvaldec8step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
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

            cmp TMPHWORDW2, TMPHWORDW1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz HWORDW1, HWORDW1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX1, lsr #6
            clz HWORDW2, HWORDW2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX2, lsr #6
            clz HWORDW3, HWORDW3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX3, lsr #6
            clz HWORDW4, HWORDW4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX4, lsr #6
            clz HWORDW5, HWORDW5
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX5, lsr #6
            clz HWORDW6, HWORDW6
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX6, lsr #6
            clz HWORDW7, HWORDW7
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX7, lsr #6
            clz HWORDW8, HWORDW8
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, HWORDX8, lsr #6

            ret


    .section seekvaldec32bit

        /*     unsigned long dynomem_abi_32bitstruct_seekvaldec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekvaldec1step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldrw WORD1, [TMPADDR], #-4
            sub INDEX, INDEX, #1

            cmp WORD1, WORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekvaldec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekvaldec2step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp WORD1, WORD2, [TMPADDR], #-8
            sub INDEX, INDEX, #-8
            
            cmp WORD1, WORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekvaldec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekvaldec4step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
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
            cmp TMPWORD2, TMPWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_32bitstruct_seekvaldec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_32bitstruct_seekvaldec8step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
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

            cmp TMPWORD2, TMPWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz WORD1, WORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD1, lsr #6
            clz WORD2, WORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD2, lsr #6
            clz WORD3, WORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD3, lsr #6
            clz WORD4, WORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD4, lsr #6
            clz WORD5, WORD5
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD5, lsr #6
            clz WORD6, WORD6
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD6, lsr #6
            clz WORD7, WORD7
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD7, lsr #6
            clz WORD8, WORD8
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, WORD8  , lsr #6

            ret


    .section seekvaldec64bit

        /*     unsigned long dynomem_abi_64bitstruct_seekvaldec1step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekvaldec1step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR], #-8
            sub INDEX, INDEX, #1

            cmp DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekvaldec2step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekvaldec2step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #1
            add INDEX, INDEX, SPARE
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR], #-16
            sub INDEX, INDEX, 2
            
            cmp DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekvaldec4step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekvaldec4step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
            and SPARE, INDEX, #3
            add INDEX, INDEX, SPARE        
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
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
            cmp TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_64bitstruct_seekvaldec8step(void *addr, unsigned char offset, unsigned int maxn)      */
        dynomem_abi_64bitstruct_seekvaldec8step:
            mov TMPADDR, SEEKVALDEC_ADDR
            mov INDEX, SEEKVALDEC_MAXN
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

            cmp TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD8  , lsr #6

            ret

    .section seekvaldecnnbit
         /*     unsigned long dynomem_abi_nnbitstruct_seekvaldec1step(void *addr, unsigned char offset, unsigned int maxn, void val, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekvaldec1step:
            mov TMPADDR, SEEKVALDEC_ADDR
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
        1:    
            cmp INDEX, #0
            b.eq 1f
            b.ne 2f
        2:
            ldr DWORD1, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            sub INDEX, INDEX, #1

            cmp DWORD1, DWORD1
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, INDEX
            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekvaldec2step(void *addr, unsigned char offset, unsigned int maxn, void val, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekvaldec2step:
            mov TMPADDR, SEEKVALDEC_ADDR
            and SPARE, INDEX, #1
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            shl SEEKVALDEC_ALIGNBYTES, SEEKVALDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            sub INDEX, INDEX, 2
            
            cmp DWORD1, DWORD2
            b.ne 1b
            b.eq 1f
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekvaldec4step(void *addr, unsigned char offset, unsigned int maxn, void val, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekvaldec4step:
            mov TMPADDR, SEEKVALDEC_ADDR
            and SPARE, INDEX, #3
            shl SEEKVALDEC_ADDR, SEEKVALDEC_ADDR, SEEKVALDEC_OFFSET
            shl SEEKVALDEC_ALIGNBYTES, SEEKVALDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            sub INDEX, INDEX, #4

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            cmp TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f    
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD4, lsr #6

            ret

        /*     unsigned long dynomem_abi_nnbitstruct_seekvaldec8step(void *addr, unsigned char offset, unsigned int maxn, void val, unsigned int nbytes)      */
        dynomem_abi_nnbitstruct_seekvaldec8step:
            mov TMPADDR, SEEKVALDEC_ADDR
            and SPARE, SEEKVALDEC_ALIGNBYTES, #7
            shl SEEKVALDEC_ALIGNBYTES, SEEKVALDEC_ALIGNBYTES, #1
        1:    
            cmp INDEX, #0
            b.le 1f
            b.ne 2f
        2:
            ldp DWORD1, DWORD2, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            ldp DWORD3, DWORD4, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            ldp DWORD5, DWORD6, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            ldp DWORD7, DWORD8, [TMPADDR, SEEKVALDEC_ALIGNBYTES]
            sub TMPADDR, TMPADDR, SEEKVALDEC_ALIGNBYTES
            sub INDEX, INDEX, #8

            and TMPDWORD1, DWORD1, DWORD2
            and TMPDWORD2, DWORD3, DWORD4
            and TMPDWORD1, TMPDWORD1, DWORD5
            and TMPDWORD1, TMPDWORD1, DWORD6
            and TMPDWORD2, TMPDWORD2, DWORD7
            and TMPDWORD2, TMPDWORD2, DWORD8

            cmp TMPDWORD2, TMPDWORD1
            b.ne 1b
            b.eq 1f 
        1:
            sub SEEKVALDEC_RET, SEEKVALDEC_ADDR, TMPADDR

            clz DWORD1, DWORD1
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD1, lsr #6
            clz DWORD2, DWORD2
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD2, lsr #6
            clz DWORD3, DWORD3
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD3, lsr #6
            clz DWORD4, DWORD4
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD4, lsr #6
            clz DWORD5, DWORD5
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD5, lsr #6
            clz DWORD6, DWORD6
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD6, lsr #6
            clz DWORD7, DWORD7
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD7, lsr #6
            clz DWORD8, DWORD8
            sub SEEKVALDEC_RET, SEEKVALDEC_RET, DWORD8, lsr #6

            ret


    .section 


.section seekvaldec_aliases
.ifdef Ldynomem_abi_seekvaldecnstep:
    SEEKVALDEC_ADDR .req x0
    SEEKVALDEC_OFFSET .req x1
    SEEKVALDEC_MAXN .req x1
    SEEKVALDEC_VALW .req w2
    SEEKVALDEC_VALX .req x2
    SEEKVALDEC_ALIGNBYTES .req x3
    SEEKVALDEC_RET .req x0
.endif