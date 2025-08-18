extends Node

var current_level = 0
var unlocked_levels = [0] # Level 0 = Level 1
var pause_menu = null

var level_1_score = 0


# --- add these ---
var coins: int = 0
var coins_per_level: Array = [0, 0, 0, 0, 0, 0]  # one entry per level
# --- end add ---

func _ready():
	print("Global autoload loaded")
	# Add pause menu
	pause_menu = preload("res://pausemenu.tscn").instantiate()
	add_child(pause_menu)
	pause_menu.visible = false

func _input(event):
	if Input.is_action_just_pressed("pause_game"):
		# Prevent pause in main menu
		if get_tree().current_scene.name != "main_menu":
			if pause_menu.visible:
				resume_game()
			else:
				pause_game()

func pause_game():
	pause_menu.visible = true
	get_tree().paused = true

func resume_game():
	pause_menu.visible = false
	get_tree().paused = false

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
		current_level = level_index
	else:
		print("Invalid level index:", level_index)

func add_coin():
	coins = coins + 1
