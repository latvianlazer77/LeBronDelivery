extends CanvasLayer
@onready var options: Panel = $optionspanel
@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var music_selector = $options/MusicPanel/OptionButton
@onready var resume_button = $mainbuttons/resume
@onready var back: Button = $options/Back
@onready var option: Button = $mainbuttons/options
@onready var quit: Button = $mainbuttons/quit

func _ready():
	mainbuttons.visible = true
	options.visible = false
	print("Music autoload: ", Music)  # Debug
	resume_button.connect("pressed", Callable(self, "_on_resume_pressed"))


func _on_music_selected(index):
	if Music != null:
		var name = music_selector.get_item_text(index)
		Music.play_song(name)
	else:
		print("Music autoload is not available")

func _on_resume_pressed():
	get_node("/root/Global").resume_game()


func _on_options_pressed() -> void:
	mainbuttons.visible = false
	options.visible = true
	



func _on_quit_pressed() -> void:
	visible = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_back_pressed() -> void:
	options.visible = false
	mainbuttons.visible = true
