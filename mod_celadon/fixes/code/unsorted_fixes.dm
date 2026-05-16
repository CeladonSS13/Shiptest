// [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT
GLOBAL_LIST_INIT(clown_names, world.file2list("mod_celadon/return_content_clowns/code/strings/clown.txt"))
GLOBAL_LIST_INIT(mime_names, world.file2list("mod_celadon/return_content_clowns/code/strings/mime.txt"))
// [/CELADON-ADD]

// [CELADON-ADD] - List of pods
GLOBAL_LIST_EMPTY(poi_list)
// [/CELADON-ADD] - List of pods

/random_features()
	var/list/features = ..()
	if(!GLOB.ipc_hair_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/ipc_hair, GLOB.ipc_hair_list)
	if(!GLOB.tajara_chest_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_chest_markings, GLOB.tajara_chest_markings_list)
	if(!GLOB.tajara_body_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_body_markings, GLOB.tajara_body_markings_list)
	if(!GLOB.tajara_facial_hairs_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_facial_hairs, GLOB.tajara_facial_hairs_list)
	if(!GLOB.tajara_nose_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_nose_markings, GLOB.tajara_nose_markings_list)
	if(!GLOB.tajara_ears_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_ears_markings, GLOB.tajara_ears_markings_list)
	if(!GLOB.tajara_head_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_head_markings, GLOB.tajara_head_markings_list)
	if(!GLOB.tajara_tail_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/tajara, GLOB.tajara_tail_list)
	if(!GLOB.tajara_animated_tail_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tails_animated/tajara, GLOB.tajara_animated_tail_list)
	if(!GLOB.tajara_hairs_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_hairs, GLOB.tajara_hairs_list)
	if(!GLOB.tajara_ears_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tajara_ears, GLOB.tajara_ears_list)
	if(!GLOB.riol_chest_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_chest_markings, GLOB.riol_chest_markings_list)
	if(!GLOB.riol_body_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_body_markings, GLOB.riol_body_markings_list)
	if(!GLOB.riol_facial_hairs_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_facial_hairs, GLOB.riol_facial_hairs_list)
	if(!GLOB.riol_nose_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_nose_markings, GLOB.riol_nose_markings_list)
	if(!GLOB.riol_ears_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_ears_markings, GLOB.riol_ears_markings_list)
	if(!GLOB.riol_head_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_head_markings, GLOB.riol_head_markings_list)
	if(!GLOB.riol_tail_markings_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_tail_markings, GLOB.riol_tail_markings_list)
	if(!GLOB.riol_legs_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_legs, GLOB.riol_legs_list)
	if(!GLOB.riol_tail_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/riol, GLOB.riol_tail_list)
	if(!GLOB.riol_animated_tail_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tails_animated/riol, GLOB.riol_animated_tail_list)
	if(!GLOB.riol_hairs_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_hairs, GLOB.riol_hairs_list)
	if(!GLOB.riol_ears_list.len)
		init_sprite_accessory_subtypes(/datum/sprite_accessory/riol_ears, GLOB.riol_ears_list)

	var/list/other_features = list(
		"ipc_hair" = pick(GLOB.ipc_hair_list),
		"mcolor" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"mcolor2" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_ears_markings_color" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_head_markings_color" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_nose_markings_color" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_chest_markings_color" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_body_markings_color" = pick("FFFFFF","7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_ears_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_head_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_nose_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_chest_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_body_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"riol_tail_markings_color" = 	pick("FFFFFF", "7F7F7F", "7BBB7B", "7B7BBB", "BB7B7B", "7BBBBB", "BB7BBB", "BBBB7B"),
		"tajara_ears" = pick(GLOB.tajara_ears_list),
		"tajara_hairs" = pick(GLOB.tajara_hairs_list),
		"tajara_ears_markings" = pick(GLOB.tajara_ears_markings_list),
		"tajara_head_markings" = pick(GLOB.tajara_head_markings_list),
		"tajara_facial_hairs" = pick(GLOB.tajara_facial_hairs_list),
		"tajara_nose_markings" = pick(GLOB.tajara_nose_markings_list),
		"tajara_chest_markings" = pick(GLOB.tajara_chest_markings_list),
		"tajara_body_markings" = pick(GLOB.tajara_body_markings_list),
		"tajara_tail" = pick(GLOB.tajara_tail_list),
		"riol_ears" = pick(GLOB.riol_ears_list),
		"riol_hairs" = pick(GLOB.riol_hairs_list),
		"riol_ears_markings" = pick(GLOB.riol_ears_markings_list),
		"riol_head_markings" = pick(GLOB.riol_head_markings_list),
		"riol_facial_hairs" = pick(GLOB.riol_facial_hairs_list),
		"riol_nose_markings" = pick(GLOB.riol_nose_markings_list),
		"riol_chest_markings" = pick(GLOB.riol_chest_markings_list),
		"riol_body_markings" = pick(GLOB.riol_body_markings_list),
		"riol_tail_markings" = pick(GLOB.riol_tail_markings_list),
		"riol_tail" = pick(GLOB.riol_tail_list),
		"riol_legs" = pick(GLOB.riol_legs_list),
	)

	for(var/key in other_features)
		features[key] = other_features[key]
	return features

/atom/movable/screen/parallax_layer/layer_1/Initialize(mapload)
	. = ..()
	icon_state = "layer1_[rand(0, 16)]"

/atom/movable/screen/parallax_layer/layer_2/Initialize(mapload)
	. = ..()
	icon_state = "layer2_[rand(1, 5)]"

/atom/movable/screen/parallax_layer/layer_3/Initialize(mapload)
	. = ..()
	icon_state = "layer3_[rand(1, 2)]"

/datum/config_entry/flag/auto_ship_spawn_locking
	config_entry_value = FALSE

/area/play_ambience(mob/M, sound/override_sound, volume = 27)
	if(iscarbon(M))
		var/mob/living/carbon/carbon_mob = M
		if(!carbon_mob.getorganslot(ORGAN_SLOT_EARS))
			// No ears, no ambience
			var/sound_file = override_sound ? override_sound.file : pick(ambientsounds)
			var/sound_length = ceil(SSsound_cache.get_sound_length(sound_file))
			return rand(min_ambience_cooldown + sound_length, max_ambience_cooldown + sound_length)
	return ..()

/datum/controller/subsystem/economy
	var/budget_pool = 35000
	var/list/department_accounts = list(
	ACCOUNT_FAC = ACCOUNT_FAC_NAME,
	ACCOUNT_SYN = ACCOUNT_SYN_NAME,
	ACCOUNT_INT = ACCOUNT_INT_NAME,
	ACCOUNT_SLF = ACCOUNT_SLF_NAME,
	ACCOUNT_NTN = ACCOUNT_NTN_NAME,
	ACCOUNT_IND = ACCOUNT_IND_NAME,
	ACCOUNT_IND_1 = ACCOUNT_IND_1_NAME,
	ACCOUNT_IND_2 = ACCOUNT_IND_2_NAME,
	ACCOUNT_IND_3 = ACCOUNT_IND_3_NAME,
	ACCOUNT_IND_4 = ACCOUNT_IND_4_NAME,
	)
	var/list/departmental_accounts = list()

/datum/bank_account/department
	account_holder = "Guild Credit Agency"
	var/department_id = "REPLACE_ME"

/datum/bank_account/department/New(dep_id, budget, player_account = FALSE)
	department_id = dep_id
	account_balance = budget
	account_holder = SSeconomy.department_accounts[dep_id]
	SSeconomy.departmental_accounts += src

/datum/controller/subsystem/economy/proc/get_dep_account(dep_id)
	for(var/datum/bank_account/department/D in departmental_accounts)
		if(D.department_id == dep_id)
			return D

/datum/controller/subsystem/economy/Initialize()
	for(var/dep_id in department_accounts)
		new /datum/bank_account/department(dep_id, 0, player_account = FALSE)
	return 2

/datum/controller/subsystem/mobs
	wait = 1.5 SECONDS // [CELADON-EDIT] - CELADON_BALANCE_MOBS

/datum/controller/subsystem/processing/radiation
	flags = SS_BACKGROUND // [CELADON-EDIT] - CELADON_FIXES_RADIATION

/datum/action/item_action/toggle_ammotype
	icon_icon = 'mod_celadon/_storage_icons/icons/actions/actions_items.dmi' // [CELADON-EDIT] - возвращает иконки лазеров в переключатель

/datum
	/// [CELADONE-ADD]
	/// russian case forms of atom name in format
	/// list(NOMINATIVE_CASE, GENITIVE_CASE, DATIVE_CASE, ACCUSATIVE_CASE, ABLATIVE_CASE, PREPOSITIONAL_CASE)
	/// for usage with CASE macros (code/__DEFINES/~mod_celadon/_translation.dm)
	var/list/cases

/datum/emote
	var/message_mime = "" //Message displayed if the user is a mime	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
	// [CELADON-ADD] - CELADON_EMOTES
	/// Message with %t at the end to allow adding params to the message, like for mobs doing an emote relatively to something else.
	/// Set this to EMOTE_PARAM_USE_POSTFIX to just use the postfix.
	/// Message postfix with %t used when we don't want to use message_param for our targeting. Used for things like message_monkey or message_mime.
	/// Punctuation from the message will be stripped when this is applied, so make sure it's punctuated as well.
	var/message_postfix = ""
	/// Sounds emitted when the user is muzzled. Generally used like "[user] makes a pick(muzzled_noises) noise!"
	var/muzzled_noises = list("сильный", "слабый")
	/// If true, an emote will completely bypass any cooldown when called unintentionally. Necessary for things like deathgasp.
	var/bypass_unintentional_cooldown = FALSE
	/// Whether or not to adjust the frequency of the emote sound based on age.
	var/age_based = FALSE
	/// How loud is the audio emote?
	var/volume = 50
	// [/CELADON-ADD]

/datum/mind
	var/miming = FALSE // Mime's vow of silence	// [CELADON-EDIT] - RETURN_CONTENT - CLOWN_RETURN_CONTENT

/datum/map_template/shuttle
	token_icon_state = "ship" // [CELADON-EDIT] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца

// [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT
/datum/award/achievement/misc/round_and_full
	name = "Round and Full"
	desc = "Well at least you aren't down the river, I hear they eat people there."
	database_id = MEDAL_CLOWNCARKING
	icon = "clownking"

/datum/award/achievement/misc/the_best_driver
	name = "The Best Driver"
	desc = "100 honks later"
	database_id = MEDAL_THANKSALOT
	icon = "clownthanks"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_STRUCTURES - Барикады
/// Assosciative list of type -> armor. Used to ensure we always hold a reference to default armor datums
GLOBAL_LIST_INIT(armor_by_type, generate_armor_type_cache())

/proc/generate_armor_type_cache()
	var/list/armor_cache = list()
	for(var/datum/armor/armor_type as anything in subtypesof(/datum/armor))
		armor_type = new armor_type
		armor_cache[armor_type.type] = armor_type
		armor_type.GenerateTag()
	return armor_cache

/datum/armor/proc/GenerateTag()
	// ..()
	tag = replacetext("[type]", "/", "-")
// [/CELADON-ADD]

/datum/armor/getRating(rating)
	if(!(rating in ARMOR_LIST_ALL()))
		CRASH("Attempted to get a rating '[rating]' that doesnt exist")
	return ..()

// [CELADON-ADD] - CELADON_STRUCTURES - Барикады
/// Generate a brand new armor datum with the modifiers given, if ARMOR_ALL is specified only that modifier is used
/datum/armor/proc/generate_new_with_modifiers(list/modifiers)
	var/datum/armor/new_armor = new

	var/all_keys = ARMOR_LIST_ALL()
	if(ARMOR_ALL in modifiers)
		var/modifier_all = modifiers[ARMOR_ALL]
		if(!modifier_all)
			return src
		for(var/mod in all_keys)
			new_armor.vars[mod] = vars[mod] + modifier_all
		return new_armor

	for(var/modifier in modifiers)
		if(modifier in all_keys)
			new_armor.vars[modifier] = vars[modifier] + modifiers[modifier]
		else
			stack_trace("Attempt to call generate_new_with_modifiers with illegal modifier '[modifier]'! Ignoring it")
	return new_armor

/// Generate a brand new armor datum with the values given, if a value is not present it carries over
/datum/armor/proc/generate_new_with_specific(list/values)
	var/datum/armor/new_armor = new

	var/all_keys = ARMOR_LIST_ALL()
	if(ARMOR_ALL in values)
		var/value_all = values[ARMOR_ALL]
		if(!value_all)
			return src
		for(var/mod in all_keys)
			new_armor.vars[mod] = value_all
		return new_armor

	for(var/armor_rating in all_keys)
		if(armor_rating in values)
			new_armor.vars[armor_rating] = values[armor_rating]
		else
			new_armor.vars[armor_rating] = vars[armor_rating]
	return new_armor
// [/CELADON-ADD]

/datum/brain_trauma/mild/phobia/clowns
	phobia_type = "clowns"
	random_gain = FALSE

/datum/component/wet_floor/process(seconds_per_tick)
	//[CELADON-ADD] - CELADON_FIXES - вобщем эта залупа рантаймит потому-что почему-то компонент нахуй попадает на /turf/closed который НЕ ДОЛЖЕН ТАМ БЫТЬ
	if(!isopenturf(parent))
		STOP_PROCESSING(SSwet_floors, src)
		var/turf/T = parent
		T.cut_overlay(current_overlay)
		qdel(T.GetComponent(/datum/component/slippery))
	//[/CELADON-ADD]
	return ..()

// [CELADON-ADD] - TRIBAL-CRAFT
/datum/crafting_recipe/drakecloak
	name = "Ash Drake Armour"
	result = /obj/item/clothing/suit/hooded/cloak/drake
	time = 60
	reqs = list(/obj/item/stack/sheet/bone = 10,
				/obj/item/stack/sheet/sinew = 2,
				/obj/item/stack/sheet/animalhide/ashdrake = 5)
	category = CAT_CLOTHING

/datum/crafting_recipe/polarbearcloak
	name = "Polar Cloak"
	result = /obj/item/clothing/suit/hooded/cloak/goliath/polar
	time = 50
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/sinew = 2,
				/obj/item/stack/sheet/animalhide/goliath_hide/polar_bear_hide = 2)
	blacklist = list(/obj/item/stack/sheet/animalhide/goliath_hide)
	category = CAT_CLOTHING
// [/CELADON-ADD]

// [CELADON-ADD] - TRIBAL-CRAFT
/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/melee/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/melee/spear = 1)
	blacklist = list(/obj/item/melee/spear/explosive, /obj/item/melee/spear/bone)
	result = /obj/structure/headpike
	category = CAT_MISC

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/melee/spear/bone = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/melee/spear/bone = 1)
	result = /obj/structure/headpike/bone
	category = CAT_MISC
// [/CELADON-ADD]

/datum/crafting_recipe/bonespear
	always_availible = TRUE // [CELADON-REMOVE] - TRIBAL-CRAFT

/datum/crafting_recipe/boneaxe
	always_availible = TRUE // [CELADON-REMOVE] - TRIBAL-CRAFT

// [CELADON-ADD] - TRIBAL-CRAFT
/datum/crafting_recipe/bonesword
	name = "Bone Sword"
	result = /obj/item/melee/sword/bone
	time = 40
	reqs = list(/obj/item/stack/sheet/bone = 3,
				/obj/item/stack/sheet/sinew = 2)
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/watcherbola
	name = "Watcher Bola"
	result = /obj/item/restraints/legcuffs/bola/watcher
	time = 30
	reqs = list(/obj/item/stack/sheet/animalhide/goliath_hide = 2,
				/obj/item/restraints/handcuffs/cable/sinew = 1)
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/crystalamulet
	name = "Crystal Amulet"
	always_availible = FALSE
	result = /obj/item/clothing/neck/crystal_amulet
	time = 4 SECONDS
	reqs = list(/obj/item/strange_crystal = 3)
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
// [/CELADON-ADD]

/datum/component/storage/concrete/pockets/holster/Initialize()
	. = ..()
	can_hold |= typecacheof(/obj/item/gun/energy/e_gun/e_old)

/datum/component/storage/concrete/pockets/holster/nukie/Initialize()
	. = ..()
	can_hold |= typecacheof(/obj/item/gun/energy/e_gun/e_old/mini)

/client/toggle_fullscreen()
	set category = "Special Verbs" // [CELADON-EDIT] - CELADON_QOL - Очистка вкладки ООС, перенос части в Special Verbs

// [CELADON-ADD] - CELADON_GRAVGEN
/datum/looping_sound/gravity_generator
	mid_sounds = list('mod_celadon/_storage_sounds/sound/effects/beam.ogg')
	mid_length = 40
	volume = 10
	falloff_distance = 3
// [/CELADON-ADD]

/obj/item/mine/pressure/explosive/rusty/live/snow
	icon = 'mod_celadon/_storage_icons/icons/items/misc/landmine.dmi'

/proc/spawn_meteors_alt(number = 10, list/meteortypes, vlevel, port, dirc)
	for(var/i in 1 to number)
		spawn_meteor(meteortypes, vlevel, 0, port, dirc)

/obj/item/autolathe_crafted(obj/machinery/autolathe/lathe)
	// [CELADON_EDIT] — PRINTED_ITEMS_SELLING_VITO
	autolathe_printed = TRUE
	var/list/allcontents = GetAllContents()
	for(var/obj/item/I in allcontents)
		I.autolathe_printed = TRUE
	// [/CELADON_EDIT]

/obj/machinery/turretid
	icon = 'mod_celadon/_storage_icons/icons/machinery/turret_control.dmi'

/obj/item/wallframe/turret_control
	icon = 'mod_celadon/_storage_icons/icons/machinery/turret_control.dmi'

/obj/machinery/porta_turret/ship/ramzi
	faction = list(FACTION_RAMZI_RENEGADE, FACTION_TURRET)	// [CELADON-ADD] - RAMZI-RENEGATE

/obj/machinery/power/ship_gravity
	light_power = 0
	light_range = 2
	light_color = COLOR_GRAY
	luminosity = 1
	var/datum/looping_sound/gravity_generator/soundloop	// [CELADON-ADD] - CELADON_GRAVGEN

/obj/machinery/power/ship_gravity/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)

/obj/machinery/power/ship_gravity/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/machinery/power/ship_gravity/emp_act(severity)
	. = ..()
	if(prob(50))
		set_state(!active)

/obj/machinery/power/shuttle/engine/electric
	thrust = 4 // [CELADON-EDIT] - CELADON_BALANCE - Трогаем движки

/obj/machinery/atmospherics/components/unary/shuttle
	icon = 'mod_celadon/_storage_icons/icons/structures/shuttle.dmi' // [CELADON-EDIT] - CELADON_BALANCE

/obj/machinery/power/compressor/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
	// [CELADON-ADD] - CELADON_INTEQ_VENDOR  - добавляем поддержку к мультитулу
		. += span_notice("The compressor ID is '<b>[comp_id]</b>'.")
		. += span_notice("It looks like you can modify the id settings by using a <b>multitool</b> on it.")
	// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_INTEQ_VENDOR - добавляем поддержку мультитула
//MARK: Multitool actions

