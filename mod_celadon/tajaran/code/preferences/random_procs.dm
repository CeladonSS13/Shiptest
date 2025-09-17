
/proc/random_unique_tajaran_name(gender, attempts_to_find_unique_name=10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(tajaran_name(gender))

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

/proc/random_skin_tone_tajaran()
	return pick(GLOB.skin_tones_tajaran)

GLOBAL_LIST_INIT(skin_tones_tajaran, sortList(list(
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

/proc/tajaran_name(gender)
	if(gender == MALE)
		return "[pick(GLOB.tajaran_names_male)]-[pick(GLOB.tajaran_names_male)]"
	else
		return "[pick(GLOB.tajaran_names_female)]-[pick(GLOB.tajaran_names_female)]"
