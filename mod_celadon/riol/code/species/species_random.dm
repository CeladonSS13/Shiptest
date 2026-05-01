// /datum/species/proc/get_hair_list_by_gender(gender = null)
// 	switch(gender)
// 		if(MALE)
// 			return GLOB.hairstyles_male_list
// 		if(FEMALE)
// 			return GLOB.hairstyles_female_list
// 		else
// 			return GLOB.hairstyles_list

// /datum/species/proc/get_facial_hair_list_by_gender(gender = null)
// 	switch(gender)
// 		if(MALE)
// 			return GLOB.facial_hairstyles_male_list
// 		if(FEMALE)
// 			return GLOB.facial_hairstyles_female_list
// 		else
// 			return GLOB.facial_hairstyles_list

// /datum/species/proc/random_hairstyle(gender)
// 	switch(gender)
// 		if(MALE)
// 			return pick(GLOB.hairstyles_male_list)
// 		if(FEMALE)
// 			return pick(GLOB.hairstyles_female_list)
// 		else
// 			return pick(GLOB.hairstyles_list)

// /datum/species/proc/random_facial_hairstyle(gender)
// 	switch(gender)
// 		if(MALE)
// 			return pick(GLOB.facial_hairstyles_male_list)
// 		if(FEMALE)
// 			return pick(GLOB.facial_hairstyles_female_list)
// 		else
// 			return pick(GLOB.facial_hairstyles_list)

/datum/species/riol/get_hair_list_by_gender(gender)
	return GLOB.riol_hairs_list

/datum/species/riol/get_facial_hair_list_by_gender(gender)
	return GLOB.riol_facial_hairs_list

/datum/species/riol/random_hairstyle(gender)
	return pick(GLOB.riol_hairs_list)

/datum/species/riol/random_facial_hairstyle(gender)
	return pick(GLOB.riol_facial_hairs_list)
