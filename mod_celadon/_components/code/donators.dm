#define VIP_GHOST_TIER1_LIST list(\
	"ghost_classic",\
	"ghost_old",\
	"ghost_old2",\
	"ghost_fire",\
	"ghost_camo",\
	"ghost_mellow",\
	"ghost_cat",\
	"ghost_ian",\
	"ghost_ian2",\
	"ghost_skelet",\
	"ghost_king")

#define VIP_GHOST_TIER3_LIST list(\
	"revenant",\
	"xeno",\
	"horror",\
	"mage",\
	"shadow",\
	"god",\
	"stand",\
	"cult",\
	"daemon",\
	"bowmon",\
	"honkmon",\
	"imp")

// Используется для динамического списка
var/list/DONATOR_GHOST_LIST

/datum/donator
	var/key
	var/donator_tier = 0

/datum/donator/proc/load_vip_tiers(ckey as text)
	var/donators_text = file2text("[global.config.directory]/donators.txt")
	if (!donators_text)
		return

	var/regex/donators_regex = new(@"^(?!#)(.+?)\s*=\s*(\d+)$", "gm")
	while (donators_regex.Find(donators_text))
		if (donators_regex.group[1] == src.ckey || donators_regex.group[1] == src.key)
			donator_tier = text2num(donators_regex.group[2])
			if (donator_tier >= 1)
				LAZYADD(DONATOR_GHOST_LIST, VIP_GHOST_TIER1_LIST)
			if (donator_tier >= 3)
				LAZYADD(DONATOR_GHOST_LIST, VIP_GHOST_TIER3_LIST)

// MARK: New Buttons
/mob/dead/observer/verb/ChangerGhost()
	set category = "Ghost.VIP"
	set name = "Change Ghost"
	set desc = "Изменяет внешний вид вашего призрака."
	if(client.donator.donator_tier <= 0)
		to_chat(usr, "<span class='warning'>Увы. Данная функция доступна только для тех, кто поддержал проект. (Tier1)</span>")
		return

	var/ghost_type = tgui_input_list(usr, "Какого призрака ты хочешь выбрать?", "Изменение призрака", DONATOR_GHOST_LIST, 30 SECONDS)
	if(!ghost_type)
		return
	icon = 'mod_celadon/_storge_icons/icons/assets/vip/ghost.dmi'
	icon_state = ghost_type

/mob/dead/observer/verb/ChangerColorGhost()
	set category = "Ghost.VIP"
	set name = "Change Ghost Color"
	set desc = "Изменяет цвет вашего призрака."
	if(client.donator.donator_tier <= 1)
		to_chat(usr, "<span class='warning'>Увы. Данная функция доступна только для тех, кто поддержал проект. (Tier2)</span>")
		return

	var pick_color = input(usr, "Light color", text("Input")) as color|null
	color = pick_color
