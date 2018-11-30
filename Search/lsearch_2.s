	# var map:
	#    %rdi - int *A
	#    %esi - int n
	#    %edx - int target
	#    %ecx - copy
	#    %r8  - int *endptr
	#    %r9d - int tmp
	#    %rax - int ret/ int i
	
	.globl	lsearch_2
lsearch_2:
	testl	%esi, %esi		#if(n <= 0){
	jle	endif			# 	jmp endif }
	movslq	%esi, %rax		#ret = n;
	leaq	-4(%rdi,%rax,4), %rax	#ret = A[n-1]; 
	movl	(%rax), %r9d		#tmp = A[n-1];
	movl	%edx, (%rax)		#A[n-1] = target;
	cmpl	(%rdi), %edx		#if(target == A[0]){
	je	found1			#	jmp found1 }
	movl	$0, %ecx		#i = 0;

loop:					#do{
	addl	$1, %ecx		#	i++;
	movslq	%ecx, %r8		#	hold = i;
	cmpl	(%rdi,%r8,4), %edx	#}while(target != A[i]);	
	jne	loop			#
	jmp	found			# jmp found
found1:
	movl	$0, %ecx		#i = 0;
found:
	movl	%r9d, (%rax)		#A[n-1] = tmp;
	leal	-1(%rsi), %eax		#ret = n-1;
	cmpl	%ecx, %eax		#if(n-1 > i){
	jg	end			#	jmp end }
	cmpl	%edx, %r9d		#if(tmp - target){
	movl	$-1, %edx		#	target = n-1;
	cmovne	%edx, %eax		#	if(ret - target != 0){
					#		ret = target;}}
	ret				# return n-1;
endif:
	movl	$-1, %eax		#return -1;
	ret
end:
	movl	%ecx, %eax		#return i;
	ret

