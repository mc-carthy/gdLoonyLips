extends Node2D

func _ready():
	var prompt = ['Mick', 'pizza', 'full']
	var story = 'Once upon a time a %s ate a %s and felt very %s'
	# $Blackboard/StoryText.text = story % prompt
	# get_node("Blackboard/StoryText").text = story % prompt
	$Blackboard/StoryText.text = story % prompt


func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/TextBox.text = ""


func _on_SubmitTextButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)
