extends Node

var coins: int = 0
var unlocked_levels = [0] # Only Level 1 unlocked at start
var current_level: int = -1

signal coins_changed(new_amount)

func load_level(index: int):
	if index in unlocked_levels:
		current_level = index
		coins = 0
		emit_signal("coins_changed", coins)
		var path = "res://level_%d.tscn" % (index + 1)
		if ResourceLoader.exists(path):
			get_tree().change_scene_to_file(path)
		else:
			print("Level scene not found:", path)
	else:
		print("Level is locked:", index + 1)

func add_coin(amount: int = 1):
	coins += amount
	emit_signal("coins_changed", coins)

func finish_level():
	print("Level", current_level + 1, "finished!")
	if current_level + 1 not in unlocked_levels:
		unlocked_levels.append(current_level + 1)

	coins = 0
	emit_signal("coins_changed", coins)

	# Change back to level select
	get_tree().change_scene_to_file("res://level_select.tscn")
