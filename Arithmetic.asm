		.data
prompt: 	.asciiz "\nPlease Input a value: "
prompt2:	.asciiz "\nPlease Input another value: "
menu: 		.asciiz "\nEnter the number associated with the operation you want performed:\n1=> add, 2=> subtract or 3=> multiply "
result: 	.asciiz "Final result: "
		.globl main
		.text
main: 
	li $t3, 1 			# immediately loads 1 into $t3
	li $t4, 2			# immediately loads 2 into $t4
	li $t5, 3			# immediately loads 3 into $t5
	
	# 1st number
	li $v0, 4			# command to print_string
	la $a0, prompt  		# load string to print
	syscall				# execute the command
	
	li $v0, 5 			# read an integer
	syscall				# execute command
	move $t0, $v0   		# moving number read from user input into $v1
	
	
	# 2nd number, identical to 1st number commands
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0			# moving 2nd number read from user input intio $v1
	
	# Printing menu
	li $v0, 4			# command to print string
	la $a0, menu			# load string to print
	syscall				# execute command
	
	# Reads numbers provided by user from menu
	li $v0, 5			# command to read integer
	syscall				# execute command
	move $t2, $v0			# move the integer provided into $t2
	
	beq $t2,$t3,addition	# if 1 => run addProcess
	beq $t2,$t4,subtract	# if 2 => run subtractProcess
	beq $t2,$t5,multiply	# if 3 => run multiplyProcess


addition:
	# arithmetics
	add $t6, $t0, $t1		# add values stored in $t0 & $t1 and assigns into $t6
	li $v0, 4			# command to print string
	la $a0, result			# loads the string to print
	syscall				# execute command
	
	# print result
	li $v0, 1			
	la $a0, ($t6)			# print result as an integer
	syscall
	
	li $v0, 10			# terminate program
	syscall


subtract:
	# arithmetics
	sub $t6, $t0, $t1		# subtract values stored in $t0 %& $t1 and assigns into $t6
	li $v0, 4
	la $a0, result
	syscall
	
	# print result
	li $v0, 1
	la $a0, ($t6)			# print result as an integer
	syscall
	
	li $v0, 10			# terminate program
	syscall


multiply:
	# arithmetics
	mul $t6, $t0, $t1		# multiply values stored in $t0 & $t1 and assigns into $t6
	li $v0, 4
	la $a0, result
	syscall
	
	# print result
	li $v0, 1
	la $a0, ($t6)			# print result as an integer
	syscall				
	
	li $v0, 10			# terminate program
	syscall