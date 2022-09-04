#Final Ex, Task 6
#Nguyen Trong Tue - 20194710

.data
	CharPtr: 		.word 	0 	# Bien con tro, tro toi kieu asciiz
	BytePtr: 		.word 	0 	# Bien con tro, tro toi kieu Byte
	WordPtr: 		.word 	0 	# Bien con tro, tro toi mang kieu Word
	Word2DPtr:	.word	0	# Bien con tro, tro toi mang 2 chieu kieu Word
	newCharPtr:	.word	0	# Bien con tro, toi kieu asciiz
	
	Char:	.asciiz	"Fm"
	Byte:		.byte 	15, 16, 17, 18, 19, 20
	Word:	.word 	17, 25, 44, 33, 26
	
	m:		.word	0
	n:		.word	0
	
	gottenValue:			.word
	totalAllocatedMemory:	.word	
	
	textCharPtr:	.asciiz	"&CharPtr = "
	textBytePtr:	.asciiz	"&BytePtr = "
	textWordPtr:	.asciiz	"&WordPtr = "
	
	textCharDePtr:		.asciiz	"*CharPtr = "
	textByteDePtr:		.asciiz	"*BytePtr = "
	textWordDePtr:	.asciiz	"*WordPtr = "
	
	textCharValueOfPtr:		.asciiz	"CharPtr = "
	textByteValueOfPtr:		.asciiz	"BytePtr = "
	textWordValueOfPtr:	.asciiz	"WordPtr = "
		
	message1:	.asciiz	"Dia chi cua cac bien con tro:\n"
	message2:	.asciiz	"Dia chi ma cac bien con tro tro toi:\n"
	message3:	.asciiz	"Khu con tro:\n"
	
	message4:	.asciiz	"Tong bo luong bo nho da cap phat cho cac bien dong = "
	message5:	.asciiz	" byte(s)"
	
	message6:	.asciiz	"Nhap so dong cua ma tran: "
	message7: 	.asciiz	"Nhap so cot cua ma tran: "
	message8:	.asciiz	"Nhap tung phan tu cua ma tran: "
	
	message9:	.asciiz	"Nhap i, j cua a[i][j] theo thu tu lan luot"
	message10:	.asciiz	"getArray[i][j] = "

	message11:	.asciiz	"Nhap i,j cho phan tu thuc hien setArray[i][j] theo thu tu lan luot"
	message12:	.asciiz	"Nhap gia tri moi cua a[i][j]"
				
	message_err:	.asciiz	"Chi so phan tu khong hop le!"
	
	message_end:	.asciiz	"--------------------END--------------------"
	
	newLine:		.asciiz	"\n"
	
.kdata
	Sys_TheTopOfFree: 	.word 	1
	Sys_MyFreeSpace:
	
.text
	#Tong bo luong bo nho da cap phat cho cac bien dong
	addi	$s0, $zero, 0
	
	#Khoi tao vung nho cap phat dong
	jal SysInitMem

#-----------------------	
# Cap phat cho bien con tro, gom 3 phan tu,moi phan tu 1 byte
#-----------------------
	la 	$a0, CharPtr
	addi $a1, $zero, 3
	addi $a2, $zero, 1
	jal 	malloc
	jal 	init_CharPtr
#-----------------------
# Cap phat cho bien con tro, gom 6 phan tu, moi phan tu 1 byte
#-----------------------
	la 	$a0, BytePtr
	addi $a1, $zero, 6
	addi $a2, $zero, 1
	jal 	malloc
	jal 	init_BytePtr
	nop
#-----------------------
# Cap phat cho bien con tro, gom 5 phan tu, moi phan tu 4 byte
#-----------------------	
	la 	$a0, WordPtr
	addi $a1, $zero, 5
	addi $a2, $zero, 4
	jal 	malloc_WordPtr
	jal 	init_WordPtr

	#lock: j lock
	#nop
	j	getPointerAddress
	
#-----------------------
# Khoi tao gia tri CharPtr
#-----------------------	
init_CharPtr:
	la	$t1,	Char
	addi $t0, $t8, -1							#$t0 = $t8
	addi	$t2, $zero, 0							#$t2: dem so phan tu
loop_init_CharPtr:
	beq	$t2, $a1, init_CharPtr_back
	addi	$t0, $t0, 1
	lb	$t3, 0($t1)
	sb	$t3,	0($t0)
	addi	$t1, $t1, 1
	addi	$t2, $t2, 1
	j 	loop_init_CharPtr	

