extends Node2D

func _ready():
	var prompt = ['Mick', 'pizza', 'full']
	var story = 'Once upon a time a %s ate a %s and felt very %s'
	# $Blackboard/StoryText.text = story % prompt
	# get_node("Blackboard/StoryText").text = story % prompt
	$Blackboard/StoryText.bbcode_text = story % prompt
