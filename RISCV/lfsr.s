.global _start

.text
_start:

addi a0, zero, 9           # iterMax
addi a1, zero, 10          # state => J in ASCII => 4 LSB
addi a2, zero, 0           # i

add s0, zero, a1           # valor semilla

_while:
    slt t0, a2, a0         # i < iterMax ?
    beq t0, zero, _exit    
    
    andi t1, a1, 1         # state & 1 => x^4

    srli t2, a1, 1         # state >> 1
    andi t2, t2, 1         # (state >> 1) & 1 => x^3
    
    xor t3, t2, t1         # newbit = (x^4) ^ (x^3)
    
    slli t3, t3, 3         # newbit << 3
    srli t4, a1, 1         # state >> 1    
    or a1, t3, t4          # state = (state >> 1) | (newbit << 3)    

_next0:
    slti t5, a2, 1         # i < 1 ?
    beq t5, zero, _next1   # i >= 1
    add s1, zero, a1
    j _continue

_next1:
    slti t5, a2, 2         # i < 2 ?
    beq t5, zero, _next2   # i >= 2
    add s2, zero, a1
    j _continue

_next2:
    slti t5, a2, 3         # i < 3 ?
    beq t5, zero, _next3   # i >= 3
    add s3, zero, a1
    j _continue

_next3:
    slti t5, a2, 4         # i < 4 ?
    beq t5, zero, _next4   # i >= 4
    add s4, zero, a1
    j _continue

_next4:
    slti t5, a2, 5         # i < 5 ?
    beq t5, zero, _next5   # i >= 5
    add s5, zero, a1
    j _continue

_next5:
    slti t5, a2, 6         # i < 6 ?
    beq t5, zero, _next6   # i >= 6
    add s6, zero, a1
    j _continue

_next6:
    slti t5, a2, 7         # i < 7 ?
    beq t5, zero, _next7   # i >= 7
    add s7, zero, a1
    j _continue

_next7:
    slti t5, a2, 8         # i < 8 ?
    beq t5, zero, _next8   # i >= 8
    add s8, zero, a1
    j _continue

_next8:
    add s9, zero, a1

_continue:        
    addi a2, a2, 1         # i++
    
    j _while               # while loop
    
_exit:
    li a0, 42
    li a7, 93
    ecall
