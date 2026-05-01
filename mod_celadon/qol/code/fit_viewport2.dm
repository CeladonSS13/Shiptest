// Part from "code\datums\view.dm"

// Adds zoom variable
/datum/viewData
	/// This client's current zoom level, if it's not being supressed
	/// If it's 0, we autoscale to the size of the window. Otherwise it's treated as the ratio between
	/// the pixels on the map and output pixels. Only looks proper nice in increments of whole numbers (iirc)
	/// Stored here so other parts of the code have a non blocking way of getting a user's functional zoom
	var/zoom = 0

// Overrides proc to handle zoom = 0
/datum/viewData/assertFormat()//T-Pose
	winset(chief, "mapwindow.map", "zoom=0")
	zoom = 0

// Overrides proc to set zoom to pixel_size
/datum/viewData/resetFormat()//Cuck
	zoom = chief?.prefs.pixel_size
	winset(chief, "mapwindow.map", "zoom=[zoom]")


// Part from "code\modules\client\verbs\ooc.dm"

// Overrides verb to do what I want
/client/fit_viewport()
	set name = "Fit Viewport"
	set category = "Special Verbs"
	set desc = "Fit the width of the map window to match the viewport"

	// Fetch aspect ratio
	var/view_size = getviewsize(view)
	var/aspect_ratio = view_size[1] / view_size[2]

	// Calculate desired pixel width using window size and aspect ratio
	var/sizes = params2list(winget(src, "mainwindow.split;mapwindow", "size"))
	var/map_size = splittext(sizes["mapwindow.size"], "x")
	// Gets the type of zoom we're currently using from our view datum
	// If it's 0 we do our pixel calculations based off the size of the mapwindow
	// If it's not, we already know how big we want our window to be, since zoom is the exact pixel ratio of the map
	var/zoom_value = src.view_size?.zoom || 0

	var/desired_width = 0
	if(zoom_value)
		// Exact values of different scaling: 1x = 672, 1.5x = 1008, 2x = 1344, 3x = 2016
		desired_width = round(view_size[1] * zoom_value * world.icon_size)
	else
		// Looks like we expect mapwindow.size to be "ixj" where i and j are numbers.
		// If we don't get our expected 2 outputs, let's give some useful error info.
		if(length(map_size) != 2)
			CRASH("map_size of incorrect length --- map_size var: [map_size] --- map_size length: [length(map_size)]")
		var/height = text2num(map_size[2])
		desired_width = round(height * aspect_ratio)
	if (text2num(map_size[1]) == desired_width)
		// Nothing to do
		return

	var/split_size = splittext(sizes["mainwindow.split.size"], "x")
	var/split_width = text2num(split_size[1])

	// Calculate and apply a best estimate
	// +4 pixels are for the width of the splitter's handle
	var/pct = 100 * (desired_width + 4) / split_width
	winset(src, "mainwindow.split", "splitter=[pct]")

	// Apply an ever-lowering offset until we finish or fail
	// Can be happening while user changes his pixel scaling
	var/delta
	var/delta_last
	for(var/safety in 1 to 10)
		var/after_size = winget(src, "mapwindow", "size")
		map_size = splittext(after_size, "x")
		var/got_width = text2num(map_size[1])

		if (got_width == desired_width)
			// success
			return
		else if (isnull(delta))
			// calculate a probable delta value based on the difference
			delta = 100 * (desired_width - got_width) / split_width
		else if ((delta > 0 && got_width > desired_width) || (delta < 0 && got_width < desired_width))
			// if we overshot, halve the delta and reverse direction
			delta = -delta/2

		// It's probably trying to move splitter further, than game window allows
		if(!isnull(delta_last) && delta == delta_last)
			break
		pct += delta
		// We don't want to get more than 100%
		if(pct > 100)
			pct -= pct - 100
		winset(src, "mainwindow.split", "splitter=[pct]")
		delta_last = delta
