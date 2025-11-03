extends RigidBody2D

func _on_player_area_body_entered(body: Node2D) -> void:
	LevelCore.waterbottles += 1
	SoundManager.coleta.play()
	queue_free()
