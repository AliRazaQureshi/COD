.data
    msg1: .asciiz"Enter the value x: "
    msg2: .asciiz"\nEnter the value y: "
    msg3: .asciiz"\nEnter the value z: "
    msg4: .asciiz"\nResult of x-y+z-12 is "
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

    jal SOLVE

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

.globl SOLVE
.ent SOLVE
SOLVE:
    addi $sp, $sp, -4
    sw $s0, 0($sp)

    sub $s0, $a0, $a1

    add $s0, $s0, $a2

    addi $s0, $s0, -12

    move $v0, $s0

    lw $s0, 0($sp)

    addi $sp, $sp, 4

    jr $ra
.end SOLVE







    