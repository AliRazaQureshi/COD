.data
    msg1: .asciiz"Enter the number: "
    msg2: .asciiz"\nThe factorial is: "
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

    addi $s0, $s0, 1

    addi $t0, $0, 1

    addi $t1, $0, 1

LOOP:
    slt $t2, $t1, $s0

    beq $t2, $0, RESULT

    mult $t1, $t0

    mflo $t0

    addi $t1, $t1, 1

    j LOOP

RESULT:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    jr $ra
.end main