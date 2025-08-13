extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.add_coin()
		queue_free() # remove coin
