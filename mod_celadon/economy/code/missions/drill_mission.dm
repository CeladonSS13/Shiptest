//Код ниже по большей части нужен для ребаланса миссий оффов
/datum/mission/drill
	name = "Class 1 core sample mission"
	desc = "We require geological information from one of the neighboring planetoids. \
			Please anchor the drill in place and defend it until it has gathered enough samples.\
			Operation of the core sampling drill is extremely dangerous, caution is advised."
	value = 1500
	duration = 80 MINUTES
	weight = 8

	num_wanted = 4
	class_wanted = 1

/datum/mission/drill/New(...)
	num_wanted = rand(num_wanted - 2, num_wanted + 2)
	value = (num_wanted * (value / 10) + 1000)
	return ..()

/datum/mission/drill/classtwo
	name = "Class 2 core sample mission"
	value = 3500
	duration = 90 MINUTES
	weight = 6
	class_wanted = 2
	num_wanted = 6

/datum/mission/drill/classthree
	name = "Class 3 core sample mission"
	value = 6000
	duration = 100 MINUTES
	weight = 4
	class_wanted = 3
	num_wanted = 8

/*
/// MARK:		Core sampling drill
*/

// /obj/machinery/drill/mission
// 	name = "core sampling research drill"
// 	desc = "A specialized laser drill designed to extract geological samples."

// 	num_current = 0
// 	// mission_class
// 	// num_wanted

// /obj/machinery/drill/mission/examine()
// 	. = ..()
// 	. += "<span class='notice'>The drill contains [num_current] of the [num_wanted] samples needed.</span>"

// /obj/machinery/drill/mission/start_mining()
// 	if(mining.vein_class < mission_class && mining)
// 		say("Error: A vein class of [mission_class] or greater is required for operation.")
// 		return
// 	. = ..()

// /obj/machinery/drill/mission/mine_success()
// 	num_current++
