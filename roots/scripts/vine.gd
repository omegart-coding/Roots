extends Line2D

var end


func setend(endnode):
	end = endnode

func _process(delta: float) -> void:
	var player = get_parent()
	if not points:
		add_point(Vector2(0,0))
		add_point((end.position - player.position))
	if !player.grabbing:
		queue_free()
	else:
		set_point_position(0, Vector2(0,0))
		set_point_position(1, (end.position - player.position))
