extends Node

class_name Utils

static func get_point_on_circle(angle: float, radius: float, center: Vector2) -> Vector2:
	var radians := deg_to_rad(angle)
	var x := radius * cos(radians)
	var y := radius * sin(radians)
	return Vector2(x + center.x, y + center.y)
	
