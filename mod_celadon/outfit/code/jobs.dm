// MARK: MIME
/datum/job/mime
	name = "Mime"
	wiki_page = "Mime" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/cel/independent/mime

	access = list(ACCESS_THEATRE)
	minimal_access = list(ACCESS_THEATRE)

	display_order = JOB_DISPLAY_ORDER_MIME

/datum/job/mime/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.apply_pref_name("mime", M.client)

// MARK: CLOWN
/datum/job/clown
	name = "Clown"
	wiki_page = "Clown" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/cel/independent/clown

	access = list(ACCESS_THEATRE)
	minimal_access = list(ACCESS_THEATRE)

	display_order = JOB_DISPLAY_ORDER_CLOWN


/datum/job/clown/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.apply_pref_name("clown", M.client)
