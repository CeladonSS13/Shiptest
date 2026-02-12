/datum/mission/acquire
	desc = "БЛЯТЬ, ОПИСАНИЕ СЛОМАЛОСЬ - СООБЩИТЕ ОБ ЭТОМ СИСТЕМНОМУ АДМИНИСТРАТОРУ!"	//desc = "Get me some things."	// [CELADON-EDIT] - CELADON_ECONOMY - Оповещение об ЯВНОЙ ошибке

	/// The type of container to be spawned when the mission is accepted.
	var/atom/movable/container_type
	/// Instance of the container, spawned after the mission is accepted.
	var/atom/movable/container

	///The item that this mission wants
	var/atom/movable/objective_type
	///How many of this item does the mission want?
	var/num_wanted = 1
	///Does this mission allow subtypes of objective_type to count to the total required?
	var/allow_subtypes = TRUE
	///Are stacks of objective_type counted individually?
	var/count_stacks = TRUE

/datum/mission/acquire/accept(datum/overmap/ship/controlled/acceptor, turf/accept_loc, obj/hangar_crate_spawner/cargo_belt)
	. = ..()
	if(isnull(cargo_belt))
		container = spawn_bound(container_type, accept_loc, VARSET_CALLBACK(src, container, null))
		stack_trace("[src] issued by [source_outpost] could not find cargo chute to send items down. Fell back to cargo console.")
	else
		container = spawn_bound(container_type, cargo_belt.loc, VARSET_CALLBACK(src, container, null))
	container.name += " ([capitalize(objective_type.name)])"

/datum/mission/acquire/Destroy()
	container = null
	return ..()

/datum/mission/acquire/can_complete()
	. = ..()
	if(!.)
		return
	var/obj/docking_port/mobile/cont_port = SSshuttle.get_containing_shuttle(container)
	return . && (current_num() >= num_wanted) && (cont_port?.current_ship == servant)

/datum/mission/acquire/get_progress_string()
	return "[current_num()]/[num_wanted]"

/datum/mission/acquire/get_progress_percent()
	if(!container)
		return 0
	else
		return current_num()/num_wanted

/datum/mission/acquire/turn_in()
	del_container()
	return ..()

/datum/mission/acquire/give_up()
	del_container()
	return ..()

/datum/mission/acquire/proc/current_num()
	if(!container)
		return 0
	var/num = 0
	for(var/target in container.contents)
		num += atom_effective_count(target)
		if(num >= num_wanted)
			return num
	return num

/datum/mission/acquire/proc/atom_effective_count(atom/movable/target)
	if(allow_subtypes ? !istype(target, objective_type) : target.type != objective_type)
		return 0
	if(count_stacks && istype(target, /obj/item/stack))
		var/obj/item/stack/target_stack = target
		return target_stack.amount
	return 1

/datum/mission/acquire/proc/del_container()
	var/turf/cont_loc = get_turf(container)
	for(var/atom/movable/target in container.contents)
		if(atom_effective_count(target))
			qdel(target)
		else
			target.forceMove(cont_loc)
	recall_bound(container)

/*
		Acquire: The Creature
*/

/datum/mission/acquire/creature
	name = ""
	desc = ""
	value = 1500
	weight = 6
	container_type = /obj/structure/closet/mob_capture
	objective_type = /mob/living/simple_animal/hostile/asteroid/goliath
	num_wanted = 1
	count_stacks = FALSE
	var/creature_name = "голиафа"

/datum/mission/acquire/creature/New(...)
	if(!name)
		name = "Захватите [creature_name]"
	if(!desc)
		desc = "[SSmissions.get_researcher_name()] запрашивают живого [creature_name] для исследовательских целей. Захватите одного в \
				контейнер содержания живых организмов и вернитесь на аванпост для получения солидного вознаграждения. \
				Внимание: после принятия задания, мы отправим вам контейнер через конвейер в ангаре"
	. = ..()

/datum/mission/acquire/creature/atom_effective_count(atom/movable/target)
	. = ..()
	if(!.)
		return
	var/mob/creature = target
	if(creature.stat == DEAD)
		return 0

/datum/mission/acquire/creature/legion
	value = 1300
	objective_type = /mob/living/simple_animal/hostile/asteroid/hivelord/legion
	creature_name = "легиона"

/datum/mission/acquire/creature/ice_whelp
	value = 1700
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/asteroid/ice_whelp
	creature_name = "ледяного дракона"

/datum/mission/acquire/creature/migo
	value = 1050
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/netherworld/migo/asteroid
	creature_name = "ми-го"

/datum/mission/acquire/creature/basilisk
	value = 1050
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/asteroid/basilisk/whitesands
	creature_name = "песчаного базилиска"

/datum/mission/acquire/creature/lobster_activity
	value = 1050
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/asteroid/lobstrosity
	creature_name = "крабстера"

/datum/mission/acquire/creature/watcher
	value = 1050
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/asteroid/basilisk/watcher
	creature_name = "наблюдателя"

/*
		Acquiry mission containers
*/
/obj/structure/closet/mob_capture
	name = "Контейнер содержания живых организмов"
	desc = "Большой контейнер, похожий на шкаф, используемый для захвата враждебных форм жизни с целью их извлечения и анализа. Внутренняя часть контейнера имеет прочную броню, предотвращающую побег живых организмов из него."
	cases = list("контейнер содержания живых организмов", "контейнера содержания живых организмов", "контейнеру содержания живых организмов", "контейнер содержания живых организмов","контейнером содержания живых организмов", "контейнере содержания живых организмов")
	icon_state = "abductor"
	icon_door = "abductor"
	color = "#FF88FF"
	drag_slowdown = 1
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 10, "laser" = 10, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 30, "fire" = 80, "acid" = 70)
	mob_storage_capacity = 1
	max_mob_size = MOB_SIZE_LARGE
	anchorable = FALSE
	can_weld_shut = FALSE

/obj/structure/closet/mob_capture/attack_animal(mob/living/simple_animal/M)
	if(M.loc == src)
		return FALSE
	return ..()
