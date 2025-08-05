extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		var level = Global.current_level
		var coins = Global.coins_collected
		if coins > Global.coins_per_level[level]:
			Global.coins_per_level[level] = coins  # Save high score
		Global.unlocked_levels.append(level + 1)  # Unlock next level if needed
		Global.unlocked_levels.append(level + 1)
		Global.unlocked_levels = Global.unlocked_levels.duplicate()
		Global.unlocked_levels = Global.unlocked_levels.filter(func(x, i): return Global.unlocked_levels.find(x) == i)
		print("Delivered ", coins, " coins!")
		# Return to level select
		get_tree().change_scene_to_file("res://level_select.tscn")
