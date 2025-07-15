extends Control
@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var music_selector = $options/MusicPanel/OptionButton
@onready var resume_button = $mainbuttons/start
@onready var options_button = $mainbuttons/options
@onready var quit_button = $mainbuttons/quit
@onready var back_button = $options/Back
@onready var options_panel = $options
@onready var options: Panel = $options
func _ready():
	mainbuttons.visible = true  # Hide pause menu at start
	options.visible = false
	

	music_selector.connect("item_selected", Callable(self, "_on_music_selected"))
	resume_button.connect("pressed", Callable(self, "_on_resume_pressed"))
	options_button.connect("pressed", Callable(self, "_on_options_pressed"))
	quit_button.connect("pressed", Callable(self, "_on_quit_pressed"))
	back_button.connect("pressed", Callable(self, "_on_back_pressed"))


func _on_music_selected(index):
	var name = music_selector.get_item_text(index)
	Music.play_song(name)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_select.tscn")

func _on_options_pressed():
	mainbuttons.visible = false
	options.visible = true

func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	options.visible = false
	mainbuttons.visible = true
