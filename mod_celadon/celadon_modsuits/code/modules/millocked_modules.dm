/// I'm sorry for taking this code but well.. I'm shitcoder!
/// Thank you very much for this code! Even if I haven't asked ;(
/// Has been taken from https://github.com/tgstation/tgstation/pull/94467

/// Пример. pre_core_inserted, on_core_inserted, on_core_removed нужно задавать отдельно предмету эти проки.
	/*
	AddComponent(/datum/component/military_locked_module,\
		list(/obj/item/military_tech),\
		prebuilt,\
		tech_removable,\
		PROC_REF(pre_core_inserted),\
		PROC_REF(on_core_inserted),\
		PROC_REF(on_core_removed),\
	)
	*/

/// Данный компонент дает возможность вставлять военные запчасти для модуля модсьюта. Без него модуль не будет работать



/datum/component/military_locked_module
	var/obj/item/military_tech/miltech
	/// Accepted types of things.
	var/list/accepted_tech
	/// If the miltech is removable once socketed.
	var/tech_removable
	/// If the miltech is removable once socketed.
	var/icon_state_changed
	/// A proc to call before the miltech is inserted. Returns an ITEM_INTERACT define, which the component will itself return.
	var/pre_insert_callback
	/// A proc to call when the miltech is inserted.
	var/core_insert_callback
	/// A proc to call when the miltech is removed.
	var/core_remove_callback



/datum/component/military_locked_module/Initialize(list/tech_types, prebuilt = FALSE, removable = TRUE, icon_state_changed = FALSE, pre_insert_callback, insert_callback, remove_callback)
	. = ..()
	// if(!istype(parent, /obj/item/mod/module))
	// 	return COMPONENT_INCOMPATIBLE
	accepted_tech = tech_types
	tech_removable = removable
	src.pre_insert_callback = pre_insert_callback
	core_insert_callback = insert_callback
	core_remove_callback = remove_callback
	if(!(prebuilt && length(tech_types)))
		return
	var/obj/item/military_tech/core_type = pick(tech_types)
	miltech = new core_type(parent)

/datum/component/military_locked_module/Destroy(force)
	QDEL_NULL(miltech)
	return ..()

/datum/component/military_locked_module/RegisterWithParent()
	if(istype(parent,/obj/item/mod/module))
		RegisterSignal(parent, COMSIG_MODULE_TRIGGERED, PROC_REF(on_module_triggered))
	else
		RegisterSignal(parent, COMSIG_ITEM_ATTACK, PROC_REF(on_module_triggered))
	RegisterSignal(parent, COMSIG_ATOM_ATTACKBY, PROC_REF(on_item_interact))
	RegisterSignal(parent, COMSIG_ATOM_TOOL_ACT(TOOL_SCREWDRIVER), PROC_REF(on_screwdriver_act))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_ATOM_UPDATE_ICON_STATE, PROC_REF(on_update_icon_state))

/datum/component/military_locked_module/UnregisterFromParent()
	if(istype(parent,/obj/item/mod/module))
		UnregisterSignal(parent,COMSIG_MODULE_TRIGGERED)
	else
		UnregisterSignal(parent,COMSIG_MODULE_TRIGGERED)
	UnregisterSignal(parent, list(
		COMSIG_ATOM_ATTACKBY,
		COMSIG_ATOM_TOOL_ACT(TOOL_SCREWDRIVER),
		COMSIG_ATOM_EXAMINE,
		COMSIG_ATOM_UPDATE_ICON_STATE,
		))

/datum/component/military_locked_module/proc/on_module_triggered(obj/item/mod/module/source, mob/living/wearer)
	SIGNAL_HANDLER
	if(!miltech)
		source.balloon_alert(wearer, "no miltech!")
		return MOD_ABORT_USE

/datum/component/military_locked_module/proc/on_item_interact(obj/item/mod/module/source, obj/item/tool, mob/living/user, params/*obj/item/mod/module/source, mob/living/user, obj/item/tool, list/modifiers*/)
	SIGNAL_HANDLER
	if(tool.type in accepted_tech)
		if(miltech)
			source.balloon_alert(user, "already has miltech!")
			return FALSE
		if(pre_insert_callback)
			var/callback_return
			if(istype(pre_insert_callback, /datum/callback))
				var/datum/callback/pre_insert_callback_datum = pre_insert_callback
				callback_return = pre_insert_callback_datum.Invoke(user, tool, params)
			else
				callback_return = call(source, pre_insert_callback)(user, tool, params)
			if(callback_return)
				return callback_return
		return insert_core(source, tool, user, params)

