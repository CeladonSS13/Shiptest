/mob/living/carbon/human
	var/skin_tone_nose = "black"    //Skin tone nose tajara
	var/skin_tone_tajara = "Black"  //Skin tone tajara

/mob/living/carbon/human/species/tajara
	race = /datum/species/tajara

/datum/species
	/// Does the species use skintones or not?
	var/use_skintonesnose = FALSE
	var/use_skintonetajara = FALSE

/datum/species/tajara
	name = "\improper Tajara"
	id = SPECIES_TAJARA
	loreblurb = "The Tajara race is a species of feline-like bipeds hailing from the planet of Ahdomai in the \
	S'randarr system. They have been brought up into the space age by the Humans and Skrell, and have been \
	influenced heavily by their long history of Slavemaster rule. They have a structured, clan-influenced way \
	of family and politics. They prefer colder environments, and speak a variety of languages, mostly Siik'Maas, \
	using unique inflections their mouths form."

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN

	use_skintonetajara = TRUE

	bodyflags = HAS_TAIL | TAIL_WAGGING

	disliked_food = VEGETABLES | FRUIT | GRAIN | GROSS
	liked_food = MEAT | RAW | DAIRY

	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	//species_clothing_path = 'icons/mob/clothing/species/kepori.dmi'

	species_traits = list(EYECOLOR, LIPS, HAIR, FACEHAIR, EMOTE_OVERLAY, MUTCOLORS, MUTCOLORS_SECONDARY, SKINNOSECOLORS, SKINTAJARACOLORS, EARSTAJARACOLORS, HEADTAJARACOLORS, NOSETAJARACOLORS, CHESTTAJARACOLORS, BODYTAJARACOLORS )
	mutant_bodyparts = list(
		"tajara_ears",
		"tajara_hairs",
		"tajara_ears_markings",
		"tajara_head_markings",
		"tajara_nose_markings",
		"tajara_facial_hairs",
		"tajara_chest_markings",
		"tajara_body_markings",
		"tajara_tail"
		)
	default_features = list(
		"mcolor" = "0F0",
		"tajara_ears" = "Plain",
		"tajara_hairs" = "Plain",
		"tajara_ears_markings" = "None",
		"tajara_head_markings" = "None",
		"tajara_nose_markings" = "None",
		"tajara_facial_hairs" = "None",
		"tajara_chest_markings" = "None",
		"tajara_body_markings" = "None",
		"tajara_tail" = "long",
		"body_size" = "Normal"
		)

	default_color = "424242"

	burnmod = 1.1
	heatmod = 1.3
	coldmod = 0.7
	staminamod = 0.85

	bodytemp_heat_damage_limit = TAJARAN_BODYTEMP_NORMAL + 20		//60

	max_temp_comfortable = TAJARAN_BODYTEMP_NORMAL + 10				//50

	bodytemp_normal = TAJARAN_BODYTEMP_NORMAL						//40

	min_temp_comfortable = TAJARAN_BODYTEMP_NORMAL - 50				//-10

	bodytemp_cold_damage_limit = TAJARAN_BODYTEMP_NORMAL - 70		//-30

	meat = /obj/item/food/meat/slab/human/mutant/tajara 	//нарисовать/спиздить спрайт к нему
	//skinned_type = /obj/item/stack/sheet/animalhide/tajara						//нужно сделать кожу из таяран и нарисовать/спиздить спрайт к нему

	species_language_holder = /datum/language_holder/tajara

	ass_image = 'icons/ass/asscat.png'

	mutantears = /obj/item/organ/ears/tajara		//нужно отделить уши от головы. и можно кинуть их в тот же файл. потом в органе прописать путь к файлу + имя файла
	mutanteyes = /obj/item/organ/eyes/tajara
	mutanttongue = /obj/item/organ/tongue/tajara
	mutant_organs = list(/obj/item/organ/tail/tajara)

	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC

	species_chest = /obj/item/bodypart/chest/tajara
	species_head = /obj/item/bodypart/head/tajara
	species_l_arm = /obj/item/bodypart/l_arm/tajara
	species_r_arm = /obj/item/bodypart/r_arm/tajara
	species_l_leg = /obj/item/bodypart/leg/left/tajara
	species_r_leg = /obj/item/bodypart/leg/right/tajara

	species_robotic_chest = /obj/item/bodypart/chest/robot
	species_robotic_head = /obj/item/bodypart/head/robot
	species_robotic_l_arm = /obj/item/bodypart/l_arm/robot/surplus
	species_robotic_r_arm = /obj/item/bodypart/r_arm/robot/surplus
	species_robotic_l_leg = /obj/item/bodypart/leg/left/robot/surplus
	species_robotic_r_leg = /obj/item/bodypart/leg/right/robot/surplus

