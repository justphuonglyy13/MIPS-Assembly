#Assignment 1 - Lab 03
.data
	i: 	.word	2
	j:	.word	5
.text
	la	$t6, i				#load address of i to register $t6
	lw	$s1, 0($t6)		#load value of i ($t6) to $s1
	la	$t7, j				#load address of j to register $t7
	lw	$s2, 0($t7)		#load value of j ($t7) to $s2
   start:
	slt	$t0, $s2, $s1		# j < i => t0 = 1
	bne	$t0, $0, else		# if i <= j continue executing else jumping to else
	addi	$t1, $t1, 1		# x += 1
	addi $t3, $0, 1			# z = 1
   	j	endif			# jump to branch endif
   else:
	addi	$t2, $t2, -1		# y -= 1
	add	$t3, $t3, $t3		# z *= 2
   endif:	
	syscall