/datum/component/military_locked_module/proc/insert_core(obj/item/mod/module/source, obj/item/tool, mob/living/user, params/*obj/item/mod/module/source, mob/living/user, obj/item/tool, list/modifiers*/)
	if(!tool.forceMove(parent))
		return FALSE
	miltech = tool
	source.balloon_alert(user, "miltech inserted")
	playsound(source, 'sound/machines/click.ogg', 30, TRUE)
	source.update_appearance(UPDATE_ICON_STATE)
	if(core_insert_callback)
		if(istype(core_insert_callback, /datum/callback))
			var/datum/callback/core_insert_callback_datum = core_insert_callback
			core_insert_callback_datum.Invoke(miltech, user, params)
		else
			call(source, core_insert_callback)(miltech, user, params)
	return TRUE

/datum/component/military_locked_module/proc/on_screwdriver_act(obj/item/mod/module/source, mob/living/user, obj/item/tool)
	SIGNAL_HANDLER
	if(!miltech)
		source.balloon_alert(user, "no miltech!")
		return FALSE
	if(!tech_removable)
		source.balloon_alert(user, "cannot remove miltech!")
	INVOKE_ASYNC(src, PROC_REF(try_remove_core), source, user, tool)
	return TRUE

/datum/component/military_locked_module/proc/try_remove_core(obj/item/mod/module/source, mob/living/user, obj/item/tool)
	if(!do_after(user, 3 SECONDS, source))
		source.balloon_alert(user, "interrupted!")
		return
	source.balloon_alert(user, "miltech removed")
	miltech.forceMove(source.drop_location())
	if(source.Adjacent(user) && !issilicon(user))
		user.put_in_hands(miltech)
	miltech = null
	source.update_appearance(UPDATE_ICON_STATE)
	if(core_remove_callback)
		if(istype(core_remove_callback, /datum/callback))
			var/datum/callback/core_remove_callback_datum = core_remove_callback
			core_remove_callback_datum.Invoke(miltech, user)
		else
			call(source, core_remove_callback)(miltech, user)

/datum/component/military_locked_module/proc/on_examine(obj/item/mod/module/source, mob/viewer, list/examine_list)
	SIGNAL_HANDLER
	if(!length(accepted_tech))
		return
	if(miltech)
		examine_list += span_notice("There is a [miltech.name] installed in it. [tech_removable ? "You could remove it with a <b>screwdriver</b>..." : "Unfortunately, due to a design quirk, it's unremovable."]")
	else
		var/list/core_list = list()
		for(var/atom/core_path as anything in accepted_tech)
			core_list += initial(core_path.name)
		examine_list += span_notice("You need to insert \a [english_list(core_list, and_text = " or ")] for this module to function.")
		if(!tech_removable)
			examine_list += span_notice("Due to some design quirk, once a miltech is inserted, it won't be removable.")

/datum/component/military_locked_module/proc/on_update_icon_state(obj/item/mod/module/source)
	SIGNAL_HANDLER
	if(icon_state_changed)
		source.icon_state = source::icon_state + (miltech ? "-miltech" : "")

/obj/item/military_tech
	name = "military Tech"
	desc = "For internal use only."
	icon_state = "vortex core"
	item_state = "electronic"
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 2
	throw_speed = 3
	throw_range = 7
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound =  'sound/items/handling/component_pickup.ogg'
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF


/obj/item/military_tech/capacitor
	name = "military Capacitor"
	desc = "A highly advanced piece of technology, required for all high-end suit modules. Incredible durable, versatile and simply overpowered for its size. Property of Humanity. For internal use only."

/obj/item/military_tech/capacitor/examine_more(mob/user)
	. = ..()
	. += span_warning("Данное устройство является слишком комплексным для производства в техфабе. \n\
		Чтобы придать ему оптимальную прочность, максимальную эффективность и безопасность, \
		данное устройство собирается в огромных ассемблерах центральных миров нашей цивилизации, \
		обладающих возможностью почти что идеального управления и точностью над процессом создания. \
		Это то, чем центральные миры гордятся, и это из-за чего крупные фракции не смогут никогда оторваться от них... Возможно.")

/obj/item/military_tech/mod_armor_components
	name = "Modular power armor components"
	desc = "Элементы, крайне необходимые для производства военных экземпляров фракционных МОДсьютов. Их необходимо вставлять в плиты. Представляют собой основной каркас силовой брони, полностью повторяющий движения человека и многократно усиливающий его. Состоит из многослойных электроактивных полимеров нового поколения с вплетёнными углеродными нанотрубками."
