//Suits
/obj/item/clothing/suit/chaplainsuit/holidaypriest
	name = "holiday priest"
	desc = "This is a nice holiday, my son."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "holidaypriest"
	item_state = "w_suit"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/chaplainsuit/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "nun"
	item_state = "nun"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS | HANDS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/chaplainsuit/bishoprobe
	name = "bishop's robes"
	desc = "Glad to see the tithes you collected were well spent."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "bishoprobe"
	item_state = "bishoprobe"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/hooded/chaplainsuit/monkhabit
	name = "monk's habit"
	desc = "A few steps above rended sackcloth."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "monkfrock"
	item_state = "monkfrock"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	hoodtype = /obj/item/clothing/head/hooded/monkhabit

/obj/item/clothing/head/hooded/monkhabit
	name = "monk's hood"
	desc = "For when a man wants to cover up his tonsure."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	icon_state = "monkhood"
	item_state = "monkhood"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR | HIDEEARS

/obj/item/clothing/suit/chaplainsuit/monkrobeeast
	name = "eastern monk's robes"
	desc = "Best combined with a shaved head."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "monkrobeeast"
	item_state = "monkrobeeast"
	body_parts_covered = GROIN | LEGS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/chaplainsuit/whiterobe
	name = "white robe"
	desc = "Good for clerics and sleepy crewmembers."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "whiterobe"
	item_state = "whiterobe"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/chaplainsuit/clownpriest
	name = "Robes of the Honkmother"
	desc = "Meant for a clown of the cloth."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "clownpriest"
	item_state = "clownpriest"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT
	allowed = list(/obj/item/megaphone/clown,
					/obj/item/soap,
					/obj/item/reagent_containers/food/snacks/pie/cream,
					/obj/item/bikehorn,
					/obj/item/bikehorn/golden,
					/obj/item/bikehorn/airhorn,
					/obj/item/instrument/bikehorn,
					/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter,
					/obj/item/toy/crayon,
					/obj/item/toy/crayon/spraycan,
					/obj/item/toy/crayon/spraycan/lubecan,
					/obj/item/grown/bananapeel,
					/obj/item/reagent_containers/food/snacks/grown/banana)

/obj/item/clothing/suit/hooded/cloak/goliath/polar
	name = "polar cloak"
	icon_state = "polarcloak"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/goliath/polar
	desc = "A tribal hood made from a polar bears pelt. Keeps it's wearer warm and looks badass while doing it."
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS

/obj/item/clothing/head/hooded/cloakhood/goliath/polar
	name = "polar cloak"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	icon_state = "hoodie_gray"
	mob_overlay_state = "polhood"
	desc = "Wear bear on head show little man you big man, kill bear for cloak."
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = HEAD

/obj/item/clothing/suit/hooded/enginseer
	name = "enginseer regalia"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	desc = "You hold the secrets of the Machine."
	icon_state = "enginseer"
	item_state = "enginseer"
	hoodtype = /obj/item/clothing/head/hooded/enginseer
	body_parts_covered = CHEST | GROIN | LEGS | ARMS | HANDS
	flags_inv = HIDESHOES | HIDEJUMPSUIT | HIDEGLOVES
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/gun, /obj/item/melee, /obj/item/radio, /obj/item/storage/book)

/obj/item/clothing/head/hooded/enginseer
	name = "enginseer's hood"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	desc = "You are honored that they require your skills."
	icon_state = "enginseerhood"
	item_state = "enginseerhood"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR | HIDEEARS | HIDEFACE | HIDEFACIALHAIR

/obj/item/clothing/suit/hooded/flashsuit
	name = "flashy costume"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	desc = "What did you expect?"
	icon_state = "flashsuit"
	item_state = "armor"
	body_parts_covered = CHEST | GROIN
	hoodtype = /obj/item/clothing/head/hooded/flashsuit

/obj/item/clothing/head/hooded/flashsuit
	name = "flash button"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	desc = "You will learn to fear the flash."
	icon_state = "flashsuit"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR | HIDEEARS | HIDEFACIALHAIR | HIDEFACE | HIDEMASK

/// SUIT
/obj/item/clothing/suit/cyborg_suit
	name = "cyborg suit"
	desc = "Suit for a cyborg costume."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "death"
	item_state = "death"
	mob_overlay_state = "cardborg"
	flags_1 = CONDUCT_1
	fire_resist = T0C+5200
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT

/obj/item/clothing/suit/justice
	name = "justice suit"
	desc = "this pretty much looks ridiculous" //Needs no fixing
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "justice"
	item_state = "justice"
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

/obj/item/clothing/suit/hastur
	name = "\improper Hastur's robe"
	desc = "Robes not meant to be worn by man."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "hastur"
	item_state = "hastur"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT


