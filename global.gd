extends Node


var current_level = 0
var unlocked_levels = [0]  # Level 0 = Level 1
var pause_menu = null

func _ready():
	print("Global autoload loaded")
	pause_menu = preload("res://pausemenu.tscn").instantiate()  # Line 4
	add_child(pause_menu)
	pause_menu.visible = false

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_TAB:
		if get_tree().current_scene.name != "main_menu":
			if pause_menu.visible:
				resume_game()
			else:
				pause_game()
	if event is InputEventKey and event.pressed and event.keycode == KEY_TAB:
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
	
	
func load_level(level_index: int):
	var level_paths = [
		"res://level_1.tscn",
		"res://level_2.tscn",
		"res://level_3.tscn",
		"res://level_4.tscn",
		"res://level_5.tscn",
		"res://level_6.tscn",
	]

	if level_index >= 0 and level_index < level_paths.size():
		get_tree().change_scene_to_file(level_paths[level_index])
		current_level = level_index  # Optional: Track current level
	else:
		print("Invalid level index: ", level_index)
	
	
	
	
