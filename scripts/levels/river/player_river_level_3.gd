extends "res://scripts/actors/player_river.gd"

@export var bullet_scene: PackedScene

var is_cooldown := false

func _physics_process(delta: float) -> void:
	
	label_coins.text = str(coins)
	label_cans.text = str(cans)
	label_waterbottles.text = str(waterbottles)
	
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	
	if Input.is_action_pressed("ui_left"):
		velocity = direction * speed * 2 
	else:
		velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_pressed("ui_accept") && !is_cooldown:
		var bullet = bullet_scene.instantiate()
		bullet.shooter = self 
		bullet.position = self.position + Vector2(13, -7) 
		bullet.direction = Vector2(1, 0) 
		get_parent().add_child(bullet)
		is_cooldown = true
		animation.play("shooting")
		animation_play_run()
		%tiro.play()
		await get_tree().create_timer(0.5 - (0.5 * (LevelCore.bullet_fire_rate_bonus - 1))).timeout
		is_cooldown = false

func animation_play_run():
	await get_tree().create_timer(0.2).timeout
	animation.play("run")
