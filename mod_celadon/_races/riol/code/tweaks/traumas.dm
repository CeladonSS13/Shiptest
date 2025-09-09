/datum/controller/subsystem/traumas/proc/init_riol_mod()
	// В оригинале этот список сортируется, но мы не будем замедлять инициализацию
	// Плюс, таким образом этот страх окажется в конце списка и будет понятно, что
	// он целадоновский, хз
	phobia_types += "fox"

	// Не забыть про phobia.json
	// Все эти страхи в нём
	phobia_regexes["fox"] = construct_phobia_regex("fox")

	phobia_mobs["fox"] = typecacheof(list(
		/mob/living/simple_animal/pet/fox,
		/mob/living/carbon/human/species/riol
	))

	phobia_objs["fox"] = typecacheof(list(
		/obj/item/organ/ears/fox,
		/obj/item/organ/tail/fox,
		/obj/item/organ/ears/riol,
		/obj/item/organ/tail/riol
	))

	// Хвосты и уши страшно, конечно но бояться
	// оторванной таярской руки нет смысла

	// Поэтому остальных органов тут и нет

	phobia_species["fox"] = typecacheof(list(/datum/species/riol))
