var/last_emote_time = 0
var/timer = 20

/proc/emote_with_delay(emote, delay)
    if (world.time - last_emote_time < delay)
        return
    usr.emote(emote)
    last_emote_time = world.time

/////////////////////////// ВАЖНЫЕ ЭМОУТЫ ///////////////////////////

/mob/living/carbon/human/verb/emote_peace()
	set name = "< " + EMOTE_SPECIES_PEACE + " ⚠"
	set category = "Эмоции"
	emote_with_delay("peace", timer)

/mob/living/carbon/human/verb/emote_surrender()
	set name = "< " + EMOTE_SPECIES_SURRENDER + " ⚠"
	set category = "Эмоции"
	emote_with_delay("surrender", timer)

/////////////////////////// РАСОВЫЕ ЭМОУТЫ ///////////////////////////

/mob/living/carbon/human/proc/emote_hiss()
	set name = "> " + EMOTE_SPECIES_HISS + " ►"
	set category = "Эмоции"
	emote_with_delay("hiss", timer)

/mob/living/carbon/human/proc/emote_mothchitter()
	set name = "> " + EMOTE_SPECIES_CHITTER + " ►"
	set category = "Эмоции"
	emote_with_delay("chitter", timer)

/mob/living/carbon/human/proc/emote_flap()
	set name = "> " + EMOTE_SPECIES_FLAP + " ►"
	set category = "Эмоции"
	emote_with_delay("flap", timer)

/mob/living/carbon/human/proc/emote_aflap()
	set name = "> " + EMOTE_SPECIES_AFLAP + " ►"
	set category = "Эмоции"
	emote_with_delay("aflap", timer)

/mob/living/carbon/human/proc/emote_flutter()
	set name = "> " + EMOTE_SPECIES_FLUTTER + " ►"
	set category = "Эмоции"
	emote_with_delay("flutter", timer)

/mob/living/carbon/human/proc/emote_fpurr()
	set name = "> " + EMOTE_SPECIES_FPURR + " ►"
	set category = "Эмоции"
	emote_with_delay("fox_purr", timer)

/mob/living/carbon/human/proc/emote_wag() // Lizard, Tajara
	set name = "> " + EMOTE_SPECIES_WAG + " ►"
	set category = "Эмоции"
	emote_with_delay("wag", timer)

// /mob/living/carbon/human/proc/emote_swag()
// 	set name = "> " + EMOTE_SPECIES_WAG_STOP + " ►"
// 	set category = "Эмоции"
// 	emote_with_delay("swag", timer)

/mob/living/carbon/human/proc/emote_growl()
	set name = "> " + EMOTE_SPECIES_GROWL + " ►"
	set category = "Эмоции"
	emote_with_delay("growl", timer)

/mob/living/carbon/human/proc/emote_howl()
	set name = "> " + EMOTE_SPECIES_HOWL + " ►"
	set category = "Эмоции"
	emote_with_delay("howl", timer)

/mob/living/carbon/human/proc/emote_roar()
	set name = "> " + EMOTE_SPECIES_ROAR + " ►"
	set category = "Эмоции"
	emote_with_delay("roar", timer)

/mob/living/carbon/human/proc/emote_threat()
	set name = "> " + EMOTE_SPECIES_THREAT + " ►"
	set category = "Эмоции"
	emote_with_delay("threat", timer)

/mob/living/carbon/human/proc/emote_whips()
	set name = "> " + EMOTE_SPECIES_WHIPS + " ►"
	set category = "Эмоции"
	emote_with_delay("whips", timer)

/mob/living/carbon/human/proc/emote_hum()
	set name = "> " + EMOTE_SPECIES_HUM + " ►"
	set category = "Эмоции"
	emote_with_delay("hum", timer)

/mob/living/carbon/human/proc/emote_rumble()
	set name = "> " + EMOTE_SPECIES_RUMBLE + " ►"
	set category = "Эмоции"
	emote_with_delay("rumble", timer)

/mob/living/carbon/human/proc/emote_quill()
	set name = "> " + EMOTE_SPECIES_QUILL + " ►"
	set category = "Эмоции"
	emote_with_delay("quill", timer)

