extends ProgressBar



func _on_timer_timeout() -> void:
	value += 0.05
	if value >= max_value:
		get_tree().reload_current_scene()
