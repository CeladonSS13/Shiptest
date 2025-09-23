/datum/instrument/fun
	name = "Generic Fun Instrument"
	category = "Fun"
	abstract_type = /datum/instrument/fun

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
/datum/instrument/fun/honk
	name = "!!HONK!!"
	id = "honk"
	real_samples = list("74"='sound/items/bikehorn.ogg') // Cluwne Heaven
// [/CELADON-ADD]

/datum/instrument/fun/signal
	name = "Ping"
	id = "ping"
	real_samples = list("79"='sound/machines/ping.ogg')

/datum/instrument/fun/chime
	name = "Chime"
	id = "chime"
	real_samples = list("79"='sound/machines/chime.ogg')
