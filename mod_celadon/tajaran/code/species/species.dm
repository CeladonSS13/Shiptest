/mob/living/carbon/human
	var/skin_tone_nose = "black"    //Skin tone nose tajaran
	var/skin_tone_tajaran = "Black"  //Skin tone tajaran

/mob/living/carbon/human/species/tajaran
	race = /datum/species/tajaran

/datum/species
	/// Does the species use skintones or not?
	var/use_skintonesnose = FALSE
	var/use_skintonetajara = FALSE

/datum/species/tajaran
	name = "\improper Tajaran"
	id = SPECIES_TAJARAN
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

	species_traits = list(EYECOLOR, LIPS, HAIR, FACEHAIR, EMOTE_OVERLAY, MUTCOLORS, MUTCOLORS_SECONDARY, SKINNOSECOLORS, SKINTAJARACOLORS, EARSTAJARACOLORS, HEADTAJARACOLORS, NOSETAJARACOLORS, CHESTTAJARACOLORS, BODYTAJARACOLORS, HAS_FLESH, HAS_BONE)
	mutant_bodyparts = list(
		"tajaran_ears",
		"tajaran_hairs",
		"tajaran_ears_markings",
		"tajaran_head_markings",
		"tajaran_nose_markings",
		"tajaran_facial_hairs",
		"tajaran_chest_markings",
		"tajaran_body_markings",
		"tajaran_tail"
		)
	default_features = list(
		"mcolor" = "0F0",
		"tajaran_ears" = "Plain",
		"tajaran_hairs" = "Plain",
		"tajaran_ears_markings" = "None",
		"tajaran_head_markings" = "None",
		"tajaran_nose_markings" = "None",
		"tajaran_facial_hairs" = "None",
		"tajaran_chest_markings" = "None",
		"tajaran_body_markings" = "None",
		"tajaran_tail" = "long",
		"body_size" = "Normal"
		)

	default_color = "424242"

	burnmod = 1.3
	heatmod = 1.2
	coldmod = 0.9
	staminamod = 0.85

	bodytemp_heat_damage_limit = TAJARAN_BODYTEMP_NORMAL + 30		//70

	max_temp_comfortable = TAJARAN_BODYTEMP_NORMAL + 20				//60

	bodytemp_normal = TAJARAN_BODYTEMP_NORMAL						//38

	min_temp_comfortable = TAJARAN_BODYTEMP_NORMAL - 30				//-10

	bodytemp_cold_damage_limit = TAJARAN_BODYTEMP_NORMAL - 40		//-20

	meat = /obj/item/food/meat/slab/human/mutant/tajaran 	//нарисовать/спиздить спрайт к нему
	//skinned_type = /obj/item/stack/sheet/animalhide/tajaran						//нужно сделать кожу из таяран и нарисовать/спиздить спрайт к нему

	species_language_holder = /datum/language_holder/tajaran

	ass_image = 'icons/ass/asscat.png'

	mutantears = /obj/item/organ/ears/tajaran		//нужно отделить уши от головы. и можно кинуть их в тот же файл. потом в органе прописать путь к файлу + имя файла
	mutanteyes = /obj/item/organ/eyes/tajaran
	mutanttongue = /obj/item/organ/tongue/tajaran
	mutant_organs = list(/obj/item/organ/tail/tajaran)

	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC

	species_chest = /obj/item/bodypart/chest/tajaran
	species_head = /obj/item/bodypart/head/tajaran
	species_l_arm = /obj/item/bodypart/l_arm/tajaran
	species_r_arm = /obj/item/bodypart/r_arm/tajaran
	species_l_leg = /obj/item/bodypart/leg/left/tajaran
	species_r_leg = /obj/item/bodypart/leg/right/tajaran

	species_robotic_chest = /obj/item/bodypart/chest/robot
	species_robotic_head = /obj/item/bodypart/head/robot
	species_robotic_l_arm = /obj/item/bodypart/l_arm/robot/surplus
	species_robotic_r_arm = /obj/item/bodypart/r_arm/robot/surplus
	species_robotic_l_leg = /obj/item/bodypart/leg/left/robot/surplus
	species_robotic_r_leg = /obj/item/bodypart/leg/right/robot/surplus

/datum/species/tajaran/random_name(gender,unique,lastname)
	//code by @valtor0
	/*
	var/static/list/tajaran_female_ru_endings_list = list("и","а","о","е","й","ь") // Customise this with ru_name_syllables changes.
	var/list/ru_name_syllables = list("кан","тай","кир","раи","кии","мир","кра","тэк","нал","вар","хар","марр","ран","дарр", \
	"мирк","ири","дин","манг","рик","зар","раз","кель","шера","тар","кей","ар","но","маи","зир","кер","нир","ра",\
	"ми","рир","сей","эка","гир","ари","нэй","нре","ак","таир","эрай","жин","мра","зур","рин","сар","кин","рид","эра","ри","эна")
	*/
	var/static/list/tajaran_female_en_endings_list = list("i","a","o","e","y","u") // Customise this with en_name_syllables changes.
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
		if(!(ending in tajaran_female_en_endings_list))
			full_name += "а"
	if(prob(75))
		full_name += " [pick(list("Hadii","Kaitam","Jan-Hazan","Nyrir’Ahan"))]" //"Хадии","Кайтам","Жан-Хазан","Нъярир’Ахан"
	else if(prob(80))
		full_name += " [pick(list("Anai-Sanday","Navarr-Sanday","Roky-Sanday","Shenuar-Sanday"))]" //"Энай-Сэндай","Наварр-Сэндай","Року-Сэндай","Шенуар-Сэндай"
	return full_name


/datum/species/start_wagging_tail(mob/living/carbon/human/H)
	if("tajaran_tail" in mutant_bodyparts)
		mutant_bodyparts -= "tajaran_tail"
		mutant_bodyparts |= "waggingtajaran_tail"

	// if("riol_tail" in mutant_bodyparts)
	// 	mutant_bodyparts -= "riol_tail"
	// 	mutant_bodyparts |= "waggingriol_tail"

	return ..()

/datum/species/stop_wagging_tail(mob/living/carbon/human/H)
	if("waggingtajaran_tail" in mutant_bodyparts)
		mutant_bodyparts -= "waggingtajaran_tail"
		mutant_bodyparts |= "tajaran_tail"

	// if("waggingriol_tail" in mutant_bodyparts)
	// 	mutant_bodyparts -= "waggingriol_tail"
	// 	mutant_bodyparts |= "riol_tail"

	return ..()
