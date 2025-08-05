extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":  # Adjust if your player has a different name
		Global.coins_collected += 1
		Global.update_coin_label()
		print(Global.coins_collected)
		queue_free()
