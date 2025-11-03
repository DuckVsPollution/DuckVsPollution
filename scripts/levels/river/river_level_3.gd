extends Node2D
var speed = 1;
@export var enemy_scene: PackedScene
@export var enemy_scene_2: PackedScene

@onready var tree = get_tree()
@onready var game_over = $GameOver
@onready var player = %PlayerRiver
@onready var start_count_label = $StartCount/Label
@onready var start_timer = %StartTimer
@onready var start_timer_label = $StartCount/Control/Label
@onready var start_count = %StartCount
@onready var game_completed = $GameCompleted

var count = 3;

func _ready() -> void:
	LevelCore.levels_pause_avaliable = false
	tree.paused = true
	
	start_timer_label.text = str(count)
	start_count.show()
	start_timer.start()


func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset = Vector2(0, 0)
	$ParallaxBackground/ParallaxLayer.motion_offset += Vector2(-0.7 * speed, 0)
	
	if player.health <= 0:
		game_over.show()
		%GamerOverSound.play()
		%GameOverPlayAgain.grab_focus()
		LevelCore.levels_pause_avaliable = false
		tree.paused = true

func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(640 + 32, randf_range(60, 320 - 50))
	
func _on_enemy_spawn_timer_2_timeout() -> void:
	var enemy = enemy_scene_2.instantiate()
	add_child(enemy)
	enemy.position = Vector2(640 + 32, randf_range(60, 320 - 50))

func _on_game_over_play_again_pressed() -> void:
	tree.change_scene_to_file("res://levels/river/river_level_3.tscn")
	tree.paused = false

func _on_game_over_exit_pressed() -> void:
	tree.change_scene_to_file("res://main/game.tscn")
	tree.paused = false

func _on_start_timer_timeout() -> void:
	start_timer_label.text = str(count)
	if count <= 0:
		LevelCore.levels_pause_avaliable = true
		start_timer.stop()
		tree.paused = false
		start_count.hide()
		await tree.create_timer(0.5).timeout
		return
	count -= 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	game_over.show()
	%GamerOverSound.play()
	%GameOverPlayAgain.grab_focus()
	LevelCore.levels_pause_avaliable = false
	tree.paused = true

func _on_boss_river_boss_died() -> void:
	SoundManager.level_complete_sound.play()
	game_completed.show()
	%GameCompletedContinue.grab_focus()
	LevelCore.levels_pause_avaliable = false
	tree.paused = true

func _on_speed_timer_timeout() -> void:
	if speed <= 3: speed += 0.1


func _on_levels_pause_menu_reload_pressed() -> void:
	tree.change_scene_to_file("res://levels/river/river_level_3.tscn")


func _on_timer_timeout() -> void:
	%EnemySpawnTimer2.start()


func _on_game_completed_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/ending_scene.tscn")
