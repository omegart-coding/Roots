extends StaticBody2D

var active
var player

func _ready() -> void:
	active = true
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if active:
		for body in $DetectPlayer.get_overlapping_bodies():
			if body == player:
				active = false
				player.set_respawn(position)
	elif modulate.a == 255:
		modulate.a = 150
