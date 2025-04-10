/datum/supply_pack/faction/nanotrasen/gun
	group = "Guns"

// Переопределяем, чтобы приходило в кейсе, в отличии от оффов.
/datum/supply_pack/gun/energy/disabler
	name = "NT-SL Disabler"
	desc = "A self-defense weapon that exhausts organic targets, weakening them until they collapse. Produced by Nanotrasen-Sharplite."
	contains = list(/obj/item/storage/guncase/disabler)

/datum/supply_pack/gun/energy/taser
	name = "NT-SL Hybrid Taser"
	desc = "A dual-mode taser designed to fire both short-range high-power electrodes and long-range disabler beams. Produced by Nanotrasen-Sharplite."
	contains = list(/obj/item/storage/guncase/advtaser)

// Корректируем названия и описания из списка оффовских кейсов в карго.

/datum/supply_pack/gun/ion
	name = "NT-SL Ion rifle"
	desc = "A man-portable anti-armor weapon designed to disable mechanical threats at range. Produced by Nanotrasen-Sharplite."

/datum/supply_pack/gun/vector
	name = "VI Vector SMG"

/datum/supply_pack/gun/laser
	name = "NT- SL L-204 laser gun"
	desc = "Basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal. Produced by Nanotrasen-Sharplite."

/datum/supply_pack/gun/hades
	name = "NT-SL AL-655 'Hades' energy rifle"
	desc = "Nanotrasen's pride in energy weapon development. This premium assault rifle is the most reliable Nanotrasen-Sharplite energy weapon. Good for burning armored targets!"

/datum/supply_pack/gun/etar
	name = "NT-SL 'E-TAR' SMG energy rifle"

/datum/supply_pack/gun/ultima
	name = "NT-SL 'E-SG 500 Second Edition' energy shotgun"

/datum/supply_pack/gun/energy
	name = "NT-SL-E-Rifle"
	desc = "One of the most basic energy weapons in the universe. Shoots lethal and disabler lasers. A simple, yet an efficient PDW. It is the egun. Produced by Nanotrasen-Sharplite"

/datum/supply_pack/gun/mini_energy
	name = "NT-SL-X26 Miniature energy pistol"
	desc = "One of the most basic energy weapons in the universe. Compact but low capacity. Shoots lethal and disabler lasers. A simple, yet an inefficient PDW. Power in a pocket! Produced by Nanotrasen-Sharplite"

/datum/supply_pack/gun/commanders
	name = "VI 'Commander' handgun"

/datum/supply_pack/gun/wt550
	name = "VI WT-550 Automatic rifle"
	desc = "A ballistic PDW produced by Vigilitas Interstellar. Quite old, but still is amazing at filling corporation's enemies with lead. Uses 4.6x30mm rounds"

/datum/supply_pack/gun/saber
	name = "VI Saber SMG"
	desc = "An experimental ballistic weapon produced by Vigilitas Interstellar. Uses 9mm rounds"

/datum/supply_pack/faction/nanotrasen/gun/cryogelida
	name = "NT-SL PPD-142 'Cryogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Freeze firemode is perfect for cooling syndicate terrorists' heat, and frostbite firemode allows for sending them back into ice age. It synergizes well with Pyrogelida plasma pistol."
	contains = list(/obj/item/storage/guncase/cryogelida)
	cost = 8000

/datum/supply_pack/faction/nanotrasen/gun/pyrogelida
	name = "NT-SL PPD-238 'Pyrogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Burn firemode is perfect for non-Geneva-convention-violating combat, and IMMOLATE mode lets you commit warcrimes at the rate of 50 per minute. It synergizes well with Cryogelida plasma pistol."
	contains = list(/obj/item/storage/guncase/pyrogelida)
	cost = 9000

/datum/supply_pack/faction/nanotrasen/gun/heavylaser
	name = "NT-SL Laser Accelerator Cannon"
	desc = "A sniper-like Nanotrasen laser gun that deals more damage if the target is far away. You can't attach a scope to it, though"
	contains = list(/obj/item/storage/guncase/heavylaser)
	cost = 3500

/datum/supply_pack/faction/nanotrasen/gun/ion_carbine
	name = "NT-SL-MK2 Ion carbine"
	desc = "An improved model on the ion projector, built to be more compact and ergonomic, while keeping the same max charge. Developed by Nanotrasen-Sharplite"
	contains = list(/obj/item/storage/guncase/ion_carbine)
	cost = 11000
