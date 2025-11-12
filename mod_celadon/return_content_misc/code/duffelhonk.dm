/obj/item/storage/backpack/duffelbag/clown
	name = "clown's duffel bag"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpacks.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_righthand.dmi'
	desc = "A large duffel bag for holding lots of funny gags!"
	icon_state = "duffel-clown"
	item_state = "duffel-clown"

/obj/item/storage/backpack/duffelbag/clown/cream_pie/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/food/pie/cream(src)
