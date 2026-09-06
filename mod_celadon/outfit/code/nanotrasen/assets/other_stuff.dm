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

/obj/item/paper/fluff/ship/celestis/sm
	name = "Nakamura Engineering supermatter manual"
	default_raw_text ={"<html> <head><table bgcolor="ffce1c" width="100%" height="15%">
			</head>
			<th>
			<div align="left"><font size="5" color="white">
			Supermatter for dummies
			</div>
			<div align="left"><font size="1" color="white">
			<p>Written by Nakamura Engineering.</p>
			<p>Approved by nanotrasen, Inc.</p>
			</div>
			<body>
			<hr>
			<div align="left"><font size="2" color="black">
			<p>1.To start the supermatter, first of all, equip your mesons, anchor TWO Nitrogen canisters, connected to the green pipes. Don't forget to turn on their pumps.</p>
			<p>2.Turn on all TWO thermomachines, set them to the minimal temperature.</p>
			<p>3.After that, check all THREE filters for N2, O2 and plasma, make sure they are operational.</p>
			<p>4.Then, activate the 3 vents and 3 scrubbers in the core chamber using an air alarm, you'll find it on a wall.</p>
			<p>5.Set the vents to internal and the scrubbers to siphoning with expanded range.
			<p>6.Make sure to activate the vents first, and only then the scrubbers!</p>
			<p>7.Once everything is done, get all the plasma tanks inside the radiation collectors, activate them and turn on the emitters.</p>
			</div>
			<hr>
			<div align="left"><font size="1" color="black">
			<p><code>Nanotrasen Corporation is not responsibe for any injuries caused by misfollowing the manual or engine's instabilities.</code></p>
			<p><code>A delamination due to crew's negligence will result in a fine of 100.000 credits and further detainment at the nearest Vigilitas Interstellar installation.</code></p>
			</div>
			</th>
			</body>
			"}

/obj/item/gun_voucher/nanotrasen
	name = "Vigilitas weapon voucher"
	desc = "A token used to redeem equipment from your nearest marine vendor."
	icon = 'mod_celadon/_storage_icons/icons/machinery/vending.dmi'
	icon_state = "nanotrasen-voucher"

//Holocalls
/datum/preset_holoimage/commissioner
	outfit_type = /datum/outfit/job/cel/nanotrasen/commissioner

//holotapes
/obj/item/disk/holodisk/lp/retrieval/phazon
	name = "Retrieval Mission Secret Exosuit"
	desc = "A holodisk containing a retrieval mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around a retrieval objective. The LP will need to obtain or create something.
	DELAY 25
	SAY Central Command needs a very experimental exosuit to be constructed but have found a lack of funds. Please procure the parts and means to create a Phazon.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/retrieval/durand
	name = "Retrieval Mission Durand"
	desc = "A holodisk containing a retrieval mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around a retrieval objective. The LP will need to obtain or create something.
	DELAY 25
	SAY Everyone knows that big STOMPY MECHS are hysterical. But when you make a murder machine that makes it funnier. Build a Durand.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/retrieval/gunstock
	name = "Retrieval Mission Firearms"
	desc = "A holodisk containing a retrieval mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around a retrieval objective. The LP will need to obtain or create something.
	DELAY 25
	SAY Nanotrasen has sent you a very limited supply of weaponry. Increase it. We want five unique guns stored in your vault.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/retrieval/materials
	name = "Retrieval Mission Materials"
	desc = "A holodisk containing a retrieval mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around a retrieval objective. The LP will need to obtain or create something.
	DELAY 25
	SAY Nanotrasen is short on funds and materials. Procure 150 sheets of the following: Diamond, Bluespace Polycrystals, Plastitanium.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/aid/repairs
	name = "Aid Mission Repair"
	desc = "A holodisk containing an aid mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around an aid objective. The LP will need to provide aid to local vessels not hostile or syndicate.
	DELAY 25
	SAY The LP is very well suited for response missions. Find 2 other allied or friendly, non-syndicate vessels in need of repairs or construction aid, and provide said aid.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/aid/rescue
	name = "Aid Mission Rescue"
	desc = "A holodisk containing an aid mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around an aid objective. The LP will need to provide aid to local vessels not hostile or syndicate.
	DELAY 25
	SAY The mission that the LP is the most well equipped for. The LP should successfully respond to 2 emergency response missions to vessels in peril, friendly or not. Syndicate crews rescued in this manner are more likely to convert if they are saved.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/aid/guard
	name = "Aid Mission Guard Detail"
	desc = "A holodisk containing an aid mission for the LP."
	preset_image_type = /datum/preset_holoimage/commissioner
	preset_record_text = {"
	NAME Commissioner Gorre Donn
	SAY This mission, should you choose to accept it, revolves around an aid objective. The LP will need to provide aid to local vessels not hostile or syndicate.
	DELAY 25
	SAY The LP is well equipped to guard another vessel's crew on their own missions. Lend aid to allied or otherwise friendly, non-syndicate vessels in clearing out 3 ruins.
	DELAY 25
	"}

/obj/item/disk/holodisk/lp/stations
	name = "Telecomms Stations"
	desc = "A holodisk containing instructions for telecomms stations."
	preset_image_type =  /datum/preset_holoimage/engineer
	preset_record_text = {"
	NAME Jim
	SAY The company has graciously granted this vehicle a full telecommunications setup.
	DELAY 20
	SAY The available channels this ship is cleared for using are as follows:
	DELAY 20
	SAY Command Frequency: 135.1 using :c
	DELAY 20
	SAY Nanotrasen Sector Frequency: 135.3 using :w
	DELAY 20
	SAY Common Frequency: 149.1 using ;
	DELAY 20
	"}


//lootdrop
/obj/effect/spawner/random/lpretrieval
	name = "LP Retrieval Missions"
	spawn_loot_double = FALSE

	loot = list(
		/obj/item/disk/holodisk/lp/retrieval/phazon = 1,
		/obj/item/disk/holodisk/lp/retrieval/durand = 1,
		/obj/item/disk/holodisk/lp/retrieval/gunstock = 1,
		/obj/item/disk/holodisk/lp/retrieval/materials = 1
	)

	spawn_loot_count = 2

/obj/effect/spawner/random/lpaid
	name = "LP Aid Missions"
	spawn_loot_double = FALSE

	loot = list(
		/obj/item/disk/holodisk/lp/aid/repairs = 1,
		/obj/item/disk/holodisk/lp/aid/rescue = 1,
		/obj/item/disk/holodisk/lp/aid/guard = 1,
	)

	spawn_loot_count = 4
