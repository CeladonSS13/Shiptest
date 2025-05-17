//временный фикс говнокода оффов
/obj/machinery/porta_turret/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	id = "[text_ref(port)][id]"
	port.turret_list |= WEAKREF(src)

/obj/machinery/porta_turret/set_state(on, new_lethal, new_flags)
	.=..()
	if(!isnull(new_flags))
		turret_flags = new_flags

	lethal = new_lethal
	toggle_on(on)
	power_change()

/obj/machinery/turretid/late_connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	.=..()
	SIGNAL_HANDLER

	for(var/datum/weakref/ship_gun as anything in port.turret_list)
		var/obj/machinery/porta_turret/turret_gun = ship_gun.resolve()
		//skip if it doesn't exist or if the id doesn't match
		if(turret_gun?.id != id)
			continue

		turret_refs += ship_gun

	update_turrets()
	UnregisterSignal(port, COMSIG_SHIP_DONE_CONNECTING)

//дает всем турелям нормальные флаги для агрессивного поведения
/obj/machinery/porta_turret
	turret_flags = TURRET_FLAG_DEFAULT_CELADON

/obj/machinery/turretid
	turret_flags = TURRET_FLAG_DEFAULT_CELADON

// Syndicate outdated turrets
/obj/machinery/porta_turret/syndicate/interior_45
	name = "machine gun turret (.45)"
	desc = "Syndicate interior defense turret chambered for .45 rounds. Designed to down intruders without damaging the hull."
	stun_projectile = /obj/projectile/bullet/midbullet
	lethal_projectile = /obj/projectile/bullet/midbullet
	lethal_projectile_sound = 'sound/weapons/gun/revolver/cattleman.ogg'
	stun_projectile_sound = 'sound/weapons/gun/revolver/cattleman.ogg'

/obj/machinery/porta_turret/syndicate/exterior_7_62mm
	name = "machine gun turret (7.62)"
	desc = "Syndicate exterior defense turret chambered for 7.62 rounds. Designed to down intruders with heavy calliber bullets."
	stun_projectile = /obj/projectile/bullet
	lethal_projectile = /obj/projectile/bullet
	lethal_projectile_sound = 'sound/weapons/gun/rifle/skm.ogg'
	stun_projectile_sound = 'sound/weapons/gun/rifle/skm.ogg'

/obj/machinery/porta_turret/syndicate/grenade_40mm
	name = "mounted grenade launcher (40mm)"
	desc = "Syndicate 40mm grenade launcher defense turret. If you've had this much time to look at it, you're probably already dead."
	icon = 'mod_celadon/_storge_icons/icons/turrets.dmi'
	icon_state = "syndie_grenade"
	base_icon_state = "syndie_grenade"
	stun_projectile = /obj/projectile/bullet/a40mm
	lethal_projectile = /obj/projectile/bullet/a40mm
	lethal_projectile_sound = 'sound/weapons/gun/general/rocket_launch.ogg'
	stun_projectile_sound = 'sound/weapons/gun/general/rocket_launch.ogg'

/obj/machinery/porta_turret/syndicate/assault_pod_4_36x30mm
	name = "machine gun turret (4.6x30mm)"
	desc = "Syndicate exterior defense turret chambered for 4.6x30mm rounds. Designed to be fitted to assault pods, it uses low calliber bullets to save space."
	max_integrity = 100
	stun_projectile = /obj/projectile/bullet/weakbullet3
	lethal_projectile = /obj/projectile/bullet/weakbullet3
	lethal_projectile_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'
	stun_projectile_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

// No Access
/obj/machinery/porta_turret/syndicate/no_access
	// installation = null
	// always_up = 1
	use_power = NO_POWER_USE
	// has_cover = 0
	scan_range = 9
	req_access = list(ACCESS_CENT_GENERAL)
	lethal = TRUE
	faction = list(ROLE_HIVE)
	desc = "A ballistic machine gun/grenade auto-turret."

/obj/machinery/porta_turret/syndicate/no_access/interior_45
	name = "machine gun turret (.45)"
	desc = "Syndicate interior defense turret chambered for .45 rounds. Designed to down intruders without damaging the hull."
	stun_projectile = /obj/projectile/bullet/midbullet
	lethal_projectile = /obj/projectile/bullet/midbullet
	lethal_projectile_sound = 'sound/weapons/gun/revolver/cattleman.ogg'
	stun_projectile_sound = 'sound/weapons/gun/revolver/cattleman.ogg'

/obj/machinery/porta_turret/syndicate/no_access/exterior_7_62mm
	name = "machine gun turret (7.62)"
	desc = "Syndicate exterior defense turret chambered for 7.62 rounds. Designed to down intruders with heavy calliber bullets."
	stun_projectile = /obj/projectile/bullet
	lethal_projectile = /obj/projectile/bullet
	lethal_projectile_sound = 'sound/weapons/gun/rifle/skm.ogg'
	stun_projectile_sound = 'sound/weapons/gun/rifle/skm.ogg'

