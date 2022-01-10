.data
promptNum: .asciiz "Enter an number: "
result: .asciiz "The result is:"
newline: .asciiz "\n"

.text
main:
	li $v0, 4		      
	la $a0, promptNum
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	jal mystery
	
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	
	li $v0, 4 	
	la $a0, newline 
	syscall
	
	li $v0, 4		      
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall

mystery:
	lw $a0, 0($sp)
	bnez $a0, notBase
	sw $zero, 0($sp)
	jr $ra
notBase:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $a0, $a0, -1
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal mystery
	lw $v0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	li $t1, 2
	mult $a0, $t1
	mflo $t1
	addi $t1, $t1, -1
	add $t2, $v0, $t1
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	jr $ra
	