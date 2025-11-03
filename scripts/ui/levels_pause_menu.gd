extends CanvasLayer
@onready var pause_menu = $"."
@onready var tree = get_tree()
@onready var resume = %resume

signal reload_pressed()

func _process(delta: float) -> void:
	test_esc()
	
func _on_resume_pressed() -> void:
	pause_menu.hide()
	get_tree().paused = false

func _on_exit_pressed() -> void:
	pause_menu.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main/game.tscn")

func _on_reload_pressed() -> void:
	pause_menu.hide()
	get_tree().paused = false
	emit_signal('reload_pressed')

func test_esc():
	if Input.is_action_just_pressed("escape") and tree.paused == false and LevelCore.levels_pause_avaliable:
		pause_menu.show()
		resume.grab_focus()
		%Settings.hide()
		%Control.show()
		tree.paused = true
	elif Input.is_action_just_pressed("escape") and tree.paused == true and LevelCore.levels_pause_avaliable:
		pause_menu.hide()
		tree.paused = false


func _on_settings_pressed() -> void:
	%Settings.show()
	%VolumeSlider.grab_focus()
	%Control.hide()


func _on_exit_settings_pressed() -> void:
	%Settings.hide()
	resume.grab_focus()
	%Control.show()
