extends CharacterBody2D

@onready var animation := $AnimationPlayer 

func updateAnimation(): 
	animation.play('idle')
	
func _physics_process(delta: float) -> void:
	updateAnimation()
