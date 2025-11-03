extends CanvasLayer
@onready var button_level_1: Button = %level1
@onready var button_level_2: Button = %level2
@onready var button_level_3: Button = %level3

signal level_selected()

func _ready() -> void:
	button_level_1.grab_focus()
	
	if LevelCore.river.level_1_completed:
		button_level_1.text = "completo"
		button_level_1.disabled = true
	else:
		button_level_1.text = "jogar"
		button_level_1.disabled = false
		
	if LevelCore.river.level_2_completed:
		button_level_2.text = "completo"
		button_level_2.disabled = true
	elif !LevelCore.river.level_1_completed: 
		button_level_2.text = "bloqueado"
		button_level_2.disabled = true
	else:
		button_level_2.text = "level 2"
		button_level_2.disabled = false
		
	if LevelCore.river.level_3_completed:
		button_level_3.text = "completo"
		button_level_3.disabled = true
	elif !LevelCore.river.level_2_completed: 
		button_level_3.text = "bloqueado"
		button_level_3.disabled = true
	else: 
		button_level_3.text = "level 3"
		button_level_3.disabled = false
	
func _process(delta: float) -> void:
	pass

func _on_level_1_pressed() -> void:
	if !LevelCore.river.level_1_completed:
		emit_signal("level_selected")
		get_tree().change_scene_to_file("res://levels/river/river_level_1.tscn")

func _on_level_2_pressed() -> void:
	if LevelCore.river.level_1_completed:
		emit_signal("level_selected")
		get_tree().change_scene_to_file("res://levels/river/river_level_2.tscn")

func _on_level_3_pressed() -> void:
	if LevelCore.river.level_2_completed:
		emit_signal("level_selected")
		get_tree().change_scene_to_file("res://levels/river/river_level_3.tscn")
