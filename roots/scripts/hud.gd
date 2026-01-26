extends CanvasLayer

var player:Node2D

func _ready() -> void:
	player = get_node('../player')
	$StaminaMeter.max_value = player.maxstamina
	$StaminaMeter.value = $StaminaMeter.max_value

func _process(delta: float) -> void:
	player.stamina -= 0.5
	$StaminaMeter.value = player.stamina
