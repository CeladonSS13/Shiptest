// Администрация будет получать оповещения о новых факсах в Discord.
/obj/machinery/fax/proc/sendDSFax(sender_name, loaded)
	var/text
	if(istype(loaded, /obj/item/paper))
		var/obj/item/paper/text2 = loaded

		var/datum/component/writing/W = text2.GetComponent(/datum/component/writing)
		if (W && islist(W.raw_text_inputs) && length(W.raw_text_inputs))
			for(var/str in W.raw_text_inputs)
				text += "[str:raw_text]\n"
	var/info = {"📠 **\[FAX\]** Получен новый факс
- **Отправитель**: **`[sender_name]`** | **`[usr.key]`**: **`[usr.real_name]`**
- **Получатель**: **`[src.fax_name]`**
### [loaded]
"}
	info = replacetext(info, "the ", "")
	info = replacetext(info, "paper — ", "") + text

	if(length(info) > 1500)
		for(var/out in split_string_to_list(info, 1500))
			send2chat(out, "faxes-and-prays")
	else
		send2chat(info, "faxes-and-prays")

// Администрация будет получать оповещения о новых Prays в Discord.
/mob/proc/sendDSPray(msg_tmp)
	var/text = "🙏 **\[PRAY] `[src.key]` | `[src.real_name]`**: [msg_tmp]"
	send2chat(text, "faxes-and-prays")
