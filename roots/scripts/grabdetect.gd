extends Area2D



func checkgrab():
	var grabable = []
	for area in get_overlapping_bodies():
		if area.is_in_group("grabable"):
			var dir_to_player
			if get_parent().position.direction_to(area.position).x > 0:
				dir_to_player = 1
			elif get_parent().position.direction_to(area.position).x < 0:
				dir_to_player = -1
			else:
				dir_to_player = 0
			if dir_to_player == get_parent().direction.x:
				grabable.append(area)
	
	var closest = find_closest(grabable)
	if closest != null:
		closest.active = true
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
	
