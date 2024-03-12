.data
	myLista : .space 1024
	prompt1 : .asciiz "Kolku broevi kje ima vo nizata?"
	prompt2 :  .asciiz " Vnesu broj: "
	prompt3 : .asciiz "Ima vkupno "
	
.text

	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	add $s5,$zero, $zero
	add $t0, $v0, $zero
	add $t2, $t0, $zero
	addi $t1 , $t1, 0
	while:  blez $t0 , endWhile 
		li $v0,4
		la $a0, prompt2
		syscall
		li $v0,5
		syscall
 		sw $v0, myLista($t1) #Store contents of s0 in first position of array
 		addi $t1, $t1 , 4 #increment the index by 4
 		subi $t0 , $t0 , 1
 	j while
 	
 		
 	endWhile: 
 		addi $t1 , $zero, 8
 		subi $t2,  $t2 , 2
 		While1: blez $t2, END
 			subi $t3 , $t1 , 8
 			subi $t4 , $t1 , 4		
			lw $t5 , myLista($t3)
			lw $t6 , myLista($t4)
			lw $t7 , myLista($t1)
			add $s6 , $zero, $t7
			add $s4 , $t5, $t6
			sub $t2, $t2 , 1
			addi $t1 , $t1 , 4
			beq $s4, $s6, brojac
		j While1
	brojac:
		addi $s5, $s5,1
		j While1
		
	END:
		li $v0, 4
		la $a0, prompt3
		syscall
		li $v0, 1
		move $a0,$s5
		syscall
		