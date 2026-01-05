extends Control

func _ready() -> void:
	$Container/MainButtons/Play.grab_focus()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://elements/main.tscn")


func _on_settings_pressed() -> void:
	$Container/SettingsButtons.show()
	$Container/SettingsButtons/Back.grab_focus()
	$Container/MainButtons.hide()



func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Container/SettingsButtons.hide()
	$Container/MainButtons.show()
	$Container/MainButtons/Play.grab_focus()


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
