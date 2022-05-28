#Assignment 5d - Lab 03
.data
	i:		.word	0
	n:		.word	4
	step:		.word	1
	sum:		.word	0
	A: 		.word	1, 2, 3, 0, 5, 6
.text
	la	$t7, i
	lw	$s1, 0($t7)
	la	$s2,	A
	la	$t7,	n
	lw	$s3, 0($t7)
	la	$t7,	step
	lw	$s4, 0($t7)
	la	$t7,	sum
	lw	$s5, 0($t7)
	
   loop:
   	add	$s1, $s1, $s4
   	add	$t1, $s1, $s1
   	add	$t1, $t1, $t1
   	add	$t1, $t1, $s2
   	
   	lw	$t0, 0($t1)
   	add	$s5, $s5, $t0
   	bne	$t0, $0, loop
   	syscall
