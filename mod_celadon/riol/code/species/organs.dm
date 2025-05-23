/*
	  /\        /\      *
	 //\\      //\\     *
	//__\\    //__\\    *
*/

/obj/item/organ/ears/riol
	name = "riol ears"
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_organs.dmi'	//пока такая хурма, но нужно будет сделать уши отдельно от головы и втыкнуть в какой-либо файл
	icon_state = "ears"					//когда будут уши в каком-то файле, тогда и поменяешь
	damage_multiplier = 2

/obj/item/organ/ears/riol/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts |= "ears"
		ear_owner.dna.features["ears"] = "riol"
		ear_owner.update_body()

/obj/item/organ/ears/riol/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
		color = ear_owner.hair_color
		ear_owner.dna.features["ears"] = "None"
		ear_owner.dna.species.mutant_bodyparts -= "ears"
		ear_owner.update_body()

/*
	/---\    /---\    *
	| | |    | | |    *
	\---/    \---/    *
*/

/obj/item/organ/eyes/riol
	name = "Riol eyes"
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_organs.dmi'
	icon_state = "eyes"
	desc = "Some eyes"

/*
	  ____      _     *
	 / __ \____/ )    *
	/_/  \______/     *
*/

/obj/item/organ/tail/riol
	name = "\improper Riol tail"
	desc = "A severed Riol's tail."
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_lang.dmi'
	icon_state = "vulptail"
	color = "#661111"
	tail_type = "Long"

/obj/item/organ/tail/riol/Initialize()
	. = ..()
	color = "#" + random_color()

/obj/item/organ/tail/riol/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		// Checks here are necessary so it wouldn't overwrite the tail of a riol it spawned in
		if(!("riol_tail" in H.dna.species.mutant_bodyparts))
			if(!H.dna.features["riol_tail"])
				H.dna.features["riol_tail"] = tail_type
				H.dna.species.mutant_bodyparts |= "riol_tail"
			else
				H.dna.species.mutant_bodyparts["riol_tail"] = H.dna.features["riol_tail"]

		H.update_body()

/obj/item/organ/tail/riol/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.species.mutant_bodyparts -= "riol_tail"
		color = "#" + H.dna.features["mcolor"]
		tail_type = H.dna.features["riol_tail"]
		H.update_body()

/obj/item/organ/tail/riol/fake
	name = "fabricated riol tail"
	desc = "A fabricated severed riol tail. This one's made of synthflesh."

/*
	|  |  |    *
	|  |  |    *
	 \___/     *
*/

/obj/item/organ/tongue/riol
	name = "Riol tongue"
	desc = "The traditionally employed tongue , composed of expressive yowls and chirps. Native to the Riol."
	say_mod = "rawls"
	taste_sensitivity = 10 // combined nose + tongue, extra sensitive
	modifies_speech = TRUE
	var/static/list/languages_possible_riol = typecacheof(list(
		/datum/language/galactic_common,
		/datum/language/kalixcian_common,
		/datum/language/codespeak,
		/datum/language/monkey,
		// /datum/language/narsie,
		// /datum/language/beachbum,
		/datum/language/aphasia,
		// /datum/language/piratespeak,
		/datum/language/moffic,
		// /datum/language/sylvan,
		// /datum/language/shadowtongue,
		/datum/language/canilunzt
	))

/obj/item/organ/tongue/riol/handle_speech(datum/source, list/speech_args)
	if(speech_args[SPEECH_LANGUAGE] == /datum/language/canilunzt)
		return

	var/static/regex/riol_rr = new("r+", "g")
	var/static/regex/riol_RR = new("R+", "g")
	var/static/regex/riol_ru_rr = new("р+", "g")
	var/static/regex/riol_ru_RR = new("Р+", "g")

	var/static/regex/riol_ur = new("u+", "g")
	var/static/regex/riol_UR = new("U+", "g")
	var/static/regex/riol_ru_ur = new("у+", "g")
	var/static/regex/riol_ru_UR = new("У+", "g")

	var/static/regex/riol_if = new("i+", "g")
	var/static/regex/riol_IF = new("I+", "g")
	var/static/regex/riol_ru_if = new("и+", "g")
	var/static/regex/riol_ru_IF = new("И+", "g")

	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = riol_rr.Replace(message, pick("r", "rr", "rrr"))
		message = riol_RR.Replace(message, pick("R", "Rr", "Rrr"))
		message = riol_ru_rr.Replace_char(message, pick("р", "рр", "ррр"))
		message = riol_ru_RR.Replace_char(message, pick("Р", "Рр", "Ррр"))

		if(prob(20))
			message = riol_ur.Replace(message, pick("u", "ur", "uru"))
			message = riol_UR.Replace(message, pick("U", "Ur", "Uru"))
			message = riol_ru_ur.Replace_char(message, pick("у", "ур", "уру"))
			message = riol_ru_UR.Replace_char(message, pick("У", "Ур", "Уру"))

		if(prob(20))
			message = riol_if.Replace(message, pick("i", "if", "iyf"))
			message = riol_IF.Replace(message, pick("I", "If", "Iyf"))
			message = riol_ru_if.Replace_char(message, pick("и", "иф", "ийф"))
			message = riol_ru_IF.Replace_char(message, pick("И", "Иф", "Ийф"))
	speech_args[SPEECH_MESSAGE] = message

/obj/item/organ/tongue/riol/Initialize(mapload)
	. = ..()
	languages_possible = languages_possible_riol
