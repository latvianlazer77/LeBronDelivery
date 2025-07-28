extends CanvasLayer

@onready var coin_label = $CoinLabel

func _process(delta):
	coin_label.text = "LeCoins: %d" % GameState.coins
