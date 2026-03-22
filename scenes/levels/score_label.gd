extends Label

class_name ScoreLabel

enum LabelType {
	ENEMIES_ON_EARTH,
	ENEMIES_DESTROYED
}

@export var current_label_type: LabelType

func _ready() -> void:
	if (current_label_type == LabelType.ENEMIES_ON_EARTH):
		text = "Enemies On Earth: 0"
		GameManager1.connect("on_enemy_entered_earth", on_enemy_entered_earth)
	elif (current_label_type == LabelType.ENEMIES_DESTROYED):
		text = "Enemies Destroyed: 0"
		GameManager1.connect("on_enemy_destroyed", on_enemy_destroyed)	
	
func on_enemy_entered_earth(totalCount: int):
	text = "Enemies On Earth:" + str(totalCount)

func on_enemy_destroyed(totalCount: int):
	text = "Enemies Destroyed:" + str(totalCount)
