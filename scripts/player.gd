extends CharacterBody2D

@onready var player: AnimatedSprite2D = $"player-animation"
const SPEED = 140.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		player.play("jump")


	var direction := Input.get_axis("move left", "move right")
	if direction:
		velocity.x = direction * SPEED
		player.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		player.play("idle")

	move_and_slide()
