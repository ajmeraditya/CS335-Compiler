.section .data
.section .text
.section .rodata
.note0:
        .string "%ld\n"
        .text
.str0:
        .string "\n"
        .text
.str112:
        .string "\n"
        .text
.str120:
        .string "\n"
        .text
.str16:
        .string "\n"
        .text
.str32:
        .string "\n"
        .text
.str40:
        .string "\n"
        .text
.str56:
        .string "\n"
        .text
.str64:
        .string "\n"
        .text
.str8:
        .string "\n"
        .text
.str88:
        .string "\n"
        .text
.global main

#fib:   
fib:
pushq %rbp
movq %rsp, %rbp
subq $120, %rsp
pushq %rbx
pushq %rdi
pushq %rsi
pushq %r12
pushq %r13
pushq %r14
pushq %r15

#move8 16(%rbp) a 
movq 16(%rbp), %r13
movq %r13, -8(%rbp)

#.t1 = 0
movq $0, -16(%rbp)

#.t2 = a == .t1
movq -8(%rbp), %r13
movq -16(%rbp), %r14
cmpq %r13, %r14
sete %al
movzbq %al, %r14
movq %r14, -24(%rbp)

#if_false .t2 goto .label2
mov -24(%rbp), %rax
cmp $0, %rax
je .label2

#.t3 = 0
movq $0, -32(%rbp)

#move8 .t3 %rax 
movq -32(%rbp), %rax

#ret   
popq %r15
popq %r14
popq %r13
popq %r12
popq %rsi
popq %rdi
popq %rbx
addq $120, %rsp
popq %rbp
movq $8, %r13
ret

#goto .label1  
jmp .label1

#.label2:   
.label2:

#.label1:   
.label1:

#.t4 = 1
movq $1, -40(%rbp)

#.t5 = a == .t4
movq -8(%rbp), %r13
movq -40(%rbp), %r14
cmpq %r13, %r14
sete %al
movzbq %al, %r14
movq %r14, -48(%rbp)

#if_false .t5 goto .label4
mov -48(%rbp), %rax
cmp $0, %rax
je .label4

#.t6 = 1
movq $1, -56(%rbp)

#move8 .t6 %rax 
movq -56(%rbp), %rax

#ret   
popq %r15
popq %r14
popq %r13
popq %r12
popq %rsi
popq %rdi
popq %rbx
addq $120, %rsp
popq %rbp
movq $8, %r13
ret

#goto .label3  
jmp .label3

#.label4:   
.label4:

#.label3:   
.label3:

#.t7 = 1
movq $1, -64(%rbp)

#.t8 = a - .t7
movq -8(%rbp), %r13
movq -64(%rbp), %r14
subq %r14, %r13
movq %r13, -72(%rbp)

#push .t8  
pushq -72(%rbp)

#call, fib  
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
call fib
addq %r13, %rsp

#move8 %rax .t9 
movq %rax, -80(%rbp)

#.t10 = 2
movq $2, -88(%rbp)

#.t11 = a - .t10
movq -8(%rbp), %r13
movq -88(%rbp), %r14
subq %r14, %r13
movq %r13, -96(%rbp)

#push .t11  
pushq -96(%rbp)

#call, fib  
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
call fib
addq %r13, %rsp

#move8 %rax .t12 
movq %rax, -104(%rbp)

#.t13 = .t9 + .t12
movq -80(%rbp), %r13
movq -104(%rbp), %r14
addq %r13, %r14
movq %r14, -112(%rbp)

#x = .t13
movq -112(%rbp), %r13
movq %r13, -120(%rbp)

#move8 x %rax 
movq -120(%rbp), %rax

#ret   
popq %r15
popq %r14
popq %r13
popq %r12
popq %rsi
popq %rdi
popq %rbx
addq $120, %rsp
popq %rbp
movq $8, %r13
ret

#main:   
main:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

#.t14 = 5
movq $5, -8(%rbp)

#push .t14  
pushq -8(%rbp)

#call, fib  
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
call fib
addq %r13, %rsp

#move8 %rax .t15 
movq %rax, -16(%rbp)

pop %rbx
mov $60, %rax       # System call number for exit
xor %rdi, %rdi      # Exit code is 0
syscall
