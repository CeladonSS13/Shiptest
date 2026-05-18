/datum/controller/subsystem/traumas/proc/init_tajara_mod()
	// В оригинале этот список сортируется, но мы не будем замедлять инициализацию
	// Плюс, таким образом этот страх окажется в конце списка и будет понятно, что
	// он целадоновский, хз
	phobia_types += "cats"

	// Не забыть про phobia.json
	// Все эти страхи в нём
	phobia_regexes["cats"] = construct_phobia_regex("cats")

	phobia_mobs["cats"] = typecacheof(list(
		/mob/living/simple_animal/pet/cat,
		/mob/living/carbon/human/species/tajara
	))

	phobia_objs["cats"] = typecacheof(list(
		/obj/item/organ/ears/cat,
		/obj/item/organ/tail/cat,
		/obj/item/stack/sheet/animalhide/cat,
		/obj/item/toy/cattoy,
		/obj/item/clothing/head/kitty,
		/obj/item/organ/ears/tajara,
		/obj/item/organ/tail/tajara
	))

	// Хвосты и уши страшно, конечно но бояться
	// оторванной таярской руки нет смысла

	// Поэтому остальных органов тут и нет

	phobia_species["cats"] = typecacheof(list(/datum/species/tajara))