/obj/machinery/power/compressor/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	var/obj/item/multitool/M = I
	var/list/choice_list = list("Modify the compressor ID", "Save the Compressor connection to the multitool buffer")
	var/choice = tgui_input_list(user, "Select an option", "Advanced Configuration", choice_list)

	switch(choice)
		if("Modify the compressor ID")
			comp_id = stripped_input(user, "Set a compressor ID for this compressor. Ensure that it is no bigger than 32 characters long.", "Componcompressorent ID Setup", max_length = 32)
			to_chat(user, span_notice("You set [src] compressor ID to '[comp_id]'."))

		if("Save the Compressor connection to the multitool buffer")
			M.buffer = src
			to_chat(user, span_notice("You add [src] connection to the multitool's buffer."))

	return TRUE
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_INTEQ_VENDOR - добавляем поддержку мультитула
//MARK: Multitool actions
/obj/machinery/computer/turbine_computer/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The computer's compressor ID is '<b>[id]</b>'.")
		. += span_notice("It looks like you can modify the id settings by using a <b>multitool</b> on it.")

/obj/machinery/computer/turbine_computer/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	var/obj/item/multitool/M = I
	var/list/choice_list = list("Modify the compressor ID of a computer", "Load the Compressor connection to the console")
	var/choice = tgui_input_list(user, "Select an option", "Advanced Configuration", choice_list)

	switch(choice)
		if("Modify the compressor ID of a computer")
			id = stripped_input(user, "Set a ID for this computer. Ensure that it is no bigger than 32 characters long.", "Computer ID Setup", max_length = 32)
			to_chat(user, span_notice("You set [src] ID to '[id]'."))

		if("Load the Compressor connection to the console")
			if(istype(M.buffer,/obj/machinery/power/compressor))
				compressor = M.buffer
				id = compressor.comp_id
				to_chat(user, span_notice("You connect [compressor] to [src]."))
			else
				to_chat(user, span_notice("The ID from he [M] is not from the compressor."))
	return TRUE
// [/CELADON-ADD]

/obj/item/clothing/suit/space/hardsuit/ert/lp/sec
	// [CELADON-EDIT] - CELADON_BALANCE
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 40, "acid" = 40, "wound" = 30)

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/sec
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20,"energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 40, "acid" = 40, "wound" = 30)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/space/hardsuit/ert/lp/engi
	armor = list("melee" = 30, "bullet" = 20, "laser" = 30, "energy" = 30, "bomb" = 25, "bio" = 100, "rad" = 75, "fire" = 90, "acid" = 75, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/engi
	armor = list("melee" = 38, "bullet" = 20, "laser" = 30, "energy" = 30, "bomb" = 25, "bio" = 100, "rad" = 75, "fire" = 90, "acid" = 75, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/space/hardsuit/ert/lp/med
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/med
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/head/helmet/space/hardsuit/lp
	armor = list("melee" = 5, "bullet" = 5, "laser" = 1, "energy" = 1, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75, "wound" = 10)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/space/hardsuit/ancient/lp
	armor = list("melee" = 5, "bullet" = 5, "laser" = 1, "energy" = 1, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75, "wound" = 10)  // [CELADON-EDIT] - CELADON_BALANCE

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
/obj/item/circuitboard/mecha/honker/peripherals
	name = "H.O.N.K Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/targeting
	name = "H.O.N.K Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/main
	name = "H.O.N.K Central Control module (Exosuit Board)"
	icon_state = "mainboard"
// [/CELADON-ADD]

/obj/mecha/handle_unique_action(mob/user)
	mech_unique_action?.Activate() // [CELADON-EDIT] - FIX_MECH

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching
	// [CELADON-ADD] - CELADON_FIXES - MECH_WEAPON -Добавлена переменная projectiles для корректной работы перезарядки
	projectiles = 6

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang
	// [CELADON-ADD] - CELADON_FIXES - MECH_WEAPON -Добавлена переменная projectiles для корректной работы перезарядки
	projectiles = 6

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/clusterbang
	// [CELADON-ADD] - CELADON_FIXES - MECH_WEAPON -Добавлена переменная projectiles для корректной работы перезарядки
	projectiles = 3

/obj/item
	// [CELADON-ADD] - CELADON_RESPRITE
	// Добавляет переменную, которая добавляет вариацию предметов для морды сарати
	var/snout_override_icon
	// [CELADON-ADD]
	// [CELADON_EDIT] — PRINTED_ITEMS_SELLING_VITO
	///Is item printed on any lathe. Sets TRUE in autolathe_crafted()
	var/autolathe_printed = FALSE
	// [/CELADON_EDIT]

/obj/effect/spawner/random/randomthreat/Initialize(mapload)
	// [CELADON-ADD] - FIXES_SPAWNERS_ON_SPACE - Проверка на космотурф
	if(isspaceturf(get_turf(src)))
		return INITIALIZE_HINT_QDEL
	// [/CELADON-ADD]
	return ..()

/obj/effect/spawner/random/food_or_drink/seed/Initialize(mapload)
	loot |= list(
		/obj/item/seeds/tea/mint, // [CELADON-ADD] - DRINKS_AND_FOOD
	)
	return ..()

/obj/item/cardboard_cutout/Initialize() // CELADON_RETURN_CONTENT_CLOWNS
	. = ..()
	var/list/appearances = list(
		"Clown" = image(icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi', icon_state = "cutout_clown"),
		"Mime" = image(icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi', icon_state = "cutout_mime"),
	)
	for(var/key in appearances)
		possible_appearances[key] = appearances[key]
	sortList(possible_appearances)

/obj/item/card/id/syndicate/update_label()
	name = "[forged ? "access card" : initial(name)][(!assignment) ? "" : " ([assignment])"]"

//[CELADON-EDIT] - FIXES_AGENT_CARD
/obj/item/card/id/syndicate/afterattack(obj/item/O, mob/living/carbon/user, proximity) // mob/user -> mob/living/carbon/user
	if(!proximity)
		return
	if(istype(O, /obj/item/card/id))
		if(isliving(user) && user.mind)
			if(!fingerprint || fingerprint == user.dna.uni_identity || anyone) //if(user.mind.special_role || anyone)
				var/obj/item/card/id/I = O
				src.access |= I.access
				for(var/datum/overmap/ship/controlled/ship in I.ship_access)
					if(!has_ship_access(ship))
						add_ship_access(ship)
				to_chat(usr, span_notice("The card's microscanners activate as you pass it over the ID, copying its access."))
// [/CELADON-EDIT]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/card/id/ert/clown
	icon_state = "ert_clown"

/obj/item/card/id/ert/clown/Initialize()
	access = get_all_accesses()
	return ..()
// [/CELADON-ADD]

/obj/item/card/id/debug/Initialize()
	. = ..()
	access |= get_all_accesses_outpost() | get_faction_access_outpost()

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/bikehorn/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(user != M && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(HAS_TRAIT(H, TRAIT_CLUMSY)) //only clowns can unlock its true powers
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "honk", /datum/mood_event/honk)
	return ..()
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
//golden bikehorn
/obj/item/bikehorn/golden
	name = "golden bike horn"
	desc = "Golden? Clearly, it's made with bananium! Honk!"
	icon_state = "gold_horn"
	item_state = "gold_horn"
	var/flip_cooldown = 0

/obj/item/bikehorn/golden/attack()
	if(flip_cooldown < world.time)
		flip_mobs()
	return ..()

/obj/item/bikehorn/golden/attack_self(mob/user)
	if(flip_cooldown < world.time)
		flip_mobs()
	..()

/obj/item/bikehorn/golden/proc/flip_mobs(mob/living/carbon/M, mob/user)
	var/turf/T = get_turf(src)
	for(M in ohearers(7, T))
		if(ishuman(M) && M.can_hear())
			var/mob/living/carbon/human/H = M
			if(istype(H.ears, /obj/item/clothing/ears/earmuffs))
				continue
		M.emote("flip")
	flip_cooldown = world.time + 7
//canned laughter
/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter
	name = "Canned Laughter"
	desc = "Just looking at this makes you want to giggle."
	icon_state = "laughter"
	list_reagents = list(/datum/reagent/consumable/laughter = 50)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/toy/crayon/mime
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/crayons.dmi'
	icon_state = "crayonmime"
	desc = "A very sad-looking crayon."
	paint_color = "#FFFFFF"
	crayon_color = "mime"
	reagent_contents = list(/datum/reagent/consumable/nutriment = 0.5, /datum/reagent/colorful_reagent/powder/invisible = 1.5)
	charges = -1
	dye_color = DYE_MIME
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/toy/crayon/spraycan/lubecan
	name = "slippery spraycan"
	desc = "You can barely keep hold of this thing."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/crayons.dmi'
	icon_state = "clowncan2_cap"
	icon_capped = "clowncan2_cap"
	icon_uncapped = "clowncan2"
	use_overlays = FALSE

	reagent_contents = list(/datum/reagent/lube = 1, /datum/reagent/consumable/banana = 1)
	volume_multiplier = 5

/obj/item/toy/crayon/spraycan/lubecan/isValidSurface(surface)
	return istype(surface, /turf/open/floor)

/obj/item/toy/crayon/spraycan/mimecan
	name = "silent spraycan"
	desc = "Art is best seen, not heard."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/crayons.dmi'
	icon_state = "mimecan_cap"
	icon_capped = "mimecan_cap"
	icon_uncapped = "mimecan"
	use_overlays = FALSE

	can_change_colour = FALSE
	paint_color = "#FFFFFF" //RGB

	pre_noise = FALSE
	post_noise = FALSE
	reagent_contents = list(/datum/reagent/consumable/nothing = 1, /datum/reagent/toxin/mutetoxin = 1)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/dnainjector/clumsymut
	name = "\improper DNA injector (Clumsy)"
	desc = "Makes clown minions."
	add_mutations = list(CLOWNMUT)

/obj/item/dnainjector/anticlumsy
	name = "\improper DNA injector (Anti-Clumsy)"
	desc = "Apply this for Security Clown."
	remove_mutations = list(CLOWNMUT)
// [/CELADON-ADD]S

/obj/item/book/granter/crafting_recipe/cooking_sweets_101/Initialize(mapload) // [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	crafting_recipe_types |= list(
		/datum/crafting_recipe/food/mimetart,
	)
	return ..()

/obj/item/storage/box/hero/ghostbuster/PopulateContents()
	. = ..()
	new /obj/item/clothing/glasses/welding/ghostbuster(src)

/obj/item/shield
// [CELADON-ADD] - Флаг на включение сломаных щитов из модов - BALLISTIC_SHIELD - Extended Edition
	var/spread_bonus = 0
	var/breaking_sound = 'sound/effects/glassbr3.ogg'
	var/breaking_alert = "cracks!"
// [/CELADON-ADD]

// [CELADON-ADD] - BALLISTIC_SHIELD - Rebalance
/obj/item/shield/proc/defense_check(turf/aloc, turf/bloc, mobdir)
	var/dx = aloc.x - bloc.x
	var/dy = aloc.y - bloc.y
	switch(mobdir)
		if(NORTH)
			if(abs(dx) <= dy * 2)
				return FALSE
		if(SOUTH)
			if(abs(dx) <= dy * -2)
				return FALSE
		if(EAST)
			if(abs(dy) <= dx * 2)
				return FALSE
		if(WEST)
			if(abs(dy) <= dx * -2)
				return FALSE
	return TRUE
// [/CELADON-ADD]

/obj/item/shield/heavy
	// [CELADON-ADD] - BALLISTIC_SHIELD - Extended Edition + Rebalance
	spread_bonus = -3
	// [/CELADON-ADD]

#define SPECIAL_ATTACK_OTHER 4

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/toy/prize/honk
	name = "toy H.O.N.K."
	desc = "6/14"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/toy.dmi'
	icon_state = "honktoy"
	max_combat_health = 4 //140 integrity
	special_attack_type = SPECIAL_ATTACK_OTHER
	special_attack_type_message = "puts the opposing mech's special move on cooldown and heals this mech."
	special_attack_cry = "MEGA HORN"

/obj/item/toy/prize/honk/super_special_attack(obj/item/toy/prize/victim)
	playsound(src, 'sound/machines/honkbot_evil_laugh.ogg', 20, TRUE)
	victim.special_attack_cooldown += 3 //Adds cooldown to the other mech and gives a minor self heal
	combat_health++
// [/CELADON-ADD]

#undef SPECIAL_ATTACK_OTHER

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/toy/figure/clown
	name = "Clown action figure"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/toy.dmi'
	icon_state = "clown"
	toysay = "Honk!"
	toysound = 'sound/items/bikehorn.ogg'
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/toy/figure/mime
	name = "Mime action figure"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/toy.dmi'
	icon_state = "mime"
	toysay = "..."
	toysound = null
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/megaphone/clown
	name = "clown's megaphone"
	desc = "Something that should not exist."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/device.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/megaphone_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/megaphone_righthand.dmi'
	icon_state = "megaphone-clown"
	item_state = "megaphone-clown"
	voicespan = list(SPAN_CLOWN)
// [/CELADON-ADD]

/obj/item/cartridge/captain
	access = parent_type::access & ~(CART_REMOTE_DOOR | CART_NEWSCASTER) // [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/pda/ai/attack_self(mob/user)
	if ((honkamt > 0) && (prob(60)))//For clown virus.
		honkamt--
		playsound(loc, 'sound/items/bikehorn.ogg', 30, TRUE)
	return
// [/CELADON-ADD]

// [CELADON-ADD] - scientist-PDA
/obj/item/pda/scientist
	name = "scientist PDA"
	default_cartridge = /obj/item/cartridge/chemistry
	icon_state = "pda-science"
// [/CELADON-ADD]

/obj/item/pda
// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	var/honkamt = 0 //How many honks left when infected with honk.exe
	var/mimeamt = 0 //How many silence left when infected with mime.exe
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/cartridge/virus/clown
	name = "\improper Honkworks 5.0 cartridge"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/pda.dmi'
	icon_state = "cart-clown"
	desc = "A data cartridge for portable microcomputers. It smells vaguely of bananas."
	access = CART_CLOWN

/obj/item/cartridge/virus/clown/send_virus(obj/item/pda/target, mob/living/U)
	if(charges <= 0)
		to_chat(U, span_notice("Out of charges."))
		return
	if(!isnull(target) && !target.toff)
		charges--
		to_chat(U, span_notice("Virus Sent!"))
		target.honkamt = (rand(15,20))
	else
		to_chat(U, span_alert("PDA not found."))

/obj/item/cartridge/virus/mime
	name = "\improper Gestur-O 1000 cartridge"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/pda.dmi'
	icon_state = "cart-mi"
	access = CART_MIME

/obj/item/cartridge/virus/mime/send_virus(obj/item/pda/target, mob/living/U)
	if(charges <= 0)
		to_chat(U, span_alert("Out of charges."))
		return
	if(!isnull(target) && !target.toff)
		charges--
		to_chat(U, span_notice("Virus Sent!"))
		target.silent = TRUE
		target.ttone = "silence"
	else
		to_chat(U, span_alert("PDA not found."))
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/food/burger/clown
	name = "clown burger"
	desc = "This tastes funny..."
	icon_state = "clownburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 12,
		/datum/reagent/medicine/mannitol = 11,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	foodtypes = GRAIN | FRUIT

/obj/item/food/burger/mime
	name = "mime burger"
	desc = "Its taste defies language."
	icon_state = "mimeburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 11,
		/datum/reagent/consumable/nutriment/vitamin = 7,
		/datum/reagent/consumable/nothing = 6,
	)
	foodtypes = GRAIN
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/food/donkpocket/honk
	name = "\improper Honk-pocket"
	desc = "The award-winning donk-pocket that won the hearts of clowns and humans alike."
	icon_state = "donkpocketbanana"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/banana = 4
	)
	tastes = list("banana" = 2, "dough" = 2, "children's antibiotics" = 1)
	foodtypes = GRAIN

	//warm_type = /obj/item/food/donkpocket/warm/honk
	microwaved_type = /obj/item/food/donkpocket/warm/honk

/obj/item/food/donkpocket/warm/honk
	name = "warm Honk-pocket"
	desc = "The award-winning donk-pocket, now warm and toasty."
	icon_state = "donkpocketbanana"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/banana = 4,
		/datum/reagent/consumable/laughter = 6
	)
	tastes = list("banana" = 2, "dough" = 2, "children's antibiotics" = 1)
	foodtypes = GRAIN
// [/CELADON-ADD]

/obj/item/grenade/botch_check(mob/living/carbon/human/user) // [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS
	var/clumsy = HAS_TRAIT(user, TRAIT_CLUMSY)
	if(clumsy && (clumsy_check == GRENADE_CLUMSY_FUMBLE))
		if(prob(50))
			to_chat(user, span_warning("Huh? How does this thing work?"))
			preprime(user, 5, FALSE)
			return TRUE
	else if(!clumsy && (clumsy_check == GRENADE_NONCLUMSY_FUMBLE))
		to_chat(user, span_warning("You pull the pin on [src]. Attached to it is a pink ribbon that says, \"[span_clown("HONK")]\""))
		preprime(user, 5, FALSE)
		return TRUE
	else
		return ..()

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/borg/upgrade/transform/clown
	name = "borg module picker (Clown)"
	desc = "Allows you to to turn a cyborg into a clown, honk."
	icon_state = "cyborg_upgrade3"
	new_module = /obj/item/robot_module/clown
// [/CELADON-ADD]

/obj/item/stack/medical/gauze
	custom_price = 35 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 50

/obj/item/stack/sticky_tape/surgical
	custom_price = 50 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 500

/obj/item/storage/backpack
	equip_delay_self = 0 SECONDS // [CELADON-REMOVE] - CELADON_BALANCE_CD

/obj/item/storage/backpack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/storage_component = GetComponent(/datum/component/storage)
	storage_component.worn_access = TRUE // [CELADON-REMOVE] - CELADON_BALANCE_CD

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/storage/backpack/mime
	name = "Parcel Parceaux"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpacks.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_righthand.dmi'
	desc = "A silent backpack made for those silent workers. Silence Co."
	icon_state = "mimepack"
	item_state = "mimepack"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/storage/backpack/ert/clown
	name = "emergency response team clown backpack"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpacks.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/backpack_onmob.dmi'
	desc = "A spacious backpack with lots of pockets, worn by Clowns of an Emergency Response Team."
	icon_state = "ert_clown"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
// For ClownOps.
/obj/item/storage/backpack/duffelbag/clown/syndie/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	slowdown = 0
	STR.silent = TRUE

/obj/item/storage/backpack/duffelbag/clown/syndie/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/clown(src)
	new /obj/item/clothing/shoes/clown_shoes(src)
	new /obj/item/pda/clown(src)
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/bikehorn(src)
	new /obj/item/implanter/sad_trombone(src)
// [/CELADON-ADD]

// [CELADON-EDIT] - OMNI_TOOLS
/obj/item/storage/belt/utility/chief/full/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/electric(src)
	new /obj/item/multitool/tricorder(src)
	new /obj/item/pipe_dispenser(src)
	new /obj/item/inducer(src)
	new /obj/item/stack/cable_coil(src,MAXCOIL,pick("red","yellow","orange"))