init_CharPtr_back:	
	jr	$ra		
	
#-----------------------
# Khoi tao gia tri BytePtr
#-----------------------	
init_BytePtr:
	la	$t1,	Byte
	addi $t0, $t8, -1
	addi	$t2, $zero, 0
loop_init_BytePtr:
	beq	$t2, $a1, init_BytePtr_back
	addi	$t0, $t0, 1
	lb	$t3, 0($t1)
	sb	$t3,	0($t0)
	addi	$t1, $t1, 1
	addi	$t2, $t2, 1
	j 	loop_init_BytePtr	

init_BytePtr_back:	
	jr	$ra		

#-----------------------
# Khoi tao gia tri WordPtr
#-----------------------	
init_WordPtr:
	la	$t1,	Word
	addi $t0, $t8, -4
	addi	$t2, $zero, 0
loop_init_WordPtr:
	beq	$t2, $a1, init_WordPtr_back
	addi	$t0, $t0, 4
	lw	$t3, 0($t1)
	sw	$t3,	0($t0)
	addi	$t1, $t1, 4
	addi	$t2, $t2, 1
	j 	loop_init_WordPtr	

init_WordPtr_back:	
	jr	$ra			
	
#---------------------------------------------------------------------------------------------
SysInitMem:
	la 	$t9, Sys_TheTopOfFree 	#Lay con tro chua dau tien con trong, khoi tao
	la 	$t7, Sys_MyFreeSpace 	#Lay dia chi dau tien con trong, khoi tao
	sw 	$t7, 0($t9) 			#Luu lai
	jr 	$ra
#---------------------------------------------------------------------------------------------

malloc: 
	la 	$t9, Sys_TheTopOfFree 	#
	lw 	$t8, 0($t9) 			#Lay dia chi dau tien con trong
	sw 	$t8, 0($a0) 			#Cat dia chi do vao bien con tro
	addi $v0, $t8, 0 			# Dong thoi la ket qua tra ve cua ham	
	mul 	$t7, $a1,$a2 			#Tinh kich thuoc cua mang can cap phat
	mflo	$t2					#Cap nhat tong bo luong bo nho da cap phat cho cac bien dong
	add	$s0, $s0, $t2
	add 	$t6, $t8, $t7 			#Tinh dia chi dau tien con trong
	sw 	$t6, 0($t9) 			#Luu tro lai dia chi dau tien do vao bien Sys_TheTopOfFree
	jr	$ra
#---------------------------------------------------------------------------------------------

malloc2: 
	jal	malloc_WordPtr
init2DArr:
	#la	$t1, Word2DPtr
	#lw	$t1, 0($t1)
	addi $t0, $t8, -4
	addi	$t2, $zero, 0	
loop_init_Word2DPtr:
	beq	$t2, $a3, init_Word2DPtr_back
	addi	$t0, $t0, 4
	
	li	$v0, 51
	la	$a0, message8
	syscall
	
	sw	$a0,	0($t0)
	addi	$t2, $t2, 1
	j 	loop_init_Word2DPtr	

init_Word2DPtr_back:	
	j	getArray

#-----------------------------------------------------------------------------------------
#CAU 1: Dia chi kieu word/ mang word phai chia het cho 4 (su dung malloc_WordPtr)
malloc_WordPtr:
	la 	$t9, Sys_TheTopOfFree 	#
	lw 	$t8, 0($t9) 			#Lay dia chi dau tien con trong
	
	addi	$t5, $zero, 0x4
	div	$t8, $t5
	mfhi $t4
	beq 	$t4, $zero, afterCheckingDivisionBy4		#Chia 4 lay du de kiem tra
	beq 	$t4, 0xfffffffd, missing3					#=-3 => thieu 3
	beq 	$t4, 0xfffffffe, missing2					#=-2 => thieu 2
	beq  $t4, 0xffffffff, missing1					#=-1 => thieu 1
missing3:
	addi $t3, $zero, 3					
	add	$t8, $t8, $t3
	j afterCheckingDivisionBy4
missing2:
	addi $t3, $zero, 2
	add	$t8, $t8, $t3
	j afterCheckingDivisionBy4
missing1:
	addi $t3, $zero, 1
	add	$t8, $t8, $t3
	j afterCheckingDivisionBy4

