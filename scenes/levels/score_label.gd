extends Label

class_name ScoreLabel

func _ready() -> void:
	GameManager1.connect("on_enemy_entered_earth", on_enemy_entered_earth)
	
func on_enemy_entered_earth(totalCount: int):
	text = "" + str(totalCount)
