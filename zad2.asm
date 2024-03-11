.data
    prompt1 : .asciiz "Vnesi go prviot broj: "
    prompt2 : .asciiz "Vnesi go vtoriot broj: "
    result : .asciiz "Rezultatot e: "

.text
    
    li $v0, 4
    la $a0, prompt1
    syscall

   
    li $v0, 5
    syscall
    add $t0, $v0, $zero 
    
    
    li $v0, 4
    la $a0, prompt2
    syscall

    
    li $v0, 5
    syscall
    add $s2, $v0, $zero 

   
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
