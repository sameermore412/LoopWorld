extends Node

signal on_enemy_entered_earth(total_cound: int)

var total_enemy_on_planet = 0

func increment_total_enemy_on_planet():
	total_enemy_on_planet += 1
	on_enemy_entered_earth.emit(total_enemy_on_planet)
