.data
    msg1: .asciiz"Enter the first number:  "
    msg2: .asciiz"\nEnter the second number:  "
    msg3: .asciiz"\nEnter the third number:  "
    msg4: .asciiz"\nAverage is: "
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

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0
    
    move $a0, $t0
    move $a1, $t1
    move $a2, $t2

    jal AVERAGE

    move $t3, $v0

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
.end main

.globl AVERAGE
.ent AVERAGE
AVERAGE:
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp) 

    add $s0, $a0, $a1

    add $s0, $s0, $a2

    addi $s1, $0, 3

    div $s0, $s1

    mflo $s2

    move $v0, $s2

    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp) 
    addi $sp, $sp, 12

    jr $ra
.end AVERAGE

