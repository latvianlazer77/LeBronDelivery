extends CharacterBody2D

enum State { IDLE, RUNNING, JUMPING, CROUCHING, FALLING }

@export var input_left: String = "ui_left"
@export var input_right: String = "ui_right"
@export var input_jump: String = "ui_accept"
@export var input_crouch: String = "ui_down"

#controller variables

@export var speed: float = 150.0
@export var jump_velocity: float = -310
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_state: State = State.IDLE
var can_double_jump: bool = false
var has_double_jumped: bool = false

@onready var normal_collision = $Normal
@onready var crouch_collision = $Crouch
@onready var animated_sprite = $AnimatedSprite2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Dialogue"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	handle_input()
	update_movement(delta)
	play_animation()
	move_and_slide()

func handle_input():
	var moving = Input.is_action_pressed(input_left) or Input.is_action_pressed(input_right)
	var crouching = Input.is_action_pressed(input_crouch)
	
	match current_state:
		State.IDLE, State.RUNNING:
			if not is_on_floor():
				current_state = State.FALLING
			elif Input.is_action_just_pressed(input_jump):
				jump()
			elif moving:
				current_state = State.RUNNING
			else:
				current_state = State.IDLE
		State.JUMPING, State.FALLING:
			if Input.is_action_just_pressed(input_jump) and can_double_jump and not has_double_jumped:
				jump()
				has_double_jumped = true
				print("coo")
			elif is_on_floor():
				current_state = State.IDLE if abs(velocity.x) < 10 else State.RUNNING
				can_double_jump = true
				has_double_jumped = false
				
func update_movement(delta):
	var direction = Input.get_axis(input_left, input_right)
	
	match current_state:
		State.IDLE:
			velocity.x = move_toward(velocity.x, 0, speed * 3 * delta)
		State.RUNNING:
			velocity.x = direction * speed
			animated_sprite.flip_h = direction < 0
		State.JUMPING, State.FALLING:
			if direction != 0:
				velocity.x = direction * speed
				animated_sprite.flip_h = direction < 0
		

func play_animation():
	match current_state:
		State.IDLE: animated_sprite.play("idle")
		State.RUNNING: animated_sprite.play("run")
		State.JUMPING: animated_sprite.play("jump")
		State.CROUCHING: animated_sprite.play("crouch")

func jump():
	velocity.y = jump_velocity
	if not has_double_jumped:
		can_double_jump = true
	else:
		can_double_jump = false
	current_state = State.JUMPING
