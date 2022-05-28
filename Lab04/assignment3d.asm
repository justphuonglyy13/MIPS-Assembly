#Laboratory Exercise 4, Home Assignment 3d
.text
	addi		$s1, $0, 5
	addi		$s2, $0, 5
	slt		$t0, $s2, $s1
	beq		$t0, $0, L
	
L:	