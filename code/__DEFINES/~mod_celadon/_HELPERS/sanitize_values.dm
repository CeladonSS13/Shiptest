/proc/sanitize_num_clamp(number, min = 0, max = 1, default = 0, quantize = 0)
	if(!isnum(number))
		return default
	. = clamp(number, min, max)
	if(quantize)
		. = round(number, quantize)
