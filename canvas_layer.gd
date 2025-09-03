extends CanvasLayer

var paused = false

@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var resume: Button = $mainbuttons/resume
@onready var options: Button = $mainbuttons/options
@onready var quit: Button = $mainbuttons/quit
@onready var optionspanel: Panel = $optionspanel
@onready var back: Button = $optionspanel/Back
@onready var music_panel: Panel = $optionspanel/MusicPanel

func _ready():
	mainbuttons.visible = true
	optionspanel.visible = false
	visible = false  # Start hidden
func _input(event):
	if event and Input.is_action_just_pressed("pause_game"):
		if not paused:
			visible = true
			paused = true
		else:
			visible = false
			paused = false

func _on_resume_pressed() -> void:
	visible = false

func _on_options_pressed() -> void:
	optionspanel.visible = true
	mainbuttons.visible = false

func _on_back_pressed() -> void:
	optionspanel.visible = false
	mainbuttons.visible = true

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
