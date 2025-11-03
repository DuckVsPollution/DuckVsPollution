extends Area2D

@onready var helpTextbox := get_parent().get_node("HelpTextbox")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if len(get_overlapping_areas()) > 0:
		helpTextbox.show()
		helpTextbox.set_text(0)
	else:
		helpTextbox.hide()
