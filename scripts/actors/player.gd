extends CharacterBody2D


const SPEED = 75
@onready var animation := $AnimationPlayer 
@onready var coins_label := %coins
@onready var cans_label := %cans
@onready var water_label : = %water

var lastDirection = 'left'

func _ready() -> void:
	LevelCore.river.level_1_first_play = true
	if LevelCore.player_position:
		$".".global_position = LevelCore.player_position

func updateAnimation(): 
	var direction
	
	match lastDirection:
		'left':
			direction = "idleLeft"
		'right':
			direction = "idleRight"
		'up':
			direction = "idleUp"
		'down':
			direction = "idleDown"
		
	if velocity.x < 0: 
		direction = "left"
		lastDirection = direction
	elif velocity.x > 0: 
		direction = "right"
		lastDirection = direction
	elif velocity.y < 0: 
		direction = "up"
		lastDirection = direction
	elif velocity.y > 0: 
		direction = "down"
		lastDirection = direction
	
	animation.play(direction)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		%Quack.play()

func _physics_process(delta: float) -> void:
	
	coins_label.text = str(LevelCore.coins)
	cans_label.text = str(LevelCore.cans)
	water_label.text = str(LevelCore.waterbottles)
	
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED

	updateAnimation()
	move_and_slide()
