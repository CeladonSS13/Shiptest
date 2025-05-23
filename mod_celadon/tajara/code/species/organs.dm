/*
	  /\        /\      *
	 //\\      //\\     *
	//__\\    //__\\    *
*/

/obj/item/organ/ears/tajara
	name = "tajara ears"
	icon = 'icons/obj/clothing/hats.dmi'	//пока такая хурма, но нужно будет сделать уши отдельно от головы и втыкнуть в какой-либо файл(хоть в тот же таяран_бодипартс)
	icon_state = "kitty"					//когда будут уши в каком-то файле, тогда и поменяешь
	damage_multiplier = 2

/obj/item/organ/ears/tajara/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts |= "ears"
		ear_owner.dna.features["ears"] = "tajara"
		ear_owner.update_body()

/obj/item/organ/ears/tajara/Remove(mob/living/carbon/human/ear_owner,  special = 0)
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

/obj/item/organ/eyes/tajara
	name = "Tajara eyes"
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_organs.dmi'
	icon_state = "night_eyes_off"
	desc = "Some eyes"
	actions_types = list(/datum/action/item_action/organ_action/toggle)
	var/active = FALSE
	var/current_lighting_alpha = null

/obj/item/organ/eyes/tajara/Initialize()
	current_lighting_alpha = lighting_alpha
	. = ..()

/obj/item/organ/eyes/tajara/Destroy()
	//if(active)
	//	deactivate()
	icon_state = "eyes"
	. = ..()

/obj/item/organ/eyes/tajara/Remove(mob/living/carbon/M, special = FALSE)
	//if(active)
	//	deactivate()
	icon_state = "eyes"
	. = ..()

/obj/item/organ/eyes/tajara/ui_action_click()

	toggle_active()

/obj/item/organ/eyes/tajara/proc/toggle_active()
	if(active)
		deactivate()
	else
		activate()

/obj/item/organ/eyes/tajara/proc/activate()
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
/obj/item/organ/eyes/tajara/proc/deactivate()
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

/obj/item/organ/tail/tajara
	name = "\improper Tajara tail"
	desc = "A severed Tajara's tail."
	icon_state = "severedtail"
	color = "#661111"
	tail_type = "Long"

/obj/item/organ/tail/tajara/Initialize()
	. = ..()
	color = "#"+ random_color()

/obj/item/organ/tail/tajara/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		// Checks here are necessary so it wouldn't overwrite the tail of a tajara it spawned in
		if(!("tajara_tail" in H.dna.species.mutant_bodyparts))
			if(!H.dna.features["tajara_tail"])
				H.dna.features["tajara_tail"] = tail_type
				H.dna.species.mutant_bodyparts |= "tajara_tail"
			else
				H.dna.species.mutant_bodyparts["tajara_tail"] = H.dna.features["tajara_tail"]

		H.update_body()

/obj/item/organ/tail/tajara/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.species.mutant_bodyparts -= "tajara_tail"
		color = "#" + H.dna.features["mcolor"]
		tail_type = H.dna.features["tajara_tail"]
		H.update_body()

/obj/item/organ/tail/tajara/fake
	name = "fabricated tajara tail"
	desc = "A fabricated severed tajara tail. This one's made of synthflesh."

/*
	|  |  |    *
	|  |  |    *
	 \___/     *
*/

/obj/item/organ/tongue/tajara
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

/obj/item/organ/tongue/tajara/handle_speech(datum/source, list/speech_args)
	if(speech_args[SPEECH_LANGUAGE] == /datum/language/siiktajr)
		return

	var/static/regex/tajara_rr = new("r+", "g")
	var/static/regex/tajara_RR = new("R+", "g")
	var/static/regex/tajara_ru_rr = new("р+", "g")
	var/static/regex/tajara_ru_RR = new("Р+", "g")
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = tajara_rr.Replace(message, pick("rr", "rrr", "rrrr", "rrrrr"))
		message = tajara_RR.Replace(message, pick("Rr", "Rrr", "Rrrr", "Rrrrr"))
		message = tajara_ru_rr.Replace_char(message, pick("рр", "ррр", "рррр", "ррррр"))
		message = tajara_ru_RR.Replace_char(message, pick("Рр", "Ррр", "Рррр", "Ррррр"))
	speech_args[SPEECH_MESSAGE] = message

/obj/item/organ/tongue/tajara/Initialize(mapload)
	. = ..()
	languages_possible = languages_possible_tajara
