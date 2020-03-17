extends Node2D

export (PackedScene) var Player


func _ready():
    add_to_group("World")
    global._score = 0
    global.level = 0
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
        global.people_count += 1
        update_GUI()
        
func update_GUI():
    get_tree().call_group("GUI", "update_GUI", global.people_count, global._score)
    
func score_update():
    global._score += (global.people_count + (10 * global.level))
    update_GUI()
    
func score_bonus():
    global._score += global.people_count
    
func level_change():
    global.level += 1
    update_GUI()
    
func people_update():
    global.people_count -= 1
    update_GUI()
    if global.people_count < 1:
        end_game()

func star_visible():
    get_tree().call_group("GUI", "star_visible")

func end_game():
    get_tree().change_scene("res://GameOver.tscn")
    

