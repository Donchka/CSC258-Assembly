.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int A: "
resultEven: .asciiz "THIS IS EVEN"
resultOdd: .asciiz "THIS IS ODD"
resultToomany: .asciiz "TOO MANY TIMES"
newline: .asciiz "\n"
N:	.word	5

.globl main
.text

main: 

LOOPINIT:
	li $t0, 0
	lw $t1, N
WHILE:
	li $v0, 4		      
	la $a0, promptA
	syscall
	
	li $v0, 5
	syscall 
	move $t2, $v0
	
	addi $t0, $t0, 1
	
	bge $t0, $t1, MANY
	andi $t3, $t2, 1
 	beq  $t3, $zero, EVEN
 	
 	li $v0, 4
 	la $a0, resultOdd
 	syscall
 	
 	li $v0, 4
	la $a0, newline
	syscall
 	j WHILE

EVEN:
 	li $v0, 4
 	la $a0, resultEven
 	syscall
 	j DONE		

MANY:
	li $v0, 4
 	la $a0, resultToomany
 	syscall

DONE:	li $v0, 10
	syscall
