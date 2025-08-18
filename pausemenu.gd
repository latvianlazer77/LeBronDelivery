extends CanvasLayer

@onready var options: Panel = $optionspanel
@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var music_selector: OptionButton = $options/MusicPanel/OptionButton
@onready var resume_button: Button = $mainbuttons/resume
@onready var back: Button = $options/Back
@onready var option: Button = $mainbuttons/options
@onready var quit: Button = $mainbuttons/quit

func _ready():
	mainbuttons.visible = true
	options.visible = false

	# Debug: check music autoload
	print("Music autoload: ", Music)

	# Button connections

func _on_music_selected(index):
	if Music != null:
		var name = music_selector.get_item_text(index)
		Music.play_song(name)
	else:
		print("Music autoload is not available")

func _on_resume_pressed():
	print("the resume button has been pressed")
	Global.resume_game()

func _on_options_pressed() -> void:
	mainbuttons.visible = false
	options.visible = true

func _on_quit_pressed() -> void:
	visible = false
	get_tree().paused = false # Make sure game isn't stuck paused
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_pressed() -> void:
	options.visible = false
	mainbuttons.visible = true


func _on_music_control_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_resume_toggled(toggled_on: bool) -> void:
	print("the resume button has been pressed")
	Global.resume_game()
