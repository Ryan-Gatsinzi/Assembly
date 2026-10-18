
	.data
array:	.word			0x37, 0x55, 0xF

	.text		
	la 	$s0, array		# $s0 = 0x1100
	la	$s1, array+4	# $s1 = 0x1104
	la	$s2, 8($s0)		# $s2 = 0x1108
	li	$a0, 4		# $a0 = 4
	lw	$t0, 0($s0)# $t0 = 0x37 
	lw	$t3, array($a0)
	lw	$t1, 8($s0)		# $t1 = 0xF in big endian
	lb	$t2, ($s0)		# $t2 = 0x37 in big endian