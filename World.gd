extends Node2D

export (PackedScene) var Player

func _ready():
	var rand = RandomNumberGenerator.new()
	for i in range (0, 20):
		var player = Player.instance()
		rand.randomize()
		var x = rand.randf_range(0, 200)
		rand.randomize()
		var y = rand.randf_range(0, 300)
		player.position.y = y
		player.position.x = x
		call_deferred("add_child", player)
