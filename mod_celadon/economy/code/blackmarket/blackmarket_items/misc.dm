/datum/blackmarket_item/misc/design_disks
	name = "Old Design Disks"
	desc = "We've researched a new tech, so we don't need them anymore."

	price_min = 50
	price_max = 150
	unlimited = TRUE
	availability_prob = 90
	item = /obj/item/disk/design_disk

/datum/blackmarket_item/misc/design_disks/spawn_item(loc)
	if(prob(5))
		return new /obj/item/disk/design_disk/super(loc)
	if(prob(10))
		return new /obj/item/disk/design_disk/adv(loc)
	return new item(loc)
