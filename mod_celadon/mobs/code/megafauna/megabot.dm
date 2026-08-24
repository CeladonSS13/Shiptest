/mob/living/simple_animal/hostile/megafauna/megabot
	name = "\"Tortoise\" Heavy Defender"
	desc = "The largest drone fielded by Vigilitas Interstellar, the Tortoise was manufactured in response to Nanotrasen executives feeling threatened after the first Syndicate strike attack. \
	Settling for nothing other than the most intimidating presence, the Tortoise was blueprinted and manufactured to dissuade any attempts of attack against them. \
	The Tortoise quickly garnered itself fearsome reputation for its formidable armament, size, and lethality against Syndicate forces. Often now resigned to warehouses, \
	a small amount still see fielding in areas needing the tightest security, with some reports of rogue models roaming old ruins of war."

	icon = 'mod_celadon/_storage_icons/icons/mobs/64x64megafauna.dmi'

	casingtype = /obj/item/ammo_casing/energy/laser/nanotrasen/assault/megabot

/obj/item/ammo_casing/energy/laser/nanotrasen/assault/megabot
	projectile_type = /obj/projectile/beam/laser/nanotrasen/assault/megabot

/obj/projectile/beam/laser/nanotrasen/assault/megabot
	speed = 0.8

/obj/projectile/beam/laser/nanotrasen/assault/megabot/burst

/obj/item/ammo_casing/energy/laser/nanotrasen/assault/megabot/burst
	pellets = 3
	variance = 25

/obj/effect/temp_visual/megabot
	icon = 'mod_celadon/_storage_icons/icons/mobs/64x64megafauna.dmi'
	icon_state = "laser_indicator"

/obj/effect/temp_visual/megabot/laser
	icon_state = "laser_indicator"

/obj/effect/temp_visual/megabot/charge
	icon_state = "charge_indicator"
