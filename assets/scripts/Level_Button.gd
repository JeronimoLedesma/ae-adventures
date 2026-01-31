extends Button

@export var level: int
@export var lock: Button
@export var scene: PackedScene

func _ready() -> void:
	self.button_down.connect(_on_pressed)
	if unlocked():
		lock.visible = false

func unlocked() -> bool:
	return level <= Singleton.levels_completed

func _on_pressed():
	if unlocked():
		get_tree().change_scene_to_packed(scene)
