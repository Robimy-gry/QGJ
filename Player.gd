extends KinematicBody2D


const ACCELERATION = 500
const SPEED = 10
const MAX_SPEED = 200
const FRICTION = 0.1
var motion = Vector2()
var screensize
var player_right = ["p1_right", "p2_right", "p3_right", "p4_right", "p5_right"]
var player_down = ["p1_down", "p2_down", "p3_down", "p4_down", "p5_down"]
var player_number
var is_powerup_enabled = true

func _ready():
	screensize = get_viewport_rect().size
	player_number = (randi() % player_right.size())
	$AnimatedSprite.animation = player_right[player_number]
	add_to_group("Player")

func _physics_process(delta):
	update_movement(delta)
	_powerup()
	position.x = clamp(position.x, 0, screensize.x/2)
	position.y = clamp(position.y, 0, screensize.y)	
	#var axis = get_input_axis()
	#if axis == Vector2.ZERO:
	#	apply_friction(ACCELERATION * delta)
	#else:
	#	apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)
	
#func _process(delta):

		
#func get_input_axis():
#	var axis = Vector2.ZERO
#	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
#	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
#	return axis.normalized()
	
#func apply_friction(amount):
#	if motion.length() > amount:
#		motion -= motion.normalized() * amount
#	else:
#		motion = Vector2.ZERO
		
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	
func update_movement(delta):
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		
	if motion.x != 0:
		$CollisionShape2D.rotation_degrees = 0
		$AnimatedSprite.animation = player_right[player_number]
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = motion.x < 0
		
	if motion.y !=0 and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
		$CollisionShape2D.rotation_degrees = 90
		$AnimatedSprite.animation = player_down[player_number]
		$AnimatedSprite.flip_v = motion.y < 0

func _preload_textures():
  var my_textures = [ preload('res://Sprites/p1.png'), 
	preload('res://Sprites/p2.png'), preload('res://Sprites/p3.png'), 
	preload('res://Sprites/p4.png'), preload('res://Sprites/p5.png') ]
  var rand_text_index = int( rand_range(0, my_textures.size() ) )
  $Sprite.texture = my_textures[rand_text_index]

func _powerup():
	if is_powerup_enabled == true and (Input.is_action_pressed("ui_select")):
		if position.y > screensize.y / 2:
			motion.y += 50
		else:
			motion.y -= 50
		#is_powerup_enabled = false
		
func _die():
	queue_free()
	
