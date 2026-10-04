//signs
/obj/structure/sign/nanotrasen
	name = "\improper Nanotrasen logo sign"
	sign_change_name = "Corporate Logo - Nanotrasen"
	desc = "A sign with the Nanotrasen logo on it - galaxy's largest decadent megacorp, the first of the first in proving bluespace theories and currently providing many different services to the citizens of the coreworlds. Glory to Nanotrasen!"
	icon = 'mod_celadon/_storage_icons/icons/structures/logo/nanotrasen_logos.dmi'
	icon_state = "nanotrasen"
	is_editable = TRUE

/obj/structure/sign/nanotrasen/old
	name = "\improper old Nanotrasen logo sign"
	sign_change_name = "Corporate Logo - Nanotrasen (Outdated)"
	desc = "A sign with an ancient Nanotrasen logo on it. This one appears to represent the early, golden days of Nanotrasen. A relic."
	icon_state = "nanotrasen_old"

/obj/structure/sign/nanotrasen/vigilitas
	name = "\improper Vigilitas Interstellar logo sign"
	sign_change_name = "Corporate Logo - Vigilitas Interstellar"
	desc = "A sign belonging to the main security contractor of the Nanotrasen-alliance - Vigilitas Interstellar. Providing security and paramilitary services in and outside of Sol since 2403."
	icon_state = "vigilitas"
	is_editable = TRUE

/obj/structure/sign/nanotrasen/ns
	name = "\improper N+S Logistics logo sign"
	sign_change_name = "Corporate Logo - N+S Logistics"
	desc = "A sign of the N+S Logistics Company. Providing equipment, running mining and logistics operations in the frontier for their generous Nanotrasen overlords."
	icon_state = "ns"
	is_editable = TRUE

/obj/structure/sign/nanotrasen/deforest
	name = "\improper DeForest Medical logo sign"
	sign_change_name = "Corporate Logo - DeForest Medical"
	desc = "A sign belonging to the DeForest Medical Company - Nanotrasen's main and only provider of medical and pharmaceutical services outside of Sol."
	icon_state = "deforest"
	is_editable = TRUE

/obj/structure/sign/nanotrasen/nakamura
	name = "\improper Nakamura Engineering logo sign"
	sign_change_name = "Corporate Logo - Nakamura Engineering"
	desc = "A sign displaying the logo of Nakamura Engineering. A Taoss company making profits in terraforming far-away worlds and producing a large variety of tools and equipment for their Nanotrasen overlords."
	icon_state = "nakamura"
	is_editable = TRUE

//holosigns
/obj/machinery/holosign/nanotrasen
	name = "holosign - Nanotrasen Advertisment"
	desc_add = "Nanotrasen, Inc. - Breaking scientific barriers since 2388."
	icon_state = "nanotrasen"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/holoposter.dmi'
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/holosign/deforest
	name = "holosign - DeForest Medical"
	desc_add = "DeForest Medical Company - The best pharmaceutical company of the frontier. Making drugs and medical equipment affordable to everybody since 2387."
	icon_state = "deforest"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/holoposter.dmi'
	light_color = LIGHT_COLOR_NEONLIGHTBLUE

/obj/machinery/holosign/nakamura
	name = "holosign - Nakamura Engineering"
	desc_add = "Nakamura Engineering - The best tools money can buy. Selling stockparts manufactured by the latest Nanotrasen patents, contact us today!"
	icon_state = "nakamura"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/holoposter.dmi'
	light_color = LIGHT_COLOR_FLARE

//soap
/obj/item/soap/nanotrasen
	desc = "A heavy duty bar of Nanotrasen brand soap. Smells of plasma."
	grind_results = list(/datum/reagent/toxin/plasma = 10, /datum/reagent/lye = 10)
	icon_state = "soapnanotrasen"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/items.dmi'
	cleanspeed = 28 //janitor gets this
	uses = 300

