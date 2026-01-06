/*
MARK: ARMOR BOOSTER
*/
/obj/item/mod/module/armor_booster/civilian
	name = "MOD civilian armor booster module"
	desc = "One of the newest technologies in the MOD sphere - armor booster - resembles special weave under main armor plates. \
		Once under voltage, this \"power-weave\" gets less flexible, but hardens on hit, dampening it. \
		While it's a high-end technology, it still has it's downsides: \
		the required voltage is too extreme to run alongside EVA systems. \n\
		This civilian model is more focused on comfort and uses excessive voltage to help operator with MOD's weight distribution."
	armor_values = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 5)
	complexity = 3

/obj/item/mod/module/armor_booster/heavy
	name = "MOD heavy armor booster module"
	desc ="One of the newest technologies in the MOD sphere armor booster resembles special weave under main armor plates. \
		Once under voltage, this \"power-weave\" gets less flexible, but hardens on hit, dampening it. \
		While it's a high-end technology, it still has it's downsides: the required voltage is too extreme to run alongside EVA systems. \n\
		The heavy variant runs on enormous voltage, compared to other models, which makes the weave barely flexible, severely limiting operator's movement."
	active_power_cost = DEFAULT_CHARGE_DRAIN
	removable = TRUE
	complexity = 3
	cooldown_time = 0.5 SECONDS
	overlay_state_inactive = "module_armorbooster_off"
	overlay_state_active = "module_armorbooster_on"
	use_mod_colors = TRUE
	remove_pressure_protection = TRUE
	speed_added = -0.5
	/// Armor values added to the suit parts.
	armor_values = list("melee" = 15, "bullet" = 20, "laser" = 15, "energy" = 15)

/obj/item/mod/module/armor_booster/light
	name = "MOD light armor booster module"
	desc = "One of the newest technologies in the MOD sphere armor booster resembles special weave under main armor plates. \
		Once under voltage, this \"power-weave\" gets less flexible, but hardens on hit, dampening it. \
		While it's a high-end technology, it still has it's downsides: the required voltage is too extreme to run alongside EVA systems. \n\
		The light variant combines decent comfort and protection and runs on nominal voltages."
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	removable = TRUE
	complexity = 2
	incompatible_modules = list(/obj/item/mod/module/armor_booster, /obj/item/mod/module/welding)
	cooldown_time = 0.5 SECONDS
	overlay_state_inactive = "module_armorbooster_off"
	overlay_state_active = "module_armorbooster_on"
	use_mod_colors = TRUE
	remove_pressure_protection = TRUE
	speed_added = 0
	/// Armor values added to the suit parts.
	armor_values = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10)

/obj/item/mod/module/armor_assist
	desc = "A retrofitted series of integrated servos and motors, allowing the suit to function as essentially power armor, \
		giving the user increased mobility and move without hinderance as if they were wearing coventional armor. Has a high rate of power consumption, \
		that increases with the required load to be removed. \
		Moreover, this module has increased energy consumption while armor booster is active."
	complexity = 3

/obj/item/mod/module/armor_assist/advanced
	name = "MOD advanced armor assist module"
	desc = "A retrofitted series of integrated servos and motors, allowing the suit to function as essentially power armor, \
		giving the user increased mobility and move without hinderance as if they were wearing coventional armor. Has a high rate of power consumption. \
		Compared to the regular one, this version doesn't have increased consumption from slowdown. \
		However, it has increased energy consumption while armor booster is active."
	drain_slowdown_affected = FALSE

//MARK: Переделывает модули ниндзи в боевые
/obj/item/mod/module/stealth/military
	name = "MOD military cloaking module"
	desc = "The latest in stealth technology, this module is a definite upgrade over previous versions. \
		The field has been tuned to be even more responsive and fast-acting. Unfortunately, the bumping problem hasn't been fixed. The main cause of their use is to come across sniper supression undetected."
	icon_state = "cloak_ninja"
	bumpoff = TRUE
	complexity = 5
	stealth_alpha = 30
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	use_power_cost = DEFAULT_CHARGE_DRAIN * 10
	cooldown_time = 10 SECONDS
	var/mil_prebuilt = FALSE
	var/mil_removable = TRUE

/obj/item/mod/module/stealth/military/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/military_locked_module, list(/obj/item/military_tech/capacitor), mil_prebuilt, mil_removable)

/obj/item/mod/module/dispenser/bola
	name = "MOD bola dispenser module"
	desc = "This piece of technology can exploit known energy-matter equivalence principles to create energy bolas. How convenient."
	complexity = 2
	dispense_type = /obj/item/restraints/legcuffs/bola/energy
	cooldown_time = 5 SECONDS

/obj/item/mod/module/status_readout/civilian
	name = "MOD status readout module"
	desc = "A once-common module, this technology unfortunately went out of fashion in the safer regions of space; \
		and found new life in the research networks of the Periphery. This particular unit hooks into the suit's spine, \
		capable of capturing and displaying all possible biometric data of the wearer; sleep, nutrition, fitness, fingerprints, \
		and even useful information such as their overall health and wellness. The vitals monitor also comes with a speaker, loud enough \
		to alert anyone nearby that someone has, in fact, died."
	icon_state = "status"
	complexity = 1
	use_power_cost = DEFAULT_CHARGE_DRAIN * 0.4
	tgui_id = "status_readout"

