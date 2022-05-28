#Laboratory Exercise 5, Assignment 2
.data
	mess1:	.asciiz	"The sum of "
	mess2:	.asciiz	" and "
	mess3:	.asciiz	" is "
.text
	addi	$s0, $0, 5
	addi $s1, $0, 4
	add  $s2, $s0, $s1
	li	$v0, 4
	la	$a0, mess1
	syscall
	li	$v0, 1
	la      $a0, 0($s0)
	syscall
	li 	$v0, 4
	la	$a0, mess2
	syscall
	li	$v0, 1
	la	$a0, 0($s1)
	syscall
	li	$v0, 4
	la	$a0, mess3
	syscall
	li	$v0, 1
	la	$a0, 0($s2)
	syscall
