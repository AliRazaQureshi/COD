.data
    msg1: .asciiz"Enter the nth number: "
    msg2: .asciiz"\nfibonacci series: "
    msg3: .asciiz" "
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

    li $v0, 4
    la $a0, msg2
    syscall

    addi $t0, $0, 0
    addi $t1, $0, 1
    addi $t4, $0, 1

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    addi $s0, $s0, -1

LOOP:
    slt $t2, $t4, $s0

    beq $t2, $0, EXIT

    add $s1, $t0, $t1

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    add $t0, $t1, $0

    add $t1, $s1, $0

    addi $t4, $t4, 1

    j LOOP

EXIT:
    jr $ra
.end main



