// Замена всех принтеров плат и протолатов на идентичные им техфабы, включающие в себя обе машины. Так же добавлены сервера сразу в коробки
/obj/item/storage/box/rndmining
	name = "\proper QWIK-RND: M.I.D.A.S. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print resource-extraction and finance related designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndmining/PopulateContents()
	new /obj/item/circuitboard/machine/techfab/department/cargo(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndengi
	name = "\proper QWIK-RND: A.T.L.A.S. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print maintenance, construction, and repair related designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndengi/PopulateContents()
	new /obj/item/circuitboard/machine/techfab/department/engineering(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndmed
	name = "\proper QWIK-RND: C.A.R.E. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print medical and pharmaceutical care related designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndmed/PopulateContents()
	new /obj/item/circuitboard/machine/techfab/department/medical(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndsec
	name = "\proper QWIK-RND: P.E.A.C.E. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print military designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndsec/PopulateContents()
	new /obj/item/circuitboard/machine/techfab/department/security(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndciv
	name = "\proper QWIK-RND: H.O.M.E. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print a variety of service industry designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndciv/PopulateContents()
	new /obj/item/circuitboard/machine/techfab/department/service(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndbasic
	name = "\proper QWIK-RND: B.A.S.I.C. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print a variety of low-tier miscellaneous designs."
	illustration = "scicircuit"

/obj/item/storage/box/rndbasic/PopulateContents()
	new /obj/item/circuitboard/machine/protolathe/department/basic(src)
	new /obj/item/circuitboard/machine/circuit_imprinter/department/basic(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)

/obj/item/storage/box/rndsci
	name = "\proper QWIK-RND: K.N.O.W. Module"
	desc = "A set of boards for constructing prototype design lathes. These ones are braked to only print designs related to high-level scientific disciplines."
	illustration = "scicircuit"

/obj/item/storage/box/rndsci/PopulateContents()
	new /obj/item/circuitboard/machine/destructive_analyzer(src)
	new /obj/item/circuitboard/machine/techfab/department/science(src)
	new /obj/item/circuitboard/computer/rdconsole(src)
	new /obj/item/circuitboard/machine/rdserver(src)


