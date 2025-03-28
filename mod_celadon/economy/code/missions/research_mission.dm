//Код ниже по большей части нужен для ребаланса миссий оффов
/datum/mission/research
	value = 2000
	weight = 0 // Чтобы родитель с электрическим штормом не сдублировался. Электрический шторм вынесен в потомка

/datum/mission/research/New(...)
	switch(type_mission)
		if("electrical")
			value = (value * rand(1, 1.5))
		if("ion")
			value = (value * rand(1, 1.5))
		if("meteor")
			value = (value * (rand(2, 5) / 2))
		if("carp")
			value = ((value * rand(2, 5)) / 1.5)
		if("dust")
			value = (value * rand(2, 5))
		if("mission")
			value = (value * rand(1, 1.5))

	return ..()

/datum/mission/research/electrical
	type_mission = "electrical"
	name = "Electrical storm research mission"
	desc = "We require data on the behavior of electrical storms in the system for an ongoing study. \
			Please anchor the attached sensor array to your ship and fly it through the storms.\
			It must be powered to collect the data. "
	value = 3000
	duration = 60 MINUTES
	weight = 8

	objective_type = /datum/overmap/event/electric

	num_current = 0
	num_wanted = 5

// commented out until ion storms aren't literal torture
/datum/mission/research/ion
	type_mission = "ion"
	name = "Ion storm research mission"
	desc = "We require data on the behavior of ion storms in the system for an ongoing study. \
			Please anchor the attached sensor array to your ship and fly it through the storms. \
			It must be powered to collect the data."
	value = 5500
	objective_type = /datum/overmap/event/emp

/datum/mission/research/meteor
	type_mission = "meteor"
	value = 1500
	weight = 4
	num_wanted = 3

/datum/mission/research/carp
	type_mission = "carp"
	value = 750
	weight = 4
	num_wanted = 3

/datum/mission/research/dust
	type_mission = "dust"
	value = 400
	weight = 4
	num_wanted = 3
