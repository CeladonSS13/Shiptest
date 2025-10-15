//********************
// 		UNDER
//********************
/obj/item/clothing/under/tajaran
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	// can_adjust = FALSE - [CELADON-ALERT] - Параметр удалён оффами - https://github.com/shiptest-ss13/Shiptest/pull/4738
	name = "people's republic consular uniform"
	desc = "An olive uniform used by the diplomatic service of the People's Republic."
	icon_state = "pra_consular"
	item_state = "pra_consular"

/obj/item/clothing/under/tajaran/consular/female
	icon_state = "pra_con_f"
	item_state = "pra_con_f"

/obj/item/clothing/under/tajaran/consular/dpra
	name = "democratic people's republic consular uniform"
	desc = "A grey uniform used by the diplomatic service of the Democratic People's Republic."
	icon_state = "dpra_consular"
	item_state = "dpra_consular"

/obj/item/clothing/under/tajaran/laborer
	name = "laborer clothes"
	desc = "A rough but thin outfit, providing air flow but also protection from working hazards."
	icon_state = "taj_labor"
	item_state = "taj_labor"

/obj/item/clothing/under/tajaran/pra_uniform
	name = "republican army uniform"
	desc = "A military uniform used by the forces of Grand People's Army."
	icon_state = "prauniform"
	item_state = "prauniform"
	siemens_coefficient = 0.7
	// armor = list("melee" = 10, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/tajaran/fancy
	name = "fancy uniform"
	desc = "Worn by princes, barons and lords, now in stores near you!"
	icon_state = "male_taj_fancy"
	item_state = "male_taj_fancy"

// Evening Suit
/obj/item/clothing/under/tajaran/fancy/evening_suit
	name = "evening suit"
	desc = "A rich purple evening suit meant for lounging or other luxury."
	icon_state = "evening_suit"
	item_state = "evening_suit"

/obj/item/clothing/under/dress/tajaran
	name = "fancy dress"
	desc = "Created for the rich and party-loving circles, this dress is fashioned from smooth silk and is see through at parts. This one is white."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	icon_state = "taj_dress_white"
	item_state = "taj_dress_white"

/obj/item/clothing/under/dress/tajaran/blue
	desc = "Created for the rich and party-loving circles, this dress is fashioned from smooth silk and is see through at parts. This one is blue."
	icon_state = "taj_dress_skyblue"
	item_state = "taj_dress_skyblue"

/obj/item/clothing/under/dress/tajaran/green
	desc = "Created for the rich and party-loving circles, this dress is fashioned from smooth silk and is see through at parts. This one is green."
	icon_state = "taj_dress_green"
	item_state = "taj_dress_green"

/obj/item/clothing/under/dress/tajaran/red
	desc = "Created for the rich and party-loving circles, this dress is fashioned from smooth silk and is see through at parts. This one is red."
	icon_state = "taj_dress_red"
	item_state = "taj_dress_red"

/obj/item/clothing/under/dress/tajaran/fancy/black
	desc = "The classical dress of royalty, only to be worn during the special occassions. This one is dark black."
	icon_state = "taj_dress_fancy_dark"
	item_state = "taj_dress_fancy_dark"

/obj/item/clothing/under/dress/tajaran/fancy
	name = "noble dress"
	desc = "The classical dress of royalty, only to be worn during the special occassions. This one is crimson red."
	icon_state = "taj_dress_fancy"
	item_state = "taj_dress_fancy"

/obj/item/clothing/under/suit/galaxy
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/galaxy.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/galaxy.dmi'
	// can_adjust = FALSE - [CELADON-ALERT] - Параметр удалён оффами - https://github.com/shiptest-ss13/Shiptest/pull/4738
	name = "blue galaxy suit"
	icon_state = "lawyer_galaxy_blue"
	item_state = "b_suit"

/obj/item/clothing/under/suit/galaxy/skirt
	name = "blue galaxy suitskirt"
	icon_state = "lawyer_galaxy_blue_skirt"
	dying_key = DYE_REGISTRY_JUMPSKIRT

/obj/item/clothing/under/suit/galaxy/red
	name = "red galaxy suit"
	icon_state = "lawyer_galaxy_red"
	item_state = "r_suit"

/obj/item/clothing/under/suit/galaxy/red/skirt
	name = "red galaxy suitskirt"
	icon_state = "lawyer_galaxy_red_skirt"
	dying_key = DYE_REGISTRY_JUMPSKIRT

/obj/item/clothing/under/suit/archeologist
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "archaeologist uniform"
	desc = "A rugged uniform used by archaeologists. It is already covered in dirt and ancient dust."
	icon_state = "explorer_uniform"
	item_state = "explorer_uniform"
	slot_flags = ITEM_SLOT_ICLOTHING
	body_parts_covered = CHEST | ARMS | GROIN | LEGS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small


