 .text
	.align 4
	.globl Buscar
	.type Buscar,@function
Buscar:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	movl $1, -4(%ebp)
	movl $0, -8(%ebp)
	movl 24(%ebp), %ecx
	decl %ecx
	movl %ecx, -12(%ebp)
	
while:
	cmpl -16(%ebp), %ecx
	jg endwhile
	pushl 8(%ebp)
	pushl 12(%ebp)
	leal -8(%ebp), %edx
	pushl %edx
	leal -12, %edx
	pushl %edx
	leal -16(%ebp), %edx
	pushl %edx
	call BuscarElemento
	popl %ecx
	addl $28, %esp
	movl %eax, -4(%ebp)
	cmpl $0, -4(%ebp)
	jl endwhile
	jmp while
	
endwhile:
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
