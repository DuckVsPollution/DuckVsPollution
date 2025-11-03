extends Node2D

@export_file("*.json") var d_file: String

@onready var textbox := $"CanvasLayer/MarginContainer"
@onready var text := $"CanvasLayer/MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Text";

var dialogue = []
var current_dialogue_id = -1

func load_dialogue():
	var file = FileAccess.open(d_file, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue = load_dialogue();
	next_script()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogue):
		get_tree().change_scene_to_file("res://main/game.tscn");
		return
	
	text.text = dialogue[current_dialogue_id]['text']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continuar_pressed() -> void:
	next_script()
