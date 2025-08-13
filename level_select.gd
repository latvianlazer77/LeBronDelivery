extends Control

func _ready():
	# Directly connect each button to its function
	$LevelButtons/Button1.pressed.connect(_on_button_1_pressed)
	$LevelButtons/Button2.pressed.connect(_on_button_2_pressed)
	$LevelButtons/Button3.pressed.connect(_on_button_3_pressed)
	$LevelButtons/Button4.pressed.connect(_on_button_4_pressed)
	$LevelButtons/Button5.pressed.connect(_on_button_5_pressed)
	$LevelButtons/Button6.pressed.connect(_on_button_6_pressed)

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
