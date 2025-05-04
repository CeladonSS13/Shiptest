// MARK: RIOL

/datum/species/riol/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_wag
	// H.verbs |= /mob/living/carbon/human/proc/emote_swag
	H.verbs |= /mob/living/carbon/human/proc/emote_howl
	H.verbs |= /mob/living/carbon/human/proc/emote_growl
	// H.verbs |= /mob/living/carbon/human/proc/emote_ururu
	H.verbs |= /mob/living/carbon/human/proc/emote_fpurr

/datum/species/riol/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_wag
	// H.verbs -= /mob/living/carbon/human/proc/emote_swag
	H.verbs -= /mob/living/carbon/human/proc/emote_howl
	H.verbs -= /mob/living/carbon/human/proc/emote_growl
	// H.verbs -= /mob/living/carbon/human/proc/emote_ururu
	H.verbs -= /mob/living/carbon/human/proc/emote_fpurr

// MARK: IPC

/datum/species/ipc/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_ping
	H.verbs |= /mob/living/carbon/human/proc/emote_beep
	H.verbs |= /mob/living/carbon/human/proc/emote_buzz
	H.verbs |= /mob/living/carbon/human/proc/emote_buzz2
	H.verbs |= /mob/living/carbon/human/proc/emote_yes
	H.verbs |= /mob/living/carbon/human/proc/emote_no

/datum/species/ipc/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_ping
	H.verbs -= /mob/living/carbon/human/proc/emote_beep
	H.verbs -= /mob/living/carbon/human/proc/emote_buzz
	H.verbs -= /mob/living/carbon/human/proc/emote_buzz2
	H.verbs -= /mob/living/carbon/human/proc/emote_yes
	H.verbs -= /mob/living/carbon/human/proc/emote_no

// MARK: MOTH

/datum/species/moth/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_flap
	H.verbs |= /mob/living/carbon/human/proc/emote_aflap
	H.verbs |= /mob/living/carbon/human/proc/emote_flutter
	H.verbs |= /mob/living/carbon/human/proc/emote_mothchitter

/datum/species/moth/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_flap
	H.verbs -= /mob/living/carbon/human/proc/emote_aflap
	H.verbs -= /mob/living/carbon/human/proc/emote_flutter
	H.verbs -= /mob/living/carbon/human/proc/emote_mothchitter

// MARK: JELLY

/datum/species/jelly/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_squish
	H.verbs |= /mob/living/carbon/human/proc/emote_bubble
	H.verbs |= /mob/living/carbon/human/proc/emote_pop

/datum/species/jelly/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_squish
	H.verbs -= /mob/living/carbon/human/proc/emote_bubble
	H.verbs -= /mob/living/carbon/human/proc/emote_pop

// MARK: TAJARA

/datum/species/tajara/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_wag
	// H.verbs |= /mob/living/carbon/human/proc/emote_swag
	H.verbs |= /mob/living/carbon/human/proc/emote_purr
	H.verbs |= /mob/living/carbon/human/proc/emote_purrl
	H.verbs |= /mob/living/carbon/human/proc/emote_hiss
	H.verbs |= /mob/living/carbon/human/proc/emote_meow
	H.verbs |= /mob/living/carbon/human/proc/emote_mrow
	H.verbs |= /mob/living/carbon/human/proc/emote_mrowss

/datum/species/tajara/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_wag
	// H.verbs -= /mob/living/carbon/human/proc/emote_swag
	H.verbs -= /mob/living/carbon/human/proc/emote_purr
	H.verbs -= /mob/living/carbon/human/proc/emote_purrl
	H.verbs -= /mob/living/carbon/human/proc/emote_hiss
	H.verbs -= /mob/living/carbon/human/proc/emote_meow
	H.verbs -= /mob/living/carbon/human/proc/emote_mrow
	H.verbs -= /mob/living/carbon/human/proc/emote_mrowss

// MARK: LIZARD

/datum/species/lizard/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_wag
	// H.verbs |= /mob/living/carbon/human/proc/emote_swag
	H.verbs |= /mob/living/carbon/human/proc/emote_hiss
	H.verbs |= /mob/living/carbon/human/proc/emote_roar
	H.verbs |= /mob/living/carbon/human/proc/emote_threat
	H.verbs |= /mob/living/carbon/human/proc/emote_whip
	H.verbs |= /mob/living/carbon/human/proc/emote_whips
	H.verbs |= /mob/living/carbon/human/proc/emote_rumble

/datum/species/lizard/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_wag
	// H.verbs -= /mob/living/carbon/human/proc/emote_swag
	H.verbs -= /mob/living/carbon/human/proc/emote_hiss
	H.verbs -= /mob/living/carbon/human/proc/emote_roar
	H.verbs -= /mob/living/carbon/human/proc/emote_threat
	H.verbs -= /mob/living/carbon/human/proc/emote_whip
	H.verbs -= /mob/living/carbon/human/proc/emote_whips
	H.verbs -= /mob/living/carbon/human/proc/emote_rumble

// MARK: VOX

/datum/species/vox/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_wag
	// H.verbs |= /mob/living/carbon/human/proc/emote_swag
	H.verbs |= /mob/living/carbon/human/proc/emote_quill

/datum/species/vox/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_wag
	// H.verbs -= /mob/living/carbon/human/proc/emote_swag
	H.verbs -= /mob/living/carbon/human/proc/emote_quill

// MARK: SKELETON

/datum/species/skeleton/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_rattle

/datum/species/skeleton/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_rattle

// MARK: SPIDER

/datum/species/spider/on_species_gain(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/emote_clack_spider

/datum/species/spider/on_species_loss(mob/living/carbon/human/H)
	..()
	H.verbs -= /mob/living/carbon/human/proc/emote_clack_spider