/obj/item/storage/belt/utility/chief/debug/full/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/electric(src)
	new /obj/item/multitool/tricorder/ranged(src)
	new /obj/item/pipe_dispenser/bluespace(src)
	new /obj/item/inducer/adv(src)
	new /obj/item/stack/cable_coil(src,MAXCOIL,"cyan")
// [/CELADON-EDIT]

/obj/item/storage/belt/medical/nohypo/PopulateContents() // [CELADON-ADD] - CELADON_BALANCE
	new /obj/item/scalpel(src)
	new /obj/item/circular_saw(src)
	new /obj/item/blood_filter(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/retractor(src)
	new /obj/item/cautery(src)
	new /obj/item/hemostat(src)
	update_appearance()

/obj/item/storage/box/ComponentInitialize()
	. = ..()
	var/datum/component/storage/storage_component = GetComponent(/datum/component/storage)
	storage_component.storage_flags = /datum/component/storage::storage_flags
	storage_component.max_volume = /datum/component/storage::max_volume
	storage_component.max_w_class = /datum/component/storage::max_w_class

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
//Mime spell boxes

/obj/item/storage/box/mime
	name = "invisible box"
	desc = "Unfortunately not large enough to trap the mime."
	foldable = null
	icon_state = "box"
	item_state = null
	alpha = 0

/obj/item/storage/box/mime/attack_hand(mob/user)
	..()
	if(user.mind.miming)
		alpha = 255

/obj/item/storage/box/mime/Moved(oldLoc, dir)
	if (iscarbon(oldLoc))
		alpha = 0
	..()
// [/CELADON-ADD]

// [CELADON-EDIT]
/obj/item/storage/box/donkpockets/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(/obj/item/food/donkpocket))
// [/CELADON-EDIT]

// [CELADON-EDIT]
/obj/item/storage/box/monkeycubes/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/food/monkeycube))
// [/CELADON-EDIT]

// [CELADON-EDIT]
/obj/item/storage/box/snappops/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(/obj/item/toy/snappop))
	STR.max_items = 8
// [/CELADON-EDIT]

// [CELADON-EDIT]
/obj/item/storage/box/matches/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.set_holdable(list(/obj/item/match))
// [/CELADON-EDIT]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
// Clown survival box
/obj/item/storage/box/hug/survival/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)

	if(!isplasmaman(loc))
		new /obj/item/tank/internals/emergency_oxygen(src)
	else
		new /obj/item/tank/internals/plasmaman/belt(src)
// [/CELADON-ADD]

/obj/item/storage/pill_bottle/charcoal/less
	custom_price = 70 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 100

/obj/item/storage/toolbox/infiltrator/ComponentInitialize()
	. = ..()
	var/datum/component/storage/storage_component = GetComponent(/datum/component/storage)
	storage_component.can_hold |= typecacheof(/obj/item/clothing/shoes/combat/sneakboots) // [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	storage_component.can_hold_description = storage_component.generate_hold_desc(storage_component.can_hold)

/obj/item/storage/toolbox/infiltrator/PopulateContents()
	. = ..()
	new /obj/item/clothing/shoes/combat/sneakboots(src) // [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/storage/box/syndie_kit/mimery/PopulateContents()
	new /obj/item/book/granter/spell/mimery_blockade(src)
	new /obj/item/book/granter/spell/mimery_guns(src)
// [/CELADON-ADD]

/obj/item/storage/wallet/ComponentInitialize() // [CELADON-ADD] - CELADON_QOL - Добавляем ключи и нож для писем, сигареты
	. = ..()
	var/datum/component/storage/storage_component = GetComponent(/datum/component/storage)
	storage_component.can_hold |= typecacheof(list(
		/obj/item/clothing/gloves/ring,
		/obj/item/clothing/gloves/ring/diamond,
		/obj/item/clothing/gloves/ring/silver,
		/obj/item/clothing/mask/cigarette,
		/obj/item/key,
		/obj/item/melee/knife/letter_opener,
	))
	storage_component.can_hold -= typecacheof(/obj/item/screwdriver)
	storage_component.can_hold_description = storage_component.generate_hold_desc(storage_component.can_hold)

/obj/item/storage/wallet/random/Initialize(mapload)
	. = ..()
	icon_state = /obj/item/storage/wallet::icon_state

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/bedsheet/mime
	name = "mime's blanket"
	desc = "A very soothing striped blanket.  All the noise just seems to fade out when you're under the covers in this."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_righthand.dmi'
	icon_state = "sheetmime"
	item_state = "sheetmime"
	dream_messages = list("silence", "gestures", "a pale face", "a gaping mouth", "the mime")

/obj/item/bedsheet/clown
	name = "clown's blanket"
	desc = "A rainbow blanket with a clown mask woven in. It smells faintly of bananas."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_righthand.dmi'
	icon_state = "sheetclown"
	item_state = "sheetrainbow"
	dream_messages = list("honk", "laughter", "a prank", "a joke", "a smiling face", "the clown")
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/bedsheet/double/mime
	name = "double mime's blanket"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_righthand.dmi'
	icon_state = "double_sheetmime"
	item_state = "sheetmime"
	dream_messages = list("silence", "gestures", "a pale face", "a gaping mouth", "the mime")
	desc = "A very soothing striped blanket.  All the noise just seems to fade out when you're under the covers in this."

/obj/item/bedsheet/double/clown
	name = "double clown's blanket"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheets.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/bedsheet_righthand.dmi'
	icon_state = "double_sheetclown"
	item_state = "sheetrainbow"
	dream_messages = list("honk", "laughter", "a prank", "a joke", "a smiling face", "the clown")
	desc = "A rainbow blanket with a clown mask woven in. It smells faintly of bananas."
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/structure/chair/mime
	name = "invisible chair"
	desc = "The mime needs to sit down and shut up."
	anchored = FALSE
	icon_state = null
	buildstacktype = null
	item_chair = null
	flags_1 = NODECONSTRUCT_1
	alpha = 0

/obj/structure/chair/mime/post_buckle_mob(mob/living/M)
	M.pixel_y += 5

/obj/structure/chair/mime/post_unbuckle_mob(mob/living/M)
	M.pixel_y -= 5
// [/CELADON-ADD]

/obj/structure/closet/examine(mob/user)
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_QUIRKS
	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_SKITTISH))
			. += "<span class='notice'>Ctrl-Shift-click [src] to jump inside.</span>"
	// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_QUIRKS
/obj/structure/closet/CtrlShiftClick(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_SKITTISH))
		return ..()
	if(!user.canUseTopic(src, BE_CLOSE) || !isturf(user.loc))
		return
	dive_into(user)
// [/CELADON-ADD]

/obj/structure/closet/wardrobe/chaplain_black/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/nun_hood(src)
	new /obj/item/clothing/suit/hooded/chaplainsuit/monkhabit(src)
	new /obj/item/clothing/suit/chaplainsuit/holidaypriest(src)
	// [/CELADON-ADD]

/obj/structure/closet/wardrobe/black/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	if(prob(20))
		new /obj/item/clothing/suit/jacket/leather/overcoat(src)
	// [/CELADON-ADD]

/obj/structure/closet/secure_closet/captains/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	new /obj/item/clothing/head/crown/fancy(src)
	new /obj/item/clothing/glasses/sunglasses/gar/supergar(src)
	new /obj/item/gun/energy/e_gun/e_old(src)	// [CELADON-ADD] - CELADON_RETURN_EGUN
	// [/CELADON-ADD]

/obj/structure/closet/secure_closet/head_of_personnel/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	new /obj/item/clothing/head/hopcap(src)
	new /obj/item/gun/energy/e_gun/e_old/mini(src)	// [CELADON-ADD] - CELADON_RETURN_EGUN
	// [/CELADON-ADD]

/obj/structure/closet/secure_closet/hos/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	new /obj/item/clothing/glasses/hud/security/sunglasses/gars/supergars(src)
	new /obj/item/gun/energy/e_gun/e_old/hos(src)	// [CELADON-ADD] - CELADON_RETURN_EGUN
	// [/CELADON-ADD]

/obj/structure/closet/secure_closet/courtroom/PopulateContents()
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	new /obj/item/clothing/head/powdered_wig (src)
	// [/CELADON-ADD]

/obj/structure/closet/secure_closet/armory3/PopulateContents()
	. = ..()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/e_gun/e_old(src)	// [CELADON-ADD] - CELADON_RETURN_EGUN

/obj/structure/closet/secure_closet/tac/PopulateContents()
	. = ..()
	new /obj/item/gun/ballistic/automatic/smg/wt550(src)	// [CELADON-ADD] - CELADON_RETURN_EGUN

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
/obj/structure/closet/crate/wooden/toy
	name = "toy box"
	desc = "It has the words \"Clown + Mime\" written underneath of it with marker."

/obj/structure/closet/crate/wooden/toy/PopulateContents()
	. = ..()
	new	/obj/item/megaphone/clown(src)
	new	/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter(src)
	new /obj/item/pneumatic_cannon/pie(src)
	new /obj/item/food/pie/cream(src)
	new /obj/item/storage/crayons(src)
// [/CELADON-ADD]

/turf/closed/mineral
	// [CELADON-EDIT] - CELADON_BALANCE - Делаем из картонного камня скалу!
	max_integrity = 1200
	brute_mod = 0.3
	burn_mod = 0.3
	// [/CELADON-EDIT]

/turf/closed/mineral/random/Initialize(mapload, inherited_virtual_z)
	if(/turf/closed/mineral/random::mineralSpawnChanceList == mineralSpawnChanceList)
		mineralSpawnChanceList |= list(/turf/closed/mineral/gibtonite = 4) // [CELADON-ADD] - RETURN GIBTONITE
	return ..()

/turf/closed/wall
	// [CELADON-EDIT] - CELADON_BALANCE - Увеличиваем живучесть стенам
	min_dam = 25
	max_integrity = 800
	// [/CELADON-EDIT]

/turf/open/chasm/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(.)
		return
	// [CELADON-ADD] - RETURN_CHASM - Не удалось сделать чтобы ССДшники не падали
	if(mover.movement_type & (PHASING|GROUND))
		return TRUE
	// [/CELADON-ADD]

/turf/open/floor/plating/asteroid/snow
	icon = MAP_SWITCH('icons/turf/floors/snow.dmi', 'mod_celadon/_storage_icons/icons/structures/snow.dmi') // [CELADON-EDIT] - Снег без квадратиков в sDMM

/client/invisimin()
	if(holder && mob)
		// [CELADON-EDIT] - Оффовский извиз видно на худах. Вводим экстренное решение.
		if(mob.alpha != 0)
			mob.alpha = 0
			mob.mouse_opacity = 0
			to_chat(mob, span_adminnotice("<b>\[Invisibility_ON] Ваше тело растворяется в пустоту. Ваша активность видна лишь в Orbit.</b>"), confidential = TRUE)
		else
			mob.alpha = 255
			mob.mouse_opacity = 1
			to_chat(mob, span_adminnotice("<b>\[Invisibility_OFF] Ваше тело снова видно органическим формам жизни.</b>"), confidential = TRUE)
		// [/CELADON-EDIT]

// [CELADON-ADD] - ADMIN-PANEL - Black Reality
/client/proc/show_all_verbs()
	set category = "Admin"
	set name = "Admin Panel 📋"

	if(!holder)
		return

	admin_menu = new(usr)
	admin_menu.ui_interact(usr)

/datum/admin_menu
	var/client/holder
	var/compact_mode = FALSE

/datum/admin_menu/New(user)
	if (istype(user, /client))
		var/client/user_client = user
		holder = user_client
	else
		var/mob/user_mob = user
		holder = user_mob.client

/datum/admin_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/admin_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AdminVerbs")
		ui.open()

/datum/admin_menu/ui_data(mob/user)
	var/list/data = list()
	data["compactMode"] = compact_mode
	return data

/datum/admin_menu/ui_static_data(mob/user)
	var/list/temp_data = list()
	for(var/procpath/cur_verb as anything in holder.verbs)
		if(!cur_verb.category)
			continue
		if(!temp_data[cur_verb.category])
			temp_data[cur_verb.category] = list()
		temp_data[cur_verb.category] += list(list("verb" = "[cur_verb]", "name" = cur_verb.name, "desc" = cur_verb.desc))

	var/list/tgui_data = list()
	for(var/category in temp_data)
		var/list/cat = list(
			"name" = category,
			"items" = temp_data[category])
		tgui_data["categories"] += list(cat)

	LAZYADDASSOCLIST(tgui_data, "categories", list("name" = "История", "items" = reverseList(holder.last_verbs_used)))
	return tgui_data

/datum/admin_menu/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("compact_toggle")
			compact_mode = !compact_mode
			return TRUE

	if(!check_rights(R_ADMIN) || action != "run")
		return

	INVOKE_ASYNC(holder, text2path(params["verb"]))

	LAZYADD(holder.last_verbs_used, list(list("verb" = params["verb"], "name" = params["name"], "desc" = params["desc"])))

	SStgui.close_uis(usr)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
// Handles adding and removing the clumsy mutation from clown antags. Gets called in apply/remove_innate_effects
/datum/antagonist/proc/handle_clown_mutation(mob/living/mob_override, message, removing = TRUE)
	var/mob/living/carbon/human/H = mob_override
	if(H && istype(H) && owner.assigned_role == "Clown")
		if(removing) // They're a clown becoming an antag, remove clumsy
			H.dna.remove_mutation(CLOWNMUT)
			if(!silent && message)
				to_chat(H, span_boldnotice("[message]"))
		else
			H.dna.add_mutation(CLOWNMUT) // We're removing their antag status, add back clumsy
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
//////CLOWN OP
/obj/item/antag_spawner/nuke_ops/clown
	name = "clown operative teleporter"
	desc = "A single-use teleporter designed to quickly reinforce clown operatives in the field."

/obj/item/antag_spawner/nuke_ops/clown/spawn_antag(client/C, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/M = new/mob/living/carbon/human(T)
	C.prefs.copy_to(M)
	M.key = C.key

	var/datum/antagonist/nukeop/clownop/new_op = new /datum/antagonist/nukeop/clownop()
	new_op.send_to_spawnpoint = FALSE
	new_op.nukeop_outfit = /datum/outfit/syndicate/clownop/no_crystals

	var/datum/antagonist/nukeop/creator_op = user.has_antag_datum(/datum/antagonist/nukeop/clownop,TRUE)
	if(creator_op)
		M.mind.add_antag_datum(new_op, creator_op.nuke_team)
		M.mind.special_role = "Clown Operative"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/antag_spawner/slaughter_demon/laughter
	name = "vial of tickles"
	desc = "A magically infused bottle of clown love, distilled from countless hugging attacks. Used in funny rituals to attract adorable creatures."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "vial"
	color = "#FF69B4" // HOT PINK

	veil_msg = span_warning("You sense an adorable presence lurking just beyond the veil...")
	demon_type = /mob/living/simple_animal/slaughter/laughter
	antag_type = /datum/antagonist/slaughter/laughter
// [/CELADON-ADD]

/datum/antagonist/changeling/apply_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, "You have evolved beyond your clownish nature, allowing you to wield weapons without harming yourself.")	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/antagonist/changeling/remove_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, removing = FALSE)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/nuclear_challenge/clownops
	uplink_type = /obj/item/uplink/clownop
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/mob/living/simple_animal/slaughter/laughter
	// The laughter demon! It's everyone's best friend! It just wants to hug
	// them so much, it wants to hug everyone at once!
	name = "laughter demon"
	real_name = "laughter demon"
	desc = "A large, adorable creature covered in armor with pink bows."
	speak_emote = list("giggles","titters","chuckles")
	emote_hear = list("guffaws","laughs")
	response_help_continuous = "hugs"
	attack_verb_continuous = "wildly tickles"
	attack_verb_simple = "wildly tickle"

	attack_sound = 'sound/items/bikehorn.ogg'
	feast_sound = 'sound/spookoween/scary_horn2.ogg'
	deathsound = 'sound/misc/sadtrombone.ogg'

	icon_state = "bowmon"
	icon_living = "bowmon"
	deathmessage = "fades out, as all of its friends are released from its \
		prison of hugs."
	loot = list(/mob/living/simple_animal/pet/cat/kitten{name = "Laughter"})

	// Keep the people we hug!
	var/list/consumed_mobs = list()

	playstyle_string = "<span class='big bold'>You are a laughter \
	demon,</span><B> a wonderful creature from another realm. You have a single \
	desire: <span class='clown'>To hug and tickle.</span><BR>\
	You may use the \"Blood Crawl\" ability near blood pools to travel \
	through them, appearing and disappearing from the station at will. \
	Pulling a dead or unconscious mob while you enter a pool will pull \
	them in with you, allowing you to hug them and regain your health.<BR> \
	You move quickly upon leaving a pool of blood, but the material world \
	will soon sap your strength and leave you sluggish.<BR>\
	What makes you a little sad is that people seem to die when you tickle \
	them; but don't worry! When you die, everyone you hugged will be \
	released and fully healed, because in the end it's just a jape, \
	sibling!</B>"

/mob/living/simple_animal/slaughter/laughter/Initialize()
	. = ..()
	if(check_holidays(APRIL_FOOLS))
		icon_state = "honkmon"

/mob/living/simple_animal/slaughter/laughter/Destroy()
	release_friends()
	. = ..()

/mob/living/simple_animal/slaughter/laughter/ex_act(severity)
	switch(severity)
		if(1)
			death()
		if(2)
			adjustBruteLoss(60)
		if(3)
			adjustBruteLoss(30)

/mob/living/simple_animal/slaughter/laughter/proc/release_friends()
	if(!consumed_mobs)
		return

	for(var/mob/living/M in consumed_mobs)
		if(!M)
			continue
		var/turf/T = find_safe_turf()
		if(!T)
			T = get_turf(src)
		M.forceMove(T)
		if(M.revive(full_heal = TRUE, admin_revive = TRUE))
			M.grab_ghost(force = TRUE)
			playsound(T, feast_sound, 50, TRUE, -1)
			to_chat(M, span_clown("You leave [src]'s warm embrace,	and feel ready to take on the world."))

/mob/living/simple_animal/slaughter/laughter/bloodcrawl_swallow(mob/living/victim)
	if(consumed_mobs)
		// Keep their corpse so rescue is possible
		consumed_mobs += victim
	else
		// Be safe and just eject the corpse
		victim.forceMove(get_turf(victim))
		victim.exit_blood_effect()
		victim.visible_message(span_warning("[victim] falls out of the air, covered in blood, looking highly confused. And dead."))
// [/CELADON-ADD]

/datum/antagonist/traitor/apply_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, mob_override ? null : "Your training has allowed you to overcome your clownish nature, allowing you to wield weapons without harming yourself.")	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/antagonist/traitor/remove_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, removing = FALSE)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/obj/item/necromantic_stone/equip_roman_skeleton(mob/living/carbon/human/H)
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/roman(H), ITEM_SLOT_FEET)

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/spellbook_entry/item/hugbottle
	name = "Bottle of Tickles"
	desc = "A bottle of magically infused fun, the smell of which will \
		attract adorable extradimensional beings when broken. These beings \
		are similar to slaughter demons, but they do not permamently kill \
		their victims, instead putting them in an extradimensional hugspace, \
		to be released on the demon's death. Chaotic, but not ultimately \
		damaging. The crew's reaction to the other hand could be very \
		destructive."
	item_path = /obj/item/antag_spawner/slaughter_demon/laughter
	cost = 1 //non-destructive; it's just a jape, sibling!
	limit = 3
	category = "Assistance"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/assembly/flash/proc/clown_check(mob/living/carbon/human/user)
	if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		flash_carbon(user, user, 15, 0)
		return FALSE
	return TRUE
