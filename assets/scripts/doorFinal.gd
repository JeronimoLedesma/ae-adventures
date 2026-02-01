extends Area2D
@export var timer1: Timer
@export var timer2 : Timer

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.has_key:
		timer1.stop()
		timer2.stop()
		body.gg()
