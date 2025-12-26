extends CanvasLayer

func _ready() -> void:
	hide()


func _on_exit_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://elements/mainmenu.tscn")


func _on_play_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	hide()
	get_tree().paused = false
