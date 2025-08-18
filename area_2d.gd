extends Area2D

func _on_body_entered(body):
	if Global.coins > Global.level_1_score:
		Global.level_1_score = Global.coins
	else:
		pass
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://level_select.tscn")
