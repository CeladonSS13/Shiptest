//Код ниже по большей части нужен для ребаланса миссий оффов
/datum/mission/research
	value = 2000
	weight = 0 // Чтобы родитель с электрическим штормом не сдублировался. Электрический шторм вынесен в потомка
	var/rand_num = 1
	var/type_mission = ""	// Нужно для определения типа миссии для рандомизатора цен


/datum/mission/research/New(...)
	switch(type_mission)
		if("electrical")
			value = (value * rand(1, 1.5))
		if("ion")
			value = (value * rand(1, 1.5))
		if("meteor")
			value = (value * (rand(2, 5) / 2))
		if("carp")
			value = (value * (rand(2, 5)) / 1.5)
		if("dust")
			value = (value * rand(2, 5))
		if("")
			value = (value * rand(1, 1.5))

	return ..()

/datum/mission/research/electrical
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
	type_mission = "electrical"

// commented out until ion storms aren't literal torture
/datum/mission/research/ion
	name = "Ion storm research mission"
	desc = "We require data on the behavior of ion storms in the system for an ongoing study. \
			Please anchor the attached sensor array to your ship and fly it through the storms. \
			It must be powered to collect the data."
	value = 5500
	objective_type = /datum/overmap/event/emp
	type_mission = "ion"

/datum/mission/research/meteor
	value = 1500
	weight = 4
	num_wanted = 3
	type_mission = "meteor"

/datum/mission/research/carp
	value = 750
	weight = 4
	num_wanted = 3
	type_mission = "carp"

/datum/mission/research/dust
	value = 400
	weight = 4
	num_wanted = 3
	type_mission = "dust"
