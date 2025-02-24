//Код ниже по большей части нужен для ребаланса миссий оффов
/*
	Acquire: True Love
*/

/datum/mission/acquire/true_love
	weight = 3
	value = 700
	duration = 40 MINUTES
	num_wanted = 1

/datum/mission/acquire/true_love/puce
	weight = 1

/datum/mission/acquire/true_love/fireblossom
	weight = 1

/datum/mission/acquire/true_love/icepepper
	weight = 1

/datum/mission/acquire/true_love/strange_crystal
	value = 4000
	weight = 1

/*
Acquire: Anomaly
*/

/datum/mission/acquire/anomaly
	weight = 8
	value = 2000
	duration = 80 MINUTES
	dur_mod_range = 0.2
	num_wanted = 1

/datum/mission/acquire/anomaly/New(...)
	var/group = pick(list(
		"Cybersun Industries",
		"Elysium National Pseudosciences",
		"Nanotrasen Anomalous Studies Division",
		"The Naturalienwissenschaftlicher Studentenverbindungs-Verband",
		"The Solarianische Anomalie-Forschungsagentur",
		"DeForest Chemical Research Division",
		"An unknown man in a cape with a red striped hat"
	))

	desc = "[group] has requested that a ship [pick(list("procure", "grab", "acquire", "find", "locate"))] \
	an anomaly core for [pick(list("research", "analysis", "technical development", "closer inspection", "some reason"))]. \
	They've offered to pay well, so we're relaying this mission to you"
	. = ..()

/*
		Acquire: The Creature
*/

/datum/mission/acquire/creature
	value = 1250
	duration = 60 MINUTES
	weight = 6
	num_wanted = 1
	count_stacks = FALSE

/datum/mission/acquire/creature/legion
	value = 750

/datum/mission/acquire/creature/migo
	value = 750
	weight = 2

/*
		Acquire: Salvage
*/

/datum/mission/acquire/landmine
	desc = "The Solar Federation and Vigilitas Interstellar have assigned us to offer a bounty to turn in disarmed ordnance for future ventures. We'll pay you well, but we're not responsible for any accidents."
	weight = 6
	value = 500
	duration = 80 MINUTES
	dur_mod_range = 0.4
	num_wanted = 2

/datum/mission/acquire/bounty
	desc = "SolFed has posted several bounties for wanted members of both the Frontiersman and the Clique. Bring back their tags, we'll reward you well."
	weight = 4
	value = 4000
	duration = 120 MINUTES
	dur_mod_range = 0.1
	num_wanted = 3

/*
		Acquire: Fishing
*/

/datum/mission/acquire/fish
	weight = 2
	duration = 60 MINUTES
	val_mod_range = 0.2

/datum/mission/acquire/fish/New(...)
	num_wanted = rand(1,3)
	value = (750*num_wanted)
	. = ..()