/obj/machinery/porta_turret/syndicate/no_access/grenade_40mm
	name = "mounted grenade launcher (40mm)"
	desc = "Syndicate 40mm grenade launcher defense turret. If you've had this much time to look at it, you're probably already dead."
	icon = 'mod_celadon/_storge_icons/icons/turrets.dmi'
	icon_state = "syndie_grenade"
	base_icon_state = "syndie_grenade"
	stun_projectile = /obj/projectile/bullet/a40mm
	lethal_projectile = /obj/projectile/bullet/a40mm
	lethal_projectile_sound = 'sound/weapons/gun/general/rocket_launch.ogg'
	stun_projectile_sound = 'sound/weapons/gun/general/rocket_launch.ogg'

/obj/machinery/porta_turret/syndicate/no_access/assault_pod_4_36x30mm
	name = "machine gun turret (4.6x30mm)"
	desc = "Syndicate exterior defense turret chambered for 4.6x30mm rounds. Designed to be fitted to assault pods, it uses low calliber bullets to save space."
	max_integrity = 100
	stun_projectile = /obj/projectile/bullet/weakbullet3
	lethal_projectile = /obj/projectile/bullet/weakbullet3
	lethal_projectile_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'
	stun_projectile_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

/obj/machinery/porta_turret/syndicate/no_access/energy
	icon_state = "standard_lethal"
	base_icon_state = "standard"
	stun_projectile = /obj/projectile/energy/electrode
	stun_projectile_sound = 'sound/weapons/taser.ogg'
	lethal_projectile = /obj/projectile/beam/laser
	lethal_projectile_sound = 'sound/weapons/laser.ogg'
	desc = "An energy blaster auto-turret."

/obj/machinery/porta_turret/syndicate/no_access/energy/heavy
	icon_state = "standard_lethal"
	base_icon_state = "standard"
	stun_projectile = /obj/projectile/energy/electrode
	stun_projectile_sound = 'sound/weapons/taser.ogg'
	lethal_projectile = /obj/projectile/beam/laser/heavylaser
	lethal_projectile_sound = 'sound/weapons/lasercannonfire.ogg'
	desc = "An energy blaster auto-turret."

/obj/machinery/porta_turret/syndicate/no_access/energy/raven
	stun_projectile =  /obj/projectile/beam/laser
	stun_projectile_sound = 'sound/weapons/laser.ogg'
	faction = list("neutral","silicon","turret")

// Ручная турель Элизиума

/obj/machinery/deployable_turret/elysium
	name = "Ручной пулемёт Элизиума"
	desc = "Оснащён одним стволом и стреляет калибром 9 мм. Стреляет очередью из трёх выстрелов."
	icon_state = "hmg"
	max_integrity = 250
	projectile_type = /obj/projectile/bullet/c9mm
	anchored = TRUE
	number_of_shots = 3
	cooldown_duration = 2 SECONDS
	rate_of_fire = 1
	firesound = 'mod_celadon/_storge_sounds/sound/gun/turret9mm.ogg'
	overheatsound = 'sound/weapons/gun/smg/smgrack.ogg'
	can_be_undeployed = TRUE
	spawned_on_undeploy = /obj/item/deployable_turret_folded

// Elysium separatists turrets - не знаю зачем вообще сепарам турели, но пусть будут

/obj/machinery/porta_turret/ship/elysium
	name = "Scrapped SKM Turret"
	desc = "A scrappy turret designed by Separatist's Ahisa'i. It's pretty much just a SKM with some stolen turret machinery. Effective!"
	faction = list(FACTION_PLAYER_ELYSIUM, "turret")
	stun_projectile = /obj/projectile/bullet/a762_40/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/spitter.ogg'
	lethal_projectile = /obj/projectile/bullet/a762_40
	lethal_projectile_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'
	scan_range = 9
	shot_delay = 15
	max_integrity = 150 //сепарские турели очевидно не особо крепкие

/obj/machinery/porta_turret/ship/elysium/light
	name = "Scrapped 10x22mm Light Turret"
	desc = "A light Separatist's Ahisai'i turret. Shoots 10x22mm projectiles at a close range."
	stun_projectile = /obj/projectile/bullet/c10mm/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/vector_fire.ogg'
	lethal_projectile = /obj/projectile/bullet/c10mm
	lethal_projectile_sound = 'sound/weapons/gun/smg/sidewinder.ogg'
	scan_range = 5
	shot_delay = 5
	max_integrity = 100

