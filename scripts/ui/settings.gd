extends Control

func _ready() -> void:
	%VolumeSlider.grab_focus()

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
