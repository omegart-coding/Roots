extends Node2D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("PAUSE"):
		if !$PauseMenu.visible:
			$PauseMenu.show()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			get_tree().paused = true
		else:
			$PauseMenu.hide()
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			get_tree().paused = false
