extends Area2D

@onready var timer: Timer = $Timer
@onready var die: AudioStreamPlayer2D = $die

func _on_body_entered(body: Node2D) -> void:
	print("you died !")
	body.get_node("player_ani").play("attack")
	die.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
