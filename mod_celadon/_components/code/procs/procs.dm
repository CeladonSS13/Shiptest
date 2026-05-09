// Используется для разделения длинных строк на части, например чтобы не превышать лимит символов (ds_information).
/proc/split_string_to_list(var/string_to_split, var/chunk_limit = 1500)
	if(!string_to_split)
		return list()

	var/list/output = list()
	var/string_len = length(string_to_split)

	for(var/i = 1, i <= string_len, i += chunk_limit)
		output += copytext(string_to_split, i, i + chunk_limit)

	return output
