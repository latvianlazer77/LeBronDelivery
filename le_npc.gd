extends Node2D

@onready var e: AnimatedSprite2D = $E


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	e.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Dialogue"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue.dialogue"), "start")
		return
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(_area: Area2D) -> void:
	e.visible = true


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	e.visible = true
