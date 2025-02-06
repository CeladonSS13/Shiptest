// Переобределяем метод из атома для факса, слушаем сигнал от корабля, которому факс принадлежит
/obj/machinery/fax/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	RegisterSignal(port.current_ship, COMSIG_SHIP_DONE_LOADING, PROC_REF(late_connect_to_shuttle))

// Меняем название, добавляя в него зону
/obj/machinery/fax/proc/late_connect_to_shuttle()
	SIGNAL_HANDLER
	if(!admin_fax_id)
		fax_name = "[get_area_name(src)] Fax Machine"

// Переопределяем метод спавна корабля, выполняя весь ориг код и добавляя отправку сигнала о готовности в конце
/datum/controller/subsystem/overmap/spawn_ship_at_start(datum/map_template/shuttle/template)
	var/datum/overmap/ship/controlled/created_ship = ..()
	. = created_ship
	//Отправляем сигнал о том что корабль полностью готов
	SEND_SIGNAL(created_ship, COMSIG_SHIP_DONE_LOADING)
