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
    .equ SYS_munmap, 11
    // memremap sys call code
    .equ SYS_mremap, 25
    // memmap sys call code
    .equ SYS_mmap, 9

    .set SYSCREG, x8

    // dynostlen vars
    .set STR_PTR, %rdi
    .set STR_LEN, %rax
    .set BYTE1, %r9b
    .set BYTE2, %r8b

    // dynoalloc vars
    .set LEN, %rdi
    .set BYTENUM_ALLOC, %rsi
    .set ADDR, %rdi
    .set LENARG, %rsi
    .set PROT, %rdx
    .set FLAGS, %r10
    .set FILED, %r8
    .set OFFSET, %r9

    // dynorealloc vars
    .set OLDADDR, %rdi
    .set OLDSIZE, %rsi
    .set NEWSIZE, %rdx
    .set BYTENUM_REALLOC, %r10
    .set FLAGS_REMAP, %r10
    .set NEWADDR_REMAP, %r8

    // dynounalloc vars
    .set ADDR_UNALLOC, %rdi
    .set LEN_UNALLOC, %rsi
    .set BYTENUM_UNALLOC, %r10

    // dynomemcpy vars
    .set ADDR_DST, %rdi
    .set ADDR_SRC, %rsi
    .set CPYLEN, %r10
    .set BYTELEN_CPY, %r10

    // dynostrcpy vars
    .set ADDR_STR_DST, %rdi
    .set ADDR_STR_SRC, %rsi
    .set STRLEN, %r10

    .global dynostlen
    .global dynoalloc
    .global dynorealloc
    .global dynounalloc
    .global dynomemcpy
    .global dynostrcpy

.text

// extern usize dynostlen(char *null_terminate_str)
dynostlen: 
    mov $0, STR_LEN      
1:      
    movzx (STR_PTR, STR_LEN), BYTE1
    inc STR_LEN      
    movzx (STR_PTR, STR_LEN), BYTE2
    inc STR_LEN      
    cmp BYTE, $0              
    je 2         
    jne 1              
2:
    ret

// extern void *dynoalloc(usize size, usize bytenum)
dynoalloc:    
    movzx LEN, LENARG             
    shl BYTENUM_ALLOC, LENARG          

    movzx SYS_mmap, SYSCREG         
    movzx $0, ADDR             
    movzx PROT_RXW, PROT         
    movzx MAP_FLAGS, FLAGS        
    movzx FD_NULL, FILED       
    movzx $0, OFFSET              
    syscall                  
        
    ret

// extern void *dynorealloc(void *ptr, usize old_size, usize new_size, usize bytenum)
dynorealloc:
    shl BYTENUM_REALLOC, OLDSIZE        
    shl BYTENUM_REALLOC, NEWSIZE      
    
    mov SYS_mremap, SYSCREG       
    mov $0, FLAGS              
    mov $0, NEWADDR_REMAP             
    syscall                  
    
    ret

// extern void dynounalloc(void *addr, usize size, usize bytenum)
dynounalloc:
    shl BYTENUM_UNALLOC, LEN_UNALLOC

    mov SYS_munmap, SYSCREG       
    syscall

    ret

// extern void dynomemcpy(void *dst, void *src, usize cpynum, usize bytelen)
dynomemcpy:
1:
    shl BYTELEN_CPY, CPYLEN
    mov (ADDR_SRC, CPYLEN, $1), ADDR_DST 
    sub $1, CPYLEN
    js 2
    jns 1
2:
    ret

// extern void dynostrcpy(void *dst, void *src, usize charnum)
dynostrcpy:
1:
    movb (ADDR_STR_SRC, STRLEN, 1), ADDR_STR_DST 
    sub $1, STRLEN
    js 2
    jns 1
2:
    ret