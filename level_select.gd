extends Control

func _ready():
	$LevelButtons/Button1.pressed.connect(_on_button_1_pressed)
	$LevelButtons/Button2.pressed.connect(_on_button_2_pressed)
	$LevelButtons/Button3.pressed.connect(_on_button_3_pressed)
	$LevelButtons/Button4.pressed.connect(_on_button_4_pressed)
	$LevelButtons/Button5.pressed.connect(_on_button_5_pressed)
	$LevelButtons/Button6.pressed.connect(_on_button_6_pressed)
	Global.connect("coins_changed", Callable(self, "_on_coins_changed"))
	update_level_buttons()

func update_level_buttons():
	var level_buttons = [
		$LevelButtons/Button1,
		$LevelButtons/Button2,
		$LevelButtons/Button3,
		$LevelButtons/Button4,
		$LevelButtons/Button5,
		$LevelButtons/Button6,
	]
	var unlock_vars = [
		Global.level_1_unlocked,
		Global.level_2_unlocked,
		Global.level_3_unlocked,
		Global.level_4_unlocked,
		Global.level_5_unlocked,
		Global.level_6_unlocked,
	]

	for i in range(level_buttons.size()):
		var btn = level_buttons[i]
		btn.disabled = not unlock_vars[i]
		btn.modulate = Color(0.5, 0.5, 0.5) if btn.disabled else Color(1, 1, 1)
		var label_path = "Coins" + str(i + 1)
		if btn.has_node(label_path):
			var coins_for_btn = 0
			if i < Global.coins_per_level.size():
				coins_for_btn = Global.coins_per_level[i]
			btn.get_node(label_path).text = "%d/10" % coins_for_btn

func _on_coins_changed(new_coins):
	update_level_buttons()

func _on_button_1_pressed():
	Global.coins = 0
	Global.load_level(0)

func _on_button_2_pressed():
	Global.coins = 0
	Global.load_level(1)

func _on_button_3_pressed():
	Global.coins = 0
	Global.load_level(2)

func _on_button_4_pressed():
	Global.coins = 0
	Global.load_level(3)

func _on_button_5_pressed():
	Global.coins = 0
	Global.load_level(4)

func _on_button_6_pressed():
	Global.coins = 0
	Global.load_level(5)
