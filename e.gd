extends AnimatedSprite2D
@onready var e: AnimatedSprite2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	e.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
