.data
    result: .asciiz "Rezultatot e: "

.text
    
    li $t0, -15
    li $s2, 20        
    
   
    abs $s1, $t0      
    
    add $s0, $s1, $s2
    
    
    li $v0, 4           
    la $a0, result
    syscall

    li $v0, 1          
    move $a0, $s0      
    syscall
    
    
    li $v0, 10       
    syscall
