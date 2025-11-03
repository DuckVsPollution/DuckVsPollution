extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/VBoxContainer/start.grab_focus()
	if not FileAccess.file_exists("user://savefile.dat"):
		$VBoxContainer/VBoxContainer/start.text = "Novo jogo"
	else:
		$VBoxContainer/VBoxContainer/start.text = "Continuar"
		
func _on_start_pressed() -> void:
	LevelCore.load_data()
	if not FileAccess.file_exists("user://savefile.dat"):
		get_tree().change_scene_to_file("res://levels/intro.tscn")
	else:
		get_tree().change_scene_to_file("res://main/game.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
