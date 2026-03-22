extends Node

signal on_enemy_entered_earth(total_count: int)
signal on_enemy_destroyed(total_count: int)

var total_enemy_on_planet = 0
var enemy_destroyed_counter = 0

func increment_total_enemy_on_planet():
	total_enemy_on_planet += 1
	on_enemy_entered_earth.emit(total_enemy_on_planet)
	
func increment_enemy_destroyed():
	enemy_destroyed_counter += 1
	on_enemy_destroyed.emit(enemy_destroyed_counter)
