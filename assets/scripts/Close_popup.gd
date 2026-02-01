extends Button

func _ready() -> void:
	self.button_down.connect(_on_close)

func _on_close():
	get_parent().queue_free()