// [/CELADON-ADD]

/datum/asset/spritesheet/simple/paper/New()
	assets |= list(
		// [CELADON-ADD] - CELADON_STAMPS + CELADON_RETURN_CONTENT_CLOWNS
		"stamp-inteq-celadon" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-inteq.png',
		"inteq-mothership-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/inteq_mothership_stamp.png',
		"solfed-corps-commander-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/sf_commander_stamp.png',
		"solfed-captain" = 'mod_celadon/_storage_icons/icons/assets/png/sf_captain_stamp.png',
		"elysium-brigade-captain-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/elysium_brigade_stamp.png',
		"elysium-republic-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/elysium_republic_stamp.png',
		"elysium-avanpost-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/elysium_outpost_stamp.png',
		"nt-cent-command-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/nanotrasen_central_command_stamp.png',
		"nt-captain-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/nanotrasen_captain_stamp.png',
		"syndicate-captain-stamp" = 'mod_celadon/_storage_icons/icons/assets/png/syndicate_captain_stamp.png',
		"stamp-df" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-df_generic.png',
		"stamp-df_captain" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-df_captain.png',
		"stamp-df_meddir" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-df_med_dir.png',
		"stamp-ne" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-ne_generic.png',
		"stamp-ne_captain" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-ne_captain.png',
		"stamp-ne_engdir" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-ne_eng_dir.png',
		"stamp-mime" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-mime.png',
		"stamp-clown" = 'mod_celadon/_storage_icons/icons/assets/png/large_stamp-clown.png',
		// [/CELADON-ADD]
	)

/datum/asset/spritesheet/simple/achievements/New()
	assets |= list(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
		"clownking" = 'mod_celadon/_storage_icons/icons/assets/png/clownking.png',
		"clownthanks" = 'mod_celadon/_storage_icons/icons/assets/png/clownthanks.png',
		// [/CELADON-ADD]
	)

/obj/effect/mob_spawn
	var/can_load_appearance = TRUE // [CELADON-EDIT] - CELADON_LOAD_PREF

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/effect/mob_spawn/human/clown
	name = "Clown"
	outfit = /datum/outfit/job/cel/independent/clown
// [/CELADON-ADD]

//[CELADON-ADD] - CELADON_FIXES - Чиним реролл
/datum/overmap/ship/controlled
	var/given_up_missions = 0
	var/giveup_timer = - 15 MINUTES
	var/giveup_timeout = FALSE
//[/CELADON-ADD]

/obj/machinery/outpost_selling_pad
	resistance_flags = INDESTRUCTIBLE	// [CELADON-ADD]
	flags_1 = NODECONSTRUCT_1			// [/CELADON-ADD]

/obj/machinery/computer/outpost_export_console
	var/cache_cooldown = 0  // [CELADON-ADD] - CELADON_FIXES: Cooldown for caching exports to prevent FPS drops
	resistance_flags = INDESTRUCTIBLE	// [CELADON-ADD]
	flags_1 = NODECONSTRUCT_1			// [/CELADON-ADD]

/obj/machinery/computer/outpost_export_console/cache_valid_exports()
	// [CELADON-ADD] - CELADON_FIXES: Prevent constant re-caching every tick
	if(cache_cooldown > world.time)
		return
	cache_cooldown = world.time + 10  // Cache for 1 second
	// [/CELADON-ADD]
	return ..()

// [CELADON-REMOVE] - Никто в жизни это не купит намеренно
/datum/blackmarket_item/clothing/degraded_armor_set
	availability_prob = 0

/datum/export/hunting/stack/rarehide
	export_types = list(/obj/item/stack/sheet/animalhide/ashdrake)	// [CELADON-EDIT]

/datum/export/hunting/stack/hide
	unit_name = "animal hide"
	desc = "Animal hide export. Paid per hide."
	cost = 50
	export_types = list(/obj/item/stack/sheet/animalhide/goliath_hide) // Also includes polar bear hide.

/datum/export/hunting/trophy/common/New()
	. = ..()
	export_types |= typecacheof(list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/shiny,
		/obj/item/crusher_trophy/legion_skull,
		/obj/item/crusher_trophy/wolf_ear,
		/obj/item/crusher_trophy/bear_paw,
		/obj/item/crusher_trophy/goliath_tentacle,
		/obj/item/crusher_trophy/watcher_wing,
		/obj/item/crusher_trophy/brimdemon_fang,
		/obj/item/crusher_trophy/lobster_claw,
		/obj/item/mob_trophy/shiny,
// [/CELADON-ADD]
	), FALSE, !include_subtypes)

/datum/export/hunting/trophy/rare/New()
	. = ..()
	export_types |= typecacheof(list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/watcher_wing_forgotten,
		/obj/item/crusher_trophy/legion_skull_crystal,
		/obj/item/crusher_trophy/goliath_crystal,
		/obj/item/crusher_trophy/dwarf_skull,
		/obj/item/crusher_trophy/fang,
		/obj/item/crusher_trophy/war_paw,
		/obj/item/crusher_trophy/elder_tentacle,
		/obj/item/crusher_trophy/ice_crystal,
		/obj/item/crusher_trophy/magma_skull,
		/obj/item/crusher_trophy/magma_skull/magma,
		/obj/item/crusher_trophy/magma_wing,
		/obj/item/crusher_trophy/tail_spike,
		/obj/item/crusher_trophy/ice_wing,
		/obj/item/crusher_trophy/dwarf_skull,
		/obj/item/mob_trophy/watcher_wing_forgotten,
		/obj/item/mob_trophy/legion_skull_crystal,
		/obj/item/mob_trophy/goliath_crystal,
// [/CELADON-ADD]
	), FALSE, !include_subtypes)

/datum/export/hunting/trophy/mega/New()
	. = ..()
	export_types |= typecacheof(list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/legionnaire_spine,
		/obj/item/crusher_trophy/ash_spike,
		/obj/item/crusher_trophy/demon_claws,
		/obj/item/crusher_trophy/broodmother_tongue,
		/obj/item/crusher_trophy/ice_block_talisman,
		/obj/item/crusher_trophy/king_goat,
		/obj/item/crusher_trophy/miner_eye,
		/obj/item/crusher_trophy/vortex_talisman,
		/obj/item/crusher_trophy/blaster_tubes,
// [/CELADON-ADD]
	), FALSE, !include_subtypes)

// [CELADON-ADD]
// Hides
/datum/export/hunting/stack
	desc = "Rawhide of various origins. The more exotic the species, the higher the price."
	include_subtypes = FALSE

/datum/export/hunting/stack/monkey
	cost = 50
	unit_name = "monkey hide"
	export_types = list(/obj/item/stack/sheet/animalhide/monkey)

/datum/export/hunting/stack/human
	unit_name = "piece of human skin"
	cost = 100
	export_types = list(/obj/item/stack/sheet/animalhide/human)

/datum/export/hunting/stack/goliath_hide
	unit_name = "goliath hide"
	cost = 200
	export_types = list(/obj/item/stack/sheet/animalhide/goliath_hide)
	include_subtypes = TRUE

/datum/export/hunting/stack/cat
	unit_name = "cat hide"
	cost = 150
	export_types = list(/obj/item/stack/sheet/animalhide/cat)

/datum/export/hunting/stack/corgi
	unit_name = "corgi hide"
	cost = 200
	export_types = list(/obj/item/stack/sheet/animalhide/corgi)

/datum/export/hunting/stack/lizard
	unit_name = "lizard hide"
	cost = 150
	export_types = list(/obj/item/stack/sheet/animalhide/lizard)

/datum/export/hunting/stack/gondola
	unit_name = "gondola hide"
	cost = 250
	export_types = list(/obj/item/stack/sheet/animalhide/gondola)

/datum/export/hunting/stack/xeno
	unit_name = "alien hide"
	cost = 100
	export_types = list(/obj/item/stack/sheet/animalhide/xeno)


// [/CELADON-ADD]

/datum/export/material/plasma
	cost = 30

/datum/export/material/metal
	elasticity_coeff = 0

/datum/export/material/metal/New()
	. = ..()
	export_types |= typecacheof(list(
// [CELADON-ADD]
		/obj/item/stack/tile/plasteel,
// [/CELADON-ADD]
	), FALSE, !include_subtypes)

/datum/export/material/glass
	cost = 2
	sell_floor = 1
	elasticity_coeff = 0

// [CELADON-ADD]
/datum/export/material/wood
	unit_name = "cm3 of wood"
	cost = 1
	sell_floor = 1
	elasticity_coeff = 0
	material_id = /datum/material/wood
	export_types = list(/obj/item/stack/sheet/mineral/wood)

/datum/export/material/hellstone
	unit_name = "cm3 of hellstone"
	cost = 100
	material_id = /datum/material/hellstone

/datum/export/material/hot_ice
	unit_name = "cm3 of Hot Ice"
	cost = 100
	material_id = /datum/material/hot_ice
	export_types = /obj/item/stack/sheet/hot_ice

/datum/export/material/abductor
	unit_name = "cm3 of alien alloy"
	cost = 500
	export_types = list(/obj/item/stack/sheet/mineral/abductor)
// [/CELADON-ADD]

/datum/export/gems/diamond
	cost = 1500

/datum/export/gems/amber
	cost = 3000

/datum/export/gems/plasma
	cost = 4000

/datum/export/gems/void
	cost = 5000

/datum/export/gems/void
	cost = 5000

/datum/export/gems/strange_crystal
	cost = 6000

/datum/export/claymore
	cost = 500

// [CELADON-ADD]
/datum/export/anomaly
	unit_name = "stabilized anomaly core"
	cost = 1000
	elasticity_coeff = 0.1
	export_types = list(/obj/item/assembly/signaler/anomaly)

/datum/export/anomaly/New(...)
	. = ..()
	desc = "[SSmissions.get_researcher_name()] has requested that we [pick(list("procure", "grab", "acquire", "find", "locate"))] \
	anomaly cores for [pick(list("research", "analysis", "technical development", "closer inspection", "some reason"))]."
// [/CELADON-ADD]

/datum/export/solar
	elasticity_coeff = 0.05

/datum/export/thruster_ion
	cost = 500
	desc = "One set of t3 circuits and controllers for an electrical ion engine."
	unit_name = "ion thruster board"
	elasticity_coeff = 0.05
	export_types = list(/obj/item/circuitboard/machine/shuttle/engine/electric/tech3)

/datum/export/modular_part
	export_types = list()

/datum/preferences/get_default_name(name_id)
	switch(name_id)
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
		if("clown")
			return pick(GLOB.clown_names)
		if("mime")
			return pick(GLOB.mime_names)
		// [/CELADON-ADD]
	return ..()

/datum/gear/hat/beret/departmental/New()
	var/list/other_roles = list(
// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
		"Mime" = /obj/item/clothing/head/beret,
		"Clown" = /obj/item/clothing/head/beret/puce
// [/CELADON-ADD]
	)
	for(var/key in other_roles)
		role_replacements[key] = other_roles[key]
	return ..()

/obj/item/clothing/head/helmet/bulletproof/x11/frontier/fireproof
	armor = list("melee" = 15, "bullet" = 60, "laser" = 10, "energy" = 10, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/armor/hardliners/sergeant
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/armor/inteq/corpsman/Initialize(mapload)
	allowed -= list(
	// [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
		/obj/item/melee/classic_baton/telescopic,
	// [/CELADON-REMOVE]
	)
	return ..()

/obj/item/clothing/suit/space/hardsuit/security/inteq
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION

/obj/item/clothing/suit/space/hardsuit/syndi/inteq
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | KEPORI_VARIATION | TAJARA_VARIATION | RIOL_VARIATION

/obj/item/clothing/mask/gas/inteq
// [CELADON-ADD] - SFX-Die
	unique_death = list(
		'mod_celadon/_storage_sounds/sound/items/gasmask/die1.ogg',
		'mod_celadon/_storage_sounds/sound/items/gasmask/die2.ogg',
		'mod_celadon/_storage_sounds/sound/items/gasmask/die3.ogg',
		'mod_celadon/_storage_sounds/sound/items/gasmask/die4.ogg',
		)
// [/CELADON-ADD]

/obj/item/clothing/mask/gas/vigilitas
	unique_death = list('mod_celadon/_storage_sounds/sound/items/gasmask/sec_die.ogg')	// [CELADON-ADD] - SFX-Die

/obj/item/clothing/head/helmet/ngr
	armor = list("melee" = 40, "bullet" = 60, "laser" = 35, "energy" = 35, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 20) // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/space/hardsuit/syndi/ramzi
// [CELADON-EDIT] - TAJARA, CELADON_RIOL, BALANCE
	slowdown = parent_type::slowdown	// [CELADON-REMOVE] - BALANCE
	jetpack = null
	supports_variations = DIGITIGRADE_VARIATION | KEPORI_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION // [CELADON-EDIT] - TAJARA, CELADON_RIOL
// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/solgov
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/gloves/color/plasmaman/clown
	name = "clown envirogloves"
	icon_state = "clownplasma"
// [/CELADON-ADD]

/obj/item/clothing/head
	supports_variations = VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION

// [CELADON-ADD]
/obj/item/clothing/head/helmet/riot
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/helmet_celadon.dmi'

/obj/item/clothing/head/helmet/riot/solfed
	unique_reskin = null
	unique_reskin_changes_base_icon_state = FALSE
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/head/rice_hat
	name = "rice hat"
	desc = "Welcome to the rice fields, motherfucker."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/hats.dmi'
	icon_state = "rice_hat"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/head/frenchberet
	name = "french beret"
	desc = "A quality beret, infused with the aroma of chain-smoking, wine-swilling Parisians. You feel less inclined to engage in military conflict, for some reason."
	icon_state = "beret"

/obj/item/clothing/head/frenchberet/equipped(mob/M, slot)
	. = ..()
	if (slot == ITEM_SLOT_HEAD)
		RegisterSignal(M, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	else
		UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/head/frenchberet/dropped(mob/M)
	. = ..()
	UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/head/frenchberet/proc/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/french_words = strings("french_replacement.json", "french")

		for(var/key in french_words)
			var/value = french_words[key]
			if(islist(value))
				value = pick(value)

			message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
			message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
			message = replacetextEx(message, " [key]", " [value]")

		if(prob(3))
			message += pick(" Honh honh honh!"," Honh!"," Zut Alors!")
	speech_args[SPEECH_MESSAGE] = trim(message)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/mask/gas/clown_hat
	name = "clown wig and mask"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/masks.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/mask.dmi'
	desc = "A true prankster's facial attire. A clown is incomplete without his wig and mask."
	clothing_flags = ALLOWINTERNALS
	icon_state = "clown"
	item_state = "clown_hat"
	dye_color = "clown"
	w_class = WEIGHT_CLASS_SMALL
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE
	actions_types = list(/datum/action/item_action/adjust)
	dog_fashion = /datum/dog_fashion/head/clown
	var/list/clownmask_designs = list()

/obj/item/clothing/mask/gas/clown_hat/Initialize(mapload)
	.=..()
	clownmask_designs = list(
		"True Form" = image(icon = src.icon, icon_state = "clown"),
		"The Feminist" = image(icon = src.icon, icon_state = "sexyclown"),
		"The Jester" = image(icon = src.icon, icon_state = "chaos"),
		"The Madman" = image(icon = src.icon, icon_state = "joker"),
		"The Rainbow Color" = image(icon = src.icon, icon_state = "rainbow")
		)

/obj/item/clothing/mask/gas/clown_hat/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/list/options = list()
	options["True Form"] = "clown"
	options["The Feminist"] = "sexyclown"
	options["The Madman"] = "joker"
	options["The Rainbow Color"] ="rainbow"
	options["The Jester"] ="chaos" //Nepeta33Leijon is holding me captive and forced me to help with this please send help

	var/choice = show_radial_menu(user,src, clownmask_designs, custom_check = FALSE, radius = 36, require_near = TRUE)
	if(!choice)
		return FALSE

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, span_notice("Your Clown Mask has now morphed into [choice], all praise the Honkmother!"))
		return TRUE

/obj/item/clothing/mask/gas/sexyclown
	name = "sexy-clown wig and mask"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/masks.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/mask.dmi'
	desc = "A feminine clown mask for the dabbling crossdressers or female entertainers."
	clothing_flags = ALLOWINTERNALS
	icon_state = "sexyclown"
	item_state = "sexyclown"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/mime
	name = "mime mask"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/masks.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/mask.dmi'
	desc = "The traditional mime's mask. It has an eerie facial posture."
	clothing_flags = ALLOWINTERNALS
	icon_state = "mime"
	item_state = "mime"
	w_class = WEIGHT_CLASS_SMALL
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE
	actions_types = list(/datum/action/item_action/adjust)
	var/list/mimemask_designs = list()

/obj/item/clothing/mask/gas/mime/Initialize(mapload)
	.=..()
	mimemask_designs = list(
		"Blanc" = image(icon = src.icon, icon_state = "mime"),
		"Excité" = image(icon = src.icon, icon_state = "sexymime"),
		"Triste" = image(icon = src.icon, icon_state = "sadmime"),
		"Effrayé" = image(icon = src.icon, icon_state = "scaredmime")
		)

/obj/item/clothing/mask/gas/mime/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/list/options = list()
	options["Blanc"] = "mime"
	options["Triste"] = "sadmime"
	options["Effrayé"] = "scaredmime"
	options["Excité"] ="sexymime"

	var/choice = show_radial_menu(user,src, mimemask_designs, custom_check = FALSE, radius = 36, require_near = TRUE)
	if(!choice)
		return FALSE

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, span_notice("Your Mime Mask has now morphed into [choice]!"))
		return TRUE
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/mask/gas/sexymime
	name = "sexy mime mask"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/masks.dmi'
	desc = "A traditional female mime's mask."
	clothing_flags = ALLOWINTERNALS
	icon_state = "sexymime"
	item_state = "sexymime"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE
// [/CELADON-ADD]

// [CELADON-ADD] - add: SFX-Die
/obj/item/clothing/mask/gas/sechailer/sec
	name = "security gas mask"
	desc = "A standard issue Security gas mask. It doesn't cover the eyes."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mask/hailer.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mask/overlay/hailer.dmi'
	unique_death = list('mod_celadon/_storage_sounds/sound/items/gasmask/sec_die.ogg')
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/mask/spamton
	name = "Cursed Businessman's Mask"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/masks.dmi'
	icon_state = "big_shot"
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/mask.dmi'
	item_state = "big_shot"
	clothing_flags = ALLOWINTERNALS
	visor_flags = ALLOWINTERNALS
	desc = "The porcelain mask of a now-forgotten business mogul, said to have made an impossible fortune long ago. Are you big enough to wear it?"
	modifies_speech = TRUE
	actions_types = list(/datum/action/item_action/lifesavings)

