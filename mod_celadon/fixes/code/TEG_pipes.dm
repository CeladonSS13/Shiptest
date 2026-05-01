/obj/machinery/atmospherics/components/binary/circulator/setPipingLayer(new_layer)
	var/obj/item/circuitboard/machine/circulator/board = circuit
	if(board)
		new_layer = board.pipe_layer
	..()
