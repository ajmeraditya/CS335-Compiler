.section .data
.section .text
.section .rodata
.note0:
        .string "%ld\n"
        .text
.global main

#temp:   
temp:
pushq %rbp
movq %rsp, %rbp
subq $208, %rsp
pushq %rbx
pushq %rdi
pushq %rsi
pushq %r12
pushq %r13
pushq %r14
pushq %r15

#move8 16(%rbp) arr 
movq 16(%rbp), %r13
movq %r13, -8(%rbp)

#.t1 = 0
movq $0, -16(%rbp)

#i = .t1
movq -16(%rbp), %r13
movq %r13, -24(%rbp)

#.t2 = 0
movq $0, -32(%rbp)

#j = .t2
movq -32(%rbp), %r13
movq %r13, -40(%rbp)

#print, i int 
mov -24(%rbp), %rax
mov %rax, %rsi
lea .note0(%rip), %rax
mov %rax, %rdi
xor %rax, %rax
movq %rsp, -216(%rbp)
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
call printf@plt
movq -216(%rbp), %rsp

#.t3 = 0
movq $0, -48(%rbp)

#.t4 = 3
movq $3, -56(%rbp)

#.t3 = .t3 - 1
movq -48(%rbp), %r13
movq $1, %r14
subq %r14, %r13
movq %r13, -48(%rbp)

#.t5 = .t3
movq -48(%rbp), %r13
movq %r13, -64(%rbp)

#.label2:   
.label2:

#.t5 = .t5 + 1
movq -64(%rbp), %r13
movq $1, %r14
addq %r13, %r14
movq %r14, -64(%rbp)

#.t6 = .t5 < .t4
movq -64(%rbp), %r13
movq -56(%rbp), %r14
cmpq %r13, %r14
setg %al
movzbq %al, %r14
movq %r14, -72(%rbp)

#if_false .t6 goto .label1
mov -72(%rbp), %rax
cmp $0, %rax
je .label1

#i = .t5
movq -64(%rbp), %r13
movq %r13, -24(%rbp)

#.t7 = 0
movq $0, -80(%rbp)

#.t8 = 3
movq $3, -88(%rbp)

#.t7 = .t7 - 1
movq -80(%rbp), %r13
movq $1, %r14
subq %r14, %r13
movq %r13, -80(%rbp)

#.t9 = .t7
movq -80(%rbp), %r13
movq %r13, -96(%rbp)

#.label4:   
.label4:

#.t9 = .t9 + 1
movq -96(%rbp), %r13
movq $1, %r14
addq %r13, %r14
movq %r14, -96(%rbp)

#.t10 = .t9 < .t8
movq -96(%rbp), %r13
movq -88(%rbp), %r14
cmpq %r13, %r14
setg %al
movzbq %al, %r14
movq %r14, -104(%rbp)

#if_false .t10 goto .label3
mov -104(%rbp), %rax
cmp $0, %rax
je .label3

#j = .t9
movq -96(%rbp), %r13
movq %r13, -40(%rbp)

#.t12 = j * 8
movq -40(%rbp), %r13
movq $8, %r14
imulq %r13, %r14
movq %r14, -112(%rbp)

#a = arr[.t12]
movq -8(%rbp), %r10
movq -112(%rbp), %r11
movq ( %r10, %r11 ), %r13
movq %r13, -120(%rbp)

#.t13 = 1
movq $1, -128(%rbp)

#.t14 = j + .t13
movq -40(%rbp), %r13
movq -128(%rbp), %r14
addq %r13, %r14
movq %r14, -136(%rbp)

#.t16 = .t14 * 8
movq -136(%rbp), %r13
movq $8, %r14
imulq %r13, %r14
movq %r14, -144(%rbp)

#b = arr[.t16]
movq -8(%rbp), %r10
movq -144(%rbp), %r11
movq ( %r10, %r11 ), %r13
movq %r13, -152(%rbp)

#.t17 = a > b
movq -120(%rbp), %r13
movq -152(%rbp), %r14
cmpq %r14, %r13
setg %al
movzbq %al, %r14
movq %r14, -160(%rbp)

#if_false .t17 goto .label6
mov -160(%rbp), %rax
cmp $0, %rax
je .label6

#.t19 = j * 8
movq -40(%rbp), %r13
movq $8, %r14
imulq %r13, %r14
movq %r14, -168(%rbp)

