#Laboratory Exercise 2, Assignment 5
.text
	#Assign X, Y
	addi		$t1, $zero, 4	# X = $t1
	addi 	$t2, $zero, 5	# Y = $t2
	#Expression Z = 3*XY
	mul		$s0, $t1, $t2	# Z = X * Y
	mul		$s0, $s0, 3	# Z = 3 * Z = 3 * XY 
	#Z' = Z
	mflo		$s1			#move from LO to $s1