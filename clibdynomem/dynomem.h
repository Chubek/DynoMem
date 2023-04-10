#ifndef _DYNOMEM_H
#define _DYNOMEM_H

typedef unsigned long usize;

/*
Get length of a null-terminated string.
*/
extern usize dynostlen(char *null_terminate_str);

/*
Map a space in virtual memory of size `size * bytenum`
`bytenum` must be larger than or equal to 1.
It will return a null pointer to the first block of the space.
*/
extern void *dynoalloc(usize size, usize bytenum);

/*
Reallocate a previously-allocated space in virtual memory.
The `old_size` must be the size of the declared block.
`new_size` must be larger than `old_size`.
Returns a pointer to the newly reallocated block.
*/
extern void *dynorealloc(void *ptr, usize old_size, usize new_size, usize bytenum);

/*
Copies `cpynum` bytes, each sized `bytenum` bytes, from one buffer, to another buffer.
`dst` must at least be `cpynum * bytenum` in length.
*/
extern void dynomemcpy(void *dst, void *src, usize cpynum, usize bytenum);

/*
Copies `charnum` bytes from a string buffer into another string buffer.
`dst` must be at least `charnum` in length.
*/
extern void dynostrcpy(void *dst, void *src, usize charnum);

/*
Takes number of items, each sized `num_bytes` bytes. 
Returns a proper number of bytes for memory mapping.
*/
extern usize dynosizer(usize num_items, usize num_bytes);

#endif