extends CanvasLayer

@onready var options: Panel = $optionspanel
@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var music_selector: OptionButton = $optionspanel/MusicPanel/OptionButton
@onready var resume_button: Button = $mainbuttons/resume
@onready var back: Button = $optionspanel/Back
@onready var option: Button = $mainbuttons/options
@onready var quit: Button = $mainbuttons/quit

func _ready():
	mainbuttons.visible = true
	options.visible = false

	resume_button.pressed.connect(_on_resume_pressed)
	option.pressed.connect(_on_options_pressed)
	quit.pressed.connect(_on_quit_pressed)
	back.pressed.connect(_on_back_pressed)
	music_selector.item_selected.connect(_on_music_selected)

func _on_music_selected(index):
	if Music != null:
		var name = music_selector.get_item_text(index)
		Music.play_song(name)
	else:
		print("Music autoload is not available")

func _on_resume_pressed():
	Global.resume_game()

func _on_options_pressed():
	mainbuttons.visible = false
	options.visible = true

func _on_quit_pressed():
	visible = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_pressed():
	options.visible = false
	mainbuttons.visible = true
