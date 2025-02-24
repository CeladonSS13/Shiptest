//Ramzi_Clique

/datum/outfit/job/ramzi

/datum/outfit/job/ramzi/post_equip(mob/living/carbon/human/H, visualsOnly)
    . = ..()
    if(visualsOnly)
        return
    H.faction |= list(FACTION_PLAYER_PIRATE)

/datum/outfit/job/ramzi/assistant
	name = "Ramzi-Clique Innitiate"

	uniform = /obj/item/clothing/under/syndicate/camo
	r_pocket = /obj/item/melee/knife/survival
	belt = /obj/item/storage/belt/military
	back = /obj/item/storage/backpack

	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat
	box = /obj/item/storage/box/survival/syndicate
	mask = /obj/item/clothing/mask/balaclava/combat

/datum/outfit/job/ramzi/cellleader
	name = "Ramzi-Clique Cell Leader"

	uniform = /obj/item/clothing/under/syndicate/camo
	r_pocket = /obj/item/melee/knife/survival
	belt = /obj/item/storage/belt/military
	back = /obj/item/storage/backpack

	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat
	box = /obj/item/storage/box/survival/syndicate
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger

/datum/outfit/job/ramzi/engi
	name = "Ramzi-Clique Combat Engineer"

	uniform = /obj/item/clothing/under/syndicate/camo
	r_pocket = /obj/item/melee/knife/survival
	belt = /obj/item/storage/belt/utility/full/engi
	back = /obj/item/storage/backpack

	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat
	box = /obj/item/storage/box/survival/syndicate
	mask = /obj/item/clothing/mask/balaclava/combat