/obj/machinery/porta_turret/ship/elysium/heavy
	name = "Scrapped .308 Heavy Turret"
	desc = "A bit more advanced turret designed by Separatist's Ahisa'i. It has some high quality sensors and uses a more powerful caliber."
	stun_projectile = /obj/projectile/bullet/a308/rubber
	stun_projectile_sound = 'sound/weapons/gun/sniper/cmf90.ogg'
	lethal_projectile = /obj/projectile/bullet/a308
	lethal_projectile_sound = 'sound/weapons/gun/sniper/shot.ogg'
	scan_range = 15
	shot_delay = 20

//Solar Federation turrets

/obj/machinery/porta_turret/ship/solfed
	name = "Solarian Gauss Turret"
	desc = "An effective gauss defence system used by Solfed's vessels. Uses ferromagnetic pellets."
	faction = list(FACTION_PLAYER_SOLFED, "turret")
	stun_projectile = /obj/projectile/bullet/a556_42/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/shot.ogg'
	lethal_projectile = /obj/projectile/bullet/gauss
	lethal_projectile_sound = 'sound/weapons/gun/gauss/gar.ogg'
	scan_range = 10
	shot_delay = 15

/obj/machinery/porta_turret/ship/solfed/light
	name = "Solarian Light Gauss Turret"
	desc = "A close-range light gauss 'defence system' used by Solfed's vessels. Uses ferromagnetic slugs."
	stun_projectile = /obj/projectile/bullet/c9mm/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/vector_fire.ogg'
	lethal_projectile = /obj/projectile/bullet/gauss/slug
	lethal_projectile_sound = 'sound/weapons/gun/gauss/modelh.ogg'
	scan_range = 8
	shot_delay = 10

/obj/machinery/porta_turret/ship/solfed/heavy
	name = "Solarian Heavy Gauss Turret"
	desc = "A powerful heavy gauss defence system used by Solfed's vessels. Uses ferromagnetic lances."
	stun_projectile = /obj/projectile/bullet/a75clip/rubber
	stun_projectile_sound = 'sound/weapons/gun/gauss/magrifle.ogg'
	lethal_projectile = /obj/projectile/bullet/gauss/lance
	lethal_projectile_sound = 'sound/weapons/gun/gauss/claris.ogg'
	scan_range = 20
	shot_delay = 20
	max_integrity = 300

//Syndicate turrets - баллистические синди турели ибо оффы сделали их НГР

/obj/machinery/porta_turret/ship/syndicate/ballistic
	name = "Gorlex Ballistic Defence"
	desc = "A ballistic turret designed by the Gorlex Maurauders. A standart defence system."
	faction = list(FACTION_PLAYER_SYNDICATE, "turret")
	stun_projectile = /obj/projectile/bullet/c57x39mm/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/sidewinder.ogg'
	lethal_projectile = /obj/projectile/bullet/c57x39mm
	lethal_projectile_sound = 'sound/weapons/gun/smg/sidewinder.ogg'
	icon_state = "syndie_off"
	base_icon_state = "syndie"

/obj/machinery/porta_turret/ship/syndicate/ballistic/light
	name = "Light Gorlex Ballistic Defence"
	desc = "A low powered ballistic turret designed by the Gorlex Maurauders. Fires classic .45 projectiles."
	stun_projectile = /obj/projectile/bullet/c45/rubber
	stun_projectile_sound = 'sound/weapons/gun/smg/cobra.ogg'
	lethal_projectile = /obj/projectile/bullet/c45
	lethal_projectile_sound = 'sound/weapons/gun/smg/cobra.ogg'

/obj/machinery/porta_turret/ship/syndicate/ballistic/heavy
	name = "Heavy Gorlex Ballistic Defence"
	desc = "A heavy ballistic turret designed by the Gorlex Maurauders. An extremely powerful defence system."
	stun_projectile = /obj/projectile/bullet/a75clip/rubber
	stun_projectile_sound = 'sound/weapons/gun/sniper/cmf90.ogg'
	lethal_projectile = /obj/projectile/bullet/a75clip
	lethal_projectile_sound = 'sound/weapons/gun/sniper/cmf90.ogg'
	max_integrity = 300

/obj/machinery/porta_turret/ship/syndicate/weak
	desc = "A low powered turret designed by the Gorlex Maurauders. Effectively weaponizes mining equipment." //no fucking icw

//Nanotrasen turrets - даем хеви турелям хевилазеры дизейблера

/obj/machinery/porta_turret/ship/nt/heavy
	stun_projectile = /obj/projectile/beam/disabler/heavylaser/sharplite
	stun_projectile_sound = 'sound/weapons/wave.ogg'

/obj/machinery/porta_turret/ship/nt/pulse
	stun_projectile = /obj/projectile/beam/disabler/heavylaser/sharplite
	stun_projectile_sound = 'sound/weapons/wave.ogg'

//Pirate turrets - даем фракцию пиратов вместо фронтиров

/obj/machinery/porta_turret/ship/frontiersmen
	faction = list(FACTION_PIRATES, "Turret")
	icon_state = "syndie_off"
	base_icon_state = "syndie"
