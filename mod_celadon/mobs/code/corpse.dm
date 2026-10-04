/obj/effect/mob_spawn/human/corpse/miko
	name = "Мёртвое тело"
	mob_name = "Доктор V"
	mob_gender = FEMALE
	faction = "Vampire"
	short_desc = "<i>Окровавленное тело девушки, что не успело разложиться. Возможно вы уже замечали где-то это лицо прежде, например, в какой-нибудь научной передачи.</i>"
	uniform = /obj/item/clothing/under/plasmaman/robotics/skirt
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/beret/color/red
	r_pocket = /obj/item/reagent_containers/blood/APlus
	l_pocket = /obj/item/pen/blue
	id = /obj/item/card/id/cel/lpmed
	suit_store = /obj/item/dnainjector
	hairstyle = "Poofy"
	hair_color = "ffcc00"
	facial_hairstyle = "Shaved"
	skin_tone = "bisque"

/obj/effect/mob_spawn/human/corpse/miko/equip(mob/living/carbon/human/H)
	. = ..()

	if(H.wear_id)
		var/obj/item/card/id/card = H.wear_id
		card.name = "Special Access card"
		card.desc = "Специальный доступ к засекреченым разработкам лаборатории."
		card.registered_name = "Doctor V"
		card.icon_state = "med_budget"
		card.overlays = null

	if(H.wear_suit)
		var/obj/item/clothing/suit/toggle/labcoat/l = H.wear_suit
		l.suittoggled = TRUE
		l.icon_state = "labcoat_t"
		l.update_icon()
		H.update_inv_wear_suit()
