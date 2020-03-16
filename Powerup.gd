extends Area2D

var SPEED = 250
var motion =  Vector2()
var dir = -1

func _physics_process(delta):
	motion.x = SPEED * delta * dir
	translate(motion)
	
func _on_Powerup_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().call_group("Player", "_powerup_ready")
		queue_free()
