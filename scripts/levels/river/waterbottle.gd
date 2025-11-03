extends RigidBody2D

@onready var this := $"."

var speed: int = 1

func _physics_process(delta: float) -> void:
	this.position.x -= 1 * speed
	
	if position.x < -32:
		queue_free()

func _on_player_area_body_entered(body: Node2D) -> void:
	body.waterbottles += 1
	SoundManager.coleta.play()
	queue_free()

func _on_body_entered(body: Node) -> void:
	queue_free()

func set_speed(value: int):
	speed = value

func _on_timer_timeout() -> void:
	if speed <= 4: speed += 0.3