/mob/living/carbon/human/proc/emote_creak()
	set name = "> " + EMOTE_SPECIES_CREAK + " ►"
	set category = "Эмоции"
	emote_with_delay("creak", timer)

/mob/living/carbon/human/proc/emote_warble()
	set name = "> " + EMOTE_SPECIES_WARBLE + " ►"
	set category = "Эмоции"
	emote_with_delay("warble", timer)

/mob/living/carbon/human/proc/emote_croak()
	set name = "> " + EMOTE_SPECIES_CROAK + " ►"
	set category = "Эмоции"
	emote_with_delay("croak", timer)

/mob/living/carbon/human/proc/emote_croak_anger()
	set name = "> " + EMOTE_SPECIES_CROAK_ANGER + " ►"
	set category = "Эмоции"
	emote_with_delay("croak_anger", timer)

/mob/living/carbon/human/proc/emote_click()
	set name = "> " + EMOTE_SPECIES_CLICK + " ►"
	set category = "Эмоции"
	emote_with_delay("click", timer)

/mob/living/carbon/human/proc/emote_clack()
	set name = "> " + EMOTE_SPECIES_CLACK + " ►"
	set category = "Эмоции"
	emote_with_delay("clack", timer)

/mob/living/carbon/human/proc/emote_rattle()
	set name = "> " + EMOTE_SPECIES_RATTLE + " ►"
	set category = "Эмоции"
	emote_with_delay("rattle", timer)

/mob/living/carbon/human/proc/emote_squish()
	set name = "> " + EMOTE_SPECIES_SQUISH + " ►"
	set category = "Эмоции"
	emote_with_delay("squish", timer)

/mob/living/carbon/human/proc/emote_bubble()
	set name = "> " + EMOTE_SPECIES_BUBBLE + " ►"
	set category = "Эмоции"
	emote_with_delay("bubble", timer)

/mob/living/carbon/human/proc/emote_pop()
	set name = "> " + EMOTE_SPECIES_POP + " ►"
	set category = "Эмоции"
	emote_with_delay("pop", timer)

/mob/living/carbon/human/proc/emote_ping()
	set name = "> " + EMOTE_SILICON_PING + " ►"
	set category = "Эмоции"
	emote_with_delay("ping", timer)

/mob/living/carbon/human/proc/emote_beep()
	set name = "> " + EMOTE_SILICON_BEEP + " ►"
	set category = "Эмоции"
	emote_with_delay("beep", timer)

/mob/living/carbon/human/proc/emote_buzz()
	set name = "> " + EMOTE_SILICON_BUZZ + " ►"
	set category = "Эмоции"
	emote_with_delay("buzz", timer)

/mob/living/carbon/human/proc/emote_buzz2()
	set name = "> " + EMOTE_SILICON_BUZZ2 + " ►"
	set category = "Эмоции"
	emote_with_delay("buzz2", timer)

/mob/living/carbon/human/proc/emote_yes()
	set name = "> " + EMOTE_SILICON_YES + " ►"
	set category = "Эмоции"
	emote_with_delay("yes", timer)

/mob/living/carbon/human/proc/emote_no()
	set name = "> " + EMOTE_SILICON_NO + " ►"
	set category = "Эмоции"
	emote_with_delay("no", timer)

/mob/living/carbon/human/proc/emote_waves_k()
	set name = "> " + EMOTE_SPECIES_WAVES_K + " ►"
	set category = "Эмоции"
	emote_with_delay("waves_k", timer)

/mob/living/carbon/human/proc/emote_wiggles()
	set name = "> " + EMOTE_SPECIES_WIGGLES + " ►"
	set category = "Эмоции"
	emote_with_delay("wiggles", timer)

/mob/living/carbon/human/proc/emote_meow()
	set name = "> " + EMOTE_SPECIES_MEOW + " ►"
	set category = "Эмоции"
	emote_with_delay("meow", timer)

/mob/living/carbon/human/proc/emote_mrow()
	set name = "> " + EMOTE_SPECIES_MROW + " ►"
	set category = "Эмоции"
	emote_with_delay("mrow", timer)

