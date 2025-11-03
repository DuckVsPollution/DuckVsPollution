extends Area2D

@onready var dialogue := get_parent().get_node("Textbox")

func _input(event):
	if event.is_action_pressed("ui_accept") && len(get_overlapping_bodies()) > 0: 
		dialogue.start()
