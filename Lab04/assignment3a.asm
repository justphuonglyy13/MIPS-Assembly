#Laboratory Exercise 4, Home Assignment 3a
.text
	addi		$s1, $0, -25
	bltz		$s1, NEGATIVE
POSITIVE:
	addi		$s0, $s1, 0
	j		EXIT
NEGATIVE:	
	li		$t1, 0xffffffff
	xor		$t0, $s1, $t1
	addi		$s0, $t0, 1
EXIT:
