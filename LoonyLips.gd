extends Node2D

var playerWords = []
var prompt = ['a name', 'a thing', 'a feeling', 'another feeling', 'some things']
var story = 'Once upon a time a %s ate a %s and felt very %s. It was a %s day for all good %s.'

func _ready():
	$Blackboard/TextBox.text = ""
	prompt_player()

func _on_TextBox_text_entered(new_text):
	playerWords.append(new_text)
	$Blackboard/TextBox.text = ""
	prompt_player()


func _on_SubmitTextButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)

func prompt_player():
	if playerWords.size() == prompt.size():
		$Blackboard/StoryText.text = story % playerWords
	else:
		$Blackboard/StoryText.text = ("Can I have " + prompt[playerWords.size()] + ", please?")