/mob/living/carbon/human/proc/emote_mrowss()
	set name = "> " + EMOTE_SPECIES_MROWSS + " ►"
	set category = "Эмоции"
	emote_with_delay("mrowss", timer)

/mob/living/carbon/human/proc/emote_purr()
	set name = "> " + EMOTE_SPECIES_PURR + " ►"
	set category = "Эмоции"
	emote_with_delay("purr", timer)

/mob/living/carbon/human/proc/emote_purrl()
	set name = "> " + EMOTE_SPECIES_PURRL + " ►"
	set category = "Эмоции"
	emote_with_delay("purrl", timer)

/mob/living/carbon/human/proc/emote_clack_spider() // Spider
	set name = "> " + EMOTE_SPECIES_CLACK_SPIDER + " ►"
	set category = "Эмоции"
	emote_with_delay("clack", timer)

/mob/living/carbon/human/proc/emote_tailthump()
	set name = "> " + EMOTE_SPECIES_TAILTHUMP + " ►"
	set category = "Эмоции"
	emote_with_delay("thump", timer)

/mob/living/carbon/human/proc/emote_kepiclick()
	set name = "> " + EMOTE_SPECIES_KEPICLICK + " ►"
	set category = "Эмоции"
	emote_with_delay("click", timer)

/mob/living/carbon/human/proc/emote_kepiwhistle()
	set name = "> " + EMOTE_SPECIES_KEPIWHISTLE + " ►"
	set category = "Эмоции"
	emote_with_delay("whistle", timer)

/////////////////////////// ЗВУКОВЫЕ ЭМОУТЫ ///////////////////////////

/mob/living/carbon/human/verb/emote_snuffle()
	set name = "► " + EMOTE_SPECIES_SNUFFLE + " "
	set category = "Эмоции"
	emote_with_delay("snuffle", timer)

/mob/living/carbon/human/verb/emote_fart()
	set name = "► " + EMOTE_SPECIES_FART + " "
	set category = "Эмоции"
	emote_with_delay("fart", timer)

/mob/living/carbon/human/verb/emote_groan()
	set name = "► " + EMOTE_GROAN + " "
	set category = "Эмоции"
	emote_with_delay("groan", timer)

/mob/living/carbon/human/verb/emote_laugh()
	set name = "► " + EMOTE_CARBON_LAUGH + " "
	set category = "Эмоции"
	emote_with_delay("laugh", timer)

/mob/living/carbon/human/verb/emote_laugh_evil()
	set name = "► " + EMOTE_CARBON_LAUGH_EVIL + " "
	set category = "Эмоции"
	emote_with_delay("laugh_evil", timer)

/mob/living/carbon/human/proc/emote_whip()
	set name = "► " + EMOTE_SPECIES_WHIP + " "
	set category = "Эмоции"
	emote_with_delay("whip", timer)

/mob/living/carbon/human/verb/emote_warcray()
	set name = "► " + EMOTE_SPECIES_WARCRY + " "
	set category = "Эмоции"
	emote_with_delay("warcray", timer)

/mob/living/carbon/human/verb/emote_giggle()
	set name = "► " + EMOTE_CARBON_GIGGLE + " "
	set category = "Эмоции"
	emote_with_delay("giggle", timer)

/mob/living/carbon/human/verb/emote_clap()
	set name = "► " + EMOTE_SPECIES_CLAP + " "
	set category = "Эмоции"
	emote_with_delay("clap", timer)

/mob/living/carbon/human/verb/emote_crack()
	set name = "► " + EMOTE_SPECIES_CRACK + " "
	set category = "Эмоции"
	emote_with_delay("crack", timer)

/mob/living/carbon/human/verb/emote_sigh()
	set name = "► " + EMOTE_SIGH + " "
	set category = "Эмоции"
	emote_with_delay("sigh", timer)

/mob/living/carbon/human/verb/emote_sneeze()
	set name = "► " + EMOTE_SPECIES_SNEEZE + " "
	set category = "Эмоции"
	emote_with_delay("sneeze", timer)