/datum/species/tajara/random_name(gender,unique,lastname)
	//code by @valtor0
	/*
	var/static/list/tajara_female_ru_endings_list = list("и","а","о","е","й","ь") // Customise this with ru_name_syllables changes.
	var/list/ru_name_syllables = list("кан","тай","кир","раи","кии","мир","кра","тэк","нал","вар","хар","марр","ран","дарр", \
	"мирк","ири","дин","манг","рик","зар","раз","кель","шера","тар","кей","ар","но","маи","зир","кер","нир","ра",\
	"ми","рир","сей","эка","гир","ари","нэй","нре","ак","таир","эрай","жин","мра","зур","рин","сар","кин","рид","эра","ри","эна")
	*/
	var/static/list/tajara_female_en_endings_list = list("i","a","o","e","y","u") // Customise this with en_name_syllables changes.
	var/list/en_name_syllables = list("kan","taj","kir","rai","kii","mir","kra","tak","nal","var","har","marr","ran","darr", \
	"mirk","iri","din","mang","rik","zar","raz","kel","shera","tar","kai","ar","no","mai","air","ker","nir","ra",\
	"mi","rir","sei","eka","gir","ari","nai","nre","ak","tajr","arai","jin","mra","aur","rin","sar","kin","rid","era","ri","ena")
	var/apostrophe = "’"
	var/new_name = ""
	var/full_name = ""

	for(var/i = 0; i<2; i++)
		for(var/x = rand(1,2); x>0; x--)
			new_name += pick_n_take(en_name_syllables)
		new_name += apostrophe
		apostrophe = ""
	full_name = "[capitalize(lowertext(new_name))]"
	if(gender == FEMALE)
		var/ending = copytext(full_name, -2)
		if(!(ending in tajara_female_en_endings_list))
			full_name += "а"
	if(prob(75))
		full_name += " [pick(list("Hadii","Kaitam","Jan-Hazan","Nyrir’Ahan"))]" //"Хадии","Кайтам","Жан-Хазан","Нъярир’Ахан"
	else if(prob(80))
		full_name += " [pick(list("Anai-Sanday","Navarr-Sanday","Roky-Sanday","Shenuar-Sanday"))]" //"Энай-Сэндай","Наварр-Сэндай","Року-Сэндай","Шенуар-Сэндай"
	return full_name


/datum/species/start_wagging_tail(mob/living/carbon/human/H)
	if("tajara_tail" in mutant_bodyparts)
		mutant_bodyparts -= "tajara_tail"
		mutant_bodyparts |= "waggingtajara_tail"

	// if("riol_tail" in mutant_bodyparts)
	// 	mutant_bodyparts -= "riol_tail"
	// 	mutant_bodyparts |= "waggingriol_tail"

	return ..()

/datum/species/stop_wagging_tail(mob/living/carbon/human/H)
	if("waggingtajara_tail" in mutant_bodyparts)
		mutant_bodyparts -= "waggingtajara_tail"
		mutant_bodyparts |= "tajara_tail"

	// if("waggingriol_tail" in mutant_bodyparts)
	// 	mutant_bodyparts -= "waggingriol_tail"
	// 	mutant_bodyparts |= "riol_tail"

	return ..()
