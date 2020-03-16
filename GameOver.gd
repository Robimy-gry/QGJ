extends Control

var hs = global._score

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = "Your score: " + str(hs)
	
func _on_Button_pressed():
	get_tree().change_scene("res://World.tscn")
