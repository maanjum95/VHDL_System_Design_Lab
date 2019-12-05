

def low_high(a, b):
	if a == 0:
		a = 2**16
	if b == 0:
		b = 2**16
	
	ab = a * b
	mod_to = 2**16 + 1
	
	print("Actual result", ab, "to", ab % mod_to)
	
	ab_mod = ab % 2**16
	ab_div = ab // 2**16
	
	result = ab_mod - ab_div
	
	if ab_mod < ab_div:
		result += 2**16 + 1
	
	
	print("Result", result, "{0:16b}".format(result))
	print("MOD", ab_mod, "{0:16b}".format(ab_mod).zfill(7))
	print("DIV", ab_div, "{0:16b}".format(ab_div).zfill(7))
	
	
low_high(65530, 65530)

		