#define COMSIG_MOD_BLOOD_REPLIKA_DEACTIVATION "mod_blood_replika_deactivation"

/obj/item/mod/module/blood_replika
	name = "MOD blood replika module"
	desc = "Replika-einheiten blood replacement. Originally intended for use in zero-gravity medical emergencies where blood clotting is impossible, \
	this set of cables, artificial vessels and pseudo-organs can be invasively integrated into the user to maintain maximum combat effectiveness despite injuries. \n\
	When the suit is activated, it connects the user's circulatory system to a life support, \
	allowing them to remain in combat operational until their body sustains critical injuries. \n\
	It can be temporarily activated to enable the user to continue fighting until their body becomes completely useless. \
	However, deactivation causes serious damage to human tissue and is potentially lethal for injured wearer. \n\
	They don't seem to suppress pain, though."
	module_type = MODULE_USABLE
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 2
	use_power_cost = DEFAULT_CHARGE_DRAIN * 10
	removable = FALSE
	incompatible_modules = list(/obj/item/mod/module/blood_replika, /obj/item/mod/module/armor_assist)
	cooldown_time = 120 SECONDS
	overlay_state_inactive = "module_bloodreplika_off"
	overlay_state_active = "module_bloodreplika_on"
	use_mod_colors = TRUE

/obj/item/mod/module/blood_replika/on_suit_activation()
	ADD_TRAIT(mod.wearer, TRAIT_IGNOREDAMAGESLOWDOWN, MOD_TRAIT)
	to_chat(mod.wearer, span_warning("Long pulsating cables drill into your body, connecting to your blood stream, [!(HAS_TRAIT(mod.wearer, TRAIT_ANALGESIA) || HAS_TRAIT(mod.wearer, TRAIT_PAIN_RESIST)) ? "as you feel a throbbing pain in all your muscles" : ""]."))
	mod.wearer.force_scream()

/obj/item/mod/module/blood_replika/on_suit_deactivation(deleting = FALSE)
	if(mod.wearer)
		REMOVE_TRAIT(mod.wearer, TRAIT_IGNOREDAMAGESLOWDOWN, MOD_TRAIT)
		to_chat(mod.wearer, span_warning("Long pulsating cables crawl out of your body [!(HAS_TRAIT(mod.wearer, TRAIT_ANALGESIA) || HAS_TRAIT(mod.wearer, TRAIT_PAIN_RESIST)) ? "as you feel a throbbing pain in all your muscles" : ""]."))
		playsound(mod.wearer, 'sound/effects/wounds/pierce1.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, frequency = 0.5)
		mod.wearer.adjustBruteLoss(20)
		mod.wearer.force_scream()
		SEND_SIGNAL(mod.wearer, COMSIG_MOD_BLOOD_REPLIKA_DEACTIVATION)

/obj/item/mod/module/blood_replika/on_use()
	. = ..()
	if(!.)
		return
	playsound(src, 'sound/effects/wounds/crackandbleed.ogg', 60, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, frequency = 0.4)
	mod.wearer.apply_status_effect(/datum/status_effect/blood_replika)
	drain_power(use_power_cost)

/atom/movable/screen/alert/status_effect/blood_replika
	name = "Replika-einheiten blood replacement"
	desc = "Your body has been pierced by your MODsuit, keeping you alive. You are on the timer."
	icon_state = "concealed"

/datum/status_effect/blood_replika
	id = "Blood Replika"
	duration = 45 SECONDS
	status_type = STATUS_EFFECT_REPLACE
	alert_type = /atom/movable/screen/alert/status_effect/blood_replika

/datum/status_effect/blood_replika/on_apply()
	RegisterSignal(owner, COMSIG_MOD_BLOOD_REPLIKA_DEACTIVATION, PROC_REF(suit_deactivation_handler))
	ADD_TRAIT(owner, TRAIT_NOSOFTCRIT, type)
	ADD_TRAIT(owner, TRAIT_NOHARDCRIT, type)
	owner.remove_CC()
	owner.bodytemperature = owner.get_body_temp_normal()
	owner.playsound_local(owner, 'sound/health/fastbeat.ogg', 40, channel = CHANNEL_HEARTBEAT, use_reverb = FALSE, frequency = 0.67)
	return TRUE

/datum/status_effect/blood_replika/proc/suit_deactivation_handler()
	SIGNAL_HANDLER
	owner.remove_status_effect(/datum/status_effect/blood_replika)

/datum/status_effect/blood_replika/on_remove()
	REMOVE_TRAIT(owner, TRAIT_NOSOFTCRIT, type)
	REMOVE_TRAIT(owner, TRAIT_NOHARDCRIT, type)
	to_chat(owner, span_warning("Long cables and tubes loosen your body, as your blood returns to normal, seeming to disable your capability to overpower anything."))
	playsound(owner, 'sound/effects/wounds/pierce3.ogg', 120, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, frequency = 0.3)
	owner.adjustBruteLoss(40)
	owner.force_scream()
	UnregisterSignal(owner, COMSIG_MOD_BLOOD_REPLIKA_DEACTIVATION)
