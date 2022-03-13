.data
iterMax: .long 9
state: .long 10       @ 4 LSB of J in ASCII
i: .long 0

.text
.global _start

_start:
    mov r3, #10       @ valor semilla
    
_while:
    ldr r0, =iterMax
    ldr r0, [r0]
    ldr r1, =i
    ldr r1, [r1]
    cmp r1, r0        @ i < iterMax ?
    bge _exit

    ldr r0, =state
    ldr r0, [r0]
    and r1, r0, #1    @ x^4
    lsr r2, r0, #1    @ state >> 1
    and r2, r2, #1    @ x^3

    eor r1, r1, r2    @ newbit = (x^4) ^ (x^3)

    lsr r0, r0, #1    @ state >> 1
    lsl r1, r1, #3    @ newbit << 3
    orr r2, r0, r1    @ new state = (state >> 1) | (newbit << 3)

    ldr r0, =state
    str r2, [r0]      @ state = new state

    ldr r0, =i
    ldr r0, [r0]
    ldr r1, =state
    ldr r1, [r1]

_next0:
    cmp r0, #1        @ i < 1 ?
    bge _next1        @ i >= 1    
    mov r4, r1
    b _continue

_next1:
    cmp r0, #2        @ i < 2 ?
    bge _next2        @ i >= 2
    mov r5, r1
    b _continue

_next2:
    cmp r0, #3        @ i < 3 ?
    bge _next3        @ i >= 3
    mov r6, r1
    b _continue

_next3:
    cmp r0, #4        @ i < 4 ?
    bge _next4        @ i >= 4
    mov r7, r1
    b _continue

_next4:
    cmp r0, #5        @ i < 5 ?
    bge _next5        @ i >= 5
    mov r8, r1
    b _continue

_next5:
    cmp r0, #6        @ i < 6 ?
    bge _next6        @ i >= 6
    mov r9, r1
    b _continue

_next6:
    cmp r0, #7        @ i < 7 ?
    bge _next7        @ i >= 7
    mov r10, r1
    b _continue

_next7:
    cmp r0, #8        @ i < 8 ?
    bge _next8        @ i >= 8
    mov r11, r1
    b _continue

_next8:
    mov r12, r1

_continue:
    ldr r0, =i
    ldr r0, [r0]

    add r0, r0, #1    @ i++
    ldr r1, =i
    str r0, [r1]
    
    b _while          @ while loop
    
_exit:
    mov r7, #4
    swi 0
    mov r7, #1
    swi 0

