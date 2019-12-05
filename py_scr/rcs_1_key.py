
def cyclic_shift(KEY):
	# convert to binary string
	tmp_key = bin(KEY)[2:].zfill(128)
	#print(hex(int(tmp_key, 2)))
	#print(hex(int(tmp_key[26: ], 2)), len(tmp_key[25: ]))
	#print(hex(int(tmp_key[0:26], 2)), len(tmp_key[0:25 ]))
	tmp_key = tmp_key[25:] + tmp_key[0:25]
	
	tmp_key = int(tmp_key, 2)
	
	return tmp_key
	

	
	
	
	
# Testing statements
KEY = 0x00010002000300040005000600070008
tmp_key = KEY
print("KEY", "{0:#0{1}x}".format(tmp_key, 34))
for i in range(0, 6):
	tmp_key = cyclic_shift(tmp_key)
	print(i+1, "{0:#0{1}x}".format(tmp_key, 34))


