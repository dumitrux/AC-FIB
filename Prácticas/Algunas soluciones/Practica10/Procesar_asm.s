.text
	.align 4
	.globl procesar
	.type	procesar, @function
procesar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi

# Aqui has de introducir el codigo
	movl 20(%ebp), %eax
	imul %eax, %eax
	movl $0, %ebx
	movl 8(%ebp), %edx
	movl 12(%ebp), %ecx
	movl 16(%ebp), %esi
for:
	cmpl %eax, %ebx
	je 	 fi
	movb (%edx, %ebx), %al
	movb (%ecx, %ebx), %bl
	subb %bl, %al
	cmpb $0, %al
	jle  else
	movb $255, %al
	jmp inc
else:
	movb $0, %al
inc:
	movb %al, (%esi, %ebx)
	incl %ebx
	jmp for
fi:

# El final de la rutina ya esta programado

	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
