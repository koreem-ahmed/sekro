extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_just_pressed("interact"):
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
