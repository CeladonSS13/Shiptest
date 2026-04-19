// Администрация будет получать оповещения о новых факсах в Discord.
/obj/machinery/fax/proc/sendDSFax(sender_name, loaded)
	var/text
	if(istype(loaded, /obj/item/paper))
		var/obj/item/paper/text2 = loaded

		var/datum/component/writing/W = text2.GetComponent(/datum/component/writing)
		if (W && islist(W.raw_text_inputs) && length(W.raw_text_inputs))
			text = W.raw_text_inputs[1]
			text = text:raw_text
	var/info = {"📠 **\[FAX\] Получен новый факс
- **Отправитель**: **`[usr.key]`** | **`[sender_name]`**
- **Получатель**: **`[src]`**
### [loaded].
"}
	info = replacetext(info, "the ", "")
	info = replacetext(info, "paper — ", "") + text
	send2chat(info, "faxes-and-prays")

// Администрация будет получать оповещения о новых Prays в Discord.
/mob/proc/sendDSPray(msg_tmp, C)
	var/text = "🙏 **\[PRAY] `[C]` | `[src.real_name]`**: [msg_tmp]"
	send2chat(text, "faxes-and-prays")