/obj/item/clothing/under/syndicate/tacticool/china
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-. This one looks a more cheaper."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/syndicate/tacticool/skirt/china
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-. This one looks a more cheaper."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/// MARK: MAID
/obj/item/clothing/under/syndicate/skirt/maid
	name = "tactical maid outfit"
	desc = "A 'tactical' turtleneck fashioned to the likeness of a maid outfit. Why the Syndicate has these, you'll never know."
	icon_state = "syndimaid"
	item_state = "syndimaid"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'

/obj/item/clothing/under/syndicate/skirt/maid/Initialize()
	. = ..()
	var/obj/item/clothing/accessory/maidapron/syndicate/A = new (src)
	attach_accessory(A)

/obj/item/clothing/under/syndicate/inteq/skirt/maid
	name = "inteq tactical maid outfit"
	desc = "A 'tactical' turtleneck fashioned to the likeness of a maid outfit. This one is lovingly knitted in the colors of the IRMG."
	icon_state = "inteqmaid"
	item_state = "inteqmaid"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	// can_adjust = FALSE - [CELADON-ALERT] - Параметр удалён оффами - https://github.com/shiptest-ss13/Shiptest/pull/4738
	supports_variations = KEPORI_VARIATION | VOX_VARIATION | DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/syndicate/inteq/skirt/maid/Initialize()
	. = ..()
	var/obj/item/clothing/accessory/maidapron/inteq/A = new (src)
	attach_accessory(A)

/obj/item/clothing/under/padded
	name = "feathered serenity suit"
	desc = "A meticulously handcrafted suit that is lined on the inside with feathers and down."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/suit/in_hands/padded_left.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/suit/in_hands/padded_right.dmi'
	icon_state = "paddedunder"
	item_state = "paddedunder"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | TAJARA_VARIATION | RIOL_VARIATION

/obj/item/clothing/under/padded/alt
	name = "feathered serenity dress"
	desc = "A meticulously handcrafted dress that is lined on the inside with feathers and down. Twirling in this dress provides a satisfying result!"
	icon_state = "paddeddress"
	item_state = "paddeddress"

// MARK: SWIMMING SKIRTS
/obj/item/clothing/under/dress/skirt/swimming
	name = "red bra and striped skirt"
	desc = "A red side-slit skirt with stripes! Comes with a matching two-tone bra."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/swimming_skirts.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/swimming_skirts.dmi'
	icon_state = "striped_skirt"
	item_state = "striped_skirt"
	body_parts_covered = CHEST | GROIN | LEGS
	roll_down = TRUE
	has_sensor = NO_SENSORS
	random_sensor = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | TAJARA_VARIATION | RIOL_VARIATION

/obj/item/clothing/under/dress/skirt/swimming/red_skirt
	name = "red bra and skirt"
	desc = "An eye-catching knee-length red skirt, with a golden-yellow trim. Comes with a matching two-tone bra."
	icon_state = "red_skirt"
	item_state = "red_skirt"

/obj/item/clothing/under/dress/skirt/swimming/black_skirt
	name = "black bra and skirt"
	desc = "A black side-slit skirt with a golden-yellow trim. Screams 'affluent goth'. Comes with a funky-looking matching bra."
	icon_state = "black_skirt"
	item_state = "black_skirt"

/obj/item/clothing/under/dress/skirt/swimming/jute
	name = "close brown skirt"
	desc = "A brown side-slit skirt with a yellow trim."
	icon_state = "jute"
	item_state = "jute"

/obj/item/clothing/under/dress/skirt/swimming/bikini
	name = "starlight singer bikini"
	desc = "This is bikini"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/swimming_skirts.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/swimming_skirts.dmi'
	icon_state = "bikini"
	item_state = "bikini"
	body_parts_covered = CHEST | GROIN

/obj/item/clothing/under/occult
	name = "occult collector's outfit"
	desc = "A set of clothes fit for someone dapper that isn't afraid of getting dirty."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	icon_state = "occultoutfit"
	item_state = "occultoutfit"
	supports_variations = NONE

/obj/item/clothing/under/rank/civilian/chaplain/divine_archer
	name = "divine archer's garb"
	desc = "Inner garb for divine archers."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	icon_state = "archergarb"
	item_state = "archergarb"

/obj/item/clothing/under/rank/civilian/lawyer/cel_black
	name = "lawyer black suit"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	icon_state = "lawyer_black"
	item_state = "lawyer_black"
	roll_sleeves = TRUE

/obj/item/clothing/under/rank/civilian/lawyer/cel_black/skirt
	name = "lawyer black suitskirt"
	icon_state = "lawyer_black_skirt"
	item_state = "lawyer_black_skirt"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/civilian/lawyer/cel_purpl
	name = "lawyer black suit"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	icon_state = "lawyer_purp"
	item_state = "lawyer_purp"
	roll_sleeves = TRUE

/obj/item/clothing/under/rank/civilian/lawyer/cel_purpl/skirt
	name = "lawyer purple suitskirt"
	icon_state = "lawyer_purp_skirt"
	item_state = "lawyer_purp_skirt"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/civilian/bartender/purple/alt
	name = "purple bartender's uniform"
	desc = "It looks like it has lots of flair!"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/under.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/under.dmi'
	icon_state = "purplebartender"
	item_state = "purplebartender"
