extends Node2D

var playerWords = []
var prompt = ['a name', 'a thing', 'a feeling', 'another feeling', 'some things']
var story = 'Once upon a time a %s ate a %s and felt very %s. It was a %s day for all good %s.'

func _ready():
	$Blackboard/StoryText.text = "Welcome to the game. \nWe're going to tell a story and have a great time.\nCan I have " + prompt[playerWords.size()] + ", please?"
	$Blackboard/TextBox.text = ""

func _on_TextBox_text_entered(new_text):
	playerWords.append(new_text)
	$Blackboard/TextBox.text = ""
	prompt_player()


func _on_SubmitTextButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func prompt_player():
	if is_story_done():
		tell_story()
	else:
		$Blackboard/StoryText.text = ("Can I have " + prompt[playerWords.size()] + ", please?")

func tell_story():
	$Blackboard/StoryText.text = story % playerWords
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
	$Blackboard/SubmitTextButton/ButtonLabel.text = "Retry"

func is_story_done():
	return playerWords.size() == prompt.size()