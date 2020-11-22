	.file	"myblas.c"
	.text
	.globl	faxpy
	.type	faxpy, @function
faxpy:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp) #int n
	movss	%xmm0, -24(%rbp) #a 
	movq	%rsi, -32(%rbp) #x
	movq	%rdx, -40(%rbp) #y 
	movq	%rcx, -48(%rbp) #result 
	movl	$1, -4(%rbp)    #i
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax

	movups	(%rax), %xmm0
	movups	%xmm0, %xmm1
	movss	-24(%rbp), %xmm2
    vbroadcastss  %xmm2, %xmm3 

	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movups	(%rax), %xmm0
	
    movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
    
	mulps   %xmm3, %xmm1
    addps	%xmm1, %xmm4
	movups	%xmm4, (%rax)
	addl	$4, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	faxpy, .-faxpy
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
