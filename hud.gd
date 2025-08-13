extends CanvasLayer

@onready var coin_label = $CoinLabel

func _ready():
	Global.connect("coins_changed", _on_coins_changed)
	_on_coins_changed(Global.coins)

func _on_coins_changed(new_amount):
	coin_label.text = str(new_amount) + " / 10"
