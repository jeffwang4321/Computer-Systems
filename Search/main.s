	.file	"main.c"
	.text
	.globl	lsearch_1
	.type	lsearch_1, @function
lsearch_1:
.LFB39:
	.cfi_startproc
	movl	$-1, %eax
	testl	%esi, %esi
	jle	.L2
	cmpl	(%rdi), %edx
	je	.L6
	addq	$4, %rdi
	movl	$0, %eax
	jmp	.L3
.L4:
	addq	$4, %rdi
	cmpl	%edx, -4(%rdi)
	je	.L2
.L3:
	addl	$1, %eax
	cmpl	%eax, %esi
	jne	.L4
	movl	$-1, %eax
	ret
.L6:
	movl	$0, %eax
.L2:
	rep ret
	.cfi_endproc
.LFE39:
	.size	lsearch_1, .-lsearch_1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Initializing array . . ."
.LC1:
	.string	"Array initialized. . ."
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Starting test of function %d . . .\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Error: A[N] not consistent.\n"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error: A[N-1] not consistent.\n"
	.align 8
.LC5:
	.string	"It took %ld microseconds to run function %d.\n"
	.section	.rodata.str1.1
.LC6:
	.string	"Totalling work %d . . .\n"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error: Results of searches disagree.\n"
	.section	.rodata.str1.1
.LC8:
	.string	"Total misses = %ld, %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Total of positions searched = %ld, %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$3576, %rsp
	.cfi_def_cfa_offset 3632
	movq	%fs:40, %rax
	movq	%rax, 3560(%rsp)
	xorl	%eax, %eax
	movq	$lsearch_1, 304(%rsp)
	movq	$lsearch_2, 312(%rsp)
	movl	$.LC0, %edi
	call	puts
	movl	$0, A(%rip)
	movl	$0, %edi
	movl	$0, %eax
	call	time
	movl	%eax, %edi
	call	srand
	movl	$A+4, %ebp
	movl	$1, %ebx
	movl	$1431655766, %r12d
.L9:
	movl	%ebx, %eax
	imull	%r12d
	movl	%ebx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	cmpl	%eax, %ebx
	sete	%dl
	movzbl	%dl, %edx
	leal	(%rbx,%rbx,2), %eax
	addl	%edx, %eax
	movl	%eax, 0(%rbp)
	call	rand
	movl	%eax, %r13d
	call	rand
	addl	$1, %ebx
	movslq	%r13d, %rcx
	imulq	$-2147418109, %rcx, %rcx
	shrq	$32, %rcx
	addl	%r13d, %ecx
	sarl	$14, %ecx
	movl	%r13d, %edx
	sarl	$31, %edx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$15, %edx
	subl	%ecx, %edx
	subl	%edx, %r13d
	sall	$16, %r13d
	movslq	%eax, %rcx
	imulq	$-2147450879, %rcx, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$15, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$16, %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	orl	%r13d, %eax
	cltd
	idivl	%ebx
	movl	0(%rbp), %eax
	movslq	%edx, %rdx
	movl	A(,%rdx,4), %ecx
	movl	%ecx, 0(%rbp)
	movl	%eax, A(,%rdx,4)
	addq	$4, %rbp
	cmpl	$20000000, %ebx
	jne	.L9
	movl	$A, %eax
	movl	80000000(%rax), %r14d
	movl	79999996(%rax), %r15d
	movl	$.LC1, %edi
	call	puts
	leaq	304(%rsp), %r13
	leaq	352(%rsp), %rbp
	movq	%rbp, %r12
	movl	$0, 8(%rsp)
	jmp	.L14
.L22:
	movl	12(%rsp), %eax
	movl	%eax, 8(%rsp)
.L14:
	movl	8(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 12(%rsp)
	movl	%eax, %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	leaq	16(%rsp), %rsi
	movl	$0, %edi
	call	getrusage
	movl	$0, %ebx
.L13:
	movl	%ebx, %edx
	movl	$20000000, %esi
	movl	$A, %edi
	call	*0(%r13)
	movl	%eax, (%r12,%rbx,4)
	movl	$A, %eax
	cmpl	80000000(%rax), %r14d
	je	.L10
	movl	$.LC3, %edi
	call	perror
	jmp	.L8
.L10:
	movl	$A, %eax
	cmpl	79999996(%rax), %r15d
	je	.L12
	movl	$.LC4, %edi
	call	perror
	jmp	.L8
.L12:
	addq	$1, %rbx
	cmpq	$400, %rbx
	jne	.L13
	leaq	160(%rsp), %rsi
	movl	$0, %edi
	call	getrusage
	movq	160(%rsp), %rdx
	subq	16(%rsp), %rdx
	imulq	$1000000, %rdx, %rdx
	subq	24(%rsp), %rdx
	addq	168(%rsp), %rdx
	movl	12(%rsp), %ebx
	movl	%ebx, %ecx
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$8, %r13
	addq	$1600, %r12
	cmpl	$2, %ebx
	jne	.L22
	movl	8(%rsp), %edx
	addl	$2, %edx
	movl	$.LC6, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movq	$0, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$0, 336(%rsp)
	movq	$0, 344(%rsp)
	leaq	1952(%rsp), %r8
	jmp	.L15
.L18:
	movl	(%rsi), %ecx
	cmpl	$-1, %ecx
	jne	.L16
	addq	$1, (%rax)
	addq	$20000000, (%rdx)
	jmp	.L17
.L16:
	movslq	%ecx, %rcx
	addq	%rcx, (%rdx)
.L17:
	addq	$1600, %rsi
	addq	$8, %rax
	addq	$8, %rdx
	cmpq	%rdi, %rax
	jne	.L18
	movl	1600(%rbp), %eax
	cmpl	%eax, 0(%rbp)
	je	.L19
	movl	$.LC7, %edi
	call	perror
	jmp	.L8
.L19:
	addq	$4, %rbp
	cmpq	%r8, %rbp
	je	.L20
.L15:
	leaq	336(%rsp), %rax
	leaq	320(%rsp), %rdx
	leaq	16(%rax), %rdi
	movq	%rbp, %rsi
	jmp	.L18
.L20:
	movq	344(%rsp), %rcx
	movq	336(%rsp), %rdx
	movl	$.LC8, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movq	328(%rsp), %rcx
	movq	320(%rsp), %rdx
	movl	$.LC9, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L8:
	movq	3560(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail
.L21:
	addq	$3576, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.comm	A,80000000,32
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
