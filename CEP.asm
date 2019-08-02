.data
    msg1: .asciiz"Enter CEP marks: "
    msg2: .asciiz"\nEnter difficulty level: "
    msg3: .asciiz"\nCEP marks is "
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

    li $v0, 5
    syscall
    move $s1, $v0
    
    slti $t0, $s1, 3

    bne $t0, $0, SAME

    addi $s0, $s0, 5

SAME:li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    jr $ra
.end main