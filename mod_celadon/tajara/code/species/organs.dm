/*
	  /\        /\      *
	 //\\      //\\     *
	//__\\    //__\\    *
*/

/obj/item/organ/ears/tajaran
	name = "tajaran ears"
	icon = 'icons/obj/clothing/hats.dmi'	//пока такая хурма, но нужно будет сделать уши отдельно от головы и втыкнуть в какой-либо файл(хоть в тот же таяран_бодипартс)
	icon_state = "kitty"					//когда будут уши в каком-то файле, тогда и поменяешь
	damage_multiplier = 2

/obj/item/organ/ears/tajaran/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts |= "ears"
		ear_owner.dna.features["ears"] = "tajaran"
		ear_owner.update_body()

/obj/item/organ/ears/tajaran/Remove(mob/living/carbon/human/ear_owner,  special = 0)
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

/obj/item/organ/eyes/tajaran
	name = "Tajara eyes"
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_organs.dmi'
	icon_state = "night_eyes_off"
	desc = "Some eyes"
	actions_types = list(/datum/action/item_action/organ_action/toggle)
	var/active = FALSE
	var/current_lighting_alpha = null
	flash_protect = FLASH_PROTECTION_SENSITIVE	// CELADON_BALANCE_SPECIES - Для баланса, глаза стали чувствительными

/obj/item/organ/eyes/tajaran/Initialize()
	current_lighting_alpha = lighting_alpha
	. = ..()

/obj/item/organ/eyes/tajaran/Destroy()
	//if(active)
	//	deactivate()
	icon_state = "eyes"
	. = ..()

/obj/item/organ/eyes/tajaran/Remove(mob/living/carbon/M, special = FALSE)
	//if(active)
	//	deactivate()
	icon_state = "eyes"
	. = ..()

/obj/item/organ/eyes/tajaran/ui_action_click()

	toggle_active()

/obj/item/organ/eyes/tajaran/proc/toggle_active()
	if(active)
		deactivate()
	else
		activate()

/obj/item/organ/eyes/tajaran/proc/activate()
	active = TRUE
	icon_state = "night_eyes_on"
	current_lighting_alpha = lighting_alpha
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	see_in_dark = 6
	owner.add_client_colour(/datum/client_colour/monochrome)
	owner.update_sight()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return TRUE
/obj/item/organ/eyes/tajaran/proc/deactivate()
	active = FALSE
	icon_state = "night_eyes_off"
	lighting_alpha = current_lighting_alpha
	see_in_dark = 2
	owner.remove_client_colour(/datum/client_colour/monochrome)
	owner.update_sight()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return TRUE

/*
	  ____      _     *
	 / __ \____/ )    *
	/_/  \______/     *
*/

/obj/item/organ/tail/tajaran
	name = "\improper Tajara tail"
	desc = "A severed Tajara's tail."
	icon_state = "severedtail"
	color = "#661111"
	tail_type = "Long"

/obj/item/organ/tail/tajaran/Initialize()
	. = ..()
	color = "#"+ random_color()

/obj/item/organ/tail/tajaran/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		// Checks here are necessary so it wouldn't overwrite the tail of a tajaran it spawned in
		if(!("tajaran_tail" in H.dna.species.mutant_bodyparts))
			if(!H.dna.features["tajaran_tail"])
				H.dna.features["tajaran_tail"] = tail_type
				H.dna.species.mutant_bodyparts |= "tajaran_tail"
			else
				H.dna.species.mutant_bodyparts["tajaran_tail"] = H.dna.features["tajaran_tail"]

		H.update_body()

/obj/item/organ/tail/tajaran/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.species.mutant_bodyparts -= "tajaran_tail"
		color = "#" + H.dna.features["mcolor"]
		tail_type = H.dna.features["tajaran_tail"]
		H.update_body()

/obj/item/organ/tail/tajaran/fake
	name = "fabricated tajaran tail"
	desc = "A fabricated severed tajaran tail. This one's made of synthflesh."

/*
	|  |  |    *
	|  |  |    *
	 \___/     *
*/

/obj/item/organ/tongue/tajaran
	name = "Tajara tongue"
	desc = "The traditionally employed tongue of Ahdomai, composed of expressive yowls and chirps. Native to the Tajara."
	say_mod = "mrowls"
	taste_sensitivity = 10 // combined nose + tongue, extra sensitive
	modifies_speech = TRUE
	var/static/list/languages_possible_tajara = typecacheof(list(
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
		/datum/language/siiktajr
	))

/obj/item/organ/tongue/tajaran/handle_speech(datum/source, list/speech_args)
	if(speech_args[SPEECH_LANGUAGE] == /datum/language/siiktajr)
		return

	var/static/regex/tajaran_rr = new("r+", "g")
	var/static/regex/tajaran_RR = new("R+", "g")
	var/static/regex/tajaran_ru_rr = new("р+", "g")
	var/static/regex/tajaran_ru_RR = new("Р+", "g")
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = tajaran_rr.Replace(message, pick("rr", "rrr", "rrrr", "rrrrr"))
		message = tajaran_RR.Replace(message, pick("Rr", "Rrr", "Rrrr", "Rrrrr"))
		message = tajaran_ru_rr.Replace_char(message, pick("рр", "ррр", "рррр", "ррррр"))
		message = tajaran_ru_RR.Replace_char(message, pick("Рр", "Ррр", "Рррр", "Ррррр"))
	speech_args[SPEECH_MESSAGE] = message

/obj/item/organ/tongue/tajaran/Initialize(mapload)
	. = ..()
	languages_possible = languages_possible_tajara
