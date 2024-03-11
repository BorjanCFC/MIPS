.data
    result_msg: .asciiz "Result: "

.text
    # Initialize $s1 and $s2
    li $s1, -15       # $s1 = -15
    li $s2, 20        # $s2 = 20
    
    # Absolute value of $s1
    abs $t0, $s1      # $t0 = -(-15) = 15
    
    # Add absolute value of $s1 to $s2
    add $s0, $t0, $s2 # $s0 = |$s1| + $s2
    
    # Print result
    li $v0, 4           # Load syscall code for printing string
    la $a0, result_msg  # Load address of result_msg into $a0
    syscall

    li $v0, 1           # Load syscall code for printing integer
    move $a0, $s0       # Load result value into $a0
    syscall
    
    # Exit
    li $v0, 10        # syscall code 10 (exit)
    syscall
