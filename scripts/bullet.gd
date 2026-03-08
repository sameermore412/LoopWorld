class_name Bullet

extends Area2D

var target_position: Vector2

func _physics_process(delta: float) -> void:
	position = position.move_toward(target_position, 10)
	
	if position.distance_to(target_position) <= 0:
		queue_free()
	  
