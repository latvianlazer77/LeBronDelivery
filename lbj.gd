extends VideoStreamPlayer


func _on_finished() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
