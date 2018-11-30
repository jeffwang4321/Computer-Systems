	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The integer square root of %u is %u.\n"
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
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ebx, %edi
	call	sqrt
	movl	%ebx, %edx
	movl	%eax, %ecx
	movl	$.LC0, %esi
	xorl	%eax, %eax
	movl	$1, %edi
	addl	$1, %ebx
	call	__printf_chk
	cmpl	$200, %ebx
	jne	.L2
	movl	$16129, %edi
	call	sqrt
	movl	$16129, %edx
	movl	%eax, %ecx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$16384, %edi
	call	sqrt
	movl	$16384, %edx
	movl	%eax, %ecx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$65536, %edi
	call	sqrt
	popq	%rbx
	.cfi_def_cfa_offset 8
	movl	%eax, %ecx
	movl	$65536, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
