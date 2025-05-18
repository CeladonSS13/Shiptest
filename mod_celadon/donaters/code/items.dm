/obj/item/toy/plush/celadon/separ
	name = "\proper Separatist plushie"
	desc = "A cute soft toy of a Separatist. Holding it in your hands, you can hardly restrain yourself from screaming with happiness."
	icon = 'mod_celadon/_storge_icons/icons/items/plushes.dmi'
	icon_state = "separ"
	item_state = "separ"
	w_class = WEIGHT_CLASS_SMALL
	gender = MALE
	donator_key = "Kottason"

	COOLDOWN_DECLARE(cooldown)

	var/static/list/possible_text = list(
		"СМЕРТЬ КСЕНОСАМ!",
		"Сдохни шерстяная тварь!",
		"Я порублю тебя на кусочки!",
		"Растреляю весь твой род!",
		"Моя вера непоколебима!"
		)

/obj/item/toy/plush/celadon/separ/attack_self(mob/user)

	if(!COOLDOWN_FINISHED(src, cooldown))
		return

	var/text = get_text()
	say(text)
	playsound(loc, pick(
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_3.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_4.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_5.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_6.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_7.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_8.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_9.ogg'), 50, FALSE)
	visible_message(span_warning("СМЕРТЬ КСЕНОСАМ!"), span_hear("Никакой пощады!"))
	COOLDOWN_START(src, cooldown, 2 SECONDS)

/obj/item/toy/plush/celadon/separ/proc/get_text()
	return pick(possible_text)

// /obj/item/clothing/under/legislature
// 	name = "\proper Legislature's Drip"
// 	desc = {"
// This outfit once belonged to the great pirate captain known as Taffy P. Aqua Legislature.
// After Legislature's alliance with Chunky B. Goofy, he misplaced his prized outfit, resulting in a war lasting 3 decades.
// Long story short, Legislature's pet polar bear Zippo accidentally donated it to charity.
// "}
// 	icon = 'legislature.dmi'
// 	icon_state = "lawobject"
// 	mob_overlay_icon = 'legislature.dmi'
// 	mob_overlay_state = "lawhoodie"
// 	donator_key = "ianthewanderer"
