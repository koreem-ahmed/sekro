extends Node2D

@onready var bg_m: AudioStreamPlayer2D = $"sound/bg-m"


func _ready() -> void:
	bg_m.play()
