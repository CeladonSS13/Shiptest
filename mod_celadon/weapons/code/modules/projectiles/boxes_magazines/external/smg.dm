// https://github.com/CeladonSS13/Shiptest/pull/2461

// MARK: 5.7x39
/obj/item/ammo_box/magazine/m57_39_sidewinder
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "sidewinder_mag-30"


/obj/item/ammo_box/magazine/m57_39_sidewinder/update_icon_state()
	. = ..()
	switch(ammo_count())
		if(30)
			icon_state = "[base_icon_state]-30"
		if(24 to 29)
			icon_state = "[base_icon_state]-26"
		if(20 to 23)
			icon_state = "[base_icon_state]-22"
		if(16 to 19)
			icon_state = "[base_icon_state]-18"
		if(12 to 15)
			icon_state = "[base_icon_state]-14"
		if(8 to 11)
			icon_state = "[base_icon_state]-10"
		if(6 to 7)
			icon_state = "[base_icon_state]-6"
		if(1 to 5)
			icon_state = "[base_icon_state]-2"
		if(0)
			icon_state = "[base_icon_state]-0"

// MARK: REFLAVOUR

/obj/item/ammo_box/magazine/wt550m9
	name = "toploaded magazine (4.6x30mm)"
	desc = "A compact, 30-round top-loading magazine for old WT-550 Automatic Rifle and new Resolution personal defense weapon. These rounds do okay damage with average performance against armor."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "46x30mmt-30"
	base_icon_state = "46x30mmt"

/obj/item/ammo_box/magazine/wt550m9/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 6)]"

/obj/item/ammo_box/magazine/wt550m9/ap
	name = "toploaded magazine (4.6x30mm AP)"
	desc = "A compact, 30-round top-loading magazine for old WT-550 Automatic Rifle and new Resolution personal defense weapon.  These armor-piercing rounds are great at piercing protective equipment, but lose some stopping power."

/obj/item/ammo_box/magazine/m9mm_expedition
	name = "SMG magazine (9x18mm)"
	desc = "A 30-round magazine for 9x18mm submachine guns such as Expedition, Vector, Saber. These rounds do okay damage, but struggle against armor."

/obj/item/ammo_box/magazine/skm_46_30/empty
	start_empty = TRUE
