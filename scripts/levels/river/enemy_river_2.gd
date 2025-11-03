extends RigidBody2D

var speed: float = 2.5

func _physics_process(delta):
	apply_central_impulse(Vector2(-mass * speed, 0))
	
	if position.x < -32:
		queue_free()

func _on_bullet_area_area_entered(area: Area2D) -> void:
	queue_free()
