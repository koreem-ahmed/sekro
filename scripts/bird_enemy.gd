extends Node2D

var dead = false

@onready var anim_sp: AnimatedSprite2D = $AnimatedSprite2D
@onready var right: RayCast2D = $right
@onready var left: RayCast2D = $left
@onready var right_d: RayCast2D = $"right-d"
@onready var left_d: RayCast2D = $"left-d"

const SPEED = 100
var direction = 1

func _process(delta: float) -> void:
	position.x += SPEED * delta * direction
	if !right_d.is_colliding():
		direction = -1
		anim_sp.flip_h = true
	elif !left_d.is_colliding():
		direction = 1
		anim_sp.flip_h = false