#arr[.t19] = b
movq -8(%rbp), %r8
movq -168(%rbp), %r9
movq -152(%rbp), %r13
movq %r13, ( %r8, %r9 )

#.t20 = 1
movq $1, -184(%rbp)

#.t21 = j + .t20
movq -40(%rbp), %r13
movq -184(%rbp), %r14
addq %r13, %r14
movq %r14, -192(%rbp)

#.t23 = .t21 * 8
movq -192(%rbp), %r13
movq $8, %r14
imulq %r13, %r14
movq %r14, -200(%rbp)

#arr[.t23] = a
movq -8(%rbp), %r8
movq -200(%rbp), %r9
movq -120(%rbp), %r13
movq %r13, ( %r8, %r9 )

#goto .label5  
jmp .label5

#.label6:   
.label6:

#.label5:   
.label5:

#goto .label4  
jmp .label4

#.label3:   
.label3:

#goto .label2  
jmp .label2

#.label1:   
.label1:

#ret   
popq %r15
popq %r14
popq %r13
popq %r12
popq %rsi
popq %rdi
popq %rbx
addq $208, %rsp
popq %rbp
movq $8, %r13
ret

#main:   
main:
pushq %rbp
movq %rsp, %rbp
subq $96, %rsp

#.t24 = 3
movq $3, -8(%rbp)

#.t25 = 2
movq $2, -16(%rbp)

#.t26 = 1
movq $1, -24(%rbp)

#.t27 = alloc_mem(32) 
movq %rsp, -96(%rbp)
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
movq $32, %rdi
call malloc@plt
movq -96(%rbp), %rsp
movq %rax, -40(%rbp)

#.t28 = 0
movq $0, -32(%rbp)

#.t27[.t28] = 3 
movq -40(%rbp), %r13
movq -32(%rbp), %r14
movq $3, %r15
movq %r15, (%r13, %r14)

#.t28 = .t28 + 8
movq -32(%rbp), %r13
movq $8, %r14
addq %r13, %r14
movq %r14, -32(%rbp)

#.t27[.t28] = .t24 
movq -40(%rbp), %r13
movq -32(%rbp), %r14
movq -8(%rbp), %r15
movq %r15, (%r13, %r14)

#.t28 = .t28 + 8
movq -32(%rbp), %r13
movq $8, %r14
addq %r13, %r14
movq %r14, -32(%rbp)

#.t27[.t28] = .t25 
movq -40(%rbp), %r13
movq -32(%rbp), %r14
movq -16(%rbp), %r15
movq %r15, (%r13, %r14)

#.t28 = .t28 + 8
movq -32(%rbp), %r13
movq $8, %r14
addq %r13, %r14
movq %r14, -32(%rbp)

#.t27[.t28] = .t26 
movq -40(%rbp), %r13
movq -32(%rbp), %r14
movq -24(%rbp), %r15
movq %r15, (%r13, %r14)

#.t28 = .t28 + 8
movq -32(%rbp), %r13
movq $8, %r14
addq %r13, %r14
movq %r14, -32(%rbp)

#.t27 = .t27 + 8
movq -40(%rbp), %r13
movq $8, %r14
addq %r13, %r14
movq %r14, -40(%rbp)

#data = .t27
movq -40(%rbp), %r13
movq %r13, -48(%rbp)

##callnew   
movq %rsp, -96(%rbp)
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp

#push data  
pushq -48(%rbp)

#call, temp  
call temp
addq %r13, %rsp
movq -96(%rbp), %rsp

#move8 %rax .t29 
movq %rax, -56(%rbp)

#.t30 = 0
movq $0, -64(%rbp)

#i = .t30
movq -64(%rbp), %r13
movq %r13, -72(%rbp)

#.t31 = 0
movq $0, -80(%rbp)

#.t33 = .t31 * 8
movq -80(%rbp), %r13
movq $8, %r14
imulq %r13, %r14
movq %r14, -88(%rbp)

#print, data[.t33] int 
movq -48(%rbp), %r8
movq -88(%rbp), %r9
mov ( %r8, %r9 ), %rax
mov %rax, %rsi
lea .note0(%rip), %rax
mov %rax, %rdi
xor %rax, %rax
movq %rsp, -96(%rbp)
shr $4, %rsp
sub $1, %rsp
shl $4, %rsp
call printf@plt
movq -96(%rbp), %rsp

pop %rbx
mov $60, %rax       # System call number for exit
xor %rdi, %rdi      # Exit code is 0
syscall
