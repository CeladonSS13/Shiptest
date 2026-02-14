/// Produces a mutable appearance glued to the [EMISSIVE_PLANE] dyed to be the [EMISSIVE_COLOR].
/proc/emissive_appearance(icon, icon_state = "", atom/offset_spokesman, layer, alpha = 255, appearance_flags = NONE, offset_const, effect_type = EMISSIVE_BLOOM)
	if((isnull(layer) || layer == FLOAT_LAYER) && IS_TOPDOWN_PLANE(offset_spokesman.plane))
		layer = TOPDOWN_TO_EMISSIVE_LAYER(offset_spokesman.layer)
	else if(isnull(layer))
		layer = FLOAT_LAYER

	var/mutable_appearance/appearance = mutable_appearance(icon, icon_state, layer, offset_spokesman, EMISSIVE_PLANE, 255, appearance_flags | EMISSIVE_APPEARANCE_FLAGS, offset_const)
	if(alpha == 255)
		switch(effect_type)
			if(EMISSIVE_NO_BLOOM)
				appearance.color = GLOB.emissive_color_no_bloom
			if (EMISSIVE_BLOOM)
				appearance.color = GLOB.emissive_color
			if (EMISSIVE_SPECULAR)
				appearance.color = GLOB.specular_color
	else
		var/alpha_ratio = alpha/255
		switch(effect_type)
			if(EMISSIVE_NO_BLOOM)
				appearance.color = _EMISSIVE_COLOR_NO_BLOOM(alpha_ratio)
			if (EMISSIVE_BLOOM)
				appearance.color = _EMISSIVE_COLOR(alpha_ratio)
			if (EMISSIVE_SPECULAR)
				appearance.color = _SPECULAR_COLOR(alpha_ratio)

	return appearance

/// Produces a mutable appearance glued to the [EMISSIVE_PLANE] dyed to be the [EM_BLOCK_COLOR].
/proc/emissive_blocker(icon, icon_state = "", atom/offset_spokesman, layer, alpha = 255, appearance_flags = NONE, offset_const)
	if (isnull(layer))
		if(IS_TOPDOWN_PLANE(offset_spokesman.plane))
			layer = TOPDOWN_TO_EMISSIVE_LAYER(offset_spokesman.layer)
		else
			layer = FLOAT_LAYER
	var/mutable_appearance/appearance = mutable_appearance(icon, icon_state, layer, offset_spokesman, EMISSIVE_PLANE, alpha, appearance_flags | EMISSIVE_APPEARANCE_FLAGS, offset_const)
	if(alpha == 255)
		appearance.color = GLOB.em_block_color
	else
		var/alpha_ratio = alpha/255
		appearance.color = _EM_BLOCK_COLOR(alpha_ratio)
	return appearance
