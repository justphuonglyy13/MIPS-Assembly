#Laboratory Exercise 4, Home Assignment 1
.data
	x:	.word	0x7fffffff
	y:	.word	0x00005142
.text
start:
	la 	$t7, x
	lw 	$s1, 0($t7)
	la 	$t7, y
	lw 	$s2, 0($t7)
	li 	$t0,0 					#No Overflow is default status
	addu $s3,$s1,$s2 				# s3 = s1 + s2
	xor 	$t1,$s1,$s2 				#Test if $s1 and $s2 have the same sign
	bltz 	$t1,EXIT 					#If not, exit
	xor	$t3, $s1, $s3				#Test if $s1 and $s3 have the same sign
	slti	$t4, $t3, 0				#If not then $t4 = 1 otherwise  $t4 = 0	
	beq	$t4, 0, EXIT				#$t4 = 0 <=> No overflowing happened => jump to EXIT branch
	li 	$t0,1 					#If not, then the result is overflow since the sum doesn't have the same sign with two input operands
EXIT:
