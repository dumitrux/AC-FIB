 .text
	.align 4
	.globl BuscarElemento
	.type BuscarElemento,@function
BuscarElemento:
	pushl %ebp
	movl %esp, %ebp
	movl 24(&ebp), %ecx
	imul $12, 16(%ebp), %edx
	movl 32(%ebp), %eax
	addl $4, %eax
	addl %eax, %edx
	movl (%edx), %edx
	cpl %edx, %ecx
	jne else
	movl 16(%ebp), %eax
	jmp end2
	
else1:
	movl 12(%ebp), %edx
	cmpl %edx, 16(%ebp)
	jge else2
	movl %edx, 16(%ebp)
	movl 8(%ebp), %ecx
	movl (%ecx), %edx
	incl %edx
	movl %edx, (%ecx)
	jmp end1

else2:
	movl 8(%ebp), %edx
	movl %edx, 16(%ebp)
	movl 12(%ebp), %edx
	movl (%edx), %ecx
	decl &ecx
	movl %ecx, (%edx)
	
end1:
	movl $-1, %eax

end2:
	movl %ebp, %esp
	popl %ebp
	ret
