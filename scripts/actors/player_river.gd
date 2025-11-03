extends CharacterBody2D
@onready var label_coins = %coins
@onready var label_cans = $Stats/Control/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/cans
@onready var label_waterbottles = $Stats/Control/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/water
@onready var healthBar = %HealthBar
@onready var animation = %AnimatedSprite2D

var speed := 75
var coins := 0
var cans := 0
var waterbottles := 0
var health := 5

func _ready() -> void:
	if LevelCore.life_bonus > 0:
		health += LevelCore.life_bonus
		healthBar.max_value = health
		healthBar.value = health

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

func _on_area_2d_body_entered(body: Node2D) -> void:
	if health > 0:
		%quack.play()
		health -= 1
	healthBar.value = health
	animation.play('damage')
	await get_tree().create_timer(0.5).timeout
	animation.play('run')
