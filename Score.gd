extends Node2D

func _ready():
	pass # Replace with function body.


func _on_ScoreTimer_timeout():
	get_tree().call_group("World", "score_update")
	$ScoreTimer.start()
