extends Node2D

var player: Node2D
const max_distance = Vector2(250, 10)

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _process(delta: float) -> void:
	var des_pos = Vector2((player.position.x + (player.direction.x * 200)), player.position.y + 10)
	var speed = (player.speed * 0.01) + 1
	
	if abs(position.x - player.position.x) > max_distance.x and abs(position.y - player.position.y) > max_distance.y:
		position.x = max_distance.x * player.direction.x
		position.y = player.position.y + max_distance.y
	elif abs(position.x - player.position.x) > max_distance.x:
		position.x = max_distance.x * player.direction.x
		position.y = position.move_toward(des_pos, speed).y
	elif abs(position.y - player.position.y) > max_distance.y:
		position.x = position.move_toward(des_pos, speed).x
		position.y = player.position.y + max_distance.y
	else:
		position = position.move_toward(des_pos, speed)
