class_name EnemySpawner
extends Node2D

@export
var planet: PlanetNode

@onready
var spawnarea: Polygon2D = $Polygon2D
@onready
var timer: Timer = $Timer
@onready
var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")

func _ready() -> void:
	timer.autostart = true
	timer.one_shot = false
	timer.start()
	timer.timeout.connect(on_timeout)	

func on_timeout():
	var array: PackedVector2Array = spawnarea.polygon
	var random_index = randi() % array.size()
	var point = array[random_index]
	
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.global_position = point
	get_parent().add_child(enemy)
	return
	
