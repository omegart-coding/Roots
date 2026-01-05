extends Node2D

var player
const basespeed = 200
const max_distance = Vector2(20, 10)

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	var des_pos = Vector2(player.position.x + (player.direction.x * 100), player.position.y)
	print(player.direction.x)
	var speed = (basespeed + (position.distance_to(player.position))) * delta
	position = position.move_toward(des_pos, speed)
