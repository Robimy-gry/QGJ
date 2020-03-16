extends Area2D

var speed = rand_range(200, 400)
var motion =  Vector2()
var dir = -1

func _ready():
	_preload_textures()

func _physics_process(delta):
	motion.x = speed * delta * dir
	translate(motion)

func _preload_textures():
  var my_textures = [ preload("res://Sprites/Obstacles/bomb2.png"), 
	preload("res://Sprites/Obstacles/bomb.png"), preload("res://Sprites/Obstacles/dynamite.png"), 
	preload("res://Sprites/Obstacles/meat.png"), preload("res://Sprites/Obstacles/pillow.png"),
	 preload("res://Sprites/Obstacles/spike_ball_B1.png"),
	 preload("res://Sprites/Obstacles/spike_ball_B2.png"), 
	preload("res://Sprites/Obstacles/spike_ball_B3.png"), preload("res://Sprites/Obstacles/spike_ball_B4.png"),
	preload("res://Sprites/Obstacles/toilet_bowl.png") ]
  var rand_text_index = int( rand_range(0, my_textures.size() ) )
  $Sprite.texture = my_textures[rand_text_index]


func _on_Obstacle_body_entered(body):
	if body.is_in_group("Player"):
		body._die()
		get_tree().call_group("World", "people_update")
