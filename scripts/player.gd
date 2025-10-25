extends CharacterBody2D

@onready var att_col: CollisionShape2D = $Area2D/CollisionShape2D
@onready var player: AnimatedSprite2D = $"player-animation"
const SPEED = 140.0
const JUMP_VELOCITY = -200.0
var is_attacking = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_attacking == false:
		velocity.y = JUMP_VELOCITY
		player.play("jump")


	var direction := Input.get_axis("move left", "move right")
	if direction && is_attacking == false:
		velocity.x = direction * SPEED
		player.play("run")
	else:
		if is_attacking == false:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			player.play("idle")
	
	if Input.is_action_just_pressed("attack"):
		player.play("attack")
		att_col.disabled = false
		is_attacking = true
	
	
	
	move_and_slide()


func _on_playeranimation_animation_finished() -> void:
	if player.animation == "attack":
		att_col.disabled = true
		is_attacking = false
