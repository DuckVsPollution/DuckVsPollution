extends CanvasLayer

signal close_help_text

@onready var textbox := $"."
@onready var text := $Control/VBoxContainer/MarginContainer/MarginContainer/RichTextLabel
@onready var button := $Control/VBoxContainer/Button
@export_file("*.json") var d_file: String

var dialogue = []
var current_dialogue_id = 0
var dialogue_active = false

func load_dialogue():
	var file = FileAccess.open(d_file, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

func start():
	if dialogue_active:
		return
	dialogue_active = true
	textbox.show()
	%Button.grab_focus()
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogue):
		textbox.hide()
		dialogue_active = false
		emit_signal('close_help_text')
		return
		
	text.text = dialogue[current_dialogue_id]['text']
	button.text = dialogue[current_dialogue_id]['button']
	
#func _input(event: InputEvent) -> void:
	#if not dialogue_active:
		#return
	#if event.is_action_pressed("ui_accept"):
		#next_script()

func _on_button_pressed() -> void:
	if not dialogue_active:
		return
	next_script()
