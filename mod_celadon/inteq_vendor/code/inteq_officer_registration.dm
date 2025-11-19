// Регистрация офицеров Inteq для доступа к вендору

/datum/outfit/job/cel/inteq/post_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	if(!visualsOnly && (jobtype == /datum/job/captain || jobtype == /datum/job/warden || jobtype == /datum/job/cmo || jobtype == /datum/job/chief_engineer))
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(register_inteq_officer), H, 0), 1 SECONDS)

/proc/register_inteq_officer(mob/living/carbon/human/H, attempt = 0)
	if(!H || !H.client)
		return
	if(!H.real_name || !H.dna || !H.dna.unique_enzymes)
		if(attempt >= 10)
			log_admin("INTEQ VENDOR: Failed to register [key_name(H)] after 10 attempts.")
			return
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(register_inteq_officer), H, attempt + 1), 2 SECONDS)
		return
	if(!(H.real_name in GLOB.inteq_authorized_officers))
		GLOB.inteq_authorized_officers += H.real_name
		GLOB.inteq_authorized_dna += H.dna.unique_enzymes
		to_chat(H, span_notice("You have been authorized to submit documents at Inteq equipment vendors."))
		log_admin("INTEQ VENDOR: [key_name(H)] registered with DNA: [H.dna.unique_enzymes].")
		if(!GLOB.inteq_document_password)
			GLOB.inteq_document_password = generate_inteq_password()
			log_admin("INTEQ VENDOR: Password '[GLOB.inteq_document_password]' generated for this round.")
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(send_password_to_officer), H), 30 SECONDS)

/proc/generate_inteq_password()
	var/password = ""
	for(var/i in 1 to 6)
		password += pick("A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7","8","9")
	return password

/proc/send_password_to_officer(mob/living/carbon/human/H)
	if(!H || !H.client)
		return
	to_chat(H, "<span style='color: red; font-size: 20px;'><b>DOCUMENT SUBMISSION PASSWORD: [GLOB.inteq_document_password]</b></span>")
	log_admin("INTEQ VENDOR: Password '[GLOB.inteq_document_password]' sent to [key_name(H)].")
