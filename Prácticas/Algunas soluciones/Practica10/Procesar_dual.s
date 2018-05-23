.text
	.align 16
	.globl procesar
	.type	procesar, @function
cero:	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
	
	movl %ebp, %edi
	shll 4, %edi
	cmpl $0, %edi
	jne no_multiple

	
for_multiple:
	cmpl %eax, %ebx
	je 	 fi
	movdqa (%edx, %ebx), %xmm0
	movdqa (%ecx, %ebx), %xmm1
	psubb %xmm1, %xmm0
	movdqa %xmm0, (%esi, %ebx)
	movdqa cero, %xmm2
	pcmpgtb %xmm2, %xmm0
	movdqa %xmm0, (%esi, %ebx)
	jmp fifor
	
for_no_multiple:
	cmpl %eax, %ebx
	je 	 fi
	movdqu (%edx, %ebx), %xmm0
	movdqu (%ecx, %ebx), %xmm1
	psubb %xmm1, %xmm0
	movdqu %xmm0, (%esi, %ebx)
	movdqu cero, %xmm2
	pcmpgtb %xmm2, %xmm0
	movdqu %xmm0, (%esi, %ebx)
	
fifor:
	addl $16, %ebx
	jmp for
fi:
	
# El final de la rutina ya esta programado

	emms	# Instruccion necesaria si os equivocais y usais MMX
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
