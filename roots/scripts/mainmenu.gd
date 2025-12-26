extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://elements/main.tscn")


func _on_settings_pressed() -> void:
	$Container/SettingsButtons.show()
	$Container/MainButtons.hide()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Container/SettingsButtons.hide()
	$Container/MainButtons.show()


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
