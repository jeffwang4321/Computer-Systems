.globl sum_float

sum_float:
    # save all callee saved registers
    pushq    %rbx    
     pushq     %r12    # will be used as flag for checking existence of x & y
     pushq    %rbp    
     xorps    %xmm0, %xmm0
     xorps    %xmm1, %xmm1
     xorps    %xmm2, %xmm2

     leaq    (%rdi, %rsi, 4), %rbx        # rbx is the tail of F
     movq    %rsp, %rbp                    # rsp is the tail of Q
     subq    $8, %rbp                    # rbp is the head of Q

     movq    $1, %rcx                    # i = 1
     xor        %rdx, %rdx                    # size of Q

loop:
    cmpq    %rsi, %rcx         # n > i ?
    jge        endloop            # if not, jump to endloop
    xor     %r12,%r12

find_xy:    
    cmpq    %rdi, %rbx        # compare head and tail of F to check if it is empty
    je        F_empty_neitherempty    # if empty (head==tail), jump to F_empty_neitherempty
    movss    (%rdi), %xmm0    # else, move head of F to %xmm0
    cmpq    %rsp, %rbp        # compare head and tail of Q to check if it is empty
    je        Q_empty            # if empty (head==tail), jump to Q_empty
    movss    (%rbp), %xmm2    # else, move head of Q to %xmm1

    comisd     %xmm0,%xmm2        # compare head of F and head of Q 
    jle     F_empty_neitherempty    # if head of Q <= head of F, jmp to F_empty_neither_empty

    addq    $4, %rdi        # else dequeue F
    cmpq     $1, %r12        # check if we have both x & y
    je         enqueue            # if so, jump to enqueue
    jmp     x_isFHead        # else, jump to x_isFHead

F_empty_neitherempty:
    movss    (%rbp), %xmm0    # y <- head of Q
    subq    $8, %rbp        # dequeue Q
    cmp     $1, %r12        # check if we have both x & y
    je         enqueue            # if so, jump to enqueue
    jmp     x_isFHead

Q_empty:
    addq    $4, %rdi        # dequeue F
    cmpq    $1, %r12        # check if we have both x & y
    je         enqueue            # if so, jump to enqueue
    movss    (%rdi), %xmm1    # else, x <- head of F
    inc        %r12            # r12++;
    jmp     find_xy

x_isFHead:
    movss    %xmm0, %xmm1    # x <- head of F
    inc        %r12            # r12++;
    jmp     find_xy            

enqueue:
    addss     %xmm1, %xmm0    # xmm0 = x+y
    subq     $8, %rsp            
    movss     %xmm0, (%rsp)    # enqueue(x+y);
    inc     %rdx
    inc     %rcx
    jmp     loop

endloop:
    movss     (%rbp), %xmm0    # set the result
    leaq    (%rsp, %rdx, 8), %rsp    #restore memory    
    popq     %rbp    #restore all callee saved registers
    popq    %r12
    popq    %rbx
     ret    
