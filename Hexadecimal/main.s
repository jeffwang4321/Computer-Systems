	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%10u = %s\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.section	.text.startup,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$tests, %ebx
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	(%rbx), %edi
	movq	%rsp, %rsi
	addq	$4, %rbx
	call	hex_str
	movl	-4(%rbx), %edx
	xorl	%eax, %eax
	movq	%rsp, %rcx
	movl	$.LC0, %esi
	movl	$1, %edi
	call	__printf_chk
	cmpq	$tests+44, %rbx
	jne	.L2
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.globl	tests
	.data
	.align 32
	.type	tests, @object
	.size	tests, 44
tests:
	.long	1
	.long	34
	.long	819
	.long	17476
	.long	349525
	.long	6710886
	.long	125269879
	.long	19088743
	.long	-1985229329
	.long	-559038737
	.long	-1059145122
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
