extends Node



var current_level = 0
var unlocked_levels = []
var pause_menu = null

func _ready():
	print("Global autoload loaded")
	pause_menu = preload("res://pausemenu.tscn").instantiate()  # Line 4
	add_child(pause_menu)
	pause_menu.visible = false

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		if pause_menu.visible:
			resume_game()
		else:
			pause_game()

func pause_game():
	pause_menu.visible = true
	get_tree().call_group("game_objects", "set_process", false)
	get_tree().call_group("game_objects", "set_physics_process", false)

func resume_game():
	pause_menu.visible = false
	get_tree().call_group("game_objects", "set_process", true)
	get_tree().call_group("game_objects", "set_physics_process", true)
	
	
func level_completed():
	current_level += 1
	if current_level not in unlocked_levels:
		unlocked_levels.append(current_level)
	
