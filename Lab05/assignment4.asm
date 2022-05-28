#Laboratory Exercise 5, Assignment 4
.data
x: 	.space 	100 					# destination string x, empty 
y: 	.space	100 					# source string y
mes_in:	.asciiz	"Enter the string to copy: "
mes_out: 	.asciiz	"String copied: "
mes_lgth:	.asciiz	"Length of string: "

.text
	li	$v0, 54	
	la	$a0, mes_in
	la 	$a1, y
	la	$a2, 100
	syscall
strcpy:
	la	$a0, x					# a0 = destination string x
	la	$a1, y					# a1 = source string y
	add 	$s0, $zero, $zero 			#s0 = i=0
L1:
	add 	$t1, $s0, $a1 				#t1 = s0 + a1 = i + y[0]
								#    = address of y[i]
	lb 	$t2, 0($t1)		 		#t2 = value at t1 = y[i]
	add 	$t3, $s0, $a0 				#t3 = s0 + a0 = i + x[0]
								#    = address of x[i]
	sb 	$t2, 0($t3) 				#x[i]= t2 = y[i]
	beq  $t2,	$zero, end_of_strcpy 	#if y[i]==0, exit
	nop
	addi $s0, $s0, 1 				#s0=s0 + 1 <-> i=i+1
	j 	L1						#next character
	nop
end_of_strcpy:	
	li	$v0, 59	
	la	$a1, 0($a0)
	la	$a0, mes_out
	syscall
	
	li 	$v0, 56
	la	$a0, mes_lgth
	la	$a1, 0($s0)
	subi	$a1, $a1, 1				#length of x without null character at the end of the string
	syscall
exit: 