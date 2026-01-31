extends Button

@export var toggle: bool = false
@export var toggled_button: Texture2D
@export var untoggled_button: Texture2D

func _ready() -> void:
	self.button_down.connect(_on_button_down)
	set_icon()

func _on_button_down() -> void:
	toggle = !toggle
	set_icon()
	

func set_icon() -> void:
	if  toggle:
		self.icon = toggled_button
	else:
		self.icon = untoggled_button
