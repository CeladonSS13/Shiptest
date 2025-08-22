/obj/item/taperecorder
	name = "cassette tape recorder"
	desc = "A device that can record to cassette tapes, and play them."

/obj/item/restraints/handcuffs/pinkcuffs
	name = "fluffy pink handcuffs"
	desc = "Use this to keep prisoners in line, they are really itchy."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/restraints.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/left_pinkcuffs.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/right_pinkcuffs.dmi'
	icon_state = "pinkcuffs"


// Сложенные флаги, то есть обычные предметы, которые можно повесить на стену/снять со стены

/obj/item/sign/flag/solfed
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded Solar Federation flag"
	desc = "Dark blue folded flag with Solar Federation logo on it.. Makes you love democracy."
	icon_state = "folded_SF"
	sign_path = /obj/structure/sign/flag/solfed

/obj/item/sign/flag/nanotrasen
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded Nanotrasen flag"
	desc = "Light blue folded flag with Nanotrasen logo on it.. No, you don't need any shipment manifest to hold it on your shuttle."
	icon_state = "folded_NT"
	sign_path = /obj/structure/sign/flag/nanotrasen

/obj/item/sign/flag/syndie
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded Syndicate flag"
	desc = "Bloody-red folded flag with Syndicate logo on it.. Be careful, may be explosive."
	icon_state = "folded_Syndie"
	sign_path = /obj/structure/sign/flag/syndie

/obj/item/sign/flag/elysium
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded Elysium flag"
	desc = "Light green folded flag with light yellow-white strips and Elysium logo on it.. Glory about your nation warmth your heart."
	icon_state = "folded_Elysium"
	sign_path = /obj/structure/sign/flag/elysium

/obj/item/sign/flag/inteq
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded InteQ flag"
	desc = "Brown folded flag with InteQ logo on it.. Stop thinking about selling it. Seriously."
	icon_state = "folded_InteQ"
	sign_path = /obj/structure/sign/flag/inteq

/obj/item/sign/flag/separatist
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper folded Separatist flag"
	desc = "Light green folded flag with light yellow-white strips and Elysium Separatist logo on it.. Strengthens your faith in a righteous cause."
	icon_state = "folded_Separ"
	sign_path = /obj/structure/sign/flag/separatist

// Настенные флаги, то есть структуры, которые можно повесить/снять со стены

/obj/structure/sign/flag/solfed
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper Solar Federation flag"
	desc = "Dark blue flag with Solar Federation logo on it.. Makes you love democracy."
	icon_state = "flag_SF"
	item_flag = /obj/item/sign/flag/solfed

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/solfed, (-32))

/obj/structure/sign/flag/nanotrasen
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper Nanotrasen flag"
	desc = "Light blue flag with Nanotrasen logo on it.. No, you don't need any shipment manifest to hold it on your shuttle."
	icon_state = "flag_NT"
	item_flag = /obj/item/sign/flag/nanotrasen

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/nanotrasen, (-32))

/obj/structure/sign/flag/syndie
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper Syndicate flag"
	desc = "Bloody-red flag with Syndicate logo on it.. Be careful, may be explosive."
	icon_state = "flag_Syndie"
	item_flag = /obj/item/sign/flag/syndie

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/syndie, (-32))

/obj/structure/sign/flag/inteq
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper InteQ flag"
	desc = "Brown flag with InteQ logo on it.. Stop thinking about selling it. Seriously."
	icon_state = "flag_InteQ"
	item_flag = /obj/item/sign/flag/inteq

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/inteq, (-32))

/obj/structure/sign/flag/separatist
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper Separatist flag"
	desc = "Light green flag with light yellow-white strips and Elysium Separatist logo on it.. Strengthens your faith in a righteous cause."
	icon_state = "flag_Separ"
	item_flag = /obj/item/sign/flag/separatist

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/separatist, (-32))

/obj/structure/sign/flag/elysium
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	name = "\improper Elysium flag"
	desc = "Light green flag with light yellow-white strips and Elysium logo on it.. Glory about your nation warmth your heart."
	icon_state = "flag_Elysium"
	item_flag = /obj/item/sign/flag/elysium

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/elysium, (-32))

// Баннеры

/obj/item/banner/solfed
	name = "Solar Federation banner"
	desc = "Dark blue banner with Solar Federation logo on it.. Makes you love democracy."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_SF"
	item_state = "banner_SF"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "FREEEEDOOOOM!!!!!"

/obj/item/banner/solfed/mundane
	inspiration_available = FALSE

/obj/item/banner/nanotrasen
	name = "Nanotrasen banner"
	desc = "Light blue banner with Nanotrasen logo on it, with some golden stripes.. No, you don't need any shipment manifest to hold it on your shuttle."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_NT"
	item_state = "banner_NT"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "Soon we will privatize oxygen itself!"

/obj/item/banner/nanotrasen/mundane
	inspiration_available = FALSE

/obj/item/banner/syndie
	name = "Syndicate banner"
	desc = "Bloody-red banner with Syndicate logo on it.. Be careful, may be explosive."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_Syndie"
	item_state = "banner_Syndie"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "Whiskey.. Echo.. Whiskey.. Lima.. Alpha.. Delta.."

/obj/item/banner/syndie/mundane
	inspiration_available = FALSE

/obj/item/banner/elysium
	name = "Elysium banner"
	desc = "Light green banner with light yellow-white strips and Elysium logo on it.. Glory about your nation warmth your heart."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_Elysium"
	item_state = "banner_Elysium"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "Glory to the nation!"

/obj/item/banner/elysium/mundane
	inspiration_available = FALSE

/obj/item/banner/inteq
	name = "InteQ banner"
	desc = "Brown folded banner with InteQ logo on it.. Stop thinking about selling it. Seriously."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_InteQ"
	item_state = "banner_InteQ"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "For the company. For the mercenaries!"

/obj/item/banner/inteq/mundane
	inspiration_available = FALSE

/obj/item/banner/separatist
	name = "Separatist banner"
	desc = "Light green banner with light yellow-white strips and Elysium Separatist logo on it.. Strengthens your faith in a righteous cause."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/flags.dmi'
	icon_state = "banner_Separ"
	item_state = "banner_Separ"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/banners_righthand.dmi'
	warcry = "We will clean our home from xenos.. For the purity of our Nation!"

/obj/item/banner/separatist/mundane
	inspiration_available = FALSE