/mob/living/carbon/human/verb/emote_sniff()
	set name = "► " + EMOTE_SPECIES_SNIFF + " "
	set category = "Эмоции"
	emote_with_delay("sniff", timer)

/mob/living/carbon/human/verb/emote_snore()
	set name = "► " + EMOTE_SNORE + " "
	set category = "Эмоции"
	emote_with_delay("snore", timer)

/mob/living/carbon/human/verb/emote_yawn()
	set name = "► " + EMOTE_CARBON_YAWN + " "
	set category = "Эмоции"
	emote_with_delay("yawn", timer)

/mob/living/carbon/human/verb/emote_scream()
	set name = "► " + EMOTE_SPECIES_SCREAM + " "
	set category = "Эмоции"
	emote_with_delay("scream", timer)

/mob/living/carbon/human/verb/emote_salute()
	set name = "► " + EMOTE_SPECIES_SALUTE + " "
	set category = "Эмоции"
	emote_with_delay("salute", timer)

/mob/living/carbon/human/verb/emote_cry()
	set name = "► " + EMOTE_SPECIES_CRY + " "
	set category = "Эмоции"
	emote_with_delay("cry", timer)

/mob/living/carbon/human/verb/emote_cough()
	set name = "► " + EMOTE_CARBON_COUGH + " "
	set category = "Эмоции"
	emote_with_delay("cough", timer)

/mob/living/carbon/human/verb/emote_choke()
	set name = "► " + EMOTE_CHOKE + " "
	set category = "Эмоции"
	emote_with_delay("choke", timer)

/mob/living/carbon/human/verb/emote_moan()
	set name = "► " + EMOTE_CARBON_MOAN + " "
	set category = "Эмоции"
	emote_with_delay("moan", timer)

/mob/living/carbon/human/verb/emote_whistle()
	set name = "► " + EMOTE_SPECIES_WHISTLE + " "
	set category = "Эмоции"
	emote_with_delay("whistle", timer)

/mob/living/carbon/human/verb/emote_snap()
	set name = "► " + EMOTE_SPECIES_SNAP + " "
	set category = "Эмоции"
	emote_with_delay("snap", timer)

// /mob/living/carbon/human/proc/emote_ururu()
// 	set name = "► " + EMOTE_SPECIES_RUMBLE + " "
// 	set category = "Эмоции"
// 	emote_with_delay("ururu", timer)

// /mob/living/carbon/human/verb/emote_gasp()	// Пока не вводим
// 	set name = "► " + EMOTE_SPECIES_GASP + " "
// 	set category = "Эмоции"
// 	emote_with_delay("gasp", timer)

/////////////////////////// АКТИВНЫЕ ЭМОУТЫ///////////////////////////

/mob/living/carbon/human/verb/emote_kiss()
	set name = "▷ " + EMOTE_SPECIES_AIRKISS + " "
	set category = "Эмоции"
	emote_with_delay("kiss", timer)

/mob/living/carbon/human/verb/emote_collapse()
	set name = "▷ " + EMOTE_COLLAPSE + " "
	set category = "Эмоции"
	emote_with_delay("collapse", timer)

/mob/living/carbon/human/verb/emote_slap()
	set name = "▷ " + EMOTE_SPECIES_SLAP + " "
	set category = "Эмоции"
	emote_with_delay("slap", timer)

// /mob/living/carbon/human/verb/emote_highfive()
// 	set name = "▷ " + EMOTE_SPECIES_HIGHFIVE + " "
// 	set category = "Эмоции"
// 	emote_with_delay("highfive", timer)

// /mob/living/carbon/human/verb/emote_handshake()
// 	set name = "▷ " + EMOTE_SPECIES_HANDSHAKE + " "
// 	set category = "Эмоции"
// 	emote_with_delay("handshake", timer)

/mob/living/carbon/human/verb/emote_spin()
	set name = "▷ " + EMOTE_SPECIES_SPIN + " "
	set category = "Эмоции"
	emote_with_delay("spin", timer)

