
/datum/preferences
	/// Nose skin color for tajaran
	var/skin_tone_nose = "black"

	/// Body skin color for tajaran
	var/skin_tone_tajara = "Black"

/datum/preferences/New(client/C)
	features += list(
		"tajaran_ears" = "Plain",
		"tajaran_hairs" = "Plain",
		"tajaran_ears_markings" = "None",
		"tajaran_head_markings" = "None",
		"tajaran_nose_markings" = "None",
		"tajaran_facial_hairs" = "None",
		"tajaran_chest_markings" = "None",
		"tajaran_body_markings" = "None",
		"tajaran_tail" = "Long"
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
				if("tajaran_ears")
					var/new_tajaran_ears
					new_tajaran_ears = input(user, "Choose your character's ears:", "Character Preference") as null|anything in GLOB.tajaran_ears_list
					if(new_tajaran_ears)
						features["tajaran_ears"] = new_tajaran_ears

				if("tajaran_hairs")
					var/new_tajaran_hairs
					new_tajaran_hairs = input(user, "Choose your character's hair:", "Character Preference") as null|anything in GLOB.tajaran_hairs_list
					if(new_tajaran_hairs)
						features["tajaran_hairs"] = new_tajaran_hairs

				if("tajaran_ears_markings")
					var/new_tajaran_ears_markings
					new_tajaran_ears_markings = input(user, "Choose your character's head markings:", "Character Preference") as null|anything in GLOB.tajaran_ears_markings_list
					if(new_tajaran_ears_markings)
						features["tajaran_ears_markings"] = new_tajaran_ears_markings

				if("tajaran_head_markings")
					var/new_tajaran_head_markings
					new_tajaran_head_markings = input(user, "Choose your character's head markings:", "Character Preference") as null|anything in GLOB.tajaran_head_markings_list
					if(new_tajaran_head_markings)
						features["tajaran_head_markings"] = new_tajaran_head_markings

				if("tajaran_nose_markings")
					var/new_tajaran_nose_markings
					new_tajaran_nose_markings = input(user, "Choose your character's nose markings:", "Character Preference") as null|anything in GLOB.tajaran_nose_markings_list
					if(new_tajaran_nose_markings)
						features["tajaran_nose_markings"] = new_tajaran_nose_markings

				if("tajaran_facial_hairs")
					var/new_tajaran_facial_hairs
					new_tajaran_facial_hairs = input(user, "Choose your character's face markings:", "Character Preference") as null|anything in GLOB.tajaran_facial_hairs_list
					if(new_tajaran_facial_hairs)
						features["tajaran_facial_hairs"] = new_tajaran_facial_hairs

				if("tajaran_chest_markings")
					var/new_tajaran_chest_markings
					new_tajaran_chest_markings = input(user, "Choose your character's chest markings:", "Character Preference") as null|anything in GLOB.tajaran_chest_markings_list
					if(new_tajaran_chest_markings)
						features["tajaran_chest_markings"] = new_tajaran_chest_markings

				if("tajaran_body_markings")
					var/new_tajaran_body_markings
					new_tajaran_body_markings = input(user, "Choose your character's body markings:", "Character Preference") as null|anything in GLOB.tajaran_body_markings_list
					if(new_tajaran_body_markings)
						features["tajaran_body_markings"] = new_tajaran_body_markings

				if("tajaran_tail")
					var/new_tajaran_tail
					new_tajaran_tail = input(user, "Choose your character's tail:", "Character Preference") as null|anything in GLOB.tajaran_tail_list
					if(new_tajaran_tail)
						features["tajaran_tail"] = new_tajaran_tail

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