/datum/action/item_action/lifesavings
	name = "LIFE_SAVINGS"
	desc = "Shipping and handling not included."

/obj/item/clothing/mask/spamton/attack_self(mob/user)
	if(cooldown < world.time)
		SSblackbox.record_feedback("amount", "saving_uses", 1)
		cooldown = world.time + 1600
		var/mob/living/U = user
		U.apply_damage(25, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		to_chat(user, span_warning("BLOOD PRICE ACCEPTED. WITHDRAWING KRONOR FROM OFFSHORE FUND..."))
		pick(
						new /obj/item/spacecash/bundle/mediumrand(user.drop_location()),
						new /obj/item/spacecash/bundle/smallrand(user.drop_location()),
						new /obj/item/holochip(user.drop_location(), 5000))
	else
		to_chat(user, span_warning("[src]'s savings account can't yet be accessed!"))

/obj/item/clothing/mask/spamton/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/spamton_words = strings_load("spamton_replacement.json", "spamton", "mod_celadon/return_content_clowns/code/mime")

		for(var/key in spamton_words)
			var/value = spamton_words[key]
			if(islist(value))
				value = pick(value)

			message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
			message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
			message = replacetextEx(message, " [key]", " [value]")

	speech_args[SPEECH_MESSAGE] = trim(message)

/obj/item/clothing/mask/spamton/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_MASK_TRAIT)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/outfit/plasmaman/mime
	name = "Plasmamime"

	head = /obj/item/clothing/head/helmet/space/plasmaman/mime
	uniform = /obj/item/clothing/under/plasmaman/mime
	mask = /obj/item/clothing/mask/gas/mime
	gloves = /obj/item/clothing/gloves/color/plasmaman/white

/datum/outfit/plasmaman/clown
	name = "Plasmaclown"

	head = /obj/item/clothing/head/helmet/space/plasmaman/clown
	uniform = /obj/item/clothing/under/plasmaman/clown
	mask = /obj/item/clothing/mask/gas/clown_hat
	gloves = /obj/item/clothing/gloves/color/plasmaman/clown
// [/CELADON-ADD]

/datum/outfit/debug //Debug objs plus hardsuit
	belt = /obj/item/storage/belt/utility/chief/debug/full	// [CELADON-EDIT] - OMNI_TOOLS

/datum/outfit/job/clip/minutemen/captain/general/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
	return ..()

/datum/outfit/job/inteq/captain/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
	return ..()

/datum/outfit/job/nanotrasen/captain/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
	return ..()

/datum/outfit/job/nanotrasen/hop/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
	return ..()

/datum/outfit/job/nanotrasen/ce/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
	return ..()

/obj/item/clothing/suit/space/hardsuit/engine
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/mining
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/mining/heavy/ns
	armor = list("melee" = 65, "bullet" = 30, "laser" = 25, "energy" = 30, "bomb" = 70, "bio" = 100, "rad" = 85, "fire" = 100, "acid" = 100, "wound" = 30) // [CELADON-EDIT] - CELADON_BALANCE - добавил защиту от ваундов

/obj/item/clothing/head/helmet/space/hardsuit/mining/heavy/ns
	armor = list("melee" = 65, "bullet" = 30, "laser" = 25, "energy" = 30, "bomb" = 70, "bio" = 100, "rad" = 85, "fire" = 100, "acid" = 100, "wound" = 30) // [CELADON-EDIT] - CELADON_BALANCE - добавил защиту от ваундов

/obj/item/clothing/head/helmet/space/hardsuit/syndi/attack_self(mob/user)
	. = ..()
	// [CELADON-ADD] - FIXES_DEBUG_SUIT - фиксим фонарик переключение фонарика
	to_chat(user, span_notice("You turn [on ? "on" : "off"] [src]'s flashlight."))
	playsound(src, on ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)
	// [/CELADON-ADD]

/obj/item/clothing/suit/space/hardsuit/syndi
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL, BALANCE
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	combat_slowdown = 0.2
	// [/CELADON - EDIT]

//Ramzi Syndie suit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/ramzi
	name = "rust-red hardsuit helmet"
	desc = "A beat-up standardized dual-mode helmet derived from more advanced special operations helmets, its red rusted into a dirty brown. It is in EVA mode. Manufactured by Ramzi Clique."
	alt_desc = "A beat-up standardized dual-mode helmet derived from more advanced special operations helmets, its red rusted into a dirty brown. It is in travel mode. Manufactured by Ramzi Clique."
	icon_state = "hardsuit1-ramzi"
	item_state = "hardsuit1-ramzi"
	hardsuit_type = "ramzi"
	armor = list("melee" = 35, "bullet" = 40, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/syndi/cybersun
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = VOX_VARIATION | KEPORI_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/syndi/cybersun/paramed
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/medical
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/bomb
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/head/helmet/space/hardsuit/security
	// [CELADON-EDIT] - CELADON_VOX - WTF у них же есть даже в атласе спрайт...
	supports_variations = SNOUTED_VARIATION | VOX_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/security
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/security/hos
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/shielded/syndi
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100, "wound" = 30) // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/head/helmet/space/hardsuit/security/independent
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = VOX_VARIATION | SNOUTED_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/head/helmet/space/hardsuit/security/independent
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = VOX_VARIATION | SNOUTED_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/security/independent
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	supports_variations = VOX_VARIATION | DIGITIGRADE_VARIATION | TAJARA_VARIATION | RIOL_VARIATION
	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/deathsquad
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 60, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 60)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/space/swat
	armor = list("melee" = 40, "bullet" = 30, "laser" = 30,"energy" = 40, "bomb" = 50, "bio" = 90, "rad" = 20, "fire" = 100, "acid" = 100, "wound" = 20)  // [CELADON-EDIT] - CELADON_BALANCE

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	//ERT Clown
/obj/item/clothing/head/helmet/space/hardsuit/ert/clown
	name = "emergency response team clown helmet"
	desc = "The integrated helmet of an ERT hardsuit, this one is colourful!"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet_on_mob.dmi'
	icon_state = "hardsuit0-ert_clown"
	item_state = "hardsuit0-ert_clown"
	hardsuit_type = "ert_clown"

/obj/item/clothing/suit/space/hardsuit/ert/clown
	name = "emergency response team clown hardsuit"
	desc = "The non-standard issue hardsuit of the ERT, this one is colourful! Offers superb protection against environmental hazards. Does not offer superb protection against a ravaging crew."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_on_mob.dmi'
	icon_state = "ert_clown"
	item_state = "ert_clown"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/clown
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/head/helmet/space/plasmaman/mime
	name = "mime envirosuit helmet"
	desc = "The make-up is painted on, it's a miracle it doesn't chip. It's not very colourful."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet_on_mob.dmi'
	icon_state = "mime_envirohelm"
	item_state = "mime_envirohelm"
	visor_icon = "mime_envisor"

/obj/item/clothing/head/helmet/space/plasmaman/clown
	name = "clown envirosuit helmet"
	desc = "The make-up is painted on, it's a miracle it doesn't chip. <i>'HONK!'</i>"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/spacesuits_helmet_on_mob.dmi'
	icon_state = "clown_envirohelm"
	item_state = "clown_envirohelm"
	visor_icon = "clown_envisor"
	smile_state = "clown_smile"
// [/CELADON-ADD]

/obj/item/clothing/suit/hooded/cloak/drake
	armor = list("melee" = 50, "bullet" = 10, "laser" = 40, "energy" = 50, "bomb" = 50, "bio" = 60, "rad" = 50, "fire" = 100, "acid" = 100, "wound" = 50)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/clothing/suit/hooded/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TRY_STORAGE_CAN_INSERT, PROC_REF(on_can_insert))	// [CELADON-ADD] - FIXES_HOODED_ICONS

/obj/item/clothing/suit/hooded/wintercoat/science/Initialize()
	allowed -= list(
	// [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички
		/obj/item/melee/classic_baton/telescopic,
	// [/CELADON-REMOVE]
	)
	return ..()

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/under/plasmaman/mime
	name = "mime envirosuit"
	desc = "It's not very colourful."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/plasmaman.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/plasmaman.dmi'
	icon_state = "mime_envirosuit"
	item_state = "mime_envirosuit"

/obj/item/clothing/under/plasmaman/clown
	name = "clown envirosuit"
	desc = "<i>'HONK!'</i>"
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/plasmaman.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/plasmaman.dmi'
	icon_state = "clown_envirosuit"
	item_state = "clown_envirosuit"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/under/plasmaman/clown/Extinguish(mob/living/carbon/human/H)
	if(!istype(H))
		return

	if(H.on_fire)
		if(extinguishes_left)
			if(next_extinguish > world.time)
				return
			next_extinguish = world.time + extinguish_cooldown
			extinguishes_left--
			H.visible_message(span_warning("[H]'s suit spews out a tonne of space lube!"),span_warning("Your suit spews out a tonne of space lube!"))
			H.extinguish_mob()
			new /obj/effect/particle_effect/foam(loc) //Truely terrifying.
	return 0
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/clothing/under/plasmaman/mime/skirt //WS edit plasmaman customization
	name = "mime enviroskirt"
	desc = "It's very colourful on the inside."
	icon_state = "mime_enviroskirt"
	item_state = "mime_enviroskirt"
// [/CELADON-ADD]

/datum/round_event_control/fax_spam
	max_occurrences = 0 // [CELADON-REMOVE] - NEVER_TEXT_ME_AGAIN - НЕ ПИШИ СЮДА БОЛЬШЕ

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/effect/hallucination/simple/clown
	image_icon = 'icons/mob/animal.dmi'
	image_state = "clown"

/obj/effect/hallucination/simple/clown/Initialize(mapload, mob/living/carbon/T, duration)
	..(loc, T)
	name = pick(GLOB.clown_names)
	QDEL_IN(src,duration)

/obj/effect/hallucination/simple/clown/scary
	image_state = "scary_clown"
// [/CELADON-ADD]

/datum/crafting_recipe/food/wrap
	category = parent_type::category
	subcategory = CAT_EGG

/datum/crafting_recipe/food/chawanmushi
	category = parent_type::category
	subcategory = CAT_EGG

/datum/crafting_recipe/food/loadedbakedpotato
	category = parent_type::category
	subcategory = CAT_MISCFOOD

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
///////////////////////////
//Spookoween Insane Clown//
///////////////////////////

///Insane clown mob. Basically a clown that haunts you.
/mob/living/simple_animal/hostile/clown_insane
	name = "insane clown"
	desc = "Some clowns do not manage to be accepted, and go insane. This is one of them."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/clown_mobs.dmi'
	icon_state = "scary_clown"
	icon_living = "scary_clown"
	icon_dead = "scary_clown"
	icon_gib = "scary_clown"
	speak = list("...", ". . .")
	maxHealth = 1e6
	health = 1e6
	emote_see = list("silently stares")
	unsuitable_atmos_damage = 0
	var/timer

/mob/living/simple_animal/hostile/clown_insane/Initialize()
	. = ..()
	status_flags |= GODMODE //Slightly easier to maintain.

/mob/living/simple_animal/hostile/clown_insane/Destroy()
	timer = null
	return ..()

/mob/living/simple_animal/hostile/clown_insane/ex_act()
	return

///Adds a timer to call stalk() on Aggro
/mob/living/simple_animal/hostile/clown_insane/Aggro()
	. = ..()
	timer = addtimer(CALLBACK(src, PROC_REF(stalk)), 30, TIMER_STOPPABLE|TIMER_UNIQUE)

/mob/living/simple_animal/hostile/clown_insane/LoseAggro()
	. = ..()
	if(timer)
		deltimer(timer)
		timer = null

///Plays scary noises and adds some timers.
/mob/living/simple_animal/hostile/clown_insane/proc/stalk()
	var/mob/living/M = target
	if(!istype(M))
		LoseAggro()
		return
	if(M.stat == DEAD)
		playsound(M.loc, 'sound/spookoween/insane_low_laugh.ogg', 100, TRUE)
		qdel(src)
		return
	playsound(M, pick('sound/spookoween/scary_horn.ogg','sound/spookoween/scary_horn2.ogg', 'sound/spookoween/scary_horn3.ogg'), 100, TRUE)
	timer = addtimer(CALLBACK(src, PROC_REF(stalk)), 30, TIMER_STOPPABLE|TIMER_UNIQUE)
	addtimer(CALLBACK(src, PROC_REF(teleport_to_target)), 12, TIMER_STOPPABLE|TIMER_UNIQUE)

///Does what's in the name. Teleports to target.loc. Called from a timer.
/mob/living/simple_animal/hostile/clown_insane/proc/teleport_to_target()
	if(target && isturf(target.loc)) //Hiding in lockers works to get rid of this thing.
		forceMove(target.loc)

/mob/living/simple_animal/hostile/clown_insane/MoveToTarget()
	return

/mob/living/simple_animal/hostile/clown_insane/AttackingTarget()
	return

/mob/living/simple_animal/hostile/clown_insane/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = 0
	if(prob(5))
		playsound(loc, 'sound/spookoween/insane_low_laugh.ogg', 300, TRUE)

/mob/living/simple_animal/hostile/clown_insane/handle_temperature_damage()
	return
// [/CELADON-ADD]

/obj/item/seeds/banana/Initialize(mapload)
	mutatelist |= list(/obj/item/seeds/banana/mime)
	return ..()

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
// Mimana - invisible sprites are totally a feature!
/obj/item/seeds/banana/mime
	name = "pack of mimana seeds"
	desc = "They're seeds that grow into mimana trees. When grown, keep away from mime."
	icon = 'icons/obj/hydroponics/seeds.dmi'
	growing_icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/growing_fruits.dmi'
	icon_state = "seed-mimana"
	species = "mimana"
	plantname = "Mimana Tree"
	product = /obj/item/food/grown/banana/mime
	growthstages = 4
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nothing = 0.1, /datum/reagent/toxin/mutetoxin = 0.1, /datum/reagent/consumable/nutriment = 0.02)
	rarity = 15
	research = PLANT_RESEARCH_TIER_2

/obj/item/food/grown/banana/mime
	seed = /obj/item/seeds/banana/mime
	name = "mimana"
	desc = "It's an excellent prop for a mime."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/harvest.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/food_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/food_righthand.dmi'
	icon_state = "mimana"
	trash_type = /obj/item/grown/bananapeel/mimanapeel
	filling_color = "#FFFFEE"
	distill_reagent = /datum/reagent/consumable/ethanol/silencer

/obj/item/grown/bananapeel/mimanapeel
	seed = /obj/item/seeds/banana/mime
	name = "mimana peel"
	desc = "A mimana peel."
	icon = 'mod_celadon/_storage_icons/icons/other/clown_mime/harvest.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/food_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/other/clown_mime/food_righthand.dmi'
	icon_state = "mimana_peel"
	item_state = "mimana_peel"
// [/CELADON-ADD]

/obj/item/seeds/peas/laugh/Initialize(mapload)
	reagents_add += list(/datum/reagent/consumable/laughter = 0.05)
	return ..()

/obj/item/food/grown/tomato/blue
	distill_reagent = /datum/reagent/consumable/laughter	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/instrument/fun/honk
	name = "!!HONK!!"
	id = "honk"
	real_samples = list("74"='sound/items/bikehorn.ogg') // Cluwne Heaven
// [/CELADON-ADD]

/get_all_jobs()
	return ..() | list("Clown", "Mime")

/datum/outfit/job/cmo
	backpack_contents = parent_type::backpack_contents // [CELADON-REMOVE] - CELADON_BALANCE - Убираем телескопички

/datum/outfit/job/head_of_personnel/New()
	backpack_contents -= list(/obj/item/melee/classic_baton/telescopic) // [CELADON-EDIT] - CELADON_BALANCE - Убираем телескопички
	return ..()

/obj/machinery/drill/process(seconds_per_tick)
	. = ..()
	// [CELADON-ADD] - CELADON_FIXES - FIXES_DRILLCLASS - Дополнительная проверка для буров миссии
	if(istype(src, /obj/machinery/drill/mission) && our_vein?.currently_spawning)
		var/obj/machinery/drill/mission/mission_drill = src
		if(mission_drill.num_current >= mission_drill.num_wanted)
			our_vein.stop_spawning()
	// [/CELADON-ADD]

/obj/machinery/vending/mining_equipment/Initialize(mapload)
	products |= list(/obj/item/clothing/glasses/meson/gar = 2) // [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	return ..()

/obj/structure/vein/classfour
	// [CELADON-ADD] - CELADON_FIXES - FIXES_DRILLCLASS - Балансировка жил класса 4
	max_mobs = 4				// Сбалансированное количество мобов (было 6)
	spawn_time = 12 SECONDS		// Увеличенный интервал спавна (было 8)
	wave_length = 30 SECONDS	// Уменьшено для более динамичной миссии (было 45)
	// [/CELADON-ADD]

/obj/structure/vein/ice/classfour
	// [CELADON-ADD] - CELADON_FIXES - FIXES_DRILLCLASS - Балансировка жил класса 4 (Ice)
	max_mobs = 4				// Уменьшено с 6 до 4
	spawn_time = 12 SECONDS		// Увеличено с 8 до 12 секунд
	wave_length = 30 SECONDS	// Уменьшено с 45 до 30 секунд для более динамичной миссии
	// [/CELADON-ADD]

/obj/structure/vein/rockplanet/classfour
	// [CELADON-EDIT] - CELADON_FIXES - Балансировка жил класса 4 (Rockplanet)
	max_mobs = 4              // Сбалансированное количество мобов (было 6)
	spawn_time = 12 SECONDS   // Увеличенный интервал спавна (было 8)
	wave_length = 30 SECONDS  // Уменьшено для более динамичной миссии (было 45)
	// [/CELADON-EDIT]

/obj/item/clothing/suit/hooded/explorer
	// [CELADON-EDIT] - CELADON_BALANCE
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/resonator,
		/obj/item/mining_scanner,
		/obj/item/t_scanner/adv_mining_scanner,
		/obj/item/pinpointer/mineral,
		/obj/item/gun/energy/kinetic_accelerator,
		/obj/item/pickaxe,
		/obj/item/kinetic_crusher,
	)
	// [/CELADON-EDIT]

// [CELADON-ADD]
/obj/item/clothing/mask/gas/explorer/legacy
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mask/mask_explorer.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mask/overlay/mask_explorer.dmi'
	icon_state = "gas_explorer"
	actions_types = list(/datum/action/item_action/adjust)
// [/CELADON-ADD]

/obj/item/clothing/mask/gas/explorer/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/gas/explorer/adjustmask(user)
	..()
	// [CELADON-EDIT] - CELADON_FIXES
	// w_class = mask_adjusted ? WEIGHT_CLASS_NORMAL : WEIGHT_CLASS_SMALL // CELADON-EDIT - ORIGINAL
	w_class = mask_adjusted ? WEIGHT_CLASS_SMALL : WEIGHT_CLASS_NORMAL
	// [/CELADON-EDIT]

/obj/item/clothing/mask/gas/explorer/folded/Initialize()
	. = ..()
	adjustmask()

/obj/item/clothing/suit/space/hostile_environment
	armor = list("melee" = 70, "bullet" = 40, "laser" = 30, "energy" = 45, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 50)  // [CELADON-EDIT] - CELADON_BALANCE

