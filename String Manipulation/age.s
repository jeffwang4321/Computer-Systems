.string1:
	.string "Please enter your name: "
.string2:
	.string "Thank you %s!\n"
.string3:
	.string "Please enter your year of birth: "
.string4:
	.string "%s is not a valid year.\n"
	.globl get_age
get_age:
	push %rbx              
	push %rbp		# callee saved registers
				# local variables:
	leaq -8(%rsp), %rsp	#   - endptr
	leaq -24(%rsp), %rsp	#   - name_str[24]
	leaq -24(%rsp), %rsp	#   - year_of_birth[24]
	mov %rsp, %rbp

	movq $.string1, %rdi
	xorl %eax, %eax
	call printf		# printf("Please enter your name: ");

	leaq 24(%rbp), %rdi
	call gets		# gets(name_str); ########my code
	movq %rax, %rsi
	
	movq $.string2, %rdi	
	xorl %eax, %eax		# set rax = 0 before print
	call printf		# printf("Thank you %s!\n");
	leaq 24(%rbp), %rbp	# increment into memory
check:
	movq $.string3, %rdi
	xorl %eax, %eax		# set rax = 0 before print
	call printf		# printd("Please enter your year of birth: ")
	
	call gets		# gets(year_of_birth);
	movq %rax, %rdi
	push %rax		# push string to save for later use 
	leaq 24(%rbp), %rbp	# increment into memory	

	leaq 8(%rbp), %rbp	# increment into memory
	movq $10, %rdx		# set rdx = 10, for base 10, for strtol;
	call strtol;		# strtol(endptr)

	cmpq $1900, %rax	#compare int year with 1900
	jl loop			# if year < 1900, jump to loop

	cmpq $2014, %rax	#compare int year with 2014
	jg loop			# if year > 2014,  jump to loop
	
	movq $2017, %r8		# r8 = 2017
	subq %rax, %r8		# subtract 2017 - year
	movq %r8, %rax 		# year = r8 (new sum)

	leaq 80(%rsp), %rsp	# increment into memory
	ret
loop:
	pop %rsi		# pop  string back to use
	movq $.string4, %rdi	
	xorl %eax, %eax		# set rax = 0 before print
	call printf		# printd("%s is not a valid year.\n")
	jmp check		# jump back to check

