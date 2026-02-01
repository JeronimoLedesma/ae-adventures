extends Control
signal close_slow()

func _on_button_button_down() -> void:
	emit_signal("close_slow")
	self.queue_free()
