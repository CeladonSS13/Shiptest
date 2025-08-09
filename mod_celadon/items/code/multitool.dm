
/obj/item/multitool
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/multitool/tricorder
	name = "трикодер"
	desc = "A multifunctional device that can perform a wide range of tasks."
	icon_state = "tricorder"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/multitool_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/multitool_righthand.dmi'
	item_flags = NOBLUDGEON
	tool_behaviour = TOOL_MULTITOOL
	usesound = 'sound/weapons/etherealhit.ogg'
	toolspeed = 0.2
	var/ranged_scan_distance = 1

	custom_materials = list(/datum/material/iron = 500, /datum/material/silver = 300, /datum/material/gold = 300)

	var/medicalTricorder = FALSE	//Set to TRUE for normal medical scanner, set to FALSE for a gutted version

/*
/obj/item/multitool/tricorder/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] пробует провести глубокий анализ себя!"))
	return BRUTELOSS
*/

//Tricorder differentiates from slimes and nonslimes
/obj/item/multitool/tricorder/attack(mob/living/M, mob/living/user, obj/item/I)
	add_fingerprint(user)
	var/turf/U = get_turf(I)
	if(U)
		atmosanalyzer_scan(U.return_air(), user, I)
	if(user.stat || user.eye_blind)
		return
/*
	if (isslime(M))
		var/mob/living/simple_animal/slime/T = M
		slime_scan(T, user)
*/
	else if (medicalTricorder)
		healthscan(user, M)
		return
	else
		lesserhealthscan(user, M)
		return

//Gas Analyzer Tank Scan
/obj/item/multitool/tricorder/afterattack(atom/A as obj, mob/user, proximity)
	if(!proximity)
		return
	A.analyzer_act(user, src)

/obj/item/multitool/tricorder/attack_self(mob/user, modifiers)
	if(user.stat != CONSCIOUS || !user.can_read(src) || user.is_blind())
		return
	atmosanalyzer_scan(user=user, target=get_turf(src), silent=FALSE)

//Gas Analyzer Turf Scan
/obj/item/multitool/tricorder/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!can_see(user, target, ranged_scan_distance))
		return
	atmosanalyzer_scan(user, (target.return_analyzable_air() ? target : get_turf(target)))

//If medicalTricorder is set to FALSE then the tricorder will not be as effective as a regular medical scanner
/obj/item/proc/lesserhealthscan(mob/user, mob/living/M)
	if(isliving(user) && (user.incapacitated() || user.eye_blind))
		return
	//Damage specifics
	var/oxy_damage = M.getOxyLoss()
	var/tox_damage = M.getToxLoss()
	var/fire_damage = M.getFireLoss()
	var/brute_damage = M.getBruteLoss()
	var/brain_status = M.getOrganLoss(ORGAN_SLOT_BRAIN)

	// Status Readout
	// Tricorder can detect damage but can only give estimates in most cases
	//Temperature
	to_chat(user, span_info("Температура тела: [round(M.bodytemperature-T0C,0.1)] &deg;C ([round(M.bodytemperature*1.8-459.67,0.1)] &deg;F)"))
	//Brute
	to_chat(user, "\t <font class='red'>*</font>Физический: <font class ='orange'>[brute_damage > 100 ? "<font class='red'>Критический</font>" : brute_damage > 75 ? "Серьёзный" : brute_damage > 50 ? "Высокий" : brute_damage > 25 ? "Средний" : brute_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Burn
	to_chat(user, "\t <font color='#FF8000'>*</font>Ожоги: <font class ='orange'>[fire_damage > 100 ? "<font class='red'>Критический</font>" : fire_damage > 75 ? "Серьёзный" : fire_damage > 50 ? "Высокий" : fire_damage > 25 ? "Средний" : fire_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Oxygen
	to_chat(user, "\t <font class='blue'>*</font>Кислород: <font class ='orange'>[oxy_damage > 100 ? "<font class='red'>Критический</font>" : oxy_damage > 75 ? "Опасный" : oxy_damage > 50 ? "Низкий" : oxy_damage > 25 ? "Средний" : oxy_damage > 0 ? "Высокий" : "<font class='blue'>Нормальный</font>"] уровень</font></span>")
	//Toxin
	to_chat(user, "\t <font class='green'>*</font>Токсины: <font class ='orange'>[tox_damage > 100 ? "<font class='red'>Критический</font>" : tox_damage > 75 ? "Серьёзный" : tox_damage > 50 ? "Высокий" : tox_damage > 25 ? "Средний" : tox_damage > 0 ? "Низкий" : "<font class='blue'>Нулевой</font>"] уровень</font></span>")
	//Brain
	to_chat(user, "\t <font class='Fuchsia'>*</font>Мозг: <font class ='orange'>[brain_status >= 200 ? "<font class='red'>Не обнаружено</font>" : brain_status > 100 ? "Почти не целый" : brain_status > 0 ? "Почти целый" : "<font class='blue'>Целый</font>"]</font></span>")
	//Radiation
	to_chat(user, "\t <font class='yellow'>*</font>Облучение: [M.radiation ? "<font class='red'>[M.radiation]</font>" : "<font class='blue'>Нет</font>"]</span>")

// Дебаговский трикодер
/obj/item/multitool/tricorder/ranged
	name = "long-range tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks. A hand-held long-range environmental scanner which reports current gas levels."
	icon_state = "tricorder_ranged"
	medicalTricorder = TRUE
	ranged_scan_distance = 15

/obj/item/construction/rcd/arcd
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/construction/rcd/arcd/debug
	max_matter = INFINITY
	matter = INFINITY
	upgrade = RCD_UPGRADE_FRAMES | RCD_UPGRADE_SIMPLE_CIRCUITS

/obj/item/construction/plumbing
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/inducer
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
