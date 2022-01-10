.data 
array1:	.word	5, 8, 3, 4, 7, 2
newline: .asciiz "\n"

.globl main
.text

main:
LOOPINIT:
	li $t2, 6
	la $t1, array1
	add $t0, $zero, $zero
	add $t3, $zero, $zero
	addi $t6, $zero, 1
WHILE:
	bge $t0, $t2, DONE
	add $t4, $t1, $t3
	lw $t5, ($t4)
	mult $t5, $t6
	mflo $t6
	addi $t3, $t3, 4
	addi $t0, $t0, 1
 	j WHILE

DONE:	
	li $v0, 1
	move $a0, $t6
	syscall

END:
	li $v0, 10
	syscall
