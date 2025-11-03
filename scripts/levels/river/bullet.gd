extends Area2D

var shooter: Node # who is the shooter of this bullet, so we increase its score

var direction: Vector2 # in which direction should bullet move
var speed: float = 512 * LevelCore.bullet_speed_bonus

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body is RigidBody2D and body != shooter:
		body.queue_free()
		
		# if "kills" in shooter: # If variable kills exists in shooter's script
		#	shooter.kills += 1
	self.queue_free()
