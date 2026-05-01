// Part from "code\modules\mob\mob_helpers.dm"

// Moves proc here to add cyrillic symbols and ignore spaces to not double them
// Not overriding because of https://www.byond.com/forum/post/2925918

/**
 * Makes you speak like you're drunk
 */
/proc/slur(phrase)
	phrase = html_decode(phrase)
	var/leng = length(phrase)
	. = ""
	var/newletter = ""
	var/rawchar = ""
	for(var/i = 1, i <= leng, i += length(rawchar))
		rawchar = newletter = phrase[i]
		if(rand(1, 3) == 3)
			var/lowerletter = lowertext(newletter)
			if(lowerletter == "o")
				newletter = "u"
			else if(lowerletter == "s")
				newletter = "ch"
			else if(lowerletter == "a")
				newletter = "ah"
			else if(lowerletter == "u")
				newletter = "oo"
			else if(lowerletter == "c")
				newletter = "k"
			else if(lowerletter == "о")
				newletter = "у"
			else if(lowerletter == "э")
				newletter = "и"
			else if(lowerletter == "с")
				newletter = "сш"
			else if(lowerletter == "г")
				newletter = "х"
			else if(lowerletter == "а")
				newletter = "ах"
			else if(lowerletter == "ц")
				newletter = "сц"
			else if(lowerletter == "р")
				newletter = "гх"
			else if(lowerletter == "б")
				newletter = "п"
			else if(lowerletter == "д")
				newletter = "т"
			else if(lowerletter == "щ")
				newletter = "шщ"
			else if(lowerletter == "и")
				newletter = "их"
		if(rand(1, 20) == 20)
			if(newletter == " ")
				newletter = "...huuuhhh..."
			else if(newletter == ".")
				newletter = " *BURP*."
		if(newletter != " ")
			switch(rand(1, 20))
				if(1)
					newletter += "'"
				if(10)
					newletter += "[newletter]"
				if(20)
					newletter += "[newletter][newletter]"
				else
					// do nothing
		. += "[newletter]"
	return sanitize(.)

// Moves proc here to stop stuttering of russian vowels

///Adds stuttering to the message passed in
/proc/stutter(phrase)
	phrase = html_decode(phrase)
	var/leng = length(phrase)
	. = ""
	var/newletter = ""
	var/rawchar = ""
	var/static/regex/nostutter = regex(@@[aeiouAEIOU "'()[\]{}.!?,:;_`~-ауоиэыяюеёАУОИЭЫЯЮЕЁ]@)
	for(var/i = 1, i <= leng, i += length(rawchar))
		rawchar = newletter = phrase[i]
		if(prob(70) && !nostutter.Find(rawchar))
			if(prob(25))
				newletter = "[newletter]-[newletter]-[newletter]"
			else
				newletter = "[newletter]-[newletter]"
		. += newletter
	return sanitize(.)
