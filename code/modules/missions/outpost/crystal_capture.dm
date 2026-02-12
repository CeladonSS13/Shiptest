/datum/mission/acquire/crystal_critter
	name = "Crystal Infection Study"
	desc = ""
	value = 8000
	weight = 1
	container_type = /obj/structure/closet/mob_capture
	objective_type = /mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient/crystal
	num_wanted = 1
	count_stacks = FALSE

/datum/mission/acquire/crystal_critter/New(...)
	if(!name)
		name = "Исследование кристаллической инфекции"
	if(!desc)
		desc = "[SSmissions.get_researcher_name()] запрашивают захватить аномальную кристаллическую форму жизни для исследования этого явления. \
				Будьте осторожны при поимке, так как существа, зараженные кристаллами, как правило, обладают усиленной защитой. \
				В целях безопасности вам будет отправлен контейнер содержания живых организмов через конвейер в ангаре."
	. = ..()


/datum/mission/acquire/crystal_critter/atom_effective_count(atom/movable/target)
	if(is_type_in_list(target, list(
			/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient/crystal, \
			/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal, \
			/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/forgotten \
			)))
		return 1
	return 0
