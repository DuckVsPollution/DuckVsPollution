extends CanvasLayer
@onready var pauseMenu := $"."
@onready var tree: SceneTree = get_tree()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()

func pause():
	pauseMenu.show()
	%resume.grab_focus()
	if %Settings.visible:
		%Settings.hide()
		$Control.show()
	tree.paused = true


func resume():
	pauseMenu.hide()
	tree.paused = false
	
func testEsc():
	if Input.is_action_just_pressed("escape") and tree.paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and tree.paused == true:
		resume()

func _on_exit_pressed() -> void:
	LevelCore.save_data()
	tree.quit()

func _on_resume_pressed() -> void:
	resume()

func _on_quit_pressed() -> void:
	tree.quit()

func _on_settings_pressed() -> void:
	%VolumeSlider.grab_focus()
	%Settings.show()
	$Control.hide()
func _on_exit_settings_pressed() -> void:
	%resume.grab_focus()
	%Settings.hide()
	$Control.show()
