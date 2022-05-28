#Assignment 4b - Lab 03
.data
	i: 	.word	7
	j:	.word	5
	x:	.word	10
	y:	.word	12
	z:	.word	6
.text
	la	$t6, i				#load address of i to register $t6
	lw	$s1, 0($t6)		#load value of i ($t6) to $s1
	la	$t7, j				#load address of j to register $t7
	lw	$s2, 0($t7)		#load value of j ($t7) to $s2
	la	$t5, x			#load address of x to register $t5
	lw	$t1, 0($t5)		#load value of x ($t5) to $t1
	la	$t5, y			#load address of y to register $t5
	lw	$t2, 0($t5)		#load value of y($t5) to $t2
	la	$t5, z			#load address of z to register $t5
	lw	$t3, 0($t5)		#load value of z ($t5) to $t3
   start:
	slt	$t0, $s1, $s2		# i < j => t0 = 1 <=> ( i >= j => t0 = 0)
	bne	$t0, $0, else		# if i >= j (t0 == 0)  continue executing else i < j (t0 == 1 != 0)  jumping to else
	addi	$t1, $t1, 1		# x += 1
	addi $t3, $0, 1			# z = 1
   	j	endif			# jump to branch endif
   else:
	addi	$t2, $t2, -1		# y -= 1
	add	$t3, $t3, $t3		# z *= 2
   endif:	
	syscall
