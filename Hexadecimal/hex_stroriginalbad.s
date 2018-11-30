	.globl hex_str

hex_str:
	#edi - unsigned x, rsi- char *s, eax - int k, ecx - int mask, edx - hold (hold x value)
	
	movl	$8, %eax		#set int k = 8	
	movl	$0xf0000000, %ecx	#set int mask = 11110...(28x 0's)

	movb	$48, (%rsi)		#set s[0] = "0"
	incb	%sil			#s[i++]
	movb	$120, (%rsi)		#set s[1] = "x"

loop:
	incb	%sil			#s[i++]
	decl	%eax			#k--
	movl 	%edi, %edx		#int hold = x	

	andl 	%ecx, %edx		#hold andb mask (hold keeps first 4 digits, rest 28x 0's)
	shr 	$28, %edx		#shift hold, 28 right (move first 4 to last 4)

	cmpl	$9, %edx		#hold - 9 ? 0 (check if ASCII value is > 9)
	jg	larger			#if hold > 9 jmp larger
	
	addl	$48, %edx		#else hold = hold + 48 get the values {0...9}

resume:	
	movl	%edx, (%rsi)		#rsi[2] = load new edx (ASCII hex value)	
	shl 	$4, %edi		#shift x, 4 left (brint the next 4 digits to the front)

	cmpl 	$0, %eax		#k - 0 ? 0 (check if k > 0)
	jg 	loop			#if k > 0 jmp loop (jump back to top if k > 0)

    	ret				#else return 


larger:					#jmp to here if hold > 9
	addl 	$87, %edx		#edx = edx + 87 get the values {a...f}
	jmp 	resume			#jmp back to resume

