// code/modules/mob/emote.dm
//	  /emote/

/datum/emote/flip
	message = "делает кувырок."
	emote_type = EMOTE_VISIBLE

/datum/emote/spin
	message = "кружится."

// code/modules/mob/living/carbon/human/emote.dm
// 	  /emote/living/carbon/human/

/datum/emote/living/carbon/human/eyebrow
	message = "приподнимает бровь."

/datum/emote/living/carbon/human/grumble
	message = "ворчит!"

/datum/emote/living/carbon/human/handshake
	message = "пожимает руку."
	message_param = "пожимает руку %t."

/datum/emote/living/carbon/human/hug
	message = "обнимает себя."
	message_param = "обнимает %t."

/datum/emote/living/carbon/human/mumble
	message = "бормочет!"

/datum/emote/living/carbon/human/scream
	message = "кричит!"

/datum/emote/living/carbon/human/pale
	message = "бледнеет."

/datum/emote/living/carbon/human/raise
	message = "поднимает руку."

/datum/emote/living/carbon/human/salute
	message = "салютует."
	message_param = "салютует %t."
	var/list/serious_shoes = list(
								/obj/item/clothing/shoes/jackboots,
								/obj/item/clothing/shoes/combat,
								/obj/item/clothing/shoes/laceup)
								// /obj/item/clothing/shoes/centcom,
	var/list/funny_shoes = list(
								/obj/item/clothing/shoes/magboots/clown,
								/obj/item/clothing/shoes/clown_shoes)
								// /obj/item/clothing/shoes/cursedclown,
								// /obj/item/clothing/shoes/ducky)

/datum/emote/living/carbon/human/shrug
	message = "пожимает плечами."

/datum/emote/living/carbon/human/wag
	message = "начинает махать хвостом."

/datum/emote/living/carbon/human/dap
	message = "грустно не находит, кому дать пять, и бьёт сам себя по руке. Печально."  
	message_param = "даёт пять %t."  

/datum/emote/living/carbon/human/weh
	message = "издаёт странное вээх!"

/datum/emote/living/carbon/human/kepiwoop
	message = "издает упсс!"

// code/modules/mob/living/carbon/emote.dm
//	  /emote/living/carbon/

/datum/emote/living/carbon/airguitar
	message = "делает невероятный запил на воображаемой гитаре!"

/datum/emote/living/carbon/blink
	message = "моргает."

/datum/emote/living/carbon/blink_r
	message = "быстро моргает."

/datum/emote/living/carbon/crack
	message = "хрустит костяшками пальцев."
	sound = 'mod_celadon/_storge_sounds/sound/voice/knuckles.ogg'

/datum/emote/living/carbon/gnarl
	message = "рычит и скалит зубы..."

/datum/emote/living/carbon/roll
	message = "перекатывается."

/datum/emote/living/carbon/scratch
	message = "чешется."

/datum/emote/living/carbon/screech
	message = "издаёт дикий визг."

/datum/emote/living/carbon/sign/signal
	message_param = "показывает %t пальцев."

/datum/emote/living/carbon/tail
	message = "машет хвостом."

/datum/emote/living/carbon/wink
	message = "подмигивает."
