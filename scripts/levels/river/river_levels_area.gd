extends Area2D
@onready var level_select_menu := $LevelSelectMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if len(get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("ui_accept"):
			level_select_menu.show()
			get_tree().paused = true
			
			if LevelCore.river.level_2_completed:
				level_select_menu.button_level_3.grab_focus()
			elif LevelCore.river.level_1_completed:
				level_select_menu.button_level_2.grab_focus()
			else:
				level_select_menu.button_level_1.grab_focus()
		if Input.is_action_just_pressed("escape") && level_select_menu.visible:
			level_select_menu.hide()



func _on_level_select_menu_level_selected() -> void:
	LevelCore.player_position = get_parent().get_node("player").global_position
