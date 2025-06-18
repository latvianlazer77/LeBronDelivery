extends Control


@onready var main_buttons: VBoxContainer = $"main buttons"
@onready var options: Panel = $options


func _ready():
	main_buttons.visible = true
	options.visible = false
	



	



func _on_options_pressed() -> void:
	main_buttons.visible = false
	options.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scene.tscn")



	


func _on_back_pressed() -> void:
	main_buttons.visible = true
	options.visible = false
	