afterCheckingDivisionBy4:	
	sw 	$t8, 0($a0) 			#Cat dia chi do vao bien con tro
	
	addi $v0, $t8, 0 			# Dong thoi la ket qua tra ve cua ham	
	mul 	$t7, $a1,$a2 			#Tinh kich thuoc cua mang can cap phat
	mflo	$t2					#Cap nhat tong bo luong bo nho da cap phat cho cac bien dong
	add	$s0, $s0, $t2
	add 	$t6, $t8, $t7 			#Tinh dia chi dau tien con trong
	sw 	$t6, 0($t9) 			#Luu tro lai dia chi dau tien do vao bien Sys_TheTopOfFree
	jr	$ra
#-----------------------------------------------------------------------------------------
#CAU 3: Dia chi con tro 	
getPointerAddress:
	li	$v0, 4
	la	$a0, message1
	syscall

	#&CharPtr
	li	$v0, 4
	la	$a0, textCharPtr
	syscall
	li	$v0,	34
	la	$a0, CharPtr
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#&BytePtr
	li	$v0, 4
	la	$a0, textBytePtr
	syscall
	li	$v0,	34
	la	$a0, BytePtr
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#&WordPtr
	li	$v0, 4
	la	$a0, textWordPtr
	syscall
	li	$v0,	34
	la	$a0, WordPtr
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	nop
#----------------------------------------------------------------------------------------
#CAU 3: Dia chi con tro tro den
getAddressPointedbyThePointer:

	li	$v0, 4
	la	$a0, newLine
	syscall
	
	li	$v0, 4
	la	$a0, message2
	syscall
	
	#CharPtr
	li	$v0, 4
	la	$a0, textCharValueOfPtr
	syscall
	li	$v0,	34
	la	$t0, CharPtr
	lw	$a0, 0($t0)
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#BytePtr
	li	$v0, 4
	la	$a0, textByteValueOfPtr
	syscall
	li	$v0,	34
	la	$t0, BytePtr
	lw	$a0, 0($t0)
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#WordPtr
	li	$v0, 4
	la	$a0, textWordValueOfPtr
	syscall
	li	$v0,	34
	la	$t0, WordPtr
	lw	$a0, 0($t0)
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall	

#----------------------------------------------------------------------------------------
#CAU 2: Khu tham chieu
getValuebyDereferenceThePointer:
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	li	$v0, 4
	la	$a0, message3
	syscall
	
	#*CharPtr
	li	$v0, 4
	la	$a0, textCharDePtr
	syscall
	
	la	$t1, CharPtr
	lw	$t2,	0($t1)
	lb	$t1,	0($t2)
	la	$t3, gottenValue
	sw	$t1, 0($t3)
	
	li	$v0,	4
	la	$a0, gottenValue
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#*BytePtr
	li	$v0, 4
	la	$a0, textByteDePtr
	syscall
	la	$t1, BytePtr
	lw	$t2,	0($t1)
	lb	$t1,	0($t2)
	la	$t3, gottenValue
	sw	$t1, 0($t3)
	
	li	$v0,	1
	la	$t0, gottenValue
	lw	$a0,	0($t0)
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#*WordPtr
	li	$v0, 4
	la	$a0, textWordDePtr
	syscall
	la	$t1, WordPtr
	lw	$t2,	0($t1)
	lw	$t1,	0($t2)
	la	$t3, gottenValue
	sw	$t1, 0($t3)
	
	li	$v0,	1
	la	$t0, gottenValue
	lw	$a0,	0($t0)
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall	

#----------------------------------------------------------------------------------------
#CAU 5: Tong bo luong bo nho da cap phat cho cac bien dong
totalAllocatedCapacity:
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	li	$v0, 4
	la	$a0, message4
	syscall
	
	la	$t0,	totalAllocatedMemory
	sw	$s0,	0($t0)
	
	li	$v0, 1
	la	$t0, totalAllocatedMemory
	lw	$a0,	0($t0)
	syscall
	
	li	$v0, 4
	la	$a0, message5
	syscall	
	
	li	$v0,	4
	la	$a0, newLine
	syscall
	
	#lock:
	#j lock
#----------------------------------------------------------------------------------------
#CAU 6: Malloc2 cap phat dong mang hai chieu
	li	$v0, 51
	la	$a0, message6
	syscall
	addi	$t1,	$a0, 0
	
	li	$v0, 51
	la	$a0, message7
	syscall
	addi	$t2,	$a0, 0
	
