extends Node2D

var playerWords = []

var import_text
var current_story

func _ready():
	import_text = get_from_json("other_strings.json")
	set_random_story()
	$Blackboard/StoryText.text = import_text.intro_text
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
		$Blackboard/StoryText.text = import_text.prompt % current_story.prompt[playerWords.size()]

func tell_story():
	$Blackboard/StoryText.text = current_story.story % playerWords
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
	$Blackboard/SubmitTextButton/ButtonLabel.text = import_text.retry

func is_story_done():
	return playerWords.size() == current_story.prompt.size()

func set_random_story():
	var stories = get_from_json("stories.json")
	randomize()
	current_story = stories[randi() % stories.size()]

func get_from_json(filename):
	var file = File.new()
	# TODO: Add error validation for missing file
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data