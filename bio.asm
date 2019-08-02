.data
    msg1: .asciiz"Enter Your Name: "
    msg2: .asciiz"\nEnter Your Age: "
    msg3: .asciiz"\n****Welcome "
    msg4: .asciiz"! Your are "
    msg5: .asciiz" years old now. Stay blessed****"
    nme: .asciiz""
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, nme
    la $a1, 25
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 4
    la $a0, nme
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, msg5
    syscall

    jr $ra
.end main