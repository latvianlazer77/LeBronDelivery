extends Control

func _ready():
	var level_buttons = [
		$LevelButtons/Button1,
		$LevelButtons/Button2,
		$LevelButtons/Button3,
		$LevelButtons/Button4,
		$LevelButtons/Button5,
		$LevelButtons/Button6,
	]

	for i in range(level_buttons.size()):
		var btn = level_buttons[i]
		var coins = Global.coins_per_level[i] if i < Global.coins_per_level.size() else 0

		btn.disabled = not i in Global.unlocked_levels
		btn.modulate = Color(0.5, 0.5, 0.5) if btn.disabled else Color(1, 1, 1)

		var index := i
		btn.pressed.connect(func(): Global.load_level(index))

		# 🔥 Get the coin label as a child of the button
		var label = btn.get_node("Coins" + str(i + 1))
		if label:
			label.text = str(coins) + " / 10"
