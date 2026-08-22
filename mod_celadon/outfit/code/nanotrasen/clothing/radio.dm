//Nanotrasen radios
/obj/item/radio/headset/nanotrasen
	name = "Nanotrasen radio headset"
	desc = "Uses patented 'Bluespace Waves'(TM) to communicate with other members of the Nanotrasen-alliance."
	icon_state = "nanotrasen_headset"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/radio.dmi'
	keyslot = /obj/item/encryptionkey/nanotrasen

/obj/item/radio/headset/nanotrasen/captain
	name = "Nanotrasen captain's radio headset"
	desc = "Worn proudly by Nanotrasen's captains on the frontier."
	keyslot2 = new /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/nanotrasen/alt
	name = "Nanotrasen bowman headset"
	desc = "Uses patented 'Bluespace Waves'(TM) to communicate with other members of the Nanotrasen-alliance. Protects ears from flashbangs."
	icon_state = "nanotrasen_headset_alt"
	hearing_protection = TRUE

/obj/item/radio/headset/nanotrasen/alt/captain
	name = "Nanotrasen captain's bowman headset"
	desc = "Worn proudly by Nanotrasen's captains on the frontier. Protects ears from flashbangs."
	keyslot2 = /obj/item/encryptionkey/heads/captain
	command = TRUE
