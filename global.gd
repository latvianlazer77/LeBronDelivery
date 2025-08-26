extends Node

signal coins_changed

var current_level: int = 0
var level_1_unlocked: bool = true  # Level 1 is unlocked by default
var level_2_unlocked: bool = false
var level_3_unlocked: bool = false
var level_4_unlocked: bool = false
var level_5_unlocked: bool = false
var level_6_unlocked: bool = false
var pause_menu: CanvasLayer = null

var coins: int = 0
var coins_per_level: Array = [0, 0, 0, 0, 0, 0]

func _ready():
	print("Global autoload loaded")
	load_game()
	pause_menu = preload("res://pausemenu.tscn").instantiate()
	add_child(pause_menu)
	pause_menu.visible = false
	if pause_menu.has_node("ResumeButton"):
		pause_menu.get_node("ResumeButton").pressed.connect(resume_game)
	if pause_menu.has_node("QuitButton"):
		pause_menu.get_node("QuitButton").pressed.connect(_on_quit_pressed)
	if pause_menu.has_node("MainMenuButton"):
		pause_menu.get_node("MainMenuButton").pressed.connect(_on_main_menu_pressed)

func _input(event):
	if Input.is_action_just_pressed("pause_game"):
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

func _on_quit_pressed():
	save_game()
	get_tree().quit()

func _on_main_menu_pressed():
	save_game()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

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
		if (level_index == 0 and level_1_unlocked) or \
		   (level_index == 1 and level_2_unlocked) or \
		   (level_index == 2 and level_3_unlocked) or \
		   (level_index == 3 and level_4_unlocked) or \
		   (level_index == 4 and level_5_unlocked) or \
		   (level_index == 5 and level_6_unlocked):
			get_tree().change_scene_to_file(level_paths[level_index])
			current_level = level_index
			coins = 0
			print("Loaded level ", level_index + 1, " with coins reset to ", coins)
		else:
			print("Level ", level_index + 1, " is locked")
	else:
		print("Invalid level index:", level_index)

func add_coin():
	coins += 1
	emit_signal("coins_changed", coins)
	print("Coins increased to: ", coins)

# ==============================
# SAVE / LOAD SYSTEM
# ==============================
func save_game():
	var save_data = {
		"level_1_unlocked": level_1_unlocked,
		"level_2_unlocked": level_2_unlocked,
		"level_3_unlocked": level_3_unlocked,
		"level_4_unlocked": level_4_unlocked,
		"level_5_unlocked": level_5_unlocked,
		"level_6_unlocked": level_6_unlocked,
		"coins_per_level": coins_per_level,
	}
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
	print("Game saved")

func load_game():
	if FileAccess.file_exists("user://savegame.save"):
		var file = FileAccess.open("user://savegame.save", FileAccess.READ)
		if file:
			var data = file.get_as_text()
			var parsed = JSON.parse_string(data)
			if typeof(parsed) == TYPE_DICTIONARY:
				level_1_unlocked = parsed.get("level_1_unlocked", true)
				level_2_unlocked = parsed.get("level_2_unlocked", false)
				level_3_unlocked = parsed.get("level_3_unlocked", false)
				level_4_unlocked = parsed.get("level_4_unlocked", false)
				level_5_unlocked = parsed.get("level_5_unlocked", false)
				level_6_unlocked = parsed.get("level_6_unlocked", false)
				coins_per_level = parsed.get("coins_per_level", [0, 0, 0, 0, 0, 0])
			file.close()
		print("Game loaded with levels: ", {
			1: level_1_unlocked,
			2: level_2_unlocked,
			3: level_3_unlocked,
			4: level_4_unlocked,
			5: level_5_unlocked,
			6: level_6_unlocked
		})
	else:
		print("No save file found, starting fresh with Level 1 unlocked")