/obj/item/kinetic_crusher/examine(mob/living/user)
	. = ..()
	// [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY - Возвращаем легенду
	for(var/t in trophies)
		var/obj/item/crusher_trophy/T = t
		. += "<span class='notice'>It has \a [T] attached, which causes [T.effect_desc()].</span>"
	// [/CELADON-ADD]

/obj/item/kinetic_crusher/attack(mob/living/target, mob/living/carbon/user)
	. = ..()
	// [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY - Возвращаем легенду
	for(var/t in trophies)
		if(!QDELETED(target))
			var/obj/item/crusher_trophy/T = t
			T.on_melee_hit(target, user)
	// [/CELADON-ADD]

/obj/item/necromantic_stone/lava/arm_skeleton(mob/living/carbon/human/H)
	. = ..()
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/roman(H), ITEM_SLOT_FEET)
	// [/CELADON-ADD]

/datum/mission/acquire
	desc = "БЛЯТЬ, ОПИСАНИЕ СЛОМАЛОСЬ - СООБЩИТЕ ОБ ЭТОМ СИСТЕМНОМУ АДМИНИСТРАТОРУ!" // [CELADON-EDIT] - CELADON_ECONOMY - Оповещение об ЯВНОЙ ошибке

/datum/mission/drill/classtwo
	value = 4000 // [CELADON-EDIT] - CARGO-REWORK-BALANCE

/datum/mission/drill/classthree
	value = 6000 // [CELADON-EDIT] - CARGO-REWORK-BALANCE

/datum/crew_manifest/ui_status(mob/user, datum/ui_state/state)
	if(!ismob(user) && !user.client)
		return UI_CLOSE
	if(user.stat != DEAD)
		return UI_CLOSE
	return UI_INTERACTIVE

/mob/living/carbon/spray_blood(splatter_direction, splatter_strength = 3)
	if((NOBLOOD in dna.species.species_traits)) // [CELADON - ADD] LANIUS
		return
	return ..()

/mob/living/basic/bear/polar
	mob_trophy = /obj/item/crusher_trophy/bear_paw	// [/CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY

// [CELADON-ADD] - CELADON_EMOTES
/mob/living/carbon/human/proc/get_age_pitch(species_pitch = 85)
	return 1.0 + 0.5 * ((species_pitch * 0.35) - age) / (0.94 * species_pitch)
// [/CELADON-ADD]

/mob/living/carbon/human/mob_negates_gravity()
// [CELADON-EDIT] - CELADON_FIXES
	return shoes?.negates_gravity() || ..()
// [/CELADON-EDIT]

/mob/living/carbon/human/is_exposed(mob/user, target_zone, error_msg)
	return TRUE // [CELADON-REMOVE] - NO-HARDER-REPAIR-IPC

/datum/species/elzuose
	exotic_bloodtype = parent_type::exotic_bloodtype // [CELADON-REMOVE] - CELADON_ETHEREAL_FIX - Тип крови им больше не нужен ибо теперь у них жидкое электричество, перенёс в мод mod_celadon\ethereal_fix\code\ethereal.dm

/datum/action/innate/root
	icon_icon = 'mod_celadon/_storage_icons/icons/structures/obj/flora/plants.dmi' // [CELADON-EDIT] - CELADON_FLORA

/datum/species/ipc
	default_features = list("mcolor" = "#7D7D7D", "ipc_screen" = "Static", "ipc_antenna" = "None", "ipc_chassis" = "Morpheus Cyberkinetics (Custom)", "ipc_tail" = "None", "ipc_brain" = "Posibrain", "body_size" = "Normal") // [CELADON-ADD] - CELADON_IPC_HAIR

/datum/species/kepori
	//[CELADON-EDIT] - CELADON_BALANCE_SPECIES - No more PTITZA combat
	brutemod = 1.5
	burnmod = 1.5
	speedmod = -0.30	// Было -0.10
	//[/CELADON-EDIT]

/datum/species/lizard
	burnmod = 0.85	// [CELADON-ADD] - CELADON_BALANCE_SPECIES - Даем резист к огню на 15%

// [CELADIN-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/mob/living/silicon/robot/modules/clown
	set_module = /obj/item/robot_module/clown
	icon_state = "clown"
// [/CELADIN-ADD]

/obj/machinery/bot_core/secbot
// [CELADON-EDIT] - QoL
//	req_access = list(ACCESS_SECURITY)
	req_access = 0
// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/alien/queen/large
	// [CELADON-ADD] - ALIEN_BALANCE
	armour_penetration = 35
	armor = list("melee" = 50, "bullet" = 50, "laser" = 20, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)
	// [CELADON-ADD]

/mob/living/simple_animal/hostile/human/hermit/survivor/death(gibbed)
	. = ..()
	if(prob(15)) // [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY
		new /obj/item/crusher_trophy/shiny(loc)
		visible_message("<span class='warning'>You notice a glimmering nugget of shiny metal.</span>")

// [CELADON-ADD] - RAMZI-RENEGATE
/mob/living/simple_animal/hostile/viscerator/ramzi
	faction = list(FACTION_RAMZI_RENEGADE, FACTION_RAMZI)
// [/CELADON-ADD]

/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner
	mob_trophy = parent_type::mob_trophy
	crusher_loot = /obj/item/crusher_trophy/miner_eye	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/megafauna/bubblegum/hallucination
	mob_trophy = parent_type::mob_trophy

/mob/living/simple_animal/hostile/megafauna/bubblegum
	crusher_loot = /obj/item/crusher_trophy/demon_claws		// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/megafauna/claw/phase2
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено и заменено в модуле
	mob_trophy = parent_type::mob_trophy
	loot = parent_type::loot
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/megafauna/colossus
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/blaster_tubes	// [/CELADON-EDIT]

/obj/item/clothing/suit/space/hardsuit/cult/enchanted
	armor = list("melee" = 75, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 80, "fire" = 100, "acid" = 100, "wound" = 50)  // [CELADON-EDIT] - CELADON_BALANCE

/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/ice_block_talisman	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/megafauna/dragon
	mob_trophy = parent_type::mob_trophy			// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/ash_spike		// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/megafauna/dragon/lesser
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено и заменено в модуле
	mob_trophy = parent_type::mob_trophy
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/megafauna/hierophant
	mob_trophy = parent_type::mob_trophy			// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/vortex_talisman		// [/CELADON-EDIT]

// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
/mob/living/simple_animal/hostile/megafauna/spawn_mob_trophy()
 	return
// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/megafauna/wendigo
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/demon_claws	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/watcher_wing	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	trophy_drop_mod = parent_type::trophy_drop_mod
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	trophy_drop_mod = parent_type::trophy_drop_mod
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/goliath/beast
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/goliath_tentacle	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient
	mob_trophy = parent_type::mob_trophy

// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
/mob/living/simple_animal/hostile/asteroid/hivelord/spawn_mob_trophy()
	return
// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/hivelord/legion
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf/death(gibbed)
	// [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY
	if(prob(75))
		new /obj/item/crusher_trophy/dwarf_skull(loc)
		visible_message("<span class='warning'>One of the [src]'s skulls looks like it survived.</span>")
	// [/CELADON-ADD]
	return ..()

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/ice_demon/death(gibbed)
	// [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY
	if(prob(10))
		new /obj/item/crusher_trophy/ice_wing(loc)
	// [/CELADON-ADD]
	return ..()

/mob/living/simple_animal/hostile/asteroid/old_demon
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	trophy_drop_mod = parent_type::trophy_drop_mod
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/old_demon/death(gibbed)
	// [CELADON-ADD] - RETURN_CONTENT_CRUSHER_TROPHY
	if(prob(50))
		new /obj/item/crusher_trophy/ice_crystal(loc)
	// [/CELADON-ADD]
	return ..()

/mob/living/simple_animal/hostile/asteroid/ice_whelp
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/tail_spike	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/lobstrosity
	mob_trophy = parent_type::mob_trophy		// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
	crusher_loot = /obj/item/crusher_trophy/lobster_claw	// [/CELADON-EDIT]

// [CELADON-EDIT] - RETURN_CONTENT_CRUSHER_TROPHY
/mob/living/simple_animal/hostile/asteroid/spawn_mob_trophy()
 	return

/mob/living/simple_animal/hostile/asteroid/proc/spawn_crusher_loot()
	if(crusher_loot)
		butcher_results[crusher_loot] = 1
// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/wolf
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	butcher_results = parent_type::butcher_results
	// [/CELADON-REMOVE]
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/wolf/alpha
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	mob_trophy = parent_type::mob_trophy
	// [/CELADON-REMOVE]

/mob/living/simple_animal/hostile/asteroid/elite/broodmother
	loot = list(/obj/item/crusher_trophy/broodmother_tongue)	// [/CELADON-EDIT]

/mob/living/simple_animal/hostile/asteroid/elite/broodmother/rage()
	. = ..()
	childragecall = 1

// [CELADON-ADD] - Возвращает взрыв маленьким голиафам
/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/death()
	. = ..()
	visible_message(span_warning("[src] explodes!"))
	explosion(get_turf(loc),0,0,0,flame_range = 3, adminlog = FALSE)
	gib()
// [CELADON-ADD]

/mob/living/simple_animal/hostile/asteroid/elite/legionnaire
	// [CELADON-REMOVE] - RETURN_CONTENT_CRUSHER_TROPHY - Выпилено ради легенды
	loot_drop = parent_type::loot_drop
	// [/CELADON-REMOVE]

/obj/item/mod/module/hat_stabilizer/Initialize(mapload)
	. = ..()
	attachable_hats_list |= typecacheof(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/head/hardhat/reindeer,
		/obj/item/clothing/head/sombrero,
		/obj/item/clothing/head/rabbitears,
		/obj/item/clothing/head/powdered_wig,
		// [/CELADON-ADD]
	)

/obj/overmap
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	var/obj/token_visuals/move_vec
	var/obj/token_visuals/ship_image

/obj/token_visuals
	glide_size = 32
	mouse_opacity = 0
	// [/CELADON-ADD]

/datum/overmap/event/meteor
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]
	safe_speed = 3
	meteor_types = list(
		/obj/effect/meteor/dust=3,
		/obj/effect/meteor/medium=8,
		/obj/effect/meteor/big=1,
		/obj/effect/meteor/irradiated=3
	)
	primary_ores = list(\
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/iron,
		)

/datum/overmap/event/emp
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	base_icon_state = "emp_moderate_"
	// [/CELADON-EDIT]
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/flare
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/electric
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]
// [CELADON-EDIT] - DANGER_STORM
	var/max_zap_strike = 8
	var/min_zap_strike = 4
// [/CELADON-EDIT]

// [CELADON-EDIT]- DANGER_STORM
/datum/overmap/event/electric/affect_ship(datum/overmap/ship/controlled/S)
	if(!(locate(S) in get_nearby_overmap_objects()))
		return
	var/datum/virtual_level/ship_vlevel = S.shuttle_port.get_virtual_level()
	var/turf/source = ship_vlevel.get_side_turf(pick(GLOB.cardinals))

	var/zap_strike = rand(min_zap_strike, max_zap_strike)
	if(!zap_strike)
		return
	var/obj/machinery/power/cloak/cloaking_system = S.ship_modules[SHIPMODULE_CLOAKING]
	if(cloaking_system?.cloak_active)
		cloaking_system.set_cloak(FALSE)
		cloaking_system.visible_message("[src] is overloaded by the electrical storm and shuts off!")
	for(var/i = 1 to zap_strike)
		if(!(locate(S) in get_nearby_overmap_objects()))
			return

		tesla_zap(source, 32, rand(min_damage, max_damage) * 100, zap_flag)

		for(var/mob/poor_crew as anything in GLOB.player_list)
			if(S.shuttle_port.is_in_shuttle_bounds(poor_crew))
				poor_crew.playsound_local(poor_crew, THUNDER_SOUND, rand(min_damage, max_damage))

		if(i < zap_strike)
			sleep(1 SECONDS)
// [/CELADON-EDIT]

/datum/overmap/event/electric/minor
	max_zap_strike = 4	// [CELADON-EDIT] - DANGER_STORM
	min_zap_strike = 2	// [CELADON-EDIT] - DANGER_STORM

/datum/overmap/event/electric/major
// [CELADON-EDIT] - DANGER_STORM
	zap_flag = ZAP_MAJOR_STORM_FLAGS
	max_zap_strike = 12
	min_zap_strike = 6
// [/CELADON-EDIT]

/datum/overmap/event/nebula
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	token_icon_state = "nebula_1"
	base_icon_state = "nebula_1"
	// [/CELADON-EDIT]
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/meteor/dust
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/anomaly
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/rad
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap/event/meteor/debris
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]
	safe_speed = 3	// [CELADON-ADD] - CELADON_BALANCE_OVERMAP_EVENTS

/datum/overmap/event/meteor/debris/alter_token_appearance()
	. = ..()
	// [CELADON-ADD] - CELADON_BALANCE_OVERMAP_EVENTS
	switch(safe_speed)
		if (1)
			safe_speed = rand(1, 3)
		if (3)
			safe_speed = rand(3, 5)
		if (5)
			safe_speed = rand(5, 7)
	// [CELADON-ADD]

/datum/overmap/event/meteor/debris/major
	safe_speed = 1	// [CELADON-ADD] - CELADON_BALANCE_OVERMAP_EVENTS

/datum/overmap/event/meteor/carp
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	default_color = parent_type::default_color
	// [/CELADON-REMOVE]

/datum/overmap
	// [CELADON-ADD] - OVERMAP SENSORS - Это вагабонд насрал
	var/sensor_range = 1
	// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
/obj/overmap
	var/skip_alarm = 0

/proc/get_pixel_distance(atom/A, atom/B)
	var/x_dist = 0
	var/y_dist = 0

	if(A.x < B.x)
		x_dist = (B.x-A.x)*32-A.pixel_w+B.pixel_w
	else if(A.x > B.x)
		x_dist = (A.x-B.x)*32+A.pixel_w-B.pixel_w
	else
		if(A.pixel_w < B.pixel_w)
			x_dist = B.pixel_w-A.pixel_w
		else if(A.pixel_w > B.pixel_w)
			x_dist = A.pixel_w-B.pixel_w

	if(A.y < B.y)
		y_dist = (B.y-A.y)*32-A.pixel_z+B.pixel_z
	else if(A.y > B.y)
		y_dist = (A.y-B.y)*32+A.pixel_z-B.pixel_z
	else
		if(A.pixel_z < B.pixel_z)
			y_dist = B.pixel_z-A.pixel_z
		else if(A.pixel_z > B.pixel_z)
			y_dist = A.pixel_z-B.pixel_z

	return abs(x_dist)+abs(y_dist)
// [/CELADON-ADD]

/datum/overmap/star/dwarf
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	token_icon_state = "dwarf"
	// [/CELADON-EDIT]

/datum/overmap/star/dwarf/orange
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	token_icon_state = "dwarf-orange"
	// [/CELADON-ADD]

/datum/overmap/star/dwarf/brown
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	token_icon_state = "dwarf-brown"
	// [/CELADON-EDIT]

/datum/overmap/star/dwarf/white
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	token_icon_state = "dwarf-white"
	// [/CELADON-ADD]

/datum/overmap/star/medium
	token_icon_state = "medium"

/datum/overmap/star/medium/blue
	token_icon_state = "medium-blue"

/datum/overmap/star/medium/bluewhite
	token_icon_state = "medium-bluewhite"

/datum/overmap/star/medium/white
	token_icon_state = "medium-white"

/datum/overmap/star/medium/orange
	token_icon_state = "medium-orange"

/datum/overmap/star/giant
	token_icon_state = "giant"

/datum/overmap/star/giant/yellow
	token_icon_state = "giant-yellow"

/datum/overmap/star/giant/red
	token_icon_state = "giant-red"

/datum/overmap/star/singularity
	token_icon_state = "blackhole"

/datum/overmap/outpost
	hangar_ztraits = list(
		ZTRAIT_SUN_TYPE = STATIC_EXPOSED,
		ZTRAIT_GRAVITY = STANDARD_GRAVITY,
		ZTRAIT_SCAN_DISRUPT = TRUE, // [CELADON-EDIT] - CELADON_SURVEY_HANDHELD
	)
	hangar_ztraits = list(
		ZTRAIT_SUN_TYPE = STATIC_EXPOSED,
		ZTRAIT_GRAVITY = STANDARD_GRAVITY,
		ZTRAIT_SCAN_DISRUPT = TRUE, // [CELADON-EDIT] - CELADON_SURVEY_HANDHELD
	)

/datum/planet_type
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	var/icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap.dmi'
	var/pixel_w = 0
	var/pixel_z = 0
	// [/CELADON-ADD]

/datum/planet_type/lava
	icon_state = "volcano"
	color = parent_type::color

/datum/planet_type/ice
	icon_state = "ice"
	color = parent_type::color

/datum/planet_type/jungle
	icon_state = "jungle"
	color = parent_type::color

/datum/planet_type/rock
	color = parent_type::color

/datum/planet_type/sand
	color = parent_type::color

/datum/planet_type/beach
	color = parent_type::color

/datum/planet_type/waste
	color = parent_type::color

/datum/planet_type/gas_giant
	icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap_large.dmi'
	pixel_w = -8
	pixel_z = -8
	color = parent_type::color

/datum/overmap/ship/controlled
	// [CELADON-ADD] - OVERMAP SENSORS
	var/default_sensor_range = 4
	// [/CELADON-ADD]
	/// [CELADON-ADD] Таймер, что даёт время на становление пиратами или пацифистами для независимых суден.
	COOLDOWN_DECLARE(rename_prefix_cooldown)
	/// [/CELADON-ADD]

/datum/overmap/outpost // Это тут потому-что если верхнее перепишется, то нижнее тоже. Срать вечно 🤙
	var/obj/item/radio/intercom/wideband/radio
	// [/CELADON-ADD]

/datum/overmap/ship/controlled/proc/get_faction()
	return source_template.faction

// [CELADON-ADD] - Well Done act
/obj/item/key/ship/microwave_act(obj/machinery/microwave/M)
	well_done = TRUE
// [/CELADON-ADD]

/datum/overmap/ship
	token_icon_state = "ship_point"
// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	///For bay overmap
	var/x_pixels_moved = 0
	var/y_pixels_moved = 0

	var/list/position_to_move = list("x" = 0, "y" = 0)
	var/list/last_anim = list("x" = 0, "y" = 0)
	var/list/vector_to_add = list("x" = 0, "y" = 0)

	var/list/arpa = list()

	var/bow_heading = 0
	var/rotating = 0
	var/rotation_velocity = 0

	var/skiptickfortrail = 0
	// [CELADON-EDIT] - Убираем предупреждение валидатора; [CELADON-EDIT] - Добавлены ковычки для запуска на 516
#if DM_VERSION >= 516
	var/list/obj/shiptrail/trails = alist(1 = null,
							2 = null,
							3 = null)
#else
	var/list/obj/shiptrail/trails = list(1 = null,
							2 = null,
							3 = null)
#endif
	// [/CELADON-EDIT]

/datum/overmap/ship/proc/check_proximity()
//	token.collision_alarm()
	var/list/arpa_add = list()
	for(var/obj/overmap/rendered/i in orange(4, token))
		calculate_cpa(src, i.parent)
		arpa_add |= i.parent
	return arpa_add
