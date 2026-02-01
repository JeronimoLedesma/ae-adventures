extends Button
signal close_slow()

func _ready() -> void:
	self.button_down.connect(_on_close)

func _on_close():
	emit_signal("close_slow")
	get_parent().queue_free()
