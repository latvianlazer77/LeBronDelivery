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
		btn.disabled = not i in Global.unlocked_levels
		btn.modulate = Color(0.5, 0.5, 0.5) if btn.disabled else Color(1, 1, 1)

		var index := i  # shadow variable for correct capture
		btn.pressed.connect(func(): Global.load_level(index))
