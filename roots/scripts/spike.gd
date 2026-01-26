extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		body.respawn()
