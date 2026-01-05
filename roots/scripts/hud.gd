extends CanvasLayer

var player:Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	$StaminaMeter.max_value = player.maxstamina
	$StaminaMeter.value = $StaminaMeter.max_value

func _process(delta: float) -> void:
	player.stamina -= 0.5
	$StaminaMeter.value = player.stamina