//real elite defib
/obj/item/defibrillator/compact/combat/loaded/nanotrasen
	name = "elite Nanotrasen defibrillator"
	desc = "A belt-equipped state-of-the-art defibrillator. Can revive through spacesuits, has an experimental self-recharging battery, and can be utilized in combat via applying the paddles in a disarming or agressive manner."
	icon_state = "defibnanotrasen"
	item_state = "defibnanotrasen"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/defib.dmi'
	paddle_type = /obj/item/shockpaddles/syndicate/nanotrasen

/obj/item/shockpaddles/syndicate/nanotrasen
	name = "elite Nanotrasen defibrillator paddles"
	desc = "A pair of paddles used to revive deceased ERT members. They possess both the ability to penetrate armor and to deliver powerful or disabling shocks offensively."
	icon_state = "nanotrasenpaddles0"
	item_state = "nanotrasenpaddles0"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/defib.dmi'
	base_icon_state = "nanotrasenpaddles"

//desk flag
/obj/item/desk_flag/nanotrasen
	name = "nanotrasen desk flag"
	desc = "A blue flag with a small Nanotrasen Corporation logo on it."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/deskflags.dmi'
	icon_state = "nanotrasen"

//bedsheets, commonly used for beds
/obj/item/bedsheet/nanotrasen
	name = "\improper Nanotrasen bedsheet"
	desc = "It has the Nanotrasen logo on it and has an aura of duty."
	icon_state = "sheetnanotrasen"
	item_state = "sheetnanotrasen"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bedsheets.dmi'
	dream_messages = list("authority", "an ending")

/obj/item/bedsheet/captain
	name = "captain's bedsheet"
	desc = "It has a Nanotrasen symbol on it, and was woven with a revolutionary new kind of thread guaranteed to have 0.01% permeability for most non-chemical substances, popular among most modern captains."
	icon_state = "sheetcaptain"
	item_state = "sheetcaptain"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bedsheets.dmi'
	dream_messages = list("authority", "a golden ID", "sunglasses", "a green disc", "an antique gun", "the captain")

/obj/item/bedsheet/double/captain
	name = "double captain's bedsheet"
	icon_state = "double_sheetcaptain"
	item_state = "sheetcaptain"
	dream_messages = list("authority", "a golden ID", "sunglasses", "a green disc", "an antique gun", "the captain")
	desc = "It has a Nanotrasen symbol on it, and was woven with a revolutionary new kind of thread guaranteed to have 0.01% permeability for most non-chemical substances, popular among most modern captains."

/obj/item/bedsheet/centcom
	name = "\improper CentCom bedsheet"
	desc = "Woven with advanced nanothread for warmth as well as being very decorated, essential for all officials."
	icon_state = "sheetcentcom"
	item_state = "sheetcentcom"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bedsheets.dmi'
	dream_messages = list("a unique ID", "authority", "artillery", "an ending")

//bureaucracy
/obj/item/documents/nanotrasen
	desc = "\"Top Secret\" Nanotrasen documents, filled with complex diagrams and lists of names, dates and coordinates."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "docs_nanotrasen"

/obj/item/documents/nanotrasen/research
	desc = "\"Top Secret\" Nanotrasen documents, filled with blueprints, classified research data and coordinates."
	icon_state = "docs_nanotrasen_research"

/obj/item/folder/nanotrasen
	desc = "A dark-blue folder with a Nanotrasen logo."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_nanotrasen"

/obj/item/folder/documents/nanotrasen
	icon = 'mod_celadon/_storage_icons/icons/items/misc/bureaucracy.dmi'
	icon_state = "folder_nanotrasen"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of Nanotrasen Corporation. Unauthorized distribution is punishable by death.\""
	document = /obj/item/documents/nanotrasen

/obj/item/folder/documents/nanotrasen/research
	desc = "A folder stamped \"Top Secret - Property of Nanotrasen Corporation. Unauthorized distribution is punishable by death.\""
	document = /obj/item/documents/nanotrasen/research

/obj/item/gun_voucher/nanotrasen
	name = "Vigilitas weapon voucher"
	desc = "A token used to redeem equipment from your nearest marine vendor."
	icon = 'mod_celadon/_storage_icons/icons/machinery/vending.dmi'
	icon_state = "nanotrasen-voucher"

