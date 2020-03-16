extends Node2D

export (PackedScene) var Player

var max_people = 20
var people_count = 0
var _score = 0
var level = 0

func _ready():
	add_to_group("World")
	update_GUI()
	var rand = RandomNumberGenerator.new()
	for i in range (0, 20):
		var player = Player.instance()
		rand.randomize()
		var x = rand.randf_range(10, 200)
		rand.randomize()
		var y = rand.randf_range(100, 300)
		player.position.y = y
		player.position.x = x
		call_deferred("add_child", player)
		people_count += 1
		update_GUI()
		
func update_GUI():
	get_tree().call_group("GUI", "update_GUI", people_count, _score)
	
func score_update():
	_score += people_count
	update_GUI()
	
func score_bonus():
	_score += people_count
	
func people_update():
	people_count -= 1
	update_GUI()

func star_visible():
	get_tree().call_group("GUI", "star_visible")
	

