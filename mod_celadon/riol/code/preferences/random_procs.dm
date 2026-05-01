
/proc/random_unique_riol_name(gender, attempts_to_find_unique_name = 10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(riol_name(gender))

		if(!findname(.))
			break


// /proc/random_skin_tone_nose()
// 	return pick(GLOB.skin_tones_nose)


// GLOBAL_LIST_INIT(skin_tones_nose, sortList(list(
// 	"beige",
// 	"pink",
// 	"grey",
// 	"black"
// )))

/proc/random_skin_tone_riol()
	return pick(GLOB.skin_tones_riol)

GLOBAL_LIST_INIT(skin_tones_riol, sortList(list(
	"Beaver Brown",
	"Kochiba",
	"Taupe",
	"Blue-Grey",
	"Dark Gray",
	"Chocolate",
	"Black",
	"Orange",
	"Cinnamon",
	"Ruddy",
	"Cream",
	"White",
	"Ivory",
	"Wheat",
	"Silver"
)))

/proc/riol_name(gender)
	if(gender == MALE)
		return "[pick(GLOB.riol_names_male)]-[pick(GLOB.riol_last_names)]"
	else
		return "[pick(GLOB.riol_names_female)]-[pick(GLOB.riol_last_names)]"