/obj/item/reagent_containers/food/drinks/nanotrasenmug
	name = "nanotrasen-brand mug"
	desc = "A blue ceramic mug that includes a handle. Nanotrasen-branded and used for serving hot corporate drinks."
	icon_state = "nanotrasenmug"
	icon = 'mod_celadon/_storage_icons/icons/items/misc/drinks.dmi'
	volume = 30
	spillable = TRUE

/datum/preset_holoimage/engi_guide
	species_type = /datum/species/human
	outfit_type = /datum/outfit/job/cel/nanotrasen/ce/nakamura

/obj/item/disk/holodisk/ship/peregrine/engineeringnotice
	name = "holorecord disk - Engine Introduction"
	preset_image_type = /datum/preset_holoimage/engi_guide
	preset_record_text = {"
	NAME Engineering Director
	DELAY 10
	SAY ...Is this thing on?
	DELAY 20
	SAY Hello there! This is your engineering director speaking.
	DELAY 20
	SAY Welcome to the engineering bay!
	DELAY 50
	SAY The bay is split in two: atmospherics and the tool storage.
	DELAY 50
	SAY You are currently in the tool storage. Probably.
	DELAY 50
	SAY ...While i could waste your time explaining what's going on and what's where.
	DELAY 50
	SAY Lets just get straight to bussiness: The supermatter crystal!.. And it's turbine generators.
	DELAY 50
	SAY So basically, what you'd usually see are some radiation collectors or maybe tesla coils, right?
	DELAY 50
	SAY Well that's not going to happen here! This ship is equipped with a pair of turbine generators.
	DELAY 50
	SAY The supermatter itself serves as a rather inefficient fuel generator for the turbines.
	DELAY 50
	SAY Will it stay inefficient, improve it's fuel output or explode? That's up to you!
	DELAY 50
	SAY Although i'd recommend keeping it intact, Nanotrasen does not want you to ruin their new shiny refit.
	DELAY 50
	SAY Well! Refer to the atmospherics holodisk for further instructions on the supermatter setup. i'll see you there.
	DELAY 50
	SAY ...As for now consider equipping some tools and radiation protection. It's in this room somewhere.
	"}

/obj/item/disk/holodisk/ship/peregrine/supermatter
	name = "holorecord disk - Supermatter guide"
	preset_image_type = /datum/preset_holoimage/engi_guide
	preset_record_text = {"
	NAME Engineering Director
	DELAY 10
	SAY ...Uhhh. Welcome Back!
	DELAY 30
	SAY I'm assuming you already listened to the first disk in the tool storage room, if not, go do so!
	DELAY 50
	SAY I'm now going to do a step-by-step guide for the setup. Listen carefully. You can come back and replay this if needed.
	DELAY 20
	SAY Uhh...
	DELAY 50
	SAY So, turn all the thermomachines ON. No need to mess with their settings.
	DELAY 50
	SAY After that, turn all the gas filters left of the thermomachines ON. Make sure the first filter connected to the green pipes is operational and filters for nitrogen.
	DELAY 50
	SAY Connect the green nitrogen canisters to their respective ports. You can find them under the control panel. Once done, turn their pumps ON.
	DELAY 50
	SAY Done? Now do the same for the blue canister north of the control panel!
	DELAY 50
	SAY The piping setup should be up and running by now: Look for an air alarm in the core chamber's airlock.
	DELAY 50
	SAY Turn the vents ON and set them to internal. Uncheck the 'external' setting.
	DELAY 50
	SAY Now go look for scrubber controls, set them to siphoning with extended range. Beware, vents first, never second.
	DELAY 50
	SAY If your engine is not already on fire, you should be all set. Check if the gas inside the chamber is circulating and then engage all the emitters.
	DELAY 50
	SAY ...Well, that's all. I hope you're not delaminating and panicking right now. I'm gonna leave you for my lunch break. Don't wanna miss those sandwiches.
	DELAY 20
	SAY Good luck!!
	"}
