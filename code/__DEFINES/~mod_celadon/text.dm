// Для работы (code/__DEFINES/~mod_celadon/_translation.dm)
/proc/pluralize_russian(n, one, two, five)
	if(!five)
		five = two
	n = abs(n) % 100
	if(5 <= n && n <= 20)
		return five
	n %= 10
	switch(n)
		if(1)
			return one
		if(2 to 4)
			return two
		else
			return five