/mob/living/carbon/human/verb/emote_dance()
	set name = "▷ " + EMOTE_DANCE + " "
	set category = "Эмоции"
	emote_with_delay("dance", timer)

// /mob/living/carbon/human/verb/emote_rps()
// 	set name = "▷ " + EMOTE_SPECIES_RPS + " "
// 	set category = "Эмоции"
// 	emote_with_delay("rps", timer)

/mob/living/carbon/human/verb/emote_faint()
	set name = "▷ " + EMOTE_CARBON_FAINT + " "
	set category = "Эмоции"
	emote_with_delay("faint", timer)

/mob/living/carbon/human/verb/emote_flip()
	set name = "▷ " + EMOTE_FLIP + " "
	set category = "Эмоции"
	emote_with_delay("flip", timer)

/////////////////////////// ME ЭМОУТЫ ///////////////////////////

/mob/living/carbon/human/verb/emote_shame()
	set name = "◦ " + EMOTE_SPECIES_SHAME + " "
	set category = "Эмоции"
	emote_with_delay("shame", timer)

/mob/living/carbon/human/verb/emote_eyebrow()
	set name = "◦ " + EMOTE_SPECIES_EYEBROW + " "
	set category = "Эмоции"
	emote_with_delay("eyebrow", timer)

/mob/living/carbon/human/verb/emote_mumble()
	set name = "◦ " + EMOTE_SPECIES_MUMBLE + " "
	set category = "Эмоции"
	emote_with_delay("mumble", timer)

/mob/living/carbon/human/verb/emote_pale()
	set name = "◦ " + EMOTE_SPECIES_PALE + " "
	set category = "Эмоции"
	emote_with_delay("pale", timer)

/mob/living/carbon/human/verb/emote_raise()
	set name = "◦ " + EMOTE_SPECIES_RAISE + " "
	set category = "Эмоции"
	emote_with_delay("raise", timer)

/mob/living/carbon/human/verb/emote_shrug()
	set name = "◦ " + EMOTE_SPECIES_SHRUG + " "
	set category = "Эмоции"
	emote_with_delay("shrug", timer)

/mob/living/carbon/human/verb/emote_wink()
	set name = "◦ " + EMOTE_SPECIES_WINK + " "
	set category = "Эмоции"
	emote_with_delay("wink", timer)

// /mob/living/carbon/human/verb/emote_quiver()
// 	set name = "◦ " + EMOTE_QUIVER + " "
// 	set category = "Эмоции"
// 	emote_with_delay("quiver", timer)

/mob/living/carbon/human/verb/emote_shudder()
	set name = "◦ " + EMOTE_SHUDDER + " "
	set category = "Эмоции"
	emote_with_delay("shudder", timer)

/mob/living/carbon/human/verb/emote_bshake()
	set name = "◦ " + EMOTE_BSHAKE + " "
	set category = "Эмоции"
	emote_with_delay("bshake", timer)

/mob/living/carbon/human/verb/emote_hem()
	set name = "◦ " + EMOTE_SPECIES_HEM + " "
	set category = "Эмоции"
	emote_with_delay("hem", timer)

/mob/living/carbon/human/verb/emote_frown()
	set name = "◦ " + EMOTE_FROWN + " "
	set category = "Эмоции"
	emote_with_delay("frown", timer)

/mob/living/carbon/human/verb/emote_stare()
	set name = "◦ " + EMOTE_STARE + " "
	set category = "Эмоции"
	emote_with_delay("stare", timer)

/mob/living/carbon/human/verb/emote_strech()
	set name = "◦ " + EMOTE_SPECIES_STRECH + " "
	set category = "Эмоции"
	emote_with_delay("strech", timer)

/mob/living/carbon/human/verb/emote_sulk()
	set name = "◦ " + EMOTE_SPECIES_SULK + " "
	set category = "Эмоции"
	emote_with_delay("sulk", timer)

/mob/living/carbon/human/verb/emote_surprised()
	set name = "◦ " + EMOTE_SPECIES_SURPRISED + " "
	set category = "Эмоции"
	emote_with_delay("surprised", timer)

