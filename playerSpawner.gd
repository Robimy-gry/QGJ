extends Position2D

export (PackedScene) var spawnScene
onready var spawnReference = load (spawnScene.get_path())
var rand = RandomNumberGenerator.new()

func _ready():
    var playerScene = load("res://Player.gd")
    var rand = RandomNumberGenerator.new()
    for i in range (0, 20):
        var spawnInstance = spawnReference.instance()
        rand.randomize()
        var x = rand.randf_range(0, 360)
        rand.randomize()
        var y = rand.randf_range(0, 550)
        spawnInstance.position.y = y
        spawnInstance.position.x = x
        get_parent().add_child(spawnInstance)
