extends Node2D

@export var button_visible: Button
@export var button_mask: Button
@export var button_invert: Button
@export var visible_full: bool
@export var masked: bool
@export var invert : bool
@export var full: Sprite2D
@export var mask: Sprite2D
@export var inverted: Sprite2D
@export var full_collision: CollisionShape2D
@export var mask_collision: CollisionPolygon2D
@export var inverted_collision: CollisionPolygon2D

func _ready() -> void:
	button_visible.button_down.connect(_on_button_visible_button_down)
	button_mask.button_down.connect(_on_button_mask_button_down)
	button_invert.button_down.connect(_on_button_invert_button_down)
	
func _process(delta: float) -> void:
	if !visible_full:
		full.visible = false
		mask.visible = false
		inverted.visible = false
		full_collision.disabled = true
		mask_collision.disabled = true
		inverted_collision.disabled = true
	elif !masked:
		full.visible = true
		mask.visible = false
		inverted.visible = false
		full_collision.disabled = false
		mask_collision.disabled = true
		inverted_collision.disabled = true
	elif !invert:
		full.visible = false
		mask.visible = true
		inverted.visible = false
		full_collision.disabled = true
		mask_collision.disabled = false
		inverted_collision.disabled = true
	else:
		full.visible = false
		mask.visible = false
		inverted.visible = true
		full_collision.disabled = true
		mask_collision.disabled = true
		inverted_collision.disabled = false

func _on_button_visible_button_down() -> void:
	visible_full = !visible_full


func _on_button_mask_button_down() -> void:
	masked = !masked


func _on_button_invert_button_down() -> void:
	invert = !invert
