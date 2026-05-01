// Префикс mod_celadon_ чтобы внезапно не конфликтовать с оффами,
// на случай если они какой honk добавят в будущем

/datum/emote/living/carbon/human/robot_tongue/mod_celadon_honk
	key = "honk2"
	key_third_person = "honks"
	message = "lets out a honk!"

/datum/emote/living/carbon/human/robot_tongue/mod_celadon_honk/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/items/bikehorn.ogg', 50, TRUE)
