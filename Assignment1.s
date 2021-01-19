# Tyre McGee
.data
a:   .word 12, 18, 3, 4, 5, 6, 15, 8, 9, 10
size:	.word 10

Initial:   .asciiz "Please select an option.\nPress 1 to see the minimum number in the array.\nPress 2 to see the maximum number in the array.\n"
Error:     .asciiz "Please enter a valid choice.\n"
High:      .asciiz "The highest value in the array is "
Low:       .asciiz "The lowest value in the array is "
.globl main
.text

main:

Start:
la $s0, a	#initalize array
lw $s1,size	#Size
li $t4, 0	#loop counter
li $v0, 4	#print string
la $a0, Initial
syscall
li $v0, 5	#read int
syscall

Invalid:		# Check input to see if valid
or $t0, $v0, $0		# Put the integer 1 or 2 into t0
ori $t1, $0, 1		# Put the choices 1 or 2 into t1 and t2  
ori $t2, $0, 2
beq $t0, $t1, choice_1	#Check if its equal to 1
beq $t0, $t2, choice_2	#Check if its equal to 2
li $v0, 4
la $a0, Error
syscall
or $v0, $0, $0
li $v0, 5
syscall
b Invalid

choice_1:
lw $t5, ($s0)		# load the 1st value into a variable
addi $t6, $t6, 1	# 
sll $t6, $t6, 2		#Make word incrementer a factor of 4
Loop1:
bge $t4, $s1, exit_loop1 	#for loop
addi $t4, $t4, 1		#increment
add $s0, $s0, $t6		#add 4 bytes to get to next word or value in array
lw $t7, ($s0) #value		#load it into memory
bge $t7, $t5, Loop1  		#if condition
or $t5, $t7, $0
b Loop1

exit_loop1: 
li $v0, 4
la $a0, Low
syscall				#print it
li $v0, 1
or $a0, $t5, $0
syscall
j exit

choice_2:

lw $t5, ($s0)			#in prog2 t5 is the temp, t7 is the index
addi $t6, $t6, 1		#size is s1
sll $t6, $t6, 2
Loop2:
bge $t4, $s1, exit_loop2  #for
addi $t4, $t4, 1
add $s0, $s0, $t6
lw $t7, ($s0) #value
ble $t7, $t5, Loop2  #if
or $t5, $t7, $0
b Loop2

exit_loop2: 
li $v0, 4
la $a0, High
syscall
li $v0, 1
or $a0, $t5, $0
syscall

exit:
jr $ra



