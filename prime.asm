.data
    msg1: .asciiz"Enter the numebr: "
    msg2: .asciiz"\nNumer is Prime"
    msg3: .asciiz"\nNumer is Composite"
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

    mflo $s1

    addi $t1, $0, 1

LOOP:
    slt $t2, $t1, $s1

    beq $t2, $0, PRIME

    div $s0, $t0

    mfhi $t3

    beq $t3, $0, COMPOSITE

    addi $t0, $t0, 1

    addi $t1, $t1, 1

    j LOOP

COMPOSITE:
    li $v0, 4
    la $a0, msg3
    syscall

    j OUT

PRIME:
    li $v0, 4
    la $a0, msg2
    syscall

OUT:jr $ra
.end main
