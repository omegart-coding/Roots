extends Node2D

var player: Node2D
const max_distance = Vector2(250, 50)

func _ready() -> void:
	player = get_node('../player')


func _process(delta: float) -> void:
	var des_pos = Vector2((player.position.x + (player.direction.x * 200)), player.position.y + 10)
	var speed = (player.speed * 0.01) + (10-(player.speed*0.001))

	if abs(player.position.x - position.x) > max_distance.x:
		position.x = player.position.x + (max_distance.x * player.direction.x)
	else:
		position.x = position.move_toward(des_pos, speed).x
		
	position.y = player.position.y - max_distance.y
