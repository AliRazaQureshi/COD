.data
    msg1: .asciiz"Enter hte number: "
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
    move $t0, $v0

    move $a0, $t0

    jal FACT

    move $t2, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
.end main

.globl FACT
.ent FACT
FACT:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a0, 4($sp)

    slti $t0, $a0, 1

    beq $t0, $0, L1

    addi $v0, $0, 1

    addi $sp, $sp, 8

    jr $ra

L1:
    addi $a0, $a0, -1

    jal FACT

    lw $ra, 0($sp)
    lw $a0, 4($sp)
    addi $sp, $sp, 8

    mult $a0, $v0

    mflo $v0

    jr $ra

    



