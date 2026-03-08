class_name LevelManager

extends Node2D

@export
var central_planet: PlanetNode

func _ready() -> void:
	var view_port_center = get_viewport_rect().size / 2
	central_planet.position = view_port_center
	
