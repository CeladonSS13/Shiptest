/datum/blackmarket_item/misc/design_disks
	name = "Old Design Disks"
	desc = "We've researched a new tech, so we don't need them anymore."
	cost_min = 50
	cost_max = 150
	stock = INFINITY
	availability_prob = 90
	item = /obj/item/disk/design_disk

/datum/blackmarket_item/misc/design_disks/spawn_item(loc)
	if(prob(5))
		return new /obj/item/disk/design_disk/super(loc)
	if(prob(10))
		return new /obj/item/disk/design_disk/adv(loc)
	return new item(loc)

/datum/blackmarket_item/misc/gun_maint_kit_small
	name = "Firearm Maintenance Small Kit"
	desc = "A minimal firearm maintenance kit with 15 uses, specifically designed for lubricating moving parts."
	cost_min = 625
	cost_max = 675
	stock = INFINITY
	availability_prob = 90
	item = /obj/item/gun_maint_kit/small
