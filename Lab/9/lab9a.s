.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int A: "
resultEven: .asciiz "THIS IS EVEN"
resultOdd: .asciiz "THIS IS ODD"
newline: .asciiz "\n"

.globl main
.text

main: 
    # TODO: Set a breakpoint here and step through. 
    # What does this block of 3 lines do?
	li $v0, 4		      
	la $a0, promptA
	syscall    

    # TODO: Set a breakpoint here and step through. 
    # What does this block of 3 lines do?
	li $v0, 5
	syscall 
	move $t0, $v0
	
	#li $t1, 2
	#div $t0, $t1
	#mfhi $t2
 
IF:	#beq $t2, $zero, ELSE
 	#li $v0, 4
 	#la $a0, resultOdd
 	#syscall
 	#j DONE
 	andi $t3, $t0, 1
 	beq  $t3, $zero, ELSE
 	li $v0, 4
 	la $a0, resultOdd
 	syscall
 	j DONE
 	
 
ELSE:	li $v0, 4
 	la $a0, resultEven
 	syscall

DONE:	li $v0, 10
	syscall
