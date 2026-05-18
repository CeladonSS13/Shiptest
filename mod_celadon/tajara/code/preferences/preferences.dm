
/datum/preferences
	/// Nose skin color for tajara
	var/skin_tone_nose = "black"

	/// Body skin color for tajara
	var/skin_tone_tajara = "Black"

/datum/preferences/New(client/C)
	features += list(
		"tajara_ears" = "Plain",
		"tajara_hairs" = "Plain",
		"tajara_ears_markings" = "None",
		"tajara_head_markings" = "None",
		"tajara_nose_markings" = "None",
		"tajara_facial_hairs" = "None",
		"tajara_chest_markings" = "None",
		"tajara_body_markings" = "None",
		"tajara_tail" = "Long"
	)

	randomise[RANDOM_SKIN_TONE_NOSE] = TRUE
	randomise[RANDOM_SKIN_TONE_TAJARA] = TRUE

	return ..()


/datum/preferences/process_link(mob/user, list/href_list)
	switch(href_list["task"])
		if("random")
			switch(href_list["preference"])
				//if("s_tone_nose")
				//	skin_tone_nose = random_skin_tone_nose()
				if("s_tone_tajara")
					skin_tone_tajara = random_skin_tone_tajara()
				if("s_tone_riol")
					skin_tone_riol = random_skin_tone_riol()
		if("input")
			switch(href_list["preference"])
				if("tajara_ears")
					var/new_tajara_ears
					new_tajara_ears = input(user, "Choose your character's ears:", "Character Preference") as null|anything in GLOB.tajara_ears_list
					if(new_tajara_ears)
						features["tajara_ears"] = new_tajara_ears

				if("tajara_hairs")
					var/new_tajara_hairs
					new_tajara_hairs = input(user, "Choose your character's hair:", "Character Preference") as null|anything in GLOB.tajara_hairs_list
					if(new_tajara_hairs)
						features["tajara_hairs"] = new_tajara_hairs

				if("tajara_ears_markings")
					var/new_tajara_ears_markings
					new_tajara_ears_markings = input(user, "Choose your character's head markings:", "Character Preference") as null|anything in GLOB.tajara_ears_markings_list
					if(new_tajara_ears_markings)
						features["tajara_ears_markings"] = new_tajara_ears_markings

				if("tajara_head_markings")
					var/new_tajara_head_markings
					new_tajara_head_markings = input(user, "Choose your character's head markings:", "Character Preference") as null|anything in GLOB.tajara_head_markings_list
					if(new_tajara_head_markings)
						features["tajara_head_markings"] = new_tajara_head_markings

				if("tajara_nose_markings")
					var/new_tajara_nose_markings
					new_tajara_nose_markings = input(user, "Choose your character's nose markings:", "Character Preference") as null|anything in GLOB.tajara_nose_markings_list
					if(new_tajara_nose_markings)
						features["tajara_nose_markings"] = new_tajara_nose_markings

				if("tajara_facial_hairs")
					var/new_tajara_facial_hairs
					new_tajara_facial_hairs = input(user, "Choose your character's face markings:", "Character Preference") as null|anything in GLOB.tajara_facial_hairs_list
					if(new_tajara_facial_hairs)
						features["tajara_facial_hairs"] = new_tajara_facial_hairs

				if("tajara_chest_markings")
					var/new_tajara_chest_markings
					new_tajara_chest_markings = input(user, "Choose your character's chest markings:", "Character Preference") as null|anything in GLOB.tajara_chest_markings_list
					if(new_tajara_chest_markings)
						features["tajara_chest_markings"] = new_tajara_chest_markings

				if("tajara_body_markings")
					var/new_tajara_body_markings
					new_tajara_body_markings = input(user, "Choose your character's body markings:", "Character Preference") as null|anything in GLOB.tajara_body_markings_list
					if(new_tajara_body_markings)
						features["tajara_body_markings"] = new_tajara_body_markings

				if("tajara_tail")
					var/new_tajara_tail
					new_tajara_tail = input(user, "Choose your character's tail:", "Character Preference") as null|anything in GLOB.tajara_tail_list
					if(new_tajara_tail)
						features["tajara_tail"] = new_tajara_tail

				if("s_tone_tajara")
					var/new_s_tone_tajara = input(user, "Choose your character's skin-tone body:", "Character Preference")  as null|anything in GLOB.skin_tones_tajara
					if(new_s_tone_tajara)
						skin_tone_tajara = new_s_tone_tajara

				//if("s_tone_nose")
				//	var/new_s_tone_nose = input(user, "Choose your character's skin-tone nose:", "Character Preference")  as null|anything in GLOB.skin_tones_nose
				//	if(new_s_tone_nose)
				//		skin_tone_nose = new_s_tone_nose
	return ..()


/datum/preferences/random_character(gender_override, antag_override = FALSE)
	. = ..()
	if(randomise[RANDOM_SKIN_TONE_NOSE])
		skin_tone_nose = random_skin_tone_nose()
