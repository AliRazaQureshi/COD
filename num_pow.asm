.data
    msg1: .asciiz"Enter the number: "
    msg2: .asciiz"\nEnter the power: "
    msg3: .asciiz"\nResult is: "
    msg4: .asciiz"\nINFINTY"
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

    beq $t1, $0, CHECK

PROCEED:
    move $a0, $t0
    move $a1, $t1

    jal CALCULATE
    
    move $t2, $v0

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    j END

CHECK:
    bne $t0, $0, PROCEED

    li $v0, 4
    la $a0, msg4
    syscall

END:
    li $v0, 10
    syscall
.end main

.globl CALCULATE
.ent CALCULATE
CALCULATE:
    addi $sp, $sp, -16 
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)

    beq $a1, $0, CONDITION

    add  $s0, $0, $a0

    addi $s1, $0, 1

LOOP:    
    slt $s2, $s1, $a1

    beq $s2, $0, OUT

    mult $s0, $a0

    mflo $s0

    addi $s1, $s1, 1

    j LOOP

CONDITION:
    addi $s3, $0, 1
    move $v0, $s3
    j EIXT

OUT:
    move $v0, $s0

EIXT:
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    addi $sp, $sp, 16 

    jr $ra
.end CALCULATES
    