#-----------------------	
# Cap phat cho bien con tro, gom 3 phan tu,moi phan tu 1 byte
#-----------------------
	la 	$a0, Word2DPtr
	mul	$a3, $t1, $t2
	addi	$a1, $a3, 0
	addi $a2, $zero, 4
	
	la	$t0,	m
	sw	$t1,	0($t0)
	
	la	$t0, n
	sw	$t2,	0($t0)
		
	jal	malloc2
	
	

#-------------------------------------------------------------------------------------------------------------------------
#CAU 7: GET_ARRAY	
getArray:
	li	$v0, 51,
	la	$a0, message9
	syscall
	addi	$t1, $a0, 0
	
	li	$v0, 51
	la	$a0, message9
	syscall
	addi	$t2, $a0, 0
	
	la	$a3,	Word2DPtr
	lw	$a3, 0($a3)
	
	la	$a1, m
	lw	$a1, 0($a1)
	
	la	$a2, n
	lw	$a2, 0($a2)
	
	slt	$t5, $t1, $a1
	slt	$t6, $t2, $a2
	beq	$t5, $zero, outOfRange
	beq	$t6, $zero, outOfRange
	
	mul	$t3, $t1, $a2
	add	$t3, $t3, $t2
	mul	$t3, $t3, 4
	
	add 	$a3, $a3, $t3
	
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	li	$v0, 4
	la	$a0, message10
	syscall
	
	li	$v0, 1
	lw	$a0, 0($a3)
	syscall
	
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	j	setArray
	
outOfRange:
	li	$v0, 55
	la	$a0,	message_err
	li	$a1, 	0
	syscall	
	j 	end
#--------------------------------------------------------------------
#CAU 7: SET ARRAY
setArray:
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	li	$v0, 51,
	la	$a0, message11
	syscall
	addi	$t1, $a0, 0
	
	li	$v0, 51
	la	$a0, message11
	syscall
	addi	$t2, $a0, 0
	
	la	$a3,	Word2DPtr
	lw	$a3, 0($a3)
	
	la	$a1, m
	lw	$a1, 0($a1)
	
	la	$a2, n
	lw	$a2, 0($a2)
	
	slt	$t5, $t1, $a1
	slt	$t6, $t2, $a2
	beq	$t5, $zero, outOfRange
	beq	$t6, $zero, outOfRange
	
	mul	$t3, $t1, $a2
	add	$t3, $t3, $t2
	mul	$t3, $t3, 4
	
	add 	$a3, $a3, $t3
	
	li	$v0, 51
	la	$a0, message12
	syscall
	
	sw	$a0, 0($a3)
	
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	
	j	copyCharPtr
#-----------------------------------------------------------------------------
#CAU 4:	Copy CharPtr (strcpy simulation)
copyCharPtr:
	la 	$a0, newCharPtr
	addi $a1, $zero, 3
	addi $a2, $zero, 1
	jal 	malloc
	jal 	init_CharPtr
	
strcpy:
	la	$a0, newCharPtr					# a0 = address of newWordPtr
	lw	$a0, 0($a0)						# a0 = address that newWordPtr is pointing to
	
	la	$a1, CharPtr						# a1 = address of WordPtr
	lw	$a1, 0($a1)						# a0 = address that WordPtr is pointing to
	
	add 	$s0, $zero, $zero 					#s0 = i=0
L1:
	add 	$t1, $s0, $a1 						#t1 = s0 + a1 = (WordPtr + i)
										#    = address of   *(WordPtr + i)	
	lb 	$t2, 0($t1)		 				#t2 = value at t1 =  *(WordPtr + i)
	add 	$t3, $s0, $a0 						#t3 = s0 + a0 = (newWordPtr + i)
										#    = address of  *(newWordPtr + i)
	sb 	$t2, 0($t3) 						# *(newWordPtr + i) = t2 = *(WordPtr + i)
	beq  $t2,	$zero, end_of_strcpy 			#if *(WordPtr + i) == 0 == '\0', exit
	nop
	addi $s0, $s0, 1 						#s0=s0 + 1 <-> i=i+1
	j 	L1						 		#next character

end_of_strcpy:
	nop
	
	j 	end		
#------------------------------------------- END-----------------------------------------	
end:	
	
	
	
