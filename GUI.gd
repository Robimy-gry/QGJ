extends CanvasLayer

func _ready():
	$Control/TextureRect/HBoxContainer/HBoxContainer/Powerup.visible = false
	
	
func update_GUI(people_count, score):
	$Control/TextureRect/HBoxContainer/ScoreCount.text = "Score: " + str(score)
	$Control/TextureRect/HBoxContainer/HBoxContainer/PeopleCount.text = str(people_count)
	
func star_visible():
	$Control/TextureRect/HBoxContainer/HBoxContainer/Powerup.visible = true

func star_invisible():
	$Control/TextureRect/HBoxContainer/HBoxContainer/Powerup.visible = false

