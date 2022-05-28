#Laboratory Exercise 2, Assignment 4
.text
	#Assign X, Y
	addi		$t1, $zero, 5	# X= 5
	addi		$t2, $zero, -1	# Y = -1
	#Expression Z = 2X + Y
	add		$s0, $t1, $t1 	# Z = X + X = 2X 
	add 		$s0, $s0, $t2	# Z = Z + Y = 2X + Y