// [/CELADON-ADD]

/datum/overmap/ship/process(seconds_per_tick)
	if((burn_direction == BURN_STOP && is_still()) || docked_to || docking)
		change_heading(BURN_NONE)
		return
	var/newx = 0
	var/newy = 0
	if(burn_direction == BURN_STOP)
		if(speed_x > 0)
			newx = -min(speed_x, burn_engines(burn_percentage, seconds_per_tick))
		else
			newx = min(-speed_x, burn_engines(burn_percentage, seconds_per_tick))
		if(speed_y > 0)
			newy = -min(speed_y, burn_engines(burn_percentage, seconds_per_tick))
		else
			newy = min(-speed_y, burn_engines(burn_percentage, seconds_per_tick))
	else
		switch(burn_direction)
			if(NORTH)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading)
			if(SOUTH)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+180)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+180)
			if(WEST)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+270)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+270)
			if(EAST)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+90)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+90)

	adjust_speed(newx, newy)

/obj/item/ammo_casing/a300/trac
	bullet_skin = parent_type::bullet_skin

/obj/item/ammo_box/magazine/ammo_stack
// [CELADON-ADD] - ADD_MOD_BULLET_STACK - Загружает путь если из мода, иначе дефолтный
	var/base_icon = null
// [/CELADON-ADD]
	item_flags = NO_PIXEL_RANDOM_DROP | NO_ROTATE_RANDOM_THROW	// [CELADON-EDIT]

// [CELADON-ADD] - HOTKEY-RELOAD - Возвращает переключение режимов стрельбы на кнопку перезарядки
/obj/item/gun/energy/unique_action(mob/living/user)
	if(ammo_type.len > 1)
		select_fire(user)
		update_appearance()
// [/CELADON-ADD]

/obj/item/gun/energy/unsafe_shot(target)
	// [CELADON-ADD] - FIXES_LOCKER_RECHARGE_ENERGYGUN
	if(!can_shoot())
		return
	// [/CELADON-ADD]
	return ..()

/obj/item/gun/ballistic/automatic/powered/gauss
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/gauss_hands_left.dmi'		// [CELADON-EDIT]
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/gauss_hands_right.dmi'	// [/CELADON-EDIT]
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/pgauss.dmi'	// [/CELADON-EDIT]
	item_state = "gauss"	// [/CELADON-EDIT]

/obj/item/minigunpack/process(seconds_per_tick)
	overheat = max(0, overheat - heat_diffusion * seconds_per_tick)	// [CELADON-EDIT]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
/datum/reagent/consumable/banana/on_mob_life(mob/living/carbon/M)
	if((ishuman(M) && M.job == "Clown") || ismonkey(M))
		M.heal_bodypart_damage(1,1, 0)
		. = 1
	..()
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/reagent/consumable/nothing/on_mob_life(mob/living/carbon/M)
	if(ishuman(M) && M.mind?.miming)
		M.silent = max(M.silent, MIMEDRINK_SILENCE_DURATION)
		M.heal_bodypart_damage(1,1)
		. = 1
	..()

/datum/reagent/consumable/laughter
	name = "Laughter"
	description = "Some say that this is the best medicine, but recent studies have proven that to be untrue."
	metabolization_rate = INFINITY
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/laughter/on_mob_life(mob/living/carbon/M)
	M.emote("laugh")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_laughter)
	..()

/datum/reagent/consumable/superlaughter
	name = "Super Laughter"
	description = "Funny until you're the one laughing."
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/superlaughter/on_mob_life(mob/living/carbon/M)
	if(prob(30))
		M.visible_message(span_danger("[M] bursts out into a fit of uncontrollable laughter!"), span_userdanger("You burst out in a fit of uncontrollable laughter!"))
		M.Stun(5)
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_superlaughter)
	..()
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNSS
/datum/reagent/consumable/clownstears
	name = "Clown's Tears"
	description = "The sorrow and melancholy of a thousand bereaved clowns, forever denied their Honkmechs."
	nutriment_factor = 5 * REAGENTS_METABOLISM
	color = "#eef442" // rgb: 238, 244, 66
	taste_description = "mournful honking"
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_QUIRKS
/datum/reagent/toxin/mindbreaker/on_mob_life(mob/living/carbon/M)
	if(!M.has_quirk(/datum/quirk/insanity))
		M.hallucination += 5
	return ..()
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/reagent/toxin/mimesbane
	name = "Mime's Bane"
	description = "A nonlethal neurotoxin that interferes with the victim's ability to gesture."
	silent_toxin = TRUE
	color = "#F0F8FF" // rgb: 240, 248, 255
	toxpwr = 0
	taste_description = "stillness"

/datum/reagent/toxin/mimesbane/on_mob_metabolize(mob/living/L)
	ADD_TRAIT(L, TRAIT_EMOTEMUTE, type)

/datum/reagent/toxin/mimesbane/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_EMOTEMUTE, type)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/chemical_reaction/laughter
	results = list(/datum/reagent/consumable/laughter = 10) // Fuck it. I'm not touching this one.
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/banana = 1)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/chemical_reaction/mimesbane
	results = list(/datum/reagent/toxin/mimesbane = 3)
	required_reagents = list(/datum/reagent/uranium/radium = 1, /datum/reagent/toxin/mutetoxin = 1, /datum/reagent/consumable/nothing = 1)
// [CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/reagent_containers/borghypo/clown
	name = "laughter injector"
	desc = "Keeps the crew happy and productive!"
	reagent_ids = list(/datum/reagent/consumable/laughter)
	accepts_reagent_upgrades = FALSE

/obj/item/reagent_containers/borghypo/clown/hacked
	name = "laughter injector"
	desc = "Keeps the crew so happy they don't work!"
	reagent_ids = list(/datum/reagent/consumable/superlaughter)
	accepts_reagent_upgrades = FALSE
// [CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/reagent_containers/glass/bottle/pierrot_throat
	name = "Pierrot's Throat culture bottle"
	desc = "A small bottle. Contains H0NI<42 virion culture in synthblood medium."
	spawned_disease = /datum/disease/pierrot_throat
// [CELADON-ADD]

/obj/item/reagent_containers/hypospray/medipen/oculine
	custom_price = 70 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 100

/obj/item/reagent_containers/hypospray/medipen/inacusiate
	custom_price = 70 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 100

/obj/item/reagent_containers/hypospray/medipen/atropine
	custom_price = 75 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // custom_price = 100

/obj/item/reagent_containers/hypospray/medipen/diphen
	custom_price = 50 // [CELADON-ADD] - OUTPOST_MED_BALANCE

/obj/item/reagent_containers/hypospray/medipen/cureall
	custom_price = 50 // [CELADON-ADD] - OUTPOST_MED_BALANCE

/obj/item/reagent_containers/hypospray/medipen/mannitol
	custom_price = 70 // [CELADON-ADD] - OUTPOST_MED_BALANCE

/obj/item/reagent_containers/hypospray/medipen/neurine
	custom_price = 70 // [CELADON-ADD] - OUTPOST_MED_BALANCE

/datum/design/leftarm
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	// category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL) // CELADON-EDIT - ORIGINAL
	category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL,SPECIES_TAJARA,SPECIES_RIOL)
	// [/CELADON-EDIT]

/datum/design/rightarm
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	// category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL) // CELADON-EDIT - ORIGINAL
	category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL,SPECIES_TAJARA,SPECIES_RIOL)
	// [/CELADON-EDIT]

/datum/design/leftleg
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	// category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL) // CELADON-EDIT - ORIGINAL
	category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL,SPECIES_TAJARA,SPECIES_RIOL)
	// [/CELADON-EDIT]

/datum/design/rightleg
	// [CELADON-EDIT] - TAJARA, CELADON_RIOL
	// category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL) // CELADON-EDIT - ORIGINAL
	category = list("initial",SPECIES_HUMAN,SPECIES_SARATHI,SPECIES_MOTH,SPECIES_PLASMAMAN,SPECIES_ELZUOSE,SPECIES_RACHNID,SPECIES_VOX,SPECIES_KEPORI,SPECIES_ABDUCTOR,SPECIES_FLYPERSON,SPECIES_POD,SPECIES_SKELETON,SPECIES_SNAIL,SPECIES_TAJARA,SPECIES_RIOL)
	// [/CELADON-EDIT]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/design/board/honker_main
	name = "\"H.O.N.K\" Central Control module"
	desc = "Allows for the construction of a \"H.O.N.K\" Central Control module."
	id = "honker_main"
	build_path = /obj/item/circuitboard/mecha/honker/main
	category = list("Exosuit Modules")

/datum/design/board/honker_peri
	name = "\"H.O.N.K\" Peripherals Control module"
	desc = "Allows for the construction of a \"H.O.N.K\" Peripheral Control module."
	id = "honker_peri"
	build_path = /obj/item/circuitboard/mecha/honker/peripherals
	category = list("Exosuit Modules")

/datum/design/board/honker_targ
	name = "\"H.O.N.K\" Weapons & Targeting Control module"
	desc = "Allows for the construction of a \"H.O.N.K\" Weapons & Targeting Control module."
	id = "honker_targ"
	build_path = /obj/item/circuitboard/mecha/honker/targeting
	category = list("Exosuit Modules")
// [CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
//H.O.N.K
/datum/design/honk_chassis
	name = "Exosuit Chassis (\"H.O.N.K\")"
	id = "honk_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/honker
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("H.O.N.K")

/datum/design/honk_torso
	name = "Exosuit Torso (\"H.O.N.K\")"
	id = "honk_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass = 10000,/datum/material/hellstone=10000)
	construction_time = 300
	category = list("H.O.N.K")

/datum/design/honk_head
	name = "Exosuit Head (\"H.O.N.K\")"
	id = "honk_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_head
	materials = list(/datum/material/iron=10000,/datum/material/glass = 5000,/datum/material/hellstone=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_left_arm
	name = "Exosuit Left Arm (\"H.O.N.K\")"
	id = "honk_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_left_arm
	materials = list(/datum/material/iron=15000,/datum/material/hellstone=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_right_arm
	name = "Exosuit Right Arm (\"H.O.N.K\")"
	id = "honk_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_arm
	materials = list(/datum/material/iron=15000,/datum/material/hellstone=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_left_leg
	name = "Exosuit Left Leg (\"H.O.N.K\")"
	id = "honk_left_leg"
	build_type = MECHFAB
	build_path =/obj/item/mecha_parts/part/honker_left_leg
	materials = list(/datum/material/iron=20000,/datum/material/hellstone=5000)
	construction_time = 200
	category = list("H.O.N.K")

/datum/design/honk_right_leg
	name = "Exosuit Right Leg (\"H.O.N.K\")"
	id = "honk_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_leg
	materials = list(/datum/material/iron=20000,/datum/material/hellstone=5000)
	construction_time = 200
	category = list("H.O.N.K")
// [CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/design/borg_transform_clown
	name = "Cyborg Upgrade (Clown Module)"
	id = "borg_transform_clown"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/clown
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/hellstone = 1000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")
// [CELADON-ADD]S

// [CELADON-ADD] - OMNI_TOOLS
/datum/design/healthanalyzer_range
	name = "Long-range Health Analyzer"
	desc = "A handheld body scanner capable of accurately detecting the patient's vital signs from a distance."
	id = "healthanalyzer_ranged"
	build_path = /obj/item/healthanalyzer/ranged
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 2000)
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
// [/CELADON-ADD]

/datum/techweb_node/basic_medical
// [CELADON-EDIT] - OMNI_TOOLS
//	design_ids = list("cybernetic_liver", "cybernetic_heart", "cybernetic_lungs", "cybernetic_stomach", "scalpel", "circular_saw", "bonesetter", "surgical_tape", "surgicaldrill", "retractor", "cautery", "hemostat",
//					"syringe", "plumbing_rcd", "beaker", "large_beaker", "xlarge_beaker", "dropper", "defibmountdefault", "portable_chem_mixer")
	design_ids = list("cybernetic_liver", "cybernetic_heart", "cybernetic_lungs", "cybernetic_stomach", "scalpel", "circular_saw", "bonesetter", "surgical_tape", "surgicaldrill", "retractor", "cautery", "hemostat",
					"syringe", "healthanalyzer", "plumbing_rcd", "beaker", "large_beaker", "xlarge_beaker", "dropper", "defibmountdefault", "portable_chem_mixer")
// [/CELADON-EDIT]

/datum/techweb_node/biotech
// [CELADON-EDIT] - OMNI_TOOLS
//	design_ids = list("sleeper", "chem_heater", "chem_master", "pandemic", "defibrillator", "defibmount", "operating", "soda_dispenser", "beer_dispenser", "healthanalyzer", "medigel", "med_spray_bottle", "chem_pack", "blood_pack", "medical_kiosk", "crewpinpointerprox", "medipen_refiller", "prosthetic_l_arm", "prosthetic_r_arm", "prosthetic_l_leg", "prosthetic_r_leg", "kprosthetic_l_arm", "kprosthetic_r_arm", "kprosthetic_l_leg", "kprosthetic_r_leg", "vprosthetic_l_arm", "vprosthetic_r_arm", "vprosthetic_l_leg", "vprosthetic_r_leg", "lprosthetic_l_arm", "lprosthetic_r_arm", "lprosthetic_l_leg", "lprosthetic_r_leg")
	design_ids = list("sleeper", "chem_heater", "chem_master", "pandemic", "defibrillator", "defibmount", "operating", "soda_dispenser", "beer_dispenser", "healthanalyzer_ranged", "med_spray_bottle", "chem_pack", "blood_pack", "medical_kiosk", "crewpinpointerprox", "medipen_refiller", "prosthetic_l_arm", "prosthetic_r_arm", "prosthetic_l_leg", "prosthetic_r_leg", "kprosthetic_l_arm", "kprosthetic_r_arm", "kprosthetic_l_leg", "kprosthetic_r_leg", "vprosthetic_l_arm", "vprosthetic_r_arm", "vprosthetic_l_leg", "vprosthetic_r_leg", "lprosthetic_l_arm", "lprosthetic_r_arm", "lprosthetic_l_leg", "lprosthetic_r_leg")
// [/CELADON-EDIT]

/datum/techweb_node/comp_recordkeeping
// [CELADON-ADD] - RETURN_SURVEY
//	design_ids = list("secdata", "med_data", "prisonmanage", "vendor", "automated_announcement", "design_disk_elite")
	design_ids = list("secdata", "med_data", "prisonmanage", "vendor", "automated_announcement", "survey-handheld-rnd-exp", "design_disk_elite")
// [/CELADON-ADD]

/datum/techweb_node/exp_tools
// [CELADON-EDIT] - OMNI_TOOLS
//	design_ids = list("jawsoflife", "handdrill", "laserscalpel", "mechanicalpinches", "searingtool")
	design_ids = list("jawsoflife", "handdrill", "tricorder", "adv_gas_analazyer", "laserscalpel", "mechanicalpinches", "searingtool")
// [/CELADON-EDIT]

/datum/techweb_node/basic_shuttle_tech
	// [CELADON-EDIT] - CELADON_BALANCE - Трогаем РнД
	// research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000) // CELADON-EDIT - ORIGINAL
	// export_price = 5000 // CELADON-EDIT - ORIGINAL
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 2500
	// [/CELADON-EDIT]

/obj/structure/lavaland/ash_walker/deconstruct(disassembled)
	// [CELADON-ADD] - RETURN_CONTENT
	new	/obj/effect/collapse(loc)
	// [/CELADON-ADD]
	return ..()

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/effect/proc_holder/spell/voice_of_god/clown
	name = "Voice of Clown"
	desc = "Speak with an incredibly funny voice, startling people into obeying you for a brief moment."
	power_mod = 0.1
	cooldown_mod = 0.5
	spans = list("clown")
	speech_sound = 'sound/spookoween/scary_horn2.ogg'
// [/CELADON-ADD]

/obj/item/bodypart/head/jelly
	is_dimorphic = FALSE // [CELADON-EDIT] - CELADON_SPECIES_CHANGES

/obj/item/organ/stomach/cybernetic
	metabolism_efficiency = 0.07

/obj/item/organ/tongue/Initialize(mapload)
	. = ..()
	var/static/list/additional_languages = typecacheof(list(
		// [CELADON-ADD] - CELADON_ITEMS
		/datum/language/elysm,
		/datum/language/alquadim,
		/datum/language/thayoss,
		/datum/language/fuyo,
		// [/CELADON-ADD]
	))
	languages_possible |= additional_languages

/obj/item/organ/tongue/vox
	// [CELADON-ADD] - CELADON_ACCENTS_ADD
	modifies_speech = TRUE
	// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_ACCENTS_ADD - Добавляем акцент воксам
/obj/item/organ/tongue/vox/handle_speech(datum/source, list/speech_args)
	if(speech_args[SPEECH_LANGUAGE] == /datum/language/vox_pidgin)
		return

	var/static/regex/vox_kk = new("k+", "g")
	var/static/regex/vox_KK = new("K+", "g")
	var/static/regex/vox_ru_kk = new("к+", "g")
	var/static/regex/vox_ru_KK = new("К+", "g")

	var/static/regex/vox_ch = new("ch+", "g")
	var/static/regex/vox_CH = new("ch+", "g")
	var/static/regex/vox_ru_ch = new("ч+", "g")
	var/static/regex/vox_ru_CH = new("Ч+", "g")

	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		if(prob(90))
			message = vox_kk.Replace(message, "kik")
			message = vox_KK.Replace(message, "Kik")
			message = vox_ru_kk.Replace_char(message, "кик")
			message = vox_ru_KK.Replace_char(message, "Кик")
		if(prob(90))
			message = vox_ch.Replace(message, "chich")
			message = vox_CH.Replace(message, "Chich")
			message = vox_ru_ch.Replace_char(message, "чич")
			message = vox_ru_CH.Replace_char(message, "Чич")
	speech_args[SPEECH_MESSAGE] = message
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/obj/item/uplink/clownop/Initialize()
	. = ..()
	var/datum/component/uplink/hidden_uplink = GetComponent(/datum/component/uplink)
	hidden_uplink.set_gamemode(/datum/game_mode/nuclear/clown_ops)
// [/CELADON-ADD]

/datum/uplink_item/bundles_TC/contract_kit
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/bundles_TC/bundle_A
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/bundles_TC/bundle_B
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/dangerous/pie_cannon
	name = "Banana Cream Pie Cannon"
	desc = "A special pie cannon for a special clown, this gadget can hold up to 20 pies and automatically fabricates one every two seconds!"
	cost = 10
	item = /obj/item/pneumatic_cannon/pie/selfcharge
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear/clown_ops)

/datum/uplink_item/dangerous/bananashield
	name = "Bananium Energy Shield"
	desc = "A clown's most powerful defensive weapon, this personal shield provides near immunity to ranged energy attacks \
		by bouncing them back at the ones who fired them. It can also be thrown to bounce off of people, slipping them, \
		and returning to you even if you miss. WARNING: DO NOT ATTEMPT TO STAND ON SHIELD WHILE DEPLOYED, EVEN IF WEARING ANTI-SLIP SHOES."
	item = /obj/item/shield/energy/bananium
	cost = 16
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear/clown_ops)

