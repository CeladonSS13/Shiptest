
/proc/random_unique_tajara_name(gender, attempts_to_find_unique_name=10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(tajara_name(gender))

		if(!findname(.))
			break


/proc/random_skin_tone_nose()
	return pick(GLOB.skin_tones_nose)


GLOBAL_LIST_INIT(skin_tones_nose, sortList(list(
	"beige",
	"pink",
	"grey",
	"black"
)))

/proc/random_skin_tone_tajara()
	return pick(GLOB.skin_tones_tajara)

GLOBAL_LIST_INIT(skin_tones_tajara, sortList(list(
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

/proc/tajara_name(gender)
	if(gender == MALE)
		return "[pick(GLOB.tajara_names_male)]-[pick(GLOB.tajara_names_male)]"
	else
		return "[pick(GLOB.tajara_names_female)]-[pick(GLOB.tajara_names_female)]"