/mob/living/carbon/human/verb/emote_tremble()
	set name = "◦ " + EMOTE_TREMBLE + " "
	set category = "Эмоции"
	emote_with_delay("tremble", timer)

/mob/living/carbon/human/verb/emote_twitch()
	set name = "◦ " + EMOTE_TWITCH + " "
	set category = "Эмоции"
	emote_with_delay("twitch", timer)

/mob/living/carbon/human/verb/emote_twitch_s()
	set name = "◦ " + EMOTE_TWITCHS + " "
	set category = "Эмоции"
	emote_with_delay("twitch_s", timer)

/mob/living/carbon/human/verb/emote_wave()
	set name = "◦ " + EMOTE_CARBON_WAVE + " "
	set category = "Эмоции"
	emote_with_delay("wave", timer)

/mob/living/carbon/human/verb/emote_whimper()
	set name = "◦ " + EMOTE_WHIMPER + " "
	set category = "Эмоции"
	emote_with_delay("whimper", timer)

/mob/living/carbon/human/verb/emote_wsmile()
	set name = "◦ " + EMOTE_SPECIES_WSMILE + " "
	set category = "Эмоции"
	emote_with_delay("wsmile", timer)

/mob/living/carbon/human/verb/emote_smile()
	set name = "◦ " + EMOTE_SMILE + " "
	set category = "Эмоции"
	emote_with_delay("smile", timer)

/mob/living/carbon/human/verb/emote_smug()
	set name = "◦ " + EMOTE_SPECIES_SMUG + " "
	set category = "Эмоции"
	emote_with_delay("smug", timer)

/mob/living/carbon/human/verb/emote_look()
	set name = "◦ " + EMOTE_LOOK + " "
	set category = "Эмоции"
	emote_with_delay("look", timer)

/mob/living/carbon/human/verb/emote_nod()
	set name = "◦ " + EMOTE_SPECIES_NOD + " "
	set category = "Эмоции"
	emote_with_delay("nod", timer)

/mob/living/carbon/human/verb/emote_msqueak()
	set name = "◦ " + EMOTE_SPECIES_MSQUEAK + " "
	set category = "Эмоции"
	emote_with_delay("msqueak", timer)

/mob/living/carbon/human/verb/emote_pout()
	set name = "◦ " + EMOTE_SPECIES_POUT + " "
	set category = "Эмоции"
	emote_with_delay("pout", timer)

/mob/living/carbon/human/verb/emote_scowl()
	set name = "◦ " + EMOTE_SPECIES_SCOWL + " "
	set category = "Эмоции"
	emote_with_delay("scowl", timer)

/mob/living/carbon/human/verb/emote_shake()
	set name = "◦ " + EMOTE_SPECIES_SHAKE + " "
	set category = "Эмоции"
	emote_with_delay("shake", timer)

/mob/living/carbon/human/verb/emote_shiver()
	set name = "◦ " + EMOTE_SHIVER + " "
	set category = "Эмоции"
	emote_with_delay("shiver", timer)

/mob/living/carbon/human/verb/emote_grin()
	set name = "◦ " + EMOTE_GRIN + " "
	set category = "Эмоции"
	emote_with_delay("grin", timer)


/mob/living/carbon/human/verb/emote_grimace()
	set name = "◦ " + EMOTE_SPECIES_GRIMACE + " "
	set category = "Эмоции"
	emote_with_delay("grimace", timer)

/mob/living/carbon/human/verb/emote_jump()
	set name = "◦ " + EMOTE_SPECIES_JUMP + " "
	set category = "Эмоции"
	emote_with_delay("jump", timer)

/mob/living/carbon/human/verb/emote_cross()
	set name = "◦ " + EMOTE_CARBON_CROSS + " "
	set category = "Эмоции"
	emote_with_delay("cross", timer)

/mob/living/carbon/human/verb/emote_drool()
	set name = "◦ " + EMOTE_DROOL + " "
	set category = "Эмоции"
	emote_with_delay("drool", timer)

/mob/living/carbon/human/verb/emote_airguitar()
	set name = "◦ " + EMOTE_SPECIES_AIRGUITAR + " "
	set category = "Эмоции"
	emote_with_delay("airguitar", timer)

