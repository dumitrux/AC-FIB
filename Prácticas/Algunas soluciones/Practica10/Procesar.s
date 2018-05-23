	.file	"Procesar.c"
	.text
	.p2align 4,,15
	.globl	procesar
	.type	procesar, @function
procesar:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	36(%esp), %ecx
	testl	%ecx, %ecx
	jle	.L1
	xorl	%ebp, %ebp
	movl	$0, (%esp)
	.p2align 4,,7
	.p2align 3
.L3:
	movl	32(%esp), %ebx
	xorl	%eax, %eax
	movl	24(%esp), %esi
	leal	(%ebx,%ebp), %edi
	movl	28(%esp), %ebx
	addl	%ebp, %esi
	addl	%ebp, %ebx
	.p2align 4,,7
	.p2align 3
.L5:
	movzbl	(%ebx,%eax), %edx
	cmpb	%dl, (%esi,%eax)
	setne	%dl
	negl	%edx
	movb	%dl, (%edi,%eax)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L5
	addl	$1, (%esp)
	addl	%ecx, %ebp
	cmpl	%ecx, (%esp)
	jne	.L3
.L1:
	addl	$4, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE0:
	.size	procesar, .-procesar
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
