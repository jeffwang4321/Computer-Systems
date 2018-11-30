	.globl sqrt

	#Function - square root the value %edi to the largest integer <= the real root
sqrt:
	# Variables: %eax - res; %ecx - int k; %edi - argument x; %esi - int mask; %r8d - holdres; r9d - holdmask 

	movl $0, %eax   		# set res to 0 (return value), (eax - 0000 0000 0000 0000)
	movl $16, %ecx			# set int k to start at 15 - 0
	movl $0x8000, %esi		# set int mask to 0x8000, (%esi - 1000 0000 0000 0000)

loop:
	cmpl $0, %ecx			# compare (k - 0 ? 0), compare int k minus 0 to 0
	jle endl			# if (k - 0 <= 0) jmp endl, jump to endloop when int k is equal to 0 
	decl %ecx			# k--, decrement int k by 1

	xorl %esi, %eax			# res = 0000 0000 0000 0000 xor 1000 0000 0000 0000
	movl %eax, %r8d			# holdres = res, (r8d - 1000 0000 0000 0000)
	imull %r8d, %r8d		# holdres = holdres * holdres
	
	movl %esi, %r9d			# holdmask = mask, (1000 0000 0000 0000)	
	shr $1, %esi			# mask -> 0100 0000 0000 0000

	cmpl %r8d, %edi			# compare (x - holdres ? 0), compare x minus res*res to 0
	jge loop			# jump to top of loop

	xorl %r9d, %eax			# res = 1000 0000 0000 0000 xor 1000 0000 0000 0000 = 0

	jmp loop			#jump to top of loop

endl:	

	ret
