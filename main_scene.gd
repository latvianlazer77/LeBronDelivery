extends Node2D
@onready var e: AnimatedSprite2D = $LeNPC/E
@export var pushe: String = "Dialogue"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.coins = 0
	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	e.visible = true
	
	


	


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	e.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	e.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	e.visible = false
	
	
	
func remove():
	if Input.is_action_just_pressed(pushe):
		e.visible = false
	
