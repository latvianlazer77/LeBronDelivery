extends Node2D

@onready var e: AnimatedSprite2D = $E
@onready var actionable_finder: Area2D = $"Main Scene/Player/Direction/ActionableFinder"




# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	e.visible = true
	print("testing")
