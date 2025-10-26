extends Node2D

@onready var button: AudioStreamPlayer2D = $sound/button
@onready var backgound_music: AudioStreamPlayer2D = $"sound/backgound music"

func _on_ready() -> void:
	backgound_music.play()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	button.play()

func _on_quit_pressed() -> void:
	get_tree().quit()
	button.play()
