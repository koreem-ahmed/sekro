extends Area2D

var dead = false
var is_attacking = false

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var right_d: RayCast2D = $right_d
@onready var left_d: RayCast2D = $left_d
@onready var kill_zone_2: Area2D = $"kill zone2"
@onready var coll_att: CollisionShape2D = $"kill zone2/CollisionShape2D"
@onready var bone: AudioStreamPlayer2D = $bone


const SPEED = 60
var direction = 1

func _process(delta: float) -> void:
	if dead == false:
		if is_attacking == false :
			position.x += SPEED * delta * direction
		
		if !right_d.is_colliding():
			direction = -1
			animated.flip_h = true
			kill_zone_2.position.x = -30
		
		elif !left_d.is_colliding():
			direction = 1
			animated.flip_h = false
			kill_zone_2.position.x = 30

		
		if left.is_colliding():
			coll_att.disabled = false
			animated.play("attack 2")
			
		elif right.is_colliding():
			coll_att.disabled = false
			animated.play("attack 2")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("attack"):
		dead = true
		bone.play()
		animated.play("die")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated.animation == "die" :
		queue_free()
	
	if animated.animation == "attack1":
		coll_att.disabled = true
		is_attacking = false
		animated.play("walk")
