extends Node

var current_word = ""
var word_list = []
var words_bank: Array[String] = []
var letter_bank: Array[String] = []
var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

signal word_used
signal word_added
signal letter_used(letter: String)
signal letter_returned(letter: String)
signal letter_bank_rotated()

func _ready() -> void:
	print("READY...")
	
	var file = FileAccess.open("res://assets/wordlist_filtered.txt", FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		word_list.append(line)
	file.close()
	if len(word_list) == 0:
		print("WORD LIST IS EMPTY")
	print("WORDS " + str(len(word_list)))
	populate_letter_bank()

func  _input(event: InputEvent) -> void:
	if event.is_action_pressed("RotateLetters"):
		populate_letter_bank()
		letter_bank_rotated.emit()
		return
		
	if event.is_action_pressed("AddWord"):	
		add_to_word_bank(current_word)
		current_word = ""
		word_added.emit()
		return
		
	if event.is_action_pressed("Backspace") && current_word.length() > 0:
		var last_letter = current_word.right(1)
		current_word = current_word.substr(0, current_word.length() - 1)
		letter_bank[letter_bank.find("-")] = last_letter
		letter_used.emit("")
		return
		
	for letter in letters:
		if event.is_action_pressed(letter):
			if letter in letter_bank:
				letter_bank[letter_bank.find(letter)] = "-"
				current_word = current_word + letter
				letter_used.emit(letter)
		
func add_to_word_bank(word: String): 
	if len(word.strip_edges(true,true)) == 0:
		return
	
	if word.to_lower() in word_list:
		words_bank.append(word)

func pop_word_from_bank() -> String:
	if (len(words_bank) > 0):
		var word = words_bank.pop_front()
		word_used.emit()
		return word	
	else:
		return ""
		

func get_current_word() -> String:
	return current_word
	
func is_current_word_in_list() -> bool:
	return current_word in word_list

func clear_current_word():
	current_word = ""
	
func populate_letter_bank():
		letter_bank.clear()
		for index in 14:
			var random_index = randi() % letters.size()
			letter_bank.append(letters[random_index])
