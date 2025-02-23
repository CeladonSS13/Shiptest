//Код ниже по большей части нужен для ребаланса миссий оффов
/datum/mission/research
	value = 2000 // base value, before adding bonus for number of things to fly through
	duration = 60 MINUTES
	weight = 8

	num_current = 0
	num_wanted = 5

/datum/mission/research/ion
	value = 3500

/datum/mission/research/meteor
	value = 1500
	weight = 4

/datum/mission/research/carp
	value = 750
	weight = 4
	num_wanted = 3

/datum/mission/research/dust
	value = 400
	weight = 4
