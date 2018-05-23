	.file	"PRUEBA.c"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	xorl	%ecx, %ecx
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-8, %esp
	subl	$4, %esp
	.cfi_offset 3, -12
	flds	.LC0
.L2:
	xorl	%ebx, %ebx
	.p2align 4,,7
	.p2align 3
.L7:
	flds	C(%ecx,%ebx)
	leal	B(%ebx), %edx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L5:
	flds	A(%ecx,%eax,4)
	addl	$1, %eax
	addl	$1024, %edx
	fmuls	-1024(%edx)
	cmpl	$256, %eax
	fmul	%st(2), %st
	faddp	%st, %st(1)
	fstps	(%esp)
	flds	(%esp)
	jne	.L5
	fstps	C(%ecx,%ebx)
	addl	$4, %ebx
	cmpl	$1024, %ebx
	jne	.L7
	addl	$1024, %ecx
	cmpl	$262144, %ecx
	jne	.L2
	fstp	%st(0)
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.comm	C,262144,32
	.comm	B,262144,32
	.comm	A,262144,32
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1056964608
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
