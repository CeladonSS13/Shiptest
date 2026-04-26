// FACTION DOCUMENTS
/obj/item/folder/documents
	var/document = /obj/item/documents/nanotrasen
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_nanotrasen"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of Nanotrasen Corporation. Unauthorized distribution is punishable by death.\""

/obj/item/folder/documents/Initialize()
	. = ..()
	new document(src)
	update_appearance()

/obj/item/folder/documents/syndicate
	icon_state = "folder_syndie"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of The Syndicate.\""

/obj/item/folder/documents/syndicate/red
	document = /obj/item/documents/syndicate/red
	icon_state = "folder_sred"

/obj/item/folder/documents/syndicate/blue
	document = /obj/item/documents/syndicate/blue
	icon_state = "folder_sblue"

/obj/item/folder/documents/solfed
	document = /obj/item/documents/solfed
	icon = 'mod_celadon/_storage_icons/icons/items/misc/sfbureaucracy.dmi'
	icon_state = "folder_solfed"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of the Solar Federation. Unauthorized distribution is punishable by death.\""

/obj/item/folder/documents/elysium
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of the Elysium. Unauthorized distribution is punishable by death.\""
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_elysium"
	document = /obj/item/documents/elysium

	// MISC

/obj/item/folder/blue
	desc = "A blue folder."
	icon_state = "folder_blue"

/obj/item/folder/red
	desc = "A red folder."
	icon_state = "folder_red"

/obj/item/folder/yellow
	desc = "A yellow folder."
	icon_state = "folder_yellow"

/obj/item/folder/white
	desc = "A white folder."
	icon_state = "folder_white"

// FACTION FOLDERS
/obj/item/folder/syndicate
	desc = "A folder with a Syndicate color scheme."
	icon_state = "folder_syndie"

/obj/item/folder/nanotrasen
	desc = "A dark-blue folder with a Nanotrasen logo."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_nanotrasen"

/obj/item/folder/solfed
	desc = "A blue folder with a SolFed coat of arms emblem."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/sfbureaucracy.dmi'
	icon_state = "folder_solfed"

/obj/item/folder/elysium
	desc = "A green folder with a Elysium threple romb."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_elysium"

