extends Area2D

@onready var timer: Timer = $Timer
@onready var door: AudioStreamPlayer2D = $"../../door"

func _on_body_entered(body: Node2D) -> void:
	door.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1_building_1.tscn")