/mob/living/carbon/human/verb/emote_blink()
	set name = "◦ " + EMOTE_CARBON_BLINK + " "
	set category = "Эмоции"
	emote_with_delay("blink", timer)

/mob/living/carbon/human/verb/emote_blink_r()
	set name = "◦ " + EMOTE_CARBON_BLINKR + " "
	set category = "Эмоции"
	emote_with_delay("blink_r", timer)

/mob/living/carbon/human/verb/emote_blush()
	set name = "◦ " + EMOTE_BLUSH + " "
	set category = "Эмоции"
	emote_with_delay("blush", timer)

/mob/living/carbon/human/verb/emote_bow()
	set name = "◦ " + EMOTE_BOW + " "
	set category = "Эмоции"
	emote_with_delay("bow", timer)

/mob/living/carbon/human/verb/emote_burp()
	set name = "◦ " + EMOTE_BURP + " "
	set category = "Эмоции"
	emote_with_delay("burp", timer)

/mob/living/carbon/human/verb/emote_scratch()
	set name = "◦ " + EMOTE_SPECIES_SCRATCH + " "
	set category = "Эмоции"
	emote_with_delay("scratch", timer)

/mob/living/carbon/human/verb/emote_chuckle()
	set name = "◦ " + EMOTE_CARBON_CHUCKLE + " "
	set category = "Эмоции"
	emote_with_delay("chuckle", timer)

/mob/living/carbon/human/verb/emote_glare()
	set name = "◦ " + EMOTE_GLARE + " "
	set category = "Эмоции"
	emote_with_delay("glare", timer)

/mob/living/carbon/human/verb/emote_grunt()
	set name = "◦ " + EMOTE_SPECIES_GRUMBLE + " "
	set category = "Эмоции"
	emote_with_delay("grumble", timer)



/////////////////////////// Exercise Emotes ///////////////////////////
// /mob/living/carbon/human/verb/emote_exercise() // Кто починит это будет молодец
// 	set name = "⚝ " + EMOTE_EXERCISE
// 	set category = "Эмоции"
// 	emote_with_delay("exercise", timer)

// /mob/living/carbon/human/verb/emote_pushup()
// 	set name = "⚝ " + EMOTE_PUSHUP
// 	set category = "Эмоции"
// 	emote_with_delay("pushup", timer)

// /mob/living/carbon/human/verb/emote_squat()
// 	set name = "⚝ " + EMOTE_SQUAT
// 	set category = "Эмоции"
// 	emote_with_delay("squat", timer)

/// Слишком переполненное меню, убираю то что легче написать чем искать. ///
/*

/mob/living/carbon/human/verb/emote_dap()
	set name = "▷ " + EMOTE_SPECIES_DAP + " "
	set category = "Эмоции"
	emote_with_delay("dap", timer)

/mob/living/carbon/human/verb/emote_point()
	set name = "◦ " + EMOTE_POINT + " " // Куда блять показывать...
	set category = "Эмоции"
	emote_with_delay("point", timer)

/mob/living/carbon/human/verb/emote_hug()
	set name = "◦ " + EMOTE_SPECIES_HUG + " " // Обнимать себя конечно смешно, но бесполезно.
	set category = "Эмоции"
	emote_with_delay("hug", timer)

/mob/living/carbon/human/verb/emote_signal()
	set name = "◦ " + EMOTE_SPECIES_SIGNAL + " "
	set category = "Эмоции"
	var/Cnt = input("Руки должны быть свободны", "Показать несколько пальцев", 1) in list(1,2,3,4,5,6,7,8,9,10)
	emote_with_delay("signal", message = Cnt)
*/

// /mob/living/carbon/human/proc/emote_bark()
// 	set name = "► " + EMOTE_SPECIES_BARK + " "
// 	set category = "Эмоции"
// 	emote_with_delay("bark", timer)

// /mob/living/carbon/human/proc/emote_wbark()
// 	set name = "► " + EMOTE_SPECIES_WBARK + " "
// 	set category = "Эмоции"
// 	emote_with_delay("wbark", timer)
