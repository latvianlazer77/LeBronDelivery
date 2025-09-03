extends CanvasLayer

@onready var options: Panel = $optionspanel
@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var music_selector: OptionButton = $optionspanel/MusicPanel/OptionButton
@onready var resume_button: Button = $mainbuttons/resume
@onready var back: Button = $optionspanel/Back
@onready var option: Button = $mainbuttons/options
@onready var quit: Button = $mainbuttons/quit

func _ready():
	visible = false
	mainbuttons.visible = true
	options.visible = false
	set_process_input(true)
	set_process_unhandled_input(true)  # Ensure unhandled input is processed
	print("Pause menu ready, visible: ", visible, ", process_input: ", is_processing_input(), ", unhandled_input: ", is_processing_unhandled_input(), ", scene: ", get_tree().current_scene.name if get_tree().current_scene else "None")

	# Verify and connect signals with error checking
	if resume_button and resume_button.is_inside_tree():
		resume_button.pressed.connect(_on_resume_pressed)
		print("Resume button connected, disabled: ", resume_button.disabled)
	else:
		print("Error: resume_button not found or not in tree")
	if option and option.is_inside_tree():
		option.pressed.connect(_on_options_pressed)
		print("Options button connected, disabled: ", option.disabled)
	else:
		print("Error: option button not found or not in tree")
	if quit and quit.is_inside_tree():
		quit.pressed.connect(_on_quit_pressed)
		print("Quit button connected, disabled: ", quit.disabled)
	else:
		print("Error: quit button not found or not in tree")
	if back and back.is_inside_tree():
		back.pressed.connect(_on_back_pressed)
		print("Back button connected, disabled: ", back.disabled)
	else:
		print("Error: back button not found or not in tree")
	if music_selector and music_selector.is_inside_tree():
		music_selector.item_selected.connect(_on_music_selected)
		print("Music selector connected")
	else:
		print("Error: music_selector not found or not in tree")

func _input(event):
	print("Input event: ", event.as_text() if event else "None", ", is_action_just_pressed: ", Input.is_action_just_pressed("pause_game"), ", paused: ", get_tree().paused)
	if event and Input.is_action_just_pressed("pause_game"):
		var current_scene_name = get_tree().current_scene.name if get_tree().current_scene else "Unknown"
		print("Pause input detected, scene: ", current_scene_name, ", visible: ", visible, ", paused: ", get_tree().paused)
		if current_scene_name != "main_menu":
			visible = not visible
			mainbuttons.visible = visible
			options.visible = false
			get_tree().paused = visible
			set_process_input(true)  # Ensure input continues
			set_process_unhandled_input(true)  # Ensure unhandled input continues
			print("Toggled - visibility: ", visible, ", mainbuttons: ", mainbuttons.visible, ", options: ", options.visible, ", paused: ", get_tree().paused)

func _unhandled_input(event):
	print("Unhandled input event: ", event.as_text() if event else "None", ", is_action_just_pressed: ", Input.is_action_just_pressed("pause_game"))
	if Input.is_action_just_pressed("pause_game"):
		_input(event)  # Fallback to _input for consistency

func _on_music_selected(index):
	if Music != null:
		var name = music_selector.get_item_text(index)
		Music.play_song(name)
	else:
		print("Music autoload is not available")

func _on_resume_pressed():
	print("Resume button pressed")
	visible = false
	get_tree().paused = false

func _on_options_pressed():
	print("Options button pressed")
	mainbuttons.visible = false
	options.visible = true

func _on_quit_pressed():
	print("Quit button pressed")
	visible = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_pressed():
	print("Back button pressed")
	options.visible = false
	mainbuttons.visible = true