/obj/item/clothing/suit/imperium_monk
	name = "\improper Imperium monk suit"
	desc = "Have YOU killed a xeno today?"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "imperium_monk"
	item_state = "imperium_monk"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDESHOES | HIDEJUMPSUIT
	allowed = list(/obj/item/storage/book/bible,
					/obj/item/melee/sword,
					/obj/item/reagent_containers/food/drinks/bottle/holywater,
					/obj/item/storage/fancy/candle_box,
					/obj/item/candle,
					/obj/item/tank/internals/emergency_oxygen)


/obj/item/clothing/suit/chickensuit
	name = "chicken suit"
	desc = "A suit made long ago by the ancient empire KFC."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "chickensuit"
	item_state = "chickensuit"
	body_parts_covered = CHEST | ARMS | GROIN | LEGS | FEET
	flags_inv = HIDESHOES | HIDEJUMPSUIT


/obj/item/clothing/suit/monkeysuit
	name = "monkey suit"
	desc = "A suit that looks like a primate."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "monkeysuit"
	item_state = "monkeysuit"
	body_parts_covered = CHEST | ARMS | GROIN | LEGS | FEET | HANDS
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT

/obj/item/clothing/suit/poncho
	name = "poncho"
	desc = "Your classic, non-racist poncho."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "classicponcho"
	item_state = "classicponcho"

/obj/item/clothing/suit/poncho/green
	name = "green poncho"
	desc = "Your classic, non-racist poncho. This one is green."
	icon_state = "greenponcho"
	item_state = "greenponcho"

/obj/item/clothing/suit/poncho/red
	name = "red poncho"
	desc = "Your classic, non-racist poncho. This one is red."
	icon_state = "redponcho"
	item_state = "redponcho"

/obj/item/clothing/suit/poncho/ponchoshame
	name = "poncho of shame"
	desc = "Forced to live on your shameful acting as a fake Mexican, you and your poncho have grown inseparable. Literally."
	icon_state = "ponchoshame"
	item_state = "ponchoshame"

/obj/item/clothing/suit/poncho/ponchoshame/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SHAMEBRERO_TRAIT)

/obj/item/clothing/suit/whitedress
	name = "white dress"
	desc = "A fancy white dress."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "white_dress"
	item_state = "w_suit"
	body_parts_covered = CHEST | GROIN | LEGS | FEET
	flags_inv = HIDEJUMPSUIT | HIDESHOES

/obj/item/clothing/suit/hooded/ian_costume	//It's Ian, rub his bell- oh god what happened to his inside parts?
	name = "corgi costume"
	desc = "A costume that looks like someone made a human-like corgi, it won't guarantee belly rubs."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "ian"
	item_state = "labcoat"
	body_parts_covered = CHEST | GROIN | ARMS
	//cold_protection = CHEST|GROIN|ARMS
	//min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	allowed = list()
	hoodtype = /obj/item/clothing/head/hooded/ian_hood
	dog_fashion = /datum/dog_fashion/back

/obj/item/clothing/head/hooded/ian_hood
	name = "corgi hood"
	desc = "A hood that looks just like a corgi's head, it won't guarantee dog biscuits."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	icon_state = "ian"
	body_parts_covered = HEAD
	//cold_protection = HEAD
	//min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEHAIR | HIDEEARS

/obj/item/clothing/suit/hooded/bee_costume // It's Hip!
	name = "bee costume"
	desc = "Bee the true Queen!"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "bee"
	item_state = "labcoat"
	body_parts_covered = CHEST | GROIN | ARMS
	clothing_flags = THICKMATERIAL
	hoodtype = /obj/item/clothing/head/hooded/bee_hood

/obj/item/clothing/head/hooded/bee_hood
	name = "bee hood"
	desc = "A hood attached to a bee costume."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	icon_state = "bee"
	body_parts_covered = HEAD
	clothing_flags = THICKMATERIAL
	flags_inv = HIDEHAIR | HIDEEARS

/obj/item/clothing/suit/shrine_maiden
	name = "shrine maiden's outfit"
	desc = "Makes you want to exterminate some troublesome youkai."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "shrine_maiden"
	item_state = "shrine_maiden"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/vapeshirt //wearing this is asking to get beat.
	name = "Vape Naysh shirt"
	desc = "A cheap white T-shirt with a big tacky \"VN\" on the front, Why would you wear this unironically?"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "vapeshirt"
	item_state = "vapeshirt"

/obj/item/clothing/suit/striped_sweater
	name = "striped sweater"
	desc = "Reminds you of someone, but you just can't put your finger on it..."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "waldo_shirt"
	item_state = "waldo_shirt"

