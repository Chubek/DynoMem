.data
    // Pead, Exec, Write PROT
    .equ PROT_RXW, 7            
    // Flags for memmap
    .equ MAP_FLAGS, 22
    // Null file descriptor for any shared memory device
    .equ FD_NULL, -1
    // offset for memmap
    .equ OFFSET, 0
    // munmap sys call code
    .equ SYS_munmap, 215
    // memremap sys call code
    .equ SYS_mremap, 216
    // memmap sys call code
    .equ SYS_mmap, 222 
    
    #define SYSCREG x8

    // dynostlen vars
    #define STR_PTR x0
    #define TEMP_STR_PTR x9
    #define BYTE1 w7
    #define BYTE2 w8
    #define STR_LEN x0

    // dynoalloc vars
    #define LEN x0
    #define BYTENUM_ALLOC x1
    #define ADDR x0
    #define LENARG x1
    #define TMP_LENARG x9
    #define PROT x2
    #define FLAGS x3
    #define FILED x4
    #define OFFSET x5

    // dynorealloc vars
    #define OLDADDR x0
    #define OLDSIZE x1
    #define NEWSIZE x2
    #define TMP_OLDSIZE x8
    #define TMP_NEWSIZE x9
    #define BYTENUM_REALLOC x3
    #define FLAGS_REMAP x3
    #define NEWADDR_REMAP x4

    // dynounalloc vars
    #define ADDR_UNALLOC x0
    #define LEN_UNALLOC x1
    #define TMP_LENUNALLOC x8
    #define BYTENUM_UNALLOC x3

    // dynomemcpy vars
    #define ADDR_DST x0
    #define ADDR_SRC x1
    #define CPYLEN x3
    #define TMP_CPYLEN x9
    #define CPYLENBYTES x8
    #define BYTELEN_CPY x11
    #define TMP_VALUE x10

    // dynostrcpy vars
    #define ADDR_STR_DST x0
    #define ADDR_STR_SRC x1
    #define STRLEN x2
    #define TMP_BYTE w8

    // dynosizer vars
    #define TO_SIZE  x0
    #define NUM_BYTES x1
    #define P2_ROUNDED x8
    #define MULT_LEN x0

    .global dynostlen
    .global dynoalloc
    .global dynorealloc
    .global dynounalloc
    .global dynomemcpy
    .global dynostrcpy
    .global dynosizer

.text

// extern usize dynostlen(char *null_terminate_str)
dynostlen: 
    str lr, [sp, #-8]!
    mov TEMP_STR_PTR, STR_PTR       
1:    
    ldrb BYTE1, [TEMP_STR_PTR], #1
    ldrb BYTE2, [TEMP_STR_PTR], #1
    ands wzr, BYTE2, BYTE1
    b.eq 2f
    b.ne 1b
2:
    sub STR_LEN, TEMP_STR_PTR, STR_PTR
    orr BYTE2, BYTE2, BYTE1, lsl #8
    and BYTE1, BYTE1, BYTE2
    eor BYTE2, BYTE2, BYTE1
    cmp BYTE2, #255
    b.cs 3f
    b.mi 4f
3:
    sub STR_LEN, STR_LEN, #1
    bl 5f
4:
    sub STR_LEN, STR_LEN, #2
    bl 5f
5:             
    ldr lr, [sp], #8
    ret

// extern void *dynoalloc(usize size, usize bytenum)
dynoalloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_ALLOC
    mov TO_SIZE, LEN
    bl dynosizer
    mov TMP_LENARG, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov LENARG, TMP_LENARG

    mov SYSCREG, SYS_mmap        
    mov ADDR, xzr             
    mov PROT, PROT_RXW        
    mov FLAGS, MAP_FLAGS       
    mov FILED, FD_NULL         
    mov OFFSET, #0              
    svc #0                  
    
    ldr lr, [sp], #8
    ret

// extern void *dynorealloc(void *ptr, usize old_size, usize new_size, usize bytenum)
dynorealloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_REALLOC
    mov TO_SIZE, OLD_SIZE
    bl dynosizer
    mov TMP_OLDSIZE, MULT_LEN
    mov TO_SIZE, NEW_SIZE
    bl dynosizer
    mov TMP_NEWSIZE, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov OLD_SIZE, TMP_OLDSIZE
    mov NEW_SIZE, TMP_NEWSIZE
    
    mov SYSCREG, SYS_mremap      
    mov FLAGS, #0              
    mov NEWADDR_REMAP, xzr             
    svc #0                  
    
    ldr lr, [sp], #8
    ret

// extern void dynounalloc(void *addr, usize size, usize bytenum)
dynounalloc:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTENUM_UNALLOC
    mov TO_SIZE, LEN_UNALLOC
    bl dynosizer
    mov TMP_LENUNALLOC, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov LEN_UNALLOC, TMP_LENUNALLOC

    mov SYSCREG, SYS_munmap       
    svc #0

    ldr lr, [sp], #8
    ret

// extern void dynomemcpy(void *dst, void *src, usize cpynum, usize bytelen)
dynomemcpy:
    str lr, [sp, #-8]!   

    stp TO_SIZE, NUM_BYTES, [sp, #-16]!
    mov NUM_BYTES, BYTELEN_CPY
    mov TO_SIZE, CPYLEN
    bl dynosizer
    mov TMP_CPYLEN, MULT_LEN
    ldp TO_SIZE, NUM_BYTES, [sp], #16

    mov CPYLEN, TMP_CPYLEN
    mov CPYLENBYTES, CPYLEN
1:
    ldr TMP_VALUE, [ADDR_SRC, CPYLENBYTES]
    str TMP_VALUE, [ADDR_DST, CPYLENBYTES]
    subs CPYLEN, CPYLEN, #1
    b.mi 2f
    b.pl 1b
2:
    ldr lr, [sp], #8
    ret

// extern void dynostrcpy(void *dst, void *src, usize charnum)
dynostrcpy:
1:
    ldrb TMP_BYTE, [ADDR_STR_SRC, STRLEN]
    strb TMP_BYTE, [ADDR_STR_DST, STRLEN]
    subs STRLEN, STRLEN, #1
    b.mi 2f
    b.pl 1b
2:
    ret

// extern usize dynosizer(usize num_items, usize num_bytes)
dynosizer:
    sub P2_ROUNDED, NUM_BYTES, #1
    shr P2_ROUNDED, P2_ROUNDED, #2
    shr P2_ROUNDED, P2_ROUNDED, #4
    shr P2_ROUNDED, P2_ROUNDED, #8
    shr P2_ROUNDED, P2_ROUNDED, #16
    shr P2_ROUNDED, P2_ROUNDED, #32
    shr P2_ROUNDED, P2_ROUNDED, #64
    add P2_ROUNDED, P2_ROUNDED, #1

    mov MULT_LEN, TO_SIZE
    shl MULT_LEN, MULT_LEN, P2_ROUNDED

    ret