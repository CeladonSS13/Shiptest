// MARK: Autolathe Designs

// В данном файле прописываются новые датумы для последующего добавления в автолат.
// Возможно в будущем стоит переместить этот файл в другую категорию, а не balance.
// Для изменения баланса коркод вещей в автолате: mod_celadon\balance\code\designs\autolathe_designs.dm
// Коркод файл с design для автолата: code\modules\research\designs\autolathe_designs.dm

/datum/design/blast_door_circuit
	name = "Blast Door Circuit"
	id = "blast_door_circuit"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = 200)
	build_path = /obj/item/assembly/control
	category = list("initial", "Electronics")

/datum/design/board/rdserver
	build_type = AUTOLATHE | IMPRINTER
	category = list("Research Machinery", "initial", "Equipment", "Machinery")

/datum/design/board/space_heater
	category = list ("Engineering Machinery", "initial", "Equipment", "Machinery")

/datum/design/board/ship_gravity
	category = list("Misc. Machinery", "initial", "Equipment", "Machinery")
