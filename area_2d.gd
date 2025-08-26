extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		var i := Global.current_level

		# Save best coin score for this level
		if i >= 0 and i < Global.coins_per_level.size():
			if Global.coins > Global.coins_per_level[i]:
				Global.coins_per_level[i] = Global.coins

		# Unlock next level
		var next_level = i + 1
		if next_level == 1:
			Global.level_2_unlocked = true
		elif next_level == 2:
			Global.level_3_unlocked = true
		elif next_level == 3:
			Global.level_4_unlocked = true
		elif next_level == 4:
			Global.level_5_unlocked = true
		elif next_level == 5:
			Global.level_6_unlocked = true

		# Save game progress
		Global.save_game()

		# Return to level select
		get_tree().change_scene_to_file("res://level_select.tscn")
