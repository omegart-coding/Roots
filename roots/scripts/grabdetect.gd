extends Area2D



func checkgrab():
	var grabable = []
	for area in get_overlapping_bodies():
		if area.is_in_group("grabable"):
			grabable.append(area)
	
	var closest = find_closest(grabable)
	return closest
	
func find_closest(list):
	var closest:Node2D = null
	var closest_distance: float
	var player_pos = get_parent().position
	
	for area in list:
		if closest != null:
			if player_pos.distance_to(area.position) < closest_distance:
				closest = area
				closest_distance = player_pos.distance_to(area.position)
		else:
			closest = area
			closest_distance = player_pos.distance_to(area.position)
	return closest
	