/obj/item/clothing/suit/jacket/leather/overcoat
	name = "leather overcoat"
	desc = "That's a damn fine coat."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "leathercoat"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS
	cold_protection = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/suit/dracula
	name = "dracula coat"
	desc = "Looks like this belongs in a very old movie set."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "draculacoat"
	item_state = "draculacoat"

/obj/item/clothing/suit/drfreeze_coat
	name = "doctor freeze's labcoat"
	desc = "A labcoat imbued with the power of features and freezes."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "drfreeze_coat"
	item_state = "drfreeze_coat"

/obj/item/clothing/suit/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "xenos"
	item_state = "xenos_helm"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS | HANDS
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT
	allowed = list(/mob/living/simple_animal/hostile/facehugger/toy)

/obj/item/clothing/suit/nemes
	name = "pharoah tunic"
	desc = "Lavish space tomb not included."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "pharoah"
	item_state = "pharoah"
	body_parts_covered = CHEST | GROIN

/obj/item/clothing/suit/changshan_red
	name = "red changshan"
	desc = "A gorgeously embroidered silk shirt."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "changshan_red"
	item_state = "changshan_red"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/suit/changshan_blue
	name = "blue changshan"
	desc = "A gorgeously embroidered silk shirt."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "changshan_blue"
	item_state = "changshan_blue"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/suit/cheongsam_red
	name = "red cheongsam"
	desc = "A gorgeously embroidered silk dress."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "cheongsam_red"
	item_state = "cheongsam_red"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/suit/cheongsam_blue
	name = "blue cheongsam"
	desc = "A gorgeously embroidered silk dress."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "cheongsam_blue"
	item_state = "cheongsam_blue"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/suit/spookyghost
	name = "spooky ghost"
	desc = "This is obviously just a bedsheet, but maybe try it on?"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "bedsheet"
	// user_vars_to_edit = list("name" = "Spooky Ghost",
	// 						"real_name" = "Spooky Ghost" ,
	// 						"incorporeal_move" = INCORPOREAL_MOVE_BASIC,
	// 						"appearance_flags" = KEEP_TOGETHER | TILE_BOUND,
	// 						"alpha" = 150)
	alternate_worn_layer = ABOVE_BODY_FRONT_LAYER //so the bedsheet goes over everything but fire

/obj/item/clothing/suit/bronze
	name = "bronze suit"
	desc = "A big and clanky suit made of bronze that offers no protection and looks very unfashionable. Nice."
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_cuirass_old"
	armor = list("melee" = 5, "bullet" = 0, "laser" = -5, "energy" = -15, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 20)

/obj/item/clothing/suit/hooded/mysticrobe
	name = "mystic's robe"
	desc = "Wearing this makes you feel more attuned with the nature of the universe... as well as a bit more irresponsible."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "mysticrobe"
	item_state = "mysticrobe"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	allowed = list(/obj/item/spellbook, /obj/item/storage/book/bible)
	flags_inv = HIDEJUMPSUIT
	hoodtype = /obj/item/clothing/head/hooded/mysticrobe

/obj/item/clothing/head/hooded/mysticrobe
	name = "mystic's hood"
	desc = "The balance of reality tips towards order."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/head.dmi'
	icon_state = "mystichood"
	item_state = "mystichood"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR | HIDEEARS | HIDEFACIALHAIR | HIDEFACE | HIDEMASK

/// WIZARD
/obj/item/clothing/suit/wizrobe/red
	name = "red wizard robe"
	desc = "A magnificent red gem-lined robe that seems to radiate power."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "redwizard"
	item_state = "redwizrobe"

/obj/item/clothing/suit/wizrobe/yellow
	name = "yellow wizard robe"
	desc = "A magnificent yellow gem-lined robe that seems to radiate power."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "yellowwizard"
	item_state = "yellowwizrobe"

/obj/item/clothing/suit/wizrobe/black
	name = "black wizard robe"
	desc = "An unnerving black gem-lined robe that reeks of death and decay."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "blackwizard"
	item_state = "blackwizrobe"

/obj/item/clothing/suit/wizrobe/magusblue
	name = "\improper Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "magusblue"
	item_state = "magusblue"

/obj/item/clothing/suit/wizrobe/magusred
	name = "\improper Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "magusred"
	item_state = "magusred"

/obj/item/clothing/suit/wizrobe/fake
	name = "wizard robe"
	desc = "A rather dull blue robe meant to mimic real wizard robes."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "wizard-fake"
	item_state = "wizrobe"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = FLAMMABLE

/obj/item/clothing/suit/bunnysuit
	name = "Easter Bunny Suit"
	desc = "Hop Hop Hop!"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "bunnysuit"
	item_state = "bunnysuit"
	slowdown = -1
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT













