extends Control

func _ready():
	# Directly connect each button to its function
	$LevelButtons/Button1.pressed.connect(_on_button_1_pressed)
	$LevelButtons/Button2.pressed.connect(_on_button_2_pressed)
	$LevelButtons/Button3.pressed.connect(_on_button_3_pressed)
	$LevelButtons/Button4.pressed.connect(_on_button_4_pressed)
	$LevelButtons/Button5.pressed.connect(_on_button_5_pressed)
	$LevelButtons/Button6.pressed.connect(_on_button_6_pressed)

	# Update coin labels for each button
	var level_buttons = [
		$LevelButtons/Button1,
		$LevelButtons/Button2,
		$LevelButtons/Button3,
		$LevelButtons/Button4,
		$LevelButtons/Button5,
		$LevelButtons/Button6,
	]

	for i in range(level_buttons.size()):
		var btn = level_buttons[i]
		btn.disabled = not (i in Global.unlocked_levels)
		btn.modulate = Color(0.5, 0.5, 0.5) if btn.disabled else Color(1, 1, 1)

		var coins_for_btn := 0
		if i < Global.coins_per_level.size():
			coins_for_btn = Global.coins_per_level[i]

		var label_path = "Coins" + str(i + 1)
		if btn.has_node(label_path):
			btn.get_node(label_path).text = "%d / 10" % coins_for_btn

func _on_button_1_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_button_2_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_2.tscn")

func _on_button_3_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_3.tscn")

func _on_button_4_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_4.tscn")

func _on_button_5_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_5.tscn")

func _on_button_6_pressed() -> void:
	Global.coins = 0
	get_tree().change_scene_to_file("res://level_6.tscn")
