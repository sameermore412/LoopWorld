extends GridContainer

class_name LetterGrid

func _ready() -> void:
	WordManager.connect("letter_used", on_letter_used)
	WordManager.connect("letter_bank_rotated", on_letter_bank_rotated)
	var children = get_children()
	for index in len(WordManager.letter_bank):
		(children[index] as Label).text = WordManager.letter_bank[index]
			
func on_letter_used(letter: String):
	var children = get_children()
	for index in len(WordManager.letter_bank):
		(children[index] as Label).text = WordManager.letter_bank[index]
			
func on_letter_bank_rotated():
	var children = get_children()
	for index in len(WordManager.letter_bank):
		(children[index] as Label).text = WordManager.letter_bank[index]
	
