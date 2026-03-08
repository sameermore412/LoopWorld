class_name PlanetNode

extends Area2D

@export
var orbit_radius := 300
@export
var player_node: Player
@export
var player_speed = 50

@onready
var current_angle:= 0.0
@onready
var debug_target := %DebugTarget

var direction := 1

func _ready() -> void:
	connect("area_entered", on_area_entered)

func _process(delta: float) -> void:
	if Input.is_action_pressed("forward"):
		orbit_radius = min(500, orbit_radius + 1)
	elif Input.is_action_pressed("back"):
		orbit_radius = max(200, orbit_radius - 1)
		
	current_angle = current_angle + (player_speed * direction * delta)
	if (current_angle > 360):
		current_angle = 0
	
	player_node.global_position = calculate_postion()
	debug_target.global_position = calculate_postion(orbit_radius + 100)
	player_node.look_at(debug_target.global_position) 
	
	
func calculate_postion(radius := orbit_radius) -> Vector2:
	var radians := deg_to_rad(current_angle)
	var x := radius * cos(radians)
	var y := radius * sin(radians)
	return Vector2(x + position.x, y + position.y)
	
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("Clockwise")):
		direction = 1
	if (event.is_action_pressed("CounterClockWise")):
		direction = -1
		
func on_area_entered(area2d: Area2D):
	if area2d is Enemy:
		GameManager1.increment_total_enemy_on_planet()
		area2d.queue_free()
