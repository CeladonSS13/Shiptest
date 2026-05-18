/obj/item/hand_labeler/attack_self(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, span_warning("You don't have the dexterity to use [src]!"))
		return
	mode = !mode
	icon_state = "labeler[mode]"
	if(mode)
		to_chat(user, span_notice("You turn on [src]."))
		//Now let them chose the text.
		var/str = reject_bad_text_rus(stripped_input(user, "Label text?", "Set label","", MAX_NAME_LEN))
		if(!str || !length(str))
			to_chat(user, span_warning("Invalid text!"))
			return
		label = str
		to_chat(user, span_notice("You set the text to '[str]'."))
	else
		to_chat(user, span_notice("You turn off [src]."))

/obj/item/hand_labeler/afterattack(atom/A, mob/user,proximity)
	if(!proximity)
		return
	if(!mode)	//if it's off, give up.
		return

	if(!labels_left)
		to_chat(user, span_warning("No labels left!"))
		return
	if(!label || !length(label))
		to_chat(user, span_warning("No text set!"))
		return
	// Длину проверяем этим методом, поскольку length считает длину в байтах для не латиницы
	if(length_char(A.name) + length_char(label) > 64)
		to_chat(user, span_warning("Label too big!"))
		return
	if(ismob(A))
		to_chat(user, span_warning("You can't label creatures!")) // use a collar
		return

	user.visible_message(
		span_notice("[user] labels [A] with \"[label]\"."), \
		span_notice("You label [A] with \"[label]\"."))
	A.AddComponent(/datum/component/label, label)
	playsound(A, 'sound/items/handling/component_pickup.ogg', 20, TRUE)
	labels_left--


/*
	TODO: Возможно стоит потом засунуть это в целом в proc/reject_bad_text ?
*/
// Кидает null, если текст не подходит
/datum/proc/reject_bad_text_rus(text, max_length = 512, ascii_only = TRUE)
	if(ascii_only)
		if(length(text) > max_length)
			return null
		/*
			https://jrgraphix.net/r/Unicode/0020-007F - латиница
			https://jrgraphix.net/r/Unicode/0400-04FF - кириллица u0401 - Ё u0451 - ё
		*/
		var/static/regex/non_ascii = regex(@"[^\x20-\x7E\t\n\u0410-\u044F\u0401\u0451]")
		// Ищет всё, кроме кириллицы и латиницы
		if(non_ascii.Find(text))
			return null
	else if(length_char(text) > max_length)
		return null
	var/static/regex/non_whitespace = regex(@"\S")
	// Ищет только пробел
	if(!non_whitespace.Find(text))
		return null
	/*
		https://theasciicode.com.ar/
	*/
	var/static/regex/bad_chars = regex(@"[\x00-\x08\x11-\x1F\<\>\/\\]")
	// Ищет специальные символы ASCII и \ < > /
	if(bad_chars.Find(text))
		return null
	return text	// Принимаем текст
