extends Area2D

@export var coin_value := 1
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound

func _on_body_entered(body):
	if body.name == "Player":
		GameState.coins += coin_value
		pickup_sound.play()
		queue_free()