/datum/uplink_item/dangerous/clownsword
	name = "Bananium Energy Sword"
	desc = "An energy sword that deals no damage, but will slip anyone it contacts, be it by melee attack, thrown \
	impact, or just stepping on it. Beware friendly fire, as even anti-slip shoes will not protect against it."
	item = /obj/item/melee/energy/sword/bananium
	cost = 3
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
// [/CELADON-EDIT]

/datum/uplink_item/dangerous/doublesword
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/sword
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/pistol
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/revolver
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/foamsmg
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/foammachinegun
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/combatglovesplus
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/cqc
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/martialarts
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/crossbow
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/sleepy_pen
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_weapons/suppressor
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/pistol
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/pistolap
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/pistolhp
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/pistolfire
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/revolver
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/bioterror
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/ammo/tec9
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/explosives/bioterrorfoam
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/explosives/buzzkill
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/explosives/virus_grenade
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/explosives/syndicate_detonator
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	S// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/explosives/syndicate_minibomb
// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	exclude_modes = list(/datum/game_mode/nuclear/clown_ops)

/datum/uplink_item/explosives/tearstache
	name = "Teachstache Grenade"
	desc = "A teargas grenade that launches sticky moustaches onto the face of anyone not wearing a clown or mime mask. The moustaches will \
		remain attached to the face of all targets for one minute, preventing the use of breath masks and other such devices."
	item = /obj/item/grenade/chem_grenade/teargas/moustache
	cost = 3
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
// [/CELADON-EDIT]

/datum/uplink_item/explosives/viscerators
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/support/clown_reinforcement
	name = "Clown Reinforcements"
	desc = "Call in an additional clown to share the fun, equipped with full starting gear, but no telecrystals."
	item = /obj/item/antag_spawner/nuke_ops/clown
	cost = 20
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
	restricted = TRUE
// [/CELADON-ADD]

/datum/uplink_item/stealthy_tools/chameleon
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_tools/mulligan
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/stealthy_tools/syndigaloshes
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/suits/infiltrator_bundle
		exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/suits/hardsuit
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops) //you can't buy it in nuke, because the elite hardsuit costs the same while being better	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/suits/hardsuit/elite
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/suits/hardsuit/shielded
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/device_tools/magboots
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/device_tools/failsafe
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/device_tools/medgun
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/device_tools/medkit
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/device_tools/guerillagloves
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/race_restricted
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/role_restricted
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/role_restricted/pie_cannon
	name = "Banana Cream Pie Cannon"
	desc = "A special pie cannon for a special clown, this gadget can hold up to 20 pies and automatically fabricates one every two seconds!"
	cost = 10
	item = /obj/item/pneumatic_cannon/pie/selfcharge
	restricted_roles = list("Clown")
	surplus = 0 //No fun unless you're the clown!
// [//CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/role_restricted/clumsinessinjector //clown ops can buy this too, but it's in the pointless badassery section for them
	name = "Clumsiness Injector"
	desc = "Inject yourself with this to become as clumsy as a clown... or inject someone ELSE with it to make THEM as clumsy as a clown. Useful for clowns who wish to reconnect with their former clownish nature or for clowns who wish to torment and play with their prey before killing them."
	item = /obj/item/dnainjector/clumsymut
	cost = 1
	restricted_roles = list("Clown")
	illegal_tech = FALSE
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/role_restricted/clowncar
	name = "Clown Car"
	desc = "The Clown Car is the ultimate transportation method for any worthy clown! \
			Simply insert your bikehorn and get in, and get ready to have the funniest ride of your life! \
			You can ram any spacemen you come across and stuff them into your car, kidnapping them and locking them inside until \
			someone saves them or they manage to crawl out. Be sure not to ram into any walls or vending machines, as the springloaded seats \
			are very sensitive. Now with our included lube defense mechanism which will protect you against any angry shitcurity! \
			Premium features can be unlocked with a cryptographic sequencer!"
	item = /obj/vehicle/sealed/car/clowncar
	cost = 20
	restricted_roles = list("Clown")
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/role_restricted/mimery
	name = "Guide to Advanced Mimery Series"
	desc = "The classical two part series on how to further hone your mime skills. Upon studying the series, the user should be able to make 3x1 invisible walls, and shoot bullets out of their fingers. \
			Obviously only works for Mimes."
	cost = 12
	item = /obj/item/storage/box/syndie_kit/mimery
	restricted_roles = list("Mime")
	surplus = 0
// [/CELADON-ADD]

/datum/uplink_item/badass/costumes
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/uplink_item/badass/costumes/clown
	name = "Clown Costume"
	desc = "Nothing is more terrifying than clowns with fully automatic weaponry."
	item = /obj/item/storage/backpack/duffelbag/clown/syndie
// [/CELADON-ADD]

/datum/uplink_item/badass/clownopclumsinessinjector //clowns can buy this too, but it's in the role-restricted items section for them
	name = "Clumsiness Injector"
	desc = "Inject yourself with this to become as clumsy as a clown... or inject someone ELSE with it to make THEM as clumsy as a clown. Useful for clown operatives who wish to reconnect with their former clownish nature or for clown operatives who wish to torment and play with their prey before killing them."
	item = /obj/item/dnainjector/clumsymut
	cost = 1
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
	illegal_tech = FALSE

/datum/uplink_item/bundles_TC/surplus
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//exclude_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

/datum/uplink_item/dangerous/bioterror
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)	//include_modes = list(/datum/game_mode/nuclear)	// [CELADON-EDIT] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
//CLOWN CAR ACTION DATUMS
/datum/action/vehicle/sealed/horn
	name = "Honk Horn"
	desc = "Honk your classy horn."
	button_icon_state = "car_horn"
	var/hornsound = 'sound/items/carhorn.ogg'
	var/last_honk_time

/datum/action/vehicle/sealed/horn/Trigger()
	if(world.time - last_honk_time > 20)
		vehicle_entered_target.visible_message(span_danger("[vehicle_entered_target] loudly honks!"))
		to_chat(owner, span_notice("You press the vehicle's horn."))
		playsound(vehicle_entered_target, hornsound, 75)
		last_honk_time = world.time

/datum/action/vehicle/sealed/horn/clowncar/Trigger()
	if(world.time - last_honk_time > 20)
		vehicle_entered_target.visible_message(span_danger("[vehicle_entered_target] loudly honks!"))
		to_chat(owner, span_notice("You press the vehicle's horn."))
		last_honk_time = world.time
		if(vehicle_target.inserted_key)
			vehicle_target.inserted_key.attack_self(owner) //The key plays a sound
		else
			playsound(vehicle_entered_target, hornsound, 75)

/datum/action/vehicle/sealed/DumpKidnappedMobs
	name = "Dump Kidnapped Mobs"
	desc = "Dump all objects and people in your car on the floor."
	button_icon_state = "car_dump"

/datum/action/vehicle/sealed/DumpKidnappedMobs/Trigger()
	vehicle_entered_target.visible_message(span_danger("[vehicle_entered_target] starts dumping the people inside of it."))
	vehicle_entered_target.DumpSpecificMobs(VEHICLE_CONTROL_KIDNAPPED)


/datum/action/vehicle/sealed/RollTheDice
	name = "Press Colorful Button"
	desc = "Press one of those colorful buttons on your display panel!"
	button_icon_state = "car_rtd"

/datum/action/vehicle/sealed/RollTheDice/Trigger()
	if(istype(vehicle_entered_target, /obj/vehicle/sealed/car/clowncar))
		var/obj/vehicle/sealed/car/clowncar/C = vehicle_entered_target
		C.RollTheDice(owner)

/datum/action/vehicle/sealed/Cannon
	name = "Toggle Siege Mode"
	desc = "Destroy them with their own fodder!"
	button_icon_state = "car_cannon"

/datum/action/vehicle/sealed/Cannon/Trigger()
	if(istype(vehicle_entered_target, /obj/vehicle/sealed/car/clowncar))
		var/obj/vehicle/sealed/car/clowncar/C = vehicle_entered_target
		if(C.cannonbusy)
			to_chat(owner, span_notice("Please wait for the vehicle to finish its current action first."))
		C.ToggleCannon()

/datum/action/vehicle/sealed/Thank
	name = "Thank the Clown Car Driver"
	desc = "They're just doing their job."
	button_icon_state = "car_thanktheclown"
	var/last_thank_time

/datum/action/vehicle/sealed/Thank/Trigger()
	if(istype(vehicle_entered_target, /obj/vehicle/sealed/car/clowncar))
		var/obj/vehicle/sealed/car/clowncar/C = vehicle_entered_target
		if(world.time >= last_thank_time + 60)
			var/mob/living/carbon/human/clown = pick(C.return_drivers())
			owner.say("Thank you for the fun ride, [clown.name]!")
			last_thank_time = world.time
			C.ThanksCounter()
// [/CELADON-ADD]

/obj/vehicle/sealed/car/generate_actions()
	. = ..()
// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	if(car_traits & CAN_KIDNAP)
		initialize_controller_action_type(/datum/action/vehicle/sealed/DumpKidnappedMobs, VEHICLE_CONTROL_DRIVE)
// [/CELADON-ADD]

/obj/machinery/vending
	// [CELADON-ADD] - VENDING_CASH - Добавляем вендингам аккаунт для денег
	var/datum/bank_account/vending/bank_account
	// [/CELADON-ADD]

/obj/machinery/vending/autodrobe/Initialize(mapload)
	products |= list(
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/suit/chickensuit = 1,
		/obj/item/clothing/head/chicken = 1,
		/obj/item/clothing/head/beret/vintage = 1,
		/obj/item/clothing/head/beret/archaic = 1,
		/obj/item/clothing/glasses/monocle =1,
		/obj/item/clothing/head/bowler = 1,
		/obj/item/clothing/head/plaguedoctorhat = 1,
		/obj/item/clothing/suit/imperium_monk = 1,
		/obj/item/clothing/suit/chaplainsuit/holidaypriest = 1,
		/obj/item/clothing/suit/chaplainsuit/whiterobe = 1,
		/obj/item/clothing/head/wizard/marisa/fake = 1,
		/obj/item/clothing/suit/wizrobe/marisa/fake = 1,
		/obj/item/clothing/head/witchwig = 1,
		/obj/item/clothing/suit/wizrobe/fake = 1,
		/obj/item/clothing/head/wizard/fake = 1,
		/obj/item/clothing/head/rabbitears =1,
		/obj/item/clothing/head/sombrero = 1,
		/obj/item/clothing/head/sombrero/green = 1,
		/obj/item/clothing/suit/poncho = 1,
		/obj/item/clothing/suit/poncho/green = 1,
		/obj/item/clothing/suit/poncho/red = 1,
		/obj/item/clothing/suit/whitedress = 1,
		/obj/item/clothing/head/jester = 1,
		/obj/item/clothing/suit/hooded/ian_costume = 1,
		/obj/item/clothing/suit/hooded/bee_costume = 1,
		/obj/item/clothing/head/cueball = 1,
		/obj/item/clothing/head/delinquent = 1,
		/obj/item/clothing/head/shrine_wig = 1,
		/obj/item/clothing/suit/shrine_maiden = 1,
		/obj/item/clothing/suit/changshan_red = 1,
		/obj/item/clothing/suit/changshan_blue = 1,
		/obj/item/clothing/suit/cheongsam_red = 1,
		/obj/item/clothing/suit/cheongsam_blue = 1,
		/obj/item/clothing/head/powdered_wig = 1,
		/obj/item/clothing/glasses/sunglasses/garb = 2,
		/obj/item/clothing/under/rank/civilian/clown/blue = 1,
		/obj/item/clothing/under/rank/civilian/clown/green = 1,
		/obj/item/clothing/under/rank/civilian/clown/yellow = 1,
		/obj/item/clothing/under/rank/civilian/clown/orange = 1,
		/obj/item/clothing/under/rank/civilian/clown/purple = 1,
		/obj/item/clothing/mask/gas/sexyclown = 1,
		/obj/item/clothing/under/rank/civilian/clown/sexy = 1,
		/obj/item/clothing/mask/gas/sexymime = 1,
		/obj/item/clothing/under/rank/civilian/clown/jester = 1,
		// [/CELADON-ADD]
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
		/obj/item/clothing/under/rank/civilian/mime/sexy = 1,
		/obj/item/clothing/under/rank/civilian/mime/skirt = 1,
		// [/CELADON-ADD]
	)
	premium |= list(
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
		/obj/item/clothing/under/rank/civilian/clown/rainbow = 1,
		/obj/item/clothing/suit/chaplainsuit/clownpriest = 1,
		/obj/item/clothing/head/clownmitre = 1,
		/obj/item/clothing/shoes/roman = 1,
		/obj/item/clothing/suit/hooded/mysticrobe = 1,
	)
	contraband = list(
		/obj/item/clothing/suit/judgerobe = 1,
		/obj/item/clothing/accessory/fan_mime_pin = 1,
		/obj/item/clothing/accessory/fan_clown_pin = 1,
		/obj/item/clothing/glasses/sunglasses = 2,
		/obj/item/clothing/glasses/blindfold = 1,
		/obj/item/clothing/mask/muzzle = 2,
	)
	// [/CELADON-ADD]
	return ..()

/obj/machinery/vending/boozeomat/Initialize(mapload)
	products |= list(
		// [CELADON-ADD] - CELADON_FOOD_AND_DRINKS
		/obj/item/reagent_containers/food/drinks/soda_cans/synthanol = 10,
		// [/CELADON-ADD]
	)
	return ..()

/obj/machinery/vending/clothing
	default_price = parent_type::default_price
	extra_price = parent_type::extra_price

/obj/machinery/vending/clothing/Initialize(mapload)
	products |= list(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/head/beanie/christmas = 3,
		/obj/item/clothing/head/beanie/rasta = 3,
		/obj/item/clothing/head/kippah = 3,
		/obj/item/clothing/head/taqiyahred = 3,
		/obj/item/clothing/glasses/monocle = 1,
		/obj/item/clothing/head/sombrero = 1,
		/obj/item/clothing/suit/poncho = 1,
		/obj/item/clothing/suit/vapeshirt = 1,
		/obj/item/clothing/neck/cloak/cape = 3,
		/obj/item/clothing/neck/cloak/cape/white = 3,
		/obj/item/clothing/neck/cloak/cape/zavod = 3,
		/obj/item/clothing/neck/cloak/cape/hospital = 3,
		/obj/item/clothing/neck/cloak/cape/armsman = 3,
		/obj/item/clothing/neck/cloak/cape/elysium = 3,
		/obj/item/clothing/neck/cloak/cape/elysium/white = 3,
		/obj/item/clothing/under/el_cloth_1 = 5,
		/obj/item/clothing/under/el_cloth_2 = 5,
		/obj/item/clothing/under/el_cloth_3 = 5,
		/obj/item/clothing/under/el_cloth_4 = 5,
		/obj/item/clothing/head/beret/elysium = 5,
		// [/CELADON-ADD]
	)
	return ..()

/obj/machinery/vending/wallmed
	icon = 'mod_celadon/_storage_icons/icons/resprite/wallmed.dmi' //[CELADON-ADD] - Меняем путь к спрайтам
	default_price = 35 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // default_price = 50
	extra_price = 200 // [CELADON-EDIT] - OUTPOST_MED_BALANCE // extra_price = 100

/obj/machinery/vending/wardrobe/robo_wardrobe/Initialize(mapload)
	contraband |= list(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/suit/hooded/enginseer = 2, // WS edit: enginsineer robes
		// [/CELADON-ADD]
	)
	return ..()

/obj/machinery/vending/wardrobe/chap_wardrobe
	// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	premium = list(/obj/item/clothing/suit/chaplainsuit/bishoprobe = 1,
					/obj/item/clothing/head/bishopmitre = 1)
	// [/CELADON-ADD]

/obj/machinery/vending/wardrobe/chap_wardrobe/Initialize(mapload)
	products |= list(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/suit/chaplainsuit/nun = 1,
		/obj/item/clothing/head/nun_hood = 1,
		/obj/item/clothing/suit/chaplainsuit/holidaypriest = 1,
		/obj/item/clothing/suit/hooded/chaplainsuit/monkhabit = 1,
		/obj/item/clothing/head/kippah = 3,
		/obj/item/clothing/suit/chaplainsuit/whiterobe = 1,
		/obj/item/clothing/head/taqiyahwhite = 1,
		/obj/item/clothing/head/taqiyahred = 3,
		/obj/item/clothing/suit/chaplainsuit/monkrobeeast = 1,
		/obj/item/clothing/head/beanie/rasta = 1,
		// [/CELADON-ADD]
	)
	return ..()

/obj/machinery/vending/wardrobe/viro_wardrobe/Initialize(mapload)
	contraband |= list(
		// [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		/obj/item/clothing/head/plaguedoctorhat = 1,
		// [/CELADON-ADD]
	)
	return ..()

// [CELADON-ADD] - NO_STATIC_SECTOR Опасные стартовые сектора
/datum/overmap_star_system/shiptest/elysium
	has_outpost = TRUE
	override_object_colors = FALSE
	overmap_icon_state = "blank"

/datum/overmap_star_system/shiptest/elysium/ice
	name = "Elysium Controlled - Value of Public Works"
	starname = "Ecbatana"
	startype = /datum/overmap/star/dwarf
	default_outpost_type = /datum/overmap/outpost/elysium_ice

	//main colors, used for dockable terrestrials, and background
	primary_color = "#7e8cd9"
	secondary_color = "#33324a"

	//hazard colors, used for the overmap hazards and sun
	hazard_primary_color = "#ededed"
	hazard_secondary_color = "#7f7db0"

/datum/overmap_star_system/shiptest/elysium/asteroid
	name = "Elysium Controlled - Persei-277"
	starname = "Persei-277"
	startype = /datum/overmap/star/medium
	default_outpost_type = /datum/overmap/outpost/elysium_asteroid

	//main colors, used for dockable terrestrials, and background
	primary_color = "#d9ad82"
	secondary_color = "#c48c60"

	//hazard colors, used for the overmap hazards and sun
	hazard_primary_color = "#c13623"
	hazard_secondary_color = "#943a43"
// [/CELADON-ADD]

/datum/overmap_star_system
	// [CELADON-EDIT] - CELADON_OVERMAP
	tileset = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap.dmi'
	// [/CELADON-EDIT]

/datum/config_entry/number/overmap_encounter_size
	config_entry_value = 191
	min_val = 191

/turf/open/overmap
	icon = 'mod_celadon/_storage_icons/icons/structures/turf/overmap.dmi'
	color = COLOR_GRAY

// [CELADON-ADD] - CELADON_OVERMAP_ICON
/turf/open/overmap/Initialize(mapload, inherited_virtual_z)
	. = ..()
	for(var/i in 1 to 3)
		if(prob(25))
			var/mutable_appearance/background_star = mutable_appearance(icon, "star[rand(1, 16)]")
			background_star.pixel_x = rand(-16, 16)
			background_star.pixel_y = rand(-16, 16)
			overlays += background_star
// [/CELADON-ADD]

/obj/item/clothing/accessory/medal/gold
	vox_override_icon = CELADON_VOX_ACCESSORY_PATH
