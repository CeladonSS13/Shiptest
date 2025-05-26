/obj/item/clothing/shoes/footwraps
	name = "cloth footwraps"
	desc = "A roll of treated cloth used for wrapping clawed feet."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/miscellaneous.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/miscellaneous.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_miscellaneous.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_miscellaneous.dmi'
	icon_state = "clothwrap"
	item_state = "clothwrap"

/obj/item/clothing/shoes/footwraps/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		ADD_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)

/obj/item/clothing/shoes/footwraps/dropped(mob/living/carbon/human/user)
	REMOVE_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)
	return ..()

/obj/item/clothing/shoes/footwraps/black
	name = "cloth black footwraps"
	icon_state = "clothwrap_black"
	item_state = "clothwrap_black"

/obj/item/clothing/shoes/footwraps/brown
	name = "cloth brown footwraps"
	icon_state = "clothwrap_brown"
	item_state = "clothwrap_brown"

/obj/item/clothing/shoes/heels
	name = "high heels"
	desc = "A pair of high-heeled shoes. Fancy!"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/miscellaneous.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/miscellaneous.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_miscellaneous.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_miscellaneous.dmi'
	icon_state = "heels"
	item_state = "heels"
	slowdown = 0
	force = 2

/obj/item/clothing/shoes/heels/red
	name = "high red heels"
	desc = "A pair red of high-heeled shoes. Fancy!"
	icon_state = "heels_red"
	item_state = "heels_red"

/obj/item/clothing/shoes/heels/black
	name = "high black heels"
	desc = "A pair black of high-heeled shoes. Fancy!"
	icon_state = "heels_black"
	item_state = "heels_black"

/obj/item/clothing/shoes/galoshes/tajara_galoshes
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/miscellaneous.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/miscellaneous.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_miscellaneous.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_miscellaneous.dmi'
	icon_state = "galoshes"
	item_state = "galoshes"

/obj/item/clothing/shoes/swimmingfins
	desc = "Help you swim good."
	name = "swimming fins"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/miscellaneous.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/miscellaneous.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_miscellaneous.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_miscellaneous.dmi'
	icon_state = "flippers"
	item_state = "flippers"
	slowdown = 1


/obj/item/clothing/shoes/slippers
	name = "bunny slippers"
	desc = "Fluffy!"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/slippers.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/slippers.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_slippers.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_slippers.dmi'
	icon_state = "slippers"
	item_state = "slippers"
	force = 0
	cold_protection = FEET

/obj/item/clothing/shoes/slippers/worn
	name = "worn bunny slippers"
	desc = "Fluffy..."
	icon_state = "slippers_worn"
	item_state = "slippers_worn"

/obj/item/clothing/shoes/slippers/carp
	name = "carp slippers"
	desc = "Slippers made to look like baby carp, but on your feet! Squeeeeeee!!"
	item_state = "carpslippers"
	icon_state = "carpslippers"


/obj/item/clothing/shoes/sandals
	desc = "A pair of rather plain wooden sandals."
	name = "sandals"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/sandals.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/sandals.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/left_sandals.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/feet/in_hands/right_sandals.dmi'
	icon_state = "sandals"
	item_state = "sandals"
	body_parts_covered = FALSE

/obj/item/clothing/shoes/sandals/geta
	name = "geta"
	desc = "A pair of rather plain Konyang-styled wooden sandals."
	icon_state = "geta"
	item_state = "geta"

/obj/item/clothing/shoes/sandals/flipflop
	name = "flip flops"
	desc = "A pair of foam flip flops. For those not afraid to show a little ankle."
	icon_state = "thongsandal"
	item_state = "thongsandal"

/obj/item/clothing/shoes/sandals/clogs
	name = "rubber clogs"
	desc = "A favorite of barbecue loving fathers, beachgoers, and people with no fashion sense. Don't wear these with socks."
	icon_state = "clogs"
	item_state = "clogs"

/obj/item/clothing/shoes/sandals/caligae
	name = "caligae"
	desc = "The standard Unathi marching footwear. Made of leather and rubber, with heavy hob-nailed soles, their unique design allows for improved traction and protection, leading to them catching on with other species."
	icon_state = "caligae"
	item_state = "caligae"
	force = 11
	siemens_coefficient = 0.75
	body_parts_covered = FEET | LEGS

/obj/item/clothing/shoes/magboots/clown
	name = "clown shoes"
	desc = "The prankster's standard-issue clowning shoes. Damn they're huge! There's a red light on the side."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/feet/overlay/feet.dmi'
	icon_state = "clown_prototype0"
	magboot_state = "clown_prototype"
	slowdown_active = SHOES_SLOWDOWN + 1
