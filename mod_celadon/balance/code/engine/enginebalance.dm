/*
/obj/machinery/power/shuttle/engine/electric
После пра оффов эффективность двигателя стала зависеть от деталей внутри https://github.com/shiptest-ss13/Shiptest/pull/5441
У премиумных двигателей т3 детали, но обычная плата. Имеют в стоке т3, т.е. у них 16 траста
В стоке сейчас у обычных ионных thrust = 4
С т3 деталями у обычного ионного thrust = 12
В целом, т2 и т3 не встречаются, а их никто нормально не балансил в РнД, но чтобы их забалансить нужно трогать все РнД.
*/
/obj/machinery/power/shuttle/engine/electric/tech1
	name = "1st gen ion thruster"
	desc = "A thruster that expels charged particles to generate thrust."
	circuit = /obj/item/circuitboard/machine/shuttle/engine/electric/tech1
	icon_state = "tech1"
	icon_state_off = "tech1_off"
	icon_state_closed = "tech1"
	icon_state_open = "tech1_open"
	thrust = 6 // с т2 12, с т3 18, с т4 24.
	power_per_burn = 75000 // 50000*1.5

/obj/machinery/power/shuttle/engine/electric/tech2
	name = "2nd gen ion thruster"
	desc = "A thruster that expels charged particles to generate thrust."
	circuit = /obj/item/circuitboard/machine/shuttle/engine/electric/tech2
	icon_state = "tech2"
	icon_state_off = "tech2_off"
	icon_state_closed = "tech2"
	icon_state_open = "tech2_open"
	thrust = 7 // с т2 14, с т3 21, с т4 28
	// Мы же знаем, что никто из игроков не знает про фичу того, что можно увеличить вывод в СМЕСе и получать их истинный траст?
	power_per_burn = 100000 // 50000*2

/obj/machinery/power/shuttle/engine/electric/tech3
	name = "3rd gen ion thruster"
	desc = "A thruster that expels charged particles to generate thrust."
	circuit = /obj/item/circuitboard/machine/shuttle/engine/electric/tech3
	icon_state = "tech3"
	icon_state_off = "tech3_off"
	icon_state_closed = "tech3"
	icon_state_open = "tech3_open"
	thrust = 8 // с т2 16, с т3 24, с т4 32.
	power_per_burn = 150000 // 50000*3
