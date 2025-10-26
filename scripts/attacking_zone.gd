extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("you died !")
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1_bulding_2.tscn")
