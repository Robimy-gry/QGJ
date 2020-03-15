extends CanvasLayer

func _ready():
	pass
	
func update_GUI(people_count, score):
	$Control/TextureRect/HBoxContainer/ScoreCount.text = "Score: " + str(score)
	$Control/TextureRect/HBoxContainer/HBoxContainer/PeopleCount.text = str(people_count)
