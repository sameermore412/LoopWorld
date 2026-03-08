extends Label

class_name WordListDisplay

var current_word = ""

func _ready() -> void:
	WordManager.word_used.connect(on_word_used)
	WordManager.word_added.connect(on_word_added)
	WordManager.letter_used.connect(on_letter_added)
	
func on_word_used():
	update_display()

func on_word_added():
	update_display()
		
func on_letter_added(letter: String):
	update_display()
	
func update_display():
	text = ""
	for word in WordManager.words_bank:
		text = text + word+ "\n"
	text = text + "-----------------------" + "\n"
	text = text + WordManager.current_word
	
