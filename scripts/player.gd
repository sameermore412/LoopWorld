class_name Player

extends Area2D

@export
var show_targets := false

@onready
var timer := $Timer
@onready
var sprite := $Sprite2D
@onready
var bullet_scene := preload("res://scenes/bullet.tscn")
@onready
var debug_target_scene := preload("res://scenes/debug_target.tscn")
@onready
var gun_end := %GunEnd
var bullets_to_fire := 0

func _ready() -> void:
	timer.start()
	timer.one_shot = false
	#timer.connect("timeout", shoot)

func _input(event: InputEvent) -> void:	
	if event.is_action_pressed("Fire"):	
		print("Fire pressed")
		shoot()
	 
func shoot():
	var word := WordManager.pop_word_from_bank()
	bullets_to_fire = len(word) * 1
	if bullets_to_fire == 0:
		return      
	var angle_increment := 45 / bullets_to_fire
	
	print("Firing bullets")
	for index in bullets_to_fire:
		var rotation = global_rotation_degrees + (index * angle_increment) - (bullets_to_fire - 1 - index) * angle_increment
		var target_point = target_position(rotation)
		var instance: Bullet = bullet_scene.instantiate()
		instance.target_position = target_point
		instance.global_position = gun_end.global_position   
		get_parent().add_child(instance)
	
	
func target_position(angle) -> Vector2:
	var point = Utils.get_point_on_circle(angle, 1000, global_position)

	if show_targets:
		var target: DebugTarget = debug_target_scene.instantiate()	
		target.position = point
		get_parent().add_child(target)
		target.colorRect.color = Color.BLUE
	return point

	
	
