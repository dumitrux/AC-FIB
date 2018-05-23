	.file	"SumMulMat.c"
	.text
	.p2align 4,,15
	.globl	PierdeTiempo
	.type	PierdeTiempo, @function
PierdeTiempo:
.LFB11:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ebx
	cmpl	$1, %ebx
	jle	.L7
	movl	$1, %ecx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L3:
	movl	$1, %edx
	.p2align 4,,7
	.p2align 3
.L6:
	cmpl	%edx, %ebx
	je	.L10
.L4:
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L6
	addl	$1, %ecx
	cmpl	%ebx, %ecx
	jne	.L3
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.L7:
	.cfi_restore_state
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	.p2align 4,,3
	ret
.L10:
	.cfi_restore_state
	addl	%ecx, %eax
	.p2align 4,,7
	jmp	.L4
	.cfi_endproc
.LFE11:
	.size	PierdeTiempo, .-PierdeTiempo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC6:
	.string	"Pierdo algo de tiempo mientras calculo el numero: %ld\n"
	.align 4
.LC7:
	.string	"FORMA ijk (%d), Milisegundos = %9f \n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	xorl	%edx, %edx
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$32, %esp
	.cfi_offset 3, -12
	flds	.LC0
	fldl	.LC1
	jmp	.L12
	.p2align 4,,7
	.p2align 3
.L24:
	fxch	%st(1)
.L12:
	xorl	%eax, %eax
	jmp	.L15
.L23:
	fxch	%st(1)
.L15:
	fld	%st(1)
	fadd	%st(1), %st
	movl	$0x00000000, C(%edx,%eax,4)
	fstps	A(%edx,%eax,4)
	fldl	.LC2
	fadd	%st(2), %st
	fstps	B(%edx,%eax,4)
	fxch	%st(1)
	addl	$1, %eax
	faddl	.LC4
	cmpl	$256, %eax
	fstps	28(%esp)
	flds	28(%esp)
	jne	.L23
	addl	$1024, %edx
	cmpl	$262144, %edx
	jne	.L24
	fstp	%st(0)
	fstp	%st(0)
	call	GetTime
	xorl	%ecx, %ecx
	fstps	24(%esp)
	flds	.LC5
.L16:
	xorl	%ebx, %ebx
	.p2align 4,,7
	.p2align 3
.L21:
	flds	C(%ecx,%ebx)
	leal	B(%ebx), %edx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L19:
	flds	A(%ecx,%eax,4)
	addl	$1, %eax
	addl	$1024, %edx
	fmuls	-1024(%edx)
	cmpl	$256, %eax
	fmul	%st(2), %st
	faddp	%st, %st(1)
	fstps	28(%esp)
	flds	28(%esp)
	jne	.L19
	fstps	C(%ecx,%ebx)
	addl	$4, %ebx
	cmpl	$1024, %ebx
	jne	.L21
	addl	$1024, %ecx
	cmpl	$262144, %ecx
	jne	.L16
	fstp	%st(0)
	movl	$0, 4(%esp)
	movl	$.LC6, (%esp)
	call	printf
	call	GetTime
	movl	$256, 4(%esp)
	movl	$.LC7, (%esp)
	fsubs	24(%esp)
	fstpl	8(%esp)
	call	printf
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.comm	C,262144,32
	.comm	B,262144,32
	.comm	A,262144,32
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	981668463
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	858993459
	.long	1074475827
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC4:
	.long	1202590843
	.long	1066695393
	.section	.rodata.cst4
	.align 4
.LC5:
	.long	1056964608
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
