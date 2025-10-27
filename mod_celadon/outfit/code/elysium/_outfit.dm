/datum/outfit/job/cel/elysium/captain
	name = "Elysium - Caid"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/elysium/captain
	backpack = /obj/item/storage/backpack/satchel/leather
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/color/darkgreen
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/bandana/green
	ears = /obj/item/radio/headset/heads/captain/alt

/datum/outfit/job/cel/elysium/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/cel/elysium/security
	name = "Elysium - Mukatell"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	id = /obj/item/card/id/cel/elysium/crew/security
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/bandana/green
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/alt
	backpack_contents = list(/obj/item/melee/knife/switchblade)

/datum/outfit/job/cel/elysium/security/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/cel/elysium/assistant
	name = "Elysium - Ahisa`i"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	id = /obj/item/card/id/cel/elysium/crew
	suit = /obj/item/clothing/suit/apparel/black
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/shemag/black
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots

/datum/outfit/job/cel/elysium/assistant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)
