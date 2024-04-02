.data

	prompt1: .asciiz  "Kolku broevi? "
	prompt2: .asciiz "Vnesi broj: "
	sum: .asciiz "Sumata na prostite broevi e: "
	
	
.text

	main:
	
	li $v0, 4
	la $a0, prompt1 
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0 # vo t0 se smestuva vneseniot broj
	li $t1, 0 # brojac t1 za whileot
	li $s0, 0 # sumator na site prosti broevi
	li $t3, 0 # smestuvanje na vrednosta od loopot
	
	
	while:
		bge $t1,  $t0,  kraj
		
		li $v0, 4
		la $a0, prompt2
		syscall
		
		li $v0, 5
		syscall
		
		move $a0, $v0
		
		jal proverka
		
		beq $v0, $zero, next
        	add $s0, $s0, $a0  
        	
		
		next:
		addi $t1, $t1, 1
		
		j while
		
		proverka:
    
    			li $s4, 0
    
    			li $t4, 2          
    			li $t7, 0
    		
    			beq $a0, $t4, prost   
    			blt $a0, $t4, slozhen


		proverka_loop:
		
   			addi $t7, $t7, 1    
    			div $a0, $t7        
    			mfhi $t6           

    			beq $t6, $zero, brojacDeliteli
    			
    			j ne_dodavaj
    			
    			brojacDeliteli:
    			addi $s4, $s4, 1 
			
    			
			ne_dodavaj: 
			
    			bgt $s4, $t4, slozhen
    			
    			bge $t7, $a0, brojacProverka
    			j proverka_loop
    			
    			
			brojacProverka:
			beq $s4, $t4, prost
   			
   			j slozhen
    		

		slozhen:
    		li $v0, 0       
   		 jr $ra           

		prost:
    		li $v0, 1       
    		jr $ra           

		
		kraj:
		
			li $v0, 4
			la $a0, sum
			syscall
			
			li $v0, 1
			move $a0, $s0
			syscall
			
			li $v0, 10
			syscall
			
	