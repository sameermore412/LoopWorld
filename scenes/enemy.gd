extends Area2D

class_name Enemy

@onready
var sprite := $Sprites
@onready
var death_timer := $Timer
@onready
var particles := $CPUParticles2D

func _ready() -> void:
	var center = get_viewport_rect().size / 2
	var angle_to_center = global_position.direction_to(center).angle()
	rotation = rotation + angle_to_center
	particles.emitting = false
	connect("area_entered", _on_area_entered)
	death_timer.connect("timeout", _on_death_timeout)
	
	
func _physics_process(delta: float) -> void:
	var center = get_viewport_rect().size / 2
	position = position.move_toward(center, 0.5)
	
func _on_area_entered(area: Area2D):
	if area is Bullet:
		particles.emitting = true
		sprite.visible = false
		death_timer.start(1)
		area.queue_free()
	return
	
func _on_death_timeout():
	queue_free()
