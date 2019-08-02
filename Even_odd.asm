.data
    msg1: .asciiz"Enter the integer: "
    msg2: .asciiz"\nthe integer is even"
    msg3: .asciiz"\nthe integer is odd"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    addi $t0, $0, 2

    div $s0, $t0

    mfhi $t1

    beq $t1, $0, EVEN 

    li $v0, 4
    la $a0, msg3
    syscall

    j OUT

EVEN:li $v0, 4
    la $a0, msg2
    syscall

OUT:jr $ra

.end main