// Death certificate form
/obj/item/paper/death_certificate
	name = "death certificate form"

/obj/item/paper/death_certificate/Initialize()
	. = ..()
	add_raw_text("<center><b>DEATH CERTIFICATE</b></center><br><b>Deceased Name:</b> \[_______]<br><b>Date of Death:</b> \[_______]<br><b>Time of Death:</b> \[_______]<br><b>Cause of Death:</b> \[_______]<br><b>Location of Death:</b> \[_______]<br><b>Coroner Name:</b> \[_______]<br><b>Coroner Signature:</b> \[_______]<br><br><b>Additional Notes:</b><br>\[_______]<br>\[_______]<br>\[_______]<br><br><b>Official Stamp:</b> \[ ]<br>")

// Body examination form
/obj/item/paper/body_examination
	name = "body examination form"

/obj/item/paper/body_examination/Initialize()
	. = ..()
	add_raw_text("<center><b>BODY EXAMINATION REPORT</b></center><br><b>Subject Name:</b> \[_______]<br><b>Examination Date:</b> \[_______]<br><b>Examining Coroner:</b> \[_______]<br><br><b>Physical Condition:</b><br>\[ ] Intact  \[ ] Damaged  \[ ] Severely Damaged<br><br><b>Visible Injuries:</b><br>\[_______]<br>\[_______]<br><br><b>Estimated Cause of Death:</b><br>\[_______]<br><br><b>Recommendations:</b><br>\[ ] Release for burial<br>\[ ] Hold for investigation<br>\[ ] Transfer to medical<br><br><b>Coroner Signature:</b> \[_______]<br><b>Official Stamp:</b> \[ ]<br>")

// Body release form
/obj/item/paper/body_release
	name = "body release authorization"

/obj/item/paper/body_release/Initialize()
	. = ..()
	add_raw_text("<center><b>BODY RELEASE AUTHORIZATION</b></center><br><b>Deceased Name:</b> \[_______]<br><b>Release Date:</b> \[_______]<br><b>Released To:</b> \[_______]<br><b>Relationship:</b> \[_______]<br><br><b>Coroner Authorization:</b><br>I hereby authorize the release of the above-named deceased<br>to the specified individual/organization.<br><br><b>Coroner Name:</b> \[_______]<br><b>Coroner Signature:</b> \[_______]<br><b>Official Stamp:</b> \[ ]<br><br><b>Recipient Signature:</b> \[_______]<br><b>Date:</b> \[_______]<br>")

// Form dispenser
/obj/structure/coroner_forms_dispenser
	name = "forms dispenser"
	desc = "A dispenser containing various coroner forms and documents."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pdapainter"
	anchored = TRUE
	density = FALSE

/obj/structure/coroner_forms_dispenser/attack_hand(mob/user)
	var/choice = input(user, "Select form type:", "Forms Dispenser") as null|anything in list("Death Certificate", "Body Examination", "Body Release", "Blank Paper")

	switch(choice)
		if("Death Certificate")
			new /obj/item/paper/death_certificate(get_turf(src))
		if("Body Examination")
			new /obj/item/paper/body_examination(get_turf(src))
		if("Body Release")
			new /obj/item/paper/body_release(get_turf(src))
		if("Blank Paper")
			new /obj/item/paper(get_turf(src))

	if(choice)
		to_chat(user, "<span class='notice'>You dispense a [choice] form.</span>")
