section .data
  iterMax equ 9

section .text
  global _start
    
_start:
  mov rax, 10         ; state = 10 => 4 LSB of J in ASCII
  mov rbx, 0          ; i

  mov rsi, 10         ; valor semilla
    
_while:
  mov rcx, iterMax
  cmp rbx, rcx        ; i < iterMax ?
  jge _exit
    
  mov rcx, rax        ; state
  and rcx, 1          ; x^4
   
  mov rdx, rax        ; state
  shr rdx, 1          ; state >> 1
  and rdx, 1          ; x^3
    
  xor rcx, rdx        ; newbit = (x^4) ^ (x^3)
    
  shl rcx, 3          ; newbit << 3
  mov rdx, rax        ; state
  shr rdx, 1          ; state >> 1
  or rcx, rdx         ; (newbit << 3) | (state >> 1)
  mov rax, rcx        ; state = (newbit << 3) | (state >> 1)
    
_next0:
  cmp rbx, 0
  jne _next1
  mov rdi, rax
  jmp _continue

_next1:
  cmp rbx, 1
  jne _next2
  mov r8, rax
  jmp _continue

_next2:
  cmp rbx, 2
  jne _next3
  mov r9, rax
  jmp _continue

_next3:
  cmp rbx, 3
  jne _next4
  mov r10, rax
  jmp _continue

_next4:
  cmp rbx, 4
  jne _next5
  mov r11, rax
  jmp _continue

_next5:
  cmp rbx, 5
  jne _next6
  mov r12, rax
  jmp _continue

_next6:
  cmp rbx, 6
  jne _next7
  mov r13, rax
  jmp _continue

_next7:
  cmp rbx, 7
  jne _next8
  mov r14, rax
  jmp _continue

_next8:
  mov r15, rax
  
_continue:
    
    inc rbx           ; i++
    
    jmp _while        ; While loop
    
_exit:
    mov rax, 60
    mov rdi, 0
    syscall

