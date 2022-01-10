.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int: "
promptN: .asciiz "Enter an int N: "
resultEven: .asciiz "THIS IS EVEN"
resultOdd: .asciiz "THIS IS ODD"
resultToomany: .asciiz "TOO MANY TIMES"
newline: .asciiz "\n"

.globl main
.text

main: 
	li $v0, 4		      
	la $a0, promptN
	syscall
	
	li $v0, 5
	syscall 
	move $t1, $v0
	
	blez $t1, END
	
LOOPINIT:
	li $t0, 0
	li $t4, 1
WHILE:
	bge $t0, $t1, DONE
	
	li $v0, 4		      
	la $a0, promptA
	syscall
	
	li $v0, 5
	syscall 
	move $t2, $v0
	
	addi $t0, $t0, 1
	
	multu $t2, $t4
	mflo $t4
 	j WHILE

DONE:	
	li $v0, 1
	move $a0, $t4
	syscall

END:
	li $v0, 10
	syscall
