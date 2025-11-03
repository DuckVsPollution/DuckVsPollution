extends CanvasLayer

@export_file("*.json") var d_file: String
@onready var textbox := $"."
@onready var dchat := $MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Chat;
@onready var dname := $MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Name;

var dialogue = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue = load_dialogue()

func load_dialogue():
	var file = FileAccess.open(d_file, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

func set_text(index: int):
	dname.text = dialogue[index]['name']
	dchat.text = dialogue[index]['text']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
