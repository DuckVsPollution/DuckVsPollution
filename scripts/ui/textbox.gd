extends CanvasLayer

@export_file("*.json") var d_file: String
@onready var textbox := $"."
@onready var dchat := $MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Chat;
@onready var dname := $MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Name;
@onready var timer := $Timer

var dialogue = []
var current_dialogue_id = 0
var dialogue_active = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textbox.hide()

func load_dialogue():
	var file = FileAccess.open(d_file, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

func start():
	if dialogue_active:
		return
	dialogue_active = true
	textbox.show()
	
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()
	
func _input(event: InputEvent) -> void:
	if not dialogue_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogue):
		timer.start()
		textbox.hide()
		return
		
	dname.text = dialogue[current_dialogue_id]['name']
	dchat.text = dialogue[current_dialogue_id]['text']

func _on_timer_timeout() -> void:
	dialogue_active = false
