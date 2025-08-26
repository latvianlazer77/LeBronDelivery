extends CanvasLayer

@onready var coin_label: Label = $CoinLabel

func _ready():
	Global.connect("coins_changed", Callable(self, "_on_coins_changed"))
	_on_coins_changed(Global.coins) # initialize display

func _on_coins_changed(value: int):
	coin_label.text = str(value) + "/10"
