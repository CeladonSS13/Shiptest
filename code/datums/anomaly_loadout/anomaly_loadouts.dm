/datum/anomalyloadout
	var/name = "fish"
	var/desc = "glup glup glup"
	var/loadoutpoints = 5000
	var/list/weaponoptions = list()
	var/list/armoroptions = list()
	var/list/drip = list()
	var/list/hats = list()
	var/list/utility = list()


/datum/anomalyloadout/New()
	. = ..()
	drip[/obj/item/clothing/shoes/sneakers/black] = 0
	drip[/obj/item/clothing/shoes/laceup] = 0
	drip[/obj/item/clothing/shoes/workboots] = 50
	drip[/obj/item/clothing/shoes/workboots/mining] = 50
	drip[/obj/item/clothing/shoes/combat] = 50
	utility[/obj/item/storage/toolbox/electrical] = 75
	utility[/obj/item/storage/toolbox/mechanical] = 75
	


/datum/anomalyloadout/syndicate/New()
	. = ..()
	weaponoptions[/obj/item/storage/guncase/pistol/himehabu/wammo] = 250
	weaponoptions[/obj/item/storage/guncase/pistol/asp/wammo] = 1250
	weaponoptions[/obj/item/storage/guncase/pistol/pc76/wammo] = 1250
	weaponoptions[/obj/item/storage/guncase/pistol/a357/wammo] = 1750
	weaponoptions[/obj/item/storage/guncase/pistol/rattlesnake/wammo] = 2500
	armoroptions[/obj/item/clothing/suit/armor/vest] = 750
	utility[/obj/item/storage/toolbox/syndicate] = 200

/datum/anomalyloadout/syndicate/cybersun/New()
	. = ..()

/datum/anomalyloadout/syndicate/cybersun/captain/New()
	. = ..()
	loadoutpoints += 3000
	armoroptions[/obj/item/clothing/suit/armor/vest/capcarapace/cybersun] = 3000
	hats[/obj/item/clothing/head/HoS/cybersun] = 0
	