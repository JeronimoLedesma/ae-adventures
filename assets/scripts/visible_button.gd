extends Button

@onready var toggle: bool = false
@export var toggled_button: Texture2D
@export var untoggled_button: Texture2D

func _ready() -> void:
	self.button_down.connect(_on_button_down)

func _on_button_down() -> void:
	toggle = !toggle
	if  toggle:
		self.icon = toggled_button
	else:
		self.icon = untoggled_button
